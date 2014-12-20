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
-3.05738, -0.4252883, -2.043567, 1, 0, 0, 1,
-3.007141, 1.044215, -0.4872752, 1, 0.007843138, 0, 1,
-2.954649, 0.8965563, 0.3508657, 1, 0.01176471, 0, 1,
-2.600026, -0.1217928, -2.02003, 1, 0.01960784, 0, 1,
-2.463239, 0.4213069, -1.884441, 1, 0.02352941, 0, 1,
-2.281755, 2.523309, -0.5561094, 1, 0.03137255, 0, 1,
-2.243221, 0.8555914, -0.1909538, 1, 0.03529412, 0, 1,
-2.178378, 0.3782282, -0.7867554, 1, 0.04313726, 0, 1,
-2.159346, 2.664448, 0.3647361, 1, 0.04705882, 0, 1,
-2.042393, 1.829989, -1.604547, 1, 0.05490196, 0, 1,
-2.034199, 0.9673179, 0.03797314, 1, 0.05882353, 0, 1,
-1.976712, 1.732757, -1.289991, 1, 0.06666667, 0, 1,
-1.947353, 0.4638222, -3.03096, 1, 0.07058824, 0, 1,
-1.939837, -0.8314024, -2.75049, 1, 0.07843138, 0, 1,
-1.912995, -0.5064008, -2.929125, 1, 0.08235294, 0, 1,
-1.909792, 0.2162317, -2.959473, 1, 0.09019608, 0, 1,
-1.874353, 1.117212, -2.504993, 1, 0.09411765, 0, 1,
-1.870425, -0.2606624, -1.876948, 1, 0.1019608, 0, 1,
-1.862785, -0.4828778, -0.6133891, 1, 0.1098039, 0, 1,
-1.84015, -1.236709, -1.568833, 1, 0.1137255, 0, 1,
-1.836548, 1.501133, -0.9756285, 1, 0.1215686, 0, 1,
-1.816018, -0.3876734, -2.218808, 1, 0.1254902, 0, 1,
-1.784212, 0.8074652, 0.4694437, 1, 0.1333333, 0, 1,
-1.78103, 1.470143, -2.199099, 1, 0.1372549, 0, 1,
-1.772672, 0.05883852, -0.01035305, 1, 0.145098, 0, 1,
-1.772119, -1.951959, -4.726088, 1, 0.1490196, 0, 1,
-1.770439, 0.4019088, -1.245676, 1, 0.1568628, 0, 1,
-1.766483, 2.238967, -0.4703609, 1, 0.1607843, 0, 1,
-1.723256, 1.007886, 0.9713098, 1, 0.1686275, 0, 1,
-1.718958, 0.4202203, -1.455028, 1, 0.172549, 0, 1,
-1.71383, 0.7476156, -1.077215, 1, 0.1803922, 0, 1,
-1.702044, 0.003310847, -2.427847, 1, 0.1843137, 0, 1,
-1.691363, -1.012949, -1.965861, 1, 0.1921569, 0, 1,
-1.689902, 0.2605816, -3.49574, 1, 0.1960784, 0, 1,
-1.677817, -0.4163332, -1.127624, 1, 0.2039216, 0, 1,
-1.659646, 0.02878367, -2.73197, 1, 0.2117647, 0, 1,
-1.656446, -0.3314144, -2.086088, 1, 0.2156863, 0, 1,
-1.646499, -0.2620473, -2.398939, 1, 0.2235294, 0, 1,
-1.636613, -0.2269437, -2.439523, 1, 0.227451, 0, 1,
-1.627177, -0.2764547, -3.563244, 1, 0.2352941, 0, 1,
-1.620004, 0.1932022, -2.577014, 1, 0.2392157, 0, 1,
-1.612996, 1.114351, -0.1343261, 1, 0.2470588, 0, 1,
-1.612539, 0.2553809, -1.505335, 1, 0.2509804, 0, 1,
-1.606385, 0.6145017, -2.183311, 1, 0.2588235, 0, 1,
-1.601871, -0.103845, -1.30112, 1, 0.2627451, 0, 1,
-1.600869, -0.573056, -3.956556, 1, 0.2705882, 0, 1,
-1.599237, -1.320894, -1.58223, 1, 0.2745098, 0, 1,
-1.583521, 1.461951, 0.05161157, 1, 0.282353, 0, 1,
-1.572452, 1.197078, 1.269611, 1, 0.2862745, 0, 1,
-1.5513, 1.904019, -0.5932571, 1, 0.2941177, 0, 1,
-1.550894, 0.5984873, -1.369214, 1, 0.3019608, 0, 1,
-1.550264, 0.284513, -1.904009, 1, 0.3058824, 0, 1,
-1.534987, 0.457085, 0.2673458, 1, 0.3137255, 0, 1,
-1.534337, 0.2847615, -1.1261, 1, 0.3176471, 0, 1,
-1.511471, -0.1849652, -0.4783384, 1, 0.3254902, 0, 1,
-1.501456, -0.3416837, -2.317202, 1, 0.3294118, 0, 1,
-1.496404, 0.2691186, -2.089454, 1, 0.3372549, 0, 1,
-1.495937, -0.2185132, -3.992985, 1, 0.3411765, 0, 1,
-1.494558, -1.416711, -2.445269, 1, 0.3490196, 0, 1,
-1.49305, -0.6427242, -0.1891934, 1, 0.3529412, 0, 1,
-1.482928, -1.085961, -3.205369, 1, 0.3607843, 0, 1,
-1.475928, 1.001315, -1.107405, 1, 0.3647059, 0, 1,
-1.475482, 0.3730586, -1.894833, 1, 0.372549, 0, 1,
-1.462089, 0.1643354, -0.1228304, 1, 0.3764706, 0, 1,
-1.441802, -1.025423, -2.366673, 1, 0.3843137, 0, 1,
-1.440416, -0.2089369, -1.0367, 1, 0.3882353, 0, 1,
-1.434541, 1.038278, -2.25206, 1, 0.3960784, 0, 1,
-1.434334, -0.1891899, -1.497404, 1, 0.4039216, 0, 1,
-1.427904, 0.2247769, -1.448158, 1, 0.4078431, 0, 1,
-1.420806, 1.018021, -1.386002, 1, 0.4156863, 0, 1,
-1.41073, -0.45201, -2.739128, 1, 0.4196078, 0, 1,
-1.403405, 0.8826256, -1.36762, 1, 0.427451, 0, 1,
-1.374926, 0.1919664, -1.810502, 1, 0.4313726, 0, 1,
-1.368543, 0.7502852, 0.257747, 1, 0.4392157, 0, 1,
-1.365326, -0.1275359, -2.50867, 1, 0.4431373, 0, 1,
-1.364939, 1.078398, -1.597038, 1, 0.4509804, 0, 1,
-1.362343, 1.246239, -1.974645, 1, 0.454902, 0, 1,
-1.351323, -0.5594549, -1.5668, 1, 0.4627451, 0, 1,
-1.35041, -1.667907, -3.437165, 1, 0.4666667, 0, 1,
-1.347747, 0.6612363, -1.291932, 1, 0.4745098, 0, 1,
-1.343644, -1.196793, -1.247577, 1, 0.4784314, 0, 1,
-1.342289, -0.4852321, -2.250681, 1, 0.4862745, 0, 1,
-1.339469, 0.9099208, -0.8091937, 1, 0.4901961, 0, 1,
-1.333752, -1.347936, -2.6927, 1, 0.4980392, 0, 1,
-1.325105, 1.403856, -2.077346, 1, 0.5058824, 0, 1,
-1.319501, 0.00464885, -1.880593, 1, 0.509804, 0, 1,
-1.313321, 0.1368086, -0.5914974, 1, 0.5176471, 0, 1,
-1.311759, -1.677078, -2.977914, 1, 0.5215687, 0, 1,
-1.305534, -0.3436414, -1.521305, 1, 0.5294118, 0, 1,
-1.300812, 1.538448, -0.9045671, 1, 0.5333334, 0, 1,
-1.300513, -0.606877, -2.327536, 1, 0.5411765, 0, 1,
-1.296354, -0.6420118, -1.671062, 1, 0.5450981, 0, 1,
-1.291351, -0.9344232, -4.469169, 1, 0.5529412, 0, 1,
-1.283427, -1.552939, -2.672251, 1, 0.5568628, 0, 1,
-1.282729, 1.311668, -0.5393492, 1, 0.5647059, 0, 1,
-1.280015, -1.545612, -3.381962, 1, 0.5686275, 0, 1,
-1.278556, 0.3380779, -0.6546589, 1, 0.5764706, 0, 1,
-1.277769, -0.8021482, -2.568487, 1, 0.5803922, 0, 1,
-1.270469, -1.717841, -1.739122, 1, 0.5882353, 0, 1,
-1.266264, -0.8810415, -3.530816, 1, 0.5921569, 0, 1,
-1.265326, -0.4745845, -0.5933868, 1, 0.6, 0, 1,
-1.261474, -0.5821301, -2.173369, 1, 0.6078432, 0, 1,
-1.246885, -0.1043246, -0.9882019, 1, 0.6117647, 0, 1,
-1.240312, -1.264288, -2.353795, 1, 0.6196079, 0, 1,
-1.235552, -1.4633, 1.008194, 1, 0.6235294, 0, 1,
-1.234188, -0.9049709, -2.811223, 1, 0.6313726, 0, 1,
-1.23329, 0.2675836, -0.7504455, 1, 0.6352941, 0, 1,
-1.230612, 0.5130617, -1.243691, 1, 0.6431373, 0, 1,
-1.229036, -0.709727, -3.065538, 1, 0.6470588, 0, 1,
-1.227032, -0.02062952, -1.152986, 1, 0.654902, 0, 1,
-1.224402, -1.026186, -2.141166, 1, 0.6588235, 0, 1,
-1.212721, 0.131278, -1.876793, 1, 0.6666667, 0, 1,
-1.204307, -1.30937, -1.988739, 1, 0.6705883, 0, 1,
-1.192591, 0.2727688, -3.11101, 1, 0.6784314, 0, 1,
-1.192145, -1.222908, -1.453984, 1, 0.682353, 0, 1,
-1.187406, 0.1565272, -2.208875, 1, 0.6901961, 0, 1,
-1.18657, -0.1400051, -1.978437, 1, 0.6941177, 0, 1,
-1.184726, -0.3566273, -1.513923, 1, 0.7019608, 0, 1,
-1.171493, -1.586956, -3.762921, 1, 0.7098039, 0, 1,
-1.1709, -0.3032264, -2.12812, 1, 0.7137255, 0, 1,
-1.17054, 0.5727428, -2.71786, 1, 0.7215686, 0, 1,
-1.169323, -1.159979, -2.71235, 1, 0.7254902, 0, 1,
-1.16564, -0.1576182, -1.519857, 1, 0.7333333, 0, 1,
-1.164582, 0.9206761, -2.460453, 1, 0.7372549, 0, 1,
-1.160538, 0.3947605, -1.246157, 1, 0.7450981, 0, 1,
-1.149863, 1.972003, -1.973673, 1, 0.7490196, 0, 1,
-1.148716, -1.070024, -2.639724, 1, 0.7568628, 0, 1,
-1.1448, -0.02201102, -2.09078, 1, 0.7607843, 0, 1,
-1.139818, 0.9581814, -0.7142212, 1, 0.7686275, 0, 1,
-1.138746, -0.212823, -2.007581, 1, 0.772549, 0, 1,
-1.137837, -0.8312771, -2.796793, 1, 0.7803922, 0, 1,
-1.135618, 1.882116, 0.2053719, 1, 0.7843137, 0, 1,
-1.132212, -1.202127, -5.628752, 1, 0.7921569, 0, 1,
-1.129637, 0.2204972, -0.2688712, 1, 0.7960784, 0, 1,
-1.128204, -0.03698157, -1.564263, 1, 0.8039216, 0, 1,
-1.117776, -1.485121, -2.697564, 1, 0.8117647, 0, 1,
-1.107513, 0.6277729, -1.600895, 1, 0.8156863, 0, 1,
-1.105578, 0.9156734, 0.5142719, 1, 0.8235294, 0, 1,
-1.10283, 1.574352, 0.7217532, 1, 0.827451, 0, 1,
-1.093812, -0.3974737, -2.876267, 1, 0.8352941, 0, 1,
-1.086423, 0.6281597, 0.1617077, 1, 0.8392157, 0, 1,
-1.079708, -0.5895769, -2.117301, 1, 0.8470588, 0, 1,
-1.073425, -1.106657, -3.093234, 1, 0.8509804, 0, 1,
-1.072374, 0.7958466, -0.7053925, 1, 0.8588235, 0, 1,
-1.071953, 0.7714093, -1.561953, 1, 0.8627451, 0, 1,
-1.069829, -0.6614698, -2.02001, 1, 0.8705882, 0, 1,
-1.068977, 1.151929, 1.354939, 1, 0.8745098, 0, 1,
-1.067183, 0.06472339, 0.6393553, 1, 0.8823529, 0, 1,
-1.06343, 0.5707292, -0.7150402, 1, 0.8862745, 0, 1,
-1.062233, 0.3607207, -1.775807, 1, 0.8941177, 0, 1,
-1.059301, -0.8524659, -3.384814, 1, 0.8980392, 0, 1,
-1.048043, -1.14204, -0.7081251, 1, 0.9058824, 0, 1,
-1.044469, -1.341702, -2.195513, 1, 0.9137255, 0, 1,
-1.041253, -0.8256866, -2.142798, 1, 0.9176471, 0, 1,
-1.040762, 1.014367, -2.366602, 1, 0.9254902, 0, 1,
-1.039648, 0.5818521, -2.129614, 1, 0.9294118, 0, 1,
-1.038357, -0.4074928, -1.429308, 1, 0.9372549, 0, 1,
-1.035699, 0.5174195, -1.823932, 1, 0.9411765, 0, 1,
-1.027684, 1.073852, -2.12109, 1, 0.9490196, 0, 1,
-1.020698, 0.5841218, -1.808616, 1, 0.9529412, 0, 1,
-1.008889, 0.4791693, -1.669929, 1, 0.9607843, 0, 1,
-1.004133, 1.144024, 1.458449, 1, 0.9647059, 0, 1,
-0.9970904, 0.8179532, -2.018907, 1, 0.972549, 0, 1,
-0.9898219, -0.3244149, -2.477154, 1, 0.9764706, 0, 1,
-0.9894917, -1.383406, -1.327768, 1, 0.9843137, 0, 1,
-0.9802793, 0.7104781, -1.854598, 1, 0.9882353, 0, 1,
-0.9773952, -1.500512, -3.65173, 1, 0.9960784, 0, 1,
-0.975776, 1.039829, -0.6058218, 0.9960784, 1, 0, 1,
-0.9712843, -0.5731946, -1.696593, 0.9921569, 1, 0, 1,
-0.9649918, -0.1582391, -0.424826, 0.9843137, 1, 0, 1,
-0.963814, -0.7550101, -1.397951, 0.9803922, 1, 0, 1,
-0.9626822, -2.6688, -2.41099, 0.972549, 1, 0, 1,
-0.9573235, -0.7397896, -3.503908, 0.9686275, 1, 0, 1,
-0.9537103, -0.1810539, -1.019498, 0.9607843, 1, 0, 1,
-0.952043, -0.940941, -1.948233, 0.9568627, 1, 0, 1,
-0.9413052, 0.9696608, -1.634109, 0.9490196, 1, 0, 1,
-0.9377567, 1.892369, -0.4124388, 0.945098, 1, 0, 1,
-0.9364934, -0.7795832, -3.984439, 0.9372549, 1, 0, 1,
-0.9337924, 0.7041571, -1.60682, 0.9333333, 1, 0, 1,
-0.9227695, -0.3957897, -2.995465, 0.9254902, 1, 0, 1,
-0.9226071, 0.8246478, -0.1935102, 0.9215686, 1, 0, 1,
-0.9027217, -0.364371, -2.112763, 0.9137255, 1, 0, 1,
-0.9026748, -0.5279543, -1.592257, 0.9098039, 1, 0, 1,
-0.9005591, -1.784024, -2.985331, 0.9019608, 1, 0, 1,
-0.8970179, 0.1061381, -0.6034948, 0.8941177, 1, 0, 1,
-0.891127, -0.09388745, -1.570633, 0.8901961, 1, 0, 1,
-0.8898615, -0.6328036, -1.219889, 0.8823529, 1, 0, 1,
-0.8885608, 0.7654928, -0.3216012, 0.8784314, 1, 0, 1,
-0.8824623, 0.3606752, -0.5017706, 0.8705882, 1, 0, 1,
-0.874332, 0.882654, 0.2266529, 0.8666667, 1, 0, 1,
-0.8674757, -1.607318, -4.04884, 0.8588235, 1, 0, 1,
-0.8652095, -0.05657686, -3.699616, 0.854902, 1, 0, 1,
-0.8646153, 0.7146588, -1.803123, 0.8470588, 1, 0, 1,
-0.8569866, 0.2067242, -0.4281001, 0.8431373, 1, 0, 1,
-0.8531954, -1.884884, -2.747295, 0.8352941, 1, 0, 1,
-0.8507003, -0.7756758, -1.724918, 0.8313726, 1, 0, 1,
-0.8457632, -1.401113, -3.061042, 0.8235294, 1, 0, 1,
-0.8435378, -0.2142735, -2.123114, 0.8196079, 1, 0, 1,
-0.8312899, -0.696345, -0.3189929, 0.8117647, 1, 0, 1,
-0.8257576, -0.4702353, -2.443667, 0.8078431, 1, 0, 1,
-0.8171551, 0.07595366, -3.537685, 0.8, 1, 0, 1,
-0.8140942, 0.320426, 0.3516581, 0.7921569, 1, 0, 1,
-0.8128875, -0.3976591, -2.478468, 0.7882353, 1, 0, 1,
-0.8114957, 1.722502, -0.6943235, 0.7803922, 1, 0, 1,
-0.8080053, 1.025986, -0.08973382, 0.7764706, 1, 0, 1,
-0.8025886, 0.6343302, -0.2102696, 0.7686275, 1, 0, 1,
-0.796633, 1.486683, -0.2661337, 0.7647059, 1, 0, 1,
-0.7954674, 0.4890481, -2.887322, 0.7568628, 1, 0, 1,
-0.7950006, 0.8707769, -1.504257, 0.7529412, 1, 0, 1,
-0.7945359, 1.479495, 0.7613621, 0.7450981, 1, 0, 1,
-0.7936998, -0.9315042, -2.179698, 0.7411765, 1, 0, 1,
-0.7912075, 0.9946656, -1.0266, 0.7333333, 1, 0, 1,
-0.7896889, -0.3729232, -0.4334894, 0.7294118, 1, 0, 1,
-0.7879775, 0.1427597, -1.262191, 0.7215686, 1, 0, 1,
-0.7849012, 1.605764, -1.076891, 0.7176471, 1, 0, 1,
-0.7791103, -0.8671515, -0.1366284, 0.7098039, 1, 0, 1,
-0.7770338, -0.2278962, -0.8677229, 0.7058824, 1, 0, 1,
-0.7758378, 0.450483, -1.375408, 0.6980392, 1, 0, 1,
-0.7624505, 0.1664476, -1.61819, 0.6901961, 1, 0, 1,
-0.7600891, 0.4117152, -0.3416886, 0.6862745, 1, 0, 1,
-0.7544997, -0.01488778, -1.621263, 0.6784314, 1, 0, 1,
-0.7543852, -0.2493358, -1.791029, 0.6745098, 1, 0, 1,
-0.7529103, 2.273909, 0.4648229, 0.6666667, 1, 0, 1,
-0.7500681, -1.944848, -4.993365, 0.6627451, 1, 0, 1,
-0.7440796, -0.0584114, -2.721493, 0.654902, 1, 0, 1,
-0.7413124, -1.004548, -2.072963, 0.6509804, 1, 0, 1,
-0.73886, 0.9232191, -0.03812339, 0.6431373, 1, 0, 1,
-0.7378802, 0.7940805, 0.4737302, 0.6392157, 1, 0, 1,
-0.735514, 0.9218456, 0.1811393, 0.6313726, 1, 0, 1,
-0.7349902, 2.407058, -0.9222521, 0.627451, 1, 0, 1,
-0.7340809, -0.1239136, -1.542121, 0.6196079, 1, 0, 1,
-0.7338091, -0.5822954, -2.874813, 0.6156863, 1, 0, 1,
-0.7335205, 0.2994417, -1.467036, 0.6078432, 1, 0, 1,
-0.7279161, 1.031378, -0.6456882, 0.6039216, 1, 0, 1,
-0.7227739, 0.3635207, -0.2894316, 0.5960785, 1, 0, 1,
-0.7153658, 0.4457365, -0.9638188, 0.5882353, 1, 0, 1,
-0.7109028, 0.1397302, -0.5722017, 0.5843138, 1, 0, 1,
-0.7036843, -0.01291296, -1.185128, 0.5764706, 1, 0, 1,
-0.7007421, 0.8481753, -0.4576035, 0.572549, 1, 0, 1,
-0.6998098, 0.1615379, -1.135928, 0.5647059, 1, 0, 1,
-0.6942488, -0.8572444, -1.853821, 0.5607843, 1, 0, 1,
-0.6934146, -0.8897358, -1.022531, 0.5529412, 1, 0, 1,
-0.6893905, 1.835699, -0.6730193, 0.5490196, 1, 0, 1,
-0.6860471, -0.8804945, -2.04363, 0.5411765, 1, 0, 1,
-0.6850732, 0.3776323, -2.59841, 0.5372549, 1, 0, 1,
-0.6809663, 0.8486896, -1.779821, 0.5294118, 1, 0, 1,
-0.6805157, -0.2546665, 0.6307259, 0.5254902, 1, 0, 1,
-0.6801803, 0.2832229, -1.038229, 0.5176471, 1, 0, 1,
-0.6777994, 0.5725112, -0.5599365, 0.5137255, 1, 0, 1,
-0.6773593, -0.8816336, -2.138649, 0.5058824, 1, 0, 1,
-0.6768754, -0.910755, -2.11178, 0.5019608, 1, 0, 1,
-0.6734879, -1.11821, -2.593594, 0.4941176, 1, 0, 1,
-0.6732219, 0.1255701, -0.9404133, 0.4862745, 1, 0, 1,
-0.6731842, 0.7075266, -1.352934, 0.4823529, 1, 0, 1,
-0.670341, -0.5229146, -4.415448, 0.4745098, 1, 0, 1,
-0.6701838, -1.980546, -2.513321, 0.4705882, 1, 0, 1,
-0.6660873, 0.1658657, -1.145036, 0.4627451, 1, 0, 1,
-0.6641067, 0.1922081, -0.4887368, 0.4588235, 1, 0, 1,
-0.6640699, 0.08364118, -1.582283, 0.4509804, 1, 0, 1,
-0.6627746, 0.8004265, -0.7330768, 0.4470588, 1, 0, 1,
-0.6613683, -0.6564675, -0.7069314, 0.4392157, 1, 0, 1,
-0.6504575, -0.5843082, -1.597201, 0.4352941, 1, 0, 1,
-0.644483, -0.7716013, -4.196933, 0.427451, 1, 0, 1,
-0.6432412, -0.4086407, -1.97951, 0.4235294, 1, 0, 1,
-0.6361238, -0.7104143, -3.272366, 0.4156863, 1, 0, 1,
-0.6352981, 0.5761542, -2.653297, 0.4117647, 1, 0, 1,
-0.6329297, -2.500947, -2.142545, 0.4039216, 1, 0, 1,
-0.6318293, 0.3663327, -1.739597, 0.3960784, 1, 0, 1,
-0.631143, 0.6354959, 0.265818, 0.3921569, 1, 0, 1,
-0.6235682, -2.766445, -4.48716, 0.3843137, 1, 0, 1,
-0.623192, 1.740848, -0.4178104, 0.3803922, 1, 0, 1,
-0.6213781, 0.2381322, -2.111816, 0.372549, 1, 0, 1,
-0.6122869, 0.09337333, -1.443864, 0.3686275, 1, 0, 1,
-0.6102743, 0.233601, 0.5841259, 0.3607843, 1, 0, 1,
-0.6091206, 1.999072, -0.4250448, 0.3568628, 1, 0, 1,
-0.6059509, 2.285708, -1.254169, 0.3490196, 1, 0, 1,
-0.6044148, -0.6504847, -2.151917, 0.345098, 1, 0, 1,
-0.5981296, 1.422565, -0.7084823, 0.3372549, 1, 0, 1,
-0.5979642, -0.6431385, -4.026756, 0.3333333, 1, 0, 1,
-0.5947031, -1.06972, -3.493807, 0.3254902, 1, 0, 1,
-0.5906659, -1.448114, -3.489367, 0.3215686, 1, 0, 1,
-0.5897085, -0.3251725, -1.532825, 0.3137255, 1, 0, 1,
-0.5886086, -0.6145787, -1.067344, 0.3098039, 1, 0, 1,
-0.5807036, 0.8788926, -3.348176, 0.3019608, 1, 0, 1,
-0.5765714, 0.1105601, -0.2451984, 0.2941177, 1, 0, 1,
-0.5755916, 0.7493487, -2.338063, 0.2901961, 1, 0, 1,
-0.5744155, 1.385555, -0.5869583, 0.282353, 1, 0, 1,
-0.5670588, 0.6055604, -0.4610117, 0.2784314, 1, 0, 1,
-0.5657717, -0.392354, -3.003544, 0.2705882, 1, 0, 1,
-0.565388, 0.2180908, 0.3009573, 0.2666667, 1, 0, 1,
-0.5635414, -0.5911332, -2.359318, 0.2588235, 1, 0, 1,
-0.5633554, -0.01039951, -1.620216, 0.254902, 1, 0, 1,
-0.5619485, -0.1841018, -0.9725467, 0.2470588, 1, 0, 1,
-0.5594114, -1.675505, -2.80408, 0.2431373, 1, 0, 1,
-0.5539318, 1.923472, -1.09473, 0.2352941, 1, 0, 1,
-0.5530667, 0.216275, -1.086755, 0.2313726, 1, 0, 1,
-0.5518188, 0.4459202, 0.6494025, 0.2235294, 1, 0, 1,
-0.5437458, -0.8876886, -0.8057068, 0.2196078, 1, 0, 1,
-0.5426044, -1.29011, -3.518027, 0.2117647, 1, 0, 1,
-0.5385085, 0.9816311, -1.311217, 0.2078431, 1, 0, 1,
-0.5289249, 0.1641981, -2.675594, 0.2, 1, 0, 1,
-0.5251347, -0.2253087, -1.908081, 0.1921569, 1, 0, 1,
-0.5240723, -2.358713, -4.487923, 0.1882353, 1, 0, 1,
-0.5209118, 1.296066, 0.1278722, 0.1803922, 1, 0, 1,
-0.5141401, 0.744054, -0.9772379, 0.1764706, 1, 0, 1,
-0.5112037, -0.07894706, -1.907393, 0.1686275, 1, 0, 1,
-0.5082172, -0.6511357, -1.409969, 0.1647059, 1, 0, 1,
-0.5071658, -0.220393, -0.6423164, 0.1568628, 1, 0, 1,
-0.5021846, 1.526967, -0.5760074, 0.1529412, 1, 0, 1,
-0.5018783, 0.4145398, -1.301019, 0.145098, 1, 0, 1,
-0.49542, 0.548013, -1.707605, 0.1411765, 1, 0, 1,
-0.495271, 1.250104, -1.505994, 0.1333333, 1, 0, 1,
-0.4890135, 0.1375655, 0.001036921, 0.1294118, 1, 0, 1,
-0.4880021, -0.8198056, -3.953726, 0.1215686, 1, 0, 1,
-0.4868561, 1.829999, 0.165044, 0.1176471, 1, 0, 1,
-0.4818372, -0.8630015, -4.422677, 0.1098039, 1, 0, 1,
-0.4815412, 0.7592181, 1.14266, 0.1058824, 1, 0, 1,
-0.4758384, 0.7920685, 0.2070182, 0.09803922, 1, 0, 1,
-0.4726966, 1.162162, -0.9174558, 0.09019608, 1, 0, 1,
-0.4716162, -1.18543, -3.563612, 0.08627451, 1, 0, 1,
-0.4682355, 1.062145, -0.6162258, 0.07843138, 1, 0, 1,
-0.4681529, 0.3332704, -0.4128368, 0.07450981, 1, 0, 1,
-0.4649747, 0.2184783, -0.1582272, 0.06666667, 1, 0, 1,
-0.4642727, -0.1587224, -0.5588272, 0.0627451, 1, 0, 1,
-0.463043, -0.6213915, -1.999326, 0.05490196, 1, 0, 1,
-0.4617034, -1.09926, -3.632201, 0.05098039, 1, 0, 1,
-0.4587089, -0.8589544, -1.108964, 0.04313726, 1, 0, 1,
-0.458157, 1.193893, -0.3059083, 0.03921569, 1, 0, 1,
-0.4565901, -1.9833, -1.207782, 0.03137255, 1, 0, 1,
-0.4522799, -0.5640766, -1.906191, 0.02745098, 1, 0, 1,
-0.448851, 0.5486109, 0.2137016, 0.01960784, 1, 0, 1,
-0.4482126, -0.4746654, -1.558399, 0.01568628, 1, 0, 1,
-0.4472901, 1.934984, -0.6645153, 0.007843138, 1, 0, 1,
-0.4460378, 0.1355447, -1.687651, 0.003921569, 1, 0, 1,
-0.4451762, -0.5661333, -0.9425531, 0, 1, 0.003921569, 1,
-0.4395573, -0.7456468, -2.73554, 0, 1, 0.01176471, 1,
-0.4351898, 0.5363849, -2.819688, 0, 1, 0.01568628, 1,
-0.4247938, 0.9556501, 0.9417258, 0, 1, 0.02352941, 1,
-0.4211585, -0.4526501, -0.7665577, 0, 1, 0.02745098, 1,
-0.4204359, -0.1388324, -1.918354, 0, 1, 0.03529412, 1,
-0.4161622, 0.7690715, -0.1969087, 0, 1, 0.03921569, 1,
-0.4152432, -0.1734467, -0.217738, 0, 1, 0.04705882, 1,
-0.4124565, -0.1531173, -4.348206, 0, 1, 0.05098039, 1,
-0.4115634, 2.128072, 0.4338359, 0, 1, 0.05882353, 1,
-0.4090784, -0.1310079, -1.182358, 0, 1, 0.0627451, 1,
-0.4071125, -1.004121, -1.252953, 0, 1, 0.07058824, 1,
-0.4065389, 1.405226, -1.311792, 0, 1, 0.07450981, 1,
-0.405405, -1.050084, -2.59458, 0, 1, 0.08235294, 1,
-0.403345, 0.7822165, 0.8244768, 0, 1, 0.08627451, 1,
-0.4030432, -0.9556964, -1.099089, 0, 1, 0.09411765, 1,
-0.3960648, -0.05421289, -1.448497, 0, 1, 0.1019608, 1,
-0.3946123, 0.8089973, -0.9314296, 0, 1, 0.1058824, 1,
-0.3938381, 0.8123649, 0.08507048, 0, 1, 0.1137255, 1,
-0.3929184, 1.426498, -1.240067, 0, 1, 0.1176471, 1,
-0.3928102, 0.157784, -2.327848, 0, 1, 0.1254902, 1,
-0.3917525, 0.4881214, 0.6135133, 0, 1, 0.1294118, 1,
-0.3875719, 1.620267, 0.3944036, 0, 1, 0.1372549, 1,
-0.3872867, -0.721602, -3.191898, 0, 1, 0.1411765, 1,
-0.3849854, -1.409269, -3.978635, 0, 1, 0.1490196, 1,
-0.3845835, 0.5271868, -1.827336, 0, 1, 0.1529412, 1,
-0.3840763, 0.1170823, -1.676474, 0, 1, 0.1607843, 1,
-0.3837397, 0.7890429, -1.208305, 0, 1, 0.1647059, 1,
-0.3800995, 0.5740778, -0.7041978, 0, 1, 0.172549, 1,
-0.3800747, 0.1471699, -1.938641, 0, 1, 0.1764706, 1,
-0.3685807, -0.6584421, -1.569673, 0, 1, 0.1843137, 1,
-0.3663812, 0.8624688, 0.005566536, 0, 1, 0.1882353, 1,
-0.3657297, 0.7457434, -0.2809359, 0, 1, 0.1960784, 1,
-0.3624149, -0.4428023, -1.9555, 0, 1, 0.2039216, 1,
-0.3592581, -0.2484711, -2.094723, 0, 1, 0.2078431, 1,
-0.3582808, 0.4105339, -0.6342292, 0, 1, 0.2156863, 1,
-0.3556142, 0.3260802, -1.961678, 0, 1, 0.2196078, 1,
-0.3394865, -0.4626858, -1.718931, 0, 1, 0.227451, 1,
-0.3390359, -0.4581386, -0.3138459, 0, 1, 0.2313726, 1,
-0.3389851, -1.338601, -2.701217, 0, 1, 0.2392157, 1,
-0.3352388, -0.7034077, -2.410884, 0, 1, 0.2431373, 1,
-0.3337251, 1.043072, -2.214203, 0, 1, 0.2509804, 1,
-0.3330459, 1.036944, 0.2202384, 0, 1, 0.254902, 1,
-0.3284936, 2.154319, 0.775215, 0, 1, 0.2627451, 1,
-0.3279725, -2.268962, -4.606436, 0, 1, 0.2666667, 1,
-0.3278976, 0.6402818, 0.2115574, 0, 1, 0.2745098, 1,
-0.3271658, -0.5397999, -2.479521, 0, 1, 0.2784314, 1,
-0.3255444, -0.2848454, -1.600891, 0, 1, 0.2862745, 1,
-0.3212764, 0.2982641, -0.3389748, 0, 1, 0.2901961, 1,
-0.3163172, 0.2424948, -2.037787, 0, 1, 0.2980392, 1,
-0.3136712, -1.390841, -2.565836, 0, 1, 0.3058824, 1,
-0.3114848, -0.1851057, -1.025693, 0, 1, 0.3098039, 1,
-0.3091364, 0.527521, -0.5939286, 0, 1, 0.3176471, 1,
-0.3086682, -0.3479443, -3.428714, 0, 1, 0.3215686, 1,
-0.3084826, -0.2161579, -2.38737, 0, 1, 0.3294118, 1,
-0.3065065, -0.1075647, -0.7387672, 0, 1, 0.3333333, 1,
-0.3064506, 0.6085121, -0.5894927, 0, 1, 0.3411765, 1,
-0.3056634, -0.6205078, -2.12913, 0, 1, 0.345098, 1,
-0.3034703, 0.8272101, 0.7693486, 0, 1, 0.3529412, 1,
-0.3028223, -0.6873621, -3.133333, 0, 1, 0.3568628, 1,
-0.3016692, 0.6718125, -1.288474, 0, 1, 0.3647059, 1,
-0.3007415, 0.1947061, -2.144677, 0, 1, 0.3686275, 1,
-0.2926849, -1.249817, -2.202398, 0, 1, 0.3764706, 1,
-0.2925933, -1.944023, -3.248389, 0, 1, 0.3803922, 1,
-0.2902442, 1.196419, 1.968405, 0, 1, 0.3882353, 1,
-0.2901442, 0.3317268, -0.02080771, 0, 1, 0.3921569, 1,
-0.2897539, -0.1985464, -1.678222, 0, 1, 0.4, 1,
-0.2826654, -1.178112, -3.32141, 0, 1, 0.4078431, 1,
-0.2765318, 1.150303, -0.01050506, 0, 1, 0.4117647, 1,
-0.2760328, -1.188184, -2.519231, 0, 1, 0.4196078, 1,
-0.2757206, -1.568826, -2.696784, 0, 1, 0.4235294, 1,
-0.2718838, 1.031591, 0.3205573, 0, 1, 0.4313726, 1,
-0.2717492, -1.866539, -3.609084, 0, 1, 0.4352941, 1,
-0.2679208, 0.5610999, -2.298074, 0, 1, 0.4431373, 1,
-0.2667873, 0.05254689, -1.181062, 0, 1, 0.4470588, 1,
-0.2613788, 0.2644581, -0.2031423, 0, 1, 0.454902, 1,
-0.2606838, 0.7718036, -1.227528, 0, 1, 0.4588235, 1,
-0.2590643, -0.730049, -2.878415, 0, 1, 0.4666667, 1,
-0.2573809, 0.006777232, -1.934901, 0, 1, 0.4705882, 1,
-0.2573049, 0.8225497, 1.280592, 0, 1, 0.4784314, 1,
-0.2535326, -0.8542162, -3.26012, 0, 1, 0.4823529, 1,
-0.2516694, 1.623611, 0.3937177, 0, 1, 0.4901961, 1,
-0.2499006, 1.127875, -1.518585, 0, 1, 0.4941176, 1,
-0.2476866, -0.7206427, -4.72124, 0, 1, 0.5019608, 1,
-0.2451237, -0.04261572, 0.8950422, 0, 1, 0.509804, 1,
-0.2440438, -0.3340054, -2.523065, 0, 1, 0.5137255, 1,
-0.2413367, -0.2339965, -3.162785, 0, 1, 0.5215687, 1,
-0.2410971, -0.9440001, -2.550317, 0, 1, 0.5254902, 1,
-0.2353594, 0.8337505, -1.025432, 0, 1, 0.5333334, 1,
-0.2344846, -0.5428838, -4.570606, 0, 1, 0.5372549, 1,
-0.2339854, -0.8216637, -3.760383, 0, 1, 0.5450981, 1,
-0.2328619, -1.774972, -4.205168, 0, 1, 0.5490196, 1,
-0.23013, -0.2925556, -1.950274, 0, 1, 0.5568628, 1,
-0.226895, -0.04356743, -0.6141884, 0, 1, 0.5607843, 1,
-0.2219614, -0.4654889, -3.205758, 0, 1, 0.5686275, 1,
-0.2187187, 2.268712, 0.2421606, 0, 1, 0.572549, 1,
-0.2167597, -1.022554, -2.257812, 0, 1, 0.5803922, 1,
-0.2118462, 0.9402179, -0.06589657, 0, 1, 0.5843138, 1,
-0.2108801, 0.7133525, 0.3144372, 0, 1, 0.5921569, 1,
-0.2098936, 0.4570748, 1.481815, 0, 1, 0.5960785, 1,
-0.2060096, -0.1738185, -2.84132, 0, 1, 0.6039216, 1,
-0.2026324, -1.532411, -3.410002, 0, 1, 0.6117647, 1,
-0.2022593, 0.1893511, -2.559765, 0, 1, 0.6156863, 1,
-0.1948334, 0.1240309, -3.211782, 0, 1, 0.6235294, 1,
-0.1946331, -1.358489, -3.226725, 0, 1, 0.627451, 1,
-0.194529, -2.100546, -2.518544, 0, 1, 0.6352941, 1,
-0.1910368, -0.3061518, -2.459587, 0, 1, 0.6392157, 1,
-0.1893721, 1.209349, -0.771647, 0, 1, 0.6470588, 1,
-0.1859104, -0.2133343, -1.769274, 0, 1, 0.6509804, 1,
-0.1852882, -1.293603, -1.797445, 0, 1, 0.6588235, 1,
-0.1801746, -1.803323, -2.238307, 0, 1, 0.6627451, 1,
-0.1794808, -0.6430315, -2.740885, 0, 1, 0.6705883, 1,
-0.1794428, -0.174169, -3.010656, 0, 1, 0.6745098, 1,
-0.1776407, 0.1688375, -0.4317042, 0, 1, 0.682353, 1,
-0.1759195, 0.5490383, 1.142983, 0, 1, 0.6862745, 1,
-0.1744036, 0.08331268, -1.942731, 0, 1, 0.6941177, 1,
-0.1707547, -0.8352677, -3.171977, 0, 1, 0.7019608, 1,
-0.1704493, 0.2262433, -0.7763051, 0, 1, 0.7058824, 1,
-0.1693342, 1.827898, -0.07405255, 0, 1, 0.7137255, 1,
-0.1644509, -0.1105145, -2.782907, 0, 1, 0.7176471, 1,
-0.1643214, -0.3810396, -2.851971, 0, 1, 0.7254902, 1,
-0.1635956, 0.02426685, -1.10805, 0, 1, 0.7294118, 1,
-0.1608254, -2.435255, -3.888277, 0, 1, 0.7372549, 1,
-0.1561699, 0.1234536, -0.4746902, 0, 1, 0.7411765, 1,
-0.155724, 0.3541136, 0.6642897, 0, 1, 0.7490196, 1,
-0.1540204, 1.068054, 0.9836741, 0, 1, 0.7529412, 1,
-0.1538547, 0.5997202, 0.7230624, 0, 1, 0.7607843, 1,
-0.1521822, -0.9212018, -3.297785, 0, 1, 0.7647059, 1,
-0.1489836, 0.4578691, 1.383081, 0, 1, 0.772549, 1,
-0.1439801, 0.898811, 0.6340152, 0, 1, 0.7764706, 1,
-0.1388124, -0.03992706, -1.321229, 0, 1, 0.7843137, 1,
-0.1363872, -0.033625, -0.2116703, 0, 1, 0.7882353, 1,
-0.1359959, -1.556551, -5.322618, 0, 1, 0.7960784, 1,
-0.1352631, 1.049861, 0.2115923, 0, 1, 0.8039216, 1,
-0.1342348, -0.6352071, -1.987782, 0, 1, 0.8078431, 1,
-0.1308103, 1.000736, 1.990503, 0, 1, 0.8156863, 1,
-0.1290321, 0.0747722, -2.553303, 0, 1, 0.8196079, 1,
-0.1241277, 0.4864225, 0.5015082, 0, 1, 0.827451, 1,
-0.1215081, 0.1236062, 1.491779, 0, 1, 0.8313726, 1,
-0.1172502, -0.05141428, -2.670285, 0, 1, 0.8392157, 1,
-0.1172206, 0.4957968, -1.389179, 0, 1, 0.8431373, 1,
-0.1156627, 0.9553582, 0.3288005, 0, 1, 0.8509804, 1,
-0.111154, -0.2571234, -3.125124, 0, 1, 0.854902, 1,
-0.1098978, -1.30206, -2.842216, 0, 1, 0.8627451, 1,
-0.1069694, 0.6110206, -0.3549293, 0, 1, 0.8666667, 1,
-0.1013467, 0.5259969, 0.8528778, 0, 1, 0.8745098, 1,
-0.09309743, -0.605773, -1.893476, 0, 1, 0.8784314, 1,
-0.09059506, -0.2078977, -2.412556, 0, 1, 0.8862745, 1,
-0.08774576, -1.692648, -3.1902, 0, 1, 0.8901961, 1,
-0.0846009, 0.4844603, 0.682363, 0, 1, 0.8980392, 1,
-0.08445815, 1.020159, -1.470035, 0, 1, 0.9058824, 1,
-0.08346537, -1.491387, -4.613453, 0, 1, 0.9098039, 1,
-0.08248566, -0.1022924, -3.109156, 0, 1, 0.9176471, 1,
-0.07927225, -0.1183299, -1.9389, 0, 1, 0.9215686, 1,
-0.07431863, -0.9152617, -1.98892, 0, 1, 0.9294118, 1,
-0.07300319, 2.517906, -0.5082419, 0, 1, 0.9333333, 1,
-0.06784897, -0.3601863, -2.594057, 0, 1, 0.9411765, 1,
-0.06397982, 1.055394, 0.005070797, 0, 1, 0.945098, 1,
-0.06364587, -0.7671692, -3.896712, 0, 1, 0.9529412, 1,
-0.06108763, 1.430111, -0.3848763, 0, 1, 0.9568627, 1,
-0.05501409, 0.4793774, -1.748209, 0, 1, 0.9647059, 1,
-0.05444961, -0.4520274, -4.457914, 0, 1, 0.9686275, 1,
-0.05196716, 0.7503753, -0.1569291, 0, 1, 0.9764706, 1,
-0.04797626, -0.9677396, -3.105299, 0, 1, 0.9803922, 1,
-0.0463538, -0.5631508, -2.610404, 0, 1, 0.9882353, 1,
-0.04457718, 1.820741, 0.6256481, 0, 1, 0.9921569, 1,
-0.04359422, -0.2318125, -2.13275, 0, 1, 1, 1,
-0.04204685, -0.2431817, -3.827883, 0, 0.9921569, 1, 1,
-0.04196227, -1.330619, -3.730755, 0, 0.9882353, 1, 1,
-0.0416513, -0.3389338, -1.359464, 0, 0.9803922, 1, 1,
-0.03850666, 1.098002, 0.09084966, 0, 0.9764706, 1, 1,
-0.03803504, -0.6571582, -2.536968, 0, 0.9686275, 1, 1,
-0.03569904, -0.572493, -4.055189, 0, 0.9647059, 1, 1,
-0.03064792, 0.2705328, -0.06943109, 0, 0.9568627, 1, 1,
-0.03052324, -1.354936, -3.648944, 0, 0.9529412, 1, 1,
-0.02849477, 0.1002991, 0.6835443, 0, 0.945098, 1, 1,
-0.02685524, -0.3659047, -4.884337, 0, 0.9411765, 1, 1,
-0.02550545, 0.1854498, 0.6981184, 0, 0.9333333, 1, 1,
-0.02496954, -0.2910469, -3.151208, 0, 0.9294118, 1, 1,
-0.02182543, 0.3712063, 0.1757955, 0, 0.9215686, 1, 1,
-0.01960153, 0.2675101, 1.696954, 0, 0.9176471, 1, 1,
-0.01907541, -0.8448493, -2.644042, 0, 0.9098039, 1, 1,
-0.01680568, 0.4998726, -0.002726428, 0, 0.9058824, 1, 1,
-0.01230289, -1.144912, -3.022841, 0, 0.8980392, 1, 1,
-0.01155777, -0.07021543, -3.988493, 0, 0.8901961, 1, 1,
-0.008613281, 1.089555, -1.39146, 0, 0.8862745, 1, 1,
-0.007209512, -0.5606406, -3.151481, 0, 0.8784314, 1, 1,
-0.004662121, 1.347727, -1.194727, 0, 0.8745098, 1, 1,
-0.002807865, 0.9101098, -0.2692698, 0, 0.8666667, 1, 1,
-0.001687242, 0.5921705, -0.1882707, 0, 0.8627451, 1, 1,
-0.001192816, 0.2860799, -1.251338, 0, 0.854902, 1, 1,
-0.001078645, -0.05187716, -3.544291, 0, 0.8509804, 1, 1,
-0.0009849161, -0.1120876, -2.216963, 0, 0.8431373, 1, 1,
0.0006304795, 1.197528, -1.049244, 0, 0.8392157, 1, 1,
0.003226347, -1.069313, 2.511098, 0, 0.8313726, 1, 1,
0.006113443, 0.7855194, -0.905301, 0, 0.827451, 1, 1,
0.007912024, 0.4567838, 1.534827, 0, 0.8196079, 1, 1,
0.009842531, 0.3812084, -1.06842, 0, 0.8156863, 1, 1,
0.01067104, -0.4394614, 2.129646, 0, 0.8078431, 1, 1,
0.02091942, 1.310516, -0.1126949, 0, 0.8039216, 1, 1,
0.02494863, -0.6609561, 3.179215, 0, 0.7960784, 1, 1,
0.02778284, 0.914668, 1.644476, 0, 0.7882353, 1, 1,
0.03209219, -1.581178, 3.468101, 0, 0.7843137, 1, 1,
0.03275156, 0.04578684, 0.01550804, 0, 0.7764706, 1, 1,
0.0382838, -1.085794, 3.391202, 0, 0.772549, 1, 1,
0.03978993, -0.08070876, 3.91792, 0, 0.7647059, 1, 1,
0.03999687, 1.071983, -0.2312181, 0, 0.7607843, 1, 1,
0.04476338, 0.1103557, 0.3313528, 0, 0.7529412, 1, 1,
0.04925238, -0.4339691, 4.777192, 0, 0.7490196, 1, 1,
0.05215402, 0.6056603, 0.2824651, 0, 0.7411765, 1, 1,
0.05330895, -0.4005137, 6.0322, 0, 0.7372549, 1, 1,
0.05485233, -0.563507, 3.259519, 0, 0.7294118, 1, 1,
0.05692697, 0.1088132, 1.403833, 0, 0.7254902, 1, 1,
0.05754157, -1.379567, 3.688877, 0, 0.7176471, 1, 1,
0.05762259, -0.05425413, 1.714231, 0, 0.7137255, 1, 1,
0.05763981, -0.2812446, 2.003312, 0, 0.7058824, 1, 1,
0.06027022, -0.2427426, 3.632357, 0, 0.6980392, 1, 1,
0.06391297, 0.1088069, 0.4729861, 0, 0.6941177, 1, 1,
0.06633855, -0.6022798, 3.288341, 0, 0.6862745, 1, 1,
0.06687628, -1.957111, 4.032417, 0, 0.682353, 1, 1,
0.06844059, -0.7412874, 2.626035, 0, 0.6745098, 1, 1,
0.07061915, -0.4617737, 2.893201, 0, 0.6705883, 1, 1,
0.0756704, 1.01878, 0.6197605, 0, 0.6627451, 1, 1,
0.07584464, -1.393354, 3.554209, 0, 0.6588235, 1, 1,
0.07770149, -2.517328, 3.293317, 0, 0.6509804, 1, 1,
0.08326112, -1.048401, 3.078321, 0, 0.6470588, 1, 1,
0.08463364, -0.5754502, 2.364045, 0, 0.6392157, 1, 1,
0.08488031, 0.7471223, 0.1877707, 0, 0.6352941, 1, 1,
0.08787151, -0.2411526, 3.740655, 0, 0.627451, 1, 1,
0.09214631, -0.2816846, 4.283108, 0, 0.6235294, 1, 1,
0.09592815, -0.2090476, 4.229637, 0, 0.6156863, 1, 1,
0.09705516, 0.4301502, 1.040386, 0, 0.6117647, 1, 1,
0.09725487, 1.197145, 0.3680024, 0, 0.6039216, 1, 1,
0.09938639, -0.1808316, 3.182724, 0, 0.5960785, 1, 1,
0.1004132, -0.1784302, 3.122633, 0, 0.5921569, 1, 1,
0.1009454, 0.9030805, -0.2431003, 0, 0.5843138, 1, 1,
0.1048386, 3.491423, 1.259554, 0, 0.5803922, 1, 1,
0.1055282, 0.563212, 0.1631228, 0, 0.572549, 1, 1,
0.1065843, 1.116945, 1.754305, 0, 0.5686275, 1, 1,
0.1089347, -0.2316497, 2.219881, 0, 0.5607843, 1, 1,
0.1091187, -0.2214521, 2.255696, 0, 0.5568628, 1, 1,
0.112691, -0.7512868, 4.105452, 0, 0.5490196, 1, 1,
0.1150086, -0.5338636, 3.788827, 0, 0.5450981, 1, 1,
0.116337, -0.6044067, 1.460769, 0, 0.5372549, 1, 1,
0.1182213, -0.2659791, 2.008421, 0, 0.5333334, 1, 1,
0.1210521, 1.171186, -0.7889891, 0, 0.5254902, 1, 1,
0.1211469, 0.9007527, 1.772882, 0, 0.5215687, 1, 1,
0.1252209, 0.03827214, 1.485824, 0, 0.5137255, 1, 1,
0.1254847, 0.4511202, 0.62477, 0, 0.509804, 1, 1,
0.1267618, 1.791991, -1.934134, 0, 0.5019608, 1, 1,
0.1291674, 0.3448549, 2.344494, 0, 0.4941176, 1, 1,
0.1308258, 0.2472263, 2.002392, 0, 0.4901961, 1, 1,
0.1316513, -1.207622, 2.987646, 0, 0.4823529, 1, 1,
0.133297, 0.1089998, 0.5259675, 0, 0.4784314, 1, 1,
0.1338913, 0.1697505, 0.6179328, 0, 0.4705882, 1, 1,
0.1378905, -1.532877, 2.135113, 0, 0.4666667, 1, 1,
0.138363, 0.2486044, 1.727648, 0, 0.4588235, 1, 1,
0.142347, -1.084801, 0.6886305, 0, 0.454902, 1, 1,
0.1434691, -0.05723668, 2.298493, 0, 0.4470588, 1, 1,
0.1460774, 0.4293465, 0.8319165, 0, 0.4431373, 1, 1,
0.1477956, 1.626805, -0.5786444, 0, 0.4352941, 1, 1,
0.1508819, -0.2344836, 2.478344, 0, 0.4313726, 1, 1,
0.1554228, -0.6498057, 1.640353, 0, 0.4235294, 1, 1,
0.1597475, 0.6514642, -0.463528, 0, 0.4196078, 1, 1,
0.1667564, -0.6899422, 3.634444, 0, 0.4117647, 1, 1,
0.1711841, -0.5996659, 4.259235, 0, 0.4078431, 1, 1,
0.1743888, 0.4537323, -0.6203557, 0, 0.4, 1, 1,
0.1752724, 0.1955888, 1.587468, 0, 0.3921569, 1, 1,
0.1763901, 0.9247956, -0.8487703, 0, 0.3882353, 1, 1,
0.1770223, -1.362429, 2.673735, 0, 0.3803922, 1, 1,
0.1772831, -1.489744, 2.462127, 0, 0.3764706, 1, 1,
0.1790144, 0.8464335, 0.03849145, 0, 0.3686275, 1, 1,
0.1810121, -0.2549933, 0.6068298, 0, 0.3647059, 1, 1,
0.1885612, 1.870775, -0.5721845, 0, 0.3568628, 1, 1,
0.1894101, 0.02636987, 0.4890966, 0, 0.3529412, 1, 1,
0.1902137, -0.2309512, 2.810529, 0, 0.345098, 1, 1,
0.1909465, -0.3419713, 2.175031, 0, 0.3411765, 1, 1,
0.1941103, 0.3917037, 1.254391, 0, 0.3333333, 1, 1,
0.1984071, -0.6161236, 2.765012, 0, 0.3294118, 1, 1,
0.2023305, 0.6152096, 0.4285767, 0, 0.3215686, 1, 1,
0.2027284, 0.3787661, -1.554741, 0, 0.3176471, 1, 1,
0.2030225, -0.3215114, 2.317853, 0, 0.3098039, 1, 1,
0.2031228, 1.10921, -0.6084258, 0, 0.3058824, 1, 1,
0.2040256, 0.6294715, 0.6567485, 0, 0.2980392, 1, 1,
0.2059277, -0.2598476, 1.294678, 0, 0.2901961, 1, 1,
0.2061934, -0.9467837, 2.994571, 0, 0.2862745, 1, 1,
0.2074413, -1.107897, 4.905223, 0, 0.2784314, 1, 1,
0.2103687, -0.9920754, 4.646758, 0, 0.2745098, 1, 1,
0.213172, -0.2806791, 2.304998, 0, 0.2666667, 1, 1,
0.216481, -0.4941145, 4.027738, 0, 0.2627451, 1, 1,
0.2174659, -1.296313, 2.897073, 0, 0.254902, 1, 1,
0.2177912, 0.7049269, 0.06762925, 0, 0.2509804, 1, 1,
0.2191228, 0.3336304, -0.3700326, 0, 0.2431373, 1, 1,
0.2194916, 2.772896, -0.2274973, 0, 0.2392157, 1, 1,
0.2228235, -2.348645, 2.639825, 0, 0.2313726, 1, 1,
0.2315757, 0.4791442, 1.534583, 0, 0.227451, 1, 1,
0.2319307, 0.7491437, -0.3710181, 0, 0.2196078, 1, 1,
0.2321022, 0.600265, -1.009618, 0, 0.2156863, 1, 1,
0.2346588, -0.68433, 2.464509, 0, 0.2078431, 1, 1,
0.2358149, 0.8142377, -1.625091, 0, 0.2039216, 1, 1,
0.2396924, 1.116089, -0.6122767, 0, 0.1960784, 1, 1,
0.2424258, -0.6077577, 2.667426, 0, 0.1882353, 1, 1,
0.2527723, 0.4115717, 0.4948427, 0, 0.1843137, 1, 1,
0.2531287, -1.529687, 3.120194, 0, 0.1764706, 1, 1,
0.2543891, 1.107589, 1.026103, 0, 0.172549, 1, 1,
0.261171, 0.3587891, 1.301599, 0, 0.1647059, 1, 1,
0.261613, -1.077111, 3.996816, 0, 0.1607843, 1, 1,
0.2740243, -1.903662, 3.281791, 0, 0.1529412, 1, 1,
0.2785357, -0.351187, 5.268839, 0, 0.1490196, 1, 1,
0.2789637, 0.3644859, -0.220525, 0, 0.1411765, 1, 1,
0.2842342, 0.01561222, -0.3589694, 0, 0.1372549, 1, 1,
0.2882277, 1.516115, 0.9451019, 0, 0.1294118, 1, 1,
0.2917874, 0.2631804, 2.189853, 0, 0.1254902, 1, 1,
0.2963514, 2.938623, -1.982286, 0, 0.1176471, 1, 1,
0.3006094, -0.9794837, 4.054023, 0, 0.1137255, 1, 1,
0.3009404, 2.168412, -0.06350488, 0, 0.1058824, 1, 1,
0.3017289, -1.276051, 4.378325, 0, 0.09803922, 1, 1,
0.303627, 0.01758179, 2.284528, 0, 0.09411765, 1, 1,
0.304489, 0.663855, -0.48728, 0, 0.08627451, 1, 1,
0.3047654, -0.3486178, 3.89384, 0, 0.08235294, 1, 1,
0.3047848, -1.012974, 2.017707, 0, 0.07450981, 1, 1,
0.3059897, -0.2088936, 0.3421557, 0, 0.07058824, 1, 1,
0.3072886, 1.244952, -0.5677956, 0, 0.0627451, 1, 1,
0.3123502, 0.07416129, -0.04304673, 0, 0.05882353, 1, 1,
0.3125426, -0.07990028, 1.34249, 0, 0.05098039, 1, 1,
0.313599, -1.299724, 3.648007, 0, 0.04705882, 1, 1,
0.3178802, 0.350704, 0.737768, 0, 0.03921569, 1, 1,
0.3222062, -0.5359227, 1.266328, 0, 0.03529412, 1, 1,
0.3255042, -0.1657752, 2.350173, 0, 0.02745098, 1, 1,
0.3256136, 1.082342, 0.3957801, 0, 0.02352941, 1, 1,
0.3314526, -1.15634, 2.523611, 0, 0.01568628, 1, 1,
0.3361328, 1.172333, 0.3289881, 0, 0.01176471, 1, 1,
0.3367293, -1.26734, 2.845588, 0, 0.003921569, 1, 1,
0.3368109, -1.433322, 2.639488, 0.003921569, 0, 1, 1,
0.34055, -0.4706099, 2.407122, 0.007843138, 0, 1, 1,
0.3423983, -1.300401, 3.797668, 0.01568628, 0, 1, 1,
0.3458286, 0.2462658, -0.05027688, 0.01960784, 0, 1, 1,
0.3644002, -0.03567423, 2.898297, 0.02745098, 0, 1, 1,
0.37955, -1.355884, 2.627737, 0.03137255, 0, 1, 1,
0.3831484, 0.5677564, 1.353398, 0.03921569, 0, 1, 1,
0.3832655, 0.7015998, 0.9720811, 0.04313726, 0, 1, 1,
0.3851851, 0.7817132, 0.5043727, 0.05098039, 0, 1, 1,
0.3852777, 1.476372, 1.211164, 0.05490196, 0, 1, 1,
0.3863613, 0.7145821, -0.2087413, 0.0627451, 0, 1, 1,
0.3873695, 0.9092031, 0.3725848, 0.06666667, 0, 1, 1,
0.3919288, -0.1010993, 3.299583, 0.07450981, 0, 1, 1,
0.3946128, 1.019583, -0.6743916, 0.07843138, 0, 1, 1,
0.3961352, 1.146384, -0.2004973, 0.08627451, 0, 1, 1,
0.3990266, 0.5313726, 2.339445, 0.09019608, 0, 1, 1,
0.4003942, 0.3609857, 2.304601, 0.09803922, 0, 1, 1,
0.4017765, 0.1176875, -0.07423254, 0.1058824, 0, 1, 1,
0.4017854, -1.637169, 4.97607, 0.1098039, 0, 1, 1,
0.4031061, -0.3540397, 1.481406, 0.1176471, 0, 1, 1,
0.4037367, 1.404245, -0.1396168, 0.1215686, 0, 1, 1,
0.4074942, -1.937442, 2.595415, 0.1294118, 0, 1, 1,
0.4117043, 2.053723, 0.6627179, 0.1333333, 0, 1, 1,
0.4145949, -0.31229, 1.600732, 0.1411765, 0, 1, 1,
0.414693, 1.358413, -0.3394977, 0.145098, 0, 1, 1,
0.4213861, 1.816781, 1.468238, 0.1529412, 0, 1, 1,
0.4284366, 0.2115418, 1.85784, 0.1568628, 0, 1, 1,
0.431075, -1.046097, 1.68923, 0.1647059, 0, 1, 1,
0.431702, -1.118374, 1.829924, 0.1686275, 0, 1, 1,
0.4331284, -0.9210786, 3.350434, 0.1764706, 0, 1, 1,
0.4335102, -0.4307514, 3.328963, 0.1803922, 0, 1, 1,
0.4344167, -2.227203, 2.053695, 0.1882353, 0, 1, 1,
0.4347588, -0.2502097, 3.392154, 0.1921569, 0, 1, 1,
0.4366066, 0.9873298, 1.036168, 0.2, 0, 1, 1,
0.4384982, -0.9432776, 2.44827, 0.2078431, 0, 1, 1,
0.4388064, 0.4644723, -0.341671, 0.2117647, 0, 1, 1,
0.4407966, 0.6049348, -0.6735812, 0.2196078, 0, 1, 1,
0.4450157, 0.3722427, 0.7591558, 0.2235294, 0, 1, 1,
0.4490993, 0.8316463, 1.887009, 0.2313726, 0, 1, 1,
0.4514571, 0.2601626, 0.2713135, 0.2352941, 0, 1, 1,
0.4546468, 0.09995475, 1.277225, 0.2431373, 0, 1, 1,
0.4582946, 0.3675161, 1.185827, 0.2470588, 0, 1, 1,
0.4606051, 0.594817, -0.1060023, 0.254902, 0, 1, 1,
0.4611546, 1.304995, 1.044733, 0.2588235, 0, 1, 1,
0.4614161, 0.8986482, 1.344827, 0.2666667, 0, 1, 1,
0.463269, 0.7129692, 1.047889, 0.2705882, 0, 1, 1,
0.4643999, -0.01089774, 3.668648, 0.2784314, 0, 1, 1,
0.4644039, -2.213495, 1.962799, 0.282353, 0, 1, 1,
0.4650287, 0.9175794, 0.9856143, 0.2901961, 0, 1, 1,
0.4666366, 0.4607288, 0.5630137, 0.2941177, 0, 1, 1,
0.4704701, -0.1928371, 2.446081, 0.3019608, 0, 1, 1,
0.4716778, -0.7267612, 2.413937, 0.3098039, 0, 1, 1,
0.4775611, 0.1945193, 1.593885, 0.3137255, 0, 1, 1,
0.4800414, -1.135033, 3.254364, 0.3215686, 0, 1, 1,
0.4822399, 0.5884953, 2.046451, 0.3254902, 0, 1, 1,
0.4851162, -0.9400485, 2.676041, 0.3333333, 0, 1, 1,
0.4941575, 0.02846595, 0.9325228, 0.3372549, 0, 1, 1,
0.4944381, 0.08743928, 1.618111, 0.345098, 0, 1, 1,
0.4945578, -1.131328, 1.356821, 0.3490196, 0, 1, 1,
0.4997283, -0.6985793, 2.679877, 0.3568628, 0, 1, 1,
0.5054554, 0.9523915, -0.4357194, 0.3607843, 0, 1, 1,
0.5058199, 1.313822, 1.038039, 0.3686275, 0, 1, 1,
0.5067019, -0.6943183, 3.319084, 0.372549, 0, 1, 1,
0.512841, -0.2087235, 2.593306, 0.3803922, 0, 1, 1,
0.5138756, 0.2941086, 1.370697, 0.3843137, 0, 1, 1,
0.5266358, -2.98676, 4.136304, 0.3921569, 0, 1, 1,
0.5298132, -0.7987086, 3.722256, 0.3960784, 0, 1, 1,
0.5333847, -0.1378231, 0.0006848158, 0.4039216, 0, 1, 1,
0.5348611, -0.235394, 2.780339, 0.4117647, 0, 1, 1,
0.5453604, -1.91778, 1.708462, 0.4156863, 0, 1, 1,
0.5528705, 0.6211479, 1.400713, 0.4235294, 0, 1, 1,
0.5530793, 0.2756147, 1.531841, 0.427451, 0, 1, 1,
0.5591415, 0.6211515, -1.492917, 0.4352941, 0, 1, 1,
0.559229, 0.7856048, 0.5445294, 0.4392157, 0, 1, 1,
0.5592321, 0.7454135, 1.167752, 0.4470588, 0, 1, 1,
0.5662567, 0.422187, 0.5639563, 0.4509804, 0, 1, 1,
0.568852, -0.3493818, 2.131811, 0.4588235, 0, 1, 1,
0.5733745, -0.9551582, 2.946254, 0.4627451, 0, 1, 1,
0.5737239, -0.8802837, 3.459888, 0.4705882, 0, 1, 1,
0.5748144, -0.5772285, 1.463235, 0.4745098, 0, 1, 1,
0.5858619, -0.8344616, 3.356206, 0.4823529, 0, 1, 1,
0.5869718, 0.5701133, 2.239112, 0.4862745, 0, 1, 1,
0.5875311, 0.4222131, 0.1757453, 0.4941176, 0, 1, 1,
0.5877637, 0.1080262, 2.249598, 0.5019608, 0, 1, 1,
0.5927985, 1.262183, -0.358115, 0.5058824, 0, 1, 1,
0.594386, 1.141491, 2.083306, 0.5137255, 0, 1, 1,
0.5951187, -1.440699, 1.695364, 0.5176471, 0, 1, 1,
0.5981328, -0.8550339, 2.820893, 0.5254902, 0, 1, 1,
0.5991355, 0.9912301, 0.1463913, 0.5294118, 0, 1, 1,
0.6008128, 0.2831305, 3.235365, 0.5372549, 0, 1, 1,
0.6037526, -1.10071, 3.492723, 0.5411765, 0, 1, 1,
0.6051824, 0.9300548, 0.06367996, 0.5490196, 0, 1, 1,
0.6079557, -2.144178, 3.586482, 0.5529412, 0, 1, 1,
0.6116529, 1.290595, 0.1554384, 0.5607843, 0, 1, 1,
0.6143786, -1.059343, 2.424715, 0.5647059, 0, 1, 1,
0.6147929, 1.25784, -0.6856491, 0.572549, 0, 1, 1,
0.6159745, 0.5104779, 2.25953, 0.5764706, 0, 1, 1,
0.6202063, 0.5780846, 2.182793, 0.5843138, 0, 1, 1,
0.6234916, 1.196253, -0.9381282, 0.5882353, 0, 1, 1,
0.6263233, 0.271322, 2.662268, 0.5960785, 0, 1, 1,
0.6263344, -2.095684, 2.024949, 0.6039216, 0, 1, 1,
0.6277314, 0.4990695, -0.4686987, 0.6078432, 0, 1, 1,
0.6291667, -0.5231978, 0.5832912, 0.6156863, 0, 1, 1,
0.6344314, 0.5428541, 1.972916, 0.6196079, 0, 1, 1,
0.6358142, 0.1921777, 1.175721, 0.627451, 0, 1, 1,
0.637888, -0.01425567, 2.206954, 0.6313726, 0, 1, 1,
0.6379381, 1.706232, -0.8051839, 0.6392157, 0, 1, 1,
0.6498783, 2.41269, -0.5406356, 0.6431373, 0, 1, 1,
0.650903, 1.202081, 1.897919, 0.6509804, 0, 1, 1,
0.6513961, 0.517491, -0.1623616, 0.654902, 0, 1, 1,
0.6531913, 2.107265, 1.088408, 0.6627451, 0, 1, 1,
0.6551504, -0.2463739, 0.661716, 0.6666667, 0, 1, 1,
0.6575031, -0.06658152, 2.256124, 0.6745098, 0, 1, 1,
0.6586365, 0.6842358, 0.3904558, 0.6784314, 0, 1, 1,
0.6672985, -0.3893707, 3.502672, 0.6862745, 0, 1, 1,
0.6687629, -0.001566167, 2.06099, 0.6901961, 0, 1, 1,
0.6701738, -0.4815747, 0.8456597, 0.6980392, 0, 1, 1,
0.6717156, 0.4229704, 2.099193, 0.7058824, 0, 1, 1,
0.671829, 1.095047, 2.720767, 0.7098039, 0, 1, 1,
0.6734809, -0.2959504, -0.2737393, 0.7176471, 0, 1, 1,
0.6738899, 1.959759, 0.7780898, 0.7215686, 0, 1, 1,
0.6762168, -0.7552412, 0.6600903, 0.7294118, 0, 1, 1,
0.6847205, -0.4413496, 2.044307, 0.7333333, 0, 1, 1,
0.6901785, 1.191488, -0.4755679, 0.7411765, 0, 1, 1,
0.7039137, 0.07050375, 2.481128, 0.7450981, 0, 1, 1,
0.7068307, 1.203615, 0.03562946, 0.7529412, 0, 1, 1,
0.7133219, 1.089161, 0.9060433, 0.7568628, 0, 1, 1,
0.7147147, -0.2356972, 0.06744362, 0.7647059, 0, 1, 1,
0.71848, 0.544381, 1.434455, 0.7686275, 0, 1, 1,
0.7201384, -0.3830729, 2.533879, 0.7764706, 0, 1, 1,
0.7226226, -0.8806869, 0.981208, 0.7803922, 0, 1, 1,
0.7231802, -1.600255, 2.329545, 0.7882353, 0, 1, 1,
0.729866, -0.2955791, 1.844669, 0.7921569, 0, 1, 1,
0.730916, 0.1357428, -0.03481519, 0.8, 0, 1, 1,
0.7317972, 0.8756738, 1.876341, 0.8078431, 0, 1, 1,
0.7389628, -0.6310424, 2.359913, 0.8117647, 0, 1, 1,
0.7398549, -0.1468465, 1.757438, 0.8196079, 0, 1, 1,
0.7418366, 1.674568, 1.206929, 0.8235294, 0, 1, 1,
0.7523841, -0.137215, 1.971092, 0.8313726, 0, 1, 1,
0.755958, -0.6251385, 1.583864, 0.8352941, 0, 1, 1,
0.7599462, 1.824126, -1.053187, 0.8431373, 0, 1, 1,
0.7613752, 1.260567, 1.684623, 0.8470588, 0, 1, 1,
0.761894, 0.7432742, 2.754867, 0.854902, 0, 1, 1,
0.7639324, -0.7250238, 1.087395, 0.8588235, 0, 1, 1,
0.7675245, -0.6731451, 4.731179, 0.8666667, 0, 1, 1,
0.7743011, 1.756315, 0.5442972, 0.8705882, 0, 1, 1,
0.7767961, 0.7364787, 1.749368, 0.8784314, 0, 1, 1,
0.7792315, 0.7417302, 1.596197, 0.8823529, 0, 1, 1,
0.779785, 1.661453, 0.09684832, 0.8901961, 0, 1, 1,
0.7798352, 0.5005268, 1.308301, 0.8941177, 0, 1, 1,
0.7835769, -1.710258, 2.027195, 0.9019608, 0, 1, 1,
0.7838165, -0.40623, 1.543447, 0.9098039, 0, 1, 1,
0.7897415, 1.253302, -0.137822, 0.9137255, 0, 1, 1,
0.7991879, 0.1027948, -1.040114, 0.9215686, 0, 1, 1,
0.8034259, -0.8599609, 1.872354, 0.9254902, 0, 1, 1,
0.809535, 0.1204011, 3.641813, 0.9333333, 0, 1, 1,
0.810811, 0.7722067, 1.514956, 0.9372549, 0, 1, 1,
0.8113941, -0.6736018, 3.524696, 0.945098, 0, 1, 1,
0.8121363, 1.843007, -0.3996178, 0.9490196, 0, 1, 1,
0.816818, 1.389959, 0.808368, 0.9568627, 0, 1, 1,
0.818032, -0.8259604, 2.199523, 0.9607843, 0, 1, 1,
0.8184023, -0.7542665, 2.336003, 0.9686275, 0, 1, 1,
0.8220946, -0.2182948, 1.335123, 0.972549, 0, 1, 1,
0.8255891, -0.4715025, 1.667629, 0.9803922, 0, 1, 1,
0.8322508, -0.5603369, 1.037754, 0.9843137, 0, 1, 1,
0.8340819, 0.1275213, -0.2853485, 0.9921569, 0, 1, 1,
0.8358713, 0.08079718, 1.394507, 0.9960784, 0, 1, 1,
0.8358822, -1.48601, 2.116489, 1, 0, 0.9960784, 1,
0.8370432, -1.018872, 2.880712, 1, 0, 0.9882353, 1,
0.8480155, -1.896114, 2.602456, 1, 0, 0.9843137, 1,
0.8645887, 0.1619446, -0.5146621, 1, 0, 0.9764706, 1,
0.8678854, 0.7850891, 1.574124, 1, 0, 0.972549, 1,
0.8830444, 0.575405, 1.046464, 1, 0, 0.9647059, 1,
0.8870267, 0.3175414, 0.6112754, 1, 0, 0.9607843, 1,
0.8913745, 0.3253255, 0.9651409, 1, 0, 0.9529412, 1,
0.8927265, -0.4008479, 0.2220019, 1, 0, 0.9490196, 1,
0.8958795, 0.7040989, 0.9071036, 1, 0, 0.9411765, 1,
0.8981913, -0.2835879, 2.919073, 1, 0, 0.9372549, 1,
0.9015611, -0.1916759, 2.421503, 1, 0, 0.9294118, 1,
0.9041073, -1.824723, 1.024114, 1, 0, 0.9254902, 1,
0.9088468, -0.6653249, 0.5359901, 1, 0, 0.9176471, 1,
0.9108526, 0.2461536, -0.699161, 1, 0, 0.9137255, 1,
0.9135424, -0.02195426, 1.183762, 1, 0, 0.9058824, 1,
0.915665, 0.2031157, 0.7701678, 1, 0, 0.9019608, 1,
0.9179379, -1.282202, 0.5730882, 1, 0, 0.8941177, 1,
0.9299549, 0.5508119, 1.940953, 1, 0, 0.8862745, 1,
0.9325579, 0.9267951, -0.08056556, 1, 0, 0.8823529, 1,
0.9349977, -1.489945, 2.381262, 1, 0, 0.8745098, 1,
0.9360648, 0.8813791, 1.267951, 1, 0, 0.8705882, 1,
0.936826, -0.1456135, 3.427938, 1, 0, 0.8627451, 1,
0.9373482, 0.7324247, 0.5846288, 1, 0, 0.8588235, 1,
0.9463333, 1.71569, -1.144663, 1, 0, 0.8509804, 1,
0.9498975, -0.05320904, 0.6208832, 1, 0, 0.8470588, 1,
0.9499279, -0.589433, -1.769693, 1, 0, 0.8392157, 1,
0.9500679, -0.002172101, 0.5814537, 1, 0, 0.8352941, 1,
0.9518625, 0.9339781, 3.630035, 1, 0, 0.827451, 1,
0.9527265, 0.07533607, 2.374732, 1, 0, 0.8235294, 1,
0.9605229, -0.0858738, 2.12661, 1, 0, 0.8156863, 1,
0.9693852, -0.5147933, 1.614015, 1, 0, 0.8117647, 1,
0.975116, 1.624644, -0.148834, 1, 0, 0.8039216, 1,
0.9758869, -0.9035823, 2.52588, 1, 0, 0.7960784, 1,
0.9788954, 0.1936682, 1.511406, 1, 0, 0.7921569, 1,
0.9879057, -0.294791, 0.3895169, 1, 0, 0.7843137, 1,
0.9893858, 0.3682792, 1.429197, 1, 0, 0.7803922, 1,
0.9913787, 1.346524, 0.6768273, 1, 0, 0.772549, 1,
0.9969768, -1.4235, 1.888836, 1, 0, 0.7686275, 1,
1.009968, 0.02920466, 1.539563, 1, 0, 0.7607843, 1,
1.015666, -1.025333, 3.184451, 1, 0, 0.7568628, 1,
1.028591, 1.709534, 1.083295, 1, 0, 0.7490196, 1,
1.030081, -0.5291712, 2.64869, 1, 0, 0.7450981, 1,
1.033382, -0.8971584, 1.917632, 1, 0, 0.7372549, 1,
1.03829, -2.335179, 2.893548, 1, 0, 0.7333333, 1,
1.044419, -1.185721, 2.930618, 1, 0, 0.7254902, 1,
1.046817, -0.1409782, 1.889211, 1, 0, 0.7215686, 1,
1.050102, 0.1525602, 1.651933, 1, 0, 0.7137255, 1,
1.052892, -0.59185, 1.63024, 1, 0, 0.7098039, 1,
1.056649, 1.174244, -0.8039376, 1, 0, 0.7019608, 1,
1.057799, -1.024494, 2.868411, 1, 0, 0.6941177, 1,
1.062204, 0.04530298, 1.962081, 1, 0, 0.6901961, 1,
1.072871, -0.5852487, 2.006859, 1, 0, 0.682353, 1,
1.081021, 0.7841405, -0.2382649, 1, 0, 0.6784314, 1,
1.082376, 1.25929, 2.648688, 1, 0, 0.6705883, 1,
1.100953, 0.6882427, 0.7512478, 1, 0, 0.6666667, 1,
1.101426, -0.7138318, 2.930291, 1, 0, 0.6588235, 1,
1.117997, 0.2622245, 0.1414602, 1, 0, 0.654902, 1,
1.123164, -1.774209, 2.467805, 1, 0, 0.6470588, 1,
1.127055, -0.2426488, 0.9747796, 1, 0, 0.6431373, 1,
1.138405, -2.041918, 4.081576, 1, 0, 0.6352941, 1,
1.147172, 0.4776043, 2.583761, 1, 0, 0.6313726, 1,
1.150661, 0.1156246, 2.388193, 1, 0, 0.6235294, 1,
1.153819, -0.1357385, 2.35367, 1, 0, 0.6196079, 1,
1.155069, -1.13214, 2.033369, 1, 0, 0.6117647, 1,
1.159554, -0.4074714, 1.020843, 1, 0, 0.6078432, 1,
1.16431, -0.5856211, 2.095783, 1, 0, 0.6, 1,
1.1731, 0.3536117, 1.352052, 1, 0, 0.5921569, 1,
1.190731, -0.7135355, 0.9536122, 1, 0, 0.5882353, 1,
1.206723, 0.3280235, -0.788757, 1, 0, 0.5803922, 1,
1.210522, -0.6100302, 2.488187, 1, 0, 0.5764706, 1,
1.213591, 0.3498245, 1.188399, 1, 0, 0.5686275, 1,
1.221359, 1.49191, 0.9951944, 1, 0, 0.5647059, 1,
1.221869, -1.829775, 2.567425, 1, 0, 0.5568628, 1,
1.229421, 0.6548638, 0.4458614, 1, 0, 0.5529412, 1,
1.230868, 0.2594048, 2.012622, 1, 0, 0.5450981, 1,
1.234035, -1.143044, 1.705021, 1, 0, 0.5411765, 1,
1.23705, 1.58052, -0.0296946, 1, 0, 0.5333334, 1,
1.237689, -0.3063682, 3.038961, 1, 0, 0.5294118, 1,
1.271244, 1.89103, 0.3301071, 1, 0, 0.5215687, 1,
1.277874, -0.1731924, 3.061736, 1, 0, 0.5176471, 1,
1.285602, -1.475853, 3.201599, 1, 0, 0.509804, 1,
1.288095, 0.2018984, 2.353106, 1, 0, 0.5058824, 1,
1.289698, -1.097284, 0.9924931, 1, 0, 0.4980392, 1,
1.298467, 2.417645, 1.977463, 1, 0, 0.4901961, 1,
1.299334, 0.1932696, 2.583587, 1, 0, 0.4862745, 1,
1.311316, -0.8866572, 1.201919, 1, 0, 0.4784314, 1,
1.316416, 0.2179562, -0.1212712, 1, 0, 0.4745098, 1,
1.334871, -0.6668466, 1.969362, 1, 0, 0.4666667, 1,
1.335112, 0.6272119, 3.748837, 1, 0, 0.4627451, 1,
1.336735, -0.4001156, 2.553226, 1, 0, 0.454902, 1,
1.337299, 0.5731285, 1.447282, 1, 0, 0.4509804, 1,
1.350089, -0.1749368, 1.7447, 1, 0, 0.4431373, 1,
1.352054, 0.2779457, -0.1781205, 1, 0, 0.4392157, 1,
1.361318, 0.05107908, 0.4680424, 1, 0, 0.4313726, 1,
1.367164, 0.2743269, 1.6476, 1, 0, 0.427451, 1,
1.371282, -0.1844389, 0.9776001, 1, 0, 0.4196078, 1,
1.377158, -1.566232, 3.351484, 1, 0, 0.4156863, 1,
1.377288, 0.2592518, -0.4797552, 1, 0, 0.4078431, 1,
1.379452, 1.455084, 0.9584357, 1, 0, 0.4039216, 1,
1.387835, 0.03145042, 2.81272, 1, 0, 0.3960784, 1,
1.395871, -0.4428564, 0.602522, 1, 0, 0.3882353, 1,
1.41081, 0.5329977, 1.420741, 1, 0, 0.3843137, 1,
1.416209, -0.7971106, 2.673679, 1, 0, 0.3764706, 1,
1.442415, 0.4633244, -0.9399648, 1, 0, 0.372549, 1,
1.446127, 0.1034273, 0.4253329, 1, 0, 0.3647059, 1,
1.446861, 0.09721912, 1.652829, 1, 0, 0.3607843, 1,
1.455555, 0.7090798, 0.8457105, 1, 0, 0.3529412, 1,
1.4686, 0.3074457, 3.937236, 1, 0, 0.3490196, 1,
1.469963, -0.02985959, 0.205245, 1, 0, 0.3411765, 1,
1.474135, -1.278897, 1.642923, 1, 0, 0.3372549, 1,
1.483194, -0.6092342, 1.309466, 1, 0, 0.3294118, 1,
1.502932, 0.3038834, 2.222867, 1, 0, 0.3254902, 1,
1.511295, 0.1192655, 1.380126, 1, 0, 0.3176471, 1,
1.517023, 0.03702539, -0.5206515, 1, 0, 0.3137255, 1,
1.52223, -0.4687991, 1.682322, 1, 0, 0.3058824, 1,
1.526704, 1.650292, 2.164793, 1, 0, 0.2980392, 1,
1.529067, -0.08471143, 1.494556, 1, 0, 0.2941177, 1,
1.541317, 1.831375, 0.6941193, 1, 0, 0.2862745, 1,
1.5426, -1.371141, 3.539346, 1, 0, 0.282353, 1,
1.543535, -2.715691, 3.197572, 1, 0, 0.2745098, 1,
1.545136, -0.03977919, 1.214356, 1, 0, 0.2705882, 1,
1.554775, 0.3756093, 0.31631, 1, 0, 0.2627451, 1,
1.563505, -0.2572535, 0.8602734, 1, 0, 0.2588235, 1,
1.564523, 0.1353327, 2.677247, 1, 0, 0.2509804, 1,
1.576685, -1.04466, 4.202614, 1, 0, 0.2470588, 1,
1.612099, 0.4156302, 1.49348, 1, 0, 0.2392157, 1,
1.616417, 0.3679685, 0.07261124, 1, 0, 0.2352941, 1,
1.619858, 0.3974535, 0.851432, 1, 0, 0.227451, 1,
1.649616, -1.60712, 0.8783161, 1, 0, 0.2235294, 1,
1.653791, -0.5319681, 0.9633898, 1, 0, 0.2156863, 1,
1.656635, 0.3790944, -0.05200859, 1, 0, 0.2117647, 1,
1.664968, -0.1031075, 3.823916, 1, 0, 0.2039216, 1,
1.665975, 1.336006, -0.5930144, 1, 0, 0.1960784, 1,
1.705808, 0.6639405, 0.0769982, 1, 0, 0.1921569, 1,
1.710281, -0.1942972, 0.7943704, 1, 0, 0.1843137, 1,
1.723722, 0.5040258, 1.611707, 1, 0, 0.1803922, 1,
1.733333, -0.381741, 1.586137, 1, 0, 0.172549, 1,
1.749599, -1.024355, 0.6867846, 1, 0, 0.1686275, 1,
1.758957, 2.961478, 0.9565188, 1, 0, 0.1607843, 1,
1.819225, 1.082743, -0.1737622, 1, 0, 0.1568628, 1,
1.862581, -1.743291, 2.103196, 1, 0, 0.1490196, 1,
1.878728, -0.7450244, 2.801844, 1, 0, 0.145098, 1,
1.895857, 0.5954293, 0.2742782, 1, 0, 0.1372549, 1,
1.905883, -1.467766, 2.731689, 1, 0, 0.1333333, 1,
1.971406, 0.5184247, 1.687023, 1, 0, 0.1254902, 1,
1.982811, 0.08984636, 1.694899, 1, 0, 0.1215686, 1,
1.995601, 0.1243564, -0.1015826, 1, 0, 0.1137255, 1,
2.026339, -1.117171, 2.303103, 1, 0, 0.1098039, 1,
2.031829, -1.173897, 3.338381, 1, 0, 0.1019608, 1,
2.037546, -1.497205, 1.522737, 1, 0, 0.09411765, 1,
2.064165, 0.933451, 1.490783, 1, 0, 0.09019608, 1,
2.066056, -0.1679276, 2.212866, 1, 0, 0.08235294, 1,
2.08501, -1.359357, 2.398492, 1, 0, 0.07843138, 1,
2.118961, -1.461944, 1.550081, 1, 0, 0.07058824, 1,
2.122406, -1.234691, 1.944197, 1, 0, 0.06666667, 1,
2.125348, -1.145639, 0.5754253, 1, 0, 0.05882353, 1,
2.30371, -0.4183715, 1.488036, 1, 0, 0.05490196, 1,
2.309463, 0.210937, 2.545165, 1, 0, 0.04705882, 1,
2.414278, 0.06939168, 3.282778, 1, 0, 0.04313726, 1,
2.417657, 0.5897891, 0.1144445, 1, 0, 0.03529412, 1,
2.46285, 1.881575, 1.387097, 1, 0, 0.03137255, 1,
2.483075, -0.2279414, 1.436443, 1, 0, 0.02352941, 1,
2.523899, 0.9926434, 0.9036893, 1, 0, 0.01960784, 1,
2.613069, -0.9515562, 3.055618, 1, 0, 0.01176471, 1,
3.166993, 1.095856, 1.095119, 1, 0, 0.007843138, 1
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
0.05480683, -4.084813, -7.605284, 0, -0.5, 0.5, 0.5,
0.05480683, -4.084813, -7.605284, 1, -0.5, 0.5, 0.5,
0.05480683, -4.084813, -7.605284, 1, 1.5, 0.5, 0.5,
0.05480683, -4.084813, -7.605284, 0, 1.5, 0.5, 0.5
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
-4.112411, 0.2523315, -7.605284, 0, -0.5, 0.5, 0.5,
-4.112411, 0.2523315, -7.605284, 1, -0.5, 0.5, 0.5,
-4.112411, 0.2523315, -7.605284, 1, 1.5, 0.5, 0.5,
-4.112411, 0.2523315, -7.605284, 0, 1.5, 0.5, 0.5
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
-4.112411, -4.084813, 0.2017241, 0, -0.5, 0.5, 0.5,
-4.112411, -4.084813, 0.2017241, 1, -0.5, 0.5, 0.5,
-4.112411, -4.084813, 0.2017241, 1, 1.5, 0.5, 0.5,
-4.112411, -4.084813, 0.2017241, 0, 1.5, 0.5, 0.5
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
-3, -3.083933, -5.803667,
3, -3.083933, -5.803667,
-3, -3.083933, -5.803667,
-3, -3.250746, -6.103936,
-2, -3.083933, -5.803667,
-2, -3.250746, -6.103936,
-1, -3.083933, -5.803667,
-1, -3.250746, -6.103936,
0, -3.083933, -5.803667,
0, -3.250746, -6.103936,
1, -3.083933, -5.803667,
1, -3.250746, -6.103936,
2, -3.083933, -5.803667,
2, -3.250746, -6.103936,
3, -3.083933, -5.803667,
3, -3.250746, -6.103936
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
-3, -3.584373, -6.704475, 0, -0.5, 0.5, 0.5,
-3, -3.584373, -6.704475, 1, -0.5, 0.5, 0.5,
-3, -3.584373, -6.704475, 1, 1.5, 0.5, 0.5,
-3, -3.584373, -6.704475, 0, 1.5, 0.5, 0.5,
-2, -3.584373, -6.704475, 0, -0.5, 0.5, 0.5,
-2, -3.584373, -6.704475, 1, -0.5, 0.5, 0.5,
-2, -3.584373, -6.704475, 1, 1.5, 0.5, 0.5,
-2, -3.584373, -6.704475, 0, 1.5, 0.5, 0.5,
-1, -3.584373, -6.704475, 0, -0.5, 0.5, 0.5,
-1, -3.584373, -6.704475, 1, -0.5, 0.5, 0.5,
-1, -3.584373, -6.704475, 1, 1.5, 0.5, 0.5,
-1, -3.584373, -6.704475, 0, 1.5, 0.5, 0.5,
0, -3.584373, -6.704475, 0, -0.5, 0.5, 0.5,
0, -3.584373, -6.704475, 1, -0.5, 0.5, 0.5,
0, -3.584373, -6.704475, 1, 1.5, 0.5, 0.5,
0, -3.584373, -6.704475, 0, 1.5, 0.5, 0.5,
1, -3.584373, -6.704475, 0, -0.5, 0.5, 0.5,
1, -3.584373, -6.704475, 1, -0.5, 0.5, 0.5,
1, -3.584373, -6.704475, 1, 1.5, 0.5, 0.5,
1, -3.584373, -6.704475, 0, 1.5, 0.5, 0.5,
2, -3.584373, -6.704475, 0, -0.5, 0.5, 0.5,
2, -3.584373, -6.704475, 1, -0.5, 0.5, 0.5,
2, -3.584373, -6.704475, 1, 1.5, 0.5, 0.5,
2, -3.584373, -6.704475, 0, 1.5, 0.5, 0.5,
3, -3.584373, -6.704475, 0, -0.5, 0.5, 0.5,
3, -3.584373, -6.704475, 1, -0.5, 0.5, 0.5,
3, -3.584373, -6.704475, 1, 1.5, 0.5, 0.5,
3, -3.584373, -6.704475, 0, 1.5, 0.5, 0.5
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
-3.150745, -2, -5.803667,
-3.150745, 3, -5.803667,
-3.150745, -2, -5.803667,
-3.311023, -2, -6.103936,
-3.150745, -1, -5.803667,
-3.311023, -1, -6.103936,
-3.150745, 0, -5.803667,
-3.311023, 0, -6.103936,
-3.150745, 1, -5.803667,
-3.311023, 1, -6.103936,
-3.150745, 2, -5.803667,
-3.311023, 2, -6.103936,
-3.150745, 3, -5.803667,
-3.311023, 3, -6.103936
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
-3.631578, -2, -6.704475, 0, -0.5, 0.5, 0.5,
-3.631578, -2, -6.704475, 1, -0.5, 0.5, 0.5,
-3.631578, -2, -6.704475, 1, 1.5, 0.5, 0.5,
-3.631578, -2, -6.704475, 0, 1.5, 0.5, 0.5,
-3.631578, -1, -6.704475, 0, -0.5, 0.5, 0.5,
-3.631578, -1, -6.704475, 1, -0.5, 0.5, 0.5,
-3.631578, -1, -6.704475, 1, 1.5, 0.5, 0.5,
-3.631578, -1, -6.704475, 0, 1.5, 0.5, 0.5,
-3.631578, 0, -6.704475, 0, -0.5, 0.5, 0.5,
-3.631578, 0, -6.704475, 1, -0.5, 0.5, 0.5,
-3.631578, 0, -6.704475, 1, 1.5, 0.5, 0.5,
-3.631578, 0, -6.704475, 0, 1.5, 0.5, 0.5,
-3.631578, 1, -6.704475, 0, -0.5, 0.5, 0.5,
-3.631578, 1, -6.704475, 1, -0.5, 0.5, 0.5,
-3.631578, 1, -6.704475, 1, 1.5, 0.5, 0.5,
-3.631578, 1, -6.704475, 0, 1.5, 0.5, 0.5,
-3.631578, 2, -6.704475, 0, -0.5, 0.5, 0.5,
-3.631578, 2, -6.704475, 1, -0.5, 0.5, 0.5,
-3.631578, 2, -6.704475, 1, 1.5, 0.5, 0.5,
-3.631578, 2, -6.704475, 0, 1.5, 0.5, 0.5,
-3.631578, 3, -6.704475, 0, -0.5, 0.5, 0.5,
-3.631578, 3, -6.704475, 1, -0.5, 0.5, 0.5,
-3.631578, 3, -6.704475, 1, 1.5, 0.5, 0.5,
-3.631578, 3, -6.704475, 0, 1.5, 0.5, 0.5
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
-3.150745, -3.083933, -4,
-3.150745, -3.083933, 6,
-3.150745, -3.083933, -4,
-3.311023, -3.250746, -4,
-3.150745, -3.083933, -2,
-3.311023, -3.250746, -2,
-3.150745, -3.083933, 0,
-3.311023, -3.250746, 0,
-3.150745, -3.083933, 2,
-3.311023, -3.250746, 2,
-3.150745, -3.083933, 4,
-3.311023, -3.250746, 4,
-3.150745, -3.083933, 6,
-3.311023, -3.250746, 6
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
"4",
"6"
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
-3.631578, -3.584373, -4, 0, -0.5, 0.5, 0.5,
-3.631578, -3.584373, -4, 1, -0.5, 0.5, 0.5,
-3.631578, -3.584373, -4, 1, 1.5, 0.5, 0.5,
-3.631578, -3.584373, -4, 0, 1.5, 0.5, 0.5,
-3.631578, -3.584373, -2, 0, -0.5, 0.5, 0.5,
-3.631578, -3.584373, -2, 1, -0.5, 0.5, 0.5,
-3.631578, -3.584373, -2, 1, 1.5, 0.5, 0.5,
-3.631578, -3.584373, -2, 0, 1.5, 0.5, 0.5,
-3.631578, -3.584373, 0, 0, -0.5, 0.5, 0.5,
-3.631578, -3.584373, 0, 1, -0.5, 0.5, 0.5,
-3.631578, -3.584373, 0, 1, 1.5, 0.5, 0.5,
-3.631578, -3.584373, 0, 0, 1.5, 0.5, 0.5,
-3.631578, -3.584373, 2, 0, -0.5, 0.5, 0.5,
-3.631578, -3.584373, 2, 1, -0.5, 0.5, 0.5,
-3.631578, -3.584373, 2, 1, 1.5, 0.5, 0.5,
-3.631578, -3.584373, 2, 0, 1.5, 0.5, 0.5,
-3.631578, -3.584373, 4, 0, -0.5, 0.5, 0.5,
-3.631578, -3.584373, 4, 1, -0.5, 0.5, 0.5,
-3.631578, -3.584373, 4, 1, 1.5, 0.5, 0.5,
-3.631578, -3.584373, 4, 0, 1.5, 0.5, 0.5,
-3.631578, -3.584373, 6, 0, -0.5, 0.5, 0.5,
-3.631578, -3.584373, 6, 1, -0.5, 0.5, 0.5,
-3.631578, -3.584373, 6, 1, 1.5, 0.5, 0.5,
-3.631578, -3.584373, 6, 0, 1.5, 0.5, 0.5
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
-3.150745, -3.083933, -5.803667,
-3.150745, 3.588596, -5.803667,
-3.150745, -3.083933, 6.207115,
-3.150745, 3.588596, 6.207115,
-3.150745, -3.083933, -5.803667,
-3.150745, -3.083933, 6.207115,
-3.150745, 3.588596, -5.803667,
-3.150745, 3.588596, 6.207115,
-3.150745, -3.083933, -5.803667,
3.260359, -3.083933, -5.803667,
-3.150745, -3.083933, 6.207115,
3.260359, -3.083933, 6.207115,
-3.150745, 3.588596, -5.803667,
3.260359, 3.588596, -5.803667,
-3.150745, 3.588596, 6.207115,
3.260359, 3.588596, 6.207115,
3.260359, -3.083933, -5.803667,
3.260359, 3.588596, -5.803667,
3.260359, -3.083933, 6.207115,
3.260359, 3.588596, 6.207115,
3.260359, -3.083933, -5.803667,
3.260359, -3.083933, 6.207115,
3.260359, 3.588596, -5.803667,
3.260359, 3.588596, 6.207115
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
var radius = 8.09617;
var distance = 36.02077;
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
mvMatrix.translate( -0.05480683, -0.2523315, -0.2017241 );
mvMatrix.scale( 1.365402, 1.311907, 0.7288234 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.02077);
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
gl.drawArrays(gl.LINES, 0, 14);
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
gl.drawElements(gl.TRIANGLES, 36, gl.UNSIGNED_SHORT, 0);
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
Tartar_emetic<-read.table("Tartar_emetic.xyz")
```

```
## Error in read.table("Tartar_emetic.xyz"): no lines available in input
```

```r
x<-Tartar_emetic$V2
```

```
## Error in eval(expr, envir, enclos): object 'Tartar_emetic' not found
```

```r
y<-Tartar_emetic$V3
```

```
## Error in eval(expr, envir, enclos): object 'Tartar_emetic' not found
```

```r
z<-Tartar_emetic$V4
```

```
## Error in eval(expr, envir, enclos): object 'Tartar_emetic' not found
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
-3.05738, -0.4252883, -2.043567, 0, 0, 1, 1, 1,
-3.007141, 1.044215, -0.4872752, 1, 0, 0, 1, 1,
-2.954649, 0.8965563, 0.3508657, 1, 0, 0, 1, 1,
-2.600026, -0.1217928, -2.02003, 1, 0, 0, 1, 1,
-2.463239, 0.4213069, -1.884441, 1, 0, 0, 1, 1,
-2.281755, 2.523309, -0.5561094, 1, 0, 0, 1, 1,
-2.243221, 0.8555914, -0.1909538, 0, 0, 0, 1, 1,
-2.178378, 0.3782282, -0.7867554, 0, 0, 0, 1, 1,
-2.159346, 2.664448, 0.3647361, 0, 0, 0, 1, 1,
-2.042393, 1.829989, -1.604547, 0, 0, 0, 1, 1,
-2.034199, 0.9673179, 0.03797314, 0, 0, 0, 1, 1,
-1.976712, 1.732757, -1.289991, 0, 0, 0, 1, 1,
-1.947353, 0.4638222, -3.03096, 0, 0, 0, 1, 1,
-1.939837, -0.8314024, -2.75049, 1, 1, 1, 1, 1,
-1.912995, -0.5064008, -2.929125, 1, 1, 1, 1, 1,
-1.909792, 0.2162317, -2.959473, 1, 1, 1, 1, 1,
-1.874353, 1.117212, -2.504993, 1, 1, 1, 1, 1,
-1.870425, -0.2606624, -1.876948, 1, 1, 1, 1, 1,
-1.862785, -0.4828778, -0.6133891, 1, 1, 1, 1, 1,
-1.84015, -1.236709, -1.568833, 1, 1, 1, 1, 1,
-1.836548, 1.501133, -0.9756285, 1, 1, 1, 1, 1,
-1.816018, -0.3876734, -2.218808, 1, 1, 1, 1, 1,
-1.784212, 0.8074652, 0.4694437, 1, 1, 1, 1, 1,
-1.78103, 1.470143, -2.199099, 1, 1, 1, 1, 1,
-1.772672, 0.05883852, -0.01035305, 1, 1, 1, 1, 1,
-1.772119, -1.951959, -4.726088, 1, 1, 1, 1, 1,
-1.770439, 0.4019088, -1.245676, 1, 1, 1, 1, 1,
-1.766483, 2.238967, -0.4703609, 1, 1, 1, 1, 1,
-1.723256, 1.007886, 0.9713098, 0, 0, 1, 1, 1,
-1.718958, 0.4202203, -1.455028, 1, 0, 0, 1, 1,
-1.71383, 0.7476156, -1.077215, 1, 0, 0, 1, 1,
-1.702044, 0.003310847, -2.427847, 1, 0, 0, 1, 1,
-1.691363, -1.012949, -1.965861, 1, 0, 0, 1, 1,
-1.689902, 0.2605816, -3.49574, 1, 0, 0, 1, 1,
-1.677817, -0.4163332, -1.127624, 0, 0, 0, 1, 1,
-1.659646, 0.02878367, -2.73197, 0, 0, 0, 1, 1,
-1.656446, -0.3314144, -2.086088, 0, 0, 0, 1, 1,
-1.646499, -0.2620473, -2.398939, 0, 0, 0, 1, 1,
-1.636613, -0.2269437, -2.439523, 0, 0, 0, 1, 1,
-1.627177, -0.2764547, -3.563244, 0, 0, 0, 1, 1,
-1.620004, 0.1932022, -2.577014, 0, 0, 0, 1, 1,
-1.612996, 1.114351, -0.1343261, 1, 1, 1, 1, 1,
-1.612539, 0.2553809, -1.505335, 1, 1, 1, 1, 1,
-1.606385, 0.6145017, -2.183311, 1, 1, 1, 1, 1,
-1.601871, -0.103845, -1.30112, 1, 1, 1, 1, 1,
-1.600869, -0.573056, -3.956556, 1, 1, 1, 1, 1,
-1.599237, -1.320894, -1.58223, 1, 1, 1, 1, 1,
-1.583521, 1.461951, 0.05161157, 1, 1, 1, 1, 1,
-1.572452, 1.197078, 1.269611, 1, 1, 1, 1, 1,
-1.5513, 1.904019, -0.5932571, 1, 1, 1, 1, 1,
-1.550894, 0.5984873, -1.369214, 1, 1, 1, 1, 1,
-1.550264, 0.284513, -1.904009, 1, 1, 1, 1, 1,
-1.534987, 0.457085, 0.2673458, 1, 1, 1, 1, 1,
-1.534337, 0.2847615, -1.1261, 1, 1, 1, 1, 1,
-1.511471, -0.1849652, -0.4783384, 1, 1, 1, 1, 1,
-1.501456, -0.3416837, -2.317202, 1, 1, 1, 1, 1,
-1.496404, 0.2691186, -2.089454, 0, 0, 1, 1, 1,
-1.495937, -0.2185132, -3.992985, 1, 0, 0, 1, 1,
-1.494558, -1.416711, -2.445269, 1, 0, 0, 1, 1,
-1.49305, -0.6427242, -0.1891934, 1, 0, 0, 1, 1,
-1.482928, -1.085961, -3.205369, 1, 0, 0, 1, 1,
-1.475928, 1.001315, -1.107405, 1, 0, 0, 1, 1,
-1.475482, 0.3730586, -1.894833, 0, 0, 0, 1, 1,
-1.462089, 0.1643354, -0.1228304, 0, 0, 0, 1, 1,
-1.441802, -1.025423, -2.366673, 0, 0, 0, 1, 1,
-1.440416, -0.2089369, -1.0367, 0, 0, 0, 1, 1,
-1.434541, 1.038278, -2.25206, 0, 0, 0, 1, 1,
-1.434334, -0.1891899, -1.497404, 0, 0, 0, 1, 1,
-1.427904, 0.2247769, -1.448158, 0, 0, 0, 1, 1,
-1.420806, 1.018021, -1.386002, 1, 1, 1, 1, 1,
-1.41073, -0.45201, -2.739128, 1, 1, 1, 1, 1,
-1.403405, 0.8826256, -1.36762, 1, 1, 1, 1, 1,
-1.374926, 0.1919664, -1.810502, 1, 1, 1, 1, 1,
-1.368543, 0.7502852, 0.257747, 1, 1, 1, 1, 1,
-1.365326, -0.1275359, -2.50867, 1, 1, 1, 1, 1,
-1.364939, 1.078398, -1.597038, 1, 1, 1, 1, 1,
-1.362343, 1.246239, -1.974645, 1, 1, 1, 1, 1,
-1.351323, -0.5594549, -1.5668, 1, 1, 1, 1, 1,
-1.35041, -1.667907, -3.437165, 1, 1, 1, 1, 1,
-1.347747, 0.6612363, -1.291932, 1, 1, 1, 1, 1,
-1.343644, -1.196793, -1.247577, 1, 1, 1, 1, 1,
-1.342289, -0.4852321, -2.250681, 1, 1, 1, 1, 1,
-1.339469, 0.9099208, -0.8091937, 1, 1, 1, 1, 1,
-1.333752, -1.347936, -2.6927, 1, 1, 1, 1, 1,
-1.325105, 1.403856, -2.077346, 0, 0, 1, 1, 1,
-1.319501, 0.00464885, -1.880593, 1, 0, 0, 1, 1,
-1.313321, 0.1368086, -0.5914974, 1, 0, 0, 1, 1,
-1.311759, -1.677078, -2.977914, 1, 0, 0, 1, 1,
-1.305534, -0.3436414, -1.521305, 1, 0, 0, 1, 1,
-1.300812, 1.538448, -0.9045671, 1, 0, 0, 1, 1,
-1.300513, -0.606877, -2.327536, 0, 0, 0, 1, 1,
-1.296354, -0.6420118, -1.671062, 0, 0, 0, 1, 1,
-1.291351, -0.9344232, -4.469169, 0, 0, 0, 1, 1,
-1.283427, -1.552939, -2.672251, 0, 0, 0, 1, 1,
-1.282729, 1.311668, -0.5393492, 0, 0, 0, 1, 1,
-1.280015, -1.545612, -3.381962, 0, 0, 0, 1, 1,
-1.278556, 0.3380779, -0.6546589, 0, 0, 0, 1, 1,
-1.277769, -0.8021482, -2.568487, 1, 1, 1, 1, 1,
-1.270469, -1.717841, -1.739122, 1, 1, 1, 1, 1,
-1.266264, -0.8810415, -3.530816, 1, 1, 1, 1, 1,
-1.265326, -0.4745845, -0.5933868, 1, 1, 1, 1, 1,
-1.261474, -0.5821301, -2.173369, 1, 1, 1, 1, 1,
-1.246885, -0.1043246, -0.9882019, 1, 1, 1, 1, 1,
-1.240312, -1.264288, -2.353795, 1, 1, 1, 1, 1,
-1.235552, -1.4633, 1.008194, 1, 1, 1, 1, 1,
-1.234188, -0.9049709, -2.811223, 1, 1, 1, 1, 1,
-1.23329, 0.2675836, -0.7504455, 1, 1, 1, 1, 1,
-1.230612, 0.5130617, -1.243691, 1, 1, 1, 1, 1,
-1.229036, -0.709727, -3.065538, 1, 1, 1, 1, 1,
-1.227032, -0.02062952, -1.152986, 1, 1, 1, 1, 1,
-1.224402, -1.026186, -2.141166, 1, 1, 1, 1, 1,
-1.212721, 0.131278, -1.876793, 1, 1, 1, 1, 1,
-1.204307, -1.30937, -1.988739, 0, 0, 1, 1, 1,
-1.192591, 0.2727688, -3.11101, 1, 0, 0, 1, 1,
-1.192145, -1.222908, -1.453984, 1, 0, 0, 1, 1,
-1.187406, 0.1565272, -2.208875, 1, 0, 0, 1, 1,
-1.18657, -0.1400051, -1.978437, 1, 0, 0, 1, 1,
-1.184726, -0.3566273, -1.513923, 1, 0, 0, 1, 1,
-1.171493, -1.586956, -3.762921, 0, 0, 0, 1, 1,
-1.1709, -0.3032264, -2.12812, 0, 0, 0, 1, 1,
-1.17054, 0.5727428, -2.71786, 0, 0, 0, 1, 1,
-1.169323, -1.159979, -2.71235, 0, 0, 0, 1, 1,
-1.16564, -0.1576182, -1.519857, 0, 0, 0, 1, 1,
-1.164582, 0.9206761, -2.460453, 0, 0, 0, 1, 1,
-1.160538, 0.3947605, -1.246157, 0, 0, 0, 1, 1,
-1.149863, 1.972003, -1.973673, 1, 1, 1, 1, 1,
-1.148716, -1.070024, -2.639724, 1, 1, 1, 1, 1,
-1.1448, -0.02201102, -2.09078, 1, 1, 1, 1, 1,
-1.139818, 0.9581814, -0.7142212, 1, 1, 1, 1, 1,
-1.138746, -0.212823, -2.007581, 1, 1, 1, 1, 1,
-1.137837, -0.8312771, -2.796793, 1, 1, 1, 1, 1,
-1.135618, 1.882116, 0.2053719, 1, 1, 1, 1, 1,
-1.132212, -1.202127, -5.628752, 1, 1, 1, 1, 1,
-1.129637, 0.2204972, -0.2688712, 1, 1, 1, 1, 1,
-1.128204, -0.03698157, -1.564263, 1, 1, 1, 1, 1,
-1.117776, -1.485121, -2.697564, 1, 1, 1, 1, 1,
-1.107513, 0.6277729, -1.600895, 1, 1, 1, 1, 1,
-1.105578, 0.9156734, 0.5142719, 1, 1, 1, 1, 1,
-1.10283, 1.574352, 0.7217532, 1, 1, 1, 1, 1,
-1.093812, -0.3974737, -2.876267, 1, 1, 1, 1, 1,
-1.086423, 0.6281597, 0.1617077, 0, 0, 1, 1, 1,
-1.079708, -0.5895769, -2.117301, 1, 0, 0, 1, 1,
-1.073425, -1.106657, -3.093234, 1, 0, 0, 1, 1,
-1.072374, 0.7958466, -0.7053925, 1, 0, 0, 1, 1,
-1.071953, 0.7714093, -1.561953, 1, 0, 0, 1, 1,
-1.069829, -0.6614698, -2.02001, 1, 0, 0, 1, 1,
-1.068977, 1.151929, 1.354939, 0, 0, 0, 1, 1,
-1.067183, 0.06472339, 0.6393553, 0, 0, 0, 1, 1,
-1.06343, 0.5707292, -0.7150402, 0, 0, 0, 1, 1,
-1.062233, 0.3607207, -1.775807, 0, 0, 0, 1, 1,
-1.059301, -0.8524659, -3.384814, 0, 0, 0, 1, 1,
-1.048043, -1.14204, -0.7081251, 0, 0, 0, 1, 1,
-1.044469, -1.341702, -2.195513, 0, 0, 0, 1, 1,
-1.041253, -0.8256866, -2.142798, 1, 1, 1, 1, 1,
-1.040762, 1.014367, -2.366602, 1, 1, 1, 1, 1,
-1.039648, 0.5818521, -2.129614, 1, 1, 1, 1, 1,
-1.038357, -0.4074928, -1.429308, 1, 1, 1, 1, 1,
-1.035699, 0.5174195, -1.823932, 1, 1, 1, 1, 1,
-1.027684, 1.073852, -2.12109, 1, 1, 1, 1, 1,
-1.020698, 0.5841218, -1.808616, 1, 1, 1, 1, 1,
-1.008889, 0.4791693, -1.669929, 1, 1, 1, 1, 1,
-1.004133, 1.144024, 1.458449, 1, 1, 1, 1, 1,
-0.9970904, 0.8179532, -2.018907, 1, 1, 1, 1, 1,
-0.9898219, -0.3244149, -2.477154, 1, 1, 1, 1, 1,
-0.9894917, -1.383406, -1.327768, 1, 1, 1, 1, 1,
-0.9802793, 0.7104781, -1.854598, 1, 1, 1, 1, 1,
-0.9773952, -1.500512, -3.65173, 1, 1, 1, 1, 1,
-0.975776, 1.039829, -0.6058218, 1, 1, 1, 1, 1,
-0.9712843, -0.5731946, -1.696593, 0, 0, 1, 1, 1,
-0.9649918, -0.1582391, -0.424826, 1, 0, 0, 1, 1,
-0.963814, -0.7550101, -1.397951, 1, 0, 0, 1, 1,
-0.9626822, -2.6688, -2.41099, 1, 0, 0, 1, 1,
-0.9573235, -0.7397896, -3.503908, 1, 0, 0, 1, 1,
-0.9537103, -0.1810539, -1.019498, 1, 0, 0, 1, 1,
-0.952043, -0.940941, -1.948233, 0, 0, 0, 1, 1,
-0.9413052, 0.9696608, -1.634109, 0, 0, 0, 1, 1,
-0.9377567, 1.892369, -0.4124388, 0, 0, 0, 1, 1,
-0.9364934, -0.7795832, -3.984439, 0, 0, 0, 1, 1,
-0.9337924, 0.7041571, -1.60682, 0, 0, 0, 1, 1,
-0.9227695, -0.3957897, -2.995465, 0, 0, 0, 1, 1,
-0.9226071, 0.8246478, -0.1935102, 0, 0, 0, 1, 1,
-0.9027217, -0.364371, -2.112763, 1, 1, 1, 1, 1,
-0.9026748, -0.5279543, -1.592257, 1, 1, 1, 1, 1,
-0.9005591, -1.784024, -2.985331, 1, 1, 1, 1, 1,
-0.8970179, 0.1061381, -0.6034948, 1, 1, 1, 1, 1,
-0.891127, -0.09388745, -1.570633, 1, 1, 1, 1, 1,
-0.8898615, -0.6328036, -1.219889, 1, 1, 1, 1, 1,
-0.8885608, 0.7654928, -0.3216012, 1, 1, 1, 1, 1,
-0.8824623, 0.3606752, -0.5017706, 1, 1, 1, 1, 1,
-0.874332, 0.882654, 0.2266529, 1, 1, 1, 1, 1,
-0.8674757, -1.607318, -4.04884, 1, 1, 1, 1, 1,
-0.8652095, -0.05657686, -3.699616, 1, 1, 1, 1, 1,
-0.8646153, 0.7146588, -1.803123, 1, 1, 1, 1, 1,
-0.8569866, 0.2067242, -0.4281001, 1, 1, 1, 1, 1,
-0.8531954, -1.884884, -2.747295, 1, 1, 1, 1, 1,
-0.8507003, -0.7756758, -1.724918, 1, 1, 1, 1, 1,
-0.8457632, -1.401113, -3.061042, 0, 0, 1, 1, 1,
-0.8435378, -0.2142735, -2.123114, 1, 0, 0, 1, 1,
-0.8312899, -0.696345, -0.3189929, 1, 0, 0, 1, 1,
-0.8257576, -0.4702353, -2.443667, 1, 0, 0, 1, 1,
-0.8171551, 0.07595366, -3.537685, 1, 0, 0, 1, 1,
-0.8140942, 0.320426, 0.3516581, 1, 0, 0, 1, 1,
-0.8128875, -0.3976591, -2.478468, 0, 0, 0, 1, 1,
-0.8114957, 1.722502, -0.6943235, 0, 0, 0, 1, 1,
-0.8080053, 1.025986, -0.08973382, 0, 0, 0, 1, 1,
-0.8025886, 0.6343302, -0.2102696, 0, 0, 0, 1, 1,
-0.796633, 1.486683, -0.2661337, 0, 0, 0, 1, 1,
-0.7954674, 0.4890481, -2.887322, 0, 0, 0, 1, 1,
-0.7950006, 0.8707769, -1.504257, 0, 0, 0, 1, 1,
-0.7945359, 1.479495, 0.7613621, 1, 1, 1, 1, 1,
-0.7936998, -0.9315042, -2.179698, 1, 1, 1, 1, 1,
-0.7912075, 0.9946656, -1.0266, 1, 1, 1, 1, 1,
-0.7896889, -0.3729232, -0.4334894, 1, 1, 1, 1, 1,
-0.7879775, 0.1427597, -1.262191, 1, 1, 1, 1, 1,
-0.7849012, 1.605764, -1.076891, 1, 1, 1, 1, 1,
-0.7791103, -0.8671515, -0.1366284, 1, 1, 1, 1, 1,
-0.7770338, -0.2278962, -0.8677229, 1, 1, 1, 1, 1,
-0.7758378, 0.450483, -1.375408, 1, 1, 1, 1, 1,
-0.7624505, 0.1664476, -1.61819, 1, 1, 1, 1, 1,
-0.7600891, 0.4117152, -0.3416886, 1, 1, 1, 1, 1,
-0.7544997, -0.01488778, -1.621263, 1, 1, 1, 1, 1,
-0.7543852, -0.2493358, -1.791029, 1, 1, 1, 1, 1,
-0.7529103, 2.273909, 0.4648229, 1, 1, 1, 1, 1,
-0.7500681, -1.944848, -4.993365, 1, 1, 1, 1, 1,
-0.7440796, -0.0584114, -2.721493, 0, 0, 1, 1, 1,
-0.7413124, -1.004548, -2.072963, 1, 0, 0, 1, 1,
-0.73886, 0.9232191, -0.03812339, 1, 0, 0, 1, 1,
-0.7378802, 0.7940805, 0.4737302, 1, 0, 0, 1, 1,
-0.735514, 0.9218456, 0.1811393, 1, 0, 0, 1, 1,
-0.7349902, 2.407058, -0.9222521, 1, 0, 0, 1, 1,
-0.7340809, -0.1239136, -1.542121, 0, 0, 0, 1, 1,
-0.7338091, -0.5822954, -2.874813, 0, 0, 0, 1, 1,
-0.7335205, 0.2994417, -1.467036, 0, 0, 0, 1, 1,
-0.7279161, 1.031378, -0.6456882, 0, 0, 0, 1, 1,
-0.7227739, 0.3635207, -0.2894316, 0, 0, 0, 1, 1,
-0.7153658, 0.4457365, -0.9638188, 0, 0, 0, 1, 1,
-0.7109028, 0.1397302, -0.5722017, 0, 0, 0, 1, 1,
-0.7036843, -0.01291296, -1.185128, 1, 1, 1, 1, 1,
-0.7007421, 0.8481753, -0.4576035, 1, 1, 1, 1, 1,
-0.6998098, 0.1615379, -1.135928, 1, 1, 1, 1, 1,
-0.6942488, -0.8572444, -1.853821, 1, 1, 1, 1, 1,
-0.6934146, -0.8897358, -1.022531, 1, 1, 1, 1, 1,
-0.6893905, 1.835699, -0.6730193, 1, 1, 1, 1, 1,
-0.6860471, -0.8804945, -2.04363, 1, 1, 1, 1, 1,
-0.6850732, 0.3776323, -2.59841, 1, 1, 1, 1, 1,
-0.6809663, 0.8486896, -1.779821, 1, 1, 1, 1, 1,
-0.6805157, -0.2546665, 0.6307259, 1, 1, 1, 1, 1,
-0.6801803, 0.2832229, -1.038229, 1, 1, 1, 1, 1,
-0.6777994, 0.5725112, -0.5599365, 1, 1, 1, 1, 1,
-0.6773593, -0.8816336, -2.138649, 1, 1, 1, 1, 1,
-0.6768754, -0.910755, -2.11178, 1, 1, 1, 1, 1,
-0.6734879, -1.11821, -2.593594, 1, 1, 1, 1, 1,
-0.6732219, 0.1255701, -0.9404133, 0, 0, 1, 1, 1,
-0.6731842, 0.7075266, -1.352934, 1, 0, 0, 1, 1,
-0.670341, -0.5229146, -4.415448, 1, 0, 0, 1, 1,
-0.6701838, -1.980546, -2.513321, 1, 0, 0, 1, 1,
-0.6660873, 0.1658657, -1.145036, 1, 0, 0, 1, 1,
-0.6641067, 0.1922081, -0.4887368, 1, 0, 0, 1, 1,
-0.6640699, 0.08364118, -1.582283, 0, 0, 0, 1, 1,
-0.6627746, 0.8004265, -0.7330768, 0, 0, 0, 1, 1,
-0.6613683, -0.6564675, -0.7069314, 0, 0, 0, 1, 1,
-0.6504575, -0.5843082, -1.597201, 0, 0, 0, 1, 1,
-0.644483, -0.7716013, -4.196933, 0, 0, 0, 1, 1,
-0.6432412, -0.4086407, -1.97951, 0, 0, 0, 1, 1,
-0.6361238, -0.7104143, -3.272366, 0, 0, 0, 1, 1,
-0.6352981, 0.5761542, -2.653297, 1, 1, 1, 1, 1,
-0.6329297, -2.500947, -2.142545, 1, 1, 1, 1, 1,
-0.6318293, 0.3663327, -1.739597, 1, 1, 1, 1, 1,
-0.631143, 0.6354959, 0.265818, 1, 1, 1, 1, 1,
-0.6235682, -2.766445, -4.48716, 1, 1, 1, 1, 1,
-0.623192, 1.740848, -0.4178104, 1, 1, 1, 1, 1,
-0.6213781, 0.2381322, -2.111816, 1, 1, 1, 1, 1,
-0.6122869, 0.09337333, -1.443864, 1, 1, 1, 1, 1,
-0.6102743, 0.233601, 0.5841259, 1, 1, 1, 1, 1,
-0.6091206, 1.999072, -0.4250448, 1, 1, 1, 1, 1,
-0.6059509, 2.285708, -1.254169, 1, 1, 1, 1, 1,
-0.6044148, -0.6504847, -2.151917, 1, 1, 1, 1, 1,
-0.5981296, 1.422565, -0.7084823, 1, 1, 1, 1, 1,
-0.5979642, -0.6431385, -4.026756, 1, 1, 1, 1, 1,
-0.5947031, -1.06972, -3.493807, 1, 1, 1, 1, 1,
-0.5906659, -1.448114, -3.489367, 0, 0, 1, 1, 1,
-0.5897085, -0.3251725, -1.532825, 1, 0, 0, 1, 1,
-0.5886086, -0.6145787, -1.067344, 1, 0, 0, 1, 1,
-0.5807036, 0.8788926, -3.348176, 1, 0, 0, 1, 1,
-0.5765714, 0.1105601, -0.2451984, 1, 0, 0, 1, 1,
-0.5755916, 0.7493487, -2.338063, 1, 0, 0, 1, 1,
-0.5744155, 1.385555, -0.5869583, 0, 0, 0, 1, 1,
-0.5670588, 0.6055604, -0.4610117, 0, 0, 0, 1, 1,
-0.5657717, -0.392354, -3.003544, 0, 0, 0, 1, 1,
-0.565388, 0.2180908, 0.3009573, 0, 0, 0, 1, 1,
-0.5635414, -0.5911332, -2.359318, 0, 0, 0, 1, 1,
-0.5633554, -0.01039951, -1.620216, 0, 0, 0, 1, 1,
-0.5619485, -0.1841018, -0.9725467, 0, 0, 0, 1, 1,
-0.5594114, -1.675505, -2.80408, 1, 1, 1, 1, 1,
-0.5539318, 1.923472, -1.09473, 1, 1, 1, 1, 1,
-0.5530667, 0.216275, -1.086755, 1, 1, 1, 1, 1,
-0.5518188, 0.4459202, 0.6494025, 1, 1, 1, 1, 1,
-0.5437458, -0.8876886, -0.8057068, 1, 1, 1, 1, 1,
-0.5426044, -1.29011, -3.518027, 1, 1, 1, 1, 1,
-0.5385085, 0.9816311, -1.311217, 1, 1, 1, 1, 1,
-0.5289249, 0.1641981, -2.675594, 1, 1, 1, 1, 1,
-0.5251347, -0.2253087, -1.908081, 1, 1, 1, 1, 1,
-0.5240723, -2.358713, -4.487923, 1, 1, 1, 1, 1,
-0.5209118, 1.296066, 0.1278722, 1, 1, 1, 1, 1,
-0.5141401, 0.744054, -0.9772379, 1, 1, 1, 1, 1,
-0.5112037, -0.07894706, -1.907393, 1, 1, 1, 1, 1,
-0.5082172, -0.6511357, -1.409969, 1, 1, 1, 1, 1,
-0.5071658, -0.220393, -0.6423164, 1, 1, 1, 1, 1,
-0.5021846, 1.526967, -0.5760074, 0, 0, 1, 1, 1,
-0.5018783, 0.4145398, -1.301019, 1, 0, 0, 1, 1,
-0.49542, 0.548013, -1.707605, 1, 0, 0, 1, 1,
-0.495271, 1.250104, -1.505994, 1, 0, 0, 1, 1,
-0.4890135, 0.1375655, 0.001036921, 1, 0, 0, 1, 1,
-0.4880021, -0.8198056, -3.953726, 1, 0, 0, 1, 1,
-0.4868561, 1.829999, 0.165044, 0, 0, 0, 1, 1,
-0.4818372, -0.8630015, -4.422677, 0, 0, 0, 1, 1,
-0.4815412, 0.7592181, 1.14266, 0, 0, 0, 1, 1,
-0.4758384, 0.7920685, 0.2070182, 0, 0, 0, 1, 1,
-0.4726966, 1.162162, -0.9174558, 0, 0, 0, 1, 1,
-0.4716162, -1.18543, -3.563612, 0, 0, 0, 1, 1,
-0.4682355, 1.062145, -0.6162258, 0, 0, 0, 1, 1,
-0.4681529, 0.3332704, -0.4128368, 1, 1, 1, 1, 1,
-0.4649747, 0.2184783, -0.1582272, 1, 1, 1, 1, 1,
-0.4642727, -0.1587224, -0.5588272, 1, 1, 1, 1, 1,
-0.463043, -0.6213915, -1.999326, 1, 1, 1, 1, 1,
-0.4617034, -1.09926, -3.632201, 1, 1, 1, 1, 1,
-0.4587089, -0.8589544, -1.108964, 1, 1, 1, 1, 1,
-0.458157, 1.193893, -0.3059083, 1, 1, 1, 1, 1,
-0.4565901, -1.9833, -1.207782, 1, 1, 1, 1, 1,
-0.4522799, -0.5640766, -1.906191, 1, 1, 1, 1, 1,
-0.448851, 0.5486109, 0.2137016, 1, 1, 1, 1, 1,
-0.4482126, -0.4746654, -1.558399, 1, 1, 1, 1, 1,
-0.4472901, 1.934984, -0.6645153, 1, 1, 1, 1, 1,
-0.4460378, 0.1355447, -1.687651, 1, 1, 1, 1, 1,
-0.4451762, -0.5661333, -0.9425531, 1, 1, 1, 1, 1,
-0.4395573, -0.7456468, -2.73554, 1, 1, 1, 1, 1,
-0.4351898, 0.5363849, -2.819688, 0, 0, 1, 1, 1,
-0.4247938, 0.9556501, 0.9417258, 1, 0, 0, 1, 1,
-0.4211585, -0.4526501, -0.7665577, 1, 0, 0, 1, 1,
-0.4204359, -0.1388324, -1.918354, 1, 0, 0, 1, 1,
-0.4161622, 0.7690715, -0.1969087, 1, 0, 0, 1, 1,
-0.4152432, -0.1734467, -0.217738, 1, 0, 0, 1, 1,
-0.4124565, -0.1531173, -4.348206, 0, 0, 0, 1, 1,
-0.4115634, 2.128072, 0.4338359, 0, 0, 0, 1, 1,
-0.4090784, -0.1310079, -1.182358, 0, 0, 0, 1, 1,
-0.4071125, -1.004121, -1.252953, 0, 0, 0, 1, 1,
-0.4065389, 1.405226, -1.311792, 0, 0, 0, 1, 1,
-0.405405, -1.050084, -2.59458, 0, 0, 0, 1, 1,
-0.403345, 0.7822165, 0.8244768, 0, 0, 0, 1, 1,
-0.4030432, -0.9556964, -1.099089, 1, 1, 1, 1, 1,
-0.3960648, -0.05421289, -1.448497, 1, 1, 1, 1, 1,
-0.3946123, 0.8089973, -0.9314296, 1, 1, 1, 1, 1,
-0.3938381, 0.8123649, 0.08507048, 1, 1, 1, 1, 1,
-0.3929184, 1.426498, -1.240067, 1, 1, 1, 1, 1,
-0.3928102, 0.157784, -2.327848, 1, 1, 1, 1, 1,
-0.3917525, 0.4881214, 0.6135133, 1, 1, 1, 1, 1,
-0.3875719, 1.620267, 0.3944036, 1, 1, 1, 1, 1,
-0.3872867, -0.721602, -3.191898, 1, 1, 1, 1, 1,
-0.3849854, -1.409269, -3.978635, 1, 1, 1, 1, 1,
-0.3845835, 0.5271868, -1.827336, 1, 1, 1, 1, 1,
-0.3840763, 0.1170823, -1.676474, 1, 1, 1, 1, 1,
-0.3837397, 0.7890429, -1.208305, 1, 1, 1, 1, 1,
-0.3800995, 0.5740778, -0.7041978, 1, 1, 1, 1, 1,
-0.3800747, 0.1471699, -1.938641, 1, 1, 1, 1, 1,
-0.3685807, -0.6584421, -1.569673, 0, 0, 1, 1, 1,
-0.3663812, 0.8624688, 0.005566536, 1, 0, 0, 1, 1,
-0.3657297, 0.7457434, -0.2809359, 1, 0, 0, 1, 1,
-0.3624149, -0.4428023, -1.9555, 1, 0, 0, 1, 1,
-0.3592581, -0.2484711, -2.094723, 1, 0, 0, 1, 1,
-0.3582808, 0.4105339, -0.6342292, 1, 0, 0, 1, 1,
-0.3556142, 0.3260802, -1.961678, 0, 0, 0, 1, 1,
-0.3394865, -0.4626858, -1.718931, 0, 0, 0, 1, 1,
-0.3390359, -0.4581386, -0.3138459, 0, 0, 0, 1, 1,
-0.3389851, -1.338601, -2.701217, 0, 0, 0, 1, 1,
-0.3352388, -0.7034077, -2.410884, 0, 0, 0, 1, 1,
-0.3337251, 1.043072, -2.214203, 0, 0, 0, 1, 1,
-0.3330459, 1.036944, 0.2202384, 0, 0, 0, 1, 1,
-0.3284936, 2.154319, 0.775215, 1, 1, 1, 1, 1,
-0.3279725, -2.268962, -4.606436, 1, 1, 1, 1, 1,
-0.3278976, 0.6402818, 0.2115574, 1, 1, 1, 1, 1,
-0.3271658, -0.5397999, -2.479521, 1, 1, 1, 1, 1,
-0.3255444, -0.2848454, -1.600891, 1, 1, 1, 1, 1,
-0.3212764, 0.2982641, -0.3389748, 1, 1, 1, 1, 1,
-0.3163172, 0.2424948, -2.037787, 1, 1, 1, 1, 1,
-0.3136712, -1.390841, -2.565836, 1, 1, 1, 1, 1,
-0.3114848, -0.1851057, -1.025693, 1, 1, 1, 1, 1,
-0.3091364, 0.527521, -0.5939286, 1, 1, 1, 1, 1,
-0.3086682, -0.3479443, -3.428714, 1, 1, 1, 1, 1,
-0.3084826, -0.2161579, -2.38737, 1, 1, 1, 1, 1,
-0.3065065, -0.1075647, -0.7387672, 1, 1, 1, 1, 1,
-0.3064506, 0.6085121, -0.5894927, 1, 1, 1, 1, 1,
-0.3056634, -0.6205078, -2.12913, 1, 1, 1, 1, 1,
-0.3034703, 0.8272101, 0.7693486, 0, 0, 1, 1, 1,
-0.3028223, -0.6873621, -3.133333, 1, 0, 0, 1, 1,
-0.3016692, 0.6718125, -1.288474, 1, 0, 0, 1, 1,
-0.3007415, 0.1947061, -2.144677, 1, 0, 0, 1, 1,
-0.2926849, -1.249817, -2.202398, 1, 0, 0, 1, 1,
-0.2925933, -1.944023, -3.248389, 1, 0, 0, 1, 1,
-0.2902442, 1.196419, 1.968405, 0, 0, 0, 1, 1,
-0.2901442, 0.3317268, -0.02080771, 0, 0, 0, 1, 1,
-0.2897539, -0.1985464, -1.678222, 0, 0, 0, 1, 1,
-0.2826654, -1.178112, -3.32141, 0, 0, 0, 1, 1,
-0.2765318, 1.150303, -0.01050506, 0, 0, 0, 1, 1,
-0.2760328, -1.188184, -2.519231, 0, 0, 0, 1, 1,
-0.2757206, -1.568826, -2.696784, 0, 0, 0, 1, 1,
-0.2718838, 1.031591, 0.3205573, 1, 1, 1, 1, 1,
-0.2717492, -1.866539, -3.609084, 1, 1, 1, 1, 1,
-0.2679208, 0.5610999, -2.298074, 1, 1, 1, 1, 1,
-0.2667873, 0.05254689, -1.181062, 1, 1, 1, 1, 1,
-0.2613788, 0.2644581, -0.2031423, 1, 1, 1, 1, 1,
-0.2606838, 0.7718036, -1.227528, 1, 1, 1, 1, 1,
-0.2590643, -0.730049, -2.878415, 1, 1, 1, 1, 1,
-0.2573809, 0.006777232, -1.934901, 1, 1, 1, 1, 1,
-0.2573049, 0.8225497, 1.280592, 1, 1, 1, 1, 1,
-0.2535326, -0.8542162, -3.26012, 1, 1, 1, 1, 1,
-0.2516694, 1.623611, 0.3937177, 1, 1, 1, 1, 1,
-0.2499006, 1.127875, -1.518585, 1, 1, 1, 1, 1,
-0.2476866, -0.7206427, -4.72124, 1, 1, 1, 1, 1,
-0.2451237, -0.04261572, 0.8950422, 1, 1, 1, 1, 1,
-0.2440438, -0.3340054, -2.523065, 1, 1, 1, 1, 1,
-0.2413367, -0.2339965, -3.162785, 0, 0, 1, 1, 1,
-0.2410971, -0.9440001, -2.550317, 1, 0, 0, 1, 1,
-0.2353594, 0.8337505, -1.025432, 1, 0, 0, 1, 1,
-0.2344846, -0.5428838, -4.570606, 1, 0, 0, 1, 1,
-0.2339854, -0.8216637, -3.760383, 1, 0, 0, 1, 1,
-0.2328619, -1.774972, -4.205168, 1, 0, 0, 1, 1,
-0.23013, -0.2925556, -1.950274, 0, 0, 0, 1, 1,
-0.226895, -0.04356743, -0.6141884, 0, 0, 0, 1, 1,
-0.2219614, -0.4654889, -3.205758, 0, 0, 0, 1, 1,
-0.2187187, 2.268712, 0.2421606, 0, 0, 0, 1, 1,
-0.2167597, -1.022554, -2.257812, 0, 0, 0, 1, 1,
-0.2118462, 0.9402179, -0.06589657, 0, 0, 0, 1, 1,
-0.2108801, 0.7133525, 0.3144372, 0, 0, 0, 1, 1,
-0.2098936, 0.4570748, 1.481815, 1, 1, 1, 1, 1,
-0.2060096, -0.1738185, -2.84132, 1, 1, 1, 1, 1,
-0.2026324, -1.532411, -3.410002, 1, 1, 1, 1, 1,
-0.2022593, 0.1893511, -2.559765, 1, 1, 1, 1, 1,
-0.1948334, 0.1240309, -3.211782, 1, 1, 1, 1, 1,
-0.1946331, -1.358489, -3.226725, 1, 1, 1, 1, 1,
-0.194529, -2.100546, -2.518544, 1, 1, 1, 1, 1,
-0.1910368, -0.3061518, -2.459587, 1, 1, 1, 1, 1,
-0.1893721, 1.209349, -0.771647, 1, 1, 1, 1, 1,
-0.1859104, -0.2133343, -1.769274, 1, 1, 1, 1, 1,
-0.1852882, -1.293603, -1.797445, 1, 1, 1, 1, 1,
-0.1801746, -1.803323, -2.238307, 1, 1, 1, 1, 1,
-0.1794808, -0.6430315, -2.740885, 1, 1, 1, 1, 1,
-0.1794428, -0.174169, -3.010656, 1, 1, 1, 1, 1,
-0.1776407, 0.1688375, -0.4317042, 1, 1, 1, 1, 1,
-0.1759195, 0.5490383, 1.142983, 0, 0, 1, 1, 1,
-0.1744036, 0.08331268, -1.942731, 1, 0, 0, 1, 1,
-0.1707547, -0.8352677, -3.171977, 1, 0, 0, 1, 1,
-0.1704493, 0.2262433, -0.7763051, 1, 0, 0, 1, 1,
-0.1693342, 1.827898, -0.07405255, 1, 0, 0, 1, 1,
-0.1644509, -0.1105145, -2.782907, 1, 0, 0, 1, 1,
-0.1643214, -0.3810396, -2.851971, 0, 0, 0, 1, 1,
-0.1635956, 0.02426685, -1.10805, 0, 0, 0, 1, 1,
-0.1608254, -2.435255, -3.888277, 0, 0, 0, 1, 1,
-0.1561699, 0.1234536, -0.4746902, 0, 0, 0, 1, 1,
-0.155724, 0.3541136, 0.6642897, 0, 0, 0, 1, 1,
-0.1540204, 1.068054, 0.9836741, 0, 0, 0, 1, 1,
-0.1538547, 0.5997202, 0.7230624, 0, 0, 0, 1, 1,
-0.1521822, -0.9212018, -3.297785, 1, 1, 1, 1, 1,
-0.1489836, 0.4578691, 1.383081, 1, 1, 1, 1, 1,
-0.1439801, 0.898811, 0.6340152, 1, 1, 1, 1, 1,
-0.1388124, -0.03992706, -1.321229, 1, 1, 1, 1, 1,
-0.1363872, -0.033625, -0.2116703, 1, 1, 1, 1, 1,
-0.1359959, -1.556551, -5.322618, 1, 1, 1, 1, 1,
-0.1352631, 1.049861, 0.2115923, 1, 1, 1, 1, 1,
-0.1342348, -0.6352071, -1.987782, 1, 1, 1, 1, 1,
-0.1308103, 1.000736, 1.990503, 1, 1, 1, 1, 1,
-0.1290321, 0.0747722, -2.553303, 1, 1, 1, 1, 1,
-0.1241277, 0.4864225, 0.5015082, 1, 1, 1, 1, 1,
-0.1215081, 0.1236062, 1.491779, 1, 1, 1, 1, 1,
-0.1172502, -0.05141428, -2.670285, 1, 1, 1, 1, 1,
-0.1172206, 0.4957968, -1.389179, 1, 1, 1, 1, 1,
-0.1156627, 0.9553582, 0.3288005, 1, 1, 1, 1, 1,
-0.111154, -0.2571234, -3.125124, 0, 0, 1, 1, 1,
-0.1098978, -1.30206, -2.842216, 1, 0, 0, 1, 1,
-0.1069694, 0.6110206, -0.3549293, 1, 0, 0, 1, 1,
-0.1013467, 0.5259969, 0.8528778, 1, 0, 0, 1, 1,
-0.09309743, -0.605773, -1.893476, 1, 0, 0, 1, 1,
-0.09059506, -0.2078977, -2.412556, 1, 0, 0, 1, 1,
-0.08774576, -1.692648, -3.1902, 0, 0, 0, 1, 1,
-0.0846009, 0.4844603, 0.682363, 0, 0, 0, 1, 1,
-0.08445815, 1.020159, -1.470035, 0, 0, 0, 1, 1,
-0.08346537, -1.491387, -4.613453, 0, 0, 0, 1, 1,
-0.08248566, -0.1022924, -3.109156, 0, 0, 0, 1, 1,
-0.07927225, -0.1183299, -1.9389, 0, 0, 0, 1, 1,
-0.07431863, -0.9152617, -1.98892, 0, 0, 0, 1, 1,
-0.07300319, 2.517906, -0.5082419, 1, 1, 1, 1, 1,
-0.06784897, -0.3601863, -2.594057, 1, 1, 1, 1, 1,
-0.06397982, 1.055394, 0.005070797, 1, 1, 1, 1, 1,
-0.06364587, -0.7671692, -3.896712, 1, 1, 1, 1, 1,
-0.06108763, 1.430111, -0.3848763, 1, 1, 1, 1, 1,
-0.05501409, 0.4793774, -1.748209, 1, 1, 1, 1, 1,
-0.05444961, -0.4520274, -4.457914, 1, 1, 1, 1, 1,
-0.05196716, 0.7503753, -0.1569291, 1, 1, 1, 1, 1,
-0.04797626, -0.9677396, -3.105299, 1, 1, 1, 1, 1,
-0.0463538, -0.5631508, -2.610404, 1, 1, 1, 1, 1,
-0.04457718, 1.820741, 0.6256481, 1, 1, 1, 1, 1,
-0.04359422, -0.2318125, -2.13275, 1, 1, 1, 1, 1,
-0.04204685, -0.2431817, -3.827883, 1, 1, 1, 1, 1,
-0.04196227, -1.330619, -3.730755, 1, 1, 1, 1, 1,
-0.0416513, -0.3389338, -1.359464, 1, 1, 1, 1, 1,
-0.03850666, 1.098002, 0.09084966, 0, 0, 1, 1, 1,
-0.03803504, -0.6571582, -2.536968, 1, 0, 0, 1, 1,
-0.03569904, -0.572493, -4.055189, 1, 0, 0, 1, 1,
-0.03064792, 0.2705328, -0.06943109, 1, 0, 0, 1, 1,
-0.03052324, -1.354936, -3.648944, 1, 0, 0, 1, 1,
-0.02849477, 0.1002991, 0.6835443, 1, 0, 0, 1, 1,
-0.02685524, -0.3659047, -4.884337, 0, 0, 0, 1, 1,
-0.02550545, 0.1854498, 0.6981184, 0, 0, 0, 1, 1,
-0.02496954, -0.2910469, -3.151208, 0, 0, 0, 1, 1,
-0.02182543, 0.3712063, 0.1757955, 0, 0, 0, 1, 1,
-0.01960153, 0.2675101, 1.696954, 0, 0, 0, 1, 1,
-0.01907541, -0.8448493, -2.644042, 0, 0, 0, 1, 1,
-0.01680568, 0.4998726, -0.002726428, 0, 0, 0, 1, 1,
-0.01230289, -1.144912, -3.022841, 1, 1, 1, 1, 1,
-0.01155777, -0.07021543, -3.988493, 1, 1, 1, 1, 1,
-0.008613281, 1.089555, -1.39146, 1, 1, 1, 1, 1,
-0.007209512, -0.5606406, -3.151481, 1, 1, 1, 1, 1,
-0.004662121, 1.347727, -1.194727, 1, 1, 1, 1, 1,
-0.002807865, 0.9101098, -0.2692698, 1, 1, 1, 1, 1,
-0.001687242, 0.5921705, -0.1882707, 1, 1, 1, 1, 1,
-0.001192816, 0.2860799, -1.251338, 1, 1, 1, 1, 1,
-0.001078645, -0.05187716, -3.544291, 1, 1, 1, 1, 1,
-0.0009849161, -0.1120876, -2.216963, 1, 1, 1, 1, 1,
0.0006304795, 1.197528, -1.049244, 1, 1, 1, 1, 1,
0.003226347, -1.069313, 2.511098, 1, 1, 1, 1, 1,
0.006113443, 0.7855194, -0.905301, 1, 1, 1, 1, 1,
0.007912024, 0.4567838, 1.534827, 1, 1, 1, 1, 1,
0.009842531, 0.3812084, -1.06842, 1, 1, 1, 1, 1,
0.01067104, -0.4394614, 2.129646, 0, 0, 1, 1, 1,
0.02091942, 1.310516, -0.1126949, 1, 0, 0, 1, 1,
0.02494863, -0.6609561, 3.179215, 1, 0, 0, 1, 1,
0.02778284, 0.914668, 1.644476, 1, 0, 0, 1, 1,
0.03209219, -1.581178, 3.468101, 1, 0, 0, 1, 1,
0.03275156, 0.04578684, 0.01550804, 1, 0, 0, 1, 1,
0.0382838, -1.085794, 3.391202, 0, 0, 0, 1, 1,
0.03978993, -0.08070876, 3.91792, 0, 0, 0, 1, 1,
0.03999687, 1.071983, -0.2312181, 0, 0, 0, 1, 1,
0.04476338, 0.1103557, 0.3313528, 0, 0, 0, 1, 1,
0.04925238, -0.4339691, 4.777192, 0, 0, 0, 1, 1,
0.05215402, 0.6056603, 0.2824651, 0, 0, 0, 1, 1,
0.05330895, -0.4005137, 6.0322, 0, 0, 0, 1, 1,
0.05485233, -0.563507, 3.259519, 1, 1, 1, 1, 1,
0.05692697, 0.1088132, 1.403833, 1, 1, 1, 1, 1,
0.05754157, -1.379567, 3.688877, 1, 1, 1, 1, 1,
0.05762259, -0.05425413, 1.714231, 1, 1, 1, 1, 1,
0.05763981, -0.2812446, 2.003312, 1, 1, 1, 1, 1,
0.06027022, -0.2427426, 3.632357, 1, 1, 1, 1, 1,
0.06391297, 0.1088069, 0.4729861, 1, 1, 1, 1, 1,
0.06633855, -0.6022798, 3.288341, 1, 1, 1, 1, 1,
0.06687628, -1.957111, 4.032417, 1, 1, 1, 1, 1,
0.06844059, -0.7412874, 2.626035, 1, 1, 1, 1, 1,
0.07061915, -0.4617737, 2.893201, 1, 1, 1, 1, 1,
0.0756704, 1.01878, 0.6197605, 1, 1, 1, 1, 1,
0.07584464, -1.393354, 3.554209, 1, 1, 1, 1, 1,
0.07770149, -2.517328, 3.293317, 1, 1, 1, 1, 1,
0.08326112, -1.048401, 3.078321, 1, 1, 1, 1, 1,
0.08463364, -0.5754502, 2.364045, 0, 0, 1, 1, 1,
0.08488031, 0.7471223, 0.1877707, 1, 0, 0, 1, 1,
0.08787151, -0.2411526, 3.740655, 1, 0, 0, 1, 1,
0.09214631, -0.2816846, 4.283108, 1, 0, 0, 1, 1,
0.09592815, -0.2090476, 4.229637, 1, 0, 0, 1, 1,
0.09705516, 0.4301502, 1.040386, 1, 0, 0, 1, 1,
0.09725487, 1.197145, 0.3680024, 0, 0, 0, 1, 1,
0.09938639, -0.1808316, 3.182724, 0, 0, 0, 1, 1,
0.1004132, -0.1784302, 3.122633, 0, 0, 0, 1, 1,
0.1009454, 0.9030805, -0.2431003, 0, 0, 0, 1, 1,
0.1048386, 3.491423, 1.259554, 0, 0, 0, 1, 1,
0.1055282, 0.563212, 0.1631228, 0, 0, 0, 1, 1,
0.1065843, 1.116945, 1.754305, 0, 0, 0, 1, 1,
0.1089347, -0.2316497, 2.219881, 1, 1, 1, 1, 1,
0.1091187, -0.2214521, 2.255696, 1, 1, 1, 1, 1,
0.112691, -0.7512868, 4.105452, 1, 1, 1, 1, 1,
0.1150086, -0.5338636, 3.788827, 1, 1, 1, 1, 1,
0.116337, -0.6044067, 1.460769, 1, 1, 1, 1, 1,
0.1182213, -0.2659791, 2.008421, 1, 1, 1, 1, 1,
0.1210521, 1.171186, -0.7889891, 1, 1, 1, 1, 1,
0.1211469, 0.9007527, 1.772882, 1, 1, 1, 1, 1,
0.1252209, 0.03827214, 1.485824, 1, 1, 1, 1, 1,
0.1254847, 0.4511202, 0.62477, 1, 1, 1, 1, 1,
0.1267618, 1.791991, -1.934134, 1, 1, 1, 1, 1,
0.1291674, 0.3448549, 2.344494, 1, 1, 1, 1, 1,
0.1308258, 0.2472263, 2.002392, 1, 1, 1, 1, 1,
0.1316513, -1.207622, 2.987646, 1, 1, 1, 1, 1,
0.133297, 0.1089998, 0.5259675, 1, 1, 1, 1, 1,
0.1338913, 0.1697505, 0.6179328, 0, 0, 1, 1, 1,
0.1378905, -1.532877, 2.135113, 1, 0, 0, 1, 1,
0.138363, 0.2486044, 1.727648, 1, 0, 0, 1, 1,
0.142347, -1.084801, 0.6886305, 1, 0, 0, 1, 1,
0.1434691, -0.05723668, 2.298493, 1, 0, 0, 1, 1,
0.1460774, 0.4293465, 0.8319165, 1, 0, 0, 1, 1,
0.1477956, 1.626805, -0.5786444, 0, 0, 0, 1, 1,
0.1508819, -0.2344836, 2.478344, 0, 0, 0, 1, 1,
0.1554228, -0.6498057, 1.640353, 0, 0, 0, 1, 1,
0.1597475, 0.6514642, -0.463528, 0, 0, 0, 1, 1,
0.1667564, -0.6899422, 3.634444, 0, 0, 0, 1, 1,
0.1711841, -0.5996659, 4.259235, 0, 0, 0, 1, 1,
0.1743888, 0.4537323, -0.6203557, 0, 0, 0, 1, 1,
0.1752724, 0.1955888, 1.587468, 1, 1, 1, 1, 1,
0.1763901, 0.9247956, -0.8487703, 1, 1, 1, 1, 1,
0.1770223, -1.362429, 2.673735, 1, 1, 1, 1, 1,
0.1772831, -1.489744, 2.462127, 1, 1, 1, 1, 1,
0.1790144, 0.8464335, 0.03849145, 1, 1, 1, 1, 1,
0.1810121, -0.2549933, 0.6068298, 1, 1, 1, 1, 1,
0.1885612, 1.870775, -0.5721845, 1, 1, 1, 1, 1,
0.1894101, 0.02636987, 0.4890966, 1, 1, 1, 1, 1,
0.1902137, -0.2309512, 2.810529, 1, 1, 1, 1, 1,
0.1909465, -0.3419713, 2.175031, 1, 1, 1, 1, 1,
0.1941103, 0.3917037, 1.254391, 1, 1, 1, 1, 1,
0.1984071, -0.6161236, 2.765012, 1, 1, 1, 1, 1,
0.2023305, 0.6152096, 0.4285767, 1, 1, 1, 1, 1,
0.2027284, 0.3787661, -1.554741, 1, 1, 1, 1, 1,
0.2030225, -0.3215114, 2.317853, 1, 1, 1, 1, 1,
0.2031228, 1.10921, -0.6084258, 0, 0, 1, 1, 1,
0.2040256, 0.6294715, 0.6567485, 1, 0, 0, 1, 1,
0.2059277, -0.2598476, 1.294678, 1, 0, 0, 1, 1,
0.2061934, -0.9467837, 2.994571, 1, 0, 0, 1, 1,
0.2074413, -1.107897, 4.905223, 1, 0, 0, 1, 1,
0.2103687, -0.9920754, 4.646758, 1, 0, 0, 1, 1,
0.213172, -0.2806791, 2.304998, 0, 0, 0, 1, 1,
0.216481, -0.4941145, 4.027738, 0, 0, 0, 1, 1,
0.2174659, -1.296313, 2.897073, 0, 0, 0, 1, 1,
0.2177912, 0.7049269, 0.06762925, 0, 0, 0, 1, 1,
0.2191228, 0.3336304, -0.3700326, 0, 0, 0, 1, 1,
0.2194916, 2.772896, -0.2274973, 0, 0, 0, 1, 1,
0.2228235, -2.348645, 2.639825, 0, 0, 0, 1, 1,
0.2315757, 0.4791442, 1.534583, 1, 1, 1, 1, 1,
0.2319307, 0.7491437, -0.3710181, 1, 1, 1, 1, 1,
0.2321022, 0.600265, -1.009618, 1, 1, 1, 1, 1,
0.2346588, -0.68433, 2.464509, 1, 1, 1, 1, 1,
0.2358149, 0.8142377, -1.625091, 1, 1, 1, 1, 1,
0.2396924, 1.116089, -0.6122767, 1, 1, 1, 1, 1,
0.2424258, -0.6077577, 2.667426, 1, 1, 1, 1, 1,
0.2527723, 0.4115717, 0.4948427, 1, 1, 1, 1, 1,
0.2531287, -1.529687, 3.120194, 1, 1, 1, 1, 1,
0.2543891, 1.107589, 1.026103, 1, 1, 1, 1, 1,
0.261171, 0.3587891, 1.301599, 1, 1, 1, 1, 1,
0.261613, -1.077111, 3.996816, 1, 1, 1, 1, 1,
0.2740243, -1.903662, 3.281791, 1, 1, 1, 1, 1,
0.2785357, -0.351187, 5.268839, 1, 1, 1, 1, 1,
0.2789637, 0.3644859, -0.220525, 1, 1, 1, 1, 1,
0.2842342, 0.01561222, -0.3589694, 0, 0, 1, 1, 1,
0.2882277, 1.516115, 0.9451019, 1, 0, 0, 1, 1,
0.2917874, 0.2631804, 2.189853, 1, 0, 0, 1, 1,
0.2963514, 2.938623, -1.982286, 1, 0, 0, 1, 1,
0.3006094, -0.9794837, 4.054023, 1, 0, 0, 1, 1,
0.3009404, 2.168412, -0.06350488, 1, 0, 0, 1, 1,
0.3017289, -1.276051, 4.378325, 0, 0, 0, 1, 1,
0.303627, 0.01758179, 2.284528, 0, 0, 0, 1, 1,
0.304489, 0.663855, -0.48728, 0, 0, 0, 1, 1,
0.3047654, -0.3486178, 3.89384, 0, 0, 0, 1, 1,
0.3047848, -1.012974, 2.017707, 0, 0, 0, 1, 1,
0.3059897, -0.2088936, 0.3421557, 0, 0, 0, 1, 1,
0.3072886, 1.244952, -0.5677956, 0, 0, 0, 1, 1,
0.3123502, 0.07416129, -0.04304673, 1, 1, 1, 1, 1,
0.3125426, -0.07990028, 1.34249, 1, 1, 1, 1, 1,
0.313599, -1.299724, 3.648007, 1, 1, 1, 1, 1,
0.3178802, 0.350704, 0.737768, 1, 1, 1, 1, 1,
0.3222062, -0.5359227, 1.266328, 1, 1, 1, 1, 1,
0.3255042, -0.1657752, 2.350173, 1, 1, 1, 1, 1,
0.3256136, 1.082342, 0.3957801, 1, 1, 1, 1, 1,
0.3314526, -1.15634, 2.523611, 1, 1, 1, 1, 1,
0.3361328, 1.172333, 0.3289881, 1, 1, 1, 1, 1,
0.3367293, -1.26734, 2.845588, 1, 1, 1, 1, 1,
0.3368109, -1.433322, 2.639488, 1, 1, 1, 1, 1,
0.34055, -0.4706099, 2.407122, 1, 1, 1, 1, 1,
0.3423983, -1.300401, 3.797668, 1, 1, 1, 1, 1,
0.3458286, 0.2462658, -0.05027688, 1, 1, 1, 1, 1,
0.3644002, -0.03567423, 2.898297, 1, 1, 1, 1, 1,
0.37955, -1.355884, 2.627737, 0, 0, 1, 1, 1,
0.3831484, 0.5677564, 1.353398, 1, 0, 0, 1, 1,
0.3832655, 0.7015998, 0.9720811, 1, 0, 0, 1, 1,
0.3851851, 0.7817132, 0.5043727, 1, 0, 0, 1, 1,
0.3852777, 1.476372, 1.211164, 1, 0, 0, 1, 1,
0.3863613, 0.7145821, -0.2087413, 1, 0, 0, 1, 1,
0.3873695, 0.9092031, 0.3725848, 0, 0, 0, 1, 1,
0.3919288, -0.1010993, 3.299583, 0, 0, 0, 1, 1,
0.3946128, 1.019583, -0.6743916, 0, 0, 0, 1, 1,
0.3961352, 1.146384, -0.2004973, 0, 0, 0, 1, 1,
0.3990266, 0.5313726, 2.339445, 0, 0, 0, 1, 1,
0.4003942, 0.3609857, 2.304601, 0, 0, 0, 1, 1,
0.4017765, 0.1176875, -0.07423254, 0, 0, 0, 1, 1,
0.4017854, -1.637169, 4.97607, 1, 1, 1, 1, 1,
0.4031061, -0.3540397, 1.481406, 1, 1, 1, 1, 1,
0.4037367, 1.404245, -0.1396168, 1, 1, 1, 1, 1,
0.4074942, -1.937442, 2.595415, 1, 1, 1, 1, 1,
0.4117043, 2.053723, 0.6627179, 1, 1, 1, 1, 1,
0.4145949, -0.31229, 1.600732, 1, 1, 1, 1, 1,
0.414693, 1.358413, -0.3394977, 1, 1, 1, 1, 1,
0.4213861, 1.816781, 1.468238, 1, 1, 1, 1, 1,
0.4284366, 0.2115418, 1.85784, 1, 1, 1, 1, 1,
0.431075, -1.046097, 1.68923, 1, 1, 1, 1, 1,
0.431702, -1.118374, 1.829924, 1, 1, 1, 1, 1,
0.4331284, -0.9210786, 3.350434, 1, 1, 1, 1, 1,
0.4335102, -0.4307514, 3.328963, 1, 1, 1, 1, 1,
0.4344167, -2.227203, 2.053695, 1, 1, 1, 1, 1,
0.4347588, -0.2502097, 3.392154, 1, 1, 1, 1, 1,
0.4366066, 0.9873298, 1.036168, 0, 0, 1, 1, 1,
0.4384982, -0.9432776, 2.44827, 1, 0, 0, 1, 1,
0.4388064, 0.4644723, -0.341671, 1, 0, 0, 1, 1,
0.4407966, 0.6049348, -0.6735812, 1, 0, 0, 1, 1,
0.4450157, 0.3722427, 0.7591558, 1, 0, 0, 1, 1,
0.4490993, 0.8316463, 1.887009, 1, 0, 0, 1, 1,
0.4514571, 0.2601626, 0.2713135, 0, 0, 0, 1, 1,
0.4546468, 0.09995475, 1.277225, 0, 0, 0, 1, 1,
0.4582946, 0.3675161, 1.185827, 0, 0, 0, 1, 1,
0.4606051, 0.594817, -0.1060023, 0, 0, 0, 1, 1,
0.4611546, 1.304995, 1.044733, 0, 0, 0, 1, 1,
0.4614161, 0.8986482, 1.344827, 0, 0, 0, 1, 1,
0.463269, 0.7129692, 1.047889, 0, 0, 0, 1, 1,
0.4643999, -0.01089774, 3.668648, 1, 1, 1, 1, 1,
0.4644039, -2.213495, 1.962799, 1, 1, 1, 1, 1,
0.4650287, 0.9175794, 0.9856143, 1, 1, 1, 1, 1,
0.4666366, 0.4607288, 0.5630137, 1, 1, 1, 1, 1,
0.4704701, -0.1928371, 2.446081, 1, 1, 1, 1, 1,
0.4716778, -0.7267612, 2.413937, 1, 1, 1, 1, 1,
0.4775611, 0.1945193, 1.593885, 1, 1, 1, 1, 1,
0.4800414, -1.135033, 3.254364, 1, 1, 1, 1, 1,
0.4822399, 0.5884953, 2.046451, 1, 1, 1, 1, 1,
0.4851162, -0.9400485, 2.676041, 1, 1, 1, 1, 1,
0.4941575, 0.02846595, 0.9325228, 1, 1, 1, 1, 1,
0.4944381, 0.08743928, 1.618111, 1, 1, 1, 1, 1,
0.4945578, -1.131328, 1.356821, 1, 1, 1, 1, 1,
0.4997283, -0.6985793, 2.679877, 1, 1, 1, 1, 1,
0.5054554, 0.9523915, -0.4357194, 1, 1, 1, 1, 1,
0.5058199, 1.313822, 1.038039, 0, 0, 1, 1, 1,
0.5067019, -0.6943183, 3.319084, 1, 0, 0, 1, 1,
0.512841, -0.2087235, 2.593306, 1, 0, 0, 1, 1,
0.5138756, 0.2941086, 1.370697, 1, 0, 0, 1, 1,
0.5266358, -2.98676, 4.136304, 1, 0, 0, 1, 1,
0.5298132, -0.7987086, 3.722256, 1, 0, 0, 1, 1,
0.5333847, -0.1378231, 0.0006848158, 0, 0, 0, 1, 1,
0.5348611, -0.235394, 2.780339, 0, 0, 0, 1, 1,
0.5453604, -1.91778, 1.708462, 0, 0, 0, 1, 1,
0.5528705, 0.6211479, 1.400713, 0, 0, 0, 1, 1,
0.5530793, 0.2756147, 1.531841, 0, 0, 0, 1, 1,
0.5591415, 0.6211515, -1.492917, 0, 0, 0, 1, 1,
0.559229, 0.7856048, 0.5445294, 0, 0, 0, 1, 1,
0.5592321, 0.7454135, 1.167752, 1, 1, 1, 1, 1,
0.5662567, 0.422187, 0.5639563, 1, 1, 1, 1, 1,
0.568852, -0.3493818, 2.131811, 1, 1, 1, 1, 1,
0.5733745, -0.9551582, 2.946254, 1, 1, 1, 1, 1,
0.5737239, -0.8802837, 3.459888, 1, 1, 1, 1, 1,
0.5748144, -0.5772285, 1.463235, 1, 1, 1, 1, 1,
0.5858619, -0.8344616, 3.356206, 1, 1, 1, 1, 1,
0.5869718, 0.5701133, 2.239112, 1, 1, 1, 1, 1,
0.5875311, 0.4222131, 0.1757453, 1, 1, 1, 1, 1,
0.5877637, 0.1080262, 2.249598, 1, 1, 1, 1, 1,
0.5927985, 1.262183, -0.358115, 1, 1, 1, 1, 1,
0.594386, 1.141491, 2.083306, 1, 1, 1, 1, 1,
0.5951187, -1.440699, 1.695364, 1, 1, 1, 1, 1,
0.5981328, -0.8550339, 2.820893, 1, 1, 1, 1, 1,
0.5991355, 0.9912301, 0.1463913, 1, 1, 1, 1, 1,
0.6008128, 0.2831305, 3.235365, 0, 0, 1, 1, 1,
0.6037526, -1.10071, 3.492723, 1, 0, 0, 1, 1,
0.6051824, 0.9300548, 0.06367996, 1, 0, 0, 1, 1,
0.6079557, -2.144178, 3.586482, 1, 0, 0, 1, 1,
0.6116529, 1.290595, 0.1554384, 1, 0, 0, 1, 1,
0.6143786, -1.059343, 2.424715, 1, 0, 0, 1, 1,
0.6147929, 1.25784, -0.6856491, 0, 0, 0, 1, 1,
0.6159745, 0.5104779, 2.25953, 0, 0, 0, 1, 1,
0.6202063, 0.5780846, 2.182793, 0, 0, 0, 1, 1,
0.6234916, 1.196253, -0.9381282, 0, 0, 0, 1, 1,
0.6263233, 0.271322, 2.662268, 0, 0, 0, 1, 1,
0.6263344, -2.095684, 2.024949, 0, 0, 0, 1, 1,
0.6277314, 0.4990695, -0.4686987, 0, 0, 0, 1, 1,
0.6291667, -0.5231978, 0.5832912, 1, 1, 1, 1, 1,
0.6344314, 0.5428541, 1.972916, 1, 1, 1, 1, 1,
0.6358142, 0.1921777, 1.175721, 1, 1, 1, 1, 1,
0.637888, -0.01425567, 2.206954, 1, 1, 1, 1, 1,
0.6379381, 1.706232, -0.8051839, 1, 1, 1, 1, 1,
0.6498783, 2.41269, -0.5406356, 1, 1, 1, 1, 1,
0.650903, 1.202081, 1.897919, 1, 1, 1, 1, 1,
0.6513961, 0.517491, -0.1623616, 1, 1, 1, 1, 1,
0.6531913, 2.107265, 1.088408, 1, 1, 1, 1, 1,
0.6551504, -0.2463739, 0.661716, 1, 1, 1, 1, 1,
0.6575031, -0.06658152, 2.256124, 1, 1, 1, 1, 1,
0.6586365, 0.6842358, 0.3904558, 1, 1, 1, 1, 1,
0.6672985, -0.3893707, 3.502672, 1, 1, 1, 1, 1,
0.6687629, -0.001566167, 2.06099, 1, 1, 1, 1, 1,
0.6701738, -0.4815747, 0.8456597, 1, 1, 1, 1, 1,
0.6717156, 0.4229704, 2.099193, 0, 0, 1, 1, 1,
0.671829, 1.095047, 2.720767, 1, 0, 0, 1, 1,
0.6734809, -0.2959504, -0.2737393, 1, 0, 0, 1, 1,
0.6738899, 1.959759, 0.7780898, 1, 0, 0, 1, 1,
0.6762168, -0.7552412, 0.6600903, 1, 0, 0, 1, 1,
0.6847205, -0.4413496, 2.044307, 1, 0, 0, 1, 1,
0.6901785, 1.191488, -0.4755679, 0, 0, 0, 1, 1,
0.7039137, 0.07050375, 2.481128, 0, 0, 0, 1, 1,
0.7068307, 1.203615, 0.03562946, 0, 0, 0, 1, 1,
0.7133219, 1.089161, 0.9060433, 0, 0, 0, 1, 1,
0.7147147, -0.2356972, 0.06744362, 0, 0, 0, 1, 1,
0.71848, 0.544381, 1.434455, 0, 0, 0, 1, 1,
0.7201384, -0.3830729, 2.533879, 0, 0, 0, 1, 1,
0.7226226, -0.8806869, 0.981208, 1, 1, 1, 1, 1,
0.7231802, -1.600255, 2.329545, 1, 1, 1, 1, 1,
0.729866, -0.2955791, 1.844669, 1, 1, 1, 1, 1,
0.730916, 0.1357428, -0.03481519, 1, 1, 1, 1, 1,
0.7317972, 0.8756738, 1.876341, 1, 1, 1, 1, 1,
0.7389628, -0.6310424, 2.359913, 1, 1, 1, 1, 1,
0.7398549, -0.1468465, 1.757438, 1, 1, 1, 1, 1,
0.7418366, 1.674568, 1.206929, 1, 1, 1, 1, 1,
0.7523841, -0.137215, 1.971092, 1, 1, 1, 1, 1,
0.755958, -0.6251385, 1.583864, 1, 1, 1, 1, 1,
0.7599462, 1.824126, -1.053187, 1, 1, 1, 1, 1,
0.7613752, 1.260567, 1.684623, 1, 1, 1, 1, 1,
0.761894, 0.7432742, 2.754867, 1, 1, 1, 1, 1,
0.7639324, -0.7250238, 1.087395, 1, 1, 1, 1, 1,
0.7675245, -0.6731451, 4.731179, 1, 1, 1, 1, 1,
0.7743011, 1.756315, 0.5442972, 0, 0, 1, 1, 1,
0.7767961, 0.7364787, 1.749368, 1, 0, 0, 1, 1,
0.7792315, 0.7417302, 1.596197, 1, 0, 0, 1, 1,
0.779785, 1.661453, 0.09684832, 1, 0, 0, 1, 1,
0.7798352, 0.5005268, 1.308301, 1, 0, 0, 1, 1,
0.7835769, -1.710258, 2.027195, 1, 0, 0, 1, 1,
0.7838165, -0.40623, 1.543447, 0, 0, 0, 1, 1,
0.7897415, 1.253302, -0.137822, 0, 0, 0, 1, 1,
0.7991879, 0.1027948, -1.040114, 0, 0, 0, 1, 1,
0.8034259, -0.8599609, 1.872354, 0, 0, 0, 1, 1,
0.809535, 0.1204011, 3.641813, 0, 0, 0, 1, 1,
0.810811, 0.7722067, 1.514956, 0, 0, 0, 1, 1,
0.8113941, -0.6736018, 3.524696, 0, 0, 0, 1, 1,
0.8121363, 1.843007, -0.3996178, 1, 1, 1, 1, 1,
0.816818, 1.389959, 0.808368, 1, 1, 1, 1, 1,
0.818032, -0.8259604, 2.199523, 1, 1, 1, 1, 1,
0.8184023, -0.7542665, 2.336003, 1, 1, 1, 1, 1,
0.8220946, -0.2182948, 1.335123, 1, 1, 1, 1, 1,
0.8255891, -0.4715025, 1.667629, 1, 1, 1, 1, 1,
0.8322508, -0.5603369, 1.037754, 1, 1, 1, 1, 1,
0.8340819, 0.1275213, -0.2853485, 1, 1, 1, 1, 1,
0.8358713, 0.08079718, 1.394507, 1, 1, 1, 1, 1,
0.8358822, -1.48601, 2.116489, 1, 1, 1, 1, 1,
0.8370432, -1.018872, 2.880712, 1, 1, 1, 1, 1,
0.8480155, -1.896114, 2.602456, 1, 1, 1, 1, 1,
0.8645887, 0.1619446, -0.5146621, 1, 1, 1, 1, 1,
0.8678854, 0.7850891, 1.574124, 1, 1, 1, 1, 1,
0.8830444, 0.575405, 1.046464, 1, 1, 1, 1, 1,
0.8870267, 0.3175414, 0.6112754, 0, 0, 1, 1, 1,
0.8913745, 0.3253255, 0.9651409, 1, 0, 0, 1, 1,
0.8927265, -0.4008479, 0.2220019, 1, 0, 0, 1, 1,
0.8958795, 0.7040989, 0.9071036, 1, 0, 0, 1, 1,
0.8981913, -0.2835879, 2.919073, 1, 0, 0, 1, 1,
0.9015611, -0.1916759, 2.421503, 1, 0, 0, 1, 1,
0.9041073, -1.824723, 1.024114, 0, 0, 0, 1, 1,
0.9088468, -0.6653249, 0.5359901, 0, 0, 0, 1, 1,
0.9108526, 0.2461536, -0.699161, 0, 0, 0, 1, 1,
0.9135424, -0.02195426, 1.183762, 0, 0, 0, 1, 1,
0.915665, 0.2031157, 0.7701678, 0, 0, 0, 1, 1,
0.9179379, -1.282202, 0.5730882, 0, 0, 0, 1, 1,
0.9299549, 0.5508119, 1.940953, 0, 0, 0, 1, 1,
0.9325579, 0.9267951, -0.08056556, 1, 1, 1, 1, 1,
0.9349977, -1.489945, 2.381262, 1, 1, 1, 1, 1,
0.9360648, 0.8813791, 1.267951, 1, 1, 1, 1, 1,
0.936826, -0.1456135, 3.427938, 1, 1, 1, 1, 1,
0.9373482, 0.7324247, 0.5846288, 1, 1, 1, 1, 1,
0.9463333, 1.71569, -1.144663, 1, 1, 1, 1, 1,
0.9498975, -0.05320904, 0.6208832, 1, 1, 1, 1, 1,
0.9499279, -0.589433, -1.769693, 1, 1, 1, 1, 1,
0.9500679, -0.002172101, 0.5814537, 1, 1, 1, 1, 1,
0.9518625, 0.9339781, 3.630035, 1, 1, 1, 1, 1,
0.9527265, 0.07533607, 2.374732, 1, 1, 1, 1, 1,
0.9605229, -0.0858738, 2.12661, 1, 1, 1, 1, 1,
0.9693852, -0.5147933, 1.614015, 1, 1, 1, 1, 1,
0.975116, 1.624644, -0.148834, 1, 1, 1, 1, 1,
0.9758869, -0.9035823, 2.52588, 1, 1, 1, 1, 1,
0.9788954, 0.1936682, 1.511406, 0, 0, 1, 1, 1,
0.9879057, -0.294791, 0.3895169, 1, 0, 0, 1, 1,
0.9893858, 0.3682792, 1.429197, 1, 0, 0, 1, 1,
0.9913787, 1.346524, 0.6768273, 1, 0, 0, 1, 1,
0.9969768, -1.4235, 1.888836, 1, 0, 0, 1, 1,
1.009968, 0.02920466, 1.539563, 1, 0, 0, 1, 1,
1.015666, -1.025333, 3.184451, 0, 0, 0, 1, 1,
1.028591, 1.709534, 1.083295, 0, 0, 0, 1, 1,
1.030081, -0.5291712, 2.64869, 0, 0, 0, 1, 1,
1.033382, -0.8971584, 1.917632, 0, 0, 0, 1, 1,
1.03829, -2.335179, 2.893548, 0, 0, 0, 1, 1,
1.044419, -1.185721, 2.930618, 0, 0, 0, 1, 1,
1.046817, -0.1409782, 1.889211, 0, 0, 0, 1, 1,
1.050102, 0.1525602, 1.651933, 1, 1, 1, 1, 1,
1.052892, -0.59185, 1.63024, 1, 1, 1, 1, 1,
1.056649, 1.174244, -0.8039376, 1, 1, 1, 1, 1,
1.057799, -1.024494, 2.868411, 1, 1, 1, 1, 1,
1.062204, 0.04530298, 1.962081, 1, 1, 1, 1, 1,
1.072871, -0.5852487, 2.006859, 1, 1, 1, 1, 1,
1.081021, 0.7841405, -0.2382649, 1, 1, 1, 1, 1,
1.082376, 1.25929, 2.648688, 1, 1, 1, 1, 1,
1.100953, 0.6882427, 0.7512478, 1, 1, 1, 1, 1,
1.101426, -0.7138318, 2.930291, 1, 1, 1, 1, 1,
1.117997, 0.2622245, 0.1414602, 1, 1, 1, 1, 1,
1.123164, -1.774209, 2.467805, 1, 1, 1, 1, 1,
1.127055, -0.2426488, 0.9747796, 1, 1, 1, 1, 1,
1.138405, -2.041918, 4.081576, 1, 1, 1, 1, 1,
1.147172, 0.4776043, 2.583761, 1, 1, 1, 1, 1,
1.150661, 0.1156246, 2.388193, 0, 0, 1, 1, 1,
1.153819, -0.1357385, 2.35367, 1, 0, 0, 1, 1,
1.155069, -1.13214, 2.033369, 1, 0, 0, 1, 1,
1.159554, -0.4074714, 1.020843, 1, 0, 0, 1, 1,
1.16431, -0.5856211, 2.095783, 1, 0, 0, 1, 1,
1.1731, 0.3536117, 1.352052, 1, 0, 0, 1, 1,
1.190731, -0.7135355, 0.9536122, 0, 0, 0, 1, 1,
1.206723, 0.3280235, -0.788757, 0, 0, 0, 1, 1,
1.210522, -0.6100302, 2.488187, 0, 0, 0, 1, 1,
1.213591, 0.3498245, 1.188399, 0, 0, 0, 1, 1,
1.221359, 1.49191, 0.9951944, 0, 0, 0, 1, 1,
1.221869, -1.829775, 2.567425, 0, 0, 0, 1, 1,
1.229421, 0.6548638, 0.4458614, 0, 0, 0, 1, 1,
1.230868, 0.2594048, 2.012622, 1, 1, 1, 1, 1,
1.234035, -1.143044, 1.705021, 1, 1, 1, 1, 1,
1.23705, 1.58052, -0.0296946, 1, 1, 1, 1, 1,
1.237689, -0.3063682, 3.038961, 1, 1, 1, 1, 1,
1.271244, 1.89103, 0.3301071, 1, 1, 1, 1, 1,
1.277874, -0.1731924, 3.061736, 1, 1, 1, 1, 1,
1.285602, -1.475853, 3.201599, 1, 1, 1, 1, 1,
1.288095, 0.2018984, 2.353106, 1, 1, 1, 1, 1,
1.289698, -1.097284, 0.9924931, 1, 1, 1, 1, 1,
1.298467, 2.417645, 1.977463, 1, 1, 1, 1, 1,
1.299334, 0.1932696, 2.583587, 1, 1, 1, 1, 1,
1.311316, -0.8866572, 1.201919, 1, 1, 1, 1, 1,
1.316416, 0.2179562, -0.1212712, 1, 1, 1, 1, 1,
1.334871, -0.6668466, 1.969362, 1, 1, 1, 1, 1,
1.335112, 0.6272119, 3.748837, 1, 1, 1, 1, 1,
1.336735, -0.4001156, 2.553226, 0, 0, 1, 1, 1,
1.337299, 0.5731285, 1.447282, 1, 0, 0, 1, 1,
1.350089, -0.1749368, 1.7447, 1, 0, 0, 1, 1,
1.352054, 0.2779457, -0.1781205, 1, 0, 0, 1, 1,
1.361318, 0.05107908, 0.4680424, 1, 0, 0, 1, 1,
1.367164, 0.2743269, 1.6476, 1, 0, 0, 1, 1,
1.371282, -0.1844389, 0.9776001, 0, 0, 0, 1, 1,
1.377158, -1.566232, 3.351484, 0, 0, 0, 1, 1,
1.377288, 0.2592518, -0.4797552, 0, 0, 0, 1, 1,
1.379452, 1.455084, 0.9584357, 0, 0, 0, 1, 1,
1.387835, 0.03145042, 2.81272, 0, 0, 0, 1, 1,
1.395871, -0.4428564, 0.602522, 0, 0, 0, 1, 1,
1.41081, 0.5329977, 1.420741, 0, 0, 0, 1, 1,
1.416209, -0.7971106, 2.673679, 1, 1, 1, 1, 1,
1.442415, 0.4633244, -0.9399648, 1, 1, 1, 1, 1,
1.446127, 0.1034273, 0.4253329, 1, 1, 1, 1, 1,
1.446861, 0.09721912, 1.652829, 1, 1, 1, 1, 1,
1.455555, 0.7090798, 0.8457105, 1, 1, 1, 1, 1,
1.4686, 0.3074457, 3.937236, 1, 1, 1, 1, 1,
1.469963, -0.02985959, 0.205245, 1, 1, 1, 1, 1,
1.474135, -1.278897, 1.642923, 1, 1, 1, 1, 1,
1.483194, -0.6092342, 1.309466, 1, 1, 1, 1, 1,
1.502932, 0.3038834, 2.222867, 1, 1, 1, 1, 1,
1.511295, 0.1192655, 1.380126, 1, 1, 1, 1, 1,
1.517023, 0.03702539, -0.5206515, 1, 1, 1, 1, 1,
1.52223, -0.4687991, 1.682322, 1, 1, 1, 1, 1,
1.526704, 1.650292, 2.164793, 1, 1, 1, 1, 1,
1.529067, -0.08471143, 1.494556, 1, 1, 1, 1, 1,
1.541317, 1.831375, 0.6941193, 0, 0, 1, 1, 1,
1.5426, -1.371141, 3.539346, 1, 0, 0, 1, 1,
1.543535, -2.715691, 3.197572, 1, 0, 0, 1, 1,
1.545136, -0.03977919, 1.214356, 1, 0, 0, 1, 1,
1.554775, 0.3756093, 0.31631, 1, 0, 0, 1, 1,
1.563505, -0.2572535, 0.8602734, 1, 0, 0, 1, 1,
1.564523, 0.1353327, 2.677247, 0, 0, 0, 1, 1,
1.576685, -1.04466, 4.202614, 0, 0, 0, 1, 1,
1.612099, 0.4156302, 1.49348, 0, 0, 0, 1, 1,
1.616417, 0.3679685, 0.07261124, 0, 0, 0, 1, 1,
1.619858, 0.3974535, 0.851432, 0, 0, 0, 1, 1,
1.649616, -1.60712, 0.8783161, 0, 0, 0, 1, 1,
1.653791, -0.5319681, 0.9633898, 0, 0, 0, 1, 1,
1.656635, 0.3790944, -0.05200859, 1, 1, 1, 1, 1,
1.664968, -0.1031075, 3.823916, 1, 1, 1, 1, 1,
1.665975, 1.336006, -0.5930144, 1, 1, 1, 1, 1,
1.705808, 0.6639405, 0.0769982, 1, 1, 1, 1, 1,
1.710281, -0.1942972, 0.7943704, 1, 1, 1, 1, 1,
1.723722, 0.5040258, 1.611707, 1, 1, 1, 1, 1,
1.733333, -0.381741, 1.586137, 1, 1, 1, 1, 1,
1.749599, -1.024355, 0.6867846, 1, 1, 1, 1, 1,
1.758957, 2.961478, 0.9565188, 1, 1, 1, 1, 1,
1.819225, 1.082743, -0.1737622, 1, 1, 1, 1, 1,
1.862581, -1.743291, 2.103196, 1, 1, 1, 1, 1,
1.878728, -0.7450244, 2.801844, 1, 1, 1, 1, 1,
1.895857, 0.5954293, 0.2742782, 1, 1, 1, 1, 1,
1.905883, -1.467766, 2.731689, 1, 1, 1, 1, 1,
1.971406, 0.5184247, 1.687023, 1, 1, 1, 1, 1,
1.982811, 0.08984636, 1.694899, 0, 0, 1, 1, 1,
1.995601, 0.1243564, -0.1015826, 1, 0, 0, 1, 1,
2.026339, -1.117171, 2.303103, 1, 0, 0, 1, 1,
2.031829, -1.173897, 3.338381, 1, 0, 0, 1, 1,
2.037546, -1.497205, 1.522737, 1, 0, 0, 1, 1,
2.064165, 0.933451, 1.490783, 1, 0, 0, 1, 1,
2.066056, -0.1679276, 2.212866, 0, 0, 0, 1, 1,
2.08501, -1.359357, 2.398492, 0, 0, 0, 1, 1,
2.118961, -1.461944, 1.550081, 0, 0, 0, 1, 1,
2.122406, -1.234691, 1.944197, 0, 0, 0, 1, 1,
2.125348, -1.145639, 0.5754253, 0, 0, 0, 1, 1,
2.30371, -0.4183715, 1.488036, 0, 0, 0, 1, 1,
2.309463, 0.210937, 2.545165, 0, 0, 0, 1, 1,
2.414278, 0.06939168, 3.282778, 1, 1, 1, 1, 1,
2.417657, 0.5897891, 0.1144445, 1, 1, 1, 1, 1,
2.46285, 1.881575, 1.387097, 1, 1, 1, 1, 1,
2.483075, -0.2279414, 1.436443, 1, 1, 1, 1, 1,
2.523899, 0.9926434, 0.9036893, 1, 1, 1, 1, 1,
2.613069, -0.9515562, 3.055618, 1, 1, 1, 1, 1,
3.166993, 1.095856, 1.095119, 1, 1, 1, 1, 1
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
var radius = 9.932664;
var distance = 34.88806;
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
mvMatrix.translate( -0.05480671, -0.2523316, -0.2017241 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.88806);
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
