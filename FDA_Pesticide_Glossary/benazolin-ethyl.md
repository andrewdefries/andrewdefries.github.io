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
-3.416648, -0.2109995, -0.5847826, 1, 0, 0, 1,
-3.292525, 0.6522459, 0.04722008, 1, 0.007843138, 0, 1,
-3.226254, -0.1176647, -3.692719, 1, 0.01176471, 0, 1,
-2.76074, -0.3014071, -1.018999, 1, 0.01960784, 0, 1,
-2.638437, 1.582235, -0.3239596, 1, 0.02352941, 0, 1,
-2.615206, 0.4767153, -2.247997, 1, 0.03137255, 0, 1,
-2.537452, 1.125178, -0.9286686, 1, 0.03529412, 0, 1,
-2.506751, -0.921932, -2.354412, 1, 0.04313726, 0, 1,
-2.500696, -1.247048, -1.945549, 1, 0.04705882, 0, 1,
-2.466457, -0.2153953, -0.7921836, 1, 0.05490196, 0, 1,
-2.356237, 0.3760364, -2.065221, 1, 0.05882353, 0, 1,
-2.291629, -1.583297, -2.684901, 1, 0.06666667, 0, 1,
-2.273358, -0.4629984, -2.108568, 1, 0.07058824, 0, 1,
-2.257273, -0.9786478, -2.973142, 1, 0.07843138, 0, 1,
-2.252732, -0.07474364, -2.351441, 1, 0.08235294, 0, 1,
-2.219873, -0.9192962, -2.668318, 1, 0.09019608, 0, 1,
-2.184165, 2.008929, -0.9879066, 1, 0.09411765, 0, 1,
-2.178859, -0.04066989, -0.6036432, 1, 0.1019608, 0, 1,
-2.166657, -1.789717, -2.262225, 1, 0.1098039, 0, 1,
-2.086025, 0.5426458, -1.035925, 1, 0.1137255, 0, 1,
-2.081784, 0.8964133, -1.798136, 1, 0.1215686, 0, 1,
-2.060111, -0.2278375, -2.536444, 1, 0.1254902, 0, 1,
-2.016664, -0.6729457, -2.397387, 1, 0.1333333, 0, 1,
-2.013139, 0.00167693, -1.997163, 1, 0.1372549, 0, 1,
-2.004611, 0.6663315, -2.212189, 1, 0.145098, 0, 1,
-1.963885, -0.5503251, -2.545496, 1, 0.1490196, 0, 1,
-1.953862, -0.6927679, -0.7087919, 1, 0.1568628, 0, 1,
-1.944115, 0.523986, -0.8877101, 1, 0.1607843, 0, 1,
-1.943937, 0.3596258, -1.825211, 1, 0.1686275, 0, 1,
-1.940081, -0.5155624, -3.486583, 1, 0.172549, 0, 1,
-1.939354, 2.071435, -0.1120595, 1, 0.1803922, 0, 1,
-1.925373, 0.7294028, -1.652257, 1, 0.1843137, 0, 1,
-1.863038, -0.007186479, -2.722363, 1, 0.1921569, 0, 1,
-1.853255, 1.631569, -0.6460747, 1, 0.1960784, 0, 1,
-1.852135, -1.117306, -1.799943, 1, 0.2039216, 0, 1,
-1.841688, -1.278654, -2.076036, 1, 0.2117647, 0, 1,
-1.798628, -0.3229772, -2.777467, 1, 0.2156863, 0, 1,
-1.787582, 0.5985168, -1.792096, 1, 0.2235294, 0, 1,
-1.780677, 0.6754144, 0.1371451, 1, 0.227451, 0, 1,
-1.715324, 0.9696167, -1.264008, 1, 0.2352941, 0, 1,
-1.707716, 0.1772864, -0.2354692, 1, 0.2392157, 0, 1,
-1.696848, -0.02205747, -1.383403, 1, 0.2470588, 0, 1,
-1.656508, 0.7765871, 0.8430229, 1, 0.2509804, 0, 1,
-1.642403, 0.8163485, -2.396848, 1, 0.2588235, 0, 1,
-1.640772, 1.619867, -0.4445864, 1, 0.2627451, 0, 1,
-1.638601, -0.5086969, -1.677494, 1, 0.2705882, 0, 1,
-1.619636, 0.508649, -1.266216, 1, 0.2745098, 0, 1,
-1.616424, -1.055154, -0.8825476, 1, 0.282353, 0, 1,
-1.61226, -0.4264306, -3.565185, 1, 0.2862745, 0, 1,
-1.609717, 0.5410672, -1.402126, 1, 0.2941177, 0, 1,
-1.609326, 0.2009343, -2.582253, 1, 0.3019608, 0, 1,
-1.606037, -0.2154142, -0.712048, 1, 0.3058824, 0, 1,
-1.596295, 0.08277291, -0.9958555, 1, 0.3137255, 0, 1,
-1.585053, 0.4792026, -1.733419, 1, 0.3176471, 0, 1,
-1.573029, -0.7715625, -1.790455, 1, 0.3254902, 0, 1,
-1.562974, 1.045057, 0.3156619, 1, 0.3294118, 0, 1,
-1.54185, 0.6531042, -0.7648196, 1, 0.3372549, 0, 1,
-1.538466, -0.9307574, -3.17099, 1, 0.3411765, 0, 1,
-1.491867, -0.7651715, -0.5756402, 1, 0.3490196, 0, 1,
-1.480068, -0.3490276, -1.581207, 1, 0.3529412, 0, 1,
-1.479605, 1.448699, -2.388792, 1, 0.3607843, 0, 1,
-1.475185, 0.6927418, -2.763329, 1, 0.3647059, 0, 1,
-1.460391, -0.731817, -3.658172, 1, 0.372549, 0, 1,
-1.458114, 0.2420713, -2.743647, 1, 0.3764706, 0, 1,
-1.457474, -0.1805894, -1.071239, 1, 0.3843137, 0, 1,
-1.454821, -0.3086608, -1.922339, 1, 0.3882353, 0, 1,
-1.453774, 2.068185, -0.405865, 1, 0.3960784, 0, 1,
-1.444105, -0.2143865, -1.280517, 1, 0.4039216, 0, 1,
-1.433036, 0.2748804, -1.46969, 1, 0.4078431, 0, 1,
-1.432707, -0.4592139, -1.719185, 1, 0.4156863, 0, 1,
-1.431041, 0.1232633, -1.995097, 1, 0.4196078, 0, 1,
-1.428324, 1.64422, -1.361453, 1, 0.427451, 0, 1,
-1.417157, 0.4211679, -0.3490223, 1, 0.4313726, 0, 1,
-1.413877, -0.3028959, -2.159752, 1, 0.4392157, 0, 1,
-1.406795, -1.036014, -3.790842, 1, 0.4431373, 0, 1,
-1.404537, -1.960567, -1.728647, 1, 0.4509804, 0, 1,
-1.401959, 0.6511964, -3.545857, 1, 0.454902, 0, 1,
-1.399207, 0.3056891, -0.9653921, 1, 0.4627451, 0, 1,
-1.397394, 0.5943518, -0.9519925, 1, 0.4666667, 0, 1,
-1.396652, -0.4003955, -1.43224, 1, 0.4745098, 0, 1,
-1.385252, 2.140062, -1.258224, 1, 0.4784314, 0, 1,
-1.380795, 0.8316998, -1.25808, 1, 0.4862745, 0, 1,
-1.371434, 1.225442, -0.2791312, 1, 0.4901961, 0, 1,
-1.3522, 1.181236, -1.614514, 1, 0.4980392, 0, 1,
-1.350711, -0.2714402, -2.687993, 1, 0.5058824, 0, 1,
-1.350684, 0.3287665, -2.065472, 1, 0.509804, 0, 1,
-1.344326, -2.12665, -2.595025, 1, 0.5176471, 0, 1,
-1.343486, 0.8752111, -1.168547, 1, 0.5215687, 0, 1,
-1.333552, 1.073741, -0.08039878, 1, 0.5294118, 0, 1,
-1.329504, -0.5385801, 0.6979455, 1, 0.5333334, 0, 1,
-1.32656, 1.410857, 2.386977, 1, 0.5411765, 0, 1,
-1.323024, -0.3718775, -1.944754, 1, 0.5450981, 0, 1,
-1.321005, -0.503692, -4.232898, 1, 0.5529412, 0, 1,
-1.319475, 0.2500583, -0.004345325, 1, 0.5568628, 0, 1,
-1.319469, 0.3279414, -2.501593, 1, 0.5647059, 0, 1,
-1.313194, 0.1581654, -1.659037, 1, 0.5686275, 0, 1,
-1.313065, 1.032805, -2.802406, 1, 0.5764706, 0, 1,
-1.310377, 0.7775872, -2.718586, 1, 0.5803922, 0, 1,
-1.310159, 0.4943076, -0.8255554, 1, 0.5882353, 0, 1,
-1.300829, -0.6439162, -0.7476552, 1, 0.5921569, 0, 1,
-1.29835, -0.2944489, -1.518835, 1, 0.6, 0, 1,
-1.28332, -0.6926903, -3.639883, 1, 0.6078432, 0, 1,
-1.280975, 1.195924, -1.705739, 1, 0.6117647, 0, 1,
-1.276652, -0.8276977, -1.644029, 1, 0.6196079, 0, 1,
-1.262702, 1.414031, 0.08506095, 1, 0.6235294, 0, 1,
-1.261817, 0.09860967, -0.1465938, 1, 0.6313726, 0, 1,
-1.239729, -0.5415077, -0.8247588, 1, 0.6352941, 0, 1,
-1.230369, -0.222869, -1.600796, 1, 0.6431373, 0, 1,
-1.225898, -1.290942, -0.6437548, 1, 0.6470588, 0, 1,
-1.224803, 0.01551798, -1.214218, 1, 0.654902, 0, 1,
-1.222763, -1.187064, -2.401748, 1, 0.6588235, 0, 1,
-1.220421, 0.8877445, 1.449678, 1, 0.6666667, 0, 1,
-1.214494, -0.9044639, -2.634492, 1, 0.6705883, 0, 1,
-1.210551, -0.4001954, -0.86044, 1, 0.6784314, 0, 1,
-1.20966, 0.6267768, -1.347269, 1, 0.682353, 0, 1,
-1.202738, 0.2681225, 0.05071518, 1, 0.6901961, 0, 1,
-1.193667, -0.9888153, -3.070379, 1, 0.6941177, 0, 1,
-1.18661, -1.096415, -1.580916, 1, 0.7019608, 0, 1,
-1.166106, -1.026716, -1.066117, 1, 0.7098039, 0, 1,
-1.165215, -0.01693917, -0.9353434, 1, 0.7137255, 0, 1,
-1.162622, -0.7672979, -3.307207, 1, 0.7215686, 0, 1,
-1.159898, 0.9882795, -1.816601, 1, 0.7254902, 0, 1,
-1.158062, 0.8949943, -1.156546, 1, 0.7333333, 0, 1,
-1.154531, -1.32392, -1.475558, 1, 0.7372549, 0, 1,
-1.153816, 1.616433, -0.1085571, 1, 0.7450981, 0, 1,
-1.144675, -0.5803109, -1.258053, 1, 0.7490196, 0, 1,
-1.14081, 0.9031051, 0.06878361, 1, 0.7568628, 0, 1,
-1.135525, 0.4755934, -2.262118, 1, 0.7607843, 0, 1,
-1.126602, -0.8929902, -4.023621, 1, 0.7686275, 0, 1,
-1.12158, -1.245887, -1.603647, 1, 0.772549, 0, 1,
-1.111426, -0.7786463, -1.959495, 1, 0.7803922, 0, 1,
-1.111045, 0.9803717, -0.9021982, 1, 0.7843137, 0, 1,
-1.106511, -1.158552, -2.562762, 1, 0.7921569, 0, 1,
-1.103531, 0.2449961, -0.3322951, 1, 0.7960784, 0, 1,
-1.101194, -0.4581685, -2.253, 1, 0.8039216, 0, 1,
-1.094053, -1.604322, -2.531419, 1, 0.8117647, 0, 1,
-1.093013, -0.2658065, -2.302012, 1, 0.8156863, 0, 1,
-1.090202, 1.243407, -1.013969, 1, 0.8235294, 0, 1,
-1.080933, 1.254707, 0.1273099, 1, 0.827451, 0, 1,
-1.076865, 0.4899904, -2.478369, 1, 0.8352941, 0, 1,
-1.073612, -1.353305, -2.92957, 1, 0.8392157, 0, 1,
-1.066955, 0.6936027, -1.077113, 1, 0.8470588, 0, 1,
-1.057908, -0.3050237, -2.584445, 1, 0.8509804, 0, 1,
-1.055606, 0.3159999, -2.426314, 1, 0.8588235, 0, 1,
-1.050376, 0.1829673, -2.235315, 1, 0.8627451, 0, 1,
-1.047646, 0.692607, -1.659214, 1, 0.8705882, 0, 1,
-1.042705, 0.2232362, -0.6943702, 1, 0.8745098, 0, 1,
-1.042215, -0.7401497, -0.8013427, 1, 0.8823529, 0, 1,
-1.038036, -0.1470282, -0.4324088, 1, 0.8862745, 0, 1,
-1.036086, 0.6780279, -0.5487084, 1, 0.8941177, 0, 1,
-1.033718, -0.09959448, -1.731583, 1, 0.8980392, 0, 1,
-1.025184, -1.65494, -3.132667, 1, 0.9058824, 0, 1,
-1.015896, -1.316777, -2.634012, 1, 0.9137255, 0, 1,
-1.01283, 0.117365, 0.3455403, 1, 0.9176471, 0, 1,
-1.012816, -0.1334525, -0.3681788, 1, 0.9254902, 0, 1,
-1.010161, -1.400465, -3.642333, 1, 0.9294118, 0, 1,
-1.007199, -0.7065924, -3.748263, 1, 0.9372549, 0, 1,
-1.006511, 0.5015923, -3.21582, 1, 0.9411765, 0, 1,
-1.004556, 1.93046, -0.3278956, 1, 0.9490196, 0, 1,
-1.002278, -1.719824, -3.30963, 1, 0.9529412, 0, 1,
-1.000451, -0.1609506, -1.473911, 1, 0.9607843, 0, 1,
-0.9986005, 1.887178, -0.231017, 1, 0.9647059, 0, 1,
-0.9981002, -1.89487, -2.325669, 1, 0.972549, 0, 1,
-0.9947577, 0.9427934, 0.08803491, 1, 0.9764706, 0, 1,
-0.9919936, 0.1156458, -0.7173034, 1, 0.9843137, 0, 1,
-0.9786879, 1.320905, -0.2846619, 1, 0.9882353, 0, 1,
-0.9762818, -1.468963, -1.221337, 1, 0.9960784, 0, 1,
-0.9728944, 0.09100544, -2.833238, 0.9960784, 1, 0, 1,
-0.9673265, 0.57751, -2.542799, 0.9921569, 1, 0, 1,
-0.9669718, 1.648981, -0.3041274, 0.9843137, 1, 0, 1,
-0.9651136, 0.6004868, -1.358966, 0.9803922, 1, 0, 1,
-0.96332, -0.09618737, -1.876781, 0.972549, 1, 0, 1,
-0.9547502, 0.7199041, -0.238041, 0.9686275, 1, 0, 1,
-0.9498985, -0.1599136, -1.552079, 0.9607843, 1, 0, 1,
-0.9492896, -1.506408, -1.786031, 0.9568627, 1, 0, 1,
-0.9492305, 0.7891431, 0.08662667, 0.9490196, 1, 0, 1,
-0.9401981, 2.053328, 0.4094127, 0.945098, 1, 0, 1,
-0.9339332, 0.540998, -0.7428319, 0.9372549, 1, 0, 1,
-0.9259365, 0.2679836, -0.7200375, 0.9333333, 1, 0, 1,
-0.9177296, 1.475695, -1.537129, 0.9254902, 1, 0, 1,
-0.9132715, 0.5118773, -1.535995, 0.9215686, 1, 0, 1,
-0.9126929, -0.2255294, -0.1411724, 0.9137255, 1, 0, 1,
-0.9080447, 1.487528, -2.039733, 0.9098039, 1, 0, 1,
-0.9077077, 0.6592978, -0.4046643, 0.9019608, 1, 0, 1,
-0.9073092, -0.288661, -2.903862, 0.8941177, 1, 0, 1,
-0.9059097, 1.801034, 0.6294244, 0.8901961, 1, 0, 1,
-0.9048097, -0.7274483, -1.458803, 0.8823529, 1, 0, 1,
-0.8991195, -2.121839, -2.738721, 0.8784314, 1, 0, 1,
-0.8954321, -0.1449972, -3.143574, 0.8705882, 1, 0, 1,
-0.8927341, 0.5247196, -3.028048, 0.8666667, 1, 0, 1,
-0.8927182, -1.163514, -3.090949, 0.8588235, 1, 0, 1,
-0.8906159, 0.1849352, -1.580683, 0.854902, 1, 0, 1,
-0.8850081, 0.5805591, -2.699479, 0.8470588, 1, 0, 1,
-0.8824661, -1.038447, -2.353284, 0.8431373, 1, 0, 1,
-0.8732181, 1.895653, 0.4771901, 0.8352941, 1, 0, 1,
-0.8713729, -1.012612, -1.9153, 0.8313726, 1, 0, 1,
-0.8624884, 1.704069, -0.4891301, 0.8235294, 1, 0, 1,
-0.8623807, 0.6838319, -1.452512, 0.8196079, 1, 0, 1,
-0.8623619, -0.1953156, -1.448681, 0.8117647, 1, 0, 1,
-0.8613905, 0.4338214, -0.9155766, 0.8078431, 1, 0, 1,
-0.8564817, 0.1998429, -1.634622, 0.8, 1, 0, 1,
-0.85329, -0.1985851, -2.199192, 0.7921569, 1, 0, 1,
-0.8498591, 0.6494857, -1.154917, 0.7882353, 1, 0, 1,
-0.8463774, 1.123578, -0.8440161, 0.7803922, 1, 0, 1,
-0.8463271, 0.7002712, 0.1265898, 0.7764706, 1, 0, 1,
-0.8409876, -1.243609, -2.577898, 0.7686275, 1, 0, 1,
-0.8363888, -0.3985839, -2.356939, 0.7647059, 1, 0, 1,
-0.8276967, 1.274913, -2.042364, 0.7568628, 1, 0, 1,
-0.8276349, 0.9576837, -0.8355208, 0.7529412, 1, 0, 1,
-0.8273031, 0.7951146, -1.009382, 0.7450981, 1, 0, 1,
-0.8258182, 1.54418, -0.9812562, 0.7411765, 1, 0, 1,
-0.823243, 0.6166965, 1.371618, 0.7333333, 1, 0, 1,
-0.818208, 1.817389, 0.7671674, 0.7294118, 1, 0, 1,
-0.8167799, -0.5937829, -3.087054, 0.7215686, 1, 0, 1,
-0.8114957, 1.893218, 1.74673, 0.7176471, 1, 0, 1,
-0.8100519, 1.520696, -0.04143145, 0.7098039, 1, 0, 1,
-0.8044213, 0.3904144, -0.6012396, 0.7058824, 1, 0, 1,
-0.797469, 0.4209612, -1.076103, 0.6980392, 1, 0, 1,
-0.7949392, 1.594231, -0.1790199, 0.6901961, 1, 0, 1,
-0.7916373, 0.4626285, -1.709807, 0.6862745, 1, 0, 1,
-0.7910327, 0.2589827, -2.104268, 0.6784314, 1, 0, 1,
-0.7903047, -0.8073402, -2.553315, 0.6745098, 1, 0, 1,
-0.7874765, -0.1607945, -2.658236, 0.6666667, 1, 0, 1,
-0.7732849, -1.366054, -2.709057, 0.6627451, 1, 0, 1,
-0.7708379, -1.249342, -1.10517, 0.654902, 1, 0, 1,
-0.7703785, -0.130468, -2.263586, 0.6509804, 1, 0, 1,
-0.7677979, 1.010799, -0.7624757, 0.6431373, 1, 0, 1,
-0.7661424, 0.2827174, -0.4734773, 0.6392157, 1, 0, 1,
-0.7620443, 0.1493325, -1.309969, 0.6313726, 1, 0, 1,
-0.759317, 0.8627595, 0.5689247, 0.627451, 1, 0, 1,
-0.7587976, -0.9846654, -2.312464, 0.6196079, 1, 0, 1,
-0.7579302, 0.3987515, -2.039133, 0.6156863, 1, 0, 1,
-0.755228, -1.576028, -4.915792, 0.6078432, 1, 0, 1,
-0.7507433, -0.6390499, -1.773941, 0.6039216, 1, 0, 1,
-0.7493683, 1.160056, -0.7664178, 0.5960785, 1, 0, 1,
-0.7471994, 0.6929132, -2.550486, 0.5882353, 1, 0, 1,
-0.7422737, 1.173307, -0.9565139, 0.5843138, 1, 0, 1,
-0.7398162, 0.2139044, -1.332744, 0.5764706, 1, 0, 1,
-0.7358316, -0.6171876, -2.484904, 0.572549, 1, 0, 1,
-0.7353979, 0.9146433, -1.533949, 0.5647059, 1, 0, 1,
-0.7343779, -3.713701, -3.080015, 0.5607843, 1, 0, 1,
-0.7294534, -1.257298, -2.145934, 0.5529412, 1, 0, 1,
-0.7283233, -1.462335, -1.13838, 0.5490196, 1, 0, 1,
-0.7279402, 0.38744, -1.186113, 0.5411765, 1, 0, 1,
-0.7263923, 1.1201, -0.1265966, 0.5372549, 1, 0, 1,
-0.7258488, -0.06590156, -2.601366, 0.5294118, 1, 0, 1,
-0.717212, -1.288453, -2.734557, 0.5254902, 1, 0, 1,
-0.7134525, -0.6273997, -2.197938, 0.5176471, 1, 0, 1,
-0.7109011, 0.2566691, -0.1423104, 0.5137255, 1, 0, 1,
-0.7101248, 0.0192327, -0.8124102, 0.5058824, 1, 0, 1,
-0.704298, -1.271335, -1.33142, 0.5019608, 1, 0, 1,
-0.7036836, -0.1531918, -2.258689, 0.4941176, 1, 0, 1,
-0.6993358, -1.091554, -2.272093, 0.4862745, 1, 0, 1,
-0.6932203, -0.04788666, -1.599186, 0.4823529, 1, 0, 1,
-0.6930916, 0.3344076, -1.192271, 0.4745098, 1, 0, 1,
-0.6911648, -0.7955678, -1.549755, 0.4705882, 1, 0, 1,
-0.6903507, -0.6353745, -2.626202, 0.4627451, 1, 0, 1,
-0.6889627, -0.4375842, -3.019706, 0.4588235, 1, 0, 1,
-0.684602, 0.9725018, -0.7775291, 0.4509804, 1, 0, 1,
-0.6824307, -0.1634132, -2.99014, 0.4470588, 1, 0, 1,
-0.6797727, -1.778292, -3.899253, 0.4392157, 1, 0, 1,
-0.6779659, -0.9186738, -2.334159, 0.4352941, 1, 0, 1,
-0.6777085, 2.084359, -1.069163, 0.427451, 1, 0, 1,
-0.6719774, 0.02727932, -0.1123534, 0.4235294, 1, 0, 1,
-0.6692129, -0.1273694, -0.6853558, 0.4156863, 1, 0, 1,
-0.6689194, 0.324737, -2.370642, 0.4117647, 1, 0, 1,
-0.6674656, -0.05114571, 0.1544763, 0.4039216, 1, 0, 1,
-0.6669072, 0.5212517, -1.736481, 0.3960784, 1, 0, 1,
-0.6650451, 0.6706978, 0.6090449, 0.3921569, 1, 0, 1,
-0.6638629, 0.2575238, -1.861115, 0.3843137, 1, 0, 1,
-0.6499271, 0.1920107, -1.199951, 0.3803922, 1, 0, 1,
-0.6380687, -0.8989766, -1.85958, 0.372549, 1, 0, 1,
-0.6357707, 0.006908432, 0.3271367, 0.3686275, 1, 0, 1,
-0.6314905, -2.047444, -1.704334, 0.3607843, 1, 0, 1,
-0.6277988, -1.12888, -2.949586, 0.3568628, 1, 0, 1,
-0.6260855, 2.045732, 1.886793, 0.3490196, 1, 0, 1,
-0.6249871, -0.7607301, -0.4120714, 0.345098, 1, 0, 1,
-0.6243935, -0.1377603, -3.075466, 0.3372549, 1, 0, 1,
-0.6237864, -1.367759, -2.715217, 0.3333333, 1, 0, 1,
-0.6231826, 1.861693, 1.56121, 0.3254902, 1, 0, 1,
-0.6222264, -1.091147, -2.142112, 0.3215686, 1, 0, 1,
-0.6214294, -0.3469658, -3.193134, 0.3137255, 1, 0, 1,
-0.6210335, 0.4332689, 0.684951, 0.3098039, 1, 0, 1,
-0.6152218, 0.7983254, -1.24585, 0.3019608, 1, 0, 1,
-0.610727, 0.2389303, -2.028073, 0.2941177, 1, 0, 1,
-0.6092626, 0.588228, -0.34399, 0.2901961, 1, 0, 1,
-0.6050338, 0.7910928, -1.36413, 0.282353, 1, 0, 1,
-0.602814, -0.06049268, -1.98871, 0.2784314, 1, 0, 1,
-0.6009578, -0.9975888, -2.057589, 0.2705882, 1, 0, 1,
-0.6003243, -1.550993, -2.293205, 0.2666667, 1, 0, 1,
-0.5984725, -0.1650343, -1.37886, 0.2588235, 1, 0, 1,
-0.5982422, -0.1814469, -2.532573, 0.254902, 1, 0, 1,
-0.5970547, -1.379849, -4.01521, 0.2470588, 1, 0, 1,
-0.5933563, -0.8792983, -2.711954, 0.2431373, 1, 0, 1,
-0.5923573, -0.1457975, -0.5888275, 0.2352941, 1, 0, 1,
-0.5843667, -0.93704, -4.041372, 0.2313726, 1, 0, 1,
-0.5825768, 1.270844, -0.5166481, 0.2235294, 1, 0, 1,
-0.5811399, -0.9314418, -1.28593, 0.2196078, 1, 0, 1,
-0.5803085, -0.9788509, -3.174507, 0.2117647, 1, 0, 1,
-0.5778972, 0.9567441, 0.2622913, 0.2078431, 1, 0, 1,
-0.5765566, -0.6766835, -2.748764, 0.2, 1, 0, 1,
-0.5756922, 0.1093156, 1.764905, 0.1921569, 1, 0, 1,
-0.5703562, -0.9944297, -0.3480622, 0.1882353, 1, 0, 1,
-0.5698211, 0.3846779, -0.6412178, 0.1803922, 1, 0, 1,
-0.5668036, -1.582726, -3.151025, 0.1764706, 1, 0, 1,
-0.5632787, 0.9971685, -0.3648528, 0.1686275, 1, 0, 1,
-0.5594103, -0.410428, -2.141356, 0.1647059, 1, 0, 1,
-0.5538545, 0.007056802, -0.07719558, 0.1568628, 1, 0, 1,
-0.5520929, -0.4528172, -1.137628, 0.1529412, 1, 0, 1,
-0.551122, -2.251845, -1.748345, 0.145098, 1, 0, 1,
-0.5465965, -0.1615697, -1.566198, 0.1411765, 1, 0, 1,
-0.5426338, 0.3448131, 0.6731682, 0.1333333, 1, 0, 1,
-0.5407796, -0.07414208, -0.8184516, 0.1294118, 1, 0, 1,
-0.5385401, -1.007645, -4.228354, 0.1215686, 1, 0, 1,
-0.5351745, 0.4949948, -0.3337354, 0.1176471, 1, 0, 1,
-0.5328734, 0.1243407, -0.4308684, 0.1098039, 1, 0, 1,
-0.5323854, -0.8989567, -1.92636, 0.1058824, 1, 0, 1,
-0.5301612, 0.1939206, -1.72397, 0.09803922, 1, 0, 1,
-0.528552, 0.5414141, -0.09895346, 0.09019608, 1, 0, 1,
-0.5175697, 1.611997, -0.8277262, 0.08627451, 1, 0, 1,
-0.5174256, 0.6687011, -1.252388, 0.07843138, 1, 0, 1,
-0.5167656, -0.2410066, -1.312448, 0.07450981, 1, 0, 1,
-0.5160312, 1.608785, -0.6031506, 0.06666667, 1, 0, 1,
-0.5157598, 1.716691, -2.32501, 0.0627451, 1, 0, 1,
-0.5146524, 0.8186243, -0.2217615, 0.05490196, 1, 0, 1,
-0.5115194, -0.7008556, -1.839485, 0.05098039, 1, 0, 1,
-0.5093061, 0.7991985, -0.03595322, 0.04313726, 1, 0, 1,
-0.5050385, 0.6902311, -0.5216646, 0.03921569, 1, 0, 1,
-0.5037821, -0.4606604, -3.131452, 0.03137255, 1, 0, 1,
-0.490635, 0.4550035, -1.25647, 0.02745098, 1, 0, 1,
-0.4906085, -0.6042955, -2.896331, 0.01960784, 1, 0, 1,
-0.4851043, 0.6939142, -0.6385944, 0.01568628, 1, 0, 1,
-0.4836267, -1.072823, -0.7718679, 0.007843138, 1, 0, 1,
-0.4811778, -0.6513443, -1.792477, 0.003921569, 1, 0, 1,
-0.4769216, -0.2255645, -2.476564, 0, 1, 0.003921569, 1,
-0.4764584, -1.084471, -3.538259, 0, 1, 0.01176471, 1,
-0.4729539, 0.2748753, -0.9812769, 0, 1, 0.01568628, 1,
-0.4714488, 0.06377766, -1.106529, 0, 1, 0.02352941, 1,
-0.4629601, 0.3712082, -3.282799, 0, 1, 0.02745098, 1,
-0.4625728, -0.7769409, -1.961993, 0, 1, 0.03529412, 1,
-0.4576151, -0.03551475, -1.37362, 0, 1, 0.03921569, 1,
-0.4445879, -1.167673, -3.235515, 0, 1, 0.04705882, 1,
-0.4440023, -1.676051, -2.26584, 0, 1, 0.05098039, 1,
-0.4434424, -1.512965, -3.140482, 0, 1, 0.05882353, 1,
-0.4414482, -0.1571631, -0.814328, 0, 1, 0.0627451, 1,
-0.4410012, 0.5385745, 0.160024, 0, 1, 0.07058824, 1,
-0.4408189, 1.013697, 0.07888804, 0, 1, 0.07450981, 1,
-0.4321268, -0.6259512, -0.9308416, 0, 1, 0.08235294, 1,
-0.4230066, -2.110196, -3.852926, 0, 1, 0.08627451, 1,
-0.4229303, 0.211824, -2.108308, 0, 1, 0.09411765, 1,
-0.418969, -1.329506, -2.463568, 0, 1, 0.1019608, 1,
-0.4171389, -0.5927637, -2.768086, 0, 1, 0.1058824, 1,
-0.4152983, -1.734283, -4.366516, 0, 1, 0.1137255, 1,
-0.4137261, 1.259601, -1.871107, 0, 1, 0.1176471, 1,
-0.4136454, -0.1521822, -2.041401, 0, 1, 0.1254902, 1,
-0.4109534, -0.6190178, -3.021114, 0, 1, 0.1294118, 1,
-0.4074975, 0.583226, -1.665014, 0, 1, 0.1372549, 1,
-0.4070586, 0.2479841, -2.058873, 0, 1, 0.1411765, 1,
-0.4055905, 0.6770577, -1.284046, 0, 1, 0.1490196, 1,
-0.4029314, 1.099545, -0.7585955, 0, 1, 0.1529412, 1,
-0.4028436, 0.7421995, -1.495873, 0, 1, 0.1607843, 1,
-0.3929361, 0.6057028, -0.934782, 0, 1, 0.1647059, 1,
-0.3922366, -0.1920079, -2.592084, 0, 1, 0.172549, 1,
-0.3910651, -1.685446, -2.489109, 0, 1, 0.1764706, 1,
-0.3881728, -1.129393, -1.886334, 0, 1, 0.1843137, 1,
-0.3875241, -0.2124554, -1.896699, 0, 1, 0.1882353, 1,
-0.3874482, -0.4599783, -1.400055, 0, 1, 0.1960784, 1,
-0.3831213, 0.7227175, 0.6769129, 0, 1, 0.2039216, 1,
-0.3800676, 0.1811053, -1.488712, 0, 1, 0.2078431, 1,
-0.3792339, -0.6493251, -2.416885, 0, 1, 0.2156863, 1,
-0.3779493, 0.1880825, -2.062351, 0, 1, 0.2196078, 1,
-0.3766474, -0.1959531, -1.919418, 0, 1, 0.227451, 1,
-0.3750494, 0.8784809, -0.04361036, 0, 1, 0.2313726, 1,
-0.3732483, -1.147708, -2.266953, 0, 1, 0.2392157, 1,
-0.3732456, -0.5646134, -0.9313708, 0, 1, 0.2431373, 1,
-0.3708599, 0.8967408, 1.193696, 0, 1, 0.2509804, 1,
-0.3708478, 1.475015, 0.1895102, 0, 1, 0.254902, 1,
-0.3692036, 0.4417523, -3.070772, 0, 1, 0.2627451, 1,
-0.3672486, 0.1907443, -0.4466325, 0, 1, 0.2666667, 1,
-0.3656991, -1.260558, -2.866558, 0, 1, 0.2745098, 1,
-0.364821, 1.241095, -1.460631, 0, 1, 0.2784314, 1,
-0.3602097, 1.582734, -0.4685483, 0, 1, 0.2862745, 1,
-0.3578293, -0.01650439, -0.6299614, 0, 1, 0.2901961, 1,
-0.3571152, 2.526826, 0.2276557, 0, 1, 0.2980392, 1,
-0.3552294, -0.8379449, -0.4223135, 0, 1, 0.3058824, 1,
-0.3532854, -0.9001485, -4.559224, 0, 1, 0.3098039, 1,
-0.3514134, 0.8775889, -1.56582, 0, 1, 0.3176471, 1,
-0.3455544, 1.876333, 0.3047246, 0, 1, 0.3215686, 1,
-0.3404455, -1.553707, -3.140825, 0, 1, 0.3294118, 1,
-0.3399638, 0.4657166, -3.264099, 0, 1, 0.3333333, 1,
-0.3389067, -0.3080786, -2.11596, 0, 1, 0.3411765, 1,
-0.3376192, -0.2380119, -0.91665, 0, 1, 0.345098, 1,
-0.3365846, 0.5214701, -2.367683, 0, 1, 0.3529412, 1,
-0.3348813, -0.2590567, -4.008087, 0, 1, 0.3568628, 1,
-0.3343622, 0.7671368, -0.3347394, 0, 1, 0.3647059, 1,
-0.3341634, -0.5056545, -2.963419, 0, 1, 0.3686275, 1,
-0.3325989, 0.4162704, -0.5298207, 0, 1, 0.3764706, 1,
-0.3290819, -1.035671, -3.639924, 0, 1, 0.3803922, 1,
-0.325354, -1.107087, -0.665113, 0, 1, 0.3882353, 1,
-0.3249996, -0.4096314, -0.3021989, 0, 1, 0.3921569, 1,
-0.3245522, 0.3063131, -1.269926, 0, 1, 0.4, 1,
-0.321124, 0.5928703, 0.2506592, 0, 1, 0.4078431, 1,
-0.3189677, -0.4828683, -2.423786, 0, 1, 0.4117647, 1,
-0.3179436, 1.161099, 0.7308458, 0, 1, 0.4196078, 1,
-0.3146701, -0.7503506, -3.317292, 0, 1, 0.4235294, 1,
-0.3122428, 0.1446306, 0.6872598, 0, 1, 0.4313726, 1,
-0.3097363, -0.4366394, -3.22771, 0, 1, 0.4352941, 1,
-0.3053887, -0.5718239, -0.8329188, 0, 1, 0.4431373, 1,
-0.3021964, -0.07576713, -0.7603252, 0, 1, 0.4470588, 1,
-0.3007148, 1.712397, 1.82227, 0, 1, 0.454902, 1,
-0.2948308, 0.03693594, -1.642593, 0, 1, 0.4588235, 1,
-0.2924645, 0.02498311, -2.657735, 0, 1, 0.4666667, 1,
-0.286741, -0.5791807, -2.213853, 0, 1, 0.4705882, 1,
-0.2821231, -0.05587195, -2.695869, 0, 1, 0.4784314, 1,
-0.2775085, -0.7074302, -3.677879, 0, 1, 0.4823529, 1,
-0.2653531, -0.7020398, -2.611841, 0, 1, 0.4901961, 1,
-0.2620726, 0.1025103, -3.553554, 0, 1, 0.4941176, 1,
-0.2610213, -1.788265, -4.697957, 0, 1, 0.5019608, 1,
-0.2577814, -0.431148, -3.936241, 0, 1, 0.509804, 1,
-0.2575504, 0.1629373, -2.236844, 0, 1, 0.5137255, 1,
-0.2558649, 1.682177, 1.264129, 0, 1, 0.5215687, 1,
-0.2539834, 0.6113504, -0.4031489, 0, 1, 0.5254902, 1,
-0.2529463, -0.04887367, -1.448349, 0, 1, 0.5333334, 1,
-0.2529393, -0.8795422, -3.100992, 0, 1, 0.5372549, 1,
-0.2520182, -0.2105685, -2.491842, 0, 1, 0.5450981, 1,
-0.2519674, 0.9990708, -0.2375126, 0, 1, 0.5490196, 1,
-0.2466372, 0.160096, -1.046454, 0, 1, 0.5568628, 1,
-0.2447216, 0.9482095, 1.617695, 0, 1, 0.5607843, 1,
-0.234404, 0.1236461, 0.3059053, 0, 1, 0.5686275, 1,
-0.2292113, -1.875076, -3.298073, 0, 1, 0.572549, 1,
-0.2283103, 0.6027368, -1.52658, 0, 1, 0.5803922, 1,
-0.2241373, 1.258987, 0.347854, 0, 1, 0.5843138, 1,
-0.2239272, 1.866362, -0.4583262, 0, 1, 0.5921569, 1,
-0.2187364, -0.7663805, -3.60692, 0, 1, 0.5960785, 1,
-0.2182494, 0.2502299, -3.138242, 0, 1, 0.6039216, 1,
-0.2176667, 0.3689278, -0.1376801, 0, 1, 0.6117647, 1,
-0.215626, -0.05521354, -0.851065, 0, 1, 0.6156863, 1,
-0.2143347, 1.346608, 1.257477, 0, 1, 0.6235294, 1,
-0.2140934, -0.2526992, -3.003852, 0, 1, 0.627451, 1,
-0.2107632, 0.08076895, -1.499728, 0, 1, 0.6352941, 1,
-0.2080615, 0.7544255, -0.6617113, 0, 1, 0.6392157, 1,
-0.2014283, -2.304528, -3.676635, 0, 1, 0.6470588, 1,
-0.2007536, -0.007543418, -1.553381, 0, 1, 0.6509804, 1,
-0.2005931, 0.7380419, 0.115999, 0, 1, 0.6588235, 1,
-0.1979831, 1.070763, -0.9107446, 0, 1, 0.6627451, 1,
-0.1975093, 2.018174, -2.26264, 0, 1, 0.6705883, 1,
-0.1878994, -0.1325948, -1.67218, 0, 1, 0.6745098, 1,
-0.1821376, -0.6463757, -2.11078, 0, 1, 0.682353, 1,
-0.1804295, -0.1522021, -3.228453, 0, 1, 0.6862745, 1,
-0.178019, 0.995565, -0.6323515, 0, 1, 0.6941177, 1,
-0.1710641, -0.200211, -3.828407, 0, 1, 0.7019608, 1,
-0.1692333, 1.13291, -0.9613584, 0, 1, 0.7058824, 1,
-0.167, -0.6940494, -3.509635, 0, 1, 0.7137255, 1,
-0.1648758, 0.6079824, 0.04394628, 0, 1, 0.7176471, 1,
-0.1632063, 0.9625144, -1.802488, 0, 1, 0.7254902, 1,
-0.1623127, -0.03141086, -0.8428264, 0, 1, 0.7294118, 1,
-0.1618191, -1.911585, -4.002501, 0, 1, 0.7372549, 1,
-0.1593551, -1.424698, -3.969112, 0, 1, 0.7411765, 1,
-0.152178, 0.095834, -0.4552716, 0, 1, 0.7490196, 1,
-0.1467049, 0.848652, -0.6574221, 0, 1, 0.7529412, 1,
-0.1465244, 0.9206005, -0.6852787, 0, 1, 0.7607843, 1,
-0.1457314, -0.814752, -2.884046, 0, 1, 0.7647059, 1,
-0.1422, -0.6828996, -2.787166, 0, 1, 0.772549, 1,
-0.1381483, 0.8520965, -0.6222553, 0, 1, 0.7764706, 1,
-0.1353944, -0.08643888, -1.241578, 0, 1, 0.7843137, 1,
-0.134073, 0.4276609, 0.1726699, 0, 1, 0.7882353, 1,
-0.1329454, 1.184903, 2.199265, 0, 1, 0.7960784, 1,
-0.1308653, 0.8769464, -0.4000822, 0, 1, 0.8039216, 1,
-0.1287031, 0.4447521, -0.0848968, 0, 1, 0.8078431, 1,
-0.1262102, -0.7714052, -2.18589, 0, 1, 0.8156863, 1,
-0.1238508, -2.169387, -3.303945, 0, 1, 0.8196079, 1,
-0.1194572, -2.142325, -3.445, 0, 1, 0.827451, 1,
-0.1134329, 0.1880113, -0.150314, 0, 1, 0.8313726, 1,
-0.1134282, 0.026348, -1.751813, 0, 1, 0.8392157, 1,
-0.1106503, -0.349976, -3.881694, 0, 1, 0.8431373, 1,
-0.1061089, -1.156081, -3.573705, 0, 1, 0.8509804, 1,
-0.1033532, -1.008876, -3.662491, 0, 1, 0.854902, 1,
-0.1005907, -0.1014461, 0.2749018, 0, 1, 0.8627451, 1,
-0.09878381, 0.4960029, 0.3087811, 0, 1, 0.8666667, 1,
-0.09859608, -0.7479639, -2.684078, 0, 1, 0.8745098, 1,
-0.09837212, 0.1626206, 0.1016955, 0, 1, 0.8784314, 1,
-0.09551162, -0.7121108, -2.996016, 0, 1, 0.8862745, 1,
-0.08916954, -1.48323, -3.535822, 0, 1, 0.8901961, 1,
-0.085822, 0.4315543, 0.4703438, 0, 1, 0.8980392, 1,
-0.08581774, 0.210961, -0.2696228, 0, 1, 0.9058824, 1,
-0.08275796, 0.08289959, -0.3443481, 0, 1, 0.9098039, 1,
-0.08054274, 0.5935619, -0.2950487, 0, 1, 0.9176471, 1,
-0.07851956, -0.2950935, -1.498291, 0, 1, 0.9215686, 1,
-0.07642491, -0.8545246, -2.881788, 0, 1, 0.9294118, 1,
-0.06780437, 0.6129228, 0.3014934, 0, 1, 0.9333333, 1,
-0.06128151, 0.1274411, 1.003073, 0, 1, 0.9411765, 1,
-0.06071795, 0.4625096, 0.5402384, 0, 1, 0.945098, 1,
-0.05582419, -0.3043198, -2.379789, 0, 1, 0.9529412, 1,
-0.05574796, -1.187894, -2.830879, 0, 1, 0.9568627, 1,
-0.05558508, -0.2003601, -1.967463, 0, 1, 0.9647059, 1,
-0.05495074, -0.2109848, -2.704316, 0, 1, 0.9686275, 1,
-0.05073286, -0.08067969, -2.544084, 0, 1, 0.9764706, 1,
-0.04855222, -0.3393371, -1.897062, 0, 1, 0.9803922, 1,
-0.04834899, 1.433785, -0.7906969, 0, 1, 0.9882353, 1,
-0.0461597, -1.361513, -1.077681, 0, 1, 0.9921569, 1,
-0.04110545, 0.5457167, -0.2918489, 0, 1, 1, 1,
-0.03994197, -0.3818499, -3.053817, 0, 0.9921569, 1, 1,
-0.03940196, 1.140319, -0.2331688, 0, 0.9882353, 1, 1,
-0.03938053, 0.09967102, 0.7564943, 0, 0.9803922, 1, 1,
-0.03804761, 0.2367429, 0.3783619, 0, 0.9764706, 1, 1,
-0.03373554, 0.7458628, -0.9663652, 0, 0.9686275, 1, 1,
-0.03142814, 0.7407365, -0.3409884, 0, 0.9647059, 1, 1,
-0.03136072, 2.384037, 0.3379821, 0, 0.9568627, 1, 1,
-0.02993249, -0.1146079, -3.766195, 0, 0.9529412, 1, 1,
-0.02681507, -0.8566843, -5.388021, 0, 0.945098, 1, 1,
-0.0264252, -1.173584, -1.643095, 0, 0.9411765, 1, 1,
-0.02551031, 0.8746617, -0.6145171, 0, 0.9333333, 1, 1,
-0.02310771, 0.368212, 0.8190911, 0, 0.9294118, 1, 1,
-0.01531824, 0.3098359, -1.938499, 0, 0.9215686, 1, 1,
-0.01233162, -1.188043, -3.273093, 0, 0.9176471, 1, 1,
-0.009814986, -1.292003, -4.060605, 0, 0.9098039, 1, 1,
-0.007386199, -0.4336874, -2.722684, 0, 0.9058824, 1, 1,
0.001565409, 0.2442923, -0.6521923, 0, 0.8980392, 1, 1,
0.002316, 0.1800929, -0.01925952, 0, 0.8901961, 1, 1,
0.01414909, -0.2758485, 4.969635, 0, 0.8862745, 1, 1,
0.01730668, 0.3304558, 0.5595337, 0, 0.8784314, 1, 1,
0.01779237, 0.4557986, -0.1149737, 0, 0.8745098, 1, 1,
0.02184334, 0.5700011, 0.4463, 0, 0.8666667, 1, 1,
0.02187789, 0.5565262, -1.341712, 0, 0.8627451, 1, 1,
0.02222382, -1.036569, 3.750334, 0, 0.854902, 1, 1,
0.0223989, 0.45904, -1.297075, 0, 0.8509804, 1, 1,
0.02738213, -1.162556, 4.71091, 0, 0.8431373, 1, 1,
0.03070707, -1.456318, 3.521013, 0, 0.8392157, 1, 1,
0.03524143, 0.590322, 1.96141, 0, 0.8313726, 1, 1,
0.03588534, 0.1158972, 0.7093326, 0, 0.827451, 1, 1,
0.03852773, 0.04482909, 0.7458204, 0, 0.8196079, 1, 1,
0.04088352, 0.04293405, 2.050366, 0, 0.8156863, 1, 1,
0.04438617, -1.461125, 3.247747, 0, 0.8078431, 1, 1,
0.0457304, 1.236657, 0.7009265, 0, 0.8039216, 1, 1,
0.04596816, 0.7105977, -2.541965, 0, 0.7960784, 1, 1,
0.04693666, 0.7665104, 0.3497635, 0, 0.7882353, 1, 1,
0.04799971, -1.337327, 2.038703, 0, 0.7843137, 1, 1,
0.05143794, -0.4683921, 4.742146, 0, 0.7764706, 1, 1,
0.05329608, 0.03197973, 1.396553, 0, 0.772549, 1, 1,
0.05489385, -0.9081305, 2.05163, 0, 0.7647059, 1, 1,
0.06172619, -0.1469008, 1.415969, 0, 0.7607843, 1, 1,
0.06766073, 0.6154281, 0.1451715, 0, 0.7529412, 1, 1,
0.0693873, 2.599821, 0.3304869, 0, 0.7490196, 1, 1,
0.07123619, 0.2448698, 1.136824, 0, 0.7411765, 1, 1,
0.07379361, 0.6445251, -0.4384238, 0, 0.7372549, 1, 1,
0.07779083, 0.5921199, -0.4217228, 0, 0.7294118, 1, 1,
0.08099518, 2.027142, -0.5081774, 0, 0.7254902, 1, 1,
0.08127514, 0.895721, 0.6073227, 0, 0.7176471, 1, 1,
0.08248154, 0.8345579, 0.3549507, 0, 0.7137255, 1, 1,
0.0866212, 0.08601471, 0.7282955, 0, 0.7058824, 1, 1,
0.08760419, -1.727932, 4.248551, 0, 0.6980392, 1, 1,
0.08855888, -0.6980296, 3.238416, 0, 0.6941177, 1, 1,
0.08931554, 0.050388, 2.060399, 0, 0.6862745, 1, 1,
0.09115218, 0.2621061, 1.433904, 0, 0.682353, 1, 1,
0.09197614, -1.064466, 3.134161, 0, 0.6745098, 1, 1,
0.09400666, 1.970251, -0.1029739, 0, 0.6705883, 1, 1,
0.09516282, 0.2823525, -0.4481472, 0, 0.6627451, 1, 1,
0.09823197, -1.273648, 2.164515, 0, 0.6588235, 1, 1,
0.09996756, -1.383335, 2.455032, 0, 0.6509804, 1, 1,
0.1002764, -0.4816754, 2.875365, 0, 0.6470588, 1, 1,
0.103234, -0.4683755, 2.788471, 0, 0.6392157, 1, 1,
0.105187, -0.4923889, 1.475949, 0, 0.6352941, 1, 1,
0.1059085, -0.7684462, 3.762002, 0, 0.627451, 1, 1,
0.1075117, -0.3301141, 3.146638, 0, 0.6235294, 1, 1,
0.1105339, -0.9411299, 2.473699, 0, 0.6156863, 1, 1,
0.1141464, 0.4739833, 1.658782, 0, 0.6117647, 1, 1,
0.1153483, 0.1630687, -0.9044814, 0, 0.6039216, 1, 1,
0.1194895, 0.3469582, 0.68094, 0, 0.5960785, 1, 1,
0.1201442, 0.08651992, -1.075727, 0, 0.5921569, 1, 1,
0.1212742, -0.2258852, 2.843115, 0, 0.5843138, 1, 1,
0.1248634, -0.484811, 3.248985, 0, 0.5803922, 1, 1,
0.1254756, 0.2299005, 1.014719, 0, 0.572549, 1, 1,
0.1262103, -0.7823248, 5.064794, 0, 0.5686275, 1, 1,
0.1300157, -0.01569877, 2.229587, 0, 0.5607843, 1, 1,
0.1300856, 0.4022876, -0.01072663, 0, 0.5568628, 1, 1,
0.1310531, 0.8057168, -0.4192979, 0, 0.5490196, 1, 1,
0.1346226, 0.2095594, -1.444035, 0, 0.5450981, 1, 1,
0.1383589, 0.4799909, 0.1199857, 0, 0.5372549, 1, 1,
0.1391243, -0.9682891, 2.249265, 0, 0.5333334, 1, 1,
0.1455811, -0.8027034, 4.35954, 0, 0.5254902, 1, 1,
0.1473166, 0.2508049, 0.7151589, 0, 0.5215687, 1, 1,
0.1495391, -0.54407, 2.843844, 0, 0.5137255, 1, 1,
0.1510694, -0.961296, 3.995426, 0, 0.509804, 1, 1,
0.1566987, -0.1724641, 2.290984, 0, 0.5019608, 1, 1,
0.1575082, -1.477158, 2.323894, 0, 0.4941176, 1, 1,
0.1586585, 0.8752937, 0.7794262, 0, 0.4901961, 1, 1,
0.1676198, 1.518538, -0.1361519, 0, 0.4823529, 1, 1,
0.1739032, -1.104955, 3.700406, 0, 0.4784314, 1, 1,
0.175031, 1.291479, -0.09500297, 0, 0.4705882, 1, 1,
0.1752232, 1.983158, 1.025001, 0, 0.4666667, 1, 1,
0.1768498, -0.7376626, -0.6296564, 0, 0.4588235, 1, 1,
0.1799889, -0.9160506, 2.734341, 0, 0.454902, 1, 1,
0.1898406, 1.514507, -0.9433554, 0, 0.4470588, 1, 1,
0.1909844, -0.01765291, 0.7935663, 0, 0.4431373, 1, 1,
0.1943327, -0.4643805, 2.741016, 0, 0.4352941, 1, 1,
0.1943888, 0.3481368, 2.293204, 0, 0.4313726, 1, 1,
0.1966434, 1.238083, -1.865143, 0, 0.4235294, 1, 1,
0.2068417, -0.8859174, 3.781933, 0, 0.4196078, 1, 1,
0.2148262, -0.674878, 1.689434, 0, 0.4117647, 1, 1,
0.215061, 1.745933, -0.0628823, 0, 0.4078431, 1, 1,
0.217123, -0.8170699, 1.688136, 0, 0.4, 1, 1,
0.2218958, 0.12103, 1.238233, 0, 0.3921569, 1, 1,
0.2316468, -0.5124727, 1.390786, 0, 0.3882353, 1, 1,
0.2327705, 0.02327163, 1.810504, 0, 0.3803922, 1, 1,
0.2342913, 1.884042, 0.07342347, 0, 0.3764706, 1, 1,
0.2353592, -0.3364881, 1.741415, 0, 0.3686275, 1, 1,
0.2362755, -0.9396924, 2.848599, 0, 0.3647059, 1, 1,
0.2391736, 0.7708127, -0.04728478, 0, 0.3568628, 1, 1,
0.2409593, 0.4271079, 0.1834315, 0, 0.3529412, 1, 1,
0.2431131, -1.172131, 4.099172, 0, 0.345098, 1, 1,
0.2441403, -0.06085845, 1.085002, 0, 0.3411765, 1, 1,
0.2448425, 1.269206, -0.6126295, 0, 0.3333333, 1, 1,
0.2484035, 1.406344, -0.5826498, 0, 0.3294118, 1, 1,
0.2496593, 0.255999, -0.7754012, 0, 0.3215686, 1, 1,
0.252241, -0.5079656, 2.28506, 0, 0.3176471, 1, 1,
0.2522742, -0.03544237, 1.189843, 0, 0.3098039, 1, 1,
0.2526751, -0.1275347, 4.045569, 0, 0.3058824, 1, 1,
0.2528214, -0.8207784, 2.785696, 0, 0.2980392, 1, 1,
0.2585229, -0.1383433, 2.489994, 0, 0.2901961, 1, 1,
0.2592603, -2.93148, 3.569538, 0, 0.2862745, 1, 1,
0.2600205, -1.282327, 2.608677, 0, 0.2784314, 1, 1,
0.2615654, 2.309079, 1.13223, 0, 0.2745098, 1, 1,
0.2642263, 1.795166, 0.890517, 0, 0.2666667, 1, 1,
0.2654255, 0.1820101, 1.388349, 0, 0.2627451, 1, 1,
0.2686343, -0.753878, 3.443428, 0, 0.254902, 1, 1,
0.2690293, 0.09683127, 0.05699207, 0, 0.2509804, 1, 1,
0.2753329, -0.5546033, 2.350176, 0, 0.2431373, 1, 1,
0.2774352, 0.1140727, -0.4126594, 0, 0.2392157, 1, 1,
0.2796629, 1.070555, -0.7422253, 0, 0.2313726, 1, 1,
0.2874285, 1.184691, 0.577105, 0, 0.227451, 1, 1,
0.2914469, 1.070431, 0.3732929, 0, 0.2196078, 1, 1,
0.2937115, 0.08164511, 0.6803851, 0, 0.2156863, 1, 1,
0.2977854, -0.6381403, 3.020542, 0, 0.2078431, 1, 1,
0.2999189, 0.1944669, -0.6709252, 0, 0.2039216, 1, 1,
0.3003444, -1.392248, 2.771405, 0, 0.1960784, 1, 1,
0.3018679, -0.8823792, 3.152436, 0, 0.1882353, 1, 1,
0.3038249, -1.753531, 3.602497, 0, 0.1843137, 1, 1,
0.3049859, -0.6608933, 2.863215, 0, 0.1764706, 1, 1,
0.3100149, 0.215293, 2.073244, 0, 0.172549, 1, 1,
0.3121715, 1.19286, -1.624353, 0, 0.1647059, 1, 1,
0.3154945, 0.3155777, 0.4397431, 0, 0.1607843, 1, 1,
0.3162288, -1.822791, 4.061803, 0, 0.1529412, 1, 1,
0.318041, 1.806726, 1.222395, 0, 0.1490196, 1, 1,
0.3220262, -1.098567, 1.476436, 0, 0.1411765, 1, 1,
0.3231332, -1.18902, 3.194884, 0, 0.1372549, 1, 1,
0.3261388, 0.3240259, 1.788357, 0, 0.1294118, 1, 1,
0.3274852, 0.02296287, 2.266391, 0, 0.1254902, 1, 1,
0.3288203, -1.127931, 3.002784, 0, 0.1176471, 1, 1,
0.3329614, -0.5878401, 3.301173, 0, 0.1137255, 1, 1,
0.3489709, 0.107711, 0.9655862, 0, 0.1058824, 1, 1,
0.3492631, 0.2127243, 0.3702663, 0, 0.09803922, 1, 1,
0.3500392, 0.3497047, -0.6081432, 0, 0.09411765, 1, 1,
0.350713, -0.2524889, 1.515744, 0, 0.08627451, 1, 1,
0.3518278, 0.3151885, 0.5229865, 0, 0.08235294, 1, 1,
0.3539407, -0.3326652, 0.8477021, 0, 0.07450981, 1, 1,
0.3556535, 1.010348, -0.06421261, 0, 0.07058824, 1, 1,
0.3568798, 0.07551838, 0.9218978, 0, 0.0627451, 1, 1,
0.356917, 1.992348, -0.1823024, 0, 0.05882353, 1, 1,
0.356941, -0.6235752, 3.487128, 0, 0.05098039, 1, 1,
0.359188, -1.634941, 3.292323, 0, 0.04705882, 1, 1,
0.3600086, -0.9649363, 4.592479, 0, 0.03921569, 1, 1,
0.3629922, 0.5497262, -0.6700904, 0, 0.03529412, 1, 1,
0.3653021, -0.01823403, 3.047186, 0, 0.02745098, 1, 1,
0.3657011, 1.328552, 0.5453001, 0, 0.02352941, 1, 1,
0.3658756, -0.1633372, 1.310369, 0, 0.01568628, 1, 1,
0.3712645, -0.5019621, 3.093001, 0, 0.01176471, 1, 1,
0.371289, 0.3344188, 2.067265, 0, 0.003921569, 1, 1,
0.3729239, 0.7856899, 1.082582, 0.003921569, 0, 1, 1,
0.3732414, -0.003655587, 0.007071339, 0.007843138, 0, 1, 1,
0.3762903, -0.2253883, 0.5141813, 0.01568628, 0, 1, 1,
0.377627, 0.4388714, 0.0931097, 0.01960784, 0, 1, 1,
0.3795187, -0.2928865, 4.171138, 0.02745098, 0, 1, 1,
0.3805076, 1.227778, 0.5050797, 0.03137255, 0, 1, 1,
0.3811223, 0.4235975, 0.429534, 0.03921569, 0, 1, 1,
0.3866507, -0.9657612, 3.491226, 0.04313726, 0, 1, 1,
0.3867578, -0.001383221, 0.3709906, 0.05098039, 0, 1, 1,
0.3888637, 1.040519, 0.4082043, 0.05490196, 0, 1, 1,
0.3925493, -0.6221867, 2.539377, 0.0627451, 0, 1, 1,
0.3931054, 1.18718, 0.1193551, 0.06666667, 0, 1, 1,
0.4007722, 1.992337, 0.3158616, 0.07450981, 0, 1, 1,
0.4025249, -0.4824301, 2.946454, 0.07843138, 0, 1, 1,
0.4131771, -0.364894, 1.640425, 0.08627451, 0, 1, 1,
0.4138645, 1.303537, 1.011834, 0.09019608, 0, 1, 1,
0.4146187, 0.3444225, 1.344019, 0.09803922, 0, 1, 1,
0.4175237, 0.5660115, -0.2993719, 0.1058824, 0, 1, 1,
0.4175675, 1.013722, -0.6032251, 0.1098039, 0, 1, 1,
0.4180543, 0.9872174, 0.038209, 0.1176471, 0, 1, 1,
0.4211446, 1.391621, -0.12142, 0.1215686, 0, 1, 1,
0.4211479, 0.8771583, 0.1463475, 0.1294118, 0, 1, 1,
0.4247227, -1.664254, 2.111938, 0.1333333, 0, 1, 1,
0.4289603, -0.244532, 2.318649, 0.1411765, 0, 1, 1,
0.4308329, 0.1698875, 1.388563, 0.145098, 0, 1, 1,
0.4308402, -0.7566612, 2.568081, 0.1529412, 0, 1, 1,
0.4367807, 1.335701, -1.430533, 0.1568628, 0, 1, 1,
0.4382417, 0.7929639, 0.8016829, 0.1647059, 0, 1, 1,
0.4385155, 0.2354134, 1.496889, 0.1686275, 0, 1, 1,
0.440963, -2.163512, 2.727675, 0.1764706, 0, 1, 1,
0.4421549, -1.942494, 3.446557, 0.1803922, 0, 1, 1,
0.4460482, -0.6671444, 3.415344, 0.1882353, 0, 1, 1,
0.4476184, -0.9669755, 1.460127, 0.1921569, 0, 1, 1,
0.4497225, -3.387891, 2.961448, 0.2, 0, 1, 1,
0.4558409, -1.431303, 4.41481, 0.2078431, 0, 1, 1,
0.4565201, 1.038078, -0.33895, 0.2117647, 0, 1, 1,
0.4629906, -1.280053, 1.685408, 0.2196078, 0, 1, 1,
0.4643261, -0.4137576, 1.716828, 0.2235294, 0, 1, 1,
0.4699127, 0.533142, 0.06966727, 0.2313726, 0, 1, 1,
0.4709838, 0.6963236, 0.7829624, 0.2352941, 0, 1, 1,
0.4717776, -0.08261524, 0.3444645, 0.2431373, 0, 1, 1,
0.4730359, 0.4726943, 1.462781, 0.2470588, 0, 1, 1,
0.479999, -0.5041914, 2.161596, 0.254902, 0, 1, 1,
0.4818707, 0.3395664, 2.352163, 0.2588235, 0, 1, 1,
0.4829754, -0.3092483, 1.192393, 0.2666667, 0, 1, 1,
0.4863335, -0.408791, 0.7027297, 0.2705882, 0, 1, 1,
0.4864534, 0.4656173, 2.864884, 0.2784314, 0, 1, 1,
0.4903292, 0.4444884, -0.721807, 0.282353, 0, 1, 1,
0.4937666, 0.8685086, 1.973947, 0.2901961, 0, 1, 1,
0.5025576, 0.9238371, -1.912068, 0.2941177, 0, 1, 1,
0.5042319, 0.170407, 1.565297, 0.3019608, 0, 1, 1,
0.506973, -0.9227834, 4.262656, 0.3098039, 0, 1, 1,
0.5145436, -0.1358172, 1.010695, 0.3137255, 0, 1, 1,
0.5176497, -1.172152, 2.205545, 0.3215686, 0, 1, 1,
0.5195919, 0.4088344, 2.754674, 0.3254902, 0, 1, 1,
0.5207902, 2.173574, -0.05062978, 0.3333333, 0, 1, 1,
0.5210775, -1.557555, 2.923147, 0.3372549, 0, 1, 1,
0.5238869, -0.372685, 1.010197, 0.345098, 0, 1, 1,
0.5258751, 0.1954611, -0.7666677, 0.3490196, 0, 1, 1,
0.5283807, -0.5782506, 2.629095, 0.3568628, 0, 1, 1,
0.5284285, -0.8620188, 2.335199, 0.3607843, 0, 1, 1,
0.5313419, 1.014149, -0.4468691, 0.3686275, 0, 1, 1,
0.5329821, -0.6469427, 0.8864944, 0.372549, 0, 1, 1,
0.5350929, -1.528547, 3.058249, 0.3803922, 0, 1, 1,
0.5365234, 0.6011127, 1.887547, 0.3843137, 0, 1, 1,
0.5412532, -0.6171822, 4.116513, 0.3921569, 0, 1, 1,
0.541272, -1.03035, 2.45807, 0.3960784, 0, 1, 1,
0.5425147, 1.163572, 1.395646, 0.4039216, 0, 1, 1,
0.5437582, -2.311676, 0.8438971, 0.4117647, 0, 1, 1,
0.5572592, 0.2759165, -0.1018478, 0.4156863, 0, 1, 1,
0.5606053, -0.4446272, 2.545122, 0.4235294, 0, 1, 1,
0.5620041, -0.2296334, 0.4827728, 0.427451, 0, 1, 1,
0.5637959, 0.6929333, -0.213902, 0.4352941, 0, 1, 1,
0.5642247, -0.9056782, 2.146291, 0.4392157, 0, 1, 1,
0.5688864, -0.47898, 3.903234, 0.4470588, 0, 1, 1,
0.5726631, -0.6997486, 3.657395, 0.4509804, 0, 1, 1,
0.5754417, 0.4320794, 0.93262, 0.4588235, 0, 1, 1,
0.575782, -0.1727265, 0.4084322, 0.4627451, 0, 1, 1,
0.5771672, -0.8268456, 2.003337, 0.4705882, 0, 1, 1,
0.5854767, -0.6226818, 2.50501, 0.4745098, 0, 1, 1,
0.5950769, -0.7356706, 2.830269, 0.4823529, 0, 1, 1,
0.5957762, 0.7315404, -0.5666695, 0.4862745, 0, 1, 1,
0.6011985, 1.582905, 0.5671827, 0.4941176, 0, 1, 1,
0.60285, -0.3453133, 2.02887, 0.5019608, 0, 1, 1,
0.6099138, 0.6025126, -1.166178, 0.5058824, 0, 1, 1,
0.6114079, -0.1742937, 2.250155, 0.5137255, 0, 1, 1,
0.6128827, 1.075469, -0.5920392, 0.5176471, 0, 1, 1,
0.6192456, -1.193885, 1.643578, 0.5254902, 0, 1, 1,
0.6212567, 1.409526, 0.7041783, 0.5294118, 0, 1, 1,
0.6224188, -0.7192525, 1.156708, 0.5372549, 0, 1, 1,
0.6243805, -0.8102643, 2.278085, 0.5411765, 0, 1, 1,
0.6264275, -0.543934, 3.119787, 0.5490196, 0, 1, 1,
0.6356022, -1.725448, 3.785756, 0.5529412, 0, 1, 1,
0.6364003, 0.5888469, 1.394784, 0.5607843, 0, 1, 1,
0.6426416, -1.393064, 3.291334, 0.5647059, 0, 1, 1,
0.6435002, 0.08202313, 2.270979, 0.572549, 0, 1, 1,
0.6498589, 1.337852, 0.3863967, 0.5764706, 0, 1, 1,
0.6525217, -1.078249, 4.726176, 0.5843138, 0, 1, 1,
0.6538621, -1.57406, 3.742367, 0.5882353, 0, 1, 1,
0.6580508, -1.338659, 3.594855, 0.5960785, 0, 1, 1,
0.6632196, 0.1886509, 2.980851, 0.6039216, 0, 1, 1,
0.6685863, 0.3103421, 2.30884, 0.6078432, 0, 1, 1,
0.671284, 1.116492, 0.6137927, 0.6156863, 0, 1, 1,
0.6721697, 0.2585586, 0.5181226, 0.6196079, 0, 1, 1,
0.6762999, -0.4235368, -0.2090101, 0.627451, 0, 1, 1,
0.6797247, -0.6360151, 2.24287, 0.6313726, 0, 1, 1,
0.6816705, 2.136797, 0.3246135, 0.6392157, 0, 1, 1,
0.682818, 0.1561263, 2.135402, 0.6431373, 0, 1, 1,
0.6830741, 0.005734472, 0.1517364, 0.6509804, 0, 1, 1,
0.6876223, -1.556562, 3.606294, 0.654902, 0, 1, 1,
0.6877291, 0.5268021, 1.098875, 0.6627451, 0, 1, 1,
0.6915601, 0.3542368, 2.165236, 0.6666667, 0, 1, 1,
0.6937777, -0.5417717, 3.254672, 0.6745098, 0, 1, 1,
0.6941351, -0.5729594, -0.4281322, 0.6784314, 0, 1, 1,
0.6943449, -0.1580628, 1.012624, 0.6862745, 0, 1, 1,
0.7136582, -1.414722, 2.447438, 0.6901961, 0, 1, 1,
0.7195215, -1.727416, 4.786356, 0.6980392, 0, 1, 1,
0.7198802, 0.8085043, -0.03429708, 0.7058824, 0, 1, 1,
0.7220482, -0.1478057, 0.4011347, 0.7098039, 0, 1, 1,
0.7220666, -2.327266, 2.750827, 0.7176471, 0, 1, 1,
0.7228435, 0.9144996, 0.3463083, 0.7215686, 0, 1, 1,
0.7266927, 1.951273, 0.8668007, 0.7294118, 0, 1, 1,
0.7370895, 0.3735581, -0.01459135, 0.7333333, 0, 1, 1,
0.7375476, -0.9575997, 1.82849, 0.7411765, 0, 1, 1,
0.7429665, 0.1541206, 0.6585971, 0.7450981, 0, 1, 1,
0.7431877, 0.08519638, 1.398324, 0.7529412, 0, 1, 1,
0.7443272, 0.8283111, -0.2436941, 0.7568628, 0, 1, 1,
0.7478886, 1.279129, 2.105785, 0.7647059, 0, 1, 1,
0.749182, -1.137512, 1.718305, 0.7686275, 0, 1, 1,
0.7512045, -1.58887, 4.872448, 0.7764706, 0, 1, 1,
0.7543574, 0.1932838, 0.7181643, 0.7803922, 0, 1, 1,
0.7557181, 1.092596, 0.2072127, 0.7882353, 0, 1, 1,
0.7557447, -0.6689095, 2.434754, 0.7921569, 0, 1, 1,
0.7593901, 0.4651221, -0.7566062, 0.8, 0, 1, 1,
0.7596247, 0.8225809, 0.9131591, 0.8078431, 0, 1, 1,
0.7611472, 0.6173989, -1.107375, 0.8117647, 0, 1, 1,
0.769775, -0.1762643, 2.30761, 0.8196079, 0, 1, 1,
0.7708343, 1.122386, -1.490552, 0.8235294, 0, 1, 1,
0.7722698, 0.1108651, 2.463943, 0.8313726, 0, 1, 1,
0.773851, -1.515455, 2.561073, 0.8352941, 0, 1, 1,
0.7958019, 1.277908, -0.09919249, 0.8431373, 0, 1, 1,
0.7969639, 0.03190362, 1.410613, 0.8470588, 0, 1, 1,
0.8017769, 0.4959427, 0.5738592, 0.854902, 0, 1, 1,
0.8031942, 0.01985467, -0.1801636, 0.8588235, 0, 1, 1,
0.8091552, 0.261119, 1.568881, 0.8666667, 0, 1, 1,
0.8109826, -0.4167364, 1.087929, 0.8705882, 0, 1, 1,
0.8123756, 1.213473, 0.4647536, 0.8784314, 0, 1, 1,
0.8129742, 2.055947, -0.6140087, 0.8823529, 0, 1, 1,
0.8158314, -0.2147166, 3.180764, 0.8901961, 0, 1, 1,
0.8176555, -0.3112077, 3.565, 0.8941177, 0, 1, 1,
0.8243735, 0.6640657, 0.1422587, 0.9019608, 0, 1, 1,
0.8278525, -0.1777684, 0.6347464, 0.9098039, 0, 1, 1,
0.8299952, 0.3087479, 1.23752, 0.9137255, 0, 1, 1,
0.8321381, -0.9260253, 2.234883, 0.9215686, 0, 1, 1,
0.8345163, -0.4272959, 2.138515, 0.9254902, 0, 1, 1,
0.8386174, 0.005178965, 1.627923, 0.9333333, 0, 1, 1,
0.8400159, 1.555427, 1.472435, 0.9372549, 0, 1, 1,
0.8438318, -1.454862, 1.458626, 0.945098, 0, 1, 1,
0.8466157, -0.3939877, 2.127696, 0.9490196, 0, 1, 1,
0.8466772, 1.437142, -0.06100242, 0.9568627, 0, 1, 1,
0.8488017, -0.7022281, 4.134564, 0.9607843, 0, 1, 1,
0.8508731, 0.1396868, 2.81576, 0.9686275, 0, 1, 1,
0.8620488, 1.153208, 0.7284953, 0.972549, 0, 1, 1,
0.8639717, 0.1342653, 1.847822, 0.9803922, 0, 1, 1,
0.8732668, 0.1720361, -0.08308615, 0.9843137, 0, 1, 1,
0.8737102, 0.4184318, 1.042593, 0.9921569, 0, 1, 1,
0.8742535, 0.7851874, 0.04617365, 0.9960784, 0, 1, 1,
0.8775116, -0.7891181, 1.886962, 1, 0, 0.9960784, 1,
0.8780315, -2.839899, 3.423749, 1, 0, 0.9882353, 1,
0.8795959, 1.035836, 1.346432, 1, 0, 0.9843137, 1,
0.8853624, -1.889069, 3.440464, 1, 0, 0.9764706, 1,
0.8926391, 0.5434448, 0.8055277, 1, 0, 0.972549, 1,
0.8955084, 0.1195223, 1.516159, 1, 0, 0.9647059, 1,
0.9118422, 1.098283, 0.1905109, 1, 0, 0.9607843, 1,
0.9318776, -0.902657, 1.513866, 1, 0, 0.9529412, 1,
0.9320661, -0.07961488, 0.9619901, 1, 0, 0.9490196, 1,
0.9362587, 0.5857901, 2.020264, 1, 0, 0.9411765, 1,
0.9454756, -1.212506, 4.355488, 1, 0, 0.9372549, 1,
0.9463768, 0.7904189, 1.833994, 1, 0, 0.9294118, 1,
0.951648, 0.006322159, 2.625679, 1, 0, 0.9254902, 1,
0.9537517, -0.4352953, 0.5875358, 1, 0, 0.9176471, 1,
0.9601074, -0.6456903, 4.031377, 1, 0, 0.9137255, 1,
0.9607866, 1.250645, 0.2045252, 1, 0, 0.9058824, 1,
0.9638624, -2.663808, 3.176664, 1, 0, 0.9019608, 1,
0.9657323, -1.092051, 2.391181, 1, 0, 0.8941177, 1,
0.9695093, -0.6859133, 1.344964, 1, 0, 0.8862745, 1,
0.9699261, 0.8702284, 2.526179, 1, 0, 0.8823529, 1,
0.9762496, 0.3362263, 1.95543, 1, 0, 0.8745098, 1,
0.9861037, 1.217661, 1.192561, 1, 0, 0.8705882, 1,
0.995487, 1.350339, 1.028459, 1, 0, 0.8627451, 1,
1.01281, 1.164354, -1.455129, 1, 0, 0.8588235, 1,
1.013427, 1.529636, 0.3009678, 1, 0, 0.8509804, 1,
1.016383, 0.5451069, 1.273559, 1, 0, 0.8470588, 1,
1.020496, 0.610446, 0.7357312, 1, 0, 0.8392157, 1,
1.021329, -1.021125, 2.705506, 1, 0, 0.8352941, 1,
1.024106, 0.6976795, 1.228259, 1, 0, 0.827451, 1,
1.028658, 0.8238986, -0.2267923, 1, 0, 0.8235294, 1,
1.030534, -2.141868, 5.439382, 1, 0, 0.8156863, 1,
1.031606, 0.8049126, 1.200882, 1, 0, 0.8117647, 1,
1.041416, -1.408347, 2.972601, 1, 0, 0.8039216, 1,
1.050014, -0.7638051, 1.836332, 1, 0, 0.7960784, 1,
1.053165, -0.9366286, 3.347653, 1, 0, 0.7921569, 1,
1.063195, -0.5604368, 1.327674, 1, 0, 0.7843137, 1,
1.065996, -0.4677553, 1.934593, 1, 0, 0.7803922, 1,
1.067265, 1.082299, 2.547398, 1, 0, 0.772549, 1,
1.07057, -0.6524958, 3.39278, 1, 0, 0.7686275, 1,
1.081883, -0.2820909, -0.1136526, 1, 0, 0.7607843, 1,
1.082229, -1.51721, 1.181486, 1, 0, 0.7568628, 1,
1.08624, -1.267666, 3.668565, 1, 0, 0.7490196, 1,
1.086784, 2.008019, -0.1390543, 1, 0, 0.7450981, 1,
1.093886, -0.0807206, 1.700023, 1, 0, 0.7372549, 1,
1.105551, 0.7052669, 0.6188274, 1, 0, 0.7333333, 1,
1.107569, -0.709865, 1.915617, 1, 0, 0.7254902, 1,
1.112896, 0.2401531, 1.579044, 1, 0, 0.7215686, 1,
1.114933, -0.430629, 1.117782, 1, 0, 0.7137255, 1,
1.11656, -0.3304123, 4.493966, 1, 0, 0.7098039, 1,
1.11932, -0.3327696, 4.604049, 1, 0, 0.7019608, 1,
1.121017, -2.284266, 1.898305, 1, 0, 0.6941177, 1,
1.121459, 1.632762, 1.529629, 1, 0, 0.6901961, 1,
1.131633, 0.3653754, 3.180105, 1, 0, 0.682353, 1,
1.132147, -1.73246, 2.934636, 1, 0, 0.6784314, 1,
1.13393, -0.1947578, 2.883439, 1, 0, 0.6705883, 1,
1.135264, -0.5710068, 3.627699, 1, 0, 0.6666667, 1,
1.135373, 0.4791779, 2.594612, 1, 0, 0.6588235, 1,
1.142503, -0.02597082, 0.5296625, 1, 0, 0.654902, 1,
1.145402, -0.7711431, 3.211519, 1, 0, 0.6470588, 1,
1.16306, 1.787078, 0.4344398, 1, 0, 0.6431373, 1,
1.170227, -0.458919, 3.289786, 1, 0, 0.6352941, 1,
1.171572, -0.9484382, 1.96889, 1, 0, 0.6313726, 1,
1.179555, 0.6216599, 1.644737, 1, 0, 0.6235294, 1,
1.190813, -1.264586, 2.294567, 1, 0, 0.6196079, 1,
1.203422, -0.9429327, 1.999506, 1, 0, 0.6117647, 1,
1.210103, -0.7355954, 3.897863, 1, 0, 0.6078432, 1,
1.217788, 0.8079572, 1.440627, 1, 0, 0.6, 1,
1.222379, -0.7597638, 2.761893, 1, 0, 0.5921569, 1,
1.226248, -0.7598655, 3.295879, 1, 0, 0.5882353, 1,
1.246679, -0.7728683, 0.3893386, 1, 0, 0.5803922, 1,
1.248295, -0.5500978, 1.781895, 1, 0, 0.5764706, 1,
1.252341, -0.6174975, 0.3615503, 1, 0, 0.5686275, 1,
1.261998, 0.7603111, 0.9404103, 1, 0, 0.5647059, 1,
1.266915, -0.625187, 2.445062, 1, 0, 0.5568628, 1,
1.268394, -0.85943, 1.987754, 1, 0, 0.5529412, 1,
1.270727, -1.020662, 3.138195, 1, 0, 0.5450981, 1,
1.281256, 0.8597619, 2.446553, 1, 0, 0.5411765, 1,
1.287266, 0.5625166, 0.3708058, 1, 0, 0.5333334, 1,
1.292255, 1.36194, 0.5300048, 1, 0, 0.5294118, 1,
1.316422, 1.20525, 1.615527, 1, 0, 0.5215687, 1,
1.324111, 0.2672378, -0.8739009, 1, 0, 0.5176471, 1,
1.32764, -0.02166344, 2.656188, 1, 0, 0.509804, 1,
1.332338, -0.06545476, 0.02568948, 1, 0, 0.5058824, 1,
1.334048, -1.255256, 0.4404787, 1, 0, 0.4980392, 1,
1.344061, 0.04368335, 1.981788, 1, 0, 0.4901961, 1,
1.345056, 0.8418068, 1.751143, 1, 0, 0.4862745, 1,
1.348659, -1.26099, 2.269971, 1, 0, 0.4784314, 1,
1.355088, 1.350956, -1.791384, 1, 0, 0.4745098, 1,
1.386372, 1.003413, -0.3066741, 1, 0, 0.4666667, 1,
1.390627, -2.014977, 3.218355, 1, 0, 0.4627451, 1,
1.392655, 0.5596017, -0.4737245, 1, 0, 0.454902, 1,
1.402408, -0.1237772, 1.916484, 1, 0, 0.4509804, 1,
1.409982, -0.4592012, 1.916337, 1, 0, 0.4431373, 1,
1.414175, 1.052299, -1.726013, 1, 0, 0.4392157, 1,
1.434703, 0.3288112, 0.9923878, 1, 0, 0.4313726, 1,
1.456057, -0.5963447, 2.315612, 1, 0, 0.427451, 1,
1.476171, 0.4642645, 1.674775, 1, 0, 0.4196078, 1,
1.479952, -0.1125363, 1.548977, 1, 0, 0.4156863, 1,
1.481662, -1.864067, 1.409219, 1, 0, 0.4078431, 1,
1.482009, 0.5219951, 1.512435, 1, 0, 0.4039216, 1,
1.50222, -0.575472, 1.370519, 1, 0, 0.3960784, 1,
1.503701, 0.488783, 2.046872, 1, 0, 0.3882353, 1,
1.507187, -0.5996517, 1.042446, 1, 0, 0.3843137, 1,
1.509074, 1.308374, -0.6052561, 1, 0, 0.3764706, 1,
1.512401, 0.1913281, 1.743263, 1, 0, 0.372549, 1,
1.532002, 0.4040231, -2.234369, 1, 0, 0.3647059, 1,
1.532581, -0.02445034, 2.108402, 1, 0, 0.3607843, 1,
1.537632, 0.6088611, -0.07803956, 1, 0, 0.3529412, 1,
1.54764, 1.684937, 1.938887, 1, 0, 0.3490196, 1,
1.547929, 0.1569612, -0.347925, 1, 0, 0.3411765, 1,
1.558657, 1.422866, -1.296546, 1, 0, 0.3372549, 1,
1.595195, -0.8819383, 2.698261, 1, 0, 0.3294118, 1,
1.595625, -0.995612, 1.99046, 1, 0, 0.3254902, 1,
1.604681, 0.9454395, 2.264266, 1, 0, 0.3176471, 1,
1.6209, 0.01675996, -0.303348, 1, 0, 0.3137255, 1,
1.625459, -0.5354346, 0.9512828, 1, 0, 0.3058824, 1,
1.633702, -0.7917668, 1.510162, 1, 0, 0.2980392, 1,
1.649237, -0.08212961, 2.165968, 1, 0, 0.2941177, 1,
1.652295, -1.687128, 4.157457, 1, 0, 0.2862745, 1,
1.653474, 0.7639156, 1.791834, 1, 0, 0.282353, 1,
1.655289, 1.055458, 1.840242, 1, 0, 0.2745098, 1,
1.662699, 0.4557787, 1.781868, 1, 0, 0.2705882, 1,
1.675316, -0.2364522, 0.9996523, 1, 0, 0.2627451, 1,
1.689428, 0.1740678, 0.5402156, 1, 0, 0.2588235, 1,
1.690187, -0.9530539, 3.174035, 1, 0, 0.2509804, 1,
1.733236, 0.6935833, 1.574928, 1, 0, 0.2470588, 1,
1.758798, -0.08044723, 1.937501, 1, 0, 0.2392157, 1,
1.75921, -1.312966, 1.460314, 1, 0, 0.2352941, 1,
1.77512, 0.6446679, 1.647151, 1, 0, 0.227451, 1,
1.786426, -0.02063533, 2.670262, 1, 0, 0.2235294, 1,
1.789061, 1.329313, 0.2468737, 1, 0, 0.2156863, 1,
1.814775, 0.9250527, 1.603347, 1, 0, 0.2117647, 1,
1.830438, 0.282869, 0.8958618, 1, 0, 0.2039216, 1,
1.852035, -2.499753, 2.965081, 1, 0, 0.1960784, 1,
1.870754, 1.247432, 0.2758676, 1, 0, 0.1921569, 1,
1.888551, -1.019737, 2.182358, 1, 0, 0.1843137, 1,
1.894436, 0.3126448, 1.805851, 1, 0, 0.1803922, 1,
1.895928, 1.510504, 0.7446362, 1, 0, 0.172549, 1,
1.90142, 1.028077, 1.5964, 1, 0, 0.1686275, 1,
1.923927, 0.1496208, 1.348659, 1, 0, 0.1607843, 1,
1.948292, -0.912609, 2.939077, 1, 0, 0.1568628, 1,
2.007515, -0.2827806, 0.2854795, 1, 0, 0.1490196, 1,
2.020503, 0.1591664, 0.01743519, 1, 0, 0.145098, 1,
2.028693, -0.6742243, 2.151014, 1, 0, 0.1372549, 1,
2.035628, -0.3544122, 3.083709, 1, 0, 0.1333333, 1,
2.037387, -0.0641544, 1.519525, 1, 0, 0.1254902, 1,
2.037534, -1.027242, 2.999443, 1, 0, 0.1215686, 1,
2.056733, -1.060862, 3.570056, 1, 0, 0.1137255, 1,
2.061154, -0.738006, 2.479699, 1, 0, 0.1098039, 1,
2.066596, -0.06098368, 1.501446, 1, 0, 0.1019608, 1,
2.067222, -0.2272236, 2.259758, 1, 0, 0.09411765, 1,
2.07389, 0.864031, 1.120553, 1, 0, 0.09019608, 1,
2.083561, -1.339491, 2.435066, 1, 0, 0.08235294, 1,
2.109367, -1.939584, 1.52682, 1, 0, 0.07843138, 1,
2.120903, -1.160628, -0.720392, 1, 0, 0.07058824, 1,
2.151834, 0.6797037, 0.4851363, 1, 0, 0.06666667, 1,
2.220701, 1.974902, 1.464856, 1, 0, 0.05882353, 1,
2.361555, 1.054687, 3.162233, 1, 0, 0.05490196, 1,
2.416579, 2.470992, 0.4840127, 1, 0, 0.04705882, 1,
2.470808, 0.9488992, -0.7972916, 1, 0, 0.04313726, 1,
2.536131, 0.444378, 1.513772, 1, 0, 0.03529412, 1,
2.66828, -0.8685444, 1.036982, 1, 0, 0.03137255, 1,
2.668334, 0.8350793, 0.305429, 1, 0, 0.02352941, 1,
2.942838, -0.2299398, 3.190153, 1, 0, 0.01960784, 1,
3.068348, -0.4799352, 1.707554, 1, 0, 0.01176471, 1,
3.522128, 0.2027775, 1.831464, 1, 0, 0.007843138, 1
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
0.0527401, -4.783844, -7.223266, 0, -0.5, 0.5, 0.5,
0.0527401, -4.783844, -7.223266, 1, -0.5, 0.5, 0.5,
0.0527401, -4.783844, -7.223266, 1, 1.5, 0.5, 0.5,
0.0527401, -4.783844, -7.223266, 0, 1.5, 0.5, 0.5
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
-4.592771, -0.5569401, -7.223266, 0, -0.5, 0.5, 0.5,
-4.592771, -0.5569401, -7.223266, 1, -0.5, 0.5, 0.5,
-4.592771, -0.5569401, -7.223266, 1, 1.5, 0.5, 0.5,
-4.592771, -0.5569401, -7.223266, 0, 1.5, 0.5, 0.5
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
-4.592771, -4.783844, 0.0256803, 0, -0.5, 0.5, 0.5,
-4.592771, -4.783844, 0.0256803, 1, -0.5, 0.5, 0.5,
-4.592771, -4.783844, 0.0256803, 1, 1.5, 0.5, 0.5,
-4.592771, -4.783844, 0.0256803, 0, 1.5, 0.5, 0.5
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
-3, -3.808404, -5.550432,
3, -3.808404, -5.550432,
-3, -3.808404, -5.550432,
-3, -3.970977, -5.829237,
-2, -3.808404, -5.550432,
-2, -3.970977, -5.829237,
-1, -3.808404, -5.550432,
-1, -3.970977, -5.829237,
0, -3.808404, -5.550432,
0, -3.970977, -5.829237,
1, -3.808404, -5.550432,
1, -3.970977, -5.829237,
2, -3.808404, -5.550432,
2, -3.970977, -5.829237,
3, -3.808404, -5.550432,
3, -3.970977, -5.829237
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
-3, -4.296124, -6.386849, 0, -0.5, 0.5, 0.5,
-3, -4.296124, -6.386849, 1, -0.5, 0.5, 0.5,
-3, -4.296124, -6.386849, 1, 1.5, 0.5, 0.5,
-3, -4.296124, -6.386849, 0, 1.5, 0.5, 0.5,
-2, -4.296124, -6.386849, 0, -0.5, 0.5, 0.5,
-2, -4.296124, -6.386849, 1, -0.5, 0.5, 0.5,
-2, -4.296124, -6.386849, 1, 1.5, 0.5, 0.5,
-2, -4.296124, -6.386849, 0, 1.5, 0.5, 0.5,
-1, -4.296124, -6.386849, 0, -0.5, 0.5, 0.5,
-1, -4.296124, -6.386849, 1, -0.5, 0.5, 0.5,
-1, -4.296124, -6.386849, 1, 1.5, 0.5, 0.5,
-1, -4.296124, -6.386849, 0, 1.5, 0.5, 0.5,
0, -4.296124, -6.386849, 0, -0.5, 0.5, 0.5,
0, -4.296124, -6.386849, 1, -0.5, 0.5, 0.5,
0, -4.296124, -6.386849, 1, 1.5, 0.5, 0.5,
0, -4.296124, -6.386849, 0, 1.5, 0.5, 0.5,
1, -4.296124, -6.386849, 0, -0.5, 0.5, 0.5,
1, -4.296124, -6.386849, 1, -0.5, 0.5, 0.5,
1, -4.296124, -6.386849, 1, 1.5, 0.5, 0.5,
1, -4.296124, -6.386849, 0, 1.5, 0.5, 0.5,
2, -4.296124, -6.386849, 0, -0.5, 0.5, 0.5,
2, -4.296124, -6.386849, 1, -0.5, 0.5, 0.5,
2, -4.296124, -6.386849, 1, 1.5, 0.5, 0.5,
2, -4.296124, -6.386849, 0, 1.5, 0.5, 0.5,
3, -4.296124, -6.386849, 0, -0.5, 0.5, 0.5,
3, -4.296124, -6.386849, 1, -0.5, 0.5, 0.5,
3, -4.296124, -6.386849, 1, 1.5, 0.5, 0.5,
3, -4.296124, -6.386849, 0, 1.5, 0.5, 0.5
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
-3.52073, -3, -5.550432,
-3.52073, 2, -5.550432,
-3.52073, -3, -5.550432,
-3.699403, -3, -5.829237,
-3.52073, -2, -5.550432,
-3.699403, -2, -5.829237,
-3.52073, -1, -5.550432,
-3.699403, -1, -5.829237,
-3.52073, 0, -5.550432,
-3.699403, 0, -5.829237,
-3.52073, 1, -5.550432,
-3.699403, 1, -5.829237,
-3.52073, 2, -5.550432,
-3.699403, 2, -5.829237
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
-4.05675, -3, -6.386849, 0, -0.5, 0.5, 0.5,
-4.05675, -3, -6.386849, 1, -0.5, 0.5, 0.5,
-4.05675, -3, -6.386849, 1, 1.5, 0.5, 0.5,
-4.05675, -3, -6.386849, 0, 1.5, 0.5, 0.5,
-4.05675, -2, -6.386849, 0, -0.5, 0.5, 0.5,
-4.05675, -2, -6.386849, 1, -0.5, 0.5, 0.5,
-4.05675, -2, -6.386849, 1, 1.5, 0.5, 0.5,
-4.05675, -2, -6.386849, 0, 1.5, 0.5, 0.5,
-4.05675, -1, -6.386849, 0, -0.5, 0.5, 0.5,
-4.05675, -1, -6.386849, 1, -0.5, 0.5, 0.5,
-4.05675, -1, -6.386849, 1, 1.5, 0.5, 0.5,
-4.05675, -1, -6.386849, 0, 1.5, 0.5, 0.5,
-4.05675, 0, -6.386849, 0, -0.5, 0.5, 0.5,
-4.05675, 0, -6.386849, 1, -0.5, 0.5, 0.5,
-4.05675, 0, -6.386849, 1, 1.5, 0.5, 0.5,
-4.05675, 0, -6.386849, 0, 1.5, 0.5, 0.5,
-4.05675, 1, -6.386849, 0, -0.5, 0.5, 0.5,
-4.05675, 1, -6.386849, 1, -0.5, 0.5, 0.5,
-4.05675, 1, -6.386849, 1, 1.5, 0.5, 0.5,
-4.05675, 1, -6.386849, 0, 1.5, 0.5, 0.5,
-4.05675, 2, -6.386849, 0, -0.5, 0.5, 0.5,
-4.05675, 2, -6.386849, 1, -0.5, 0.5, 0.5,
-4.05675, 2, -6.386849, 1, 1.5, 0.5, 0.5,
-4.05675, 2, -6.386849, 0, 1.5, 0.5, 0.5
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
-3.52073, -3.808404, -4,
-3.52073, -3.808404, 4,
-3.52073, -3.808404, -4,
-3.699403, -3.970977, -4,
-3.52073, -3.808404, -2,
-3.699403, -3.970977, -2,
-3.52073, -3.808404, 0,
-3.699403, -3.970977, 0,
-3.52073, -3.808404, 2,
-3.699403, -3.970977, 2,
-3.52073, -3.808404, 4,
-3.699403, -3.970977, 4
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
-4.05675, -4.296124, -4, 0, -0.5, 0.5, 0.5,
-4.05675, -4.296124, -4, 1, -0.5, 0.5, 0.5,
-4.05675, -4.296124, -4, 1, 1.5, 0.5, 0.5,
-4.05675, -4.296124, -4, 0, 1.5, 0.5, 0.5,
-4.05675, -4.296124, -2, 0, -0.5, 0.5, 0.5,
-4.05675, -4.296124, -2, 1, -0.5, 0.5, 0.5,
-4.05675, -4.296124, -2, 1, 1.5, 0.5, 0.5,
-4.05675, -4.296124, -2, 0, 1.5, 0.5, 0.5,
-4.05675, -4.296124, 0, 0, -0.5, 0.5, 0.5,
-4.05675, -4.296124, 0, 1, -0.5, 0.5, 0.5,
-4.05675, -4.296124, 0, 1, 1.5, 0.5, 0.5,
-4.05675, -4.296124, 0, 0, 1.5, 0.5, 0.5,
-4.05675, -4.296124, 2, 0, -0.5, 0.5, 0.5,
-4.05675, -4.296124, 2, 1, -0.5, 0.5, 0.5,
-4.05675, -4.296124, 2, 1, 1.5, 0.5, 0.5,
-4.05675, -4.296124, 2, 0, 1.5, 0.5, 0.5,
-4.05675, -4.296124, 4, 0, -0.5, 0.5, 0.5,
-4.05675, -4.296124, 4, 1, -0.5, 0.5, 0.5,
-4.05675, -4.296124, 4, 1, 1.5, 0.5, 0.5,
-4.05675, -4.296124, 4, 0, 1.5, 0.5, 0.5
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
-3.52073, -3.808404, -5.550432,
-3.52073, 2.694524, -5.550432,
-3.52073, -3.808404, 5.601793,
-3.52073, 2.694524, 5.601793,
-3.52073, -3.808404, -5.550432,
-3.52073, -3.808404, 5.601793,
-3.52073, 2.694524, -5.550432,
-3.52073, 2.694524, 5.601793,
-3.52073, -3.808404, -5.550432,
3.62621, -3.808404, -5.550432,
-3.52073, -3.808404, 5.601793,
3.62621, -3.808404, 5.601793,
-3.52073, 2.694524, -5.550432,
3.62621, 2.694524, -5.550432,
-3.52073, 2.694524, 5.601793,
3.62621, 2.694524, 5.601793,
3.62621, -3.808404, -5.550432,
3.62621, 2.694524, -5.550432,
3.62621, -3.808404, 5.601793,
3.62621, 2.694524, 5.601793,
3.62621, -3.808404, -5.550432,
3.62621, -3.808404, 5.601793,
3.62621, 2.694524, -5.550432,
3.62621, 2.694524, 5.601793
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
var radius = 7.879407;
var distance = 35.05637;
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
mvMatrix.translate( -0.0527401, 0.5569401, -0.0256803 );
mvMatrix.scale( 1.19203, 1.310082, 0.7639166 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.05637);
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
benazolin-ethyl<-read.table("benazolin-ethyl.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-benazolin-ethyl$V2
```

```
## Error in eval(expr, envir, enclos): object 'benazolin' not found
```

```r
y<-benazolin-ethyl$V3
```

```
## Error in eval(expr, envir, enclos): object 'benazolin' not found
```

```r
z<-benazolin-ethyl$V4
```

```
## Error in eval(expr, envir, enclos): object 'benazolin' not found
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
-3.416648, -0.2109995, -0.5847826, 0, 0, 1, 1, 1,
-3.292525, 0.6522459, 0.04722008, 1, 0, 0, 1, 1,
-3.226254, -0.1176647, -3.692719, 1, 0, 0, 1, 1,
-2.76074, -0.3014071, -1.018999, 1, 0, 0, 1, 1,
-2.638437, 1.582235, -0.3239596, 1, 0, 0, 1, 1,
-2.615206, 0.4767153, -2.247997, 1, 0, 0, 1, 1,
-2.537452, 1.125178, -0.9286686, 0, 0, 0, 1, 1,
-2.506751, -0.921932, -2.354412, 0, 0, 0, 1, 1,
-2.500696, -1.247048, -1.945549, 0, 0, 0, 1, 1,
-2.466457, -0.2153953, -0.7921836, 0, 0, 0, 1, 1,
-2.356237, 0.3760364, -2.065221, 0, 0, 0, 1, 1,
-2.291629, -1.583297, -2.684901, 0, 0, 0, 1, 1,
-2.273358, -0.4629984, -2.108568, 0, 0, 0, 1, 1,
-2.257273, -0.9786478, -2.973142, 1, 1, 1, 1, 1,
-2.252732, -0.07474364, -2.351441, 1, 1, 1, 1, 1,
-2.219873, -0.9192962, -2.668318, 1, 1, 1, 1, 1,
-2.184165, 2.008929, -0.9879066, 1, 1, 1, 1, 1,
-2.178859, -0.04066989, -0.6036432, 1, 1, 1, 1, 1,
-2.166657, -1.789717, -2.262225, 1, 1, 1, 1, 1,
-2.086025, 0.5426458, -1.035925, 1, 1, 1, 1, 1,
-2.081784, 0.8964133, -1.798136, 1, 1, 1, 1, 1,
-2.060111, -0.2278375, -2.536444, 1, 1, 1, 1, 1,
-2.016664, -0.6729457, -2.397387, 1, 1, 1, 1, 1,
-2.013139, 0.00167693, -1.997163, 1, 1, 1, 1, 1,
-2.004611, 0.6663315, -2.212189, 1, 1, 1, 1, 1,
-1.963885, -0.5503251, -2.545496, 1, 1, 1, 1, 1,
-1.953862, -0.6927679, -0.7087919, 1, 1, 1, 1, 1,
-1.944115, 0.523986, -0.8877101, 1, 1, 1, 1, 1,
-1.943937, 0.3596258, -1.825211, 0, 0, 1, 1, 1,
-1.940081, -0.5155624, -3.486583, 1, 0, 0, 1, 1,
-1.939354, 2.071435, -0.1120595, 1, 0, 0, 1, 1,
-1.925373, 0.7294028, -1.652257, 1, 0, 0, 1, 1,
-1.863038, -0.007186479, -2.722363, 1, 0, 0, 1, 1,
-1.853255, 1.631569, -0.6460747, 1, 0, 0, 1, 1,
-1.852135, -1.117306, -1.799943, 0, 0, 0, 1, 1,
-1.841688, -1.278654, -2.076036, 0, 0, 0, 1, 1,
-1.798628, -0.3229772, -2.777467, 0, 0, 0, 1, 1,
-1.787582, 0.5985168, -1.792096, 0, 0, 0, 1, 1,
-1.780677, 0.6754144, 0.1371451, 0, 0, 0, 1, 1,
-1.715324, 0.9696167, -1.264008, 0, 0, 0, 1, 1,
-1.707716, 0.1772864, -0.2354692, 0, 0, 0, 1, 1,
-1.696848, -0.02205747, -1.383403, 1, 1, 1, 1, 1,
-1.656508, 0.7765871, 0.8430229, 1, 1, 1, 1, 1,
-1.642403, 0.8163485, -2.396848, 1, 1, 1, 1, 1,
-1.640772, 1.619867, -0.4445864, 1, 1, 1, 1, 1,
-1.638601, -0.5086969, -1.677494, 1, 1, 1, 1, 1,
-1.619636, 0.508649, -1.266216, 1, 1, 1, 1, 1,
-1.616424, -1.055154, -0.8825476, 1, 1, 1, 1, 1,
-1.61226, -0.4264306, -3.565185, 1, 1, 1, 1, 1,
-1.609717, 0.5410672, -1.402126, 1, 1, 1, 1, 1,
-1.609326, 0.2009343, -2.582253, 1, 1, 1, 1, 1,
-1.606037, -0.2154142, -0.712048, 1, 1, 1, 1, 1,
-1.596295, 0.08277291, -0.9958555, 1, 1, 1, 1, 1,
-1.585053, 0.4792026, -1.733419, 1, 1, 1, 1, 1,
-1.573029, -0.7715625, -1.790455, 1, 1, 1, 1, 1,
-1.562974, 1.045057, 0.3156619, 1, 1, 1, 1, 1,
-1.54185, 0.6531042, -0.7648196, 0, 0, 1, 1, 1,
-1.538466, -0.9307574, -3.17099, 1, 0, 0, 1, 1,
-1.491867, -0.7651715, -0.5756402, 1, 0, 0, 1, 1,
-1.480068, -0.3490276, -1.581207, 1, 0, 0, 1, 1,
-1.479605, 1.448699, -2.388792, 1, 0, 0, 1, 1,
-1.475185, 0.6927418, -2.763329, 1, 0, 0, 1, 1,
-1.460391, -0.731817, -3.658172, 0, 0, 0, 1, 1,
-1.458114, 0.2420713, -2.743647, 0, 0, 0, 1, 1,
-1.457474, -0.1805894, -1.071239, 0, 0, 0, 1, 1,
-1.454821, -0.3086608, -1.922339, 0, 0, 0, 1, 1,
-1.453774, 2.068185, -0.405865, 0, 0, 0, 1, 1,
-1.444105, -0.2143865, -1.280517, 0, 0, 0, 1, 1,
-1.433036, 0.2748804, -1.46969, 0, 0, 0, 1, 1,
-1.432707, -0.4592139, -1.719185, 1, 1, 1, 1, 1,
-1.431041, 0.1232633, -1.995097, 1, 1, 1, 1, 1,
-1.428324, 1.64422, -1.361453, 1, 1, 1, 1, 1,
-1.417157, 0.4211679, -0.3490223, 1, 1, 1, 1, 1,
-1.413877, -0.3028959, -2.159752, 1, 1, 1, 1, 1,
-1.406795, -1.036014, -3.790842, 1, 1, 1, 1, 1,
-1.404537, -1.960567, -1.728647, 1, 1, 1, 1, 1,
-1.401959, 0.6511964, -3.545857, 1, 1, 1, 1, 1,
-1.399207, 0.3056891, -0.9653921, 1, 1, 1, 1, 1,
-1.397394, 0.5943518, -0.9519925, 1, 1, 1, 1, 1,
-1.396652, -0.4003955, -1.43224, 1, 1, 1, 1, 1,
-1.385252, 2.140062, -1.258224, 1, 1, 1, 1, 1,
-1.380795, 0.8316998, -1.25808, 1, 1, 1, 1, 1,
-1.371434, 1.225442, -0.2791312, 1, 1, 1, 1, 1,
-1.3522, 1.181236, -1.614514, 1, 1, 1, 1, 1,
-1.350711, -0.2714402, -2.687993, 0, 0, 1, 1, 1,
-1.350684, 0.3287665, -2.065472, 1, 0, 0, 1, 1,
-1.344326, -2.12665, -2.595025, 1, 0, 0, 1, 1,
-1.343486, 0.8752111, -1.168547, 1, 0, 0, 1, 1,
-1.333552, 1.073741, -0.08039878, 1, 0, 0, 1, 1,
-1.329504, -0.5385801, 0.6979455, 1, 0, 0, 1, 1,
-1.32656, 1.410857, 2.386977, 0, 0, 0, 1, 1,
-1.323024, -0.3718775, -1.944754, 0, 0, 0, 1, 1,
-1.321005, -0.503692, -4.232898, 0, 0, 0, 1, 1,
-1.319475, 0.2500583, -0.004345325, 0, 0, 0, 1, 1,
-1.319469, 0.3279414, -2.501593, 0, 0, 0, 1, 1,
-1.313194, 0.1581654, -1.659037, 0, 0, 0, 1, 1,
-1.313065, 1.032805, -2.802406, 0, 0, 0, 1, 1,
-1.310377, 0.7775872, -2.718586, 1, 1, 1, 1, 1,
-1.310159, 0.4943076, -0.8255554, 1, 1, 1, 1, 1,
-1.300829, -0.6439162, -0.7476552, 1, 1, 1, 1, 1,
-1.29835, -0.2944489, -1.518835, 1, 1, 1, 1, 1,
-1.28332, -0.6926903, -3.639883, 1, 1, 1, 1, 1,
-1.280975, 1.195924, -1.705739, 1, 1, 1, 1, 1,
-1.276652, -0.8276977, -1.644029, 1, 1, 1, 1, 1,
-1.262702, 1.414031, 0.08506095, 1, 1, 1, 1, 1,
-1.261817, 0.09860967, -0.1465938, 1, 1, 1, 1, 1,
-1.239729, -0.5415077, -0.8247588, 1, 1, 1, 1, 1,
-1.230369, -0.222869, -1.600796, 1, 1, 1, 1, 1,
-1.225898, -1.290942, -0.6437548, 1, 1, 1, 1, 1,
-1.224803, 0.01551798, -1.214218, 1, 1, 1, 1, 1,
-1.222763, -1.187064, -2.401748, 1, 1, 1, 1, 1,
-1.220421, 0.8877445, 1.449678, 1, 1, 1, 1, 1,
-1.214494, -0.9044639, -2.634492, 0, 0, 1, 1, 1,
-1.210551, -0.4001954, -0.86044, 1, 0, 0, 1, 1,
-1.20966, 0.6267768, -1.347269, 1, 0, 0, 1, 1,
-1.202738, 0.2681225, 0.05071518, 1, 0, 0, 1, 1,
-1.193667, -0.9888153, -3.070379, 1, 0, 0, 1, 1,
-1.18661, -1.096415, -1.580916, 1, 0, 0, 1, 1,
-1.166106, -1.026716, -1.066117, 0, 0, 0, 1, 1,
-1.165215, -0.01693917, -0.9353434, 0, 0, 0, 1, 1,
-1.162622, -0.7672979, -3.307207, 0, 0, 0, 1, 1,
-1.159898, 0.9882795, -1.816601, 0, 0, 0, 1, 1,
-1.158062, 0.8949943, -1.156546, 0, 0, 0, 1, 1,
-1.154531, -1.32392, -1.475558, 0, 0, 0, 1, 1,
-1.153816, 1.616433, -0.1085571, 0, 0, 0, 1, 1,
-1.144675, -0.5803109, -1.258053, 1, 1, 1, 1, 1,
-1.14081, 0.9031051, 0.06878361, 1, 1, 1, 1, 1,
-1.135525, 0.4755934, -2.262118, 1, 1, 1, 1, 1,
-1.126602, -0.8929902, -4.023621, 1, 1, 1, 1, 1,
-1.12158, -1.245887, -1.603647, 1, 1, 1, 1, 1,
-1.111426, -0.7786463, -1.959495, 1, 1, 1, 1, 1,
-1.111045, 0.9803717, -0.9021982, 1, 1, 1, 1, 1,
-1.106511, -1.158552, -2.562762, 1, 1, 1, 1, 1,
-1.103531, 0.2449961, -0.3322951, 1, 1, 1, 1, 1,
-1.101194, -0.4581685, -2.253, 1, 1, 1, 1, 1,
-1.094053, -1.604322, -2.531419, 1, 1, 1, 1, 1,
-1.093013, -0.2658065, -2.302012, 1, 1, 1, 1, 1,
-1.090202, 1.243407, -1.013969, 1, 1, 1, 1, 1,
-1.080933, 1.254707, 0.1273099, 1, 1, 1, 1, 1,
-1.076865, 0.4899904, -2.478369, 1, 1, 1, 1, 1,
-1.073612, -1.353305, -2.92957, 0, 0, 1, 1, 1,
-1.066955, 0.6936027, -1.077113, 1, 0, 0, 1, 1,
-1.057908, -0.3050237, -2.584445, 1, 0, 0, 1, 1,
-1.055606, 0.3159999, -2.426314, 1, 0, 0, 1, 1,
-1.050376, 0.1829673, -2.235315, 1, 0, 0, 1, 1,
-1.047646, 0.692607, -1.659214, 1, 0, 0, 1, 1,
-1.042705, 0.2232362, -0.6943702, 0, 0, 0, 1, 1,
-1.042215, -0.7401497, -0.8013427, 0, 0, 0, 1, 1,
-1.038036, -0.1470282, -0.4324088, 0, 0, 0, 1, 1,
-1.036086, 0.6780279, -0.5487084, 0, 0, 0, 1, 1,
-1.033718, -0.09959448, -1.731583, 0, 0, 0, 1, 1,
-1.025184, -1.65494, -3.132667, 0, 0, 0, 1, 1,
-1.015896, -1.316777, -2.634012, 0, 0, 0, 1, 1,
-1.01283, 0.117365, 0.3455403, 1, 1, 1, 1, 1,
-1.012816, -0.1334525, -0.3681788, 1, 1, 1, 1, 1,
-1.010161, -1.400465, -3.642333, 1, 1, 1, 1, 1,
-1.007199, -0.7065924, -3.748263, 1, 1, 1, 1, 1,
-1.006511, 0.5015923, -3.21582, 1, 1, 1, 1, 1,
-1.004556, 1.93046, -0.3278956, 1, 1, 1, 1, 1,
-1.002278, -1.719824, -3.30963, 1, 1, 1, 1, 1,
-1.000451, -0.1609506, -1.473911, 1, 1, 1, 1, 1,
-0.9986005, 1.887178, -0.231017, 1, 1, 1, 1, 1,
-0.9981002, -1.89487, -2.325669, 1, 1, 1, 1, 1,
-0.9947577, 0.9427934, 0.08803491, 1, 1, 1, 1, 1,
-0.9919936, 0.1156458, -0.7173034, 1, 1, 1, 1, 1,
-0.9786879, 1.320905, -0.2846619, 1, 1, 1, 1, 1,
-0.9762818, -1.468963, -1.221337, 1, 1, 1, 1, 1,
-0.9728944, 0.09100544, -2.833238, 1, 1, 1, 1, 1,
-0.9673265, 0.57751, -2.542799, 0, 0, 1, 1, 1,
-0.9669718, 1.648981, -0.3041274, 1, 0, 0, 1, 1,
-0.9651136, 0.6004868, -1.358966, 1, 0, 0, 1, 1,
-0.96332, -0.09618737, -1.876781, 1, 0, 0, 1, 1,
-0.9547502, 0.7199041, -0.238041, 1, 0, 0, 1, 1,
-0.9498985, -0.1599136, -1.552079, 1, 0, 0, 1, 1,
-0.9492896, -1.506408, -1.786031, 0, 0, 0, 1, 1,
-0.9492305, 0.7891431, 0.08662667, 0, 0, 0, 1, 1,
-0.9401981, 2.053328, 0.4094127, 0, 0, 0, 1, 1,
-0.9339332, 0.540998, -0.7428319, 0, 0, 0, 1, 1,
-0.9259365, 0.2679836, -0.7200375, 0, 0, 0, 1, 1,
-0.9177296, 1.475695, -1.537129, 0, 0, 0, 1, 1,
-0.9132715, 0.5118773, -1.535995, 0, 0, 0, 1, 1,
-0.9126929, -0.2255294, -0.1411724, 1, 1, 1, 1, 1,
-0.9080447, 1.487528, -2.039733, 1, 1, 1, 1, 1,
-0.9077077, 0.6592978, -0.4046643, 1, 1, 1, 1, 1,
-0.9073092, -0.288661, -2.903862, 1, 1, 1, 1, 1,
-0.9059097, 1.801034, 0.6294244, 1, 1, 1, 1, 1,
-0.9048097, -0.7274483, -1.458803, 1, 1, 1, 1, 1,
-0.8991195, -2.121839, -2.738721, 1, 1, 1, 1, 1,
-0.8954321, -0.1449972, -3.143574, 1, 1, 1, 1, 1,
-0.8927341, 0.5247196, -3.028048, 1, 1, 1, 1, 1,
-0.8927182, -1.163514, -3.090949, 1, 1, 1, 1, 1,
-0.8906159, 0.1849352, -1.580683, 1, 1, 1, 1, 1,
-0.8850081, 0.5805591, -2.699479, 1, 1, 1, 1, 1,
-0.8824661, -1.038447, -2.353284, 1, 1, 1, 1, 1,
-0.8732181, 1.895653, 0.4771901, 1, 1, 1, 1, 1,
-0.8713729, -1.012612, -1.9153, 1, 1, 1, 1, 1,
-0.8624884, 1.704069, -0.4891301, 0, 0, 1, 1, 1,
-0.8623807, 0.6838319, -1.452512, 1, 0, 0, 1, 1,
-0.8623619, -0.1953156, -1.448681, 1, 0, 0, 1, 1,
-0.8613905, 0.4338214, -0.9155766, 1, 0, 0, 1, 1,
-0.8564817, 0.1998429, -1.634622, 1, 0, 0, 1, 1,
-0.85329, -0.1985851, -2.199192, 1, 0, 0, 1, 1,
-0.8498591, 0.6494857, -1.154917, 0, 0, 0, 1, 1,
-0.8463774, 1.123578, -0.8440161, 0, 0, 0, 1, 1,
-0.8463271, 0.7002712, 0.1265898, 0, 0, 0, 1, 1,
-0.8409876, -1.243609, -2.577898, 0, 0, 0, 1, 1,
-0.8363888, -0.3985839, -2.356939, 0, 0, 0, 1, 1,
-0.8276967, 1.274913, -2.042364, 0, 0, 0, 1, 1,
-0.8276349, 0.9576837, -0.8355208, 0, 0, 0, 1, 1,
-0.8273031, 0.7951146, -1.009382, 1, 1, 1, 1, 1,
-0.8258182, 1.54418, -0.9812562, 1, 1, 1, 1, 1,
-0.823243, 0.6166965, 1.371618, 1, 1, 1, 1, 1,
-0.818208, 1.817389, 0.7671674, 1, 1, 1, 1, 1,
-0.8167799, -0.5937829, -3.087054, 1, 1, 1, 1, 1,
-0.8114957, 1.893218, 1.74673, 1, 1, 1, 1, 1,
-0.8100519, 1.520696, -0.04143145, 1, 1, 1, 1, 1,
-0.8044213, 0.3904144, -0.6012396, 1, 1, 1, 1, 1,
-0.797469, 0.4209612, -1.076103, 1, 1, 1, 1, 1,
-0.7949392, 1.594231, -0.1790199, 1, 1, 1, 1, 1,
-0.7916373, 0.4626285, -1.709807, 1, 1, 1, 1, 1,
-0.7910327, 0.2589827, -2.104268, 1, 1, 1, 1, 1,
-0.7903047, -0.8073402, -2.553315, 1, 1, 1, 1, 1,
-0.7874765, -0.1607945, -2.658236, 1, 1, 1, 1, 1,
-0.7732849, -1.366054, -2.709057, 1, 1, 1, 1, 1,
-0.7708379, -1.249342, -1.10517, 0, 0, 1, 1, 1,
-0.7703785, -0.130468, -2.263586, 1, 0, 0, 1, 1,
-0.7677979, 1.010799, -0.7624757, 1, 0, 0, 1, 1,
-0.7661424, 0.2827174, -0.4734773, 1, 0, 0, 1, 1,
-0.7620443, 0.1493325, -1.309969, 1, 0, 0, 1, 1,
-0.759317, 0.8627595, 0.5689247, 1, 0, 0, 1, 1,
-0.7587976, -0.9846654, -2.312464, 0, 0, 0, 1, 1,
-0.7579302, 0.3987515, -2.039133, 0, 0, 0, 1, 1,
-0.755228, -1.576028, -4.915792, 0, 0, 0, 1, 1,
-0.7507433, -0.6390499, -1.773941, 0, 0, 0, 1, 1,
-0.7493683, 1.160056, -0.7664178, 0, 0, 0, 1, 1,
-0.7471994, 0.6929132, -2.550486, 0, 0, 0, 1, 1,
-0.7422737, 1.173307, -0.9565139, 0, 0, 0, 1, 1,
-0.7398162, 0.2139044, -1.332744, 1, 1, 1, 1, 1,
-0.7358316, -0.6171876, -2.484904, 1, 1, 1, 1, 1,
-0.7353979, 0.9146433, -1.533949, 1, 1, 1, 1, 1,
-0.7343779, -3.713701, -3.080015, 1, 1, 1, 1, 1,
-0.7294534, -1.257298, -2.145934, 1, 1, 1, 1, 1,
-0.7283233, -1.462335, -1.13838, 1, 1, 1, 1, 1,
-0.7279402, 0.38744, -1.186113, 1, 1, 1, 1, 1,
-0.7263923, 1.1201, -0.1265966, 1, 1, 1, 1, 1,
-0.7258488, -0.06590156, -2.601366, 1, 1, 1, 1, 1,
-0.717212, -1.288453, -2.734557, 1, 1, 1, 1, 1,
-0.7134525, -0.6273997, -2.197938, 1, 1, 1, 1, 1,
-0.7109011, 0.2566691, -0.1423104, 1, 1, 1, 1, 1,
-0.7101248, 0.0192327, -0.8124102, 1, 1, 1, 1, 1,
-0.704298, -1.271335, -1.33142, 1, 1, 1, 1, 1,
-0.7036836, -0.1531918, -2.258689, 1, 1, 1, 1, 1,
-0.6993358, -1.091554, -2.272093, 0, 0, 1, 1, 1,
-0.6932203, -0.04788666, -1.599186, 1, 0, 0, 1, 1,
-0.6930916, 0.3344076, -1.192271, 1, 0, 0, 1, 1,
-0.6911648, -0.7955678, -1.549755, 1, 0, 0, 1, 1,
-0.6903507, -0.6353745, -2.626202, 1, 0, 0, 1, 1,
-0.6889627, -0.4375842, -3.019706, 1, 0, 0, 1, 1,
-0.684602, 0.9725018, -0.7775291, 0, 0, 0, 1, 1,
-0.6824307, -0.1634132, -2.99014, 0, 0, 0, 1, 1,
-0.6797727, -1.778292, -3.899253, 0, 0, 0, 1, 1,
-0.6779659, -0.9186738, -2.334159, 0, 0, 0, 1, 1,
-0.6777085, 2.084359, -1.069163, 0, 0, 0, 1, 1,
-0.6719774, 0.02727932, -0.1123534, 0, 0, 0, 1, 1,
-0.6692129, -0.1273694, -0.6853558, 0, 0, 0, 1, 1,
-0.6689194, 0.324737, -2.370642, 1, 1, 1, 1, 1,
-0.6674656, -0.05114571, 0.1544763, 1, 1, 1, 1, 1,
-0.6669072, 0.5212517, -1.736481, 1, 1, 1, 1, 1,
-0.6650451, 0.6706978, 0.6090449, 1, 1, 1, 1, 1,
-0.6638629, 0.2575238, -1.861115, 1, 1, 1, 1, 1,
-0.6499271, 0.1920107, -1.199951, 1, 1, 1, 1, 1,
-0.6380687, -0.8989766, -1.85958, 1, 1, 1, 1, 1,
-0.6357707, 0.006908432, 0.3271367, 1, 1, 1, 1, 1,
-0.6314905, -2.047444, -1.704334, 1, 1, 1, 1, 1,
-0.6277988, -1.12888, -2.949586, 1, 1, 1, 1, 1,
-0.6260855, 2.045732, 1.886793, 1, 1, 1, 1, 1,
-0.6249871, -0.7607301, -0.4120714, 1, 1, 1, 1, 1,
-0.6243935, -0.1377603, -3.075466, 1, 1, 1, 1, 1,
-0.6237864, -1.367759, -2.715217, 1, 1, 1, 1, 1,
-0.6231826, 1.861693, 1.56121, 1, 1, 1, 1, 1,
-0.6222264, -1.091147, -2.142112, 0, 0, 1, 1, 1,
-0.6214294, -0.3469658, -3.193134, 1, 0, 0, 1, 1,
-0.6210335, 0.4332689, 0.684951, 1, 0, 0, 1, 1,
-0.6152218, 0.7983254, -1.24585, 1, 0, 0, 1, 1,
-0.610727, 0.2389303, -2.028073, 1, 0, 0, 1, 1,
-0.6092626, 0.588228, -0.34399, 1, 0, 0, 1, 1,
-0.6050338, 0.7910928, -1.36413, 0, 0, 0, 1, 1,
-0.602814, -0.06049268, -1.98871, 0, 0, 0, 1, 1,
-0.6009578, -0.9975888, -2.057589, 0, 0, 0, 1, 1,
-0.6003243, -1.550993, -2.293205, 0, 0, 0, 1, 1,
-0.5984725, -0.1650343, -1.37886, 0, 0, 0, 1, 1,
-0.5982422, -0.1814469, -2.532573, 0, 0, 0, 1, 1,
-0.5970547, -1.379849, -4.01521, 0, 0, 0, 1, 1,
-0.5933563, -0.8792983, -2.711954, 1, 1, 1, 1, 1,
-0.5923573, -0.1457975, -0.5888275, 1, 1, 1, 1, 1,
-0.5843667, -0.93704, -4.041372, 1, 1, 1, 1, 1,
-0.5825768, 1.270844, -0.5166481, 1, 1, 1, 1, 1,
-0.5811399, -0.9314418, -1.28593, 1, 1, 1, 1, 1,
-0.5803085, -0.9788509, -3.174507, 1, 1, 1, 1, 1,
-0.5778972, 0.9567441, 0.2622913, 1, 1, 1, 1, 1,
-0.5765566, -0.6766835, -2.748764, 1, 1, 1, 1, 1,
-0.5756922, 0.1093156, 1.764905, 1, 1, 1, 1, 1,
-0.5703562, -0.9944297, -0.3480622, 1, 1, 1, 1, 1,
-0.5698211, 0.3846779, -0.6412178, 1, 1, 1, 1, 1,
-0.5668036, -1.582726, -3.151025, 1, 1, 1, 1, 1,
-0.5632787, 0.9971685, -0.3648528, 1, 1, 1, 1, 1,
-0.5594103, -0.410428, -2.141356, 1, 1, 1, 1, 1,
-0.5538545, 0.007056802, -0.07719558, 1, 1, 1, 1, 1,
-0.5520929, -0.4528172, -1.137628, 0, 0, 1, 1, 1,
-0.551122, -2.251845, -1.748345, 1, 0, 0, 1, 1,
-0.5465965, -0.1615697, -1.566198, 1, 0, 0, 1, 1,
-0.5426338, 0.3448131, 0.6731682, 1, 0, 0, 1, 1,
-0.5407796, -0.07414208, -0.8184516, 1, 0, 0, 1, 1,
-0.5385401, -1.007645, -4.228354, 1, 0, 0, 1, 1,
-0.5351745, 0.4949948, -0.3337354, 0, 0, 0, 1, 1,
-0.5328734, 0.1243407, -0.4308684, 0, 0, 0, 1, 1,
-0.5323854, -0.8989567, -1.92636, 0, 0, 0, 1, 1,
-0.5301612, 0.1939206, -1.72397, 0, 0, 0, 1, 1,
-0.528552, 0.5414141, -0.09895346, 0, 0, 0, 1, 1,
-0.5175697, 1.611997, -0.8277262, 0, 0, 0, 1, 1,
-0.5174256, 0.6687011, -1.252388, 0, 0, 0, 1, 1,
-0.5167656, -0.2410066, -1.312448, 1, 1, 1, 1, 1,
-0.5160312, 1.608785, -0.6031506, 1, 1, 1, 1, 1,
-0.5157598, 1.716691, -2.32501, 1, 1, 1, 1, 1,
-0.5146524, 0.8186243, -0.2217615, 1, 1, 1, 1, 1,
-0.5115194, -0.7008556, -1.839485, 1, 1, 1, 1, 1,
-0.5093061, 0.7991985, -0.03595322, 1, 1, 1, 1, 1,
-0.5050385, 0.6902311, -0.5216646, 1, 1, 1, 1, 1,
-0.5037821, -0.4606604, -3.131452, 1, 1, 1, 1, 1,
-0.490635, 0.4550035, -1.25647, 1, 1, 1, 1, 1,
-0.4906085, -0.6042955, -2.896331, 1, 1, 1, 1, 1,
-0.4851043, 0.6939142, -0.6385944, 1, 1, 1, 1, 1,
-0.4836267, -1.072823, -0.7718679, 1, 1, 1, 1, 1,
-0.4811778, -0.6513443, -1.792477, 1, 1, 1, 1, 1,
-0.4769216, -0.2255645, -2.476564, 1, 1, 1, 1, 1,
-0.4764584, -1.084471, -3.538259, 1, 1, 1, 1, 1,
-0.4729539, 0.2748753, -0.9812769, 0, 0, 1, 1, 1,
-0.4714488, 0.06377766, -1.106529, 1, 0, 0, 1, 1,
-0.4629601, 0.3712082, -3.282799, 1, 0, 0, 1, 1,
-0.4625728, -0.7769409, -1.961993, 1, 0, 0, 1, 1,
-0.4576151, -0.03551475, -1.37362, 1, 0, 0, 1, 1,
-0.4445879, -1.167673, -3.235515, 1, 0, 0, 1, 1,
-0.4440023, -1.676051, -2.26584, 0, 0, 0, 1, 1,
-0.4434424, -1.512965, -3.140482, 0, 0, 0, 1, 1,
-0.4414482, -0.1571631, -0.814328, 0, 0, 0, 1, 1,
-0.4410012, 0.5385745, 0.160024, 0, 0, 0, 1, 1,
-0.4408189, 1.013697, 0.07888804, 0, 0, 0, 1, 1,
-0.4321268, -0.6259512, -0.9308416, 0, 0, 0, 1, 1,
-0.4230066, -2.110196, -3.852926, 0, 0, 0, 1, 1,
-0.4229303, 0.211824, -2.108308, 1, 1, 1, 1, 1,
-0.418969, -1.329506, -2.463568, 1, 1, 1, 1, 1,
-0.4171389, -0.5927637, -2.768086, 1, 1, 1, 1, 1,
-0.4152983, -1.734283, -4.366516, 1, 1, 1, 1, 1,
-0.4137261, 1.259601, -1.871107, 1, 1, 1, 1, 1,
-0.4136454, -0.1521822, -2.041401, 1, 1, 1, 1, 1,
-0.4109534, -0.6190178, -3.021114, 1, 1, 1, 1, 1,
-0.4074975, 0.583226, -1.665014, 1, 1, 1, 1, 1,
-0.4070586, 0.2479841, -2.058873, 1, 1, 1, 1, 1,
-0.4055905, 0.6770577, -1.284046, 1, 1, 1, 1, 1,
-0.4029314, 1.099545, -0.7585955, 1, 1, 1, 1, 1,
-0.4028436, 0.7421995, -1.495873, 1, 1, 1, 1, 1,
-0.3929361, 0.6057028, -0.934782, 1, 1, 1, 1, 1,
-0.3922366, -0.1920079, -2.592084, 1, 1, 1, 1, 1,
-0.3910651, -1.685446, -2.489109, 1, 1, 1, 1, 1,
-0.3881728, -1.129393, -1.886334, 0, 0, 1, 1, 1,
-0.3875241, -0.2124554, -1.896699, 1, 0, 0, 1, 1,
-0.3874482, -0.4599783, -1.400055, 1, 0, 0, 1, 1,
-0.3831213, 0.7227175, 0.6769129, 1, 0, 0, 1, 1,
-0.3800676, 0.1811053, -1.488712, 1, 0, 0, 1, 1,
-0.3792339, -0.6493251, -2.416885, 1, 0, 0, 1, 1,
-0.3779493, 0.1880825, -2.062351, 0, 0, 0, 1, 1,
-0.3766474, -0.1959531, -1.919418, 0, 0, 0, 1, 1,
-0.3750494, 0.8784809, -0.04361036, 0, 0, 0, 1, 1,
-0.3732483, -1.147708, -2.266953, 0, 0, 0, 1, 1,
-0.3732456, -0.5646134, -0.9313708, 0, 0, 0, 1, 1,
-0.3708599, 0.8967408, 1.193696, 0, 0, 0, 1, 1,
-0.3708478, 1.475015, 0.1895102, 0, 0, 0, 1, 1,
-0.3692036, 0.4417523, -3.070772, 1, 1, 1, 1, 1,
-0.3672486, 0.1907443, -0.4466325, 1, 1, 1, 1, 1,
-0.3656991, -1.260558, -2.866558, 1, 1, 1, 1, 1,
-0.364821, 1.241095, -1.460631, 1, 1, 1, 1, 1,
-0.3602097, 1.582734, -0.4685483, 1, 1, 1, 1, 1,
-0.3578293, -0.01650439, -0.6299614, 1, 1, 1, 1, 1,
-0.3571152, 2.526826, 0.2276557, 1, 1, 1, 1, 1,
-0.3552294, -0.8379449, -0.4223135, 1, 1, 1, 1, 1,
-0.3532854, -0.9001485, -4.559224, 1, 1, 1, 1, 1,
-0.3514134, 0.8775889, -1.56582, 1, 1, 1, 1, 1,
-0.3455544, 1.876333, 0.3047246, 1, 1, 1, 1, 1,
-0.3404455, -1.553707, -3.140825, 1, 1, 1, 1, 1,
-0.3399638, 0.4657166, -3.264099, 1, 1, 1, 1, 1,
-0.3389067, -0.3080786, -2.11596, 1, 1, 1, 1, 1,
-0.3376192, -0.2380119, -0.91665, 1, 1, 1, 1, 1,
-0.3365846, 0.5214701, -2.367683, 0, 0, 1, 1, 1,
-0.3348813, -0.2590567, -4.008087, 1, 0, 0, 1, 1,
-0.3343622, 0.7671368, -0.3347394, 1, 0, 0, 1, 1,
-0.3341634, -0.5056545, -2.963419, 1, 0, 0, 1, 1,
-0.3325989, 0.4162704, -0.5298207, 1, 0, 0, 1, 1,
-0.3290819, -1.035671, -3.639924, 1, 0, 0, 1, 1,
-0.325354, -1.107087, -0.665113, 0, 0, 0, 1, 1,
-0.3249996, -0.4096314, -0.3021989, 0, 0, 0, 1, 1,
-0.3245522, 0.3063131, -1.269926, 0, 0, 0, 1, 1,
-0.321124, 0.5928703, 0.2506592, 0, 0, 0, 1, 1,
-0.3189677, -0.4828683, -2.423786, 0, 0, 0, 1, 1,
-0.3179436, 1.161099, 0.7308458, 0, 0, 0, 1, 1,
-0.3146701, -0.7503506, -3.317292, 0, 0, 0, 1, 1,
-0.3122428, 0.1446306, 0.6872598, 1, 1, 1, 1, 1,
-0.3097363, -0.4366394, -3.22771, 1, 1, 1, 1, 1,
-0.3053887, -0.5718239, -0.8329188, 1, 1, 1, 1, 1,
-0.3021964, -0.07576713, -0.7603252, 1, 1, 1, 1, 1,
-0.3007148, 1.712397, 1.82227, 1, 1, 1, 1, 1,
-0.2948308, 0.03693594, -1.642593, 1, 1, 1, 1, 1,
-0.2924645, 0.02498311, -2.657735, 1, 1, 1, 1, 1,
-0.286741, -0.5791807, -2.213853, 1, 1, 1, 1, 1,
-0.2821231, -0.05587195, -2.695869, 1, 1, 1, 1, 1,
-0.2775085, -0.7074302, -3.677879, 1, 1, 1, 1, 1,
-0.2653531, -0.7020398, -2.611841, 1, 1, 1, 1, 1,
-0.2620726, 0.1025103, -3.553554, 1, 1, 1, 1, 1,
-0.2610213, -1.788265, -4.697957, 1, 1, 1, 1, 1,
-0.2577814, -0.431148, -3.936241, 1, 1, 1, 1, 1,
-0.2575504, 0.1629373, -2.236844, 1, 1, 1, 1, 1,
-0.2558649, 1.682177, 1.264129, 0, 0, 1, 1, 1,
-0.2539834, 0.6113504, -0.4031489, 1, 0, 0, 1, 1,
-0.2529463, -0.04887367, -1.448349, 1, 0, 0, 1, 1,
-0.2529393, -0.8795422, -3.100992, 1, 0, 0, 1, 1,
-0.2520182, -0.2105685, -2.491842, 1, 0, 0, 1, 1,
-0.2519674, 0.9990708, -0.2375126, 1, 0, 0, 1, 1,
-0.2466372, 0.160096, -1.046454, 0, 0, 0, 1, 1,
-0.2447216, 0.9482095, 1.617695, 0, 0, 0, 1, 1,
-0.234404, 0.1236461, 0.3059053, 0, 0, 0, 1, 1,
-0.2292113, -1.875076, -3.298073, 0, 0, 0, 1, 1,
-0.2283103, 0.6027368, -1.52658, 0, 0, 0, 1, 1,
-0.2241373, 1.258987, 0.347854, 0, 0, 0, 1, 1,
-0.2239272, 1.866362, -0.4583262, 0, 0, 0, 1, 1,
-0.2187364, -0.7663805, -3.60692, 1, 1, 1, 1, 1,
-0.2182494, 0.2502299, -3.138242, 1, 1, 1, 1, 1,
-0.2176667, 0.3689278, -0.1376801, 1, 1, 1, 1, 1,
-0.215626, -0.05521354, -0.851065, 1, 1, 1, 1, 1,
-0.2143347, 1.346608, 1.257477, 1, 1, 1, 1, 1,
-0.2140934, -0.2526992, -3.003852, 1, 1, 1, 1, 1,
-0.2107632, 0.08076895, -1.499728, 1, 1, 1, 1, 1,
-0.2080615, 0.7544255, -0.6617113, 1, 1, 1, 1, 1,
-0.2014283, -2.304528, -3.676635, 1, 1, 1, 1, 1,
-0.2007536, -0.007543418, -1.553381, 1, 1, 1, 1, 1,
-0.2005931, 0.7380419, 0.115999, 1, 1, 1, 1, 1,
-0.1979831, 1.070763, -0.9107446, 1, 1, 1, 1, 1,
-0.1975093, 2.018174, -2.26264, 1, 1, 1, 1, 1,
-0.1878994, -0.1325948, -1.67218, 1, 1, 1, 1, 1,
-0.1821376, -0.6463757, -2.11078, 1, 1, 1, 1, 1,
-0.1804295, -0.1522021, -3.228453, 0, 0, 1, 1, 1,
-0.178019, 0.995565, -0.6323515, 1, 0, 0, 1, 1,
-0.1710641, -0.200211, -3.828407, 1, 0, 0, 1, 1,
-0.1692333, 1.13291, -0.9613584, 1, 0, 0, 1, 1,
-0.167, -0.6940494, -3.509635, 1, 0, 0, 1, 1,
-0.1648758, 0.6079824, 0.04394628, 1, 0, 0, 1, 1,
-0.1632063, 0.9625144, -1.802488, 0, 0, 0, 1, 1,
-0.1623127, -0.03141086, -0.8428264, 0, 0, 0, 1, 1,
-0.1618191, -1.911585, -4.002501, 0, 0, 0, 1, 1,
-0.1593551, -1.424698, -3.969112, 0, 0, 0, 1, 1,
-0.152178, 0.095834, -0.4552716, 0, 0, 0, 1, 1,
-0.1467049, 0.848652, -0.6574221, 0, 0, 0, 1, 1,
-0.1465244, 0.9206005, -0.6852787, 0, 0, 0, 1, 1,
-0.1457314, -0.814752, -2.884046, 1, 1, 1, 1, 1,
-0.1422, -0.6828996, -2.787166, 1, 1, 1, 1, 1,
-0.1381483, 0.8520965, -0.6222553, 1, 1, 1, 1, 1,
-0.1353944, -0.08643888, -1.241578, 1, 1, 1, 1, 1,
-0.134073, 0.4276609, 0.1726699, 1, 1, 1, 1, 1,
-0.1329454, 1.184903, 2.199265, 1, 1, 1, 1, 1,
-0.1308653, 0.8769464, -0.4000822, 1, 1, 1, 1, 1,
-0.1287031, 0.4447521, -0.0848968, 1, 1, 1, 1, 1,
-0.1262102, -0.7714052, -2.18589, 1, 1, 1, 1, 1,
-0.1238508, -2.169387, -3.303945, 1, 1, 1, 1, 1,
-0.1194572, -2.142325, -3.445, 1, 1, 1, 1, 1,
-0.1134329, 0.1880113, -0.150314, 1, 1, 1, 1, 1,
-0.1134282, 0.026348, -1.751813, 1, 1, 1, 1, 1,
-0.1106503, -0.349976, -3.881694, 1, 1, 1, 1, 1,
-0.1061089, -1.156081, -3.573705, 1, 1, 1, 1, 1,
-0.1033532, -1.008876, -3.662491, 0, 0, 1, 1, 1,
-0.1005907, -0.1014461, 0.2749018, 1, 0, 0, 1, 1,
-0.09878381, 0.4960029, 0.3087811, 1, 0, 0, 1, 1,
-0.09859608, -0.7479639, -2.684078, 1, 0, 0, 1, 1,
-0.09837212, 0.1626206, 0.1016955, 1, 0, 0, 1, 1,
-0.09551162, -0.7121108, -2.996016, 1, 0, 0, 1, 1,
-0.08916954, -1.48323, -3.535822, 0, 0, 0, 1, 1,
-0.085822, 0.4315543, 0.4703438, 0, 0, 0, 1, 1,
-0.08581774, 0.210961, -0.2696228, 0, 0, 0, 1, 1,
-0.08275796, 0.08289959, -0.3443481, 0, 0, 0, 1, 1,
-0.08054274, 0.5935619, -0.2950487, 0, 0, 0, 1, 1,
-0.07851956, -0.2950935, -1.498291, 0, 0, 0, 1, 1,
-0.07642491, -0.8545246, -2.881788, 0, 0, 0, 1, 1,
-0.06780437, 0.6129228, 0.3014934, 1, 1, 1, 1, 1,
-0.06128151, 0.1274411, 1.003073, 1, 1, 1, 1, 1,
-0.06071795, 0.4625096, 0.5402384, 1, 1, 1, 1, 1,
-0.05582419, -0.3043198, -2.379789, 1, 1, 1, 1, 1,
-0.05574796, -1.187894, -2.830879, 1, 1, 1, 1, 1,
-0.05558508, -0.2003601, -1.967463, 1, 1, 1, 1, 1,
-0.05495074, -0.2109848, -2.704316, 1, 1, 1, 1, 1,
-0.05073286, -0.08067969, -2.544084, 1, 1, 1, 1, 1,
-0.04855222, -0.3393371, -1.897062, 1, 1, 1, 1, 1,
-0.04834899, 1.433785, -0.7906969, 1, 1, 1, 1, 1,
-0.0461597, -1.361513, -1.077681, 1, 1, 1, 1, 1,
-0.04110545, 0.5457167, -0.2918489, 1, 1, 1, 1, 1,
-0.03994197, -0.3818499, -3.053817, 1, 1, 1, 1, 1,
-0.03940196, 1.140319, -0.2331688, 1, 1, 1, 1, 1,
-0.03938053, 0.09967102, 0.7564943, 1, 1, 1, 1, 1,
-0.03804761, 0.2367429, 0.3783619, 0, 0, 1, 1, 1,
-0.03373554, 0.7458628, -0.9663652, 1, 0, 0, 1, 1,
-0.03142814, 0.7407365, -0.3409884, 1, 0, 0, 1, 1,
-0.03136072, 2.384037, 0.3379821, 1, 0, 0, 1, 1,
-0.02993249, -0.1146079, -3.766195, 1, 0, 0, 1, 1,
-0.02681507, -0.8566843, -5.388021, 1, 0, 0, 1, 1,
-0.0264252, -1.173584, -1.643095, 0, 0, 0, 1, 1,
-0.02551031, 0.8746617, -0.6145171, 0, 0, 0, 1, 1,
-0.02310771, 0.368212, 0.8190911, 0, 0, 0, 1, 1,
-0.01531824, 0.3098359, -1.938499, 0, 0, 0, 1, 1,
-0.01233162, -1.188043, -3.273093, 0, 0, 0, 1, 1,
-0.009814986, -1.292003, -4.060605, 0, 0, 0, 1, 1,
-0.007386199, -0.4336874, -2.722684, 0, 0, 0, 1, 1,
0.001565409, 0.2442923, -0.6521923, 1, 1, 1, 1, 1,
0.002316, 0.1800929, -0.01925952, 1, 1, 1, 1, 1,
0.01414909, -0.2758485, 4.969635, 1, 1, 1, 1, 1,
0.01730668, 0.3304558, 0.5595337, 1, 1, 1, 1, 1,
0.01779237, 0.4557986, -0.1149737, 1, 1, 1, 1, 1,
0.02184334, 0.5700011, 0.4463, 1, 1, 1, 1, 1,
0.02187789, 0.5565262, -1.341712, 1, 1, 1, 1, 1,
0.02222382, -1.036569, 3.750334, 1, 1, 1, 1, 1,
0.0223989, 0.45904, -1.297075, 1, 1, 1, 1, 1,
0.02738213, -1.162556, 4.71091, 1, 1, 1, 1, 1,
0.03070707, -1.456318, 3.521013, 1, 1, 1, 1, 1,
0.03524143, 0.590322, 1.96141, 1, 1, 1, 1, 1,
0.03588534, 0.1158972, 0.7093326, 1, 1, 1, 1, 1,
0.03852773, 0.04482909, 0.7458204, 1, 1, 1, 1, 1,
0.04088352, 0.04293405, 2.050366, 1, 1, 1, 1, 1,
0.04438617, -1.461125, 3.247747, 0, 0, 1, 1, 1,
0.0457304, 1.236657, 0.7009265, 1, 0, 0, 1, 1,
0.04596816, 0.7105977, -2.541965, 1, 0, 0, 1, 1,
0.04693666, 0.7665104, 0.3497635, 1, 0, 0, 1, 1,
0.04799971, -1.337327, 2.038703, 1, 0, 0, 1, 1,
0.05143794, -0.4683921, 4.742146, 1, 0, 0, 1, 1,
0.05329608, 0.03197973, 1.396553, 0, 0, 0, 1, 1,
0.05489385, -0.9081305, 2.05163, 0, 0, 0, 1, 1,
0.06172619, -0.1469008, 1.415969, 0, 0, 0, 1, 1,
0.06766073, 0.6154281, 0.1451715, 0, 0, 0, 1, 1,
0.0693873, 2.599821, 0.3304869, 0, 0, 0, 1, 1,
0.07123619, 0.2448698, 1.136824, 0, 0, 0, 1, 1,
0.07379361, 0.6445251, -0.4384238, 0, 0, 0, 1, 1,
0.07779083, 0.5921199, -0.4217228, 1, 1, 1, 1, 1,
0.08099518, 2.027142, -0.5081774, 1, 1, 1, 1, 1,
0.08127514, 0.895721, 0.6073227, 1, 1, 1, 1, 1,
0.08248154, 0.8345579, 0.3549507, 1, 1, 1, 1, 1,
0.0866212, 0.08601471, 0.7282955, 1, 1, 1, 1, 1,
0.08760419, -1.727932, 4.248551, 1, 1, 1, 1, 1,
0.08855888, -0.6980296, 3.238416, 1, 1, 1, 1, 1,
0.08931554, 0.050388, 2.060399, 1, 1, 1, 1, 1,
0.09115218, 0.2621061, 1.433904, 1, 1, 1, 1, 1,
0.09197614, -1.064466, 3.134161, 1, 1, 1, 1, 1,
0.09400666, 1.970251, -0.1029739, 1, 1, 1, 1, 1,
0.09516282, 0.2823525, -0.4481472, 1, 1, 1, 1, 1,
0.09823197, -1.273648, 2.164515, 1, 1, 1, 1, 1,
0.09996756, -1.383335, 2.455032, 1, 1, 1, 1, 1,
0.1002764, -0.4816754, 2.875365, 1, 1, 1, 1, 1,
0.103234, -0.4683755, 2.788471, 0, 0, 1, 1, 1,
0.105187, -0.4923889, 1.475949, 1, 0, 0, 1, 1,
0.1059085, -0.7684462, 3.762002, 1, 0, 0, 1, 1,
0.1075117, -0.3301141, 3.146638, 1, 0, 0, 1, 1,
0.1105339, -0.9411299, 2.473699, 1, 0, 0, 1, 1,
0.1141464, 0.4739833, 1.658782, 1, 0, 0, 1, 1,
0.1153483, 0.1630687, -0.9044814, 0, 0, 0, 1, 1,
0.1194895, 0.3469582, 0.68094, 0, 0, 0, 1, 1,
0.1201442, 0.08651992, -1.075727, 0, 0, 0, 1, 1,
0.1212742, -0.2258852, 2.843115, 0, 0, 0, 1, 1,
0.1248634, -0.484811, 3.248985, 0, 0, 0, 1, 1,
0.1254756, 0.2299005, 1.014719, 0, 0, 0, 1, 1,
0.1262103, -0.7823248, 5.064794, 0, 0, 0, 1, 1,
0.1300157, -0.01569877, 2.229587, 1, 1, 1, 1, 1,
0.1300856, 0.4022876, -0.01072663, 1, 1, 1, 1, 1,
0.1310531, 0.8057168, -0.4192979, 1, 1, 1, 1, 1,
0.1346226, 0.2095594, -1.444035, 1, 1, 1, 1, 1,
0.1383589, 0.4799909, 0.1199857, 1, 1, 1, 1, 1,
0.1391243, -0.9682891, 2.249265, 1, 1, 1, 1, 1,
0.1455811, -0.8027034, 4.35954, 1, 1, 1, 1, 1,
0.1473166, 0.2508049, 0.7151589, 1, 1, 1, 1, 1,
0.1495391, -0.54407, 2.843844, 1, 1, 1, 1, 1,
0.1510694, -0.961296, 3.995426, 1, 1, 1, 1, 1,
0.1566987, -0.1724641, 2.290984, 1, 1, 1, 1, 1,
0.1575082, -1.477158, 2.323894, 1, 1, 1, 1, 1,
0.1586585, 0.8752937, 0.7794262, 1, 1, 1, 1, 1,
0.1676198, 1.518538, -0.1361519, 1, 1, 1, 1, 1,
0.1739032, -1.104955, 3.700406, 1, 1, 1, 1, 1,
0.175031, 1.291479, -0.09500297, 0, 0, 1, 1, 1,
0.1752232, 1.983158, 1.025001, 1, 0, 0, 1, 1,
0.1768498, -0.7376626, -0.6296564, 1, 0, 0, 1, 1,
0.1799889, -0.9160506, 2.734341, 1, 0, 0, 1, 1,
0.1898406, 1.514507, -0.9433554, 1, 0, 0, 1, 1,
0.1909844, -0.01765291, 0.7935663, 1, 0, 0, 1, 1,
0.1943327, -0.4643805, 2.741016, 0, 0, 0, 1, 1,
0.1943888, 0.3481368, 2.293204, 0, 0, 0, 1, 1,
0.1966434, 1.238083, -1.865143, 0, 0, 0, 1, 1,
0.2068417, -0.8859174, 3.781933, 0, 0, 0, 1, 1,
0.2148262, -0.674878, 1.689434, 0, 0, 0, 1, 1,
0.215061, 1.745933, -0.0628823, 0, 0, 0, 1, 1,
0.217123, -0.8170699, 1.688136, 0, 0, 0, 1, 1,
0.2218958, 0.12103, 1.238233, 1, 1, 1, 1, 1,
0.2316468, -0.5124727, 1.390786, 1, 1, 1, 1, 1,
0.2327705, 0.02327163, 1.810504, 1, 1, 1, 1, 1,
0.2342913, 1.884042, 0.07342347, 1, 1, 1, 1, 1,
0.2353592, -0.3364881, 1.741415, 1, 1, 1, 1, 1,
0.2362755, -0.9396924, 2.848599, 1, 1, 1, 1, 1,
0.2391736, 0.7708127, -0.04728478, 1, 1, 1, 1, 1,
0.2409593, 0.4271079, 0.1834315, 1, 1, 1, 1, 1,
0.2431131, -1.172131, 4.099172, 1, 1, 1, 1, 1,
0.2441403, -0.06085845, 1.085002, 1, 1, 1, 1, 1,
0.2448425, 1.269206, -0.6126295, 1, 1, 1, 1, 1,
0.2484035, 1.406344, -0.5826498, 1, 1, 1, 1, 1,
0.2496593, 0.255999, -0.7754012, 1, 1, 1, 1, 1,
0.252241, -0.5079656, 2.28506, 1, 1, 1, 1, 1,
0.2522742, -0.03544237, 1.189843, 1, 1, 1, 1, 1,
0.2526751, -0.1275347, 4.045569, 0, 0, 1, 1, 1,
0.2528214, -0.8207784, 2.785696, 1, 0, 0, 1, 1,
0.2585229, -0.1383433, 2.489994, 1, 0, 0, 1, 1,
0.2592603, -2.93148, 3.569538, 1, 0, 0, 1, 1,
0.2600205, -1.282327, 2.608677, 1, 0, 0, 1, 1,
0.2615654, 2.309079, 1.13223, 1, 0, 0, 1, 1,
0.2642263, 1.795166, 0.890517, 0, 0, 0, 1, 1,
0.2654255, 0.1820101, 1.388349, 0, 0, 0, 1, 1,
0.2686343, -0.753878, 3.443428, 0, 0, 0, 1, 1,
0.2690293, 0.09683127, 0.05699207, 0, 0, 0, 1, 1,
0.2753329, -0.5546033, 2.350176, 0, 0, 0, 1, 1,
0.2774352, 0.1140727, -0.4126594, 0, 0, 0, 1, 1,
0.2796629, 1.070555, -0.7422253, 0, 0, 0, 1, 1,
0.2874285, 1.184691, 0.577105, 1, 1, 1, 1, 1,
0.2914469, 1.070431, 0.3732929, 1, 1, 1, 1, 1,
0.2937115, 0.08164511, 0.6803851, 1, 1, 1, 1, 1,
0.2977854, -0.6381403, 3.020542, 1, 1, 1, 1, 1,
0.2999189, 0.1944669, -0.6709252, 1, 1, 1, 1, 1,
0.3003444, -1.392248, 2.771405, 1, 1, 1, 1, 1,
0.3018679, -0.8823792, 3.152436, 1, 1, 1, 1, 1,
0.3038249, -1.753531, 3.602497, 1, 1, 1, 1, 1,
0.3049859, -0.6608933, 2.863215, 1, 1, 1, 1, 1,
0.3100149, 0.215293, 2.073244, 1, 1, 1, 1, 1,
0.3121715, 1.19286, -1.624353, 1, 1, 1, 1, 1,
0.3154945, 0.3155777, 0.4397431, 1, 1, 1, 1, 1,
0.3162288, -1.822791, 4.061803, 1, 1, 1, 1, 1,
0.318041, 1.806726, 1.222395, 1, 1, 1, 1, 1,
0.3220262, -1.098567, 1.476436, 1, 1, 1, 1, 1,
0.3231332, -1.18902, 3.194884, 0, 0, 1, 1, 1,
0.3261388, 0.3240259, 1.788357, 1, 0, 0, 1, 1,
0.3274852, 0.02296287, 2.266391, 1, 0, 0, 1, 1,
0.3288203, -1.127931, 3.002784, 1, 0, 0, 1, 1,
0.3329614, -0.5878401, 3.301173, 1, 0, 0, 1, 1,
0.3489709, 0.107711, 0.9655862, 1, 0, 0, 1, 1,
0.3492631, 0.2127243, 0.3702663, 0, 0, 0, 1, 1,
0.3500392, 0.3497047, -0.6081432, 0, 0, 0, 1, 1,
0.350713, -0.2524889, 1.515744, 0, 0, 0, 1, 1,
0.3518278, 0.3151885, 0.5229865, 0, 0, 0, 1, 1,
0.3539407, -0.3326652, 0.8477021, 0, 0, 0, 1, 1,
0.3556535, 1.010348, -0.06421261, 0, 0, 0, 1, 1,
0.3568798, 0.07551838, 0.9218978, 0, 0, 0, 1, 1,
0.356917, 1.992348, -0.1823024, 1, 1, 1, 1, 1,
0.356941, -0.6235752, 3.487128, 1, 1, 1, 1, 1,
0.359188, -1.634941, 3.292323, 1, 1, 1, 1, 1,
0.3600086, -0.9649363, 4.592479, 1, 1, 1, 1, 1,
0.3629922, 0.5497262, -0.6700904, 1, 1, 1, 1, 1,
0.3653021, -0.01823403, 3.047186, 1, 1, 1, 1, 1,
0.3657011, 1.328552, 0.5453001, 1, 1, 1, 1, 1,
0.3658756, -0.1633372, 1.310369, 1, 1, 1, 1, 1,
0.3712645, -0.5019621, 3.093001, 1, 1, 1, 1, 1,
0.371289, 0.3344188, 2.067265, 1, 1, 1, 1, 1,
0.3729239, 0.7856899, 1.082582, 1, 1, 1, 1, 1,
0.3732414, -0.003655587, 0.007071339, 1, 1, 1, 1, 1,
0.3762903, -0.2253883, 0.5141813, 1, 1, 1, 1, 1,
0.377627, 0.4388714, 0.0931097, 1, 1, 1, 1, 1,
0.3795187, -0.2928865, 4.171138, 1, 1, 1, 1, 1,
0.3805076, 1.227778, 0.5050797, 0, 0, 1, 1, 1,
0.3811223, 0.4235975, 0.429534, 1, 0, 0, 1, 1,
0.3866507, -0.9657612, 3.491226, 1, 0, 0, 1, 1,
0.3867578, -0.001383221, 0.3709906, 1, 0, 0, 1, 1,
0.3888637, 1.040519, 0.4082043, 1, 0, 0, 1, 1,
0.3925493, -0.6221867, 2.539377, 1, 0, 0, 1, 1,
0.3931054, 1.18718, 0.1193551, 0, 0, 0, 1, 1,
0.4007722, 1.992337, 0.3158616, 0, 0, 0, 1, 1,
0.4025249, -0.4824301, 2.946454, 0, 0, 0, 1, 1,
0.4131771, -0.364894, 1.640425, 0, 0, 0, 1, 1,
0.4138645, 1.303537, 1.011834, 0, 0, 0, 1, 1,
0.4146187, 0.3444225, 1.344019, 0, 0, 0, 1, 1,
0.4175237, 0.5660115, -0.2993719, 0, 0, 0, 1, 1,
0.4175675, 1.013722, -0.6032251, 1, 1, 1, 1, 1,
0.4180543, 0.9872174, 0.038209, 1, 1, 1, 1, 1,
0.4211446, 1.391621, -0.12142, 1, 1, 1, 1, 1,
0.4211479, 0.8771583, 0.1463475, 1, 1, 1, 1, 1,
0.4247227, -1.664254, 2.111938, 1, 1, 1, 1, 1,
0.4289603, -0.244532, 2.318649, 1, 1, 1, 1, 1,
0.4308329, 0.1698875, 1.388563, 1, 1, 1, 1, 1,
0.4308402, -0.7566612, 2.568081, 1, 1, 1, 1, 1,
0.4367807, 1.335701, -1.430533, 1, 1, 1, 1, 1,
0.4382417, 0.7929639, 0.8016829, 1, 1, 1, 1, 1,
0.4385155, 0.2354134, 1.496889, 1, 1, 1, 1, 1,
0.440963, -2.163512, 2.727675, 1, 1, 1, 1, 1,
0.4421549, -1.942494, 3.446557, 1, 1, 1, 1, 1,
0.4460482, -0.6671444, 3.415344, 1, 1, 1, 1, 1,
0.4476184, -0.9669755, 1.460127, 1, 1, 1, 1, 1,
0.4497225, -3.387891, 2.961448, 0, 0, 1, 1, 1,
0.4558409, -1.431303, 4.41481, 1, 0, 0, 1, 1,
0.4565201, 1.038078, -0.33895, 1, 0, 0, 1, 1,
0.4629906, -1.280053, 1.685408, 1, 0, 0, 1, 1,
0.4643261, -0.4137576, 1.716828, 1, 0, 0, 1, 1,
0.4699127, 0.533142, 0.06966727, 1, 0, 0, 1, 1,
0.4709838, 0.6963236, 0.7829624, 0, 0, 0, 1, 1,
0.4717776, -0.08261524, 0.3444645, 0, 0, 0, 1, 1,
0.4730359, 0.4726943, 1.462781, 0, 0, 0, 1, 1,
0.479999, -0.5041914, 2.161596, 0, 0, 0, 1, 1,
0.4818707, 0.3395664, 2.352163, 0, 0, 0, 1, 1,
0.4829754, -0.3092483, 1.192393, 0, 0, 0, 1, 1,
0.4863335, -0.408791, 0.7027297, 0, 0, 0, 1, 1,
0.4864534, 0.4656173, 2.864884, 1, 1, 1, 1, 1,
0.4903292, 0.4444884, -0.721807, 1, 1, 1, 1, 1,
0.4937666, 0.8685086, 1.973947, 1, 1, 1, 1, 1,
0.5025576, 0.9238371, -1.912068, 1, 1, 1, 1, 1,
0.5042319, 0.170407, 1.565297, 1, 1, 1, 1, 1,
0.506973, -0.9227834, 4.262656, 1, 1, 1, 1, 1,
0.5145436, -0.1358172, 1.010695, 1, 1, 1, 1, 1,
0.5176497, -1.172152, 2.205545, 1, 1, 1, 1, 1,
0.5195919, 0.4088344, 2.754674, 1, 1, 1, 1, 1,
0.5207902, 2.173574, -0.05062978, 1, 1, 1, 1, 1,
0.5210775, -1.557555, 2.923147, 1, 1, 1, 1, 1,
0.5238869, -0.372685, 1.010197, 1, 1, 1, 1, 1,
0.5258751, 0.1954611, -0.7666677, 1, 1, 1, 1, 1,
0.5283807, -0.5782506, 2.629095, 1, 1, 1, 1, 1,
0.5284285, -0.8620188, 2.335199, 1, 1, 1, 1, 1,
0.5313419, 1.014149, -0.4468691, 0, 0, 1, 1, 1,
0.5329821, -0.6469427, 0.8864944, 1, 0, 0, 1, 1,
0.5350929, -1.528547, 3.058249, 1, 0, 0, 1, 1,
0.5365234, 0.6011127, 1.887547, 1, 0, 0, 1, 1,
0.5412532, -0.6171822, 4.116513, 1, 0, 0, 1, 1,
0.541272, -1.03035, 2.45807, 1, 0, 0, 1, 1,
0.5425147, 1.163572, 1.395646, 0, 0, 0, 1, 1,
0.5437582, -2.311676, 0.8438971, 0, 0, 0, 1, 1,
0.5572592, 0.2759165, -0.1018478, 0, 0, 0, 1, 1,
0.5606053, -0.4446272, 2.545122, 0, 0, 0, 1, 1,
0.5620041, -0.2296334, 0.4827728, 0, 0, 0, 1, 1,
0.5637959, 0.6929333, -0.213902, 0, 0, 0, 1, 1,
0.5642247, -0.9056782, 2.146291, 0, 0, 0, 1, 1,
0.5688864, -0.47898, 3.903234, 1, 1, 1, 1, 1,
0.5726631, -0.6997486, 3.657395, 1, 1, 1, 1, 1,
0.5754417, 0.4320794, 0.93262, 1, 1, 1, 1, 1,
0.575782, -0.1727265, 0.4084322, 1, 1, 1, 1, 1,
0.5771672, -0.8268456, 2.003337, 1, 1, 1, 1, 1,
0.5854767, -0.6226818, 2.50501, 1, 1, 1, 1, 1,
0.5950769, -0.7356706, 2.830269, 1, 1, 1, 1, 1,
0.5957762, 0.7315404, -0.5666695, 1, 1, 1, 1, 1,
0.6011985, 1.582905, 0.5671827, 1, 1, 1, 1, 1,
0.60285, -0.3453133, 2.02887, 1, 1, 1, 1, 1,
0.6099138, 0.6025126, -1.166178, 1, 1, 1, 1, 1,
0.6114079, -0.1742937, 2.250155, 1, 1, 1, 1, 1,
0.6128827, 1.075469, -0.5920392, 1, 1, 1, 1, 1,
0.6192456, -1.193885, 1.643578, 1, 1, 1, 1, 1,
0.6212567, 1.409526, 0.7041783, 1, 1, 1, 1, 1,
0.6224188, -0.7192525, 1.156708, 0, 0, 1, 1, 1,
0.6243805, -0.8102643, 2.278085, 1, 0, 0, 1, 1,
0.6264275, -0.543934, 3.119787, 1, 0, 0, 1, 1,
0.6356022, -1.725448, 3.785756, 1, 0, 0, 1, 1,
0.6364003, 0.5888469, 1.394784, 1, 0, 0, 1, 1,
0.6426416, -1.393064, 3.291334, 1, 0, 0, 1, 1,
0.6435002, 0.08202313, 2.270979, 0, 0, 0, 1, 1,
0.6498589, 1.337852, 0.3863967, 0, 0, 0, 1, 1,
0.6525217, -1.078249, 4.726176, 0, 0, 0, 1, 1,
0.6538621, -1.57406, 3.742367, 0, 0, 0, 1, 1,
0.6580508, -1.338659, 3.594855, 0, 0, 0, 1, 1,
0.6632196, 0.1886509, 2.980851, 0, 0, 0, 1, 1,
0.6685863, 0.3103421, 2.30884, 0, 0, 0, 1, 1,
0.671284, 1.116492, 0.6137927, 1, 1, 1, 1, 1,
0.6721697, 0.2585586, 0.5181226, 1, 1, 1, 1, 1,
0.6762999, -0.4235368, -0.2090101, 1, 1, 1, 1, 1,
0.6797247, -0.6360151, 2.24287, 1, 1, 1, 1, 1,
0.6816705, 2.136797, 0.3246135, 1, 1, 1, 1, 1,
0.682818, 0.1561263, 2.135402, 1, 1, 1, 1, 1,
0.6830741, 0.005734472, 0.1517364, 1, 1, 1, 1, 1,
0.6876223, -1.556562, 3.606294, 1, 1, 1, 1, 1,
0.6877291, 0.5268021, 1.098875, 1, 1, 1, 1, 1,
0.6915601, 0.3542368, 2.165236, 1, 1, 1, 1, 1,
0.6937777, -0.5417717, 3.254672, 1, 1, 1, 1, 1,
0.6941351, -0.5729594, -0.4281322, 1, 1, 1, 1, 1,
0.6943449, -0.1580628, 1.012624, 1, 1, 1, 1, 1,
0.7136582, -1.414722, 2.447438, 1, 1, 1, 1, 1,
0.7195215, -1.727416, 4.786356, 1, 1, 1, 1, 1,
0.7198802, 0.8085043, -0.03429708, 0, 0, 1, 1, 1,
0.7220482, -0.1478057, 0.4011347, 1, 0, 0, 1, 1,
0.7220666, -2.327266, 2.750827, 1, 0, 0, 1, 1,
0.7228435, 0.9144996, 0.3463083, 1, 0, 0, 1, 1,
0.7266927, 1.951273, 0.8668007, 1, 0, 0, 1, 1,
0.7370895, 0.3735581, -0.01459135, 1, 0, 0, 1, 1,
0.7375476, -0.9575997, 1.82849, 0, 0, 0, 1, 1,
0.7429665, 0.1541206, 0.6585971, 0, 0, 0, 1, 1,
0.7431877, 0.08519638, 1.398324, 0, 0, 0, 1, 1,
0.7443272, 0.8283111, -0.2436941, 0, 0, 0, 1, 1,
0.7478886, 1.279129, 2.105785, 0, 0, 0, 1, 1,
0.749182, -1.137512, 1.718305, 0, 0, 0, 1, 1,
0.7512045, -1.58887, 4.872448, 0, 0, 0, 1, 1,
0.7543574, 0.1932838, 0.7181643, 1, 1, 1, 1, 1,
0.7557181, 1.092596, 0.2072127, 1, 1, 1, 1, 1,
0.7557447, -0.6689095, 2.434754, 1, 1, 1, 1, 1,
0.7593901, 0.4651221, -0.7566062, 1, 1, 1, 1, 1,
0.7596247, 0.8225809, 0.9131591, 1, 1, 1, 1, 1,
0.7611472, 0.6173989, -1.107375, 1, 1, 1, 1, 1,
0.769775, -0.1762643, 2.30761, 1, 1, 1, 1, 1,
0.7708343, 1.122386, -1.490552, 1, 1, 1, 1, 1,
0.7722698, 0.1108651, 2.463943, 1, 1, 1, 1, 1,
0.773851, -1.515455, 2.561073, 1, 1, 1, 1, 1,
0.7958019, 1.277908, -0.09919249, 1, 1, 1, 1, 1,
0.7969639, 0.03190362, 1.410613, 1, 1, 1, 1, 1,
0.8017769, 0.4959427, 0.5738592, 1, 1, 1, 1, 1,
0.8031942, 0.01985467, -0.1801636, 1, 1, 1, 1, 1,
0.8091552, 0.261119, 1.568881, 1, 1, 1, 1, 1,
0.8109826, -0.4167364, 1.087929, 0, 0, 1, 1, 1,
0.8123756, 1.213473, 0.4647536, 1, 0, 0, 1, 1,
0.8129742, 2.055947, -0.6140087, 1, 0, 0, 1, 1,
0.8158314, -0.2147166, 3.180764, 1, 0, 0, 1, 1,
0.8176555, -0.3112077, 3.565, 1, 0, 0, 1, 1,
0.8243735, 0.6640657, 0.1422587, 1, 0, 0, 1, 1,
0.8278525, -0.1777684, 0.6347464, 0, 0, 0, 1, 1,
0.8299952, 0.3087479, 1.23752, 0, 0, 0, 1, 1,
0.8321381, -0.9260253, 2.234883, 0, 0, 0, 1, 1,
0.8345163, -0.4272959, 2.138515, 0, 0, 0, 1, 1,
0.8386174, 0.005178965, 1.627923, 0, 0, 0, 1, 1,
0.8400159, 1.555427, 1.472435, 0, 0, 0, 1, 1,
0.8438318, -1.454862, 1.458626, 0, 0, 0, 1, 1,
0.8466157, -0.3939877, 2.127696, 1, 1, 1, 1, 1,
0.8466772, 1.437142, -0.06100242, 1, 1, 1, 1, 1,
0.8488017, -0.7022281, 4.134564, 1, 1, 1, 1, 1,
0.8508731, 0.1396868, 2.81576, 1, 1, 1, 1, 1,
0.8620488, 1.153208, 0.7284953, 1, 1, 1, 1, 1,
0.8639717, 0.1342653, 1.847822, 1, 1, 1, 1, 1,
0.8732668, 0.1720361, -0.08308615, 1, 1, 1, 1, 1,
0.8737102, 0.4184318, 1.042593, 1, 1, 1, 1, 1,
0.8742535, 0.7851874, 0.04617365, 1, 1, 1, 1, 1,
0.8775116, -0.7891181, 1.886962, 1, 1, 1, 1, 1,
0.8780315, -2.839899, 3.423749, 1, 1, 1, 1, 1,
0.8795959, 1.035836, 1.346432, 1, 1, 1, 1, 1,
0.8853624, -1.889069, 3.440464, 1, 1, 1, 1, 1,
0.8926391, 0.5434448, 0.8055277, 1, 1, 1, 1, 1,
0.8955084, 0.1195223, 1.516159, 1, 1, 1, 1, 1,
0.9118422, 1.098283, 0.1905109, 0, 0, 1, 1, 1,
0.9318776, -0.902657, 1.513866, 1, 0, 0, 1, 1,
0.9320661, -0.07961488, 0.9619901, 1, 0, 0, 1, 1,
0.9362587, 0.5857901, 2.020264, 1, 0, 0, 1, 1,
0.9454756, -1.212506, 4.355488, 1, 0, 0, 1, 1,
0.9463768, 0.7904189, 1.833994, 1, 0, 0, 1, 1,
0.951648, 0.006322159, 2.625679, 0, 0, 0, 1, 1,
0.9537517, -0.4352953, 0.5875358, 0, 0, 0, 1, 1,
0.9601074, -0.6456903, 4.031377, 0, 0, 0, 1, 1,
0.9607866, 1.250645, 0.2045252, 0, 0, 0, 1, 1,
0.9638624, -2.663808, 3.176664, 0, 0, 0, 1, 1,
0.9657323, -1.092051, 2.391181, 0, 0, 0, 1, 1,
0.9695093, -0.6859133, 1.344964, 0, 0, 0, 1, 1,
0.9699261, 0.8702284, 2.526179, 1, 1, 1, 1, 1,
0.9762496, 0.3362263, 1.95543, 1, 1, 1, 1, 1,
0.9861037, 1.217661, 1.192561, 1, 1, 1, 1, 1,
0.995487, 1.350339, 1.028459, 1, 1, 1, 1, 1,
1.01281, 1.164354, -1.455129, 1, 1, 1, 1, 1,
1.013427, 1.529636, 0.3009678, 1, 1, 1, 1, 1,
1.016383, 0.5451069, 1.273559, 1, 1, 1, 1, 1,
1.020496, 0.610446, 0.7357312, 1, 1, 1, 1, 1,
1.021329, -1.021125, 2.705506, 1, 1, 1, 1, 1,
1.024106, 0.6976795, 1.228259, 1, 1, 1, 1, 1,
1.028658, 0.8238986, -0.2267923, 1, 1, 1, 1, 1,
1.030534, -2.141868, 5.439382, 1, 1, 1, 1, 1,
1.031606, 0.8049126, 1.200882, 1, 1, 1, 1, 1,
1.041416, -1.408347, 2.972601, 1, 1, 1, 1, 1,
1.050014, -0.7638051, 1.836332, 1, 1, 1, 1, 1,
1.053165, -0.9366286, 3.347653, 0, 0, 1, 1, 1,
1.063195, -0.5604368, 1.327674, 1, 0, 0, 1, 1,
1.065996, -0.4677553, 1.934593, 1, 0, 0, 1, 1,
1.067265, 1.082299, 2.547398, 1, 0, 0, 1, 1,
1.07057, -0.6524958, 3.39278, 1, 0, 0, 1, 1,
1.081883, -0.2820909, -0.1136526, 1, 0, 0, 1, 1,
1.082229, -1.51721, 1.181486, 0, 0, 0, 1, 1,
1.08624, -1.267666, 3.668565, 0, 0, 0, 1, 1,
1.086784, 2.008019, -0.1390543, 0, 0, 0, 1, 1,
1.093886, -0.0807206, 1.700023, 0, 0, 0, 1, 1,
1.105551, 0.7052669, 0.6188274, 0, 0, 0, 1, 1,
1.107569, -0.709865, 1.915617, 0, 0, 0, 1, 1,
1.112896, 0.2401531, 1.579044, 0, 0, 0, 1, 1,
1.114933, -0.430629, 1.117782, 1, 1, 1, 1, 1,
1.11656, -0.3304123, 4.493966, 1, 1, 1, 1, 1,
1.11932, -0.3327696, 4.604049, 1, 1, 1, 1, 1,
1.121017, -2.284266, 1.898305, 1, 1, 1, 1, 1,
1.121459, 1.632762, 1.529629, 1, 1, 1, 1, 1,
1.131633, 0.3653754, 3.180105, 1, 1, 1, 1, 1,
1.132147, -1.73246, 2.934636, 1, 1, 1, 1, 1,
1.13393, -0.1947578, 2.883439, 1, 1, 1, 1, 1,
1.135264, -0.5710068, 3.627699, 1, 1, 1, 1, 1,
1.135373, 0.4791779, 2.594612, 1, 1, 1, 1, 1,
1.142503, -0.02597082, 0.5296625, 1, 1, 1, 1, 1,
1.145402, -0.7711431, 3.211519, 1, 1, 1, 1, 1,
1.16306, 1.787078, 0.4344398, 1, 1, 1, 1, 1,
1.170227, -0.458919, 3.289786, 1, 1, 1, 1, 1,
1.171572, -0.9484382, 1.96889, 1, 1, 1, 1, 1,
1.179555, 0.6216599, 1.644737, 0, 0, 1, 1, 1,
1.190813, -1.264586, 2.294567, 1, 0, 0, 1, 1,
1.203422, -0.9429327, 1.999506, 1, 0, 0, 1, 1,
1.210103, -0.7355954, 3.897863, 1, 0, 0, 1, 1,
1.217788, 0.8079572, 1.440627, 1, 0, 0, 1, 1,
1.222379, -0.7597638, 2.761893, 1, 0, 0, 1, 1,
1.226248, -0.7598655, 3.295879, 0, 0, 0, 1, 1,
1.246679, -0.7728683, 0.3893386, 0, 0, 0, 1, 1,
1.248295, -0.5500978, 1.781895, 0, 0, 0, 1, 1,
1.252341, -0.6174975, 0.3615503, 0, 0, 0, 1, 1,
1.261998, 0.7603111, 0.9404103, 0, 0, 0, 1, 1,
1.266915, -0.625187, 2.445062, 0, 0, 0, 1, 1,
1.268394, -0.85943, 1.987754, 0, 0, 0, 1, 1,
1.270727, -1.020662, 3.138195, 1, 1, 1, 1, 1,
1.281256, 0.8597619, 2.446553, 1, 1, 1, 1, 1,
1.287266, 0.5625166, 0.3708058, 1, 1, 1, 1, 1,
1.292255, 1.36194, 0.5300048, 1, 1, 1, 1, 1,
1.316422, 1.20525, 1.615527, 1, 1, 1, 1, 1,
1.324111, 0.2672378, -0.8739009, 1, 1, 1, 1, 1,
1.32764, -0.02166344, 2.656188, 1, 1, 1, 1, 1,
1.332338, -0.06545476, 0.02568948, 1, 1, 1, 1, 1,
1.334048, -1.255256, 0.4404787, 1, 1, 1, 1, 1,
1.344061, 0.04368335, 1.981788, 1, 1, 1, 1, 1,
1.345056, 0.8418068, 1.751143, 1, 1, 1, 1, 1,
1.348659, -1.26099, 2.269971, 1, 1, 1, 1, 1,
1.355088, 1.350956, -1.791384, 1, 1, 1, 1, 1,
1.386372, 1.003413, -0.3066741, 1, 1, 1, 1, 1,
1.390627, -2.014977, 3.218355, 1, 1, 1, 1, 1,
1.392655, 0.5596017, -0.4737245, 0, 0, 1, 1, 1,
1.402408, -0.1237772, 1.916484, 1, 0, 0, 1, 1,
1.409982, -0.4592012, 1.916337, 1, 0, 0, 1, 1,
1.414175, 1.052299, -1.726013, 1, 0, 0, 1, 1,
1.434703, 0.3288112, 0.9923878, 1, 0, 0, 1, 1,
1.456057, -0.5963447, 2.315612, 1, 0, 0, 1, 1,
1.476171, 0.4642645, 1.674775, 0, 0, 0, 1, 1,
1.479952, -0.1125363, 1.548977, 0, 0, 0, 1, 1,
1.481662, -1.864067, 1.409219, 0, 0, 0, 1, 1,
1.482009, 0.5219951, 1.512435, 0, 0, 0, 1, 1,
1.50222, -0.575472, 1.370519, 0, 0, 0, 1, 1,
1.503701, 0.488783, 2.046872, 0, 0, 0, 1, 1,
1.507187, -0.5996517, 1.042446, 0, 0, 0, 1, 1,
1.509074, 1.308374, -0.6052561, 1, 1, 1, 1, 1,
1.512401, 0.1913281, 1.743263, 1, 1, 1, 1, 1,
1.532002, 0.4040231, -2.234369, 1, 1, 1, 1, 1,
1.532581, -0.02445034, 2.108402, 1, 1, 1, 1, 1,
1.537632, 0.6088611, -0.07803956, 1, 1, 1, 1, 1,
1.54764, 1.684937, 1.938887, 1, 1, 1, 1, 1,
1.547929, 0.1569612, -0.347925, 1, 1, 1, 1, 1,
1.558657, 1.422866, -1.296546, 1, 1, 1, 1, 1,
1.595195, -0.8819383, 2.698261, 1, 1, 1, 1, 1,
1.595625, -0.995612, 1.99046, 1, 1, 1, 1, 1,
1.604681, 0.9454395, 2.264266, 1, 1, 1, 1, 1,
1.6209, 0.01675996, -0.303348, 1, 1, 1, 1, 1,
1.625459, -0.5354346, 0.9512828, 1, 1, 1, 1, 1,
1.633702, -0.7917668, 1.510162, 1, 1, 1, 1, 1,
1.649237, -0.08212961, 2.165968, 1, 1, 1, 1, 1,
1.652295, -1.687128, 4.157457, 0, 0, 1, 1, 1,
1.653474, 0.7639156, 1.791834, 1, 0, 0, 1, 1,
1.655289, 1.055458, 1.840242, 1, 0, 0, 1, 1,
1.662699, 0.4557787, 1.781868, 1, 0, 0, 1, 1,
1.675316, -0.2364522, 0.9996523, 1, 0, 0, 1, 1,
1.689428, 0.1740678, 0.5402156, 1, 0, 0, 1, 1,
1.690187, -0.9530539, 3.174035, 0, 0, 0, 1, 1,
1.733236, 0.6935833, 1.574928, 0, 0, 0, 1, 1,
1.758798, -0.08044723, 1.937501, 0, 0, 0, 1, 1,
1.75921, -1.312966, 1.460314, 0, 0, 0, 1, 1,
1.77512, 0.6446679, 1.647151, 0, 0, 0, 1, 1,
1.786426, -0.02063533, 2.670262, 0, 0, 0, 1, 1,
1.789061, 1.329313, 0.2468737, 0, 0, 0, 1, 1,
1.814775, 0.9250527, 1.603347, 1, 1, 1, 1, 1,
1.830438, 0.282869, 0.8958618, 1, 1, 1, 1, 1,
1.852035, -2.499753, 2.965081, 1, 1, 1, 1, 1,
1.870754, 1.247432, 0.2758676, 1, 1, 1, 1, 1,
1.888551, -1.019737, 2.182358, 1, 1, 1, 1, 1,
1.894436, 0.3126448, 1.805851, 1, 1, 1, 1, 1,
1.895928, 1.510504, 0.7446362, 1, 1, 1, 1, 1,
1.90142, 1.028077, 1.5964, 1, 1, 1, 1, 1,
1.923927, 0.1496208, 1.348659, 1, 1, 1, 1, 1,
1.948292, -0.912609, 2.939077, 1, 1, 1, 1, 1,
2.007515, -0.2827806, 0.2854795, 1, 1, 1, 1, 1,
2.020503, 0.1591664, 0.01743519, 1, 1, 1, 1, 1,
2.028693, -0.6742243, 2.151014, 1, 1, 1, 1, 1,
2.035628, -0.3544122, 3.083709, 1, 1, 1, 1, 1,
2.037387, -0.0641544, 1.519525, 1, 1, 1, 1, 1,
2.037534, -1.027242, 2.999443, 0, 0, 1, 1, 1,
2.056733, -1.060862, 3.570056, 1, 0, 0, 1, 1,
2.061154, -0.738006, 2.479699, 1, 0, 0, 1, 1,
2.066596, -0.06098368, 1.501446, 1, 0, 0, 1, 1,
2.067222, -0.2272236, 2.259758, 1, 0, 0, 1, 1,
2.07389, 0.864031, 1.120553, 1, 0, 0, 1, 1,
2.083561, -1.339491, 2.435066, 0, 0, 0, 1, 1,
2.109367, -1.939584, 1.52682, 0, 0, 0, 1, 1,
2.120903, -1.160628, -0.720392, 0, 0, 0, 1, 1,
2.151834, 0.6797037, 0.4851363, 0, 0, 0, 1, 1,
2.220701, 1.974902, 1.464856, 0, 0, 0, 1, 1,
2.361555, 1.054687, 3.162233, 0, 0, 0, 1, 1,
2.416579, 2.470992, 0.4840127, 0, 0, 0, 1, 1,
2.470808, 0.9488992, -0.7972916, 1, 1, 1, 1, 1,
2.536131, 0.444378, 1.513772, 1, 1, 1, 1, 1,
2.66828, -0.8685444, 1.036982, 1, 1, 1, 1, 1,
2.668334, 0.8350793, 0.305429, 1, 1, 1, 1, 1,
2.942838, -0.2299398, 3.190153, 1, 1, 1, 1, 1,
3.068348, -0.4799352, 1.707554, 1, 1, 1, 1, 1,
3.522128, 0.2027775, 1.831464, 1, 1, 1, 1, 1
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
var radius = 9.739173;
var distance = 34.20843;
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
mvMatrix.translate( -0.0527401, 0.5569401, -0.0256803 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.20843);
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