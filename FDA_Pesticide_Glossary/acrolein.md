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
-2.673965, 1.727134, -1.340528, 1, 0, 0, 1,
-2.525523, 1.099602, -0.4398338, 1, 0.007843138, 0, 1,
-2.502222, -0.219147, -3.971295, 1, 0.01176471, 0, 1,
-2.465728, 0.06146144, -1.022942, 1, 0.01960784, 0, 1,
-2.357293, 0.02989103, -3.167473, 1, 0.02352941, 0, 1,
-2.345758, -0.6624173, -1.86643, 1, 0.03137255, 0, 1,
-2.290679, -0.60109, -0.6331508, 1, 0.03529412, 0, 1,
-2.261813, 0.1103111, -1.687992, 1, 0.04313726, 0, 1,
-2.245434, 2.397349, -2.228972, 1, 0.04705882, 0, 1,
-2.238654, 1.588668, 0.7880183, 1, 0.05490196, 0, 1,
-2.210553, 0.2908391, -1.367451, 1, 0.05882353, 0, 1,
-2.205118, -1.442626, -3.246607, 1, 0.06666667, 0, 1,
-2.204091, -0.454531, -2.329491, 1, 0.07058824, 0, 1,
-2.131433, -1.093389, -1.673227, 1, 0.07843138, 0, 1,
-2.116842, -2.466877, -3.007037, 1, 0.08235294, 0, 1,
-2.114957, 0.9931253, -1.502389, 1, 0.09019608, 0, 1,
-2.093796, -0.9244048, -1.578942, 1, 0.09411765, 0, 1,
-2.082552, 0.9040732, -0.2201447, 1, 0.1019608, 0, 1,
-2.057088, 0.02586371, -1.238332, 1, 0.1098039, 0, 1,
-2.05262, 0.5016879, -0.6759829, 1, 0.1137255, 0, 1,
-1.996342, 1.890598, -1.07583, 1, 0.1215686, 0, 1,
-1.986329, -1.680345, -3.665304, 1, 0.1254902, 0, 1,
-1.984987, -0.5003331, -1.073187, 1, 0.1333333, 0, 1,
-1.975339, 1.030822, -0.1100345, 1, 0.1372549, 0, 1,
-1.930291, -0.1525981, -0.910427, 1, 0.145098, 0, 1,
-1.915264, 0.6192095, 0.07295349, 1, 0.1490196, 0, 1,
-1.91151, 1.779685, -0.768909, 1, 0.1568628, 0, 1,
-1.907176, 0.4224317, -1.770453, 1, 0.1607843, 0, 1,
-1.904598, -1.039903, -3.06725, 1, 0.1686275, 0, 1,
-1.89821, -1.246119, -1.745704, 1, 0.172549, 0, 1,
-1.894142, 0.9045855, -1.29106, 1, 0.1803922, 0, 1,
-1.89356, -0.1224434, -0.9392707, 1, 0.1843137, 0, 1,
-1.888008, -1.312059, -2.769532, 1, 0.1921569, 0, 1,
-1.885704, 0.3740207, -3.033687, 1, 0.1960784, 0, 1,
-1.841053, 0.9032956, 0.2293912, 1, 0.2039216, 0, 1,
-1.829445, -0.34001, -0.9462939, 1, 0.2117647, 0, 1,
-1.828787, -0.3522808, -0.6181309, 1, 0.2156863, 0, 1,
-1.827015, -0.5833591, -3.659627, 1, 0.2235294, 0, 1,
-1.82551, 1.170146, -0.5372517, 1, 0.227451, 0, 1,
-1.821445, -0.444387, -3.134863, 1, 0.2352941, 0, 1,
-1.788844, 0.4040574, -2.028709, 1, 0.2392157, 0, 1,
-1.788199, 0.7558147, -1.867548, 1, 0.2470588, 0, 1,
-1.778702, -1.21935, -2.191518, 1, 0.2509804, 0, 1,
-1.76775, -0.3690856, -1.598271, 1, 0.2588235, 0, 1,
-1.76091, 0.272896, -0.7047603, 1, 0.2627451, 0, 1,
-1.758824, -0.4961504, -1.876058, 1, 0.2705882, 0, 1,
-1.758823, 0.4287477, -0.8284528, 1, 0.2745098, 0, 1,
-1.749255, -0.8786642, -3.462317, 1, 0.282353, 0, 1,
-1.745611, -0.376203, -2.456564, 1, 0.2862745, 0, 1,
-1.732505, 0.3935643, -0.4650729, 1, 0.2941177, 0, 1,
-1.73135, 0.2281851, -0.06211702, 1, 0.3019608, 0, 1,
-1.704005, -0.4282645, -1.182192, 1, 0.3058824, 0, 1,
-1.672066, -2.01776, -2.388453, 1, 0.3137255, 0, 1,
-1.666587, -0.02949485, -1.828975, 1, 0.3176471, 0, 1,
-1.645491, -1.788304, -1.731045, 1, 0.3254902, 0, 1,
-1.643828, -1.67709, -2.419054, 1, 0.3294118, 0, 1,
-1.641573, -0.04163894, -1.225388, 1, 0.3372549, 0, 1,
-1.641336, 0.7202165, -2.779547, 1, 0.3411765, 0, 1,
-1.640783, -1.478167, -2.138915, 1, 0.3490196, 0, 1,
-1.638679, 1.946006, -1.698655, 1, 0.3529412, 0, 1,
-1.630271, -0.5403759, -0.655784, 1, 0.3607843, 0, 1,
-1.614117, 0.02372887, -1.068047, 1, 0.3647059, 0, 1,
-1.588972, 1.224456, -2.353347, 1, 0.372549, 0, 1,
-1.586508, 0.1376379, -0.8092269, 1, 0.3764706, 0, 1,
-1.573817, -0.08256407, -1.928124, 1, 0.3843137, 0, 1,
-1.569118, -0.4778363, -1.697737, 1, 0.3882353, 0, 1,
-1.568788, -0.6934404, -2.911829, 1, 0.3960784, 0, 1,
-1.566271, 0.01427902, -0.4602168, 1, 0.4039216, 0, 1,
-1.565314, -0.6761581, -3.299671, 1, 0.4078431, 0, 1,
-1.539971, -0.2822664, -2.663342, 1, 0.4156863, 0, 1,
-1.533893, 1.153935, -1.580829, 1, 0.4196078, 0, 1,
-1.517005, 0.002449135, -1.926872, 1, 0.427451, 0, 1,
-1.495147, 0.8418261, -1.578399, 1, 0.4313726, 0, 1,
-1.494355, -1.006869, -1.437421, 1, 0.4392157, 0, 1,
-1.477173, 0.3657584, -2.198401, 1, 0.4431373, 0, 1,
-1.47666, -2.316628, -3.161519, 1, 0.4509804, 0, 1,
-1.472534, -0.3883463, -0.8491767, 1, 0.454902, 0, 1,
-1.461912, 1.04248, -2.549263, 1, 0.4627451, 0, 1,
-1.450697, -0.3565629, -0.9462254, 1, 0.4666667, 0, 1,
-1.45068, 0.6108943, -0.5466928, 1, 0.4745098, 0, 1,
-1.442642, -1.196844, -3.103591, 1, 0.4784314, 0, 1,
-1.435301, -0.4889049, -2.376046, 1, 0.4862745, 0, 1,
-1.435192, -1.163627, -2.791601, 1, 0.4901961, 0, 1,
-1.416127, -1.081471, -3.04286, 1, 0.4980392, 0, 1,
-1.414945, 0.3655317, -3.732593, 1, 0.5058824, 0, 1,
-1.414045, 1.875936, -0.7220846, 1, 0.509804, 0, 1,
-1.413631, 1.53649, -0.7076401, 1, 0.5176471, 0, 1,
-1.409516, 0.822826, -0.0750858, 1, 0.5215687, 0, 1,
-1.382831, -0.7531172, -0.8187509, 1, 0.5294118, 0, 1,
-1.382355, -0.9082177, -2.208345, 1, 0.5333334, 0, 1,
-1.375543, -0.2211706, -2.273903, 1, 0.5411765, 0, 1,
-1.371525, 0.8335665, -0.6470351, 1, 0.5450981, 0, 1,
-1.371442, 1.318926, -1.568433, 1, 0.5529412, 0, 1,
-1.367545, 0.2545895, -2.097073, 1, 0.5568628, 0, 1,
-1.367438, -2.920924, -2.625158, 1, 0.5647059, 0, 1,
-1.358236, 1.290007, 0.5085402, 1, 0.5686275, 0, 1,
-1.347677, 1.362649, -1.049131, 1, 0.5764706, 0, 1,
-1.339348, -0.4479922, -2.375398, 1, 0.5803922, 0, 1,
-1.335844, 0.5281912, -2.151877, 1, 0.5882353, 0, 1,
-1.335412, -0.5026683, -0.6801411, 1, 0.5921569, 0, 1,
-1.321914, -0.1932929, -0.5698653, 1, 0.6, 0, 1,
-1.310546, -1.149896, -2.561365, 1, 0.6078432, 0, 1,
-1.293463, 2.120527, -1.583316, 1, 0.6117647, 0, 1,
-1.285397, 0.2265302, -1.941394, 1, 0.6196079, 0, 1,
-1.275319, -0.3283635, -3.189022, 1, 0.6235294, 0, 1,
-1.268235, -0.5374495, -3.208806, 1, 0.6313726, 0, 1,
-1.260531, 0.1432979, -1.667216, 1, 0.6352941, 0, 1,
-1.258974, 2.044983, -0.6492367, 1, 0.6431373, 0, 1,
-1.257293, -0.09324729, -1.542154, 1, 0.6470588, 0, 1,
-1.239771, 0.2933401, -2.405979, 1, 0.654902, 0, 1,
-1.239259, -0.08024334, 1.429731, 1, 0.6588235, 0, 1,
-1.23585, 0.6197854, -1.512917, 1, 0.6666667, 0, 1,
-1.235573, 1.352593, -0.3803347, 1, 0.6705883, 0, 1,
-1.234672, 3.004451, -2.348902, 1, 0.6784314, 0, 1,
-1.231851, -0.3406273, -0.3762985, 1, 0.682353, 0, 1,
-1.229065, -0.5515916, -3.195001, 1, 0.6901961, 0, 1,
-1.226919, -1.16237, -2.303262, 1, 0.6941177, 0, 1,
-1.222795, -1.162499, -4.069678, 1, 0.7019608, 0, 1,
-1.222154, 0.1321724, -2.942567, 1, 0.7098039, 0, 1,
-1.21436, 1.477061, 0.637954, 1, 0.7137255, 0, 1,
-1.206984, -0.9036276, -2.694778, 1, 0.7215686, 0, 1,
-1.201895, 0.5370429, -1.657715, 1, 0.7254902, 0, 1,
-1.194538, -0.1407784, -0.4710458, 1, 0.7333333, 0, 1,
-1.19446, -0.5458796, -2.876856, 1, 0.7372549, 0, 1,
-1.193732, 3.092695, -0.6876383, 1, 0.7450981, 0, 1,
-1.185903, 1.708237, 1.04312, 1, 0.7490196, 0, 1,
-1.184007, 0.4646718, -1.742367, 1, 0.7568628, 0, 1,
-1.182776, 1.0288, 0.2230712, 1, 0.7607843, 0, 1,
-1.182146, 1.019137, -0.4370851, 1, 0.7686275, 0, 1,
-1.181048, 0.1819436, -5.111311, 1, 0.772549, 0, 1,
-1.17972, 0.912005, -1.912903, 1, 0.7803922, 0, 1,
-1.176165, 0.7170134, -0.9656278, 1, 0.7843137, 0, 1,
-1.158212, 1.339143, -1.474967, 1, 0.7921569, 0, 1,
-1.14593, -0.6789581, -1.930314, 1, 0.7960784, 0, 1,
-1.138604, 0.9482381, -0.8579979, 1, 0.8039216, 0, 1,
-1.133246, 0.5842332, 0.545487, 1, 0.8117647, 0, 1,
-1.132451, -0.903373, -1.304831, 1, 0.8156863, 0, 1,
-1.125782, 1.151977, -1.088853, 1, 0.8235294, 0, 1,
-1.121132, -0.1171266, -2.92621, 1, 0.827451, 0, 1,
-1.1112, 1.044247, -1.254808, 1, 0.8352941, 0, 1,
-1.110996, -0.08389333, 0.3675057, 1, 0.8392157, 0, 1,
-1.106799, -1.055309, -2.469197, 1, 0.8470588, 0, 1,
-1.103095, 0.9383588, -0.9401566, 1, 0.8509804, 0, 1,
-1.100561, 0.7929118, -0.9499414, 1, 0.8588235, 0, 1,
-1.093795, 0.4695071, -1.08584, 1, 0.8627451, 0, 1,
-1.09178, -0.9810684, -1.684366, 1, 0.8705882, 0, 1,
-1.087536, -0.05424449, -3.598463, 1, 0.8745098, 0, 1,
-1.087273, 1.351913, -2.113883, 1, 0.8823529, 0, 1,
-1.085389, 0.6158581, -0.8395736, 1, 0.8862745, 0, 1,
-1.085112, 0.07812502, -1.291046, 1, 0.8941177, 0, 1,
-1.082377, 0.02241144, -3.273454, 1, 0.8980392, 0, 1,
-1.076556, -1.091922, -2.428059, 1, 0.9058824, 0, 1,
-1.057983, -0.7170334, -0.8107823, 1, 0.9137255, 0, 1,
-1.055791, -0.9241874, -3.431915, 1, 0.9176471, 0, 1,
-1.052784, 1.029887, 1.153211, 1, 0.9254902, 0, 1,
-1.04687, 0.3384377, -2.287738, 1, 0.9294118, 0, 1,
-1.033146, 1.692479, -0.02394087, 1, 0.9372549, 0, 1,
-1.032114, -0.2496397, -2.186327, 1, 0.9411765, 0, 1,
-1.03007, 1.760237, 0.8461925, 1, 0.9490196, 0, 1,
-1.026526, -0.7426074, -1.185787, 1, 0.9529412, 0, 1,
-1.022192, -0.3665422, -2.866984, 1, 0.9607843, 0, 1,
-1.022078, -0.5302235, -1.380622, 1, 0.9647059, 0, 1,
-1.019413, 0.4844689, -0.01488841, 1, 0.972549, 0, 1,
-1.019282, 1.673195, 0.5604456, 1, 0.9764706, 0, 1,
-1.006802, -0.7927971, -2.452778, 1, 0.9843137, 0, 1,
-1.005284, 0.1158533, -1.488376, 1, 0.9882353, 0, 1,
-1.001572, -1.523558, -2.353056, 1, 0.9960784, 0, 1,
-0.9986021, 1.292328, -2.067647, 0.9960784, 1, 0, 1,
-0.9822203, 0.6718191, 0.2544485, 0.9921569, 1, 0, 1,
-0.9742425, 0.584996, -0.7382894, 0.9843137, 1, 0, 1,
-0.9734221, -0.4383227, -1.762712, 0.9803922, 1, 0, 1,
-0.9725544, 1.418757, -1.671035, 0.972549, 1, 0, 1,
-0.964331, -0.5215864, -0.3632017, 0.9686275, 1, 0, 1,
-0.9535753, 0.1385347, -1.878459, 0.9607843, 1, 0, 1,
-0.9403841, 0.4955541, -0.6594323, 0.9568627, 1, 0, 1,
-0.9358505, 0.4176663, -2.050245, 0.9490196, 1, 0, 1,
-0.9350665, 0.7169704, -0.6398622, 0.945098, 1, 0, 1,
-0.9331807, -0.6240038, -1.21102, 0.9372549, 1, 0, 1,
-0.9324545, 0.6171904, -1.269407, 0.9333333, 1, 0, 1,
-0.9300082, 0.4820096, -0.9756653, 0.9254902, 1, 0, 1,
-0.9222875, -0.9432592, -3.083593, 0.9215686, 1, 0, 1,
-0.9221609, 1.333903, 1.235757, 0.9137255, 1, 0, 1,
-0.9180173, -1.362102, -1.840019, 0.9098039, 1, 0, 1,
-0.916344, 0.5740114, -1.964133, 0.9019608, 1, 0, 1,
-0.9125677, -0.5354518, -3.996498, 0.8941177, 1, 0, 1,
-0.908222, -2.322238, -0.5630224, 0.8901961, 1, 0, 1,
-0.9070264, -0.3533906, -2.771011, 0.8823529, 1, 0, 1,
-0.9042611, -0.2325182, -1.958633, 0.8784314, 1, 0, 1,
-0.8997511, 0.2043879, -1.493348, 0.8705882, 1, 0, 1,
-0.8921786, -0.3593054, -3.541392, 0.8666667, 1, 0, 1,
-0.8870676, 1.100992, -1.608101, 0.8588235, 1, 0, 1,
-0.8867419, -2.326651, -3.440255, 0.854902, 1, 0, 1,
-0.8816386, 0.202732, -2.026841, 0.8470588, 1, 0, 1,
-0.8741235, -0.9738783, -2.937018, 0.8431373, 1, 0, 1,
-0.8707164, 1.245898, -2.612688, 0.8352941, 1, 0, 1,
-0.8645129, 0.04904259, -2.783065, 0.8313726, 1, 0, 1,
-0.8540681, 0.3638524, -2.109006, 0.8235294, 1, 0, 1,
-0.847068, 0.4647597, -2.268132, 0.8196079, 1, 0, 1,
-0.8444218, 0.3213111, -1.353472, 0.8117647, 1, 0, 1,
-0.8422054, -1.806779, -1.788108, 0.8078431, 1, 0, 1,
-0.8401542, 1.857586, -0.2509668, 0.8, 1, 0, 1,
-0.8401256, 0.391889, -2.403852, 0.7921569, 1, 0, 1,
-0.837925, -0.9933704, -1.527842, 0.7882353, 1, 0, 1,
-0.8355507, -1.015266, -0.7992985, 0.7803922, 1, 0, 1,
-0.8331455, -2.530589, -2.901181, 0.7764706, 1, 0, 1,
-0.8270544, 1.428524, -1.703555, 0.7686275, 1, 0, 1,
-0.8236453, 0.2097414, -1.072683, 0.7647059, 1, 0, 1,
-0.8157431, -0.8900446, -2.260363, 0.7568628, 1, 0, 1,
-0.8112851, -0.7939836, -0.8638452, 0.7529412, 1, 0, 1,
-0.8103665, 0.867067, -0.5561379, 0.7450981, 1, 0, 1,
-0.8102086, 1.605166, -0.1860082, 0.7411765, 1, 0, 1,
-0.8006015, 0.959223, -0.373593, 0.7333333, 1, 0, 1,
-0.7966813, -0.7119517, -2.486795, 0.7294118, 1, 0, 1,
-0.7857703, -3.043218, -2.769645, 0.7215686, 1, 0, 1,
-0.7740941, 1.171713, 0.04781817, 0.7176471, 1, 0, 1,
-0.7665075, -1.027009, -3.713737, 0.7098039, 1, 0, 1,
-0.7649975, 0.05918778, -0.8053347, 0.7058824, 1, 0, 1,
-0.7608173, -0.6257806, -5.10681, 0.6980392, 1, 0, 1,
-0.759452, 0.2786825, -0.9252613, 0.6901961, 1, 0, 1,
-0.7523893, 0.7638394, -0.7724614, 0.6862745, 1, 0, 1,
-0.7515483, 1.541848, -2.50918, 0.6784314, 1, 0, 1,
-0.7462503, -1.117702, -4.839089, 0.6745098, 1, 0, 1,
-0.7457275, 1.809506, -0.9119766, 0.6666667, 1, 0, 1,
-0.7432992, -0.4198304, -1.582849, 0.6627451, 1, 0, 1,
-0.741633, -1.917676, -3.533993, 0.654902, 1, 0, 1,
-0.7392006, 0.009572121, -3.344451, 0.6509804, 1, 0, 1,
-0.7347183, -1.618026, -2.881665, 0.6431373, 1, 0, 1,
-0.7338411, 0.4521445, -2.550541, 0.6392157, 1, 0, 1,
-0.7328486, 1.057571, -0.123909, 0.6313726, 1, 0, 1,
-0.731213, 0.8840255, 0.2278589, 0.627451, 1, 0, 1,
-0.7308139, 0.4441257, -1.613233, 0.6196079, 1, 0, 1,
-0.7240615, 0.2063209, -1.976621, 0.6156863, 1, 0, 1,
-0.7237445, -0.09704191, -2.694856, 0.6078432, 1, 0, 1,
-0.7218028, 0.6269398, 0.4999351, 0.6039216, 1, 0, 1,
-0.7192036, -1.4995, -2.113893, 0.5960785, 1, 0, 1,
-0.7177401, -0.4363482, -2.451033, 0.5882353, 1, 0, 1,
-0.714189, 1.082361, -1.221207, 0.5843138, 1, 0, 1,
-0.7126577, 1.416636, 0.3956558, 0.5764706, 1, 0, 1,
-0.7107873, 1.086646, -0.5348986, 0.572549, 1, 0, 1,
-0.7085134, -0.371046, -2.010222, 0.5647059, 1, 0, 1,
-0.7080662, -0.3917471, -3.686462, 0.5607843, 1, 0, 1,
-0.7076656, -0.8658076, -2.246204, 0.5529412, 1, 0, 1,
-0.7073883, -0.6679464, -1.013064, 0.5490196, 1, 0, 1,
-0.7053655, 2.201362, -0.8938013, 0.5411765, 1, 0, 1,
-0.7019522, 0.3767215, -1.02186, 0.5372549, 1, 0, 1,
-0.698441, 1.655519, -0.3168663, 0.5294118, 1, 0, 1,
-0.6970776, 1.227451, -0.4240343, 0.5254902, 1, 0, 1,
-0.6937754, -0.3787211, -2.388835, 0.5176471, 1, 0, 1,
-0.692364, 0.8851351, -0.8765897, 0.5137255, 1, 0, 1,
-0.6853462, 3.310047, -0.1165103, 0.5058824, 1, 0, 1,
-0.6836691, -1.345003, -2.183852, 0.5019608, 1, 0, 1,
-0.6781984, -0.7722738, -2.632818, 0.4941176, 1, 0, 1,
-0.6759446, 2.053257, -1.27301, 0.4862745, 1, 0, 1,
-0.6712295, 0.5081272, -0.271696, 0.4823529, 1, 0, 1,
-0.6677362, -1.952058, -2.496588, 0.4745098, 1, 0, 1,
-0.6665722, 0.3363465, -0.3958975, 0.4705882, 1, 0, 1,
-0.6660172, 0.3135346, -0.8709908, 0.4627451, 1, 0, 1,
-0.6639188, -0.3959797, -3.285782, 0.4588235, 1, 0, 1,
-0.6636018, -0.4317194, -4.502972, 0.4509804, 1, 0, 1,
-0.6597023, -0.6902738, -1.80821, 0.4470588, 1, 0, 1,
-0.6578458, 0.2988051, -1.639377, 0.4392157, 1, 0, 1,
-0.6539575, 0.9036465, -2.400661, 0.4352941, 1, 0, 1,
-0.6523575, 0.7570084, 1.195773, 0.427451, 1, 0, 1,
-0.6523287, 1.29463, -0.8240002, 0.4235294, 1, 0, 1,
-0.652253, -0.8692391, -2.414042, 0.4156863, 1, 0, 1,
-0.6503977, 0.4365457, -1.112902, 0.4117647, 1, 0, 1,
-0.6475455, 0.8685919, -2.924493, 0.4039216, 1, 0, 1,
-0.6445265, 0.5896454, -0.3422142, 0.3960784, 1, 0, 1,
-0.644109, -0.1939604, -1.540429, 0.3921569, 1, 0, 1,
-0.6377312, -2.484755, -3.189061, 0.3843137, 1, 0, 1,
-0.6321495, 1.420725, -0.8717409, 0.3803922, 1, 0, 1,
-0.6240007, -1.067162, -3.538402, 0.372549, 1, 0, 1,
-0.6231884, -0.413722, -2.698156, 0.3686275, 1, 0, 1,
-0.6193849, -1.419472, -2.754988, 0.3607843, 1, 0, 1,
-0.6084301, -1.341865, -2.584288, 0.3568628, 1, 0, 1,
-0.603529, -0.947661, -1.182696, 0.3490196, 1, 0, 1,
-0.6025099, 0.2238532, -1.854982, 0.345098, 1, 0, 1,
-0.6021192, -0.7448512, -2.927047, 0.3372549, 1, 0, 1,
-0.5961396, -1.919336, -2.617267, 0.3333333, 1, 0, 1,
-0.5950411, -0.4893917, -1.486344, 0.3254902, 1, 0, 1,
-0.5944688, 0.1289885, -2.18706, 0.3215686, 1, 0, 1,
-0.5902627, 0.3070432, -1.000424, 0.3137255, 1, 0, 1,
-0.5895255, 0.7822563, 1.128919, 0.3098039, 1, 0, 1,
-0.5894095, -0.7929019, -2.273624, 0.3019608, 1, 0, 1,
-0.5847699, -0.3515856, -3.165833, 0.2941177, 1, 0, 1,
-0.5826505, -1.136162, -3.517558, 0.2901961, 1, 0, 1,
-0.5814707, -1.137951, -2.636578, 0.282353, 1, 0, 1,
-0.5808868, -1.299869, -3.468319, 0.2784314, 1, 0, 1,
-0.5784497, -1.253408, -1.911502, 0.2705882, 1, 0, 1,
-0.5781339, 1.089936, 1.281052, 0.2666667, 1, 0, 1,
-0.577336, -1.131977, -1.365776, 0.2588235, 1, 0, 1,
-0.5492517, -1.301393, -2.472307, 0.254902, 1, 0, 1,
-0.5474422, -0.04123408, -1.684123, 0.2470588, 1, 0, 1,
-0.5450168, 0.0235987, -2.234674, 0.2431373, 1, 0, 1,
-0.5423226, -1.212931, -3.50575, 0.2352941, 1, 0, 1,
-0.5394868, 1.057283, -0.3592806, 0.2313726, 1, 0, 1,
-0.537944, -1.192958, -2.968905, 0.2235294, 1, 0, 1,
-0.5311016, -0.1624848, -1.963162, 0.2196078, 1, 0, 1,
-0.5310376, -0.2415025, -3.064582, 0.2117647, 1, 0, 1,
-0.5264658, -0.9139615, -2.692546, 0.2078431, 1, 0, 1,
-0.5224096, 0.610759, -0.7677381, 0.2, 1, 0, 1,
-0.5185396, -1.618013, -0.8821113, 0.1921569, 1, 0, 1,
-0.5140417, -1.687857, -2.293016, 0.1882353, 1, 0, 1,
-0.5087474, -0.8783023, -4.014538, 0.1803922, 1, 0, 1,
-0.5086797, -0.5066707, -3.891413, 0.1764706, 1, 0, 1,
-0.5083491, -0.06877202, -2.276943, 0.1686275, 1, 0, 1,
-0.5003907, -0.329087, -2.611149, 0.1647059, 1, 0, 1,
-0.4954763, 1.572115, -0.7421027, 0.1568628, 1, 0, 1,
-0.4948678, -1.082617, -2.431239, 0.1529412, 1, 0, 1,
-0.4843825, 1.161101, -1.482687, 0.145098, 1, 0, 1,
-0.4821332, -0.5991282, -3.019132, 0.1411765, 1, 0, 1,
-0.4757035, -1.587822, -1.161219, 0.1333333, 1, 0, 1,
-0.4732303, -2.239923, -1.86067, 0.1294118, 1, 0, 1,
-0.4715923, -1.148173, -3.925608, 0.1215686, 1, 0, 1,
-0.4684226, 0.02882072, -1.71169, 0.1176471, 1, 0, 1,
-0.4674757, 0.8435214, -0.674825, 0.1098039, 1, 0, 1,
-0.466568, 0.4851155, -1.220137, 0.1058824, 1, 0, 1,
-0.4640249, -0.9038637, -2.078703, 0.09803922, 1, 0, 1,
-0.4612478, -0.3610763, -1.016043, 0.09019608, 1, 0, 1,
-0.4579116, -1.457059, -3.270402, 0.08627451, 1, 0, 1,
-0.4575777, -1.913194, -0.9348404, 0.07843138, 1, 0, 1,
-0.4541817, -1.12524, -1.884422, 0.07450981, 1, 0, 1,
-0.4530146, 1.442605, -1.488365, 0.06666667, 1, 0, 1,
-0.4516889, 2.214185, -0.005593124, 0.0627451, 1, 0, 1,
-0.4499259, -0.157109, -0.9782895, 0.05490196, 1, 0, 1,
-0.4453962, 1.013016, -0.4216648, 0.05098039, 1, 0, 1,
-0.4423092, -0.4052546, -1.596102, 0.04313726, 1, 0, 1,
-0.4418715, -0.9679825, -2.092695, 0.03921569, 1, 0, 1,
-0.4392858, 0.1665877, -4.276645, 0.03137255, 1, 0, 1,
-0.4348185, -0.5594525, -3.276948, 0.02745098, 1, 0, 1,
-0.4340833, 0.7923322, -0.0910553, 0.01960784, 1, 0, 1,
-0.4333038, -1.120065, -3.49242, 0.01568628, 1, 0, 1,
-0.4332989, 1.778985, 0.7464072, 0.007843138, 1, 0, 1,
-0.4319331, 1.823673, -0.2496564, 0.003921569, 1, 0, 1,
-0.4319267, -0.8072191, -3.577964, 0, 1, 0.003921569, 1,
-0.4306625, -1.064384, -4.391701, 0, 1, 0.01176471, 1,
-0.4281334, 1.719141, -0.1605342, 0, 1, 0.01568628, 1,
-0.4259014, 0.06353178, 0.9217867, 0, 1, 0.02352941, 1,
-0.4256932, 0.03532207, -1.169598, 0, 1, 0.02745098, 1,
-0.4246207, 0.2544383, -2.089999, 0, 1, 0.03529412, 1,
-0.420193, 1.263397, -0.6764495, 0, 1, 0.03921569, 1,
-0.4176951, 0.887242, -1.440689, 0, 1, 0.04705882, 1,
-0.4171028, 0.1974719, -0.6953384, 0, 1, 0.05098039, 1,
-0.4162041, 1.28323, -0.7960357, 0, 1, 0.05882353, 1,
-0.4132262, -0.4929085, -2.684717, 0, 1, 0.0627451, 1,
-0.4125274, -2.009183, -2.001458, 0, 1, 0.07058824, 1,
-0.4054688, 0.8752443, 0.4178965, 0, 1, 0.07450981, 1,
-0.4029734, 0.9993408, 1.083853, 0, 1, 0.08235294, 1,
-0.402295, 2.550026, 0.2390731, 0, 1, 0.08627451, 1,
-0.3979526, -0.7332034, -1.630711, 0, 1, 0.09411765, 1,
-0.3968931, 1.253155, -1.226186, 0, 1, 0.1019608, 1,
-0.3933948, 1.197035, 0.8488006, 0, 1, 0.1058824, 1,
-0.3901186, 0.03035625, -1.405044, 0, 1, 0.1137255, 1,
-0.3886747, -1.457221, -3.636395, 0, 1, 0.1176471, 1,
-0.381005, 0.07078124, -1.76772, 0, 1, 0.1254902, 1,
-0.3730912, -0.5364843, -2.026273, 0, 1, 0.1294118, 1,
-0.3667509, 0.04247008, -0.7575332, 0, 1, 0.1372549, 1,
-0.3665734, -0.5375649, -0.5757403, 0, 1, 0.1411765, 1,
-0.3656663, 1.022293, 0.9128057, 0, 1, 0.1490196, 1,
-0.3618355, -0.4913575, -2.719894, 0, 1, 0.1529412, 1,
-0.3600414, -0.2185354, -1.946383, 0, 1, 0.1607843, 1,
-0.3487813, 0.6649287, -1.513757, 0, 1, 0.1647059, 1,
-0.3485594, 0.1191778, -1.601185, 0, 1, 0.172549, 1,
-0.3449064, 0.3112925, -0.2279146, 0, 1, 0.1764706, 1,
-0.3427462, -0.8621584, -5.208934, 0, 1, 0.1843137, 1,
-0.3426901, -0.7651776, -2.060804, 0, 1, 0.1882353, 1,
-0.3322389, 0.374649, -0.1749081, 0, 1, 0.1960784, 1,
-0.3253226, -1.432059, -3.190794, 0, 1, 0.2039216, 1,
-0.3249331, 0.1910436, 0.01213675, 0, 1, 0.2078431, 1,
-0.3245875, -0.6030291, -2.081794, 0, 1, 0.2156863, 1,
-0.3244946, -0.04217716, 0.004506249, 0, 1, 0.2196078, 1,
-0.3236009, 1.691032, 0.889782, 0, 1, 0.227451, 1,
-0.3156438, 0.5401009, -0.3402343, 0, 1, 0.2313726, 1,
-0.3094639, -0.9523761, -2.630652, 0, 1, 0.2392157, 1,
-0.3044621, -1.223567, -3.568582, 0, 1, 0.2431373, 1,
-0.3043939, -0.6456794, -2.942756, 0, 1, 0.2509804, 1,
-0.3035733, -0.4766939, -2.445317, 0, 1, 0.254902, 1,
-0.302105, -0.5782134, -2.257635, 0, 1, 0.2627451, 1,
-0.3012634, 0.292916, 0.724569, 0, 1, 0.2666667, 1,
-0.3002889, -0.1590095, -3.814416, 0, 1, 0.2745098, 1,
-0.2937005, 0.2424084, 1.255945, 0, 1, 0.2784314, 1,
-0.2880502, -0.3037551, -1.054364, 0, 1, 0.2862745, 1,
-0.2850556, -0.4104857, 0.3313937, 0, 1, 0.2901961, 1,
-0.2826926, 1.424983, -0.05862276, 0, 1, 0.2980392, 1,
-0.2809793, 1.418421, -1.386759, 0, 1, 0.3058824, 1,
-0.2794071, -1.162847, -1.395972, 0, 1, 0.3098039, 1,
-0.2787676, 0.1584144, -3.218659, 0, 1, 0.3176471, 1,
-0.2777466, 1.087557, 1.322359, 0, 1, 0.3215686, 1,
-0.2775327, -0.01587917, -0.8598859, 0, 1, 0.3294118, 1,
-0.2763494, 0.2704058, -0.8705396, 0, 1, 0.3333333, 1,
-0.2678337, 1.140411, -0.0829386, 0, 1, 0.3411765, 1,
-0.2609845, 1.246053, -1.519921, 0, 1, 0.345098, 1,
-0.2525015, 2.224362, 0.3806934, 0, 1, 0.3529412, 1,
-0.2521843, 1.206632, -0.04207192, 0, 1, 0.3568628, 1,
-0.2475156, 1.04116, 0.2428409, 0, 1, 0.3647059, 1,
-0.2463511, -0.9281429, -2.268252, 0, 1, 0.3686275, 1,
-0.2459339, 0.8401424, -0.6979129, 0, 1, 0.3764706, 1,
-0.2453846, 0.3384008, -2.5267, 0, 1, 0.3803922, 1,
-0.2447695, 0.2178082, -1.56855, 0, 1, 0.3882353, 1,
-0.244716, 0.3370572, -1.319636, 0, 1, 0.3921569, 1,
-0.2417001, 1.117422, 0.05667973, 0, 1, 0.4, 1,
-0.2281198, 0.3435334, 0.04867079, 0, 1, 0.4078431, 1,
-0.2253, 0.3791652, -0.06752499, 0, 1, 0.4117647, 1,
-0.2169662, -0.8784866, -2.375665, 0, 1, 0.4196078, 1,
-0.2160684, -0.3396679, -2.814286, 0, 1, 0.4235294, 1,
-0.21488, 0.0837241, 0.378711, 0, 1, 0.4313726, 1,
-0.2146674, -1.318369, -4.602588, 0, 1, 0.4352941, 1,
-0.2144951, 1.119199, 0.8040947, 0, 1, 0.4431373, 1,
-0.2110747, 1.919383, 0.4284074, 0, 1, 0.4470588, 1,
-0.2107568, -0.7377095, -3.126642, 0, 1, 0.454902, 1,
-0.2084918, 1.629001, 1.311065, 0, 1, 0.4588235, 1,
-0.2067542, -1.127267, -3.634835, 0, 1, 0.4666667, 1,
-0.2060501, -0.5471836, -1.880857, 0, 1, 0.4705882, 1,
-0.2039166, -0.6260431, -3.582699, 0, 1, 0.4784314, 1,
-0.2023418, -0.8060498, -1.275912, 0, 1, 0.4823529, 1,
-0.2004413, 1.058223, 0.004267804, 0, 1, 0.4901961, 1,
-0.1877296, -0.7046173, -2.196702, 0, 1, 0.4941176, 1,
-0.1854003, 0.03011767, -1.078639, 0, 1, 0.5019608, 1,
-0.1853229, -0.04103284, -0.9553328, 0, 1, 0.509804, 1,
-0.183773, -0.22466, -1.630363, 0, 1, 0.5137255, 1,
-0.17877, -2.375825, -4.892388, 0, 1, 0.5215687, 1,
-0.1675071, -1.001122, -1.148212, 0, 1, 0.5254902, 1,
-0.1662319, -0.4189648, -3.893882, 0, 1, 0.5333334, 1,
-0.1619129, 0.5999917, -1.033357, 0, 1, 0.5372549, 1,
-0.1601698, 1.13656, -0.9958655, 0, 1, 0.5450981, 1,
-0.1565799, -0.2320361, -1.502552, 0, 1, 0.5490196, 1,
-0.150812, 0.9830414, -1.60346, 0, 1, 0.5568628, 1,
-0.1440398, 0.3920879, -0.007215376, 0, 1, 0.5607843, 1,
-0.1436578, 1.274924, 0.8770493, 0, 1, 0.5686275, 1,
-0.1313887, -0.7079856, -2.238995, 0, 1, 0.572549, 1,
-0.1310994, 0.4009203, -0.22644, 0, 1, 0.5803922, 1,
-0.1209122, -0.4449945, -1.719875, 0, 1, 0.5843138, 1,
-0.1181902, 0.6581085, -1.055768, 0, 1, 0.5921569, 1,
-0.1135309, -0.670507, -2.811212, 0, 1, 0.5960785, 1,
-0.111278, 1.499409, 0.3963853, 0, 1, 0.6039216, 1,
-0.1101902, -0.3239049, -3.881383, 0, 1, 0.6117647, 1,
-0.1079597, 0.2045078, 0.4233642, 0, 1, 0.6156863, 1,
-0.1077999, 0.2048468, 0.03440746, 0, 1, 0.6235294, 1,
-0.1010518, 0.8167907, 0.4139397, 0, 1, 0.627451, 1,
-0.09660244, 0.4287492, 0.519667, 0, 1, 0.6352941, 1,
-0.09484747, -0.1223056, -3.362767, 0, 1, 0.6392157, 1,
-0.09106337, 0.8959294, -1.113504, 0, 1, 0.6470588, 1,
-0.09044953, 1.296524, -1.271649, 0, 1, 0.6509804, 1,
-0.09026319, 0.5082724, 1.557611, 0, 1, 0.6588235, 1,
-0.08860311, 1.318292, -1.252603, 0, 1, 0.6627451, 1,
-0.08832102, -1.894632, -5.339381, 0, 1, 0.6705883, 1,
-0.08746608, 0.2225709, -2.407189, 0, 1, 0.6745098, 1,
-0.08568526, 1.079191, 0.2075458, 0, 1, 0.682353, 1,
-0.08333943, -0.2527726, -2.542273, 0, 1, 0.6862745, 1,
-0.08251781, -0.6469024, -4.433154, 0, 1, 0.6941177, 1,
-0.07571226, 0.367353, 0.2896375, 0, 1, 0.7019608, 1,
-0.07543051, -1.222565, -3.574643, 0, 1, 0.7058824, 1,
-0.07404594, -0.702934, -3.362523, 0, 1, 0.7137255, 1,
-0.07236444, -0.8321512, -2.375992, 0, 1, 0.7176471, 1,
-0.06640896, -1.547955, -4.50256, 0, 1, 0.7254902, 1,
-0.06600247, -0.5550694, -1.781244, 0, 1, 0.7294118, 1,
-0.06450613, 0.1633747, 0.7245259, 0, 1, 0.7372549, 1,
-0.0637702, 0.4908935, -0.2794705, 0, 1, 0.7411765, 1,
-0.06065506, 1.954679, -0.03002721, 0, 1, 0.7490196, 1,
-0.05968341, -0.8018605, -3.992162, 0, 1, 0.7529412, 1,
-0.05126474, 0.7074666, 0.4659909, 0, 1, 0.7607843, 1,
-0.05073541, -0.8756709, -2.928237, 0, 1, 0.7647059, 1,
-0.04902396, -1.009222, -3.000945, 0, 1, 0.772549, 1,
-0.04411328, -0.1828564, -2.318893, 0, 1, 0.7764706, 1,
-0.04323775, 1.41793, -0.4709677, 0, 1, 0.7843137, 1,
-0.04278632, -1.044028, -3.837096, 0, 1, 0.7882353, 1,
-0.04246812, -0.8606458, -3.957272, 0, 1, 0.7960784, 1,
-0.04076376, -0.2368296, -1.661279, 0, 1, 0.8039216, 1,
-0.03737425, 0.4807856, 1.048577, 0, 1, 0.8078431, 1,
-0.03704963, 0.5244526, -0.0959128, 0, 1, 0.8156863, 1,
-0.0362058, 2.552995, -0.854043, 0, 1, 0.8196079, 1,
-0.03559967, -0.5824237, -1.717844, 0, 1, 0.827451, 1,
-0.03489097, 0.5243302, 1.022116, 0, 1, 0.8313726, 1,
-0.03403276, -0.4406725, -1.364156, 0, 1, 0.8392157, 1,
-0.03388776, -0.6756232, -2.628986, 0, 1, 0.8431373, 1,
-0.03316343, -0.6373047, -3.133268, 0, 1, 0.8509804, 1,
-0.02917672, -0.1635485, -4.389632, 0, 1, 0.854902, 1,
-0.02722152, 0.627141, 0.7146021, 0, 1, 0.8627451, 1,
-0.02030071, -1.719914, -1.445598, 0, 1, 0.8666667, 1,
-0.01315983, -1.155881, -3.69598, 0, 1, 0.8745098, 1,
-0.01083235, 0.9471344, 1.802558, 0, 1, 0.8784314, 1,
-0.00969955, -0.7795957, -3.92153, 0, 1, 0.8862745, 1,
-0.008692172, -2.287939, -3.402509, 0, 1, 0.8901961, 1,
-0.008287128, -0.1103307, -2.985406, 0, 1, 0.8980392, 1,
-0.003951847, -0.5837359, -1.427857, 0, 1, 0.9058824, 1,
-0.000789627, -0.7812724, -2.107517, 0, 1, 0.9098039, 1,
0.000155416, -0.732625, 3.884905, 0, 1, 0.9176471, 1,
0.004394822, 0.9940962, 1.203462, 0, 1, 0.9215686, 1,
0.00478753, 1.704853, -1.178859, 0, 1, 0.9294118, 1,
0.007328061, 2.115358, -2.127687, 0, 1, 0.9333333, 1,
0.008592078, 0.8944944, 1.115291, 0, 1, 0.9411765, 1,
0.01044634, 2.40565, -0.7371627, 0, 1, 0.945098, 1,
0.01188415, -0.03214622, 1.656492, 0, 1, 0.9529412, 1,
0.01266134, -1.494442, 1.333002, 0, 1, 0.9568627, 1,
0.02154033, -0.4299553, 3.02413, 0, 1, 0.9647059, 1,
0.02268413, 0.6603331, 1.909335, 0, 1, 0.9686275, 1,
0.03636239, 3.210533, 1.223109, 0, 1, 0.9764706, 1,
0.03815972, -0.7082899, 2.61293, 0, 1, 0.9803922, 1,
0.04060996, -0.6948887, 5.004837, 0, 1, 0.9882353, 1,
0.04634082, -0.7939808, 2.558491, 0, 1, 0.9921569, 1,
0.04787105, 0.09882472, 1.687046, 0, 1, 1, 1,
0.05213413, -0.2541804, 0.2521651, 0, 0.9921569, 1, 1,
0.05576975, -0.2349548, -0.07710321, 0, 0.9882353, 1, 1,
0.05895278, -0.7790583, 4.059865, 0, 0.9803922, 1, 1,
0.05914757, -0.4016665, 2.360605, 0, 0.9764706, 1, 1,
0.0651112, -1.281963, 2.067056, 0, 0.9686275, 1, 1,
0.065899, -0.9556175, 1.162843, 0, 0.9647059, 1, 1,
0.0719808, -0.04664631, 1.128417, 0, 0.9568627, 1, 1,
0.0774372, 0.4709682, 1.725162, 0, 0.9529412, 1, 1,
0.08246673, 0.266003, 2.124689, 0, 0.945098, 1, 1,
0.08337107, 0.3318771, 3.163998, 0, 0.9411765, 1, 1,
0.084993, 0.04754392, 1.342581, 0, 0.9333333, 1, 1,
0.09037025, -0.3909322, 4.555076, 0, 0.9294118, 1, 1,
0.09326436, -0.513526, 4.215007, 0, 0.9215686, 1, 1,
0.09957039, 0.1457276, -0.3614741, 0, 0.9176471, 1, 1,
0.1006419, 1.28938, 0.7066277, 0, 0.9098039, 1, 1,
0.1031723, -0.1052498, 1.385883, 0, 0.9058824, 1, 1,
0.1085421, -1.213809, 2.973768, 0, 0.8980392, 1, 1,
0.1098598, -0.6567077, 3.172001, 0, 0.8901961, 1, 1,
0.1111822, 1.000866, 1.62589, 0, 0.8862745, 1, 1,
0.1148773, 1.274921, 1.144959, 0, 0.8784314, 1, 1,
0.1155414, 0.3340998, -1.179601, 0, 0.8745098, 1, 1,
0.1182648, -0.4898778, 2.919942, 0, 0.8666667, 1, 1,
0.118321, 0.875308, 0.1089094, 0, 0.8627451, 1, 1,
0.1186009, -0.9838632, 1.325953, 0, 0.854902, 1, 1,
0.1197772, 0.05559388, 1.529841, 0, 0.8509804, 1, 1,
0.1226576, -0.06162296, 2.609737, 0, 0.8431373, 1, 1,
0.1259009, -0.7774425, 3.725374, 0, 0.8392157, 1, 1,
0.1282818, 1.359535, 0.6739927, 0, 0.8313726, 1, 1,
0.1300844, -1.087724, 1.960021, 0, 0.827451, 1, 1,
0.1337557, 0.1564551, -0.628428, 0, 0.8196079, 1, 1,
0.13672, -0.6290816, 3.457034, 0, 0.8156863, 1, 1,
0.1376851, 0.9317744, 0.1846623, 0, 0.8078431, 1, 1,
0.1408021, 0.8263142, -0.8233231, 0, 0.8039216, 1, 1,
0.1441182, 0.1194909, 0.2868396, 0, 0.7960784, 1, 1,
0.1469723, 0.09057669, -0.04187877, 0, 0.7882353, 1, 1,
0.1479283, 0.2538982, 1.75317, 0, 0.7843137, 1, 1,
0.1481246, -1.696557, 1.695694, 0, 0.7764706, 1, 1,
0.1488502, -0.4154028, 2.843728, 0, 0.772549, 1, 1,
0.1514279, 1.935659, -1.322549, 0, 0.7647059, 1, 1,
0.1531753, -0.9789816, 1.167696, 0, 0.7607843, 1, 1,
0.1563873, 0.9467918, 0.08802879, 0, 0.7529412, 1, 1,
0.1594756, 0.2025557, -0.7919095, 0, 0.7490196, 1, 1,
0.160464, -0.1613339, 2.847073, 0, 0.7411765, 1, 1,
0.1626247, -1.816466, 4.647954, 0, 0.7372549, 1, 1,
0.162877, 1.074207, -2.286972, 0, 0.7294118, 1, 1,
0.1647849, 0.5169873, -1.065209, 0, 0.7254902, 1, 1,
0.1649989, 0.684933, -0.7267145, 0, 0.7176471, 1, 1,
0.1765979, -0.001417725, 1.065498, 0, 0.7137255, 1, 1,
0.1834014, 1.634318, 1.050409, 0, 0.7058824, 1, 1,
0.1836005, 2.028786, 0.0006833362, 0, 0.6980392, 1, 1,
0.1838803, 0.1160159, 1.047657, 0, 0.6941177, 1, 1,
0.1847804, -1.68184, 4.059696, 0, 0.6862745, 1, 1,
0.1893614, 0.3902769, 1.614782, 0, 0.682353, 1, 1,
0.1921712, -1.783184, 4.147881, 0, 0.6745098, 1, 1,
0.1930647, 0.5460424, 1.231813, 0, 0.6705883, 1, 1,
0.1979966, 0.0565639, 1.934707, 0, 0.6627451, 1, 1,
0.2000664, 2.159024, -2.07973, 0, 0.6588235, 1, 1,
0.202319, -1.373154, 2.962305, 0, 0.6509804, 1, 1,
0.2063746, -1.011565, 3.295874, 0, 0.6470588, 1, 1,
0.2138904, -0.9594534, 2.50352, 0, 0.6392157, 1, 1,
0.2160372, 0.2871057, 0.3629299, 0, 0.6352941, 1, 1,
0.2172019, 1.167337, 1.424935, 0, 0.627451, 1, 1,
0.2223283, 1.292152, -0.5907356, 0, 0.6235294, 1, 1,
0.2247289, 0.2971225, 0.4156028, 0, 0.6156863, 1, 1,
0.226228, -0.9547578, 3.196352, 0, 0.6117647, 1, 1,
0.2274541, 0.6383992, 0.7568998, 0, 0.6039216, 1, 1,
0.2315907, -2.230098, 3.714401, 0, 0.5960785, 1, 1,
0.2316261, 0.3314549, 0.3267163, 0, 0.5921569, 1, 1,
0.2448083, -1.872072, 2.479464, 0, 0.5843138, 1, 1,
0.2448529, -0.03436406, 1.262378, 0, 0.5803922, 1, 1,
0.24569, -0.7452847, 2.239458, 0, 0.572549, 1, 1,
0.2481142, -0.1533712, 2.611785, 0, 0.5686275, 1, 1,
0.2492126, -0.1924621, 3.598071, 0, 0.5607843, 1, 1,
0.250641, -0.7679104, 2.758282, 0, 0.5568628, 1, 1,
0.2534021, 0.6863655, 1.316609, 0, 0.5490196, 1, 1,
0.2556239, 0.362861, 0.714711, 0, 0.5450981, 1, 1,
0.2587518, -0.6309143, 2.745645, 0, 0.5372549, 1, 1,
0.2599717, 0.1590224, 2.753239, 0, 0.5333334, 1, 1,
0.2608126, 0.8912163, 0.2303883, 0, 0.5254902, 1, 1,
0.2628504, -0.6070315, 3.417429, 0, 0.5215687, 1, 1,
0.2641647, -0.7131348, 3.701792, 0, 0.5137255, 1, 1,
0.2646891, -0.7908368, 1.999015, 0, 0.509804, 1, 1,
0.2663754, -0.2580858, 4.91693, 0, 0.5019608, 1, 1,
0.2717618, 0.6389857, 1.104628, 0, 0.4941176, 1, 1,
0.2722141, -0.2847703, 3.281323, 0, 0.4901961, 1, 1,
0.272377, -1.668602, 2.670735, 0, 0.4823529, 1, 1,
0.2790509, -1.55238, 2.266535, 0, 0.4784314, 1, 1,
0.2849745, 0.4821017, 0.8677449, 0, 0.4705882, 1, 1,
0.2877292, 1.33815, 0.1711245, 0, 0.4666667, 1, 1,
0.2882079, 0.7541087, -0.01663164, 0, 0.4588235, 1, 1,
0.2891397, -0.629481, 2.145822, 0, 0.454902, 1, 1,
0.2927182, 1.099027, 0.9216588, 0, 0.4470588, 1, 1,
0.293327, -1.31256, 0.4006384, 0, 0.4431373, 1, 1,
0.2991634, 1.321772, 1.390698, 0, 0.4352941, 1, 1,
0.3041517, 0.325854, 1.170167, 0, 0.4313726, 1, 1,
0.3048833, -1.451418, 1.868724, 0, 0.4235294, 1, 1,
0.3070382, 0.0542412, 0.09079485, 0, 0.4196078, 1, 1,
0.3081337, 0.8588135, 1.421264, 0, 0.4117647, 1, 1,
0.3103147, 0.185243, 2.103585, 0, 0.4078431, 1, 1,
0.3109691, 0.5918313, 1.225822, 0, 0.4, 1, 1,
0.3127103, -1.614969, 1.794483, 0, 0.3921569, 1, 1,
0.3167547, -0.1972358, -0.4497252, 0, 0.3882353, 1, 1,
0.317224, -0.2139954, 1.07395, 0, 0.3803922, 1, 1,
0.3184659, 1.442791, -0.3838934, 0, 0.3764706, 1, 1,
0.3199377, -0.2276631, 0.386069, 0, 0.3686275, 1, 1,
0.3209071, 0.3016684, 1.23312, 0, 0.3647059, 1, 1,
0.3239011, 0.2179102, -0.1052855, 0, 0.3568628, 1, 1,
0.3278219, -1.173568, 2.746205, 0, 0.3529412, 1, 1,
0.3278416, -0.2228158, 1.479643, 0, 0.345098, 1, 1,
0.3286717, 0.7841747, 0.4207864, 0, 0.3411765, 1, 1,
0.3287508, 0.3321292, -1.363838, 0, 0.3333333, 1, 1,
0.3354097, 1.260979, -0.08537027, 0, 0.3294118, 1, 1,
0.3431431, 0.2819116, 0.2884582, 0, 0.3215686, 1, 1,
0.3468474, -0.4482635, 3.839426, 0, 0.3176471, 1, 1,
0.3484831, 0.8407433, -1.380765, 0, 0.3098039, 1, 1,
0.3489349, 0.02823539, 0.406878, 0, 0.3058824, 1, 1,
0.3493024, -0.06773144, 2.347278, 0, 0.2980392, 1, 1,
0.353375, -0.160237, 0.4133675, 0, 0.2901961, 1, 1,
0.3576945, 1.296829, -0.7487365, 0, 0.2862745, 1, 1,
0.3580979, -0.3525017, 2.914096, 0, 0.2784314, 1, 1,
0.3582736, 0.1782672, 0.07973207, 0, 0.2745098, 1, 1,
0.3685308, 0.240409, 1.450196, 0, 0.2666667, 1, 1,
0.372202, -0.5727246, 3.621272, 0, 0.2627451, 1, 1,
0.3727111, -0.4860131, 3.212949, 0, 0.254902, 1, 1,
0.3732902, 1.121711, -1.561318, 0, 0.2509804, 1, 1,
0.3736776, -0.4815224, 2.178076, 0, 0.2431373, 1, 1,
0.3753121, 0.03680462, 0.1625461, 0, 0.2392157, 1, 1,
0.3757313, 0.5668137, 0.6621729, 0, 0.2313726, 1, 1,
0.3758622, 2.108476, 0.6645816, 0, 0.227451, 1, 1,
0.3771076, -0.1819974, 2.463165, 0, 0.2196078, 1, 1,
0.3796974, -0.8574726, 2.495827, 0, 0.2156863, 1, 1,
0.3805043, -1.416453, 3.869032, 0, 0.2078431, 1, 1,
0.3828177, -2.622419, 2.260987, 0, 0.2039216, 1, 1,
0.3834874, -0.8385627, 3.368527, 0, 0.1960784, 1, 1,
0.3861992, -0.5846485, 2.156366, 0, 0.1882353, 1, 1,
0.3899526, -0.2202875, 1.335156, 0, 0.1843137, 1, 1,
0.3926489, 0.1763285, 0.8229312, 0, 0.1764706, 1, 1,
0.3941193, -0.6218841, 1.343423, 0, 0.172549, 1, 1,
0.3946593, -0.5209641, 2.933478, 0, 0.1647059, 1, 1,
0.3969175, -0.6857941, 2.140141, 0, 0.1607843, 1, 1,
0.3985387, 0.5725479, -0.2122088, 0, 0.1529412, 1, 1,
0.4000237, -0.4419815, 2.307805, 0, 0.1490196, 1, 1,
0.4037711, 1.058292, -1.074934, 0, 0.1411765, 1, 1,
0.4052096, -0.3951453, 1.903435, 0, 0.1372549, 1, 1,
0.4057234, -0.6486627, 3.209598, 0, 0.1294118, 1, 1,
0.4092687, 0.6153775, 1.229746, 0, 0.1254902, 1, 1,
0.4122241, 1.3068, -1.542888, 0, 0.1176471, 1, 1,
0.419012, 0.7009, -0.2467742, 0, 0.1137255, 1, 1,
0.4197018, 0.2067392, 1.899702, 0, 0.1058824, 1, 1,
0.4206056, -0.3812684, 1.015034, 0, 0.09803922, 1, 1,
0.4221128, -0.41092, 1.829227, 0, 0.09411765, 1, 1,
0.4247121, -0.479266, 2.764933, 0, 0.08627451, 1, 1,
0.4275966, -2.28819, 4.168524, 0, 0.08235294, 1, 1,
0.4277724, -0.4103132, 2.768032, 0, 0.07450981, 1, 1,
0.4306491, 2.120544, 0.4882509, 0, 0.07058824, 1, 1,
0.4356954, -1.851637, 3.368217, 0, 0.0627451, 1, 1,
0.4383347, -2.671553, 1.934112, 0, 0.05882353, 1, 1,
0.4424689, -0.1171789, 1.780066, 0, 0.05098039, 1, 1,
0.4552694, 0.7383342, -0.6576792, 0, 0.04705882, 1, 1,
0.4557908, 0.1641429, 1.51007, 0, 0.03921569, 1, 1,
0.4563627, -0.02131374, 0.1171631, 0, 0.03529412, 1, 1,
0.4572316, 1.374305, 0.818128, 0, 0.02745098, 1, 1,
0.4579356, 1.543331, 0.6543216, 0, 0.02352941, 1, 1,
0.4583108, -1.123943, 2.182176, 0, 0.01568628, 1, 1,
0.4594117, 0.6673691, -0.6355917, 0, 0.01176471, 1, 1,
0.4676628, -0.7793419, 1.263608, 0, 0.003921569, 1, 1,
0.4680169, 0.1725861, -1.033677, 0.003921569, 0, 1, 1,
0.4706664, -0.7711473, 2.483582, 0.007843138, 0, 1, 1,
0.4722795, 0.1211472, -0.3649531, 0.01568628, 0, 1, 1,
0.4738361, -0.469716, 2.161462, 0.01960784, 0, 1, 1,
0.4766304, -0.4674251, 2.998329, 0.02745098, 0, 1, 1,
0.4832462, -0.8389249, 4.000397, 0.03137255, 0, 1, 1,
0.4869529, -0.5907332, 4.070567, 0.03921569, 0, 1, 1,
0.4882959, -0.2508834, 2.137048, 0.04313726, 0, 1, 1,
0.4914864, 0.3482589, 0.6598045, 0.05098039, 0, 1, 1,
0.4932784, -0.2181178, 1.40673, 0.05490196, 0, 1, 1,
0.5009036, -0.4250288, 2.913676, 0.0627451, 0, 1, 1,
0.5039954, -1.811406, -0.2639966, 0.06666667, 0, 1, 1,
0.5109342, 0.3965594, 1.170194, 0.07450981, 0, 1, 1,
0.5115511, -0.07013898, 2.316023, 0.07843138, 0, 1, 1,
0.5145242, -1.094633, 3.074144, 0.08627451, 0, 1, 1,
0.5157217, -0.8750805, 2.472926, 0.09019608, 0, 1, 1,
0.5170601, -1.48879, 2.120352, 0.09803922, 0, 1, 1,
0.5183564, 0.9832809, 0.7486658, 0.1058824, 0, 1, 1,
0.5235441, 0.004937861, 1.621083, 0.1098039, 0, 1, 1,
0.527817, 0.2845222, 2.114321, 0.1176471, 0, 1, 1,
0.5283847, 1.052061, -0.5217425, 0.1215686, 0, 1, 1,
0.5287768, -0.952633, 3.694862, 0.1294118, 0, 1, 1,
0.528836, 0.1985825, 2.34924, 0.1333333, 0, 1, 1,
0.5324005, 0.2791356, 2.589696, 0.1411765, 0, 1, 1,
0.5328786, -0.03940966, 1.60742, 0.145098, 0, 1, 1,
0.5373527, -0.9263552, 1.926715, 0.1529412, 0, 1, 1,
0.5443904, -0.9683688, 3.063543, 0.1568628, 0, 1, 1,
0.5461821, -0.6507711, 2.921875, 0.1647059, 0, 1, 1,
0.5489324, -0.2167986, 1.826064, 0.1686275, 0, 1, 1,
0.5494151, 0.4814613, 2.706115, 0.1764706, 0, 1, 1,
0.5503566, 0.4988626, -0.7772983, 0.1803922, 0, 1, 1,
0.5531716, -1.471049, 3.812423, 0.1882353, 0, 1, 1,
0.5537652, -0.2743846, 0.4731326, 0.1921569, 0, 1, 1,
0.5557777, 0.2851255, 0.4987203, 0.2, 0, 1, 1,
0.562802, -1.760417, 3.808255, 0.2078431, 0, 1, 1,
0.5663658, 1.240502, -0.3832837, 0.2117647, 0, 1, 1,
0.5687668, 0.2964559, 0.8928416, 0.2196078, 0, 1, 1,
0.5737691, 0.01483846, 2.973969, 0.2235294, 0, 1, 1,
0.5762507, 0.5556819, 2.498806, 0.2313726, 0, 1, 1,
0.576263, -0.6986963, 1.845475, 0.2352941, 0, 1, 1,
0.5763599, 0.6790212, 0.8647491, 0.2431373, 0, 1, 1,
0.5847425, 0.3718519, 1.134819, 0.2470588, 0, 1, 1,
0.5853468, -1.696972, 3.313482, 0.254902, 0, 1, 1,
0.5883915, -0.9585291, 2.987656, 0.2588235, 0, 1, 1,
0.5927645, -0.4842898, 2.652283, 0.2666667, 0, 1, 1,
0.5928892, 0.8843216, 0.4856447, 0.2705882, 0, 1, 1,
0.5945532, 0.7276317, -1.601712, 0.2784314, 0, 1, 1,
0.6079006, -1.026016, 3.726432, 0.282353, 0, 1, 1,
0.6083571, 0.272047, 0.4460817, 0.2901961, 0, 1, 1,
0.6105821, 1.059362, 0.2112759, 0.2941177, 0, 1, 1,
0.6107129, -0.3500243, 2.28733, 0.3019608, 0, 1, 1,
0.6108728, 0.4176126, 3.40027, 0.3098039, 0, 1, 1,
0.6143579, 2.145053, 0.8130985, 0.3137255, 0, 1, 1,
0.6144691, 0.3628155, 0.09055226, 0.3215686, 0, 1, 1,
0.6148018, 0.492231, 0.8774946, 0.3254902, 0, 1, 1,
0.6157414, -1.343908, 2.670606, 0.3333333, 0, 1, 1,
0.6158669, 2.724089, -0.5469933, 0.3372549, 0, 1, 1,
0.6163819, -1.128703, 3.308869, 0.345098, 0, 1, 1,
0.616518, 1.363163, -0.08951079, 0.3490196, 0, 1, 1,
0.6171582, 0.8166481, 0.5207503, 0.3568628, 0, 1, 1,
0.6197482, 0.3618518, 0.6380397, 0.3607843, 0, 1, 1,
0.6217701, -0.9871461, 1.28333, 0.3686275, 0, 1, 1,
0.6219322, -0.0318939, 3.303981, 0.372549, 0, 1, 1,
0.6227691, 1.280447, -1.080437, 0.3803922, 0, 1, 1,
0.6260248, -2.079825, 2.285368, 0.3843137, 0, 1, 1,
0.6308239, 1.279226, 1.032308, 0.3921569, 0, 1, 1,
0.631793, 1.008219, 1.854411, 0.3960784, 0, 1, 1,
0.6394401, 1.050036, 2.404323, 0.4039216, 0, 1, 1,
0.6463895, -0.291697, 1.200657, 0.4117647, 0, 1, 1,
0.6482171, -0.08266094, 1.84104, 0.4156863, 0, 1, 1,
0.6539412, 1.427547, -0.1444278, 0.4235294, 0, 1, 1,
0.6558418, 0.4107721, 2.166155, 0.427451, 0, 1, 1,
0.6636705, -0.3667011, 0.1661183, 0.4352941, 0, 1, 1,
0.6724101, -0.695426, 1.611981, 0.4392157, 0, 1, 1,
0.6726002, 1.126, -0.6459464, 0.4470588, 0, 1, 1,
0.6757664, -0.007430143, 2.137532, 0.4509804, 0, 1, 1,
0.683697, 0.4911008, 0.6396021, 0.4588235, 0, 1, 1,
0.6875672, 0.9494551, 1.431784, 0.4627451, 0, 1, 1,
0.7011653, -0.7717095, 0.8719747, 0.4705882, 0, 1, 1,
0.7018136, 1.088641, -0.549681, 0.4745098, 0, 1, 1,
0.708504, -1.889538, 1.649818, 0.4823529, 0, 1, 1,
0.7107859, 0.0140118, 2.22066, 0.4862745, 0, 1, 1,
0.7179279, 0.04658683, 1.820224, 0.4941176, 0, 1, 1,
0.7264242, -0.776388, 2.408518, 0.5019608, 0, 1, 1,
0.7301285, 0.2773047, 0.7753723, 0.5058824, 0, 1, 1,
0.7304376, 0.3091921, 2.273546, 0.5137255, 0, 1, 1,
0.7398496, 0.9023653, 1.749819, 0.5176471, 0, 1, 1,
0.7478608, 0.6453305, 1.768652, 0.5254902, 0, 1, 1,
0.7484148, -0.4108905, 2.299895, 0.5294118, 0, 1, 1,
0.7493361, -0.3457228, 2.369135, 0.5372549, 0, 1, 1,
0.7506646, -0.5145396, 0.5012457, 0.5411765, 0, 1, 1,
0.7574526, -1.652863, 4.591149, 0.5490196, 0, 1, 1,
0.7694317, 0.1154934, 1.272251, 0.5529412, 0, 1, 1,
0.772622, 0.1668641, 0.8322875, 0.5607843, 0, 1, 1,
0.7763338, 0.1848779, 0.746769, 0.5647059, 0, 1, 1,
0.7895788, 1.178016, -0.119371, 0.572549, 0, 1, 1,
0.7942926, 0.7906465, 1.10387, 0.5764706, 0, 1, 1,
0.7942955, -0.7680673, 1.76471, 0.5843138, 0, 1, 1,
0.7994485, 0.2530071, 1.396663, 0.5882353, 0, 1, 1,
0.8004778, -0.1533972, 0.0271034, 0.5960785, 0, 1, 1,
0.8008294, -0.2037112, 2.346664, 0.6039216, 0, 1, 1,
0.8014956, -0.5996203, 1.995683, 0.6078432, 0, 1, 1,
0.8017388, 0.5457896, 2.195187, 0.6156863, 0, 1, 1,
0.8029367, -0.003438363, 1.888289, 0.6196079, 0, 1, 1,
0.8068161, -0.5078726, 0.6864, 0.627451, 0, 1, 1,
0.8146676, -0.5628646, 3.015743, 0.6313726, 0, 1, 1,
0.8146707, -1.202012, 3.744923, 0.6392157, 0, 1, 1,
0.8227493, 1.692903, 0.7127115, 0.6431373, 0, 1, 1,
0.8241527, -0.4836813, 1.841649, 0.6509804, 0, 1, 1,
0.8301978, 0.1880737, 1.239035, 0.654902, 0, 1, 1,
0.8326102, -0.7154865, 1.781599, 0.6627451, 0, 1, 1,
0.8403077, -0.8100951, 2.080244, 0.6666667, 0, 1, 1,
0.84588, 0.09326962, 0.4635777, 0.6745098, 0, 1, 1,
0.8507439, -0.06371909, 2.250392, 0.6784314, 0, 1, 1,
0.8537631, -0.6555427, 2.479854, 0.6862745, 0, 1, 1,
0.8572693, -0.3877345, 2.12443, 0.6901961, 0, 1, 1,
0.8579001, -0.3603383, 2.298306, 0.6980392, 0, 1, 1,
0.8593627, 0.1032389, 1.383824, 0.7058824, 0, 1, 1,
0.8612835, -0.3094449, 2.242994, 0.7098039, 0, 1, 1,
0.8708674, -0.9951792, 3.916642, 0.7176471, 0, 1, 1,
0.8709939, -0.6840423, 2.500046, 0.7215686, 0, 1, 1,
0.8751383, -1.264473, 1.741279, 0.7294118, 0, 1, 1,
0.8776588, -0.3840688, 3.512307, 0.7333333, 0, 1, 1,
0.8814673, 0.4165554, 0.1419731, 0.7411765, 0, 1, 1,
0.8829557, 0.3154672, 0.2395118, 0.7450981, 0, 1, 1,
0.885746, 0.2729289, -0.197017, 0.7529412, 0, 1, 1,
0.8865535, -0.7257054, 2.030951, 0.7568628, 0, 1, 1,
0.893599, 0.595554, 0.6530561, 0.7647059, 0, 1, 1,
0.8947881, -1.071699, 3.083949, 0.7686275, 0, 1, 1,
0.9004225, -1.466274, 3.231548, 0.7764706, 0, 1, 1,
0.902225, -0.02395465, 1.027687, 0.7803922, 0, 1, 1,
0.902417, 1.799299, 0.2897691, 0.7882353, 0, 1, 1,
0.9058356, -0.6540319, 3.103874, 0.7921569, 0, 1, 1,
0.9107502, -1.921111, 2.437248, 0.8, 0, 1, 1,
0.9144663, -1.697803, 2.286588, 0.8078431, 0, 1, 1,
0.9196737, 0.9687136, 0.406515, 0.8117647, 0, 1, 1,
0.9198078, -1.219236, 2.496922, 0.8196079, 0, 1, 1,
0.9218573, -1.413323, 1.682434, 0.8235294, 0, 1, 1,
0.931258, -0.5538613, 1.159111, 0.8313726, 0, 1, 1,
0.9337227, -1.073567, 2.301712, 0.8352941, 0, 1, 1,
0.934522, 0.3466601, 2.934053, 0.8431373, 0, 1, 1,
0.9394754, -1.062654, 0.8722935, 0.8470588, 0, 1, 1,
0.9445465, -0.7639788, 0.4899275, 0.854902, 0, 1, 1,
0.9483539, 2.008136, -1.095983, 0.8588235, 0, 1, 1,
0.9495518, 0.5138209, 0.7864041, 0.8666667, 0, 1, 1,
0.9516184, -0.6389782, 1.263798, 0.8705882, 0, 1, 1,
0.9547481, 0.008504614, 1.701222, 0.8784314, 0, 1, 1,
0.9668418, 1.582833, 1.285067, 0.8823529, 0, 1, 1,
0.9714369, 0.09355489, 2.213843, 0.8901961, 0, 1, 1,
0.9760174, -0.2601812, 2.549645, 0.8941177, 0, 1, 1,
0.9775875, 0.776104, 0.7997349, 0.9019608, 0, 1, 1,
0.9920254, 0.5287413, 1.686103, 0.9098039, 0, 1, 1,
0.9920619, 2.018342, 2.662731, 0.9137255, 0, 1, 1,
0.9933971, 0.2576239, 2.502636, 0.9215686, 0, 1, 1,
0.995486, 0.1151099, 1.375567, 0.9254902, 0, 1, 1,
0.9997713, -0.4909753, 1.710276, 0.9333333, 0, 1, 1,
1.001343, 0.06590706, 1.000985, 0.9372549, 0, 1, 1,
1.009402, 0.9065532, 1.615535, 0.945098, 0, 1, 1,
1.009549, 0.2620007, 0.8517241, 0.9490196, 0, 1, 1,
1.010709, 1.457096, 0.5783659, 0.9568627, 0, 1, 1,
1.019652, -0.5142985, 1.350821, 0.9607843, 0, 1, 1,
1.031107, 0.4533272, 2.314497, 0.9686275, 0, 1, 1,
1.037986, 0.3266224, 2.045454, 0.972549, 0, 1, 1,
1.039574, 1.493924, 0.541755, 0.9803922, 0, 1, 1,
1.044197, -0.9456934, 3.579901, 0.9843137, 0, 1, 1,
1.045148, 0.2915074, 2.598583, 0.9921569, 0, 1, 1,
1.045961, 0.3705766, 0.5564464, 0.9960784, 0, 1, 1,
1.052717, -0.3805867, 1.426703, 1, 0, 0.9960784, 1,
1.053174, 0.7623657, 1.910752, 1, 0, 0.9882353, 1,
1.059935, -1.218479, 2.645208, 1, 0, 0.9843137, 1,
1.06862, 0.1565724, 1.722936, 1, 0, 0.9764706, 1,
1.07337, -1.614115, 0.9939531, 1, 0, 0.972549, 1,
1.074927, -0.6705628, 2.330269, 1, 0, 0.9647059, 1,
1.078768, -0.5687942, 3.155502, 1, 0, 0.9607843, 1,
1.079584, -1.485852, 1.255718, 1, 0, 0.9529412, 1,
1.082429, 1.121364, 1.469244, 1, 0, 0.9490196, 1,
1.083989, 0.07974354, 3.265826, 1, 0, 0.9411765, 1,
1.086365, 0.2089721, 2.885681, 1, 0, 0.9372549, 1,
1.088082, -2.253608, 4.980274, 1, 0, 0.9294118, 1,
1.099453, 0.05120267, 1.880472, 1, 0, 0.9254902, 1,
1.10102, -1.567639, 3.017886, 1, 0, 0.9176471, 1,
1.103079, 0.7301421, 0.1939673, 1, 0, 0.9137255, 1,
1.116544, 0.09747631, 2.542887, 1, 0, 0.9058824, 1,
1.12364, 0.713663, 0.7126438, 1, 0, 0.9019608, 1,
1.123937, 0.7716358, 0.06905352, 1, 0, 0.8941177, 1,
1.125899, 0.9609326, 1.070693, 1, 0, 0.8862745, 1,
1.12665, 0.6502652, -0.1098958, 1, 0, 0.8823529, 1,
1.12813, 0.8014216, 1.021504, 1, 0, 0.8745098, 1,
1.136466, -0.4078885, 2.285205, 1, 0, 0.8705882, 1,
1.137864, 1.499197, 0.7500678, 1, 0, 0.8627451, 1,
1.13839, -0.6754202, 3.289236, 1, 0, 0.8588235, 1,
1.139365, -0.005852809, 0.8593158, 1, 0, 0.8509804, 1,
1.144934, -0.3880399, -0.2806382, 1, 0, 0.8470588, 1,
1.150206, 0.3192337, 2.558431, 1, 0, 0.8392157, 1,
1.150649, 0.04197899, 3.708961, 1, 0, 0.8352941, 1,
1.15642, -1.196803, 1.105857, 1, 0, 0.827451, 1,
1.163019, -0.8106178, 3.507224, 1, 0, 0.8235294, 1,
1.163721, -0.6955472, 1.85558, 1, 0, 0.8156863, 1,
1.179105, 0.5474926, 0.5832048, 1, 0, 0.8117647, 1,
1.184207, -2.154651, 3.202075, 1, 0, 0.8039216, 1,
1.196923, -0.8591263, 2.497202, 1, 0, 0.7960784, 1,
1.213778, 0.1144044, 1.58279, 1, 0, 0.7921569, 1,
1.217221, -0.6011624, 2.677349, 1, 0, 0.7843137, 1,
1.218501, -0.16098, 0.7943006, 1, 0, 0.7803922, 1,
1.220153, -1.129304, 2.75679, 1, 0, 0.772549, 1,
1.220164, -1.340795, 0.5525798, 1, 0, 0.7686275, 1,
1.230017, 0.8400938, -0.3128074, 1, 0, 0.7607843, 1,
1.231528, -0.5432476, 0.2570568, 1, 0, 0.7568628, 1,
1.23319, 1.229341, 1.366071, 1, 0, 0.7490196, 1,
1.233649, -1.195198, -0.115534, 1, 0, 0.7450981, 1,
1.235649, 0.9191372, -1.223123, 1, 0, 0.7372549, 1,
1.248225, -0.8032672, 1.984278, 1, 0, 0.7333333, 1,
1.251282, -0.6612521, 1.805055, 1, 0, 0.7254902, 1,
1.261021, -0.4592142, 3.703748, 1, 0, 0.7215686, 1,
1.262094, 0.7918278, 0.7845317, 1, 0, 0.7137255, 1,
1.281047, -1.064328, -0.4404324, 1, 0, 0.7098039, 1,
1.289617, -0.6875232, 1.692807, 1, 0, 0.7019608, 1,
1.293547, -1.583511, 3.423415, 1, 0, 0.6941177, 1,
1.295415, -0.5321993, 1.030784, 1, 0, 0.6901961, 1,
1.297212, -1.204325, 0.7260532, 1, 0, 0.682353, 1,
1.297634, 0.5677652, 0.08373961, 1, 0, 0.6784314, 1,
1.298539, -0.9404521, 1.953032, 1, 0, 0.6705883, 1,
1.301722, -1.490854, 2.047182, 1, 0, 0.6666667, 1,
1.304465, -1.208574, 3.52454, 1, 0, 0.6588235, 1,
1.309857, 0.8411243, 0.8707657, 1, 0, 0.654902, 1,
1.315948, -2.09549, 4.013232, 1, 0, 0.6470588, 1,
1.319319, 0.7054269, 0.6917768, 1, 0, 0.6431373, 1,
1.322051, 1.19611, 1.588879, 1, 0, 0.6352941, 1,
1.325562, -1.239575, 3.306561, 1, 0, 0.6313726, 1,
1.325971, 1.249076, 0.8994966, 1, 0, 0.6235294, 1,
1.327654, -0.513622, 2.091429, 1, 0, 0.6196079, 1,
1.327722, -0.2249177, 0.9254081, 1, 0, 0.6117647, 1,
1.330373, -0.5467904, 1.412667, 1, 0, 0.6078432, 1,
1.341115, -0.2474337, 2.446132, 1, 0, 0.6, 1,
1.351814, 0.5827718, 0.2316443, 1, 0, 0.5921569, 1,
1.355094, 0.3614154, 0.8011749, 1, 0, 0.5882353, 1,
1.358177, -1.163665, 2.913297, 1, 0, 0.5803922, 1,
1.360964, -0.4700342, 1.899388, 1, 0, 0.5764706, 1,
1.363622, 0.7230617, 0.4764336, 1, 0, 0.5686275, 1,
1.365798, -0.4773585, 2.603919, 1, 0, 0.5647059, 1,
1.370391, -0.3056333, 3.346518, 1, 0, 0.5568628, 1,
1.37684, -0.05828721, 0.8024009, 1, 0, 0.5529412, 1,
1.396408, 1.919128, 0.4053144, 1, 0, 0.5450981, 1,
1.398152, 0.1868565, 0.6851248, 1, 0, 0.5411765, 1,
1.413835, -1.684577, 3.338058, 1, 0, 0.5333334, 1,
1.413917, 1.096801, 2.961516, 1, 0, 0.5294118, 1,
1.414482, 0.1559712, 0.1187522, 1, 0, 0.5215687, 1,
1.432673, -1.536661, 1.001603, 1, 0, 0.5176471, 1,
1.432946, 0.1192504, 0.9564312, 1, 0, 0.509804, 1,
1.43663, -1.647736, 1.632424, 1, 0, 0.5058824, 1,
1.43851, -0.7163688, 0.8142289, 1, 0, 0.4980392, 1,
1.440162, -0.1214674, 2.646942, 1, 0, 0.4901961, 1,
1.440798, -0.3851008, -0.8240668, 1, 0, 0.4862745, 1,
1.453676, 0.1206512, 3.341191, 1, 0, 0.4784314, 1,
1.459375, 2.051583, -1.574713, 1, 0, 0.4745098, 1,
1.471215, 1.546675, -1.205031, 1, 0, 0.4666667, 1,
1.479685, -1.205938, 2.925344, 1, 0, 0.4627451, 1,
1.483149, -0.2657894, 1.236044, 1, 0, 0.454902, 1,
1.491244, 1.109562, 1.142797, 1, 0, 0.4509804, 1,
1.504831, -0.5945977, -0.2106814, 1, 0, 0.4431373, 1,
1.506865, -0.3620767, 1.531133, 1, 0, 0.4392157, 1,
1.507476, -0.5765827, 2.419033, 1, 0, 0.4313726, 1,
1.51311, 0.03813209, 0.2775476, 1, 0, 0.427451, 1,
1.523315, 2.268664, -1.06058, 1, 0, 0.4196078, 1,
1.543542, 0.1819728, 0.4802732, 1, 0, 0.4156863, 1,
1.5446, -0.2885394, 0.01048231, 1, 0, 0.4078431, 1,
1.556703, 0.1844582, 3.032907, 1, 0, 0.4039216, 1,
1.561584, 0.5047811, 2.307036, 1, 0, 0.3960784, 1,
1.591648, 0.4144153, -0.9566909, 1, 0, 0.3882353, 1,
1.599725, -0.8889273, 2.529407, 1, 0, 0.3843137, 1,
1.610712, -1.868854, 2.485508, 1, 0, 0.3764706, 1,
1.627695, 1.763474, 0.4388868, 1, 0, 0.372549, 1,
1.628819, 0.7214957, 0.5754747, 1, 0, 0.3647059, 1,
1.643015, 0.2210181, 1.055617, 1, 0, 0.3607843, 1,
1.652158, -1.520485, 3.672067, 1, 0, 0.3529412, 1,
1.666382, 0.7681937, 1.870051, 1, 0, 0.3490196, 1,
1.670239, -1.169972, 1.025527, 1, 0, 0.3411765, 1,
1.680858, 0.6954077, 1.500214, 1, 0, 0.3372549, 1,
1.698637, 0.6596457, 1.42406, 1, 0, 0.3294118, 1,
1.704725, 1.284435, 1.46064, 1, 0, 0.3254902, 1,
1.708721, 0.05704086, 2.144022, 1, 0, 0.3176471, 1,
1.721191, 0.3967929, 2.566463, 1, 0, 0.3137255, 1,
1.721926, -0.3986779, 0.07825918, 1, 0, 0.3058824, 1,
1.727284, -0.4872422, 1.925242, 1, 0, 0.2980392, 1,
1.732444, 0.5156167, 2.516294, 1, 0, 0.2941177, 1,
1.749881, -0.7726455, 1.137825, 1, 0, 0.2862745, 1,
1.757619, 0.3412151, 1.216508, 1, 0, 0.282353, 1,
1.75917, 0.9331504, 1.442565, 1, 0, 0.2745098, 1,
1.760118, -0.3382961, 3.506179, 1, 0, 0.2705882, 1,
1.78981, 0.07829404, 3.329696, 1, 0, 0.2627451, 1,
1.792677, -0.6647141, 1.359775, 1, 0, 0.2588235, 1,
1.803447, -0.08355493, 1.630732, 1, 0, 0.2509804, 1,
1.808027, 1.406064, 1.974912, 1, 0, 0.2470588, 1,
1.812078, -0.6050081, 2.660116, 1, 0, 0.2392157, 1,
1.818525, 0.05216211, 0.2526575, 1, 0, 0.2352941, 1,
1.849021, -0.2000336, 1.610496, 1, 0, 0.227451, 1,
1.86127, -0.8389214, 1.158737, 1, 0, 0.2235294, 1,
1.874218, 1.920098, 1.20113, 1, 0, 0.2156863, 1,
1.883847, 0.2415721, 0.7374732, 1, 0, 0.2117647, 1,
1.905513, 0.3247091, 1.243884, 1, 0, 0.2039216, 1,
1.932803, 1.196108, 0.8019649, 1, 0, 0.1960784, 1,
1.937671, -0.20113, 3.131955, 1, 0, 0.1921569, 1,
1.969011, -0.4703247, 0.7076309, 1, 0, 0.1843137, 1,
1.97071, -0.6944727, 3.925261, 1, 0, 0.1803922, 1,
1.97382, -0.6522082, 1.429953, 1, 0, 0.172549, 1,
2.008936, -0.3556455, 2.779315, 1, 0, 0.1686275, 1,
2.011883, 0.356466, 3.250554, 1, 0, 0.1607843, 1,
2.01644, -1.245259, 1.566871, 1, 0, 0.1568628, 1,
2.031389, -0.4302651, 3.573345, 1, 0, 0.1490196, 1,
2.084457, -0.4060905, 1.8496, 1, 0, 0.145098, 1,
2.095251, -0.4633017, 1.297232, 1, 0, 0.1372549, 1,
2.099289, -1.189363, 5.002738, 1, 0, 0.1333333, 1,
2.109871, -1.774902, 4.037979, 1, 0, 0.1254902, 1,
2.129349, 1.350646, -0.7468083, 1, 0, 0.1215686, 1,
2.132461, -1.237957, 1.18638, 1, 0, 0.1137255, 1,
2.154856, 0.1944153, 2.559926, 1, 0, 0.1098039, 1,
2.16793, 0.07778673, 3.229896, 1, 0, 0.1019608, 1,
2.19563, -0.3867758, 0.9779952, 1, 0, 0.09411765, 1,
2.205018, 0.603562, 2.551085, 1, 0, 0.09019608, 1,
2.214027, 2.236096, 1.25561, 1, 0, 0.08235294, 1,
2.215939, -0.742353, 1.973836, 1, 0, 0.07843138, 1,
2.230195, 0.2129612, 1.734715, 1, 0, 0.07058824, 1,
2.231313, 1.215973, 0.7501882, 1, 0, 0.06666667, 1,
2.232685, -0.628341, 1.217957, 1, 0, 0.05882353, 1,
2.293177, -1.342788, 1.723433, 1, 0, 0.05490196, 1,
2.341923, -0.9566116, 2.027166, 1, 0, 0.04705882, 1,
2.556349, 2.046187, -0.9775102, 1, 0, 0.04313726, 1,
2.60092, 0.9673156, 0.8227816, 1, 0, 0.03529412, 1,
2.78231, -0.2737881, 1.414114, 1, 0, 0.03137255, 1,
2.826735, 0.3629647, 1.779857, 1, 0, 0.02352941, 1,
3.083475, 1.224482, 3.331176, 1, 0, 0.01960784, 1,
3.084785, -0.131832, 1.287039, 1, 0, 0.01176471, 1,
3.432747, -0.9974363, 2.646557, 1, 0, 0.007843138, 1
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
0.3793911, -4.120097, -7.092726, 0, -0.5, 0.5, 0.5,
0.3793911, -4.120097, -7.092726, 1, -0.5, 0.5, 0.5,
0.3793911, -4.120097, -7.092726, 1, 1.5, 0.5, 0.5,
0.3793911, -4.120097, -7.092726, 0, 1.5, 0.5, 0.5
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
-3.709053, 0.1334141, -7.092726, 0, -0.5, 0.5, 0.5,
-3.709053, 0.1334141, -7.092726, 1, -0.5, 0.5, 0.5,
-3.709053, 0.1334141, -7.092726, 1, 1.5, 0.5, 0.5,
-3.709053, 0.1334141, -7.092726, 0, 1.5, 0.5, 0.5
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
-3.709053, -4.120097, -0.1672721, 0, -0.5, 0.5, 0.5,
-3.709053, -4.120097, -0.1672721, 1, -0.5, 0.5, 0.5,
-3.709053, -4.120097, -0.1672721, 1, 1.5, 0.5, 0.5,
-3.709053, -4.120097, -0.1672721, 0, 1.5, 0.5, 0.5
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
-2, -3.138517, -5.494544,
3, -3.138517, -5.494544,
-2, -3.138517, -5.494544,
-2, -3.302114, -5.760908,
-1, -3.138517, -5.494544,
-1, -3.302114, -5.760908,
0, -3.138517, -5.494544,
0, -3.302114, -5.760908,
1, -3.138517, -5.494544,
1, -3.302114, -5.760908,
2, -3.138517, -5.494544,
2, -3.302114, -5.760908,
3, -3.138517, -5.494544,
3, -3.302114, -5.760908
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
-2, -3.629307, -6.293635, 0, -0.5, 0.5, 0.5,
-2, -3.629307, -6.293635, 1, -0.5, 0.5, 0.5,
-2, -3.629307, -6.293635, 1, 1.5, 0.5, 0.5,
-2, -3.629307, -6.293635, 0, 1.5, 0.5, 0.5,
-1, -3.629307, -6.293635, 0, -0.5, 0.5, 0.5,
-1, -3.629307, -6.293635, 1, -0.5, 0.5, 0.5,
-1, -3.629307, -6.293635, 1, 1.5, 0.5, 0.5,
-1, -3.629307, -6.293635, 0, 1.5, 0.5, 0.5,
0, -3.629307, -6.293635, 0, -0.5, 0.5, 0.5,
0, -3.629307, -6.293635, 1, -0.5, 0.5, 0.5,
0, -3.629307, -6.293635, 1, 1.5, 0.5, 0.5,
0, -3.629307, -6.293635, 0, 1.5, 0.5, 0.5,
1, -3.629307, -6.293635, 0, -0.5, 0.5, 0.5,
1, -3.629307, -6.293635, 1, -0.5, 0.5, 0.5,
1, -3.629307, -6.293635, 1, 1.5, 0.5, 0.5,
1, -3.629307, -6.293635, 0, 1.5, 0.5, 0.5,
2, -3.629307, -6.293635, 0, -0.5, 0.5, 0.5,
2, -3.629307, -6.293635, 1, -0.5, 0.5, 0.5,
2, -3.629307, -6.293635, 1, 1.5, 0.5, 0.5,
2, -3.629307, -6.293635, 0, 1.5, 0.5, 0.5,
3, -3.629307, -6.293635, 0, -0.5, 0.5, 0.5,
3, -3.629307, -6.293635, 1, -0.5, 0.5, 0.5,
3, -3.629307, -6.293635, 1, 1.5, 0.5, 0.5,
3, -3.629307, -6.293635, 0, 1.5, 0.5, 0.5
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
-2.765566, -3, -5.494544,
-2.765566, 3, -5.494544,
-2.765566, -3, -5.494544,
-2.922813, -3, -5.760908,
-2.765566, -2, -5.494544,
-2.922813, -2, -5.760908,
-2.765566, -1, -5.494544,
-2.922813, -1, -5.760908,
-2.765566, 0, -5.494544,
-2.922813, 0, -5.760908,
-2.765566, 1, -5.494544,
-2.922813, 1, -5.760908,
-2.765566, 2, -5.494544,
-2.922813, 2, -5.760908,
-2.765566, 3, -5.494544,
-2.922813, 3, -5.760908
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
-3.237309, -3, -6.293635, 0, -0.5, 0.5, 0.5,
-3.237309, -3, -6.293635, 1, -0.5, 0.5, 0.5,
-3.237309, -3, -6.293635, 1, 1.5, 0.5, 0.5,
-3.237309, -3, -6.293635, 0, 1.5, 0.5, 0.5,
-3.237309, -2, -6.293635, 0, -0.5, 0.5, 0.5,
-3.237309, -2, -6.293635, 1, -0.5, 0.5, 0.5,
-3.237309, -2, -6.293635, 1, 1.5, 0.5, 0.5,
-3.237309, -2, -6.293635, 0, 1.5, 0.5, 0.5,
-3.237309, -1, -6.293635, 0, -0.5, 0.5, 0.5,
-3.237309, -1, -6.293635, 1, -0.5, 0.5, 0.5,
-3.237309, -1, -6.293635, 1, 1.5, 0.5, 0.5,
-3.237309, -1, -6.293635, 0, 1.5, 0.5, 0.5,
-3.237309, 0, -6.293635, 0, -0.5, 0.5, 0.5,
-3.237309, 0, -6.293635, 1, -0.5, 0.5, 0.5,
-3.237309, 0, -6.293635, 1, 1.5, 0.5, 0.5,
-3.237309, 0, -6.293635, 0, 1.5, 0.5, 0.5,
-3.237309, 1, -6.293635, 0, -0.5, 0.5, 0.5,
-3.237309, 1, -6.293635, 1, -0.5, 0.5, 0.5,
-3.237309, 1, -6.293635, 1, 1.5, 0.5, 0.5,
-3.237309, 1, -6.293635, 0, 1.5, 0.5, 0.5,
-3.237309, 2, -6.293635, 0, -0.5, 0.5, 0.5,
-3.237309, 2, -6.293635, 1, -0.5, 0.5, 0.5,
-3.237309, 2, -6.293635, 1, 1.5, 0.5, 0.5,
-3.237309, 2, -6.293635, 0, 1.5, 0.5, 0.5,
-3.237309, 3, -6.293635, 0, -0.5, 0.5, 0.5,
-3.237309, 3, -6.293635, 1, -0.5, 0.5, 0.5,
-3.237309, 3, -6.293635, 1, 1.5, 0.5, 0.5,
-3.237309, 3, -6.293635, 0, 1.5, 0.5, 0.5
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
-2.765566, -3.138517, -4,
-2.765566, -3.138517, 4,
-2.765566, -3.138517, -4,
-2.922813, -3.302114, -4,
-2.765566, -3.138517, -2,
-2.922813, -3.302114, -2,
-2.765566, -3.138517, 0,
-2.922813, -3.302114, 0,
-2.765566, -3.138517, 2,
-2.922813, -3.302114, 2,
-2.765566, -3.138517, 4,
-2.922813, -3.302114, 4
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
-3.237309, -3.629307, -4, 0, -0.5, 0.5, 0.5,
-3.237309, -3.629307, -4, 1, -0.5, 0.5, 0.5,
-3.237309, -3.629307, -4, 1, 1.5, 0.5, 0.5,
-3.237309, -3.629307, -4, 0, 1.5, 0.5, 0.5,
-3.237309, -3.629307, -2, 0, -0.5, 0.5, 0.5,
-3.237309, -3.629307, -2, 1, -0.5, 0.5, 0.5,
-3.237309, -3.629307, -2, 1, 1.5, 0.5, 0.5,
-3.237309, -3.629307, -2, 0, 1.5, 0.5, 0.5,
-3.237309, -3.629307, 0, 0, -0.5, 0.5, 0.5,
-3.237309, -3.629307, 0, 1, -0.5, 0.5, 0.5,
-3.237309, -3.629307, 0, 1, 1.5, 0.5, 0.5,
-3.237309, -3.629307, 0, 0, 1.5, 0.5, 0.5,
-3.237309, -3.629307, 2, 0, -0.5, 0.5, 0.5,
-3.237309, -3.629307, 2, 1, -0.5, 0.5, 0.5,
-3.237309, -3.629307, 2, 1, 1.5, 0.5, 0.5,
-3.237309, -3.629307, 2, 0, 1.5, 0.5, 0.5,
-3.237309, -3.629307, 4, 0, -0.5, 0.5, 0.5,
-3.237309, -3.629307, 4, 1, -0.5, 0.5, 0.5,
-3.237309, -3.629307, 4, 1, 1.5, 0.5, 0.5,
-3.237309, -3.629307, 4, 0, 1.5, 0.5, 0.5
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
-2.765566, -3.138517, -5.494544,
-2.765566, 3.405346, -5.494544,
-2.765566, -3.138517, 5.16,
-2.765566, 3.405346, 5.16,
-2.765566, -3.138517, -5.494544,
-2.765566, -3.138517, 5.16,
-2.765566, 3.405346, -5.494544,
-2.765566, 3.405346, 5.16,
-2.765566, -3.138517, -5.494544,
3.524348, -3.138517, -5.494544,
-2.765566, -3.138517, 5.16,
3.524348, -3.138517, 5.16,
-2.765566, 3.405346, -5.494544,
3.524348, 3.405346, -5.494544,
-2.765566, 3.405346, 5.16,
3.524348, 3.405346, 5.16,
3.524348, -3.138517, -5.494544,
3.524348, 3.405346, -5.494544,
3.524348, -3.138517, 5.16,
3.524348, 3.405346, 5.16,
3.524348, -3.138517, -5.494544,
3.524348, -3.138517, 5.16,
3.524348, 3.405346, -5.494544,
3.524348, 3.405346, 5.16
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
var radius = 7.473906;
var distance = 33.25225;
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
mvMatrix.translate( -0.3793911, -0.1334141, 0.1672721 );
mvMatrix.scale( 1.284745, 1.234887, 0.7584495 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.25225);
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
acrolein<-read.table("acrolein.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-acrolein$V2
```

```
## Error in eval(expr, envir, enclos): object 'acrolein' not found
```

```r
y<-acrolein$V3
```

```
## Error in eval(expr, envir, enclos): object 'acrolein' not found
```

```r
z<-acrolein$V4
```

```
## Error in eval(expr, envir, enclos): object 'acrolein' not found
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
-2.673965, 1.727134, -1.340528, 0, 0, 1, 1, 1,
-2.525523, 1.099602, -0.4398338, 1, 0, 0, 1, 1,
-2.502222, -0.219147, -3.971295, 1, 0, 0, 1, 1,
-2.465728, 0.06146144, -1.022942, 1, 0, 0, 1, 1,
-2.357293, 0.02989103, -3.167473, 1, 0, 0, 1, 1,
-2.345758, -0.6624173, -1.86643, 1, 0, 0, 1, 1,
-2.290679, -0.60109, -0.6331508, 0, 0, 0, 1, 1,
-2.261813, 0.1103111, -1.687992, 0, 0, 0, 1, 1,
-2.245434, 2.397349, -2.228972, 0, 0, 0, 1, 1,
-2.238654, 1.588668, 0.7880183, 0, 0, 0, 1, 1,
-2.210553, 0.2908391, -1.367451, 0, 0, 0, 1, 1,
-2.205118, -1.442626, -3.246607, 0, 0, 0, 1, 1,
-2.204091, -0.454531, -2.329491, 0, 0, 0, 1, 1,
-2.131433, -1.093389, -1.673227, 1, 1, 1, 1, 1,
-2.116842, -2.466877, -3.007037, 1, 1, 1, 1, 1,
-2.114957, 0.9931253, -1.502389, 1, 1, 1, 1, 1,
-2.093796, -0.9244048, -1.578942, 1, 1, 1, 1, 1,
-2.082552, 0.9040732, -0.2201447, 1, 1, 1, 1, 1,
-2.057088, 0.02586371, -1.238332, 1, 1, 1, 1, 1,
-2.05262, 0.5016879, -0.6759829, 1, 1, 1, 1, 1,
-1.996342, 1.890598, -1.07583, 1, 1, 1, 1, 1,
-1.986329, -1.680345, -3.665304, 1, 1, 1, 1, 1,
-1.984987, -0.5003331, -1.073187, 1, 1, 1, 1, 1,
-1.975339, 1.030822, -0.1100345, 1, 1, 1, 1, 1,
-1.930291, -0.1525981, -0.910427, 1, 1, 1, 1, 1,
-1.915264, 0.6192095, 0.07295349, 1, 1, 1, 1, 1,
-1.91151, 1.779685, -0.768909, 1, 1, 1, 1, 1,
-1.907176, 0.4224317, -1.770453, 1, 1, 1, 1, 1,
-1.904598, -1.039903, -3.06725, 0, 0, 1, 1, 1,
-1.89821, -1.246119, -1.745704, 1, 0, 0, 1, 1,
-1.894142, 0.9045855, -1.29106, 1, 0, 0, 1, 1,
-1.89356, -0.1224434, -0.9392707, 1, 0, 0, 1, 1,
-1.888008, -1.312059, -2.769532, 1, 0, 0, 1, 1,
-1.885704, 0.3740207, -3.033687, 1, 0, 0, 1, 1,
-1.841053, 0.9032956, 0.2293912, 0, 0, 0, 1, 1,
-1.829445, -0.34001, -0.9462939, 0, 0, 0, 1, 1,
-1.828787, -0.3522808, -0.6181309, 0, 0, 0, 1, 1,
-1.827015, -0.5833591, -3.659627, 0, 0, 0, 1, 1,
-1.82551, 1.170146, -0.5372517, 0, 0, 0, 1, 1,
-1.821445, -0.444387, -3.134863, 0, 0, 0, 1, 1,
-1.788844, 0.4040574, -2.028709, 0, 0, 0, 1, 1,
-1.788199, 0.7558147, -1.867548, 1, 1, 1, 1, 1,
-1.778702, -1.21935, -2.191518, 1, 1, 1, 1, 1,
-1.76775, -0.3690856, -1.598271, 1, 1, 1, 1, 1,
-1.76091, 0.272896, -0.7047603, 1, 1, 1, 1, 1,
-1.758824, -0.4961504, -1.876058, 1, 1, 1, 1, 1,
-1.758823, 0.4287477, -0.8284528, 1, 1, 1, 1, 1,
-1.749255, -0.8786642, -3.462317, 1, 1, 1, 1, 1,
-1.745611, -0.376203, -2.456564, 1, 1, 1, 1, 1,
-1.732505, 0.3935643, -0.4650729, 1, 1, 1, 1, 1,
-1.73135, 0.2281851, -0.06211702, 1, 1, 1, 1, 1,
-1.704005, -0.4282645, -1.182192, 1, 1, 1, 1, 1,
-1.672066, -2.01776, -2.388453, 1, 1, 1, 1, 1,
-1.666587, -0.02949485, -1.828975, 1, 1, 1, 1, 1,
-1.645491, -1.788304, -1.731045, 1, 1, 1, 1, 1,
-1.643828, -1.67709, -2.419054, 1, 1, 1, 1, 1,
-1.641573, -0.04163894, -1.225388, 0, 0, 1, 1, 1,
-1.641336, 0.7202165, -2.779547, 1, 0, 0, 1, 1,
-1.640783, -1.478167, -2.138915, 1, 0, 0, 1, 1,
-1.638679, 1.946006, -1.698655, 1, 0, 0, 1, 1,
-1.630271, -0.5403759, -0.655784, 1, 0, 0, 1, 1,
-1.614117, 0.02372887, -1.068047, 1, 0, 0, 1, 1,
-1.588972, 1.224456, -2.353347, 0, 0, 0, 1, 1,
-1.586508, 0.1376379, -0.8092269, 0, 0, 0, 1, 1,
-1.573817, -0.08256407, -1.928124, 0, 0, 0, 1, 1,
-1.569118, -0.4778363, -1.697737, 0, 0, 0, 1, 1,
-1.568788, -0.6934404, -2.911829, 0, 0, 0, 1, 1,
-1.566271, 0.01427902, -0.4602168, 0, 0, 0, 1, 1,
-1.565314, -0.6761581, -3.299671, 0, 0, 0, 1, 1,
-1.539971, -0.2822664, -2.663342, 1, 1, 1, 1, 1,
-1.533893, 1.153935, -1.580829, 1, 1, 1, 1, 1,
-1.517005, 0.002449135, -1.926872, 1, 1, 1, 1, 1,
-1.495147, 0.8418261, -1.578399, 1, 1, 1, 1, 1,
-1.494355, -1.006869, -1.437421, 1, 1, 1, 1, 1,
-1.477173, 0.3657584, -2.198401, 1, 1, 1, 1, 1,
-1.47666, -2.316628, -3.161519, 1, 1, 1, 1, 1,
-1.472534, -0.3883463, -0.8491767, 1, 1, 1, 1, 1,
-1.461912, 1.04248, -2.549263, 1, 1, 1, 1, 1,
-1.450697, -0.3565629, -0.9462254, 1, 1, 1, 1, 1,
-1.45068, 0.6108943, -0.5466928, 1, 1, 1, 1, 1,
-1.442642, -1.196844, -3.103591, 1, 1, 1, 1, 1,
-1.435301, -0.4889049, -2.376046, 1, 1, 1, 1, 1,
-1.435192, -1.163627, -2.791601, 1, 1, 1, 1, 1,
-1.416127, -1.081471, -3.04286, 1, 1, 1, 1, 1,
-1.414945, 0.3655317, -3.732593, 0, 0, 1, 1, 1,
-1.414045, 1.875936, -0.7220846, 1, 0, 0, 1, 1,
-1.413631, 1.53649, -0.7076401, 1, 0, 0, 1, 1,
-1.409516, 0.822826, -0.0750858, 1, 0, 0, 1, 1,
-1.382831, -0.7531172, -0.8187509, 1, 0, 0, 1, 1,
-1.382355, -0.9082177, -2.208345, 1, 0, 0, 1, 1,
-1.375543, -0.2211706, -2.273903, 0, 0, 0, 1, 1,
-1.371525, 0.8335665, -0.6470351, 0, 0, 0, 1, 1,
-1.371442, 1.318926, -1.568433, 0, 0, 0, 1, 1,
-1.367545, 0.2545895, -2.097073, 0, 0, 0, 1, 1,
-1.367438, -2.920924, -2.625158, 0, 0, 0, 1, 1,
-1.358236, 1.290007, 0.5085402, 0, 0, 0, 1, 1,
-1.347677, 1.362649, -1.049131, 0, 0, 0, 1, 1,
-1.339348, -0.4479922, -2.375398, 1, 1, 1, 1, 1,
-1.335844, 0.5281912, -2.151877, 1, 1, 1, 1, 1,
-1.335412, -0.5026683, -0.6801411, 1, 1, 1, 1, 1,
-1.321914, -0.1932929, -0.5698653, 1, 1, 1, 1, 1,
-1.310546, -1.149896, -2.561365, 1, 1, 1, 1, 1,
-1.293463, 2.120527, -1.583316, 1, 1, 1, 1, 1,
-1.285397, 0.2265302, -1.941394, 1, 1, 1, 1, 1,
-1.275319, -0.3283635, -3.189022, 1, 1, 1, 1, 1,
-1.268235, -0.5374495, -3.208806, 1, 1, 1, 1, 1,
-1.260531, 0.1432979, -1.667216, 1, 1, 1, 1, 1,
-1.258974, 2.044983, -0.6492367, 1, 1, 1, 1, 1,
-1.257293, -0.09324729, -1.542154, 1, 1, 1, 1, 1,
-1.239771, 0.2933401, -2.405979, 1, 1, 1, 1, 1,
-1.239259, -0.08024334, 1.429731, 1, 1, 1, 1, 1,
-1.23585, 0.6197854, -1.512917, 1, 1, 1, 1, 1,
-1.235573, 1.352593, -0.3803347, 0, 0, 1, 1, 1,
-1.234672, 3.004451, -2.348902, 1, 0, 0, 1, 1,
-1.231851, -0.3406273, -0.3762985, 1, 0, 0, 1, 1,
-1.229065, -0.5515916, -3.195001, 1, 0, 0, 1, 1,
-1.226919, -1.16237, -2.303262, 1, 0, 0, 1, 1,
-1.222795, -1.162499, -4.069678, 1, 0, 0, 1, 1,
-1.222154, 0.1321724, -2.942567, 0, 0, 0, 1, 1,
-1.21436, 1.477061, 0.637954, 0, 0, 0, 1, 1,
-1.206984, -0.9036276, -2.694778, 0, 0, 0, 1, 1,
-1.201895, 0.5370429, -1.657715, 0, 0, 0, 1, 1,
-1.194538, -0.1407784, -0.4710458, 0, 0, 0, 1, 1,
-1.19446, -0.5458796, -2.876856, 0, 0, 0, 1, 1,
-1.193732, 3.092695, -0.6876383, 0, 0, 0, 1, 1,
-1.185903, 1.708237, 1.04312, 1, 1, 1, 1, 1,
-1.184007, 0.4646718, -1.742367, 1, 1, 1, 1, 1,
-1.182776, 1.0288, 0.2230712, 1, 1, 1, 1, 1,
-1.182146, 1.019137, -0.4370851, 1, 1, 1, 1, 1,
-1.181048, 0.1819436, -5.111311, 1, 1, 1, 1, 1,
-1.17972, 0.912005, -1.912903, 1, 1, 1, 1, 1,
-1.176165, 0.7170134, -0.9656278, 1, 1, 1, 1, 1,
-1.158212, 1.339143, -1.474967, 1, 1, 1, 1, 1,
-1.14593, -0.6789581, -1.930314, 1, 1, 1, 1, 1,
-1.138604, 0.9482381, -0.8579979, 1, 1, 1, 1, 1,
-1.133246, 0.5842332, 0.545487, 1, 1, 1, 1, 1,
-1.132451, -0.903373, -1.304831, 1, 1, 1, 1, 1,
-1.125782, 1.151977, -1.088853, 1, 1, 1, 1, 1,
-1.121132, -0.1171266, -2.92621, 1, 1, 1, 1, 1,
-1.1112, 1.044247, -1.254808, 1, 1, 1, 1, 1,
-1.110996, -0.08389333, 0.3675057, 0, 0, 1, 1, 1,
-1.106799, -1.055309, -2.469197, 1, 0, 0, 1, 1,
-1.103095, 0.9383588, -0.9401566, 1, 0, 0, 1, 1,
-1.100561, 0.7929118, -0.9499414, 1, 0, 0, 1, 1,
-1.093795, 0.4695071, -1.08584, 1, 0, 0, 1, 1,
-1.09178, -0.9810684, -1.684366, 1, 0, 0, 1, 1,
-1.087536, -0.05424449, -3.598463, 0, 0, 0, 1, 1,
-1.087273, 1.351913, -2.113883, 0, 0, 0, 1, 1,
-1.085389, 0.6158581, -0.8395736, 0, 0, 0, 1, 1,
-1.085112, 0.07812502, -1.291046, 0, 0, 0, 1, 1,
-1.082377, 0.02241144, -3.273454, 0, 0, 0, 1, 1,
-1.076556, -1.091922, -2.428059, 0, 0, 0, 1, 1,
-1.057983, -0.7170334, -0.8107823, 0, 0, 0, 1, 1,
-1.055791, -0.9241874, -3.431915, 1, 1, 1, 1, 1,
-1.052784, 1.029887, 1.153211, 1, 1, 1, 1, 1,
-1.04687, 0.3384377, -2.287738, 1, 1, 1, 1, 1,
-1.033146, 1.692479, -0.02394087, 1, 1, 1, 1, 1,
-1.032114, -0.2496397, -2.186327, 1, 1, 1, 1, 1,
-1.03007, 1.760237, 0.8461925, 1, 1, 1, 1, 1,
-1.026526, -0.7426074, -1.185787, 1, 1, 1, 1, 1,
-1.022192, -0.3665422, -2.866984, 1, 1, 1, 1, 1,
-1.022078, -0.5302235, -1.380622, 1, 1, 1, 1, 1,
-1.019413, 0.4844689, -0.01488841, 1, 1, 1, 1, 1,
-1.019282, 1.673195, 0.5604456, 1, 1, 1, 1, 1,
-1.006802, -0.7927971, -2.452778, 1, 1, 1, 1, 1,
-1.005284, 0.1158533, -1.488376, 1, 1, 1, 1, 1,
-1.001572, -1.523558, -2.353056, 1, 1, 1, 1, 1,
-0.9986021, 1.292328, -2.067647, 1, 1, 1, 1, 1,
-0.9822203, 0.6718191, 0.2544485, 0, 0, 1, 1, 1,
-0.9742425, 0.584996, -0.7382894, 1, 0, 0, 1, 1,
-0.9734221, -0.4383227, -1.762712, 1, 0, 0, 1, 1,
-0.9725544, 1.418757, -1.671035, 1, 0, 0, 1, 1,
-0.964331, -0.5215864, -0.3632017, 1, 0, 0, 1, 1,
-0.9535753, 0.1385347, -1.878459, 1, 0, 0, 1, 1,
-0.9403841, 0.4955541, -0.6594323, 0, 0, 0, 1, 1,
-0.9358505, 0.4176663, -2.050245, 0, 0, 0, 1, 1,
-0.9350665, 0.7169704, -0.6398622, 0, 0, 0, 1, 1,
-0.9331807, -0.6240038, -1.21102, 0, 0, 0, 1, 1,
-0.9324545, 0.6171904, -1.269407, 0, 0, 0, 1, 1,
-0.9300082, 0.4820096, -0.9756653, 0, 0, 0, 1, 1,
-0.9222875, -0.9432592, -3.083593, 0, 0, 0, 1, 1,
-0.9221609, 1.333903, 1.235757, 1, 1, 1, 1, 1,
-0.9180173, -1.362102, -1.840019, 1, 1, 1, 1, 1,
-0.916344, 0.5740114, -1.964133, 1, 1, 1, 1, 1,
-0.9125677, -0.5354518, -3.996498, 1, 1, 1, 1, 1,
-0.908222, -2.322238, -0.5630224, 1, 1, 1, 1, 1,
-0.9070264, -0.3533906, -2.771011, 1, 1, 1, 1, 1,
-0.9042611, -0.2325182, -1.958633, 1, 1, 1, 1, 1,
-0.8997511, 0.2043879, -1.493348, 1, 1, 1, 1, 1,
-0.8921786, -0.3593054, -3.541392, 1, 1, 1, 1, 1,
-0.8870676, 1.100992, -1.608101, 1, 1, 1, 1, 1,
-0.8867419, -2.326651, -3.440255, 1, 1, 1, 1, 1,
-0.8816386, 0.202732, -2.026841, 1, 1, 1, 1, 1,
-0.8741235, -0.9738783, -2.937018, 1, 1, 1, 1, 1,
-0.8707164, 1.245898, -2.612688, 1, 1, 1, 1, 1,
-0.8645129, 0.04904259, -2.783065, 1, 1, 1, 1, 1,
-0.8540681, 0.3638524, -2.109006, 0, 0, 1, 1, 1,
-0.847068, 0.4647597, -2.268132, 1, 0, 0, 1, 1,
-0.8444218, 0.3213111, -1.353472, 1, 0, 0, 1, 1,
-0.8422054, -1.806779, -1.788108, 1, 0, 0, 1, 1,
-0.8401542, 1.857586, -0.2509668, 1, 0, 0, 1, 1,
-0.8401256, 0.391889, -2.403852, 1, 0, 0, 1, 1,
-0.837925, -0.9933704, -1.527842, 0, 0, 0, 1, 1,
-0.8355507, -1.015266, -0.7992985, 0, 0, 0, 1, 1,
-0.8331455, -2.530589, -2.901181, 0, 0, 0, 1, 1,
-0.8270544, 1.428524, -1.703555, 0, 0, 0, 1, 1,
-0.8236453, 0.2097414, -1.072683, 0, 0, 0, 1, 1,
-0.8157431, -0.8900446, -2.260363, 0, 0, 0, 1, 1,
-0.8112851, -0.7939836, -0.8638452, 0, 0, 0, 1, 1,
-0.8103665, 0.867067, -0.5561379, 1, 1, 1, 1, 1,
-0.8102086, 1.605166, -0.1860082, 1, 1, 1, 1, 1,
-0.8006015, 0.959223, -0.373593, 1, 1, 1, 1, 1,
-0.7966813, -0.7119517, -2.486795, 1, 1, 1, 1, 1,
-0.7857703, -3.043218, -2.769645, 1, 1, 1, 1, 1,
-0.7740941, 1.171713, 0.04781817, 1, 1, 1, 1, 1,
-0.7665075, -1.027009, -3.713737, 1, 1, 1, 1, 1,
-0.7649975, 0.05918778, -0.8053347, 1, 1, 1, 1, 1,
-0.7608173, -0.6257806, -5.10681, 1, 1, 1, 1, 1,
-0.759452, 0.2786825, -0.9252613, 1, 1, 1, 1, 1,
-0.7523893, 0.7638394, -0.7724614, 1, 1, 1, 1, 1,
-0.7515483, 1.541848, -2.50918, 1, 1, 1, 1, 1,
-0.7462503, -1.117702, -4.839089, 1, 1, 1, 1, 1,
-0.7457275, 1.809506, -0.9119766, 1, 1, 1, 1, 1,
-0.7432992, -0.4198304, -1.582849, 1, 1, 1, 1, 1,
-0.741633, -1.917676, -3.533993, 0, 0, 1, 1, 1,
-0.7392006, 0.009572121, -3.344451, 1, 0, 0, 1, 1,
-0.7347183, -1.618026, -2.881665, 1, 0, 0, 1, 1,
-0.7338411, 0.4521445, -2.550541, 1, 0, 0, 1, 1,
-0.7328486, 1.057571, -0.123909, 1, 0, 0, 1, 1,
-0.731213, 0.8840255, 0.2278589, 1, 0, 0, 1, 1,
-0.7308139, 0.4441257, -1.613233, 0, 0, 0, 1, 1,
-0.7240615, 0.2063209, -1.976621, 0, 0, 0, 1, 1,
-0.7237445, -0.09704191, -2.694856, 0, 0, 0, 1, 1,
-0.7218028, 0.6269398, 0.4999351, 0, 0, 0, 1, 1,
-0.7192036, -1.4995, -2.113893, 0, 0, 0, 1, 1,
-0.7177401, -0.4363482, -2.451033, 0, 0, 0, 1, 1,
-0.714189, 1.082361, -1.221207, 0, 0, 0, 1, 1,
-0.7126577, 1.416636, 0.3956558, 1, 1, 1, 1, 1,
-0.7107873, 1.086646, -0.5348986, 1, 1, 1, 1, 1,
-0.7085134, -0.371046, -2.010222, 1, 1, 1, 1, 1,
-0.7080662, -0.3917471, -3.686462, 1, 1, 1, 1, 1,
-0.7076656, -0.8658076, -2.246204, 1, 1, 1, 1, 1,
-0.7073883, -0.6679464, -1.013064, 1, 1, 1, 1, 1,
-0.7053655, 2.201362, -0.8938013, 1, 1, 1, 1, 1,
-0.7019522, 0.3767215, -1.02186, 1, 1, 1, 1, 1,
-0.698441, 1.655519, -0.3168663, 1, 1, 1, 1, 1,
-0.6970776, 1.227451, -0.4240343, 1, 1, 1, 1, 1,
-0.6937754, -0.3787211, -2.388835, 1, 1, 1, 1, 1,
-0.692364, 0.8851351, -0.8765897, 1, 1, 1, 1, 1,
-0.6853462, 3.310047, -0.1165103, 1, 1, 1, 1, 1,
-0.6836691, -1.345003, -2.183852, 1, 1, 1, 1, 1,
-0.6781984, -0.7722738, -2.632818, 1, 1, 1, 1, 1,
-0.6759446, 2.053257, -1.27301, 0, 0, 1, 1, 1,
-0.6712295, 0.5081272, -0.271696, 1, 0, 0, 1, 1,
-0.6677362, -1.952058, -2.496588, 1, 0, 0, 1, 1,
-0.6665722, 0.3363465, -0.3958975, 1, 0, 0, 1, 1,
-0.6660172, 0.3135346, -0.8709908, 1, 0, 0, 1, 1,
-0.6639188, -0.3959797, -3.285782, 1, 0, 0, 1, 1,
-0.6636018, -0.4317194, -4.502972, 0, 0, 0, 1, 1,
-0.6597023, -0.6902738, -1.80821, 0, 0, 0, 1, 1,
-0.6578458, 0.2988051, -1.639377, 0, 0, 0, 1, 1,
-0.6539575, 0.9036465, -2.400661, 0, 0, 0, 1, 1,
-0.6523575, 0.7570084, 1.195773, 0, 0, 0, 1, 1,
-0.6523287, 1.29463, -0.8240002, 0, 0, 0, 1, 1,
-0.652253, -0.8692391, -2.414042, 0, 0, 0, 1, 1,
-0.6503977, 0.4365457, -1.112902, 1, 1, 1, 1, 1,
-0.6475455, 0.8685919, -2.924493, 1, 1, 1, 1, 1,
-0.6445265, 0.5896454, -0.3422142, 1, 1, 1, 1, 1,
-0.644109, -0.1939604, -1.540429, 1, 1, 1, 1, 1,
-0.6377312, -2.484755, -3.189061, 1, 1, 1, 1, 1,
-0.6321495, 1.420725, -0.8717409, 1, 1, 1, 1, 1,
-0.6240007, -1.067162, -3.538402, 1, 1, 1, 1, 1,
-0.6231884, -0.413722, -2.698156, 1, 1, 1, 1, 1,
-0.6193849, -1.419472, -2.754988, 1, 1, 1, 1, 1,
-0.6084301, -1.341865, -2.584288, 1, 1, 1, 1, 1,
-0.603529, -0.947661, -1.182696, 1, 1, 1, 1, 1,
-0.6025099, 0.2238532, -1.854982, 1, 1, 1, 1, 1,
-0.6021192, -0.7448512, -2.927047, 1, 1, 1, 1, 1,
-0.5961396, -1.919336, -2.617267, 1, 1, 1, 1, 1,
-0.5950411, -0.4893917, -1.486344, 1, 1, 1, 1, 1,
-0.5944688, 0.1289885, -2.18706, 0, 0, 1, 1, 1,
-0.5902627, 0.3070432, -1.000424, 1, 0, 0, 1, 1,
-0.5895255, 0.7822563, 1.128919, 1, 0, 0, 1, 1,
-0.5894095, -0.7929019, -2.273624, 1, 0, 0, 1, 1,
-0.5847699, -0.3515856, -3.165833, 1, 0, 0, 1, 1,
-0.5826505, -1.136162, -3.517558, 1, 0, 0, 1, 1,
-0.5814707, -1.137951, -2.636578, 0, 0, 0, 1, 1,
-0.5808868, -1.299869, -3.468319, 0, 0, 0, 1, 1,
-0.5784497, -1.253408, -1.911502, 0, 0, 0, 1, 1,
-0.5781339, 1.089936, 1.281052, 0, 0, 0, 1, 1,
-0.577336, -1.131977, -1.365776, 0, 0, 0, 1, 1,
-0.5492517, -1.301393, -2.472307, 0, 0, 0, 1, 1,
-0.5474422, -0.04123408, -1.684123, 0, 0, 0, 1, 1,
-0.5450168, 0.0235987, -2.234674, 1, 1, 1, 1, 1,
-0.5423226, -1.212931, -3.50575, 1, 1, 1, 1, 1,
-0.5394868, 1.057283, -0.3592806, 1, 1, 1, 1, 1,
-0.537944, -1.192958, -2.968905, 1, 1, 1, 1, 1,
-0.5311016, -0.1624848, -1.963162, 1, 1, 1, 1, 1,
-0.5310376, -0.2415025, -3.064582, 1, 1, 1, 1, 1,
-0.5264658, -0.9139615, -2.692546, 1, 1, 1, 1, 1,
-0.5224096, 0.610759, -0.7677381, 1, 1, 1, 1, 1,
-0.5185396, -1.618013, -0.8821113, 1, 1, 1, 1, 1,
-0.5140417, -1.687857, -2.293016, 1, 1, 1, 1, 1,
-0.5087474, -0.8783023, -4.014538, 1, 1, 1, 1, 1,
-0.5086797, -0.5066707, -3.891413, 1, 1, 1, 1, 1,
-0.5083491, -0.06877202, -2.276943, 1, 1, 1, 1, 1,
-0.5003907, -0.329087, -2.611149, 1, 1, 1, 1, 1,
-0.4954763, 1.572115, -0.7421027, 1, 1, 1, 1, 1,
-0.4948678, -1.082617, -2.431239, 0, 0, 1, 1, 1,
-0.4843825, 1.161101, -1.482687, 1, 0, 0, 1, 1,
-0.4821332, -0.5991282, -3.019132, 1, 0, 0, 1, 1,
-0.4757035, -1.587822, -1.161219, 1, 0, 0, 1, 1,
-0.4732303, -2.239923, -1.86067, 1, 0, 0, 1, 1,
-0.4715923, -1.148173, -3.925608, 1, 0, 0, 1, 1,
-0.4684226, 0.02882072, -1.71169, 0, 0, 0, 1, 1,
-0.4674757, 0.8435214, -0.674825, 0, 0, 0, 1, 1,
-0.466568, 0.4851155, -1.220137, 0, 0, 0, 1, 1,
-0.4640249, -0.9038637, -2.078703, 0, 0, 0, 1, 1,
-0.4612478, -0.3610763, -1.016043, 0, 0, 0, 1, 1,
-0.4579116, -1.457059, -3.270402, 0, 0, 0, 1, 1,
-0.4575777, -1.913194, -0.9348404, 0, 0, 0, 1, 1,
-0.4541817, -1.12524, -1.884422, 1, 1, 1, 1, 1,
-0.4530146, 1.442605, -1.488365, 1, 1, 1, 1, 1,
-0.4516889, 2.214185, -0.005593124, 1, 1, 1, 1, 1,
-0.4499259, -0.157109, -0.9782895, 1, 1, 1, 1, 1,
-0.4453962, 1.013016, -0.4216648, 1, 1, 1, 1, 1,
-0.4423092, -0.4052546, -1.596102, 1, 1, 1, 1, 1,
-0.4418715, -0.9679825, -2.092695, 1, 1, 1, 1, 1,
-0.4392858, 0.1665877, -4.276645, 1, 1, 1, 1, 1,
-0.4348185, -0.5594525, -3.276948, 1, 1, 1, 1, 1,
-0.4340833, 0.7923322, -0.0910553, 1, 1, 1, 1, 1,
-0.4333038, -1.120065, -3.49242, 1, 1, 1, 1, 1,
-0.4332989, 1.778985, 0.7464072, 1, 1, 1, 1, 1,
-0.4319331, 1.823673, -0.2496564, 1, 1, 1, 1, 1,
-0.4319267, -0.8072191, -3.577964, 1, 1, 1, 1, 1,
-0.4306625, -1.064384, -4.391701, 1, 1, 1, 1, 1,
-0.4281334, 1.719141, -0.1605342, 0, 0, 1, 1, 1,
-0.4259014, 0.06353178, 0.9217867, 1, 0, 0, 1, 1,
-0.4256932, 0.03532207, -1.169598, 1, 0, 0, 1, 1,
-0.4246207, 0.2544383, -2.089999, 1, 0, 0, 1, 1,
-0.420193, 1.263397, -0.6764495, 1, 0, 0, 1, 1,
-0.4176951, 0.887242, -1.440689, 1, 0, 0, 1, 1,
-0.4171028, 0.1974719, -0.6953384, 0, 0, 0, 1, 1,
-0.4162041, 1.28323, -0.7960357, 0, 0, 0, 1, 1,
-0.4132262, -0.4929085, -2.684717, 0, 0, 0, 1, 1,
-0.4125274, -2.009183, -2.001458, 0, 0, 0, 1, 1,
-0.4054688, 0.8752443, 0.4178965, 0, 0, 0, 1, 1,
-0.4029734, 0.9993408, 1.083853, 0, 0, 0, 1, 1,
-0.402295, 2.550026, 0.2390731, 0, 0, 0, 1, 1,
-0.3979526, -0.7332034, -1.630711, 1, 1, 1, 1, 1,
-0.3968931, 1.253155, -1.226186, 1, 1, 1, 1, 1,
-0.3933948, 1.197035, 0.8488006, 1, 1, 1, 1, 1,
-0.3901186, 0.03035625, -1.405044, 1, 1, 1, 1, 1,
-0.3886747, -1.457221, -3.636395, 1, 1, 1, 1, 1,
-0.381005, 0.07078124, -1.76772, 1, 1, 1, 1, 1,
-0.3730912, -0.5364843, -2.026273, 1, 1, 1, 1, 1,
-0.3667509, 0.04247008, -0.7575332, 1, 1, 1, 1, 1,
-0.3665734, -0.5375649, -0.5757403, 1, 1, 1, 1, 1,
-0.3656663, 1.022293, 0.9128057, 1, 1, 1, 1, 1,
-0.3618355, -0.4913575, -2.719894, 1, 1, 1, 1, 1,
-0.3600414, -0.2185354, -1.946383, 1, 1, 1, 1, 1,
-0.3487813, 0.6649287, -1.513757, 1, 1, 1, 1, 1,
-0.3485594, 0.1191778, -1.601185, 1, 1, 1, 1, 1,
-0.3449064, 0.3112925, -0.2279146, 1, 1, 1, 1, 1,
-0.3427462, -0.8621584, -5.208934, 0, 0, 1, 1, 1,
-0.3426901, -0.7651776, -2.060804, 1, 0, 0, 1, 1,
-0.3322389, 0.374649, -0.1749081, 1, 0, 0, 1, 1,
-0.3253226, -1.432059, -3.190794, 1, 0, 0, 1, 1,
-0.3249331, 0.1910436, 0.01213675, 1, 0, 0, 1, 1,
-0.3245875, -0.6030291, -2.081794, 1, 0, 0, 1, 1,
-0.3244946, -0.04217716, 0.004506249, 0, 0, 0, 1, 1,
-0.3236009, 1.691032, 0.889782, 0, 0, 0, 1, 1,
-0.3156438, 0.5401009, -0.3402343, 0, 0, 0, 1, 1,
-0.3094639, -0.9523761, -2.630652, 0, 0, 0, 1, 1,
-0.3044621, -1.223567, -3.568582, 0, 0, 0, 1, 1,
-0.3043939, -0.6456794, -2.942756, 0, 0, 0, 1, 1,
-0.3035733, -0.4766939, -2.445317, 0, 0, 0, 1, 1,
-0.302105, -0.5782134, -2.257635, 1, 1, 1, 1, 1,
-0.3012634, 0.292916, 0.724569, 1, 1, 1, 1, 1,
-0.3002889, -0.1590095, -3.814416, 1, 1, 1, 1, 1,
-0.2937005, 0.2424084, 1.255945, 1, 1, 1, 1, 1,
-0.2880502, -0.3037551, -1.054364, 1, 1, 1, 1, 1,
-0.2850556, -0.4104857, 0.3313937, 1, 1, 1, 1, 1,
-0.2826926, 1.424983, -0.05862276, 1, 1, 1, 1, 1,
-0.2809793, 1.418421, -1.386759, 1, 1, 1, 1, 1,
-0.2794071, -1.162847, -1.395972, 1, 1, 1, 1, 1,
-0.2787676, 0.1584144, -3.218659, 1, 1, 1, 1, 1,
-0.2777466, 1.087557, 1.322359, 1, 1, 1, 1, 1,
-0.2775327, -0.01587917, -0.8598859, 1, 1, 1, 1, 1,
-0.2763494, 0.2704058, -0.8705396, 1, 1, 1, 1, 1,
-0.2678337, 1.140411, -0.0829386, 1, 1, 1, 1, 1,
-0.2609845, 1.246053, -1.519921, 1, 1, 1, 1, 1,
-0.2525015, 2.224362, 0.3806934, 0, 0, 1, 1, 1,
-0.2521843, 1.206632, -0.04207192, 1, 0, 0, 1, 1,
-0.2475156, 1.04116, 0.2428409, 1, 0, 0, 1, 1,
-0.2463511, -0.9281429, -2.268252, 1, 0, 0, 1, 1,
-0.2459339, 0.8401424, -0.6979129, 1, 0, 0, 1, 1,
-0.2453846, 0.3384008, -2.5267, 1, 0, 0, 1, 1,
-0.2447695, 0.2178082, -1.56855, 0, 0, 0, 1, 1,
-0.244716, 0.3370572, -1.319636, 0, 0, 0, 1, 1,
-0.2417001, 1.117422, 0.05667973, 0, 0, 0, 1, 1,
-0.2281198, 0.3435334, 0.04867079, 0, 0, 0, 1, 1,
-0.2253, 0.3791652, -0.06752499, 0, 0, 0, 1, 1,
-0.2169662, -0.8784866, -2.375665, 0, 0, 0, 1, 1,
-0.2160684, -0.3396679, -2.814286, 0, 0, 0, 1, 1,
-0.21488, 0.0837241, 0.378711, 1, 1, 1, 1, 1,
-0.2146674, -1.318369, -4.602588, 1, 1, 1, 1, 1,
-0.2144951, 1.119199, 0.8040947, 1, 1, 1, 1, 1,
-0.2110747, 1.919383, 0.4284074, 1, 1, 1, 1, 1,
-0.2107568, -0.7377095, -3.126642, 1, 1, 1, 1, 1,
-0.2084918, 1.629001, 1.311065, 1, 1, 1, 1, 1,
-0.2067542, -1.127267, -3.634835, 1, 1, 1, 1, 1,
-0.2060501, -0.5471836, -1.880857, 1, 1, 1, 1, 1,
-0.2039166, -0.6260431, -3.582699, 1, 1, 1, 1, 1,
-0.2023418, -0.8060498, -1.275912, 1, 1, 1, 1, 1,
-0.2004413, 1.058223, 0.004267804, 1, 1, 1, 1, 1,
-0.1877296, -0.7046173, -2.196702, 1, 1, 1, 1, 1,
-0.1854003, 0.03011767, -1.078639, 1, 1, 1, 1, 1,
-0.1853229, -0.04103284, -0.9553328, 1, 1, 1, 1, 1,
-0.183773, -0.22466, -1.630363, 1, 1, 1, 1, 1,
-0.17877, -2.375825, -4.892388, 0, 0, 1, 1, 1,
-0.1675071, -1.001122, -1.148212, 1, 0, 0, 1, 1,
-0.1662319, -0.4189648, -3.893882, 1, 0, 0, 1, 1,
-0.1619129, 0.5999917, -1.033357, 1, 0, 0, 1, 1,
-0.1601698, 1.13656, -0.9958655, 1, 0, 0, 1, 1,
-0.1565799, -0.2320361, -1.502552, 1, 0, 0, 1, 1,
-0.150812, 0.9830414, -1.60346, 0, 0, 0, 1, 1,
-0.1440398, 0.3920879, -0.007215376, 0, 0, 0, 1, 1,
-0.1436578, 1.274924, 0.8770493, 0, 0, 0, 1, 1,
-0.1313887, -0.7079856, -2.238995, 0, 0, 0, 1, 1,
-0.1310994, 0.4009203, -0.22644, 0, 0, 0, 1, 1,
-0.1209122, -0.4449945, -1.719875, 0, 0, 0, 1, 1,
-0.1181902, 0.6581085, -1.055768, 0, 0, 0, 1, 1,
-0.1135309, -0.670507, -2.811212, 1, 1, 1, 1, 1,
-0.111278, 1.499409, 0.3963853, 1, 1, 1, 1, 1,
-0.1101902, -0.3239049, -3.881383, 1, 1, 1, 1, 1,
-0.1079597, 0.2045078, 0.4233642, 1, 1, 1, 1, 1,
-0.1077999, 0.2048468, 0.03440746, 1, 1, 1, 1, 1,
-0.1010518, 0.8167907, 0.4139397, 1, 1, 1, 1, 1,
-0.09660244, 0.4287492, 0.519667, 1, 1, 1, 1, 1,
-0.09484747, -0.1223056, -3.362767, 1, 1, 1, 1, 1,
-0.09106337, 0.8959294, -1.113504, 1, 1, 1, 1, 1,
-0.09044953, 1.296524, -1.271649, 1, 1, 1, 1, 1,
-0.09026319, 0.5082724, 1.557611, 1, 1, 1, 1, 1,
-0.08860311, 1.318292, -1.252603, 1, 1, 1, 1, 1,
-0.08832102, -1.894632, -5.339381, 1, 1, 1, 1, 1,
-0.08746608, 0.2225709, -2.407189, 1, 1, 1, 1, 1,
-0.08568526, 1.079191, 0.2075458, 1, 1, 1, 1, 1,
-0.08333943, -0.2527726, -2.542273, 0, 0, 1, 1, 1,
-0.08251781, -0.6469024, -4.433154, 1, 0, 0, 1, 1,
-0.07571226, 0.367353, 0.2896375, 1, 0, 0, 1, 1,
-0.07543051, -1.222565, -3.574643, 1, 0, 0, 1, 1,
-0.07404594, -0.702934, -3.362523, 1, 0, 0, 1, 1,
-0.07236444, -0.8321512, -2.375992, 1, 0, 0, 1, 1,
-0.06640896, -1.547955, -4.50256, 0, 0, 0, 1, 1,
-0.06600247, -0.5550694, -1.781244, 0, 0, 0, 1, 1,
-0.06450613, 0.1633747, 0.7245259, 0, 0, 0, 1, 1,
-0.0637702, 0.4908935, -0.2794705, 0, 0, 0, 1, 1,
-0.06065506, 1.954679, -0.03002721, 0, 0, 0, 1, 1,
-0.05968341, -0.8018605, -3.992162, 0, 0, 0, 1, 1,
-0.05126474, 0.7074666, 0.4659909, 0, 0, 0, 1, 1,
-0.05073541, -0.8756709, -2.928237, 1, 1, 1, 1, 1,
-0.04902396, -1.009222, -3.000945, 1, 1, 1, 1, 1,
-0.04411328, -0.1828564, -2.318893, 1, 1, 1, 1, 1,
-0.04323775, 1.41793, -0.4709677, 1, 1, 1, 1, 1,
-0.04278632, -1.044028, -3.837096, 1, 1, 1, 1, 1,
-0.04246812, -0.8606458, -3.957272, 1, 1, 1, 1, 1,
-0.04076376, -0.2368296, -1.661279, 1, 1, 1, 1, 1,
-0.03737425, 0.4807856, 1.048577, 1, 1, 1, 1, 1,
-0.03704963, 0.5244526, -0.0959128, 1, 1, 1, 1, 1,
-0.0362058, 2.552995, -0.854043, 1, 1, 1, 1, 1,
-0.03559967, -0.5824237, -1.717844, 1, 1, 1, 1, 1,
-0.03489097, 0.5243302, 1.022116, 1, 1, 1, 1, 1,
-0.03403276, -0.4406725, -1.364156, 1, 1, 1, 1, 1,
-0.03388776, -0.6756232, -2.628986, 1, 1, 1, 1, 1,
-0.03316343, -0.6373047, -3.133268, 1, 1, 1, 1, 1,
-0.02917672, -0.1635485, -4.389632, 0, 0, 1, 1, 1,
-0.02722152, 0.627141, 0.7146021, 1, 0, 0, 1, 1,
-0.02030071, -1.719914, -1.445598, 1, 0, 0, 1, 1,
-0.01315983, -1.155881, -3.69598, 1, 0, 0, 1, 1,
-0.01083235, 0.9471344, 1.802558, 1, 0, 0, 1, 1,
-0.00969955, -0.7795957, -3.92153, 1, 0, 0, 1, 1,
-0.008692172, -2.287939, -3.402509, 0, 0, 0, 1, 1,
-0.008287128, -0.1103307, -2.985406, 0, 0, 0, 1, 1,
-0.003951847, -0.5837359, -1.427857, 0, 0, 0, 1, 1,
-0.000789627, -0.7812724, -2.107517, 0, 0, 0, 1, 1,
0.000155416, -0.732625, 3.884905, 0, 0, 0, 1, 1,
0.004394822, 0.9940962, 1.203462, 0, 0, 0, 1, 1,
0.00478753, 1.704853, -1.178859, 0, 0, 0, 1, 1,
0.007328061, 2.115358, -2.127687, 1, 1, 1, 1, 1,
0.008592078, 0.8944944, 1.115291, 1, 1, 1, 1, 1,
0.01044634, 2.40565, -0.7371627, 1, 1, 1, 1, 1,
0.01188415, -0.03214622, 1.656492, 1, 1, 1, 1, 1,
0.01266134, -1.494442, 1.333002, 1, 1, 1, 1, 1,
0.02154033, -0.4299553, 3.02413, 1, 1, 1, 1, 1,
0.02268413, 0.6603331, 1.909335, 1, 1, 1, 1, 1,
0.03636239, 3.210533, 1.223109, 1, 1, 1, 1, 1,
0.03815972, -0.7082899, 2.61293, 1, 1, 1, 1, 1,
0.04060996, -0.6948887, 5.004837, 1, 1, 1, 1, 1,
0.04634082, -0.7939808, 2.558491, 1, 1, 1, 1, 1,
0.04787105, 0.09882472, 1.687046, 1, 1, 1, 1, 1,
0.05213413, -0.2541804, 0.2521651, 1, 1, 1, 1, 1,
0.05576975, -0.2349548, -0.07710321, 1, 1, 1, 1, 1,
0.05895278, -0.7790583, 4.059865, 1, 1, 1, 1, 1,
0.05914757, -0.4016665, 2.360605, 0, 0, 1, 1, 1,
0.0651112, -1.281963, 2.067056, 1, 0, 0, 1, 1,
0.065899, -0.9556175, 1.162843, 1, 0, 0, 1, 1,
0.0719808, -0.04664631, 1.128417, 1, 0, 0, 1, 1,
0.0774372, 0.4709682, 1.725162, 1, 0, 0, 1, 1,
0.08246673, 0.266003, 2.124689, 1, 0, 0, 1, 1,
0.08337107, 0.3318771, 3.163998, 0, 0, 0, 1, 1,
0.084993, 0.04754392, 1.342581, 0, 0, 0, 1, 1,
0.09037025, -0.3909322, 4.555076, 0, 0, 0, 1, 1,
0.09326436, -0.513526, 4.215007, 0, 0, 0, 1, 1,
0.09957039, 0.1457276, -0.3614741, 0, 0, 0, 1, 1,
0.1006419, 1.28938, 0.7066277, 0, 0, 0, 1, 1,
0.1031723, -0.1052498, 1.385883, 0, 0, 0, 1, 1,
0.1085421, -1.213809, 2.973768, 1, 1, 1, 1, 1,
0.1098598, -0.6567077, 3.172001, 1, 1, 1, 1, 1,
0.1111822, 1.000866, 1.62589, 1, 1, 1, 1, 1,
0.1148773, 1.274921, 1.144959, 1, 1, 1, 1, 1,
0.1155414, 0.3340998, -1.179601, 1, 1, 1, 1, 1,
0.1182648, -0.4898778, 2.919942, 1, 1, 1, 1, 1,
0.118321, 0.875308, 0.1089094, 1, 1, 1, 1, 1,
0.1186009, -0.9838632, 1.325953, 1, 1, 1, 1, 1,
0.1197772, 0.05559388, 1.529841, 1, 1, 1, 1, 1,
0.1226576, -0.06162296, 2.609737, 1, 1, 1, 1, 1,
0.1259009, -0.7774425, 3.725374, 1, 1, 1, 1, 1,
0.1282818, 1.359535, 0.6739927, 1, 1, 1, 1, 1,
0.1300844, -1.087724, 1.960021, 1, 1, 1, 1, 1,
0.1337557, 0.1564551, -0.628428, 1, 1, 1, 1, 1,
0.13672, -0.6290816, 3.457034, 1, 1, 1, 1, 1,
0.1376851, 0.9317744, 0.1846623, 0, 0, 1, 1, 1,
0.1408021, 0.8263142, -0.8233231, 1, 0, 0, 1, 1,
0.1441182, 0.1194909, 0.2868396, 1, 0, 0, 1, 1,
0.1469723, 0.09057669, -0.04187877, 1, 0, 0, 1, 1,
0.1479283, 0.2538982, 1.75317, 1, 0, 0, 1, 1,
0.1481246, -1.696557, 1.695694, 1, 0, 0, 1, 1,
0.1488502, -0.4154028, 2.843728, 0, 0, 0, 1, 1,
0.1514279, 1.935659, -1.322549, 0, 0, 0, 1, 1,
0.1531753, -0.9789816, 1.167696, 0, 0, 0, 1, 1,
0.1563873, 0.9467918, 0.08802879, 0, 0, 0, 1, 1,
0.1594756, 0.2025557, -0.7919095, 0, 0, 0, 1, 1,
0.160464, -0.1613339, 2.847073, 0, 0, 0, 1, 1,
0.1626247, -1.816466, 4.647954, 0, 0, 0, 1, 1,
0.162877, 1.074207, -2.286972, 1, 1, 1, 1, 1,
0.1647849, 0.5169873, -1.065209, 1, 1, 1, 1, 1,
0.1649989, 0.684933, -0.7267145, 1, 1, 1, 1, 1,
0.1765979, -0.001417725, 1.065498, 1, 1, 1, 1, 1,
0.1834014, 1.634318, 1.050409, 1, 1, 1, 1, 1,
0.1836005, 2.028786, 0.0006833362, 1, 1, 1, 1, 1,
0.1838803, 0.1160159, 1.047657, 1, 1, 1, 1, 1,
0.1847804, -1.68184, 4.059696, 1, 1, 1, 1, 1,
0.1893614, 0.3902769, 1.614782, 1, 1, 1, 1, 1,
0.1921712, -1.783184, 4.147881, 1, 1, 1, 1, 1,
0.1930647, 0.5460424, 1.231813, 1, 1, 1, 1, 1,
0.1979966, 0.0565639, 1.934707, 1, 1, 1, 1, 1,
0.2000664, 2.159024, -2.07973, 1, 1, 1, 1, 1,
0.202319, -1.373154, 2.962305, 1, 1, 1, 1, 1,
0.2063746, -1.011565, 3.295874, 1, 1, 1, 1, 1,
0.2138904, -0.9594534, 2.50352, 0, 0, 1, 1, 1,
0.2160372, 0.2871057, 0.3629299, 1, 0, 0, 1, 1,
0.2172019, 1.167337, 1.424935, 1, 0, 0, 1, 1,
0.2223283, 1.292152, -0.5907356, 1, 0, 0, 1, 1,
0.2247289, 0.2971225, 0.4156028, 1, 0, 0, 1, 1,
0.226228, -0.9547578, 3.196352, 1, 0, 0, 1, 1,
0.2274541, 0.6383992, 0.7568998, 0, 0, 0, 1, 1,
0.2315907, -2.230098, 3.714401, 0, 0, 0, 1, 1,
0.2316261, 0.3314549, 0.3267163, 0, 0, 0, 1, 1,
0.2448083, -1.872072, 2.479464, 0, 0, 0, 1, 1,
0.2448529, -0.03436406, 1.262378, 0, 0, 0, 1, 1,
0.24569, -0.7452847, 2.239458, 0, 0, 0, 1, 1,
0.2481142, -0.1533712, 2.611785, 0, 0, 0, 1, 1,
0.2492126, -0.1924621, 3.598071, 1, 1, 1, 1, 1,
0.250641, -0.7679104, 2.758282, 1, 1, 1, 1, 1,
0.2534021, 0.6863655, 1.316609, 1, 1, 1, 1, 1,
0.2556239, 0.362861, 0.714711, 1, 1, 1, 1, 1,
0.2587518, -0.6309143, 2.745645, 1, 1, 1, 1, 1,
0.2599717, 0.1590224, 2.753239, 1, 1, 1, 1, 1,
0.2608126, 0.8912163, 0.2303883, 1, 1, 1, 1, 1,
0.2628504, -0.6070315, 3.417429, 1, 1, 1, 1, 1,
0.2641647, -0.7131348, 3.701792, 1, 1, 1, 1, 1,
0.2646891, -0.7908368, 1.999015, 1, 1, 1, 1, 1,
0.2663754, -0.2580858, 4.91693, 1, 1, 1, 1, 1,
0.2717618, 0.6389857, 1.104628, 1, 1, 1, 1, 1,
0.2722141, -0.2847703, 3.281323, 1, 1, 1, 1, 1,
0.272377, -1.668602, 2.670735, 1, 1, 1, 1, 1,
0.2790509, -1.55238, 2.266535, 1, 1, 1, 1, 1,
0.2849745, 0.4821017, 0.8677449, 0, 0, 1, 1, 1,
0.2877292, 1.33815, 0.1711245, 1, 0, 0, 1, 1,
0.2882079, 0.7541087, -0.01663164, 1, 0, 0, 1, 1,
0.2891397, -0.629481, 2.145822, 1, 0, 0, 1, 1,
0.2927182, 1.099027, 0.9216588, 1, 0, 0, 1, 1,
0.293327, -1.31256, 0.4006384, 1, 0, 0, 1, 1,
0.2991634, 1.321772, 1.390698, 0, 0, 0, 1, 1,
0.3041517, 0.325854, 1.170167, 0, 0, 0, 1, 1,
0.3048833, -1.451418, 1.868724, 0, 0, 0, 1, 1,
0.3070382, 0.0542412, 0.09079485, 0, 0, 0, 1, 1,
0.3081337, 0.8588135, 1.421264, 0, 0, 0, 1, 1,
0.3103147, 0.185243, 2.103585, 0, 0, 0, 1, 1,
0.3109691, 0.5918313, 1.225822, 0, 0, 0, 1, 1,
0.3127103, -1.614969, 1.794483, 1, 1, 1, 1, 1,
0.3167547, -0.1972358, -0.4497252, 1, 1, 1, 1, 1,
0.317224, -0.2139954, 1.07395, 1, 1, 1, 1, 1,
0.3184659, 1.442791, -0.3838934, 1, 1, 1, 1, 1,
0.3199377, -0.2276631, 0.386069, 1, 1, 1, 1, 1,
0.3209071, 0.3016684, 1.23312, 1, 1, 1, 1, 1,
0.3239011, 0.2179102, -0.1052855, 1, 1, 1, 1, 1,
0.3278219, -1.173568, 2.746205, 1, 1, 1, 1, 1,
0.3278416, -0.2228158, 1.479643, 1, 1, 1, 1, 1,
0.3286717, 0.7841747, 0.4207864, 1, 1, 1, 1, 1,
0.3287508, 0.3321292, -1.363838, 1, 1, 1, 1, 1,
0.3354097, 1.260979, -0.08537027, 1, 1, 1, 1, 1,
0.3431431, 0.2819116, 0.2884582, 1, 1, 1, 1, 1,
0.3468474, -0.4482635, 3.839426, 1, 1, 1, 1, 1,
0.3484831, 0.8407433, -1.380765, 1, 1, 1, 1, 1,
0.3489349, 0.02823539, 0.406878, 0, 0, 1, 1, 1,
0.3493024, -0.06773144, 2.347278, 1, 0, 0, 1, 1,
0.353375, -0.160237, 0.4133675, 1, 0, 0, 1, 1,
0.3576945, 1.296829, -0.7487365, 1, 0, 0, 1, 1,
0.3580979, -0.3525017, 2.914096, 1, 0, 0, 1, 1,
0.3582736, 0.1782672, 0.07973207, 1, 0, 0, 1, 1,
0.3685308, 0.240409, 1.450196, 0, 0, 0, 1, 1,
0.372202, -0.5727246, 3.621272, 0, 0, 0, 1, 1,
0.3727111, -0.4860131, 3.212949, 0, 0, 0, 1, 1,
0.3732902, 1.121711, -1.561318, 0, 0, 0, 1, 1,
0.3736776, -0.4815224, 2.178076, 0, 0, 0, 1, 1,
0.3753121, 0.03680462, 0.1625461, 0, 0, 0, 1, 1,
0.3757313, 0.5668137, 0.6621729, 0, 0, 0, 1, 1,
0.3758622, 2.108476, 0.6645816, 1, 1, 1, 1, 1,
0.3771076, -0.1819974, 2.463165, 1, 1, 1, 1, 1,
0.3796974, -0.8574726, 2.495827, 1, 1, 1, 1, 1,
0.3805043, -1.416453, 3.869032, 1, 1, 1, 1, 1,
0.3828177, -2.622419, 2.260987, 1, 1, 1, 1, 1,
0.3834874, -0.8385627, 3.368527, 1, 1, 1, 1, 1,
0.3861992, -0.5846485, 2.156366, 1, 1, 1, 1, 1,
0.3899526, -0.2202875, 1.335156, 1, 1, 1, 1, 1,
0.3926489, 0.1763285, 0.8229312, 1, 1, 1, 1, 1,
0.3941193, -0.6218841, 1.343423, 1, 1, 1, 1, 1,
0.3946593, -0.5209641, 2.933478, 1, 1, 1, 1, 1,
0.3969175, -0.6857941, 2.140141, 1, 1, 1, 1, 1,
0.3985387, 0.5725479, -0.2122088, 1, 1, 1, 1, 1,
0.4000237, -0.4419815, 2.307805, 1, 1, 1, 1, 1,
0.4037711, 1.058292, -1.074934, 1, 1, 1, 1, 1,
0.4052096, -0.3951453, 1.903435, 0, 0, 1, 1, 1,
0.4057234, -0.6486627, 3.209598, 1, 0, 0, 1, 1,
0.4092687, 0.6153775, 1.229746, 1, 0, 0, 1, 1,
0.4122241, 1.3068, -1.542888, 1, 0, 0, 1, 1,
0.419012, 0.7009, -0.2467742, 1, 0, 0, 1, 1,
0.4197018, 0.2067392, 1.899702, 1, 0, 0, 1, 1,
0.4206056, -0.3812684, 1.015034, 0, 0, 0, 1, 1,
0.4221128, -0.41092, 1.829227, 0, 0, 0, 1, 1,
0.4247121, -0.479266, 2.764933, 0, 0, 0, 1, 1,
0.4275966, -2.28819, 4.168524, 0, 0, 0, 1, 1,
0.4277724, -0.4103132, 2.768032, 0, 0, 0, 1, 1,
0.4306491, 2.120544, 0.4882509, 0, 0, 0, 1, 1,
0.4356954, -1.851637, 3.368217, 0, 0, 0, 1, 1,
0.4383347, -2.671553, 1.934112, 1, 1, 1, 1, 1,
0.4424689, -0.1171789, 1.780066, 1, 1, 1, 1, 1,
0.4552694, 0.7383342, -0.6576792, 1, 1, 1, 1, 1,
0.4557908, 0.1641429, 1.51007, 1, 1, 1, 1, 1,
0.4563627, -0.02131374, 0.1171631, 1, 1, 1, 1, 1,
0.4572316, 1.374305, 0.818128, 1, 1, 1, 1, 1,
0.4579356, 1.543331, 0.6543216, 1, 1, 1, 1, 1,
0.4583108, -1.123943, 2.182176, 1, 1, 1, 1, 1,
0.4594117, 0.6673691, -0.6355917, 1, 1, 1, 1, 1,
0.4676628, -0.7793419, 1.263608, 1, 1, 1, 1, 1,
0.4680169, 0.1725861, -1.033677, 1, 1, 1, 1, 1,
0.4706664, -0.7711473, 2.483582, 1, 1, 1, 1, 1,
0.4722795, 0.1211472, -0.3649531, 1, 1, 1, 1, 1,
0.4738361, -0.469716, 2.161462, 1, 1, 1, 1, 1,
0.4766304, -0.4674251, 2.998329, 1, 1, 1, 1, 1,
0.4832462, -0.8389249, 4.000397, 0, 0, 1, 1, 1,
0.4869529, -0.5907332, 4.070567, 1, 0, 0, 1, 1,
0.4882959, -0.2508834, 2.137048, 1, 0, 0, 1, 1,
0.4914864, 0.3482589, 0.6598045, 1, 0, 0, 1, 1,
0.4932784, -0.2181178, 1.40673, 1, 0, 0, 1, 1,
0.5009036, -0.4250288, 2.913676, 1, 0, 0, 1, 1,
0.5039954, -1.811406, -0.2639966, 0, 0, 0, 1, 1,
0.5109342, 0.3965594, 1.170194, 0, 0, 0, 1, 1,
0.5115511, -0.07013898, 2.316023, 0, 0, 0, 1, 1,
0.5145242, -1.094633, 3.074144, 0, 0, 0, 1, 1,
0.5157217, -0.8750805, 2.472926, 0, 0, 0, 1, 1,
0.5170601, -1.48879, 2.120352, 0, 0, 0, 1, 1,
0.5183564, 0.9832809, 0.7486658, 0, 0, 0, 1, 1,
0.5235441, 0.004937861, 1.621083, 1, 1, 1, 1, 1,
0.527817, 0.2845222, 2.114321, 1, 1, 1, 1, 1,
0.5283847, 1.052061, -0.5217425, 1, 1, 1, 1, 1,
0.5287768, -0.952633, 3.694862, 1, 1, 1, 1, 1,
0.528836, 0.1985825, 2.34924, 1, 1, 1, 1, 1,
0.5324005, 0.2791356, 2.589696, 1, 1, 1, 1, 1,
0.5328786, -0.03940966, 1.60742, 1, 1, 1, 1, 1,
0.5373527, -0.9263552, 1.926715, 1, 1, 1, 1, 1,
0.5443904, -0.9683688, 3.063543, 1, 1, 1, 1, 1,
0.5461821, -0.6507711, 2.921875, 1, 1, 1, 1, 1,
0.5489324, -0.2167986, 1.826064, 1, 1, 1, 1, 1,
0.5494151, 0.4814613, 2.706115, 1, 1, 1, 1, 1,
0.5503566, 0.4988626, -0.7772983, 1, 1, 1, 1, 1,
0.5531716, -1.471049, 3.812423, 1, 1, 1, 1, 1,
0.5537652, -0.2743846, 0.4731326, 1, 1, 1, 1, 1,
0.5557777, 0.2851255, 0.4987203, 0, 0, 1, 1, 1,
0.562802, -1.760417, 3.808255, 1, 0, 0, 1, 1,
0.5663658, 1.240502, -0.3832837, 1, 0, 0, 1, 1,
0.5687668, 0.2964559, 0.8928416, 1, 0, 0, 1, 1,
0.5737691, 0.01483846, 2.973969, 1, 0, 0, 1, 1,
0.5762507, 0.5556819, 2.498806, 1, 0, 0, 1, 1,
0.576263, -0.6986963, 1.845475, 0, 0, 0, 1, 1,
0.5763599, 0.6790212, 0.8647491, 0, 0, 0, 1, 1,
0.5847425, 0.3718519, 1.134819, 0, 0, 0, 1, 1,
0.5853468, -1.696972, 3.313482, 0, 0, 0, 1, 1,
0.5883915, -0.9585291, 2.987656, 0, 0, 0, 1, 1,
0.5927645, -0.4842898, 2.652283, 0, 0, 0, 1, 1,
0.5928892, 0.8843216, 0.4856447, 0, 0, 0, 1, 1,
0.5945532, 0.7276317, -1.601712, 1, 1, 1, 1, 1,
0.6079006, -1.026016, 3.726432, 1, 1, 1, 1, 1,
0.6083571, 0.272047, 0.4460817, 1, 1, 1, 1, 1,
0.6105821, 1.059362, 0.2112759, 1, 1, 1, 1, 1,
0.6107129, -0.3500243, 2.28733, 1, 1, 1, 1, 1,
0.6108728, 0.4176126, 3.40027, 1, 1, 1, 1, 1,
0.6143579, 2.145053, 0.8130985, 1, 1, 1, 1, 1,
0.6144691, 0.3628155, 0.09055226, 1, 1, 1, 1, 1,
0.6148018, 0.492231, 0.8774946, 1, 1, 1, 1, 1,
0.6157414, -1.343908, 2.670606, 1, 1, 1, 1, 1,
0.6158669, 2.724089, -0.5469933, 1, 1, 1, 1, 1,
0.6163819, -1.128703, 3.308869, 1, 1, 1, 1, 1,
0.616518, 1.363163, -0.08951079, 1, 1, 1, 1, 1,
0.6171582, 0.8166481, 0.5207503, 1, 1, 1, 1, 1,
0.6197482, 0.3618518, 0.6380397, 1, 1, 1, 1, 1,
0.6217701, -0.9871461, 1.28333, 0, 0, 1, 1, 1,
0.6219322, -0.0318939, 3.303981, 1, 0, 0, 1, 1,
0.6227691, 1.280447, -1.080437, 1, 0, 0, 1, 1,
0.6260248, -2.079825, 2.285368, 1, 0, 0, 1, 1,
0.6308239, 1.279226, 1.032308, 1, 0, 0, 1, 1,
0.631793, 1.008219, 1.854411, 1, 0, 0, 1, 1,
0.6394401, 1.050036, 2.404323, 0, 0, 0, 1, 1,
0.6463895, -0.291697, 1.200657, 0, 0, 0, 1, 1,
0.6482171, -0.08266094, 1.84104, 0, 0, 0, 1, 1,
0.6539412, 1.427547, -0.1444278, 0, 0, 0, 1, 1,
0.6558418, 0.4107721, 2.166155, 0, 0, 0, 1, 1,
0.6636705, -0.3667011, 0.1661183, 0, 0, 0, 1, 1,
0.6724101, -0.695426, 1.611981, 0, 0, 0, 1, 1,
0.6726002, 1.126, -0.6459464, 1, 1, 1, 1, 1,
0.6757664, -0.007430143, 2.137532, 1, 1, 1, 1, 1,
0.683697, 0.4911008, 0.6396021, 1, 1, 1, 1, 1,
0.6875672, 0.9494551, 1.431784, 1, 1, 1, 1, 1,
0.7011653, -0.7717095, 0.8719747, 1, 1, 1, 1, 1,
0.7018136, 1.088641, -0.549681, 1, 1, 1, 1, 1,
0.708504, -1.889538, 1.649818, 1, 1, 1, 1, 1,
0.7107859, 0.0140118, 2.22066, 1, 1, 1, 1, 1,
0.7179279, 0.04658683, 1.820224, 1, 1, 1, 1, 1,
0.7264242, -0.776388, 2.408518, 1, 1, 1, 1, 1,
0.7301285, 0.2773047, 0.7753723, 1, 1, 1, 1, 1,
0.7304376, 0.3091921, 2.273546, 1, 1, 1, 1, 1,
0.7398496, 0.9023653, 1.749819, 1, 1, 1, 1, 1,
0.7478608, 0.6453305, 1.768652, 1, 1, 1, 1, 1,
0.7484148, -0.4108905, 2.299895, 1, 1, 1, 1, 1,
0.7493361, -0.3457228, 2.369135, 0, 0, 1, 1, 1,
0.7506646, -0.5145396, 0.5012457, 1, 0, 0, 1, 1,
0.7574526, -1.652863, 4.591149, 1, 0, 0, 1, 1,
0.7694317, 0.1154934, 1.272251, 1, 0, 0, 1, 1,
0.772622, 0.1668641, 0.8322875, 1, 0, 0, 1, 1,
0.7763338, 0.1848779, 0.746769, 1, 0, 0, 1, 1,
0.7895788, 1.178016, -0.119371, 0, 0, 0, 1, 1,
0.7942926, 0.7906465, 1.10387, 0, 0, 0, 1, 1,
0.7942955, -0.7680673, 1.76471, 0, 0, 0, 1, 1,
0.7994485, 0.2530071, 1.396663, 0, 0, 0, 1, 1,
0.8004778, -0.1533972, 0.0271034, 0, 0, 0, 1, 1,
0.8008294, -0.2037112, 2.346664, 0, 0, 0, 1, 1,
0.8014956, -0.5996203, 1.995683, 0, 0, 0, 1, 1,
0.8017388, 0.5457896, 2.195187, 1, 1, 1, 1, 1,
0.8029367, -0.003438363, 1.888289, 1, 1, 1, 1, 1,
0.8068161, -0.5078726, 0.6864, 1, 1, 1, 1, 1,
0.8146676, -0.5628646, 3.015743, 1, 1, 1, 1, 1,
0.8146707, -1.202012, 3.744923, 1, 1, 1, 1, 1,
0.8227493, 1.692903, 0.7127115, 1, 1, 1, 1, 1,
0.8241527, -0.4836813, 1.841649, 1, 1, 1, 1, 1,
0.8301978, 0.1880737, 1.239035, 1, 1, 1, 1, 1,
0.8326102, -0.7154865, 1.781599, 1, 1, 1, 1, 1,
0.8403077, -0.8100951, 2.080244, 1, 1, 1, 1, 1,
0.84588, 0.09326962, 0.4635777, 1, 1, 1, 1, 1,
0.8507439, -0.06371909, 2.250392, 1, 1, 1, 1, 1,
0.8537631, -0.6555427, 2.479854, 1, 1, 1, 1, 1,
0.8572693, -0.3877345, 2.12443, 1, 1, 1, 1, 1,
0.8579001, -0.3603383, 2.298306, 1, 1, 1, 1, 1,
0.8593627, 0.1032389, 1.383824, 0, 0, 1, 1, 1,
0.8612835, -0.3094449, 2.242994, 1, 0, 0, 1, 1,
0.8708674, -0.9951792, 3.916642, 1, 0, 0, 1, 1,
0.8709939, -0.6840423, 2.500046, 1, 0, 0, 1, 1,
0.8751383, -1.264473, 1.741279, 1, 0, 0, 1, 1,
0.8776588, -0.3840688, 3.512307, 1, 0, 0, 1, 1,
0.8814673, 0.4165554, 0.1419731, 0, 0, 0, 1, 1,
0.8829557, 0.3154672, 0.2395118, 0, 0, 0, 1, 1,
0.885746, 0.2729289, -0.197017, 0, 0, 0, 1, 1,
0.8865535, -0.7257054, 2.030951, 0, 0, 0, 1, 1,
0.893599, 0.595554, 0.6530561, 0, 0, 0, 1, 1,
0.8947881, -1.071699, 3.083949, 0, 0, 0, 1, 1,
0.9004225, -1.466274, 3.231548, 0, 0, 0, 1, 1,
0.902225, -0.02395465, 1.027687, 1, 1, 1, 1, 1,
0.902417, 1.799299, 0.2897691, 1, 1, 1, 1, 1,
0.9058356, -0.6540319, 3.103874, 1, 1, 1, 1, 1,
0.9107502, -1.921111, 2.437248, 1, 1, 1, 1, 1,
0.9144663, -1.697803, 2.286588, 1, 1, 1, 1, 1,
0.9196737, 0.9687136, 0.406515, 1, 1, 1, 1, 1,
0.9198078, -1.219236, 2.496922, 1, 1, 1, 1, 1,
0.9218573, -1.413323, 1.682434, 1, 1, 1, 1, 1,
0.931258, -0.5538613, 1.159111, 1, 1, 1, 1, 1,
0.9337227, -1.073567, 2.301712, 1, 1, 1, 1, 1,
0.934522, 0.3466601, 2.934053, 1, 1, 1, 1, 1,
0.9394754, -1.062654, 0.8722935, 1, 1, 1, 1, 1,
0.9445465, -0.7639788, 0.4899275, 1, 1, 1, 1, 1,
0.9483539, 2.008136, -1.095983, 1, 1, 1, 1, 1,
0.9495518, 0.5138209, 0.7864041, 1, 1, 1, 1, 1,
0.9516184, -0.6389782, 1.263798, 0, 0, 1, 1, 1,
0.9547481, 0.008504614, 1.701222, 1, 0, 0, 1, 1,
0.9668418, 1.582833, 1.285067, 1, 0, 0, 1, 1,
0.9714369, 0.09355489, 2.213843, 1, 0, 0, 1, 1,
0.9760174, -0.2601812, 2.549645, 1, 0, 0, 1, 1,
0.9775875, 0.776104, 0.7997349, 1, 0, 0, 1, 1,
0.9920254, 0.5287413, 1.686103, 0, 0, 0, 1, 1,
0.9920619, 2.018342, 2.662731, 0, 0, 0, 1, 1,
0.9933971, 0.2576239, 2.502636, 0, 0, 0, 1, 1,
0.995486, 0.1151099, 1.375567, 0, 0, 0, 1, 1,
0.9997713, -0.4909753, 1.710276, 0, 0, 0, 1, 1,
1.001343, 0.06590706, 1.000985, 0, 0, 0, 1, 1,
1.009402, 0.9065532, 1.615535, 0, 0, 0, 1, 1,
1.009549, 0.2620007, 0.8517241, 1, 1, 1, 1, 1,
1.010709, 1.457096, 0.5783659, 1, 1, 1, 1, 1,
1.019652, -0.5142985, 1.350821, 1, 1, 1, 1, 1,
1.031107, 0.4533272, 2.314497, 1, 1, 1, 1, 1,
1.037986, 0.3266224, 2.045454, 1, 1, 1, 1, 1,
1.039574, 1.493924, 0.541755, 1, 1, 1, 1, 1,
1.044197, -0.9456934, 3.579901, 1, 1, 1, 1, 1,
1.045148, 0.2915074, 2.598583, 1, 1, 1, 1, 1,
1.045961, 0.3705766, 0.5564464, 1, 1, 1, 1, 1,
1.052717, -0.3805867, 1.426703, 1, 1, 1, 1, 1,
1.053174, 0.7623657, 1.910752, 1, 1, 1, 1, 1,
1.059935, -1.218479, 2.645208, 1, 1, 1, 1, 1,
1.06862, 0.1565724, 1.722936, 1, 1, 1, 1, 1,
1.07337, -1.614115, 0.9939531, 1, 1, 1, 1, 1,
1.074927, -0.6705628, 2.330269, 1, 1, 1, 1, 1,
1.078768, -0.5687942, 3.155502, 0, 0, 1, 1, 1,
1.079584, -1.485852, 1.255718, 1, 0, 0, 1, 1,
1.082429, 1.121364, 1.469244, 1, 0, 0, 1, 1,
1.083989, 0.07974354, 3.265826, 1, 0, 0, 1, 1,
1.086365, 0.2089721, 2.885681, 1, 0, 0, 1, 1,
1.088082, -2.253608, 4.980274, 1, 0, 0, 1, 1,
1.099453, 0.05120267, 1.880472, 0, 0, 0, 1, 1,
1.10102, -1.567639, 3.017886, 0, 0, 0, 1, 1,
1.103079, 0.7301421, 0.1939673, 0, 0, 0, 1, 1,
1.116544, 0.09747631, 2.542887, 0, 0, 0, 1, 1,
1.12364, 0.713663, 0.7126438, 0, 0, 0, 1, 1,
1.123937, 0.7716358, 0.06905352, 0, 0, 0, 1, 1,
1.125899, 0.9609326, 1.070693, 0, 0, 0, 1, 1,
1.12665, 0.6502652, -0.1098958, 1, 1, 1, 1, 1,
1.12813, 0.8014216, 1.021504, 1, 1, 1, 1, 1,
1.136466, -0.4078885, 2.285205, 1, 1, 1, 1, 1,
1.137864, 1.499197, 0.7500678, 1, 1, 1, 1, 1,
1.13839, -0.6754202, 3.289236, 1, 1, 1, 1, 1,
1.139365, -0.005852809, 0.8593158, 1, 1, 1, 1, 1,
1.144934, -0.3880399, -0.2806382, 1, 1, 1, 1, 1,
1.150206, 0.3192337, 2.558431, 1, 1, 1, 1, 1,
1.150649, 0.04197899, 3.708961, 1, 1, 1, 1, 1,
1.15642, -1.196803, 1.105857, 1, 1, 1, 1, 1,
1.163019, -0.8106178, 3.507224, 1, 1, 1, 1, 1,
1.163721, -0.6955472, 1.85558, 1, 1, 1, 1, 1,
1.179105, 0.5474926, 0.5832048, 1, 1, 1, 1, 1,
1.184207, -2.154651, 3.202075, 1, 1, 1, 1, 1,
1.196923, -0.8591263, 2.497202, 1, 1, 1, 1, 1,
1.213778, 0.1144044, 1.58279, 0, 0, 1, 1, 1,
1.217221, -0.6011624, 2.677349, 1, 0, 0, 1, 1,
1.218501, -0.16098, 0.7943006, 1, 0, 0, 1, 1,
1.220153, -1.129304, 2.75679, 1, 0, 0, 1, 1,
1.220164, -1.340795, 0.5525798, 1, 0, 0, 1, 1,
1.230017, 0.8400938, -0.3128074, 1, 0, 0, 1, 1,
1.231528, -0.5432476, 0.2570568, 0, 0, 0, 1, 1,
1.23319, 1.229341, 1.366071, 0, 0, 0, 1, 1,
1.233649, -1.195198, -0.115534, 0, 0, 0, 1, 1,
1.235649, 0.9191372, -1.223123, 0, 0, 0, 1, 1,
1.248225, -0.8032672, 1.984278, 0, 0, 0, 1, 1,
1.251282, -0.6612521, 1.805055, 0, 0, 0, 1, 1,
1.261021, -0.4592142, 3.703748, 0, 0, 0, 1, 1,
1.262094, 0.7918278, 0.7845317, 1, 1, 1, 1, 1,
1.281047, -1.064328, -0.4404324, 1, 1, 1, 1, 1,
1.289617, -0.6875232, 1.692807, 1, 1, 1, 1, 1,
1.293547, -1.583511, 3.423415, 1, 1, 1, 1, 1,
1.295415, -0.5321993, 1.030784, 1, 1, 1, 1, 1,
1.297212, -1.204325, 0.7260532, 1, 1, 1, 1, 1,
1.297634, 0.5677652, 0.08373961, 1, 1, 1, 1, 1,
1.298539, -0.9404521, 1.953032, 1, 1, 1, 1, 1,
1.301722, -1.490854, 2.047182, 1, 1, 1, 1, 1,
1.304465, -1.208574, 3.52454, 1, 1, 1, 1, 1,
1.309857, 0.8411243, 0.8707657, 1, 1, 1, 1, 1,
1.315948, -2.09549, 4.013232, 1, 1, 1, 1, 1,
1.319319, 0.7054269, 0.6917768, 1, 1, 1, 1, 1,
1.322051, 1.19611, 1.588879, 1, 1, 1, 1, 1,
1.325562, -1.239575, 3.306561, 1, 1, 1, 1, 1,
1.325971, 1.249076, 0.8994966, 0, 0, 1, 1, 1,
1.327654, -0.513622, 2.091429, 1, 0, 0, 1, 1,
1.327722, -0.2249177, 0.9254081, 1, 0, 0, 1, 1,
1.330373, -0.5467904, 1.412667, 1, 0, 0, 1, 1,
1.341115, -0.2474337, 2.446132, 1, 0, 0, 1, 1,
1.351814, 0.5827718, 0.2316443, 1, 0, 0, 1, 1,
1.355094, 0.3614154, 0.8011749, 0, 0, 0, 1, 1,
1.358177, -1.163665, 2.913297, 0, 0, 0, 1, 1,
1.360964, -0.4700342, 1.899388, 0, 0, 0, 1, 1,
1.363622, 0.7230617, 0.4764336, 0, 0, 0, 1, 1,
1.365798, -0.4773585, 2.603919, 0, 0, 0, 1, 1,
1.370391, -0.3056333, 3.346518, 0, 0, 0, 1, 1,
1.37684, -0.05828721, 0.8024009, 0, 0, 0, 1, 1,
1.396408, 1.919128, 0.4053144, 1, 1, 1, 1, 1,
1.398152, 0.1868565, 0.6851248, 1, 1, 1, 1, 1,
1.413835, -1.684577, 3.338058, 1, 1, 1, 1, 1,
1.413917, 1.096801, 2.961516, 1, 1, 1, 1, 1,
1.414482, 0.1559712, 0.1187522, 1, 1, 1, 1, 1,
1.432673, -1.536661, 1.001603, 1, 1, 1, 1, 1,
1.432946, 0.1192504, 0.9564312, 1, 1, 1, 1, 1,
1.43663, -1.647736, 1.632424, 1, 1, 1, 1, 1,
1.43851, -0.7163688, 0.8142289, 1, 1, 1, 1, 1,
1.440162, -0.1214674, 2.646942, 1, 1, 1, 1, 1,
1.440798, -0.3851008, -0.8240668, 1, 1, 1, 1, 1,
1.453676, 0.1206512, 3.341191, 1, 1, 1, 1, 1,
1.459375, 2.051583, -1.574713, 1, 1, 1, 1, 1,
1.471215, 1.546675, -1.205031, 1, 1, 1, 1, 1,
1.479685, -1.205938, 2.925344, 1, 1, 1, 1, 1,
1.483149, -0.2657894, 1.236044, 0, 0, 1, 1, 1,
1.491244, 1.109562, 1.142797, 1, 0, 0, 1, 1,
1.504831, -0.5945977, -0.2106814, 1, 0, 0, 1, 1,
1.506865, -0.3620767, 1.531133, 1, 0, 0, 1, 1,
1.507476, -0.5765827, 2.419033, 1, 0, 0, 1, 1,
1.51311, 0.03813209, 0.2775476, 1, 0, 0, 1, 1,
1.523315, 2.268664, -1.06058, 0, 0, 0, 1, 1,
1.543542, 0.1819728, 0.4802732, 0, 0, 0, 1, 1,
1.5446, -0.2885394, 0.01048231, 0, 0, 0, 1, 1,
1.556703, 0.1844582, 3.032907, 0, 0, 0, 1, 1,
1.561584, 0.5047811, 2.307036, 0, 0, 0, 1, 1,
1.591648, 0.4144153, -0.9566909, 0, 0, 0, 1, 1,
1.599725, -0.8889273, 2.529407, 0, 0, 0, 1, 1,
1.610712, -1.868854, 2.485508, 1, 1, 1, 1, 1,
1.627695, 1.763474, 0.4388868, 1, 1, 1, 1, 1,
1.628819, 0.7214957, 0.5754747, 1, 1, 1, 1, 1,
1.643015, 0.2210181, 1.055617, 1, 1, 1, 1, 1,
1.652158, -1.520485, 3.672067, 1, 1, 1, 1, 1,
1.666382, 0.7681937, 1.870051, 1, 1, 1, 1, 1,
1.670239, -1.169972, 1.025527, 1, 1, 1, 1, 1,
1.680858, 0.6954077, 1.500214, 1, 1, 1, 1, 1,
1.698637, 0.6596457, 1.42406, 1, 1, 1, 1, 1,
1.704725, 1.284435, 1.46064, 1, 1, 1, 1, 1,
1.708721, 0.05704086, 2.144022, 1, 1, 1, 1, 1,
1.721191, 0.3967929, 2.566463, 1, 1, 1, 1, 1,
1.721926, -0.3986779, 0.07825918, 1, 1, 1, 1, 1,
1.727284, -0.4872422, 1.925242, 1, 1, 1, 1, 1,
1.732444, 0.5156167, 2.516294, 1, 1, 1, 1, 1,
1.749881, -0.7726455, 1.137825, 0, 0, 1, 1, 1,
1.757619, 0.3412151, 1.216508, 1, 0, 0, 1, 1,
1.75917, 0.9331504, 1.442565, 1, 0, 0, 1, 1,
1.760118, -0.3382961, 3.506179, 1, 0, 0, 1, 1,
1.78981, 0.07829404, 3.329696, 1, 0, 0, 1, 1,
1.792677, -0.6647141, 1.359775, 1, 0, 0, 1, 1,
1.803447, -0.08355493, 1.630732, 0, 0, 0, 1, 1,
1.808027, 1.406064, 1.974912, 0, 0, 0, 1, 1,
1.812078, -0.6050081, 2.660116, 0, 0, 0, 1, 1,
1.818525, 0.05216211, 0.2526575, 0, 0, 0, 1, 1,
1.849021, -0.2000336, 1.610496, 0, 0, 0, 1, 1,
1.86127, -0.8389214, 1.158737, 0, 0, 0, 1, 1,
1.874218, 1.920098, 1.20113, 0, 0, 0, 1, 1,
1.883847, 0.2415721, 0.7374732, 1, 1, 1, 1, 1,
1.905513, 0.3247091, 1.243884, 1, 1, 1, 1, 1,
1.932803, 1.196108, 0.8019649, 1, 1, 1, 1, 1,
1.937671, -0.20113, 3.131955, 1, 1, 1, 1, 1,
1.969011, -0.4703247, 0.7076309, 1, 1, 1, 1, 1,
1.97071, -0.6944727, 3.925261, 1, 1, 1, 1, 1,
1.97382, -0.6522082, 1.429953, 1, 1, 1, 1, 1,
2.008936, -0.3556455, 2.779315, 1, 1, 1, 1, 1,
2.011883, 0.356466, 3.250554, 1, 1, 1, 1, 1,
2.01644, -1.245259, 1.566871, 1, 1, 1, 1, 1,
2.031389, -0.4302651, 3.573345, 1, 1, 1, 1, 1,
2.084457, -0.4060905, 1.8496, 1, 1, 1, 1, 1,
2.095251, -0.4633017, 1.297232, 1, 1, 1, 1, 1,
2.099289, -1.189363, 5.002738, 1, 1, 1, 1, 1,
2.109871, -1.774902, 4.037979, 1, 1, 1, 1, 1,
2.129349, 1.350646, -0.7468083, 0, 0, 1, 1, 1,
2.132461, -1.237957, 1.18638, 1, 0, 0, 1, 1,
2.154856, 0.1944153, 2.559926, 1, 0, 0, 1, 1,
2.16793, 0.07778673, 3.229896, 1, 0, 0, 1, 1,
2.19563, -0.3867758, 0.9779952, 1, 0, 0, 1, 1,
2.205018, 0.603562, 2.551085, 1, 0, 0, 1, 1,
2.214027, 2.236096, 1.25561, 0, 0, 0, 1, 1,
2.215939, -0.742353, 1.973836, 0, 0, 0, 1, 1,
2.230195, 0.2129612, 1.734715, 0, 0, 0, 1, 1,
2.231313, 1.215973, 0.7501882, 0, 0, 0, 1, 1,
2.232685, -0.628341, 1.217957, 0, 0, 0, 1, 1,
2.293177, -1.342788, 1.723433, 0, 0, 0, 1, 1,
2.341923, -0.9566116, 2.027166, 0, 0, 0, 1, 1,
2.556349, 2.046187, -0.9775102, 1, 1, 1, 1, 1,
2.60092, 0.9673156, 0.8227816, 1, 1, 1, 1, 1,
2.78231, -0.2737881, 1.414114, 1, 1, 1, 1, 1,
2.826735, 0.3629647, 1.779857, 1, 1, 1, 1, 1,
3.083475, 1.224482, 3.331176, 1, 1, 1, 1, 1,
3.084785, -0.131832, 1.287039, 1, 1, 1, 1, 1,
3.432747, -0.9974363, 2.646557, 1, 1, 1, 1, 1
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
var radius = 9.331792;
var distance = 32.77753;
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
mvMatrix.translate( -0.379391, -0.133414, 0.1672721 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.77753);
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
