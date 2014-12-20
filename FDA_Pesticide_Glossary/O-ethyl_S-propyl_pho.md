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
-3.442093, 0.9707798, -1.880963, 1, 0, 0, 1,
-3.117337, -0.03128316, 0.1850293, 1, 0.007843138, 0, 1,
-3.043006, -0.1290236, -0.4965507, 1, 0.01176471, 0, 1,
-2.778803, -1.185041, -1.09137, 1, 0.01960784, 0, 1,
-2.400825, -1.12557, -1.253071, 1, 0.02352941, 0, 1,
-2.348922, 0.4737177, -2.262719, 1, 0.03137255, 0, 1,
-2.341676, 0.3076879, -0.2083697, 1, 0.03529412, 0, 1,
-2.309124, 0.3484469, -4.603053, 1, 0.04313726, 0, 1,
-2.284618, -1.129463, -3.059093, 1, 0.04705882, 0, 1,
-2.258662, 1.185797, -1.962692, 1, 0.05490196, 0, 1,
-2.120778, 1.039608, 0.5309717, 1, 0.05882353, 0, 1,
-2.065605, -1.073745, -0.1965352, 1, 0.06666667, 0, 1,
-2.0584, -0.3568358, -1.450329, 1, 0.07058824, 0, 1,
-2.04752, 1.440533, -0.5321957, 1, 0.07843138, 0, 1,
-2.033844, -1.108228, -2.723408, 1, 0.08235294, 0, 1,
-2.002992, 0.7568924, -2.551614, 1, 0.09019608, 0, 1,
-1.995835, 1.673339, -1.960729, 1, 0.09411765, 0, 1,
-1.963498, -1.851666, -2.92922, 1, 0.1019608, 0, 1,
-1.887858, -0.9373468, -1.206778, 1, 0.1098039, 0, 1,
-1.883968, -1.256648, -2.245003, 1, 0.1137255, 0, 1,
-1.86956, -0.06699234, -3.281646, 1, 0.1215686, 0, 1,
-1.841705, 0.9043162, -1.959711, 1, 0.1254902, 0, 1,
-1.828114, 1.873735, -1.87193, 1, 0.1333333, 0, 1,
-1.809369, 2.227435, 0.1999152, 1, 0.1372549, 0, 1,
-1.809084, -0.2211884, -1.722635, 1, 0.145098, 0, 1,
-1.804637, -1.374228, -0.07320949, 1, 0.1490196, 0, 1,
-1.800958, -0.479058, -1.387171, 1, 0.1568628, 0, 1,
-1.79924, -0.8419417, -2.026809, 1, 0.1607843, 0, 1,
-1.786937, -1.514902, -1.225137, 1, 0.1686275, 0, 1,
-1.773802, -0.3774971, -1.271794, 1, 0.172549, 0, 1,
-1.749517, 0.4590249, -1.735481, 1, 0.1803922, 0, 1,
-1.733167, -1.203632, -2.542546, 1, 0.1843137, 0, 1,
-1.719993, -0.5966641, -1.948071, 1, 0.1921569, 0, 1,
-1.699563, -0.3703865, -2.266185, 1, 0.1960784, 0, 1,
-1.678255, -0.3321717, -2.063278, 1, 0.2039216, 0, 1,
-1.657759, 1.893495, -0.5240265, 1, 0.2117647, 0, 1,
-1.657014, 0.5063221, -1.916007, 1, 0.2156863, 0, 1,
-1.637147, 0.4879253, -1.324672, 1, 0.2235294, 0, 1,
-1.636757, 0.4054849, -2.659039, 1, 0.227451, 0, 1,
-1.633867, 2.374696, 1.067091, 1, 0.2352941, 0, 1,
-1.633469, -0.8334141, -2.67081, 1, 0.2392157, 0, 1,
-1.617322, 2.217555, -0.8434322, 1, 0.2470588, 0, 1,
-1.605784, -1.285058, -0.7982465, 1, 0.2509804, 0, 1,
-1.598282, 1.828902, 0.5985664, 1, 0.2588235, 0, 1,
-1.596521, -0.8632112, -3.315191, 1, 0.2627451, 0, 1,
-1.583617, -1.137368, -4.161182, 1, 0.2705882, 0, 1,
-1.566434, -0.1864682, -0.380974, 1, 0.2745098, 0, 1,
-1.559562, -0.1935269, -2.899646, 1, 0.282353, 0, 1,
-1.557008, 0.113995, -0.7622084, 1, 0.2862745, 0, 1,
-1.547646, -0.5608802, -3.248597, 1, 0.2941177, 0, 1,
-1.547304, -1.468373, -3.271078, 1, 0.3019608, 0, 1,
-1.544661, -1.34103, -2.003148, 1, 0.3058824, 0, 1,
-1.53347, -0.9875488, -1.372939, 1, 0.3137255, 0, 1,
-1.532251, -0.9454699, -3.804619, 1, 0.3176471, 0, 1,
-1.526749, -0.3962579, -3.183638, 1, 0.3254902, 0, 1,
-1.524166, -0.7916954, -2.632795, 1, 0.3294118, 0, 1,
-1.519472, 0.5941525, -0.09351898, 1, 0.3372549, 0, 1,
-1.517635, -0.1809482, 0.4122862, 1, 0.3411765, 0, 1,
-1.513502, 0.5407901, -2.006606, 1, 0.3490196, 0, 1,
-1.499741, 0.2240558, -0.9175354, 1, 0.3529412, 0, 1,
-1.492432, 0.9807042, 0.05576667, 1, 0.3607843, 0, 1,
-1.492084, 0.2536054, -0.4893582, 1, 0.3647059, 0, 1,
-1.490669, -1.000828, -2.184733, 1, 0.372549, 0, 1,
-1.468121, -0.3987935, -2.776134, 1, 0.3764706, 0, 1,
-1.444395, -0.9435694, -2.097081, 1, 0.3843137, 0, 1,
-1.441188, -0.6437515, -1.407207, 1, 0.3882353, 0, 1,
-1.439173, 0.5740214, -2.04478, 1, 0.3960784, 0, 1,
-1.438383, 1.9045, 0.0751957, 1, 0.4039216, 0, 1,
-1.436103, -2.323874, -4.585221, 1, 0.4078431, 0, 1,
-1.432056, 0.2834517, -2.612634, 1, 0.4156863, 0, 1,
-1.431089, 1.294773, 0.3297939, 1, 0.4196078, 0, 1,
-1.430521, -0.7783576, -2.272828, 1, 0.427451, 0, 1,
-1.420258, -0.08258817, -1.104851, 1, 0.4313726, 0, 1,
-1.413534, -0.05678242, -0.7967457, 1, 0.4392157, 0, 1,
-1.410476, -0.1227291, -1.978834, 1, 0.4431373, 0, 1,
-1.408358, 0.4753334, -1.404671, 1, 0.4509804, 0, 1,
-1.371467, 0.2099419, -1.668666, 1, 0.454902, 0, 1,
-1.36599, 1.249411, -0.852485, 1, 0.4627451, 0, 1,
-1.356047, 0.5307977, -2.09008, 1, 0.4666667, 0, 1,
-1.353531, 1.213991, -3.205872, 1, 0.4745098, 0, 1,
-1.351847, 1.506083, -0.9694575, 1, 0.4784314, 0, 1,
-1.351093, -0.5170027, -3.257164, 1, 0.4862745, 0, 1,
-1.348202, 1.476154, -1.448574, 1, 0.4901961, 0, 1,
-1.345711, -1.153105, -2.691134, 1, 0.4980392, 0, 1,
-1.344052, 1.111187, 0.2140359, 1, 0.5058824, 0, 1,
-1.339669, -2.027472, -2.892901, 1, 0.509804, 0, 1,
-1.333052, 0.7277117, -0.2890096, 1, 0.5176471, 0, 1,
-1.330813, 0.6474987, -0.6608632, 1, 0.5215687, 0, 1,
-1.327834, 1.072048, -1.162029, 1, 0.5294118, 0, 1,
-1.319829, 0.01633976, -1.448582, 1, 0.5333334, 0, 1,
-1.319079, 0.9758813, -1.215361, 1, 0.5411765, 0, 1,
-1.316121, -0.5164589, -2.214622, 1, 0.5450981, 0, 1,
-1.314407, 1.703529, -1.565257, 1, 0.5529412, 0, 1,
-1.313834, -2.491369, -1.938126, 1, 0.5568628, 0, 1,
-1.313357, -0.1047454, -1.070898, 1, 0.5647059, 0, 1,
-1.311295, 1.571167, -0.5060208, 1, 0.5686275, 0, 1,
-1.309203, 1.346918, -0.2589046, 1, 0.5764706, 0, 1,
-1.308461, -1.291615, -3.087198, 1, 0.5803922, 0, 1,
-1.308265, 1.04947, -2.883043, 1, 0.5882353, 0, 1,
-1.306085, 0.3995072, -1.677334, 1, 0.5921569, 0, 1,
-1.304789, -1.122473, -0.6297075, 1, 0.6, 0, 1,
-1.304746, -0.8279266, -1.366318, 1, 0.6078432, 0, 1,
-1.302893, 0.897732, -1.552913, 1, 0.6117647, 0, 1,
-1.2951, 1.105599, -1.136678, 1, 0.6196079, 0, 1,
-1.29093, 0.7902598, 0.686816, 1, 0.6235294, 0, 1,
-1.288002, -0.3580658, -0.3660716, 1, 0.6313726, 0, 1,
-1.280377, -1.058262, -5.055967, 1, 0.6352941, 0, 1,
-1.268551, -1.109443, -1.075108, 1, 0.6431373, 0, 1,
-1.266479, -0.04156046, -2.094841, 1, 0.6470588, 0, 1,
-1.263811, 1.849877, 0.9363524, 1, 0.654902, 0, 1,
-1.255867, 1.591958, -1.273732, 1, 0.6588235, 0, 1,
-1.255073, 1.082277, -1.595018, 1, 0.6666667, 0, 1,
-1.252866, -1.230959, -1.688447, 1, 0.6705883, 0, 1,
-1.246643, 0.4138258, -1.193057, 1, 0.6784314, 0, 1,
-1.240151, 1.273333, -0.7774355, 1, 0.682353, 0, 1,
-1.238781, 0.715862, -1.702879, 1, 0.6901961, 0, 1,
-1.232512, 0.4277399, -0.3856423, 1, 0.6941177, 0, 1,
-1.229733, -0.9563814, -0.8051165, 1, 0.7019608, 0, 1,
-1.226813, -0.1089951, -1.944055, 1, 0.7098039, 0, 1,
-1.223755, -0.1623078, -1.008307, 1, 0.7137255, 0, 1,
-1.220698, 1.133314, -0.3268143, 1, 0.7215686, 0, 1,
-1.20678, -0.2466592, -2.457877, 1, 0.7254902, 0, 1,
-1.190878, 0.2121593, -2.492307, 1, 0.7333333, 0, 1,
-1.189689, 0.1856374, -0.8743364, 1, 0.7372549, 0, 1,
-1.187573, 0.7169065, -1.792318, 1, 0.7450981, 0, 1,
-1.186776, 1.175756, -0.5029929, 1, 0.7490196, 0, 1,
-1.173881, -0.03081054, -1.869834, 1, 0.7568628, 0, 1,
-1.173373, -1.157132, -3.772202, 1, 0.7607843, 0, 1,
-1.165801, -1.636005, -3.830904, 1, 0.7686275, 0, 1,
-1.160521, 0.1842899, -1.756273, 1, 0.772549, 0, 1,
-1.152812, -0.1665017, -0.5616613, 1, 0.7803922, 0, 1,
-1.152122, -0.7832555, -4.469343, 1, 0.7843137, 0, 1,
-1.148205, -0.06750019, -0.82281, 1, 0.7921569, 0, 1,
-1.146022, -0.4277832, -2.058536, 1, 0.7960784, 0, 1,
-1.142544, -0.5953737, -1.243062, 1, 0.8039216, 0, 1,
-1.133709, 0.4625072, -0.2491069, 1, 0.8117647, 0, 1,
-1.133597, 0.5540681, -1.936047, 1, 0.8156863, 0, 1,
-1.128515, 0.755546, -0.7563581, 1, 0.8235294, 0, 1,
-1.122044, 1.122285, -1.095528, 1, 0.827451, 0, 1,
-1.118575, -0.4462553, -1.506537, 1, 0.8352941, 0, 1,
-1.117435, 1.157269, -0.3080646, 1, 0.8392157, 0, 1,
-1.111225, 1.05697, -1.910838, 1, 0.8470588, 0, 1,
-1.101581, -1.099222, -1.886855, 1, 0.8509804, 0, 1,
-1.094077, 0.8221868, 0.338156, 1, 0.8588235, 0, 1,
-1.087912, 0.4966746, -0.7034556, 1, 0.8627451, 0, 1,
-1.084072, -1.214778, -3.489748, 1, 0.8705882, 0, 1,
-1.078689, -0.7533126, -1.762564, 1, 0.8745098, 0, 1,
-1.077844, -1.269052, -3.225526, 1, 0.8823529, 0, 1,
-1.071795, 0.5884784, -2.200233, 1, 0.8862745, 0, 1,
-1.064836, 0.7073665, -1.892237, 1, 0.8941177, 0, 1,
-1.058004, 0.1004187, -3.457427, 1, 0.8980392, 0, 1,
-1.056303, 1.02453, -1.634934, 1, 0.9058824, 0, 1,
-1.052182, 1.609469, -1.235742, 1, 0.9137255, 0, 1,
-1.044549, -0.8956771, -1.684144, 1, 0.9176471, 0, 1,
-1.038823, -0.4642664, -0.4805798, 1, 0.9254902, 0, 1,
-1.038463, -0.3263058, -3.830628, 1, 0.9294118, 0, 1,
-1.015246, 0.2214269, -1.278552, 1, 0.9372549, 0, 1,
-1.009664, 0.9954715, -1.258301, 1, 0.9411765, 0, 1,
-1.002442, -0.6095153, -1.551693, 1, 0.9490196, 0, 1,
-0.9991202, -0.6006405, -2.206229, 1, 0.9529412, 0, 1,
-0.9946131, -1.750475, -3.375326, 1, 0.9607843, 0, 1,
-0.9931511, 0.6794736, -1.529875, 1, 0.9647059, 0, 1,
-0.9903392, -0.7726818, -3.146871, 1, 0.972549, 0, 1,
-0.9898559, -1.127559, -1.769675, 1, 0.9764706, 0, 1,
-0.9834955, -0.5719824, -1.168823, 1, 0.9843137, 0, 1,
-0.9769058, 1.54245, 0.4605632, 1, 0.9882353, 0, 1,
-0.9768772, -0.04130768, -0.7905732, 1, 0.9960784, 0, 1,
-0.970625, -1.270929, -3.428014, 0.9960784, 1, 0, 1,
-0.9697235, 0.3374627, -0.260632, 0.9921569, 1, 0, 1,
-0.9646212, 0.1054486, -2.606358, 0.9843137, 1, 0, 1,
-0.9604881, -1.105917, -2.407279, 0.9803922, 1, 0, 1,
-0.956091, 0.3424618, -1.504723, 0.972549, 1, 0, 1,
-0.9556437, 0.2079628, -0.8973192, 0.9686275, 1, 0, 1,
-0.9524225, -1.004791, -2.66549, 0.9607843, 1, 0, 1,
-0.9438223, -0.935511, -1.089128, 0.9568627, 1, 0, 1,
-0.9405726, -0.09964612, -1.562037, 0.9490196, 1, 0, 1,
-0.9391125, 1.038225, -1.143795, 0.945098, 1, 0, 1,
-0.9356433, 0.08155107, -0.7502748, 0.9372549, 1, 0, 1,
-0.9351315, 1.103143, -0.5094765, 0.9333333, 1, 0, 1,
-0.9220841, 0.4923915, -2.348449, 0.9254902, 1, 0, 1,
-0.9175397, 1.02908, -1.156054, 0.9215686, 1, 0, 1,
-0.9169732, 0.6669776, 0.008001747, 0.9137255, 1, 0, 1,
-0.9160182, 0.326118, -0.887758, 0.9098039, 1, 0, 1,
-0.9154057, -0.4542719, -0.1929549, 0.9019608, 1, 0, 1,
-0.9109406, -0.4158738, -3.334161, 0.8941177, 1, 0, 1,
-0.910108, 0.5965997, -1.191945, 0.8901961, 1, 0, 1,
-0.9047681, 2.111765, 0.7267857, 0.8823529, 1, 0, 1,
-0.9037095, 0.3229034, -1.03221, 0.8784314, 1, 0, 1,
-0.9002996, -0.4290683, -3.201494, 0.8705882, 1, 0, 1,
-0.8935766, -0.1950296, -2.344557, 0.8666667, 1, 0, 1,
-0.8872841, 0.2133021, -2.483612, 0.8588235, 1, 0, 1,
-0.8864438, -2.293118, -1.193756, 0.854902, 1, 0, 1,
-0.862305, 0.8129501, -1.940717, 0.8470588, 1, 0, 1,
-0.8620195, -1.211478, -2.720489, 0.8431373, 1, 0, 1,
-0.8610647, 0.1495902, -0.684947, 0.8352941, 1, 0, 1,
-0.8587871, -2.788616, -3.334718, 0.8313726, 1, 0, 1,
-0.8549697, 1.077602, -0.06093555, 0.8235294, 1, 0, 1,
-0.8514428, 0.1495726, -1.662596, 0.8196079, 1, 0, 1,
-0.8474424, -0.06523065, -1.158263, 0.8117647, 1, 0, 1,
-0.8451956, 0.3907921, -1.709684, 0.8078431, 1, 0, 1,
-0.8451132, -0.04741947, -2.925557, 0.8, 1, 0, 1,
-0.8446497, 1.254856, -0.3032809, 0.7921569, 1, 0, 1,
-0.8440548, -0.4326783, -2.936369, 0.7882353, 1, 0, 1,
-0.8360798, -0.4483353, -1.085711, 0.7803922, 1, 0, 1,
-0.8340281, -0.6090931, -3.834168, 0.7764706, 1, 0, 1,
-0.830775, 0.1837226, -3.540265, 0.7686275, 1, 0, 1,
-0.8287234, -0.2497217, -2.679806, 0.7647059, 1, 0, 1,
-0.8267355, -1.396316, -2.001402, 0.7568628, 1, 0, 1,
-0.8261789, 0.1062222, -2.685665, 0.7529412, 1, 0, 1,
-0.8239865, -2.160816, -1.948656, 0.7450981, 1, 0, 1,
-0.8223299, -1.294168, -1.971935, 0.7411765, 1, 0, 1,
-0.8200812, -0.1802836, -0.6542901, 0.7333333, 1, 0, 1,
-0.8179212, -0.3718715, -2.291993, 0.7294118, 1, 0, 1,
-0.811545, -0.3723217, -3.816306, 0.7215686, 1, 0, 1,
-0.80988, -0.1847019, -0.5935381, 0.7176471, 1, 0, 1,
-0.8088599, -0.4345821, -2.414228, 0.7098039, 1, 0, 1,
-0.8039538, 1.07472, -0.305229, 0.7058824, 1, 0, 1,
-0.8038818, 0.110069, -1.29598, 0.6980392, 1, 0, 1,
-0.8009247, 0.8115205, 0.1527195, 0.6901961, 1, 0, 1,
-0.8001519, -0.3023257, -2.009161, 0.6862745, 1, 0, 1,
-0.7941703, -2.112634, -1.247572, 0.6784314, 1, 0, 1,
-0.7900113, 0.2773972, -0.574962, 0.6745098, 1, 0, 1,
-0.7882402, -1.592342, -2.669982, 0.6666667, 1, 0, 1,
-0.7878645, 0.861401, -2.248802, 0.6627451, 1, 0, 1,
-0.7850589, -0.3196751, -0.9506621, 0.654902, 1, 0, 1,
-0.7785847, 0.7287657, -2.118359, 0.6509804, 1, 0, 1,
-0.7673992, -0.3984746, -2.16815, 0.6431373, 1, 0, 1,
-0.7639991, -0.4025462, -2.560888, 0.6392157, 1, 0, 1,
-0.7603895, -0.243181, -0.4780915, 0.6313726, 1, 0, 1,
-0.7599164, -0.1922939, -1.577591, 0.627451, 1, 0, 1,
-0.749974, 0.2505162, -1.632103, 0.6196079, 1, 0, 1,
-0.7476863, -0.2666024, -2.833166, 0.6156863, 1, 0, 1,
-0.7466362, -0.1948473, -1.379033, 0.6078432, 1, 0, 1,
-0.7441459, 0.7162917, -2.500563, 0.6039216, 1, 0, 1,
-0.7436979, 1.489639, 0.02348052, 0.5960785, 1, 0, 1,
-0.7420081, 0.1455322, -1.460262, 0.5882353, 1, 0, 1,
-0.7330564, -0.1232765, -1.621855, 0.5843138, 1, 0, 1,
-0.7280118, 1.779497, -0.6181512, 0.5764706, 1, 0, 1,
-0.7273882, 1.312071, -1.764721, 0.572549, 1, 0, 1,
-0.7217465, -1.497596, -1.874333, 0.5647059, 1, 0, 1,
-0.7142338, 0.4797549, -0.07484727, 0.5607843, 1, 0, 1,
-0.7085537, 0.3988355, -0.3980665, 0.5529412, 1, 0, 1,
-0.708365, -0.5467083, -2.852807, 0.5490196, 1, 0, 1,
-0.7076531, -0.1006497, -0.4147152, 0.5411765, 1, 0, 1,
-0.7008892, 0.06983057, -1.45839, 0.5372549, 1, 0, 1,
-0.6987788, 0.9187936, -1.558632, 0.5294118, 1, 0, 1,
-0.6940255, -0.8961077, -2.396879, 0.5254902, 1, 0, 1,
-0.6928986, -1.33645, -0.9060474, 0.5176471, 1, 0, 1,
-0.6895326, 0.1719529, -0.2132257, 0.5137255, 1, 0, 1,
-0.6816161, 0.227323, -0.3051482, 0.5058824, 1, 0, 1,
-0.6815292, 0.607725, -1.112519, 0.5019608, 1, 0, 1,
-0.6798196, 1.304922, 0.5862832, 0.4941176, 1, 0, 1,
-0.6797846, 0.5626511, -0.9522001, 0.4862745, 1, 0, 1,
-0.6724384, -1.233029, -1.733499, 0.4823529, 1, 0, 1,
-0.6704438, 0.6355788, -2.53659, 0.4745098, 1, 0, 1,
-0.6648048, -0.07287096, -2.042135, 0.4705882, 1, 0, 1,
-0.6638478, -1.733917, -3.303419, 0.4627451, 1, 0, 1,
-0.6615074, -0.943395, -2.392793, 0.4588235, 1, 0, 1,
-0.6596418, -0.2554869, -1.864254, 0.4509804, 1, 0, 1,
-0.6579452, 0.508287, -0.3527982, 0.4470588, 1, 0, 1,
-0.6576093, 0.2288402, -1.781766, 0.4392157, 1, 0, 1,
-0.6566919, 0.9494205, -0.9352862, 0.4352941, 1, 0, 1,
-0.6561148, 0.7607393, -0.03327779, 0.427451, 1, 0, 1,
-0.6517024, 0.1446487, -2.111607, 0.4235294, 1, 0, 1,
-0.6462798, 0.983899, -0.4586318, 0.4156863, 1, 0, 1,
-0.6436536, -0.03166902, -3.628674, 0.4117647, 1, 0, 1,
-0.6432409, 0.9271926, -0.09811963, 0.4039216, 1, 0, 1,
-0.6431688, 1.083108, 0.3636043, 0.3960784, 1, 0, 1,
-0.6375746, -0.9616302, -2.402503, 0.3921569, 1, 0, 1,
-0.6357477, -1.229416, -2.772407, 0.3843137, 1, 0, 1,
-0.6329131, 0.3941475, -0.6643919, 0.3803922, 1, 0, 1,
-0.624418, 1.175167, -2.286969, 0.372549, 1, 0, 1,
-0.6240777, -0.9677772, -2.853837, 0.3686275, 1, 0, 1,
-0.6229218, 0.1240523, -1.042574, 0.3607843, 1, 0, 1,
-0.6192589, 1.91323, 0.38973, 0.3568628, 1, 0, 1,
-0.6175131, 0.4222661, -1.766347, 0.3490196, 1, 0, 1,
-0.6166112, 1.636431, -1.596477, 0.345098, 1, 0, 1,
-0.6110172, -0.06182367, -3.004328, 0.3372549, 1, 0, 1,
-0.609687, 1.624765, 0.1748232, 0.3333333, 1, 0, 1,
-0.6094504, -0.3189136, -3.657, 0.3254902, 1, 0, 1,
-0.6037918, -0.06126683, -2.214139, 0.3215686, 1, 0, 1,
-0.6013882, -0.6428612, -3.099753, 0.3137255, 1, 0, 1,
-0.6008586, 0.7564, 0.07497891, 0.3098039, 1, 0, 1,
-0.6005967, 0.6957048, -2.690425, 0.3019608, 1, 0, 1,
-0.5976754, 0.8156609, 0.5606125, 0.2941177, 1, 0, 1,
-0.5975651, -0.1468794, -2.98344, 0.2901961, 1, 0, 1,
-0.5897127, -0.07581669, -1.044882, 0.282353, 1, 0, 1,
-0.5806839, 0.6975252, -1.293032, 0.2784314, 1, 0, 1,
-0.576254, 1.273526, -1.461035, 0.2705882, 1, 0, 1,
-0.5716201, 1.550674, -0.8622928, 0.2666667, 1, 0, 1,
-0.5715548, -0.1431251, -0.70166, 0.2588235, 1, 0, 1,
-0.5672253, 1.155719, 0.4514402, 0.254902, 1, 0, 1,
-0.565873, 0.6384187, -1.395895, 0.2470588, 1, 0, 1,
-0.5636905, 0.1601238, -1.047965, 0.2431373, 1, 0, 1,
-0.5622472, 0.6350864, -0.2858685, 0.2352941, 1, 0, 1,
-0.5612928, -0.6484614, -4.054518, 0.2313726, 1, 0, 1,
-0.5579715, -0.1690934, -1.715129, 0.2235294, 1, 0, 1,
-0.5573695, -1.60037, -2.963428, 0.2196078, 1, 0, 1,
-0.5565125, 1.635756, -1.05152, 0.2117647, 1, 0, 1,
-0.5455019, 0.05371535, -3.57699, 0.2078431, 1, 0, 1,
-0.5441162, -0.8421699, -2.505713, 0.2, 1, 0, 1,
-0.5422955, 1.32981, 0.5521953, 0.1921569, 1, 0, 1,
-0.5393777, -0.5993089, -0.8705608, 0.1882353, 1, 0, 1,
-0.5384035, 0.4497389, -2.265676, 0.1803922, 1, 0, 1,
-0.537769, 0.2111048, -0.08965131, 0.1764706, 1, 0, 1,
-0.5373796, 0.6767949, -0.6231159, 0.1686275, 1, 0, 1,
-0.5306287, 0.2278887, -1.409538, 0.1647059, 1, 0, 1,
-0.5213802, 1.235556, -1.393385, 0.1568628, 1, 0, 1,
-0.5206318, 0.5858595, -2.275947, 0.1529412, 1, 0, 1,
-0.519672, 0.1890619, -0.558165, 0.145098, 1, 0, 1,
-0.5192887, 0.6107579, -2.517967, 0.1411765, 1, 0, 1,
-0.5176273, -0.0714744, -0.9898148, 0.1333333, 1, 0, 1,
-0.5168602, 1.447187, -1.175915, 0.1294118, 1, 0, 1,
-0.5144808, 0.5183027, 0.01751075, 0.1215686, 1, 0, 1,
-0.5124828, -0.2177642, -2.195369, 0.1176471, 1, 0, 1,
-0.5114952, 0.1874811, -0.3185697, 0.1098039, 1, 0, 1,
-0.5107028, -0.1566753, -2.747259, 0.1058824, 1, 0, 1,
-0.5075995, -1.929204, -2.845281, 0.09803922, 1, 0, 1,
-0.5005621, -0.9593764, -2.856891, 0.09019608, 1, 0, 1,
-0.5003403, 0.6892185, -1.098346, 0.08627451, 1, 0, 1,
-0.4986483, -1.44369, -3.401379, 0.07843138, 1, 0, 1,
-0.4941882, -0.5703349, -3.046861, 0.07450981, 1, 0, 1,
-0.4927624, 0.4576899, -0.9506302, 0.06666667, 1, 0, 1,
-0.4927205, -0.4463813, -1.841452, 0.0627451, 1, 0, 1,
-0.4909706, 0.04375362, -0.8958387, 0.05490196, 1, 0, 1,
-0.4899844, -0.1047742, -0.9821891, 0.05098039, 1, 0, 1,
-0.4892778, -0.7881765, -1.927296, 0.04313726, 1, 0, 1,
-0.4891879, 0.611652, 0.3389888, 0.03921569, 1, 0, 1,
-0.4889, -0.1720383, -2.237503, 0.03137255, 1, 0, 1,
-0.4885448, 0.6700681, -0.5871826, 0.02745098, 1, 0, 1,
-0.4850657, 1.633124, 0.2727361, 0.01960784, 1, 0, 1,
-0.4783734, -0.008919187, -2.084657, 0.01568628, 1, 0, 1,
-0.4767673, 0.3979144, -0.3877162, 0.007843138, 1, 0, 1,
-0.476557, -0.8421086, -2.427319, 0.003921569, 1, 0, 1,
-0.4653361, 1.022821, -1.77611, 0, 1, 0.003921569, 1,
-0.4649445, 0.5759867, -0.8216122, 0, 1, 0.01176471, 1,
-0.4644803, 1.758554, -0.3990655, 0, 1, 0.01568628, 1,
-0.4633202, -2.81768, -2.664698, 0, 1, 0.02352941, 1,
-0.4629921, 0.1596518, -1.165284, 0, 1, 0.02745098, 1,
-0.4589386, 0.5747671, -1.185089, 0, 1, 0.03529412, 1,
-0.4574248, 1.394897, -1.538859, 0, 1, 0.03921569, 1,
-0.4569727, -0.2516887, -3.114997, 0, 1, 0.04705882, 1,
-0.4544759, -1.732262, -2.645754, 0, 1, 0.05098039, 1,
-0.454118, -0.1414966, -3.674796, 0, 1, 0.05882353, 1,
-0.452745, -0.4337981, -1.556931, 0, 1, 0.0627451, 1,
-0.4506188, 0.3303284, -1.171212, 0, 1, 0.07058824, 1,
-0.4479749, -0.9246553, -2.419541, 0, 1, 0.07450981, 1,
-0.4458904, 0.9010509, 0.6751609, 0, 1, 0.08235294, 1,
-0.4374435, 1.097838, -1.862633, 0, 1, 0.08627451, 1,
-0.4367129, 0.2967471, -1.214896, 0, 1, 0.09411765, 1,
-0.4358448, -2.149868, -4.255626, 0, 1, 0.1019608, 1,
-0.4308995, -0.09733261, -2.713883, 0, 1, 0.1058824, 1,
-0.4305581, -0.5299584, -2.453556, 0, 1, 0.1137255, 1,
-0.4282841, 0.1226294, -1.962936, 0, 1, 0.1176471, 1,
-0.4280707, -0.06905021, -1.796182, 0, 1, 0.1254902, 1,
-0.4262634, -1.404393, -3.611125, 0, 1, 0.1294118, 1,
-0.4257607, -0.3585412, -2.314703, 0, 1, 0.1372549, 1,
-0.4246592, 0.7695547, 0.1908234, 0, 1, 0.1411765, 1,
-0.4244557, -1.071273, -3.562731, 0, 1, 0.1490196, 1,
-0.4230142, -1.834163, -3.238489, 0, 1, 0.1529412, 1,
-0.420577, 0.574227, 0.9095289, 0, 1, 0.1607843, 1,
-0.4202099, -0.9436212, -2.887307, 0, 1, 0.1647059, 1,
-0.4188215, 0.4502357, -1.517294, 0, 1, 0.172549, 1,
-0.4130292, 0.819885, -1.308549, 0, 1, 0.1764706, 1,
-0.4093829, -1.320073, -2.96518, 0, 1, 0.1843137, 1,
-0.4092148, -2.36953, -1.140391, 0, 1, 0.1882353, 1,
-0.4067009, 0.5053001, -1.641003, 0, 1, 0.1960784, 1,
-0.4028166, -1.538965, -2.236182, 0, 1, 0.2039216, 1,
-0.4013352, 1.49678, -0.03562204, 0, 1, 0.2078431, 1,
-0.3951335, -1.08603, -4.031308, 0, 1, 0.2156863, 1,
-0.3939056, 0.8047417, -1.069816, 0, 1, 0.2196078, 1,
-0.3925677, 0.08925715, -1.035178, 0, 1, 0.227451, 1,
-0.391897, 0.6120841, -1.329897, 0, 1, 0.2313726, 1,
-0.390567, -0.5214483, -1.808321, 0, 1, 0.2392157, 1,
-0.3877619, 0.6832426, -0.5483493, 0, 1, 0.2431373, 1,
-0.3840482, 0.8840961, -0.2290735, 0, 1, 0.2509804, 1,
-0.3821326, -0.4469042, -4.17413, 0, 1, 0.254902, 1,
-0.3805312, -1.025672, -1.308462, 0, 1, 0.2627451, 1,
-0.3795052, -1.067743, -2.462451, 0, 1, 0.2666667, 1,
-0.3759282, -0.5900109, -2.67431, 0, 1, 0.2745098, 1,
-0.3668139, -1.141773, -2.970284, 0, 1, 0.2784314, 1,
-0.3659894, 1.309985, -0.2962761, 0, 1, 0.2862745, 1,
-0.3655571, 0.9759274, -0.1346681, 0, 1, 0.2901961, 1,
-0.3628944, 1.894368, -1.460574, 0, 1, 0.2980392, 1,
-0.3628446, 0.4505748, -0.3223917, 0, 1, 0.3058824, 1,
-0.3609762, -0.3051643, -2.598752, 0, 1, 0.3098039, 1,
-0.355008, -0.9680742, -0.9700695, 0, 1, 0.3176471, 1,
-0.352605, 1.360457, 0.7161303, 0, 1, 0.3215686, 1,
-0.3508628, -0.425092, -3.936745, 0, 1, 0.3294118, 1,
-0.3505191, 0.6049961, -1.638847, 0, 1, 0.3333333, 1,
-0.349499, -0.3405452, -0.8238828, 0, 1, 0.3411765, 1,
-0.3489948, -0.6685983, -3.825863, 0, 1, 0.345098, 1,
-0.3475564, 0.03862683, -1.345795, 0, 1, 0.3529412, 1,
-0.347119, -0.08977794, -1.997533, 0, 1, 0.3568628, 1,
-0.3431976, 0.5101506, -0.05200459, 0, 1, 0.3647059, 1,
-0.3422063, -0.02988393, -2.300446, 0, 1, 0.3686275, 1,
-0.3382864, 0.01133327, -0.5769683, 0, 1, 0.3764706, 1,
-0.3329903, -0.540956, -3.273094, 0, 1, 0.3803922, 1,
-0.3292527, 0.2222977, -2.787804, 0, 1, 0.3882353, 1,
-0.3276038, 0.5870473, -1.998628, 0, 1, 0.3921569, 1,
-0.3218171, -0.1669685, -2.627919, 0, 1, 0.4, 1,
-0.3203342, -1.55004, -4.480978, 0, 1, 0.4078431, 1,
-0.3174414, 1.674018, -1.770121, 0, 1, 0.4117647, 1,
-0.3134866, -0.7535939, -4.520158, 0, 1, 0.4196078, 1,
-0.3108906, -0.4299759, -3.290171, 0, 1, 0.4235294, 1,
-0.3065901, -0.5214032, -2.066366, 0, 1, 0.4313726, 1,
-0.2997157, -1.435616, -2.480446, 0, 1, 0.4352941, 1,
-0.2940225, 0.3324853, -1.259509, 0, 1, 0.4431373, 1,
-0.2933863, -0.7918183, -3.002803, 0, 1, 0.4470588, 1,
-0.2933812, 0.4008628, -0.4952265, 0, 1, 0.454902, 1,
-0.2881694, -0.3723158, -1.347844, 0, 1, 0.4588235, 1,
-0.2881335, -0.4721409, -2.836038, 0, 1, 0.4666667, 1,
-0.2844959, -0.9436088, -2.625257, 0, 1, 0.4705882, 1,
-0.2808522, -0.420442, -2.428791, 0, 1, 0.4784314, 1,
-0.2799784, -2.323383, -2.224358, 0, 1, 0.4823529, 1,
-0.2796575, 0.4951023, -1.050676, 0, 1, 0.4901961, 1,
-0.2795852, -1.075769, -2.70315, 0, 1, 0.4941176, 1,
-0.2795228, 0.2183346, -2.368649, 0, 1, 0.5019608, 1,
-0.2771792, -1.476953, -5.405183, 0, 1, 0.509804, 1,
-0.276632, -1.151664, -2.994182, 0, 1, 0.5137255, 1,
-0.2749071, 0.1690785, 0.01492826, 0, 1, 0.5215687, 1,
-0.2748843, 1.005349, -0.02580179, 0, 1, 0.5254902, 1,
-0.2715162, -0.7650984, -2.50258, 0, 1, 0.5333334, 1,
-0.2640129, 0.2771714, -2.635964, 0, 1, 0.5372549, 1,
-0.2629542, 0.5747379, 0.03036311, 0, 1, 0.5450981, 1,
-0.2628392, 0.4883313, -0.4033936, 0, 1, 0.5490196, 1,
-0.2614185, -0.6576712, -3.043093, 0, 1, 0.5568628, 1,
-0.2600995, -0.2901195, -2.334071, 0, 1, 0.5607843, 1,
-0.2581499, -0.15724, -2.284311, 0, 1, 0.5686275, 1,
-0.2557269, -1.343683, -3.294425, 0, 1, 0.572549, 1,
-0.2492777, -0.6160796, -2.384975, 0, 1, 0.5803922, 1,
-0.2482639, 1.637201, 1.886853, 0, 1, 0.5843138, 1,
-0.2446559, -1.567352, -2.107667, 0, 1, 0.5921569, 1,
-0.2445712, 0.3289898, -0.06245823, 0, 1, 0.5960785, 1,
-0.2420946, -1.56259, -3.964409, 0, 1, 0.6039216, 1,
-0.2394312, 2.287225, -0.1691217, 0, 1, 0.6117647, 1,
-0.2386336, -1.98161, -3.866233, 0, 1, 0.6156863, 1,
-0.2305277, 0.3809242, -0.9812418, 0, 1, 0.6235294, 1,
-0.2273965, -1.954901, -2.627822, 0, 1, 0.627451, 1,
-0.2265879, 0.8622074, -0.8856909, 0, 1, 0.6352941, 1,
-0.2262569, -0.3592287, -1.611037, 0, 1, 0.6392157, 1,
-0.2240292, 0.2151854, 0.2173774, 0, 1, 0.6470588, 1,
-0.2238291, 0.4167502, -0.5705059, 0, 1, 0.6509804, 1,
-0.2194952, -0.8861574, -3.617103, 0, 1, 0.6588235, 1,
-0.2176133, -0.9663259, -2.701318, 0, 1, 0.6627451, 1,
-0.2155714, -1.733421, -1.381889, 0, 1, 0.6705883, 1,
-0.2110358, 0.3423021, 0.288844, 0, 1, 0.6745098, 1,
-0.2096521, -1.78269, -3.457409, 0, 1, 0.682353, 1,
-0.2088219, 1.109107, 0.4451866, 0, 1, 0.6862745, 1,
-0.2083521, 1.117211, -0.3055594, 0, 1, 0.6941177, 1,
-0.2077862, 0.5392651, -2.432524, 0, 1, 0.7019608, 1,
-0.2053437, 0.0126629, -2.027184, 0, 1, 0.7058824, 1,
-0.1993938, 0.1758606, -1.477421, 0, 1, 0.7137255, 1,
-0.1924867, 0.1016662, -1.798777, 0, 1, 0.7176471, 1,
-0.1921303, 0.7640983, -0.1410402, 0, 1, 0.7254902, 1,
-0.1858862, -0.1484073, -1.072762, 0, 1, 0.7294118, 1,
-0.1856049, 0.2288531, -1.677757, 0, 1, 0.7372549, 1,
-0.1832589, -0.07656363, -3.005352, 0, 1, 0.7411765, 1,
-0.1828821, -0.0268433, -0.3201196, 0, 1, 0.7490196, 1,
-0.1756747, 0.9163899, -0.2565, 0, 1, 0.7529412, 1,
-0.1733383, -2.054484, -2.190137, 0, 1, 0.7607843, 1,
-0.1728185, 1.493668, -0.9060717, 0, 1, 0.7647059, 1,
-0.1727168, -1.182515, -2.529588, 0, 1, 0.772549, 1,
-0.1688467, 1.554556, -0.7920569, 0, 1, 0.7764706, 1,
-0.164742, -0.471347, -1.055901, 0, 1, 0.7843137, 1,
-0.1646494, 1.12617, -0.9209698, 0, 1, 0.7882353, 1,
-0.1633683, -0.7151635, -1.500131, 0, 1, 0.7960784, 1,
-0.1599062, 0.9484279, -0.3995762, 0, 1, 0.8039216, 1,
-0.1553516, -1.228632, -2.414307, 0, 1, 0.8078431, 1,
-0.1517758, -0.6551056, -2.607238, 0, 1, 0.8156863, 1,
-0.1491401, 0.8930601, -0.7528121, 0, 1, 0.8196079, 1,
-0.1435452, -1.131166, -3.83462, 0, 1, 0.827451, 1,
-0.1405363, 1.915548, 1.784788, 0, 1, 0.8313726, 1,
-0.1395901, 0.3505099, -1.694638, 0, 1, 0.8392157, 1,
-0.1350799, 1.000551, -1.580029, 0, 1, 0.8431373, 1,
-0.1325893, -2.069402, -3.430627, 0, 1, 0.8509804, 1,
-0.1320791, 0.6522793, -2.965183, 0, 1, 0.854902, 1,
-0.130062, -1.265829, -3.161368, 0, 1, 0.8627451, 1,
-0.1298845, -1.190262, -4.081174, 0, 1, 0.8666667, 1,
-0.1266448, 1.492246, -0.5450468, 0, 1, 0.8745098, 1,
-0.1235542, -1.447412, -4.695516, 0, 1, 0.8784314, 1,
-0.1234893, -2.504975, -3.155015, 0, 1, 0.8862745, 1,
-0.1222689, 0.1489381, -2.124289, 0, 1, 0.8901961, 1,
-0.1212992, 0.8010741, -0.6797857, 0, 1, 0.8980392, 1,
-0.1133174, 0.385744, -0.6795469, 0, 1, 0.9058824, 1,
-0.1061212, -0.4617267, -2.797308, 0, 1, 0.9098039, 1,
-0.1039742, -1.064245, -3.158211, 0, 1, 0.9176471, 1,
-0.09999534, 1.650712, 1.430832, 0, 1, 0.9215686, 1,
-0.09579395, -0.1702309, -2.805781, 0, 1, 0.9294118, 1,
-0.09527472, 1.098114, -1.226191, 0, 1, 0.9333333, 1,
-0.09523269, 0.8585879, 0.1975216, 0, 1, 0.9411765, 1,
-0.0948073, -1.144428, -3.838617, 0, 1, 0.945098, 1,
-0.09403613, 0.2535861, -0.07618731, 0, 1, 0.9529412, 1,
-0.09238882, -1.344635, -2.896811, 0, 1, 0.9568627, 1,
-0.08940522, 1.052866, -0.8412042, 0, 1, 0.9647059, 1,
-0.08676112, -2.280169, -2.120223, 0, 1, 0.9686275, 1,
-0.08553838, 0.1825499, 0.6694191, 0, 1, 0.9764706, 1,
-0.08457185, -1.080459, -2.73256, 0, 1, 0.9803922, 1,
-0.07606235, 0.01119204, -1.31611, 0, 1, 0.9882353, 1,
-0.07075352, -0.1056337, -2.376619, 0, 1, 0.9921569, 1,
-0.06829664, 0.8607023, -0.2321547, 0, 1, 1, 1,
-0.06716082, 0.7623083, -1.049398, 0, 0.9921569, 1, 1,
-0.05904647, -0.4864877, -3.152298, 0, 0.9882353, 1, 1,
-0.05661828, 0.3336488, 0.8351083, 0, 0.9803922, 1, 1,
-0.05528345, 1.521031, -0.9269824, 0, 0.9764706, 1, 1,
-0.05471303, 0.5211515, 1.13811, 0, 0.9686275, 1, 1,
-0.05432954, -0.7643767, -3.208175, 0, 0.9647059, 1, 1,
-0.0530238, -0.2346079, -3.674923, 0, 0.9568627, 1, 1,
-0.0490083, -0.1340044, -4.682703, 0, 0.9529412, 1, 1,
-0.04709671, 0.8556541, -1.203617, 0, 0.945098, 1, 1,
-0.04413252, -0.9400216, -4.121416, 0, 0.9411765, 1, 1,
-0.04372865, -0.8730475, -3.277182, 0, 0.9333333, 1, 1,
-0.0412818, -0.01201003, -2.570462, 0, 0.9294118, 1, 1,
-0.03944024, -0.1432774, -2.230587, 0, 0.9215686, 1, 1,
-0.03815302, 2.28363, 0.3368609, 0, 0.9176471, 1, 1,
-0.03781433, -0.4863567, -2.32952, 0, 0.9098039, 1, 1,
-0.03391846, -0.4231455, -3.20292, 0, 0.9058824, 1, 1,
-0.03209823, 0.04309288, -0.5992189, 0, 0.8980392, 1, 1,
-0.03136376, -0.4620653, -3.888609, 0, 0.8901961, 1, 1,
-0.02869159, -0.7458693, -2.936516, 0, 0.8862745, 1, 1,
-0.01569926, -0.9900071, -1.343841, 0, 0.8784314, 1, 1,
-0.0151352, -1.169866, -4.789281, 0, 0.8745098, 1, 1,
-0.01418735, 0.3987373, -1.268783, 0, 0.8666667, 1, 1,
-0.008242046, -0.1035542, -3.614058, 0, 0.8627451, 1, 1,
-0.00586975, 0.3574149, -0.2497017, 0, 0.854902, 1, 1,
-0.001892848, 1.635282, -0.3034142, 0, 0.8509804, 1, 1,
-0.001026921, 0.9877283, -0.1361003, 0, 0.8431373, 1, 1,
0.003044341, -1.982104, 3.038853, 0, 0.8392157, 1, 1,
0.007578398, 1.218735, -1.201896, 0, 0.8313726, 1, 1,
0.008008854, 0.736176, 0.5812607, 0, 0.827451, 1, 1,
0.00946572, -0.2899317, 2.630218, 0, 0.8196079, 1, 1,
0.01140037, 0.772872, 1.571847, 0, 0.8156863, 1, 1,
0.01261351, -0.6491617, 3.38598, 0, 0.8078431, 1, 1,
0.01851762, 0.3838379, 0.3684571, 0, 0.8039216, 1, 1,
0.02189807, -1.390983, 1.23802, 0, 0.7960784, 1, 1,
0.0249076, 0.6056753, 0.840268, 0, 0.7882353, 1, 1,
0.02606103, -0.1537557, 2.327906, 0, 0.7843137, 1, 1,
0.02616673, -1.439904, 1.923348, 0, 0.7764706, 1, 1,
0.0288091, -0.9913014, 3.369672, 0, 0.772549, 1, 1,
0.0288502, -0.3343339, 3.5056, 0, 0.7647059, 1, 1,
0.03198846, 0.6812856, 1.550238, 0, 0.7607843, 1, 1,
0.03502348, -0.09725097, 3.258849, 0, 0.7529412, 1, 1,
0.03605359, -0.346311, 3.922724, 0, 0.7490196, 1, 1,
0.03615451, -0.1297153, 1.620289, 0, 0.7411765, 1, 1,
0.037466, 1.711262, 0.8858939, 0, 0.7372549, 1, 1,
0.03932902, -0.7514203, 3.660752, 0, 0.7294118, 1, 1,
0.0397648, 0.47354, -2.410585, 0, 0.7254902, 1, 1,
0.04590735, 0.9115155, -0.9490103, 0, 0.7176471, 1, 1,
0.04659336, -0.1743706, 3.721933, 0, 0.7137255, 1, 1,
0.04958983, 0.8481308, 0.9819859, 0, 0.7058824, 1, 1,
0.05150197, -0.1421784, 1.917662, 0, 0.6980392, 1, 1,
0.05384305, -0.6112543, 3.29442, 0, 0.6941177, 1, 1,
0.05564627, 0.8184029, -0.06833442, 0, 0.6862745, 1, 1,
0.06062484, -1.450278, 1.28984, 0, 0.682353, 1, 1,
0.06165604, -0.2059878, 2.817235, 0, 0.6745098, 1, 1,
0.07025301, -0.771562, 2.876389, 0, 0.6705883, 1, 1,
0.07065491, -0.7505715, 4.23407, 0, 0.6627451, 1, 1,
0.07460219, -1.053893, 3.193207, 0, 0.6588235, 1, 1,
0.0768107, -0.7242534, 3.053269, 0, 0.6509804, 1, 1,
0.07866764, 3.289929, -1.705322, 0, 0.6470588, 1, 1,
0.07904091, -0.0935123, 3.94852, 0, 0.6392157, 1, 1,
0.07992117, -0.4581591, 3.683359, 0, 0.6352941, 1, 1,
0.08050133, 0.04927516, 0.5008124, 0, 0.627451, 1, 1,
0.08216036, 0.2384945, -0.655709, 0, 0.6235294, 1, 1,
0.08278292, 0.3358977, -0.8139825, 0, 0.6156863, 1, 1,
0.08596101, 0.8885772, -0.08870964, 0, 0.6117647, 1, 1,
0.0865138, -0.2544239, 2.703188, 0, 0.6039216, 1, 1,
0.08805873, 0.7661749, 0.6473403, 0, 0.5960785, 1, 1,
0.08837358, 0.5371727, 0.8679621, 0, 0.5921569, 1, 1,
0.09085011, -1.058842, 2.861192, 0, 0.5843138, 1, 1,
0.09347003, 0.6635978, -1.289773, 0, 0.5803922, 1, 1,
0.09467896, 0.3683138, -0.05377972, 0, 0.572549, 1, 1,
0.09505625, 3.001841, 0.5807184, 0, 0.5686275, 1, 1,
0.09595047, 1.618548, -1.732287, 0, 0.5607843, 1, 1,
0.0975597, 0.7686391, -0.1274007, 0, 0.5568628, 1, 1,
0.1006064, 2.381022, 0.6608905, 0, 0.5490196, 1, 1,
0.1080861, 0.196275, 1.556052, 0, 0.5450981, 1, 1,
0.1081714, 0.9202807, 1.885699, 0, 0.5372549, 1, 1,
0.1100157, -2.431039, 4.227239, 0, 0.5333334, 1, 1,
0.1114875, -0.6548926, 3.109309, 0, 0.5254902, 1, 1,
0.1119055, -0.3246729, 3.965382, 0, 0.5215687, 1, 1,
0.1143907, -0.2864265, 3.945531, 0, 0.5137255, 1, 1,
0.1192906, 1.222417, 1.321173, 0, 0.509804, 1, 1,
0.12161, 0.5267735, -1.981626, 0, 0.5019608, 1, 1,
0.1243547, -1.132915, 4.064863, 0, 0.4941176, 1, 1,
0.1280471, -0.587851, 2.555088, 0, 0.4901961, 1, 1,
0.131111, 0.862844, -2.025982, 0, 0.4823529, 1, 1,
0.1313425, -0.6928332, 2.720448, 0, 0.4784314, 1, 1,
0.1336049, 1.598563, -0.3107214, 0, 0.4705882, 1, 1,
0.1355039, 0.8923045, -0.7831406, 0, 0.4666667, 1, 1,
0.1363099, -0.2076258, 2.54844, 0, 0.4588235, 1, 1,
0.1370225, 1.80907, -0.3637299, 0, 0.454902, 1, 1,
0.1382811, 1.159492, 0.6083765, 0, 0.4470588, 1, 1,
0.15492, 0.8052099, 1.615503, 0, 0.4431373, 1, 1,
0.1555882, 0.8186941, -0.6628197, 0, 0.4352941, 1, 1,
0.1612721, -0.4868888, 4.024728, 0, 0.4313726, 1, 1,
0.1631579, 1.059112, 0.81533, 0, 0.4235294, 1, 1,
0.1672337, 0.7604536, 0.5518643, 0, 0.4196078, 1, 1,
0.1689998, -0.639456, 3.238563, 0, 0.4117647, 1, 1,
0.170917, 1.534155, 0.7338133, 0, 0.4078431, 1, 1,
0.1785073, -1.252543, 3.487463, 0, 0.4, 1, 1,
0.1850322, 0.894576, -0.7463349, 0, 0.3921569, 1, 1,
0.1852738, -0.7530283, 3.137412, 0, 0.3882353, 1, 1,
0.1908976, 0.5947106, -0.5791369, 0, 0.3803922, 1, 1,
0.1936242, 0.06098001, 1.688835, 0, 0.3764706, 1, 1,
0.1961625, -1.18588, 3.983005, 0, 0.3686275, 1, 1,
0.1985999, 0.635614, -0.6410247, 0, 0.3647059, 1, 1,
0.2041183, 1.028665, -0.4686195, 0, 0.3568628, 1, 1,
0.2084171, 1.088686, -2.059604, 0, 0.3529412, 1, 1,
0.2092453, -0.04768116, 3.194555, 0, 0.345098, 1, 1,
0.2097579, -1.273572, 2.026214, 0, 0.3411765, 1, 1,
0.212308, 1.284257, 0.1334577, 0, 0.3333333, 1, 1,
0.2182218, 1.986787, -0.8673281, 0, 0.3294118, 1, 1,
0.2260944, -0.5928237, 1.002653, 0, 0.3215686, 1, 1,
0.2289239, 1.680791, 0.8614715, 0, 0.3176471, 1, 1,
0.2306464, 1.069731, -1.639052, 0, 0.3098039, 1, 1,
0.2334163, -0.3142509, 2.120495, 0, 0.3058824, 1, 1,
0.240827, 0.6301123, 0.3008459, 0, 0.2980392, 1, 1,
0.2430165, 0.6696286, -0.8816577, 0, 0.2901961, 1, 1,
0.2434077, -1.639035, 4.322255, 0, 0.2862745, 1, 1,
0.2441741, 0.401555, 0.2855834, 0, 0.2784314, 1, 1,
0.2475053, 1.261234, 0.9431326, 0, 0.2745098, 1, 1,
0.249131, 2.031966, 1.131925, 0, 0.2666667, 1, 1,
0.2522147, 0.4149991, 0.5536948, 0, 0.2627451, 1, 1,
0.2541889, 0.3350955, -0.1079562, 0, 0.254902, 1, 1,
0.255462, 0.860518, 0.5120059, 0, 0.2509804, 1, 1,
0.25771, -1.488995, 3.549391, 0, 0.2431373, 1, 1,
0.259256, -0.7396984, 0.6222914, 0, 0.2392157, 1, 1,
0.261584, 0.490519, 0.2272641, 0, 0.2313726, 1, 1,
0.2655494, -0.4398439, 2.532913, 0, 0.227451, 1, 1,
0.2656001, -0.2077394, 0.2704858, 0, 0.2196078, 1, 1,
0.2674592, -0.9370133, 3.125756, 0, 0.2156863, 1, 1,
0.2700929, 1.456779, 0.3127848, 0, 0.2078431, 1, 1,
0.2705211, 0.5177517, 1.086922, 0, 0.2039216, 1, 1,
0.2772357, 0.3725359, 1.053254, 0, 0.1960784, 1, 1,
0.2853018, 1.345745, 0.1249155, 0, 0.1882353, 1, 1,
0.2860546, -0.001732198, -0.4188436, 0, 0.1843137, 1, 1,
0.2874746, -0.3784606, 2.57985, 0, 0.1764706, 1, 1,
0.2883692, 0.138293, 2.845167, 0, 0.172549, 1, 1,
0.2974649, -0.2601671, 2.301342, 0, 0.1647059, 1, 1,
0.2976134, -0.339594, 3.543577, 0, 0.1607843, 1, 1,
0.2990812, 0.6315868, 1.746908, 0, 0.1529412, 1, 1,
0.3005891, 0.9929216, -0.6978281, 0, 0.1490196, 1, 1,
0.3040799, 0.432488, -0.4327374, 0, 0.1411765, 1, 1,
0.3048623, 0.7276724, -0.1918003, 0, 0.1372549, 1, 1,
0.3060174, -0.5216832, 3.045271, 0, 0.1294118, 1, 1,
0.3061264, 1.38137, 0.7228845, 0, 0.1254902, 1, 1,
0.307874, 1.007459, 0.07867949, 0, 0.1176471, 1, 1,
0.3100744, -1.266624, 2.906811, 0, 0.1137255, 1, 1,
0.3156049, -0.6524739, 2.508218, 0, 0.1058824, 1, 1,
0.3162386, 1.18371, 0.2408226, 0, 0.09803922, 1, 1,
0.3246397, 0.8957804, 0.2488063, 0, 0.09411765, 1, 1,
0.3274904, 0.7421978, 0.9244504, 0, 0.08627451, 1, 1,
0.3302096, 0.4307476, 1.445035, 0, 0.08235294, 1, 1,
0.3308361, 0.9863405, 0.6258302, 0, 0.07450981, 1, 1,
0.3315435, -1.682027, 1.875323, 0, 0.07058824, 1, 1,
0.3385488, 0.3540182, 0.4576021, 0, 0.0627451, 1, 1,
0.3408169, -1.839752, 4.618656, 0, 0.05882353, 1, 1,
0.3474262, -0.08562748, 1.900057, 0, 0.05098039, 1, 1,
0.3488591, -0.1553005, 1.411331, 0, 0.04705882, 1, 1,
0.3503505, -0.9364159, 3.306611, 0, 0.03921569, 1, 1,
0.3524984, -1.134757, 3.686445, 0, 0.03529412, 1, 1,
0.3528034, 0.3788362, 1.256702, 0, 0.02745098, 1, 1,
0.3533869, -0.5296673, 2.915667, 0, 0.02352941, 1, 1,
0.3563833, -0.3433121, 2.252081, 0, 0.01568628, 1, 1,
0.3567005, 0.9477452, -0.4019575, 0, 0.01176471, 1, 1,
0.3581716, 0.8567045, 1.003331, 0, 0.003921569, 1, 1,
0.3613957, -0.7449214, 2.708541, 0.003921569, 0, 1, 1,
0.3618858, -0.3111825, 1.439601, 0.007843138, 0, 1, 1,
0.3622581, -0.6914757, 2.103466, 0.01568628, 0, 1, 1,
0.3630315, -1.746291, 3.768809, 0.01960784, 0, 1, 1,
0.3634863, -0.789456, 2.655645, 0.02745098, 0, 1, 1,
0.366805, -1.19291, 2.983517, 0.03137255, 0, 1, 1,
0.3697827, 0.1811188, -0.5222227, 0.03921569, 0, 1, 1,
0.386246, -0.3674248, 4.392786, 0.04313726, 0, 1, 1,
0.3878703, 0.9058985, 1.411629, 0.05098039, 0, 1, 1,
0.3881245, -1.42189, 2.152017, 0.05490196, 0, 1, 1,
0.3899594, -1.942776, 5.361102, 0.0627451, 0, 1, 1,
0.393988, 0.2318947, 1.155044, 0.06666667, 0, 1, 1,
0.3945681, -0.3094763, 2.933443, 0.07450981, 0, 1, 1,
0.4018396, -1.425195, 1.580339, 0.07843138, 0, 1, 1,
0.4019202, -0.7668338, 4.81371, 0.08627451, 0, 1, 1,
0.4024129, -0.2457949, 1.382671, 0.09019608, 0, 1, 1,
0.4073826, -1.87432, 2.656517, 0.09803922, 0, 1, 1,
0.4086794, 0.1797473, 1.698466, 0.1058824, 0, 1, 1,
0.4091277, -0.04337895, 1.807855, 0.1098039, 0, 1, 1,
0.4099001, -0.9911959, 2.041716, 0.1176471, 0, 1, 1,
0.4106303, 0.2441379, 1.806471, 0.1215686, 0, 1, 1,
0.4114102, 1.456672, 0.9453831, 0.1294118, 0, 1, 1,
0.416619, 0.7435957, -0.0354854, 0.1333333, 0, 1, 1,
0.4227069, -0.08845578, 1.175308, 0.1411765, 0, 1, 1,
0.4250179, -0.7632186, 1.867488, 0.145098, 0, 1, 1,
0.4256341, 0.821734, 0.5398492, 0.1529412, 0, 1, 1,
0.427708, -0.801922, 1.0346, 0.1568628, 0, 1, 1,
0.4366208, -0.4859484, -0.2195401, 0.1647059, 0, 1, 1,
0.437025, 0.2595547, -0.2007782, 0.1686275, 0, 1, 1,
0.4448509, 0.7358853, -0.4644854, 0.1764706, 0, 1, 1,
0.4457943, -0.2791736, 2.311472, 0.1803922, 0, 1, 1,
0.4459525, 0.1655942, 1.472185, 0.1882353, 0, 1, 1,
0.4540191, 1.411947, -1.697351, 0.1921569, 0, 1, 1,
0.4576173, -0.8233828, 2.98764, 0.2, 0, 1, 1,
0.4608878, -0.4970026, 1.751517, 0.2078431, 0, 1, 1,
0.4669034, 1.613176, 1.409503, 0.2117647, 0, 1, 1,
0.4690617, 0.98994, -1.535301, 0.2196078, 0, 1, 1,
0.4771565, -1.06834, 3.169279, 0.2235294, 0, 1, 1,
0.4778067, -0.1488013, 0.3885803, 0.2313726, 0, 1, 1,
0.478474, -0.3807337, 2.619462, 0.2352941, 0, 1, 1,
0.4790713, 1.454263, 0.7860581, 0.2431373, 0, 1, 1,
0.4791166, -0.02788417, 3.547662, 0.2470588, 0, 1, 1,
0.480411, -0.9071761, 1.812116, 0.254902, 0, 1, 1,
0.4810081, -0.06845537, 2.161745, 0.2588235, 0, 1, 1,
0.4853998, 1.012321, 1.972378, 0.2666667, 0, 1, 1,
0.4929069, 0.2278835, 0.9660031, 0.2705882, 0, 1, 1,
0.4931458, -2.294351, 2.030861, 0.2784314, 0, 1, 1,
0.4943234, 0.7867573, 1.328548, 0.282353, 0, 1, 1,
0.5004798, 1.300225, 2.137629, 0.2901961, 0, 1, 1,
0.5062037, 0.8656065, -1.462591, 0.2941177, 0, 1, 1,
0.509052, -1.697595, 2.523111, 0.3019608, 0, 1, 1,
0.5126942, -0.5167277, 1.965454, 0.3098039, 0, 1, 1,
0.5132949, -0.4223706, 2.189726, 0.3137255, 0, 1, 1,
0.5229888, -1.073084, 3.219451, 0.3215686, 0, 1, 1,
0.5261104, -0.4859471, 2.325777, 0.3254902, 0, 1, 1,
0.5374224, 0.004308768, 2.586098, 0.3333333, 0, 1, 1,
0.5429083, 0.5318955, 0.4974487, 0.3372549, 0, 1, 1,
0.5431491, 0.5353206, -1.513315, 0.345098, 0, 1, 1,
0.5461807, 0.1359946, 1.193356, 0.3490196, 0, 1, 1,
0.5477639, 0.3451637, -0.9639584, 0.3568628, 0, 1, 1,
0.5589348, -0.4304293, 2.939225, 0.3607843, 0, 1, 1,
0.5604905, -0.7300787, 2.334857, 0.3686275, 0, 1, 1,
0.5780243, 1.145471, -1.094103, 0.372549, 0, 1, 1,
0.5789255, -0.8947061, 1.823423, 0.3803922, 0, 1, 1,
0.5813736, -0.5558513, 2.362715, 0.3843137, 0, 1, 1,
0.5814811, 0.00949168, 2.215966, 0.3921569, 0, 1, 1,
0.5819864, -0.4531485, 2.962675, 0.3960784, 0, 1, 1,
0.5825652, -0.9306351, 2.701884, 0.4039216, 0, 1, 1,
0.5835509, -1.2006, 2.477779, 0.4117647, 0, 1, 1,
0.5837844, -1.37157, 2.156517, 0.4156863, 0, 1, 1,
0.5853606, 0.1755464, 1.517609, 0.4235294, 0, 1, 1,
0.5890926, 0.3309322, 0.6039276, 0.427451, 0, 1, 1,
0.5958921, -0.3030711, 2.387006, 0.4352941, 0, 1, 1,
0.5975924, -0.664208, 1.759781, 0.4392157, 0, 1, 1,
0.600953, -0.5031834, 1.813682, 0.4470588, 0, 1, 1,
0.6037759, 0.6724035, -1.219163, 0.4509804, 0, 1, 1,
0.60658, -0.5209515, 1.798796, 0.4588235, 0, 1, 1,
0.6066358, -1.591842, 2.619559, 0.4627451, 0, 1, 1,
0.608128, -0.09896319, 0.770261, 0.4705882, 0, 1, 1,
0.6092713, 1.620303, 0.4162112, 0.4745098, 0, 1, 1,
0.6117644, 0.6047887, 1.660821, 0.4823529, 0, 1, 1,
0.6127207, 0.1585494, 1.671012, 0.4862745, 0, 1, 1,
0.6135188, -0.527381, 3.038419, 0.4941176, 0, 1, 1,
0.6159218, 0.985119, 2.006137, 0.5019608, 0, 1, 1,
0.6159514, 0.6944519, -0.2599152, 0.5058824, 0, 1, 1,
0.6196035, -0.1142035, 2.857365, 0.5137255, 0, 1, 1,
0.6362669, 0.8108128, 0.7486071, 0.5176471, 0, 1, 1,
0.6425719, -2.112492, 3.254713, 0.5254902, 0, 1, 1,
0.6444067, -0.3577102, 3.91657, 0.5294118, 0, 1, 1,
0.6481022, 0.5842938, -0.6106421, 0.5372549, 0, 1, 1,
0.6503327, 2.291538, -0.6921304, 0.5411765, 0, 1, 1,
0.6508316, 0.8950576, 1.404309, 0.5490196, 0, 1, 1,
0.6509885, 0.5209913, 0.5929452, 0.5529412, 0, 1, 1,
0.6527118, -0.4973733, 0.5693377, 0.5607843, 0, 1, 1,
0.6544168, -1.225003, 3.048692, 0.5647059, 0, 1, 1,
0.6663415, 0.5587273, -0.8369839, 0.572549, 0, 1, 1,
0.6672868, 1.49382, 2.769035, 0.5764706, 0, 1, 1,
0.667503, 0.350292, 0.667381, 0.5843138, 0, 1, 1,
0.6682026, -0.8133033, 4.338804, 0.5882353, 0, 1, 1,
0.6686246, 2.041308, 0.7753785, 0.5960785, 0, 1, 1,
0.6689067, 1.277208, -1.042791, 0.6039216, 0, 1, 1,
0.6715989, 1.370306, 1.82692, 0.6078432, 0, 1, 1,
0.6769089, -1.239282, 3.01876, 0.6156863, 0, 1, 1,
0.6796965, 1.368357, 0.9367052, 0.6196079, 0, 1, 1,
0.6821086, -0.3513714, 2.205177, 0.627451, 0, 1, 1,
0.6825616, -0.2667394, 1.085527, 0.6313726, 0, 1, 1,
0.6889467, 0.7087274, 2.542794, 0.6392157, 0, 1, 1,
0.6896718, 0.1765096, 0.7505166, 0.6431373, 0, 1, 1,
0.6904907, -0.7342716, 2.61502, 0.6509804, 0, 1, 1,
0.7067189, 0.1560132, 1.071211, 0.654902, 0, 1, 1,
0.7073881, 1.913009, 1.418607, 0.6627451, 0, 1, 1,
0.7192175, 0.7522336, 0.5237902, 0.6666667, 0, 1, 1,
0.7227617, -0.494473, 1.955882, 0.6745098, 0, 1, 1,
0.7253319, 1.645365, 1.77386, 0.6784314, 0, 1, 1,
0.7294315, 1.061835, 1.294781, 0.6862745, 0, 1, 1,
0.7324433, 0.9866357, -0.1487319, 0.6901961, 0, 1, 1,
0.7365516, -0.3812466, 1.918334, 0.6980392, 0, 1, 1,
0.7495952, -0.7399215, 1.750513, 0.7058824, 0, 1, 1,
0.7537266, -0.8031666, 2.260098, 0.7098039, 0, 1, 1,
0.764513, -0.1857171, 2.846624, 0.7176471, 0, 1, 1,
0.7677628, 0.2052964, 2.443578, 0.7215686, 0, 1, 1,
0.7687477, -1.030707, 2.514052, 0.7294118, 0, 1, 1,
0.7688296, -0.4821977, 2.156421, 0.7333333, 0, 1, 1,
0.7722443, 0.1967449, 1.827022, 0.7411765, 0, 1, 1,
0.7834098, 1.747749, 0.6273515, 0.7450981, 0, 1, 1,
0.7895788, -0.1487317, -0.1233405, 0.7529412, 0, 1, 1,
0.7940426, -0.6673016, 2.074082, 0.7568628, 0, 1, 1,
0.7945392, -1.121491, 1.166339, 0.7647059, 0, 1, 1,
0.7980368, 0.3136263, 1.414791, 0.7686275, 0, 1, 1,
0.8113881, 0.5696784, 0.1803894, 0.7764706, 0, 1, 1,
0.8160376, -0.4172157, 1.341289, 0.7803922, 0, 1, 1,
0.8167129, 1.168419, 0.747349, 0.7882353, 0, 1, 1,
0.818504, -1.291132, 3.102123, 0.7921569, 0, 1, 1,
0.8193998, 0.1769819, 0.1299375, 0.8, 0, 1, 1,
0.8298241, -0.5306423, 1.506128, 0.8078431, 0, 1, 1,
0.8401832, -1.243725, 2.487024, 0.8117647, 0, 1, 1,
0.8459262, -0.5892357, 2.114659, 0.8196079, 0, 1, 1,
0.8514736, -0.9437693, 2.933997, 0.8235294, 0, 1, 1,
0.853401, 2.303428, -1.077553, 0.8313726, 0, 1, 1,
0.8567736, -0.7066961, 1.986711, 0.8352941, 0, 1, 1,
0.8598983, -1.016629, 1.760248, 0.8431373, 0, 1, 1,
0.8605137, 0.1229383, 1.45477, 0.8470588, 0, 1, 1,
0.8614378, 0.2344628, 2.737046, 0.854902, 0, 1, 1,
0.8641433, 0.0241023, 1.414726, 0.8588235, 0, 1, 1,
0.868897, 1.495174, 0.2695164, 0.8666667, 0, 1, 1,
0.8714712, -0.4514655, 1.718312, 0.8705882, 0, 1, 1,
0.8725289, -0.9771482, 1.553364, 0.8784314, 0, 1, 1,
0.8742875, 1.504062, 1.427523, 0.8823529, 0, 1, 1,
0.8828317, -1.05314, 1.357796, 0.8901961, 0, 1, 1,
0.8832712, -0.8766155, 1.688049, 0.8941177, 0, 1, 1,
0.8847512, 0.3499562, 0.980986, 0.9019608, 0, 1, 1,
0.8891189, 0.7597901, 1.355842, 0.9098039, 0, 1, 1,
0.8892542, 0.523217, 1.8127, 0.9137255, 0, 1, 1,
0.8918362, 0.1915949, 1.17418, 0.9215686, 0, 1, 1,
0.8945973, 0.0004371188, 3.432444, 0.9254902, 0, 1, 1,
0.8980399, -0.3480954, 1.198937, 0.9333333, 0, 1, 1,
0.9007467, 0.2767064, 0.9362735, 0.9372549, 0, 1, 1,
0.9168454, 0.0375586, 1.607781, 0.945098, 0, 1, 1,
0.918223, 0.7167646, 0.4623527, 0.9490196, 0, 1, 1,
0.9338878, 1.429692, -0.001927102, 0.9568627, 0, 1, 1,
0.9340596, 1.028677, 1.651769, 0.9607843, 0, 1, 1,
0.9362279, -0.4260746, 1.534828, 0.9686275, 0, 1, 1,
0.9438429, -1.153535, 3.665648, 0.972549, 0, 1, 1,
0.9452662, -0.426209, 0.9906992, 0.9803922, 0, 1, 1,
0.9478015, -0.3160819, 0.9532915, 0.9843137, 0, 1, 1,
0.9549556, 0.06821112, 2.090779, 0.9921569, 0, 1, 1,
0.9575841, 0.4838079, 0.4461022, 0.9960784, 0, 1, 1,
0.9603268, 1.222708, 2.155075, 1, 0, 0.9960784, 1,
0.9616663, -0.7355753, 3.709418, 1, 0, 0.9882353, 1,
0.9656481, 0.9855824, 0.2284086, 1, 0, 0.9843137, 1,
0.9690157, 0.6659032, 0.930603, 1, 0, 0.9764706, 1,
0.9849267, -0.8827389, 3.586835, 1, 0, 0.972549, 1,
0.9854084, 1.406849, -1.489384, 1, 0, 0.9647059, 1,
0.9895926, -0.7483076, 2.791673, 1, 0, 0.9607843, 1,
0.9923913, 1.511967, 0.6517559, 1, 0, 0.9529412, 1,
0.9939032, -0.6361479, 2.647806, 1, 0, 0.9490196, 1,
0.9997698, 0.7649, 0.3319117, 1, 0, 0.9411765, 1,
1.000564, 0.2285781, 0.8400247, 1, 0, 0.9372549, 1,
1.007554, 1.588468, 1.88379, 1, 0, 0.9294118, 1,
1.014257, -1.044511, 3.324478, 1, 0, 0.9254902, 1,
1.025285, -0.8491364, 3.202296, 1, 0, 0.9176471, 1,
1.03159, 0.9010746, 0.08383458, 1, 0, 0.9137255, 1,
1.038676, -0.1850162, 1.64683, 1, 0, 0.9058824, 1,
1.040859, 0.1038093, 1.890577, 1, 0, 0.9019608, 1,
1.044963, -0.05402539, 1.217431, 1, 0, 0.8941177, 1,
1.047066, -0.1164868, 0.41332, 1, 0, 0.8862745, 1,
1.049346, -0.1403181, 1.505843, 1, 0, 0.8823529, 1,
1.059003, 0.8310715, 1.098118, 1, 0, 0.8745098, 1,
1.059812, 0.6208414, 1.237249, 1, 0, 0.8705882, 1,
1.06199, 1.385741, 0.5747809, 1, 0, 0.8627451, 1,
1.063227, -0.891327, 3.563712, 1, 0, 0.8588235, 1,
1.071988, 0.7598268, 1.857616, 1, 0, 0.8509804, 1,
1.081078, -0.7891571, 0.6776861, 1, 0, 0.8470588, 1,
1.087946, 1.346528, 1.11489, 1, 0, 0.8392157, 1,
1.093508, -0.08347649, 1.668456, 1, 0, 0.8352941, 1,
1.094229, 0.5500991, 0.178517, 1, 0, 0.827451, 1,
1.099211, -1.062835, 3.29409, 1, 0, 0.8235294, 1,
1.101191, -0.9247274, 3.809902, 1, 0, 0.8156863, 1,
1.111425, 0.3068293, 0.4322452, 1, 0, 0.8117647, 1,
1.111524, 1.119241, -0.1535023, 1, 0, 0.8039216, 1,
1.112222, -1.045021, 2.764691, 1, 0, 0.7960784, 1,
1.113234, -1.325654, 3.111495, 1, 0, 0.7921569, 1,
1.118882, -0.2033471, 2.792659, 1, 0, 0.7843137, 1,
1.121272, 0.1322354, 1.512698, 1, 0, 0.7803922, 1,
1.126607, -1.183561, 2.169035, 1, 0, 0.772549, 1,
1.129864, 0.8900027, 0.0800496, 1, 0, 0.7686275, 1,
1.13091, 2.194612, -0.1427609, 1, 0, 0.7607843, 1,
1.132626, -0.5407523, 0.6528499, 1, 0, 0.7568628, 1,
1.139842, -0.5325136, 0.02602688, 1, 0, 0.7490196, 1,
1.142142, 0.9395767, 1.815129, 1, 0, 0.7450981, 1,
1.143923, -0.8966095, 1.757719, 1, 0, 0.7372549, 1,
1.148679, -0.3171973, 2.76075, 1, 0, 0.7333333, 1,
1.15405, 0.3159524, 2.417293, 1, 0, 0.7254902, 1,
1.157086, -0.08927593, 2.264908, 1, 0, 0.7215686, 1,
1.162643, 1.392424, 0.3239779, 1, 0, 0.7137255, 1,
1.165086, 0.3544619, 2.519297, 1, 0, 0.7098039, 1,
1.178801, 0.06860851, 1.685403, 1, 0, 0.7019608, 1,
1.181293, -0.4019372, 3.224044, 1, 0, 0.6941177, 1,
1.182407, -1.268475, 2.024869, 1, 0, 0.6901961, 1,
1.186209, -1.432527, 1.668033, 1, 0, 0.682353, 1,
1.187698, 0.434742, -0.1827315, 1, 0, 0.6784314, 1,
1.191516, -1.340215, 1.083292, 1, 0, 0.6705883, 1,
1.192218, 0.07238974, 1.718345, 1, 0, 0.6666667, 1,
1.193372, 0.3280556, 1.764153, 1, 0, 0.6588235, 1,
1.194246, 0.3595226, 1.509728, 1, 0, 0.654902, 1,
1.195066, -1.23661, 2.246873, 1, 0, 0.6470588, 1,
1.200163, 0.2944775, 2.136714, 1, 0, 0.6431373, 1,
1.206917, 0.9742991, 1.611835, 1, 0, 0.6352941, 1,
1.211928, -1.195285, 3.78669, 1, 0, 0.6313726, 1,
1.221746, -0.8767015, 1.621216, 1, 0, 0.6235294, 1,
1.231031, -0.8033967, -0.4191604, 1, 0, 0.6196079, 1,
1.235238, 0.18433, 0.7283566, 1, 0, 0.6117647, 1,
1.235439, -0.2491896, 3.044297, 1, 0, 0.6078432, 1,
1.242006, 0.3912999, 2.613277, 1, 0, 0.6, 1,
1.246678, -0.08445933, 1.531669, 1, 0, 0.5921569, 1,
1.263176, 0.4393649, 1.093287, 1, 0, 0.5882353, 1,
1.271603, -0.1335665, 1.712749, 1, 0, 0.5803922, 1,
1.280769, -0.05421857, 1.734117, 1, 0, 0.5764706, 1,
1.282136, -0.9458966, 2.363917, 1, 0, 0.5686275, 1,
1.283935, -0.09434693, 0.443686, 1, 0, 0.5647059, 1,
1.293975, -0.4659706, 2.127536, 1, 0, 0.5568628, 1,
1.297275, -0.6320859, 3.156452, 1, 0, 0.5529412, 1,
1.315224, 1.226184, 0.2970794, 1, 0, 0.5450981, 1,
1.319187, 0.9918399, 0.8396326, 1, 0, 0.5411765, 1,
1.319332, -0.4121473, 3.090411, 1, 0, 0.5333334, 1,
1.3332, -0.2127312, 0.8031554, 1, 0, 0.5294118, 1,
1.33498, -0.08438198, 0.4189784, 1, 0, 0.5215687, 1,
1.347432, 1.680034, 0.8857317, 1, 0, 0.5176471, 1,
1.356161, 0.1711486, 4.262669, 1, 0, 0.509804, 1,
1.356357, -0.1341226, -0.6122715, 1, 0, 0.5058824, 1,
1.358561, 0.5026718, 1.173675, 1, 0, 0.4980392, 1,
1.366055, 0.05829285, 1.922132, 1, 0, 0.4901961, 1,
1.370424, -0.7836292, 2.928293, 1, 0, 0.4862745, 1,
1.371724, -0.862772, 1.711444, 1, 0, 0.4784314, 1,
1.381237, -1.253095, 1.599923, 1, 0, 0.4745098, 1,
1.383184, -0.1838959, 3.998399, 1, 0, 0.4666667, 1,
1.387506, 0.5179288, 1.639618, 1, 0, 0.4627451, 1,
1.403786, 1.032641, 2.172667, 1, 0, 0.454902, 1,
1.414219, -0.6611381, 3.011385, 1, 0, 0.4509804, 1,
1.417524, -0.0465797, 1.475683, 1, 0, 0.4431373, 1,
1.423038, 1.851974, 0.5397774, 1, 0, 0.4392157, 1,
1.435182, 0.2139982, 1.426505, 1, 0, 0.4313726, 1,
1.45175, 0.1316376, 1.720884, 1, 0, 0.427451, 1,
1.452967, 0.729142, 1.24854, 1, 0, 0.4196078, 1,
1.456136, -1.366744, 1.232097, 1, 0, 0.4156863, 1,
1.459408, -1.35479, 1.341174, 1, 0, 0.4078431, 1,
1.470523, -0.5153769, 2.44348, 1, 0, 0.4039216, 1,
1.484056, -1.042086, 1.929844, 1, 0, 0.3960784, 1,
1.497978, -0.1722069, -0.003751172, 1, 0, 0.3882353, 1,
1.501895, -0.2700323, 0.7646393, 1, 0, 0.3843137, 1,
1.510438, -0.5069608, 2.897256, 1, 0, 0.3764706, 1,
1.512255, 0.6958702, 1.192477, 1, 0, 0.372549, 1,
1.524055, -1.187289, 4.513881, 1, 0, 0.3647059, 1,
1.524619, 0.3523278, 1.712557, 1, 0, 0.3607843, 1,
1.530164, -0.2799343, 2.529149, 1, 0, 0.3529412, 1,
1.534265, -1.050073, 3.46359, 1, 0, 0.3490196, 1,
1.547847, 2.123682, -2.002971, 1, 0, 0.3411765, 1,
1.550414, 0.3083431, 2.156145, 1, 0, 0.3372549, 1,
1.55682, 1.639901, 0.2278324, 1, 0, 0.3294118, 1,
1.562923, -1.221635, 0.3961023, 1, 0, 0.3254902, 1,
1.56673, -0.9431047, 2.185047, 1, 0, 0.3176471, 1,
1.570293, 0.7142901, 0.9567959, 1, 0, 0.3137255, 1,
1.571163, -0.05075982, 1.158646, 1, 0, 0.3058824, 1,
1.581007, 0.753927, -0.2437288, 1, 0, 0.2980392, 1,
1.581841, 0.8586008, 2.533317, 1, 0, 0.2941177, 1,
1.584148, 0.1069943, 1.664507, 1, 0, 0.2862745, 1,
1.659142, -0.6856012, 3.258883, 1, 0, 0.282353, 1,
1.66102, -0.8097907, 1.586358, 1, 0, 0.2745098, 1,
1.673517, -0.5954887, 0.7213596, 1, 0, 0.2705882, 1,
1.679836, 0.7871903, -0.3746925, 1, 0, 0.2627451, 1,
1.689378, -1.165218, 2.29331, 1, 0, 0.2588235, 1,
1.696592, -0.1036666, 1.891227, 1, 0, 0.2509804, 1,
1.71257, -2.052899, 2.867793, 1, 0, 0.2470588, 1,
1.741714, -1.15339, 1.367616, 1, 0, 0.2392157, 1,
1.74694, 0.7871096, 0.5729931, 1, 0, 0.2352941, 1,
1.75622, 0.3434116, 0.9196883, 1, 0, 0.227451, 1,
1.757746, 0.4913058, 0.3805991, 1, 0, 0.2235294, 1,
1.77594, -1.019906, 3.386491, 1, 0, 0.2156863, 1,
1.784715, 0.6898944, 2.163854, 1, 0, 0.2117647, 1,
1.789122, -1.079708, 2.372495, 1, 0, 0.2039216, 1,
1.811855, -0.158334, 1.326806, 1, 0, 0.1960784, 1,
1.823533, 1.496586, 2.131436, 1, 0, 0.1921569, 1,
1.844719, -0.1770952, 0.3252909, 1, 0, 0.1843137, 1,
1.874705, -0.5697331, 1.725892, 1, 0, 0.1803922, 1,
1.882296, 0.7767389, 1.475594, 1, 0, 0.172549, 1,
1.896944, 0.413886, 0.814983, 1, 0, 0.1686275, 1,
1.902281, -0.7389599, 3.476292, 1, 0, 0.1607843, 1,
1.940534, -1.866094, 2.264153, 1, 0, 0.1568628, 1,
1.945951, -0.4263771, 3.625676, 1, 0, 0.1490196, 1,
1.961906, 0.7381363, 1.850831, 1, 0, 0.145098, 1,
1.964729, -0.1245593, 1.274509, 1, 0, 0.1372549, 1,
1.986177, -0.1097202, 0.6922219, 1, 0, 0.1333333, 1,
1.999129, 0.1753856, 1.474634, 1, 0, 0.1254902, 1,
2.031708, 0.2555372, 3.030659, 1, 0, 0.1215686, 1,
2.036501, -1.056007, 2.615084, 1, 0, 0.1137255, 1,
2.07552, 0.922335, 2.664518, 1, 0, 0.1098039, 1,
2.155634, -1.821704, 3.589963, 1, 0, 0.1019608, 1,
2.164882, -0.2764844, 0.7797647, 1, 0, 0.09411765, 1,
2.168249, 0.04349961, 2.287011, 1, 0, 0.09019608, 1,
2.214509, -1.918364, 2.765585, 1, 0, 0.08235294, 1,
2.227116, -1.087761, 2.496484, 1, 0, 0.07843138, 1,
2.345445, 1.147059, 0.088172, 1, 0, 0.07058824, 1,
2.40538, 0.6434572, 1.498379, 1, 0, 0.06666667, 1,
2.420896, -0.2821601, 2.992502, 1, 0, 0.05882353, 1,
2.448353, 1.009342, 1.973199, 1, 0, 0.05490196, 1,
2.473273, 2.475129, -0.4263843, 1, 0, 0.04705882, 1,
2.520455, 0.2173493, 0.9318073, 1, 0, 0.04313726, 1,
2.723856, -0.8362189, 1.024333, 1, 0, 0.03529412, 1,
2.826613, -0.0371121, 1.349262, 1, 0, 0.03137255, 1,
2.830125, 0.7560773, -0.2479216, 1, 0, 0.02352941, 1,
2.839736, 0.1172858, 1.52044, 1, 0, 0.01960784, 1,
3.361937, -1.015164, 1.296111, 1, 0, 0.01176471, 1,
3.396151, 1.695138, 0.6037201, 1, 0, 0.007843138, 1
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
-0.02297127, -3.85292, -7.230069, 0, -0.5, 0.5, 0.5,
-0.02297127, -3.85292, -7.230069, 1, -0.5, 0.5, 0.5,
-0.02297127, -3.85292, -7.230069, 1, 1.5, 0.5, 0.5,
-0.02297127, -3.85292, -7.230069, 0, 1.5, 0.5, 0.5
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
-4.601175, 0.2361244, -7.230069, 0, -0.5, 0.5, 0.5,
-4.601175, 0.2361244, -7.230069, 1, -0.5, 0.5, 0.5,
-4.601175, 0.2361244, -7.230069, 1, 1.5, 0.5, 0.5,
-4.601175, 0.2361244, -7.230069, 0, 1.5, 0.5, 0.5
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
-4.601175, -3.85292, -0.02204084, 0, -0.5, 0.5, 0.5,
-4.601175, -3.85292, -0.02204084, 1, -0.5, 0.5, 0.5,
-4.601175, -3.85292, -0.02204084, 1, 1.5, 0.5, 0.5,
-4.601175, -3.85292, -0.02204084, 0, 1.5, 0.5, 0.5
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
-3, -2.909295, -5.566678,
3, -2.909295, -5.566678,
-3, -2.909295, -5.566678,
-3, -3.066566, -5.843909,
-2, -2.909295, -5.566678,
-2, -3.066566, -5.843909,
-1, -2.909295, -5.566678,
-1, -3.066566, -5.843909,
0, -2.909295, -5.566678,
0, -3.066566, -5.843909,
1, -2.909295, -5.566678,
1, -3.066566, -5.843909,
2, -2.909295, -5.566678,
2, -3.066566, -5.843909,
3, -2.909295, -5.566678,
3, -3.066566, -5.843909
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
"-3",
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
-3, -3.381107, -6.398373, 0, -0.5, 0.5, 0.5,
-3, -3.381107, -6.398373, 1, -0.5, 0.5, 0.5,
-3, -3.381107, -6.398373, 1, 1.5, 0.5, 0.5,
-3, -3.381107, -6.398373, 0, 1.5, 0.5, 0.5,
-2, -3.381107, -6.398373, 0, -0.5, 0.5, 0.5,
-2, -3.381107, -6.398373, 1, -0.5, 0.5, 0.5,
-2, -3.381107, -6.398373, 1, 1.5, 0.5, 0.5,
-2, -3.381107, -6.398373, 0, 1.5, 0.5, 0.5,
-1, -3.381107, -6.398373, 0, -0.5, 0.5, 0.5,
-1, -3.381107, -6.398373, 1, -0.5, 0.5, 0.5,
-1, -3.381107, -6.398373, 1, 1.5, 0.5, 0.5,
-1, -3.381107, -6.398373, 0, 1.5, 0.5, 0.5,
0, -3.381107, -6.398373, 0, -0.5, 0.5, 0.5,
0, -3.381107, -6.398373, 1, -0.5, 0.5, 0.5,
0, -3.381107, -6.398373, 1, 1.5, 0.5, 0.5,
0, -3.381107, -6.398373, 0, 1.5, 0.5, 0.5,
1, -3.381107, -6.398373, 0, -0.5, 0.5, 0.5,
1, -3.381107, -6.398373, 1, -0.5, 0.5, 0.5,
1, -3.381107, -6.398373, 1, 1.5, 0.5, 0.5,
1, -3.381107, -6.398373, 0, 1.5, 0.5, 0.5,
2, -3.381107, -6.398373, 0, -0.5, 0.5, 0.5,
2, -3.381107, -6.398373, 1, -0.5, 0.5, 0.5,
2, -3.381107, -6.398373, 1, 1.5, 0.5, 0.5,
2, -3.381107, -6.398373, 0, 1.5, 0.5, 0.5,
3, -3.381107, -6.398373, 0, -0.5, 0.5, 0.5,
3, -3.381107, -6.398373, 1, -0.5, 0.5, 0.5,
3, -3.381107, -6.398373, 1, 1.5, 0.5, 0.5,
3, -3.381107, -6.398373, 0, 1.5, 0.5, 0.5
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
-3.544667, -2, -5.566678,
-3.544667, 3, -5.566678,
-3.544667, -2, -5.566678,
-3.720752, -2, -5.843909,
-3.544667, -1, -5.566678,
-3.720752, -1, -5.843909,
-3.544667, 0, -5.566678,
-3.720752, 0, -5.843909,
-3.544667, 1, -5.566678,
-3.720752, 1, -5.843909,
-3.544667, 2, -5.566678,
-3.720752, 2, -5.843909,
-3.544667, 3, -5.566678,
-3.720752, 3, -5.843909
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
-4.072921, -2, -6.398373, 0, -0.5, 0.5, 0.5,
-4.072921, -2, -6.398373, 1, -0.5, 0.5, 0.5,
-4.072921, -2, -6.398373, 1, 1.5, 0.5, 0.5,
-4.072921, -2, -6.398373, 0, 1.5, 0.5, 0.5,
-4.072921, -1, -6.398373, 0, -0.5, 0.5, 0.5,
-4.072921, -1, -6.398373, 1, -0.5, 0.5, 0.5,
-4.072921, -1, -6.398373, 1, 1.5, 0.5, 0.5,
-4.072921, -1, -6.398373, 0, 1.5, 0.5, 0.5,
-4.072921, 0, -6.398373, 0, -0.5, 0.5, 0.5,
-4.072921, 0, -6.398373, 1, -0.5, 0.5, 0.5,
-4.072921, 0, -6.398373, 1, 1.5, 0.5, 0.5,
-4.072921, 0, -6.398373, 0, 1.5, 0.5, 0.5,
-4.072921, 1, -6.398373, 0, -0.5, 0.5, 0.5,
-4.072921, 1, -6.398373, 1, -0.5, 0.5, 0.5,
-4.072921, 1, -6.398373, 1, 1.5, 0.5, 0.5,
-4.072921, 1, -6.398373, 0, 1.5, 0.5, 0.5,
-4.072921, 2, -6.398373, 0, -0.5, 0.5, 0.5,
-4.072921, 2, -6.398373, 1, -0.5, 0.5, 0.5,
-4.072921, 2, -6.398373, 1, 1.5, 0.5, 0.5,
-4.072921, 2, -6.398373, 0, 1.5, 0.5, 0.5,
-4.072921, 3, -6.398373, 0, -0.5, 0.5, 0.5,
-4.072921, 3, -6.398373, 1, -0.5, 0.5, 0.5,
-4.072921, 3, -6.398373, 1, 1.5, 0.5, 0.5,
-4.072921, 3, -6.398373, 0, 1.5, 0.5, 0.5
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
-3.544667, -2.909295, -4,
-3.544667, -2.909295, 4,
-3.544667, -2.909295, -4,
-3.720752, -3.066566, -4,
-3.544667, -2.909295, -2,
-3.720752, -3.066566, -2,
-3.544667, -2.909295, 0,
-3.720752, -3.066566, 0,
-3.544667, -2.909295, 2,
-3.720752, -3.066566, 2,
-3.544667, -2.909295, 4,
-3.720752, -3.066566, 4
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
-4.072921, -3.381107, -4, 0, -0.5, 0.5, 0.5,
-4.072921, -3.381107, -4, 1, -0.5, 0.5, 0.5,
-4.072921, -3.381107, -4, 1, 1.5, 0.5, 0.5,
-4.072921, -3.381107, -4, 0, 1.5, 0.5, 0.5,
-4.072921, -3.381107, -2, 0, -0.5, 0.5, 0.5,
-4.072921, -3.381107, -2, 1, -0.5, 0.5, 0.5,
-4.072921, -3.381107, -2, 1, 1.5, 0.5, 0.5,
-4.072921, -3.381107, -2, 0, 1.5, 0.5, 0.5,
-4.072921, -3.381107, 0, 0, -0.5, 0.5, 0.5,
-4.072921, -3.381107, 0, 1, -0.5, 0.5, 0.5,
-4.072921, -3.381107, 0, 1, 1.5, 0.5, 0.5,
-4.072921, -3.381107, 0, 0, 1.5, 0.5, 0.5,
-4.072921, -3.381107, 2, 0, -0.5, 0.5, 0.5,
-4.072921, -3.381107, 2, 1, -0.5, 0.5, 0.5,
-4.072921, -3.381107, 2, 1, 1.5, 0.5, 0.5,
-4.072921, -3.381107, 2, 0, 1.5, 0.5, 0.5,
-4.072921, -3.381107, 4, 0, -0.5, 0.5, 0.5,
-4.072921, -3.381107, 4, 1, -0.5, 0.5, 0.5,
-4.072921, -3.381107, 4, 1, 1.5, 0.5, 0.5,
-4.072921, -3.381107, 4, 0, 1.5, 0.5, 0.5
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
-3.544667, -2.909295, -5.566678,
-3.544667, 3.381543, -5.566678,
-3.544667, -2.909295, 5.522596,
-3.544667, 3.381543, 5.522596,
-3.544667, -2.909295, -5.566678,
-3.544667, -2.909295, 5.522596,
-3.544667, 3.381543, -5.566678,
-3.544667, 3.381543, 5.522596,
-3.544667, -2.909295, -5.566678,
3.498724, -2.909295, -5.566678,
-3.544667, -2.909295, 5.522596,
3.498724, -2.909295, 5.522596,
-3.544667, 3.381543, -5.566678,
3.498724, 3.381543, -5.566678,
-3.544667, 3.381543, 5.522596,
3.498724, 3.381543, 5.522596,
3.498724, -2.909295, -5.566678,
3.498724, 3.381543, -5.566678,
3.498724, -2.909295, 5.522596,
3.498724, 3.381543, 5.522596,
3.498724, -2.909295, -5.566678,
3.498724, -2.909295, 5.522596,
3.498724, 3.381543, -5.566678,
3.498724, 3.381543, 5.522596
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
var radius = 7.777734;
var distance = 34.60402;
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
mvMatrix.translate( 0.02297127, -0.2361244, 0.02204084 );
mvMatrix.scale( 1.193947, 1.336776, 0.7583399 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.60402);
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
gl.drawArrays(gl.LINES, 0, 16);
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
gl.drawElements(gl.TRIANGLES, 42, gl.UNSIGNED_SHORT, 0);
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
O-ethyl_S-propyl_pho<-read.table("O-ethyl_S-propyl_pho.xyz", skip=1)
```

```
## Error in read.table("O-ethyl_S-propyl_pho.xyz", skip = 1): duplicate 'row.names' are not allowed
```

```r
x<-O-ethyl_S-propyl_pho$V2
```

```
## Error in eval(expr, envir, enclos): object 'O' not found
```

```r
y<-O-ethyl_S-propyl_pho$V3
```

```
## Error in eval(expr, envir, enclos): object 'O' not found
```

```r
z<-O-ethyl_S-propyl_pho$V4
```

```
## Error in eval(expr, envir, enclos): object 'O' not found
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
-3.442093, 0.9707798, -1.880963, 0, 0, 1, 1, 1,
-3.117337, -0.03128316, 0.1850293, 1, 0, 0, 1, 1,
-3.043006, -0.1290236, -0.4965507, 1, 0, 0, 1, 1,
-2.778803, -1.185041, -1.09137, 1, 0, 0, 1, 1,
-2.400825, -1.12557, -1.253071, 1, 0, 0, 1, 1,
-2.348922, 0.4737177, -2.262719, 1, 0, 0, 1, 1,
-2.341676, 0.3076879, -0.2083697, 0, 0, 0, 1, 1,
-2.309124, 0.3484469, -4.603053, 0, 0, 0, 1, 1,
-2.284618, -1.129463, -3.059093, 0, 0, 0, 1, 1,
-2.258662, 1.185797, -1.962692, 0, 0, 0, 1, 1,
-2.120778, 1.039608, 0.5309717, 0, 0, 0, 1, 1,
-2.065605, -1.073745, -0.1965352, 0, 0, 0, 1, 1,
-2.0584, -0.3568358, -1.450329, 0, 0, 0, 1, 1,
-2.04752, 1.440533, -0.5321957, 1, 1, 1, 1, 1,
-2.033844, -1.108228, -2.723408, 1, 1, 1, 1, 1,
-2.002992, 0.7568924, -2.551614, 1, 1, 1, 1, 1,
-1.995835, 1.673339, -1.960729, 1, 1, 1, 1, 1,
-1.963498, -1.851666, -2.92922, 1, 1, 1, 1, 1,
-1.887858, -0.9373468, -1.206778, 1, 1, 1, 1, 1,
-1.883968, -1.256648, -2.245003, 1, 1, 1, 1, 1,
-1.86956, -0.06699234, -3.281646, 1, 1, 1, 1, 1,
-1.841705, 0.9043162, -1.959711, 1, 1, 1, 1, 1,
-1.828114, 1.873735, -1.87193, 1, 1, 1, 1, 1,
-1.809369, 2.227435, 0.1999152, 1, 1, 1, 1, 1,
-1.809084, -0.2211884, -1.722635, 1, 1, 1, 1, 1,
-1.804637, -1.374228, -0.07320949, 1, 1, 1, 1, 1,
-1.800958, -0.479058, -1.387171, 1, 1, 1, 1, 1,
-1.79924, -0.8419417, -2.026809, 1, 1, 1, 1, 1,
-1.786937, -1.514902, -1.225137, 0, 0, 1, 1, 1,
-1.773802, -0.3774971, -1.271794, 1, 0, 0, 1, 1,
-1.749517, 0.4590249, -1.735481, 1, 0, 0, 1, 1,
-1.733167, -1.203632, -2.542546, 1, 0, 0, 1, 1,
-1.719993, -0.5966641, -1.948071, 1, 0, 0, 1, 1,
-1.699563, -0.3703865, -2.266185, 1, 0, 0, 1, 1,
-1.678255, -0.3321717, -2.063278, 0, 0, 0, 1, 1,
-1.657759, 1.893495, -0.5240265, 0, 0, 0, 1, 1,
-1.657014, 0.5063221, -1.916007, 0, 0, 0, 1, 1,
-1.637147, 0.4879253, -1.324672, 0, 0, 0, 1, 1,
-1.636757, 0.4054849, -2.659039, 0, 0, 0, 1, 1,
-1.633867, 2.374696, 1.067091, 0, 0, 0, 1, 1,
-1.633469, -0.8334141, -2.67081, 0, 0, 0, 1, 1,
-1.617322, 2.217555, -0.8434322, 1, 1, 1, 1, 1,
-1.605784, -1.285058, -0.7982465, 1, 1, 1, 1, 1,
-1.598282, 1.828902, 0.5985664, 1, 1, 1, 1, 1,
-1.596521, -0.8632112, -3.315191, 1, 1, 1, 1, 1,
-1.583617, -1.137368, -4.161182, 1, 1, 1, 1, 1,
-1.566434, -0.1864682, -0.380974, 1, 1, 1, 1, 1,
-1.559562, -0.1935269, -2.899646, 1, 1, 1, 1, 1,
-1.557008, 0.113995, -0.7622084, 1, 1, 1, 1, 1,
-1.547646, -0.5608802, -3.248597, 1, 1, 1, 1, 1,
-1.547304, -1.468373, -3.271078, 1, 1, 1, 1, 1,
-1.544661, -1.34103, -2.003148, 1, 1, 1, 1, 1,
-1.53347, -0.9875488, -1.372939, 1, 1, 1, 1, 1,
-1.532251, -0.9454699, -3.804619, 1, 1, 1, 1, 1,
-1.526749, -0.3962579, -3.183638, 1, 1, 1, 1, 1,
-1.524166, -0.7916954, -2.632795, 1, 1, 1, 1, 1,
-1.519472, 0.5941525, -0.09351898, 0, 0, 1, 1, 1,
-1.517635, -0.1809482, 0.4122862, 1, 0, 0, 1, 1,
-1.513502, 0.5407901, -2.006606, 1, 0, 0, 1, 1,
-1.499741, 0.2240558, -0.9175354, 1, 0, 0, 1, 1,
-1.492432, 0.9807042, 0.05576667, 1, 0, 0, 1, 1,
-1.492084, 0.2536054, -0.4893582, 1, 0, 0, 1, 1,
-1.490669, -1.000828, -2.184733, 0, 0, 0, 1, 1,
-1.468121, -0.3987935, -2.776134, 0, 0, 0, 1, 1,
-1.444395, -0.9435694, -2.097081, 0, 0, 0, 1, 1,
-1.441188, -0.6437515, -1.407207, 0, 0, 0, 1, 1,
-1.439173, 0.5740214, -2.04478, 0, 0, 0, 1, 1,
-1.438383, 1.9045, 0.0751957, 0, 0, 0, 1, 1,
-1.436103, -2.323874, -4.585221, 0, 0, 0, 1, 1,
-1.432056, 0.2834517, -2.612634, 1, 1, 1, 1, 1,
-1.431089, 1.294773, 0.3297939, 1, 1, 1, 1, 1,
-1.430521, -0.7783576, -2.272828, 1, 1, 1, 1, 1,
-1.420258, -0.08258817, -1.104851, 1, 1, 1, 1, 1,
-1.413534, -0.05678242, -0.7967457, 1, 1, 1, 1, 1,
-1.410476, -0.1227291, -1.978834, 1, 1, 1, 1, 1,
-1.408358, 0.4753334, -1.404671, 1, 1, 1, 1, 1,
-1.371467, 0.2099419, -1.668666, 1, 1, 1, 1, 1,
-1.36599, 1.249411, -0.852485, 1, 1, 1, 1, 1,
-1.356047, 0.5307977, -2.09008, 1, 1, 1, 1, 1,
-1.353531, 1.213991, -3.205872, 1, 1, 1, 1, 1,
-1.351847, 1.506083, -0.9694575, 1, 1, 1, 1, 1,
-1.351093, -0.5170027, -3.257164, 1, 1, 1, 1, 1,
-1.348202, 1.476154, -1.448574, 1, 1, 1, 1, 1,
-1.345711, -1.153105, -2.691134, 1, 1, 1, 1, 1,
-1.344052, 1.111187, 0.2140359, 0, 0, 1, 1, 1,
-1.339669, -2.027472, -2.892901, 1, 0, 0, 1, 1,
-1.333052, 0.7277117, -0.2890096, 1, 0, 0, 1, 1,
-1.330813, 0.6474987, -0.6608632, 1, 0, 0, 1, 1,
-1.327834, 1.072048, -1.162029, 1, 0, 0, 1, 1,
-1.319829, 0.01633976, -1.448582, 1, 0, 0, 1, 1,
-1.319079, 0.9758813, -1.215361, 0, 0, 0, 1, 1,
-1.316121, -0.5164589, -2.214622, 0, 0, 0, 1, 1,
-1.314407, 1.703529, -1.565257, 0, 0, 0, 1, 1,
-1.313834, -2.491369, -1.938126, 0, 0, 0, 1, 1,
-1.313357, -0.1047454, -1.070898, 0, 0, 0, 1, 1,
-1.311295, 1.571167, -0.5060208, 0, 0, 0, 1, 1,
-1.309203, 1.346918, -0.2589046, 0, 0, 0, 1, 1,
-1.308461, -1.291615, -3.087198, 1, 1, 1, 1, 1,
-1.308265, 1.04947, -2.883043, 1, 1, 1, 1, 1,
-1.306085, 0.3995072, -1.677334, 1, 1, 1, 1, 1,
-1.304789, -1.122473, -0.6297075, 1, 1, 1, 1, 1,
-1.304746, -0.8279266, -1.366318, 1, 1, 1, 1, 1,
-1.302893, 0.897732, -1.552913, 1, 1, 1, 1, 1,
-1.2951, 1.105599, -1.136678, 1, 1, 1, 1, 1,
-1.29093, 0.7902598, 0.686816, 1, 1, 1, 1, 1,
-1.288002, -0.3580658, -0.3660716, 1, 1, 1, 1, 1,
-1.280377, -1.058262, -5.055967, 1, 1, 1, 1, 1,
-1.268551, -1.109443, -1.075108, 1, 1, 1, 1, 1,
-1.266479, -0.04156046, -2.094841, 1, 1, 1, 1, 1,
-1.263811, 1.849877, 0.9363524, 1, 1, 1, 1, 1,
-1.255867, 1.591958, -1.273732, 1, 1, 1, 1, 1,
-1.255073, 1.082277, -1.595018, 1, 1, 1, 1, 1,
-1.252866, -1.230959, -1.688447, 0, 0, 1, 1, 1,
-1.246643, 0.4138258, -1.193057, 1, 0, 0, 1, 1,
-1.240151, 1.273333, -0.7774355, 1, 0, 0, 1, 1,
-1.238781, 0.715862, -1.702879, 1, 0, 0, 1, 1,
-1.232512, 0.4277399, -0.3856423, 1, 0, 0, 1, 1,
-1.229733, -0.9563814, -0.8051165, 1, 0, 0, 1, 1,
-1.226813, -0.1089951, -1.944055, 0, 0, 0, 1, 1,
-1.223755, -0.1623078, -1.008307, 0, 0, 0, 1, 1,
-1.220698, 1.133314, -0.3268143, 0, 0, 0, 1, 1,
-1.20678, -0.2466592, -2.457877, 0, 0, 0, 1, 1,
-1.190878, 0.2121593, -2.492307, 0, 0, 0, 1, 1,
-1.189689, 0.1856374, -0.8743364, 0, 0, 0, 1, 1,
-1.187573, 0.7169065, -1.792318, 0, 0, 0, 1, 1,
-1.186776, 1.175756, -0.5029929, 1, 1, 1, 1, 1,
-1.173881, -0.03081054, -1.869834, 1, 1, 1, 1, 1,
-1.173373, -1.157132, -3.772202, 1, 1, 1, 1, 1,
-1.165801, -1.636005, -3.830904, 1, 1, 1, 1, 1,
-1.160521, 0.1842899, -1.756273, 1, 1, 1, 1, 1,
-1.152812, -0.1665017, -0.5616613, 1, 1, 1, 1, 1,
-1.152122, -0.7832555, -4.469343, 1, 1, 1, 1, 1,
-1.148205, -0.06750019, -0.82281, 1, 1, 1, 1, 1,
-1.146022, -0.4277832, -2.058536, 1, 1, 1, 1, 1,
-1.142544, -0.5953737, -1.243062, 1, 1, 1, 1, 1,
-1.133709, 0.4625072, -0.2491069, 1, 1, 1, 1, 1,
-1.133597, 0.5540681, -1.936047, 1, 1, 1, 1, 1,
-1.128515, 0.755546, -0.7563581, 1, 1, 1, 1, 1,
-1.122044, 1.122285, -1.095528, 1, 1, 1, 1, 1,
-1.118575, -0.4462553, -1.506537, 1, 1, 1, 1, 1,
-1.117435, 1.157269, -0.3080646, 0, 0, 1, 1, 1,
-1.111225, 1.05697, -1.910838, 1, 0, 0, 1, 1,
-1.101581, -1.099222, -1.886855, 1, 0, 0, 1, 1,
-1.094077, 0.8221868, 0.338156, 1, 0, 0, 1, 1,
-1.087912, 0.4966746, -0.7034556, 1, 0, 0, 1, 1,
-1.084072, -1.214778, -3.489748, 1, 0, 0, 1, 1,
-1.078689, -0.7533126, -1.762564, 0, 0, 0, 1, 1,
-1.077844, -1.269052, -3.225526, 0, 0, 0, 1, 1,
-1.071795, 0.5884784, -2.200233, 0, 0, 0, 1, 1,
-1.064836, 0.7073665, -1.892237, 0, 0, 0, 1, 1,
-1.058004, 0.1004187, -3.457427, 0, 0, 0, 1, 1,
-1.056303, 1.02453, -1.634934, 0, 0, 0, 1, 1,
-1.052182, 1.609469, -1.235742, 0, 0, 0, 1, 1,
-1.044549, -0.8956771, -1.684144, 1, 1, 1, 1, 1,
-1.038823, -0.4642664, -0.4805798, 1, 1, 1, 1, 1,
-1.038463, -0.3263058, -3.830628, 1, 1, 1, 1, 1,
-1.015246, 0.2214269, -1.278552, 1, 1, 1, 1, 1,
-1.009664, 0.9954715, -1.258301, 1, 1, 1, 1, 1,
-1.002442, -0.6095153, -1.551693, 1, 1, 1, 1, 1,
-0.9991202, -0.6006405, -2.206229, 1, 1, 1, 1, 1,
-0.9946131, -1.750475, -3.375326, 1, 1, 1, 1, 1,
-0.9931511, 0.6794736, -1.529875, 1, 1, 1, 1, 1,
-0.9903392, -0.7726818, -3.146871, 1, 1, 1, 1, 1,
-0.9898559, -1.127559, -1.769675, 1, 1, 1, 1, 1,
-0.9834955, -0.5719824, -1.168823, 1, 1, 1, 1, 1,
-0.9769058, 1.54245, 0.4605632, 1, 1, 1, 1, 1,
-0.9768772, -0.04130768, -0.7905732, 1, 1, 1, 1, 1,
-0.970625, -1.270929, -3.428014, 1, 1, 1, 1, 1,
-0.9697235, 0.3374627, -0.260632, 0, 0, 1, 1, 1,
-0.9646212, 0.1054486, -2.606358, 1, 0, 0, 1, 1,
-0.9604881, -1.105917, -2.407279, 1, 0, 0, 1, 1,
-0.956091, 0.3424618, -1.504723, 1, 0, 0, 1, 1,
-0.9556437, 0.2079628, -0.8973192, 1, 0, 0, 1, 1,
-0.9524225, -1.004791, -2.66549, 1, 0, 0, 1, 1,
-0.9438223, -0.935511, -1.089128, 0, 0, 0, 1, 1,
-0.9405726, -0.09964612, -1.562037, 0, 0, 0, 1, 1,
-0.9391125, 1.038225, -1.143795, 0, 0, 0, 1, 1,
-0.9356433, 0.08155107, -0.7502748, 0, 0, 0, 1, 1,
-0.9351315, 1.103143, -0.5094765, 0, 0, 0, 1, 1,
-0.9220841, 0.4923915, -2.348449, 0, 0, 0, 1, 1,
-0.9175397, 1.02908, -1.156054, 0, 0, 0, 1, 1,
-0.9169732, 0.6669776, 0.008001747, 1, 1, 1, 1, 1,
-0.9160182, 0.326118, -0.887758, 1, 1, 1, 1, 1,
-0.9154057, -0.4542719, -0.1929549, 1, 1, 1, 1, 1,
-0.9109406, -0.4158738, -3.334161, 1, 1, 1, 1, 1,
-0.910108, 0.5965997, -1.191945, 1, 1, 1, 1, 1,
-0.9047681, 2.111765, 0.7267857, 1, 1, 1, 1, 1,
-0.9037095, 0.3229034, -1.03221, 1, 1, 1, 1, 1,
-0.9002996, -0.4290683, -3.201494, 1, 1, 1, 1, 1,
-0.8935766, -0.1950296, -2.344557, 1, 1, 1, 1, 1,
-0.8872841, 0.2133021, -2.483612, 1, 1, 1, 1, 1,
-0.8864438, -2.293118, -1.193756, 1, 1, 1, 1, 1,
-0.862305, 0.8129501, -1.940717, 1, 1, 1, 1, 1,
-0.8620195, -1.211478, -2.720489, 1, 1, 1, 1, 1,
-0.8610647, 0.1495902, -0.684947, 1, 1, 1, 1, 1,
-0.8587871, -2.788616, -3.334718, 1, 1, 1, 1, 1,
-0.8549697, 1.077602, -0.06093555, 0, 0, 1, 1, 1,
-0.8514428, 0.1495726, -1.662596, 1, 0, 0, 1, 1,
-0.8474424, -0.06523065, -1.158263, 1, 0, 0, 1, 1,
-0.8451956, 0.3907921, -1.709684, 1, 0, 0, 1, 1,
-0.8451132, -0.04741947, -2.925557, 1, 0, 0, 1, 1,
-0.8446497, 1.254856, -0.3032809, 1, 0, 0, 1, 1,
-0.8440548, -0.4326783, -2.936369, 0, 0, 0, 1, 1,
-0.8360798, -0.4483353, -1.085711, 0, 0, 0, 1, 1,
-0.8340281, -0.6090931, -3.834168, 0, 0, 0, 1, 1,
-0.830775, 0.1837226, -3.540265, 0, 0, 0, 1, 1,
-0.8287234, -0.2497217, -2.679806, 0, 0, 0, 1, 1,
-0.8267355, -1.396316, -2.001402, 0, 0, 0, 1, 1,
-0.8261789, 0.1062222, -2.685665, 0, 0, 0, 1, 1,
-0.8239865, -2.160816, -1.948656, 1, 1, 1, 1, 1,
-0.8223299, -1.294168, -1.971935, 1, 1, 1, 1, 1,
-0.8200812, -0.1802836, -0.6542901, 1, 1, 1, 1, 1,
-0.8179212, -0.3718715, -2.291993, 1, 1, 1, 1, 1,
-0.811545, -0.3723217, -3.816306, 1, 1, 1, 1, 1,
-0.80988, -0.1847019, -0.5935381, 1, 1, 1, 1, 1,
-0.8088599, -0.4345821, -2.414228, 1, 1, 1, 1, 1,
-0.8039538, 1.07472, -0.305229, 1, 1, 1, 1, 1,
-0.8038818, 0.110069, -1.29598, 1, 1, 1, 1, 1,
-0.8009247, 0.8115205, 0.1527195, 1, 1, 1, 1, 1,
-0.8001519, -0.3023257, -2.009161, 1, 1, 1, 1, 1,
-0.7941703, -2.112634, -1.247572, 1, 1, 1, 1, 1,
-0.7900113, 0.2773972, -0.574962, 1, 1, 1, 1, 1,
-0.7882402, -1.592342, -2.669982, 1, 1, 1, 1, 1,
-0.7878645, 0.861401, -2.248802, 1, 1, 1, 1, 1,
-0.7850589, -0.3196751, -0.9506621, 0, 0, 1, 1, 1,
-0.7785847, 0.7287657, -2.118359, 1, 0, 0, 1, 1,
-0.7673992, -0.3984746, -2.16815, 1, 0, 0, 1, 1,
-0.7639991, -0.4025462, -2.560888, 1, 0, 0, 1, 1,
-0.7603895, -0.243181, -0.4780915, 1, 0, 0, 1, 1,
-0.7599164, -0.1922939, -1.577591, 1, 0, 0, 1, 1,
-0.749974, 0.2505162, -1.632103, 0, 0, 0, 1, 1,
-0.7476863, -0.2666024, -2.833166, 0, 0, 0, 1, 1,
-0.7466362, -0.1948473, -1.379033, 0, 0, 0, 1, 1,
-0.7441459, 0.7162917, -2.500563, 0, 0, 0, 1, 1,
-0.7436979, 1.489639, 0.02348052, 0, 0, 0, 1, 1,
-0.7420081, 0.1455322, -1.460262, 0, 0, 0, 1, 1,
-0.7330564, -0.1232765, -1.621855, 0, 0, 0, 1, 1,
-0.7280118, 1.779497, -0.6181512, 1, 1, 1, 1, 1,
-0.7273882, 1.312071, -1.764721, 1, 1, 1, 1, 1,
-0.7217465, -1.497596, -1.874333, 1, 1, 1, 1, 1,
-0.7142338, 0.4797549, -0.07484727, 1, 1, 1, 1, 1,
-0.7085537, 0.3988355, -0.3980665, 1, 1, 1, 1, 1,
-0.708365, -0.5467083, -2.852807, 1, 1, 1, 1, 1,
-0.7076531, -0.1006497, -0.4147152, 1, 1, 1, 1, 1,
-0.7008892, 0.06983057, -1.45839, 1, 1, 1, 1, 1,
-0.6987788, 0.9187936, -1.558632, 1, 1, 1, 1, 1,
-0.6940255, -0.8961077, -2.396879, 1, 1, 1, 1, 1,
-0.6928986, -1.33645, -0.9060474, 1, 1, 1, 1, 1,
-0.6895326, 0.1719529, -0.2132257, 1, 1, 1, 1, 1,
-0.6816161, 0.227323, -0.3051482, 1, 1, 1, 1, 1,
-0.6815292, 0.607725, -1.112519, 1, 1, 1, 1, 1,
-0.6798196, 1.304922, 0.5862832, 1, 1, 1, 1, 1,
-0.6797846, 0.5626511, -0.9522001, 0, 0, 1, 1, 1,
-0.6724384, -1.233029, -1.733499, 1, 0, 0, 1, 1,
-0.6704438, 0.6355788, -2.53659, 1, 0, 0, 1, 1,
-0.6648048, -0.07287096, -2.042135, 1, 0, 0, 1, 1,
-0.6638478, -1.733917, -3.303419, 1, 0, 0, 1, 1,
-0.6615074, -0.943395, -2.392793, 1, 0, 0, 1, 1,
-0.6596418, -0.2554869, -1.864254, 0, 0, 0, 1, 1,
-0.6579452, 0.508287, -0.3527982, 0, 0, 0, 1, 1,
-0.6576093, 0.2288402, -1.781766, 0, 0, 0, 1, 1,
-0.6566919, 0.9494205, -0.9352862, 0, 0, 0, 1, 1,
-0.6561148, 0.7607393, -0.03327779, 0, 0, 0, 1, 1,
-0.6517024, 0.1446487, -2.111607, 0, 0, 0, 1, 1,
-0.6462798, 0.983899, -0.4586318, 0, 0, 0, 1, 1,
-0.6436536, -0.03166902, -3.628674, 1, 1, 1, 1, 1,
-0.6432409, 0.9271926, -0.09811963, 1, 1, 1, 1, 1,
-0.6431688, 1.083108, 0.3636043, 1, 1, 1, 1, 1,
-0.6375746, -0.9616302, -2.402503, 1, 1, 1, 1, 1,
-0.6357477, -1.229416, -2.772407, 1, 1, 1, 1, 1,
-0.6329131, 0.3941475, -0.6643919, 1, 1, 1, 1, 1,
-0.624418, 1.175167, -2.286969, 1, 1, 1, 1, 1,
-0.6240777, -0.9677772, -2.853837, 1, 1, 1, 1, 1,
-0.6229218, 0.1240523, -1.042574, 1, 1, 1, 1, 1,
-0.6192589, 1.91323, 0.38973, 1, 1, 1, 1, 1,
-0.6175131, 0.4222661, -1.766347, 1, 1, 1, 1, 1,
-0.6166112, 1.636431, -1.596477, 1, 1, 1, 1, 1,
-0.6110172, -0.06182367, -3.004328, 1, 1, 1, 1, 1,
-0.609687, 1.624765, 0.1748232, 1, 1, 1, 1, 1,
-0.6094504, -0.3189136, -3.657, 1, 1, 1, 1, 1,
-0.6037918, -0.06126683, -2.214139, 0, 0, 1, 1, 1,
-0.6013882, -0.6428612, -3.099753, 1, 0, 0, 1, 1,
-0.6008586, 0.7564, 0.07497891, 1, 0, 0, 1, 1,
-0.6005967, 0.6957048, -2.690425, 1, 0, 0, 1, 1,
-0.5976754, 0.8156609, 0.5606125, 1, 0, 0, 1, 1,
-0.5975651, -0.1468794, -2.98344, 1, 0, 0, 1, 1,
-0.5897127, -0.07581669, -1.044882, 0, 0, 0, 1, 1,
-0.5806839, 0.6975252, -1.293032, 0, 0, 0, 1, 1,
-0.576254, 1.273526, -1.461035, 0, 0, 0, 1, 1,
-0.5716201, 1.550674, -0.8622928, 0, 0, 0, 1, 1,
-0.5715548, -0.1431251, -0.70166, 0, 0, 0, 1, 1,
-0.5672253, 1.155719, 0.4514402, 0, 0, 0, 1, 1,
-0.565873, 0.6384187, -1.395895, 0, 0, 0, 1, 1,
-0.5636905, 0.1601238, -1.047965, 1, 1, 1, 1, 1,
-0.5622472, 0.6350864, -0.2858685, 1, 1, 1, 1, 1,
-0.5612928, -0.6484614, -4.054518, 1, 1, 1, 1, 1,
-0.5579715, -0.1690934, -1.715129, 1, 1, 1, 1, 1,
-0.5573695, -1.60037, -2.963428, 1, 1, 1, 1, 1,
-0.5565125, 1.635756, -1.05152, 1, 1, 1, 1, 1,
-0.5455019, 0.05371535, -3.57699, 1, 1, 1, 1, 1,
-0.5441162, -0.8421699, -2.505713, 1, 1, 1, 1, 1,
-0.5422955, 1.32981, 0.5521953, 1, 1, 1, 1, 1,
-0.5393777, -0.5993089, -0.8705608, 1, 1, 1, 1, 1,
-0.5384035, 0.4497389, -2.265676, 1, 1, 1, 1, 1,
-0.537769, 0.2111048, -0.08965131, 1, 1, 1, 1, 1,
-0.5373796, 0.6767949, -0.6231159, 1, 1, 1, 1, 1,
-0.5306287, 0.2278887, -1.409538, 1, 1, 1, 1, 1,
-0.5213802, 1.235556, -1.393385, 1, 1, 1, 1, 1,
-0.5206318, 0.5858595, -2.275947, 0, 0, 1, 1, 1,
-0.519672, 0.1890619, -0.558165, 1, 0, 0, 1, 1,
-0.5192887, 0.6107579, -2.517967, 1, 0, 0, 1, 1,
-0.5176273, -0.0714744, -0.9898148, 1, 0, 0, 1, 1,
-0.5168602, 1.447187, -1.175915, 1, 0, 0, 1, 1,
-0.5144808, 0.5183027, 0.01751075, 1, 0, 0, 1, 1,
-0.5124828, -0.2177642, -2.195369, 0, 0, 0, 1, 1,
-0.5114952, 0.1874811, -0.3185697, 0, 0, 0, 1, 1,
-0.5107028, -0.1566753, -2.747259, 0, 0, 0, 1, 1,
-0.5075995, -1.929204, -2.845281, 0, 0, 0, 1, 1,
-0.5005621, -0.9593764, -2.856891, 0, 0, 0, 1, 1,
-0.5003403, 0.6892185, -1.098346, 0, 0, 0, 1, 1,
-0.4986483, -1.44369, -3.401379, 0, 0, 0, 1, 1,
-0.4941882, -0.5703349, -3.046861, 1, 1, 1, 1, 1,
-0.4927624, 0.4576899, -0.9506302, 1, 1, 1, 1, 1,
-0.4927205, -0.4463813, -1.841452, 1, 1, 1, 1, 1,
-0.4909706, 0.04375362, -0.8958387, 1, 1, 1, 1, 1,
-0.4899844, -0.1047742, -0.9821891, 1, 1, 1, 1, 1,
-0.4892778, -0.7881765, -1.927296, 1, 1, 1, 1, 1,
-0.4891879, 0.611652, 0.3389888, 1, 1, 1, 1, 1,
-0.4889, -0.1720383, -2.237503, 1, 1, 1, 1, 1,
-0.4885448, 0.6700681, -0.5871826, 1, 1, 1, 1, 1,
-0.4850657, 1.633124, 0.2727361, 1, 1, 1, 1, 1,
-0.4783734, -0.008919187, -2.084657, 1, 1, 1, 1, 1,
-0.4767673, 0.3979144, -0.3877162, 1, 1, 1, 1, 1,
-0.476557, -0.8421086, -2.427319, 1, 1, 1, 1, 1,
-0.4653361, 1.022821, -1.77611, 1, 1, 1, 1, 1,
-0.4649445, 0.5759867, -0.8216122, 1, 1, 1, 1, 1,
-0.4644803, 1.758554, -0.3990655, 0, 0, 1, 1, 1,
-0.4633202, -2.81768, -2.664698, 1, 0, 0, 1, 1,
-0.4629921, 0.1596518, -1.165284, 1, 0, 0, 1, 1,
-0.4589386, 0.5747671, -1.185089, 1, 0, 0, 1, 1,
-0.4574248, 1.394897, -1.538859, 1, 0, 0, 1, 1,
-0.4569727, -0.2516887, -3.114997, 1, 0, 0, 1, 1,
-0.4544759, -1.732262, -2.645754, 0, 0, 0, 1, 1,
-0.454118, -0.1414966, -3.674796, 0, 0, 0, 1, 1,
-0.452745, -0.4337981, -1.556931, 0, 0, 0, 1, 1,
-0.4506188, 0.3303284, -1.171212, 0, 0, 0, 1, 1,
-0.4479749, -0.9246553, -2.419541, 0, 0, 0, 1, 1,
-0.4458904, 0.9010509, 0.6751609, 0, 0, 0, 1, 1,
-0.4374435, 1.097838, -1.862633, 0, 0, 0, 1, 1,
-0.4367129, 0.2967471, -1.214896, 1, 1, 1, 1, 1,
-0.4358448, -2.149868, -4.255626, 1, 1, 1, 1, 1,
-0.4308995, -0.09733261, -2.713883, 1, 1, 1, 1, 1,
-0.4305581, -0.5299584, -2.453556, 1, 1, 1, 1, 1,
-0.4282841, 0.1226294, -1.962936, 1, 1, 1, 1, 1,
-0.4280707, -0.06905021, -1.796182, 1, 1, 1, 1, 1,
-0.4262634, -1.404393, -3.611125, 1, 1, 1, 1, 1,
-0.4257607, -0.3585412, -2.314703, 1, 1, 1, 1, 1,
-0.4246592, 0.7695547, 0.1908234, 1, 1, 1, 1, 1,
-0.4244557, -1.071273, -3.562731, 1, 1, 1, 1, 1,
-0.4230142, -1.834163, -3.238489, 1, 1, 1, 1, 1,
-0.420577, 0.574227, 0.9095289, 1, 1, 1, 1, 1,
-0.4202099, -0.9436212, -2.887307, 1, 1, 1, 1, 1,
-0.4188215, 0.4502357, -1.517294, 1, 1, 1, 1, 1,
-0.4130292, 0.819885, -1.308549, 1, 1, 1, 1, 1,
-0.4093829, -1.320073, -2.96518, 0, 0, 1, 1, 1,
-0.4092148, -2.36953, -1.140391, 1, 0, 0, 1, 1,
-0.4067009, 0.5053001, -1.641003, 1, 0, 0, 1, 1,
-0.4028166, -1.538965, -2.236182, 1, 0, 0, 1, 1,
-0.4013352, 1.49678, -0.03562204, 1, 0, 0, 1, 1,
-0.3951335, -1.08603, -4.031308, 1, 0, 0, 1, 1,
-0.3939056, 0.8047417, -1.069816, 0, 0, 0, 1, 1,
-0.3925677, 0.08925715, -1.035178, 0, 0, 0, 1, 1,
-0.391897, 0.6120841, -1.329897, 0, 0, 0, 1, 1,
-0.390567, -0.5214483, -1.808321, 0, 0, 0, 1, 1,
-0.3877619, 0.6832426, -0.5483493, 0, 0, 0, 1, 1,
-0.3840482, 0.8840961, -0.2290735, 0, 0, 0, 1, 1,
-0.3821326, -0.4469042, -4.17413, 0, 0, 0, 1, 1,
-0.3805312, -1.025672, -1.308462, 1, 1, 1, 1, 1,
-0.3795052, -1.067743, -2.462451, 1, 1, 1, 1, 1,
-0.3759282, -0.5900109, -2.67431, 1, 1, 1, 1, 1,
-0.3668139, -1.141773, -2.970284, 1, 1, 1, 1, 1,
-0.3659894, 1.309985, -0.2962761, 1, 1, 1, 1, 1,
-0.3655571, 0.9759274, -0.1346681, 1, 1, 1, 1, 1,
-0.3628944, 1.894368, -1.460574, 1, 1, 1, 1, 1,
-0.3628446, 0.4505748, -0.3223917, 1, 1, 1, 1, 1,
-0.3609762, -0.3051643, -2.598752, 1, 1, 1, 1, 1,
-0.355008, -0.9680742, -0.9700695, 1, 1, 1, 1, 1,
-0.352605, 1.360457, 0.7161303, 1, 1, 1, 1, 1,
-0.3508628, -0.425092, -3.936745, 1, 1, 1, 1, 1,
-0.3505191, 0.6049961, -1.638847, 1, 1, 1, 1, 1,
-0.349499, -0.3405452, -0.8238828, 1, 1, 1, 1, 1,
-0.3489948, -0.6685983, -3.825863, 1, 1, 1, 1, 1,
-0.3475564, 0.03862683, -1.345795, 0, 0, 1, 1, 1,
-0.347119, -0.08977794, -1.997533, 1, 0, 0, 1, 1,
-0.3431976, 0.5101506, -0.05200459, 1, 0, 0, 1, 1,
-0.3422063, -0.02988393, -2.300446, 1, 0, 0, 1, 1,
-0.3382864, 0.01133327, -0.5769683, 1, 0, 0, 1, 1,
-0.3329903, -0.540956, -3.273094, 1, 0, 0, 1, 1,
-0.3292527, 0.2222977, -2.787804, 0, 0, 0, 1, 1,
-0.3276038, 0.5870473, -1.998628, 0, 0, 0, 1, 1,
-0.3218171, -0.1669685, -2.627919, 0, 0, 0, 1, 1,
-0.3203342, -1.55004, -4.480978, 0, 0, 0, 1, 1,
-0.3174414, 1.674018, -1.770121, 0, 0, 0, 1, 1,
-0.3134866, -0.7535939, -4.520158, 0, 0, 0, 1, 1,
-0.3108906, -0.4299759, -3.290171, 0, 0, 0, 1, 1,
-0.3065901, -0.5214032, -2.066366, 1, 1, 1, 1, 1,
-0.2997157, -1.435616, -2.480446, 1, 1, 1, 1, 1,
-0.2940225, 0.3324853, -1.259509, 1, 1, 1, 1, 1,
-0.2933863, -0.7918183, -3.002803, 1, 1, 1, 1, 1,
-0.2933812, 0.4008628, -0.4952265, 1, 1, 1, 1, 1,
-0.2881694, -0.3723158, -1.347844, 1, 1, 1, 1, 1,
-0.2881335, -0.4721409, -2.836038, 1, 1, 1, 1, 1,
-0.2844959, -0.9436088, -2.625257, 1, 1, 1, 1, 1,
-0.2808522, -0.420442, -2.428791, 1, 1, 1, 1, 1,
-0.2799784, -2.323383, -2.224358, 1, 1, 1, 1, 1,
-0.2796575, 0.4951023, -1.050676, 1, 1, 1, 1, 1,
-0.2795852, -1.075769, -2.70315, 1, 1, 1, 1, 1,
-0.2795228, 0.2183346, -2.368649, 1, 1, 1, 1, 1,
-0.2771792, -1.476953, -5.405183, 1, 1, 1, 1, 1,
-0.276632, -1.151664, -2.994182, 1, 1, 1, 1, 1,
-0.2749071, 0.1690785, 0.01492826, 0, 0, 1, 1, 1,
-0.2748843, 1.005349, -0.02580179, 1, 0, 0, 1, 1,
-0.2715162, -0.7650984, -2.50258, 1, 0, 0, 1, 1,
-0.2640129, 0.2771714, -2.635964, 1, 0, 0, 1, 1,
-0.2629542, 0.5747379, 0.03036311, 1, 0, 0, 1, 1,
-0.2628392, 0.4883313, -0.4033936, 1, 0, 0, 1, 1,
-0.2614185, -0.6576712, -3.043093, 0, 0, 0, 1, 1,
-0.2600995, -0.2901195, -2.334071, 0, 0, 0, 1, 1,
-0.2581499, -0.15724, -2.284311, 0, 0, 0, 1, 1,
-0.2557269, -1.343683, -3.294425, 0, 0, 0, 1, 1,
-0.2492777, -0.6160796, -2.384975, 0, 0, 0, 1, 1,
-0.2482639, 1.637201, 1.886853, 0, 0, 0, 1, 1,
-0.2446559, -1.567352, -2.107667, 0, 0, 0, 1, 1,
-0.2445712, 0.3289898, -0.06245823, 1, 1, 1, 1, 1,
-0.2420946, -1.56259, -3.964409, 1, 1, 1, 1, 1,
-0.2394312, 2.287225, -0.1691217, 1, 1, 1, 1, 1,
-0.2386336, -1.98161, -3.866233, 1, 1, 1, 1, 1,
-0.2305277, 0.3809242, -0.9812418, 1, 1, 1, 1, 1,
-0.2273965, -1.954901, -2.627822, 1, 1, 1, 1, 1,
-0.2265879, 0.8622074, -0.8856909, 1, 1, 1, 1, 1,
-0.2262569, -0.3592287, -1.611037, 1, 1, 1, 1, 1,
-0.2240292, 0.2151854, 0.2173774, 1, 1, 1, 1, 1,
-0.2238291, 0.4167502, -0.5705059, 1, 1, 1, 1, 1,
-0.2194952, -0.8861574, -3.617103, 1, 1, 1, 1, 1,
-0.2176133, -0.9663259, -2.701318, 1, 1, 1, 1, 1,
-0.2155714, -1.733421, -1.381889, 1, 1, 1, 1, 1,
-0.2110358, 0.3423021, 0.288844, 1, 1, 1, 1, 1,
-0.2096521, -1.78269, -3.457409, 1, 1, 1, 1, 1,
-0.2088219, 1.109107, 0.4451866, 0, 0, 1, 1, 1,
-0.2083521, 1.117211, -0.3055594, 1, 0, 0, 1, 1,
-0.2077862, 0.5392651, -2.432524, 1, 0, 0, 1, 1,
-0.2053437, 0.0126629, -2.027184, 1, 0, 0, 1, 1,
-0.1993938, 0.1758606, -1.477421, 1, 0, 0, 1, 1,
-0.1924867, 0.1016662, -1.798777, 1, 0, 0, 1, 1,
-0.1921303, 0.7640983, -0.1410402, 0, 0, 0, 1, 1,
-0.1858862, -0.1484073, -1.072762, 0, 0, 0, 1, 1,
-0.1856049, 0.2288531, -1.677757, 0, 0, 0, 1, 1,
-0.1832589, -0.07656363, -3.005352, 0, 0, 0, 1, 1,
-0.1828821, -0.0268433, -0.3201196, 0, 0, 0, 1, 1,
-0.1756747, 0.9163899, -0.2565, 0, 0, 0, 1, 1,
-0.1733383, -2.054484, -2.190137, 0, 0, 0, 1, 1,
-0.1728185, 1.493668, -0.9060717, 1, 1, 1, 1, 1,
-0.1727168, -1.182515, -2.529588, 1, 1, 1, 1, 1,
-0.1688467, 1.554556, -0.7920569, 1, 1, 1, 1, 1,
-0.164742, -0.471347, -1.055901, 1, 1, 1, 1, 1,
-0.1646494, 1.12617, -0.9209698, 1, 1, 1, 1, 1,
-0.1633683, -0.7151635, -1.500131, 1, 1, 1, 1, 1,
-0.1599062, 0.9484279, -0.3995762, 1, 1, 1, 1, 1,
-0.1553516, -1.228632, -2.414307, 1, 1, 1, 1, 1,
-0.1517758, -0.6551056, -2.607238, 1, 1, 1, 1, 1,
-0.1491401, 0.8930601, -0.7528121, 1, 1, 1, 1, 1,
-0.1435452, -1.131166, -3.83462, 1, 1, 1, 1, 1,
-0.1405363, 1.915548, 1.784788, 1, 1, 1, 1, 1,
-0.1395901, 0.3505099, -1.694638, 1, 1, 1, 1, 1,
-0.1350799, 1.000551, -1.580029, 1, 1, 1, 1, 1,
-0.1325893, -2.069402, -3.430627, 1, 1, 1, 1, 1,
-0.1320791, 0.6522793, -2.965183, 0, 0, 1, 1, 1,
-0.130062, -1.265829, -3.161368, 1, 0, 0, 1, 1,
-0.1298845, -1.190262, -4.081174, 1, 0, 0, 1, 1,
-0.1266448, 1.492246, -0.5450468, 1, 0, 0, 1, 1,
-0.1235542, -1.447412, -4.695516, 1, 0, 0, 1, 1,
-0.1234893, -2.504975, -3.155015, 1, 0, 0, 1, 1,
-0.1222689, 0.1489381, -2.124289, 0, 0, 0, 1, 1,
-0.1212992, 0.8010741, -0.6797857, 0, 0, 0, 1, 1,
-0.1133174, 0.385744, -0.6795469, 0, 0, 0, 1, 1,
-0.1061212, -0.4617267, -2.797308, 0, 0, 0, 1, 1,
-0.1039742, -1.064245, -3.158211, 0, 0, 0, 1, 1,
-0.09999534, 1.650712, 1.430832, 0, 0, 0, 1, 1,
-0.09579395, -0.1702309, -2.805781, 0, 0, 0, 1, 1,
-0.09527472, 1.098114, -1.226191, 1, 1, 1, 1, 1,
-0.09523269, 0.8585879, 0.1975216, 1, 1, 1, 1, 1,
-0.0948073, -1.144428, -3.838617, 1, 1, 1, 1, 1,
-0.09403613, 0.2535861, -0.07618731, 1, 1, 1, 1, 1,
-0.09238882, -1.344635, -2.896811, 1, 1, 1, 1, 1,
-0.08940522, 1.052866, -0.8412042, 1, 1, 1, 1, 1,
-0.08676112, -2.280169, -2.120223, 1, 1, 1, 1, 1,
-0.08553838, 0.1825499, 0.6694191, 1, 1, 1, 1, 1,
-0.08457185, -1.080459, -2.73256, 1, 1, 1, 1, 1,
-0.07606235, 0.01119204, -1.31611, 1, 1, 1, 1, 1,
-0.07075352, -0.1056337, -2.376619, 1, 1, 1, 1, 1,
-0.06829664, 0.8607023, -0.2321547, 1, 1, 1, 1, 1,
-0.06716082, 0.7623083, -1.049398, 1, 1, 1, 1, 1,
-0.05904647, -0.4864877, -3.152298, 1, 1, 1, 1, 1,
-0.05661828, 0.3336488, 0.8351083, 1, 1, 1, 1, 1,
-0.05528345, 1.521031, -0.9269824, 0, 0, 1, 1, 1,
-0.05471303, 0.5211515, 1.13811, 1, 0, 0, 1, 1,
-0.05432954, -0.7643767, -3.208175, 1, 0, 0, 1, 1,
-0.0530238, -0.2346079, -3.674923, 1, 0, 0, 1, 1,
-0.0490083, -0.1340044, -4.682703, 1, 0, 0, 1, 1,
-0.04709671, 0.8556541, -1.203617, 1, 0, 0, 1, 1,
-0.04413252, -0.9400216, -4.121416, 0, 0, 0, 1, 1,
-0.04372865, -0.8730475, -3.277182, 0, 0, 0, 1, 1,
-0.0412818, -0.01201003, -2.570462, 0, 0, 0, 1, 1,
-0.03944024, -0.1432774, -2.230587, 0, 0, 0, 1, 1,
-0.03815302, 2.28363, 0.3368609, 0, 0, 0, 1, 1,
-0.03781433, -0.4863567, -2.32952, 0, 0, 0, 1, 1,
-0.03391846, -0.4231455, -3.20292, 0, 0, 0, 1, 1,
-0.03209823, 0.04309288, -0.5992189, 1, 1, 1, 1, 1,
-0.03136376, -0.4620653, -3.888609, 1, 1, 1, 1, 1,
-0.02869159, -0.7458693, -2.936516, 1, 1, 1, 1, 1,
-0.01569926, -0.9900071, -1.343841, 1, 1, 1, 1, 1,
-0.0151352, -1.169866, -4.789281, 1, 1, 1, 1, 1,
-0.01418735, 0.3987373, -1.268783, 1, 1, 1, 1, 1,
-0.008242046, -0.1035542, -3.614058, 1, 1, 1, 1, 1,
-0.00586975, 0.3574149, -0.2497017, 1, 1, 1, 1, 1,
-0.001892848, 1.635282, -0.3034142, 1, 1, 1, 1, 1,
-0.001026921, 0.9877283, -0.1361003, 1, 1, 1, 1, 1,
0.003044341, -1.982104, 3.038853, 1, 1, 1, 1, 1,
0.007578398, 1.218735, -1.201896, 1, 1, 1, 1, 1,
0.008008854, 0.736176, 0.5812607, 1, 1, 1, 1, 1,
0.00946572, -0.2899317, 2.630218, 1, 1, 1, 1, 1,
0.01140037, 0.772872, 1.571847, 1, 1, 1, 1, 1,
0.01261351, -0.6491617, 3.38598, 0, 0, 1, 1, 1,
0.01851762, 0.3838379, 0.3684571, 1, 0, 0, 1, 1,
0.02189807, -1.390983, 1.23802, 1, 0, 0, 1, 1,
0.0249076, 0.6056753, 0.840268, 1, 0, 0, 1, 1,
0.02606103, -0.1537557, 2.327906, 1, 0, 0, 1, 1,
0.02616673, -1.439904, 1.923348, 1, 0, 0, 1, 1,
0.0288091, -0.9913014, 3.369672, 0, 0, 0, 1, 1,
0.0288502, -0.3343339, 3.5056, 0, 0, 0, 1, 1,
0.03198846, 0.6812856, 1.550238, 0, 0, 0, 1, 1,
0.03502348, -0.09725097, 3.258849, 0, 0, 0, 1, 1,
0.03605359, -0.346311, 3.922724, 0, 0, 0, 1, 1,
0.03615451, -0.1297153, 1.620289, 0, 0, 0, 1, 1,
0.037466, 1.711262, 0.8858939, 0, 0, 0, 1, 1,
0.03932902, -0.7514203, 3.660752, 1, 1, 1, 1, 1,
0.0397648, 0.47354, -2.410585, 1, 1, 1, 1, 1,
0.04590735, 0.9115155, -0.9490103, 1, 1, 1, 1, 1,
0.04659336, -0.1743706, 3.721933, 1, 1, 1, 1, 1,
0.04958983, 0.8481308, 0.9819859, 1, 1, 1, 1, 1,
0.05150197, -0.1421784, 1.917662, 1, 1, 1, 1, 1,
0.05384305, -0.6112543, 3.29442, 1, 1, 1, 1, 1,
0.05564627, 0.8184029, -0.06833442, 1, 1, 1, 1, 1,
0.06062484, -1.450278, 1.28984, 1, 1, 1, 1, 1,
0.06165604, -0.2059878, 2.817235, 1, 1, 1, 1, 1,
0.07025301, -0.771562, 2.876389, 1, 1, 1, 1, 1,
0.07065491, -0.7505715, 4.23407, 1, 1, 1, 1, 1,
0.07460219, -1.053893, 3.193207, 1, 1, 1, 1, 1,
0.0768107, -0.7242534, 3.053269, 1, 1, 1, 1, 1,
0.07866764, 3.289929, -1.705322, 1, 1, 1, 1, 1,
0.07904091, -0.0935123, 3.94852, 0, 0, 1, 1, 1,
0.07992117, -0.4581591, 3.683359, 1, 0, 0, 1, 1,
0.08050133, 0.04927516, 0.5008124, 1, 0, 0, 1, 1,
0.08216036, 0.2384945, -0.655709, 1, 0, 0, 1, 1,
0.08278292, 0.3358977, -0.8139825, 1, 0, 0, 1, 1,
0.08596101, 0.8885772, -0.08870964, 1, 0, 0, 1, 1,
0.0865138, -0.2544239, 2.703188, 0, 0, 0, 1, 1,
0.08805873, 0.7661749, 0.6473403, 0, 0, 0, 1, 1,
0.08837358, 0.5371727, 0.8679621, 0, 0, 0, 1, 1,
0.09085011, -1.058842, 2.861192, 0, 0, 0, 1, 1,
0.09347003, 0.6635978, -1.289773, 0, 0, 0, 1, 1,
0.09467896, 0.3683138, -0.05377972, 0, 0, 0, 1, 1,
0.09505625, 3.001841, 0.5807184, 0, 0, 0, 1, 1,
0.09595047, 1.618548, -1.732287, 1, 1, 1, 1, 1,
0.0975597, 0.7686391, -0.1274007, 1, 1, 1, 1, 1,
0.1006064, 2.381022, 0.6608905, 1, 1, 1, 1, 1,
0.1080861, 0.196275, 1.556052, 1, 1, 1, 1, 1,
0.1081714, 0.9202807, 1.885699, 1, 1, 1, 1, 1,
0.1100157, -2.431039, 4.227239, 1, 1, 1, 1, 1,
0.1114875, -0.6548926, 3.109309, 1, 1, 1, 1, 1,
0.1119055, -0.3246729, 3.965382, 1, 1, 1, 1, 1,
0.1143907, -0.2864265, 3.945531, 1, 1, 1, 1, 1,
0.1192906, 1.222417, 1.321173, 1, 1, 1, 1, 1,
0.12161, 0.5267735, -1.981626, 1, 1, 1, 1, 1,
0.1243547, -1.132915, 4.064863, 1, 1, 1, 1, 1,
0.1280471, -0.587851, 2.555088, 1, 1, 1, 1, 1,
0.131111, 0.862844, -2.025982, 1, 1, 1, 1, 1,
0.1313425, -0.6928332, 2.720448, 1, 1, 1, 1, 1,
0.1336049, 1.598563, -0.3107214, 0, 0, 1, 1, 1,
0.1355039, 0.8923045, -0.7831406, 1, 0, 0, 1, 1,
0.1363099, -0.2076258, 2.54844, 1, 0, 0, 1, 1,
0.1370225, 1.80907, -0.3637299, 1, 0, 0, 1, 1,
0.1382811, 1.159492, 0.6083765, 1, 0, 0, 1, 1,
0.15492, 0.8052099, 1.615503, 1, 0, 0, 1, 1,
0.1555882, 0.8186941, -0.6628197, 0, 0, 0, 1, 1,
0.1612721, -0.4868888, 4.024728, 0, 0, 0, 1, 1,
0.1631579, 1.059112, 0.81533, 0, 0, 0, 1, 1,
0.1672337, 0.7604536, 0.5518643, 0, 0, 0, 1, 1,
0.1689998, -0.639456, 3.238563, 0, 0, 0, 1, 1,
0.170917, 1.534155, 0.7338133, 0, 0, 0, 1, 1,
0.1785073, -1.252543, 3.487463, 0, 0, 0, 1, 1,
0.1850322, 0.894576, -0.7463349, 1, 1, 1, 1, 1,
0.1852738, -0.7530283, 3.137412, 1, 1, 1, 1, 1,
0.1908976, 0.5947106, -0.5791369, 1, 1, 1, 1, 1,
0.1936242, 0.06098001, 1.688835, 1, 1, 1, 1, 1,
0.1961625, -1.18588, 3.983005, 1, 1, 1, 1, 1,
0.1985999, 0.635614, -0.6410247, 1, 1, 1, 1, 1,
0.2041183, 1.028665, -0.4686195, 1, 1, 1, 1, 1,
0.2084171, 1.088686, -2.059604, 1, 1, 1, 1, 1,
0.2092453, -0.04768116, 3.194555, 1, 1, 1, 1, 1,
0.2097579, -1.273572, 2.026214, 1, 1, 1, 1, 1,
0.212308, 1.284257, 0.1334577, 1, 1, 1, 1, 1,
0.2182218, 1.986787, -0.8673281, 1, 1, 1, 1, 1,
0.2260944, -0.5928237, 1.002653, 1, 1, 1, 1, 1,
0.2289239, 1.680791, 0.8614715, 1, 1, 1, 1, 1,
0.2306464, 1.069731, -1.639052, 1, 1, 1, 1, 1,
0.2334163, -0.3142509, 2.120495, 0, 0, 1, 1, 1,
0.240827, 0.6301123, 0.3008459, 1, 0, 0, 1, 1,
0.2430165, 0.6696286, -0.8816577, 1, 0, 0, 1, 1,
0.2434077, -1.639035, 4.322255, 1, 0, 0, 1, 1,
0.2441741, 0.401555, 0.2855834, 1, 0, 0, 1, 1,
0.2475053, 1.261234, 0.9431326, 1, 0, 0, 1, 1,
0.249131, 2.031966, 1.131925, 0, 0, 0, 1, 1,
0.2522147, 0.4149991, 0.5536948, 0, 0, 0, 1, 1,
0.2541889, 0.3350955, -0.1079562, 0, 0, 0, 1, 1,
0.255462, 0.860518, 0.5120059, 0, 0, 0, 1, 1,
0.25771, -1.488995, 3.549391, 0, 0, 0, 1, 1,
0.259256, -0.7396984, 0.6222914, 0, 0, 0, 1, 1,
0.261584, 0.490519, 0.2272641, 0, 0, 0, 1, 1,
0.2655494, -0.4398439, 2.532913, 1, 1, 1, 1, 1,
0.2656001, -0.2077394, 0.2704858, 1, 1, 1, 1, 1,
0.2674592, -0.9370133, 3.125756, 1, 1, 1, 1, 1,
0.2700929, 1.456779, 0.3127848, 1, 1, 1, 1, 1,
0.2705211, 0.5177517, 1.086922, 1, 1, 1, 1, 1,
0.2772357, 0.3725359, 1.053254, 1, 1, 1, 1, 1,
0.2853018, 1.345745, 0.1249155, 1, 1, 1, 1, 1,
0.2860546, -0.001732198, -0.4188436, 1, 1, 1, 1, 1,
0.2874746, -0.3784606, 2.57985, 1, 1, 1, 1, 1,
0.2883692, 0.138293, 2.845167, 1, 1, 1, 1, 1,
0.2974649, -0.2601671, 2.301342, 1, 1, 1, 1, 1,
0.2976134, -0.339594, 3.543577, 1, 1, 1, 1, 1,
0.2990812, 0.6315868, 1.746908, 1, 1, 1, 1, 1,
0.3005891, 0.9929216, -0.6978281, 1, 1, 1, 1, 1,
0.3040799, 0.432488, -0.4327374, 1, 1, 1, 1, 1,
0.3048623, 0.7276724, -0.1918003, 0, 0, 1, 1, 1,
0.3060174, -0.5216832, 3.045271, 1, 0, 0, 1, 1,
0.3061264, 1.38137, 0.7228845, 1, 0, 0, 1, 1,
0.307874, 1.007459, 0.07867949, 1, 0, 0, 1, 1,
0.3100744, -1.266624, 2.906811, 1, 0, 0, 1, 1,
0.3156049, -0.6524739, 2.508218, 1, 0, 0, 1, 1,
0.3162386, 1.18371, 0.2408226, 0, 0, 0, 1, 1,
0.3246397, 0.8957804, 0.2488063, 0, 0, 0, 1, 1,
0.3274904, 0.7421978, 0.9244504, 0, 0, 0, 1, 1,
0.3302096, 0.4307476, 1.445035, 0, 0, 0, 1, 1,
0.3308361, 0.9863405, 0.6258302, 0, 0, 0, 1, 1,
0.3315435, -1.682027, 1.875323, 0, 0, 0, 1, 1,
0.3385488, 0.3540182, 0.4576021, 0, 0, 0, 1, 1,
0.3408169, -1.839752, 4.618656, 1, 1, 1, 1, 1,
0.3474262, -0.08562748, 1.900057, 1, 1, 1, 1, 1,
0.3488591, -0.1553005, 1.411331, 1, 1, 1, 1, 1,
0.3503505, -0.9364159, 3.306611, 1, 1, 1, 1, 1,
0.3524984, -1.134757, 3.686445, 1, 1, 1, 1, 1,
0.3528034, 0.3788362, 1.256702, 1, 1, 1, 1, 1,
0.3533869, -0.5296673, 2.915667, 1, 1, 1, 1, 1,
0.3563833, -0.3433121, 2.252081, 1, 1, 1, 1, 1,
0.3567005, 0.9477452, -0.4019575, 1, 1, 1, 1, 1,
0.3581716, 0.8567045, 1.003331, 1, 1, 1, 1, 1,
0.3613957, -0.7449214, 2.708541, 1, 1, 1, 1, 1,
0.3618858, -0.3111825, 1.439601, 1, 1, 1, 1, 1,
0.3622581, -0.6914757, 2.103466, 1, 1, 1, 1, 1,
0.3630315, -1.746291, 3.768809, 1, 1, 1, 1, 1,
0.3634863, -0.789456, 2.655645, 1, 1, 1, 1, 1,
0.366805, -1.19291, 2.983517, 0, 0, 1, 1, 1,
0.3697827, 0.1811188, -0.5222227, 1, 0, 0, 1, 1,
0.386246, -0.3674248, 4.392786, 1, 0, 0, 1, 1,
0.3878703, 0.9058985, 1.411629, 1, 0, 0, 1, 1,
0.3881245, -1.42189, 2.152017, 1, 0, 0, 1, 1,
0.3899594, -1.942776, 5.361102, 1, 0, 0, 1, 1,
0.393988, 0.2318947, 1.155044, 0, 0, 0, 1, 1,
0.3945681, -0.3094763, 2.933443, 0, 0, 0, 1, 1,
0.4018396, -1.425195, 1.580339, 0, 0, 0, 1, 1,
0.4019202, -0.7668338, 4.81371, 0, 0, 0, 1, 1,
0.4024129, -0.2457949, 1.382671, 0, 0, 0, 1, 1,
0.4073826, -1.87432, 2.656517, 0, 0, 0, 1, 1,
0.4086794, 0.1797473, 1.698466, 0, 0, 0, 1, 1,
0.4091277, -0.04337895, 1.807855, 1, 1, 1, 1, 1,
0.4099001, -0.9911959, 2.041716, 1, 1, 1, 1, 1,
0.4106303, 0.2441379, 1.806471, 1, 1, 1, 1, 1,
0.4114102, 1.456672, 0.9453831, 1, 1, 1, 1, 1,
0.416619, 0.7435957, -0.0354854, 1, 1, 1, 1, 1,
0.4227069, -0.08845578, 1.175308, 1, 1, 1, 1, 1,
0.4250179, -0.7632186, 1.867488, 1, 1, 1, 1, 1,
0.4256341, 0.821734, 0.5398492, 1, 1, 1, 1, 1,
0.427708, -0.801922, 1.0346, 1, 1, 1, 1, 1,
0.4366208, -0.4859484, -0.2195401, 1, 1, 1, 1, 1,
0.437025, 0.2595547, -0.2007782, 1, 1, 1, 1, 1,
0.4448509, 0.7358853, -0.4644854, 1, 1, 1, 1, 1,
0.4457943, -0.2791736, 2.311472, 1, 1, 1, 1, 1,
0.4459525, 0.1655942, 1.472185, 1, 1, 1, 1, 1,
0.4540191, 1.411947, -1.697351, 1, 1, 1, 1, 1,
0.4576173, -0.8233828, 2.98764, 0, 0, 1, 1, 1,
0.4608878, -0.4970026, 1.751517, 1, 0, 0, 1, 1,
0.4669034, 1.613176, 1.409503, 1, 0, 0, 1, 1,
0.4690617, 0.98994, -1.535301, 1, 0, 0, 1, 1,
0.4771565, -1.06834, 3.169279, 1, 0, 0, 1, 1,
0.4778067, -0.1488013, 0.3885803, 1, 0, 0, 1, 1,
0.478474, -0.3807337, 2.619462, 0, 0, 0, 1, 1,
0.4790713, 1.454263, 0.7860581, 0, 0, 0, 1, 1,
0.4791166, -0.02788417, 3.547662, 0, 0, 0, 1, 1,
0.480411, -0.9071761, 1.812116, 0, 0, 0, 1, 1,
0.4810081, -0.06845537, 2.161745, 0, 0, 0, 1, 1,
0.4853998, 1.012321, 1.972378, 0, 0, 0, 1, 1,
0.4929069, 0.2278835, 0.9660031, 0, 0, 0, 1, 1,
0.4931458, -2.294351, 2.030861, 1, 1, 1, 1, 1,
0.4943234, 0.7867573, 1.328548, 1, 1, 1, 1, 1,
0.5004798, 1.300225, 2.137629, 1, 1, 1, 1, 1,
0.5062037, 0.8656065, -1.462591, 1, 1, 1, 1, 1,
0.509052, -1.697595, 2.523111, 1, 1, 1, 1, 1,
0.5126942, -0.5167277, 1.965454, 1, 1, 1, 1, 1,
0.5132949, -0.4223706, 2.189726, 1, 1, 1, 1, 1,
0.5229888, -1.073084, 3.219451, 1, 1, 1, 1, 1,
0.5261104, -0.4859471, 2.325777, 1, 1, 1, 1, 1,
0.5374224, 0.004308768, 2.586098, 1, 1, 1, 1, 1,
0.5429083, 0.5318955, 0.4974487, 1, 1, 1, 1, 1,
0.5431491, 0.5353206, -1.513315, 1, 1, 1, 1, 1,
0.5461807, 0.1359946, 1.193356, 1, 1, 1, 1, 1,
0.5477639, 0.3451637, -0.9639584, 1, 1, 1, 1, 1,
0.5589348, -0.4304293, 2.939225, 1, 1, 1, 1, 1,
0.5604905, -0.7300787, 2.334857, 0, 0, 1, 1, 1,
0.5780243, 1.145471, -1.094103, 1, 0, 0, 1, 1,
0.5789255, -0.8947061, 1.823423, 1, 0, 0, 1, 1,
0.5813736, -0.5558513, 2.362715, 1, 0, 0, 1, 1,
0.5814811, 0.00949168, 2.215966, 1, 0, 0, 1, 1,
0.5819864, -0.4531485, 2.962675, 1, 0, 0, 1, 1,
0.5825652, -0.9306351, 2.701884, 0, 0, 0, 1, 1,
0.5835509, -1.2006, 2.477779, 0, 0, 0, 1, 1,
0.5837844, -1.37157, 2.156517, 0, 0, 0, 1, 1,
0.5853606, 0.1755464, 1.517609, 0, 0, 0, 1, 1,
0.5890926, 0.3309322, 0.6039276, 0, 0, 0, 1, 1,
0.5958921, -0.3030711, 2.387006, 0, 0, 0, 1, 1,
0.5975924, -0.664208, 1.759781, 0, 0, 0, 1, 1,
0.600953, -0.5031834, 1.813682, 1, 1, 1, 1, 1,
0.6037759, 0.6724035, -1.219163, 1, 1, 1, 1, 1,
0.60658, -0.5209515, 1.798796, 1, 1, 1, 1, 1,
0.6066358, -1.591842, 2.619559, 1, 1, 1, 1, 1,
0.608128, -0.09896319, 0.770261, 1, 1, 1, 1, 1,
0.6092713, 1.620303, 0.4162112, 1, 1, 1, 1, 1,
0.6117644, 0.6047887, 1.660821, 1, 1, 1, 1, 1,
0.6127207, 0.1585494, 1.671012, 1, 1, 1, 1, 1,
0.6135188, -0.527381, 3.038419, 1, 1, 1, 1, 1,
0.6159218, 0.985119, 2.006137, 1, 1, 1, 1, 1,
0.6159514, 0.6944519, -0.2599152, 1, 1, 1, 1, 1,
0.6196035, -0.1142035, 2.857365, 1, 1, 1, 1, 1,
0.6362669, 0.8108128, 0.7486071, 1, 1, 1, 1, 1,
0.6425719, -2.112492, 3.254713, 1, 1, 1, 1, 1,
0.6444067, -0.3577102, 3.91657, 1, 1, 1, 1, 1,
0.6481022, 0.5842938, -0.6106421, 0, 0, 1, 1, 1,
0.6503327, 2.291538, -0.6921304, 1, 0, 0, 1, 1,
0.6508316, 0.8950576, 1.404309, 1, 0, 0, 1, 1,
0.6509885, 0.5209913, 0.5929452, 1, 0, 0, 1, 1,
0.6527118, -0.4973733, 0.5693377, 1, 0, 0, 1, 1,
0.6544168, -1.225003, 3.048692, 1, 0, 0, 1, 1,
0.6663415, 0.5587273, -0.8369839, 0, 0, 0, 1, 1,
0.6672868, 1.49382, 2.769035, 0, 0, 0, 1, 1,
0.667503, 0.350292, 0.667381, 0, 0, 0, 1, 1,
0.6682026, -0.8133033, 4.338804, 0, 0, 0, 1, 1,
0.6686246, 2.041308, 0.7753785, 0, 0, 0, 1, 1,
0.6689067, 1.277208, -1.042791, 0, 0, 0, 1, 1,
0.6715989, 1.370306, 1.82692, 0, 0, 0, 1, 1,
0.6769089, -1.239282, 3.01876, 1, 1, 1, 1, 1,
0.6796965, 1.368357, 0.9367052, 1, 1, 1, 1, 1,
0.6821086, -0.3513714, 2.205177, 1, 1, 1, 1, 1,
0.6825616, -0.2667394, 1.085527, 1, 1, 1, 1, 1,
0.6889467, 0.7087274, 2.542794, 1, 1, 1, 1, 1,
0.6896718, 0.1765096, 0.7505166, 1, 1, 1, 1, 1,
0.6904907, -0.7342716, 2.61502, 1, 1, 1, 1, 1,
0.7067189, 0.1560132, 1.071211, 1, 1, 1, 1, 1,
0.7073881, 1.913009, 1.418607, 1, 1, 1, 1, 1,
0.7192175, 0.7522336, 0.5237902, 1, 1, 1, 1, 1,
0.7227617, -0.494473, 1.955882, 1, 1, 1, 1, 1,
0.7253319, 1.645365, 1.77386, 1, 1, 1, 1, 1,
0.7294315, 1.061835, 1.294781, 1, 1, 1, 1, 1,
0.7324433, 0.9866357, -0.1487319, 1, 1, 1, 1, 1,
0.7365516, -0.3812466, 1.918334, 1, 1, 1, 1, 1,
0.7495952, -0.7399215, 1.750513, 0, 0, 1, 1, 1,
0.7537266, -0.8031666, 2.260098, 1, 0, 0, 1, 1,
0.764513, -0.1857171, 2.846624, 1, 0, 0, 1, 1,
0.7677628, 0.2052964, 2.443578, 1, 0, 0, 1, 1,
0.7687477, -1.030707, 2.514052, 1, 0, 0, 1, 1,
0.7688296, -0.4821977, 2.156421, 1, 0, 0, 1, 1,
0.7722443, 0.1967449, 1.827022, 0, 0, 0, 1, 1,
0.7834098, 1.747749, 0.6273515, 0, 0, 0, 1, 1,
0.7895788, -0.1487317, -0.1233405, 0, 0, 0, 1, 1,
0.7940426, -0.6673016, 2.074082, 0, 0, 0, 1, 1,
0.7945392, -1.121491, 1.166339, 0, 0, 0, 1, 1,
0.7980368, 0.3136263, 1.414791, 0, 0, 0, 1, 1,
0.8113881, 0.5696784, 0.1803894, 0, 0, 0, 1, 1,
0.8160376, -0.4172157, 1.341289, 1, 1, 1, 1, 1,
0.8167129, 1.168419, 0.747349, 1, 1, 1, 1, 1,
0.818504, -1.291132, 3.102123, 1, 1, 1, 1, 1,
0.8193998, 0.1769819, 0.1299375, 1, 1, 1, 1, 1,
0.8298241, -0.5306423, 1.506128, 1, 1, 1, 1, 1,
0.8401832, -1.243725, 2.487024, 1, 1, 1, 1, 1,
0.8459262, -0.5892357, 2.114659, 1, 1, 1, 1, 1,
0.8514736, -0.9437693, 2.933997, 1, 1, 1, 1, 1,
0.853401, 2.303428, -1.077553, 1, 1, 1, 1, 1,
0.8567736, -0.7066961, 1.986711, 1, 1, 1, 1, 1,
0.8598983, -1.016629, 1.760248, 1, 1, 1, 1, 1,
0.8605137, 0.1229383, 1.45477, 1, 1, 1, 1, 1,
0.8614378, 0.2344628, 2.737046, 1, 1, 1, 1, 1,
0.8641433, 0.0241023, 1.414726, 1, 1, 1, 1, 1,
0.868897, 1.495174, 0.2695164, 1, 1, 1, 1, 1,
0.8714712, -0.4514655, 1.718312, 0, 0, 1, 1, 1,
0.8725289, -0.9771482, 1.553364, 1, 0, 0, 1, 1,
0.8742875, 1.504062, 1.427523, 1, 0, 0, 1, 1,
0.8828317, -1.05314, 1.357796, 1, 0, 0, 1, 1,
0.8832712, -0.8766155, 1.688049, 1, 0, 0, 1, 1,
0.8847512, 0.3499562, 0.980986, 1, 0, 0, 1, 1,
0.8891189, 0.7597901, 1.355842, 0, 0, 0, 1, 1,
0.8892542, 0.523217, 1.8127, 0, 0, 0, 1, 1,
0.8918362, 0.1915949, 1.17418, 0, 0, 0, 1, 1,
0.8945973, 0.0004371188, 3.432444, 0, 0, 0, 1, 1,
0.8980399, -0.3480954, 1.198937, 0, 0, 0, 1, 1,
0.9007467, 0.2767064, 0.9362735, 0, 0, 0, 1, 1,
0.9168454, 0.0375586, 1.607781, 0, 0, 0, 1, 1,
0.918223, 0.7167646, 0.4623527, 1, 1, 1, 1, 1,
0.9338878, 1.429692, -0.001927102, 1, 1, 1, 1, 1,
0.9340596, 1.028677, 1.651769, 1, 1, 1, 1, 1,
0.9362279, -0.4260746, 1.534828, 1, 1, 1, 1, 1,
0.9438429, -1.153535, 3.665648, 1, 1, 1, 1, 1,
0.9452662, -0.426209, 0.9906992, 1, 1, 1, 1, 1,
0.9478015, -0.3160819, 0.9532915, 1, 1, 1, 1, 1,
0.9549556, 0.06821112, 2.090779, 1, 1, 1, 1, 1,
0.9575841, 0.4838079, 0.4461022, 1, 1, 1, 1, 1,
0.9603268, 1.222708, 2.155075, 1, 1, 1, 1, 1,
0.9616663, -0.7355753, 3.709418, 1, 1, 1, 1, 1,
0.9656481, 0.9855824, 0.2284086, 1, 1, 1, 1, 1,
0.9690157, 0.6659032, 0.930603, 1, 1, 1, 1, 1,
0.9849267, -0.8827389, 3.586835, 1, 1, 1, 1, 1,
0.9854084, 1.406849, -1.489384, 1, 1, 1, 1, 1,
0.9895926, -0.7483076, 2.791673, 0, 0, 1, 1, 1,
0.9923913, 1.511967, 0.6517559, 1, 0, 0, 1, 1,
0.9939032, -0.6361479, 2.647806, 1, 0, 0, 1, 1,
0.9997698, 0.7649, 0.3319117, 1, 0, 0, 1, 1,
1.000564, 0.2285781, 0.8400247, 1, 0, 0, 1, 1,
1.007554, 1.588468, 1.88379, 1, 0, 0, 1, 1,
1.014257, -1.044511, 3.324478, 0, 0, 0, 1, 1,
1.025285, -0.8491364, 3.202296, 0, 0, 0, 1, 1,
1.03159, 0.9010746, 0.08383458, 0, 0, 0, 1, 1,
1.038676, -0.1850162, 1.64683, 0, 0, 0, 1, 1,
1.040859, 0.1038093, 1.890577, 0, 0, 0, 1, 1,
1.044963, -0.05402539, 1.217431, 0, 0, 0, 1, 1,
1.047066, -0.1164868, 0.41332, 0, 0, 0, 1, 1,
1.049346, -0.1403181, 1.505843, 1, 1, 1, 1, 1,
1.059003, 0.8310715, 1.098118, 1, 1, 1, 1, 1,
1.059812, 0.6208414, 1.237249, 1, 1, 1, 1, 1,
1.06199, 1.385741, 0.5747809, 1, 1, 1, 1, 1,
1.063227, -0.891327, 3.563712, 1, 1, 1, 1, 1,
1.071988, 0.7598268, 1.857616, 1, 1, 1, 1, 1,
1.081078, -0.7891571, 0.6776861, 1, 1, 1, 1, 1,
1.087946, 1.346528, 1.11489, 1, 1, 1, 1, 1,
1.093508, -0.08347649, 1.668456, 1, 1, 1, 1, 1,
1.094229, 0.5500991, 0.178517, 1, 1, 1, 1, 1,
1.099211, -1.062835, 3.29409, 1, 1, 1, 1, 1,
1.101191, -0.9247274, 3.809902, 1, 1, 1, 1, 1,
1.111425, 0.3068293, 0.4322452, 1, 1, 1, 1, 1,
1.111524, 1.119241, -0.1535023, 1, 1, 1, 1, 1,
1.112222, -1.045021, 2.764691, 1, 1, 1, 1, 1,
1.113234, -1.325654, 3.111495, 0, 0, 1, 1, 1,
1.118882, -0.2033471, 2.792659, 1, 0, 0, 1, 1,
1.121272, 0.1322354, 1.512698, 1, 0, 0, 1, 1,
1.126607, -1.183561, 2.169035, 1, 0, 0, 1, 1,
1.129864, 0.8900027, 0.0800496, 1, 0, 0, 1, 1,
1.13091, 2.194612, -0.1427609, 1, 0, 0, 1, 1,
1.132626, -0.5407523, 0.6528499, 0, 0, 0, 1, 1,
1.139842, -0.5325136, 0.02602688, 0, 0, 0, 1, 1,
1.142142, 0.9395767, 1.815129, 0, 0, 0, 1, 1,
1.143923, -0.8966095, 1.757719, 0, 0, 0, 1, 1,
1.148679, -0.3171973, 2.76075, 0, 0, 0, 1, 1,
1.15405, 0.3159524, 2.417293, 0, 0, 0, 1, 1,
1.157086, -0.08927593, 2.264908, 0, 0, 0, 1, 1,
1.162643, 1.392424, 0.3239779, 1, 1, 1, 1, 1,
1.165086, 0.3544619, 2.519297, 1, 1, 1, 1, 1,
1.178801, 0.06860851, 1.685403, 1, 1, 1, 1, 1,
1.181293, -0.4019372, 3.224044, 1, 1, 1, 1, 1,
1.182407, -1.268475, 2.024869, 1, 1, 1, 1, 1,
1.186209, -1.432527, 1.668033, 1, 1, 1, 1, 1,
1.187698, 0.434742, -0.1827315, 1, 1, 1, 1, 1,
1.191516, -1.340215, 1.083292, 1, 1, 1, 1, 1,
1.192218, 0.07238974, 1.718345, 1, 1, 1, 1, 1,
1.193372, 0.3280556, 1.764153, 1, 1, 1, 1, 1,
1.194246, 0.3595226, 1.509728, 1, 1, 1, 1, 1,
1.195066, -1.23661, 2.246873, 1, 1, 1, 1, 1,
1.200163, 0.2944775, 2.136714, 1, 1, 1, 1, 1,
1.206917, 0.9742991, 1.611835, 1, 1, 1, 1, 1,
1.211928, -1.195285, 3.78669, 1, 1, 1, 1, 1,
1.221746, -0.8767015, 1.621216, 0, 0, 1, 1, 1,
1.231031, -0.8033967, -0.4191604, 1, 0, 0, 1, 1,
1.235238, 0.18433, 0.7283566, 1, 0, 0, 1, 1,
1.235439, -0.2491896, 3.044297, 1, 0, 0, 1, 1,
1.242006, 0.3912999, 2.613277, 1, 0, 0, 1, 1,
1.246678, -0.08445933, 1.531669, 1, 0, 0, 1, 1,
1.263176, 0.4393649, 1.093287, 0, 0, 0, 1, 1,
1.271603, -0.1335665, 1.712749, 0, 0, 0, 1, 1,
1.280769, -0.05421857, 1.734117, 0, 0, 0, 1, 1,
1.282136, -0.9458966, 2.363917, 0, 0, 0, 1, 1,
1.283935, -0.09434693, 0.443686, 0, 0, 0, 1, 1,
1.293975, -0.4659706, 2.127536, 0, 0, 0, 1, 1,
1.297275, -0.6320859, 3.156452, 0, 0, 0, 1, 1,
1.315224, 1.226184, 0.2970794, 1, 1, 1, 1, 1,
1.319187, 0.9918399, 0.8396326, 1, 1, 1, 1, 1,
1.319332, -0.4121473, 3.090411, 1, 1, 1, 1, 1,
1.3332, -0.2127312, 0.8031554, 1, 1, 1, 1, 1,
1.33498, -0.08438198, 0.4189784, 1, 1, 1, 1, 1,
1.347432, 1.680034, 0.8857317, 1, 1, 1, 1, 1,
1.356161, 0.1711486, 4.262669, 1, 1, 1, 1, 1,
1.356357, -0.1341226, -0.6122715, 1, 1, 1, 1, 1,
1.358561, 0.5026718, 1.173675, 1, 1, 1, 1, 1,
1.366055, 0.05829285, 1.922132, 1, 1, 1, 1, 1,
1.370424, -0.7836292, 2.928293, 1, 1, 1, 1, 1,
1.371724, -0.862772, 1.711444, 1, 1, 1, 1, 1,
1.381237, -1.253095, 1.599923, 1, 1, 1, 1, 1,
1.383184, -0.1838959, 3.998399, 1, 1, 1, 1, 1,
1.387506, 0.5179288, 1.639618, 1, 1, 1, 1, 1,
1.403786, 1.032641, 2.172667, 0, 0, 1, 1, 1,
1.414219, -0.6611381, 3.011385, 1, 0, 0, 1, 1,
1.417524, -0.0465797, 1.475683, 1, 0, 0, 1, 1,
1.423038, 1.851974, 0.5397774, 1, 0, 0, 1, 1,
1.435182, 0.2139982, 1.426505, 1, 0, 0, 1, 1,
1.45175, 0.1316376, 1.720884, 1, 0, 0, 1, 1,
1.452967, 0.729142, 1.24854, 0, 0, 0, 1, 1,
1.456136, -1.366744, 1.232097, 0, 0, 0, 1, 1,
1.459408, -1.35479, 1.341174, 0, 0, 0, 1, 1,
1.470523, -0.5153769, 2.44348, 0, 0, 0, 1, 1,
1.484056, -1.042086, 1.929844, 0, 0, 0, 1, 1,
1.497978, -0.1722069, -0.003751172, 0, 0, 0, 1, 1,
1.501895, -0.2700323, 0.7646393, 0, 0, 0, 1, 1,
1.510438, -0.5069608, 2.897256, 1, 1, 1, 1, 1,
1.512255, 0.6958702, 1.192477, 1, 1, 1, 1, 1,
1.524055, -1.187289, 4.513881, 1, 1, 1, 1, 1,
1.524619, 0.3523278, 1.712557, 1, 1, 1, 1, 1,
1.530164, -0.2799343, 2.529149, 1, 1, 1, 1, 1,
1.534265, -1.050073, 3.46359, 1, 1, 1, 1, 1,
1.547847, 2.123682, -2.002971, 1, 1, 1, 1, 1,
1.550414, 0.3083431, 2.156145, 1, 1, 1, 1, 1,
1.55682, 1.639901, 0.2278324, 1, 1, 1, 1, 1,
1.562923, -1.221635, 0.3961023, 1, 1, 1, 1, 1,
1.56673, -0.9431047, 2.185047, 1, 1, 1, 1, 1,
1.570293, 0.7142901, 0.9567959, 1, 1, 1, 1, 1,
1.571163, -0.05075982, 1.158646, 1, 1, 1, 1, 1,
1.581007, 0.753927, -0.2437288, 1, 1, 1, 1, 1,
1.581841, 0.8586008, 2.533317, 1, 1, 1, 1, 1,
1.584148, 0.1069943, 1.664507, 0, 0, 1, 1, 1,
1.659142, -0.6856012, 3.258883, 1, 0, 0, 1, 1,
1.66102, -0.8097907, 1.586358, 1, 0, 0, 1, 1,
1.673517, -0.5954887, 0.7213596, 1, 0, 0, 1, 1,
1.679836, 0.7871903, -0.3746925, 1, 0, 0, 1, 1,
1.689378, -1.165218, 2.29331, 1, 0, 0, 1, 1,
1.696592, -0.1036666, 1.891227, 0, 0, 0, 1, 1,
1.71257, -2.052899, 2.867793, 0, 0, 0, 1, 1,
1.741714, -1.15339, 1.367616, 0, 0, 0, 1, 1,
1.74694, 0.7871096, 0.5729931, 0, 0, 0, 1, 1,
1.75622, 0.3434116, 0.9196883, 0, 0, 0, 1, 1,
1.757746, 0.4913058, 0.3805991, 0, 0, 0, 1, 1,
1.77594, -1.019906, 3.386491, 0, 0, 0, 1, 1,
1.784715, 0.6898944, 2.163854, 1, 1, 1, 1, 1,
1.789122, -1.079708, 2.372495, 1, 1, 1, 1, 1,
1.811855, -0.158334, 1.326806, 1, 1, 1, 1, 1,
1.823533, 1.496586, 2.131436, 1, 1, 1, 1, 1,
1.844719, -0.1770952, 0.3252909, 1, 1, 1, 1, 1,
1.874705, -0.5697331, 1.725892, 1, 1, 1, 1, 1,
1.882296, 0.7767389, 1.475594, 1, 1, 1, 1, 1,
1.896944, 0.413886, 0.814983, 1, 1, 1, 1, 1,
1.902281, -0.7389599, 3.476292, 1, 1, 1, 1, 1,
1.940534, -1.866094, 2.264153, 1, 1, 1, 1, 1,
1.945951, -0.4263771, 3.625676, 1, 1, 1, 1, 1,
1.961906, 0.7381363, 1.850831, 1, 1, 1, 1, 1,
1.964729, -0.1245593, 1.274509, 1, 1, 1, 1, 1,
1.986177, -0.1097202, 0.6922219, 1, 1, 1, 1, 1,
1.999129, 0.1753856, 1.474634, 1, 1, 1, 1, 1,
2.031708, 0.2555372, 3.030659, 0, 0, 1, 1, 1,
2.036501, -1.056007, 2.615084, 1, 0, 0, 1, 1,
2.07552, 0.922335, 2.664518, 1, 0, 0, 1, 1,
2.155634, -1.821704, 3.589963, 1, 0, 0, 1, 1,
2.164882, -0.2764844, 0.7797647, 1, 0, 0, 1, 1,
2.168249, 0.04349961, 2.287011, 1, 0, 0, 1, 1,
2.214509, -1.918364, 2.765585, 0, 0, 0, 1, 1,
2.227116, -1.087761, 2.496484, 0, 0, 0, 1, 1,
2.345445, 1.147059, 0.088172, 0, 0, 0, 1, 1,
2.40538, 0.6434572, 1.498379, 0, 0, 0, 1, 1,
2.420896, -0.2821601, 2.992502, 0, 0, 0, 1, 1,
2.448353, 1.009342, 1.973199, 0, 0, 0, 1, 1,
2.473273, 2.475129, -0.4263843, 0, 0, 0, 1, 1,
2.520455, 0.2173493, 0.9318073, 1, 1, 1, 1, 1,
2.723856, -0.8362189, 1.024333, 1, 1, 1, 1, 1,
2.826613, -0.0371121, 1.349262, 1, 1, 1, 1, 1,
2.830125, 0.7560773, -0.2479216, 1, 1, 1, 1, 1,
2.839736, 0.1172858, 1.52044, 1, 1, 1, 1, 1,
3.361937, -1.015164, 1.296111, 1, 1, 1, 1, 1,
3.396151, 1.695138, 0.6037201, 1, 1, 1, 1, 1
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
var radius = 9.634046;
var distance = 33.83918;
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
mvMatrix.translate( 0.02297115, -0.2361245, 0.02204084 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.83918);
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
