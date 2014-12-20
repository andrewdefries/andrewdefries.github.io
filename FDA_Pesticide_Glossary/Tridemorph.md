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
-4.299684, 0.7917036, -2.490565, 1, 0, 0, 1,
-3.403563, -0.1662107, -1.03186, 1, 0.007843138, 0, 1,
-2.925072, -1.354847, -2.008933, 1, 0.01176471, 0, 1,
-2.830352, -1.888876, -3.775276, 1, 0.01960784, 0, 1,
-2.81599, -0.4644406, 0.3963795, 1, 0.02352941, 0, 1,
-2.574195, 0.7017933, -2.514272, 1, 0.03137255, 0, 1,
-2.520332, 0.814442, -1.578653, 1, 0.03529412, 0, 1,
-2.507472, 0.4265162, -1.722691, 1, 0.04313726, 0, 1,
-2.468921, -1.455448, -1.719289, 1, 0.04705882, 0, 1,
-2.376856, 0.5518892, -0.7194941, 1, 0.05490196, 0, 1,
-2.309582, -0.1329109, -1.837775, 1, 0.05882353, 0, 1,
-2.277838, 0.490023, -0.4943868, 1, 0.06666667, 0, 1,
-2.245516, -1.320597, -1.501198, 1, 0.07058824, 0, 1,
-2.236219, 2.304116, -0.8433571, 1, 0.07843138, 0, 1,
-2.191981, -0.5900437, -1.815463, 1, 0.08235294, 0, 1,
-2.177027, -0.6577452, -2.750966, 1, 0.09019608, 0, 1,
-2.112169, -1.20109, -2.11667, 1, 0.09411765, 0, 1,
-2.042473, 0.335098, -1.443657, 1, 0.1019608, 0, 1,
-2.030822, 1.209584, 1.233038, 1, 0.1098039, 0, 1,
-2.025557, -1.484976, -2.494939, 1, 0.1137255, 0, 1,
-2.012722, -0.2843809, -2.401366, 1, 0.1215686, 0, 1,
-2.010973, 0.3921307, -1.372908, 1, 0.1254902, 0, 1,
-1.994395, -0.6260288, -1.243885, 1, 0.1333333, 0, 1,
-1.986959, 0.6013697, -0.982583, 1, 0.1372549, 0, 1,
-1.96232, -2.095653, -1.448804, 1, 0.145098, 0, 1,
-1.947884, 1.959746, 0.130794, 1, 0.1490196, 0, 1,
-1.925316, -0.354331, -2.238441, 1, 0.1568628, 0, 1,
-1.912662, -0.506036, -1.0453, 1, 0.1607843, 0, 1,
-1.905106, -1.73453, -3.338517, 1, 0.1686275, 0, 1,
-1.904017, -0.1083284, -0.482402, 1, 0.172549, 0, 1,
-1.867148, 0.02591976, -0.03781486, 1, 0.1803922, 0, 1,
-1.864604, -0.2795499, -1.018473, 1, 0.1843137, 0, 1,
-1.862007, 0.9236878, -0.6140886, 1, 0.1921569, 0, 1,
-1.857573, 0.04804607, -0.9093629, 1, 0.1960784, 0, 1,
-1.838169, -0.1704962, -3.5487, 1, 0.2039216, 0, 1,
-1.832278, -1.341679, -3.927586, 1, 0.2117647, 0, 1,
-1.829174, -0.2609669, -2.087499, 1, 0.2156863, 0, 1,
-1.818019, 0.1151616, -2.411614, 1, 0.2235294, 0, 1,
-1.805892, -1.653049, -5.548959, 1, 0.227451, 0, 1,
-1.780288, -0.8504987, -3.001313, 1, 0.2352941, 0, 1,
-1.777375, 0.2524298, -1.723834, 1, 0.2392157, 0, 1,
-1.75551, -0.7566767, -1.110494, 1, 0.2470588, 0, 1,
-1.752849, 0.6841568, -2.244867, 1, 0.2509804, 0, 1,
-1.746784, -1.620504, -2.457499, 1, 0.2588235, 0, 1,
-1.733527, -1.383444, -1.282838, 1, 0.2627451, 0, 1,
-1.71085, -0.02359781, -0.3929751, 1, 0.2705882, 0, 1,
-1.706031, 0.4820668, -2.052996, 1, 0.2745098, 0, 1,
-1.699718, 1.576022, -1.968138, 1, 0.282353, 0, 1,
-1.68106, -0.6383687, -3.125765, 1, 0.2862745, 0, 1,
-1.67548, -0.425117, -2.045061, 1, 0.2941177, 0, 1,
-1.674808, 1.054944, -1.472329, 1, 0.3019608, 0, 1,
-1.674243, 0.130055, -1.805906, 1, 0.3058824, 0, 1,
-1.672632, -0.1444696, -0.4981606, 1, 0.3137255, 0, 1,
-1.671696, 1.05715, -0.2111167, 1, 0.3176471, 0, 1,
-1.6668, 0.709172, -0.3268844, 1, 0.3254902, 0, 1,
-1.64168, -0.2962022, -1.441764, 1, 0.3294118, 0, 1,
-1.639705, -1.12938, -1.749579, 1, 0.3372549, 0, 1,
-1.631986, -1.927998, -1.783518, 1, 0.3411765, 0, 1,
-1.624841, -0.7661601, -1.932168, 1, 0.3490196, 0, 1,
-1.620462, -0.363073, -1.13922, 1, 0.3529412, 0, 1,
-1.590097, -0.7691069, -3.174828, 1, 0.3607843, 0, 1,
-1.588799, 1.041842, 2.314131, 1, 0.3647059, 0, 1,
-1.577648, 0.3495034, -1.075722, 1, 0.372549, 0, 1,
-1.572666, -0.4937605, -2.098578, 1, 0.3764706, 0, 1,
-1.571994, -1.463114, -1.580573, 1, 0.3843137, 0, 1,
-1.565881, -0.1212179, -2.888632, 1, 0.3882353, 0, 1,
-1.548071, -0.2653339, -1.669701, 1, 0.3960784, 0, 1,
-1.547951, 0.8856087, -2.889295, 1, 0.4039216, 0, 1,
-1.522899, -1.422576, -1.313211, 1, 0.4078431, 0, 1,
-1.516787, 0.8981814, -0.06967645, 1, 0.4156863, 0, 1,
-1.514243, 0.6424822, -1.826913, 1, 0.4196078, 0, 1,
-1.497561, -0.3049885, -1.935511, 1, 0.427451, 0, 1,
-1.480669, 2.127055, -1.107927, 1, 0.4313726, 0, 1,
-1.466429, -0.2754501, -0.565153, 1, 0.4392157, 0, 1,
-1.462544, 0.4834283, -2.704801, 1, 0.4431373, 0, 1,
-1.456867, 1.515676, 0.8248504, 1, 0.4509804, 0, 1,
-1.455741, 0.3597488, -1.815693, 1, 0.454902, 0, 1,
-1.455582, -0.2685138, -2.076161, 1, 0.4627451, 0, 1,
-1.451707, 0.184175, -3.399488, 1, 0.4666667, 0, 1,
-1.451131, -1.552233, -2.801583, 1, 0.4745098, 0, 1,
-1.442615, 1.363397, -1.503554, 1, 0.4784314, 0, 1,
-1.434732, -0.1165117, -0.6123038, 1, 0.4862745, 0, 1,
-1.430941, 0.6046843, 1.086318, 1, 0.4901961, 0, 1,
-1.428299, 0.8425627, -0.6107142, 1, 0.4980392, 0, 1,
-1.426573, -0.1816559, -1.25762, 1, 0.5058824, 0, 1,
-1.425033, -0.7815033, -1.896699, 1, 0.509804, 0, 1,
-1.423445, -1.269956, -2.049821, 1, 0.5176471, 0, 1,
-1.418115, 0.3876292, -1.421359, 1, 0.5215687, 0, 1,
-1.406717, 0.4568576, -0.8068656, 1, 0.5294118, 0, 1,
-1.388047, 0.6255214, -1.778944, 1, 0.5333334, 0, 1,
-1.387326, -1.407586, -2.268434, 1, 0.5411765, 0, 1,
-1.376692, 0.01598296, -4.173355, 1, 0.5450981, 0, 1,
-1.3686, 1.467805, -0.3934295, 1, 0.5529412, 0, 1,
-1.365486, -0.5718298, -0.6164312, 1, 0.5568628, 0, 1,
-1.359026, -0.1657741, -1.262408, 1, 0.5647059, 0, 1,
-1.348253, 0.2241261, -0.2250343, 1, 0.5686275, 0, 1,
-1.342711, -0.5521597, -1.229314, 1, 0.5764706, 0, 1,
-1.339473, -0.9215935, -2.121037, 1, 0.5803922, 0, 1,
-1.309389, 0.9210239, -1.49005, 1, 0.5882353, 0, 1,
-1.300653, -1.723127, -1.703942, 1, 0.5921569, 0, 1,
-1.300436, -1.105244, -2.023308, 1, 0.6, 0, 1,
-1.298395, -0.600399, -1.117921, 1, 0.6078432, 0, 1,
-1.287627, 1.251586, -0.6101078, 1, 0.6117647, 0, 1,
-1.284451, 0.6183703, -2.028139, 1, 0.6196079, 0, 1,
-1.283354, -0.6812286, -2.887846, 1, 0.6235294, 0, 1,
-1.28325, 0.2515462, -2.64921, 1, 0.6313726, 0, 1,
-1.273735, 0.8069416, -1.291262, 1, 0.6352941, 0, 1,
-1.270798, 1.531452, 0.03521707, 1, 0.6431373, 0, 1,
-1.268595, -0.06004117, -1.113798, 1, 0.6470588, 0, 1,
-1.250061, 0.5506205, -0.7681369, 1, 0.654902, 0, 1,
-1.234689, -0.6747894, -0.7140577, 1, 0.6588235, 0, 1,
-1.227957, 0.4322216, -0.4968959, 1, 0.6666667, 0, 1,
-1.222674, 1.314313, -0.2042968, 1, 0.6705883, 0, 1,
-1.219319, -0.2844813, -1.913504, 1, 0.6784314, 0, 1,
-1.218019, -1.136201, -2.124057, 1, 0.682353, 0, 1,
-1.211964, 0.4120331, -1.181985, 1, 0.6901961, 0, 1,
-1.21164, 0.1553089, -0.362922, 1, 0.6941177, 0, 1,
-1.209906, -0.9303946, -2.750603, 1, 0.7019608, 0, 1,
-1.208712, 0.2950069, -2.245371, 1, 0.7098039, 0, 1,
-1.204163, 0.2427019, -2.102135, 1, 0.7137255, 0, 1,
-1.203323, -0.6058398, -2.224717, 1, 0.7215686, 0, 1,
-1.194873, 0.9762945, -0.7764205, 1, 0.7254902, 0, 1,
-1.191491, 0.3626961, -1.43772, 1, 0.7333333, 0, 1,
-1.18763, 1.026901, -1.038217, 1, 0.7372549, 0, 1,
-1.179547, 0.524904, 0.1103377, 1, 0.7450981, 0, 1,
-1.175314, 1.720867, -1.54504, 1, 0.7490196, 0, 1,
-1.165688, -1.172256, -3.538851, 1, 0.7568628, 0, 1,
-1.161194, 0.2512839, -0.8719022, 1, 0.7607843, 0, 1,
-1.139444, 0.4494188, 0.7377647, 1, 0.7686275, 0, 1,
-1.135037, -0.9659682, -1.352827, 1, 0.772549, 0, 1,
-1.129409, 1.146909, -0.630125, 1, 0.7803922, 0, 1,
-1.127778, -0.2744602, -1.840252, 1, 0.7843137, 0, 1,
-1.125538, -0.4780969, -3.160308, 1, 0.7921569, 0, 1,
-1.121906, -0.8232952, -3.526631, 1, 0.7960784, 0, 1,
-1.119117, -1.58073, -3.7492, 1, 0.8039216, 0, 1,
-1.113614, 0.4523828, -0.60785, 1, 0.8117647, 0, 1,
-1.108067, 0.7742618, 0.02053747, 1, 0.8156863, 0, 1,
-1.105945, 1.259793, -2.47563, 1, 0.8235294, 0, 1,
-1.103711, -1.077957, -3.417256, 1, 0.827451, 0, 1,
-1.093667, -1.250818, -2.077641, 1, 0.8352941, 0, 1,
-1.085487, 0.3426702, -0.8952265, 1, 0.8392157, 0, 1,
-1.076724, 0.5754595, -2.679982, 1, 0.8470588, 0, 1,
-1.075661, 0.6260445, -1.840949, 1, 0.8509804, 0, 1,
-1.07256, -0.8533366, -2.174078, 1, 0.8588235, 0, 1,
-1.066547, -1.71147, -1.907298, 1, 0.8627451, 0, 1,
-1.063053, -0.9844701, -0.8160771, 1, 0.8705882, 0, 1,
-1.058159, 0.3059433, 0.6525732, 1, 0.8745098, 0, 1,
-1.056743, -0.5313472, -2.676889, 1, 0.8823529, 0, 1,
-1.049914, -0.1052978, -1.345806, 1, 0.8862745, 0, 1,
-1.04878, -1.456265, -2.449919, 1, 0.8941177, 0, 1,
-1.047651, -0.1573943, -1.898951, 1, 0.8980392, 0, 1,
-1.0411, -0.2275523, -2.330359, 1, 0.9058824, 0, 1,
-1.037931, -0.7530271, -2.89248, 1, 0.9137255, 0, 1,
-1.037815, -0.2433827, -1.85011, 1, 0.9176471, 0, 1,
-1.036464, 0.3794027, -1.18915, 1, 0.9254902, 0, 1,
-1.035031, -0.08865827, -3.100838, 1, 0.9294118, 0, 1,
-1.030962, 0.3075442, -0.1766187, 1, 0.9372549, 0, 1,
-1.030548, -0.9643128, -2.323448, 1, 0.9411765, 0, 1,
-1.02037, 0.5962825, -2.006031, 1, 0.9490196, 0, 1,
-1.020131, 0.1671213, -0.6366255, 1, 0.9529412, 0, 1,
-1.016434, 0.9412733, -1.358936, 1, 0.9607843, 0, 1,
-0.9842349, -0.4254571, -1.213883, 1, 0.9647059, 0, 1,
-0.9706404, -0.4111419, -1.867336, 1, 0.972549, 0, 1,
-0.9703084, -1.141093, -2.066059, 1, 0.9764706, 0, 1,
-0.9596779, -1.081815, -1.300891, 1, 0.9843137, 0, 1,
-0.9578371, -0.4760677, -2.790991, 1, 0.9882353, 0, 1,
-0.951404, 0.7148814, -0.894272, 1, 0.9960784, 0, 1,
-0.9444429, 0.4962182, 0.7426225, 0.9960784, 1, 0, 1,
-0.9311646, -1.391977, -2.585345, 0.9921569, 1, 0, 1,
-0.9287602, -0.4291396, -3.022274, 0.9843137, 1, 0, 1,
-0.9151825, -0.4871742, -2.534636, 0.9803922, 1, 0, 1,
-0.913493, -0.746959, -2.300902, 0.972549, 1, 0, 1,
-0.9129003, -0.06030111, -2.320796, 0.9686275, 1, 0, 1,
-0.9125612, -1.143141, -1.354512, 0.9607843, 1, 0, 1,
-0.9072715, -0.3783786, -1.435678, 0.9568627, 1, 0, 1,
-0.9057533, 0.09695383, 0.4652564, 0.9490196, 1, 0, 1,
-0.9016176, -0.5136368, -1.177272, 0.945098, 1, 0, 1,
-0.8981976, 0.557502, -0.6682023, 0.9372549, 1, 0, 1,
-0.8937818, -0.970817, -2.69777, 0.9333333, 1, 0, 1,
-0.8896505, -1.275091, -3.784534, 0.9254902, 1, 0, 1,
-0.8891286, 0.07411911, -0.4999147, 0.9215686, 1, 0, 1,
-0.8782262, -0.167754, -2.335196, 0.9137255, 1, 0, 1,
-0.8763196, -0.4513704, -1.767015, 0.9098039, 1, 0, 1,
-0.8761888, -0.7837045, -0.581957, 0.9019608, 1, 0, 1,
-0.876111, -1.478639, -2.466308, 0.8941177, 1, 0, 1,
-0.8683533, 0.7882803, -1.448087, 0.8901961, 1, 0, 1,
-0.8667428, -0.4543103, -1.332203, 0.8823529, 1, 0, 1,
-0.8659512, 0.05085059, -1.805762, 0.8784314, 1, 0, 1,
-0.8633572, -1.080179, -2.050283, 0.8705882, 1, 0, 1,
-0.8632436, 0.5651061, -1.445635, 0.8666667, 1, 0, 1,
-0.8591725, -0.5642655, -1.419252, 0.8588235, 1, 0, 1,
-0.8583542, 0.03988616, -1.740606, 0.854902, 1, 0, 1,
-0.8548821, 0.1652786, -0.2601514, 0.8470588, 1, 0, 1,
-0.8493893, 1.062206, -0.1231349, 0.8431373, 1, 0, 1,
-0.8492742, -0.0317694, -1.048298, 0.8352941, 1, 0, 1,
-0.8490573, 0.8377174, -0.2827695, 0.8313726, 1, 0, 1,
-0.8457364, 0.2220111, -0.9718527, 0.8235294, 1, 0, 1,
-0.8416016, -0.5049916, -5.215264, 0.8196079, 1, 0, 1,
-0.8231868, 1.383959, 0.9331543, 0.8117647, 1, 0, 1,
-0.816992, 0.08003898, -0.3022037, 0.8078431, 1, 0, 1,
-0.811015, 0.5831437, -0.9573529, 0.8, 1, 0, 1,
-0.8103339, -0.5513942, -3.113264, 0.7921569, 1, 0, 1,
-0.8051846, -0.3961077, -3.652411, 0.7882353, 1, 0, 1,
-0.8042498, 1.537802, 1.293901, 0.7803922, 1, 0, 1,
-0.8038942, 0.0456578, 0.49204, 0.7764706, 1, 0, 1,
-0.8022377, 0.8599432, -1.710652, 0.7686275, 1, 0, 1,
-0.8017775, -0.05082249, -2.393889, 0.7647059, 1, 0, 1,
-0.800404, 1.985013, -0.2310179, 0.7568628, 1, 0, 1,
-0.7943733, -0.3369074, -1.846884, 0.7529412, 1, 0, 1,
-0.7899778, -0.2597436, -3.277856, 0.7450981, 1, 0, 1,
-0.7898291, 1.357168, -1.217029, 0.7411765, 1, 0, 1,
-0.7858958, -0.06949232, -2.14389, 0.7333333, 1, 0, 1,
-0.7842818, -0.1085075, -2.324314, 0.7294118, 1, 0, 1,
-0.7805358, 0.8453275, -0.2785502, 0.7215686, 1, 0, 1,
-0.7757973, 0.1559624, -1.792035, 0.7176471, 1, 0, 1,
-0.7724659, 0.9770776, -0.3433507, 0.7098039, 1, 0, 1,
-0.7617519, -0.3888703, -1.581306, 0.7058824, 1, 0, 1,
-0.7580115, -0.159952, -2.717315, 0.6980392, 1, 0, 1,
-0.7500571, -0.7131926, -1.759393, 0.6901961, 1, 0, 1,
-0.7454944, -0.6961123, -2.324918, 0.6862745, 1, 0, 1,
-0.7440392, 0.2833422, -0.3083632, 0.6784314, 1, 0, 1,
-0.7379969, 1.118913, -1.136328, 0.6745098, 1, 0, 1,
-0.7349562, -1.102274, -0.310272, 0.6666667, 1, 0, 1,
-0.7272426, 1.329538, -0.2946469, 0.6627451, 1, 0, 1,
-0.7250358, 1.160558, -2.741036, 0.654902, 1, 0, 1,
-0.7240966, 1.18413, -0.6854741, 0.6509804, 1, 0, 1,
-0.7240125, -1.123294, -1.703613, 0.6431373, 1, 0, 1,
-0.7164633, 0.9976768, -1.80454, 0.6392157, 1, 0, 1,
-0.7119629, 0.5341669, 0.8528273, 0.6313726, 1, 0, 1,
-0.7099689, -0.8095019, -2.261634, 0.627451, 1, 0, 1,
-0.7043858, 1.190229, -1.148368, 0.6196079, 1, 0, 1,
-0.7011213, 1.25492, 0.2893648, 0.6156863, 1, 0, 1,
-0.7002913, -0.03135146, -2.417834, 0.6078432, 1, 0, 1,
-0.6997653, 1.435821, 0.1819372, 0.6039216, 1, 0, 1,
-0.6988024, -0.6318458, -2.86849, 0.5960785, 1, 0, 1,
-0.6924542, -1.186682, -2.340862, 0.5882353, 1, 0, 1,
-0.6887217, -0.1319679, -3.625449, 0.5843138, 1, 0, 1,
-0.6873131, -1.71558, -1.733093, 0.5764706, 1, 0, 1,
-0.6852611, -1.249067, -2.720069, 0.572549, 1, 0, 1,
-0.6775471, -1.250385, -1.326523, 0.5647059, 1, 0, 1,
-0.6734022, -0.1328048, -2.314836, 0.5607843, 1, 0, 1,
-0.6694339, -1.026185, -3.316418, 0.5529412, 1, 0, 1,
-0.6661446, -0.3914683, -1.774023, 0.5490196, 1, 0, 1,
-0.6642563, 0.7708461, -0.05330148, 0.5411765, 1, 0, 1,
-0.6630583, 0.3960289, 0.05282503, 0.5372549, 1, 0, 1,
-0.6627344, -0.1553218, -2.915138, 0.5294118, 1, 0, 1,
-0.6592275, -0.4094408, -2.72049, 0.5254902, 1, 0, 1,
-0.6518698, -0.1522714, -2.796333, 0.5176471, 1, 0, 1,
-0.6487566, -1.751805, -3.667454, 0.5137255, 1, 0, 1,
-0.646545, -2.041181, -1.90611, 0.5058824, 1, 0, 1,
-0.6435513, -0.8126722, -1.934728, 0.5019608, 1, 0, 1,
-0.6432589, -0.7420163, -2.890949, 0.4941176, 1, 0, 1,
-0.6425626, -2.010533, -2.591903, 0.4862745, 1, 0, 1,
-0.6395895, 0.4647534, 0.7706372, 0.4823529, 1, 0, 1,
-0.6381865, -0.3393649, -2.525597, 0.4745098, 1, 0, 1,
-0.6370949, 0.6810205, -0.9083244, 0.4705882, 1, 0, 1,
-0.6338519, -1.02982, -3.440701, 0.4627451, 1, 0, 1,
-0.627633, -0.9823797, -1.599608, 0.4588235, 1, 0, 1,
-0.6226054, 1.432111, -1.552369, 0.4509804, 1, 0, 1,
-0.618009, 0.2635249, -1.462111, 0.4470588, 1, 0, 1,
-0.6137261, -0.7378146, -3.934462, 0.4392157, 1, 0, 1,
-0.6133719, 0.6276867, 0.7652979, 0.4352941, 1, 0, 1,
-0.6120682, -0.7401893, -2.782975, 0.427451, 1, 0, 1,
-0.6102785, 0.8106691, -0.6467969, 0.4235294, 1, 0, 1,
-0.6020442, -0.8385742, -1.928, 0.4156863, 1, 0, 1,
-0.5991345, -0.06480366, 0.06780121, 0.4117647, 1, 0, 1,
-0.598807, 1.036653, -1.103693, 0.4039216, 1, 0, 1,
-0.5957856, 0.5179085, -0.6434784, 0.3960784, 1, 0, 1,
-0.595709, 0.9273201, -2.155975, 0.3921569, 1, 0, 1,
-0.5945018, -0.06668818, -1.341231, 0.3843137, 1, 0, 1,
-0.5878618, 2.892336, -1.56339, 0.3803922, 1, 0, 1,
-0.5877269, 0.03932001, -1.521813, 0.372549, 1, 0, 1,
-0.586448, -0.4170573, -1.858008, 0.3686275, 1, 0, 1,
-0.5845549, 0.9382991, -0.8442445, 0.3607843, 1, 0, 1,
-0.5793044, 0.997036, 1.054381, 0.3568628, 1, 0, 1,
-0.5759907, 0.2412678, -2.319472, 0.3490196, 1, 0, 1,
-0.5720757, 0.6037076, 0.007403746, 0.345098, 1, 0, 1,
-0.5718473, 0.9979303, -0.1055933, 0.3372549, 1, 0, 1,
-0.5709231, -0.7751549, -2.212743, 0.3333333, 1, 0, 1,
-0.5659201, 0.4446426, -1.1507, 0.3254902, 1, 0, 1,
-0.5614127, -0.7262359, -2.945143, 0.3215686, 1, 0, 1,
-0.5605531, 0.3086521, -0.4846122, 0.3137255, 1, 0, 1,
-0.5564061, -0.2394674, -0.5388802, 0.3098039, 1, 0, 1,
-0.5550439, 0.1543566, -1.820785, 0.3019608, 1, 0, 1,
-0.5515441, -0.05647084, -3.942459, 0.2941177, 1, 0, 1,
-0.5477474, -0.3615549, -2.572713, 0.2901961, 1, 0, 1,
-0.5472652, 0.8217162, -0.02551562, 0.282353, 1, 0, 1,
-0.5428712, 0.5818059, 0.2420224, 0.2784314, 1, 0, 1,
-0.5389081, -1.535178, -2.536475, 0.2705882, 1, 0, 1,
-0.5376297, 0.6252781, -0.1359965, 0.2666667, 1, 0, 1,
-0.5370291, 0.02422898, -2.609017, 0.2588235, 1, 0, 1,
-0.5365576, -0.4723756, -2.451013, 0.254902, 1, 0, 1,
-0.5365573, -0.9371861, -3.176599, 0.2470588, 1, 0, 1,
-0.5362163, 0.3942467, 0.05345739, 0.2431373, 1, 0, 1,
-0.5311629, 1.456684, 0.9946726, 0.2352941, 1, 0, 1,
-0.5271833, -0.2219757, -1.748315, 0.2313726, 1, 0, 1,
-0.5254548, -0.5155089, -2.479202, 0.2235294, 1, 0, 1,
-0.5244479, 0.2829673, -0.5177959, 0.2196078, 1, 0, 1,
-0.5237644, -1.183865, -4.360353, 0.2117647, 1, 0, 1,
-0.52196, 0.08327286, -1.840798, 0.2078431, 1, 0, 1,
-0.5216626, -0.08980449, 0.4035647, 0.2, 1, 0, 1,
-0.519661, -1.678766, -1.763872, 0.1921569, 1, 0, 1,
-0.5180405, 1.053125, -0.02331924, 0.1882353, 1, 0, 1,
-0.5163043, 0.6320968, 0.2781794, 0.1803922, 1, 0, 1,
-0.5135673, -0.1345365, -1.053663, 0.1764706, 1, 0, 1,
-0.5047955, 0.03569311, -2.626524, 0.1686275, 1, 0, 1,
-0.5026208, -0.2411623, -1.337399, 0.1647059, 1, 0, 1,
-0.5023361, 0.5312326, -1.249549, 0.1568628, 1, 0, 1,
-0.5018114, 0.6452982, -1.891424, 0.1529412, 1, 0, 1,
-0.4981526, -0.7569304, -3.568719, 0.145098, 1, 0, 1,
-0.4981395, -0.8413209, -0.6423237, 0.1411765, 1, 0, 1,
-0.4958348, 1.174066, -1.235336, 0.1333333, 1, 0, 1,
-0.4863247, 0.9973055, -0.196272, 0.1294118, 1, 0, 1,
-0.4843591, -1.969808, -2.824373, 0.1215686, 1, 0, 1,
-0.4808073, 1.200774, -0.4156424, 0.1176471, 1, 0, 1,
-0.4759359, 0.8768067, -0.5984806, 0.1098039, 1, 0, 1,
-0.4710689, -0.2123009, -1.225639, 0.1058824, 1, 0, 1,
-0.4687073, 0.05821629, -1.063516, 0.09803922, 1, 0, 1,
-0.4647855, 0.5550127, -0.03135289, 0.09019608, 1, 0, 1,
-0.4622601, 0.5866653, 0.3788927, 0.08627451, 1, 0, 1,
-0.4598656, 2.104954, -1.15917, 0.07843138, 1, 0, 1,
-0.4585894, 0.08231114, -2.633698, 0.07450981, 1, 0, 1,
-0.4539793, 1.257704, -0.5433303, 0.06666667, 1, 0, 1,
-0.4526766, -0.3798569, -0.9846361, 0.0627451, 1, 0, 1,
-0.4523075, -0.8328825, -2.96627, 0.05490196, 1, 0, 1,
-0.4489017, -0.2746806, -0.9891003, 0.05098039, 1, 0, 1,
-0.4488325, -0.3566154, -1.830975, 0.04313726, 1, 0, 1,
-0.4470218, 0.5912335, 0.3413589, 0.03921569, 1, 0, 1,
-0.4420879, 0.8078003, -0.3339921, 0.03137255, 1, 0, 1,
-0.438525, 0.9314058, -1.606183, 0.02745098, 1, 0, 1,
-0.4370167, -0.1101151, -1.738636, 0.01960784, 1, 0, 1,
-0.4336111, 0.4421301, -2.436269, 0.01568628, 1, 0, 1,
-0.4325313, 0.7835051, -0.9326701, 0.007843138, 1, 0, 1,
-0.4324463, 1.388764, 0.8370484, 0.003921569, 1, 0, 1,
-0.4311247, -0.6541071, -2.781519, 0, 1, 0.003921569, 1,
-0.4279384, -1.947185, -2.298236, 0, 1, 0.01176471, 1,
-0.4256325, -0.4525814, -2.23087, 0, 1, 0.01568628, 1,
-0.4228823, 0.8653553, -0.5631351, 0, 1, 0.02352941, 1,
-0.4207724, 0.1763336, -0.7935868, 0, 1, 0.02745098, 1,
-0.4205488, 0.2515184, -2.09539, 0, 1, 0.03529412, 1,
-0.419924, 0.106212, -2.078378, 0, 1, 0.03921569, 1,
-0.4184252, 1.624593, -0.4584119, 0, 1, 0.04705882, 1,
-0.4160691, 0.3021618, -1.105292, 0, 1, 0.05098039, 1,
-0.4115673, 0.698088, 0.1375555, 0, 1, 0.05882353, 1,
-0.4079414, -0.511915, -3.942452, 0, 1, 0.0627451, 1,
-0.4042506, -0.7932385, -2.453438, 0, 1, 0.07058824, 1,
-0.3987965, 1.491237, -2.016501, 0, 1, 0.07450981, 1,
-0.3972429, 0.3400405, -1.100595, 0, 1, 0.08235294, 1,
-0.3962411, 0.2083398, 0.5472017, 0, 1, 0.08627451, 1,
-0.3958558, 0.09621514, -0.8529547, 0, 1, 0.09411765, 1,
-0.3952328, -2.844033, -3.432563, 0, 1, 0.1019608, 1,
-0.3945701, -1.140921, -3.97812, 0, 1, 0.1058824, 1,
-0.3939743, 2.328612, 1.029588, 0, 1, 0.1137255, 1,
-0.3914319, 1.014618, -1.110918, 0, 1, 0.1176471, 1,
-0.3884846, 2.014345, 0.1430944, 0, 1, 0.1254902, 1,
-0.3821975, 1.434642, -0.6827085, 0, 1, 0.1294118, 1,
-0.3816246, -0.6839466, -1.731121, 0, 1, 0.1372549, 1,
-0.3792525, 0.1316053, -1.837169, 0, 1, 0.1411765, 1,
-0.3790134, -0.7054555, -3.103892, 0, 1, 0.1490196, 1,
-0.3780664, 1.173728, -0.5363674, 0, 1, 0.1529412, 1,
-0.3753432, 1.280159, -1.716041, 0, 1, 0.1607843, 1,
-0.3742391, -0.9504521, -2.756199, 0, 1, 0.1647059, 1,
-0.3700423, 0.8938356, -0.8547953, 0, 1, 0.172549, 1,
-0.3660049, -0.7486288, -2.339535, 0, 1, 0.1764706, 1,
-0.3645477, -0.3983539, -2.895833, 0, 1, 0.1843137, 1,
-0.363149, -1.054643, -3.908343, 0, 1, 0.1882353, 1,
-0.362951, 3.290156, -0.9803521, 0, 1, 0.1960784, 1,
-0.3619716, -0.8116585, -5.098423, 0, 1, 0.2039216, 1,
-0.3595263, -0.472888, -3.750465, 0, 1, 0.2078431, 1,
-0.3586435, 0.4994988, -0.7477323, 0, 1, 0.2156863, 1,
-0.357391, -1.859578, -2.672601, 0, 1, 0.2196078, 1,
-0.3568028, 0.132208, -3.199578, 0, 1, 0.227451, 1,
-0.3561358, -0.8187751, -2.395749, 0, 1, 0.2313726, 1,
-0.3530867, -0.3140555, -1.758841, 0, 1, 0.2392157, 1,
-0.3516235, -0.8938217, -4.727512, 0, 1, 0.2431373, 1,
-0.3500659, 0.3522492, -1.047058, 0, 1, 0.2509804, 1,
-0.3496867, -0.9576347, -1.379425, 0, 1, 0.254902, 1,
-0.3483782, 0.9338223, -0.5329254, 0, 1, 0.2627451, 1,
-0.3456406, -0.2833915, -3.582535, 0, 1, 0.2666667, 1,
-0.3333371, -0.07998664, -3.938718, 0, 1, 0.2745098, 1,
-0.3330242, -0.8506915, -2.394748, 0, 1, 0.2784314, 1,
-0.3330091, -0.2071145, -2.134756, 0, 1, 0.2862745, 1,
-0.3321616, -1.704567, -2.560266, 0, 1, 0.2901961, 1,
-0.3216444, -0.2556859, -2.121232, 0, 1, 0.2980392, 1,
-0.3180275, 0.8513333, -0.06815121, 0, 1, 0.3058824, 1,
-0.3174633, -2.044192, -2.473204, 0, 1, 0.3098039, 1,
-0.3154846, 0.7210496, -1.694165, 0, 1, 0.3176471, 1,
-0.3137329, -0.2969458, -0.9730395, 0, 1, 0.3215686, 1,
-0.3113943, -0.1069337, -0.07590698, 0, 1, 0.3294118, 1,
-0.3072838, 0.8919559, -0.2318299, 0, 1, 0.3333333, 1,
-0.3018997, -0.1136595, -2.937579, 0, 1, 0.3411765, 1,
-0.3017895, 0.779872, 0.3270792, 0, 1, 0.345098, 1,
-0.295524, -0.9183156, -4.420734, 0, 1, 0.3529412, 1,
-0.2942991, -0.3551189, -4.387429, 0, 1, 0.3568628, 1,
-0.2872674, 0.1470544, -1.69552, 0, 1, 0.3647059, 1,
-0.2861578, 0.1335503, -1.61604, 0, 1, 0.3686275, 1,
-0.2836814, 0.8084345, -0.5302997, 0, 1, 0.3764706, 1,
-0.283642, -0.1748495, -1.790267, 0, 1, 0.3803922, 1,
-0.28328, 1.417607, 1.481774, 0, 1, 0.3882353, 1,
-0.2826008, 0.02523587, 0.048162, 0, 1, 0.3921569, 1,
-0.2754705, -1.464376, -3.00887, 0, 1, 0.4, 1,
-0.2750745, -0.7260417, -3.397175, 0, 1, 0.4078431, 1,
-0.2747084, 0.9302459, -0.6180581, 0, 1, 0.4117647, 1,
-0.2670249, 0.1534415, 0.6984239, 0, 1, 0.4196078, 1,
-0.2642979, -0.850955, -2.430545, 0, 1, 0.4235294, 1,
-0.2624197, -1.528101, -3.699076, 0, 1, 0.4313726, 1,
-0.259158, -0.5768129, -2.795641, 0, 1, 0.4352941, 1,
-0.254081, 1.447788, -0.1894137, 0, 1, 0.4431373, 1,
-0.2540256, -0.1472563, -3.206711, 0, 1, 0.4470588, 1,
-0.2522814, 1.431747, -0.7539816, 0, 1, 0.454902, 1,
-0.2497946, -0.5946987, -4.407799, 0, 1, 0.4588235, 1,
-0.2466347, 0.8103378, -0.8632179, 0, 1, 0.4666667, 1,
-0.2456995, -1.115484, -2.934015, 0, 1, 0.4705882, 1,
-0.2434485, 1.514409, -0.8450499, 0, 1, 0.4784314, 1,
-0.2416566, -0.256784, -2.318671, 0, 1, 0.4823529, 1,
-0.2362875, 2.502094, -0.3838271, 0, 1, 0.4901961, 1,
-0.234544, 0.7035227, 0.5240079, 0, 1, 0.4941176, 1,
-0.2322426, -0.9014573, -3.753434, 0, 1, 0.5019608, 1,
-0.2321883, -0.5574228, -3.49144, 0, 1, 0.509804, 1,
-0.2275554, -1.288151, -5.96867, 0, 1, 0.5137255, 1,
-0.226588, 0.1935615, 0.8172678, 0, 1, 0.5215687, 1,
-0.2234978, 0.9293166, -0.674546, 0, 1, 0.5254902, 1,
-0.215939, 0.3865155, -0.9885736, 0, 1, 0.5333334, 1,
-0.2141893, -0.7142038, -0.8653859, 0, 1, 0.5372549, 1,
-0.2112527, 0.1721649, 0.4352312, 0, 1, 0.5450981, 1,
-0.2110411, 0.457965, -0.3007222, 0, 1, 0.5490196, 1,
-0.2025947, -1.241683, -4.081328, 0, 1, 0.5568628, 1,
-0.1993764, -0.8752877, -1.944518, 0, 1, 0.5607843, 1,
-0.1977069, -0.5727572, -4.489284, 0, 1, 0.5686275, 1,
-0.1964936, -0.8321584, -3.101792, 0, 1, 0.572549, 1,
-0.195104, -1.889311, -0.3346134, 0, 1, 0.5803922, 1,
-0.1940614, 1.110941, 0.8121495, 0, 1, 0.5843138, 1,
-0.1940592, -0.7305569, -1.758691, 0, 1, 0.5921569, 1,
-0.1920882, 0.8792345, 1.552427, 0, 1, 0.5960785, 1,
-0.186838, -2.477438, -2.596798, 0, 1, 0.6039216, 1,
-0.1866242, -0.2109987, -1.893883, 0, 1, 0.6117647, 1,
-0.1838944, -0.83892, -3.00962, 0, 1, 0.6156863, 1,
-0.1781609, -0.6083037, -4.068579, 0, 1, 0.6235294, 1,
-0.1772314, -0.6073475, -1.709836, 0, 1, 0.627451, 1,
-0.1753326, 1.100276, -0.6185129, 0, 1, 0.6352941, 1,
-0.1733126, -1.50785, -3.009164, 0, 1, 0.6392157, 1,
-0.1718578, 0.8015849, -0.3070246, 0, 1, 0.6470588, 1,
-0.1709899, -1.503627, -1.159242, 0, 1, 0.6509804, 1,
-0.1682658, 0.5425506, -1.959387, 0, 1, 0.6588235, 1,
-0.1679646, 0.4112419, -0.4987374, 0, 1, 0.6627451, 1,
-0.1668692, 1.002314, -1.155148, 0, 1, 0.6705883, 1,
-0.1645737, -0.532564, -2.572665, 0, 1, 0.6745098, 1,
-0.1624136, 0.2384608, -0.3849464, 0, 1, 0.682353, 1,
-0.1568712, 0.632222, -1.131999, 0, 1, 0.6862745, 1,
-0.1526248, 1.41171, 0.30856, 0, 1, 0.6941177, 1,
-0.1519943, 1.359532, -0.2058296, 0, 1, 0.7019608, 1,
-0.1519569, 1.750255, 0.8080307, 0, 1, 0.7058824, 1,
-0.1509084, -0.4077456, -2.750848, 0, 1, 0.7137255, 1,
-0.1503765, -0.1046225, -3.808919, 0, 1, 0.7176471, 1,
-0.147167, 1.944821, -1.726388, 0, 1, 0.7254902, 1,
-0.1447094, -0.7808071, -2.544394, 0, 1, 0.7294118, 1,
-0.1401146, -1.346901, -4.235076, 0, 1, 0.7372549, 1,
-0.1395734, 1.369789, 1.522076, 0, 1, 0.7411765, 1,
-0.1378087, -1.117178, -2.756089, 0, 1, 0.7490196, 1,
-0.1366425, 0.3584774, -0.7740235, 0, 1, 0.7529412, 1,
-0.1346529, -0.110736, -2.96218, 0, 1, 0.7607843, 1,
-0.1289323, -1.514521, -2.487538, 0, 1, 0.7647059, 1,
-0.1271757, -0.08292768, -3.85498, 0, 1, 0.772549, 1,
-0.1266956, -1.011443, -4.115937, 0, 1, 0.7764706, 1,
-0.1264411, -0.7768273, -4.41994, 0, 1, 0.7843137, 1,
-0.1188955, 0.408035, -0.8281532, 0, 1, 0.7882353, 1,
-0.1158698, 0.1911114, -1.351516, 0, 1, 0.7960784, 1,
-0.1153375, -0.7917246, -3.246068, 0, 1, 0.8039216, 1,
-0.1100096, 0.3821642, -0.3125704, 0, 1, 0.8078431, 1,
-0.1094532, 0.893338, 0.005986386, 0, 1, 0.8156863, 1,
-0.1093155, 1.026386, 0.1128082, 0, 1, 0.8196079, 1,
-0.1071428, 1.062781, -1.151944, 0, 1, 0.827451, 1,
-0.1061536, 0.5608983, 1.244601, 0, 1, 0.8313726, 1,
-0.1060139, 0.4664674, -1.170229, 0, 1, 0.8392157, 1,
-0.1045259, 0.2876689, 0.08436789, 0, 1, 0.8431373, 1,
-0.1028831, -0.4652449, -3.365059, 0, 1, 0.8509804, 1,
-0.102738, 0.4575923, -0.2185581, 0, 1, 0.854902, 1,
-0.1008802, -0.675976, -1.66152, 0, 1, 0.8627451, 1,
-0.1006861, 1.024298, 1.474597, 0, 1, 0.8666667, 1,
-0.09538671, 0.435068, 0.4990348, 0, 1, 0.8745098, 1,
-0.09324419, 1.261444, 0.3892588, 0, 1, 0.8784314, 1,
-0.09240603, -0.1922752, -1.617917, 0, 1, 0.8862745, 1,
-0.0911002, -0.5466408, -1.653639, 0, 1, 0.8901961, 1,
-0.09098098, 1.189492, 0.3634417, 0, 1, 0.8980392, 1,
-0.09047452, -0.3264418, -2.065419, 0, 1, 0.9058824, 1,
-0.09003772, 0.4824557, -0.7432002, 0, 1, 0.9098039, 1,
-0.08798175, 1.431234, 0.9065911, 0, 1, 0.9176471, 1,
-0.08795061, -0.9849648, -3.68559, 0, 1, 0.9215686, 1,
-0.08691193, -0.7101631, -4.071222, 0, 1, 0.9294118, 1,
-0.08576281, -0.4991803, -1.805816, 0, 1, 0.9333333, 1,
-0.08389722, -2.025804, -3.032206, 0, 1, 0.9411765, 1,
-0.08164102, -1.032009, -4.296071, 0, 1, 0.945098, 1,
-0.08040024, 1.965178, -0.333817, 0, 1, 0.9529412, 1,
-0.07807051, 0.1004179, -0.352261, 0, 1, 0.9568627, 1,
-0.07623416, -0.5298243, -1.95466, 0, 1, 0.9647059, 1,
-0.06498658, 0.2917898, 0.2983928, 0, 1, 0.9686275, 1,
-0.06289612, 2.72611, -0.3947111, 0, 1, 0.9764706, 1,
-0.05981813, -1.585688, -3.742043, 0, 1, 0.9803922, 1,
-0.05964044, -0.4164887, -3.628609, 0, 1, 0.9882353, 1,
-0.05883766, -1.716077, -3.404499, 0, 1, 0.9921569, 1,
-0.05549639, -0.1186529, -5.846137, 0, 1, 1, 1,
-0.05524842, 0.3757589, 0.605446, 0, 0.9921569, 1, 1,
-0.05091426, 0.3855503, -0.3832327, 0, 0.9882353, 1, 1,
-0.05009443, -0.1058475, -3.621363, 0, 0.9803922, 1, 1,
-0.04281065, 0.8931715, -0.4606972, 0, 0.9764706, 1, 1,
-0.03998948, 0.3005816, 0.004027276, 0, 0.9686275, 1, 1,
-0.03607977, 0.5659673, 0.2382091, 0, 0.9647059, 1, 1,
-0.03325589, -0.2973222, -3.423509, 0, 0.9568627, 1, 1,
-0.0314454, -0.4867587, -4.076731, 0, 0.9529412, 1, 1,
-0.02629201, 0.9745176, 0.4634762, 0, 0.945098, 1, 1,
-0.02108279, -0.5203, -2.915321, 0, 0.9411765, 1, 1,
-0.02036538, 0.4178916, 0.3745909, 0, 0.9333333, 1, 1,
-0.01503163, 0.06461115, 0.3963767, 0, 0.9294118, 1, 1,
-0.01124978, 1.338001, -0.5359108, 0, 0.9215686, 1, 1,
-0.008159799, -0.1417994, -1.50119, 0, 0.9176471, 1, 1,
-0.007058545, 0.4347869, 1.56425, 0, 0.9098039, 1, 1,
-0.006873933, -0.2290579, -3.418524, 0, 0.9058824, 1, 1,
-0.005972747, 2.438526, 3.292199, 0, 0.8980392, 1, 1,
-0.005526513, 0.04867966, -1.605808, 0, 0.8901961, 1, 1,
-0.004132123, 1.898908, 0.4852342, 0, 0.8862745, 1, 1,
-0.00362744, 0.8607963, 0.5057486, 0, 0.8784314, 1, 1,
-0.002637333, -1.618061, -3.054119, 0, 0.8745098, 1, 1,
-0.0008808472, -1.441411, -5.162373, 0, 0.8666667, 1, 1,
0.001210591, -0.8362091, 3.001708, 0, 0.8627451, 1, 1,
0.003721386, -0.355131, 4.170524, 0, 0.854902, 1, 1,
0.009182828, 0.4534974, 2.135739, 0, 0.8509804, 1, 1,
0.00948063, -0.4337323, 3.671847, 0, 0.8431373, 1, 1,
0.0133085, 0.007043772, 0.6139885, 0, 0.8392157, 1, 1,
0.01360465, 1.126217, 0.7812291, 0, 0.8313726, 1, 1,
0.0172457, 1.245951, 0.08086869, 0, 0.827451, 1, 1,
0.02461964, 0.429244, 0.4653156, 0, 0.8196079, 1, 1,
0.02609852, -0.5535795, 3.263998, 0, 0.8156863, 1, 1,
0.02642727, 0.07399672, -0.8430823, 0, 0.8078431, 1, 1,
0.02659328, 0.7350309, 1.661845, 0, 0.8039216, 1, 1,
0.02931056, -0.8096893, 3.037974, 0, 0.7960784, 1, 1,
0.03409136, -2.013231, 3.103081, 0, 0.7882353, 1, 1,
0.03543016, -0.3929662, 3.095426, 0, 0.7843137, 1, 1,
0.03577508, 0.6708885, -1.293013, 0, 0.7764706, 1, 1,
0.04008256, -0.7222182, 4.822296, 0, 0.772549, 1, 1,
0.04682883, 1.818631, -0.9794595, 0, 0.7647059, 1, 1,
0.04921208, 0.1586328, -0.5003908, 0, 0.7607843, 1, 1,
0.04981077, -0.4404315, 1.293329, 0, 0.7529412, 1, 1,
0.054749, 0.6735927, -0.7630199, 0, 0.7490196, 1, 1,
0.05498794, -0.7270027, 4.435949, 0, 0.7411765, 1, 1,
0.05651474, -0.3724579, 3.559557, 0, 0.7372549, 1, 1,
0.06310106, 0.1339789, 0.5114362, 0, 0.7294118, 1, 1,
0.06449313, -0.4480529, 2.773268, 0, 0.7254902, 1, 1,
0.07002249, -0.6406935, 4.565945, 0, 0.7176471, 1, 1,
0.07079303, 0.8172922, 2.527338, 0, 0.7137255, 1, 1,
0.07359453, 1.29553, 0.7523733, 0, 0.7058824, 1, 1,
0.07407413, -0.4711061, 2.588076, 0, 0.6980392, 1, 1,
0.07469824, 1.618476, -0.6834139, 0, 0.6941177, 1, 1,
0.07471249, -0.3543666, 2.987879, 0, 0.6862745, 1, 1,
0.07719323, 0.5286826, -0.2388901, 0, 0.682353, 1, 1,
0.07774597, 0.965833, 1.116245, 0, 0.6745098, 1, 1,
0.07976495, -0.3261983, 3.202861, 0, 0.6705883, 1, 1,
0.0806034, -0.7928745, 3.008003, 0, 0.6627451, 1, 1,
0.08064292, 0.1198828, -0.07768726, 0, 0.6588235, 1, 1,
0.08294234, -0.8917797, 2.456343, 0, 0.6509804, 1, 1,
0.08500704, -2.095894, 3.03999, 0, 0.6470588, 1, 1,
0.09045927, 0.6023022, 1.239016, 0, 0.6392157, 1, 1,
0.09117927, -0.2378277, 1.699766, 0, 0.6352941, 1, 1,
0.09128882, 0.09333177, 0.8442149, 0, 0.627451, 1, 1,
0.09288981, 0.5087326, -0.3008572, 0, 0.6235294, 1, 1,
0.09427956, -0.7349808, 4.094231, 0, 0.6156863, 1, 1,
0.09457234, -0.2138007, 3.569869, 0, 0.6117647, 1, 1,
0.09796167, 1.701194, -0.4182263, 0, 0.6039216, 1, 1,
0.09980929, 0.4011946, 1.535552, 0, 0.5960785, 1, 1,
0.1027052, -0.2062522, 2.052044, 0, 0.5921569, 1, 1,
0.1036206, -0.6853636, 2.501665, 0, 0.5843138, 1, 1,
0.1039828, 0.0578942, 0.6347909, 0, 0.5803922, 1, 1,
0.1052422, 0.6793408, -1.693929, 0, 0.572549, 1, 1,
0.1057551, 2.261273, -1.088678, 0, 0.5686275, 1, 1,
0.1063829, 1.040449, 0.4197795, 0, 0.5607843, 1, 1,
0.1069494, -0.9864969, 4.265957, 0, 0.5568628, 1, 1,
0.1104394, -0.3308007, 3.181316, 0, 0.5490196, 1, 1,
0.111808, -0.1135988, 3.440121, 0, 0.5450981, 1, 1,
0.1171318, -0.1775551, 0.8486907, 0, 0.5372549, 1, 1,
0.1199398, -0.2742115, 2.52415, 0, 0.5333334, 1, 1,
0.120072, -0.8667513, 2.717751, 0, 0.5254902, 1, 1,
0.120213, -0.3978088, 2.034591, 0, 0.5215687, 1, 1,
0.1215888, 0.4106983, -0.2916577, 0, 0.5137255, 1, 1,
0.1218296, -0.04652538, 2.109655, 0, 0.509804, 1, 1,
0.1231499, -0.3430009, 1.729409, 0, 0.5019608, 1, 1,
0.1244776, -2.202747, 2.680686, 0, 0.4941176, 1, 1,
0.1256794, -0.1672993, 1.16623, 0, 0.4901961, 1, 1,
0.1275582, -0.3518785, 1.941186, 0, 0.4823529, 1, 1,
0.127726, 0.2675017, 0.8840685, 0, 0.4784314, 1, 1,
0.1303968, -1.016791, 3.733076, 0, 0.4705882, 1, 1,
0.1313404, -0.3350524, 3.759323, 0, 0.4666667, 1, 1,
0.1349525, 0.1859499, -0.3503596, 0, 0.4588235, 1, 1,
0.1351908, -0.2458181, 1.293966, 0, 0.454902, 1, 1,
0.1373145, 1.140459, -0.05891657, 0, 0.4470588, 1, 1,
0.1408055, 0.03688018, 0.6802608, 0, 0.4431373, 1, 1,
0.142502, 0.2571041, 2.004249, 0, 0.4352941, 1, 1,
0.1450259, -1.2132, 3.2888, 0, 0.4313726, 1, 1,
0.145575, 0.6632927, -0.7087615, 0, 0.4235294, 1, 1,
0.1484371, 0.5190325, -0.3145191, 0, 0.4196078, 1, 1,
0.1490264, -0.9474741, 3.663363, 0, 0.4117647, 1, 1,
0.1490647, -0.650789, 3.762198, 0, 0.4078431, 1, 1,
0.1520312, -0.3570707, 2.68097, 0, 0.4, 1, 1,
0.1550223, -0.6967857, 1.361709, 0, 0.3921569, 1, 1,
0.1568149, 1.311469, 0.876749, 0, 0.3882353, 1, 1,
0.158835, 0.07552096, 1.073142, 0, 0.3803922, 1, 1,
0.1648553, 0.5150132, 0.3493102, 0, 0.3764706, 1, 1,
0.1668968, 0.8209495, 2.368084, 0, 0.3686275, 1, 1,
0.1708488, -1.050247, 1.590927, 0, 0.3647059, 1, 1,
0.1717714, 0.8846085, -2.051622, 0, 0.3568628, 1, 1,
0.1725059, -1.395246, 2.556327, 0, 0.3529412, 1, 1,
0.1739689, 0.459592, 0.7878916, 0, 0.345098, 1, 1,
0.1752139, 1.19839, 1.855634, 0, 0.3411765, 1, 1,
0.1771573, -0.8878973, 2.730905, 0, 0.3333333, 1, 1,
0.1785513, -2.327317, 2.722228, 0, 0.3294118, 1, 1,
0.1797302, 0.8473135, -0.1378214, 0, 0.3215686, 1, 1,
0.1826479, -0.3249563, 2.957077, 0, 0.3176471, 1, 1,
0.1863222, -1.020624, 2.641693, 0, 0.3098039, 1, 1,
0.1867974, 1.112677, 1.668213, 0, 0.3058824, 1, 1,
0.1894099, 0.5243686, 0.7352139, 0, 0.2980392, 1, 1,
0.1961116, -0.3792762, 3.043063, 0, 0.2901961, 1, 1,
0.20215, 0.7744018, 1.316218, 0, 0.2862745, 1, 1,
0.2089981, 0.8659633, -0.2995628, 0, 0.2784314, 1, 1,
0.2181286, -0.1821689, 1.007889, 0, 0.2745098, 1, 1,
0.236038, 0.1546372, 1.96631, 0, 0.2666667, 1, 1,
0.2377556, 0.3245723, 0.5632319, 0, 0.2627451, 1, 1,
0.2394898, -1.7949, 2.232793, 0, 0.254902, 1, 1,
0.2467882, 1.579888, -0.0177905, 0, 0.2509804, 1, 1,
0.247142, 1.154856, 0.2823387, 0, 0.2431373, 1, 1,
0.2494965, 0.6818237, -0.07868946, 0, 0.2392157, 1, 1,
0.2501971, 0.5669613, -0.220082, 0, 0.2313726, 1, 1,
0.2534077, 0.02985506, -0.4065659, 0, 0.227451, 1, 1,
0.2592834, 0.2143002, 2.665322, 0, 0.2196078, 1, 1,
0.2605556, -0.06006334, 2.191039, 0, 0.2156863, 1, 1,
0.265654, -0.4919005, 4.752487, 0, 0.2078431, 1, 1,
0.2668513, -1.157342, 2.075111, 0, 0.2039216, 1, 1,
0.2671153, 0.9255909, 0.7374072, 0, 0.1960784, 1, 1,
0.2671763, 0.05757644, 2.797475, 0, 0.1882353, 1, 1,
0.2751386, 2.508833, -1.03336, 0, 0.1843137, 1, 1,
0.2757716, -0.0804326, 1.120639, 0, 0.1764706, 1, 1,
0.2760922, 0.6002219, 0.7029303, 0, 0.172549, 1, 1,
0.276856, 0.3601055, -0.6346053, 0, 0.1647059, 1, 1,
0.2795288, 1.05042, -1.100504, 0, 0.1607843, 1, 1,
0.2804949, -0.199186, 1.266943, 0, 0.1529412, 1, 1,
0.2827186, 0.1680234, 2.216961, 0, 0.1490196, 1, 1,
0.283, -0.8092261, 2.29015, 0, 0.1411765, 1, 1,
0.2836387, -0.1652667, 1.909156, 0, 0.1372549, 1, 1,
0.2837017, 0.1692162, 1.585676, 0, 0.1294118, 1, 1,
0.2852613, 1.029805, -0.3254011, 0, 0.1254902, 1, 1,
0.2892538, 0.529601, -0.7852132, 0, 0.1176471, 1, 1,
0.2960112, -1.666753, 2.11425, 0, 0.1137255, 1, 1,
0.2996629, -0.5128054, 3.925999, 0, 0.1058824, 1, 1,
0.3022321, 0.02491907, 1.54243, 0, 0.09803922, 1, 1,
0.3026744, -0.4505981, 2.572693, 0, 0.09411765, 1, 1,
0.3040246, -0.61865, 4.861328, 0, 0.08627451, 1, 1,
0.3040357, -0.3940822, 2.78011, 0, 0.08235294, 1, 1,
0.3052433, -1.065864, 4.440553, 0, 0.07450981, 1, 1,
0.3093031, -0.2216653, 5.059093, 0, 0.07058824, 1, 1,
0.3110932, 0.6508769, -0.9478368, 0, 0.0627451, 1, 1,
0.3152549, 1.382095, 0.8649998, 0, 0.05882353, 1, 1,
0.3155803, -0.9928668, 3.317274, 0, 0.05098039, 1, 1,
0.3158165, -0.3880084, 1.256873, 0, 0.04705882, 1, 1,
0.3168742, -0.5783466, 1.521538, 0, 0.03921569, 1, 1,
0.3178971, -0.2516204, 2.168821, 0, 0.03529412, 1, 1,
0.3192081, -0.07982659, 1.552409, 0, 0.02745098, 1, 1,
0.3204178, -0.2288564, 1.217053, 0, 0.02352941, 1, 1,
0.3224061, 0.5928833, 2.031341, 0, 0.01568628, 1, 1,
0.324486, 0.4397201, 0.7636611, 0, 0.01176471, 1, 1,
0.3250821, -0.05332411, 2.941219, 0, 0.003921569, 1, 1,
0.325097, -1.450237, 3.797513, 0.003921569, 0, 1, 1,
0.3256214, 0.7457586, -1.767746, 0.007843138, 0, 1, 1,
0.3261311, -2.368432, 2.035137, 0.01568628, 0, 1, 1,
0.3262349, -0.9287406, 1.310417, 0.01960784, 0, 1, 1,
0.3326955, 0.175136, 3.561413, 0.02745098, 0, 1, 1,
0.335944, 0.2290003, 2.990139, 0.03137255, 0, 1, 1,
0.3371725, -1.375575, 2.729325, 0.03921569, 0, 1, 1,
0.3492459, 0.9690383, -0.08926722, 0.04313726, 0, 1, 1,
0.3546692, -0.6763343, 3.140058, 0.05098039, 0, 1, 1,
0.3647629, 0.6930385, -0.5019389, 0.05490196, 0, 1, 1,
0.368489, 0.1138711, 0.4439663, 0.0627451, 0, 1, 1,
0.3717737, 0.2996749, 1.388486, 0.06666667, 0, 1, 1,
0.3764891, -0.1334617, 2.422704, 0.07450981, 0, 1, 1,
0.3772447, 1.09756, 0.6461344, 0.07843138, 0, 1, 1,
0.3776096, 0.2652263, 0.9087782, 0.08627451, 0, 1, 1,
0.3782701, -0.8725368, 2.855796, 0.09019608, 0, 1, 1,
0.3795303, -0.8359559, 2.6685, 0.09803922, 0, 1, 1,
0.380661, -1.093948, 0.9739097, 0.1058824, 0, 1, 1,
0.3813048, 1.636624, 0.1545937, 0.1098039, 0, 1, 1,
0.3901301, -2.770468, 3.843299, 0.1176471, 0, 1, 1,
0.39823, 0.4370145, 2.717079, 0.1215686, 0, 1, 1,
0.4053075, 0.1917185, -0.1587924, 0.1294118, 0, 1, 1,
0.409439, 0.2029519, 1.462525, 0.1333333, 0, 1, 1,
0.4104232, 0.9453542, 1.131406, 0.1411765, 0, 1, 1,
0.4126412, -1.742253, 2.742158, 0.145098, 0, 1, 1,
0.4190584, 0.9048711, -0.4056399, 0.1529412, 0, 1, 1,
0.4218589, 0.8804948, -0.1673621, 0.1568628, 0, 1, 1,
0.4257816, -0.6806488, 3.482881, 0.1647059, 0, 1, 1,
0.4271669, 0.3461833, 1.260904, 0.1686275, 0, 1, 1,
0.4291528, -1.176816, 3.641288, 0.1764706, 0, 1, 1,
0.4317202, 0.05837068, 2.723211, 0.1803922, 0, 1, 1,
0.4320927, 0.8988105, 1.173599, 0.1882353, 0, 1, 1,
0.4321645, 0.1992425, 3.37688, 0.1921569, 0, 1, 1,
0.4362938, -2.444253, 2.144482, 0.2, 0, 1, 1,
0.4369234, -2.682976, 2.309131, 0.2078431, 0, 1, 1,
0.4374378, 0.7219539, -0.2968335, 0.2117647, 0, 1, 1,
0.4556115, 0.0544546, 0.8716967, 0.2196078, 0, 1, 1,
0.4598764, -1.830513, 1.643826, 0.2235294, 0, 1, 1,
0.4609251, 0.7547169, -1.926832, 0.2313726, 0, 1, 1,
0.4645162, -2.293629, 3.43676, 0.2352941, 0, 1, 1,
0.4687002, -1.008423, 4.360137, 0.2431373, 0, 1, 1,
0.4734081, -1.484869, 4.184899, 0.2470588, 0, 1, 1,
0.4734657, 0.8014609, 0.233283, 0.254902, 0, 1, 1,
0.4758295, -0.1081541, 2.301695, 0.2588235, 0, 1, 1,
0.4787377, 0.001912614, 1.569066, 0.2666667, 0, 1, 1,
0.4836519, -1.769587, 2.469678, 0.2705882, 0, 1, 1,
0.4857624, -0.3631007, 4.708171, 0.2784314, 0, 1, 1,
0.48587, -0.4441937, 3.570973, 0.282353, 0, 1, 1,
0.4868717, -0.9436024, 1.593653, 0.2901961, 0, 1, 1,
0.487917, -0.4936162, 1.612406, 0.2941177, 0, 1, 1,
0.4909877, -1.543145, 3.008846, 0.3019608, 0, 1, 1,
0.4920801, -0.3750796, 1.653316, 0.3098039, 0, 1, 1,
0.4976629, 1.906502, 0.320779, 0.3137255, 0, 1, 1,
0.5124918, 0.987348, 1.194885, 0.3215686, 0, 1, 1,
0.5149878, -2.094485, 1.314172, 0.3254902, 0, 1, 1,
0.5184844, 0.7084389, 0.6051703, 0.3333333, 0, 1, 1,
0.5258759, 0.922456, -0.883262, 0.3372549, 0, 1, 1,
0.5263655, -0.108669, 3.003094, 0.345098, 0, 1, 1,
0.5324627, -0.202885, 2.47942, 0.3490196, 0, 1, 1,
0.537093, 1.462081, 1.158199, 0.3568628, 0, 1, 1,
0.544739, -0.3406014, 3.299443, 0.3607843, 0, 1, 1,
0.5489686, 2.449044, -0.9214074, 0.3686275, 0, 1, 1,
0.5540043, 1.68658, -1.006689, 0.372549, 0, 1, 1,
0.5568615, -0.5553665, 1.435425, 0.3803922, 0, 1, 1,
0.5609728, -0.6785756, 3.285182, 0.3843137, 0, 1, 1,
0.5616769, 0.1404314, 1.165472, 0.3921569, 0, 1, 1,
0.563307, -0.9020267, 3.491584, 0.3960784, 0, 1, 1,
0.563383, 1.36556, 2.933211, 0.4039216, 0, 1, 1,
0.5691642, 1.060413, -1.381353, 0.4117647, 0, 1, 1,
0.5717581, 0.9089803, -0.5391353, 0.4156863, 0, 1, 1,
0.5751964, -1.475992, 2.475181, 0.4235294, 0, 1, 1,
0.5761271, -0.7804608, 5.118913, 0.427451, 0, 1, 1,
0.5783313, 1.466632, -0.6370167, 0.4352941, 0, 1, 1,
0.5812582, -0.1034563, 2.704911, 0.4392157, 0, 1, 1,
0.5863026, -0.4118402, 1.150765, 0.4470588, 0, 1, 1,
0.5921503, -0.8020369, 2.941465, 0.4509804, 0, 1, 1,
0.5922742, 0.5431383, 0.2096128, 0.4588235, 0, 1, 1,
0.5968743, -0.7534856, 1.306147, 0.4627451, 0, 1, 1,
0.5981103, -0.475951, 3.326076, 0.4705882, 0, 1, 1,
0.6037803, 1.408845, 1.439432, 0.4745098, 0, 1, 1,
0.6189132, 0.6661192, 0.005206726, 0.4823529, 0, 1, 1,
0.6205394, 0.3829316, 0.7706612, 0.4862745, 0, 1, 1,
0.6248403, -1.714473, 4.017716, 0.4941176, 0, 1, 1,
0.6304615, -0.08853672, 1.384237, 0.5019608, 0, 1, 1,
0.6317401, -0.9460899, 3.038366, 0.5058824, 0, 1, 1,
0.6365125, 2.388112, -0.4962782, 0.5137255, 0, 1, 1,
0.640736, 1.598622, -0.7041108, 0.5176471, 0, 1, 1,
0.6460619, -1.020004, 2.751739, 0.5254902, 0, 1, 1,
0.6570742, 0.9647558, 2.424725, 0.5294118, 0, 1, 1,
0.6571087, 1.073786, 1.395378, 0.5372549, 0, 1, 1,
0.6579609, 0.4967934, 0.4650546, 0.5411765, 0, 1, 1,
0.6605902, -1.827412, 2.523613, 0.5490196, 0, 1, 1,
0.664193, -0.8898497, 2.413129, 0.5529412, 0, 1, 1,
0.664521, -0.1161277, 1.362663, 0.5607843, 0, 1, 1,
0.6662454, -0.1426772, 3.929078, 0.5647059, 0, 1, 1,
0.667579, 2.114172, 0.1045825, 0.572549, 0, 1, 1,
0.6714512, -1.187543, 2.966897, 0.5764706, 0, 1, 1,
0.673906, -0.5790915, 1.977815, 0.5843138, 0, 1, 1,
0.6750739, 0.1628464, 2.890696, 0.5882353, 0, 1, 1,
0.6757883, 0.2652824, 1.976971, 0.5960785, 0, 1, 1,
0.6777981, -0.4678201, 2.710115, 0.6039216, 0, 1, 1,
0.6794531, 1.014209, 0.08401339, 0.6078432, 0, 1, 1,
0.6946688, -0.9269666, 3.238861, 0.6156863, 0, 1, 1,
0.6965979, 2.493762, 0.2533752, 0.6196079, 0, 1, 1,
0.7023575, -1.753324, 1.910007, 0.627451, 0, 1, 1,
0.7036706, -0.1194014, 1.902956, 0.6313726, 0, 1, 1,
0.7043042, 0.1687981, 1.137907, 0.6392157, 0, 1, 1,
0.7059255, 0.002097959, 0.3685215, 0.6431373, 0, 1, 1,
0.7167388, 0.4329332, 0.9464455, 0.6509804, 0, 1, 1,
0.7173365, 0.8361065, 0.4573756, 0.654902, 0, 1, 1,
0.7249824, 0.3589854, 1.22494, 0.6627451, 0, 1, 1,
0.7302267, -1.352506, 0.4299996, 0.6666667, 0, 1, 1,
0.7319549, 1.087119, -0.3899896, 0.6745098, 0, 1, 1,
0.7425585, 1.289649, 0.398197, 0.6784314, 0, 1, 1,
0.7450603, -0.1507447, 1.941028, 0.6862745, 0, 1, 1,
0.7462721, 1.948459, -0.1758554, 0.6901961, 0, 1, 1,
0.7491514, -1.792095, 2.099118, 0.6980392, 0, 1, 1,
0.7576964, 0.7344133, 3.18857, 0.7058824, 0, 1, 1,
0.7619691, 1.389565, 1.906305, 0.7098039, 0, 1, 1,
0.7646374, 0.06398095, 0.2512964, 0.7176471, 0, 1, 1,
0.7712168, -0.07213394, 0.2863498, 0.7215686, 0, 1, 1,
0.777379, -0.1303674, 0.03372476, 0.7294118, 0, 1, 1,
0.7803493, -0.3831853, 2.783993, 0.7333333, 0, 1, 1,
0.7809178, 0.1120485, 1.277048, 0.7411765, 0, 1, 1,
0.7849756, 1.549029, 3.171948, 0.7450981, 0, 1, 1,
0.7859729, 0.7278912, 0.1540611, 0.7529412, 0, 1, 1,
0.7862732, -0.6133751, 1.586371, 0.7568628, 0, 1, 1,
0.7866198, -0.7648597, 0.8904489, 0.7647059, 0, 1, 1,
0.7871667, 0.06859044, 3.447339, 0.7686275, 0, 1, 1,
0.7962297, -1.138818, 2.81209, 0.7764706, 0, 1, 1,
0.7964357, 0.5027034, 2.165783, 0.7803922, 0, 1, 1,
0.7975814, -1.476892, 1.788535, 0.7882353, 0, 1, 1,
0.8015663, 1.298161, 1.742864, 0.7921569, 0, 1, 1,
0.8018451, -0.358711, 1.492737, 0.8, 0, 1, 1,
0.8019965, -0.5330284, 1.004542, 0.8078431, 0, 1, 1,
0.8045954, 0.1311448, 2.358551, 0.8117647, 0, 1, 1,
0.8092493, 1.213035, -0.2828287, 0.8196079, 0, 1, 1,
0.8126879, -0.07888714, 1.597088, 0.8235294, 0, 1, 1,
0.8135455, 1.907314, 1.064849, 0.8313726, 0, 1, 1,
0.813769, -0.3061641, 0.06874739, 0.8352941, 0, 1, 1,
0.818521, -1.800617, 3.24656, 0.8431373, 0, 1, 1,
0.8216862, 0.8326912, 1.271365, 0.8470588, 0, 1, 1,
0.8289599, 0.7532799, -0.04203917, 0.854902, 0, 1, 1,
0.8302538, 1.894881, -1.273056, 0.8588235, 0, 1, 1,
0.8331056, -0.653209, 1.200785, 0.8666667, 0, 1, 1,
0.8382614, 2.977472, -1.053068, 0.8705882, 0, 1, 1,
0.8401318, 0.01222498, 2.678112, 0.8784314, 0, 1, 1,
0.8463828, 0.1567962, 0.8649869, 0.8823529, 0, 1, 1,
0.8469009, 2.283154, 1.328753, 0.8901961, 0, 1, 1,
0.8477296, -1.678961, 2.960451, 0.8941177, 0, 1, 1,
0.8550472, 0.7111619, 0.5158404, 0.9019608, 0, 1, 1,
0.858943, -0.472272, 2.69462, 0.9098039, 0, 1, 1,
0.862954, -0.5738497, 1.644224, 0.9137255, 0, 1, 1,
0.8643735, 2.391452, 0.9385907, 0.9215686, 0, 1, 1,
0.8661741, -0.3324093, 0.8869363, 0.9254902, 0, 1, 1,
0.8738289, 0.5714467, 0.6766497, 0.9333333, 0, 1, 1,
0.8800339, 0.5418643, 1.945973, 0.9372549, 0, 1, 1,
0.8832816, 0.3362722, 2.166517, 0.945098, 0, 1, 1,
0.8843063, 1.125978, 0.4995901, 0.9490196, 0, 1, 1,
0.8857325, 0.9806346, 1.285853, 0.9568627, 0, 1, 1,
0.8885513, -0.7496034, 3.007, 0.9607843, 0, 1, 1,
0.8891575, -0.174795, 1.090266, 0.9686275, 0, 1, 1,
0.8950412, -0.3459975, 1.520762, 0.972549, 0, 1, 1,
0.9043627, -2.102149, 2.972605, 0.9803922, 0, 1, 1,
0.9114068, 1.096209, 0.8148472, 0.9843137, 0, 1, 1,
0.9167696, -1.420134, 1.615996, 0.9921569, 0, 1, 1,
0.9198405, 0.1175982, 2.220942, 0.9960784, 0, 1, 1,
0.9223593, -0.5954872, 2.319009, 1, 0, 0.9960784, 1,
0.9295789, -2.094938, 4.755178, 1, 0, 0.9882353, 1,
0.9341998, -0.7445433, 0.7844253, 1, 0, 0.9843137, 1,
0.9393751, -0.005520267, 2.859166, 1, 0, 0.9764706, 1,
0.9524792, -0.08162069, 2.736803, 1, 0, 0.972549, 1,
0.954512, 1.623526, 1.072206, 1, 0, 0.9647059, 1,
0.9564055, 1.439311, 1.295401, 1, 0, 0.9607843, 1,
0.9638183, 0.8210968, 1.410004, 1, 0, 0.9529412, 1,
0.970232, 1.950404, 0.7480419, 1, 0, 0.9490196, 1,
0.9814701, 0.4582585, 0.6988373, 1, 0, 0.9411765, 1,
0.9838586, -0.8326264, 2.229112, 1, 0, 0.9372549, 1,
0.9892356, -0.8008207, 3.279979, 1, 0, 0.9294118, 1,
0.9941736, -0.1886404, 2.019683, 1, 0, 0.9254902, 1,
0.9945935, -0.7559013, 1.710619, 1, 0, 0.9176471, 1,
1.00218, 0.04887731, -1.420645, 1, 0, 0.9137255, 1,
1.003523, 0.2935872, 0.8742365, 1, 0, 0.9058824, 1,
1.006281, -0.4321504, 1.678389, 1, 0, 0.9019608, 1,
1.026374, 0.05164972, 1.953164, 1, 0, 0.8941177, 1,
1.038834, 0.767715, 0.6925191, 1, 0, 0.8862745, 1,
1.039657, -0.9226303, 3.388831, 1, 0, 0.8823529, 1,
1.040935, 1.222336, 0.4875407, 1, 0, 0.8745098, 1,
1.046668, -1.798199, 2.629528, 1, 0, 0.8705882, 1,
1.049492, -0.7275483, 3.642742, 1, 0, 0.8627451, 1,
1.052052, -0.06328428, 1.911157, 1, 0, 0.8588235, 1,
1.055602, 0.984064, 0.5728042, 1, 0, 0.8509804, 1,
1.059357, -0.8887779, 0.1781383, 1, 0, 0.8470588, 1,
1.063107, 1.272298, 0.4000787, 1, 0, 0.8392157, 1,
1.065371, 0.4453864, 1.343367, 1, 0, 0.8352941, 1,
1.074264, -0.2774761, 1.86069, 1, 0, 0.827451, 1,
1.07475, 0.7436626, -0.09837203, 1, 0, 0.8235294, 1,
1.082646, -1.515289, 0.7795279, 1, 0, 0.8156863, 1,
1.089076, -1.794663, 1.853846, 1, 0, 0.8117647, 1,
1.089731, -0.7131381, 1.811407, 1, 0, 0.8039216, 1,
1.098557, -0.2834973, 1.071645, 1, 0, 0.7960784, 1,
1.099176, -0.02011348, 1.766826, 1, 0, 0.7921569, 1,
1.103305, -1.955858, 1.841745, 1, 0, 0.7843137, 1,
1.106737, 0.4576677, 1.191138, 1, 0, 0.7803922, 1,
1.109445, 0.9039546, 2.661207, 1, 0, 0.772549, 1,
1.120077, 1.860282, 0.1259111, 1, 0, 0.7686275, 1,
1.120431, -1.503585, 2.675116, 1, 0, 0.7607843, 1,
1.131429, -0.04770753, 1.067767, 1, 0, 0.7568628, 1,
1.143926, 0.6782399, 1.812107, 1, 0, 0.7490196, 1,
1.147301, -2.501621, 1.942363, 1, 0, 0.7450981, 1,
1.149366, 1.00061, 2.181041, 1, 0, 0.7372549, 1,
1.171325, -0.9421192, 2.339395, 1, 0, 0.7333333, 1,
1.178303, 1.088878, 0.1133642, 1, 0, 0.7254902, 1,
1.179899, -2.729385, 3.097576, 1, 0, 0.7215686, 1,
1.18306, -0.1977848, 0.6486909, 1, 0, 0.7137255, 1,
1.184868, 0.5388524, 1.290317, 1, 0, 0.7098039, 1,
1.186589, 0.1254939, 1.664281, 1, 0, 0.7019608, 1,
1.197412, -0.2686761, 2.394428, 1, 0, 0.6941177, 1,
1.203296, 0.3578345, 1.174584, 1, 0, 0.6901961, 1,
1.205444, -0.2049887, 1.351009, 1, 0, 0.682353, 1,
1.210634, -0.2044933, 1.814356, 1, 0, 0.6784314, 1,
1.211354, -0.8688105, 1.519472, 1, 0, 0.6705883, 1,
1.217758, -1.668582, 4.051128, 1, 0, 0.6666667, 1,
1.221157, 1.504396, 1.86945, 1, 0, 0.6588235, 1,
1.227965, -1.617162, 1.970962, 1, 0, 0.654902, 1,
1.231145, -1.628653, 3.751242, 1, 0, 0.6470588, 1,
1.234566, 0.5524113, -0.5903069, 1, 0, 0.6431373, 1,
1.239226, -1.268645, 1.60386, 1, 0, 0.6352941, 1,
1.248338, -1.167209, 1.425295, 1, 0, 0.6313726, 1,
1.260713, -0.1701829, -0.05275993, 1, 0, 0.6235294, 1,
1.265656, 0.7467125, -0.5388668, 1, 0, 0.6196079, 1,
1.274714, -0.6793332, 1.68446, 1, 0, 0.6117647, 1,
1.292024, 1.005373, 0.2961011, 1, 0, 0.6078432, 1,
1.293195, 0.7590159, 1.993165, 1, 0, 0.6, 1,
1.295347, -0.1476522, 1.081972, 1, 0, 0.5921569, 1,
1.318024, -0.06083252, 1.867152, 1, 0, 0.5882353, 1,
1.322001, 0.5506766, 2.104042, 1, 0, 0.5803922, 1,
1.324727, 0.7157112, -0.106537, 1, 0, 0.5764706, 1,
1.327991, 0.2135194, 1.648684, 1, 0, 0.5686275, 1,
1.330438, -0.9475986, 3.491294, 1, 0, 0.5647059, 1,
1.33551, -0.1139589, 2.340954, 1, 0, 0.5568628, 1,
1.337043, -0.1504496, 1.329729, 1, 0, 0.5529412, 1,
1.347042, -0.1899341, 2.205759, 1, 0, 0.5450981, 1,
1.349033, 0.1998719, 0.7443307, 1, 0, 0.5411765, 1,
1.35949, -0.4064233, 2.03836, 1, 0, 0.5333334, 1,
1.36641, -0.07944826, 2.527616, 1, 0, 0.5294118, 1,
1.368366, -1.302874, 3.054907, 1, 0, 0.5215687, 1,
1.369903, -0.8591623, 2.970847, 1, 0, 0.5176471, 1,
1.374739, 0.4313938, 1.937755, 1, 0, 0.509804, 1,
1.382399, -1.823302, 2.666147, 1, 0, 0.5058824, 1,
1.384168, -0.6425791, 2.557006, 1, 0, 0.4980392, 1,
1.388464, 1.09469, -0.7152297, 1, 0, 0.4901961, 1,
1.388803, 1.082127, 1.317712, 1, 0, 0.4862745, 1,
1.391175, -0.02051124, 0.2884415, 1, 0, 0.4784314, 1,
1.393995, -1.810765, 2.821136, 1, 0, 0.4745098, 1,
1.397377, 1.50623, 2.691662, 1, 0, 0.4666667, 1,
1.419762, -1.648974, 3.730521, 1, 0, 0.4627451, 1,
1.425632, -0.1166543, 1.792091, 1, 0, 0.454902, 1,
1.432619, -0.4153882, 2.616392, 1, 0, 0.4509804, 1,
1.434281, 0.06648784, 0.7439758, 1, 0, 0.4431373, 1,
1.442309, 0.301546, 0.6180332, 1, 0, 0.4392157, 1,
1.444822, 0.3881762, 2.311583, 1, 0, 0.4313726, 1,
1.452814, 0.04762621, 2.096418, 1, 0, 0.427451, 1,
1.455069, -0.6456428, 1.723681, 1, 0, 0.4196078, 1,
1.455999, -0.6629905, 2.972616, 1, 0, 0.4156863, 1,
1.497184, -0.3892021, 0.5862564, 1, 0, 0.4078431, 1,
1.505516, 0.4821362, 1.293407, 1, 0, 0.4039216, 1,
1.507635, 1.582331, 1.77181, 1, 0, 0.3960784, 1,
1.518338, -0.6296135, 3.871488, 1, 0, 0.3882353, 1,
1.524435, 0.8283134, 1.446663, 1, 0, 0.3843137, 1,
1.525788, 1.199314, 2.648384, 1, 0, 0.3764706, 1,
1.526204, -0.1852845, 0.2147342, 1, 0, 0.372549, 1,
1.531939, 0.003371724, 1.850203, 1, 0, 0.3647059, 1,
1.540721, 0.1273002, 1.945316, 1, 0, 0.3607843, 1,
1.564021, -1.107668, 2.072505, 1, 0, 0.3529412, 1,
1.613122, -1.043347, 2.791183, 1, 0, 0.3490196, 1,
1.618899, 0.7231197, 1.870653, 1, 0, 0.3411765, 1,
1.645539, 1.19671, 3.066242, 1, 0, 0.3372549, 1,
1.649103, -0.4224356, 1.684568, 1, 0, 0.3294118, 1,
1.65007, -0.1353636, 1.465853, 1, 0, 0.3254902, 1,
1.673682, -1.70839, 3.187404, 1, 0, 0.3176471, 1,
1.673773, -1.604297, 1.896433, 1, 0, 0.3137255, 1,
1.678244, 1.56918, 1.363978, 1, 0, 0.3058824, 1,
1.684776, -0.5483478, 2.523781, 1, 0, 0.2980392, 1,
1.68694, 0.8372411, 1.615109, 1, 0, 0.2941177, 1,
1.689494, 0.732297, 1.754727, 1, 0, 0.2862745, 1,
1.725268, -2.008017, 1.980441, 1, 0, 0.282353, 1,
1.743978, -1.219526, 2.075893, 1, 0, 0.2745098, 1,
1.747708, -0.1854616, 2.865229, 1, 0, 0.2705882, 1,
1.752945, 0.9268619, 2.630527, 1, 0, 0.2627451, 1,
1.788505, -0.01617818, 1.408553, 1, 0, 0.2588235, 1,
1.806392, -0.4441584, 0.7144999, 1, 0, 0.2509804, 1,
1.852318, -0.4850336, 2.192801, 1, 0, 0.2470588, 1,
1.90292, -0.5681877, 2.694096, 1, 0, 0.2392157, 1,
1.9213, -0.4626895, 0.7483866, 1, 0, 0.2352941, 1,
1.946713, -0.09699342, 0.02054707, 1, 0, 0.227451, 1,
1.947163, 0.2257998, -1.030799, 1, 0, 0.2235294, 1,
1.954989, -0.8037727, 1.579202, 1, 0, 0.2156863, 1,
1.966449, -0.8190724, 0.3877366, 1, 0, 0.2117647, 1,
1.978074, -0.1550254, 1.590153, 1, 0, 0.2039216, 1,
2.022497, 0.2240674, 0.8008106, 1, 0, 0.1960784, 1,
2.025459, 0.7989675, 1.212568, 1, 0, 0.1921569, 1,
2.027267, -0.8866817, 2.564218, 1, 0, 0.1843137, 1,
2.030988, 0.9357258, 1.326212, 1, 0, 0.1803922, 1,
2.040647, 0.5002974, 1.714927, 1, 0, 0.172549, 1,
2.043748, 1.697698, 1.337892, 1, 0, 0.1686275, 1,
2.063454, 0.1268036, 0.5658302, 1, 0, 0.1607843, 1,
2.122904, 0.4941843, 1.826789, 1, 0, 0.1568628, 1,
2.124633, 0.8087863, -0.2466415, 1, 0, 0.1490196, 1,
2.127455, 0.1910835, 2.027009, 1, 0, 0.145098, 1,
2.128026, 1.18952, 1.297035, 1, 0, 0.1372549, 1,
2.155829, -0.01360421, 2.555226, 1, 0, 0.1333333, 1,
2.164201, 1.685897, 0.7514687, 1, 0, 0.1254902, 1,
2.182587, -1.653543, 2.500143, 1, 0, 0.1215686, 1,
2.191942, 1.481762, 0.3172092, 1, 0, 0.1137255, 1,
2.205788, 0.2462294, 2.738199, 1, 0, 0.1098039, 1,
2.210631, 0.3001059, 2.092583, 1, 0, 0.1019608, 1,
2.284209, -1.450638, 0.3097351, 1, 0, 0.09411765, 1,
2.29566, -1.218697, -0.6729587, 1, 0, 0.09019608, 1,
2.327886, 1.269069, 2.06999, 1, 0, 0.08235294, 1,
2.332124, -0.9147311, 1.794979, 1, 0, 0.07843138, 1,
2.42072, -0.80916, 2.335413, 1, 0, 0.07058824, 1,
2.452338, 1.863482, 0.3062905, 1, 0, 0.06666667, 1,
2.486407, -0.2588724, 3.611105, 1, 0, 0.05882353, 1,
2.49711, -1.07856, 2.834684, 1, 0, 0.05490196, 1,
2.49754, -0.9680423, 4.269675, 1, 0, 0.04705882, 1,
2.545747, -0.434563, 3.009683, 1, 0, 0.04313726, 1,
2.733358, -0.2623558, 3.139248, 1, 0, 0.03529412, 1,
2.82743, 1.059114, 0.02285071, 1, 0, 0.03137255, 1,
2.860764, 1.072307, 2.070168, 1, 0, 0.02352941, 1,
2.991018, 0.4554832, 1.711844, 1, 0, 0.01960784, 1,
3.451329, -0.03974348, 2.457617, 1, 0, 0.01176471, 1,
3.59449, 0.9063094, 1.813682, 1, 0, 0.007843138, 1
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
-0.3525969, -3.883777, -7.848015, 0, -0.5, 0.5, 0.5,
-0.3525969, -3.883777, -7.848015, 1, -0.5, 0.5, 0.5,
-0.3525969, -3.883777, -7.848015, 1, 1.5, 0.5, 0.5,
-0.3525969, -3.883777, -7.848015, 0, 1.5, 0.5, 0.5
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
-5.637747, 0.2230616, -7.848015, 0, -0.5, 0.5, 0.5,
-5.637747, 0.2230616, -7.848015, 1, -0.5, 0.5, 0.5,
-5.637747, 0.2230616, -7.848015, 1, 1.5, 0.5, 0.5,
-5.637747, 0.2230616, -7.848015, 0, 1.5, 0.5, 0.5
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
-5.637747, -3.883777, -0.4248784, 0, -0.5, 0.5, 0.5,
-5.637747, -3.883777, -0.4248784, 1, -0.5, 0.5, 0.5,
-5.637747, -3.883777, -0.4248784, 1, 1.5, 0.5, 0.5,
-5.637747, -3.883777, -0.4248784, 0, 1.5, 0.5, 0.5
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
-4, -2.936045, -6.134984,
2, -2.936045, -6.134984,
-4, -2.936045, -6.134984,
-4, -3.094001, -6.420489,
-2, -2.936045, -6.134984,
-2, -3.094001, -6.420489,
0, -2.936045, -6.134984,
0, -3.094001, -6.420489,
2, -2.936045, -6.134984,
2, -3.094001, -6.420489
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
"-4",
"-2",
"0",
"2"
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
-4, -3.409911, -6.991499, 0, -0.5, 0.5, 0.5,
-4, -3.409911, -6.991499, 1, -0.5, 0.5, 0.5,
-4, -3.409911, -6.991499, 1, 1.5, 0.5, 0.5,
-4, -3.409911, -6.991499, 0, 1.5, 0.5, 0.5,
-2, -3.409911, -6.991499, 0, -0.5, 0.5, 0.5,
-2, -3.409911, -6.991499, 1, -0.5, 0.5, 0.5,
-2, -3.409911, -6.991499, 1, 1.5, 0.5, 0.5,
-2, -3.409911, -6.991499, 0, 1.5, 0.5, 0.5,
0, -3.409911, -6.991499, 0, -0.5, 0.5, 0.5,
0, -3.409911, -6.991499, 1, -0.5, 0.5, 0.5,
0, -3.409911, -6.991499, 1, 1.5, 0.5, 0.5,
0, -3.409911, -6.991499, 0, 1.5, 0.5, 0.5,
2, -3.409911, -6.991499, 0, -0.5, 0.5, 0.5,
2, -3.409911, -6.991499, 1, -0.5, 0.5, 0.5,
2, -3.409911, -6.991499, 1, 1.5, 0.5, 0.5,
2, -3.409911, -6.991499, 0, 1.5, 0.5, 0.5
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
-4.418097, -2, -6.134984,
-4.418097, 3, -6.134984,
-4.418097, -2, -6.134984,
-4.621372, -2, -6.420489,
-4.418097, -1, -6.134984,
-4.621372, -1, -6.420489,
-4.418097, 0, -6.134984,
-4.621372, 0, -6.420489,
-4.418097, 1, -6.134984,
-4.621372, 1, -6.420489,
-4.418097, 2, -6.134984,
-4.621372, 2, -6.420489,
-4.418097, 3, -6.134984,
-4.621372, 3, -6.420489
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
-5.027922, -2, -6.991499, 0, -0.5, 0.5, 0.5,
-5.027922, -2, -6.991499, 1, -0.5, 0.5, 0.5,
-5.027922, -2, -6.991499, 1, 1.5, 0.5, 0.5,
-5.027922, -2, -6.991499, 0, 1.5, 0.5, 0.5,
-5.027922, -1, -6.991499, 0, -0.5, 0.5, 0.5,
-5.027922, -1, -6.991499, 1, -0.5, 0.5, 0.5,
-5.027922, -1, -6.991499, 1, 1.5, 0.5, 0.5,
-5.027922, -1, -6.991499, 0, 1.5, 0.5, 0.5,
-5.027922, 0, -6.991499, 0, -0.5, 0.5, 0.5,
-5.027922, 0, -6.991499, 1, -0.5, 0.5, 0.5,
-5.027922, 0, -6.991499, 1, 1.5, 0.5, 0.5,
-5.027922, 0, -6.991499, 0, 1.5, 0.5, 0.5,
-5.027922, 1, -6.991499, 0, -0.5, 0.5, 0.5,
-5.027922, 1, -6.991499, 1, -0.5, 0.5, 0.5,
-5.027922, 1, -6.991499, 1, 1.5, 0.5, 0.5,
-5.027922, 1, -6.991499, 0, 1.5, 0.5, 0.5,
-5.027922, 2, -6.991499, 0, -0.5, 0.5, 0.5,
-5.027922, 2, -6.991499, 1, -0.5, 0.5, 0.5,
-5.027922, 2, -6.991499, 1, 1.5, 0.5, 0.5,
-5.027922, 2, -6.991499, 0, 1.5, 0.5, 0.5,
-5.027922, 3, -6.991499, 0, -0.5, 0.5, 0.5,
-5.027922, 3, -6.991499, 1, -0.5, 0.5, 0.5,
-5.027922, 3, -6.991499, 1, 1.5, 0.5, 0.5,
-5.027922, 3, -6.991499, 0, 1.5, 0.5, 0.5
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
-4.418097, -2.936045, -4,
-4.418097, -2.936045, 4,
-4.418097, -2.936045, -4,
-4.621372, -3.094001, -4,
-4.418097, -2.936045, -2,
-4.621372, -3.094001, -2,
-4.418097, -2.936045, 0,
-4.621372, -3.094001, 0,
-4.418097, -2.936045, 2,
-4.621372, -3.094001, 2,
-4.418097, -2.936045, 4,
-4.621372, -3.094001, 4
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
-5.027922, -3.409911, -4, 0, -0.5, 0.5, 0.5,
-5.027922, -3.409911, -4, 1, -0.5, 0.5, 0.5,
-5.027922, -3.409911, -4, 1, 1.5, 0.5, 0.5,
-5.027922, -3.409911, -4, 0, 1.5, 0.5, 0.5,
-5.027922, -3.409911, -2, 0, -0.5, 0.5, 0.5,
-5.027922, -3.409911, -2, 1, -0.5, 0.5, 0.5,
-5.027922, -3.409911, -2, 1, 1.5, 0.5, 0.5,
-5.027922, -3.409911, -2, 0, 1.5, 0.5, 0.5,
-5.027922, -3.409911, 0, 0, -0.5, 0.5, 0.5,
-5.027922, -3.409911, 0, 1, -0.5, 0.5, 0.5,
-5.027922, -3.409911, 0, 1, 1.5, 0.5, 0.5,
-5.027922, -3.409911, 0, 0, 1.5, 0.5, 0.5,
-5.027922, -3.409911, 2, 0, -0.5, 0.5, 0.5,
-5.027922, -3.409911, 2, 1, -0.5, 0.5, 0.5,
-5.027922, -3.409911, 2, 1, 1.5, 0.5, 0.5,
-5.027922, -3.409911, 2, 0, 1.5, 0.5, 0.5,
-5.027922, -3.409911, 4, 0, -0.5, 0.5, 0.5,
-5.027922, -3.409911, 4, 1, -0.5, 0.5, 0.5,
-5.027922, -3.409911, 4, 1, 1.5, 0.5, 0.5,
-5.027922, -3.409911, 4, 0, 1.5, 0.5, 0.5
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
-4.418097, -2.936045, -6.134984,
-4.418097, 3.382169, -6.134984,
-4.418097, -2.936045, 5.285227,
-4.418097, 3.382169, 5.285227,
-4.418097, -2.936045, -6.134984,
-4.418097, -2.936045, 5.285227,
-4.418097, 3.382169, -6.134984,
-4.418097, 3.382169, 5.285227,
-4.418097, -2.936045, -6.134984,
3.712903, -2.936045, -6.134984,
-4.418097, -2.936045, 5.285227,
3.712903, -2.936045, 5.285227,
-4.418097, 3.382169, -6.134984,
3.712903, 3.382169, -6.134984,
-4.418097, 3.382169, 5.285227,
3.712903, 3.382169, 5.285227,
3.712903, -2.936045, -6.134984,
3.712903, 3.382169, -6.134984,
3.712903, -2.936045, 5.285227,
3.712903, 3.382169, 5.285227,
3.712903, -2.936045, -6.134984,
3.712903, -2.936045, 5.285227,
3.712903, 3.382169, -6.134984,
3.712903, 3.382169, 5.285227
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
var radius = 8.211055;
var distance = 36.53191;
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
mvMatrix.translate( 0.3525969, -0.2230616, 0.4248784 );
mvMatrix.scale( 1.091865, 1.405137, 0.7773896 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.53191);
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
Tridemorph<-read.table("Tridemorph.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Tridemorph$V2
```

```
## Error in eval(expr, envir, enclos): object 'Tridemorph' not found
```

```r
y<-Tridemorph$V3
```

```
## Error in eval(expr, envir, enclos): object 'Tridemorph' not found
```

```r
z<-Tridemorph$V4
```

```
## Error in eval(expr, envir, enclos): object 'Tridemorph' not found
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
-4.299684, 0.7917036, -2.490565, 0, 0, 1, 1, 1,
-3.403563, -0.1662107, -1.03186, 1, 0, 0, 1, 1,
-2.925072, -1.354847, -2.008933, 1, 0, 0, 1, 1,
-2.830352, -1.888876, -3.775276, 1, 0, 0, 1, 1,
-2.81599, -0.4644406, 0.3963795, 1, 0, 0, 1, 1,
-2.574195, 0.7017933, -2.514272, 1, 0, 0, 1, 1,
-2.520332, 0.814442, -1.578653, 0, 0, 0, 1, 1,
-2.507472, 0.4265162, -1.722691, 0, 0, 0, 1, 1,
-2.468921, -1.455448, -1.719289, 0, 0, 0, 1, 1,
-2.376856, 0.5518892, -0.7194941, 0, 0, 0, 1, 1,
-2.309582, -0.1329109, -1.837775, 0, 0, 0, 1, 1,
-2.277838, 0.490023, -0.4943868, 0, 0, 0, 1, 1,
-2.245516, -1.320597, -1.501198, 0, 0, 0, 1, 1,
-2.236219, 2.304116, -0.8433571, 1, 1, 1, 1, 1,
-2.191981, -0.5900437, -1.815463, 1, 1, 1, 1, 1,
-2.177027, -0.6577452, -2.750966, 1, 1, 1, 1, 1,
-2.112169, -1.20109, -2.11667, 1, 1, 1, 1, 1,
-2.042473, 0.335098, -1.443657, 1, 1, 1, 1, 1,
-2.030822, 1.209584, 1.233038, 1, 1, 1, 1, 1,
-2.025557, -1.484976, -2.494939, 1, 1, 1, 1, 1,
-2.012722, -0.2843809, -2.401366, 1, 1, 1, 1, 1,
-2.010973, 0.3921307, -1.372908, 1, 1, 1, 1, 1,
-1.994395, -0.6260288, -1.243885, 1, 1, 1, 1, 1,
-1.986959, 0.6013697, -0.982583, 1, 1, 1, 1, 1,
-1.96232, -2.095653, -1.448804, 1, 1, 1, 1, 1,
-1.947884, 1.959746, 0.130794, 1, 1, 1, 1, 1,
-1.925316, -0.354331, -2.238441, 1, 1, 1, 1, 1,
-1.912662, -0.506036, -1.0453, 1, 1, 1, 1, 1,
-1.905106, -1.73453, -3.338517, 0, 0, 1, 1, 1,
-1.904017, -0.1083284, -0.482402, 1, 0, 0, 1, 1,
-1.867148, 0.02591976, -0.03781486, 1, 0, 0, 1, 1,
-1.864604, -0.2795499, -1.018473, 1, 0, 0, 1, 1,
-1.862007, 0.9236878, -0.6140886, 1, 0, 0, 1, 1,
-1.857573, 0.04804607, -0.9093629, 1, 0, 0, 1, 1,
-1.838169, -0.1704962, -3.5487, 0, 0, 0, 1, 1,
-1.832278, -1.341679, -3.927586, 0, 0, 0, 1, 1,
-1.829174, -0.2609669, -2.087499, 0, 0, 0, 1, 1,
-1.818019, 0.1151616, -2.411614, 0, 0, 0, 1, 1,
-1.805892, -1.653049, -5.548959, 0, 0, 0, 1, 1,
-1.780288, -0.8504987, -3.001313, 0, 0, 0, 1, 1,
-1.777375, 0.2524298, -1.723834, 0, 0, 0, 1, 1,
-1.75551, -0.7566767, -1.110494, 1, 1, 1, 1, 1,
-1.752849, 0.6841568, -2.244867, 1, 1, 1, 1, 1,
-1.746784, -1.620504, -2.457499, 1, 1, 1, 1, 1,
-1.733527, -1.383444, -1.282838, 1, 1, 1, 1, 1,
-1.71085, -0.02359781, -0.3929751, 1, 1, 1, 1, 1,
-1.706031, 0.4820668, -2.052996, 1, 1, 1, 1, 1,
-1.699718, 1.576022, -1.968138, 1, 1, 1, 1, 1,
-1.68106, -0.6383687, -3.125765, 1, 1, 1, 1, 1,
-1.67548, -0.425117, -2.045061, 1, 1, 1, 1, 1,
-1.674808, 1.054944, -1.472329, 1, 1, 1, 1, 1,
-1.674243, 0.130055, -1.805906, 1, 1, 1, 1, 1,
-1.672632, -0.1444696, -0.4981606, 1, 1, 1, 1, 1,
-1.671696, 1.05715, -0.2111167, 1, 1, 1, 1, 1,
-1.6668, 0.709172, -0.3268844, 1, 1, 1, 1, 1,
-1.64168, -0.2962022, -1.441764, 1, 1, 1, 1, 1,
-1.639705, -1.12938, -1.749579, 0, 0, 1, 1, 1,
-1.631986, -1.927998, -1.783518, 1, 0, 0, 1, 1,
-1.624841, -0.7661601, -1.932168, 1, 0, 0, 1, 1,
-1.620462, -0.363073, -1.13922, 1, 0, 0, 1, 1,
-1.590097, -0.7691069, -3.174828, 1, 0, 0, 1, 1,
-1.588799, 1.041842, 2.314131, 1, 0, 0, 1, 1,
-1.577648, 0.3495034, -1.075722, 0, 0, 0, 1, 1,
-1.572666, -0.4937605, -2.098578, 0, 0, 0, 1, 1,
-1.571994, -1.463114, -1.580573, 0, 0, 0, 1, 1,
-1.565881, -0.1212179, -2.888632, 0, 0, 0, 1, 1,
-1.548071, -0.2653339, -1.669701, 0, 0, 0, 1, 1,
-1.547951, 0.8856087, -2.889295, 0, 0, 0, 1, 1,
-1.522899, -1.422576, -1.313211, 0, 0, 0, 1, 1,
-1.516787, 0.8981814, -0.06967645, 1, 1, 1, 1, 1,
-1.514243, 0.6424822, -1.826913, 1, 1, 1, 1, 1,
-1.497561, -0.3049885, -1.935511, 1, 1, 1, 1, 1,
-1.480669, 2.127055, -1.107927, 1, 1, 1, 1, 1,
-1.466429, -0.2754501, -0.565153, 1, 1, 1, 1, 1,
-1.462544, 0.4834283, -2.704801, 1, 1, 1, 1, 1,
-1.456867, 1.515676, 0.8248504, 1, 1, 1, 1, 1,
-1.455741, 0.3597488, -1.815693, 1, 1, 1, 1, 1,
-1.455582, -0.2685138, -2.076161, 1, 1, 1, 1, 1,
-1.451707, 0.184175, -3.399488, 1, 1, 1, 1, 1,
-1.451131, -1.552233, -2.801583, 1, 1, 1, 1, 1,
-1.442615, 1.363397, -1.503554, 1, 1, 1, 1, 1,
-1.434732, -0.1165117, -0.6123038, 1, 1, 1, 1, 1,
-1.430941, 0.6046843, 1.086318, 1, 1, 1, 1, 1,
-1.428299, 0.8425627, -0.6107142, 1, 1, 1, 1, 1,
-1.426573, -0.1816559, -1.25762, 0, 0, 1, 1, 1,
-1.425033, -0.7815033, -1.896699, 1, 0, 0, 1, 1,
-1.423445, -1.269956, -2.049821, 1, 0, 0, 1, 1,
-1.418115, 0.3876292, -1.421359, 1, 0, 0, 1, 1,
-1.406717, 0.4568576, -0.8068656, 1, 0, 0, 1, 1,
-1.388047, 0.6255214, -1.778944, 1, 0, 0, 1, 1,
-1.387326, -1.407586, -2.268434, 0, 0, 0, 1, 1,
-1.376692, 0.01598296, -4.173355, 0, 0, 0, 1, 1,
-1.3686, 1.467805, -0.3934295, 0, 0, 0, 1, 1,
-1.365486, -0.5718298, -0.6164312, 0, 0, 0, 1, 1,
-1.359026, -0.1657741, -1.262408, 0, 0, 0, 1, 1,
-1.348253, 0.2241261, -0.2250343, 0, 0, 0, 1, 1,
-1.342711, -0.5521597, -1.229314, 0, 0, 0, 1, 1,
-1.339473, -0.9215935, -2.121037, 1, 1, 1, 1, 1,
-1.309389, 0.9210239, -1.49005, 1, 1, 1, 1, 1,
-1.300653, -1.723127, -1.703942, 1, 1, 1, 1, 1,
-1.300436, -1.105244, -2.023308, 1, 1, 1, 1, 1,
-1.298395, -0.600399, -1.117921, 1, 1, 1, 1, 1,
-1.287627, 1.251586, -0.6101078, 1, 1, 1, 1, 1,
-1.284451, 0.6183703, -2.028139, 1, 1, 1, 1, 1,
-1.283354, -0.6812286, -2.887846, 1, 1, 1, 1, 1,
-1.28325, 0.2515462, -2.64921, 1, 1, 1, 1, 1,
-1.273735, 0.8069416, -1.291262, 1, 1, 1, 1, 1,
-1.270798, 1.531452, 0.03521707, 1, 1, 1, 1, 1,
-1.268595, -0.06004117, -1.113798, 1, 1, 1, 1, 1,
-1.250061, 0.5506205, -0.7681369, 1, 1, 1, 1, 1,
-1.234689, -0.6747894, -0.7140577, 1, 1, 1, 1, 1,
-1.227957, 0.4322216, -0.4968959, 1, 1, 1, 1, 1,
-1.222674, 1.314313, -0.2042968, 0, 0, 1, 1, 1,
-1.219319, -0.2844813, -1.913504, 1, 0, 0, 1, 1,
-1.218019, -1.136201, -2.124057, 1, 0, 0, 1, 1,
-1.211964, 0.4120331, -1.181985, 1, 0, 0, 1, 1,
-1.21164, 0.1553089, -0.362922, 1, 0, 0, 1, 1,
-1.209906, -0.9303946, -2.750603, 1, 0, 0, 1, 1,
-1.208712, 0.2950069, -2.245371, 0, 0, 0, 1, 1,
-1.204163, 0.2427019, -2.102135, 0, 0, 0, 1, 1,
-1.203323, -0.6058398, -2.224717, 0, 0, 0, 1, 1,
-1.194873, 0.9762945, -0.7764205, 0, 0, 0, 1, 1,
-1.191491, 0.3626961, -1.43772, 0, 0, 0, 1, 1,
-1.18763, 1.026901, -1.038217, 0, 0, 0, 1, 1,
-1.179547, 0.524904, 0.1103377, 0, 0, 0, 1, 1,
-1.175314, 1.720867, -1.54504, 1, 1, 1, 1, 1,
-1.165688, -1.172256, -3.538851, 1, 1, 1, 1, 1,
-1.161194, 0.2512839, -0.8719022, 1, 1, 1, 1, 1,
-1.139444, 0.4494188, 0.7377647, 1, 1, 1, 1, 1,
-1.135037, -0.9659682, -1.352827, 1, 1, 1, 1, 1,
-1.129409, 1.146909, -0.630125, 1, 1, 1, 1, 1,
-1.127778, -0.2744602, -1.840252, 1, 1, 1, 1, 1,
-1.125538, -0.4780969, -3.160308, 1, 1, 1, 1, 1,
-1.121906, -0.8232952, -3.526631, 1, 1, 1, 1, 1,
-1.119117, -1.58073, -3.7492, 1, 1, 1, 1, 1,
-1.113614, 0.4523828, -0.60785, 1, 1, 1, 1, 1,
-1.108067, 0.7742618, 0.02053747, 1, 1, 1, 1, 1,
-1.105945, 1.259793, -2.47563, 1, 1, 1, 1, 1,
-1.103711, -1.077957, -3.417256, 1, 1, 1, 1, 1,
-1.093667, -1.250818, -2.077641, 1, 1, 1, 1, 1,
-1.085487, 0.3426702, -0.8952265, 0, 0, 1, 1, 1,
-1.076724, 0.5754595, -2.679982, 1, 0, 0, 1, 1,
-1.075661, 0.6260445, -1.840949, 1, 0, 0, 1, 1,
-1.07256, -0.8533366, -2.174078, 1, 0, 0, 1, 1,
-1.066547, -1.71147, -1.907298, 1, 0, 0, 1, 1,
-1.063053, -0.9844701, -0.8160771, 1, 0, 0, 1, 1,
-1.058159, 0.3059433, 0.6525732, 0, 0, 0, 1, 1,
-1.056743, -0.5313472, -2.676889, 0, 0, 0, 1, 1,
-1.049914, -0.1052978, -1.345806, 0, 0, 0, 1, 1,
-1.04878, -1.456265, -2.449919, 0, 0, 0, 1, 1,
-1.047651, -0.1573943, -1.898951, 0, 0, 0, 1, 1,
-1.0411, -0.2275523, -2.330359, 0, 0, 0, 1, 1,
-1.037931, -0.7530271, -2.89248, 0, 0, 0, 1, 1,
-1.037815, -0.2433827, -1.85011, 1, 1, 1, 1, 1,
-1.036464, 0.3794027, -1.18915, 1, 1, 1, 1, 1,
-1.035031, -0.08865827, -3.100838, 1, 1, 1, 1, 1,
-1.030962, 0.3075442, -0.1766187, 1, 1, 1, 1, 1,
-1.030548, -0.9643128, -2.323448, 1, 1, 1, 1, 1,
-1.02037, 0.5962825, -2.006031, 1, 1, 1, 1, 1,
-1.020131, 0.1671213, -0.6366255, 1, 1, 1, 1, 1,
-1.016434, 0.9412733, -1.358936, 1, 1, 1, 1, 1,
-0.9842349, -0.4254571, -1.213883, 1, 1, 1, 1, 1,
-0.9706404, -0.4111419, -1.867336, 1, 1, 1, 1, 1,
-0.9703084, -1.141093, -2.066059, 1, 1, 1, 1, 1,
-0.9596779, -1.081815, -1.300891, 1, 1, 1, 1, 1,
-0.9578371, -0.4760677, -2.790991, 1, 1, 1, 1, 1,
-0.951404, 0.7148814, -0.894272, 1, 1, 1, 1, 1,
-0.9444429, 0.4962182, 0.7426225, 1, 1, 1, 1, 1,
-0.9311646, -1.391977, -2.585345, 0, 0, 1, 1, 1,
-0.9287602, -0.4291396, -3.022274, 1, 0, 0, 1, 1,
-0.9151825, -0.4871742, -2.534636, 1, 0, 0, 1, 1,
-0.913493, -0.746959, -2.300902, 1, 0, 0, 1, 1,
-0.9129003, -0.06030111, -2.320796, 1, 0, 0, 1, 1,
-0.9125612, -1.143141, -1.354512, 1, 0, 0, 1, 1,
-0.9072715, -0.3783786, -1.435678, 0, 0, 0, 1, 1,
-0.9057533, 0.09695383, 0.4652564, 0, 0, 0, 1, 1,
-0.9016176, -0.5136368, -1.177272, 0, 0, 0, 1, 1,
-0.8981976, 0.557502, -0.6682023, 0, 0, 0, 1, 1,
-0.8937818, -0.970817, -2.69777, 0, 0, 0, 1, 1,
-0.8896505, -1.275091, -3.784534, 0, 0, 0, 1, 1,
-0.8891286, 0.07411911, -0.4999147, 0, 0, 0, 1, 1,
-0.8782262, -0.167754, -2.335196, 1, 1, 1, 1, 1,
-0.8763196, -0.4513704, -1.767015, 1, 1, 1, 1, 1,
-0.8761888, -0.7837045, -0.581957, 1, 1, 1, 1, 1,
-0.876111, -1.478639, -2.466308, 1, 1, 1, 1, 1,
-0.8683533, 0.7882803, -1.448087, 1, 1, 1, 1, 1,
-0.8667428, -0.4543103, -1.332203, 1, 1, 1, 1, 1,
-0.8659512, 0.05085059, -1.805762, 1, 1, 1, 1, 1,
-0.8633572, -1.080179, -2.050283, 1, 1, 1, 1, 1,
-0.8632436, 0.5651061, -1.445635, 1, 1, 1, 1, 1,
-0.8591725, -0.5642655, -1.419252, 1, 1, 1, 1, 1,
-0.8583542, 0.03988616, -1.740606, 1, 1, 1, 1, 1,
-0.8548821, 0.1652786, -0.2601514, 1, 1, 1, 1, 1,
-0.8493893, 1.062206, -0.1231349, 1, 1, 1, 1, 1,
-0.8492742, -0.0317694, -1.048298, 1, 1, 1, 1, 1,
-0.8490573, 0.8377174, -0.2827695, 1, 1, 1, 1, 1,
-0.8457364, 0.2220111, -0.9718527, 0, 0, 1, 1, 1,
-0.8416016, -0.5049916, -5.215264, 1, 0, 0, 1, 1,
-0.8231868, 1.383959, 0.9331543, 1, 0, 0, 1, 1,
-0.816992, 0.08003898, -0.3022037, 1, 0, 0, 1, 1,
-0.811015, 0.5831437, -0.9573529, 1, 0, 0, 1, 1,
-0.8103339, -0.5513942, -3.113264, 1, 0, 0, 1, 1,
-0.8051846, -0.3961077, -3.652411, 0, 0, 0, 1, 1,
-0.8042498, 1.537802, 1.293901, 0, 0, 0, 1, 1,
-0.8038942, 0.0456578, 0.49204, 0, 0, 0, 1, 1,
-0.8022377, 0.8599432, -1.710652, 0, 0, 0, 1, 1,
-0.8017775, -0.05082249, -2.393889, 0, 0, 0, 1, 1,
-0.800404, 1.985013, -0.2310179, 0, 0, 0, 1, 1,
-0.7943733, -0.3369074, -1.846884, 0, 0, 0, 1, 1,
-0.7899778, -0.2597436, -3.277856, 1, 1, 1, 1, 1,
-0.7898291, 1.357168, -1.217029, 1, 1, 1, 1, 1,
-0.7858958, -0.06949232, -2.14389, 1, 1, 1, 1, 1,
-0.7842818, -0.1085075, -2.324314, 1, 1, 1, 1, 1,
-0.7805358, 0.8453275, -0.2785502, 1, 1, 1, 1, 1,
-0.7757973, 0.1559624, -1.792035, 1, 1, 1, 1, 1,
-0.7724659, 0.9770776, -0.3433507, 1, 1, 1, 1, 1,
-0.7617519, -0.3888703, -1.581306, 1, 1, 1, 1, 1,
-0.7580115, -0.159952, -2.717315, 1, 1, 1, 1, 1,
-0.7500571, -0.7131926, -1.759393, 1, 1, 1, 1, 1,
-0.7454944, -0.6961123, -2.324918, 1, 1, 1, 1, 1,
-0.7440392, 0.2833422, -0.3083632, 1, 1, 1, 1, 1,
-0.7379969, 1.118913, -1.136328, 1, 1, 1, 1, 1,
-0.7349562, -1.102274, -0.310272, 1, 1, 1, 1, 1,
-0.7272426, 1.329538, -0.2946469, 1, 1, 1, 1, 1,
-0.7250358, 1.160558, -2.741036, 0, 0, 1, 1, 1,
-0.7240966, 1.18413, -0.6854741, 1, 0, 0, 1, 1,
-0.7240125, -1.123294, -1.703613, 1, 0, 0, 1, 1,
-0.7164633, 0.9976768, -1.80454, 1, 0, 0, 1, 1,
-0.7119629, 0.5341669, 0.8528273, 1, 0, 0, 1, 1,
-0.7099689, -0.8095019, -2.261634, 1, 0, 0, 1, 1,
-0.7043858, 1.190229, -1.148368, 0, 0, 0, 1, 1,
-0.7011213, 1.25492, 0.2893648, 0, 0, 0, 1, 1,
-0.7002913, -0.03135146, -2.417834, 0, 0, 0, 1, 1,
-0.6997653, 1.435821, 0.1819372, 0, 0, 0, 1, 1,
-0.6988024, -0.6318458, -2.86849, 0, 0, 0, 1, 1,
-0.6924542, -1.186682, -2.340862, 0, 0, 0, 1, 1,
-0.6887217, -0.1319679, -3.625449, 0, 0, 0, 1, 1,
-0.6873131, -1.71558, -1.733093, 1, 1, 1, 1, 1,
-0.6852611, -1.249067, -2.720069, 1, 1, 1, 1, 1,
-0.6775471, -1.250385, -1.326523, 1, 1, 1, 1, 1,
-0.6734022, -0.1328048, -2.314836, 1, 1, 1, 1, 1,
-0.6694339, -1.026185, -3.316418, 1, 1, 1, 1, 1,
-0.6661446, -0.3914683, -1.774023, 1, 1, 1, 1, 1,
-0.6642563, 0.7708461, -0.05330148, 1, 1, 1, 1, 1,
-0.6630583, 0.3960289, 0.05282503, 1, 1, 1, 1, 1,
-0.6627344, -0.1553218, -2.915138, 1, 1, 1, 1, 1,
-0.6592275, -0.4094408, -2.72049, 1, 1, 1, 1, 1,
-0.6518698, -0.1522714, -2.796333, 1, 1, 1, 1, 1,
-0.6487566, -1.751805, -3.667454, 1, 1, 1, 1, 1,
-0.646545, -2.041181, -1.90611, 1, 1, 1, 1, 1,
-0.6435513, -0.8126722, -1.934728, 1, 1, 1, 1, 1,
-0.6432589, -0.7420163, -2.890949, 1, 1, 1, 1, 1,
-0.6425626, -2.010533, -2.591903, 0, 0, 1, 1, 1,
-0.6395895, 0.4647534, 0.7706372, 1, 0, 0, 1, 1,
-0.6381865, -0.3393649, -2.525597, 1, 0, 0, 1, 1,
-0.6370949, 0.6810205, -0.9083244, 1, 0, 0, 1, 1,
-0.6338519, -1.02982, -3.440701, 1, 0, 0, 1, 1,
-0.627633, -0.9823797, -1.599608, 1, 0, 0, 1, 1,
-0.6226054, 1.432111, -1.552369, 0, 0, 0, 1, 1,
-0.618009, 0.2635249, -1.462111, 0, 0, 0, 1, 1,
-0.6137261, -0.7378146, -3.934462, 0, 0, 0, 1, 1,
-0.6133719, 0.6276867, 0.7652979, 0, 0, 0, 1, 1,
-0.6120682, -0.7401893, -2.782975, 0, 0, 0, 1, 1,
-0.6102785, 0.8106691, -0.6467969, 0, 0, 0, 1, 1,
-0.6020442, -0.8385742, -1.928, 0, 0, 0, 1, 1,
-0.5991345, -0.06480366, 0.06780121, 1, 1, 1, 1, 1,
-0.598807, 1.036653, -1.103693, 1, 1, 1, 1, 1,
-0.5957856, 0.5179085, -0.6434784, 1, 1, 1, 1, 1,
-0.595709, 0.9273201, -2.155975, 1, 1, 1, 1, 1,
-0.5945018, -0.06668818, -1.341231, 1, 1, 1, 1, 1,
-0.5878618, 2.892336, -1.56339, 1, 1, 1, 1, 1,
-0.5877269, 0.03932001, -1.521813, 1, 1, 1, 1, 1,
-0.586448, -0.4170573, -1.858008, 1, 1, 1, 1, 1,
-0.5845549, 0.9382991, -0.8442445, 1, 1, 1, 1, 1,
-0.5793044, 0.997036, 1.054381, 1, 1, 1, 1, 1,
-0.5759907, 0.2412678, -2.319472, 1, 1, 1, 1, 1,
-0.5720757, 0.6037076, 0.007403746, 1, 1, 1, 1, 1,
-0.5718473, 0.9979303, -0.1055933, 1, 1, 1, 1, 1,
-0.5709231, -0.7751549, -2.212743, 1, 1, 1, 1, 1,
-0.5659201, 0.4446426, -1.1507, 1, 1, 1, 1, 1,
-0.5614127, -0.7262359, -2.945143, 0, 0, 1, 1, 1,
-0.5605531, 0.3086521, -0.4846122, 1, 0, 0, 1, 1,
-0.5564061, -0.2394674, -0.5388802, 1, 0, 0, 1, 1,
-0.5550439, 0.1543566, -1.820785, 1, 0, 0, 1, 1,
-0.5515441, -0.05647084, -3.942459, 1, 0, 0, 1, 1,
-0.5477474, -0.3615549, -2.572713, 1, 0, 0, 1, 1,
-0.5472652, 0.8217162, -0.02551562, 0, 0, 0, 1, 1,
-0.5428712, 0.5818059, 0.2420224, 0, 0, 0, 1, 1,
-0.5389081, -1.535178, -2.536475, 0, 0, 0, 1, 1,
-0.5376297, 0.6252781, -0.1359965, 0, 0, 0, 1, 1,
-0.5370291, 0.02422898, -2.609017, 0, 0, 0, 1, 1,
-0.5365576, -0.4723756, -2.451013, 0, 0, 0, 1, 1,
-0.5365573, -0.9371861, -3.176599, 0, 0, 0, 1, 1,
-0.5362163, 0.3942467, 0.05345739, 1, 1, 1, 1, 1,
-0.5311629, 1.456684, 0.9946726, 1, 1, 1, 1, 1,
-0.5271833, -0.2219757, -1.748315, 1, 1, 1, 1, 1,
-0.5254548, -0.5155089, -2.479202, 1, 1, 1, 1, 1,
-0.5244479, 0.2829673, -0.5177959, 1, 1, 1, 1, 1,
-0.5237644, -1.183865, -4.360353, 1, 1, 1, 1, 1,
-0.52196, 0.08327286, -1.840798, 1, 1, 1, 1, 1,
-0.5216626, -0.08980449, 0.4035647, 1, 1, 1, 1, 1,
-0.519661, -1.678766, -1.763872, 1, 1, 1, 1, 1,
-0.5180405, 1.053125, -0.02331924, 1, 1, 1, 1, 1,
-0.5163043, 0.6320968, 0.2781794, 1, 1, 1, 1, 1,
-0.5135673, -0.1345365, -1.053663, 1, 1, 1, 1, 1,
-0.5047955, 0.03569311, -2.626524, 1, 1, 1, 1, 1,
-0.5026208, -0.2411623, -1.337399, 1, 1, 1, 1, 1,
-0.5023361, 0.5312326, -1.249549, 1, 1, 1, 1, 1,
-0.5018114, 0.6452982, -1.891424, 0, 0, 1, 1, 1,
-0.4981526, -0.7569304, -3.568719, 1, 0, 0, 1, 1,
-0.4981395, -0.8413209, -0.6423237, 1, 0, 0, 1, 1,
-0.4958348, 1.174066, -1.235336, 1, 0, 0, 1, 1,
-0.4863247, 0.9973055, -0.196272, 1, 0, 0, 1, 1,
-0.4843591, -1.969808, -2.824373, 1, 0, 0, 1, 1,
-0.4808073, 1.200774, -0.4156424, 0, 0, 0, 1, 1,
-0.4759359, 0.8768067, -0.5984806, 0, 0, 0, 1, 1,
-0.4710689, -0.2123009, -1.225639, 0, 0, 0, 1, 1,
-0.4687073, 0.05821629, -1.063516, 0, 0, 0, 1, 1,
-0.4647855, 0.5550127, -0.03135289, 0, 0, 0, 1, 1,
-0.4622601, 0.5866653, 0.3788927, 0, 0, 0, 1, 1,
-0.4598656, 2.104954, -1.15917, 0, 0, 0, 1, 1,
-0.4585894, 0.08231114, -2.633698, 1, 1, 1, 1, 1,
-0.4539793, 1.257704, -0.5433303, 1, 1, 1, 1, 1,
-0.4526766, -0.3798569, -0.9846361, 1, 1, 1, 1, 1,
-0.4523075, -0.8328825, -2.96627, 1, 1, 1, 1, 1,
-0.4489017, -0.2746806, -0.9891003, 1, 1, 1, 1, 1,
-0.4488325, -0.3566154, -1.830975, 1, 1, 1, 1, 1,
-0.4470218, 0.5912335, 0.3413589, 1, 1, 1, 1, 1,
-0.4420879, 0.8078003, -0.3339921, 1, 1, 1, 1, 1,
-0.438525, 0.9314058, -1.606183, 1, 1, 1, 1, 1,
-0.4370167, -0.1101151, -1.738636, 1, 1, 1, 1, 1,
-0.4336111, 0.4421301, -2.436269, 1, 1, 1, 1, 1,
-0.4325313, 0.7835051, -0.9326701, 1, 1, 1, 1, 1,
-0.4324463, 1.388764, 0.8370484, 1, 1, 1, 1, 1,
-0.4311247, -0.6541071, -2.781519, 1, 1, 1, 1, 1,
-0.4279384, -1.947185, -2.298236, 1, 1, 1, 1, 1,
-0.4256325, -0.4525814, -2.23087, 0, 0, 1, 1, 1,
-0.4228823, 0.8653553, -0.5631351, 1, 0, 0, 1, 1,
-0.4207724, 0.1763336, -0.7935868, 1, 0, 0, 1, 1,
-0.4205488, 0.2515184, -2.09539, 1, 0, 0, 1, 1,
-0.419924, 0.106212, -2.078378, 1, 0, 0, 1, 1,
-0.4184252, 1.624593, -0.4584119, 1, 0, 0, 1, 1,
-0.4160691, 0.3021618, -1.105292, 0, 0, 0, 1, 1,
-0.4115673, 0.698088, 0.1375555, 0, 0, 0, 1, 1,
-0.4079414, -0.511915, -3.942452, 0, 0, 0, 1, 1,
-0.4042506, -0.7932385, -2.453438, 0, 0, 0, 1, 1,
-0.3987965, 1.491237, -2.016501, 0, 0, 0, 1, 1,
-0.3972429, 0.3400405, -1.100595, 0, 0, 0, 1, 1,
-0.3962411, 0.2083398, 0.5472017, 0, 0, 0, 1, 1,
-0.3958558, 0.09621514, -0.8529547, 1, 1, 1, 1, 1,
-0.3952328, -2.844033, -3.432563, 1, 1, 1, 1, 1,
-0.3945701, -1.140921, -3.97812, 1, 1, 1, 1, 1,
-0.3939743, 2.328612, 1.029588, 1, 1, 1, 1, 1,
-0.3914319, 1.014618, -1.110918, 1, 1, 1, 1, 1,
-0.3884846, 2.014345, 0.1430944, 1, 1, 1, 1, 1,
-0.3821975, 1.434642, -0.6827085, 1, 1, 1, 1, 1,
-0.3816246, -0.6839466, -1.731121, 1, 1, 1, 1, 1,
-0.3792525, 0.1316053, -1.837169, 1, 1, 1, 1, 1,
-0.3790134, -0.7054555, -3.103892, 1, 1, 1, 1, 1,
-0.3780664, 1.173728, -0.5363674, 1, 1, 1, 1, 1,
-0.3753432, 1.280159, -1.716041, 1, 1, 1, 1, 1,
-0.3742391, -0.9504521, -2.756199, 1, 1, 1, 1, 1,
-0.3700423, 0.8938356, -0.8547953, 1, 1, 1, 1, 1,
-0.3660049, -0.7486288, -2.339535, 1, 1, 1, 1, 1,
-0.3645477, -0.3983539, -2.895833, 0, 0, 1, 1, 1,
-0.363149, -1.054643, -3.908343, 1, 0, 0, 1, 1,
-0.362951, 3.290156, -0.9803521, 1, 0, 0, 1, 1,
-0.3619716, -0.8116585, -5.098423, 1, 0, 0, 1, 1,
-0.3595263, -0.472888, -3.750465, 1, 0, 0, 1, 1,
-0.3586435, 0.4994988, -0.7477323, 1, 0, 0, 1, 1,
-0.357391, -1.859578, -2.672601, 0, 0, 0, 1, 1,
-0.3568028, 0.132208, -3.199578, 0, 0, 0, 1, 1,
-0.3561358, -0.8187751, -2.395749, 0, 0, 0, 1, 1,
-0.3530867, -0.3140555, -1.758841, 0, 0, 0, 1, 1,
-0.3516235, -0.8938217, -4.727512, 0, 0, 0, 1, 1,
-0.3500659, 0.3522492, -1.047058, 0, 0, 0, 1, 1,
-0.3496867, -0.9576347, -1.379425, 0, 0, 0, 1, 1,
-0.3483782, 0.9338223, -0.5329254, 1, 1, 1, 1, 1,
-0.3456406, -0.2833915, -3.582535, 1, 1, 1, 1, 1,
-0.3333371, -0.07998664, -3.938718, 1, 1, 1, 1, 1,
-0.3330242, -0.8506915, -2.394748, 1, 1, 1, 1, 1,
-0.3330091, -0.2071145, -2.134756, 1, 1, 1, 1, 1,
-0.3321616, -1.704567, -2.560266, 1, 1, 1, 1, 1,
-0.3216444, -0.2556859, -2.121232, 1, 1, 1, 1, 1,
-0.3180275, 0.8513333, -0.06815121, 1, 1, 1, 1, 1,
-0.3174633, -2.044192, -2.473204, 1, 1, 1, 1, 1,
-0.3154846, 0.7210496, -1.694165, 1, 1, 1, 1, 1,
-0.3137329, -0.2969458, -0.9730395, 1, 1, 1, 1, 1,
-0.3113943, -0.1069337, -0.07590698, 1, 1, 1, 1, 1,
-0.3072838, 0.8919559, -0.2318299, 1, 1, 1, 1, 1,
-0.3018997, -0.1136595, -2.937579, 1, 1, 1, 1, 1,
-0.3017895, 0.779872, 0.3270792, 1, 1, 1, 1, 1,
-0.295524, -0.9183156, -4.420734, 0, 0, 1, 1, 1,
-0.2942991, -0.3551189, -4.387429, 1, 0, 0, 1, 1,
-0.2872674, 0.1470544, -1.69552, 1, 0, 0, 1, 1,
-0.2861578, 0.1335503, -1.61604, 1, 0, 0, 1, 1,
-0.2836814, 0.8084345, -0.5302997, 1, 0, 0, 1, 1,
-0.283642, -0.1748495, -1.790267, 1, 0, 0, 1, 1,
-0.28328, 1.417607, 1.481774, 0, 0, 0, 1, 1,
-0.2826008, 0.02523587, 0.048162, 0, 0, 0, 1, 1,
-0.2754705, -1.464376, -3.00887, 0, 0, 0, 1, 1,
-0.2750745, -0.7260417, -3.397175, 0, 0, 0, 1, 1,
-0.2747084, 0.9302459, -0.6180581, 0, 0, 0, 1, 1,
-0.2670249, 0.1534415, 0.6984239, 0, 0, 0, 1, 1,
-0.2642979, -0.850955, -2.430545, 0, 0, 0, 1, 1,
-0.2624197, -1.528101, -3.699076, 1, 1, 1, 1, 1,
-0.259158, -0.5768129, -2.795641, 1, 1, 1, 1, 1,
-0.254081, 1.447788, -0.1894137, 1, 1, 1, 1, 1,
-0.2540256, -0.1472563, -3.206711, 1, 1, 1, 1, 1,
-0.2522814, 1.431747, -0.7539816, 1, 1, 1, 1, 1,
-0.2497946, -0.5946987, -4.407799, 1, 1, 1, 1, 1,
-0.2466347, 0.8103378, -0.8632179, 1, 1, 1, 1, 1,
-0.2456995, -1.115484, -2.934015, 1, 1, 1, 1, 1,
-0.2434485, 1.514409, -0.8450499, 1, 1, 1, 1, 1,
-0.2416566, -0.256784, -2.318671, 1, 1, 1, 1, 1,
-0.2362875, 2.502094, -0.3838271, 1, 1, 1, 1, 1,
-0.234544, 0.7035227, 0.5240079, 1, 1, 1, 1, 1,
-0.2322426, -0.9014573, -3.753434, 1, 1, 1, 1, 1,
-0.2321883, -0.5574228, -3.49144, 1, 1, 1, 1, 1,
-0.2275554, -1.288151, -5.96867, 1, 1, 1, 1, 1,
-0.226588, 0.1935615, 0.8172678, 0, 0, 1, 1, 1,
-0.2234978, 0.9293166, -0.674546, 1, 0, 0, 1, 1,
-0.215939, 0.3865155, -0.9885736, 1, 0, 0, 1, 1,
-0.2141893, -0.7142038, -0.8653859, 1, 0, 0, 1, 1,
-0.2112527, 0.1721649, 0.4352312, 1, 0, 0, 1, 1,
-0.2110411, 0.457965, -0.3007222, 1, 0, 0, 1, 1,
-0.2025947, -1.241683, -4.081328, 0, 0, 0, 1, 1,
-0.1993764, -0.8752877, -1.944518, 0, 0, 0, 1, 1,
-0.1977069, -0.5727572, -4.489284, 0, 0, 0, 1, 1,
-0.1964936, -0.8321584, -3.101792, 0, 0, 0, 1, 1,
-0.195104, -1.889311, -0.3346134, 0, 0, 0, 1, 1,
-0.1940614, 1.110941, 0.8121495, 0, 0, 0, 1, 1,
-0.1940592, -0.7305569, -1.758691, 0, 0, 0, 1, 1,
-0.1920882, 0.8792345, 1.552427, 1, 1, 1, 1, 1,
-0.186838, -2.477438, -2.596798, 1, 1, 1, 1, 1,
-0.1866242, -0.2109987, -1.893883, 1, 1, 1, 1, 1,
-0.1838944, -0.83892, -3.00962, 1, 1, 1, 1, 1,
-0.1781609, -0.6083037, -4.068579, 1, 1, 1, 1, 1,
-0.1772314, -0.6073475, -1.709836, 1, 1, 1, 1, 1,
-0.1753326, 1.100276, -0.6185129, 1, 1, 1, 1, 1,
-0.1733126, -1.50785, -3.009164, 1, 1, 1, 1, 1,
-0.1718578, 0.8015849, -0.3070246, 1, 1, 1, 1, 1,
-0.1709899, -1.503627, -1.159242, 1, 1, 1, 1, 1,
-0.1682658, 0.5425506, -1.959387, 1, 1, 1, 1, 1,
-0.1679646, 0.4112419, -0.4987374, 1, 1, 1, 1, 1,
-0.1668692, 1.002314, -1.155148, 1, 1, 1, 1, 1,
-0.1645737, -0.532564, -2.572665, 1, 1, 1, 1, 1,
-0.1624136, 0.2384608, -0.3849464, 1, 1, 1, 1, 1,
-0.1568712, 0.632222, -1.131999, 0, 0, 1, 1, 1,
-0.1526248, 1.41171, 0.30856, 1, 0, 0, 1, 1,
-0.1519943, 1.359532, -0.2058296, 1, 0, 0, 1, 1,
-0.1519569, 1.750255, 0.8080307, 1, 0, 0, 1, 1,
-0.1509084, -0.4077456, -2.750848, 1, 0, 0, 1, 1,
-0.1503765, -0.1046225, -3.808919, 1, 0, 0, 1, 1,
-0.147167, 1.944821, -1.726388, 0, 0, 0, 1, 1,
-0.1447094, -0.7808071, -2.544394, 0, 0, 0, 1, 1,
-0.1401146, -1.346901, -4.235076, 0, 0, 0, 1, 1,
-0.1395734, 1.369789, 1.522076, 0, 0, 0, 1, 1,
-0.1378087, -1.117178, -2.756089, 0, 0, 0, 1, 1,
-0.1366425, 0.3584774, -0.7740235, 0, 0, 0, 1, 1,
-0.1346529, -0.110736, -2.96218, 0, 0, 0, 1, 1,
-0.1289323, -1.514521, -2.487538, 1, 1, 1, 1, 1,
-0.1271757, -0.08292768, -3.85498, 1, 1, 1, 1, 1,
-0.1266956, -1.011443, -4.115937, 1, 1, 1, 1, 1,
-0.1264411, -0.7768273, -4.41994, 1, 1, 1, 1, 1,
-0.1188955, 0.408035, -0.8281532, 1, 1, 1, 1, 1,
-0.1158698, 0.1911114, -1.351516, 1, 1, 1, 1, 1,
-0.1153375, -0.7917246, -3.246068, 1, 1, 1, 1, 1,
-0.1100096, 0.3821642, -0.3125704, 1, 1, 1, 1, 1,
-0.1094532, 0.893338, 0.005986386, 1, 1, 1, 1, 1,
-0.1093155, 1.026386, 0.1128082, 1, 1, 1, 1, 1,
-0.1071428, 1.062781, -1.151944, 1, 1, 1, 1, 1,
-0.1061536, 0.5608983, 1.244601, 1, 1, 1, 1, 1,
-0.1060139, 0.4664674, -1.170229, 1, 1, 1, 1, 1,
-0.1045259, 0.2876689, 0.08436789, 1, 1, 1, 1, 1,
-0.1028831, -0.4652449, -3.365059, 1, 1, 1, 1, 1,
-0.102738, 0.4575923, -0.2185581, 0, 0, 1, 1, 1,
-0.1008802, -0.675976, -1.66152, 1, 0, 0, 1, 1,
-0.1006861, 1.024298, 1.474597, 1, 0, 0, 1, 1,
-0.09538671, 0.435068, 0.4990348, 1, 0, 0, 1, 1,
-0.09324419, 1.261444, 0.3892588, 1, 0, 0, 1, 1,
-0.09240603, -0.1922752, -1.617917, 1, 0, 0, 1, 1,
-0.0911002, -0.5466408, -1.653639, 0, 0, 0, 1, 1,
-0.09098098, 1.189492, 0.3634417, 0, 0, 0, 1, 1,
-0.09047452, -0.3264418, -2.065419, 0, 0, 0, 1, 1,
-0.09003772, 0.4824557, -0.7432002, 0, 0, 0, 1, 1,
-0.08798175, 1.431234, 0.9065911, 0, 0, 0, 1, 1,
-0.08795061, -0.9849648, -3.68559, 0, 0, 0, 1, 1,
-0.08691193, -0.7101631, -4.071222, 0, 0, 0, 1, 1,
-0.08576281, -0.4991803, -1.805816, 1, 1, 1, 1, 1,
-0.08389722, -2.025804, -3.032206, 1, 1, 1, 1, 1,
-0.08164102, -1.032009, -4.296071, 1, 1, 1, 1, 1,
-0.08040024, 1.965178, -0.333817, 1, 1, 1, 1, 1,
-0.07807051, 0.1004179, -0.352261, 1, 1, 1, 1, 1,
-0.07623416, -0.5298243, -1.95466, 1, 1, 1, 1, 1,
-0.06498658, 0.2917898, 0.2983928, 1, 1, 1, 1, 1,
-0.06289612, 2.72611, -0.3947111, 1, 1, 1, 1, 1,
-0.05981813, -1.585688, -3.742043, 1, 1, 1, 1, 1,
-0.05964044, -0.4164887, -3.628609, 1, 1, 1, 1, 1,
-0.05883766, -1.716077, -3.404499, 1, 1, 1, 1, 1,
-0.05549639, -0.1186529, -5.846137, 1, 1, 1, 1, 1,
-0.05524842, 0.3757589, 0.605446, 1, 1, 1, 1, 1,
-0.05091426, 0.3855503, -0.3832327, 1, 1, 1, 1, 1,
-0.05009443, -0.1058475, -3.621363, 1, 1, 1, 1, 1,
-0.04281065, 0.8931715, -0.4606972, 0, 0, 1, 1, 1,
-0.03998948, 0.3005816, 0.004027276, 1, 0, 0, 1, 1,
-0.03607977, 0.5659673, 0.2382091, 1, 0, 0, 1, 1,
-0.03325589, -0.2973222, -3.423509, 1, 0, 0, 1, 1,
-0.0314454, -0.4867587, -4.076731, 1, 0, 0, 1, 1,
-0.02629201, 0.9745176, 0.4634762, 1, 0, 0, 1, 1,
-0.02108279, -0.5203, -2.915321, 0, 0, 0, 1, 1,
-0.02036538, 0.4178916, 0.3745909, 0, 0, 0, 1, 1,
-0.01503163, 0.06461115, 0.3963767, 0, 0, 0, 1, 1,
-0.01124978, 1.338001, -0.5359108, 0, 0, 0, 1, 1,
-0.008159799, -0.1417994, -1.50119, 0, 0, 0, 1, 1,
-0.007058545, 0.4347869, 1.56425, 0, 0, 0, 1, 1,
-0.006873933, -0.2290579, -3.418524, 0, 0, 0, 1, 1,
-0.005972747, 2.438526, 3.292199, 1, 1, 1, 1, 1,
-0.005526513, 0.04867966, -1.605808, 1, 1, 1, 1, 1,
-0.004132123, 1.898908, 0.4852342, 1, 1, 1, 1, 1,
-0.00362744, 0.8607963, 0.5057486, 1, 1, 1, 1, 1,
-0.002637333, -1.618061, -3.054119, 1, 1, 1, 1, 1,
-0.0008808472, -1.441411, -5.162373, 1, 1, 1, 1, 1,
0.001210591, -0.8362091, 3.001708, 1, 1, 1, 1, 1,
0.003721386, -0.355131, 4.170524, 1, 1, 1, 1, 1,
0.009182828, 0.4534974, 2.135739, 1, 1, 1, 1, 1,
0.00948063, -0.4337323, 3.671847, 1, 1, 1, 1, 1,
0.0133085, 0.007043772, 0.6139885, 1, 1, 1, 1, 1,
0.01360465, 1.126217, 0.7812291, 1, 1, 1, 1, 1,
0.0172457, 1.245951, 0.08086869, 1, 1, 1, 1, 1,
0.02461964, 0.429244, 0.4653156, 1, 1, 1, 1, 1,
0.02609852, -0.5535795, 3.263998, 1, 1, 1, 1, 1,
0.02642727, 0.07399672, -0.8430823, 0, 0, 1, 1, 1,
0.02659328, 0.7350309, 1.661845, 1, 0, 0, 1, 1,
0.02931056, -0.8096893, 3.037974, 1, 0, 0, 1, 1,
0.03409136, -2.013231, 3.103081, 1, 0, 0, 1, 1,
0.03543016, -0.3929662, 3.095426, 1, 0, 0, 1, 1,
0.03577508, 0.6708885, -1.293013, 1, 0, 0, 1, 1,
0.04008256, -0.7222182, 4.822296, 0, 0, 0, 1, 1,
0.04682883, 1.818631, -0.9794595, 0, 0, 0, 1, 1,
0.04921208, 0.1586328, -0.5003908, 0, 0, 0, 1, 1,
0.04981077, -0.4404315, 1.293329, 0, 0, 0, 1, 1,
0.054749, 0.6735927, -0.7630199, 0, 0, 0, 1, 1,
0.05498794, -0.7270027, 4.435949, 0, 0, 0, 1, 1,
0.05651474, -0.3724579, 3.559557, 0, 0, 0, 1, 1,
0.06310106, 0.1339789, 0.5114362, 1, 1, 1, 1, 1,
0.06449313, -0.4480529, 2.773268, 1, 1, 1, 1, 1,
0.07002249, -0.6406935, 4.565945, 1, 1, 1, 1, 1,
0.07079303, 0.8172922, 2.527338, 1, 1, 1, 1, 1,
0.07359453, 1.29553, 0.7523733, 1, 1, 1, 1, 1,
0.07407413, -0.4711061, 2.588076, 1, 1, 1, 1, 1,
0.07469824, 1.618476, -0.6834139, 1, 1, 1, 1, 1,
0.07471249, -0.3543666, 2.987879, 1, 1, 1, 1, 1,
0.07719323, 0.5286826, -0.2388901, 1, 1, 1, 1, 1,
0.07774597, 0.965833, 1.116245, 1, 1, 1, 1, 1,
0.07976495, -0.3261983, 3.202861, 1, 1, 1, 1, 1,
0.0806034, -0.7928745, 3.008003, 1, 1, 1, 1, 1,
0.08064292, 0.1198828, -0.07768726, 1, 1, 1, 1, 1,
0.08294234, -0.8917797, 2.456343, 1, 1, 1, 1, 1,
0.08500704, -2.095894, 3.03999, 1, 1, 1, 1, 1,
0.09045927, 0.6023022, 1.239016, 0, 0, 1, 1, 1,
0.09117927, -0.2378277, 1.699766, 1, 0, 0, 1, 1,
0.09128882, 0.09333177, 0.8442149, 1, 0, 0, 1, 1,
0.09288981, 0.5087326, -0.3008572, 1, 0, 0, 1, 1,
0.09427956, -0.7349808, 4.094231, 1, 0, 0, 1, 1,
0.09457234, -0.2138007, 3.569869, 1, 0, 0, 1, 1,
0.09796167, 1.701194, -0.4182263, 0, 0, 0, 1, 1,
0.09980929, 0.4011946, 1.535552, 0, 0, 0, 1, 1,
0.1027052, -0.2062522, 2.052044, 0, 0, 0, 1, 1,
0.1036206, -0.6853636, 2.501665, 0, 0, 0, 1, 1,
0.1039828, 0.0578942, 0.6347909, 0, 0, 0, 1, 1,
0.1052422, 0.6793408, -1.693929, 0, 0, 0, 1, 1,
0.1057551, 2.261273, -1.088678, 0, 0, 0, 1, 1,
0.1063829, 1.040449, 0.4197795, 1, 1, 1, 1, 1,
0.1069494, -0.9864969, 4.265957, 1, 1, 1, 1, 1,
0.1104394, -0.3308007, 3.181316, 1, 1, 1, 1, 1,
0.111808, -0.1135988, 3.440121, 1, 1, 1, 1, 1,
0.1171318, -0.1775551, 0.8486907, 1, 1, 1, 1, 1,
0.1199398, -0.2742115, 2.52415, 1, 1, 1, 1, 1,
0.120072, -0.8667513, 2.717751, 1, 1, 1, 1, 1,
0.120213, -0.3978088, 2.034591, 1, 1, 1, 1, 1,
0.1215888, 0.4106983, -0.2916577, 1, 1, 1, 1, 1,
0.1218296, -0.04652538, 2.109655, 1, 1, 1, 1, 1,
0.1231499, -0.3430009, 1.729409, 1, 1, 1, 1, 1,
0.1244776, -2.202747, 2.680686, 1, 1, 1, 1, 1,
0.1256794, -0.1672993, 1.16623, 1, 1, 1, 1, 1,
0.1275582, -0.3518785, 1.941186, 1, 1, 1, 1, 1,
0.127726, 0.2675017, 0.8840685, 1, 1, 1, 1, 1,
0.1303968, -1.016791, 3.733076, 0, 0, 1, 1, 1,
0.1313404, -0.3350524, 3.759323, 1, 0, 0, 1, 1,
0.1349525, 0.1859499, -0.3503596, 1, 0, 0, 1, 1,
0.1351908, -0.2458181, 1.293966, 1, 0, 0, 1, 1,
0.1373145, 1.140459, -0.05891657, 1, 0, 0, 1, 1,
0.1408055, 0.03688018, 0.6802608, 1, 0, 0, 1, 1,
0.142502, 0.2571041, 2.004249, 0, 0, 0, 1, 1,
0.1450259, -1.2132, 3.2888, 0, 0, 0, 1, 1,
0.145575, 0.6632927, -0.7087615, 0, 0, 0, 1, 1,
0.1484371, 0.5190325, -0.3145191, 0, 0, 0, 1, 1,
0.1490264, -0.9474741, 3.663363, 0, 0, 0, 1, 1,
0.1490647, -0.650789, 3.762198, 0, 0, 0, 1, 1,
0.1520312, -0.3570707, 2.68097, 0, 0, 0, 1, 1,
0.1550223, -0.6967857, 1.361709, 1, 1, 1, 1, 1,
0.1568149, 1.311469, 0.876749, 1, 1, 1, 1, 1,
0.158835, 0.07552096, 1.073142, 1, 1, 1, 1, 1,
0.1648553, 0.5150132, 0.3493102, 1, 1, 1, 1, 1,
0.1668968, 0.8209495, 2.368084, 1, 1, 1, 1, 1,
0.1708488, -1.050247, 1.590927, 1, 1, 1, 1, 1,
0.1717714, 0.8846085, -2.051622, 1, 1, 1, 1, 1,
0.1725059, -1.395246, 2.556327, 1, 1, 1, 1, 1,
0.1739689, 0.459592, 0.7878916, 1, 1, 1, 1, 1,
0.1752139, 1.19839, 1.855634, 1, 1, 1, 1, 1,
0.1771573, -0.8878973, 2.730905, 1, 1, 1, 1, 1,
0.1785513, -2.327317, 2.722228, 1, 1, 1, 1, 1,
0.1797302, 0.8473135, -0.1378214, 1, 1, 1, 1, 1,
0.1826479, -0.3249563, 2.957077, 1, 1, 1, 1, 1,
0.1863222, -1.020624, 2.641693, 1, 1, 1, 1, 1,
0.1867974, 1.112677, 1.668213, 0, 0, 1, 1, 1,
0.1894099, 0.5243686, 0.7352139, 1, 0, 0, 1, 1,
0.1961116, -0.3792762, 3.043063, 1, 0, 0, 1, 1,
0.20215, 0.7744018, 1.316218, 1, 0, 0, 1, 1,
0.2089981, 0.8659633, -0.2995628, 1, 0, 0, 1, 1,
0.2181286, -0.1821689, 1.007889, 1, 0, 0, 1, 1,
0.236038, 0.1546372, 1.96631, 0, 0, 0, 1, 1,
0.2377556, 0.3245723, 0.5632319, 0, 0, 0, 1, 1,
0.2394898, -1.7949, 2.232793, 0, 0, 0, 1, 1,
0.2467882, 1.579888, -0.0177905, 0, 0, 0, 1, 1,
0.247142, 1.154856, 0.2823387, 0, 0, 0, 1, 1,
0.2494965, 0.6818237, -0.07868946, 0, 0, 0, 1, 1,
0.2501971, 0.5669613, -0.220082, 0, 0, 0, 1, 1,
0.2534077, 0.02985506, -0.4065659, 1, 1, 1, 1, 1,
0.2592834, 0.2143002, 2.665322, 1, 1, 1, 1, 1,
0.2605556, -0.06006334, 2.191039, 1, 1, 1, 1, 1,
0.265654, -0.4919005, 4.752487, 1, 1, 1, 1, 1,
0.2668513, -1.157342, 2.075111, 1, 1, 1, 1, 1,
0.2671153, 0.9255909, 0.7374072, 1, 1, 1, 1, 1,
0.2671763, 0.05757644, 2.797475, 1, 1, 1, 1, 1,
0.2751386, 2.508833, -1.03336, 1, 1, 1, 1, 1,
0.2757716, -0.0804326, 1.120639, 1, 1, 1, 1, 1,
0.2760922, 0.6002219, 0.7029303, 1, 1, 1, 1, 1,
0.276856, 0.3601055, -0.6346053, 1, 1, 1, 1, 1,
0.2795288, 1.05042, -1.100504, 1, 1, 1, 1, 1,
0.2804949, -0.199186, 1.266943, 1, 1, 1, 1, 1,
0.2827186, 0.1680234, 2.216961, 1, 1, 1, 1, 1,
0.283, -0.8092261, 2.29015, 1, 1, 1, 1, 1,
0.2836387, -0.1652667, 1.909156, 0, 0, 1, 1, 1,
0.2837017, 0.1692162, 1.585676, 1, 0, 0, 1, 1,
0.2852613, 1.029805, -0.3254011, 1, 0, 0, 1, 1,
0.2892538, 0.529601, -0.7852132, 1, 0, 0, 1, 1,
0.2960112, -1.666753, 2.11425, 1, 0, 0, 1, 1,
0.2996629, -0.5128054, 3.925999, 1, 0, 0, 1, 1,
0.3022321, 0.02491907, 1.54243, 0, 0, 0, 1, 1,
0.3026744, -0.4505981, 2.572693, 0, 0, 0, 1, 1,
0.3040246, -0.61865, 4.861328, 0, 0, 0, 1, 1,
0.3040357, -0.3940822, 2.78011, 0, 0, 0, 1, 1,
0.3052433, -1.065864, 4.440553, 0, 0, 0, 1, 1,
0.3093031, -0.2216653, 5.059093, 0, 0, 0, 1, 1,
0.3110932, 0.6508769, -0.9478368, 0, 0, 0, 1, 1,
0.3152549, 1.382095, 0.8649998, 1, 1, 1, 1, 1,
0.3155803, -0.9928668, 3.317274, 1, 1, 1, 1, 1,
0.3158165, -0.3880084, 1.256873, 1, 1, 1, 1, 1,
0.3168742, -0.5783466, 1.521538, 1, 1, 1, 1, 1,
0.3178971, -0.2516204, 2.168821, 1, 1, 1, 1, 1,
0.3192081, -0.07982659, 1.552409, 1, 1, 1, 1, 1,
0.3204178, -0.2288564, 1.217053, 1, 1, 1, 1, 1,
0.3224061, 0.5928833, 2.031341, 1, 1, 1, 1, 1,
0.324486, 0.4397201, 0.7636611, 1, 1, 1, 1, 1,
0.3250821, -0.05332411, 2.941219, 1, 1, 1, 1, 1,
0.325097, -1.450237, 3.797513, 1, 1, 1, 1, 1,
0.3256214, 0.7457586, -1.767746, 1, 1, 1, 1, 1,
0.3261311, -2.368432, 2.035137, 1, 1, 1, 1, 1,
0.3262349, -0.9287406, 1.310417, 1, 1, 1, 1, 1,
0.3326955, 0.175136, 3.561413, 1, 1, 1, 1, 1,
0.335944, 0.2290003, 2.990139, 0, 0, 1, 1, 1,
0.3371725, -1.375575, 2.729325, 1, 0, 0, 1, 1,
0.3492459, 0.9690383, -0.08926722, 1, 0, 0, 1, 1,
0.3546692, -0.6763343, 3.140058, 1, 0, 0, 1, 1,
0.3647629, 0.6930385, -0.5019389, 1, 0, 0, 1, 1,
0.368489, 0.1138711, 0.4439663, 1, 0, 0, 1, 1,
0.3717737, 0.2996749, 1.388486, 0, 0, 0, 1, 1,
0.3764891, -0.1334617, 2.422704, 0, 0, 0, 1, 1,
0.3772447, 1.09756, 0.6461344, 0, 0, 0, 1, 1,
0.3776096, 0.2652263, 0.9087782, 0, 0, 0, 1, 1,
0.3782701, -0.8725368, 2.855796, 0, 0, 0, 1, 1,
0.3795303, -0.8359559, 2.6685, 0, 0, 0, 1, 1,
0.380661, -1.093948, 0.9739097, 0, 0, 0, 1, 1,
0.3813048, 1.636624, 0.1545937, 1, 1, 1, 1, 1,
0.3901301, -2.770468, 3.843299, 1, 1, 1, 1, 1,
0.39823, 0.4370145, 2.717079, 1, 1, 1, 1, 1,
0.4053075, 0.1917185, -0.1587924, 1, 1, 1, 1, 1,
0.409439, 0.2029519, 1.462525, 1, 1, 1, 1, 1,
0.4104232, 0.9453542, 1.131406, 1, 1, 1, 1, 1,
0.4126412, -1.742253, 2.742158, 1, 1, 1, 1, 1,
0.4190584, 0.9048711, -0.4056399, 1, 1, 1, 1, 1,
0.4218589, 0.8804948, -0.1673621, 1, 1, 1, 1, 1,
0.4257816, -0.6806488, 3.482881, 1, 1, 1, 1, 1,
0.4271669, 0.3461833, 1.260904, 1, 1, 1, 1, 1,
0.4291528, -1.176816, 3.641288, 1, 1, 1, 1, 1,
0.4317202, 0.05837068, 2.723211, 1, 1, 1, 1, 1,
0.4320927, 0.8988105, 1.173599, 1, 1, 1, 1, 1,
0.4321645, 0.1992425, 3.37688, 1, 1, 1, 1, 1,
0.4362938, -2.444253, 2.144482, 0, 0, 1, 1, 1,
0.4369234, -2.682976, 2.309131, 1, 0, 0, 1, 1,
0.4374378, 0.7219539, -0.2968335, 1, 0, 0, 1, 1,
0.4556115, 0.0544546, 0.8716967, 1, 0, 0, 1, 1,
0.4598764, -1.830513, 1.643826, 1, 0, 0, 1, 1,
0.4609251, 0.7547169, -1.926832, 1, 0, 0, 1, 1,
0.4645162, -2.293629, 3.43676, 0, 0, 0, 1, 1,
0.4687002, -1.008423, 4.360137, 0, 0, 0, 1, 1,
0.4734081, -1.484869, 4.184899, 0, 0, 0, 1, 1,
0.4734657, 0.8014609, 0.233283, 0, 0, 0, 1, 1,
0.4758295, -0.1081541, 2.301695, 0, 0, 0, 1, 1,
0.4787377, 0.001912614, 1.569066, 0, 0, 0, 1, 1,
0.4836519, -1.769587, 2.469678, 0, 0, 0, 1, 1,
0.4857624, -0.3631007, 4.708171, 1, 1, 1, 1, 1,
0.48587, -0.4441937, 3.570973, 1, 1, 1, 1, 1,
0.4868717, -0.9436024, 1.593653, 1, 1, 1, 1, 1,
0.487917, -0.4936162, 1.612406, 1, 1, 1, 1, 1,
0.4909877, -1.543145, 3.008846, 1, 1, 1, 1, 1,
0.4920801, -0.3750796, 1.653316, 1, 1, 1, 1, 1,
0.4976629, 1.906502, 0.320779, 1, 1, 1, 1, 1,
0.5124918, 0.987348, 1.194885, 1, 1, 1, 1, 1,
0.5149878, -2.094485, 1.314172, 1, 1, 1, 1, 1,
0.5184844, 0.7084389, 0.6051703, 1, 1, 1, 1, 1,
0.5258759, 0.922456, -0.883262, 1, 1, 1, 1, 1,
0.5263655, -0.108669, 3.003094, 1, 1, 1, 1, 1,
0.5324627, -0.202885, 2.47942, 1, 1, 1, 1, 1,
0.537093, 1.462081, 1.158199, 1, 1, 1, 1, 1,
0.544739, -0.3406014, 3.299443, 1, 1, 1, 1, 1,
0.5489686, 2.449044, -0.9214074, 0, 0, 1, 1, 1,
0.5540043, 1.68658, -1.006689, 1, 0, 0, 1, 1,
0.5568615, -0.5553665, 1.435425, 1, 0, 0, 1, 1,
0.5609728, -0.6785756, 3.285182, 1, 0, 0, 1, 1,
0.5616769, 0.1404314, 1.165472, 1, 0, 0, 1, 1,
0.563307, -0.9020267, 3.491584, 1, 0, 0, 1, 1,
0.563383, 1.36556, 2.933211, 0, 0, 0, 1, 1,
0.5691642, 1.060413, -1.381353, 0, 0, 0, 1, 1,
0.5717581, 0.9089803, -0.5391353, 0, 0, 0, 1, 1,
0.5751964, -1.475992, 2.475181, 0, 0, 0, 1, 1,
0.5761271, -0.7804608, 5.118913, 0, 0, 0, 1, 1,
0.5783313, 1.466632, -0.6370167, 0, 0, 0, 1, 1,
0.5812582, -0.1034563, 2.704911, 0, 0, 0, 1, 1,
0.5863026, -0.4118402, 1.150765, 1, 1, 1, 1, 1,
0.5921503, -0.8020369, 2.941465, 1, 1, 1, 1, 1,
0.5922742, 0.5431383, 0.2096128, 1, 1, 1, 1, 1,
0.5968743, -0.7534856, 1.306147, 1, 1, 1, 1, 1,
0.5981103, -0.475951, 3.326076, 1, 1, 1, 1, 1,
0.6037803, 1.408845, 1.439432, 1, 1, 1, 1, 1,
0.6189132, 0.6661192, 0.005206726, 1, 1, 1, 1, 1,
0.6205394, 0.3829316, 0.7706612, 1, 1, 1, 1, 1,
0.6248403, -1.714473, 4.017716, 1, 1, 1, 1, 1,
0.6304615, -0.08853672, 1.384237, 1, 1, 1, 1, 1,
0.6317401, -0.9460899, 3.038366, 1, 1, 1, 1, 1,
0.6365125, 2.388112, -0.4962782, 1, 1, 1, 1, 1,
0.640736, 1.598622, -0.7041108, 1, 1, 1, 1, 1,
0.6460619, -1.020004, 2.751739, 1, 1, 1, 1, 1,
0.6570742, 0.9647558, 2.424725, 1, 1, 1, 1, 1,
0.6571087, 1.073786, 1.395378, 0, 0, 1, 1, 1,
0.6579609, 0.4967934, 0.4650546, 1, 0, 0, 1, 1,
0.6605902, -1.827412, 2.523613, 1, 0, 0, 1, 1,
0.664193, -0.8898497, 2.413129, 1, 0, 0, 1, 1,
0.664521, -0.1161277, 1.362663, 1, 0, 0, 1, 1,
0.6662454, -0.1426772, 3.929078, 1, 0, 0, 1, 1,
0.667579, 2.114172, 0.1045825, 0, 0, 0, 1, 1,
0.6714512, -1.187543, 2.966897, 0, 0, 0, 1, 1,
0.673906, -0.5790915, 1.977815, 0, 0, 0, 1, 1,
0.6750739, 0.1628464, 2.890696, 0, 0, 0, 1, 1,
0.6757883, 0.2652824, 1.976971, 0, 0, 0, 1, 1,
0.6777981, -0.4678201, 2.710115, 0, 0, 0, 1, 1,
0.6794531, 1.014209, 0.08401339, 0, 0, 0, 1, 1,
0.6946688, -0.9269666, 3.238861, 1, 1, 1, 1, 1,
0.6965979, 2.493762, 0.2533752, 1, 1, 1, 1, 1,
0.7023575, -1.753324, 1.910007, 1, 1, 1, 1, 1,
0.7036706, -0.1194014, 1.902956, 1, 1, 1, 1, 1,
0.7043042, 0.1687981, 1.137907, 1, 1, 1, 1, 1,
0.7059255, 0.002097959, 0.3685215, 1, 1, 1, 1, 1,
0.7167388, 0.4329332, 0.9464455, 1, 1, 1, 1, 1,
0.7173365, 0.8361065, 0.4573756, 1, 1, 1, 1, 1,
0.7249824, 0.3589854, 1.22494, 1, 1, 1, 1, 1,
0.7302267, -1.352506, 0.4299996, 1, 1, 1, 1, 1,
0.7319549, 1.087119, -0.3899896, 1, 1, 1, 1, 1,
0.7425585, 1.289649, 0.398197, 1, 1, 1, 1, 1,
0.7450603, -0.1507447, 1.941028, 1, 1, 1, 1, 1,
0.7462721, 1.948459, -0.1758554, 1, 1, 1, 1, 1,
0.7491514, -1.792095, 2.099118, 1, 1, 1, 1, 1,
0.7576964, 0.7344133, 3.18857, 0, 0, 1, 1, 1,
0.7619691, 1.389565, 1.906305, 1, 0, 0, 1, 1,
0.7646374, 0.06398095, 0.2512964, 1, 0, 0, 1, 1,
0.7712168, -0.07213394, 0.2863498, 1, 0, 0, 1, 1,
0.777379, -0.1303674, 0.03372476, 1, 0, 0, 1, 1,
0.7803493, -0.3831853, 2.783993, 1, 0, 0, 1, 1,
0.7809178, 0.1120485, 1.277048, 0, 0, 0, 1, 1,
0.7849756, 1.549029, 3.171948, 0, 0, 0, 1, 1,
0.7859729, 0.7278912, 0.1540611, 0, 0, 0, 1, 1,
0.7862732, -0.6133751, 1.586371, 0, 0, 0, 1, 1,
0.7866198, -0.7648597, 0.8904489, 0, 0, 0, 1, 1,
0.7871667, 0.06859044, 3.447339, 0, 0, 0, 1, 1,
0.7962297, -1.138818, 2.81209, 0, 0, 0, 1, 1,
0.7964357, 0.5027034, 2.165783, 1, 1, 1, 1, 1,
0.7975814, -1.476892, 1.788535, 1, 1, 1, 1, 1,
0.8015663, 1.298161, 1.742864, 1, 1, 1, 1, 1,
0.8018451, -0.358711, 1.492737, 1, 1, 1, 1, 1,
0.8019965, -0.5330284, 1.004542, 1, 1, 1, 1, 1,
0.8045954, 0.1311448, 2.358551, 1, 1, 1, 1, 1,
0.8092493, 1.213035, -0.2828287, 1, 1, 1, 1, 1,
0.8126879, -0.07888714, 1.597088, 1, 1, 1, 1, 1,
0.8135455, 1.907314, 1.064849, 1, 1, 1, 1, 1,
0.813769, -0.3061641, 0.06874739, 1, 1, 1, 1, 1,
0.818521, -1.800617, 3.24656, 1, 1, 1, 1, 1,
0.8216862, 0.8326912, 1.271365, 1, 1, 1, 1, 1,
0.8289599, 0.7532799, -0.04203917, 1, 1, 1, 1, 1,
0.8302538, 1.894881, -1.273056, 1, 1, 1, 1, 1,
0.8331056, -0.653209, 1.200785, 1, 1, 1, 1, 1,
0.8382614, 2.977472, -1.053068, 0, 0, 1, 1, 1,
0.8401318, 0.01222498, 2.678112, 1, 0, 0, 1, 1,
0.8463828, 0.1567962, 0.8649869, 1, 0, 0, 1, 1,
0.8469009, 2.283154, 1.328753, 1, 0, 0, 1, 1,
0.8477296, -1.678961, 2.960451, 1, 0, 0, 1, 1,
0.8550472, 0.7111619, 0.5158404, 1, 0, 0, 1, 1,
0.858943, -0.472272, 2.69462, 0, 0, 0, 1, 1,
0.862954, -0.5738497, 1.644224, 0, 0, 0, 1, 1,
0.8643735, 2.391452, 0.9385907, 0, 0, 0, 1, 1,
0.8661741, -0.3324093, 0.8869363, 0, 0, 0, 1, 1,
0.8738289, 0.5714467, 0.6766497, 0, 0, 0, 1, 1,
0.8800339, 0.5418643, 1.945973, 0, 0, 0, 1, 1,
0.8832816, 0.3362722, 2.166517, 0, 0, 0, 1, 1,
0.8843063, 1.125978, 0.4995901, 1, 1, 1, 1, 1,
0.8857325, 0.9806346, 1.285853, 1, 1, 1, 1, 1,
0.8885513, -0.7496034, 3.007, 1, 1, 1, 1, 1,
0.8891575, -0.174795, 1.090266, 1, 1, 1, 1, 1,
0.8950412, -0.3459975, 1.520762, 1, 1, 1, 1, 1,
0.9043627, -2.102149, 2.972605, 1, 1, 1, 1, 1,
0.9114068, 1.096209, 0.8148472, 1, 1, 1, 1, 1,
0.9167696, -1.420134, 1.615996, 1, 1, 1, 1, 1,
0.9198405, 0.1175982, 2.220942, 1, 1, 1, 1, 1,
0.9223593, -0.5954872, 2.319009, 1, 1, 1, 1, 1,
0.9295789, -2.094938, 4.755178, 1, 1, 1, 1, 1,
0.9341998, -0.7445433, 0.7844253, 1, 1, 1, 1, 1,
0.9393751, -0.005520267, 2.859166, 1, 1, 1, 1, 1,
0.9524792, -0.08162069, 2.736803, 1, 1, 1, 1, 1,
0.954512, 1.623526, 1.072206, 1, 1, 1, 1, 1,
0.9564055, 1.439311, 1.295401, 0, 0, 1, 1, 1,
0.9638183, 0.8210968, 1.410004, 1, 0, 0, 1, 1,
0.970232, 1.950404, 0.7480419, 1, 0, 0, 1, 1,
0.9814701, 0.4582585, 0.6988373, 1, 0, 0, 1, 1,
0.9838586, -0.8326264, 2.229112, 1, 0, 0, 1, 1,
0.9892356, -0.8008207, 3.279979, 1, 0, 0, 1, 1,
0.9941736, -0.1886404, 2.019683, 0, 0, 0, 1, 1,
0.9945935, -0.7559013, 1.710619, 0, 0, 0, 1, 1,
1.00218, 0.04887731, -1.420645, 0, 0, 0, 1, 1,
1.003523, 0.2935872, 0.8742365, 0, 0, 0, 1, 1,
1.006281, -0.4321504, 1.678389, 0, 0, 0, 1, 1,
1.026374, 0.05164972, 1.953164, 0, 0, 0, 1, 1,
1.038834, 0.767715, 0.6925191, 0, 0, 0, 1, 1,
1.039657, -0.9226303, 3.388831, 1, 1, 1, 1, 1,
1.040935, 1.222336, 0.4875407, 1, 1, 1, 1, 1,
1.046668, -1.798199, 2.629528, 1, 1, 1, 1, 1,
1.049492, -0.7275483, 3.642742, 1, 1, 1, 1, 1,
1.052052, -0.06328428, 1.911157, 1, 1, 1, 1, 1,
1.055602, 0.984064, 0.5728042, 1, 1, 1, 1, 1,
1.059357, -0.8887779, 0.1781383, 1, 1, 1, 1, 1,
1.063107, 1.272298, 0.4000787, 1, 1, 1, 1, 1,
1.065371, 0.4453864, 1.343367, 1, 1, 1, 1, 1,
1.074264, -0.2774761, 1.86069, 1, 1, 1, 1, 1,
1.07475, 0.7436626, -0.09837203, 1, 1, 1, 1, 1,
1.082646, -1.515289, 0.7795279, 1, 1, 1, 1, 1,
1.089076, -1.794663, 1.853846, 1, 1, 1, 1, 1,
1.089731, -0.7131381, 1.811407, 1, 1, 1, 1, 1,
1.098557, -0.2834973, 1.071645, 1, 1, 1, 1, 1,
1.099176, -0.02011348, 1.766826, 0, 0, 1, 1, 1,
1.103305, -1.955858, 1.841745, 1, 0, 0, 1, 1,
1.106737, 0.4576677, 1.191138, 1, 0, 0, 1, 1,
1.109445, 0.9039546, 2.661207, 1, 0, 0, 1, 1,
1.120077, 1.860282, 0.1259111, 1, 0, 0, 1, 1,
1.120431, -1.503585, 2.675116, 1, 0, 0, 1, 1,
1.131429, -0.04770753, 1.067767, 0, 0, 0, 1, 1,
1.143926, 0.6782399, 1.812107, 0, 0, 0, 1, 1,
1.147301, -2.501621, 1.942363, 0, 0, 0, 1, 1,
1.149366, 1.00061, 2.181041, 0, 0, 0, 1, 1,
1.171325, -0.9421192, 2.339395, 0, 0, 0, 1, 1,
1.178303, 1.088878, 0.1133642, 0, 0, 0, 1, 1,
1.179899, -2.729385, 3.097576, 0, 0, 0, 1, 1,
1.18306, -0.1977848, 0.6486909, 1, 1, 1, 1, 1,
1.184868, 0.5388524, 1.290317, 1, 1, 1, 1, 1,
1.186589, 0.1254939, 1.664281, 1, 1, 1, 1, 1,
1.197412, -0.2686761, 2.394428, 1, 1, 1, 1, 1,
1.203296, 0.3578345, 1.174584, 1, 1, 1, 1, 1,
1.205444, -0.2049887, 1.351009, 1, 1, 1, 1, 1,
1.210634, -0.2044933, 1.814356, 1, 1, 1, 1, 1,
1.211354, -0.8688105, 1.519472, 1, 1, 1, 1, 1,
1.217758, -1.668582, 4.051128, 1, 1, 1, 1, 1,
1.221157, 1.504396, 1.86945, 1, 1, 1, 1, 1,
1.227965, -1.617162, 1.970962, 1, 1, 1, 1, 1,
1.231145, -1.628653, 3.751242, 1, 1, 1, 1, 1,
1.234566, 0.5524113, -0.5903069, 1, 1, 1, 1, 1,
1.239226, -1.268645, 1.60386, 1, 1, 1, 1, 1,
1.248338, -1.167209, 1.425295, 1, 1, 1, 1, 1,
1.260713, -0.1701829, -0.05275993, 0, 0, 1, 1, 1,
1.265656, 0.7467125, -0.5388668, 1, 0, 0, 1, 1,
1.274714, -0.6793332, 1.68446, 1, 0, 0, 1, 1,
1.292024, 1.005373, 0.2961011, 1, 0, 0, 1, 1,
1.293195, 0.7590159, 1.993165, 1, 0, 0, 1, 1,
1.295347, -0.1476522, 1.081972, 1, 0, 0, 1, 1,
1.318024, -0.06083252, 1.867152, 0, 0, 0, 1, 1,
1.322001, 0.5506766, 2.104042, 0, 0, 0, 1, 1,
1.324727, 0.7157112, -0.106537, 0, 0, 0, 1, 1,
1.327991, 0.2135194, 1.648684, 0, 0, 0, 1, 1,
1.330438, -0.9475986, 3.491294, 0, 0, 0, 1, 1,
1.33551, -0.1139589, 2.340954, 0, 0, 0, 1, 1,
1.337043, -0.1504496, 1.329729, 0, 0, 0, 1, 1,
1.347042, -0.1899341, 2.205759, 1, 1, 1, 1, 1,
1.349033, 0.1998719, 0.7443307, 1, 1, 1, 1, 1,
1.35949, -0.4064233, 2.03836, 1, 1, 1, 1, 1,
1.36641, -0.07944826, 2.527616, 1, 1, 1, 1, 1,
1.368366, -1.302874, 3.054907, 1, 1, 1, 1, 1,
1.369903, -0.8591623, 2.970847, 1, 1, 1, 1, 1,
1.374739, 0.4313938, 1.937755, 1, 1, 1, 1, 1,
1.382399, -1.823302, 2.666147, 1, 1, 1, 1, 1,
1.384168, -0.6425791, 2.557006, 1, 1, 1, 1, 1,
1.388464, 1.09469, -0.7152297, 1, 1, 1, 1, 1,
1.388803, 1.082127, 1.317712, 1, 1, 1, 1, 1,
1.391175, -0.02051124, 0.2884415, 1, 1, 1, 1, 1,
1.393995, -1.810765, 2.821136, 1, 1, 1, 1, 1,
1.397377, 1.50623, 2.691662, 1, 1, 1, 1, 1,
1.419762, -1.648974, 3.730521, 1, 1, 1, 1, 1,
1.425632, -0.1166543, 1.792091, 0, 0, 1, 1, 1,
1.432619, -0.4153882, 2.616392, 1, 0, 0, 1, 1,
1.434281, 0.06648784, 0.7439758, 1, 0, 0, 1, 1,
1.442309, 0.301546, 0.6180332, 1, 0, 0, 1, 1,
1.444822, 0.3881762, 2.311583, 1, 0, 0, 1, 1,
1.452814, 0.04762621, 2.096418, 1, 0, 0, 1, 1,
1.455069, -0.6456428, 1.723681, 0, 0, 0, 1, 1,
1.455999, -0.6629905, 2.972616, 0, 0, 0, 1, 1,
1.497184, -0.3892021, 0.5862564, 0, 0, 0, 1, 1,
1.505516, 0.4821362, 1.293407, 0, 0, 0, 1, 1,
1.507635, 1.582331, 1.77181, 0, 0, 0, 1, 1,
1.518338, -0.6296135, 3.871488, 0, 0, 0, 1, 1,
1.524435, 0.8283134, 1.446663, 0, 0, 0, 1, 1,
1.525788, 1.199314, 2.648384, 1, 1, 1, 1, 1,
1.526204, -0.1852845, 0.2147342, 1, 1, 1, 1, 1,
1.531939, 0.003371724, 1.850203, 1, 1, 1, 1, 1,
1.540721, 0.1273002, 1.945316, 1, 1, 1, 1, 1,
1.564021, -1.107668, 2.072505, 1, 1, 1, 1, 1,
1.613122, -1.043347, 2.791183, 1, 1, 1, 1, 1,
1.618899, 0.7231197, 1.870653, 1, 1, 1, 1, 1,
1.645539, 1.19671, 3.066242, 1, 1, 1, 1, 1,
1.649103, -0.4224356, 1.684568, 1, 1, 1, 1, 1,
1.65007, -0.1353636, 1.465853, 1, 1, 1, 1, 1,
1.673682, -1.70839, 3.187404, 1, 1, 1, 1, 1,
1.673773, -1.604297, 1.896433, 1, 1, 1, 1, 1,
1.678244, 1.56918, 1.363978, 1, 1, 1, 1, 1,
1.684776, -0.5483478, 2.523781, 1, 1, 1, 1, 1,
1.68694, 0.8372411, 1.615109, 1, 1, 1, 1, 1,
1.689494, 0.732297, 1.754727, 0, 0, 1, 1, 1,
1.725268, -2.008017, 1.980441, 1, 0, 0, 1, 1,
1.743978, -1.219526, 2.075893, 1, 0, 0, 1, 1,
1.747708, -0.1854616, 2.865229, 1, 0, 0, 1, 1,
1.752945, 0.9268619, 2.630527, 1, 0, 0, 1, 1,
1.788505, -0.01617818, 1.408553, 1, 0, 0, 1, 1,
1.806392, -0.4441584, 0.7144999, 0, 0, 0, 1, 1,
1.852318, -0.4850336, 2.192801, 0, 0, 0, 1, 1,
1.90292, -0.5681877, 2.694096, 0, 0, 0, 1, 1,
1.9213, -0.4626895, 0.7483866, 0, 0, 0, 1, 1,
1.946713, -0.09699342, 0.02054707, 0, 0, 0, 1, 1,
1.947163, 0.2257998, -1.030799, 0, 0, 0, 1, 1,
1.954989, -0.8037727, 1.579202, 0, 0, 0, 1, 1,
1.966449, -0.8190724, 0.3877366, 1, 1, 1, 1, 1,
1.978074, -0.1550254, 1.590153, 1, 1, 1, 1, 1,
2.022497, 0.2240674, 0.8008106, 1, 1, 1, 1, 1,
2.025459, 0.7989675, 1.212568, 1, 1, 1, 1, 1,
2.027267, -0.8866817, 2.564218, 1, 1, 1, 1, 1,
2.030988, 0.9357258, 1.326212, 1, 1, 1, 1, 1,
2.040647, 0.5002974, 1.714927, 1, 1, 1, 1, 1,
2.043748, 1.697698, 1.337892, 1, 1, 1, 1, 1,
2.063454, 0.1268036, 0.5658302, 1, 1, 1, 1, 1,
2.122904, 0.4941843, 1.826789, 1, 1, 1, 1, 1,
2.124633, 0.8087863, -0.2466415, 1, 1, 1, 1, 1,
2.127455, 0.1910835, 2.027009, 1, 1, 1, 1, 1,
2.128026, 1.18952, 1.297035, 1, 1, 1, 1, 1,
2.155829, -0.01360421, 2.555226, 1, 1, 1, 1, 1,
2.164201, 1.685897, 0.7514687, 1, 1, 1, 1, 1,
2.182587, -1.653543, 2.500143, 0, 0, 1, 1, 1,
2.191942, 1.481762, 0.3172092, 1, 0, 0, 1, 1,
2.205788, 0.2462294, 2.738199, 1, 0, 0, 1, 1,
2.210631, 0.3001059, 2.092583, 1, 0, 0, 1, 1,
2.284209, -1.450638, 0.3097351, 1, 0, 0, 1, 1,
2.29566, -1.218697, -0.6729587, 1, 0, 0, 1, 1,
2.327886, 1.269069, 2.06999, 0, 0, 0, 1, 1,
2.332124, -0.9147311, 1.794979, 0, 0, 0, 1, 1,
2.42072, -0.80916, 2.335413, 0, 0, 0, 1, 1,
2.452338, 1.863482, 0.3062905, 0, 0, 0, 1, 1,
2.486407, -0.2588724, 3.611105, 0, 0, 0, 1, 1,
2.49711, -1.07856, 2.834684, 0, 0, 0, 1, 1,
2.49754, -0.9680423, 4.269675, 0, 0, 0, 1, 1,
2.545747, -0.434563, 3.009683, 1, 1, 1, 1, 1,
2.733358, -0.2623558, 3.139248, 1, 1, 1, 1, 1,
2.82743, 1.059114, 0.02285071, 1, 1, 1, 1, 1,
2.860764, 1.072307, 2.070168, 1, 1, 1, 1, 1,
2.991018, 0.4554832, 1.711844, 1, 1, 1, 1, 1,
3.451329, -0.03974348, 2.457617, 1, 1, 1, 1, 1,
3.59449, 0.9063094, 1.813682, 1, 1, 1, 1, 1
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
var radius = 10.07183;
var distance = 35.37687;
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
mvMatrix.translate( 0.352597, -0.2230614, 0.4248784 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.37687);
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
