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
-2.996705, -0.397896, -0.7260834, 1, 0, 0, 1,
-2.77128, -0.0187569, -1.35318, 1, 0.007843138, 0, 1,
-2.519953, 0.1453817, -0.9843093, 1, 0.01176471, 0, 1,
-2.473956, -0.03359514, -0.4563269, 1, 0.01960784, 0, 1,
-2.396469, -0.9450722, -1.976728, 1, 0.02352941, 0, 1,
-2.35152, -0.3533065, -2.968601, 1, 0.03137255, 0, 1,
-2.324858, -0.08266073, -1.997254, 1, 0.03529412, 0, 1,
-2.28128, 0.0184876, -1.657287, 1, 0.04313726, 0, 1,
-2.2682, -0.6497489, -0.5387816, 1, 0.04705882, 0, 1,
-2.257378, -0.9105451, -1.831215, 1, 0.05490196, 0, 1,
-2.161296, 1.429848, -1.464812, 1, 0.05882353, 0, 1,
-2.1375, -0.5534104, -0.9608186, 1, 0.06666667, 0, 1,
-2.12747, -0.7348515, -1.149211, 1, 0.07058824, 0, 1,
-2.078315, 1.127513, -1.761568, 1, 0.07843138, 0, 1,
-2.066042, 1.574945, -0.5012745, 1, 0.08235294, 0, 1,
-2.027467, 1.480379, -1.025293, 1, 0.09019608, 0, 1,
-1.994691, -0.5818361, -3.149161, 1, 0.09411765, 0, 1,
-1.993749, -1.982597, -1.007191, 1, 0.1019608, 0, 1,
-1.980764, 0.1165113, -2.748715, 1, 0.1098039, 0, 1,
-1.979173, -0.6900483, -2.921863, 1, 0.1137255, 0, 1,
-1.94575, -1.317115, -2.183228, 1, 0.1215686, 0, 1,
-1.945366, -0.5489719, -2.251694, 1, 0.1254902, 0, 1,
-1.941711, 0.7930261, 1.197034, 1, 0.1333333, 0, 1,
-1.933801, 0.4550949, -0.7627342, 1, 0.1372549, 0, 1,
-1.932875, 0.2142976, -2.340821, 1, 0.145098, 0, 1,
-1.899209, -0.2884643, -3.527772, 1, 0.1490196, 0, 1,
-1.858106, 0.3511383, -1.160495, 1, 0.1568628, 0, 1,
-1.812472, 0.9034128, -1.521278, 1, 0.1607843, 0, 1,
-1.779297, 1.580332, -0.06923886, 1, 0.1686275, 0, 1,
-1.774801, 0.9649834, -0.8528823, 1, 0.172549, 0, 1,
-1.737622, -1.428336, -3.113549, 1, 0.1803922, 0, 1,
-1.726001, 0.6080304, -1.321688, 1, 0.1843137, 0, 1,
-1.720681, -0.7058203, -2.379997, 1, 0.1921569, 0, 1,
-1.718805, 0.8752652, -3.222498, 1, 0.1960784, 0, 1,
-1.716544, 0.2575277, -3.878132, 1, 0.2039216, 0, 1,
-1.715261, -0.4500718, -1.594832, 1, 0.2117647, 0, 1,
-1.710114, -0.6071609, -1.870966, 1, 0.2156863, 0, 1,
-1.687842, -0.9695936, -2.362789, 1, 0.2235294, 0, 1,
-1.684496, -0.8115795, -2.846098, 1, 0.227451, 0, 1,
-1.683152, 1.421227, -2.250817, 1, 0.2352941, 0, 1,
-1.680373, 0.3737122, -2.265924, 1, 0.2392157, 0, 1,
-1.680124, -0.5878717, -4.726509, 1, 0.2470588, 0, 1,
-1.667341, 0.5657454, -1.781373, 1, 0.2509804, 0, 1,
-1.659935, 0.7905549, -1.011543, 1, 0.2588235, 0, 1,
-1.651191, 0.01013811, -2.48998, 1, 0.2627451, 0, 1,
-1.633548, 1.134655, -1.988337, 1, 0.2705882, 0, 1,
-1.623815, -1.863313, -2.429564, 1, 0.2745098, 0, 1,
-1.586336, 1.123695, 1.132815, 1, 0.282353, 0, 1,
-1.576432, 1.125505, -1.170717, 1, 0.2862745, 0, 1,
-1.564496, 0.2887695, -3.444885, 1, 0.2941177, 0, 1,
-1.536265, 0.4315943, -1.143477, 1, 0.3019608, 0, 1,
-1.532346, 0.5010272, -1.08117, 1, 0.3058824, 0, 1,
-1.510665, 1.236947, -0.09940416, 1, 0.3137255, 0, 1,
-1.508926, 0.4524377, -1.220398, 1, 0.3176471, 0, 1,
-1.507423, -0.04308288, -0.9260806, 1, 0.3254902, 0, 1,
-1.500485, -0.38477, -0.2067675, 1, 0.3294118, 0, 1,
-1.489278, -0.3207529, -2.332419, 1, 0.3372549, 0, 1,
-1.488864, 0.2349569, -0.9551416, 1, 0.3411765, 0, 1,
-1.478489, -1.301148, -2.044252, 1, 0.3490196, 0, 1,
-1.477102, 0.5480275, -2.656425, 1, 0.3529412, 0, 1,
-1.475785, 1.226238, -0.1495999, 1, 0.3607843, 0, 1,
-1.472796, -0.3057307, -2.089407, 1, 0.3647059, 0, 1,
-1.459781, -0.8568184, -2.255061, 1, 0.372549, 0, 1,
-1.459723, 0.6958887, 0.2450916, 1, 0.3764706, 0, 1,
-1.43791, 0.03464524, -0.287879, 1, 0.3843137, 0, 1,
-1.436003, 0.8681973, -0.2283703, 1, 0.3882353, 0, 1,
-1.434995, 0.5951924, -1.229512, 1, 0.3960784, 0, 1,
-1.43228, -1.804201, -1.679774, 1, 0.4039216, 0, 1,
-1.432081, 0.052554, -3.286625, 1, 0.4078431, 0, 1,
-1.427881, 0.7184473, -1.397532, 1, 0.4156863, 0, 1,
-1.41728, -0.2075926, -3.391892, 1, 0.4196078, 0, 1,
-1.408188, 0.1891561, -1.931092, 1, 0.427451, 0, 1,
-1.408117, -0.9575883, -2.381409, 1, 0.4313726, 0, 1,
-1.405149, -0.8682582, -2.002315, 1, 0.4392157, 0, 1,
-1.401109, 0.3330742, -0.5168775, 1, 0.4431373, 0, 1,
-1.399294, -0.2158, -2.619414, 1, 0.4509804, 0, 1,
-1.386826, -1.335832, -2.630274, 1, 0.454902, 0, 1,
-1.38058, -1.815062, -1.321573, 1, 0.4627451, 0, 1,
-1.380348, -0.6773846, -1.252897, 1, 0.4666667, 0, 1,
-1.37741, -0.5885183, -2.65193, 1, 0.4745098, 0, 1,
-1.36533, -0.6013612, -1.091664, 1, 0.4784314, 0, 1,
-1.357509, -0.03965149, -2.793635, 1, 0.4862745, 0, 1,
-1.356114, 1.619335, -1.488348, 1, 0.4901961, 0, 1,
-1.355534, -0.5901801, -1.980896, 1, 0.4980392, 0, 1,
-1.349229, -0.735266, -2.216094, 1, 0.5058824, 0, 1,
-1.341373, 0.6084696, -0.4540653, 1, 0.509804, 0, 1,
-1.341219, -1.45798, -1.663342, 1, 0.5176471, 0, 1,
-1.338999, -0.4874347, -4.532778, 1, 0.5215687, 0, 1,
-1.335691, 1.093847, -1.176388, 1, 0.5294118, 0, 1,
-1.335161, -0.01576644, -1.693137, 1, 0.5333334, 0, 1,
-1.333326, 0.3127861, -2.610533, 1, 0.5411765, 0, 1,
-1.330462, 0.3338886, -2.228418, 1, 0.5450981, 0, 1,
-1.326938, 0.2839465, -2.539562, 1, 0.5529412, 0, 1,
-1.326779, 0.6715132, 0.3779516, 1, 0.5568628, 0, 1,
-1.322318, 1.39536, 1.209167, 1, 0.5647059, 0, 1,
-1.316412, 0.5423025, -1.739989, 1, 0.5686275, 0, 1,
-1.316215, -1.324625, -2.029047, 1, 0.5764706, 0, 1,
-1.313005, 0.3581785, -2.721069, 1, 0.5803922, 0, 1,
-1.294044, 0.4467481, -2.30765, 1, 0.5882353, 0, 1,
-1.289781, 0.2165901, -3.084614, 1, 0.5921569, 0, 1,
-1.28381, -0.1540708, 0.1741474, 1, 0.6, 0, 1,
-1.268394, -0.03510312, -1.837923, 1, 0.6078432, 0, 1,
-1.266194, 1.90901, -0.5120344, 1, 0.6117647, 0, 1,
-1.264069, 0.5416818, -0.07897504, 1, 0.6196079, 0, 1,
-1.246473, -1.38807, -0.9081337, 1, 0.6235294, 0, 1,
-1.2352, -0.1645374, -1.027398, 1, 0.6313726, 0, 1,
-1.233745, 0.4563673, -1.100336, 1, 0.6352941, 0, 1,
-1.232746, 0.8515118, -0.1879099, 1, 0.6431373, 0, 1,
-1.232118, -0.6645314, -0.7283176, 1, 0.6470588, 0, 1,
-1.226873, 0.5494879, -1.256222, 1, 0.654902, 0, 1,
-1.225924, 0.1021401, -1.184984, 1, 0.6588235, 0, 1,
-1.22055, 0.2031138, -1.250219, 1, 0.6666667, 0, 1,
-1.21265, -1.172145, -1.698313, 1, 0.6705883, 0, 1,
-1.207428, 0.6685817, -1.155152, 1, 0.6784314, 0, 1,
-1.205865, 0.5584821, -1.8443, 1, 0.682353, 0, 1,
-1.20268, 0.9551475, -0.536692, 1, 0.6901961, 0, 1,
-1.197794, -0.2538075, -3.179853, 1, 0.6941177, 0, 1,
-1.189581, -1.579503, -1.799565, 1, 0.7019608, 0, 1,
-1.186021, 0.6269796, 0.09487555, 1, 0.7098039, 0, 1,
-1.181568, 2.264153, 0.2615136, 1, 0.7137255, 0, 1,
-1.180786, -0.2815, -0.9763986, 1, 0.7215686, 0, 1,
-1.180087, 0.7090521, -0.1920792, 1, 0.7254902, 0, 1,
-1.178225, -0.2060976, -1.245041, 1, 0.7333333, 0, 1,
-1.178182, -1.244482, -2.830417, 1, 0.7372549, 0, 1,
-1.17634, 2.315192, 0.958518, 1, 0.7450981, 0, 1,
-1.166146, -0.1262148, -2.46518, 1, 0.7490196, 0, 1,
-1.163819, -1.879711, -3.11088, 1, 0.7568628, 0, 1,
-1.152844, 1.383453, -1.679741, 1, 0.7607843, 0, 1,
-1.136178, 0.2642043, -1.051425, 1, 0.7686275, 0, 1,
-1.129034, 0.1116429, -0.09095452, 1, 0.772549, 0, 1,
-1.120916, 0.7662538, -2.505164, 1, 0.7803922, 0, 1,
-1.11973, 0.0492337, 0.06138731, 1, 0.7843137, 0, 1,
-1.119396, -0.5872648, -2.54644, 1, 0.7921569, 0, 1,
-1.116153, 0.7629969, -0.7559595, 1, 0.7960784, 0, 1,
-1.11548, -0.3405389, -3.139179, 1, 0.8039216, 0, 1,
-1.114698, -0.7211744, -2.213841, 1, 0.8117647, 0, 1,
-1.112455, 0.7334718, -0.8660877, 1, 0.8156863, 0, 1,
-1.111757, 0.8923134, -1.265655, 1, 0.8235294, 0, 1,
-1.10491, -1.201399, -3.750138, 1, 0.827451, 0, 1,
-1.099807, 0.7523039, 0.1931175, 1, 0.8352941, 0, 1,
-1.096219, -0.7261552, -1.702718, 1, 0.8392157, 0, 1,
-1.090259, -1.351659, -2.489898, 1, 0.8470588, 0, 1,
-1.089282, 0.5859256, -1.768897, 1, 0.8509804, 0, 1,
-1.085974, 0.3935638, -1.247121, 1, 0.8588235, 0, 1,
-1.083743, -0.06737771, -2.369379, 1, 0.8627451, 0, 1,
-1.076116, 1.621781, -1.164812, 1, 0.8705882, 0, 1,
-1.07348, 0.7848061, -0.877416, 1, 0.8745098, 0, 1,
-1.073302, -1.263759, -1.4594, 1, 0.8823529, 0, 1,
-1.067719, 0.2345849, 0.2998167, 1, 0.8862745, 0, 1,
-1.065799, -0.2704827, -1.006524, 1, 0.8941177, 0, 1,
-1.061546, 2.566885, -0.6851531, 1, 0.8980392, 0, 1,
-1.059476, -0.1792275, -2.138718, 1, 0.9058824, 0, 1,
-1.056551, 1.530568, 0.458407, 1, 0.9137255, 0, 1,
-1.050266, 1.607796, 0.02332794, 1, 0.9176471, 0, 1,
-1.047521, -1.327799, -2.85864, 1, 0.9254902, 0, 1,
-1.035644, 0.4048528, -3.889468, 1, 0.9294118, 0, 1,
-1.033095, -0.7481302, -2.04353, 1, 0.9372549, 0, 1,
-1.032778, 1.47722, -2.433845, 1, 0.9411765, 0, 1,
-1.023064, 1.487503, 1.040434, 1, 0.9490196, 0, 1,
-1.018354, -0.7353784, -2.92475, 1, 0.9529412, 0, 1,
-1.015542, 1.198313, -0.6375515, 1, 0.9607843, 0, 1,
-1.010695, 1.146381, -1.346679, 1, 0.9647059, 0, 1,
-1.00512, -0.6846737, -0.4586687, 1, 0.972549, 0, 1,
-1.002934, -0.7768314, -2.934851, 1, 0.9764706, 0, 1,
-1.002033, -0.1364344, -2.516915, 1, 0.9843137, 0, 1,
-0.9944116, -1.058162, -2.905474, 1, 0.9882353, 0, 1,
-0.9924904, 0.9315575, -0.3540638, 1, 0.9960784, 0, 1,
-0.9907495, 1.566297, -0.2947254, 0.9960784, 1, 0, 1,
-0.9838645, -1.383047, -1.554432, 0.9921569, 1, 0, 1,
-0.9807858, 1.428937, -1.155746, 0.9843137, 1, 0, 1,
-0.9805078, 0.3992456, -1.506785, 0.9803922, 1, 0, 1,
-0.9796396, 2.347478, -0.01996846, 0.972549, 1, 0, 1,
-0.9773018, -2.028496, -1.458939, 0.9686275, 1, 0, 1,
-0.9769657, 2.250313, -0.3361282, 0.9607843, 1, 0, 1,
-0.9712306, 0.6024755, -0.7603787, 0.9568627, 1, 0, 1,
-0.9706013, -0.0528612, -3.228543, 0.9490196, 1, 0, 1,
-0.9695105, -0.1275132, -1.604436, 0.945098, 1, 0, 1,
-0.9667866, -0.583087, -2.373442, 0.9372549, 1, 0, 1,
-0.958755, -1.101952, -1.525922, 0.9333333, 1, 0, 1,
-0.945582, -0.1997174, -3.589509, 0.9254902, 1, 0, 1,
-0.9345008, 1.019969, -1.448722, 0.9215686, 1, 0, 1,
-0.9339771, -1.381085, -4.192373, 0.9137255, 1, 0, 1,
-0.9319739, 1.448431, 0.9754021, 0.9098039, 1, 0, 1,
-0.9300142, 0.05877845, -2.678717, 0.9019608, 1, 0, 1,
-0.9265111, -2.052667, -3.112199, 0.8941177, 1, 0, 1,
-0.9254526, -0.890569, -1.935863, 0.8901961, 1, 0, 1,
-0.9247788, -0.03788399, -0.09811091, 0.8823529, 1, 0, 1,
-0.9237843, -0.4734338, -2.601321, 0.8784314, 1, 0, 1,
-0.9222894, -1.285633, -2.400938, 0.8705882, 1, 0, 1,
-0.9190882, 0.5083655, -1.406729, 0.8666667, 1, 0, 1,
-0.9132041, 0.566712, -2.383985, 0.8588235, 1, 0, 1,
-0.9060428, 0.2837306, -1.717744, 0.854902, 1, 0, 1,
-0.9018576, -1.769524, -3.079184, 0.8470588, 1, 0, 1,
-0.8975956, -2.349714, -2.502577, 0.8431373, 1, 0, 1,
-0.8937075, 0.8126624, -0.7514089, 0.8352941, 1, 0, 1,
-0.8876854, -1.17808, -1.962918, 0.8313726, 1, 0, 1,
-0.8801311, -0.5272853, -0.3404923, 0.8235294, 1, 0, 1,
-0.8753245, 0.8331199, -1.64126, 0.8196079, 1, 0, 1,
-0.871689, -0.8896893, -2.036726, 0.8117647, 1, 0, 1,
-0.8687353, -0.9924966, -2.542641, 0.8078431, 1, 0, 1,
-0.8670519, 1.099718, -0.490705, 0.8, 1, 0, 1,
-0.8654192, 0.2310789, -2.286707, 0.7921569, 1, 0, 1,
-0.8644366, -0.1299823, -0.4946487, 0.7882353, 1, 0, 1,
-0.8619854, -0.376076, -2.893375, 0.7803922, 1, 0, 1,
-0.8604634, 0.9968288, -0.1179055, 0.7764706, 1, 0, 1,
-0.8555657, -1.049313, -2.700822, 0.7686275, 1, 0, 1,
-0.8503653, 0.1161152, -1.687755, 0.7647059, 1, 0, 1,
-0.8468739, -0.2039311, -0.51131, 0.7568628, 1, 0, 1,
-0.8453584, 1.18951, -1.177269, 0.7529412, 1, 0, 1,
-0.8327499, -1.723615, -1.510786, 0.7450981, 1, 0, 1,
-0.8317353, 0.03458595, -1.043894, 0.7411765, 1, 0, 1,
-0.8297351, -1.57046, -1.946843, 0.7333333, 1, 0, 1,
-0.827138, 0.6280972, 0.3862535, 0.7294118, 1, 0, 1,
-0.8263016, -0.9533729, -2.298355, 0.7215686, 1, 0, 1,
-0.8258339, 0.0857197, -2.084915, 0.7176471, 1, 0, 1,
-0.8244573, -0.3565534, 0.7107988, 0.7098039, 1, 0, 1,
-0.8117766, -1.652951, -3.161284, 0.7058824, 1, 0, 1,
-0.8067709, 1.601698, -0.741983, 0.6980392, 1, 0, 1,
-0.7985108, -0.1235608, -0.5748992, 0.6901961, 1, 0, 1,
-0.7961012, -1.502479, -3.426433, 0.6862745, 1, 0, 1,
-0.7946304, 1.107694, -0.6548707, 0.6784314, 1, 0, 1,
-0.7912017, 0.6654137, 1.132343, 0.6745098, 1, 0, 1,
-0.7899607, 0.1684396, -1.03677, 0.6666667, 1, 0, 1,
-0.7893404, -1.319024, -3.100943, 0.6627451, 1, 0, 1,
-0.7853775, -0.5380299, -0.7741174, 0.654902, 1, 0, 1,
-0.7802721, 0.07603382, -0.5454524, 0.6509804, 1, 0, 1,
-0.7749233, -0.6806983, -1.657108, 0.6431373, 1, 0, 1,
-0.7748142, -0.1697957, -1.876264, 0.6392157, 1, 0, 1,
-0.7699036, 0.4606012, -0.3144243, 0.6313726, 1, 0, 1,
-0.7667125, 0.7053797, -1.789494, 0.627451, 1, 0, 1,
-0.7642148, -2.010952, -3.148339, 0.6196079, 1, 0, 1,
-0.7516601, 0.3447783, -1.518502, 0.6156863, 1, 0, 1,
-0.7513379, 1.996122, -1.930298, 0.6078432, 1, 0, 1,
-0.7507139, -0.3958605, -2.062921, 0.6039216, 1, 0, 1,
-0.7481174, -0.2140947, -1.688808, 0.5960785, 1, 0, 1,
-0.740796, -1.65156, -2.840674, 0.5882353, 1, 0, 1,
-0.7171392, -0.2593311, -1.284995, 0.5843138, 1, 0, 1,
-0.7165581, 0.9938474, 0.7216203, 0.5764706, 1, 0, 1,
-0.7132034, 0.7150851, -1.521341, 0.572549, 1, 0, 1,
-0.7127539, -0.5407943, -1.910224, 0.5647059, 1, 0, 1,
-0.711045, -1.492031, -3.124033, 0.5607843, 1, 0, 1,
-0.7107181, 0.6304482, -1.10301, 0.5529412, 1, 0, 1,
-0.7105961, -0.9391356, -3.31331, 0.5490196, 1, 0, 1,
-0.7085344, 0.03000692, -1.218136, 0.5411765, 1, 0, 1,
-0.7062494, 0.488485, -1.810017, 0.5372549, 1, 0, 1,
-0.7027878, -0.7097651, -3.758362, 0.5294118, 1, 0, 1,
-0.6994954, 1.479055, 0.07924439, 0.5254902, 1, 0, 1,
-0.6983295, -0.2334883, -1.799574, 0.5176471, 1, 0, 1,
-0.6955727, 0.9408754, -1.498985, 0.5137255, 1, 0, 1,
-0.6896284, 2.391921, 0.1610543, 0.5058824, 1, 0, 1,
-0.6859746, -0.06975327, -0.8386146, 0.5019608, 1, 0, 1,
-0.6845705, 0.2359585, -0.8228908, 0.4941176, 1, 0, 1,
-0.6812056, 1.521541, -0.2839488, 0.4862745, 1, 0, 1,
-0.67748, -0.4644311, -2.193053, 0.4823529, 1, 0, 1,
-0.6768587, 0.2143343, -0.5479091, 0.4745098, 1, 0, 1,
-0.6767094, 0.1472227, -1.616144, 0.4705882, 1, 0, 1,
-0.6702556, 2.544952, 0.6125706, 0.4627451, 1, 0, 1,
-0.6701809, -1.446766, -3.430701, 0.4588235, 1, 0, 1,
-0.6699742, 2.255449, -0.7589331, 0.4509804, 1, 0, 1,
-0.6695886, 0.3378361, 1.247799, 0.4470588, 1, 0, 1,
-0.6649422, -0.0794434, 0.01054967, 0.4392157, 1, 0, 1,
-0.6636485, 0.2590048, -1.267629, 0.4352941, 1, 0, 1,
-0.660341, 0.1906819, -1.815552, 0.427451, 1, 0, 1,
-0.6589426, 0.784876, -1.317029, 0.4235294, 1, 0, 1,
-0.6518511, 0.7527567, -0.4218237, 0.4156863, 1, 0, 1,
-0.6435112, -0.8444136, -2.538247, 0.4117647, 1, 0, 1,
-0.6424211, 2.21935, 2.100482, 0.4039216, 1, 0, 1,
-0.6374879, -1.972126, -1.336309, 0.3960784, 1, 0, 1,
-0.6295942, -0.4039339, -2.544551, 0.3921569, 1, 0, 1,
-0.623788, 0.8012439, -1.880811, 0.3843137, 1, 0, 1,
-0.6153148, 0.722342, 0.8420938, 0.3803922, 1, 0, 1,
-0.6146429, 0.7289472, -0.115726, 0.372549, 1, 0, 1,
-0.6137973, -0.855634, -3.397666, 0.3686275, 1, 0, 1,
-0.6134266, 0.3552062, -1.499203, 0.3607843, 1, 0, 1,
-0.6114882, 0.05047306, -2.243606, 0.3568628, 1, 0, 1,
-0.6091934, -1.136314, -2.311035, 0.3490196, 1, 0, 1,
-0.6066859, 1.192415, 0.2662654, 0.345098, 1, 0, 1,
-0.6041106, -0.9928234, -1.882329, 0.3372549, 1, 0, 1,
-0.5996761, 0.142255, -2.437251, 0.3333333, 1, 0, 1,
-0.5988492, -0.5545301, -1.694269, 0.3254902, 1, 0, 1,
-0.5979193, 1.081791, -0.4258587, 0.3215686, 1, 0, 1,
-0.597021, -0.5180916, -0.7484753, 0.3137255, 1, 0, 1,
-0.596899, 0.7953277, 0.2318809, 0.3098039, 1, 0, 1,
-0.591266, -1.424632, -2.708517, 0.3019608, 1, 0, 1,
-0.5828407, -1.855709, -2.290021, 0.2941177, 1, 0, 1,
-0.5819156, -0.2319682, -0.6810844, 0.2901961, 1, 0, 1,
-0.5763326, 0.2965029, -1.761149, 0.282353, 1, 0, 1,
-0.5742164, 0.5870198, -0.842495, 0.2784314, 1, 0, 1,
-0.5669766, -0.422987, -3.102174, 0.2705882, 1, 0, 1,
-0.5656769, 0.6087739, -0.1503301, 0.2666667, 1, 0, 1,
-0.5619121, -0.2292538, -3.330734, 0.2588235, 1, 0, 1,
-0.5574988, 0.7401347, 0.1206871, 0.254902, 1, 0, 1,
-0.5572395, -0.6843562, -2.865601, 0.2470588, 1, 0, 1,
-0.550361, 0.04074043, -1.673505, 0.2431373, 1, 0, 1,
-0.5479963, 0.5907446, 0.8014235, 0.2352941, 1, 0, 1,
-0.5459796, 0.569984, -2.761786, 0.2313726, 1, 0, 1,
-0.5456408, 0.6367413, -1.215206, 0.2235294, 1, 0, 1,
-0.5446654, -0.6699725, -5.192764, 0.2196078, 1, 0, 1,
-0.5372697, 0.2360108, -1.212774, 0.2117647, 1, 0, 1,
-0.5329171, -0.5933133, -0.7949475, 0.2078431, 1, 0, 1,
-0.5320688, 0.761735, -0.7248012, 0.2, 1, 0, 1,
-0.5289965, -1.468547, -3.771553, 0.1921569, 1, 0, 1,
-0.5288473, 0.3709317, -0.6103911, 0.1882353, 1, 0, 1,
-0.5228658, 0.01498029, -0.9955598, 0.1803922, 1, 0, 1,
-0.5202717, 1.827186, 1.094657, 0.1764706, 1, 0, 1,
-0.5201966, -0.57585, -1.027218, 0.1686275, 1, 0, 1,
-0.5188538, 0.8020775, -0.5661874, 0.1647059, 1, 0, 1,
-0.5093142, 0.4346719, 0.5039481, 0.1568628, 1, 0, 1,
-0.5057534, 0.6391029, -1.360996, 0.1529412, 1, 0, 1,
-0.497066, 0.1313172, -0.7249315, 0.145098, 1, 0, 1,
-0.4952055, -1.136975, -3.237074, 0.1411765, 1, 0, 1,
-0.4932436, -1.911196, -1.100275, 0.1333333, 1, 0, 1,
-0.4914626, -1.534483, -2.30469, 0.1294118, 1, 0, 1,
-0.489799, -2.356719, -2.127114, 0.1215686, 1, 0, 1,
-0.4844939, 1.275184, 0.6102694, 0.1176471, 1, 0, 1,
-0.4823366, 0.5226964, -0.01102311, 0.1098039, 1, 0, 1,
-0.4804784, 0.472666, -2.346582, 0.1058824, 1, 0, 1,
-0.4777066, 0.5528631, -1.136652, 0.09803922, 1, 0, 1,
-0.4727508, -0.1362518, -2.221321, 0.09019608, 1, 0, 1,
-0.4682862, -1.24714, -3.282238, 0.08627451, 1, 0, 1,
-0.4668886, 0.1654701, 0.02759761, 0.07843138, 1, 0, 1,
-0.4656378, -0.01178858, -2.454921, 0.07450981, 1, 0, 1,
-0.4655505, 1.286097, 1.529578, 0.06666667, 1, 0, 1,
-0.4625514, 0.5681911, -0.5178606, 0.0627451, 1, 0, 1,
-0.4613705, 0.4014234, -0.005998515, 0.05490196, 1, 0, 1,
-0.4578106, -0.533646, -1.611549, 0.05098039, 1, 0, 1,
-0.457515, -0.02591262, -3.038216, 0.04313726, 1, 0, 1,
-0.4561627, -0.8142316, -3.059343, 0.03921569, 1, 0, 1,
-0.4554659, -1.049251, -3.587954, 0.03137255, 1, 0, 1,
-0.4525445, 0.2482656, -0.6579701, 0.02745098, 1, 0, 1,
-0.4283696, -0.8216777, -1.863167, 0.01960784, 1, 0, 1,
-0.4148976, 0.08565384, 0.6616537, 0.01568628, 1, 0, 1,
-0.4146324, 1.781961, 0.02033187, 0.007843138, 1, 0, 1,
-0.4125997, 1.281691, -1.574188, 0.003921569, 1, 0, 1,
-0.408822, -0.4812532, -3.297312, 0, 1, 0.003921569, 1,
-0.4061679, 0.005336315, -0.9450445, 0, 1, 0.01176471, 1,
-0.4020496, -1.046123, -3.496931, 0, 1, 0.01568628, 1,
-0.3989614, -0.08963808, -2.735548, 0, 1, 0.02352941, 1,
-0.3894841, 0.3053831, -0.3552319, 0, 1, 0.02745098, 1,
-0.3880706, 0.8442789, 1.691755, 0, 1, 0.03529412, 1,
-0.3858537, 0.7193463, 2.009106, 0, 1, 0.03921569, 1,
-0.3857172, -1.052506, -4.263065, 0, 1, 0.04705882, 1,
-0.3835984, 0.8680444, -0.331087, 0, 1, 0.05098039, 1,
-0.3784755, 0.8948375, -0.7600443, 0, 1, 0.05882353, 1,
-0.3736339, -2.458762, -2.143345, 0, 1, 0.0627451, 1,
-0.3726071, 0.1569147, -0.1919235, 0, 1, 0.07058824, 1,
-0.360555, 1.170528, 0.23048, 0, 1, 0.07450981, 1,
-0.3590015, 0.7423496, -1.258537, 0, 1, 0.08235294, 1,
-0.3567111, 0.6697685, -0.6200488, 0, 1, 0.08627451, 1,
-0.3547381, -0.1449717, -1.935621, 0, 1, 0.09411765, 1,
-0.3516026, 1.188302, -1.422443, 0, 1, 0.1019608, 1,
-0.3485303, -0.6085491, -2.519987, 0, 1, 0.1058824, 1,
-0.3466055, 1.420268, -0.72597, 0, 1, 0.1137255, 1,
-0.3394466, 1.34615, -0.7168901, 0, 1, 0.1176471, 1,
-0.3392442, 0.3710201, -1.204388, 0, 1, 0.1254902, 1,
-0.3387833, 0.9862382, -1.035545, 0, 1, 0.1294118, 1,
-0.3342463, 0.1444654, -0.03619519, 0, 1, 0.1372549, 1,
-0.3339912, -1.182593, -3.154143, 0, 1, 0.1411765, 1,
-0.3265205, 0.186673, -0.5636939, 0, 1, 0.1490196, 1,
-0.3234797, -0.5432467, -3.135588, 0, 1, 0.1529412, 1,
-0.3220203, -1.541, -4.088211, 0, 1, 0.1607843, 1,
-0.3216184, 0.1481672, -1.034603, 0, 1, 0.1647059, 1,
-0.3205514, 0.321156, 0.5931727, 0, 1, 0.172549, 1,
-0.3155384, -1.52959, -3.390488, 0, 1, 0.1764706, 1,
-0.3118282, 1.261242, 0.1372162, 0, 1, 0.1843137, 1,
-0.3076586, 0.8010082, -0.0439688, 0, 1, 0.1882353, 1,
-0.3073627, -0.6931457, -2.962462, 0, 1, 0.1960784, 1,
-0.3048174, 0.8370054, -0.8471282, 0, 1, 0.2039216, 1,
-0.3038173, 1.126261, 0.06283046, 0, 1, 0.2078431, 1,
-0.3027201, 0.004469336, -0.4686751, 0, 1, 0.2156863, 1,
-0.3020439, -0.6655368, -1.764376, 0, 1, 0.2196078, 1,
-0.3008564, 1.128007, 0.150415, 0, 1, 0.227451, 1,
-0.2974842, 0.5650089, -0.9477214, 0, 1, 0.2313726, 1,
-0.2943617, 0.0728922, -1.973946, 0, 1, 0.2392157, 1,
-0.2942148, 2.314421, -0.01999091, 0, 1, 0.2431373, 1,
-0.2900424, -0.8719622, -2.317337, 0, 1, 0.2509804, 1,
-0.2811691, -0.9369147, -3.400658, 0, 1, 0.254902, 1,
-0.2745226, -0.6500724, -2.84602, 0, 1, 0.2627451, 1,
-0.2744184, -0.7976812, -3.211986, 0, 1, 0.2666667, 1,
-0.2667998, 1.127505, 0.923364, 0, 1, 0.2745098, 1,
-0.266284, -0.08757837, -2.340091, 0, 1, 0.2784314, 1,
-0.260549, 0.9305874, 0.09602477, 0, 1, 0.2862745, 1,
-0.256806, 1.28074, -0.05830799, 0, 1, 0.2901961, 1,
-0.2565162, 0.8711596, 0.6003821, 0, 1, 0.2980392, 1,
-0.2545982, 0.8860385, 0.8934041, 0, 1, 0.3058824, 1,
-0.2543717, 0.02144557, -1.84625, 0, 1, 0.3098039, 1,
-0.2529762, -1.699914, -4.060596, 0, 1, 0.3176471, 1,
-0.2517573, -1.303914, -2.583974, 0, 1, 0.3215686, 1,
-0.2500291, 0.4476503, 1.913895, 0, 1, 0.3294118, 1,
-0.2485859, 1.355617, 0.7011601, 0, 1, 0.3333333, 1,
-0.2474171, -0.5055708, -3.620065, 0, 1, 0.3411765, 1,
-0.2387915, 1.246241, 1.084767, 0, 1, 0.345098, 1,
-0.2384586, -0.2607248, -1.97941, 0, 1, 0.3529412, 1,
-0.23296, 0.6282206, -0.6026598, 0, 1, 0.3568628, 1,
-0.2263461, 1.095685, -1.959409, 0, 1, 0.3647059, 1,
-0.2259215, -0.9971189, -3.040065, 0, 1, 0.3686275, 1,
-0.2251831, 0.03387902, -1.811493, 0, 1, 0.3764706, 1,
-0.2162914, -1.246222, -2.031912, 0, 1, 0.3803922, 1,
-0.205823, -0.1379712, -2.657541, 0, 1, 0.3882353, 1,
-0.2055917, -1.390945, -1.238224, 0, 1, 0.3921569, 1,
-0.2041422, 0.3949246, 0.0348852, 0, 1, 0.4, 1,
-0.2027866, 1.370623, -1.598421, 0, 1, 0.4078431, 1,
-0.1943414, -0.3999164, -3.38714, 0, 1, 0.4117647, 1,
-0.1880644, 0.7120509, -0.2649656, 0, 1, 0.4196078, 1,
-0.1876412, -1.565608, -2.468101, 0, 1, 0.4235294, 1,
-0.1876156, 0.6745237, -0.1469027, 0, 1, 0.4313726, 1,
-0.1870766, -1.078092, -2.267294, 0, 1, 0.4352941, 1,
-0.1855056, 0.8641084, 0.3579097, 0, 1, 0.4431373, 1,
-0.1819604, -0.976391, -1.079288, 0, 1, 0.4470588, 1,
-0.1798748, -1.270937, -2.486432, 0, 1, 0.454902, 1,
-0.1756343, -1.363137, -1.459189, 0, 1, 0.4588235, 1,
-0.1716654, -0.8412296, -4.181627, 0, 1, 0.4666667, 1,
-0.1678453, 0.6093488, -1.654817, 0, 1, 0.4705882, 1,
-0.1677579, 0.3203627, -0.3960984, 0, 1, 0.4784314, 1,
-0.1661119, -1.040238, -2.204182, 0, 1, 0.4823529, 1,
-0.1626479, 0.9746273, -0.4086945, 0, 1, 0.4901961, 1,
-0.1593372, 0.8861436, 1.832845, 0, 1, 0.4941176, 1,
-0.1587533, 0.09445462, 1.273973, 0, 1, 0.5019608, 1,
-0.1575409, -0.1316461, -2.374743, 0, 1, 0.509804, 1,
-0.1548726, -1.016806, -1.759695, 0, 1, 0.5137255, 1,
-0.1529349, 1.385996, 0.04555278, 0, 1, 0.5215687, 1,
-0.15084, -0.9883723, -2.140475, 0, 1, 0.5254902, 1,
-0.1476, -0.1128511, -1.138188, 0, 1, 0.5333334, 1,
-0.1465092, 1.084173, -0.727693, 0, 1, 0.5372549, 1,
-0.1422794, -0.9315506, -1.355146, 0, 1, 0.5450981, 1,
-0.136694, 0.5626715, -0.5172417, 0, 1, 0.5490196, 1,
-0.1326604, 0.8673409, 0.3186248, 0, 1, 0.5568628, 1,
-0.1322932, 0.4528546, -0.2281843, 0, 1, 0.5607843, 1,
-0.1318154, -1.003405, -2.561825, 0, 1, 0.5686275, 1,
-0.1263032, 0.6936906, -1.447989, 0, 1, 0.572549, 1,
-0.1216142, 0.7049401, -0.1336977, 0, 1, 0.5803922, 1,
-0.115374, -0.09930749, -3.740411, 0, 1, 0.5843138, 1,
-0.1114836, -0.2693309, -1.833639, 0, 1, 0.5921569, 1,
-0.1110266, 0.1666442, 0.1229667, 0, 1, 0.5960785, 1,
-0.105283, 1.358627, -1.368055, 0, 1, 0.6039216, 1,
-0.1000912, 1.248601, 0.4814837, 0, 1, 0.6117647, 1,
-0.1000593, 0.9384933, 0.5696882, 0, 1, 0.6156863, 1,
-0.09708098, 1.288006, -0.8015954, 0, 1, 0.6235294, 1,
-0.09653369, 0.9809092, -0.4661604, 0, 1, 0.627451, 1,
-0.0956253, 0.2913218, -0.864725, 0, 1, 0.6352941, 1,
-0.09192631, -1.142503, -3.685378, 0, 1, 0.6392157, 1,
-0.08959217, 0.06957065, -2.009844, 0, 1, 0.6470588, 1,
-0.08693819, 0.3659481, 0.01322492, 0, 1, 0.6509804, 1,
-0.08380219, -0.5571226, -2.065976, 0, 1, 0.6588235, 1,
-0.07922369, 0.3326201, 0.06650548, 0, 1, 0.6627451, 1,
-0.07753329, 1.600616, 0.6739408, 0, 1, 0.6705883, 1,
-0.07636239, -0.8006899, -1.08487, 0, 1, 0.6745098, 1,
-0.07568857, -0.5092177, -3.142232, 0, 1, 0.682353, 1,
-0.07494213, -0.004020292, -1.769128, 0, 1, 0.6862745, 1,
-0.07482196, -0.1910011, -3.27702, 0, 1, 0.6941177, 1,
-0.07147971, -3.053042, -2.596701, 0, 1, 0.7019608, 1,
-0.07147543, -0.242614, -0.9372022, 0, 1, 0.7058824, 1,
-0.06926575, -0.8227049, -4.542531, 0, 1, 0.7137255, 1,
-0.06080317, 0.6372767, 0.6542652, 0, 1, 0.7176471, 1,
-0.0571038, -0.4087873, -4.210855, 0, 1, 0.7254902, 1,
-0.05552934, 1.382406, -0.1523812, 0, 1, 0.7294118, 1,
-0.05382044, 0.8440209, -1.875217, 0, 1, 0.7372549, 1,
-0.05208626, 0.04584135, 0.5985587, 0, 1, 0.7411765, 1,
-0.04295297, -0.04199237, -2.68372, 0, 1, 0.7490196, 1,
-0.0345641, 0.9387176, -0.01168968, 0, 1, 0.7529412, 1,
-0.03111274, 0.4076982, 1.433975, 0, 1, 0.7607843, 1,
-0.02559946, 0.8469265, 0.2707464, 0, 1, 0.7647059, 1,
-0.02477648, -1.79648, -4.390628, 0, 1, 0.772549, 1,
-0.02462419, 0.1032443, 1.281139, 0, 1, 0.7764706, 1,
-0.01788783, 0.08164027, -0.9313269, 0, 1, 0.7843137, 1,
-0.01424536, -0.3652811, -4.859499, 0, 1, 0.7882353, 1,
-0.008625854, 0.7327061, 2.555162, 0, 1, 0.7960784, 1,
-0.005765014, 0.1243549, 0.4217522, 0, 1, 0.8039216, 1,
-0.003292564, 0.1531218, -2.169548, 0, 1, 0.8078431, 1,
0.001378839, -1.061305, 3.450176, 0, 1, 0.8156863, 1,
0.004014154, -2.143555, 3.220995, 0, 1, 0.8196079, 1,
0.006350725, -1.002607, 3.645011, 0, 1, 0.827451, 1,
0.00754255, 0.1301202, 0.4147585, 0, 1, 0.8313726, 1,
0.01150198, -0.520082, 3.275301, 0, 1, 0.8392157, 1,
0.0119382, -1.843499, 3.092447, 0, 1, 0.8431373, 1,
0.01928888, 0.8303209, 1.020303, 0, 1, 0.8509804, 1,
0.02289764, 0.5339262, 0.603196, 0, 1, 0.854902, 1,
0.02414859, 1.006958, 0.1682483, 0, 1, 0.8627451, 1,
0.02511018, 0.6042475, -0.2397652, 0, 1, 0.8666667, 1,
0.02576903, -1.507143, 2.303062, 0, 1, 0.8745098, 1,
0.0265572, 1.209815, 0.8028443, 0, 1, 0.8784314, 1,
0.0310856, -0.8358751, 2.222533, 0, 1, 0.8862745, 1,
0.03324688, -0.1163705, 4.608275, 0, 1, 0.8901961, 1,
0.03365558, -0.3764001, 1.77206, 0, 1, 0.8980392, 1,
0.03449324, 0.5013654, 0.1476518, 0, 1, 0.9058824, 1,
0.03553412, -0.1131916, 1.256685, 0, 1, 0.9098039, 1,
0.03839502, -0.9143174, 4.475607, 0, 1, 0.9176471, 1,
0.04116539, 2.264879, -1.830702, 0, 1, 0.9215686, 1,
0.04823391, 1.676838, 0.7965776, 0, 1, 0.9294118, 1,
0.0607585, 1.430858, -0.01407164, 0, 1, 0.9333333, 1,
0.06091787, 0.7889529, 0.5469198, 0, 1, 0.9411765, 1,
0.06369527, -1.321396, 2.092005, 0, 1, 0.945098, 1,
0.06524546, 0.2237281, 0.3000053, 0, 1, 0.9529412, 1,
0.06685485, 0.2596523, -1.176537, 0, 1, 0.9568627, 1,
0.06893219, -2.340988, 3.22816, 0, 1, 0.9647059, 1,
0.07046361, 0.6744586, 0.276198, 0, 1, 0.9686275, 1,
0.07442487, 0.8265153, 0.3805011, 0, 1, 0.9764706, 1,
0.07522842, 0.06905532, 2.056889, 0, 1, 0.9803922, 1,
0.07835902, -0.1490543, 1.088223, 0, 1, 0.9882353, 1,
0.08044661, 0.7657506, 0.9939589, 0, 1, 0.9921569, 1,
0.08149834, 1.012968, 0.5178804, 0, 1, 1, 1,
0.0839949, -2.263403, 2.161407, 0, 0.9921569, 1, 1,
0.08594839, 1.222592, 0.5544217, 0, 0.9882353, 1, 1,
0.08933857, -0.5190221, 1.887407, 0, 0.9803922, 1, 1,
0.09280251, 0.442002, 0.7268075, 0, 0.9764706, 1, 1,
0.09333504, 2.054521, -0.9242741, 0, 0.9686275, 1, 1,
0.0939314, -0.04993901, 1.886613, 0, 0.9647059, 1, 1,
0.09489226, 1.655703, -0.802676, 0, 0.9568627, 1, 1,
0.1062105, -0.6953872, 2.659993, 0, 0.9529412, 1, 1,
0.1113736, -0.5009719, 2.811395, 0, 0.945098, 1, 1,
0.11505, 0.5343324, -0.951795, 0, 0.9411765, 1, 1,
0.1171945, 0.6909314, 0.2948526, 0, 0.9333333, 1, 1,
0.1181079, -0.08243503, 0.9696335, 0, 0.9294118, 1, 1,
0.1200188, -0.1870728, 3.850134, 0, 0.9215686, 1, 1,
0.1239611, 0.3134455, -0.1834209, 0, 0.9176471, 1, 1,
0.1241668, 1.021522, -0.5136489, 0, 0.9098039, 1, 1,
0.1248801, 1.30533, 0.3700952, 0, 0.9058824, 1, 1,
0.1286097, -0.5762098, 4.220467, 0, 0.8980392, 1, 1,
0.1305026, 1.240685, -0.319185, 0, 0.8901961, 1, 1,
0.1317264, 0.04643737, 0.2365737, 0, 0.8862745, 1, 1,
0.1338129, -0.2054855, 3.407493, 0, 0.8784314, 1, 1,
0.1345877, -1.808805, 2.7943, 0, 0.8745098, 1, 1,
0.1356525, 0.6754174, -0.3282378, 0, 0.8666667, 1, 1,
0.1407962, -0.9517713, 3.049505, 0, 0.8627451, 1, 1,
0.1410006, -0.7257082, 1.573746, 0, 0.854902, 1, 1,
0.1411269, -0.3278524, 3.108428, 0, 0.8509804, 1, 1,
0.1512445, 1.564544, -0.7145092, 0, 0.8431373, 1, 1,
0.152427, 0.1234399, 0.8015532, 0, 0.8392157, 1, 1,
0.1558753, -0.2665981, 2.487782, 0, 0.8313726, 1, 1,
0.1612867, -0.93314, 4.341383, 0, 0.827451, 1, 1,
0.163806, 0.5138375, -0.1121019, 0, 0.8196079, 1, 1,
0.1643853, 0.4389023, -0.4870123, 0, 0.8156863, 1, 1,
0.1697016, 0.3690248, 0.4860243, 0, 0.8078431, 1, 1,
0.1721165, -0.1651593, 2.487388, 0, 0.8039216, 1, 1,
0.1726251, 0.4482088, 1.961697, 0, 0.7960784, 1, 1,
0.1738959, -0.7341504, 1.692591, 0, 0.7882353, 1, 1,
0.1742143, -1.146047, 2.464076, 0, 0.7843137, 1, 1,
0.1760909, -1.307439, 2.009655, 0, 0.7764706, 1, 1,
0.1808463, -0.1982965, 2.924423, 0, 0.772549, 1, 1,
0.181563, 0.4141639, 0.617134, 0, 0.7647059, 1, 1,
0.1831977, -0.8560944, 1.809842, 0, 0.7607843, 1, 1,
0.1843318, -1.159275, 3.353609, 0, 0.7529412, 1, 1,
0.186407, 1.543343, 0.3232383, 0, 0.7490196, 1, 1,
0.1869532, -0.5571324, 3.173498, 0, 0.7411765, 1, 1,
0.1870202, -0.1721789, 2.189224, 0, 0.7372549, 1, 1,
0.1871368, 0.1866408, 0.4162704, 0, 0.7294118, 1, 1,
0.1913309, -0.136383, 3.930832, 0, 0.7254902, 1, 1,
0.1915441, -0.1489313, 1.833047, 0, 0.7176471, 1, 1,
0.1923804, 1.424153, -1.241408, 0, 0.7137255, 1, 1,
0.1959175, -1.09619, 3.932039, 0, 0.7058824, 1, 1,
0.199388, -0.3610038, 2.045328, 0, 0.6980392, 1, 1,
0.200742, -0.731502, 2.33482, 0, 0.6941177, 1, 1,
0.2050463, -0.9146774, 4.028862, 0, 0.6862745, 1, 1,
0.2061755, -1.419888, 2.925481, 0, 0.682353, 1, 1,
0.2095591, -0.7552097, 1.428817, 0, 0.6745098, 1, 1,
0.2115935, -0.8245996, 2.689836, 0, 0.6705883, 1, 1,
0.2125106, -1.641036, 4.421409, 0, 0.6627451, 1, 1,
0.2134585, 0.7276659, -0.675997, 0, 0.6588235, 1, 1,
0.21772, -1.712136, 3.593804, 0, 0.6509804, 1, 1,
0.2180003, -0.6495501, 2.05286, 0, 0.6470588, 1, 1,
0.2200481, -0.08163674, 3.968086, 0, 0.6392157, 1, 1,
0.2208307, 1.513745, -0.0623292, 0, 0.6352941, 1, 1,
0.2213501, 0.02218853, 3.192628, 0, 0.627451, 1, 1,
0.2226303, -0.05675237, 1.103201, 0, 0.6235294, 1, 1,
0.2236306, -0.861734, 2.126982, 0, 0.6156863, 1, 1,
0.2244337, 0.7176269, -1.058752, 0, 0.6117647, 1, 1,
0.2257086, 1.732032, 0.4707846, 0, 0.6039216, 1, 1,
0.2260183, 0.03972695, 2.950864, 0, 0.5960785, 1, 1,
0.2279157, -0.9910029, 3.778763, 0, 0.5921569, 1, 1,
0.2293914, 0.8668865, -1.445697, 0, 0.5843138, 1, 1,
0.2321388, 0.4966084, 0.791064, 0, 0.5803922, 1, 1,
0.2324718, 0.03512325, 2.549079, 0, 0.572549, 1, 1,
0.2342345, -1.679458, 2.261569, 0, 0.5686275, 1, 1,
0.2368108, 0.8509323, 0.04354856, 0, 0.5607843, 1, 1,
0.2391095, -0.8417098, 2.666431, 0, 0.5568628, 1, 1,
0.2397981, -0.2060868, 2.222206, 0, 0.5490196, 1, 1,
0.2430076, -0.5564929, 4.389358, 0, 0.5450981, 1, 1,
0.2440469, 0.5114728, 0.2445567, 0, 0.5372549, 1, 1,
0.2521428, -2.486467, 1.303808, 0, 0.5333334, 1, 1,
0.2535918, -0.1994455, 2.148538, 0, 0.5254902, 1, 1,
0.2552572, -0.6687092, 4.138761, 0, 0.5215687, 1, 1,
0.2562439, -1.406248, 2.416432, 0, 0.5137255, 1, 1,
0.2600549, 3.766284, 0.0681235, 0, 0.509804, 1, 1,
0.2637856, -1.042293, 1.981815, 0, 0.5019608, 1, 1,
0.266327, -1.750904, 2.221906, 0, 0.4941176, 1, 1,
0.2675506, -0.5131717, 3.130765, 0, 0.4901961, 1, 1,
0.2735166, -0.6463668, 3.884658, 0, 0.4823529, 1, 1,
0.273939, 0.3986282, 1.19833, 0, 0.4784314, 1, 1,
0.2755861, 0.5327461, -1.188273, 0, 0.4705882, 1, 1,
0.2784739, -0.2177844, 2.966017, 0, 0.4666667, 1, 1,
0.2794113, 1.031998, -0.30152, 0, 0.4588235, 1, 1,
0.282153, -1.459035, 3.609823, 0, 0.454902, 1, 1,
0.2827223, -0.9757066, 3.73981, 0, 0.4470588, 1, 1,
0.2828475, -0.259427, 2.99113, 0, 0.4431373, 1, 1,
0.289857, 3.18284, 0.3028005, 0, 0.4352941, 1, 1,
0.2925008, 0.8510948, 0.1017888, 0, 0.4313726, 1, 1,
0.2981592, -1.26314, 3.140228, 0, 0.4235294, 1, 1,
0.29928, -1.402845, 5.33247, 0, 0.4196078, 1, 1,
0.2994838, 0.551002, 1.022903, 0, 0.4117647, 1, 1,
0.301938, 0.4407194, 0.7541736, 0, 0.4078431, 1, 1,
0.3046934, 0.1610681, 0.9814215, 0, 0.4, 1, 1,
0.3080068, 0.04829862, 0.1915167, 0, 0.3921569, 1, 1,
0.3084278, 0.8775173, 0.7358831, 0, 0.3882353, 1, 1,
0.3088363, -0.1793435, 2.527892, 0, 0.3803922, 1, 1,
0.3109214, 1.329533, 0.2463343, 0, 0.3764706, 1, 1,
0.3112883, -0.2898701, 2.843732, 0, 0.3686275, 1, 1,
0.31442, -0.06442715, 0.4523366, 0, 0.3647059, 1, 1,
0.3145757, -0.2612843, 2.411684, 0, 0.3568628, 1, 1,
0.3209109, -1.145658, 3.682623, 0, 0.3529412, 1, 1,
0.3225997, 0.3890641, -0.5913476, 0, 0.345098, 1, 1,
0.3227561, -0.2514171, 0.7557402, 0, 0.3411765, 1, 1,
0.3240924, 0.747041, 0.9570343, 0, 0.3333333, 1, 1,
0.3251262, -2.192471, 2.972482, 0, 0.3294118, 1, 1,
0.3259803, 0.2873434, 0.6177331, 0, 0.3215686, 1, 1,
0.3265613, 1.119982, -1.288251, 0, 0.3176471, 1, 1,
0.3269783, -1.012585, 2.96049, 0, 0.3098039, 1, 1,
0.3288049, -0.02557819, 2.633768, 0, 0.3058824, 1, 1,
0.3394457, 1.358373, 2.522848, 0, 0.2980392, 1, 1,
0.341456, 0.6336914, -0.3958829, 0, 0.2901961, 1, 1,
0.3419098, 0.867951, 0.2293045, 0, 0.2862745, 1, 1,
0.3450523, -0.8440737, 3.644181, 0, 0.2784314, 1, 1,
0.3517706, -0.6870716, 0.8221709, 0, 0.2745098, 1, 1,
0.360056, 2.652331, -0.307857, 0, 0.2666667, 1, 1,
0.3626246, -0.5643615, 2.391418, 0, 0.2627451, 1, 1,
0.3632596, 1.107242, 0.6985906, 0, 0.254902, 1, 1,
0.3637998, 1.669199, 0.0792514, 0, 0.2509804, 1, 1,
0.3639255, -0.22463, 3.050499, 0, 0.2431373, 1, 1,
0.3673803, -3.11952, 2.190997, 0, 0.2392157, 1, 1,
0.3753236, -1.507893, 3.24217, 0, 0.2313726, 1, 1,
0.3764908, -1.675121, 3.899333, 0, 0.227451, 1, 1,
0.3773025, -1.719394, 3.04038, 0, 0.2196078, 1, 1,
0.3791814, -0.164249, 1.849867, 0, 0.2156863, 1, 1,
0.3901224, 0.7212142, 1.712169, 0, 0.2078431, 1, 1,
0.3910001, 0.2594956, 1.456741, 0, 0.2039216, 1, 1,
0.3924953, 1.607743, 0.09497692, 0, 0.1960784, 1, 1,
0.3950343, 0.8624836, 1.158077, 0, 0.1882353, 1, 1,
0.397974, 0.4718539, -1.09958, 0, 0.1843137, 1, 1,
0.399619, -1.555283, 0.9852901, 0, 0.1764706, 1, 1,
0.4016215, -0.3932955, 2.769485, 0, 0.172549, 1, 1,
0.4022699, -0.9553616, 2.974905, 0, 0.1647059, 1, 1,
0.4032978, 0.7715545, -0.1990967, 0, 0.1607843, 1, 1,
0.4051403, 0.245699, 0.3726315, 0, 0.1529412, 1, 1,
0.4052916, -0.3845534, 2.81995, 0, 0.1490196, 1, 1,
0.4054042, -0.05002986, 0.6480788, 0, 0.1411765, 1, 1,
0.4063534, 0.1354251, -1.574027, 0, 0.1372549, 1, 1,
0.4071382, 0.5585669, -0.4179253, 0, 0.1294118, 1, 1,
0.4075856, -0.253398, 3.20995, 0, 0.1254902, 1, 1,
0.4086902, 1.058538, 0.04794211, 0, 0.1176471, 1, 1,
0.4098748, -0.182142, 2.619903, 0, 0.1137255, 1, 1,
0.4133721, -0.4101461, 1.764786, 0, 0.1058824, 1, 1,
0.4198768, -0.588246, 2.06904, 0, 0.09803922, 1, 1,
0.4201493, 1.453966, 1.113379, 0, 0.09411765, 1, 1,
0.4216781, 0.306271, 0.7624323, 0, 0.08627451, 1, 1,
0.4231685, 0.755165, -0.04819782, 0, 0.08235294, 1, 1,
0.4259058, 1.650205, 2.053043, 0, 0.07450981, 1, 1,
0.4271992, 0.3132061, -0.4248925, 0, 0.07058824, 1, 1,
0.4326198, -1.564517, 3.234705, 0, 0.0627451, 1, 1,
0.4334047, -0.6669628, 1.936734, 0, 0.05882353, 1, 1,
0.4348716, 0.03875063, 0.8488668, 0, 0.05098039, 1, 1,
0.4367513, -1.156465, 4.967782, 0, 0.04705882, 1, 1,
0.4389277, -0.3761449, 3.233019, 0, 0.03921569, 1, 1,
0.4426716, 0.03417808, 1.056736, 0, 0.03529412, 1, 1,
0.4431647, -0.8603814, 1.549979, 0, 0.02745098, 1, 1,
0.4437921, -1.081848, 2.797833, 0, 0.02352941, 1, 1,
0.4463406, 1.511631, 1.69338, 0, 0.01568628, 1, 1,
0.4469637, -2.213739, 0.8030013, 0, 0.01176471, 1, 1,
0.4469878, -0.2902831, 1.954685, 0, 0.003921569, 1, 1,
0.4480925, -0.1872486, 1.979633, 0.003921569, 0, 1, 1,
0.4495818, 0.2817256, 1.385236, 0.007843138, 0, 1, 1,
0.4521091, 1.558506, 0.2561804, 0.01568628, 0, 1, 1,
0.4537424, 0.354806, 1.551528, 0.01960784, 0, 1, 1,
0.4586955, 0.4783809, 0.9810092, 0.02745098, 0, 1, 1,
0.459911, -0.7101161, 2.258304, 0.03137255, 0, 1, 1,
0.4603026, 1.748814, -0.6437972, 0.03921569, 0, 1, 1,
0.4605077, -0.7991673, 1.075275, 0.04313726, 0, 1, 1,
0.4720208, 0.2291119, 1.489584, 0.05098039, 0, 1, 1,
0.4725311, -1.675505, 1.294552, 0.05490196, 0, 1, 1,
0.4733381, 1.186349, 1.542265, 0.0627451, 0, 1, 1,
0.4752486, -0.5898798, 3.174572, 0.06666667, 0, 1, 1,
0.476615, -1.084548, 3.144682, 0.07450981, 0, 1, 1,
0.4781143, 1.07786, 1.561552, 0.07843138, 0, 1, 1,
0.4793335, -1.332034, 4.690776, 0.08627451, 0, 1, 1,
0.4798035, 0.2838806, 0.9495478, 0.09019608, 0, 1, 1,
0.4831825, -1.367691, 3.512371, 0.09803922, 0, 1, 1,
0.4871859, -0.1945204, 3.030664, 0.1058824, 0, 1, 1,
0.4888425, 1.151853, -0.3702762, 0.1098039, 0, 1, 1,
0.493288, -2.20761, 2.13539, 0.1176471, 0, 1, 1,
0.4937739, 0.4290779, 0.5646768, 0.1215686, 0, 1, 1,
0.49615, -1.155001, 1.947037, 0.1294118, 0, 1, 1,
0.4992018, -0.8685533, 3.001843, 0.1333333, 0, 1, 1,
0.502983, 0.06465866, 1.653707, 0.1411765, 0, 1, 1,
0.5064679, -0.06888593, 2.410254, 0.145098, 0, 1, 1,
0.5088107, 0.3636098, -0.02680237, 0.1529412, 0, 1, 1,
0.5091876, -1.979344, 2.245394, 0.1568628, 0, 1, 1,
0.5106167, -0.2018187, 1.913989, 0.1647059, 0, 1, 1,
0.5116873, 1.16382, -0.2437944, 0.1686275, 0, 1, 1,
0.5231397, -1.523316, 2.861926, 0.1764706, 0, 1, 1,
0.5235379, -0.08790535, 1.508977, 0.1803922, 0, 1, 1,
0.5285363, 0.5079815, 1.003143, 0.1882353, 0, 1, 1,
0.5290211, -0.5258016, 2.829603, 0.1921569, 0, 1, 1,
0.5294662, 1.656296, -0.7200754, 0.2, 0, 1, 1,
0.5352969, 1.558336, 0.2483939, 0.2078431, 0, 1, 1,
0.5373663, -0.5017467, 2.333184, 0.2117647, 0, 1, 1,
0.5377139, 2.949895, -0.2465526, 0.2196078, 0, 1, 1,
0.5382309, -0.2444519, 1.575866, 0.2235294, 0, 1, 1,
0.5392668, 0.1136178, 2.674927, 0.2313726, 0, 1, 1,
0.5422702, -0.5458077, 3.691161, 0.2352941, 0, 1, 1,
0.5457323, 0.4304267, 0.3934535, 0.2431373, 0, 1, 1,
0.5482014, -0.3919266, 4.693224, 0.2470588, 0, 1, 1,
0.5496959, -1.564139, 2.011195, 0.254902, 0, 1, 1,
0.5506729, -1.199476, 1.826863, 0.2588235, 0, 1, 1,
0.5526243, -1.092178, 2.546854, 0.2666667, 0, 1, 1,
0.565291, -0.2607614, 2.987998, 0.2705882, 0, 1, 1,
0.5654185, -0.2386055, 3.440881, 0.2784314, 0, 1, 1,
0.5655608, 0.2881928, -0.2416992, 0.282353, 0, 1, 1,
0.5655686, 0.2285295, 3.911011, 0.2901961, 0, 1, 1,
0.5668668, 0.3627121, 0.09836895, 0.2941177, 0, 1, 1,
0.5673317, 0.01203118, 1.151997, 0.3019608, 0, 1, 1,
0.5699558, 0.06868342, 1.102511, 0.3098039, 0, 1, 1,
0.571124, -1.015932, 1.792968, 0.3137255, 0, 1, 1,
0.5756887, -0.8400185, 0.3304089, 0.3215686, 0, 1, 1,
0.5827332, -2.651011, 3.073173, 0.3254902, 0, 1, 1,
0.5932949, 0.1663282, 0.6513674, 0.3333333, 0, 1, 1,
0.596957, -0.4755155, 2.974879, 0.3372549, 0, 1, 1,
0.598247, 0.7302216, -0.3993441, 0.345098, 0, 1, 1,
0.5997261, -1.794207, 2.196661, 0.3490196, 0, 1, 1,
0.6015753, -0.9302226, 1.34756, 0.3568628, 0, 1, 1,
0.6029464, 0.02903743, 1.095476, 0.3607843, 0, 1, 1,
0.6041055, -0.03890085, 0.9713559, 0.3686275, 0, 1, 1,
0.6098443, -1.931684, 2.13116, 0.372549, 0, 1, 1,
0.6145741, -1.0223, 1.720934, 0.3803922, 0, 1, 1,
0.6154091, 0.3462264, 1.379208, 0.3843137, 0, 1, 1,
0.6164045, -0.03577479, 1.711533, 0.3921569, 0, 1, 1,
0.6171099, -1.226421, 4.701865, 0.3960784, 0, 1, 1,
0.6178817, 0.2616447, 0.7758867, 0.4039216, 0, 1, 1,
0.6210537, 0.3504935, 1.363813, 0.4117647, 0, 1, 1,
0.6291586, -0.1933941, 0.3564442, 0.4156863, 0, 1, 1,
0.6293495, -0.9587691, 1.594466, 0.4235294, 0, 1, 1,
0.6312937, -1.446786, 2.293241, 0.427451, 0, 1, 1,
0.6406212, 0.941823, -0.4260719, 0.4352941, 0, 1, 1,
0.6409076, 0.280259, 1.915975, 0.4392157, 0, 1, 1,
0.6432864, 0.4668343, 0.5395378, 0.4470588, 0, 1, 1,
0.6448954, 0.4997547, 1.269171, 0.4509804, 0, 1, 1,
0.6461115, 1.830174, 1.632406, 0.4588235, 0, 1, 1,
0.6466979, 0.6688272, 1.381272, 0.4627451, 0, 1, 1,
0.6570894, 0.6162185, -0.3200711, 0.4705882, 0, 1, 1,
0.6571428, 0.4641491, 0.4574533, 0.4745098, 0, 1, 1,
0.6574211, 1.468602, 0.5518108, 0.4823529, 0, 1, 1,
0.6580269, -0.5461786, 1.44347, 0.4862745, 0, 1, 1,
0.6626933, -0.395209, 0.7372578, 0.4941176, 0, 1, 1,
0.6658694, 0.02222359, 1.699761, 0.5019608, 0, 1, 1,
0.6674047, 0.8258436, 0.6042784, 0.5058824, 0, 1, 1,
0.667515, 1.768842, 1.219844, 0.5137255, 0, 1, 1,
0.670593, -1.551819, 3.250879, 0.5176471, 0, 1, 1,
0.6809959, 0.3841434, 1.797926, 0.5254902, 0, 1, 1,
0.6888362, 0.0824977, 0.8106536, 0.5294118, 0, 1, 1,
0.6942949, -1.028563, 2.031167, 0.5372549, 0, 1, 1,
0.6947242, -0.4801692, 1.226357, 0.5411765, 0, 1, 1,
0.6957215, -0.5227491, 1.451993, 0.5490196, 0, 1, 1,
0.6978408, 0.003410397, 1.585121, 0.5529412, 0, 1, 1,
0.7005878, -0.9374191, 1.461652, 0.5607843, 0, 1, 1,
0.7027172, 0.5417707, 1.170046, 0.5647059, 0, 1, 1,
0.7051488, -0.2087553, 0.7730311, 0.572549, 0, 1, 1,
0.7110393, -2.812692, 3.591654, 0.5764706, 0, 1, 1,
0.7168509, 0.8082349, 0.067821, 0.5843138, 0, 1, 1,
0.719357, 1.472995, 0.8877749, 0.5882353, 0, 1, 1,
0.723838, 0.9119846, -2.277629, 0.5960785, 0, 1, 1,
0.7288678, 0.3220563, 1.003891, 0.6039216, 0, 1, 1,
0.7317664, -1.224971, 2.71588, 0.6078432, 0, 1, 1,
0.7375267, 1.74019, 0.4933477, 0.6156863, 0, 1, 1,
0.7400203, -0.4714253, 2.594366, 0.6196079, 0, 1, 1,
0.7401896, 0.249147, 0.1352512, 0.627451, 0, 1, 1,
0.740732, 0.2014525, 2.022873, 0.6313726, 0, 1, 1,
0.7414311, 0.301835, 2.644397, 0.6392157, 0, 1, 1,
0.7468551, -0.4774599, 2.410321, 0.6431373, 0, 1, 1,
0.7481067, 1.289038, 0.7349173, 0.6509804, 0, 1, 1,
0.7505722, 1.033834, 1.022519, 0.654902, 0, 1, 1,
0.7542047, -1.333519, 2.457911, 0.6627451, 0, 1, 1,
0.7552179, 1.211658, 0.5025485, 0.6666667, 0, 1, 1,
0.7633146, -0.03087905, 0.640642, 0.6745098, 0, 1, 1,
0.7660868, 0.04225476, 1.630065, 0.6784314, 0, 1, 1,
0.7677372, 1.005108, 2.912369, 0.6862745, 0, 1, 1,
0.7687198, 0.1755323, 1.499383, 0.6901961, 0, 1, 1,
0.7777007, -2.698502, 4.014976, 0.6980392, 0, 1, 1,
0.7788755, -0.1463831, 1.853444, 0.7058824, 0, 1, 1,
0.7794084, -0.4589512, 1.886813, 0.7098039, 0, 1, 1,
0.7803322, -0.913769, 2.997724, 0.7176471, 0, 1, 1,
0.7804661, -1.213455, 1.834925, 0.7215686, 0, 1, 1,
0.7853031, -1.753676, 3.831357, 0.7294118, 0, 1, 1,
0.785594, -0.6888433, 3.333645, 0.7333333, 0, 1, 1,
0.7861874, -1.039111, 3.460704, 0.7411765, 0, 1, 1,
0.8182077, 2.86315, 0.3116885, 0.7450981, 0, 1, 1,
0.8220665, 1.602699, -0.2684736, 0.7529412, 0, 1, 1,
0.8226381, -2.345332, 2.898626, 0.7568628, 0, 1, 1,
0.8233278, -0.2474556, 1.785208, 0.7647059, 0, 1, 1,
0.8250583, 0.1631202, 0.6797291, 0.7686275, 0, 1, 1,
0.8271388, -0.1190826, 2.581215, 0.7764706, 0, 1, 1,
0.8271708, -0.575152, 0.8028423, 0.7803922, 0, 1, 1,
0.8315063, -0.59916, 1.929438, 0.7882353, 0, 1, 1,
0.8431134, -0.2021748, 2.163241, 0.7921569, 0, 1, 1,
0.8442857, -0.3186527, 2.131754, 0.8, 0, 1, 1,
0.8511991, -0.986254, 1.835141, 0.8078431, 0, 1, 1,
0.8626428, -0.8307356, 2.38247, 0.8117647, 0, 1, 1,
0.8639323, -0.3945707, 2.243948, 0.8196079, 0, 1, 1,
0.8656846, 0.1505298, 3.483868, 0.8235294, 0, 1, 1,
0.870246, -0.3730403, 0.8511585, 0.8313726, 0, 1, 1,
0.8758813, -0.4348826, 3.769416, 0.8352941, 0, 1, 1,
0.8783142, 0.8803717, 0.4585071, 0.8431373, 0, 1, 1,
0.8795351, 1.299672, -0.07405199, 0.8470588, 0, 1, 1,
0.8838133, -0.5840415, 3.151356, 0.854902, 0, 1, 1,
0.8867905, -0.8613133, 0.9008314, 0.8588235, 0, 1, 1,
0.8867923, 0.9947184, -0.4762671, 0.8666667, 0, 1, 1,
0.8879876, -0.8435428, 2.246758, 0.8705882, 0, 1, 1,
0.8886788, -1.312029, 2.869926, 0.8784314, 0, 1, 1,
0.8889814, -0.5493734, 1.833997, 0.8823529, 0, 1, 1,
0.8971261, -0.8902975, 1.428878, 0.8901961, 0, 1, 1,
0.8976892, -0.6862764, 2.684363, 0.8941177, 0, 1, 1,
0.9029231, 0.4450624, 1.400821, 0.9019608, 0, 1, 1,
0.9045212, -0.7875144, 1.631, 0.9098039, 0, 1, 1,
0.9060181, 0.6547881, 0.1925175, 0.9137255, 0, 1, 1,
0.9162679, 0.2101305, 1.693434, 0.9215686, 0, 1, 1,
0.9218019, -1.122546, 4.750507, 0.9254902, 0, 1, 1,
0.9233809, 0.4182665, 0.2265944, 0.9333333, 0, 1, 1,
0.9258311, 1.467611, 1.143822, 0.9372549, 0, 1, 1,
0.9260741, 0.5272642, -0.09752782, 0.945098, 0, 1, 1,
0.9265285, 1.102798, 1.012433, 0.9490196, 0, 1, 1,
0.9296296, 0.132046, 1.077673, 0.9568627, 0, 1, 1,
0.9322945, 0.3699137, 1.673219, 0.9607843, 0, 1, 1,
0.9325358, -1.271621, 3.915834, 0.9686275, 0, 1, 1,
0.9334562, 0.619454, 0.7008848, 0.972549, 0, 1, 1,
0.9402004, 0.6936789, 0.9580164, 0.9803922, 0, 1, 1,
0.9428308, 1.097881, -0.645354, 0.9843137, 0, 1, 1,
0.9461628, -0.3240635, 4.178301, 0.9921569, 0, 1, 1,
0.9467617, 0.6909596, 1.799023, 0.9960784, 0, 1, 1,
0.9561067, 0.7003399, 2.633507, 1, 0, 0.9960784, 1,
0.9576594, -0.2926656, 0.9140923, 1, 0, 0.9882353, 1,
0.9604177, -1.475167, 4.101416, 1, 0, 0.9843137, 1,
0.9623101, 1.612257, 0.3820471, 1, 0, 0.9764706, 1,
0.9633082, -2.061111, 2.265896, 1, 0, 0.972549, 1,
0.9676442, -0.3134018, 2.564192, 1, 0, 0.9647059, 1,
0.9740477, -0.3323633, 1.496683, 1, 0, 0.9607843, 1,
0.9764071, -1.394929, 2.493864, 1, 0, 0.9529412, 1,
0.9853731, -0.02300796, 2.299532, 1, 0, 0.9490196, 1,
0.9855197, -1.354816, 2.627714, 1, 0, 0.9411765, 1,
0.9884629, 0.9336624, -0.09282398, 1, 0, 0.9372549, 1,
0.9895066, 1.306149, 0.8654577, 1, 0, 0.9294118, 1,
0.9929962, -0.1097324, 0.7047567, 1, 0, 0.9254902, 1,
0.993922, -1.051217, 2.120578, 1, 0, 0.9176471, 1,
0.995946, -0.363265, 1.343438, 1, 0, 0.9137255, 1,
1.000105, -1.236541, 1.680752, 1, 0, 0.9058824, 1,
1.010751, -1.262168, -0.0205343, 1, 0, 0.9019608, 1,
1.01191, -0.2138223, 2.700016, 1, 0, 0.8941177, 1,
1.014483, 1.117957, 0.2802893, 1, 0, 0.8862745, 1,
1.015793, -0.2592148, 1.842846, 1, 0, 0.8823529, 1,
1.016248, -0.04297861, 1.931472, 1, 0, 0.8745098, 1,
1.021778, 0.5829287, 2.59143, 1, 0, 0.8705882, 1,
1.036812, -1.268623, 1.71176, 1, 0, 0.8627451, 1,
1.036916, -0.617793, 1.920392, 1, 0, 0.8588235, 1,
1.037432, -1.303512, 3.69595, 1, 0, 0.8509804, 1,
1.038155, 0.2492788, 0.6869856, 1, 0, 0.8470588, 1,
1.038315, -0.7520429, 3.962764, 1, 0, 0.8392157, 1,
1.049213, -1.801193, 2.211939, 1, 0, 0.8352941, 1,
1.069099, -0.2994166, 1.44625, 1, 0, 0.827451, 1,
1.069848, 1.448189, 1.841525, 1, 0, 0.8235294, 1,
1.072328, -0.5953156, 0.5470963, 1, 0, 0.8156863, 1,
1.077826, -0.05247828, 3.546364, 1, 0, 0.8117647, 1,
1.078849, -1.13134, 2.276392, 1, 0, 0.8039216, 1,
1.080268, 1.291548, -0.4652814, 1, 0, 0.7960784, 1,
1.084626, -1.537179, 2.95175, 1, 0, 0.7921569, 1,
1.087227, 0.9767025, 0.8589174, 1, 0, 0.7843137, 1,
1.096546, 0.111523, 2.922888, 1, 0, 0.7803922, 1,
1.105775, -0.2017968, -1.297797, 1, 0, 0.772549, 1,
1.110783, -0.2796817, 0.8701998, 1, 0, 0.7686275, 1,
1.127238, 1.005749, 0.300861, 1, 0, 0.7607843, 1,
1.134035, -1.012258, 4.55435, 1, 0, 0.7568628, 1,
1.13573, -1.002178, 2.363293, 1, 0, 0.7490196, 1,
1.136605, 0.3864827, 0.684204, 1, 0, 0.7450981, 1,
1.143316, -0.4739134, 2.774926, 1, 0, 0.7372549, 1,
1.146514, -1.855857, 3.968341, 1, 0, 0.7333333, 1,
1.150695, -0.4070713, 2.195998, 1, 0, 0.7254902, 1,
1.160829, -0.8759006, 2.292527, 1, 0, 0.7215686, 1,
1.163342, -0.1076939, -0.652522, 1, 0, 0.7137255, 1,
1.164899, -1.082843, 3.538642, 1, 0, 0.7098039, 1,
1.170177, 1.056067, 0.02941646, 1, 0, 0.7019608, 1,
1.180593, -0.4573021, 0.6430035, 1, 0, 0.6941177, 1,
1.191885, -0.5314007, 1.561764, 1, 0, 0.6901961, 1,
1.195748, -0.3362447, 1.465069, 1, 0, 0.682353, 1,
1.197796, -0.7504335, 2.321259, 1, 0, 0.6784314, 1,
1.201911, -1.505225, 2.089289, 1, 0, 0.6705883, 1,
1.215669, 0.515469, 1.191983, 1, 0, 0.6666667, 1,
1.216589, 1.279534, 1.376493, 1, 0, 0.6588235, 1,
1.216878, -0.4210603, 2.553942, 1, 0, 0.654902, 1,
1.22909, 0.4011847, 1.32889, 1, 0, 0.6470588, 1,
1.231432, -0.8721356, 2.573898, 1, 0, 0.6431373, 1,
1.248555, -0.1419193, 2.263923, 1, 0, 0.6352941, 1,
1.255113, 0.1699773, 0.7236332, 1, 0, 0.6313726, 1,
1.256942, 1.453534, 0.7027787, 1, 0, 0.6235294, 1,
1.264773, -1.519729, 2.26023, 1, 0, 0.6196079, 1,
1.267553, -1.191833, 3.32566, 1, 0, 0.6117647, 1,
1.269773, 0.3748537, 2.754519, 1, 0, 0.6078432, 1,
1.27696, 0.7976669, 0.9126076, 1, 0, 0.6, 1,
1.278284, 1.281946, 1.171211, 1, 0, 0.5921569, 1,
1.278525, 1.530656, 1.795552, 1, 0, 0.5882353, 1,
1.28477, 0.8137782, 0.7786372, 1, 0, 0.5803922, 1,
1.296048, 0.4161517, 1.066769, 1, 0, 0.5764706, 1,
1.30681, 0.595136, 1.471809, 1, 0, 0.5686275, 1,
1.307548, -0.6351662, 1.974377, 1, 0, 0.5647059, 1,
1.314144, 1.095249, -0.179179, 1, 0, 0.5568628, 1,
1.316761, -1.277632, 3.709482, 1, 0, 0.5529412, 1,
1.320825, 0.8112187, 1.660499, 1, 0, 0.5450981, 1,
1.324115, 0.3368485, 0.5457423, 1, 0, 0.5411765, 1,
1.329001, 0.1894722, 1.59693, 1, 0, 0.5333334, 1,
1.338399, 0.3838602, 1.593953, 1, 0, 0.5294118, 1,
1.339959, 0.2442123, 2.215477, 1, 0, 0.5215687, 1,
1.348783, -0.1005348, 1.20814, 1, 0, 0.5176471, 1,
1.349229, 1.356887, 0.3085056, 1, 0, 0.509804, 1,
1.358521, 0.4256638, 1.553523, 1, 0, 0.5058824, 1,
1.365052, -0.2976501, 1.297217, 1, 0, 0.4980392, 1,
1.369576, -0.03883437, 1.87369, 1, 0, 0.4901961, 1,
1.370985, 0.6586094, 2.907434, 1, 0, 0.4862745, 1,
1.375887, -2.383888, 2.622818, 1, 0, 0.4784314, 1,
1.388896, 0.796867, 0.6994953, 1, 0, 0.4745098, 1,
1.410513, 1.370663, 0.690719, 1, 0, 0.4666667, 1,
1.413899, -1.342721, 2.459173, 1, 0, 0.4627451, 1,
1.41439, 1.222389, 0.1025781, 1, 0, 0.454902, 1,
1.416005, -0.47187, 4.536617, 1, 0, 0.4509804, 1,
1.416873, 0.03768902, 1.894282, 1, 0, 0.4431373, 1,
1.417113, 1.202076, 1.01832, 1, 0, 0.4392157, 1,
1.423003, -1.161369, 4.446634, 1, 0, 0.4313726, 1,
1.433848, -0.215011, 1.941893, 1, 0, 0.427451, 1,
1.476867, -1.127805, 4.555901, 1, 0, 0.4196078, 1,
1.489305, -0.9749685, 1.582288, 1, 0, 0.4156863, 1,
1.495981, -0.01104401, 1.634978, 1, 0, 0.4078431, 1,
1.501014, 0.5180214, 0.1307605, 1, 0, 0.4039216, 1,
1.502544, 1.953466, 3.295357, 1, 0, 0.3960784, 1,
1.515887, -0.08431581, 3.16216, 1, 0, 0.3882353, 1,
1.528424, 0.3737615, 3.050717, 1, 0, 0.3843137, 1,
1.530784, 0.9521397, 0.3731191, 1, 0, 0.3764706, 1,
1.531968, 0.7354409, 1.78322, 1, 0, 0.372549, 1,
1.560475, -0.8066506, 2.638951, 1, 0, 0.3647059, 1,
1.560869, -0.2236538, 0.8527539, 1, 0, 0.3607843, 1,
1.561597, -1.464628, 3.853589, 1, 0, 0.3529412, 1,
1.562375, -0.3772425, 1.698141, 1, 0, 0.3490196, 1,
1.563735, 2.120209, -0.6933237, 1, 0, 0.3411765, 1,
1.564803, 0.3108321, 1.798386, 1, 0, 0.3372549, 1,
1.588716, 0.7642201, 0.246972, 1, 0, 0.3294118, 1,
1.615227, 0.002127105, 1.981582, 1, 0, 0.3254902, 1,
1.618746, -0.006368529, 2.410522, 1, 0, 0.3176471, 1,
1.623159, 0.8234706, 0.8599008, 1, 0, 0.3137255, 1,
1.62667, 0.4210303, 0.9344167, 1, 0, 0.3058824, 1,
1.654454, -0.269609, 0.8059308, 1, 0, 0.2980392, 1,
1.673078, 0.7650686, 2.867824, 1, 0, 0.2941177, 1,
1.69466, -0.612294, 0.5496454, 1, 0, 0.2862745, 1,
1.700702, 1.018616, 1.409925, 1, 0, 0.282353, 1,
1.718257, -0.4080929, 3.385831, 1, 0, 0.2745098, 1,
1.732187, -0.2737185, 2.753757, 1, 0, 0.2705882, 1,
1.735162, -0.3190614, 4.193209, 1, 0, 0.2627451, 1,
1.736404, -0.920006, 2.101617, 1, 0, 0.2588235, 1,
1.746062, 0.1546915, 2.46489, 1, 0, 0.2509804, 1,
1.761023, 0.3647853, 1.021258, 1, 0, 0.2470588, 1,
1.763476, 0.9301789, 1.209027, 1, 0, 0.2392157, 1,
1.771738, -1.239284, 1.79803, 1, 0, 0.2352941, 1,
1.780525, 0.2181384, 0.2629779, 1, 0, 0.227451, 1,
1.806544, -0.7411018, 1.328254, 1, 0, 0.2235294, 1,
1.837525, 0.5642552, 1.390179, 1, 0, 0.2156863, 1,
1.838085, 0.1105919, 2.374347, 1, 0, 0.2117647, 1,
1.854935, 0.1725664, -0.1325026, 1, 0, 0.2039216, 1,
1.919745, 0.2614554, 1.557803, 1, 0, 0.1960784, 1,
1.926921, 0.2668644, 1.999614, 1, 0, 0.1921569, 1,
1.952956, -0.04289285, 2.825216, 1, 0, 0.1843137, 1,
1.962018, 0.1542596, 0.7618973, 1, 0, 0.1803922, 1,
1.975803, -0.6632838, 3.637041, 1, 0, 0.172549, 1,
2.029341, -0.5422199, 0.4909868, 1, 0, 0.1686275, 1,
2.039566, -0.5891511, 1.044407, 1, 0, 0.1607843, 1,
2.042578, 1.290011, 1.851847, 1, 0, 0.1568628, 1,
2.04662, -1.386419, 1.469639, 1, 0, 0.1490196, 1,
2.070673, -0.7362024, 2.319569, 1, 0, 0.145098, 1,
2.08505, 1.117857, 1.79861, 1, 0, 0.1372549, 1,
2.099612, -0.1058105, -0.09076203, 1, 0, 0.1333333, 1,
2.103157, 0.354966, 0.7112388, 1, 0, 0.1254902, 1,
2.121675, 0.2326304, 2.213212, 1, 0, 0.1215686, 1,
2.151072, -0.9449195, 2.353383, 1, 0, 0.1137255, 1,
2.178538, 0.7805158, 0.6729048, 1, 0, 0.1098039, 1,
2.18424, -0.3454423, 2.566822, 1, 0, 0.1019608, 1,
2.275198, -0.1274526, 2.027998, 1, 0, 0.09411765, 1,
2.341465, -0.4067946, 1.02606, 1, 0, 0.09019608, 1,
2.367246, -0.9732814, 2.74951, 1, 0, 0.08235294, 1,
2.391677, -1.632166, 1.702509, 1, 0, 0.07843138, 1,
2.403915, -0.7786123, 0.9340265, 1, 0, 0.07058824, 1,
2.435559, -0.4372005, 1.889838, 1, 0, 0.06666667, 1,
2.4933, -1.958803, 2.066058, 1, 0, 0.05882353, 1,
2.56348, 1.034714, 1.60491, 1, 0, 0.05490196, 1,
2.739483, -0.1431421, 0.8241301, 1, 0, 0.04705882, 1,
2.896641, 0.1376721, 0.5947009, 1, 0, 0.04313726, 1,
2.931147, -0.4452758, 1.441961, 1, 0, 0.03529412, 1,
2.970723, 0.07328412, 0.6652745, 1, 0, 0.03137255, 1,
2.986026, -0.700979, 2.050523, 1, 0, 0.02352941, 1,
3.041264, 0.7395434, 2.307937, 1, 0, 0.01960784, 1,
3.070329, -0.6484292, 1.638709, 1, 0, 0.01176471, 1,
3.360096, 1.907303, 0.1040713, 1, 0, 0.007843138, 1
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
0.1816957, -4.286664, -6.976791, 0, -0.5, 0.5, 0.5,
0.1816957, -4.286664, -6.976791, 1, -0.5, 0.5, 0.5,
0.1816957, -4.286664, -6.976791, 1, 1.5, 0.5, 0.5,
0.1816957, -4.286664, -6.976791, 0, 1.5, 0.5, 0.5
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
-4.074183, 0.3233821, -6.976791, 0, -0.5, 0.5, 0.5,
-4.074183, 0.3233821, -6.976791, 1, -0.5, 0.5, 0.5,
-4.074183, 0.3233821, -6.976791, 1, 1.5, 0.5, 0.5,
-4.074183, 0.3233821, -6.976791, 0, 1.5, 0.5, 0.5
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
-4.074183, -4.286664, 0.06985283, 0, -0.5, 0.5, 0.5,
-4.074183, -4.286664, 0.06985283, 1, -0.5, 0.5, 0.5,
-4.074183, -4.286664, 0.06985283, 1, 1.5, 0.5, 0.5,
-4.074183, -4.286664, 0.06985283, 0, 1.5, 0.5, 0.5
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
-2, -3.222807, -5.350643,
3, -3.222807, -5.350643,
-2, -3.222807, -5.350643,
-2, -3.400116, -5.621667,
-1, -3.222807, -5.350643,
-1, -3.400116, -5.621667,
0, -3.222807, -5.350643,
0, -3.400116, -5.621667,
1, -3.222807, -5.350643,
1, -3.400116, -5.621667,
2, -3.222807, -5.350643,
2, -3.400116, -5.621667,
3, -3.222807, -5.350643,
3, -3.400116, -5.621667
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
-2, -3.754735, -6.163717, 0, -0.5, 0.5, 0.5,
-2, -3.754735, -6.163717, 1, -0.5, 0.5, 0.5,
-2, -3.754735, -6.163717, 1, 1.5, 0.5, 0.5,
-2, -3.754735, -6.163717, 0, 1.5, 0.5, 0.5,
-1, -3.754735, -6.163717, 0, -0.5, 0.5, 0.5,
-1, -3.754735, -6.163717, 1, -0.5, 0.5, 0.5,
-1, -3.754735, -6.163717, 1, 1.5, 0.5, 0.5,
-1, -3.754735, -6.163717, 0, 1.5, 0.5, 0.5,
0, -3.754735, -6.163717, 0, -0.5, 0.5, 0.5,
0, -3.754735, -6.163717, 1, -0.5, 0.5, 0.5,
0, -3.754735, -6.163717, 1, 1.5, 0.5, 0.5,
0, -3.754735, -6.163717, 0, 1.5, 0.5, 0.5,
1, -3.754735, -6.163717, 0, -0.5, 0.5, 0.5,
1, -3.754735, -6.163717, 1, -0.5, 0.5, 0.5,
1, -3.754735, -6.163717, 1, 1.5, 0.5, 0.5,
1, -3.754735, -6.163717, 0, 1.5, 0.5, 0.5,
2, -3.754735, -6.163717, 0, -0.5, 0.5, 0.5,
2, -3.754735, -6.163717, 1, -0.5, 0.5, 0.5,
2, -3.754735, -6.163717, 1, 1.5, 0.5, 0.5,
2, -3.754735, -6.163717, 0, 1.5, 0.5, 0.5,
3, -3.754735, -6.163717, 0, -0.5, 0.5, 0.5,
3, -3.754735, -6.163717, 1, -0.5, 0.5, 0.5,
3, -3.754735, -6.163717, 1, 1.5, 0.5, 0.5,
3, -3.754735, -6.163717, 0, 1.5, 0.5, 0.5
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
-3.092057, -3, -5.350643,
-3.092057, 3, -5.350643,
-3.092057, -3, -5.350643,
-3.255744, -3, -5.621667,
-3.092057, -2, -5.350643,
-3.255744, -2, -5.621667,
-3.092057, -1, -5.350643,
-3.255744, -1, -5.621667,
-3.092057, 0, -5.350643,
-3.255744, 0, -5.621667,
-3.092057, 1, -5.350643,
-3.255744, 1, -5.621667,
-3.092057, 2, -5.350643,
-3.255744, 2, -5.621667,
-3.092057, 3, -5.350643,
-3.255744, 3, -5.621667
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
-3.583119, -3, -6.163717, 0, -0.5, 0.5, 0.5,
-3.583119, -3, -6.163717, 1, -0.5, 0.5, 0.5,
-3.583119, -3, -6.163717, 1, 1.5, 0.5, 0.5,
-3.583119, -3, -6.163717, 0, 1.5, 0.5, 0.5,
-3.583119, -2, -6.163717, 0, -0.5, 0.5, 0.5,
-3.583119, -2, -6.163717, 1, -0.5, 0.5, 0.5,
-3.583119, -2, -6.163717, 1, 1.5, 0.5, 0.5,
-3.583119, -2, -6.163717, 0, 1.5, 0.5, 0.5,
-3.583119, -1, -6.163717, 0, -0.5, 0.5, 0.5,
-3.583119, -1, -6.163717, 1, -0.5, 0.5, 0.5,
-3.583119, -1, -6.163717, 1, 1.5, 0.5, 0.5,
-3.583119, -1, -6.163717, 0, 1.5, 0.5, 0.5,
-3.583119, 0, -6.163717, 0, -0.5, 0.5, 0.5,
-3.583119, 0, -6.163717, 1, -0.5, 0.5, 0.5,
-3.583119, 0, -6.163717, 1, 1.5, 0.5, 0.5,
-3.583119, 0, -6.163717, 0, 1.5, 0.5, 0.5,
-3.583119, 1, -6.163717, 0, -0.5, 0.5, 0.5,
-3.583119, 1, -6.163717, 1, -0.5, 0.5, 0.5,
-3.583119, 1, -6.163717, 1, 1.5, 0.5, 0.5,
-3.583119, 1, -6.163717, 0, 1.5, 0.5, 0.5,
-3.583119, 2, -6.163717, 0, -0.5, 0.5, 0.5,
-3.583119, 2, -6.163717, 1, -0.5, 0.5, 0.5,
-3.583119, 2, -6.163717, 1, 1.5, 0.5, 0.5,
-3.583119, 2, -6.163717, 0, 1.5, 0.5, 0.5,
-3.583119, 3, -6.163717, 0, -0.5, 0.5, 0.5,
-3.583119, 3, -6.163717, 1, -0.5, 0.5, 0.5,
-3.583119, 3, -6.163717, 1, 1.5, 0.5, 0.5,
-3.583119, 3, -6.163717, 0, 1.5, 0.5, 0.5
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
-3.092057, -3.222807, -4,
-3.092057, -3.222807, 4,
-3.092057, -3.222807, -4,
-3.255744, -3.400116, -4,
-3.092057, -3.222807, -2,
-3.255744, -3.400116, -2,
-3.092057, -3.222807, 0,
-3.255744, -3.400116, 0,
-3.092057, -3.222807, 2,
-3.255744, -3.400116, 2,
-3.092057, -3.222807, 4,
-3.255744, -3.400116, 4
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
-3.583119, -3.754735, -4, 0, -0.5, 0.5, 0.5,
-3.583119, -3.754735, -4, 1, -0.5, 0.5, 0.5,
-3.583119, -3.754735, -4, 1, 1.5, 0.5, 0.5,
-3.583119, -3.754735, -4, 0, 1.5, 0.5, 0.5,
-3.583119, -3.754735, -2, 0, -0.5, 0.5, 0.5,
-3.583119, -3.754735, -2, 1, -0.5, 0.5, 0.5,
-3.583119, -3.754735, -2, 1, 1.5, 0.5, 0.5,
-3.583119, -3.754735, -2, 0, 1.5, 0.5, 0.5,
-3.583119, -3.754735, 0, 0, -0.5, 0.5, 0.5,
-3.583119, -3.754735, 0, 1, -0.5, 0.5, 0.5,
-3.583119, -3.754735, 0, 1, 1.5, 0.5, 0.5,
-3.583119, -3.754735, 0, 0, 1.5, 0.5, 0.5,
-3.583119, -3.754735, 2, 0, -0.5, 0.5, 0.5,
-3.583119, -3.754735, 2, 1, -0.5, 0.5, 0.5,
-3.583119, -3.754735, 2, 1, 1.5, 0.5, 0.5,
-3.583119, -3.754735, 2, 0, 1.5, 0.5, 0.5,
-3.583119, -3.754735, 4, 0, -0.5, 0.5, 0.5,
-3.583119, -3.754735, 4, 1, -0.5, 0.5, 0.5,
-3.583119, -3.754735, 4, 1, 1.5, 0.5, 0.5,
-3.583119, -3.754735, 4, 0, 1.5, 0.5, 0.5
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
-3.092057, -3.222807, -5.350643,
-3.092057, 3.869571, -5.350643,
-3.092057, -3.222807, 5.490348,
-3.092057, 3.869571, 5.490348,
-3.092057, -3.222807, -5.350643,
-3.092057, -3.222807, 5.490348,
-3.092057, 3.869571, -5.350643,
-3.092057, 3.869571, 5.490348,
-3.092057, -3.222807, -5.350643,
3.455448, -3.222807, -5.350643,
-3.092057, -3.222807, 5.490348,
3.455448, -3.222807, 5.490348,
-3.092057, 3.869571, -5.350643,
3.455448, 3.869571, -5.350643,
-3.092057, 3.869571, 5.490348,
3.455448, 3.869571, 5.490348,
3.455448, -3.222807, -5.350643,
3.455448, 3.869571, -5.350643,
3.455448, -3.222807, 5.490348,
3.455448, 3.869571, 5.490348,
3.455448, -3.222807, -5.350643,
3.455448, -3.222807, 5.490348,
3.455448, 3.869571, -5.350643,
3.455448, 3.869571, 5.490348
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
var radius = 7.750977;
var distance = 34.48497;
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
mvMatrix.translate( -0.1816957, -0.3233821, -0.06985283 );
mvMatrix.scale( 1.279954, 1.181622, 0.7730389 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.48497);
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


