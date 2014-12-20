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
-3.093624, -0.4074965, -2.466004, 1, 0, 0, 1,
-3.087146, 0.5336022, -0.7911434, 1, 0.007843138, 0, 1,
-2.894284, -0.2111389, -0.7025969, 1, 0.01176471, 0, 1,
-2.883687, 0.1928854, -2.003121, 1, 0.01960784, 0, 1,
-2.856388, -1.036854, -2.523683, 1, 0.02352941, 0, 1,
-2.7915, -0.2644828, -0.9527835, 1, 0.03137255, 0, 1,
-2.77159, 0.3579983, -1.353509, 1, 0.03529412, 0, 1,
-2.710696, 0.6175534, -1.41617, 1, 0.04313726, 0, 1,
-2.472104, 1.443258, -2.082443, 1, 0.04705882, 0, 1,
-2.448169, 0.4483677, -0.8250712, 1, 0.05490196, 0, 1,
-2.318658, -1.004397, -3.176907, 1, 0.05882353, 0, 1,
-2.266551, 0.2653173, -2.900945, 1, 0.06666667, 0, 1,
-2.235862, -0.8498357, -0.09168896, 1, 0.07058824, 0, 1,
-2.230491, 1.583999, -0.3886738, 1, 0.07843138, 0, 1,
-2.200993, -1.089254, -1.259377, 1, 0.08235294, 0, 1,
-2.19899, 0.2606197, -2.242342, 1, 0.09019608, 0, 1,
-2.171231, 0.8255243, -0.2863228, 1, 0.09411765, 0, 1,
-2.158777, -0.219762, -1.788484, 1, 0.1019608, 0, 1,
-2.154537, 0.4048456, -2.611907, 1, 0.1098039, 0, 1,
-2.14811, -0.6762497, -1.49902, 1, 0.1137255, 0, 1,
-2.13811, -0.2694359, -1.895084, 1, 0.1215686, 0, 1,
-2.135453, -0.4694122, -2.823956, 1, 0.1254902, 0, 1,
-2.128134, -0.4026249, -1.976519, 1, 0.1333333, 0, 1,
-2.126574, -0.8820237, -0.4262162, 1, 0.1372549, 0, 1,
-2.118935, -0.7006787, -1.523003, 1, 0.145098, 0, 1,
-2.079229, 0.7838288, -2.83469, 1, 0.1490196, 0, 1,
-2.078634, 1.257338, -0.7156793, 1, 0.1568628, 0, 1,
-2.07858, 2.790392, -2.537063, 1, 0.1607843, 0, 1,
-2.054573, 1.477015, 0.9511983, 1, 0.1686275, 0, 1,
-2.04016, -0.004196993, -3.324261, 1, 0.172549, 0, 1,
-2.013517, 0.1604306, -0.3613625, 1, 0.1803922, 0, 1,
-2.008129, 0.2819826, -3.483333, 1, 0.1843137, 0, 1,
-2.007803, -0.785553, -2.024906, 1, 0.1921569, 0, 1,
-1.989325, -1.055369, -1.63303, 1, 0.1960784, 0, 1,
-1.974927, 3.064991, -0.5029413, 1, 0.2039216, 0, 1,
-1.974598, -1.565704, -2.69554, 1, 0.2117647, 0, 1,
-1.968904, 0.9586613, -1.210659, 1, 0.2156863, 0, 1,
-1.963689, 0.04733035, -2.955749, 1, 0.2235294, 0, 1,
-1.934501, -0.8846987, -2.754069, 1, 0.227451, 0, 1,
-1.934378, 0.2697875, -2.253143, 1, 0.2352941, 0, 1,
-1.920806, -0.4564396, -0.8000099, 1, 0.2392157, 0, 1,
-1.879181, -0.9211808, -2.402265, 1, 0.2470588, 0, 1,
-1.85997, -0.8006422, -0.6077864, 1, 0.2509804, 0, 1,
-1.859966, -0.3155372, -2.363292, 1, 0.2588235, 0, 1,
-1.843616, 0.2801346, -0.6027584, 1, 0.2627451, 0, 1,
-1.806417, 0.03050482, 1.560327, 1, 0.2705882, 0, 1,
-1.79145, 0.197777, -1.550313, 1, 0.2745098, 0, 1,
-1.762289, -0.5154313, -0.6610438, 1, 0.282353, 0, 1,
-1.756881, -0.2913402, -1.771867, 1, 0.2862745, 0, 1,
-1.749609, -0.3870102, -2.818056, 1, 0.2941177, 0, 1,
-1.745084, -1.462189, -0.9800498, 1, 0.3019608, 0, 1,
-1.742448, -1.135317, -2.328799, 1, 0.3058824, 0, 1,
-1.711882, 0.3732685, -0.6042874, 1, 0.3137255, 0, 1,
-1.696004, -0.1256795, -3.282436, 1, 0.3176471, 0, 1,
-1.690336, 0.6356007, -1.171934, 1, 0.3254902, 0, 1,
-1.6892, 0.7627523, -0.873579, 1, 0.3294118, 0, 1,
-1.687635, -0.120612, -0.5781388, 1, 0.3372549, 0, 1,
-1.684395, -1.046672, -2.300954, 1, 0.3411765, 0, 1,
-1.678152, -0.3144783, -1.749443, 1, 0.3490196, 0, 1,
-1.670274, -2.516853, -2.525661, 1, 0.3529412, 0, 1,
-1.652492, -1.698711, -4.493104, 1, 0.3607843, 0, 1,
-1.617911, 0.3231309, -1.459673, 1, 0.3647059, 0, 1,
-1.587511, -1.558274, -1.737177, 1, 0.372549, 0, 1,
-1.581832, 0.1159125, -2.069365, 1, 0.3764706, 0, 1,
-1.579734, -0.4063514, -0.3673256, 1, 0.3843137, 0, 1,
-1.575833, -0.4648775, -3.12852, 1, 0.3882353, 0, 1,
-1.570373, 0.1305624, -1.715757, 1, 0.3960784, 0, 1,
-1.555357, 1.089405, 0.5998997, 1, 0.4039216, 0, 1,
-1.552009, -0.3264875, -2.494067, 1, 0.4078431, 0, 1,
-1.539328, 1.552673, -0.7127597, 1, 0.4156863, 0, 1,
-1.526611, 2.196917, 0.02722361, 1, 0.4196078, 0, 1,
-1.50841, -1.37634, -3.790591, 1, 0.427451, 0, 1,
-1.500388, 2.424136, 0.0849736, 1, 0.4313726, 0, 1,
-1.496357, 1.395614, -1.193746, 1, 0.4392157, 0, 1,
-1.493443, -0.2542846, -1.666315, 1, 0.4431373, 0, 1,
-1.490249, 1.226271, -3.354871, 1, 0.4509804, 0, 1,
-1.485667, -0.4519762, -2.827695, 1, 0.454902, 0, 1,
-1.480831, -0.0971907, -2.287424, 1, 0.4627451, 0, 1,
-1.470116, -1.116053, -2.203287, 1, 0.4666667, 0, 1,
-1.468143, 0.09415451, -0.9301299, 1, 0.4745098, 0, 1,
-1.465847, -0.7826675, -1.669953, 1, 0.4784314, 0, 1,
-1.463686, -1.603629, -3.424596, 1, 0.4862745, 0, 1,
-1.457563, 0.7953913, -1.800974, 1, 0.4901961, 0, 1,
-1.455147, 1.01356, -0.4555731, 1, 0.4980392, 0, 1,
-1.439105, -1.154505, -1.637486, 1, 0.5058824, 0, 1,
-1.437054, 0.1537602, -0.8052911, 1, 0.509804, 0, 1,
-1.434472, 0.3054564, -1.500156, 1, 0.5176471, 0, 1,
-1.434074, -0.7759017, -1.508155, 1, 0.5215687, 0, 1,
-1.433282, 0.1642951, -2.730027, 1, 0.5294118, 0, 1,
-1.420335, 1.043441, -1.063638, 1, 0.5333334, 0, 1,
-1.40075, 1.614836, -0.1676996, 1, 0.5411765, 0, 1,
-1.391226, -0.5540929, -2.192221, 1, 0.5450981, 0, 1,
-1.387878, -0.8781075, -3.873823, 1, 0.5529412, 0, 1,
-1.386819, -0.09009881, -1.555147, 1, 0.5568628, 0, 1,
-1.378216, 2.911719, -1.66286, 1, 0.5647059, 0, 1,
-1.37699, 0.3312548, -2.67581, 1, 0.5686275, 0, 1,
-1.359914, 0.4887909, -2.049051, 1, 0.5764706, 0, 1,
-1.346823, -0.4944911, -1.252768, 1, 0.5803922, 0, 1,
-1.34537, -0.467089, -1.140437, 1, 0.5882353, 0, 1,
-1.333236, 0.3644577, -0.2901401, 1, 0.5921569, 0, 1,
-1.323888, 1.531597, -2.096576, 1, 0.6, 0, 1,
-1.308648, -1.738543, -3.647129, 1, 0.6078432, 0, 1,
-1.305673, -1.973271, -2.695217, 1, 0.6117647, 0, 1,
-1.304147, -0.06959064, -2.071514, 1, 0.6196079, 0, 1,
-1.297754, -1.107148, -3.11839, 1, 0.6235294, 0, 1,
-1.292884, -0.6568211, -1.501418, 1, 0.6313726, 0, 1,
-1.290767, 0.8971112, 0.3862684, 1, 0.6352941, 0, 1,
-1.290668, 1.312543, -0.4288228, 1, 0.6431373, 0, 1,
-1.285611, -0.9353617, -1.124049, 1, 0.6470588, 0, 1,
-1.285143, -0.3593558, -3.386389, 1, 0.654902, 0, 1,
-1.27815, -0.3394075, -2.993969, 1, 0.6588235, 0, 1,
-1.274081, 0.3878348, 0.1747267, 1, 0.6666667, 0, 1,
-1.273051, 0.1870232, -0.03206404, 1, 0.6705883, 0, 1,
-1.257449, 0.2188296, -2.868284, 1, 0.6784314, 0, 1,
-1.252167, 0.006082593, -0.01236151, 1, 0.682353, 0, 1,
-1.246455, 0.3991994, -3.093035, 1, 0.6901961, 0, 1,
-1.237748, -1.252489, -2.630559, 1, 0.6941177, 0, 1,
-1.230988, 1.253404, -2.593563, 1, 0.7019608, 0, 1,
-1.226735, 1.089809, 0.420799, 1, 0.7098039, 0, 1,
-1.220945, 0.1064819, -1.087385, 1, 0.7137255, 0, 1,
-1.219919, 0.4705803, -1.13939, 1, 0.7215686, 0, 1,
-1.216369, -0.2774136, -2.960662, 1, 0.7254902, 0, 1,
-1.201791, -0.8956535, -0.1089496, 1, 0.7333333, 0, 1,
-1.195107, 1.908967, 1.578158, 1, 0.7372549, 0, 1,
-1.181888, 0.3884963, -0.5944587, 1, 0.7450981, 0, 1,
-1.180783, -1.136849, -1.000484, 1, 0.7490196, 0, 1,
-1.179788, -1.440218, -0.9082482, 1, 0.7568628, 0, 1,
-1.173918, -0.2220792, -2.630344, 1, 0.7607843, 0, 1,
-1.169035, 0.303131, -0.4354948, 1, 0.7686275, 0, 1,
-1.157044, -1.156482, -2.75646, 1, 0.772549, 0, 1,
-1.151358, -0.4436269, -0.835976, 1, 0.7803922, 0, 1,
-1.140534, 1.369798, -0.7171578, 1, 0.7843137, 0, 1,
-1.139714, -0.4049594, -2.273936, 1, 0.7921569, 0, 1,
-1.127971, -0.7771918, -3.244747, 1, 0.7960784, 0, 1,
-1.123194, 0.09040159, -1.401092, 1, 0.8039216, 0, 1,
-1.110831, -0.0384538, -1.300887, 1, 0.8117647, 0, 1,
-1.109547, -2.097908, -4.115585, 1, 0.8156863, 0, 1,
-1.10905, -0.7505738, -3.848142, 1, 0.8235294, 0, 1,
-1.100888, 0.702423, 0.4658229, 1, 0.827451, 0, 1,
-1.09927, -0.3469912, -1.641435, 1, 0.8352941, 0, 1,
-1.098536, 0.05601011, -0.6979285, 1, 0.8392157, 0, 1,
-1.098212, 0.5882319, -1.399556, 1, 0.8470588, 0, 1,
-1.095995, 1.163782, -1.965108, 1, 0.8509804, 0, 1,
-1.095483, -0.9206254, -3.222927, 1, 0.8588235, 0, 1,
-1.091809, 1.022673, -1.519958, 1, 0.8627451, 0, 1,
-1.087824, 1.669407, 0.1005434, 1, 0.8705882, 0, 1,
-1.076975, 0.8274454, -1.090661, 1, 0.8745098, 0, 1,
-1.074127, 0.5666371, -0.8973709, 1, 0.8823529, 0, 1,
-1.067645, -1.467259, -1.728746, 1, 0.8862745, 0, 1,
-1.058136, -0.2355021, -2.477322, 1, 0.8941177, 0, 1,
-1.057277, -1.995057, -3.305591, 1, 0.8980392, 0, 1,
-1.048155, -0.5312478, -0.6424564, 1, 0.9058824, 0, 1,
-1.042125, -0.03472292, -1.725649, 1, 0.9137255, 0, 1,
-1.035836, -0.1779349, -1.942981, 1, 0.9176471, 0, 1,
-1.03409, 0.7697465, -0.8826489, 1, 0.9254902, 0, 1,
-1.030103, 1.12882, -1.865877, 1, 0.9294118, 0, 1,
-1.029712, 0.693502, -1.013825, 1, 0.9372549, 0, 1,
-1.022348, 0.2398317, -0.3679043, 1, 0.9411765, 0, 1,
-1.021351, -0.07228073, -0.5118604, 1, 0.9490196, 0, 1,
-1.014169, 0.002876787, -2.396978, 1, 0.9529412, 0, 1,
-1.013446, 0.7323644, -1.782281, 1, 0.9607843, 0, 1,
-1.012708, -0.2036716, -0.103259, 1, 0.9647059, 0, 1,
-1.010857, 0.6761035, -0.9697373, 1, 0.972549, 0, 1,
-1.01075, -1.26731, -1.401716, 1, 0.9764706, 0, 1,
-0.9995322, 0.204448, -3.127791, 1, 0.9843137, 0, 1,
-0.9982228, -0.8574721, -3.042496, 1, 0.9882353, 0, 1,
-0.9871675, 0.9951673, 0.3570966, 1, 0.9960784, 0, 1,
-0.9861315, -0.3842664, -1.458648, 0.9960784, 1, 0, 1,
-0.9855723, 0.4586841, -0.1199108, 0.9921569, 1, 0, 1,
-0.9823259, 0.04230167, -1.66241, 0.9843137, 1, 0, 1,
-0.9810919, 2.108282, -2.411144, 0.9803922, 1, 0, 1,
-0.97923, -0.961873, -3.176763, 0.972549, 1, 0, 1,
-0.973697, -0.3705373, -0.7633091, 0.9686275, 1, 0, 1,
-0.9659799, 0.1421629, 0.4354073, 0.9607843, 1, 0, 1,
-0.9602403, 2.243752, 0.3617252, 0.9568627, 1, 0, 1,
-0.9591581, 0.6660435, -1.461001, 0.9490196, 1, 0, 1,
-0.9589149, -2.230463, -3.728373, 0.945098, 1, 0, 1,
-0.9586983, -0.08158723, -1.344031, 0.9372549, 1, 0, 1,
-0.9558093, -0.5331467, -0.5122393, 0.9333333, 1, 0, 1,
-0.9545685, 0.3659433, -0.4842175, 0.9254902, 1, 0, 1,
-0.9538137, 0.7067594, 0.2652158, 0.9215686, 1, 0, 1,
-0.9535802, -0.3195153, -0.9632001, 0.9137255, 1, 0, 1,
-0.9484858, 0.7476489, -2.185958, 0.9098039, 1, 0, 1,
-0.943909, -1.303697, -1.690709, 0.9019608, 1, 0, 1,
-0.9422728, 0.02143896, -0.8415793, 0.8941177, 1, 0, 1,
-0.9366288, -0.4346842, 0.03942003, 0.8901961, 1, 0, 1,
-0.9253451, 1.238071, 1.052424, 0.8823529, 1, 0, 1,
-0.9225463, 0.6407863, -1.537121, 0.8784314, 1, 0, 1,
-0.9189796, 0.9542665, -0.9328344, 0.8705882, 1, 0, 1,
-0.9099398, -0.2039009, 0.5013413, 0.8666667, 1, 0, 1,
-0.8987305, -2.000192, -5.298144, 0.8588235, 1, 0, 1,
-0.8943841, -0.6063052, -3.366471, 0.854902, 1, 0, 1,
-0.8895908, -0.4242147, -0.8804344, 0.8470588, 1, 0, 1,
-0.889208, -0.8201356, -0.7470062, 0.8431373, 1, 0, 1,
-0.8876191, 0.195734, -1.790881, 0.8352941, 1, 0, 1,
-0.8875698, 0.4475135, -0.9248931, 0.8313726, 1, 0, 1,
-0.8839577, -0.8961226, -4.058123, 0.8235294, 1, 0, 1,
-0.8796498, 0.1974197, -1.347575, 0.8196079, 1, 0, 1,
-0.8775576, 0.6206152, 0.6223241, 0.8117647, 1, 0, 1,
-0.8731619, -0.7299097, -2.184431, 0.8078431, 1, 0, 1,
-0.8723304, 0.1275645, -1.963525, 0.8, 1, 0, 1,
-0.8702521, 0.4715856, -1.600503, 0.7921569, 1, 0, 1,
-0.8690182, 0.4834916, -2.263851, 0.7882353, 1, 0, 1,
-0.8666824, 1.435454, -0.8433061, 0.7803922, 1, 0, 1,
-0.861017, -0.2525805, -3.248084, 0.7764706, 1, 0, 1,
-0.8601223, -0.6000392, -1.596893, 0.7686275, 1, 0, 1,
-0.8598909, 0.7634023, -1.315916, 0.7647059, 1, 0, 1,
-0.8597771, -0.2351147, -1.997972, 0.7568628, 1, 0, 1,
-0.847876, 0.6429031, 0.403761, 0.7529412, 1, 0, 1,
-0.8368237, -0.4773244, -3.019228, 0.7450981, 1, 0, 1,
-0.8333158, 0.3578722, -1.529888, 0.7411765, 1, 0, 1,
-0.8330001, 1.379374, -1.218219, 0.7333333, 1, 0, 1,
-0.831495, 0.2212712, -3.200614, 0.7294118, 1, 0, 1,
-0.829707, 0.2456698, -0.148911, 0.7215686, 1, 0, 1,
-0.8294742, 0.6184973, -0.4026938, 0.7176471, 1, 0, 1,
-0.8256339, -1.323456, -3.496571, 0.7098039, 1, 0, 1,
-0.8252276, -1.484033, -1.794287, 0.7058824, 1, 0, 1,
-0.8128303, -1.204937, -2.094942, 0.6980392, 1, 0, 1,
-0.8127211, -1.987359, -3.182086, 0.6901961, 1, 0, 1,
-0.8054859, -0.02880355, -1.644048, 0.6862745, 1, 0, 1,
-0.8043545, 0.3752176, -1.744049, 0.6784314, 1, 0, 1,
-0.8041808, 0.1582162, -1.835628, 0.6745098, 1, 0, 1,
-0.8017991, -0.4222353, -2.0417, 0.6666667, 1, 0, 1,
-0.7979622, -0.6583339, -4.231773, 0.6627451, 1, 0, 1,
-0.7956209, -1.406386, -5.301552, 0.654902, 1, 0, 1,
-0.7955024, 0.8591063, 0.447269, 0.6509804, 1, 0, 1,
-0.7929192, -0.3210123, -2.663715, 0.6431373, 1, 0, 1,
-0.7901635, -1.496245, -0.6050141, 0.6392157, 1, 0, 1,
-0.7879541, 1.115749, -1.304865, 0.6313726, 1, 0, 1,
-0.7879393, -0.05461466, -2.385505, 0.627451, 1, 0, 1,
-0.7848337, 0.2475336, -0.8482805, 0.6196079, 1, 0, 1,
-0.7840868, -1.063869, -2.862705, 0.6156863, 1, 0, 1,
-0.7752359, 1.225423, -0.3638665, 0.6078432, 1, 0, 1,
-0.7745988, 1.062035, -1.069614, 0.6039216, 1, 0, 1,
-0.7640826, 0.3792115, -1.914631, 0.5960785, 1, 0, 1,
-0.7605676, -0.3572375, -2.506797, 0.5882353, 1, 0, 1,
-0.7581325, -0.6821447, -1.178578, 0.5843138, 1, 0, 1,
-0.7545456, -0.261905, -2.177915, 0.5764706, 1, 0, 1,
-0.7505258, 0.2727752, 0.356512, 0.572549, 1, 0, 1,
-0.7465472, -0.1956721, -2.475532, 0.5647059, 1, 0, 1,
-0.7464709, -1.400985, -4.178732, 0.5607843, 1, 0, 1,
-0.7464099, -0.2405262, -1.925155, 0.5529412, 1, 0, 1,
-0.7461917, -1.509587, -3.416605, 0.5490196, 1, 0, 1,
-0.7441511, -1.738373, -1.160302, 0.5411765, 1, 0, 1,
-0.7439525, -0.5805708, -1.301462, 0.5372549, 1, 0, 1,
-0.7437481, -1.462689, -0.3597722, 0.5294118, 1, 0, 1,
-0.7428945, -2.097419, -3.301659, 0.5254902, 1, 0, 1,
-0.7422215, -0.8072921, -2.014083, 0.5176471, 1, 0, 1,
-0.7399175, 2.091797, 0.2106442, 0.5137255, 1, 0, 1,
-0.7397825, 0.4432474, -0.07663506, 0.5058824, 1, 0, 1,
-0.7395886, 0.04023638, -0.4226947, 0.5019608, 1, 0, 1,
-0.7381975, 0.02276913, -2.171376, 0.4941176, 1, 0, 1,
-0.7370969, 0.1335132, -0.8009553, 0.4862745, 1, 0, 1,
-0.7291968, -0.9417819, -3.937411, 0.4823529, 1, 0, 1,
-0.7275793, 0.1166341, -1.615321, 0.4745098, 1, 0, 1,
-0.7265224, -0.3656, -1.369474, 0.4705882, 1, 0, 1,
-0.7222052, 0.6521095, -2.174937, 0.4627451, 1, 0, 1,
-0.7213656, 0.004274302, -3.686636, 0.4588235, 1, 0, 1,
-0.7168193, 0.1449705, -1.103113, 0.4509804, 1, 0, 1,
-0.7046843, -0.2879375, -2.136287, 0.4470588, 1, 0, 1,
-0.6985675, 0.7062566, 0.9746031, 0.4392157, 1, 0, 1,
-0.6946397, 0.1504723, -1.936944, 0.4352941, 1, 0, 1,
-0.6944995, -1.27898, -2.67035, 0.427451, 1, 0, 1,
-0.6839455, -0.6420209, -3.318212, 0.4235294, 1, 0, 1,
-0.6816129, 0.4007041, -1.483963, 0.4156863, 1, 0, 1,
-0.6795233, -1.965587, -2.367098, 0.4117647, 1, 0, 1,
-0.6790137, 1.065087, -0.3827199, 0.4039216, 1, 0, 1,
-0.6756902, -0.1652067, 0.5062456, 0.3960784, 1, 0, 1,
-0.6694731, 1.503812, 0.2144188, 0.3921569, 1, 0, 1,
-0.6693118, -0.02719131, -1.174529, 0.3843137, 1, 0, 1,
-0.6662561, -0.9609166, -4.301132, 0.3803922, 1, 0, 1,
-0.6600784, -1.583784, -3.28655, 0.372549, 1, 0, 1,
-0.6599931, -0.3088335, -1.882393, 0.3686275, 1, 0, 1,
-0.6589215, -0.3154236, -3.019033, 0.3607843, 1, 0, 1,
-0.6569719, -0.1259807, -2.895704, 0.3568628, 1, 0, 1,
-0.6549266, -1.308969, -0.9415332, 0.3490196, 1, 0, 1,
-0.6498252, -1.833577, -2.938996, 0.345098, 1, 0, 1,
-0.6495388, 0.0295696, -0.4219624, 0.3372549, 1, 0, 1,
-0.6472305, -1.125494, -3.341477, 0.3333333, 1, 0, 1,
-0.6449558, 0.02063804, -1.353266, 0.3254902, 1, 0, 1,
-0.6441082, -0.927038, -4.705068, 0.3215686, 1, 0, 1,
-0.6383969, 1.304319, -0.73168, 0.3137255, 1, 0, 1,
-0.6317863, 0.004123999, -2.345391, 0.3098039, 1, 0, 1,
-0.6311401, -0.5093387, -1.100636, 0.3019608, 1, 0, 1,
-0.6310477, 1.390365, -1.136764, 0.2941177, 1, 0, 1,
-0.6300125, -0.1259667, -2.511803, 0.2901961, 1, 0, 1,
-0.6251503, -1.791571, 1.697298, 0.282353, 1, 0, 1,
-0.6238734, -1.004902, -0.9838749, 0.2784314, 1, 0, 1,
-0.6103745, -0.3074541, -3.675921, 0.2705882, 1, 0, 1,
-0.608379, -1.051309, -3.337024, 0.2666667, 1, 0, 1,
-0.6058434, 0.1011606, -2.97869, 0.2588235, 1, 0, 1,
-0.6041471, 0.02874548, -0.9867052, 0.254902, 1, 0, 1,
-0.600131, -0.1536374, -2.377565, 0.2470588, 1, 0, 1,
-0.5932192, -1.235598, -2.401547, 0.2431373, 1, 0, 1,
-0.5912719, 0.08118191, -2.105817, 0.2352941, 1, 0, 1,
-0.5898766, -0.9095098, -2.740808, 0.2313726, 1, 0, 1,
-0.5866095, -0.430982, -2.327693, 0.2235294, 1, 0, 1,
-0.5840879, -0.6551136, -1.600588, 0.2196078, 1, 0, 1,
-0.5826777, 2.608472, -0.7948563, 0.2117647, 1, 0, 1,
-0.5793481, -0.4562541, -3.792143, 0.2078431, 1, 0, 1,
-0.5781188, -0.7022498, -1.702362, 0.2, 1, 0, 1,
-0.5776341, -0.3875122, -1.90895, 0.1921569, 1, 0, 1,
-0.5759266, 0.5658942, 0.2222496, 0.1882353, 1, 0, 1,
-0.5754673, -0.504379, -1.541748, 0.1803922, 1, 0, 1,
-0.5706245, 1.67279, -0.3462874, 0.1764706, 1, 0, 1,
-0.5698512, -0.8995709, -2.869437, 0.1686275, 1, 0, 1,
-0.5697156, -0.753186, -2.610932, 0.1647059, 1, 0, 1,
-0.5679762, -0.2451023, -3.795492, 0.1568628, 1, 0, 1,
-0.5677159, -0.6029023, -2.145755, 0.1529412, 1, 0, 1,
-0.5672094, 0.365909, -1.67713, 0.145098, 1, 0, 1,
-0.5665417, -0.5377632, -3.83891, 0.1411765, 1, 0, 1,
-0.5660794, -0.7600448, -1.462066, 0.1333333, 1, 0, 1,
-0.5644642, -0.9854215, -1.866435, 0.1294118, 1, 0, 1,
-0.5628461, 2.718823, -0.06007509, 0.1215686, 1, 0, 1,
-0.5589062, 1.337234, 0.2379002, 0.1176471, 1, 0, 1,
-0.5574802, 0.6918268, -1.1399, 0.1098039, 1, 0, 1,
-0.5560225, -1.417705, -1.726164, 0.1058824, 1, 0, 1,
-0.5551509, -0.3305073, -2.113529, 0.09803922, 1, 0, 1,
-0.5523725, -1.381333, -3.555574, 0.09019608, 1, 0, 1,
-0.5506712, 0.0174286, 0.118847, 0.08627451, 1, 0, 1,
-0.5454367, -0.47466, -1.500316, 0.07843138, 1, 0, 1,
-0.5403364, 0.9980001, 0.6890128, 0.07450981, 1, 0, 1,
-0.5392886, 0.1721745, -2.162282, 0.06666667, 1, 0, 1,
-0.5320404, 0.8482366, 0.8029169, 0.0627451, 1, 0, 1,
-0.5308996, 0.1089097, -2.354236, 0.05490196, 1, 0, 1,
-0.5122201, -0.06109333, -1.593122, 0.05098039, 1, 0, 1,
-0.5101214, -0.7669245, -1.890995, 0.04313726, 1, 0, 1,
-0.508078, -1.451723, -3.968241, 0.03921569, 1, 0, 1,
-0.5075253, 1.507591, 0.03129206, 0.03137255, 1, 0, 1,
-0.4966456, 0.4214987, -1.812373, 0.02745098, 1, 0, 1,
-0.4935978, 1.008086, 0.586805, 0.01960784, 1, 0, 1,
-0.4926598, -0.5615457, -1.271849, 0.01568628, 1, 0, 1,
-0.4886105, -0.01850169, -2.827916, 0.007843138, 1, 0, 1,
-0.4853288, 0.312098, -1.258417, 0.003921569, 1, 0, 1,
-0.4850326, 0.6196524, -1.441981, 0, 1, 0.003921569, 1,
-0.4820354, -1.287002, -4.727247, 0, 1, 0.01176471, 1,
-0.4817731, -1.580741, -3.450163, 0, 1, 0.01568628, 1,
-0.4706696, 0.01767757, -1.154758, 0, 1, 0.02352941, 1,
-0.4695474, -1.12442, 0.4708269, 0, 1, 0.02745098, 1,
-0.4650792, 0.2455803, -1.745577, 0, 1, 0.03529412, 1,
-0.464, 0.6626557, -2.691633, 0, 1, 0.03921569, 1,
-0.4581064, -1.531162, -1.717874, 0, 1, 0.04705882, 1,
-0.4578034, -0.496276, -1.787414, 0, 1, 0.05098039, 1,
-0.4569945, 0.05481029, -0.3458551, 0, 1, 0.05882353, 1,
-0.4569679, -1.020317, -4.566745, 0, 1, 0.0627451, 1,
-0.4537613, 0.4232346, -0.09531407, 0, 1, 0.07058824, 1,
-0.4525872, -1.832804, -3.923254, 0, 1, 0.07450981, 1,
-0.4491323, 0.7121793, 0.6599525, 0, 1, 0.08235294, 1,
-0.4469206, -0.8303518, -2.511361, 0, 1, 0.08627451, 1,
-0.4460243, 0.1069071, -1.609888, 0, 1, 0.09411765, 1,
-0.441304, -1.024946, -1.66124, 0, 1, 0.1019608, 1,
-0.4393225, -1.663859, -3.35072, 0, 1, 0.1058824, 1,
-0.4382468, 0.9907296, -0.01568712, 0, 1, 0.1137255, 1,
-0.4371269, -0.03486891, -1.318236, 0, 1, 0.1176471, 1,
-0.4341474, 0.2381856, 1.08446, 0, 1, 0.1254902, 1,
-0.433516, -0.2362059, -0.839821, 0, 1, 0.1294118, 1,
-0.4315578, 0.9164015, -2.287688, 0, 1, 0.1372549, 1,
-0.4307028, 1.089665, -1.703539, 0, 1, 0.1411765, 1,
-0.4297517, -0.6909679, -3.114094, 0, 1, 0.1490196, 1,
-0.4277915, 0.6497784, -0.754932, 0, 1, 0.1529412, 1,
-0.4274457, 0.9972293, 0.5007269, 0, 1, 0.1607843, 1,
-0.4250743, -0.05500029, -1.908768, 0, 1, 0.1647059, 1,
-0.4236817, 0.7725715, -0.04521049, 0, 1, 0.172549, 1,
-0.4212954, 1.460224, -2.687689, 0, 1, 0.1764706, 1,
-0.4136718, 1.214995, -1.251066, 0, 1, 0.1843137, 1,
-0.4123524, 1.65049, 0.2143235, 0, 1, 0.1882353, 1,
-0.4059477, -0.4303687, -3.426494, 0, 1, 0.1960784, 1,
-0.4045391, -1.680289, -2.209662, 0, 1, 0.2039216, 1,
-0.4015115, 0.2437569, -2.742823, 0, 1, 0.2078431, 1,
-0.4012314, -1.424171, -3.540102, 0, 1, 0.2156863, 1,
-0.398652, -0.3333657, -3.078646, 0, 1, 0.2196078, 1,
-0.391974, 1.639652, 0.03307317, 0, 1, 0.227451, 1,
-0.3919079, -0.6203083, -1.954416, 0, 1, 0.2313726, 1,
-0.3916942, -1.873319, -2.137184, 0, 1, 0.2392157, 1,
-0.3879533, 0.4787274, -1.610336, 0, 1, 0.2431373, 1,
-0.3859357, -1.405495, -3.311847, 0, 1, 0.2509804, 1,
-0.3842875, -0.09902482, -1.626617, 0, 1, 0.254902, 1,
-0.3837913, 1.524057, -2.160032, 0, 1, 0.2627451, 1,
-0.3808997, 0.6524291, -1.410898, 0, 1, 0.2666667, 1,
-0.3769907, -0.6956056, -2.417273, 0, 1, 0.2745098, 1,
-0.3768955, 0.6647051, 0.4981726, 0, 1, 0.2784314, 1,
-0.3727732, 1.507499, -1.392983, 0, 1, 0.2862745, 1,
-0.3664785, 0.0856022, -1.46613, 0, 1, 0.2901961, 1,
-0.3632775, 0.78056, -2.300821, 0, 1, 0.2980392, 1,
-0.3554832, -0.5962142, -5.020014, 0, 1, 0.3058824, 1,
-0.3506707, 1.218472, -0.3089105, 0, 1, 0.3098039, 1,
-0.3493293, -1.381934, -1.923154, 0, 1, 0.3176471, 1,
-0.3445971, 0.5743944, 0.4823708, 0, 1, 0.3215686, 1,
-0.3433217, -0.05637401, -3.895873, 0, 1, 0.3294118, 1,
-0.3380366, 1.334263, -1.150409, 0, 1, 0.3333333, 1,
-0.3372041, 1.470205, -0.752547, 0, 1, 0.3411765, 1,
-0.336847, 0.4924706, 0.3707463, 0, 1, 0.345098, 1,
-0.334427, -0.002126703, -0.3659712, 0, 1, 0.3529412, 1,
-0.3311779, 0.4437495, -0.06130778, 0, 1, 0.3568628, 1,
-0.3296522, 2.097993, 0.7314472, 0, 1, 0.3647059, 1,
-0.323025, 0.6334006, -1.69573, 0, 1, 0.3686275, 1,
-0.3192368, -0.7160318, -2.521105, 0, 1, 0.3764706, 1,
-0.3062964, -0.143373, -1.008891, 0, 1, 0.3803922, 1,
-0.3026432, 1.320277, 0.08359719, 0, 1, 0.3882353, 1,
-0.3018459, -0.2455609, -1.871596, 0, 1, 0.3921569, 1,
-0.3011913, 0.3637916, -0.718876, 0, 1, 0.4, 1,
-0.3008088, -0.4708994, -3.416869, 0, 1, 0.4078431, 1,
-0.299274, 0.0513051, -1.273229, 0, 1, 0.4117647, 1,
-0.2977085, 0.1783774, -0.8068521, 0, 1, 0.4196078, 1,
-0.2977055, -0.5586092, -2.941435, 0, 1, 0.4235294, 1,
-0.2954748, -0.8694774, -0.6840972, 0, 1, 0.4313726, 1,
-0.2916209, -1.006854, -0.8130796, 0, 1, 0.4352941, 1,
-0.289919, -0.8000247, -2.769936, 0, 1, 0.4431373, 1,
-0.284795, 0.3521684, -1.370882, 0, 1, 0.4470588, 1,
-0.2814363, -0.9329376, -3.972878, 0, 1, 0.454902, 1,
-0.2804906, 1.268476, 0.1580041, 0, 1, 0.4588235, 1,
-0.2766337, 0.2540813, -1.014614, 0, 1, 0.4666667, 1,
-0.2763597, -1.115993, -2.689871, 0, 1, 0.4705882, 1,
-0.2731493, 0.2793497, -0.3964385, 0, 1, 0.4784314, 1,
-0.2726948, 1.619231, 0.05914285, 0, 1, 0.4823529, 1,
-0.2695097, -0.91919, -2.973186, 0, 1, 0.4901961, 1,
-0.2673565, -0.622144, -2.096606, 0, 1, 0.4941176, 1,
-0.2651542, 0.5086247, 1.207716, 0, 1, 0.5019608, 1,
-0.2650573, -0.4976857, -3.710882, 0, 1, 0.509804, 1,
-0.2647994, 0.3857607, 0.9826769, 0, 1, 0.5137255, 1,
-0.2644932, 0.8469633, 1.635127, 0, 1, 0.5215687, 1,
-0.2574936, 0.7848492, 0.633618, 0, 1, 0.5254902, 1,
-0.2548154, 0.641263, -0.2527483, 0, 1, 0.5333334, 1,
-0.2387749, -1.23964, -4.74042, 0, 1, 0.5372549, 1,
-0.2368642, 0.4911975, -0.6562739, 0, 1, 0.5450981, 1,
-0.2329714, -0.3647322, -2.519943, 0, 1, 0.5490196, 1,
-0.2300311, -0.04012783, -0.8411788, 0, 1, 0.5568628, 1,
-0.2266076, -1.518052, -4.066469, 0, 1, 0.5607843, 1,
-0.2194553, 1.959418, 0.3924597, 0, 1, 0.5686275, 1,
-0.2141448, -0.0408629, -1.209827, 0, 1, 0.572549, 1,
-0.2114157, -0.480111, -4.35413, 0, 1, 0.5803922, 1,
-0.2009426, -2.193061, -3.911165, 0, 1, 0.5843138, 1,
-0.1992577, 1.636376, -2.076971, 0, 1, 0.5921569, 1,
-0.1982992, 1.355929, 0.07675637, 0, 1, 0.5960785, 1,
-0.1965584, 0.0007044112, -0.9077139, 0, 1, 0.6039216, 1,
-0.1963503, -1.843304, -3.476007, 0, 1, 0.6117647, 1,
-0.1958791, 0.4032243, -1.064903, 0, 1, 0.6156863, 1,
-0.1939374, 0.660629, -1.601579, 0, 1, 0.6235294, 1,
-0.1905559, 0.2510993, -0.8636375, 0, 1, 0.627451, 1,
-0.1901257, -0.4797111, -2.881123, 0, 1, 0.6352941, 1,
-0.1873801, -1.499155, -2.719059, 0, 1, 0.6392157, 1,
-0.1860883, 0.7128087, 2.215291, 0, 1, 0.6470588, 1,
-0.1849985, -1.359619, -3.170306, 0, 1, 0.6509804, 1,
-0.1834621, -0.5531543, -3.488562, 0, 1, 0.6588235, 1,
-0.1805954, -0.9609514, -3.86211, 0, 1, 0.6627451, 1,
-0.179096, -0.995078, -3.198429, 0, 1, 0.6705883, 1,
-0.1771724, 0.038022, -2.099262, 0, 1, 0.6745098, 1,
-0.1761979, 1.125532, -3.447557, 0, 1, 0.682353, 1,
-0.1723346, -1.811743, -4.059132, 0, 1, 0.6862745, 1,
-0.1706283, 0.1439995, -1.058563, 0, 1, 0.6941177, 1,
-0.1698243, 2.109747, -0.2987207, 0, 1, 0.7019608, 1,
-0.164788, 1.302139, 1.226068, 0, 1, 0.7058824, 1,
-0.1596668, -0.2805329, -3.48304, 0, 1, 0.7137255, 1,
-0.1552542, 0.2203115, -0.7954549, 0, 1, 0.7176471, 1,
-0.1541176, -0.7271023, -2.725378, 0, 1, 0.7254902, 1,
-0.152771, -2.451001, -5.142791, 0, 1, 0.7294118, 1,
-0.1425846, 0.261841, 0.775387, 0, 1, 0.7372549, 1,
-0.1387555, 0.4164795, 0.4923302, 0, 1, 0.7411765, 1,
-0.1374435, -0.4267192, -2.170888, 0, 1, 0.7490196, 1,
-0.1348655, 0.9453029, -2.062623, 0, 1, 0.7529412, 1,
-0.1332811, -0.6563613, -3.59003, 0, 1, 0.7607843, 1,
-0.1328238, -0.6767427, -3.270229, 0, 1, 0.7647059, 1,
-0.1289079, 0.1324598, 0.1772525, 0, 1, 0.772549, 1,
-0.1288823, 0.7587088, -0.03118337, 0, 1, 0.7764706, 1,
-0.12785, 1.433235, 1.743755, 0, 1, 0.7843137, 1,
-0.1267067, 1.206856, 0.3955707, 0, 1, 0.7882353, 1,
-0.1219803, 0.9404215, 0.7537702, 0, 1, 0.7960784, 1,
-0.1218576, -1.523472, -4.727714, 0, 1, 0.8039216, 1,
-0.1217872, 1.60597, 0.9418404, 0, 1, 0.8078431, 1,
-0.1178115, 0.1527566, -1.546418, 0, 1, 0.8156863, 1,
-0.10946, 0.374613, -1.691464, 0, 1, 0.8196079, 1,
-0.1086664, 0.1501865, -2.02695, 0, 1, 0.827451, 1,
-0.1080972, -0.2030663, -2.064782, 0, 1, 0.8313726, 1,
-0.1075996, -0.3152069, -4.246884, 0, 1, 0.8392157, 1,
-0.1000389, 1.03504, -0.7072799, 0, 1, 0.8431373, 1,
-0.09927261, -1.889067, -2.489475, 0, 1, 0.8509804, 1,
-0.09808215, -0.2793869, -2.691332, 0, 1, 0.854902, 1,
-0.09617453, -1.230358, -4.795642, 0, 1, 0.8627451, 1,
-0.09567738, 0.7404945, -0.6050438, 0, 1, 0.8666667, 1,
-0.08976978, 0.3568076, -0.8192179, 0, 1, 0.8745098, 1,
-0.08516389, 0.3955813, 0.9432344, 0, 1, 0.8784314, 1,
-0.08206957, -0.08477227, -4.022445, 0, 1, 0.8862745, 1,
-0.07655226, -0.4397921, -2.368426, 0, 1, 0.8901961, 1,
-0.06999641, 1.911002, -0.8871977, 0, 1, 0.8980392, 1,
-0.06835568, -0.6066867, -4.226616, 0, 1, 0.9058824, 1,
-0.06091165, 0.6225067, -0.227447, 0, 1, 0.9098039, 1,
-0.05600799, 1.070349, 1.466377, 0, 1, 0.9176471, 1,
-0.05518111, 0.193996, -0.3074023, 0, 1, 0.9215686, 1,
-0.05363941, 0.1117673, -2.272526, 0, 1, 0.9294118, 1,
-0.05358415, -0.5124, -5.864254, 0, 1, 0.9333333, 1,
-0.05005459, 1.165521, -1.035706, 0, 1, 0.9411765, 1,
-0.04977993, -3.619354, -3.202327, 0, 1, 0.945098, 1,
-0.04882028, 0.02208154, 0.1929152, 0, 1, 0.9529412, 1,
-0.04817637, -0.5631507, -3.356095, 0, 1, 0.9568627, 1,
-0.04508255, 0.3836545, 1.12895, 0, 1, 0.9647059, 1,
-0.04213464, 0.8457069, -0.9446809, 0, 1, 0.9686275, 1,
-0.04099895, 0.1646186, -0.0462271, 0, 1, 0.9764706, 1,
-0.03543142, -0.4199535, -3.506277, 0, 1, 0.9803922, 1,
-0.03308365, 0.1813348, 1.204285, 0, 1, 0.9882353, 1,
-0.03043779, 0.8897431, 1.373128, 0, 1, 0.9921569, 1,
-0.02954565, -0.8514886, -4.292549, 0, 1, 1, 1,
-0.02851764, 0.2626362, -0.6121367, 0, 0.9921569, 1, 1,
-0.02766998, 1.022229, -0.9916713, 0, 0.9882353, 1, 1,
-0.02722434, 1.238764, 0.8468013, 0, 0.9803922, 1, 1,
-0.02542774, 0.168799, -0.0911421, 0, 0.9764706, 1, 1,
-0.01809104, 0.4366182, 1.63252, 0, 0.9686275, 1, 1,
-0.009887054, -1.256894, -4.683047, 0, 0.9647059, 1, 1,
-0.009833264, 0.9354587, 0.3833144, 0, 0.9568627, 1, 1,
-0.009769204, -1.308553, -3.788277, 0, 0.9529412, 1, 1,
-0.003530143, -0.2284042, -2.790596, 0, 0.945098, 1, 1,
0.00146564, 0.6893207, 1.885694, 0, 0.9411765, 1, 1,
0.002591841, 0.404818, 0.8390598, 0, 0.9333333, 1, 1,
0.005451669, 0.1964852, 0.3514903, 0, 0.9294118, 1, 1,
0.007858078, -0.6163691, 3.910988, 0, 0.9215686, 1, 1,
0.008463598, -0.8713577, 3.880943, 0, 0.9176471, 1, 1,
0.01012237, 0.7202269, -0.9425533, 0, 0.9098039, 1, 1,
0.01758028, -1.474671, 3.613858, 0, 0.9058824, 1, 1,
0.01760471, -0.1685051, 1.509259, 0, 0.8980392, 1, 1,
0.02088192, 1.336907, -1.179265, 0, 0.8901961, 1, 1,
0.02386496, 0.6409742, 1.601949, 0, 0.8862745, 1, 1,
0.02530391, -1.615703, 4.498437, 0, 0.8784314, 1, 1,
0.03235222, 0.4434022, 1.122646, 0, 0.8745098, 1, 1,
0.03427018, -0.8312212, 2.042765, 0, 0.8666667, 1, 1,
0.03557229, -0.2817258, 2.360176, 0, 0.8627451, 1, 1,
0.03599695, -0.07344618, 2.370134, 0, 0.854902, 1, 1,
0.0378534, 1.890354, 0.9439071, 0, 0.8509804, 1, 1,
0.04882164, -0.7328628, 4.00179, 0, 0.8431373, 1, 1,
0.05246875, -0.2506503, 2.456277, 0, 0.8392157, 1, 1,
0.05261183, 1.439721, 0.9713524, 0, 0.8313726, 1, 1,
0.05522886, 0.9165585, 2.08695, 0, 0.827451, 1, 1,
0.05619587, 0.8752776, 1.263964, 0, 0.8196079, 1, 1,
0.05718182, -0.6932284, 1.944615, 0, 0.8156863, 1, 1,
0.05779852, 2.343918, -0.5602233, 0, 0.8078431, 1, 1,
0.06580704, -1.042485, 3.450725, 0, 0.8039216, 1, 1,
0.0688762, -0.8830161, 1.565598, 0, 0.7960784, 1, 1,
0.06896617, -0.7304705, 2.516138, 0, 0.7882353, 1, 1,
0.07039455, -0.7502908, 1.653357, 0, 0.7843137, 1, 1,
0.07302866, -1.188462, 2.480172, 0, 0.7764706, 1, 1,
0.07404561, 0.4375049, -1.491006, 0, 0.772549, 1, 1,
0.07456486, 0.3115558, -0.2348804, 0, 0.7647059, 1, 1,
0.07883067, 0.1556126, 0.1866674, 0, 0.7607843, 1, 1,
0.08407136, -0.5357875, 2.958292, 0, 0.7529412, 1, 1,
0.08677348, 0.1990367, 0.5261554, 0, 0.7490196, 1, 1,
0.08879825, -0.3450727, 2.634323, 0, 0.7411765, 1, 1,
0.0919926, -0.5658348, 3.201067, 0, 0.7372549, 1, 1,
0.09206842, 1.334503, -1.60378, 0, 0.7294118, 1, 1,
0.09343535, -0.6067425, 4.239956, 0, 0.7254902, 1, 1,
0.09609996, -0.1037379, 1.038958, 0, 0.7176471, 1, 1,
0.09782753, -0.5416408, 2.565182, 0, 0.7137255, 1, 1,
0.09831368, 0.9278855, -0.8715082, 0, 0.7058824, 1, 1,
0.09845257, 0.1980683, 1.616954, 0, 0.6980392, 1, 1,
0.09919924, 1.13152, 1.582668, 0, 0.6941177, 1, 1,
0.09973565, -0.6612265, 3.012637, 0, 0.6862745, 1, 1,
0.09986465, 0.1853999, 2.003505, 0, 0.682353, 1, 1,
0.1023484, -1.497754, 2.790262, 0, 0.6745098, 1, 1,
0.1048911, 0.07185339, -0.02470594, 0, 0.6705883, 1, 1,
0.1073538, 1.504771, -0.9364762, 0, 0.6627451, 1, 1,
0.1094841, 0.9562777, -0.9784553, 0, 0.6588235, 1, 1,
0.1130849, -1.071158, 3.096018, 0, 0.6509804, 1, 1,
0.1137982, -0.2480174, 2.742107, 0, 0.6470588, 1, 1,
0.1270988, 0.5083711, 1.132143, 0, 0.6392157, 1, 1,
0.1277265, 1.199773, 0.4430241, 0, 0.6352941, 1, 1,
0.1306591, 0.8974378, -0.6059287, 0, 0.627451, 1, 1,
0.1310732, 0.5052508, 0.05813088, 0, 0.6235294, 1, 1,
0.1332547, 0.1904804, 0.1091435, 0, 0.6156863, 1, 1,
0.1368763, 0.001656074, 2.34126, 0, 0.6117647, 1, 1,
0.137291, -1.101771, 3.138302, 0, 0.6039216, 1, 1,
0.1375684, 0.4902954, -0.5297678, 0, 0.5960785, 1, 1,
0.1387724, -0.8519117, 1.189633, 0, 0.5921569, 1, 1,
0.1394461, 1.713109, -0.2303999, 0, 0.5843138, 1, 1,
0.1425417, -1.583254, 3.361937, 0, 0.5803922, 1, 1,
0.14632, 1.136783, -0.3937037, 0, 0.572549, 1, 1,
0.1467487, 0.752753, -0.658445, 0, 0.5686275, 1, 1,
0.1472777, -1.010614, 2.175245, 0, 0.5607843, 1, 1,
0.1484943, -1.693425, 2.21674, 0, 0.5568628, 1, 1,
0.1577699, -0.2497789, 1.967806, 0, 0.5490196, 1, 1,
0.1586044, -0.09556327, 1.777298, 0, 0.5450981, 1, 1,
0.1616841, -0.5248525, 2.499938, 0, 0.5372549, 1, 1,
0.16398, 0.1174192, 1.030196, 0, 0.5333334, 1, 1,
0.1675118, 0.06986222, 1.108668, 0, 0.5254902, 1, 1,
0.1714286, -0.5669087, 3.796251, 0, 0.5215687, 1, 1,
0.176437, -0.1608605, 2.154533, 0, 0.5137255, 1, 1,
0.1812089, -1.173423, 1.768449, 0, 0.509804, 1, 1,
0.1825424, 1.524086, 1.470117, 0, 0.5019608, 1, 1,
0.1846043, 1.046481, -0.1643069, 0, 0.4941176, 1, 1,
0.184907, -1.835688, 2.619818, 0, 0.4901961, 1, 1,
0.1871434, 0.892346, -0.4982263, 0, 0.4823529, 1, 1,
0.1872226, -0.4105628, 2.73433, 0, 0.4784314, 1, 1,
0.1886363, -0.4101073, 2.850174, 0, 0.4705882, 1, 1,
0.1913312, -0.1227247, 0.2264972, 0, 0.4666667, 1, 1,
0.1921664, -0.06234786, 0.781809, 0, 0.4588235, 1, 1,
0.1983414, -0.01455446, 1.237433, 0, 0.454902, 1, 1,
0.1986473, -0.5595672, 4.985083, 0, 0.4470588, 1, 1,
0.199545, -0.452231, 3.800976, 0, 0.4431373, 1, 1,
0.2027918, -1.152222, 3.174625, 0, 0.4352941, 1, 1,
0.2030553, 0.1576649, 0.1421321, 0, 0.4313726, 1, 1,
0.2103513, -0.815443, 3.110559, 0, 0.4235294, 1, 1,
0.2118199, 1.071613, 1.274022, 0, 0.4196078, 1, 1,
0.2156031, -1.369383, 3.892266, 0, 0.4117647, 1, 1,
0.2198058, 0.9535175, 0.4184781, 0, 0.4078431, 1, 1,
0.225404, -0.4896805, 1.153007, 0, 0.4, 1, 1,
0.230652, -0.8460883, 4.631435, 0, 0.3921569, 1, 1,
0.232416, 1.252616, -0.6928662, 0, 0.3882353, 1, 1,
0.2363015, -0.1310469, 2.229465, 0, 0.3803922, 1, 1,
0.2368697, 1.200903, 0.5270846, 0, 0.3764706, 1, 1,
0.2379823, 0.6451548, 1.605018, 0, 0.3686275, 1, 1,
0.2396107, 1.253657, -1.712759, 0, 0.3647059, 1, 1,
0.2457589, 0.3295417, -0.8082818, 0, 0.3568628, 1, 1,
0.2465363, 0.7607692, 1.95372, 0, 0.3529412, 1, 1,
0.2477698, -1.344961, 4.936559, 0, 0.345098, 1, 1,
0.2489099, -0.1549495, 2.060236, 0, 0.3411765, 1, 1,
0.2538262, 0.6365472, 0.01434196, 0, 0.3333333, 1, 1,
0.2576844, 0.532821, 0.1745376, 0, 0.3294118, 1, 1,
0.257708, 0.06324766, 1.946004, 0, 0.3215686, 1, 1,
0.2628499, 1.986649, 0.7781614, 0, 0.3176471, 1, 1,
0.2641306, -0.3488015, 3.464373, 0, 0.3098039, 1, 1,
0.2727885, -1.683685, 3.063063, 0, 0.3058824, 1, 1,
0.2778862, -2.394243, 2.668576, 0, 0.2980392, 1, 1,
0.2813472, -0.4735242, 5.828071, 0, 0.2901961, 1, 1,
0.2832682, -0.9733829, 5.01477, 0, 0.2862745, 1, 1,
0.28628, -1.447417, 2.984842, 0, 0.2784314, 1, 1,
0.2899593, -2.354092, 4.323157, 0, 0.2745098, 1, 1,
0.294016, -1.007329, 2.214385, 0, 0.2666667, 1, 1,
0.2944288, 0.4575837, 0.3425572, 0, 0.2627451, 1, 1,
0.3031935, -0.5938369, 2.727272, 0, 0.254902, 1, 1,
0.3034839, -1.587413, 4.219356, 0, 0.2509804, 1, 1,
0.3120719, -0.7411977, 2.380392, 0, 0.2431373, 1, 1,
0.3139988, -1.889803, 1.278915, 0, 0.2392157, 1, 1,
0.3158587, 0.2215876, -0.5389855, 0, 0.2313726, 1, 1,
0.3174552, 0.1567739, 1.409433, 0, 0.227451, 1, 1,
0.32107, -0.9378011, 1.761119, 0, 0.2196078, 1, 1,
0.3222654, -0.3510582, 1.765928, 0, 0.2156863, 1, 1,
0.3248833, -1.601966, 2.761467, 0, 0.2078431, 1, 1,
0.3277697, -0.588315, 2.750238, 0, 0.2039216, 1, 1,
0.3296758, -1.961986, 1.84707, 0, 0.1960784, 1, 1,
0.3334762, 0.4177877, -0.2143249, 0, 0.1882353, 1, 1,
0.340676, -0.8813017, 3.152168, 0, 0.1843137, 1, 1,
0.3454532, 0.3011113, 2.286467, 0, 0.1764706, 1, 1,
0.3513549, 0.7664746, 1.046307, 0, 0.172549, 1, 1,
0.3554339, 0.7711343, 1.622772, 0, 0.1647059, 1, 1,
0.3757862, 1.381931, 0.8157054, 0, 0.1607843, 1, 1,
0.3781397, 0.4533533, 0.4074914, 0, 0.1529412, 1, 1,
0.3782912, 0.2316584, -0.7959423, 0, 0.1490196, 1, 1,
0.3788669, -0.1123538, 2.42918, 0, 0.1411765, 1, 1,
0.3792105, -1.334488, 2.706668, 0, 0.1372549, 1, 1,
0.3817259, 1.65797, -0.9046206, 0, 0.1294118, 1, 1,
0.3830912, 0.4973904, 0.421763, 0, 0.1254902, 1, 1,
0.3859678, 1.849161, 0.6453013, 0, 0.1176471, 1, 1,
0.3950358, -1.49678, 2.901975, 0, 0.1137255, 1, 1,
0.3971661, 1.910084, 2.120423, 0, 0.1058824, 1, 1,
0.3973481, -1.160122, 3.674405, 0, 0.09803922, 1, 1,
0.4002469, 0.8283229, 1.357658, 0, 0.09411765, 1, 1,
0.4060042, -1.251717, 3.146307, 0, 0.08627451, 1, 1,
0.4169132, -1.148608, 1.793007, 0, 0.08235294, 1, 1,
0.4194188, 1.589069, -0.4303665, 0, 0.07450981, 1, 1,
0.4200934, 0.3886569, 0.6293007, 0, 0.07058824, 1, 1,
0.4278534, 0.03671335, 2.474476, 0, 0.0627451, 1, 1,
0.4321818, 1.772172, -0.6581113, 0, 0.05882353, 1, 1,
0.4345495, 0.4212403, 0.1728321, 0, 0.05098039, 1, 1,
0.4379474, 0.4952151, -1.144289, 0, 0.04705882, 1, 1,
0.438694, -0.8336957, 2.803628, 0, 0.03921569, 1, 1,
0.4407525, -0.8630789, 2.025839, 0, 0.03529412, 1, 1,
0.4483783, 0.5753681, -0.3470262, 0, 0.02745098, 1, 1,
0.4490694, 1.624056, 0.5116341, 0, 0.02352941, 1, 1,
0.4509997, 1.20808, -0.07786571, 0, 0.01568628, 1, 1,
0.4531214, 1.359844, 1.329902, 0, 0.01176471, 1, 1,
0.457872, -0.5495932, 2.321307, 0, 0.003921569, 1, 1,
0.4614647, -0.5073892, 2.779052, 0.003921569, 0, 1, 1,
0.4621251, -0.5942311, 0.7004535, 0.007843138, 0, 1, 1,
0.4636391, -0.3189791, 2.723613, 0.01568628, 0, 1, 1,
0.4706422, 0.4647731, 3.039385, 0.01960784, 0, 1, 1,
0.474265, -0.0227122, 0.6316079, 0.02745098, 0, 1, 1,
0.4828086, -1.348105, 2.741867, 0.03137255, 0, 1, 1,
0.4858108, 0.1649066, -0.6765766, 0.03921569, 0, 1, 1,
0.4861391, 0.307065, 1.560376, 0.04313726, 0, 1, 1,
0.4864478, 0.2590233, 2.630378, 0.05098039, 0, 1, 1,
0.493088, -0.3095187, 2.702176, 0.05490196, 0, 1, 1,
0.4994189, -2.023118, 2.155714, 0.0627451, 0, 1, 1,
0.5001232, 0.7756766, -0.4990203, 0.06666667, 0, 1, 1,
0.5029814, -1.199578, 0.9944752, 0.07450981, 0, 1, 1,
0.5054516, 1.53232, 0.1804128, 0.07843138, 0, 1, 1,
0.5066535, 0.1273938, 1.350312, 0.08627451, 0, 1, 1,
0.5099565, 0.4860914, 0.04594317, 0.09019608, 0, 1, 1,
0.5107695, -0.9244343, 3.332184, 0.09803922, 0, 1, 1,
0.5139194, 1.168647, 1.650222, 0.1058824, 0, 1, 1,
0.5200315, -0.142533, 1.247348, 0.1098039, 0, 1, 1,
0.532295, -1.209916, 2.406717, 0.1176471, 0, 1, 1,
0.5373272, 0.4386921, -0.6993326, 0.1215686, 0, 1, 1,
0.542224, -0.2800706, 2.254498, 0.1294118, 0, 1, 1,
0.5457941, 0.6406702, 0.08980692, 0.1333333, 0, 1, 1,
0.549145, -0.4234559, 2.326049, 0.1411765, 0, 1, 1,
0.5521003, -0.3947563, 1.986885, 0.145098, 0, 1, 1,
0.5534801, -0.01552809, 0.2278399, 0.1529412, 0, 1, 1,
0.5536559, -1.2794, 2.662717, 0.1568628, 0, 1, 1,
0.5712612, 1.710836, 1.578174, 0.1647059, 0, 1, 1,
0.5755763, 0.4900191, 1.087478, 0.1686275, 0, 1, 1,
0.5782597, -0.8385855, 2.174908, 0.1764706, 0, 1, 1,
0.5807682, -0.03004099, 0.3290994, 0.1803922, 0, 1, 1,
0.5818079, -1.270445, 1.676251, 0.1882353, 0, 1, 1,
0.5850995, -0.3833461, 0.4400745, 0.1921569, 0, 1, 1,
0.5879284, -0.9036823, 4.389764, 0.2, 0, 1, 1,
0.58838, 0.9807954, 0.1784242, 0.2078431, 0, 1, 1,
0.5893611, -0.7090146, 2.492451, 0.2117647, 0, 1, 1,
0.5903657, 0.02699356, 2.634659, 0.2196078, 0, 1, 1,
0.5915351, -0.5390633, 2.416344, 0.2235294, 0, 1, 1,
0.5933466, 1.280252, 1.0065, 0.2313726, 0, 1, 1,
0.5935675, 0.2609203, 1.384276, 0.2352941, 0, 1, 1,
0.5959466, 0.8679467, 0.6949793, 0.2431373, 0, 1, 1,
0.5970446, 0.3337224, 0.5360928, 0.2470588, 0, 1, 1,
0.5979112, 0.5431704, 0.6293283, 0.254902, 0, 1, 1,
0.6011541, 1.193782, 1.58932, 0.2588235, 0, 1, 1,
0.6071265, -1.062013, 1.917961, 0.2666667, 0, 1, 1,
0.6122445, -0.05515946, 1.69359, 0.2705882, 0, 1, 1,
0.6153423, -0.1023256, -1.075921, 0.2784314, 0, 1, 1,
0.6156879, 0.3503868, 0.2474299, 0.282353, 0, 1, 1,
0.6178824, -0.06515856, 2.10335, 0.2901961, 0, 1, 1,
0.625797, -0.1330111, 3.439568, 0.2941177, 0, 1, 1,
0.6313908, 0.1454004, 2.569713, 0.3019608, 0, 1, 1,
0.6315638, 0.3743356, -0.6336172, 0.3098039, 0, 1, 1,
0.6350168, -0.5598131, 1.277933, 0.3137255, 0, 1, 1,
0.6409003, -1.70617, 3.619633, 0.3215686, 0, 1, 1,
0.643018, 1.211319, 0.6363994, 0.3254902, 0, 1, 1,
0.6443424, 1.11364, 0.7480791, 0.3333333, 0, 1, 1,
0.6536401, 1.417555, -2.28825, 0.3372549, 0, 1, 1,
0.6591784, -1.054105, 3.983325, 0.345098, 0, 1, 1,
0.6600899, -0.03083084, 1.231316, 0.3490196, 0, 1, 1,
0.6658489, 0.5022377, -0.2500962, 0.3568628, 0, 1, 1,
0.666316, 0.5209843, 1.221443, 0.3607843, 0, 1, 1,
0.6726835, -1.02952, 0.3029479, 0.3686275, 0, 1, 1,
0.6731376, -1.172506, 1.312161, 0.372549, 0, 1, 1,
0.6744232, 0.6833813, 0.8324803, 0.3803922, 0, 1, 1,
0.6790788, -1.872029, 2.099323, 0.3843137, 0, 1, 1,
0.6859012, -0.6707593, 1.503518, 0.3921569, 0, 1, 1,
0.6879625, 0.7861081, -0.4157171, 0.3960784, 0, 1, 1,
0.692373, -0.5958433, 3.003251, 0.4039216, 0, 1, 1,
0.6939676, -0.668802, 2.20498, 0.4117647, 0, 1, 1,
0.7076014, -1.391117, 3.190825, 0.4156863, 0, 1, 1,
0.7098733, -1.865842, 4.14801, 0.4235294, 0, 1, 1,
0.7139978, -1.096187, 2.41763, 0.427451, 0, 1, 1,
0.7166954, -1.258099, 3.548722, 0.4352941, 0, 1, 1,
0.7200959, -0.7235678, 1.96841, 0.4392157, 0, 1, 1,
0.7247094, 0.08743121, 2.13864, 0.4470588, 0, 1, 1,
0.725015, -1.068185, 2.814527, 0.4509804, 0, 1, 1,
0.7250496, -0.9805945, 2.425273, 0.4588235, 0, 1, 1,
0.7355418, -0.3715355, 2.085234, 0.4627451, 0, 1, 1,
0.7373173, 0.03316891, 1.658502, 0.4705882, 0, 1, 1,
0.7391286, 0.4998067, 0.4774859, 0.4745098, 0, 1, 1,
0.7408455, 0.08262864, 0.4128689, 0.4823529, 0, 1, 1,
0.7449193, -0.5924804, 1.414318, 0.4862745, 0, 1, 1,
0.7463331, 1.658872, -0.7483349, 0.4941176, 0, 1, 1,
0.7467285, 1.254277, -0.1000275, 0.5019608, 0, 1, 1,
0.746891, -0.3781002, 3.19248, 0.5058824, 0, 1, 1,
0.7473077, 0.5226378, 0.6643588, 0.5137255, 0, 1, 1,
0.7479439, -0.3228895, 1.797169, 0.5176471, 0, 1, 1,
0.748107, -2.532515, 2.569703, 0.5254902, 0, 1, 1,
0.7514609, -0.2930134, 2.432401, 0.5294118, 0, 1, 1,
0.7540814, 0.6326638, 2.03328, 0.5372549, 0, 1, 1,
0.7619615, -0.7483315, 2.630654, 0.5411765, 0, 1, 1,
0.76307, -1.748066, 1.385571, 0.5490196, 0, 1, 1,
0.7708002, -0.5938642, 0.8491958, 0.5529412, 0, 1, 1,
0.7766787, -0.7430615, 3.494254, 0.5607843, 0, 1, 1,
0.7899498, 1.053, -1.513737, 0.5647059, 0, 1, 1,
0.7936586, -0.851881, 2.759446, 0.572549, 0, 1, 1,
0.7967806, -0.8332972, 3.946642, 0.5764706, 0, 1, 1,
0.798286, 1.564316, -0.01482551, 0.5843138, 0, 1, 1,
0.8057932, 1.763578, -0.4542235, 0.5882353, 0, 1, 1,
0.8059266, 0.05149901, 2.845533, 0.5960785, 0, 1, 1,
0.8150812, 2.161133, -0.3749927, 0.6039216, 0, 1, 1,
0.8156075, 0.03182786, -0.1775679, 0.6078432, 0, 1, 1,
0.818143, 1.636733, 1.332751, 0.6156863, 0, 1, 1,
0.8189428, 0.3547167, 2.205432, 0.6196079, 0, 1, 1,
0.8272505, -0.9120391, 2.037367, 0.627451, 0, 1, 1,
0.8307083, 0.3902604, 2.640154, 0.6313726, 0, 1, 1,
0.8348756, 0.01728235, 1.860446, 0.6392157, 0, 1, 1,
0.8361238, -0.972896, 2.931146, 0.6431373, 0, 1, 1,
0.8361796, 1.052765, 1.077032, 0.6509804, 0, 1, 1,
0.8410289, -0.5376282, 0.1002154, 0.654902, 0, 1, 1,
0.8436318, 1.542106, -0.06860848, 0.6627451, 0, 1, 1,
0.8458977, -0.2607895, 1.376957, 0.6666667, 0, 1, 1,
0.8478538, 0.4536485, 1.127677, 0.6745098, 0, 1, 1,
0.8545694, -0.2690381, 2.801873, 0.6784314, 0, 1, 1,
0.8709524, 1.481267, 0.4257047, 0.6862745, 0, 1, 1,
0.8735827, -0.7744321, 2.010073, 0.6901961, 0, 1, 1,
0.8823344, -0.1967718, 3.017706, 0.6980392, 0, 1, 1,
0.8988227, 0.04098707, 2.277879, 0.7058824, 0, 1, 1,
0.9008092, -0.5498661, 1.224478, 0.7098039, 0, 1, 1,
0.9035417, -0.9785254, 2.97925, 0.7176471, 0, 1, 1,
0.9036534, 0.1482513, 2.682065, 0.7215686, 0, 1, 1,
0.9043558, 0.1645034, 2.177279, 0.7294118, 0, 1, 1,
0.9060352, 0.1695151, 1.860429, 0.7333333, 0, 1, 1,
0.9080372, -0.7002103, 2.900586, 0.7411765, 0, 1, 1,
0.9187282, 0.7409106, 0.1910289, 0.7450981, 0, 1, 1,
0.9237744, 1.286967, 1.097636, 0.7529412, 0, 1, 1,
0.9243475, -3.302456, 2.380728, 0.7568628, 0, 1, 1,
0.9288047, 0.3050477, 1.053623, 0.7647059, 0, 1, 1,
0.9337694, 2.980894, 1.323281, 0.7686275, 0, 1, 1,
0.9347855, 0.2272655, 0.3222435, 0.7764706, 0, 1, 1,
0.93502, 1.013335, 1.077472, 0.7803922, 0, 1, 1,
0.9465193, 0.4661522, 3.147683, 0.7882353, 0, 1, 1,
0.9517028, 0.4249438, 2.632065, 0.7921569, 0, 1, 1,
0.9520856, 1.002193, 0.967222, 0.8, 0, 1, 1,
0.9531755, -0.8614287, 2.480031, 0.8078431, 0, 1, 1,
0.9554821, -0.7084792, 3.298249, 0.8117647, 0, 1, 1,
0.9587086, -0.05796386, 1.328878, 0.8196079, 0, 1, 1,
0.9612466, -0.3925295, 0.3587492, 0.8235294, 0, 1, 1,
0.9682553, 1.02128, -0.1346399, 0.8313726, 0, 1, 1,
0.971485, 0.4853428, 1.148564, 0.8352941, 0, 1, 1,
0.9716389, -0.9502153, 2.47169, 0.8431373, 0, 1, 1,
0.9723812, -0.5122377, 2.999606, 0.8470588, 0, 1, 1,
0.9728641, -1.126348, 2.729912, 0.854902, 0, 1, 1,
0.9750149, -0.4745098, 4.359432, 0.8588235, 0, 1, 1,
0.9777918, -0.1457012, 0.3567061, 0.8666667, 0, 1, 1,
0.9840975, -1.4627, 2.299992, 0.8705882, 0, 1, 1,
1.003766, -0.3465424, 1.213463, 0.8784314, 0, 1, 1,
1.004929, 1.592235, 2.213675, 0.8823529, 0, 1, 1,
1.005592, -0.984786, 1.941342, 0.8901961, 0, 1, 1,
1.016912, 0.4944469, -0.09946035, 0.8941177, 0, 1, 1,
1.019429, -1.228833, 1.215135, 0.9019608, 0, 1, 1,
1.020179, 0.1785302, 1.280411, 0.9098039, 0, 1, 1,
1.022858, -0.8700064, 1.190899, 0.9137255, 0, 1, 1,
1.028245, 0.1538894, 1.738127, 0.9215686, 0, 1, 1,
1.029956, 0.1374473, 1.634831, 0.9254902, 0, 1, 1,
1.032091, -0.6163386, 3.081325, 0.9333333, 0, 1, 1,
1.032569, -1.363262, 3.446024, 0.9372549, 0, 1, 1,
1.036277, 0.9112915, 2.653912, 0.945098, 0, 1, 1,
1.040713, -0.4501941, 1.028552, 0.9490196, 0, 1, 1,
1.050495, 0.1623513, 1.584797, 0.9568627, 0, 1, 1,
1.059824, -0.08044899, 4.673372, 0.9607843, 0, 1, 1,
1.060448, -0.3356859, 2.888044, 0.9686275, 0, 1, 1,
1.063925, -0.1033209, 2.304503, 0.972549, 0, 1, 1,
1.065501, -0.3648835, 2.081345, 0.9803922, 0, 1, 1,
1.071041, 1.027781, 1.500923, 0.9843137, 0, 1, 1,
1.072022, 0.07283471, 3.728742, 0.9921569, 0, 1, 1,
1.072431, 0.9513202, -0.2150223, 0.9960784, 0, 1, 1,
1.083925, 0.1562551, 2.059012, 1, 0, 0.9960784, 1,
1.086561, 0.1951975, 3.333943, 1, 0, 0.9882353, 1,
1.090849, 0.1779147, 0.4520863, 1, 0, 0.9843137, 1,
1.091848, 1.331381, 2.088735, 1, 0, 0.9764706, 1,
1.093046, -0.1357682, 1.743831, 1, 0, 0.972549, 1,
1.095386, 1.412199, 1.07237, 1, 0, 0.9647059, 1,
1.100826, 1.59904, 0.7403366, 1, 0, 0.9607843, 1,
1.108875, 0.7618077, 0.254646, 1, 0, 0.9529412, 1,
1.109442, -0.9181326, 3.271851, 1, 0, 0.9490196, 1,
1.112387, -2.327026, 2.00062, 1, 0, 0.9411765, 1,
1.117226, -0.3567802, 1.727041, 1, 0, 0.9372549, 1,
1.117233, 1.483459, 1.009762, 1, 0, 0.9294118, 1,
1.117521, -1.094008, 1.778146, 1, 0, 0.9254902, 1,
1.119449, 0.2001621, 1.978285, 1, 0, 0.9176471, 1,
1.123334, -0.4663043, 2.832344, 1, 0, 0.9137255, 1,
1.124372, -1.711557, 1.35825, 1, 0, 0.9058824, 1,
1.129772, -0.5822825, 2.856024, 1, 0, 0.9019608, 1,
1.131274, 0.9350268, -0.4712323, 1, 0, 0.8941177, 1,
1.132295, -1.142123, 3.08848, 1, 0, 0.8862745, 1,
1.133703, -0.2495716, 3.372635, 1, 0, 0.8823529, 1,
1.136305, -1.439427, 0.4324368, 1, 0, 0.8745098, 1,
1.137033, -0.2214666, 2.581472, 1, 0, 0.8705882, 1,
1.141379, -0.3017471, 1.620202, 1, 0, 0.8627451, 1,
1.147174, 0.149939, 2.170028, 1, 0, 0.8588235, 1,
1.155949, 0.4935861, 0.3233242, 1, 0, 0.8509804, 1,
1.158736, 1.237309, -0.811043, 1, 0, 0.8470588, 1,
1.171117, -0.6454972, 2.716732, 1, 0, 0.8392157, 1,
1.173005, 0.5997587, 0.563306, 1, 0, 0.8352941, 1,
1.173325, 0.562739, 1.393232, 1, 0, 0.827451, 1,
1.176432, 0.5780286, 2.44184, 1, 0, 0.8235294, 1,
1.178341, -1.76436, 2.064129, 1, 0, 0.8156863, 1,
1.182948, -0.08213611, 1.463297, 1, 0, 0.8117647, 1,
1.189166, 0.3392776, 0.2866859, 1, 0, 0.8039216, 1,
1.191212, 0.4274169, 1.701867, 1, 0, 0.7960784, 1,
1.19327, -0.8551731, 2.544491, 1, 0, 0.7921569, 1,
1.195822, 1.035036, 0.5245051, 1, 0, 0.7843137, 1,
1.19889, -0.7562755, 2.79568, 1, 0, 0.7803922, 1,
1.200031, -0.3596015, 3.312404, 1, 0, 0.772549, 1,
1.207506, 0.8821227, 1.241795, 1, 0, 0.7686275, 1,
1.20793, 0.6466641, 1.072255, 1, 0, 0.7607843, 1,
1.208621, -0.8545523, 3.127487, 1, 0, 0.7568628, 1,
1.216711, 1.167081, 0.416508, 1, 0, 0.7490196, 1,
1.22015, 0.9673935, 1.541507, 1, 0, 0.7450981, 1,
1.225558, -0.3590846, 1.443323, 1, 0, 0.7372549, 1,
1.225923, 2.550466, 0.032441, 1, 0, 0.7333333, 1,
1.238495, 0.3163441, 1.082435, 1, 0, 0.7254902, 1,
1.239179, 1.864213, -1.875909, 1, 0, 0.7215686, 1,
1.245144, 0.5004616, 1.908848, 1, 0, 0.7137255, 1,
1.251368, -0.690396, 2.28038, 1, 0, 0.7098039, 1,
1.252862, -1.291727, 2.848624, 1, 0, 0.7019608, 1,
1.253208, 0.1254273, 1.022896, 1, 0, 0.6941177, 1,
1.255018, -0.127788, 2.760402, 1, 0, 0.6901961, 1,
1.258499, 0.2539273, 2.814022, 1, 0, 0.682353, 1,
1.258802, -0.1430496, 2.892813, 1, 0, 0.6784314, 1,
1.262575, 0.6697584, 1.099635, 1, 0, 0.6705883, 1,
1.264214, -0.5707334, 1.032876, 1, 0, 0.6666667, 1,
1.270033, -0.2055449, 0.4092585, 1, 0, 0.6588235, 1,
1.272029, 0.8702333, 0.680246, 1, 0, 0.654902, 1,
1.272607, -0.5094201, 2.743021, 1, 0, 0.6470588, 1,
1.273306, -1.247787, 1.087168, 1, 0, 0.6431373, 1,
1.281956, -0.7279607, -0.1516935, 1, 0, 0.6352941, 1,
1.282378, -3.241746, 4.027283, 1, 0, 0.6313726, 1,
1.289094, 0.5660442, 2.131702, 1, 0, 0.6235294, 1,
1.295319, 0.4514778, -0.3146105, 1, 0, 0.6196079, 1,
1.299013, -1.789226, 1.178403, 1, 0, 0.6117647, 1,
1.304302, 0.5658539, 1.710486, 1, 0, 0.6078432, 1,
1.30888, -1.128803, 1.315769, 1, 0, 0.6, 1,
1.310652, 0.1929403, 1.991097, 1, 0, 0.5921569, 1,
1.327006, -0.9558378, 2.525005, 1, 0, 0.5882353, 1,
1.33022, 1.271558, 3.139049, 1, 0, 0.5803922, 1,
1.333115, -1.500909, 2.976743, 1, 0, 0.5764706, 1,
1.336172, 1.113207, 0.8171471, 1, 0, 0.5686275, 1,
1.339116, -2.258676, 1.591721, 1, 0, 0.5647059, 1,
1.349503, 0.005563523, 2.434055, 1, 0, 0.5568628, 1,
1.358101, 0.8521793, 0.9950699, 1, 0, 0.5529412, 1,
1.373574, -0.5331262, 1.164078, 1, 0, 0.5450981, 1,
1.378469, -0.2346004, 1.299266, 1, 0, 0.5411765, 1,
1.385636, -0.3616532, 2.252322, 1, 0, 0.5333334, 1,
1.390568, 1.637591, -0.1983055, 1, 0, 0.5294118, 1,
1.391706, -1.461337, 4.238833, 1, 0, 0.5215687, 1,
1.393965, 0.1166585, 1.936823, 1, 0, 0.5176471, 1,
1.399834, 0.3195212, 1.385134, 1, 0, 0.509804, 1,
1.413017, -1.629269, 2.24913, 1, 0, 0.5058824, 1,
1.414363, -0.7361483, 1.64146, 1, 0, 0.4980392, 1,
1.421259, -0.446505, 2.27168, 1, 0, 0.4901961, 1,
1.439898, 0.503635, -0.03548439, 1, 0, 0.4862745, 1,
1.441964, -1.313084, 2.769848, 1, 0, 0.4784314, 1,
1.444459, 0.01025619, 1.620992, 1, 0, 0.4745098, 1,
1.446502, -1.991041, 2.94931, 1, 0, 0.4666667, 1,
1.446528, 0.9408318, 0.9037181, 1, 0, 0.4627451, 1,
1.455938, -0.9835768, 2.1208, 1, 0, 0.454902, 1,
1.459269, 0.437592, 1.30542, 1, 0, 0.4509804, 1,
1.462471, 2.183909, -0.009559033, 1, 0, 0.4431373, 1,
1.469472, -0.1390174, 1.248111, 1, 0, 0.4392157, 1,
1.472006, 0.6644729, 2.03523, 1, 0, 0.4313726, 1,
1.472633, 1.949164, -0.2882534, 1, 0, 0.427451, 1,
1.475118, 0.7383541, 2.267959, 1, 0, 0.4196078, 1,
1.491917, -0.166061, 2.247036, 1, 0, 0.4156863, 1,
1.496869, 0.7428183, 2.097047, 1, 0, 0.4078431, 1,
1.500984, 0.3319238, 2.393886, 1, 0, 0.4039216, 1,
1.516276, 0.3081976, 2.560696, 1, 0, 0.3960784, 1,
1.517901, -0.8077605, 2.345098, 1, 0, 0.3882353, 1,
1.526799, -0.2301998, 3.508958, 1, 0, 0.3843137, 1,
1.553712, 0.6080902, 0.4277814, 1, 0, 0.3764706, 1,
1.554124, -0.5436104, 3.092288, 1, 0, 0.372549, 1,
1.575976, -1.513605, 3.75497, 1, 0, 0.3647059, 1,
1.59054, 0.1743752, 2.402591, 1, 0, 0.3607843, 1,
1.602341, -1.191224, 0.9961771, 1, 0, 0.3529412, 1,
1.605896, -0.4813949, 1.576192, 1, 0, 0.3490196, 1,
1.608245, 1.184021, 0.6390354, 1, 0, 0.3411765, 1,
1.615636, -1.024805, 3.40019, 1, 0, 0.3372549, 1,
1.623232, 0.520609, 1.650798, 1, 0, 0.3294118, 1,
1.626381, -0.5123249, 1.738227, 1, 0, 0.3254902, 1,
1.640197, -0.1745611, 3.376611, 1, 0, 0.3176471, 1,
1.641706, -1.774625, 2.264241, 1, 0, 0.3137255, 1,
1.64399, -2.463227, 3.341477, 1, 0, 0.3058824, 1,
1.673118, -3.032936, 2.581572, 1, 0, 0.2980392, 1,
1.680433, -1.202876, 2.213935, 1, 0, 0.2941177, 1,
1.703079, 1.127431, 0.4638307, 1, 0, 0.2862745, 1,
1.713509, 1.802779, -1.008168, 1, 0, 0.282353, 1,
1.726892, -0.5753476, 2.295874, 1, 0, 0.2745098, 1,
1.743696, 0.5349555, 1.518801, 1, 0, 0.2705882, 1,
1.746491, 0.786185, 2.749864, 1, 0, 0.2627451, 1,
1.752842, 0.5697408, 2.263391, 1, 0, 0.2588235, 1,
1.769322, 0.1021693, 0.9702143, 1, 0, 0.2509804, 1,
1.771337, -1.647451, 5.041782, 1, 0, 0.2470588, 1,
1.773373, 0.1086807, 2.238904, 1, 0, 0.2392157, 1,
1.776417, 0.161493, 2.174051, 1, 0, 0.2352941, 1,
1.781461, -0.5357766, 0.6697457, 1, 0, 0.227451, 1,
1.78203, -0.04128119, 0.9565802, 1, 0, 0.2235294, 1,
1.790345, -0.0414591, -0.3158923, 1, 0, 0.2156863, 1,
1.804201, 0.3968427, 1.900921, 1, 0, 0.2117647, 1,
1.812264, -1.80209, 1.848786, 1, 0, 0.2039216, 1,
1.815622, -0.9868386, 2.952712, 1, 0, 0.1960784, 1,
1.820363, 1.498686, 1.979513, 1, 0, 0.1921569, 1,
1.84245, 0.1359856, 3.039436, 1, 0, 0.1843137, 1,
1.852608, -0.09912069, 0.7319557, 1, 0, 0.1803922, 1,
1.855928, -0.7911694, 2.508673, 1, 0, 0.172549, 1,
1.917377, -0.6328225, 2.981984, 1, 0, 0.1686275, 1,
1.926721, -0.04333093, 0.9524192, 1, 0, 0.1607843, 1,
1.931028, 0.7305027, -0.4055451, 1, 0, 0.1568628, 1,
1.94668, -1.872082, 2.312644, 1, 0, 0.1490196, 1,
1.963814, 0.1738476, 2.285206, 1, 0, 0.145098, 1,
1.986887, 0.08151507, -0.7662111, 1, 0, 0.1372549, 1,
2.008689, 0.6675996, 1.590011, 1, 0, 0.1333333, 1,
2.010988, 0.6572593, 1.194273, 1, 0, 0.1254902, 1,
2.020055, -1.172134, 2.006452, 1, 0, 0.1215686, 1,
2.049984, -0.2631422, 1.785647, 1, 0, 0.1137255, 1,
2.061711, 1.359513, 2.082031, 1, 0, 0.1098039, 1,
2.16931, -0.3138859, 1.501777, 1, 0, 0.1019608, 1,
2.180372, -0.7551274, 2.714874, 1, 0, 0.09411765, 1,
2.189019, 1.188462, -0.8977563, 1, 0, 0.09019608, 1,
2.194294, -0.5476712, 0.946715, 1, 0, 0.08235294, 1,
2.200298, -0.3131753, 0.3332114, 1, 0, 0.07843138, 1,
2.207711, -1.139356, 0.340388, 1, 0, 0.07058824, 1,
2.220448, -1.865345, 1.19932, 1, 0, 0.06666667, 1,
2.258451, -0.09398083, 0.6780377, 1, 0, 0.05882353, 1,
2.301284, 0.326588, 0.7840205, 1, 0, 0.05490196, 1,
2.328775, -1.638172, 1.473559, 1, 0, 0.04705882, 1,
2.332016, -1.797946, 2.956838, 1, 0, 0.04313726, 1,
2.340269, -0.4941782, 1.731762, 1, 0, 0.03529412, 1,
2.42219, -1.40639, 1.398852, 1, 0, 0.03137255, 1,
2.428659, 0.007078497, 0.04530052, 1, 0, 0.02352941, 1,
2.460239, -0.1574824, 0.6320595, 1, 0, 0.01960784, 1,
2.599939, 0.2666277, 1.312204, 1, 0, 0.01176471, 1,
3.050492, 0.0123635, 1.121052, 1, 0, 0.007843138, 1
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
-0.02156579, -4.75235, -7.846102, 0, -0.5, 0.5, 0.5,
-0.02156579, -4.75235, -7.846102, 1, -0.5, 0.5, 0.5,
-0.02156579, -4.75235, -7.846102, 1, 1.5, 0.5, 0.5,
-0.02156579, -4.75235, -7.846102, 0, 1.5, 0.5, 0.5
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
-4.135052, -0.2771815, -7.846102, 0, -0.5, 0.5, 0.5,
-4.135052, -0.2771815, -7.846102, 1, -0.5, 0.5, 0.5,
-4.135052, -0.2771815, -7.846102, 1, 1.5, 0.5, 0.5,
-4.135052, -0.2771815, -7.846102, 0, 1.5, 0.5, 0.5
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
-4.135052, -4.75235, -0.01809144, 0, -0.5, 0.5, 0.5,
-4.135052, -4.75235, -0.01809144, 1, -0.5, 0.5, 0.5,
-4.135052, -4.75235, -0.01809144, 1, 1.5, 0.5, 0.5,
-4.135052, -4.75235, -0.01809144, 0, 1.5, 0.5, 0.5
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
-3, -3.719619, -6.039639,
3, -3.719619, -6.039639,
-3, -3.719619, -6.039639,
-3, -3.891741, -6.340716,
-2, -3.719619, -6.039639,
-2, -3.891741, -6.340716,
-1, -3.719619, -6.039639,
-1, -3.891741, -6.340716,
0, -3.719619, -6.039639,
0, -3.891741, -6.340716,
1, -3.719619, -6.039639,
1, -3.891741, -6.340716,
2, -3.719619, -6.039639,
2, -3.891741, -6.340716,
3, -3.719619, -6.039639,
3, -3.891741, -6.340716
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
-3, -4.235985, -6.942871, 0, -0.5, 0.5, 0.5,
-3, -4.235985, -6.942871, 1, -0.5, 0.5, 0.5,
-3, -4.235985, -6.942871, 1, 1.5, 0.5, 0.5,
-3, -4.235985, -6.942871, 0, 1.5, 0.5, 0.5,
-2, -4.235985, -6.942871, 0, -0.5, 0.5, 0.5,
-2, -4.235985, -6.942871, 1, -0.5, 0.5, 0.5,
-2, -4.235985, -6.942871, 1, 1.5, 0.5, 0.5,
-2, -4.235985, -6.942871, 0, 1.5, 0.5, 0.5,
-1, -4.235985, -6.942871, 0, -0.5, 0.5, 0.5,
-1, -4.235985, -6.942871, 1, -0.5, 0.5, 0.5,
-1, -4.235985, -6.942871, 1, 1.5, 0.5, 0.5,
-1, -4.235985, -6.942871, 0, 1.5, 0.5, 0.5,
0, -4.235985, -6.942871, 0, -0.5, 0.5, 0.5,
0, -4.235985, -6.942871, 1, -0.5, 0.5, 0.5,
0, -4.235985, -6.942871, 1, 1.5, 0.5, 0.5,
0, -4.235985, -6.942871, 0, 1.5, 0.5, 0.5,
1, -4.235985, -6.942871, 0, -0.5, 0.5, 0.5,
1, -4.235985, -6.942871, 1, -0.5, 0.5, 0.5,
1, -4.235985, -6.942871, 1, 1.5, 0.5, 0.5,
1, -4.235985, -6.942871, 0, 1.5, 0.5, 0.5,
2, -4.235985, -6.942871, 0, -0.5, 0.5, 0.5,
2, -4.235985, -6.942871, 1, -0.5, 0.5, 0.5,
2, -4.235985, -6.942871, 1, 1.5, 0.5, 0.5,
2, -4.235985, -6.942871, 0, 1.5, 0.5, 0.5,
3, -4.235985, -6.942871, 0, -0.5, 0.5, 0.5,
3, -4.235985, -6.942871, 1, -0.5, 0.5, 0.5,
3, -4.235985, -6.942871, 1, 1.5, 0.5, 0.5,
3, -4.235985, -6.942871, 0, 1.5, 0.5, 0.5
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
-3.185786, -3, -6.039639,
-3.185786, 3, -6.039639,
-3.185786, -3, -6.039639,
-3.343997, -3, -6.340716,
-3.185786, -2, -6.039639,
-3.343997, -2, -6.340716,
-3.185786, -1, -6.039639,
-3.343997, -1, -6.340716,
-3.185786, 0, -6.039639,
-3.343997, 0, -6.340716,
-3.185786, 1, -6.039639,
-3.343997, 1, -6.340716,
-3.185786, 2, -6.039639,
-3.343997, 2, -6.340716,
-3.185786, 3, -6.039639,
-3.343997, 3, -6.340716
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
-3.660419, -3, -6.942871, 0, -0.5, 0.5, 0.5,
-3.660419, -3, -6.942871, 1, -0.5, 0.5, 0.5,
-3.660419, -3, -6.942871, 1, 1.5, 0.5, 0.5,
-3.660419, -3, -6.942871, 0, 1.5, 0.5, 0.5,
-3.660419, -2, -6.942871, 0, -0.5, 0.5, 0.5,
-3.660419, -2, -6.942871, 1, -0.5, 0.5, 0.5,
-3.660419, -2, -6.942871, 1, 1.5, 0.5, 0.5,
-3.660419, -2, -6.942871, 0, 1.5, 0.5, 0.5,
-3.660419, -1, -6.942871, 0, -0.5, 0.5, 0.5,
-3.660419, -1, -6.942871, 1, -0.5, 0.5, 0.5,
-3.660419, -1, -6.942871, 1, 1.5, 0.5, 0.5,
-3.660419, -1, -6.942871, 0, 1.5, 0.5, 0.5,
-3.660419, 0, -6.942871, 0, -0.5, 0.5, 0.5,
-3.660419, 0, -6.942871, 1, -0.5, 0.5, 0.5,
-3.660419, 0, -6.942871, 1, 1.5, 0.5, 0.5,
-3.660419, 0, -6.942871, 0, 1.5, 0.5, 0.5,
-3.660419, 1, -6.942871, 0, -0.5, 0.5, 0.5,
-3.660419, 1, -6.942871, 1, -0.5, 0.5, 0.5,
-3.660419, 1, -6.942871, 1, 1.5, 0.5, 0.5,
-3.660419, 1, -6.942871, 0, 1.5, 0.5, 0.5,
-3.660419, 2, -6.942871, 0, -0.5, 0.5, 0.5,
-3.660419, 2, -6.942871, 1, -0.5, 0.5, 0.5,
-3.660419, 2, -6.942871, 1, 1.5, 0.5, 0.5,
-3.660419, 2, -6.942871, 0, 1.5, 0.5, 0.5,
-3.660419, 3, -6.942871, 0, -0.5, 0.5, 0.5,
-3.660419, 3, -6.942871, 1, -0.5, 0.5, 0.5,
-3.660419, 3, -6.942871, 1, 1.5, 0.5, 0.5,
-3.660419, 3, -6.942871, 0, 1.5, 0.5, 0.5
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
-3.185786, -3.719619, -4,
-3.185786, -3.719619, 4,
-3.185786, -3.719619, -4,
-3.343997, -3.891741, -4,
-3.185786, -3.719619, -2,
-3.343997, -3.891741, -2,
-3.185786, -3.719619, 0,
-3.343997, -3.891741, 0,
-3.185786, -3.719619, 2,
-3.343997, -3.891741, 2,
-3.185786, -3.719619, 4,
-3.343997, -3.891741, 4
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
-3.660419, -4.235985, -4, 0, -0.5, 0.5, 0.5,
-3.660419, -4.235985, -4, 1, -0.5, 0.5, 0.5,
-3.660419, -4.235985, -4, 1, 1.5, 0.5, 0.5,
-3.660419, -4.235985, -4, 0, 1.5, 0.5, 0.5,
-3.660419, -4.235985, -2, 0, -0.5, 0.5, 0.5,
-3.660419, -4.235985, -2, 1, -0.5, 0.5, 0.5,
-3.660419, -4.235985, -2, 1, 1.5, 0.5, 0.5,
-3.660419, -4.235985, -2, 0, 1.5, 0.5, 0.5,
-3.660419, -4.235985, 0, 0, -0.5, 0.5, 0.5,
-3.660419, -4.235985, 0, 1, -0.5, 0.5, 0.5,
-3.660419, -4.235985, 0, 1, 1.5, 0.5, 0.5,
-3.660419, -4.235985, 0, 0, 1.5, 0.5, 0.5,
-3.660419, -4.235985, 2, 0, -0.5, 0.5, 0.5,
-3.660419, -4.235985, 2, 1, -0.5, 0.5, 0.5,
-3.660419, -4.235985, 2, 1, 1.5, 0.5, 0.5,
-3.660419, -4.235985, 2, 0, 1.5, 0.5, 0.5,
-3.660419, -4.235985, 4, 0, -0.5, 0.5, 0.5,
-3.660419, -4.235985, 4, 1, -0.5, 0.5, 0.5,
-3.660419, -4.235985, 4, 1, 1.5, 0.5, 0.5,
-3.660419, -4.235985, 4, 0, 1.5, 0.5, 0.5
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
-3.185786, -3.719619, -6.039639,
-3.185786, 3.165256, -6.039639,
-3.185786, -3.719619, 6.003456,
-3.185786, 3.165256, 6.003456,
-3.185786, -3.719619, -6.039639,
-3.185786, -3.719619, 6.003456,
-3.185786, 3.165256, -6.039639,
-3.185786, 3.165256, 6.003456,
-3.185786, -3.719619, -6.039639,
3.142654, -3.719619, -6.039639,
-3.185786, -3.719619, 6.003456,
3.142654, -3.719619, 6.003456,
-3.185786, 3.165256, -6.039639,
3.142654, 3.165256, -6.039639,
-3.185786, 3.165256, 6.003456,
3.142654, 3.165256, 6.003456,
3.142654, -3.719619, -6.039639,
3.142654, 3.165256, -6.039639,
3.142654, -3.719619, 6.003456,
3.142654, 3.165256, 6.003456,
3.142654, -3.719619, -6.039639,
3.142654, -3.719619, 6.003456,
3.142654, 3.165256, -6.039639,
3.142654, 3.165256, 6.003456
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
var radius = 8.141878;
var distance = 36.22414;
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
mvMatrix.translate( 0.02156579, 0.2771815, 0.01809144 );
mvMatrix.scale( 1.391047, 1.278623, 0.7309715 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.22414);
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
Propyl_carbamate<-read.table("Propyl_carbamate.xyz")
```

```
## Error in read.table("Propyl_carbamate.xyz"): no lines available in input
```

```r
x<-Propyl_carbamate$V2
```

```
## Error in eval(expr, envir, enclos): object 'Propyl_carbamate' not found
```

```r
y<-Propyl_carbamate$V3
```

```
## Error in eval(expr, envir, enclos): object 'Propyl_carbamate' not found
```

```r
z<-Propyl_carbamate$V4
```

```
## Error in eval(expr, envir, enclos): object 'Propyl_carbamate' not found
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
-3.093624, -0.4074965, -2.466004, 0, 0, 1, 1, 1,
-3.087146, 0.5336022, -0.7911434, 1, 0, 0, 1, 1,
-2.894284, -0.2111389, -0.7025969, 1, 0, 0, 1, 1,
-2.883687, 0.1928854, -2.003121, 1, 0, 0, 1, 1,
-2.856388, -1.036854, -2.523683, 1, 0, 0, 1, 1,
-2.7915, -0.2644828, -0.9527835, 1, 0, 0, 1, 1,
-2.77159, 0.3579983, -1.353509, 0, 0, 0, 1, 1,
-2.710696, 0.6175534, -1.41617, 0, 0, 0, 1, 1,
-2.472104, 1.443258, -2.082443, 0, 0, 0, 1, 1,
-2.448169, 0.4483677, -0.8250712, 0, 0, 0, 1, 1,
-2.318658, -1.004397, -3.176907, 0, 0, 0, 1, 1,
-2.266551, 0.2653173, -2.900945, 0, 0, 0, 1, 1,
-2.235862, -0.8498357, -0.09168896, 0, 0, 0, 1, 1,
-2.230491, 1.583999, -0.3886738, 1, 1, 1, 1, 1,
-2.200993, -1.089254, -1.259377, 1, 1, 1, 1, 1,
-2.19899, 0.2606197, -2.242342, 1, 1, 1, 1, 1,
-2.171231, 0.8255243, -0.2863228, 1, 1, 1, 1, 1,
-2.158777, -0.219762, -1.788484, 1, 1, 1, 1, 1,
-2.154537, 0.4048456, -2.611907, 1, 1, 1, 1, 1,
-2.14811, -0.6762497, -1.49902, 1, 1, 1, 1, 1,
-2.13811, -0.2694359, -1.895084, 1, 1, 1, 1, 1,
-2.135453, -0.4694122, -2.823956, 1, 1, 1, 1, 1,
-2.128134, -0.4026249, -1.976519, 1, 1, 1, 1, 1,
-2.126574, -0.8820237, -0.4262162, 1, 1, 1, 1, 1,
-2.118935, -0.7006787, -1.523003, 1, 1, 1, 1, 1,
-2.079229, 0.7838288, -2.83469, 1, 1, 1, 1, 1,
-2.078634, 1.257338, -0.7156793, 1, 1, 1, 1, 1,
-2.07858, 2.790392, -2.537063, 1, 1, 1, 1, 1,
-2.054573, 1.477015, 0.9511983, 0, 0, 1, 1, 1,
-2.04016, -0.004196993, -3.324261, 1, 0, 0, 1, 1,
-2.013517, 0.1604306, -0.3613625, 1, 0, 0, 1, 1,
-2.008129, 0.2819826, -3.483333, 1, 0, 0, 1, 1,
-2.007803, -0.785553, -2.024906, 1, 0, 0, 1, 1,
-1.989325, -1.055369, -1.63303, 1, 0, 0, 1, 1,
-1.974927, 3.064991, -0.5029413, 0, 0, 0, 1, 1,
-1.974598, -1.565704, -2.69554, 0, 0, 0, 1, 1,
-1.968904, 0.9586613, -1.210659, 0, 0, 0, 1, 1,
-1.963689, 0.04733035, -2.955749, 0, 0, 0, 1, 1,
-1.934501, -0.8846987, -2.754069, 0, 0, 0, 1, 1,
-1.934378, 0.2697875, -2.253143, 0, 0, 0, 1, 1,
-1.920806, -0.4564396, -0.8000099, 0, 0, 0, 1, 1,
-1.879181, -0.9211808, -2.402265, 1, 1, 1, 1, 1,
-1.85997, -0.8006422, -0.6077864, 1, 1, 1, 1, 1,
-1.859966, -0.3155372, -2.363292, 1, 1, 1, 1, 1,
-1.843616, 0.2801346, -0.6027584, 1, 1, 1, 1, 1,
-1.806417, 0.03050482, 1.560327, 1, 1, 1, 1, 1,
-1.79145, 0.197777, -1.550313, 1, 1, 1, 1, 1,
-1.762289, -0.5154313, -0.6610438, 1, 1, 1, 1, 1,
-1.756881, -0.2913402, -1.771867, 1, 1, 1, 1, 1,
-1.749609, -0.3870102, -2.818056, 1, 1, 1, 1, 1,
-1.745084, -1.462189, -0.9800498, 1, 1, 1, 1, 1,
-1.742448, -1.135317, -2.328799, 1, 1, 1, 1, 1,
-1.711882, 0.3732685, -0.6042874, 1, 1, 1, 1, 1,
-1.696004, -0.1256795, -3.282436, 1, 1, 1, 1, 1,
-1.690336, 0.6356007, -1.171934, 1, 1, 1, 1, 1,
-1.6892, 0.7627523, -0.873579, 1, 1, 1, 1, 1,
-1.687635, -0.120612, -0.5781388, 0, 0, 1, 1, 1,
-1.684395, -1.046672, -2.300954, 1, 0, 0, 1, 1,
-1.678152, -0.3144783, -1.749443, 1, 0, 0, 1, 1,
-1.670274, -2.516853, -2.525661, 1, 0, 0, 1, 1,
-1.652492, -1.698711, -4.493104, 1, 0, 0, 1, 1,
-1.617911, 0.3231309, -1.459673, 1, 0, 0, 1, 1,
-1.587511, -1.558274, -1.737177, 0, 0, 0, 1, 1,
-1.581832, 0.1159125, -2.069365, 0, 0, 0, 1, 1,
-1.579734, -0.4063514, -0.3673256, 0, 0, 0, 1, 1,
-1.575833, -0.4648775, -3.12852, 0, 0, 0, 1, 1,
-1.570373, 0.1305624, -1.715757, 0, 0, 0, 1, 1,
-1.555357, 1.089405, 0.5998997, 0, 0, 0, 1, 1,
-1.552009, -0.3264875, -2.494067, 0, 0, 0, 1, 1,
-1.539328, 1.552673, -0.7127597, 1, 1, 1, 1, 1,
-1.526611, 2.196917, 0.02722361, 1, 1, 1, 1, 1,
-1.50841, -1.37634, -3.790591, 1, 1, 1, 1, 1,
-1.500388, 2.424136, 0.0849736, 1, 1, 1, 1, 1,
-1.496357, 1.395614, -1.193746, 1, 1, 1, 1, 1,
-1.493443, -0.2542846, -1.666315, 1, 1, 1, 1, 1,
-1.490249, 1.226271, -3.354871, 1, 1, 1, 1, 1,
-1.485667, -0.4519762, -2.827695, 1, 1, 1, 1, 1,
-1.480831, -0.0971907, -2.287424, 1, 1, 1, 1, 1,
-1.470116, -1.116053, -2.203287, 1, 1, 1, 1, 1,
-1.468143, 0.09415451, -0.9301299, 1, 1, 1, 1, 1,
-1.465847, -0.7826675, -1.669953, 1, 1, 1, 1, 1,
-1.463686, -1.603629, -3.424596, 1, 1, 1, 1, 1,
-1.457563, 0.7953913, -1.800974, 1, 1, 1, 1, 1,
-1.455147, 1.01356, -0.4555731, 1, 1, 1, 1, 1,
-1.439105, -1.154505, -1.637486, 0, 0, 1, 1, 1,
-1.437054, 0.1537602, -0.8052911, 1, 0, 0, 1, 1,
-1.434472, 0.3054564, -1.500156, 1, 0, 0, 1, 1,
-1.434074, -0.7759017, -1.508155, 1, 0, 0, 1, 1,
-1.433282, 0.1642951, -2.730027, 1, 0, 0, 1, 1,
-1.420335, 1.043441, -1.063638, 1, 0, 0, 1, 1,
-1.40075, 1.614836, -0.1676996, 0, 0, 0, 1, 1,
-1.391226, -0.5540929, -2.192221, 0, 0, 0, 1, 1,
-1.387878, -0.8781075, -3.873823, 0, 0, 0, 1, 1,
-1.386819, -0.09009881, -1.555147, 0, 0, 0, 1, 1,
-1.378216, 2.911719, -1.66286, 0, 0, 0, 1, 1,
-1.37699, 0.3312548, -2.67581, 0, 0, 0, 1, 1,
-1.359914, 0.4887909, -2.049051, 0, 0, 0, 1, 1,
-1.346823, -0.4944911, -1.252768, 1, 1, 1, 1, 1,
-1.34537, -0.467089, -1.140437, 1, 1, 1, 1, 1,
-1.333236, 0.3644577, -0.2901401, 1, 1, 1, 1, 1,
-1.323888, 1.531597, -2.096576, 1, 1, 1, 1, 1,
-1.308648, -1.738543, -3.647129, 1, 1, 1, 1, 1,
-1.305673, -1.973271, -2.695217, 1, 1, 1, 1, 1,
-1.304147, -0.06959064, -2.071514, 1, 1, 1, 1, 1,
-1.297754, -1.107148, -3.11839, 1, 1, 1, 1, 1,
-1.292884, -0.6568211, -1.501418, 1, 1, 1, 1, 1,
-1.290767, 0.8971112, 0.3862684, 1, 1, 1, 1, 1,
-1.290668, 1.312543, -0.4288228, 1, 1, 1, 1, 1,
-1.285611, -0.9353617, -1.124049, 1, 1, 1, 1, 1,
-1.285143, -0.3593558, -3.386389, 1, 1, 1, 1, 1,
-1.27815, -0.3394075, -2.993969, 1, 1, 1, 1, 1,
-1.274081, 0.3878348, 0.1747267, 1, 1, 1, 1, 1,
-1.273051, 0.1870232, -0.03206404, 0, 0, 1, 1, 1,
-1.257449, 0.2188296, -2.868284, 1, 0, 0, 1, 1,
-1.252167, 0.006082593, -0.01236151, 1, 0, 0, 1, 1,
-1.246455, 0.3991994, -3.093035, 1, 0, 0, 1, 1,
-1.237748, -1.252489, -2.630559, 1, 0, 0, 1, 1,
-1.230988, 1.253404, -2.593563, 1, 0, 0, 1, 1,
-1.226735, 1.089809, 0.420799, 0, 0, 0, 1, 1,
-1.220945, 0.1064819, -1.087385, 0, 0, 0, 1, 1,
-1.219919, 0.4705803, -1.13939, 0, 0, 0, 1, 1,
-1.216369, -0.2774136, -2.960662, 0, 0, 0, 1, 1,
-1.201791, -0.8956535, -0.1089496, 0, 0, 0, 1, 1,
-1.195107, 1.908967, 1.578158, 0, 0, 0, 1, 1,
-1.181888, 0.3884963, -0.5944587, 0, 0, 0, 1, 1,
-1.180783, -1.136849, -1.000484, 1, 1, 1, 1, 1,
-1.179788, -1.440218, -0.9082482, 1, 1, 1, 1, 1,
-1.173918, -0.2220792, -2.630344, 1, 1, 1, 1, 1,
-1.169035, 0.303131, -0.4354948, 1, 1, 1, 1, 1,
-1.157044, -1.156482, -2.75646, 1, 1, 1, 1, 1,
-1.151358, -0.4436269, -0.835976, 1, 1, 1, 1, 1,
-1.140534, 1.369798, -0.7171578, 1, 1, 1, 1, 1,
-1.139714, -0.4049594, -2.273936, 1, 1, 1, 1, 1,
-1.127971, -0.7771918, -3.244747, 1, 1, 1, 1, 1,
-1.123194, 0.09040159, -1.401092, 1, 1, 1, 1, 1,
-1.110831, -0.0384538, -1.300887, 1, 1, 1, 1, 1,
-1.109547, -2.097908, -4.115585, 1, 1, 1, 1, 1,
-1.10905, -0.7505738, -3.848142, 1, 1, 1, 1, 1,
-1.100888, 0.702423, 0.4658229, 1, 1, 1, 1, 1,
-1.09927, -0.3469912, -1.641435, 1, 1, 1, 1, 1,
-1.098536, 0.05601011, -0.6979285, 0, 0, 1, 1, 1,
-1.098212, 0.5882319, -1.399556, 1, 0, 0, 1, 1,
-1.095995, 1.163782, -1.965108, 1, 0, 0, 1, 1,
-1.095483, -0.9206254, -3.222927, 1, 0, 0, 1, 1,
-1.091809, 1.022673, -1.519958, 1, 0, 0, 1, 1,
-1.087824, 1.669407, 0.1005434, 1, 0, 0, 1, 1,
-1.076975, 0.8274454, -1.090661, 0, 0, 0, 1, 1,
-1.074127, 0.5666371, -0.8973709, 0, 0, 0, 1, 1,
-1.067645, -1.467259, -1.728746, 0, 0, 0, 1, 1,
-1.058136, -0.2355021, -2.477322, 0, 0, 0, 1, 1,
-1.057277, -1.995057, -3.305591, 0, 0, 0, 1, 1,
-1.048155, -0.5312478, -0.6424564, 0, 0, 0, 1, 1,
-1.042125, -0.03472292, -1.725649, 0, 0, 0, 1, 1,
-1.035836, -0.1779349, -1.942981, 1, 1, 1, 1, 1,
-1.03409, 0.7697465, -0.8826489, 1, 1, 1, 1, 1,
-1.030103, 1.12882, -1.865877, 1, 1, 1, 1, 1,
-1.029712, 0.693502, -1.013825, 1, 1, 1, 1, 1,
-1.022348, 0.2398317, -0.3679043, 1, 1, 1, 1, 1,
-1.021351, -0.07228073, -0.5118604, 1, 1, 1, 1, 1,
-1.014169, 0.002876787, -2.396978, 1, 1, 1, 1, 1,
-1.013446, 0.7323644, -1.782281, 1, 1, 1, 1, 1,
-1.012708, -0.2036716, -0.103259, 1, 1, 1, 1, 1,
-1.010857, 0.6761035, -0.9697373, 1, 1, 1, 1, 1,
-1.01075, -1.26731, -1.401716, 1, 1, 1, 1, 1,
-0.9995322, 0.204448, -3.127791, 1, 1, 1, 1, 1,
-0.9982228, -0.8574721, -3.042496, 1, 1, 1, 1, 1,
-0.9871675, 0.9951673, 0.3570966, 1, 1, 1, 1, 1,
-0.9861315, -0.3842664, -1.458648, 1, 1, 1, 1, 1,
-0.9855723, 0.4586841, -0.1199108, 0, 0, 1, 1, 1,
-0.9823259, 0.04230167, -1.66241, 1, 0, 0, 1, 1,
-0.9810919, 2.108282, -2.411144, 1, 0, 0, 1, 1,
-0.97923, -0.961873, -3.176763, 1, 0, 0, 1, 1,
-0.973697, -0.3705373, -0.7633091, 1, 0, 0, 1, 1,
-0.9659799, 0.1421629, 0.4354073, 1, 0, 0, 1, 1,
-0.9602403, 2.243752, 0.3617252, 0, 0, 0, 1, 1,
-0.9591581, 0.6660435, -1.461001, 0, 0, 0, 1, 1,
-0.9589149, -2.230463, -3.728373, 0, 0, 0, 1, 1,
-0.9586983, -0.08158723, -1.344031, 0, 0, 0, 1, 1,
-0.9558093, -0.5331467, -0.5122393, 0, 0, 0, 1, 1,
-0.9545685, 0.3659433, -0.4842175, 0, 0, 0, 1, 1,
-0.9538137, 0.7067594, 0.2652158, 0, 0, 0, 1, 1,
-0.9535802, -0.3195153, -0.9632001, 1, 1, 1, 1, 1,
-0.9484858, 0.7476489, -2.185958, 1, 1, 1, 1, 1,
-0.943909, -1.303697, -1.690709, 1, 1, 1, 1, 1,
-0.9422728, 0.02143896, -0.8415793, 1, 1, 1, 1, 1,
-0.9366288, -0.4346842, 0.03942003, 1, 1, 1, 1, 1,
-0.9253451, 1.238071, 1.052424, 1, 1, 1, 1, 1,
-0.9225463, 0.6407863, -1.537121, 1, 1, 1, 1, 1,
-0.9189796, 0.9542665, -0.9328344, 1, 1, 1, 1, 1,
-0.9099398, -0.2039009, 0.5013413, 1, 1, 1, 1, 1,
-0.8987305, -2.000192, -5.298144, 1, 1, 1, 1, 1,
-0.8943841, -0.6063052, -3.366471, 1, 1, 1, 1, 1,
-0.8895908, -0.4242147, -0.8804344, 1, 1, 1, 1, 1,
-0.889208, -0.8201356, -0.7470062, 1, 1, 1, 1, 1,
-0.8876191, 0.195734, -1.790881, 1, 1, 1, 1, 1,
-0.8875698, 0.4475135, -0.9248931, 1, 1, 1, 1, 1,
-0.8839577, -0.8961226, -4.058123, 0, 0, 1, 1, 1,
-0.8796498, 0.1974197, -1.347575, 1, 0, 0, 1, 1,
-0.8775576, 0.6206152, 0.6223241, 1, 0, 0, 1, 1,
-0.8731619, -0.7299097, -2.184431, 1, 0, 0, 1, 1,
-0.8723304, 0.1275645, -1.963525, 1, 0, 0, 1, 1,
-0.8702521, 0.4715856, -1.600503, 1, 0, 0, 1, 1,
-0.8690182, 0.4834916, -2.263851, 0, 0, 0, 1, 1,
-0.8666824, 1.435454, -0.8433061, 0, 0, 0, 1, 1,
-0.861017, -0.2525805, -3.248084, 0, 0, 0, 1, 1,
-0.8601223, -0.6000392, -1.596893, 0, 0, 0, 1, 1,
-0.8598909, 0.7634023, -1.315916, 0, 0, 0, 1, 1,
-0.8597771, -0.2351147, -1.997972, 0, 0, 0, 1, 1,
-0.847876, 0.6429031, 0.403761, 0, 0, 0, 1, 1,
-0.8368237, -0.4773244, -3.019228, 1, 1, 1, 1, 1,
-0.8333158, 0.3578722, -1.529888, 1, 1, 1, 1, 1,
-0.8330001, 1.379374, -1.218219, 1, 1, 1, 1, 1,
-0.831495, 0.2212712, -3.200614, 1, 1, 1, 1, 1,
-0.829707, 0.2456698, -0.148911, 1, 1, 1, 1, 1,
-0.8294742, 0.6184973, -0.4026938, 1, 1, 1, 1, 1,
-0.8256339, -1.323456, -3.496571, 1, 1, 1, 1, 1,
-0.8252276, -1.484033, -1.794287, 1, 1, 1, 1, 1,
-0.8128303, -1.204937, -2.094942, 1, 1, 1, 1, 1,
-0.8127211, -1.987359, -3.182086, 1, 1, 1, 1, 1,
-0.8054859, -0.02880355, -1.644048, 1, 1, 1, 1, 1,
-0.8043545, 0.3752176, -1.744049, 1, 1, 1, 1, 1,
-0.8041808, 0.1582162, -1.835628, 1, 1, 1, 1, 1,
-0.8017991, -0.4222353, -2.0417, 1, 1, 1, 1, 1,
-0.7979622, -0.6583339, -4.231773, 1, 1, 1, 1, 1,
-0.7956209, -1.406386, -5.301552, 0, 0, 1, 1, 1,
-0.7955024, 0.8591063, 0.447269, 1, 0, 0, 1, 1,
-0.7929192, -0.3210123, -2.663715, 1, 0, 0, 1, 1,
-0.7901635, -1.496245, -0.6050141, 1, 0, 0, 1, 1,
-0.7879541, 1.115749, -1.304865, 1, 0, 0, 1, 1,
-0.7879393, -0.05461466, -2.385505, 1, 0, 0, 1, 1,
-0.7848337, 0.2475336, -0.8482805, 0, 0, 0, 1, 1,
-0.7840868, -1.063869, -2.862705, 0, 0, 0, 1, 1,
-0.7752359, 1.225423, -0.3638665, 0, 0, 0, 1, 1,
-0.7745988, 1.062035, -1.069614, 0, 0, 0, 1, 1,
-0.7640826, 0.3792115, -1.914631, 0, 0, 0, 1, 1,
-0.7605676, -0.3572375, -2.506797, 0, 0, 0, 1, 1,
-0.7581325, -0.6821447, -1.178578, 0, 0, 0, 1, 1,
-0.7545456, -0.261905, -2.177915, 1, 1, 1, 1, 1,
-0.7505258, 0.2727752, 0.356512, 1, 1, 1, 1, 1,
-0.7465472, -0.1956721, -2.475532, 1, 1, 1, 1, 1,
-0.7464709, -1.400985, -4.178732, 1, 1, 1, 1, 1,
-0.7464099, -0.2405262, -1.925155, 1, 1, 1, 1, 1,
-0.7461917, -1.509587, -3.416605, 1, 1, 1, 1, 1,
-0.7441511, -1.738373, -1.160302, 1, 1, 1, 1, 1,
-0.7439525, -0.5805708, -1.301462, 1, 1, 1, 1, 1,
-0.7437481, -1.462689, -0.3597722, 1, 1, 1, 1, 1,
-0.7428945, -2.097419, -3.301659, 1, 1, 1, 1, 1,
-0.7422215, -0.8072921, -2.014083, 1, 1, 1, 1, 1,
-0.7399175, 2.091797, 0.2106442, 1, 1, 1, 1, 1,
-0.7397825, 0.4432474, -0.07663506, 1, 1, 1, 1, 1,
-0.7395886, 0.04023638, -0.4226947, 1, 1, 1, 1, 1,
-0.7381975, 0.02276913, -2.171376, 1, 1, 1, 1, 1,
-0.7370969, 0.1335132, -0.8009553, 0, 0, 1, 1, 1,
-0.7291968, -0.9417819, -3.937411, 1, 0, 0, 1, 1,
-0.7275793, 0.1166341, -1.615321, 1, 0, 0, 1, 1,
-0.7265224, -0.3656, -1.369474, 1, 0, 0, 1, 1,
-0.7222052, 0.6521095, -2.174937, 1, 0, 0, 1, 1,
-0.7213656, 0.004274302, -3.686636, 1, 0, 0, 1, 1,
-0.7168193, 0.1449705, -1.103113, 0, 0, 0, 1, 1,
-0.7046843, -0.2879375, -2.136287, 0, 0, 0, 1, 1,
-0.6985675, 0.7062566, 0.9746031, 0, 0, 0, 1, 1,
-0.6946397, 0.1504723, -1.936944, 0, 0, 0, 1, 1,
-0.6944995, -1.27898, -2.67035, 0, 0, 0, 1, 1,
-0.6839455, -0.6420209, -3.318212, 0, 0, 0, 1, 1,
-0.6816129, 0.4007041, -1.483963, 0, 0, 0, 1, 1,
-0.6795233, -1.965587, -2.367098, 1, 1, 1, 1, 1,
-0.6790137, 1.065087, -0.3827199, 1, 1, 1, 1, 1,
-0.6756902, -0.1652067, 0.5062456, 1, 1, 1, 1, 1,
-0.6694731, 1.503812, 0.2144188, 1, 1, 1, 1, 1,
-0.6693118, -0.02719131, -1.174529, 1, 1, 1, 1, 1,
-0.6662561, -0.9609166, -4.301132, 1, 1, 1, 1, 1,
-0.6600784, -1.583784, -3.28655, 1, 1, 1, 1, 1,
-0.6599931, -0.3088335, -1.882393, 1, 1, 1, 1, 1,
-0.6589215, -0.3154236, -3.019033, 1, 1, 1, 1, 1,
-0.6569719, -0.1259807, -2.895704, 1, 1, 1, 1, 1,
-0.6549266, -1.308969, -0.9415332, 1, 1, 1, 1, 1,
-0.6498252, -1.833577, -2.938996, 1, 1, 1, 1, 1,
-0.6495388, 0.0295696, -0.4219624, 1, 1, 1, 1, 1,
-0.6472305, -1.125494, -3.341477, 1, 1, 1, 1, 1,
-0.6449558, 0.02063804, -1.353266, 1, 1, 1, 1, 1,
-0.6441082, -0.927038, -4.705068, 0, 0, 1, 1, 1,
-0.6383969, 1.304319, -0.73168, 1, 0, 0, 1, 1,
-0.6317863, 0.004123999, -2.345391, 1, 0, 0, 1, 1,
-0.6311401, -0.5093387, -1.100636, 1, 0, 0, 1, 1,
-0.6310477, 1.390365, -1.136764, 1, 0, 0, 1, 1,
-0.6300125, -0.1259667, -2.511803, 1, 0, 0, 1, 1,
-0.6251503, -1.791571, 1.697298, 0, 0, 0, 1, 1,
-0.6238734, -1.004902, -0.9838749, 0, 0, 0, 1, 1,
-0.6103745, -0.3074541, -3.675921, 0, 0, 0, 1, 1,
-0.608379, -1.051309, -3.337024, 0, 0, 0, 1, 1,
-0.6058434, 0.1011606, -2.97869, 0, 0, 0, 1, 1,
-0.6041471, 0.02874548, -0.9867052, 0, 0, 0, 1, 1,
-0.600131, -0.1536374, -2.377565, 0, 0, 0, 1, 1,
-0.5932192, -1.235598, -2.401547, 1, 1, 1, 1, 1,
-0.5912719, 0.08118191, -2.105817, 1, 1, 1, 1, 1,
-0.5898766, -0.9095098, -2.740808, 1, 1, 1, 1, 1,
-0.5866095, -0.430982, -2.327693, 1, 1, 1, 1, 1,
-0.5840879, -0.6551136, -1.600588, 1, 1, 1, 1, 1,
-0.5826777, 2.608472, -0.7948563, 1, 1, 1, 1, 1,
-0.5793481, -0.4562541, -3.792143, 1, 1, 1, 1, 1,
-0.5781188, -0.7022498, -1.702362, 1, 1, 1, 1, 1,
-0.5776341, -0.3875122, -1.90895, 1, 1, 1, 1, 1,
-0.5759266, 0.5658942, 0.2222496, 1, 1, 1, 1, 1,
-0.5754673, -0.504379, -1.541748, 1, 1, 1, 1, 1,
-0.5706245, 1.67279, -0.3462874, 1, 1, 1, 1, 1,
-0.5698512, -0.8995709, -2.869437, 1, 1, 1, 1, 1,
-0.5697156, -0.753186, -2.610932, 1, 1, 1, 1, 1,
-0.5679762, -0.2451023, -3.795492, 1, 1, 1, 1, 1,
-0.5677159, -0.6029023, -2.145755, 0, 0, 1, 1, 1,
-0.5672094, 0.365909, -1.67713, 1, 0, 0, 1, 1,
-0.5665417, -0.5377632, -3.83891, 1, 0, 0, 1, 1,
-0.5660794, -0.7600448, -1.462066, 1, 0, 0, 1, 1,
-0.5644642, -0.9854215, -1.866435, 1, 0, 0, 1, 1,
-0.5628461, 2.718823, -0.06007509, 1, 0, 0, 1, 1,
-0.5589062, 1.337234, 0.2379002, 0, 0, 0, 1, 1,
-0.5574802, 0.6918268, -1.1399, 0, 0, 0, 1, 1,
-0.5560225, -1.417705, -1.726164, 0, 0, 0, 1, 1,
-0.5551509, -0.3305073, -2.113529, 0, 0, 0, 1, 1,
-0.5523725, -1.381333, -3.555574, 0, 0, 0, 1, 1,
-0.5506712, 0.0174286, 0.118847, 0, 0, 0, 1, 1,
-0.5454367, -0.47466, -1.500316, 0, 0, 0, 1, 1,
-0.5403364, 0.9980001, 0.6890128, 1, 1, 1, 1, 1,
-0.5392886, 0.1721745, -2.162282, 1, 1, 1, 1, 1,
-0.5320404, 0.8482366, 0.8029169, 1, 1, 1, 1, 1,
-0.5308996, 0.1089097, -2.354236, 1, 1, 1, 1, 1,
-0.5122201, -0.06109333, -1.593122, 1, 1, 1, 1, 1,
-0.5101214, -0.7669245, -1.890995, 1, 1, 1, 1, 1,
-0.508078, -1.451723, -3.968241, 1, 1, 1, 1, 1,
-0.5075253, 1.507591, 0.03129206, 1, 1, 1, 1, 1,
-0.4966456, 0.4214987, -1.812373, 1, 1, 1, 1, 1,
-0.4935978, 1.008086, 0.586805, 1, 1, 1, 1, 1,
-0.4926598, -0.5615457, -1.271849, 1, 1, 1, 1, 1,
-0.4886105, -0.01850169, -2.827916, 1, 1, 1, 1, 1,
-0.4853288, 0.312098, -1.258417, 1, 1, 1, 1, 1,
-0.4850326, 0.6196524, -1.441981, 1, 1, 1, 1, 1,
-0.4820354, -1.287002, -4.727247, 1, 1, 1, 1, 1,
-0.4817731, -1.580741, -3.450163, 0, 0, 1, 1, 1,
-0.4706696, 0.01767757, -1.154758, 1, 0, 0, 1, 1,
-0.4695474, -1.12442, 0.4708269, 1, 0, 0, 1, 1,
-0.4650792, 0.2455803, -1.745577, 1, 0, 0, 1, 1,
-0.464, 0.6626557, -2.691633, 1, 0, 0, 1, 1,
-0.4581064, -1.531162, -1.717874, 1, 0, 0, 1, 1,
-0.4578034, -0.496276, -1.787414, 0, 0, 0, 1, 1,
-0.4569945, 0.05481029, -0.3458551, 0, 0, 0, 1, 1,
-0.4569679, -1.020317, -4.566745, 0, 0, 0, 1, 1,
-0.4537613, 0.4232346, -0.09531407, 0, 0, 0, 1, 1,
-0.4525872, -1.832804, -3.923254, 0, 0, 0, 1, 1,
-0.4491323, 0.7121793, 0.6599525, 0, 0, 0, 1, 1,
-0.4469206, -0.8303518, -2.511361, 0, 0, 0, 1, 1,
-0.4460243, 0.1069071, -1.609888, 1, 1, 1, 1, 1,
-0.441304, -1.024946, -1.66124, 1, 1, 1, 1, 1,
-0.4393225, -1.663859, -3.35072, 1, 1, 1, 1, 1,
-0.4382468, 0.9907296, -0.01568712, 1, 1, 1, 1, 1,
-0.4371269, -0.03486891, -1.318236, 1, 1, 1, 1, 1,
-0.4341474, 0.2381856, 1.08446, 1, 1, 1, 1, 1,
-0.433516, -0.2362059, -0.839821, 1, 1, 1, 1, 1,
-0.4315578, 0.9164015, -2.287688, 1, 1, 1, 1, 1,
-0.4307028, 1.089665, -1.703539, 1, 1, 1, 1, 1,
-0.4297517, -0.6909679, -3.114094, 1, 1, 1, 1, 1,
-0.4277915, 0.6497784, -0.754932, 1, 1, 1, 1, 1,
-0.4274457, 0.9972293, 0.5007269, 1, 1, 1, 1, 1,
-0.4250743, -0.05500029, -1.908768, 1, 1, 1, 1, 1,
-0.4236817, 0.7725715, -0.04521049, 1, 1, 1, 1, 1,
-0.4212954, 1.460224, -2.687689, 1, 1, 1, 1, 1,
-0.4136718, 1.214995, -1.251066, 0, 0, 1, 1, 1,
-0.4123524, 1.65049, 0.2143235, 1, 0, 0, 1, 1,
-0.4059477, -0.4303687, -3.426494, 1, 0, 0, 1, 1,
-0.4045391, -1.680289, -2.209662, 1, 0, 0, 1, 1,
-0.4015115, 0.2437569, -2.742823, 1, 0, 0, 1, 1,
-0.4012314, -1.424171, -3.540102, 1, 0, 0, 1, 1,
-0.398652, -0.3333657, -3.078646, 0, 0, 0, 1, 1,
-0.391974, 1.639652, 0.03307317, 0, 0, 0, 1, 1,
-0.3919079, -0.6203083, -1.954416, 0, 0, 0, 1, 1,
-0.3916942, -1.873319, -2.137184, 0, 0, 0, 1, 1,
-0.3879533, 0.4787274, -1.610336, 0, 0, 0, 1, 1,
-0.3859357, -1.405495, -3.311847, 0, 0, 0, 1, 1,
-0.3842875, -0.09902482, -1.626617, 0, 0, 0, 1, 1,
-0.3837913, 1.524057, -2.160032, 1, 1, 1, 1, 1,
-0.3808997, 0.6524291, -1.410898, 1, 1, 1, 1, 1,
-0.3769907, -0.6956056, -2.417273, 1, 1, 1, 1, 1,
-0.3768955, 0.6647051, 0.4981726, 1, 1, 1, 1, 1,
-0.3727732, 1.507499, -1.392983, 1, 1, 1, 1, 1,
-0.3664785, 0.0856022, -1.46613, 1, 1, 1, 1, 1,
-0.3632775, 0.78056, -2.300821, 1, 1, 1, 1, 1,
-0.3554832, -0.5962142, -5.020014, 1, 1, 1, 1, 1,
-0.3506707, 1.218472, -0.3089105, 1, 1, 1, 1, 1,
-0.3493293, -1.381934, -1.923154, 1, 1, 1, 1, 1,
-0.3445971, 0.5743944, 0.4823708, 1, 1, 1, 1, 1,
-0.3433217, -0.05637401, -3.895873, 1, 1, 1, 1, 1,
-0.3380366, 1.334263, -1.150409, 1, 1, 1, 1, 1,
-0.3372041, 1.470205, -0.752547, 1, 1, 1, 1, 1,
-0.336847, 0.4924706, 0.3707463, 1, 1, 1, 1, 1,
-0.334427, -0.002126703, -0.3659712, 0, 0, 1, 1, 1,
-0.3311779, 0.4437495, -0.06130778, 1, 0, 0, 1, 1,
-0.3296522, 2.097993, 0.7314472, 1, 0, 0, 1, 1,
-0.323025, 0.6334006, -1.69573, 1, 0, 0, 1, 1,
-0.3192368, -0.7160318, -2.521105, 1, 0, 0, 1, 1,
-0.3062964, -0.143373, -1.008891, 1, 0, 0, 1, 1,
-0.3026432, 1.320277, 0.08359719, 0, 0, 0, 1, 1,
-0.3018459, -0.2455609, -1.871596, 0, 0, 0, 1, 1,
-0.3011913, 0.3637916, -0.718876, 0, 0, 0, 1, 1,
-0.3008088, -0.4708994, -3.416869, 0, 0, 0, 1, 1,
-0.299274, 0.0513051, -1.273229, 0, 0, 0, 1, 1,
-0.2977085, 0.1783774, -0.8068521, 0, 0, 0, 1, 1,
-0.2977055, -0.5586092, -2.941435, 0, 0, 0, 1, 1,
-0.2954748, -0.8694774, -0.6840972, 1, 1, 1, 1, 1,
-0.2916209, -1.006854, -0.8130796, 1, 1, 1, 1, 1,
-0.289919, -0.8000247, -2.769936, 1, 1, 1, 1, 1,
-0.284795, 0.3521684, -1.370882, 1, 1, 1, 1, 1,
-0.2814363, -0.9329376, -3.972878, 1, 1, 1, 1, 1,
-0.2804906, 1.268476, 0.1580041, 1, 1, 1, 1, 1,
-0.2766337, 0.2540813, -1.014614, 1, 1, 1, 1, 1,
-0.2763597, -1.115993, -2.689871, 1, 1, 1, 1, 1,
-0.2731493, 0.2793497, -0.3964385, 1, 1, 1, 1, 1,
-0.2726948, 1.619231, 0.05914285, 1, 1, 1, 1, 1,
-0.2695097, -0.91919, -2.973186, 1, 1, 1, 1, 1,
-0.2673565, -0.622144, -2.096606, 1, 1, 1, 1, 1,
-0.2651542, 0.5086247, 1.207716, 1, 1, 1, 1, 1,
-0.2650573, -0.4976857, -3.710882, 1, 1, 1, 1, 1,
-0.2647994, 0.3857607, 0.9826769, 1, 1, 1, 1, 1,
-0.2644932, 0.8469633, 1.635127, 0, 0, 1, 1, 1,
-0.2574936, 0.7848492, 0.633618, 1, 0, 0, 1, 1,
-0.2548154, 0.641263, -0.2527483, 1, 0, 0, 1, 1,
-0.2387749, -1.23964, -4.74042, 1, 0, 0, 1, 1,
-0.2368642, 0.4911975, -0.6562739, 1, 0, 0, 1, 1,
-0.2329714, -0.3647322, -2.519943, 1, 0, 0, 1, 1,
-0.2300311, -0.04012783, -0.8411788, 0, 0, 0, 1, 1,
-0.2266076, -1.518052, -4.066469, 0, 0, 0, 1, 1,
-0.2194553, 1.959418, 0.3924597, 0, 0, 0, 1, 1,
-0.2141448, -0.0408629, -1.209827, 0, 0, 0, 1, 1,
-0.2114157, -0.480111, -4.35413, 0, 0, 0, 1, 1,
-0.2009426, -2.193061, -3.911165, 0, 0, 0, 1, 1,
-0.1992577, 1.636376, -2.076971, 0, 0, 0, 1, 1,
-0.1982992, 1.355929, 0.07675637, 1, 1, 1, 1, 1,
-0.1965584, 0.0007044112, -0.9077139, 1, 1, 1, 1, 1,
-0.1963503, -1.843304, -3.476007, 1, 1, 1, 1, 1,
-0.1958791, 0.4032243, -1.064903, 1, 1, 1, 1, 1,
-0.1939374, 0.660629, -1.601579, 1, 1, 1, 1, 1,
-0.1905559, 0.2510993, -0.8636375, 1, 1, 1, 1, 1,
-0.1901257, -0.4797111, -2.881123, 1, 1, 1, 1, 1,
-0.1873801, -1.499155, -2.719059, 1, 1, 1, 1, 1,
-0.1860883, 0.7128087, 2.215291, 1, 1, 1, 1, 1,
-0.1849985, -1.359619, -3.170306, 1, 1, 1, 1, 1,
-0.1834621, -0.5531543, -3.488562, 1, 1, 1, 1, 1,
-0.1805954, -0.9609514, -3.86211, 1, 1, 1, 1, 1,
-0.179096, -0.995078, -3.198429, 1, 1, 1, 1, 1,
-0.1771724, 0.038022, -2.099262, 1, 1, 1, 1, 1,
-0.1761979, 1.125532, -3.447557, 1, 1, 1, 1, 1,
-0.1723346, -1.811743, -4.059132, 0, 0, 1, 1, 1,
-0.1706283, 0.1439995, -1.058563, 1, 0, 0, 1, 1,
-0.1698243, 2.109747, -0.2987207, 1, 0, 0, 1, 1,
-0.164788, 1.302139, 1.226068, 1, 0, 0, 1, 1,
-0.1596668, -0.2805329, -3.48304, 1, 0, 0, 1, 1,
-0.1552542, 0.2203115, -0.7954549, 1, 0, 0, 1, 1,
-0.1541176, -0.7271023, -2.725378, 0, 0, 0, 1, 1,
-0.152771, -2.451001, -5.142791, 0, 0, 0, 1, 1,
-0.1425846, 0.261841, 0.775387, 0, 0, 0, 1, 1,
-0.1387555, 0.4164795, 0.4923302, 0, 0, 0, 1, 1,
-0.1374435, -0.4267192, -2.170888, 0, 0, 0, 1, 1,
-0.1348655, 0.9453029, -2.062623, 0, 0, 0, 1, 1,
-0.1332811, -0.6563613, -3.59003, 0, 0, 0, 1, 1,
-0.1328238, -0.6767427, -3.270229, 1, 1, 1, 1, 1,
-0.1289079, 0.1324598, 0.1772525, 1, 1, 1, 1, 1,
-0.1288823, 0.7587088, -0.03118337, 1, 1, 1, 1, 1,
-0.12785, 1.433235, 1.743755, 1, 1, 1, 1, 1,
-0.1267067, 1.206856, 0.3955707, 1, 1, 1, 1, 1,
-0.1219803, 0.9404215, 0.7537702, 1, 1, 1, 1, 1,
-0.1218576, -1.523472, -4.727714, 1, 1, 1, 1, 1,
-0.1217872, 1.60597, 0.9418404, 1, 1, 1, 1, 1,
-0.1178115, 0.1527566, -1.546418, 1, 1, 1, 1, 1,
-0.10946, 0.374613, -1.691464, 1, 1, 1, 1, 1,
-0.1086664, 0.1501865, -2.02695, 1, 1, 1, 1, 1,
-0.1080972, -0.2030663, -2.064782, 1, 1, 1, 1, 1,
-0.1075996, -0.3152069, -4.246884, 1, 1, 1, 1, 1,
-0.1000389, 1.03504, -0.7072799, 1, 1, 1, 1, 1,
-0.09927261, -1.889067, -2.489475, 1, 1, 1, 1, 1,
-0.09808215, -0.2793869, -2.691332, 0, 0, 1, 1, 1,
-0.09617453, -1.230358, -4.795642, 1, 0, 0, 1, 1,
-0.09567738, 0.7404945, -0.6050438, 1, 0, 0, 1, 1,
-0.08976978, 0.3568076, -0.8192179, 1, 0, 0, 1, 1,
-0.08516389, 0.3955813, 0.9432344, 1, 0, 0, 1, 1,
-0.08206957, -0.08477227, -4.022445, 1, 0, 0, 1, 1,
-0.07655226, -0.4397921, -2.368426, 0, 0, 0, 1, 1,
-0.06999641, 1.911002, -0.8871977, 0, 0, 0, 1, 1,
-0.06835568, -0.6066867, -4.226616, 0, 0, 0, 1, 1,
-0.06091165, 0.6225067, -0.227447, 0, 0, 0, 1, 1,
-0.05600799, 1.070349, 1.466377, 0, 0, 0, 1, 1,
-0.05518111, 0.193996, -0.3074023, 0, 0, 0, 1, 1,
-0.05363941, 0.1117673, -2.272526, 0, 0, 0, 1, 1,
-0.05358415, -0.5124, -5.864254, 1, 1, 1, 1, 1,
-0.05005459, 1.165521, -1.035706, 1, 1, 1, 1, 1,
-0.04977993, -3.619354, -3.202327, 1, 1, 1, 1, 1,
-0.04882028, 0.02208154, 0.1929152, 1, 1, 1, 1, 1,
-0.04817637, -0.5631507, -3.356095, 1, 1, 1, 1, 1,
-0.04508255, 0.3836545, 1.12895, 1, 1, 1, 1, 1,
-0.04213464, 0.8457069, -0.9446809, 1, 1, 1, 1, 1,
-0.04099895, 0.1646186, -0.0462271, 1, 1, 1, 1, 1,
-0.03543142, -0.4199535, -3.506277, 1, 1, 1, 1, 1,
-0.03308365, 0.1813348, 1.204285, 1, 1, 1, 1, 1,
-0.03043779, 0.8897431, 1.373128, 1, 1, 1, 1, 1,
-0.02954565, -0.8514886, -4.292549, 1, 1, 1, 1, 1,
-0.02851764, 0.2626362, -0.6121367, 1, 1, 1, 1, 1,
-0.02766998, 1.022229, -0.9916713, 1, 1, 1, 1, 1,
-0.02722434, 1.238764, 0.8468013, 1, 1, 1, 1, 1,
-0.02542774, 0.168799, -0.0911421, 0, 0, 1, 1, 1,
-0.01809104, 0.4366182, 1.63252, 1, 0, 0, 1, 1,
-0.009887054, -1.256894, -4.683047, 1, 0, 0, 1, 1,
-0.009833264, 0.9354587, 0.3833144, 1, 0, 0, 1, 1,
-0.009769204, -1.308553, -3.788277, 1, 0, 0, 1, 1,
-0.003530143, -0.2284042, -2.790596, 1, 0, 0, 1, 1,
0.00146564, 0.6893207, 1.885694, 0, 0, 0, 1, 1,
0.002591841, 0.404818, 0.8390598, 0, 0, 0, 1, 1,
0.005451669, 0.1964852, 0.3514903, 0, 0, 0, 1, 1,
0.007858078, -0.6163691, 3.910988, 0, 0, 0, 1, 1,
0.008463598, -0.8713577, 3.880943, 0, 0, 0, 1, 1,
0.01012237, 0.7202269, -0.9425533, 0, 0, 0, 1, 1,
0.01758028, -1.474671, 3.613858, 0, 0, 0, 1, 1,
0.01760471, -0.1685051, 1.509259, 1, 1, 1, 1, 1,
0.02088192, 1.336907, -1.179265, 1, 1, 1, 1, 1,
0.02386496, 0.6409742, 1.601949, 1, 1, 1, 1, 1,
0.02530391, -1.615703, 4.498437, 1, 1, 1, 1, 1,
0.03235222, 0.4434022, 1.122646, 1, 1, 1, 1, 1,
0.03427018, -0.8312212, 2.042765, 1, 1, 1, 1, 1,
0.03557229, -0.2817258, 2.360176, 1, 1, 1, 1, 1,
0.03599695, -0.07344618, 2.370134, 1, 1, 1, 1, 1,
0.0378534, 1.890354, 0.9439071, 1, 1, 1, 1, 1,
0.04882164, -0.7328628, 4.00179, 1, 1, 1, 1, 1,
0.05246875, -0.2506503, 2.456277, 1, 1, 1, 1, 1,
0.05261183, 1.439721, 0.9713524, 1, 1, 1, 1, 1,
0.05522886, 0.9165585, 2.08695, 1, 1, 1, 1, 1,
0.05619587, 0.8752776, 1.263964, 1, 1, 1, 1, 1,
0.05718182, -0.6932284, 1.944615, 1, 1, 1, 1, 1,
0.05779852, 2.343918, -0.5602233, 0, 0, 1, 1, 1,
0.06580704, -1.042485, 3.450725, 1, 0, 0, 1, 1,
0.0688762, -0.8830161, 1.565598, 1, 0, 0, 1, 1,
0.06896617, -0.7304705, 2.516138, 1, 0, 0, 1, 1,
0.07039455, -0.7502908, 1.653357, 1, 0, 0, 1, 1,
0.07302866, -1.188462, 2.480172, 1, 0, 0, 1, 1,
0.07404561, 0.4375049, -1.491006, 0, 0, 0, 1, 1,
0.07456486, 0.3115558, -0.2348804, 0, 0, 0, 1, 1,
0.07883067, 0.1556126, 0.1866674, 0, 0, 0, 1, 1,
0.08407136, -0.5357875, 2.958292, 0, 0, 0, 1, 1,
0.08677348, 0.1990367, 0.5261554, 0, 0, 0, 1, 1,
0.08879825, -0.3450727, 2.634323, 0, 0, 0, 1, 1,
0.0919926, -0.5658348, 3.201067, 0, 0, 0, 1, 1,
0.09206842, 1.334503, -1.60378, 1, 1, 1, 1, 1,
0.09343535, -0.6067425, 4.239956, 1, 1, 1, 1, 1,
0.09609996, -0.1037379, 1.038958, 1, 1, 1, 1, 1,
0.09782753, -0.5416408, 2.565182, 1, 1, 1, 1, 1,
0.09831368, 0.9278855, -0.8715082, 1, 1, 1, 1, 1,
0.09845257, 0.1980683, 1.616954, 1, 1, 1, 1, 1,
0.09919924, 1.13152, 1.582668, 1, 1, 1, 1, 1,
0.09973565, -0.6612265, 3.012637, 1, 1, 1, 1, 1,
0.09986465, 0.1853999, 2.003505, 1, 1, 1, 1, 1,
0.1023484, -1.497754, 2.790262, 1, 1, 1, 1, 1,
0.1048911, 0.07185339, -0.02470594, 1, 1, 1, 1, 1,
0.1073538, 1.504771, -0.9364762, 1, 1, 1, 1, 1,
0.1094841, 0.9562777, -0.9784553, 1, 1, 1, 1, 1,
0.1130849, -1.071158, 3.096018, 1, 1, 1, 1, 1,
0.1137982, -0.2480174, 2.742107, 1, 1, 1, 1, 1,
0.1270988, 0.5083711, 1.132143, 0, 0, 1, 1, 1,
0.1277265, 1.199773, 0.4430241, 1, 0, 0, 1, 1,
0.1306591, 0.8974378, -0.6059287, 1, 0, 0, 1, 1,
0.1310732, 0.5052508, 0.05813088, 1, 0, 0, 1, 1,
0.1332547, 0.1904804, 0.1091435, 1, 0, 0, 1, 1,
0.1368763, 0.001656074, 2.34126, 1, 0, 0, 1, 1,
0.137291, -1.101771, 3.138302, 0, 0, 0, 1, 1,
0.1375684, 0.4902954, -0.5297678, 0, 0, 0, 1, 1,
0.1387724, -0.8519117, 1.189633, 0, 0, 0, 1, 1,
0.1394461, 1.713109, -0.2303999, 0, 0, 0, 1, 1,
0.1425417, -1.583254, 3.361937, 0, 0, 0, 1, 1,
0.14632, 1.136783, -0.3937037, 0, 0, 0, 1, 1,
0.1467487, 0.752753, -0.658445, 0, 0, 0, 1, 1,
0.1472777, -1.010614, 2.175245, 1, 1, 1, 1, 1,
0.1484943, -1.693425, 2.21674, 1, 1, 1, 1, 1,
0.1577699, -0.2497789, 1.967806, 1, 1, 1, 1, 1,
0.1586044, -0.09556327, 1.777298, 1, 1, 1, 1, 1,
0.1616841, -0.5248525, 2.499938, 1, 1, 1, 1, 1,
0.16398, 0.1174192, 1.030196, 1, 1, 1, 1, 1,
0.1675118, 0.06986222, 1.108668, 1, 1, 1, 1, 1,
0.1714286, -0.5669087, 3.796251, 1, 1, 1, 1, 1,
0.176437, -0.1608605, 2.154533, 1, 1, 1, 1, 1,
0.1812089, -1.173423, 1.768449, 1, 1, 1, 1, 1,
0.1825424, 1.524086, 1.470117, 1, 1, 1, 1, 1,
0.1846043, 1.046481, -0.1643069, 1, 1, 1, 1, 1,
0.184907, -1.835688, 2.619818, 1, 1, 1, 1, 1,
0.1871434, 0.892346, -0.4982263, 1, 1, 1, 1, 1,
0.1872226, -0.4105628, 2.73433, 1, 1, 1, 1, 1,
0.1886363, -0.4101073, 2.850174, 0, 0, 1, 1, 1,
0.1913312, -0.1227247, 0.2264972, 1, 0, 0, 1, 1,
0.1921664, -0.06234786, 0.781809, 1, 0, 0, 1, 1,
0.1983414, -0.01455446, 1.237433, 1, 0, 0, 1, 1,
0.1986473, -0.5595672, 4.985083, 1, 0, 0, 1, 1,
0.199545, -0.452231, 3.800976, 1, 0, 0, 1, 1,
0.2027918, -1.152222, 3.174625, 0, 0, 0, 1, 1,
0.2030553, 0.1576649, 0.1421321, 0, 0, 0, 1, 1,
0.2103513, -0.815443, 3.110559, 0, 0, 0, 1, 1,
0.2118199, 1.071613, 1.274022, 0, 0, 0, 1, 1,
0.2156031, -1.369383, 3.892266, 0, 0, 0, 1, 1,
0.2198058, 0.9535175, 0.4184781, 0, 0, 0, 1, 1,
0.225404, -0.4896805, 1.153007, 0, 0, 0, 1, 1,
0.230652, -0.8460883, 4.631435, 1, 1, 1, 1, 1,
0.232416, 1.252616, -0.6928662, 1, 1, 1, 1, 1,
0.2363015, -0.1310469, 2.229465, 1, 1, 1, 1, 1,
0.2368697, 1.200903, 0.5270846, 1, 1, 1, 1, 1,
0.2379823, 0.6451548, 1.605018, 1, 1, 1, 1, 1,
0.2396107, 1.253657, -1.712759, 1, 1, 1, 1, 1,
0.2457589, 0.3295417, -0.8082818, 1, 1, 1, 1, 1,
0.2465363, 0.7607692, 1.95372, 1, 1, 1, 1, 1,
0.2477698, -1.344961, 4.936559, 1, 1, 1, 1, 1,
0.2489099, -0.1549495, 2.060236, 1, 1, 1, 1, 1,
0.2538262, 0.6365472, 0.01434196, 1, 1, 1, 1, 1,
0.2576844, 0.532821, 0.1745376, 1, 1, 1, 1, 1,
0.257708, 0.06324766, 1.946004, 1, 1, 1, 1, 1,
0.2628499, 1.986649, 0.7781614, 1, 1, 1, 1, 1,
0.2641306, -0.3488015, 3.464373, 1, 1, 1, 1, 1,
0.2727885, -1.683685, 3.063063, 0, 0, 1, 1, 1,
0.2778862, -2.394243, 2.668576, 1, 0, 0, 1, 1,
0.2813472, -0.4735242, 5.828071, 1, 0, 0, 1, 1,
0.2832682, -0.9733829, 5.01477, 1, 0, 0, 1, 1,
0.28628, -1.447417, 2.984842, 1, 0, 0, 1, 1,
0.2899593, -2.354092, 4.323157, 1, 0, 0, 1, 1,
0.294016, -1.007329, 2.214385, 0, 0, 0, 1, 1,
0.2944288, 0.4575837, 0.3425572, 0, 0, 0, 1, 1,
0.3031935, -0.5938369, 2.727272, 0, 0, 0, 1, 1,
0.3034839, -1.587413, 4.219356, 0, 0, 0, 1, 1,
0.3120719, -0.7411977, 2.380392, 0, 0, 0, 1, 1,
0.3139988, -1.889803, 1.278915, 0, 0, 0, 1, 1,
0.3158587, 0.2215876, -0.5389855, 0, 0, 0, 1, 1,
0.3174552, 0.1567739, 1.409433, 1, 1, 1, 1, 1,
0.32107, -0.9378011, 1.761119, 1, 1, 1, 1, 1,
0.3222654, -0.3510582, 1.765928, 1, 1, 1, 1, 1,
0.3248833, -1.601966, 2.761467, 1, 1, 1, 1, 1,
0.3277697, -0.588315, 2.750238, 1, 1, 1, 1, 1,
0.3296758, -1.961986, 1.84707, 1, 1, 1, 1, 1,
0.3334762, 0.4177877, -0.2143249, 1, 1, 1, 1, 1,
0.340676, -0.8813017, 3.152168, 1, 1, 1, 1, 1,
0.3454532, 0.3011113, 2.286467, 1, 1, 1, 1, 1,
0.3513549, 0.7664746, 1.046307, 1, 1, 1, 1, 1,
0.3554339, 0.7711343, 1.622772, 1, 1, 1, 1, 1,
0.3757862, 1.381931, 0.8157054, 1, 1, 1, 1, 1,
0.3781397, 0.4533533, 0.4074914, 1, 1, 1, 1, 1,
0.3782912, 0.2316584, -0.7959423, 1, 1, 1, 1, 1,
0.3788669, -0.1123538, 2.42918, 1, 1, 1, 1, 1,
0.3792105, -1.334488, 2.706668, 0, 0, 1, 1, 1,
0.3817259, 1.65797, -0.9046206, 1, 0, 0, 1, 1,
0.3830912, 0.4973904, 0.421763, 1, 0, 0, 1, 1,
0.3859678, 1.849161, 0.6453013, 1, 0, 0, 1, 1,
0.3950358, -1.49678, 2.901975, 1, 0, 0, 1, 1,
0.3971661, 1.910084, 2.120423, 1, 0, 0, 1, 1,
0.3973481, -1.160122, 3.674405, 0, 0, 0, 1, 1,
0.4002469, 0.8283229, 1.357658, 0, 0, 0, 1, 1,
0.4060042, -1.251717, 3.146307, 0, 0, 0, 1, 1,
0.4169132, -1.148608, 1.793007, 0, 0, 0, 1, 1,
0.4194188, 1.589069, -0.4303665, 0, 0, 0, 1, 1,
0.4200934, 0.3886569, 0.6293007, 0, 0, 0, 1, 1,
0.4278534, 0.03671335, 2.474476, 0, 0, 0, 1, 1,
0.4321818, 1.772172, -0.6581113, 1, 1, 1, 1, 1,
0.4345495, 0.4212403, 0.1728321, 1, 1, 1, 1, 1,
0.4379474, 0.4952151, -1.144289, 1, 1, 1, 1, 1,
0.438694, -0.8336957, 2.803628, 1, 1, 1, 1, 1,
0.4407525, -0.8630789, 2.025839, 1, 1, 1, 1, 1,
0.4483783, 0.5753681, -0.3470262, 1, 1, 1, 1, 1,
0.4490694, 1.624056, 0.5116341, 1, 1, 1, 1, 1,
0.4509997, 1.20808, -0.07786571, 1, 1, 1, 1, 1,
0.4531214, 1.359844, 1.329902, 1, 1, 1, 1, 1,
0.457872, -0.5495932, 2.321307, 1, 1, 1, 1, 1,
0.4614647, -0.5073892, 2.779052, 1, 1, 1, 1, 1,
0.4621251, -0.5942311, 0.7004535, 1, 1, 1, 1, 1,
0.4636391, -0.3189791, 2.723613, 1, 1, 1, 1, 1,
0.4706422, 0.4647731, 3.039385, 1, 1, 1, 1, 1,
0.474265, -0.0227122, 0.6316079, 1, 1, 1, 1, 1,
0.4828086, -1.348105, 2.741867, 0, 0, 1, 1, 1,
0.4858108, 0.1649066, -0.6765766, 1, 0, 0, 1, 1,
0.4861391, 0.307065, 1.560376, 1, 0, 0, 1, 1,
0.4864478, 0.2590233, 2.630378, 1, 0, 0, 1, 1,
0.493088, -0.3095187, 2.702176, 1, 0, 0, 1, 1,
0.4994189, -2.023118, 2.155714, 1, 0, 0, 1, 1,
0.5001232, 0.7756766, -0.4990203, 0, 0, 0, 1, 1,
0.5029814, -1.199578, 0.9944752, 0, 0, 0, 1, 1,
0.5054516, 1.53232, 0.1804128, 0, 0, 0, 1, 1,
0.5066535, 0.1273938, 1.350312, 0, 0, 0, 1, 1,
0.5099565, 0.4860914, 0.04594317, 0, 0, 0, 1, 1,
0.5107695, -0.9244343, 3.332184, 0, 0, 0, 1, 1,
0.5139194, 1.168647, 1.650222, 0, 0, 0, 1, 1,
0.5200315, -0.142533, 1.247348, 1, 1, 1, 1, 1,
0.532295, -1.209916, 2.406717, 1, 1, 1, 1, 1,
0.5373272, 0.4386921, -0.6993326, 1, 1, 1, 1, 1,
0.542224, -0.2800706, 2.254498, 1, 1, 1, 1, 1,
0.5457941, 0.6406702, 0.08980692, 1, 1, 1, 1, 1,
0.549145, -0.4234559, 2.326049, 1, 1, 1, 1, 1,
0.5521003, -0.3947563, 1.986885, 1, 1, 1, 1, 1,
0.5534801, -0.01552809, 0.2278399, 1, 1, 1, 1, 1,
0.5536559, -1.2794, 2.662717, 1, 1, 1, 1, 1,
0.5712612, 1.710836, 1.578174, 1, 1, 1, 1, 1,
0.5755763, 0.4900191, 1.087478, 1, 1, 1, 1, 1,
0.5782597, -0.8385855, 2.174908, 1, 1, 1, 1, 1,
0.5807682, -0.03004099, 0.3290994, 1, 1, 1, 1, 1,
0.5818079, -1.270445, 1.676251, 1, 1, 1, 1, 1,
0.5850995, -0.3833461, 0.4400745, 1, 1, 1, 1, 1,
0.5879284, -0.9036823, 4.389764, 0, 0, 1, 1, 1,
0.58838, 0.9807954, 0.1784242, 1, 0, 0, 1, 1,
0.5893611, -0.7090146, 2.492451, 1, 0, 0, 1, 1,
0.5903657, 0.02699356, 2.634659, 1, 0, 0, 1, 1,
0.5915351, -0.5390633, 2.416344, 1, 0, 0, 1, 1,
0.5933466, 1.280252, 1.0065, 1, 0, 0, 1, 1,
0.5935675, 0.2609203, 1.384276, 0, 0, 0, 1, 1,
0.5959466, 0.8679467, 0.6949793, 0, 0, 0, 1, 1,
0.5970446, 0.3337224, 0.5360928, 0, 0, 0, 1, 1,
0.5979112, 0.5431704, 0.6293283, 0, 0, 0, 1, 1,
0.6011541, 1.193782, 1.58932, 0, 0, 0, 1, 1,
0.6071265, -1.062013, 1.917961, 0, 0, 0, 1, 1,
0.6122445, -0.05515946, 1.69359, 0, 0, 0, 1, 1,
0.6153423, -0.1023256, -1.075921, 1, 1, 1, 1, 1,
0.6156879, 0.3503868, 0.2474299, 1, 1, 1, 1, 1,
0.6178824, -0.06515856, 2.10335, 1, 1, 1, 1, 1,
0.625797, -0.1330111, 3.439568, 1, 1, 1, 1, 1,
0.6313908, 0.1454004, 2.569713, 1, 1, 1, 1, 1,
0.6315638, 0.3743356, -0.6336172, 1, 1, 1, 1, 1,
0.6350168, -0.5598131, 1.277933, 1, 1, 1, 1, 1,
0.6409003, -1.70617, 3.619633, 1, 1, 1, 1, 1,
0.643018, 1.211319, 0.6363994, 1, 1, 1, 1, 1,
0.6443424, 1.11364, 0.7480791, 1, 1, 1, 1, 1,
0.6536401, 1.417555, -2.28825, 1, 1, 1, 1, 1,
0.6591784, -1.054105, 3.983325, 1, 1, 1, 1, 1,
0.6600899, -0.03083084, 1.231316, 1, 1, 1, 1, 1,
0.6658489, 0.5022377, -0.2500962, 1, 1, 1, 1, 1,
0.666316, 0.5209843, 1.221443, 1, 1, 1, 1, 1,
0.6726835, -1.02952, 0.3029479, 0, 0, 1, 1, 1,
0.6731376, -1.172506, 1.312161, 1, 0, 0, 1, 1,
0.6744232, 0.6833813, 0.8324803, 1, 0, 0, 1, 1,
0.6790788, -1.872029, 2.099323, 1, 0, 0, 1, 1,
0.6859012, -0.6707593, 1.503518, 1, 0, 0, 1, 1,
0.6879625, 0.7861081, -0.4157171, 1, 0, 0, 1, 1,
0.692373, -0.5958433, 3.003251, 0, 0, 0, 1, 1,
0.6939676, -0.668802, 2.20498, 0, 0, 0, 1, 1,
0.7076014, -1.391117, 3.190825, 0, 0, 0, 1, 1,
0.7098733, -1.865842, 4.14801, 0, 0, 0, 1, 1,
0.7139978, -1.096187, 2.41763, 0, 0, 0, 1, 1,
0.7166954, -1.258099, 3.548722, 0, 0, 0, 1, 1,
0.7200959, -0.7235678, 1.96841, 0, 0, 0, 1, 1,
0.7247094, 0.08743121, 2.13864, 1, 1, 1, 1, 1,
0.725015, -1.068185, 2.814527, 1, 1, 1, 1, 1,
0.7250496, -0.9805945, 2.425273, 1, 1, 1, 1, 1,
0.7355418, -0.3715355, 2.085234, 1, 1, 1, 1, 1,
0.7373173, 0.03316891, 1.658502, 1, 1, 1, 1, 1,
0.7391286, 0.4998067, 0.4774859, 1, 1, 1, 1, 1,
0.7408455, 0.08262864, 0.4128689, 1, 1, 1, 1, 1,
0.7449193, -0.5924804, 1.414318, 1, 1, 1, 1, 1,
0.7463331, 1.658872, -0.7483349, 1, 1, 1, 1, 1,
0.7467285, 1.254277, -0.1000275, 1, 1, 1, 1, 1,
0.746891, -0.3781002, 3.19248, 1, 1, 1, 1, 1,
0.7473077, 0.5226378, 0.6643588, 1, 1, 1, 1, 1,
0.7479439, -0.3228895, 1.797169, 1, 1, 1, 1, 1,
0.748107, -2.532515, 2.569703, 1, 1, 1, 1, 1,
0.7514609, -0.2930134, 2.432401, 1, 1, 1, 1, 1,
0.7540814, 0.6326638, 2.03328, 0, 0, 1, 1, 1,
0.7619615, -0.7483315, 2.630654, 1, 0, 0, 1, 1,
0.76307, -1.748066, 1.385571, 1, 0, 0, 1, 1,
0.7708002, -0.5938642, 0.8491958, 1, 0, 0, 1, 1,
0.7766787, -0.7430615, 3.494254, 1, 0, 0, 1, 1,
0.7899498, 1.053, -1.513737, 1, 0, 0, 1, 1,
0.7936586, -0.851881, 2.759446, 0, 0, 0, 1, 1,
0.7967806, -0.8332972, 3.946642, 0, 0, 0, 1, 1,
0.798286, 1.564316, -0.01482551, 0, 0, 0, 1, 1,
0.8057932, 1.763578, -0.4542235, 0, 0, 0, 1, 1,
0.8059266, 0.05149901, 2.845533, 0, 0, 0, 1, 1,
0.8150812, 2.161133, -0.3749927, 0, 0, 0, 1, 1,
0.8156075, 0.03182786, -0.1775679, 0, 0, 0, 1, 1,
0.818143, 1.636733, 1.332751, 1, 1, 1, 1, 1,
0.8189428, 0.3547167, 2.205432, 1, 1, 1, 1, 1,
0.8272505, -0.9120391, 2.037367, 1, 1, 1, 1, 1,
0.8307083, 0.3902604, 2.640154, 1, 1, 1, 1, 1,
0.8348756, 0.01728235, 1.860446, 1, 1, 1, 1, 1,
0.8361238, -0.972896, 2.931146, 1, 1, 1, 1, 1,
0.8361796, 1.052765, 1.077032, 1, 1, 1, 1, 1,
0.8410289, -0.5376282, 0.1002154, 1, 1, 1, 1, 1,
0.8436318, 1.542106, -0.06860848, 1, 1, 1, 1, 1,
0.8458977, -0.2607895, 1.376957, 1, 1, 1, 1, 1,
0.8478538, 0.4536485, 1.127677, 1, 1, 1, 1, 1,
0.8545694, -0.2690381, 2.801873, 1, 1, 1, 1, 1,
0.8709524, 1.481267, 0.4257047, 1, 1, 1, 1, 1,
0.8735827, -0.7744321, 2.010073, 1, 1, 1, 1, 1,
0.8823344, -0.1967718, 3.017706, 1, 1, 1, 1, 1,
0.8988227, 0.04098707, 2.277879, 0, 0, 1, 1, 1,
0.9008092, -0.5498661, 1.224478, 1, 0, 0, 1, 1,
0.9035417, -0.9785254, 2.97925, 1, 0, 0, 1, 1,
0.9036534, 0.1482513, 2.682065, 1, 0, 0, 1, 1,
0.9043558, 0.1645034, 2.177279, 1, 0, 0, 1, 1,
0.9060352, 0.1695151, 1.860429, 1, 0, 0, 1, 1,
0.9080372, -0.7002103, 2.900586, 0, 0, 0, 1, 1,
0.9187282, 0.7409106, 0.1910289, 0, 0, 0, 1, 1,
0.9237744, 1.286967, 1.097636, 0, 0, 0, 1, 1,
0.9243475, -3.302456, 2.380728, 0, 0, 0, 1, 1,
0.9288047, 0.3050477, 1.053623, 0, 0, 0, 1, 1,
0.9337694, 2.980894, 1.323281, 0, 0, 0, 1, 1,
0.9347855, 0.2272655, 0.3222435, 0, 0, 0, 1, 1,
0.93502, 1.013335, 1.077472, 1, 1, 1, 1, 1,
0.9465193, 0.4661522, 3.147683, 1, 1, 1, 1, 1,
0.9517028, 0.4249438, 2.632065, 1, 1, 1, 1, 1,
0.9520856, 1.002193, 0.967222, 1, 1, 1, 1, 1,
0.9531755, -0.8614287, 2.480031, 1, 1, 1, 1, 1,
0.9554821, -0.7084792, 3.298249, 1, 1, 1, 1, 1,
0.9587086, -0.05796386, 1.328878, 1, 1, 1, 1, 1,
0.9612466, -0.3925295, 0.3587492, 1, 1, 1, 1, 1,
0.9682553, 1.02128, -0.1346399, 1, 1, 1, 1, 1,
0.971485, 0.4853428, 1.148564, 1, 1, 1, 1, 1,
0.9716389, -0.9502153, 2.47169, 1, 1, 1, 1, 1,
0.9723812, -0.5122377, 2.999606, 1, 1, 1, 1, 1,
0.9728641, -1.126348, 2.729912, 1, 1, 1, 1, 1,
0.9750149, -0.4745098, 4.359432, 1, 1, 1, 1, 1,
0.9777918, -0.1457012, 0.3567061, 1, 1, 1, 1, 1,
0.9840975, -1.4627, 2.299992, 0, 0, 1, 1, 1,
1.003766, -0.3465424, 1.213463, 1, 0, 0, 1, 1,
1.004929, 1.592235, 2.213675, 1, 0, 0, 1, 1,
1.005592, -0.984786, 1.941342, 1, 0, 0, 1, 1,
1.016912, 0.4944469, -0.09946035, 1, 0, 0, 1, 1,
1.019429, -1.228833, 1.215135, 1, 0, 0, 1, 1,
1.020179, 0.1785302, 1.280411, 0, 0, 0, 1, 1,
1.022858, -0.8700064, 1.190899, 0, 0, 0, 1, 1,
1.028245, 0.1538894, 1.738127, 0, 0, 0, 1, 1,
1.029956, 0.1374473, 1.634831, 0, 0, 0, 1, 1,
1.032091, -0.6163386, 3.081325, 0, 0, 0, 1, 1,
1.032569, -1.363262, 3.446024, 0, 0, 0, 1, 1,
1.036277, 0.9112915, 2.653912, 0, 0, 0, 1, 1,
1.040713, -0.4501941, 1.028552, 1, 1, 1, 1, 1,
1.050495, 0.1623513, 1.584797, 1, 1, 1, 1, 1,
1.059824, -0.08044899, 4.673372, 1, 1, 1, 1, 1,
1.060448, -0.3356859, 2.888044, 1, 1, 1, 1, 1,
1.063925, -0.1033209, 2.304503, 1, 1, 1, 1, 1,
1.065501, -0.3648835, 2.081345, 1, 1, 1, 1, 1,
1.071041, 1.027781, 1.500923, 1, 1, 1, 1, 1,
1.072022, 0.07283471, 3.728742, 1, 1, 1, 1, 1,
1.072431, 0.9513202, -0.2150223, 1, 1, 1, 1, 1,
1.083925, 0.1562551, 2.059012, 1, 1, 1, 1, 1,
1.086561, 0.1951975, 3.333943, 1, 1, 1, 1, 1,
1.090849, 0.1779147, 0.4520863, 1, 1, 1, 1, 1,
1.091848, 1.331381, 2.088735, 1, 1, 1, 1, 1,
1.093046, -0.1357682, 1.743831, 1, 1, 1, 1, 1,
1.095386, 1.412199, 1.07237, 1, 1, 1, 1, 1,
1.100826, 1.59904, 0.7403366, 0, 0, 1, 1, 1,
1.108875, 0.7618077, 0.254646, 1, 0, 0, 1, 1,
1.109442, -0.9181326, 3.271851, 1, 0, 0, 1, 1,
1.112387, -2.327026, 2.00062, 1, 0, 0, 1, 1,
1.117226, -0.3567802, 1.727041, 1, 0, 0, 1, 1,
1.117233, 1.483459, 1.009762, 1, 0, 0, 1, 1,
1.117521, -1.094008, 1.778146, 0, 0, 0, 1, 1,
1.119449, 0.2001621, 1.978285, 0, 0, 0, 1, 1,
1.123334, -0.4663043, 2.832344, 0, 0, 0, 1, 1,
1.124372, -1.711557, 1.35825, 0, 0, 0, 1, 1,
1.129772, -0.5822825, 2.856024, 0, 0, 0, 1, 1,
1.131274, 0.9350268, -0.4712323, 0, 0, 0, 1, 1,
1.132295, -1.142123, 3.08848, 0, 0, 0, 1, 1,
1.133703, -0.2495716, 3.372635, 1, 1, 1, 1, 1,
1.136305, -1.439427, 0.4324368, 1, 1, 1, 1, 1,
1.137033, -0.2214666, 2.581472, 1, 1, 1, 1, 1,
1.141379, -0.3017471, 1.620202, 1, 1, 1, 1, 1,
1.147174, 0.149939, 2.170028, 1, 1, 1, 1, 1,
1.155949, 0.4935861, 0.3233242, 1, 1, 1, 1, 1,
1.158736, 1.237309, -0.811043, 1, 1, 1, 1, 1,
1.171117, -0.6454972, 2.716732, 1, 1, 1, 1, 1,
1.173005, 0.5997587, 0.563306, 1, 1, 1, 1, 1,
1.173325, 0.562739, 1.393232, 1, 1, 1, 1, 1,
1.176432, 0.5780286, 2.44184, 1, 1, 1, 1, 1,
1.178341, -1.76436, 2.064129, 1, 1, 1, 1, 1,
1.182948, -0.08213611, 1.463297, 1, 1, 1, 1, 1,
1.189166, 0.3392776, 0.2866859, 1, 1, 1, 1, 1,
1.191212, 0.4274169, 1.701867, 1, 1, 1, 1, 1,
1.19327, -0.8551731, 2.544491, 0, 0, 1, 1, 1,
1.195822, 1.035036, 0.5245051, 1, 0, 0, 1, 1,
1.19889, -0.7562755, 2.79568, 1, 0, 0, 1, 1,
1.200031, -0.3596015, 3.312404, 1, 0, 0, 1, 1,
1.207506, 0.8821227, 1.241795, 1, 0, 0, 1, 1,
1.20793, 0.6466641, 1.072255, 1, 0, 0, 1, 1,
1.208621, -0.8545523, 3.127487, 0, 0, 0, 1, 1,
1.216711, 1.167081, 0.416508, 0, 0, 0, 1, 1,
1.22015, 0.9673935, 1.541507, 0, 0, 0, 1, 1,
1.225558, -0.3590846, 1.443323, 0, 0, 0, 1, 1,
1.225923, 2.550466, 0.032441, 0, 0, 0, 1, 1,
1.238495, 0.3163441, 1.082435, 0, 0, 0, 1, 1,
1.239179, 1.864213, -1.875909, 0, 0, 0, 1, 1,
1.245144, 0.5004616, 1.908848, 1, 1, 1, 1, 1,
1.251368, -0.690396, 2.28038, 1, 1, 1, 1, 1,
1.252862, -1.291727, 2.848624, 1, 1, 1, 1, 1,
1.253208, 0.1254273, 1.022896, 1, 1, 1, 1, 1,
1.255018, -0.127788, 2.760402, 1, 1, 1, 1, 1,
1.258499, 0.2539273, 2.814022, 1, 1, 1, 1, 1,
1.258802, -0.1430496, 2.892813, 1, 1, 1, 1, 1,
1.262575, 0.6697584, 1.099635, 1, 1, 1, 1, 1,
1.264214, -0.5707334, 1.032876, 1, 1, 1, 1, 1,
1.270033, -0.2055449, 0.4092585, 1, 1, 1, 1, 1,
1.272029, 0.8702333, 0.680246, 1, 1, 1, 1, 1,
1.272607, -0.5094201, 2.743021, 1, 1, 1, 1, 1,
1.273306, -1.247787, 1.087168, 1, 1, 1, 1, 1,
1.281956, -0.7279607, -0.1516935, 1, 1, 1, 1, 1,
1.282378, -3.241746, 4.027283, 1, 1, 1, 1, 1,
1.289094, 0.5660442, 2.131702, 0, 0, 1, 1, 1,
1.295319, 0.4514778, -0.3146105, 1, 0, 0, 1, 1,
1.299013, -1.789226, 1.178403, 1, 0, 0, 1, 1,
1.304302, 0.5658539, 1.710486, 1, 0, 0, 1, 1,
1.30888, -1.128803, 1.315769, 1, 0, 0, 1, 1,
1.310652, 0.1929403, 1.991097, 1, 0, 0, 1, 1,
1.327006, -0.9558378, 2.525005, 0, 0, 0, 1, 1,
1.33022, 1.271558, 3.139049, 0, 0, 0, 1, 1,
1.333115, -1.500909, 2.976743, 0, 0, 0, 1, 1,
1.336172, 1.113207, 0.8171471, 0, 0, 0, 1, 1,
1.339116, -2.258676, 1.591721, 0, 0, 0, 1, 1,
1.349503, 0.005563523, 2.434055, 0, 0, 0, 1, 1,
1.358101, 0.8521793, 0.9950699, 0, 0, 0, 1, 1,
1.373574, -0.5331262, 1.164078, 1, 1, 1, 1, 1,
1.378469, -0.2346004, 1.299266, 1, 1, 1, 1, 1,
1.385636, -0.3616532, 2.252322, 1, 1, 1, 1, 1,
1.390568, 1.637591, -0.1983055, 1, 1, 1, 1, 1,
1.391706, -1.461337, 4.238833, 1, 1, 1, 1, 1,
1.393965, 0.1166585, 1.936823, 1, 1, 1, 1, 1,
1.399834, 0.3195212, 1.385134, 1, 1, 1, 1, 1,
1.413017, -1.629269, 2.24913, 1, 1, 1, 1, 1,
1.414363, -0.7361483, 1.64146, 1, 1, 1, 1, 1,
1.421259, -0.446505, 2.27168, 1, 1, 1, 1, 1,
1.439898, 0.503635, -0.03548439, 1, 1, 1, 1, 1,
1.441964, -1.313084, 2.769848, 1, 1, 1, 1, 1,
1.444459, 0.01025619, 1.620992, 1, 1, 1, 1, 1,
1.446502, -1.991041, 2.94931, 1, 1, 1, 1, 1,
1.446528, 0.9408318, 0.9037181, 1, 1, 1, 1, 1,
1.455938, -0.9835768, 2.1208, 0, 0, 1, 1, 1,
1.459269, 0.437592, 1.30542, 1, 0, 0, 1, 1,
1.462471, 2.183909, -0.009559033, 1, 0, 0, 1, 1,
1.469472, -0.1390174, 1.248111, 1, 0, 0, 1, 1,
1.472006, 0.6644729, 2.03523, 1, 0, 0, 1, 1,
1.472633, 1.949164, -0.2882534, 1, 0, 0, 1, 1,
1.475118, 0.7383541, 2.267959, 0, 0, 0, 1, 1,
1.491917, -0.166061, 2.247036, 0, 0, 0, 1, 1,
1.496869, 0.7428183, 2.097047, 0, 0, 0, 1, 1,
1.500984, 0.3319238, 2.393886, 0, 0, 0, 1, 1,
1.516276, 0.3081976, 2.560696, 0, 0, 0, 1, 1,
1.517901, -0.8077605, 2.345098, 0, 0, 0, 1, 1,
1.526799, -0.2301998, 3.508958, 0, 0, 0, 1, 1,
1.553712, 0.6080902, 0.4277814, 1, 1, 1, 1, 1,
1.554124, -0.5436104, 3.092288, 1, 1, 1, 1, 1,
1.575976, -1.513605, 3.75497, 1, 1, 1, 1, 1,
1.59054, 0.1743752, 2.402591, 1, 1, 1, 1, 1,
1.602341, -1.191224, 0.9961771, 1, 1, 1, 1, 1,
1.605896, -0.4813949, 1.576192, 1, 1, 1, 1, 1,
1.608245, 1.184021, 0.6390354, 1, 1, 1, 1, 1,
1.615636, -1.024805, 3.40019, 1, 1, 1, 1, 1,
1.623232, 0.520609, 1.650798, 1, 1, 1, 1, 1,
1.626381, -0.5123249, 1.738227, 1, 1, 1, 1, 1,
1.640197, -0.1745611, 3.376611, 1, 1, 1, 1, 1,
1.641706, -1.774625, 2.264241, 1, 1, 1, 1, 1,
1.64399, -2.463227, 3.341477, 1, 1, 1, 1, 1,
1.673118, -3.032936, 2.581572, 1, 1, 1, 1, 1,
1.680433, -1.202876, 2.213935, 1, 1, 1, 1, 1,
1.703079, 1.127431, 0.4638307, 0, 0, 1, 1, 1,
1.713509, 1.802779, -1.008168, 1, 0, 0, 1, 1,
1.726892, -0.5753476, 2.295874, 1, 0, 0, 1, 1,
1.743696, 0.5349555, 1.518801, 1, 0, 0, 1, 1,
1.746491, 0.786185, 2.749864, 1, 0, 0, 1, 1,
1.752842, 0.5697408, 2.263391, 1, 0, 0, 1, 1,
1.769322, 0.1021693, 0.9702143, 0, 0, 0, 1, 1,
1.771337, -1.647451, 5.041782, 0, 0, 0, 1, 1,
1.773373, 0.1086807, 2.238904, 0, 0, 0, 1, 1,
1.776417, 0.161493, 2.174051, 0, 0, 0, 1, 1,
1.781461, -0.5357766, 0.6697457, 0, 0, 0, 1, 1,
1.78203, -0.04128119, 0.9565802, 0, 0, 0, 1, 1,
1.790345, -0.0414591, -0.3158923, 0, 0, 0, 1, 1,
1.804201, 0.3968427, 1.900921, 1, 1, 1, 1, 1,
1.812264, -1.80209, 1.848786, 1, 1, 1, 1, 1,
1.815622, -0.9868386, 2.952712, 1, 1, 1, 1, 1,
1.820363, 1.498686, 1.979513, 1, 1, 1, 1, 1,
1.84245, 0.1359856, 3.039436, 1, 1, 1, 1, 1,
1.852608, -0.09912069, 0.7319557, 1, 1, 1, 1, 1,
1.855928, -0.7911694, 2.508673, 1, 1, 1, 1, 1,
1.917377, -0.6328225, 2.981984, 1, 1, 1, 1, 1,
1.926721, -0.04333093, 0.9524192, 1, 1, 1, 1, 1,
1.931028, 0.7305027, -0.4055451, 1, 1, 1, 1, 1,
1.94668, -1.872082, 2.312644, 1, 1, 1, 1, 1,
1.963814, 0.1738476, 2.285206, 1, 1, 1, 1, 1,
1.986887, 0.08151507, -0.7662111, 1, 1, 1, 1, 1,
2.008689, 0.6675996, 1.590011, 1, 1, 1, 1, 1,
2.010988, 0.6572593, 1.194273, 1, 1, 1, 1, 1,
2.020055, -1.172134, 2.006452, 0, 0, 1, 1, 1,
2.049984, -0.2631422, 1.785647, 1, 0, 0, 1, 1,
2.061711, 1.359513, 2.082031, 1, 0, 0, 1, 1,
2.16931, -0.3138859, 1.501777, 1, 0, 0, 1, 1,
2.180372, -0.7551274, 2.714874, 1, 0, 0, 1, 1,
2.189019, 1.188462, -0.8977563, 1, 0, 0, 1, 1,
2.194294, -0.5476712, 0.946715, 0, 0, 0, 1, 1,
2.200298, -0.3131753, 0.3332114, 0, 0, 0, 1, 1,
2.207711, -1.139356, 0.340388, 0, 0, 0, 1, 1,
2.220448, -1.865345, 1.19932, 0, 0, 0, 1, 1,
2.258451, -0.09398083, 0.6780377, 0, 0, 0, 1, 1,
2.301284, 0.326588, 0.7840205, 0, 0, 0, 1, 1,
2.328775, -1.638172, 1.473559, 0, 0, 0, 1, 1,
2.332016, -1.797946, 2.956838, 1, 1, 1, 1, 1,
2.340269, -0.4941782, 1.731762, 1, 1, 1, 1, 1,
2.42219, -1.40639, 1.398852, 1, 1, 1, 1, 1,
2.428659, 0.007078497, 0.04530052, 1, 1, 1, 1, 1,
2.460239, -0.1574824, 0.6320595, 1, 1, 1, 1, 1,
2.599939, 0.2666277, 1.312204, 1, 1, 1, 1, 1,
3.050492, 0.0123635, 1.121052, 1, 1, 1, 1, 1
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
var radius = 9.979495;
var distance = 35.05255;
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
mvMatrix.translate( 0.02156591, 0.2771816, 0.01809144 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.05255);
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
