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
-3.025128, -1.030944, -2.273447, 1, 0, 0, 1,
-2.807632, -0.3778655, -1.64045, 1, 0.007843138, 0, 1,
-2.761774, -0.1472719, -0.2520105, 1, 0.01176471, 0, 1,
-2.76044, -0.6901042, -1.769623, 1, 0.01960784, 0, 1,
-2.72512, 0.676181, -0.7333678, 1, 0.02352941, 0, 1,
-2.406497, -0.3918761, -1.837019, 1, 0.03137255, 0, 1,
-2.402192, -0.2061768, -0.5835177, 1, 0.03529412, 0, 1,
-2.388374, -0.1815093, -2.33871, 1, 0.04313726, 0, 1,
-2.353931, -1.551586, -1.362894, 1, 0.04705882, 0, 1,
-2.341829, 1.797089, -0.8817462, 1, 0.05490196, 0, 1,
-2.321206, 0.3387204, -0.8949637, 1, 0.05882353, 0, 1,
-2.289441, 1.178645, -0.1624724, 1, 0.06666667, 0, 1,
-2.266976, 0.9173315, -1.408791, 1, 0.07058824, 0, 1,
-2.258439, -2.452213, -2.727596, 1, 0.07843138, 0, 1,
-2.237547, -1.567518, -2.071288, 1, 0.08235294, 0, 1,
-2.158564, -0.1626431, -1.522884, 1, 0.09019608, 0, 1,
-2.134454, -0.6693769, -0.03812191, 1, 0.09411765, 0, 1,
-2.122308, -1.690006, -3.461597, 1, 0.1019608, 0, 1,
-2.116125, -1.404705, -4.064041, 1, 0.1098039, 0, 1,
-2.087006, 0.7569443, -2.104531, 1, 0.1137255, 0, 1,
-2.082962, 1.574694, -1.443227, 1, 0.1215686, 0, 1,
-2.070409, -0.007740336, -1.139185, 1, 0.1254902, 0, 1,
-2.066875, 1.460602, -1.185324, 1, 0.1333333, 0, 1,
-2.060544, 1.18639, -0.8729556, 1, 0.1372549, 0, 1,
-2.029869, 0.4298982, 0.1358218, 1, 0.145098, 0, 1,
-2.023082, 0.44052, -1.487348, 1, 0.1490196, 0, 1,
-1.979125, -0.3272999, -0.2121574, 1, 0.1568628, 0, 1,
-1.976134, -0.3439077, -1.370344, 1, 0.1607843, 0, 1,
-1.970798, -1.207264, -3.395633, 1, 0.1686275, 0, 1,
-1.963421, -1.75694, -0.9526601, 1, 0.172549, 0, 1,
-1.948997, 0.2703958, 0.4888769, 1, 0.1803922, 0, 1,
-1.926159, 0.7908868, -1.570267, 1, 0.1843137, 0, 1,
-1.890287, -0.2561193, -2.322773, 1, 0.1921569, 0, 1,
-1.885532, -0.662737, -1.831047, 1, 0.1960784, 0, 1,
-1.864472, -0.8937454, -2.632683, 1, 0.2039216, 0, 1,
-1.852923, -0.1009691, -1.84947, 1, 0.2117647, 0, 1,
-1.825224, -0.1545561, 0.08092224, 1, 0.2156863, 0, 1,
-1.797085, 0.4794242, 0.6687381, 1, 0.2235294, 0, 1,
-1.795293, 0.3726093, -0.8967271, 1, 0.227451, 0, 1,
-1.785314, -1.13429, -2.718259, 1, 0.2352941, 0, 1,
-1.764756, -0.5827371, -1.522822, 1, 0.2392157, 0, 1,
-1.743693, -0.4859638, 0.351831, 1, 0.2470588, 0, 1,
-1.737375, 2.147972, -0.9819665, 1, 0.2509804, 0, 1,
-1.7335, 0.7325827, -2.401623, 1, 0.2588235, 0, 1,
-1.715273, 1.607065, -1.452654, 1, 0.2627451, 0, 1,
-1.695582, -1.007572, -3.167858, 1, 0.2705882, 0, 1,
-1.676658, -0.4196299, -2.549359, 1, 0.2745098, 0, 1,
-1.672179, 1.433745, -0.03163756, 1, 0.282353, 0, 1,
-1.655512, 2.511703, -0.2138949, 1, 0.2862745, 0, 1,
-1.655174, 0.225256, -0.6750197, 1, 0.2941177, 0, 1,
-1.647254, -0.5612739, -3.155914, 1, 0.3019608, 0, 1,
-1.634483, 0.7078939, 0.5478055, 1, 0.3058824, 0, 1,
-1.62486, -1.175387, -2.961259, 1, 0.3137255, 0, 1,
-1.613384, 0.6654013, -0.7748839, 1, 0.3176471, 0, 1,
-1.608209, -0.1689293, -1.981274, 1, 0.3254902, 0, 1,
-1.59954, 1.753984, -1.731722, 1, 0.3294118, 0, 1,
-1.587657, -0.1808549, -0.775665, 1, 0.3372549, 0, 1,
-1.585681, -0.332207, -1.129416, 1, 0.3411765, 0, 1,
-1.578479, -0.69751, -1.753253, 1, 0.3490196, 0, 1,
-1.57797, -0.2335494, -1.16416, 1, 0.3529412, 0, 1,
-1.571382, -1.304273, -1.914105, 1, 0.3607843, 0, 1,
-1.569781, 0.4114512, 1.688662, 1, 0.3647059, 0, 1,
-1.564352, 0.4490493, -2.947326, 1, 0.372549, 0, 1,
-1.556829, 1.545212, 0.03869086, 1, 0.3764706, 0, 1,
-1.555856, -2.156365, -2.084998, 1, 0.3843137, 0, 1,
-1.549984, 1.204922, -1.626206, 1, 0.3882353, 0, 1,
-1.548448, -0.687744, -2.527415, 1, 0.3960784, 0, 1,
-1.540419, 0.2077403, -1.754568, 1, 0.4039216, 0, 1,
-1.535758, -0.5382154, -1.852639, 1, 0.4078431, 0, 1,
-1.523235, -1.232163, -2.352368, 1, 0.4156863, 0, 1,
-1.508207, -0.04952053, -2.380937, 1, 0.4196078, 0, 1,
-1.507459, 0.1573209, -1.330077, 1, 0.427451, 0, 1,
-1.504901, -0.2779686, -2.005195, 1, 0.4313726, 0, 1,
-1.503495, 0.1011519, -0.2513295, 1, 0.4392157, 0, 1,
-1.492112, -0.9862346, -1.584646, 1, 0.4431373, 0, 1,
-1.473189, 0.8602743, -0.8536217, 1, 0.4509804, 0, 1,
-1.466646, 0.3193427, -2.348442, 1, 0.454902, 0, 1,
-1.459213, -1.495924, -2.795306, 1, 0.4627451, 0, 1,
-1.456957, 0.1967479, -1.223285, 1, 0.4666667, 0, 1,
-1.455007, -0.8131559, -0.9346815, 1, 0.4745098, 0, 1,
-1.43892, 0.2931139, -3.153953, 1, 0.4784314, 0, 1,
-1.432146, -0.01597192, -1.693312, 1, 0.4862745, 0, 1,
-1.424412, -0.2269675, -3.406682, 1, 0.4901961, 0, 1,
-1.423237, 0.6271901, -3.33778, 1, 0.4980392, 0, 1,
-1.411085, 1.726447, -0.7597705, 1, 0.5058824, 0, 1,
-1.395668, -0.3071739, -2.140578, 1, 0.509804, 0, 1,
-1.369354, -1.477425, -2.680824, 1, 0.5176471, 0, 1,
-1.360183, 1.362023, -1.147938, 1, 0.5215687, 0, 1,
-1.359964, 0.4412117, -3.293985, 1, 0.5294118, 0, 1,
-1.350122, 0.7152389, -0.2400041, 1, 0.5333334, 0, 1,
-1.339662, 1.270168, -1.021407, 1, 0.5411765, 0, 1,
-1.332338, 1.051123, -0.9104494, 1, 0.5450981, 0, 1,
-1.329967, 1.380668, -1.288703, 1, 0.5529412, 0, 1,
-1.329735, 1.637454, -1.353317, 1, 0.5568628, 0, 1,
-1.323064, -0.6928951, -1.553226, 1, 0.5647059, 0, 1,
-1.308817, 0.1109673, -0.1797244, 1, 0.5686275, 0, 1,
-1.308775, -0.4417276, -1.17469, 1, 0.5764706, 0, 1,
-1.305217, -0.8586425, -1.808016, 1, 0.5803922, 0, 1,
-1.304799, 0.6576613, -0.4432209, 1, 0.5882353, 0, 1,
-1.268991, 0.3640682, -1.151665, 1, 0.5921569, 0, 1,
-1.268181, -1.518526, -1.022705, 1, 0.6, 0, 1,
-1.266109, 2.758712, -1.757115, 1, 0.6078432, 0, 1,
-1.265708, -0.7933351, -0.8911939, 1, 0.6117647, 0, 1,
-1.265107, 1.326592, -2.6301, 1, 0.6196079, 0, 1,
-1.26289, -1.027189, -2.448119, 1, 0.6235294, 0, 1,
-1.254509, 0.4196943, -2.659194, 1, 0.6313726, 0, 1,
-1.247916, -0.1378764, -0.3755009, 1, 0.6352941, 0, 1,
-1.238686, -0.0388896, -0.7887368, 1, 0.6431373, 0, 1,
-1.237855, -0.06820973, -1.527636, 1, 0.6470588, 0, 1,
-1.235303, -0.6653787, -2.258066, 1, 0.654902, 0, 1,
-1.233346, 1.792208, -0.2438831, 1, 0.6588235, 0, 1,
-1.225316, 1.233103, -0.1792831, 1, 0.6666667, 0, 1,
-1.221561, -0.9651444, -1.491335, 1, 0.6705883, 0, 1,
-1.215419, -1.256418, -3.473073, 1, 0.6784314, 0, 1,
-1.211561, 1.954492, 0.2280643, 1, 0.682353, 0, 1,
-1.20536, 1.257589, -1.696524, 1, 0.6901961, 0, 1,
-1.201915, -0.5787572, -2.525649, 1, 0.6941177, 0, 1,
-1.19601, 1.809224, -1.77686, 1, 0.7019608, 0, 1,
-1.18755, 0.7644103, -0.9593483, 1, 0.7098039, 0, 1,
-1.179782, 0.4414492, -1.563241, 1, 0.7137255, 0, 1,
-1.178053, 0.6802971, -4.165531, 1, 0.7215686, 0, 1,
-1.175778, 0.9412757, 0.06563606, 1, 0.7254902, 0, 1,
-1.174629, -0.09323107, -0.7226868, 1, 0.7333333, 0, 1,
-1.158952, 0.3201891, -0.4882034, 1, 0.7372549, 0, 1,
-1.158325, 1.011579, 0.4958623, 1, 0.7450981, 0, 1,
-1.15439, 0.4374654, -2.37741, 1, 0.7490196, 0, 1,
-1.15046, 1.945502, -0.5873583, 1, 0.7568628, 0, 1,
-1.15034, -1.248261, -3.037779, 1, 0.7607843, 0, 1,
-1.149786, -0.6785185, -1.627835, 1, 0.7686275, 0, 1,
-1.146938, 1.651976, 0.5045341, 1, 0.772549, 0, 1,
-1.143694, 0.78676, -0.1323974, 1, 0.7803922, 0, 1,
-1.139871, 1.297648, 0.2275205, 1, 0.7843137, 0, 1,
-1.130601, 0.3584121, -1.455337, 1, 0.7921569, 0, 1,
-1.122019, 1.878933, -0.490219, 1, 0.7960784, 0, 1,
-1.115687, 0.06402443, -2.456037, 1, 0.8039216, 0, 1,
-1.113512, -1.866819, -2.640102, 1, 0.8117647, 0, 1,
-1.109597, 0.9502847, -1.139863, 1, 0.8156863, 0, 1,
-1.106434, 0.442024, -2.08362, 1, 0.8235294, 0, 1,
-1.105277, 2.32648, -0.01779109, 1, 0.827451, 0, 1,
-1.103029, -0.1194113, -4.014133, 1, 0.8352941, 0, 1,
-1.10099, 0.870697, 0.673972, 1, 0.8392157, 0, 1,
-1.092932, 1.026721, -1.113916, 1, 0.8470588, 0, 1,
-1.089888, -0.2208035, -1.202347, 1, 0.8509804, 0, 1,
-1.089737, -1.580291, -5.130917, 1, 0.8588235, 0, 1,
-1.086566, -0.9064979, -3.801811, 1, 0.8627451, 0, 1,
-1.082315, -1.513247, -3.777466, 1, 0.8705882, 0, 1,
-1.064084, 1.554169, -0.06339192, 1, 0.8745098, 0, 1,
-1.061369, -1.426124, -2.644357, 1, 0.8823529, 0, 1,
-1.055215, 0.4143412, -1.725932, 1, 0.8862745, 0, 1,
-1.04705, -1.488092, -2.171051, 1, 0.8941177, 0, 1,
-1.035255, 0.5074251, 1.325291, 1, 0.8980392, 0, 1,
-1.028978, -0.1797192, -0.9064173, 1, 0.9058824, 0, 1,
-1.027182, -0.1675692, -1.912666, 1, 0.9137255, 0, 1,
-1.016882, 1.311957, 0.2076929, 1, 0.9176471, 0, 1,
-1.015246, -0.7684311, -3.117316, 1, 0.9254902, 0, 1,
-1.010222, -0.5058329, -3.40851, 1, 0.9294118, 0, 1,
-1.006982, 1.682164, -2.53549, 1, 0.9372549, 0, 1,
-1.006188, -0.2349092, -0.3669809, 1, 0.9411765, 0, 1,
-0.9903029, -1.952417, -3.695677, 1, 0.9490196, 0, 1,
-0.9889798, -0.7101493, -2.169391, 1, 0.9529412, 0, 1,
-0.9767717, -0.2740617, -1.265319, 1, 0.9607843, 0, 1,
-0.9653031, 0.18044, -2.09944, 1, 0.9647059, 0, 1,
-0.9597593, 0.3003015, -2.196842, 1, 0.972549, 0, 1,
-0.9572918, 0.7304829, -1.673313, 1, 0.9764706, 0, 1,
-0.954206, -1.14601, -2.490439, 1, 0.9843137, 0, 1,
-0.9536023, 1.603908, -0.8316708, 1, 0.9882353, 0, 1,
-0.9488572, -2.465126, -1.105983, 1, 0.9960784, 0, 1,
-0.9387867, -0.8027421, -3.303362, 0.9960784, 1, 0, 1,
-0.9250589, 0.3934283, -3.043991, 0.9921569, 1, 0, 1,
-0.9186677, -2.531446, -3.467644, 0.9843137, 1, 0, 1,
-0.9156028, -1.032263, -2.776488, 0.9803922, 1, 0, 1,
-0.9147303, -0.5471978, -2.866349, 0.972549, 1, 0, 1,
-0.9053047, 0.4109789, -1.954266, 0.9686275, 1, 0, 1,
-0.9052612, 0.3170821, -1.029567, 0.9607843, 1, 0, 1,
-0.9019191, -0.7192259, -1.781672, 0.9568627, 1, 0, 1,
-0.9014518, -0.2108656, -1.083395, 0.9490196, 1, 0, 1,
-0.899125, -0.7379835, -1.73891, 0.945098, 1, 0, 1,
-0.8933867, 0.8899897, -1.753325, 0.9372549, 1, 0, 1,
-0.8908447, -1.686622, -2.37431, 0.9333333, 1, 0, 1,
-0.8885884, 0.503993, -0.1549233, 0.9254902, 1, 0, 1,
-0.8878298, -1.115724, -1.736871, 0.9215686, 1, 0, 1,
-0.8867254, 0.7699599, -3.3193, 0.9137255, 1, 0, 1,
-0.8806588, 0.2729822, -0.4873579, 0.9098039, 1, 0, 1,
-0.8789619, -1.170959, -2.408505, 0.9019608, 1, 0, 1,
-0.8690482, 1.680057, -1.425671, 0.8941177, 1, 0, 1,
-0.8685637, -1.607355, -1.811758, 0.8901961, 1, 0, 1,
-0.8681121, -0.6318222, -1.021147, 0.8823529, 1, 0, 1,
-0.8672827, -0.2604001, -1.030821, 0.8784314, 1, 0, 1,
-0.8672372, 0.4864174, -2.117278, 0.8705882, 1, 0, 1,
-0.8610616, 0.682511, -0.4573826, 0.8666667, 1, 0, 1,
-0.8603852, 1.667338, 0.8760327, 0.8588235, 1, 0, 1,
-0.8548743, -0.1844229, -1.756553, 0.854902, 1, 0, 1,
-0.8542291, -1.675352, -3.409671, 0.8470588, 1, 0, 1,
-0.853339, -1.648152, -1.954447, 0.8431373, 1, 0, 1,
-0.8467724, -0.2219464, -2.090559, 0.8352941, 1, 0, 1,
-0.8438734, 1.2549, -1.478051, 0.8313726, 1, 0, 1,
-0.8425151, -2.016795, -3.666829, 0.8235294, 1, 0, 1,
-0.8424876, -0.8739691, -3.199317, 0.8196079, 1, 0, 1,
-0.8411098, -2.121197, -1.611893, 0.8117647, 1, 0, 1,
-0.8321954, -1.66476, -2.576211, 0.8078431, 1, 0, 1,
-0.8321276, 0.9578928, -1.755183, 0.8, 1, 0, 1,
-0.8285023, -1.281418, -2.501479, 0.7921569, 1, 0, 1,
-0.8279551, 0.6677704, -1.004113, 0.7882353, 1, 0, 1,
-0.8256628, -0.3796085, 0.1057044, 0.7803922, 1, 0, 1,
-0.8245003, -0.7013299, -2.413862, 0.7764706, 1, 0, 1,
-0.8229889, -0.4890169, -0.6040765, 0.7686275, 1, 0, 1,
-0.8174932, -0.8293339, -2.238109, 0.7647059, 1, 0, 1,
-0.8124014, -0.4675119, -1.805318, 0.7568628, 1, 0, 1,
-0.8102399, -1.050679, -0.5753055, 0.7529412, 1, 0, 1,
-0.8004891, -0.09898275, -0.7685844, 0.7450981, 1, 0, 1,
-0.7970322, -0.5013302, -1.094778, 0.7411765, 1, 0, 1,
-0.79623, -0.9279655, -2.695211, 0.7333333, 1, 0, 1,
-0.7956094, 1.763329, -0.7183645, 0.7294118, 1, 0, 1,
-0.7955706, -0.675501, -1.663427, 0.7215686, 1, 0, 1,
-0.7940029, 0.5676715, -0.4629268, 0.7176471, 1, 0, 1,
-0.7883217, -0.7816485, -2.943372, 0.7098039, 1, 0, 1,
-0.7880946, -0.3277185, -2.143981, 0.7058824, 1, 0, 1,
-0.7854163, 0.2319005, -1.006323, 0.6980392, 1, 0, 1,
-0.7843026, 0.07337645, -1.948685, 0.6901961, 1, 0, 1,
-0.7831458, 0.08426097, -1.152712, 0.6862745, 1, 0, 1,
-0.7801855, 0.2732462, -2.183875, 0.6784314, 1, 0, 1,
-0.7745265, -0.7911843, -2.739578, 0.6745098, 1, 0, 1,
-0.7738131, -1.202328, -2.818854, 0.6666667, 1, 0, 1,
-0.7661485, -0.4134372, -3.015768, 0.6627451, 1, 0, 1,
-0.7624148, -0.7827488, -2.698486, 0.654902, 1, 0, 1,
-0.7621283, -1.271823, -2.135948, 0.6509804, 1, 0, 1,
-0.7539557, -1.482371, -4.300074, 0.6431373, 1, 0, 1,
-0.7492447, 0.3181414, -0.8122145, 0.6392157, 1, 0, 1,
-0.7432743, -0.578741, -3.059154, 0.6313726, 1, 0, 1,
-0.7415694, -1.086581, -3.41288, 0.627451, 1, 0, 1,
-0.7359226, 0.1252628, -3.255564, 0.6196079, 1, 0, 1,
-0.7345524, 0.2267178, -1.449351, 0.6156863, 1, 0, 1,
-0.7305289, 0.1968392, -1.288998, 0.6078432, 1, 0, 1,
-0.7296174, -1.149412, -2.854054, 0.6039216, 1, 0, 1,
-0.7277443, 0.2516856, -1.138318, 0.5960785, 1, 0, 1,
-0.7272316, 0.8914445, -1.307379, 0.5882353, 1, 0, 1,
-0.720504, -0.7863332, -1.474549, 0.5843138, 1, 0, 1,
-0.7185011, 0.8443446, 0.5213652, 0.5764706, 1, 0, 1,
-0.7087157, 0.5796568, -0.9564983, 0.572549, 1, 0, 1,
-0.7031157, -0.7263193, -1.143244, 0.5647059, 1, 0, 1,
-0.7007408, 0.9171908, -1.132558, 0.5607843, 1, 0, 1,
-0.6990184, 0.5827638, 1.053659, 0.5529412, 1, 0, 1,
-0.6978276, 0.197469, -1.755175, 0.5490196, 1, 0, 1,
-0.6961732, 0.2611074, -1.401855, 0.5411765, 1, 0, 1,
-0.6928291, -0.07257284, -2.45574, 0.5372549, 1, 0, 1,
-0.6928046, -0.6194604, -2.034711, 0.5294118, 1, 0, 1,
-0.6890719, 1.137303, -2.043873, 0.5254902, 1, 0, 1,
-0.686575, -0.2965594, -1.60266, 0.5176471, 1, 0, 1,
-0.6854709, -0.3587932, -1.854117, 0.5137255, 1, 0, 1,
-0.6842749, 0.2554185, -1.018806, 0.5058824, 1, 0, 1,
-0.6706458, 0.1387772, -2.907304, 0.5019608, 1, 0, 1,
-0.6690353, -1.083828, -1.626311, 0.4941176, 1, 0, 1,
-0.6681223, -1.205855, -3.272648, 0.4862745, 1, 0, 1,
-0.6667947, -1.11551, -2.186548, 0.4823529, 1, 0, 1,
-0.6635723, 0.5727346, -1.07475, 0.4745098, 1, 0, 1,
-0.6570575, -1.461866, -3.055935, 0.4705882, 1, 0, 1,
-0.6542135, -1.630347, -1.722817, 0.4627451, 1, 0, 1,
-0.6531415, 0.572596, -0.1469319, 0.4588235, 1, 0, 1,
-0.6451885, 0.7765667, 0.02561349, 0.4509804, 1, 0, 1,
-0.6446193, 0.4301855, -2.590575, 0.4470588, 1, 0, 1,
-0.6445292, 0.2552641, -0.2525571, 0.4392157, 1, 0, 1,
-0.6315145, 0.8617234, -1.705338, 0.4352941, 1, 0, 1,
-0.6285861, 0.6484107, 0.5626664, 0.427451, 1, 0, 1,
-0.6281158, -1.238516, -3.241596, 0.4235294, 1, 0, 1,
-0.6089954, -0.1235557, -1.067754, 0.4156863, 1, 0, 1,
-0.6038145, -0.5304726, -2.345485, 0.4117647, 1, 0, 1,
-0.6038063, 0.1205879, -1.291612, 0.4039216, 1, 0, 1,
-0.599629, 1.751862, -1.269468, 0.3960784, 1, 0, 1,
-0.5985186, -1.058591, -1.525702, 0.3921569, 1, 0, 1,
-0.5969231, -0.7406308, -2.07238, 0.3843137, 1, 0, 1,
-0.5951594, -1.375846, -1.674549, 0.3803922, 1, 0, 1,
-0.5902821, 0.1853844, -2.539469, 0.372549, 1, 0, 1,
-0.589367, 3.071367, -1.031486, 0.3686275, 1, 0, 1,
-0.5876173, -0.3709397, -0.8637136, 0.3607843, 1, 0, 1,
-0.5873104, -1.155229, -3.611545, 0.3568628, 1, 0, 1,
-0.5859711, 0.5768824, -0.1632399, 0.3490196, 1, 0, 1,
-0.5845641, -2.071951, -3.363706, 0.345098, 1, 0, 1,
-0.5819793, -1.242785, -2.767267, 0.3372549, 1, 0, 1,
-0.5809495, 0.6646948, -1.447945, 0.3333333, 1, 0, 1,
-0.5766359, 0.3556139, -1.153403, 0.3254902, 1, 0, 1,
-0.5691268, -1.378002, -2.657809, 0.3215686, 1, 0, 1,
-0.5618964, 0.3619737, -0.622191, 0.3137255, 1, 0, 1,
-0.5499012, -0.6351275, -3.181763, 0.3098039, 1, 0, 1,
-0.549721, 0.2633791, -2.18176, 0.3019608, 1, 0, 1,
-0.5438862, -0.04225105, -1.59112, 0.2941177, 1, 0, 1,
-0.5435867, 0.247434, -1.927956, 0.2901961, 1, 0, 1,
-0.540535, -0.5229799, -2.021934, 0.282353, 1, 0, 1,
-0.540321, 0.5634638, -1.098934, 0.2784314, 1, 0, 1,
-0.5390639, -0.9273787, -4.231063, 0.2705882, 1, 0, 1,
-0.5369225, 0.04683902, -2.195621, 0.2666667, 1, 0, 1,
-0.5359413, -0.01833931, -1.034937, 0.2588235, 1, 0, 1,
-0.5354386, 0.09702055, -1.729427, 0.254902, 1, 0, 1,
-0.5314602, -0.5328243, -2.149031, 0.2470588, 1, 0, 1,
-0.5248346, -0.5945079, -3.598864, 0.2431373, 1, 0, 1,
-0.5228893, -0.3711516, -1.150578, 0.2352941, 1, 0, 1,
-0.5217621, 0.9454477, 0.423227, 0.2313726, 1, 0, 1,
-0.5121447, 0.05579186, 0.5227909, 0.2235294, 1, 0, 1,
-0.5105924, -2.637406, -3.185563, 0.2196078, 1, 0, 1,
-0.5035186, 0.7236935, -0.1833609, 0.2117647, 1, 0, 1,
-0.5028157, -2.32232, -3.159429, 0.2078431, 1, 0, 1,
-0.5016785, 0.6372153, -0.9090133, 0.2, 1, 0, 1,
-0.5005366, 0.4855737, 0.4391162, 0.1921569, 1, 0, 1,
-0.4996492, 0.3319041, -1.563456, 0.1882353, 1, 0, 1,
-0.4972227, 0.9162275, -0.3128943, 0.1803922, 1, 0, 1,
-0.4959354, -0.6346251, -2.014668, 0.1764706, 1, 0, 1,
-0.495567, 0.6548039, -0.6503041, 0.1686275, 1, 0, 1,
-0.4931528, 1.531358, -0.4887785, 0.1647059, 1, 0, 1,
-0.4919897, -0.7929589, -2.751097, 0.1568628, 1, 0, 1,
-0.4876471, -0.8140728, -2.923935, 0.1529412, 1, 0, 1,
-0.4860618, 0.2602998, -0.7823172, 0.145098, 1, 0, 1,
-0.4857458, -1.472532, -2.929956, 0.1411765, 1, 0, 1,
-0.4834613, 0.9794618, -1.506247, 0.1333333, 1, 0, 1,
-0.4822567, 0.3550571, -0.400848, 0.1294118, 1, 0, 1,
-0.4713576, -0.9174161, -3.64928, 0.1215686, 1, 0, 1,
-0.4696405, 0.3723226, -1.021616, 0.1176471, 1, 0, 1,
-0.4690033, -0.7874021, -1.636902, 0.1098039, 1, 0, 1,
-0.4686451, 1.225511, -0.1326612, 0.1058824, 1, 0, 1,
-0.4678536, 0.8560573, -1.747406, 0.09803922, 1, 0, 1,
-0.4661475, 1.451873, -1.578572, 0.09019608, 1, 0, 1,
-0.4650332, 1.737778, -0.1367676, 0.08627451, 1, 0, 1,
-0.4568339, -1.211346, -1.290533, 0.07843138, 1, 0, 1,
-0.4504591, -0.6755071, -3.826868, 0.07450981, 1, 0, 1,
-0.4488179, 0.7828937, -0.2268554, 0.06666667, 1, 0, 1,
-0.4466068, -2.022475, -4.410622, 0.0627451, 1, 0, 1,
-0.4442487, 0.4652162, -0.1039932, 0.05490196, 1, 0, 1,
-0.4419715, -0.3438927, -3.083874, 0.05098039, 1, 0, 1,
-0.4387925, 0.1457194, -0.8619156, 0.04313726, 1, 0, 1,
-0.4331335, -0.06688631, -1.177248, 0.03921569, 1, 0, 1,
-0.4305296, -0.3154854, -1.241527, 0.03137255, 1, 0, 1,
-0.429466, 1.287844, 0.7211625, 0.02745098, 1, 0, 1,
-0.4281344, 0.01460474, -1.471717, 0.01960784, 1, 0, 1,
-0.4266899, -0.8057705, -2.677994, 0.01568628, 1, 0, 1,
-0.4226646, -1.089191, -3.512091, 0.007843138, 1, 0, 1,
-0.4218563, -1.186274, -4.009078, 0.003921569, 1, 0, 1,
-0.4194901, 0.4701465, 0.9134459, 0, 1, 0.003921569, 1,
-0.4179273, 0.2413362, -2.212771, 0, 1, 0.01176471, 1,
-0.4162161, 0.5562701, -0.2137482, 0, 1, 0.01568628, 1,
-0.4053612, 1.54182, -0.2037148, 0, 1, 0.02352941, 1,
-0.4018948, -1.293691, -3.294098, 0, 1, 0.02745098, 1,
-0.4017141, -1.344455, -5.008593, 0, 1, 0.03529412, 1,
-0.3988445, 0.3630925, 0.3910726, 0, 1, 0.03921569, 1,
-0.3981685, 1.184199, -0.3487163, 0, 1, 0.04705882, 1,
-0.3964838, -1.64744, -1.692885, 0, 1, 0.05098039, 1,
-0.3945853, -0.6890561, -5.050169, 0, 1, 0.05882353, 1,
-0.3910975, 0.006466907, -1.450953, 0, 1, 0.0627451, 1,
-0.3867762, 1.172755, 0.8849512, 0, 1, 0.07058824, 1,
-0.3867558, 0.2078234, -1.273277, 0, 1, 0.07450981, 1,
-0.3864844, 0.2352759, -1.892944, 0, 1, 0.08235294, 1,
-0.3854104, 0.0447478, -2.662635, 0, 1, 0.08627451, 1,
-0.3847191, -1.079502, -2.34446, 0, 1, 0.09411765, 1,
-0.3843172, -0.7820864, -0.7720177, 0, 1, 0.1019608, 1,
-0.3833076, 1.134413, -1.240192, 0, 1, 0.1058824, 1,
-0.3797325, -0.8516327, -2.755778, 0, 1, 0.1137255, 1,
-0.3768984, 0.1240783, 0.5467649, 0, 1, 0.1176471, 1,
-0.3758656, 1.149347, -1.031147, 0, 1, 0.1254902, 1,
-0.3716068, -0.370865, -3.03565, 0, 1, 0.1294118, 1,
-0.3676761, 1.100955, -1.812768, 0, 1, 0.1372549, 1,
-0.3612486, 0.8039397, -0.3189639, 0, 1, 0.1411765, 1,
-0.3554446, 0.8196946, 1.083559, 0, 1, 0.1490196, 1,
-0.3505246, -0.2678551, -2.615963, 0, 1, 0.1529412, 1,
-0.3498988, -1.923742, -3.809982, 0, 1, 0.1607843, 1,
-0.3418018, -0.2193679, -2.116385, 0, 1, 0.1647059, 1,
-0.3361439, 1.590929, 0.70748, 0, 1, 0.172549, 1,
-0.3356823, -0.07987844, -2.248475, 0, 1, 0.1764706, 1,
-0.3312708, 0.6459296, -1.589368, 0, 1, 0.1843137, 1,
-0.3285814, -2.119202, -2.713187, 0, 1, 0.1882353, 1,
-0.3247929, -2.262462, -3.123856, 0, 1, 0.1960784, 1,
-0.3201439, 1.209679, 0.1480983, 0, 1, 0.2039216, 1,
-0.3195252, -0.6507027, -3.041533, 0, 1, 0.2078431, 1,
-0.3176611, -1.204017, -2.300328, 0, 1, 0.2156863, 1,
-0.3168057, -0.1075115, -2.414554, 0, 1, 0.2196078, 1,
-0.3166353, 1.04578, -0.2913483, 0, 1, 0.227451, 1,
-0.315229, -0.2031249, -4.431149, 0, 1, 0.2313726, 1,
-0.3151059, -0.2697123, -1.777875, 0, 1, 0.2392157, 1,
-0.3125646, -0.32046, -3.115316, 0, 1, 0.2431373, 1,
-0.3011776, 1.287553, 0.6058626, 0, 1, 0.2509804, 1,
-0.3011205, -0.8895429, -2.817408, 0, 1, 0.254902, 1,
-0.2981666, 1.080715, -0.004681649, 0, 1, 0.2627451, 1,
-0.2959988, -1.136767, -4.178535, 0, 1, 0.2666667, 1,
-0.2949103, 0.3109003, -0.06746794, 0, 1, 0.2745098, 1,
-0.2924965, 1.385324, -1.859775, 0, 1, 0.2784314, 1,
-0.2871833, -0.2240091, -3.271835, 0, 1, 0.2862745, 1,
-0.2850887, -0.01160968, -1.197705, 0, 1, 0.2901961, 1,
-0.2841525, -0.1945519, -2.157821, 0, 1, 0.2980392, 1,
-0.2833564, -1.015066, -2.577308, 0, 1, 0.3058824, 1,
-0.2833248, -0.6469517, -2.166136, 0, 1, 0.3098039, 1,
-0.2794565, -0.8906681, -0.6217143, 0, 1, 0.3176471, 1,
-0.2783066, -1.137753, -3.178164, 0, 1, 0.3215686, 1,
-0.277829, -1.777108, -2.667496, 0, 1, 0.3294118, 1,
-0.2774082, 1.911215, -1.42314, 0, 1, 0.3333333, 1,
-0.2741273, 0.6906786, -1.363513, 0, 1, 0.3411765, 1,
-0.2697883, -0.5509052, -4.197425, 0, 1, 0.345098, 1,
-0.2662628, -0.01670958, -3.426462, 0, 1, 0.3529412, 1,
-0.2660844, 0.8273575, -1.353976, 0, 1, 0.3568628, 1,
-0.2653376, 1.453259, -1.434067, 0, 1, 0.3647059, 1,
-0.2653216, -0.2629662, -3.212956, 0, 1, 0.3686275, 1,
-0.2586016, -1.069162, -3.292692, 0, 1, 0.3764706, 1,
-0.2539592, 0.5191129, -1.281409, 0, 1, 0.3803922, 1,
-0.252233, -0.9888089, -1.43051, 0, 1, 0.3882353, 1,
-0.2519193, 0.3303641, -1.545628, 0, 1, 0.3921569, 1,
-0.2507225, 0.229461, -1.567186, 0, 1, 0.4, 1,
-0.2325785, -1.328901, -2.948098, 0, 1, 0.4078431, 1,
-0.231908, -2.069077, -3.441546, 0, 1, 0.4117647, 1,
-0.2317877, 0.4079727, -0.001006898, 0, 1, 0.4196078, 1,
-0.2303914, -1.471707, -5.118433, 0, 1, 0.4235294, 1,
-0.2274635, -1.200401, -2.376204, 0, 1, 0.4313726, 1,
-0.2271327, 0.3500123, -1.831231, 0, 1, 0.4352941, 1,
-0.2208228, -0.04513847, -1.66256, 0, 1, 0.4431373, 1,
-0.2189706, -0.3533751, -2.471778, 0, 1, 0.4470588, 1,
-0.2109958, 1.101127, -0.3439569, 0, 1, 0.454902, 1,
-0.2082094, -0.02800232, -0.4597521, 0, 1, 0.4588235, 1,
-0.2055309, -0.5143071, -3.967194, 0, 1, 0.4666667, 1,
-0.2053212, 0.6082058, -3.116785, 0, 1, 0.4705882, 1,
-0.2052537, -0.6590066, -3.892665, 0, 1, 0.4784314, 1,
-0.2050849, -0.2743201, -2.910053, 0, 1, 0.4823529, 1,
-0.1968947, -1.003423, -0.323792, 0, 1, 0.4901961, 1,
-0.1927873, -1.474137, -2.488576, 0, 1, 0.4941176, 1,
-0.1847999, -0.8070579, -3.502321, 0, 1, 0.5019608, 1,
-0.1836823, -0.7538241, -4.432427, 0, 1, 0.509804, 1,
-0.1821639, 0.7927595, -1.327222, 0, 1, 0.5137255, 1,
-0.1790934, -0.4571015, -3.336507, 0, 1, 0.5215687, 1,
-0.1775824, -1.117238, -1.768878, 0, 1, 0.5254902, 1,
-0.1770811, 0.4836038, 0.5409815, 0, 1, 0.5333334, 1,
-0.1718671, -0.9703739, -4.444287, 0, 1, 0.5372549, 1,
-0.1684548, 1.454943, -0.3635037, 0, 1, 0.5450981, 1,
-0.164571, 0.2963465, -0.9682823, 0, 1, 0.5490196, 1,
-0.1611541, -1.278679, -1.574576, 0, 1, 0.5568628, 1,
-0.1595521, -0.04948823, -1.605187, 0, 1, 0.5607843, 1,
-0.1594442, -1.03002, -1.492825, 0, 1, 0.5686275, 1,
-0.1535522, -2.046737, -0.6107609, 0, 1, 0.572549, 1,
-0.1533576, 2.409302, 0.01399226, 0, 1, 0.5803922, 1,
-0.1524563, -0.6911653, -3.345234, 0, 1, 0.5843138, 1,
-0.1519932, 0.2106344, 0.491454, 0, 1, 0.5921569, 1,
-0.1466157, -0.9860409, -1.909609, 0, 1, 0.5960785, 1,
-0.1378385, -0.4534643, -2.25913, 0, 1, 0.6039216, 1,
-0.1358709, -1.63788, -2.981155, 0, 1, 0.6117647, 1,
-0.1349094, 0.3492195, -1.558622, 0, 1, 0.6156863, 1,
-0.1322667, -0.552094, -2.769048, 0, 1, 0.6235294, 1,
-0.1311098, 0.7386917, -0.2733258, 0, 1, 0.627451, 1,
-0.1310604, 0.5467883, -0.6414906, 0, 1, 0.6352941, 1,
-0.1309972, -1.655385, -1.6588, 0, 1, 0.6392157, 1,
-0.1293816, 0.618911, -0.5720503, 0, 1, 0.6470588, 1,
-0.1263854, 0.8263943, 0.3311824, 0, 1, 0.6509804, 1,
-0.1253239, 1.013165, 1.021016, 0, 1, 0.6588235, 1,
-0.1231981, 0.8151789, -0.745205, 0, 1, 0.6627451, 1,
-0.1191196, -0.1948262, -1.289264, 0, 1, 0.6705883, 1,
-0.1189951, -0.1720732, -3.158804, 0, 1, 0.6745098, 1,
-0.1188799, -0.196407, -2.860209, 0, 1, 0.682353, 1,
-0.1182057, 2.288356, -3.852643, 0, 1, 0.6862745, 1,
-0.1177633, 1.316379, 0.2746526, 0, 1, 0.6941177, 1,
-0.1149332, 0.8491527, -1.037645, 0, 1, 0.7019608, 1,
-0.1130514, 0.5319975, -2.161317, 0, 1, 0.7058824, 1,
-0.1078673, -0.1300582, -0.5096501, 0, 1, 0.7137255, 1,
-0.107681, -0.371453, -2.843611, 0, 1, 0.7176471, 1,
-0.1061988, -0.8063486, -4.469097, 0, 1, 0.7254902, 1,
-0.1014668, -1.943271, -3.348938, 0, 1, 0.7294118, 1,
-0.09734222, -0.8047534, -3.072893, 0, 1, 0.7372549, 1,
-0.09717271, -1.208374, -0.462246, 0, 1, 0.7411765, 1,
-0.09621578, 1.194805, -1.213017, 0, 1, 0.7490196, 1,
-0.09608805, 0.05213461, -1.258519, 0, 1, 0.7529412, 1,
-0.09474909, 1.36709, -0.8035233, 0, 1, 0.7607843, 1,
-0.09418955, -0.7096484, -2.870104, 0, 1, 0.7647059, 1,
-0.08720863, 2.408684, 0.3093387, 0, 1, 0.772549, 1,
-0.0857337, 1.184582, -0.8883513, 0, 1, 0.7764706, 1,
-0.08554038, 2.136835, 0.2093252, 0, 1, 0.7843137, 1,
-0.08537365, 1.003398, 1.45322, 0, 1, 0.7882353, 1,
-0.08389447, 0.2137459, -0.79378, 0, 1, 0.7960784, 1,
-0.08177675, -0.7893444, -1.858988, 0, 1, 0.8039216, 1,
-0.0774192, -1.32995, -3.217701, 0, 1, 0.8078431, 1,
-0.07697278, 0.2667951, -1.008936, 0, 1, 0.8156863, 1,
-0.07622691, 0.897196, 0.2178418, 0, 1, 0.8196079, 1,
-0.07564072, -0.6964473, -4.611726, 0, 1, 0.827451, 1,
-0.07194794, 0.3540896, -1.885376, 0, 1, 0.8313726, 1,
-0.06920745, 2.665059, -0.2202443, 0, 1, 0.8392157, 1,
-0.06813286, 1.767057, -1.292702, 0, 1, 0.8431373, 1,
-0.06566207, -1.892805, -3.4261, 0, 1, 0.8509804, 1,
-0.06552523, 1.344218, -0.9390934, 0, 1, 0.854902, 1,
-0.06236606, 2.707166, -0.01997543, 0, 1, 0.8627451, 1,
-0.06227281, 0.4195382, 2.14079, 0, 1, 0.8666667, 1,
-0.06126364, -0.4823826, -3.781363, 0, 1, 0.8745098, 1,
-0.06099099, 0.2361546, 0.06678475, 0, 1, 0.8784314, 1,
-0.05884933, 0.2110174, -0.7968257, 0, 1, 0.8862745, 1,
-0.05170993, 0.4836223, -0.5014649, 0, 1, 0.8901961, 1,
-0.05157154, 0.5357497, -0.6573606, 0, 1, 0.8980392, 1,
-0.0473618, 0.74868, 2.406248, 0, 1, 0.9058824, 1,
-0.04609815, 2.169504, -0.5592418, 0, 1, 0.9098039, 1,
-0.04550498, -1.145195, -2.892257, 0, 1, 0.9176471, 1,
-0.04362715, -0.05756265, -1.818026, 0, 1, 0.9215686, 1,
-0.0413772, 0.8773611, 2.519678, 0, 1, 0.9294118, 1,
-0.02945189, 0.1828352, -1.13319, 0, 1, 0.9333333, 1,
-0.02911262, -0.04963227, -1.635892, 0, 1, 0.9411765, 1,
-0.02648132, 1.023596, 0.4645915, 0, 1, 0.945098, 1,
-0.0220679, 0.875922, 1.323824, 0, 1, 0.9529412, 1,
-0.01769982, -0.5584599, -3.593461, 0, 1, 0.9568627, 1,
-0.01664767, 0.1481383, -0.3008306, 0, 1, 0.9647059, 1,
-0.0161192, -0.7768435, -2.731738, 0, 1, 0.9686275, 1,
-0.01429657, -1.855496, -2.953089, 0, 1, 0.9764706, 1,
-0.01350281, -0.01458489, -1.914506, 0, 1, 0.9803922, 1,
-0.008274813, -0.1277894, -3.368156, 0, 1, 0.9882353, 1,
-0.00617069, -2.153097, -2.108698, 0, 1, 0.9921569, 1,
-0.006156549, 0.9695225, 0.2335584, 0, 1, 1, 1,
-0.004976344, 0.1825722, 0.1770995, 0, 0.9921569, 1, 1,
-0.002160992, -0.5597987, -2.469524, 0, 0.9882353, 1, 1,
0.0009107409, 0.4522517, -1.368042, 0, 0.9803922, 1, 1,
0.003681585, -0.8473132, 4.505994, 0, 0.9764706, 1, 1,
0.005561902, 0.5630261, 0.8683291, 0, 0.9686275, 1, 1,
0.006012043, -1.070941, 5.112118, 0, 0.9647059, 1, 1,
0.007001851, 1.094117, -1.012231, 0, 0.9568627, 1, 1,
0.007113314, -0.1605555, 1.377854, 0, 0.9529412, 1, 1,
0.008569728, -0.05555664, 1.03247, 0, 0.945098, 1, 1,
0.008597398, -0.233347, 3.540503, 0, 0.9411765, 1, 1,
0.01031525, 2.226806, 1.363665, 0, 0.9333333, 1, 1,
0.01082763, 0.2880515, -1.647994, 0, 0.9294118, 1, 1,
0.01192432, 1.88871, 0.04241754, 0, 0.9215686, 1, 1,
0.01261323, -0.2527899, 3.44067, 0, 0.9176471, 1, 1,
0.0137962, -0.9590279, 4.681636, 0, 0.9098039, 1, 1,
0.01467958, 0.2986851, 1.898449, 0, 0.9058824, 1, 1,
0.01502366, 0.6383904, -1.516492, 0, 0.8980392, 1, 1,
0.01622609, -0.426566, 2.981838, 0, 0.8901961, 1, 1,
0.02596038, 0.4415776, -1.347006, 0, 0.8862745, 1, 1,
0.02767232, -0.3548589, 2.159316, 0, 0.8784314, 1, 1,
0.02790472, -0.6390105, 3.093379, 0, 0.8745098, 1, 1,
0.02926839, -2.339129, 3.961865, 0, 0.8666667, 1, 1,
0.0299761, 0.8470768, 1.112594, 0, 0.8627451, 1, 1,
0.03172624, 0.6874582, -0.06317884, 0, 0.854902, 1, 1,
0.03229162, -1.898593, 0.868385, 0, 0.8509804, 1, 1,
0.03955026, -0.8619432, 2.453484, 0, 0.8431373, 1, 1,
0.04209602, -0.4348274, 2.57104, 0, 0.8392157, 1, 1,
0.04405138, -0.04671854, 2.772133, 0, 0.8313726, 1, 1,
0.04588953, 1.212601, 1.23638, 0, 0.827451, 1, 1,
0.05057433, 2.370962, 2.756983, 0, 0.8196079, 1, 1,
0.05532209, -0.3027722, 2.454135, 0, 0.8156863, 1, 1,
0.05725237, 2.018753, -0.562827, 0, 0.8078431, 1, 1,
0.05808498, -1.073894, 3.452307, 0, 0.8039216, 1, 1,
0.06361417, -0.8845232, 3.843188, 0, 0.7960784, 1, 1,
0.06507663, -0.2453869, 2.240022, 0, 0.7882353, 1, 1,
0.06754227, -2.335805, 2.895084, 0, 0.7843137, 1, 1,
0.07154647, -1.064166, 3.768218, 0, 0.7764706, 1, 1,
0.07308067, 1.772378, -0.01224424, 0, 0.772549, 1, 1,
0.07364434, -0.7029069, 2.243119, 0, 0.7647059, 1, 1,
0.07478038, 1.81013, -1.457092, 0, 0.7607843, 1, 1,
0.07554075, 0.3809682, 1.510518, 0, 0.7529412, 1, 1,
0.07784904, -1.182778, 2.386234, 0, 0.7490196, 1, 1,
0.07951959, -0.3405246, 4.990246, 0, 0.7411765, 1, 1,
0.08237241, -0.4284114, 2.537995, 0, 0.7372549, 1, 1,
0.08434065, 2.088298, -0.5399761, 0, 0.7294118, 1, 1,
0.0848079, 0.809257, 0.9254707, 0, 0.7254902, 1, 1,
0.08514673, -0.383034, 2.967316, 0, 0.7176471, 1, 1,
0.09014773, 0.7903532, -0.8438864, 0, 0.7137255, 1, 1,
0.09693696, -3.461529, 2.847587, 0, 0.7058824, 1, 1,
0.097464, 2.211427, -0.6684723, 0, 0.6980392, 1, 1,
0.1026625, 0.5433257, 1.015902, 0, 0.6941177, 1, 1,
0.1070872, 0.5608301, 0.4497744, 0, 0.6862745, 1, 1,
0.1074599, -0.04075987, 2.017583, 0, 0.682353, 1, 1,
0.1078244, 1.751741, -1.101514, 0, 0.6745098, 1, 1,
0.1100863, 1.868753, 1.003506, 0, 0.6705883, 1, 1,
0.1119661, 0.4261626, -1.252046, 0, 0.6627451, 1, 1,
0.1132532, -1.027367, 2.602015, 0, 0.6588235, 1, 1,
0.1137931, -0.6770959, 2.757277, 0, 0.6509804, 1, 1,
0.1167773, -2.481966, 4.966579, 0, 0.6470588, 1, 1,
0.1259596, -0.3659689, 1.664014, 0, 0.6392157, 1, 1,
0.1283035, -1.224554, 0.9424862, 0, 0.6352941, 1, 1,
0.13246, 0.1851448, -0.5682471, 0, 0.627451, 1, 1,
0.1335744, -0.05966016, 1.717397, 0, 0.6235294, 1, 1,
0.1389212, 0.2053681, 2.209, 0, 0.6156863, 1, 1,
0.1427707, 0.4983818, 0.6202264, 0, 0.6117647, 1, 1,
0.1495117, -1.555789, 3.926927, 0, 0.6039216, 1, 1,
0.1539524, 2.134982, -0.3121679, 0, 0.5960785, 1, 1,
0.1597361, 0.2596154, 1.498055, 0, 0.5921569, 1, 1,
0.1627167, -1.44558, 1.983641, 0, 0.5843138, 1, 1,
0.1674929, 1.010782, 1.044915, 0, 0.5803922, 1, 1,
0.1707351, -0.09736387, 1.943982, 0, 0.572549, 1, 1,
0.1708114, 0.6704801, 1.271305, 0, 0.5686275, 1, 1,
0.1719718, 1.389635, 1.487508, 0, 0.5607843, 1, 1,
0.1757125, 2.044643, -0.6636913, 0, 0.5568628, 1, 1,
0.178278, 0.8104279, 1.162688, 0, 0.5490196, 1, 1,
0.1791737, -0.5611538, 1.845326, 0, 0.5450981, 1, 1,
0.1793246, -0.4971286, 3.730502, 0, 0.5372549, 1, 1,
0.1799313, 0.4684457, -2.618364, 0, 0.5333334, 1, 1,
0.1818729, -0.2401549, 1.346687, 0, 0.5254902, 1, 1,
0.1826823, 1.358657, 0.4450701, 0, 0.5215687, 1, 1,
0.1830185, -1.209993, 2.810018, 0, 0.5137255, 1, 1,
0.1834106, -0.01639855, 2.890755, 0, 0.509804, 1, 1,
0.185021, 0.1083397, 2.152519, 0, 0.5019608, 1, 1,
0.1851332, -0.6482584, 2.350537, 0, 0.4941176, 1, 1,
0.1873634, -1.070283, 1.994215, 0, 0.4901961, 1, 1,
0.1991424, 1.585261, 0.1906026, 0, 0.4823529, 1, 1,
0.1991565, 1.080731, 0.7928329, 0, 0.4784314, 1, 1,
0.2000914, -0.669854, 3.235891, 0, 0.4705882, 1, 1,
0.20732, 0.9847902, 0.9702407, 0, 0.4666667, 1, 1,
0.2087492, -1.020159, 3.222705, 0, 0.4588235, 1, 1,
0.2091443, -0.009231674, 1.828911, 0, 0.454902, 1, 1,
0.2111671, -1.835723, 2.038349, 0, 0.4470588, 1, 1,
0.2118236, 1.417422, 0.9461491, 0, 0.4431373, 1, 1,
0.2128294, 0.761079, -0.5212068, 0, 0.4352941, 1, 1,
0.2182613, -0.157033, 2.475404, 0, 0.4313726, 1, 1,
0.2185492, 0.7225146, 1.087806, 0, 0.4235294, 1, 1,
0.2201143, -0.4296884, 1.652416, 0, 0.4196078, 1, 1,
0.2279647, 0.887273, 0.5690298, 0, 0.4117647, 1, 1,
0.2332954, -1.015042, 2.417397, 0, 0.4078431, 1, 1,
0.2333773, -0.02926231, 2.709992, 0, 0.4, 1, 1,
0.2334677, 0.5521846, -1.138108, 0, 0.3921569, 1, 1,
0.2342177, 0.5173946, -1.198016, 0, 0.3882353, 1, 1,
0.236504, 0.789134, -0.9339795, 0, 0.3803922, 1, 1,
0.2381981, -0.6611391, 4.417325, 0, 0.3764706, 1, 1,
0.2465762, 0.02106121, 3.554201, 0, 0.3686275, 1, 1,
0.2488253, 0.2411641, 0.489835, 0, 0.3647059, 1, 1,
0.2572925, 0.9432747, 2.812527, 0, 0.3568628, 1, 1,
0.2609932, 0.05090448, 0.06400049, 0, 0.3529412, 1, 1,
0.2615665, 1.207408, -1.619435, 0, 0.345098, 1, 1,
0.2653358, 0.4974762, 1.314687, 0, 0.3411765, 1, 1,
0.2665647, -0.01878925, 1.720743, 0, 0.3333333, 1, 1,
0.2666173, -1.279973, 3.627754, 0, 0.3294118, 1, 1,
0.268645, -0.8185226, 3.136504, 0, 0.3215686, 1, 1,
0.2742807, 0.5248247, 0.6257463, 0, 0.3176471, 1, 1,
0.2764031, 0.3585507, 1.073824, 0, 0.3098039, 1, 1,
0.2770168, -0.8379796, 3.581573, 0, 0.3058824, 1, 1,
0.2803173, 0.1742189, 0.3201609, 0, 0.2980392, 1, 1,
0.287655, 0.1430328, 2.192082, 0, 0.2901961, 1, 1,
0.2913876, 0.8792124, 0.5461269, 0, 0.2862745, 1, 1,
0.2914291, -0.5089598, 1.850769, 0, 0.2784314, 1, 1,
0.292113, 1.701339, -0.7173973, 0, 0.2745098, 1, 1,
0.2938755, -0.2134054, 2.365126, 0, 0.2666667, 1, 1,
0.2955572, -0.3282261, 1.869945, 0, 0.2627451, 1, 1,
0.2957644, 0.05126227, 1.128413, 0, 0.254902, 1, 1,
0.2985673, 0.9218311, -0.6724422, 0, 0.2509804, 1, 1,
0.3045802, -0.326109, 4.198002, 0, 0.2431373, 1, 1,
0.3046439, 0.8363186, -0.4526329, 0, 0.2392157, 1, 1,
0.3080617, 1.011374, 1.116735, 0, 0.2313726, 1, 1,
0.3111822, 0.5081776, 0.9419861, 0, 0.227451, 1, 1,
0.311802, -0.1004571, 2.158083, 0, 0.2196078, 1, 1,
0.3199901, 0.3881534, -0.4425414, 0, 0.2156863, 1, 1,
0.3209601, -0.7446368, 2.67656, 0, 0.2078431, 1, 1,
0.3246421, -0.5597324, 2.924024, 0, 0.2039216, 1, 1,
0.3260389, -0.007889752, 0.4171911, 0, 0.1960784, 1, 1,
0.3300094, -0.3335445, 3.360964, 0, 0.1882353, 1, 1,
0.3302821, -0.579963, 3.6167, 0, 0.1843137, 1, 1,
0.3303711, -0.4142413, 4.52352, 0, 0.1764706, 1, 1,
0.3308155, 1.73869, -0.4877556, 0, 0.172549, 1, 1,
0.3340071, 0.5437428, 2.413522, 0, 0.1647059, 1, 1,
0.3408571, 1.128658, 0.4502969, 0, 0.1607843, 1, 1,
0.3423043, -0.4242328, 3.553849, 0, 0.1529412, 1, 1,
0.3427478, -1.017139, 2.163525, 0, 0.1490196, 1, 1,
0.346924, 0.1599974, 0.2389543, 0, 0.1411765, 1, 1,
0.3472742, -1.370919, 2.367214, 0, 0.1372549, 1, 1,
0.3481142, 0.486563, 0.5214265, 0, 0.1294118, 1, 1,
0.3489488, -0.4941668, 2.250558, 0, 0.1254902, 1, 1,
0.3491383, -0.8763701, 3.376452, 0, 0.1176471, 1, 1,
0.352571, -1.402597, 1.546509, 0, 0.1137255, 1, 1,
0.3559701, 0.3940321, 0.4081315, 0, 0.1058824, 1, 1,
0.3601867, -0.2891542, 4.159099, 0, 0.09803922, 1, 1,
0.3634206, -0.7778647, 3.810904, 0, 0.09411765, 1, 1,
0.365496, 0.4419431, 1.590189, 0, 0.08627451, 1, 1,
0.3661641, -1.480014, 2.068962, 0, 0.08235294, 1, 1,
0.3664164, 1.293167, 0.2556075, 0, 0.07450981, 1, 1,
0.3670581, 1.203031, -0.03689418, 0, 0.07058824, 1, 1,
0.3683359, -1.236728, 3.355402, 0, 0.0627451, 1, 1,
0.3709035, 1.303383, -2.78615, 0, 0.05882353, 1, 1,
0.3731132, 1.479826, 0.3834203, 0, 0.05098039, 1, 1,
0.375069, -0.6078941, 2.321392, 0, 0.04705882, 1, 1,
0.3786548, -0.9954019, 4.836843, 0, 0.03921569, 1, 1,
0.383659, 1.270582, -1.733393, 0, 0.03529412, 1, 1,
0.3842469, 0.09694498, 1.186439, 0, 0.02745098, 1, 1,
0.3916321, 3.132674, 1.265796, 0, 0.02352941, 1, 1,
0.3976919, -0.2378955, 0.9822283, 0, 0.01568628, 1, 1,
0.3998447, 0.5227926, -0.2820095, 0, 0.01176471, 1, 1,
0.401217, 0.2927841, 2.158881, 0, 0.003921569, 1, 1,
0.4052708, 0.7214967, 1.763289, 0.003921569, 0, 1, 1,
0.4059596, 0.6021013, -0.9000896, 0.007843138, 0, 1, 1,
0.4070981, -1.004637, 1.910067, 0.01568628, 0, 1, 1,
0.4073794, -0.9214246, 1.355075, 0.01960784, 0, 1, 1,
0.4075758, 0.8808628, 0.2310888, 0.02745098, 0, 1, 1,
0.4080805, -0.2012862, 1.443852, 0.03137255, 0, 1, 1,
0.4117191, 0.1902653, 1.576746, 0.03921569, 0, 1, 1,
0.4121367, -1.187047, 2.67046, 0.04313726, 0, 1, 1,
0.4143546, 1.604955, 0.5997399, 0.05098039, 0, 1, 1,
0.4148597, 0.9345058, 1.03634, 0.05490196, 0, 1, 1,
0.4189207, -0.612928, 2.715616, 0.0627451, 0, 1, 1,
0.4202198, 0.06374182, 1.330576, 0.06666667, 0, 1, 1,
0.4214104, -0.2553023, 2.642882, 0.07450981, 0, 1, 1,
0.4219848, 0.4158945, 0.94123, 0.07843138, 0, 1, 1,
0.423371, -1.041634, 4.370792, 0.08627451, 0, 1, 1,
0.4235359, 1.226097, 2.379533, 0.09019608, 0, 1, 1,
0.4263475, -0.1689561, 1.855914, 0.09803922, 0, 1, 1,
0.4274506, -0.226471, 3.278647, 0.1058824, 0, 1, 1,
0.4369179, -0.07663883, 1.796809, 0.1098039, 0, 1, 1,
0.4382476, 0.9413323, -0.1475644, 0.1176471, 0, 1, 1,
0.44402, 0.8659294, -0.8352276, 0.1215686, 0, 1, 1,
0.452598, 0.7477065, -0.419303, 0.1294118, 0, 1, 1,
0.4545537, -1.087178, 1.891825, 0.1333333, 0, 1, 1,
0.456235, 1.533678, -0.1859885, 0.1411765, 0, 1, 1,
0.4584451, -1.750354, 3.487777, 0.145098, 0, 1, 1,
0.4590399, 0.2170703, 1.537529, 0.1529412, 0, 1, 1,
0.4593591, -0.4372877, 3.837419, 0.1568628, 0, 1, 1,
0.4640016, -2.2749, 3.181208, 0.1647059, 0, 1, 1,
0.4689885, 0.9760264, -0.1498873, 0.1686275, 0, 1, 1,
0.4706395, -0.7766467, 4.071286, 0.1764706, 0, 1, 1,
0.4711714, -1.338618, 3.502367, 0.1803922, 0, 1, 1,
0.4729203, 0.7220021, 0.1696282, 0.1882353, 0, 1, 1,
0.4739636, -1.435659, 3.599994, 0.1921569, 0, 1, 1,
0.4757676, -0.5912855, 4.342443, 0.2, 0, 1, 1,
0.4766181, 1.274317, 0.5414761, 0.2078431, 0, 1, 1,
0.4771306, -1.042474, 3.922549, 0.2117647, 0, 1, 1,
0.4771916, 0.07508705, 1.226596, 0.2196078, 0, 1, 1,
0.4774821, 0.09501436, 1.414513, 0.2235294, 0, 1, 1,
0.4804279, -1.194095, 2.548451, 0.2313726, 0, 1, 1,
0.4815853, 2.460514, 0.04665811, 0.2352941, 0, 1, 1,
0.4835912, 0.2574689, 0.624629, 0.2431373, 0, 1, 1,
0.484863, -0.03793042, 0.9167603, 0.2470588, 0, 1, 1,
0.4915807, -0.2715481, 2.353611, 0.254902, 0, 1, 1,
0.4921594, -0.3436653, 1.836351, 0.2588235, 0, 1, 1,
0.4926687, -0.6385018, 1.22579, 0.2666667, 0, 1, 1,
0.4954312, -0.8482582, 1.513578, 0.2705882, 0, 1, 1,
0.4966557, 0.3272303, -0.3913344, 0.2784314, 0, 1, 1,
0.4975557, -0.9799602, 2.747522, 0.282353, 0, 1, 1,
0.4975558, 0.8939818, 1.284364, 0.2901961, 0, 1, 1,
0.4982893, -1.172752, 3.105139, 0.2941177, 0, 1, 1,
0.4999408, -1.098661, 3.018637, 0.3019608, 0, 1, 1,
0.5004677, 0.5719499, 0.7736446, 0.3098039, 0, 1, 1,
0.5065932, 1.019584, -0.6852584, 0.3137255, 0, 1, 1,
0.506946, 0.09660488, 1.799024, 0.3215686, 0, 1, 1,
0.5176341, -0.7240967, 2.046855, 0.3254902, 0, 1, 1,
0.5177563, 1.718011, 0.7225686, 0.3333333, 0, 1, 1,
0.5229737, 1.080677, -0.104389, 0.3372549, 0, 1, 1,
0.5230339, 0.4858328, 1.138989, 0.345098, 0, 1, 1,
0.5239121, -1.108127, 2.668722, 0.3490196, 0, 1, 1,
0.5273343, 0.2170516, 0.5308611, 0.3568628, 0, 1, 1,
0.52798, -2.014167, 4.74289, 0.3607843, 0, 1, 1,
0.5286978, -1.186312, 3.033715, 0.3686275, 0, 1, 1,
0.5287724, 1.752724, -0.6416094, 0.372549, 0, 1, 1,
0.5302866, 0.3881249, -1.386522, 0.3803922, 0, 1, 1,
0.5407702, 0.9275391, 1.358101, 0.3843137, 0, 1, 1,
0.5444699, 0.6231822, 2.539691, 0.3921569, 0, 1, 1,
0.546535, -0.8937446, 1.675221, 0.3960784, 0, 1, 1,
0.5465388, -0.3647875, 3.878811, 0.4039216, 0, 1, 1,
0.5467655, -0.5778059, 3.969235, 0.4117647, 0, 1, 1,
0.5472423, -2.541527, 3.405548, 0.4156863, 0, 1, 1,
0.5505639, 0.4859806, 0.0556098, 0.4235294, 0, 1, 1,
0.5506233, -1.035946, 2.267111, 0.427451, 0, 1, 1,
0.5558616, 0.9049634, 1.729404, 0.4352941, 0, 1, 1,
0.559806, -0.1670682, 1.668495, 0.4392157, 0, 1, 1,
0.5655811, -1.049995, 3.435552, 0.4470588, 0, 1, 1,
0.5744123, -1.659869, 2.543849, 0.4509804, 0, 1, 1,
0.58728, -0.7657449, -0.4677328, 0.4588235, 0, 1, 1,
0.5888001, 0.5910019, 2.255611, 0.4627451, 0, 1, 1,
0.5898681, -0.8247131, 2.270663, 0.4705882, 0, 1, 1,
0.5936954, 2.11749, -0.169081, 0.4745098, 0, 1, 1,
0.5967519, -0.8589992, 3.031079, 0.4823529, 0, 1, 1,
0.6003392, -0.4363171, 4.206519, 0.4862745, 0, 1, 1,
0.6022977, 0.5834754, 0.1544676, 0.4941176, 0, 1, 1,
0.6056963, -0.39451, 1.783615, 0.5019608, 0, 1, 1,
0.6067045, 1.014665, 1.577248, 0.5058824, 0, 1, 1,
0.6109793, 0.08260088, 2.836014, 0.5137255, 0, 1, 1,
0.6153079, -1.768145, 1.527512, 0.5176471, 0, 1, 1,
0.6177462, -0.6171202, 0.7652088, 0.5254902, 0, 1, 1,
0.6197491, -0.303231, 1.130008, 0.5294118, 0, 1, 1,
0.6210933, 1.010743, 0.3404944, 0.5372549, 0, 1, 1,
0.6216608, 0.6995764, -0.4101257, 0.5411765, 0, 1, 1,
0.6241194, 1.055111, -0.2588148, 0.5490196, 0, 1, 1,
0.6257238, -0.7452151, 1.968623, 0.5529412, 0, 1, 1,
0.6300234, -0.8852867, 3.927063, 0.5607843, 0, 1, 1,
0.6342213, -0.1092564, 2.660906, 0.5647059, 0, 1, 1,
0.6358802, 2.520304, -0.2195037, 0.572549, 0, 1, 1,
0.6384644, 1.76038, 1.611656, 0.5764706, 0, 1, 1,
0.6400019, -1.512941, 0.4046866, 0.5843138, 0, 1, 1,
0.6412525, 0.006280309, 1.848488, 0.5882353, 0, 1, 1,
0.6451061, -1.123769, 3.307366, 0.5960785, 0, 1, 1,
0.6543958, 0.242439, 0.646879, 0.6039216, 0, 1, 1,
0.6576592, -0.3147927, 1.6818, 0.6078432, 0, 1, 1,
0.6579698, 0.2356289, 2.45455, 0.6156863, 0, 1, 1,
0.6582138, 0.3098509, 2.066947, 0.6196079, 0, 1, 1,
0.6671383, 1.056267, -0.4016298, 0.627451, 0, 1, 1,
0.6717316, 0.7819799, 1.303765, 0.6313726, 0, 1, 1,
0.6776389, -0.9992051, 2.812246, 0.6392157, 0, 1, 1,
0.6792764, -1.183869, 2.647852, 0.6431373, 0, 1, 1,
0.6807557, -0.02595912, 1.958674, 0.6509804, 0, 1, 1,
0.6845526, 0.404615, -0.06691561, 0.654902, 0, 1, 1,
0.690909, -0.9477292, 1.032845, 0.6627451, 0, 1, 1,
0.691088, -1.051264, 1.586376, 0.6666667, 0, 1, 1,
0.6955058, 1.515563, -0.7299199, 0.6745098, 0, 1, 1,
0.6957181, 1.765511, 0.01968429, 0.6784314, 0, 1, 1,
0.6986149, 0.9746736, -1.033827, 0.6862745, 0, 1, 1,
0.704334, -1.213947, 2.961532, 0.6901961, 0, 1, 1,
0.7045066, -0.05941654, 3.004112, 0.6980392, 0, 1, 1,
0.7062407, 0.1194839, 2.084767, 0.7058824, 0, 1, 1,
0.706523, -1.432183, 2.133882, 0.7098039, 0, 1, 1,
0.7146969, -0.5921257, 1.002399, 0.7176471, 0, 1, 1,
0.7172579, 0.3718618, 0.6678219, 0.7215686, 0, 1, 1,
0.7198225, -0.3736012, 2.646465, 0.7294118, 0, 1, 1,
0.723249, 0.4611799, 0.2809558, 0.7333333, 0, 1, 1,
0.7262748, -0.7553003, 3.616047, 0.7411765, 0, 1, 1,
0.7270716, 0.6259902, -0.4061547, 0.7450981, 0, 1, 1,
0.727248, 0.4978517, 0.8680295, 0.7529412, 0, 1, 1,
0.7303876, -0.1717053, 2.58425, 0.7568628, 0, 1, 1,
0.7320863, -0.6309323, 2.790288, 0.7647059, 0, 1, 1,
0.7386771, 0.5746691, -0.3476973, 0.7686275, 0, 1, 1,
0.7492316, -0.6054979, 1.88029, 0.7764706, 0, 1, 1,
0.7592934, -1.085241, 4.165623, 0.7803922, 0, 1, 1,
0.767372, -3.04499, 3.693555, 0.7882353, 0, 1, 1,
0.769365, 0.1964346, 0.04606006, 0.7921569, 0, 1, 1,
0.7726645, -1.084418, 1.383957, 0.8, 0, 1, 1,
0.7741562, 0.2716874, -1.244649, 0.8078431, 0, 1, 1,
0.7745497, -0.1521461, 2.701933, 0.8117647, 0, 1, 1,
0.7776423, 0.02228715, 1.233666, 0.8196079, 0, 1, 1,
0.7779596, -1.400558, 2.156252, 0.8235294, 0, 1, 1,
0.7802445, -2.3574, 3.332444, 0.8313726, 0, 1, 1,
0.7815515, 0.4174467, 2.239798, 0.8352941, 0, 1, 1,
0.7840393, -0.2367807, 1.641484, 0.8431373, 0, 1, 1,
0.7857241, 0.7393476, 1.098286, 0.8470588, 0, 1, 1,
0.7872189, -0.2260885, 1.726193, 0.854902, 0, 1, 1,
0.7940459, 0.3080708, 0.7689723, 0.8588235, 0, 1, 1,
0.7960103, 0.7274345, 1.387753, 0.8666667, 0, 1, 1,
0.7971577, -1.107913, 2.648288, 0.8705882, 0, 1, 1,
0.7982807, -0.7581881, 2.228749, 0.8784314, 0, 1, 1,
0.8046148, 0.5172268, 1.323696, 0.8823529, 0, 1, 1,
0.8102071, -0.3040147, 2.481667, 0.8901961, 0, 1, 1,
0.8282623, 0.2272467, 2.43566, 0.8941177, 0, 1, 1,
0.8298998, -0.9674683, 1.74238, 0.9019608, 0, 1, 1,
0.8303922, -1.427685, 2.148627, 0.9098039, 0, 1, 1,
0.8476551, -0.3106534, 3.194267, 0.9137255, 0, 1, 1,
0.8524736, -0.3211271, 3.047208, 0.9215686, 0, 1, 1,
0.8569987, 2.251712, -0.6027256, 0.9254902, 0, 1, 1,
0.8585891, -1.898213, 1.842301, 0.9333333, 0, 1, 1,
0.8605208, -0.9991547, 1.669046, 0.9372549, 0, 1, 1,
0.8617949, -0.4283897, 2.375652, 0.945098, 0, 1, 1,
0.8646514, 0.3717285, 1.226473, 0.9490196, 0, 1, 1,
0.8666288, -0.384824, 3.88694, 0.9568627, 0, 1, 1,
0.8704907, -0.4420984, 3.313653, 0.9607843, 0, 1, 1,
0.8796345, 0.7620985, 1.952996, 0.9686275, 0, 1, 1,
0.8812934, 0.1013559, 0.7111876, 0.972549, 0, 1, 1,
0.8856765, 1.96845, -0.5572914, 0.9803922, 0, 1, 1,
0.8863164, 1.155495, 0.11231, 0.9843137, 0, 1, 1,
0.8867518, 0.2676992, 2.702263, 0.9921569, 0, 1, 1,
0.8921421, 0.8681233, -0.7674065, 0.9960784, 0, 1, 1,
0.8931404, -1.336921, 2.700398, 1, 0, 0.9960784, 1,
0.9003067, -0.5139248, 1.949628, 1, 0, 0.9882353, 1,
0.9035442, -0.3847701, 2.445073, 1, 0, 0.9843137, 1,
0.9056155, 0.4021818, 1.527016, 1, 0, 0.9764706, 1,
0.9162222, -0.9194219, 4.046324, 1, 0, 0.972549, 1,
0.9172089, -0.2731353, 3.015273, 1, 0, 0.9647059, 1,
0.9178917, 2.28541, 2.865699, 1, 0, 0.9607843, 1,
0.9188475, 1.962474, 1.726056, 1, 0, 0.9529412, 1,
0.9234887, 0.4993991, 1.75567, 1, 0, 0.9490196, 1,
0.9239107, 1.044032, 0.2811638, 1, 0, 0.9411765, 1,
0.9404359, 0.1432508, 2.339881, 1, 0, 0.9372549, 1,
0.9438638, 0.2477039, 0.1944517, 1, 0, 0.9294118, 1,
0.9497086, -0.01730701, 2.947215, 1, 0, 0.9254902, 1,
0.9506531, -0.3513289, 1.030609, 1, 0, 0.9176471, 1,
0.9521126, 0.3804804, 1.337044, 1, 0, 0.9137255, 1,
0.9627857, 2.603392, -0.7633652, 1, 0, 0.9058824, 1,
0.963282, -0.8460936, 5.02265, 1, 0, 0.9019608, 1,
0.9633836, 1.07855, 0.2563202, 1, 0, 0.8941177, 1,
0.9698671, 0.1711863, 1.591992, 1, 0, 0.8862745, 1,
0.98149, -0.1305059, 0.3145931, 1, 0, 0.8823529, 1,
0.9861503, -0.1010254, 2.370943, 1, 0, 0.8745098, 1,
0.9891, -0.1397018, 1.54, 1, 0, 0.8705882, 1,
0.997596, 0.05065709, 1.447729, 1, 0, 0.8627451, 1,
1.002537, -0.166087, 0.2598009, 1, 0, 0.8588235, 1,
1.003624, -1.046581, 3.112298, 1, 0, 0.8509804, 1,
1.00719, 0.6952223, 1.153967, 1, 0, 0.8470588, 1,
1.008918, -0.3517078, 1.245378, 1, 0, 0.8392157, 1,
1.010777, 0.5188443, 0.5788604, 1, 0, 0.8352941, 1,
1.015324, -1.653419, 3.263693, 1, 0, 0.827451, 1,
1.017629, 1.424511, 1.541098, 1, 0, 0.8235294, 1,
1.020155, -0.5266816, 2.554331, 1, 0, 0.8156863, 1,
1.032178, 1.263198, 2.549482, 1, 0, 0.8117647, 1,
1.033505, -0.7651149, 2.380799, 1, 0, 0.8039216, 1,
1.042932, 0.5403877, 0.9732216, 1, 0, 0.7960784, 1,
1.045266, 1.701164, -0.02026439, 1, 0, 0.7921569, 1,
1.048972, -1.300071, 2.662681, 1, 0, 0.7843137, 1,
1.070653, -0.3007119, 1.91853, 1, 0, 0.7803922, 1,
1.071267, -1.447931, 1.446026, 1, 0, 0.772549, 1,
1.071591, 0.213144, 1.821079, 1, 0, 0.7686275, 1,
1.077253, 1.651275, 1.306382, 1, 0, 0.7607843, 1,
1.081264, -0.9416317, 1.644747, 1, 0, 0.7568628, 1,
1.085372, 1.086814, 2.450602, 1, 0, 0.7490196, 1,
1.090448, 1.02819, 0.1941922, 1, 0, 0.7450981, 1,
1.092994, -0.06698129, 0.9817107, 1, 0, 0.7372549, 1,
1.095553, -1.615212, 2.201973, 1, 0, 0.7333333, 1,
1.102462, 0.2026017, 0.2252399, 1, 0, 0.7254902, 1,
1.104897, -0.2575919, 0.8581654, 1, 0, 0.7215686, 1,
1.105924, -0.699756, 1.399352, 1, 0, 0.7137255, 1,
1.108213, 0.2210226, 2.764136, 1, 0, 0.7098039, 1,
1.120344, -0.01468724, 2.16958, 1, 0, 0.7019608, 1,
1.125659, -0.4135209, 2.796298, 1, 0, 0.6941177, 1,
1.14321, -1.833449, 1.885846, 1, 0, 0.6901961, 1,
1.144838, -0.8966551, 2.75075, 1, 0, 0.682353, 1,
1.149678, -0.874504, 3.197012, 1, 0, 0.6784314, 1,
1.150965, 0.4663526, 0.9970983, 1, 0, 0.6705883, 1,
1.15207, 1.466397, 1.384419, 1, 0, 0.6666667, 1,
1.154917, 1.323314, -0.6822684, 1, 0, 0.6588235, 1,
1.155344, -0.6717539, 1.484228, 1, 0, 0.654902, 1,
1.164023, 0.9778799, 0.4571055, 1, 0, 0.6470588, 1,
1.177941, 1.703739, 0.303622, 1, 0, 0.6431373, 1,
1.200228, -0.06904189, 2.179208, 1, 0, 0.6352941, 1,
1.208008, -0.635579, 2.156762, 1, 0, 0.6313726, 1,
1.208254, -1.032059, 3.219299, 1, 0, 0.6235294, 1,
1.209298, 0.9409131, 0.4743098, 1, 0, 0.6196079, 1,
1.21023, -1.191308, 1.466362, 1, 0, 0.6117647, 1,
1.215084, 0.294027, 1.050371, 1, 0, 0.6078432, 1,
1.223404, -0.6041374, 2.030008, 1, 0, 0.6, 1,
1.230468, -0.00486523, 1.09108, 1, 0, 0.5921569, 1,
1.233306, -0.090652, 0.5828714, 1, 0, 0.5882353, 1,
1.233402, -1.443223, 4.456961, 1, 0, 0.5803922, 1,
1.236331, 0.6301882, 2.143376, 1, 0, 0.5764706, 1,
1.252012, 2.178882, -0.004921532, 1, 0, 0.5686275, 1,
1.262729, -0.5329484, 1.712826, 1, 0, 0.5647059, 1,
1.292586, 0.3856729, 1.213204, 1, 0, 0.5568628, 1,
1.297647, -0.08117398, 2.032466, 1, 0, 0.5529412, 1,
1.298185, 1.540379, 1.356821, 1, 0, 0.5450981, 1,
1.298804, 1.404895, 1.015377, 1, 0, 0.5411765, 1,
1.298992, 0.04352419, 1.302344, 1, 0, 0.5333334, 1,
1.299756, -0.9970216, 3.677019, 1, 0, 0.5294118, 1,
1.318991, -1.73126, 1.534907, 1, 0, 0.5215687, 1,
1.320025, -0.7803991, 2.001636, 1, 0, 0.5176471, 1,
1.321345, -0.524105, 2.047906, 1, 0, 0.509804, 1,
1.322413, -0.6294072, 4.124836, 1, 0, 0.5058824, 1,
1.323898, 0.969049, 2.687037, 1, 0, 0.4980392, 1,
1.325899, -0.918438, 4.051983, 1, 0, 0.4901961, 1,
1.331072, 0.1819756, 0.5506513, 1, 0, 0.4862745, 1,
1.337582, -0.09846408, 0.6627356, 1, 0, 0.4784314, 1,
1.343189, 0.4887435, 1.169389, 1, 0, 0.4745098, 1,
1.352428, 0.9203851, 0.1795775, 1, 0, 0.4666667, 1,
1.358551, -0.5028812, 2.255734, 1, 0, 0.4627451, 1,
1.367695, -0.4322012, 2.777502, 1, 0, 0.454902, 1,
1.371382, 0.6342083, -0.6653906, 1, 0, 0.4509804, 1,
1.380857, 0.2488729, -0.8364742, 1, 0, 0.4431373, 1,
1.380893, -3.166596, 3.45549, 1, 0, 0.4392157, 1,
1.381389, 0.001397286, 0.4331038, 1, 0, 0.4313726, 1,
1.381933, -0.06571655, 2.366713, 1, 0, 0.427451, 1,
1.389125, 0.03981888, 3.518258, 1, 0, 0.4196078, 1,
1.389958, -0.6085346, 0.6770679, 1, 0, 0.4156863, 1,
1.401798, 0.8905364, 1.277729, 1, 0, 0.4078431, 1,
1.40988, -0.6622089, 1.748847, 1, 0, 0.4039216, 1,
1.416333, -0.4120542, 3.420348, 1, 0, 0.3960784, 1,
1.417635, 0.3738179, 2.273885, 1, 0, 0.3882353, 1,
1.424494, -0.00279304, 2.12889, 1, 0, 0.3843137, 1,
1.444809, 0.2376401, 0.1771424, 1, 0, 0.3764706, 1,
1.447913, -1.101464, 2.256221, 1, 0, 0.372549, 1,
1.455157, -0.3826111, 0.6597182, 1, 0, 0.3647059, 1,
1.471134, 0.250242, 0.337482, 1, 0, 0.3607843, 1,
1.487018, 0.2091915, 0.6039551, 1, 0, 0.3529412, 1,
1.490224, -0.9959181, 2.015716, 1, 0, 0.3490196, 1,
1.498921, 0.5625659, 1.061162, 1, 0, 0.3411765, 1,
1.49985, -0.647566, 0.8006361, 1, 0, 0.3372549, 1,
1.502563, 0.04931629, 1.794642, 1, 0, 0.3294118, 1,
1.503137, -0.05795564, 1.668973, 1, 0, 0.3254902, 1,
1.522568, -0.3465669, 2.13114, 1, 0, 0.3176471, 1,
1.535612, -0.5285681, 1.8251, 1, 0, 0.3137255, 1,
1.538002, -0.7840657, 1.265274, 1, 0, 0.3058824, 1,
1.576096, 0.1370033, -0.3108525, 1, 0, 0.2980392, 1,
1.577846, 1.40242, 0.9639357, 1, 0, 0.2941177, 1,
1.580294, -0.0362276, 1.982126, 1, 0, 0.2862745, 1,
1.583651, -1.689876, 3.002259, 1, 0, 0.282353, 1,
1.588429, 0.5940227, 1.184833, 1, 0, 0.2745098, 1,
1.615283, -1.430602, 0.3677623, 1, 0, 0.2705882, 1,
1.617138, 0.334616, 0.06390068, 1, 0, 0.2627451, 1,
1.620722, -0.9352311, 3.558748, 1, 0, 0.2588235, 1,
1.63447, 0.204552, 2.967176, 1, 0, 0.2509804, 1,
1.640762, 1.741151, 2.44202, 1, 0, 0.2470588, 1,
1.653762, 0.5779405, 3.263106, 1, 0, 0.2392157, 1,
1.665136, 2.380039, -0.172279, 1, 0, 0.2352941, 1,
1.667491, -0.8986148, 1.431591, 1, 0, 0.227451, 1,
1.677912, -0.5884058, 2.840737, 1, 0, 0.2235294, 1,
1.695443, 1.291225, -0.5703045, 1, 0, 0.2156863, 1,
1.699303, -1.000512, 0.8077968, 1, 0, 0.2117647, 1,
1.716457, 0.271158, 2.383997, 1, 0, 0.2039216, 1,
1.720311, -1.198082, 1.803176, 1, 0, 0.1960784, 1,
1.729131, -1.774591, 2.85909, 1, 0, 0.1921569, 1,
1.779695, -1.203502, 0.5384347, 1, 0, 0.1843137, 1,
1.807107, 0.1080195, 2.449786, 1, 0, 0.1803922, 1,
1.825022, 0.7356806, -0.59263, 1, 0, 0.172549, 1,
1.828809, 1.016588, 1.604363, 1, 0, 0.1686275, 1,
1.843974, 0.2104771, 1.505374, 1, 0, 0.1607843, 1,
1.848474, 0.2385833, 0.4520548, 1, 0, 0.1568628, 1,
1.852939, 0.6320522, 2.478243, 1, 0, 0.1490196, 1,
1.854961, 0.2719933, 0.122586, 1, 0, 0.145098, 1,
1.884272, 0.8193753, 1.579323, 1, 0, 0.1372549, 1,
1.885763, 0.5656139, 1.593184, 1, 0, 0.1333333, 1,
1.904843, -0.232839, 1.96262, 1, 0, 0.1254902, 1,
1.905892, -0.7493073, 3.322713, 1, 0, 0.1215686, 1,
1.935226, 0.5738183, 1.814971, 1, 0, 0.1137255, 1,
1.937543, 0.1727732, 0.4424323, 1, 0, 0.1098039, 1,
1.957676, -0.195407, 2.081352, 1, 0, 0.1019608, 1,
1.993178, -1.369383, 2.71292, 1, 0, 0.09411765, 1,
1.995141, 0.5730672, 0.08389188, 1, 0, 0.09019608, 1,
2.044725, -0.2012279, 2.0825, 1, 0, 0.08235294, 1,
2.141557, -0.7448039, 2.326849, 1, 0, 0.07843138, 1,
2.186272, 0.6247134, 0.7162894, 1, 0, 0.07058824, 1,
2.239224, -0.148313, 2.942133, 1, 0, 0.06666667, 1,
2.326497, 0.01384822, 2.357334, 1, 0, 0.05882353, 1,
2.349037, -1.746281, 3.195269, 1, 0, 0.05490196, 1,
2.381659, 1.707727, 0.680971, 1, 0, 0.04705882, 1,
2.785912, -0.2440052, 2.660994, 1, 0, 0.04313726, 1,
2.800751, 0.2931772, 0.464014, 1, 0, 0.03529412, 1,
2.816297, 0.1173652, 2.124826, 1, 0, 0.03137255, 1,
2.829571, -1.564376, 0.6796842, 1, 0, 0.02352941, 1,
2.995721, -0.858824, 0.9524026, 1, 0, 0.01960784, 1,
3.086983, -0.7863368, 0.8401766, 1, 0, 0.01176471, 1,
3.412473, -1.668467, 3.501593, 1, 0, 0.007843138, 1
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
0.1936724, -4.579246, -6.867112, 0, -0.5, 0.5, 0.5,
0.1936724, -4.579246, -6.867112, 1, -0.5, 0.5, 0.5,
0.1936724, -4.579246, -6.867112, 1, 1.5, 0.5, 0.5,
0.1936724, -4.579246, -6.867112, 0, 1.5, 0.5, 0.5
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
-4.116302, -0.1644274, -6.867112, 0, -0.5, 0.5, 0.5,
-4.116302, -0.1644274, -6.867112, 1, -0.5, 0.5, 0.5,
-4.116302, -0.1644274, -6.867112, 1, 1.5, 0.5, 0.5,
-4.116302, -0.1644274, -6.867112, 0, 1.5, 0.5, 0.5
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
-4.116302, -4.579246, -0.009399414, 0, -0.5, 0.5, 0.5,
-4.116302, -4.579246, -0.009399414, 1, -0.5, 0.5, 0.5,
-4.116302, -4.579246, -0.009399414, 1, 1.5, 0.5, 0.5,
-4.116302, -4.579246, -0.009399414, 0, 1.5, 0.5, 0.5
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
-3, -3.560441, -5.284563,
3, -3.560441, -5.284563,
-3, -3.560441, -5.284563,
-3, -3.730242, -5.548321,
-2, -3.560441, -5.284563,
-2, -3.730242, -5.548321,
-1, -3.560441, -5.284563,
-1, -3.730242, -5.548321,
0, -3.560441, -5.284563,
0, -3.730242, -5.548321,
1, -3.560441, -5.284563,
1, -3.730242, -5.548321,
2, -3.560441, -5.284563,
2, -3.730242, -5.548321,
3, -3.560441, -5.284563,
3, -3.730242, -5.548321
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
-3, -4.069844, -6.075837, 0, -0.5, 0.5, 0.5,
-3, -4.069844, -6.075837, 1, -0.5, 0.5, 0.5,
-3, -4.069844, -6.075837, 1, 1.5, 0.5, 0.5,
-3, -4.069844, -6.075837, 0, 1.5, 0.5, 0.5,
-2, -4.069844, -6.075837, 0, -0.5, 0.5, 0.5,
-2, -4.069844, -6.075837, 1, -0.5, 0.5, 0.5,
-2, -4.069844, -6.075837, 1, 1.5, 0.5, 0.5,
-2, -4.069844, -6.075837, 0, 1.5, 0.5, 0.5,
-1, -4.069844, -6.075837, 0, -0.5, 0.5, 0.5,
-1, -4.069844, -6.075837, 1, -0.5, 0.5, 0.5,
-1, -4.069844, -6.075837, 1, 1.5, 0.5, 0.5,
-1, -4.069844, -6.075837, 0, 1.5, 0.5, 0.5,
0, -4.069844, -6.075837, 0, -0.5, 0.5, 0.5,
0, -4.069844, -6.075837, 1, -0.5, 0.5, 0.5,
0, -4.069844, -6.075837, 1, 1.5, 0.5, 0.5,
0, -4.069844, -6.075837, 0, 1.5, 0.5, 0.5,
1, -4.069844, -6.075837, 0, -0.5, 0.5, 0.5,
1, -4.069844, -6.075837, 1, -0.5, 0.5, 0.5,
1, -4.069844, -6.075837, 1, 1.5, 0.5, 0.5,
1, -4.069844, -6.075837, 0, 1.5, 0.5, 0.5,
2, -4.069844, -6.075837, 0, -0.5, 0.5, 0.5,
2, -4.069844, -6.075837, 1, -0.5, 0.5, 0.5,
2, -4.069844, -6.075837, 1, 1.5, 0.5, 0.5,
2, -4.069844, -6.075837, 0, 1.5, 0.5, 0.5,
3, -4.069844, -6.075837, 0, -0.5, 0.5, 0.5,
3, -4.069844, -6.075837, 1, -0.5, 0.5, 0.5,
3, -4.069844, -6.075837, 1, 1.5, 0.5, 0.5,
3, -4.069844, -6.075837, 0, 1.5, 0.5, 0.5
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
-3.121692, -3, -5.284563,
-3.121692, 3, -5.284563,
-3.121692, -3, -5.284563,
-3.287461, -3, -5.548321,
-3.121692, -2, -5.284563,
-3.287461, -2, -5.548321,
-3.121692, -1, -5.284563,
-3.287461, -1, -5.548321,
-3.121692, 0, -5.284563,
-3.287461, 0, -5.548321,
-3.121692, 1, -5.284563,
-3.287461, 1, -5.548321,
-3.121692, 2, -5.284563,
-3.287461, 2, -5.548321,
-3.121692, 3, -5.284563,
-3.287461, 3, -5.548321
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
-3.618997, -3, -6.075837, 0, -0.5, 0.5, 0.5,
-3.618997, -3, -6.075837, 1, -0.5, 0.5, 0.5,
-3.618997, -3, -6.075837, 1, 1.5, 0.5, 0.5,
-3.618997, -3, -6.075837, 0, 1.5, 0.5, 0.5,
-3.618997, -2, -6.075837, 0, -0.5, 0.5, 0.5,
-3.618997, -2, -6.075837, 1, -0.5, 0.5, 0.5,
-3.618997, -2, -6.075837, 1, 1.5, 0.5, 0.5,
-3.618997, -2, -6.075837, 0, 1.5, 0.5, 0.5,
-3.618997, -1, -6.075837, 0, -0.5, 0.5, 0.5,
-3.618997, -1, -6.075837, 1, -0.5, 0.5, 0.5,
-3.618997, -1, -6.075837, 1, 1.5, 0.5, 0.5,
-3.618997, -1, -6.075837, 0, 1.5, 0.5, 0.5,
-3.618997, 0, -6.075837, 0, -0.5, 0.5, 0.5,
-3.618997, 0, -6.075837, 1, -0.5, 0.5, 0.5,
-3.618997, 0, -6.075837, 1, 1.5, 0.5, 0.5,
-3.618997, 0, -6.075837, 0, 1.5, 0.5, 0.5,
-3.618997, 1, -6.075837, 0, -0.5, 0.5, 0.5,
-3.618997, 1, -6.075837, 1, -0.5, 0.5, 0.5,
-3.618997, 1, -6.075837, 1, 1.5, 0.5, 0.5,
-3.618997, 1, -6.075837, 0, 1.5, 0.5, 0.5,
-3.618997, 2, -6.075837, 0, -0.5, 0.5, 0.5,
-3.618997, 2, -6.075837, 1, -0.5, 0.5, 0.5,
-3.618997, 2, -6.075837, 1, 1.5, 0.5, 0.5,
-3.618997, 2, -6.075837, 0, 1.5, 0.5, 0.5,
-3.618997, 3, -6.075837, 0, -0.5, 0.5, 0.5,
-3.618997, 3, -6.075837, 1, -0.5, 0.5, 0.5,
-3.618997, 3, -6.075837, 1, 1.5, 0.5, 0.5,
-3.618997, 3, -6.075837, 0, 1.5, 0.5, 0.5
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
-3.121692, -3.560441, -4,
-3.121692, -3.560441, 4,
-3.121692, -3.560441, -4,
-3.287461, -3.730242, -4,
-3.121692, -3.560441, -2,
-3.287461, -3.730242, -2,
-3.121692, -3.560441, 0,
-3.287461, -3.730242, 0,
-3.121692, -3.560441, 2,
-3.287461, -3.730242, 2,
-3.121692, -3.560441, 4,
-3.287461, -3.730242, 4
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
-3.618997, -4.069844, -4, 0, -0.5, 0.5, 0.5,
-3.618997, -4.069844, -4, 1, -0.5, 0.5, 0.5,
-3.618997, -4.069844, -4, 1, 1.5, 0.5, 0.5,
-3.618997, -4.069844, -4, 0, 1.5, 0.5, 0.5,
-3.618997, -4.069844, -2, 0, -0.5, 0.5, 0.5,
-3.618997, -4.069844, -2, 1, -0.5, 0.5, 0.5,
-3.618997, -4.069844, -2, 1, 1.5, 0.5, 0.5,
-3.618997, -4.069844, -2, 0, 1.5, 0.5, 0.5,
-3.618997, -4.069844, 0, 0, -0.5, 0.5, 0.5,
-3.618997, -4.069844, 0, 1, -0.5, 0.5, 0.5,
-3.618997, -4.069844, 0, 1, 1.5, 0.5, 0.5,
-3.618997, -4.069844, 0, 0, 1.5, 0.5, 0.5,
-3.618997, -4.069844, 2, 0, -0.5, 0.5, 0.5,
-3.618997, -4.069844, 2, 1, -0.5, 0.5, 0.5,
-3.618997, -4.069844, 2, 1, 1.5, 0.5, 0.5,
-3.618997, -4.069844, 2, 0, 1.5, 0.5, 0.5,
-3.618997, -4.069844, 4, 0, -0.5, 0.5, 0.5,
-3.618997, -4.069844, 4, 1, -0.5, 0.5, 0.5,
-3.618997, -4.069844, 4, 1, 1.5, 0.5, 0.5,
-3.618997, -4.069844, 4, 0, 1.5, 0.5, 0.5
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
-3.121692, -3.560441, -5.284563,
-3.121692, 3.231587, -5.284563,
-3.121692, -3.560441, 5.265764,
-3.121692, 3.231587, 5.265764,
-3.121692, -3.560441, -5.284563,
-3.121692, -3.560441, 5.265764,
-3.121692, 3.231587, -5.284563,
-3.121692, 3.231587, 5.265764,
-3.121692, -3.560441, -5.284563,
3.509037, -3.560441, -5.284563,
-3.121692, -3.560441, 5.265764,
3.509037, -3.560441, 5.265764,
-3.121692, 3.231587, -5.284563,
3.509037, 3.231587, -5.284563,
-3.121692, 3.231587, 5.265764,
3.509037, 3.231587, 5.265764,
3.509037, -3.560441, -5.284563,
3.509037, 3.231587, -5.284563,
3.509037, -3.560441, 5.265764,
3.509037, 3.231587, 5.265764,
3.509037, -3.560441, -5.284563,
3.509037, -3.560441, 5.265764,
3.509037, 3.231587, -5.284563,
3.509037, 3.231587, 5.265764
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
var radius = 7.578154;
var distance = 33.71606;
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
mvMatrix.translate( -0.1936724, 0.1644274, 0.009399414 );
mvMatrix.scale( 1.235708, 1.206362, 0.7766251 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.71606);
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
Pencycuron<-read.table("Pencycuron.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Pencycuron$V2
```

```
## Error in eval(expr, envir, enclos): object 'Pencycuron' not found
```

```r
y<-Pencycuron$V3
```

```
## Error in eval(expr, envir, enclos): object 'Pencycuron' not found
```

```r
z<-Pencycuron$V4
```

```
## Error in eval(expr, envir, enclos): object 'Pencycuron' not found
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
-3.025128, -1.030944, -2.273447, 0, 0, 1, 1, 1,
-2.807632, -0.3778655, -1.64045, 1, 0, 0, 1, 1,
-2.761774, -0.1472719, -0.2520105, 1, 0, 0, 1, 1,
-2.76044, -0.6901042, -1.769623, 1, 0, 0, 1, 1,
-2.72512, 0.676181, -0.7333678, 1, 0, 0, 1, 1,
-2.406497, -0.3918761, -1.837019, 1, 0, 0, 1, 1,
-2.402192, -0.2061768, -0.5835177, 0, 0, 0, 1, 1,
-2.388374, -0.1815093, -2.33871, 0, 0, 0, 1, 1,
-2.353931, -1.551586, -1.362894, 0, 0, 0, 1, 1,
-2.341829, 1.797089, -0.8817462, 0, 0, 0, 1, 1,
-2.321206, 0.3387204, -0.8949637, 0, 0, 0, 1, 1,
-2.289441, 1.178645, -0.1624724, 0, 0, 0, 1, 1,
-2.266976, 0.9173315, -1.408791, 0, 0, 0, 1, 1,
-2.258439, -2.452213, -2.727596, 1, 1, 1, 1, 1,
-2.237547, -1.567518, -2.071288, 1, 1, 1, 1, 1,
-2.158564, -0.1626431, -1.522884, 1, 1, 1, 1, 1,
-2.134454, -0.6693769, -0.03812191, 1, 1, 1, 1, 1,
-2.122308, -1.690006, -3.461597, 1, 1, 1, 1, 1,
-2.116125, -1.404705, -4.064041, 1, 1, 1, 1, 1,
-2.087006, 0.7569443, -2.104531, 1, 1, 1, 1, 1,
-2.082962, 1.574694, -1.443227, 1, 1, 1, 1, 1,
-2.070409, -0.007740336, -1.139185, 1, 1, 1, 1, 1,
-2.066875, 1.460602, -1.185324, 1, 1, 1, 1, 1,
-2.060544, 1.18639, -0.8729556, 1, 1, 1, 1, 1,
-2.029869, 0.4298982, 0.1358218, 1, 1, 1, 1, 1,
-2.023082, 0.44052, -1.487348, 1, 1, 1, 1, 1,
-1.979125, -0.3272999, -0.2121574, 1, 1, 1, 1, 1,
-1.976134, -0.3439077, -1.370344, 1, 1, 1, 1, 1,
-1.970798, -1.207264, -3.395633, 0, 0, 1, 1, 1,
-1.963421, -1.75694, -0.9526601, 1, 0, 0, 1, 1,
-1.948997, 0.2703958, 0.4888769, 1, 0, 0, 1, 1,
-1.926159, 0.7908868, -1.570267, 1, 0, 0, 1, 1,
-1.890287, -0.2561193, -2.322773, 1, 0, 0, 1, 1,
-1.885532, -0.662737, -1.831047, 1, 0, 0, 1, 1,
-1.864472, -0.8937454, -2.632683, 0, 0, 0, 1, 1,
-1.852923, -0.1009691, -1.84947, 0, 0, 0, 1, 1,
-1.825224, -0.1545561, 0.08092224, 0, 0, 0, 1, 1,
-1.797085, 0.4794242, 0.6687381, 0, 0, 0, 1, 1,
-1.795293, 0.3726093, -0.8967271, 0, 0, 0, 1, 1,
-1.785314, -1.13429, -2.718259, 0, 0, 0, 1, 1,
-1.764756, -0.5827371, -1.522822, 0, 0, 0, 1, 1,
-1.743693, -0.4859638, 0.351831, 1, 1, 1, 1, 1,
-1.737375, 2.147972, -0.9819665, 1, 1, 1, 1, 1,
-1.7335, 0.7325827, -2.401623, 1, 1, 1, 1, 1,
-1.715273, 1.607065, -1.452654, 1, 1, 1, 1, 1,
-1.695582, -1.007572, -3.167858, 1, 1, 1, 1, 1,
-1.676658, -0.4196299, -2.549359, 1, 1, 1, 1, 1,
-1.672179, 1.433745, -0.03163756, 1, 1, 1, 1, 1,
-1.655512, 2.511703, -0.2138949, 1, 1, 1, 1, 1,
-1.655174, 0.225256, -0.6750197, 1, 1, 1, 1, 1,
-1.647254, -0.5612739, -3.155914, 1, 1, 1, 1, 1,
-1.634483, 0.7078939, 0.5478055, 1, 1, 1, 1, 1,
-1.62486, -1.175387, -2.961259, 1, 1, 1, 1, 1,
-1.613384, 0.6654013, -0.7748839, 1, 1, 1, 1, 1,
-1.608209, -0.1689293, -1.981274, 1, 1, 1, 1, 1,
-1.59954, 1.753984, -1.731722, 1, 1, 1, 1, 1,
-1.587657, -0.1808549, -0.775665, 0, 0, 1, 1, 1,
-1.585681, -0.332207, -1.129416, 1, 0, 0, 1, 1,
-1.578479, -0.69751, -1.753253, 1, 0, 0, 1, 1,
-1.57797, -0.2335494, -1.16416, 1, 0, 0, 1, 1,
-1.571382, -1.304273, -1.914105, 1, 0, 0, 1, 1,
-1.569781, 0.4114512, 1.688662, 1, 0, 0, 1, 1,
-1.564352, 0.4490493, -2.947326, 0, 0, 0, 1, 1,
-1.556829, 1.545212, 0.03869086, 0, 0, 0, 1, 1,
-1.555856, -2.156365, -2.084998, 0, 0, 0, 1, 1,
-1.549984, 1.204922, -1.626206, 0, 0, 0, 1, 1,
-1.548448, -0.687744, -2.527415, 0, 0, 0, 1, 1,
-1.540419, 0.2077403, -1.754568, 0, 0, 0, 1, 1,
-1.535758, -0.5382154, -1.852639, 0, 0, 0, 1, 1,
-1.523235, -1.232163, -2.352368, 1, 1, 1, 1, 1,
-1.508207, -0.04952053, -2.380937, 1, 1, 1, 1, 1,
-1.507459, 0.1573209, -1.330077, 1, 1, 1, 1, 1,
-1.504901, -0.2779686, -2.005195, 1, 1, 1, 1, 1,
-1.503495, 0.1011519, -0.2513295, 1, 1, 1, 1, 1,
-1.492112, -0.9862346, -1.584646, 1, 1, 1, 1, 1,
-1.473189, 0.8602743, -0.8536217, 1, 1, 1, 1, 1,
-1.466646, 0.3193427, -2.348442, 1, 1, 1, 1, 1,
-1.459213, -1.495924, -2.795306, 1, 1, 1, 1, 1,
-1.456957, 0.1967479, -1.223285, 1, 1, 1, 1, 1,
-1.455007, -0.8131559, -0.9346815, 1, 1, 1, 1, 1,
-1.43892, 0.2931139, -3.153953, 1, 1, 1, 1, 1,
-1.432146, -0.01597192, -1.693312, 1, 1, 1, 1, 1,
-1.424412, -0.2269675, -3.406682, 1, 1, 1, 1, 1,
-1.423237, 0.6271901, -3.33778, 1, 1, 1, 1, 1,
-1.411085, 1.726447, -0.7597705, 0, 0, 1, 1, 1,
-1.395668, -0.3071739, -2.140578, 1, 0, 0, 1, 1,
-1.369354, -1.477425, -2.680824, 1, 0, 0, 1, 1,
-1.360183, 1.362023, -1.147938, 1, 0, 0, 1, 1,
-1.359964, 0.4412117, -3.293985, 1, 0, 0, 1, 1,
-1.350122, 0.7152389, -0.2400041, 1, 0, 0, 1, 1,
-1.339662, 1.270168, -1.021407, 0, 0, 0, 1, 1,
-1.332338, 1.051123, -0.9104494, 0, 0, 0, 1, 1,
-1.329967, 1.380668, -1.288703, 0, 0, 0, 1, 1,
-1.329735, 1.637454, -1.353317, 0, 0, 0, 1, 1,
-1.323064, -0.6928951, -1.553226, 0, 0, 0, 1, 1,
-1.308817, 0.1109673, -0.1797244, 0, 0, 0, 1, 1,
-1.308775, -0.4417276, -1.17469, 0, 0, 0, 1, 1,
-1.305217, -0.8586425, -1.808016, 1, 1, 1, 1, 1,
-1.304799, 0.6576613, -0.4432209, 1, 1, 1, 1, 1,
-1.268991, 0.3640682, -1.151665, 1, 1, 1, 1, 1,
-1.268181, -1.518526, -1.022705, 1, 1, 1, 1, 1,
-1.266109, 2.758712, -1.757115, 1, 1, 1, 1, 1,
-1.265708, -0.7933351, -0.8911939, 1, 1, 1, 1, 1,
-1.265107, 1.326592, -2.6301, 1, 1, 1, 1, 1,
-1.26289, -1.027189, -2.448119, 1, 1, 1, 1, 1,
-1.254509, 0.4196943, -2.659194, 1, 1, 1, 1, 1,
-1.247916, -0.1378764, -0.3755009, 1, 1, 1, 1, 1,
-1.238686, -0.0388896, -0.7887368, 1, 1, 1, 1, 1,
-1.237855, -0.06820973, -1.527636, 1, 1, 1, 1, 1,
-1.235303, -0.6653787, -2.258066, 1, 1, 1, 1, 1,
-1.233346, 1.792208, -0.2438831, 1, 1, 1, 1, 1,
-1.225316, 1.233103, -0.1792831, 1, 1, 1, 1, 1,
-1.221561, -0.9651444, -1.491335, 0, 0, 1, 1, 1,
-1.215419, -1.256418, -3.473073, 1, 0, 0, 1, 1,
-1.211561, 1.954492, 0.2280643, 1, 0, 0, 1, 1,
-1.20536, 1.257589, -1.696524, 1, 0, 0, 1, 1,
-1.201915, -0.5787572, -2.525649, 1, 0, 0, 1, 1,
-1.19601, 1.809224, -1.77686, 1, 0, 0, 1, 1,
-1.18755, 0.7644103, -0.9593483, 0, 0, 0, 1, 1,
-1.179782, 0.4414492, -1.563241, 0, 0, 0, 1, 1,
-1.178053, 0.6802971, -4.165531, 0, 0, 0, 1, 1,
-1.175778, 0.9412757, 0.06563606, 0, 0, 0, 1, 1,
-1.174629, -0.09323107, -0.7226868, 0, 0, 0, 1, 1,
-1.158952, 0.3201891, -0.4882034, 0, 0, 0, 1, 1,
-1.158325, 1.011579, 0.4958623, 0, 0, 0, 1, 1,
-1.15439, 0.4374654, -2.37741, 1, 1, 1, 1, 1,
-1.15046, 1.945502, -0.5873583, 1, 1, 1, 1, 1,
-1.15034, -1.248261, -3.037779, 1, 1, 1, 1, 1,
-1.149786, -0.6785185, -1.627835, 1, 1, 1, 1, 1,
-1.146938, 1.651976, 0.5045341, 1, 1, 1, 1, 1,
-1.143694, 0.78676, -0.1323974, 1, 1, 1, 1, 1,
-1.139871, 1.297648, 0.2275205, 1, 1, 1, 1, 1,
-1.130601, 0.3584121, -1.455337, 1, 1, 1, 1, 1,
-1.122019, 1.878933, -0.490219, 1, 1, 1, 1, 1,
-1.115687, 0.06402443, -2.456037, 1, 1, 1, 1, 1,
-1.113512, -1.866819, -2.640102, 1, 1, 1, 1, 1,
-1.109597, 0.9502847, -1.139863, 1, 1, 1, 1, 1,
-1.106434, 0.442024, -2.08362, 1, 1, 1, 1, 1,
-1.105277, 2.32648, -0.01779109, 1, 1, 1, 1, 1,
-1.103029, -0.1194113, -4.014133, 1, 1, 1, 1, 1,
-1.10099, 0.870697, 0.673972, 0, 0, 1, 1, 1,
-1.092932, 1.026721, -1.113916, 1, 0, 0, 1, 1,
-1.089888, -0.2208035, -1.202347, 1, 0, 0, 1, 1,
-1.089737, -1.580291, -5.130917, 1, 0, 0, 1, 1,
-1.086566, -0.9064979, -3.801811, 1, 0, 0, 1, 1,
-1.082315, -1.513247, -3.777466, 1, 0, 0, 1, 1,
-1.064084, 1.554169, -0.06339192, 0, 0, 0, 1, 1,
-1.061369, -1.426124, -2.644357, 0, 0, 0, 1, 1,
-1.055215, 0.4143412, -1.725932, 0, 0, 0, 1, 1,
-1.04705, -1.488092, -2.171051, 0, 0, 0, 1, 1,
-1.035255, 0.5074251, 1.325291, 0, 0, 0, 1, 1,
-1.028978, -0.1797192, -0.9064173, 0, 0, 0, 1, 1,
-1.027182, -0.1675692, -1.912666, 0, 0, 0, 1, 1,
-1.016882, 1.311957, 0.2076929, 1, 1, 1, 1, 1,
-1.015246, -0.7684311, -3.117316, 1, 1, 1, 1, 1,
-1.010222, -0.5058329, -3.40851, 1, 1, 1, 1, 1,
-1.006982, 1.682164, -2.53549, 1, 1, 1, 1, 1,
-1.006188, -0.2349092, -0.3669809, 1, 1, 1, 1, 1,
-0.9903029, -1.952417, -3.695677, 1, 1, 1, 1, 1,
-0.9889798, -0.7101493, -2.169391, 1, 1, 1, 1, 1,
-0.9767717, -0.2740617, -1.265319, 1, 1, 1, 1, 1,
-0.9653031, 0.18044, -2.09944, 1, 1, 1, 1, 1,
-0.9597593, 0.3003015, -2.196842, 1, 1, 1, 1, 1,
-0.9572918, 0.7304829, -1.673313, 1, 1, 1, 1, 1,
-0.954206, -1.14601, -2.490439, 1, 1, 1, 1, 1,
-0.9536023, 1.603908, -0.8316708, 1, 1, 1, 1, 1,
-0.9488572, -2.465126, -1.105983, 1, 1, 1, 1, 1,
-0.9387867, -0.8027421, -3.303362, 1, 1, 1, 1, 1,
-0.9250589, 0.3934283, -3.043991, 0, 0, 1, 1, 1,
-0.9186677, -2.531446, -3.467644, 1, 0, 0, 1, 1,
-0.9156028, -1.032263, -2.776488, 1, 0, 0, 1, 1,
-0.9147303, -0.5471978, -2.866349, 1, 0, 0, 1, 1,
-0.9053047, 0.4109789, -1.954266, 1, 0, 0, 1, 1,
-0.9052612, 0.3170821, -1.029567, 1, 0, 0, 1, 1,
-0.9019191, -0.7192259, -1.781672, 0, 0, 0, 1, 1,
-0.9014518, -0.2108656, -1.083395, 0, 0, 0, 1, 1,
-0.899125, -0.7379835, -1.73891, 0, 0, 0, 1, 1,
-0.8933867, 0.8899897, -1.753325, 0, 0, 0, 1, 1,
-0.8908447, -1.686622, -2.37431, 0, 0, 0, 1, 1,
-0.8885884, 0.503993, -0.1549233, 0, 0, 0, 1, 1,
-0.8878298, -1.115724, -1.736871, 0, 0, 0, 1, 1,
-0.8867254, 0.7699599, -3.3193, 1, 1, 1, 1, 1,
-0.8806588, 0.2729822, -0.4873579, 1, 1, 1, 1, 1,
-0.8789619, -1.170959, -2.408505, 1, 1, 1, 1, 1,
-0.8690482, 1.680057, -1.425671, 1, 1, 1, 1, 1,
-0.8685637, -1.607355, -1.811758, 1, 1, 1, 1, 1,
-0.8681121, -0.6318222, -1.021147, 1, 1, 1, 1, 1,
-0.8672827, -0.2604001, -1.030821, 1, 1, 1, 1, 1,
-0.8672372, 0.4864174, -2.117278, 1, 1, 1, 1, 1,
-0.8610616, 0.682511, -0.4573826, 1, 1, 1, 1, 1,
-0.8603852, 1.667338, 0.8760327, 1, 1, 1, 1, 1,
-0.8548743, -0.1844229, -1.756553, 1, 1, 1, 1, 1,
-0.8542291, -1.675352, -3.409671, 1, 1, 1, 1, 1,
-0.853339, -1.648152, -1.954447, 1, 1, 1, 1, 1,
-0.8467724, -0.2219464, -2.090559, 1, 1, 1, 1, 1,
-0.8438734, 1.2549, -1.478051, 1, 1, 1, 1, 1,
-0.8425151, -2.016795, -3.666829, 0, 0, 1, 1, 1,
-0.8424876, -0.8739691, -3.199317, 1, 0, 0, 1, 1,
-0.8411098, -2.121197, -1.611893, 1, 0, 0, 1, 1,
-0.8321954, -1.66476, -2.576211, 1, 0, 0, 1, 1,
-0.8321276, 0.9578928, -1.755183, 1, 0, 0, 1, 1,
-0.8285023, -1.281418, -2.501479, 1, 0, 0, 1, 1,
-0.8279551, 0.6677704, -1.004113, 0, 0, 0, 1, 1,
-0.8256628, -0.3796085, 0.1057044, 0, 0, 0, 1, 1,
-0.8245003, -0.7013299, -2.413862, 0, 0, 0, 1, 1,
-0.8229889, -0.4890169, -0.6040765, 0, 0, 0, 1, 1,
-0.8174932, -0.8293339, -2.238109, 0, 0, 0, 1, 1,
-0.8124014, -0.4675119, -1.805318, 0, 0, 0, 1, 1,
-0.8102399, -1.050679, -0.5753055, 0, 0, 0, 1, 1,
-0.8004891, -0.09898275, -0.7685844, 1, 1, 1, 1, 1,
-0.7970322, -0.5013302, -1.094778, 1, 1, 1, 1, 1,
-0.79623, -0.9279655, -2.695211, 1, 1, 1, 1, 1,
-0.7956094, 1.763329, -0.7183645, 1, 1, 1, 1, 1,
-0.7955706, -0.675501, -1.663427, 1, 1, 1, 1, 1,
-0.7940029, 0.5676715, -0.4629268, 1, 1, 1, 1, 1,
-0.7883217, -0.7816485, -2.943372, 1, 1, 1, 1, 1,
-0.7880946, -0.3277185, -2.143981, 1, 1, 1, 1, 1,
-0.7854163, 0.2319005, -1.006323, 1, 1, 1, 1, 1,
-0.7843026, 0.07337645, -1.948685, 1, 1, 1, 1, 1,
-0.7831458, 0.08426097, -1.152712, 1, 1, 1, 1, 1,
-0.7801855, 0.2732462, -2.183875, 1, 1, 1, 1, 1,
-0.7745265, -0.7911843, -2.739578, 1, 1, 1, 1, 1,
-0.7738131, -1.202328, -2.818854, 1, 1, 1, 1, 1,
-0.7661485, -0.4134372, -3.015768, 1, 1, 1, 1, 1,
-0.7624148, -0.7827488, -2.698486, 0, 0, 1, 1, 1,
-0.7621283, -1.271823, -2.135948, 1, 0, 0, 1, 1,
-0.7539557, -1.482371, -4.300074, 1, 0, 0, 1, 1,
-0.7492447, 0.3181414, -0.8122145, 1, 0, 0, 1, 1,
-0.7432743, -0.578741, -3.059154, 1, 0, 0, 1, 1,
-0.7415694, -1.086581, -3.41288, 1, 0, 0, 1, 1,
-0.7359226, 0.1252628, -3.255564, 0, 0, 0, 1, 1,
-0.7345524, 0.2267178, -1.449351, 0, 0, 0, 1, 1,
-0.7305289, 0.1968392, -1.288998, 0, 0, 0, 1, 1,
-0.7296174, -1.149412, -2.854054, 0, 0, 0, 1, 1,
-0.7277443, 0.2516856, -1.138318, 0, 0, 0, 1, 1,
-0.7272316, 0.8914445, -1.307379, 0, 0, 0, 1, 1,
-0.720504, -0.7863332, -1.474549, 0, 0, 0, 1, 1,
-0.7185011, 0.8443446, 0.5213652, 1, 1, 1, 1, 1,
-0.7087157, 0.5796568, -0.9564983, 1, 1, 1, 1, 1,
-0.7031157, -0.7263193, -1.143244, 1, 1, 1, 1, 1,
-0.7007408, 0.9171908, -1.132558, 1, 1, 1, 1, 1,
-0.6990184, 0.5827638, 1.053659, 1, 1, 1, 1, 1,
-0.6978276, 0.197469, -1.755175, 1, 1, 1, 1, 1,
-0.6961732, 0.2611074, -1.401855, 1, 1, 1, 1, 1,
-0.6928291, -0.07257284, -2.45574, 1, 1, 1, 1, 1,
-0.6928046, -0.6194604, -2.034711, 1, 1, 1, 1, 1,
-0.6890719, 1.137303, -2.043873, 1, 1, 1, 1, 1,
-0.686575, -0.2965594, -1.60266, 1, 1, 1, 1, 1,
-0.6854709, -0.3587932, -1.854117, 1, 1, 1, 1, 1,
-0.6842749, 0.2554185, -1.018806, 1, 1, 1, 1, 1,
-0.6706458, 0.1387772, -2.907304, 1, 1, 1, 1, 1,
-0.6690353, -1.083828, -1.626311, 1, 1, 1, 1, 1,
-0.6681223, -1.205855, -3.272648, 0, 0, 1, 1, 1,
-0.6667947, -1.11551, -2.186548, 1, 0, 0, 1, 1,
-0.6635723, 0.5727346, -1.07475, 1, 0, 0, 1, 1,
-0.6570575, -1.461866, -3.055935, 1, 0, 0, 1, 1,
-0.6542135, -1.630347, -1.722817, 1, 0, 0, 1, 1,
-0.6531415, 0.572596, -0.1469319, 1, 0, 0, 1, 1,
-0.6451885, 0.7765667, 0.02561349, 0, 0, 0, 1, 1,
-0.6446193, 0.4301855, -2.590575, 0, 0, 0, 1, 1,
-0.6445292, 0.2552641, -0.2525571, 0, 0, 0, 1, 1,
-0.6315145, 0.8617234, -1.705338, 0, 0, 0, 1, 1,
-0.6285861, 0.6484107, 0.5626664, 0, 0, 0, 1, 1,
-0.6281158, -1.238516, -3.241596, 0, 0, 0, 1, 1,
-0.6089954, -0.1235557, -1.067754, 0, 0, 0, 1, 1,
-0.6038145, -0.5304726, -2.345485, 1, 1, 1, 1, 1,
-0.6038063, 0.1205879, -1.291612, 1, 1, 1, 1, 1,
-0.599629, 1.751862, -1.269468, 1, 1, 1, 1, 1,
-0.5985186, -1.058591, -1.525702, 1, 1, 1, 1, 1,
-0.5969231, -0.7406308, -2.07238, 1, 1, 1, 1, 1,
-0.5951594, -1.375846, -1.674549, 1, 1, 1, 1, 1,
-0.5902821, 0.1853844, -2.539469, 1, 1, 1, 1, 1,
-0.589367, 3.071367, -1.031486, 1, 1, 1, 1, 1,
-0.5876173, -0.3709397, -0.8637136, 1, 1, 1, 1, 1,
-0.5873104, -1.155229, -3.611545, 1, 1, 1, 1, 1,
-0.5859711, 0.5768824, -0.1632399, 1, 1, 1, 1, 1,
-0.5845641, -2.071951, -3.363706, 1, 1, 1, 1, 1,
-0.5819793, -1.242785, -2.767267, 1, 1, 1, 1, 1,
-0.5809495, 0.6646948, -1.447945, 1, 1, 1, 1, 1,
-0.5766359, 0.3556139, -1.153403, 1, 1, 1, 1, 1,
-0.5691268, -1.378002, -2.657809, 0, 0, 1, 1, 1,
-0.5618964, 0.3619737, -0.622191, 1, 0, 0, 1, 1,
-0.5499012, -0.6351275, -3.181763, 1, 0, 0, 1, 1,
-0.549721, 0.2633791, -2.18176, 1, 0, 0, 1, 1,
-0.5438862, -0.04225105, -1.59112, 1, 0, 0, 1, 1,
-0.5435867, 0.247434, -1.927956, 1, 0, 0, 1, 1,
-0.540535, -0.5229799, -2.021934, 0, 0, 0, 1, 1,
-0.540321, 0.5634638, -1.098934, 0, 0, 0, 1, 1,
-0.5390639, -0.9273787, -4.231063, 0, 0, 0, 1, 1,
-0.5369225, 0.04683902, -2.195621, 0, 0, 0, 1, 1,
-0.5359413, -0.01833931, -1.034937, 0, 0, 0, 1, 1,
-0.5354386, 0.09702055, -1.729427, 0, 0, 0, 1, 1,
-0.5314602, -0.5328243, -2.149031, 0, 0, 0, 1, 1,
-0.5248346, -0.5945079, -3.598864, 1, 1, 1, 1, 1,
-0.5228893, -0.3711516, -1.150578, 1, 1, 1, 1, 1,
-0.5217621, 0.9454477, 0.423227, 1, 1, 1, 1, 1,
-0.5121447, 0.05579186, 0.5227909, 1, 1, 1, 1, 1,
-0.5105924, -2.637406, -3.185563, 1, 1, 1, 1, 1,
-0.5035186, 0.7236935, -0.1833609, 1, 1, 1, 1, 1,
-0.5028157, -2.32232, -3.159429, 1, 1, 1, 1, 1,
-0.5016785, 0.6372153, -0.9090133, 1, 1, 1, 1, 1,
-0.5005366, 0.4855737, 0.4391162, 1, 1, 1, 1, 1,
-0.4996492, 0.3319041, -1.563456, 1, 1, 1, 1, 1,
-0.4972227, 0.9162275, -0.3128943, 1, 1, 1, 1, 1,
-0.4959354, -0.6346251, -2.014668, 1, 1, 1, 1, 1,
-0.495567, 0.6548039, -0.6503041, 1, 1, 1, 1, 1,
-0.4931528, 1.531358, -0.4887785, 1, 1, 1, 1, 1,
-0.4919897, -0.7929589, -2.751097, 1, 1, 1, 1, 1,
-0.4876471, -0.8140728, -2.923935, 0, 0, 1, 1, 1,
-0.4860618, 0.2602998, -0.7823172, 1, 0, 0, 1, 1,
-0.4857458, -1.472532, -2.929956, 1, 0, 0, 1, 1,
-0.4834613, 0.9794618, -1.506247, 1, 0, 0, 1, 1,
-0.4822567, 0.3550571, -0.400848, 1, 0, 0, 1, 1,
-0.4713576, -0.9174161, -3.64928, 1, 0, 0, 1, 1,
-0.4696405, 0.3723226, -1.021616, 0, 0, 0, 1, 1,
-0.4690033, -0.7874021, -1.636902, 0, 0, 0, 1, 1,
-0.4686451, 1.225511, -0.1326612, 0, 0, 0, 1, 1,
-0.4678536, 0.8560573, -1.747406, 0, 0, 0, 1, 1,
-0.4661475, 1.451873, -1.578572, 0, 0, 0, 1, 1,
-0.4650332, 1.737778, -0.1367676, 0, 0, 0, 1, 1,
-0.4568339, -1.211346, -1.290533, 0, 0, 0, 1, 1,
-0.4504591, -0.6755071, -3.826868, 1, 1, 1, 1, 1,
-0.4488179, 0.7828937, -0.2268554, 1, 1, 1, 1, 1,
-0.4466068, -2.022475, -4.410622, 1, 1, 1, 1, 1,
-0.4442487, 0.4652162, -0.1039932, 1, 1, 1, 1, 1,
-0.4419715, -0.3438927, -3.083874, 1, 1, 1, 1, 1,
-0.4387925, 0.1457194, -0.8619156, 1, 1, 1, 1, 1,
-0.4331335, -0.06688631, -1.177248, 1, 1, 1, 1, 1,
-0.4305296, -0.3154854, -1.241527, 1, 1, 1, 1, 1,
-0.429466, 1.287844, 0.7211625, 1, 1, 1, 1, 1,
-0.4281344, 0.01460474, -1.471717, 1, 1, 1, 1, 1,
-0.4266899, -0.8057705, -2.677994, 1, 1, 1, 1, 1,
-0.4226646, -1.089191, -3.512091, 1, 1, 1, 1, 1,
-0.4218563, -1.186274, -4.009078, 1, 1, 1, 1, 1,
-0.4194901, 0.4701465, 0.9134459, 1, 1, 1, 1, 1,
-0.4179273, 0.2413362, -2.212771, 1, 1, 1, 1, 1,
-0.4162161, 0.5562701, -0.2137482, 0, 0, 1, 1, 1,
-0.4053612, 1.54182, -0.2037148, 1, 0, 0, 1, 1,
-0.4018948, -1.293691, -3.294098, 1, 0, 0, 1, 1,
-0.4017141, -1.344455, -5.008593, 1, 0, 0, 1, 1,
-0.3988445, 0.3630925, 0.3910726, 1, 0, 0, 1, 1,
-0.3981685, 1.184199, -0.3487163, 1, 0, 0, 1, 1,
-0.3964838, -1.64744, -1.692885, 0, 0, 0, 1, 1,
-0.3945853, -0.6890561, -5.050169, 0, 0, 0, 1, 1,
-0.3910975, 0.006466907, -1.450953, 0, 0, 0, 1, 1,
-0.3867762, 1.172755, 0.8849512, 0, 0, 0, 1, 1,
-0.3867558, 0.2078234, -1.273277, 0, 0, 0, 1, 1,
-0.3864844, 0.2352759, -1.892944, 0, 0, 0, 1, 1,
-0.3854104, 0.0447478, -2.662635, 0, 0, 0, 1, 1,
-0.3847191, -1.079502, -2.34446, 1, 1, 1, 1, 1,
-0.3843172, -0.7820864, -0.7720177, 1, 1, 1, 1, 1,
-0.3833076, 1.134413, -1.240192, 1, 1, 1, 1, 1,
-0.3797325, -0.8516327, -2.755778, 1, 1, 1, 1, 1,
-0.3768984, 0.1240783, 0.5467649, 1, 1, 1, 1, 1,
-0.3758656, 1.149347, -1.031147, 1, 1, 1, 1, 1,
-0.3716068, -0.370865, -3.03565, 1, 1, 1, 1, 1,
-0.3676761, 1.100955, -1.812768, 1, 1, 1, 1, 1,
-0.3612486, 0.8039397, -0.3189639, 1, 1, 1, 1, 1,
-0.3554446, 0.8196946, 1.083559, 1, 1, 1, 1, 1,
-0.3505246, -0.2678551, -2.615963, 1, 1, 1, 1, 1,
-0.3498988, -1.923742, -3.809982, 1, 1, 1, 1, 1,
-0.3418018, -0.2193679, -2.116385, 1, 1, 1, 1, 1,
-0.3361439, 1.590929, 0.70748, 1, 1, 1, 1, 1,
-0.3356823, -0.07987844, -2.248475, 1, 1, 1, 1, 1,
-0.3312708, 0.6459296, -1.589368, 0, 0, 1, 1, 1,
-0.3285814, -2.119202, -2.713187, 1, 0, 0, 1, 1,
-0.3247929, -2.262462, -3.123856, 1, 0, 0, 1, 1,
-0.3201439, 1.209679, 0.1480983, 1, 0, 0, 1, 1,
-0.3195252, -0.6507027, -3.041533, 1, 0, 0, 1, 1,
-0.3176611, -1.204017, -2.300328, 1, 0, 0, 1, 1,
-0.3168057, -0.1075115, -2.414554, 0, 0, 0, 1, 1,
-0.3166353, 1.04578, -0.2913483, 0, 0, 0, 1, 1,
-0.315229, -0.2031249, -4.431149, 0, 0, 0, 1, 1,
-0.3151059, -0.2697123, -1.777875, 0, 0, 0, 1, 1,
-0.3125646, -0.32046, -3.115316, 0, 0, 0, 1, 1,
-0.3011776, 1.287553, 0.6058626, 0, 0, 0, 1, 1,
-0.3011205, -0.8895429, -2.817408, 0, 0, 0, 1, 1,
-0.2981666, 1.080715, -0.004681649, 1, 1, 1, 1, 1,
-0.2959988, -1.136767, -4.178535, 1, 1, 1, 1, 1,
-0.2949103, 0.3109003, -0.06746794, 1, 1, 1, 1, 1,
-0.2924965, 1.385324, -1.859775, 1, 1, 1, 1, 1,
-0.2871833, -0.2240091, -3.271835, 1, 1, 1, 1, 1,
-0.2850887, -0.01160968, -1.197705, 1, 1, 1, 1, 1,
-0.2841525, -0.1945519, -2.157821, 1, 1, 1, 1, 1,
-0.2833564, -1.015066, -2.577308, 1, 1, 1, 1, 1,
-0.2833248, -0.6469517, -2.166136, 1, 1, 1, 1, 1,
-0.2794565, -0.8906681, -0.6217143, 1, 1, 1, 1, 1,
-0.2783066, -1.137753, -3.178164, 1, 1, 1, 1, 1,
-0.277829, -1.777108, -2.667496, 1, 1, 1, 1, 1,
-0.2774082, 1.911215, -1.42314, 1, 1, 1, 1, 1,
-0.2741273, 0.6906786, -1.363513, 1, 1, 1, 1, 1,
-0.2697883, -0.5509052, -4.197425, 1, 1, 1, 1, 1,
-0.2662628, -0.01670958, -3.426462, 0, 0, 1, 1, 1,
-0.2660844, 0.8273575, -1.353976, 1, 0, 0, 1, 1,
-0.2653376, 1.453259, -1.434067, 1, 0, 0, 1, 1,
-0.2653216, -0.2629662, -3.212956, 1, 0, 0, 1, 1,
-0.2586016, -1.069162, -3.292692, 1, 0, 0, 1, 1,
-0.2539592, 0.5191129, -1.281409, 1, 0, 0, 1, 1,
-0.252233, -0.9888089, -1.43051, 0, 0, 0, 1, 1,
-0.2519193, 0.3303641, -1.545628, 0, 0, 0, 1, 1,
-0.2507225, 0.229461, -1.567186, 0, 0, 0, 1, 1,
-0.2325785, -1.328901, -2.948098, 0, 0, 0, 1, 1,
-0.231908, -2.069077, -3.441546, 0, 0, 0, 1, 1,
-0.2317877, 0.4079727, -0.001006898, 0, 0, 0, 1, 1,
-0.2303914, -1.471707, -5.118433, 0, 0, 0, 1, 1,
-0.2274635, -1.200401, -2.376204, 1, 1, 1, 1, 1,
-0.2271327, 0.3500123, -1.831231, 1, 1, 1, 1, 1,
-0.2208228, -0.04513847, -1.66256, 1, 1, 1, 1, 1,
-0.2189706, -0.3533751, -2.471778, 1, 1, 1, 1, 1,
-0.2109958, 1.101127, -0.3439569, 1, 1, 1, 1, 1,
-0.2082094, -0.02800232, -0.4597521, 1, 1, 1, 1, 1,
-0.2055309, -0.5143071, -3.967194, 1, 1, 1, 1, 1,
-0.2053212, 0.6082058, -3.116785, 1, 1, 1, 1, 1,
-0.2052537, -0.6590066, -3.892665, 1, 1, 1, 1, 1,
-0.2050849, -0.2743201, -2.910053, 1, 1, 1, 1, 1,
-0.1968947, -1.003423, -0.323792, 1, 1, 1, 1, 1,
-0.1927873, -1.474137, -2.488576, 1, 1, 1, 1, 1,
-0.1847999, -0.8070579, -3.502321, 1, 1, 1, 1, 1,
-0.1836823, -0.7538241, -4.432427, 1, 1, 1, 1, 1,
-0.1821639, 0.7927595, -1.327222, 1, 1, 1, 1, 1,
-0.1790934, -0.4571015, -3.336507, 0, 0, 1, 1, 1,
-0.1775824, -1.117238, -1.768878, 1, 0, 0, 1, 1,
-0.1770811, 0.4836038, 0.5409815, 1, 0, 0, 1, 1,
-0.1718671, -0.9703739, -4.444287, 1, 0, 0, 1, 1,
-0.1684548, 1.454943, -0.3635037, 1, 0, 0, 1, 1,
-0.164571, 0.2963465, -0.9682823, 1, 0, 0, 1, 1,
-0.1611541, -1.278679, -1.574576, 0, 0, 0, 1, 1,
-0.1595521, -0.04948823, -1.605187, 0, 0, 0, 1, 1,
-0.1594442, -1.03002, -1.492825, 0, 0, 0, 1, 1,
-0.1535522, -2.046737, -0.6107609, 0, 0, 0, 1, 1,
-0.1533576, 2.409302, 0.01399226, 0, 0, 0, 1, 1,
-0.1524563, -0.6911653, -3.345234, 0, 0, 0, 1, 1,
-0.1519932, 0.2106344, 0.491454, 0, 0, 0, 1, 1,
-0.1466157, -0.9860409, -1.909609, 1, 1, 1, 1, 1,
-0.1378385, -0.4534643, -2.25913, 1, 1, 1, 1, 1,
-0.1358709, -1.63788, -2.981155, 1, 1, 1, 1, 1,
-0.1349094, 0.3492195, -1.558622, 1, 1, 1, 1, 1,
-0.1322667, -0.552094, -2.769048, 1, 1, 1, 1, 1,
-0.1311098, 0.7386917, -0.2733258, 1, 1, 1, 1, 1,
-0.1310604, 0.5467883, -0.6414906, 1, 1, 1, 1, 1,
-0.1309972, -1.655385, -1.6588, 1, 1, 1, 1, 1,
-0.1293816, 0.618911, -0.5720503, 1, 1, 1, 1, 1,
-0.1263854, 0.8263943, 0.3311824, 1, 1, 1, 1, 1,
-0.1253239, 1.013165, 1.021016, 1, 1, 1, 1, 1,
-0.1231981, 0.8151789, -0.745205, 1, 1, 1, 1, 1,
-0.1191196, -0.1948262, -1.289264, 1, 1, 1, 1, 1,
-0.1189951, -0.1720732, -3.158804, 1, 1, 1, 1, 1,
-0.1188799, -0.196407, -2.860209, 1, 1, 1, 1, 1,
-0.1182057, 2.288356, -3.852643, 0, 0, 1, 1, 1,
-0.1177633, 1.316379, 0.2746526, 1, 0, 0, 1, 1,
-0.1149332, 0.8491527, -1.037645, 1, 0, 0, 1, 1,
-0.1130514, 0.5319975, -2.161317, 1, 0, 0, 1, 1,
-0.1078673, -0.1300582, -0.5096501, 1, 0, 0, 1, 1,
-0.107681, -0.371453, -2.843611, 1, 0, 0, 1, 1,
-0.1061988, -0.8063486, -4.469097, 0, 0, 0, 1, 1,
-0.1014668, -1.943271, -3.348938, 0, 0, 0, 1, 1,
-0.09734222, -0.8047534, -3.072893, 0, 0, 0, 1, 1,
-0.09717271, -1.208374, -0.462246, 0, 0, 0, 1, 1,
-0.09621578, 1.194805, -1.213017, 0, 0, 0, 1, 1,
-0.09608805, 0.05213461, -1.258519, 0, 0, 0, 1, 1,
-0.09474909, 1.36709, -0.8035233, 0, 0, 0, 1, 1,
-0.09418955, -0.7096484, -2.870104, 1, 1, 1, 1, 1,
-0.08720863, 2.408684, 0.3093387, 1, 1, 1, 1, 1,
-0.0857337, 1.184582, -0.8883513, 1, 1, 1, 1, 1,
-0.08554038, 2.136835, 0.2093252, 1, 1, 1, 1, 1,
-0.08537365, 1.003398, 1.45322, 1, 1, 1, 1, 1,
-0.08389447, 0.2137459, -0.79378, 1, 1, 1, 1, 1,
-0.08177675, -0.7893444, -1.858988, 1, 1, 1, 1, 1,
-0.0774192, -1.32995, -3.217701, 1, 1, 1, 1, 1,
-0.07697278, 0.2667951, -1.008936, 1, 1, 1, 1, 1,
-0.07622691, 0.897196, 0.2178418, 1, 1, 1, 1, 1,
-0.07564072, -0.6964473, -4.611726, 1, 1, 1, 1, 1,
-0.07194794, 0.3540896, -1.885376, 1, 1, 1, 1, 1,
-0.06920745, 2.665059, -0.2202443, 1, 1, 1, 1, 1,
-0.06813286, 1.767057, -1.292702, 1, 1, 1, 1, 1,
-0.06566207, -1.892805, -3.4261, 1, 1, 1, 1, 1,
-0.06552523, 1.344218, -0.9390934, 0, 0, 1, 1, 1,
-0.06236606, 2.707166, -0.01997543, 1, 0, 0, 1, 1,
-0.06227281, 0.4195382, 2.14079, 1, 0, 0, 1, 1,
-0.06126364, -0.4823826, -3.781363, 1, 0, 0, 1, 1,
-0.06099099, 0.2361546, 0.06678475, 1, 0, 0, 1, 1,
-0.05884933, 0.2110174, -0.7968257, 1, 0, 0, 1, 1,
-0.05170993, 0.4836223, -0.5014649, 0, 0, 0, 1, 1,
-0.05157154, 0.5357497, -0.6573606, 0, 0, 0, 1, 1,
-0.0473618, 0.74868, 2.406248, 0, 0, 0, 1, 1,
-0.04609815, 2.169504, -0.5592418, 0, 0, 0, 1, 1,
-0.04550498, -1.145195, -2.892257, 0, 0, 0, 1, 1,
-0.04362715, -0.05756265, -1.818026, 0, 0, 0, 1, 1,
-0.0413772, 0.8773611, 2.519678, 0, 0, 0, 1, 1,
-0.02945189, 0.1828352, -1.13319, 1, 1, 1, 1, 1,
-0.02911262, -0.04963227, -1.635892, 1, 1, 1, 1, 1,
-0.02648132, 1.023596, 0.4645915, 1, 1, 1, 1, 1,
-0.0220679, 0.875922, 1.323824, 1, 1, 1, 1, 1,
-0.01769982, -0.5584599, -3.593461, 1, 1, 1, 1, 1,
-0.01664767, 0.1481383, -0.3008306, 1, 1, 1, 1, 1,
-0.0161192, -0.7768435, -2.731738, 1, 1, 1, 1, 1,
-0.01429657, -1.855496, -2.953089, 1, 1, 1, 1, 1,
-0.01350281, -0.01458489, -1.914506, 1, 1, 1, 1, 1,
-0.008274813, -0.1277894, -3.368156, 1, 1, 1, 1, 1,
-0.00617069, -2.153097, -2.108698, 1, 1, 1, 1, 1,
-0.006156549, 0.9695225, 0.2335584, 1, 1, 1, 1, 1,
-0.004976344, 0.1825722, 0.1770995, 1, 1, 1, 1, 1,
-0.002160992, -0.5597987, -2.469524, 1, 1, 1, 1, 1,
0.0009107409, 0.4522517, -1.368042, 1, 1, 1, 1, 1,
0.003681585, -0.8473132, 4.505994, 0, 0, 1, 1, 1,
0.005561902, 0.5630261, 0.8683291, 1, 0, 0, 1, 1,
0.006012043, -1.070941, 5.112118, 1, 0, 0, 1, 1,
0.007001851, 1.094117, -1.012231, 1, 0, 0, 1, 1,
0.007113314, -0.1605555, 1.377854, 1, 0, 0, 1, 1,
0.008569728, -0.05555664, 1.03247, 1, 0, 0, 1, 1,
0.008597398, -0.233347, 3.540503, 0, 0, 0, 1, 1,
0.01031525, 2.226806, 1.363665, 0, 0, 0, 1, 1,
0.01082763, 0.2880515, -1.647994, 0, 0, 0, 1, 1,
0.01192432, 1.88871, 0.04241754, 0, 0, 0, 1, 1,
0.01261323, -0.2527899, 3.44067, 0, 0, 0, 1, 1,
0.0137962, -0.9590279, 4.681636, 0, 0, 0, 1, 1,
0.01467958, 0.2986851, 1.898449, 0, 0, 0, 1, 1,
0.01502366, 0.6383904, -1.516492, 1, 1, 1, 1, 1,
0.01622609, -0.426566, 2.981838, 1, 1, 1, 1, 1,
0.02596038, 0.4415776, -1.347006, 1, 1, 1, 1, 1,
0.02767232, -0.3548589, 2.159316, 1, 1, 1, 1, 1,
0.02790472, -0.6390105, 3.093379, 1, 1, 1, 1, 1,
0.02926839, -2.339129, 3.961865, 1, 1, 1, 1, 1,
0.0299761, 0.8470768, 1.112594, 1, 1, 1, 1, 1,
0.03172624, 0.6874582, -0.06317884, 1, 1, 1, 1, 1,
0.03229162, -1.898593, 0.868385, 1, 1, 1, 1, 1,
0.03955026, -0.8619432, 2.453484, 1, 1, 1, 1, 1,
0.04209602, -0.4348274, 2.57104, 1, 1, 1, 1, 1,
0.04405138, -0.04671854, 2.772133, 1, 1, 1, 1, 1,
0.04588953, 1.212601, 1.23638, 1, 1, 1, 1, 1,
0.05057433, 2.370962, 2.756983, 1, 1, 1, 1, 1,
0.05532209, -0.3027722, 2.454135, 1, 1, 1, 1, 1,
0.05725237, 2.018753, -0.562827, 0, 0, 1, 1, 1,
0.05808498, -1.073894, 3.452307, 1, 0, 0, 1, 1,
0.06361417, -0.8845232, 3.843188, 1, 0, 0, 1, 1,
0.06507663, -0.2453869, 2.240022, 1, 0, 0, 1, 1,
0.06754227, -2.335805, 2.895084, 1, 0, 0, 1, 1,
0.07154647, -1.064166, 3.768218, 1, 0, 0, 1, 1,
0.07308067, 1.772378, -0.01224424, 0, 0, 0, 1, 1,
0.07364434, -0.7029069, 2.243119, 0, 0, 0, 1, 1,
0.07478038, 1.81013, -1.457092, 0, 0, 0, 1, 1,
0.07554075, 0.3809682, 1.510518, 0, 0, 0, 1, 1,
0.07784904, -1.182778, 2.386234, 0, 0, 0, 1, 1,
0.07951959, -0.3405246, 4.990246, 0, 0, 0, 1, 1,
0.08237241, -0.4284114, 2.537995, 0, 0, 0, 1, 1,
0.08434065, 2.088298, -0.5399761, 1, 1, 1, 1, 1,
0.0848079, 0.809257, 0.9254707, 1, 1, 1, 1, 1,
0.08514673, -0.383034, 2.967316, 1, 1, 1, 1, 1,
0.09014773, 0.7903532, -0.8438864, 1, 1, 1, 1, 1,
0.09693696, -3.461529, 2.847587, 1, 1, 1, 1, 1,
0.097464, 2.211427, -0.6684723, 1, 1, 1, 1, 1,
0.1026625, 0.5433257, 1.015902, 1, 1, 1, 1, 1,
0.1070872, 0.5608301, 0.4497744, 1, 1, 1, 1, 1,
0.1074599, -0.04075987, 2.017583, 1, 1, 1, 1, 1,
0.1078244, 1.751741, -1.101514, 1, 1, 1, 1, 1,
0.1100863, 1.868753, 1.003506, 1, 1, 1, 1, 1,
0.1119661, 0.4261626, -1.252046, 1, 1, 1, 1, 1,
0.1132532, -1.027367, 2.602015, 1, 1, 1, 1, 1,
0.1137931, -0.6770959, 2.757277, 1, 1, 1, 1, 1,
0.1167773, -2.481966, 4.966579, 1, 1, 1, 1, 1,
0.1259596, -0.3659689, 1.664014, 0, 0, 1, 1, 1,
0.1283035, -1.224554, 0.9424862, 1, 0, 0, 1, 1,
0.13246, 0.1851448, -0.5682471, 1, 0, 0, 1, 1,
0.1335744, -0.05966016, 1.717397, 1, 0, 0, 1, 1,
0.1389212, 0.2053681, 2.209, 1, 0, 0, 1, 1,
0.1427707, 0.4983818, 0.6202264, 1, 0, 0, 1, 1,
0.1495117, -1.555789, 3.926927, 0, 0, 0, 1, 1,
0.1539524, 2.134982, -0.3121679, 0, 0, 0, 1, 1,
0.1597361, 0.2596154, 1.498055, 0, 0, 0, 1, 1,
0.1627167, -1.44558, 1.983641, 0, 0, 0, 1, 1,
0.1674929, 1.010782, 1.044915, 0, 0, 0, 1, 1,
0.1707351, -0.09736387, 1.943982, 0, 0, 0, 1, 1,
0.1708114, 0.6704801, 1.271305, 0, 0, 0, 1, 1,
0.1719718, 1.389635, 1.487508, 1, 1, 1, 1, 1,
0.1757125, 2.044643, -0.6636913, 1, 1, 1, 1, 1,
0.178278, 0.8104279, 1.162688, 1, 1, 1, 1, 1,
0.1791737, -0.5611538, 1.845326, 1, 1, 1, 1, 1,
0.1793246, -0.4971286, 3.730502, 1, 1, 1, 1, 1,
0.1799313, 0.4684457, -2.618364, 1, 1, 1, 1, 1,
0.1818729, -0.2401549, 1.346687, 1, 1, 1, 1, 1,
0.1826823, 1.358657, 0.4450701, 1, 1, 1, 1, 1,
0.1830185, -1.209993, 2.810018, 1, 1, 1, 1, 1,
0.1834106, -0.01639855, 2.890755, 1, 1, 1, 1, 1,
0.185021, 0.1083397, 2.152519, 1, 1, 1, 1, 1,
0.1851332, -0.6482584, 2.350537, 1, 1, 1, 1, 1,
0.1873634, -1.070283, 1.994215, 1, 1, 1, 1, 1,
0.1991424, 1.585261, 0.1906026, 1, 1, 1, 1, 1,
0.1991565, 1.080731, 0.7928329, 1, 1, 1, 1, 1,
0.2000914, -0.669854, 3.235891, 0, 0, 1, 1, 1,
0.20732, 0.9847902, 0.9702407, 1, 0, 0, 1, 1,
0.2087492, -1.020159, 3.222705, 1, 0, 0, 1, 1,
0.2091443, -0.009231674, 1.828911, 1, 0, 0, 1, 1,
0.2111671, -1.835723, 2.038349, 1, 0, 0, 1, 1,
0.2118236, 1.417422, 0.9461491, 1, 0, 0, 1, 1,
0.2128294, 0.761079, -0.5212068, 0, 0, 0, 1, 1,
0.2182613, -0.157033, 2.475404, 0, 0, 0, 1, 1,
0.2185492, 0.7225146, 1.087806, 0, 0, 0, 1, 1,
0.2201143, -0.4296884, 1.652416, 0, 0, 0, 1, 1,
0.2279647, 0.887273, 0.5690298, 0, 0, 0, 1, 1,
0.2332954, -1.015042, 2.417397, 0, 0, 0, 1, 1,
0.2333773, -0.02926231, 2.709992, 0, 0, 0, 1, 1,
0.2334677, 0.5521846, -1.138108, 1, 1, 1, 1, 1,
0.2342177, 0.5173946, -1.198016, 1, 1, 1, 1, 1,
0.236504, 0.789134, -0.9339795, 1, 1, 1, 1, 1,
0.2381981, -0.6611391, 4.417325, 1, 1, 1, 1, 1,
0.2465762, 0.02106121, 3.554201, 1, 1, 1, 1, 1,
0.2488253, 0.2411641, 0.489835, 1, 1, 1, 1, 1,
0.2572925, 0.9432747, 2.812527, 1, 1, 1, 1, 1,
0.2609932, 0.05090448, 0.06400049, 1, 1, 1, 1, 1,
0.2615665, 1.207408, -1.619435, 1, 1, 1, 1, 1,
0.2653358, 0.4974762, 1.314687, 1, 1, 1, 1, 1,
0.2665647, -0.01878925, 1.720743, 1, 1, 1, 1, 1,
0.2666173, -1.279973, 3.627754, 1, 1, 1, 1, 1,
0.268645, -0.8185226, 3.136504, 1, 1, 1, 1, 1,
0.2742807, 0.5248247, 0.6257463, 1, 1, 1, 1, 1,
0.2764031, 0.3585507, 1.073824, 1, 1, 1, 1, 1,
0.2770168, -0.8379796, 3.581573, 0, 0, 1, 1, 1,
0.2803173, 0.1742189, 0.3201609, 1, 0, 0, 1, 1,
0.287655, 0.1430328, 2.192082, 1, 0, 0, 1, 1,
0.2913876, 0.8792124, 0.5461269, 1, 0, 0, 1, 1,
0.2914291, -0.5089598, 1.850769, 1, 0, 0, 1, 1,
0.292113, 1.701339, -0.7173973, 1, 0, 0, 1, 1,
0.2938755, -0.2134054, 2.365126, 0, 0, 0, 1, 1,
0.2955572, -0.3282261, 1.869945, 0, 0, 0, 1, 1,
0.2957644, 0.05126227, 1.128413, 0, 0, 0, 1, 1,
0.2985673, 0.9218311, -0.6724422, 0, 0, 0, 1, 1,
0.3045802, -0.326109, 4.198002, 0, 0, 0, 1, 1,
0.3046439, 0.8363186, -0.4526329, 0, 0, 0, 1, 1,
0.3080617, 1.011374, 1.116735, 0, 0, 0, 1, 1,
0.3111822, 0.5081776, 0.9419861, 1, 1, 1, 1, 1,
0.311802, -0.1004571, 2.158083, 1, 1, 1, 1, 1,
0.3199901, 0.3881534, -0.4425414, 1, 1, 1, 1, 1,
0.3209601, -0.7446368, 2.67656, 1, 1, 1, 1, 1,
0.3246421, -0.5597324, 2.924024, 1, 1, 1, 1, 1,
0.3260389, -0.007889752, 0.4171911, 1, 1, 1, 1, 1,
0.3300094, -0.3335445, 3.360964, 1, 1, 1, 1, 1,
0.3302821, -0.579963, 3.6167, 1, 1, 1, 1, 1,
0.3303711, -0.4142413, 4.52352, 1, 1, 1, 1, 1,
0.3308155, 1.73869, -0.4877556, 1, 1, 1, 1, 1,
0.3340071, 0.5437428, 2.413522, 1, 1, 1, 1, 1,
0.3408571, 1.128658, 0.4502969, 1, 1, 1, 1, 1,
0.3423043, -0.4242328, 3.553849, 1, 1, 1, 1, 1,
0.3427478, -1.017139, 2.163525, 1, 1, 1, 1, 1,
0.346924, 0.1599974, 0.2389543, 1, 1, 1, 1, 1,
0.3472742, -1.370919, 2.367214, 0, 0, 1, 1, 1,
0.3481142, 0.486563, 0.5214265, 1, 0, 0, 1, 1,
0.3489488, -0.4941668, 2.250558, 1, 0, 0, 1, 1,
0.3491383, -0.8763701, 3.376452, 1, 0, 0, 1, 1,
0.352571, -1.402597, 1.546509, 1, 0, 0, 1, 1,
0.3559701, 0.3940321, 0.4081315, 1, 0, 0, 1, 1,
0.3601867, -0.2891542, 4.159099, 0, 0, 0, 1, 1,
0.3634206, -0.7778647, 3.810904, 0, 0, 0, 1, 1,
0.365496, 0.4419431, 1.590189, 0, 0, 0, 1, 1,
0.3661641, -1.480014, 2.068962, 0, 0, 0, 1, 1,
0.3664164, 1.293167, 0.2556075, 0, 0, 0, 1, 1,
0.3670581, 1.203031, -0.03689418, 0, 0, 0, 1, 1,
0.3683359, -1.236728, 3.355402, 0, 0, 0, 1, 1,
0.3709035, 1.303383, -2.78615, 1, 1, 1, 1, 1,
0.3731132, 1.479826, 0.3834203, 1, 1, 1, 1, 1,
0.375069, -0.6078941, 2.321392, 1, 1, 1, 1, 1,
0.3786548, -0.9954019, 4.836843, 1, 1, 1, 1, 1,
0.383659, 1.270582, -1.733393, 1, 1, 1, 1, 1,
0.3842469, 0.09694498, 1.186439, 1, 1, 1, 1, 1,
0.3916321, 3.132674, 1.265796, 1, 1, 1, 1, 1,
0.3976919, -0.2378955, 0.9822283, 1, 1, 1, 1, 1,
0.3998447, 0.5227926, -0.2820095, 1, 1, 1, 1, 1,
0.401217, 0.2927841, 2.158881, 1, 1, 1, 1, 1,
0.4052708, 0.7214967, 1.763289, 1, 1, 1, 1, 1,
0.4059596, 0.6021013, -0.9000896, 1, 1, 1, 1, 1,
0.4070981, -1.004637, 1.910067, 1, 1, 1, 1, 1,
0.4073794, -0.9214246, 1.355075, 1, 1, 1, 1, 1,
0.4075758, 0.8808628, 0.2310888, 1, 1, 1, 1, 1,
0.4080805, -0.2012862, 1.443852, 0, 0, 1, 1, 1,
0.4117191, 0.1902653, 1.576746, 1, 0, 0, 1, 1,
0.4121367, -1.187047, 2.67046, 1, 0, 0, 1, 1,
0.4143546, 1.604955, 0.5997399, 1, 0, 0, 1, 1,
0.4148597, 0.9345058, 1.03634, 1, 0, 0, 1, 1,
0.4189207, -0.612928, 2.715616, 1, 0, 0, 1, 1,
0.4202198, 0.06374182, 1.330576, 0, 0, 0, 1, 1,
0.4214104, -0.2553023, 2.642882, 0, 0, 0, 1, 1,
0.4219848, 0.4158945, 0.94123, 0, 0, 0, 1, 1,
0.423371, -1.041634, 4.370792, 0, 0, 0, 1, 1,
0.4235359, 1.226097, 2.379533, 0, 0, 0, 1, 1,
0.4263475, -0.1689561, 1.855914, 0, 0, 0, 1, 1,
0.4274506, -0.226471, 3.278647, 0, 0, 0, 1, 1,
0.4369179, -0.07663883, 1.796809, 1, 1, 1, 1, 1,
0.4382476, 0.9413323, -0.1475644, 1, 1, 1, 1, 1,
0.44402, 0.8659294, -0.8352276, 1, 1, 1, 1, 1,
0.452598, 0.7477065, -0.419303, 1, 1, 1, 1, 1,
0.4545537, -1.087178, 1.891825, 1, 1, 1, 1, 1,
0.456235, 1.533678, -0.1859885, 1, 1, 1, 1, 1,
0.4584451, -1.750354, 3.487777, 1, 1, 1, 1, 1,
0.4590399, 0.2170703, 1.537529, 1, 1, 1, 1, 1,
0.4593591, -0.4372877, 3.837419, 1, 1, 1, 1, 1,
0.4640016, -2.2749, 3.181208, 1, 1, 1, 1, 1,
0.4689885, 0.9760264, -0.1498873, 1, 1, 1, 1, 1,
0.4706395, -0.7766467, 4.071286, 1, 1, 1, 1, 1,
0.4711714, -1.338618, 3.502367, 1, 1, 1, 1, 1,
0.4729203, 0.7220021, 0.1696282, 1, 1, 1, 1, 1,
0.4739636, -1.435659, 3.599994, 1, 1, 1, 1, 1,
0.4757676, -0.5912855, 4.342443, 0, 0, 1, 1, 1,
0.4766181, 1.274317, 0.5414761, 1, 0, 0, 1, 1,
0.4771306, -1.042474, 3.922549, 1, 0, 0, 1, 1,
0.4771916, 0.07508705, 1.226596, 1, 0, 0, 1, 1,
0.4774821, 0.09501436, 1.414513, 1, 0, 0, 1, 1,
0.4804279, -1.194095, 2.548451, 1, 0, 0, 1, 1,
0.4815853, 2.460514, 0.04665811, 0, 0, 0, 1, 1,
0.4835912, 0.2574689, 0.624629, 0, 0, 0, 1, 1,
0.484863, -0.03793042, 0.9167603, 0, 0, 0, 1, 1,
0.4915807, -0.2715481, 2.353611, 0, 0, 0, 1, 1,
0.4921594, -0.3436653, 1.836351, 0, 0, 0, 1, 1,
0.4926687, -0.6385018, 1.22579, 0, 0, 0, 1, 1,
0.4954312, -0.8482582, 1.513578, 0, 0, 0, 1, 1,
0.4966557, 0.3272303, -0.3913344, 1, 1, 1, 1, 1,
0.4975557, -0.9799602, 2.747522, 1, 1, 1, 1, 1,
0.4975558, 0.8939818, 1.284364, 1, 1, 1, 1, 1,
0.4982893, -1.172752, 3.105139, 1, 1, 1, 1, 1,
0.4999408, -1.098661, 3.018637, 1, 1, 1, 1, 1,
0.5004677, 0.5719499, 0.7736446, 1, 1, 1, 1, 1,
0.5065932, 1.019584, -0.6852584, 1, 1, 1, 1, 1,
0.506946, 0.09660488, 1.799024, 1, 1, 1, 1, 1,
0.5176341, -0.7240967, 2.046855, 1, 1, 1, 1, 1,
0.5177563, 1.718011, 0.7225686, 1, 1, 1, 1, 1,
0.5229737, 1.080677, -0.104389, 1, 1, 1, 1, 1,
0.5230339, 0.4858328, 1.138989, 1, 1, 1, 1, 1,
0.5239121, -1.108127, 2.668722, 1, 1, 1, 1, 1,
0.5273343, 0.2170516, 0.5308611, 1, 1, 1, 1, 1,
0.52798, -2.014167, 4.74289, 1, 1, 1, 1, 1,
0.5286978, -1.186312, 3.033715, 0, 0, 1, 1, 1,
0.5287724, 1.752724, -0.6416094, 1, 0, 0, 1, 1,
0.5302866, 0.3881249, -1.386522, 1, 0, 0, 1, 1,
0.5407702, 0.9275391, 1.358101, 1, 0, 0, 1, 1,
0.5444699, 0.6231822, 2.539691, 1, 0, 0, 1, 1,
0.546535, -0.8937446, 1.675221, 1, 0, 0, 1, 1,
0.5465388, -0.3647875, 3.878811, 0, 0, 0, 1, 1,
0.5467655, -0.5778059, 3.969235, 0, 0, 0, 1, 1,
0.5472423, -2.541527, 3.405548, 0, 0, 0, 1, 1,
0.5505639, 0.4859806, 0.0556098, 0, 0, 0, 1, 1,
0.5506233, -1.035946, 2.267111, 0, 0, 0, 1, 1,
0.5558616, 0.9049634, 1.729404, 0, 0, 0, 1, 1,
0.559806, -0.1670682, 1.668495, 0, 0, 0, 1, 1,
0.5655811, -1.049995, 3.435552, 1, 1, 1, 1, 1,
0.5744123, -1.659869, 2.543849, 1, 1, 1, 1, 1,
0.58728, -0.7657449, -0.4677328, 1, 1, 1, 1, 1,
0.5888001, 0.5910019, 2.255611, 1, 1, 1, 1, 1,
0.5898681, -0.8247131, 2.270663, 1, 1, 1, 1, 1,
0.5936954, 2.11749, -0.169081, 1, 1, 1, 1, 1,
0.5967519, -0.8589992, 3.031079, 1, 1, 1, 1, 1,
0.6003392, -0.4363171, 4.206519, 1, 1, 1, 1, 1,
0.6022977, 0.5834754, 0.1544676, 1, 1, 1, 1, 1,
0.6056963, -0.39451, 1.783615, 1, 1, 1, 1, 1,
0.6067045, 1.014665, 1.577248, 1, 1, 1, 1, 1,
0.6109793, 0.08260088, 2.836014, 1, 1, 1, 1, 1,
0.6153079, -1.768145, 1.527512, 1, 1, 1, 1, 1,
0.6177462, -0.6171202, 0.7652088, 1, 1, 1, 1, 1,
0.6197491, -0.303231, 1.130008, 1, 1, 1, 1, 1,
0.6210933, 1.010743, 0.3404944, 0, 0, 1, 1, 1,
0.6216608, 0.6995764, -0.4101257, 1, 0, 0, 1, 1,
0.6241194, 1.055111, -0.2588148, 1, 0, 0, 1, 1,
0.6257238, -0.7452151, 1.968623, 1, 0, 0, 1, 1,
0.6300234, -0.8852867, 3.927063, 1, 0, 0, 1, 1,
0.6342213, -0.1092564, 2.660906, 1, 0, 0, 1, 1,
0.6358802, 2.520304, -0.2195037, 0, 0, 0, 1, 1,
0.6384644, 1.76038, 1.611656, 0, 0, 0, 1, 1,
0.6400019, -1.512941, 0.4046866, 0, 0, 0, 1, 1,
0.6412525, 0.006280309, 1.848488, 0, 0, 0, 1, 1,
0.6451061, -1.123769, 3.307366, 0, 0, 0, 1, 1,
0.6543958, 0.242439, 0.646879, 0, 0, 0, 1, 1,
0.6576592, -0.3147927, 1.6818, 0, 0, 0, 1, 1,
0.6579698, 0.2356289, 2.45455, 1, 1, 1, 1, 1,
0.6582138, 0.3098509, 2.066947, 1, 1, 1, 1, 1,
0.6671383, 1.056267, -0.4016298, 1, 1, 1, 1, 1,
0.6717316, 0.7819799, 1.303765, 1, 1, 1, 1, 1,
0.6776389, -0.9992051, 2.812246, 1, 1, 1, 1, 1,
0.6792764, -1.183869, 2.647852, 1, 1, 1, 1, 1,
0.6807557, -0.02595912, 1.958674, 1, 1, 1, 1, 1,
0.6845526, 0.404615, -0.06691561, 1, 1, 1, 1, 1,
0.690909, -0.9477292, 1.032845, 1, 1, 1, 1, 1,
0.691088, -1.051264, 1.586376, 1, 1, 1, 1, 1,
0.6955058, 1.515563, -0.7299199, 1, 1, 1, 1, 1,
0.6957181, 1.765511, 0.01968429, 1, 1, 1, 1, 1,
0.6986149, 0.9746736, -1.033827, 1, 1, 1, 1, 1,
0.704334, -1.213947, 2.961532, 1, 1, 1, 1, 1,
0.7045066, -0.05941654, 3.004112, 1, 1, 1, 1, 1,
0.7062407, 0.1194839, 2.084767, 0, 0, 1, 1, 1,
0.706523, -1.432183, 2.133882, 1, 0, 0, 1, 1,
0.7146969, -0.5921257, 1.002399, 1, 0, 0, 1, 1,
0.7172579, 0.3718618, 0.6678219, 1, 0, 0, 1, 1,
0.7198225, -0.3736012, 2.646465, 1, 0, 0, 1, 1,
0.723249, 0.4611799, 0.2809558, 1, 0, 0, 1, 1,
0.7262748, -0.7553003, 3.616047, 0, 0, 0, 1, 1,
0.7270716, 0.6259902, -0.4061547, 0, 0, 0, 1, 1,
0.727248, 0.4978517, 0.8680295, 0, 0, 0, 1, 1,
0.7303876, -0.1717053, 2.58425, 0, 0, 0, 1, 1,
0.7320863, -0.6309323, 2.790288, 0, 0, 0, 1, 1,
0.7386771, 0.5746691, -0.3476973, 0, 0, 0, 1, 1,
0.7492316, -0.6054979, 1.88029, 0, 0, 0, 1, 1,
0.7592934, -1.085241, 4.165623, 1, 1, 1, 1, 1,
0.767372, -3.04499, 3.693555, 1, 1, 1, 1, 1,
0.769365, 0.1964346, 0.04606006, 1, 1, 1, 1, 1,
0.7726645, -1.084418, 1.383957, 1, 1, 1, 1, 1,
0.7741562, 0.2716874, -1.244649, 1, 1, 1, 1, 1,
0.7745497, -0.1521461, 2.701933, 1, 1, 1, 1, 1,
0.7776423, 0.02228715, 1.233666, 1, 1, 1, 1, 1,
0.7779596, -1.400558, 2.156252, 1, 1, 1, 1, 1,
0.7802445, -2.3574, 3.332444, 1, 1, 1, 1, 1,
0.7815515, 0.4174467, 2.239798, 1, 1, 1, 1, 1,
0.7840393, -0.2367807, 1.641484, 1, 1, 1, 1, 1,
0.7857241, 0.7393476, 1.098286, 1, 1, 1, 1, 1,
0.7872189, -0.2260885, 1.726193, 1, 1, 1, 1, 1,
0.7940459, 0.3080708, 0.7689723, 1, 1, 1, 1, 1,
0.7960103, 0.7274345, 1.387753, 1, 1, 1, 1, 1,
0.7971577, -1.107913, 2.648288, 0, 0, 1, 1, 1,
0.7982807, -0.7581881, 2.228749, 1, 0, 0, 1, 1,
0.8046148, 0.5172268, 1.323696, 1, 0, 0, 1, 1,
0.8102071, -0.3040147, 2.481667, 1, 0, 0, 1, 1,
0.8282623, 0.2272467, 2.43566, 1, 0, 0, 1, 1,
0.8298998, -0.9674683, 1.74238, 1, 0, 0, 1, 1,
0.8303922, -1.427685, 2.148627, 0, 0, 0, 1, 1,
0.8476551, -0.3106534, 3.194267, 0, 0, 0, 1, 1,
0.8524736, -0.3211271, 3.047208, 0, 0, 0, 1, 1,
0.8569987, 2.251712, -0.6027256, 0, 0, 0, 1, 1,
0.8585891, -1.898213, 1.842301, 0, 0, 0, 1, 1,
0.8605208, -0.9991547, 1.669046, 0, 0, 0, 1, 1,
0.8617949, -0.4283897, 2.375652, 0, 0, 0, 1, 1,
0.8646514, 0.3717285, 1.226473, 1, 1, 1, 1, 1,
0.8666288, -0.384824, 3.88694, 1, 1, 1, 1, 1,
0.8704907, -0.4420984, 3.313653, 1, 1, 1, 1, 1,
0.8796345, 0.7620985, 1.952996, 1, 1, 1, 1, 1,
0.8812934, 0.1013559, 0.7111876, 1, 1, 1, 1, 1,
0.8856765, 1.96845, -0.5572914, 1, 1, 1, 1, 1,
0.8863164, 1.155495, 0.11231, 1, 1, 1, 1, 1,
0.8867518, 0.2676992, 2.702263, 1, 1, 1, 1, 1,
0.8921421, 0.8681233, -0.7674065, 1, 1, 1, 1, 1,
0.8931404, -1.336921, 2.700398, 1, 1, 1, 1, 1,
0.9003067, -0.5139248, 1.949628, 1, 1, 1, 1, 1,
0.9035442, -0.3847701, 2.445073, 1, 1, 1, 1, 1,
0.9056155, 0.4021818, 1.527016, 1, 1, 1, 1, 1,
0.9162222, -0.9194219, 4.046324, 1, 1, 1, 1, 1,
0.9172089, -0.2731353, 3.015273, 1, 1, 1, 1, 1,
0.9178917, 2.28541, 2.865699, 0, 0, 1, 1, 1,
0.9188475, 1.962474, 1.726056, 1, 0, 0, 1, 1,
0.9234887, 0.4993991, 1.75567, 1, 0, 0, 1, 1,
0.9239107, 1.044032, 0.2811638, 1, 0, 0, 1, 1,
0.9404359, 0.1432508, 2.339881, 1, 0, 0, 1, 1,
0.9438638, 0.2477039, 0.1944517, 1, 0, 0, 1, 1,
0.9497086, -0.01730701, 2.947215, 0, 0, 0, 1, 1,
0.9506531, -0.3513289, 1.030609, 0, 0, 0, 1, 1,
0.9521126, 0.3804804, 1.337044, 0, 0, 0, 1, 1,
0.9627857, 2.603392, -0.7633652, 0, 0, 0, 1, 1,
0.963282, -0.8460936, 5.02265, 0, 0, 0, 1, 1,
0.9633836, 1.07855, 0.2563202, 0, 0, 0, 1, 1,
0.9698671, 0.1711863, 1.591992, 0, 0, 0, 1, 1,
0.98149, -0.1305059, 0.3145931, 1, 1, 1, 1, 1,
0.9861503, -0.1010254, 2.370943, 1, 1, 1, 1, 1,
0.9891, -0.1397018, 1.54, 1, 1, 1, 1, 1,
0.997596, 0.05065709, 1.447729, 1, 1, 1, 1, 1,
1.002537, -0.166087, 0.2598009, 1, 1, 1, 1, 1,
1.003624, -1.046581, 3.112298, 1, 1, 1, 1, 1,
1.00719, 0.6952223, 1.153967, 1, 1, 1, 1, 1,
1.008918, -0.3517078, 1.245378, 1, 1, 1, 1, 1,
1.010777, 0.5188443, 0.5788604, 1, 1, 1, 1, 1,
1.015324, -1.653419, 3.263693, 1, 1, 1, 1, 1,
1.017629, 1.424511, 1.541098, 1, 1, 1, 1, 1,
1.020155, -0.5266816, 2.554331, 1, 1, 1, 1, 1,
1.032178, 1.263198, 2.549482, 1, 1, 1, 1, 1,
1.033505, -0.7651149, 2.380799, 1, 1, 1, 1, 1,
1.042932, 0.5403877, 0.9732216, 1, 1, 1, 1, 1,
1.045266, 1.701164, -0.02026439, 0, 0, 1, 1, 1,
1.048972, -1.300071, 2.662681, 1, 0, 0, 1, 1,
1.070653, -0.3007119, 1.91853, 1, 0, 0, 1, 1,
1.071267, -1.447931, 1.446026, 1, 0, 0, 1, 1,
1.071591, 0.213144, 1.821079, 1, 0, 0, 1, 1,
1.077253, 1.651275, 1.306382, 1, 0, 0, 1, 1,
1.081264, -0.9416317, 1.644747, 0, 0, 0, 1, 1,
1.085372, 1.086814, 2.450602, 0, 0, 0, 1, 1,
1.090448, 1.02819, 0.1941922, 0, 0, 0, 1, 1,
1.092994, -0.06698129, 0.9817107, 0, 0, 0, 1, 1,
1.095553, -1.615212, 2.201973, 0, 0, 0, 1, 1,
1.102462, 0.2026017, 0.2252399, 0, 0, 0, 1, 1,
1.104897, -0.2575919, 0.8581654, 0, 0, 0, 1, 1,
1.105924, -0.699756, 1.399352, 1, 1, 1, 1, 1,
1.108213, 0.2210226, 2.764136, 1, 1, 1, 1, 1,
1.120344, -0.01468724, 2.16958, 1, 1, 1, 1, 1,
1.125659, -0.4135209, 2.796298, 1, 1, 1, 1, 1,
1.14321, -1.833449, 1.885846, 1, 1, 1, 1, 1,
1.144838, -0.8966551, 2.75075, 1, 1, 1, 1, 1,
1.149678, -0.874504, 3.197012, 1, 1, 1, 1, 1,
1.150965, 0.4663526, 0.9970983, 1, 1, 1, 1, 1,
1.15207, 1.466397, 1.384419, 1, 1, 1, 1, 1,
1.154917, 1.323314, -0.6822684, 1, 1, 1, 1, 1,
1.155344, -0.6717539, 1.484228, 1, 1, 1, 1, 1,
1.164023, 0.9778799, 0.4571055, 1, 1, 1, 1, 1,
1.177941, 1.703739, 0.303622, 1, 1, 1, 1, 1,
1.200228, -0.06904189, 2.179208, 1, 1, 1, 1, 1,
1.208008, -0.635579, 2.156762, 1, 1, 1, 1, 1,
1.208254, -1.032059, 3.219299, 0, 0, 1, 1, 1,
1.209298, 0.9409131, 0.4743098, 1, 0, 0, 1, 1,
1.21023, -1.191308, 1.466362, 1, 0, 0, 1, 1,
1.215084, 0.294027, 1.050371, 1, 0, 0, 1, 1,
1.223404, -0.6041374, 2.030008, 1, 0, 0, 1, 1,
1.230468, -0.00486523, 1.09108, 1, 0, 0, 1, 1,
1.233306, -0.090652, 0.5828714, 0, 0, 0, 1, 1,
1.233402, -1.443223, 4.456961, 0, 0, 0, 1, 1,
1.236331, 0.6301882, 2.143376, 0, 0, 0, 1, 1,
1.252012, 2.178882, -0.004921532, 0, 0, 0, 1, 1,
1.262729, -0.5329484, 1.712826, 0, 0, 0, 1, 1,
1.292586, 0.3856729, 1.213204, 0, 0, 0, 1, 1,
1.297647, -0.08117398, 2.032466, 0, 0, 0, 1, 1,
1.298185, 1.540379, 1.356821, 1, 1, 1, 1, 1,
1.298804, 1.404895, 1.015377, 1, 1, 1, 1, 1,
1.298992, 0.04352419, 1.302344, 1, 1, 1, 1, 1,
1.299756, -0.9970216, 3.677019, 1, 1, 1, 1, 1,
1.318991, -1.73126, 1.534907, 1, 1, 1, 1, 1,
1.320025, -0.7803991, 2.001636, 1, 1, 1, 1, 1,
1.321345, -0.524105, 2.047906, 1, 1, 1, 1, 1,
1.322413, -0.6294072, 4.124836, 1, 1, 1, 1, 1,
1.323898, 0.969049, 2.687037, 1, 1, 1, 1, 1,
1.325899, -0.918438, 4.051983, 1, 1, 1, 1, 1,
1.331072, 0.1819756, 0.5506513, 1, 1, 1, 1, 1,
1.337582, -0.09846408, 0.6627356, 1, 1, 1, 1, 1,
1.343189, 0.4887435, 1.169389, 1, 1, 1, 1, 1,
1.352428, 0.9203851, 0.1795775, 1, 1, 1, 1, 1,
1.358551, -0.5028812, 2.255734, 1, 1, 1, 1, 1,
1.367695, -0.4322012, 2.777502, 0, 0, 1, 1, 1,
1.371382, 0.6342083, -0.6653906, 1, 0, 0, 1, 1,
1.380857, 0.2488729, -0.8364742, 1, 0, 0, 1, 1,
1.380893, -3.166596, 3.45549, 1, 0, 0, 1, 1,
1.381389, 0.001397286, 0.4331038, 1, 0, 0, 1, 1,
1.381933, -0.06571655, 2.366713, 1, 0, 0, 1, 1,
1.389125, 0.03981888, 3.518258, 0, 0, 0, 1, 1,
1.389958, -0.6085346, 0.6770679, 0, 0, 0, 1, 1,
1.401798, 0.8905364, 1.277729, 0, 0, 0, 1, 1,
1.40988, -0.6622089, 1.748847, 0, 0, 0, 1, 1,
1.416333, -0.4120542, 3.420348, 0, 0, 0, 1, 1,
1.417635, 0.3738179, 2.273885, 0, 0, 0, 1, 1,
1.424494, -0.00279304, 2.12889, 0, 0, 0, 1, 1,
1.444809, 0.2376401, 0.1771424, 1, 1, 1, 1, 1,
1.447913, -1.101464, 2.256221, 1, 1, 1, 1, 1,
1.455157, -0.3826111, 0.6597182, 1, 1, 1, 1, 1,
1.471134, 0.250242, 0.337482, 1, 1, 1, 1, 1,
1.487018, 0.2091915, 0.6039551, 1, 1, 1, 1, 1,
1.490224, -0.9959181, 2.015716, 1, 1, 1, 1, 1,
1.498921, 0.5625659, 1.061162, 1, 1, 1, 1, 1,
1.49985, -0.647566, 0.8006361, 1, 1, 1, 1, 1,
1.502563, 0.04931629, 1.794642, 1, 1, 1, 1, 1,
1.503137, -0.05795564, 1.668973, 1, 1, 1, 1, 1,
1.522568, -0.3465669, 2.13114, 1, 1, 1, 1, 1,
1.535612, -0.5285681, 1.8251, 1, 1, 1, 1, 1,
1.538002, -0.7840657, 1.265274, 1, 1, 1, 1, 1,
1.576096, 0.1370033, -0.3108525, 1, 1, 1, 1, 1,
1.577846, 1.40242, 0.9639357, 1, 1, 1, 1, 1,
1.580294, -0.0362276, 1.982126, 0, 0, 1, 1, 1,
1.583651, -1.689876, 3.002259, 1, 0, 0, 1, 1,
1.588429, 0.5940227, 1.184833, 1, 0, 0, 1, 1,
1.615283, -1.430602, 0.3677623, 1, 0, 0, 1, 1,
1.617138, 0.334616, 0.06390068, 1, 0, 0, 1, 1,
1.620722, -0.9352311, 3.558748, 1, 0, 0, 1, 1,
1.63447, 0.204552, 2.967176, 0, 0, 0, 1, 1,
1.640762, 1.741151, 2.44202, 0, 0, 0, 1, 1,
1.653762, 0.5779405, 3.263106, 0, 0, 0, 1, 1,
1.665136, 2.380039, -0.172279, 0, 0, 0, 1, 1,
1.667491, -0.8986148, 1.431591, 0, 0, 0, 1, 1,
1.677912, -0.5884058, 2.840737, 0, 0, 0, 1, 1,
1.695443, 1.291225, -0.5703045, 0, 0, 0, 1, 1,
1.699303, -1.000512, 0.8077968, 1, 1, 1, 1, 1,
1.716457, 0.271158, 2.383997, 1, 1, 1, 1, 1,
1.720311, -1.198082, 1.803176, 1, 1, 1, 1, 1,
1.729131, -1.774591, 2.85909, 1, 1, 1, 1, 1,
1.779695, -1.203502, 0.5384347, 1, 1, 1, 1, 1,
1.807107, 0.1080195, 2.449786, 1, 1, 1, 1, 1,
1.825022, 0.7356806, -0.59263, 1, 1, 1, 1, 1,
1.828809, 1.016588, 1.604363, 1, 1, 1, 1, 1,
1.843974, 0.2104771, 1.505374, 1, 1, 1, 1, 1,
1.848474, 0.2385833, 0.4520548, 1, 1, 1, 1, 1,
1.852939, 0.6320522, 2.478243, 1, 1, 1, 1, 1,
1.854961, 0.2719933, 0.122586, 1, 1, 1, 1, 1,
1.884272, 0.8193753, 1.579323, 1, 1, 1, 1, 1,
1.885763, 0.5656139, 1.593184, 1, 1, 1, 1, 1,
1.904843, -0.232839, 1.96262, 1, 1, 1, 1, 1,
1.905892, -0.7493073, 3.322713, 0, 0, 1, 1, 1,
1.935226, 0.5738183, 1.814971, 1, 0, 0, 1, 1,
1.937543, 0.1727732, 0.4424323, 1, 0, 0, 1, 1,
1.957676, -0.195407, 2.081352, 1, 0, 0, 1, 1,
1.993178, -1.369383, 2.71292, 1, 0, 0, 1, 1,
1.995141, 0.5730672, 0.08389188, 1, 0, 0, 1, 1,
2.044725, -0.2012279, 2.0825, 0, 0, 0, 1, 1,
2.141557, -0.7448039, 2.326849, 0, 0, 0, 1, 1,
2.186272, 0.6247134, 0.7162894, 0, 0, 0, 1, 1,
2.239224, -0.148313, 2.942133, 0, 0, 0, 1, 1,
2.326497, 0.01384822, 2.357334, 0, 0, 0, 1, 1,
2.349037, -1.746281, 3.195269, 0, 0, 0, 1, 1,
2.381659, 1.707727, 0.680971, 0, 0, 0, 1, 1,
2.785912, -0.2440052, 2.660994, 1, 1, 1, 1, 1,
2.800751, 0.2931772, 0.464014, 1, 1, 1, 1, 1,
2.816297, 0.1173652, 2.124826, 1, 1, 1, 1, 1,
2.829571, -1.564376, 0.6796842, 1, 1, 1, 1, 1,
2.995721, -0.858824, 0.9524026, 1, 1, 1, 1, 1,
3.086983, -0.7863368, 0.8401766, 1, 1, 1, 1, 1,
3.412473, -1.668467, 3.501593, 1, 1, 1, 1, 1
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
var radius = 9.445685;
var distance = 33.17757;
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
mvMatrix.translate( -0.1936724, 0.1644275, 0.009399414 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.17757);
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
