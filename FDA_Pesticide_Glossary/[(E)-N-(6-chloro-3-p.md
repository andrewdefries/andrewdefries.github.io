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
-3.16658, -1.025631, -2.240374, 1, 0, 0, 1,
-3.147344, -0.3276647, -3.351038, 1, 0.007843138, 0, 1,
-3.004546, -0.3157173, -2.474555, 1, 0.01176471, 0, 1,
-2.970474, -0.1843277, -3.206905, 1, 0.01960784, 0, 1,
-2.761883, -0.5883889, -4.162051, 1, 0.02352941, 0, 1,
-2.737218, -0.1613793, -0.2119249, 1, 0.03137255, 0, 1,
-2.701336, 0.1530454, -3.140203, 1, 0.03529412, 0, 1,
-2.527756, -0.7779908, -1.251336, 1, 0.04313726, 0, 1,
-2.517972, -0.7254823, -0.1820796, 1, 0.04705882, 0, 1,
-2.457014, 0.988227, -1.765367, 1, 0.05490196, 0, 1,
-2.423969, 0.7941665, -1.430727, 1, 0.05882353, 0, 1,
-2.352474, -1.230546, -1.053326, 1, 0.06666667, 0, 1,
-2.350955, -0.2785885, -3.449855, 1, 0.07058824, 0, 1,
-2.336928, -0.3827075, -2.487923, 1, 0.07843138, 0, 1,
-2.299088, 1.484604, -1.891601, 1, 0.08235294, 0, 1,
-2.280437, 0.7839395, -0.1443216, 1, 0.09019608, 0, 1,
-2.247998, 0.7498236, 0.3732218, 1, 0.09411765, 0, 1,
-2.247803, -0.7538505, -2.468023, 1, 0.1019608, 0, 1,
-2.245727, 0.7390596, -2.52184, 1, 0.1098039, 0, 1,
-2.23894, -0.9287595, -2.061909, 1, 0.1137255, 0, 1,
-2.238118, -0.2634898, -1.895437, 1, 0.1215686, 0, 1,
-2.23406, -1.034256, -1.016125, 1, 0.1254902, 0, 1,
-2.224227, 0.5128376, -0.8041535, 1, 0.1333333, 0, 1,
-2.20321, 0.2695537, -1.796087, 1, 0.1372549, 0, 1,
-2.168572, -0.3005823, -1.934654, 1, 0.145098, 0, 1,
-2.15652, 1.145243, 0.283373, 1, 0.1490196, 0, 1,
-2.139276, 0.8511449, -0.5677555, 1, 0.1568628, 0, 1,
-2.136946, 1.076081, -0.769023, 1, 0.1607843, 0, 1,
-2.057662, 0.7644618, -2.537958, 1, 0.1686275, 0, 1,
-2.030148, 0.7614182, -1.675421, 1, 0.172549, 0, 1,
-1.984945, -0.5628361, -4.020216, 1, 0.1803922, 0, 1,
-1.940181, 1.086683, -2.659816, 1, 0.1843137, 0, 1,
-1.933992, 0.4129338, -2.404362, 1, 0.1921569, 0, 1,
-1.930677, 0.1590248, -1.838946, 1, 0.1960784, 0, 1,
-1.911807, -0.6963896, -1.622908, 1, 0.2039216, 0, 1,
-1.87664, -0.6038256, -1.13063, 1, 0.2117647, 0, 1,
-1.874302, 0.2560199, -1.993556, 1, 0.2156863, 0, 1,
-1.874177, 0.7454808, 0.1011264, 1, 0.2235294, 0, 1,
-1.868436, 1.001218, -0.6365104, 1, 0.227451, 0, 1,
-1.84246, 1.254896, -2.770703, 1, 0.2352941, 0, 1,
-1.825531, -0.3022515, -1.915582, 1, 0.2392157, 0, 1,
-1.816539, -0.7900461, -0.3472538, 1, 0.2470588, 0, 1,
-1.814436, 0.2362242, -1.683896, 1, 0.2509804, 0, 1,
-1.807503, -0.00219822, -1.318639, 1, 0.2588235, 0, 1,
-1.799531, -0.251553, -2.884165, 1, 0.2627451, 0, 1,
-1.739182, 1.076548, -1.08798, 1, 0.2705882, 0, 1,
-1.691879, -0.4965502, -2.510551, 1, 0.2745098, 0, 1,
-1.691005, -1.164472, -2.914844, 1, 0.282353, 0, 1,
-1.655368, -0.6143837, -0.5432908, 1, 0.2862745, 0, 1,
-1.623857, -1.288192, -3.796264, 1, 0.2941177, 0, 1,
-1.61879, -0.6566891, -0.3409385, 1, 0.3019608, 0, 1,
-1.615107, 1.407119, 1.034224, 1, 0.3058824, 0, 1,
-1.605607, -0.730816, -3.982484, 1, 0.3137255, 0, 1,
-1.599856, -1.20253, -1.444044, 1, 0.3176471, 0, 1,
-1.59667, 1.071099, 0.2981015, 1, 0.3254902, 0, 1,
-1.587187, 1.009045, -0.8720327, 1, 0.3294118, 0, 1,
-1.578294, 0.03334676, -3.288939, 1, 0.3372549, 0, 1,
-1.568845, 2.440474, -2.072209, 1, 0.3411765, 0, 1,
-1.559796, 0.943864, -2.133229, 1, 0.3490196, 0, 1,
-1.546931, 1.848345, 1.151509, 1, 0.3529412, 0, 1,
-1.542907, -0.2172079, -0.7225654, 1, 0.3607843, 0, 1,
-1.542687, -0.1490526, -0.9832722, 1, 0.3647059, 0, 1,
-1.535284, 3.612099, -2.411365, 1, 0.372549, 0, 1,
-1.525633, -0.9340635, -3.738648, 1, 0.3764706, 0, 1,
-1.513748, -0.5930505, -1.026194, 1, 0.3843137, 0, 1,
-1.498656, -1.985512, -1.314199, 1, 0.3882353, 0, 1,
-1.473919, -0.3727608, -2.644148, 1, 0.3960784, 0, 1,
-1.4706, 0.4246773, -0.9704596, 1, 0.4039216, 0, 1,
-1.470495, 1.283486, -0.09022585, 1, 0.4078431, 0, 1,
-1.468947, -0.9407952, -2.929724, 1, 0.4156863, 0, 1,
-1.463422, 1.931423, 0.9069996, 1, 0.4196078, 0, 1,
-1.450103, -2.139621, -2.401858, 1, 0.427451, 0, 1,
-1.448348, 0.01294029, -1.409092, 1, 0.4313726, 0, 1,
-1.424536, 0.6446357, -3.09104, 1, 0.4392157, 0, 1,
-1.423597, 0.4151765, -0.1540437, 1, 0.4431373, 0, 1,
-1.422125, 1.158489, 0.4178479, 1, 0.4509804, 0, 1,
-1.413767, -0.444142, -0.6647515, 1, 0.454902, 0, 1,
-1.410976, 2.026998, -0.6129425, 1, 0.4627451, 0, 1,
-1.410735, 0.2807616, -0.0267546, 1, 0.4666667, 0, 1,
-1.391755, 0.2052273, -1.194601, 1, 0.4745098, 0, 1,
-1.388708, -1.029146, -2.017301, 1, 0.4784314, 0, 1,
-1.384414, 0.8173316, 1.512072, 1, 0.4862745, 0, 1,
-1.379685, 0.5616674, -0.1448043, 1, 0.4901961, 0, 1,
-1.37687, -1.161531, -2.386553, 1, 0.4980392, 0, 1,
-1.372694, -1.197815, -2.099562, 1, 0.5058824, 0, 1,
-1.371635, 1.594476, 0.2439387, 1, 0.509804, 0, 1,
-1.370358, -2.251397, -2.718213, 1, 0.5176471, 0, 1,
-1.370286, -0.2300055, -0.8584846, 1, 0.5215687, 0, 1,
-1.358538, 0.02283018, -1.309786, 1, 0.5294118, 0, 1,
-1.35594, -1.808458, -2.100948, 1, 0.5333334, 0, 1,
-1.354042, -0.9372219, -2.40729, 1, 0.5411765, 0, 1,
-1.351589, 1.097387, -0.2824083, 1, 0.5450981, 0, 1,
-1.346073, -2.87166, -1.627057, 1, 0.5529412, 0, 1,
-1.336382, -0.4920496, -1.255733, 1, 0.5568628, 0, 1,
-1.336349, 1.597323, 0.2815872, 1, 0.5647059, 0, 1,
-1.328012, 1.123863, 0.5295237, 1, 0.5686275, 0, 1,
-1.318363, -0.05516778, -3.346636, 1, 0.5764706, 0, 1,
-1.30774, -0.7886258, -3.551044, 1, 0.5803922, 0, 1,
-1.306387, -1.156937, -3.256706, 1, 0.5882353, 0, 1,
-1.299746, 0.8662665, -2.13311, 1, 0.5921569, 0, 1,
-1.292776, -1.807225, -1.331403, 1, 0.6, 0, 1,
-1.292579, 1.616376, -0.2750203, 1, 0.6078432, 0, 1,
-1.291978, -1.710864, -4.931689, 1, 0.6117647, 0, 1,
-1.290963, 0.4351066, -2.219151, 1, 0.6196079, 0, 1,
-1.28715, 0.7070634, -2.253664, 1, 0.6235294, 0, 1,
-1.287036, 1.048376, -1.87383, 1, 0.6313726, 0, 1,
-1.286733, 0.04854613, -3.210537, 1, 0.6352941, 0, 1,
-1.276501, -1.674868, -4.115993, 1, 0.6431373, 0, 1,
-1.269861, -0.7750509, -1.398112, 1, 0.6470588, 0, 1,
-1.250691, 0.8269674, -3.712601, 1, 0.654902, 0, 1,
-1.246517, -0.1823016, -2.717525, 1, 0.6588235, 0, 1,
-1.239285, -1.095956, -3.958555, 1, 0.6666667, 0, 1,
-1.236277, -0.2339377, -0.2179892, 1, 0.6705883, 0, 1,
-1.222837, -1.476314, -1.809306, 1, 0.6784314, 0, 1,
-1.222038, 1.217043, -1.399613, 1, 0.682353, 0, 1,
-1.221912, 1.231329, 0.3842768, 1, 0.6901961, 0, 1,
-1.214704, 0.7823313, -1.535545, 1, 0.6941177, 0, 1,
-1.214504, 0.3099498, -2.157979, 1, 0.7019608, 0, 1,
-1.214485, 1.659835, 0.6077336, 1, 0.7098039, 0, 1,
-1.212733, 1.735247, 0.6759779, 1, 0.7137255, 0, 1,
-1.202317, -0.6266226, -2.908731, 1, 0.7215686, 0, 1,
-1.201658, -0.446805, -1.186556, 1, 0.7254902, 0, 1,
-1.199981, 1.451856, -0.5035692, 1, 0.7333333, 0, 1,
-1.196627, -0.1009857, -2.485141, 1, 0.7372549, 0, 1,
-1.178726, -0.319895, -2.546618, 1, 0.7450981, 0, 1,
-1.178481, 1.157825, 1.236186, 1, 0.7490196, 0, 1,
-1.174263, 0.2750635, -0.2163759, 1, 0.7568628, 0, 1,
-1.17402, -0.8857435, -2.398444, 1, 0.7607843, 0, 1,
-1.171147, 1.263965, -1.11672, 1, 0.7686275, 0, 1,
-1.165125, -0.3228974, -4.016557, 1, 0.772549, 0, 1,
-1.16228, 0.1261732, -3.089122, 1, 0.7803922, 0, 1,
-1.161472, 0.07276469, -1.894295, 1, 0.7843137, 0, 1,
-1.159775, -1.448321, -2.883166, 1, 0.7921569, 0, 1,
-1.158955, -2.060355, -2.678548, 1, 0.7960784, 0, 1,
-1.155375, 0.9955384, -0.5198065, 1, 0.8039216, 0, 1,
-1.14759, 0.7511109, -0.5454005, 1, 0.8117647, 0, 1,
-1.146729, -0.506094, -2.221766, 1, 0.8156863, 0, 1,
-1.144066, 1.970224, -2.048706, 1, 0.8235294, 0, 1,
-1.131452, 0.4288139, -1.888908, 1, 0.827451, 0, 1,
-1.130441, -1.392648, -1.837131, 1, 0.8352941, 0, 1,
-1.127655, 1.406471, -0.4260983, 1, 0.8392157, 0, 1,
-1.123067, 1.285048, 1.289826, 1, 0.8470588, 0, 1,
-1.120141, 1.509718, -1.612603, 1, 0.8509804, 0, 1,
-1.11838, -0.189744, -1.032928, 1, 0.8588235, 0, 1,
-1.115747, 1.045204, -1.133979, 1, 0.8627451, 0, 1,
-1.103023, 0.6993043, -0.7133875, 1, 0.8705882, 0, 1,
-1.102868, 1.993695, -1.711421, 1, 0.8745098, 0, 1,
-1.098204, -0.4110174, -3.326925, 1, 0.8823529, 0, 1,
-1.090536, -0.1230823, -1.61748, 1, 0.8862745, 0, 1,
-1.083717, 0.1673567, -1.873671, 1, 0.8941177, 0, 1,
-1.081958, -0.65366, -2.336917, 1, 0.8980392, 0, 1,
-1.077398, 1.452545, -0.1856004, 1, 0.9058824, 0, 1,
-1.062649, 1.873841, -1.216461, 1, 0.9137255, 0, 1,
-1.060992, 2.074153, -0.9647009, 1, 0.9176471, 0, 1,
-1.060134, -0.4809043, -0.9704472, 1, 0.9254902, 0, 1,
-1.057705, -1.525916, -3.322197, 1, 0.9294118, 0, 1,
-1.054685, -0.8045799, -1.593958, 1, 0.9372549, 0, 1,
-1.051852, -0.6302041, -2.705868, 1, 0.9411765, 0, 1,
-1.049617, -0.6708153, -1.67728, 1, 0.9490196, 0, 1,
-1.039711, 0.04591202, -2.116556, 1, 0.9529412, 0, 1,
-1.034018, -0.5405062, -1.448639, 1, 0.9607843, 0, 1,
-1.032437, 1.267352, -0.8259879, 1, 0.9647059, 0, 1,
-1.016351, 0.2637696, -2.069924, 1, 0.972549, 0, 1,
-1.006501, -0.960264, -1.183707, 1, 0.9764706, 0, 1,
-0.9904267, -0.4369559, -1.090759, 1, 0.9843137, 0, 1,
-0.9898113, 0.6011848, -0.9426875, 1, 0.9882353, 0, 1,
-0.9845447, -0.05129755, -0.411707, 1, 0.9960784, 0, 1,
-0.9826627, 0.9043872, 0.5643607, 0.9960784, 1, 0, 1,
-0.9822802, -0.1803788, -1.027372, 0.9921569, 1, 0, 1,
-0.9793542, -0.2309497, -2.07574, 0.9843137, 1, 0, 1,
-0.9792182, -0.1143541, -1.225757, 0.9803922, 1, 0, 1,
-0.9736903, -0.2923294, -1.110633, 0.972549, 1, 0, 1,
-0.9736308, -1.494467, -4.007869, 0.9686275, 1, 0, 1,
-0.9732312, -0.5764357, -2.539162, 0.9607843, 1, 0, 1,
-0.9690376, -0.2822799, -1.275777, 0.9568627, 1, 0, 1,
-0.9655992, 0.6442456, -0.6314881, 0.9490196, 1, 0, 1,
-0.9643138, -0.4213422, -2.650127, 0.945098, 1, 0, 1,
-0.9595051, -0.49012, -1.303658, 0.9372549, 1, 0, 1,
-0.9531778, -0.2875908, -1.64298, 0.9333333, 1, 0, 1,
-0.946362, -0.1653521, -0.9142823, 0.9254902, 1, 0, 1,
-0.9326465, -1.753636, -4.473502, 0.9215686, 1, 0, 1,
-0.9314581, 1.269785, -0.6414376, 0.9137255, 1, 0, 1,
-0.929433, 0.7315813, -0.3592815, 0.9098039, 1, 0, 1,
-0.9187617, -1.438351, -1.883108, 0.9019608, 1, 0, 1,
-0.9187458, -0.9532289, -3.448141, 0.8941177, 1, 0, 1,
-0.908852, 1.233043, -0.221655, 0.8901961, 1, 0, 1,
-0.8996295, -0.1923467, -2.239866, 0.8823529, 1, 0, 1,
-0.8972925, 0.8556642, -0.7947509, 0.8784314, 1, 0, 1,
-0.8842443, 1.283869, -0.1211902, 0.8705882, 1, 0, 1,
-0.8824754, 0.195468, -2.789563, 0.8666667, 1, 0, 1,
-0.8823633, -0.4863006, -0.3131817, 0.8588235, 1, 0, 1,
-0.8775264, 0.1242894, -0.6073843, 0.854902, 1, 0, 1,
-0.8769373, 0.6620386, -0.5805241, 0.8470588, 1, 0, 1,
-0.8756788, 0.6940944, -0.8421208, 0.8431373, 1, 0, 1,
-0.8747281, 0.1308834, -1.055395, 0.8352941, 1, 0, 1,
-0.8712631, -1.411533, -3.332992, 0.8313726, 1, 0, 1,
-0.8681809, 0.09641141, -0.8516634, 0.8235294, 1, 0, 1,
-0.8627349, -0.8473878, -2.117098, 0.8196079, 1, 0, 1,
-0.8592055, 0.1904905, -1.670045, 0.8117647, 1, 0, 1,
-0.8581277, 0.1347503, -2.348512, 0.8078431, 1, 0, 1,
-0.8574346, -0.87192, -2.895617, 0.8, 1, 0, 1,
-0.8563108, 0.6588982, -0.4215597, 0.7921569, 1, 0, 1,
-0.8546563, 0.9069952, -0.9323043, 0.7882353, 1, 0, 1,
-0.8500484, 0.1756148, -0.2610928, 0.7803922, 1, 0, 1,
-0.8465677, -0.5375684, -2.277731, 0.7764706, 1, 0, 1,
-0.8465669, -2.146254, -3.917771, 0.7686275, 1, 0, 1,
-0.8439352, 0.9873362, -0.5625037, 0.7647059, 1, 0, 1,
-0.8423465, 0.8431635, -0.783021, 0.7568628, 1, 0, 1,
-0.8405706, 0.6546947, 0.05256563, 0.7529412, 1, 0, 1,
-0.8371453, 0.1038385, -0.972269, 0.7450981, 1, 0, 1,
-0.8333114, 0.5356203, 0.2435159, 0.7411765, 1, 0, 1,
-0.8285135, -1.255738, -3.601833, 0.7333333, 1, 0, 1,
-0.8238972, -0.2435721, -3.320336, 0.7294118, 1, 0, 1,
-0.8207146, -0.1653014, -2.7414, 0.7215686, 1, 0, 1,
-0.8142779, -1.82862, -3.708834, 0.7176471, 1, 0, 1,
-0.8130811, -1.115806, -3.870195, 0.7098039, 1, 0, 1,
-0.8128345, -1.401581, -2.49776, 0.7058824, 1, 0, 1,
-0.81052, -0.7078308, -3.465237, 0.6980392, 1, 0, 1,
-0.8097435, 1.045357, -1.182239, 0.6901961, 1, 0, 1,
-0.8026607, 1.660026, -0.6426387, 0.6862745, 1, 0, 1,
-0.8020291, 0.681991, -0.2651645, 0.6784314, 1, 0, 1,
-0.7966971, 1.018158, 0.06838581, 0.6745098, 1, 0, 1,
-0.7937143, 0.9972935, -2.016779, 0.6666667, 1, 0, 1,
-0.7916647, -0.6385998, -1.602493, 0.6627451, 1, 0, 1,
-0.7862426, -1.263291, -0.575119, 0.654902, 1, 0, 1,
-0.7853177, 0.7945679, 0.03464143, 0.6509804, 1, 0, 1,
-0.7833596, 0.5060908, -0.9992747, 0.6431373, 1, 0, 1,
-0.7831464, 0.7450578, -1.343505, 0.6392157, 1, 0, 1,
-0.7831435, -0.1406241, -3.519146, 0.6313726, 1, 0, 1,
-0.7823812, -0.3051247, -0.9822063, 0.627451, 1, 0, 1,
-0.7813411, 0.03267189, -2.001139, 0.6196079, 1, 0, 1,
-0.7809031, 2.040499, -0.1202102, 0.6156863, 1, 0, 1,
-0.7768107, -0.2599206, -2.157852, 0.6078432, 1, 0, 1,
-0.7752362, 0.2992712, -0.2432078, 0.6039216, 1, 0, 1,
-0.7701097, 0.09194385, -1.604078, 0.5960785, 1, 0, 1,
-0.7589872, 0.8567584, -1.461619, 0.5882353, 1, 0, 1,
-0.7586896, -0.7009349, -2.073046, 0.5843138, 1, 0, 1,
-0.7565669, 2.041594, -1.614043, 0.5764706, 1, 0, 1,
-0.7416949, -0.34925, -1.960458, 0.572549, 1, 0, 1,
-0.7394887, 0.7317825, -2.231779, 0.5647059, 1, 0, 1,
-0.7364476, 1.71836, -2.097668, 0.5607843, 1, 0, 1,
-0.7352523, -0.2386235, -2.306567, 0.5529412, 1, 0, 1,
-0.7332225, 0.9456757, -0.5285743, 0.5490196, 1, 0, 1,
-0.7273874, -0.6152472, -2.61937, 0.5411765, 1, 0, 1,
-0.7244288, 0.229488, -1.431829, 0.5372549, 1, 0, 1,
-0.7224736, -0.1660123, -2.518713, 0.5294118, 1, 0, 1,
-0.7174721, -0.10928, -1.910168, 0.5254902, 1, 0, 1,
-0.717427, -0.5841213, -2.741523, 0.5176471, 1, 0, 1,
-0.7167795, -0.5815833, -0.7253649, 0.5137255, 1, 0, 1,
-0.7162447, 1.058674, -2.123471, 0.5058824, 1, 0, 1,
-0.7144185, 0.5666809, -1.078973, 0.5019608, 1, 0, 1,
-0.7138034, -0.2147652, -3.288714, 0.4941176, 1, 0, 1,
-0.7042779, 0.3336631, -0.4429726, 0.4862745, 1, 0, 1,
-0.7009048, 0.524898, -0.06601191, 0.4823529, 1, 0, 1,
-0.7000365, -2.306055, -2.221173, 0.4745098, 1, 0, 1,
-0.6986293, -0.5473644, -4.893032, 0.4705882, 1, 0, 1,
-0.6976237, -0.09935226, -1.931883, 0.4627451, 1, 0, 1,
-0.6972426, -0.5959476, -3.203462, 0.4588235, 1, 0, 1,
-0.6951489, 1.235536, 0.09565951, 0.4509804, 1, 0, 1,
-0.6944578, -2.63202, -3.299041, 0.4470588, 1, 0, 1,
-0.6937137, 0.1452768, -2.783759, 0.4392157, 1, 0, 1,
-0.6900422, 0.2795701, -1.990079, 0.4352941, 1, 0, 1,
-0.6881953, -0.3213567, -2.409332, 0.427451, 1, 0, 1,
-0.6875724, 2.807444, -1.406203, 0.4235294, 1, 0, 1,
-0.6851879, -0.1845091, -1.678782, 0.4156863, 1, 0, 1,
-0.6850451, -1.536335, -4.098428, 0.4117647, 1, 0, 1,
-0.6785076, 0.5331008, -0.2300571, 0.4039216, 1, 0, 1,
-0.6777925, 0.1620104, -1.887356, 0.3960784, 1, 0, 1,
-0.676053, 0.7145166, -1.089033, 0.3921569, 1, 0, 1,
-0.6757908, 0.6936164, -3.274226, 0.3843137, 1, 0, 1,
-0.6749977, -0.07293499, -1.143186, 0.3803922, 1, 0, 1,
-0.6684004, 0.7221613, -0.4618228, 0.372549, 1, 0, 1,
-0.6602854, -0.6945431, -2.655851, 0.3686275, 1, 0, 1,
-0.6575441, 0.678808, -0.7311539, 0.3607843, 1, 0, 1,
-0.6563976, -0.1614634, -2.693364, 0.3568628, 1, 0, 1,
-0.6555122, 0.2959747, -1.329054, 0.3490196, 1, 0, 1,
-0.6540481, -2.142953, -2.864552, 0.345098, 1, 0, 1,
-0.6437519, -1.292125, -3.179938, 0.3372549, 1, 0, 1,
-0.6414306, 0.1946085, -0.7599564, 0.3333333, 1, 0, 1,
-0.6394438, -0.2354835, -2.156989, 0.3254902, 1, 0, 1,
-0.6355872, -1.69531, -1.793957, 0.3215686, 1, 0, 1,
-0.6345473, 0.6665247, 0.02420403, 0.3137255, 1, 0, 1,
-0.6300511, 0.9356406, 0.2555754, 0.3098039, 1, 0, 1,
-0.6284779, 1.901374, -1.537747, 0.3019608, 1, 0, 1,
-0.6263109, 0.4942497, 0.2432127, 0.2941177, 1, 0, 1,
-0.6165939, -0.593652, -2.555054, 0.2901961, 1, 0, 1,
-0.6158202, -0.1247055, -2.531929, 0.282353, 1, 0, 1,
-0.6079029, -0.6318885, -3.77063, 0.2784314, 1, 0, 1,
-0.6070098, -0.04772187, -2.938461, 0.2705882, 1, 0, 1,
-0.6064519, -0.3688801, -2.795476, 0.2666667, 1, 0, 1,
-0.6058516, -1.075677, -3.21973, 0.2588235, 1, 0, 1,
-0.6056035, -1.195461, 0.6462266, 0.254902, 1, 0, 1,
-0.591051, -0.7434586, -1.825539, 0.2470588, 1, 0, 1,
-0.5878841, -0.5556428, -2.19253, 0.2431373, 1, 0, 1,
-0.5853552, 2.079207, 1.012429, 0.2352941, 1, 0, 1,
-0.5839512, 0.09984136, -1.50486, 0.2313726, 1, 0, 1,
-0.578621, -3.047193, -2.97595, 0.2235294, 1, 0, 1,
-0.577906, -0.1704741, -2.717473, 0.2196078, 1, 0, 1,
-0.5706761, -0.4424198, -2.394929, 0.2117647, 1, 0, 1,
-0.5668001, 1.834843, -0.8490718, 0.2078431, 1, 0, 1,
-0.5667355, 2.614709, 0.6383778, 0.2, 1, 0, 1,
-0.5649442, -0.8129055, -1.33272, 0.1921569, 1, 0, 1,
-0.5619445, -1.773742, -1.332788, 0.1882353, 1, 0, 1,
-0.5607238, 1.5749, -0.2861323, 0.1803922, 1, 0, 1,
-0.5564542, -2.329139, -2.898155, 0.1764706, 1, 0, 1,
-0.555421, 1.015315, -0.4385107, 0.1686275, 1, 0, 1,
-0.5345227, 1.109363, -1.654902, 0.1647059, 1, 0, 1,
-0.5342361, -0.04976737, -2.942479, 0.1568628, 1, 0, 1,
-0.5310241, -0.971716, -2.847323, 0.1529412, 1, 0, 1,
-0.5246726, 0.7797077, -0.5401448, 0.145098, 1, 0, 1,
-0.5242793, 0.4028837, -2.062916, 0.1411765, 1, 0, 1,
-0.5177074, -0.2333694, -1.189608, 0.1333333, 1, 0, 1,
-0.5163159, 0.8577775, 0.2864833, 0.1294118, 1, 0, 1,
-0.5132992, 0.1504453, -0.9253179, 0.1215686, 1, 0, 1,
-0.5129875, -0.3384532, -1.908349, 0.1176471, 1, 0, 1,
-0.5018715, 1.164004, 0.3627187, 0.1098039, 1, 0, 1,
-0.4977572, 1.093993, -2.49256, 0.1058824, 1, 0, 1,
-0.4933972, 0.805737, -0.06685773, 0.09803922, 1, 0, 1,
-0.4897138, 0.5250621, -1.764677, 0.09019608, 1, 0, 1,
-0.4888718, -1.544356, -2.996171, 0.08627451, 1, 0, 1,
-0.488146, -0.3705375, 0.2784625, 0.07843138, 1, 0, 1,
-0.4869682, -1.363045, -1.677988, 0.07450981, 1, 0, 1,
-0.4867068, 1.455416, -0.03909148, 0.06666667, 1, 0, 1,
-0.4866505, -0.3587794, -1.288441, 0.0627451, 1, 0, 1,
-0.4750698, -0.002549817, 0.5315195, 0.05490196, 1, 0, 1,
-0.4722854, -0.6669291, -3.217591, 0.05098039, 1, 0, 1,
-0.4720721, -1.110692, -3.134115, 0.04313726, 1, 0, 1,
-0.4708957, -0.03638734, -0.1936797, 0.03921569, 1, 0, 1,
-0.4693116, -0.4284301, -3.430285, 0.03137255, 1, 0, 1,
-0.468667, 0.1076943, -0.3738579, 0.02745098, 1, 0, 1,
-0.4684577, 2.765386, -1.668826, 0.01960784, 1, 0, 1,
-0.4654613, 1.042352, -0.1377669, 0.01568628, 1, 0, 1,
-0.4642227, -1.202543, -3.027455, 0.007843138, 1, 0, 1,
-0.4641686, -1.584831, -3.853603, 0.003921569, 1, 0, 1,
-0.4615763, 0.3574271, 1.439246, 0, 1, 0.003921569, 1,
-0.4602375, -1.135947, -1.661413, 0, 1, 0.01176471, 1,
-0.4590631, 0.4525779, -0.008063175, 0, 1, 0.01568628, 1,
-0.4574928, -0.1970234, -2.968806, 0, 1, 0.02352941, 1,
-0.4551824, 1.250771, 0.1072772, 0, 1, 0.02745098, 1,
-0.4530318, 1.177112, 0.3627886, 0, 1, 0.03529412, 1,
-0.4520096, -1.109425, -2.153943, 0, 1, 0.03921569, 1,
-0.4455034, 0.8432695, -2.382235, 0, 1, 0.04705882, 1,
-0.4450662, -0.4386588, -2.636085, 0, 1, 0.05098039, 1,
-0.4422511, 0.3894906, -1.464534, 0, 1, 0.05882353, 1,
-0.4357105, 0.05379455, -1.219398, 0, 1, 0.0627451, 1,
-0.4352713, 0.6310956, -1.787982, 0, 1, 0.07058824, 1,
-0.4261392, 0.3683667, -0.2407819, 0, 1, 0.07450981, 1,
-0.4236636, -0.1800483, -3.086315, 0, 1, 0.08235294, 1,
-0.4220873, -0.9975033, -2.411253, 0, 1, 0.08627451, 1,
-0.4172116, -0.9433861, -3.010291, 0, 1, 0.09411765, 1,
-0.4148979, -0.1230268, -2.887836, 0, 1, 0.1019608, 1,
-0.4121498, 0.6692544, 0.9246231, 0, 1, 0.1058824, 1,
-0.4070562, -0.5586203, -1.84319, 0, 1, 0.1137255, 1,
-0.4036748, -0.5081514, -3.958613, 0, 1, 0.1176471, 1,
-0.3998811, 1.354736, 0.697407, 0, 1, 0.1254902, 1,
-0.3990746, -0.3028215, -1.71076, 0, 1, 0.1294118, 1,
-0.3965855, -0.03605013, -1.234851, 0, 1, 0.1372549, 1,
-0.3856098, 0.7879297, 0.9942048, 0, 1, 0.1411765, 1,
-0.374448, 0.1111252, -1.79036, 0, 1, 0.1490196, 1,
-0.3692203, -1.103948, -3.550314, 0, 1, 0.1529412, 1,
-0.3642389, -0.8665882, -3.559023, 0, 1, 0.1607843, 1,
-0.3638961, 1.416807, 0.4369296, 0, 1, 0.1647059, 1,
-0.358426, -1.139326, -3.897167, 0, 1, 0.172549, 1,
-0.3582687, 0.04192593, -1.587881, 0, 1, 0.1764706, 1,
-0.3469732, 0.08013497, -1.915072, 0, 1, 0.1843137, 1,
-0.3387154, 1.450134, 0.1901203, 0, 1, 0.1882353, 1,
-0.3366188, 2.140959, 1.127943, 0, 1, 0.1960784, 1,
-0.3338794, 0.51079, -0.4104983, 0, 1, 0.2039216, 1,
-0.3267113, 1.08397, 1.360752, 0, 1, 0.2078431, 1,
-0.3243474, 1.375893, -0.5351698, 0, 1, 0.2156863, 1,
-0.3221786, -0.0002374527, -3.029503, 0, 1, 0.2196078, 1,
-0.3119994, -0.2080474, -1.883631, 0, 1, 0.227451, 1,
-0.3086401, 0.6326314, -0.6044953, 0, 1, 0.2313726, 1,
-0.3079675, 0.7792177, -0.2791115, 0, 1, 0.2392157, 1,
-0.3043033, 0.8130989, -0.5178567, 0, 1, 0.2431373, 1,
-0.301052, 0.8849706, -0.7931027, 0, 1, 0.2509804, 1,
-0.2970712, 0.4339485, -0.491704, 0, 1, 0.254902, 1,
-0.2966441, 1.206325, -0.8277722, 0, 1, 0.2627451, 1,
-0.2950678, 0.7257052, 0.1197066, 0, 1, 0.2666667, 1,
-0.2947133, 0.2625285, -0.2514811, 0, 1, 0.2745098, 1,
-0.2932386, -0.3946885, -2.060776, 0, 1, 0.2784314, 1,
-0.2897362, -0.4758632, -2.35213, 0, 1, 0.2862745, 1,
-0.2893453, -1.220922, -2.547957, 0, 1, 0.2901961, 1,
-0.2815593, -0.01855264, -1.316417, 0, 1, 0.2980392, 1,
-0.2756929, -0.6016103, -3.259598, 0, 1, 0.3058824, 1,
-0.271742, -2.100087, -4.126155, 0, 1, 0.3098039, 1,
-0.2700174, -1.920251, -2.958367, 0, 1, 0.3176471, 1,
-0.2679045, -1.143816, -1.198879, 0, 1, 0.3215686, 1,
-0.2661739, -1.495688, -1.792863, 0, 1, 0.3294118, 1,
-0.2648299, 0.05750132, -1.602665, 0, 1, 0.3333333, 1,
-0.2602498, 2.998677, 0.0410444, 0, 1, 0.3411765, 1,
-0.260073, 1.632726, -1.605566, 0, 1, 0.345098, 1,
-0.2556463, 0.02161114, -1.064994, 0, 1, 0.3529412, 1,
-0.2527062, -1.356028, -1.268215, 0, 1, 0.3568628, 1,
-0.2526557, -0.5512627, -3.601939, 0, 1, 0.3647059, 1,
-0.2470187, 1.316555, -0.6107566, 0, 1, 0.3686275, 1,
-0.2447545, 0.6079856, -0.5387512, 0, 1, 0.3764706, 1,
-0.2437868, -0.5401969, -1.990563, 0, 1, 0.3803922, 1,
-0.2424146, 0.6790045, -1.757408, 0, 1, 0.3882353, 1,
-0.2394216, 0.5637417, 0.2740409, 0, 1, 0.3921569, 1,
-0.2371222, -0.7220594, -3.212537, 0, 1, 0.4, 1,
-0.2360158, -1.542385, -2.545979, 0, 1, 0.4078431, 1,
-0.2309632, 0.1206684, -2.052582, 0, 1, 0.4117647, 1,
-0.2301697, -0.8030319, -4.402306, 0, 1, 0.4196078, 1,
-0.2291365, -1.536434, -4.516137, 0, 1, 0.4235294, 1,
-0.2225874, 2.972209, -0.08876298, 0, 1, 0.4313726, 1,
-0.2200832, 0.2951161, -1.718702, 0, 1, 0.4352941, 1,
-0.2189984, 0.7192898, -1.76627, 0, 1, 0.4431373, 1,
-0.2188141, -0.1821041, -2.314185, 0, 1, 0.4470588, 1,
-0.2134416, -1.384625, -3.491007, 0, 1, 0.454902, 1,
-0.2125429, 0.4000239, -0.4511657, 0, 1, 0.4588235, 1,
-0.2114796, -0.8363725, -2.289326, 0, 1, 0.4666667, 1,
-0.2094658, -1.241551, -3.999262, 0, 1, 0.4705882, 1,
-0.2094025, 0.7276874, 0.1187245, 0, 1, 0.4784314, 1,
-0.2056625, -0.4178, -2.687401, 0, 1, 0.4823529, 1,
-0.2056281, 0.2158277, -0.3172537, 0, 1, 0.4901961, 1,
-0.2028931, -0.6073524, -2.251919, 0, 1, 0.4941176, 1,
-0.2022054, -0.1085353, -2.736688, 0, 1, 0.5019608, 1,
-0.2019595, -0.004552606, -2.049716, 0, 1, 0.509804, 1,
-0.2005681, -0.1055501, -3.150229, 0, 1, 0.5137255, 1,
-0.2002864, -0.5526894, -3.883045, 0, 1, 0.5215687, 1,
-0.1920956, 0.1204067, -1.437503, 0, 1, 0.5254902, 1,
-0.1902381, -0.2249232, -2.368053, 0, 1, 0.5333334, 1,
-0.1866628, -0.2769013, -1.295189, 0, 1, 0.5372549, 1,
-0.1864788, -1.389939, -3.038018, 0, 1, 0.5450981, 1,
-0.1848841, 1.331531, -1.83037, 0, 1, 0.5490196, 1,
-0.1848493, -0.9692273, -2.950169, 0, 1, 0.5568628, 1,
-0.1847884, 2.238592, -0.8279802, 0, 1, 0.5607843, 1,
-0.1836287, -1.290834, -2.257854, 0, 1, 0.5686275, 1,
-0.1828863, -1.433856, -3.33466, 0, 1, 0.572549, 1,
-0.179745, -0.356035, -1.370273, 0, 1, 0.5803922, 1,
-0.1784011, -0.307602, -4.218498, 0, 1, 0.5843138, 1,
-0.1765036, 0.5955875, -1.238942, 0, 1, 0.5921569, 1,
-0.1708142, -1.073127, -2.518405, 0, 1, 0.5960785, 1,
-0.1695702, 0.3176268, -1.40297, 0, 1, 0.6039216, 1,
-0.1678511, -0.9247747, -3.883715, 0, 1, 0.6117647, 1,
-0.1672173, -0.1631922, -2.201486, 0, 1, 0.6156863, 1,
-0.1669568, 0.2443921, -0.389629, 0, 1, 0.6235294, 1,
-0.164035, -1.2282, -4.06003, 0, 1, 0.627451, 1,
-0.1624548, -1.281876, -1.895462, 0, 1, 0.6352941, 1,
-0.158189, 0.7659193, 0.6338369, 0, 1, 0.6392157, 1,
-0.1559953, 1.16363, -2.94573, 0, 1, 0.6470588, 1,
-0.1544323, 0.07977704, 0.4787645, 0, 1, 0.6509804, 1,
-0.1503874, -0.2887837, -3.947363, 0, 1, 0.6588235, 1,
-0.1492445, 0.2898096, 1.27606, 0, 1, 0.6627451, 1,
-0.1486439, 1.889662, -0.3814131, 0, 1, 0.6705883, 1,
-0.1451769, -0.1142124, -1.712716, 0, 1, 0.6745098, 1,
-0.1441788, 0.556146, -0.6231782, 0, 1, 0.682353, 1,
-0.1427246, 0.8124357, 0.6935986, 0, 1, 0.6862745, 1,
-0.1416254, -0.7946373, -3.008879, 0, 1, 0.6941177, 1,
-0.1400167, 0.6090813, -0.10165, 0, 1, 0.7019608, 1,
-0.1374691, 1.673077, -0.5864548, 0, 1, 0.7058824, 1,
-0.1346106, -1.330766, -1.676558, 0, 1, 0.7137255, 1,
-0.1271895, 0.4557154, -1.752488, 0, 1, 0.7176471, 1,
-0.1266624, -1.658935, -3.947521, 0, 1, 0.7254902, 1,
-0.1253591, -0.5483177, -2.719837, 0, 1, 0.7294118, 1,
-0.1246605, 0.6347358, -0.4798218, 0, 1, 0.7372549, 1,
-0.1240583, -0.04586342, -1.111974, 0, 1, 0.7411765, 1,
-0.1216213, -0.693132, -2.750998, 0, 1, 0.7490196, 1,
-0.1215066, -0.06080239, -0.6451405, 0, 1, 0.7529412, 1,
-0.1214926, -0.9240637, -1.074211, 0, 1, 0.7607843, 1,
-0.1187689, 0.5723084, 1.312617, 0, 1, 0.7647059, 1,
-0.1159661, -0.6833063, -3.923562, 0, 1, 0.772549, 1,
-0.1119196, -0.1674888, -2.770789, 0, 1, 0.7764706, 1,
-0.1100416, 0.04198012, -0.7613812, 0, 1, 0.7843137, 1,
-0.1082611, 1.41238, 0.04579637, 0, 1, 0.7882353, 1,
-0.1037678, 0.2612619, -0.1166492, 0, 1, 0.7960784, 1,
-0.1022827, -0.9189054, -1.439434, 0, 1, 0.8039216, 1,
-0.1018236, 0.9399045, -0.713707, 0, 1, 0.8078431, 1,
-0.09998983, 0.9921968, 0.7962636, 0, 1, 0.8156863, 1,
-0.09945148, 0.3041809, -0.01152484, 0, 1, 0.8196079, 1,
-0.0958816, 0.8786671, -1.057094, 0, 1, 0.827451, 1,
-0.09181816, -0.3149592, -2.366533, 0, 1, 0.8313726, 1,
-0.09134507, -1.042346, -1.582458, 0, 1, 0.8392157, 1,
-0.09097613, 0.2857828, 0.7129177, 0, 1, 0.8431373, 1,
-0.08631029, -0.0567711, -0.5737329, 0, 1, 0.8509804, 1,
-0.08098777, -0.5594875, -3.71786, 0, 1, 0.854902, 1,
-0.07914016, 0.7075393, -0.5884168, 0, 1, 0.8627451, 1,
-0.07755111, -0.6337144, -3.182621, 0, 1, 0.8666667, 1,
-0.07615659, -1.487976, -2.434598, 0, 1, 0.8745098, 1,
-0.07121191, 0.9143766, -0.4674856, 0, 1, 0.8784314, 1,
-0.07054128, 0.6424799, -2.128484, 0, 1, 0.8862745, 1,
-0.06947669, 1.046683, 2.383862, 0, 1, 0.8901961, 1,
-0.06807658, -0.7200987, -2.141034, 0, 1, 0.8980392, 1,
-0.06775454, 2.083948, 0.4670154, 0, 1, 0.9058824, 1,
-0.06677226, 0.3222565, -0.9816115, 0, 1, 0.9098039, 1,
-0.06590701, 0.5991302, -1.149714, 0, 1, 0.9176471, 1,
-0.0636853, 0.6703303, 1.030423, 0, 1, 0.9215686, 1,
-0.06359975, -0.8071738, -2.071224, 0, 1, 0.9294118, 1,
-0.06355899, 0.3462195, -0.9433903, 0, 1, 0.9333333, 1,
-0.06094683, -0.5187633, -3.752451, 0, 1, 0.9411765, 1,
-0.06081102, 0.5682911, 0.2683205, 0, 1, 0.945098, 1,
-0.06016856, -0.08594164, -3.108177, 0, 1, 0.9529412, 1,
-0.05299887, -0.606327, -3.742419, 0, 1, 0.9568627, 1,
-0.05283278, 0.9089702, 0.4986787, 0, 1, 0.9647059, 1,
-0.05169947, -1.220165, -4.564257, 0, 1, 0.9686275, 1,
-0.04556229, 1.482643, -0.421281, 0, 1, 0.9764706, 1,
-0.03804778, 0.3283649, 0.8784187, 0, 1, 0.9803922, 1,
-0.03748998, -0.8925387, -3.340088, 0, 1, 0.9882353, 1,
-0.03283437, -1.294491, -2.287849, 0, 1, 0.9921569, 1,
-0.03215184, 0.322039, -1.421849, 0, 1, 1, 1,
-0.03159551, 1.224587, 0.5016031, 0, 0.9921569, 1, 1,
-0.02842306, 0.07917002, -0.4846981, 0, 0.9882353, 1, 1,
-0.02725927, -1.632257, -3.658534, 0, 0.9803922, 1, 1,
-0.025338, -0.2309722, -3.165835, 0, 0.9764706, 1, 1,
-0.02127063, -0.8769532, -3.454427, 0, 0.9686275, 1, 1,
-0.01972233, -0.01111923, -0.4155005, 0, 0.9647059, 1, 1,
-0.01697331, 1.209048, -0.5904344, 0, 0.9568627, 1, 1,
-0.01660589, -1.483638, -2.831661, 0, 0.9529412, 1, 1,
-0.01638093, -1.298912, -1.014471, 0, 0.945098, 1, 1,
-0.01466519, -0.5739682, -3.172624, 0, 0.9411765, 1, 1,
-0.01215826, 0.1996472, -1.290358, 0, 0.9333333, 1, 1,
-0.01207875, -0.0711404, -3.892376, 0, 0.9294118, 1, 1,
-0.01026689, 1.130735, -1.434488, 0, 0.9215686, 1, 1,
-0.009427518, 0.1457434, -1.703732, 0, 0.9176471, 1, 1,
-0.00858653, -0.2527412, -0.06471338, 0, 0.9098039, 1, 1,
-0.00656766, -1.052316, -3.096622, 0, 0.9058824, 1, 1,
-0.003608637, -0.06741227, -3.611417, 0, 0.8980392, 1, 1,
-0.001814898, -1.021398, -3.005144, 0, 0.8901961, 1, 1,
0.001100553, -0.2901453, 3.437968, 0, 0.8862745, 1, 1,
0.001161773, -0.1693892, 2.853203, 0, 0.8784314, 1, 1,
0.002259405, 1.090719, 1.755097, 0, 0.8745098, 1, 1,
0.006137327, -0.758921, 4.196343, 0, 0.8666667, 1, 1,
0.008103293, 0.5262644, 0.7334279, 0, 0.8627451, 1, 1,
0.009537288, -0.2105898, 4.247066, 0, 0.854902, 1, 1,
0.01033579, 0.5122241, -1.37993, 0, 0.8509804, 1, 1,
0.01193858, 0.8147951, 0.8935486, 0, 0.8431373, 1, 1,
0.01815804, -0.6525092, 5.000473, 0, 0.8392157, 1, 1,
0.01892438, -1.510065, 2.850719, 0, 0.8313726, 1, 1,
0.01908429, -0.005080168, 1.537654, 0, 0.827451, 1, 1,
0.02309279, -0.4395864, 3.21905, 0, 0.8196079, 1, 1,
0.02335524, -0.1668695, 2.219504, 0, 0.8156863, 1, 1,
0.02513753, -2.588665, 2.444287, 0, 0.8078431, 1, 1,
0.0262833, -0.6642963, 3.42067, 0, 0.8039216, 1, 1,
0.02789976, -0.1787584, 2.400474, 0, 0.7960784, 1, 1,
0.03526416, -0.2513202, 2.520271, 0, 0.7882353, 1, 1,
0.03726233, -0.268679, 1.957999, 0, 0.7843137, 1, 1,
0.0408123, 0.4831222, -0.7849013, 0, 0.7764706, 1, 1,
0.05253575, 0.07105273, 1.789082, 0, 0.772549, 1, 1,
0.05417442, 0.2975162, 0.7042972, 0, 0.7647059, 1, 1,
0.05579753, 1.880829, 0.1776894, 0, 0.7607843, 1, 1,
0.06013334, 0.3135353, -0.122683, 0, 0.7529412, 1, 1,
0.0607574, -1.383989, 3.76792, 0, 0.7490196, 1, 1,
0.06385019, 0.683423, -0.7866916, 0, 0.7411765, 1, 1,
0.06519637, 0.6355507, 0.1289816, 0, 0.7372549, 1, 1,
0.06931628, -1.708029, 2.823496, 0, 0.7294118, 1, 1,
0.07001278, 2.054458, 1.203543, 0, 0.7254902, 1, 1,
0.07045307, -1.512529, 2.707998, 0, 0.7176471, 1, 1,
0.0717303, -0.1828845, 1.814337, 0, 0.7137255, 1, 1,
0.07495816, -0.2210208, 2.27511, 0, 0.7058824, 1, 1,
0.07756524, -0.09083294, 3.177149, 0, 0.6980392, 1, 1,
0.07929908, 1.697842, -1.249795, 0, 0.6941177, 1, 1,
0.08195777, -1.395287, 3.120467, 0, 0.6862745, 1, 1,
0.0909789, -0.4540429, 4.924104, 0, 0.682353, 1, 1,
0.09453715, -0.06598836, 3.312073, 0, 0.6745098, 1, 1,
0.09965505, 1.518533, 0.1569813, 0, 0.6705883, 1, 1,
0.1004631, 0.1580699, -0.2280942, 0, 0.6627451, 1, 1,
0.1107623, 0.03467116, 0.1221973, 0, 0.6588235, 1, 1,
0.1155459, 0.04154995, 1.352098, 0, 0.6509804, 1, 1,
0.1160654, -0.5727804, 2.518314, 0, 0.6470588, 1, 1,
0.1175962, -1.390837, 2.679901, 0, 0.6392157, 1, 1,
0.1206608, 1.479455, 0.2107948, 0, 0.6352941, 1, 1,
0.1215636, -0.2758437, 1.923918, 0, 0.627451, 1, 1,
0.1276596, 0.05884482, 0.4372245, 0, 0.6235294, 1, 1,
0.1287275, 0.4536121, -1.524195, 0, 0.6156863, 1, 1,
0.1320956, 0.09067107, 1.02557, 0, 0.6117647, 1, 1,
0.1325479, -1.275205, 1.478451, 0, 0.6039216, 1, 1,
0.132563, 0.7931038, -0.6230438, 0, 0.5960785, 1, 1,
0.1352649, -1.337609, 4.131491, 0, 0.5921569, 1, 1,
0.1386002, -0.8636228, 4.980572, 0, 0.5843138, 1, 1,
0.1416599, -0.4547706, 1.355459, 0, 0.5803922, 1, 1,
0.150178, 1.009705, 0.1272212, 0, 0.572549, 1, 1,
0.1540338, 0.687759, 1.516213, 0, 0.5686275, 1, 1,
0.1588628, -0.4135055, 3.806238, 0, 0.5607843, 1, 1,
0.1606482, 0.2446393, 1.015155, 0, 0.5568628, 1, 1,
0.1624351, -1.373526, 2.077716, 0, 0.5490196, 1, 1,
0.1670527, 0.6783352, 0.2562206, 0, 0.5450981, 1, 1,
0.1676871, -2.064687, 1.395551, 0, 0.5372549, 1, 1,
0.1693304, -1.422048, 1.531691, 0, 0.5333334, 1, 1,
0.1697282, -0.4687761, 3.388428, 0, 0.5254902, 1, 1,
0.1713818, -1.70407, 1.474845, 0, 0.5215687, 1, 1,
0.1750249, -0.6875747, 1.309747, 0, 0.5137255, 1, 1,
0.1750868, 0.2721962, -1.840243, 0, 0.509804, 1, 1,
0.1751028, 0.2012695, 2.166076, 0, 0.5019608, 1, 1,
0.180549, -0.2243417, 1.271679, 0, 0.4941176, 1, 1,
0.1807281, -0.07000794, 2.74976, 0, 0.4901961, 1, 1,
0.1830827, -1.483887, 5.020541, 0, 0.4823529, 1, 1,
0.1847482, 1.221635, -0.2798982, 0, 0.4784314, 1, 1,
0.1852772, -0.4443403, 3.884379, 0, 0.4705882, 1, 1,
0.1854484, 1.132842, 0.322936, 0, 0.4666667, 1, 1,
0.1866359, 0.7889193, -0.0901325, 0, 0.4588235, 1, 1,
0.1876631, -1.955313, 3.585415, 0, 0.454902, 1, 1,
0.190746, 1.333469, 0.2926581, 0, 0.4470588, 1, 1,
0.192919, -0.2317927, 2.773088, 0, 0.4431373, 1, 1,
0.193188, -0.7829014, 1.909599, 0, 0.4352941, 1, 1,
0.1975172, 0.1593077, 2.314006, 0, 0.4313726, 1, 1,
0.1978835, 0.8773391, -0.3007995, 0, 0.4235294, 1, 1,
0.2011474, -2.341409, 1.726244, 0, 0.4196078, 1, 1,
0.2013936, -1.472121, 2.747314, 0, 0.4117647, 1, 1,
0.2019917, -1.826876, 2.030667, 0, 0.4078431, 1, 1,
0.2036442, 1.088205, -0.4503788, 0, 0.4, 1, 1,
0.206117, 1.056633, -1.306036, 0, 0.3921569, 1, 1,
0.2063984, -0.753028, 2.543889, 0, 0.3882353, 1, 1,
0.207109, 0.8925344, 1.744359, 0, 0.3803922, 1, 1,
0.2095303, -0.755917, 3.367673, 0, 0.3764706, 1, 1,
0.2122595, 1.941332, -1.493156, 0, 0.3686275, 1, 1,
0.2144314, -1.664837, 4.511863, 0, 0.3647059, 1, 1,
0.2152047, -0.2185639, 2.456657, 0, 0.3568628, 1, 1,
0.2222493, -0.4774522, 2.544154, 0, 0.3529412, 1, 1,
0.2294023, 0.4153685, -0.4349058, 0, 0.345098, 1, 1,
0.2383346, -0.2394828, 1.522009, 0, 0.3411765, 1, 1,
0.2419607, 0.02386642, 1.566683, 0, 0.3333333, 1, 1,
0.2424178, 0.8810718, -1.364328, 0, 0.3294118, 1, 1,
0.2461384, -0.561262, 3.462705, 0, 0.3215686, 1, 1,
0.2553905, 0.7231276, -1.273197, 0, 0.3176471, 1, 1,
0.260166, 0.5692042, 0.7675679, 0, 0.3098039, 1, 1,
0.260387, 1.826556, -0.9321753, 0, 0.3058824, 1, 1,
0.2607718, -0.8593089, 3.565233, 0, 0.2980392, 1, 1,
0.2668436, 1.513629, -0.2949122, 0, 0.2901961, 1, 1,
0.2688991, -0.8706778, 1.349518, 0, 0.2862745, 1, 1,
0.2689734, 0.280714, -0.7645237, 0, 0.2784314, 1, 1,
0.2695867, 1.125358, 1.027673, 0, 0.2745098, 1, 1,
0.2718524, 2.186919, -2.389453, 0, 0.2666667, 1, 1,
0.2723579, -0.1415118, 1.768837, 0, 0.2627451, 1, 1,
0.2724929, 0.2384676, 1.092985, 0, 0.254902, 1, 1,
0.284402, 0.6692902, -0.1707477, 0, 0.2509804, 1, 1,
0.2851149, 1.496832, -0.7349935, 0, 0.2431373, 1, 1,
0.2870109, 0.5958989, 1.80817, 0, 0.2392157, 1, 1,
0.2891258, -0.787052, 3.154189, 0, 0.2313726, 1, 1,
0.2929786, 0.2625296, -0.2248607, 0, 0.227451, 1, 1,
0.2933264, 0.8004511, -0.3950031, 0, 0.2196078, 1, 1,
0.2964914, -0.8559018, 1.472608, 0, 0.2156863, 1, 1,
0.3005266, 0.7584116, -0.1228426, 0, 0.2078431, 1, 1,
0.3013192, -0.5421913, 2.481237, 0, 0.2039216, 1, 1,
0.3031313, 0.5106189, 2.838468, 0, 0.1960784, 1, 1,
0.3037136, -0.1445809, 1.677762, 0, 0.1882353, 1, 1,
0.3070622, -0.04423909, 2.030817, 0, 0.1843137, 1, 1,
0.3122492, 1.163999, -1.38761, 0, 0.1764706, 1, 1,
0.3123987, 0.3915894, -2.227572, 0, 0.172549, 1, 1,
0.3150982, 0.0914319, 1.141184, 0, 0.1647059, 1, 1,
0.3176148, -0.4933242, 2.410451, 0, 0.1607843, 1, 1,
0.3185305, -0.2433721, 3.248216, 0, 0.1529412, 1, 1,
0.3192305, 1.210172, -0.009146598, 0, 0.1490196, 1, 1,
0.3227563, 0.6983252, 0.5591307, 0, 0.1411765, 1, 1,
0.3251836, -1.573992, 3.108218, 0, 0.1372549, 1, 1,
0.3313318, 1.359955, 0.5049082, 0, 0.1294118, 1, 1,
0.3339165, -1.27464, 2.517115, 0, 0.1254902, 1, 1,
0.3354424, 0.07486349, 0.996233, 0, 0.1176471, 1, 1,
0.3377069, -0.5418854, 3.142106, 0, 0.1137255, 1, 1,
0.3404359, 0.456698, -0.7388239, 0, 0.1058824, 1, 1,
0.342302, 0.7164576, 1.547034, 0, 0.09803922, 1, 1,
0.3430123, -0.6544788, 2.177263, 0, 0.09411765, 1, 1,
0.3435196, 0.6500905, 0.8127377, 0, 0.08627451, 1, 1,
0.3457185, 1.669531, 2.569619, 0, 0.08235294, 1, 1,
0.3482266, 0.5026063, 1.6461, 0, 0.07450981, 1, 1,
0.3506047, 1.390336, 0.7034819, 0, 0.07058824, 1, 1,
0.3513889, 0.5138944, 0.6941331, 0, 0.0627451, 1, 1,
0.3600566, -1.804809, 3.901741, 0, 0.05882353, 1, 1,
0.3652916, 0.9576884, -0.4590608, 0, 0.05098039, 1, 1,
0.3736867, -0.9406951, 3.926411, 0, 0.04705882, 1, 1,
0.3761735, 2.083187, 0.5505425, 0, 0.03921569, 1, 1,
0.3857171, 1.01498, -0.002363598, 0, 0.03529412, 1, 1,
0.3888521, 0.0636618, 0.6638024, 0, 0.02745098, 1, 1,
0.3899323, 0.1361955, -0.07866415, 0, 0.02352941, 1, 1,
0.3906432, -1.027336, 2.358549, 0, 0.01568628, 1, 1,
0.3928203, 0.6182482, 1.030288, 0, 0.01176471, 1, 1,
0.3938016, 2.213081, 1.947272, 0, 0.003921569, 1, 1,
0.3949336, -0.6646501, 3.992102, 0.003921569, 0, 1, 1,
0.4005542, 0.9956779, 0.9366285, 0.007843138, 0, 1, 1,
0.4018991, -0.4675048, 4.282657, 0.01568628, 0, 1, 1,
0.4019407, -0.6022732, 0.7468137, 0.01960784, 0, 1, 1,
0.4082045, 1.106042, -0.5929337, 0.02745098, 0, 1, 1,
0.4082306, 1.087867, -0.3742392, 0.03137255, 0, 1, 1,
0.4088467, 1.382279, -0.7256847, 0.03921569, 0, 1, 1,
0.4114143, 0.02770182, 1.988692, 0.04313726, 0, 1, 1,
0.4164899, -0.615027, 2.983426, 0.05098039, 0, 1, 1,
0.4221137, 2.486367, 0.7238265, 0.05490196, 0, 1, 1,
0.4241508, 0.3054745, 0.5904202, 0.0627451, 0, 1, 1,
0.4260223, 0.3203548, -0.4983517, 0.06666667, 0, 1, 1,
0.4329513, -0.1845098, 0.7049844, 0.07450981, 0, 1, 1,
0.4334934, 0.4821196, 0.9777651, 0.07843138, 0, 1, 1,
0.4346281, -0.1193912, 0.3944925, 0.08627451, 0, 1, 1,
0.4366764, 3.735708, 1.140128, 0.09019608, 0, 1, 1,
0.4411851, -0.005966817, 2.225465, 0.09803922, 0, 1, 1,
0.4466935, -2.630002, 1.634957, 0.1058824, 0, 1, 1,
0.4471388, 0.7628322, -1.048639, 0.1098039, 0, 1, 1,
0.4476564, -1.921068, 2.614092, 0.1176471, 0, 1, 1,
0.4505547, 0.3067459, 0.3309812, 0.1215686, 0, 1, 1,
0.4537188, -1.461722, 1.809368, 0.1294118, 0, 1, 1,
0.4546375, 0.6205621, 0.04326071, 0.1333333, 0, 1, 1,
0.4553545, 0.09970671, 0.9921387, 0.1411765, 0, 1, 1,
0.4587207, 0.3275324, 1.252559, 0.145098, 0, 1, 1,
0.4617538, 0.6038669, 0.7246162, 0.1529412, 0, 1, 1,
0.4627857, 0.5324749, 1.762641, 0.1568628, 0, 1, 1,
0.4633189, 0.2520808, 1.290802, 0.1647059, 0, 1, 1,
0.4634273, -0.8760535, 2.116333, 0.1686275, 0, 1, 1,
0.4645631, -0.2511692, 1.872527, 0.1764706, 0, 1, 1,
0.4709351, 0.4535302, 2.442977, 0.1803922, 0, 1, 1,
0.4829669, 0.5280102, 0.4608301, 0.1882353, 0, 1, 1,
0.4847865, -0.6298167, 1.778111, 0.1921569, 0, 1, 1,
0.4848023, -0.2588634, 0.1765217, 0.2, 0, 1, 1,
0.4921365, 2.256134, 1.010762, 0.2078431, 0, 1, 1,
0.4950285, -0.6543719, 0.9405957, 0.2117647, 0, 1, 1,
0.4957582, -0.5586784, 3.390235, 0.2196078, 0, 1, 1,
0.4969632, 0.9040104, -0.2430574, 0.2235294, 0, 1, 1,
0.4978385, 0.3331971, 1.503204, 0.2313726, 0, 1, 1,
0.4983716, -0.0976644, 3.933819, 0.2352941, 0, 1, 1,
0.5008324, -0.5760411, 3.370332, 0.2431373, 0, 1, 1,
0.5010167, -1.503812, 2.896719, 0.2470588, 0, 1, 1,
0.5036218, -1.328564, 2.746947, 0.254902, 0, 1, 1,
0.5042577, -0.01300617, 1.535165, 0.2588235, 0, 1, 1,
0.5129069, -0.5208668, 2.955211, 0.2666667, 0, 1, 1,
0.5146348, -2.076244, 0.8416503, 0.2705882, 0, 1, 1,
0.5147701, -0.2055397, 1.998319, 0.2784314, 0, 1, 1,
0.5162569, -1.595858, 3.10083, 0.282353, 0, 1, 1,
0.5179217, -2.287472, 3.457294, 0.2901961, 0, 1, 1,
0.518118, -1.114778, 2.343112, 0.2941177, 0, 1, 1,
0.5204223, -0.4206433, 0.9128523, 0.3019608, 0, 1, 1,
0.5273735, -1.691103, 3.253735, 0.3098039, 0, 1, 1,
0.5305048, 1.455134, 1.065438, 0.3137255, 0, 1, 1,
0.5329983, 1.749337, -0.8086503, 0.3215686, 0, 1, 1,
0.5357621, 1.021181, -0.5629507, 0.3254902, 0, 1, 1,
0.5377529, 0.007659512, 1.181229, 0.3333333, 0, 1, 1,
0.541314, 0.7525383, -0.6131583, 0.3372549, 0, 1, 1,
0.5458682, -0.5504805, 1.265683, 0.345098, 0, 1, 1,
0.5497135, 0.0428316, 2.780858, 0.3490196, 0, 1, 1,
0.5505528, 0.8200439, 1.203187, 0.3568628, 0, 1, 1,
0.557972, 0.5560698, 1.081836, 0.3607843, 0, 1, 1,
0.5587462, -0.4174851, 3.332024, 0.3686275, 0, 1, 1,
0.5607943, -1.122327, 2.095653, 0.372549, 0, 1, 1,
0.5612093, -0.2513614, 4.409338, 0.3803922, 0, 1, 1,
0.561724, 0.01178576, 1.079445, 0.3843137, 0, 1, 1,
0.5684572, 1.198699, 1.521549, 0.3921569, 0, 1, 1,
0.5751281, 1.900891, -0.7404324, 0.3960784, 0, 1, 1,
0.5766306, 0.2887559, 2.172593, 0.4039216, 0, 1, 1,
0.5789825, 0.9064993, -0.01354072, 0.4117647, 0, 1, 1,
0.5804594, 1.079121, 2.058345, 0.4156863, 0, 1, 1,
0.5874558, 2.250886, -1.905249, 0.4235294, 0, 1, 1,
0.5905309, 1.23958, 0.4041439, 0.427451, 0, 1, 1,
0.5986482, -0.8794337, 1.046448, 0.4352941, 0, 1, 1,
0.6023981, 0.5480123, 0.4436033, 0.4392157, 0, 1, 1,
0.6037607, 0.1793676, 2.835017, 0.4470588, 0, 1, 1,
0.6083037, 0.8650846, -0.1483305, 0.4509804, 0, 1, 1,
0.6092291, -1.432466, 3.149552, 0.4588235, 0, 1, 1,
0.6160658, 1.182713, 1.406073, 0.4627451, 0, 1, 1,
0.616771, 0.45876, 1.976504, 0.4705882, 0, 1, 1,
0.6218827, 0.6583269, 0.2083292, 0.4745098, 0, 1, 1,
0.624899, -1.309147, 2.0953, 0.4823529, 0, 1, 1,
0.625598, 0.5067326, 0.410835, 0.4862745, 0, 1, 1,
0.6271012, -0.5980225, 0.937045, 0.4941176, 0, 1, 1,
0.627954, 0.156887, -0.6076841, 0.5019608, 0, 1, 1,
0.632204, -0.02498975, 1.320494, 0.5058824, 0, 1, 1,
0.6506131, 2.534738, -0.5311248, 0.5137255, 0, 1, 1,
0.6509356, 2.653961, -1.287454, 0.5176471, 0, 1, 1,
0.6525127, 0.4608893, 2.256294, 0.5254902, 0, 1, 1,
0.6526039, 0.8366829, 1.852672, 0.5294118, 0, 1, 1,
0.6535329, 0.3620063, 1.098353, 0.5372549, 0, 1, 1,
0.6590974, 0.07283231, 2.917243, 0.5411765, 0, 1, 1,
0.66119, -0.7985662, 2.491573, 0.5490196, 0, 1, 1,
0.6618219, -0.5285299, 2.641128, 0.5529412, 0, 1, 1,
0.6627034, -0.5989828, 2.183094, 0.5607843, 0, 1, 1,
0.6653245, 0.6307807, 1.25614, 0.5647059, 0, 1, 1,
0.665808, -1.026572, 3.163897, 0.572549, 0, 1, 1,
0.6690246, -1.152014, 2.63491, 0.5764706, 0, 1, 1,
0.6723967, -0.5773252, 1.913339, 0.5843138, 0, 1, 1,
0.6746591, 0.2691207, 0.6218609, 0.5882353, 0, 1, 1,
0.6798922, 1.689728, -0.9334674, 0.5960785, 0, 1, 1,
0.6806434, 1.241471, -0.8530571, 0.6039216, 0, 1, 1,
0.6922453, 0.6519042, 1.193948, 0.6078432, 0, 1, 1,
0.6964017, -1.894447, 3.167144, 0.6156863, 0, 1, 1,
0.701261, 0.01057735, 2.146458, 0.6196079, 0, 1, 1,
0.7020159, -0.03712909, 0.3840783, 0.627451, 0, 1, 1,
0.7021766, -0.6812658, 0.3889261, 0.6313726, 0, 1, 1,
0.7051001, -1.376725, 3.235897, 0.6392157, 0, 1, 1,
0.7123786, -0.05194593, 0.4383226, 0.6431373, 0, 1, 1,
0.7132488, -1.775877, 2.741545, 0.6509804, 0, 1, 1,
0.7257865, -0.06851101, -1.834363, 0.654902, 0, 1, 1,
0.7286635, 0.5246071, -1.747764, 0.6627451, 0, 1, 1,
0.7316831, -0.6603265, 2.595108, 0.6666667, 0, 1, 1,
0.7329573, -0.6589953, 2.569111, 0.6745098, 0, 1, 1,
0.7360414, 2.796571, -0.04233024, 0.6784314, 0, 1, 1,
0.7381266, 1.548913, -1.000087, 0.6862745, 0, 1, 1,
0.7387353, 1.981371, -0.5416908, 0.6901961, 0, 1, 1,
0.7426773, -1.654635, 4.277193, 0.6980392, 0, 1, 1,
0.744584, 1.058064, 1.976599, 0.7058824, 0, 1, 1,
0.7486979, 1.545547, -0.1733087, 0.7098039, 0, 1, 1,
0.7487677, 1.002518, -0.7331238, 0.7176471, 0, 1, 1,
0.7491662, -1.248884, 2.887398, 0.7215686, 0, 1, 1,
0.7499725, 0.1315662, 1.930305, 0.7294118, 0, 1, 1,
0.7538464, 0.7035673, 1.031957, 0.7333333, 0, 1, 1,
0.7630089, -1.169945, 2.776141, 0.7411765, 0, 1, 1,
0.7663527, 0.7828006, 0.7152653, 0.7450981, 0, 1, 1,
0.7677119, -1.193989, 3.837758, 0.7529412, 0, 1, 1,
0.7702453, -0.3013916, 1.048238, 0.7568628, 0, 1, 1,
0.7717286, 0.3121631, -0.09672484, 0.7647059, 0, 1, 1,
0.777329, 0.6857774, -0.5553339, 0.7686275, 0, 1, 1,
0.7790692, -2.366018, 3.116588, 0.7764706, 0, 1, 1,
0.7813182, -1.712649, 3.385499, 0.7803922, 0, 1, 1,
0.7816296, -1.046591, 1.759141, 0.7882353, 0, 1, 1,
0.7886254, -0.3635954, 2.670487, 0.7921569, 0, 1, 1,
0.7903391, -0.5527666, 2.428764, 0.8, 0, 1, 1,
0.7914196, -2.524375, 2.83907, 0.8078431, 0, 1, 1,
0.8062603, -0.09401792, 1.980116, 0.8117647, 0, 1, 1,
0.8067375, -0.5098568, 3.364535, 0.8196079, 0, 1, 1,
0.8068698, -2.408833, 1.790008, 0.8235294, 0, 1, 1,
0.8094187, 0.1440775, -0.1744642, 0.8313726, 0, 1, 1,
0.8109425, 0.4792388, 1.93445, 0.8352941, 0, 1, 1,
0.8111172, -0.5186275, 1.922362, 0.8431373, 0, 1, 1,
0.8127524, 1.058151, 1.933459, 0.8470588, 0, 1, 1,
0.8170238, -0.7758162, 2.320339, 0.854902, 0, 1, 1,
0.8210018, -0.673894, 2.40705, 0.8588235, 0, 1, 1,
0.8226205, -1.298531, 3.898104, 0.8666667, 0, 1, 1,
0.8249601, -0.6524573, 3.641157, 0.8705882, 0, 1, 1,
0.8252772, -1.928371, 3.878958, 0.8784314, 0, 1, 1,
0.8288442, 0.07428306, 2.29977, 0.8823529, 0, 1, 1,
0.835264, -0.2021509, 0.1529225, 0.8901961, 0, 1, 1,
0.8352641, -0.1533551, 3.058359, 0.8941177, 0, 1, 1,
0.8378605, 0.7015322, 2.587909, 0.9019608, 0, 1, 1,
0.8491567, -1.25855, 1.603489, 0.9098039, 0, 1, 1,
0.8632374, 0.4561248, 0.2840792, 0.9137255, 0, 1, 1,
0.8711643, -2.164999, 2.29536, 0.9215686, 0, 1, 1,
0.8726031, -0.03432871, 0.4220915, 0.9254902, 0, 1, 1,
0.8727071, 0.6337972, 1.401253, 0.9333333, 0, 1, 1,
0.8727953, 0.4416951, 1.958981, 0.9372549, 0, 1, 1,
0.8761275, -0.481594, 2.961955, 0.945098, 0, 1, 1,
0.8762248, 0.7422758, -0.4039537, 0.9490196, 0, 1, 1,
0.8821728, 0.5372683, 0.8547605, 0.9568627, 0, 1, 1,
0.8825208, -1.844258, 1.730871, 0.9607843, 0, 1, 1,
0.8832663, -1.141842, 0.9854163, 0.9686275, 0, 1, 1,
0.8842335, 0.100878, 1.820971, 0.972549, 0, 1, 1,
0.886091, -0.7954138, 1.73659, 0.9803922, 0, 1, 1,
0.8873019, -0.6632965, 2.639264, 0.9843137, 0, 1, 1,
0.8880785, 0.7155566, 1.449676, 0.9921569, 0, 1, 1,
0.8885331, 0.5651931, 0.909821, 0.9960784, 0, 1, 1,
0.8933811, -0.6714056, 3.855234, 1, 0, 0.9960784, 1,
0.8942468, 0.9330261, 0.383308, 1, 0, 0.9882353, 1,
0.8966752, -1.388424, 2.621734, 1, 0, 0.9843137, 1,
0.9008273, 0.02090389, 1.265574, 1, 0, 0.9764706, 1,
0.9092284, 1.031462, 1.622499, 1, 0, 0.972549, 1,
0.9189078, 0.8212399, 0.7178918, 1, 0, 0.9647059, 1,
0.9246168, 0.9512976, -0.8666118, 1, 0, 0.9607843, 1,
0.9290494, 0.2732849, 0.431483, 1, 0, 0.9529412, 1,
0.9421391, 0.3035432, 0.239225, 1, 0, 0.9490196, 1,
0.9515379, 0.5785232, 1.184613, 1, 0, 0.9411765, 1,
0.9526643, 0.448362, 2.085837, 1, 0, 0.9372549, 1,
0.9530171, -1.074495, 3.050934, 1, 0, 0.9294118, 1,
0.9635605, 0.7489972, 0.7115929, 1, 0, 0.9254902, 1,
0.9681894, -0.7178099, 2.089462, 1, 0, 0.9176471, 1,
0.9806307, 2.075982, -1.016055, 1, 0, 0.9137255, 1,
0.9844775, -0.9595065, 5.26482, 1, 0, 0.9058824, 1,
0.9861897, -0.9008992, 2.286005, 1, 0, 0.9019608, 1,
0.9952035, -0.7890835, 2.64637, 1, 0, 0.8941177, 1,
1.003396, 0.8272984, 0.5195679, 1, 0, 0.8862745, 1,
1.004048, -1.178133, 2.255254, 1, 0, 0.8823529, 1,
1.004895, -0.7207034, 2.820424, 1, 0, 0.8745098, 1,
1.008868, -0.06423465, 0.720354, 1, 0, 0.8705882, 1,
1.011679, 0.7915611, 1.731011, 1, 0, 0.8627451, 1,
1.013534, -0.1831462, -0.1464363, 1, 0, 0.8588235, 1,
1.015508, 0.3563699, 2.236551, 1, 0, 0.8509804, 1,
1.016948, -0.04726301, 0.7850069, 1, 0, 0.8470588, 1,
1.025356, -1.456122, 2.862851, 1, 0, 0.8392157, 1,
1.027967, -2.340527, 3.886714, 1, 0, 0.8352941, 1,
1.031115, 0.8418267, 0.682565, 1, 0, 0.827451, 1,
1.040018, 0.1717993, -0.4961291, 1, 0, 0.8235294, 1,
1.042042, 0.7812017, -0.317888, 1, 0, 0.8156863, 1,
1.057324, 2.109468, -0.4781455, 1, 0, 0.8117647, 1,
1.06006, -0.7219507, 1.637725, 1, 0, 0.8039216, 1,
1.063183, -0.8423585, 2.026778, 1, 0, 0.7960784, 1,
1.063828, 1.854925, 0.2380432, 1, 0, 0.7921569, 1,
1.067834, -0.461439, 1.855809, 1, 0, 0.7843137, 1,
1.070313, -0.7326956, 2.236046, 1, 0, 0.7803922, 1,
1.071918, -1.131836, 2.290665, 1, 0, 0.772549, 1,
1.077692, 1.53608, -0.08018314, 1, 0, 0.7686275, 1,
1.086874, 0.635919, -0.1205994, 1, 0, 0.7607843, 1,
1.089493, 2.180302, 1.029855, 1, 0, 0.7568628, 1,
1.091001, 0.7294384, 2.188986, 1, 0, 0.7490196, 1,
1.098429, -0.1820946, 0.8565941, 1, 0, 0.7450981, 1,
1.104984, -0.2856959, -0.5770044, 1, 0, 0.7372549, 1,
1.111581, -0.9259148, 2.042853, 1, 0, 0.7333333, 1,
1.113469, -0.07809687, -1.178476, 1, 0, 0.7254902, 1,
1.115298, -0.06445299, 3.066695, 1, 0, 0.7215686, 1,
1.119677, -0.8062702, 3.228457, 1, 0, 0.7137255, 1,
1.120037, 0.5058005, -0.3649001, 1, 0, 0.7098039, 1,
1.122225, -0.6107051, 0.8249995, 1, 0, 0.7019608, 1,
1.13072, -0.3105258, 2.116589, 1, 0, 0.6941177, 1,
1.143231, -0.3992593, 3.408309, 1, 0, 0.6901961, 1,
1.150392, -0.3064446, 2.368976, 1, 0, 0.682353, 1,
1.154826, -0.04374723, 1.387814, 1, 0, 0.6784314, 1,
1.159038, -0.552654, 0.8006293, 1, 0, 0.6705883, 1,
1.16382, -0.2771295, 2.794021, 1, 0, 0.6666667, 1,
1.166818, 0.1311966, 2.325435, 1, 0, 0.6588235, 1,
1.1728, -0.8592817, 4.247369, 1, 0, 0.654902, 1,
1.18011, 0.378596, 0.4666954, 1, 0, 0.6470588, 1,
1.184217, -1.105547, 1.674906, 1, 0, 0.6431373, 1,
1.184755, 0.1125849, -0.8461525, 1, 0, 0.6352941, 1,
1.185245, 1.168208, 1.512555, 1, 0, 0.6313726, 1,
1.190678, 0.4170109, 1.00138, 1, 0, 0.6235294, 1,
1.193869, -1.167022, 2.794172, 1, 0, 0.6196079, 1,
1.196244, -1.157764, 2.870503, 1, 0, 0.6117647, 1,
1.19976, 0.09310067, 1.387385, 1, 0, 0.6078432, 1,
1.201611, -0.4040466, 0.5135291, 1, 0, 0.6, 1,
1.202872, -0.344319, 2.105475, 1, 0, 0.5921569, 1,
1.210492, -0.9277787, 1.418852, 1, 0, 0.5882353, 1,
1.229262, 1.969338, 0.9767756, 1, 0, 0.5803922, 1,
1.231115, 0.2460836, 2.495271, 1, 0, 0.5764706, 1,
1.237805, -0.7120606, 1.775932, 1, 0, 0.5686275, 1,
1.241741, 1.225509, -0.3537938, 1, 0, 0.5647059, 1,
1.248614, 1.836951, 0.8094063, 1, 0, 0.5568628, 1,
1.257809, -2.240794, 4.133677, 1, 0, 0.5529412, 1,
1.305259, -0.2500269, 3.742142, 1, 0, 0.5450981, 1,
1.305484, -0.8843693, 2.284275, 1, 0, 0.5411765, 1,
1.306227, 0.7572944, 1.875352, 1, 0, 0.5333334, 1,
1.318249, 1.418916, 1.231859, 1, 0, 0.5294118, 1,
1.325998, 0.9466736, 0.5067263, 1, 0, 0.5215687, 1,
1.326493, -0.03949891, 0.2402965, 1, 0, 0.5176471, 1,
1.327003, -0.8539357, 2.713567, 1, 0, 0.509804, 1,
1.328509, 0.06234211, 3.140451, 1, 0, 0.5058824, 1,
1.334942, -0.6632071, 2.22999, 1, 0, 0.4980392, 1,
1.350255, 0.8329926, 0.9768403, 1, 0, 0.4901961, 1,
1.35132, 0.8776799, 1.09, 1, 0, 0.4862745, 1,
1.35277, 0.4005924, 2.399214, 1, 0, 0.4784314, 1,
1.353561, -1.015459, 1.726328, 1, 0, 0.4745098, 1,
1.354852, 2.179866, 1.460735, 1, 0, 0.4666667, 1,
1.360856, 0.5783358, 1.895759, 1, 0, 0.4627451, 1,
1.366907, 0.1061097, 2.432386, 1, 0, 0.454902, 1,
1.370474, -0.2199932, 2.661163, 1, 0, 0.4509804, 1,
1.375222, 0.7216665, 2.428869, 1, 0, 0.4431373, 1,
1.379347, -0.2219189, 0.4392149, 1, 0, 0.4392157, 1,
1.392904, 0.1617183, 0.2039643, 1, 0, 0.4313726, 1,
1.394055, -0.8214365, 3.057679, 1, 0, 0.427451, 1,
1.399714, 0.5567589, -0.3506247, 1, 0, 0.4196078, 1,
1.423594, -0.687955, 2.190194, 1, 0, 0.4156863, 1,
1.430327, -1.262087, 1.374534, 1, 0, 0.4078431, 1,
1.446853, -0.8015755, 1.613281, 1, 0, 0.4039216, 1,
1.450125, 1.163439, 3.106596, 1, 0, 0.3960784, 1,
1.475714, 1.971925, 2.384923, 1, 0, 0.3882353, 1,
1.478989, 0.08685623, 2.414992, 1, 0, 0.3843137, 1,
1.484864, -0.009384344, 1.636278, 1, 0, 0.3764706, 1,
1.490915, 0.4982137, 1.353051, 1, 0, 0.372549, 1,
1.508773, 0.4795084, -0.1156915, 1, 0, 0.3647059, 1,
1.512533, 0.5188261, -0.1120439, 1, 0, 0.3607843, 1,
1.515382, 0.752111, -0.003726716, 1, 0, 0.3529412, 1,
1.516347, -1.549826, 3.07269, 1, 0, 0.3490196, 1,
1.540782, 0.5871261, 3.853312, 1, 0, 0.3411765, 1,
1.561084, 1.437642, 1.615456, 1, 0, 0.3372549, 1,
1.597331, 0.09700007, 0.3362953, 1, 0, 0.3294118, 1,
1.602322, -1.331548, 0.563327, 1, 0, 0.3254902, 1,
1.604004, -0.2849987, 3.0901, 1, 0, 0.3176471, 1,
1.615485, -0.2269282, 3.175578, 1, 0, 0.3137255, 1,
1.616475, -0.9288669, 2.210325, 1, 0, 0.3058824, 1,
1.624245, 0.2028222, -0.2468193, 1, 0, 0.2980392, 1,
1.625575, -1.013213, 2.071977, 1, 0, 0.2941177, 1,
1.627308, 0.9500155, 0.800508, 1, 0, 0.2862745, 1,
1.640545, -1.726398, 3.905339, 1, 0, 0.282353, 1,
1.650817, -1.595062, 2.863729, 1, 0, 0.2745098, 1,
1.651103, 0.1907787, 1.550441, 1, 0, 0.2705882, 1,
1.658036, 0.9748724, 0.8704636, 1, 0, 0.2627451, 1,
1.6621, 0.8127633, 4.556507, 1, 0, 0.2588235, 1,
1.666107, -0.3077743, 0.3695761, 1, 0, 0.2509804, 1,
1.686757, 1.202426, 1.105941, 1, 0, 0.2470588, 1,
1.695768, -0.483961, 1.48233, 1, 0, 0.2392157, 1,
1.764902, 0.4023509, -0.691327, 1, 0, 0.2352941, 1,
1.767187, 1.155241, 0.06383615, 1, 0, 0.227451, 1,
1.77188, 0.683155, 0.4133524, 1, 0, 0.2235294, 1,
1.78492, 1.324369, 1.213551, 1, 0, 0.2156863, 1,
1.785703, -0.9654599, 2.331699, 1, 0, 0.2117647, 1,
1.785922, -1.582918, 1.839274, 1, 0, 0.2039216, 1,
1.796944, 0.5224901, -0.547843, 1, 0, 0.1960784, 1,
1.799611, -0.8930326, 2.670995, 1, 0, 0.1921569, 1,
1.816592, -0.7022377, 2.073325, 1, 0, 0.1843137, 1,
1.873955, 0.7979837, 1.859243, 1, 0, 0.1803922, 1,
1.876715, -0.1129964, 0.9403641, 1, 0, 0.172549, 1,
1.932941, -0.9100375, 0.3167741, 1, 0, 0.1686275, 1,
1.960047, 0.6273305, 1.300318, 1, 0, 0.1607843, 1,
1.992593, 0.06755439, 0.7804659, 1, 0, 0.1568628, 1,
2.004294, -0.9599044, 2.932652, 1, 0, 0.1490196, 1,
2.035393, 0.82348, 1.534441, 1, 0, 0.145098, 1,
2.053236, 0.8185065, 1.536463, 1, 0, 0.1372549, 1,
2.077735, -0.8104024, 3.631426, 1, 0, 0.1333333, 1,
2.088344, 1.423146, 0.9522174, 1, 0, 0.1254902, 1,
2.112157, -0.9260523, 1.955526, 1, 0, 0.1215686, 1,
2.126584, -0.4610708, 1.115321, 1, 0, 0.1137255, 1,
2.173025, 0.7838731, -0.004002864, 1, 0, 0.1098039, 1,
2.188916, -0.3611756, 2.891511, 1, 0, 0.1019608, 1,
2.213911, -0.6133401, 2.660285, 1, 0, 0.09411765, 1,
2.214055, 1.070721, 0.9241147, 1, 0, 0.09019608, 1,
2.247931, 0.3914197, 1.060192, 1, 0, 0.08235294, 1,
2.255735, 0.002857411, 2.087834, 1, 0, 0.07843138, 1,
2.271409, 0.07033444, 2.462824, 1, 0, 0.07058824, 1,
2.309172, 0.4075627, 1.875803, 1, 0, 0.06666667, 1,
2.310534, 0.5708226, 3.060654, 1, 0, 0.05882353, 1,
2.3332, 0.3729566, 2.200635, 1, 0, 0.05490196, 1,
2.361079, -0.1986141, 2.847775, 1, 0, 0.04705882, 1,
2.401015, -0.8095585, 1.276257, 1, 0, 0.04313726, 1,
2.433732, 0.07171476, 2.627893, 1, 0, 0.03529412, 1,
2.632823, 0.701035, 2.221452, 1, 0, 0.03137255, 1,
2.726107, 0.1820996, 2.065647, 1, 0, 0.02352941, 1,
2.761529, 1.489206, 3.00009, 1, 0, 0.01960784, 1,
3.301222, -0.03815934, 2.034815, 1, 0, 0.01176471, 1,
3.353831, -0.9731296, 2.391243, 1, 0, 0.007843138, 1
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
0.09362531, -4.196895, -6.659997, 0, -0.5, 0.5, 0.5,
0.09362531, -4.196895, -6.659997, 1, -0.5, 0.5, 0.5,
0.09362531, -4.196895, -6.659997, 1, 1.5, 0.5, 0.5,
0.09362531, -4.196895, -6.659997, 0, 1.5, 0.5, 0.5
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
-4.27179, 0.3442575, -6.659997, 0, -0.5, 0.5, 0.5,
-4.27179, 0.3442575, -6.659997, 1, -0.5, 0.5, 0.5,
-4.27179, 0.3442575, -6.659997, 1, 1.5, 0.5, 0.5,
-4.27179, 0.3442575, -6.659997, 0, 1.5, 0.5, 0.5
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
-4.27179, -4.196895, 0.1665657, 0, -0.5, 0.5, 0.5,
-4.27179, -4.196895, 0.1665657, 1, -0.5, 0.5, 0.5,
-4.27179, -4.196895, 0.1665657, 1, 1.5, 0.5, 0.5,
-4.27179, -4.196895, 0.1665657, 0, 1.5, 0.5, 0.5
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
-3, -3.148936, -5.084636,
3, -3.148936, -5.084636,
-3, -3.148936, -5.084636,
-3, -3.323596, -5.347197,
-2, -3.148936, -5.084636,
-2, -3.323596, -5.347197,
-1, -3.148936, -5.084636,
-1, -3.323596, -5.347197,
0, -3.148936, -5.084636,
0, -3.323596, -5.347197,
1, -3.148936, -5.084636,
1, -3.323596, -5.347197,
2, -3.148936, -5.084636,
2, -3.323596, -5.347197,
3, -3.148936, -5.084636,
3, -3.323596, -5.347197
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
-3, -3.672915, -5.872317, 0, -0.5, 0.5, 0.5,
-3, -3.672915, -5.872317, 1, -0.5, 0.5, 0.5,
-3, -3.672915, -5.872317, 1, 1.5, 0.5, 0.5,
-3, -3.672915, -5.872317, 0, 1.5, 0.5, 0.5,
-2, -3.672915, -5.872317, 0, -0.5, 0.5, 0.5,
-2, -3.672915, -5.872317, 1, -0.5, 0.5, 0.5,
-2, -3.672915, -5.872317, 1, 1.5, 0.5, 0.5,
-2, -3.672915, -5.872317, 0, 1.5, 0.5, 0.5,
-1, -3.672915, -5.872317, 0, -0.5, 0.5, 0.5,
-1, -3.672915, -5.872317, 1, -0.5, 0.5, 0.5,
-1, -3.672915, -5.872317, 1, 1.5, 0.5, 0.5,
-1, -3.672915, -5.872317, 0, 1.5, 0.5, 0.5,
0, -3.672915, -5.872317, 0, -0.5, 0.5, 0.5,
0, -3.672915, -5.872317, 1, -0.5, 0.5, 0.5,
0, -3.672915, -5.872317, 1, 1.5, 0.5, 0.5,
0, -3.672915, -5.872317, 0, 1.5, 0.5, 0.5,
1, -3.672915, -5.872317, 0, -0.5, 0.5, 0.5,
1, -3.672915, -5.872317, 1, -0.5, 0.5, 0.5,
1, -3.672915, -5.872317, 1, 1.5, 0.5, 0.5,
1, -3.672915, -5.872317, 0, 1.5, 0.5, 0.5,
2, -3.672915, -5.872317, 0, -0.5, 0.5, 0.5,
2, -3.672915, -5.872317, 1, -0.5, 0.5, 0.5,
2, -3.672915, -5.872317, 1, 1.5, 0.5, 0.5,
2, -3.672915, -5.872317, 0, 1.5, 0.5, 0.5,
3, -3.672915, -5.872317, 0, -0.5, 0.5, 0.5,
3, -3.672915, -5.872317, 1, -0.5, 0.5, 0.5,
3, -3.672915, -5.872317, 1, 1.5, 0.5, 0.5,
3, -3.672915, -5.872317, 0, 1.5, 0.5, 0.5
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
-3.264386, -3, -5.084636,
-3.264386, 3, -5.084636,
-3.264386, -3, -5.084636,
-3.432287, -3, -5.347197,
-3.264386, -2, -5.084636,
-3.432287, -2, -5.347197,
-3.264386, -1, -5.084636,
-3.432287, -1, -5.347197,
-3.264386, 0, -5.084636,
-3.432287, 0, -5.347197,
-3.264386, 1, -5.084636,
-3.432287, 1, -5.347197,
-3.264386, 2, -5.084636,
-3.432287, 2, -5.347197,
-3.264386, 3, -5.084636,
-3.432287, 3, -5.347197
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
-3.768088, -3, -5.872317, 0, -0.5, 0.5, 0.5,
-3.768088, -3, -5.872317, 1, -0.5, 0.5, 0.5,
-3.768088, -3, -5.872317, 1, 1.5, 0.5, 0.5,
-3.768088, -3, -5.872317, 0, 1.5, 0.5, 0.5,
-3.768088, -2, -5.872317, 0, -0.5, 0.5, 0.5,
-3.768088, -2, -5.872317, 1, -0.5, 0.5, 0.5,
-3.768088, -2, -5.872317, 1, 1.5, 0.5, 0.5,
-3.768088, -2, -5.872317, 0, 1.5, 0.5, 0.5,
-3.768088, -1, -5.872317, 0, -0.5, 0.5, 0.5,
-3.768088, -1, -5.872317, 1, -0.5, 0.5, 0.5,
-3.768088, -1, -5.872317, 1, 1.5, 0.5, 0.5,
-3.768088, -1, -5.872317, 0, 1.5, 0.5, 0.5,
-3.768088, 0, -5.872317, 0, -0.5, 0.5, 0.5,
-3.768088, 0, -5.872317, 1, -0.5, 0.5, 0.5,
-3.768088, 0, -5.872317, 1, 1.5, 0.5, 0.5,
-3.768088, 0, -5.872317, 0, 1.5, 0.5, 0.5,
-3.768088, 1, -5.872317, 0, -0.5, 0.5, 0.5,
-3.768088, 1, -5.872317, 1, -0.5, 0.5, 0.5,
-3.768088, 1, -5.872317, 1, 1.5, 0.5, 0.5,
-3.768088, 1, -5.872317, 0, 1.5, 0.5, 0.5,
-3.768088, 2, -5.872317, 0, -0.5, 0.5, 0.5,
-3.768088, 2, -5.872317, 1, -0.5, 0.5, 0.5,
-3.768088, 2, -5.872317, 1, 1.5, 0.5, 0.5,
-3.768088, 2, -5.872317, 0, 1.5, 0.5, 0.5,
-3.768088, 3, -5.872317, 0, -0.5, 0.5, 0.5,
-3.768088, 3, -5.872317, 1, -0.5, 0.5, 0.5,
-3.768088, 3, -5.872317, 1, 1.5, 0.5, 0.5,
-3.768088, 3, -5.872317, 0, 1.5, 0.5, 0.5
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
-3.264386, -3.148936, -4,
-3.264386, -3.148936, 4,
-3.264386, -3.148936, -4,
-3.432287, -3.323596, -4,
-3.264386, -3.148936, -2,
-3.432287, -3.323596, -2,
-3.264386, -3.148936, 0,
-3.432287, -3.323596, 0,
-3.264386, -3.148936, 2,
-3.432287, -3.323596, 2,
-3.264386, -3.148936, 4,
-3.432287, -3.323596, 4
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
-3.768088, -3.672915, -4, 0, -0.5, 0.5, 0.5,
-3.768088, -3.672915, -4, 1, -0.5, 0.5, 0.5,
-3.768088, -3.672915, -4, 1, 1.5, 0.5, 0.5,
-3.768088, -3.672915, -4, 0, 1.5, 0.5, 0.5,
-3.768088, -3.672915, -2, 0, -0.5, 0.5, 0.5,
-3.768088, -3.672915, -2, 1, -0.5, 0.5, 0.5,
-3.768088, -3.672915, -2, 1, 1.5, 0.5, 0.5,
-3.768088, -3.672915, -2, 0, 1.5, 0.5, 0.5,
-3.768088, -3.672915, 0, 0, -0.5, 0.5, 0.5,
-3.768088, -3.672915, 0, 1, -0.5, 0.5, 0.5,
-3.768088, -3.672915, 0, 1, 1.5, 0.5, 0.5,
-3.768088, -3.672915, 0, 0, 1.5, 0.5, 0.5,
-3.768088, -3.672915, 2, 0, -0.5, 0.5, 0.5,
-3.768088, -3.672915, 2, 1, -0.5, 0.5, 0.5,
-3.768088, -3.672915, 2, 1, 1.5, 0.5, 0.5,
-3.768088, -3.672915, 2, 0, 1.5, 0.5, 0.5,
-3.768088, -3.672915, 4, 0, -0.5, 0.5, 0.5,
-3.768088, -3.672915, 4, 1, -0.5, 0.5, 0.5,
-3.768088, -3.672915, 4, 1, 1.5, 0.5, 0.5,
-3.768088, -3.672915, 4, 0, 1.5, 0.5, 0.5
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
-3.264386, -3.148936, -5.084636,
-3.264386, 3.837451, -5.084636,
-3.264386, -3.148936, 5.417768,
-3.264386, 3.837451, 5.417768,
-3.264386, -3.148936, -5.084636,
-3.264386, -3.148936, 5.417768,
-3.264386, 3.837451, -5.084636,
-3.264386, 3.837451, 5.417768,
-3.264386, -3.148936, -5.084636,
3.451637, -3.148936, -5.084636,
-3.264386, -3.148936, 5.417768,
3.451637, -3.148936, 5.417768,
-3.264386, 3.837451, -5.084636,
3.451637, 3.837451, -5.084636,
-3.264386, 3.837451, 5.417768,
3.451637, 3.837451, 5.417768,
3.451637, -3.148936, -5.084636,
3.451637, 3.837451, -5.084636,
3.451637, -3.148936, 5.417768,
3.451637, 3.837451, 5.417768,
3.451637, -3.148936, -5.084636,
3.451637, -3.148936, 5.417768,
3.451637, 3.837451, -5.084636,
3.451637, 3.837451, 5.417768
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
var radius = 7.630788;
var distance = 33.95024;
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
mvMatrix.translate( -0.09362531, -0.3442575, -0.1665657 );
mvMatrix.scale( 1.228488, 1.180948, 0.7855875 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.95024);
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