```r
open3d()
```

```
## glX 
##   2
```

```r
Metolcarb<-read.table("Metolcarb.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Metolcarb$V2
```

```
## Error in eval(expr, envir, enclos): object 'Metolcarb' not found
```

```r
y<-Metolcarb$V3
```

```
## Error in eval(expr, envir, enclos): object 'Metolcarb' not found
```

```r
z<-Metolcarb$V4
```

```
## Error in eval(expr, envir, enclos): object 'Metolcarb' not found
```

```r
atomcolor=c(rep("blue", 1), rep("red", 5), rep("black", 7), rep("white", 15))
#spheres3d(x, y, z, col=rainbow(1000))
spheres3d(x, y, z, col=atomcolor)
```

<canvas id="testgl2textureCanvas" style="display: none;" width="256" height="256">
Your browser does not support the HTML5 canvas element.</canvas>
<!-- ****** spheres object 25 ****** -->
<script id="testgl2vshader25" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec3 aNorm;
uniform mat4 normMatrix;
varying vec3 vNormal;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
vNormal = normalize((normMatrix * vec4(aNorm, 1.)).xyz);
}
</script>
<script id="testgl2fshader25" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec3 vNormal;
void main(void) {
vec3 eye = normalize(-vPosition.xyz);
const vec3 emission = vec3(0., 0., 0.);
const vec3 ambient1 = vec3(0., 0., 0.);
const vec3 specular1 = vec3(1., 1., 1.);// light*material
const float shininess1 = 50.;
vec4 colDiff1 = vec4(vCol.rgb * vec3(1., 1., 1.), vCol.a);
const vec3 lightDir1 = vec3(0., 0., 1.);
vec3 halfVec1 = normalize(lightDir1 + eye);
vec4 lighteffect = vec4(emission, 0.);
vec3 n = normalize(vNormal);
n = -faceforward(n, n, eye);
vec3 col1 = ambient1;
float nDotL1 = dot(n, lightDir1);
col1 = col1 + max(nDotL1, 0.) * colDiff1.rgb;
col1 = col1 + pow(max(dot(halfVec1, n), 0.), shininess1) * specular1;
lighteffect = lighteffect + vec4(col1, colDiff1.a);
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
function testgl2webGLStart() {
var debug = function(msg) {
document.getElementById("testgl2debug").innerHTML = msg;
}
debug("");
var canvas = document.getElementById("testgl2canvas");
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
var activeSubscene = 19;
zoom[19] = 1;
fov[19] = 30;
userMatrix[19] = new CanvasMatrix4();
userMatrix[19].load([
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
var canvas = document.getElementById("testgl2textureCanvas");
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
// ****** sphere object ******
var v=new Float32Array([
-1, 0, 0,
1, 0, 0,
0, -1, 0,
0, 1, 0,
0, 0, -1,
0, 0, 1,
-0.7071068, 0, -0.7071068,
-0.7071068, -0.7071068, 0,
0, -0.7071068, -0.7071068,
-0.7071068, 0, 0.7071068,
0, -0.7071068, 0.7071068,
-0.7071068, 0.7071068, 0,
0, 0.7071068, -0.7071068,
0, 0.7071068, 0.7071068,
0.7071068, -0.7071068, 0,
0.7071068, 0, -0.7071068,
0.7071068, 0, 0.7071068,
0.7071068, 0.7071068, 0,
-0.9349975, 0, -0.3546542,
-0.9349975, -0.3546542, 0,
-0.77044, -0.4507894, -0.4507894,
0, -0.3546542, -0.9349975,
-0.3546542, 0, -0.9349975,
-0.4507894, -0.4507894, -0.77044,
-0.3546542, -0.9349975, 0,
0, -0.9349975, -0.3546542,
-0.4507894, -0.77044, -0.4507894,
-0.9349975, 0, 0.3546542,
-0.77044, -0.4507894, 0.4507894,
0, -0.9349975, 0.3546542,
-0.4507894, -0.77044, 0.4507894,
-0.3546542, 0, 0.9349975,
0, -0.3546542, 0.9349975,
-0.4507894, -0.4507894, 0.77044,
-0.9349975, 0.3546542, 0,
-0.77044, 0.4507894, -0.4507894,
0, 0.9349975, -0.3546542,
-0.3546542, 0.9349975, 0,
-0.4507894, 0.77044, -0.4507894,
0, 0.3546542, -0.9349975,
-0.4507894, 0.4507894, -0.77044,
-0.77044, 0.4507894, 0.4507894,
0, 0.3546542, 0.9349975,
-0.4507894, 0.4507894, 0.77044,
0, 0.9349975, 0.3546542,
-0.4507894, 0.77044, 0.4507894,
0.9349975, -0.3546542, 0,
0.9349975, 0, -0.3546542,
0.77044, -0.4507894, -0.4507894,
0.3546542, -0.9349975, 0,
0.4507894, -0.77044, -0.4507894,
0.3546542, 0, -0.9349975,
0.4507894, -0.4507894, -0.77044,
0.9349975, 0, 0.3546542,
0.77044, -0.4507894, 0.4507894,
0.3546542, 0, 0.9349975,
0.4507894, -0.4507894, 0.77044,
0.4507894, -0.77044, 0.4507894,
0.9349975, 0.3546542, 0,
0.77044, 0.4507894, -0.4507894,
0.4507894, 0.4507894, -0.77044,
0.3546542, 0.9349975, 0,
0.4507894, 0.77044, -0.4507894,
0.77044, 0.4507894, 0.4507894,
0.4507894, 0.77044, 0.4507894,
0.4507894, 0.4507894, 0.77044
]);
var f=new Uint16Array([
0, 18, 19,
6, 20, 18,
7, 19, 20,
19, 18, 20,
4, 21, 22,
8, 23, 21,
6, 22, 23,
22, 21, 23,
2, 24, 25,
7, 26, 24,
8, 25, 26,
25, 24, 26,
7, 20, 26,
6, 23, 20,
8, 26, 23,
26, 20, 23,
0, 19, 27,
7, 28, 19,
9, 27, 28,
27, 19, 28,
2, 29, 24,
10, 30, 29,
7, 24, 30,
24, 29, 30,
5, 31, 32,
9, 33, 31,
10, 32, 33,
32, 31, 33,
9, 28, 33,
7, 30, 28,
10, 33, 30,
33, 28, 30,
0, 34, 18,
11, 35, 34,
6, 18, 35,
18, 34, 35,
3, 36, 37,
12, 38, 36,
11, 37, 38,
37, 36, 38,
4, 22, 39,
6, 40, 22,
12, 39, 40,
39, 22, 40,
6, 35, 40,
11, 38, 35,
12, 40, 38,
40, 35, 38,
0, 27, 34,
9, 41, 27,
11, 34, 41,
34, 27, 41,
5, 42, 31,
13, 43, 42,
9, 31, 43,
31, 42, 43,
3, 37, 44,
11, 45, 37,
13, 44, 45,
44, 37, 45,
11, 41, 45,
9, 43, 41,
13, 45, 43,
45, 41, 43,
1, 46, 47,
14, 48, 46,
15, 47, 48,
47, 46, 48,
2, 25, 49,
8, 50, 25,
14, 49, 50,
49, 25, 50,
4, 51, 21,
15, 52, 51,
8, 21, 52,
21, 51, 52,
15, 48, 52,
14, 50, 48,
8, 52, 50,
52, 48, 50,
1, 53, 46,
16, 54, 53,
14, 46, 54,
46, 53, 54,
5, 32, 55,
10, 56, 32,
16, 55, 56,
55, 32, 56,
2, 49, 29,
14, 57, 49,
10, 29, 57,
29, 49, 57,
14, 54, 57,
16, 56, 54,
10, 57, 56,
57, 54, 56,
1, 47, 58,
15, 59, 47,
17, 58, 59,
58, 47, 59,
4, 39, 51,
12, 60, 39,
15, 51, 60,
51, 39, 60,
3, 61, 36,
17, 62, 61,
12, 36, 62,
36, 61, 62,
17, 59, 62,
15, 60, 59,
12, 62, 60,
62, 59, 60,
1, 58, 53,
17, 63, 58,
16, 53, 63,
53, 58, 63,
3, 44, 61,
13, 64, 44,
17, 61, 64,
61, 44, 64,
5, 55, 42,
16, 65, 55,
13, 42, 65,
42, 55, 65,
16, 63, 65,
17, 64, 63,
13, 65, 64,
65, 63, 64
]);
var sphereBuf = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, sphereBuf);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var sphereIbuf = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, sphereIbuf);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
// ****** spheres object 25 ******
var prog25  = gl.createProgram();
gl.attachShader(prog25, getShader( gl, "testgl2vshader25" ));
gl.attachShader(prog25, getShader( gl, "testgl2fshader25" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog25, 0, "aPos");
gl.bindAttribLocation(prog25, 1, "aCol");
gl.linkProgram(prog25);
var v=new Float32Array([
-2.996705, -0.397896, -0.7260834, 0, 0, 1, 1, 1,
-2.77128, -0.0187569, -1.35318, 1, 0, 0, 1, 1,
-2.519953, 0.1453817, -0.9843093, 1, 0, 0, 1, 1,
-2.473956, -0.03359514, -0.4563269, 1, 0, 0, 1, 1,
-2.396469, -0.9450722, -1.976728, 1, 0, 0, 1, 1,
-2.35152, -0.3533065, -2.968601, 1, 0, 0, 1, 1,
-2.324858, -0.08266073, -1.997254, 0, 0, 0, 1, 1,
-2.28128, 0.0184876, -1.657287, 0, 0, 0, 1, 1,
-2.2682, -0.6497489, -0.5387816, 0, 0, 0, 1, 1,
-2.257378, -0.9105451, -1.831215, 0, 0, 0, 1, 1,
-2.161296, 1.429848, -1.464812, 0, 0, 0, 1, 1,
-2.1375, -0.5534104, -0.9608186, 0, 0, 0, 1, 1,
-2.12747, -0.7348515, -1.149211, 0, 0, 0, 1, 1,
-2.078315, 1.127513, -1.761568, 1, 1, 1, 1, 1,
-2.066042, 1.574945, -0.5012745, 1, 1, 1, 1, 1,
-2.027467, 1.480379, -1.025293, 1, 1, 1, 1, 1,
-1.994691, -0.5818361, -3.149161, 1, 1, 1, 1, 1,
-1.993749, -1.982597, -1.007191, 1, 1, 1, 1, 1,
-1.980764, 0.1165113, -2.748715, 1, 1, 1, 1, 1,
-1.979173, -0.6900483, -2.921863, 1, 1, 1, 1, 1,
-1.94575, -1.317115, -2.183228, 1, 1, 1, 1, 1,
-1.945366, -0.5489719, -2.251694, 1, 1, 1, 1, 1,
-1.941711, 0.7930261, 1.197034, 1, 1, 1, 1, 1,
-1.933801, 0.4550949, -0.7627342, 1, 1, 1, 1, 1,
-1.932875, 0.2142976, -2.340821, 1, 1, 1, 1, 1,
-1.899209, -0.2884643, -3.527772, 1, 1, 1, 1, 1,
-1.858106, 0.3511383, -1.160495, 1, 1, 1, 1, 1,
-1.812472, 0.9034128, -1.521278, 1, 1, 1, 1, 1,
-1.779297, 1.580332, -0.06923886, 0, 0, 1, 1, 1,
-1.774801, 0.9649834, -0.8528823, 1, 0, 0, 1, 1,
-1.737622, -1.428336, -3.113549, 1, 0, 0, 1, 1,
-1.726001, 0.6080304, -1.321688, 1, 0, 0, 1, 1,
-1.720681, -0.7058203, -2.379997, 1, 0, 0, 1, 1,
-1.718805, 0.8752652, -3.222498, 1, 0, 0, 1, 1,
-1.716544, 0.2575277, -3.878132, 0, 0, 0, 1, 1,
-1.715261, -0.4500718, -1.594832, 0, 0, 0, 1, 1,
-1.710114, -0.6071609, -1.870966, 0, 0, 0, 1, 1,
-1.687842, -0.9695936, -2.362789, 0, 0, 0, 1, 1,
-1.684496, -0.8115795, -2.846098, 0, 0, 0, 1, 1,
-1.683152, 1.421227, -2.250817, 0, 0, 0, 1, 1,
-1.680373, 0.3737122, -2.265924, 0, 0, 0, 1, 1,
-1.680124, -0.5878717, -4.726509, 1, 1, 1, 1, 1,
-1.667341, 0.5657454, -1.781373, 1, 1, 1, 1, 1,
-1.659935, 0.7905549, -1.011543, 1, 1, 1, 1, 1,
-1.651191, 0.01013811, -2.48998, 1, 1, 1, 1, 1,
-1.633548, 1.134655, -1.988337, 1, 1, 1, 1, 1,
-1.623815, -1.863313, -2.429564, 1, 1, 1, 1, 1,
-1.586336, 1.123695, 1.132815, 1, 1, 1, 1, 1,
-1.576432, 1.125505, -1.170717, 1, 1, 1, 1, 1,
-1.564496, 0.2887695, -3.444885, 1, 1, 1, 1, 1,
-1.536265, 0.4315943, -1.143477, 1, 1, 1, 1, 1,
-1.532346, 0.5010272, -1.08117, 1, 1, 1, 1, 1,
-1.510665, 1.236947, -0.09940416, 1, 1, 1, 1, 1,
-1.508926, 0.4524377, -1.220398, 1, 1, 1, 1, 1,
-1.507423, -0.04308288, -0.9260806, 1, 1, 1, 1, 1,
-1.500485, -0.38477, -0.2067675, 1, 1, 1, 1, 1,
-1.489278, -0.3207529, -2.332419, 0, 0, 1, 1, 1,
-1.488864, 0.2349569, -0.9551416, 1, 0, 0, 1, 1,
-1.478489, -1.301148, -2.044252, 1, 0, 0, 1, 1,
-1.477102, 0.5480275, -2.656425, 1, 0, 0, 1, 1,
-1.475785, 1.226238, -0.1495999, 1, 0, 0, 1, 1,
-1.472796, -0.3057307, -2.089407, 1, 0, 0, 1, 1,
-1.459781, -0.8568184, -2.255061, 0, 0, 0, 1, 1,
-1.459723, 0.6958887, 0.2450916, 0, 0, 0, 1, 1,
-1.43791, 0.03464524, -0.287879, 0, 0, 0, 1, 1,
-1.436003, 0.8681973, -0.2283703, 0, 0, 0, 1, 1,
-1.434995, 0.5951924, -1.229512, 0, 0, 0, 1, 1,
-1.43228, -1.804201, -1.679774, 0, 0, 0, 1, 1,
-1.432081, 0.052554, -3.286625, 0, 0, 0, 1, 1,
-1.427881, 0.7184473, -1.397532, 1, 1, 1, 1, 1,
-1.41728, -0.2075926, -3.391892, 1, 1, 1, 1, 1,
-1.408188, 0.1891561, -1.931092, 1, 1, 1, 1, 1,
-1.408117, -0.9575883, -2.381409, 1, 1, 1, 1, 1,
-1.405149, -0.8682582, -2.002315, 1, 1, 1, 1, 1,
-1.401109, 0.3330742, -0.5168775, 1, 1, 1, 1, 1,
-1.399294, -0.2158, -2.619414, 1, 1, 1, 1, 1,
-1.386826, -1.335832, -2.630274, 1, 1, 1, 1, 1,
-1.38058, -1.815062, -1.321573, 1, 1, 1, 1, 1,
-1.380348, -0.6773846, -1.252897, 1, 1, 1, 1, 1,
-1.37741, -0.5885183, -2.65193, 1, 1, 1, 1, 1,
-1.36533, -0.6013612, -1.091664, 1, 1, 1, 1, 1,
-1.357509, -0.03965149, -2.793635, 1, 1, 1, 1, 1,
-1.356114, 1.619335, -1.488348, 1, 1, 1, 1, 1,
-1.355534, -0.5901801, -1.980896, 1, 1, 1, 1, 1,
-1.349229, -0.735266, -2.216094, 0, 0, 1, 1, 1,
-1.341373, 0.6084696, -0.4540653, 1, 0, 0, 1, 1,
-1.341219, -1.45798, -1.663342, 1, 0, 0, 1, 1,
-1.338999, -0.4874347, -4.532778, 1, 0, 0, 1, 1,
-1.335691, 1.093847, -1.176388, 1, 0, 0, 1, 1,
-1.335161, -0.01576644, -1.693137, 1, 0, 0, 1, 1,
-1.333326, 0.3127861, -2.610533, 0, 0, 0, 1, 1,
-1.330462, 0.3338886, -2.228418, 0, 0, 0, 1, 1,
-1.326938, 0.2839465, -2.539562, 0, 0, 0, 1, 1,
-1.326779, 0.6715132, 0.3779516, 0, 0, 0, 1, 1,
-1.322318, 1.39536, 1.209167, 0, 0, 0, 1, 1,
-1.316412, 0.5423025, -1.739989, 0, 0, 0, 1, 1,
-1.316215, -1.324625, -2.029047, 0, 0, 0, 1, 1,
-1.313005, 0.3581785, -2.721069, 1, 1, 1, 1, 1,
-1.294044, 0.4467481, -2.30765, 1, 1, 1, 1, 1,
-1.289781, 0.2165901, -3.084614, 1, 1, 1, 1, 1,
-1.28381, -0.1540708, 0.1741474, 1, 1, 1, 1, 1,
-1.268394, -0.03510312, -1.837923, 1, 1, 1, 1, 1,
-1.266194, 1.90901, -0.5120344, 1, 1, 1, 1, 1,
-1.264069, 0.5416818, -0.07897504, 1, 1, 1, 1, 1,
-1.246473, -1.38807, -0.9081337, 1, 1, 1, 1, 1,
-1.2352, -0.1645374, -1.027398, 1, 1, 1, 1, 1,
-1.233745, 0.4563673, -1.100336, 1, 1, 1, 1, 1,
-1.232746, 0.8515118, -0.1879099, 1, 1, 1, 1, 1,
-1.232118, -0.6645314, -0.7283176, 1, 1, 1, 1, 1,
-1.226873, 0.5494879, -1.256222, 1, 1, 1, 1, 1,
-1.225924, 0.1021401, -1.184984, 1, 1, 1, 1, 1,
-1.22055, 0.2031138, -1.250219, 1, 1, 1, 1, 1,
-1.21265, -1.172145, -1.698313, 0, 0, 1, 1, 1,
-1.207428, 0.6685817, -1.155152, 1, 0, 0, 1, 1,
-1.205865, 0.5584821, -1.8443, 1, 0, 0, 1, 1,
-1.20268, 0.9551475, -0.536692, 1, 0, 0, 1, 1,
-1.197794, -0.2538075, -3.179853, 1, 0, 0, 1, 1,
-1.189581, -1.579503, -1.799565, 1, 0, 0, 1, 1,
-1.186021, 0.6269796, 0.09487555, 0, 0, 0, 1, 1,
-1.181568, 2.264153, 0.2615136, 0, 0, 0, 1, 1,
-1.180786, -0.2815, -0.9763986, 0, 0, 0, 1, 1,
-1.180087, 0.7090521, -0.1920792, 0, 0, 0, 1, 1,
-1.178225, -0.2060976, -1.245041, 0, 0, 0, 1, 1,
-1.178182, -1.244482, -2.830417, 0, 0, 0, 1, 1,
-1.17634, 2.315192, 0.958518, 0, 0, 0, 1, 1,
-1.166146, -0.1262148, -2.46518, 1, 1, 1, 1, 1,
-1.163819, -1.879711, -3.11088, 1, 1, 1, 1, 1,
-1.152844, 1.383453, -1.679741, 1, 1, 1, 1, 1,
-1.136178, 0.2642043, -1.051425, 1, 1, 1, 1, 1,
-1.129034, 0.1116429, -0.09095452, 1, 1, 1, 1, 1,
-1.120916, 0.7662538, -2.505164, 1, 1, 1, 1, 1,
-1.11973, 0.0492337, 0.06138731, 1, 1, 1, 1, 1,
-1.119396, -0.5872648, -2.54644, 1, 1, 1, 1, 1,
-1.116153, 0.7629969, -0.7559595, 1, 1, 1, 1, 1,
-1.11548, -0.3405389, -3.139179, 1, 1, 1, 1, 1,
-1.114698, -0.7211744, -2.213841, 1, 1, 1, 1, 1,
-1.112455, 0.7334718, -0.8660877, 1, 1, 1, 1, 1,
-1.111757, 0.8923134, -1.265655, 1, 1, 1, 1, 1,
-1.10491, -1.201399, -3.750138, 1, 1, 1, 1, 1,
-1.099807, 0.7523039, 0.1931175, 1, 1, 1, 1, 1,
-1.096219, -0.7261552, -1.702718, 0, 0, 1, 1, 1,
-1.090259, -1.351659, -2.489898, 1, 0, 0, 1, 1,
-1.089282, 0.5859256, -1.768897, 1, 0, 0, 1, 1,
-1.085974, 0.3935638, -1.247121, 1, 0, 0, 1, 1,
-1.083743, -0.06737771, -2.369379, 1, 0, 0, 1, 1,
-1.076116, 1.621781, -1.164812, 1, 0, 0, 1, 1,
-1.07348, 0.7848061, -0.877416, 0, 0, 0, 1, 1,
-1.073302, -1.263759, -1.4594, 0, 0, 0, 1, 1,
-1.067719, 0.2345849, 0.2998167, 0, 0, 0, 1, 1,
-1.065799, -0.2704827, -1.006524, 0, 0, 0, 1, 1,
-1.061546, 2.566885, -0.6851531, 0, 0, 0, 1, 1,
-1.059476, -0.1792275, -2.138718, 0, 0, 0, 1, 1,
-1.056551, 1.530568, 0.458407, 0, 0, 0, 1, 1,
-1.050266, 1.607796, 0.02332794, 1, 1, 1, 1, 1,
-1.047521, -1.327799, -2.85864, 1, 1, 1, 1, 1,
-1.035644, 0.4048528, -3.889468, 1, 1, 1, 1, 1,
-1.033095, -0.7481302, -2.04353, 1, 1, 1, 1, 1,
-1.032778, 1.47722, -2.433845, 1, 1, 1, 1, 1,
-1.023064, 1.487503, 1.040434, 1, 1, 1, 1, 1,
-1.018354, -0.7353784, -2.92475, 1, 1, 1, 1, 1,
-1.015542, 1.198313, -0.6375515, 1, 1, 1, 1, 1,
-1.010695, 1.146381, -1.346679, 1, 1, 1, 1, 1,
-1.00512, -0.6846737, -0.4586687, 1, 1, 1, 1, 1,
-1.002934, -0.7768314, -2.934851, 1, 1, 1, 1, 1,
-1.002033, -0.1364344, -2.516915, 1, 1, 1, 1, 1,
-0.9944116, -1.058162, -2.905474, 1, 1, 1, 1, 1,
-0.9924904, 0.9315575, -0.3540638, 1, 1, 1, 1, 1,
-0.9907495, 1.566297, -0.2947254, 1, 1, 1, 1, 1,
-0.9838645, -1.383047, -1.554432, 0, 0, 1, 1, 1,
-0.9807858, 1.428937, -1.155746, 1, 0, 0, 1, 1,
-0.9805078, 0.3992456, -1.506785, 1, 0, 0, 1, 1,
-0.9796396, 2.347478, -0.01996846, 1, 0, 0, 1, 1,
-0.9773018, -2.028496, -1.458939, 1, 0, 0, 1, 1,
-0.9769657, 2.250313, -0.3361282, 1, 0, 0, 1, 1,
-0.9712306, 0.6024755, -0.7603787, 0, 0, 0, 1, 1,
-0.9706013, -0.0528612, -3.228543, 0, 0, 0, 1, 1,
-0.9695105, -0.1275132, -1.604436, 0, 0, 0, 1, 1,
-0.9667866, -0.583087, -2.373442, 0, 0, 0, 1, 1,
-0.958755, -1.101952, -1.525922, 0, 0, 0, 1, 1,
-0.945582, -0.1997174, -3.589509, 0, 0, 0, 1, 1,
-0.9345008, 1.019969, -1.448722, 0, 0, 0, 1, 1,
-0.9339771, -1.381085, -4.192373, 1, 1, 1, 1, 1,
-0.9319739, 1.448431, 0.9754021, 1, 1, 1, 1, 1,
-0.9300142, 0.05877845, -2.678717, 1, 1, 1, 1, 1,
-0.9265111, -2.052667, -3.112199, 1, 1, 1, 1, 1,
-0.9254526, -0.890569, -1.935863, 1, 1, 1, 1, 1,
-0.9247788, -0.03788399, -0.09811091, 1, 1, 1, 1, 1,
-0.9237843, -0.4734338, -2.601321, 1, 1, 1, 1, 1,
-0.9222894, -1.285633, -2.400938, 1, 1, 1, 1, 1,
-0.9190882, 0.5083655, -1.406729, 1, 1, 1, 1, 1,
-0.9132041, 0.566712, -2.383985, 1, 1, 1, 1, 1,
-0.9060428, 0.2837306, -1.717744, 1, 1, 1, 1, 1,
-0.9018576, -1.769524, -3.079184, 1, 1, 1, 1, 1,
-0.8975956, -2.349714, -2.502577, 1, 1, 1, 1, 1,
-0.8937075, 0.8126624, -0.7514089, 1, 1, 1, 1, 1,
-0.8876854, -1.17808, -1.962918, 1, 1, 1, 1, 1,
-0.8801311, -0.5272853, -0.3404923, 0, 0, 1, 1, 1,
-0.8753245, 0.8331199, -1.64126, 1, 0, 0, 1, 1,
-0.871689, -0.8896893, -2.036726, 1, 0, 0, 1, 1,
-0.8687353, -0.9924966, -2.542641, 1, 0, 0, 1, 1,
-0.8670519, 1.099718, -0.490705, 1, 0, 0, 1, 1,
-0.8654192, 0.2310789, -2.286707, 1, 0, 0, 1, 1,
-0.8644366, -0.1299823, -0.4946487, 0, 0, 0, 1, 1,
-0.8619854, -0.376076, -2.893375, 0, 0, 0, 1, 1,
-0.8604634, 0.9968288, -0.1179055, 0, 0, 0, 1, 1,
-0.8555657, -1.049313, -2.700822, 0, 0, 0, 1, 1,
-0.8503653, 0.1161152, -1.687755, 0, 0, 0, 1, 1,
-0.8468739, -0.2039311, -0.51131, 0, 0, 0, 1, 1,
-0.8453584, 1.18951, -1.177269, 0, 0, 0, 1, 1,
-0.8327499, -1.723615, -1.510786, 1, 1, 1, 1, 1,
-0.8317353, 0.03458595, -1.043894, 1, 1, 1, 1, 1,
-0.8297351, -1.57046, -1.946843, 1, 1, 1, 1, 1,
-0.827138, 0.6280972, 0.3862535, 1, 1, 1, 1, 1,
-0.8263016, -0.9533729, -2.298355, 1, 1, 1, 1, 1,
-0.8258339, 0.0857197, -2.084915, 1, 1, 1, 1, 1,
-0.8244573, -0.3565534, 0.7107988, 1, 1, 1, 1, 1,
-0.8117766, -1.652951, -3.161284, 1, 1, 1, 1, 1,
-0.8067709, 1.601698, -0.741983, 1, 1, 1, 1, 1,
-0.7985108, -0.1235608, -0.5748992, 1, 1, 1, 1, 1,
-0.7961012, -1.502479, -3.426433, 1, 1, 1, 1, 1,
-0.7946304, 1.107694, -0.6548707, 1, 1, 1, 1, 1,
-0.7912017, 0.6654137, 1.132343, 1, 1, 1, 1, 1,
-0.7899607, 0.1684396, -1.03677, 1, 1, 1, 1, 1,
-0.7893404, -1.319024, -3.100943, 1, 1, 1, 1, 1,
-0.7853775, -0.5380299, -0.7741174, 0, 0, 1, 1, 1,
-0.7802721, 0.07603382, -0.5454524, 1, 0, 0, 1, 1,
-0.7749233, -0.6806983, -1.657108, 1, 0, 0, 1, 1,
-0.7748142, -0.1697957, -1.876264, 1, 0, 0, 1, 1,
-0.7699036, 0.4606012, -0.3144243, 1, 0, 0, 1, 1,
-0.7667125, 0.7053797, -1.789494, 1, 0, 0, 1, 1,
-0.7642148, -2.010952, -3.148339, 0, 0, 0, 1, 1,
-0.7516601, 0.3447783, -1.518502, 0, 0, 0, 1, 1,
-0.7513379, 1.996122, -1.930298, 0, 0, 0, 1, 1,
-0.7507139, -0.3958605, -2.062921, 0, 0, 0, 1, 1,
-0.7481174, -0.2140947, -1.688808, 0, 0, 0, 1, 1,
-0.740796, -1.65156, -2.840674, 0, 0, 0, 1, 1,
-0.7171392, -0.2593311, -1.284995, 0, 0, 0, 1, 1,
-0.7165581, 0.9938474, 0.7216203, 1, 1, 1, 1, 1,
-0.7132034, 0.7150851, -1.521341, 1, 1, 1, 1, 1,
-0.7127539, -0.5407943, -1.910224, 1, 1, 1, 1, 1,
-0.711045, -1.492031, -3.124033, 1, 1, 1, 1, 1,
-0.7107181, 0.6304482, -1.10301, 1, 1, 1, 1, 1,
-0.7105961, -0.9391356, -3.31331, 1, 1, 1, 1, 1,
-0.7085344, 0.03000692, -1.218136, 1, 1, 1, 1, 1,
-0.7062494, 0.488485, -1.810017, 1, 1, 1, 1, 1,
-0.7027878, -0.7097651, -3.758362, 1, 1, 1, 1, 1,
-0.6994954, 1.479055, 0.07924439, 1, 1, 1, 1, 1,
-0.6983295, -0.2334883, -1.799574, 1, 1, 1, 1, 1,
-0.6955727, 0.9408754, -1.498985, 1, 1, 1, 1, 1,
-0.6896284, 2.391921, 0.1610543, 1, 1, 1, 1, 1,
-0.6859746, -0.06975327, -0.8386146, 1, 1, 1, 1, 1,
-0.6845705, 0.2359585, -0.8228908, 1, 1, 1, 1, 1,
-0.6812056, 1.521541, -0.2839488, 0, 0, 1, 1, 1,
-0.67748, -0.4644311, -2.193053, 1, 0, 0, 1, 1,
-0.6768587, 0.2143343, -0.5479091, 1, 0, 0, 1, 1,
-0.6767094, 0.1472227, -1.616144, 1, 0, 0, 1, 1,
-0.6702556, 2.544952, 0.6125706, 1, 0, 0, 1, 1,
-0.6701809, -1.446766, -3.430701, 1, 0, 0, 1, 1,
-0.6699742, 2.255449, -0.7589331, 0, 0, 0, 1, 1,
-0.6695886, 0.3378361, 1.247799, 0, 0, 0, 1, 1,
-0.6649422, -0.0794434, 0.01054967, 0, 0, 0, 1, 1,
-0.6636485, 0.2590048, -1.267629, 0, 0, 0, 1, 1,
-0.660341, 0.1906819, -1.815552, 0, 0, 0, 1, 1,
-0.6589426, 0.784876, -1.317029, 0, 0, 0, 1, 1,
-0.6518511, 0.7527567, -0.4218237, 0, 0, 0, 1, 1,
-0.6435112, -0.8444136, -2.538247, 1, 1, 1, 1, 1,
-0.6424211, 2.21935, 2.100482, 1, 1, 1, 1, 1,
-0.6374879, -1.972126, -1.336309, 1, 1, 1, 1, 1,
-0.6295942, -0.4039339, -2.544551, 1, 1, 1, 1, 1,
-0.623788, 0.8012439, -1.880811, 1, 1, 1, 1, 1,
-0.6153148, 0.722342, 0.8420938, 1, 1, 1, 1, 1,
-0.6146429, 0.7289472, -0.115726, 1, 1, 1, 1, 1,
-0.6137973, -0.855634, -3.397666, 1, 1, 1, 1, 1,
-0.6134266, 0.3552062, -1.499203, 1, 1, 1, 1, 1,
-0.6114882, 0.05047306, -2.243606, 1, 1, 1, 1, 1,
-0.6091934, -1.136314, -2.311035, 1, 1, 1, 1, 1,
-0.6066859, 1.192415, 0.2662654, 1, 1, 1, 1, 1,
-0.6041106, -0.9928234, -1.882329, 1, 1, 1, 1, 1,
-0.5996761, 0.142255, -2.437251, 1, 1, 1, 1, 1,
-0.5988492, -0.5545301, -1.694269, 1, 1, 1, 1, 1,
-0.5979193, 1.081791, -0.4258587, 0, 0, 1, 1, 1,
-0.597021, -0.5180916, -0.7484753, 1, 0, 0, 1, 1,
-0.596899, 0.7953277, 0.2318809, 1, 0, 0, 1, 1,
-0.591266, -1.424632, -2.708517, 1, 0, 0, 1, 1,
-0.5828407, -1.855709, -2.290021, 1, 0, 0, 1, 1,
-0.5819156, -0.2319682, -0.6810844, 1, 0, 0, 1, 1,
-0.5763326, 0.2965029, -1.761149, 0, 0, 0, 1, 1,
-0.5742164, 0.5870198, -0.842495, 0, 0, 0, 1, 1,
-0.5669766, -0.422987, -3.102174, 0, 0, 0, 1, 1,
-0.5656769, 0.6087739, -0.1503301, 0, 0, 0, 1, 1,
-0.5619121, -0.2292538, -3.330734, 0, 0, 0, 1, 1,
-0.5574988, 0.7401347, 0.1206871, 0, 0, 0, 1, 1,
-0.5572395, -0.6843562, -2.865601, 0, 0, 0, 1, 1,
-0.550361, 0.04074043, -1.673505, 1, 1, 1, 1, 1,
-0.5479963, 0.5907446, 0.8014235, 1, 1, 1, 1, 1,
-0.5459796, 0.569984, -2.761786, 1, 1, 1, 1, 1,
-0.5456408, 0.6367413, -1.215206, 1, 1, 1, 1, 1,
-0.5446654, -0.6699725, -5.192764, 1, 1, 1, 1, 1,
-0.5372697, 0.2360108, -1.212774, 1, 1, 1, 1, 1,
-0.5329171, -0.5933133, -0.7949475, 1, 1, 1, 1, 1,
-0.5320688, 0.761735, -0.7248012, 1, 1, 1, 1, 1,
-0.5289965, -1.468547, -3.771553, 1, 1, 1, 1, 1,
-0.5288473, 0.3709317, -0.6103911, 1, 1, 1, 1, 1,
-0.5228658, 0.01498029, -0.9955598, 1, 1, 1, 1, 1,
-0.5202717, 1.827186, 1.094657, 1, 1, 1, 1, 1,
-0.5201966, -0.57585, -1.027218, 1, 1, 1, 1, 1,
-0.5188538, 0.8020775, -0.5661874, 1, 1, 1, 1, 1,
-0.5093142, 0.4346719, 0.5039481, 1, 1, 1, 1, 1,
-0.5057534, 0.6391029, -1.360996, 0, 0, 1, 1, 1,
-0.497066, 0.1313172, -0.7249315, 1, 0, 0, 1, 1,
-0.4952055, -1.136975, -3.237074, 1, 0, 0, 1, 1,
-0.4932436, -1.911196, -1.100275, 1, 0, 0, 1, 1,
-0.4914626, -1.534483, -2.30469, 1, 0, 0, 1, 1,
-0.489799, -2.356719, -2.127114, 1, 0, 0, 1, 1,
-0.4844939, 1.275184, 0.6102694, 0, 0, 0, 1, 1,
-0.4823366, 0.5226964, -0.01102311, 0, 0, 0, 1, 1,
-0.4804784, 0.472666, -2.346582, 0, 0, 0, 1, 1,
-0.4777066, 0.5528631, -1.136652, 0, 0, 0, 1, 1,
-0.4727508, -0.1362518, -2.221321, 0, 0, 0, 1, 1,
-0.4682862, -1.24714, -3.282238, 0, 0, 0, 1, 1,
-0.4668886, 0.1654701, 0.02759761, 0, 0, 0, 1, 1,
-0.4656378, -0.01178858, -2.454921, 1, 1, 1, 1, 1,
-0.4655505, 1.286097, 1.529578, 1, 1, 1, 1, 1,
-0.4625514, 0.5681911, -0.5178606, 1, 1, 1, 1, 1,
-0.4613705, 0.4014234, -0.005998515, 1, 1, 1, 1, 1,
-0.4578106, -0.533646, -1.611549, 1, 1, 1, 1, 1,
-0.457515, -0.02591262, -3.038216, 1, 1, 1, 1, 1,
-0.4561627, -0.8142316, -3.059343, 1, 1, 1, 1, 1,
-0.4554659, -1.049251, -3.587954, 1, 1, 1, 1, 1,
-0.4525445, 0.2482656, -0.6579701, 1, 1, 1, 1, 1,
-0.4283696, -0.8216777, -1.863167, 1, 1, 1, 1, 1,
-0.4148976, 0.08565384, 0.6616537, 1, 1, 1, 1, 1,
-0.4146324, 1.781961, 0.02033187, 1, 1, 1, 1, 1,
-0.4125997, 1.281691, -1.574188, 1, 1, 1, 1, 1,
-0.408822, -0.4812532, -3.297312, 1, 1, 1, 1, 1,
-0.4061679, 0.005336315, -0.9450445, 1, 1, 1, 1, 1,
-0.4020496, -1.046123, -3.496931, 0, 0, 1, 1, 1,
-0.3989614, -0.08963808, -2.735548, 1, 0, 0, 1, 1,
-0.3894841, 0.3053831, -0.3552319, 1, 0, 0, 1, 1,
-0.3880706, 0.8442789, 1.691755, 1, 0, 0, 1, 1,
-0.3858537, 0.7193463, 2.009106, 1, 0, 0, 1, 1,
-0.3857172, -1.052506, -4.263065, 1, 0, 0, 1, 1,
-0.3835984, 0.8680444, -0.331087, 0, 0, 0, 1, 1,
-0.3784755, 0.8948375, -0.7600443, 0, 0, 0, 1, 1,
-0.3736339, -2.458762, -2.143345, 0, 0, 0, 1, 1,
-0.3726071, 0.1569147, -0.1919235, 0, 0, 0, 1, 1,
-0.360555, 1.170528, 0.23048, 0, 0, 0, 1, 1,
-0.3590015, 0.7423496, -1.258537, 0, 0, 0, 1, 1,
-0.3567111, 0.6697685, -0.6200488, 0, 0, 0, 1, 1,
-0.3547381, -0.1449717, -1.935621, 1, 1, 1, 1, 1,
-0.3516026, 1.188302, -1.422443, 1, 1, 1, 1, 1,
-0.3485303, -0.6085491, -2.519987, 1, 1, 1, 1, 1,
-0.3466055, 1.420268, -0.72597, 1, 1, 1, 1, 1,
-0.3394466, 1.34615, -0.7168901, 1, 1, 1, 1, 1,
-0.3392442, 0.3710201, -1.204388, 1, 1, 1, 1, 1,
-0.3387833, 0.9862382, -1.035545, 1, 1, 1, 1, 1,
-0.3342463, 0.1444654, -0.03619519, 1, 1, 1, 1, 1,
-0.3339912, -1.182593, -3.154143, 1, 1, 1, 1, 1,
-0.3265205, 0.186673, -0.5636939, 1, 1, 1, 1, 1,
-0.3234797, -0.5432467, -3.135588, 1, 1, 1, 1, 1,
-0.3220203, -1.541, -4.088211, 1, 1, 1, 1, 1,
-0.3216184, 0.1481672, -1.034603, 1, 1, 1, 1, 1,
-0.3205514, 0.321156, 0.5931727, 1, 1, 1, 1, 1,
-0.3155384, -1.52959, -3.390488, 1, 1, 1, 1, 1,
-0.3118282, 1.261242, 0.1372162, 0, 0, 1, 1, 1,
-0.3076586, 0.8010082, -0.0439688, 1, 0, 0, 1, 1,
-0.3073627, -0.6931457, -2.962462, 1, 0, 0, 1, 1,
-0.3048174, 0.8370054, -0.8471282, 1, 0, 0, 1, 1,
-0.3038173, 1.126261, 0.06283046, 1, 0, 0, 1, 1,
-0.3027201, 0.004469336, -0.4686751, 1, 0, 0, 1, 1,
-0.3020439, -0.6655368, -1.764376, 0, 0, 0, 1, 1,
-0.3008564, 1.128007, 0.150415, 0, 0, 0, 1, 1,
-0.2974842, 0.5650089, -0.9477214, 0, 0, 0, 1, 1,
-0.2943617, 0.0728922, -1.973946, 0, 0, 0, 1, 1,
-0.2942148, 2.314421, -0.01999091, 0, 0, 0, 1, 1,
-0.2900424, -0.8719622, -2.317337, 0, 0, 0, 1, 1,
-0.2811691, -0.9369147, -3.400658, 0, 0, 0, 1, 1,
-0.2745226, -0.6500724, -2.84602, 1, 1, 1, 1, 1,
-0.2744184, -0.7976812, -3.211986, 1, 1, 1, 1, 1,
-0.2667998, 1.127505, 0.923364, 1, 1, 1, 1, 1,
-0.266284, -0.08757837, -2.340091, 1, 1, 1, 1, 1,
-0.260549, 0.9305874, 0.09602477, 1, 1, 1, 1, 1,
-0.256806, 1.28074, -0.05830799, 1, 1, 1, 1, 1,
-0.2565162, 0.8711596, 0.6003821, 1, 1, 1, 1, 1,
-0.2545982, 0.8860385, 0.8934041, 1, 1, 1, 1, 1,
-0.2543717, 0.02144557, -1.84625, 1, 1, 1, 1, 1,
-0.2529762, -1.699914, -4.060596, 1, 1, 1, 1, 1,
-0.2517573, -1.303914, -2.583974, 1, 1, 1, 1, 1,
-0.2500291, 0.4476503, 1.913895, 1, 1, 1, 1, 1,
-0.2485859, 1.355617, 0.7011601, 1, 1, 1, 1, 1,
-0.2474171, -0.5055708, -3.620065, 1, 1, 1, 1, 1,
-0.2387915, 1.246241, 1.084767, 1, 1, 1, 1, 1,
-0.2384586, -0.2607248, -1.97941, 0, 0, 1, 1, 1,
-0.23296, 0.6282206, -0.6026598, 1, 0, 0, 1, 1,
-0.2263461, 1.095685, -1.959409, 1, 0, 0, 1, 1,
-0.2259215, -0.9971189, -3.040065, 1, 0, 0, 1, 1,
-0.2251831, 0.03387902, -1.811493, 1, 0, 0, 1, 1,
-0.2162914, -1.246222, -2.031912, 1, 0, 0, 1, 1,
-0.205823, -0.1379712, -2.657541, 0, 0, 0, 1, 1,
-0.2055917, -1.390945, -1.238224, 0, 0, 0, 1, 1,
-0.2041422, 0.3949246, 0.0348852, 0, 0, 0, 1, 1,
-0.2027866, 1.370623, -1.598421, 0, 0, 0, 1, 1,
-0.1943414, -0.3999164, -3.38714, 0, 0, 0, 1, 1,
-0.1880644, 0.7120509, -0.2649656, 0, 0, 0, 1, 1,
-0.1876412, -1.565608, -2.468101, 0, 0, 0, 1, 1,
-0.1876156, 0.6745237, -0.1469027, 1, 1, 1, 1, 1,
-0.1870766, -1.078092, -2.267294, 1, 1, 1, 1, 1,
-0.1855056, 0.8641084, 0.3579097, 1, 1, 1, 1, 1,
-0.1819604, -0.976391, -1.079288, 1, 1, 1, 1, 1,
-0.1798748, -1.270937, -2.486432, 1, 1, 1, 1, 1,
-0.1756343, -1.363137, -1.459189, 1, 1, 1, 1, 1,
-0.1716654, -0.8412296, -4.181627, 1, 1, 1, 1, 1,
-0.1678453, 0.6093488, -1.654817, 1, 1, 1, 1, 1,
-0.1677579, 0.3203627, -0.3960984, 1, 1, 1, 1, 1,
-0.1661119, -1.040238, -2.204182, 1, 1, 1, 1, 1,
-0.1626479, 0.9746273, -0.4086945, 1, 1, 1, 1, 1,
-0.1593372, 0.8861436, 1.832845, 1, 1, 1, 1, 1,
-0.1587533, 0.09445462, 1.273973, 1, 1, 1, 1, 1,
-0.1575409, -0.1316461, -2.374743, 1, 1, 1, 1, 1,
-0.1548726, -1.016806, -1.759695, 1, 1, 1, 1, 1,
-0.1529349, 1.385996, 0.04555278, 0, 0, 1, 1, 1,
-0.15084, -0.9883723, -2.140475, 1, 0, 0, 1, 1,
-0.1476, -0.1128511, -1.138188, 1, 0, 0, 1, 1,
-0.1465092, 1.084173, -0.727693, 1, 0, 0, 1, 1,
-0.1422794, -0.9315506, -1.355146, 1, 0, 0, 1, 1,
-0.136694, 0.5626715, -0.5172417, 1, 0, 0, 1, 1,
-0.1326604, 0.8673409, 0.3186248, 0, 0, 0, 1, 1,
-0.1322932, 0.4528546, -0.2281843, 0, 0, 0, 1, 1,
-0.1318154, -1.003405, -2.561825, 0, 0, 0, 1, 1,
-0.1263032, 0.6936906, -1.447989, 0, 0, 0, 1, 1,
-0.1216142, 0.7049401, -0.1336977, 0, 0, 0, 1, 1,
-0.115374, -0.09930749, -3.740411, 0, 0, 0, 1, 1,
-0.1114836, -0.2693309, -1.833639, 0, 0, 0, 1, 1,
-0.1110266, 0.1666442, 0.1229667, 1, 1, 1, 1, 1,
-0.105283, 1.358627, -1.368055, 1, 1, 1, 1, 1,
-0.1000912, 1.248601, 0.4814837, 1, 1, 1, 1, 1,
-0.1000593, 0.9384933, 0.5696882, 1, 1, 1, 1, 1,
-0.09708098, 1.288006, -0.8015954, 1, 1, 1, 1, 1,
-0.09653369, 0.9809092, -0.4661604, 1, 1, 1, 1, 1,
-0.0956253, 0.2913218, -0.864725, 1, 1, 1, 1, 1,
-0.09192631, -1.142503, -3.685378, 1, 1, 1, 1, 1,
-0.08959217, 0.06957065, -2.009844, 1, 1, 1, 1, 1,
-0.08693819, 0.3659481, 0.01322492, 1, 1, 1, 1, 1,
-0.08380219, -0.5571226, -2.065976, 1, 1, 1, 1, 1,
-0.07922369, 0.3326201, 0.06650548, 1, 1, 1, 1, 1,
-0.07753329, 1.600616, 0.6739408, 1, 1, 1, 1, 1,
-0.07636239, -0.8006899, -1.08487, 1, 1, 1, 1, 1,
-0.07568857, -0.5092177, -3.142232, 1, 1, 1, 1, 1,
-0.07494213, -0.004020292, -1.769128, 0, 0, 1, 1, 1,
-0.07482196, -0.1910011, -3.27702, 1, 0, 0, 1, 1,
-0.07147971, -3.053042, -2.596701, 1, 0, 0, 1, 1,
-0.07147543, -0.242614, -0.9372022, 1, 0, 0, 1, 1,
-0.06926575, -0.8227049, -4.542531, 1, 0, 0, 1, 1,
-0.06080317, 0.6372767, 0.6542652, 1, 0, 0, 1, 1,
-0.0571038, -0.4087873, -4.210855, 0, 0, 0, 1, 1,
-0.05552934, 1.382406, -0.1523812, 0, 0, 0, 1, 1,
-0.05382044, 0.8440209, -1.875217, 0, 0, 0, 1, 1,
-0.05208626, 0.04584135, 0.5985587, 0, 0, 0, 1, 1,
-0.04295297, -0.04199237, -2.68372, 0, 0, 0, 1, 1,
-0.0345641, 0.9387176, -0.01168968, 0, 0, 0, 1, 1,
-0.03111274, 0.4076982, 1.433975, 0, 0, 0, 1, 1,
-0.02559946, 0.8469265, 0.2707464, 1, 1, 1, 1, 1,
-0.02477648, -1.79648, -4.390628, 1, 1, 1, 1, 1,
-0.02462419, 0.1032443, 1.281139, 1, 1, 1, 1, 1,
-0.01788783, 0.08164027, -0.9313269, 1, 1, 1, 1, 1,
-0.01424536, -0.3652811, -4.859499, 1, 1, 1, 1, 1,
-0.008625854, 0.7327061, 2.555162, 1, 1, 1, 1, 1,
-0.005765014, 0.1243549, 0.4217522, 1, 1, 1, 1, 1,
-0.003292564, 0.1531218, -2.169548, 1, 1, 1, 1, 1,
0.001378839, -1.061305, 3.450176, 1, 1, 1, 1, 1,
0.004014154, -2.143555, 3.220995, 1, 1, 1, 1, 1,
0.006350725, -1.002607, 3.645011, 1, 1, 1, 1, 1,
0.00754255, 0.1301202, 0.4147585, 1, 1, 1, 1, 1,
0.01150198, -0.520082, 3.275301, 1, 1, 1, 1, 1,
0.0119382, -1.843499, 3.092447, 1, 1, 1, 1, 1,
0.01928888, 0.8303209, 1.020303, 1, 1, 1, 1, 1,
0.02289764, 0.5339262, 0.603196, 0, 0, 1, 1, 1,
0.02414859, 1.006958, 0.1682483, 1, 0, 0, 1, 1,
0.02511018, 0.6042475, -0.2397652, 1, 0, 0, 1, 1,
0.02576903, -1.507143, 2.303062, 1, 0, 0, 1, 1,
0.0265572, 1.209815, 0.8028443, 1, 0, 0, 1, 1,
0.0310856, -0.8358751, 2.222533, 1, 0, 0, 1, 1,
0.03324688, -0.1163705, 4.608275, 0, 0, 0, 1, 1,
0.03365558, -0.3764001, 1.77206, 0, 0, 0, 1, 1,
0.03449324, 0.5013654, 0.1476518, 0, 0, 0, 1, 1,
0.03553412, -0.1131916, 1.256685, 0, 0, 0, 1, 1,
0.03839502, -0.9143174, 4.475607, 0, 0, 0, 1, 1,
0.04116539, 2.264879, -1.830702, 0, 0, 0, 1, 1,
0.04823391, 1.676838, 0.7965776, 0, 0, 0, 1, 1,
0.0607585, 1.430858, -0.01407164, 1, 1, 1, 1, 1,
0.06091787, 0.7889529, 0.5469198, 1, 1, 1, 1, 1,
0.06369527, -1.321396, 2.092005, 1, 1, 1, 1, 1,
0.06524546, 0.2237281, 0.3000053, 1, 1, 1, 1, 1,
0.06685485, 0.2596523, -1.176537, 1, 1, 1, 1, 1,
0.06893219, -2.340988, 3.22816, 1, 1, 1, 1, 1,
0.07046361, 0.6744586, 0.276198, 1, 1, 1, 1, 1,
0.07442487, 0.8265153, 0.3805011, 1, 1, 1, 1, 1,
0.07522842, 0.06905532, 2.056889, 1, 1, 1, 1, 1,
0.07835902, -0.1490543, 1.088223, 1, 1, 1, 1, 1,
0.08044661, 0.7657506, 0.9939589, 1, 1, 1, 1, 1,
0.08149834, 1.012968, 0.5178804, 1, 1, 1, 1, 1,
0.0839949, -2.263403, 2.161407, 1, 1, 1, 1, 1,
0.08594839, 1.222592, 0.5544217, 1, 1, 1, 1, 1,
0.08933857, -0.5190221, 1.887407, 1, 1, 1, 1, 1,
0.09280251, 0.442002, 0.7268075, 0, 0, 1, 1, 1,
0.09333504, 2.054521, -0.9242741, 1, 0, 0, 1, 1,
0.0939314, -0.04993901, 1.886613, 1, 0, 0, 1, 1,
0.09489226, 1.655703, -0.802676, 1, 0, 0, 1, 1,
0.1062105, -0.6953872, 2.659993, 1, 0, 0, 1, 1,
0.1113736, -0.5009719, 2.811395, 1, 0, 0, 1, 1,
0.11505, 0.5343324, -0.951795, 0, 0, 0, 1, 1,
0.1171945, 0.6909314, 0.2948526, 0, 0, 0, 1, 1,
0.1181079, -0.08243503, 0.9696335, 0, 0, 0, 1, 1,
0.1200188, -0.1870728, 3.850134, 0, 0, 0, 1, 1,
0.1239611, 0.3134455, -0.1834209, 0, 0, 0, 1, 1,
0.1241668, 1.021522, -0.5136489, 0, 0, 0, 1, 1,
0.1248801, 1.30533, 0.3700952, 0, 0, 0, 1, 1,
0.1286097, -0.5762098, 4.220467, 1, 1, 1, 1, 1,
0.1305026, 1.240685, -0.319185, 1, 1, 1, 1, 1,
0.1317264, 0.04643737, 0.2365737, 1, 1, 1, 1, 1,
0.1338129, -0.2054855, 3.407493, 1, 1, 1, 1, 1,
0.1345877, -1.808805, 2.7943, 1, 1, 1, 1, 1,
0.1356525, 0.6754174, -0.3282378, 1, 1, 1, 1, 1,
0.1407962, -0.9517713, 3.049505, 1, 1, 1, 1, 1,
0.1410006, -0.7257082, 1.573746, 1, 1, 1, 1, 1,
0.1411269, -0.3278524, 3.108428, 1, 1, 1, 1, 1,
0.1512445, 1.564544, -0.7145092, 1, 1, 1, 1, 1,
0.152427, 0.1234399, 0.8015532, 1, 1, 1, 1, 1,
0.1558753, -0.2665981, 2.487782, 1, 1, 1, 1, 1,
0.1612867, -0.93314, 4.341383, 1, 1, 1, 1, 1,
0.163806, 0.5138375, -0.1121019, 1, 1, 1, 1, 1,
0.1643853, 0.4389023, -0.4870123, 1, 1, 1, 1, 1,
0.1697016, 0.3690248, 0.4860243, 0, 0, 1, 1, 1,
0.1721165, -0.1651593, 2.487388, 1, 0, 0, 1, 1,
0.1726251, 0.4482088, 1.961697, 1, 0, 0, 1, 1,
0.1738959, -0.7341504, 1.692591, 1, 0, 0, 1, 1,
0.1742143, -1.146047, 2.464076, 1, 0, 0, 1, 1,
0.1760909, -1.307439, 2.009655, 1, 0, 0, 1, 1,
0.1808463, -0.1982965, 2.924423, 0, 0, 0, 1, 1,
0.181563, 0.4141639, 0.617134, 0, 0, 0, 1, 1,
0.1831977, -0.8560944, 1.809842, 0, 0, 0, 1, 1,
0.1843318, -1.159275, 3.353609, 0, 0, 0, 1, 1,
0.186407, 1.543343, 0.3232383, 0, 0, 0, 1, 1,
0.1869532, -0.5571324, 3.173498, 0, 0, 0, 1, 1,
0.1870202, -0.1721789, 2.189224, 0, 0, 0, 1, 1,
0.1871368, 0.1866408, 0.4162704, 1, 1, 1, 1, 1,
0.1913309, -0.136383, 3.930832, 1, 1, 1, 1, 1,
0.1915441, -0.1489313, 1.833047, 1, 1, 1, 1, 1,
0.1923804, 1.424153, -1.241408, 1, 1, 1, 1, 1,
0.1959175, -1.09619, 3.932039, 1, 1, 1, 1, 1,
0.199388, -0.3610038, 2.045328, 1, 1, 1, 1, 1,
0.200742, -0.731502, 2.33482, 1, 1, 1, 1, 1,
0.2050463, -0.9146774, 4.028862, 1, 1, 1, 1, 1,
0.2061755, -1.419888, 2.925481, 1, 1, 1, 1, 1,
0.2095591, -0.7552097, 1.428817, 1, 1, 1, 1, 1,
0.2115935, -0.8245996, 2.689836, 1, 1, 1, 1, 1,
0.2125106, -1.641036, 4.421409, 1, 1, 1, 1, 1,
0.2134585, 0.7276659, -0.675997, 1, 1, 1, 1, 1,
0.21772, -1.712136, 3.593804, 1, 1, 1, 1, 1,
0.2180003, -0.6495501, 2.05286, 1, 1, 1, 1, 1,
0.2200481, -0.08163674, 3.968086, 0, 0, 1, 1, 1,
0.2208307, 1.513745, -0.0623292, 1, 0, 0, 1, 1,
0.2213501, 0.02218853, 3.192628, 1, 0, 0, 1, 1,
0.2226303, -0.05675237, 1.103201, 1, 0, 0, 1, 1,
0.2236306, -0.861734, 2.126982, 1, 0, 0, 1, 1,
0.2244337, 0.7176269, -1.058752, 1, 0, 0, 1, 1,
0.2257086, 1.732032, 0.4707846, 0, 0, 0, 1, 1,
0.2260183, 0.03972695, 2.950864, 0, 0, 0, 1, 1,
0.2279157, -0.9910029, 3.778763, 0, 0, 0, 1, 1,
0.2293914, 0.8668865, -1.445697, 0, 0, 0, 1, 1,
0.2321388, 0.4966084, 0.791064, 0, 0, 0, 1, 1,
0.2324718, 0.03512325, 2.549079, 0, 0, 0, 1, 1,
0.2342345, -1.679458, 2.261569, 0, 0, 0, 1, 1,
0.2368108, 0.8509323, 0.04354856, 1, 1, 1, 1, 1,
0.2391095, -0.8417098, 2.666431, 1, 1, 1, 1, 1,
0.2397981, -0.2060868, 2.222206, 1, 1, 1, 1, 1,
0.2430076, -0.5564929, 4.389358, 1, 1, 1, 1, 1,
0.2440469, 0.5114728, 0.2445567, 1, 1, 1, 1, 1,
0.2521428, -2.486467, 1.303808, 1, 1, 1, 1, 1,
0.2535918, -0.1994455, 2.148538, 1, 1, 1, 1, 1,
0.2552572, -0.6687092, 4.138761, 1, 1, 1, 1, 1,
0.2562439, -1.406248, 2.416432, 1, 1, 1, 1, 1,
0.2600549, 3.766284, 0.0681235, 1, 1, 1, 1, 1,
0.2637856, -1.042293, 1.981815, 1, 1, 1, 1, 1,
0.266327, -1.750904, 2.221906, 1, 1, 1, 1, 1,
0.2675506, -0.5131717, 3.130765, 1, 1, 1, 1, 1,
0.2735166, -0.6463668, 3.884658, 1, 1, 1, 1, 1,
0.273939, 0.3986282, 1.19833, 1, 1, 1, 1, 1,
0.2755861, 0.5327461, -1.188273, 0, 0, 1, 1, 1,
0.2784739, -0.2177844, 2.966017, 1, 0, 0, 1, 1,
0.2794113, 1.031998, -0.30152, 1, 0, 0, 1, 1,
0.282153, -1.459035, 3.609823, 1, 0, 0, 1, 1,
0.2827223, -0.9757066, 3.73981, 1, 0, 0, 1, 1,
0.2828475, -0.259427, 2.99113, 1, 0, 0, 1, 1,
0.289857, 3.18284, 0.3028005, 0, 0, 0, 1, 1,
0.2925008, 0.8510948, 0.1017888, 0, 0, 0, 1, 1,
0.2981592, -1.26314, 3.140228, 0, 0, 0, 1, 1,
0.29928, -1.402845, 5.33247, 0, 0, 0, 1, 1,
0.2994838, 0.551002, 1.022903, 0, 0, 0, 1, 1,
0.301938, 0.4407194, 0.7541736, 0, 0, 0, 1, 1,
0.3046934, 0.1610681, 0.9814215, 0, 0, 0, 1, 1,
0.3080068, 0.04829862, 0.1915167, 1, 1, 1, 1, 1,
0.3084278, 0.8775173, 0.7358831, 1, 1, 1, 1, 1,
0.3088363, -0.1793435, 2.527892, 1, 1, 1, 1, 1,
0.3109214, 1.329533, 0.2463343, 1, 1, 1, 1, 1,
0.3112883, -0.2898701, 2.843732, 1, 1, 1, 1, 1,
0.31442, -0.06442715, 0.4523366, 1, 1, 1, 1, 1,
0.3145757, -0.2612843, 2.411684, 1, 1, 1, 1, 1,
0.3209109, -1.145658, 3.682623, 1, 1, 1, 1, 1,
0.3225997, 0.3890641, -0.5913476, 1, 1, 1, 1, 1,
0.3227561, -0.2514171, 0.7557402, 1, 1, 1, 1, 1,
0.3240924, 0.747041, 0.9570343, 1, 1, 1, 1, 1,
0.3251262, -2.192471, 2.972482, 1, 1, 1, 1, 1,
0.3259803, 0.2873434, 0.6177331, 1, 1, 1, 1, 1,
0.3265613, 1.119982, -1.288251, 1, 1, 1, 1, 1,
0.3269783, -1.012585, 2.96049, 1, 1, 1, 1, 1,
0.3288049, -0.02557819, 2.633768, 0, 0, 1, 1, 1,
0.3394457, 1.358373, 2.522848, 1, 0, 0, 1, 1,
0.341456, 0.6336914, -0.3958829, 1, 0, 0, 1, 1,
0.3419098, 0.867951, 0.2293045, 1, 0, 0, 1, 1,
0.3450523, -0.8440737, 3.644181, 1, 0, 0, 1, 1,
0.3517706, -0.6870716, 0.8221709, 1, 0, 0, 1, 1,
0.360056, 2.652331, -0.307857, 0, 0, 0, 1, 1,
0.3626246, -0.5643615, 2.391418, 0, 0, 0, 1, 1,
0.3632596, 1.107242, 0.6985906, 0, 0, 0, 1, 1,
0.3637998, 1.669199, 0.0792514, 0, 0, 0, 1, 1,
0.3639255, -0.22463, 3.050499, 0, 0, 0, 1, 1,
0.3673803, -3.11952, 2.190997, 0, 0, 0, 1, 1,
0.3753236, -1.507893, 3.24217, 0, 0, 0, 1, 1,
0.3764908, -1.675121, 3.899333, 1, 1, 1, 1, 1,
0.3773025, -1.719394, 3.04038, 1, 1, 1, 1, 1,
0.3791814, -0.164249, 1.849867, 1, 1, 1, 1, 1,
0.3901224, 0.7212142, 1.712169, 1, 1, 1, 1, 1,
0.3910001, 0.2594956, 1.456741, 1, 1, 1, 1, 1,
0.3924953, 1.607743, 0.09497692, 1, 1, 1, 1, 1,
0.3950343, 0.8624836, 1.158077, 1, 1, 1, 1, 1,
0.397974, 0.4718539, -1.09958, 1, 1, 1, 1, 1,
0.399619, -1.555283, 0.9852901, 1, 1, 1, 1, 1,
0.4016215, -0.3932955, 2.769485, 1, 1, 1, 1, 1,
0.4022699, -0.9553616, 2.974905, 1, 1, 1, 1, 1,
0.4032978, 0.7715545, -0.1990967, 1, 1, 1, 1, 1,
0.4051403, 0.245699, 0.3726315, 1, 1, 1, 1, 1,
0.4052916, -0.3845534, 2.81995, 1, 1, 1, 1, 1,
0.4054042, -0.05002986, 0.6480788, 1, 1, 1, 1, 1,
0.4063534, 0.1354251, -1.574027, 0, 0, 1, 1, 1,
0.4071382, 0.5585669, -0.4179253, 1, 0, 0, 1, 1,
0.4075856, -0.253398, 3.20995, 1, 0, 0, 1, 1,
0.4086902, 1.058538, 0.04794211, 1, 0, 0, 1, 1,
0.4098748, -0.182142, 2.619903, 1, 0, 0, 1, 1,
0.4133721, -0.4101461, 1.764786, 1, 0, 0, 1, 1,
0.4198768, -0.588246, 2.06904, 0, 0, 0, 1, 1,
0.4201493, 1.453966, 1.113379, 0, 0, 0, 1, 1,
0.4216781, 0.306271, 0.7624323, 0, 0, 0, 1, 1,
0.4231685, 0.755165, -0.04819782, 0, 0, 0, 1, 1,
0.4259058, 1.650205, 2.053043, 0, 0, 0, 1, 1,
0.4271992, 0.3132061, -0.4248925, 0, 0, 0, 1, 1,
0.4326198, -1.564517, 3.234705, 0, 0, 0, 1, 1,
0.4334047, -0.6669628, 1.936734, 1, 1, 1, 1, 1,
0.4348716, 0.03875063, 0.8488668, 1, 1, 1, 1, 1,
0.4367513, -1.156465, 4.967782, 1, 1, 1, 1, 1,
0.4389277, -0.3761449, 3.233019, 1, 1, 1, 1, 1,
0.4426716, 0.03417808, 1.056736, 1, 1, 1, 1, 1,
0.4431647, -0.8603814, 1.549979, 1, 1, 1, 1, 1,
0.4437921, -1.081848, 2.797833, 1, 1, 1, 1, 1,
0.4463406, 1.511631, 1.69338, 1, 1, 1, 1, 1,
0.4469637, -2.213739, 0.8030013, 1, 1, 1, 1, 1,
0.4469878, -0.2902831, 1.954685, 1, 1, 1, 1, 1,
0.4480925, -0.1872486, 1.979633, 1, 1, 1, 1, 1,
0.4495818, 0.2817256, 1.385236, 1, 1, 1, 1, 1,
0.4521091, 1.558506, 0.2561804, 1, 1, 1, 1, 1,
0.4537424, 0.354806, 1.551528, 1, 1, 1, 1, 1,
0.4586955, 0.4783809, 0.9810092, 1, 1, 1, 1, 1,
0.459911, -0.7101161, 2.258304, 0, 0, 1, 1, 1,
0.4603026, 1.748814, -0.6437972, 1, 0, 0, 1, 1,
0.4605077, -0.7991673, 1.075275, 1, 0, 0, 1, 1,
0.4720208, 0.2291119, 1.489584, 1, 0, 0, 1, 1,
0.4725311, -1.675505, 1.294552, 1, 0, 0, 1, 1,
0.4733381, 1.186349, 1.542265, 1, 0, 0, 1, 1,
0.4752486, -0.5898798, 3.174572, 0, 0, 0, 1, 1,
0.476615, -1.084548, 3.144682, 0, 0, 0, 1, 1,
0.4781143, 1.07786, 1.561552, 0, 0, 0, 1, 1,
0.4793335, -1.332034, 4.690776, 0, 0, 0, 1, 1,
0.4798035, 0.2838806, 0.9495478, 0, 0, 0, 1, 1,
0.4831825, -1.367691, 3.512371, 0, 0, 0, 1, 1,
0.4871859, -0.1945204, 3.030664, 0, 0, 0, 1, 1,
0.4888425, 1.151853, -0.3702762, 1, 1, 1, 1, 1,
0.493288, -2.20761, 2.13539, 1, 1, 1, 1, 1,
0.4937739, 0.4290779, 0.5646768, 1, 1, 1, 1, 1,
0.49615, -1.155001, 1.947037, 1, 1, 1, 1, 1,
0.4992018, -0.8685533, 3.001843, 1, 1, 1, 1, 1,
0.502983, 0.06465866, 1.653707, 1, 1, 1, 1, 1,
0.5064679, -0.06888593, 2.410254, 1, 1, 1, 1, 1,
0.5088107, 0.3636098, -0.02680237, 1, 1, 1, 1, 1,
0.5091876, -1.979344, 2.245394, 1, 1, 1, 1, 1,
0.5106167, -0.2018187, 1.913989, 1, 1, 1, 1, 1,
0.5116873, 1.16382, -0.2437944, 1, 1, 1, 1, 1,
0.5231397, -1.523316, 2.861926, 1, 1, 1, 1, 1,
0.5235379, -0.08790535, 1.508977, 1, 1, 1, 1, 1,
0.5285363, 0.5079815, 1.003143, 1, 1, 1, 1, 1,
0.5290211, -0.5258016, 2.829603, 1, 1, 1, 1, 1,
0.5294662, 1.656296, -0.7200754, 0, 0, 1, 1, 1,
0.5352969, 1.558336, 0.2483939, 1, 0, 0, 1, 1,
0.5373663, -0.5017467, 2.333184, 1, 0, 0, 1, 1,
0.5377139, 2.949895, -0.2465526, 1, 0, 0, 1, 1,
0.5382309, -0.2444519, 1.575866, 1, 0, 0, 1, 1,
0.5392668, 0.1136178, 2.674927, 1, 0, 0, 1, 1,
0.5422702, -0.5458077, 3.691161, 0, 0, 0, 1, 1,
0.5457323, 0.4304267, 0.3934535, 0, 0, 0, 1, 1,
0.5482014, -0.3919266, 4.693224, 0, 0, 0, 1, 1,
0.5496959, -1.564139, 2.011195, 0, 0, 0, 1, 1,
0.5506729, -1.199476, 1.826863, 0, 0, 0, 1, 1,
0.5526243, -1.092178, 2.546854, 0, 0, 0, 1, 1,
0.565291, -0.2607614, 2.987998, 0, 0, 0, 1, 1,
0.5654185, -0.2386055, 3.440881, 1, 1, 1, 1, 1,
0.5655608, 0.2881928, -0.2416992, 1, 1, 1, 1, 1,
0.5655686, 0.2285295, 3.911011, 1, 1, 1, 1, 1,
0.5668668, 0.3627121, 0.09836895, 1, 1, 1, 1, 1,
0.5673317, 0.01203118, 1.151997, 1, 1, 1, 1, 1,
0.5699558, 0.06868342, 1.102511, 1, 1, 1, 1, 1,
0.571124, -1.015932, 1.792968, 1, 1, 1, 1, 1,
0.5756887, -0.8400185, 0.3304089, 1, 1, 1, 1, 1,
0.5827332, -2.651011, 3.073173, 1, 1, 1, 1, 1,
0.5932949, 0.1663282, 0.6513674, 1, 1, 1, 1, 1,
0.596957, -0.4755155, 2.974879, 1, 1, 1, 1, 1,
0.598247, 0.7302216, -0.3993441, 1, 1, 1, 1, 1,
0.5997261, -1.794207, 2.196661, 1, 1, 1, 1, 1,
0.6015753, -0.9302226, 1.34756, 1, 1, 1, 1, 1,
0.6029464, 0.02903743, 1.095476, 1, 1, 1, 1, 1,
0.6041055, -0.03890085, 0.9713559, 0, 0, 1, 1, 1,
0.6098443, -1.931684, 2.13116, 1, 0, 0, 1, 1,
0.6145741, -1.0223, 1.720934, 1, 0, 0, 1, 1,
0.6154091, 0.3462264, 1.379208, 1, 0, 0, 1, 1,
0.6164045, -0.03577479, 1.711533, 1, 0, 0, 1, 1,
0.6171099, -1.226421, 4.701865, 1, 0, 0, 1, 1,
0.6178817, 0.2616447, 0.7758867, 0, 0, 0, 1, 1,
0.6210537, 0.3504935, 1.363813, 0, 0, 0, 1, 1,
0.6291586, -0.1933941, 0.3564442, 0, 0, 0, 1, 1,
0.6293495, -0.9587691, 1.594466, 0, 0, 0, 1, 1,
0.6312937, -1.446786, 2.293241, 0, 0, 0, 1, 1,
0.6406212, 0.941823, -0.4260719, 0, 0, 0, 1, 1,
0.6409076, 0.280259, 1.915975, 0, 0, 0, 1, 1,
0.6432864, 0.4668343, 0.5395378, 1, 1, 1, 1, 1,
0.6448954, 0.4997547, 1.269171, 1, 1, 1, 1, 1,
0.6461115, 1.830174, 1.632406, 1, 1, 1, 1, 1,
0.6466979, 0.6688272, 1.381272, 1, 1, 1, 1, 1,
0.6570894, 0.6162185, -0.3200711, 1, 1, 1, 1, 1,
0.6571428, 0.4641491, 0.4574533, 1, 1, 1, 1, 1,
0.6574211, 1.468602, 0.5518108, 1, 1, 1, 1, 1,
0.6580269, -0.5461786, 1.44347, 1, 1, 1, 1, 1,
0.6626933, -0.395209, 0.7372578, 1, 1, 1, 1, 1,
0.6658694, 0.02222359, 1.699761, 1, 1, 1, 1, 1,
0.6674047, 0.8258436, 0.6042784, 1, 1, 1, 1, 1,
0.667515, 1.768842, 1.219844, 1, 1, 1, 1, 1,
0.670593, -1.551819, 3.250879, 1, 1, 1, 1, 1,
0.6809959, 0.3841434, 1.797926, 1, 1, 1, 1, 1,
0.6888362, 0.0824977, 0.8106536, 1, 1, 1, 1, 1,
0.6942949, -1.028563, 2.031167, 0, 0, 1, 1, 1,
0.6947242, -0.4801692, 1.226357, 1, 0, 0, 1, 1,
0.6957215, -0.5227491, 1.451993, 1, 0, 0, 1, 1,
0.6978408, 0.003410397, 1.585121, 1, 0, 0, 1, 1,
0.7005878, -0.9374191, 1.461652, 1, 0, 0, 1, 1,
0.7027172, 0.5417707, 1.170046, 1, 0, 0, 1, 1,
0.7051488, -0.2087553, 0.7730311, 0, 0, 0, 1, 1,
0.7110393, -2.812692, 3.591654, 0, 0, 0, 1, 1,
0.7168509, 0.8082349, 0.067821, 0, 0, 0, 1, 1,
0.719357, 1.472995, 0.8877749, 0, 0, 0, 1, 1,
0.723838, 0.9119846, -2.277629, 0, 0, 0, 1, 1,
0.7288678, 0.3220563, 1.003891, 0, 0, 0, 1, 1,
0.7317664, -1.224971, 2.71588, 0, 0, 0, 1, 1,
0.7375267, 1.74019, 0.4933477, 1, 1, 1, 1, 1,
0.7400203, -0.4714253, 2.594366, 1, 1, 1, 1, 1,
0.7401896, 0.249147, 0.1352512, 1, 1, 1, 1, 1,
0.740732, 0.2014525, 2.022873, 1, 1, 1, 1, 1,
0.7414311, 0.301835, 2.644397, 1, 1, 1, 1, 1,
0.7468551, -0.4774599, 2.410321, 1, 1, 1, 1, 1,
0.7481067, 1.289038, 0.7349173, 1, 1, 1, 1, 1,
0.7505722, 1.033834, 1.022519, 1, 1, 1, 1, 1,
0.7542047, -1.333519, 2.457911, 1, 1, 1, 1, 1,
0.7552179, 1.211658, 0.5025485, 1, 1, 1, 1, 1,
0.7633146, -0.03087905, 0.640642, 1, 1, 1, 1, 1,
0.7660868, 0.04225476, 1.630065, 1, 1, 1, 1, 1,
0.7677372, 1.005108, 2.912369, 1, 1, 1, 1, 1,
0.7687198, 0.1755323, 1.499383, 1, 1, 1, 1, 1,
0.7777007, -2.698502, 4.014976, 1, 1, 1, 1, 1,
0.7788755, -0.1463831, 1.853444, 0, 0, 1, 1, 1,
0.7794084, -0.4589512, 1.886813, 1, 0, 0, 1, 1,
0.7803322, -0.913769, 2.997724, 1, 0, 0, 1, 1,
0.7804661, -1.213455, 1.834925, 1, 0, 0, 1, 1,
0.7853031, -1.753676, 3.831357, 1, 0, 0, 1, 1,
0.785594, -0.6888433, 3.333645, 1, 0, 0, 1, 1,
0.7861874, -1.039111, 3.460704, 0, 0, 0, 1, 1,
0.8182077, 2.86315, 0.3116885, 0, 0, 0, 1, 1,
0.8220665, 1.602699, -0.2684736, 0, 0, 0, 1, 1,
0.8226381, -2.345332, 2.898626, 0, 0, 0, 1, 1,
0.8233278, -0.2474556, 1.785208, 0, 0, 0, 1, 1,
0.8250583, 0.1631202, 0.6797291, 0, 0, 0, 1, 1,
0.8271388, -0.1190826, 2.581215, 0, 0, 0, 1, 1,
0.8271708, -0.575152, 0.8028423, 1, 1, 1, 1, 1,
0.8315063, -0.59916, 1.929438, 1, 1, 1, 1, 1,
0.8431134, -0.2021748, 2.163241, 1, 1, 1, 1, 1,
0.8442857, -0.3186527, 2.131754, 1, 1, 1, 1, 1,
0.8511991, -0.986254, 1.835141, 1, 1, 1, 1, 1,
0.8626428, -0.8307356, 2.38247, 1, 1, 1, 1, 1,
0.8639323, -0.3945707, 2.243948, 1, 1, 1, 1, 1,
0.8656846, 0.1505298, 3.483868, 1, 1, 1, 1, 1,
0.870246, -0.3730403, 0.8511585, 1, 1, 1, 1, 1,
0.8758813, -0.4348826, 3.769416, 1, 1, 1, 1, 1,
0.8783142, 0.8803717, 0.4585071, 1, 1, 1, 1, 1,
0.8795351, 1.299672, -0.07405199, 1, 1, 1, 1, 1,
0.8838133, -0.5840415, 3.151356, 1, 1, 1, 1, 1,
0.8867905, -0.8613133, 0.9008314, 1, 1, 1, 1, 1,
0.8867923, 0.9947184, -0.4762671, 1, 1, 1, 1, 1,
0.8879876, -0.8435428, 2.246758, 0, 0, 1, 1, 1,
0.8886788, -1.312029, 2.869926, 1, 0, 0, 1, 1,
0.8889814, -0.5493734, 1.833997, 1, 0, 0, 1, 1,
0.8971261, -0.8902975, 1.428878, 1, 0, 0, 1, 1,
0.8976892, -0.6862764, 2.684363, 1, 0, 0, 1, 1,
0.9029231, 0.4450624, 1.400821, 1, 0, 0, 1, 1,
0.9045212, -0.7875144, 1.631, 0, 0, 0, 1, 1,
0.9060181, 0.6547881, 0.1925175, 0, 0, 0, 1, 1,
0.9162679, 0.2101305, 1.693434, 0, 0, 0, 1, 1,
0.9218019, -1.122546, 4.750507, 0, 0, 0, 1, 1,
0.9233809, 0.4182665, 0.2265944, 0, 0, 0, 1, 1,
0.9258311, 1.467611, 1.143822, 0, 0, 0, 1, 1,
0.9260741, 0.5272642, -0.09752782, 0, 0, 0, 1, 1,
0.9265285, 1.102798, 1.012433, 1, 1, 1, 1, 1,
0.9296296, 0.132046, 1.077673, 1, 1, 1, 1, 1,
0.9322945, 0.3699137, 1.673219, 1, 1, 1, 1, 1,
0.9325358, -1.271621, 3.915834, 1, 1, 1, 1, 1,
0.9334562, 0.619454, 0.7008848, 1, 1, 1, 1, 1,
0.9402004, 0.6936789, 0.9580164, 1, 1, 1, 1, 1,
0.9428308, 1.097881, -0.645354, 1, 1, 1, 1, 1,
0.9461628, -0.3240635, 4.178301, 1, 1, 1, 1, 1,
0.9467617, 0.6909596, 1.799023, 1, 1, 1, 1, 1,
0.9561067, 0.7003399, 2.633507, 1, 1, 1, 1, 1,
0.9576594, -0.2926656, 0.9140923, 1, 1, 1, 1, 1,
0.9604177, -1.475167, 4.101416, 1, 1, 1, 1, 1,
0.9623101, 1.612257, 0.3820471, 1, 1, 1, 1, 1,
0.9633082, -2.061111, 2.265896, 1, 1, 1, 1, 1,
0.9676442, -0.3134018, 2.564192, 1, 1, 1, 1, 1,
0.9740477, -0.3323633, 1.496683, 0, 0, 1, 1, 1,
0.9764071, -1.394929, 2.493864, 1, 0, 0, 1, 1,
0.9853731, -0.02300796, 2.299532, 1, 0, 0, 1, 1,
0.9855197, -1.354816, 2.627714, 1, 0, 0, 1, 1,
0.9884629, 0.9336624, -0.09282398, 1, 0, 0, 1, 1,
0.9895066, 1.306149, 0.8654577, 1, 0, 0, 1, 1,
0.9929962, -0.1097324, 0.7047567, 0, 0, 0, 1, 1,
0.993922, -1.051217, 2.120578, 0, 0, 0, 1, 1,
0.995946, -0.363265, 1.343438, 0, 0, 0, 1, 1,
1.000105, -1.236541, 1.680752, 0, 0, 0, 1, 1,
1.010751, -1.262168, -0.0205343, 0, 0, 0, 1, 1,
1.01191, -0.2138223, 2.700016, 0, 0, 0, 1, 1,
1.014483, 1.117957, 0.2802893, 0, 0, 0, 1, 1,
1.015793, -0.2592148, 1.842846, 1, 1, 1, 1, 1,
1.016248, -0.04297861, 1.931472, 1, 1, 1, 1, 1,
1.021778, 0.5829287, 2.59143, 1, 1, 1, 1, 1,
1.036812, -1.268623, 1.71176, 1, 1, 1, 1, 1,
1.036916, -0.617793, 1.920392, 1, 1, 1, 1, 1,
1.037432, -1.303512, 3.69595, 1, 1, 1, 1, 1,
1.038155, 0.2492788, 0.6869856, 1, 1, 1, 1, 1,
1.038315, -0.7520429, 3.962764, 1, 1, 1, 1, 1,
1.049213, -1.801193, 2.211939, 1, 1, 1, 1, 1,
1.069099, -0.2994166, 1.44625, 1, 1, 1, 1, 1,
1.069848, 1.448189, 1.841525, 1, 1, 1, 1, 1,
1.072328, -0.5953156, 0.5470963, 1, 1, 1, 1, 1,
1.077826, -0.05247828, 3.546364, 1, 1, 1, 1, 1,
1.078849, -1.13134, 2.276392, 1, 1, 1, 1, 1,
1.080268, 1.291548, -0.4652814, 1, 1, 1, 1, 1,
1.084626, -1.537179, 2.95175, 0, 0, 1, 1, 1,
1.087227, 0.9767025, 0.8589174, 1, 0, 0, 1, 1,
1.096546, 0.111523, 2.922888, 1, 0, 0, 1, 1,
1.105775, -0.2017968, -1.297797, 1, 0, 0, 1, 1,
1.110783, -0.2796817, 0.8701998, 1, 0, 0, 1, 1,
1.127238, 1.005749, 0.300861, 1, 0, 0, 1, 1,
1.134035, -1.012258, 4.55435, 0, 0, 0, 1, 1,
1.13573, -1.002178, 2.363293, 0, 0, 0, 1, 1,
1.136605, 0.3864827, 0.684204, 0, 0, 0, 1, 1,
1.143316, -0.4739134, 2.774926, 0, 0, 0, 1, 1,
1.146514, -1.855857, 3.968341, 0, 0, 0, 1, 1,
1.150695, -0.4070713, 2.195998, 0, 0, 0, 1, 1,
1.160829, -0.8759006, 2.292527, 0, 0, 0, 1, 1,
1.163342, -0.1076939, -0.652522, 1, 1, 1, 1, 1,
1.164899, -1.082843, 3.538642, 1, 1, 1, 1, 1,
1.170177, 1.056067, 0.02941646, 1, 1, 1, 1, 1,
1.180593, -0.4573021, 0.6430035, 1, 1, 1, 1, 1,
1.191885, -0.5314007, 1.561764, 1, 1, 1, 1, 1,
1.195748, -0.3362447, 1.465069, 1, 1, 1, 1, 1,
1.197796, -0.7504335, 2.321259, 1, 1, 1, 1, 1,
1.201911, -1.505225, 2.089289, 1, 1, 1, 1, 1,
1.215669, 0.515469, 1.191983, 1, 1, 1, 1, 1,
1.216589, 1.279534, 1.376493, 1, 1, 1, 1, 1,
1.216878, -0.4210603, 2.553942, 1, 1, 1, 1, 1,
1.22909, 0.4011847, 1.32889, 1, 1, 1, 1, 1,
1.231432, -0.8721356, 2.573898, 1, 1, 1, 1, 1,
1.248555, -0.1419193, 2.263923, 1, 1, 1, 1, 1,
1.255113, 0.1699773, 0.7236332, 1, 1, 1, 1, 1,
1.256942, 1.453534, 0.7027787, 0, 0, 1, 1, 1,
1.264773, -1.519729, 2.26023, 1, 0, 0, 1, 1,
1.267553, -1.191833, 3.32566, 1, 0, 0, 1, 1,
1.269773, 0.3748537, 2.754519, 1, 0, 0, 1, 1,
1.27696, 0.7976669, 0.9126076, 1, 0, 0, 1, 1,
1.278284, 1.281946, 1.171211, 1, 0, 0, 1, 1,
1.278525, 1.530656, 1.795552, 0, 0, 0, 1, 1,
1.28477, 0.8137782, 0.7786372, 0, 0, 0, 1, 1,
1.296048, 0.4161517, 1.066769, 0, 0, 0, 1, 1,
1.30681, 0.595136, 1.471809, 0, 0, 0, 1, 1,
1.307548, -0.6351662, 1.974377, 0, 0, 0, 1, 1,
1.314144, 1.095249, -0.179179, 0, 0, 0, 1, 1,
1.316761, -1.277632, 3.709482, 0, 0, 0, 1, 1,
1.320825, 0.8112187, 1.660499, 1, 1, 1, 1, 1,
1.324115, 0.3368485, 0.5457423, 1, 1, 1, 1, 1,
1.329001, 0.1894722, 1.59693, 1, 1, 1, 1, 1,
1.338399, 0.3838602, 1.593953, 1, 1, 1, 1, 1,
1.339959, 0.2442123, 2.215477, 1, 1, 1, 1, 1,
1.348783, -0.1005348, 1.20814, 1, 1, 1, 1, 1,
1.349229, 1.356887, 0.3085056, 1, 1, 1, 1, 1,
1.358521, 0.4256638, 1.553523, 1, 1, 1, 1, 1,
1.365052, -0.2976501, 1.297217, 1, 1, 1, 1, 1,
1.369576, -0.03883437, 1.87369, 1, 1, 1, 1, 1,
1.370985, 0.6586094, 2.907434, 1, 1, 1, 1, 1,
1.375887, -2.383888, 2.622818, 1, 1, 1, 1, 1,
1.388896, 0.796867, 0.6994953, 1, 1, 1, 1, 1,
1.410513, 1.370663, 0.690719, 1, 1, 1, 1, 1,
1.413899, -1.342721, 2.459173, 1, 1, 1, 1, 1,
1.41439, 1.222389, 0.1025781, 0, 0, 1, 1, 1,
1.416005, -0.47187, 4.536617, 1, 0, 0, 1, 1,
1.416873, 0.03768902, 1.894282, 1, 0, 0, 1, 1,
1.417113, 1.202076, 1.01832, 1, 0, 0, 1, 1,
1.423003, -1.161369, 4.446634, 1, 0, 0, 1, 1,
1.433848, -0.215011, 1.941893, 1, 0, 0, 1, 1,
1.476867, -1.127805, 4.555901, 0, 0, 0, 1, 1,
1.489305, -0.9749685, 1.582288, 0, 0, 0, 1, 1,
1.495981, -0.01104401, 1.634978, 0, 0, 0, 1, 1,
1.501014, 0.5180214, 0.1307605, 0, 0, 0, 1, 1,
1.502544, 1.953466, 3.295357, 0, 0, 0, 1, 1,
1.515887, -0.08431581, 3.16216, 0, 0, 0, 1, 1,
1.528424, 0.3737615, 3.050717, 0, 0, 0, 1, 1,
1.530784, 0.9521397, 0.3731191, 1, 1, 1, 1, 1,
1.531968, 0.7354409, 1.78322, 1, 1, 1, 1, 1,
1.560475, -0.8066506, 2.638951, 1, 1, 1, 1, 1,
1.560869, -0.2236538, 0.8527539, 1, 1, 1, 1, 1,
1.561597, -1.464628, 3.853589, 1, 1, 1, 1, 1,
1.562375, -0.3772425, 1.698141, 1, 1, 1, 1, 1,
1.563735, 2.120209, -0.6933237, 1, 1, 1, 1, 1,
1.564803, 0.3108321, 1.798386, 1, 1, 1, 1, 1,
1.588716, 0.7642201, 0.246972, 1, 1, 1, 1, 1,
1.615227, 0.002127105, 1.981582, 1, 1, 1, 1, 1,
1.618746, -0.006368529, 2.410522, 1, 1, 1, 1, 1,
1.623159, 0.8234706, 0.8599008, 1, 1, 1, 1, 1,
1.62667, 0.4210303, 0.9344167, 1, 1, 1, 1, 1,
1.654454, -0.269609, 0.8059308, 1, 1, 1, 1, 1,
1.673078, 0.7650686, 2.867824, 1, 1, 1, 1, 1,
1.69466, -0.612294, 0.5496454, 0, 0, 1, 1, 1,
1.700702, 1.018616, 1.409925, 1, 0, 0, 1, 1,
1.718257, -0.4080929, 3.385831, 1, 0, 0, 1, 1,
1.732187, -0.2737185, 2.753757, 1, 0, 0, 1, 1,
1.735162, -0.3190614, 4.193209, 1, 0, 0, 1, 1,
1.736404, -0.920006, 2.101617, 1, 0, 0, 1, 1,
1.746062, 0.1546915, 2.46489, 0, 0, 0, 1, 1,
1.761023, 0.3647853, 1.021258, 0, 0, 0, 1, 1,
1.763476, 0.9301789, 1.209027, 0, 0, 0, 1, 1,
1.771738, -1.239284, 1.79803, 0, 0, 0, 1, 1,
1.780525, 0.2181384, 0.2629779, 0, 0, 0, 1, 1,
1.806544, -0.7411018, 1.328254, 0, 0, 0, 1, 1,
1.837525, 0.5642552, 1.390179, 0, 0, 0, 1, 1,
1.838085, 0.1105919, 2.374347, 1, 1, 1, 1, 1,
1.854935, 0.1725664, -0.1325026, 1, 1, 1, 1, 1,
1.919745, 0.2614554, 1.557803, 1, 1, 1, 1, 1,
1.926921, 0.2668644, 1.999614, 1, 1, 1, 1, 1,
1.952956, -0.04289285, 2.825216, 1, 1, 1, 1, 1,
1.962018, 0.1542596, 0.7618973, 1, 1, 1, 1, 1,
1.975803, -0.6632838, 3.637041, 1, 1, 1, 1, 1,
2.029341, -0.5422199, 0.4909868, 1, 1, 1, 1, 1,
2.039566, -0.5891511, 1.044407, 1, 1, 1, 1, 1,
2.042578, 1.290011, 1.851847, 1, 1, 1, 1, 1,
2.04662, -1.386419, 1.469639, 1, 1, 1, 1, 1,
2.070673, -0.7362024, 2.319569, 1, 1, 1, 1, 1,
2.08505, 1.117857, 1.79861, 1, 1, 1, 1, 1,
2.099612, -0.1058105, -0.09076203, 1, 1, 1, 1, 1,
2.103157, 0.354966, 0.7112388, 1, 1, 1, 1, 1,
2.121675, 0.2326304, 2.213212, 0, 0, 1, 1, 1,
2.151072, -0.9449195, 2.353383, 1, 0, 0, 1, 1,
2.178538, 0.7805158, 0.6729048, 1, 0, 0, 1, 1,
2.18424, -0.3454423, 2.566822, 1, 0, 0, 1, 1,
2.275198, -0.1274526, 2.027998, 1, 0, 0, 1, 1,
2.341465, -0.4067946, 1.02606, 1, 0, 0, 1, 1,
2.367246, -0.9732814, 2.74951, 0, 0, 0, 1, 1,
2.391677, -1.632166, 1.702509, 0, 0, 0, 1, 1,
2.403915, -0.7786123, 0.9340265, 0, 0, 0, 1, 1,
2.435559, -0.4372005, 1.889838, 0, 0, 0, 1, 1,
2.4933, -1.958803, 2.066058, 0, 0, 0, 1, 1,
2.56348, 1.034714, 1.60491, 0, 0, 0, 1, 1,
2.739483, -0.1431421, 0.8241301, 0, 0, 0, 1, 1,
2.896641, 0.1376721, 0.5947009, 1, 1, 1, 1, 1,
2.931147, -0.4452758, 1.441961, 1, 1, 1, 1, 1,
2.970723, 0.07328412, 0.6652745, 1, 1, 1, 1, 1,
2.986026, -0.700979, 2.050523, 1, 1, 1, 1, 1,
3.041264, 0.7395434, 2.307937, 1, 1, 1, 1, 1,
3.070329, -0.6484292, 1.638709, 1, 1, 1, 1, 1,
3.360096, 1.907303, 0.1040713, 1, 1, 1, 1, 1
]);
var values25 = v;
var normLoc25 = gl.getAttribLocation(prog25, "aNorm");
var mvMatLoc25 = gl.getUniformLocation(prog25,"mvMatrix");
var prMatLoc25 = gl.getUniformLocation(prog25,"prMatrix");
var normMatLoc25 = gl.getUniformLocation(prog25,"normMatrix");
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
// ***** subscene 19 ****
gl.viewport(0, 0, 504, 504);
gl.scissor(0, 0, 504, 504);
gl.clearColor(1, 1, 1, 1);
gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
var radius = 9.615962;
var distance = 33.77566;
var t = tan(fov[19]*PI/360);
var near = distance - radius;
var far = distance + radius;
var hlen = t*near;
var aspect = 1;
prMatrix.makeIdentity();
if (aspect > 1)
prMatrix.frustum(-hlen*aspect*zoom[19], hlen*aspect*zoom[19], 
-hlen*zoom[19], hlen*zoom[19], near, far);
else  
prMatrix.frustum(-hlen*zoom[19], hlen*zoom[19], 
-hlen*zoom[19]/aspect, hlen*zoom[19]/aspect, 
near, far);
mvMatrix.makeIdentity();
mvMatrix.translate( -0.1816957, -0.3233821, -0.06985283 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.77566);
normMatrix.makeIdentity();
normMatrix.scale( 1, 1, 1 );   
normMatrix.multRight( userMatrix[19] );
// ****** spheres object 25 *******
gl.useProgram(prog25);
gl.bindBuffer(gl.ARRAY_BUFFER, sphereBuf);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, sphereIbuf);
gl.uniformMatrix4fv( prMatLoc25, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc25, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniformMatrix4fv( normMatLoc25, false, new Float32Array(normMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.enableVertexAttribArray(normLoc25 );
gl.vertexAttribPointer(normLoc25,  3, gl.FLOAT, false, 12,  0);
gl.disableVertexAttribArray( colLoc );
var sphereNorm = new CanvasMatrix4();
sphereNorm.scale(1, 1, 1);
sphereNorm.multRight(normMatrix);
gl.uniformMatrix4fv( normMatLoc25, false, new Float32Array(sphereNorm.getAsArray()) );
for (var i = 0; i < 1000; i++) {
var sphereMV = new CanvasMatrix4();
var baseofs = i*8
var ofs = baseofs + 7;	       
var scale = values25[ofs];
sphereMV.scale(1*scale, 1*scale, 1*scale);
sphereMV.translate(values25[baseofs], 
values25[baseofs+1], 
values25[baseofs+2]);
sphereMV.multRight(mvMatrix);
gl.uniformMatrix4fv( mvMatLoc25, false, new Float32Array(sphereMV.getAsArray()) );
ofs = baseofs + 3;       
gl.vertexAttrib4f( colLoc, values25[ofs], 
values25[ofs+1], 
values25[ofs+2],
values25[ofs+3] );
gl.drawElements(gl.TRIANGLES, 384, gl.UNSIGNED_SHORT, 0);
}
gl.flush ();
}
var vpx0 = {
19: 0
};
var vpy0 = {
19: 0
};
var vpWidths = {
19: 504
};
var vpHeights = {
19: 504
};
var activeModel = {
19: 19
};
var activeProjection = {
19: 19
};
var whichSubscene = function(coords){
if (0 <= coords.x && coords.x <= 504 && 0 <= coords.y && coords.y <= 504) return(19);
return(19);
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
<canvas id="testgl2canvas" width="1" height="1"></canvas> 
<p id="testgl2debug">
You must enable Javascript to view this page properly.</p>
<script>testgl2webGLStart();</script>
