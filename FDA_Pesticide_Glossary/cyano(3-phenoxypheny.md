---
output:
  html_document:
    self_contained: no
---

```r
library(knitr)
knit_hooks$set(webgl = hook_webgl)
cat('<script type="text/javascript">', readLines(system.file('WebGL', 'CanvasMatrix.js', package = 'rgl')), '</script>', sep = '\n')
```

<script type="text/javascript">
CanvasMatrix4=function(m){if(typeof m=='object'){if("length"in m&&m.length>=16){this.load(m[0],m[1],m[2],m[3],m[4],m[5],m[6],m[7],m[8],m[9],m[10],m[11],m[12],m[13],m[14],m[15]);return}else if(m instanceof CanvasMatrix4){this.load(m);return}}this.makeIdentity()};CanvasMatrix4.prototype.load=function(){if(arguments.length==1&&typeof arguments[0]=='object'){var matrix=arguments[0];if("length"in matrix&&matrix.length==16){this.m11=matrix[0];this.m12=matrix[1];this.m13=matrix[2];this.m14=matrix[3];this.m21=matrix[4];this.m22=matrix[5];this.m23=matrix[6];this.m24=matrix[7];this.m31=matrix[8];this.m32=matrix[9];this.m33=matrix[10];this.m34=matrix[11];this.m41=matrix[12];this.m42=matrix[13];this.m43=matrix[14];this.m44=matrix[15];return}if(arguments[0]instanceof CanvasMatrix4){this.m11=matrix.m11;this.m12=matrix.m12;this.m13=matrix.m13;this.m14=matrix.m14;this.m21=matrix.m21;this.m22=matrix.m22;this.m23=matrix.m23;this.m24=matrix.m24;this.m31=matrix.m31;this.m32=matrix.m32;this.m33=matrix.m33;this.m34=matrix.m34;this.m41=matrix.m41;this.m42=matrix.m42;this.m43=matrix.m43;this.m44=matrix.m44;return}}this.makeIdentity()};CanvasMatrix4.prototype.getAsArray=function(){return[this.m11,this.m12,this.m13,this.m14,this.m21,this.m22,this.m23,this.m24,this.m31,this.m32,this.m33,this.m34,this.m41,this.m42,this.m43,this.m44]};CanvasMatrix4.prototype.getAsWebGLFloatArray=function(){return new WebGLFloatArray(this.getAsArray())};CanvasMatrix4.prototype.makeIdentity=function(){this.m11=1;this.m12=0;this.m13=0;this.m14=0;this.m21=0;this.m22=1;this.m23=0;this.m24=0;this.m31=0;this.m32=0;this.m33=1;this.m34=0;this.m41=0;this.m42=0;this.m43=0;this.m44=1};CanvasMatrix4.prototype.transpose=function(){var tmp=this.m12;this.m12=this.m21;this.m21=tmp;tmp=this.m13;this.m13=this.m31;this.m31=tmp;tmp=this.m14;this.m14=this.m41;this.m41=tmp;tmp=this.m23;this.m23=this.m32;this.m32=tmp;tmp=this.m24;this.m24=this.m42;this.m42=tmp;tmp=this.m34;this.m34=this.m43;this.m43=tmp};CanvasMatrix4.prototype.invert=function(){var det=this._determinant4x4();if(Math.abs(det)<1e-8)return null;this._makeAdjoint();this.m11/=det;this.m12/=det;this.m13/=det;this.m14/=det;this.m21/=det;this.m22/=det;this.m23/=det;this.m24/=det;this.m31/=det;this.m32/=det;this.m33/=det;this.m34/=det;this.m41/=det;this.m42/=det;this.m43/=det;this.m44/=det};CanvasMatrix4.prototype.translate=function(x,y,z){if(x==undefined)x=0;if(y==undefined)y=0;if(z==undefined)z=0;var matrix=new CanvasMatrix4();matrix.m41=x;matrix.m42=y;matrix.m43=z;this.multRight(matrix)};CanvasMatrix4.prototype.scale=function(x,y,z){if(x==undefined)x=1;if(z==undefined){if(y==undefined){y=x;z=x}else z=1}else if(y==undefined)y=x;var matrix=new CanvasMatrix4();matrix.m11=x;matrix.m22=y;matrix.m33=z;this.multRight(matrix)};CanvasMatrix4.prototype.rotate=function(angle,x,y,z){angle=angle/180*Math.PI;angle/=2;var sinA=Math.sin(angle);var cosA=Math.cos(angle);var sinA2=sinA*sinA;var length=Math.sqrt(x*x+y*y+z*z);if(length==0){x=0;y=0;z=1}else if(length!=1){x/=length;y/=length;z/=length}var mat=new CanvasMatrix4();if(x==1&&y==0&&z==0){mat.m11=1;mat.m12=0;mat.m13=0;mat.m21=0;mat.m22=1-2*sinA2;mat.m23=2*sinA*cosA;mat.m31=0;mat.m32=-2*sinA*cosA;mat.m33=1-2*sinA2;mat.m14=mat.m24=mat.m34=0;mat.m41=mat.m42=mat.m43=0;mat.m44=1}else if(x==0&&y==1&&z==0){mat.m11=1-2*sinA2;mat.m12=0;mat.m13=-2*sinA*cosA;mat.m21=0;mat.m22=1;mat.m23=0;mat.m31=2*sinA*cosA;mat.m32=0;mat.m33=1-2*sinA2;mat.m14=mat.m24=mat.m34=0;mat.m41=mat.m42=mat.m43=0;mat.m44=1}else if(x==0&&y==0&&z==1){mat.m11=1-2*sinA2;mat.m12=2*sinA*cosA;mat.m13=0;mat.m21=-2*sinA*cosA;mat.m22=1-2*sinA2;mat.m23=0;mat.m31=0;mat.m32=0;mat.m33=1;mat.m14=mat.m24=mat.m34=0;mat.m41=mat.m42=mat.m43=0;mat.m44=1}else{var x2=x*x;var y2=y*y;var z2=z*z;mat.m11=1-2*(y2+z2)*sinA2;mat.m12=2*(x*y*sinA2+z*sinA*cosA);mat.m13=2*(x*z*sinA2-y*sinA*cosA);mat.m21=2*(y*x*sinA2-z*sinA*cosA);mat.m22=1-2*(z2+x2)*sinA2;mat.m23=2*(y*z*sinA2+x*sinA*cosA);mat.m31=2*(z*x*sinA2+y*sinA*cosA);mat.m32=2*(z*y*sinA2-x*sinA*cosA);mat.m33=1-2*(x2+y2)*sinA2;mat.m14=mat.m24=mat.m34=0;mat.m41=mat.m42=mat.m43=0;mat.m44=1}this.multRight(mat)};CanvasMatrix4.prototype.multRight=function(mat){var m11=(this.m11*mat.m11+this.m12*mat.m21+this.m13*mat.m31+this.m14*mat.m41);var m12=(this.m11*mat.m12+this.m12*mat.m22+this.m13*mat.m32+this.m14*mat.m42);var m13=(this.m11*mat.m13+this.m12*mat.m23+this.m13*mat.m33+this.m14*mat.m43);var m14=(this.m11*mat.m14+this.m12*mat.m24+this.m13*mat.m34+this.m14*mat.m44);var m21=(this.m21*mat.m11+this.m22*mat.m21+this.m23*mat.m31+this.m24*mat.m41);var m22=(this.m21*mat.m12+this.m22*mat.m22+this.m23*mat.m32+this.m24*mat.m42);var m23=(this.m21*mat.m13+this.m22*mat.m23+this.m23*mat.m33+this.m24*mat.m43);var m24=(this.m21*mat.m14+this.m22*mat.m24+this.m23*mat.m34+this.m24*mat.m44);var m31=(this.m31*mat.m11+this.m32*mat.m21+this.m33*mat.m31+this.m34*mat.m41);var m32=(this.m31*mat.m12+this.m32*mat.m22+this.m33*mat.m32+this.m34*mat.m42);var m33=(this.m31*mat.m13+this.m32*mat.m23+this.m33*mat.m33+this.m34*mat.m43);var m34=(this.m31*mat.m14+this.m32*mat.m24+this.m33*mat.m34+this.m34*mat.m44);var m41=(this.m41*mat.m11+this.m42*mat.m21+this.m43*mat.m31+this.m44*mat.m41);var m42=(this.m41*mat.m12+this.m42*mat.m22+this.m43*mat.m32+this.m44*mat.m42);var m43=(this.m41*mat.m13+this.m42*mat.m23+this.m43*mat.m33+this.m44*mat.m43);var m44=(this.m41*mat.m14+this.m42*mat.m24+this.m43*mat.m34+this.m44*mat.m44);this.m11=m11;this.m12=m12;this.m13=m13;this.m14=m14;this.m21=m21;this.m22=m22;this.m23=m23;this.m24=m24;this.m31=m31;this.m32=m32;this.m33=m33;this.m34=m34;this.m41=m41;this.m42=m42;this.m43=m43;this.m44=m44};CanvasMatrix4.prototype.multLeft=function(mat){var m11=(mat.m11*this.m11+mat.m12*this.m21+mat.m13*this.m31+mat.m14*this.m41);var m12=(mat.m11*this.m12+mat.m12*this.m22+mat.m13*this.m32+mat.m14*this.m42);var m13=(mat.m11*this.m13+mat.m12*this.m23+mat.m13*this.m33+mat.m14*this.m43);var m14=(mat.m11*this.m14+mat.m12*this.m24+mat.m13*this.m34+mat.m14*this.m44);var m21=(mat.m21*this.m11+mat.m22*this.m21+mat.m23*this.m31+mat.m24*this.m41);var m22=(mat.m21*this.m12+mat.m22*this.m22+mat.m23*this.m32+mat.m24*this.m42);var m23=(mat.m21*this.m13+mat.m22*this.m23+mat.m23*this.m33+mat.m24*this.m43);var m24=(mat.m21*this.m14+mat.m22*this.m24+mat.m23*this.m34+mat.m24*this.m44);var m31=(mat.m31*this.m11+mat.m32*this.m21+mat.m33*this.m31+mat.m34*this.m41);var m32=(mat.m31*this.m12+mat.m32*this.m22+mat.m33*this.m32+mat.m34*this.m42);var m33=(mat.m31*this.m13+mat.m32*this.m23+mat.m33*this.m33+mat.m34*this.m43);var m34=(mat.m31*this.m14+mat.m32*this.m24+mat.m33*this.m34+mat.m34*this.m44);var m41=(mat.m41*this.m11+mat.m42*this.m21+mat.m43*this.m31+mat.m44*this.m41);var m42=(mat.m41*this.m12+mat.m42*this.m22+mat.m43*this.m32+mat.m44*this.m42);var m43=(mat.m41*this.m13+mat.m42*this.m23+mat.m43*this.m33+mat.m44*this.m43);var m44=(mat.m41*this.m14+mat.m42*this.m24+mat.m43*this.m34+mat.m44*this.m44);this.m11=m11;this.m12=m12;this.m13=m13;this.m14=m14;this.m21=m21;this.m22=m22;this.m23=m23;this.m24=m24;this.m31=m31;this.m32=m32;this.m33=m33;this.m34=m34;this.m41=m41;this.m42=m42;this.m43=m43;this.m44=m44};CanvasMatrix4.prototype.ortho=function(left,right,bottom,top,near,far){var tx=(left+right)/(left-right);var ty=(top+bottom)/(top-bottom);var tz=(far+near)/(far-near);var matrix=new CanvasMatrix4();matrix.m11=2/(left-right);matrix.m12=0;matrix.m13=0;matrix.m14=0;matrix.m21=0;matrix.m22=2/(top-bottom);matrix.m23=0;matrix.m24=0;matrix.m31=0;matrix.m32=0;matrix.m33=-2/(far-near);matrix.m34=0;matrix.m41=tx;matrix.m42=ty;matrix.m43=tz;matrix.m44=1;this.multRight(matrix)};CanvasMatrix4.prototype.frustum=function(left,right,bottom,top,near,far){var matrix=new CanvasMatrix4();var A=(right+left)/(right-left);var B=(top+bottom)/(top-bottom);var C=-(far+near)/(far-near);var D=-(2*far*near)/(far-near);matrix.m11=(2*near)/(right-left);matrix.m12=0;matrix.m13=0;matrix.m14=0;matrix.m21=0;matrix.m22=2*near/(top-bottom);matrix.m23=0;matrix.m24=0;matrix.m31=A;matrix.m32=B;matrix.m33=C;matrix.m34=-1;matrix.m41=0;matrix.m42=0;matrix.m43=D;matrix.m44=0;this.multRight(matrix)};CanvasMatrix4.prototype.perspective=function(fovy,aspect,zNear,zFar){var top=Math.tan(fovy*Math.PI/360)*zNear;var bottom=-top;var left=aspect*bottom;var right=aspect*top;this.frustum(left,right,bottom,top,zNear,zFar)};CanvasMatrix4.prototype.lookat=function(eyex,eyey,eyez,centerx,centery,centerz,upx,upy,upz){var matrix=new CanvasMatrix4();var zx=eyex-centerx;var zy=eyey-centery;var zz=eyez-centerz;var mag=Math.sqrt(zx*zx+zy*zy+zz*zz);if(mag){zx/=mag;zy/=mag;zz/=mag}var yx=upx;var yy=upy;var yz=upz;xx=yy*zz-yz*zy;xy=-yx*zz+yz*zx;xz=yx*zy-yy*zx;yx=zy*xz-zz*xy;yy=-zx*xz+zz*xx;yx=zx*xy-zy*xx;mag=Math.sqrt(xx*xx+xy*xy+xz*xz);if(mag){xx/=mag;xy/=mag;xz/=mag}mag=Math.sqrt(yx*yx+yy*yy+yz*yz);if(mag){yx/=mag;yy/=mag;yz/=mag}matrix.m11=xx;matrix.m12=xy;matrix.m13=xz;matrix.m14=0;matrix.m21=yx;matrix.m22=yy;matrix.m23=yz;matrix.m24=0;matrix.m31=zx;matrix.m32=zy;matrix.m33=zz;matrix.m34=0;matrix.m41=0;matrix.m42=0;matrix.m43=0;matrix.m44=1;matrix.translate(-eyex,-eyey,-eyez);this.multRight(matrix)};CanvasMatrix4.prototype._determinant2x2=function(a,b,c,d){return a*d-b*c};CanvasMatrix4.prototype._determinant3x3=function(a1,a2,a3,b1,b2,b3,c1,c2,c3){return a1*this._determinant2x2(b2,b3,c2,c3)-b1*this._determinant2x2(a2,a3,c2,c3)+c1*this._determinant2x2(a2,a3,b2,b3)};CanvasMatrix4.prototype._determinant4x4=function(){var a1=this.m11;var b1=this.m12;var c1=this.m13;var d1=this.m14;var a2=this.m21;var b2=this.m22;var c2=this.m23;var d2=this.m24;var a3=this.m31;var b3=this.m32;var c3=this.m33;var d3=this.m34;var a4=this.m41;var b4=this.m42;var c4=this.m43;var d4=this.m44;return a1*this._determinant3x3(b2,b3,b4,c2,c3,c4,d2,d3,d4)-b1*this._determinant3x3(a2,a3,a4,c2,c3,c4,d2,d3,d4)+c1*this._determinant3x3(a2,a3,a4,b2,b3,b4,d2,d3,d4)-d1*this._determinant3x3(a2,a3,a4,b2,b3,b4,c2,c3,c4)};CanvasMatrix4.prototype._makeAdjoint=function(){var a1=this.m11;var b1=this.m12;var c1=this.m13;var d1=this.m14;var a2=this.m21;var b2=this.m22;var c2=this.m23;var d2=this.m24;var a3=this.m31;var b3=this.m32;var c3=this.m33;var d3=this.m34;var a4=this.m41;var b4=this.m42;var c4=this.m43;var d4=this.m44;this.m11=this._determinant3x3(b2,b3,b4,c2,c3,c4,d2,d3,d4);this.m21=-this._determinant3x3(a2,a3,a4,c2,c3,c4,d2,d3,d4);this.m31=this._determinant3x3(a2,a3,a4,b2,b3,b4,d2,d3,d4);this.m41=-this._determinant3x3(a2,a3,a4,b2,b3,b4,c2,c3,c4);this.m12=-this._determinant3x3(b1,b3,b4,c1,c3,c4,d1,d3,d4);this.m22=this._determinant3x3(a1,a3,a4,c1,c3,c4,d1,d3,d4);this.m32=-this._determinant3x3(a1,a3,a4,b1,b3,b4,d1,d3,d4);this.m42=this._determinant3x3(a1,a3,a4,b1,b3,b4,c1,c3,c4);this.m13=this._determinant3x3(b1,b2,b4,c1,c2,c4,d1,d2,d4);this.m23=-this._determinant3x3(a1,a2,a4,c1,c2,c4,d1,d2,d4);this.m33=this._determinant3x3(a1,a2,a4,b1,b2,b4,d1,d2,d4);this.m43=-this._determinant3x3(a1,a2,a4,b1,b2,b4,c1,c2,c4);this.m14=-this._determinant3x3(b1,b2,b3,c1,c2,c3,d1,d2,d3);this.m24=this._determinant3x3(a1,a2,a3,c1,c2,c3,d1,d2,d3);this.m34=-this._determinant3x3(a1,a2,a3,b1,b2,b3,d1,d2,d3);this.m44=this._determinant3x3(a1,a2,a3,b1,b2,b3,c1,c2,c3)}
</script>

This works fine.


```r
x <- sort(rnorm(1000))
y <- rnorm(1000)
z <- rnorm(1000) + atan2(x,y)
plot3d(x, y, z, col=rainbow(1000))
```

<canvas id="testgltextureCanvas" style="display: none;" width="256" height="256">
Your browser does not support the HTML5 canvas element.</canvas>
<!-- ****** points object 7 ****** -->
<script id="testglvshader7" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
gl_PointSize = 3.;
vCol = aCol;
}
</script>
<script id="testglfshader7" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<!-- ****** text object 9 ****** -->
<script id="testglvshader9" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader9" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** text object 10 ****** -->
<script id="testglvshader10" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader10" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** text object 11 ****** -->
<script id="testglvshader11" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader11" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** lines object 12 ****** -->
<script id="testglvshader12" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
}
</script>
<script id="testglfshader12" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<!-- ****** text object 13 ****** -->
<script id="testglvshader13" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader13" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** lines object 14 ****** -->
<script id="testglvshader14" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
}
</script>
<script id="testglfshader14" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<!-- ****** text object 15 ****** -->
<script id="testglvshader15" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader15" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** lines object 16 ****** -->
<script id="testglvshader16" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
}
</script>
<script id="testglfshader16" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<!-- ****** text object 17 ****** -->
<script id="testglvshader17" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader17" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** lines object 18 ****** -->
<script id="testglvshader18" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
}
</script>
<script id="testglfshader18" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<script type="text/javascript"> 
function getShader ( gl, id ){
var shaderScript = document.getElementById ( id );
var str = "";
var k = shaderScript.firstChild;
while ( k ){
if ( k.nodeType == 3 ) str += k.textContent;
k = k.nextSibling;
}
var shader;
if ( shaderScript.type == "x-shader/x-fragment" )
shader = gl.createShader ( gl.FRAGMENT_SHADER );
else if ( shaderScript.type == "x-shader/x-vertex" )
shader = gl.createShader(gl.VERTEX_SHADER);
else return null;
gl.shaderSource(shader, str);
gl.compileShader(shader);
if (gl.getShaderParameter(shader, gl.COMPILE_STATUS) == 0)
alert(gl.getShaderInfoLog(shader));
return shader;
}
var min = Math.min;
var max = Math.max;
var sqrt = Math.sqrt;
var sin = Math.sin;
var acos = Math.acos;
var tan = Math.tan;
var SQRT2 = Math.SQRT2;
var PI = Math.PI;
var log = Math.log;
var exp = Math.exp;
function testglwebGLStart() {
var debug = function(msg) {
document.getElementById("testgldebug").innerHTML = msg;
}
debug("");
var canvas = document.getElementById("testglcanvas");
if (!window.WebGLRenderingContext){
debug(" Your browser does not support WebGL. See <a href=\"http://get.webgl.org\">http://get.webgl.org</a>");
return;
}
var gl;
try {
// Try to grab the standard context. If it fails, fallback to experimental.
gl = canvas.getContext("webgl") 
|| canvas.getContext("experimental-webgl");
}
catch(e) {}
if ( !gl ) {
debug(" Your browser appears to support WebGL, but did not create a WebGL context.  See <a href=\"http://get.webgl.org\">http://get.webgl.org</a>");
return;
}
var width = 505;  var height = 505;
canvas.width = width;   canvas.height = height;
var prMatrix = new CanvasMatrix4();
var mvMatrix = new CanvasMatrix4();
var normMatrix = new CanvasMatrix4();
var saveMat = new CanvasMatrix4();
saveMat.makeIdentity();
var distance;
var posLoc = 0;
var colLoc = 1;
var zoom = new Object();
var fov = new Object();
var userMatrix = new Object();
var activeSubscene = 1;
zoom[1] = 1;
fov[1] = 30;
userMatrix[1] = new CanvasMatrix4();
userMatrix[1].load([
1, 0, 0, 0,
0, 0.3420201, -0.9396926, 0,
0, 0.9396926, 0.3420201, 0,
0, 0, 0, 1
]);
function getPowerOfTwo(value) {
var pow = 1;
while(pow<value) {
pow *= 2;
}
return pow;
}
function handleLoadedTexture(texture, textureCanvas) {
gl.pixelStorei(gl.UNPACK_FLIP_Y_WEBGL, true);
gl.bindTexture(gl.TEXTURE_2D, texture);
gl.texImage2D(gl.TEXTURE_2D, 0, gl.RGBA, gl.RGBA, gl.UNSIGNED_BYTE, textureCanvas);
gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MAG_FILTER, gl.LINEAR);
gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MIN_FILTER, gl.LINEAR_MIPMAP_NEAREST);
gl.generateMipmap(gl.TEXTURE_2D);
gl.bindTexture(gl.TEXTURE_2D, null);
}
function loadImageToTexture(filename, texture) {   
var canvas = document.getElementById("testgltextureCanvas");
var ctx = canvas.getContext("2d");
var image = new Image();
image.onload = function() {
var w = image.width;
var h = image.height;
var canvasX = getPowerOfTwo(w);
var canvasY = getPowerOfTwo(h);
canvas.width = canvasX;
canvas.height = canvasY;
ctx.imageSmoothingEnabled = true;
ctx.drawImage(image, 0, 0, canvasX, canvasY);
handleLoadedTexture(texture, canvas);
drawScene();
}
image.src = filename;
}  	   
function drawTextToCanvas(text, cex) {
var canvasX, canvasY;
var textX, textY;
var textHeight = 20 * cex;
var textColour = "white";
var fontFamily = "Arial";
var backgroundColour = "rgba(0,0,0,0)";
var canvas = document.getElementById("testgltextureCanvas");
var ctx = canvas.getContext("2d");
ctx.font = textHeight+"px "+fontFamily;
canvasX = 1;
var widths = [];
for (var i = 0; i < text.length; i++)  {
widths[i] = ctx.measureText(text[i]).width;
canvasX = (widths[i] > canvasX) ? widths[i] : canvasX;
}	  
canvasX = getPowerOfTwo(canvasX);
var offset = 2*textHeight; // offset to first baseline
var skip = 2*textHeight;   // skip between baselines	  
canvasY = getPowerOfTwo(offset + text.length*skip);
canvas.width = canvasX;
canvas.height = canvasY;
ctx.fillStyle = backgroundColour;
ctx.fillRect(0, 0, ctx.canvas.width, ctx.canvas.height);
ctx.fillStyle = textColour;
ctx.textAlign = "left";
ctx.textBaseline = "alphabetic";
ctx.font = textHeight+"px "+fontFamily;
for(var i = 0; i < text.length; i++) {
textY = i*skip + offset;
ctx.fillText(text[i], 0,  textY);
}
return {canvasX:canvasX, canvasY:canvasY,
widths:widths, textHeight:textHeight,
offset:offset, skip:skip};
}
// ****** points object 7 ******
var prog7  = gl.createProgram();
gl.attachShader(prog7, getShader( gl, "testglvshader7" ));
gl.attachShader(prog7, getShader( gl, "testglfshader7" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog7, 0, "aPos");
gl.bindAttribLocation(prog7, 1, "aCol");
gl.linkProgram(prog7);
var v=new Float32Array([
-2.953509, -1.518159, -0.9806038, 1, 0, 0, 1,
-2.706024, 0.219532, -2.556322, 1, 0.007843138, 0, 1,
-2.67814, 0.4008523, -0.7046096, 1, 0.01176471, 0, 1,
-2.606974, 0.194268, -4.070656, 1, 0.01960784, 0, 1,
-2.598371, 0.5351583, -0.04958665, 1, 0.02352941, 0, 1,
-2.553131, 0.137939, -1.112613, 1, 0.03137255, 0, 1,
-2.506934, -0.9956142, -1.381076, 1, 0.03529412, 0, 1,
-2.477516, -0.9389285, -1.691234, 1, 0.04313726, 0, 1,
-2.436378, -2.164824, -2.144877, 1, 0.04705882, 0, 1,
-2.41736, 0.2611831, -1.934434, 1, 0.05490196, 0, 1,
-2.326945, -0.8334003, -2.299256, 1, 0.05882353, 0, 1,
-2.325088, -0.381384, -1.000536, 1, 0.06666667, 0, 1,
-2.26633, -0.5090097, -2.553544, 1, 0.07058824, 0, 1,
-2.22108, -0.2196006, -2.242101, 1, 0.07843138, 0, 1,
-2.220079, -0.386677, -1.479781, 1, 0.08235294, 0, 1,
-2.194819, 1.686729, -0.8359983, 1, 0.09019608, 0, 1,
-2.190246, -0.9650279, -1.677599, 1, 0.09411765, 0, 1,
-2.186885, -0.2283868, -2.43286, 1, 0.1019608, 0, 1,
-2.163018, 1.370364, -2.026947, 1, 0.1098039, 0, 1,
-2.152118, -0.09761313, -2.394099, 1, 0.1137255, 0, 1,
-2.148745, -0.2712151, -1.589789, 1, 0.1215686, 0, 1,
-2.148274, -0.4379783, -0.9170415, 1, 0.1254902, 0, 1,
-2.133889, 0.6311796, -0.9823495, 1, 0.1333333, 0, 1,
-2.132238, -0.7042508, -1.922884, 1, 0.1372549, 0, 1,
-2.101146, 0.09669051, -2.615081, 1, 0.145098, 0, 1,
-2.098902, 0.1484204, 0.0983798, 1, 0.1490196, 0, 1,
-2.073111, 0.20793, -0.5108733, 1, 0.1568628, 0, 1,
-2.071798, 1.356703, -2.787676, 1, 0.1607843, 0, 1,
-2.05562, 0.8343738, -2.182881, 1, 0.1686275, 0, 1,
-2.015102, -0.1438284, -2.79029, 1, 0.172549, 0, 1,
-2.000561, -0.8572732, -2.664818, 1, 0.1803922, 0, 1,
-1.989059, -0.8244098, -0.7282487, 1, 0.1843137, 0, 1,
-1.982246, -0.0469626, -0.6327487, 1, 0.1921569, 0, 1,
-1.96896, -1.134918, -1.968705, 1, 0.1960784, 0, 1,
-1.962042, 0.7375249, -1.646627, 1, 0.2039216, 0, 1,
-1.941943, 0.08250826, -4.281897, 1, 0.2117647, 0, 1,
-1.929084, 0.7684748, -1.718564, 1, 0.2156863, 0, 1,
-1.92888, 0.326228, -1.873487, 1, 0.2235294, 0, 1,
-1.919014, -1.27578, -2.638104, 1, 0.227451, 0, 1,
-1.867038, -0.4067872, -1.328723, 1, 0.2352941, 0, 1,
-1.843072, -0.2128998, -2.607201, 1, 0.2392157, 0, 1,
-1.835235, 0.2136589, -2.846881, 1, 0.2470588, 0, 1,
-1.831888, 0.4787989, 0.4028135, 1, 0.2509804, 0, 1,
-1.829618, 1.161926, -1.402084, 1, 0.2588235, 0, 1,
-1.805267, 1.00856, -0.8557246, 1, 0.2627451, 0, 1,
-1.803286, -1.540657, -1.459942, 1, 0.2705882, 0, 1,
-1.787172, -1.555436, -0.876553, 1, 0.2745098, 0, 1,
-1.767718, 0.7178373, -2.142047, 1, 0.282353, 0, 1,
-1.763181, -0.1666773, -1.257252, 1, 0.2862745, 0, 1,
-1.761289, 1.307466, -1.526291, 1, 0.2941177, 0, 1,
-1.7564, 0.01074835, -1.686228, 1, 0.3019608, 0, 1,
-1.746854, -1.521178, -2.079716, 1, 0.3058824, 0, 1,
-1.746828, -0.4168695, -3.989808, 1, 0.3137255, 0, 1,
-1.709671, -0.1332764, -1.685901, 1, 0.3176471, 0, 1,
-1.707742, 1.140089, -0.4147621, 1, 0.3254902, 0, 1,
-1.686089, 1.003558, 0.0527599, 1, 0.3294118, 0, 1,
-1.676111, 1.165561, -0.4050278, 1, 0.3372549, 0, 1,
-1.653382, 0.09003018, 0.6709725, 1, 0.3411765, 0, 1,
-1.621573, 0.704195, -0.3163459, 1, 0.3490196, 0, 1,
-1.611087, 0.9676612, -1.241805, 1, 0.3529412, 0, 1,
-1.599939, 0.3178569, -1.845332, 1, 0.3607843, 0, 1,
-1.596932, -0.05032593, -1.634693, 1, 0.3647059, 0, 1,
-1.589082, -0.02651836, -2.748339, 1, 0.372549, 0, 1,
-1.568974, 1.058685, 0.3632359, 1, 0.3764706, 0, 1,
-1.566036, -0.4638207, 0.4304608, 1, 0.3843137, 0, 1,
-1.562648, 1.708089, -3.389054, 1, 0.3882353, 0, 1,
-1.540918, -1.099713, -3.793418, 1, 0.3960784, 0, 1,
-1.516929, -0.5043234, -0.2710277, 1, 0.4039216, 0, 1,
-1.510477, 2.36988, -1.736075, 1, 0.4078431, 0, 1,
-1.4975, 0.3489506, 0.2542934, 1, 0.4156863, 0, 1,
-1.49138, 0.09727142, -1.613683, 1, 0.4196078, 0, 1,
-1.485426, -0.0386178, -0.5267306, 1, 0.427451, 0, 1,
-1.471535, -0.6027532, -2.987353, 1, 0.4313726, 0, 1,
-1.463411, -2.130058, -2.331672, 1, 0.4392157, 0, 1,
-1.454684, -0.08613782, -2.269306, 1, 0.4431373, 0, 1,
-1.449194, -1.314717, -3.242702, 1, 0.4509804, 0, 1,
-1.43479, 1.295895, -1.734878, 1, 0.454902, 0, 1,
-1.431227, 0.7463571, -1.885383, 1, 0.4627451, 0, 1,
-1.417936, 0.5451192, -3.677823, 1, 0.4666667, 0, 1,
-1.410319, 1.102838, -0.1789548, 1, 0.4745098, 0, 1,
-1.409014, 0.8420824, -0.5856137, 1, 0.4784314, 0, 1,
-1.387859, 0.4675214, -0.4098635, 1, 0.4862745, 0, 1,
-1.378986, -0.445513, -3.346872, 1, 0.4901961, 0, 1,
-1.370176, 0.7528344, 0.5536385, 1, 0.4980392, 0, 1,
-1.366851, -0.4065328, -2.98514, 1, 0.5058824, 0, 1,
-1.346769, 0.1891007, -2.448871, 1, 0.509804, 0, 1,
-1.328707, -0.559137, -2.808994, 1, 0.5176471, 0, 1,
-1.324068, 1.046004, -0.03130066, 1, 0.5215687, 0, 1,
-1.318192, 1.69836, -0.106332, 1, 0.5294118, 0, 1,
-1.306371, -0.2820165, -4.056538, 1, 0.5333334, 0, 1,
-1.304917, 1.817718, -0.1608651, 1, 0.5411765, 0, 1,
-1.300153, -0.6876427, -1.787923, 1, 0.5450981, 0, 1,
-1.291578, 0.641519, -1.244113, 1, 0.5529412, 0, 1,
-1.287475, 0.390589, -0.8424728, 1, 0.5568628, 0, 1,
-1.284738, -1.219458, -2.4147, 1, 0.5647059, 0, 1,
-1.276817, -0.8039153, -0.6221533, 1, 0.5686275, 0, 1,
-1.271173, 0.3810619, -0.4301873, 1, 0.5764706, 0, 1,
-1.26965, 0.1283195, -2.266153, 1, 0.5803922, 0, 1,
-1.268357, -2.388023, -2.807264, 1, 0.5882353, 0, 1,
-1.268054, -2.23135, -1.822722, 1, 0.5921569, 0, 1,
-1.258638, -0.7248119, -2.587178, 1, 0.6, 0, 1,
-1.257188, -0.3112414, -1.277766, 1, 0.6078432, 0, 1,
-1.247928, 0.531148, -0.06730178, 1, 0.6117647, 0, 1,
-1.241852, -0.2053291, -4.248096, 1, 0.6196079, 0, 1,
-1.233778, -0.02246799, -0.9611962, 1, 0.6235294, 0, 1,
-1.220704, 1.453547, -1.365971, 1, 0.6313726, 0, 1,
-1.219062, 0.7389619, -0.7768897, 1, 0.6352941, 0, 1,
-1.218194, -0.5826431, -1.344275, 1, 0.6431373, 0, 1,
-1.216352, 0.6196202, -2.241089, 1, 0.6470588, 0, 1,
-1.215512, -2.356749, -2.948712, 1, 0.654902, 0, 1,
-1.213952, -0.9109498, -3.38816, 1, 0.6588235, 0, 1,
-1.206018, -0.6151699, -1.624055, 1, 0.6666667, 0, 1,
-1.201448, -0.6934019, -2.28874, 1, 0.6705883, 0, 1,
-1.196819, 0.9670439, -1.372737, 1, 0.6784314, 0, 1,
-1.183156, 0.8942391, 0.06642855, 1, 0.682353, 0, 1,
-1.178247, -0.5824142, -2.085072, 1, 0.6901961, 0, 1,
-1.176884, -0.01821882, -1.451764, 1, 0.6941177, 0, 1,
-1.163976, -0.2934828, -2.262713, 1, 0.7019608, 0, 1,
-1.156182, -0.07806606, -2.730309, 1, 0.7098039, 0, 1,
-1.155329, 0.6851984, -0.1529888, 1, 0.7137255, 0, 1,
-1.146351, -0.4043002, -0.1536468, 1, 0.7215686, 0, 1,
-1.137431, 0.5199913, -2.324328, 1, 0.7254902, 0, 1,
-1.133277, 0.06341733, -0.6130658, 1, 0.7333333, 0, 1,
-1.131178, 0.1044183, -2.235799, 1, 0.7372549, 0, 1,
-1.126366, -0.333936, -1.529943, 1, 0.7450981, 0, 1,
-1.125641, 3.326463, -0.8225654, 1, 0.7490196, 0, 1,
-1.123076, -0.06333017, -2.225042, 1, 0.7568628, 0, 1,
-1.121939, -0.236549, -1.847275, 1, 0.7607843, 0, 1,
-1.121245, 0.2620983, -0.4739999, 1, 0.7686275, 0, 1,
-1.117677, 0.6267018, 1.711641, 1, 0.772549, 0, 1,
-1.114585, -0.892547, -2.553161, 1, 0.7803922, 0, 1,
-1.108913, 1.662074, 0.03003235, 1, 0.7843137, 0, 1,
-1.108868, -0.4315598, -1.497012, 1, 0.7921569, 0, 1,
-1.107726, 0.4039323, -0.1392565, 1, 0.7960784, 0, 1,
-1.105834, -0.7816273, -2.21176, 1, 0.8039216, 0, 1,
-1.104256, -1.073412, -1.879375, 1, 0.8117647, 0, 1,
-1.086866, 0.8512295, -0.3780014, 1, 0.8156863, 0, 1,
-1.084807, -1.237892, -3.476251, 1, 0.8235294, 0, 1,
-1.069815, 1.422215, 0.1278081, 1, 0.827451, 0, 1,
-1.06281, -0.1729193, -2.19513, 1, 0.8352941, 0, 1,
-1.060351, 0.8662372, -0.998959, 1, 0.8392157, 0, 1,
-1.059751, -1.321135, -1.198679, 1, 0.8470588, 0, 1,
-1.056096, -0.8405024, -1.219719, 1, 0.8509804, 0, 1,
-1.055243, 1.206445, -2.102596, 1, 0.8588235, 0, 1,
-1.048195, -0.293757, -1.591861, 1, 0.8627451, 0, 1,
-1.045971, 1.370412, -1.620981, 1, 0.8705882, 0, 1,
-1.044312, -0.555683, -3.37308, 1, 0.8745098, 0, 1,
-1.043903, -1.161104, -2.131344, 1, 0.8823529, 0, 1,
-1.043503, -0.2038231, -3.556454, 1, 0.8862745, 0, 1,
-1.039966, -1.578388, -2.131366, 1, 0.8941177, 0, 1,
-1.039247, -0.8693141, -1.801151, 1, 0.8980392, 0, 1,
-1.036243, 0.6491752, -0.4762755, 1, 0.9058824, 0, 1,
-1.024603, 0.4755357, -1.555362, 1, 0.9137255, 0, 1,
-1.021998, 0.4307193, -1.015733, 1, 0.9176471, 0, 1,
-1.018987, -1.450511, -2.912247, 1, 0.9254902, 0, 1,
-1.012766, -0.3104887, -0.1178267, 1, 0.9294118, 0, 1,
-0.9990865, 1.330601, -0.4665743, 1, 0.9372549, 0, 1,
-0.9907643, 0.901536, -0.357563, 1, 0.9411765, 0, 1,
-0.9798052, 0.1186317, -2.033851, 1, 0.9490196, 0, 1,
-0.9784029, 0.1736484, -1.433545, 1, 0.9529412, 0, 1,
-0.9770154, -0.12584, -0.08980227, 1, 0.9607843, 0, 1,
-0.9649926, 0.07179517, -2.094323, 1, 0.9647059, 0, 1,
-0.9640602, 0.07379169, -3.260638, 1, 0.972549, 0, 1,
-0.9578684, -1.354679, -3.607853, 1, 0.9764706, 0, 1,
-0.9525153, 0.1413306, -2.93516, 1, 0.9843137, 0, 1,
-0.9509305, -0.09944487, -1.349077, 1, 0.9882353, 0, 1,
-0.950012, 1.350514, 0.3044114, 1, 0.9960784, 0, 1,
-0.9428969, -0.3228496, -1.599173, 0.9960784, 1, 0, 1,
-0.9419626, -2.03708, -2.827773, 0.9921569, 1, 0, 1,
-0.9412797, 0.8142354, 0.9930164, 0.9843137, 1, 0, 1,
-0.9407721, -0.633571, -2.606233, 0.9803922, 1, 0, 1,
-0.9331108, 0.9955158, -2.237108, 0.972549, 1, 0, 1,
-0.9294017, -0.389687, -2.414773, 0.9686275, 1, 0, 1,
-0.9252089, 0.494152, -0.9607786, 0.9607843, 1, 0, 1,
-0.9231812, -0.3452294, -1.299585, 0.9568627, 1, 0, 1,
-0.9184068, 0.2327317, -1.13362, 0.9490196, 1, 0, 1,
-0.9183874, 0.5386515, -1.097439, 0.945098, 1, 0, 1,
-0.9174697, 1.320116, -1.335909, 0.9372549, 1, 0, 1,
-0.911345, 0.8780913, -2.526231, 0.9333333, 1, 0, 1,
-0.9079204, 1.715211, 1.135959, 0.9254902, 1, 0, 1,
-0.9049975, 1.111825, -0.6856161, 0.9215686, 1, 0, 1,
-0.9032053, -0.6110478, -2.913765, 0.9137255, 1, 0, 1,
-0.9022999, -1.90852, -3.319675, 0.9098039, 1, 0, 1,
-0.9001926, -0.6677155, -2.542862, 0.9019608, 1, 0, 1,
-0.8915911, -0.3816449, -1.415586, 0.8941177, 1, 0, 1,
-0.8872369, -0.4744276, -0.7902918, 0.8901961, 1, 0, 1,
-0.8822324, -0.4589901, -4.096111, 0.8823529, 1, 0, 1,
-0.8765222, 0.672508, -1.486916, 0.8784314, 1, 0, 1,
-0.8760107, -0.8583392, -1.892019, 0.8705882, 1, 0, 1,
-0.8750683, 2.297769, -1.978242, 0.8666667, 1, 0, 1,
-0.8711228, -0.1943124, -0.7859612, 0.8588235, 1, 0, 1,
-0.8683367, 0.9461181, -0.1917097, 0.854902, 1, 0, 1,
-0.8664619, 0.09014087, -1.038773, 0.8470588, 1, 0, 1,
-0.8595828, -0.8134281, -2.24446, 0.8431373, 1, 0, 1,
-0.8561303, -1.231554, -4.416455, 0.8352941, 1, 0, 1,
-0.8547051, -0.02397427, -1.383109, 0.8313726, 1, 0, 1,
-0.8495284, 1.025842, -0.5211834, 0.8235294, 1, 0, 1,
-0.8446772, -0.6548424, -2.13346, 0.8196079, 1, 0, 1,
-0.8413001, 0.7471812, -0.61261, 0.8117647, 1, 0, 1,
-0.840527, -0.9512921, -2.704019, 0.8078431, 1, 0, 1,
-0.838523, -0.08661916, -1.489128, 0.8, 1, 0, 1,
-0.8363001, -0.5059192, -1.052084, 0.7921569, 1, 0, 1,
-0.8276892, 1.056482, -0.2074078, 0.7882353, 1, 0, 1,
-0.8156949, 1.992878, -0.9835447, 0.7803922, 1, 0, 1,
-0.8141696, -0.1191925, -0.2874642, 0.7764706, 1, 0, 1,
-0.8071346, -0.3125978, -1.994123, 0.7686275, 1, 0, 1,
-0.8065667, 0.5925964, -0.8800263, 0.7647059, 1, 0, 1,
-0.802573, -2.220683, -1.576339, 0.7568628, 1, 0, 1,
-0.7922283, -0.5226701, -0.2754534, 0.7529412, 1, 0, 1,
-0.7783687, -3.277577, -2.831992, 0.7450981, 1, 0, 1,
-0.7773263, 1.800191, 0.8739458, 0.7411765, 1, 0, 1,
-0.7763441, -1.204983, -1.107787, 0.7333333, 1, 0, 1,
-0.7613712, -2.547642, -2.317161, 0.7294118, 1, 0, 1,
-0.7606075, -1.294531, -2.823844, 0.7215686, 1, 0, 1,
-0.7605631, -1.03505, -2.381252, 0.7176471, 1, 0, 1,
-0.7586489, -1.186669, -2.784588, 0.7098039, 1, 0, 1,
-0.7566096, 1.137974, -1.477702, 0.7058824, 1, 0, 1,
-0.7514211, -0.4690877, -1.925072, 0.6980392, 1, 0, 1,
-0.7474549, -0.06967794, 0.06181606, 0.6901961, 1, 0, 1,
-0.7445724, 0.7243754, -0.2333688, 0.6862745, 1, 0, 1,
-0.7438839, -0.7872126, -2.852892, 0.6784314, 1, 0, 1,
-0.7428623, 2.144123, -0.9934586, 0.6745098, 1, 0, 1,
-0.7406375, 0.7778049, -0.03586621, 0.6666667, 1, 0, 1,
-0.7388908, 1.754505, -0.2079488, 0.6627451, 1, 0, 1,
-0.7374871, 0.3438255, -1.304625, 0.654902, 1, 0, 1,
-0.7370946, -1.035108, -3.688931, 0.6509804, 1, 0, 1,
-0.7332518, 1.090692, -0.5995823, 0.6431373, 1, 0, 1,
-0.7311397, -1.587701, -0.59837, 0.6392157, 1, 0, 1,
-0.7271309, 0.1176435, -0.7603824, 0.6313726, 1, 0, 1,
-0.720612, -0.7590269, -3.132497, 0.627451, 1, 0, 1,
-0.7182837, -0.1639053, -1.905382, 0.6196079, 1, 0, 1,
-0.7174897, -0.7211654, -1.887988, 0.6156863, 1, 0, 1,
-0.7159194, -0.0003549842, -0.7158281, 0.6078432, 1, 0, 1,
-0.7152261, -0.5647644, -2.005137, 0.6039216, 1, 0, 1,
-0.7105197, -0.5267728, -2.628958, 0.5960785, 1, 0, 1,
-0.7085896, 0.3694827, -1.06568, 0.5882353, 1, 0, 1,
-0.7080622, 0.6550247, -1.613431, 0.5843138, 1, 0, 1,
-0.7075866, 0.9112101, -0.7145061, 0.5764706, 1, 0, 1,
-0.7027765, 0.3673407, -0.8006892, 0.572549, 1, 0, 1,
-0.6990564, 0.2067999, -1.024859, 0.5647059, 1, 0, 1,
-0.6987837, -0.1389167, -0.9477857, 0.5607843, 1, 0, 1,
-0.6970658, -0.0790719, -2.367934, 0.5529412, 1, 0, 1,
-0.6952083, 0.3252513, -1.110604, 0.5490196, 1, 0, 1,
-0.6901814, 0.2516696, -2.716308, 0.5411765, 1, 0, 1,
-0.6849632, -1.614846, -1.97133, 0.5372549, 1, 0, 1,
-0.680545, -0.02690198, -2.357293, 0.5294118, 1, 0, 1,
-0.6770026, -0.9736048, -1.929869, 0.5254902, 1, 0, 1,
-0.6711199, 0.02513058, -2.668262, 0.5176471, 1, 0, 1,
-0.6691691, -0.01470058, 0.1276914, 0.5137255, 1, 0, 1,
-0.6687381, 1.056665, 0.5445526, 0.5058824, 1, 0, 1,
-0.6656939, 0.8987341, -1.304356, 0.5019608, 1, 0, 1,
-0.6644638, -0.5421904, -2.314776, 0.4941176, 1, 0, 1,
-0.6635306, -1.655575, -4.642851, 0.4862745, 1, 0, 1,
-0.6573126, 1.066146, 0.1109489, 0.4823529, 1, 0, 1,
-0.6446711, 1.071905, -0.03654059, 0.4745098, 1, 0, 1,
-0.6410993, -0.73554, -2.132026, 0.4705882, 1, 0, 1,
-0.6336297, -0.4302605, -3.859294, 0.4627451, 1, 0, 1,
-0.6307092, 1.159201, -0.6878393, 0.4588235, 1, 0, 1,
-0.6283427, 0.3458331, -1.515288, 0.4509804, 1, 0, 1,
-0.6254687, -1.167118, -0.6387681, 0.4470588, 1, 0, 1,
-0.6243675, -0.367449, -1.808909, 0.4392157, 1, 0, 1,
-0.6238773, 1.417464, -0.2492725, 0.4352941, 1, 0, 1,
-0.6170496, -1.726488, -2.341193, 0.427451, 1, 0, 1,
-0.6164157, -0.956135, -2.709285, 0.4235294, 1, 0, 1,
-0.6143448, 0.08331598, -1.7001, 0.4156863, 1, 0, 1,
-0.6120718, 0.04795797, -1.787543, 0.4117647, 1, 0, 1,
-0.6115037, -0.6212354, -1.06323, 0.4039216, 1, 0, 1,
-0.60879, -0.1258992, -2.86032, 0.3960784, 1, 0, 1,
-0.6082585, 0.1597462, -0.8243239, 0.3921569, 1, 0, 1,
-0.6069566, -0.1848881, -2.14475, 0.3843137, 1, 0, 1,
-0.6064512, -1.14041, -2.119275, 0.3803922, 1, 0, 1,
-0.600398, 0.3794605, -0.9821029, 0.372549, 1, 0, 1,
-0.5969424, 1.255455, -1.30035, 0.3686275, 1, 0, 1,
-0.5913024, 1.393263, -0.02673377, 0.3607843, 1, 0, 1,
-0.5899075, 0.7217188, -0.6588027, 0.3568628, 1, 0, 1,
-0.5856438, 1.34136, -0.07500269, 0.3490196, 1, 0, 1,
-0.5804618, -0.6984613, -0.9352496, 0.345098, 1, 0, 1,
-0.5785081, 1.719301, -0.08829479, 0.3372549, 1, 0, 1,
-0.5748376, -0.5080964, -2.212033, 0.3333333, 1, 0, 1,
-0.5617743, 0.4360399, 0.4710297, 0.3254902, 1, 0, 1,
-0.5614435, 0.6749418, -0.2156484, 0.3215686, 1, 0, 1,
-0.5586449, 0.2152562, -2.577933, 0.3137255, 1, 0, 1,
-0.5540364, 0.02104237, -1.43966, 0.3098039, 1, 0, 1,
-0.5530444, -1.070542, -3.866148, 0.3019608, 1, 0, 1,
-0.552819, -0.5931109, -3.802774, 0.2941177, 1, 0, 1,
-0.5390244, -0.3430922, -1.998149, 0.2901961, 1, 0, 1,
-0.5369596, -0.6872079, -4.738398, 0.282353, 1, 0, 1,
-0.5331538, -1.109563, -2.648441, 0.2784314, 1, 0, 1,
-0.5309588, 0.1246414, -1.185102, 0.2705882, 1, 0, 1,
-0.530065, 0.364459, -1.319317, 0.2666667, 1, 0, 1,
-0.5243611, 1.933168, 1.973232, 0.2588235, 1, 0, 1,
-0.5227957, -0.08686078, -1.697447, 0.254902, 1, 0, 1,
-0.5216241, 0.2635398, -1.088822, 0.2470588, 1, 0, 1,
-0.5200922, 0.4865245, -0.9765493, 0.2431373, 1, 0, 1,
-0.5182847, -0.7437475, -2.379375, 0.2352941, 1, 0, 1,
-0.5163856, 0.3577002, 0.1265126, 0.2313726, 1, 0, 1,
-0.5142755, -0.3780342, -1.471501, 0.2235294, 1, 0, 1,
-0.5082651, -1.502604, -2.57039, 0.2196078, 1, 0, 1,
-0.4985394, 0.6921104, -0.2622991, 0.2117647, 1, 0, 1,
-0.4967307, -1.582983, -1.944308, 0.2078431, 1, 0, 1,
-0.4882947, 0.8796347, -0.5575179, 0.2, 1, 0, 1,
-0.4880541, 0.002655763, -1.53675, 0.1921569, 1, 0, 1,
-0.4839336, -1.273625, -2.787413, 0.1882353, 1, 0, 1,
-0.4774001, -1.368577, -3.294822, 0.1803922, 1, 0, 1,
-0.4757479, -0.6194692, -3.965706, 0.1764706, 1, 0, 1,
-0.4656735, 0.3216666, 1.05475, 0.1686275, 1, 0, 1,
-0.4655316, -1.322113, -2.100601, 0.1647059, 1, 0, 1,
-0.4648888, 0.1834221, -0.2065323, 0.1568628, 1, 0, 1,
-0.4622658, 0.7467563, -0.6230165, 0.1529412, 1, 0, 1,
-0.4620725, -2.155736, -2.410453, 0.145098, 1, 0, 1,
-0.4526228, 0.0709745, -1.473855, 0.1411765, 1, 0, 1,
-0.4514211, 0.5579835, -2.327871, 0.1333333, 1, 0, 1,
-0.4489684, 0.1490819, -1.02581, 0.1294118, 1, 0, 1,
-0.4456049, 2.837764, -0.3410937, 0.1215686, 1, 0, 1,
-0.4438729, 0.3638645, -1.528583, 0.1176471, 1, 0, 1,
-0.4423684, 0.07876144, -2.425591, 0.1098039, 1, 0, 1,
-0.4418726, 1.6266, 0.1527788, 0.1058824, 1, 0, 1,
-0.4417586, -0.2719708, -0.663922, 0.09803922, 1, 0, 1,
-0.4400648, -0.3314101, -2.053023, 0.09019608, 1, 0, 1,
-0.4394856, -2.035351, -3.567397, 0.08627451, 1, 0, 1,
-0.4386518, -0.9140146, -2.992188, 0.07843138, 1, 0, 1,
-0.4376259, 0.3329136, -0.3418996, 0.07450981, 1, 0, 1,
-0.4329328, 1.392852, -0.7918665, 0.06666667, 1, 0, 1,
-0.4317044, -0.01072151, -0.0531538, 0.0627451, 1, 0, 1,
-0.4303217, -0.8818854, -3.259289, 0.05490196, 1, 0, 1,
-0.422735, 0.02212336, -0.9510133, 0.05098039, 1, 0, 1,
-0.4200237, 0.9089968, -0.04575045, 0.04313726, 1, 0, 1,
-0.4191583, -1.278846, -1.781255, 0.03921569, 1, 0, 1,
-0.4093899, -0.9467382, -1.568145, 0.03137255, 1, 0, 1,
-0.409249, 0.1750272, -0.6111648, 0.02745098, 1, 0, 1,
-0.4051367, 0.136093, -1.9184, 0.01960784, 1, 0, 1,
-0.4014005, 1.202271, 0.1664335, 0.01568628, 1, 0, 1,
-0.4005411, -0.094491, -1.92046, 0.007843138, 1, 0, 1,
-0.3924241, 0.5338296, -0.4797366, 0.003921569, 1, 0, 1,
-0.3922399, 1.603193, -0.6388921, 0, 1, 0.003921569, 1,
-0.3916211, -0.9013909, -2.473851, 0, 1, 0.01176471, 1,
-0.3884656, -0.9337556, -1.334826, 0, 1, 0.01568628, 1,
-0.3863736, 0.3240024, -0.7440876, 0, 1, 0.02352941, 1,
-0.3858465, -1.410466, -3.044814, 0, 1, 0.02745098, 1,
-0.3845999, 0.1942232, 0.3278306, 0, 1, 0.03529412, 1,
-0.3838927, -1.117746, -3.061383, 0, 1, 0.03921569, 1,
-0.3796138, 0.0001695865, -1.809033, 0, 1, 0.04705882, 1,
-0.3741107, -1.202195, -3.792141, 0, 1, 0.05098039, 1,
-0.3740712, 0.2585646, -0.4537399, 0, 1, 0.05882353, 1,
-0.3729473, 0.5378231, -0.3697466, 0, 1, 0.0627451, 1,
-0.371473, 0.6148541, 0.8013126, 0, 1, 0.07058824, 1,
-0.3593197, -0.7969891, -0.8226709, 0, 1, 0.07450981, 1,
-0.3588395, 0.01848317, 1.533269, 0, 1, 0.08235294, 1,
-0.3587461, -0.9788363, -2.4928, 0, 1, 0.08627451, 1,
-0.3583121, 1.211306, -0.7792541, 0, 1, 0.09411765, 1,
-0.3562042, 0.02309612, -0.5850426, 0, 1, 0.1019608, 1,
-0.3500905, 1.107632, -0.4994906, 0, 1, 0.1058824, 1,
-0.3494947, -0.1334921, -1.113366, 0, 1, 0.1137255, 1,
-0.3435047, -0.1749952, -3.232768, 0, 1, 0.1176471, 1,
-0.3433816, 0.2734517, -0.2743925, 0, 1, 0.1254902, 1,
-0.3422236, 0.0515384, -0.7957107, 0, 1, 0.1294118, 1,
-0.341603, 0.2916381, -1.907216, 0, 1, 0.1372549, 1,
-0.3338154, -1.714596, -3.401996, 0, 1, 0.1411765, 1,
-0.3331791, -0.3670689, -2.175087, 0, 1, 0.1490196, 1,
-0.3304051, -1.510756, -3.089785, 0, 1, 0.1529412, 1,
-0.3293561, -0.673938, -3.162131, 0, 1, 0.1607843, 1,
-0.3292615, -2.730663, -3.187667, 0, 1, 0.1647059, 1,
-0.3221062, 0.2256806, -0.3215131, 0, 1, 0.172549, 1,
-0.32178, 0.2849136, -1.069795, 0, 1, 0.1764706, 1,
-0.3210895, -0.4408136, -3.100395, 0, 1, 0.1843137, 1,
-0.319224, -0.7253467, -3.00101, 0, 1, 0.1882353, 1,
-0.3165929, -1.537308, -3.062857, 0, 1, 0.1960784, 1,
-0.3154603, -1.743919, -2.462099, 0, 1, 0.2039216, 1,
-0.3142793, -0.3539132, -1.054253, 0, 1, 0.2078431, 1,
-0.3115768, 2.048499, -1.086991, 0, 1, 0.2156863, 1,
-0.3115095, 2.361525, -0.2747473, 0, 1, 0.2196078, 1,
-0.3091986, 2.17007, 0.307245, 0, 1, 0.227451, 1,
-0.3038719, 0.6546679, -0.343963, 0, 1, 0.2313726, 1,
-0.2984589, -0.9389881, -3.974445, 0, 1, 0.2392157, 1,
-0.2981297, -0.8630159, -1.289714, 0, 1, 0.2431373, 1,
-0.2971002, 0.03231963, -2.332137, 0, 1, 0.2509804, 1,
-0.2964256, -1.820893, -0.2534324, 0, 1, 0.254902, 1,
-0.2946232, 0.5342759, -1.157501, 0, 1, 0.2627451, 1,
-0.2942487, -0.8875793, -3.070235, 0, 1, 0.2666667, 1,
-0.2922632, -0.4977726, -3.566722, 0, 1, 0.2745098, 1,
-0.2918173, 1.532914, 1.566858, 0, 1, 0.2784314, 1,
-0.2891226, -0.3729684, -2.601496, 0, 1, 0.2862745, 1,
-0.2885689, -0.05474072, -0.7165624, 0, 1, 0.2901961, 1,
-0.2875051, 0.1369887, -1.640625, 0, 1, 0.2980392, 1,
-0.2851252, 0.3696006, -2.470848, 0, 1, 0.3058824, 1,
-0.2847739, -0.1497417, -1.937263, 0, 1, 0.3098039, 1,
-0.2820036, 2.105268, -0.6795181, 0, 1, 0.3176471, 1,
-0.2806533, -0.3841852, -2.022253, 0, 1, 0.3215686, 1,
-0.2796675, 0.160643, 0.5043167, 0, 1, 0.3294118, 1,
-0.2741468, -0.3551015, -3.481984, 0, 1, 0.3333333, 1,
-0.2735543, -1.250221, -2.450989, 0, 1, 0.3411765, 1,
-0.2732711, 0.133446, -2.948731, 0, 1, 0.345098, 1,
-0.26836, 2.033666, -2.263366, 0, 1, 0.3529412, 1,
-0.2650056, 0.4305747, -0.2393796, 0, 1, 0.3568628, 1,
-0.2612867, -0.1749308, -2.404862, 0, 1, 0.3647059, 1,
-0.2599142, 0.7388481, -1.26131, 0, 1, 0.3686275, 1,
-0.2588881, -0.5516814, -1.876441, 0, 1, 0.3764706, 1,
-0.2577585, -0.7250146, -2.232039, 0, 1, 0.3803922, 1,
-0.2487011, -0.2949959, -1.317274, 0, 1, 0.3882353, 1,
-0.246657, 1.771098, -1.943671, 0, 1, 0.3921569, 1,
-0.2429491, -1.217556, -3.291192, 0, 1, 0.4, 1,
-0.2395507, -0.3596393, -2.862159, 0, 1, 0.4078431, 1,
-0.2386988, 0.6982921, -1.266874, 0, 1, 0.4117647, 1,
-0.2340353, -1.003047, -2.346029, 0, 1, 0.4196078, 1,
-0.2328441, 0.03873516, -2.143877, 0, 1, 0.4235294, 1,
-0.232352, 0.5371516, -1.953731, 0, 1, 0.4313726, 1,
-0.230133, -0.2952619, -2.327159, 0, 1, 0.4352941, 1,
-0.2289057, -2.013588, -2.460409, 0, 1, 0.4431373, 1,
-0.2205138, -0.1261081, -2.629456, 0, 1, 0.4470588, 1,
-0.2175965, 0.2517, -1.24031, 0, 1, 0.454902, 1,
-0.2168856, 0.5929228, -1.380173, 0, 1, 0.4588235, 1,
-0.2118413, -0.5174884, -1.184855, 0, 1, 0.4666667, 1,
-0.2097972, 0.1273343, -0.2312818, 0, 1, 0.4705882, 1,
-0.2092581, 1.468207, -0.1097513, 0, 1, 0.4784314, 1,
-0.2091729, 1.158361, -0.1202166, 0, 1, 0.4823529, 1,
-0.2063609, 0.5280384, 0.1751431, 0, 1, 0.4901961, 1,
-0.2015471, 1.50557, 0.6468551, 0, 1, 0.4941176, 1,
-0.1933528, 0.619727, -1.257981, 0, 1, 0.5019608, 1,
-0.1908678, 0.04879751, 1.078094, 0, 1, 0.509804, 1,
-0.1900734, -0.09628072, -0.1735374, 0, 1, 0.5137255, 1,
-0.1876562, 0.7592121, -0.7517414, 0, 1, 0.5215687, 1,
-0.1871642, -1.646661, -3.894038, 0, 1, 0.5254902, 1,
-0.1792122, 1.02403, 0.6398408, 0, 1, 0.5333334, 1,
-0.1739784, -0.1814135, -2.054743, 0, 1, 0.5372549, 1,
-0.1719184, 0.3224064, -1.195718, 0, 1, 0.5450981, 1,
-0.1591922, 0.3448105, -1.876844, 0, 1, 0.5490196, 1,
-0.15763, -0.01403808, -1.269809, 0, 1, 0.5568628, 1,
-0.1544642, 1.300363, 0.5564876, 0, 1, 0.5607843, 1,
-0.151791, -2.27122, -2.538495, 0, 1, 0.5686275, 1,
-0.1496094, 1.352084, -1.124528, 0, 1, 0.572549, 1,
-0.1494405, -1.364644, -2.295423, 0, 1, 0.5803922, 1,
-0.1492346, -0.8372922, -1.617918, 0, 1, 0.5843138, 1,
-0.1479799, 0.3253057, -1.571767, 0, 1, 0.5921569, 1,
-0.1421285, -0.5439579, -3.179148, 0, 1, 0.5960785, 1,
-0.139704, 1.338417, -0.5445191, 0, 1, 0.6039216, 1,
-0.1328622, -0.1644482, -2.046983, 0, 1, 0.6117647, 1,
-0.1321371, 0.6802726, -1.045436, 0, 1, 0.6156863, 1,
-0.1321202, -0.8431808, -3.642537, 0, 1, 0.6235294, 1,
-0.1303613, -0.1924018, -2.227203, 0, 1, 0.627451, 1,
-0.1292545, -0.345648, -3.633077, 0, 1, 0.6352941, 1,
-0.1285991, 0.8945789, -1.435781, 0, 1, 0.6392157, 1,
-0.1270422, -1.032777, -2.437737, 0, 1, 0.6470588, 1,
-0.1268256, 0.1313863, -1.913553, 0, 1, 0.6509804, 1,
-0.1252073, 1.143998, -1.706633, 0, 1, 0.6588235, 1,
-0.122518, -0.2669599, -3.433983, 0, 1, 0.6627451, 1,
-0.121878, 0.004759261, 0.1979991, 0, 1, 0.6705883, 1,
-0.1218652, -0.1623899, -1.55914, 0, 1, 0.6745098, 1,
-0.1217268, -1.262227, -5.436385, 0, 1, 0.682353, 1,
-0.1210036, 0.1036648, -2.18794, 0, 1, 0.6862745, 1,
-0.1197221, -1.703457, -1.541782, 0, 1, 0.6941177, 1,
-0.1163816, -0.04669831, -2.353646, 0, 1, 0.7019608, 1,
-0.1155867, 0.6508253, 0.05065269, 0, 1, 0.7058824, 1,
-0.1155704, -1.542957, -2.922528, 0, 1, 0.7137255, 1,
-0.105085, 0.4056624, -0.3346143, 0, 1, 0.7176471, 1,
-0.1047585, 0.9276293, 0.1508856, 0, 1, 0.7254902, 1,
-0.101769, -0.8400319, -2.486367, 0, 1, 0.7294118, 1,
-0.100787, 0.04961079, -2.12251, 0, 1, 0.7372549, 1,
-0.09985982, -0.2987667, -3.106997, 0, 1, 0.7411765, 1,
-0.09713288, 0.4052285, -0.06447303, 0, 1, 0.7490196, 1,
-0.09643593, 1.824165, -1.024191, 0, 1, 0.7529412, 1,
-0.09604553, -1.57682, -3.270903, 0, 1, 0.7607843, 1,
-0.09392978, 1.223325, -2.395324, 0, 1, 0.7647059, 1,
-0.0931922, 0.7727637, -0.05498776, 0, 1, 0.772549, 1,
-0.08057254, 0.4671411, -1.058028, 0, 1, 0.7764706, 1,
-0.07808023, -0.1689492, -3.064671, 0, 1, 0.7843137, 1,
-0.0763174, -0.9477162, -1.817374, 0, 1, 0.7882353, 1,
-0.07415679, -0.2216502, -1.955489, 0, 1, 0.7960784, 1,
-0.07373235, 0.9305347, 1.155466, 0, 1, 0.8039216, 1,
-0.0622909, -0.8959614, -3.025849, 0, 1, 0.8078431, 1,
-0.05891004, 0.06464262, 0.4047954, 0, 1, 0.8156863, 1,
-0.05745842, -0.7107642, -2.199231, 0, 1, 0.8196079, 1,
-0.05117617, 0.1944278, -0.5015838, 0, 1, 0.827451, 1,
-0.05033187, -1.512426, -2.250781, 0, 1, 0.8313726, 1,
-0.0502859, 0.09811581, 0.6297688, 0, 1, 0.8392157, 1,
-0.04498659, -0.1445191, -2.675071, 0, 1, 0.8431373, 1,
-0.04301792, -1.709064, -3.014831, 0, 1, 0.8509804, 1,
-0.04086087, 3.699677, 0.9385102, 0, 1, 0.854902, 1,
-0.03461245, -1.960618, -2.46332, 0, 1, 0.8627451, 1,
-0.03215646, -1.800969, -4.785293, 0, 1, 0.8666667, 1,
-0.03038704, 0.4315041, 0.4470711, 0, 1, 0.8745098, 1,
-0.02162555, 0.8352436, 1.26202, 0, 1, 0.8784314, 1,
-0.0155535, 0.03202093, -0.03860775, 0, 1, 0.8862745, 1,
-0.014664, 1.646684, 0.3827209, 0, 1, 0.8901961, 1,
-0.01137901, -0.4946312, -3.736331, 0, 1, 0.8980392, 1,
-0.01037416, -0.3348843, -3.816629, 0, 1, 0.9058824, 1,
-0.00419147, 0.6781697, -0.523411, 0, 1, 0.9098039, 1,
-0.003721529, 0.5363906, 0.05084782, 0, 1, 0.9176471, 1,
0.001379924, 0.4413072, 0.1670065, 0, 1, 0.9215686, 1,
0.002387527, 1.587329, 0.6482989, 0, 1, 0.9294118, 1,
0.002977795, -0.2545594, 2.783842, 0, 1, 0.9333333, 1,
0.006839313, 0.3709613, 0.08245613, 0, 1, 0.9411765, 1,
0.007116077, 1.35411, -1.359698, 0, 1, 0.945098, 1,
0.0121216, -0.5001784, 5.015704, 0, 1, 0.9529412, 1,
0.01815686, 2.373996, -0.2438091, 0, 1, 0.9568627, 1,
0.02839848, 0.5617366, 0.2299554, 0, 1, 0.9647059, 1,
0.03133765, -0.8926972, 1.084852, 0, 1, 0.9686275, 1,
0.03436867, 1.223396, -0.5474727, 0, 1, 0.9764706, 1,
0.03806427, -0.2540535, 0.546215, 0, 1, 0.9803922, 1,
0.04749503, -0.1500626, 1.542729, 0, 1, 0.9882353, 1,
0.05370956, -2.902392, 3.46955, 0, 1, 0.9921569, 1,
0.05598008, 0.1718248, 0.09483767, 0, 1, 1, 1,
0.05612112, -0.3144968, 4.057335, 0, 0.9921569, 1, 1,
0.06022791, 0.7133961, -0.6631083, 0, 0.9882353, 1, 1,
0.06206075, -1.135929, 3.170893, 0, 0.9803922, 1, 1,
0.06250218, -0.2774435, 1.238021, 0, 0.9764706, 1, 1,
0.06280304, -0.389483, 0.3998773, 0, 0.9686275, 1, 1,
0.07600115, -1.276404, 3.884618, 0, 0.9647059, 1, 1,
0.07740998, 1.06319, 0.9238718, 0, 0.9568627, 1, 1,
0.08028276, -1.519537, 2.486054, 0, 0.9529412, 1, 1,
0.08118535, -0.9032213, 2.433061, 0, 0.945098, 1, 1,
0.08242314, -0.3896934, 1.48313, 0, 0.9411765, 1, 1,
0.08428574, 2.193073, 2.233355, 0, 0.9333333, 1, 1,
0.08600225, -0.9104646, 2.917789, 0, 0.9294118, 1, 1,
0.09033106, 0.946456, 0.856216, 0, 0.9215686, 1, 1,
0.09145015, 0.4096954, -0.5346978, 0, 0.9176471, 1, 1,
0.09394886, 0.7467243, -0.5605338, 0, 0.9098039, 1, 1,
0.09401175, 0.1992148, 0.6494002, 0, 0.9058824, 1, 1,
0.09498867, 0.160163, -0.3192339, 0, 0.8980392, 1, 1,
0.09538444, -0.6724309, 3.430305, 0, 0.8901961, 1, 1,
0.09539504, -2.127982, 2.446551, 0, 0.8862745, 1, 1,
0.09668204, 1.16335, -1.793444, 0, 0.8784314, 1, 1,
0.09795745, 1.089291, 0.5461048, 0, 0.8745098, 1, 1,
0.09889805, -0.407938, 4.332217, 0, 0.8666667, 1, 1,
0.0999418, -0.04970629, 2.683333, 0, 0.8627451, 1, 1,
0.1035134, 0.104183, -1.179496, 0, 0.854902, 1, 1,
0.1066481, -0.8924661, 3.388402, 0, 0.8509804, 1, 1,
0.1084085, -0.3442259, 2.451874, 0, 0.8431373, 1, 1,
0.1087704, -0.7823691, 2.650902, 0, 0.8392157, 1, 1,
0.1108612, -0.1136747, 2.974383, 0, 0.8313726, 1, 1,
0.1125603, 2.407542, -0.8441243, 0, 0.827451, 1, 1,
0.1143457, 1.852074, 0.2268486, 0, 0.8196079, 1, 1,
0.1186004, -0.04663159, 1.178753, 0, 0.8156863, 1, 1,
0.121916, -1.435099, 2.547291, 0, 0.8078431, 1, 1,
0.1226838, -1.334741, 4.212976, 0, 0.8039216, 1, 1,
0.1248927, 1.067311, 1.345627, 0, 0.7960784, 1, 1,
0.1329371, 1.053784, -0.4972871, 0, 0.7882353, 1, 1,
0.1341436, -0.8769686, 3.403898, 0, 0.7843137, 1, 1,
0.1354236, 1.451999, 1.613677, 0, 0.7764706, 1, 1,
0.1357223, 0.4543723, 1.2775, 0, 0.772549, 1, 1,
0.1358921, -0.2734274, 2.900749, 0, 0.7647059, 1, 1,
0.1359579, -1.187767, 2.696853, 0, 0.7607843, 1, 1,
0.1370429, -0.5417934, 3.070029, 0, 0.7529412, 1, 1,
0.1481905, -0.2451154, 3.192991, 0, 0.7490196, 1, 1,
0.1584031, 0.1905513, 2.016643, 0, 0.7411765, 1, 1,
0.1586389, -1.238716, 5.00567, 0, 0.7372549, 1, 1,
0.1652888, 1.204106, -0.06276003, 0, 0.7294118, 1, 1,
0.1653847, 0.8192084, 0.7469667, 0, 0.7254902, 1, 1,
0.1669232, -1.050576, 3.238372, 0, 0.7176471, 1, 1,
0.1695707, 0.5270014, -0.2138669, 0, 0.7137255, 1, 1,
0.1713639, -1.563157, 1.896638, 0, 0.7058824, 1, 1,
0.1719557, -0.07672139, 2.835812, 0, 0.6980392, 1, 1,
0.1746733, -0.1565071, 3.4331, 0, 0.6941177, 1, 1,
0.1752032, 1.412221, -0.4755795, 0, 0.6862745, 1, 1,
0.1794448, 0.6356497, 3.593246, 0, 0.682353, 1, 1,
0.1795041, -0.1976929, 3.247801, 0, 0.6745098, 1, 1,
0.1843828, 0.1547834, 0.3134935, 0, 0.6705883, 1, 1,
0.189771, -0.13986, 2.498024, 0, 0.6627451, 1, 1,
0.1903742, -0.264972, 0.6637113, 0, 0.6588235, 1, 1,
0.198324, 1.112913, -1.149458, 0, 0.6509804, 1, 1,
0.1991597, 0.8310886, 1.715833, 0, 0.6470588, 1, 1,
0.2014586, 0.6150789, 1.222376, 0, 0.6392157, 1, 1,
0.2020134, -0.1001217, 2.498869, 0, 0.6352941, 1, 1,
0.2025254, 0.597341, -0.2932262, 0, 0.627451, 1, 1,
0.2063113, 0.06861275, 0.2991716, 0, 0.6235294, 1, 1,
0.2104381, -0.3992683, 2.266546, 0, 0.6156863, 1, 1,
0.2247602, -0.7620549, 3.314855, 0, 0.6117647, 1, 1,
0.2250496, -0.2052992, 2.103894, 0, 0.6039216, 1, 1,
0.2256158, 0.159312, -0.1457983, 0, 0.5960785, 1, 1,
0.228348, -0.221452, 2.836711, 0, 0.5921569, 1, 1,
0.2353806, 0.4910028, 1.33546, 0, 0.5843138, 1, 1,
0.2360275, 0.7154116, -1.134892, 0, 0.5803922, 1, 1,
0.238488, 0.6500635, 2.022622, 0, 0.572549, 1, 1,
0.2449014, 0.4319698, 0.3475167, 0, 0.5686275, 1, 1,
0.2462214, 1.601856, -0.394706, 0, 0.5607843, 1, 1,
0.2464851, 1.666682, 0.3809228, 0, 0.5568628, 1, 1,
0.2468017, -0.1252344, 0.8584477, 0, 0.5490196, 1, 1,
0.2515755, 1.190933, 0.51678, 0, 0.5450981, 1, 1,
0.2542709, -0.9309632, 1.252537, 0, 0.5372549, 1, 1,
0.2545138, 1.613287, 0.9676838, 0, 0.5333334, 1, 1,
0.255007, 0.319525, 0.01440307, 0, 0.5254902, 1, 1,
0.255013, -0.1319974, 3.114767, 0, 0.5215687, 1, 1,
0.255284, -0.05633471, 2.799699, 0, 0.5137255, 1, 1,
0.2581255, 0.4562608, 1.636693, 0, 0.509804, 1, 1,
0.2600913, 0.6099099, 1.570746, 0, 0.5019608, 1, 1,
0.260353, 1.205584, -0.5786697, 0, 0.4941176, 1, 1,
0.265449, 1.078241, -1.251087, 0, 0.4901961, 1, 1,
0.2702468, -0.4295231, 1.947488, 0, 0.4823529, 1, 1,
0.2743272, 1.27227, 0.3577391, 0, 0.4784314, 1, 1,
0.2754157, 1.317703, 0.001856133, 0, 0.4705882, 1, 1,
0.2791879, 1.156759, 0.880654, 0, 0.4666667, 1, 1,
0.2854821, 0.5316455, 1.067654, 0, 0.4588235, 1, 1,
0.285789, -0.141449, 2.215867, 0, 0.454902, 1, 1,
0.2872554, -1.646052, 3.662834, 0, 0.4470588, 1, 1,
0.2880903, -0.642879, 3.488746, 0, 0.4431373, 1, 1,
0.3032017, 0.3594549, 1.583558, 0, 0.4352941, 1, 1,
0.3047608, -0.9968461, 3.790251, 0, 0.4313726, 1, 1,
0.3058355, -0.1561173, 2.833991, 0, 0.4235294, 1, 1,
0.3072629, -0.3109111, 2.265222, 0, 0.4196078, 1, 1,
0.3101097, 2.795928, 0.06683923, 0, 0.4117647, 1, 1,
0.3113723, -0.1966611, 0.8159794, 0, 0.4078431, 1, 1,
0.3114111, -0.2294414, 3.134188, 0, 0.4, 1, 1,
0.3120199, 0.01689913, 2.671965, 0, 0.3921569, 1, 1,
0.3120483, 0.08951189, -0.326615, 0, 0.3882353, 1, 1,
0.3130248, 1.308289, -0.3626636, 0, 0.3803922, 1, 1,
0.3151778, 1.015415, -0.4908244, 0, 0.3764706, 1, 1,
0.3166804, 1.120275, -1.084965, 0, 0.3686275, 1, 1,
0.3189769, 1.606644, -0.1681817, 0, 0.3647059, 1, 1,
0.3285322, -1.51925, 5.049839, 0, 0.3568628, 1, 1,
0.33559, 0.5291845, 0.436208, 0, 0.3529412, 1, 1,
0.336293, -0.5590038, 2.871248, 0, 0.345098, 1, 1,
0.3383319, -0.6324431, 2.584212, 0, 0.3411765, 1, 1,
0.3416811, -0.05789633, 2.017505, 0, 0.3333333, 1, 1,
0.345425, -0.436456, 3.549037, 0, 0.3294118, 1, 1,
0.3479918, 0.4992165, -0.400493, 0, 0.3215686, 1, 1,
0.3535672, 0.4934243, 1.367106, 0, 0.3176471, 1, 1,
0.3545753, -0.6978152, 2.349452, 0, 0.3098039, 1, 1,
0.3599759, 0.07488555, 1.819227, 0, 0.3058824, 1, 1,
0.3603901, -0.460077, 2.009742, 0, 0.2980392, 1, 1,
0.3631623, -0.5582328, 1.730298, 0, 0.2901961, 1, 1,
0.3650609, -1.541912, 3.479277, 0, 0.2862745, 1, 1,
0.3664065, -0.5421115, 2.771879, 0, 0.2784314, 1, 1,
0.3681655, -0.5619974, 3.122257, 0, 0.2745098, 1, 1,
0.3698466, 1.360054, 2.282012, 0, 0.2666667, 1, 1,
0.3745713, -1.010007, 1.86785, 0, 0.2627451, 1, 1,
0.3746051, 0.3633822, -0.4693432, 0, 0.254902, 1, 1,
0.3760329, -0.776335, 2.421065, 0, 0.2509804, 1, 1,
0.3793481, 0.7333115, 0.4790747, 0, 0.2431373, 1, 1,
0.3794959, -0.7678639, 2.910115, 0, 0.2392157, 1, 1,
0.3866198, 0.3337015, 3.1149, 0, 0.2313726, 1, 1,
0.3919926, 0.281727, 2.146394, 0, 0.227451, 1, 1,
0.3978825, -0.2763258, 3.285585, 0, 0.2196078, 1, 1,
0.4019266, 1.09968, 0.8840394, 0, 0.2156863, 1, 1,
0.4037347, 0.4008583, 2.071417, 0, 0.2078431, 1, 1,
0.4043804, 1.561405, 0.1748358, 0, 0.2039216, 1, 1,
0.4088398, -2.002369, 2.224893, 0, 0.1960784, 1, 1,
0.4123402, -0.4128798, 3.835306, 0, 0.1882353, 1, 1,
0.4125231, -0.09171094, -0.3922433, 0, 0.1843137, 1, 1,
0.4161548, 0.1605967, 1.015721, 0, 0.1764706, 1, 1,
0.4178856, -0.4799181, 2.487846, 0, 0.172549, 1, 1,
0.4211722, -0.604497, 3.336214, 0, 0.1647059, 1, 1,
0.4222231, -1.105041, 2.80024, 0, 0.1607843, 1, 1,
0.4229609, -0.4456654, 1.896764, 0, 0.1529412, 1, 1,
0.426133, 1.176645, 1.714566, 0, 0.1490196, 1, 1,
0.4312764, -0.9930509, 3.462306, 0, 0.1411765, 1, 1,
0.4319022, 2.020662, 1.422011, 0, 0.1372549, 1, 1,
0.43451, 0.97807, -0.509308, 0, 0.1294118, 1, 1,
0.4392172, -0.8326843, 0.8642157, 0, 0.1254902, 1, 1,
0.4409664, -0.3783305, 1.506421, 0, 0.1176471, 1, 1,
0.4502536, 1.159169, 0.7508033, 0, 0.1137255, 1, 1,
0.4517632, -1.926671, 2.87812, 0, 0.1058824, 1, 1,
0.4540929, -0.3205933, 1.83747, 0, 0.09803922, 1, 1,
0.4554215, 1.496131, 1.476112, 0, 0.09411765, 1, 1,
0.4672295, 0.1253879, 1.144466, 0, 0.08627451, 1, 1,
0.4698721, -1.091331, 3.565105, 0, 0.08235294, 1, 1,
0.4715071, -0.3017808, -0.04344611, 0, 0.07450981, 1, 1,
0.4752716, 0.3577985, 2.145632, 0, 0.07058824, 1, 1,
0.477472, -0.0752379, 1.453182, 0, 0.0627451, 1, 1,
0.4780216, -1.118594, 0.2169036, 0, 0.05882353, 1, 1,
0.4846156, 0.5979429, 0.3156704, 0, 0.05098039, 1, 1,
0.4859092, -0.4991384, 2.292193, 0, 0.04705882, 1, 1,
0.4866916, -0.7612988, 3.236719, 0, 0.03921569, 1, 1,
0.4918958, -0.1789389, 4.022019, 0, 0.03529412, 1, 1,
0.4925227, -0.7308374, 0.6640615, 0, 0.02745098, 1, 1,
0.4931498, 2.247986, -1.148945, 0, 0.02352941, 1, 1,
0.5017815, -0.8484952, 1.707801, 0, 0.01568628, 1, 1,
0.5031159, -0.9835489, 4.005893, 0, 0.01176471, 1, 1,
0.5066966, 2.191337, 0.254456, 0, 0.003921569, 1, 1,
0.5082853, -0.1382208, 3.813254, 0.003921569, 0, 1, 1,
0.5089725, -1.136989, 4.086351, 0.007843138, 0, 1, 1,
0.5116431, 0.5234966, -0.1371617, 0.01568628, 0, 1, 1,
0.5132676, -0.6609599, 2.516334, 0.01960784, 0, 1, 1,
0.516404, -0.2731294, 3.200065, 0.02745098, 0, 1, 1,
0.5183352, 0.1115448, -0.1698093, 0.03137255, 0, 1, 1,
0.5215788, 0.370878, -0.7409313, 0.03921569, 0, 1, 1,
0.5239975, -0.3472814, 1.294802, 0.04313726, 0, 1, 1,
0.5253211, 0.1534441, 0.6489856, 0.05098039, 0, 1, 1,
0.526738, 0.7334536, 0.9862232, 0.05490196, 0, 1, 1,
0.527178, -0.9748511, 2.287282, 0.0627451, 0, 1, 1,
0.5307164, -0.4806138, 2.797067, 0.06666667, 0, 1, 1,
0.5331802, -1.00527, 1.813743, 0.07450981, 0, 1, 1,
0.5334011, 1.081527, -0.7020445, 0.07843138, 0, 1, 1,
0.5337792, -0.6847996, 2.929425, 0.08627451, 0, 1, 1,
0.5338209, -1.051832, 3.894041, 0.09019608, 0, 1, 1,
0.5338262, 0.7160699, -0.2609814, 0.09803922, 0, 1, 1,
0.5365204, 2.027658, 1.546576, 0.1058824, 0, 1, 1,
0.5460251, 1.873333, 1.504416, 0.1098039, 0, 1, 1,
0.5496064, -0.1747403, 0.7431822, 0.1176471, 0, 1, 1,
0.5532367, 1.011026, 0.8711647, 0.1215686, 0, 1, 1,
0.5540405, -0.1792221, 3.208463, 0.1294118, 0, 1, 1,
0.5550995, -0.1016448, 1.675349, 0.1333333, 0, 1, 1,
0.5571367, -0.6684798, 0.9226733, 0.1411765, 0, 1, 1,
0.5678241, -0.03616726, 3.320342, 0.145098, 0, 1, 1,
0.5709228, -0.9933083, 1.854104, 0.1529412, 0, 1, 1,
0.5743944, -0.227868, 1.396719, 0.1568628, 0, 1, 1,
0.5815346, -0.9634183, 3.405111, 0.1647059, 0, 1, 1,
0.5816099, -1.761378, 2.347728, 0.1686275, 0, 1, 1,
0.5840194, 0.2790234, 0.6540976, 0.1764706, 0, 1, 1,
0.5875901, -0.5685194, 3.283589, 0.1803922, 0, 1, 1,
0.5901434, -0.3582112, 0.4326711, 0.1882353, 0, 1, 1,
0.5907021, 0.236416, 0.4994206, 0.1921569, 0, 1, 1,
0.5914474, 0.08343043, 0.4762213, 0.2, 0, 1, 1,
0.5924601, 1.595313, 1.396735, 0.2078431, 0, 1, 1,
0.5945559, -1.781885, 2.482554, 0.2117647, 0, 1, 1,
0.5964215, 0.2865857, 0.297219, 0.2196078, 0, 1, 1,
0.5992826, 0.7287531, 0.003826872, 0.2235294, 0, 1, 1,
0.5998107, -0.1895335, 3.606738, 0.2313726, 0, 1, 1,
0.6028392, 1.244183, 1.224863, 0.2352941, 0, 1, 1,
0.607197, 0.3267427, 2.31921, 0.2431373, 0, 1, 1,
0.6271172, -0.9491751, 4.123654, 0.2470588, 0, 1, 1,
0.6283875, -0.3598209, 1.548843, 0.254902, 0, 1, 1,
0.6292729, 0.8895684, 1.370256, 0.2588235, 0, 1, 1,
0.6302291, 1.950433, -0.5442374, 0.2666667, 0, 1, 1,
0.6329919, -1.732994, 1.566013, 0.2705882, 0, 1, 1,
0.6359427, 0.1094307, 2.721524, 0.2784314, 0, 1, 1,
0.6368215, -1.350733, 1.639335, 0.282353, 0, 1, 1,
0.6382295, 0.6096669, 0.2767452, 0.2901961, 0, 1, 1,
0.639491, -0.7467878, 3.090358, 0.2941177, 0, 1, 1,
0.6411114, -0.5128934, 1.827292, 0.3019608, 0, 1, 1,
0.6444284, -0.2709452, 2.618008, 0.3098039, 0, 1, 1,
0.6522573, -0.8037742, 3.322923, 0.3137255, 0, 1, 1,
0.6544647, -0.1209226, 1.212845, 0.3215686, 0, 1, 1,
0.6610275, -1.587333, 3.601326, 0.3254902, 0, 1, 1,
0.6695311, 0.4498544, 1.685235, 0.3333333, 0, 1, 1,
0.6720614, 1.160961, 1.873949, 0.3372549, 0, 1, 1,
0.6729714, 0.8947219, -1.338527, 0.345098, 0, 1, 1,
0.6742579, 0.050532, 1.03475, 0.3490196, 0, 1, 1,
0.6756845, 0.1543379, 1.744414, 0.3568628, 0, 1, 1,
0.6769669, -0.5595188, 3.303101, 0.3607843, 0, 1, 1,
0.6795362, 2.340304, 2.596003, 0.3686275, 0, 1, 1,
0.6916322, -0.8152907, 2.444509, 0.372549, 0, 1, 1,
0.6992779, 0.4337046, 0.2777394, 0.3803922, 0, 1, 1,
0.7100327, -0.5757809, 2.556752, 0.3843137, 0, 1, 1,
0.7130423, -0.3852034, 1.803251, 0.3921569, 0, 1, 1,
0.7210052, 1.801113, 0.9960562, 0.3960784, 0, 1, 1,
0.7219307, 0.610213, 0.8751123, 0.4039216, 0, 1, 1,
0.7293096, -0.2598865, 1.089732, 0.4117647, 0, 1, 1,
0.7316383, 0.3354064, 2.537209, 0.4156863, 0, 1, 1,
0.7337117, -1.035646, 3.476928, 0.4235294, 0, 1, 1,
0.7352304, -0.99117, 2.206789, 0.427451, 0, 1, 1,
0.7379058, -0.003763374, 3.115845, 0.4352941, 0, 1, 1,
0.7391082, 0.02500444, 2.958461, 0.4392157, 0, 1, 1,
0.7407624, 1.084861, 0.7750749, 0.4470588, 0, 1, 1,
0.7424192, -3.108436, 1.840653, 0.4509804, 0, 1, 1,
0.7439673, 0.1342615, 1.531403, 0.4588235, 0, 1, 1,
0.7440682, -0.5728011, 1.729232, 0.4627451, 0, 1, 1,
0.7479736, -0.5539163, 1.470227, 0.4705882, 0, 1, 1,
0.7490301, 1.850516, 1.795019, 0.4745098, 0, 1, 1,
0.7516849, 0.08430992, 0.9652272, 0.4823529, 0, 1, 1,
0.7541975, -0.6524271, 1.50232, 0.4862745, 0, 1, 1,
0.7556165, -1.652262, 2.682652, 0.4941176, 0, 1, 1,
0.7583516, 0.8322241, -0.2640687, 0.5019608, 0, 1, 1,
0.7593964, -0.4707045, 2.762441, 0.5058824, 0, 1, 1,
0.7676741, 1.227942, 0.5208229, 0.5137255, 0, 1, 1,
0.7738576, -1.638466, 2.489165, 0.5176471, 0, 1, 1,
0.7738693, 1.900971, 1.645278, 0.5254902, 0, 1, 1,
0.7761169, 0.3631399, 1.48461, 0.5294118, 0, 1, 1,
0.7868936, 0.4129244, 1.162388, 0.5372549, 0, 1, 1,
0.7876357, -1.680311, 2.545003, 0.5411765, 0, 1, 1,
0.7879854, 1.583168, 1.073405, 0.5490196, 0, 1, 1,
0.7903911, -1.071561, 3.500506, 0.5529412, 0, 1, 1,
0.7917722, 0.3228329, 2.380248, 0.5607843, 0, 1, 1,
0.7934591, -0.8263795, -0.1776889, 0.5647059, 0, 1, 1,
0.8039132, 1.164817, -0.03192278, 0.572549, 0, 1, 1,
0.8076183, 0.7981969, 0.4978437, 0.5764706, 0, 1, 1,
0.8079755, -1.028172, 0.09324681, 0.5843138, 0, 1, 1,
0.8094473, -1.086709, 1.615927, 0.5882353, 0, 1, 1,
0.809526, 2.194396, 0.2745522, 0.5960785, 0, 1, 1,
0.8105589, -0.6773896, 1.776165, 0.6039216, 0, 1, 1,
0.812618, 2.345734, 1.592529, 0.6078432, 0, 1, 1,
0.8126962, -1.654452, 4.145626, 0.6156863, 0, 1, 1,
0.8131081, -1.067051, 2.060483, 0.6196079, 0, 1, 1,
0.8180894, 2.419279, -0.468754, 0.627451, 0, 1, 1,
0.8290851, 0.5617924, 0.1097505, 0.6313726, 0, 1, 1,
0.8308978, -1.328514, 2.696983, 0.6392157, 0, 1, 1,
0.8331075, 1.6552, -0.4162354, 0.6431373, 0, 1, 1,
0.836686, -1.527487, 1.417724, 0.6509804, 0, 1, 1,
0.840306, -0.2806443, 0.8543674, 0.654902, 0, 1, 1,
0.8556461, -1.3272, 2.1874, 0.6627451, 0, 1, 1,
0.856551, -0.3359121, 1.44722, 0.6666667, 0, 1, 1,
0.8746271, -0.4691548, 1.819972, 0.6745098, 0, 1, 1,
0.8778744, 1.777956, 0.5598665, 0.6784314, 0, 1, 1,
0.8946412, -0.2609691, 0.9988776, 0.6862745, 0, 1, 1,
0.8963627, 0.9942024, 1.250663, 0.6901961, 0, 1, 1,
0.897072, 1.039258, 2.116191, 0.6980392, 0, 1, 1,
0.898941, -0.04537492, 3.462098, 0.7058824, 0, 1, 1,
0.9067387, -1.144541, 3.345844, 0.7098039, 0, 1, 1,
0.9077216, 0.4698734, 1.17943, 0.7176471, 0, 1, 1,
0.9106109, 0.2519386, 0.9324405, 0.7215686, 0, 1, 1,
0.9128692, -1.474382, 1.630925, 0.7294118, 0, 1, 1,
0.9150711, 1.641322, 0.7348334, 0.7333333, 0, 1, 1,
0.9179337, 0.8810377, 0.5842003, 0.7411765, 0, 1, 1,
0.9193736, 0.605672, 2.056829, 0.7450981, 0, 1, 1,
0.921375, -0.3187577, 1.01861, 0.7529412, 0, 1, 1,
0.9251714, -2.037075, 2.83265, 0.7568628, 0, 1, 1,
0.9256151, 0.5827308, 0.6000992, 0.7647059, 0, 1, 1,
0.9337536, -0.9261633, 1.541231, 0.7686275, 0, 1, 1,
0.9358641, -0.8953298, 3.257223, 0.7764706, 0, 1, 1,
0.9386919, 0.6092861, 1.028373, 0.7803922, 0, 1, 1,
0.946635, 1.238702, -0.1266422, 0.7882353, 0, 1, 1,
0.9497918, -1.046965, 2.873756, 0.7921569, 0, 1, 1,
0.9506547, -0.4316294, 2.090005, 0.8, 0, 1, 1,
0.9531512, 0.1972437, 0.3191198, 0.8078431, 0, 1, 1,
0.9582901, 1.353652, 2.579817, 0.8117647, 0, 1, 1,
0.964918, 1.604702, 0.5623465, 0.8196079, 0, 1, 1,
0.9663697, 0.4628051, 0.441654, 0.8235294, 0, 1, 1,
0.9727743, 1.16156, 0.6624635, 0.8313726, 0, 1, 1,
0.9741071, -0.3060504, 0.03044294, 0.8352941, 0, 1, 1,
0.9784902, 1.702483, 1.136595, 0.8431373, 0, 1, 1,
0.9866989, -0.6917102, 2.702641, 0.8470588, 0, 1, 1,
0.98834, -0.8717678, 0.6913052, 0.854902, 0, 1, 1,
0.9885827, -1.335337, 2.682765, 0.8588235, 0, 1, 1,
0.9912516, 2.050818, -0.8862087, 0.8666667, 0, 1, 1,
0.9945861, -0.2050633, 0.8045607, 0.8705882, 0, 1, 1,
0.9957706, 1.560025, 1.766512, 0.8784314, 0, 1, 1,
0.9995427, 1.557735, -0.9088596, 0.8823529, 0, 1, 1,
1.000568, -2.157214, 3.394387, 0.8901961, 0, 1, 1,
1.00374, -1.246953, 3.500625, 0.8941177, 0, 1, 1,
1.005332, 0.2526778, 1.993887, 0.9019608, 0, 1, 1,
1.007325, -0.8612208, 0.9746854, 0.9098039, 0, 1, 1,
1.015696, 0.2255045, -0.1478396, 0.9137255, 0, 1, 1,
1.021374, 0.2067155, 1.467758, 0.9215686, 0, 1, 1,
1.022195, 0.6451943, 2.272816, 0.9254902, 0, 1, 1,
1.026259, -0.03803317, 2.08626, 0.9333333, 0, 1, 1,
1.02756, 0.1225462, 1.206168, 0.9372549, 0, 1, 1,
1.035143, -0.1371089, 2.053375, 0.945098, 0, 1, 1,
1.037258, 2.260429, 0.2805342, 0.9490196, 0, 1, 1,
1.045513, 1.052945, 0.06726384, 0.9568627, 0, 1, 1,
1.054036, -0.1603639, 0.9144292, 0.9607843, 0, 1, 1,
1.05446, 0.8739319, -1.051365, 0.9686275, 0, 1, 1,
1.057968, -1.403576, 3.361666, 0.972549, 0, 1, 1,
1.059684, -0.02269061, 1.120636, 0.9803922, 0, 1, 1,
1.060603, -0.1148208, 0.9665948, 0.9843137, 0, 1, 1,
1.062345, 0.4926107, 0.9851096, 0.9921569, 0, 1, 1,
1.062843, -0.2004321, 1.915139, 0.9960784, 0, 1, 1,
1.063054, -0.7415896, 0.3440158, 1, 0, 0.9960784, 1,
1.063271, 1.37729, 1.274448, 1, 0, 0.9882353, 1,
1.069661, -0.6539017, 2.284035, 1, 0, 0.9843137, 1,
1.070882, -0.391756, 1.533414, 1, 0, 0.9764706, 1,
1.075225, 0.96641, 1.545291, 1, 0, 0.972549, 1,
1.082616, -0.08204789, 2.224084, 1, 0, 0.9647059, 1,
1.08471, 0.01170285, 1.042284, 1, 0, 0.9607843, 1,
1.091091, -0.8657414, 1.98348, 1, 0, 0.9529412, 1,
1.094838, -0.9608716, 1.300757, 1, 0, 0.9490196, 1,
1.095037, 1.039168, 1.588121, 1, 0, 0.9411765, 1,
1.100798, 0.0738168, 1.339306, 1, 0, 0.9372549, 1,
1.101765, -1.129081, 2.375752, 1, 0, 0.9294118, 1,
1.10288, 1.256384, -0.3536261, 1, 0, 0.9254902, 1,
1.112399, 0.6908186, 1.226808, 1, 0, 0.9176471, 1,
1.116419, -0.1891452, 1.676868, 1, 0, 0.9137255, 1,
1.121007, -0.9090776, 1.072629, 1, 0, 0.9058824, 1,
1.126204, -0.9909149, 1.963688, 1, 0, 0.9019608, 1,
1.132271, -2.103855, 1.44077, 1, 0, 0.8941177, 1,
1.134929, 0.3722467, 2.685814, 1, 0, 0.8862745, 1,
1.16031, -0.1151, 3.71395, 1, 0, 0.8823529, 1,
1.194418, 1.769509, 0.3014171, 1, 0, 0.8745098, 1,
1.196381, -0.7909553, 2.387937, 1, 0, 0.8705882, 1,
1.203662, -0.1070544, 1.365149, 1, 0, 0.8627451, 1,
1.2037, 0.1677407, 2.37022, 1, 0, 0.8588235, 1,
1.204317, -0.7619262, 2.007315, 1, 0, 0.8509804, 1,
1.206704, 0.5561834, 1.365007, 1, 0, 0.8470588, 1,
1.210223, 1.231912, -0.5083863, 1, 0, 0.8392157, 1,
1.210949, 1.463983, -1.399134, 1, 0, 0.8352941, 1,
1.219385, -0.4568213, 1.797738, 1, 0, 0.827451, 1,
1.219398, 0.1477367, 0.5579302, 1, 0, 0.8235294, 1,
1.220149, -1.175387, 2.095459, 1, 0, 0.8156863, 1,
1.221879, 0.07783921, 0.9392099, 1, 0, 0.8117647, 1,
1.228779, 0.9575917, 0.3848253, 1, 0, 0.8039216, 1,
1.230409, -0.09814687, 1.07492, 1, 0, 0.7960784, 1,
1.232637, 1.602571, 0.09979355, 1, 0, 0.7921569, 1,
1.240007, 0.2135093, 0.8383384, 1, 0, 0.7843137, 1,
1.240312, -0.9520038, 1.150844, 1, 0, 0.7803922, 1,
1.25262, 0.4964413, 0.9301133, 1, 0, 0.772549, 1,
1.26705, 1.510422, 0.5748197, 1, 0, 0.7686275, 1,
1.278917, -0.5770748, 2.373168, 1, 0, 0.7607843, 1,
1.281966, -0.8152569, 1.482362, 1, 0, 0.7568628, 1,
1.286198, 0.1806039, 1.356033, 1, 0, 0.7490196, 1,
1.289553, 0.6738155, 1.941099, 1, 0, 0.7450981, 1,
1.292298, -0.3353696, 2.405114, 1, 0, 0.7372549, 1,
1.298835, 1.167645, -1.123398, 1, 0, 0.7333333, 1,
1.30495, 0.533309, 1.605352, 1, 0, 0.7254902, 1,
1.306744, -0.313315, 2.000443, 1, 0, 0.7215686, 1,
1.308523, -1.923482, 2.169999, 1, 0, 0.7137255, 1,
1.31759, -1.036256, 2.466462, 1, 0, 0.7098039, 1,
1.319916, -0.5706836, 1.180323, 1, 0, 0.7019608, 1,
1.324166, -0.2421128, 0.548529, 1, 0, 0.6941177, 1,
1.329591, -0.8490831, 2.747597, 1, 0, 0.6901961, 1,
1.332071, -0.35353, 1.214241, 1, 0, 0.682353, 1,
1.335827, -0.5370502, 1.823018, 1, 0, 0.6784314, 1,
1.339575, -1.251525, 1.228509, 1, 0, 0.6705883, 1,
1.343232, -1.789598, 2.881798, 1, 0, 0.6666667, 1,
1.34623, -0.1516769, 0.6980032, 1, 0, 0.6588235, 1,
1.347273, -0.4399711, 1.552006, 1, 0, 0.654902, 1,
1.358416, 0.3905956, 2.159131, 1, 0, 0.6470588, 1,
1.366982, -0.9575125, 3.031778, 1, 0, 0.6431373, 1,
1.370262, -0.02632495, 0.7066509, 1, 0, 0.6352941, 1,
1.374386, 0.1699481, 1.448444, 1, 0, 0.6313726, 1,
1.375752, -1.381791, 1.099902, 1, 0, 0.6235294, 1,
1.379791, -0.4103815, 1.714511, 1, 0, 0.6196079, 1,
1.383265, -0.3629249, 2.374318, 1, 0, 0.6117647, 1,
1.386249, 0.946031, 2.037303, 1, 0, 0.6078432, 1,
1.388124, -0.3850086, 2.226759, 1, 0, 0.6, 1,
1.393261, -0.3682768, 4.703482, 1, 0, 0.5921569, 1,
1.393558, -0.6367339, 2.091354, 1, 0, 0.5882353, 1,
1.394916, 1.699165, -0.1650498, 1, 0, 0.5803922, 1,
1.400454, 0.06295639, 2.478373, 1, 0, 0.5764706, 1,
1.401281, 1.654204, 1.461359, 1, 0, 0.5686275, 1,
1.41063, 0.01648135, 1.02708, 1, 0, 0.5647059, 1,
1.41312, 0.03801858, -0.2303692, 1, 0, 0.5568628, 1,
1.415025, 0.9164611, 0.6001774, 1, 0, 0.5529412, 1,
1.415894, 1.606654, 0.5338373, 1, 0, 0.5450981, 1,
1.416633, -1.701564, 2.997486, 1, 0, 0.5411765, 1,
1.422917, -0.1757217, 0.3944851, 1, 0, 0.5333334, 1,
1.432294, -1.750202, 2.18416, 1, 0, 0.5294118, 1,
1.437175, 0.1080098, 2.294253, 1, 0, 0.5215687, 1,
1.443529, -0.3023888, -0.05088994, 1, 0, 0.5176471, 1,
1.453512, -1.075747, 5.380968, 1, 0, 0.509804, 1,
1.453959, 0.7372325, 0.4163786, 1, 0, 0.5058824, 1,
1.458051, 0.4652134, 0.2052186, 1, 0, 0.4980392, 1,
1.466659, -0.2658811, 1.934377, 1, 0, 0.4901961, 1,
1.469541, -0.3727709, 4.648548, 1, 0, 0.4862745, 1,
1.473525, 0.2345821, 2.931882, 1, 0, 0.4784314, 1,
1.478399, -0.01071301, -2.095693, 1, 0, 0.4745098, 1,
1.482696, 0.9596146, 0.7496257, 1, 0, 0.4666667, 1,
1.487908, 0.6583738, 0.06578527, 1, 0, 0.4627451, 1,
1.492335, -0.4992328, 0.4464628, 1, 0, 0.454902, 1,
1.503143, 1.659374, -1.205907, 1, 0, 0.4509804, 1,
1.504808, 0.022603, 3.032109, 1, 0, 0.4431373, 1,
1.512919, 0.2974309, 1.613483, 1, 0, 0.4392157, 1,
1.515101, 0.3027807, 0.8245307, 1, 0, 0.4313726, 1,
1.517743, 2.112228, 0.3004908, 1, 0, 0.427451, 1,
1.524086, 0.2809951, 3.03042, 1, 0, 0.4196078, 1,
1.526, 0.2740436, 0.1583013, 1, 0, 0.4156863, 1,
1.526493, -0.7662017, 2.217945, 1, 0, 0.4078431, 1,
1.526732, 0.2396918, 0.487511, 1, 0, 0.4039216, 1,
1.533151, -0.6366368, 1.937695, 1, 0, 0.3960784, 1,
1.5373, -0.4408967, 0.732292, 1, 0, 0.3882353, 1,
1.544965, 1.378363, 1.121426, 1, 0, 0.3843137, 1,
1.564959, -0.1503433, -0.4306625, 1, 0, 0.3764706, 1,
1.568599, -0.930055, 3.174742, 1, 0, 0.372549, 1,
1.59223, 0.3227529, 0.4641812, 1, 0, 0.3647059, 1,
1.609047, 0.01855914, 1.495317, 1, 0, 0.3607843, 1,
1.611277, -1.936875, 2.975511, 1, 0, 0.3529412, 1,
1.630977, -0.6936802, 2.365884, 1, 0, 0.3490196, 1,
1.637427, -1.15376, 1.345613, 1, 0, 0.3411765, 1,
1.640597, 0.1845183, 1.428037, 1, 0, 0.3372549, 1,
1.641844, -0.1277212, 0.955561, 1, 0, 0.3294118, 1,
1.658506, 0.07951713, 0.4788648, 1, 0, 0.3254902, 1,
1.660119, 0.01661341, 2.218319, 1, 0, 0.3176471, 1,
1.686635, 0.756539, 0.2277636, 1, 0, 0.3137255, 1,
1.696986, -1.246113, 1.944142, 1, 0, 0.3058824, 1,
1.704943, -1.015338, 3.468561, 1, 0, 0.2980392, 1,
1.714399, 1.242962, 1.993849, 1, 0, 0.2941177, 1,
1.721569, 0.216319, 3.394023, 1, 0, 0.2862745, 1,
1.725141, 2.051215, -0.4163244, 1, 0, 0.282353, 1,
1.741222, 2.596393, 0.1907867, 1, 0, 0.2745098, 1,
1.744182, 0.4663051, 2.049895, 1, 0, 0.2705882, 1,
1.752982, 1.431115, -0.800239, 1, 0, 0.2627451, 1,
1.757504, 0.6441141, 1.64924, 1, 0, 0.2588235, 1,
1.766952, -1.416779, 2.981735, 1, 0, 0.2509804, 1,
1.776286, 0.1731067, 1.729478, 1, 0, 0.2470588, 1,
1.826507, 0.8370962, 0.08121814, 1, 0, 0.2392157, 1,
1.82889, -2.227932, 2.231805, 1, 0, 0.2352941, 1,
1.829339, 0.05059941, 1.219982, 1, 0, 0.227451, 1,
1.863342, -0.3685913, 3.507433, 1, 0, 0.2235294, 1,
1.866369, -1.319341, 2.234356, 1, 0, 0.2156863, 1,
1.868859, 0.5558668, 0.7412322, 1, 0, 0.2117647, 1,
1.870761, 0.6165361, 0.4784066, 1, 0, 0.2039216, 1,
1.87341, 0.2947883, 1.009794, 1, 0, 0.1960784, 1,
1.875325, -0.5492569, 0.733029, 1, 0, 0.1921569, 1,
1.88342, 0.8761354, 1.04201, 1, 0, 0.1843137, 1,
1.896019, 1.159498, -1.041522, 1, 0, 0.1803922, 1,
1.929624, 0.6230374, 2.798199, 1, 0, 0.172549, 1,
1.947217, 2.009723, 1.315915, 1, 0, 0.1686275, 1,
1.947267, -1.969937, 2.54324, 1, 0, 0.1607843, 1,
1.961172, -0.08770666, 1.209671, 1, 0, 0.1568628, 1,
1.990005, 0.5134503, 2.739613, 1, 0, 0.1490196, 1,
2.006737, -0.2042722, 0.2016285, 1, 0, 0.145098, 1,
2.012204, -0.6495917, 1.817873, 1, 0, 0.1372549, 1,
2.075026, 0.5240186, 2.112792, 1, 0, 0.1333333, 1,
2.086634, -2.033215, 0.9270294, 1, 0, 0.1254902, 1,
2.113069, 0.5639765, 0.7331072, 1, 0, 0.1215686, 1,
2.128997, 0.2439736, 1.794405, 1, 0, 0.1137255, 1,
2.140483, -1.18293, 2.372808, 1, 0, 0.1098039, 1,
2.162131, 2.182358, 2.566189, 1, 0, 0.1019608, 1,
2.164747, 0.1441081, 2.780191, 1, 0, 0.09411765, 1,
2.237509, -0.4818954, 3.362751, 1, 0, 0.09019608, 1,
2.251014, 1.548957, 0.1111089, 1, 0, 0.08235294, 1,
2.259335, 0.5780711, -0.4217304, 1, 0, 0.07843138, 1,
2.264476, -0.1120636, 1.761408, 1, 0, 0.07058824, 1,
2.287773, -0.403569, 0.7954547, 1, 0, 0.06666667, 1,
2.320671, -0.2948502, 1.390188, 1, 0, 0.05882353, 1,
2.365026, -0.2979919, 1.326553, 1, 0, 0.05490196, 1,
2.518107, 1.021341, 1.749361, 1, 0, 0.04705882, 1,
2.536032, 1.560303, 2.229488, 1, 0, 0.04313726, 1,
2.594834, 0.1185563, -0.9734976, 1, 0, 0.03529412, 1,
2.59704, 0.4456205, 2.560337, 1, 0, 0.03137255, 1,
2.703588, 0.2152053, 1.988825, 1, 0, 0.02352941, 1,
2.761392, -0.742842, 0.5804267, 1, 0, 0.01960784, 1,
2.804707, -0.1767835, 1.833506, 1, 0, 0.01176471, 1,
3.256822, -0.9658068, 1.481928, 1, 0, 0.007843138, 1
]);
var buf7 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf7);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc7 = gl.getUniformLocation(prog7,"mvMatrix");
var prMatLoc7 = gl.getUniformLocation(prog7,"prMatrix");
// ****** text object 9 ******
var prog9  = gl.createProgram();
gl.attachShader(prog9, getShader( gl, "testglvshader9" ));
gl.attachShader(prog9, getShader( gl, "testglfshader9" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog9, 0, "aPos");
gl.bindAttribLocation(prog9, 1, "aCol");
gl.linkProgram(prog9);
var texts = [
"x"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX9 = texinfo.canvasX;
var canvasY9 = texinfo.canvasY;
var ofsLoc9 = gl.getAttribLocation(prog9, "aOfs");
var texture9 = gl.createTexture();
var texLoc9 = gl.getAttribLocation(prog9, "aTexcoord");
var sampler9 = gl.getUniformLocation(prog9,"uSampler");
handleLoadedTexture(texture9, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
0.1516562, -4.460221, -7.269927, 0, -0.5, 0.5, 0.5,
0.1516562, -4.460221, -7.269927, 1, -0.5, 0.5, 0.5,
0.1516562, -4.460221, -7.269927, 1, 1.5, 0.5, 0.5,
0.1516562, -4.460221, -7.269927, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<1; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3
]);
var buf9 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf9);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf9 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf9);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc9 = gl.getUniformLocation(prog9,"mvMatrix");
var prMatLoc9 = gl.getUniformLocation(prog9,"prMatrix");
var textScaleLoc9 = gl.getUniformLocation(prog9,"textScale");
// ****** text object 10 ******
var prog10  = gl.createProgram();
gl.attachShader(prog10, getShader( gl, "testglvshader10" ));
gl.attachShader(prog10, getShader( gl, "testglfshader10" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog10, 0, "aPos");
gl.bindAttribLocation(prog10, 1, "aCol");
gl.linkProgram(prog10);
var texts = [
"y"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX10 = texinfo.canvasX;
var canvasY10 = texinfo.canvasY;
var ofsLoc10 = gl.getAttribLocation(prog10, "aOfs");
var texture10 = gl.createTexture();
var texLoc10 = gl.getAttribLocation(prog10, "aTexcoord");
var sampler10 = gl.getUniformLocation(prog10,"uSampler");
handleLoadedTexture(texture10, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-4.00616, 0.21105, -7.269927, 0, -0.5, 0.5, 0.5,
-4.00616, 0.21105, -7.269927, 1, -0.5, 0.5, 0.5,
-4.00616, 0.21105, -7.269927, 1, 1.5, 0.5, 0.5,
-4.00616, 0.21105, -7.269927, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<1; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3
]);
var buf10 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf10);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf10 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf10);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc10 = gl.getUniformLocation(prog10,"mvMatrix");
var prMatLoc10 = gl.getUniformLocation(prog10,"prMatrix");
var textScaleLoc10 = gl.getUniformLocation(prog10,"textScale");
// ****** text object 11 ******
var prog11  = gl.createProgram();
gl.attachShader(prog11, getShader( gl, "testglvshader11" ));
gl.attachShader(prog11, getShader( gl, "testglfshader11" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog11, 0, "aPos");
gl.bindAttribLocation(prog11, 1, "aCol");
gl.linkProgram(prog11);
var texts = [
"z"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX11 = texinfo.canvasX;
var canvasY11 = texinfo.canvasY;
var ofsLoc11 = gl.getAttribLocation(prog11, "aOfs");
var texture11 = gl.createTexture();
var texLoc11 = gl.getAttribLocation(prog11, "aTexcoord");
var sampler11 = gl.getUniformLocation(prog11,"uSampler");
handleLoadedTexture(texture11, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-4.00616, -4.460221, -0.02770877, 0, -0.5, 0.5, 0.5,
-4.00616, -4.460221, -0.02770877, 1, -0.5, 0.5, 0.5,
-4.00616, -4.460221, -0.02770877, 1, 1.5, 0.5, 0.5,
-4.00616, -4.460221, -0.02770877, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<1; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3
]);
var buf11 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf11);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf11 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf11);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc11 = gl.getUniformLocation(prog11,"mvMatrix");
var prMatLoc11 = gl.getUniformLocation(prog11,"prMatrix");
var textScaleLoc11 = gl.getUniformLocation(prog11,"textScale");
// ****** lines object 12 ******
var prog12  = gl.createProgram();
gl.attachShader(prog12, getShader( gl, "testglvshader12" ));
gl.attachShader(prog12, getShader( gl, "testglfshader12" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog12, 0, "aPos");
gl.bindAttribLocation(prog12, 1, "aCol");
gl.linkProgram(prog12);
var v=new Float32Array([
-2, -3.382236, -5.598645,
3, -3.382236, -5.598645,
-2, -3.382236, -5.598645,
-2, -3.5619, -5.877192,
-1, -3.382236, -5.598645,
-1, -3.5619, -5.877192,
0, -3.382236, -5.598645,
0, -3.5619, -5.877192,
1, -3.382236, -5.598645,
1, -3.5619, -5.877192,
2, -3.382236, -5.598645,
2, -3.5619, -5.877192,
3, -3.382236, -5.598645,
3, -3.5619, -5.877192
]);
var buf12 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf12);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc12 = gl.getUniformLocation(prog12,"mvMatrix");
var prMatLoc12 = gl.getUniformLocation(prog12,"prMatrix");
// ****** text object 13 ******
var prog13  = gl.createProgram();
gl.attachShader(prog13, getShader( gl, "testglvshader13" ));
gl.attachShader(prog13, getShader( gl, "testglfshader13" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog13, 0, "aPos");
gl.bindAttribLocation(prog13, 1, "aCol");
gl.linkProgram(prog13);
var texts = [
"-2",
"-1",
"0",
"1",
"2",
"3"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX13 = texinfo.canvasX;
var canvasY13 = texinfo.canvasY;
var ofsLoc13 = gl.getAttribLocation(prog13, "aOfs");
var texture13 = gl.createTexture();
var texLoc13 = gl.getAttribLocation(prog13, "aTexcoord");
var sampler13 = gl.getUniformLocation(prog13,"uSampler");
handleLoadedTexture(texture13, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-2, -3.921228, -6.434286, 0, -0.5, 0.5, 0.5,
-2, -3.921228, -6.434286, 1, -0.5, 0.5, 0.5,
-2, -3.921228, -6.434286, 1, 1.5, 0.5, 0.5,
-2, -3.921228, -6.434286, 0, 1.5, 0.5, 0.5,
-1, -3.921228, -6.434286, 0, -0.5, 0.5, 0.5,
-1, -3.921228, -6.434286, 1, -0.5, 0.5, 0.5,
-1, -3.921228, -6.434286, 1, 1.5, 0.5, 0.5,
-1, -3.921228, -6.434286, 0, 1.5, 0.5, 0.5,
0, -3.921228, -6.434286, 0, -0.5, 0.5, 0.5,
0, -3.921228, -6.434286, 1, -0.5, 0.5, 0.5,
0, -3.921228, -6.434286, 1, 1.5, 0.5, 0.5,
0, -3.921228, -6.434286, 0, 1.5, 0.5, 0.5,
1, -3.921228, -6.434286, 0, -0.5, 0.5, 0.5,
1, -3.921228, -6.434286, 1, -0.5, 0.5, 0.5,
1, -3.921228, -6.434286, 1, 1.5, 0.5, 0.5,
1, -3.921228, -6.434286, 0, 1.5, 0.5, 0.5,
2, -3.921228, -6.434286, 0, -0.5, 0.5, 0.5,
2, -3.921228, -6.434286, 1, -0.5, 0.5, 0.5,
2, -3.921228, -6.434286, 1, 1.5, 0.5, 0.5,
2, -3.921228, -6.434286, 0, 1.5, 0.5, 0.5,
3, -3.921228, -6.434286, 0, -0.5, 0.5, 0.5,
3, -3.921228, -6.434286, 1, -0.5, 0.5, 0.5,
3, -3.921228, -6.434286, 1, 1.5, 0.5, 0.5,
3, -3.921228, -6.434286, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<6; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3,
4, 5, 6, 4, 6, 7,
8, 9, 10, 8, 10, 11,
12, 13, 14, 12, 14, 15,
16, 17, 18, 16, 18, 19,
20, 21, 22, 20, 22, 23
]);
var buf13 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf13);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf13 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf13);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc13 = gl.getUniformLocation(prog13,"mvMatrix");
var prMatLoc13 = gl.getUniformLocation(prog13,"prMatrix");
var textScaleLoc13 = gl.getUniformLocation(prog13,"textScale");
// ****** lines object 14 ******
var prog14  = gl.createProgram();
gl.attachShader(prog14, getShader( gl, "testglvshader14" ));
gl.attachShader(prog14, getShader( gl, "testglfshader14" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog14, 0, "aPos");
gl.bindAttribLocation(prog14, 1, "aCol");
gl.linkProgram(prog14);
var v=new Float32Array([
-3.046664, -3, -5.598645,
-3.046664, 3, -5.598645,
-3.046664, -3, -5.598645,
-3.20658, -3, -5.877192,
-3.046664, -2, -5.598645,
-3.20658, -2, -5.877192,
-3.046664, -1, -5.598645,
-3.20658, -1, -5.877192,
-3.046664, 0, -5.598645,
-3.20658, 0, -5.877192,
-3.046664, 1, -5.598645,
-3.20658, 1, -5.877192,
-3.046664, 2, -5.598645,
-3.20658, 2, -5.877192,
-3.046664, 3, -5.598645,
-3.20658, 3, -5.877192
]);
var buf14 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf14);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc14 = gl.getUniformLocation(prog14,"mvMatrix");
var prMatLoc14 = gl.getUniformLocation(prog14,"prMatrix");
// ****** text object 15 ******
var prog15  = gl.createProgram();
gl.attachShader(prog15, getShader( gl, "testglvshader15" ));
gl.attachShader(prog15, getShader( gl, "testglfshader15" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog15, 0, "aPos");
gl.bindAttribLocation(prog15, 1, "aCol");
gl.linkProgram(prog15);
var texts = [
"-3",
"-2",
"-1",
"0",
"1",
"2",
"3"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX15 = texinfo.canvasX;
var canvasY15 = texinfo.canvasY;
var ofsLoc15 = gl.getAttribLocation(prog15, "aOfs");
var texture15 = gl.createTexture();
var texLoc15 = gl.getAttribLocation(prog15, "aTexcoord");
var sampler15 = gl.getUniformLocation(prog15,"uSampler");
handleLoadedTexture(texture15, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-3.526412, -3, -6.434286, 0, -0.5, 0.5, 0.5,
-3.526412, -3, -6.434286, 1, -0.5, 0.5, 0.5,
-3.526412, -3, -6.434286, 1, 1.5, 0.5, 0.5,
-3.526412, -3, -6.434286, 0, 1.5, 0.5, 0.5,
-3.526412, -2, -6.434286, 0, -0.5, 0.5, 0.5,
-3.526412, -2, -6.434286, 1, -0.5, 0.5, 0.5,
-3.526412, -2, -6.434286, 1, 1.5, 0.5, 0.5,
-3.526412, -2, -6.434286, 0, 1.5, 0.5, 0.5,
-3.526412, -1, -6.434286, 0, -0.5, 0.5, 0.5,
-3.526412, -1, -6.434286, 1, -0.5, 0.5, 0.5,
-3.526412, -1, -6.434286, 1, 1.5, 0.5, 0.5,
-3.526412, -1, -6.434286, 0, 1.5, 0.5, 0.5,
-3.526412, 0, -6.434286, 0, -0.5, 0.5, 0.5,
-3.526412, 0, -6.434286, 1, -0.5, 0.5, 0.5,
-3.526412, 0, -6.434286, 1, 1.5, 0.5, 0.5,
-3.526412, 0, -6.434286, 0, 1.5, 0.5, 0.5,
-3.526412, 1, -6.434286, 0, -0.5, 0.5, 0.5,
-3.526412, 1, -6.434286, 1, -0.5, 0.5, 0.5,
-3.526412, 1, -6.434286, 1, 1.5, 0.5, 0.5,
-3.526412, 1, -6.434286, 0, 1.5, 0.5, 0.5,
-3.526412, 2, -6.434286, 0, -0.5, 0.5, 0.5,
-3.526412, 2, -6.434286, 1, -0.5, 0.5, 0.5,
-3.526412, 2, -6.434286, 1, 1.5, 0.5, 0.5,
-3.526412, 2, -6.434286, 0, 1.5, 0.5, 0.5,
-3.526412, 3, -6.434286, 0, -0.5, 0.5, 0.5,
-3.526412, 3, -6.434286, 1, -0.5, 0.5, 0.5,
-3.526412, 3, -6.434286, 1, 1.5, 0.5, 0.5,
-3.526412, 3, -6.434286, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<7; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3,
4, 5, 6, 4, 6, 7,
8, 9, 10, 8, 10, 11,
12, 13, 14, 12, 14, 15,
16, 17, 18, 16, 18, 19,
20, 21, 22, 20, 22, 23,
24, 25, 26, 24, 26, 27
]);
var buf15 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf15);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf15 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf15);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc15 = gl.getUniformLocation(prog15,"mvMatrix");
var prMatLoc15 = gl.getUniformLocation(prog15,"prMatrix");
var textScaleLoc15 = gl.getUniformLocation(prog15,"textScale");
// ****** lines object 16 ******
var prog16  = gl.createProgram();
gl.attachShader(prog16, getShader( gl, "testglvshader16" ));
gl.attachShader(prog16, getShader( gl, "testglfshader16" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog16, 0, "aPos");
gl.bindAttribLocation(prog16, 1, "aCol");
gl.linkProgram(prog16);
var v=new Float32Array([
-3.046664, -3.382236, -4,
-3.046664, -3.382236, 4,
-3.046664, -3.382236, -4,
-3.20658, -3.5619, -4,
-3.046664, -3.382236, -2,
-3.20658, -3.5619, -2,
-3.046664, -3.382236, 0,
-3.20658, -3.5619, 0,
-3.046664, -3.382236, 2,
-3.20658, -3.5619, 2,
-3.046664, -3.382236, 4,
-3.20658, -3.5619, 4
]);
var buf16 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf16);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc16 = gl.getUniformLocation(prog16,"mvMatrix");
var prMatLoc16 = gl.getUniformLocation(prog16,"prMatrix");
// ****** text object 17 ******
var prog17  = gl.createProgram();
gl.attachShader(prog17, getShader( gl, "testglvshader17" ));
gl.attachShader(prog17, getShader( gl, "testglfshader17" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog17, 0, "aPos");
gl.bindAttribLocation(prog17, 1, "aCol");
gl.linkProgram(prog17);
var texts = [
"-4",
"-2",
"0",
"2",
"4"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX17 = texinfo.canvasX;
var canvasY17 = texinfo.canvasY;
var ofsLoc17 = gl.getAttribLocation(prog17, "aOfs");
var texture17 = gl.createTexture();
var texLoc17 = gl.getAttribLocation(prog17, "aTexcoord");
var sampler17 = gl.getUniformLocation(prog17,"uSampler");
handleLoadedTexture(texture17, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-3.526412, -3.921228, -4, 0, -0.5, 0.5, 0.5,
-3.526412, -3.921228, -4, 1, -0.5, 0.5, 0.5,
-3.526412, -3.921228, -4, 1, 1.5, 0.5, 0.5,
-3.526412, -3.921228, -4, 0, 1.5, 0.5, 0.5,
-3.526412, -3.921228, -2, 0, -0.5, 0.5, 0.5,
-3.526412, -3.921228, -2, 1, -0.5, 0.5, 0.5,
-3.526412, -3.921228, -2, 1, 1.5, 0.5, 0.5,
-3.526412, -3.921228, -2, 0, 1.5, 0.5, 0.5,
-3.526412, -3.921228, 0, 0, -0.5, 0.5, 0.5,
-3.526412, -3.921228, 0, 1, -0.5, 0.5, 0.5,
-3.526412, -3.921228, 0, 1, 1.5, 0.5, 0.5,
-3.526412, -3.921228, 0, 0, 1.5, 0.5, 0.5,
-3.526412, -3.921228, 2, 0, -0.5, 0.5, 0.5,
-3.526412, -3.921228, 2, 1, -0.5, 0.5, 0.5,
-3.526412, -3.921228, 2, 1, 1.5, 0.5, 0.5,
-3.526412, -3.921228, 2, 0, 1.5, 0.5, 0.5,
-3.526412, -3.921228, 4, 0, -0.5, 0.5, 0.5,
-3.526412, -3.921228, 4, 1, -0.5, 0.5, 0.5,
-3.526412, -3.921228, 4, 1, 1.5, 0.5, 0.5,
-3.526412, -3.921228, 4, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<5; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3,
4, 5, 6, 4, 6, 7,
8, 9, 10, 8, 10, 11,
12, 13, 14, 12, 14, 15,
16, 17, 18, 16, 18, 19
]);
var buf17 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf17);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf17 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf17);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc17 = gl.getUniformLocation(prog17,"mvMatrix");
var prMatLoc17 = gl.getUniformLocation(prog17,"prMatrix");
var textScaleLoc17 = gl.getUniformLocation(prog17,"textScale");
// ****** lines object 18 ******
var prog18  = gl.createProgram();
gl.attachShader(prog18, getShader( gl, "testglvshader18" ));
gl.attachShader(prog18, getShader( gl, "testglfshader18" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog18, 0, "aPos");
gl.bindAttribLocation(prog18, 1, "aCol");
gl.linkProgram(prog18);
var v=new Float32Array([
-3.046664, -3.382236, -5.598645,
-3.046664, 3.804336, -5.598645,
-3.046664, -3.382236, 5.543228,
-3.046664, 3.804336, 5.543228,
-3.046664, -3.382236, -5.598645,
-3.046664, -3.382236, 5.543228,
-3.046664, 3.804336, -5.598645,
-3.046664, 3.804336, 5.543228,
-3.046664, -3.382236, -5.598645,
3.349977, -3.382236, -5.598645,
-3.046664, -3.382236, 5.543228,
3.349977, -3.382236, 5.543228,
-3.046664, 3.804336, -5.598645,
3.349977, 3.804336, -5.598645,
-3.046664, 3.804336, 5.543228,
3.349977, 3.804336, 5.543228,
3.349977, -3.382236, -5.598645,
3.349977, 3.804336, -5.598645,
3.349977, -3.382236, 5.543228,
3.349977, 3.804336, 5.543228,
3.349977, -3.382236, -5.598645,
3.349977, -3.382236, 5.543228,
3.349977, 3.804336, -5.598645,
3.349977, 3.804336, 5.543228
]);
var buf18 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf18);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc18 = gl.getUniformLocation(prog18,"mvMatrix");
var prMatLoc18 = gl.getUniformLocation(prog18,"prMatrix");
gl.enable(gl.DEPTH_TEST);
gl.depthFunc(gl.LEQUAL);
gl.clearDepth(1.0);
gl.clearColor(1,1,1,1);
var xOffs = yOffs = 0,  drag  = 0;
function multMV(M, v) {
return [M.m11*v[0] + M.m12*v[1] + M.m13*v[2] + M.m14*v[3],
M.m21*v[0] + M.m22*v[1] + M.m23*v[2] + M.m24*v[3],
M.m31*v[0] + M.m32*v[1] + M.m33*v[2] + M.m34*v[3],
M.m41*v[0] + M.m42*v[1] + M.m43*v[2] + M.m44*v[3]];
}
drawScene();
function drawScene(){
gl.depthMask(true);
gl.disable(gl.BLEND);
gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
// ***** subscene 1 ****
gl.viewport(0, 0, 504, 504);
gl.scissor(0, 0, 504, 504);
gl.clearColor(1, 1, 1, 1);
gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
var radius = 7.86068;
var distance = 34.97305;
var t = tan(fov[1]*PI/360);
var near = distance - radius;
var far = distance + radius;
var hlen = t*near;
var aspect = 1;
prMatrix.makeIdentity();
if (aspect > 1)
prMatrix.frustum(-hlen*aspect*zoom[1], hlen*aspect*zoom[1], 
-hlen*zoom[1], hlen*zoom[1], near, far);
else  
prMatrix.frustum(-hlen*zoom[1], hlen*zoom[1], 
-hlen*zoom[1]/aspect, hlen*zoom[1]/aspect, 
near, far);
mvMatrix.makeIdentity();
mvMatrix.translate( -0.1516562, -0.21105, 0.02770877 );
mvMatrix.scale( 1.328685, 1.182639, 0.762809 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.97305);
// ****** points object 7 *******
gl.useProgram(prog7);
gl.bindBuffer(gl.ARRAY_BUFFER, buf7);
gl.uniformMatrix4fv( prMatLoc7, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc7, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.enableVertexAttribArray( colLoc );
gl.vertexAttribPointer(colLoc, 4, gl.FLOAT, false, 28, 12);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawArrays(gl.POINTS, 0, 1000);
// ****** text object 9 *******
gl.useProgram(prog9);
gl.bindBuffer(gl.ARRAY_BUFFER, buf9);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf9);
gl.uniformMatrix4fv( prMatLoc9, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc9, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc9, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc9 );
gl.vertexAttribPointer(texLoc9, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture9);
gl.uniform1i( sampler9, 0);
gl.enableVertexAttribArray( ofsLoc9 );
gl.vertexAttribPointer(ofsLoc9, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 6, gl.UNSIGNED_SHORT, 0);
// ****** text object 10 *******
gl.useProgram(prog10);
gl.bindBuffer(gl.ARRAY_BUFFER, buf10);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf10);
gl.uniformMatrix4fv( prMatLoc10, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc10, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc10, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc10 );
gl.vertexAttribPointer(texLoc10, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture10);
gl.uniform1i( sampler10, 0);
gl.enableVertexAttribArray( ofsLoc10 );
gl.vertexAttribPointer(ofsLoc10, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 6, gl.UNSIGNED_SHORT, 0);
// ****** text object 11 *******
gl.useProgram(prog11);
gl.bindBuffer(gl.ARRAY_BUFFER, buf11);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf11);
gl.uniformMatrix4fv( prMatLoc11, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc11, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc11, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc11 );
gl.vertexAttribPointer(texLoc11, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture11);
gl.uniform1i( sampler11, 0);
gl.enableVertexAttribArray( ofsLoc11 );
gl.vertexAttribPointer(ofsLoc11, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 6, gl.UNSIGNED_SHORT, 0);
// ****** lines object 12 *******
gl.useProgram(prog12);
gl.bindBuffer(gl.ARRAY_BUFFER, buf12);
gl.uniformMatrix4fv( prMatLoc12, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc12, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.lineWidth( 1 );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.drawArrays(gl.LINES, 0, 14);
// ****** text object 13 *******
gl.useProgram(prog13);
gl.bindBuffer(gl.ARRAY_BUFFER, buf13);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf13);
gl.uniformMatrix4fv( prMatLoc13, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc13, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc13, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc13 );
gl.vertexAttribPointer(texLoc13, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture13);
gl.uniform1i( sampler13, 0);
gl.enableVertexAttribArray( ofsLoc13 );
gl.vertexAttribPointer(ofsLoc13, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 36, gl.UNSIGNED_SHORT, 0);
// ****** lines object 14 *******
gl.useProgram(prog14);
gl.bindBuffer(gl.ARRAY_BUFFER, buf14);
gl.uniformMatrix4fv( prMatLoc14, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc14, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.lineWidth( 1 );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.drawArrays(gl.LINES, 0, 16);
// ****** text object 15 *******
gl.useProgram(prog15);
gl.bindBuffer(gl.ARRAY_BUFFER, buf15);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf15);
gl.uniformMatrix4fv( prMatLoc15, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc15, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc15, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc15 );
gl.vertexAttribPointer(texLoc15, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture15);
gl.uniform1i( sampler15, 0);
gl.enableVertexAttribArray( ofsLoc15 );
gl.vertexAttribPointer(ofsLoc15, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 42, gl.UNSIGNED_SHORT, 0);
// ****** lines object 16 *******
gl.useProgram(prog16);
gl.bindBuffer(gl.ARRAY_BUFFER, buf16);
gl.uniformMatrix4fv( prMatLoc16, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc16, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.lineWidth( 1 );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.drawArrays(gl.LINES, 0, 12);
// ****** text object 17 *******
gl.useProgram(prog17);
gl.bindBuffer(gl.ARRAY_BUFFER, buf17);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf17);
gl.uniformMatrix4fv( prMatLoc17, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc17, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc17, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc17 );
gl.vertexAttribPointer(texLoc17, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture17);
gl.uniform1i( sampler17, 0);
gl.enableVertexAttribArray( ofsLoc17 );
gl.vertexAttribPointer(ofsLoc17, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
// ****** lines object 18 *******
gl.useProgram(prog18);
gl.bindBuffer(gl.ARRAY_BUFFER, buf18);
gl.uniformMatrix4fv( prMatLoc18, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc18, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.lineWidth( 1 );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.drawArrays(gl.LINES, 0, 24);
gl.flush ();
}
var vpx0 = {
1: 0
};
var vpy0 = {
1: 0
};
var vpWidths = {
1: 504
};
var vpHeights = {
1: 504
};
var activeModel = {
1: 1
};
var activeProjection = {
1: 1
};
var whichSubscene = function(coords){
if (0 <= coords.x && coords.x <= 504 && 0 <= coords.y && coords.y <= 504) return(1);
return(1);
}
var translateCoords = function(subsceneid, coords){
return {x:coords.x - vpx0[subsceneid], y:coords.y - vpy0[subsceneid]};
}
var vlen = function(v) {
return sqrt(v[0]*v[0] + v[1]*v[1] + v[2]*v[2])
}
var xprod = function(a, b) {
return [a[1]*b[2] - a[2]*b[1],
a[2]*b[0] - a[0]*b[2],
a[0]*b[1] - a[1]*b[0]];
}
var screenToVector = function(x, y) {
var width = vpWidths[activeSubscene];
var height = vpHeights[activeSubscene];
var radius = max(width, height)/2.0;
var cx = width/2.0;
var cy = height/2.0;
var px = (x-cx)/radius;
var py = (y-cy)/radius;
var plen = sqrt(px*px+py*py);
if (plen > 1.e-6) { 
px = px/plen;
py = py/plen;
}
var angle = (SQRT2 - plen)/SQRT2*PI/2;
var z = sin(angle);
var zlen = sqrt(1.0 - z*z);
px = px * zlen;
py = py * zlen;
return [px, py, z];
}
var rotBase;
var trackballdown = function(x,y) {
rotBase = screenToVector(x, y);
saveMat.load(userMatrix[activeModel[activeSubscene]]);
}
var trackballmove = function(x,y) {
var rotCurrent = screenToVector(x,y);
var dot = rotBase[0]*rotCurrent[0] + 
rotBase[1]*rotCurrent[1] + 
rotBase[2]*rotCurrent[2];
var angle = acos( dot/vlen(rotBase)/vlen(rotCurrent) )*180./PI;
var axis = xprod(rotBase, rotCurrent);
userMatrix[activeModel[activeSubscene]].load(saveMat);
userMatrix[activeModel[activeSubscene]].rotate(angle, axis[0], axis[1], axis[2]);
drawScene();
}
var y0zoom = 0;
var zoom0 = 1;
var zoomdown = function(x, y) {
y0zoom = y;
zoom0 = log(zoom[activeProjection[activeSubscene]]);
}
var zoommove = function(x, y) {
zoom[activeProjection[activeSubscene]] = exp(zoom0 + (y-y0zoom)/height);
drawScene();
}
var y0fov = 0;
var fov0 = 1;
var fovdown = function(x, y) {
y0fov = y;
fov0 = fov[activeProjection[activeSubscene]];
}
var fovmove = function(x, y) {
fov[activeProjection[activeSubscene]] = max(1, min(179, fov0 + 180*(y-y0fov)/height));
drawScene();
}
var mousedown = [trackballdown, zoomdown, fovdown];
var mousemove = [trackballmove, zoommove, fovmove];
function relMouseCoords(event){
var totalOffsetX = 0;
var totalOffsetY = 0;
var currentElement = canvas;
do{
totalOffsetX += currentElement.offsetLeft;
totalOffsetY += currentElement.offsetTop;
}
while(currentElement = currentElement.offsetParent)
var canvasX = event.pageX - totalOffsetX;
var canvasY = event.pageY - totalOffsetY;
return {x:canvasX, y:canvasY}
}
canvas.onmousedown = function ( ev ){
if (!ev.which) // Use w3c defns in preference to MS
switch (ev.button) {
case 0: ev.which = 1; break;
case 1: 
case 4: ev.which = 2; break;
case 2: ev.which = 3;
}
drag = ev.which;
var f = mousedown[drag-1];
if (f) {
var coords = relMouseCoords(ev);
coords.y = height-coords.y;
activeSubscene = whichSubscene(coords);
coords = translateCoords(activeSubscene, coords);
f(coords.x, coords.y); 
ev.preventDefault();
}
}    
canvas.onmouseup = function ( ev ){	
drag = 0;
}
canvas.onmouseout = canvas.onmouseup;
canvas.onmousemove = function ( ev ){
if ( drag == 0 ) return;
var f = mousemove[drag-1];
if (f) {
var coords = relMouseCoords(ev);
coords.y = height - coords.y;
coords = translateCoords(activeSubscene, coords);
f(coords.x, coords.y);
}
}
var wheelHandler = function(ev) {
var del = 1.1;
if (ev.shiftKey) del = 1.01;
var ds = ((ev.detail || ev.wheelDelta) > 0) ? del : (1 / del);
zoom[activeProjection[activeSubscene]] *= ds;
drawScene();
ev.preventDefault();
};
canvas.addEventListener("DOMMouseScroll", wheelHandler, false);
canvas.addEventListener("mousewheel", wheelHandler, false);
}
</script>
<canvas id="testglcanvas" width="1" height="1"></canvas> 
<p id="testgldebug">
You must enable Javascript to view this page properly.</p>
<script>testglwebGLStart();</script>

The following a 3D image is of Atrazine rendered from the 3D conformer file derived from here (http://pubchem.ncbi.nlm.nih.gov/compound/2256). The atoms are represented as spheres Nitrogen as blue, carbon as black, hydrogen as white, and chlorine as blue.


