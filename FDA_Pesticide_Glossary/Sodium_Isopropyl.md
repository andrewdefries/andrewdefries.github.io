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
-3.398608, -2.08673, -3.139016, 1, 0, 0, 1,
-2.970243, -0.3228845, -2.10626, 1, 0.007843138, 0, 1,
-2.94092, 0.3167087, 0.3290592, 1, 0.01176471, 0, 1,
-2.772147, 0.08649471, -2.322277, 1, 0.01960784, 0, 1,
-2.698282, -0.9031983, -1.606466, 1, 0.02352941, 0, 1,
-2.550094, -0.1184352, -1.029918, 1, 0.03137255, 0, 1,
-2.513293, 0.1333968, 0.2569496, 1, 0.03529412, 0, 1,
-2.432126, -1.150034, -1.491178, 1, 0.04313726, 0, 1,
-2.377381, -0.2432189, -1.976382, 1, 0.04705882, 0, 1,
-2.374378, 2.100758, -0.4833819, 1, 0.05490196, 0, 1,
-2.333842, -1.836033, -1.269565, 1, 0.05882353, 0, 1,
-2.271693, 1.704677, -1.476554, 1, 0.06666667, 0, 1,
-2.26368, 0.3176022, -1.808341, 1, 0.07058824, 0, 1,
-2.255267, -0.1965169, -0.2021921, 1, 0.07843138, 0, 1,
-2.223882, 1.400296, -1.151571, 1, 0.08235294, 0, 1,
-2.139456, 0.5511373, -2.90695, 1, 0.09019608, 0, 1,
-2.133539, 1.022192, -1.240757, 1, 0.09411765, 0, 1,
-2.123853, -0.6627932, -2.361714, 1, 0.1019608, 0, 1,
-2.119996, 0.8742427, 0.3849955, 1, 0.1098039, 0, 1,
-2.101591, -0.7129238, -2.422452, 1, 0.1137255, 0, 1,
-2.055143, 0.2268883, -1.245908, 1, 0.1215686, 0, 1,
-2.022066, 1.597535, -1.385571, 1, 0.1254902, 0, 1,
-2.004531, 0.7259984, 0.9176039, 1, 0.1333333, 0, 1,
-1.97239, 0.5172881, -1.914823, 1, 0.1372549, 0, 1,
-1.959093, 0.573553, -2.556179, 1, 0.145098, 0, 1,
-1.945615, 0.8023433, -2.427538, 1, 0.1490196, 0, 1,
-1.912527, 1.505109, 0.9897611, 1, 0.1568628, 0, 1,
-1.904426, 0.487576, -2.09684, 1, 0.1607843, 0, 1,
-1.884465, 0.1207618, -2.376745, 1, 0.1686275, 0, 1,
-1.860306, 1.876099, -0.6900121, 1, 0.172549, 0, 1,
-1.82423, 0.2168312, -0.2571195, 1, 0.1803922, 0, 1,
-1.8157, -0.1568511, -2.254455, 1, 0.1843137, 0, 1,
-1.812002, -0.9418733, -1.609326, 1, 0.1921569, 0, 1,
-1.792989, -0.9696956, -1.92714, 1, 0.1960784, 0, 1,
-1.781331, -0.8503699, 0.7553526, 1, 0.2039216, 0, 1,
-1.760998, -0.3910128, -0.7456472, 1, 0.2117647, 0, 1,
-1.758438, 0.3294906, -2.090771, 1, 0.2156863, 0, 1,
-1.754433, 1.367246, -1.442793, 1, 0.2235294, 0, 1,
-1.727638, 0.1009866, -1.596495, 1, 0.227451, 0, 1,
-1.721615, -0.8412403, -0.7075049, 1, 0.2352941, 0, 1,
-1.719726, -1.429274, -2.244376, 1, 0.2392157, 0, 1,
-1.717348, -0.2196872, -0.8537998, 1, 0.2470588, 0, 1,
-1.716004, -1.021752, -4.61398, 1, 0.2509804, 0, 1,
-1.690531, -0.9402312, -1.160487, 1, 0.2588235, 0, 1,
-1.682588, -0.631183, -2.881396, 1, 0.2627451, 0, 1,
-1.678305, 0.5213459, -0.5650229, 1, 0.2705882, 0, 1,
-1.644937, -0.105262, -0.7198863, 1, 0.2745098, 0, 1,
-1.644281, 0.4839625, -0.1239539, 1, 0.282353, 0, 1,
-1.634499, 0.5686627, -0.08605643, 1, 0.2862745, 0, 1,
-1.632711, -0.4486037, -0.5317498, 1, 0.2941177, 0, 1,
-1.630504, 0.2541264, -1.434751, 1, 0.3019608, 0, 1,
-1.629906, 0.211462, -0.9151961, 1, 0.3058824, 0, 1,
-1.620322, -1.185197, -1.65163, 1, 0.3137255, 0, 1,
-1.614408, -1.208683, -2.309142, 1, 0.3176471, 0, 1,
-1.602051, 0.4981698, -2.405146, 1, 0.3254902, 0, 1,
-1.585316, 0.1807294, -0.4083481, 1, 0.3294118, 0, 1,
-1.550979, 0.6292561, -1.550071, 1, 0.3372549, 0, 1,
-1.49687, -0.2069914, -1.111806, 1, 0.3411765, 0, 1,
-1.488911, -1.276112, -2.41049, 1, 0.3490196, 0, 1,
-1.479911, 0.6074302, -0.4691931, 1, 0.3529412, 0, 1,
-1.475805, -1.030406, -2.038329, 1, 0.3607843, 0, 1,
-1.448003, -0.6767337, -2.222687, 1, 0.3647059, 0, 1,
-1.438441, 0.3427135, -0.738026, 1, 0.372549, 0, 1,
-1.436527, -1.344095, -3.437072, 1, 0.3764706, 0, 1,
-1.427597, -1.413756, -3.544111, 1, 0.3843137, 0, 1,
-1.426826, -0.396747, -0.2493279, 1, 0.3882353, 0, 1,
-1.426314, 0.8024384, -0.06422022, 1, 0.3960784, 0, 1,
-1.424895, 1.444788, -0.3536482, 1, 0.4039216, 0, 1,
-1.42001, -0.8822347, -2.37865, 1, 0.4078431, 0, 1,
-1.40151, 1.431257, 0.3113659, 1, 0.4156863, 0, 1,
-1.391876, -0.08912402, -1.91674, 1, 0.4196078, 0, 1,
-1.391066, -0.5378584, -1.221083, 1, 0.427451, 0, 1,
-1.368515, -0.02996948, -1.235625, 1, 0.4313726, 0, 1,
-1.367982, 0.6330161, -1.677908, 1, 0.4392157, 0, 1,
-1.367427, 0.09595292, -1.22007, 1, 0.4431373, 0, 1,
-1.349039, 0.6379035, -3.256671, 1, 0.4509804, 0, 1,
-1.338607, -1.432445, -2.779675, 1, 0.454902, 0, 1,
-1.3259, 0.5343224, -1.241225, 1, 0.4627451, 0, 1,
-1.314998, -1.480661, -3.528935, 1, 0.4666667, 0, 1,
-1.313626, -1.36005, -2.36343, 1, 0.4745098, 0, 1,
-1.310735, -1.293969, -3.812839, 1, 0.4784314, 0, 1,
-1.29508, -0.7546844, -2.90546, 1, 0.4862745, 0, 1,
-1.286603, -1.023644, -1.495026, 1, 0.4901961, 0, 1,
-1.278505, 0.5686276, -1.145499, 1, 0.4980392, 0, 1,
-1.276427, 0.4014087, -0.4726062, 1, 0.5058824, 0, 1,
-1.264202, 0.8700408, -2.664512, 1, 0.509804, 0, 1,
-1.263327, -0.6970189, -1.304978, 1, 0.5176471, 0, 1,
-1.260696, -0.01588262, -1.205994, 1, 0.5215687, 0, 1,
-1.255696, 2.737971, -0.7387682, 1, 0.5294118, 0, 1,
-1.254197, -0.05173407, -1.222995, 1, 0.5333334, 0, 1,
-1.254168, -0.6141112, -4.069997, 1, 0.5411765, 0, 1,
-1.251009, 0.1780984, -1.741122, 1, 0.5450981, 0, 1,
-1.248396, -1.242507, -1.918572, 1, 0.5529412, 0, 1,
-1.245449, -1.452553, -3.725475, 1, 0.5568628, 0, 1,
-1.244119, -1.073686, -2.555397, 1, 0.5647059, 0, 1,
-1.241967, -1.98976, -1.350355, 1, 0.5686275, 0, 1,
-1.241476, -0.1025482, -1.774198, 1, 0.5764706, 0, 1,
-1.23719, -0.2170322, -1.943065, 1, 0.5803922, 0, 1,
-1.220593, 1.765311, -1.593728, 1, 0.5882353, 0, 1,
-1.218592, -1.090542, -4.063739, 1, 0.5921569, 0, 1,
-1.218053, -2.032643, -1.201236, 1, 0.6, 0, 1,
-1.213122, 1.284308, -0.4389464, 1, 0.6078432, 0, 1,
-1.212162, 1.911967, -0.6731091, 1, 0.6117647, 0, 1,
-1.201939, -2.635101, -2.588547, 1, 0.6196079, 0, 1,
-1.194973, 0.7779672, -2.039448, 1, 0.6235294, 0, 1,
-1.190628, -0.2072585, -1.773084, 1, 0.6313726, 0, 1,
-1.182498, -0.5144358, -3.234208, 1, 0.6352941, 0, 1,
-1.176849, -0.7717122, -3.037189, 1, 0.6431373, 0, 1,
-1.161759, 0.6204147, -2.350595, 1, 0.6470588, 0, 1,
-1.160181, 1.777715, -0.04422422, 1, 0.654902, 0, 1,
-1.159519, -0.5165722, -1.824271, 1, 0.6588235, 0, 1,
-1.152778, 1.007885, -1.389615, 1, 0.6666667, 0, 1,
-1.150866, -0.4293663, -2.878575, 1, 0.6705883, 0, 1,
-1.150226, -0.681587, -1.06188, 1, 0.6784314, 0, 1,
-1.14392, -0.9437124, -2.570212, 1, 0.682353, 0, 1,
-1.14083, -0.5189386, -0.07190101, 1, 0.6901961, 0, 1,
-1.137669, 2.352728, 0.1923724, 1, 0.6941177, 0, 1,
-1.136274, 0.7405701, -2.129728, 1, 0.7019608, 0, 1,
-1.133581, 2.043213, -0.6486101, 1, 0.7098039, 0, 1,
-1.130439, -0.04895699, -0.4962007, 1, 0.7137255, 0, 1,
-1.128212, -1.750585, -2.931721, 1, 0.7215686, 0, 1,
-1.126337, 0.7444411, -0.1890682, 1, 0.7254902, 0, 1,
-1.123185, 0.6095033, -1.39923, 1, 0.7333333, 0, 1,
-1.112766, 0.368406, -1.568019, 1, 0.7372549, 0, 1,
-1.106297, 0.7786334, -0.1802425, 1, 0.7450981, 0, 1,
-1.103957, -1.833908, -4.842635, 1, 0.7490196, 0, 1,
-1.101821, 0.06330942, -1.034327, 1, 0.7568628, 0, 1,
-1.094216, 1.058, -0.1647508, 1, 0.7607843, 0, 1,
-1.094199, -1.060255, -3.722728, 1, 0.7686275, 0, 1,
-1.088298, 0.4285335, -2.494301, 1, 0.772549, 0, 1,
-1.086239, 0.7031765, -2.023441, 1, 0.7803922, 0, 1,
-1.085843, -0.8360861, -2.51078, 1, 0.7843137, 0, 1,
-1.079751, -0.5273884, -2.231073, 1, 0.7921569, 0, 1,
-1.07858, -1.905618, -1.226031, 1, 0.7960784, 0, 1,
-1.06685, -0.7250368, -1.656708, 1, 0.8039216, 0, 1,
-1.063936, -0.09939313, -1.943438, 1, 0.8117647, 0, 1,
-1.06389, -1.272897, -3.002131, 1, 0.8156863, 0, 1,
-1.047197, 1.186526, -1.855834, 1, 0.8235294, 0, 1,
-1.045175, 0.3648691, -2.185913, 1, 0.827451, 0, 1,
-1.038733, -0.8262966, -3.330251, 1, 0.8352941, 0, 1,
-1.032368, 0.2468806, -5.163384, 1, 0.8392157, 0, 1,
-1.030199, -0.2780878, -0.2225927, 1, 0.8470588, 0, 1,
-1.018394, -0.1025345, -2.372147, 1, 0.8509804, 0, 1,
-1.012903, -0.1499407, -0.8064161, 1, 0.8588235, 0, 1,
-1.012601, -0.4110737, -1.306633, 1, 0.8627451, 0, 1,
-1.012002, -0.8313116, -2.402457, 1, 0.8705882, 0, 1,
-1.01121, -2.368226, -2.763531, 1, 0.8745098, 0, 1,
-1.010521, -1.23509, -2.577189, 1, 0.8823529, 0, 1,
-1.004656, -1.507052, -1.37198, 1, 0.8862745, 0, 1,
-0.998828, -0.5997999, -2.682019, 1, 0.8941177, 0, 1,
-0.9952688, -0.5544447, -3.96296, 1, 0.8980392, 0, 1,
-0.9916884, 0.6050057, -1.025584, 1, 0.9058824, 0, 1,
-0.9907524, -0.1161243, -0.9128557, 1, 0.9137255, 0, 1,
-0.9830806, 0.2646613, -2.700405, 1, 0.9176471, 0, 1,
-0.9752027, 0.5664238, -0.8121113, 1, 0.9254902, 0, 1,
-0.9665173, 2.051303, 0.2951454, 1, 0.9294118, 0, 1,
-0.9648429, -1.541255, -1.991923, 1, 0.9372549, 0, 1,
-0.9612908, 0.6336031, -0.3920076, 1, 0.9411765, 0, 1,
-0.96047, -0.3255576, -1.348616, 1, 0.9490196, 0, 1,
-0.9576963, 1.435201, -1.803588, 1, 0.9529412, 0, 1,
-0.9564907, -0.570222, -1.375098, 1, 0.9607843, 0, 1,
-0.9557749, -0.5290555, -4.275852, 1, 0.9647059, 0, 1,
-0.9549631, 1.199828, -0.33605, 1, 0.972549, 0, 1,
-0.9486897, -0.8661395, -2.526994, 1, 0.9764706, 0, 1,
-0.9480121, 1.537993, -1.182301, 1, 0.9843137, 0, 1,
-0.9431817, 0.05236026, -1.317648, 1, 0.9882353, 0, 1,
-0.9420643, -0.09886148, -1.851888, 1, 0.9960784, 0, 1,
-0.9356152, -0.2983004, -1.285794, 0.9960784, 1, 0, 1,
-0.9339376, -0.8126056, -0.8389748, 0.9921569, 1, 0, 1,
-0.9242858, 2.764085, -1.128419, 0.9843137, 1, 0, 1,
-0.9180612, -0.4491214, -3.64992, 0.9803922, 1, 0, 1,
-0.9165152, 0.1154137, -2.190539, 0.972549, 1, 0, 1,
-0.9163099, 0.3236832, 0.09181008, 0.9686275, 1, 0, 1,
-0.909554, -0.8986756, -3.366186, 0.9607843, 1, 0, 1,
-0.8985159, 0.8520943, -1.419022, 0.9568627, 1, 0, 1,
-0.8978599, -0.5766137, -2.492998, 0.9490196, 1, 0, 1,
-0.8799413, -1.609545, -3.332772, 0.945098, 1, 0, 1,
-0.8733799, 0.1933944, -0.6814296, 0.9372549, 1, 0, 1,
-0.8660849, 0.4575782, -1.020881, 0.9333333, 1, 0, 1,
-0.8500051, -0.3880139, -0.3984854, 0.9254902, 1, 0, 1,
-0.8495934, 1.037291, -1.41735, 0.9215686, 1, 0, 1,
-0.8487734, -0.1120326, -1.852938, 0.9137255, 1, 0, 1,
-0.8470563, -0.9869705, -2.041718, 0.9098039, 1, 0, 1,
-0.8421369, 0.7906632, -1.863022, 0.9019608, 1, 0, 1,
-0.8408532, -0.7587579, -2.299399, 0.8941177, 1, 0, 1,
-0.8390008, 1.398325, -1.94358, 0.8901961, 1, 0, 1,
-0.838153, 0.8446631, 1.171032, 0.8823529, 1, 0, 1,
-0.8343346, 0.1546577, -2.935138, 0.8784314, 1, 0, 1,
-0.8330241, 0.1909611, -2.314798, 0.8705882, 1, 0, 1,
-0.8329932, 1.411787, 0.3865428, 0.8666667, 1, 0, 1,
-0.8290502, 0.03149482, -2.59784, 0.8588235, 1, 0, 1,
-0.8173527, 1.725762, -0.9821886, 0.854902, 1, 0, 1,
-0.8108813, 1.37736, 0.4921421, 0.8470588, 1, 0, 1,
-0.8078483, -0.3330388, -2.582336, 0.8431373, 1, 0, 1,
-0.7988372, 0.5011792, -1.295318, 0.8352941, 1, 0, 1,
-0.7981646, 0.05075572, -1.447022, 0.8313726, 1, 0, 1,
-0.7942283, -0.2884113, -1.779387, 0.8235294, 1, 0, 1,
-0.7940021, -0.1316046, -1.1216, 0.8196079, 1, 0, 1,
-0.7937322, 0.7302047, -1.004899, 0.8117647, 1, 0, 1,
-0.7934092, -0.4989905, -3.520066, 0.8078431, 1, 0, 1,
-0.7898704, 0.6135761, -2.16777, 0.8, 1, 0, 1,
-0.7723084, -1.842087, -2.707486, 0.7921569, 1, 0, 1,
-0.7718862, -0.5317687, -2.252645, 0.7882353, 1, 0, 1,
-0.7718755, 0.757749, 0.5512067, 0.7803922, 1, 0, 1,
-0.7714796, 0.4002321, -1.947023, 0.7764706, 1, 0, 1,
-0.769668, -0.3539583, -2.709335, 0.7686275, 1, 0, 1,
-0.7644595, 0.04170562, -0.380747, 0.7647059, 1, 0, 1,
-0.7642053, 1.250231, -0.523713, 0.7568628, 1, 0, 1,
-0.7629631, 0.01248081, -0.4103562, 0.7529412, 1, 0, 1,
-0.7564627, -0.6030006, -1.052968, 0.7450981, 1, 0, 1,
-0.7534423, -0.1456449, -1.619969, 0.7411765, 1, 0, 1,
-0.7531633, -0.08152208, -2.301014, 0.7333333, 1, 0, 1,
-0.750772, -0.8252468, -1.828798, 0.7294118, 1, 0, 1,
-0.7450866, -1.586412, -1.97402, 0.7215686, 1, 0, 1,
-0.737343, 0.1520992, -1.205379, 0.7176471, 1, 0, 1,
-0.733461, -0.2054624, -1.524511, 0.7098039, 1, 0, 1,
-0.7326726, -1.602286, -2.382183, 0.7058824, 1, 0, 1,
-0.7313693, -0.2388324, -1.981467, 0.6980392, 1, 0, 1,
-0.7296427, -0.1735041, -1.722966, 0.6901961, 1, 0, 1,
-0.7271035, -1.102649, -3.156065, 0.6862745, 1, 0, 1,
-0.7258662, 0.4195862, -1.405055, 0.6784314, 1, 0, 1,
-0.7257822, 0.04473379, -1.293567, 0.6745098, 1, 0, 1,
-0.7231327, 0.198726, -2.605278, 0.6666667, 1, 0, 1,
-0.7222611, -2.83771, -3.630327, 0.6627451, 1, 0, 1,
-0.7197846, -0.02902873, -2.407008, 0.654902, 1, 0, 1,
-0.716369, 1.830722, -1.036627, 0.6509804, 1, 0, 1,
-0.7150425, 1.256224, 0.4978833, 0.6431373, 1, 0, 1,
-0.7131807, 0.3087063, -0.9690421, 0.6392157, 1, 0, 1,
-0.7085189, -0.5826416, -3.15825, 0.6313726, 1, 0, 1,
-0.7053025, 0.7071819, 0.3157507, 0.627451, 1, 0, 1,
-0.7051753, -2.129595, -4.040981, 0.6196079, 1, 0, 1,
-0.6975514, 1.269027, -0.2404979, 0.6156863, 1, 0, 1,
-0.694599, 1.68797, -1.1522, 0.6078432, 1, 0, 1,
-0.6923212, 0.2574261, 0.9970402, 0.6039216, 1, 0, 1,
-0.6915442, -0.3281863, -3.368595, 0.5960785, 1, 0, 1,
-0.6908036, -1.016956, -3.664971, 0.5882353, 1, 0, 1,
-0.6895975, 1.403177, -0.2357552, 0.5843138, 1, 0, 1,
-0.6868618, 1.622373, -0.4278805, 0.5764706, 1, 0, 1,
-0.6829934, 0.4181481, -1.275117, 0.572549, 1, 0, 1,
-0.6812764, -1.217386, -3.15038, 0.5647059, 1, 0, 1,
-0.6805112, 2.095148, -0.922101, 0.5607843, 1, 0, 1,
-0.6791418, -0.1345316, -2.032156, 0.5529412, 1, 0, 1,
-0.6776735, 0.1419784, -1.160943, 0.5490196, 1, 0, 1,
-0.6700147, -1.465689, -1.029355, 0.5411765, 1, 0, 1,
-0.6676883, -1.344187, -3.021612, 0.5372549, 1, 0, 1,
-0.6586964, -1.474247, -2.48767, 0.5294118, 1, 0, 1,
-0.6568021, -0.9390038, -1.828186, 0.5254902, 1, 0, 1,
-0.6530723, -1.717184, -3.010717, 0.5176471, 1, 0, 1,
-0.6514274, -0.167628, -3.64485, 0.5137255, 1, 0, 1,
-0.6505291, 0.3436839, -1.552034, 0.5058824, 1, 0, 1,
-0.6499994, 1.185042, 0.3914995, 0.5019608, 1, 0, 1,
-0.6479028, 0.5616339, -0.5178581, 0.4941176, 1, 0, 1,
-0.643518, -0.09651998, -3.169937, 0.4862745, 1, 0, 1,
-0.6386113, -0.5412388, -1.441896, 0.4823529, 1, 0, 1,
-0.6233923, -0.5256289, -2.435943, 0.4745098, 1, 0, 1,
-0.618334, -1.605826, -2.941645, 0.4705882, 1, 0, 1,
-0.6183103, -1.544279, 0.04451476, 0.4627451, 1, 0, 1,
-0.6135841, 0.7192251, -0.6527916, 0.4588235, 1, 0, 1,
-0.6134194, 0.1415289, -1.006958, 0.4509804, 1, 0, 1,
-0.6105908, -0.6184825, -2.356464, 0.4470588, 1, 0, 1,
-0.6088488, -0.7982292, -2.260434, 0.4392157, 1, 0, 1,
-0.6054293, -0.2986311, -3.333411, 0.4352941, 1, 0, 1,
-0.6049981, -0.844146, -2.45551, 0.427451, 1, 0, 1,
-0.6008374, -0.776305, -1.744635, 0.4235294, 1, 0, 1,
-0.5990098, -2.413378, -3.264315, 0.4156863, 1, 0, 1,
-0.5968821, -0.7463533, -2.95355, 0.4117647, 1, 0, 1,
-0.5916442, 0.7157168, -0.3305354, 0.4039216, 1, 0, 1,
-0.5859382, -0.05391759, -1.05883, 0.3960784, 1, 0, 1,
-0.5854447, -0.609593, -4.243099, 0.3921569, 1, 0, 1,
-0.5838993, -0.7934489, -2.554011, 0.3843137, 1, 0, 1,
-0.5818272, 0.502864, -0.6638588, 0.3803922, 1, 0, 1,
-0.5798477, -2.425706, -2.906338, 0.372549, 1, 0, 1,
-0.5687013, 0.2926374, 1.846941, 0.3686275, 1, 0, 1,
-0.5670487, 0.5572972, 0.02832457, 0.3607843, 1, 0, 1,
-0.5650434, 0.1323272, -2.27193, 0.3568628, 1, 0, 1,
-0.5619685, 2.213137, -0.3337618, 0.3490196, 1, 0, 1,
-0.5588397, -0.1769456, -1.007736, 0.345098, 1, 0, 1,
-0.5518259, -0.86019, -2.865448, 0.3372549, 1, 0, 1,
-0.5516649, -0.2291884, -1.587189, 0.3333333, 1, 0, 1,
-0.5516547, -1.03614, -3.610624, 0.3254902, 1, 0, 1,
-0.5516479, 0.851963, -2.145855, 0.3215686, 1, 0, 1,
-0.5504085, -1.030769, -1.654821, 0.3137255, 1, 0, 1,
-0.5492971, 1.732599, 1.813917, 0.3098039, 1, 0, 1,
-0.5483088, 1.076898, 0.3668295, 0.3019608, 1, 0, 1,
-0.5457115, 0.968677, -1.717875, 0.2941177, 1, 0, 1,
-0.5423592, 0.05109738, -0.5273509, 0.2901961, 1, 0, 1,
-0.5378395, -0.3611155, -3.140134, 0.282353, 1, 0, 1,
-0.5346161, 0.09288859, -1.46461, 0.2784314, 1, 0, 1,
-0.5333626, -0.09377099, -2.489985, 0.2705882, 1, 0, 1,
-0.5313461, 1.60063, 0.7628106, 0.2666667, 1, 0, 1,
-0.5306848, -0.2233602, -3.524642, 0.2588235, 1, 0, 1,
-0.5270412, 0.4627456, -0.100359, 0.254902, 1, 0, 1,
-0.5251661, 0.2820022, -1.265725, 0.2470588, 1, 0, 1,
-0.5203671, 0.2214845, 0.07128965, 0.2431373, 1, 0, 1,
-0.520067, 0.3041736, 0.9447383, 0.2352941, 1, 0, 1,
-0.5182801, 0.6333701, -2.826643, 0.2313726, 1, 0, 1,
-0.5118837, 1.331065, 0.4980606, 0.2235294, 1, 0, 1,
-0.5086838, 1.571474, 0.1111601, 0.2196078, 1, 0, 1,
-0.5074635, -0.863142, -3.412414, 0.2117647, 1, 0, 1,
-0.5067945, 0.2502971, -0.04549883, 0.2078431, 1, 0, 1,
-0.5067935, 0.8434772, -0.7409299, 0.2, 1, 0, 1,
-0.5001414, -0.8156433, -2.728069, 0.1921569, 1, 0, 1,
-0.498348, 0.8032908, 0.5658211, 0.1882353, 1, 0, 1,
-0.4981918, 0.1956926, -2.28869, 0.1803922, 1, 0, 1,
-0.4972492, -1.578672, -2.905775, 0.1764706, 1, 0, 1,
-0.4939756, -1.645225, -2.789072, 0.1686275, 1, 0, 1,
-0.4910947, -0.1661387, -1.318261, 0.1647059, 1, 0, 1,
-0.4850447, 0.6013718, 0.7826148, 0.1568628, 1, 0, 1,
-0.4821531, -0.02828326, -1.7099, 0.1529412, 1, 0, 1,
-0.4813072, 1.584585, -0.5296121, 0.145098, 1, 0, 1,
-0.480644, 0.8125104, -1.269391, 0.1411765, 1, 0, 1,
-0.4797215, -0.6940815, -2.546, 0.1333333, 1, 0, 1,
-0.4760235, -0.3981476, -1.294474, 0.1294118, 1, 0, 1,
-0.4710671, -0.8037251, -2.569979, 0.1215686, 1, 0, 1,
-0.47032, -0.1706254, 0.09119206, 0.1176471, 1, 0, 1,
-0.464441, -0.3622085, -0.9825695, 0.1098039, 1, 0, 1,
-0.462661, 1.27452, -1.321014, 0.1058824, 1, 0, 1,
-0.4622166, -0.6904243, -3.571669, 0.09803922, 1, 0, 1,
-0.4524855, 0.6671592, -0.2120847, 0.09019608, 1, 0, 1,
-0.4490379, -0.6150649, -2.84122, 0.08627451, 1, 0, 1,
-0.4483048, 0.6161344, -1.390697, 0.07843138, 1, 0, 1,
-0.4462323, 2.082842, -2.266901, 0.07450981, 1, 0, 1,
-0.445825, 0.6107503, -0.413476, 0.06666667, 1, 0, 1,
-0.4367071, -0.6247957, -2.795822, 0.0627451, 1, 0, 1,
-0.4348763, 1.704995, -0.2076327, 0.05490196, 1, 0, 1,
-0.4310358, 0.6528227, 0.5607729, 0.05098039, 1, 0, 1,
-0.4289183, -0.5981652, -0.9064226, 0.04313726, 1, 0, 1,
-0.4210767, -0.6196661, -0.3792311, 0.03921569, 1, 0, 1,
-0.4144228, -0.5147597, -3.223834, 0.03137255, 1, 0, 1,
-0.4108686, 1.347625, -0.8901787, 0.02745098, 1, 0, 1,
-0.4099179, -0.7159511, -3.583036, 0.01960784, 1, 0, 1,
-0.4083009, -1.151455, -3.563893, 0.01568628, 1, 0, 1,
-0.4065315, 1.235596, -1.575548, 0.007843138, 1, 0, 1,
-0.4037389, -0.1232031, -2.476975, 0.003921569, 1, 0, 1,
-0.3995053, -1.763707, -3.644224, 0, 1, 0.003921569, 1,
-0.3979205, 0.3605461, -0.5491721, 0, 1, 0.01176471, 1,
-0.3952642, 0.2410966, -0.2736058, 0, 1, 0.01568628, 1,
-0.3903374, 0.2767231, -2.018642, 0, 1, 0.02352941, 1,
-0.3899218, 0.8214443, 0.8429176, 0, 1, 0.02745098, 1,
-0.3895874, -1.183102, -2.448953, 0, 1, 0.03529412, 1,
-0.3893555, -0.5621669, -2.585545, 0, 1, 0.03921569, 1,
-0.3851842, -1.029195, -0.913256, 0, 1, 0.04705882, 1,
-0.3836273, -1.399539, -3.390246, 0, 1, 0.05098039, 1,
-0.3827821, 0.1981293, -1.594712, 0, 1, 0.05882353, 1,
-0.382606, 0.4034659, -0.5568286, 0, 1, 0.0627451, 1,
-0.3777524, 0.3426653, 1.169389, 0, 1, 0.07058824, 1,
-0.3773753, -0.9424835, -2.627072, 0, 1, 0.07450981, 1,
-0.3772133, 0.5709202, -0.597441, 0, 1, 0.08235294, 1,
-0.376854, 0.8096558, -0.4230627, 0, 1, 0.08627451, 1,
-0.37368, 0.7921317, 0.07343948, 0, 1, 0.09411765, 1,
-0.3728522, -0.1533579, -2.792157, 0, 1, 0.1019608, 1,
-0.368443, -0.6612428, -2.434907, 0, 1, 0.1058824, 1,
-0.3683203, -0.2236098, -1.835977, 0, 1, 0.1137255, 1,
-0.3680632, 1.463891, 1.930124, 0, 1, 0.1176471, 1,
-0.3634772, -1.243258, -2.980059, 0, 1, 0.1254902, 1,
-0.3622073, -1.340645, -3.089589, 0, 1, 0.1294118, 1,
-0.3601565, -1.116955, -4.249537, 0, 1, 0.1372549, 1,
-0.3516869, 0.4714954, 0.3365253, 0, 1, 0.1411765, 1,
-0.3488824, 0.6489516, -0.1853373, 0, 1, 0.1490196, 1,
-0.3447638, 0.1649082, -0.1305457, 0, 1, 0.1529412, 1,
-0.3411265, -1.647007, -3.316978, 0, 1, 0.1607843, 1,
-0.3345174, -0.6425741, -2.742569, 0, 1, 0.1647059, 1,
-0.3322432, -0.2648428, -3.687516, 0, 1, 0.172549, 1,
-0.3272762, -1.469818, -2.284909, 0, 1, 0.1764706, 1,
-0.3255195, 0.1875685, -1.698777, 0, 1, 0.1843137, 1,
-0.3250444, 0.6066117, 0.03432138, 0, 1, 0.1882353, 1,
-0.3240359, -0.5977672, -4.026167, 0, 1, 0.1960784, 1,
-0.3215512, -0.3616946, -0.9316583, 0, 1, 0.2039216, 1,
-0.3210442, 2.163151, -2.40177, 0, 1, 0.2078431, 1,
-0.3159091, 0.05693838, -0.5433943, 0, 1, 0.2156863, 1,
-0.3157165, 1.998997, -0.007793513, 0, 1, 0.2196078, 1,
-0.3153418, -0.794843, -3.522748, 0, 1, 0.227451, 1,
-0.3138214, -2.021841, -1.827192, 0, 1, 0.2313726, 1,
-0.3135921, -1.611576, -3.486041, 0, 1, 0.2392157, 1,
-0.3079816, -0.05805397, -2.952837, 0, 1, 0.2431373, 1,
-0.3063587, 1.722707, -0.0408113, 0, 1, 0.2509804, 1,
-0.3000019, 0.2925102, 1.701594, 0, 1, 0.254902, 1,
-0.2913952, 1.122185, -0.8007634, 0, 1, 0.2627451, 1,
-0.2889178, 0.08140872, -0.1362164, 0, 1, 0.2666667, 1,
-0.2787435, 1.223759, -0.370623, 0, 1, 0.2745098, 1,
-0.2786387, -1.09786, -4.443697, 0, 1, 0.2784314, 1,
-0.2769617, 1.031273, 1.534023, 0, 1, 0.2862745, 1,
-0.2738571, 0.6514543, -1.801594, 0, 1, 0.2901961, 1,
-0.2718332, -2.509251, -2.646105, 0, 1, 0.2980392, 1,
-0.2684176, -0.5668157, -1.843431, 0, 1, 0.3058824, 1,
-0.2640271, -0.478604, -1.174445, 0, 1, 0.3098039, 1,
-0.2634613, -0.56389, -2.232193, 0, 1, 0.3176471, 1,
-0.2619718, -0.8026063, -0.9056613, 0, 1, 0.3215686, 1,
-0.2581868, -0.04980766, -2.415985, 0, 1, 0.3294118, 1,
-0.2578072, 0.6503804, 0.4146465, 0, 1, 0.3333333, 1,
-0.25668, 0.09780766, -0.8429975, 0, 1, 0.3411765, 1,
-0.2519765, 0.783721, 0.1591763, 0, 1, 0.345098, 1,
-0.251845, 1.318933, -0.6054114, 0, 1, 0.3529412, 1,
-0.2498565, -0.173635, -1.227523, 0, 1, 0.3568628, 1,
-0.2463354, -1.9598, -2.769079, 0, 1, 0.3647059, 1,
-0.2444308, -0.01078144, -1.506383, 0, 1, 0.3686275, 1,
-0.2366755, -0.2101236, -1.191323, 0, 1, 0.3764706, 1,
-0.2333553, 1.42545, -0.6631516, 0, 1, 0.3803922, 1,
-0.2305287, -1.586851, -2.468941, 0, 1, 0.3882353, 1,
-0.2293673, 0.5461906, 0.6365424, 0, 1, 0.3921569, 1,
-0.2249989, -0.5354527, -2.308311, 0, 1, 0.4, 1,
-0.2246365, 1.563385, -1.014561, 0, 1, 0.4078431, 1,
-0.224297, 1.361735, 1.570067, 0, 1, 0.4117647, 1,
-0.2141351, 0.1644272, -1.008431, 0, 1, 0.4196078, 1,
-0.2126437, -2.108322, -3.509181, 0, 1, 0.4235294, 1,
-0.2110333, -0.4998348, -3.040586, 0, 1, 0.4313726, 1,
-0.2093245, -0.06936771, -2.200618, 0, 1, 0.4352941, 1,
-0.2092207, 1.424703, 0.08061215, 0, 1, 0.4431373, 1,
-0.2082964, -0.4717013, -3.690685, 0, 1, 0.4470588, 1,
-0.2061536, -0.2751559, -1.912763, 0, 1, 0.454902, 1,
-0.2000745, 1.546158, 0.07135073, 0, 1, 0.4588235, 1,
-0.1980746, -0.525224, -3.455254, 0, 1, 0.4666667, 1,
-0.1970561, 1.667374, -1.588649, 0, 1, 0.4705882, 1,
-0.1964284, 1.981363, -0.6361058, 0, 1, 0.4784314, 1,
-0.1935458, 1.808989, 1.198128, 0, 1, 0.4823529, 1,
-0.1929093, 0.1182155, 1.134962, 0, 1, 0.4901961, 1,
-0.1908097, 1.576699, 0.781745, 0, 1, 0.4941176, 1,
-0.1845033, 1.375951, 0.2508444, 0, 1, 0.5019608, 1,
-0.1816824, -0.4529586, -3.567918, 0, 1, 0.509804, 1,
-0.1786363, -0.7072564, -3.604873, 0, 1, 0.5137255, 1,
-0.1756794, 1.994711, 0.2866709, 0, 1, 0.5215687, 1,
-0.1749136, 0.3012016, 0.6954179, 0, 1, 0.5254902, 1,
-0.1742589, -1.9965, -1.688485, 0, 1, 0.5333334, 1,
-0.1738691, -0.5599576, -2.448191, 0, 1, 0.5372549, 1,
-0.1726174, -0.3613977, -3.482751, 0, 1, 0.5450981, 1,
-0.1679231, 0.2113341, -0.2314984, 0, 1, 0.5490196, 1,
-0.1666796, -1.147716, -1.886438, 0, 1, 0.5568628, 1,
-0.163845, -0.9671242, -2.071797, 0, 1, 0.5607843, 1,
-0.1621248, 0.8498911, -1.165451, 0, 1, 0.5686275, 1,
-0.15208, 0.5126087, -1.282859, 0, 1, 0.572549, 1,
-0.1434315, -0.2368257, -1.706157, 0, 1, 0.5803922, 1,
-0.1409575, -0.159365, -1.724819, 0, 1, 0.5843138, 1,
-0.1391415, -1.102315, -3.254391, 0, 1, 0.5921569, 1,
-0.1353552, 0.3108629, 0.1661951, 0, 1, 0.5960785, 1,
-0.1352271, 0.1328833, -0.4681651, 0, 1, 0.6039216, 1,
-0.1326146, 0.3123679, -1.905097, 0, 1, 0.6117647, 1,
-0.1285161, -1.020654, -2.81812, 0, 1, 0.6156863, 1,
-0.1266396, -0.2109579, -0.8417387, 0, 1, 0.6235294, 1,
-0.1233227, -1.008666, -2.133957, 0, 1, 0.627451, 1,
-0.1228084, -1.909275, -3.365312, 0, 1, 0.6352941, 1,
-0.1205674, 0.5216424, -1.448677, 0, 1, 0.6392157, 1,
-0.1198397, -0.3096703, -2.454971, 0, 1, 0.6470588, 1,
-0.117851, -0.7620301, -4.097131, 0, 1, 0.6509804, 1,
-0.1166793, -0.8394918, -4.637485, 0, 1, 0.6588235, 1,
-0.1154586, 1.296618, -2.011442, 0, 1, 0.6627451, 1,
-0.1111486, 1.511135, -1.500688, 0, 1, 0.6705883, 1,
-0.1093903, 2.457597, 0.1389107, 0, 1, 0.6745098, 1,
-0.1082379, 0.8580579, 0.6035922, 0, 1, 0.682353, 1,
-0.1051102, -1.002433, -2.679002, 0, 1, 0.6862745, 1,
-0.1040856, 0.285752, -0.6500311, 0, 1, 0.6941177, 1,
-0.1014665, -0.005735436, -3.430648, 0, 1, 0.7019608, 1,
-0.09865562, -0.7404945, -3.343968, 0, 1, 0.7058824, 1,
-0.09670223, -0.894087, -2.014777, 0, 1, 0.7137255, 1,
-0.09358249, 0.3789257, -0.4150038, 0, 1, 0.7176471, 1,
-0.09268676, -0.9791133, -3.980753, 0, 1, 0.7254902, 1,
-0.08887284, -2.398957, -3.907449, 0, 1, 0.7294118, 1,
-0.08354678, 0.4190027, -1.774539, 0, 1, 0.7372549, 1,
-0.08343853, -0.8373353, -3.973719, 0, 1, 0.7411765, 1,
-0.08180358, -1.041127, -1.948692, 0, 1, 0.7490196, 1,
-0.07941107, -0.3014224, -1.936704, 0, 1, 0.7529412, 1,
-0.07390819, -0.9197389, -3.779837, 0, 1, 0.7607843, 1,
-0.07100088, -0.2930938, -2.599981, 0, 1, 0.7647059, 1,
-0.0702571, 1.55311, 0.8516154, 0, 1, 0.772549, 1,
-0.06516598, -1.10211, -2.064938, 0, 1, 0.7764706, 1,
-0.06210616, 0.01681579, -0.2482911, 0, 1, 0.7843137, 1,
-0.06209029, 0.01564898, -0.4084377, 0, 1, 0.7882353, 1,
-0.06119909, -0.5213787, -3.814222, 0, 1, 0.7960784, 1,
-0.06003545, 0.7634091, -1.438952, 0, 1, 0.8039216, 1,
-0.05648069, -0.5276154, -1.785238, 0, 1, 0.8078431, 1,
-0.05553358, -0.3157002, -2.05536, 0, 1, 0.8156863, 1,
-0.05480777, 0.1431918, -0.2194923, 0, 1, 0.8196079, 1,
-0.05468746, -0.9047518, -2.698217, 0, 1, 0.827451, 1,
-0.05397438, 0.6711113, -1.424668, 0, 1, 0.8313726, 1,
-0.05218456, -0.8309798, -3.456981, 0, 1, 0.8392157, 1,
-0.04928547, -2.315289, -3.547804, 0, 1, 0.8431373, 1,
-0.03569616, -0.0206844, -1.019724, 0, 1, 0.8509804, 1,
-0.03329168, 2.423442, -0.9949577, 0, 1, 0.854902, 1,
-0.03069167, 0.2109743, -0.1194116, 0, 1, 0.8627451, 1,
-0.02831124, -0.8098132, -3.96392, 0, 1, 0.8666667, 1,
-0.02750167, -0.08979175, -2.807389, 0, 1, 0.8745098, 1,
-0.02384334, 0.3165313, 0.8697994, 0, 1, 0.8784314, 1,
-0.02253094, -0.2389928, -2.82476, 0, 1, 0.8862745, 1,
-0.02147987, 2.100293, -0.7402087, 0, 1, 0.8901961, 1,
-0.01918972, 0.093026, -0.6932781, 0, 1, 0.8980392, 1,
-0.01500731, 1.824869, -1.249732, 0, 1, 0.9058824, 1,
-0.002394139, -0.4346555, -4.988748, 0, 1, 0.9098039, 1,
-0.002257743, -1.910378, -3.462056, 0, 1, 0.9176471, 1,
-0.002027943, -0.0379767, -1.693499, 0, 1, 0.9215686, 1,
0.0007579016, 0.9001394, -1.407086, 0, 1, 0.9294118, 1,
0.002145978, -1.689387, 3.142287, 0, 1, 0.9333333, 1,
0.01704706, -1.336796, 3.902652, 0, 1, 0.9411765, 1,
0.01896797, -0.2686077, 2.970271, 0, 1, 0.945098, 1,
0.0192598, 0.01074254, 2.987015, 0, 1, 0.9529412, 1,
0.02020627, 0.4360944, -0.2378423, 0, 1, 0.9568627, 1,
0.02522472, 2.279178, 0.6487414, 0, 1, 0.9647059, 1,
0.02630012, 1.634909, 0.2456642, 0, 1, 0.9686275, 1,
0.02931612, -0.9313911, 3.266661, 0, 1, 0.9764706, 1,
0.03310688, -1.554518, 3.482984, 0, 1, 0.9803922, 1,
0.03331918, -1.018954, 2.646218, 0, 1, 0.9882353, 1,
0.03340433, -2.002879, 1.905076, 0, 1, 0.9921569, 1,
0.040937, -0.6303248, 4.37149, 0, 1, 1, 1,
0.04157631, -0.3820164, 4.344412, 0, 0.9921569, 1, 1,
0.04530285, -0.4517004, 3.47766, 0, 0.9882353, 1, 1,
0.04628847, 0.2068977, 1.611881, 0, 0.9803922, 1, 1,
0.05087269, 0.3261327, -0.7588536, 0, 0.9764706, 1, 1,
0.05105907, -0.4306914, 2.502843, 0, 0.9686275, 1, 1,
0.05418148, -0.3048002, 3.928951, 0, 0.9647059, 1, 1,
0.05486729, -0.6332799, 3.347968, 0, 0.9568627, 1, 1,
0.05611536, -0.0749688, 1.80314, 0, 0.9529412, 1, 1,
0.06525248, 0.01287698, 1.956756, 0, 0.945098, 1, 1,
0.06571084, 0.9818191, -1.143488, 0, 0.9411765, 1, 1,
0.0723946, -0.8063736, 0.5737707, 0, 0.9333333, 1, 1,
0.07431146, 0.2057202, -0.09864335, 0, 0.9294118, 1, 1,
0.07712558, 0.2064074, -0.9361209, 0, 0.9215686, 1, 1,
0.07925493, 0.709591, 0.5622687, 0, 0.9176471, 1, 1,
0.08027019, -1.931479, 2.352788, 0, 0.9098039, 1, 1,
0.08550343, 0.4377407, -0.3770277, 0, 0.9058824, 1, 1,
0.0855568, 0.3838704, 2.249379, 0, 0.8980392, 1, 1,
0.08591469, -1.404982, 2.634362, 0, 0.8901961, 1, 1,
0.086742, 0.5301034, 0.01916369, 0, 0.8862745, 1, 1,
0.09458409, 0.5354167, 0.2951855, 0, 0.8784314, 1, 1,
0.09460936, -0.6557353, 1.362852, 0, 0.8745098, 1, 1,
0.09600206, -1.283736, 3.658699, 0, 0.8666667, 1, 1,
0.0976002, -0.4935028, 3.282593, 0, 0.8627451, 1, 1,
0.1022333, -1.565942, 1.792694, 0, 0.854902, 1, 1,
0.1064845, 0.1481026, -0.6225059, 0, 0.8509804, 1, 1,
0.1068104, 0.5589653, -0.2018464, 0, 0.8431373, 1, 1,
0.1068662, -0.2585941, 4.452226, 0, 0.8392157, 1, 1,
0.1072784, 0.6572074, 1.144758, 0, 0.8313726, 1, 1,
0.1125273, 1.168011, -0.6167181, 0, 0.827451, 1, 1,
0.1139008, -0.784974, 2.683441, 0, 0.8196079, 1, 1,
0.1152483, 1.069593, 0.6722239, 0, 0.8156863, 1, 1,
0.1160784, 0.3258729, -0.3744046, 0, 0.8078431, 1, 1,
0.1181891, 0.2498303, -0.6476551, 0, 0.8039216, 1, 1,
0.1228256, 0.7610742, 2.839105, 0, 0.7960784, 1, 1,
0.1274519, 1.600415, 0.3465612, 0, 0.7882353, 1, 1,
0.1275053, 0.3008784, 0.6826474, 0, 0.7843137, 1, 1,
0.1295036, 0.06668334, 2.019632, 0, 0.7764706, 1, 1,
0.1296861, 0.04191619, 1.627878, 0, 0.772549, 1, 1,
0.1395554, -1.370221, 3.904224, 0, 0.7647059, 1, 1,
0.1406695, 1.613416, 0.4804466, 0, 0.7607843, 1, 1,
0.1441433, 0.7799746, -1.925586, 0, 0.7529412, 1, 1,
0.1461601, -0.289255, 3.79927, 0, 0.7490196, 1, 1,
0.1494179, -0.9276313, 3.167545, 0, 0.7411765, 1, 1,
0.1494508, 1.407328, 0.9721629, 0, 0.7372549, 1, 1,
0.1515454, 1.924209, 1.287552, 0, 0.7294118, 1, 1,
0.1533744, -1.472716, 5.093474, 0, 0.7254902, 1, 1,
0.1534053, -1.378868, 1.445853, 0, 0.7176471, 1, 1,
0.1566768, -2.11376, 4.463659, 0, 0.7137255, 1, 1,
0.1582952, 1.582751, -0.5348956, 0, 0.7058824, 1, 1,
0.1596588, -0.6416152, 3.722546, 0, 0.6980392, 1, 1,
0.1617318, -1.328708, 3.396128, 0, 0.6941177, 1, 1,
0.1619105, 0.05196441, 1.145622, 0, 0.6862745, 1, 1,
0.1662191, 0.9175007, -1.677795, 0, 0.682353, 1, 1,
0.1670352, 0.08268444, -0.6266392, 0, 0.6745098, 1, 1,
0.1670396, -0.003205676, 2.175199, 0, 0.6705883, 1, 1,
0.1685728, -1.851438, 2.560182, 0, 0.6627451, 1, 1,
0.1693639, 1.311031, 0.3373733, 0, 0.6588235, 1, 1,
0.1699864, -1.156813, 2.386806, 0, 0.6509804, 1, 1,
0.1704479, -1.065226, 2.169899, 0, 0.6470588, 1, 1,
0.1707158, -0.581813, 3.322986, 0, 0.6392157, 1, 1,
0.1742643, 1.511876, 0.1645467, 0, 0.6352941, 1, 1,
0.1798008, 1.512106, 0.724843, 0, 0.627451, 1, 1,
0.1804736, -1.322286, 2.870984, 0, 0.6235294, 1, 1,
0.1806185, -0.8307524, 2.857108, 0, 0.6156863, 1, 1,
0.1806898, -0.1392434, 1.06822, 0, 0.6117647, 1, 1,
0.1825904, 1.305525, 0.5714912, 0, 0.6039216, 1, 1,
0.1886099, 1.99042, -1.617895, 0, 0.5960785, 1, 1,
0.1892651, -0.4774116, 0.7179828, 0, 0.5921569, 1, 1,
0.1900279, 0.1084168, 0.2238556, 0, 0.5843138, 1, 1,
0.2007761, 1.286167, -1.976754, 0, 0.5803922, 1, 1,
0.2018643, 0.3254927, 1.46724, 0, 0.572549, 1, 1,
0.2021936, -0.9996747, 2.260271, 0, 0.5686275, 1, 1,
0.2055609, -0.2208008, 3.539085, 0, 0.5607843, 1, 1,
0.2080357, -0.5279748, 2.56758, 0, 0.5568628, 1, 1,
0.2090575, 1.225222, 0.4526334, 0, 0.5490196, 1, 1,
0.2127023, -0.3361117, 3.38828, 0, 0.5450981, 1, 1,
0.2127298, 0.4144083, 0.6073236, 0, 0.5372549, 1, 1,
0.2186418, 0.9766659, 1.776266, 0, 0.5333334, 1, 1,
0.2199084, -0.6366956, 2.815598, 0, 0.5254902, 1, 1,
0.2228657, 0.4137977, 0.2991494, 0, 0.5215687, 1, 1,
0.2253383, -2.404352, 2.403123, 0, 0.5137255, 1, 1,
0.2307821, 0.8470524, 1.366591, 0, 0.509804, 1, 1,
0.2321741, 0.9090803, 0.1002387, 0, 0.5019608, 1, 1,
0.2325965, -2.214726, 3.524153, 0, 0.4941176, 1, 1,
0.2334635, -0.1081164, 1.890849, 0, 0.4901961, 1, 1,
0.2348866, 0.5036653, 0.1102352, 0, 0.4823529, 1, 1,
0.2427632, 0.454839, -0.2552115, 0, 0.4784314, 1, 1,
0.2443984, 0.7897219, -0.711791, 0, 0.4705882, 1, 1,
0.2463386, 0.2197333, 1.238386, 0, 0.4666667, 1, 1,
0.2486443, 1.688396, 0.1218781, 0, 0.4588235, 1, 1,
0.2489134, -0.703004, 1.646334, 0, 0.454902, 1, 1,
0.250245, -0.4792811, 2.712249, 0, 0.4470588, 1, 1,
0.2554354, 0.009652643, 1.296796, 0, 0.4431373, 1, 1,
0.2560883, 0.5462909, -0.778581, 0, 0.4352941, 1, 1,
0.2593262, 1.755563, 0.4727082, 0, 0.4313726, 1, 1,
0.2593529, 0.4261369, 2.531534, 0, 0.4235294, 1, 1,
0.2602184, 0.6931653, 0.8478748, 0, 0.4196078, 1, 1,
0.2613208, 1.367081, -0.2334887, 0, 0.4117647, 1, 1,
0.2673128, 0.6046535, 0.787508, 0, 0.4078431, 1, 1,
0.2690188, -1.114732, 3.431419, 0, 0.4, 1, 1,
0.2727382, -0.4874878, 2.317637, 0, 0.3921569, 1, 1,
0.2792344, -0.2050771, 3.086444, 0, 0.3882353, 1, 1,
0.2800495, 2.034507, 0.315336, 0, 0.3803922, 1, 1,
0.2801761, 0.3268824, 1.050933, 0, 0.3764706, 1, 1,
0.280329, 0.4335551, 0.7526854, 0, 0.3686275, 1, 1,
0.2831527, 1.661439, 0.7290148, 0, 0.3647059, 1, 1,
0.2852916, 1.837374, 1.822158, 0, 0.3568628, 1, 1,
0.2880682, -2.2389, 2.758685, 0, 0.3529412, 1, 1,
0.2996202, 0.8012336, 1.70533, 0, 0.345098, 1, 1,
0.3003648, -0.8379455, 3.487685, 0, 0.3411765, 1, 1,
0.3094738, -0.1588572, 0.3773321, 0, 0.3333333, 1, 1,
0.3178221, 0.06686544, 0.5581074, 0, 0.3294118, 1, 1,
0.3186098, -0.5368532, 3.444341, 0, 0.3215686, 1, 1,
0.329124, -0.8947256, 2.099803, 0, 0.3176471, 1, 1,
0.3295373, 2.191799, -0.6702417, 0, 0.3098039, 1, 1,
0.333049, -0.5653551, 4.874476, 0, 0.3058824, 1, 1,
0.3449983, 0.009429731, 2.392463, 0, 0.2980392, 1, 1,
0.346497, -0.7034636, 3.536368, 0, 0.2901961, 1, 1,
0.3496206, 0.4686617, 0.5164722, 0, 0.2862745, 1, 1,
0.3558792, -0.4925624, 2.121878, 0, 0.2784314, 1, 1,
0.3702845, -0.3476889, 2.487248, 0, 0.2745098, 1, 1,
0.3707528, 2.693502, -0.002384543, 0, 0.2666667, 1, 1,
0.372049, -0.02970237, 1.899165, 0, 0.2627451, 1, 1,
0.3734901, -0.470934, 2.239085, 0, 0.254902, 1, 1,
0.3739598, -1.23432, 2.819509, 0, 0.2509804, 1, 1,
0.376944, 1.950623, 0.3952533, 0, 0.2431373, 1, 1,
0.3804428, -1.164069, 2.575913, 0, 0.2392157, 1, 1,
0.3815235, 0.4983885, -0.1849134, 0, 0.2313726, 1, 1,
0.3859832, 0.09422794, 1.740183, 0, 0.227451, 1, 1,
0.3909774, 0.4827031, 0.6873891, 0, 0.2196078, 1, 1,
0.3915887, -0.4734687, 4.05554, 0, 0.2156863, 1, 1,
0.3950705, -0.6761237, 3.980751, 0, 0.2078431, 1, 1,
0.3953266, -0.2474712, 1.98626, 0, 0.2039216, 1, 1,
0.397487, 1.782225, 0.2812734, 0, 0.1960784, 1, 1,
0.3988664, -1.165359, 2.334523, 0, 0.1882353, 1, 1,
0.4006547, -0.5862828, 3.188412, 0, 0.1843137, 1, 1,
0.4014018, -0.2321579, -0.1120149, 0, 0.1764706, 1, 1,
0.4023851, 1.715059, 0.5015566, 0, 0.172549, 1, 1,
0.4025846, -0.1126509, 1.340377, 0, 0.1647059, 1, 1,
0.4092474, 0.2804029, 0.5946701, 0, 0.1607843, 1, 1,
0.4124071, -0.6201969, 3.535916, 0, 0.1529412, 1, 1,
0.4141336, -0.01721539, 1.283559, 0, 0.1490196, 1, 1,
0.4224837, -0.9687696, 2.320737, 0, 0.1411765, 1, 1,
0.4225733, -0.6245974, 2.783075, 0, 0.1372549, 1, 1,
0.4254817, -2.166164, 3.56664, 0, 0.1294118, 1, 1,
0.4259083, 0.9558105, -0.02854716, 0, 0.1254902, 1, 1,
0.4302529, -0.6296155, -0.4329848, 0, 0.1176471, 1, 1,
0.4313359, -1.240099, 3.281093, 0, 0.1137255, 1, 1,
0.4348725, 0.2137483, 1.208547, 0, 0.1058824, 1, 1,
0.4383109, 0.6165842, 1.12362, 0, 0.09803922, 1, 1,
0.4427975, -0.2702241, -0.04457134, 0, 0.09411765, 1, 1,
0.4433536, 1.711126, 0.4587641, 0, 0.08627451, 1, 1,
0.4443058, -0.9747407, 4.168429, 0, 0.08235294, 1, 1,
0.4468741, 0.0330634, 0.2147848, 0, 0.07450981, 1, 1,
0.4481919, 0.1623321, 2.291321, 0, 0.07058824, 1, 1,
0.4591407, 1.57083, 0.1446122, 0, 0.0627451, 1, 1,
0.4602185, -0.680779, 1.772498, 0, 0.05882353, 1, 1,
0.4608368, 0.05586864, 1.847821, 0, 0.05098039, 1, 1,
0.462923, 0.6259021, 0.5883045, 0, 0.04705882, 1, 1,
0.4634085, 1.71143, -1.688211, 0, 0.03921569, 1, 1,
0.4671124, 0.04879122, 2.860377, 0, 0.03529412, 1, 1,
0.4712101, -1.88255, 2.711227, 0, 0.02745098, 1, 1,
0.4759504, -0.4835681, 3.703913, 0, 0.02352941, 1, 1,
0.4812036, 1.695073, 0.1595596, 0, 0.01568628, 1, 1,
0.4825031, 2.095574, -0.2649484, 0, 0.01176471, 1, 1,
0.4861949, -0.4853489, 1.526351, 0, 0.003921569, 1, 1,
0.4905851, -0.2808391, 2.788825, 0.003921569, 0, 1, 1,
0.4943825, -0.990401, 3.039998, 0.007843138, 0, 1, 1,
0.496634, 0.2044136, 1.006197, 0.01568628, 0, 1, 1,
0.4967296, 1.761939, 0.3394893, 0.01960784, 0, 1, 1,
0.4967811, -2.69289, 3.688454, 0.02745098, 0, 1, 1,
0.50008, 0.8855971, 1.688206, 0.03137255, 0, 1, 1,
0.5002202, 0.7790349, 0.7739072, 0.03921569, 0, 1, 1,
0.5035549, -0.5197861, 1.087433, 0.04313726, 0, 1, 1,
0.5036553, 0.3451167, 3.473952, 0.05098039, 0, 1, 1,
0.5153751, -0.03862365, 2.52855, 0.05490196, 0, 1, 1,
0.5165418, 0.8744144, 0.07532574, 0.0627451, 0, 1, 1,
0.5215055, 0.1181688, 1.101364, 0.06666667, 0, 1, 1,
0.5220862, 0.4167415, 1.614766, 0.07450981, 0, 1, 1,
0.5222195, 0.6759818, -1.082723, 0.07843138, 0, 1, 1,
0.5223237, 0.07703734, 0.6107773, 0.08627451, 0, 1, 1,
0.5310102, -1.835819, 3.195462, 0.09019608, 0, 1, 1,
0.5311635, -0.7549059, 2.349188, 0.09803922, 0, 1, 1,
0.5344831, -0.06586559, 3.660563, 0.1058824, 0, 1, 1,
0.5346779, 0.4583893, 1.061254, 0.1098039, 0, 1, 1,
0.5368844, 0.4947059, -0.8391001, 0.1176471, 0, 1, 1,
0.5476455, 0.2081759, 0.7057858, 0.1215686, 0, 1, 1,
0.5480915, -0.2053973, 0.8485813, 0.1294118, 0, 1, 1,
0.5563585, -1.166517, 2.027282, 0.1333333, 0, 1, 1,
0.5567639, 1.739039, -0.06804908, 0.1411765, 0, 1, 1,
0.5598766, -0.3204316, 2.996825, 0.145098, 0, 1, 1,
0.5682307, 1.147764, 0.9332963, 0.1529412, 0, 1, 1,
0.5684463, 0.1592757, -0.002482535, 0.1568628, 0, 1, 1,
0.5704461, 1.232887, 1.317294, 0.1647059, 0, 1, 1,
0.5746365, -0.4031335, 1.776902, 0.1686275, 0, 1, 1,
0.5748425, 0.413556, 1.871007, 0.1764706, 0, 1, 1,
0.5750185, -2.755083, 2.494804, 0.1803922, 0, 1, 1,
0.5758847, -0.8195946, 2.630272, 0.1882353, 0, 1, 1,
0.579636, -1.114903, 3.906132, 0.1921569, 0, 1, 1,
0.5862245, 1.262436, -0.3699853, 0.2, 0, 1, 1,
0.5884003, -0.3421184, 0.1724709, 0.2078431, 0, 1, 1,
0.5902007, -0.1992012, 3.117756, 0.2117647, 0, 1, 1,
0.5911006, 1.425501, -0.1568951, 0.2196078, 0, 1, 1,
0.5912992, 0.08261026, 2.15321, 0.2235294, 0, 1, 1,
0.5919733, -0.0241235, 2.516355, 0.2313726, 0, 1, 1,
0.5927283, -0.6139171, 3.035405, 0.2352941, 0, 1, 1,
0.5936037, -0.1358584, 0.2019146, 0.2431373, 0, 1, 1,
0.5955567, 0.8117254, -0.6607996, 0.2470588, 0, 1, 1,
0.5962117, -1.729018, 2.698284, 0.254902, 0, 1, 1,
0.600174, -0.5399169, 1.118044, 0.2588235, 0, 1, 1,
0.6045012, -1.324408, 1.675633, 0.2666667, 0, 1, 1,
0.6056582, -0.04096365, 0.4627388, 0.2705882, 0, 1, 1,
0.6066993, -1.094887, 1.323286, 0.2784314, 0, 1, 1,
0.6081897, -0.3563215, 1.245579, 0.282353, 0, 1, 1,
0.6097282, -1.353807, 4.488005, 0.2901961, 0, 1, 1,
0.6099228, 2.37646, -0.2931013, 0.2941177, 0, 1, 1,
0.6110414, -0.6691341, 2.065271, 0.3019608, 0, 1, 1,
0.6139696, 1.593994, 0.3764438, 0.3098039, 0, 1, 1,
0.6249231, 2.234117, 0.5464001, 0.3137255, 0, 1, 1,
0.6282848, 2.79766, 1.319661, 0.3215686, 0, 1, 1,
0.6347538, -1.471462, 4.522648, 0.3254902, 0, 1, 1,
0.6374813, -2.02723, 2.81634, 0.3333333, 0, 1, 1,
0.637643, 0.5896864, 1.605427, 0.3372549, 0, 1, 1,
0.6395895, 2.493919, 1.614253, 0.345098, 0, 1, 1,
0.6404946, 1.112375, 0.6441402, 0.3490196, 0, 1, 1,
0.6419823, 0.3044189, 2.263849, 0.3568628, 0, 1, 1,
0.6429669, -0.7422596, 2.072197, 0.3607843, 0, 1, 1,
0.6455818, 0.4825839, 0.2853885, 0.3686275, 0, 1, 1,
0.6465115, 0.121078, 0.2671196, 0.372549, 0, 1, 1,
0.6605238, -0.5776856, 3.802807, 0.3803922, 0, 1, 1,
0.6606907, 0.3918224, 1.072774, 0.3843137, 0, 1, 1,
0.6627127, 0.883237, 1.040682, 0.3921569, 0, 1, 1,
0.6704486, -0.5484167, 1.561946, 0.3960784, 0, 1, 1,
0.6721979, -1.200115, 3.943935, 0.4039216, 0, 1, 1,
0.673837, -0.6590625, 1.667423, 0.4117647, 0, 1, 1,
0.6751782, 0.9665204, 2.188958, 0.4156863, 0, 1, 1,
0.677542, 1.786237, 0.5891437, 0.4235294, 0, 1, 1,
0.6777608, 1.54404, -0.06384151, 0.427451, 0, 1, 1,
0.6791596, 0.4929654, 1.29572, 0.4352941, 0, 1, 1,
0.6960363, -0.3551266, 1.236221, 0.4392157, 0, 1, 1,
0.6964909, 1.036461, 0.360572, 0.4470588, 0, 1, 1,
0.6992101, -0.08315226, 3.191133, 0.4509804, 0, 1, 1,
0.704419, 0.1912441, 0.4748388, 0.4588235, 0, 1, 1,
0.7049705, 1.04073, 1.292169, 0.4627451, 0, 1, 1,
0.7052549, -0.1673376, 0.2985076, 0.4705882, 0, 1, 1,
0.7120069, 0.7231292, 1.070081, 0.4745098, 0, 1, 1,
0.7213504, -0.2383061, 1.176644, 0.4823529, 0, 1, 1,
0.727834, 0.8062552, 1.263425, 0.4862745, 0, 1, 1,
0.7323634, -0.1356291, 1.641925, 0.4941176, 0, 1, 1,
0.7342712, 0.5194723, 2.606599, 0.5019608, 0, 1, 1,
0.734315, 1.666157, 0.301811, 0.5058824, 0, 1, 1,
0.7372462, 1.143337, 0.2476296, 0.5137255, 0, 1, 1,
0.741838, 0.2018094, 1.628905, 0.5176471, 0, 1, 1,
0.742722, -0.6338845, 2.28446, 0.5254902, 0, 1, 1,
0.7451145, 0.08689868, 2.770896, 0.5294118, 0, 1, 1,
0.7470604, 0.7329278, 1.399866, 0.5372549, 0, 1, 1,
0.7548121, 2.602609, 0.2809399, 0.5411765, 0, 1, 1,
0.7579796, -0.09773451, 1.973282, 0.5490196, 0, 1, 1,
0.7593278, 2.106898, -0.2475549, 0.5529412, 0, 1, 1,
0.7625183, -0.940005, 2.29279, 0.5607843, 0, 1, 1,
0.7680228, -0.3226212, 1.206679, 0.5647059, 0, 1, 1,
0.7707145, -2.79132, 4.346539, 0.572549, 0, 1, 1,
0.773472, -1.022833, 0.9284274, 0.5764706, 0, 1, 1,
0.7737278, 0.2892467, 1.191148, 0.5843138, 0, 1, 1,
0.7792535, -1.050528, 3.879122, 0.5882353, 0, 1, 1,
0.784637, 0.2047248, 0.08411317, 0.5960785, 0, 1, 1,
0.7866947, 0.3208045, 1.709486, 0.6039216, 0, 1, 1,
0.7867939, 1.035829, 0.1056069, 0.6078432, 0, 1, 1,
0.7918617, -0.3193772, 1.163142, 0.6156863, 0, 1, 1,
0.7959468, -0.1869927, 0.6358948, 0.6196079, 0, 1, 1,
0.7984281, -0.02112048, -0.1212156, 0.627451, 0, 1, 1,
0.8034204, 1.587531, -2.116731, 0.6313726, 0, 1, 1,
0.806507, -0.5478393, 4.059344, 0.6392157, 0, 1, 1,
0.809685, 1.804112, 1.084648, 0.6431373, 0, 1, 1,
0.8099827, 0.5443312, 0.8941196, 0.6509804, 0, 1, 1,
0.8126479, -1.507523, 3.323626, 0.654902, 0, 1, 1,
0.813515, -0.5059651, 1.597761, 0.6627451, 0, 1, 1,
0.8160111, 0.6355392, 0.9019156, 0.6666667, 0, 1, 1,
0.816281, -0.7314687, -0.1335435, 0.6745098, 0, 1, 1,
0.8253635, -0.3829574, 1.574845, 0.6784314, 0, 1, 1,
0.8259602, 1.716662, -0.4309198, 0.6862745, 0, 1, 1,
0.8261954, 2.275354, 0.4922574, 0.6901961, 0, 1, 1,
0.8328098, -0.5166122, 2.452962, 0.6980392, 0, 1, 1,
0.835797, -2.630925, 2.421603, 0.7058824, 0, 1, 1,
0.8388332, -0.4526471, 0.5182224, 0.7098039, 0, 1, 1,
0.8425055, -0.5491852, 2.51199, 0.7176471, 0, 1, 1,
0.8498836, -0.09855216, 2.376222, 0.7215686, 0, 1, 1,
0.8539246, 0.359517, 2.101754, 0.7294118, 0, 1, 1,
0.8577543, -0.7277066, 3.323992, 0.7333333, 0, 1, 1,
0.8617751, 0.3811367, 1.545742, 0.7411765, 0, 1, 1,
0.8621883, -1.811348, 4.246664, 0.7450981, 0, 1, 1,
0.8668257, -0.4526351, 2.21194, 0.7529412, 0, 1, 1,
0.8702195, 1.536368, -0.4337406, 0.7568628, 0, 1, 1,
0.8708872, -0.1504969, 0.9386632, 0.7647059, 0, 1, 1,
0.8725377, 1.861545, 1.642644, 0.7686275, 0, 1, 1,
0.8790839, -0.5349926, 0.05297984, 0.7764706, 0, 1, 1,
0.8801057, -0.6640028, 3.410675, 0.7803922, 0, 1, 1,
0.8830408, -0.6791677, 3.152279, 0.7882353, 0, 1, 1,
0.8885573, -1.303401, 0.6600208, 0.7921569, 0, 1, 1,
0.8937485, 1.237113, -0.8495944, 0.8, 0, 1, 1,
0.8988189, 0.1944181, 1.81085, 0.8078431, 0, 1, 1,
0.8995879, -0.3385995, 1.853617, 0.8117647, 0, 1, 1,
0.9013726, -1.025353, 2.383932, 0.8196079, 0, 1, 1,
0.9069356, -1.696768, 3.131207, 0.8235294, 0, 1, 1,
0.9100122, -0.8860813, 2.463226, 0.8313726, 0, 1, 1,
0.9108173, -1.081906, 2.925331, 0.8352941, 0, 1, 1,
0.9121213, -0.1503046, 1.278685, 0.8431373, 0, 1, 1,
0.9209955, 1.581052, 1.486201, 0.8470588, 0, 1, 1,
0.9236891, 0.7039961, 0.8329641, 0.854902, 0, 1, 1,
0.926926, -0.6157656, 2.827986, 0.8588235, 0, 1, 1,
0.9394242, -0.20883, -0.04959696, 0.8666667, 0, 1, 1,
0.9405383, 0.02944313, 2.119821, 0.8705882, 0, 1, 1,
0.9438503, 0.2770143, 1.761422, 0.8784314, 0, 1, 1,
0.9554854, -1.502311, 1.956994, 0.8823529, 0, 1, 1,
0.9613894, -1.087394, 2.779332, 0.8901961, 0, 1, 1,
0.9661261, 0.01615067, 0.7327643, 0.8941177, 0, 1, 1,
0.9768243, -0.1466357, 2.053946, 0.9019608, 0, 1, 1,
0.9807175, 1.042534, 1.117514, 0.9098039, 0, 1, 1,
0.9878519, -1.628924, 3.053584, 0.9137255, 0, 1, 1,
0.9882261, -0.6198537, 2.721007, 0.9215686, 0, 1, 1,
0.9888148, -0.7106628, 4.481407, 0.9254902, 0, 1, 1,
0.9905365, -0.7614793, 3.011334, 0.9333333, 0, 1, 1,
0.9954307, -0.6699599, 1.899833, 0.9372549, 0, 1, 1,
0.9973623, -1.682111, 2.979942, 0.945098, 0, 1, 1,
0.9997044, -0.7289501, 4.460866, 0.9490196, 0, 1, 1,
1.002427, 0.001263612, 0.3484661, 0.9568627, 0, 1, 1,
1.003203, -0.9364493, 1.69082, 0.9607843, 0, 1, 1,
1.00525, 0.4212791, 0.8976791, 0.9686275, 0, 1, 1,
1.00658, -1.11988, 0.6371101, 0.972549, 0, 1, 1,
1.008645, 0.6514721, 0.06499558, 0.9803922, 0, 1, 1,
1.010262, 1.55052, 0.7846574, 0.9843137, 0, 1, 1,
1.017513, -0.2974321, 2.110456, 0.9921569, 0, 1, 1,
1.026489, -1.376798, 2.197644, 0.9960784, 0, 1, 1,
1.031176, -0.3953141, 2.126704, 1, 0, 0.9960784, 1,
1.031281, 0.10387, 2.139818, 1, 0, 0.9882353, 1,
1.031901, -1.461106, 3.873904, 1, 0, 0.9843137, 1,
1.037545, -1.050472, 2.485047, 1, 0, 0.9764706, 1,
1.037912, -0.09823924, 2.527333, 1, 0, 0.972549, 1,
1.046414, 2.713076, -0.4633573, 1, 0, 0.9647059, 1,
1.051269, -0.4329934, 2.501649, 1, 0, 0.9607843, 1,
1.054048, 0.5088827, 0.8926208, 1, 0, 0.9529412, 1,
1.05545, -0.6758989, 0.6900557, 1, 0, 0.9490196, 1,
1.055489, -0.6908835, 3.500863, 1, 0, 0.9411765, 1,
1.059584, -0.2692933, 1.975331, 1, 0, 0.9372549, 1,
1.062325, 1.168799, 1.227057, 1, 0, 0.9294118, 1,
1.068278, 0.002156526, 0.4360213, 1, 0, 0.9254902, 1,
1.072943, -0.7655491, 1.689297, 1, 0, 0.9176471, 1,
1.074673, -0.6340225, 2.08143, 1, 0, 0.9137255, 1,
1.078075, -1.280415, 2.987435, 1, 0, 0.9058824, 1,
1.078725, -0.1346105, 2.836231, 1, 0, 0.9019608, 1,
1.093349, 0.7291068, 1.698119, 1, 0, 0.8941177, 1,
1.09572, -0.595826, 4.35464, 1, 0, 0.8862745, 1,
1.097744, -1.173138, 1.907342, 1, 0, 0.8823529, 1,
1.099193, 0.9746122, -0.3700017, 1, 0, 0.8745098, 1,
1.101736, 0.2429002, 2.751471, 1, 0, 0.8705882, 1,
1.104198, 1.298198, 2.792647, 1, 0, 0.8627451, 1,
1.107884, 0.08056683, 1.045144, 1, 0, 0.8588235, 1,
1.109499, -1.253006, 0.1875559, 1, 0, 0.8509804, 1,
1.110628, 0.9541554, 1.212205, 1, 0, 0.8470588, 1,
1.113921, -0.9398982, 3.064231, 1, 0, 0.8392157, 1,
1.123279, 1.236945, 0.568085, 1, 0, 0.8352941, 1,
1.125836, -0.8493229, 2.410915, 1, 0, 0.827451, 1,
1.127045, 0.6943003, -0.269912, 1, 0, 0.8235294, 1,
1.127363, -0.08086505, 2.138569, 1, 0, 0.8156863, 1,
1.129904, 0.4398889, -0.3140776, 1, 0, 0.8117647, 1,
1.137763, -0.1258051, 0.1836213, 1, 0, 0.8039216, 1,
1.138186, -1.005212, 3.07144, 1, 0, 0.7960784, 1,
1.143822, 0.5327891, 2.878553, 1, 0, 0.7921569, 1,
1.145187, -0.5850712, 0.9204418, 1, 0, 0.7843137, 1,
1.147539, 0.4971535, 3.501891, 1, 0, 0.7803922, 1,
1.154988, -2.594448, 4.013268, 1, 0, 0.772549, 1,
1.156479, 0.5733452, 1.375972, 1, 0, 0.7686275, 1,
1.160128, -0.001343238, 1.506476, 1, 0, 0.7607843, 1,
1.162897, -0.4974447, 2.168544, 1, 0, 0.7568628, 1,
1.164052, 0.3905807, 1.395734, 1, 0, 0.7490196, 1,
1.164682, 0.7455742, 0.5162049, 1, 0, 0.7450981, 1,
1.175932, -1.290595, 1.311805, 1, 0, 0.7372549, 1,
1.18766, -1.540748, 2.75936, 1, 0, 0.7333333, 1,
1.189563, 0.1833597, 1.493131, 1, 0, 0.7254902, 1,
1.190767, 1.044896, 0.2630183, 1, 0, 0.7215686, 1,
1.213736, 0.6953291, 0.9018216, 1, 0, 0.7137255, 1,
1.213833, -0.04561947, 0.9855548, 1, 0, 0.7098039, 1,
1.217485, -2.11736, 2.561928, 1, 0, 0.7019608, 1,
1.221056, 0.9595443, -1.160495, 1, 0, 0.6941177, 1,
1.223563, -0.07485642, 0.2778979, 1, 0, 0.6901961, 1,
1.225362, 0.1741543, 1.465849, 1, 0, 0.682353, 1,
1.229081, 1.297795, 0.8458849, 1, 0, 0.6784314, 1,
1.229751, 0.519986, 0.4299681, 1, 0, 0.6705883, 1,
1.236477, 1.359846, 1.135806, 1, 0, 0.6666667, 1,
1.24064, -0.2686809, 3.735654, 1, 0, 0.6588235, 1,
1.24177, 0.8924973, 0.6506633, 1, 0, 0.654902, 1,
1.2426, 1.934976, 2.047146, 1, 0, 0.6470588, 1,
1.253589, -1.111244, 2.771137, 1, 0, 0.6431373, 1,
1.256768, -1.339961, 2.462007, 1, 0, 0.6352941, 1,
1.26038, 0.3751858, 2.321649, 1, 0, 0.6313726, 1,
1.26204, -1.011736, 1.303951, 1, 0, 0.6235294, 1,
1.266779, 0.04052776, 1.851979, 1, 0, 0.6196079, 1,
1.281018, 1.435079, -1.342616, 1, 0, 0.6117647, 1,
1.287456, -1.817494, 3.839413, 1, 0, 0.6078432, 1,
1.288362, -0.8485042, 2.04301, 1, 0, 0.6, 1,
1.310042, -0.6549009, 4.035079, 1, 0, 0.5921569, 1,
1.310271, 0.6639752, 0.07622848, 1, 0, 0.5882353, 1,
1.31436, 0.2999308, 1.11383, 1, 0, 0.5803922, 1,
1.321268, 0.1474794, 1.135712, 1, 0, 0.5764706, 1,
1.330369, 0.005485505, 0.2821347, 1, 0, 0.5686275, 1,
1.342989, -1.653398, 3.901293, 1, 0, 0.5647059, 1,
1.351264, -0.167974, 2.003862, 1, 0, 0.5568628, 1,
1.351762, 0.3244555, -1.511524, 1, 0, 0.5529412, 1,
1.355064, 1.472939, 1.466551, 1, 0, 0.5450981, 1,
1.3558, -1.452085, 2.831151, 1, 0, 0.5411765, 1,
1.361551, 2.746262, -1.605885, 1, 0, 0.5333334, 1,
1.370095, -1.34839, 4.018582, 1, 0, 0.5294118, 1,
1.377094, -0.8627259, 1.694222, 1, 0, 0.5215687, 1,
1.382028, -0.9208847, 2.837823, 1, 0, 0.5176471, 1,
1.385233, 0.03518018, 1.689921, 1, 0, 0.509804, 1,
1.41557, -0.03863012, 2.266493, 1, 0, 0.5058824, 1,
1.418447, 0.502775, 1.419129, 1, 0, 0.4980392, 1,
1.431058, -0.78325, 2.958539, 1, 0, 0.4901961, 1,
1.44852, 0.2795474, 1.756347, 1, 0, 0.4862745, 1,
1.449796, 1.313467, 1.797804, 1, 0, 0.4784314, 1,
1.454123, 0.4103155, 2.087161, 1, 0, 0.4745098, 1,
1.454414, 1.558438, 0.5699767, 1, 0, 0.4666667, 1,
1.46323, 0.2278034, 1.178216, 1, 0, 0.4627451, 1,
1.468823, 0.8622464, 0.8267096, 1, 0, 0.454902, 1,
1.494802, -2.858874, 3.72837, 1, 0, 0.4509804, 1,
1.502769, 0.6258877, 1.375413, 1, 0, 0.4431373, 1,
1.507762, -0.1350238, 2.400007, 1, 0, 0.4392157, 1,
1.508574, -1.140106, 0.280422, 1, 0, 0.4313726, 1,
1.509073, 0.2060565, 0.4445597, 1, 0, 0.427451, 1,
1.517776, -0.7457674, 4.289393, 1, 0, 0.4196078, 1,
1.524203, -0.01235915, 0.1131655, 1, 0, 0.4156863, 1,
1.526277, -0.1949303, -0.08789252, 1, 0, 0.4078431, 1,
1.526375, -0.2671871, 1.207952, 1, 0, 0.4039216, 1,
1.526533, -0.02531674, 1.218332, 1, 0, 0.3960784, 1,
1.528343, -1.181593, 2.879338, 1, 0, 0.3882353, 1,
1.535777, -1.203874, 2.786264, 1, 0, 0.3843137, 1,
1.536384, 0.394596, 1.877673, 1, 0, 0.3764706, 1,
1.538517, -1.631834, 3.272602, 1, 0, 0.372549, 1,
1.541921, 1.79576, 1.794159, 1, 0, 0.3647059, 1,
1.544273, 0.6296032, 0.05427422, 1, 0, 0.3607843, 1,
1.553272, 0.3995637, 1.143778, 1, 0, 0.3529412, 1,
1.562847, -0.5306689, 2.959995, 1, 0, 0.3490196, 1,
1.56432, 0.3932861, 1.67987, 1, 0, 0.3411765, 1,
1.574472, 0.3861278, 0.9428343, 1, 0, 0.3372549, 1,
1.576483, -1.86114, 5.250148, 1, 0, 0.3294118, 1,
1.584562, 1.217565, 0.6336049, 1, 0, 0.3254902, 1,
1.590662, 1.173298, 0.9818673, 1, 0, 0.3176471, 1,
1.600641, -0.4042776, 2.579139, 1, 0, 0.3137255, 1,
1.610427, -0.03246818, -0.4204855, 1, 0, 0.3058824, 1,
1.624514, -1.97042, 1.946885, 1, 0, 0.2980392, 1,
1.626068, -0.5587652, -1.043656, 1, 0, 0.2941177, 1,
1.631292, -1.518832, 2.893787, 1, 0, 0.2862745, 1,
1.647894, 0.1179904, 1.076934, 1, 0, 0.282353, 1,
1.64976, -0.5639263, 3.350001, 1, 0, 0.2745098, 1,
1.651185, -1.1186, 3.691232, 1, 0, 0.2705882, 1,
1.654192, -0.1793487, 3.074084, 1, 0, 0.2627451, 1,
1.68217, -1.816453, 1.771207, 1, 0, 0.2588235, 1,
1.699258, 0.332321, 2.267249, 1, 0, 0.2509804, 1,
1.70077, -0.5126882, 1.405579, 1, 0, 0.2470588, 1,
1.710407, 0.1770153, 1.809752, 1, 0, 0.2392157, 1,
1.71809, 0.3432682, 0.2716325, 1, 0, 0.2352941, 1,
1.719694, 0.1220859, 0.002653694, 1, 0, 0.227451, 1,
1.750946, 1.539821, -0.4580083, 1, 0, 0.2235294, 1,
1.764549, -0.6852465, -0.4698549, 1, 0, 0.2156863, 1,
1.769407, 0.505794, 2.203661, 1, 0, 0.2117647, 1,
1.78014, -0.6285565, 1.818724, 1, 0, 0.2039216, 1,
1.788763, 0.3301405, 1.472684, 1, 0, 0.1960784, 1,
1.802689, 0.1244694, 1.787296, 1, 0, 0.1921569, 1,
1.802727, 1.690549, -0.9233375, 1, 0, 0.1843137, 1,
1.807956, 0.9463099, 2.190153, 1, 0, 0.1803922, 1,
1.80902, 0.9285492, 3.974365, 1, 0, 0.172549, 1,
1.82293, 0.7943781, 1.196482, 1, 0, 0.1686275, 1,
1.826047, 0.05470245, 3.196548, 1, 0, 0.1607843, 1,
1.833954, 0.6167303, 0.6240581, 1, 0, 0.1568628, 1,
1.854414, -0.7565583, 2.12769, 1, 0, 0.1490196, 1,
1.870461, 1.011155, 2.432038, 1, 0, 0.145098, 1,
1.876897, 1.043071, 3.54082, 1, 0, 0.1372549, 1,
1.929787, -2.232008, 1.508361, 1, 0, 0.1333333, 1,
1.950561, 0.03567797, 2.015927, 1, 0, 0.1254902, 1,
1.976979, 2.022212, 0.7910538, 1, 0, 0.1215686, 1,
1.992165, -0.4540276, 3.454669, 1, 0, 0.1137255, 1,
2.037573, 0.2287564, 2.942252, 1, 0, 0.1098039, 1,
2.059375, 0.2862636, 3.870087, 1, 0, 0.1019608, 1,
2.07497, -1.810921, 2.258344, 1, 0, 0.09411765, 1,
2.077784, 0.7192568, 0.9506515, 1, 0, 0.09019608, 1,
2.104105, 0.04724021, 1.750192, 1, 0, 0.08235294, 1,
2.11472, -0.8798277, 1.439691, 1, 0, 0.07843138, 1,
2.121559, -1.186209, 3.350127, 1, 0, 0.07058824, 1,
2.274985, 0.976294, 2.037176, 1, 0, 0.06666667, 1,
2.303268, 1.548609, 1.079044, 1, 0, 0.05882353, 1,
2.319815, 1.30493, 1.83709, 1, 0, 0.05490196, 1,
2.331569, 0.1765786, 0.8460957, 1, 0, 0.04705882, 1,
2.364584, -0.9652499, 1.813217, 1, 0, 0.04313726, 1,
2.382285, -0.04163706, 1.802244, 1, 0, 0.03529412, 1,
2.406254, -0.5582168, 3.42004, 1, 0, 0.03137255, 1,
2.424672, 0.6016073, 0.4770016, 1, 0, 0.02352941, 1,
2.709596, 0.197451, 1.922683, 1, 0, 0.01960784, 1,
2.855363, -0.1133363, 1.151981, 1, 0, 0.01176471, 1,
3.095177, 0.9640409, 0.2474188, 1, 0, 0.007843138, 1
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
-0.1517153, -3.817656, -6.928478, 0, -0.5, 0.5, 0.5,
-0.1517153, -3.817656, -6.928478, 1, -0.5, 0.5, 0.5,
-0.1517153, -3.817656, -6.928478, 1, 1.5, 0.5, 0.5,
-0.1517153, -3.817656, -6.928478, 0, 1.5, 0.5, 0.5
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
-4.499304, -0.03060699, -6.928478, 0, -0.5, 0.5, 0.5,
-4.499304, -0.03060699, -6.928478, 1, -0.5, 0.5, 0.5,
-4.499304, -0.03060699, -6.928478, 1, 1.5, 0.5, 0.5,
-4.499304, -0.03060699, -6.928478, 0, 1.5, 0.5, 0.5
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
-4.499304, -3.817656, 0.04338193, 0, -0.5, 0.5, 0.5,
-4.499304, -3.817656, 0.04338193, 1, -0.5, 0.5, 0.5,
-4.499304, -3.817656, 0.04338193, 1, 1.5, 0.5, 0.5,
-4.499304, -3.817656, 0.04338193, 0, 1.5, 0.5, 0.5
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
-3, -2.943722, -5.319587,
3, -2.943722, -5.319587,
-3, -2.943722, -5.319587,
-3, -3.089377, -5.587736,
-2, -2.943722, -5.319587,
-2, -3.089377, -5.587736,
-1, -2.943722, -5.319587,
-1, -3.089377, -5.587736,
0, -2.943722, -5.319587,
0, -3.089377, -5.587736,
1, -2.943722, -5.319587,
1, -3.089377, -5.587736,
2, -2.943722, -5.319587,
2, -3.089377, -5.587736,
3, -2.943722, -5.319587,
3, -3.089377, -5.587736
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
-3, -3.380689, -6.124033, 0, -0.5, 0.5, 0.5,
-3, -3.380689, -6.124033, 1, -0.5, 0.5, 0.5,
-3, -3.380689, -6.124033, 1, 1.5, 0.5, 0.5,
-3, -3.380689, -6.124033, 0, 1.5, 0.5, 0.5,
-2, -3.380689, -6.124033, 0, -0.5, 0.5, 0.5,
-2, -3.380689, -6.124033, 1, -0.5, 0.5, 0.5,
-2, -3.380689, -6.124033, 1, 1.5, 0.5, 0.5,
-2, -3.380689, -6.124033, 0, 1.5, 0.5, 0.5,
-1, -3.380689, -6.124033, 0, -0.5, 0.5, 0.5,
-1, -3.380689, -6.124033, 1, -0.5, 0.5, 0.5,
-1, -3.380689, -6.124033, 1, 1.5, 0.5, 0.5,
-1, -3.380689, -6.124033, 0, 1.5, 0.5, 0.5,
0, -3.380689, -6.124033, 0, -0.5, 0.5, 0.5,
0, -3.380689, -6.124033, 1, -0.5, 0.5, 0.5,
0, -3.380689, -6.124033, 1, 1.5, 0.5, 0.5,
0, -3.380689, -6.124033, 0, 1.5, 0.5, 0.5,
1, -3.380689, -6.124033, 0, -0.5, 0.5, 0.5,
1, -3.380689, -6.124033, 1, -0.5, 0.5, 0.5,
1, -3.380689, -6.124033, 1, 1.5, 0.5, 0.5,
1, -3.380689, -6.124033, 0, 1.5, 0.5, 0.5,
2, -3.380689, -6.124033, 0, -0.5, 0.5, 0.5,
2, -3.380689, -6.124033, 1, -0.5, 0.5, 0.5,
2, -3.380689, -6.124033, 1, 1.5, 0.5, 0.5,
2, -3.380689, -6.124033, 0, 1.5, 0.5, 0.5,
3, -3.380689, -6.124033, 0, -0.5, 0.5, 0.5,
3, -3.380689, -6.124033, 1, -0.5, 0.5, 0.5,
3, -3.380689, -6.124033, 1, 1.5, 0.5, 0.5,
3, -3.380689, -6.124033, 0, 1.5, 0.5, 0.5
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
-3.496015, -2, -5.319587,
-3.496015, 2, -5.319587,
-3.496015, -2, -5.319587,
-3.663229, -2, -5.587736,
-3.496015, -1, -5.319587,
-3.663229, -1, -5.587736,
-3.496015, 0, -5.319587,
-3.663229, 0, -5.587736,
-3.496015, 1, -5.319587,
-3.663229, 1, -5.587736,
-3.496015, 2, -5.319587,
-3.663229, 2, -5.587736
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
-3.997659, -2, -6.124033, 0, -0.5, 0.5, 0.5,
-3.997659, -2, -6.124033, 1, -0.5, 0.5, 0.5,
-3.997659, -2, -6.124033, 1, 1.5, 0.5, 0.5,
-3.997659, -2, -6.124033, 0, 1.5, 0.5, 0.5,
-3.997659, -1, -6.124033, 0, -0.5, 0.5, 0.5,
-3.997659, -1, -6.124033, 1, -0.5, 0.5, 0.5,
-3.997659, -1, -6.124033, 1, 1.5, 0.5, 0.5,
-3.997659, -1, -6.124033, 0, 1.5, 0.5, 0.5,
-3.997659, 0, -6.124033, 0, -0.5, 0.5, 0.5,
-3.997659, 0, -6.124033, 1, -0.5, 0.5, 0.5,
-3.997659, 0, -6.124033, 1, 1.5, 0.5, 0.5,
-3.997659, 0, -6.124033, 0, 1.5, 0.5, 0.5,
-3.997659, 1, -6.124033, 0, -0.5, 0.5, 0.5,
-3.997659, 1, -6.124033, 1, -0.5, 0.5, 0.5,
-3.997659, 1, -6.124033, 1, 1.5, 0.5, 0.5,
-3.997659, 1, -6.124033, 0, 1.5, 0.5, 0.5,
-3.997659, 2, -6.124033, 0, -0.5, 0.5, 0.5,
-3.997659, 2, -6.124033, 1, -0.5, 0.5, 0.5,
-3.997659, 2, -6.124033, 1, 1.5, 0.5, 0.5,
-3.997659, 2, -6.124033, 0, 1.5, 0.5, 0.5
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
-3.496015, -2.943722, -4,
-3.496015, -2.943722, 4,
-3.496015, -2.943722, -4,
-3.663229, -3.089377, -4,
-3.496015, -2.943722, -2,
-3.663229, -3.089377, -2,
-3.496015, -2.943722, 0,
-3.663229, -3.089377, 0,
-3.496015, -2.943722, 2,
-3.663229, -3.089377, 2,
-3.496015, -2.943722, 4,
-3.663229, -3.089377, 4
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
-3.997659, -3.380689, -4, 0, -0.5, 0.5, 0.5,
-3.997659, -3.380689, -4, 1, -0.5, 0.5, 0.5,
-3.997659, -3.380689, -4, 1, 1.5, 0.5, 0.5,
-3.997659, -3.380689, -4, 0, 1.5, 0.5, 0.5,
-3.997659, -3.380689, -2, 0, -0.5, 0.5, 0.5,
-3.997659, -3.380689, -2, 1, -0.5, 0.5, 0.5,
-3.997659, -3.380689, -2, 1, 1.5, 0.5, 0.5,
-3.997659, -3.380689, -2, 0, 1.5, 0.5, 0.5,
-3.997659, -3.380689, 0, 0, -0.5, 0.5, 0.5,
-3.997659, -3.380689, 0, 1, -0.5, 0.5, 0.5,
-3.997659, -3.380689, 0, 1, 1.5, 0.5, 0.5,
-3.997659, -3.380689, 0, 0, 1.5, 0.5, 0.5,
-3.997659, -3.380689, 2, 0, -0.5, 0.5, 0.5,
-3.997659, -3.380689, 2, 1, -0.5, 0.5, 0.5,
-3.997659, -3.380689, 2, 1, 1.5, 0.5, 0.5,
-3.997659, -3.380689, 2, 0, 1.5, 0.5, 0.5,
-3.997659, -3.380689, 4, 0, -0.5, 0.5, 0.5,
-3.997659, -3.380689, 4, 1, -0.5, 0.5, 0.5,
-3.997659, -3.380689, 4, 1, 1.5, 0.5, 0.5,
-3.997659, -3.380689, 4, 0, 1.5, 0.5, 0.5
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
-3.496015, -2.943722, -5.319587,
-3.496015, 2.882508, -5.319587,
-3.496015, -2.943722, 5.406351,
-3.496015, 2.882508, 5.406351,
-3.496015, -2.943722, -5.319587,
-3.496015, -2.943722, 5.406351,
-3.496015, 2.882508, -5.319587,
-3.496015, 2.882508, 5.406351,
-3.496015, -2.943722, -5.319587,
3.192584, -2.943722, -5.319587,
-3.496015, -2.943722, 5.406351,
3.192584, -2.943722, 5.406351,
-3.496015, 2.882508, -5.319587,
3.192584, 2.882508, -5.319587,
-3.496015, 2.882508, 5.406351,
3.192584, 2.882508, 5.406351,
3.192584, -2.943722, -5.319587,
3.192584, 2.882508, -5.319587,
3.192584, -2.943722, 5.406351,
3.192584, 2.882508, 5.406351,
3.192584, -2.943722, -5.319587,
3.192584, -2.943722, 5.406351,
3.192584, 2.882508, -5.319587,
3.192584, 2.882508, 5.406351
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
var radius = 7.432274;
var distance = 33.06703;
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
mvMatrix.translate( 0.1517153, 0.03060699, -0.04338193 );
mvMatrix.scale( 1.201436, 1.379266, 0.7492044 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.06703);
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
gl.drawArrays(gl.LINES, 0, 12);
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
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
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
Sodium_Isopropyl<-read.table("Sodium_Isopropyl.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Sodium_Isopropyl$V2
```

```
## Error in eval(expr, envir, enclos): object 'Sodium_Isopropyl' not found
```

```r
y<-Sodium_Isopropyl$V3
```

```
## Error in eval(expr, envir, enclos): object 'Sodium_Isopropyl' not found
```

```r
z<-Sodium_Isopropyl$V4
```

```
## Error in eval(expr, envir, enclos): object 'Sodium_Isopropyl' not found
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
-3.398608, -2.08673, -3.139016, 0, 0, 1, 1, 1,
-2.970243, -0.3228845, -2.10626, 1, 0, 0, 1, 1,
-2.94092, 0.3167087, 0.3290592, 1, 0, 0, 1, 1,
-2.772147, 0.08649471, -2.322277, 1, 0, 0, 1, 1,
-2.698282, -0.9031983, -1.606466, 1, 0, 0, 1, 1,
-2.550094, -0.1184352, -1.029918, 1, 0, 0, 1, 1,
-2.513293, 0.1333968, 0.2569496, 0, 0, 0, 1, 1,
-2.432126, -1.150034, -1.491178, 0, 0, 0, 1, 1,
-2.377381, -0.2432189, -1.976382, 0, 0, 0, 1, 1,
-2.374378, 2.100758, -0.4833819, 0, 0, 0, 1, 1,
-2.333842, -1.836033, -1.269565, 0, 0, 0, 1, 1,
-2.271693, 1.704677, -1.476554, 0, 0, 0, 1, 1,
-2.26368, 0.3176022, -1.808341, 0, 0, 0, 1, 1,
-2.255267, -0.1965169, -0.2021921, 1, 1, 1, 1, 1,
-2.223882, 1.400296, -1.151571, 1, 1, 1, 1, 1,
-2.139456, 0.5511373, -2.90695, 1, 1, 1, 1, 1,
-2.133539, 1.022192, -1.240757, 1, 1, 1, 1, 1,
-2.123853, -0.6627932, -2.361714, 1, 1, 1, 1, 1,
-2.119996, 0.8742427, 0.3849955, 1, 1, 1, 1, 1,
-2.101591, -0.7129238, -2.422452, 1, 1, 1, 1, 1,
-2.055143, 0.2268883, -1.245908, 1, 1, 1, 1, 1,
-2.022066, 1.597535, -1.385571, 1, 1, 1, 1, 1,
-2.004531, 0.7259984, 0.9176039, 1, 1, 1, 1, 1,
-1.97239, 0.5172881, -1.914823, 1, 1, 1, 1, 1,
-1.959093, 0.573553, -2.556179, 1, 1, 1, 1, 1,
-1.945615, 0.8023433, -2.427538, 1, 1, 1, 1, 1,
-1.912527, 1.505109, 0.9897611, 1, 1, 1, 1, 1,
-1.904426, 0.487576, -2.09684, 1, 1, 1, 1, 1,
-1.884465, 0.1207618, -2.376745, 0, 0, 1, 1, 1,
-1.860306, 1.876099, -0.6900121, 1, 0, 0, 1, 1,
-1.82423, 0.2168312, -0.2571195, 1, 0, 0, 1, 1,
-1.8157, -0.1568511, -2.254455, 1, 0, 0, 1, 1,
-1.812002, -0.9418733, -1.609326, 1, 0, 0, 1, 1,
-1.792989, -0.9696956, -1.92714, 1, 0, 0, 1, 1,
-1.781331, -0.8503699, 0.7553526, 0, 0, 0, 1, 1,
-1.760998, -0.3910128, -0.7456472, 0, 0, 0, 1, 1,
-1.758438, 0.3294906, -2.090771, 0, 0, 0, 1, 1,
-1.754433, 1.367246, -1.442793, 0, 0, 0, 1, 1,
-1.727638, 0.1009866, -1.596495, 0, 0, 0, 1, 1,
-1.721615, -0.8412403, -0.7075049, 0, 0, 0, 1, 1,
-1.719726, -1.429274, -2.244376, 0, 0, 0, 1, 1,
-1.717348, -0.2196872, -0.8537998, 1, 1, 1, 1, 1,
-1.716004, -1.021752, -4.61398, 1, 1, 1, 1, 1,
-1.690531, -0.9402312, -1.160487, 1, 1, 1, 1, 1,
-1.682588, -0.631183, -2.881396, 1, 1, 1, 1, 1,
-1.678305, 0.5213459, -0.5650229, 1, 1, 1, 1, 1,
-1.644937, -0.105262, -0.7198863, 1, 1, 1, 1, 1,
-1.644281, 0.4839625, -0.1239539, 1, 1, 1, 1, 1,
-1.634499, 0.5686627, -0.08605643, 1, 1, 1, 1, 1,
-1.632711, -0.4486037, -0.5317498, 1, 1, 1, 1, 1,
-1.630504, 0.2541264, -1.434751, 1, 1, 1, 1, 1,
-1.629906, 0.211462, -0.9151961, 1, 1, 1, 1, 1,
-1.620322, -1.185197, -1.65163, 1, 1, 1, 1, 1,
-1.614408, -1.208683, -2.309142, 1, 1, 1, 1, 1,
-1.602051, 0.4981698, -2.405146, 1, 1, 1, 1, 1,
-1.585316, 0.1807294, -0.4083481, 1, 1, 1, 1, 1,
-1.550979, 0.6292561, -1.550071, 0, 0, 1, 1, 1,
-1.49687, -0.2069914, -1.111806, 1, 0, 0, 1, 1,
-1.488911, -1.276112, -2.41049, 1, 0, 0, 1, 1,
-1.479911, 0.6074302, -0.4691931, 1, 0, 0, 1, 1,
-1.475805, -1.030406, -2.038329, 1, 0, 0, 1, 1,
-1.448003, -0.6767337, -2.222687, 1, 0, 0, 1, 1,
-1.438441, 0.3427135, -0.738026, 0, 0, 0, 1, 1,
-1.436527, -1.344095, -3.437072, 0, 0, 0, 1, 1,
-1.427597, -1.413756, -3.544111, 0, 0, 0, 1, 1,
-1.426826, -0.396747, -0.2493279, 0, 0, 0, 1, 1,
-1.426314, 0.8024384, -0.06422022, 0, 0, 0, 1, 1,
-1.424895, 1.444788, -0.3536482, 0, 0, 0, 1, 1,
-1.42001, -0.8822347, -2.37865, 0, 0, 0, 1, 1,
-1.40151, 1.431257, 0.3113659, 1, 1, 1, 1, 1,
-1.391876, -0.08912402, -1.91674, 1, 1, 1, 1, 1,
-1.391066, -0.5378584, -1.221083, 1, 1, 1, 1, 1,
-1.368515, -0.02996948, -1.235625, 1, 1, 1, 1, 1,
-1.367982, 0.6330161, -1.677908, 1, 1, 1, 1, 1,
-1.367427, 0.09595292, -1.22007, 1, 1, 1, 1, 1,
-1.349039, 0.6379035, -3.256671, 1, 1, 1, 1, 1,
-1.338607, -1.432445, -2.779675, 1, 1, 1, 1, 1,
-1.3259, 0.5343224, -1.241225, 1, 1, 1, 1, 1,
-1.314998, -1.480661, -3.528935, 1, 1, 1, 1, 1,
-1.313626, -1.36005, -2.36343, 1, 1, 1, 1, 1,
-1.310735, -1.293969, -3.812839, 1, 1, 1, 1, 1,
-1.29508, -0.7546844, -2.90546, 1, 1, 1, 1, 1,
-1.286603, -1.023644, -1.495026, 1, 1, 1, 1, 1,
-1.278505, 0.5686276, -1.145499, 1, 1, 1, 1, 1,
-1.276427, 0.4014087, -0.4726062, 0, 0, 1, 1, 1,
-1.264202, 0.8700408, -2.664512, 1, 0, 0, 1, 1,
-1.263327, -0.6970189, -1.304978, 1, 0, 0, 1, 1,
-1.260696, -0.01588262, -1.205994, 1, 0, 0, 1, 1,
-1.255696, 2.737971, -0.7387682, 1, 0, 0, 1, 1,
-1.254197, -0.05173407, -1.222995, 1, 0, 0, 1, 1,
-1.254168, -0.6141112, -4.069997, 0, 0, 0, 1, 1,
-1.251009, 0.1780984, -1.741122, 0, 0, 0, 1, 1,
-1.248396, -1.242507, -1.918572, 0, 0, 0, 1, 1,
-1.245449, -1.452553, -3.725475, 0, 0, 0, 1, 1,
-1.244119, -1.073686, -2.555397, 0, 0, 0, 1, 1,
-1.241967, -1.98976, -1.350355, 0, 0, 0, 1, 1,
-1.241476, -0.1025482, -1.774198, 0, 0, 0, 1, 1,
-1.23719, -0.2170322, -1.943065, 1, 1, 1, 1, 1,
-1.220593, 1.765311, -1.593728, 1, 1, 1, 1, 1,
-1.218592, -1.090542, -4.063739, 1, 1, 1, 1, 1,
-1.218053, -2.032643, -1.201236, 1, 1, 1, 1, 1,
-1.213122, 1.284308, -0.4389464, 1, 1, 1, 1, 1,
-1.212162, 1.911967, -0.6731091, 1, 1, 1, 1, 1,
-1.201939, -2.635101, -2.588547, 1, 1, 1, 1, 1,
-1.194973, 0.7779672, -2.039448, 1, 1, 1, 1, 1,
-1.190628, -0.2072585, -1.773084, 1, 1, 1, 1, 1,
-1.182498, -0.5144358, -3.234208, 1, 1, 1, 1, 1,
-1.176849, -0.7717122, -3.037189, 1, 1, 1, 1, 1,
-1.161759, 0.6204147, -2.350595, 1, 1, 1, 1, 1,
-1.160181, 1.777715, -0.04422422, 1, 1, 1, 1, 1,
-1.159519, -0.5165722, -1.824271, 1, 1, 1, 1, 1,
-1.152778, 1.007885, -1.389615, 1, 1, 1, 1, 1,
-1.150866, -0.4293663, -2.878575, 0, 0, 1, 1, 1,
-1.150226, -0.681587, -1.06188, 1, 0, 0, 1, 1,
-1.14392, -0.9437124, -2.570212, 1, 0, 0, 1, 1,
-1.14083, -0.5189386, -0.07190101, 1, 0, 0, 1, 1,
-1.137669, 2.352728, 0.1923724, 1, 0, 0, 1, 1,
-1.136274, 0.7405701, -2.129728, 1, 0, 0, 1, 1,
-1.133581, 2.043213, -0.6486101, 0, 0, 0, 1, 1,
-1.130439, -0.04895699, -0.4962007, 0, 0, 0, 1, 1,
-1.128212, -1.750585, -2.931721, 0, 0, 0, 1, 1,
-1.126337, 0.7444411, -0.1890682, 0, 0, 0, 1, 1,
-1.123185, 0.6095033, -1.39923, 0, 0, 0, 1, 1,
-1.112766, 0.368406, -1.568019, 0, 0, 0, 1, 1,
-1.106297, 0.7786334, -0.1802425, 0, 0, 0, 1, 1,
-1.103957, -1.833908, -4.842635, 1, 1, 1, 1, 1,
-1.101821, 0.06330942, -1.034327, 1, 1, 1, 1, 1,
-1.094216, 1.058, -0.1647508, 1, 1, 1, 1, 1,
-1.094199, -1.060255, -3.722728, 1, 1, 1, 1, 1,
-1.088298, 0.4285335, -2.494301, 1, 1, 1, 1, 1,
-1.086239, 0.7031765, -2.023441, 1, 1, 1, 1, 1,
-1.085843, -0.8360861, -2.51078, 1, 1, 1, 1, 1,
-1.079751, -0.5273884, -2.231073, 1, 1, 1, 1, 1,
-1.07858, -1.905618, -1.226031, 1, 1, 1, 1, 1,
-1.06685, -0.7250368, -1.656708, 1, 1, 1, 1, 1,
-1.063936, -0.09939313, -1.943438, 1, 1, 1, 1, 1,
-1.06389, -1.272897, -3.002131, 1, 1, 1, 1, 1,
-1.047197, 1.186526, -1.855834, 1, 1, 1, 1, 1,
-1.045175, 0.3648691, -2.185913, 1, 1, 1, 1, 1,
-1.038733, -0.8262966, -3.330251, 1, 1, 1, 1, 1,
-1.032368, 0.2468806, -5.163384, 0, 0, 1, 1, 1,
-1.030199, -0.2780878, -0.2225927, 1, 0, 0, 1, 1,
-1.018394, -0.1025345, -2.372147, 1, 0, 0, 1, 1,
-1.012903, -0.1499407, -0.8064161, 1, 0, 0, 1, 1,
-1.012601, -0.4110737, -1.306633, 1, 0, 0, 1, 1,
-1.012002, -0.8313116, -2.402457, 1, 0, 0, 1, 1,
-1.01121, -2.368226, -2.763531, 0, 0, 0, 1, 1,
-1.010521, -1.23509, -2.577189, 0, 0, 0, 1, 1,
-1.004656, -1.507052, -1.37198, 0, 0, 0, 1, 1,
-0.998828, -0.5997999, -2.682019, 0, 0, 0, 1, 1,
-0.9952688, -0.5544447, -3.96296, 0, 0, 0, 1, 1,
-0.9916884, 0.6050057, -1.025584, 0, 0, 0, 1, 1,
-0.9907524, -0.1161243, -0.9128557, 0, 0, 0, 1, 1,
-0.9830806, 0.2646613, -2.700405, 1, 1, 1, 1, 1,
-0.9752027, 0.5664238, -0.8121113, 1, 1, 1, 1, 1,
-0.9665173, 2.051303, 0.2951454, 1, 1, 1, 1, 1,
-0.9648429, -1.541255, -1.991923, 1, 1, 1, 1, 1,
-0.9612908, 0.6336031, -0.3920076, 1, 1, 1, 1, 1,
-0.96047, -0.3255576, -1.348616, 1, 1, 1, 1, 1,
-0.9576963, 1.435201, -1.803588, 1, 1, 1, 1, 1,
-0.9564907, -0.570222, -1.375098, 1, 1, 1, 1, 1,
-0.9557749, -0.5290555, -4.275852, 1, 1, 1, 1, 1,
-0.9549631, 1.199828, -0.33605, 1, 1, 1, 1, 1,
-0.9486897, -0.8661395, -2.526994, 1, 1, 1, 1, 1,
-0.9480121, 1.537993, -1.182301, 1, 1, 1, 1, 1,
-0.9431817, 0.05236026, -1.317648, 1, 1, 1, 1, 1,
-0.9420643, -0.09886148, -1.851888, 1, 1, 1, 1, 1,
-0.9356152, -0.2983004, -1.285794, 1, 1, 1, 1, 1,
-0.9339376, -0.8126056, -0.8389748, 0, 0, 1, 1, 1,
-0.9242858, 2.764085, -1.128419, 1, 0, 0, 1, 1,
-0.9180612, -0.4491214, -3.64992, 1, 0, 0, 1, 1,
-0.9165152, 0.1154137, -2.190539, 1, 0, 0, 1, 1,
-0.9163099, 0.3236832, 0.09181008, 1, 0, 0, 1, 1,
-0.909554, -0.8986756, -3.366186, 1, 0, 0, 1, 1,
-0.8985159, 0.8520943, -1.419022, 0, 0, 0, 1, 1,
-0.8978599, -0.5766137, -2.492998, 0, 0, 0, 1, 1,
-0.8799413, -1.609545, -3.332772, 0, 0, 0, 1, 1,
-0.8733799, 0.1933944, -0.6814296, 0, 0, 0, 1, 1,
-0.8660849, 0.4575782, -1.020881, 0, 0, 0, 1, 1,
-0.8500051, -0.3880139, -0.3984854, 0, 0, 0, 1, 1,
-0.8495934, 1.037291, -1.41735, 0, 0, 0, 1, 1,
-0.8487734, -0.1120326, -1.852938, 1, 1, 1, 1, 1,
-0.8470563, -0.9869705, -2.041718, 1, 1, 1, 1, 1,
-0.8421369, 0.7906632, -1.863022, 1, 1, 1, 1, 1,
-0.8408532, -0.7587579, -2.299399, 1, 1, 1, 1, 1,
-0.8390008, 1.398325, -1.94358, 1, 1, 1, 1, 1,
-0.838153, 0.8446631, 1.171032, 1, 1, 1, 1, 1,
-0.8343346, 0.1546577, -2.935138, 1, 1, 1, 1, 1,
-0.8330241, 0.1909611, -2.314798, 1, 1, 1, 1, 1,
-0.8329932, 1.411787, 0.3865428, 1, 1, 1, 1, 1,
-0.8290502, 0.03149482, -2.59784, 1, 1, 1, 1, 1,
-0.8173527, 1.725762, -0.9821886, 1, 1, 1, 1, 1,
-0.8108813, 1.37736, 0.4921421, 1, 1, 1, 1, 1,
-0.8078483, -0.3330388, -2.582336, 1, 1, 1, 1, 1,
-0.7988372, 0.5011792, -1.295318, 1, 1, 1, 1, 1,
-0.7981646, 0.05075572, -1.447022, 1, 1, 1, 1, 1,
-0.7942283, -0.2884113, -1.779387, 0, 0, 1, 1, 1,
-0.7940021, -0.1316046, -1.1216, 1, 0, 0, 1, 1,
-0.7937322, 0.7302047, -1.004899, 1, 0, 0, 1, 1,
-0.7934092, -0.4989905, -3.520066, 1, 0, 0, 1, 1,
-0.7898704, 0.6135761, -2.16777, 1, 0, 0, 1, 1,
-0.7723084, -1.842087, -2.707486, 1, 0, 0, 1, 1,
-0.7718862, -0.5317687, -2.252645, 0, 0, 0, 1, 1,
-0.7718755, 0.757749, 0.5512067, 0, 0, 0, 1, 1,
-0.7714796, 0.4002321, -1.947023, 0, 0, 0, 1, 1,
-0.769668, -0.3539583, -2.709335, 0, 0, 0, 1, 1,
-0.7644595, 0.04170562, -0.380747, 0, 0, 0, 1, 1,
-0.7642053, 1.250231, -0.523713, 0, 0, 0, 1, 1,
-0.7629631, 0.01248081, -0.4103562, 0, 0, 0, 1, 1,
-0.7564627, -0.6030006, -1.052968, 1, 1, 1, 1, 1,
-0.7534423, -0.1456449, -1.619969, 1, 1, 1, 1, 1,
-0.7531633, -0.08152208, -2.301014, 1, 1, 1, 1, 1,
-0.750772, -0.8252468, -1.828798, 1, 1, 1, 1, 1,
-0.7450866, -1.586412, -1.97402, 1, 1, 1, 1, 1,
-0.737343, 0.1520992, -1.205379, 1, 1, 1, 1, 1,
-0.733461, -0.2054624, -1.524511, 1, 1, 1, 1, 1,
-0.7326726, -1.602286, -2.382183, 1, 1, 1, 1, 1,
-0.7313693, -0.2388324, -1.981467, 1, 1, 1, 1, 1,
-0.7296427, -0.1735041, -1.722966, 1, 1, 1, 1, 1,
-0.7271035, -1.102649, -3.156065, 1, 1, 1, 1, 1,
-0.7258662, 0.4195862, -1.405055, 1, 1, 1, 1, 1,
-0.7257822, 0.04473379, -1.293567, 1, 1, 1, 1, 1,
-0.7231327, 0.198726, -2.605278, 1, 1, 1, 1, 1,
-0.7222611, -2.83771, -3.630327, 1, 1, 1, 1, 1,
-0.7197846, -0.02902873, -2.407008, 0, 0, 1, 1, 1,
-0.716369, 1.830722, -1.036627, 1, 0, 0, 1, 1,
-0.7150425, 1.256224, 0.4978833, 1, 0, 0, 1, 1,
-0.7131807, 0.3087063, -0.9690421, 1, 0, 0, 1, 1,
-0.7085189, -0.5826416, -3.15825, 1, 0, 0, 1, 1,
-0.7053025, 0.7071819, 0.3157507, 1, 0, 0, 1, 1,
-0.7051753, -2.129595, -4.040981, 0, 0, 0, 1, 1,
-0.6975514, 1.269027, -0.2404979, 0, 0, 0, 1, 1,
-0.694599, 1.68797, -1.1522, 0, 0, 0, 1, 1,
-0.6923212, 0.2574261, 0.9970402, 0, 0, 0, 1, 1,
-0.6915442, -0.3281863, -3.368595, 0, 0, 0, 1, 1,
-0.6908036, -1.016956, -3.664971, 0, 0, 0, 1, 1,
-0.6895975, 1.403177, -0.2357552, 0, 0, 0, 1, 1,
-0.6868618, 1.622373, -0.4278805, 1, 1, 1, 1, 1,
-0.6829934, 0.4181481, -1.275117, 1, 1, 1, 1, 1,
-0.6812764, -1.217386, -3.15038, 1, 1, 1, 1, 1,
-0.6805112, 2.095148, -0.922101, 1, 1, 1, 1, 1,
-0.6791418, -0.1345316, -2.032156, 1, 1, 1, 1, 1,
-0.6776735, 0.1419784, -1.160943, 1, 1, 1, 1, 1,
-0.6700147, -1.465689, -1.029355, 1, 1, 1, 1, 1,
-0.6676883, -1.344187, -3.021612, 1, 1, 1, 1, 1,
-0.6586964, -1.474247, -2.48767, 1, 1, 1, 1, 1,
-0.6568021, -0.9390038, -1.828186, 1, 1, 1, 1, 1,
-0.6530723, -1.717184, -3.010717, 1, 1, 1, 1, 1,
-0.6514274, -0.167628, -3.64485, 1, 1, 1, 1, 1,
-0.6505291, 0.3436839, -1.552034, 1, 1, 1, 1, 1,
-0.6499994, 1.185042, 0.3914995, 1, 1, 1, 1, 1,
-0.6479028, 0.5616339, -0.5178581, 1, 1, 1, 1, 1,
-0.643518, -0.09651998, -3.169937, 0, 0, 1, 1, 1,
-0.6386113, -0.5412388, -1.441896, 1, 0, 0, 1, 1,
-0.6233923, -0.5256289, -2.435943, 1, 0, 0, 1, 1,
-0.618334, -1.605826, -2.941645, 1, 0, 0, 1, 1,
-0.6183103, -1.544279, 0.04451476, 1, 0, 0, 1, 1,
-0.6135841, 0.7192251, -0.6527916, 1, 0, 0, 1, 1,
-0.6134194, 0.1415289, -1.006958, 0, 0, 0, 1, 1,
-0.6105908, -0.6184825, -2.356464, 0, 0, 0, 1, 1,
-0.6088488, -0.7982292, -2.260434, 0, 0, 0, 1, 1,
-0.6054293, -0.2986311, -3.333411, 0, 0, 0, 1, 1,
-0.6049981, -0.844146, -2.45551, 0, 0, 0, 1, 1,
-0.6008374, -0.776305, -1.744635, 0, 0, 0, 1, 1,
-0.5990098, -2.413378, -3.264315, 0, 0, 0, 1, 1,
-0.5968821, -0.7463533, -2.95355, 1, 1, 1, 1, 1,
-0.5916442, 0.7157168, -0.3305354, 1, 1, 1, 1, 1,
-0.5859382, -0.05391759, -1.05883, 1, 1, 1, 1, 1,
-0.5854447, -0.609593, -4.243099, 1, 1, 1, 1, 1,
-0.5838993, -0.7934489, -2.554011, 1, 1, 1, 1, 1,
-0.5818272, 0.502864, -0.6638588, 1, 1, 1, 1, 1,
-0.5798477, -2.425706, -2.906338, 1, 1, 1, 1, 1,
-0.5687013, 0.2926374, 1.846941, 1, 1, 1, 1, 1,
-0.5670487, 0.5572972, 0.02832457, 1, 1, 1, 1, 1,
-0.5650434, 0.1323272, -2.27193, 1, 1, 1, 1, 1,
-0.5619685, 2.213137, -0.3337618, 1, 1, 1, 1, 1,
-0.5588397, -0.1769456, -1.007736, 1, 1, 1, 1, 1,
-0.5518259, -0.86019, -2.865448, 1, 1, 1, 1, 1,
-0.5516649, -0.2291884, -1.587189, 1, 1, 1, 1, 1,
-0.5516547, -1.03614, -3.610624, 1, 1, 1, 1, 1,
-0.5516479, 0.851963, -2.145855, 0, 0, 1, 1, 1,
-0.5504085, -1.030769, -1.654821, 1, 0, 0, 1, 1,
-0.5492971, 1.732599, 1.813917, 1, 0, 0, 1, 1,
-0.5483088, 1.076898, 0.3668295, 1, 0, 0, 1, 1,
-0.5457115, 0.968677, -1.717875, 1, 0, 0, 1, 1,
-0.5423592, 0.05109738, -0.5273509, 1, 0, 0, 1, 1,
-0.5378395, -0.3611155, -3.140134, 0, 0, 0, 1, 1,
-0.5346161, 0.09288859, -1.46461, 0, 0, 0, 1, 1,
-0.5333626, -0.09377099, -2.489985, 0, 0, 0, 1, 1,
-0.5313461, 1.60063, 0.7628106, 0, 0, 0, 1, 1,
-0.5306848, -0.2233602, -3.524642, 0, 0, 0, 1, 1,
-0.5270412, 0.4627456, -0.100359, 0, 0, 0, 1, 1,
-0.5251661, 0.2820022, -1.265725, 0, 0, 0, 1, 1,
-0.5203671, 0.2214845, 0.07128965, 1, 1, 1, 1, 1,
-0.520067, 0.3041736, 0.9447383, 1, 1, 1, 1, 1,
-0.5182801, 0.6333701, -2.826643, 1, 1, 1, 1, 1,
-0.5118837, 1.331065, 0.4980606, 1, 1, 1, 1, 1,
-0.5086838, 1.571474, 0.1111601, 1, 1, 1, 1, 1,
-0.5074635, -0.863142, -3.412414, 1, 1, 1, 1, 1,
-0.5067945, 0.2502971, -0.04549883, 1, 1, 1, 1, 1,
-0.5067935, 0.8434772, -0.7409299, 1, 1, 1, 1, 1,
-0.5001414, -0.8156433, -2.728069, 1, 1, 1, 1, 1,
-0.498348, 0.8032908, 0.5658211, 1, 1, 1, 1, 1,
-0.4981918, 0.1956926, -2.28869, 1, 1, 1, 1, 1,
-0.4972492, -1.578672, -2.905775, 1, 1, 1, 1, 1,
-0.4939756, -1.645225, -2.789072, 1, 1, 1, 1, 1,
-0.4910947, -0.1661387, -1.318261, 1, 1, 1, 1, 1,
-0.4850447, 0.6013718, 0.7826148, 1, 1, 1, 1, 1,
-0.4821531, -0.02828326, -1.7099, 0, 0, 1, 1, 1,
-0.4813072, 1.584585, -0.5296121, 1, 0, 0, 1, 1,
-0.480644, 0.8125104, -1.269391, 1, 0, 0, 1, 1,
-0.4797215, -0.6940815, -2.546, 1, 0, 0, 1, 1,
-0.4760235, -0.3981476, -1.294474, 1, 0, 0, 1, 1,
-0.4710671, -0.8037251, -2.569979, 1, 0, 0, 1, 1,
-0.47032, -0.1706254, 0.09119206, 0, 0, 0, 1, 1,
-0.464441, -0.3622085, -0.9825695, 0, 0, 0, 1, 1,
-0.462661, 1.27452, -1.321014, 0, 0, 0, 1, 1,
-0.4622166, -0.6904243, -3.571669, 0, 0, 0, 1, 1,
-0.4524855, 0.6671592, -0.2120847, 0, 0, 0, 1, 1,
-0.4490379, -0.6150649, -2.84122, 0, 0, 0, 1, 1,
-0.4483048, 0.6161344, -1.390697, 0, 0, 0, 1, 1,
-0.4462323, 2.082842, -2.266901, 1, 1, 1, 1, 1,
-0.445825, 0.6107503, -0.413476, 1, 1, 1, 1, 1,
-0.4367071, -0.6247957, -2.795822, 1, 1, 1, 1, 1,
-0.4348763, 1.704995, -0.2076327, 1, 1, 1, 1, 1,
-0.4310358, 0.6528227, 0.5607729, 1, 1, 1, 1, 1,
-0.4289183, -0.5981652, -0.9064226, 1, 1, 1, 1, 1,
-0.4210767, -0.6196661, -0.3792311, 1, 1, 1, 1, 1,
-0.4144228, -0.5147597, -3.223834, 1, 1, 1, 1, 1,
-0.4108686, 1.347625, -0.8901787, 1, 1, 1, 1, 1,
-0.4099179, -0.7159511, -3.583036, 1, 1, 1, 1, 1,
-0.4083009, -1.151455, -3.563893, 1, 1, 1, 1, 1,
-0.4065315, 1.235596, -1.575548, 1, 1, 1, 1, 1,
-0.4037389, -0.1232031, -2.476975, 1, 1, 1, 1, 1,
-0.3995053, -1.763707, -3.644224, 1, 1, 1, 1, 1,
-0.3979205, 0.3605461, -0.5491721, 1, 1, 1, 1, 1,
-0.3952642, 0.2410966, -0.2736058, 0, 0, 1, 1, 1,
-0.3903374, 0.2767231, -2.018642, 1, 0, 0, 1, 1,
-0.3899218, 0.8214443, 0.8429176, 1, 0, 0, 1, 1,
-0.3895874, -1.183102, -2.448953, 1, 0, 0, 1, 1,
-0.3893555, -0.5621669, -2.585545, 1, 0, 0, 1, 1,
-0.3851842, -1.029195, -0.913256, 1, 0, 0, 1, 1,
-0.3836273, -1.399539, -3.390246, 0, 0, 0, 1, 1,
-0.3827821, 0.1981293, -1.594712, 0, 0, 0, 1, 1,
-0.382606, 0.4034659, -0.5568286, 0, 0, 0, 1, 1,
-0.3777524, 0.3426653, 1.169389, 0, 0, 0, 1, 1,
-0.3773753, -0.9424835, -2.627072, 0, 0, 0, 1, 1,
-0.3772133, 0.5709202, -0.597441, 0, 0, 0, 1, 1,
-0.376854, 0.8096558, -0.4230627, 0, 0, 0, 1, 1,
-0.37368, 0.7921317, 0.07343948, 1, 1, 1, 1, 1,
-0.3728522, -0.1533579, -2.792157, 1, 1, 1, 1, 1,
-0.368443, -0.6612428, -2.434907, 1, 1, 1, 1, 1,
-0.3683203, -0.2236098, -1.835977, 1, 1, 1, 1, 1,
-0.3680632, 1.463891, 1.930124, 1, 1, 1, 1, 1,
-0.3634772, -1.243258, -2.980059, 1, 1, 1, 1, 1,
-0.3622073, -1.340645, -3.089589, 1, 1, 1, 1, 1,
-0.3601565, -1.116955, -4.249537, 1, 1, 1, 1, 1,
-0.3516869, 0.4714954, 0.3365253, 1, 1, 1, 1, 1,
-0.3488824, 0.6489516, -0.1853373, 1, 1, 1, 1, 1,
-0.3447638, 0.1649082, -0.1305457, 1, 1, 1, 1, 1,
-0.3411265, -1.647007, -3.316978, 1, 1, 1, 1, 1,
-0.3345174, -0.6425741, -2.742569, 1, 1, 1, 1, 1,
-0.3322432, -0.2648428, -3.687516, 1, 1, 1, 1, 1,
-0.3272762, -1.469818, -2.284909, 1, 1, 1, 1, 1,
-0.3255195, 0.1875685, -1.698777, 0, 0, 1, 1, 1,
-0.3250444, 0.6066117, 0.03432138, 1, 0, 0, 1, 1,
-0.3240359, -0.5977672, -4.026167, 1, 0, 0, 1, 1,
-0.3215512, -0.3616946, -0.9316583, 1, 0, 0, 1, 1,
-0.3210442, 2.163151, -2.40177, 1, 0, 0, 1, 1,
-0.3159091, 0.05693838, -0.5433943, 1, 0, 0, 1, 1,
-0.3157165, 1.998997, -0.007793513, 0, 0, 0, 1, 1,
-0.3153418, -0.794843, -3.522748, 0, 0, 0, 1, 1,
-0.3138214, -2.021841, -1.827192, 0, 0, 0, 1, 1,
-0.3135921, -1.611576, -3.486041, 0, 0, 0, 1, 1,
-0.3079816, -0.05805397, -2.952837, 0, 0, 0, 1, 1,
-0.3063587, 1.722707, -0.0408113, 0, 0, 0, 1, 1,
-0.3000019, 0.2925102, 1.701594, 0, 0, 0, 1, 1,
-0.2913952, 1.122185, -0.8007634, 1, 1, 1, 1, 1,
-0.2889178, 0.08140872, -0.1362164, 1, 1, 1, 1, 1,
-0.2787435, 1.223759, -0.370623, 1, 1, 1, 1, 1,
-0.2786387, -1.09786, -4.443697, 1, 1, 1, 1, 1,
-0.2769617, 1.031273, 1.534023, 1, 1, 1, 1, 1,
-0.2738571, 0.6514543, -1.801594, 1, 1, 1, 1, 1,
-0.2718332, -2.509251, -2.646105, 1, 1, 1, 1, 1,
-0.2684176, -0.5668157, -1.843431, 1, 1, 1, 1, 1,
-0.2640271, -0.478604, -1.174445, 1, 1, 1, 1, 1,
-0.2634613, -0.56389, -2.232193, 1, 1, 1, 1, 1,
-0.2619718, -0.8026063, -0.9056613, 1, 1, 1, 1, 1,
-0.2581868, -0.04980766, -2.415985, 1, 1, 1, 1, 1,
-0.2578072, 0.6503804, 0.4146465, 1, 1, 1, 1, 1,
-0.25668, 0.09780766, -0.8429975, 1, 1, 1, 1, 1,
-0.2519765, 0.783721, 0.1591763, 1, 1, 1, 1, 1,
-0.251845, 1.318933, -0.6054114, 0, 0, 1, 1, 1,
-0.2498565, -0.173635, -1.227523, 1, 0, 0, 1, 1,
-0.2463354, -1.9598, -2.769079, 1, 0, 0, 1, 1,
-0.2444308, -0.01078144, -1.506383, 1, 0, 0, 1, 1,
-0.2366755, -0.2101236, -1.191323, 1, 0, 0, 1, 1,
-0.2333553, 1.42545, -0.6631516, 1, 0, 0, 1, 1,
-0.2305287, -1.586851, -2.468941, 0, 0, 0, 1, 1,
-0.2293673, 0.5461906, 0.6365424, 0, 0, 0, 1, 1,
-0.2249989, -0.5354527, -2.308311, 0, 0, 0, 1, 1,
-0.2246365, 1.563385, -1.014561, 0, 0, 0, 1, 1,
-0.224297, 1.361735, 1.570067, 0, 0, 0, 1, 1,
-0.2141351, 0.1644272, -1.008431, 0, 0, 0, 1, 1,
-0.2126437, -2.108322, -3.509181, 0, 0, 0, 1, 1,
-0.2110333, -0.4998348, -3.040586, 1, 1, 1, 1, 1,
-0.2093245, -0.06936771, -2.200618, 1, 1, 1, 1, 1,
-0.2092207, 1.424703, 0.08061215, 1, 1, 1, 1, 1,
-0.2082964, -0.4717013, -3.690685, 1, 1, 1, 1, 1,
-0.2061536, -0.2751559, -1.912763, 1, 1, 1, 1, 1,
-0.2000745, 1.546158, 0.07135073, 1, 1, 1, 1, 1,
-0.1980746, -0.525224, -3.455254, 1, 1, 1, 1, 1,
-0.1970561, 1.667374, -1.588649, 1, 1, 1, 1, 1,
-0.1964284, 1.981363, -0.6361058, 1, 1, 1, 1, 1,
-0.1935458, 1.808989, 1.198128, 1, 1, 1, 1, 1,
-0.1929093, 0.1182155, 1.134962, 1, 1, 1, 1, 1,
-0.1908097, 1.576699, 0.781745, 1, 1, 1, 1, 1,
-0.1845033, 1.375951, 0.2508444, 1, 1, 1, 1, 1,
-0.1816824, -0.4529586, -3.567918, 1, 1, 1, 1, 1,
-0.1786363, -0.7072564, -3.604873, 1, 1, 1, 1, 1,
-0.1756794, 1.994711, 0.2866709, 0, 0, 1, 1, 1,
-0.1749136, 0.3012016, 0.6954179, 1, 0, 0, 1, 1,
-0.1742589, -1.9965, -1.688485, 1, 0, 0, 1, 1,
-0.1738691, -0.5599576, -2.448191, 1, 0, 0, 1, 1,
-0.1726174, -0.3613977, -3.482751, 1, 0, 0, 1, 1,
-0.1679231, 0.2113341, -0.2314984, 1, 0, 0, 1, 1,
-0.1666796, -1.147716, -1.886438, 0, 0, 0, 1, 1,
-0.163845, -0.9671242, -2.071797, 0, 0, 0, 1, 1,
-0.1621248, 0.8498911, -1.165451, 0, 0, 0, 1, 1,
-0.15208, 0.5126087, -1.282859, 0, 0, 0, 1, 1,
-0.1434315, -0.2368257, -1.706157, 0, 0, 0, 1, 1,
-0.1409575, -0.159365, -1.724819, 0, 0, 0, 1, 1,
-0.1391415, -1.102315, -3.254391, 0, 0, 0, 1, 1,
-0.1353552, 0.3108629, 0.1661951, 1, 1, 1, 1, 1,
-0.1352271, 0.1328833, -0.4681651, 1, 1, 1, 1, 1,
-0.1326146, 0.3123679, -1.905097, 1, 1, 1, 1, 1,
-0.1285161, -1.020654, -2.81812, 1, 1, 1, 1, 1,
-0.1266396, -0.2109579, -0.8417387, 1, 1, 1, 1, 1,
-0.1233227, -1.008666, -2.133957, 1, 1, 1, 1, 1,
-0.1228084, -1.909275, -3.365312, 1, 1, 1, 1, 1,
-0.1205674, 0.5216424, -1.448677, 1, 1, 1, 1, 1,
-0.1198397, -0.3096703, -2.454971, 1, 1, 1, 1, 1,
-0.117851, -0.7620301, -4.097131, 1, 1, 1, 1, 1,
-0.1166793, -0.8394918, -4.637485, 1, 1, 1, 1, 1,
-0.1154586, 1.296618, -2.011442, 1, 1, 1, 1, 1,
-0.1111486, 1.511135, -1.500688, 1, 1, 1, 1, 1,
-0.1093903, 2.457597, 0.1389107, 1, 1, 1, 1, 1,
-0.1082379, 0.8580579, 0.6035922, 1, 1, 1, 1, 1,
-0.1051102, -1.002433, -2.679002, 0, 0, 1, 1, 1,
-0.1040856, 0.285752, -0.6500311, 1, 0, 0, 1, 1,
-0.1014665, -0.005735436, -3.430648, 1, 0, 0, 1, 1,
-0.09865562, -0.7404945, -3.343968, 1, 0, 0, 1, 1,
-0.09670223, -0.894087, -2.014777, 1, 0, 0, 1, 1,
-0.09358249, 0.3789257, -0.4150038, 1, 0, 0, 1, 1,
-0.09268676, -0.9791133, -3.980753, 0, 0, 0, 1, 1,
-0.08887284, -2.398957, -3.907449, 0, 0, 0, 1, 1,
-0.08354678, 0.4190027, -1.774539, 0, 0, 0, 1, 1,
-0.08343853, -0.8373353, -3.973719, 0, 0, 0, 1, 1,
-0.08180358, -1.041127, -1.948692, 0, 0, 0, 1, 1,
-0.07941107, -0.3014224, -1.936704, 0, 0, 0, 1, 1,
-0.07390819, -0.9197389, -3.779837, 0, 0, 0, 1, 1,
-0.07100088, -0.2930938, -2.599981, 1, 1, 1, 1, 1,
-0.0702571, 1.55311, 0.8516154, 1, 1, 1, 1, 1,
-0.06516598, -1.10211, -2.064938, 1, 1, 1, 1, 1,
-0.06210616, 0.01681579, -0.2482911, 1, 1, 1, 1, 1,
-0.06209029, 0.01564898, -0.4084377, 1, 1, 1, 1, 1,
-0.06119909, -0.5213787, -3.814222, 1, 1, 1, 1, 1,
-0.06003545, 0.7634091, -1.438952, 1, 1, 1, 1, 1,
-0.05648069, -0.5276154, -1.785238, 1, 1, 1, 1, 1,
-0.05553358, -0.3157002, -2.05536, 1, 1, 1, 1, 1,
-0.05480777, 0.1431918, -0.2194923, 1, 1, 1, 1, 1,
-0.05468746, -0.9047518, -2.698217, 1, 1, 1, 1, 1,
-0.05397438, 0.6711113, -1.424668, 1, 1, 1, 1, 1,
-0.05218456, -0.8309798, -3.456981, 1, 1, 1, 1, 1,
-0.04928547, -2.315289, -3.547804, 1, 1, 1, 1, 1,
-0.03569616, -0.0206844, -1.019724, 1, 1, 1, 1, 1,
-0.03329168, 2.423442, -0.9949577, 0, 0, 1, 1, 1,
-0.03069167, 0.2109743, -0.1194116, 1, 0, 0, 1, 1,
-0.02831124, -0.8098132, -3.96392, 1, 0, 0, 1, 1,
-0.02750167, -0.08979175, -2.807389, 1, 0, 0, 1, 1,
-0.02384334, 0.3165313, 0.8697994, 1, 0, 0, 1, 1,
-0.02253094, -0.2389928, -2.82476, 1, 0, 0, 1, 1,
-0.02147987, 2.100293, -0.7402087, 0, 0, 0, 1, 1,
-0.01918972, 0.093026, -0.6932781, 0, 0, 0, 1, 1,
-0.01500731, 1.824869, -1.249732, 0, 0, 0, 1, 1,
-0.002394139, -0.4346555, -4.988748, 0, 0, 0, 1, 1,
-0.002257743, -1.910378, -3.462056, 0, 0, 0, 1, 1,
-0.002027943, -0.0379767, -1.693499, 0, 0, 0, 1, 1,
0.0007579016, 0.9001394, -1.407086, 0, 0, 0, 1, 1,
0.002145978, -1.689387, 3.142287, 1, 1, 1, 1, 1,
0.01704706, -1.336796, 3.902652, 1, 1, 1, 1, 1,
0.01896797, -0.2686077, 2.970271, 1, 1, 1, 1, 1,
0.0192598, 0.01074254, 2.987015, 1, 1, 1, 1, 1,
0.02020627, 0.4360944, -0.2378423, 1, 1, 1, 1, 1,
0.02522472, 2.279178, 0.6487414, 1, 1, 1, 1, 1,
0.02630012, 1.634909, 0.2456642, 1, 1, 1, 1, 1,
0.02931612, -0.9313911, 3.266661, 1, 1, 1, 1, 1,
0.03310688, -1.554518, 3.482984, 1, 1, 1, 1, 1,
0.03331918, -1.018954, 2.646218, 1, 1, 1, 1, 1,
0.03340433, -2.002879, 1.905076, 1, 1, 1, 1, 1,
0.040937, -0.6303248, 4.37149, 1, 1, 1, 1, 1,
0.04157631, -0.3820164, 4.344412, 1, 1, 1, 1, 1,
0.04530285, -0.4517004, 3.47766, 1, 1, 1, 1, 1,
0.04628847, 0.2068977, 1.611881, 1, 1, 1, 1, 1,
0.05087269, 0.3261327, -0.7588536, 0, 0, 1, 1, 1,
0.05105907, -0.4306914, 2.502843, 1, 0, 0, 1, 1,
0.05418148, -0.3048002, 3.928951, 1, 0, 0, 1, 1,
0.05486729, -0.6332799, 3.347968, 1, 0, 0, 1, 1,
0.05611536, -0.0749688, 1.80314, 1, 0, 0, 1, 1,
0.06525248, 0.01287698, 1.956756, 1, 0, 0, 1, 1,
0.06571084, 0.9818191, -1.143488, 0, 0, 0, 1, 1,
0.0723946, -0.8063736, 0.5737707, 0, 0, 0, 1, 1,
0.07431146, 0.2057202, -0.09864335, 0, 0, 0, 1, 1,
0.07712558, 0.2064074, -0.9361209, 0, 0, 0, 1, 1,
0.07925493, 0.709591, 0.5622687, 0, 0, 0, 1, 1,
0.08027019, -1.931479, 2.352788, 0, 0, 0, 1, 1,
0.08550343, 0.4377407, -0.3770277, 0, 0, 0, 1, 1,
0.0855568, 0.3838704, 2.249379, 1, 1, 1, 1, 1,
0.08591469, -1.404982, 2.634362, 1, 1, 1, 1, 1,
0.086742, 0.5301034, 0.01916369, 1, 1, 1, 1, 1,
0.09458409, 0.5354167, 0.2951855, 1, 1, 1, 1, 1,
0.09460936, -0.6557353, 1.362852, 1, 1, 1, 1, 1,
0.09600206, -1.283736, 3.658699, 1, 1, 1, 1, 1,
0.0976002, -0.4935028, 3.282593, 1, 1, 1, 1, 1,
0.1022333, -1.565942, 1.792694, 1, 1, 1, 1, 1,
0.1064845, 0.1481026, -0.6225059, 1, 1, 1, 1, 1,
0.1068104, 0.5589653, -0.2018464, 1, 1, 1, 1, 1,
0.1068662, -0.2585941, 4.452226, 1, 1, 1, 1, 1,
0.1072784, 0.6572074, 1.144758, 1, 1, 1, 1, 1,
0.1125273, 1.168011, -0.6167181, 1, 1, 1, 1, 1,
0.1139008, -0.784974, 2.683441, 1, 1, 1, 1, 1,
0.1152483, 1.069593, 0.6722239, 1, 1, 1, 1, 1,
0.1160784, 0.3258729, -0.3744046, 0, 0, 1, 1, 1,
0.1181891, 0.2498303, -0.6476551, 1, 0, 0, 1, 1,
0.1228256, 0.7610742, 2.839105, 1, 0, 0, 1, 1,
0.1274519, 1.600415, 0.3465612, 1, 0, 0, 1, 1,
0.1275053, 0.3008784, 0.6826474, 1, 0, 0, 1, 1,
0.1295036, 0.06668334, 2.019632, 1, 0, 0, 1, 1,
0.1296861, 0.04191619, 1.627878, 0, 0, 0, 1, 1,
0.1395554, -1.370221, 3.904224, 0, 0, 0, 1, 1,
0.1406695, 1.613416, 0.4804466, 0, 0, 0, 1, 1,
0.1441433, 0.7799746, -1.925586, 0, 0, 0, 1, 1,
0.1461601, -0.289255, 3.79927, 0, 0, 0, 1, 1,
0.1494179, -0.9276313, 3.167545, 0, 0, 0, 1, 1,
0.1494508, 1.407328, 0.9721629, 0, 0, 0, 1, 1,
0.1515454, 1.924209, 1.287552, 1, 1, 1, 1, 1,
0.1533744, -1.472716, 5.093474, 1, 1, 1, 1, 1,
0.1534053, -1.378868, 1.445853, 1, 1, 1, 1, 1,
0.1566768, -2.11376, 4.463659, 1, 1, 1, 1, 1,
0.1582952, 1.582751, -0.5348956, 1, 1, 1, 1, 1,
0.1596588, -0.6416152, 3.722546, 1, 1, 1, 1, 1,
0.1617318, -1.328708, 3.396128, 1, 1, 1, 1, 1,
0.1619105, 0.05196441, 1.145622, 1, 1, 1, 1, 1,
0.1662191, 0.9175007, -1.677795, 1, 1, 1, 1, 1,
0.1670352, 0.08268444, -0.6266392, 1, 1, 1, 1, 1,
0.1670396, -0.003205676, 2.175199, 1, 1, 1, 1, 1,
0.1685728, -1.851438, 2.560182, 1, 1, 1, 1, 1,
0.1693639, 1.311031, 0.3373733, 1, 1, 1, 1, 1,
0.1699864, -1.156813, 2.386806, 1, 1, 1, 1, 1,
0.1704479, -1.065226, 2.169899, 1, 1, 1, 1, 1,
0.1707158, -0.581813, 3.322986, 0, 0, 1, 1, 1,
0.1742643, 1.511876, 0.1645467, 1, 0, 0, 1, 1,
0.1798008, 1.512106, 0.724843, 1, 0, 0, 1, 1,
0.1804736, -1.322286, 2.870984, 1, 0, 0, 1, 1,
0.1806185, -0.8307524, 2.857108, 1, 0, 0, 1, 1,
0.1806898, -0.1392434, 1.06822, 1, 0, 0, 1, 1,
0.1825904, 1.305525, 0.5714912, 0, 0, 0, 1, 1,
0.1886099, 1.99042, -1.617895, 0, 0, 0, 1, 1,
0.1892651, -0.4774116, 0.7179828, 0, 0, 0, 1, 1,
0.1900279, 0.1084168, 0.2238556, 0, 0, 0, 1, 1,
0.2007761, 1.286167, -1.976754, 0, 0, 0, 1, 1,
0.2018643, 0.3254927, 1.46724, 0, 0, 0, 1, 1,
0.2021936, -0.9996747, 2.260271, 0, 0, 0, 1, 1,
0.2055609, -0.2208008, 3.539085, 1, 1, 1, 1, 1,
0.2080357, -0.5279748, 2.56758, 1, 1, 1, 1, 1,
0.2090575, 1.225222, 0.4526334, 1, 1, 1, 1, 1,
0.2127023, -0.3361117, 3.38828, 1, 1, 1, 1, 1,
0.2127298, 0.4144083, 0.6073236, 1, 1, 1, 1, 1,
0.2186418, 0.9766659, 1.776266, 1, 1, 1, 1, 1,
0.2199084, -0.6366956, 2.815598, 1, 1, 1, 1, 1,
0.2228657, 0.4137977, 0.2991494, 1, 1, 1, 1, 1,
0.2253383, -2.404352, 2.403123, 1, 1, 1, 1, 1,
0.2307821, 0.8470524, 1.366591, 1, 1, 1, 1, 1,
0.2321741, 0.9090803, 0.1002387, 1, 1, 1, 1, 1,
0.2325965, -2.214726, 3.524153, 1, 1, 1, 1, 1,
0.2334635, -0.1081164, 1.890849, 1, 1, 1, 1, 1,
0.2348866, 0.5036653, 0.1102352, 1, 1, 1, 1, 1,
0.2427632, 0.454839, -0.2552115, 1, 1, 1, 1, 1,
0.2443984, 0.7897219, -0.711791, 0, 0, 1, 1, 1,
0.2463386, 0.2197333, 1.238386, 1, 0, 0, 1, 1,
0.2486443, 1.688396, 0.1218781, 1, 0, 0, 1, 1,
0.2489134, -0.703004, 1.646334, 1, 0, 0, 1, 1,
0.250245, -0.4792811, 2.712249, 1, 0, 0, 1, 1,
0.2554354, 0.009652643, 1.296796, 1, 0, 0, 1, 1,
0.2560883, 0.5462909, -0.778581, 0, 0, 0, 1, 1,
0.2593262, 1.755563, 0.4727082, 0, 0, 0, 1, 1,
0.2593529, 0.4261369, 2.531534, 0, 0, 0, 1, 1,
0.2602184, 0.6931653, 0.8478748, 0, 0, 0, 1, 1,
0.2613208, 1.367081, -0.2334887, 0, 0, 0, 1, 1,
0.2673128, 0.6046535, 0.787508, 0, 0, 0, 1, 1,
0.2690188, -1.114732, 3.431419, 0, 0, 0, 1, 1,
0.2727382, -0.4874878, 2.317637, 1, 1, 1, 1, 1,
0.2792344, -0.2050771, 3.086444, 1, 1, 1, 1, 1,
0.2800495, 2.034507, 0.315336, 1, 1, 1, 1, 1,
0.2801761, 0.3268824, 1.050933, 1, 1, 1, 1, 1,
0.280329, 0.4335551, 0.7526854, 1, 1, 1, 1, 1,
0.2831527, 1.661439, 0.7290148, 1, 1, 1, 1, 1,
0.2852916, 1.837374, 1.822158, 1, 1, 1, 1, 1,
0.2880682, -2.2389, 2.758685, 1, 1, 1, 1, 1,
0.2996202, 0.8012336, 1.70533, 1, 1, 1, 1, 1,
0.3003648, -0.8379455, 3.487685, 1, 1, 1, 1, 1,
0.3094738, -0.1588572, 0.3773321, 1, 1, 1, 1, 1,
0.3178221, 0.06686544, 0.5581074, 1, 1, 1, 1, 1,
0.3186098, -0.5368532, 3.444341, 1, 1, 1, 1, 1,
0.329124, -0.8947256, 2.099803, 1, 1, 1, 1, 1,
0.3295373, 2.191799, -0.6702417, 1, 1, 1, 1, 1,
0.333049, -0.5653551, 4.874476, 0, 0, 1, 1, 1,
0.3449983, 0.009429731, 2.392463, 1, 0, 0, 1, 1,
0.346497, -0.7034636, 3.536368, 1, 0, 0, 1, 1,
0.3496206, 0.4686617, 0.5164722, 1, 0, 0, 1, 1,
0.3558792, -0.4925624, 2.121878, 1, 0, 0, 1, 1,
0.3702845, -0.3476889, 2.487248, 1, 0, 0, 1, 1,
0.3707528, 2.693502, -0.002384543, 0, 0, 0, 1, 1,
0.372049, -0.02970237, 1.899165, 0, 0, 0, 1, 1,
0.3734901, -0.470934, 2.239085, 0, 0, 0, 1, 1,
0.3739598, -1.23432, 2.819509, 0, 0, 0, 1, 1,
0.376944, 1.950623, 0.3952533, 0, 0, 0, 1, 1,
0.3804428, -1.164069, 2.575913, 0, 0, 0, 1, 1,
0.3815235, 0.4983885, -0.1849134, 0, 0, 0, 1, 1,
0.3859832, 0.09422794, 1.740183, 1, 1, 1, 1, 1,
0.3909774, 0.4827031, 0.6873891, 1, 1, 1, 1, 1,
0.3915887, -0.4734687, 4.05554, 1, 1, 1, 1, 1,
0.3950705, -0.6761237, 3.980751, 1, 1, 1, 1, 1,
0.3953266, -0.2474712, 1.98626, 1, 1, 1, 1, 1,
0.397487, 1.782225, 0.2812734, 1, 1, 1, 1, 1,
0.3988664, -1.165359, 2.334523, 1, 1, 1, 1, 1,
0.4006547, -0.5862828, 3.188412, 1, 1, 1, 1, 1,
0.4014018, -0.2321579, -0.1120149, 1, 1, 1, 1, 1,
0.4023851, 1.715059, 0.5015566, 1, 1, 1, 1, 1,
0.4025846, -0.1126509, 1.340377, 1, 1, 1, 1, 1,
0.4092474, 0.2804029, 0.5946701, 1, 1, 1, 1, 1,
0.4124071, -0.6201969, 3.535916, 1, 1, 1, 1, 1,
0.4141336, -0.01721539, 1.283559, 1, 1, 1, 1, 1,
0.4224837, -0.9687696, 2.320737, 1, 1, 1, 1, 1,
0.4225733, -0.6245974, 2.783075, 0, 0, 1, 1, 1,
0.4254817, -2.166164, 3.56664, 1, 0, 0, 1, 1,
0.4259083, 0.9558105, -0.02854716, 1, 0, 0, 1, 1,
0.4302529, -0.6296155, -0.4329848, 1, 0, 0, 1, 1,
0.4313359, -1.240099, 3.281093, 1, 0, 0, 1, 1,
0.4348725, 0.2137483, 1.208547, 1, 0, 0, 1, 1,
0.4383109, 0.6165842, 1.12362, 0, 0, 0, 1, 1,
0.4427975, -0.2702241, -0.04457134, 0, 0, 0, 1, 1,
0.4433536, 1.711126, 0.4587641, 0, 0, 0, 1, 1,
0.4443058, -0.9747407, 4.168429, 0, 0, 0, 1, 1,
0.4468741, 0.0330634, 0.2147848, 0, 0, 0, 1, 1,
0.4481919, 0.1623321, 2.291321, 0, 0, 0, 1, 1,
0.4591407, 1.57083, 0.1446122, 0, 0, 0, 1, 1,
0.4602185, -0.680779, 1.772498, 1, 1, 1, 1, 1,
0.4608368, 0.05586864, 1.847821, 1, 1, 1, 1, 1,
0.462923, 0.6259021, 0.5883045, 1, 1, 1, 1, 1,
0.4634085, 1.71143, -1.688211, 1, 1, 1, 1, 1,
0.4671124, 0.04879122, 2.860377, 1, 1, 1, 1, 1,
0.4712101, -1.88255, 2.711227, 1, 1, 1, 1, 1,
0.4759504, -0.4835681, 3.703913, 1, 1, 1, 1, 1,
0.4812036, 1.695073, 0.1595596, 1, 1, 1, 1, 1,
0.4825031, 2.095574, -0.2649484, 1, 1, 1, 1, 1,
0.4861949, -0.4853489, 1.526351, 1, 1, 1, 1, 1,
0.4905851, -0.2808391, 2.788825, 1, 1, 1, 1, 1,
0.4943825, -0.990401, 3.039998, 1, 1, 1, 1, 1,
0.496634, 0.2044136, 1.006197, 1, 1, 1, 1, 1,
0.4967296, 1.761939, 0.3394893, 1, 1, 1, 1, 1,
0.4967811, -2.69289, 3.688454, 1, 1, 1, 1, 1,
0.50008, 0.8855971, 1.688206, 0, 0, 1, 1, 1,
0.5002202, 0.7790349, 0.7739072, 1, 0, 0, 1, 1,
0.5035549, -0.5197861, 1.087433, 1, 0, 0, 1, 1,
0.5036553, 0.3451167, 3.473952, 1, 0, 0, 1, 1,
0.5153751, -0.03862365, 2.52855, 1, 0, 0, 1, 1,
0.5165418, 0.8744144, 0.07532574, 1, 0, 0, 1, 1,
0.5215055, 0.1181688, 1.101364, 0, 0, 0, 1, 1,
0.5220862, 0.4167415, 1.614766, 0, 0, 0, 1, 1,
0.5222195, 0.6759818, -1.082723, 0, 0, 0, 1, 1,
0.5223237, 0.07703734, 0.6107773, 0, 0, 0, 1, 1,
0.5310102, -1.835819, 3.195462, 0, 0, 0, 1, 1,
0.5311635, -0.7549059, 2.349188, 0, 0, 0, 1, 1,
0.5344831, -0.06586559, 3.660563, 0, 0, 0, 1, 1,
0.5346779, 0.4583893, 1.061254, 1, 1, 1, 1, 1,
0.5368844, 0.4947059, -0.8391001, 1, 1, 1, 1, 1,
0.5476455, 0.2081759, 0.7057858, 1, 1, 1, 1, 1,
0.5480915, -0.2053973, 0.8485813, 1, 1, 1, 1, 1,
0.5563585, -1.166517, 2.027282, 1, 1, 1, 1, 1,
0.5567639, 1.739039, -0.06804908, 1, 1, 1, 1, 1,
0.5598766, -0.3204316, 2.996825, 1, 1, 1, 1, 1,
0.5682307, 1.147764, 0.9332963, 1, 1, 1, 1, 1,
0.5684463, 0.1592757, -0.002482535, 1, 1, 1, 1, 1,
0.5704461, 1.232887, 1.317294, 1, 1, 1, 1, 1,
0.5746365, -0.4031335, 1.776902, 1, 1, 1, 1, 1,
0.5748425, 0.413556, 1.871007, 1, 1, 1, 1, 1,
0.5750185, -2.755083, 2.494804, 1, 1, 1, 1, 1,
0.5758847, -0.8195946, 2.630272, 1, 1, 1, 1, 1,
0.579636, -1.114903, 3.906132, 1, 1, 1, 1, 1,
0.5862245, 1.262436, -0.3699853, 0, 0, 1, 1, 1,
0.5884003, -0.3421184, 0.1724709, 1, 0, 0, 1, 1,
0.5902007, -0.1992012, 3.117756, 1, 0, 0, 1, 1,
0.5911006, 1.425501, -0.1568951, 1, 0, 0, 1, 1,
0.5912992, 0.08261026, 2.15321, 1, 0, 0, 1, 1,
0.5919733, -0.0241235, 2.516355, 1, 0, 0, 1, 1,
0.5927283, -0.6139171, 3.035405, 0, 0, 0, 1, 1,
0.5936037, -0.1358584, 0.2019146, 0, 0, 0, 1, 1,
0.5955567, 0.8117254, -0.6607996, 0, 0, 0, 1, 1,
0.5962117, -1.729018, 2.698284, 0, 0, 0, 1, 1,
0.600174, -0.5399169, 1.118044, 0, 0, 0, 1, 1,
0.6045012, -1.324408, 1.675633, 0, 0, 0, 1, 1,
0.6056582, -0.04096365, 0.4627388, 0, 0, 0, 1, 1,
0.6066993, -1.094887, 1.323286, 1, 1, 1, 1, 1,
0.6081897, -0.3563215, 1.245579, 1, 1, 1, 1, 1,
0.6097282, -1.353807, 4.488005, 1, 1, 1, 1, 1,
0.6099228, 2.37646, -0.2931013, 1, 1, 1, 1, 1,
0.6110414, -0.6691341, 2.065271, 1, 1, 1, 1, 1,
0.6139696, 1.593994, 0.3764438, 1, 1, 1, 1, 1,
0.6249231, 2.234117, 0.5464001, 1, 1, 1, 1, 1,
0.6282848, 2.79766, 1.319661, 1, 1, 1, 1, 1,
0.6347538, -1.471462, 4.522648, 1, 1, 1, 1, 1,
0.6374813, -2.02723, 2.81634, 1, 1, 1, 1, 1,
0.637643, 0.5896864, 1.605427, 1, 1, 1, 1, 1,
0.6395895, 2.493919, 1.614253, 1, 1, 1, 1, 1,
0.6404946, 1.112375, 0.6441402, 1, 1, 1, 1, 1,
0.6419823, 0.3044189, 2.263849, 1, 1, 1, 1, 1,
0.6429669, -0.7422596, 2.072197, 1, 1, 1, 1, 1,
0.6455818, 0.4825839, 0.2853885, 0, 0, 1, 1, 1,
0.6465115, 0.121078, 0.2671196, 1, 0, 0, 1, 1,
0.6605238, -0.5776856, 3.802807, 1, 0, 0, 1, 1,
0.6606907, 0.3918224, 1.072774, 1, 0, 0, 1, 1,
0.6627127, 0.883237, 1.040682, 1, 0, 0, 1, 1,
0.6704486, -0.5484167, 1.561946, 1, 0, 0, 1, 1,
0.6721979, -1.200115, 3.943935, 0, 0, 0, 1, 1,
0.673837, -0.6590625, 1.667423, 0, 0, 0, 1, 1,
0.6751782, 0.9665204, 2.188958, 0, 0, 0, 1, 1,
0.677542, 1.786237, 0.5891437, 0, 0, 0, 1, 1,
0.6777608, 1.54404, -0.06384151, 0, 0, 0, 1, 1,
0.6791596, 0.4929654, 1.29572, 0, 0, 0, 1, 1,
0.6960363, -0.3551266, 1.236221, 0, 0, 0, 1, 1,
0.6964909, 1.036461, 0.360572, 1, 1, 1, 1, 1,
0.6992101, -0.08315226, 3.191133, 1, 1, 1, 1, 1,
0.704419, 0.1912441, 0.4748388, 1, 1, 1, 1, 1,
0.7049705, 1.04073, 1.292169, 1, 1, 1, 1, 1,
0.7052549, -0.1673376, 0.2985076, 1, 1, 1, 1, 1,
0.7120069, 0.7231292, 1.070081, 1, 1, 1, 1, 1,
0.7213504, -0.2383061, 1.176644, 1, 1, 1, 1, 1,
0.727834, 0.8062552, 1.263425, 1, 1, 1, 1, 1,
0.7323634, -0.1356291, 1.641925, 1, 1, 1, 1, 1,
0.7342712, 0.5194723, 2.606599, 1, 1, 1, 1, 1,
0.734315, 1.666157, 0.301811, 1, 1, 1, 1, 1,
0.7372462, 1.143337, 0.2476296, 1, 1, 1, 1, 1,
0.741838, 0.2018094, 1.628905, 1, 1, 1, 1, 1,
0.742722, -0.6338845, 2.28446, 1, 1, 1, 1, 1,
0.7451145, 0.08689868, 2.770896, 1, 1, 1, 1, 1,
0.7470604, 0.7329278, 1.399866, 0, 0, 1, 1, 1,
0.7548121, 2.602609, 0.2809399, 1, 0, 0, 1, 1,
0.7579796, -0.09773451, 1.973282, 1, 0, 0, 1, 1,
0.7593278, 2.106898, -0.2475549, 1, 0, 0, 1, 1,
0.7625183, -0.940005, 2.29279, 1, 0, 0, 1, 1,
0.7680228, -0.3226212, 1.206679, 1, 0, 0, 1, 1,
0.7707145, -2.79132, 4.346539, 0, 0, 0, 1, 1,
0.773472, -1.022833, 0.9284274, 0, 0, 0, 1, 1,
0.7737278, 0.2892467, 1.191148, 0, 0, 0, 1, 1,
0.7792535, -1.050528, 3.879122, 0, 0, 0, 1, 1,
0.784637, 0.2047248, 0.08411317, 0, 0, 0, 1, 1,
0.7866947, 0.3208045, 1.709486, 0, 0, 0, 1, 1,
0.7867939, 1.035829, 0.1056069, 0, 0, 0, 1, 1,
0.7918617, -0.3193772, 1.163142, 1, 1, 1, 1, 1,
0.7959468, -0.1869927, 0.6358948, 1, 1, 1, 1, 1,
0.7984281, -0.02112048, -0.1212156, 1, 1, 1, 1, 1,
0.8034204, 1.587531, -2.116731, 1, 1, 1, 1, 1,
0.806507, -0.5478393, 4.059344, 1, 1, 1, 1, 1,
0.809685, 1.804112, 1.084648, 1, 1, 1, 1, 1,
0.8099827, 0.5443312, 0.8941196, 1, 1, 1, 1, 1,
0.8126479, -1.507523, 3.323626, 1, 1, 1, 1, 1,
0.813515, -0.5059651, 1.597761, 1, 1, 1, 1, 1,
0.8160111, 0.6355392, 0.9019156, 1, 1, 1, 1, 1,
0.816281, -0.7314687, -0.1335435, 1, 1, 1, 1, 1,
0.8253635, -0.3829574, 1.574845, 1, 1, 1, 1, 1,
0.8259602, 1.716662, -0.4309198, 1, 1, 1, 1, 1,
0.8261954, 2.275354, 0.4922574, 1, 1, 1, 1, 1,
0.8328098, -0.5166122, 2.452962, 1, 1, 1, 1, 1,
0.835797, -2.630925, 2.421603, 0, 0, 1, 1, 1,
0.8388332, -0.4526471, 0.5182224, 1, 0, 0, 1, 1,
0.8425055, -0.5491852, 2.51199, 1, 0, 0, 1, 1,
0.8498836, -0.09855216, 2.376222, 1, 0, 0, 1, 1,
0.8539246, 0.359517, 2.101754, 1, 0, 0, 1, 1,
0.8577543, -0.7277066, 3.323992, 1, 0, 0, 1, 1,
0.8617751, 0.3811367, 1.545742, 0, 0, 0, 1, 1,
0.8621883, -1.811348, 4.246664, 0, 0, 0, 1, 1,
0.8668257, -0.4526351, 2.21194, 0, 0, 0, 1, 1,
0.8702195, 1.536368, -0.4337406, 0, 0, 0, 1, 1,
0.8708872, -0.1504969, 0.9386632, 0, 0, 0, 1, 1,
0.8725377, 1.861545, 1.642644, 0, 0, 0, 1, 1,
0.8790839, -0.5349926, 0.05297984, 0, 0, 0, 1, 1,
0.8801057, -0.6640028, 3.410675, 1, 1, 1, 1, 1,
0.8830408, -0.6791677, 3.152279, 1, 1, 1, 1, 1,
0.8885573, -1.303401, 0.6600208, 1, 1, 1, 1, 1,
0.8937485, 1.237113, -0.8495944, 1, 1, 1, 1, 1,
0.8988189, 0.1944181, 1.81085, 1, 1, 1, 1, 1,
0.8995879, -0.3385995, 1.853617, 1, 1, 1, 1, 1,
0.9013726, -1.025353, 2.383932, 1, 1, 1, 1, 1,
0.9069356, -1.696768, 3.131207, 1, 1, 1, 1, 1,
0.9100122, -0.8860813, 2.463226, 1, 1, 1, 1, 1,
0.9108173, -1.081906, 2.925331, 1, 1, 1, 1, 1,
0.9121213, -0.1503046, 1.278685, 1, 1, 1, 1, 1,
0.9209955, 1.581052, 1.486201, 1, 1, 1, 1, 1,
0.9236891, 0.7039961, 0.8329641, 1, 1, 1, 1, 1,
0.926926, -0.6157656, 2.827986, 1, 1, 1, 1, 1,
0.9394242, -0.20883, -0.04959696, 1, 1, 1, 1, 1,
0.9405383, 0.02944313, 2.119821, 0, 0, 1, 1, 1,
0.9438503, 0.2770143, 1.761422, 1, 0, 0, 1, 1,
0.9554854, -1.502311, 1.956994, 1, 0, 0, 1, 1,
0.9613894, -1.087394, 2.779332, 1, 0, 0, 1, 1,
0.9661261, 0.01615067, 0.7327643, 1, 0, 0, 1, 1,
0.9768243, -0.1466357, 2.053946, 1, 0, 0, 1, 1,
0.9807175, 1.042534, 1.117514, 0, 0, 0, 1, 1,
0.9878519, -1.628924, 3.053584, 0, 0, 0, 1, 1,
0.9882261, -0.6198537, 2.721007, 0, 0, 0, 1, 1,
0.9888148, -0.7106628, 4.481407, 0, 0, 0, 1, 1,
0.9905365, -0.7614793, 3.011334, 0, 0, 0, 1, 1,
0.9954307, -0.6699599, 1.899833, 0, 0, 0, 1, 1,
0.9973623, -1.682111, 2.979942, 0, 0, 0, 1, 1,
0.9997044, -0.7289501, 4.460866, 1, 1, 1, 1, 1,
1.002427, 0.001263612, 0.3484661, 1, 1, 1, 1, 1,
1.003203, -0.9364493, 1.69082, 1, 1, 1, 1, 1,
1.00525, 0.4212791, 0.8976791, 1, 1, 1, 1, 1,
1.00658, -1.11988, 0.6371101, 1, 1, 1, 1, 1,
1.008645, 0.6514721, 0.06499558, 1, 1, 1, 1, 1,
1.010262, 1.55052, 0.7846574, 1, 1, 1, 1, 1,
1.017513, -0.2974321, 2.110456, 1, 1, 1, 1, 1,
1.026489, -1.376798, 2.197644, 1, 1, 1, 1, 1,
1.031176, -0.3953141, 2.126704, 1, 1, 1, 1, 1,
1.031281, 0.10387, 2.139818, 1, 1, 1, 1, 1,
1.031901, -1.461106, 3.873904, 1, 1, 1, 1, 1,
1.037545, -1.050472, 2.485047, 1, 1, 1, 1, 1,
1.037912, -0.09823924, 2.527333, 1, 1, 1, 1, 1,
1.046414, 2.713076, -0.4633573, 1, 1, 1, 1, 1,
1.051269, -0.4329934, 2.501649, 0, 0, 1, 1, 1,
1.054048, 0.5088827, 0.8926208, 1, 0, 0, 1, 1,
1.05545, -0.6758989, 0.6900557, 1, 0, 0, 1, 1,
1.055489, -0.6908835, 3.500863, 1, 0, 0, 1, 1,
1.059584, -0.2692933, 1.975331, 1, 0, 0, 1, 1,
1.062325, 1.168799, 1.227057, 1, 0, 0, 1, 1,
1.068278, 0.002156526, 0.4360213, 0, 0, 0, 1, 1,
1.072943, -0.7655491, 1.689297, 0, 0, 0, 1, 1,
1.074673, -0.6340225, 2.08143, 0, 0, 0, 1, 1,
1.078075, -1.280415, 2.987435, 0, 0, 0, 1, 1,
1.078725, -0.1346105, 2.836231, 0, 0, 0, 1, 1,
1.093349, 0.7291068, 1.698119, 0, 0, 0, 1, 1,
1.09572, -0.595826, 4.35464, 0, 0, 0, 1, 1,
1.097744, -1.173138, 1.907342, 1, 1, 1, 1, 1,
1.099193, 0.9746122, -0.3700017, 1, 1, 1, 1, 1,
1.101736, 0.2429002, 2.751471, 1, 1, 1, 1, 1,
1.104198, 1.298198, 2.792647, 1, 1, 1, 1, 1,
1.107884, 0.08056683, 1.045144, 1, 1, 1, 1, 1,
1.109499, -1.253006, 0.1875559, 1, 1, 1, 1, 1,
1.110628, 0.9541554, 1.212205, 1, 1, 1, 1, 1,
1.113921, -0.9398982, 3.064231, 1, 1, 1, 1, 1,
1.123279, 1.236945, 0.568085, 1, 1, 1, 1, 1,
1.125836, -0.8493229, 2.410915, 1, 1, 1, 1, 1,
1.127045, 0.6943003, -0.269912, 1, 1, 1, 1, 1,
1.127363, -0.08086505, 2.138569, 1, 1, 1, 1, 1,
1.129904, 0.4398889, -0.3140776, 1, 1, 1, 1, 1,
1.137763, -0.1258051, 0.1836213, 1, 1, 1, 1, 1,
1.138186, -1.005212, 3.07144, 1, 1, 1, 1, 1,
1.143822, 0.5327891, 2.878553, 0, 0, 1, 1, 1,
1.145187, -0.5850712, 0.9204418, 1, 0, 0, 1, 1,
1.147539, 0.4971535, 3.501891, 1, 0, 0, 1, 1,
1.154988, -2.594448, 4.013268, 1, 0, 0, 1, 1,
1.156479, 0.5733452, 1.375972, 1, 0, 0, 1, 1,
1.160128, -0.001343238, 1.506476, 1, 0, 0, 1, 1,
1.162897, -0.4974447, 2.168544, 0, 0, 0, 1, 1,
1.164052, 0.3905807, 1.395734, 0, 0, 0, 1, 1,
1.164682, 0.7455742, 0.5162049, 0, 0, 0, 1, 1,
1.175932, -1.290595, 1.311805, 0, 0, 0, 1, 1,
1.18766, -1.540748, 2.75936, 0, 0, 0, 1, 1,
1.189563, 0.1833597, 1.493131, 0, 0, 0, 1, 1,
1.190767, 1.044896, 0.2630183, 0, 0, 0, 1, 1,
1.213736, 0.6953291, 0.9018216, 1, 1, 1, 1, 1,
1.213833, -0.04561947, 0.9855548, 1, 1, 1, 1, 1,
1.217485, -2.11736, 2.561928, 1, 1, 1, 1, 1,
1.221056, 0.9595443, -1.160495, 1, 1, 1, 1, 1,
1.223563, -0.07485642, 0.2778979, 1, 1, 1, 1, 1,
1.225362, 0.1741543, 1.465849, 1, 1, 1, 1, 1,
1.229081, 1.297795, 0.8458849, 1, 1, 1, 1, 1,
1.229751, 0.519986, 0.4299681, 1, 1, 1, 1, 1,
1.236477, 1.359846, 1.135806, 1, 1, 1, 1, 1,
1.24064, -0.2686809, 3.735654, 1, 1, 1, 1, 1,
1.24177, 0.8924973, 0.6506633, 1, 1, 1, 1, 1,
1.2426, 1.934976, 2.047146, 1, 1, 1, 1, 1,
1.253589, -1.111244, 2.771137, 1, 1, 1, 1, 1,
1.256768, -1.339961, 2.462007, 1, 1, 1, 1, 1,
1.26038, 0.3751858, 2.321649, 1, 1, 1, 1, 1,
1.26204, -1.011736, 1.303951, 0, 0, 1, 1, 1,
1.266779, 0.04052776, 1.851979, 1, 0, 0, 1, 1,
1.281018, 1.435079, -1.342616, 1, 0, 0, 1, 1,
1.287456, -1.817494, 3.839413, 1, 0, 0, 1, 1,
1.288362, -0.8485042, 2.04301, 1, 0, 0, 1, 1,
1.310042, -0.6549009, 4.035079, 1, 0, 0, 1, 1,
1.310271, 0.6639752, 0.07622848, 0, 0, 0, 1, 1,
1.31436, 0.2999308, 1.11383, 0, 0, 0, 1, 1,
1.321268, 0.1474794, 1.135712, 0, 0, 0, 1, 1,
1.330369, 0.005485505, 0.2821347, 0, 0, 0, 1, 1,
1.342989, -1.653398, 3.901293, 0, 0, 0, 1, 1,
1.351264, -0.167974, 2.003862, 0, 0, 0, 1, 1,
1.351762, 0.3244555, -1.511524, 0, 0, 0, 1, 1,
1.355064, 1.472939, 1.466551, 1, 1, 1, 1, 1,
1.3558, -1.452085, 2.831151, 1, 1, 1, 1, 1,
1.361551, 2.746262, -1.605885, 1, 1, 1, 1, 1,
1.370095, -1.34839, 4.018582, 1, 1, 1, 1, 1,
1.377094, -0.8627259, 1.694222, 1, 1, 1, 1, 1,
1.382028, -0.9208847, 2.837823, 1, 1, 1, 1, 1,
1.385233, 0.03518018, 1.689921, 1, 1, 1, 1, 1,
1.41557, -0.03863012, 2.266493, 1, 1, 1, 1, 1,
1.418447, 0.502775, 1.419129, 1, 1, 1, 1, 1,
1.431058, -0.78325, 2.958539, 1, 1, 1, 1, 1,
1.44852, 0.2795474, 1.756347, 1, 1, 1, 1, 1,
1.449796, 1.313467, 1.797804, 1, 1, 1, 1, 1,
1.454123, 0.4103155, 2.087161, 1, 1, 1, 1, 1,
1.454414, 1.558438, 0.5699767, 1, 1, 1, 1, 1,
1.46323, 0.2278034, 1.178216, 1, 1, 1, 1, 1,
1.468823, 0.8622464, 0.8267096, 0, 0, 1, 1, 1,
1.494802, -2.858874, 3.72837, 1, 0, 0, 1, 1,
1.502769, 0.6258877, 1.375413, 1, 0, 0, 1, 1,
1.507762, -0.1350238, 2.400007, 1, 0, 0, 1, 1,
1.508574, -1.140106, 0.280422, 1, 0, 0, 1, 1,
1.509073, 0.2060565, 0.4445597, 1, 0, 0, 1, 1,
1.517776, -0.7457674, 4.289393, 0, 0, 0, 1, 1,
1.524203, -0.01235915, 0.1131655, 0, 0, 0, 1, 1,
1.526277, -0.1949303, -0.08789252, 0, 0, 0, 1, 1,
1.526375, -0.2671871, 1.207952, 0, 0, 0, 1, 1,
1.526533, -0.02531674, 1.218332, 0, 0, 0, 1, 1,
1.528343, -1.181593, 2.879338, 0, 0, 0, 1, 1,
1.535777, -1.203874, 2.786264, 0, 0, 0, 1, 1,
1.536384, 0.394596, 1.877673, 1, 1, 1, 1, 1,
1.538517, -1.631834, 3.272602, 1, 1, 1, 1, 1,
1.541921, 1.79576, 1.794159, 1, 1, 1, 1, 1,
1.544273, 0.6296032, 0.05427422, 1, 1, 1, 1, 1,
1.553272, 0.3995637, 1.143778, 1, 1, 1, 1, 1,
1.562847, -0.5306689, 2.959995, 1, 1, 1, 1, 1,
1.56432, 0.3932861, 1.67987, 1, 1, 1, 1, 1,
1.574472, 0.3861278, 0.9428343, 1, 1, 1, 1, 1,
1.576483, -1.86114, 5.250148, 1, 1, 1, 1, 1,
1.584562, 1.217565, 0.6336049, 1, 1, 1, 1, 1,
1.590662, 1.173298, 0.9818673, 1, 1, 1, 1, 1,
1.600641, -0.4042776, 2.579139, 1, 1, 1, 1, 1,
1.610427, -0.03246818, -0.4204855, 1, 1, 1, 1, 1,
1.624514, -1.97042, 1.946885, 1, 1, 1, 1, 1,
1.626068, -0.5587652, -1.043656, 1, 1, 1, 1, 1,
1.631292, -1.518832, 2.893787, 0, 0, 1, 1, 1,
1.647894, 0.1179904, 1.076934, 1, 0, 0, 1, 1,
1.64976, -0.5639263, 3.350001, 1, 0, 0, 1, 1,
1.651185, -1.1186, 3.691232, 1, 0, 0, 1, 1,
1.654192, -0.1793487, 3.074084, 1, 0, 0, 1, 1,
1.68217, -1.816453, 1.771207, 1, 0, 0, 1, 1,
1.699258, 0.332321, 2.267249, 0, 0, 0, 1, 1,
1.70077, -0.5126882, 1.405579, 0, 0, 0, 1, 1,
1.710407, 0.1770153, 1.809752, 0, 0, 0, 1, 1,
1.71809, 0.3432682, 0.2716325, 0, 0, 0, 1, 1,
1.719694, 0.1220859, 0.002653694, 0, 0, 0, 1, 1,
1.750946, 1.539821, -0.4580083, 0, 0, 0, 1, 1,
1.764549, -0.6852465, -0.4698549, 0, 0, 0, 1, 1,
1.769407, 0.505794, 2.203661, 1, 1, 1, 1, 1,
1.78014, -0.6285565, 1.818724, 1, 1, 1, 1, 1,
1.788763, 0.3301405, 1.472684, 1, 1, 1, 1, 1,
1.802689, 0.1244694, 1.787296, 1, 1, 1, 1, 1,
1.802727, 1.690549, -0.9233375, 1, 1, 1, 1, 1,
1.807956, 0.9463099, 2.190153, 1, 1, 1, 1, 1,
1.80902, 0.9285492, 3.974365, 1, 1, 1, 1, 1,
1.82293, 0.7943781, 1.196482, 1, 1, 1, 1, 1,
1.826047, 0.05470245, 3.196548, 1, 1, 1, 1, 1,
1.833954, 0.6167303, 0.6240581, 1, 1, 1, 1, 1,
1.854414, -0.7565583, 2.12769, 1, 1, 1, 1, 1,
1.870461, 1.011155, 2.432038, 1, 1, 1, 1, 1,
1.876897, 1.043071, 3.54082, 1, 1, 1, 1, 1,
1.929787, -2.232008, 1.508361, 1, 1, 1, 1, 1,
1.950561, 0.03567797, 2.015927, 1, 1, 1, 1, 1,
1.976979, 2.022212, 0.7910538, 0, 0, 1, 1, 1,
1.992165, -0.4540276, 3.454669, 1, 0, 0, 1, 1,
2.037573, 0.2287564, 2.942252, 1, 0, 0, 1, 1,
2.059375, 0.2862636, 3.870087, 1, 0, 0, 1, 1,
2.07497, -1.810921, 2.258344, 1, 0, 0, 1, 1,
2.077784, 0.7192568, 0.9506515, 1, 0, 0, 1, 1,
2.104105, 0.04724021, 1.750192, 0, 0, 0, 1, 1,
2.11472, -0.8798277, 1.439691, 0, 0, 0, 1, 1,
2.121559, -1.186209, 3.350127, 0, 0, 0, 1, 1,
2.274985, 0.976294, 2.037176, 0, 0, 0, 1, 1,
2.303268, 1.548609, 1.079044, 0, 0, 0, 1, 1,
2.319815, 1.30493, 1.83709, 0, 0, 0, 1, 1,
2.331569, 0.1765786, 0.8460957, 0, 0, 0, 1, 1,
2.364584, -0.9652499, 1.813217, 1, 1, 1, 1, 1,
2.382285, -0.04163706, 1.802244, 1, 1, 1, 1, 1,
2.406254, -0.5582168, 3.42004, 1, 1, 1, 1, 1,
2.424672, 0.6016073, 0.4770016, 1, 1, 1, 1, 1,
2.709596, 0.197451, 1.922683, 1, 1, 1, 1, 1,
2.855363, -0.1133363, 1.151981, 1, 1, 1, 1, 1,
3.095177, 0.9640409, 0.2474188, 1, 1, 1, 1, 1
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
var radius = 9.282831;
var distance = 32.60555;
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
mvMatrix.translate( 0.1517153, 0.03060699, -0.04338193 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.60555);
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
