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
-2.951057, -0.4005264, -1.887252, 1, 0, 0, 1,
-2.637175, 0.8596725, 0.01353445, 1, 0.007843138, 0, 1,
-2.612761, 1.582539, -2.099109, 1, 0.01176471, 0, 1,
-2.600018, -0.160593, -0.6787852, 1, 0.01960784, 0, 1,
-2.481137, -0.5912654, -1.924859, 1, 0.02352941, 0, 1,
-2.425231, 1.402261, -1.219613, 1, 0.03137255, 0, 1,
-2.37667, 0.7450279, 0.4493298, 1, 0.03529412, 0, 1,
-2.25145, 1.252532, 0.9471842, 1, 0.04313726, 0, 1,
-2.211999, 0.841535, -0.438248, 1, 0.04705882, 0, 1,
-2.211829, -0.5084778, -2.634073, 1, 0.05490196, 0, 1,
-2.209166, -1.607901, -2.872064, 1, 0.05882353, 0, 1,
-2.181812, 1.185536, -1.459379, 1, 0.06666667, 0, 1,
-2.127683, -1.932375, -2.082659, 1, 0.07058824, 0, 1,
-2.104949, -1.061606, -3.229108, 1, 0.07843138, 0, 1,
-2.076044, 1.237501, -1.375155, 1, 0.08235294, 0, 1,
-2.051615, 0.6288344, -2.143357, 1, 0.09019608, 0, 1,
-2.037462, 0.2193822, -2.254093, 1, 0.09411765, 0, 1,
-2.025157, 0.1721552, -2.791695, 1, 0.1019608, 0, 1,
-2.021804, -1.003077, -2.776963, 1, 0.1098039, 0, 1,
-2.021631, 0.2720326, -2.512478, 1, 0.1137255, 0, 1,
-1.982223, 0.4371957, -1.304659, 1, 0.1215686, 0, 1,
-1.965682, -0.02279328, -0.5897908, 1, 0.1254902, 0, 1,
-1.951563, -0.914003, -1.660783, 1, 0.1333333, 0, 1,
-1.938512, 0.4233652, 0.1500795, 1, 0.1372549, 0, 1,
-1.936977, -1.560764, -3.345741, 1, 0.145098, 0, 1,
-1.936939, -1.169669, -1.898583, 1, 0.1490196, 0, 1,
-1.931253, 0.2259719, -1.488152, 1, 0.1568628, 0, 1,
-1.927481, 0.4826645, -2.930382, 1, 0.1607843, 0, 1,
-1.916917, 0.5071016, -2.383771, 1, 0.1686275, 0, 1,
-1.908907, -0.4768292, -1.005242, 1, 0.172549, 0, 1,
-1.883243, 2.695542, -1.565383, 1, 0.1803922, 0, 1,
-1.864226, -0.7773561, -2.682715, 1, 0.1843137, 0, 1,
-1.855249, 0.5663183, -1.664971, 1, 0.1921569, 0, 1,
-1.841338, 0.9197856, 0.5479398, 1, 0.1960784, 0, 1,
-1.831879, -0.6379123, -1.779554, 1, 0.2039216, 0, 1,
-1.831627, -0.9336511, -1.892644, 1, 0.2117647, 0, 1,
-1.797131, 0.9527032, -1.524681, 1, 0.2156863, 0, 1,
-1.791123, -0.6488669, -1.681866, 1, 0.2235294, 0, 1,
-1.790488, -0.7585664, -1.948037, 1, 0.227451, 0, 1,
-1.779302, 1.227228, -0.3045259, 1, 0.2352941, 0, 1,
-1.774824, 0.2587892, 0.7180367, 1, 0.2392157, 0, 1,
-1.769842, 0.5613601, -1.318011, 1, 0.2470588, 0, 1,
-1.755807, -0.1071104, -0.9882325, 1, 0.2509804, 0, 1,
-1.75557, -0.02587551, -1.726504, 1, 0.2588235, 0, 1,
-1.752497, 0.125991, -2.099697, 1, 0.2627451, 0, 1,
-1.750177, -0.4311256, -1.192391, 1, 0.2705882, 0, 1,
-1.740294, 1.094191, -1.73611, 1, 0.2745098, 0, 1,
-1.739929, -0.08963633, -2.585392, 1, 0.282353, 0, 1,
-1.691858, -1.135601, -2.680853, 1, 0.2862745, 0, 1,
-1.667836, 0.4240897, -1.040051, 1, 0.2941177, 0, 1,
-1.662115, -0.07277162, -1.569023, 1, 0.3019608, 0, 1,
-1.66002, -0.353675, 1.251997, 1, 0.3058824, 0, 1,
-1.653291, -0.5977796, -1.86882, 1, 0.3137255, 0, 1,
-1.647253, -0.1388986, -1.220416, 1, 0.3176471, 0, 1,
-1.643915, 0.6727256, -0.6063297, 1, 0.3254902, 0, 1,
-1.636327, -0.2397571, -2.722479, 1, 0.3294118, 0, 1,
-1.622232, 0.09115982, -0.6237346, 1, 0.3372549, 0, 1,
-1.620768, -0.3227769, -2.134005, 1, 0.3411765, 0, 1,
-1.619781, -0.2595905, -0.7059093, 1, 0.3490196, 0, 1,
-1.616143, -0.1264023, -1.289306, 1, 0.3529412, 0, 1,
-1.600921, 0.5090528, -2.622929, 1, 0.3607843, 0, 1,
-1.598424, -0.7789284, -2.68101, 1, 0.3647059, 0, 1,
-1.595984, 1.100523, -0.9237714, 1, 0.372549, 0, 1,
-1.591475, -0.6251943, -2.54007, 1, 0.3764706, 0, 1,
-1.580432, -0.1108649, -0.9810626, 1, 0.3843137, 0, 1,
-1.552823, -1.170345, -1.310819, 1, 0.3882353, 0, 1,
-1.551164, 1.294015, 0.5290505, 1, 0.3960784, 0, 1,
-1.54462, 0.2386742, -0.9990416, 1, 0.4039216, 0, 1,
-1.530639, 0.04835663, -1.227733, 1, 0.4078431, 0, 1,
-1.529979, 0.9310189, -1.695037, 1, 0.4156863, 0, 1,
-1.527104, -0.3223292, -0.4696185, 1, 0.4196078, 0, 1,
-1.498394, 1.093257, 0.2136319, 1, 0.427451, 0, 1,
-1.498217, -0.6271131, -2.087916, 1, 0.4313726, 0, 1,
-1.488135, -1.39412, -2.55847, 1, 0.4392157, 0, 1,
-1.486513, 0.5973154, -1.6551, 1, 0.4431373, 0, 1,
-1.461163, -0.3644738, -0.05607379, 1, 0.4509804, 0, 1,
-1.445442, -0.2559841, -0.8768499, 1, 0.454902, 0, 1,
-1.439932, -0.1830555, -0.9893692, 1, 0.4627451, 0, 1,
-1.427426, 0.1682669, -0.0563928, 1, 0.4666667, 0, 1,
-1.427172, 1.216275, 0.7770712, 1, 0.4745098, 0, 1,
-1.416238, -0.001555798, -3.040076, 1, 0.4784314, 0, 1,
-1.415238, -0.8257648, -2.46508, 1, 0.4862745, 0, 1,
-1.407543, 0.1009927, -0.5853503, 1, 0.4901961, 0, 1,
-1.400288, 0.4856872, -0.8811382, 1, 0.4980392, 0, 1,
-1.397696, 0.06914924, -0.641436, 1, 0.5058824, 0, 1,
-1.396062, 0.361985, -2.150214, 1, 0.509804, 0, 1,
-1.382509, 0.2665057, -1.740674, 1, 0.5176471, 0, 1,
-1.36826, 1.239004, -2.669881, 1, 0.5215687, 0, 1,
-1.360075, 1.200225, -2.694451, 1, 0.5294118, 0, 1,
-1.358099, -0.1874193, -1.27367, 1, 0.5333334, 0, 1,
-1.352263, 0.1372366, -3.647965, 1, 0.5411765, 0, 1,
-1.346679, -1.211407, -2.633466, 1, 0.5450981, 0, 1,
-1.343828, 0.9931335, -1.678879, 1, 0.5529412, 0, 1,
-1.321298, 0.4195651, -1.143375, 1, 0.5568628, 0, 1,
-1.317932, 0.7527204, 0.686151, 1, 0.5647059, 0, 1,
-1.31254, -2.283647, -4.386925, 1, 0.5686275, 0, 1,
-1.310056, -1.108017, -4.022662, 1, 0.5764706, 0, 1,
-1.309463, 0.284651, -1.426889, 1, 0.5803922, 0, 1,
-1.303486, 1.469557, -0.8612918, 1, 0.5882353, 0, 1,
-1.292435, -0.7437592, -1.279332, 1, 0.5921569, 0, 1,
-1.286524, -1.069606, -3.564362, 1, 0.6, 0, 1,
-1.2836, -0.2156047, -0.4626324, 1, 0.6078432, 0, 1,
-1.27442, -1.341403, -3.574454, 1, 0.6117647, 0, 1,
-1.273289, -0.2794764, -2.559664, 1, 0.6196079, 0, 1,
-1.264563, 1.174093, -1.285843, 1, 0.6235294, 0, 1,
-1.260473, 1.394835, -1.411963, 1, 0.6313726, 0, 1,
-1.250999, -0.8734006, -1.365202, 1, 0.6352941, 0, 1,
-1.246436, -0.4796569, -1.367256, 1, 0.6431373, 0, 1,
-1.240815, -0.9582037, -3.18722, 1, 0.6470588, 0, 1,
-1.239525, -1.155738, -1.764918, 1, 0.654902, 0, 1,
-1.224007, 0.4482489, 0.6047732, 1, 0.6588235, 0, 1,
-1.216116, 0.3691082, -2.238089, 1, 0.6666667, 0, 1,
-1.215375, 1.663456, -0.5630118, 1, 0.6705883, 0, 1,
-1.205444, 0.3546626, -1.745982, 1, 0.6784314, 0, 1,
-1.2023, -0.5319256, -1.582428, 1, 0.682353, 0, 1,
-1.194356, 1.328617, -0.1314141, 1, 0.6901961, 0, 1,
-1.181388, -0.2734296, -1.923277, 1, 0.6941177, 0, 1,
-1.173998, 0.6212141, -0.7827238, 1, 0.7019608, 0, 1,
-1.167711, 0.7157516, -0.09741602, 1, 0.7098039, 0, 1,
-1.16265, -1.045503, -3.678813, 1, 0.7137255, 0, 1,
-1.162611, 0.66882, -2.200488, 1, 0.7215686, 0, 1,
-1.162101, 1.49315, -2.609927, 1, 0.7254902, 0, 1,
-1.141283, -0.3664598, -2.120706, 1, 0.7333333, 0, 1,
-1.140181, -0.05593478, -3.008507, 1, 0.7372549, 0, 1,
-1.138566, -0.6003596, -1.723857, 1, 0.7450981, 0, 1,
-1.136179, 0.1550255, -1.47897, 1, 0.7490196, 0, 1,
-1.136095, 0.455149, 1.683051, 1, 0.7568628, 0, 1,
-1.135094, 0.06696145, -2.064755, 1, 0.7607843, 0, 1,
-1.134347, 1.312064, -0.6838097, 1, 0.7686275, 0, 1,
-1.13267, 1.12681, -1.585748, 1, 0.772549, 0, 1,
-1.117848, -1.072231, -2.346777, 1, 0.7803922, 0, 1,
-1.104669, -0.7817504, -2.114752, 1, 0.7843137, 0, 1,
-1.104044, 0.1349634, -1.010665, 1, 0.7921569, 0, 1,
-1.104018, -1.423636, -3.010054, 1, 0.7960784, 0, 1,
-1.103938, -0.4528973, -2.427497, 1, 0.8039216, 0, 1,
-1.092041, -0.5418828, -1.640759, 1, 0.8117647, 0, 1,
-1.085225, -1.319852, -3.642155, 1, 0.8156863, 0, 1,
-1.082756, 0.9355357, 1.535868, 1, 0.8235294, 0, 1,
-1.075153, -0.08542513, -0.9393185, 1, 0.827451, 0, 1,
-1.071632, 0.7867578, 0.07591022, 1, 0.8352941, 0, 1,
-1.063477, 0.824195, -0.4353824, 1, 0.8392157, 0, 1,
-1.063192, -0.7170255, -1.143308, 1, 0.8470588, 0, 1,
-1.063068, -0.5757266, -2.828156, 1, 0.8509804, 0, 1,
-1.060736, -1.027538, -3.332116, 1, 0.8588235, 0, 1,
-1.058471, 0.6335017, -1.43504, 1, 0.8627451, 0, 1,
-1.045062, -0.6835795, -2.755075, 1, 0.8705882, 0, 1,
-1.039526, 0.5059593, -1.456942, 1, 0.8745098, 0, 1,
-1.037201, 2.120285, -0.2689025, 1, 0.8823529, 0, 1,
-1.032712, 1.196231, -0.1470035, 1, 0.8862745, 0, 1,
-1.03125, 0.8718598, -1.203974, 1, 0.8941177, 0, 1,
-1.0297, -3.088969, -2.214072, 1, 0.8980392, 0, 1,
-1.029545, 0.3185996, -2.601994, 1, 0.9058824, 0, 1,
-1.024112, 0.1946005, -0.04930338, 1, 0.9137255, 0, 1,
-1.023349, 0.3644038, -1.465682, 1, 0.9176471, 0, 1,
-1.01124, -0.6163046, -2.382077, 1, 0.9254902, 0, 1,
-1.005655, 0.8965487, -0.9192979, 1, 0.9294118, 0, 1,
-1.002665, -0.5941038, -1.758654, 1, 0.9372549, 0, 1,
-0.9910097, 1.109446, -0.4585646, 1, 0.9411765, 0, 1,
-0.9903669, -0.2485715, -2.21052, 1, 0.9490196, 0, 1,
-0.9730269, 0.4315438, -1.744366, 1, 0.9529412, 0, 1,
-0.9714763, -0.3695117, -0.2231654, 1, 0.9607843, 0, 1,
-0.9669433, -0.3057078, -2.12535, 1, 0.9647059, 0, 1,
-0.9665211, -2.293492, -2.37377, 1, 0.972549, 0, 1,
-0.9592586, -2.142978, -4.10704, 1, 0.9764706, 0, 1,
-0.9529887, 0.572689, -1.091508, 1, 0.9843137, 0, 1,
-0.9500262, -0.6950126, -3.106078, 1, 0.9882353, 0, 1,
-0.9449432, 1.15245, -0.8474254, 1, 0.9960784, 0, 1,
-0.9443521, 0.8204195, -2.222111, 0.9960784, 1, 0, 1,
-0.944214, 0.1487455, -2.240953, 0.9921569, 1, 0, 1,
-0.9431319, -0.28804, 1.231937, 0.9843137, 1, 0, 1,
-0.9426411, 0.9061065, 0.04156804, 0.9803922, 1, 0, 1,
-0.9426156, 1.538202, -0.9350654, 0.972549, 1, 0, 1,
-0.9344859, 0.550361, -1.277675, 0.9686275, 1, 0, 1,
-0.932485, -1.466806, -3.32204, 0.9607843, 1, 0, 1,
-0.9126893, -0.05648235, -2.939938, 0.9568627, 1, 0, 1,
-0.9116819, 0.7543136, -0.7522241, 0.9490196, 1, 0, 1,
-0.8981225, 0.8133971, -0.6374977, 0.945098, 1, 0, 1,
-0.8859815, 0.2851616, -3.058421, 0.9372549, 1, 0, 1,
-0.8837514, -0.9967037, -2.065665, 0.9333333, 1, 0, 1,
-0.8797792, -0.6124651, -1.320453, 0.9254902, 1, 0, 1,
-0.8766118, -0.6954829, -1.897164, 0.9215686, 1, 0, 1,
-0.87558, 0.3958572, -2.012425, 0.9137255, 1, 0, 1,
-0.8735133, 1.110563, -0.6293048, 0.9098039, 1, 0, 1,
-0.8727171, 0.5828755, -1.908039, 0.9019608, 1, 0, 1,
-0.8715436, 1.564751, -0.4700722, 0.8941177, 1, 0, 1,
-0.8678901, -0.8090116, -2.299598, 0.8901961, 1, 0, 1,
-0.8651884, -0.5849314, -2.68987, 0.8823529, 1, 0, 1,
-0.86233, -0.2138459, -0.4570913, 0.8784314, 1, 0, 1,
-0.8588843, 0.2579013, -1.850559, 0.8705882, 1, 0, 1,
-0.8484018, 2.280443, -1.828761, 0.8666667, 1, 0, 1,
-0.8476697, 0.5126, -0.2093466, 0.8588235, 1, 0, 1,
-0.846079, 0.4002527, 1.180576, 0.854902, 1, 0, 1,
-0.8391432, -0.7813801, -2.324222, 0.8470588, 1, 0, 1,
-0.8356684, -2.664475, -2.798631, 0.8431373, 1, 0, 1,
-0.8355361, 1.524647, -2.941493, 0.8352941, 1, 0, 1,
-0.8178163, 1.180293, -0.7508227, 0.8313726, 1, 0, 1,
-0.8127618, 0.8221039, -1.015905, 0.8235294, 1, 0, 1,
-0.8049933, 0.0001526574, -1.154586, 0.8196079, 1, 0, 1,
-0.796514, 0.0671406, -1.237237, 0.8117647, 1, 0, 1,
-0.7957006, -0.3190118, -0.6202162, 0.8078431, 1, 0, 1,
-0.7933599, 1.191107, 0.3092448, 0.8, 1, 0, 1,
-0.7920295, 0.6979555, -1.587748, 0.7921569, 1, 0, 1,
-0.7907895, -1.19322, -1.853635, 0.7882353, 1, 0, 1,
-0.7827716, -0.8356321, -3.35605, 0.7803922, 1, 0, 1,
-0.7802016, -1.337175, -2.714046, 0.7764706, 1, 0, 1,
-0.7792524, -0.9290597, -1.852784, 0.7686275, 1, 0, 1,
-0.7787447, 1.245428, -1.737991, 0.7647059, 1, 0, 1,
-0.7757092, 0.5866814, -2.650238, 0.7568628, 1, 0, 1,
-0.7751828, 1.496976, 0.8638281, 0.7529412, 1, 0, 1,
-0.7737081, -1.351281, -2.224566, 0.7450981, 1, 0, 1,
-0.7709142, 1.291333, -1.108194, 0.7411765, 1, 0, 1,
-0.7707775, 0.153382, -0.7540335, 0.7333333, 1, 0, 1,
-0.7669429, -0.7802484, -2.662747, 0.7294118, 1, 0, 1,
-0.7638878, 0.8702723, 0.1546376, 0.7215686, 1, 0, 1,
-0.7624347, 1.196784, -1.043192, 0.7176471, 1, 0, 1,
-0.7595661, -0.1990765, -1.464976, 0.7098039, 1, 0, 1,
-0.758399, -1.149507, -1.983751, 0.7058824, 1, 0, 1,
-0.7578244, -0.03556402, -2.071023, 0.6980392, 1, 0, 1,
-0.7537301, -0.6990761, -1.654662, 0.6901961, 1, 0, 1,
-0.7524245, 0.390059, -0.124623, 0.6862745, 1, 0, 1,
-0.7453856, -0.5784829, -1.907941, 0.6784314, 1, 0, 1,
-0.7395039, 1.129179, -0.7417619, 0.6745098, 1, 0, 1,
-0.7372406, -1.617463, -2.600993, 0.6666667, 1, 0, 1,
-0.7368561, -1.746858, -1.321289, 0.6627451, 1, 0, 1,
-0.7321683, -1.955358, -2.304174, 0.654902, 1, 0, 1,
-0.7312399, -0.491055, -1.923727, 0.6509804, 1, 0, 1,
-0.7270317, -0.8924968, -1.900183, 0.6431373, 1, 0, 1,
-0.725569, 0.8054133, -1.180938, 0.6392157, 1, 0, 1,
-0.7189059, 0.07690328, -2.604573, 0.6313726, 1, 0, 1,
-0.7182223, 0.8990062, -1.266712, 0.627451, 1, 0, 1,
-0.7178474, -0.03973559, -0.4522602, 0.6196079, 1, 0, 1,
-0.7158617, 0.8462171, -0.4186005, 0.6156863, 1, 0, 1,
-0.7147431, 1.021434, -0.3373535, 0.6078432, 1, 0, 1,
-0.7145713, 0.1141494, -2.162529, 0.6039216, 1, 0, 1,
-0.7139987, -0.5341637, -0.5318636, 0.5960785, 1, 0, 1,
-0.7138913, 0.2224384, -1.347553, 0.5882353, 1, 0, 1,
-0.7116402, 0.1313372, -0.9998654, 0.5843138, 1, 0, 1,
-0.7103473, 0.3459338, -2.452171, 0.5764706, 1, 0, 1,
-0.7085609, -0.4955536, -1.318929, 0.572549, 1, 0, 1,
-0.7027807, -1.238289, -1.553307, 0.5647059, 1, 0, 1,
-0.6950582, 0.555512, -0.0557036, 0.5607843, 1, 0, 1,
-0.6861334, -2.353061, -2.305222, 0.5529412, 1, 0, 1,
-0.6851858, -1.757554, -0.9477536, 0.5490196, 1, 0, 1,
-0.680609, -1.187068, -2.373795, 0.5411765, 1, 0, 1,
-0.6775245, 2.214248, -0.7958157, 0.5372549, 1, 0, 1,
-0.6686197, -1.029827, -4.767788, 0.5294118, 1, 0, 1,
-0.6638062, 0.3130783, 0.7873759, 0.5254902, 1, 0, 1,
-0.6635279, 0.9806187, -1.731865, 0.5176471, 1, 0, 1,
-0.6540714, -1.540946, -2.91324, 0.5137255, 1, 0, 1,
-0.6500665, 0.4148495, -1.362524, 0.5058824, 1, 0, 1,
-0.6494836, -1.144249, -1.705299, 0.5019608, 1, 0, 1,
-0.6456495, -0.2388517, -1.042877, 0.4941176, 1, 0, 1,
-0.6304467, 0.7027795, -0.5027949, 0.4862745, 1, 0, 1,
-0.6291155, -0.3150851, -3.233806, 0.4823529, 1, 0, 1,
-0.621749, -0.1376476, -1.905083, 0.4745098, 1, 0, 1,
-0.6198583, 0.5253859, -0.7003302, 0.4705882, 1, 0, 1,
-0.6155889, -2.175931, -2.338163, 0.4627451, 1, 0, 1,
-0.6154704, -0.5661428, -1.591539, 0.4588235, 1, 0, 1,
-0.610929, 0.360598, -1.083126, 0.4509804, 1, 0, 1,
-0.6094077, 0.7814953, -1.684704, 0.4470588, 1, 0, 1,
-0.6032923, 0.9691043, -0.5720143, 0.4392157, 1, 0, 1,
-0.6012669, -0.1672237, -2.679709, 0.4352941, 1, 0, 1,
-0.5956478, 1.977673, -1.370191, 0.427451, 1, 0, 1,
-0.594954, 0.8024966, -0.1252043, 0.4235294, 1, 0, 1,
-0.5944034, 0.2962396, -0.8815799, 0.4156863, 1, 0, 1,
-0.5920524, 0.9154384, -0.5351039, 0.4117647, 1, 0, 1,
-0.5872005, -0.8597765, -2.50745, 0.4039216, 1, 0, 1,
-0.5832483, -0.3968579, -0.7928366, 0.3960784, 1, 0, 1,
-0.5773001, 0.4205257, -1.968821, 0.3921569, 1, 0, 1,
-0.5759384, 1.549087, -0.2891595, 0.3843137, 1, 0, 1,
-0.5746707, -1.208356, -4.815324, 0.3803922, 1, 0, 1,
-0.5729567, -0.6321378, -3.078612, 0.372549, 1, 0, 1,
-0.5727257, 0.7510102, 0.7617634, 0.3686275, 1, 0, 1,
-0.5682112, 1.764878, -0.6512644, 0.3607843, 1, 0, 1,
-0.5650906, 0.8678365, -0.9177647, 0.3568628, 1, 0, 1,
-0.5638806, -0.1289881, -1.229503, 0.3490196, 1, 0, 1,
-0.5590023, -1.220587, -3.854849, 0.345098, 1, 0, 1,
-0.5500022, 0.03077379, -1.994981, 0.3372549, 1, 0, 1,
-0.5472742, 0.4711406, -1.060532, 0.3333333, 1, 0, 1,
-0.5468163, -1.364007, -2.437363, 0.3254902, 1, 0, 1,
-0.5387635, -0.1918526, -2.738674, 0.3215686, 1, 0, 1,
-0.5354317, -0.1611865, -3.562326, 0.3137255, 1, 0, 1,
-0.5342449, 1.375105, -1.009249, 0.3098039, 1, 0, 1,
-0.534096, -0.329334, -2.877076, 0.3019608, 1, 0, 1,
-0.5309629, -1.091495, -2.375287, 0.2941177, 1, 0, 1,
-0.5272569, 0.9869419, -0.5537616, 0.2901961, 1, 0, 1,
-0.5237856, -0.1232656, -1.85249, 0.282353, 1, 0, 1,
-0.5214006, -0.6076289, -2.040898, 0.2784314, 1, 0, 1,
-0.5132585, 0.4461733, -1.050398, 0.2705882, 1, 0, 1,
-0.5104218, 1.148846, -0.08845895, 0.2666667, 1, 0, 1,
-0.5095937, 0.01065295, -1.99769, 0.2588235, 1, 0, 1,
-0.506247, 1.395662, 0.5664433, 0.254902, 1, 0, 1,
-0.5011668, -1.075374, -1.198126, 0.2470588, 1, 0, 1,
-0.4987998, 1.456229, 0.05543332, 0.2431373, 1, 0, 1,
-0.497878, -0.1272344, -1.609853, 0.2352941, 1, 0, 1,
-0.4938399, 0.0874851, -0.7734389, 0.2313726, 1, 0, 1,
-0.4905685, -1.328045, -0.2542237, 0.2235294, 1, 0, 1,
-0.4858584, 1.249152, -1.109388, 0.2196078, 1, 0, 1,
-0.4844426, 0.5665905, -0.3836822, 0.2117647, 1, 0, 1,
-0.4841369, 0.006656346, -1.269126, 0.2078431, 1, 0, 1,
-0.4773235, -0.5269958, -0.7078134, 0.2, 1, 0, 1,
-0.4703588, -1.01846, -5.054208, 0.1921569, 1, 0, 1,
-0.4685184, 2.315665, -0.7547187, 0.1882353, 1, 0, 1,
-0.4676865, 1.918292, -0.2741035, 0.1803922, 1, 0, 1,
-0.4657572, 1.60198, 0.2142463, 0.1764706, 1, 0, 1,
-0.4634128, -2.987639, -3.717386, 0.1686275, 1, 0, 1,
-0.4603102, -0.2584246, -2.345232, 0.1647059, 1, 0, 1,
-0.4578496, -0.8440434, -1.985965, 0.1568628, 1, 0, 1,
-0.4543427, -1.298481, -3.594554, 0.1529412, 1, 0, 1,
-0.4543178, 0.1784559, 0.4366112, 0.145098, 1, 0, 1,
-0.4540208, 1.320176, -0.0669013, 0.1411765, 1, 0, 1,
-0.4535226, -0.8508753, -3.310775, 0.1333333, 1, 0, 1,
-0.4506392, -1.743455, -4.068666, 0.1294118, 1, 0, 1,
-0.4489807, 1.274375, 0.3628745, 0.1215686, 1, 0, 1,
-0.4485966, -0.8668596, -3.900224, 0.1176471, 1, 0, 1,
-0.4479723, 1.273911, -0.3422795, 0.1098039, 1, 0, 1,
-0.4398008, 0.05573262, -1.394037, 0.1058824, 1, 0, 1,
-0.4376864, -1.245879, -3.593792, 0.09803922, 1, 0, 1,
-0.4364007, 0.5636889, -2.254001, 0.09019608, 1, 0, 1,
-0.4293275, 0.9140038, -1.92078, 0.08627451, 1, 0, 1,
-0.425014, 0.6369473, -1.795356, 0.07843138, 1, 0, 1,
-0.4238936, -0.731514, -1.383637, 0.07450981, 1, 0, 1,
-0.4174289, -1.098067, -2.16564, 0.06666667, 1, 0, 1,
-0.4167006, 0.8710127, 1.101769, 0.0627451, 1, 0, 1,
-0.4128107, -0.6909467, -3.347851, 0.05490196, 1, 0, 1,
-0.4075345, -0.2475374, -2.247507, 0.05098039, 1, 0, 1,
-0.4038174, -0.01305041, -3.168037, 0.04313726, 1, 0, 1,
-0.4037517, -1.775113, -3.04321, 0.03921569, 1, 0, 1,
-0.4020129, 1.254275, -0.8105198, 0.03137255, 1, 0, 1,
-0.3998744, -0.6348575, -3.496104, 0.02745098, 1, 0, 1,
-0.3985409, -0.0310969, -2.567803, 0.01960784, 1, 0, 1,
-0.3966526, -0.6247846, -3.24082, 0.01568628, 1, 0, 1,
-0.394388, 0.6753469, 0.9448683, 0.007843138, 1, 0, 1,
-0.3893373, -0.4128054, -2.354465, 0.003921569, 1, 0, 1,
-0.3877315, 0.7136775, 0.5747987, 0, 1, 0.003921569, 1,
-0.3862576, -0.6966242, -4.173856, 0, 1, 0.01176471, 1,
-0.3862534, 0.2219516, -0.3743131, 0, 1, 0.01568628, 1,
-0.375637, 0.454172, -1.524744, 0, 1, 0.02352941, 1,
-0.3682253, 0.3685402, -2.033343, 0, 1, 0.02745098, 1,
-0.3642922, 1.031168, -0.665626, 0, 1, 0.03529412, 1,
-0.3568211, 0.2517209, 1.377791, 0, 1, 0.03921569, 1,
-0.3551927, -1.028015, -3.715609, 0, 1, 0.04705882, 1,
-0.3532099, 0.3245286, -1.08916, 0, 1, 0.05098039, 1,
-0.3511335, 1.113399, 0.3214847, 0, 1, 0.05882353, 1,
-0.3470151, 0.2555339, -1.021377, 0, 1, 0.0627451, 1,
-0.3405189, 0.008585171, -2.298003, 0, 1, 0.07058824, 1,
-0.3387619, 1.177456, -0.4444912, 0, 1, 0.07450981, 1,
-0.3363713, 1.519742, -0.148821, 0, 1, 0.08235294, 1,
-0.3353125, 0.3389583, -1.709866, 0, 1, 0.08627451, 1,
-0.3296519, -0.02755918, -3.263321, 0, 1, 0.09411765, 1,
-0.3286389, 0.7354295, -0.3683431, 0, 1, 0.1019608, 1,
-0.3272537, 0.2832518, -0.2439159, 0, 1, 0.1058824, 1,
-0.3209387, -0.7855921, -2.214372, 0, 1, 0.1137255, 1,
-0.3201789, 1.444271, -1.473547, 0, 1, 0.1176471, 1,
-0.3195274, -0.1804056, -2.16728, 0, 1, 0.1254902, 1,
-0.3153795, 0.343953, -2.738804, 0, 1, 0.1294118, 1,
-0.3149733, -0.6115953, -3.881329, 0, 1, 0.1372549, 1,
-0.3141857, 0.3964728, -0.9877216, 0, 1, 0.1411765, 1,
-0.3120568, -0.9660665, -3.471062, 0, 1, 0.1490196, 1,
-0.311504, -1.661806, -1.809787, 0, 1, 0.1529412, 1,
-0.310876, 0.5780756, 0.3160439, 0, 1, 0.1607843, 1,
-0.3088845, 0.17253, 0.2868347, 0, 1, 0.1647059, 1,
-0.3085324, -1.11328, -2.990831, 0, 1, 0.172549, 1,
-0.3074679, -0.5277271, -2.303842, 0, 1, 0.1764706, 1,
-0.3024019, 1.401704, 0.1044282, 0, 1, 0.1843137, 1,
-0.2976079, -0.7823999, -1.88251, 0, 1, 0.1882353, 1,
-0.2939647, -0.2662063, -1.703307, 0, 1, 0.1960784, 1,
-0.2933175, 0.9544494, -0.3086716, 0, 1, 0.2039216, 1,
-0.2903304, 0.6427022, 1.748446, 0, 1, 0.2078431, 1,
-0.2900108, -0.3194837, -2.827641, 0, 1, 0.2156863, 1,
-0.2898615, -0.8562565, -3.721772, 0, 1, 0.2196078, 1,
-0.2891533, 0.3355666, -0.4369869, 0, 1, 0.227451, 1,
-0.2887923, 0.9040014, -1.824976, 0, 1, 0.2313726, 1,
-0.2876845, 0.4302223, -0.4862461, 0, 1, 0.2392157, 1,
-0.2858196, 0.3303153, -0.6141962, 0, 1, 0.2431373, 1,
-0.2842927, -0.8090066, -3.863069, 0, 1, 0.2509804, 1,
-0.2782869, 1.105022, -1.152655, 0, 1, 0.254902, 1,
-0.2750263, -0.4639771, -2.507408, 0, 1, 0.2627451, 1,
-0.2747651, 0.4738355, -2.339952, 0, 1, 0.2666667, 1,
-0.2744879, 0.001563423, -0.4185426, 0, 1, 0.2745098, 1,
-0.2733263, 1.917932, 1.491159, 0, 1, 0.2784314, 1,
-0.2726237, 1.422142, -0.2364268, 0, 1, 0.2862745, 1,
-0.2725899, 0.2273362, -0.8053051, 0, 1, 0.2901961, 1,
-0.2725866, 0.5024376, 1.631448, 0, 1, 0.2980392, 1,
-0.2692183, 0.7672557, 0.6883683, 0, 1, 0.3058824, 1,
-0.2655128, 1.467061, 1.34978, 0, 1, 0.3098039, 1,
-0.2644121, -1.8225, -3.231363, 0, 1, 0.3176471, 1,
-0.2614404, -1.423896, -2.351654, 0, 1, 0.3215686, 1,
-0.2614346, 0.8558035, -0.556424, 0, 1, 0.3294118, 1,
-0.2587005, -2.308178, -3.909005, 0, 1, 0.3333333, 1,
-0.2559257, 2.26638, 0.2332506, 0, 1, 0.3411765, 1,
-0.2540872, 2.264467, -0.354801, 0, 1, 0.345098, 1,
-0.2442549, 2.789109, 0.3872719, 0, 1, 0.3529412, 1,
-0.2388865, -0.7253671, -3.239695, 0, 1, 0.3568628, 1,
-0.2252058, -0.2052505, -2.29897, 0, 1, 0.3647059, 1,
-0.2217074, 1.01647, -1.147018, 0, 1, 0.3686275, 1,
-0.2215815, -0.76496, -4.077919, 0, 1, 0.3764706, 1,
-0.2214665, 0.9116188, 0.2240542, 0, 1, 0.3803922, 1,
-0.2180387, -0.569931, -3.156103, 0, 1, 0.3882353, 1,
-0.2158216, 0.08817493, -0.4859456, 0, 1, 0.3921569, 1,
-0.2143565, 0.488443, -0.9392003, 0, 1, 0.4, 1,
-0.213166, -1.121925, -4.952821, 0, 1, 0.4078431, 1,
-0.2105327, -0.03455757, -4.136682, 0, 1, 0.4117647, 1,
-0.2083408, 0.1819664, -1.287081, 0, 1, 0.4196078, 1,
-0.2042417, -1.292878, -0.7033193, 0, 1, 0.4235294, 1,
-0.2009373, -0.0186313, -2.326629, 0, 1, 0.4313726, 1,
-0.1984906, 0.4239443, -0.7469122, 0, 1, 0.4352941, 1,
-0.1948872, -0.486394, -1.974458, 0, 1, 0.4431373, 1,
-0.1872847, 0.5381787, -1.857112, 0, 1, 0.4470588, 1,
-0.1871906, 0.1909609, -0.5249481, 0, 1, 0.454902, 1,
-0.1870622, -2.337096, -3.235149, 0, 1, 0.4588235, 1,
-0.1807376, 0.7106531, -1.039693, 0, 1, 0.4666667, 1,
-0.1740212, -1.654895, -2.853748, 0, 1, 0.4705882, 1,
-0.1707421, -0.295166, -4.336192, 0, 1, 0.4784314, 1,
-0.1652262, 0.4517044, -0.3556287, 0, 1, 0.4823529, 1,
-0.1632338, 0.05379538, -2.051625, 0, 1, 0.4901961, 1,
-0.1598665, -0.2601286, -3.505328, 0, 1, 0.4941176, 1,
-0.1568685, -1.588123, -2.572882, 0, 1, 0.5019608, 1,
-0.1566395, 0.06962357, -0.8802457, 0, 1, 0.509804, 1,
-0.1494797, -1.432675, -2.594497, 0, 1, 0.5137255, 1,
-0.148499, -0.4209872, -3.831956, 0, 1, 0.5215687, 1,
-0.1469611, 1.190893, -0.3970309, 0, 1, 0.5254902, 1,
-0.1418808, 1.196841, -0.2741482, 0, 1, 0.5333334, 1,
-0.1387029, -1.322496, -4.432498, 0, 1, 0.5372549, 1,
-0.1367355, -0.01478656, -1.166067, 0, 1, 0.5450981, 1,
-0.1334816, -1.27925, -4.036964, 0, 1, 0.5490196, 1,
-0.1333069, -0.6479699, -5.7256, 0, 1, 0.5568628, 1,
-0.1298083, -0.1681436, -2.496586, 0, 1, 0.5607843, 1,
-0.1256024, -1.25851, -1.904823, 0, 1, 0.5686275, 1,
-0.1253703, -0.3906712, -3.095805, 0, 1, 0.572549, 1,
-0.1247684, 0.438746, 0.1473008, 0, 1, 0.5803922, 1,
-0.1232103, -0.3652412, -4.11131, 0, 1, 0.5843138, 1,
-0.1178552, 0.6527864, 1.628725, 0, 1, 0.5921569, 1,
-0.1167038, -0.4027139, -2.519812, 0, 1, 0.5960785, 1,
-0.1137848, -1.738808, -1.565181, 0, 1, 0.6039216, 1,
-0.111508, 2.293322, -0.9490074, 0, 1, 0.6117647, 1,
-0.1086237, 0.4096983, -2.486298, 0, 1, 0.6156863, 1,
-0.1061749, -0.7943082, -2.471857, 0, 1, 0.6235294, 1,
-0.1052063, -0.4360784, -1.779397, 0, 1, 0.627451, 1,
-0.1041155, -0.1773161, -3.976179, 0, 1, 0.6352941, 1,
-0.1037768, -1.582712, -2.908566, 0, 1, 0.6392157, 1,
-0.1031521, 1.304467, -0.5968144, 0, 1, 0.6470588, 1,
-0.103077, -0.2017954, -2.225589, 0, 1, 0.6509804, 1,
-0.09734256, 0.1526711, 0.6107101, 0, 1, 0.6588235, 1,
-0.09407647, 0.3724368, -1.144213, 0, 1, 0.6627451, 1,
-0.09241167, -0.5906194, -4.512365, 0, 1, 0.6705883, 1,
-0.09201174, 0.6124198, -0.9591882, 0, 1, 0.6745098, 1,
-0.08216428, 0.7778375, 0.9740972, 0, 1, 0.682353, 1,
-0.08152134, 0.2405581, -1.690766, 0, 1, 0.6862745, 1,
-0.08135334, -0.07757224, -2.065226, 0, 1, 0.6941177, 1,
-0.08025379, -0.7867044, -2.609928, 0, 1, 0.7019608, 1,
-0.07587477, 0.8587086, 0.176983, 0, 1, 0.7058824, 1,
-0.07584652, 0.924156, 0.2057971, 0, 1, 0.7137255, 1,
-0.07162186, -1.100122, -1.895416, 0, 1, 0.7176471, 1,
-0.06827573, -2.39668, -1.931029, 0, 1, 0.7254902, 1,
-0.068059, -1.993311, -2.216296, 0, 1, 0.7294118, 1,
-0.06391326, -0.5798445, -1.97482, 0, 1, 0.7372549, 1,
-0.06143545, -1.55395, -1.115256, 0, 1, 0.7411765, 1,
-0.06103026, -0.3156593, -3.083004, 0, 1, 0.7490196, 1,
-0.059502, 0.677279, -0.9826177, 0, 1, 0.7529412, 1,
-0.05773166, -0.06490511, -4.041717, 0, 1, 0.7607843, 1,
-0.05676298, 0.6070657, -0.208672, 0, 1, 0.7647059, 1,
-0.05288089, 0.710735, -1.561373, 0, 1, 0.772549, 1,
-0.04898933, 0.2920374, 0.3811172, 0, 1, 0.7764706, 1,
-0.04370381, -0.7462739, -4.611006, 0, 1, 0.7843137, 1,
-0.03508554, -0.01081383, -1.580011, 0, 1, 0.7882353, 1,
-0.03097253, -0.336852, -5.00109, 0, 1, 0.7960784, 1,
-0.02925878, -0.5897012, -3.703159, 0, 1, 0.8039216, 1,
-0.02835313, 0.4092998, -2.899969, 0, 1, 0.8078431, 1,
-0.02735024, 1.270415, 0.5510061, 0, 1, 0.8156863, 1,
-0.02582172, 0.3815103, -0.7366371, 0, 1, 0.8196079, 1,
-0.02527672, -1.155236, -3.849366, 0, 1, 0.827451, 1,
-0.02523562, -0.9104111, -4.222046, 0, 1, 0.8313726, 1,
-0.02366218, -1.270301, -3.329099, 0, 1, 0.8392157, 1,
-0.01562493, -1.305096, -4.971259, 0, 1, 0.8431373, 1,
-0.01529161, -0.02309191, -1.544421, 0, 1, 0.8509804, 1,
-0.01459665, 1.069278, -0.003739179, 0, 1, 0.854902, 1,
-0.01291786, 0.2831389, -0.05153971, 0, 1, 0.8627451, 1,
-0.01271905, -0.03588672, -4.127248, 0, 1, 0.8666667, 1,
-0.01203723, -0.7339626, -2.506654, 0, 1, 0.8745098, 1,
-0.007821675, 0.1572681, -1.588671, 0, 1, 0.8784314, 1,
-0.007721397, -0.6901298, -2.045652, 0, 1, 0.8862745, 1,
0.001003671, -0.2898465, 2.15528, 0, 1, 0.8901961, 1,
0.01353038, -0.02391746, 2.286378, 0, 1, 0.8980392, 1,
0.0160667, 1.150438, -0.6358621, 0, 1, 0.9058824, 1,
0.02119507, -0.05124856, 3.644703, 0, 1, 0.9098039, 1,
0.02316061, -1.455533, 2.89512, 0, 1, 0.9176471, 1,
0.0248419, -1.998018, 5.094529, 0, 1, 0.9215686, 1,
0.03292608, -0.1136129, 2.855877, 0, 1, 0.9294118, 1,
0.03526173, 2.887547, 0.4719066, 0, 1, 0.9333333, 1,
0.03575094, 0.05870414, 0.1564774, 0, 1, 0.9411765, 1,
0.04043185, -0.02902478, 2.321124, 0, 1, 0.945098, 1,
0.04050848, -0.6132705, 2.574736, 0, 1, 0.9529412, 1,
0.04362252, -1.626941, 2.327573, 0, 1, 0.9568627, 1,
0.04418651, 0.9092256, -0.8934661, 0, 1, 0.9647059, 1,
0.04453649, 1.384407, 0.818627, 0, 1, 0.9686275, 1,
0.04626035, 1.098351, -0.5861052, 0, 1, 0.9764706, 1,
0.04735348, -1.878317, 4.668291, 0, 1, 0.9803922, 1,
0.05165163, -1.530097, 2.408353, 0, 1, 0.9882353, 1,
0.0552008, 0.0582011, 0.3670929, 0, 1, 0.9921569, 1,
0.05832012, 0.5632216, -1.788887, 0, 1, 1, 1,
0.06398177, -0.3991678, 4.422472, 0, 0.9921569, 1, 1,
0.06885566, -0.6891177, 3.50485, 0, 0.9882353, 1, 1,
0.06949664, -0.7272269, 2.487427, 0, 0.9803922, 1, 1,
0.07170706, -0.5760078, 3.261615, 0, 0.9764706, 1, 1,
0.0747585, -0.332848, 3.729123, 0, 0.9686275, 1, 1,
0.07758997, -0.6621242, 4.382975, 0, 0.9647059, 1, 1,
0.08509272, -0.5503868, 4.420348, 0, 0.9568627, 1, 1,
0.0858334, -0.4206593, 3.925475, 0, 0.9529412, 1, 1,
0.08623499, 0.2603026, -0.006483257, 0, 0.945098, 1, 1,
0.0901285, -1.265221, 2.09927, 0, 0.9411765, 1, 1,
0.09049956, 0.5420975, 0.5883784, 0, 0.9333333, 1, 1,
0.1047429, 1.003506, -0.1955031, 0, 0.9294118, 1, 1,
0.1081847, 0.3394325, -1.206241, 0, 0.9215686, 1, 1,
0.1099958, -1.728073, 2.447241, 0, 0.9176471, 1, 1,
0.1184529, -0.8809447, 3.785156, 0, 0.9098039, 1, 1,
0.1202275, -1.16162, 2.733855, 0, 0.9058824, 1, 1,
0.1207361, -0.03520544, 2.495107, 0, 0.8980392, 1, 1,
0.1225465, 0.189461, -0.3609945, 0, 0.8901961, 1, 1,
0.1263951, 0.4570613, -0.1106057, 0, 0.8862745, 1, 1,
0.1306027, 0.0799226, 1.621645, 0, 0.8784314, 1, 1,
0.1333958, -0.3681205, 2.691232, 0, 0.8745098, 1, 1,
0.1366518, -0.7851542, 3.437232, 0, 0.8666667, 1, 1,
0.1384752, 0.1059136, 0.9812771, 0, 0.8627451, 1, 1,
0.1434419, 1.624662, -0.3232431, 0, 0.854902, 1, 1,
0.1500485, -1.785301, 2.82916, 0, 0.8509804, 1, 1,
0.1565951, -2.103725, 3.523667, 0, 0.8431373, 1, 1,
0.159315, 1.491836, 0.3315412, 0, 0.8392157, 1, 1,
0.1615762, 1.137131, 0.3792933, 0, 0.8313726, 1, 1,
0.1663189, -0.5683373, 2.193388, 0, 0.827451, 1, 1,
0.1665966, -0.5414988, 1.37783, 0, 0.8196079, 1, 1,
0.1673904, 0.4057878, 1.471164, 0, 0.8156863, 1, 1,
0.1696091, 0.7740665, -2.012404, 0, 0.8078431, 1, 1,
0.1704333, 0.1115765, 1.608941, 0, 0.8039216, 1, 1,
0.1772404, -0.5763751, 2.624502, 0, 0.7960784, 1, 1,
0.1796515, 0.41701, 0.4870107, 0, 0.7882353, 1, 1,
0.1818515, -0.7900191, 4.396602, 0, 0.7843137, 1, 1,
0.1827834, 0.1803875, 0.002535688, 0, 0.7764706, 1, 1,
0.1868678, 1.218944, -0.8945657, 0, 0.772549, 1, 1,
0.1871777, 0.1473869, 1.268618, 0, 0.7647059, 1, 1,
0.1883247, 1.080806, 0.1486032, 0, 0.7607843, 1, 1,
0.1907501, 0.6611325, 0.6755897, 0, 0.7529412, 1, 1,
0.1922485, 0.03813495, 1.964094, 0, 0.7490196, 1, 1,
0.1923337, -1.136889, 3.437298, 0, 0.7411765, 1, 1,
0.1931999, 1.20158, 2.650733, 0, 0.7372549, 1, 1,
0.2063584, -0.4953793, 2.740115, 0, 0.7294118, 1, 1,
0.2096115, 0.3288186, 0.9954099, 0, 0.7254902, 1, 1,
0.2105741, 0.8776909, -1.194181, 0, 0.7176471, 1, 1,
0.2117509, 1.057179, -1.02618, 0, 0.7137255, 1, 1,
0.212874, -0.3419045, 3.81398, 0, 0.7058824, 1, 1,
0.2181104, -0.8992172, 2.680766, 0, 0.6980392, 1, 1,
0.2181251, 0.01547452, 0.4216169, 0, 0.6941177, 1, 1,
0.2181417, -1.151127, 2.051503, 0, 0.6862745, 1, 1,
0.2197337, -0.6023826, 4.176264, 0, 0.682353, 1, 1,
0.2200138, -2.666042, 3.737745, 0, 0.6745098, 1, 1,
0.2237156, 0.2688624, 2.051595, 0, 0.6705883, 1, 1,
0.2239751, -0.1022381, 2.266223, 0, 0.6627451, 1, 1,
0.2331532, 0.7487664, 1.22319, 0, 0.6588235, 1, 1,
0.2392831, 0.6638942, 0.7804913, 0, 0.6509804, 1, 1,
0.2404808, -1.911029, 3.561108, 0, 0.6470588, 1, 1,
0.2412585, -0.9972684, 1.424325, 0, 0.6392157, 1, 1,
0.2514244, 0.561742, 0.2705162, 0, 0.6352941, 1, 1,
0.2582172, 0.228254, 0.9323988, 0, 0.627451, 1, 1,
0.2609957, 0.3399064, 0.004187228, 0, 0.6235294, 1, 1,
0.2621732, -0.38406, 3.213896, 0, 0.6156863, 1, 1,
0.266007, 0.8191382, 1.264179, 0, 0.6117647, 1, 1,
0.2665411, -0.8231631, 2.129784, 0, 0.6039216, 1, 1,
0.2691027, 0.4484607, -0.4896983, 0, 0.5960785, 1, 1,
0.2697965, 0.4136792, 0.8783891, 0, 0.5921569, 1, 1,
0.2702812, 0.3728811, 0.2104471, 0, 0.5843138, 1, 1,
0.2707099, -0.9643691, 2.466254, 0, 0.5803922, 1, 1,
0.2732138, 0.5994344, 1.392758, 0, 0.572549, 1, 1,
0.274281, -1.193717, 1.080638, 0, 0.5686275, 1, 1,
0.2798747, 0.3165165, 2.360118, 0, 0.5607843, 1, 1,
0.2838984, 0.9045888, 0.8954619, 0, 0.5568628, 1, 1,
0.284987, -0.1270912, 1.985222, 0, 0.5490196, 1, 1,
0.2861962, -0.540484, 2.532843, 0, 0.5450981, 1, 1,
0.2866614, 1.505026, -1.971507, 0, 0.5372549, 1, 1,
0.2867429, 0.5278109, 1.599825, 0, 0.5333334, 1, 1,
0.2873607, -0.8809137, 2.367732, 0, 0.5254902, 1, 1,
0.2905125, 0.140342, 1.771478, 0, 0.5215687, 1, 1,
0.2915921, -0.786575, 4.056033, 0, 0.5137255, 1, 1,
0.2937405, -0.3014106, 4.063403, 0, 0.509804, 1, 1,
0.2937415, 1.521492, 0.801172, 0, 0.5019608, 1, 1,
0.2942809, 0.5391313, 1.028377, 0, 0.4941176, 1, 1,
0.2955512, 1.999532, 0.688472, 0, 0.4901961, 1, 1,
0.2960885, 0.3736613, -0.1676937, 0, 0.4823529, 1, 1,
0.2972752, -0.8785666, 3.201247, 0, 0.4784314, 1, 1,
0.2993926, -0.5956216, 2.84906, 0, 0.4705882, 1, 1,
0.3062376, 1.818264, -0.1838887, 0, 0.4666667, 1, 1,
0.306282, -0.4961468, -0.3603517, 0, 0.4588235, 1, 1,
0.3064687, 0.5224207, 0.5299236, 0, 0.454902, 1, 1,
0.3129179, 0.3839277, 0.1885372, 0, 0.4470588, 1, 1,
0.3152209, 0.3233093, 2.38481, 0, 0.4431373, 1, 1,
0.3235705, -1.321983, 3.901369, 0, 0.4352941, 1, 1,
0.325069, 0.2473947, 0.54453, 0, 0.4313726, 1, 1,
0.3273669, 0.1864612, 1.825026, 0, 0.4235294, 1, 1,
0.3308995, -2.350423, 3.781445, 0, 0.4196078, 1, 1,
0.3343634, 0.577632, 1.819507, 0, 0.4117647, 1, 1,
0.3343752, -0.9951052, 3.225918, 0, 0.4078431, 1, 1,
0.3369233, 0.04224151, 1.777477, 0, 0.4, 1, 1,
0.3495102, -0.1784791, 2.79324, 0, 0.3921569, 1, 1,
0.3514258, 1.892135, 0.2431498, 0, 0.3882353, 1, 1,
0.3516695, -0.9801013, 3.335656, 0, 0.3803922, 1, 1,
0.3527153, 0.5029367, 0.2936059, 0, 0.3764706, 1, 1,
0.3571636, -0.03609356, 2.104694, 0, 0.3686275, 1, 1,
0.3583087, 1.186719, -0.6713526, 0, 0.3647059, 1, 1,
0.3594795, -1.55805, 5.412766, 0, 0.3568628, 1, 1,
0.3603502, -1.239026, 3.010084, 0, 0.3529412, 1, 1,
0.3607889, 0.04671878, 1.6962, 0, 0.345098, 1, 1,
0.3680689, -0.5063443, 3.239365, 0, 0.3411765, 1, 1,
0.3709404, -1.629594, 3.128978, 0, 0.3333333, 1, 1,
0.3774216, -1.601913, 2.651282, 0, 0.3294118, 1, 1,
0.3779729, -0.01816634, 2.365842, 0, 0.3215686, 1, 1,
0.3785854, -0.1433669, 1.847243, 0, 0.3176471, 1, 1,
0.383555, 0.01393594, 1.426279, 0, 0.3098039, 1, 1,
0.3846615, 1.500949, 1.314045, 0, 0.3058824, 1, 1,
0.3853832, -0.2447764, 2.503267, 0, 0.2980392, 1, 1,
0.3909785, 0.8951869, 0.6904842, 0, 0.2901961, 1, 1,
0.3938893, 0.8620798, -1.456416, 0, 0.2862745, 1, 1,
0.3941932, -1.07239, 3.33377, 0, 0.2784314, 1, 1,
0.4002627, -0.9659027, 3.471156, 0, 0.2745098, 1, 1,
0.4013907, -0.4317082, 1.770446, 0, 0.2666667, 1, 1,
0.4071623, 1.088164, 0.7159335, 0, 0.2627451, 1, 1,
0.4147487, 1.27025, -0.7411759, 0, 0.254902, 1, 1,
0.4152236, -0.2288763, 2.842019, 0, 0.2509804, 1, 1,
0.4271083, -0.4470937, 0.167382, 0, 0.2431373, 1, 1,
0.4317755, 1.179649, -0.9238492, 0, 0.2392157, 1, 1,
0.4362752, -0.2955658, 2.570886, 0, 0.2313726, 1, 1,
0.4379014, 0.3394253, 0.9876961, 0, 0.227451, 1, 1,
0.4380229, -0.3541268, 2.968322, 0, 0.2196078, 1, 1,
0.4380528, -0.734291, 3.769276, 0, 0.2156863, 1, 1,
0.4397182, -0.1838584, 1.787354, 0, 0.2078431, 1, 1,
0.4399634, -0.6087096, 1.743595, 0, 0.2039216, 1, 1,
0.4411881, 0.423019, 1.969874, 0, 0.1960784, 1, 1,
0.4435259, 0.01238888, 2.194261, 0, 0.1882353, 1, 1,
0.4442993, 1.282554, 1.445791, 0, 0.1843137, 1, 1,
0.4459325, -0.992729, 2.078249, 0, 0.1764706, 1, 1,
0.4470524, 2.235943, 0.08891698, 0, 0.172549, 1, 1,
0.4499844, -0.9814696, 2.735307, 0, 0.1647059, 1, 1,
0.4520482, 1.920316, 0.4797353, 0, 0.1607843, 1, 1,
0.4577857, -0.9276478, 0.6182363, 0, 0.1529412, 1, 1,
0.467538, 1.200442, 1.471107, 0, 0.1490196, 1, 1,
0.4679701, -0.3270115, 2.409221, 0, 0.1411765, 1, 1,
0.4694595, 1.310824, -0.8660786, 0, 0.1372549, 1, 1,
0.4699371, -0.5520397, 3.352102, 0, 0.1294118, 1, 1,
0.4777948, -0.8179827, 4.195693, 0, 0.1254902, 1, 1,
0.483235, 0.1990588, 0.3684929, 0, 0.1176471, 1, 1,
0.4864772, -1.144185, 2.374406, 0, 0.1137255, 1, 1,
0.4879074, -0.363143, 2.901084, 0, 0.1058824, 1, 1,
0.4890491, 0.04148947, 0.3321348, 0, 0.09803922, 1, 1,
0.4923225, 1.452514, 1.222771, 0, 0.09411765, 1, 1,
0.4953143, 1.824873, 0.8605412, 0, 0.08627451, 1, 1,
0.5067588, -0.8206556, 2.316795, 0, 0.08235294, 1, 1,
0.5091604, -1.529971, 2.437239, 0, 0.07450981, 1, 1,
0.5124396, 0.5507466, 0.5525748, 0, 0.07058824, 1, 1,
0.5127181, 0.3563247, 1.506078, 0, 0.0627451, 1, 1,
0.5128816, 0.9444456, 2.256239, 0, 0.05882353, 1, 1,
0.5140753, -0.534934, 1.108503, 0, 0.05098039, 1, 1,
0.5191865, -0.6981282, 3.418081, 0, 0.04705882, 1, 1,
0.5230494, 0.8658983, 2.210802, 0, 0.03921569, 1, 1,
0.5235204, 1.083203, -0.6407815, 0, 0.03529412, 1, 1,
0.524991, -1.039975, 1.177933, 0, 0.02745098, 1, 1,
0.5258807, -0.9317114, 3.341575, 0, 0.02352941, 1, 1,
0.5277668, 0.4927715, -0.1345462, 0, 0.01568628, 1, 1,
0.5298242, -0.2710172, 1.584157, 0, 0.01176471, 1, 1,
0.531059, 0.4278152, 0.7096539, 0, 0.003921569, 1, 1,
0.5328904, -0.5881137, 2.158158, 0.003921569, 0, 1, 1,
0.5379922, 0.05895335, 1.784599, 0.007843138, 0, 1, 1,
0.539349, 2.304755, 2.392744, 0.01568628, 0, 1, 1,
0.544737, -0.06506875, 2.076323, 0.01960784, 0, 1, 1,
0.5457898, -0.1656253, 0.7839733, 0.02745098, 0, 1, 1,
0.5469366, 0.6892333, -0.3274555, 0.03137255, 0, 1, 1,
0.5549654, -1.05448, 1.71619, 0.03921569, 0, 1, 1,
0.5560759, 0.1213825, 2.942861, 0.04313726, 0, 1, 1,
0.5599867, -0.4339501, 1.346384, 0.05098039, 0, 1, 1,
0.5628883, 0.1551751, 0.870875, 0.05490196, 0, 1, 1,
0.5648426, -1.581044, 2.856806, 0.0627451, 0, 1, 1,
0.5659755, -0.4946583, 3.815035, 0.06666667, 0, 1, 1,
0.5709285, -0.09503679, 2.264019, 0.07450981, 0, 1, 1,
0.5835144, 0.7783092, 2.786198, 0.07843138, 0, 1, 1,
0.5837599, 0.8544014, 1.799787, 0.08627451, 0, 1, 1,
0.5843715, 0.08733723, 0.06115572, 0.09019608, 0, 1, 1,
0.585206, 1.652336, -0.1001218, 0.09803922, 0, 1, 1,
0.5911358, 1.143154, -0.3490711, 0.1058824, 0, 1, 1,
0.5934507, 2.02038, 1.570312, 0.1098039, 0, 1, 1,
0.5959051, -0.2230547, 1.019734, 0.1176471, 0, 1, 1,
0.5993847, -0.4901826, 3.73991, 0.1215686, 0, 1, 1,
0.6004061, 0.6550514, 0.6907545, 0.1294118, 0, 1, 1,
0.6007752, 0.7431858, 1.309194, 0.1333333, 0, 1, 1,
0.60517, 0.3038553, 0.7798783, 0.1411765, 0, 1, 1,
0.6057287, -0.2765141, 0.8059828, 0.145098, 0, 1, 1,
0.6071736, -0.2308872, 2.980433, 0.1529412, 0, 1, 1,
0.6081128, -2.243882, 2.004054, 0.1568628, 0, 1, 1,
0.6084232, 1.700466, 0.4878043, 0.1647059, 0, 1, 1,
0.6085647, 0.2690333, 2.633809, 0.1686275, 0, 1, 1,
0.6100354, -0.0516942, 1.454689, 0.1764706, 0, 1, 1,
0.610928, 0.1412292, 0.580442, 0.1803922, 0, 1, 1,
0.6174063, -0.1712315, 2.090368, 0.1882353, 0, 1, 1,
0.619179, 0.5891237, 1.479607, 0.1921569, 0, 1, 1,
0.6207569, -0.9213258, 1.497335, 0.2, 0, 1, 1,
0.6212298, 1.630623, 1.398478, 0.2078431, 0, 1, 1,
0.6234207, -0.4892433, 2.894708, 0.2117647, 0, 1, 1,
0.6242811, -0.4404525, 4.388727, 0.2196078, 0, 1, 1,
0.6283746, -0.3827693, 4.560408, 0.2235294, 0, 1, 1,
0.6300929, 2.004671, -0.700068, 0.2313726, 0, 1, 1,
0.640654, 0.247039, 1.189639, 0.2352941, 0, 1, 1,
0.6429961, -0.2812884, 1.573281, 0.2431373, 0, 1, 1,
0.6438355, -0.8326406, 2.140153, 0.2470588, 0, 1, 1,
0.6439409, 0.4269677, 2.027384, 0.254902, 0, 1, 1,
0.6468531, 0.6003985, 0.5639591, 0.2588235, 0, 1, 1,
0.6534314, -1.583083, 4.160602, 0.2666667, 0, 1, 1,
0.6540356, 0.05023133, 3.266628, 0.2705882, 0, 1, 1,
0.6552135, -0.3436769, 3.232601, 0.2784314, 0, 1, 1,
0.6557457, -0.4003853, 2.53085, 0.282353, 0, 1, 1,
0.6596161, -0.7439998, 3.278135, 0.2901961, 0, 1, 1,
0.6599785, -1.13795, 2.052503, 0.2941177, 0, 1, 1,
0.6615544, 0.2168019, 1.912012, 0.3019608, 0, 1, 1,
0.6631706, 2.728124, 0.3578314, 0.3098039, 0, 1, 1,
0.6648976, -0.1650201, 1.296151, 0.3137255, 0, 1, 1,
0.6674447, 1.118178, -0.008434495, 0.3215686, 0, 1, 1,
0.6678783, -0.3715286, 2.337853, 0.3254902, 0, 1, 1,
0.6711863, -0.8730713, 2.635034, 0.3333333, 0, 1, 1,
0.67335, -1.276036, -0.1825844, 0.3372549, 0, 1, 1,
0.6766112, 1.335472, 0.005562638, 0.345098, 0, 1, 1,
0.682308, -0.7062966, 2.79919, 0.3490196, 0, 1, 1,
0.6869168, 2.785839, 0.9563462, 0.3568628, 0, 1, 1,
0.6870412, 0.5767376, 0.77168, 0.3607843, 0, 1, 1,
0.68756, -1.059798, 3.94355, 0.3686275, 0, 1, 1,
0.6907672, 1.34803, 0.7159857, 0.372549, 0, 1, 1,
0.6919467, -0.7769888, 2.503227, 0.3803922, 0, 1, 1,
0.6924846, 0.2457205, -0.1393866, 0.3843137, 0, 1, 1,
0.6939409, -2.249466, 2.668592, 0.3921569, 0, 1, 1,
0.6943341, 0.006819545, 2.88377, 0.3960784, 0, 1, 1,
0.6991138, -1.105511, 1.587807, 0.4039216, 0, 1, 1,
0.7010394, -0.2032646, 3.171966, 0.4117647, 0, 1, 1,
0.7057137, -0.575469, 0.8181624, 0.4156863, 0, 1, 1,
0.7093532, -0.4802918, 1.008421, 0.4235294, 0, 1, 1,
0.712945, 0.1069215, 0.4425997, 0.427451, 0, 1, 1,
0.7208294, -0.828543, 4.551639, 0.4352941, 0, 1, 1,
0.7268468, -0.4142339, 2.321856, 0.4392157, 0, 1, 1,
0.7300553, 1.110359, 1.088257, 0.4470588, 0, 1, 1,
0.7357598, -0.3122691, 0.3216172, 0.4509804, 0, 1, 1,
0.7439115, 0.1822765, 2.560159, 0.4588235, 0, 1, 1,
0.7441675, 0.4044699, 0.6780822, 0.4627451, 0, 1, 1,
0.7466229, -0.4620108, 1.073677, 0.4705882, 0, 1, 1,
0.7544926, -0.1477919, 3.046587, 0.4745098, 0, 1, 1,
0.7547089, 2.0456, -0.9454473, 0.4823529, 0, 1, 1,
0.7764696, 0.3735152, 0.8797687, 0.4862745, 0, 1, 1,
0.7771708, -0.0580991, 2.271699, 0.4941176, 0, 1, 1,
0.7786828, 0.8033253, 0.9177759, 0.5019608, 0, 1, 1,
0.7791785, 0.3087686, 2.158245, 0.5058824, 0, 1, 1,
0.779766, -1.254234, 1.92591, 0.5137255, 0, 1, 1,
0.7819112, 1.623435, 0.6400437, 0.5176471, 0, 1, 1,
0.7854108, 1.323645, -0.4177577, 0.5254902, 0, 1, 1,
0.7874261, 1.450078, 0.5230949, 0.5294118, 0, 1, 1,
0.7891249, -1.1714, 1.589599, 0.5372549, 0, 1, 1,
0.7892321, 1.549648, 0.7089992, 0.5411765, 0, 1, 1,
0.7909316, -0.1949221, 2.408726, 0.5490196, 0, 1, 1,
0.7922152, 1.540457, 0.5702333, 0.5529412, 0, 1, 1,
0.7929069, -1.060062, 3.309204, 0.5607843, 0, 1, 1,
0.7934427, 0.3730431, 2.385244, 0.5647059, 0, 1, 1,
0.7973188, 0.6477003, 1.758173, 0.572549, 0, 1, 1,
0.802857, 0.6075667, 1.638195, 0.5764706, 0, 1, 1,
0.8128822, 0.7094601, 1.504264, 0.5843138, 0, 1, 1,
0.8187982, 2.534729, 0.5991188, 0.5882353, 0, 1, 1,
0.8199149, 0.3426356, 1.254144, 0.5960785, 0, 1, 1,
0.8221281, -1.886042, 0.8678983, 0.6039216, 0, 1, 1,
0.822241, 0.0294306, 1.235671, 0.6078432, 0, 1, 1,
0.8242331, -0.4399182, 2.293491, 0.6156863, 0, 1, 1,
0.8257006, 0.5934042, 0.8371232, 0.6196079, 0, 1, 1,
0.8275698, 0.6937645, 0.808448, 0.627451, 0, 1, 1,
0.8288991, -1.604048, 1.97005, 0.6313726, 0, 1, 1,
0.8303877, 0.1758864, 1.065579, 0.6392157, 0, 1, 1,
0.8352562, 1.984563, 0.4674066, 0.6431373, 0, 1, 1,
0.8355862, 0.1140157, 2.340745, 0.6509804, 0, 1, 1,
0.8370941, 1.829622, -0.2057111, 0.654902, 0, 1, 1,
0.8420605, -0.7833482, 3.331323, 0.6627451, 0, 1, 1,
0.8436525, 0.5318586, 2.551366, 0.6666667, 0, 1, 1,
0.8443284, -0.1674919, 1.208885, 0.6745098, 0, 1, 1,
0.8478922, -0.3614917, 0.8631877, 0.6784314, 0, 1, 1,
0.8482359, -1.688393, 3.20796, 0.6862745, 0, 1, 1,
0.8513264, 1.279538, 1.188373, 0.6901961, 0, 1, 1,
0.8514178, 0.5727834, 0.7244143, 0.6980392, 0, 1, 1,
0.8553685, 1.475016, -0.3615877, 0.7058824, 0, 1, 1,
0.8629472, 0.4093713, 1.681757, 0.7098039, 0, 1, 1,
0.8635162, 1.139776, 0.4316892, 0.7176471, 0, 1, 1,
0.863596, 1.88974, 1.08402, 0.7215686, 0, 1, 1,
0.8637637, 0.24687, 1.760187, 0.7294118, 0, 1, 1,
0.8644861, -1.602294, 3.212411, 0.7333333, 0, 1, 1,
0.865622, -0.251002, 1.995554, 0.7411765, 0, 1, 1,
0.8725608, -0.4676564, 2.925629, 0.7450981, 0, 1, 1,
0.877138, -0.71508, 2.945012, 0.7529412, 0, 1, 1,
0.8776075, 0.11619, 1.703154, 0.7568628, 0, 1, 1,
0.8790516, -1.121762, 1.600701, 0.7647059, 0, 1, 1,
0.8793128, 0.1091996, 3.671304, 0.7686275, 0, 1, 1,
0.8813889, 1.253285, 0.4186473, 0.7764706, 0, 1, 1,
0.887657, -1.834254, 1.717755, 0.7803922, 0, 1, 1,
0.8877833, -0.1985559, 1.133803, 0.7882353, 0, 1, 1,
0.8921723, -0.3072602, 0.9331369, 0.7921569, 0, 1, 1,
0.8981956, -0.21286, 2.073935, 0.8, 0, 1, 1,
0.9133994, -0.6930931, 3.692541, 0.8078431, 0, 1, 1,
0.9134704, -0.2324111, 1.915292, 0.8117647, 0, 1, 1,
0.9201712, -1.922289, 3.49629, 0.8196079, 0, 1, 1,
0.9211164, 0.1770354, 1.399309, 0.8235294, 0, 1, 1,
0.9265031, -0.7861522, 2.082465, 0.8313726, 0, 1, 1,
0.9324575, 0.2859467, 1.373077, 0.8352941, 0, 1, 1,
0.9330451, 0.6694748, 0.1174043, 0.8431373, 0, 1, 1,
0.9363598, 1.309979, -0.1778345, 0.8470588, 0, 1, 1,
0.9388547, 0.1085794, 2.616842, 0.854902, 0, 1, 1,
0.939455, -0.148783, 1.470972, 0.8588235, 0, 1, 1,
0.9398955, 0.9320907, 0.8754395, 0.8666667, 0, 1, 1,
0.9407293, -1.222671, 3.149871, 0.8705882, 0, 1, 1,
0.9408454, 0.4669424, -0.1185352, 0.8784314, 0, 1, 1,
0.9465266, 1.717418, -0.868611, 0.8823529, 0, 1, 1,
0.9493974, -0.4921959, 1.702932, 0.8901961, 0, 1, 1,
0.9597766, 0.09637518, 0.1927683, 0.8941177, 0, 1, 1,
0.9669273, 0.4334978, 1.66227, 0.9019608, 0, 1, 1,
0.9683381, 2.019022, 0.6947899, 0.9098039, 0, 1, 1,
0.9822273, 0.1259576, 0.9180679, 0.9137255, 0, 1, 1,
0.9838426, -1.435106, 3.23788, 0.9215686, 0, 1, 1,
0.9905684, -0.9555436, 2.80287, 0.9254902, 0, 1, 1,
0.9954493, -0.8605586, -0.4524578, 0.9333333, 0, 1, 1,
0.9963255, -0.4385986, 2.23126, 0.9372549, 0, 1, 1,
0.99903, 0.9508761, 2.287555, 0.945098, 0, 1, 1,
0.9990335, 0.1553259, 3.271135, 0.9490196, 0, 1, 1,
1.000342, 1.568686, 1.66072, 0.9568627, 0, 1, 1,
1.006451, 0.7680022, -0.04387487, 0.9607843, 0, 1, 1,
1.01945, -0.6864403, 2.366213, 0.9686275, 0, 1, 1,
1.019988, 1.074471, -0.2176663, 0.972549, 0, 1, 1,
1.02027, -0.7468495, 1.964175, 0.9803922, 0, 1, 1,
1.024076, -0.4427171, 2.869099, 0.9843137, 0, 1, 1,
1.024439, -1.319579, 2.356511, 0.9921569, 0, 1, 1,
1.025202, 0.4914596, 0.9326753, 0.9960784, 0, 1, 1,
1.025812, 1.678984, 0.2009404, 1, 0, 0.9960784, 1,
1.027419, 0.852022, 1.810839, 1, 0, 0.9882353, 1,
1.030586, 1.895091, -1.260983, 1, 0, 0.9843137, 1,
1.039734, 1.004587, 1.13725, 1, 0, 0.9764706, 1,
1.040207, -0.2451685, 1.927848, 1, 0, 0.972549, 1,
1.044177, -0.8645991, 2.110065, 1, 0, 0.9647059, 1,
1.049209, 0.143661, 1.761169, 1, 0, 0.9607843, 1,
1.050103, 1.178128, 1.33231, 1, 0, 0.9529412, 1,
1.052919, -0.4158089, 2.082132, 1, 0, 0.9490196, 1,
1.053921, -0.5673897, 3.086613, 1, 0, 0.9411765, 1,
1.05459, -2.055525, 2.626559, 1, 0, 0.9372549, 1,
1.055401, 0.3094995, 0.6250781, 1, 0, 0.9294118, 1,
1.056716, -0.8638831, 3.258196, 1, 0, 0.9254902, 1,
1.057169, 0.6740257, 0.7191957, 1, 0, 0.9176471, 1,
1.065284, -2.88979, 4.125556, 1, 0, 0.9137255, 1,
1.065776, -1.365786, 2.917071, 1, 0, 0.9058824, 1,
1.067295, -0.7997808, 2.127001, 1, 0, 0.9019608, 1,
1.068177, -0.508607, 1.707179, 1, 0, 0.8941177, 1,
1.073882, 0.1000388, 2.366822, 1, 0, 0.8862745, 1,
1.07492, -1.124084, 1.639589, 1, 0, 0.8823529, 1,
1.079793, -1.535773, 0.3590426, 1, 0, 0.8745098, 1,
1.080155, 1.872121, -1.306678, 1, 0, 0.8705882, 1,
1.085693, -0.4489092, 2.701393, 1, 0, 0.8627451, 1,
1.093656, 1.34093, 0.995796, 1, 0, 0.8588235, 1,
1.09665, -1.119843, 2.129928, 1, 0, 0.8509804, 1,
1.096791, -0.2074605, 1.515633, 1, 0, 0.8470588, 1,
1.10064, -1.394697, 2.303397, 1, 0, 0.8392157, 1,
1.103342, -1.180339, 0.8302361, 1, 0, 0.8352941, 1,
1.105431, -1.365204, 2.159494, 1, 0, 0.827451, 1,
1.106267, -1.571982, 2.071215, 1, 0, 0.8235294, 1,
1.107598, 1.658429, -0.9697542, 1, 0, 0.8156863, 1,
1.117382, 0.9972128, -0.04090876, 1, 0, 0.8117647, 1,
1.122321, -0.1009171, 2.741951, 1, 0, 0.8039216, 1,
1.124492, 0.1819302, 1.641364, 1, 0, 0.7960784, 1,
1.129784, -0.3734234, 2.192554, 1, 0, 0.7921569, 1,
1.130782, 0.7126682, 1.376913, 1, 0, 0.7843137, 1,
1.134756, -1.644053, 2.092025, 1, 0, 0.7803922, 1,
1.13772, 1.452568, 1.610312, 1, 0, 0.772549, 1,
1.144378, 1.725412, 1.268762, 1, 0, 0.7686275, 1,
1.145534, -2.826857, 2.461979, 1, 0, 0.7607843, 1,
1.151842, -0.3759555, 1.871307, 1, 0, 0.7568628, 1,
1.152048, -0.9734243, 2.324864, 1, 0, 0.7490196, 1,
1.158762, -0.5582826, 3.701398, 1, 0, 0.7450981, 1,
1.162014, -0.04323544, 1.138458, 1, 0, 0.7372549, 1,
1.175839, 0.9320734, 0.7075686, 1, 0, 0.7333333, 1,
1.176861, 1.182185, -0.7648402, 1, 0, 0.7254902, 1,
1.179413, -0.2833392, 0.5318367, 1, 0, 0.7215686, 1,
1.180347, 0.47656, 0.7703437, 1, 0, 0.7137255, 1,
1.183286, 0.8263275, 0.6646365, 1, 0, 0.7098039, 1,
1.183355, 1.62001, -0.9208545, 1, 0, 0.7019608, 1,
1.183603, 0.2978692, 1.939121, 1, 0, 0.6941177, 1,
1.183825, -2.01646, 1.102103, 1, 0, 0.6901961, 1,
1.188158, 1.525752, 1.712529, 1, 0, 0.682353, 1,
1.201349, 1.308896, 0.100282, 1, 0, 0.6784314, 1,
1.211959, 2.165498, 0.8750753, 1, 0, 0.6705883, 1,
1.22184, 0.2262171, 1.645164, 1, 0, 0.6666667, 1,
1.225134, -1.053253, 1.624612, 1, 0, 0.6588235, 1,
1.228437, -1.951217, 3.72197, 1, 0, 0.654902, 1,
1.236219, -0.8292764, 1.597766, 1, 0, 0.6470588, 1,
1.241317, 0.786529, 0.3688433, 1, 0, 0.6431373, 1,
1.247797, 0.1034767, -0.9251724, 1, 0, 0.6352941, 1,
1.250695, -0.5861281, 1.563597, 1, 0, 0.6313726, 1,
1.254967, 0.5720802, 1.053707, 1, 0, 0.6235294, 1,
1.260081, -0.1951895, 3.086421, 1, 0, 0.6196079, 1,
1.266833, 0.06631315, 3.687259, 1, 0, 0.6117647, 1,
1.274006, 1.441721, 1.822049, 1, 0, 0.6078432, 1,
1.27762, 0.01299695, 0.180552, 1, 0, 0.6, 1,
1.278634, -0.2168656, 2.274024, 1, 0, 0.5921569, 1,
1.279341, 0.4070491, 1.175918, 1, 0, 0.5882353, 1,
1.280363, 0.06246635, 1.361992, 1, 0, 0.5803922, 1,
1.287817, -1.675888, 2.63547, 1, 0, 0.5764706, 1,
1.290789, -0.5674176, 1.921095, 1, 0, 0.5686275, 1,
1.293335, 1.092691, 1.333767, 1, 0, 0.5647059, 1,
1.300044, 1.230796, -1.571521, 1, 0, 0.5568628, 1,
1.30008, -0.6980106, 2.936899, 1, 0, 0.5529412, 1,
1.314309, 0.08281898, 2.663853, 1, 0, 0.5450981, 1,
1.318155, 0.001375302, 1.029438, 1, 0, 0.5411765, 1,
1.318706, -2.077586, 2.466671, 1, 0, 0.5333334, 1,
1.321323, 0.6168344, 0.7896952, 1, 0, 0.5294118, 1,
1.331508, 0.3302454, 0.4536089, 1, 0, 0.5215687, 1,
1.347071, -0.9213933, 5.039127, 1, 0, 0.5176471, 1,
1.351037, -0.3933642, 1.656711, 1, 0, 0.509804, 1,
1.352484, -0.8282775, 1.269472, 1, 0, 0.5058824, 1,
1.362253, -1.08594, 2.512067, 1, 0, 0.4980392, 1,
1.364548, 0.001917789, 3.097624, 1, 0, 0.4901961, 1,
1.37285, -1.180996, 1.893122, 1, 0, 0.4862745, 1,
1.373484, 0.577525, 1.485649, 1, 0, 0.4784314, 1,
1.374819, 0.6244715, 0.6999922, 1, 0, 0.4745098, 1,
1.376983, -1.339039, 3.686311, 1, 0, 0.4666667, 1,
1.385805, 0.704006, 0.09681769, 1, 0, 0.4627451, 1,
1.393392, -1.647018, 0.6784804, 1, 0, 0.454902, 1,
1.398021, 1.373529, 0.9610233, 1, 0, 0.4509804, 1,
1.400596, 0.4510815, 0.6850221, 1, 0, 0.4431373, 1,
1.409377, -0.8385772, 1.696887, 1, 0, 0.4392157, 1,
1.421392, -0.3610543, 0.4714153, 1, 0, 0.4313726, 1,
1.427307, 0.4832851, 0.07985824, 1, 0, 0.427451, 1,
1.441897, -0.2806372, 0.09286807, 1, 0, 0.4196078, 1,
1.459727, -0.3615936, 0.6921794, 1, 0, 0.4156863, 1,
1.482586, 0.6196781, 0.5304503, 1, 0, 0.4078431, 1,
1.499646, -1.685193, 2.537546, 1, 0, 0.4039216, 1,
1.501757, -0.9405236, 2.55385, 1, 0, 0.3960784, 1,
1.51028, 1.171054, 1.975569, 1, 0, 0.3882353, 1,
1.513665, -0.2489544, 1.909679, 1, 0, 0.3843137, 1,
1.526332, -1.266254, 3.4795, 1, 0, 0.3764706, 1,
1.548087, 1.889541, -0.001822149, 1, 0, 0.372549, 1,
1.560709, -1.798069, 2.676744, 1, 0, 0.3647059, 1,
1.56294, -0.03834064, 2.069772, 1, 0, 0.3607843, 1,
1.564064, -1.298913, 4.041816, 1, 0, 0.3529412, 1,
1.578689, 0.5363234, 1.00406, 1, 0, 0.3490196, 1,
1.594491, 1.058472, 2.337707, 1, 0, 0.3411765, 1,
1.614347, -0.618151, 3.314788, 1, 0, 0.3372549, 1,
1.615802, 1.426285, 2.167254, 1, 0, 0.3294118, 1,
1.617436, 1.662483, 0.6465027, 1, 0, 0.3254902, 1,
1.617864, -0.2109422, 4.230097, 1, 0, 0.3176471, 1,
1.623522, 0.7028819, 0.3784463, 1, 0, 0.3137255, 1,
1.635043, -0.1197378, 1.709675, 1, 0, 0.3058824, 1,
1.63649, 1.131104, 1.278162, 1, 0, 0.2980392, 1,
1.643556, -0.0276312, 2.030112, 1, 0, 0.2941177, 1,
1.649256, 0.7293543, -0.1905527, 1, 0, 0.2862745, 1,
1.653154, 0.1215399, 2.542505, 1, 0, 0.282353, 1,
1.658556, -0.7056745, 1.189267, 1, 0, 0.2745098, 1,
1.662262, -1.202413, 0.9383634, 1, 0, 0.2705882, 1,
1.667273, -1.930972, 3.828254, 1, 0, 0.2627451, 1,
1.667383, 0.7065529, 0.4438189, 1, 0, 0.2588235, 1,
1.66739, 0.9427206, 0.6603459, 1, 0, 0.2509804, 1,
1.669219, 0.2952292, -0.5807856, 1, 0, 0.2470588, 1,
1.682437, 0.5720461, 0.5922878, 1, 0, 0.2392157, 1,
1.722006, 0.08385546, 0.7427157, 1, 0, 0.2352941, 1,
1.733714, 0.4588905, 2.089037, 1, 0, 0.227451, 1,
1.762889, -1.443688, 2.362812, 1, 0, 0.2235294, 1,
1.775373, -0.05117428, 2.409709, 1, 0, 0.2156863, 1,
1.796745, 0.003677113, 1.122691, 1, 0, 0.2117647, 1,
1.797558, 0.2446305, 0.4359894, 1, 0, 0.2039216, 1,
1.808663, 1.250989, 0.9344814, 1, 0, 0.1960784, 1,
1.838134, -0.5056688, 1.88339, 1, 0, 0.1921569, 1,
1.863572, -1.414359, 2.138055, 1, 0, 0.1843137, 1,
1.885006, 0.6926588, 1.931931, 1, 0, 0.1803922, 1,
1.908793, -2.19956, 4.320596, 1, 0, 0.172549, 1,
1.997901, -0.4678496, 1.566972, 1, 0, 0.1686275, 1,
2.003941, 0.2307149, 1.128205, 1, 0, 0.1607843, 1,
2.005534, -0.77458, 1.398911, 1, 0, 0.1568628, 1,
2.015879, 1.12505, 0.03216498, 1, 0, 0.1490196, 1,
2.028327, 0.3558427, 3.218869, 1, 0, 0.145098, 1,
2.049348, 0.2405772, 1.977869, 1, 0, 0.1372549, 1,
2.115727, 0.2409717, 1.218074, 1, 0, 0.1333333, 1,
2.124313, 0.3633008, 1.248987, 1, 0, 0.1254902, 1,
2.132749, 0.3383794, -0.1354556, 1, 0, 0.1215686, 1,
2.148574, -0.3556129, 1.480395, 1, 0, 0.1137255, 1,
2.174529, 0.6972952, 1.002658, 1, 0, 0.1098039, 1,
2.187572, 0.5974911, 2.682924, 1, 0, 0.1019608, 1,
2.256746, 1.48544, 2.352449, 1, 0, 0.09411765, 1,
2.259613, -0.02568898, 0.9238893, 1, 0, 0.09019608, 1,
2.276549, 1.57488, 1.995613, 1, 0, 0.08235294, 1,
2.28415, -0.499266, 0.4478115, 1, 0, 0.07843138, 1,
2.33494, -0.589173, 3.455296, 1, 0, 0.07058824, 1,
2.339715, -0.1623275, 1.921478, 1, 0, 0.06666667, 1,
2.365244, 0.8641691, 1.061018, 1, 0, 0.05882353, 1,
2.416242, 1.176498, 1.309531, 1, 0, 0.05490196, 1,
2.421414, 0.2808473, 1.193745, 1, 0, 0.04705882, 1,
2.438804, -0.05565944, 3.458297, 1, 0, 0.04313726, 1,
2.463677, 0.2273927, 0.287262, 1, 0, 0.03529412, 1,
2.494787, 0.1813706, 0.339683, 1, 0, 0.03137255, 1,
2.60233, 1.343539, 0.2862003, 1, 0, 0.02352941, 1,
2.898075, -1.118046, 0.799701, 1, 0, 0.01960784, 1,
3.133325, 0.9674725, -1.096546, 1, 0, 0.01176471, 1,
4.23871, 1.231989, -0.5958162, 1, 0, 0.007843138, 1
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
0.6438266, -4.101989, -7.613553, 0, -0.5, 0.5, 0.5,
0.6438266, -4.101989, -7.613553, 1, -0.5, 0.5, 0.5,
0.6438266, -4.101989, -7.613553, 1, 1.5, 0.5, 0.5,
0.6438266, -4.101989, -7.613553, 0, 1.5, 0.5, 0.5
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
-4.169723, -0.1007112, -7.613553, 0, -0.5, 0.5, 0.5,
-4.169723, -0.1007112, -7.613553, 1, -0.5, 0.5, 0.5,
-4.169723, -0.1007112, -7.613553, 1, 1.5, 0.5, 0.5,
-4.169723, -0.1007112, -7.613553, 0, 1.5, 0.5, 0.5
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
-4.169723, -4.101989, -0.1564174, 0, -0.5, 0.5, 0.5,
-4.169723, -4.101989, -0.1564174, 1, -0.5, 0.5, 0.5,
-4.169723, -4.101989, -0.1564174, 1, 1.5, 0.5, 0.5,
-4.169723, -4.101989, -0.1564174, 0, 1.5, 0.5, 0.5
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
-2, -3.178617, -5.892676,
4, -3.178617, -5.892676,
-2, -3.178617, -5.892676,
-2, -3.332512, -6.179489,
0, -3.178617, -5.892676,
0, -3.332512, -6.179489,
2, -3.178617, -5.892676,
2, -3.332512, -6.179489,
4, -3.178617, -5.892676,
4, -3.332512, -6.179489
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
"0",
"2",
"4"
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
-2, -3.640303, -6.753115, 0, -0.5, 0.5, 0.5,
-2, -3.640303, -6.753115, 1, -0.5, 0.5, 0.5,
-2, -3.640303, -6.753115, 1, 1.5, 0.5, 0.5,
-2, -3.640303, -6.753115, 0, 1.5, 0.5, 0.5,
0, -3.640303, -6.753115, 0, -0.5, 0.5, 0.5,
0, -3.640303, -6.753115, 1, -0.5, 0.5, 0.5,
0, -3.640303, -6.753115, 1, 1.5, 0.5, 0.5,
0, -3.640303, -6.753115, 0, 1.5, 0.5, 0.5,
2, -3.640303, -6.753115, 0, -0.5, 0.5, 0.5,
2, -3.640303, -6.753115, 1, -0.5, 0.5, 0.5,
2, -3.640303, -6.753115, 1, 1.5, 0.5, 0.5,
2, -3.640303, -6.753115, 0, 1.5, 0.5, 0.5,
4, -3.640303, -6.753115, 0, -0.5, 0.5, 0.5,
4, -3.640303, -6.753115, 1, -0.5, 0.5, 0.5,
4, -3.640303, -6.753115, 1, 1.5, 0.5, 0.5,
4, -3.640303, -6.753115, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<4; i++) 
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
12, 13, 14, 12, 14, 15
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
-3.058904, -3, -5.892676,
-3.058904, 2, -5.892676,
-3.058904, -3, -5.892676,
-3.24404, -3, -6.179489,
-3.058904, -2, -5.892676,
-3.24404, -2, -6.179489,
-3.058904, -1, -5.892676,
-3.24404, -1, -6.179489,
-3.058904, 0, -5.892676,
-3.24404, 0, -6.179489,
-3.058904, 1, -5.892676,
-3.24404, 1, -6.179489,
-3.058904, 2, -5.892676,
-3.24404, 2, -6.179489
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
"2"
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
-3.614313, -3, -6.753115, 0, -0.5, 0.5, 0.5,
-3.614313, -3, -6.753115, 1, -0.5, 0.5, 0.5,
-3.614313, -3, -6.753115, 1, 1.5, 0.5, 0.5,
-3.614313, -3, -6.753115, 0, 1.5, 0.5, 0.5,
-3.614313, -2, -6.753115, 0, -0.5, 0.5, 0.5,
-3.614313, -2, -6.753115, 1, -0.5, 0.5, 0.5,
-3.614313, -2, -6.753115, 1, 1.5, 0.5, 0.5,
-3.614313, -2, -6.753115, 0, 1.5, 0.5, 0.5,
-3.614313, -1, -6.753115, 0, -0.5, 0.5, 0.5,
-3.614313, -1, -6.753115, 1, -0.5, 0.5, 0.5,
-3.614313, -1, -6.753115, 1, 1.5, 0.5, 0.5,
-3.614313, -1, -6.753115, 0, 1.5, 0.5, 0.5,
-3.614313, 0, -6.753115, 0, -0.5, 0.5, 0.5,
-3.614313, 0, -6.753115, 1, -0.5, 0.5, 0.5,
-3.614313, 0, -6.753115, 1, 1.5, 0.5, 0.5,
-3.614313, 0, -6.753115, 0, 1.5, 0.5, 0.5,
-3.614313, 1, -6.753115, 0, -0.5, 0.5, 0.5,
-3.614313, 1, -6.753115, 1, -0.5, 0.5, 0.5,
-3.614313, 1, -6.753115, 1, 1.5, 0.5, 0.5,
-3.614313, 1, -6.753115, 0, 1.5, 0.5, 0.5,
-3.614313, 2, -6.753115, 0, -0.5, 0.5, 0.5,
-3.614313, 2, -6.753115, 1, -0.5, 0.5, 0.5,
-3.614313, 2, -6.753115, 1, 1.5, 0.5, 0.5,
-3.614313, 2, -6.753115, 0, 1.5, 0.5, 0.5
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
-3.058904, -3.178617, -4,
-3.058904, -3.178617, 4,
-3.058904, -3.178617, -4,
-3.24404, -3.332512, -4,
-3.058904, -3.178617, -2,
-3.24404, -3.332512, -2,
-3.058904, -3.178617, 0,
-3.24404, -3.332512, 0,
-3.058904, -3.178617, 2,
-3.24404, -3.332512, 2,
-3.058904, -3.178617, 4,
-3.24404, -3.332512, 4
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
-3.614313, -3.640303, -4, 0, -0.5, 0.5, 0.5,
-3.614313, -3.640303, -4, 1, -0.5, 0.5, 0.5,
-3.614313, -3.640303, -4, 1, 1.5, 0.5, 0.5,
-3.614313, -3.640303, -4, 0, 1.5, 0.5, 0.5,
-3.614313, -3.640303, -2, 0, -0.5, 0.5, 0.5,
-3.614313, -3.640303, -2, 1, -0.5, 0.5, 0.5,
-3.614313, -3.640303, -2, 1, 1.5, 0.5, 0.5,
-3.614313, -3.640303, -2, 0, 1.5, 0.5, 0.5,
-3.614313, -3.640303, 0, 0, -0.5, 0.5, 0.5,
-3.614313, -3.640303, 0, 1, -0.5, 0.5, 0.5,
-3.614313, -3.640303, 0, 1, 1.5, 0.5, 0.5,
-3.614313, -3.640303, 0, 0, 1.5, 0.5, 0.5,
-3.614313, -3.640303, 2, 0, -0.5, 0.5, 0.5,
-3.614313, -3.640303, 2, 1, -0.5, 0.5, 0.5,
-3.614313, -3.640303, 2, 1, 1.5, 0.5, 0.5,
-3.614313, -3.640303, 2, 0, 1.5, 0.5, 0.5,
-3.614313, -3.640303, 4, 0, -0.5, 0.5, 0.5,
-3.614313, -3.640303, 4, 1, -0.5, 0.5, 0.5,
-3.614313, -3.640303, 4, 1, 1.5, 0.5, 0.5,
-3.614313, -3.640303, 4, 0, 1.5, 0.5, 0.5
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
-3.058904, -3.178617, -5.892676,
-3.058904, 2.977195, -5.892676,
-3.058904, -3.178617, 5.579841,
-3.058904, 2.977195, 5.579841,
-3.058904, -3.178617, -5.892676,
-3.058904, -3.178617, 5.579841,
-3.058904, 2.977195, -5.892676,
-3.058904, 2.977195, 5.579841,
-3.058904, -3.178617, -5.892676,
4.346557, -3.178617, -5.892676,
-3.058904, -3.178617, 5.579841,
4.346557, -3.178617, 5.579841,
-3.058904, 2.977195, -5.892676,
4.346557, 2.977195, -5.892676,
-3.058904, 2.977195, 5.579841,
4.346557, 2.977195, 5.579841,
4.346557, -3.178617, -5.892676,
4.346557, 2.977195, -5.892676,
4.346557, -3.178617, 5.579841,
4.346557, 2.977195, 5.579841,
4.346557, -3.178617, -5.892676,
4.346557, -3.178617, 5.579841,
4.346557, 2.977195, -5.892676,
4.346557, 2.977195, 5.579841
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
var radius = 7.998193;
var distance = 35.58487;
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
mvMatrix.translate( -0.6438266, 0.1007112, 0.1564174 );
mvMatrix.scale( 1.16776, 1.404819, 0.7537843 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.58487);
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
gl.drawArrays(gl.LINES, 0, 10);
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
gl.drawElements(gl.TRIANGLES, 24, gl.UNSIGNED_SHORT, 0);
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
gl.drawArrays(gl.LINES, 0, 14);
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
gl.drawElements(gl.TRIANGLES, 36, gl.UNSIGNED_SHORT, 0);
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
Mevinphos<-read.table("Mevinphos.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Mevinphos$V2
```

```
## Error in eval(expr, envir, enclos): object 'Mevinphos' not found
```

```r
y<-Mevinphos$V3
```

```
## Error in eval(expr, envir, enclos): object 'Mevinphos' not found
```

```r
z<-Mevinphos$V4
```

```
## Error in eval(expr, envir, enclos): object 'Mevinphos' not found
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
-2.951057, -0.4005264, -1.887252, 0, 0, 1, 1, 1,
-2.637175, 0.8596725, 0.01353445, 1, 0, 0, 1, 1,
-2.612761, 1.582539, -2.099109, 1, 0, 0, 1, 1,
-2.600018, -0.160593, -0.6787852, 1, 0, 0, 1, 1,
-2.481137, -0.5912654, -1.924859, 1, 0, 0, 1, 1,
-2.425231, 1.402261, -1.219613, 1, 0, 0, 1, 1,
-2.37667, 0.7450279, 0.4493298, 0, 0, 0, 1, 1,
-2.25145, 1.252532, 0.9471842, 0, 0, 0, 1, 1,
-2.211999, 0.841535, -0.438248, 0, 0, 0, 1, 1,
-2.211829, -0.5084778, -2.634073, 0, 0, 0, 1, 1,
-2.209166, -1.607901, -2.872064, 0, 0, 0, 1, 1,
-2.181812, 1.185536, -1.459379, 0, 0, 0, 1, 1,
-2.127683, -1.932375, -2.082659, 0, 0, 0, 1, 1,
-2.104949, -1.061606, -3.229108, 1, 1, 1, 1, 1,
-2.076044, 1.237501, -1.375155, 1, 1, 1, 1, 1,
-2.051615, 0.6288344, -2.143357, 1, 1, 1, 1, 1,
-2.037462, 0.2193822, -2.254093, 1, 1, 1, 1, 1,
-2.025157, 0.1721552, -2.791695, 1, 1, 1, 1, 1,
-2.021804, -1.003077, -2.776963, 1, 1, 1, 1, 1,
-2.021631, 0.2720326, -2.512478, 1, 1, 1, 1, 1,
-1.982223, 0.4371957, -1.304659, 1, 1, 1, 1, 1,
-1.965682, -0.02279328, -0.5897908, 1, 1, 1, 1, 1,
-1.951563, -0.914003, -1.660783, 1, 1, 1, 1, 1,
-1.938512, 0.4233652, 0.1500795, 1, 1, 1, 1, 1,
-1.936977, -1.560764, -3.345741, 1, 1, 1, 1, 1,
-1.936939, -1.169669, -1.898583, 1, 1, 1, 1, 1,
-1.931253, 0.2259719, -1.488152, 1, 1, 1, 1, 1,
-1.927481, 0.4826645, -2.930382, 1, 1, 1, 1, 1,
-1.916917, 0.5071016, -2.383771, 0, 0, 1, 1, 1,
-1.908907, -0.4768292, -1.005242, 1, 0, 0, 1, 1,
-1.883243, 2.695542, -1.565383, 1, 0, 0, 1, 1,
-1.864226, -0.7773561, -2.682715, 1, 0, 0, 1, 1,
-1.855249, 0.5663183, -1.664971, 1, 0, 0, 1, 1,
-1.841338, 0.9197856, 0.5479398, 1, 0, 0, 1, 1,
-1.831879, -0.6379123, -1.779554, 0, 0, 0, 1, 1,
-1.831627, -0.9336511, -1.892644, 0, 0, 0, 1, 1,
-1.797131, 0.9527032, -1.524681, 0, 0, 0, 1, 1,
-1.791123, -0.6488669, -1.681866, 0, 0, 0, 1, 1,
-1.790488, -0.7585664, -1.948037, 0, 0, 0, 1, 1,
-1.779302, 1.227228, -0.3045259, 0, 0, 0, 1, 1,
-1.774824, 0.2587892, 0.7180367, 0, 0, 0, 1, 1,
-1.769842, 0.5613601, -1.318011, 1, 1, 1, 1, 1,
-1.755807, -0.1071104, -0.9882325, 1, 1, 1, 1, 1,
-1.75557, -0.02587551, -1.726504, 1, 1, 1, 1, 1,
-1.752497, 0.125991, -2.099697, 1, 1, 1, 1, 1,
-1.750177, -0.4311256, -1.192391, 1, 1, 1, 1, 1,
-1.740294, 1.094191, -1.73611, 1, 1, 1, 1, 1,
-1.739929, -0.08963633, -2.585392, 1, 1, 1, 1, 1,
-1.691858, -1.135601, -2.680853, 1, 1, 1, 1, 1,
-1.667836, 0.4240897, -1.040051, 1, 1, 1, 1, 1,
-1.662115, -0.07277162, -1.569023, 1, 1, 1, 1, 1,
-1.66002, -0.353675, 1.251997, 1, 1, 1, 1, 1,
-1.653291, -0.5977796, -1.86882, 1, 1, 1, 1, 1,
-1.647253, -0.1388986, -1.220416, 1, 1, 1, 1, 1,
-1.643915, 0.6727256, -0.6063297, 1, 1, 1, 1, 1,
-1.636327, -0.2397571, -2.722479, 1, 1, 1, 1, 1,
-1.622232, 0.09115982, -0.6237346, 0, 0, 1, 1, 1,
-1.620768, -0.3227769, -2.134005, 1, 0, 0, 1, 1,
-1.619781, -0.2595905, -0.7059093, 1, 0, 0, 1, 1,
-1.616143, -0.1264023, -1.289306, 1, 0, 0, 1, 1,
-1.600921, 0.5090528, -2.622929, 1, 0, 0, 1, 1,
-1.598424, -0.7789284, -2.68101, 1, 0, 0, 1, 1,
-1.595984, 1.100523, -0.9237714, 0, 0, 0, 1, 1,
-1.591475, -0.6251943, -2.54007, 0, 0, 0, 1, 1,
-1.580432, -0.1108649, -0.9810626, 0, 0, 0, 1, 1,
-1.552823, -1.170345, -1.310819, 0, 0, 0, 1, 1,
-1.551164, 1.294015, 0.5290505, 0, 0, 0, 1, 1,
-1.54462, 0.2386742, -0.9990416, 0, 0, 0, 1, 1,
-1.530639, 0.04835663, -1.227733, 0, 0, 0, 1, 1,
-1.529979, 0.9310189, -1.695037, 1, 1, 1, 1, 1,
-1.527104, -0.3223292, -0.4696185, 1, 1, 1, 1, 1,
-1.498394, 1.093257, 0.2136319, 1, 1, 1, 1, 1,
-1.498217, -0.6271131, -2.087916, 1, 1, 1, 1, 1,
-1.488135, -1.39412, -2.55847, 1, 1, 1, 1, 1,
-1.486513, 0.5973154, -1.6551, 1, 1, 1, 1, 1,
-1.461163, -0.3644738, -0.05607379, 1, 1, 1, 1, 1,
-1.445442, -0.2559841, -0.8768499, 1, 1, 1, 1, 1,
-1.439932, -0.1830555, -0.9893692, 1, 1, 1, 1, 1,
-1.427426, 0.1682669, -0.0563928, 1, 1, 1, 1, 1,
-1.427172, 1.216275, 0.7770712, 1, 1, 1, 1, 1,
-1.416238, -0.001555798, -3.040076, 1, 1, 1, 1, 1,
-1.415238, -0.8257648, -2.46508, 1, 1, 1, 1, 1,
-1.407543, 0.1009927, -0.5853503, 1, 1, 1, 1, 1,
-1.400288, 0.4856872, -0.8811382, 1, 1, 1, 1, 1,
-1.397696, 0.06914924, -0.641436, 0, 0, 1, 1, 1,
-1.396062, 0.361985, -2.150214, 1, 0, 0, 1, 1,
-1.382509, 0.2665057, -1.740674, 1, 0, 0, 1, 1,
-1.36826, 1.239004, -2.669881, 1, 0, 0, 1, 1,
-1.360075, 1.200225, -2.694451, 1, 0, 0, 1, 1,
-1.358099, -0.1874193, -1.27367, 1, 0, 0, 1, 1,
-1.352263, 0.1372366, -3.647965, 0, 0, 0, 1, 1,
-1.346679, -1.211407, -2.633466, 0, 0, 0, 1, 1,
-1.343828, 0.9931335, -1.678879, 0, 0, 0, 1, 1,
-1.321298, 0.4195651, -1.143375, 0, 0, 0, 1, 1,
-1.317932, 0.7527204, 0.686151, 0, 0, 0, 1, 1,
-1.31254, -2.283647, -4.386925, 0, 0, 0, 1, 1,
-1.310056, -1.108017, -4.022662, 0, 0, 0, 1, 1,
-1.309463, 0.284651, -1.426889, 1, 1, 1, 1, 1,
-1.303486, 1.469557, -0.8612918, 1, 1, 1, 1, 1,
-1.292435, -0.7437592, -1.279332, 1, 1, 1, 1, 1,
-1.286524, -1.069606, -3.564362, 1, 1, 1, 1, 1,
-1.2836, -0.2156047, -0.4626324, 1, 1, 1, 1, 1,
-1.27442, -1.341403, -3.574454, 1, 1, 1, 1, 1,
-1.273289, -0.2794764, -2.559664, 1, 1, 1, 1, 1,
-1.264563, 1.174093, -1.285843, 1, 1, 1, 1, 1,
-1.260473, 1.394835, -1.411963, 1, 1, 1, 1, 1,
-1.250999, -0.8734006, -1.365202, 1, 1, 1, 1, 1,
-1.246436, -0.4796569, -1.367256, 1, 1, 1, 1, 1,
-1.240815, -0.9582037, -3.18722, 1, 1, 1, 1, 1,
-1.239525, -1.155738, -1.764918, 1, 1, 1, 1, 1,
-1.224007, 0.4482489, 0.6047732, 1, 1, 1, 1, 1,
-1.216116, 0.3691082, -2.238089, 1, 1, 1, 1, 1,
-1.215375, 1.663456, -0.5630118, 0, 0, 1, 1, 1,
-1.205444, 0.3546626, -1.745982, 1, 0, 0, 1, 1,
-1.2023, -0.5319256, -1.582428, 1, 0, 0, 1, 1,
-1.194356, 1.328617, -0.1314141, 1, 0, 0, 1, 1,
-1.181388, -0.2734296, -1.923277, 1, 0, 0, 1, 1,
-1.173998, 0.6212141, -0.7827238, 1, 0, 0, 1, 1,
-1.167711, 0.7157516, -0.09741602, 0, 0, 0, 1, 1,
-1.16265, -1.045503, -3.678813, 0, 0, 0, 1, 1,
-1.162611, 0.66882, -2.200488, 0, 0, 0, 1, 1,
-1.162101, 1.49315, -2.609927, 0, 0, 0, 1, 1,
-1.141283, -0.3664598, -2.120706, 0, 0, 0, 1, 1,
-1.140181, -0.05593478, -3.008507, 0, 0, 0, 1, 1,
-1.138566, -0.6003596, -1.723857, 0, 0, 0, 1, 1,
-1.136179, 0.1550255, -1.47897, 1, 1, 1, 1, 1,
-1.136095, 0.455149, 1.683051, 1, 1, 1, 1, 1,
-1.135094, 0.06696145, -2.064755, 1, 1, 1, 1, 1,
-1.134347, 1.312064, -0.6838097, 1, 1, 1, 1, 1,
-1.13267, 1.12681, -1.585748, 1, 1, 1, 1, 1,
-1.117848, -1.072231, -2.346777, 1, 1, 1, 1, 1,
-1.104669, -0.7817504, -2.114752, 1, 1, 1, 1, 1,
-1.104044, 0.1349634, -1.010665, 1, 1, 1, 1, 1,
-1.104018, -1.423636, -3.010054, 1, 1, 1, 1, 1,
-1.103938, -0.4528973, -2.427497, 1, 1, 1, 1, 1,
-1.092041, -0.5418828, -1.640759, 1, 1, 1, 1, 1,
-1.085225, -1.319852, -3.642155, 1, 1, 1, 1, 1,
-1.082756, 0.9355357, 1.535868, 1, 1, 1, 1, 1,
-1.075153, -0.08542513, -0.9393185, 1, 1, 1, 1, 1,
-1.071632, 0.7867578, 0.07591022, 1, 1, 1, 1, 1,
-1.063477, 0.824195, -0.4353824, 0, 0, 1, 1, 1,
-1.063192, -0.7170255, -1.143308, 1, 0, 0, 1, 1,
-1.063068, -0.5757266, -2.828156, 1, 0, 0, 1, 1,
-1.060736, -1.027538, -3.332116, 1, 0, 0, 1, 1,
-1.058471, 0.6335017, -1.43504, 1, 0, 0, 1, 1,
-1.045062, -0.6835795, -2.755075, 1, 0, 0, 1, 1,
-1.039526, 0.5059593, -1.456942, 0, 0, 0, 1, 1,
-1.037201, 2.120285, -0.2689025, 0, 0, 0, 1, 1,
-1.032712, 1.196231, -0.1470035, 0, 0, 0, 1, 1,
-1.03125, 0.8718598, -1.203974, 0, 0, 0, 1, 1,
-1.0297, -3.088969, -2.214072, 0, 0, 0, 1, 1,
-1.029545, 0.3185996, -2.601994, 0, 0, 0, 1, 1,
-1.024112, 0.1946005, -0.04930338, 0, 0, 0, 1, 1,
-1.023349, 0.3644038, -1.465682, 1, 1, 1, 1, 1,
-1.01124, -0.6163046, -2.382077, 1, 1, 1, 1, 1,
-1.005655, 0.8965487, -0.9192979, 1, 1, 1, 1, 1,
-1.002665, -0.5941038, -1.758654, 1, 1, 1, 1, 1,
-0.9910097, 1.109446, -0.4585646, 1, 1, 1, 1, 1,
-0.9903669, -0.2485715, -2.21052, 1, 1, 1, 1, 1,
-0.9730269, 0.4315438, -1.744366, 1, 1, 1, 1, 1,
-0.9714763, -0.3695117, -0.2231654, 1, 1, 1, 1, 1,
-0.9669433, -0.3057078, -2.12535, 1, 1, 1, 1, 1,
-0.9665211, -2.293492, -2.37377, 1, 1, 1, 1, 1,
-0.9592586, -2.142978, -4.10704, 1, 1, 1, 1, 1,
-0.9529887, 0.572689, -1.091508, 1, 1, 1, 1, 1,
-0.9500262, -0.6950126, -3.106078, 1, 1, 1, 1, 1,
-0.9449432, 1.15245, -0.8474254, 1, 1, 1, 1, 1,
-0.9443521, 0.8204195, -2.222111, 1, 1, 1, 1, 1,
-0.944214, 0.1487455, -2.240953, 0, 0, 1, 1, 1,
-0.9431319, -0.28804, 1.231937, 1, 0, 0, 1, 1,
-0.9426411, 0.9061065, 0.04156804, 1, 0, 0, 1, 1,
-0.9426156, 1.538202, -0.9350654, 1, 0, 0, 1, 1,
-0.9344859, 0.550361, -1.277675, 1, 0, 0, 1, 1,
-0.932485, -1.466806, -3.32204, 1, 0, 0, 1, 1,
-0.9126893, -0.05648235, -2.939938, 0, 0, 0, 1, 1,
-0.9116819, 0.7543136, -0.7522241, 0, 0, 0, 1, 1,
-0.8981225, 0.8133971, -0.6374977, 0, 0, 0, 1, 1,
-0.8859815, 0.2851616, -3.058421, 0, 0, 0, 1, 1,
-0.8837514, -0.9967037, -2.065665, 0, 0, 0, 1, 1,
-0.8797792, -0.6124651, -1.320453, 0, 0, 0, 1, 1,
-0.8766118, -0.6954829, -1.897164, 0, 0, 0, 1, 1,
-0.87558, 0.3958572, -2.012425, 1, 1, 1, 1, 1,
-0.8735133, 1.110563, -0.6293048, 1, 1, 1, 1, 1,
-0.8727171, 0.5828755, -1.908039, 1, 1, 1, 1, 1,
-0.8715436, 1.564751, -0.4700722, 1, 1, 1, 1, 1,
-0.8678901, -0.8090116, -2.299598, 1, 1, 1, 1, 1,
-0.8651884, -0.5849314, -2.68987, 1, 1, 1, 1, 1,
-0.86233, -0.2138459, -0.4570913, 1, 1, 1, 1, 1,
-0.8588843, 0.2579013, -1.850559, 1, 1, 1, 1, 1,
-0.8484018, 2.280443, -1.828761, 1, 1, 1, 1, 1,
-0.8476697, 0.5126, -0.2093466, 1, 1, 1, 1, 1,
-0.846079, 0.4002527, 1.180576, 1, 1, 1, 1, 1,
-0.8391432, -0.7813801, -2.324222, 1, 1, 1, 1, 1,
-0.8356684, -2.664475, -2.798631, 1, 1, 1, 1, 1,
-0.8355361, 1.524647, -2.941493, 1, 1, 1, 1, 1,
-0.8178163, 1.180293, -0.7508227, 1, 1, 1, 1, 1,
-0.8127618, 0.8221039, -1.015905, 0, 0, 1, 1, 1,
-0.8049933, 0.0001526574, -1.154586, 1, 0, 0, 1, 1,
-0.796514, 0.0671406, -1.237237, 1, 0, 0, 1, 1,
-0.7957006, -0.3190118, -0.6202162, 1, 0, 0, 1, 1,
-0.7933599, 1.191107, 0.3092448, 1, 0, 0, 1, 1,
-0.7920295, 0.6979555, -1.587748, 1, 0, 0, 1, 1,
-0.7907895, -1.19322, -1.853635, 0, 0, 0, 1, 1,
-0.7827716, -0.8356321, -3.35605, 0, 0, 0, 1, 1,
-0.7802016, -1.337175, -2.714046, 0, 0, 0, 1, 1,
-0.7792524, -0.9290597, -1.852784, 0, 0, 0, 1, 1,
-0.7787447, 1.245428, -1.737991, 0, 0, 0, 1, 1,
-0.7757092, 0.5866814, -2.650238, 0, 0, 0, 1, 1,
-0.7751828, 1.496976, 0.8638281, 0, 0, 0, 1, 1,
-0.7737081, -1.351281, -2.224566, 1, 1, 1, 1, 1,
-0.7709142, 1.291333, -1.108194, 1, 1, 1, 1, 1,
-0.7707775, 0.153382, -0.7540335, 1, 1, 1, 1, 1,
-0.7669429, -0.7802484, -2.662747, 1, 1, 1, 1, 1,
-0.7638878, 0.8702723, 0.1546376, 1, 1, 1, 1, 1,
-0.7624347, 1.196784, -1.043192, 1, 1, 1, 1, 1,
-0.7595661, -0.1990765, -1.464976, 1, 1, 1, 1, 1,
-0.758399, -1.149507, -1.983751, 1, 1, 1, 1, 1,
-0.7578244, -0.03556402, -2.071023, 1, 1, 1, 1, 1,
-0.7537301, -0.6990761, -1.654662, 1, 1, 1, 1, 1,
-0.7524245, 0.390059, -0.124623, 1, 1, 1, 1, 1,
-0.7453856, -0.5784829, -1.907941, 1, 1, 1, 1, 1,
-0.7395039, 1.129179, -0.7417619, 1, 1, 1, 1, 1,
-0.7372406, -1.617463, -2.600993, 1, 1, 1, 1, 1,
-0.7368561, -1.746858, -1.321289, 1, 1, 1, 1, 1,
-0.7321683, -1.955358, -2.304174, 0, 0, 1, 1, 1,
-0.7312399, -0.491055, -1.923727, 1, 0, 0, 1, 1,
-0.7270317, -0.8924968, -1.900183, 1, 0, 0, 1, 1,
-0.725569, 0.8054133, -1.180938, 1, 0, 0, 1, 1,
-0.7189059, 0.07690328, -2.604573, 1, 0, 0, 1, 1,
-0.7182223, 0.8990062, -1.266712, 1, 0, 0, 1, 1,
-0.7178474, -0.03973559, -0.4522602, 0, 0, 0, 1, 1,
-0.7158617, 0.8462171, -0.4186005, 0, 0, 0, 1, 1,
-0.7147431, 1.021434, -0.3373535, 0, 0, 0, 1, 1,
-0.7145713, 0.1141494, -2.162529, 0, 0, 0, 1, 1,
-0.7139987, -0.5341637, -0.5318636, 0, 0, 0, 1, 1,
-0.7138913, 0.2224384, -1.347553, 0, 0, 0, 1, 1,
-0.7116402, 0.1313372, -0.9998654, 0, 0, 0, 1, 1,
-0.7103473, 0.3459338, -2.452171, 1, 1, 1, 1, 1,
-0.7085609, -0.4955536, -1.318929, 1, 1, 1, 1, 1,
-0.7027807, -1.238289, -1.553307, 1, 1, 1, 1, 1,
-0.6950582, 0.555512, -0.0557036, 1, 1, 1, 1, 1,
-0.6861334, -2.353061, -2.305222, 1, 1, 1, 1, 1,
-0.6851858, -1.757554, -0.9477536, 1, 1, 1, 1, 1,
-0.680609, -1.187068, -2.373795, 1, 1, 1, 1, 1,
-0.6775245, 2.214248, -0.7958157, 1, 1, 1, 1, 1,
-0.6686197, -1.029827, -4.767788, 1, 1, 1, 1, 1,
-0.6638062, 0.3130783, 0.7873759, 1, 1, 1, 1, 1,
-0.6635279, 0.9806187, -1.731865, 1, 1, 1, 1, 1,
-0.6540714, -1.540946, -2.91324, 1, 1, 1, 1, 1,
-0.6500665, 0.4148495, -1.362524, 1, 1, 1, 1, 1,
-0.6494836, -1.144249, -1.705299, 1, 1, 1, 1, 1,
-0.6456495, -0.2388517, -1.042877, 1, 1, 1, 1, 1,
-0.6304467, 0.7027795, -0.5027949, 0, 0, 1, 1, 1,
-0.6291155, -0.3150851, -3.233806, 1, 0, 0, 1, 1,
-0.621749, -0.1376476, -1.905083, 1, 0, 0, 1, 1,
-0.6198583, 0.5253859, -0.7003302, 1, 0, 0, 1, 1,
-0.6155889, -2.175931, -2.338163, 1, 0, 0, 1, 1,
-0.6154704, -0.5661428, -1.591539, 1, 0, 0, 1, 1,
-0.610929, 0.360598, -1.083126, 0, 0, 0, 1, 1,
-0.6094077, 0.7814953, -1.684704, 0, 0, 0, 1, 1,
-0.6032923, 0.9691043, -0.5720143, 0, 0, 0, 1, 1,
-0.6012669, -0.1672237, -2.679709, 0, 0, 0, 1, 1,
-0.5956478, 1.977673, -1.370191, 0, 0, 0, 1, 1,
-0.594954, 0.8024966, -0.1252043, 0, 0, 0, 1, 1,
-0.5944034, 0.2962396, -0.8815799, 0, 0, 0, 1, 1,
-0.5920524, 0.9154384, -0.5351039, 1, 1, 1, 1, 1,
-0.5872005, -0.8597765, -2.50745, 1, 1, 1, 1, 1,
-0.5832483, -0.3968579, -0.7928366, 1, 1, 1, 1, 1,
-0.5773001, 0.4205257, -1.968821, 1, 1, 1, 1, 1,
-0.5759384, 1.549087, -0.2891595, 1, 1, 1, 1, 1,
-0.5746707, -1.208356, -4.815324, 1, 1, 1, 1, 1,
-0.5729567, -0.6321378, -3.078612, 1, 1, 1, 1, 1,
-0.5727257, 0.7510102, 0.7617634, 1, 1, 1, 1, 1,
-0.5682112, 1.764878, -0.6512644, 1, 1, 1, 1, 1,
-0.5650906, 0.8678365, -0.9177647, 1, 1, 1, 1, 1,
-0.5638806, -0.1289881, -1.229503, 1, 1, 1, 1, 1,
-0.5590023, -1.220587, -3.854849, 1, 1, 1, 1, 1,
-0.5500022, 0.03077379, -1.994981, 1, 1, 1, 1, 1,
-0.5472742, 0.4711406, -1.060532, 1, 1, 1, 1, 1,
-0.5468163, -1.364007, -2.437363, 1, 1, 1, 1, 1,
-0.5387635, -0.1918526, -2.738674, 0, 0, 1, 1, 1,
-0.5354317, -0.1611865, -3.562326, 1, 0, 0, 1, 1,
-0.5342449, 1.375105, -1.009249, 1, 0, 0, 1, 1,
-0.534096, -0.329334, -2.877076, 1, 0, 0, 1, 1,
-0.5309629, -1.091495, -2.375287, 1, 0, 0, 1, 1,
-0.5272569, 0.9869419, -0.5537616, 1, 0, 0, 1, 1,
-0.5237856, -0.1232656, -1.85249, 0, 0, 0, 1, 1,
-0.5214006, -0.6076289, -2.040898, 0, 0, 0, 1, 1,
-0.5132585, 0.4461733, -1.050398, 0, 0, 0, 1, 1,
-0.5104218, 1.148846, -0.08845895, 0, 0, 0, 1, 1,
-0.5095937, 0.01065295, -1.99769, 0, 0, 0, 1, 1,
-0.506247, 1.395662, 0.5664433, 0, 0, 0, 1, 1,
-0.5011668, -1.075374, -1.198126, 0, 0, 0, 1, 1,
-0.4987998, 1.456229, 0.05543332, 1, 1, 1, 1, 1,
-0.497878, -0.1272344, -1.609853, 1, 1, 1, 1, 1,
-0.4938399, 0.0874851, -0.7734389, 1, 1, 1, 1, 1,
-0.4905685, -1.328045, -0.2542237, 1, 1, 1, 1, 1,
-0.4858584, 1.249152, -1.109388, 1, 1, 1, 1, 1,
-0.4844426, 0.5665905, -0.3836822, 1, 1, 1, 1, 1,
-0.4841369, 0.006656346, -1.269126, 1, 1, 1, 1, 1,
-0.4773235, -0.5269958, -0.7078134, 1, 1, 1, 1, 1,
-0.4703588, -1.01846, -5.054208, 1, 1, 1, 1, 1,
-0.4685184, 2.315665, -0.7547187, 1, 1, 1, 1, 1,
-0.4676865, 1.918292, -0.2741035, 1, 1, 1, 1, 1,
-0.4657572, 1.60198, 0.2142463, 1, 1, 1, 1, 1,
-0.4634128, -2.987639, -3.717386, 1, 1, 1, 1, 1,
-0.4603102, -0.2584246, -2.345232, 1, 1, 1, 1, 1,
-0.4578496, -0.8440434, -1.985965, 1, 1, 1, 1, 1,
-0.4543427, -1.298481, -3.594554, 0, 0, 1, 1, 1,
-0.4543178, 0.1784559, 0.4366112, 1, 0, 0, 1, 1,
-0.4540208, 1.320176, -0.0669013, 1, 0, 0, 1, 1,
-0.4535226, -0.8508753, -3.310775, 1, 0, 0, 1, 1,
-0.4506392, -1.743455, -4.068666, 1, 0, 0, 1, 1,
-0.4489807, 1.274375, 0.3628745, 1, 0, 0, 1, 1,
-0.4485966, -0.8668596, -3.900224, 0, 0, 0, 1, 1,
-0.4479723, 1.273911, -0.3422795, 0, 0, 0, 1, 1,
-0.4398008, 0.05573262, -1.394037, 0, 0, 0, 1, 1,
-0.4376864, -1.245879, -3.593792, 0, 0, 0, 1, 1,
-0.4364007, 0.5636889, -2.254001, 0, 0, 0, 1, 1,
-0.4293275, 0.9140038, -1.92078, 0, 0, 0, 1, 1,
-0.425014, 0.6369473, -1.795356, 0, 0, 0, 1, 1,
-0.4238936, -0.731514, -1.383637, 1, 1, 1, 1, 1,
-0.4174289, -1.098067, -2.16564, 1, 1, 1, 1, 1,
-0.4167006, 0.8710127, 1.101769, 1, 1, 1, 1, 1,
-0.4128107, -0.6909467, -3.347851, 1, 1, 1, 1, 1,
-0.4075345, -0.2475374, -2.247507, 1, 1, 1, 1, 1,
-0.4038174, -0.01305041, -3.168037, 1, 1, 1, 1, 1,
-0.4037517, -1.775113, -3.04321, 1, 1, 1, 1, 1,
-0.4020129, 1.254275, -0.8105198, 1, 1, 1, 1, 1,
-0.3998744, -0.6348575, -3.496104, 1, 1, 1, 1, 1,
-0.3985409, -0.0310969, -2.567803, 1, 1, 1, 1, 1,
-0.3966526, -0.6247846, -3.24082, 1, 1, 1, 1, 1,
-0.394388, 0.6753469, 0.9448683, 1, 1, 1, 1, 1,
-0.3893373, -0.4128054, -2.354465, 1, 1, 1, 1, 1,
-0.3877315, 0.7136775, 0.5747987, 1, 1, 1, 1, 1,
-0.3862576, -0.6966242, -4.173856, 1, 1, 1, 1, 1,
-0.3862534, 0.2219516, -0.3743131, 0, 0, 1, 1, 1,
-0.375637, 0.454172, -1.524744, 1, 0, 0, 1, 1,
-0.3682253, 0.3685402, -2.033343, 1, 0, 0, 1, 1,
-0.3642922, 1.031168, -0.665626, 1, 0, 0, 1, 1,
-0.3568211, 0.2517209, 1.377791, 1, 0, 0, 1, 1,
-0.3551927, -1.028015, -3.715609, 1, 0, 0, 1, 1,
-0.3532099, 0.3245286, -1.08916, 0, 0, 0, 1, 1,
-0.3511335, 1.113399, 0.3214847, 0, 0, 0, 1, 1,
-0.3470151, 0.2555339, -1.021377, 0, 0, 0, 1, 1,
-0.3405189, 0.008585171, -2.298003, 0, 0, 0, 1, 1,
-0.3387619, 1.177456, -0.4444912, 0, 0, 0, 1, 1,
-0.3363713, 1.519742, -0.148821, 0, 0, 0, 1, 1,
-0.3353125, 0.3389583, -1.709866, 0, 0, 0, 1, 1,
-0.3296519, -0.02755918, -3.263321, 1, 1, 1, 1, 1,
-0.3286389, 0.7354295, -0.3683431, 1, 1, 1, 1, 1,
-0.3272537, 0.2832518, -0.2439159, 1, 1, 1, 1, 1,
-0.3209387, -0.7855921, -2.214372, 1, 1, 1, 1, 1,
-0.3201789, 1.444271, -1.473547, 1, 1, 1, 1, 1,
-0.3195274, -0.1804056, -2.16728, 1, 1, 1, 1, 1,
-0.3153795, 0.343953, -2.738804, 1, 1, 1, 1, 1,
-0.3149733, -0.6115953, -3.881329, 1, 1, 1, 1, 1,
-0.3141857, 0.3964728, -0.9877216, 1, 1, 1, 1, 1,
-0.3120568, -0.9660665, -3.471062, 1, 1, 1, 1, 1,
-0.311504, -1.661806, -1.809787, 1, 1, 1, 1, 1,
-0.310876, 0.5780756, 0.3160439, 1, 1, 1, 1, 1,
-0.3088845, 0.17253, 0.2868347, 1, 1, 1, 1, 1,
-0.3085324, -1.11328, -2.990831, 1, 1, 1, 1, 1,
-0.3074679, -0.5277271, -2.303842, 1, 1, 1, 1, 1,
-0.3024019, 1.401704, 0.1044282, 0, 0, 1, 1, 1,
-0.2976079, -0.7823999, -1.88251, 1, 0, 0, 1, 1,
-0.2939647, -0.2662063, -1.703307, 1, 0, 0, 1, 1,
-0.2933175, 0.9544494, -0.3086716, 1, 0, 0, 1, 1,
-0.2903304, 0.6427022, 1.748446, 1, 0, 0, 1, 1,
-0.2900108, -0.3194837, -2.827641, 1, 0, 0, 1, 1,
-0.2898615, -0.8562565, -3.721772, 0, 0, 0, 1, 1,
-0.2891533, 0.3355666, -0.4369869, 0, 0, 0, 1, 1,
-0.2887923, 0.9040014, -1.824976, 0, 0, 0, 1, 1,
-0.2876845, 0.4302223, -0.4862461, 0, 0, 0, 1, 1,
-0.2858196, 0.3303153, -0.6141962, 0, 0, 0, 1, 1,
-0.2842927, -0.8090066, -3.863069, 0, 0, 0, 1, 1,
-0.2782869, 1.105022, -1.152655, 0, 0, 0, 1, 1,
-0.2750263, -0.4639771, -2.507408, 1, 1, 1, 1, 1,
-0.2747651, 0.4738355, -2.339952, 1, 1, 1, 1, 1,
-0.2744879, 0.001563423, -0.4185426, 1, 1, 1, 1, 1,
-0.2733263, 1.917932, 1.491159, 1, 1, 1, 1, 1,
-0.2726237, 1.422142, -0.2364268, 1, 1, 1, 1, 1,
-0.2725899, 0.2273362, -0.8053051, 1, 1, 1, 1, 1,
-0.2725866, 0.5024376, 1.631448, 1, 1, 1, 1, 1,
-0.2692183, 0.7672557, 0.6883683, 1, 1, 1, 1, 1,
-0.2655128, 1.467061, 1.34978, 1, 1, 1, 1, 1,
-0.2644121, -1.8225, -3.231363, 1, 1, 1, 1, 1,
-0.2614404, -1.423896, -2.351654, 1, 1, 1, 1, 1,
-0.2614346, 0.8558035, -0.556424, 1, 1, 1, 1, 1,
-0.2587005, -2.308178, -3.909005, 1, 1, 1, 1, 1,
-0.2559257, 2.26638, 0.2332506, 1, 1, 1, 1, 1,
-0.2540872, 2.264467, -0.354801, 1, 1, 1, 1, 1,
-0.2442549, 2.789109, 0.3872719, 0, 0, 1, 1, 1,
-0.2388865, -0.7253671, -3.239695, 1, 0, 0, 1, 1,
-0.2252058, -0.2052505, -2.29897, 1, 0, 0, 1, 1,
-0.2217074, 1.01647, -1.147018, 1, 0, 0, 1, 1,
-0.2215815, -0.76496, -4.077919, 1, 0, 0, 1, 1,
-0.2214665, 0.9116188, 0.2240542, 1, 0, 0, 1, 1,
-0.2180387, -0.569931, -3.156103, 0, 0, 0, 1, 1,
-0.2158216, 0.08817493, -0.4859456, 0, 0, 0, 1, 1,
-0.2143565, 0.488443, -0.9392003, 0, 0, 0, 1, 1,
-0.213166, -1.121925, -4.952821, 0, 0, 0, 1, 1,
-0.2105327, -0.03455757, -4.136682, 0, 0, 0, 1, 1,
-0.2083408, 0.1819664, -1.287081, 0, 0, 0, 1, 1,
-0.2042417, -1.292878, -0.7033193, 0, 0, 0, 1, 1,
-0.2009373, -0.0186313, -2.326629, 1, 1, 1, 1, 1,
-0.1984906, 0.4239443, -0.7469122, 1, 1, 1, 1, 1,
-0.1948872, -0.486394, -1.974458, 1, 1, 1, 1, 1,
-0.1872847, 0.5381787, -1.857112, 1, 1, 1, 1, 1,
-0.1871906, 0.1909609, -0.5249481, 1, 1, 1, 1, 1,
-0.1870622, -2.337096, -3.235149, 1, 1, 1, 1, 1,
-0.1807376, 0.7106531, -1.039693, 1, 1, 1, 1, 1,
-0.1740212, -1.654895, -2.853748, 1, 1, 1, 1, 1,
-0.1707421, -0.295166, -4.336192, 1, 1, 1, 1, 1,
-0.1652262, 0.4517044, -0.3556287, 1, 1, 1, 1, 1,
-0.1632338, 0.05379538, -2.051625, 1, 1, 1, 1, 1,
-0.1598665, -0.2601286, -3.505328, 1, 1, 1, 1, 1,
-0.1568685, -1.588123, -2.572882, 1, 1, 1, 1, 1,
-0.1566395, 0.06962357, -0.8802457, 1, 1, 1, 1, 1,
-0.1494797, -1.432675, -2.594497, 1, 1, 1, 1, 1,
-0.148499, -0.4209872, -3.831956, 0, 0, 1, 1, 1,
-0.1469611, 1.190893, -0.3970309, 1, 0, 0, 1, 1,
-0.1418808, 1.196841, -0.2741482, 1, 0, 0, 1, 1,
-0.1387029, -1.322496, -4.432498, 1, 0, 0, 1, 1,
-0.1367355, -0.01478656, -1.166067, 1, 0, 0, 1, 1,
-0.1334816, -1.27925, -4.036964, 1, 0, 0, 1, 1,
-0.1333069, -0.6479699, -5.7256, 0, 0, 0, 1, 1,
-0.1298083, -0.1681436, -2.496586, 0, 0, 0, 1, 1,
-0.1256024, -1.25851, -1.904823, 0, 0, 0, 1, 1,
-0.1253703, -0.3906712, -3.095805, 0, 0, 0, 1, 1,
-0.1247684, 0.438746, 0.1473008, 0, 0, 0, 1, 1,
-0.1232103, -0.3652412, -4.11131, 0, 0, 0, 1, 1,
-0.1178552, 0.6527864, 1.628725, 0, 0, 0, 1, 1,
-0.1167038, -0.4027139, -2.519812, 1, 1, 1, 1, 1,
-0.1137848, -1.738808, -1.565181, 1, 1, 1, 1, 1,
-0.111508, 2.293322, -0.9490074, 1, 1, 1, 1, 1,
-0.1086237, 0.4096983, -2.486298, 1, 1, 1, 1, 1,
-0.1061749, -0.7943082, -2.471857, 1, 1, 1, 1, 1,
-0.1052063, -0.4360784, -1.779397, 1, 1, 1, 1, 1,
-0.1041155, -0.1773161, -3.976179, 1, 1, 1, 1, 1,
-0.1037768, -1.582712, -2.908566, 1, 1, 1, 1, 1,
-0.1031521, 1.304467, -0.5968144, 1, 1, 1, 1, 1,
-0.103077, -0.2017954, -2.225589, 1, 1, 1, 1, 1,
-0.09734256, 0.1526711, 0.6107101, 1, 1, 1, 1, 1,
-0.09407647, 0.3724368, -1.144213, 1, 1, 1, 1, 1,
-0.09241167, -0.5906194, -4.512365, 1, 1, 1, 1, 1,
-0.09201174, 0.6124198, -0.9591882, 1, 1, 1, 1, 1,
-0.08216428, 0.7778375, 0.9740972, 1, 1, 1, 1, 1,
-0.08152134, 0.2405581, -1.690766, 0, 0, 1, 1, 1,
-0.08135334, -0.07757224, -2.065226, 1, 0, 0, 1, 1,
-0.08025379, -0.7867044, -2.609928, 1, 0, 0, 1, 1,
-0.07587477, 0.8587086, 0.176983, 1, 0, 0, 1, 1,
-0.07584652, 0.924156, 0.2057971, 1, 0, 0, 1, 1,
-0.07162186, -1.100122, -1.895416, 1, 0, 0, 1, 1,
-0.06827573, -2.39668, -1.931029, 0, 0, 0, 1, 1,
-0.068059, -1.993311, -2.216296, 0, 0, 0, 1, 1,
-0.06391326, -0.5798445, -1.97482, 0, 0, 0, 1, 1,
-0.06143545, -1.55395, -1.115256, 0, 0, 0, 1, 1,
-0.06103026, -0.3156593, -3.083004, 0, 0, 0, 1, 1,
-0.059502, 0.677279, -0.9826177, 0, 0, 0, 1, 1,
-0.05773166, -0.06490511, -4.041717, 0, 0, 0, 1, 1,
-0.05676298, 0.6070657, -0.208672, 1, 1, 1, 1, 1,
-0.05288089, 0.710735, -1.561373, 1, 1, 1, 1, 1,
-0.04898933, 0.2920374, 0.3811172, 1, 1, 1, 1, 1,
-0.04370381, -0.7462739, -4.611006, 1, 1, 1, 1, 1,
-0.03508554, -0.01081383, -1.580011, 1, 1, 1, 1, 1,
-0.03097253, -0.336852, -5.00109, 1, 1, 1, 1, 1,
-0.02925878, -0.5897012, -3.703159, 1, 1, 1, 1, 1,
-0.02835313, 0.4092998, -2.899969, 1, 1, 1, 1, 1,
-0.02735024, 1.270415, 0.5510061, 1, 1, 1, 1, 1,
-0.02582172, 0.3815103, -0.7366371, 1, 1, 1, 1, 1,
-0.02527672, -1.155236, -3.849366, 1, 1, 1, 1, 1,
-0.02523562, -0.9104111, -4.222046, 1, 1, 1, 1, 1,
-0.02366218, -1.270301, -3.329099, 1, 1, 1, 1, 1,
-0.01562493, -1.305096, -4.971259, 1, 1, 1, 1, 1,
-0.01529161, -0.02309191, -1.544421, 1, 1, 1, 1, 1,
-0.01459665, 1.069278, -0.003739179, 0, 0, 1, 1, 1,
-0.01291786, 0.2831389, -0.05153971, 1, 0, 0, 1, 1,
-0.01271905, -0.03588672, -4.127248, 1, 0, 0, 1, 1,
-0.01203723, -0.7339626, -2.506654, 1, 0, 0, 1, 1,
-0.007821675, 0.1572681, -1.588671, 1, 0, 0, 1, 1,
-0.007721397, -0.6901298, -2.045652, 1, 0, 0, 1, 1,
0.001003671, -0.2898465, 2.15528, 0, 0, 0, 1, 1,
0.01353038, -0.02391746, 2.286378, 0, 0, 0, 1, 1,
0.0160667, 1.150438, -0.6358621, 0, 0, 0, 1, 1,
0.02119507, -0.05124856, 3.644703, 0, 0, 0, 1, 1,
0.02316061, -1.455533, 2.89512, 0, 0, 0, 1, 1,
0.0248419, -1.998018, 5.094529, 0, 0, 0, 1, 1,
0.03292608, -0.1136129, 2.855877, 0, 0, 0, 1, 1,
0.03526173, 2.887547, 0.4719066, 1, 1, 1, 1, 1,
0.03575094, 0.05870414, 0.1564774, 1, 1, 1, 1, 1,
0.04043185, -0.02902478, 2.321124, 1, 1, 1, 1, 1,
0.04050848, -0.6132705, 2.574736, 1, 1, 1, 1, 1,
0.04362252, -1.626941, 2.327573, 1, 1, 1, 1, 1,
0.04418651, 0.9092256, -0.8934661, 1, 1, 1, 1, 1,
0.04453649, 1.384407, 0.818627, 1, 1, 1, 1, 1,
0.04626035, 1.098351, -0.5861052, 1, 1, 1, 1, 1,
0.04735348, -1.878317, 4.668291, 1, 1, 1, 1, 1,
0.05165163, -1.530097, 2.408353, 1, 1, 1, 1, 1,
0.0552008, 0.0582011, 0.3670929, 1, 1, 1, 1, 1,
0.05832012, 0.5632216, -1.788887, 1, 1, 1, 1, 1,
0.06398177, -0.3991678, 4.422472, 1, 1, 1, 1, 1,
0.06885566, -0.6891177, 3.50485, 1, 1, 1, 1, 1,
0.06949664, -0.7272269, 2.487427, 1, 1, 1, 1, 1,
0.07170706, -0.5760078, 3.261615, 0, 0, 1, 1, 1,
0.0747585, -0.332848, 3.729123, 1, 0, 0, 1, 1,
0.07758997, -0.6621242, 4.382975, 1, 0, 0, 1, 1,
0.08509272, -0.5503868, 4.420348, 1, 0, 0, 1, 1,
0.0858334, -0.4206593, 3.925475, 1, 0, 0, 1, 1,
0.08623499, 0.2603026, -0.006483257, 1, 0, 0, 1, 1,
0.0901285, -1.265221, 2.09927, 0, 0, 0, 1, 1,
0.09049956, 0.5420975, 0.5883784, 0, 0, 0, 1, 1,
0.1047429, 1.003506, -0.1955031, 0, 0, 0, 1, 1,
0.1081847, 0.3394325, -1.206241, 0, 0, 0, 1, 1,
0.1099958, -1.728073, 2.447241, 0, 0, 0, 1, 1,
0.1184529, -0.8809447, 3.785156, 0, 0, 0, 1, 1,
0.1202275, -1.16162, 2.733855, 0, 0, 0, 1, 1,
0.1207361, -0.03520544, 2.495107, 1, 1, 1, 1, 1,
0.1225465, 0.189461, -0.3609945, 1, 1, 1, 1, 1,
0.1263951, 0.4570613, -0.1106057, 1, 1, 1, 1, 1,
0.1306027, 0.0799226, 1.621645, 1, 1, 1, 1, 1,
0.1333958, -0.3681205, 2.691232, 1, 1, 1, 1, 1,
0.1366518, -0.7851542, 3.437232, 1, 1, 1, 1, 1,
0.1384752, 0.1059136, 0.9812771, 1, 1, 1, 1, 1,
0.1434419, 1.624662, -0.3232431, 1, 1, 1, 1, 1,
0.1500485, -1.785301, 2.82916, 1, 1, 1, 1, 1,
0.1565951, -2.103725, 3.523667, 1, 1, 1, 1, 1,
0.159315, 1.491836, 0.3315412, 1, 1, 1, 1, 1,
0.1615762, 1.137131, 0.3792933, 1, 1, 1, 1, 1,
0.1663189, -0.5683373, 2.193388, 1, 1, 1, 1, 1,
0.1665966, -0.5414988, 1.37783, 1, 1, 1, 1, 1,
0.1673904, 0.4057878, 1.471164, 1, 1, 1, 1, 1,
0.1696091, 0.7740665, -2.012404, 0, 0, 1, 1, 1,
0.1704333, 0.1115765, 1.608941, 1, 0, 0, 1, 1,
0.1772404, -0.5763751, 2.624502, 1, 0, 0, 1, 1,
0.1796515, 0.41701, 0.4870107, 1, 0, 0, 1, 1,
0.1818515, -0.7900191, 4.396602, 1, 0, 0, 1, 1,
0.1827834, 0.1803875, 0.002535688, 1, 0, 0, 1, 1,
0.1868678, 1.218944, -0.8945657, 0, 0, 0, 1, 1,
0.1871777, 0.1473869, 1.268618, 0, 0, 0, 1, 1,
0.1883247, 1.080806, 0.1486032, 0, 0, 0, 1, 1,
0.1907501, 0.6611325, 0.6755897, 0, 0, 0, 1, 1,
0.1922485, 0.03813495, 1.964094, 0, 0, 0, 1, 1,
0.1923337, -1.136889, 3.437298, 0, 0, 0, 1, 1,
0.1931999, 1.20158, 2.650733, 0, 0, 0, 1, 1,
0.2063584, -0.4953793, 2.740115, 1, 1, 1, 1, 1,
0.2096115, 0.3288186, 0.9954099, 1, 1, 1, 1, 1,
0.2105741, 0.8776909, -1.194181, 1, 1, 1, 1, 1,
0.2117509, 1.057179, -1.02618, 1, 1, 1, 1, 1,
0.212874, -0.3419045, 3.81398, 1, 1, 1, 1, 1,
0.2181104, -0.8992172, 2.680766, 1, 1, 1, 1, 1,
0.2181251, 0.01547452, 0.4216169, 1, 1, 1, 1, 1,
0.2181417, -1.151127, 2.051503, 1, 1, 1, 1, 1,
0.2197337, -0.6023826, 4.176264, 1, 1, 1, 1, 1,
0.2200138, -2.666042, 3.737745, 1, 1, 1, 1, 1,
0.2237156, 0.2688624, 2.051595, 1, 1, 1, 1, 1,
0.2239751, -0.1022381, 2.266223, 1, 1, 1, 1, 1,
0.2331532, 0.7487664, 1.22319, 1, 1, 1, 1, 1,
0.2392831, 0.6638942, 0.7804913, 1, 1, 1, 1, 1,
0.2404808, -1.911029, 3.561108, 1, 1, 1, 1, 1,
0.2412585, -0.9972684, 1.424325, 0, 0, 1, 1, 1,
0.2514244, 0.561742, 0.2705162, 1, 0, 0, 1, 1,
0.2582172, 0.228254, 0.9323988, 1, 0, 0, 1, 1,
0.2609957, 0.3399064, 0.004187228, 1, 0, 0, 1, 1,
0.2621732, -0.38406, 3.213896, 1, 0, 0, 1, 1,
0.266007, 0.8191382, 1.264179, 1, 0, 0, 1, 1,
0.2665411, -0.8231631, 2.129784, 0, 0, 0, 1, 1,
0.2691027, 0.4484607, -0.4896983, 0, 0, 0, 1, 1,
0.2697965, 0.4136792, 0.8783891, 0, 0, 0, 1, 1,
0.2702812, 0.3728811, 0.2104471, 0, 0, 0, 1, 1,
0.2707099, -0.9643691, 2.466254, 0, 0, 0, 1, 1,
0.2732138, 0.5994344, 1.392758, 0, 0, 0, 1, 1,
0.274281, -1.193717, 1.080638, 0, 0, 0, 1, 1,
0.2798747, 0.3165165, 2.360118, 1, 1, 1, 1, 1,
0.2838984, 0.9045888, 0.8954619, 1, 1, 1, 1, 1,
0.284987, -0.1270912, 1.985222, 1, 1, 1, 1, 1,
0.2861962, -0.540484, 2.532843, 1, 1, 1, 1, 1,
0.2866614, 1.505026, -1.971507, 1, 1, 1, 1, 1,
0.2867429, 0.5278109, 1.599825, 1, 1, 1, 1, 1,
0.2873607, -0.8809137, 2.367732, 1, 1, 1, 1, 1,
0.2905125, 0.140342, 1.771478, 1, 1, 1, 1, 1,
0.2915921, -0.786575, 4.056033, 1, 1, 1, 1, 1,
0.2937405, -0.3014106, 4.063403, 1, 1, 1, 1, 1,
0.2937415, 1.521492, 0.801172, 1, 1, 1, 1, 1,
0.2942809, 0.5391313, 1.028377, 1, 1, 1, 1, 1,
0.2955512, 1.999532, 0.688472, 1, 1, 1, 1, 1,
0.2960885, 0.3736613, -0.1676937, 1, 1, 1, 1, 1,
0.2972752, -0.8785666, 3.201247, 1, 1, 1, 1, 1,
0.2993926, -0.5956216, 2.84906, 0, 0, 1, 1, 1,
0.3062376, 1.818264, -0.1838887, 1, 0, 0, 1, 1,
0.306282, -0.4961468, -0.3603517, 1, 0, 0, 1, 1,
0.3064687, 0.5224207, 0.5299236, 1, 0, 0, 1, 1,
0.3129179, 0.3839277, 0.1885372, 1, 0, 0, 1, 1,
0.3152209, 0.3233093, 2.38481, 1, 0, 0, 1, 1,
0.3235705, -1.321983, 3.901369, 0, 0, 0, 1, 1,
0.325069, 0.2473947, 0.54453, 0, 0, 0, 1, 1,
0.3273669, 0.1864612, 1.825026, 0, 0, 0, 1, 1,
0.3308995, -2.350423, 3.781445, 0, 0, 0, 1, 1,
0.3343634, 0.577632, 1.819507, 0, 0, 0, 1, 1,
0.3343752, -0.9951052, 3.225918, 0, 0, 0, 1, 1,
0.3369233, 0.04224151, 1.777477, 0, 0, 0, 1, 1,
0.3495102, -0.1784791, 2.79324, 1, 1, 1, 1, 1,
0.3514258, 1.892135, 0.2431498, 1, 1, 1, 1, 1,
0.3516695, -0.9801013, 3.335656, 1, 1, 1, 1, 1,
0.3527153, 0.5029367, 0.2936059, 1, 1, 1, 1, 1,
0.3571636, -0.03609356, 2.104694, 1, 1, 1, 1, 1,
0.3583087, 1.186719, -0.6713526, 1, 1, 1, 1, 1,
0.3594795, -1.55805, 5.412766, 1, 1, 1, 1, 1,
0.3603502, -1.239026, 3.010084, 1, 1, 1, 1, 1,
0.3607889, 0.04671878, 1.6962, 1, 1, 1, 1, 1,
0.3680689, -0.5063443, 3.239365, 1, 1, 1, 1, 1,
0.3709404, -1.629594, 3.128978, 1, 1, 1, 1, 1,
0.3774216, -1.601913, 2.651282, 1, 1, 1, 1, 1,
0.3779729, -0.01816634, 2.365842, 1, 1, 1, 1, 1,
0.3785854, -0.1433669, 1.847243, 1, 1, 1, 1, 1,
0.383555, 0.01393594, 1.426279, 1, 1, 1, 1, 1,
0.3846615, 1.500949, 1.314045, 0, 0, 1, 1, 1,
0.3853832, -0.2447764, 2.503267, 1, 0, 0, 1, 1,
0.3909785, 0.8951869, 0.6904842, 1, 0, 0, 1, 1,
0.3938893, 0.8620798, -1.456416, 1, 0, 0, 1, 1,
0.3941932, -1.07239, 3.33377, 1, 0, 0, 1, 1,
0.4002627, -0.9659027, 3.471156, 1, 0, 0, 1, 1,
0.4013907, -0.4317082, 1.770446, 0, 0, 0, 1, 1,
0.4071623, 1.088164, 0.7159335, 0, 0, 0, 1, 1,
0.4147487, 1.27025, -0.7411759, 0, 0, 0, 1, 1,
0.4152236, -0.2288763, 2.842019, 0, 0, 0, 1, 1,
0.4271083, -0.4470937, 0.167382, 0, 0, 0, 1, 1,
0.4317755, 1.179649, -0.9238492, 0, 0, 0, 1, 1,
0.4362752, -0.2955658, 2.570886, 0, 0, 0, 1, 1,
0.4379014, 0.3394253, 0.9876961, 1, 1, 1, 1, 1,
0.4380229, -0.3541268, 2.968322, 1, 1, 1, 1, 1,
0.4380528, -0.734291, 3.769276, 1, 1, 1, 1, 1,
0.4397182, -0.1838584, 1.787354, 1, 1, 1, 1, 1,
0.4399634, -0.6087096, 1.743595, 1, 1, 1, 1, 1,
0.4411881, 0.423019, 1.969874, 1, 1, 1, 1, 1,
0.4435259, 0.01238888, 2.194261, 1, 1, 1, 1, 1,
0.4442993, 1.282554, 1.445791, 1, 1, 1, 1, 1,
0.4459325, -0.992729, 2.078249, 1, 1, 1, 1, 1,
0.4470524, 2.235943, 0.08891698, 1, 1, 1, 1, 1,
0.4499844, -0.9814696, 2.735307, 1, 1, 1, 1, 1,
0.4520482, 1.920316, 0.4797353, 1, 1, 1, 1, 1,
0.4577857, -0.9276478, 0.6182363, 1, 1, 1, 1, 1,
0.467538, 1.200442, 1.471107, 1, 1, 1, 1, 1,
0.4679701, -0.3270115, 2.409221, 1, 1, 1, 1, 1,
0.4694595, 1.310824, -0.8660786, 0, 0, 1, 1, 1,
0.4699371, -0.5520397, 3.352102, 1, 0, 0, 1, 1,
0.4777948, -0.8179827, 4.195693, 1, 0, 0, 1, 1,
0.483235, 0.1990588, 0.3684929, 1, 0, 0, 1, 1,
0.4864772, -1.144185, 2.374406, 1, 0, 0, 1, 1,
0.4879074, -0.363143, 2.901084, 1, 0, 0, 1, 1,
0.4890491, 0.04148947, 0.3321348, 0, 0, 0, 1, 1,
0.4923225, 1.452514, 1.222771, 0, 0, 0, 1, 1,
0.4953143, 1.824873, 0.8605412, 0, 0, 0, 1, 1,
0.5067588, -0.8206556, 2.316795, 0, 0, 0, 1, 1,
0.5091604, -1.529971, 2.437239, 0, 0, 0, 1, 1,
0.5124396, 0.5507466, 0.5525748, 0, 0, 0, 1, 1,
0.5127181, 0.3563247, 1.506078, 0, 0, 0, 1, 1,
0.5128816, 0.9444456, 2.256239, 1, 1, 1, 1, 1,
0.5140753, -0.534934, 1.108503, 1, 1, 1, 1, 1,
0.5191865, -0.6981282, 3.418081, 1, 1, 1, 1, 1,
0.5230494, 0.8658983, 2.210802, 1, 1, 1, 1, 1,
0.5235204, 1.083203, -0.6407815, 1, 1, 1, 1, 1,
0.524991, -1.039975, 1.177933, 1, 1, 1, 1, 1,
0.5258807, -0.9317114, 3.341575, 1, 1, 1, 1, 1,
0.5277668, 0.4927715, -0.1345462, 1, 1, 1, 1, 1,
0.5298242, -0.2710172, 1.584157, 1, 1, 1, 1, 1,
0.531059, 0.4278152, 0.7096539, 1, 1, 1, 1, 1,
0.5328904, -0.5881137, 2.158158, 1, 1, 1, 1, 1,
0.5379922, 0.05895335, 1.784599, 1, 1, 1, 1, 1,
0.539349, 2.304755, 2.392744, 1, 1, 1, 1, 1,
0.544737, -0.06506875, 2.076323, 1, 1, 1, 1, 1,
0.5457898, -0.1656253, 0.7839733, 1, 1, 1, 1, 1,
0.5469366, 0.6892333, -0.3274555, 0, 0, 1, 1, 1,
0.5549654, -1.05448, 1.71619, 1, 0, 0, 1, 1,
0.5560759, 0.1213825, 2.942861, 1, 0, 0, 1, 1,
0.5599867, -0.4339501, 1.346384, 1, 0, 0, 1, 1,
0.5628883, 0.1551751, 0.870875, 1, 0, 0, 1, 1,
0.5648426, -1.581044, 2.856806, 1, 0, 0, 1, 1,
0.5659755, -0.4946583, 3.815035, 0, 0, 0, 1, 1,
0.5709285, -0.09503679, 2.264019, 0, 0, 0, 1, 1,
0.5835144, 0.7783092, 2.786198, 0, 0, 0, 1, 1,
0.5837599, 0.8544014, 1.799787, 0, 0, 0, 1, 1,
0.5843715, 0.08733723, 0.06115572, 0, 0, 0, 1, 1,
0.585206, 1.652336, -0.1001218, 0, 0, 0, 1, 1,
0.5911358, 1.143154, -0.3490711, 0, 0, 0, 1, 1,
0.5934507, 2.02038, 1.570312, 1, 1, 1, 1, 1,
0.5959051, -0.2230547, 1.019734, 1, 1, 1, 1, 1,
0.5993847, -0.4901826, 3.73991, 1, 1, 1, 1, 1,
0.6004061, 0.6550514, 0.6907545, 1, 1, 1, 1, 1,
0.6007752, 0.7431858, 1.309194, 1, 1, 1, 1, 1,
0.60517, 0.3038553, 0.7798783, 1, 1, 1, 1, 1,
0.6057287, -0.2765141, 0.8059828, 1, 1, 1, 1, 1,
0.6071736, -0.2308872, 2.980433, 1, 1, 1, 1, 1,
0.6081128, -2.243882, 2.004054, 1, 1, 1, 1, 1,
0.6084232, 1.700466, 0.4878043, 1, 1, 1, 1, 1,
0.6085647, 0.2690333, 2.633809, 1, 1, 1, 1, 1,
0.6100354, -0.0516942, 1.454689, 1, 1, 1, 1, 1,
0.610928, 0.1412292, 0.580442, 1, 1, 1, 1, 1,
0.6174063, -0.1712315, 2.090368, 1, 1, 1, 1, 1,
0.619179, 0.5891237, 1.479607, 1, 1, 1, 1, 1,
0.6207569, -0.9213258, 1.497335, 0, 0, 1, 1, 1,
0.6212298, 1.630623, 1.398478, 1, 0, 0, 1, 1,
0.6234207, -0.4892433, 2.894708, 1, 0, 0, 1, 1,
0.6242811, -0.4404525, 4.388727, 1, 0, 0, 1, 1,
0.6283746, -0.3827693, 4.560408, 1, 0, 0, 1, 1,
0.6300929, 2.004671, -0.700068, 1, 0, 0, 1, 1,
0.640654, 0.247039, 1.189639, 0, 0, 0, 1, 1,
0.6429961, -0.2812884, 1.573281, 0, 0, 0, 1, 1,
0.6438355, -0.8326406, 2.140153, 0, 0, 0, 1, 1,
0.6439409, 0.4269677, 2.027384, 0, 0, 0, 1, 1,
0.6468531, 0.6003985, 0.5639591, 0, 0, 0, 1, 1,
0.6534314, -1.583083, 4.160602, 0, 0, 0, 1, 1,
0.6540356, 0.05023133, 3.266628, 0, 0, 0, 1, 1,
0.6552135, -0.3436769, 3.232601, 1, 1, 1, 1, 1,
0.6557457, -0.4003853, 2.53085, 1, 1, 1, 1, 1,
0.6596161, -0.7439998, 3.278135, 1, 1, 1, 1, 1,
0.6599785, -1.13795, 2.052503, 1, 1, 1, 1, 1,
0.6615544, 0.2168019, 1.912012, 1, 1, 1, 1, 1,
0.6631706, 2.728124, 0.3578314, 1, 1, 1, 1, 1,
0.6648976, -0.1650201, 1.296151, 1, 1, 1, 1, 1,
0.6674447, 1.118178, -0.008434495, 1, 1, 1, 1, 1,
0.6678783, -0.3715286, 2.337853, 1, 1, 1, 1, 1,
0.6711863, -0.8730713, 2.635034, 1, 1, 1, 1, 1,
0.67335, -1.276036, -0.1825844, 1, 1, 1, 1, 1,
0.6766112, 1.335472, 0.005562638, 1, 1, 1, 1, 1,
0.682308, -0.7062966, 2.79919, 1, 1, 1, 1, 1,
0.6869168, 2.785839, 0.9563462, 1, 1, 1, 1, 1,
0.6870412, 0.5767376, 0.77168, 1, 1, 1, 1, 1,
0.68756, -1.059798, 3.94355, 0, 0, 1, 1, 1,
0.6907672, 1.34803, 0.7159857, 1, 0, 0, 1, 1,
0.6919467, -0.7769888, 2.503227, 1, 0, 0, 1, 1,
0.6924846, 0.2457205, -0.1393866, 1, 0, 0, 1, 1,
0.6939409, -2.249466, 2.668592, 1, 0, 0, 1, 1,
0.6943341, 0.006819545, 2.88377, 1, 0, 0, 1, 1,
0.6991138, -1.105511, 1.587807, 0, 0, 0, 1, 1,
0.7010394, -0.2032646, 3.171966, 0, 0, 0, 1, 1,
0.7057137, -0.575469, 0.8181624, 0, 0, 0, 1, 1,
0.7093532, -0.4802918, 1.008421, 0, 0, 0, 1, 1,
0.712945, 0.1069215, 0.4425997, 0, 0, 0, 1, 1,
0.7208294, -0.828543, 4.551639, 0, 0, 0, 1, 1,
0.7268468, -0.4142339, 2.321856, 0, 0, 0, 1, 1,
0.7300553, 1.110359, 1.088257, 1, 1, 1, 1, 1,
0.7357598, -0.3122691, 0.3216172, 1, 1, 1, 1, 1,
0.7439115, 0.1822765, 2.560159, 1, 1, 1, 1, 1,
0.7441675, 0.4044699, 0.6780822, 1, 1, 1, 1, 1,
0.7466229, -0.4620108, 1.073677, 1, 1, 1, 1, 1,
0.7544926, -0.1477919, 3.046587, 1, 1, 1, 1, 1,
0.7547089, 2.0456, -0.9454473, 1, 1, 1, 1, 1,
0.7764696, 0.3735152, 0.8797687, 1, 1, 1, 1, 1,
0.7771708, -0.0580991, 2.271699, 1, 1, 1, 1, 1,
0.7786828, 0.8033253, 0.9177759, 1, 1, 1, 1, 1,
0.7791785, 0.3087686, 2.158245, 1, 1, 1, 1, 1,
0.779766, -1.254234, 1.92591, 1, 1, 1, 1, 1,
0.7819112, 1.623435, 0.6400437, 1, 1, 1, 1, 1,
0.7854108, 1.323645, -0.4177577, 1, 1, 1, 1, 1,
0.7874261, 1.450078, 0.5230949, 1, 1, 1, 1, 1,
0.7891249, -1.1714, 1.589599, 0, 0, 1, 1, 1,
0.7892321, 1.549648, 0.7089992, 1, 0, 0, 1, 1,
0.7909316, -0.1949221, 2.408726, 1, 0, 0, 1, 1,
0.7922152, 1.540457, 0.5702333, 1, 0, 0, 1, 1,
0.7929069, -1.060062, 3.309204, 1, 0, 0, 1, 1,
0.7934427, 0.3730431, 2.385244, 1, 0, 0, 1, 1,
0.7973188, 0.6477003, 1.758173, 0, 0, 0, 1, 1,
0.802857, 0.6075667, 1.638195, 0, 0, 0, 1, 1,
0.8128822, 0.7094601, 1.504264, 0, 0, 0, 1, 1,
0.8187982, 2.534729, 0.5991188, 0, 0, 0, 1, 1,
0.8199149, 0.3426356, 1.254144, 0, 0, 0, 1, 1,
0.8221281, -1.886042, 0.8678983, 0, 0, 0, 1, 1,
0.822241, 0.0294306, 1.235671, 0, 0, 0, 1, 1,
0.8242331, -0.4399182, 2.293491, 1, 1, 1, 1, 1,
0.8257006, 0.5934042, 0.8371232, 1, 1, 1, 1, 1,
0.8275698, 0.6937645, 0.808448, 1, 1, 1, 1, 1,
0.8288991, -1.604048, 1.97005, 1, 1, 1, 1, 1,
0.8303877, 0.1758864, 1.065579, 1, 1, 1, 1, 1,
0.8352562, 1.984563, 0.4674066, 1, 1, 1, 1, 1,
0.8355862, 0.1140157, 2.340745, 1, 1, 1, 1, 1,
0.8370941, 1.829622, -0.2057111, 1, 1, 1, 1, 1,
0.8420605, -0.7833482, 3.331323, 1, 1, 1, 1, 1,
0.8436525, 0.5318586, 2.551366, 1, 1, 1, 1, 1,
0.8443284, -0.1674919, 1.208885, 1, 1, 1, 1, 1,
0.8478922, -0.3614917, 0.8631877, 1, 1, 1, 1, 1,
0.8482359, -1.688393, 3.20796, 1, 1, 1, 1, 1,
0.8513264, 1.279538, 1.188373, 1, 1, 1, 1, 1,
0.8514178, 0.5727834, 0.7244143, 1, 1, 1, 1, 1,
0.8553685, 1.475016, -0.3615877, 0, 0, 1, 1, 1,
0.8629472, 0.4093713, 1.681757, 1, 0, 0, 1, 1,
0.8635162, 1.139776, 0.4316892, 1, 0, 0, 1, 1,
0.863596, 1.88974, 1.08402, 1, 0, 0, 1, 1,
0.8637637, 0.24687, 1.760187, 1, 0, 0, 1, 1,
0.8644861, -1.602294, 3.212411, 1, 0, 0, 1, 1,
0.865622, -0.251002, 1.995554, 0, 0, 0, 1, 1,
0.8725608, -0.4676564, 2.925629, 0, 0, 0, 1, 1,
0.877138, -0.71508, 2.945012, 0, 0, 0, 1, 1,
0.8776075, 0.11619, 1.703154, 0, 0, 0, 1, 1,
0.8790516, -1.121762, 1.600701, 0, 0, 0, 1, 1,
0.8793128, 0.1091996, 3.671304, 0, 0, 0, 1, 1,
0.8813889, 1.253285, 0.4186473, 0, 0, 0, 1, 1,
0.887657, -1.834254, 1.717755, 1, 1, 1, 1, 1,
0.8877833, -0.1985559, 1.133803, 1, 1, 1, 1, 1,
0.8921723, -0.3072602, 0.9331369, 1, 1, 1, 1, 1,
0.8981956, -0.21286, 2.073935, 1, 1, 1, 1, 1,
0.9133994, -0.6930931, 3.692541, 1, 1, 1, 1, 1,
0.9134704, -0.2324111, 1.915292, 1, 1, 1, 1, 1,
0.9201712, -1.922289, 3.49629, 1, 1, 1, 1, 1,
0.9211164, 0.1770354, 1.399309, 1, 1, 1, 1, 1,
0.9265031, -0.7861522, 2.082465, 1, 1, 1, 1, 1,
0.9324575, 0.2859467, 1.373077, 1, 1, 1, 1, 1,
0.9330451, 0.6694748, 0.1174043, 1, 1, 1, 1, 1,
0.9363598, 1.309979, -0.1778345, 1, 1, 1, 1, 1,
0.9388547, 0.1085794, 2.616842, 1, 1, 1, 1, 1,
0.939455, -0.148783, 1.470972, 1, 1, 1, 1, 1,
0.9398955, 0.9320907, 0.8754395, 1, 1, 1, 1, 1,
0.9407293, -1.222671, 3.149871, 0, 0, 1, 1, 1,
0.9408454, 0.4669424, -0.1185352, 1, 0, 0, 1, 1,
0.9465266, 1.717418, -0.868611, 1, 0, 0, 1, 1,
0.9493974, -0.4921959, 1.702932, 1, 0, 0, 1, 1,
0.9597766, 0.09637518, 0.1927683, 1, 0, 0, 1, 1,
0.9669273, 0.4334978, 1.66227, 1, 0, 0, 1, 1,
0.9683381, 2.019022, 0.6947899, 0, 0, 0, 1, 1,
0.9822273, 0.1259576, 0.9180679, 0, 0, 0, 1, 1,
0.9838426, -1.435106, 3.23788, 0, 0, 0, 1, 1,
0.9905684, -0.9555436, 2.80287, 0, 0, 0, 1, 1,
0.9954493, -0.8605586, -0.4524578, 0, 0, 0, 1, 1,
0.9963255, -0.4385986, 2.23126, 0, 0, 0, 1, 1,
0.99903, 0.9508761, 2.287555, 0, 0, 0, 1, 1,
0.9990335, 0.1553259, 3.271135, 1, 1, 1, 1, 1,
1.000342, 1.568686, 1.66072, 1, 1, 1, 1, 1,
1.006451, 0.7680022, -0.04387487, 1, 1, 1, 1, 1,
1.01945, -0.6864403, 2.366213, 1, 1, 1, 1, 1,
1.019988, 1.074471, -0.2176663, 1, 1, 1, 1, 1,
1.02027, -0.7468495, 1.964175, 1, 1, 1, 1, 1,
1.024076, -0.4427171, 2.869099, 1, 1, 1, 1, 1,
1.024439, -1.319579, 2.356511, 1, 1, 1, 1, 1,
1.025202, 0.4914596, 0.9326753, 1, 1, 1, 1, 1,
1.025812, 1.678984, 0.2009404, 1, 1, 1, 1, 1,
1.027419, 0.852022, 1.810839, 1, 1, 1, 1, 1,
1.030586, 1.895091, -1.260983, 1, 1, 1, 1, 1,
1.039734, 1.004587, 1.13725, 1, 1, 1, 1, 1,
1.040207, -0.2451685, 1.927848, 1, 1, 1, 1, 1,
1.044177, -0.8645991, 2.110065, 1, 1, 1, 1, 1,
1.049209, 0.143661, 1.761169, 0, 0, 1, 1, 1,
1.050103, 1.178128, 1.33231, 1, 0, 0, 1, 1,
1.052919, -0.4158089, 2.082132, 1, 0, 0, 1, 1,
1.053921, -0.5673897, 3.086613, 1, 0, 0, 1, 1,
1.05459, -2.055525, 2.626559, 1, 0, 0, 1, 1,
1.055401, 0.3094995, 0.6250781, 1, 0, 0, 1, 1,
1.056716, -0.8638831, 3.258196, 0, 0, 0, 1, 1,
1.057169, 0.6740257, 0.7191957, 0, 0, 0, 1, 1,
1.065284, -2.88979, 4.125556, 0, 0, 0, 1, 1,
1.065776, -1.365786, 2.917071, 0, 0, 0, 1, 1,
1.067295, -0.7997808, 2.127001, 0, 0, 0, 1, 1,
1.068177, -0.508607, 1.707179, 0, 0, 0, 1, 1,
1.073882, 0.1000388, 2.366822, 0, 0, 0, 1, 1,
1.07492, -1.124084, 1.639589, 1, 1, 1, 1, 1,
1.079793, -1.535773, 0.3590426, 1, 1, 1, 1, 1,
1.080155, 1.872121, -1.306678, 1, 1, 1, 1, 1,
1.085693, -0.4489092, 2.701393, 1, 1, 1, 1, 1,
1.093656, 1.34093, 0.995796, 1, 1, 1, 1, 1,
1.09665, -1.119843, 2.129928, 1, 1, 1, 1, 1,
1.096791, -0.2074605, 1.515633, 1, 1, 1, 1, 1,
1.10064, -1.394697, 2.303397, 1, 1, 1, 1, 1,
1.103342, -1.180339, 0.8302361, 1, 1, 1, 1, 1,
1.105431, -1.365204, 2.159494, 1, 1, 1, 1, 1,
1.106267, -1.571982, 2.071215, 1, 1, 1, 1, 1,
1.107598, 1.658429, -0.9697542, 1, 1, 1, 1, 1,
1.117382, 0.9972128, -0.04090876, 1, 1, 1, 1, 1,
1.122321, -0.1009171, 2.741951, 1, 1, 1, 1, 1,
1.124492, 0.1819302, 1.641364, 1, 1, 1, 1, 1,
1.129784, -0.3734234, 2.192554, 0, 0, 1, 1, 1,
1.130782, 0.7126682, 1.376913, 1, 0, 0, 1, 1,
1.134756, -1.644053, 2.092025, 1, 0, 0, 1, 1,
1.13772, 1.452568, 1.610312, 1, 0, 0, 1, 1,
1.144378, 1.725412, 1.268762, 1, 0, 0, 1, 1,
1.145534, -2.826857, 2.461979, 1, 0, 0, 1, 1,
1.151842, -0.3759555, 1.871307, 0, 0, 0, 1, 1,
1.152048, -0.9734243, 2.324864, 0, 0, 0, 1, 1,
1.158762, -0.5582826, 3.701398, 0, 0, 0, 1, 1,
1.162014, -0.04323544, 1.138458, 0, 0, 0, 1, 1,
1.175839, 0.9320734, 0.7075686, 0, 0, 0, 1, 1,
1.176861, 1.182185, -0.7648402, 0, 0, 0, 1, 1,
1.179413, -0.2833392, 0.5318367, 0, 0, 0, 1, 1,
1.180347, 0.47656, 0.7703437, 1, 1, 1, 1, 1,
1.183286, 0.8263275, 0.6646365, 1, 1, 1, 1, 1,
1.183355, 1.62001, -0.9208545, 1, 1, 1, 1, 1,
1.183603, 0.2978692, 1.939121, 1, 1, 1, 1, 1,
1.183825, -2.01646, 1.102103, 1, 1, 1, 1, 1,
1.188158, 1.525752, 1.712529, 1, 1, 1, 1, 1,
1.201349, 1.308896, 0.100282, 1, 1, 1, 1, 1,
1.211959, 2.165498, 0.8750753, 1, 1, 1, 1, 1,
1.22184, 0.2262171, 1.645164, 1, 1, 1, 1, 1,
1.225134, -1.053253, 1.624612, 1, 1, 1, 1, 1,
1.228437, -1.951217, 3.72197, 1, 1, 1, 1, 1,
1.236219, -0.8292764, 1.597766, 1, 1, 1, 1, 1,
1.241317, 0.786529, 0.3688433, 1, 1, 1, 1, 1,
1.247797, 0.1034767, -0.9251724, 1, 1, 1, 1, 1,
1.250695, -0.5861281, 1.563597, 1, 1, 1, 1, 1,
1.254967, 0.5720802, 1.053707, 0, 0, 1, 1, 1,
1.260081, -0.1951895, 3.086421, 1, 0, 0, 1, 1,
1.266833, 0.06631315, 3.687259, 1, 0, 0, 1, 1,
1.274006, 1.441721, 1.822049, 1, 0, 0, 1, 1,
1.27762, 0.01299695, 0.180552, 1, 0, 0, 1, 1,
1.278634, -0.2168656, 2.274024, 1, 0, 0, 1, 1,
1.279341, 0.4070491, 1.175918, 0, 0, 0, 1, 1,
1.280363, 0.06246635, 1.361992, 0, 0, 0, 1, 1,
1.287817, -1.675888, 2.63547, 0, 0, 0, 1, 1,
1.290789, -0.5674176, 1.921095, 0, 0, 0, 1, 1,
1.293335, 1.092691, 1.333767, 0, 0, 0, 1, 1,
1.300044, 1.230796, -1.571521, 0, 0, 0, 1, 1,
1.30008, -0.6980106, 2.936899, 0, 0, 0, 1, 1,
1.314309, 0.08281898, 2.663853, 1, 1, 1, 1, 1,
1.318155, 0.001375302, 1.029438, 1, 1, 1, 1, 1,
1.318706, -2.077586, 2.466671, 1, 1, 1, 1, 1,
1.321323, 0.6168344, 0.7896952, 1, 1, 1, 1, 1,
1.331508, 0.3302454, 0.4536089, 1, 1, 1, 1, 1,
1.347071, -0.9213933, 5.039127, 1, 1, 1, 1, 1,
1.351037, -0.3933642, 1.656711, 1, 1, 1, 1, 1,
1.352484, -0.8282775, 1.269472, 1, 1, 1, 1, 1,
1.362253, -1.08594, 2.512067, 1, 1, 1, 1, 1,
1.364548, 0.001917789, 3.097624, 1, 1, 1, 1, 1,
1.37285, -1.180996, 1.893122, 1, 1, 1, 1, 1,
1.373484, 0.577525, 1.485649, 1, 1, 1, 1, 1,
1.374819, 0.6244715, 0.6999922, 1, 1, 1, 1, 1,
1.376983, -1.339039, 3.686311, 1, 1, 1, 1, 1,
1.385805, 0.704006, 0.09681769, 1, 1, 1, 1, 1,
1.393392, -1.647018, 0.6784804, 0, 0, 1, 1, 1,
1.398021, 1.373529, 0.9610233, 1, 0, 0, 1, 1,
1.400596, 0.4510815, 0.6850221, 1, 0, 0, 1, 1,
1.409377, -0.8385772, 1.696887, 1, 0, 0, 1, 1,
1.421392, -0.3610543, 0.4714153, 1, 0, 0, 1, 1,
1.427307, 0.4832851, 0.07985824, 1, 0, 0, 1, 1,
1.441897, -0.2806372, 0.09286807, 0, 0, 0, 1, 1,
1.459727, -0.3615936, 0.6921794, 0, 0, 0, 1, 1,
1.482586, 0.6196781, 0.5304503, 0, 0, 0, 1, 1,
1.499646, -1.685193, 2.537546, 0, 0, 0, 1, 1,
1.501757, -0.9405236, 2.55385, 0, 0, 0, 1, 1,
1.51028, 1.171054, 1.975569, 0, 0, 0, 1, 1,
1.513665, -0.2489544, 1.909679, 0, 0, 0, 1, 1,
1.526332, -1.266254, 3.4795, 1, 1, 1, 1, 1,
1.548087, 1.889541, -0.001822149, 1, 1, 1, 1, 1,
1.560709, -1.798069, 2.676744, 1, 1, 1, 1, 1,
1.56294, -0.03834064, 2.069772, 1, 1, 1, 1, 1,
1.564064, -1.298913, 4.041816, 1, 1, 1, 1, 1,
1.578689, 0.5363234, 1.00406, 1, 1, 1, 1, 1,
1.594491, 1.058472, 2.337707, 1, 1, 1, 1, 1,
1.614347, -0.618151, 3.314788, 1, 1, 1, 1, 1,
1.615802, 1.426285, 2.167254, 1, 1, 1, 1, 1,
1.617436, 1.662483, 0.6465027, 1, 1, 1, 1, 1,
1.617864, -0.2109422, 4.230097, 1, 1, 1, 1, 1,
1.623522, 0.7028819, 0.3784463, 1, 1, 1, 1, 1,
1.635043, -0.1197378, 1.709675, 1, 1, 1, 1, 1,
1.63649, 1.131104, 1.278162, 1, 1, 1, 1, 1,
1.643556, -0.0276312, 2.030112, 1, 1, 1, 1, 1,
1.649256, 0.7293543, -0.1905527, 0, 0, 1, 1, 1,
1.653154, 0.1215399, 2.542505, 1, 0, 0, 1, 1,
1.658556, -0.7056745, 1.189267, 1, 0, 0, 1, 1,
1.662262, -1.202413, 0.9383634, 1, 0, 0, 1, 1,
1.667273, -1.930972, 3.828254, 1, 0, 0, 1, 1,
1.667383, 0.7065529, 0.4438189, 1, 0, 0, 1, 1,
1.66739, 0.9427206, 0.6603459, 0, 0, 0, 1, 1,
1.669219, 0.2952292, -0.5807856, 0, 0, 0, 1, 1,
1.682437, 0.5720461, 0.5922878, 0, 0, 0, 1, 1,
1.722006, 0.08385546, 0.7427157, 0, 0, 0, 1, 1,
1.733714, 0.4588905, 2.089037, 0, 0, 0, 1, 1,
1.762889, -1.443688, 2.362812, 0, 0, 0, 1, 1,
1.775373, -0.05117428, 2.409709, 0, 0, 0, 1, 1,
1.796745, 0.003677113, 1.122691, 1, 1, 1, 1, 1,
1.797558, 0.2446305, 0.4359894, 1, 1, 1, 1, 1,
1.808663, 1.250989, 0.9344814, 1, 1, 1, 1, 1,
1.838134, -0.5056688, 1.88339, 1, 1, 1, 1, 1,
1.863572, -1.414359, 2.138055, 1, 1, 1, 1, 1,
1.885006, 0.6926588, 1.931931, 1, 1, 1, 1, 1,
1.908793, -2.19956, 4.320596, 1, 1, 1, 1, 1,
1.997901, -0.4678496, 1.566972, 1, 1, 1, 1, 1,
2.003941, 0.2307149, 1.128205, 1, 1, 1, 1, 1,
2.005534, -0.77458, 1.398911, 1, 1, 1, 1, 1,
2.015879, 1.12505, 0.03216498, 1, 1, 1, 1, 1,
2.028327, 0.3558427, 3.218869, 1, 1, 1, 1, 1,
2.049348, 0.2405772, 1.977869, 1, 1, 1, 1, 1,
2.115727, 0.2409717, 1.218074, 1, 1, 1, 1, 1,
2.124313, 0.3633008, 1.248987, 1, 1, 1, 1, 1,
2.132749, 0.3383794, -0.1354556, 0, 0, 1, 1, 1,
2.148574, -0.3556129, 1.480395, 1, 0, 0, 1, 1,
2.174529, 0.6972952, 1.002658, 1, 0, 0, 1, 1,
2.187572, 0.5974911, 2.682924, 1, 0, 0, 1, 1,
2.256746, 1.48544, 2.352449, 1, 0, 0, 1, 1,
2.259613, -0.02568898, 0.9238893, 1, 0, 0, 1, 1,
2.276549, 1.57488, 1.995613, 0, 0, 0, 1, 1,
2.28415, -0.499266, 0.4478115, 0, 0, 0, 1, 1,
2.33494, -0.589173, 3.455296, 0, 0, 0, 1, 1,
2.339715, -0.1623275, 1.921478, 0, 0, 0, 1, 1,
2.365244, 0.8641691, 1.061018, 0, 0, 0, 1, 1,
2.416242, 1.176498, 1.309531, 0, 0, 0, 1, 1,
2.421414, 0.2808473, 1.193745, 0, 0, 0, 1, 1,
2.438804, -0.05565944, 3.458297, 1, 1, 1, 1, 1,
2.463677, 0.2273927, 0.287262, 1, 1, 1, 1, 1,
2.494787, 0.1813706, 0.339683, 1, 1, 1, 1, 1,
2.60233, 1.343539, 0.2862003, 1, 1, 1, 1, 1,
2.898075, -1.118046, 0.799701, 1, 1, 1, 1, 1,
3.133325, 0.9674725, -1.096546, 1, 1, 1, 1, 1,
4.23871, 1.231989, -0.5958162, 1, 1, 1, 1, 1
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
var radius = 9.849351;
var distance = 34.59543;
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
mvMatrix.translate( -0.6438266, 0.1007112, 0.1564174 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.59543);
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
