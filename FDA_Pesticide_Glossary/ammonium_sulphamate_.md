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
-3.828703, 1.841208, -0.7283531, 1, 0, 0, 1,
-2.823581, 2.019018, 0.1692755, 1, 0.007843138, 0, 1,
-2.823251, -0.01473546, -0.381108, 1, 0.01176471, 0, 1,
-2.799528, -0.4376649, -0.2943073, 1, 0.01960784, 0, 1,
-2.785022, -0.1793916, -2.399252, 1, 0.02352941, 0, 1,
-2.677009, -0.3429534, -2.621423, 1, 0.03137255, 0, 1,
-2.660693, 1.336049, 0.2778943, 1, 0.03529412, 0, 1,
-2.645546, 0.170845, -0.3898691, 1, 0.04313726, 0, 1,
-2.620828, 1.510633, -2.302369, 1, 0.04705882, 0, 1,
-2.449145, -0.2598796, -1.296411, 1, 0.05490196, 0, 1,
-2.408157, 0.4762472, -1.799372, 1, 0.05882353, 0, 1,
-2.350039, -0.5394107, -3.111959, 1, 0.06666667, 0, 1,
-2.321514, 1.029039, -2.08027, 1, 0.07058824, 0, 1,
-2.29096, 1.155297, -1.740231, 1, 0.07843138, 0, 1,
-2.274678, 0.1336906, -1.270977, 1, 0.08235294, 0, 1,
-2.248585, -0.2084293, -3.036844, 1, 0.09019608, 0, 1,
-2.207634, -0.08247084, -1.623165, 1, 0.09411765, 0, 1,
-2.206714, -0.6841145, -1.435853, 1, 0.1019608, 0, 1,
-2.17834, 0.1980563, -1.943792, 1, 0.1098039, 0, 1,
-2.1308, -0.7030906, -2.676823, 1, 0.1137255, 0, 1,
-2.128552, -0.1946355, -0.9730036, 1, 0.1215686, 0, 1,
-2.102296, -0.5759133, -1.665621, 1, 0.1254902, 0, 1,
-2.078878, -0.3094757, -1.706388, 1, 0.1333333, 0, 1,
-2.060921, -0.07333438, -0.6970636, 1, 0.1372549, 0, 1,
-2.050876, 1.555917, -1.205609, 1, 0.145098, 0, 1,
-2.045595, 0.285785, -1.036743, 1, 0.1490196, 0, 1,
-2.021147, 0.3454139, -1.531267, 1, 0.1568628, 0, 1,
-2.00683, 0.2033175, -1.118516, 1, 0.1607843, 0, 1,
-1.9922, 0.836167, -1.14994, 1, 0.1686275, 0, 1,
-1.939151, 1.070735, -2.067906, 1, 0.172549, 0, 1,
-1.903895, -0.1258956, -1.610868, 1, 0.1803922, 0, 1,
-1.894174, 1.488858, 0.404536, 1, 0.1843137, 0, 1,
-1.877468, 1.710953, -1.152509, 1, 0.1921569, 0, 1,
-1.875242, -0.1663257, -2.101057, 1, 0.1960784, 0, 1,
-1.850237, 1.456084, -0.778174, 1, 0.2039216, 0, 1,
-1.845501, 0.0573466, -0.495577, 1, 0.2117647, 0, 1,
-1.843673, 0.1131229, -0.1919132, 1, 0.2156863, 0, 1,
-1.841781, 0.3700629, -1.067696, 1, 0.2235294, 0, 1,
-1.826783, -0.1048882, -0.1844266, 1, 0.227451, 0, 1,
-1.799829, 2.521945, -1.115643, 1, 0.2352941, 0, 1,
-1.784354, -2.584251, -3.807426, 1, 0.2392157, 0, 1,
-1.784014, 0.6316609, -0.6414436, 1, 0.2470588, 0, 1,
-1.77856, -0.1569534, -1.384134, 1, 0.2509804, 0, 1,
-1.778211, 1.411048, -2.6379, 1, 0.2588235, 0, 1,
-1.762074, -1.705671, -1.908057, 1, 0.2627451, 0, 1,
-1.745144, -0.3764127, -2.156457, 1, 0.2705882, 0, 1,
-1.725678, -1.784821, -1.781527, 1, 0.2745098, 0, 1,
-1.71456, 1.714894, -1.581161, 1, 0.282353, 0, 1,
-1.693932, 0.4735756, -2.930995, 1, 0.2862745, 0, 1,
-1.683506, -0.6072484, -0.4540673, 1, 0.2941177, 0, 1,
-1.673851, 0.8158944, -0.3292027, 1, 0.3019608, 0, 1,
-1.672072, 0.241825, -1.376492, 1, 0.3058824, 0, 1,
-1.67061, 0.4916061, -0.5114074, 1, 0.3137255, 0, 1,
-1.657838, -1.118428, -3.740973, 1, 0.3176471, 0, 1,
-1.655028, -0.2619503, -2.057514, 1, 0.3254902, 0, 1,
-1.654804, -0.5865788, -2.457703, 1, 0.3294118, 0, 1,
-1.643204, -2.054731, -1.8398, 1, 0.3372549, 0, 1,
-1.627872, -0.1446052, -1.633441, 1, 0.3411765, 0, 1,
-1.623594, -0.09986546, -1.314122, 1, 0.3490196, 0, 1,
-1.615062, 0.7214137, -0.6424131, 1, 0.3529412, 0, 1,
-1.607514, 0.7391278, -0.842083, 1, 0.3607843, 0, 1,
-1.595994, -0.6026568, -4.029245, 1, 0.3647059, 0, 1,
-1.57442, -0.7463596, -2.947994, 1, 0.372549, 0, 1,
-1.567491, 1.623263, -1.095188, 1, 0.3764706, 0, 1,
-1.561186, 0.1162145, -1.796698, 1, 0.3843137, 0, 1,
-1.558455, 0.08186552, -1.232784, 1, 0.3882353, 0, 1,
-1.553808, -1.90551, -3.034941, 1, 0.3960784, 0, 1,
-1.523014, -0.6436045, -2.237819, 1, 0.4039216, 0, 1,
-1.51916, -0.5283217, 0.4434452, 1, 0.4078431, 0, 1,
-1.488073, -1.734201, -4.029856, 1, 0.4156863, 0, 1,
-1.487847, 1.050024, -1.142361, 1, 0.4196078, 0, 1,
-1.484601, 0.5193611, -1.205529, 1, 0.427451, 0, 1,
-1.482626, 0.4164531, 0.561526, 1, 0.4313726, 0, 1,
-1.474355, -0.4755689, -0.9257953, 1, 0.4392157, 0, 1,
-1.468179, -0.4827299, -1.783221, 1, 0.4431373, 0, 1,
-1.467062, 0.8059886, 0.09374352, 1, 0.4509804, 0, 1,
-1.465828, -0.4757735, -0.1060429, 1, 0.454902, 0, 1,
-1.465391, -1.042815, -2.6195, 1, 0.4627451, 0, 1,
-1.457793, 0.9213342, -0.2723627, 1, 0.4666667, 0, 1,
-1.439312, 0.1714245, -0.621842, 1, 0.4745098, 0, 1,
-1.42802, -0.168908, -3.051404, 1, 0.4784314, 0, 1,
-1.412825, -2.703024, -0.6919762, 1, 0.4862745, 0, 1,
-1.41158, 0.6757544, -0.3347171, 1, 0.4901961, 0, 1,
-1.404136, 0.5769364, 1.114674, 1, 0.4980392, 0, 1,
-1.40279, 1.089649, 0.1236288, 1, 0.5058824, 0, 1,
-1.401255, -0.4848727, -2.542608, 1, 0.509804, 0, 1,
-1.399017, -0.3522733, -2.472255, 1, 0.5176471, 0, 1,
-1.393538, 1.802925, -1.768731, 1, 0.5215687, 0, 1,
-1.386859, 0.795168, -2.701324, 1, 0.5294118, 0, 1,
-1.374781, -1.294403, -2.824331, 1, 0.5333334, 0, 1,
-1.374335, -1.133756, -3.136184, 1, 0.5411765, 0, 1,
-1.370433, 1.282339, -0.2000318, 1, 0.5450981, 0, 1,
-1.366143, 1.152889, -0.0091163, 1, 0.5529412, 0, 1,
-1.355287, 0.5457836, -1.759299, 1, 0.5568628, 0, 1,
-1.342811, -1.66042, -2.165501, 1, 0.5647059, 0, 1,
-1.335992, 0.8767006, -1.368065, 1, 0.5686275, 0, 1,
-1.333384, -0.3739561, -1.92738, 1, 0.5764706, 0, 1,
-1.325765, 0.1692635, -1.550232, 1, 0.5803922, 0, 1,
-1.318277, 0.9735414, -0.1672146, 1, 0.5882353, 0, 1,
-1.317722, -0.8038342, -1.909173, 1, 0.5921569, 0, 1,
-1.315991, 1.789001, -2.873668, 1, 0.6, 0, 1,
-1.307768, 0.74659, -1.789081, 1, 0.6078432, 0, 1,
-1.293594, 2.772981, 0.02373211, 1, 0.6117647, 0, 1,
-1.289544, 0.8371994, -1.626133, 1, 0.6196079, 0, 1,
-1.283979, 0.2671542, -2.10649, 1, 0.6235294, 0, 1,
-1.282442, -0.3281617, -3.041494, 1, 0.6313726, 0, 1,
-1.274587, 0.7133973, -1.627606, 1, 0.6352941, 0, 1,
-1.269281, -0.8995551, -2.249904, 1, 0.6431373, 0, 1,
-1.262371, -0.8703098, -1.933073, 1, 0.6470588, 0, 1,
-1.260235, 1.413063, 0.3941367, 1, 0.654902, 0, 1,
-1.260132, -0.9267715, -2.409731, 1, 0.6588235, 0, 1,
-1.258555, 0.8184671, -1.899576, 1, 0.6666667, 0, 1,
-1.25606, 0.3607455, -2.688604, 1, 0.6705883, 0, 1,
-1.252559, 0.1029899, -2.08648, 1, 0.6784314, 0, 1,
-1.24972, 1.035684, -1.010908, 1, 0.682353, 0, 1,
-1.249585, 0.8094736, 0.5017468, 1, 0.6901961, 0, 1,
-1.246276, -0.2405696, -0.2991018, 1, 0.6941177, 0, 1,
-1.241533, 0.02258837, -0.907102, 1, 0.7019608, 0, 1,
-1.231928, 1.14611, 0.5844398, 1, 0.7098039, 0, 1,
-1.230184, -0.3332484, -0.9983864, 1, 0.7137255, 0, 1,
-1.223427, -0.8628861, -1.535272, 1, 0.7215686, 0, 1,
-1.219513, 0.3963993, -2.120031, 1, 0.7254902, 0, 1,
-1.211497, -0.2115706, -1.635581, 1, 0.7333333, 0, 1,
-1.211067, -0.5030283, -1.88236, 1, 0.7372549, 0, 1,
-1.210206, -0.3836437, -1.584918, 1, 0.7450981, 0, 1,
-1.197243, -0.1488397, 0.3506513, 1, 0.7490196, 0, 1,
-1.195658, 0.9047272, 0.1689348, 1, 0.7568628, 0, 1,
-1.192605, 0.7036742, -1.719431, 1, 0.7607843, 0, 1,
-1.192484, 0.9849175, -0.9201457, 1, 0.7686275, 0, 1,
-1.191608, -0.148486, -3.123514, 1, 0.772549, 0, 1,
-1.181637, -0.5582995, 0.2784456, 1, 0.7803922, 0, 1,
-1.172028, 1.20422, -0.7946149, 1, 0.7843137, 0, 1,
-1.160029, -0.03944115, -3.207411, 1, 0.7921569, 0, 1,
-1.15345, 0.8232356, -1.598934, 1, 0.7960784, 0, 1,
-1.149684, -0.8669744, -1.986609, 1, 0.8039216, 0, 1,
-1.148366, -0.09686834, -0.7169315, 1, 0.8117647, 0, 1,
-1.145098, -0.3892889, -2.14799, 1, 0.8156863, 0, 1,
-1.138516, -0.1287983, 0.3351635, 1, 0.8235294, 0, 1,
-1.131521, 0.8084775, -0.06163681, 1, 0.827451, 0, 1,
-1.131469, -1.195171, -2.165679, 1, 0.8352941, 0, 1,
-1.130412, -0.8428978, -2.443437, 1, 0.8392157, 0, 1,
-1.130069, -0.2808046, -1.2044, 1, 0.8470588, 0, 1,
-1.127014, 0.8923529, -1.169368, 1, 0.8509804, 0, 1,
-1.126318, -1.388479, -3.076318, 1, 0.8588235, 0, 1,
-1.122747, 0.6555928, -1.614277, 1, 0.8627451, 0, 1,
-1.118178, 2.004224, 0.8777242, 1, 0.8705882, 0, 1,
-1.115942, -1.99112, -3.172872, 1, 0.8745098, 0, 1,
-1.099361, -0.9468982, -1.799481, 1, 0.8823529, 0, 1,
-1.089456, -0.1946706, -0.6958735, 1, 0.8862745, 0, 1,
-1.084813, 1.221593, -0.8075605, 1, 0.8941177, 0, 1,
-1.081012, 0.2726207, -1.53159, 1, 0.8980392, 0, 1,
-1.076787, -0.499295, -1.901222, 1, 0.9058824, 0, 1,
-1.076463, -0.1037645, -0.2604133, 1, 0.9137255, 0, 1,
-1.076267, 1.330901, -0.7457172, 1, 0.9176471, 0, 1,
-1.075315, 0.715262, -2.256499, 1, 0.9254902, 0, 1,
-1.073463, 1.52802, -1.247811, 1, 0.9294118, 0, 1,
-1.06952, 0.6973478, -1.268847, 1, 0.9372549, 0, 1,
-1.068329, -2.094295, -2.663372, 1, 0.9411765, 0, 1,
-1.067375, -0.470237, -1.147903, 1, 0.9490196, 0, 1,
-1.06592, -0.8375852, -2.065884, 1, 0.9529412, 0, 1,
-1.065472, 0.2235807, -0.9464232, 1, 0.9607843, 0, 1,
-1.061073, 1.573605, 0.2469765, 1, 0.9647059, 0, 1,
-1.048757, 0.4766511, -0.8977569, 1, 0.972549, 0, 1,
-1.047087, 0.1632258, -0.6819333, 1, 0.9764706, 0, 1,
-1.034447, -1.330399, -2.725164, 1, 0.9843137, 0, 1,
-1.03228, 1.107761, -0.6101321, 1, 0.9882353, 0, 1,
-1.024526, -0.2286986, -0.01794262, 1, 0.9960784, 0, 1,
-1.024009, 0.8271465, 0.2732808, 0.9960784, 1, 0, 1,
-1.022839, 1.223476, -0.08566254, 0.9921569, 1, 0, 1,
-1.01218, -0.2186631, -1.531756, 0.9843137, 1, 0, 1,
-1.009391, 0.3720506, -1.324095, 0.9803922, 1, 0, 1,
-1.007418, 1.190751, -2.45591, 0.972549, 1, 0, 1,
-1.005255, 0.7345037, -2.255754, 0.9686275, 1, 0, 1,
-0.9978362, 0.3815797, -0.03428306, 0.9607843, 1, 0, 1,
-0.9868621, -0.5370389, -1.261979, 0.9568627, 1, 0, 1,
-0.9841123, 1.544517, -1.36975, 0.9490196, 1, 0, 1,
-0.9800088, -0.5653943, -0.8271911, 0.945098, 1, 0, 1,
-0.9795502, 1.203596, -0.7163218, 0.9372549, 1, 0, 1,
-0.9789384, -1.326588, -1.303008, 0.9333333, 1, 0, 1,
-0.9748465, 2.01006, 0.1783556, 0.9254902, 1, 0, 1,
-0.9743766, -0.710085, -2.456898, 0.9215686, 1, 0, 1,
-0.9743295, -2.3727, -3.632922, 0.9137255, 1, 0, 1,
-0.9653662, 0.6011447, -0.8282095, 0.9098039, 1, 0, 1,
-0.9593124, 0.238687, -1.087481, 0.9019608, 1, 0, 1,
-0.9562127, 0.6141266, -1.14411, 0.8941177, 1, 0, 1,
-0.9544792, 0.4539287, -0.8950692, 0.8901961, 1, 0, 1,
-0.9541816, -0.3901829, -2.252306, 0.8823529, 1, 0, 1,
-0.9533302, -0.305442, -3.738869, 0.8784314, 1, 0, 1,
-0.9443258, 0.7948081, -1.995514, 0.8705882, 1, 0, 1,
-0.943747, 0.9515853, -2.870317, 0.8666667, 1, 0, 1,
-0.941297, 0.352909, -1.430957, 0.8588235, 1, 0, 1,
-0.9327657, 0.643382, -0.1610339, 0.854902, 1, 0, 1,
-0.9217123, 0.4443311, -0.06559858, 0.8470588, 1, 0, 1,
-0.9201859, 0.6370923, -1.394748, 0.8431373, 1, 0, 1,
-0.9190394, -1.46155, -3.666793, 0.8352941, 1, 0, 1,
-0.9157062, -0.1095408, -3.009916, 0.8313726, 1, 0, 1,
-0.9149738, 0.1450957, -0.6290749, 0.8235294, 1, 0, 1,
-0.9117007, 0.2040403, -1.032976, 0.8196079, 1, 0, 1,
-0.9085729, -0.0615869, -1.412633, 0.8117647, 1, 0, 1,
-0.9067988, 2.76581, 0.05638485, 0.8078431, 1, 0, 1,
-0.9047742, 0.5246996, -2.484521, 0.8, 1, 0, 1,
-0.9042736, 0.2930402, -0.5840844, 0.7921569, 1, 0, 1,
-0.9008459, -0.09104125, -3.047195, 0.7882353, 1, 0, 1,
-0.8958182, 0.6193814, -1.613619, 0.7803922, 1, 0, 1,
-0.894658, -1.105803, -3.052888, 0.7764706, 1, 0, 1,
-0.8945681, 0.3544855, -2.217306, 0.7686275, 1, 0, 1,
-0.8896626, 0.9075951, -0.727577, 0.7647059, 1, 0, 1,
-0.8875205, -0.6186543, -3.717945, 0.7568628, 1, 0, 1,
-0.8859966, 0.7583943, -0.6519553, 0.7529412, 1, 0, 1,
-0.8826159, 1.692621, -1.650651, 0.7450981, 1, 0, 1,
-0.8715798, 0.2267965, -1.209235, 0.7411765, 1, 0, 1,
-0.8714064, -0.1582728, -0.5073255, 0.7333333, 1, 0, 1,
-0.8708389, -0.1843348, -0.5557972, 0.7294118, 1, 0, 1,
-0.8683951, 0.1322136, -0.1609566, 0.7215686, 1, 0, 1,
-0.8656672, -0.9296342, -3.109218, 0.7176471, 1, 0, 1,
-0.8554214, 1.530372, -1.933799, 0.7098039, 1, 0, 1,
-0.849386, -1.022257, -2.815844, 0.7058824, 1, 0, 1,
-0.8487971, 0.3564058, 1.729098, 0.6980392, 1, 0, 1,
-0.8487024, -1.34915, -2.28375, 0.6901961, 1, 0, 1,
-0.84394, -0.3211899, -2.708632, 0.6862745, 1, 0, 1,
-0.8421978, 0.05436231, -0.5720371, 0.6784314, 1, 0, 1,
-0.8349883, 0.9375111, -2.09543, 0.6745098, 1, 0, 1,
-0.8271081, 0.01484641, -0.9507821, 0.6666667, 1, 0, 1,
-0.8242819, -0.223562, -2.627004, 0.6627451, 1, 0, 1,
-0.8235022, -0.4518085, -2.583351, 0.654902, 1, 0, 1,
-0.8192657, 0.8577915, 0.6651561, 0.6509804, 1, 0, 1,
-0.8151317, -0.01207673, -1.927127, 0.6431373, 1, 0, 1,
-0.808337, -0.5228837, -2.771098, 0.6392157, 1, 0, 1,
-0.8081627, 0.04453394, -1.5229, 0.6313726, 1, 0, 1,
-0.8078644, -0.699968, -2.520877, 0.627451, 1, 0, 1,
-0.8049036, -1.572884, -3.48494, 0.6196079, 1, 0, 1,
-0.7957525, -2.197767, -2.808376, 0.6156863, 1, 0, 1,
-0.7902156, -1.053774, -3.975032, 0.6078432, 1, 0, 1,
-0.7868174, -0.4749445, -3.361273, 0.6039216, 1, 0, 1,
-0.7850304, -2.075573, -2.435304, 0.5960785, 1, 0, 1,
-0.7811519, 0.2422536, -1.460681, 0.5882353, 1, 0, 1,
-0.7810431, -0.002488045, -1.118139, 0.5843138, 1, 0, 1,
-0.7728009, 0.02684101, -2.006788, 0.5764706, 1, 0, 1,
-0.7680377, 0.01394116, -0.8716571, 0.572549, 1, 0, 1,
-0.7634137, -2.327271, -4.794551, 0.5647059, 1, 0, 1,
-0.7623239, 0.4457602, -1.037273, 0.5607843, 1, 0, 1,
-0.7583497, -0.08072925, -0.5739332, 0.5529412, 1, 0, 1,
-0.7487671, -0.176622, -0.8556657, 0.5490196, 1, 0, 1,
-0.741881, -1.385764, -3.209358, 0.5411765, 1, 0, 1,
-0.7392901, 0.2117378, -3.305132, 0.5372549, 1, 0, 1,
-0.7390797, -1.440682, -2.69548, 0.5294118, 1, 0, 1,
-0.7320815, 0.5120997, 0.366683, 0.5254902, 1, 0, 1,
-0.7289153, -0.4127933, -2.452057, 0.5176471, 1, 0, 1,
-0.7186623, -0.09650861, -0.7626447, 0.5137255, 1, 0, 1,
-0.7178804, 0.001979738, -1.372543, 0.5058824, 1, 0, 1,
-0.7175262, -0.3200628, -4.008661, 0.5019608, 1, 0, 1,
-0.7160975, -1.977665, -3.701917, 0.4941176, 1, 0, 1,
-0.7117497, 0.9751638, 1.746459, 0.4862745, 1, 0, 1,
-0.7102417, -0.5376271, -1.989202, 0.4823529, 1, 0, 1,
-0.7048755, 0.4875763, -0.8554612, 0.4745098, 1, 0, 1,
-0.7040277, 1.120792, -1.621184, 0.4705882, 1, 0, 1,
-0.7012326, 0.4351043, -0.484944, 0.4627451, 1, 0, 1,
-0.7004654, 2.150396, -0.4805574, 0.4588235, 1, 0, 1,
-0.684941, -0.7625568, -1.39816, 0.4509804, 1, 0, 1,
-0.6754268, 2.144888, -0.6696202, 0.4470588, 1, 0, 1,
-0.673996, 0.6627106, -1.078871, 0.4392157, 1, 0, 1,
-0.6636934, 0.05657532, 0.5561597, 0.4352941, 1, 0, 1,
-0.6624211, 0.2108117, -1.473851, 0.427451, 1, 0, 1,
-0.6612452, -1.141936, -3.265576, 0.4235294, 1, 0, 1,
-0.6538396, 1.346453, -0.2071116, 0.4156863, 1, 0, 1,
-0.6526527, 0.8236093, -0.5153173, 0.4117647, 1, 0, 1,
-0.6473634, 0.2518991, -0.8640108, 0.4039216, 1, 0, 1,
-0.6451533, 2.040047, 0.9649249, 0.3960784, 1, 0, 1,
-0.6435648, -0.1993778, -2.469006, 0.3921569, 1, 0, 1,
-0.6410581, 0.4771198, -2.053015, 0.3843137, 1, 0, 1,
-0.6382459, -0.0534973, -1.876953, 0.3803922, 1, 0, 1,
-0.635619, 1.217128, -2.239722, 0.372549, 1, 0, 1,
-0.6331499, -1.453058, -4.018236, 0.3686275, 1, 0, 1,
-0.6324957, -0.6681984, -1.083015, 0.3607843, 1, 0, 1,
-0.6245801, -0.07479566, -2.488284, 0.3568628, 1, 0, 1,
-0.6229519, 0.3412932, -1.80197, 0.3490196, 1, 0, 1,
-0.61653, 0.6442675, -2.382607, 0.345098, 1, 0, 1,
-0.6137362, 1.854572, -2.281623, 0.3372549, 1, 0, 1,
-0.6117489, -1.454396, -1.547714, 0.3333333, 1, 0, 1,
-0.6104956, -1.784033, -2.459807, 0.3254902, 1, 0, 1,
-0.6035025, 1.413466, -0.05837092, 0.3215686, 1, 0, 1,
-0.6000481, -0.1578643, -2.312274, 0.3137255, 1, 0, 1,
-0.5977221, -2.319317, -2.598539, 0.3098039, 1, 0, 1,
-0.5939748, 1.837577, -1.479508, 0.3019608, 1, 0, 1,
-0.5931322, -0.3585446, -1.150781, 0.2941177, 1, 0, 1,
-0.5903569, -1.515726, -0.8827849, 0.2901961, 1, 0, 1,
-0.5891494, -2.026679, -2.382184, 0.282353, 1, 0, 1,
-0.5890673, -0.3640549, -1.596314, 0.2784314, 1, 0, 1,
-0.5750665, -0.9487322, -4.321971, 0.2705882, 1, 0, 1,
-0.5702031, -0.3443469, -1.850417, 0.2666667, 1, 0, 1,
-0.5696864, -1.130899, -3.101172, 0.2588235, 1, 0, 1,
-0.567498, -0.4497573, -1.406128, 0.254902, 1, 0, 1,
-0.5603829, 2.262997, -2.436116, 0.2470588, 1, 0, 1,
-0.5567564, -0.04969878, -0.9820572, 0.2431373, 1, 0, 1,
-0.5567282, -0.3084514, -3.317878, 0.2352941, 1, 0, 1,
-0.5559558, 1.31639, -0.8434412, 0.2313726, 1, 0, 1,
-0.5523398, -1.137187, 0.1735999, 0.2235294, 1, 0, 1,
-0.5386866, 1.140215, -1.176681, 0.2196078, 1, 0, 1,
-0.5347419, 0.7002349, 0.08659916, 0.2117647, 1, 0, 1,
-0.5344793, 1.308145, -1.654828, 0.2078431, 1, 0, 1,
-0.5305422, -1.361081, -3.14178, 0.2, 1, 0, 1,
-0.5251197, 1.188392, -0.6205447, 0.1921569, 1, 0, 1,
-0.5215305, 0.2824911, -1.998268, 0.1882353, 1, 0, 1,
-0.5188598, 0.08050773, -1.236392, 0.1803922, 1, 0, 1,
-0.5186736, 1.296962, 0.7137673, 0.1764706, 1, 0, 1,
-0.5091921, -0.6957803, -1.506652, 0.1686275, 1, 0, 1,
-0.5075978, 0.8558753, 0.3541917, 0.1647059, 1, 0, 1,
-0.5072564, 0.7973171, -1.141634, 0.1568628, 1, 0, 1,
-0.5024202, -0.8430057, -3.558768, 0.1529412, 1, 0, 1,
-0.5023259, 0.9097603, -0.3536438, 0.145098, 1, 0, 1,
-0.5023077, 1.679646, -0.5955912, 0.1411765, 1, 0, 1,
-0.4989688, -0.3159767, -2.536262, 0.1333333, 1, 0, 1,
-0.4953967, -0.2153792, -1.636437, 0.1294118, 1, 0, 1,
-0.4907494, -1.157305, -2.268332, 0.1215686, 1, 0, 1,
-0.4896442, -0.9475752, -4.768887, 0.1176471, 1, 0, 1,
-0.4895683, 2.555441, 0.828823, 0.1098039, 1, 0, 1,
-0.489557, -0.5526, -2.702175, 0.1058824, 1, 0, 1,
-0.4887161, -0.02447769, -3.264258, 0.09803922, 1, 0, 1,
-0.4882949, -0.6121524, -3.215899, 0.09019608, 1, 0, 1,
-0.48656, -0.3696686, -2.84736, 0.08627451, 1, 0, 1,
-0.4855151, 0.8616642, -0.5513512, 0.07843138, 1, 0, 1,
-0.48362, -1.253136, -1.34093, 0.07450981, 1, 0, 1,
-0.4836031, 0.945564, -1.654797, 0.06666667, 1, 0, 1,
-0.4832598, 0.2892783, -1.641443, 0.0627451, 1, 0, 1,
-0.4818294, 1.375847, -0.4754169, 0.05490196, 1, 0, 1,
-0.479117, -0.5148645, -3.561719, 0.05098039, 1, 0, 1,
-0.4772569, -0.46251, -3.448477, 0.04313726, 1, 0, 1,
-0.4768483, 0.6741328, 0.4068192, 0.03921569, 1, 0, 1,
-0.4741342, -0.4006406, -2.90044, 0.03137255, 1, 0, 1,
-0.469622, 0.772974, -0.2219806, 0.02745098, 1, 0, 1,
-0.4659733, -0.6694179, -2.167102, 0.01960784, 1, 0, 1,
-0.4623919, -0.728155, -2.139713, 0.01568628, 1, 0, 1,
-0.4618018, 1.067997, -2.203377, 0.007843138, 1, 0, 1,
-0.4595392, -1.317016, -3.292905, 0.003921569, 1, 0, 1,
-0.4555133, -0.5041909, -3.03004, 0, 1, 0.003921569, 1,
-0.4541671, -0.3333628, -1.29557, 0, 1, 0.01176471, 1,
-0.4508824, 0.7284512, -0.2017479, 0, 1, 0.01568628, 1,
-0.4496869, -0.2888605, -2.081626, 0, 1, 0.02352941, 1,
-0.4461037, 0.7020558, -0.1687049, 0, 1, 0.02745098, 1,
-0.4404967, -1.151514, -1.801467, 0, 1, 0.03529412, 1,
-0.4369876, 0.8236702, 0.6369628, 0, 1, 0.03921569, 1,
-0.4367021, -1.172788, -2.980313, 0, 1, 0.04705882, 1,
-0.4345072, 0.8779598, -1.243178, 0, 1, 0.05098039, 1,
-0.4325652, 0.2941504, -0.6537285, 0, 1, 0.05882353, 1,
-0.4321846, -0.7733833, -3.166869, 0, 1, 0.0627451, 1,
-0.4320062, 0.7731062, -1.822291, 0, 1, 0.07058824, 1,
-0.4289199, -0.4352438, -3.206592, 0, 1, 0.07450981, 1,
-0.4238203, 0.2807025, -2.322867, 0, 1, 0.08235294, 1,
-0.4182492, -0.5761885, -0.3813986, 0, 1, 0.08627451, 1,
-0.4150685, -1.083198, -2.103124, 0, 1, 0.09411765, 1,
-0.4124277, -1.813663, -2.710493, 0, 1, 0.1019608, 1,
-0.4118792, -0.5092352, -2.377855, 0, 1, 0.1058824, 1,
-0.4102746, -0.3039355, -1.797485, 0, 1, 0.1137255, 1,
-0.4100581, -0.3421595, -2.138748, 0, 1, 0.1176471, 1,
-0.4085541, 0.6872454, -0.2090738, 0, 1, 0.1254902, 1,
-0.4050399, 1.772658, 1.062713, 0, 1, 0.1294118, 1,
-0.3987101, 1.382425, 0.5290865, 0, 1, 0.1372549, 1,
-0.3984644, 0.2895806, -1.585905, 0, 1, 0.1411765, 1,
-0.3981567, 2.916855, -1.530255, 0, 1, 0.1490196, 1,
-0.3977901, -0.1977235, -3.170027, 0, 1, 0.1529412, 1,
-0.3970605, -0.3175379, -3.808837, 0, 1, 0.1607843, 1,
-0.3958408, -1.055712, -2.802056, 0, 1, 0.1647059, 1,
-0.3948217, 0.2172973, -0.1157282, 0, 1, 0.172549, 1,
-0.3912759, 0.3782114, -1.662974, 0, 1, 0.1764706, 1,
-0.3886, 0.7828059, 0.2550439, 0, 1, 0.1843137, 1,
-0.386214, -0.3608005, -2.245555, 0, 1, 0.1882353, 1,
-0.3848133, 0.2579199, -1.852025, 0, 1, 0.1960784, 1,
-0.3825981, 0.6033757, 0.3216853, 0, 1, 0.2039216, 1,
-0.3822563, 1.470198, -0.6797901, 0, 1, 0.2078431, 1,
-0.3778822, 0.4537112, 0.2934647, 0, 1, 0.2156863, 1,
-0.3772086, 0.6068543, -1.645409, 0, 1, 0.2196078, 1,
-0.375027, 0.4283247, -0.4199824, 0, 1, 0.227451, 1,
-0.3731345, 0.1016851, -1.558918, 0, 1, 0.2313726, 1,
-0.3679902, -1.130729, -2.337306, 0, 1, 0.2392157, 1,
-0.3675326, 1.839074, 0.5932323, 0, 1, 0.2431373, 1,
-0.3603569, -0.05408783, -1.231373, 0, 1, 0.2509804, 1,
-0.3560383, 0.5586467, -1.226945, 0, 1, 0.254902, 1,
-0.3504498, 0.778353, -0.2544357, 0, 1, 0.2627451, 1,
-0.3504126, -0.6116363, -4.688119, 0, 1, 0.2666667, 1,
-0.3493125, -1.756505, -4.465723, 0, 1, 0.2745098, 1,
-0.347698, -2.14842, -1.624595, 0, 1, 0.2784314, 1,
-0.3405108, -1.130839, -2.508542, 0, 1, 0.2862745, 1,
-0.3394848, 1.249828, 0.8084387, 0, 1, 0.2901961, 1,
-0.3317821, 0.5493086, -1.030936, 0, 1, 0.2980392, 1,
-0.3252248, -0.8709778, -3.014999, 0, 1, 0.3058824, 1,
-0.324302, 0.6093057, 0.4873747, 0, 1, 0.3098039, 1,
-0.3227997, 0.2362193, -1.536935, 0, 1, 0.3176471, 1,
-0.31618, 1.047589, -1.391676, 0, 1, 0.3215686, 1,
-0.310556, 2.33283, -0.5426896, 0, 1, 0.3294118, 1,
-0.310104, 1.010064, 0.3561493, 0, 1, 0.3333333, 1,
-0.3093493, -1.097651, -2.730896, 0, 1, 0.3411765, 1,
-0.3077487, 1.268506, -2.789972, 0, 1, 0.345098, 1,
-0.307475, 1.266212, -0.2538619, 0, 1, 0.3529412, 1,
-0.3046279, -0.4941713, -2.841938, 0, 1, 0.3568628, 1,
-0.3028305, -0.2749223, -0.5782061, 0, 1, 0.3647059, 1,
-0.3026074, 0.1453024, -1.723776, 0, 1, 0.3686275, 1,
-0.3015973, 0.6524428, -0.7682117, 0, 1, 0.3764706, 1,
-0.3015259, 0.8559127, 1.429022, 0, 1, 0.3803922, 1,
-0.3012406, 0.3665554, -0.6404486, 0, 1, 0.3882353, 1,
-0.3007608, 1.025224, 0.5962771, 0, 1, 0.3921569, 1,
-0.2973034, 0.6795453, -1.178314, 0, 1, 0.4, 1,
-0.2947425, -1.241634, -2.65565, 0, 1, 0.4078431, 1,
-0.2917681, 0.5210919, -1.213569, 0, 1, 0.4117647, 1,
-0.287829, 0.299543, 1.258177, 0, 1, 0.4196078, 1,
-0.2857257, 0.03285482, -1.476104, 0, 1, 0.4235294, 1,
-0.2826618, -2.270233, -0.6903427, 0, 1, 0.4313726, 1,
-0.2825381, -0.4323201, -2.537229, 0, 1, 0.4352941, 1,
-0.2801804, 0.4810788, -1.807808, 0, 1, 0.4431373, 1,
-0.2744418, 0.8342353, 0.1112823, 0, 1, 0.4470588, 1,
-0.2731926, 1.052137, -0.4689241, 0, 1, 0.454902, 1,
-0.2714844, -0.9603655, -4.081519, 0, 1, 0.4588235, 1,
-0.2702931, 1.235657, -1.480391, 0, 1, 0.4666667, 1,
-0.2700809, 0.1288466, -0.2537296, 0, 1, 0.4705882, 1,
-0.2675832, 2.242745, 0.4051581, 0, 1, 0.4784314, 1,
-0.2601516, -0.8812395, -1.960466, 0, 1, 0.4823529, 1,
-0.2595252, 1.543333, -0.840463, 0, 1, 0.4901961, 1,
-0.2560354, -0.5324485, -3.91503, 0, 1, 0.4941176, 1,
-0.2483828, 0.6040935, 1.570298, 0, 1, 0.5019608, 1,
-0.2445196, -0.2449802, -1.437253, 0, 1, 0.509804, 1,
-0.2425776, -0.6464565, -1.060519, 0, 1, 0.5137255, 1,
-0.2411971, -1.239069, -2.991519, 0, 1, 0.5215687, 1,
-0.2393341, -0.01910691, -2.370765, 0, 1, 0.5254902, 1,
-0.2381545, 0.8354295, -0.3886296, 0, 1, 0.5333334, 1,
-0.2282268, -0.5454376, -3.880493, 0, 1, 0.5372549, 1,
-0.2241725, -1.401077, -3.52493, 0, 1, 0.5450981, 1,
-0.2198956, 1.645124, -1.684161, 0, 1, 0.5490196, 1,
-0.2196791, -1.136546, -3.035509, 0, 1, 0.5568628, 1,
-0.2192205, 0.2315407, -2.384463, 0, 1, 0.5607843, 1,
-0.2190401, -0.5729955, -3.380172, 0, 1, 0.5686275, 1,
-0.2176256, -0.8128091, -3.513294, 0, 1, 0.572549, 1,
-0.216007, 0.07340489, 1.250804, 0, 1, 0.5803922, 1,
-0.2062935, -0.4497573, -3.018974, 0, 1, 0.5843138, 1,
-0.2059097, 1.66515, -1.699064, 0, 1, 0.5921569, 1,
-0.2046179, -0.6200094, -2.985361, 0, 1, 0.5960785, 1,
-0.2024541, -1.769531, -3.018716, 0, 1, 0.6039216, 1,
-0.200864, -0.1246198, -1.388387, 0, 1, 0.6117647, 1,
-0.1984197, 0.4163091, 0.5815927, 0, 1, 0.6156863, 1,
-0.1983694, -0.6339583, -3.866425, 0, 1, 0.6235294, 1,
-0.1977541, -0.04459693, -2.765036, 0, 1, 0.627451, 1,
-0.1971596, 0.08583733, -0.4307033, 0, 1, 0.6352941, 1,
-0.1939091, -1.47749, -4.005936, 0, 1, 0.6392157, 1,
-0.1938518, 1.399129, 0.208472, 0, 1, 0.6470588, 1,
-0.1935699, 0.4734319, -1.540533, 0, 1, 0.6509804, 1,
-0.1916958, 0.8829402, 1.02793, 0, 1, 0.6588235, 1,
-0.1871559, 0.4917897, -0.6838617, 0, 1, 0.6627451, 1,
-0.1802577, -0.7741926, -2.299364, 0, 1, 0.6705883, 1,
-0.1790466, 0.2740422, -1.616615, 0, 1, 0.6745098, 1,
-0.1755205, 2.05292, -0.4632221, 0, 1, 0.682353, 1,
-0.171703, 0.6195533, -0.4969505, 0, 1, 0.6862745, 1,
-0.1667964, 1.332671, 1.123067, 0, 1, 0.6941177, 1,
-0.1623883, 0.3306348, 0.3550687, 0, 1, 0.7019608, 1,
-0.1615087, 0.813951, -0.5284171, 0, 1, 0.7058824, 1,
-0.1582927, 0.1881736, -1.670504, 0, 1, 0.7137255, 1,
-0.1547505, -0.6086547, -3.436406, 0, 1, 0.7176471, 1,
-0.153154, 0.5128841, -1.207439, 0, 1, 0.7254902, 1,
-0.1510127, 1.877527, -1.997661, 0, 1, 0.7294118, 1,
-0.1472929, 1.239081, -0.7560911, 0, 1, 0.7372549, 1,
-0.1456642, 1.316373, 0.3103678, 0, 1, 0.7411765, 1,
-0.1415598, 0.666153, -0.7847218, 0, 1, 0.7490196, 1,
-0.1342617, 0.4497174, -1.471511, 0, 1, 0.7529412, 1,
-0.1288383, -0.1040315, -0.8834726, 0, 1, 0.7607843, 1,
-0.1277116, -0.1776082, -1.99916, 0, 1, 0.7647059, 1,
-0.1269546, 1.162389, 0.05498604, 0, 1, 0.772549, 1,
-0.1268092, -1.208734, -2.132992, 0, 1, 0.7764706, 1,
-0.1266833, 0.3663803, -0.6968218, 0, 1, 0.7843137, 1,
-0.1265124, -0.4310875, -4.439059, 0, 1, 0.7882353, 1,
-0.1263336, 0.8470159, -0.9839059, 0, 1, 0.7960784, 1,
-0.122785, 0.3574465, -1.011096, 0, 1, 0.8039216, 1,
-0.1220665, 0.5629376, 1.075825, 0, 1, 0.8078431, 1,
-0.1214148, -0.8806718, -2.59677, 0, 1, 0.8156863, 1,
-0.1098428, -0.3869453, -3.070753, 0, 1, 0.8196079, 1,
-0.09679195, -0.6747703, -1.783293, 0, 1, 0.827451, 1,
-0.09525776, 0.3503317, 2.053139, 0, 1, 0.8313726, 1,
-0.09466889, -0.4014997, -2.99983, 0, 1, 0.8392157, 1,
-0.09375221, -1.140976, -2.618509, 0, 1, 0.8431373, 1,
-0.08961945, -0.7199633, -1.425813, 0, 1, 0.8509804, 1,
-0.08844362, 0.3727306, -1.037208, 0, 1, 0.854902, 1,
-0.08677164, 0.005758174, -1.411262, 0, 1, 0.8627451, 1,
-0.08194533, -1.066422, -4.146981, 0, 1, 0.8666667, 1,
-0.08013736, 0.0338712, -0.3601897, 0, 1, 0.8745098, 1,
-0.08005885, -2.136948, -1.635481, 0, 1, 0.8784314, 1,
-0.07652668, 0.6594125, -0.5685518, 0, 1, 0.8862745, 1,
-0.07628507, 0.01201197, -1.509691, 0, 1, 0.8901961, 1,
-0.07613181, 0.4965743, 0.07317306, 0, 1, 0.8980392, 1,
-0.07226076, -0.2395554, -2.818856, 0, 1, 0.9058824, 1,
-0.0679791, 0.5337782, 0.1109965, 0, 1, 0.9098039, 1,
-0.06794905, 0.08596908, -1.781607, 0, 1, 0.9176471, 1,
-0.06672627, 0.9204838, -0.452052, 0, 1, 0.9215686, 1,
-0.06244692, 1.920179, -1.879215, 0, 1, 0.9294118, 1,
-0.06137216, 0.6534815, -0.6506926, 0, 1, 0.9333333, 1,
-0.06055398, 0.06937544, 1.042997, 0, 1, 0.9411765, 1,
-0.05704375, -1.33406, -2.4149, 0, 1, 0.945098, 1,
-0.05570891, -0.2888101, -2.986611, 0, 1, 0.9529412, 1,
-0.05302176, 1.833508, 1.754258, 0, 1, 0.9568627, 1,
-0.05245519, -0.01078112, -1.446155, 0, 1, 0.9647059, 1,
-0.05155166, 0.7524215, -0.6208861, 0, 1, 0.9686275, 1,
-0.0456801, 0.2128872, 1.219961, 0, 1, 0.9764706, 1,
-0.04370577, 1.618387, 0.21577, 0, 1, 0.9803922, 1,
-0.04045131, -0.458943, -0.5014946, 0, 1, 0.9882353, 1,
-0.03781481, 0.2635213, -2.105856, 0, 1, 0.9921569, 1,
-0.03662686, 1.545026, -0.6227292, 0, 1, 1, 1,
-0.03490506, 0.8155892, 2.160024, 0, 0.9921569, 1, 1,
-0.03339659, -0.7049469, -1.811544, 0, 0.9882353, 1, 1,
-0.02445298, 1.005711, -0.7691874, 0, 0.9803922, 1, 1,
-0.0183543, 0.3215626, -1.23249, 0, 0.9764706, 1, 1,
-0.01103273, 0.06224984, -0.03815822, 0, 0.9686275, 1, 1,
-0.01031584, 0.8324537, 0.6141902, 0, 0.9647059, 1, 1,
-0.008440819, -0.7628565, -3.021875, 0, 0.9568627, 1, 1,
-0.008126963, 0.3353219, -0.073571, 0, 0.9529412, 1, 1,
-0.006874489, -0.2975239, -4.775797, 0, 0.945098, 1, 1,
-0.006508762, 0.7999958, -0.226301, 0, 0.9411765, 1, 1,
-0.006448828, 0.5040855, 1.000003, 0, 0.9333333, 1, 1,
-0.005793066, 1.285682, 1.164068, 0, 0.9294118, 1, 1,
0.001908469, 1.30276, 0.002253199, 0, 0.9215686, 1, 1,
0.005927203, 0.3147179, -0.1070201, 0, 0.9176471, 1, 1,
0.006736747, -0.403988, 3.074602, 0, 0.9098039, 1, 1,
0.008502789, -1.534043, 0.09497602, 0, 0.9058824, 1, 1,
0.00886581, 0.07618641, -0.6122782, 0, 0.8980392, 1, 1,
0.0124367, 1.578768, -0.8831552, 0, 0.8901961, 1, 1,
0.01313855, -0.009305292, 2.584453, 0, 0.8862745, 1, 1,
0.01475285, 1.058563, 1.027587, 0, 0.8784314, 1, 1,
0.0156358, 0.1063827, 1.591897, 0, 0.8745098, 1, 1,
0.01765856, -0.08262178, 2.975426, 0, 0.8666667, 1, 1,
0.01825035, 1.29926, -0.6544147, 0, 0.8627451, 1, 1,
0.01982591, -1.489069, 2.482557, 0, 0.854902, 1, 1,
0.02168678, 1.396198, -0.329888, 0, 0.8509804, 1, 1,
0.02438708, 1.043822, -0.2513295, 0, 0.8431373, 1, 1,
0.02935137, -1.405005, 3.793639, 0, 0.8392157, 1, 1,
0.03200411, 0.5356194, -0.05753283, 0, 0.8313726, 1, 1,
0.03240764, 0.2892694, 0.7048609, 0, 0.827451, 1, 1,
0.032959, 1.478288, -0.9223737, 0, 0.8196079, 1, 1,
0.03306105, -0.1729196, 2.166643, 0, 0.8156863, 1, 1,
0.03888799, -0.1968452, 3.747798, 0, 0.8078431, 1, 1,
0.03898333, 0.1989207, -0.5593451, 0, 0.8039216, 1, 1,
0.04022469, 0.04358182, 4.380881, 0, 0.7960784, 1, 1,
0.04488398, -0.1646907, 3.622813, 0, 0.7882353, 1, 1,
0.04534248, -0.7904163, 3.943641, 0, 0.7843137, 1, 1,
0.04590305, -2.433498, 2.456221, 0, 0.7764706, 1, 1,
0.05134049, 1.37122, -0.4021239, 0, 0.772549, 1, 1,
0.05188676, 0.3411733, 0.8509833, 0, 0.7647059, 1, 1,
0.05361933, -0.8612922, 4.844305, 0, 0.7607843, 1, 1,
0.05747777, 1.177954, 0.2415112, 0, 0.7529412, 1, 1,
0.05830777, -1.643165, 3.924125, 0, 0.7490196, 1, 1,
0.06098247, 0.541073, 0.07969221, 0, 0.7411765, 1, 1,
0.06559278, -2.443893, 1.602159, 0, 0.7372549, 1, 1,
0.06633031, -0.1115038, 1.619203, 0, 0.7294118, 1, 1,
0.0680637, -0.2961533, 3.466734, 0, 0.7254902, 1, 1,
0.06921157, 0.02006119, 3.24766, 0, 0.7176471, 1, 1,
0.07759261, 0.01665143, 2.219373, 0, 0.7137255, 1, 1,
0.08031075, -0.2287645, 1.776855, 0, 0.7058824, 1, 1,
0.08172752, -0.2380569, 2.551683, 0, 0.6980392, 1, 1,
0.08431952, -0.7625896, 4.781405, 0, 0.6941177, 1, 1,
0.08652788, 1.54798, 0.9734614, 0, 0.6862745, 1, 1,
0.09088781, -1.539677, 3.274442, 0, 0.682353, 1, 1,
0.09260952, -0.2655087, 4.341015, 0, 0.6745098, 1, 1,
0.09315755, -0.04962999, 2.822545, 0, 0.6705883, 1, 1,
0.09326327, 1.077791, -0.3866724, 0, 0.6627451, 1, 1,
0.09696323, 1.197788, 1.04111, 0, 0.6588235, 1, 1,
0.1002208, -0.5328137, 3.343733, 0, 0.6509804, 1, 1,
0.1063332, -1.871787, 3.640129, 0, 0.6470588, 1, 1,
0.1085896, -1.094984, 2.807716, 0, 0.6392157, 1, 1,
0.1114743, 1.35883, -1.190114, 0, 0.6352941, 1, 1,
0.1170556, -1.549857, 4.320579, 0, 0.627451, 1, 1,
0.1173162, -0.169201, 3.696868, 0, 0.6235294, 1, 1,
0.1196277, 2.182474, 0.08519874, 0, 0.6156863, 1, 1,
0.1228832, -0.2248263, 2.86554, 0, 0.6117647, 1, 1,
0.1233008, 0.3335145, -0.5634831, 0, 0.6039216, 1, 1,
0.1350539, -1.298682, 3.82971, 0, 0.5960785, 1, 1,
0.1352181, 0.6040961, -1.644498, 0, 0.5921569, 1, 1,
0.1395169, -0.08825019, 2.317529, 0, 0.5843138, 1, 1,
0.1399291, -0.3117638, 4.129663, 0, 0.5803922, 1, 1,
0.1444608, -0.1965032, 1.675032, 0, 0.572549, 1, 1,
0.1453623, -1.643167, 2.507488, 0, 0.5686275, 1, 1,
0.1461679, -0.275752, 2.569304, 0, 0.5607843, 1, 1,
0.1490243, -1.409537, 2.120485, 0, 0.5568628, 1, 1,
0.1544113, -0.5662537, 3.412586, 0, 0.5490196, 1, 1,
0.1545864, -1.88859, 1.208619, 0, 0.5450981, 1, 1,
0.155236, 0.2577198, 0.7094717, 0, 0.5372549, 1, 1,
0.1561121, 0.6902221, -0.6276731, 0, 0.5333334, 1, 1,
0.1572025, -0.178134, 2.389741, 0, 0.5254902, 1, 1,
0.1584609, -0.4355632, 1.636599, 0, 0.5215687, 1, 1,
0.1633407, 0.696479, 0.7962868, 0, 0.5137255, 1, 1,
0.1651333, -0.5763678, 3.047084, 0, 0.509804, 1, 1,
0.1663198, 0.4923682, 0.4236454, 0, 0.5019608, 1, 1,
0.1693723, 1.351656, -0.7904044, 0, 0.4941176, 1, 1,
0.1698201, 1.823186, 0.9433344, 0, 0.4901961, 1, 1,
0.1701053, 1.882322, -0.4927446, 0, 0.4823529, 1, 1,
0.1744872, 1.571352, -0.6614984, 0, 0.4784314, 1, 1,
0.1812218, 1.402183, -0.4548253, 0, 0.4705882, 1, 1,
0.1821789, 1.56771, 1.872643, 0, 0.4666667, 1, 1,
0.1823083, 0.3525186, 1.52916, 0, 0.4588235, 1, 1,
0.1859857, 0.1414844, 2.07057, 0, 0.454902, 1, 1,
0.1872553, -0.1999158, 1.801023, 0, 0.4470588, 1, 1,
0.1960329, -0.424564, 2.307503, 0, 0.4431373, 1, 1,
0.1975744, 0.2543827, 0.9178561, 0, 0.4352941, 1, 1,
0.1982891, -1.847886, 4.725171, 0, 0.4313726, 1, 1,
0.2034883, -1.464267, 2.051424, 0, 0.4235294, 1, 1,
0.2034956, -0.8999701, 2.377685, 0, 0.4196078, 1, 1,
0.2043175, 0.1297795, 0.96965, 0, 0.4117647, 1, 1,
0.2051805, 1.963644, -0.08320611, 0, 0.4078431, 1, 1,
0.2089749, 1.264533, 0.4526936, 0, 0.4, 1, 1,
0.214375, -0.8612517, 1.773756, 0, 0.3921569, 1, 1,
0.2154142, 1.713973, -0.9968005, 0, 0.3882353, 1, 1,
0.2172874, -0.8471379, 1.692925, 0, 0.3803922, 1, 1,
0.2199139, 0.8427149, -0.4234977, 0, 0.3764706, 1, 1,
0.225961, 0.4916376, 0.6944767, 0, 0.3686275, 1, 1,
0.2295986, 1.024163, -0.3369621, 0, 0.3647059, 1, 1,
0.2306301, 1.350942, -0.4914145, 0, 0.3568628, 1, 1,
0.2345312, -2.645101, 3.451139, 0, 0.3529412, 1, 1,
0.2353477, -0.9071469, 3.735592, 0, 0.345098, 1, 1,
0.2412426, 0.02327967, 0.9260178, 0, 0.3411765, 1, 1,
0.2428613, 1.181197, 0.9248795, 0, 0.3333333, 1, 1,
0.243148, -0.291623, 1.409988, 0, 0.3294118, 1, 1,
0.2440925, 0.7294661, 0.3535778, 0, 0.3215686, 1, 1,
0.2453427, 2.452082, 0.3564971, 0, 0.3176471, 1, 1,
0.2515621, -0.5097378, 3.105644, 0, 0.3098039, 1, 1,
0.2523007, -1.475075, 3.219379, 0, 0.3058824, 1, 1,
0.252896, -0.9179613, 2.78029, 0, 0.2980392, 1, 1,
0.2624613, 0.9851143, 0.196867, 0, 0.2901961, 1, 1,
0.2630388, -1.28468, 2.334838, 0, 0.2862745, 1, 1,
0.268296, 0.07651668, 1.641474, 0, 0.2784314, 1, 1,
0.272821, 0.3072703, 0.5053433, 0, 0.2745098, 1, 1,
0.2764646, -0.8558631, 0.6650677, 0, 0.2666667, 1, 1,
0.2771784, 1.442507, -1.133754, 0, 0.2627451, 1, 1,
0.2839241, -1.18825, 1.317878, 0, 0.254902, 1, 1,
0.2857754, -0.4182009, 3.378713, 0, 0.2509804, 1, 1,
0.2873778, -1.474415, 3.321674, 0, 0.2431373, 1, 1,
0.290242, 0.3664486, 0.9577007, 0, 0.2392157, 1, 1,
0.2914394, 0.2445134, -0.4010482, 0, 0.2313726, 1, 1,
0.2920572, -1.641285, 2.643028, 0, 0.227451, 1, 1,
0.292247, -0.2499096, 1.584558, 0, 0.2196078, 1, 1,
0.2928151, 0.1286004, 1.322026, 0, 0.2156863, 1, 1,
0.2972018, 0.6271549, 0.2051096, 0, 0.2078431, 1, 1,
0.3022675, -0.3327967, 2.445596, 0, 0.2039216, 1, 1,
0.3027952, -0.1819226, 1.801573, 0, 0.1960784, 1, 1,
0.3043723, 1.59093, -0.3418405, 0, 0.1882353, 1, 1,
0.3046293, -0.7606916, 3.44507, 0, 0.1843137, 1, 1,
0.3164653, 0.02749888, 2.56152, 0, 0.1764706, 1, 1,
0.3172003, 1.035486, -1.099844, 0, 0.172549, 1, 1,
0.3198147, -1.138707, 2.770379, 0, 0.1647059, 1, 1,
0.3205511, 0.7040125, 0.1236512, 0, 0.1607843, 1, 1,
0.3217289, 0.7346449, 0.3180529, 0, 0.1529412, 1, 1,
0.3227686, -1.42183, 3.564077, 0, 0.1490196, 1, 1,
0.3231498, -0.374449, 3.060396, 0, 0.1411765, 1, 1,
0.327634, 0.905193, -0.1456807, 0, 0.1372549, 1, 1,
0.3284689, -0.6079174, 2.613614, 0, 0.1294118, 1, 1,
0.3309845, 0.7804184, 1.223357, 0, 0.1254902, 1, 1,
0.3316909, -0.1164543, 3.544767, 0, 0.1176471, 1, 1,
0.3317844, -0.1944119, 2.317497, 0, 0.1137255, 1, 1,
0.3319419, 0.9994521, -1.307451, 0, 0.1058824, 1, 1,
0.3383841, 0.3251201, 0.6957644, 0, 0.09803922, 1, 1,
0.3407509, 0.3486483, 2.064331, 0, 0.09411765, 1, 1,
0.3409839, 0.3600898, 0.2432893, 0, 0.08627451, 1, 1,
0.347006, -0.8495818, 2.578319, 0, 0.08235294, 1, 1,
0.3506387, 1.924141, 0.8527929, 0, 0.07450981, 1, 1,
0.3555751, 1.476061, -0.0940036, 0, 0.07058824, 1, 1,
0.3583525, 0.5048987, 2.231936, 0, 0.0627451, 1, 1,
0.3599458, -0.9683237, 4.331031, 0, 0.05882353, 1, 1,
0.3606912, 1.162067, 1.026965, 0, 0.05098039, 1, 1,
0.3607768, 1.695959, 0.6930733, 0, 0.04705882, 1, 1,
0.3618144, -0.7899911, 3.248695, 0, 0.03921569, 1, 1,
0.3653586, -0.9914384, 2.696568, 0, 0.03529412, 1, 1,
0.3707023, 1.582878, 0.2386679, 0, 0.02745098, 1, 1,
0.3763793, -0.1984334, 3.590162, 0, 0.02352941, 1, 1,
0.3856524, 0.709228, 1.664249, 0, 0.01568628, 1, 1,
0.3870602, 1.228806, 0.9410815, 0, 0.01176471, 1, 1,
0.3888795, -0.1036636, 1.849836, 0, 0.003921569, 1, 1,
0.4026353, -0.0400418, 2.423534, 0.003921569, 0, 1, 1,
0.4028453, 0.4912647, 0.6872957, 0.007843138, 0, 1, 1,
0.4088123, -1.503098, 1.941665, 0.01568628, 0, 1, 1,
0.4111987, -0.1401508, 3.475894, 0.01960784, 0, 1, 1,
0.4113738, 0.8395651, 1.371211, 0.02745098, 0, 1, 1,
0.4173622, 0.3481366, 1.510262, 0.03137255, 0, 1, 1,
0.4187893, 0.8022157, 0.0504592, 0.03921569, 0, 1, 1,
0.419126, -0.04781736, 3.894821, 0.04313726, 0, 1, 1,
0.4278789, 0.5201611, 0.1329312, 0.05098039, 0, 1, 1,
0.4284068, -0.6832393, 3.208039, 0.05490196, 0, 1, 1,
0.4424376, -0.08334997, 2.42991, 0.0627451, 0, 1, 1,
0.4425825, 0.4950381, 1.373659, 0.06666667, 0, 1, 1,
0.4440082, -0.374423, 0.3755273, 0.07450981, 0, 1, 1,
0.4448705, -0.5625562, 1.536876, 0.07843138, 0, 1, 1,
0.4469866, -1.283661, 0.0160417, 0.08627451, 0, 1, 1,
0.4494326, -0.1121828, 2.400283, 0.09019608, 0, 1, 1,
0.4505831, -0.5063121, 2.223284, 0.09803922, 0, 1, 1,
0.4538653, -0.507378, 2.666353, 0.1058824, 0, 1, 1,
0.45712, 1.144267, 0.3500229, 0.1098039, 0, 1, 1,
0.4675751, 0.03975817, 3.233671, 0.1176471, 0, 1, 1,
0.4681737, -0.2975788, 1.47662, 0.1215686, 0, 1, 1,
0.4693564, -1.542665, 2.796334, 0.1294118, 0, 1, 1,
0.4738637, -1.388128, 2.05391, 0.1333333, 0, 1, 1,
0.4742225, -0.7469476, 2.132933, 0.1411765, 0, 1, 1,
0.4743483, -2.289848, 2.348534, 0.145098, 0, 1, 1,
0.4743959, -0.8651173, 3.241178, 0.1529412, 0, 1, 1,
0.4779784, 0.2422874, 0.8920308, 0.1568628, 0, 1, 1,
0.4784788, 0.05418323, 1.258641, 0.1647059, 0, 1, 1,
0.484344, -0.5690442, 2.952149, 0.1686275, 0, 1, 1,
0.4867722, 1.274237, 2.265221, 0.1764706, 0, 1, 1,
0.4922194, 0.3448814, 0.5141363, 0.1803922, 0, 1, 1,
0.4925886, 0.03796111, 1.142534, 0.1882353, 0, 1, 1,
0.4930311, 0.4934737, 0.2285001, 0.1921569, 0, 1, 1,
0.4965905, -0.2229941, 1.75379, 0.2, 0, 1, 1,
0.4972327, -0.5698619, 2.992463, 0.2078431, 0, 1, 1,
0.4978739, 0.6650753, 0.1682954, 0.2117647, 0, 1, 1,
0.4997083, -0.099241, 2.029193, 0.2196078, 0, 1, 1,
0.5016228, -0.336639, 3.751215, 0.2235294, 0, 1, 1,
0.5021682, -0.4731465, 3.462893, 0.2313726, 0, 1, 1,
0.5028092, -0.209669, 1.698577, 0.2352941, 0, 1, 1,
0.5029503, -1.167302, 1.469089, 0.2431373, 0, 1, 1,
0.5037957, -0.9622107, 1.745895, 0.2470588, 0, 1, 1,
0.5055025, -0.2629705, 0.5822706, 0.254902, 0, 1, 1,
0.5084053, 0.3798209, -0.1300755, 0.2588235, 0, 1, 1,
0.5152576, 0.6037219, 0.8015156, 0.2666667, 0, 1, 1,
0.5152869, -0.6683362, 2.649225, 0.2705882, 0, 1, 1,
0.5207481, -1.103247, 2.262991, 0.2784314, 0, 1, 1,
0.5210149, -0.6582068, 2.236899, 0.282353, 0, 1, 1,
0.5220886, -0.09618472, 1.622416, 0.2901961, 0, 1, 1,
0.5224429, -0.5266585, 3.122868, 0.2941177, 0, 1, 1,
0.5227391, 1.767241, 1.335285, 0.3019608, 0, 1, 1,
0.5287368, 0.2333503, 1.786834, 0.3098039, 0, 1, 1,
0.5287557, 1.429791, 2.247792, 0.3137255, 0, 1, 1,
0.5293611, -0.2090353, 3.319334, 0.3215686, 0, 1, 1,
0.5312545, 0.83434, -1.954246, 0.3254902, 0, 1, 1,
0.5464411, 1.714631, 1.184124, 0.3333333, 0, 1, 1,
0.5478522, 1.933816, -0.8830788, 0.3372549, 0, 1, 1,
0.55141, 1.218627, 1.157717, 0.345098, 0, 1, 1,
0.5521573, 0.3824795, 1.039836, 0.3490196, 0, 1, 1,
0.5560207, 0.4122508, 1.187829, 0.3568628, 0, 1, 1,
0.5584585, -0.07422534, 1.000865, 0.3607843, 0, 1, 1,
0.5585146, 0.3937572, 0.7793317, 0.3686275, 0, 1, 1,
0.56016, -0.04841666, 2.350973, 0.372549, 0, 1, 1,
0.5614197, -0.4881619, 3.177671, 0.3803922, 0, 1, 1,
0.5652276, 0.7053418, 1.388072, 0.3843137, 0, 1, 1,
0.5677591, -0.3385329, 2.509804, 0.3921569, 0, 1, 1,
0.5695983, 0.427143, 0.7248941, 0.3960784, 0, 1, 1,
0.5709721, 0.5117043, 2.414795, 0.4039216, 0, 1, 1,
0.5721524, 1.567266, -1.473439, 0.4117647, 0, 1, 1,
0.5725974, 0.7056554, 1.340278, 0.4156863, 0, 1, 1,
0.5791516, -1.260674, 2.90187, 0.4235294, 0, 1, 1,
0.5852602, -0.3973745, 0.8227713, 0.427451, 0, 1, 1,
0.5853799, -0.277296, 2.562442, 0.4352941, 0, 1, 1,
0.5918478, -0.7850799, 2.646661, 0.4392157, 0, 1, 1,
0.5924668, -0.4353543, 1.727714, 0.4470588, 0, 1, 1,
0.5950373, 0.2358265, -1.660471, 0.4509804, 0, 1, 1,
0.6008817, -0.445522, 2.753445, 0.4588235, 0, 1, 1,
0.6030902, -0.7211158, 3.359411, 0.4627451, 0, 1, 1,
0.6080911, 0.1159956, 0.9955084, 0.4705882, 0, 1, 1,
0.6118008, -0.4078489, 1.203341, 0.4745098, 0, 1, 1,
0.6147513, -1.211697, 2.556789, 0.4823529, 0, 1, 1,
0.6212888, 0.1276585, 1.511386, 0.4862745, 0, 1, 1,
0.6216962, -1.237371, 2.00946, 0.4941176, 0, 1, 1,
0.6225467, -0.1140688, 1.788042, 0.5019608, 0, 1, 1,
0.6228952, 0.9555533, -0.09622481, 0.5058824, 0, 1, 1,
0.625441, -0.9681706, 1.959344, 0.5137255, 0, 1, 1,
0.6257904, 0.08000806, 2.388221, 0.5176471, 0, 1, 1,
0.6278256, -0.01997185, 2.981769, 0.5254902, 0, 1, 1,
0.6288238, 0.5565836, 0.3809521, 0.5294118, 0, 1, 1,
0.6333981, -0.5771384, 3.04084, 0.5372549, 0, 1, 1,
0.634202, -0.2184474, 2.304191, 0.5411765, 0, 1, 1,
0.638877, 1.089731, 0.2992113, 0.5490196, 0, 1, 1,
0.6420329, -0.4210433, 2.883234, 0.5529412, 0, 1, 1,
0.644532, -0.9327337, 1.647484, 0.5607843, 0, 1, 1,
0.6482245, 2.13233, -0.7450995, 0.5647059, 0, 1, 1,
0.6492129, -0.8151035, 2.738549, 0.572549, 0, 1, 1,
0.6503075, 2.568197, 0.2763482, 0.5764706, 0, 1, 1,
0.6507226, 1.224178, 0.8748364, 0.5843138, 0, 1, 1,
0.6513391, 1.177904, 0.2945628, 0.5882353, 0, 1, 1,
0.6573634, -0.9212039, 2.768853, 0.5960785, 0, 1, 1,
0.6591051, 0.2957581, 0.9372147, 0.6039216, 0, 1, 1,
0.6621898, -1.032897, 3.512987, 0.6078432, 0, 1, 1,
0.6642088, -1.69264, 2.318692, 0.6156863, 0, 1, 1,
0.664911, 0.2269732, 1.851173, 0.6196079, 0, 1, 1,
0.6787579, 0.3436367, 1.795995, 0.627451, 0, 1, 1,
0.6800211, 0.7581181, 2.142034, 0.6313726, 0, 1, 1,
0.6860713, 1.245593, 0.8712509, 0.6392157, 0, 1, 1,
0.6880417, -2.232172, 2.435499, 0.6431373, 0, 1, 1,
0.688338, -1.597399, 2.405945, 0.6509804, 0, 1, 1,
0.6972263, 0.9482086, 2.086021, 0.654902, 0, 1, 1,
0.6975207, 0.6762065, 0.1096118, 0.6627451, 0, 1, 1,
0.7050655, 0.08555032, 0.65475, 0.6666667, 0, 1, 1,
0.7070353, 0.2631119, 2.010763, 0.6745098, 0, 1, 1,
0.7084765, 1.217488, 0.2271437, 0.6784314, 0, 1, 1,
0.7086376, 1.067242, 2.804058, 0.6862745, 0, 1, 1,
0.7145618, 0.06868091, 1.540215, 0.6901961, 0, 1, 1,
0.7154543, -0.9483898, 1.495652, 0.6980392, 0, 1, 1,
0.7174514, -0.6640926, 1.199947, 0.7058824, 0, 1, 1,
0.7175773, -0.02625537, 0.7897052, 0.7098039, 0, 1, 1,
0.7179183, -0.1079951, 1.801894, 0.7176471, 0, 1, 1,
0.7197909, -2.021925, 2.72661, 0.7215686, 0, 1, 1,
0.7200058, -0.2941669, 0.9039294, 0.7294118, 0, 1, 1,
0.7262694, 0.3620493, -0.1606279, 0.7333333, 0, 1, 1,
0.7353112, -0.02180989, 2.953979, 0.7411765, 0, 1, 1,
0.7372341, 0.3370058, 1.473723, 0.7450981, 0, 1, 1,
0.7373416, 1.066846, 0.6919214, 0.7529412, 0, 1, 1,
0.7418473, -0.567852, 3.142595, 0.7568628, 0, 1, 1,
0.7500176, -0.548679, 2.144151, 0.7647059, 0, 1, 1,
0.756439, 0.5243474, 1.122617, 0.7686275, 0, 1, 1,
0.7584332, 1.040475, 1.926512, 0.7764706, 0, 1, 1,
0.7598733, -0.197523, 1.450261, 0.7803922, 0, 1, 1,
0.7600145, 1.532879, 1.362246, 0.7882353, 0, 1, 1,
0.7634109, -0.3159599, 1.082168, 0.7921569, 0, 1, 1,
0.7643166, 0.09872302, 0.157436, 0.8, 0, 1, 1,
0.7645919, -0.7154042, 1.822558, 0.8078431, 0, 1, 1,
0.772577, 1.319006, 1.045568, 0.8117647, 0, 1, 1,
0.7732478, 1.123316, 0.9277073, 0.8196079, 0, 1, 1,
0.7764247, -1.166262, 2.566344, 0.8235294, 0, 1, 1,
0.7782964, -1.132692, 0.6308742, 0.8313726, 0, 1, 1,
0.7829988, -0.9613424, 2.309278, 0.8352941, 0, 1, 1,
0.7917084, 0.3126844, 1.652398, 0.8431373, 0, 1, 1,
0.791721, 0.4697884, 1.629582, 0.8470588, 0, 1, 1,
0.7995847, 0.1208889, 1.362832, 0.854902, 0, 1, 1,
0.800205, -0.5605493, 2.189797, 0.8588235, 0, 1, 1,
0.8023766, 0.09458287, 1.46671, 0.8666667, 0, 1, 1,
0.8034365, -2.232048, 4.319939, 0.8705882, 0, 1, 1,
0.8049334, 1.024496, 0.5209247, 0.8784314, 0, 1, 1,
0.8089715, 0.5531037, 1.228234, 0.8823529, 0, 1, 1,
0.8092722, -1.735997, 2.91804, 0.8901961, 0, 1, 1,
0.8183903, 0.329942, 0.2052985, 0.8941177, 0, 1, 1,
0.8242239, 0.2763145, 0.6879492, 0.9019608, 0, 1, 1,
0.827266, -0.8813341, 2.82147, 0.9098039, 0, 1, 1,
0.8326336, 0.3959929, -0.7146249, 0.9137255, 0, 1, 1,
0.8354011, -0.4101317, 1.798168, 0.9215686, 0, 1, 1,
0.8392681, 1.61808, 0.5599028, 0.9254902, 0, 1, 1,
0.8400977, -0.1773625, 1.482085, 0.9333333, 0, 1, 1,
0.8448048, 0.8689384, 0.3039207, 0.9372549, 0, 1, 1,
0.8526047, 1.505257, -1.078821, 0.945098, 0, 1, 1,
0.8529392, 1.339256, 0.7399448, 0.9490196, 0, 1, 1,
0.8559467, 0.5975453, 0.4963854, 0.9568627, 0, 1, 1,
0.8591418, 0.3151437, 1.612836, 0.9607843, 0, 1, 1,
0.8760822, -0.4135182, 2.013798, 0.9686275, 0, 1, 1,
0.8772942, -0.9721538, 3.1401, 0.972549, 0, 1, 1,
0.8795226, -0.1635698, 2.176476, 0.9803922, 0, 1, 1,
0.8799753, -0.2739309, 2.185237, 0.9843137, 0, 1, 1,
0.8834299, -1.376705, 3.374037, 0.9921569, 0, 1, 1,
0.8845111, -1.986227, 1.750834, 0.9960784, 0, 1, 1,
0.8893936, 0.09426533, 1.759537, 1, 0, 0.9960784, 1,
0.8905661, -1.117989, 3.176776, 1, 0, 0.9882353, 1,
0.8948236, -0.8037021, 1.477229, 1, 0, 0.9843137, 1,
0.9044192, 0.1158818, 1.863734, 1, 0, 0.9764706, 1,
0.9118797, -0.9018199, 3.791858, 1, 0, 0.972549, 1,
0.9277647, -0.7546163, 1.952047, 1, 0, 0.9647059, 1,
0.9320868, -1.500338, 4.15211, 1, 0, 0.9607843, 1,
0.9328874, -0.6956888, 2.514276, 1, 0, 0.9529412, 1,
0.9339511, 1.643365, 0.9383968, 1, 0, 0.9490196, 1,
0.9352539, -0.9505222, 1.72965, 1, 0, 0.9411765, 1,
0.9423873, 0.2802762, 0.8393024, 1, 0, 0.9372549, 1,
0.9594584, 1.003314, -0.5870839, 1, 0, 0.9294118, 1,
0.9661392, -1.3918, 1.497228, 1, 0, 0.9254902, 1,
0.967781, -0.1175711, 1.737436, 1, 0, 0.9176471, 1,
0.977909, 1.710402, -0.1080537, 1, 0, 0.9137255, 1,
0.9900185, -3.019519, 3.520013, 1, 0, 0.9058824, 1,
0.9918462, -0.4103628, 2.492564, 1, 0, 0.9019608, 1,
1.008802, -1.115693, 3.367927, 1, 0, 0.8941177, 1,
1.011607, 0.6568329, 0.9363254, 1, 0, 0.8862745, 1,
1.018139, 1.807193, 1.365459, 1, 0, 0.8823529, 1,
1.024551, 0.817588, 1.249016, 1, 0, 0.8745098, 1,
1.025184, -0.7886066, 1.840908, 1, 0, 0.8705882, 1,
1.027887, -0.5247393, 1.557911, 1, 0, 0.8627451, 1,
1.045507, 0.6607722, 1.180281, 1, 0, 0.8588235, 1,
1.050187, -1.251766, 0.8344895, 1, 0, 0.8509804, 1,
1.050561, 1.814543, 0.8421288, 1, 0, 0.8470588, 1,
1.05063, 0.6800774, -0.05967028, 1, 0, 0.8392157, 1,
1.051938, -0.1564414, 1.85112, 1, 0, 0.8352941, 1,
1.058285, -0.0512233, 2.511822, 1, 0, 0.827451, 1,
1.059443, 0.8377445, 1.399121, 1, 0, 0.8235294, 1,
1.059756, -0.2006289, 3.047753, 1, 0, 0.8156863, 1,
1.0632, -0.07144199, 1.36166, 1, 0, 0.8117647, 1,
1.066378, -0.2714493, 1.476011, 1, 0, 0.8039216, 1,
1.068444, -1.417693, 1.454484, 1, 0, 0.7960784, 1,
1.076835, -0.2912219, 1.374931, 1, 0, 0.7921569, 1,
1.082518, -1.479433, 0.2755236, 1, 0, 0.7843137, 1,
1.104621, 0.4170968, 2.296472, 1, 0, 0.7803922, 1,
1.115145, 0.6392242, 3.151618, 1, 0, 0.772549, 1,
1.116787, -0.3355432, 1.151122, 1, 0, 0.7686275, 1,
1.126578, 0.3779921, 1.019174, 1, 0, 0.7607843, 1,
1.131539, -0.2888365, 1.589778, 1, 0, 0.7568628, 1,
1.133082, 1.247652, 1.019614, 1, 0, 0.7490196, 1,
1.13573, -0.112904, 3.451916, 1, 0, 0.7450981, 1,
1.138433, 1.471347, 2.552464, 1, 0, 0.7372549, 1,
1.147838, -0.7009702, 3.534914, 1, 0, 0.7333333, 1,
1.154649, -0.455717, 2.757833, 1, 0, 0.7254902, 1,
1.158698, 0.3271826, 1.289168, 1, 0, 0.7215686, 1,
1.159662, -0.2311808, 3.24314, 1, 0, 0.7137255, 1,
1.166431, 1.157027, -0.004991095, 1, 0, 0.7098039, 1,
1.168336, 0.09138579, 1.645687, 1, 0, 0.7019608, 1,
1.169345, 0.5340943, 0.9722292, 1, 0, 0.6941177, 1,
1.174041, -0.4182603, 1.837974, 1, 0, 0.6901961, 1,
1.178489, 0.4638146, 0.5157419, 1, 0, 0.682353, 1,
1.179008, 0.2941085, 2.350691, 1, 0, 0.6784314, 1,
1.184113, 0.03529685, 2.721527, 1, 0, 0.6705883, 1,
1.186661, -0.4922411, 1.261913, 1, 0, 0.6666667, 1,
1.189018, 0.3085215, 2.426358, 1, 0, 0.6588235, 1,
1.189804, -1.492278, 3.201903, 1, 0, 0.654902, 1,
1.222384, -1.451617, 3.768847, 1, 0, 0.6470588, 1,
1.224825, -1.23487, 1.702535, 1, 0, 0.6431373, 1,
1.226797, 0.7442827, -0.5034587, 1, 0, 0.6352941, 1,
1.231532, -0.2833994, 1.256178, 1, 0, 0.6313726, 1,
1.23485, 1.298007, 1.255666, 1, 0, 0.6235294, 1,
1.241746, -1.332212, 1.713874, 1, 0, 0.6196079, 1,
1.247051, -0.9247319, 2.58843, 1, 0, 0.6117647, 1,
1.268497, 0.4570894, 0.2564856, 1, 0, 0.6078432, 1,
1.271701, 0.6017858, 1.316603, 1, 0, 0.6, 1,
1.273323, -1.606522, 4.416428, 1, 0, 0.5921569, 1,
1.274263, 0.1741433, 1.875722, 1, 0, 0.5882353, 1,
1.278093, 0.366983, 1.370407, 1, 0, 0.5803922, 1,
1.283361, -0.2197327, 2.33106, 1, 0, 0.5764706, 1,
1.284164, 2.121258, -0.2394343, 1, 0, 0.5686275, 1,
1.286034, -1.068013, 2.327848, 1, 0, 0.5647059, 1,
1.286482, -0.4300874, 3.219533, 1, 0, 0.5568628, 1,
1.298803, 0.2668919, 0.5304068, 1, 0, 0.5529412, 1,
1.309106, 1.861701, 1.00797, 1, 0, 0.5450981, 1,
1.313623, 1.244777, 2.211125, 1, 0, 0.5411765, 1,
1.315123, 0.3138168, 0.6599898, 1, 0, 0.5333334, 1,
1.315936, -1.471555, 1.674961, 1, 0, 0.5294118, 1,
1.32002, -0.04619818, 3.394215, 1, 0, 0.5215687, 1,
1.322048, 2.138044, 2.056859, 1, 0, 0.5176471, 1,
1.326852, -1.214079, 3.142507, 1, 0, 0.509804, 1,
1.331988, -1.024834, 2.30853, 1, 0, 0.5058824, 1,
1.338306, 1.170321, 1.734709, 1, 0, 0.4980392, 1,
1.343148, 1.836675, 0.0747195, 1, 0, 0.4901961, 1,
1.348395, 0.165609, 1.148551, 1, 0, 0.4862745, 1,
1.359116, -1.317478, 0.5691181, 1, 0, 0.4784314, 1,
1.361525, 0.3620235, 3.283386, 1, 0, 0.4745098, 1,
1.380816, 0.5797793, 0.8334957, 1, 0, 0.4666667, 1,
1.383768, 0.8413066, -0.8358623, 1, 0, 0.4627451, 1,
1.386711, -0.3873053, 0.8611735, 1, 0, 0.454902, 1,
1.390042, 0.6151071, 1.294316, 1, 0, 0.4509804, 1,
1.391162, -1.061804, 1.837445, 1, 0, 0.4431373, 1,
1.392215, 0.04944647, -0.1291583, 1, 0, 0.4392157, 1,
1.394304, 0.4919832, 1.691783, 1, 0, 0.4313726, 1,
1.39495, 1.312581, -0.6272039, 1, 0, 0.427451, 1,
1.398557, 0.4176013, 0.7695606, 1, 0, 0.4196078, 1,
1.407299, 1.624665, 0.09035143, 1, 0, 0.4156863, 1,
1.413013, -0.06048241, 2.08625, 1, 0, 0.4078431, 1,
1.431191, -2.237397, 2.952996, 1, 0, 0.4039216, 1,
1.432667, 0.6431699, 0.2804371, 1, 0, 0.3960784, 1,
1.437455, -0.1689975, 1.536167, 1, 0, 0.3882353, 1,
1.439408, 1.827453, 0.6715879, 1, 0, 0.3843137, 1,
1.457591, 0.040247, 1.226099, 1, 0, 0.3764706, 1,
1.466795, 0.2331207, 2.382104, 1, 0, 0.372549, 1,
1.480782, 1.601056, -0.2811063, 1, 0, 0.3647059, 1,
1.492306, 1.188045, 3.325686, 1, 0, 0.3607843, 1,
1.497393, 0.5955077, 2.246148, 1, 0, 0.3529412, 1,
1.500349, -0.3062643, 0.4480204, 1, 0, 0.3490196, 1,
1.511437, -0.9400545, 3.09624, 1, 0, 0.3411765, 1,
1.520405, 0.9794049, 1.264356, 1, 0, 0.3372549, 1,
1.522603, 1.379127, 1.684259, 1, 0, 0.3294118, 1,
1.52525, 1.187582, 0.2885515, 1, 0, 0.3254902, 1,
1.537738, 0.6698048, 3.007627, 1, 0, 0.3176471, 1,
1.544061, 0.4169718, 1.83475, 1, 0, 0.3137255, 1,
1.544788, -0.7307763, 3.404209, 1, 0, 0.3058824, 1,
1.55445, -1.623093, 2.910883, 1, 0, 0.2980392, 1,
1.556184, 1.052497, 2.347872, 1, 0, 0.2941177, 1,
1.560639, -1.151398, -0.8075574, 1, 0, 0.2862745, 1,
1.569755, 0.2174405, 3.250901, 1, 0, 0.282353, 1,
1.578535, 0.1482831, 1.340913, 1, 0, 0.2745098, 1,
1.583085, -1.530573, 0.8331708, 1, 0, 0.2705882, 1,
1.599181, 0.6264572, 0.1371352, 1, 0, 0.2627451, 1,
1.608403, 0.9132764, 0.217711, 1, 0, 0.2588235, 1,
1.621326, -1.871733, 1.16814, 1, 0, 0.2509804, 1,
1.648761, -0.9493775, 1.606996, 1, 0, 0.2470588, 1,
1.651102, -0.5894497, 0.3018023, 1, 0, 0.2392157, 1,
1.659954, 0.08999909, 1.70289, 1, 0, 0.2352941, 1,
1.682455, 1.472701, 1.48032, 1, 0, 0.227451, 1,
1.689867, 1.058006, 0.5637498, 1, 0, 0.2235294, 1,
1.717235, 0.08947811, 1.957484, 1, 0, 0.2156863, 1,
1.731007, -1.021482, 0.7988992, 1, 0, 0.2117647, 1,
1.743074, 1.708359, -0.8754009, 1, 0, 0.2039216, 1,
1.754563, -1.404193, 2.557597, 1, 0, 0.1960784, 1,
1.767845, -0.05165321, 0.649554, 1, 0, 0.1921569, 1,
1.801525, 0.7286445, 2.408513, 1, 0, 0.1843137, 1,
1.852146, 0.3727766, 1.109673, 1, 0, 0.1803922, 1,
1.859245, 1.497129, -0.6909595, 1, 0, 0.172549, 1,
1.901257, 0.04767463, 2.024874, 1, 0, 0.1686275, 1,
1.905835, 0.5559241, -0.1030957, 1, 0, 0.1607843, 1,
1.920461, 0.07415218, 1.814576, 1, 0, 0.1568628, 1,
1.932844, -0.2585533, 2.534331, 1, 0, 0.1490196, 1,
1.933355, -0.2728136, 0.8312454, 1, 0, 0.145098, 1,
1.943622, 1.752988, -0.8473916, 1, 0, 0.1372549, 1,
1.957703, 1.818012, -0.001730107, 1, 0, 0.1333333, 1,
2.027323, -1.369537, 3.828851, 1, 0, 0.1254902, 1,
2.028813, 0.3438898, 0.5615627, 1, 0, 0.1215686, 1,
2.072329, 0.4173771, 2.332293, 1, 0, 0.1137255, 1,
2.104853, 0.3483888, 1.126346, 1, 0, 0.1098039, 1,
2.164465, 0.559521, 0.4599271, 1, 0, 0.1019608, 1,
2.185621, 0.9251094, -0.575303, 1, 0, 0.09411765, 1,
2.194991, 0.8830858, 0.9559289, 1, 0, 0.09019608, 1,
2.228979, 2.063317, 0.854881, 1, 0, 0.08235294, 1,
2.230319, 0.8751979, 1.573019, 1, 0, 0.07843138, 1,
2.306898, -0.9252735, 1.682404, 1, 0, 0.07058824, 1,
2.311987, -1.196333, 1.831691, 1, 0, 0.06666667, 1,
2.346022, 0.1020605, 2.385072, 1, 0, 0.05882353, 1,
2.366287, -0.4423774, 1.675403, 1, 0, 0.05490196, 1,
2.373783, -2.056631, 2.358893, 1, 0, 0.04705882, 1,
2.397403, -2.301175, 2.843366, 1, 0, 0.04313726, 1,
2.513833, -0.07517429, 0.4638263, 1, 0, 0.03529412, 1,
2.520636, -1.680446, 2.987769, 1, 0, 0.03137255, 1,
2.797662, 0.4591937, 2.349064, 1, 0, 0.02352941, 1,
2.933264, -0.9978457, 2.198984, 1, 0, 0.01960784, 1,
3.114274, -1.084207, 2.3368, 1, 0, 0.01176471, 1,
3.149391, 1.01123, 2.198127, 1, 0, 0.007843138, 1
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
-0.339656, -4.025734, -6.428337, 0, -0.5, 0.5, 0.5,
-0.339656, -4.025734, -6.428337, 1, -0.5, 0.5, 0.5,
-0.339656, -4.025734, -6.428337, 1, 1.5, 0.5, 0.5,
-0.339656, -4.025734, -6.428337, 0, 1.5, 0.5, 0.5
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
-5.011489, -0.051332, -6.428337, 0, -0.5, 0.5, 0.5,
-5.011489, -0.051332, -6.428337, 1, -0.5, 0.5, 0.5,
-5.011489, -0.051332, -6.428337, 1, 1.5, 0.5, 0.5,
-5.011489, -0.051332, -6.428337, 0, 1.5, 0.5, 0.5
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
-5.011489, -4.025734, 0.02487707, 0, -0.5, 0.5, 0.5,
-5.011489, -4.025734, 0.02487707, 1, -0.5, 0.5, 0.5,
-5.011489, -4.025734, 0.02487707, 1, 1.5, 0.5, 0.5,
-5.011489, -4.025734, 0.02487707, 0, 1.5, 0.5, 0.5
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
-3, -3.108564, -4.939134,
3, -3.108564, -4.939134,
-3, -3.108564, -4.939134,
-3, -3.261426, -5.187334,
-2, -3.108564, -4.939134,
-2, -3.261426, -5.187334,
-1, -3.108564, -4.939134,
-1, -3.261426, -5.187334,
0, -3.108564, -4.939134,
0, -3.261426, -5.187334,
1, -3.108564, -4.939134,
1, -3.261426, -5.187334,
2, -3.108564, -4.939134,
2, -3.261426, -5.187334,
3, -3.108564, -4.939134,
3, -3.261426, -5.187334
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
-3, -3.567149, -5.683735, 0, -0.5, 0.5, 0.5,
-3, -3.567149, -5.683735, 1, -0.5, 0.5, 0.5,
-3, -3.567149, -5.683735, 1, 1.5, 0.5, 0.5,
-3, -3.567149, -5.683735, 0, 1.5, 0.5, 0.5,
-2, -3.567149, -5.683735, 0, -0.5, 0.5, 0.5,
-2, -3.567149, -5.683735, 1, -0.5, 0.5, 0.5,
-2, -3.567149, -5.683735, 1, 1.5, 0.5, 0.5,
-2, -3.567149, -5.683735, 0, 1.5, 0.5, 0.5,
-1, -3.567149, -5.683735, 0, -0.5, 0.5, 0.5,
-1, -3.567149, -5.683735, 1, -0.5, 0.5, 0.5,
-1, -3.567149, -5.683735, 1, 1.5, 0.5, 0.5,
-1, -3.567149, -5.683735, 0, 1.5, 0.5, 0.5,
0, -3.567149, -5.683735, 0, -0.5, 0.5, 0.5,
0, -3.567149, -5.683735, 1, -0.5, 0.5, 0.5,
0, -3.567149, -5.683735, 1, 1.5, 0.5, 0.5,
0, -3.567149, -5.683735, 0, 1.5, 0.5, 0.5,
1, -3.567149, -5.683735, 0, -0.5, 0.5, 0.5,
1, -3.567149, -5.683735, 1, -0.5, 0.5, 0.5,
1, -3.567149, -5.683735, 1, 1.5, 0.5, 0.5,
1, -3.567149, -5.683735, 0, 1.5, 0.5, 0.5,
2, -3.567149, -5.683735, 0, -0.5, 0.5, 0.5,
2, -3.567149, -5.683735, 1, -0.5, 0.5, 0.5,
2, -3.567149, -5.683735, 1, 1.5, 0.5, 0.5,
2, -3.567149, -5.683735, 0, 1.5, 0.5, 0.5,
3, -3.567149, -5.683735, 0, -0.5, 0.5, 0.5,
3, -3.567149, -5.683735, 1, -0.5, 0.5, 0.5,
3, -3.567149, -5.683735, 1, 1.5, 0.5, 0.5,
3, -3.567149, -5.683735, 0, 1.5, 0.5, 0.5
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
-3.933374, -3, -4.939134,
-3.933374, 2, -4.939134,
-3.933374, -3, -4.939134,
-4.11306, -3, -5.187334,
-3.933374, -2, -4.939134,
-4.11306, -2, -5.187334,
-3.933374, -1, -4.939134,
-4.11306, -1, -5.187334,
-3.933374, 0, -4.939134,
-4.11306, 0, -5.187334,
-3.933374, 1, -4.939134,
-4.11306, 1, -5.187334,
-3.933374, 2, -4.939134,
-4.11306, 2, -5.187334
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
-4.472432, -3, -5.683735, 0, -0.5, 0.5, 0.5,
-4.472432, -3, -5.683735, 1, -0.5, 0.5, 0.5,
-4.472432, -3, -5.683735, 1, 1.5, 0.5, 0.5,
-4.472432, -3, -5.683735, 0, 1.5, 0.5, 0.5,
-4.472432, -2, -5.683735, 0, -0.5, 0.5, 0.5,
-4.472432, -2, -5.683735, 1, -0.5, 0.5, 0.5,
-4.472432, -2, -5.683735, 1, 1.5, 0.5, 0.5,
-4.472432, -2, -5.683735, 0, 1.5, 0.5, 0.5,
-4.472432, -1, -5.683735, 0, -0.5, 0.5, 0.5,
-4.472432, -1, -5.683735, 1, -0.5, 0.5, 0.5,
-4.472432, -1, -5.683735, 1, 1.5, 0.5, 0.5,
-4.472432, -1, -5.683735, 0, 1.5, 0.5, 0.5,
-4.472432, 0, -5.683735, 0, -0.5, 0.5, 0.5,
-4.472432, 0, -5.683735, 1, -0.5, 0.5, 0.5,
-4.472432, 0, -5.683735, 1, 1.5, 0.5, 0.5,
-4.472432, 0, -5.683735, 0, 1.5, 0.5, 0.5,
-4.472432, 1, -5.683735, 0, -0.5, 0.5, 0.5,
-4.472432, 1, -5.683735, 1, -0.5, 0.5, 0.5,
-4.472432, 1, -5.683735, 1, 1.5, 0.5, 0.5,
-4.472432, 1, -5.683735, 0, 1.5, 0.5, 0.5,
-4.472432, 2, -5.683735, 0, -0.5, 0.5, 0.5,
-4.472432, 2, -5.683735, 1, -0.5, 0.5, 0.5,
-4.472432, 2, -5.683735, 1, 1.5, 0.5, 0.5,
-4.472432, 2, -5.683735, 0, 1.5, 0.5, 0.5
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
-3.933374, -3.108564, -4,
-3.933374, -3.108564, 4,
-3.933374, -3.108564, -4,
-4.11306, -3.261426, -4,
-3.933374, -3.108564, -2,
-4.11306, -3.261426, -2,
-3.933374, -3.108564, 0,
-4.11306, -3.261426, 0,
-3.933374, -3.108564, 2,
-4.11306, -3.261426, 2,
-3.933374, -3.108564, 4,
-4.11306, -3.261426, 4
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
-4.472432, -3.567149, -4, 0, -0.5, 0.5, 0.5,
-4.472432, -3.567149, -4, 1, -0.5, 0.5, 0.5,
-4.472432, -3.567149, -4, 1, 1.5, 0.5, 0.5,
-4.472432, -3.567149, -4, 0, 1.5, 0.5, 0.5,
-4.472432, -3.567149, -2, 0, -0.5, 0.5, 0.5,
-4.472432, -3.567149, -2, 1, -0.5, 0.5, 0.5,
-4.472432, -3.567149, -2, 1, 1.5, 0.5, 0.5,
-4.472432, -3.567149, -2, 0, 1.5, 0.5, 0.5,
-4.472432, -3.567149, 0, 0, -0.5, 0.5, 0.5,
-4.472432, -3.567149, 0, 1, -0.5, 0.5, 0.5,
-4.472432, -3.567149, 0, 1, 1.5, 0.5, 0.5,
-4.472432, -3.567149, 0, 0, 1.5, 0.5, 0.5,
-4.472432, -3.567149, 2, 0, -0.5, 0.5, 0.5,
-4.472432, -3.567149, 2, 1, -0.5, 0.5, 0.5,
-4.472432, -3.567149, 2, 1, 1.5, 0.5, 0.5,
-4.472432, -3.567149, 2, 0, 1.5, 0.5, 0.5,
-4.472432, -3.567149, 4, 0, -0.5, 0.5, 0.5,
-4.472432, -3.567149, 4, 1, -0.5, 0.5, 0.5,
-4.472432, -3.567149, 4, 1, 1.5, 0.5, 0.5,
-4.472432, -3.567149, 4, 0, 1.5, 0.5, 0.5
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
-3.933374, -3.108564, -4.939134,
-3.933374, 3.0059, -4.939134,
-3.933374, -3.108564, 4.988888,
-3.933374, 3.0059, 4.988888,
-3.933374, -3.108564, -4.939134,
-3.933374, -3.108564, 4.988888,
-3.933374, 3.0059, -4.939134,
-3.933374, 3.0059, 4.988888,
-3.933374, -3.108564, -4.939134,
3.254062, -3.108564, -4.939134,
-3.933374, -3.108564, 4.988888,
3.254062, -3.108564, 4.988888,
-3.933374, 3.0059, -4.939134,
3.254062, 3.0059, -4.939134,
-3.933374, 3.0059, 4.988888,
3.254062, 3.0059, 4.988888,
3.254062, -3.108564, -4.939134,
3.254062, 3.0059, -4.939134,
3.254062, -3.108564, 4.988888,
3.254062, 3.0059, 4.988888,
3.254062, -3.108564, -4.939134,
3.254062, -3.108564, 4.988888,
3.254062, 3.0059, -4.939134,
3.254062, 3.0059, 4.988888
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
var radius = 7.314005;
var distance = 32.54084;
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
mvMatrix.translate( 0.339656, 0.051332, -0.02487707 );
mvMatrix.scale( 1.10026, 1.293334, 0.7965379 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -32.54084);
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
ammonium_sulphamate_<-read.table("ammonium_sulphamate_.xyz", skip=1)
```

```
## Error in read.table("ammonium_sulphamate_.xyz", skip = 1): duplicate 'row.names' are not allowed
```

```r
x<-ammonium_sulphamate_$V2
```

```
## Error in eval(expr, envir, enclos): object 'ammonium_sulphamate_' not found
```

```r
y<-ammonium_sulphamate_$V3
```

```
## Error in eval(expr, envir, enclos): object 'ammonium_sulphamate_' not found
```

```r
z<-ammonium_sulphamate_$V4
```

```
## Error in eval(expr, envir, enclos): object 'ammonium_sulphamate_' not found
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
-3.828703, 1.841208, -0.7283531, 0, 0, 1, 1, 1,
-2.823581, 2.019018, 0.1692755, 1, 0, 0, 1, 1,
-2.823251, -0.01473546, -0.381108, 1, 0, 0, 1, 1,
-2.799528, -0.4376649, -0.2943073, 1, 0, 0, 1, 1,
-2.785022, -0.1793916, -2.399252, 1, 0, 0, 1, 1,
-2.677009, -0.3429534, -2.621423, 1, 0, 0, 1, 1,
-2.660693, 1.336049, 0.2778943, 0, 0, 0, 1, 1,
-2.645546, 0.170845, -0.3898691, 0, 0, 0, 1, 1,
-2.620828, 1.510633, -2.302369, 0, 0, 0, 1, 1,
-2.449145, -0.2598796, -1.296411, 0, 0, 0, 1, 1,
-2.408157, 0.4762472, -1.799372, 0, 0, 0, 1, 1,
-2.350039, -0.5394107, -3.111959, 0, 0, 0, 1, 1,
-2.321514, 1.029039, -2.08027, 0, 0, 0, 1, 1,
-2.29096, 1.155297, -1.740231, 1, 1, 1, 1, 1,
-2.274678, 0.1336906, -1.270977, 1, 1, 1, 1, 1,
-2.248585, -0.2084293, -3.036844, 1, 1, 1, 1, 1,
-2.207634, -0.08247084, -1.623165, 1, 1, 1, 1, 1,
-2.206714, -0.6841145, -1.435853, 1, 1, 1, 1, 1,
-2.17834, 0.1980563, -1.943792, 1, 1, 1, 1, 1,
-2.1308, -0.7030906, -2.676823, 1, 1, 1, 1, 1,
-2.128552, -0.1946355, -0.9730036, 1, 1, 1, 1, 1,
-2.102296, -0.5759133, -1.665621, 1, 1, 1, 1, 1,
-2.078878, -0.3094757, -1.706388, 1, 1, 1, 1, 1,
-2.060921, -0.07333438, -0.6970636, 1, 1, 1, 1, 1,
-2.050876, 1.555917, -1.205609, 1, 1, 1, 1, 1,
-2.045595, 0.285785, -1.036743, 1, 1, 1, 1, 1,
-2.021147, 0.3454139, -1.531267, 1, 1, 1, 1, 1,
-2.00683, 0.2033175, -1.118516, 1, 1, 1, 1, 1,
-1.9922, 0.836167, -1.14994, 0, 0, 1, 1, 1,
-1.939151, 1.070735, -2.067906, 1, 0, 0, 1, 1,
-1.903895, -0.1258956, -1.610868, 1, 0, 0, 1, 1,
-1.894174, 1.488858, 0.404536, 1, 0, 0, 1, 1,
-1.877468, 1.710953, -1.152509, 1, 0, 0, 1, 1,
-1.875242, -0.1663257, -2.101057, 1, 0, 0, 1, 1,
-1.850237, 1.456084, -0.778174, 0, 0, 0, 1, 1,
-1.845501, 0.0573466, -0.495577, 0, 0, 0, 1, 1,
-1.843673, 0.1131229, -0.1919132, 0, 0, 0, 1, 1,
-1.841781, 0.3700629, -1.067696, 0, 0, 0, 1, 1,
-1.826783, -0.1048882, -0.1844266, 0, 0, 0, 1, 1,
-1.799829, 2.521945, -1.115643, 0, 0, 0, 1, 1,
-1.784354, -2.584251, -3.807426, 0, 0, 0, 1, 1,
-1.784014, 0.6316609, -0.6414436, 1, 1, 1, 1, 1,
-1.77856, -0.1569534, -1.384134, 1, 1, 1, 1, 1,
-1.778211, 1.411048, -2.6379, 1, 1, 1, 1, 1,
-1.762074, -1.705671, -1.908057, 1, 1, 1, 1, 1,
-1.745144, -0.3764127, -2.156457, 1, 1, 1, 1, 1,
-1.725678, -1.784821, -1.781527, 1, 1, 1, 1, 1,
-1.71456, 1.714894, -1.581161, 1, 1, 1, 1, 1,
-1.693932, 0.4735756, -2.930995, 1, 1, 1, 1, 1,
-1.683506, -0.6072484, -0.4540673, 1, 1, 1, 1, 1,
-1.673851, 0.8158944, -0.3292027, 1, 1, 1, 1, 1,
-1.672072, 0.241825, -1.376492, 1, 1, 1, 1, 1,
-1.67061, 0.4916061, -0.5114074, 1, 1, 1, 1, 1,
-1.657838, -1.118428, -3.740973, 1, 1, 1, 1, 1,
-1.655028, -0.2619503, -2.057514, 1, 1, 1, 1, 1,
-1.654804, -0.5865788, -2.457703, 1, 1, 1, 1, 1,
-1.643204, -2.054731, -1.8398, 0, 0, 1, 1, 1,
-1.627872, -0.1446052, -1.633441, 1, 0, 0, 1, 1,
-1.623594, -0.09986546, -1.314122, 1, 0, 0, 1, 1,
-1.615062, 0.7214137, -0.6424131, 1, 0, 0, 1, 1,
-1.607514, 0.7391278, -0.842083, 1, 0, 0, 1, 1,
-1.595994, -0.6026568, -4.029245, 1, 0, 0, 1, 1,
-1.57442, -0.7463596, -2.947994, 0, 0, 0, 1, 1,
-1.567491, 1.623263, -1.095188, 0, 0, 0, 1, 1,
-1.561186, 0.1162145, -1.796698, 0, 0, 0, 1, 1,
-1.558455, 0.08186552, -1.232784, 0, 0, 0, 1, 1,
-1.553808, -1.90551, -3.034941, 0, 0, 0, 1, 1,
-1.523014, -0.6436045, -2.237819, 0, 0, 0, 1, 1,
-1.51916, -0.5283217, 0.4434452, 0, 0, 0, 1, 1,
-1.488073, -1.734201, -4.029856, 1, 1, 1, 1, 1,
-1.487847, 1.050024, -1.142361, 1, 1, 1, 1, 1,
-1.484601, 0.5193611, -1.205529, 1, 1, 1, 1, 1,
-1.482626, 0.4164531, 0.561526, 1, 1, 1, 1, 1,
-1.474355, -0.4755689, -0.9257953, 1, 1, 1, 1, 1,
-1.468179, -0.4827299, -1.783221, 1, 1, 1, 1, 1,
-1.467062, 0.8059886, 0.09374352, 1, 1, 1, 1, 1,
-1.465828, -0.4757735, -0.1060429, 1, 1, 1, 1, 1,
-1.465391, -1.042815, -2.6195, 1, 1, 1, 1, 1,
-1.457793, 0.9213342, -0.2723627, 1, 1, 1, 1, 1,
-1.439312, 0.1714245, -0.621842, 1, 1, 1, 1, 1,
-1.42802, -0.168908, -3.051404, 1, 1, 1, 1, 1,
-1.412825, -2.703024, -0.6919762, 1, 1, 1, 1, 1,
-1.41158, 0.6757544, -0.3347171, 1, 1, 1, 1, 1,
-1.404136, 0.5769364, 1.114674, 1, 1, 1, 1, 1,
-1.40279, 1.089649, 0.1236288, 0, 0, 1, 1, 1,
-1.401255, -0.4848727, -2.542608, 1, 0, 0, 1, 1,
-1.399017, -0.3522733, -2.472255, 1, 0, 0, 1, 1,
-1.393538, 1.802925, -1.768731, 1, 0, 0, 1, 1,
-1.386859, 0.795168, -2.701324, 1, 0, 0, 1, 1,
-1.374781, -1.294403, -2.824331, 1, 0, 0, 1, 1,
-1.374335, -1.133756, -3.136184, 0, 0, 0, 1, 1,
-1.370433, 1.282339, -0.2000318, 0, 0, 0, 1, 1,
-1.366143, 1.152889, -0.0091163, 0, 0, 0, 1, 1,
-1.355287, 0.5457836, -1.759299, 0, 0, 0, 1, 1,
-1.342811, -1.66042, -2.165501, 0, 0, 0, 1, 1,
-1.335992, 0.8767006, -1.368065, 0, 0, 0, 1, 1,
-1.333384, -0.3739561, -1.92738, 0, 0, 0, 1, 1,
-1.325765, 0.1692635, -1.550232, 1, 1, 1, 1, 1,
-1.318277, 0.9735414, -0.1672146, 1, 1, 1, 1, 1,
-1.317722, -0.8038342, -1.909173, 1, 1, 1, 1, 1,
-1.315991, 1.789001, -2.873668, 1, 1, 1, 1, 1,
-1.307768, 0.74659, -1.789081, 1, 1, 1, 1, 1,
-1.293594, 2.772981, 0.02373211, 1, 1, 1, 1, 1,
-1.289544, 0.8371994, -1.626133, 1, 1, 1, 1, 1,
-1.283979, 0.2671542, -2.10649, 1, 1, 1, 1, 1,
-1.282442, -0.3281617, -3.041494, 1, 1, 1, 1, 1,
-1.274587, 0.7133973, -1.627606, 1, 1, 1, 1, 1,
-1.269281, -0.8995551, -2.249904, 1, 1, 1, 1, 1,
-1.262371, -0.8703098, -1.933073, 1, 1, 1, 1, 1,
-1.260235, 1.413063, 0.3941367, 1, 1, 1, 1, 1,
-1.260132, -0.9267715, -2.409731, 1, 1, 1, 1, 1,
-1.258555, 0.8184671, -1.899576, 1, 1, 1, 1, 1,
-1.25606, 0.3607455, -2.688604, 0, 0, 1, 1, 1,
-1.252559, 0.1029899, -2.08648, 1, 0, 0, 1, 1,
-1.24972, 1.035684, -1.010908, 1, 0, 0, 1, 1,
-1.249585, 0.8094736, 0.5017468, 1, 0, 0, 1, 1,
-1.246276, -0.2405696, -0.2991018, 1, 0, 0, 1, 1,
-1.241533, 0.02258837, -0.907102, 1, 0, 0, 1, 1,
-1.231928, 1.14611, 0.5844398, 0, 0, 0, 1, 1,
-1.230184, -0.3332484, -0.9983864, 0, 0, 0, 1, 1,
-1.223427, -0.8628861, -1.535272, 0, 0, 0, 1, 1,
-1.219513, 0.3963993, -2.120031, 0, 0, 0, 1, 1,
-1.211497, -0.2115706, -1.635581, 0, 0, 0, 1, 1,
-1.211067, -0.5030283, -1.88236, 0, 0, 0, 1, 1,
-1.210206, -0.3836437, -1.584918, 0, 0, 0, 1, 1,
-1.197243, -0.1488397, 0.3506513, 1, 1, 1, 1, 1,
-1.195658, 0.9047272, 0.1689348, 1, 1, 1, 1, 1,
-1.192605, 0.7036742, -1.719431, 1, 1, 1, 1, 1,
-1.192484, 0.9849175, -0.9201457, 1, 1, 1, 1, 1,
-1.191608, -0.148486, -3.123514, 1, 1, 1, 1, 1,
-1.181637, -0.5582995, 0.2784456, 1, 1, 1, 1, 1,
-1.172028, 1.20422, -0.7946149, 1, 1, 1, 1, 1,
-1.160029, -0.03944115, -3.207411, 1, 1, 1, 1, 1,
-1.15345, 0.8232356, -1.598934, 1, 1, 1, 1, 1,
-1.149684, -0.8669744, -1.986609, 1, 1, 1, 1, 1,
-1.148366, -0.09686834, -0.7169315, 1, 1, 1, 1, 1,
-1.145098, -0.3892889, -2.14799, 1, 1, 1, 1, 1,
-1.138516, -0.1287983, 0.3351635, 1, 1, 1, 1, 1,
-1.131521, 0.8084775, -0.06163681, 1, 1, 1, 1, 1,
-1.131469, -1.195171, -2.165679, 1, 1, 1, 1, 1,
-1.130412, -0.8428978, -2.443437, 0, 0, 1, 1, 1,
-1.130069, -0.2808046, -1.2044, 1, 0, 0, 1, 1,
-1.127014, 0.8923529, -1.169368, 1, 0, 0, 1, 1,
-1.126318, -1.388479, -3.076318, 1, 0, 0, 1, 1,
-1.122747, 0.6555928, -1.614277, 1, 0, 0, 1, 1,
-1.118178, 2.004224, 0.8777242, 1, 0, 0, 1, 1,
-1.115942, -1.99112, -3.172872, 0, 0, 0, 1, 1,
-1.099361, -0.9468982, -1.799481, 0, 0, 0, 1, 1,
-1.089456, -0.1946706, -0.6958735, 0, 0, 0, 1, 1,
-1.084813, 1.221593, -0.8075605, 0, 0, 0, 1, 1,
-1.081012, 0.2726207, -1.53159, 0, 0, 0, 1, 1,
-1.076787, -0.499295, -1.901222, 0, 0, 0, 1, 1,
-1.076463, -0.1037645, -0.2604133, 0, 0, 0, 1, 1,
-1.076267, 1.330901, -0.7457172, 1, 1, 1, 1, 1,
-1.075315, 0.715262, -2.256499, 1, 1, 1, 1, 1,
-1.073463, 1.52802, -1.247811, 1, 1, 1, 1, 1,
-1.06952, 0.6973478, -1.268847, 1, 1, 1, 1, 1,
-1.068329, -2.094295, -2.663372, 1, 1, 1, 1, 1,
-1.067375, -0.470237, -1.147903, 1, 1, 1, 1, 1,
-1.06592, -0.8375852, -2.065884, 1, 1, 1, 1, 1,
-1.065472, 0.2235807, -0.9464232, 1, 1, 1, 1, 1,
-1.061073, 1.573605, 0.2469765, 1, 1, 1, 1, 1,
-1.048757, 0.4766511, -0.8977569, 1, 1, 1, 1, 1,
-1.047087, 0.1632258, -0.6819333, 1, 1, 1, 1, 1,
-1.034447, -1.330399, -2.725164, 1, 1, 1, 1, 1,
-1.03228, 1.107761, -0.6101321, 1, 1, 1, 1, 1,
-1.024526, -0.2286986, -0.01794262, 1, 1, 1, 1, 1,
-1.024009, 0.8271465, 0.2732808, 1, 1, 1, 1, 1,
-1.022839, 1.223476, -0.08566254, 0, 0, 1, 1, 1,
-1.01218, -0.2186631, -1.531756, 1, 0, 0, 1, 1,
-1.009391, 0.3720506, -1.324095, 1, 0, 0, 1, 1,
-1.007418, 1.190751, -2.45591, 1, 0, 0, 1, 1,
-1.005255, 0.7345037, -2.255754, 1, 0, 0, 1, 1,
-0.9978362, 0.3815797, -0.03428306, 1, 0, 0, 1, 1,
-0.9868621, -0.5370389, -1.261979, 0, 0, 0, 1, 1,
-0.9841123, 1.544517, -1.36975, 0, 0, 0, 1, 1,
-0.9800088, -0.5653943, -0.8271911, 0, 0, 0, 1, 1,
-0.9795502, 1.203596, -0.7163218, 0, 0, 0, 1, 1,
-0.9789384, -1.326588, -1.303008, 0, 0, 0, 1, 1,
-0.9748465, 2.01006, 0.1783556, 0, 0, 0, 1, 1,
-0.9743766, -0.710085, -2.456898, 0, 0, 0, 1, 1,
-0.9743295, -2.3727, -3.632922, 1, 1, 1, 1, 1,
-0.9653662, 0.6011447, -0.8282095, 1, 1, 1, 1, 1,
-0.9593124, 0.238687, -1.087481, 1, 1, 1, 1, 1,
-0.9562127, 0.6141266, -1.14411, 1, 1, 1, 1, 1,
-0.9544792, 0.4539287, -0.8950692, 1, 1, 1, 1, 1,
-0.9541816, -0.3901829, -2.252306, 1, 1, 1, 1, 1,
-0.9533302, -0.305442, -3.738869, 1, 1, 1, 1, 1,
-0.9443258, 0.7948081, -1.995514, 1, 1, 1, 1, 1,
-0.943747, 0.9515853, -2.870317, 1, 1, 1, 1, 1,
-0.941297, 0.352909, -1.430957, 1, 1, 1, 1, 1,
-0.9327657, 0.643382, -0.1610339, 1, 1, 1, 1, 1,
-0.9217123, 0.4443311, -0.06559858, 1, 1, 1, 1, 1,
-0.9201859, 0.6370923, -1.394748, 1, 1, 1, 1, 1,
-0.9190394, -1.46155, -3.666793, 1, 1, 1, 1, 1,
-0.9157062, -0.1095408, -3.009916, 1, 1, 1, 1, 1,
-0.9149738, 0.1450957, -0.6290749, 0, 0, 1, 1, 1,
-0.9117007, 0.2040403, -1.032976, 1, 0, 0, 1, 1,
-0.9085729, -0.0615869, -1.412633, 1, 0, 0, 1, 1,
-0.9067988, 2.76581, 0.05638485, 1, 0, 0, 1, 1,
-0.9047742, 0.5246996, -2.484521, 1, 0, 0, 1, 1,
-0.9042736, 0.2930402, -0.5840844, 1, 0, 0, 1, 1,
-0.9008459, -0.09104125, -3.047195, 0, 0, 0, 1, 1,
-0.8958182, 0.6193814, -1.613619, 0, 0, 0, 1, 1,
-0.894658, -1.105803, -3.052888, 0, 0, 0, 1, 1,
-0.8945681, 0.3544855, -2.217306, 0, 0, 0, 1, 1,
-0.8896626, 0.9075951, -0.727577, 0, 0, 0, 1, 1,
-0.8875205, -0.6186543, -3.717945, 0, 0, 0, 1, 1,
-0.8859966, 0.7583943, -0.6519553, 0, 0, 0, 1, 1,
-0.8826159, 1.692621, -1.650651, 1, 1, 1, 1, 1,
-0.8715798, 0.2267965, -1.209235, 1, 1, 1, 1, 1,
-0.8714064, -0.1582728, -0.5073255, 1, 1, 1, 1, 1,
-0.8708389, -0.1843348, -0.5557972, 1, 1, 1, 1, 1,
-0.8683951, 0.1322136, -0.1609566, 1, 1, 1, 1, 1,
-0.8656672, -0.9296342, -3.109218, 1, 1, 1, 1, 1,
-0.8554214, 1.530372, -1.933799, 1, 1, 1, 1, 1,
-0.849386, -1.022257, -2.815844, 1, 1, 1, 1, 1,
-0.8487971, 0.3564058, 1.729098, 1, 1, 1, 1, 1,
-0.8487024, -1.34915, -2.28375, 1, 1, 1, 1, 1,
-0.84394, -0.3211899, -2.708632, 1, 1, 1, 1, 1,
-0.8421978, 0.05436231, -0.5720371, 1, 1, 1, 1, 1,
-0.8349883, 0.9375111, -2.09543, 1, 1, 1, 1, 1,
-0.8271081, 0.01484641, -0.9507821, 1, 1, 1, 1, 1,
-0.8242819, -0.223562, -2.627004, 1, 1, 1, 1, 1,
-0.8235022, -0.4518085, -2.583351, 0, 0, 1, 1, 1,
-0.8192657, 0.8577915, 0.6651561, 1, 0, 0, 1, 1,
-0.8151317, -0.01207673, -1.927127, 1, 0, 0, 1, 1,
-0.808337, -0.5228837, -2.771098, 1, 0, 0, 1, 1,
-0.8081627, 0.04453394, -1.5229, 1, 0, 0, 1, 1,
-0.8078644, -0.699968, -2.520877, 1, 0, 0, 1, 1,
-0.8049036, -1.572884, -3.48494, 0, 0, 0, 1, 1,
-0.7957525, -2.197767, -2.808376, 0, 0, 0, 1, 1,
-0.7902156, -1.053774, -3.975032, 0, 0, 0, 1, 1,
-0.7868174, -0.4749445, -3.361273, 0, 0, 0, 1, 1,
-0.7850304, -2.075573, -2.435304, 0, 0, 0, 1, 1,
-0.7811519, 0.2422536, -1.460681, 0, 0, 0, 1, 1,
-0.7810431, -0.002488045, -1.118139, 0, 0, 0, 1, 1,
-0.7728009, 0.02684101, -2.006788, 1, 1, 1, 1, 1,
-0.7680377, 0.01394116, -0.8716571, 1, 1, 1, 1, 1,
-0.7634137, -2.327271, -4.794551, 1, 1, 1, 1, 1,
-0.7623239, 0.4457602, -1.037273, 1, 1, 1, 1, 1,
-0.7583497, -0.08072925, -0.5739332, 1, 1, 1, 1, 1,
-0.7487671, -0.176622, -0.8556657, 1, 1, 1, 1, 1,
-0.741881, -1.385764, -3.209358, 1, 1, 1, 1, 1,
-0.7392901, 0.2117378, -3.305132, 1, 1, 1, 1, 1,
-0.7390797, -1.440682, -2.69548, 1, 1, 1, 1, 1,
-0.7320815, 0.5120997, 0.366683, 1, 1, 1, 1, 1,
-0.7289153, -0.4127933, -2.452057, 1, 1, 1, 1, 1,
-0.7186623, -0.09650861, -0.7626447, 1, 1, 1, 1, 1,
-0.7178804, 0.001979738, -1.372543, 1, 1, 1, 1, 1,
-0.7175262, -0.3200628, -4.008661, 1, 1, 1, 1, 1,
-0.7160975, -1.977665, -3.701917, 1, 1, 1, 1, 1,
-0.7117497, 0.9751638, 1.746459, 0, 0, 1, 1, 1,
-0.7102417, -0.5376271, -1.989202, 1, 0, 0, 1, 1,
-0.7048755, 0.4875763, -0.8554612, 1, 0, 0, 1, 1,
-0.7040277, 1.120792, -1.621184, 1, 0, 0, 1, 1,
-0.7012326, 0.4351043, -0.484944, 1, 0, 0, 1, 1,
-0.7004654, 2.150396, -0.4805574, 1, 0, 0, 1, 1,
-0.684941, -0.7625568, -1.39816, 0, 0, 0, 1, 1,
-0.6754268, 2.144888, -0.6696202, 0, 0, 0, 1, 1,
-0.673996, 0.6627106, -1.078871, 0, 0, 0, 1, 1,
-0.6636934, 0.05657532, 0.5561597, 0, 0, 0, 1, 1,
-0.6624211, 0.2108117, -1.473851, 0, 0, 0, 1, 1,
-0.6612452, -1.141936, -3.265576, 0, 0, 0, 1, 1,
-0.6538396, 1.346453, -0.2071116, 0, 0, 0, 1, 1,
-0.6526527, 0.8236093, -0.5153173, 1, 1, 1, 1, 1,
-0.6473634, 0.2518991, -0.8640108, 1, 1, 1, 1, 1,
-0.6451533, 2.040047, 0.9649249, 1, 1, 1, 1, 1,
-0.6435648, -0.1993778, -2.469006, 1, 1, 1, 1, 1,
-0.6410581, 0.4771198, -2.053015, 1, 1, 1, 1, 1,
-0.6382459, -0.0534973, -1.876953, 1, 1, 1, 1, 1,
-0.635619, 1.217128, -2.239722, 1, 1, 1, 1, 1,
-0.6331499, -1.453058, -4.018236, 1, 1, 1, 1, 1,
-0.6324957, -0.6681984, -1.083015, 1, 1, 1, 1, 1,
-0.6245801, -0.07479566, -2.488284, 1, 1, 1, 1, 1,
-0.6229519, 0.3412932, -1.80197, 1, 1, 1, 1, 1,
-0.61653, 0.6442675, -2.382607, 1, 1, 1, 1, 1,
-0.6137362, 1.854572, -2.281623, 1, 1, 1, 1, 1,
-0.6117489, -1.454396, -1.547714, 1, 1, 1, 1, 1,
-0.6104956, -1.784033, -2.459807, 1, 1, 1, 1, 1,
-0.6035025, 1.413466, -0.05837092, 0, 0, 1, 1, 1,
-0.6000481, -0.1578643, -2.312274, 1, 0, 0, 1, 1,
-0.5977221, -2.319317, -2.598539, 1, 0, 0, 1, 1,
-0.5939748, 1.837577, -1.479508, 1, 0, 0, 1, 1,
-0.5931322, -0.3585446, -1.150781, 1, 0, 0, 1, 1,
-0.5903569, -1.515726, -0.8827849, 1, 0, 0, 1, 1,
-0.5891494, -2.026679, -2.382184, 0, 0, 0, 1, 1,
-0.5890673, -0.3640549, -1.596314, 0, 0, 0, 1, 1,
-0.5750665, -0.9487322, -4.321971, 0, 0, 0, 1, 1,
-0.5702031, -0.3443469, -1.850417, 0, 0, 0, 1, 1,
-0.5696864, -1.130899, -3.101172, 0, 0, 0, 1, 1,
-0.567498, -0.4497573, -1.406128, 0, 0, 0, 1, 1,
-0.5603829, 2.262997, -2.436116, 0, 0, 0, 1, 1,
-0.5567564, -0.04969878, -0.9820572, 1, 1, 1, 1, 1,
-0.5567282, -0.3084514, -3.317878, 1, 1, 1, 1, 1,
-0.5559558, 1.31639, -0.8434412, 1, 1, 1, 1, 1,
-0.5523398, -1.137187, 0.1735999, 1, 1, 1, 1, 1,
-0.5386866, 1.140215, -1.176681, 1, 1, 1, 1, 1,
-0.5347419, 0.7002349, 0.08659916, 1, 1, 1, 1, 1,
-0.5344793, 1.308145, -1.654828, 1, 1, 1, 1, 1,
-0.5305422, -1.361081, -3.14178, 1, 1, 1, 1, 1,
-0.5251197, 1.188392, -0.6205447, 1, 1, 1, 1, 1,
-0.5215305, 0.2824911, -1.998268, 1, 1, 1, 1, 1,
-0.5188598, 0.08050773, -1.236392, 1, 1, 1, 1, 1,
-0.5186736, 1.296962, 0.7137673, 1, 1, 1, 1, 1,
-0.5091921, -0.6957803, -1.506652, 1, 1, 1, 1, 1,
-0.5075978, 0.8558753, 0.3541917, 1, 1, 1, 1, 1,
-0.5072564, 0.7973171, -1.141634, 1, 1, 1, 1, 1,
-0.5024202, -0.8430057, -3.558768, 0, 0, 1, 1, 1,
-0.5023259, 0.9097603, -0.3536438, 1, 0, 0, 1, 1,
-0.5023077, 1.679646, -0.5955912, 1, 0, 0, 1, 1,
-0.4989688, -0.3159767, -2.536262, 1, 0, 0, 1, 1,
-0.4953967, -0.2153792, -1.636437, 1, 0, 0, 1, 1,
-0.4907494, -1.157305, -2.268332, 1, 0, 0, 1, 1,
-0.4896442, -0.9475752, -4.768887, 0, 0, 0, 1, 1,
-0.4895683, 2.555441, 0.828823, 0, 0, 0, 1, 1,
-0.489557, -0.5526, -2.702175, 0, 0, 0, 1, 1,
-0.4887161, -0.02447769, -3.264258, 0, 0, 0, 1, 1,
-0.4882949, -0.6121524, -3.215899, 0, 0, 0, 1, 1,
-0.48656, -0.3696686, -2.84736, 0, 0, 0, 1, 1,
-0.4855151, 0.8616642, -0.5513512, 0, 0, 0, 1, 1,
-0.48362, -1.253136, -1.34093, 1, 1, 1, 1, 1,
-0.4836031, 0.945564, -1.654797, 1, 1, 1, 1, 1,
-0.4832598, 0.2892783, -1.641443, 1, 1, 1, 1, 1,
-0.4818294, 1.375847, -0.4754169, 1, 1, 1, 1, 1,
-0.479117, -0.5148645, -3.561719, 1, 1, 1, 1, 1,
-0.4772569, -0.46251, -3.448477, 1, 1, 1, 1, 1,
-0.4768483, 0.6741328, 0.4068192, 1, 1, 1, 1, 1,
-0.4741342, -0.4006406, -2.90044, 1, 1, 1, 1, 1,
-0.469622, 0.772974, -0.2219806, 1, 1, 1, 1, 1,
-0.4659733, -0.6694179, -2.167102, 1, 1, 1, 1, 1,
-0.4623919, -0.728155, -2.139713, 1, 1, 1, 1, 1,
-0.4618018, 1.067997, -2.203377, 1, 1, 1, 1, 1,
-0.4595392, -1.317016, -3.292905, 1, 1, 1, 1, 1,
-0.4555133, -0.5041909, -3.03004, 1, 1, 1, 1, 1,
-0.4541671, -0.3333628, -1.29557, 1, 1, 1, 1, 1,
-0.4508824, 0.7284512, -0.2017479, 0, 0, 1, 1, 1,
-0.4496869, -0.2888605, -2.081626, 1, 0, 0, 1, 1,
-0.4461037, 0.7020558, -0.1687049, 1, 0, 0, 1, 1,
-0.4404967, -1.151514, -1.801467, 1, 0, 0, 1, 1,
-0.4369876, 0.8236702, 0.6369628, 1, 0, 0, 1, 1,
-0.4367021, -1.172788, -2.980313, 1, 0, 0, 1, 1,
-0.4345072, 0.8779598, -1.243178, 0, 0, 0, 1, 1,
-0.4325652, 0.2941504, -0.6537285, 0, 0, 0, 1, 1,
-0.4321846, -0.7733833, -3.166869, 0, 0, 0, 1, 1,
-0.4320062, 0.7731062, -1.822291, 0, 0, 0, 1, 1,
-0.4289199, -0.4352438, -3.206592, 0, 0, 0, 1, 1,
-0.4238203, 0.2807025, -2.322867, 0, 0, 0, 1, 1,
-0.4182492, -0.5761885, -0.3813986, 0, 0, 0, 1, 1,
-0.4150685, -1.083198, -2.103124, 1, 1, 1, 1, 1,
-0.4124277, -1.813663, -2.710493, 1, 1, 1, 1, 1,
-0.4118792, -0.5092352, -2.377855, 1, 1, 1, 1, 1,
-0.4102746, -0.3039355, -1.797485, 1, 1, 1, 1, 1,
-0.4100581, -0.3421595, -2.138748, 1, 1, 1, 1, 1,
-0.4085541, 0.6872454, -0.2090738, 1, 1, 1, 1, 1,
-0.4050399, 1.772658, 1.062713, 1, 1, 1, 1, 1,
-0.3987101, 1.382425, 0.5290865, 1, 1, 1, 1, 1,
-0.3984644, 0.2895806, -1.585905, 1, 1, 1, 1, 1,
-0.3981567, 2.916855, -1.530255, 1, 1, 1, 1, 1,
-0.3977901, -0.1977235, -3.170027, 1, 1, 1, 1, 1,
-0.3970605, -0.3175379, -3.808837, 1, 1, 1, 1, 1,
-0.3958408, -1.055712, -2.802056, 1, 1, 1, 1, 1,
-0.3948217, 0.2172973, -0.1157282, 1, 1, 1, 1, 1,
-0.3912759, 0.3782114, -1.662974, 1, 1, 1, 1, 1,
-0.3886, 0.7828059, 0.2550439, 0, 0, 1, 1, 1,
-0.386214, -0.3608005, -2.245555, 1, 0, 0, 1, 1,
-0.3848133, 0.2579199, -1.852025, 1, 0, 0, 1, 1,
-0.3825981, 0.6033757, 0.3216853, 1, 0, 0, 1, 1,
-0.3822563, 1.470198, -0.6797901, 1, 0, 0, 1, 1,
-0.3778822, 0.4537112, 0.2934647, 1, 0, 0, 1, 1,
-0.3772086, 0.6068543, -1.645409, 0, 0, 0, 1, 1,
-0.375027, 0.4283247, -0.4199824, 0, 0, 0, 1, 1,
-0.3731345, 0.1016851, -1.558918, 0, 0, 0, 1, 1,
-0.3679902, -1.130729, -2.337306, 0, 0, 0, 1, 1,
-0.3675326, 1.839074, 0.5932323, 0, 0, 0, 1, 1,
-0.3603569, -0.05408783, -1.231373, 0, 0, 0, 1, 1,
-0.3560383, 0.5586467, -1.226945, 0, 0, 0, 1, 1,
-0.3504498, 0.778353, -0.2544357, 1, 1, 1, 1, 1,
-0.3504126, -0.6116363, -4.688119, 1, 1, 1, 1, 1,
-0.3493125, -1.756505, -4.465723, 1, 1, 1, 1, 1,
-0.347698, -2.14842, -1.624595, 1, 1, 1, 1, 1,
-0.3405108, -1.130839, -2.508542, 1, 1, 1, 1, 1,
-0.3394848, 1.249828, 0.8084387, 1, 1, 1, 1, 1,
-0.3317821, 0.5493086, -1.030936, 1, 1, 1, 1, 1,
-0.3252248, -0.8709778, -3.014999, 1, 1, 1, 1, 1,
-0.324302, 0.6093057, 0.4873747, 1, 1, 1, 1, 1,
-0.3227997, 0.2362193, -1.536935, 1, 1, 1, 1, 1,
-0.31618, 1.047589, -1.391676, 1, 1, 1, 1, 1,
-0.310556, 2.33283, -0.5426896, 1, 1, 1, 1, 1,
-0.310104, 1.010064, 0.3561493, 1, 1, 1, 1, 1,
-0.3093493, -1.097651, -2.730896, 1, 1, 1, 1, 1,
-0.3077487, 1.268506, -2.789972, 1, 1, 1, 1, 1,
-0.307475, 1.266212, -0.2538619, 0, 0, 1, 1, 1,
-0.3046279, -0.4941713, -2.841938, 1, 0, 0, 1, 1,
-0.3028305, -0.2749223, -0.5782061, 1, 0, 0, 1, 1,
-0.3026074, 0.1453024, -1.723776, 1, 0, 0, 1, 1,
-0.3015973, 0.6524428, -0.7682117, 1, 0, 0, 1, 1,
-0.3015259, 0.8559127, 1.429022, 1, 0, 0, 1, 1,
-0.3012406, 0.3665554, -0.6404486, 0, 0, 0, 1, 1,
-0.3007608, 1.025224, 0.5962771, 0, 0, 0, 1, 1,
-0.2973034, 0.6795453, -1.178314, 0, 0, 0, 1, 1,
-0.2947425, -1.241634, -2.65565, 0, 0, 0, 1, 1,
-0.2917681, 0.5210919, -1.213569, 0, 0, 0, 1, 1,
-0.287829, 0.299543, 1.258177, 0, 0, 0, 1, 1,
-0.2857257, 0.03285482, -1.476104, 0, 0, 0, 1, 1,
-0.2826618, -2.270233, -0.6903427, 1, 1, 1, 1, 1,
-0.2825381, -0.4323201, -2.537229, 1, 1, 1, 1, 1,
-0.2801804, 0.4810788, -1.807808, 1, 1, 1, 1, 1,
-0.2744418, 0.8342353, 0.1112823, 1, 1, 1, 1, 1,
-0.2731926, 1.052137, -0.4689241, 1, 1, 1, 1, 1,
-0.2714844, -0.9603655, -4.081519, 1, 1, 1, 1, 1,
-0.2702931, 1.235657, -1.480391, 1, 1, 1, 1, 1,
-0.2700809, 0.1288466, -0.2537296, 1, 1, 1, 1, 1,
-0.2675832, 2.242745, 0.4051581, 1, 1, 1, 1, 1,
-0.2601516, -0.8812395, -1.960466, 1, 1, 1, 1, 1,
-0.2595252, 1.543333, -0.840463, 1, 1, 1, 1, 1,
-0.2560354, -0.5324485, -3.91503, 1, 1, 1, 1, 1,
-0.2483828, 0.6040935, 1.570298, 1, 1, 1, 1, 1,
-0.2445196, -0.2449802, -1.437253, 1, 1, 1, 1, 1,
-0.2425776, -0.6464565, -1.060519, 1, 1, 1, 1, 1,
-0.2411971, -1.239069, -2.991519, 0, 0, 1, 1, 1,
-0.2393341, -0.01910691, -2.370765, 1, 0, 0, 1, 1,
-0.2381545, 0.8354295, -0.3886296, 1, 0, 0, 1, 1,
-0.2282268, -0.5454376, -3.880493, 1, 0, 0, 1, 1,
-0.2241725, -1.401077, -3.52493, 1, 0, 0, 1, 1,
-0.2198956, 1.645124, -1.684161, 1, 0, 0, 1, 1,
-0.2196791, -1.136546, -3.035509, 0, 0, 0, 1, 1,
-0.2192205, 0.2315407, -2.384463, 0, 0, 0, 1, 1,
-0.2190401, -0.5729955, -3.380172, 0, 0, 0, 1, 1,
-0.2176256, -0.8128091, -3.513294, 0, 0, 0, 1, 1,
-0.216007, 0.07340489, 1.250804, 0, 0, 0, 1, 1,
-0.2062935, -0.4497573, -3.018974, 0, 0, 0, 1, 1,
-0.2059097, 1.66515, -1.699064, 0, 0, 0, 1, 1,
-0.2046179, -0.6200094, -2.985361, 1, 1, 1, 1, 1,
-0.2024541, -1.769531, -3.018716, 1, 1, 1, 1, 1,
-0.200864, -0.1246198, -1.388387, 1, 1, 1, 1, 1,
-0.1984197, 0.4163091, 0.5815927, 1, 1, 1, 1, 1,
-0.1983694, -0.6339583, -3.866425, 1, 1, 1, 1, 1,
-0.1977541, -0.04459693, -2.765036, 1, 1, 1, 1, 1,
-0.1971596, 0.08583733, -0.4307033, 1, 1, 1, 1, 1,
-0.1939091, -1.47749, -4.005936, 1, 1, 1, 1, 1,
-0.1938518, 1.399129, 0.208472, 1, 1, 1, 1, 1,
-0.1935699, 0.4734319, -1.540533, 1, 1, 1, 1, 1,
-0.1916958, 0.8829402, 1.02793, 1, 1, 1, 1, 1,
-0.1871559, 0.4917897, -0.6838617, 1, 1, 1, 1, 1,
-0.1802577, -0.7741926, -2.299364, 1, 1, 1, 1, 1,
-0.1790466, 0.2740422, -1.616615, 1, 1, 1, 1, 1,
-0.1755205, 2.05292, -0.4632221, 1, 1, 1, 1, 1,
-0.171703, 0.6195533, -0.4969505, 0, 0, 1, 1, 1,
-0.1667964, 1.332671, 1.123067, 1, 0, 0, 1, 1,
-0.1623883, 0.3306348, 0.3550687, 1, 0, 0, 1, 1,
-0.1615087, 0.813951, -0.5284171, 1, 0, 0, 1, 1,
-0.1582927, 0.1881736, -1.670504, 1, 0, 0, 1, 1,
-0.1547505, -0.6086547, -3.436406, 1, 0, 0, 1, 1,
-0.153154, 0.5128841, -1.207439, 0, 0, 0, 1, 1,
-0.1510127, 1.877527, -1.997661, 0, 0, 0, 1, 1,
-0.1472929, 1.239081, -0.7560911, 0, 0, 0, 1, 1,
-0.1456642, 1.316373, 0.3103678, 0, 0, 0, 1, 1,
-0.1415598, 0.666153, -0.7847218, 0, 0, 0, 1, 1,
-0.1342617, 0.4497174, -1.471511, 0, 0, 0, 1, 1,
-0.1288383, -0.1040315, -0.8834726, 0, 0, 0, 1, 1,
-0.1277116, -0.1776082, -1.99916, 1, 1, 1, 1, 1,
-0.1269546, 1.162389, 0.05498604, 1, 1, 1, 1, 1,
-0.1268092, -1.208734, -2.132992, 1, 1, 1, 1, 1,
-0.1266833, 0.3663803, -0.6968218, 1, 1, 1, 1, 1,
-0.1265124, -0.4310875, -4.439059, 1, 1, 1, 1, 1,
-0.1263336, 0.8470159, -0.9839059, 1, 1, 1, 1, 1,
-0.122785, 0.3574465, -1.011096, 1, 1, 1, 1, 1,
-0.1220665, 0.5629376, 1.075825, 1, 1, 1, 1, 1,
-0.1214148, -0.8806718, -2.59677, 1, 1, 1, 1, 1,
-0.1098428, -0.3869453, -3.070753, 1, 1, 1, 1, 1,
-0.09679195, -0.6747703, -1.783293, 1, 1, 1, 1, 1,
-0.09525776, 0.3503317, 2.053139, 1, 1, 1, 1, 1,
-0.09466889, -0.4014997, -2.99983, 1, 1, 1, 1, 1,
-0.09375221, -1.140976, -2.618509, 1, 1, 1, 1, 1,
-0.08961945, -0.7199633, -1.425813, 1, 1, 1, 1, 1,
-0.08844362, 0.3727306, -1.037208, 0, 0, 1, 1, 1,
-0.08677164, 0.005758174, -1.411262, 1, 0, 0, 1, 1,
-0.08194533, -1.066422, -4.146981, 1, 0, 0, 1, 1,
-0.08013736, 0.0338712, -0.3601897, 1, 0, 0, 1, 1,
-0.08005885, -2.136948, -1.635481, 1, 0, 0, 1, 1,
-0.07652668, 0.6594125, -0.5685518, 1, 0, 0, 1, 1,
-0.07628507, 0.01201197, -1.509691, 0, 0, 0, 1, 1,
-0.07613181, 0.4965743, 0.07317306, 0, 0, 0, 1, 1,
-0.07226076, -0.2395554, -2.818856, 0, 0, 0, 1, 1,
-0.0679791, 0.5337782, 0.1109965, 0, 0, 0, 1, 1,
-0.06794905, 0.08596908, -1.781607, 0, 0, 0, 1, 1,
-0.06672627, 0.9204838, -0.452052, 0, 0, 0, 1, 1,
-0.06244692, 1.920179, -1.879215, 0, 0, 0, 1, 1,
-0.06137216, 0.6534815, -0.6506926, 1, 1, 1, 1, 1,
-0.06055398, 0.06937544, 1.042997, 1, 1, 1, 1, 1,
-0.05704375, -1.33406, -2.4149, 1, 1, 1, 1, 1,
-0.05570891, -0.2888101, -2.986611, 1, 1, 1, 1, 1,
-0.05302176, 1.833508, 1.754258, 1, 1, 1, 1, 1,
-0.05245519, -0.01078112, -1.446155, 1, 1, 1, 1, 1,
-0.05155166, 0.7524215, -0.6208861, 1, 1, 1, 1, 1,
-0.0456801, 0.2128872, 1.219961, 1, 1, 1, 1, 1,
-0.04370577, 1.618387, 0.21577, 1, 1, 1, 1, 1,
-0.04045131, -0.458943, -0.5014946, 1, 1, 1, 1, 1,
-0.03781481, 0.2635213, -2.105856, 1, 1, 1, 1, 1,
-0.03662686, 1.545026, -0.6227292, 1, 1, 1, 1, 1,
-0.03490506, 0.8155892, 2.160024, 1, 1, 1, 1, 1,
-0.03339659, -0.7049469, -1.811544, 1, 1, 1, 1, 1,
-0.02445298, 1.005711, -0.7691874, 1, 1, 1, 1, 1,
-0.0183543, 0.3215626, -1.23249, 0, 0, 1, 1, 1,
-0.01103273, 0.06224984, -0.03815822, 1, 0, 0, 1, 1,
-0.01031584, 0.8324537, 0.6141902, 1, 0, 0, 1, 1,
-0.008440819, -0.7628565, -3.021875, 1, 0, 0, 1, 1,
-0.008126963, 0.3353219, -0.073571, 1, 0, 0, 1, 1,
-0.006874489, -0.2975239, -4.775797, 1, 0, 0, 1, 1,
-0.006508762, 0.7999958, -0.226301, 0, 0, 0, 1, 1,
-0.006448828, 0.5040855, 1.000003, 0, 0, 0, 1, 1,
-0.005793066, 1.285682, 1.164068, 0, 0, 0, 1, 1,
0.001908469, 1.30276, 0.002253199, 0, 0, 0, 1, 1,
0.005927203, 0.3147179, -0.1070201, 0, 0, 0, 1, 1,
0.006736747, -0.403988, 3.074602, 0, 0, 0, 1, 1,
0.008502789, -1.534043, 0.09497602, 0, 0, 0, 1, 1,
0.00886581, 0.07618641, -0.6122782, 1, 1, 1, 1, 1,
0.0124367, 1.578768, -0.8831552, 1, 1, 1, 1, 1,
0.01313855, -0.009305292, 2.584453, 1, 1, 1, 1, 1,
0.01475285, 1.058563, 1.027587, 1, 1, 1, 1, 1,
0.0156358, 0.1063827, 1.591897, 1, 1, 1, 1, 1,
0.01765856, -0.08262178, 2.975426, 1, 1, 1, 1, 1,
0.01825035, 1.29926, -0.6544147, 1, 1, 1, 1, 1,
0.01982591, -1.489069, 2.482557, 1, 1, 1, 1, 1,
0.02168678, 1.396198, -0.329888, 1, 1, 1, 1, 1,
0.02438708, 1.043822, -0.2513295, 1, 1, 1, 1, 1,
0.02935137, -1.405005, 3.793639, 1, 1, 1, 1, 1,
0.03200411, 0.5356194, -0.05753283, 1, 1, 1, 1, 1,
0.03240764, 0.2892694, 0.7048609, 1, 1, 1, 1, 1,
0.032959, 1.478288, -0.9223737, 1, 1, 1, 1, 1,
0.03306105, -0.1729196, 2.166643, 1, 1, 1, 1, 1,
0.03888799, -0.1968452, 3.747798, 0, 0, 1, 1, 1,
0.03898333, 0.1989207, -0.5593451, 1, 0, 0, 1, 1,
0.04022469, 0.04358182, 4.380881, 1, 0, 0, 1, 1,
0.04488398, -0.1646907, 3.622813, 1, 0, 0, 1, 1,
0.04534248, -0.7904163, 3.943641, 1, 0, 0, 1, 1,
0.04590305, -2.433498, 2.456221, 1, 0, 0, 1, 1,
0.05134049, 1.37122, -0.4021239, 0, 0, 0, 1, 1,
0.05188676, 0.3411733, 0.8509833, 0, 0, 0, 1, 1,
0.05361933, -0.8612922, 4.844305, 0, 0, 0, 1, 1,
0.05747777, 1.177954, 0.2415112, 0, 0, 0, 1, 1,
0.05830777, -1.643165, 3.924125, 0, 0, 0, 1, 1,
0.06098247, 0.541073, 0.07969221, 0, 0, 0, 1, 1,
0.06559278, -2.443893, 1.602159, 0, 0, 0, 1, 1,
0.06633031, -0.1115038, 1.619203, 1, 1, 1, 1, 1,
0.0680637, -0.2961533, 3.466734, 1, 1, 1, 1, 1,
0.06921157, 0.02006119, 3.24766, 1, 1, 1, 1, 1,
0.07759261, 0.01665143, 2.219373, 1, 1, 1, 1, 1,
0.08031075, -0.2287645, 1.776855, 1, 1, 1, 1, 1,
0.08172752, -0.2380569, 2.551683, 1, 1, 1, 1, 1,
0.08431952, -0.7625896, 4.781405, 1, 1, 1, 1, 1,
0.08652788, 1.54798, 0.9734614, 1, 1, 1, 1, 1,
0.09088781, -1.539677, 3.274442, 1, 1, 1, 1, 1,
0.09260952, -0.2655087, 4.341015, 1, 1, 1, 1, 1,
0.09315755, -0.04962999, 2.822545, 1, 1, 1, 1, 1,
0.09326327, 1.077791, -0.3866724, 1, 1, 1, 1, 1,
0.09696323, 1.197788, 1.04111, 1, 1, 1, 1, 1,
0.1002208, -0.5328137, 3.343733, 1, 1, 1, 1, 1,
0.1063332, -1.871787, 3.640129, 1, 1, 1, 1, 1,
0.1085896, -1.094984, 2.807716, 0, 0, 1, 1, 1,
0.1114743, 1.35883, -1.190114, 1, 0, 0, 1, 1,
0.1170556, -1.549857, 4.320579, 1, 0, 0, 1, 1,
0.1173162, -0.169201, 3.696868, 1, 0, 0, 1, 1,
0.1196277, 2.182474, 0.08519874, 1, 0, 0, 1, 1,
0.1228832, -0.2248263, 2.86554, 1, 0, 0, 1, 1,
0.1233008, 0.3335145, -0.5634831, 0, 0, 0, 1, 1,
0.1350539, -1.298682, 3.82971, 0, 0, 0, 1, 1,
0.1352181, 0.6040961, -1.644498, 0, 0, 0, 1, 1,
0.1395169, -0.08825019, 2.317529, 0, 0, 0, 1, 1,
0.1399291, -0.3117638, 4.129663, 0, 0, 0, 1, 1,
0.1444608, -0.1965032, 1.675032, 0, 0, 0, 1, 1,
0.1453623, -1.643167, 2.507488, 0, 0, 0, 1, 1,
0.1461679, -0.275752, 2.569304, 1, 1, 1, 1, 1,
0.1490243, -1.409537, 2.120485, 1, 1, 1, 1, 1,
0.1544113, -0.5662537, 3.412586, 1, 1, 1, 1, 1,
0.1545864, -1.88859, 1.208619, 1, 1, 1, 1, 1,
0.155236, 0.2577198, 0.7094717, 1, 1, 1, 1, 1,
0.1561121, 0.6902221, -0.6276731, 1, 1, 1, 1, 1,
0.1572025, -0.178134, 2.389741, 1, 1, 1, 1, 1,
0.1584609, -0.4355632, 1.636599, 1, 1, 1, 1, 1,
0.1633407, 0.696479, 0.7962868, 1, 1, 1, 1, 1,
0.1651333, -0.5763678, 3.047084, 1, 1, 1, 1, 1,
0.1663198, 0.4923682, 0.4236454, 1, 1, 1, 1, 1,
0.1693723, 1.351656, -0.7904044, 1, 1, 1, 1, 1,
0.1698201, 1.823186, 0.9433344, 1, 1, 1, 1, 1,
0.1701053, 1.882322, -0.4927446, 1, 1, 1, 1, 1,
0.1744872, 1.571352, -0.6614984, 1, 1, 1, 1, 1,
0.1812218, 1.402183, -0.4548253, 0, 0, 1, 1, 1,
0.1821789, 1.56771, 1.872643, 1, 0, 0, 1, 1,
0.1823083, 0.3525186, 1.52916, 1, 0, 0, 1, 1,
0.1859857, 0.1414844, 2.07057, 1, 0, 0, 1, 1,
0.1872553, -0.1999158, 1.801023, 1, 0, 0, 1, 1,
0.1960329, -0.424564, 2.307503, 1, 0, 0, 1, 1,
0.1975744, 0.2543827, 0.9178561, 0, 0, 0, 1, 1,
0.1982891, -1.847886, 4.725171, 0, 0, 0, 1, 1,
0.2034883, -1.464267, 2.051424, 0, 0, 0, 1, 1,
0.2034956, -0.8999701, 2.377685, 0, 0, 0, 1, 1,
0.2043175, 0.1297795, 0.96965, 0, 0, 0, 1, 1,
0.2051805, 1.963644, -0.08320611, 0, 0, 0, 1, 1,
0.2089749, 1.264533, 0.4526936, 0, 0, 0, 1, 1,
0.214375, -0.8612517, 1.773756, 1, 1, 1, 1, 1,
0.2154142, 1.713973, -0.9968005, 1, 1, 1, 1, 1,
0.2172874, -0.8471379, 1.692925, 1, 1, 1, 1, 1,
0.2199139, 0.8427149, -0.4234977, 1, 1, 1, 1, 1,
0.225961, 0.4916376, 0.6944767, 1, 1, 1, 1, 1,
0.2295986, 1.024163, -0.3369621, 1, 1, 1, 1, 1,
0.2306301, 1.350942, -0.4914145, 1, 1, 1, 1, 1,
0.2345312, -2.645101, 3.451139, 1, 1, 1, 1, 1,
0.2353477, -0.9071469, 3.735592, 1, 1, 1, 1, 1,
0.2412426, 0.02327967, 0.9260178, 1, 1, 1, 1, 1,
0.2428613, 1.181197, 0.9248795, 1, 1, 1, 1, 1,
0.243148, -0.291623, 1.409988, 1, 1, 1, 1, 1,
0.2440925, 0.7294661, 0.3535778, 1, 1, 1, 1, 1,
0.2453427, 2.452082, 0.3564971, 1, 1, 1, 1, 1,
0.2515621, -0.5097378, 3.105644, 1, 1, 1, 1, 1,
0.2523007, -1.475075, 3.219379, 0, 0, 1, 1, 1,
0.252896, -0.9179613, 2.78029, 1, 0, 0, 1, 1,
0.2624613, 0.9851143, 0.196867, 1, 0, 0, 1, 1,
0.2630388, -1.28468, 2.334838, 1, 0, 0, 1, 1,
0.268296, 0.07651668, 1.641474, 1, 0, 0, 1, 1,
0.272821, 0.3072703, 0.5053433, 1, 0, 0, 1, 1,
0.2764646, -0.8558631, 0.6650677, 0, 0, 0, 1, 1,
0.2771784, 1.442507, -1.133754, 0, 0, 0, 1, 1,
0.2839241, -1.18825, 1.317878, 0, 0, 0, 1, 1,
0.2857754, -0.4182009, 3.378713, 0, 0, 0, 1, 1,
0.2873778, -1.474415, 3.321674, 0, 0, 0, 1, 1,
0.290242, 0.3664486, 0.9577007, 0, 0, 0, 1, 1,
0.2914394, 0.2445134, -0.4010482, 0, 0, 0, 1, 1,
0.2920572, -1.641285, 2.643028, 1, 1, 1, 1, 1,
0.292247, -0.2499096, 1.584558, 1, 1, 1, 1, 1,
0.2928151, 0.1286004, 1.322026, 1, 1, 1, 1, 1,
0.2972018, 0.6271549, 0.2051096, 1, 1, 1, 1, 1,
0.3022675, -0.3327967, 2.445596, 1, 1, 1, 1, 1,
0.3027952, -0.1819226, 1.801573, 1, 1, 1, 1, 1,
0.3043723, 1.59093, -0.3418405, 1, 1, 1, 1, 1,
0.3046293, -0.7606916, 3.44507, 1, 1, 1, 1, 1,
0.3164653, 0.02749888, 2.56152, 1, 1, 1, 1, 1,
0.3172003, 1.035486, -1.099844, 1, 1, 1, 1, 1,
0.3198147, -1.138707, 2.770379, 1, 1, 1, 1, 1,
0.3205511, 0.7040125, 0.1236512, 1, 1, 1, 1, 1,
0.3217289, 0.7346449, 0.3180529, 1, 1, 1, 1, 1,
0.3227686, -1.42183, 3.564077, 1, 1, 1, 1, 1,
0.3231498, -0.374449, 3.060396, 1, 1, 1, 1, 1,
0.327634, 0.905193, -0.1456807, 0, 0, 1, 1, 1,
0.3284689, -0.6079174, 2.613614, 1, 0, 0, 1, 1,
0.3309845, 0.7804184, 1.223357, 1, 0, 0, 1, 1,
0.3316909, -0.1164543, 3.544767, 1, 0, 0, 1, 1,
0.3317844, -0.1944119, 2.317497, 1, 0, 0, 1, 1,
0.3319419, 0.9994521, -1.307451, 1, 0, 0, 1, 1,
0.3383841, 0.3251201, 0.6957644, 0, 0, 0, 1, 1,
0.3407509, 0.3486483, 2.064331, 0, 0, 0, 1, 1,
0.3409839, 0.3600898, 0.2432893, 0, 0, 0, 1, 1,
0.347006, -0.8495818, 2.578319, 0, 0, 0, 1, 1,
0.3506387, 1.924141, 0.8527929, 0, 0, 0, 1, 1,
0.3555751, 1.476061, -0.0940036, 0, 0, 0, 1, 1,
0.3583525, 0.5048987, 2.231936, 0, 0, 0, 1, 1,
0.3599458, -0.9683237, 4.331031, 1, 1, 1, 1, 1,
0.3606912, 1.162067, 1.026965, 1, 1, 1, 1, 1,
0.3607768, 1.695959, 0.6930733, 1, 1, 1, 1, 1,
0.3618144, -0.7899911, 3.248695, 1, 1, 1, 1, 1,
0.3653586, -0.9914384, 2.696568, 1, 1, 1, 1, 1,
0.3707023, 1.582878, 0.2386679, 1, 1, 1, 1, 1,
0.3763793, -0.1984334, 3.590162, 1, 1, 1, 1, 1,
0.3856524, 0.709228, 1.664249, 1, 1, 1, 1, 1,
0.3870602, 1.228806, 0.9410815, 1, 1, 1, 1, 1,
0.3888795, -0.1036636, 1.849836, 1, 1, 1, 1, 1,
0.4026353, -0.0400418, 2.423534, 1, 1, 1, 1, 1,
0.4028453, 0.4912647, 0.6872957, 1, 1, 1, 1, 1,
0.4088123, -1.503098, 1.941665, 1, 1, 1, 1, 1,
0.4111987, -0.1401508, 3.475894, 1, 1, 1, 1, 1,
0.4113738, 0.8395651, 1.371211, 1, 1, 1, 1, 1,
0.4173622, 0.3481366, 1.510262, 0, 0, 1, 1, 1,
0.4187893, 0.8022157, 0.0504592, 1, 0, 0, 1, 1,
0.419126, -0.04781736, 3.894821, 1, 0, 0, 1, 1,
0.4278789, 0.5201611, 0.1329312, 1, 0, 0, 1, 1,
0.4284068, -0.6832393, 3.208039, 1, 0, 0, 1, 1,
0.4424376, -0.08334997, 2.42991, 1, 0, 0, 1, 1,
0.4425825, 0.4950381, 1.373659, 0, 0, 0, 1, 1,
0.4440082, -0.374423, 0.3755273, 0, 0, 0, 1, 1,
0.4448705, -0.5625562, 1.536876, 0, 0, 0, 1, 1,
0.4469866, -1.283661, 0.0160417, 0, 0, 0, 1, 1,
0.4494326, -0.1121828, 2.400283, 0, 0, 0, 1, 1,
0.4505831, -0.5063121, 2.223284, 0, 0, 0, 1, 1,
0.4538653, -0.507378, 2.666353, 0, 0, 0, 1, 1,
0.45712, 1.144267, 0.3500229, 1, 1, 1, 1, 1,
0.4675751, 0.03975817, 3.233671, 1, 1, 1, 1, 1,
0.4681737, -0.2975788, 1.47662, 1, 1, 1, 1, 1,
0.4693564, -1.542665, 2.796334, 1, 1, 1, 1, 1,
0.4738637, -1.388128, 2.05391, 1, 1, 1, 1, 1,
0.4742225, -0.7469476, 2.132933, 1, 1, 1, 1, 1,
0.4743483, -2.289848, 2.348534, 1, 1, 1, 1, 1,
0.4743959, -0.8651173, 3.241178, 1, 1, 1, 1, 1,
0.4779784, 0.2422874, 0.8920308, 1, 1, 1, 1, 1,
0.4784788, 0.05418323, 1.258641, 1, 1, 1, 1, 1,
0.484344, -0.5690442, 2.952149, 1, 1, 1, 1, 1,
0.4867722, 1.274237, 2.265221, 1, 1, 1, 1, 1,
0.4922194, 0.3448814, 0.5141363, 1, 1, 1, 1, 1,
0.4925886, 0.03796111, 1.142534, 1, 1, 1, 1, 1,
0.4930311, 0.4934737, 0.2285001, 1, 1, 1, 1, 1,
0.4965905, -0.2229941, 1.75379, 0, 0, 1, 1, 1,
0.4972327, -0.5698619, 2.992463, 1, 0, 0, 1, 1,
0.4978739, 0.6650753, 0.1682954, 1, 0, 0, 1, 1,
0.4997083, -0.099241, 2.029193, 1, 0, 0, 1, 1,
0.5016228, -0.336639, 3.751215, 1, 0, 0, 1, 1,
0.5021682, -0.4731465, 3.462893, 1, 0, 0, 1, 1,
0.5028092, -0.209669, 1.698577, 0, 0, 0, 1, 1,
0.5029503, -1.167302, 1.469089, 0, 0, 0, 1, 1,
0.5037957, -0.9622107, 1.745895, 0, 0, 0, 1, 1,
0.5055025, -0.2629705, 0.5822706, 0, 0, 0, 1, 1,
0.5084053, 0.3798209, -0.1300755, 0, 0, 0, 1, 1,
0.5152576, 0.6037219, 0.8015156, 0, 0, 0, 1, 1,
0.5152869, -0.6683362, 2.649225, 0, 0, 0, 1, 1,
0.5207481, -1.103247, 2.262991, 1, 1, 1, 1, 1,
0.5210149, -0.6582068, 2.236899, 1, 1, 1, 1, 1,
0.5220886, -0.09618472, 1.622416, 1, 1, 1, 1, 1,
0.5224429, -0.5266585, 3.122868, 1, 1, 1, 1, 1,
0.5227391, 1.767241, 1.335285, 1, 1, 1, 1, 1,
0.5287368, 0.2333503, 1.786834, 1, 1, 1, 1, 1,
0.5287557, 1.429791, 2.247792, 1, 1, 1, 1, 1,
0.5293611, -0.2090353, 3.319334, 1, 1, 1, 1, 1,
0.5312545, 0.83434, -1.954246, 1, 1, 1, 1, 1,
0.5464411, 1.714631, 1.184124, 1, 1, 1, 1, 1,
0.5478522, 1.933816, -0.8830788, 1, 1, 1, 1, 1,
0.55141, 1.218627, 1.157717, 1, 1, 1, 1, 1,
0.5521573, 0.3824795, 1.039836, 1, 1, 1, 1, 1,
0.5560207, 0.4122508, 1.187829, 1, 1, 1, 1, 1,
0.5584585, -0.07422534, 1.000865, 1, 1, 1, 1, 1,
0.5585146, 0.3937572, 0.7793317, 0, 0, 1, 1, 1,
0.56016, -0.04841666, 2.350973, 1, 0, 0, 1, 1,
0.5614197, -0.4881619, 3.177671, 1, 0, 0, 1, 1,
0.5652276, 0.7053418, 1.388072, 1, 0, 0, 1, 1,
0.5677591, -0.3385329, 2.509804, 1, 0, 0, 1, 1,
0.5695983, 0.427143, 0.7248941, 1, 0, 0, 1, 1,
0.5709721, 0.5117043, 2.414795, 0, 0, 0, 1, 1,
0.5721524, 1.567266, -1.473439, 0, 0, 0, 1, 1,
0.5725974, 0.7056554, 1.340278, 0, 0, 0, 1, 1,
0.5791516, -1.260674, 2.90187, 0, 0, 0, 1, 1,
0.5852602, -0.3973745, 0.8227713, 0, 0, 0, 1, 1,
0.5853799, -0.277296, 2.562442, 0, 0, 0, 1, 1,
0.5918478, -0.7850799, 2.646661, 0, 0, 0, 1, 1,
0.5924668, -0.4353543, 1.727714, 1, 1, 1, 1, 1,
0.5950373, 0.2358265, -1.660471, 1, 1, 1, 1, 1,
0.6008817, -0.445522, 2.753445, 1, 1, 1, 1, 1,
0.6030902, -0.7211158, 3.359411, 1, 1, 1, 1, 1,
0.6080911, 0.1159956, 0.9955084, 1, 1, 1, 1, 1,
0.6118008, -0.4078489, 1.203341, 1, 1, 1, 1, 1,
0.6147513, -1.211697, 2.556789, 1, 1, 1, 1, 1,
0.6212888, 0.1276585, 1.511386, 1, 1, 1, 1, 1,
0.6216962, -1.237371, 2.00946, 1, 1, 1, 1, 1,
0.6225467, -0.1140688, 1.788042, 1, 1, 1, 1, 1,
0.6228952, 0.9555533, -0.09622481, 1, 1, 1, 1, 1,
0.625441, -0.9681706, 1.959344, 1, 1, 1, 1, 1,
0.6257904, 0.08000806, 2.388221, 1, 1, 1, 1, 1,
0.6278256, -0.01997185, 2.981769, 1, 1, 1, 1, 1,
0.6288238, 0.5565836, 0.3809521, 1, 1, 1, 1, 1,
0.6333981, -0.5771384, 3.04084, 0, 0, 1, 1, 1,
0.634202, -0.2184474, 2.304191, 1, 0, 0, 1, 1,
0.638877, 1.089731, 0.2992113, 1, 0, 0, 1, 1,
0.6420329, -0.4210433, 2.883234, 1, 0, 0, 1, 1,
0.644532, -0.9327337, 1.647484, 1, 0, 0, 1, 1,
0.6482245, 2.13233, -0.7450995, 1, 0, 0, 1, 1,
0.6492129, -0.8151035, 2.738549, 0, 0, 0, 1, 1,
0.6503075, 2.568197, 0.2763482, 0, 0, 0, 1, 1,
0.6507226, 1.224178, 0.8748364, 0, 0, 0, 1, 1,
0.6513391, 1.177904, 0.2945628, 0, 0, 0, 1, 1,
0.6573634, -0.9212039, 2.768853, 0, 0, 0, 1, 1,
0.6591051, 0.2957581, 0.9372147, 0, 0, 0, 1, 1,
0.6621898, -1.032897, 3.512987, 0, 0, 0, 1, 1,
0.6642088, -1.69264, 2.318692, 1, 1, 1, 1, 1,
0.664911, 0.2269732, 1.851173, 1, 1, 1, 1, 1,
0.6787579, 0.3436367, 1.795995, 1, 1, 1, 1, 1,
0.6800211, 0.7581181, 2.142034, 1, 1, 1, 1, 1,
0.6860713, 1.245593, 0.8712509, 1, 1, 1, 1, 1,
0.6880417, -2.232172, 2.435499, 1, 1, 1, 1, 1,
0.688338, -1.597399, 2.405945, 1, 1, 1, 1, 1,
0.6972263, 0.9482086, 2.086021, 1, 1, 1, 1, 1,
0.6975207, 0.6762065, 0.1096118, 1, 1, 1, 1, 1,
0.7050655, 0.08555032, 0.65475, 1, 1, 1, 1, 1,
0.7070353, 0.2631119, 2.010763, 1, 1, 1, 1, 1,
0.7084765, 1.217488, 0.2271437, 1, 1, 1, 1, 1,
0.7086376, 1.067242, 2.804058, 1, 1, 1, 1, 1,
0.7145618, 0.06868091, 1.540215, 1, 1, 1, 1, 1,
0.7154543, -0.9483898, 1.495652, 1, 1, 1, 1, 1,
0.7174514, -0.6640926, 1.199947, 0, 0, 1, 1, 1,
0.7175773, -0.02625537, 0.7897052, 1, 0, 0, 1, 1,
0.7179183, -0.1079951, 1.801894, 1, 0, 0, 1, 1,
0.7197909, -2.021925, 2.72661, 1, 0, 0, 1, 1,
0.7200058, -0.2941669, 0.9039294, 1, 0, 0, 1, 1,
0.7262694, 0.3620493, -0.1606279, 1, 0, 0, 1, 1,
0.7353112, -0.02180989, 2.953979, 0, 0, 0, 1, 1,
0.7372341, 0.3370058, 1.473723, 0, 0, 0, 1, 1,
0.7373416, 1.066846, 0.6919214, 0, 0, 0, 1, 1,
0.7418473, -0.567852, 3.142595, 0, 0, 0, 1, 1,
0.7500176, -0.548679, 2.144151, 0, 0, 0, 1, 1,
0.756439, 0.5243474, 1.122617, 0, 0, 0, 1, 1,
0.7584332, 1.040475, 1.926512, 0, 0, 0, 1, 1,
0.7598733, -0.197523, 1.450261, 1, 1, 1, 1, 1,
0.7600145, 1.532879, 1.362246, 1, 1, 1, 1, 1,
0.7634109, -0.3159599, 1.082168, 1, 1, 1, 1, 1,
0.7643166, 0.09872302, 0.157436, 1, 1, 1, 1, 1,
0.7645919, -0.7154042, 1.822558, 1, 1, 1, 1, 1,
0.772577, 1.319006, 1.045568, 1, 1, 1, 1, 1,
0.7732478, 1.123316, 0.9277073, 1, 1, 1, 1, 1,
0.7764247, -1.166262, 2.566344, 1, 1, 1, 1, 1,
0.7782964, -1.132692, 0.6308742, 1, 1, 1, 1, 1,
0.7829988, -0.9613424, 2.309278, 1, 1, 1, 1, 1,
0.7917084, 0.3126844, 1.652398, 1, 1, 1, 1, 1,
0.791721, 0.4697884, 1.629582, 1, 1, 1, 1, 1,
0.7995847, 0.1208889, 1.362832, 1, 1, 1, 1, 1,
0.800205, -0.5605493, 2.189797, 1, 1, 1, 1, 1,
0.8023766, 0.09458287, 1.46671, 1, 1, 1, 1, 1,
0.8034365, -2.232048, 4.319939, 0, 0, 1, 1, 1,
0.8049334, 1.024496, 0.5209247, 1, 0, 0, 1, 1,
0.8089715, 0.5531037, 1.228234, 1, 0, 0, 1, 1,
0.8092722, -1.735997, 2.91804, 1, 0, 0, 1, 1,
0.8183903, 0.329942, 0.2052985, 1, 0, 0, 1, 1,
0.8242239, 0.2763145, 0.6879492, 1, 0, 0, 1, 1,
0.827266, -0.8813341, 2.82147, 0, 0, 0, 1, 1,
0.8326336, 0.3959929, -0.7146249, 0, 0, 0, 1, 1,
0.8354011, -0.4101317, 1.798168, 0, 0, 0, 1, 1,
0.8392681, 1.61808, 0.5599028, 0, 0, 0, 1, 1,
0.8400977, -0.1773625, 1.482085, 0, 0, 0, 1, 1,
0.8448048, 0.8689384, 0.3039207, 0, 0, 0, 1, 1,
0.8526047, 1.505257, -1.078821, 0, 0, 0, 1, 1,
0.8529392, 1.339256, 0.7399448, 1, 1, 1, 1, 1,
0.8559467, 0.5975453, 0.4963854, 1, 1, 1, 1, 1,
0.8591418, 0.3151437, 1.612836, 1, 1, 1, 1, 1,
0.8760822, -0.4135182, 2.013798, 1, 1, 1, 1, 1,
0.8772942, -0.9721538, 3.1401, 1, 1, 1, 1, 1,
0.8795226, -0.1635698, 2.176476, 1, 1, 1, 1, 1,
0.8799753, -0.2739309, 2.185237, 1, 1, 1, 1, 1,
0.8834299, -1.376705, 3.374037, 1, 1, 1, 1, 1,
0.8845111, -1.986227, 1.750834, 1, 1, 1, 1, 1,
0.8893936, 0.09426533, 1.759537, 1, 1, 1, 1, 1,
0.8905661, -1.117989, 3.176776, 1, 1, 1, 1, 1,
0.8948236, -0.8037021, 1.477229, 1, 1, 1, 1, 1,
0.9044192, 0.1158818, 1.863734, 1, 1, 1, 1, 1,
0.9118797, -0.9018199, 3.791858, 1, 1, 1, 1, 1,
0.9277647, -0.7546163, 1.952047, 1, 1, 1, 1, 1,
0.9320868, -1.500338, 4.15211, 0, 0, 1, 1, 1,
0.9328874, -0.6956888, 2.514276, 1, 0, 0, 1, 1,
0.9339511, 1.643365, 0.9383968, 1, 0, 0, 1, 1,
0.9352539, -0.9505222, 1.72965, 1, 0, 0, 1, 1,
0.9423873, 0.2802762, 0.8393024, 1, 0, 0, 1, 1,
0.9594584, 1.003314, -0.5870839, 1, 0, 0, 1, 1,
0.9661392, -1.3918, 1.497228, 0, 0, 0, 1, 1,
0.967781, -0.1175711, 1.737436, 0, 0, 0, 1, 1,
0.977909, 1.710402, -0.1080537, 0, 0, 0, 1, 1,
0.9900185, -3.019519, 3.520013, 0, 0, 0, 1, 1,
0.9918462, -0.4103628, 2.492564, 0, 0, 0, 1, 1,
1.008802, -1.115693, 3.367927, 0, 0, 0, 1, 1,
1.011607, 0.6568329, 0.9363254, 0, 0, 0, 1, 1,
1.018139, 1.807193, 1.365459, 1, 1, 1, 1, 1,
1.024551, 0.817588, 1.249016, 1, 1, 1, 1, 1,
1.025184, -0.7886066, 1.840908, 1, 1, 1, 1, 1,
1.027887, -0.5247393, 1.557911, 1, 1, 1, 1, 1,
1.045507, 0.6607722, 1.180281, 1, 1, 1, 1, 1,
1.050187, -1.251766, 0.8344895, 1, 1, 1, 1, 1,
1.050561, 1.814543, 0.8421288, 1, 1, 1, 1, 1,
1.05063, 0.6800774, -0.05967028, 1, 1, 1, 1, 1,
1.051938, -0.1564414, 1.85112, 1, 1, 1, 1, 1,
1.058285, -0.0512233, 2.511822, 1, 1, 1, 1, 1,
1.059443, 0.8377445, 1.399121, 1, 1, 1, 1, 1,
1.059756, -0.2006289, 3.047753, 1, 1, 1, 1, 1,
1.0632, -0.07144199, 1.36166, 1, 1, 1, 1, 1,
1.066378, -0.2714493, 1.476011, 1, 1, 1, 1, 1,
1.068444, -1.417693, 1.454484, 1, 1, 1, 1, 1,
1.076835, -0.2912219, 1.374931, 0, 0, 1, 1, 1,
1.082518, -1.479433, 0.2755236, 1, 0, 0, 1, 1,
1.104621, 0.4170968, 2.296472, 1, 0, 0, 1, 1,
1.115145, 0.6392242, 3.151618, 1, 0, 0, 1, 1,
1.116787, -0.3355432, 1.151122, 1, 0, 0, 1, 1,
1.126578, 0.3779921, 1.019174, 1, 0, 0, 1, 1,
1.131539, -0.2888365, 1.589778, 0, 0, 0, 1, 1,
1.133082, 1.247652, 1.019614, 0, 0, 0, 1, 1,
1.13573, -0.112904, 3.451916, 0, 0, 0, 1, 1,
1.138433, 1.471347, 2.552464, 0, 0, 0, 1, 1,
1.147838, -0.7009702, 3.534914, 0, 0, 0, 1, 1,
1.154649, -0.455717, 2.757833, 0, 0, 0, 1, 1,
1.158698, 0.3271826, 1.289168, 0, 0, 0, 1, 1,
1.159662, -0.2311808, 3.24314, 1, 1, 1, 1, 1,
1.166431, 1.157027, -0.004991095, 1, 1, 1, 1, 1,
1.168336, 0.09138579, 1.645687, 1, 1, 1, 1, 1,
1.169345, 0.5340943, 0.9722292, 1, 1, 1, 1, 1,
1.174041, -0.4182603, 1.837974, 1, 1, 1, 1, 1,
1.178489, 0.4638146, 0.5157419, 1, 1, 1, 1, 1,
1.179008, 0.2941085, 2.350691, 1, 1, 1, 1, 1,
1.184113, 0.03529685, 2.721527, 1, 1, 1, 1, 1,
1.186661, -0.4922411, 1.261913, 1, 1, 1, 1, 1,
1.189018, 0.3085215, 2.426358, 1, 1, 1, 1, 1,
1.189804, -1.492278, 3.201903, 1, 1, 1, 1, 1,
1.222384, -1.451617, 3.768847, 1, 1, 1, 1, 1,
1.224825, -1.23487, 1.702535, 1, 1, 1, 1, 1,
1.226797, 0.7442827, -0.5034587, 1, 1, 1, 1, 1,
1.231532, -0.2833994, 1.256178, 1, 1, 1, 1, 1,
1.23485, 1.298007, 1.255666, 0, 0, 1, 1, 1,
1.241746, -1.332212, 1.713874, 1, 0, 0, 1, 1,
1.247051, -0.9247319, 2.58843, 1, 0, 0, 1, 1,
1.268497, 0.4570894, 0.2564856, 1, 0, 0, 1, 1,
1.271701, 0.6017858, 1.316603, 1, 0, 0, 1, 1,
1.273323, -1.606522, 4.416428, 1, 0, 0, 1, 1,
1.274263, 0.1741433, 1.875722, 0, 0, 0, 1, 1,
1.278093, 0.366983, 1.370407, 0, 0, 0, 1, 1,
1.283361, -0.2197327, 2.33106, 0, 0, 0, 1, 1,
1.284164, 2.121258, -0.2394343, 0, 0, 0, 1, 1,
1.286034, -1.068013, 2.327848, 0, 0, 0, 1, 1,
1.286482, -0.4300874, 3.219533, 0, 0, 0, 1, 1,
1.298803, 0.2668919, 0.5304068, 0, 0, 0, 1, 1,
1.309106, 1.861701, 1.00797, 1, 1, 1, 1, 1,
1.313623, 1.244777, 2.211125, 1, 1, 1, 1, 1,
1.315123, 0.3138168, 0.6599898, 1, 1, 1, 1, 1,
1.315936, -1.471555, 1.674961, 1, 1, 1, 1, 1,
1.32002, -0.04619818, 3.394215, 1, 1, 1, 1, 1,
1.322048, 2.138044, 2.056859, 1, 1, 1, 1, 1,
1.326852, -1.214079, 3.142507, 1, 1, 1, 1, 1,
1.331988, -1.024834, 2.30853, 1, 1, 1, 1, 1,
1.338306, 1.170321, 1.734709, 1, 1, 1, 1, 1,
1.343148, 1.836675, 0.0747195, 1, 1, 1, 1, 1,
1.348395, 0.165609, 1.148551, 1, 1, 1, 1, 1,
1.359116, -1.317478, 0.5691181, 1, 1, 1, 1, 1,
1.361525, 0.3620235, 3.283386, 1, 1, 1, 1, 1,
1.380816, 0.5797793, 0.8334957, 1, 1, 1, 1, 1,
1.383768, 0.8413066, -0.8358623, 1, 1, 1, 1, 1,
1.386711, -0.3873053, 0.8611735, 0, 0, 1, 1, 1,
1.390042, 0.6151071, 1.294316, 1, 0, 0, 1, 1,
1.391162, -1.061804, 1.837445, 1, 0, 0, 1, 1,
1.392215, 0.04944647, -0.1291583, 1, 0, 0, 1, 1,
1.394304, 0.4919832, 1.691783, 1, 0, 0, 1, 1,
1.39495, 1.312581, -0.6272039, 1, 0, 0, 1, 1,
1.398557, 0.4176013, 0.7695606, 0, 0, 0, 1, 1,
1.407299, 1.624665, 0.09035143, 0, 0, 0, 1, 1,
1.413013, -0.06048241, 2.08625, 0, 0, 0, 1, 1,
1.431191, -2.237397, 2.952996, 0, 0, 0, 1, 1,
1.432667, 0.6431699, 0.2804371, 0, 0, 0, 1, 1,
1.437455, -0.1689975, 1.536167, 0, 0, 0, 1, 1,
1.439408, 1.827453, 0.6715879, 0, 0, 0, 1, 1,
1.457591, 0.040247, 1.226099, 1, 1, 1, 1, 1,
1.466795, 0.2331207, 2.382104, 1, 1, 1, 1, 1,
1.480782, 1.601056, -0.2811063, 1, 1, 1, 1, 1,
1.492306, 1.188045, 3.325686, 1, 1, 1, 1, 1,
1.497393, 0.5955077, 2.246148, 1, 1, 1, 1, 1,
1.500349, -0.3062643, 0.4480204, 1, 1, 1, 1, 1,
1.511437, -0.9400545, 3.09624, 1, 1, 1, 1, 1,
1.520405, 0.9794049, 1.264356, 1, 1, 1, 1, 1,
1.522603, 1.379127, 1.684259, 1, 1, 1, 1, 1,
1.52525, 1.187582, 0.2885515, 1, 1, 1, 1, 1,
1.537738, 0.6698048, 3.007627, 1, 1, 1, 1, 1,
1.544061, 0.4169718, 1.83475, 1, 1, 1, 1, 1,
1.544788, -0.7307763, 3.404209, 1, 1, 1, 1, 1,
1.55445, -1.623093, 2.910883, 1, 1, 1, 1, 1,
1.556184, 1.052497, 2.347872, 1, 1, 1, 1, 1,
1.560639, -1.151398, -0.8075574, 0, 0, 1, 1, 1,
1.569755, 0.2174405, 3.250901, 1, 0, 0, 1, 1,
1.578535, 0.1482831, 1.340913, 1, 0, 0, 1, 1,
1.583085, -1.530573, 0.8331708, 1, 0, 0, 1, 1,
1.599181, 0.6264572, 0.1371352, 1, 0, 0, 1, 1,
1.608403, 0.9132764, 0.217711, 1, 0, 0, 1, 1,
1.621326, -1.871733, 1.16814, 0, 0, 0, 1, 1,
1.648761, -0.9493775, 1.606996, 0, 0, 0, 1, 1,
1.651102, -0.5894497, 0.3018023, 0, 0, 0, 1, 1,
1.659954, 0.08999909, 1.70289, 0, 0, 0, 1, 1,
1.682455, 1.472701, 1.48032, 0, 0, 0, 1, 1,
1.689867, 1.058006, 0.5637498, 0, 0, 0, 1, 1,
1.717235, 0.08947811, 1.957484, 0, 0, 0, 1, 1,
1.731007, -1.021482, 0.7988992, 1, 1, 1, 1, 1,
1.743074, 1.708359, -0.8754009, 1, 1, 1, 1, 1,
1.754563, -1.404193, 2.557597, 1, 1, 1, 1, 1,
1.767845, -0.05165321, 0.649554, 1, 1, 1, 1, 1,
1.801525, 0.7286445, 2.408513, 1, 1, 1, 1, 1,
1.852146, 0.3727766, 1.109673, 1, 1, 1, 1, 1,
1.859245, 1.497129, -0.6909595, 1, 1, 1, 1, 1,
1.901257, 0.04767463, 2.024874, 1, 1, 1, 1, 1,
1.905835, 0.5559241, -0.1030957, 1, 1, 1, 1, 1,
1.920461, 0.07415218, 1.814576, 1, 1, 1, 1, 1,
1.932844, -0.2585533, 2.534331, 1, 1, 1, 1, 1,
1.933355, -0.2728136, 0.8312454, 1, 1, 1, 1, 1,
1.943622, 1.752988, -0.8473916, 1, 1, 1, 1, 1,
1.957703, 1.818012, -0.001730107, 1, 1, 1, 1, 1,
2.027323, -1.369537, 3.828851, 1, 1, 1, 1, 1,
2.028813, 0.3438898, 0.5615627, 0, 0, 1, 1, 1,
2.072329, 0.4173771, 2.332293, 1, 0, 0, 1, 1,
2.104853, 0.3483888, 1.126346, 1, 0, 0, 1, 1,
2.164465, 0.559521, 0.4599271, 1, 0, 0, 1, 1,
2.185621, 0.9251094, -0.575303, 1, 0, 0, 1, 1,
2.194991, 0.8830858, 0.9559289, 1, 0, 0, 1, 1,
2.228979, 2.063317, 0.854881, 0, 0, 0, 1, 1,
2.230319, 0.8751979, 1.573019, 0, 0, 0, 1, 1,
2.306898, -0.9252735, 1.682404, 0, 0, 0, 1, 1,
2.311987, -1.196333, 1.831691, 0, 0, 0, 1, 1,
2.346022, 0.1020605, 2.385072, 0, 0, 0, 1, 1,
2.366287, -0.4423774, 1.675403, 0, 0, 0, 1, 1,
2.373783, -2.056631, 2.358893, 0, 0, 0, 1, 1,
2.397403, -2.301175, 2.843366, 1, 1, 1, 1, 1,
2.513833, -0.07517429, 0.4638263, 1, 1, 1, 1, 1,
2.520636, -1.680446, 2.987769, 1, 1, 1, 1, 1,
2.797662, 0.4591937, 2.349064, 1, 1, 1, 1, 1,
2.933264, -0.9978457, 2.198984, 1, 1, 1, 1, 1,
3.114274, -1.084207, 2.3368, 1, 1, 1, 1, 1,
3.149391, 1.01123, 2.198127, 1, 1, 1, 1, 1
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
var radius = 9.187719;
var distance = 32.27148;
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
mvMatrix.translate( 0.3396561, 0.05133212, -0.02487707 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.27148);
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