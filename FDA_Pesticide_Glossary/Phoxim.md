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
-3.229227, -0.9769598, -3.746974, 1, 0, 0, 1,
-3.059862, -1.107598, -0.8952808, 1, 0.007843138, 0, 1,
-2.658188, -0.821498, -2.062967, 1, 0.01176471, 0, 1,
-2.613014, -0.4590104, -2.595702, 1, 0.01960784, 0, 1,
-2.530416, 0.4179636, -2.693499, 1, 0.02352941, 0, 1,
-2.51001, 0.2934843, -1.966352, 1, 0.03137255, 0, 1,
-2.395641, -0.3136865, 0.2073938, 1, 0.03529412, 0, 1,
-2.310771, 1.82817, -1.967564, 1, 0.04313726, 0, 1,
-2.296023, -0.2880988, -1.191691, 1, 0.04705882, 0, 1,
-2.2793, -0.9621242, -3.209892, 1, 0.05490196, 0, 1,
-2.276649, 1.161209, -2.517538, 1, 0.05882353, 0, 1,
-2.268302, 0.7716452, -1.544649, 1, 0.06666667, 0, 1,
-2.213974, -0.5482733, -2.323818, 1, 0.07058824, 0, 1,
-2.162747, -0.09083816, -0.4541761, 1, 0.07843138, 0, 1,
-2.112147, 1.25165, -0.4500406, 1, 0.08235294, 0, 1,
-2.093583, -1.689552, -2.769198, 1, 0.09019608, 0, 1,
-2.077868, 0.6563946, -1.83654, 1, 0.09411765, 0, 1,
-2.064347, -0.08857125, -2.090236, 1, 0.1019608, 0, 1,
-2.046699, 1.520812, 0.5481892, 1, 0.1098039, 0, 1,
-2.045383, -0.8422468, -3.686019, 1, 0.1137255, 0, 1,
-2.022704, -0.731055, -2.197959, 1, 0.1215686, 0, 1,
-1.986622, 0.6840227, 0.4945433, 1, 0.1254902, 0, 1,
-1.98549, 0.4636553, -2.03438, 1, 0.1333333, 0, 1,
-1.981235, 0.4722566, -1.871116, 1, 0.1372549, 0, 1,
-1.97993, 0.545651, -1.579676, 1, 0.145098, 0, 1,
-1.977603, -0.6019197, -3.708147, 1, 0.1490196, 0, 1,
-1.963953, -0.541055, -1.587418, 1, 0.1568628, 0, 1,
-1.957852, 0.1278422, -0.5506564, 1, 0.1607843, 0, 1,
-1.941731, -1.487544, -1.293813, 1, 0.1686275, 0, 1,
-1.932305, 0.6368946, -1.925153, 1, 0.172549, 0, 1,
-1.921693, -0.02622356, -4.173126, 1, 0.1803922, 0, 1,
-1.902519, -0.7386201, -0.3015733, 1, 0.1843137, 0, 1,
-1.887437, -0.896708, -1.936372, 1, 0.1921569, 0, 1,
-1.874105, 0.9783374, -1.927542, 1, 0.1960784, 0, 1,
-1.871655, -1.442321, -2.745857, 1, 0.2039216, 0, 1,
-1.858138, -0.07537185, -1.478151, 1, 0.2117647, 0, 1,
-1.852178, 0.3097462, -1.20641, 1, 0.2156863, 0, 1,
-1.835633, 0.1590631, -2.037371, 1, 0.2235294, 0, 1,
-1.833733, -0.4146419, -2.9669, 1, 0.227451, 0, 1,
-1.818536, -0.5087895, -1.089393, 1, 0.2352941, 0, 1,
-1.818052, 0.8178583, -1.708073, 1, 0.2392157, 0, 1,
-1.81746, -1.00461, -2.008197, 1, 0.2470588, 0, 1,
-1.813794, 0.7238157, -1.710088, 1, 0.2509804, 0, 1,
-1.804951, -0.9230195, -2.512835, 1, 0.2588235, 0, 1,
-1.795267, 0.1815513, -0.5654296, 1, 0.2627451, 0, 1,
-1.785611, -0.037115, -1.335241, 1, 0.2705882, 0, 1,
-1.71952, -0.7221364, -2.01596, 1, 0.2745098, 0, 1,
-1.716, 1.43671, -1.221171, 1, 0.282353, 0, 1,
-1.69517, -0.09025264, -2.034139, 1, 0.2862745, 0, 1,
-1.678934, 1.00467, -0.1512733, 1, 0.2941177, 0, 1,
-1.673778, -2.228364, -1.67085, 1, 0.3019608, 0, 1,
-1.666822, 1.477929, -0.765048, 1, 0.3058824, 0, 1,
-1.650515, -0.8863264, -3.6162, 1, 0.3137255, 0, 1,
-1.648259, 1.330908, -0.3780646, 1, 0.3176471, 0, 1,
-1.631021, 1.856296, -1.003034, 1, 0.3254902, 0, 1,
-1.618999, 0.7525991, -1.542896, 1, 0.3294118, 0, 1,
-1.61319, 0.8800456, 0.2312001, 1, 0.3372549, 0, 1,
-1.611497, -0.1696722, -2.554308, 1, 0.3411765, 0, 1,
-1.608623, -0.152977, -0.5021176, 1, 0.3490196, 0, 1,
-1.600984, -0.2307568, -1.548386, 1, 0.3529412, 0, 1,
-1.598323, -0.4509485, -1.603659, 1, 0.3607843, 0, 1,
-1.575624, -0.3927095, -2.129078, 1, 0.3647059, 0, 1,
-1.53759, -0.7431746, -3.131717, 1, 0.372549, 0, 1,
-1.527291, 1.518337, -2.059639, 1, 0.3764706, 0, 1,
-1.526454, -0.7446036, -3.175296, 1, 0.3843137, 0, 1,
-1.526048, 1.25415, -0.6378194, 1, 0.3882353, 0, 1,
-1.522577, -0.004404441, -1.620177, 1, 0.3960784, 0, 1,
-1.517231, -0.7927253, -2.115066, 1, 0.4039216, 0, 1,
-1.516717, 0.5951674, -0.9508663, 1, 0.4078431, 0, 1,
-1.515502, 1.845545, -0.7901261, 1, 0.4156863, 0, 1,
-1.508284, 1.049666, -2.272467, 1, 0.4196078, 0, 1,
-1.496557, 0.7112234, -1.466883, 1, 0.427451, 0, 1,
-1.494064, 0.1666128, -1.387278, 1, 0.4313726, 0, 1,
-1.48641, -0.4018267, -1.279515, 1, 0.4392157, 0, 1,
-1.485318, 0.1710633, -2.982343, 1, 0.4431373, 0, 1,
-1.483673, 1.522365, -2.715829, 1, 0.4509804, 0, 1,
-1.483013, -0.180989, -0.9242787, 1, 0.454902, 0, 1,
-1.465173, 0.4111929, -0.3989502, 1, 0.4627451, 0, 1,
-1.455396, 0.5283098, -0.3941293, 1, 0.4666667, 0, 1,
-1.417655, -0.9472471, -3.011377, 1, 0.4745098, 0, 1,
-1.402196, 1.492817, -0.7022189, 1, 0.4784314, 0, 1,
-1.39303, -0.5433825, -4.083298, 1, 0.4862745, 0, 1,
-1.390176, -0.7201807, -1.471557, 1, 0.4901961, 0, 1,
-1.385061, -1.110242, -3.030272, 1, 0.4980392, 0, 1,
-1.378559, 0.1310737, -0.8947849, 1, 0.5058824, 0, 1,
-1.378316, 0.1139875, -0.3337765, 1, 0.509804, 0, 1,
-1.369402, 0.1224456, 0.2220163, 1, 0.5176471, 0, 1,
-1.363024, 0.4840291, -1.888304, 1, 0.5215687, 0, 1,
-1.352364, 0.03201731, -3.076095, 1, 0.5294118, 0, 1,
-1.347558, -1.230766, -1.884337, 1, 0.5333334, 0, 1,
-1.344314, -0.7102064, -1.833172, 1, 0.5411765, 0, 1,
-1.332936, 0.2429899, -1.849957, 1, 0.5450981, 0, 1,
-1.330116, 0.4837921, -3.415401, 1, 0.5529412, 0, 1,
-1.328148, -1.169123, -2.061741, 1, 0.5568628, 0, 1,
-1.322842, -1.620141, -2.498569, 1, 0.5647059, 0, 1,
-1.317802, -0.02295112, -1.175824, 1, 0.5686275, 0, 1,
-1.314535, 0.5399244, 0.7814214, 1, 0.5764706, 0, 1,
-1.308339, -0.4390442, -3.259677, 1, 0.5803922, 0, 1,
-1.307232, 0.7842512, -1.819334, 1, 0.5882353, 0, 1,
-1.303233, -0.5458226, -2.161469, 1, 0.5921569, 0, 1,
-1.30116, 0.4537231, -1.262514, 1, 0.6, 0, 1,
-1.299072, 0.1455313, -2.605981, 1, 0.6078432, 0, 1,
-1.297253, -0.2852217, -0.6042326, 1, 0.6117647, 0, 1,
-1.279254, -0.03552208, -0.8622966, 1, 0.6196079, 0, 1,
-1.267877, -2.383033, -1.850703, 1, 0.6235294, 0, 1,
-1.26207, -0.9741274, -2.348042, 1, 0.6313726, 0, 1,
-1.247376, -0.9355493, -0.446363, 1, 0.6352941, 0, 1,
-1.243359, 0.7742065, -1.037248, 1, 0.6431373, 0, 1,
-1.229903, -0.2809237, -2.344529, 1, 0.6470588, 0, 1,
-1.221542, 0.5961562, -2.278909, 1, 0.654902, 0, 1,
-1.216704, 0.0006796965, -1.702082, 1, 0.6588235, 0, 1,
-1.211722, -1.516193, -2.484989, 1, 0.6666667, 0, 1,
-1.208442, 0.07257053, 0.2868527, 1, 0.6705883, 0, 1,
-1.206056, -0.3051128, -2.739397, 1, 0.6784314, 0, 1,
-1.191993, 1.168588, -1.210661, 1, 0.682353, 0, 1,
-1.190679, 0.2394591, 1.089003, 1, 0.6901961, 0, 1,
-1.185533, 0.8198106, -0.1879815, 1, 0.6941177, 0, 1,
-1.175272, 2.244953, 0.1233964, 1, 0.7019608, 0, 1,
-1.167706, 0.1939683, -3.005641, 1, 0.7098039, 0, 1,
-1.160647, 0.1860397, -0.08925046, 1, 0.7137255, 0, 1,
-1.160393, 0.0508501, -0.4732694, 1, 0.7215686, 0, 1,
-1.156093, -1.532569, -2.228954, 1, 0.7254902, 0, 1,
-1.15316, 0.9478399, -0.6982743, 1, 0.7333333, 0, 1,
-1.148012, 2.044343, 0.6608151, 1, 0.7372549, 0, 1,
-1.143008, -1.937485, -0.7571439, 1, 0.7450981, 0, 1,
-1.142197, 0.8067222, -2.34839, 1, 0.7490196, 0, 1,
-1.13382, 0.4172606, -0.221412, 1, 0.7568628, 0, 1,
-1.121392, 0.1314637, -2.399873, 1, 0.7607843, 0, 1,
-1.117668, -1.219782, -0.7951801, 1, 0.7686275, 0, 1,
-1.117251, 1.665243, -1.279424, 1, 0.772549, 0, 1,
-1.116163, 1.374277, 0.8115827, 1, 0.7803922, 0, 1,
-1.115218, 1.013721, 0.06949931, 1, 0.7843137, 0, 1,
-1.112925, 0.03058776, -0.4609312, 1, 0.7921569, 0, 1,
-1.108077, 0.3142636, -1.963074, 1, 0.7960784, 0, 1,
-1.103123, 0.1349521, -2.055411, 1, 0.8039216, 0, 1,
-1.092545, 0.3232875, -2.356406, 1, 0.8117647, 0, 1,
-1.091879, -0.7469047, -1.511134, 1, 0.8156863, 0, 1,
-1.090121, -0.156585, -3.229063, 1, 0.8235294, 0, 1,
-1.089297, 1.033701, -1.815026, 1, 0.827451, 0, 1,
-1.084921, -0.08180627, -1.817042, 1, 0.8352941, 0, 1,
-1.082566, -0.3001135, -0.7746917, 1, 0.8392157, 0, 1,
-1.082475, 0.7588574, -1.095462, 1, 0.8470588, 0, 1,
-1.073437, -0.2893828, -2.653528, 1, 0.8509804, 0, 1,
-1.066635, 0.1036498, -3.43193, 1, 0.8588235, 0, 1,
-1.060802, -0.01804255, -3.070677, 1, 0.8627451, 0, 1,
-1.055622, -0.5470172, -1.934845, 1, 0.8705882, 0, 1,
-1.051807, 0.3529577, -0.408894, 1, 0.8745098, 0, 1,
-1.051357, 0.7801797, 0.3326107, 1, 0.8823529, 0, 1,
-1.046667, -0.5751832, -3.802873, 1, 0.8862745, 0, 1,
-1.04307, 1.616377, 1.310491, 1, 0.8941177, 0, 1,
-1.042536, 0.1249933, -1.670556, 1, 0.8980392, 0, 1,
-1.04177, 0.07401393, -2.980126, 1, 0.9058824, 0, 1,
-1.037546, -0.9527635, -2.42913, 1, 0.9137255, 0, 1,
-1.030246, 2.38355, -0.4570276, 1, 0.9176471, 0, 1,
-1.024229, -1.212778, -1.054086, 1, 0.9254902, 0, 1,
-1.022988, 0.1459791, -1.636927, 1, 0.9294118, 0, 1,
-1.006501, 0.7253541, -1.912724, 1, 0.9372549, 0, 1,
-1.004715, -0.2666465, -2.024507, 1, 0.9411765, 0, 1,
-0.9996773, 0.2629885, -0.3034884, 1, 0.9490196, 0, 1,
-0.9988482, 0.8237505, -2.884196, 1, 0.9529412, 0, 1,
-0.9915839, 0.9688066, -0.1019488, 1, 0.9607843, 0, 1,
-0.9780818, 0.6325218, -1.743309, 1, 0.9647059, 0, 1,
-0.9649665, 0.9106456, 0.1589691, 1, 0.972549, 0, 1,
-0.9559628, 1.007023, 0.6662865, 1, 0.9764706, 0, 1,
-0.9509075, 0.2439165, -1.574041, 1, 0.9843137, 0, 1,
-0.9488241, -0.8296112, -2.162235, 1, 0.9882353, 0, 1,
-0.9401342, -0.1253874, -2.44536, 1, 0.9960784, 0, 1,
-0.932955, -1.063341, -1.462903, 0.9960784, 1, 0, 1,
-0.930271, 0.4131413, 0.05118993, 0.9921569, 1, 0, 1,
-0.9274261, -0.5910647, 0.2226869, 0.9843137, 1, 0, 1,
-0.9181715, 1.233341, -2.357671, 0.9803922, 1, 0, 1,
-0.9180232, -0.5590663, -3.111529, 0.972549, 1, 0, 1,
-0.9171957, 1.221743, -0.5608679, 0.9686275, 1, 0, 1,
-0.9131867, -0.464733, -2.982808, 0.9607843, 1, 0, 1,
-0.9131177, 1.112448, -0.4286512, 0.9568627, 1, 0, 1,
-0.910058, -1.038543, -2.688579, 0.9490196, 1, 0, 1,
-0.9079562, -0.3917657, -3.342699, 0.945098, 1, 0, 1,
-0.9078917, -1.50951, -1.89062, 0.9372549, 1, 0, 1,
-0.9073268, -1.20563, -0.6048616, 0.9333333, 1, 0, 1,
-0.888138, 0.2326183, -1.841804, 0.9254902, 1, 0, 1,
-0.8877391, -0.2473606, -0.5879126, 0.9215686, 1, 0, 1,
-0.8869964, -0.2216032, -1.656758, 0.9137255, 1, 0, 1,
-0.8811585, -0.4100295, -3.238201, 0.9098039, 1, 0, 1,
-0.8785923, -1.994752, -3.820964, 0.9019608, 1, 0, 1,
-0.8763239, 0.2781647, -0.9253989, 0.8941177, 1, 0, 1,
-0.8693129, 0.616958, -0.4784473, 0.8901961, 1, 0, 1,
-0.867834, 1.197904, -1.856399, 0.8823529, 1, 0, 1,
-0.8532738, 0.5405108, -1.154468, 0.8784314, 1, 0, 1,
-0.8525468, -0.3521357, -2.468507, 0.8705882, 1, 0, 1,
-0.8522, -0.0195557, -2.863774, 0.8666667, 1, 0, 1,
-0.8499696, -1.364192, -2.868465, 0.8588235, 1, 0, 1,
-0.84528, -1.887659, -3.28966, 0.854902, 1, 0, 1,
-0.8406707, 1.382054, -0.248055, 0.8470588, 1, 0, 1,
-0.8398109, -0.07735353, -0.6453518, 0.8431373, 1, 0, 1,
-0.8384752, 0.1045956, -2.569056, 0.8352941, 1, 0, 1,
-0.8382175, -0.1757573, -1.120406, 0.8313726, 1, 0, 1,
-0.8377011, -1.18604, -1.741773, 0.8235294, 1, 0, 1,
-0.8320692, 1.203364, -0.3371035, 0.8196079, 1, 0, 1,
-0.8262643, -0.2693684, -2.221494, 0.8117647, 1, 0, 1,
-0.8255546, -0.7770724, -3.212578, 0.8078431, 1, 0, 1,
-0.8245089, -1.883757, -2.347312, 0.8, 1, 0, 1,
-0.8220531, 2.049193, -0.8540496, 0.7921569, 1, 0, 1,
-0.8091955, -2.115941, -2.085858, 0.7882353, 1, 0, 1,
-0.8091862, 0.4401675, -1.386441, 0.7803922, 1, 0, 1,
-0.8075853, 0.8732405, -1.142141, 0.7764706, 1, 0, 1,
-0.7931243, -0.5367405, -2.899475, 0.7686275, 1, 0, 1,
-0.7929499, 1.883755, -0.5565692, 0.7647059, 1, 0, 1,
-0.7908771, -0.9901117, -1.900702, 0.7568628, 1, 0, 1,
-0.7808731, 0.1849741, -1.503776, 0.7529412, 1, 0, 1,
-0.7752376, 1.413339, 0.4864927, 0.7450981, 1, 0, 1,
-0.7716845, -0.2675014, -1.409788, 0.7411765, 1, 0, 1,
-0.7696346, 0.5801237, -1.028443, 0.7333333, 1, 0, 1,
-0.7658759, -0.3075421, -1.355814, 0.7294118, 1, 0, 1,
-0.7631927, -0.2686373, -2.480042, 0.7215686, 1, 0, 1,
-0.7574506, 0.2703626, -3.012697, 0.7176471, 1, 0, 1,
-0.7549046, 0.7226771, -3.55144, 0.7098039, 1, 0, 1,
-0.7492889, 0.9243384, -1.296405, 0.7058824, 1, 0, 1,
-0.7483485, 0.5011809, -1.3426, 0.6980392, 1, 0, 1,
-0.7479281, -0.2647108, -0.8763521, 0.6901961, 1, 0, 1,
-0.7464246, -0.8630387, -2.385273, 0.6862745, 1, 0, 1,
-0.7375584, 1.287114, -1.200029, 0.6784314, 1, 0, 1,
-0.7301629, -0.01095087, -2.467734, 0.6745098, 1, 0, 1,
-0.7196966, -1.568957, -3.57654, 0.6666667, 1, 0, 1,
-0.7135665, -1.19029, -3.51141, 0.6627451, 1, 0, 1,
-0.7096323, -0.4931746, -2.051337, 0.654902, 1, 0, 1,
-0.7075092, 0.05349352, -2.211911, 0.6509804, 1, 0, 1,
-0.6883441, -0.9809941, -2.43886, 0.6431373, 1, 0, 1,
-0.6816697, -1.028745, -4.695161, 0.6392157, 1, 0, 1,
-0.6791154, -0.3294426, -3.040063, 0.6313726, 1, 0, 1,
-0.6760019, 1.751258, 0.5868768, 0.627451, 1, 0, 1,
-0.6728898, -0.07482009, -0.8532444, 0.6196079, 1, 0, 1,
-0.6709674, -1.842948, -2.87121, 0.6156863, 1, 0, 1,
-0.6673133, -1.615215, -4.304597, 0.6078432, 1, 0, 1,
-0.6636989, -0.8368281, -3.254718, 0.6039216, 1, 0, 1,
-0.6609883, -0.2712886, -2.427207, 0.5960785, 1, 0, 1,
-0.6598427, -0.1415813, -1.390757, 0.5882353, 1, 0, 1,
-0.6597589, 0.02514873, -0.316148, 0.5843138, 1, 0, 1,
-0.6596712, -0.3952187, -2.626153, 0.5764706, 1, 0, 1,
-0.6556987, 0.2207502, -1.733472, 0.572549, 1, 0, 1,
-0.649794, -0.1660597, -0.5773459, 0.5647059, 1, 0, 1,
-0.6467447, 0.744562, 0.4198306, 0.5607843, 1, 0, 1,
-0.6409316, 0.749985, -0.564467, 0.5529412, 1, 0, 1,
-0.6405403, -0.07901899, -2.695237, 0.5490196, 1, 0, 1,
-0.6399945, 0.5920874, -0.2041014, 0.5411765, 1, 0, 1,
-0.6376745, -1.471191, -3.619954, 0.5372549, 1, 0, 1,
-0.6334978, -0.09052456, -1.640645, 0.5294118, 1, 0, 1,
-0.6286654, 0.07839917, -2.543506, 0.5254902, 1, 0, 1,
-0.6247695, 0.01661346, -0.8886119, 0.5176471, 1, 0, 1,
-0.6244013, -0.6353078, -4.387872, 0.5137255, 1, 0, 1,
-0.6236531, 0.5158054, -0.6738092, 0.5058824, 1, 0, 1,
-0.6208091, -0.3651323, -2.434204, 0.5019608, 1, 0, 1,
-0.6191035, -0.173804, -0.5415395, 0.4941176, 1, 0, 1,
-0.6174915, 0.04550787, -1.526247, 0.4862745, 1, 0, 1,
-0.6118688, -0.521075, -0.8572824, 0.4823529, 1, 0, 1,
-0.605283, -0.3753363, -3.642178, 0.4745098, 1, 0, 1,
-0.5953443, 0.1861324, -3.68037, 0.4705882, 1, 0, 1,
-0.5944658, -0.0004619599, -1.897438, 0.4627451, 1, 0, 1,
-0.5882996, -0.1411341, -1.611724, 0.4588235, 1, 0, 1,
-0.583146, 2.0225, 0.04982825, 0.4509804, 1, 0, 1,
-0.5830737, 0.2304826, -2.802094, 0.4470588, 1, 0, 1,
-0.5820376, -0.3493952, -2.491872, 0.4392157, 1, 0, 1,
-0.5734556, -1.987668, -2.387996, 0.4352941, 1, 0, 1,
-0.5694355, 0.6232214, -0.8822065, 0.427451, 1, 0, 1,
-0.5678241, -0.3367048, 0.04424685, 0.4235294, 1, 0, 1,
-0.5673226, -1.189383, -3.110991, 0.4156863, 1, 0, 1,
-0.5659353, -1.772652, -2.599679, 0.4117647, 1, 0, 1,
-0.5657919, 0.5456982, -0.4623198, 0.4039216, 1, 0, 1,
-0.5646329, -1.500404, -0.4669917, 0.3960784, 1, 0, 1,
-0.5547439, 0.2492984, -0.1742998, 0.3921569, 1, 0, 1,
-0.54059, -0.4882397, -2.421645, 0.3843137, 1, 0, 1,
-0.5356877, 1.08313, -1.6176, 0.3803922, 1, 0, 1,
-0.5316477, -0.8802996, -3.230042, 0.372549, 1, 0, 1,
-0.5316336, 0.3559009, -1.795512, 0.3686275, 1, 0, 1,
-0.5251538, -0.8418472, -0.7995772, 0.3607843, 1, 0, 1,
-0.5120611, -2.039879, -2.769636, 0.3568628, 1, 0, 1,
-0.5095761, 1.826535, 1.480318, 0.3490196, 1, 0, 1,
-0.5000006, -0.5973721, -2.11771, 0.345098, 1, 0, 1,
-0.4987731, 0.2320959, -0.5843588, 0.3372549, 1, 0, 1,
-0.495398, 0.4428054, -0.7426088, 0.3333333, 1, 0, 1,
-0.49526, 1.190155, 0.8968805, 0.3254902, 1, 0, 1,
-0.491663, -1.378735, -3.848956, 0.3215686, 1, 0, 1,
-0.488273, -0.9801202, -2.958838, 0.3137255, 1, 0, 1,
-0.4861076, 1.176348, -0.7931551, 0.3098039, 1, 0, 1,
-0.4856078, -0.3819355, -3.685687, 0.3019608, 1, 0, 1,
-0.4816457, 0.1325056, -0.188896, 0.2941177, 1, 0, 1,
-0.479535, -0.740198, -1.061949, 0.2901961, 1, 0, 1,
-0.4782202, 1.836773, -0.9184621, 0.282353, 1, 0, 1,
-0.4752407, 0.8131118, -1.799958, 0.2784314, 1, 0, 1,
-0.4725017, 2.19704, 0.6881162, 0.2705882, 1, 0, 1,
-0.4714311, -1.075279, -3.833543, 0.2666667, 1, 0, 1,
-0.4713247, -0.4469095, -2.90434, 0.2588235, 1, 0, 1,
-0.4688825, 0.1047472, -3.178624, 0.254902, 1, 0, 1,
-0.4661342, 0.7839895, -1.086297, 0.2470588, 1, 0, 1,
-0.4647545, -0.1621825, -2.763864, 0.2431373, 1, 0, 1,
-0.4602015, -0.7908852, -2.694562, 0.2352941, 1, 0, 1,
-0.4552866, 1.337121, -0.2237636, 0.2313726, 1, 0, 1,
-0.4546816, -0.1662324, -1.265072, 0.2235294, 1, 0, 1,
-0.4542548, 1.856258, -0.8370435, 0.2196078, 1, 0, 1,
-0.453619, 0.8690495, -0.942761, 0.2117647, 1, 0, 1,
-0.4518591, 1.025904, -0.3577572, 0.2078431, 1, 0, 1,
-0.4465355, -0.1776522, -2.523099, 0.2, 1, 0, 1,
-0.441505, -0.4403619, -0.5668581, 0.1921569, 1, 0, 1,
-0.4400299, -1.114304, -4.355481, 0.1882353, 1, 0, 1,
-0.4360688, 0.3694384, -0.9761749, 0.1803922, 1, 0, 1,
-0.4343426, 0.6031547, -0.1029994, 0.1764706, 1, 0, 1,
-0.4341087, 0.2790115, -1.597847, 0.1686275, 1, 0, 1,
-0.433825, 0.4864487, -0.3822474, 0.1647059, 1, 0, 1,
-0.4335358, 0.8769082, 0.05119853, 0.1568628, 1, 0, 1,
-0.4334954, 0.6719698, -0.01660621, 0.1529412, 1, 0, 1,
-0.4316822, 1.069973, 0.02607446, 0.145098, 1, 0, 1,
-0.4305897, -0.116102, -2.344326, 0.1411765, 1, 0, 1,
-0.4295689, 0.7120169, -0.7222105, 0.1333333, 1, 0, 1,
-0.4237556, -2.112304, -3.53395, 0.1294118, 1, 0, 1,
-0.4226953, 0.8737459, 1.033048, 0.1215686, 1, 0, 1,
-0.4189561, -1.183274, -4.026711, 0.1176471, 1, 0, 1,
-0.418956, -0.3397951, -3.90993, 0.1098039, 1, 0, 1,
-0.4161598, -1.486551, -3.376672, 0.1058824, 1, 0, 1,
-0.4161525, 0.3891181, -1.376154, 0.09803922, 1, 0, 1,
-0.4139344, 0.4452836, -0.7417847, 0.09019608, 1, 0, 1,
-0.4109688, -1.135041, -2.453174, 0.08627451, 1, 0, 1,
-0.4076681, -0.7379684, -1.845266, 0.07843138, 1, 0, 1,
-0.4023625, -0.1271285, -0.5136708, 0.07450981, 1, 0, 1,
-0.399505, -1.160686, -4.019078, 0.06666667, 1, 0, 1,
-0.3977499, 0.5321022, -1.586157, 0.0627451, 1, 0, 1,
-0.3976396, -0.283746, -0.3277307, 0.05490196, 1, 0, 1,
-0.3911236, -0.1231574, -2.299574, 0.05098039, 1, 0, 1,
-0.3893771, -1.635879, -4.202494, 0.04313726, 1, 0, 1,
-0.386098, -0.1743796, -0.6358395, 0.03921569, 1, 0, 1,
-0.3853282, -0.6049142, -1.796482, 0.03137255, 1, 0, 1,
-0.3828068, 0.2973381, -2.393718, 0.02745098, 1, 0, 1,
-0.3759112, 0.2868313, -0.6569107, 0.01960784, 1, 0, 1,
-0.3752445, 0.07993968, -1.124428, 0.01568628, 1, 0, 1,
-0.3746322, -0.635027, -3.971743, 0.007843138, 1, 0, 1,
-0.3735424, 0.7883201, -1.583316, 0.003921569, 1, 0, 1,
-0.3732085, -1.34489, -3.087245, 0, 1, 0.003921569, 1,
-0.3709951, -1.6581, -4.075558, 0, 1, 0.01176471, 1,
-0.3705211, 1.718364, 0.3296255, 0, 1, 0.01568628, 1,
-0.3702789, -0.09386066, -2.300438, 0, 1, 0.02352941, 1,
-0.3694004, -0.8487724, -2.56522, 0, 1, 0.02745098, 1,
-0.3657071, 0.7929403, -2.372381, 0, 1, 0.03529412, 1,
-0.3643251, 0.7031624, 1.083289, 0, 1, 0.03921569, 1,
-0.3641232, 0.1530475, -0.4010758, 0, 1, 0.04705882, 1,
-0.3611763, -0.4120907, -0.8258952, 0, 1, 0.05098039, 1,
-0.3606262, 0.4410541, -0.1087281, 0, 1, 0.05882353, 1,
-0.3597952, 1.104749, -0.3411071, 0, 1, 0.0627451, 1,
-0.3576001, -1.629443, -3.82517, 0, 1, 0.07058824, 1,
-0.3536161, 2.353846, -0.9448454, 0, 1, 0.07450981, 1,
-0.3502451, 0.8412226, 0.7427868, 0, 1, 0.08235294, 1,
-0.3499015, 0.5730082, 0.1370107, 0, 1, 0.08627451, 1,
-0.345584, 0.01124655, -2.277194, 0, 1, 0.09411765, 1,
-0.3447826, -0.08005183, -1.906635, 0, 1, 0.1019608, 1,
-0.3445645, -0.3348292, -1.88071, 0, 1, 0.1058824, 1,
-0.3390011, -3.018432, -2.669201, 0, 1, 0.1137255, 1,
-0.3357231, 0.3703344, -1.606072, 0, 1, 0.1176471, 1,
-0.3343803, -4.001853, -3.111274, 0, 1, 0.1254902, 1,
-0.3324251, 0.8298008, -1.067166, 0, 1, 0.1294118, 1,
-0.3294722, 0.7846563, -0.7470611, 0, 1, 0.1372549, 1,
-0.3260993, -0.1241234, -3.781987, 0, 1, 0.1411765, 1,
-0.323945, 1.298857, -1.926935, 0, 1, 0.1490196, 1,
-0.3229661, 1.844686, 1.32249, 0, 1, 0.1529412, 1,
-0.3204254, -0.1772768, -1.582982, 0, 1, 0.1607843, 1,
-0.3198529, 1.387195, -0.4179719, 0, 1, 0.1647059, 1,
-0.3141207, -0.08851659, -1.921632, 0, 1, 0.172549, 1,
-0.3103012, 0.5878671, 0.0006459973, 0, 1, 0.1764706, 1,
-0.3077032, 0.4549208, -1.722715, 0, 1, 0.1843137, 1,
-0.3046781, -0.1299607, -3.165975, 0, 1, 0.1882353, 1,
-0.2955473, 0.5689827, 0.5410607, 0, 1, 0.1960784, 1,
-0.2942876, -0.4586066, -1.905714, 0, 1, 0.2039216, 1,
-0.293985, -1.758341, -1.534427, 0, 1, 0.2078431, 1,
-0.2870629, 0.162741, -0.7057268, 0, 1, 0.2156863, 1,
-0.2844599, 1.542609, -1.559686, 0, 1, 0.2196078, 1,
-0.2804539, 0.415084, -0.640551, 0, 1, 0.227451, 1,
-0.2777637, -0.8185065, -3.705011, 0, 1, 0.2313726, 1,
-0.2717511, -0.7512445, -3.809359, 0, 1, 0.2392157, 1,
-0.2715113, 0.2367108, 0.1099231, 0, 1, 0.2431373, 1,
-0.2705472, -1.508572, -3.995706, 0, 1, 0.2509804, 1,
-0.2688577, -1.257379, -3.524808, 0, 1, 0.254902, 1,
-0.2641453, 0.630702, 0.2192313, 0, 1, 0.2627451, 1,
-0.2638474, -0.8685119, -3.83248, 0, 1, 0.2666667, 1,
-0.2625552, -1.288885, -2.159769, 0, 1, 0.2745098, 1,
-0.260732, 0.7832506, -0.9795886, 0, 1, 0.2784314, 1,
-0.2580779, 0.2092768, -2.141387, 0, 1, 0.2862745, 1,
-0.25776, 1.361452, 0.7157462, 0, 1, 0.2901961, 1,
-0.2560643, -0.8615777, -3.194463, 0, 1, 0.2980392, 1,
-0.2557194, 1.231855, 0.6737245, 0, 1, 0.3058824, 1,
-0.2485853, 0.1560695, -1.575596, 0, 1, 0.3098039, 1,
-0.2484165, 0.736554, -0.6093157, 0, 1, 0.3176471, 1,
-0.2473326, -1.077746, -3.459642, 0, 1, 0.3215686, 1,
-0.2408444, -0.625528, -2.83112, 0, 1, 0.3294118, 1,
-0.2380638, 0.9101626, 0.1402429, 0, 1, 0.3333333, 1,
-0.2360187, 0.9749547, -2.715471, 0, 1, 0.3411765, 1,
-0.2354532, -0.2623557, -3.660688, 0, 1, 0.345098, 1,
-0.2346822, -0.7375669, -3.590304, 0, 1, 0.3529412, 1,
-0.2312393, -0.4229533, -3.170439, 0, 1, 0.3568628, 1,
-0.2282203, -0.7415692, -4.776966, 0, 1, 0.3647059, 1,
-0.2262546, -0.6439733, -4.67831, 0, 1, 0.3686275, 1,
-0.2229524, -0.8529843, -4.677046, 0, 1, 0.3764706, 1,
-0.2220791, -0.7314373, -4.633847, 0, 1, 0.3803922, 1,
-0.2216598, 0.426563, -0.123747, 0, 1, 0.3882353, 1,
-0.2196407, 0.807295, -0.7385944, 0, 1, 0.3921569, 1,
-0.2195531, -0.3146269, -2.854387, 0, 1, 0.4, 1,
-0.2194184, 0.3677199, 0.1421781, 0, 1, 0.4078431, 1,
-0.2174541, 0.2097076, -0.5731779, 0, 1, 0.4117647, 1,
-0.2137974, -0.7125743, -1.508015, 0, 1, 0.4196078, 1,
-0.2096166, -0.9317796, -2.681939, 0, 1, 0.4235294, 1,
-0.2056231, -1.462983, -0.9017938, 0, 1, 0.4313726, 1,
-0.1996157, -0.7747064, -3.493871, 0, 1, 0.4352941, 1,
-0.1980439, 1.079786, -0.4592767, 0, 1, 0.4431373, 1,
-0.196894, 0.6398526, -0.2261809, 0, 1, 0.4470588, 1,
-0.1931389, -0.7321361, -2.660067, 0, 1, 0.454902, 1,
-0.1923115, 0.4040001, 0.8743953, 0, 1, 0.4588235, 1,
-0.1904561, -0.5444574, -3.854323, 0, 1, 0.4666667, 1,
-0.1902156, 2.573673, 0.1791046, 0, 1, 0.4705882, 1,
-0.1842648, 0.2355215, -1.966163, 0, 1, 0.4784314, 1,
-0.1818106, 0.870436, -1.498255, 0, 1, 0.4823529, 1,
-0.1793041, -0.2085359, -3.914776, 0, 1, 0.4901961, 1,
-0.1778424, -0.5535291, -2.254555, 0, 1, 0.4941176, 1,
-0.1765328, 1.291415, -0.7284821, 0, 1, 0.5019608, 1,
-0.1743823, -0.7232657, -3.35025, 0, 1, 0.509804, 1,
-0.1726515, 0.1269048, 0.3121467, 0, 1, 0.5137255, 1,
-0.1698613, 0.9029428, 0.3484962, 0, 1, 0.5215687, 1,
-0.1618575, 0.3487704, 0.9233639, 0, 1, 0.5254902, 1,
-0.1604388, 0.1653511, -0.1434513, 0, 1, 0.5333334, 1,
-0.1591486, 1.12973, -1.262908, 0, 1, 0.5372549, 1,
-0.1587704, 0.09482132, -0.7935426, 0, 1, 0.5450981, 1,
-0.1566026, -2.373683, -3.928173, 0, 1, 0.5490196, 1,
-0.1560487, -0.5776801, -2.300137, 0, 1, 0.5568628, 1,
-0.1531292, -1.118308, -2.844336, 0, 1, 0.5607843, 1,
-0.1518147, -0.6419913, -3.645881, 0, 1, 0.5686275, 1,
-0.141588, -0.8405058, -0.9049754, 0, 1, 0.572549, 1,
-0.1376566, 0.5504117, -1.367384, 0, 1, 0.5803922, 1,
-0.131028, -0.4068194, -2.079526, 0, 1, 0.5843138, 1,
-0.1260087, 1.283009, -0.9182026, 0, 1, 0.5921569, 1,
-0.1234461, 0.5269901, 2.124221, 0, 1, 0.5960785, 1,
-0.1232014, -0.1914637, -2.770173, 0, 1, 0.6039216, 1,
-0.122804, -0.4381016, -2.894849, 0, 1, 0.6117647, 1,
-0.1199945, -0.6015384, -3.462903, 0, 1, 0.6156863, 1,
-0.119235, -1.268196, -3.05842, 0, 1, 0.6235294, 1,
-0.1187641, -0.6222543, -2.318976, 0, 1, 0.627451, 1,
-0.1142301, 0.6624649, 0.5600545, 0, 1, 0.6352941, 1,
-0.1129802, -0.5182112, -3.14179, 0, 1, 0.6392157, 1,
-0.1068133, -0.1535617, -2.285735, 0, 1, 0.6470588, 1,
-0.1034681, -0.6102019, -3.411176, 0, 1, 0.6509804, 1,
-0.09676349, -1.864891, -1.795952, 0, 1, 0.6588235, 1,
-0.09154309, -2.186274, -2.356801, 0, 1, 0.6627451, 1,
-0.09085897, -0.6735394, -3.29878, 0, 1, 0.6705883, 1,
-0.08910767, -0.2990752, -3.989565, 0, 1, 0.6745098, 1,
-0.08606747, -0.7527242, -2.720393, 0, 1, 0.682353, 1,
-0.08494052, -0.2049649, -3.779425, 0, 1, 0.6862745, 1,
-0.08385018, 0.3878864, 0.6494286, 0, 1, 0.6941177, 1,
-0.08003834, -1.327437, -3.050331, 0, 1, 0.7019608, 1,
-0.0782717, -1.790527, -3.417241, 0, 1, 0.7058824, 1,
-0.07409171, -0.5675214, -3.655795, 0, 1, 0.7137255, 1,
-0.0723397, 0.7396678, 1.111312, 0, 1, 0.7176471, 1,
-0.07186039, -1.279015, -2.586799, 0, 1, 0.7254902, 1,
-0.07082697, -0.1419216, -0.8265455, 0, 1, 0.7294118, 1,
-0.06978247, -1.357149, -3.288025, 0, 1, 0.7372549, 1,
-0.05694363, -0.3562427, -3.631531, 0, 1, 0.7411765, 1,
-0.05609632, -0.7681825, -3.014057, 0, 1, 0.7490196, 1,
-0.05170517, 1.080759, 2.224442, 0, 1, 0.7529412, 1,
-0.04584857, 0.3213108, -1.744607, 0, 1, 0.7607843, 1,
-0.04470181, 1.553429, -0.8705865, 0, 1, 0.7647059, 1,
-0.04224532, -0.06046603, -3.049342, 0, 1, 0.772549, 1,
-0.04104422, 0.9991428, 1.079067, 0, 1, 0.7764706, 1,
-0.04020218, 0.3085332, -0.6684985, 0, 1, 0.7843137, 1,
-0.03898481, 0.6634935, -0.8118785, 0, 1, 0.7882353, 1,
-0.03796818, -1.107506, 0.02797122, 0, 1, 0.7960784, 1,
-0.03415455, 0.2013331, -1.43447, 0, 1, 0.8039216, 1,
-0.03344752, -0.6571751, -3.906939, 0, 1, 0.8078431, 1,
-0.03294715, 1.359756, 1.535798, 0, 1, 0.8156863, 1,
-0.03280873, 1.624367, -0.1727532, 0, 1, 0.8196079, 1,
-0.03267748, 0.04618793, -1.611159, 0, 1, 0.827451, 1,
-0.0281542, 1.091717, 0.4313061, 0, 1, 0.8313726, 1,
-0.02145244, 0.03330595, -0.7651521, 0, 1, 0.8392157, 1,
-0.02110327, -0.8243202, -2.903744, 0, 1, 0.8431373, 1,
-0.01250383, -0.2699326, -3.047227, 0, 1, 0.8509804, 1,
-0.008095893, 0.455695, 0.758521, 0, 1, 0.854902, 1,
-0.006991483, -0.5216338, -5.041874, 0, 1, 0.8627451, 1,
-0.006126254, 0.2897915, -1.802792, 0, 1, 0.8666667, 1,
-0.00371015, 1.861785, 0.83061, 0, 1, 0.8745098, 1,
-0.002940602, 1.08555, 0.4795055, 0, 1, 0.8784314, 1,
-0.001245011, -1.648619, -5.215637, 0, 1, 0.8862745, 1,
-0.000915106, 1.317512, 1.237726, 0, 1, 0.8901961, 1,
-0.0006672444, -1.187067, -3.089527, 0, 1, 0.8980392, 1,
0.002048241, -0.7448176, 3.346754, 0, 1, 0.9058824, 1,
0.002832819, 0.6458582, -0.3285185, 0, 1, 0.9098039, 1,
0.003817139, 0.004747204, 0.1853717, 0, 1, 0.9176471, 1,
0.004048191, 0.6548228, -1.094915, 0, 1, 0.9215686, 1,
0.006201273, 1.655082, 2.822599, 0, 1, 0.9294118, 1,
0.006794683, -0.1523709, 3.504433, 0, 1, 0.9333333, 1,
0.008172587, -0.8919739, 3.302364, 0, 1, 0.9411765, 1,
0.01025207, -0.6322695, 3.503553, 0, 1, 0.945098, 1,
0.01097284, 0.9595773, -0.836121, 0, 1, 0.9529412, 1,
0.01278493, -0.01139565, 2.587181, 0, 1, 0.9568627, 1,
0.01446794, 0.005535344, 1.02471, 0, 1, 0.9647059, 1,
0.01567463, 0.8782627, 0.8305964, 0, 1, 0.9686275, 1,
0.01620005, 0.6541219, -0.9617855, 0, 1, 0.9764706, 1,
0.01795575, -0.4072089, 3.147962, 0, 1, 0.9803922, 1,
0.02321152, -3.203995, 2.345275, 0, 1, 0.9882353, 1,
0.02497113, 0.3671198, -0.7110653, 0, 1, 0.9921569, 1,
0.02811827, -0.8375244, 3.775637, 0, 1, 1, 1,
0.02929689, 1.021006, -1.050904, 0, 0.9921569, 1, 1,
0.03034616, -1.04703, 2.107072, 0, 0.9882353, 1, 1,
0.03239124, 1.173801, 0.6645404, 0, 0.9803922, 1, 1,
0.03481369, -1.949478, 3.778276, 0, 0.9764706, 1, 1,
0.03483555, -0.6252105, 3.334533, 0, 0.9686275, 1, 1,
0.03503603, 0.9911321, 0.8852574, 0, 0.9647059, 1, 1,
0.03646066, -0.7658172, 3.64796, 0, 0.9568627, 1, 1,
0.03676744, -0.1629569, 3.158371, 0, 0.9529412, 1, 1,
0.0371694, 0.3190198, 1.009438, 0, 0.945098, 1, 1,
0.03773478, -1.942259, 3.136056, 0, 0.9411765, 1, 1,
0.0404142, -0.1227292, 2.878004, 0, 0.9333333, 1, 1,
0.04643313, -0.1744145, 3.892436, 0, 0.9294118, 1, 1,
0.0473622, -0.01305842, 2.12858, 0, 0.9215686, 1, 1,
0.04828639, 0.07108051, 1.110764, 0, 0.9176471, 1, 1,
0.04951226, 0.2459421, -1.674495, 0, 0.9098039, 1, 1,
0.05193397, 1.016229, 1.619018, 0, 0.9058824, 1, 1,
0.05762424, 0.2217201, -0.7948112, 0, 0.8980392, 1, 1,
0.05935827, -0.28747, 4.998722, 0, 0.8901961, 1, 1,
0.05967634, 0.8508688, 0.206214, 0, 0.8862745, 1, 1,
0.06179344, 1.094839, 1.870611, 0, 0.8784314, 1, 1,
0.06493659, -0.8283039, 3.430636, 0, 0.8745098, 1, 1,
0.0666252, 0.4650184, -1.683243, 0, 0.8666667, 1, 1,
0.07303127, 0.453183, 1.107525, 0, 0.8627451, 1, 1,
0.07443546, -2.798829, 2.536938, 0, 0.854902, 1, 1,
0.07881631, 0.006957668, 1.998349, 0, 0.8509804, 1, 1,
0.07955012, 0.1511198, -0.7659892, 0, 0.8431373, 1, 1,
0.0860817, -0.430749, 4.196633, 0, 0.8392157, 1, 1,
0.08822875, 0.7862266, 0.3884672, 0, 0.8313726, 1, 1,
0.09813409, -0.3925577, 3.501108, 0, 0.827451, 1, 1,
0.105149, -1.110878, 3.058091, 0, 0.8196079, 1, 1,
0.1092283, -0.8060941, 2.560835, 0, 0.8156863, 1, 1,
0.1113134, -0.9456024, 1.179877, 0, 0.8078431, 1, 1,
0.1113767, -0.4276897, 4.64914, 0, 0.8039216, 1, 1,
0.1154358, -0.6225829, 3.267174, 0, 0.7960784, 1, 1,
0.1164218, 0.5340565, 0.8072107, 0, 0.7882353, 1, 1,
0.1169463, 0.2572421, -0.1696928, 0, 0.7843137, 1, 1,
0.1249509, 1.380574, 0.7299926, 0, 0.7764706, 1, 1,
0.1267262, 1.285835, 2.739803, 0, 0.772549, 1, 1,
0.1285117, -0.9794074, 2.892309, 0, 0.7647059, 1, 1,
0.1307253, -0.3517155, 3.478798, 0, 0.7607843, 1, 1,
0.1312135, 0.6580002, 1.747628, 0, 0.7529412, 1, 1,
0.132207, -0.7615471, 2.008028, 0, 0.7490196, 1, 1,
0.1337645, 1.14083, 0.7425881, 0, 0.7411765, 1, 1,
0.1344049, -0.6792101, 3.629128, 0, 0.7372549, 1, 1,
0.1374495, 0.6741797, 1.257399, 0, 0.7294118, 1, 1,
0.1393792, -0.3797749, 2.891152, 0, 0.7254902, 1, 1,
0.1407064, -0.5059299, -0.1933165, 0, 0.7176471, 1, 1,
0.1473159, -0.9122615, 3.658762, 0, 0.7137255, 1, 1,
0.1504748, 0.1783236, 2.250206, 0, 0.7058824, 1, 1,
0.1528705, 0.3363554, -0.8023984, 0, 0.6980392, 1, 1,
0.1531144, -0.8688608, 2.231165, 0, 0.6941177, 1, 1,
0.155939, 1.71439, -0.3738957, 0, 0.6862745, 1, 1,
0.1574961, -1.816325, 3.888462, 0, 0.682353, 1, 1,
0.1617442, 1.200917, -0.02053325, 0, 0.6745098, 1, 1,
0.1634088, -0.7905562, 2.497273, 0, 0.6705883, 1, 1,
0.1641974, -1.306866, 2.366251, 0, 0.6627451, 1, 1,
0.1716902, -0.7403068, 4.337457, 0, 0.6588235, 1, 1,
0.1766211, -1.135615, 1.919635, 0, 0.6509804, 1, 1,
0.1840978, -0.03566986, 0.6436108, 0, 0.6470588, 1, 1,
0.1842699, 0.4468837, 1.012841, 0, 0.6392157, 1, 1,
0.1857283, -0.2360942, 1.853294, 0, 0.6352941, 1, 1,
0.1869831, 0.8366247, 1.235629, 0, 0.627451, 1, 1,
0.1891429, 0.9441725, 0.0004285094, 0, 0.6235294, 1, 1,
0.1933517, 0.03017264, 0.9851087, 0, 0.6156863, 1, 1,
0.1944961, 0.04633268, 0.1412259, 0, 0.6117647, 1, 1,
0.2019258, 1.794752, 1.358921, 0, 0.6039216, 1, 1,
0.2133916, -0.6192803, 4.246126, 0, 0.5960785, 1, 1,
0.2166074, 0.401065, 0.6235721, 0, 0.5921569, 1, 1,
0.2166837, -0.4500409, 2.214513, 0, 0.5843138, 1, 1,
0.2167237, -0.44606, 3.457593, 0, 0.5803922, 1, 1,
0.2169035, 0.4959578, 0.1483325, 0, 0.572549, 1, 1,
0.2202023, -0.6323229, 2.263224, 0, 0.5686275, 1, 1,
0.2231239, -0.6398601, 2.545052, 0, 0.5607843, 1, 1,
0.224334, 1.136802, 0.6302798, 0, 0.5568628, 1, 1,
0.2294107, 0.7497537, -0.03431591, 0, 0.5490196, 1, 1,
0.2311531, -0.5378948, 2.644219, 0, 0.5450981, 1, 1,
0.2316866, 0.05178991, 1.698189, 0, 0.5372549, 1, 1,
0.2324795, 0.5858541, 1.839048, 0, 0.5333334, 1, 1,
0.2341628, -0.5827587, 2.660475, 0, 0.5254902, 1, 1,
0.2348797, 0.408628, 2.101128, 0, 0.5215687, 1, 1,
0.2359127, 0.767987, 0.0360174, 0, 0.5137255, 1, 1,
0.2372192, 0.5417717, 0.424977, 0, 0.509804, 1, 1,
0.2422195, 1.767896, 0.7109948, 0, 0.5019608, 1, 1,
0.2437297, 0.9959224, 0.7829965, 0, 0.4941176, 1, 1,
0.2450669, 1.422201, 0.1938968, 0, 0.4901961, 1, 1,
0.246249, -1.019962, 3.513865, 0, 0.4823529, 1, 1,
0.246846, 1.010264, 0.9717962, 0, 0.4784314, 1, 1,
0.2468813, -0.4164192, 2.182269, 0, 0.4705882, 1, 1,
0.2550964, -0.9889262, 2.501197, 0, 0.4666667, 1, 1,
0.2586576, 0.06138026, 0.3719087, 0, 0.4588235, 1, 1,
0.2617772, 0.7523722, -0.2819691, 0, 0.454902, 1, 1,
0.2621255, -0.6820743, 3.665334, 0, 0.4470588, 1, 1,
0.2623372, -1.240003, 2.666143, 0, 0.4431373, 1, 1,
0.262986, 0.4782247, -0.09521321, 0, 0.4352941, 1, 1,
0.2636409, -0.5112981, 3.842933, 0, 0.4313726, 1, 1,
0.2653694, -2.184097, 1.92885, 0, 0.4235294, 1, 1,
0.2678467, 0.1243271, 1.029041, 0, 0.4196078, 1, 1,
0.2844903, -0.4404506, 2.454478, 0, 0.4117647, 1, 1,
0.2850169, 0.8518093, 0.1243536, 0, 0.4078431, 1, 1,
0.2860054, 1.574939, 0.3377857, 0, 0.4, 1, 1,
0.287147, -1.002889, 2.87138, 0, 0.3921569, 1, 1,
0.2875993, 1.864465, -0.5579464, 0, 0.3882353, 1, 1,
0.2882989, 0.001950323, 3.917725, 0, 0.3803922, 1, 1,
0.2910251, -0.5084816, 1.396482, 0, 0.3764706, 1, 1,
0.2946456, -0.1988411, 1.572391, 0, 0.3686275, 1, 1,
0.294808, -0.5896674, 3.319754, 0, 0.3647059, 1, 1,
0.2950564, 0.2582648, 0.9152008, 0, 0.3568628, 1, 1,
0.3016953, -0.4801555, 1.4472, 0, 0.3529412, 1, 1,
0.3026966, -0.7447997, 1.103104, 0, 0.345098, 1, 1,
0.3056371, 0.2600278, 0.8257406, 0, 0.3411765, 1, 1,
0.3057462, -0.7677472, 3.218682, 0, 0.3333333, 1, 1,
0.3120849, -1.777947, 2.336287, 0, 0.3294118, 1, 1,
0.316556, -0.353582, 1.816163, 0, 0.3215686, 1, 1,
0.3185505, 0.4130012, 1.416728, 0, 0.3176471, 1, 1,
0.3193197, 1.462663, 2.517246, 0, 0.3098039, 1, 1,
0.3222356, -1.40006, 1.399321, 0, 0.3058824, 1, 1,
0.3232382, -0.2750843, 3.489635, 0, 0.2980392, 1, 1,
0.3245546, 0.6638926, 1.114057, 0, 0.2901961, 1, 1,
0.3269572, 0.4059188, 2.071019, 0, 0.2862745, 1, 1,
0.3280548, -1.427805, 2.814687, 0, 0.2784314, 1, 1,
0.3291208, 0.6343536, -0.7571667, 0, 0.2745098, 1, 1,
0.3299914, -0.2927152, 1.482839, 0, 0.2666667, 1, 1,
0.3307158, -2.027297, 4.141131, 0, 0.2627451, 1, 1,
0.3334334, 2.047845, -0.1213696, 0, 0.254902, 1, 1,
0.334143, -0.4518521, 3.059116, 0, 0.2509804, 1, 1,
0.335141, -0.9637351, 1.948909, 0, 0.2431373, 1, 1,
0.3352914, -0.7467366, 0.7218908, 0, 0.2392157, 1, 1,
0.3489286, -1.616941, 2.917084, 0, 0.2313726, 1, 1,
0.353602, 0.2782829, 1.41644, 0, 0.227451, 1, 1,
0.3536429, 0.3443298, 0.3609721, 0, 0.2196078, 1, 1,
0.3547653, 0.6029462, -0.03549725, 0, 0.2156863, 1, 1,
0.3579763, 1.358885, 0.802246, 0, 0.2078431, 1, 1,
0.3627512, 3.231627, -1.428957, 0, 0.2039216, 1, 1,
0.3650933, 0.7609885, -0.5781186, 0, 0.1960784, 1, 1,
0.3652471, -0.5498443, 1.375002, 0, 0.1882353, 1, 1,
0.3669661, 0.2198424, 0.9773535, 0, 0.1843137, 1, 1,
0.3669943, 1.262854, 0.9905167, 0, 0.1764706, 1, 1,
0.3673839, 0.5540484, 0.4852299, 0, 0.172549, 1, 1,
0.3711041, -1.037042, 3.156532, 0, 0.1647059, 1, 1,
0.371474, 0.8419236, 0.1745123, 0, 0.1607843, 1, 1,
0.3752729, -0.4229043, 1.916248, 0, 0.1529412, 1, 1,
0.3753905, 1.035398, -0.2688281, 0, 0.1490196, 1, 1,
0.3761063, 0.7897356, 1.235285, 0, 0.1411765, 1, 1,
0.376795, 2.825293, -0.4885077, 0, 0.1372549, 1, 1,
0.3780289, -0.3916282, 3.781627, 0, 0.1294118, 1, 1,
0.3780752, 0.6743721, -0.1791098, 0, 0.1254902, 1, 1,
0.3784727, 0.7300004, 0.2159381, 0, 0.1176471, 1, 1,
0.3789819, 0.3490277, 1.803654, 0, 0.1137255, 1, 1,
0.3832327, 0.5575815, 0.2977558, 0, 0.1058824, 1, 1,
0.3876874, 1.084859, 0.1906434, 0, 0.09803922, 1, 1,
0.3880306, -0.5657639, 2.171536, 0, 0.09411765, 1, 1,
0.3889664, -0.3287045, 0.5038115, 0, 0.08627451, 1, 1,
0.3941935, -0.2226285, 1.679592, 0, 0.08235294, 1, 1,
0.3945943, 0.2801475, 1.641685, 0, 0.07450981, 1, 1,
0.4055139, 0.0117168, 1.531991, 0, 0.07058824, 1, 1,
0.4061427, 1.004023, -0.3490633, 0, 0.0627451, 1, 1,
0.4066649, 0.196593, 2.652726, 0, 0.05882353, 1, 1,
0.4068903, 0.1952081, 0.4380165, 0, 0.05098039, 1, 1,
0.4072213, 1.037395, 0.4948065, 0, 0.04705882, 1, 1,
0.4104899, 0.4313672, 0.5742754, 0, 0.03921569, 1, 1,
0.4114097, 0.1518656, 0.9581685, 0, 0.03529412, 1, 1,
0.4129178, -0.05203118, 0.07943806, 0, 0.02745098, 1, 1,
0.4130645, 0.6324859, 1.702101, 0, 0.02352941, 1, 1,
0.414502, -0.3687591, 3.382809, 0, 0.01568628, 1, 1,
0.4201262, -0.6829969, 1.310069, 0, 0.01176471, 1, 1,
0.4221427, 0.4260148, 0.959228, 0, 0.003921569, 1, 1,
0.4242571, 0.6046894, 2.814065, 0.003921569, 0, 1, 1,
0.4293911, 1.89261, -0.7489785, 0.007843138, 0, 1, 1,
0.4349841, 0.07723373, 1.144153, 0.01568628, 0, 1, 1,
0.4404405, 0.7493846, -0.09396637, 0.01960784, 0, 1, 1,
0.4427571, 2.505468, 1.038882, 0.02745098, 0, 1, 1,
0.4427947, 1.300144, 1.826549, 0.03137255, 0, 1, 1,
0.4453275, 1.162857, 0.6581375, 0.03921569, 0, 1, 1,
0.4471032, -0.1399451, 1.510699, 0.04313726, 0, 1, 1,
0.4486341, -0.9638669, 1.632329, 0.05098039, 0, 1, 1,
0.4506327, -0.9773211, 2.413301, 0.05490196, 0, 1, 1,
0.4512199, -2.568495, 3.115529, 0.0627451, 0, 1, 1,
0.4572043, -1.412019, 3.625276, 0.06666667, 0, 1, 1,
0.4613075, -2.005733, 1.766929, 0.07450981, 0, 1, 1,
0.4629486, -0.4993871, 1.775497, 0.07843138, 0, 1, 1,
0.463446, -1.66095, 3.32692, 0.08627451, 0, 1, 1,
0.4663227, -0.7016842, 2.274035, 0.09019608, 0, 1, 1,
0.4708128, 1.503871, 1.405946, 0.09803922, 0, 1, 1,
0.4712314, -0.135747, 0.04162802, 0.1058824, 0, 1, 1,
0.4811026, -0.4481883, 2.621067, 0.1098039, 0, 1, 1,
0.484266, 1.014066, -0.3925393, 0.1176471, 0, 1, 1,
0.4845169, -0.8085554, 1.960912, 0.1215686, 0, 1, 1,
0.486462, -1.209556, 3.048354, 0.1294118, 0, 1, 1,
0.487582, 1.436304, 0.2174062, 0.1333333, 0, 1, 1,
0.4913445, -0.6544632, 1.405707, 0.1411765, 0, 1, 1,
0.4929841, -1.323136, 1.904929, 0.145098, 0, 1, 1,
0.4935369, -2.340322, 2.883297, 0.1529412, 0, 1, 1,
0.4958877, -1.382299, 2.158561, 0.1568628, 0, 1, 1,
0.4993128, -1.063931, 3.977598, 0.1647059, 0, 1, 1,
0.5006791, -0.8629885, 3.083413, 0.1686275, 0, 1, 1,
0.5086328, -0.06162652, 2.960753, 0.1764706, 0, 1, 1,
0.5091383, -0.3630711, 3.396129, 0.1803922, 0, 1, 1,
0.5108557, -0.889341, 3.950775, 0.1882353, 0, 1, 1,
0.516901, 0.4431245, 0.6892849, 0.1921569, 0, 1, 1,
0.5170903, 0.2078627, 2.194486, 0.2, 0, 1, 1,
0.5182878, 2.567438, 0.3915696, 0.2078431, 0, 1, 1,
0.5184053, -0.1741742, 1.253424, 0.2117647, 0, 1, 1,
0.5216457, -1.592234, 3.516155, 0.2196078, 0, 1, 1,
0.5220641, 0.7531372, 0.1392933, 0.2235294, 0, 1, 1,
0.5226633, -1.128202, 3.993624, 0.2313726, 0, 1, 1,
0.5279557, -0.02450348, -0.2340595, 0.2352941, 0, 1, 1,
0.5355563, -1.513556, 2.168337, 0.2431373, 0, 1, 1,
0.5400204, -0.9645633, 2.976275, 0.2470588, 0, 1, 1,
0.5419667, 0.4547088, -0.9899809, 0.254902, 0, 1, 1,
0.5427438, -0.5417967, 2.450608, 0.2588235, 0, 1, 1,
0.5447833, 0.9890445, 1.15364, 0.2666667, 0, 1, 1,
0.5473675, -0.9501542, 3.790545, 0.2705882, 0, 1, 1,
0.5570827, 1.564085, 0.1161245, 0.2784314, 0, 1, 1,
0.5574564, -0.9998135, 1.644176, 0.282353, 0, 1, 1,
0.5594078, -0.0465872, 1.040404, 0.2901961, 0, 1, 1,
0.5622973, -1.03159, 1.267096, 0.2941177, 0, 1, 1,
0.5632177, -0.05475987, 0.88289, 0.3019608, 0, 1, 1,
0.5647124, -1.633167, 1.160254, 0.3098039, 0, 1, 1,
0.565753, 1.98652, 2.163702, 0.3137255, 0, 1, 1,
0.5744516, -1.925867, 4.124151, 0.3215686, 0, 1, 1,
0.580069, 0.3507205, 0.4503954, 0.3254902, 0, 1, 1,
0.5903226, -0.4266721, 1.947606, 0.3333333, 0, 1, 1,
0.5933416, 1.114032, 1.136601, 0.3372549, 0, 1, 1,
0.595318, 0.397487, 1.264041, 0.345098, 0, 1, 1,
0.5988242, -1.395575, 4.452825, 0.3490196, 0, 1, 1,
0.6024309, 0.3481982, -1.066449, 0.3568628, 0, 1, 1,
0.6048724, 0.8448492, -0.5415158, 0.3607843, 0, 1, 1,
0.6081444, 0.898726, 1.202134, 0.3686275, 0, 1, 1,
0.6137984, -0.8237202, 2.99895, 0.372549, 0, 1, 1,
0.617519, 1.49653, -1.202815, 0.3803922, 0, 1, 1,
0.6179621, -0.6478215, 0.6497653, 0.3843137, 0, 1, 1,
0.6204649, 0.7125949, -0.07915121, 0.3921569, 0, 1, 1,
0.6263615, 1.744542, 0.3855162, 0.3960784, 0, 1, 1,
0.6267654, 3.304077, 0.2276356, 0.4039216, 0, 1, 1,
0.6280174, 0.2438089, 2.370693, 0.4117647, 0, 1, 1,
0.6321152, -1.401426, 3.427587, 0.4156863, 0, 1, 1,
0.634535, -0.1045727, 3.935557, 0.4235294, 0, 1, 1,
0.635158, 0.2918289, -0.02989369, 0.427451, 0, 1, 1,
0.6368145, -0.8695243, 0.5827805, 0.4352941, 0, 1, 1,
0.6426798, -1.292698, 2.788314, 0.4392157, 0, 1, 1,
0.6433938, 0.8147056, 1.724174, 0.4470588, 0, 1, 1,
0.6473609, -0.221484, 0.9573986, 0.4509804, 0, 1, 1,
0.6483099, -2.142937, 2.855616, 0.4588235, 0, 1, 1,
0.6516551, 0.3713564, 2.013562, 0.4627451, 0, 1, 1,
0.6554334, -1.782173, 2.728936, 0.4705882, 0, 1, 1,
0.6606382, 0.3861102, 1.543897, 0.4745098, 0, 1, 1,
0.6636686, 0.3184814, 0.1037709, 0.4823529, 0, 1, 1,
0.6709773, -0.05030171, 0.627738, 0.4862745, 0, 1, 1,
0.6807718, -0.1442117, 0.9055112, 0.4941176, 0, 1, 1,
0.6817319, -0.6053041, 3.733664, 0.5019608, 0, 1, 1,
0.6830411, 0.4773623, 0.5530726, 0.5058824, 0, 1, 1,
0.6833503, -0.9999319, 1.614648, 0.5137255, 0, 1, 1,
0.6871595, 0.5751886, 2.257828, 0.5176471, 0, 1, 1,
0.6883987, 0.9713306, -0.2375311, 0.5254902, 0, 1, 1,
0.6892903, -0.1273979, 1.622062, 0.5294118, 0, 1, 1,
0.6893845, -0.8169436, 3.561507, 0.5372549, 0, 1, 1,
0.6910716, -0.7573767, 3.375138, 0.5411765, 0, 1, 1,
0.6912128, 0.6715559, 0.6819121, 0.5490196, 0, 1, 1,
0.6912186, -0.3849165, 1.66803, 0.5529412, 0, 1, 1,
0.6916167, 0.3843176, 2.033727, 0.5607843, 0, 1, 1,
0.6938784, -0.6637449, 2.192108, 0.5647059, 0, 1, 1,
0.6955941, 0.3717566, 0.3388868, 0.572549, 0, 1, 1,
0.7066479, 0.7501942, 0.5333332, 0.5764706, 0, 1, 1,
0.7072902, -0.477531, 2.859329, 0.5843138, 0, 1, 1,
0.7137762, 0.7455035, 0.3573983, 0.5882353, 0, 1, 1,
0.7158825, 1.578498, -0.4723963, 0.5960785, 0, 1, 1,
0.7192038, 0.1423134, 1.216567, 0.6039216, 0, 1, 1,
0.7195092, 2.120577, 0.9278474, 0.6078432, 0, 1, 1,
0.7275215, -1.529751, 5.465536, 0.6156863, 0, 1, 1,
0.7287735, -1.455194, 1.973794, 0.6196079, 0, 1, 1,
0.7349172, 0.7379655, 1.261978, 0.627451, 0, 1, 1,
0.7375955, 2.376523, 0.3611595, 0.6313726, 0, 1, 1,
0.7449878, -2.045361, 1.336357, 0.6392157, 0, 1, 1,
0.749914, 0.2992824, 2.763244, 0.6431373, 0, 1, 1,
0.7506022, -1.083142, 1.507174, 0.6509804, 0, 1, 1,
0.7550206, 0.3751029, 1.90545, 0.654902, 0, 1, 1,
0.7566824, 0.4796281, -0.751336, 0.6627451, 0, 1, 1,
0.7591119, 0.4208413, 1.550663, 0.6666667, 0, 1, 1,
0.7616698, -1.254624, 2.346353, 0.6745098, 0, 1, 1,
0.7662987, -1.216392, 0.5997976, 0.6784314, 0, 1, 1,
0.7727581, 1.16951, 0.2193239, 0.6862745, 0, 1, 1,
0.7855228, 0.714542, -0.3283916, 0.6901961, 0, 1, 1,
0.788298, -0.488161, 1.184572, 0.6980392, 0, 1, 1,
0.7895264, -0.3132605, 1.315814, 0.7058824, 0, 1, 1,
0.7899062, 0.1333273, 1.1679, 0.7098039, 0, 1, 1,
0.7915872, 0.3906837, 2.679854, 0.7176471, 0, 1, 1,
0.7995418, -0.7237271, 1.731401, 0.7215686, 0, 1, 1,
0.804352, 0.8106509, 1.781042, 0.7294118, 0, 1, 1,
0.8063138, 0.315057, 4.019232, 0.7333333, 0, 1, 1,
0.8128902, -0.5129594, 3.151294, 0.7411765, 0, 1, 1,
0.8145161, -0.3475475, 1.732098, 0.7450981, 0, 1, 1,
0.8149497, 1.12058, 1.361966, 0.7529412, 0, 1, 1,
0.8223105, -0.1961848, 2.729059, 0.7568628, 0, 1, 1,
0.8260008, 0.1564651, 2.340491, 0.7647059, 0, 1, 1,
0.8295386, -0.2856904, 1.606937, 0.7686275, 0, 1, 1,
0.8312427, 0.3856129, 2.206821, 0.7764706, 0, 1, 1,
0.8360808, -0.6996148, 2.222978, 0.7803922, 0, 1, 1,
0.8372703, 0.1817703, 2.232903, 0.7882353, 0, 1, 1,
0.837446, 0.7434171, 2.67213, 0.7921569, 0, 1, 1,
0.8551196, 0.09977949, 0.2843045, 0.8, 0, 1, 1,
0.8567327, 0.1917943, 1.285971, 0.8078431, 0, 1, 1,
0.8634397, -3.00419, 1.949148, 0.8117647, 0, 1, 1,
0.865176, 0.6340783, 1.417519, 0.8196079, 0, 1, 1,
0.8678399, 0.3175827, 0.1714129, 0.8235294, 0, 1, 1,
0.8710947, -0.2924948, 2.976113, 0.8313726, 0, 1, 1,
0.8728102, 0.09154621, 1.395757, 0.8352941, 0, 1, 1,
0.8754629, -0.8079342, 2.694067, 0.8431373, 0, 1, 1,
0.8795674, -1.785432, 3.895359, 0.8470588, 0, 1, 1,
0.8838853, -1.292673, 2.811878, 0.854902, 0, 1, 1,
0.9096955, 0.415814, 1.61735, 0.8588235, 0, 1, 1,
0.9131377, -1.1623, 2.038055, 0.8666667, 0, 1, 1,
0.9140931, 0.8914303, -0.1779807, 0.8705882, 0, 1, 1,
0.9147856, -1.407592, 1.690178, 0.8784314, 0, 1, 1,
0.9184727, 1.553602, -0.6796548, 0.8823529, 0, 1, 1,
0.9333511, 0.1942892, 1.860925, 0.8901961, 0, 1, 1,
0.9364155, -1.876002, 4.284966, 0.8941177, 0, 1, 1,
0.9372491, -0.6240988, 2.116363, 0.9019608, 0, 1, 1,
0.9384552, -0.2461734, 2.924792, 0.9098039, 0, 1, 1,
0.9388087, 0.6383776, -0.07801768, 0.9137255, 0, 1, 1,
0.9393395, -0.07275776, 2.327394, 0.9215686, 0, 1, 1,
0.9503222, 0.3917167, 0.8033742, 0.9254902, 0, 1, 1,
0.951974, -0.3674588, 2.832756, 0.9333333, 0, 1, 1,
0.9579937, 0.8925069, 1.191886, 0.9372549, 0, 1, 1,
0.9583721, -0.001740659, 3.242713, 0.945098, 0, 1, 1,
0.9590514, 0.03948029, -0.5416349, 0.9490196, 0, 1, 1,
0.9599444, -0.7392341, 1.087841, 0.9568627, 0, 1, 1,
0.9618552, -1.391892, 1.368369, 0.9607843, 0, 1, 1,
0.9646999, 0.8450517, -0.05166471, 0.9686275, 0, 1, 1,
0.9683173, -0.7507042, 2.05992, 0.972549, 0, 1, 1,
0.9696743, -0.4219223, 4.425562, 0.9803922, 0, 1, 1,
0.9707938, -1.461348, 4.136814, 0.9843137, 0, 1, 1,
0.9744315, 0.1241169, 2.028754, 0.9921569, 0, 1, 1,
0.9819493, 0.4418167, 1.189944, 0.9960784, 0, 1, 1,
0.9831023, -2.428861, 2.974662, 1, 0, 0.9960784, 1,
0.9856492, 0.7690763, -0.04963557, 1, 0, 0.9882353, 1,
0.9891294, -0.7108018, 3.871232, 1, 0, 0.9843137, 1,
0.9911001, 1.516466, 1.287422, 1, 0, 0.9764706, 1,
0.9918027, -0.9352539, 2.193012, 1, 0, 0.972549, 1,
0.9945518, 0.2998191, 1.851946, 1, 0, 0.9647059, 1,
0.9949849, 0.8930659, 2.178172, 1, 0, 0.9607843, 1,
1.003068, -0.3080591, 0.09154955, 1, 0, 0.9529412, 1,
1.008941, 0.8310069, -0.5498649, 1, 0, 0.9490196, 1,
1.009671, -0.08478487, 1.195111, 1, 0, 0.9411765, 1,
1.010085, -0.4495584, 1.651121, 1, 0, 0.9372549, 1,
1.010603, 1.327572, -1.422246, 1, 0, 0.9294118, 1,
1.01518, -1.017284, 2.427561, 1, 0, 0.9254902, 1,
1.016928, 0.01894394, 1.295981, 1, 0, 0.9176471, 1,
1.017766, 0.6681416, 1.609186, 1, 0, 0.9137255, 1,
1.018787, -0.1219019, 1.042453, 1, 0, 0.9058824, 1,
1.028859, -0.1495917, 1.32764, 1, 0, 0.9019608, 1,
1.044297, -0.5740881, 1.258116, 1, 0, 0.8941177, 1,
1.044327, 0.1393302, 3.142602, 1, 0, 0.8862745, 1,
1.052912, 2.001111, -0.1963421, 1, 0, 0.8823529, 1,
1.063482, 1.631932, -0.4955295, 1, 0, 0.8745098, 1,
1.063852, 0.4185285, 1.734909, 1, 0, 0.8705882, 1,
1.065346, 0.9316047, -0.174715, 1, 0, 0.8627451, 1,
1.07022, 1.079268, 1.515843, 1, 0, 0.8588235, 1,
1.073115, -1.32566, 2.133206, 1, 0, 0.8509804, 1,
1.075861, -0.4084518, 2.595405, 1, 0, 0.8470588, 1,
1.077342, -0.1396411, 0.02908568, 1, 0, 0.8392157, 1,
1.083044, 0.7053187, 2.006614, 1, 0, 0.8352941, 1,
1.087649, -1.682371, 1.658986, 1, 0, 0.827451, 1,
1.090749, 1.22, 0.3305267, 1, 0, 0.8235294, 1,
1.106813, 0.0444016, 2.420169, 1, 0, 0.8156863, 1,
1.109666, -0.5976476, 2.851672, 1, 0, 0.8117647, 1,
1.11267, 0.3159123, 1.616735, 1, 0, 0.8039216, 1,
1.113008, -0.3394439, 0.5322452, 1, 0, 0.7960784, 1,
1.113182, 0.2965112, 1.382341, 1, 0, 0.7921569, 1,
1.118747, 1.821466, -1.326692, 1, 0, 0.7843137, 1,
1.121616, 0.5343016, 0.3937782, 1, 0, 0.7803922, 1,
1.125373, 1.154586, 0.9000353, 1, 0, 0.772549, 1,
1.125835, 1.068315, 2.557773, 1, 0, 0.7686275, 1,
1.126215, 0.8027748, -0.4894279, 1, 0, 0.7607843, 1,
1.129059, -2.121886, 3.307912, 1, 0, 0.7568628, 1,
1.129207, -0.6679593, 1.010826, 1, 0, 0.7490196, 1,
1.132715, -1.307121, 2.817595, 1, 0, 0.7450981, 1,
1.143017, 0.4686494, -0.0790159, 1, 0, 0.7372549, 1,
1.14487, 0.06723399, 2.052275, 1, 0, 0.7333333, 1,
1.154125, 0.4235267, 2.155146, 1, 0, 0.7254902, 1,
1.15991, -1.045694, 1.640323, 1, 0, 0.7215686, 1,
1.161695, 0.7933584, 1.008592, 1, 0, 0.7137255, 1,
1.171961, 0.4573459, 2.348823, 1, 0, 0.7098039, 1,
1.174797, -1.430416, 3.516949, 1, 0, 0.7019608, 1,
1.179153, 1.859706, 0.6575428, 1, 0, 0.6941177, 1,
1.187972, 0.285582, 0.7309442, 1, 0, 0.6901961, 1,
1.188127, -1.321239, 2.229301, 1, 0, 0.682353, 1,
1.188625, 1.112569, 0.9054211, 1, 0, 0.6784314, 1,
1.193709, -0.4829203, 0.8323374, 1, 0, 0.6705883, 1,
1.197337, 1.209145, 1.500616, 1, 0, 0.6666667, 1,
1.203633, -1.493325, 3.912102, 1, 0, 0.6588235, 1,
1.206848, -1.380005, 2.52774, 1, 0, 0.654902, 1,
1.212162, -0.1072122, 1.731557, 1, 0, 0.6470588, 1,
1.222163, 0.467954, 1.563941, 1, 0, 0.6431373, 1,
1.223118, 1.478825, 1.942131, 1, 0, 0.6352941, 1,
1.224916, -0.1087657, 2.117249, 1, 0, 0.6313726, 1,
1.229048, 1.24249, 0.5692034, 1, 0, 0.6235294, 1,
1.248683, 0.8218884, 2.25228, 1, 0, 0.6196079, 1,
1.249346, 1.559234, -0.2056773, 1, 0, 0.6117647, 1,
1.253888, 1.174327, 1.655726, 1, 0, 0.6078432, 1,
1.259957, -1.290468, 4.786816, 1, 0, 0.6, 1,
1.268189, -0.1305487, 1.955119, 1, 0, 0.5921569, 1,
1.271216, -0.2419625, 1.045359, 1, 0, 0.5882353, 1,
1.274086, 0.002197703, 1.205404, 1, 0, 0.5803922, 1,
1.277321, 0.9876505, 0.4755997, 1, 0, 0.5764706, 1,
1.277874, 1.56837, 0.2110804, 1, 0, 0.5686275, 1,
1.278102, 0.3377872, 1.984458, 1, 0, 0.5647059, 1,
1.279985, 0.8661702, 0.04989764, 1, 0, 0.5568628, 1,
1.304055, -1.831483, 3.040047, 1, 0, 0.5529412, 1,
1.304359, 0.5409991, 0.1436492, 1, 0, 0.5450981, 1,
1.308802, 0.2369937, 1.066856, 1, 0, 0.5411765, 1,
1.320657, -1.553016, 1.199623, 1, 0, 0.5333334, 1,
1.325573, -0.8672024, 2.594302, 1, 0, 0.5294118, 1,
1.328018, -0.2647745, 1.570932, 1, 0, 0.5215687, 1,
1.330322, 1.289299, 0.938239, 1, 0, 0.5176471, 1,
1.333468, 0.3736738, 2.256253, 1, 0, 0.509804, 1,
1.339294, 0.7170045, -0.04341562, 1, 0, 0.5058824, 1,
1.341581, -1.709888, 1.951614, 1, 0, 0.4980392, 1,
1.343061, 0.2321396, 2.59291, 1, 0, 0.4901961, 1,
1.346027, -0.1812616, 2.059512, 1, 0, 0.4862745, 1,
1.353248, -0.13465, 1.728207, 1, 0, 0.4784314, 1,
1.354999, 1.423412, 0.4790579, 1, 0, 0.4745098, 1,
1.362218, -0.6257011, 2.976007, 1, 0, 0.4666667, 1,
1.364719, 0.002269352, 2.06175, 1, 0, 0.4627451, 1,
1.381041, -0.6980548, 1.785367, 1, 0, 0.454902, 1,
1.383475, 0.1794211, 1.218664, 1, 0, 0.4509804, 1,
1.39219, -1.462781, 2.332376, 1, 0, 0.4431373, 1,
1.396, 0.2137461, 2.025133, 1, 0, 0.4392157, 1,
1.404833, -0.1875956, 1.981941, 1, 0, 0.4313726, 1,
1.408771, 1.017505, 1.147975, 1, 0, 0.427451, 1,
1.421488, 0.4293016, 0.4178081, 1, 0, 0.4196078, 1,
1.426761, -0.5098034, -0.03863696, 1, 0, 0.4156863, 1,
1.432063, 0.2736671, 1.193115, 1, 0, 0.4078431, 1,
1.442554, 2.557291, 0.4397707, 1, 0, 0.4039216, 1,
1.453258, 1.057949, 0.5739268, 1, 0, 0.3960784, 1,
1.461906, 0.5506223, 0.696206, 1, 0, 0.3882353, 1,
1.467846, 0.7853515, 1.826586, 1, 0, 0.3843137, 1,
1.4724, 0.6531722, 1.853098, 1, 0, 0.3764706, 1,
1.474369, -0.7064809, 2.12603, 1, 0, 0.372549, 1,
1.475738, 0.4617258, -1.038837, 1, 0, 0.3647059, 1,
1.483955, -0.6675501, 1.258669, 1, 0, 0.3607843, 1,
1.490281, 1.671464, 0.5256053, 1, 0, 0.3529412, 1,
1.509913, 0.7145935, 0.04701997, 1, 0, 0.3490196, 1,
1.513458, 0.4202341, 1.773072, 1, 0, 0.3411765, 1,
1.526784, -0.5725499, 2.608688, 1, 0, 0.3372549, 1,
1.531255, 1.078619, -0.06665232, 1, 0, 0.3294118, 1,
1.534268, 0.1183749, 1.570306, 1, 0, 0.3254902, 1,
1.555548, -0.6553288, 0.8433238, 1, 0, 0.3176471, 1,
1.555685, -0.2262142, 3.077887, 1, 0, 0.3137255, 1,
1.556, -0.4980788, 2.228908, 1, 0, 0.3058824, 1,
1.558828, -0.5582086, 0.5849957, 1, 0, 0.2980392, 1,
1.563022, -0.8114413, 2.90854, 1, 0, 0.2941177, 1,
1.575301, 0.90717, 2.614386, 1, 0, 0.2862745, 1,
1.599029, 0.738395, 1.378783, 1, 0, 0.282353, 1,
1.599639, -0.6673808, 2.274399, 1, 0, 0.2745098, 1,
1.614383, 0.3078377, 2.635607, 1, 0, 0.2705882, 1,
1.622931, 0.1967179, 1.452026, 1, 0, 0.2627451, 1,
1.666451, 0.4249312, 2.561149, 1, 0, 0.2588235, 1,
1.666952, 0.7381518, 3.417188, 1, 0, 0.2509804, 1,
1.673494, 1.166207, -0.6313332, 1, 0, 0.2470588, 1,
1.676857, 1.246761, 0.4800104, 1, 0, 0.2392157, 1,
1.687845, 1.101739, 0.1755965, 1, 0, 0.2352941, 1,
1.708875, -1.548681, 0.1187501, 1, 0, 0.227451, 1,
1.727692, -0.2550734, 2.293707, 1, 0, 0.2235294, 1,
1.743464, 0.4979086, 1.101497, 1, 0, 0.2156863, 1,
1.753343, -1.123163, 0.71873, 1, 0, 0.2117647, 1,
1.794251, -1.562551, 2.892932, 1, 0, 0.2039216, 1,
1.802303, -1.819235, 2.953982, 1, 0, 0.1960784, 1,
1.807482, 1.514411, -1.020549, 1, 0, 0.1921569, 1,
1.818877, -0.05252757, 2.234845, 1, 0, 0.1843137, 1,
1.865905, 1.060587, 1.01448, 1, 0, 0.1803922, 1,
1.869459, -1.062317, 1.20018, 1, 0, 0.172549, 1,
1.937955, -0.6388535, 1.813818, 1, 0, 0.1686275, 1,
1.954249, -3.213778, 3.645972, 1, 0, 0.1607843, 1,
1.959778, 0.6091191, -0.4098959, 1, 0, 0.1568628, 1,
1.977981, -0.8629209, 3.200496, 1, 0, 0.1490196, 1,
2.002159, -0.1827094, 0.02001755, 1, 0, 0.145098, 1,
2.011721, -1.563361, 1.314933, 1, 0, 0.1372549, 1,
2.076218, 1.810162, 0.3968152, 1, 0, 0.1333333, 1,
2.127875, -1.142817, 1.416425, 1, 0, 0.1254902, 1,
2.130377, 1.236619, 0.428268, 1, 0, 0.1215686, 1,
2.141889, 1.774401, 0.370374, 1, 0, 0.1137255, 1,
2.145211, 1.979368, 0.6858885, 1, 0, 0.1098039, 1,
2.155986, -0.1848415, -0.0955247, 1, 0, 0.1019608, 1,
2.15809, 0.1565976, 1.139108, 1, 0, 0.09411765, 1,
2.190858, -1.293579, 3.501941, 1, 0, 0.09019608, 1,
2.217488, 0.6739444, 2.495448, 1, 0, 0.08235294, 1,
2.218539, -1.582893, 2.74661, 1, 0, 0.07843138, 1,
2.225263, 0.8817479, -0.1600506, 1, 0, 0.07058824, 1,
2.25592, -0.3681465, 2.777539, 1, 0, 0.06666667, 1,
2.272623, -0.8173018, 2.192952, 1, 0, 0.05882353, 1,
2.318326, 0.3306537, 0.7001861, 1, 0, 0.05490196, 1,
2.335393, 0.300157, 0.5976386, 1, 0, 0.04705882, 1,
2.335892, -0.7152756, 1.410871, 1, 0, 0.04313726, 1,
2.471352, 0.7148724, 2.526387, 1, 0, 0.03529412, 1,
2.557318, 0.2624322, -0.06343028, 1, 0, 0.03137255, 1,
2.852222, -0.2856102, 1.615419, 1, 0, 0.02352941, 1,
3.008648, 0.1946849, 1.96497, 1, 0, 0.01960784, 1,
3.055657, 0.1573047, 1.544526, 1, 0, 0.01176471, 1,
3.065538, 1.900157, 0.4819514, 1, 0, 0.007843138, 1
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
-0.08184445, -5.240209, -7.026096, 0, -0.5, 0.5, 0.5,
-0.08184445, -5.240209, -7.026096, 1, -0.5, 0.5, 0.5,
-0.08184445, -5.240209, -7.026096, 1, 1.5, 0.5, 0.5,
-0.08184445, -5.240209, -7.026096, 0, 1.5, 0.5, 0.5
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
-4.296189, -0.3488882, -7.026096, 0, -0.5, 0.5, 0.5,
-4.296189, -0.3488882, -7.026096, 1, -0.5, 0.5, 0.5,
-4.296189, -0.3488882, -7.026096, 1, 1.5, 0.5, 0.5,
-4.296189, -0.3488882, -7.026096, 0, 1.5, 0.5, 0.5
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
-4.296189, -5.240209, 0.1249492, 0, -0.5, 0.5, 0.5,
-4.296189, -5.240209, 0.1249492, 1, -0.5, 0.5, 0.5,
-4.296189, -5.240209, 0.1249492, 1, 1.5, 0.5, 0.5,
-4.296189, -5.240209, 0.1249492, 0, 1.5, 0.5, 0.5
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
-3, -4.111443, -5.375855,
3, -4.111443, -5.375855,
-3, -4.111443, -5.375855,
-3, -4.29957, -5.650895,
-2, -4.111443, -5.375855,
-2, -4.29957, -5.650895,
-1, -4.111443, -5.375855,
-1, -4.29957, -5.650895,
0, -4.111443, -5.375855,
0, -4.29957, -5.650895,
1, -4.111443, -5.375855,
1, -4.29957, -5.650895,
2, -4.111443, -5.375855,
2, -4.29957, -5.650895,
3, -4.111443, -5.375855,
3, -4.29957, -5.650895
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
-3, -4.675826, -6.200975, 0, -0.5, 0.5, 0.5,
-3, -4.675826, -6.200975, 1, -0.5, 0.5, 0.5,
-3, -4.675826, -6.200975, 1, 1.5, 0.5, 0.5,
-3, -4.675826, -6.200975, 0, 1.5, 0.5, 0.5,
-2, -4.675826, -6.200975, 0, -0.5, 0.5, 0.5,
-2, -4.675826, -6.200975, 1, -0.5, 0.5, 0.5,
-2, -4.675826, -6.200975, 1, 1.5, 0.5, 0.5,
-2, -4.675826, -6.200975, 0, 1.5, 0.5, 0.5,
-1, -4.675826, -6.200975, 0, -0.5, 0.5, 0.5,
-1, -4.675826, -6.200975, 1, -0.5, 0.5, 0.5,
-1, -4.675826, -6.200975, 1, 1.5, 0.5, 0.5,
-1, -4.675826, -6.200975, 0, 1.5, 0.5, 0.5,
0, -4.675826, -6.200975, 0, -0.5, 0.5, 0.5,
0, -4.675826, -6.200975, 1, -0.5, 0.5, 0.5,
0, -4.675826, -6.200975, 1, 1.5, 0.5, 0.5,
0, -4.675826, -6.200975, 0, 1.5, 0.5, 0.5,
1, -4.675826, -6.200975, 0, -0.5, 0.5, 0.5,
1, -4.675826, -6.200975, 1, -0.5, 0.5, 0.5,
1, -4.675826, -6.200975, 1, 1.5, 0.5, 0.5,
1, -4.675826, -6.200975, 0, 1.5, 0.5, 0.5,
2, -4.675826, -6.200975, 0, -0.5, 0.5, 0.5,
2, -4.675826, -6.200975, 1, -0.5, 0.5, 0.5,
2, -4.675826, -6.200975, 1, 1.5, 0.5, 0.5,
2, -4.675826, -6.200975, 0, 1.5, 0.5, 0.5,
3, -4.675826, -6.200975, 0, -0.5, 0.5, 0.5,
3, -4.675826, -6.200975, 1, -0.5, 0.5, 0.5,
3, -4.675826, -6.200975, 1, 1.5, 0.5, 0.5,
3, -4.675826, -6.200975, 0, 1.5, 0.5, 0.5
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
-3.323648, -4, -5.375855,
-3.323648, 2, -5.375855,
-3.323648, -4, -5.375855,
-3.485738, -4, -5.650895,
-3.323648, -2, -5.375855,
-3.485738, -2, -5.650895,
-3.323648, 0, -5.375855,
-3.485738, 0, -5.650895,
-3.323648, 2, -5.375855,
-3.485738, 2, -5.650895
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
"-4",
"-2",
"0",
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
-3.809919, -4, -6.200975, 0, -0.5, 0.5, 0.5,
-3.809919, -4, -6.200975, 1, -0.5, 0.5, 0.5,
-3.809919, -4, -6.200975, 1, 1.5, 0.5, 0.5,
-3.809919, -4, -6.200975, 0, 1.5, 0.5, 0.5,
-3.809919, -2, -6.200975, 0, -0.5, 0.5, 0.5,
-3.809919, -2, -6.200975, 1, -0.5, 0.5, 0.5,
-3.809919, -2, -6.200975, 1, 1.5, 0.5, 0.5,
-3.809919, -2, -6.200975, 0, 1.5, 0.5, 0.5,
-3.809919, 0, -6.200975, 0, -0.5, 0.5, 0.5,
-3.809919, 0, -6.200975, 1, -0.5, 0.5, 0.5,
-3.809919, 0, -6.200975, 1, 1.5, 0.5, 0.5,
-3.809919, 0, -6.200975, 0, 1.5, 0.5, 0.5,
-3.809919, 2, -6.200975, 0, -0.5, 0.5, 0.5,
-3.809919, 2, -6.200975, 1, -0.5, 0.5, 0.5,
-3.809919, 2, -6.200975, 1, 1.5, 0.5, 0.5,
-3.809919, 2, -6.200975, 0, 1.5, 0.5, 0.5
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
-3.323648, -4.111443, -4,
-3.323648, -4.111443, 4,
-3.323648, -4.111443, -4,
-3.485738, -4.29957, -4,
-3.323648, -4.111443, -2,
-3.485738, -4.29957, -2,
-3.323648, -4.111443, 0,
-3.485738, -4.29957, 0,
-3.323648, -4.111443, 2,
-3.485738, -4.29957, 2,
-3.323648, -4.111443, 4,
-3.485738, -4.29957, 4
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
-3.809919, -4.675826, -4, 0, -0.5, 0.5, 0.5,
-3.809919, -4.675826, -4, 1, -0.5, 0.5, 0.5,
-3.809919, -4.675826, -4, 1, 1.5, 0.5, 0.5,
-3.809919, -4.675826, -4, 0, 1.5, 0.5, 0.5,
-3.809919, -4.675826, -2, 0, -0.5, 0.5, 0.5,
-3.809919, -4.675826, -2, 1, -0.5, 0.5, 0.5,
-3.809919, -4.675826, -2, 1, 1.5, 0.5, 0.5,
-3.809919, -4.675826, -2, 0, 1.5, 0.5, 0.5,
-3.809919, -4.675826, 0, 0, -0.5, 0.5, 0.5,
-3.809919, -4.675826, 0, 1, -0.5, 0.5, 0.5,
-3.809919, -4.675826, 0, 1, 1.5, 0.5, 0.5,
-3.809919, -4.675826, 0, 0, 1.5, 0.5, 0.5,
-3.809919, -4.675826, 2, 0, -0.5, 0.5, 0.5,
-3.809919, -4.675826, 2, 1, -0.5, 0.5, 0.5,
-3.809919, -4.675826, 2, 1, 1.5, 0.5, 0.5,
-3.809919, -4.675826, 2, 0, 1.5, 0.5, 0.5,
-3.809919, -4.675826, 4, 0, -0.5, 0.5, 0.5,
-3.809919, -4.675826, 4, 1, -0.5, 0.5, 0.5,
-3.809919, -4.675826, 4, 1, 1.5, 0.5, 0.5,
-3.809919, -4.675826, 4, 0, 1.5, 0.5, 0.5
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
-3.323648, -4.111443, -5.375855,
-3.323648, 3.413666, -5.375855,
-3.323648, -4.111443, 5.625753,
-3.323648, 3.413666, 5.625753,
-3.323648, -4.111443, -5.375855,
-3.323648, -4.111443, 5.625753,
-3.323648, 3.413666, -5.375855,
-3.323648, 3.413666, 5.625753,
-3.323648, -4.111443, -5.375855,
3.159959, -4.111443, -5.375855,
-3.323648, -4.111443, 5.625753,
3.159959, -4.111443, 5.625753,
-3.323648, 3.413666, -5.375855,
3.159959, 3.413666, -5.375855,
-3.323648, 3.413666, 5.625753,
3.159959, 3.413666, 5.625753,
3.159959, -4.111443, -5.375855,
3.159959, 3.413666, -5.375855,
3.159959, -4.111443, 5.625753,
3.159959, 3.413666, 5.625753,
3.159959, -4.111443, -5.375855,
3.159959, -4.111443, 5.625753,
3.159959, 3.413666, -5.375855,
3.159959, 3.413666, 5.625753
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
var radius = 7.914806;
var distance = 35.21387;
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
mvMatrix.translate( 0.08184445, 0.3488882, -0.1249492 );
mvMatrix.scale( 1.319889, 1.137212, 0.7778539 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.21387);
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
gl.drawArrays(gl.LINES, 0, 10);
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
gl.drawElements(gl.TRIANGLES, 24, gl.UNSIGNED_SHORT, 0);
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
Phoxim<-read.table("Phoxim.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Phoxim$V2
```

```
## Error in eval(expr, envir, enclos): object 'Phoxim' not found
```

```r
y<-Phoxim$V3
```

```
## Error in eval(expr, envir, enclos): object 'Phoxim' not found
```

```r
z<-Phoxim$V4
```

```
## Error in eval(expr, envir, enclos): object 'Phoxim' not found
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
-3.229227, -0.9769598, -3.746974, 0, 0, 1, 1, 1,
-3.059862, -1.107598, -0.8952808, 1, 0, 0, 1, 1,
-2.658188, -0.821498, -2.062967, 1, 0, 0, 1, 1,
-2.613014, -0.4590104, -2.595702, 1, 0, 0, 1, 1,
-2.530416, 0.4179636, -2.693499, 1, 0, 0, 1, 1,
-2.51001, 0.2934843, -1.966352, 1, 0, 0, 1, 1,
-2.395641, -0.3136865, 0.2073938, 0, 0, 0, 1, 1,
-2.310771, 1.82817, -1.967564, 0, 0, 0, 1, 1,
-2.296023, -0.2880988, -1.191691, 0, 0, 0, 1, 1,
-2.2793, -0.9621242, -3.209892, 0, 0, 0, 1, 1,
-2.276649, 1.161209, -2.517538, 0, 0, 0, 1, 1,
-2.268302, 0.7716452, -1.544649, 0, 0, 0, 1, 1,
-2.213974, -0.5482733, -2.323818, 0, 0, 0, 1, 1,
-2.162747, -0.09083816, -0.4541761, 1, 1, 1, 1, 1,
-2.112147, 1.25165, -0.4500406, 1, 1, 1, 1, 1,
-2.093583, -1.689552, -2.769198, 1, 1, 1, 1, 1,
-2.077868, 0.6563946, -1.83654, 1, 1, 1, 1, 1,
-2.064347, -0.08857125, -2.090236, 1, 1, 1, 1, 1,
-2.046699, 1.520812, 0.5481892, 1, 1, 1, 1, 1,
-2.045383, -0.8422468, -3.686019, 1, 1, 1, 1, 1,
-2.022704, -0.731055, -2.197959, 1, 1, 1, 1, 1,
-1.986622, 0.6840227, 0.4945433, 1, 1, 1, 1, 1,
-1.98549, 0.4636553, -2.03438, 1, 1, 1, 1, 1,
-1.981235, 0.4722566, -1.871116, 1, 1, 1, 1, 1,
-1.97993, 0.545651, -1.579676, 1, 1, 1, 1, 1,
-1.977603, -0.6019197, -3.708147, 1, 1, 1, 1, 1,
-1.963953, -0.541055, -1.587418, 1, 1, 1, 1, 1,
-1.957852, 0.1278422, -0.5506564, 1, 1, 1, 1, 1,
-1.941731, -1.487544, -1.293813, 0, 0, 1, 1, 1,
-1.932305, 0.6368946, -1.925153, 1, 0, 0, 1, 1,
-1.921693, -0.02622356, -4.173126, 1, 0, 0, 1, 1,
-1.902519, -0.7386201, -0.3015733, 1, 0, 0, 1, 1,
-1.887437, -0.896708, -1.936372, 1, 0, 0, 1, 1,
-1.874105, 0.9783374, -1.927542, 1, 0, 0, 1, 1,
-1.871655, -1.442321, -2.745857, 0, 0, 0, 1, 1,
-1.858138, -0.07537185, -1.478151, 0, 0, 0, 1, 1,
-1.852178, 0.3097462, -1.20641, 0, 0, 0, 1, 1,
-1.835633, 0.1590631, -2.037371, 0, 0, 0, 1, 1,
-1.833733, -0.4146419, -2.9669, 0, 0, 0, 1, 1,
-1.818536, -0.5087895, -1.089393, 0, 0, 0, 1, 1,
-1.818052, 0.8178583, -1.708073, 0, 0, 0, 1, 1,
-1.81746, -1.00461, -2.008197, 1, 1, 1, 1, 1,
-1.813794, 0.7238157, -1.710088, 1, 1, 1, 1, 1,
-1.804951, -0.9230195, -2.512835, 1, 1, 1, 1, 1,
-1.795267, 0.1815513, -0.5654296, 1, 1, 1, 1, 1,
-1.785611, -0.037115, -1.335241, 1, 1, 1, 1, 1,
-1.71952, -0.7221364, -2.01596, 1, 1, 1, 1, 1,
-1.716, 1.43671, -1.221171, 1, 1, 1, 1, 1,
-1.69517, -0.09025264, -2.034139, 1, 1, 1, 1, 1,
-1.678934, 1.00467, -0.1512733, 1, 1, 1, 1, 1,
-1.673778, -2.228364, -1.67085, 1, 1, 1, 1, 1,
-1.666822, 1.477929, -0.765048, 1, 1, 1, 1, 1,
-1.650515, -0.8863264, -3.6162, 1, 1, 1, 1, 1,
-1.648259, 1.330908, -0.3780646, 1, 1, 1, 1, 1,
-1.631021, 1.856296, -1.003034, 1, 1, 1, 1, 1,
-1.618999, 0.7525991, -1.542896, 1, 1, 1, 1, 1,
-1.61319, 0.8800456, 0.2312001, 0, 0, 1, 1, 1,
-1.611497, -0.1696722, -2.554308, 1, 0, 0, 1, 1,
-1.608623, -0.152977, -0.5021176, 1, 0, 0, 1, 1,
-1.600984, -0.2307568, -1.548386, 1, 0, 0, 1, 1,
-1.598323, -0.4509485, -1.603659, 1, 0, 0, 1, 1,
-1.575624, -0.3927095, -2.129078, 1, 0, 0, 1, 1,
-1.53759, -0.7431746, -3.131717, 0, 0, 0, 1, 1,
-1.527291, 1.518337, -2.059639, 0, 0, 0, 1, 1,
-1.526454, -0.7446036, -3.175296, 0, 0, 0, 1, 1,
-1.526048, 1.25415, -0.6378194, 0, 0, 0, 1, 1,
-1.522577, -0.004404441, -1.620177, 0, 0, 0, 1, 1,
-1.517231, -0.7927253, -2.115066, 0, 0, 0, 1, 1,
-1.516717, 0.5951674, -0.9508663, 0, 0, 0, 1, 1,
-1.515502, 1.845545, -0.7901261, 1, 1, 1, 1, 1,
-1.508284, 1.049666, -2.272467, 1, 1, 1, 1, 1,
-1.496557, 0.7112234, -1.466883, 1, 1, 1, 1, 1,
-1.494064, 0.1666128, -1.387278, 1, 1, 1, 1, 1,
-1.48641, -0.4018267, -1.279515, 1, 1, 1, 1, 1,
-1.485318, 0.1710633, -2.982343, 1, 1, 1, 1, 1,
-1.483673, 1.522365, -2.715829, 1, 1, 1, 1, 1,
-1.483013, -0.180989, -0.9242787, 1, 1, 1, 1, 1,
-1.465173, 0.4111929, -0.3989502, 1, 1, 1, 1, 1,
-1.455396, 0.5283098, -0.3941293, 1, 1, 1, 1, 1,
-1.417655, -0.9472471, -3.011377, 1, 1, 1, 1, 1,
-1.402196, 1.492817, -0.7022189, 1, 1, 1, 1, 1,
-1.39303, -0.5433825, -4.083298, 1, 1, 1, 1, 1,
-1.390176, -0.7201807, -1.471557, 1, 1, 1, 1, 1,
-1.385061, -1.110242, -3.030272, 1, 1, 1, 1, 1,
-1.378559, 0.1310737, -0.8947849, 0, 0, 1, 1, 1,
-1.378316, 0.1139875, -0.3337765, 1, 0, 0, 1, 1,
-1.369402, 0.1224456, 0.2220163, 1, 0, 0, 1, 1,
-1.363024, 0.4840291, -1.888304, 1, 0, 0, 1, 1,
-1.352364, 0.03201731, -3.076095, 1, 0, 0, 1, 1,
-1.347558, -1.230766, -1.884337, 1, 0, 0, 1, 1,
-1.344314, -0.7102064, -1.833172, 0, 0, 0, 1, 1,
-1.332936, 0.2429899, -1.849957, 0, 0, 0, 1, 1,
-1.330116, 0.4837921, -3.415401, 0, 0, 0, 1, 1,
-1.328148, -1.169123, -2.061741, 0, 0, 0, 1, 1,
-1.322842, -1.620141, -2.498569, 0, 0, 0, 1, 1,
-1.317802, -0.02295112, -1.175824, 0, 0, 0, 1, 1,
-1.314535, 0.5399244, 0.7814214, 0, 0, 0, 1, 1,
-1.308339, -0.4390442, -3.259677, 1, 1, 1, 1, 1,
-1.307232, 0.7842512, -1.819334, 1, 1, 1, 1, 1,
-1.303233, -0.5458226, -2.161469, 1, 1, 1, 1, 1,
-1.30116, 0.4537231, -1.262514, 1, 1, 1, 1, 1,
-1.299072, 0.1455313, -2.605981, 1, 1, 1, 1, 1,
-1.297253, -0.2852217, -0.6042326, 1, 1, 1, 1, 1,
-1.279254, -0.03552208, -0.8622966, 1, 1, 1, 1, 1,
-1.267877, -2.383033, -1.850703, 1, 1, 1, 1, 1,
-1.26207, -0.9741274, -2.348042, 1, 1, 1, 1, 1,
-1.247376, -0.9355493, -0.446363, 1, 1, 1, 1, 1,
-1.243359, 0.7742065, -1.037248, 1, 1, 1, 1, 1,
-1.229903, -0.2809237, -2.344529, 1, 1, 1, 1, 1,
-1.221542, 0.5961562, -2.278909, 1, 1, 1, 1, 1,
-1.216704, 0.0006796965, -1.702082, 1, 1, 1, 1, 1,
-1.211722, -1.516193, -2.484989, 1, 1, 1, 1, 1,
-1.208442, 0.07257053, 0.2868527, 0, 0, 1, 1, 1,
-1.206056, -0.3051128, -2.739397, 1, 0, 0, 1, 1,
-1.191993, 1.168588, -1.210661, 1, 0, 0, 1, 1,
-1.190679, 0.2394591, 1.089003, 1, 0, 0, 1, 1,
-1.185533, 0.8198106, -0.1879815, 1, 0, 0, 1, 1,
-1.175272, 2.244953, 0.1233964, 1, 0, 0, 1, 1,
-1.167706, 0.1939683, -3.005641, 0, 0, 0, 1, 1,
-1.160647, 0.1860397, -0.08925046, 0, 0, 0, 1, 1,
-1.160393, 0.0508501, -0.4732694, 0, 0, 0, 1, 1,
-1.156093, -1.532569, -2.228954, 0, 0, 0, 1, 1,
-1.15316, 0.9478399, -0.6982743, 0, 0, 0, 1, 1,
-1.148012, 2.044343, 0.6608151, 0, 0, 0, 1, 1,
-1.143008, -1.937485, -0.7571439, 0, 0, 0, 1, 1,
-1.142197, 0.8067222, -2.34839, 1, 1, 1, 1, 1,
-1.13382, 0.4172606, -0.221412, 1, 1, 1, 1, 1,
-1.121392, 0.1314637, -2.399873, 1, 1, 1, 1, 1,
-1.117668, -1.219782, -0.7951801, 1, 1, 1, 1, 1,
-1.117251, 1.665243, -1.279424, 1, 1, 1, 1, 1,
-1.116163, 1.374277, 0.8115827, 1, 1, 1, 1, 1,
-1.115218, 1.013721, 0.06949931, 1, 1, 1, 1, 1,
-1.112925, 0.03058776, -0.4609312, 1, 1, 1, 1, 1,
-1.108077, 0.3142636, -1.963074, 1, 1, 1, 1, 1,
-1.103123, 0.1349521, -2.055411, 1, 1, 1, 1, 1,
-1.092545, 0.3232875, -2.356406, 1, 1, 1, 1, 1,
-1.091879, -0.7469047, -1.511134, 1, 1, 1, 1, 1,
-1.090121, -0.156585, -3.229063, 1, 1, 1, 1, 1,
-1.089297, 1.033701, -1.815026, 1, 1, 1, 1, 1,
-1.084921, -0.08180627, -1.817042, 1, 1, 1, 1, 1,
-1.082566, -0.3001135, -0.7746917, 0, 0, 1, 1, 1,
-1.082475, 0.7588574, -1.095462, 1, 0, 0, 1, 1,
-1.073437, -0.2893828, -2.653528, 1, 0, 0, 1, 1,
-1.066635, 0.1036498, -3.43193, 1, 0, 0, 1, 1,
-1.060802, -0.01804255, -3.070677, 1, 0, 0, 1, 1,
-1.055622, -0.5470172, -1.934845, 1, 0, 0, 1, 1,
-1.051807, 0.3529577, -0.408894, 0, 0, 0, 1, 1,
-1.051357, 0.7801797, 0.3326107, 0, 0, 0, 1, 1,
-1.046667, -0.5751832, -3.802873, 0, 0, 0, 1, 1,
-1.04307, 1.616377, 1.310491, 0, 0, 0, 1, 1,
-1.042536, 0.1249933, -1.670556, 0, 0, 0, 1, 1,
-1.04177, 0.07401393, -2.980126, 0, 0, 0, 1, 1,
-1.037546, -0.9527635, -2.42913, 0, 0, 0, 1, 1,
-1.030246, 2.38355, -0.4570276, 1, 1, 1, 1, 1,
-1.024229, -1.212778, -1.054086, 1, 1, 1, 1, 1,
-1.022988, 0.1459791, -1.636927, 1, 1, 1, 1, 1,
-1.006501, 0.7253541, -1.912724, 1, 1, 1, 1, 1,
-1.004715, -0.2666465, -2.024507, 1, 1, 1, 1, 1,
-0.9996773, 0.2629885, -0.3034884, 1, 1, 1, 1, 1,
-0.9988482, 0.8237505, -2.884196, 1, 1, 1, 1, 1,
-0.9915839, 0.9688066, -0.1019488, 1, 1, 1, 1, 1,
-0.9780818, 0.6325218, -1.743309, 1, 1, 1, 1, 1,
-0.9649665, 0.9106456, 0.1589691, 1, 1, 1, 1, 1,
-0.9559628, 1.007023, 0.6662865, 1, 1, 1, 1, 1,
-0.9509075, 0.2439165, -1.574041, 1, 1, 1, 1, 1,
-0.9488241, -0.8296112, -2.162235, 1, 1, 1, 1, 1,
-0.9401342, -0.1253874, -2.44536, 1, 1, 1, 1, 1,
-0.932955, -1.063341, -1.462903, 1, 1, 1, 1, 1,
-0.930271, 0.4131413, 0.05118993, 0, 0, 1, 1, 1,
-0.9274261, -0.5910647, 0.2226869, 1, 0, 0, 1, 1,
-0.9181715, 1.233341, -2.357671, 1, 0, 0, 1, 1,
-0.9180232, -0.5590663, -3.111529, 1, 0, 0, 1, 1,
-0.9171957, 1.221743, -0.5608679, 1, 0, 0, 1, 1,
-0.9131867, -0.464733, -2.982808, 1, 0, 0, 1, 1,
-0.9131177, 1.112448, -0.4286512, 0, 0, 0, 1, 1,
-0.910058, -1.038543, -2.688579, 0, 0, 0, 1, 1,
-0.9079562, -0.3917657, -3.342699, 0, 0, 0, 1, 1,
-0.9078917, -1.50951, -1.89062, 0, 0, 0, 1, 1,
-0.9073268, -1.20563, -0.6048616, 0, 0, 0, 1, 1,
-0.888138, 0.2326183, -1.841804, 0, 0, 0, 1, 1,
-0.8877391, -0.2473606, -0.5879126, 0, 0, 0, 1, 1,
-0.8869964, -0.2216032, -1.656758, 1, 1, 1, 1, 1,
-0.8811585, -0.4100295, -3.238201, 1, 1, 1, 1, 1,
-0.8785923, -1.994752, -3.820964, 1, 1, 1, 1, 1,
-0.8763239, 0.2781647, -0.9253989, 1, 1, 1, 1, 1,
-0.8693129, 0.616958, -0.4784473, 1, 1, 1, 1, 1,
-0.867834, 1.197904, -1.856399, 1, 1, 1, 1, 1,
-0.8532738, 0.5405108, -1.154468, 1, 1, 1, 1, 1,
-0.8525468, -0.3521357, -2.468507, 1, 1, 1, 1, 1,
-0.8522, -0.0195557, -2.863774, 1, 1, 1, 1, 1,
-0.8499696, -1.364192, -2.868465, 1, 1, 1, 1, 1,
-0.84528, -1.887659, -3.28966, 1, 1, 1, 1, 1,
-0.8406707, 1.382054, -0.248055, 1, 1, 1, 1, 1,
-0.8398109, -0.07735353, -0.6453518, 1, 1, 1, 1, 1,
-0.8384752, 0.1045956, -2.569056, 1, 1, 1, 1, 1,
-0.8382175, -0.1757573, -1.120406, 1, 1, 1, 1, 1,
-0.8377011, -1.18604, -1.741773, 0, 0, 1, 1, 1,
-0.8320692, 1.203364, -0.3371035, 1, 0, 0, 1, 1,
-0.8262643, -0.2693684, -2.221494, 1, 0, 0, 1, 1,
-0.8255546, -0.7770724, -3.212578, 1, 0, 0, 1, 1,
-0.8245089, -1.883757, -2.347312, 1, 0, 0, 1, 1,
-0.8220531, 2.049193, -0.8540496, 1, 0, 0, 1, 1,
-0.8091955, -2.115941, -2.085858, 0, 0, 0, 1, 1,
-0.8091862, 0.4401675, -1.386441, 0, 0, 0, 1, 1,
-0.8075853, 0.8732405, -1.142141, 0, 0, 0, 1, 1,
-0.7931243, -0.5367405, -2.899475, 0, 0, 0, 1, 1,
-0.7929499, 1.883755, -0.5565692, 0, 0, 0, 1, 1,
-0.7908771, -0.9901117, -1.900702, 0, 0, 0, 1, 1,
-0.7808731, 0.1849741, -1.503776, 0, 0, 0, 1, 1,
-0.7752376, 1.413339, 0.4864927, 1, 1, 1, 1, 1,
-0.7716845, -0.2675014, -1.409788, 1, 1, 1, 1, 1,
-0.7696346, 0.5801237, -1.028443, 1, 1, 1, 1, 1,
-0.7658759, -0.3075421, -1.355814, 1, 1, 1, 1, 1,
-0.7631927, -0.2686373, -2.480042, 1, 1, 1, 1, 1,
-0.7574506, 0.2703626, -3.012697, 1, 1, 1, 1, 1,
-0.7549046, 0.7226771, -3.55144, 1, 1, 1, 1, 1,
-0.7492889, 0.9243384, -1.296405, 1, 1, 1, 1, 1,
-0.7483485, 0.5011809, -1.3426, 1, 1, 1, 1, 1,
-0.7479281, -0.2647108, -0.8763521, 1, 1, 1, 1, 1,
-0.7464246, -0.8630387, -2.385273, 1, 1, 1, 1, 1,
-0.7375584, 1.287114, -1.200029, 1, 1, 1, 1, 1,
-0.7301629, -0.01095087, -2.467734, 1, 1, 1, 1, 1,
-0.7196966, -1.568957, -3.57654, 1, 1, 1, 1, 1,
-0.7135665, -1.19029, -3.51141, 1, 1, 1, 1, 1,
-0.7096323, -0.4931746, -2.051337, 0, 0, 1, 1, 1,
-0.7075092, 0.05349352, -2.211911, 1, 0, 0, 1, 1,
-0.6883441, -0.9809941, -2.43886, 1, 0, 0, 1, 1,
-0.6816697, -1.028745, -4.695161, 1, 0, 0, 1, 1,
-0.6791154, -0.3294426, -3.040063, 1, 0, 0, 1, 1,
-0.6760019, 1.751258, 0.5868768, 1, 0, 0, 1, 1,
-0.6728898, -0.07482009, -0.8532444, 0, 0, 0, 1, 1,
-0.6709674, -1.842948, -2.87121, 0, 0, 0, 1, 1,
-0.6673133, -1.615215, -4.304597, 0, 0, 0, 1, 1,
-0.6636989, -0.8368281, -3.254718, 0, 0, 0, 1, 1,
-0.6609883, -0.2712886, -2.427207, 0, 0, 0, 1, 1,
-0.6598427, -0.1415813, -1.390757, 0, 0, 0, 1, 1,
-0.6597589, 0.02514873, -0.316148, 0, 0, 0, 1, 1,
-0.6596712, -0.3952187, -2.626153, 1, 1, 1, 1, 1,
-0.6556987, 0.2207502, -1.733472, 1, 1, 1, 1, 1,
-0.649794, -0.1660597, -0.5773459, 1, 1, 1, 1, 1,
-0.6467447, 0.744562, 0.4198306, 1, 1, 1, 1, 1,
-0.6409316, 0.749985, -0.564467, 1, 1, 1, 1, 1,
-0.6405403, -0.07901899, -2.695237, 1, 1, 1, 1, 1,
-0.6399945, 0.5920874, -0.2041014, 1, 1, 1, 1, 1,
-0.6376745, -1.471191, -3.619954, 1, 1, 1, 1, 1,
-0.6334978, -0.09052456, -1.640645, 1, 1, 1, 1, 1,
-0.6286654, 0.07839917, -2.543506, 1, 1, 1, 1, 1,
-0.6247695, 0.01661346, -0.8886119, 1, 1, 1, 1, 1,
-0.6244013, -0.6353078, -4.387872, 1, 1, 1, 1, 1,
-0.6236531, 0.5158054, -0.6738092, 1, 1, 1, 1, 1,
-0.6208091, -0.3651323, -2.434204, 1, 1, 1, 1, 1,
-0.6191035, -0.173804, -0.5415395, 1, 1, 1, 1, 1,
-0.6174915, 0.04550787, -1.526247, 0, 0, 1, 1, 1,
-0.6118688, -0.521075, -0.8572824, 1, 0, 0, 1, 1,
-0.605283, -0.3753363, -3.642178, 1, 0, 0, 1, 1,
-0.5953443, 0.1861324, -3.68037, 1, 0, 0, 1, 1,
-0.5944658, -0.0004619599, -1.897438, 1, 0, 0, 1, 1,
-0.5882996, -0.1411341, -1.611724, 1, 0, 0, 1, 1,
-0.583146, 2.0225, 0.04982825, 0, 0, 0, 1, 1,
-0.5830737, 0.2304826, -2.802094, 0, 0, 0, 1, 1,
-0.5820376, -0.3493952, -2.491872, 0, 0, 0, 1, 1,
-0.5734556, -1.987668, -2.387996, 0, 0, 0, 1, 1,
-0.5694355, 0.6232214, -0.8822065, 0, 0, 0, 1, 1,
-0.5678241, -0.3367048, 0.04424685, 0, 0, 0, 1, 1,
-0.5673226, -1.189383, -3.110991, 0, 0, 0, 1, 1,
-0.5659353, -1.772652, -2.599679, 1, 1, 1, 1, 1,
-0.5657919, 0.5456982, -0.4623198, 1, 1, 1, 1, 1,
-0.5646329, -1.500404, -0.4669917, 1, 1, 1, 1, 1,
-0.5547439, 0.2492984, -0.1742998, 1, 1, 1, 1, 1,
-0.54059, -0.4882397, -2.421645, 1, 1, 1, 1, 1,
-0.5356877, 1.08313, -1.6176, 1, 1, 1, 1, 1,
-0.5316477, -0.8802996, -3.230042, 1, 1, 1, 1, 1,
-0.5316336, 0.3559009, -1.795512, 1, 1, 1, 1, 1,
-0.5251538, -0.8418472, -0.7995772, 1, 1, 1, 1, 1,
-0.5120611, -2.039879, -2.769636, 1, 1, 1, 1, 1,
-0.5095761, 1.826535, 1.480318, 1, 1, 1, 1, 1,
-0.5000006, -0.5973721, -2.11771, 1, 1, 1, 1, 1,
-0.4987731, 0.2320959, -0.5843588, 1, 1, 1, 1, 1,
-0.495398, 0.4428054, -0.7426088, 1, 1, 1, 1, 1,
-0.49526, 1.190155, 0.8968805, 1, 1, 1, 1, 1,
-0.491663, -1.378735, -3.848956, 0, 0, 1, 1, 1,
-0.488273, -0.9801202, -2.958838, 1, 0, 0, 1, 1,
-0.4861076, 1.176348, -0.7931551, 1, 0, 0, 1, 1,
-0.4856078, -0.3819355, -3.685687, 1, 0, 0, 1, 1,
-0.4816457, 0.1325056, -0.188896, 1, 0, 0, 1, 1,
-0.479535, -0.740198, -1.061949, 1, 0, 0, 1, 1,
-0.4782202, 1.836773, -0.9184621, 0, 0, 0, 1, 1,
-0.4752407, 0.8131118, -1.799958, 0, 0, 0, 1, 1,
-0.4725017, 2.19704, 0.6881162, 0, 0, 0, 1, 1,
-0.4714311, -1.075279, -3.833543, 0, 0, 0, 1, 1,
-0.4713247, -0.4469095, -2.90434, 0, 0, 0, 1, 1,
-0.4688825, 0.1047472, -3.178624, 0, 0, 0, 1, 1,
-0.4661342, 0.7839895, -1.086297, 0, 0, 0, 1, 1,
-0.4647545, -0.1621825, -2.763864, 1, 1, 1, 1, 1,
-0.4602015, -0.7908852, -2.694562, 1, 1, 1, 1, 1,
-0.4552866, 1.337121, -0.2237636, 1, 1, 1, 1, 1,
-0.4546816, -0.1662324, -1.265072, 1, 1, 1, 1, 1,
-0.4542548, 1.856258, -0.8370435, 1, 1, 1, 1, 1,
-0.453619, 0.8690495, -0.942761, 1, 1, 1, 1, 1,
-0.4518591, 1.025904, -0.3577572, 1, 1, 1, 1, 1,
-0.4465355, -0.1776522, -2.523099, 1, 1, 1, 1, 1,
-0.441505, -0.4403619, -0.5668581, 1, 1, 1, 1, 1,
-0.4400299, -1.114304, -4.355481, 1, 1, 1, 1, 1,
-0.4360688, 0.3694384, -0.9761749, 1, 1, 1, 1, 1,
-0.4343426, 0.6031547, -0.1029994, 1, 1, 1, 1, 1,
-0.4341087, 0.2790115, -1.597847, 1, 1, 1, 1, 1,
-0.433825, 0.4864487, -0.3822474, 1, 1, 1, 1, 1,
-0.4335358, 0.8769082, 0.05119853, 1, 1, 1, 1, 1,
-0.4334954, 0.6719698, -0.01660621, 0, 0, 1, 1, 1,
-0.4316822, 1.069973, 0.02607446, 1, 0, 0, 1, 1,
-0.4305897, -0.116102, -2.344326, 1, 0, 0, 1, 1,
-0.4295689, 0.7120169, -0.7222105, 1, 0, 0, 1, 1,
-0.4237556, -2.112304, -3.53395, 1, 0, 0, 1, 1,
-0.4226953, 0.8737459, 1.033048, 1, 0, 0, 1, 1,
-0.4189561, -1.183274, -4.026711, 0, 0, 0, 1, 1,
-0.418956, -0.3397951, -3.90993, 0, 0, 0, 1, 1,
-0.4161598, -1.486551, -3.376672, 0, 0, 0, 1, 1,
-0.4161525, 0.3891181, -1.376154, 0, 0, 0, 1, 1,
-0.4139344, 0.4452836, -0.7417847, 0, 0, 0, 1, 1,
-0.4109688, -1.135041, -2.453174, 0, 0, 0, 1, 1,
-0.4076681, -0.7379684, -1.845266, 0, 0, 0, 1, 1,
-0.4023625, -0.1271285, -0.5136708, 1, 1, 1, 1, 1,
-0.399505, -1.160686, -4.019078, 1, 1, 1, 1, 1,
-0.3977499, 0.5321022, -1.586157, 1, 1, 1, 1, 1,
-0.3976396, -0.283746, -0.3277307, 1, 1, 1, 1, 1,
-0.3911236, -0.1231574, -2.299574, 1, 1, 1, 1, 1,
-0.3893771, -1.635879, -4.202494, 1, 1, 1, 1, 1,
-0.386098, -0.1743796, -0.6358395, 1, 1, 1, 1, 1,
-0.3853282, -0.6049142, -1.796482, 1, 1, 1, 1, 1,
-0.3828068, 0.2973381, -2.393718, 1, 1, 1, 1, 1,
-0.3759112, 0.2868313, -0.6569107, 1, 1, 1, 1, 1,
-0.3752445, 0.07993968, -1.124428, 1, 1, 1, 1, 1,
-0.3746322, -0.635027, -3.971743, 1, 1, 1, 1, 1,
-0.3735424, 0.7883201, -1.583316, 1, 1, 1, 1, 1,
-0.3732085, -1.34489, -3.087245, 1, 1, 1, 1, 1,
-0.3709951, -1.6581, -4.075558, 1, 1, 1, 1, 1,
-0.3705211, 1.718364, 0.3296255, 0, 0, 1, 1, 1,
-0.3702789, -0.09386066, -2.300438, 1, 0, 0, 1, 1,
-0.3694004, -0.8487724, -2.56522, 1, 0, 0, 1, 1,
-0.3657071, 0.7929403, -2.372381, 1, 0, 0, 1, 1,
-0.3643251, 0.7031624, 1.083289, 1, 0, 0, 1, 1,
-0.3641232, 0.1530475, -0.4010758, 1, 0, 0, 1, 1,
-0.3611763, -0.4120907, -0.8258952, 0, 0, 0, 1, 1,
-0.3606262, 0.4410541, -0.1087281, 0, 0, 0, 1, 1,
-0.3597952, 1.104749, -0.3411071, 0, 0, 0, 1, 1,
-0.3576001, -1.629443, -3.82517, 0, 0, 0, 1, 1,
-0.3536161, 2.353846, -0.9448454, 0, 0, 0, 1, 1,
-0.3502451, 0.8412226, 0.7427868, 0, 0, 0, 1, 1,
-0.3499015, 0.5730082, 0.1370107, 0, 0, 0, 1, 1,
-0.345584, 0.01124655, -2.277194, 1, 1, 1, 1, 1,
-0.3447826, -0.08005183, -1.906635, 1, 1, 1, 1, 1,
-0.3445645, -0.3348292, -1.88071, 1, 1, 1, 1, 1,
-0.3390011, -3.018432, -2.669201, 1, 1, 1, 1, 1,
-0.3357231, 0.3703344, -1.606072, 1, 1, 1, 1, 1,
-0.3343803, -4.001853, -3.111274, 1, 1, 1, 1, 1,
-0.3324251, 0.8298008, -1.067166, 1, 1, 1, 1, 1,
-0.3294722, 0.7846563, -0.7470611, 1, 1, 1, 1, 1,
-0.3260993, -0.1241234, -3.781987, 1, 1, 1, 1, 1,
-0.323945, 1.298857, -1.926935, 1, 1, 1, 1, 1,
-0.3229661, 1.844686, 1.32249, 1, 1, 1, 1, 1,
-0.3204254, -0.1772768, -1.582982, 1, 1, 1, 1, 1,
-0.3198529, 1.387195, -0.4179719, 1, 1, 1, 1, 1,
-0.3141207, -0.08851659, -1.921632, 1, 1, 1, 1, 1,
-0.3103012, 0.5878671, 0.0006459973, 1, 1, 1, 1, 1,
-0.3077032, 0.4549208, -1.722715, 0, 0, 1, 1, 1,
-0.3046781, -0.1299607, -3.165975, 1, 0, 0, 1, 1,
-0.2955473, 0.5689827, 0.5410607, 1, 0, 0, 1, 1,
-0.2942876, -0.4586066, -1.905714, 1, 0, 0, 1, 1,
-0.293985, -1.758341, -1.534427, 1, 0, 0, 1, 1,
-0.2870629, 0.162741, -0.7057268, 1, 0, 0, 1, 1,
-0.2844599, 1.542609, -1.559686, 0, 0, 0, 1, 1,
-0.2804539, 0.415084, -0.640551, 0, 0, 0, 1, 1,
-0.2777637, -0.8185065, -3.705011, 0, 0, 0, 1, 1,
-0.2717511, -0.7512445, -3.809359, 0, 0, 0, 1, 1,
-0.2715113, 0.2367108, 0.1099231, 0, 0, 0, 1, 1,
-0.2705472, -1.508572, -3.995706, 0, 0, 0, 1, 1,
-0.2688577, -1.257379, -3.524808, 0, 0, 0, 1, 1,
-0.2641453, 0.630702, 0.2192313, 1, 1, 1, 1, 1,
-0.2638474, -0.8685119, -3.83248, 1, 1, 1, 1, 1,
-0.2625552, -1.288885, -2.159769, 1, 1, 1, 1, 1,
-0.260732, 0.7832506, -0.9795886, 1, 1, 1, 1, 1,
-0.2580779, 0.2092768, -2.141387, 1, 1, 1, 1, 1,
-0.25776, 1.361452, 0.7157462, 1, 1, 1, 1, 1,
-0.2560643, -0.8615777, -3.194463, 1, 1, 1, 1, 1,
-0.2557194, 1.231855, 0.6737245, 1, 1, 1, 1, 1,
-0.2485853, 0.1560695, -1.575596, 1, 1, 1, 1, 1,
-0.2484165, 0.736554, -0.6093157, 1, 1, 1, 1, 1,
-0.2473326, -1.077746, -3.459642, 1, 1, 1, 1, 1,
-0.2408444, -0.625528, -2.83112, 1, 1, 1, 1, 1,
-0.2380638, 0.9101626, 0.1402429, 1, 1, 1, 1, 1,
-0.2360187, 0.9749547, -2.715471, 1, 1, 1, 1, 1,
-0.2354532, -0.2623557, -3.660688, 1, 1, 1, 1, 1,
-0.2346822, -0.7375669, -3.590304, 0, 0, 1, 1, 1,
-0.2312393, -0.4229533, -3.170439, 1, 0, 0, 1, 1,
-0.2282203, -0.7415692, -4.776966, 1, 0, 0, 1, 1,
-0.2262546, -0.6439733, -4.67831, 1, 0, 0, 1, 1,
-0.2229524, -0.8529843, -4.677046, 1, 0, 0, 1, 1,
-0.2220791, -0.7314373, -4.633847, 1, 0, 0, 1, 1,
-0.2216598, 0.426563, -0.123747, 0, 0, 0, 1, 1,
-0.2196407, 0.807295, -0.7385944, 0, 0, 0, 1, 1,
-0.2195531, -0.3146269, -2.854387, 0, 0, 0, 1, 1,
-0.2194184, 0.3677199, 0.1421781, 0, 0, 0, 1, 1,
-0.2174541, 0.2097076, -0.5731779, 0, 0, 0, 1, 1,
-0.2137974, -0.7125743, -1.508015, 0, 0, 0, 1, 1,
-0.2096166, -0.9317796, -2.681939, 0, 0, 0, 1, 1,
-0.2056231, -1.462983, -0.9017938, 1, 1, 1, 1, 1,
-0.1996157, -0.7747064, -3.493871, 1, 1, 1, 1, 1,
-0.1980439, 1.079786, -0.4592767, 1, 1, 1, 1, 1,
-0.196894, 0.6398526, -0.2261809, 1, 1, 1, 1, 1,
-0.1931389, -0.7321361, -2.660067, 1, 1, 1, 1, 1,
-0.1923115, 0.4040001, 0.8743953, 1, 1, 1, 1, 1,
-0.1904561, -0.5444574, -3.854323, 1, 1, 1, 1, 1,
-0.1902156, 2.573673, 0.1791046, 1, 1, 1, 1, 1,
-0.1842648, 0.2355215, -1.966163, 1, 1, 1, 1, 1,
-0.1818106, 0.870436, -1.498255, 1, 1, 1, 1, 1,
-0.1793041, -0.2085359, -3.914776, 1, 1, 1, 1, 1,
-0.1778424, -0.5535291, -2.254555, 1, 1, 1, 1, 1,
-0.1765328, 1.291415, -0.7284821, 1, 1, 1, 1, 1,
-0.1743823, -0.7232657, -3.35025, 1, 1, 1, 1, 1,
-0.1726515, 0.1269048, 0.3121467, 1, 1, 1, 1, 1,
-0.1698613, 0.9029428, 0.3484962, 0, 0, 1, 1, 1,
-0.1618575, 0.3487704, 0.9233639, 1, 0, 0, 1, 1,
-0.1604388, 0.1653511, -0.1434513, 1, 0, 0, 1, 1,
-0.1591486, 1.12973, -1.262908, 1, 0, 0, 1, 1,
-0.1587704, 0.09482132, -0.7935426, 1, 0, 0, 1, 1,
-0.1566026, -2.373683, -3.928173, 1, 0, 0, 1, 1,
-0.1560487, -0.5776801, -2.300137, 0, 0, 0, 1, 1,
-0.1531292, -1.118308, -2.844336, 0, 0, 0, 1, 1,
-0.1518147, -0.6419913, -3.645881, 0, 0, 0, 1, 1,
-0.141588, -0.8405058, -0.9049754, 0, 0, 0, 1, 1,
-0.1376566, 0.5504117, -1.367384, 0, 0, 0, 1, 1,
-0.131028, -0.4068194, -2.079526, 0, 0, 0, 1, 1,
-0.1260087, 1.283009, -0.9182026, 0, 0, 0, 1, 1,
-0.1234461, 0.5269901, 2.124221, 1, 1, 1, 1, 1,
-0.1232014, -0.1914637, -2.770173, 1, 1, 1, 1, 1,
-0.122804, -0.4381016, -2.894849, 1, 1, 1, 1, 1,
-0.1199945, -0.6015384, -3.462903, 1, 1, 1, 1, 1,
-0.119235, -1.268196, -3.05842, 1, 1, 1, 1, 1,
-0.1187641, -0.6222543, -2.318976, 1, 1, 1, 1, 1,
-0.1142301, 0.6624649, 0.5600545, 1, 1, 1, 1, 1,
-0.1129802, -0.5182112, -3.14179, 1, 1, 1, 1, 1,
-0.1068133, -0.1535617, -2.285735, 1, 1, 1, 1, 1,
-0.1034681, -0.6102019, -3.411176, 1, 1, 1, 1, 1,
-0.09676349, -1.864891, -1.795952, 1, 1, 1, 1, 1,
-0.09154309, -2.186274, -2.356801, 1, 1, 1, 1, 1,
-0.09085897, -0.6735394, -3.29878, 1, 1, 1, 1, 1,
-0.08910767, -0.2990752, -3.989565, 1, 1, 1, 1, 1,
-0.08606747, -0.7527242, -2.720393, 1, 1, 1, 1, 1,
-0.08494052, -0.2049649, -3.779425, 0, 0, 1, 1, 1,
-0.08385018, 0.3878864, 0.6494286, 1, 0, 0, 1, 1,
-0.08003834, -1.327437, -3.050331, 1, 0, 0, 1, 1,
-0.0782717, -1.790527, -3.417241, 1, 0, 0, 1, 1,
-0.07409171, -0.5675214, -3.655795, 1, 0, 0, 1, 1,
-0.0723397, 0.7396678, 1.111312, 1, 0, 0, 1, 1,
-0.07186039, -1.279015, -2.586799, 0, 0, 0, 1, 1,
-0.07082697, -0.1419216, -0.8265455, 0, 0, 0, 1, 1,
-0.06978247, -1.357149, -3.288025, 0, 0, 0, 1, 1,
-0.05694363, -0.3562427, -3.631531, 0, 0, 0, 1, 1,
-0.05609632, -0.7681825, -3.014057, 0, 0, 0, 1, 1,
-0.05170517, 1.080759, 2.224442, 0, 0, 0, 1, 1,
-0.04584857, 0.3213108, -1.744607, 0, 0, 0, 1, 1,
-0.04470181, 1.553429, -0.8705865, 1, 1, 1, 1, 1,
-0.04224532, -0.06046603, -3.049342, 1, 1, 1, 1, 1,
-0.04104422, 0.9991428, 1.079067, 1, 1, 1, 1, 1,
-0.04020218, 0.3085332, -0.6684985, 1, 1, 1, 1, 1,
-0.03898481, 0.6634935, -0.8118785, 1, 1, 1, 1, 1,
-0.03796818, -1.107506, 0.02797122, 1, 1, 1, 1, 1,
-0.03415455, 0.2013331, -1.43447, 1, 1, 1, 1, 1,
-0.03344752, -0.6571751, -3.906939, 1, 1, 1, 1, 1,
-0.03294715, 1.359756, 1.535798, 1, 1, 1, 1, 1,
-0.03280873, 1.624367, -0.1727532, 1, 1, 1, 1, 1,
-0.03267748, 0.04618793, -1.611159, 1, 1, 1, 1, 1,
-0.0281542, 1.091717, 0.4313061, 1, 1, 1, 1, 1,
-0.02145244, 0.03330595, -0.7651521, 1, 1, 1, 1, 1,
-0.02110327, -0.8243202, -2.903744, 1, 1, 1, 1, 1,
-0.01250383, -0.2699326, -3.047227, 1, 1, 1, 1, 1,
-0.008095893, 0.455695, 0.758521, 0, 0, 1, 1, 1,
-0.006991483, -0.5216338, -5.041874, 1, 0, 0, 1, 1,
-0.006126254, 0.2897915, -1.802792, 1, 0, 0, 1, 1,
-0.00371015, 1.861785, 0.83061, 1, 0, 0, 1, 1,
-0.002940602, 1.08555, 0.4795055, 1, 0, 0, 1, 1,
-0.001245011, -1.648619, -5.215637, 1, 0, 0, 1, 1,
-0.000915106, 1.317512, 1.237726, 0, 0, 0, 1, 1,
-0.0006672444, -1.187067, -3.089527, 0, 0, 0, 1, 1,
0.002048241, -0.7448176, 3.346754, 0, 0, 0, 1, 1,
0.002832819, 0.6458582, -0.3285185, 0, 0, 0, 1, 1,
0.003817139, 0.004747204, 0.1853717, 0, 0, 0, 1, 1,
0.004048191, 0.6548228, -1.094915, 0, 0, 0, 1, 1,
0.006201273, 1.655082, 2.822599, 0, 0, 0, 1, 1,
0.006794683, -0.1523709, 3.504433, 1, 1, 1, 1, 1,
0.008172587, -0.8919739, 3.302364, 1, 1, 1, 1, 1,
0.01025207, -0.6322695, 3.503553, 1, 1, 1, 1, 1,
0.01097284, 0.9595773, -0.836121, 1, 1, 1, 1, 1,
0.01278493, -0.01139565, 2.587181, 1, 1, 1, 1, 1,
0.01446794, 0.005535344, 1.02471, 1, 1, 1, 1, 1,
0.01567463, 0.8782627, 0.8305964, 1, 1, 1, 1, 1,
0.01620005, 0.6541219, -0.9617855, 1, 1, 1, 1, 1,
0.01795575, -0.4072089, 3.147962, 1, 1, 1, 1, 1,
0.02321152, -3.203995, 2.345275, 1, 1, 1, 1, 1,
0.02497113, 0.3671198, -0.7110653, 1, 1, 1, 1, 1,
0.02811827, -0.8375244, 3.775637, 1, 1, 1, 1, 1,
0.02929689, 1.021006, -1.050904, 1, 1, 1, 1, 1,
0.03034616, -1.04703, 2.107072, 1, 1, 1, 1, 1,
0.03239124, 1.173801, 0.6645404, 1, 1, 1, 1, 1,
0.03481369, -1.949478, 3.778276, 0, 0, 1, 1, 1,
0.03483555, -0.6252105, 3.334533, 1, 0, 0, 1, 1,
0.03503603, 0.9911321, 0.8852574, 1, 0, 0, 1, 1,
0.03646066, -0.7658172, 3.64796, 1, 0, 0, 1, 1,
0.03676744, -0.1629569, 3.158371, 1, 0, 0, 1, 1,
0.0371694, 0.3190198, 1.009438, 1, 0, 0, 1, 1,
0.03773478, -1.942259, 3.136056, 0, 0, 0, 1, 1,
0.0404142, -0.1227292, 2.878004, 0, 0, 0, 1, 1,
0.04643313, -0.1744145, 3.892436, 0, 0, 0, 1, 1,
0.0473622, -0.01305842, 2.12858, 0, 0, 0, 1, 1,
0.04828639, 0.07108051, 1.110764, 0, 0, 0, 1, 1,
0.04951226, 0.2459421, -1.674495, 0, 0, 0, 1, 1,
0.05193397, 1.016229, 1.619018, 0, 0, 0, 1, 1,
0.05762424, 0.2217201, -0.7948112, 1, 1, 1, 1, 1,
0.05935827, -0.28747, 4.998722, 1, 1, 1, 1, 1,
0.05967634, 0.8508688, 0.206214, 1, 1, 1, 1, 1,
0.06179344, 1.094839, 1.870611, 1, 1, 1, 1, 1,
0.06493659, -0.8283039, 3.430636, 1, 1, 1, 1, 1,
0.0666252, 0.4650184, -1.683243, 1, 1, 1, 1, 1,
0.07303127, 0.453183, 1.107525, 1, 1, 1, 1, 1,
0.07443546, -2.798829, 2.536938, 1, 1, 1, 1, 1,
0.07881631, 0.006957668, 1.998349, 1, 1, 1, 1, 1,
0.07955012, 0.1511198, -0.7659892, 1, 1, 1, 1, 1,
0.0860817, -0.430749, 4.196633, 1, 1, 1, 1, 1,
0.08822875, 0.7862266, 0.3884672, 1, 1, 1, 1, 1,
0.09813409, -0.3925577, 3.501108, 1, 1, 1, 1, 1,
0.105149, -1.110878, 3.058091, 1, 1, 1, 1, 1,
0.1092283, -0.8060941, 2.560835, 1, 1, 1, 1, 1,
0.1113134, -0.9456024, 1.179877, 0, 0, 1, 1, 1,
0.1113767, -0.4276897, 4.64914, 1, 0, 0, 1, 1,
0.1154358, -0.6225829, 3.267174, 1, 0, 0, 1, 1,
0.1164218, 0.5340565, 0.8072107, 1, 0, 0, 1, 1,
0.1169463, 0.2572421, -0.1696928, 1, 0, 0, 1, 1,
0.1249509, 1.380574, 0.7299926, 1, 0, 0, 1, 1,
0.1267262, 1.285835, 2.739803, 0, 0, 0, 1, 1,
0.1285117, -0.9794074, 2.892309, 0, 0, 0, 1, 1,
0.1307253, -0.3517155, 3.478798, 0, 0, 0, 1, 1,
0.1312135, 0.6580002, 1.747628, 0, 0, 0, 1, 1,
0.132207, -0.7615471, 2.008028, 0, 0, 0, 1, 1,
0.1337645, 1.14083, 0.7425881, 0, 0, 0, 1, 1,
0.1344049, -0.6792101, 3.629128, 0, 0, 0, 1, 1,
0.1374495, 0.6741797, 1.257399, 1, 1, 1, 1, 1,
0.1393792, -0.3797749, 2.891152, 1, 1, 1, 1, 1,
0.1407064, -0.5059299, -0.1933165, 1, 1, 1, 1, 1,
0.1473159, -0.9122615, 3.658762, 1, 1, 1, 1, 1,
0.1504748, 0.1783236, 2.250206, 1, 1, 1, 1, 1,
0.1528705, 0.3363554, -0.8023984, 1, 1, 1, 1, 1,
0.1531144, -0.8688608, 2.231165, 1, 1, 1, 1, 1,
0.155939, 1.71439, -0.3738957, 1, 1, 1, 1, 1,
0.1574961, -1.816325, 3.888462, 1, 1, 1, 1, 1,
0.1617442, 1.200917, -0.02053325, 1, 1, 1, 1, 1,
0.1634088, -0.7905562, 2.497273, 1, 1, 1, 1, 1,
0.1641974, -1.306866, 2.366251, 1, 1, 1, 1, 1,
0.1716902, -0.7403068, 4.337457, 1, 1, 1, 1, 1,
0.1766211, -1.135615, 1.919635, 1, 1, 1, 1, 1,
0.1840978, -0.03566986, 0.6436108, 1, 1, 1, 1, 1,
0.1842699, 0.4468837, 1.012841, 0, 0, 1, 1, 1,
0.1857283, -0.2360942, 1.853294, 1, 0, 0, 1, 1,
0.1869831, 0.8366247, 1.235629, 1, 0, 0, 1, 1,
0.1891429, 0.9441725, 0.0004285094, 1, 0, 0, 1, 1,
0.1933517, 0.03017264, 0.9851087, 1, 0, 0, 1, 1,
0.1944961, 0.04633268, 0.1412259, 1, 0, 0, 1, 1,
0.2019258, 1.794752, 1.358921, 0, 0, 0, 1, 1,
0.2133916, -0.6192803, 4.246126, 0, 0, 0, 1, 1,
0.2166074, 0.401065, 0.6235721, 0, 0, 0, 1, 1,
0.2166837, -0.4500409, 2.214513, 0, 0, 0, 1, 1,
0.2167237, -0.44606, 3.457593, 0, 0, 0, 1, 1,
0.2169035, 0.4959578, 0.1483325, 0, 0, 0, 1, 1,
0.2202023, -0.6323229, 2.263224, 0, 0, 0, 1, 1,
0.2231239, -0.6398601, 2.545052, 1, 1, 1, 1, 1,
0.224334, 1.136802, 0.6302798, 1, 1, 1, 1, 1,
0.2294107, 0.7497537, -0.03431591, 1, 1, 1, 1, 1,
0.2311531, -0.5378948, 2.644219, 1, 1, 1, 1, 1,
0.2316866, 0.05178991, 1.698189, 1, 1, 1, 1, 1,
0.2324795, 0.5858541, 1.839048, 1, 1, 1, 1, 1,
0.2341628, -0.5827587, 2.660475, 1, 1, 1, 1, 1,
0.2348797, 0.408628, 2.101128, 1, 1, 1, 1, 1,
0.2359127, 0.767987, 0.0360174, 1, 1, 1, 1, 1,
0.2372192, 0.5417717, 0.424977, 1, 1, 1, 1, 1,
0.2422195, 1.767896, 0.7109948, 1, 1, 1, 1, 1,
0.2437297, 0.9959224, 0.7829965, 1, 1, 1, 1, 1,
0.2450669, 1.422201, 0.1938968, 1, 1, 1, 1, 1,
0.246249, -1.019962, 3.513865, 1, 1, 1, 1, 1,
0.246846, 1.010264, 0.9717962, 1, 1, 1, 1, 1,
0.2468813, -0.4164192, 2.182269, 0, 0, 1, 1, 1,
0.2550964, -0.9889262, 2.501197, 1, 0, 0, 1, 1,
0.2586576, 0.06138026, 0.3719087, 1, 0, 0, 1, 1,
0.2617772, 0.7523722, -0.2819691, 1, 0, 0, 1, 1,
0.2621255, -0.6820743, 3.665334, 1, 0, 0, 1, 1,
0.2623372, -1.240003, 2.666143, 1, 0, 0, 1, 1,
0.262986, 0.4782247, -0.09521321, 0, 0, 0, 1, 1,
0.2636409, -0.5112981, 3.842933, 0, 0, 0, 1, 1,
0.2653694, -2.184097, 1.92885, 0, 0, 0, 1, 1,
0.2678467, 0.1243271, 1.029041, 0, 0, 0, 1, 1,
0.2844903, -0.4404506, 2.454478, 0, 0, 0, 1, 1,
0.2850169, 0.8518093, 0.1243536, 0, 0, 0, 1, 1,
0.2860054, 1.574939, 0.3377857, 0, 0, 0, 1, 1,
0.287147, -1.002889, 2.87138, 1, 1, 1, 1, 1,
0.2875993, 1.864465, -0.5579464, 1, 1, 1, 1, 1,
0.2882989, 0.001950323, 3.917725, 1, 1, 1, 1, 1,
0.2910251, -0.5084816, 1.396482, 1, 1, 1, 1, 1,
0.2946456, -0.1988411, 1.572391, 1, 1, 1, 1, 1,
0.294808, -0.5896674, 3.319754, 1, 1, 1, 1, 1,
0.2950564, 0.2582648, 0.9152008, 1, 1, 1, 1, 1,
0.3016953, -0.4801555, 1.4472, 1, 1, 1, 1, 1,
0.3026966, -0.7447997, 1.103104, 1, 1, 1, 1, 1,
0.3056371, 0.2600278, 0.8257406, 1, 1, 1, 1, 1,
0.3057462, -0.7677472, 3.218682, 1, 1, 1, 1, 1,
0.3120849, -1.777947, 2.336287, 1, 1, 1, 1, 1,
0.316556, -0.353582, 1.816163, 1, 1, 1, 1, 1,
0.3185505, 0.4130012, 1.416728, 1, 1, 1, 1, 1,
0.3193197, 1.462663, 2.517246, 1, 1, 1, 1, 1,
0.3222356, -1.40006, 1.399321, 0, 0, 1, 1, 1,
0.3232382, -0.2750843, 3.489635, 1, 0, 0, 1, 1,
0.3245546, 0.6638926, 1.114057, 1, 0, 0, 1, 1,
0.3269572, 0.4059188, 2.071019, 1, 0, 0, 1, 1,
0.3280548, -1.427805, 2.814687, 1, 0, 0, 1, 1,
0.3291208, 0.6343536, -0.7571667, 1, 0, 0, 1, 1,
0.3299914, -0.2927152, 1.482839, 0, 0, 0, 1, 1,
0.3307158, -2.027297, 4.141131, 0, 0, 0, 1, 1,
0.3334334, 2.047845, -0.1213696, 0, 0, 0, 1, 1,
0.334143, -0.4518521, 3.059116, 0, 0, 0, 1, 1,
0.335141, -0.9637351, 1.948909, 0, 0, 0, 1, 1,
0.3352914, -0.7467366, 0.7218908, 0, 0, 0, 1, 1,
0.3489286, -1.616941, 2.917084, 0, 0, 0, 1, 1,
0.353602, 0.2782829, 1.41644, 1, 1, 1, 1, 1,
0.3536429, 0.3443298, 0.3609721, 1, 1, 1, 1, 1,
0.3547653, 0.6029462, -0.03549725, 1, 1, 1, 1, 1,
0.3579763, 1.358885, 0.802246, 1, 1, 1, 1, 1,
0.3627512, 3.231627, -1.428957, 1, 1, 1, 1, 1,
0.3650933, 0.7609885, -0.5781186, 1, 1, 1, 1, 1,
0.3652471, -0.5498443, 1.375002, 1, 1, 1, 1, 1,
0.3669661, 0.2198424, 0.9773535, 1, 1, 1, 1, 1,
0.3669943, 1.262854, 0.9905167, 1, 1, 1, 1, 1,
0.3673839, 0.5540484, 0.4852299, 1, 1, 1, 1, 1,
0.3711041, -1.037042, 3.156532, 1, 1, 1, 1, 1,
0.371474, 0.8419236, 0.1745123, 1, 1, 1, 1, 1,
0.3752729, -0.4229043, 1.916248, 1, 1, 1, 1, 1,
0.3753905, 1.035398, -0.2688281, 1, 1, 1, 1, 1,
0.3761063, 0.7897356, 1.235285, 1, 1, 1, 1, 1,
0.376795, 2.825293, -0.4885077, 0, 0, 1, 1, 1,
0.3780289, -0.3916282, 3.781627, 1, 0, 0, 1, 1,
0.3780752, 0.6743721, -0.1791098, 1, 0, 0, 1, 1,
0.3784727, 0.7300004, 0.2159381, 1, 0, 0, 1, 1,
0.3789819, 0.3490277, 1.803654, 1, 0, 0, 1, 1,
0.3832327, 0.5575815, 0.2977558, 1, 0, 0, 1, 1,
0.3876874, 1.084859, 0.1906434, 0, 0, 0, 1, 1,
0.3880306, -0.5657639, 2.171536, 0, 0, 0, 1, 1,
0.3889664, -0.3287045, 0.5038115, 0, 0, 0, 1, 1,
0.3941935, -0.2226285, 1.679592, 0, 0, 0, 1, 1,
0.3945943, 0.2801475, 1.641685, 0, 0, 0, 1, 1,
0.4055139, 0.0117168, 1.531991, 0, 0, 0, 1, 1,
0.4061427, 1.004023, -0.3490633, 0, 0, 0, 1, 1,
0.4066649, 0.196593, 2.652726, 1, 1, 1, 1, 1,
0.4068903, 0.1952081, 0.4380165, 1, 1, 1, 1, 1,
0.4072213, 1.037395, 0.4948065, 1, 1, 1, 1, 1,
0.4104899, 0.4313672, 0.5742754, 1, 1, 1, 1, 1,
0.4114097, 0.1518656, 0.9581685, 1, 1, 1, 1, 1,
0.4129178, -0.05203118, 0.07943806, 1, 1, 1, 1, 1,
0.4130645, 0.6324859, 1.702101, 1, 1, 1, 1, 1,
0.414502, -0.3687591, 3.382809, 1, 1, 1, 1, 1,
0.4201262, -0.6829969, 1.310069, 1, 1, 1, 1, 1,
0.4221427, 0.4260148, 0.959228, 1, 1, 1, 1, 1,
0.4242571, 0.6046894, 2.814065, 1, 1, 1, 1, 1,
0.4293911, 1.89261, -0.7489785, 1, 1, 1, 1, 1,
0.4349841, 0.07723373, 1.144153, 1, 1, 1, 1, 1,
0.4404405, 0.7493846, -0.09396637, 1, 1, 1, 1, 1,
0.4427571, 2.505468, 1.038882, 1, 1, 1, 1, 1,
0.4427947, 1.300144, 1.826549, 0, 0, 1, 1, 1,
0.4453275, 1.162857, 0.6581375, 1, 0, 0, 1, 1,
0.4471032, -0.1399451, 1.510699, 1, 0, 0, 1, 1,
0.4486341, -0.9638669, 1.632329, 1, 0, 0, 1, 1,
0.4506327, -0.9773211, 2.413301, 1, 0, 0, 1, 1,
0.4512199, -2.568495, 3.115529, 1, 0, 0, 1, 1,
0.4572043, -1.412019, 3.625276, 0, 0, 0, 1, 1,
0.4613075, -2.005733, 1.766929, 0, 0, 0, 1, 1,
0.4629486, -0.4993871, 1.775497, 0, 0, 0, 1, 1,
0.463446, -1.66095, 3.32692, 0, 0, 0, 1, 1,
0.4663227, -0.7016842, 2.274035, 0, 0, 0, 1, 1,
0.4708128, 1.503871, 1.405946, 0, 0, 0, 1, 1,
0.4712314, -0.135747, 0.04162802, 0, 0, 0, 1, 1,
0.4811026, -0.4481883, 2.621067, 1, 1, 1, 1, 1,
0.484266, 1.014066, -0.3925393, 1, 1, 1, 1, 1,
0.4845169, -0.8085554, 1.960912, 1, 1, 1, 1, 1,
0.486462, -1.209556, 3.048354, 1, 1, 1, 1, 1,
0.487582, 1.436304, 0.2174062, 1, 1, 1, 1, 1,
0.4913445, -0.6544632, 1.405707, 1, 1, 1, 1, 1,
0.4929841, -1.323136, 1.904929, 1, 1, 1, 1, 1,
0.4935369, -2.340322, 2.883297, 1, 1, 1, 1, 1,
0.4958877, -1.382299, 2.158561, 1, 1, 1, 1, 1,
0.4993128, -1.063931, 3.977598, 1, 1, 1, 1, 1,
0.5006791, -0.8629885, 3.083413, 1, 1, 1, 1, 1,
0.5086328, -0.06162652, 2.960753, 1, 1, 1, 1, 1,
0.5091383, -0.3630711, 3.396129, 1, 1, 1, 1, 1,
0.5108557, -0.889341, 3.950775, 1, 1, 1, 1, 1,
0.516901, 0.4431245, 0.6892849, 1, 1, 1, 1, 1,
0.5170903, 0.2078627, 2.194486, 0, 0, 1, 1, 1,
0.5182878, 2.567438, 0.3915696, 1, 0, 0, 1, 1,
0.5184053, -0.1741742, 1.253424, 1, 0, 0, 1, 1,
0.5216457, -1.592234, 3.516155, 1, 0, 0, 1, 1,
0.5220641, 0.7531372, 0.1392933, 1, 0, 0, 1, 1,
0.5226633, -1.128202, 3.993624, 1, 0, 0, 1, 1,
0.5279557, -0.02450348, -0.2340595, 0, 0, 0, 1, 1,
0.5355563, -1.513556, 2.168337, 0, 0, 0, 1, 1,
0.5400204, -0.9645633, 2.976275, 0, 0, 0, 1, 1,
0.5419667, 0.4547088, -0.9899809, 0, 0, 0, 1, 1,
0.5427438, -0.5417967, 2.450608, 0, 0, 0, 1, 1,
0.5447833, 0.9890445, 1.15364, 0, 0, 0, 1, 1,
0.5473675, -0.9501542, 3.790545, 0, 0, 0, 1, 1,
0.5570827, 1.564085, 0.1161245, 1, 1, 1, 1, 1,
0.5574564, -0.9998135, 1.644176, 1, 1, 1, 1, 1,
0.5594078, -0.0465872, 1.040404, 1, 1, 1, 1, 1,
0.5622973, -1.03159, 1.267096, 1, 1, 1, 1, 1,
0.5632177, -0.05475987, 0.88289, 1, 1, 1, 1, 1,
0.5647124, -1.633167, 1.160254, 1, 1, 1, 1, 1,
0.565753, 1.98652, 2.163702, 1, 1, 1, 1, 1,
0.5744516, -1.925867, 4.124151, 1, 1, 1, 1, 1,
0.580069, 0.3507205, 0.4503954, 1, 1, 1, 1, 1,
0.5903226, -0.4266721, 1.947606, 1, 1, 1, 1, 1,
0.5933416, 1.114032, 1.136601, 1, 1, 1, 1, 1,
0.595318, 0.397487, 1.264041, 1, 1, 1, 1, 1,
0.5988242, -1.395575, 4.452825, 1, 1, 1, 1, 1,
0.6024309, 0.3481982, -1.066449, 1, 1, 1, 1, 1,
0.6048724, 0.8448492, -0.5415158, 1, 1, 1, 1, 1,
0.6081444, 0.898726, 1.202134, 0, 0, 1, 1, 1,
0.6137984, -0.8237202, 2.99895, 1, 0, 0, 1, 1,
0.617519, 1.49653, -1.202815, 1, 0, 0, 1, 1,
0.6179621, -0.6478215, 0.6497653, 1, 0, 0, 1, 1,
0.6204649, 0.7125949, -0.07915121, 1, 0, 0, 1, 1,
0.6263615, 1.744542, 0.3855162, 1, 0, 0, 1, 1,
0.6267654, 3.304077, 0.2276356, 0, 0, 0, 1, 1,
0.6280174, 0.2438089, 2.370693, 0, 0, 0, 1, 1,
0.6321152, -1.401426, 3.427587, 0, 0, 0, 1, 1,
0.634535, -0.1045727, 3.935557, 0, 0, 0, 1, 1,
0.635158, 0.2918289, -0.02989369, 0, 0, 0, 1, 1,
0.6368145, -0.8695243, 0.5827805, 0, 0, 0, 1, 1,
0.6426798, -1.292698, 2.788314, 0, 0, 0, 1, 1,
0.6433938, 0.8147056, 1.724174, 1, 1, 1, 1, 1,
0.6473609, -0.221484, 0.9573986, 1, 1, 1, 1, 1,
0.6483099, -2.142937, 2.855616, 1, 1, 1, 1, 1,
0.6516551, 0.3713564, 2.013562, 1, 1, 1, 1, 1,
0.6554334, -1.782173, 2.728936, 1, 1, 1, 1, 1,
0.6606382, 0.3861102, 1.543897, 1, 1, 1, 1, 1,
0.6636686, 0.3184814, 0.1037709, 1, 1, 1, 1, 1,
0.6709773, -0.05030171, 0.627738, 1, 1, 1, 1, 1,
0.6807718, -0.1442117, 0.9055112, 1, 1, 1, 1, 1,
0.6817319, -0.6053041, 3.733664, 1, 1, 1, 1, 1,
0.6830411, 0.4773623, 0.5530726, 1, 1, 1, 1, 1,
0.6833503, -0.9999319, 1.614648, 1, 1, 1, 1, 1,
0.6871595, 0.5751886, 2.257828, 1, 1, 1, 1, 1,
0.6883987, 0.9713306, -0.2375311, 1, 1, 1, 1, 1,
0.6892903, -0.1273979, 1.622062, 1, 1, 1, 1, 1,
0.6893845, -0.8169436, 3.561507, 0, 0, 1, 1, 1,
0.6910716, -0.7573767, 3.375138, 1, 0, 0, 1, 1,
0.6912128, 0.6715559, 0.6819121, 1, 0, 0, 1, 1,
0.6912186, -0.3849165, 1.66803, 1, 0, 0, 1, 1,
0.6916167, 0.3843176, 2.033727, 1, 0, 0, 1, 1,
0.6938784, -0.6637449, 2.192108, 1, 0, 0, 1, 1,
0.6955941, 0.3717566, 0.3388868, 0, 0, 0, 1, 1,
0.7066479, 0.7501942, 0.5333332, 0, 0, 0, 1, 1,
0.7072902, -0.477531, 2.859329, 0, 0, 0, 1, 1,
0.7137762, 0.7455035, 0.3573983, 0, 0, 0, 1, 1,
0.7158825, 1.578498, -0.4723963, 0, 0, 0, 1, 1,
0.7192038, 0.1423134, 1.216567, 0, 0, 0, 1, 1,
0.7195092, 2.120577, 0.9278474, 0, 0, 0, 1, 1,
0.7275215, -1.529751, 5.465536, 1, 1, 1, 1, 1,
0.7287735, -1.455194, 1.973794, 1, 1, 1, 1, 1,
0.7349172, 0.7379655, 1.261978, 1, 1, 1, 1, 1,
0.7375955, 2.376523, 0.3611595, 1, 1, 1, 1, 1,
0.7449878, -2.045361, 1.336357, 1, 1, 1, 1, 1,
0.749914, 0.2992824, 2.763244, 1, 1, 1, 1, 1,
0.7506022, -1.083142, 1.507174, 1, 1, 1, 1, 1,
0.7550206, 0.3751029, 1.90545, 1, 1, 1, 1, 1,
0.7566824, 0.4796281, -0.751336, 1, 1, 1, 1, 1,
0.7591119, 0.4208413, 1.550663, 1, 1, 1, 1, 1,
0.7616698, -1.254624, 2.346353, 1, 1, 1, 1, 1,
0.7662987, -1.216392, 0.5997976, 1, 1, 1, 1, 1,
0.7727581, 1.16951, 0.2193239, 1, 1, 1, 1, 1,
0.7855228, 0.714542, -0.3283916, 1, 1, 1, 1, 1,
0.788298, -0.488161, 1.184572, 1, 1, 1, 1, 1,
0.7895264, -0.3132605, 1.315814, 0, 0, 1, 1, 1,
0.7899062, 0.1333273, 1.1679, 1, 0, 0, 1, 1,
0.7915872, 0.3906837, 2.679854, 1, 0, 0, 1, 1,
0.7995418, -0.7237271, 1.731401, 1, 0, 0, 1, 1,
0.804352, 0.8106509, 1.781042, 1, 0, 0, 1, 1,
0.8063138, 0.315057, 4.019232, 1, 0, 0, 1, 1,
0.8128902, -0.5129594, 3.151294, 0, 0, 0, 1, 1,
0.8145161, -0.3475475, 1.732098, 0, 0, 0, 1, 1,
0.8149497, 1.12058, 1.361966, 0, 0, 0, 1, 1,
0.8223105, -0.1961848, 2.729059, 0, 0, 0, 1, 1,
0.8260008, 0.1564651, 2.340491, 0, 0, 0, 1, 1,
0.8295386, -0.2856904, 1.606937, 0, 0, 0, 1, 1,
0.8312427, 0.3856129, 2.206821, 0, 0, 0, 1, 1,
0.8360808, -0.6996148, 2.222978, 1, 1, 1, 1, 1,
0.8372703, 0.1817703, 2.232903, 1, 1, 1, 1, 1,
0.837446, 0.7434171, 2.67213, 1, 1, 1, 1, 1,
0.8551196, 0.09977949, 0.2843045, 1, 1, 1, 1, 1,
0.8567327, 0.1917943, 1.285971, 1, 1, 1, 1, 1,
0.8634397, -3.00419, 1.949148, 1, 1, 1, 1, 1,
0.865176, 0.6340783, 1.417519, 1, 1, 1, 1, 1,
0.8678399, 0.3175827, 0.1714129, 1, 1, 1, 1, 1,
0.8710947, -0.2924948, 2.976113, 1, 1, 1, 1, 1,
0.8728102, 0.09154621, 1.395757, 1, 1, 1, 1, 1,
0.8754629, -0.8079342, 2.694067, 1, 1, 1, 1, 1,
0.8795674, -1.785432, 3.895359, 1, 1, 1, 1, 1,
0.8838853, -1.292673, 2.811878, 1, 1, 1, 1, 1,
0.9096955, 0.415814, 1.61735, 1, 1, 1, 1, 1,
0.9131377, -1.1623, 2.038055, 1, 1, 1, 1, 1,
0.9140931, 0.8914303, -0.1779807, 0, 0, 1, 1, 1,
0.9147856, -1.407592, 1.690178, 1, 0, 0, 1, 1,
0.9184727, 1.553602, -0.6796548, 1, 0, 0, 1, 1,
0.9333511, 0.1942892, 1.860925, 1, 0, 0, 1, 1,
0.9364155, -1.876002, 4.284966, 1, 0, 0, 1, 1,
0.9372491, -0.6240988, 2.116363, 1, 0, 0, 1, 1,
0.9384552, -0.2461734, 2.924792, 0, 0, 0, 1, 1,
0.9388087, 0.6383776, -0.07801768, 0, 0, 0, 1, 1,
0.9393395, -0.07275776, 2.327394, 0, 0, 0, 1, 1,
0.9503222, 0.3917167, 0.8033742, 0, 0, 0, 1, 1,
0.951974, -0.3674588, 2.832756, 0, 0, 0, 1, 1,
0.9579937, 0.8925069, 1.191886, 0, 0, 0, 1, 1,
0.9583721, -0.001740659, 3.242713, 0, 0, 0, 1, 1,
0.9590514, 0.03948029, -0.5416349, 1, 1, 1, 1, 1,
0.9599444, -0.7392341, 1.087841, 1, 1, 1, 1, 1,
0.9618552, -1.391892, 1.368369, 1, 1, 1, 1, 1,
0.9646999, 0.8450517, -0.05166471, 1, 1, 1, 1, 1,
0.9683173, -0.7507042, 2.05992, 1, 1, 1, 1, 1,
0.9696743, -0.4219223, 4.425562, 1, 1, 1, 1, 1,
0.9707938, -1.461348, 4.136814, 1, 1, 1, 1, 1,
0.9744315, 0.1241169, 2.028754, 1, 1, 1, 1, 1,
0.9819493, 0.4418167, 1.189944, 1, 1, 1, 1, 1,
0.9831023, -2.428861, 2.974662, 1, 1, 1, 1, 1,
0.9856492, 0.7690763, -0.04963557, 1, 1, 1, 1, 1,
0.9891294, -0.7108018, 3.871232, 1, 1, 1, 1, 1,
0.9911001, 1.516466, 1.287422, 1, 1, 1, 1, 1,
0.9918027, -0.9352539, 2.193012, 1, 1, 1, 1, 1,
0.9945518, 0.2998191, 1.851946, 1, 1, 1, 1, 1,
0.9949849, 0.8930659, 2.178172, 0, 0, 1, 1, 1,
1.003068, -0.3080591, 0.09154955, 1, 0, 0, 1, 1,
1.008941, 0.8310069, -0.5498649, 1, 0, 0, 1, 1,
1.009671, -0.08478487, 1.195111, 1, 0, 0, 1, 1,
1.010085, -0.4495584, 1.651121, 1, 0, 0, 1, 1,
1.010603, 1.327572, -1.422246, 1, 0, 0, 1, 1,
1.01518, -1.017284, 2.427561, 0, 0, 0, 1, 1,
1.016928, 0.01894394, 1.295981, 0, 0, 0, 1, 1,
1.017766, 0.6681416, 1.609186, 0, 0, 0, 1, 1,
1.018787, -0.1219019, 1.042453, 0, 0, 0, 1, 1,
1.028859, -0.1495917, 1.32764, 0, 0, 0, 1, 1,
1.044297, -0.5740881, 1.258116, 0, 0, 0, 1, 1,
1.044327, 0.1393302, 3.142602, 0, 0, 0, 1, 1,
1.052912, 2.001111, -0.1963421, 1, 1, 1, 1, 1,
1.063482, 1.631932, -0.4955295, 1, 1, 1, 1, 1,
1.063852, 0.4185285, 1.734909, 1, 1, 1, 1, 1,
1.065346, 0.9316047, -0.174715, 1, 1, 1, 1, 1,
1.07022, 1.079268, 1.515843, 1, 1, 1, 1, 1,
1.073115, -1.32566, 2.133206, 1, 1, 1, 1, 1,
1.075861, -0.4084518, 2.595405, 1, 1, 1, 1, 1,
1.077342, -0.1396411, 0.02908568, 1, 1, 1, 1, 1,
1.083044, 0.7053187, 2.006614, 1, 1, 1, 1, 1,
1.087649, -1.682371, 1.658986, 1, 1, 1, 1, 1,
1.090749, 1.22, 0.3305267, 1, 1, 1, 1, 1,
1.106813, 0.0444016, 2.420169, 1, 1, 1, 1, 1,
1.109666, -0.5976476, 2.851672, 1, 1, 1, 1, 1,
1.11267, 0.3159123, 1.616735, 1, 1, 1, 1, 1,
1.113008, -0.3394439, 0.5322452, 1, 1, 1, 1, 1,
1.113182, 0.2965112, 1.382341, 0, 0, 1, 1, 1,
1.118747, 1.821466, -1.326692, 1, 0, 0, 1, 1,
1.121616, 0.5343016, 0.3937782, 1, 0, 0, 1, 1,
1.125373, 1.154586, 0.9000353, 1, 0, 0, 1, 1,
1.125835, 1.068315, 2.557773, 1, 0, 0, 1, 1,
1.126215, 0.8027748, -0.4894279, 1, 0, 0, 1, 1,
1.129059, -2.121886, 3.307912, 0, 0, 0, 1, 1,
1.129207, -0.6679593, 1.010826, 0, 0, 0, 1, 1,
1.132715, -1.307121, 2.817595, 0, 0, 0, 1, 1,
1.143017, 0.4686494, -0.0790159, 0, 0, 0, 1, 1,
1.14487, 0.06723399, 2.052275, 0, 0, 0, 1, 1,
1.154125, 0.4235267, 2.155146, 0, 0, 0, 1, 1,
1.15991, -1.045694, 1.640323, 0, 0, 0, 1, 1,
1.161695, 0.7933584, 1.008592, 1, 1, 1, 1, 1,
1.171961, 0.4573459, 2.348823, 1, 1, 1, 1, 1,
1.174797, -1.430416, 3.516949, 1, 1, 1, 1, 1,
1.179153, 1.859706, 0.6575428, 1, 1, 1, 1, 1,
1.187972, 0.285582, 0.7309442, 1, 1, 1, 1, 1,
1.188127, -1.321239, 2.229301, 1, 1, 1, 1, 1,
1.188625, 1.112569, 0.9054211, 1, 1, 1, 1, 1,
1.193709, -0.4829203, 0.8323374, 1, 1, 1, 1, 1,
1.197337, 1.209145, 1.500616, 1, 1, 1, 1, 1,
1.203633, -1.493325, 3.912102, 1, 1, 1, 1, 1,
1.206848, -1.380005, 2.52774, 1, 1, 1, 1, 1,
1.212162, -0.1072122, 1.731557, 1, 1, 1, 1, 1,
1.222163, 0.467954, 1.563941, 1, 1, 1, 1, 1,
1.223118, 1.478825, 1.942131, 1, 1, 1, 1, 1,
1.224916, -0.1087657, 2.117249, 1, 1, 1, 1, 1,
1.229048, 1.24249, 0.5692034, 0, 0, 1, 1, 1,
1.248683, 0.8218884, 2.25228, 1, 0, 0, 1, 1,
1.249346, 1.559234, -0.2056773, 1, 0, 0, 1, 1,
1.253888, 1.174327, 1.655726, 1, 0, 0, 1, 1,
1.259957, -1.290468, 4.786816, 1, 0, 0, 1, 1,
1.268189, -0.1305487, 1.955119, 1, 0, 0, 1, 1,
1.271216, -0.2419625, 1.045359, 0, 0, 0, 1, 1,
1.274086, 0.002197703, 1.205404, 0, 0, 0, 1, 1,
1.277321, 0.9876505, 0.4755997, 0, 0, 0, 1, 1,
1.277874, 1.56837, 0.2110804, 0, 0, 0, 1, 1,
1.278102, 0.3377872, 1.984458, 0, 0, 0, 1, 1,
1.279985, 0.8661702, 0.04989764, 0, 0, 0, 1, 1,
1.304055, -1.831483, 3.040047, 0, 0, 0, 1, 1,
1.304359, 0.5409991, 0.1436492, 1, 1, 1, 1, 1,
1.308802, 0.2369937, 1.066856, 1, 1, 1, 1, 1,
1.320657, -1.553016, 1.199623, 1, 1, 1, 1, 1,
1.325573, -0.8672024, 2.594302, 1, 1, 1, 1, 1,
1.328018, -0.2647745, 1.570932, 1, 1, 1, 1, 1,
1.330322, 1.289299, 0.938239, 1, 1, 1, 1, 1,
1.333468, 0.3736738, 2.256253, 1, 1, 1, 1, 1,
1.339294, 0.7170045, -0.04341562, 1, 1, 1, 1, 1,
1.341581, -1.709888, 1.951614, 1, 1, 1, 1, 1,
1.343061, 0.2321396, 2.59291, 1, 1, 1, 1, 1,
1.346027, -0.1812616, 2.059512, 1, 1, 1, 1, 1,
1.353248, -0.13465, 1.728207, 1, 1, 1, 1, 1,
1.354999, 1.423412, 0.4790579, 1, 1, 1, 1, 1,
1.362218, -0.6257011, 2.976007, 1, 1, 1, 1, 1,
1.364719, 0.002269352, 2.06175, 1, 1, 1, 1, 1,
1.381041, -0.6980548, 1.785367, 0, 0, 1, 1, 1,
1.383475, 0.1794211, 1.218664, 1, 0, 0, 1, 1,
1.39219, -1.462781, 2.332376, 1, 0, 0, 1, 1,
1.396, 0.2137461, 2.025133, 1, 0, 0, 1, 1,
1.404833, -0.1875956, 1.981941, 1, 0, 0, 1, 1,
1.408771, 1.017505, 1.147975, 1, 0, 0, 1, 1,
1.421488, 0.4293016, 0.4178081, 0, 0, 0, 1, 1,
1.426761, -0.5098034, -0.03863696, 0, 0, 0, 1, 1,
1.432063, 0.2736671, 1.193115, 0, 0, 0, 1, 1,
1.442554, 2.557291, 0.4397707, 0, 0, 0, 1, 1,
1.453258, 1.057949, 0.5739268, 0, 0, 0, 1, 1,
1.461906, 0.5506223, 0.696206, 0, 0, 0, 1, 1,
1.467846, 0.7853515, 1.826586, 0, 0, 0, 1, 1,
1.4724, 0.6531722, 1.853098, 1, 1, 1, 1, 1,
1.474369, -0.7064809, 2.12603, 1, 1, 1, 1, 1,
1.475738, 0.4617258, -1.038837, 1, 1, 1, 1, 1,
1.483955, -0.6675501, 1.258669, 1, 1, 1, 1, 1,
1.490281, 1.671464, 0.5256053, 1, 1, 1, 1, 1,
1.509913, 0.7145935, 0.04701997, 1, 1, 1, 1, 1,
1.513458, 0.4202341, 1.773072, 1, 1, 1, 1, 1,
1.526784, -0.5725499, 2.608688, 1, 1, 1, 1, 1,
1.531255, 1.078619, -0.06665232, 1, 1, 1, 1, 1,
1.534268, 0.1183749, 1.570306, 1, 1, 1, 1, 1,
1.555548, -0.6553288, 0.8433238, 1, 1, 1, 1, 1,
1.555685, -0.2262142, 3.077887, 1, 1, 1, 1, 1,
1.556, -0.4980788, 2.228908, 1, 1, 1, 1, 1,
1.558828, -0.5582086, 0.5849957, 1, 1, 1, 1, 1,
1.563022, -0.8114413, 2.90854, 1, 1, 1, 1, 1,
1.575301, 0.90717, 2.614386, 0, 0, 1, 1, 1,
1.599029, 0.738395, 1.378783, 1, 0, 0, 1, 1,
1.599639, -0.6673808, 2.274399, 1, 0, 0, 1, 1,
1.614383, 0.3078377, 2.635607, 1, 0, 0, 1, 1,
1.622931, 0.1967179, 1.452026, 1, 0, 0, 1, 1,
1.666451, 0.4249312, 2.561149, 1, 0, 0, 1, 1,
1.666952, 0.7381518, 3.417188, 0, 0, 0, 1, 1,
1.673494, 1.166207, -0.6313332, 0, 0, 0, 1, 1,
1.676857, 1.246761, 0.4800104, 0, 0, 0, 1, 1,
1.687845, 1.101739, 0.1755965, 0, 0, 0, 1, 1,
1.708875, -1.548681, 0.1187501, 0, 0, 0, 1, 1,
1.727692, -0.2550734, 2.293707, 0, 0, 0, 1, 1,
1.743464, 0.4979086, 1.101497, 0, 0, 0, 1, 1,
1.753343, -1.123163, 0.71873, 1, 1, 1, 1, 1,
1.794251, -1.562551, 2.892932, 1, 1, 1, 1, 1,
1.802303, -1.819235, 2.953982, 1, 1, 1, 1, 1,
1.807482, 1.514411, -1.020549, 1, 1, 1, 1, 1,
1.818877, -0.05252757, 2.234845, 1, 1, 1, 1, 1,
1.865905, 1.060587, 1.01448, 1, 1, 1, 1, 1,
1.869459, -1.062317, 1.20018, 1, 1, 1, 1, 1,
1.937955, -0.6388535, 1.813818, 1, 1, 1, 1, 1,
1.954249, -3.213778, 3.645972, 1, 1, 1, 1, 1,
1.959778, 0.6091191, -0.4098959, 1, 1, 1, 1, 1,
1.977981, -0.8629209, 3.200496, 1, 1, 1, 1, 1,
2.002159, -0.1827094, 0.02001755, 1, 1, 1, 1, 1,
2.011721, -1.563361, 1.314933, 1, 1, 1, 1, 1,
2.076218, 1.810162, 0.3968152, 1, 1, 1, 1, 1,
2.127875, -1.142817, 1.416425, 1, 1, 1, 1, 1,
2.130377, 1.236619, 0.428268, 0, 0, 1, 1, 1,
2.141889, 1.774401, 0.370374, 1, 0, 0, 1, 1,
2.145211, 1.979368, 0.6858885, 1, 0, 0, 1, 1,
2.155986, -0.1848415, -0.0955247, 1, 0, 0, 1, 1,
2.15809, 0.1565976, 1.139108, 1, 0, 0, 1, 1,
2.190858, -1.293579, 3.501941, 1, 0, 0, 1, 1,
2.217488, 0.6739444, 2.495448, 0, 0, 0, 1, 1,
2.218539, -1.582893, 2.74661, 0, 0, 0, 1, 1,
2.225263, 0.8817479, -0.1600506, 0, 0, 0, 1, 1,
2.25592, -0.3681465, 2.777539, 0, 0, 0, 1, 1,
2.272623, -0.8173018, 2.192952, 0, 0, 0, 1, 1,
2.318326, 0.3306537, 0.7001861, 0, 0, 0, 1, 1,
2.335393, 0.300157, 0.5976386, 0, 0, 0, 1, 1,
2.335892, -0.7152756, 1.410871, 1, 1, 1, 1, 1,
2.471352, 0.7148724, 2.526387, 1, 1, 1, 1, 1,
2.557318, 0.2624322, -0.06343028, 1, 1, 1, 1, 1,
2.852222, -0.2856102, 1.615419, 1, 1, 1, 1, 1,
3.008648, 0.1946849, 1.96497, 1, 1, 1, 1, 1,
3.055657, 0.1573047, 1.544526, 1, 1, 1, 1, 1,
3.065538, 1.900157, 0.4819514, 1, 1, 1, 1, 1
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
var radius = 9.780349;
var distance = 34.35306;
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
mvMatrix.translate( 0.08184457, 0.3488882, -0.1249492 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.35306);
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
