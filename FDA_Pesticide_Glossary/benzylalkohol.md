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
-3.479728, 0.2555681, 0.7634138, 1, 0, 0, 1,
-3.267579, 0.3465528, -2.204314, 1, 0.007843138, 0, 1,
-3.030507, 1.77181, 0.2469059, 1, 0.01176471, 0, 1,
-2.974062, -0.3229651, -2.77843, 1, 0.01960784, 0, 1,
-2.956216, 1.816627, -0.7069012, 1, 0.02352941, 0, 1,
-2.913915, 0.6972743, -1.192724, 1, 0.03137255, 0, 1,
-2.795793, -1.446438, -1.840844, 1, 0.03529412, 0, 1,
-2.624491, 0.01225246, -2.629018, 1, 0.04313726, 0, 1,
-2.569264, 1.316383, -1.080681, 1, 0.04705882, 0, 1,
-2.424499, -0.3975016, -2.204904, 1, 0.05490196, 0, 1,
-2.422304, -1.387018, -2.755817, 1, 0.05882353, 0, 1,
-2.288258, 1.606719, -0.4339064, 1, 0.06666667, 0, 1,
-2.281316, 1.598495, -0.8855791, 1, 0.07058824, 0, 1,
-2.247957, 0.1945336, -2.392413, 1, 0.07843138, 0, 1,
-2.237533, -1.569726, -3.160759, 1, 0.08235294, 0, 1,
-2.204932, 0.3291133, -1.245317, 1, 0.09019608, 0, 1,
-2.202772, -0.3573595, -2.558498, 1, 0.09411765, 0, 1,
-2.157202, 0.0005396446, -2.609626, 1, 0.1019608, 0, 1,
-2.076962, -1.074878, -1.053605, 1, 0.1098039, 0, 1,
-2.065332, 0.5538803, -2.009196, 1, 0.1137255, 0, 1,
-2.063994, -0.8578132, -1.405992, 1, 0.1215686, 0, 1,
-2.048324, 0.008311999, -1.959435, 1, 0.1254902, 0, 1,
-2.024148, 1.182938, 0.1524317, 1, 0.1333333, 0, 1,
-1.978783, 0.09697746, -2.407969, 1, 0.1372549, 0, 1,
-1.948835, 0.2634792, -1.226508, 1, 0.145098, 0, 1,
-1.935071, 0.8500144, -1.500876, 1, 0.1490196, 0, 1,
-1.928848, 0.572756, -1.872678, 1, 0.1568628, 0, 1,
-1.919337, -0.7499359, -3.600988, 1, 0.1607843, 0, 1,
-1.899252, 1.805634, 1.685963, 1, 0.1686275, 0, 1,
-1.876552, 0.1088971, -3.281611, 1, 0.172549, 0, 1,
-1.870646, -1.20925, -2.903315, 1, 0.1803922, 0, 1,
-1.833528, -0.3764903, -0.4131546, 1, 0.1843137, 0, 1,
-1.83061, 0.1588743, -2.189048, 1, 0.1921569, 0, 1,
-1.829907, -1.207941, -2.705324, 1, 0.1960784, 0, 1,
-1.828503, 0.2325384, -2.444064, 1, 0.2039216, 0, 1,
-1.818226, 1.526739, -0.4648181, 1, 0.2117647, 0, 1,
-1.817697, 0.6187506, -1.266077, 1, 0.2156863, 0, 1,
-1.810526, -1.319747, -3.560507, 1, 0.2235294, 0, 1,
-1.799194, 1.171778, 0.2782361, 1, 0.227451, 0, 1,
-1.722479, 0.5981194, -2.635921, 1, 0.2352941, 0, 1,
-1.721432, -0.7098078, -0.5895543, 1, 0.2392157, 0, 1,
-1.720083, 0.4849076, -0.6051362, 1, 0.2470588, 0, 1,
-1.716751, -0.9880099, -0.2497701, 1, 0.2509804, 0, 1,
-1.715104, 1.615718, -1.796969, 1, 0.2588235, 0, 1,
-1.705437, 0.5977037, 0.4757943, 1, 0.2627451, 0, 1,
-1.697146, 0.08506951, -1.589505, 1, 0.2705882, 0, 1,
-1.695636, -0.5033267, -1.220309, 1, 0.2745098, 0, 1,
-1.691061, -0.7972605, -1.599954, 1, 0.282353, 0, 1,
-1.687415, -0.9702976, -1.267542, 1, 0.2862745, 0, 1,
-1.686272, 3.189927, -0.9792343, 1, 0.2941177, 0, 1,
-1.684261, -0.05589327, -2.058038, 1, 0.3019608, 0, 1,
-1.657411, -0.1275307, -0.9229615, 1, 0.3058824, 0, 1,
-1.657243, -0.1067954, -0.7048342, 1, 0.3137255, 0, 1,
-1.634216, -0.4361992, -2.022338, 1, 0.3176471, 0, 1,
-1.630012, -1.869246, -2.130345, 1, 0.3254902, 0, 1,
-1.624322, 0.6367519, 0.5174618, 1, 0.3294118, 0, 1,
-1.573118, -0.5780447, 0.8520616, 1, 0.3372549, 0, 1,
-1.562849, -0.03703584, -2.13865, 1, 0.3411765, 0, 1,
-1.55847, 0.5778375, -1.324522, 1, 0.3490196, 0, 1,
-1.548515, 0.7489141, -0.9943809, 1, 0.3529412, 0, 1,
-1.530965, -0.7709508, -2.742956, 1, 0.3607843, 0, 1,
-1.527874, 2.854143, 0.1062802, 1, 0.3647059, 0, 1,
-1.527314, -0.4437325, -2.077842, 1, 0.372549, 0, 1,
-1.521638, -0.1227083, -0.7009321, 1, 0.3764706, 0, 1,
-1.514941, -0.9847261, -2.127438, 1, 0.3843137, 0, 1,
-1.49881, -0.04833904, -1.110233, 1, 0.3882353, 0, 1,
-1.498394, -0.7514044, -3.038535, 1, 0.3960784, 0, 1,
-1.493103, 1.754913, -1.34424, 1, 0.4039216, 0, 1,
-1.487106, -0.4357788, -1.594494, 1, 0.4078431, 0, 1,
-1.483745, -0.05380315, -1.926779, 1, 0.4156863, 0, 1,
-1.480572, -0.6243117, -3.526937, 1, 0.4196078, 0, 1,
-1.469576, 0.8386006, -0.009145168, 1, 0.427451, 0, 1,
-1.452254, 0.6767073, -1.237899, 1, 0.4313726, 0, 1,
-1.443863, -0.1865879, -0.6697525, 1, 0.4392157, 0, 1,
-1.431828, 0.1129246, -1.315212, 1, 0.4431373, 0, 1,
-1.422392, 0.3056486, -1.89134, 1, 0.4509804, 0, 1,
-1.419597, -0.2820303, -3.580083, 1, 0.454902, 0, 1,
-1.41385, 0.1599409, -3.373404, 1, 0.4627451, 0, 1,
-1.413216, -0.8042498, -3.241325, 1, 0.4666667, 0, 1,
-1.409408, -0.2475036, -2.517746, 1, 0.4745098, 0, 1,
-1.405252, -1.164428, -0.4593855, 1, 0.4784314, 0, 1,
-1.400936, 0.7713091, -2.553715, 1, 0.4862745, 0, 1,
-1.400278, 1.253601, 0.1934862, 1, 0.4901961, 0, 1,
-1.397964, -1.933185, -2.467107, 1, 0.4980392, 0, 1,
-1.389063, 1.257723, -0.8617349, 1, 0.5058824, 0, 1,
-1.378482, 0.7204285, 0.04591622, 1, 0.509804, 0, 1,
-1.376619, -0.9406741, -0.4555141, 1, 0.5176471, 0, 1,
-1.375401, 0.4245558, -2.220946, 1, 0.5215687, 0, 1,
-1.37348, -0.5522527, -1.125178, 1, 0.5294118, 0, 1,
-1.362294, -0.07856654, -1.581972, 1, 0.5333334, 0, 1,
-1.343372, -0.7991685, -3.43641, 1, 0.5411765, 0, 1,
-1.343043, -0.4239369, -2.713356, 1, 0.5450981, 0, 1,
-1.333707, 1.381006, -0.6394771, 1, 0.5529412, 0, 1,
-1.327524, -0.2667129, -0.3212376, 1, 0.5568628, 0, 1,
-1.3241, 0.09142477, -2.549618, 1, 0.5647059, 0, 1,
-1.322536, 2.780833, 0.8708863, 1, 0.5686275, 0, 1,
-1.304274, -1.137701, -3.601948, 1, 0.5764706, 0, 1,
-1.304155, 0.2867112, -1.117699, 1, 0.5803922, 0, 1,
-1.303231, -1.202799, -2.594553, 1, 0.5882353, 0, 1,
-1.302592, 2.213708, 1.254903, 1, 0.5921569, 0, 1,
-1.301163, 0.227655, -1.664965, 1, 0.6, 0, 1,
-1.291417, 1.317276, -0.8429899, 1, 0.6078432, 0, 1,
-1.288958, -0.02227618, -0.9803144, 1, 0.6117647, 0, 1,
-1.281322, -0.3365318, 0.4183089, 1, 0.6196079, 0, 1,
-1.277709, 2.40242, -0.6382951, 1, 0.6235294, 0, 1,
-1.276681, 2.535806, -1.384315, 1, 0.6313726, 0, 1,
-1.268125, -0.3326831, -0.9063923, 1, 0.6352941, 0, 1,
-1.268112, 1.042704, -1.443411, 1, 0.6431373, 0, 1,
-1.265189, 0.5623407, 0.2853329, 1, 0.6470588, 0, 1,
-1.257899, -0.1377871, -3.430947, 1, 0.654902, 0, 1,
-1.254447, 0.4170426, -1.53057, 1, 0.6588235, 0, 1,
-1.245042, 0.5046489, -0.4548917, 1, 0.6666667, 0, 1,
-1.242608, -0.495832, -1.462494, 1, 0.6705883, 0, 1,
-1.239959, 0.1913604, -3.009713, 1, 0.6784314, 0, 1,
-1.238024, -0.6145637, -2.953114, 1, 0.682353, 0, 1,
-1.237719, -0.05785071, -2.533051, 1, 0.6901961, 0, 1,
-1.226009, -0.5168373, -1.977233, 1, 0.6941177, 0, 1,
-1.221728, -0.07827467, -0.8436455, 1, 0.7019608, 0, 1,
-1.219759, 0.9945046, -2.053112, 1, 0.7098039, 0, 1,
-1.214631, 1.226601, -1.637905, 1, 0.7137255, 0, 1,
-1.210513, 0.1533402, -1.759333, 1, 0.7215686, 0, 1,
-1.203786, -1.932536, -0.7173633, 1, 0.7254902, 0, 1,
-1.203487, 2.012285, -2.240513, 1, 0.7333333, 0, 1,
-1.193443, 1.0097, -2.739364, 1, 0.7372549, 0, 1,
-1.190747, 0.04825017, -1.072946, 1, 0.7450981, 0, 1,
-1.183939, -0.3846571, -1.095163, 1, 0.7490196, 0, 1,
-1.181797, 0.04931061, -0.3268549, 1, 0.7568628, 0, 1,
-1.180364, -0.1656204, -2.421079, 1, 0.7607843, 0, 1,
-1.178723, -0.9054197, -2.500899, 1, 0.7686275, 0, 1,
-1.170984, -1.513539, -1.363475, 1, 0.772549, 0, 1,
-1.152887, -1.217685, -0.11921, 1, 0.7803922, 0, 1,
-1.148695, 0.609694, -1.43002, 1, 0.7843137, 0, 1,
-1.147488, -2.340301, -3.501833, 1, 0.7921569, 0, 1,
-1.141975, -0.6333404, -0.6701136, 1, 0.7960784, 0, 1,
-1.116971, 0.8390152, -1.355608, 1, 0.8039216, 0, 1,
-1.116867, 0.508294, -2.661387, 1, 0.8117647, 0, 1,
-1.108744, -0.2050261, -0.5832252, 1, 0.8156863, 0, 1,
-1.106406, 1.000978, -1.219795, 1, 0.8235294, 0, 1,
-1.100261, -0.5661479, -2.608505, 1, 0.827451, 0, 1,
-1.089192, 0.4399007, -0.05872384, 1, 0.8352941, 0, 1,
-1.087187, 1.202763, -0.5078042, 1, 0.8392157, 0, 1,
-1.076302, 0.6816766, -0.3988091, 1, 0.8470588, 0, 1,
-1.060878, -0.8268527, -0.7757647, 1, 0.8509804, 0, 1,
-1.060653, 0.4382389, -2.596055, 1, 0.8588235, 0, 1,
-1.059834, -0.9833091, -3.635535, 1, 0.8627451, 0, 1,
-1.058409, -0.01763669, -2.155105, 1, 0.8705882, 0, 1,
-1.051403, -3.129374, -1.957991, 1, 0.8745098, 0, 1,
-1.049515, -0.09618862, -1.760846, 1, 0.8823529, 0, 1,
-1.042301, -0.7931115, -0.9231382, 1, 0.8862745, 0, 1,
-1.041542, -0.2505996, 0.02195637, 1, 0.8941177, 0, 1,
-1.036857, -1.230664, -2.82513, 1, 0.8980392, 0, 1,
-1.034996, -0.8332983, -2.427523, 1, 0.9058824, 0, 1,
-1.032924, 1.446408, -0.3950782, 1, 0.9137255, 0, 1,
-1.031897, -0.2158121, -2.959627, 1, 0.9176471, 0, 1,
-1.027072, 0.7953289, -1.075611, 1, 0.9254902, 0, 1,
-1.027005, -0.3777459, -1.626062, 1, 0.9294118, 0, 1,
-1.023335, 0.4091495, -1.468518, 1, 0.9372549, 0, 1,
-1.015817, 1.296734, -0.7301479, 1, 0.9411765, 0, 1,
-1.003591, -0.6379396, -2.07302, 1, 0.9490196, 0, 1,
-0.9989211, 0.7010918, -1.965201, 1, 0.9529412, 0, 1,
-0.9988353, 1.516877, -1.054938, 1, 0.9607843, 0, 1,
-0.9918551, -0.9683025, -2.300699, 1, 0.9647059, 0, 1,
-0.9848605, 0.3962747, -2.491987, 1, 0.972549, 0, 1,
-0.9840875, -0.8701162, -3.424791, 1, 0.9764706, 0, 1,
-0.9817913, -0.7143224, -2.274478, 1, 0.9843137, 0, 1,
-0.9773094, -0.5821934, -2.920073, 1, 0.9882353, 0, 1,
-0.9714226, 1.076138, -0.3607164, 1, 0.9960784, 0, 1,
-0.965826, -0.7536141, -2.300917, 0.9960784, 1, 0, 1,
-0.9549125, -0.457812, -2.496254, 0.9921569, 1, 0, 1,
-0.9477586, 1.063937, -0.3586559, 0.9843137, 1, 0, 1,
-0.9388512, 0.3553434, 0.7067429, 0.9803922, 1, 0, 1,
-0.9349487, -0.3696232, -0.6962957, 0.972549, 1, 0, 1,
-0.9341981, 0.121101, -1.060611, 0.9686275, 1, 0, 1,
-0.9333815, -0.08997694, -1.646537, 0.9607843, 1, 0, 1,
-0.9304153, 0.8743894, -1.595989, 0.9568627, 1, 0, 1,
-0.9224348, 2.457803, -0.7876087, 0.9490196, 1, 0, 1,
-0.9170777, 0.09259938, 0.1580597, 0.945098, 1, 0, 1,
-0.911868, 1.123598, -2.250774, 0.9372549, 1, 0, 1,
-0.9045871, 1.509539, -1.756457, 0.9333333, 1, 0, 1,
-0.89732, -1.496351, -1.752648, 0.9254902, 1, 0, 1,
-0.8972031, -1.005185, -1.205193, 0.9215686, 1, 0, 1,
-0.8926174, 0.243089, -1.3385, 0.9137255, 1, 0, 1,
-0.890107, 1.029064, -0.8879474, 0.9098039, 1, 0, 1,
-0.887648, -0.1834415, -1.553805, 0.9019608, 1, 0, 1,
-0.882036, 0.6439365, -1.275841, 0.8941177, 1, 0, 1,
-0.8752948, 0.8430504, -1.732953, 0.8901961, 1, 0, 1,
-0.8647956, -0.5310465, -0.6168193, 0.8823529, 1, 0, 1,
-0.8633053, 0.7842787, -2.561002, 0.8784314, 1, 0, 1,
-0.8598301, -0.221764, -2.266946, 0.8705882, 1, 0, 1,
-0.8566387, -0.2931384, -0.432988, 0.8666667, 1, 0, 1,
-0.8555538, 0.434464, -1.022129, 0.8588235, 1, 0, 1,
-0.84798, 0.5748011, -1.314407, 0.854902, 1, 0, 1,
-0.8459664, -0.3560887, -1.976833, 0.8470588, 1, 0, 1,
-0.84458, 0.6332313, 1.005071, 0.8431373, 1, 0, 1,
-0.8378569, 0.9386771, -2.559157, 0.8352941, 1, 0, 1,
-0.8263124, -0.851051, -1.140002, 0.8313726, 1, 0, 1,
-0.822586, 0.7289078, -0.3116842, 0.8235294, 1, 0, 1,
-0.81929, 0.7619001, -0.2180795, 0.8196079, 1, 0, 1,
-0.8172973, -0.6987828, -1.764131, 0.8117647, 1, 0, 1,
-0.8148012, 2.001727, -0.1237543, 0.8078431, 1, 0, 1,
-0.8120874, 1.112333, 0.4679625, 0.8, 1, 0, 1,
-0.8119029, 0.2034247, -1.544661, 0.7921569, 1, 0, 1,
-0.8117369, -0.4364336, -1.149046, 0.7882353, 1, 0, 1,
-0.8101913, 0.4004891, -0.7973254, 0.7803922, 1, 0, 1,
-0.8075046, 0.8356741, -0.9645516, 0.7764706, 1, 0, 1,
-0.80734, -2.118932, -3.58935, 0.7686275, 1, 0, 1,
-0.8034816, -0.267966, -2.574583, 0.7647059, 1, 0, 1,
-0.8011059, 0.4399089, -1.458375, 0.7568628, 1, 0, 1,
-0.7996013, 0.2046386, -1.16423, 0.7529412, 1, 0, 1,
-0.7950094, 1.558098, 0.3592454, 0.7450981, 1, 0, 1,
-0.7936606, 0.6985425, -0.831558, 0.7411765, 1, 0, 1,
-0.7794288, -0.1380703, -3.242995, 0.7333333, 1, 0, 1,
-0.7740094, -0.04292902, -2.116471, 0.7294118, 1, 0, 1,
-0.7723954, -2.011147, -3.311214, 0.7215686, 1, 0, 1,
-0.7688915, 0.172539, -1.992999, 0.7176471, 1, 0, 1,
-0.768186, 0.9533001, -0.7711278, 0.7098039, 1, 0, 1,
-0.7632367, 0.1789046, -1.465671, 0.7058824, 1, 0, 1,
-0.7616331, 0.04407944, -2.113188, 0.6980392, 1, 0, 1,
-0.7607231, -0.1596382, -1.787495, 0.6901961, 1, 0, 1,
-0.758311, -0.447567, -1.571869, 0.6862745, 1, 0, 1,
-0.7583092, -0.963994, -2.778612, 0.6784314, 1, 0, 1,
-0.7531723, 0.4534865, -1.99529, 0.6745098, 1, 0, 1,
-0.7526221, -1.094169, -1.5901, 0.6666667, 1, 0, 1,
-0.7507386, -1.36398, -2.006334, 0.6627451, 1, 0, 1,
-0.7499167, -0.117162, -1.771549, 0.654902, 1, 0, 1,
-0.7478495, -0.02098272, -2.046579, 0.6509804, 1, 0, 1,
-0.7449623, -0.2273562, -1.308101, 0.6431373, 1, 0, 1,
-0.7403818, -0.8269479, -2.675006, 0.6392157, 1, 0, 1,
-0.7381063, -0.7976179, -1.640424, 0.6313726, 1, 0, 1,
-0.7359725, 0.2460648, -0.4108772, 0.627451, 1, 0, 1,
-0.733219, 1.361677, -1.358838, 0.6196079, 1, 0, 1,
-0.7311834, -0.3804555, -2.91768, 0.6156863, 1, 0, 1,
-0.7265917, 1.698799, -0.004144165, 0.6078432, 1, 0, 1,
-0.7265294, 2.190612, 0.09443504, 0.6039216, 1, 0, 1,
-0.7245102, -1.059199, -3.083956, 0.5960785, 1, 0, 1,
-0.7150056, 0.4729751, -0.9296511, 0.5882353, 1, 0, 1,
-0.7110592, -0.8128212, -1.043973, 0.5843138, 1, 0, 1,
-0.6998947, 0.03114623, -1.702699, 0.5764706, 1, 0, 1,
-0.6965666, -0.7772925, -3.405718, 0.572549, 1, 0, 1,
-0.6926199, -0.502376, -1.890469, 0.5647059, 1, 0, 1,
-0.6918039, -1.715006, -3.257054, 0.5607843, 1, 0, 1,
-0.6860072, -1.178709, -0.8893737, 0.5529412, 1, 0, 1,
-0.6834553, -0.8638592, -2.011305, 0.5490196, 1, 0, 1,
-0.6816218, 2.919733, -1.27802, 0.5411765, 1, 0, 1,
-0.6729354, 0.8556828, -1.244477, 0.5372549, 1, 0, 1,
-0.6717203, 0.3865681, -0.1460156, 0.5294118, 1, 0, 1,
-0.6716355, 1.487947, -0.341336, 0.5254902, 1, 0, 1,
-0.669452, -0.07868945, -2.010194, 0.5176471, 1, 0, 1,
-0.6672459, 1.199792, -0.3756437, 0.5137255, 1, 0, 1,
-0.6654592, -1.145809, -3.662163, 0.5058824, 1, 0, 1,
-0.6654276, 0.9947054, -1.183665, 0.5019608, 1, 0, 1,
-0.6652289, 2.405128, 0.5206651, 0.4941176, 1, 0, 1,
-0.6581928, -0.8162212, -2.197801, 0.4862745, 1, 0, 1,
-0.6576366, -0.3922318, -2.082193, 0.4823529, 1, 0, 1,
-0.6350523, 0.8303959, 0.3734677, 0.4745098, 1, 0, 1,
-0.6339018, 0.9281784, 0.5029684, 0.4705882, 1, 0, 1,
-0.6316563, -1.185798, -3.429976, 0.4627451, 1, 0, 1,
-0.6311976, -0.8034413, -3.363414, 0.4588235, 1, 0, 1,
-0.6302407, -0.7816707, -3.161288, 0.4509804, 1, 0, 1,
-0.6291189, 0.8875733, -1.740149, 0.4470588, 1, 0, 1,
-0.6287785, -1.153949, -2.525246, 0.4392157, 1, 0, 1,
-0.6247365, -0.9732426, -2.197447, 0.4352941, 1, 0, 1,
-0.6236095, -0.1714986, -2.833046, 0.427451, 1, 0, 1,
-0.6225386, 0.6736156, -2.134928, 0.4235294, 1, 0, 1,
-0.617346, 0.4011599, -0.8991477, 0.4156863, 1, 0, 1,
-0.6169125, 1.236274, -1.948543, 0.4117647, 1, 0, 1,
-0.614739, 0.3723598, -2.588562, 0.4039216, 1, 0, 1,
-0.6103624, -0.05083279, -2.775941, 0.3960784, 1, 0, 1,
-0.6003301, 0.9681919, -0.6448867, 0.3921569, 1, 0, 1,
-0.5999427, -3.24575, -2.190648, 0.3843137, 1, 0, 1,
-0.5978253, 0.1089634, -1.946447, 0.3803922, 1, 0, 1,
-0.5934576, 0.2370846, -1.551872, 0.372549, 1, 0, 1,
-0.592415, 0.8158454, -2.369496, 0.3686275, 1, 0, 1,
-0.5906301, 0.2249634, -0.772498, 0.3607843, 1, 0, 1,
-0.5837416, -0.7892814, -3.078576, 0.3568628, 1, 0, 1,
-0.5805209, -0.4080392, -1.128735, 0.3490196, 1, 0, 1,
-0.579579, 0.5469944, -0.7058209, 0.345098, 1, 0, 1,
-0.5786744, -0.7974257, -3.951771, 0.3372549, 1, 0, 1,
-0.5762771, 0.3996278, -0.15986, 0.3333333, 1, 0, 1,
-0.5743806, -0.6902181, -3.323872, 0.3254902, 1, 0, 1,
-0.5707348, 0.5373722, -0.4495171, 0.3215686, 1, 0, 1,
-0.5676089, 2.007921, -1.880638, 0.3137255, 1, 0, 1,
-0.5617678, 2.109364, -0.6782002, 0.3098039, 1, 0, 1,
-0.5612499, -0.1578887, -1.846924, 0.3019608, 1, 0, 1,
-0.5551856, 0.06490746, -0.7915825, 0.2941177, 1, 0, 1,
-0.5515904, -0.4718657, -3.083512, 0.2901961, 1, 0, 1,
-0.5493067, 0.9712756, -1.192096, 0.282353, 1, 0, 1,
-0.545771, -0.9697307, -2.626332, 0.2784314, 1, 0, 1,
-0.5421412, 0.7371923, -0.7941383, 0.2705882, 1, 0, 1,
-0.5363224, 0.5480082, -2.207762, 0.2666667, 1, 0, 1,
-0.5334441, 1.219961, 0.6172391, 0.2588235, 1, 0, 1,
-0.5303459, -0.1602483, -2.838578, 0.254902, 1, 0, 1,
-0.515421, 0.2292327, -1.851383, 0.2470588, 1, 0, 1,
-0.5097132, 1.078833, -0.5538448, 0.2431373, 1, 0, 1,
-0.5074123, -0.3803941, -1.915331, 0.2352941, 1, 0, 1,
-0.5010188, -0.4330405, -0.008198262, 0.2313726, 1, 0, 1,
-0.4993786, 0.364082, -1.106897, 0.2235294, 1, 0, 1,
-0.4981783, -1.399381, -5.03103, 0.2196078, 1, 0, 1,
-0.4883059, 1.59708, 0.273751, 0.2117647, 1, 0, 1,
-0.4867993, -0.6729018, -3.263523, 0.2078431, 1, 0, 1,
-0.4853868, 0.8112634, -0.3077135, 0.2, 1, 0, 1,
-0.4853605, 0.3335878, -0.08740015, 0.1921569, 1, 0, 1,
-0.4828505, 0.5638719, -0.5909601, 0.1882353, 1, 0, 1,
-0.4817241, 0.1802916, -1.69625, 0.1803922, 1, 0, 1,
-0.4791151, 1.329694, -1.067815, 0.1764706, 1, 0, 1,
-0.4775652, 1.010628, -1.27295, 0.1686275, 1, 0, 1,
-0.4751846, 0.2927491, -1.007779, 0.1647059, 1, 0, 1,
-0.4746692, 0.7291412, -2.167508, 0.1568628, 1, 0, 1,
-0.4721608, 0.238909, -2.478218, 0.1529412, 1, 0, 1,
-0.4713041, -1.791523, -2.719625, 0.145098, 1, 0, 1,
-0.4709776, 1.687139, -0.1254516, 0.1411765, 1, 0, 1,
-0.4609337, 1.150134, -0.104667, 0.1333333, 1, 0, 1,
-0.4588671, 2.357152, 1.564502, 0.1294118, 1, 0, 1,
-0.4568774, -0.0361775, -1.588304, 0.1215686, 1, 0, 1,
-0.4564465, -1.830751, -3.416375, 0.1176471, 1, 0, 1,
-0.4563861, 0.2643909, -0.9099285, 0.1098039, 1, 0, 1,
-0.4526749, 1.321992, -1.804973, 0.1058824, 1, 0, 1,
-0.4492188, -0.1198223, 0.1323656, 0.09803922, 1, 0, 1,
-0.4480725, -0.01886877, -3.116539, 0.09019608, 1, 0, 1,
-0.4478966, -0.4594201, -1.753613, 0.08627451, 1, 0, 1,
-0.4244198, 0.7139183, -1.378467, 0.07843138, 1, 0, 1,
-0.4198132, -1.698375, -3.099478, 0.07450981, 1, 0, 1,
-0.4176788, 1.49366, 0.1229447, 0.06666667, 1, 0, 1,
-0.4146109, -1.185389, -3.959116, 0.0627451, 1, 0, 1,
-0.4124309, -0.11114, -2.558207, 0.05490196, 1, 0, 1,
-0.4093515, 0.3491395, -1.864205, 0.05098039, 1, 0, 1,
-0.4035441, -0.7097293, -2.726444, 0.04313726, 1, 0, 1,
-0.3991211, -0.9080854, -0.8135775, 0.03921569, 1, 0, 1,
-0.3988879, 1.470927, -0.7933371, 0.03137255, 1, 0, 1,
-0.393957, 0.5863725, -0.6945966, 0.02745098, 1, 0, 1,
-0.3931586, 0.3104801, -2.197515, 0.01960784, 1, 0, 1,
-0.3927869, -0.5976474, -4.604088, 0.01568628, 1, 0, 1,
-0.3926947, -0.2897969, -1.173631, 0.007843138, 1, 0, 1,
-0.3923556, 0.6300357, 1.06222, 0.003921569, 1, 0, 1,
-0.3917084, 1.759473, 1.520571, 0, 1, 0.003921569, 1,
-0.3905995, 0.6586805, -0.9269115, 0, 1, 0.01176471, 1,
-0.381054, 2.547648, 1.56847, 0, 1, 0.01568628, 1,
-0.3804298, 0.116804, -0.7637672, 0, 1, 0.02352941, 1,
-0.3767633, 1.584942, 1.248385, 0, 1, 0.02745098, 1,
-0.3764222, 1.636108, 1.304929, 0, 1, 0.03529412, 1,
-0.375216, 0.0292624, -0.3784365, 0, 1, 0.03921569, 1,
-0.3746328, -0.0008246928, -1.275478, 0, 1, 0.04705882, 1,
-0.366154, 0.5578834, -0.1920388, 0, 1, 0.05098039, 1,
-0.3660532, 1.23515, 0.1186025, 0, 1, 0.05882353, 1,
-0.3625023, -0.8130757, -4.203772, 0, 1, 0.0627451, 1,
-0.3555419, 0.3451934, -3.689949, 0, 1, 0.07058824, 1,
-0.3525331, 2.985347, -0.1193066, 0, 1, 0.07450981, 1,
-0.3493873, -0.07225202, -1.859056, 0, 1, 0.08235294, 1,
-0.3484768, 1.181815, 0.3157452, 0, 1, 0.08627451, 1,
-0.3480549, -0.1870743, -2.68623, 0, 1, 0.09411765, 1,
-0.347692, -1.170586, -6.335989, 0, 1, 0.1019608, 1,
-0.3467698, 0.4115248, 0.8840476, 0, 1, 0.1058824, 1,
-0.3423773, 0.5840863, 0.2941891, 0, 1, 0.1137255, 1,
-0.3421855, -0.8299296, -2.37809, 0, 1, 0.1176471, 1,
-0.3421641, 0.7248543, 0.01372639, 0, 1, 0.1254902, 1,
-0.3365428, -1.802202, -3.825636, 0, 1, 0.1294118, 1,
-0.3352124, 0.4592663, -1.003994, 0, 1, 0.1372549, 1,
-0.3351453, -0.7353038, -2.241198, 0, 1, 0.1411765, 1,
-0.333953, 1.913033, 0.289361, 0, 1, 0.1490196, 1,
-0.3317954, 0.5155271, -0.03735984, 0, 1, 0.1529412, 1,
-0.3313351, -1.457103, -2.40495, 0, 1, 0.1607843, 1,
-0.3278964, 2.658522, -0.4551495, 0, 1, 0.1647059, 1,
-0.3273354, 0.1581974, 0.9196017, 0, 1, 0.172549, 1,
-0.3271024, 2.05085, -0.3693103, 0, 1, 0.1764706, 1,
-0.3187779, -0.1620016, -2.187137, 0, 1, 0.1843137, 1,
-0.3165677, 0.4016525, -0.5302934, 0, 1, 0.1882353, 1,
-0.3141811, -1.134812, -2.797041, 0, 1, 0.1960784, 1,
-0.3057815, -0.1581825, -3.44844, 0, 1, 0.2039216, 1,
-0.3052732, 1.113759, 0.4428133, 0, 1, 0.2078431, 1,
-0.3044567, -1.452342, -3.442528, 0, 1, 0.2156863, 1,
-0.3012997, -0.358214, -3.845534, 0, 1, 0.2196078, 1,
-0.2999576, -1.579776, -1.978549, 0, 1, 0.227451, 1,
-0.2997192, 0.2672621, -1.029965, 0, 1, 0.2313726, 1,
-0.2989097, 0.4812953, -1.439278, 0, 1, 0.2392157, 1,
-0.2981977, 1.23906, -0.6283454, 0, 1, 0.2431373, 1,
-0.2908083, -0.4522249, -2.777035, 0, 1, 0.2509804, 1,
-0.2891399, -1.266822, -2.884143, 0, 1, 0.254902, 1,
-0.2850488, 1.186173, -2.102898, 0, 1, 0.2627451, 1,
-0.2809374, 0.4231535, -0.07200848, 0, 1, 0.2666667, 1,
-0.2688097, -0.1563928, -1.710107, 0, 1, 0.2745098, 1,
-0.2676564, -1.16157, -4.981082, 0, 1, 0.2784314, 1,
-0.2636927, 1.24247, 0.4343166, 0, 1, 0.2862745, 1,
-0.2613432, 1.219699, -0.6343117, 0, 1, 0.2901961, 1,
-0.2587858, 1.625805, 1.207087, 0, 1, 0.2980392, 1,
-0.258488, -0.1029434, -2.806749, 0, 1, 0.3058824, 1,
-0.2542167, 0.7027852, -2.464231, 0, 1, 0.3098039, 1,
-0.2490025, -0.01203954, -1.374562, 0, 1, 0.3176471, 1,
-0.248478, -0.8260894, -2.352201, 0, 1, 0.3215686, 1,
-0.2470026, 0.7886783, -1.577839, 0, 1, 0.3294118, 1,
-0.2444039, 0.1945771, -1.334761, 0, 1, 0.3333333, 1,
-0.2430814, 0.06474465, -1.319823, 0, 1, 0.3411765, 1,
-0.2419602, -0.7786232, -1.562132, 0, 1, 0.345098, 1,
-0.2401886, -0.6433555, -1.371156, 0, 1, 0.3529412, 1,
-0.2360321, 0.7916696, -1.002772, 0, 1, 0.3568628, 1,
-0.2308867, 0.1842694, -0.06520609, 0, 1, 0.3647059, 1,
-0.2252512, -0.7192346, -3.566491, 0, 1, 0.3686275, 1,
-0.2247359, -1.068734, -4.673088, 0, 1, 0.3764706, 1,
-0.2239244, 0.585785, 0.7884349, 0, 1, 0.3803922, 1,
-0.2215647, -0.7790858, -3.84456, 0, 1, 0.3882353, 1,
-0.2215015, -0.6857429, -1.899308, 0, 1, 0.3921569, 1,
-0.2212992, 0.02195266, -2.021346, 0, 1, 0.4, 1,
-0.2175261, 0.5452492, -0.4205893, 0, 1, 0.4078431, 1,
-0.2170991, -0.3145497, -2.192743, 0, 1, 0.4117647, 1,
-0.214067, -0.4381905, -3.695182, 0, 1, 0.4196078, 1,
-0.2109125, 0.1492938, -1.926431, 0, 1, 0.4235294, 1,
-0.2087309, 0.2110981, -2.635427, 0, 1, 0.4313726, 1,
-0.2050576, 1.03444, -0.5599121, 0, 1, 0.4352941, 1,
-0.2048758, -0.4729362, -3.074505, 0, 1, 0.4431373, 1,
-0.2034398, -0.1679187, -2.825462, 0, 1, 0.4470588, 1,
-0.2029261, 0.5852851, -0.2187994, 0, 1, 0.454902, 1,
-0.1985925, 1.312179, 1.659015, 0, 1, 0.4588235, 1,
-0.1965596, -0.1010998, -3.366822, 0, 1, 0.4666667, 1,
-0.1959471, 0.1416443, -2.558458, 0, 1, 0.4705882, 1,
-0.1957709, 0.07470829, -0.9271157, 0, 1, 0.4784314, 1,
-0.1951223, -1.618555, -3.592116, 0, 1, 0.4823529, 1,
-0.1946975, 0.2752244, -2.292639, 0, 1, 0.4901961, 1,
-0.1940423, -0.7248407, -2.425284, 0, 1, 0.4941176, 1,
-0.1938007, 0.1702621, -1.653716, 0, 1, 0.5019608, 1,
-0.1922191, 1.438895, -0.08913081, 0, 1, 0.509804, 1,
-0.1909432, -0.3798684, -2.433904, 0, 1, 0.5137255, 1,
-0.1890603, -1.96812, -2.145998, 0, 1, 0.5215687, 1,
-0.1830535, 0.1744418, -0.3592548, 0, 1, 0.5254902, 1,
-0.1800449, -1.918598, -1.987119, 0, 1, 0.5333334, 1,
-0.178459, -0.740687, -2.442306, 0, 1, 0.5372549, 1,
-0.1751246, 0.4620419, 0.9168078, 0, 1, 0.5450981, 1,
-0.1749933, 2.023837, -0.7562232, 0, 1, 0.5490196, 1,
-0.1723099, -0.2929642, -3.352426, 0, 1, 0.5568628, 1,
-0.1713199, 0.624475, 0.07715803, 0, 1, 0.5607843, 1,
-0.1667722, 0.9930558, 0.5567929, 0, 1, 0.5686275, 1,
-0.1632533, 0.885332, -0.6463947, 0, 1, 0.572549, 1,
-0.1626117, 1.127752, -0.6187668, 0, 1, 0.5803922, 1,
-0.1544102, 0.6169433, 1.426103, 0, 1, 0.5843138, 1,
-0.1543328, -1.298834, -2.540184, 0, 1, 0.5921569, 1,
-0.1530288, 1.653806, -0.2622923, 0, 1, 0.5960785, 1,
-0.1512819, 1.124927, -1.624328, 0, 1, 0.6039216, 1,
-0.1490349, 2.378668, -0.4182699, 0, 1, 0.6117647, 1,
-0.1485393, 0.2851096, -0.2007295, 0, 1, 0.6156863, 1,
-0.1454702, -0.6186323, -2.364612, 0, 1, 0.6235294, 1,
-0.1421591, 1.517032, -0.07146125, 0, 1, 0.627451, 1,
-0.1397032, 1.508429, -0.6276765, 0, 1, 0.6352941, 1,
-0.1360847, 0.8158475, -0.8722949, 0, 1, 0.6392157, 1,
-0.1304892, 0.8884861, -0.7496703, 0, 1, 0.6470588, 1,
-0.1298993, 0.5672113, -0.07909577, 0, 1, 0.6509804, 1,
-0.1287245, -1.362107, -5.088241, 0, 1, 0.6588235, 1,
-0.1286928, 1.656102, 0.8777763, 0, 1, 0.6627451, 1,
-0.1207103, 0.7556469, 0.6394889, 0, 1, 0.6705883, 1,
-0.1195844, -0.5375055, -2.731061, 0, 1, 0.6745098, 1,
-0.11695, 0.282446, -1.769924, 0, 1, 0.682353, 1,
-0.1169001, -2.53945, -3.471678, 0, 1, 0.6862745, 1,
-0.109508, -0.3991526, -5.154263, 0, 1, 0.6941177, 1,
-0.1083619, -0.9033032, -4.958146, 0, 1, 0.7019608, 1,
-0.1082026, 0.2243231, -0.2290375, 0, 1, 0.7058824, 1,
-0.1009188, -0.4091049, -2.168608, 0, 1, 0.7137255, 1,
-0.1008689, -0.8295321, -2.243721, 0, 1, 0.7176471, 1,
-0.09813495, 0.2143646, 0.4468883, 0, 1, 0.7254902, 1,
-0.09813341, 0.764502, -0.2874335, 0, 1, 0.7294118, 1,
-0.09697828, 1.095299, 0.06537664, 0, 1, 0.7372549, 1,
-0.09604602, 0.2605396, -1.347082, 0, 1, 0.7411765, 1,
-0.0952967, 0.4190203, 0.1682417, 0, 1, 0.7490196, 1,
-0.09433146, 1.850026, -0.8163206, 0, 1, 0.7529412, 1,
-0.09047168, 0.7122276, -0.5972664, 0, 1, 0.7607843, 1,
-0.08805613, 0.07862508, -0.02291013, 0, 1, 0.7647059, 1,
-0.08582953, -1.56606, -3.032862, 0, 1, 0.772549, 1,
-0.08489307, 0.1397576, 1.284368, 0, 1, 0.7764706, 1,
-0.08229551, 0.9800308, -2.609407, 0, 1, 0.7843137, 1,
-0.07937537, -0.340539, -3.298121, 0, 1, 0.7882353, 1,
-0.07758594, -0.1776011, -1.1966, 0, 1, 0.7960784, 1,
-0.07494955, 1.739177, 1.357087, 0, 1, 0.8039216, 1,
-0.07483446, -0.01381599, -2.436961, 0, 1, 0.8078431, 1,
-0.06949263, -1.100247, -3.631492, 0, 1, 0.8156863, 1,
-0.06234147, 0.8599443, -0.5659012, 0, 1, 0.8196079, 1,
-0.06030426, -1.39557, -3.272125, 0, 1, 0.827451, 1,
-0.05887287, -0.4099879, -1.737846, 0, 1, 0.8313726, 1,
-0.05483247, -1.378149, -1.400097, 0, 1, 0.8392157, 1,
-0.05213635, 1.426578, 0.7460601, 0, 1, 0.8431373, 1,
-0.0427708, 0.3220502, -0.6835743, 0, 1, 0.8509804, 1,
-0.04014774, 1.534294, 1.461086, 0, 1, 0.854902, 1,
-0.03803371, 0.2695328, -0.5429788, 0, 1, 0.8627451, 1,
-0.0346503, 1.919822, -0.3410725, 0, 1, 0.8666667, 1,
-0.0263213, 1.018542, -2.460957, 0, 1, 0.8745098, 1,
-0.02473639, 0.638359, 0.711897, 0, 1, 0.8784314, 1,
-0.01587642, 1.483366, -0.02105859, 0, 1, 0.8862745, 1,
-0.01353247, 1.168557, 0.6062854, 0, 1, 0.8901961, 1,
-0.0107067, 0.02568337, 0.6579237, 0, 1, 0.8980392, 1,
-0.01039504, 2.225441, -0.8147727, 0, 1, 0.9058824, 1,
-0.007724672, 2.666789, -0.7310132, 0, 1, 0.9098039, 1,
-0.006822613, -1.054043, -1.44612, 0, 1, 0.9176471, 1,
-0.002929845, -1.027522, -2.615754, 0, 1, 0.9215686, 1,
-0.001021162, 1.908399, -0.7402645, 0, 1, 0.9294118, 1,
0.001465181, 0.4225506, 0.8359319, 0, 1, 0.9333333, 1,
0.00869448, -0.0009434276, 1.291297, 0, 1, 0.9411765, 1,
0.009360996, 0.07339519, 1.322593, 0, 1, 0.945098, 1,
0.00951047, 1.582819, -0.2997929, 0, 1, 0.9529412, 1,
0.01220127, 1.269557, 0.1610459, 0, 1, 0.9568627, 1,
0.01286464, 0.2261181, -0.7903731, 0, 1, 0.9647059, 1,
0.014651, 0.9502465, -0.1516471, 0, 1, 0.9686275, 1,
0.01599461, 0.7284182, 0.6532227, 0, 1, 0.9764706, 1,
0.01740489, 1.070017, 1.607135, 0, 1, 0.9803922, 1,
0.0181115, -1.190566, 4.352462, 0, 1, 0.9882353, 1,
0.02098868, 0.3911197, 1.129896, 0, 1, 0.9921569, 1,
0.02121183, 0.1968667, -1.238734, 0, 1, 1, 1,
0.02162977, 2.154675, -2.498245, 0, 0.9921569, 1, 1,
0.02429769, -0.678609, 3.160031, 0, 0.9882353, 1, 1,
0.02666461, -0.3587317, 3.190111, 0, 0.9803922, 1, 1,
0.02792704, 1.304161, 0.6167996, 0, 0.9764706, 1, 1,
0.02869353, -0.4261407, 2.193665, 0, 0.9686275, 1, 1,
0.03138197, 0.2487804, 0.6288654, 0, 0.9647059, 1, 1,
0.03527784, -0.3265635, 2.661975, 0, 0.9568627, 1, 1,
0.03527857, 0.8660921, 1.631336, 0, 0.9529412, 1, 1,
0.04041307, -1.018401, 2.745931, 0, 0.945098, 1, 1,
0.04359045, 1.13367, -1.539684, 0, 0.9411765, 1, 1,
0.05281555, 1.713677, -0.6821723, 0, 0.9333333, 1, 1,
0.05292115, 0.2017124, 0.2945442, 0, 0.9294118, 1, 1,
0.0532708, 1.575918, -0.3058535, 0, 0.9215686, 1, 1,
0.05774715, 0.7605609, 0.5160807, 0, 0.9176471, 1, 1,
0.06002176, 0.194744, 0.9602882, 0, 0.9098039, 1, 1,
0.0630294, 0.5789758, 0.3419805, 0, 0.9058824, 1, 1,
0.06785407, -0.5187503, 3.258662, 0, 0.8980392, 1, 1,
0.07210911, 0.3536219, 1.276758, 0, 0.8901961, 1, 1,
0.07567225, -0.1252244, 4.480383, 0, 0.8862745, 1, 1,
0.07587966, -1.426412, 4.449632, 0, 0.8784314, 1, 1,
0.07698952, -0.6183978, 2.852576, 0, 0.8745098, 1, 1,
0.08221861, -1.19925, 2.697273, 0, 0.8666667, 1, 1,
0.0859848, -0.2500845, 1.296388, 0, 0.8627451, 1, 1,
0.08802437, -0.07782049, 1.831224, 0, 0.854902, 1, 1,
0.08936178, 0.5987196, -0.960952, 0, 0.8509804, 1, 1,
0.09043358, -0.2175921, 1.229737, 0, 0.8431373, 1, 1,
0.09234837, 0.3611043, 0.5419837, 0, 0.8392157, 1, 1,
0.09418677, 0.319102, -0.1465185, 0, 0.8313726, 1, 1,
0.0981892, 0.2579722, 2.715489, 0, 0.827451, 1, 1,
0.09832917, 1.269331, -0.3325761, 0, 0.8196079, 1, 1,
0.1008968, 1.238957, 1.086178, 0, 0.8156863, 1, 1,
0.1025839, 0.2453693, -0.1002687, 0, 0.8078431, 1, 1,
0.1059095, -0.6948065, 2.036123, 0, 0.8039216, 1, 1,
0.1061839, 1.538285, 0.7369666, 0, 0.7960784, 1, 1,
0.1093622, 0.08782756, 1.089306, 0, 0.7882353, 1, 1,
0.1102966, 1.275649, 1.056911, 0, 0.7843137, 1, 1,
0.1150695, -0.7111452, 3.870794, 0, 0.7764706, 1, 1,
0.1187313, -0.8141939, 2.771279, 0, 0.772549, 1, 1,
0.1286166, 2.178933, -0.6832128, 0, 0.7647059, 1, 1,
0.129511, -1.313441, 4.013668, 0, 0.7607843, 1, 1,
0.1308054, -0.9689445, 3.285736, 0, 0.7529412, 1, 1,
0.1341858, 0.1312839, -1.476763, 0, 0.7490196, 1, 1,
0.1362686, -0.1030759, 2.170543, 0, 0.7411765, 1, 1,
0.1368993, 0.4050053, 0.8598186, 0, 0.7372549, 1, 1,
0.1385004, 0.2110806, 2.055482, 0, 0.7294118, 1, 1,
0.1448113, 0.325868, 0.1216136, 0, 0.7254902, 1, 1,
0.1455966, 1.440462, -0.0222113, 0, 0.7176471, 1, 1,
0.1561782, -0.4924295, 2.456861, 0, 0.7137255, 1, 1,
0.1578141, -0.007074935, 3.441385, 0, 0.7058824, 1, 1,
0.1582715, 0.5968312, 0.5614119, 0, 0.6980392, 1, 1,
0.1626674, -0.4037807, 5.326008, 0, 0.6941177, 1, 1,
0.1631912, -0.1334671, 1.971174, 0, 0.6862745, 1, 1,
0.1678439, -0.8843763, 1.773897, 0, 0.682353, 1, 1,
0.1960314, 0.3096653, 1.559803, 0, 0.6745098, 1, 1,
0.1969862, 0.3394438, 1.025406, 0, 0.6705883, 1, 1,
0.2041709, 0.9134208, 0.7967215, 0, 0.6627451, 1, 1,
0.2057751, -0.07133661, 3.420246, 0, 0.6588235, 1, 1,
0.2069691, 1.012318, 0.6092415, 0, 0.6509804, 1, 1,
0.210172, -0.9444281, 2.635857, 0, 0.6470588, 1, 1,
0.2124238, 0.4650669, 1.954883, 0, 0.6392157, 1, 1,
0.2143248, -2.014596, 3.506264, 0, 0.6352941, 1, 1,
0.2147681, -0.2852172, 2.085431, 0, 0.627451, 1, 1,
0.2147922, 0.6710544, -0.07648063, 0, 0.6235294, 1, 1,
0.2193573, 0.4741796, -0.1196445, 0, 0.6156863, 1, 1,
0.2226958, 0.1926192, -0.8793026, 0, 0.6117647, 1, 1,
0.2264913, 0.3599439, 0.7558987, 0, 0.6039216, 1, 1,
0.2289145, 0.30668, 0.4805006, 0, 0.5960785, 1, 1,
0.2358595, -0.09719968, 2.219482, 0, 0.5921569, 1, 1,
0.2395204, 0.1588835, 0.05371789, 0, 0.5843138, 1, 1,
0.2403966, 1.776741, 1.03372, 0, 0.5803922, 1, 1,
0.2441138, -0.6459391, 3.325465, 0, 0.572549, 1, 1,
0.2474789, 1.15996, -0.9208452, 0, 0.5686275, 1, 1,
0.2490556, -1.516789, 3.041742, 0, 0.5607843, 1, 1,
0.2491109, 0.00247439, 4.821173, 0, 0.5568628, 1, 1,
0.2542633, 0.1936484, 3.045082, 0, 0.5490196, 1, 1,
0.2548563, 0.5193041, 1.644472, 0, 0.5450981, 1, 1,
0.2557651, 1.653391, 0.355056, 0, 0.5372549, 1, 1,
0.2596695, -0.3368901, 1.848145, 0, 0.5333334, 1, 1,
0.2602135, -0.04442376, 2.664835, 0, 0.5254902, 1, 1,
0.2604162, 2.380216, -0.07354494, 0, 0.5215687, 1, 1,
0.2617388, 0.006327477, 1.638517, 0, 0.5137255, 1, 1,
0.262332, -0.1545053, 2.903321, 0, 0.509804, 1, 1,
0.2636944, 2.373092, -1.388956, 0, 0.5019608, 1, 1,
0.2665031, 0.1860256, 0.9798935, 0, 0.4941176, 1, 1,
0.2683496, 1.59209, 1.703497, 0, 0.4901961, 1, 1,
0.2697318, -0.3797035, 1.5552, 0, 0.4823529, 1, 1,
0.2706181, 0.4080985, 0.2507101, 0, 0.4784314, 1, 1,
0.2716969, 1.417322, -1.749686, 0, 0.4705882, 1, 1,
0.2717066, 1.823108, 0.3445214, 0, 0.4666667, 1, 1,
0.2749552, -0.1165505, 2.458641, 0, 0.4588235, 1, 1,
0.2780021, 0.2243681, 1.901075, 0, 0.454902, 1, 1,
0.2790741, 1.862589, -1.485743, 0, 0.4470588, 1, 1,
0.2809082, 0.03410932, 1.60623, 0, 0.4431373, 1, 1,
0.2895855, 0.4540307, 1.667248, 0, 0.4352941, 1, 1,
0.2903011, -0.07125366, 2.1052, 0, 0.4313726, 1, 1,
0.2961672, -1.88467, 1.869986, 0, 0.4235294, 1, 1,
0.2992449, -1.383998, 2.212643, 0, 0.4196078, 1, 1,
0.2994654, 0.3497368, 0.8012989, 0, 0.4117647, 1, 1,
0.3047164, -0.7716612, 2.645933, 0, 0.4078431, 1, 1,
0.304763, 0.05964099, 2.184348, 0, 0.4, 1, 1,
0.3059697, 0.3863668, -0.3916284, 0, 0.3921569, 1, 1,
0.3127086, 0.2841149, 1.958721, 0, 0.3882353, 1, 1,
0.3132229, 1.110502, -0.4940017, 0, 0.3803922, 1, 1,
0.315253, -0.3442268, 0.5222498, 0, 0.3764706, 1, 1,
0.3153845, 2.444555, -1.201552, 0, 0.3686275, 1, 1,
0.3165522, 0.6320028, 1.2013, 0, 0.3647059, 1, 1,
0.3209207, 0.7119152, -0.02294922, 0, 0.3568628, 1, 1,
0.3221152, 1.052392, 2.053157, 0, 0.3529412, 1, 1,
0.3280557, 1.020958, -0.7314483, 0, 0.345098, 1, 1,
0.3285518, 1.334393, 0.5311433, 0, 0.3411765, 1, 1,
0.3286112, 1.638576, 1.554813, 0, 0.3333333, 1, 1,
0.3344108, -0.6774457, 2.411376, 0, 0.3294118, 1, 1,
0.3353279, -0.3390318, 3.345819, 0, 0.3215686, 1, 1,
0.3406474, -0.4154228, 3.644079, 0, 0.3176471, 1, 1,
0.3409965, -1.022844, 2.311803, 0, 0.3098039, 1, 1,
0.3489577, 0.9507536, 0.1786916, 0, 0.3058824, 1, 1,
0.3577484, -1.174031, 1.961613, 0, 0.2980392, 1, 1,
0.3577918, -0.3263879, 3.112006, 0, 0.2901961, 1, 1,
0.3609604, -0.3350143, 1.25637, 0, 0.2862745, 1, 1,
0.3610075, 0.2786445, 0.2137269, 0, 0.2784314, 1, 1,
0.3636155, 1.508488, 0.7155921, 0, 0.2745098, 1, 1,
0.3639581, -1.266849, 2.083487, 0, 0.2666667, 1, 1,
0.3686529, 0.0246843, 1.390002, 0, 0.2627451, 1, 1,
0.3714049, 0.1865091, 0.931096, 0, 0.254902, 1, 1,
0.3723999, -1.411848, 3.641515, 0, 0.2509804, 1, 1,
0.3768106, 0.1483375, -0.9460889, 0, 0.2431373, 1, 1,
0.3832002, -0.5496042, 2.574808, 0, 0.2392157, 1, 1,
0.3862766, 0.5944926, -0.9409425, 0, 0.2313726, 1, 1,
0.389125, -0.5046396, 3.649744, 0, 0.227451, 1, 1,
0.3932231, 0.4045091, 2.085948, 0, 0.2196078, 1, 1,
0.3973658, 0.8171933, 0.5335305, 0, 0.2156863, 1, 1,
0.3974417, -1.262982, 4.337679, 0, 0.2078431, 1, 1,
0.3981929, -0.32139, 2.732792, 0, 0.2039216, 1, 1,
0.3991023, 0.8598595, -1.075216, 0, 0.1960784, 1, 1,
0.4021382, -0.8335575, 3.844055, 0, 0.1882353, 1, 1,
0.4034241, 1.523915, -0.405136, 0, 0.1843137, 1, 1,
0.4048155, 0.7661815, -0.2747017, 0, 0.1764706, 1, 1,
0.4101302, -0.0283604, 1.560993, 0, 0.172549, 1, 1,
0.410231, -1.220951, 4.459815, 0, 0.1647059, 1, 1,
0.4145062, -0.7497064, 3.816953, 0, 0.1607843, 1, 1,
0.4155639, -1.730617, 3.774995, 0, 0.1529412, 1, 1,
0.4185831, 1.06407, -1.396755, 0, 0.1490196, 1, 1,
0.4248905, -1.699587, 3.637708, 0, 0.1411765, 1, 1,
0.4281483, -0.3437969, 2.80423, 0, 0.1372549, 1, 1,
0.429697, 0.22604, 3.096976, 0, 0.1294118, 1, 1,
0.4325102, 0.4513384, -0.01578965, 0, 0.1254902, 1, 1,
0.4355734, 1.002059, 1.136109, 0, 0.1176471, 1, 1,
0.4360326, -1.946355, 1.145462, 0, 0.1137255, 1, 1,
0.4391295, 0.8750451, 1.606431, 0, 0.1058824, 1, 1,
0.4431349, -0.1565932, 0.2057346, 0, 0.09803922, 1, 1,
0.4454017, 0.9825177, -1.219602, 0, 0.09411765, 1, 1,
0.4509584, 1.17779, 1.308069, 0, 0.08627451, 1, 1,
0.4545025, 2.34976, 0.1087952, 0, 0.08235294, 1, 1,
0.461672, 1.126213, -1.100002, 0, 0.07450981, 1, 1,
0.4623601, -0.5908875, 2.221296, 0, 0.07058824, 1, 1,
0.4642093, 1.701895, 0.2514182, 0, 0.0627451, 1, 1,
0.4655299, -0.9814638, 2.877227, 0, 0.05882353, 1, 1,
0.4697647, 1.715875, 0.3741573, 0, 0.05098039, 1, 1,
0.4733417, 0.4464699, 1.394086, 0, 0.04705882, 1, 1,
0.4736122, -0.5780243, 3.35184, 0, 0.03921569, 1, 1,
0.4746976, 0.2481819, 0.0001247199, 0, 0.03529412, 1, 1,
0.4747838, 2.205263, -0.9226956, 0, 0.02745098, 1, 1,
0.4749289, 0.5109538, -0.6223341, 0, 0.02352941, 1, 1,
0.4794257, -0.5176854, 3.613114, 0, 0.01568628, 1, 1,
0.480815, 0.6943367, 0.09029279, 0, 0.01176471, 1, 1,
0.4811686, 0.4149097, 1.434953, 0, 0.003921569, 1, 1,
0.4870136, -0.429624, 1.929043, 0.003921569, 0, 1, 1,
0.4872847, -1.229091, 2.96942, 0.007843138, 0, 1, 1,
0.4882932, 0.3122664, 1.467759, 0.01568628, 0, 1, 1,
0.4925942, 0.6687772, -0.3682273, 0.01960784, 0, 1, 1,
0.4930032, 0.09278534, -0.4608449, 0.02745098, 0, 1, 1,
0.5026465, 1.266035, -0.3821225, 0.03137255, 0, 1, 1,
0.505797, -0.7247936, 2.449614, 0.03921569, 0, 1, 1,
0.5077517, -0.8731571, 1.932406, 0.04313726, 0, 1, 1,
0.5082065, 0.1178529, 0.5506026, 0.05098039, 0, 1, 1,
0.5150561, -1.42255, 1.994238, 0.05490196, 0, 1, 1,
0.5159063, 1.024504, 0.1792438, 0.0627451, 0, 1, 1,
0.5194236, -0.7200182, 2.569643, 0.06666667, 0, 1, 1,
0.5217399, 0.7785705, 0.1895064, 0.07450981, 0, 1, 1,
0.5243528, -2.465112, 2.317183, 0.07843138, 0, 1, 1,
0.5283782, 0.6741152, -1.199736, 0.08627451, 0, 1, 1,
0.5294896, -0.3588126, 1.040749, 0.09019608, 0, 1, 1,
0.5312631, -0.3308131, 0.3574924, 0.09803922, 0, 1, 1,
0.5324717, -0.4930993, 2.506935, 0.1058824, 0, 1, 1,
0.5350931, 1.027553, -0.3255365, 0.1098039, 0, 1, 1,
0.5357901, -0.2055905, 2.775659, 0.1176471, 0, 1, 1,
0.538507, -0.5972058, 1.139569, 0.1215686, 0, 1, 1,
0.5395858, 0.811636, 0.3803391, 0.1294118, 0, 1, 1,
0.5398947, -0.524173, 2.926398, 0.1333333, 0, 1, 1,
0.5406064, -0.8428187, 1.747865, 0.1411765, 0, 1, 1,
0.543678, -0.8470455, 1.354461, 0.145098, 0, 1, 1,
0.5445491, 1.849169, 1.791896, 0.1529412, 0, 1, 1,
0.5475001, 0.07277685, 0.1347741, 0.1568628, 0, 1, 1,
0.550576, 0.4275008, -0.5028521, 0.1647059, 0, 1, 1,
0.5519792, -0.982269, 2.783997, 0.1686275, 0, 1, 1,
0.5526299, -0.3787581, 1.552564, 0.1764706, 0, 1, 1,
0.5565112, 0.295453, 0.7275353, 0.1803922, 0, 1, 1,
0.5579808, -0.7916662, 3.1285, 0.1882353, 0, 1, 1,
0.5613428, -2.043411, 4.715161, 0.1921569, 0, 1, 1,
0.5634486, 0.08406829, 1.066417, 0.2, 0, 1, 1,
0.564937, 0.2842446, 1.565618, 0.2078431, 0, 1, 1,
0.5702057, -0.7773623, 3.553465, 0.2117647, 0, 1, 1,
0.5705242, -0.3070246, 2.719698, 0.2196078, 0, 1, 1,
0.5715879, -0.2911192, -0.2804341, 0.2235294, 0, 1, 1,
0.5723802, -0.7033387, 3.116068, 0.2313726, 0, 1, 1,
0.5742781, 0.5370448, 1.754466, 0.2352941, 0, 1, 1,
0.5756236, 0.1686858, 1.156319, 0.2431373, 0, 1, 1,
0.5793165, -0.851218, 2.409159, 0.2470588, 0, 1, 1,
0.5813702, 0.9282654, 1.232457, 0.254902, 0, 1, 1,
0.5822833, 1.123716, 0.7101177, 0.2588235, 0, 1, 1,
0.5851129, 0.2642274, 0.7119095, 0.2666667, 0, 1, 1,
0.5851605, -0.1309127, 1.813268, 0.2705882, 0, 1, 1,
0.5861538, 1.424207, 0.7137907, 0.2784314, 0, 1, 1,
0.5925226, -0.4813585, 2.398658, 0.282353, 0, 1, 1,
0.5926777, -2.072771, 3.188829, 0.2901961, 0, 1, 1,
0.5929209, -0.5524243, 1.737567, 0.2941177, 0, 1, 1,
0.5964053, 1.617994, -1.784492, 0.3019608, 0, 1, 1,
0.6033493, 1.223197, 1.770627, 0.3098039, 0, 1, 1,
0.6033939, -1.138143, 1.688316, 0.3137255, 0, 1, 1,
0.6044344, -0.2896566, 0.3369024, 0.3215686, 0, 1, 1,
0.6046901, -1.041003, 3.588483, 0.3254902, 0, 1, 1,
0.6056859, -0.3567792, 2.38804, 0.3333333, 0, 1, 1,
0.6091124, 0.5648182, 0.3159651, 0.3372549, 0, 1, 1,
0.6196681, 0.8924298, 0.01041864, 0.345098, 0, 1, 1,
0.6216387, 1.897821, 2.723001, 0.3490196, 0, 1, 1,
0.6216825, -0.003316282, 1.430304, 0.3568628, 0, 1, 1,
0.6297603, -0.4219159, 3.370529, 0.3607843, 0, 1, 1,
0.6333701, 0.397103, 1.375828, 0.3686275, 0, 1, 1,
0.636062, -0.5839031, 0.6420345, 0.372549, 0, 1, 1,
0.6401088, -1.286129, 4.935397, 0.3803922, 0, 1, 1,
0.6407547, -0.6816164, 2.484915, 0.3843137, 0, 1, 1,
0.6428614, -1.853895, 3.754148, 0.3921569, 0, 1, 1,
0.6465083, -2.041698, 2.446863, 0.3960784, 0, 1, 1,
0.6477517, 1.224054, 0.5165114, 0.4039216, 0, 1, 1,
0.6493201, -0.548641, 3.298046, 0.4117647, 0, 1, 1,
0.6503305, -0.8805493, 1.463799, 0.4156863, 0, 1, 1,
0.6507921, -0.5156521, 1.082189, 0.4235294, 0, 1, 1,
0.6518059, -1.782942, 2.12766, 0.427451, 0, 1, 1,
0.6534444, -2.255482, 3.116131, 0.4352941, 0, 1, 1,
0.6558745, 0.8785206, 0.8796268, 0.4392157, 0, 1, 1,
0.6561732, 3.23212, 0.9226112, 0.4470588, 0, 1, 1,
0.6578318, 0.9656919, -0.549719, 0.4509804, 0, 1, 1,
0.6614087, 2.180098, 1.034934, 0.4588235, 0, 1, 1,
0.6615779, -0.5806749, 1.907724, 0.4627451, 0, 1, 1,
0.6669054, 0.5669369, 2.576106, 0.4705882, 0, 1, 1,
0.6786905, -0.6164114, 1.882508, 0.4745098, 0, 1, 1,
0.6818581, 0.02868946, 1.644894, 0.4823529, 0, 1, 1,
0.6830911, 0.04900566, 0.3096806, 0.4862745, 0, 1, 1,
0.6917725, 0.2334694, 2.23656, 0.4941176, 0, 1, 1,
0.6940714, 0.2071626, 3.435327, 0.5019608, 0, 1, 1,
0.6958863, 0.6260794, 1.720235, 0.5058824, 0, 1, 1,
0.6965418, 0.52157, 0.2506447, 0.5137255, 0, 1, 1,
0.6988201, 1.359816, 1.452433, 0.5176471, 0, 1, 1,
0.6989423, -0.9665439, 3.587803, 0.5254902, 0, 1, 1,
0.700976, -0.5292128, 1.116386, 0.5294118, 0, 1, 1,
0.7029352, 1.373613, 0.7510189, 0.5372549, 0, 1, 1,
0.7033119, 1.541019, 1.872457, 0.5411765, 0, 1, 1,
0.7096128, -1.765012, 3.540729, 0.5490196, 0, 1, 1,
0.7157187, 1.712337, 1.769448, 0.5529412, 0, 1, 1,
0.7168174, 0.6078626, 0.3854772, 0.5607843, 0, 1, 1,
0.7177603, 0.1752639, 1.205462, 0.5647059, 0, 1, 1,
0.730278, 0.05620246, 1.827124, 0.572549, 0, 1, 1,
0.7307302, -1.37068, 3.04905, 0.5764706, 0, 1, 1,
0.7341144, -0.1391585, 0.2756996, 0.5843138, 0, 1, 1,
0.7341467, 1.081641, -0.4194902, 0.5882353, 0, 1, 1,
0.7349523, 0.8733394, 1.930621, 0.5960785, 0, 1, 1,
0.7384509, -0.3966794, 0.8686558, 0.6039216, 0, 1, 1,
0.7395921, -1.497328, 2.500644, 0.6078432, 0, 1, 1,
0.74051, 1.267494, 0.05592709, 0.6156863, 0, 1, 1,
0.7475193, -0.7601067, 3.205807, 0.6196079, 0, 1, 1,
0.749539, -0.6508837, 1.205674, 0.627451, 0, 1, 1,
0.7559005, -1.107261, 2.187418, 0.6313726, 0, 1, 1,
0.7577873, 0.8699119, 1.286264, 0.6392157, 0, 1, 1,
0.7582992, -1.082822, 1.446701, 0.6431373, 0, 1, 1,
0.7638199, -0.8372645, 2.359021, 0.6509804, 0, 1, 1,
0.7662154, -1.559509, 1.902435, 0.654902, 0, 1, 1,
0.7663829, -0.2854201, 1.837871, 0.6627451, 0, 1, 1,
0.7694135, -1.350831, 4.989903, 0.6666667, 0, 1, 1,
0.7776911, 0.684692, 0.1786164, 0.6745098, 0, 1, 1,
0.7824597, 0.2429315, 1.975055, 0.6784314, 0, 1, 1,
0.785567, -2.009515, 3.19955, 0.6862745, 0, 1, 1,
0.7864211, 0.1909313, 3.56374, 0.6901961, 0, 1, 1,
0.7900189, -0.1595788, 1.154635, 0.6980392, 0, 1, 1,
0.7903512, -0.02409199, 0.3016033, 0.7058824, 0, 1, 1,
0.7917357, 0.500291, -0.2668355, 0.7098039, 0, 1, 1,
0.7951252, -0.5891008, 3.725758, 0.7176471, 0, 1, 1,
0.800885, -0.557543, 1.841964, 0.7215686, 0, 1, 1,
0.8040842, -0.9489336, 3.017524, 0.7294118, 0, 1, 1,
0.8062731, 0.03697732, 2.608797, 0.7333333, 0, 1, 1,
0.8151155, -0.6220232, 0.8730205, 0.7411765, 0, 1, 1,
0.8161083, 0.3300215, -0.2319684, 0.7450981, 0, 1, 1,
0.8172188, -1.270413, 2.169785, 0.7529412, 0, 1, 1,
0.8188575, 0.2085626, 2.881561, 0.7568628, 0, 1, 1,
0.8239619, 0.9783915, -0.2591714, 0.7647059, 0, 1, 1,
0.8270709, 0.3705921, 0.4719568, 0.7686275, 0, 1, 1,
0.8286311, -0.5414411, 1.676948, 0.7764706, 0, 1, 1,
0.8345928, 0.9657856, 0.03440424, 0.7803922, 0, 1, 1,
0.8353797, -0.4906125, 2.721426, 0.7882353, 0, 1, 1,
0.840852, -0.248541, 3.698561, 0.7921569, 0, 1, 1,
0.8481995, -0.09157087, 2.457442, 0.8, 0, 1, 1,
0.8490485, 0.2668011, 2.044219, 0.8078431, 0, 1, 1,
0.8536946, 1.703018, 1.398222, 0.8117647, 0, 1, 1,
0.854231, 0.356301, 2.35497, 0.8196079, 0, 1, 1,
0.8557061, 0.1054226, 2.885187, 0.8235294, 0, 1, 1,
0.8573788, 1.454568, 0.004274948, 0.8313726, 0, 1, 1,
0.862362, -1.862496, 2.179756, 0.8352941, 0, 1, 1,
0.8676084, 1.550846, 1.309487, 0.8431373, 0, 1, 1,
0.8734032, 1.112493, 0.2992394, 0.8470588, 0, 1, 1,
0.8734941, -0.7889237, 1.269499, 0.854902, 0, 1, 1,
0.875119, 2.093712, 0.5803853, 0.8588235, 0, 1, 1,
0.885271, -1.002927, 1.326368, 0.8666667, 0, 1, 1,
0.8918427, 1.672541, 1.633102, 0.8705882, 0, 1, 1,
0.8955998, -0.638904, 2.703317, 0.8784314, 0, 1, 1,
0.9053676, 1.461348, 0.643181, 0.8823529, 0, 1, 1,
0.9057623, 0.8350216, 1.229106, 0.8901961, 0, 1, 1,
0.9115441, -1.224193, 2.615284, 0.8941177, 0, 1, 1,
0.9138686, 0.5972086, 1.691511, 0.9019608, 0, 1, 1,
0.9179437, 0.4246706, 1.030815, 0.9098039, 0, 1, 1,
0.9200222, -0.3806862, 3.651819, 0.9137255, 0, 1, 1,
0.9225715, 0.8310878, 1.374176, 0.9215686, 0, 1, 1,
0.926461, 0.3910038, 2.775354, 0.9254902, 0, 1, 1,
0.9379823, 0.8940291, -1.080186, 0.9333333, 0, 1, 1,
0.9398684, -0.7129645, 1.148632, 0.9372549, 0, 1, 1,
0.9455358, -0.01736531, 0.4017275, 0.945098, 0, 1, 1,
0.9516243, -0.4707494, 2.546271, 0.9490196, 0, 1, 1,
0.9545142, 0.1804242, 2.230736, 0.9568627, 0, 1, 1,
0.964058, 0.3717739, 1.933971, 0.9607843, 0, 1, 1,
0.9677012, 0.3311496, 1.66894, 0.9686275, 0, 1, 1,
0.9706328, -1.517495, 2.495203, 0.972549, 0, 1, 1,
0.9717334, 0.7673982, 0.7200957, 0.9803922, 0, 1, 1,
0.9747562, -1.909367, 1.28436, 0.9843137, 0, 1, 1,
0.9760246, -1.490091, 2.101059, 0.9921569, 0, 1, 1,
0.9940726, -0.2787562, 1.369961, 0.9960784, 0, 1, 1,
0.9941258, 0.2291196, -0.2088968, 1, 0, 0.9960784, 1,
0.99991, 0.8235809, -1.22194, 1, 0, 0.9882353, 1,
1.000421, 0.932764, 2.185121, 1, 0, 0.9843137, 1,
1.004085, 1.22802, -0.792111, 1, 0, 0.9764706, 1,
1.005398, -0.7047464, 2.133352, 1, 0, 0.972549, 1,
1.007786, 0.9029931, 1.133847, 1, 0, 0.9647059, 1,
1.0101, -0.7468497, 2.48763, 1, 0, 0.9607843, 1,
1.020798, -1.079972, 1.582238, 1, 0, 0.9529412, 1,
1.026068, -2.058208, 1.526365, 1, 0, 0.9490196, 1,
1.031662, 0.00554953, 0.2390254, 1, 0, 0.9411765, 1,
1.03181, 1.147184, 1.350853, 1, 0, 0.9372549, 1,
1.034209, 1.164675, 1.638356, 1, 0, 0.9294118, 1,
1.039406, -0.7885754, 2.474647, 1, 0, 0.9254902, 1,
1.044779, -0.6644762, 3.338178, 1, 0, 0.9176471, 1,
1.046102, -0.3789266, 1.324688, 1, 0, 0.9137255, 1,
1.049632, 0.4217604, 2.346892, 1, 0, 0.9058824, 1,
1.049747, 0.6252978, 0.5837438, 1, 0, 0.9019608, 1,
1.053845, -0.09893318, 1.453884, 1, 0, 0.8941177, 1,
1.054776, -1.545492, 2.296607, 1, 0, 0.8862745, 1,
1.059483, -0.326287, 1.636752, 1, 0, 0.8823529, 1,
1.072054, -2.071406, 0.8173504, 1, 0, 0.8745098, 1,
1.079623, 0.4345704, 1.028838, 1, 0, 0.8705882, 1,
1.082214, 0.5560436, 0.6328225, 1, 0, 0.8627451, 1,
1.086446, 1.916303, -0.6584761, 1, 0, 0.8588235, 1,
1.091103, 0.3043446, 1.605881, 1, 0, 0.8509804, 1,
1.091789, -0.619407, 1.646467, 1, 0, 0.8470588, 1,
1.093979, -1.433758, 2.756561, 1, 0, 0.8392157, 1,
1.094285, 1.269871, 1.315807, 1, 0, 0.8352941, 1,
1.094918, -2.049478, 3.117005, 1, 0, 0.827451, 1,
1.10187, -0.8733152, 5.142568, 1, 0, 0.8235294, 1,
1.106557, 0.6705472, 1.360004, 1, 0, 0.8156863, 1,
1.10831, -1.129944, 1.255419, 1, 0, 0.8117647, 1,
1.11721, -0.1024109, 2.200991, 1, 0, 0.8039216, 1,
1.135057, 0.08969631, 2.326844, 1, 0, 0.7960784, 1,
1.140376, 1.887493, 0.7088119, 1, 0, 0.7921569, 1,
1.142622, -0.5233548, 1.789663, 1, 0, 0.7843137, 1,
1.145814, -1.558927, 0.8545747, 1, 0, 0.7803922, 1,
1.151036, 0.3179596, 0.8695935, 1, 0, 0.772549, 1,
1.151858, 0.09246249, 2.340636, 1, 0, 0.7686275, 1,
1.160401, 1.103851, 1.25195, 1, 0, 0.7607843, 1,
1.163785, -1.480834, 3.245301, 1, 0, 0.7568628, 1,
1.172396, 0.6920639, 0.3593959, 1, 0, 0.7490196, 1,
1.190381, 2.254128, 0.0418008, 1, 0, 0.7450981, 1,
1.192517, 0.2031225, 3.108202, 1, 0, 0.7372549, 1,
1.193714, 0.161508, 3.743332, 1, 0, 0.7333333, 1,
1.196178, -1.09289, 2.864921, 1, 0, 0.7254902, 1,
1.197912, -1.159687, 2.270116, 1, 0, 0.7215686, 1,
1.198791, -0.8072813, 2.04824, 1, 0, 0.7137255, 1,
1.198977, -0.09963706, 1.073385, 1, 0, 0.7098039, 1,
1.202308, -0.5564553, 3.434215, 1, 0, 0.7019608, 1,
1.203012, 0.2707053, 2.71932, 1, 0, 0.6941177, 1,
1.203833, 0.07521652, 2.854937, 1, 0, 0.6901961, 1,
1.205438, -0.8583671, 4.103772, 1, 0, 0.682353, 1,
1.212588, -0.3926934, 1.615576, 1, 0, 0.6784314, 1,
1.222877, 0.9889529, 0.9663054, 1, 0, 0.6705883, 1,
1.224772, -0.05720254, 2.144755, 1, 0, 0.6666667, 1,
1.225305, 2.149167, 0.9952381, 1, 0, 0.6588235, 1,
1.229756, 1.24745, 2.800426, 1, 0, 0.654902, 1,
1.252528, 1.349128, 0.3507477, 1, 0, 0.6470588, 1,
1.255324, 0.233712, 1.408553, 1, 0, 0.6431373, 1,
1.255872, 0.6304727, 1.240356, 1, 0, 0.6352941, 1,
1.256948, -0.2717781, 2.917699, 1, 0, 0.6313726, 1,
1.262426, 0.4997382, -1.117549, 1, 0, 0.6235294, 1,
1.269415, 0.3827281, 1.557314, 1, 0, 0.6196079, 1,
1.269522, 1.10078, 1.628548, 1, 0, 0.6117647, 1,
1.270084, 0.9227492, -0.8767549, 1, 0, 0.6078432, 1,
1.270284, 0.05360251, 1.341733, 1, 0, 0.6, 1,
1.271395, 0.08567595, 1.796081, 1, 0, 0.5921569, 1,
1.289096, -0.9967179, 1.802373, 1, 0, 0.5882353, 1,
1.291311, 0.5312586, 1.049231, 1, 0, 0.5803922, 1,
1.293716, -1.60659, 2.005561, 1, 0, 0.5764706, 1,
1.293791, 0.659493, 0.02189668, 1, 0, 0.5686275, 1,
1.295833, 0.0001261909, 1.98701, 1, 0, 0.5647059, 1,
1.299326, 0.3905253, 2.129719, 1, 0, 0.5568628, 1,
1.300351, 0.6650636, 1.329203, 1, 0, 0.5529412, 1,
1.30624, 0.2884167, 0.140993, 1, 0, 0.5450981, 1,
1.31387, 0.7387384, 4.675997, 1, 0, 0.5411765, 1,
1.31877, 1.259832, 2.098021, 1, 0, 0.5333334, 1,
1.33282, 0.4252663, 1.87044, 1, 0, 0.5294118, 1,
1.334279, 1.162835, 1.164549, 1, 0, 0.5215687, 1,
1.349816, 0.6526081, 2.426206, 1, 0, 0.5176471, 1,
1.355148, 0.2949127, 2.324461, 1, 0, 0.509804, 1,
1.360529, -0.3683579, 0.4732243, 1, 0, 0.5058824, 1,
1.366262, -0.5376384, 1.203456, 1, 0, 0.4980392, 1,
1.369737, 0.3746177, 0.8468744, 1, 0, 0.4901961, 1,
1.373159, 0.5922434, 0.7905083, 1, 0, 0.4862745, 1,
1.381893, 0.56932, 2.224316, 1, 0, 0.4784314, 1,
1.385018, 2.403386, -0.5461029, 1, 0, 0.4745098, 1,
1.392313, -1.556292, 1.943383, 1, 0, 0.4666667, 1,
1.405466, -1.944077, 1.452654, 1, 0, 0.4627451, 1,
1.415024, -0.9313338, 2.941864, 1, 0, 0.454902, 1,
1.420288, -1.243771, 0.527973, 1, 0, 0.4509804, 1,
1.427088, -0.9868973, 2.398743, 1, 0, 0.4431373, 1,
1.433737, 0.7517224, 2.129244, 1, 0, 0.4392157, 1,
1.434507, 0.461891, 0.7557379, 1, 0, 0.4313726, 1,
1.437555, 1.249632, 1.079971, 1, 0, 0.427451, 1,
1.442149, 1.498608, 2.069614, 1, 0, 0.4196078, 1,
1.446224, 0.962585, 3.093751, 1, 0, 0.4156863, 1,
1.45043, 0.9597399, 1.258437, 1, 0, 0.4078431, 1,
1.452594, -0.1258527, 1.335916, 1, 0, 0.4039216, 1,
1.456453, -0.07923663, 2.326841, 1, 0, 0.3960784, 1,
1.474033, -1.166234, 1.918237, 1, 0, 0.3882353, 1,
1.485559, 0.1231074, 1.192736, 1, 0, 0.3843137, 1,
1.492203, 1.606267, 0.2760181, 1, 0, 0.3764706, 1,
1.492694, 0.2638766, 0.4382334, 1, 0, 0.372549, 1,
1.494348, 0.9383331, 0.5642284, 1, 0, 0.3647059, 1,
1.514037, 1.006984, 1.408682, 1, 0, 0.3607843, 1,
1.514961, 1.054223, 1.626356, 1, 0, 0.3529412, 1,
1.515466, -1.279217, 0.7005561, 1, 0, 0.3490196, 1,
1.516202, 0.1738035, 2.135335, 1, 0, 0.3411765, 1,
1.523215, 1.206102, 1.764974, 1, 0, 0.3372549, 1,
1.5303, -0.05333564, 1.483968, 1, 0, 0.3294118, 1,
1.547693, -2.049907, 2.984591, 1, 0, 0.3254902, 1,
1.548517, -0.4059066, 1.903707, 1, 0, 0.3176471, 1,
1.569075, -0.1216165, 1.666604, 1, 0, 0.3137255, 1,
1.576191, 2.450247, 1.590388, 1, 0, 0.3058824, 1,
1.583495, -1.303202, 1.941503, 1, 0, 0.2980392, 1,
1.585279, 0.9879779, 0.6294829, 1, 0, 0.2941177, 1,
1.593427, -0.7549029, 1.494284, 1, 0, 0.2862745, 1,
1.616756, -0.5938981, 2.476249, 1, 0, 0.282353, 1,
1.646919, -0.573552, 1.647588, 1, 0, 0.2745098, 1,
1.651355, 1.596188, -0.8102272, 1, 0, 0.2705882, 1,
1.65507, -0.05913363, 2.462216, 1, 0, 0.2627451, 1,
1.672936, -0.3577681, 2.567786, 1, 0, 0.2588235, 1,
1.698123, -0.9317283, 1.572487, 1, 0, 0.2509804, 1,
1.714479, -0.2352988, 1.228334, 1, 0, 0.2470588, 1,
1.71584, 1.270587, 1.139007, 1, 0, 0.2392157, 1,
1.716061, -0.0262306, 1.626434, 1, 0, 0.2352941, 1,
1.72528, -1.036405, 1.455245, 1, 0, 0.227451, 1,
1.749375, -1.025002, 1.540488, 1, 0, 0.2235294, 1,
1.75253, -0.135387, 2.260339, 1, 0, 0.2156863, 1,
1.768004, -1.529502, 2.655274, 1, 0, 0.2117647, 1,
1.77021, -0.9247404, 2.991747, 1, 0, 0.2039216, 1,
1.781631, -0.6449291, 2.973171, 1, 0, 0.1960784, 1,
1.825285, -0.1019525, 2.702358, 1, 0, 0.1921569, 1,
1.835088, 0.8281906, 1.451624, 1, 0, 0.1843137, 1,
1.858835, 0.2198387, 2.113358, 1, 0, 0.1803922, 1,
1.884965, 0.7738626, 2.145527, 1, 0, 0.172549, 1,
1.923387, 1.013956, 1.841799, 1, 0, 0.1686275, 1,
1.931253, 1.034915, 2.112588, 1, 0, 0.1607843, 1,
1.931963, -0.7598154, 2.353663, 1, 0, 0.1568628, 1,
1.948621, 0.9196858, -0.7884053, 1, 0, 0.1490196, 1,
1.952846, -0.1330453, 1.533716, 1, 0, 0.145098, 1,
1.968052, 0.6302209, 2.307934, 1, 0, 0.1372549, 1,
1.977056, -0.6061342, 1.835896, 1, 0, 0.1333333, 1,
1.994126, -1.344301, 3.832942, 1, 0, 0.1254902, 1,
1.996202, 0.9815384, 0.2560761, 1, 0, 0.1215686, 1,
2.001036, -0.7243736, 2.733399, 1, 0, 0.1137255, 1,
2.003488, -0.938677, 1.525343, 1, 0, 0.1098039, 1,
2.042276, -1.801084, 1.465132, 1, 0, 0.1019608, 1,
2.053682, 0.1384649, -0.2949357, 1, 0, 0.09411765, 1,
2.056932, -1.962691, 3.22757, 1, 0, 0.09019608, 1,
2.07424, -0.4483121, 2.220439, 1, 0, 0.08235294, 1,
2.145392, -0.9559327, 3.386544, 1, 0, 0.07843138, 1,
2.201611, 0.3831546, 1.178274, 1, 0, 0.07058824, 1,
2.285334, -0.6813557, 1.722229, 1, 0, 0.06666667, 1,
2.301099, 0.306506, 1.000384, 1, 0, 0.05882353, 1,
2.33132, -0.5926031, 1.504891, 1, 0, 0.05490196, 1,
2.364824, 0.2481029, 3.085569, 1, 0, 0.04705882, 1,
2.397403, 0.4412256, 0.7835476, 1, 0, 0.04313726, 1,
2.485892, -1.247941, 2.602247, 1, 0, 0.03529412, 1,
2.637851, 0.709785, 2.861256, 1, 0, 0.03137255, 1,
2.78782, 1.530452, 0.7622733, 1, 0, 0.02352941, 1,
2.977455, -0.3125961, 1.915295, 1, 0, 0.01960784, 1,
3.052658, 0.7201813, 3.222632, 1, 0, 0.01176471, 1,
3.456544, 1.797012, -0.345641, 1, 0, 0.007843138, 1
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
-0.01159191, -4.343749, -8.312697, 0, -0.5, 0.5, 0.5,
-0.01159191, -4.343749, -8.312697, 1, -0.5, 0.5, 0.5,
-0.01159191, -4.343749, -8.312697, 1, 1.5, 0.5, 0.5,
-0.01159191, -4.343749, -8.312697, 0, 1.5, 0.5, 0.5
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
-4.655426, -0.006814957, -8.312697, 0, -0.5, 0.5, 0.5,
-4.655426, -0.006814957, -8.312697, 1, -0.5, 0.5, 0.5,
-4.655426, -0.006814957, -8.312697, 1, 1.5, 0.5, 0.5,
-4.655426, -0.006814957, -8.312697, 0, 1.5, 0.5, 0.5
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
-4.655426, -4.343749, -0.5049906, 0, -0.5, 0.5, 0.5,
-4.655426, -4.343749, -0.5049906, 1, -0.5, 0.5, 0.5,
-4.655426, -4.343749, -0.5049906, 1, 1.5, 0.5, 0.5,
-4.655426, -4.343749, -0.5049906, 0, 1.5, 0.5, 0.5
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
-3, -3.342918, -6.510919,
3, -3.342918, -6.510919,
-3, -3.342918, -6.510919,
-3, -3.509723, -6.811215,
-2, -3.342918, -6.510919,
-2, -3.509723, -6.811215,
-1, -3.342918, -6.510919,
-1, -3.509723, -6.811215,
0, -3.342918, -6.510919,
0, -3.509723, -6.811215,
1, -3.342918, -6.510919,
1, -3.509723, -6.811215,
2, -3.342918, -6.510919,
2, -3.509723, -6.811215,
3, -3.342918, -6.510919,
3, -3.509723, -6.811215
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
-3, -3.843333, -7.411808, 0, -0.5, 0.5, 0.5,
-3, -3.843333, -7.411808, 1, -0.5, 0.5, 0.5,
-3, -3.843333, -7.411808, 1, 1.5, 0.5, 0.5,
-3, -3.843333, -7.411808, 0, 1.5, 0.5, 0.5,
-2, -3.843333, -7.411808, 0, -0.5, 0.5, 0.5,
-2, -3.843333, -7.411808, 1, -0.5, 0.5, 0.5,
-2, -3.843333, -7.411808, 1, 1.5, 0.5, 0.5,
-2, -3.843333, -7.411808, 0, 1.5, 0.5, 0.5,
-1, -3.843333, -7.411808, 0, -0.5, 0.5, 0.5,
-1, -3.843333, -7.411808, 1, -0.5, 0.5, 0.5,
-1, -3.843333, -7.411808, 1, 1.5, 0.5, 0.5,
-1, -3.843333, -7.411808, 0, 1.5, 0.5, 0.5,
0, -3.843333, -7.411808, 0, -0.5, 0.5, 0.5,
0, -3.843333, -7.411808, 1, -0.5, 0.5, 0.5,
0, -3.843333, -7.411808, 1, 1.5, 0.5, 0.5,
0, -3.843333, -7.411808, 0, 1.5, 0.5, 0.5,
1, -3.843333, -7.411808, 0, -0.5, 0.5, 0.5,
1, -3.843333, -7.411808, 1, -0.5, 0.5, 0.5,
1, -3.843333, -7.411808, 1, 1.5, 0.5, 0.5,
1, -3.843333, -7.411808, 0, 1.5, 0.5, 0.5,
2, -3.843333, -7.411808, 0, -0.5, 0.5, 0.5,
2, -3.843333, -7.411808, 1, -0.5, 0.5, 0.5,
2, -3.843333, -7.411808, 1, 1.5, 0.5, 0.5,
2, -3.843333, -7.411808, 0, 1.5, 0.5, 0.5,
3, -3.843333, -7.411808, 0, -0.5, 0.5, 0.5,
3, -3.843333, -7.411808, 1, -0.5, 0.5, 0.5,
3, -3.843333, -7.411808, 1, 1.5, 0.5, 0.5,
3, -3.843333, -7.411808, 0, 1.5, 0.5, 0.5
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
-3.583772, -3, -6.510919,
-3.583772, 3, -6.510919,
-3.583772, -3, -6.510919,
-3.762381, -3, -6.811215,
-3.583772, -2, -6.510919,
-3.762381, -2, -6.811215,
-3.583772, -1, -6.510919,
-3.762381, -1, -6.811215,
-3.583772, 0, -6.510919,
-3.762381, 0, -6.811215,
-3.583772, 1, -6.510919,
-3.762381, 1, -6.811215,
-3.583772, 2, -6.510919,
-3.762381, 2, -6.811215,
-3.583772, 3, -6.510919,
-3.762381, 3, -6.811215
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
-4.119599, -3, -7.411808, 0, -0.5, 0.5, 0.5,
-4.119599, -3, -7.411808, 1, -0.5, 0.5, 0.5,
-4.119599, -3, -7.411808, 1, 1.5, 0.5, 0.5,
-4.119599, -3, -7.411808, 0, 1.5, 0.5, 0.5,
-4.119599, -2, -7.411808, 0, -0.5, 0.5, 0.5,
-4.119599, -2, -7.411808, 1, -0.5, 0.5, 0.5,
-4.119599, -2, -7.411808, 1, 1.5, 0.5, 0.5,
-4.119599, -2, -7.411808, 0, 1.5, 0.5, 0.5,
-4.119599, -1, -7.411808, 0, -0.5, 0.5, 0.5,
-4.119599, -1, -7.411808, 1, -0.5, 0.5, 0.5,
-4.119599, -1, -7.411808, 1, 1.5, 0.5, 0.5,
-4.119599, -1, -7.411808, 0, 1.5, 0.5, 0.5,
-4.119599, 0, -7.411808, 0, -0.5, 0.5, 0.5,
-4.119599, 0, -7.411808, 1, -0.5, 0.5, 0.5,
-4.119599, 0, -7.411808, 1, 1.5, 0.5, 0.5,
-4.119599, 0, -7.411808, 0, 1.5, 0.5, 0.5,
-4.119599, 1, -7.411808, 0, -0.5, 0.5, 0.5,
-4.119599, 1, -7.411808, 1, -0.5, 0.5, 0.5,
-4.119599, 1, -7.411808, 1, 1.5, 0.5, 0.5,
-4.119599, 1, -7.411808, 0, 1.5, 0.5, 0.5,
-4.119599, 2, -7.411808, 0, -0.5, 0.5, 0.5,
-4.119599, 2, -7.411808, 1, -0.5, 0.5, 0.5,
-4.119599, 2, -7.411808, 1, 1.5, 0.5, 0.5,
-4.119599, 2, -7.411808, 0, 1.5, 0.5, 0.5,
-4.119599, 3, -7.411808, 0, -0.5, 0.5, 0.5,
-4.119599, 3, -7.411808, 1, -0.5, 0.5, 0.5,
-4.119599, 3, -7.411808, 1, 1.5, 0.5, 0.5,
-4.119599, 3, -7.411808, 0, 1.5, 0.5, 0.5
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
-3.583772, -3.342918, -6,
-3.583772, -3.342918, 4,
-3.583772, -3.342918, -6,
-3.762381, -3.509723, -6,
-3.583772, -3.342918, -4,
-3.762381, -3.509723, -4,
-3.583772, -3.342918, -2,
-3.762381, -3.509723, -2,
-3.583772, -3.342918, 0,
-3.762381, -3.509723, 0,
-3.583772, -3.342918, 2,
-3.762381, -3.509723, 2,
-3.583772, -3.342918, 4,
-3.762381, -3.509723, 4
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
"-6",
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
-4.119599, -3.843333, -6, 0, -0.5, 0.5, 0.5,
-4.119599, -3.843333, -6, 1, -0.5, 0.5, 0.5,
-4.119599, -3.843333, -6, 1, 1.5, 0.5, 0.5,
-4.119599, -3.843333, -6, 0, 1.5, 0.5, 0.5,
-4.119599, -3.843333, -4, 0, -0.5, 0.5, 0.5,
-4.119599, -3.843333, -4, 1, -0.5, 0.5, 0.5,
-4.119599, -3.843333, -4, 1, 1.5, 0.5, 0.5,
-4.119599, -3.843333, -4, 0, 1.5, 0.5, 0.5,
-4.119599, -3.843333, -2, 0, -0.5, 0.5, 0.5,
-4.119599, -3.843333, -2, 1, -0.5, 0.5, 0.5,
-4.119599, -3.843333, -2, 1, 1.5, 0.5, 0.5,
-4.119599, -3.843333, -2, 0, 1.5, 0.5, 0.5,
-4.119599, -3.843333, 0, 0, -0.5, 0.5, 0.5,
-4.119599, -3.843333, 0, 1, -0.5, 0.5, 0.5,
-4.119599, -3.843333, 0, 1, 1.5, 0.5, 0.5,
-4.119599, -3.843333, 0, 0, 1.5, 0.5, 0.5,
-4.119599, -3.843333, 2, 0, -0.5, 0.5, 0.5,
-4.119599, -3.843333, 2, 1, -0.5, 0.5, 0.5,
-4.119599, -3.843333, 2, 1, 1.5, 0.5, 0.5,
-4.119599, -3.843333, 2, 0, 1.5, 0.5, 0.5,
-4.119599, -3.843333, 4, 0, -0.5, 0.5, 0.5,
-4.119599, -3.843333, 4, 1, -0.5, 0.5, 0.5,
-4.119599, -3.843333, 4, 1, 1.5, 0.5, 0.5,
-4.119599, -3.843333, 4, 0, 1.5, 0.5, 0.5
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
-3.583772, -3.342918, -6.510919,
-3.583772, 3.329288, -6.510919,
-3.583772, -3.342918, 5.500938,
-3.583772, 3.329288, 5.500938,
-3.583772, -3.342918, -6.510919,
-3.583772, -3.342918, 5.500938,
-3.583772, 3.329288, -6.510919,
-3.583772, 3.329288, 5.500938,
-3.583772, -3.342918, -6.510919,
3.560588, -3.342918, -6.510919,
-3.583772, -3.342918, 5.500938,
3.560588, -3.342918, 5.500938,
-3.583772, 3.329288, -6.510919,
3.560588, 3.329288, -6.510919,
-3.583772, 3.329288, 5.500938,
3.560588, 3.329288, 5.500938,
3.560588, -3.342918, -6.510919,
3.560588, 3.329288, -6.510919,
3.560588, -3.342918, 5.500938,
3.560588, 3.329288, 5.500938,
3.560588, -3.342918, -6.510919,
3.560588, -3.342918, 5.500938,
3.560588, 3.329288, -6.510919,
3.560588, 3.329288, 5.500938
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
var radius = 8.269718;
var distance = 36.79292;
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
mvMatrix.translate( 0.01159191, 0.006814957, 0.5049906 );
mvMatrix.scale( 1.25153, 1.340094, 0.7443796 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.79292);
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
benzylalkohol<-read.table("benzylalkohol.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-benzylalkohol$V2
```

```
## Error in eval(expr, envir, enclos): object 'benzylalkohol' not found
```

```r
y<-benzylalkohol$V3
```

```
## Error in eval(expr, envir, enclos): object 'benzylalkohol' not found
```

```r
z<-benzylalkohol$V4
```

```
## Error in eval(expr, envir, enclos): object 'benzylalkohol' not found
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
-3.479728, 0.2555681, 0.7634138, 0, 0, 1, 1, 1,
-3.267579, 0.3465528, -2.204314, 1, 0, 0, 1, 1,
-3.030507, 1.77181, 0.2469059, 1, 0, 0, 1, 1,
-2.974062, -0.3229651, -2.77843, 1, 0, 0, 1, 1,
-2.956216, 1.816627, -0.7069012, 1, 0, 0, 1, 1,
-2.913915, 0.6972743, -1.192724, 1, 0, 0, 1, 1,
-2.795793, -1.446438, -1.840844, 0, 0, 0, 1, 1,
-2.624491, 0.01225246, -2.629018, 0, 0, 0, 1, 1,
-2.569264, 1.316383, -1.080681, 0, 0, 0, 1, 1,
-2.424499, -0.3975016, -2.204904, 0, 0, 0, 1, 1,
-2.422304, -1.387018, -2.755817, 0, 0, 0, 1, 1,
-2.288258, 1.606719, -0.4339064, 0, 0, 0, 1, 1,
-2.281316, 1.598495, -0.8855791, 0, 0, 0, 1, 1,
-2.247957, 0.1945336, -2.392413, 1, 1, 1, 1, 1,
-2.237533, -1.569726, -3.160759, 1, 1, 1, 1, 1,
-2.204932, 0.3291133, -1.245317, 1, 1, 1, 1, 1,
-2.202772, -0.3573595, -2.558498, 1, 1, 1, 1, 1,
-2.157202, 0.0005396446, -2.609626, 1, 1, 1, 1, 1,
-2.076962, -1.074878, -1.053605, 1, 1, 1, 1, 1,
-2.065332, 0.5538803, -2.009196, 1, 1, 1, 1, 1,
-2.063994, -0.8578132, -1.405992, 1, 1, 1, 1, 1,
-2.048324, 0.008311999, -1.959435, 1, 1, 1, 1, 1,
-2.024148, 1.182938, 0.1524317, 1, 1, 1, 1, 1,
-1.978783, 0.09697746, -2.407969, 1, 1, 1, 1, 1,
-1.948835, 0.2634792, -1.226508, 1, 1, 1, 1, 1,
-1.935071, 0.8500144, -1.500876, 1, 1, 1, 1, 1,
-1.928848, 0.572756, -1.872678, 1, 1, 1, 1, 1,
-1.919337, -0.7499359, -3.600988, 1, 1, 1, 1, 1,
-1.899252, 1.805634, 1.685963, 0, 0, 1, 1, 1,
-1.876552, 0.1088971, -3.281611, 1, 0, 0, 1, 1,
-1.870646, -1.20925, -2.903315, 1, 0, 0, 1, 1,
-1.833528, -0.3764903, -0.4131546, 1, 0, 0, 1, 1,
-1.83061, 0.1588743, -2.189048, 1, 0, 0, 1, 1,
-1.829907, -1.207941, -2.705324, 1, 0, 0, 1, 1,
-1.828503, 0.2325384, -2.444064, 0, 0, 0, 1, 1,
-1.818226, 1.526739, -0.4648181, 0, 0, 0, 1, 1,
-1.817697, 0.6187506, -1.266077, 0, 0, 0, 1, 1,
-1.810526, -1.319747, -3.560507, 0, 0, 0, 1, 1,
-1.799194, 1.171778, 0.2782361, 0, 0, 0, 1, 1,
-1.722479, 0.5981194, -2.635921, 0, 0, 0, 1, 1,
-1.721432, -0.7098078, -0.5895543, 0, 0, 0, 1, 1,
-1.720083, 0.4849076, -0.6051362, 1, 1, 1, 1, 1,
-1.716751, -0.9880099, -0.2497701, 1, 1, 1, 1, 1,
-1.715104, 1.615718, -1.796969, 1, 1, 1, 1, 1,
-1.705437, 0.5977037, 0.4757943, 1, 1, 1, 1, 1,
-1.697146, 0.08506951, -1.589505, 1, 1, 1, 1, 1,
-1.695636, -0.5033267, -1.220309, 1, 1, 1, 1, 1,
-1.691061, -0.7972605, -1.599954, 1, 1, 1, 1, 1,
-1.687415, -0.9702976, -1.267542, 1, 1, 1, 1, 1,
-1.686272, 3.189927, -0.9792343, 1, 1, 1, 1, 1,
-1.684261, -0.05589327, -2.058038, 1, 1, 1, 1, 1,
-1.657411, -0.1275307, -0.9229615, 1, 1, 1, 1, 1,
-1.657243, -0.1067954, -0.7048342, 1, 1, 1, 1, 1,
-1.634216, -0.4361992, -2.022338, 1, 1, 1, 1, 1,
-1.630012, -1.869246, -2.130345, 1, 1, 1, 1, 1,
-1.624322, 0.6367519, 0.5174618, 1, 1, 1, 1, 1,
-1.573118, -0.5780447, 0.8520616, 0, 0, 1, 1, 1,
-1.562849, -0.03703584, -2.13865, 1, 0, 0, 1, 1,
-1.55847, 0.5778375, -1.324522, 1, 0, 0, 1, 1,
-1.548515, 0.7489141, -0.9943809, 1, 0, 0, 1, 1,
-1.530965, -0.7709508, -2.742956, 1, 0, 0, 1, 1,
-1.527874, 2.854143, 0.1062802, 1, 0, 0, 1, 1,
-1.527314, -0.4437325, -2.077842, 0, 0, 0, 1, 1,
-1.521638, -0.1227083, -0.7009321, 0, 0, 0, 1, 1,
-1.514941, -0.9847261, -2.127438, 0, 0, 0, 1, 1,
-1.49881, -0.04833904, -1.110233, 0, 0, 0, 1, 1,
-1.498394, -0.7514044, -3.038535, 0, 0, 0, 1, 1,
-1.493103, 1.754913, -1.34424, 0, 0, 0, 1, 1,
-1.487106, -0.4357788, -1.594494, 0, 0, 0, 1, 1,
-1.483745, -0.05380315, -1.926779, 1, 1, 1, 1, 1,
-1.480572, -0.6243117, -3.526937, 1, 1, 1, 1, 1,
-1.469576, 0.8386006, -0.009145168, 1, 1, 1, 1, 1,
-1.452254, 0.6767073, -1.237899, 1, 1, 1, 1, 1,
-1.443863, -0.1865879, -0.6697525, 1, 1, 1, 1, 1,
-1.431828, 0.1129246, -1.315212, 1, 1, 1, 1, 1,
-1.422392, 0.3056486, -1.89134, 1, 1, 1, 1, 1,
-1.419597, -0.2820303, -3.580083, 1, 1, 1, 1, 1,
-1.41385, 0.1599409, -3.373404, 1, 1, 1, 1, 1,
-1.413216, -0.8042498, -3.241325, 1, 1, 1, 1, 1,
-1.409408, -0.2475036, -2.517746, 1, 1, 1, 1, 1,
-1.405252, -1.164428, -0.4593855, 1, 1, 1, 1, 1,
-1.400936, 0.7713091, -2.553715, 1, 1, 1, 1, 1,
-1.400278, 1.253601, 0.1934862, 1, 1, 1, 1, 1,
-1.397964, -1.933185, -2.467107, 1, 1, 1, 1, 1,
-1.389063, 1.257723, -0.8617349, 0, 0, 1, 1, 1,
-1.378482, 0.7204285, 0.04591622, 1, 0, 0, 1, 1,
-1.376619, -0.9406741, -0.4555141, 1, 0, 0, 1, 1,
-1.375401, 0.4245558, -2.220946, 1, 0, 0, 1, 1,
-1.37348, -0.5522527, -1.125178, 1, 0, 0, 1, 1,
-1.362294, -0.07856654, -1.581972, 1, 0, 0, 1, 1,
-1.343372, -0.7991685, -3.43641, 0, 0, 0, 1, 1,
-1.343043, -0.4239369, -2.713356, 0, 0, 0, 1, 1,
-1.333707, 1.381006, -0.6394771, 0, 0, 0, 1, 1,
-1.327524, -0.2667129, -0.3212376, 0, 0, 0, 1, 1,
-1.3241, 0.09142477, -2.549618, 0, 0, 0, 1, 1,
-1.322536, 2.780833, 0.8708863, 0, 0, 0, 1, 1,
-1.304274, -1.137701, -3.601948, 0, 0, 0, 1, 1,
-1.304155, 0.2867112, -1.117699, 1, 1, 1, 1, 1,
-1.303231, -1.202799, -2.594553, 1, 1, 1, 1, 1,
-1.302592, 2.213708, 1.254903, 1, 1, 1, 1, 1,
-1.301163, 0.227655, -1.664965, 1, 1, 1, 1, 1,
-1.291417, 1.317276, -0.8429899, 1, 1, 1, 1, 1,
-1.288958, -0.02227618, -0.9803144, 1, 1, 1, 1, 1,
-1.281322, -0.3365318, 0.4183089, 1, 1, 1, 1, 1,
-1.277709, 2.40242, -0.6382951, 1, 1, 1, 1, 1,
-1.276681, 2.535806, -1.384315, 1, 1, 1, 1, 1,
-1.268125, -0.3326831, -0.9063923, 1, 1, 1, 1, 1,
-1.268112, 1.042704, -1.443411, 1, 1, 1, 1, 1,
-1.265189, 0.5623407, 0.2853329, 1, 1, 1, 1, 1,
-1.257899, -0.1377871, -3.430947, 1, 1, 1, 1, 1,
-1.254447, 0.4170426, -1.53057, 1, 1, 1, 1, 1,
-1.245042, 0.5046489, -0.4548917, 1, 1, 1, 1, 1,
-1.242608, -0.495832, -1.462494, 0, 0, 1, 1, 1,
-1.239959, 0.1913604, -3.009713, 1, 0, 0, 1, 1,
-1.238024, -0.6145637, -2.953114, 1, 0, 0, 1, 1,
-1.237719, -0.05785071, -2.533051, 1, 0, 0, 1, 1,
-1.226009, -0.5168373, -1.977233, 1, 0, 0, 1, 1,
-1.221728, -0.07827467, -0.8436455, 1, 0, 0, 1, 1,
-1.219759, 0.9945046, -2.053112, 0, 0, 0, 1, 1,
-1.214631, 1.226601, -1.637905, 0, 0, 0, 1, 1,
-1.210513, 0.1533402, -1.759333, 0, 0, 0, 1, 1,
-1.203786, -1.932536, -0.7173633, 0, 0, 0, 1, 1,
-1.203487, 2.012285, -2.240513, 0, 0, 0, 1, 1,
-1.193443, 1.0097, -2.739364, 0, 0, 0, 1, 1,
-1.190747, 0.04825017, -1.072946, 0, 0, 0, 1, 1,
-1.183939, -0.3846571, -1.095163, 1, 1, 1, 1, 1,
-1.181797, 0.04931061, -0.3268549, 1, 1, 1, 1, 1,
-1.180364, -0.1656204, -2.421079, 1, 1, 1, 1, 1,
-1.178723, -0.9054197, -2.500899, 1, 1, 1, 1, 1,
-1.170984, -1.513539, -1.363475, 1, 1, 1, 1, 1,
-1.152887, -1.217685, -0.11921, 1, 1, 1, 1, 1,
-1.148695, 0.609694, -1.43002, 1, 1, 1, 1, 1,
-1.147488, -2.340301, -3.501833, 1, 1, 1, 1, 1,
-1.141975, -0.6333404, -0.6701136, 1, 1, 1, 1, 1,
-1.116971, 0.8390152, -1.355608, 1, 1, 1, 1, 1,
-1.116867, 0.508294, -2.661387, 1, 1, 1, 1, 1,
-1.108744, -0.2050261, -0.5832252, 1, 1, 1, 1, 1,
-1.106406, 1.000978, -1.219795, 1, 1, 1, 1, 1,
-1.100261, -0.5661479, -2.608505, 1, 1, 1, 1, 1,
-1.089192, 0.4399007, -0.05872384, 1, 1, 1, 1, 1,
-1.087187, 1.202763, -0.5078042, 0, 0, 1, 1, 1,
-1.076302, 0.6816766, -0.3988091, 1, 0, 0, 1, 1,
-1.060878, -0.8268527, -0.7757647, 1, 0, 0, 1, 1,
-1.060653, 0.4382389, -2.596055, 1, 0, 0, 1, 1,
-1.059834, -0.9833091, -3.635535, 1, 0, 0, 1, 1,
-1.058409, -0.01763669, -2.155105, 1, 0, 0, 1, 1,
-1.051403, -3.129374, -1.957991, 0, 0, 0, 1, 1,
-1.049515, -0.09618862, -1.760846, 0, 0, 0, 1, 1,
-1.042301, -0.7931115, -0.9231382, 0, 0, 0, 1, 1,
-1.041542, -0.2505996, 0.02195637, 0, 0, 0, 1, 1,
-1.036857, -1.230664, -2.82513, 0, 0, 0, 1, 1,
-1.034996, -0.8332983, -2.427523, 0, 0, 0, 1, 1,
-1.032924, 1.446408, -0.3950782, 0, 0, 0, 1, 1,
-1.031897, -0.2158121, -2.959627, 1, 1, 1, 1, 1,
-1.027072, 0.7953289, -1.075611, 1, 1, 1, 1, 1,
-1.027005, -0.3777459, -1.626062, 1, 1, 1, 1, 1,
-1.023335, 0.4091495, -1.468518, 1, 1, 1, 1, 1,
-1.015817, 1.296734, -0.7301479, 1, 1, 1, 1, 1,
-1.003591, -0.6379396, -2.07302, 1, 1, 1, 1, 1,
-0.9989211, 0.7010918, -1.965201, 1, 1, 1, 1, 1,
-0.9988353, 1.516877, -1.054938, 1, 1, 1, 1, 1,
-0.9918551, -0.9683025, -2.300699, 1, 1, 1, 1, 1,
-0.9848605, 0.3962747, -2.491987, 1, 1, 1, 1, 1,
-0.9840875, -0.8701162, -3.424791, 1, 1, 1, 1, 1,
-0.9817913, -0.7143224, -2.274478, 1, 1, 1, 1, 1,
-0.9773094, -0.5821934, -2.920073, 1, 1, 1, 1, 1,
-0.9714226, 1.076138, -0.3607164, 1, 1, 1, 1, 1,
-0.965826, -0.7536141, -2.300917, 1, 1, 1, 1, 1,
-0.9549125, -0.457812, -2.496254, 0, 0, 1, 1, 1,
-0.9477586, 1.063937, -0.3586559, 1, 0, 0, 1, 1,
-0.9388512, 0.3553434, 0.7067429, 1, 0, 0, 1, 1,
-0.9349487, -0.3696232, -0.6962957, 1, 0, 0, 1, 1,
-0.9341981, 0.121101, -1.060611, 1, 0, 0, 1, 1,
-0.9333815, -0.08997694, -1.646537, 1, 0, 0, 1, 1,
-0.9304153, 0.8743894, -1.595989, 0, 0, 0, 1, 1,
-0.9224348, 2.457803, -0.7876087, 0, 0, 0, 1, 1,
-0.9170777, 0.09259938, 0.1580597, 0, 0, 0, 1, 1,
-0.911868, 1.123598, -2.250774, 0, 0, 0, 1, 1,
-0.9045871, 1.509539, -1.756457, 0, 0, 0, 1, 1,
-0.89732, -1.496351, -1.752648, 0, 0, 0, 1, 1,
-0.8972031, -1.005185, -1.205193, 0, 0, 0, 1, 1,
-0.8926174, 0.243089, -1.3385, 1, 1, 1, 1, 1,
-0.890107, 1.029064, -0.8879474, 1, 1, 1, 1, 1,
-0.887648, -0.1834415, -1.553805, 1, 1, 1, 1, 1,
-0.882036, 0.6439365, -1.275841, 1, 1, 1, 1, 1,
-0.8752948, 0.8430504, -1.732953, 1, 1, 1, 1, 1,
-0.8647956, -0.5310465, -0.6168193, 1, 1, 1, 1, 1,
-0.8633053, 0.7842787, -2.561002, 1, 1, 1, 1, 1,
-0.8598301, -0.221764, -2.266946, 1, 1, 1, 1, 1,
-0.8566387, -0.2931384, -0.432988, 1, 1, 1, 1, 1,
-0.8555538, 0.434464, -1.022129, 1, 1, 1, 1, 1,
-0.84798, 0.5748011, -1.314407, 1, 1, 1, 1, 1,
-0.8459664, -0.3560887, -1.976833, 1, 1, 1, 1, 1,
-0.84458, 0.6332313, 1.005071, 1, 1, 1, 1, 1,
-0.8378569, 0.9386771, -2.559157, 1, 1, 1, 1, 1,
-0.8263124, -0.851051, -1.140002, 1, 1, 1, 1, 1,
-0.822586, 0.7289078, -0.3116842, 0, 0, 1, 1, 1,
-0.81929, 0.7619001, -0.2180795, 1, 0, 0, 1, 1,
-0.8172973, -0.6987828, -1.764131, 1, 0, 0, 1, 1,
-0.8148012, 2.001727, -0.1237543, 1, 0, 0, 1, 1,
-0.8120874, 1.112333, 0.4679625, 1, 0, 0, 1, 1,
-0.8119029, 0.2034247, -1.544661, 1, 0, 0, 1, 1,
-0.8117369, -0.4364336, -1.149046, 0, 0, 0, 1, 1,
-0.8101913, 0.4004891, -0.7973254, 0, 0, 0, 1, 1,
-0.8075046, 0.8356741, -0.9645516, 0, 0, 0, 1, 1,
-0.80734, -2.118932, -3.58935, 0, 0, 0, 1, 1,
-0.8034816, -0.267966, -2.574583, 0, 0, 0, 1, 1,
-0.8011059, 0.4399089, -1.458375, 0, 0, 0, 1, 1,
-0.7996013, 0.2046386, -1.16423, 0, 0, 0, 1, 1,
-0.7950094, 1.558098, 0.3592454, 1, 1, 1, 1, 1,
-0.7936606, 0.6985425, -0.831558, 1, 1, 1, 1, 1,
-0.7794288, -0.1380703, -3.242995, 1, 1, 1, 1, 1,
-0.7740094, -0.04292902, -2.116471, 1, 1, 1, 1, 1,
-0.7723954, -2.011147, -3.311214, 1, 1, 1, 1, 1,
-0.7688915, 0.172539, -1.992999, 1, 1, 1, 1, 1,
-0.768186, 0.9533001, -0.7711278, 1, 1, 1, 1, 1,
-0.7632367, 0.1789046, -1.465671, 1, 1, 1, 1, 1,
-0.7616331, 0.04407944, -2.113188, 1, 1, 1, 1, 1,
-0.7607231, -0.1596382, -1.787495, 1, 1, 1, 1, 1,
-0.758311, -0.447567, -1.571869, 1, 1, 1, 1, 1,
-0.7583092, -0.963994, -2.778612, 1, 1, 1, 1, 1,
-0.7531723, 0.4534865, -1.99529, 1, 1, 1, 1, 1,
-0.7526221, -1.094169, -1.5901, 1, 1, 1, 1, 1,
-0.7507386, -1.36398, -2.006334, 1, 1, 1, 1, 1,
-0.7499167, -0.117162, -1.771549, 0, 0, 1, 1, 1,
-0.7478495, -0.02098272, -2.046579, 1, 0, 0, 1, 1,
-0.7449623, -0.2273562, -1.308101, 1, 0, 0, 1, 1,
-0.7403818, -0.8269479, -2.675006, 1, 0, 0, 1, 1,
-0.7381063, -0.7976179, -1.640424, 1, 0, 0, 1, 1,
-0.7359725, 0.2460648, -0.4108772, 1, 0, 0, 1, 1,
-0.733219, 1.361677, -1.358838, 0, 0, 0, 1, 1,
-0.7311834, -0.3804555, -2.91768, 0, 0, 0, 1, 1,
-0.7265917, 1.698799, -0.004144165, 0, 0, 0, 1, 1,
-0.7265294, 2.190612, 0.09443504, 0, 0, 0, 1, 1,
-0.7245102, -1.059199, -3.083956, 0, 0, 0, 1, 1,
-0.7150056, 0.4729751, -0.9296511, 0, 0, 0, 1, 1,
-0.7110592, -0.8128212, -1.043973, 0, 0, 0, 1, 1,
-0.6998947, 0.03114623, -1.702699, 1, 1, 1, 1, 1,
-0.6965666, -0.7772925, -3.405718, 1, 1, 1, 1, 1,
-0.6926199, -0.502376, -1.890469, 1, 1, 1, 1, 1,
-0.6918039, -1.715006, -3.257054, 1, 1, 1, 1, 1,
-0.6860072, -1.178709, -0.8893737, 1, 1, 1, 1, 1,
-0.6834553, -0.8638592, -2.011305, 1, 1, 1, 1, 1,
-0.6816218, 2.919733, -1.27802, 1, 1, 1, 1, 1,
-0.6729354, 0.8556828, -1.244477, 1, 1, 1, 1, 1,
-0.6717203, 0.3865681, -0.1460156, 1, 1, 1, 1, 1,
-0.6716355, 1.487947, -0.341336, 1, 1, 1, 1, 1,
-0.669452, -0.07868945, -2.010194, 1, 1, 1, 1, 1,
-0.6672459, 1.199792, -0.3756437, 1, 1, 1, 1, 1,
-0.6654592, -1.145809, -3.662163, 1, 1, 1, 1, 1,
-0.6654276, 0.9947054, -1.183665, 1, 1, 1, 1, 1,
-0.6652289, 2.405128, 0.5206651, 1, 1, 1, 1, 1,
-0.6581928, -0.8162212, -2.197801, 0, 0, 1, 1, 1,
-0.6576366, -0.3922318, -2.082193, 1, 0, 0, 1, 1,
-0.6350523, 0.8303959, 0.3734677, 1, 0, 0, 1, 1,
-0.6339018, 0.9281784, 0.5029684, 1, 0, 0, 1, 1,
-0.6316563, -1.185798, -3.429976, 1, 0, 0, 1, 1,
-0.6311976, -0.8034413, -3.363414, 1, 0, 0, 1, 1,
-0.6302407, -0.7816707, -3.161288, 0, 0, 0, 1, 1,
-0.6291189, 0.8875733, -1.740149, 0, 0, 0, 1, 1,
-0.6287785, -1.153949, -2.525246, 0, 0, 0, 1, 1,
-0.6247365, -0.9732426, -2.197447, 0, 0, 0, 1, 1,
-0.6236095, -0.1714986, -2.833046, 0, 0, 0, 1, 1,
-0.6225386, 0.6736156, -2.134928, 0, 0, 0, 1, 1,
-0.617346, 0.4011599, -0.8991477, 0, 0, 0, 1, 1,
-0.6169125, 1.236274, -1.948543, 1, 1, 1, 1, 1,
-0.614739, 0.3723598, -2.588562, 1, 1, 1, 1, 1,
-0.6103624, -0.05083279, -2.775941, 1, 1, 1, 1, 1,
-0.6003301, 0.9681919, -0.6448867, 1, 1, 1, 1, 1,
-0.5999427, -3.24575, -2.190648, 1, 1, 1, 1, 1,
-0.5978253, 0.1089634, -1.946447, 1, 1, 1, 1, 1,
-0.5934576, 0.2370846, -1.551872, 1, 1, 1, 1, 1,
-0.592415, 0.8158454, -2.369496, 1, 1, 1, 1, 1,
-0.5906301, 0.2249634, -0.772498, 1, 1, 1, 1, 1,
-0.5837416, -0.7892814, -3.078576, 1, 1, 1, 1, 1,
-0.5805209, -0.4080392, -1.128735, 1, 1, 1, 1, 1,
-0.579579, 0.5469944, -0.7058209, 1, 1, 1, 1, 1,
-0.5786744, -0.7974257, -3.951771, 1, 1, 1, 1, 1,
-0.5762771, 0.3996278, -0.15986, 1, 1, 1, 1, 1,
-0.5743806, -0.6902181, -3.323872, 1, 1, 1, 1, 1,
-0.5707348, 0.5373722, -0.4495171, 0, 0, 1, 1, 1,
-0.5676089, 2.007921, -1.880638, 1, 0, 0, 1, 1,
-0.5617678, 2.109364, -0.6782002, 1, 0, 0, 1, 1,
-0.5612499, -0.1578887, -1.846924, 1, 0, 0, 1, 1,
-0.5551856, 0.06490746, -0.7915825, 1, 0, 0, 1, 1,
-0.5515904, -0.4718657, -3.083512, 1, 0, 0, 1, 1,
-0.5493067, 0.9712756, -1.192096, 0, 0, 0, 1, 1,
-0.545771, -0.9697307, -2.626332, 0, 0, 0, 1, 1,
-0.5421412, 0.7371923, -0.7941383, 0, 0, 0, 1, 1,
-0.5363224, 0.5480082, -2.207762, 0, 0, 0, 1, 1,
-0.5334441, 1.219961, 0.6172391, 0, 0, 0, 1, 1,
-0.5303459, -0.1602483, -2.838578, 0, 0, 0, 1, 1,
-0.515421, 0.2292327, -1.851383, 0, 0, 0, 1, 1,
-0.5097132, 1.078833, -0.5538448, 1, 1, 1, 1, 1,
-0.5074123, -0.3803941, -1.915331, 1, 1, 1, 1, 1,
-0.5010188, -0.4330405, -0.008198262, 1, 1, 1, 1, 1,
-0.4993786, 0.364082, -1.106897, 1, 1, 1, 1, 1,
-0.4981783, -1.399381, -5.03103, 1, 1, 1, 1, 1,
-0.4883059, 1.59708, 0.273751, 1, 1, 1, 1, 1,
-0.4867993, -0.6729018, -3.263523, 1, 1, 1, 1, 1,
-0.4853868, 0.8112634, -0.3077135, 1, 1, 1, 1, 1,
-0.4853605, 0.3335878, -0.08740015, 1, 1, 1, 1, 1,
-0.4828505, 0.5638719, -0.5909601, 1, 1, 1, 1, 1,
-0.4817241, 0.1802916, -1.69625, 1, 1, 1, 1, 1,
-0.4791151, 1.329694, -1.067815, 1, 1, 1, 1, 1,
-0.4775652, 1.010628, -1.27295, 1, 1, 1, 1, 1,
-0.4751846, 0.2927491, -1.007779, 1, 1, 1, 1, 1,
-0.4746692, 0.7291412, -2.167508, 1, 1, 1, 1, 1,
-0.4721608, 0.238909, -2.478218, 0, 0, 1, 1, 1,
-0.4713041, -1.791523, -2.719625, 1, 0, 0, 1, 1,
-0.4709776, 1.687139, -0.1254516, 1, 0, 0, 1, 1,
-0.4609337, 1.150134, -0.104667, 1, 0, 0, 1, 1,
-0.4588671, 2.357152, 1.564502, 1, 0, 0, 1, 1,
-0.4568774, -0.0361775, -1.588304, 1, 0, 0, 1, 1,
-0.4564465, -1.830751, -3.416375, 0, 0, 0, 1, 1,
-0.4563861, 0.2643909, -0.9099285, 0, 0, 0, 1, 1,
-0.4526749, 1.321992, -1.804973, 0, 0, 0, 1, 1,
-0.4492188, -0.1198223, 0.1323656, 0, 0, 0, 1, 1,
-0.4480725, -0.01886877, -3.116539, 0, 0, 0, 1, 1,
-0.4478966, -0.4594201, -1.753613, 0, 0, 0, 1, 1,
-0.4244198, 0.7139183, -1.378467, 0, 0, 0, 1, 1,
-0.4198132, -1.698375, -3.099478, 1, 1, 1, 1, 1,
-0.4176788, 1.49366, 0.1229447, 1, 1, 1, 1, 1,
-0.4146109, -1.185389, -3.959116, 1, 1, 1, 1, 1,
-0.4124309, -0.11114, -2.558207, 1, 1, 1, 1, 1,
-0.4093515, 0.3491395, -1.864205, 1, 1, 1, 1, 1,
-0.4035441, -0.7097293, -2.726444, 1, 1, 1, 1, 1,
-0.3991211, -0.9080854, -0.8135775, 1, 1, 1, 1, 1,
-0.3988879, 1.470927, -0.7933371, 1, 1, 1, 1, 1,
-0.393957, 0.5863725, -0.6945966, 1, 1, 1, 1, 1,
-0.3931586, 0.3104801, -2.197515, 1, 1, 1, 1, 1,
-0.3927869, -0.5976474, -4.604088, 1, 1, 1, 1, 1,
-0.3926947, -0.2897969, -1.173631, 1, 1, 1, 1, 1,
-0.3923556, 0.6300357, 1.06222, 1, 1, 1, 1, 1,
-0.3917084, 1.759473, 1.520571, 1, 1, 1, 1, 1,
-0.3905995, 0.6586805, -0.9269115, 1, 1, 1, 1, 1,
-0.381054, 2.547648, 1.56847, 0, 0, 1, 1, 1,
-0.3804298, 0.116804, -0.7637672, 1, 0, 0, 1, 1,
-0.3767633, 1.584942, 1.248385, 1, 0, 0, 1, 1,
-0.3764222, 1.636108, 1.304929, 1, 0, 0, 1, 1,
-0.375216, 0.0292624, -0.3784365, 1, 0, 0, 1, 1,
-0.3746328, -0.0008246928, -1.275478, 1, 0, 0, 1, 1,
-0.366154, 0.5578834, -0.1920388, 0, 0, 0, 1, 1,
-0.3660532, 1.23515, 0.1186025, 0, 0, 0, 1, 1,
-0.3625023, -0.8130757, -4.203772, 0, 0, 0, 1, 1,
-0.3555419, 0.3451934, -3.689949, 0, 0, 0, 1, 1,
-0.3525331, 2.985347, -0.1193066, 0, 0, 0, 1, 1,
-0.3493873, -0.07225202, -1.859056, 0, 0, 0, 1, 1,
-0.3484768, 1.181815, 0.3157452, 0, 0, 0, 1, 1,
-0.3480549, -0.1870743, -2.68623, 1, 1, 1, 1, 1,
-0.347692, -1.170586, -6.335989, 1, 1, 1, 1, 1,
-0.3467698, 0.4115248, 0.8840476, 1, 1, 1, 1, 1,
-0.3423773, 0.5840863, 0.2941891, 1, 1, 1, 1, 1,
-0.3421855, -0.8299296, -2.37809, 1, 1, 1, 1, 1,
-0.3421641, 0.7248543, 0.01372639, 1, 1, 1, 1, 1,
-0.3365428, -1.802202, -3.825636, 1, 1, 1, 1, 1,
-0.3352124, 0.4592663, -1.003994, 1, 1, 1, 1, 1,
-0.3351453, -0.7353038, -2.241198, 1, 1, 1, 1, 1,
-0.333953, 1.913033, 0.289361, 1, 1, 1, 1, 1,
-0.3317954, 0.5155271, -0.03735984, 1, 1, 1, 1, 1,
-0.3313351, -1.457103, -2.40495, 1, 1, 1, 1, 1,
-0.3278964, 2.658522, -0.4551495, 1, 1, 1, 1, 1,
-0.3273354, 0.1581974, 0.9196017, 1, 1, 1, 1, 1,
-0.3271024, 2.05085, -0.3693103, 1, 1, 1, 1, 1,
-0.3187779, -0.1620016, -2.187137, 0, 0, 1, 1, 1,
-0.3165677, 0.4016525, -0.5302934, 1, 0, 0, 1, 1,
-0.3141811, -1.134812, -2.797041, 1, 0, 0, 1, 1,
-0.3057815, -0.1581825, -3.44844, 1, 0, 0, 1, 1,
-0.3052732, 1.113759, 0.4428133, 1, 0, 0, 1, 1,
-0.3044567, -1.452342, -3.442528, 1, 0, 0, 1, 1,
-0.3012997, -0.358214, -3.845534, 0, 0, 0, 1, 1,
-0.2999576, -1.579776, -1.978549, 0, 0, 0, 1, 1,
-0.2997192, 0.2672621, -1.029965, 0, 0, 0, 1, 1,
-0.2989097, 0.4812953, -1.439278, 0, 0, 0, 1, 1,
-0.2981977, 1.23906, -0.6283454, 0, 0, 0, 1, 1,
-0.2908083, -0.4522249, -2.777035, 0, 0, 0, 1, 1,
-0.2891399, -1.266822, -2.884143, 0, 0, 0, 1, 1,
-0.2850488, 1.186173, -2.102898, 1, 1, 1, 1, 1,
-0.2809374, 0.4231535, -0.07200848, 1, 1, 1, 1, 1,
-0.2688097, -0.1563928, -1.710107, 1, 1, 1, 1, 1,
-0.2676564, -1.16157, -4.981082, 1, 1, 1, 1, 1,
-0.2636927, 1.24247, 0.4343166, 1, 1, 1, 1, 1,
-0.2613432, 1.219699, -0.6343117, 1, 1, 1, 1, 1,
-0.2587858, 1.625805, 1.207087, 1, 1, 1, 1, 1,
-0.258488, -0.1029434, -2.806749, 1, 1, 1, 1, 1,
-0.2542167, 0.7027852, -2.464231, 1, 1, 1, 1, 1,
-0.2490025, -0.01203954, -1.374562, 1, 1, 1, 1, 1,
-0.248478, -0.8260894, -2.352201, 1, 1, 1, 1, 1,
-0.2470026, 0.7886783, -1.577839, 1, 1, 1, 1, 1,
-0.2444039, 0.1945771, -1.334761, 1, 1, 1, 1, 1,
-0.2430814, 0.06474465, -1.319823, 1, 1, 1, 1, 1,
-0.2419602, -0.7786232, -1.562132, 1, 1, 1, 1, 1,
-0.2401886, -0.6433555, -1.371156, 0, 0, 1, 1, 1,
-0.2360321, 0.7916696, -1.002772, 1, 0, 0, 1, 1,
-0.2308867, 0.1842694, -0.06520609, 1, 0, 0, 1, 1,
-0.2252512, -0.7192346, -3.566491, 1, 0, 0, 1, 1,
-0.2247359, -1.068734, -4.673088, 1, 0, 0, 1, 1,
-0.2239244, 0.585785, 0.7884349, 1, 0, 0, 1, 1,
-0.2215647, -0.7790858, -3.84456, 0, 0, 0, 1, 1,
-0.2215015, -0.6857429, -1.899308, 0, 0, 0, 1, 1,
-0.2212992, 0.02195266, -2.021346, 0, 0, 0, 1, 1,
-0.2175261, 0.5452492, -0.4205893, 0, 0, 0, 1, 1,
-0.2170991, -0.3145497, -2.192743, 0, 0, 0, 1, 1,
-0.214067, -0.4381905, -3.695182, 0, 0, 0, 1, 1,
-0.2109125, 0.1492938, -1.926431, 0, 0, 0, 1, 1,
-0.2087309, 0.2110981, -2.635427, 1, 1, 1, 1, 1,
-0.2050576, 1.03444, -0.5599121, 1, 1, 1, 1, 1,
-0.2048758, -0.4729362, -3.074505, 1, 1, 1, 1, 1,
-0.2034398, -0.1679187, -2.825462, 1, 1, 1, 1, 1,
-0.2029261, 0.5852851, -0.2187994, 1, 1, 1, 1, 1,
-0.1985925, 1.312179, 1.659015, 1, 1, 1, 1, 1,
-0.1965596, -0.1010998, -3.366822, 1, 1, 1, 1, 1,
-0.1959471, 0.1416443, -2.558458, 1, 1, 1, 1, 1,
-0.1957709, 0.07470829, -0.9271157, 1, 1, 1, 1, 1,
-0.1951223, -1.618555, -3.592116, 1, 1, 1, 1, 1,
-0.1946975, 0.2752244, -2.292639, 1, 1, 1, 1, 1,
-0.1940423, -0.7248407, -2.425284, 1, 1, 1, 1, 1,
-0.1938007, 0.1702621, -1.653716, 1, 1, 1, 1, 1,
-0.1922191, 1.438895, -0.08913081, 1, 1, 1, 1, 1,
-0.1909432, -0.3798684, -2.433904, 1, 1, 1, 1, 1,
-0.1890603, -1.96812, -2.145998, 0, 0, 1, 1, 1,
-0.1830535, 0.1744418, -0.3592548, 1, 0, 0, 1, 1,
-0.1800449, -1.918598, -1.987119, 1, 0, 0, 1, 1,
-0.178459, -0.740687, -2.442306, 1, 0, 0, 1, 1,
-0.1751246, 0.4620419, 0.9168078, 1, 0, 0, 1, 1,
-0.1749933, 2.023837, -0.7562232, 1, 0, 0, 1, 1,
-0.1723099, -0.2929642, -3.352426, 0, 0, 0, 1, 1,
-0.1713199, 0.624475, 0.07715803, 0, 0, 0, 1, 1,
-0.1667722, 0.9930558, 0.5567929, 0, 0, 0, 1, 1,
-0.1632533, 0.885332, -0.6463947, 0, 0, 0, 1, 1,
-0.1626117, 1.127752, -0.6187668, 0, 0, 0, 1, 1,
-0.1544102, 0.6169433, 1.426103, 0, 0, 0, 1, 1,
-0.1543328, -1.298834, -2.540184, 0, 0, 0, 1, 1,
-0.1530288, 1.653806, -0.2622923, 1, 1, 1, 1, 1,
-0.1512819, 1.124927, -1.624328, 1, 1, 1, 1, 1,
-0.1490349, 2.378668, -0.4182699, 1, 1, 1, 1, 1,
-0.1485393, 0.2851096, -0.2007295, 1, 1, 1, 1, 1,
-0.1454702, -0.6186323, -2.364612, 1, 1, 1, 1, 1,
-0.1421591, 1.517032, -0.07146125, 1, 1, 1, 1, 1,
-0.1397032, 1.508429, -0.6276765, 1, 1, 1, 1, 1,
-0.1360847, 0.8158475, -0.8722949, 1, 1, 1, 1, 1,
-0.1304892, 0.8884861, -0.7496703, 1, 1, 1, 1, 1,
-0.1298993, 0.5672113, -0.07909577, 1, 1, 1, 1, 1,
-0.1287245, -1.362107, -5.088241, 1, 1, 1, 1, 1,
-0.1286928, 1.656102, 0.8777763, 1, 1, 1, 1, 1,
-0.1207103, 0.7556469, 0.6394889, 1, 1, 1, 1, 1,
-0.1195844, -0.5375055, -2.731061, 1, 1, 1, 1, 1,
-0.11695, 0.282446, -1.769924, 1, 1, 1, 1, 1,
-0.1169001, -2.53945, -3.471678, 0, 0, 1, 1, 1,
-0.109508, -0.3991526, -5.154263, 1, 0, 0, 1, 1,
-0.1083619, -0.9033032, -4.958146, 1, 0, 0, 1, 1,
-0.1082026, 0.2243231, -0.2290375, 1, 0, 0, 1, 1,
-0.1009188, -0.4091049, -2.168608, 1, 0, 0, 1, 1,
-0.1008689, -0.8295321, -2.243721, 1, 0, 0, 1, 1,
-0.09813495, 0.2143646, 0.4468883, 0, 0, 0, 1, 1,
-0.09813341, 0.764502, -0.2874335, 0, 0, 0, 1, 1,
-0.09697828, 1.095299, 0.06537664, 0, 0, 0, 1, 1,
-0.09604602, 0.2605396, -1.347082, 0, 0, 0, 1, 1,
-0.0952967, 0.4190203, 0.1682417, 0, 0, 0, 1, 1,
-0.09433146, 1.850026, -0.8163206, 0, 0, 0, 1, 1,
-0.09047168, 0.7122276, -0.5972664, 0, 0, 0, 1, 1,
-0.08805613, 0.07862508, -0.02291013, 1, 1, 1, 1, 1,
-0.08582953, -1.56606, -3.032862, 1, 1, 1, 1, 1,
-0.08489307, 0.1397576, 1.284368, 1, 1, 1, 1, 1,
-0.08229551, 0.9800308, -2.609407, 1, 1, 1, 1, 1,
-0.07937537, -0.340539, -3.298121, 1, 1, 1, 1, 1,
-0.07758594, -0.1776011, -1.1966, 1, 1, 1, 1, 1,
-0.07494955, 1.739177, 1.357087, 1, 1, 1, 1, 1,
-0.07483446, -0.01381599, -2.436961, 1, 1, 1, 1, 1,
-0.06949263, -1.100247, -3.631492, 1, 1, 1, 1, 1,
-0.06234147, 0.8599443, -0.5659012, 1, 1, 1, 1, 1,
-0.06030426, -1.39557, -3.272125, 1, 1, 1, 1, 1,
-0.05887287, -0.4099879, -1.737846, 1, 1, 1, 1, 1,
-0.05483247, -1.378149, -1.400097, 1, 1, 1, 1, 1,
-0.05213635, 1.426578, 0.7460601, 1, 1, 1, 1, 1,
-0.0427708, 0.3220502, -0.6835743, 1, 1, 1, 1, 1,
-0.04014774, 1.534294, 1.461086, 0, 0, 1, 1, 1,
-0.03803371, 0.2695328, -0.5429788, 1, 0, 0, 1, 1,
-0.0346503, 1.919822, -0.3410725, 1, 0, 0, 1, 1,
-0.0263213, 1.018542, -2.460957, 1, 0, 0, 1, 1,
-0.02473639, 0.638359, 0.711897, 1, 0, 0, 1, 1,
-0.01587642, 1.483366, -0.02105859, 1, 0, 0, 1, 1,
-0.01353247, 1.168557, 0.6062854, 0, 0, 0, 1, 1,
-0.0107067, 0.02568337, 0.6579237, 0, 0, 0, 1, 1,
-0.01039504, 2.225441, -0.8147727, 0, 0, 0, 1, 1,
-0.007724672, 2.666789, -0.7310132, 0, 0, 0, 1, 1,
-0.006822613, -1.054043, -1.44612, 0, 0, 0, 1, 1,
-0.002929845, -1.027522, -2.615754, 0, 0, 0, 1, 1,
-0.001021162, 1.908399, -0.7402645, 0, 0, 0, 1, 1,
0.001465181, 0.4225506, 0.8359319, 1, 1, 1, 1, 1,
0.00869448, -0.0009434276, 1.291297, 1, 1, 1, 1, 1,
0.009360996, 0.07339519, 1.322593, 1, 1, 1, 1, 1,
0.00951047, 1.582819, -0.2997929, 1, 1, 1, 1, 1,
0.01220127, 1.269557, 0.1610459, 1, 1, 1, 1, 1,
0.01286464, 0.2261181, -0.7903731, 1, 1, 1, 1, 1,
0.014651, 0.9502465, -0.1516471, 1, 1, 1, 1, 1,
0.01599461, 0.7284182, 0.6532227, 1, 1, 1, 1, 1,
0.01740489, 1.070017, 1.607135, 1, 1, 1, 1, 1,
0.0181115, -1.190566, 4.352462, 1, 1, 1, 1, 1,
0.02098868, 0.3911197, 1.129896, 1, 1, 1, 1, 1,
0.02121183, 0.1968667, -1.238734, 1, 1, 1, 1, 1,
0.02162977, 2.154675, -2.498245, 1, 1, 1, 1, 1,
0.02429769, -0.678609, 3.160031, 1, 1, 1, 1, 1,
0.02666461, -0.3587317, 3.190111, 1, 1, 1, 1, 1,
0.02792704, 1.304161, 0.6167996, 0, 0, 1, 1, 1,
0.02869353, -0.4261407, 2.193665, 1, 0, 0, 1, 1,
0.03138197, 0.2487804, 0.6288654, 1, 0, 0, 1, 1,
0.03527784, -0.3265635, 2.661975, 1, 0, 0, 1, 1,
0.03527857, 0.8660921, 1.631336, 1, 0, 0, 1, 1,
0.04041307, -1.018401, 2.745931, 1, 0, 0, 1, 1,
0.04359045, 1.13367, -1.539684, 0, 0, 0, 1, 1,
0.05281555, 1.713677, -0.6821723, 0, 0, 0, 1, 1,
0.05292115, 0.2017124, 0.2945442, 0, 0, 0, 1, 1,
0.0532708, 1.575918, -0.3058535, 0, 0, 0, 1, 1,
0.05774715, 0.7605609, 0.5160807, 0, 0, 0, 1, 1,
0.06002176, 0.194744, 0.9602882, 0, 0, 0, 1, 1,
0.0630294, 0.5789758, 0.3419805, 0, 0, 0, 1, 1,
0.06785407, -0.5187503, 3.258662, 1, 1, 1, 1, 1,
0.07210911, 0.3536219, 1.276758, 1, 1, 1, 1, 1,
0.07567225, -0.1252244, 4.480383, 1, 1, 1, 1, 1,
0.07587966, -1.426412, 4.449632, 1, 1, 1, 1, 1,
0.07698952, -0.6183978, 2.852576, 1, 1, 1, 1, 1,
0.08221861, -1.19925, 2.697273, 1, 1, 1, 1, 1,
0.0859848, -0.2500845, 1.296388, 1, 1, 1, 1, 1,
0.08802437, -0.07782049, 1.831224, 1, 1, 1, 1, 1,
0.08936178, 0.5987196, -0.960952, 1, 1, 1, 1, 1,
0.09043358, -0.2175921, 1.229737, 1, 1, 1, 1, 1,
0.09234837, 0.3611043, 0.5419837, 1, 1, 1, 1, 1,
0.09418677, 0.319102, -0.1465185, 1, 1, 1, 1, 1,
0.0981892, 0.2579722, 2.715489, 1, 1, 1, 1, 1,
0.09832917, 1.269331, -0.3325761, 1, 1, 1, 1, 1,
0.1008968, 1.238957, 1.086178, 1, 1, 1, 1, 1,
0.1025839, 0.2453693, -0.1002687, 0, 0, 1, 1, 1,
0.1059095, -0.6948065, 2.036123, 1, 0, 0, 1, 1,
0.1061839, 1.538285, 0.7369666, 1, 0, 0, 1, 1,
0.1093622, 0.08782756, 1.089306, 1, 0, 0, 1, 1,
0.1102966, 1.275649, 1.056911, 1, 0, 0, 1, 1,
0.1150695, -0.7111452, 3.870794, 1, 0, 0, 1, 1,
0.1187313, -0.8141939, 2.771279, 0, 0, 0, 1, 1,
0.1286166, 2.178933, -0.6832128, 0, 0, 0, 1, 1,
0.129511, -1.313441, 4.013668, 0, 0, 0, 1, 1,
0.1308054, -0.9689445, 3.285736, 0, 0, 0, 1, 1,
0.1341858, 0.1312839, -1.476763, 0, 0, 0, 1, 1,
0.1362686, -0.1030759, 2.170543, 0, 0, 0, 1, 1,
0.1368993, 0.4050053, 0.8598186, 0, 0, 0, 1, 1,
0.1385004, 0.2110806, 2.055482, 1, 1, 1, 1, 1,
0.1448113, 0.325868, 0.1216136, 1, 1, 1, 1, 1,
0.1455966, 1.440462, -0.0222113, 1, 1, 1, 1, 1,
0.1561782, -0.4924295, 2.456861, 1, 1, 1, 1, 1,
0.1578141, -0.007074935, 3.441385, 1, 1, 1, 1, 1,
0.1582715, 0.5968312, 0.5614119, 1, 1, 1, 1, 1,
0.1626674, -0.4037807, 5.326008, 1, 1, 1, 1, 1,
0.1631912, -0.1334671, 1.971174, 1, 1, 1, 1, 1,
0.1678439, -0.8843763, 1.773897, 1, 1, 1, 1, 1,
0.1960314, 0.3096653, 1.559803, 1, 1, 1, 1, 1,
0.1969862, 0.3394438, 1.025406, 1, 1, 1, 1, 1,
0.2041709, 0.9134208, 0.7967215, 1, 1, 1, 1, 1,
0.2057751, -0.07133661, 3.420246, 1, 1, 1, 1, 1,
0.2069691, 1.012318, 0.6092415, 1, 1, 1, 1, 1,
0.210172, -0.9444281, 2.635857, 1, 1, 1, 1, 1,
0.2124238, 0.4650669, 1.954883, 0, 0, 1, 1, 1,
0.2143248, -2.014596, 3.506264, 1, 0, 0, 1, 1,
0.2147681, -0.2852172, 2.085431, 1, 0, 0, 1, 1,
0.2147922, 0.6710544, -0.07648063, 1, 0, 0, 1, 1,
0.2193573, 0.4741796, -0.1196445, 1, 0, 0, 1, 1,
0.2226958, 0.1926192, -0.8793026, 1, 0, 0, 1, 1,
0.2264913, 0.3599439, 0.7558987, 0, 0, 0, 1, 1,
0.2289145, 0.30668, 0.4805006, 0, 0, 0, 1, 1,
0.2358595, -0.09719968, 2.219482, 0, 0, 0, 1, 1,
0.2395204, 0.1588835, 0.05371789, 0, 0, 0, 1, 1,
0.2403966, 1.776741, 1.03372, 0, 0, 0, 1, 1,
0.2441138, -0.6459391, 3.325465, 0, 0, 0, 1, 1,
0.2474789, 1.15996, -0.9208452, 0, 0, 0, 1, 1,
0.2490556, -1.516789, 3.041742, 1, 1, 1, 1, 1,
0.2491109, 0.00247439, 4.821173, 1, 1, 1, 1, 1,
0.2542633, 0.1936484, 3.045082, 1, 1, 1, 1, 1,
0.2548563, 0.5193041, 1.644472, 1, 1, 1, 1, 1,
0.2557651, 1.653391, 0.355056, 1, 1, 1, 1, 1,
0.2596695, -0.3368901, 1.848145, 1, 1, 1, 1, 1,
0.2602135, -0.04442376, 2.664835, 1, 1, 1, 1, 1,
0.2604162, 2.380216, -0.07354494, 1, 1, 1, 1, 1,
0.2617388, 0.006327477, 1.638517, 1, 1, 1, 1, 1,
0.262332, -0.1545053, 2.903321, 1, 1, 1, 1, 1,
0.2636944, 2.373092, -1.388956, 1, 1, 1, 1, 1,
0.2665031, 0.1860256, 0.9798935, 1, 1, 1, 1, 1,
0.2683496, 1.59209, 1.703497, 1, 1, 1, 1, 1,
0.2697318, -0.3797035, 1.5552, 1, 1, 1, 1, 1,
0.2706181, 0.4080985, 0.2507101, 1, 1, 1, 1, 1,
0.2716969, 1.417322, -1.749686, 0, 0, 1, 1, 1,
0.2717066, 1.823108, 0.3445214, 1, 0, 0, 1, 1,
0.2749552, -0.1165505, 2.458641, 1, 0, 0, 1, 1,
0.2780021, 0.2243681, 1.901075, 1, 0, 0, 1, 1,
0.2790741, 1.862589, -1.485743, 1, 0, 0, 1, 1,
0.2809082, 0.03410932, 1.60623, 1, 0, 0, 1, 1,
0.2895855, 0.4540307, 1.667248, 0, 0, 0, 1, 1,
0.2903011, -0.07125366, 2.1052, 0, 0, 0, 1, 1,
0.2961672, -1.88467, 1.869986, 0, 0, 0, 1, 1,
0.2992449, -1.383998, 2.212643, 0, 0, 0, 1, 1,
0.2994654, 0.3497368, 0.8012989, 0, 0, 0, 1, 1,
0.3047164, -0.7716612, 2.645933, 0, 0, 0, 1, 1,
0.304763, 0.05964099, 2.184348, 0, 0, 0, 1, 1,
0.3059697, 0.3863668, -0.3916284, 1, 1, 1, 1, 1,
0.3127086, 0.2841149, 1.958721, 1, 1, 1, 1, 1,
0.3132229, 1.110502, -0.4940017, 1, 1, 1, 1, 1,
0.315253, -0.3442268, 0.5222498, 1, 1, 1, 1, 1,
0.3153845, 2.444555, -1.201552, 1, 1, 1, 1, 1,
0.3165522, 0.6320028, 1.2013, 1, 1, 1, 1, 1,
0.3209207, 0.7119152, -0.02294922, 1, 1, 1, 1, 1,
0.3221152, 1.052392, 2.053157, 1, 1, 1, 1, 1,
0.3280557, 1.020958, -0.7314483, 1, 1, 1, 1, 1,
0.3285518, 1.334393, 0.5311433, 1, 1, 1, 1, 1,
0.3286112, 1.638576, 1.554813, 1, 1, 1, 1, 1,
0.3344108, -0.6774457, 2.411376, 1, 1, 1, 1, 1,
0.3353279, -0.3390318, 3.345819, 1, 1, 1, 1, 1,
0.3406474, -0.4154228, 3.644079, 1, 1, 1, 1, 1,
0.3409965, -1.022844, 2.311803, 1, 1, 1, 1, 1,
0.3489577, 0.9507536, 0.1786916, 0, 0, 1, 1, 1,
0.3577484, -1.174031, 1.961613, 1, 0, 0, 1, 1,
0.3577918, -0.3263879, 3.112006, 1, 0, 0, 1, 1,
0.3609604, -0.3350143, 1.25637, 1, 0, 0, 1, 1,
0.3610075, 0.2786445, 0.2137269, 1, 0, 0, 1, 1,
0.3636155, 1.508488, 0.7155921, 1, 0, 0, 1, 1,
0.3639581, -1.266849, 2.083487, 0, 0, 0, 1, 1,
0.3686529, 0.0246843, 1.390002, 0, 0, 0, 1, 1,
0.3714049, 0.1865091, 0.931096, 0, 0, 0, 1, 1,
0.3723999, -1.411848, 3.641515, 0, 0, 0, 1, 1,
0.3768106, 0.1483375, -0.9460889, 0, 0, 0, 1, 1,
0.3832002, -0.5496042, 2.574808, 0, 0, 0, 1, 1,
0.3862766, 0.5944926, -0.9409425, 0, 0, 0, 1, 1,
0.389125, -0.5046396, 3.649744, 1, 1, 1, 1, 1,
0.3932231, 0.4045091, 2.085948, 1, 1, 1, 1, 1,
0.3973658, 0.8171933, 0.5335305, 1, 1, 1, 1, 1,
0.3974417, -1.262982, 4.337679, 1, 1, 1, 1, 1,
0.3981929, -0.32139, 2.732792, 1, 1, 1, 1, 1,
0.3991023, 0.8598595, -1.075216, 1, 1, 1, 1, 1,
0.4021382, -0.8335575, 3.844055, 1, 1, 1, 1, 1,
0.4034241, 1.523915, -0.405136, 1, 1, 1, 1, 1,
0.4048155, 0.7661815, -0.2747017, 1, 1, 1, 1, 1,
0.4101302, -0.0283604, 1.560993, 1, 1, 1, 1, 1,
0.410231, -1.220951, 4.459815, 1, 1, 1, 1, 1,
0.4145062, -0.7497064, 3.816953, 1, 1, 1, 1, 1,
0.4155639, -1.730617, 3.774995, 1, 1, 1, 1, 1,
0.4185831, 1.06407, -1.396755, 1, 1, 1, 1, 1,
0.4248905, -1.699587, 3.637708, 1, 1, 1, 1, 1,
0.4281483, -0.3437969, 2.80423, 0, 0, 1, 1, 1,
0.429697, 0.22604, 3.096976, 1, 0, 0, 1, 1,
0.4325102, 0.4513384, -0.01578965, 1, 0, 0, 1, 1,
0.4355734, 1.002059, 1.136109, 1, 0, 0, 1, 1,
0.4360326, -1.946355, 1.145462, 1, 0, 0, 1, 1,
0.4391295, 0.8750451, 1.606431, 1, 0, 0, 1, 1,
0.4431349, -0.1565932, 0.2057346, 0, 0, 0, 1, 1,
0.4454017, 0.9825177, -1.219602, 0, 0, 0, 1, 1,
0.4509584, 1.17779, 1.308069, 0, 0, 0, 1, 1,
0.4545025, 2.34976, 0.1087952, 0, 0, 0, 1, 1,
0.461672, 1.126213, -1.100002, 0, 0, 0, 1, 1,
0.4623601, -0.5908875, 2.221296, 0, 0, 0, 1, 1,
0.4642093, 1.701895, 0.2514182, 0, 0, 0, 1, 1,
0.4655299, -0.9814638, 2.877227, 1, 1, 1, 1, 1,
0.4697647, 1.715875, 0.3741573, 1, 1, 1, 1, 1,
0.4733417, 0.4464699, 1.394086, 1, 1, 1, 1, 1,
0.4736122, -0.5780243, 3.35184, 1, 1, 1, 1, 1,
0.4746976, 0.2481819, 0.0001247199, 1, 1, 1, 1, 1,
0.4747838, 2.205263, -0.9226956, 1, 1, 1, 1, 1,
0.4749289, 0.5109538, -0.6223341, 1, 1, 1, 1, 1,
0.4794257, -0.5176854, 3.613114, 1, 1, 1, 1, 1,
0.480815, 0.6943367, 0.09029279, 1, 1, 1, 1, 1,
0.4811686, 0.4149097, 1.434953, 1, 1, 1, 1, 1,
0.4870136, -0.429624, 1.929043, 1, 1, 1, 1, 1,
0.4872847, -1.229091, 2.96942, 1, 1, 1, 1, 1,
0.4882932, 0.3122664, 1.467759, 1, 1, 1, 1, 1,
0.4925942, 0.6687772, -0.3682273, 1, 1, 1, 1, 1,
0.4930032, 0.09278534, -0.4608449, 1, 1, 1, 1, 1,
0.5026465, 1.266035, -0.3821225, 0, 0, 1, 1, 1,
0.505797, -0.7247936, 2.449614, 1, 0, 0, 1, 1,
0.5077517, -0.8731571, 1.932406, 1, 0, 0, 1, 1,
0.5082065, 0.1178529, 0.5506026, 1, 0, 0, 1, 1,
0.5150561, -1.42255, 1.994238, 1, 0, 0, 1, 1,
0.5159063, 1.024504, 0.1792438, 1, 0, 0, 1, 1,
0.5194236, -0.7200182, 2.569643, 0, 0, 0, 1, 1,
0.5217399, 0.7785705, 0.1895064, 0, 0, 0, 1, 1,
0.5243528, -2.465112, 2.317183, 0, 0, 0, 1, 1,
0.5283782, 0.6741152, -1.199736, 0, 0, 0, 1, 1,
0.5294896, -0.3588126, 1.040749, 0, 0, 0, 1, 1,
0.5312631, -0.3308131, 0.3574924, 0, 0, 0, 1, 1,
0.5324717, -0.4930993, 2.506935, 0, 0, 0, 1, 1,
0.5350931, 1.027553, -0.3255365, 1, 1, 1, 1, 1,
0.5357901, -0.2055905, 2.775659, 1, 1, 1, 1, 1,
0.538507, -0.5972058, 1.139569, 1, 1, 1, 1, 1,
0.5395858, 0.811636, 0.3803391, 1, 1, 1, 1, 1,
0.5398947, -0.524173, 2.926398, 1, 1, 1, 1, 1,
0.5406064, -0.8428187, 1.747865, 1, 1, 1, 1, 1,
0.543678, -0.8470455, 1.354461, 1, 1, 1, 1, 1,
0.5445491, 1.849169, 1.791896, 1, 1, 1, 1, 1,
0.5475001, 0.07277685, 0.1347741, 1, 1, 1, 1, 1,
0.550576, 0.4275008, -0.5028521, 1, 1, 1, 1, 1,
0.5519792, -0.982269, 2.783997, 1, 1, 1, 1, 1,
0.5526299, -0.3787581, 1.552564, 1, 1, 1, 1, 1,
0.5565112, 0.295453, 0.7275353, 1, 1, 1, 1, 1,
0.5579808, -0.7916662, 3.1285, 1, 1, 1, 1, 1,
0.5613428, -2.043411, 4.715161, 1, 1, 1, 1, 1,
0.5634486, 0.08406829, 1.066417, 0, 0, 1, 1, 1,
0.564937, 0.2842446, 1.565618, 1, 0, 0, 1, 1,
0.5702057, -0.7773623, 3.553465, 1, 0, 0, 1, 1,
0.5705242, -0.3070246, 2.719698, 1, 0, 0, 1, 1,
0.5715879, -0.2911192, -0.2804341, 1, 0, 0, 1, 1,
0.5723802, -0.7033387, 3.116068, 1, 0, 0, 1, 1,
0.5742781, 0.5370448, 1.754466, 0, 0, 0, 1, 1,
0.5756236, 0.1686858, 1.156319, 0, 0, 0, 1, 1,
0.5793165, -0.851218, 2.409159, 0, 0, 0, 1, 1,
0.5813702, 0.9282654, 1.232457, 0, 0, 0, 1, 1,
0.5822833, 1.123716, 0.7101177, 0, 0, 0, 1, 1,
0.5851129, 0.2642274, 0.7119095, 0, 0, 0, 1, 1,
0.5851605, -0.1309127, 1.813268, 0, 0, 0, 1, 1,
0.5861538, 1.424207, 0.7137907, 1, 1, 1, 1, 1,
0.5925226, -0.4813585, 2.398658, 1, 1, 1, 1, 1,
0.5926777, -2.072771, 3.188829, 1, 1, 1, 1, 1,
0.5929209, -0.5524243, 1.737567, 1, 1, 1, 1, 1,
0.5964053, 1.617994, -1.784492, 1, 1, 1, 1, 1,
0.6033493, 1.223197, 1.770627, 1, 1, 1, 1, 1,
0.6033939, -1.138143, 1.688316, 1, 1, 1, 1, 1,
0.6044344, -0.2896566, 0.3369024, 1, 1, 1, 1, 1,
0.6046901, -1.041003, 3.588483, 1, 1, 1, 1, 1,
0.6056859, -0.3567792, 2.38804, 1, 1, 1, 1, 1,
0.6091124, 0.5648182, 0.3159651, 1, 1, 1, 1, 1,
0.6196681, 0.8924298, 0.01041864, 1, 1, 1, 1, 1,
0.6216387, 1.897821, 2.723001, 1, 1, 1, 1, 1,
0.6216825, -0.003316282, 1.430304, 1, 1, 1, 1, 1,
0.6297603, -0.4219159, 3.370529, 1, 1, 1, 1, 1,
0.6333701, 0.397103, 1.375828, 0, 0, 1, 1, 1,
0.636062, -0.5839031, 0.6420345, 1, 0, 0, 1, 1,
0.6401088, -1.286129, 4.935397, 1, 0, 0, 1, 1,
0.6407547, -0.6816164, 2.484915, 1, 0, 0, 1, 1,
0.6428614, -1.853895, 3.754148, 1, 0, 0, 1, 1,
0.6465083, -2.041698, 2.446863, 1, 0, 0, 1, 1,
0.6477517, 1.224054, 0.5165114, 0, 0, 0, 1, 1,
0.6493201, -0.548641, 3.298046, 0, 0, 0, 1, 1,
0.6503305, -0.8805493, 1.463799, 0, 0, 0, 1, 1,
0.6507921, -0.5156521, 1.082189, 0, 0, 0, 1, 1,
0.6518059, -1.782942, 2.12766, 0, 0, 0, 1, 1,
0.6534444, -2.255482, 3.116131, 0, 0, 0, 1, 1,
0.6558745, 0.8785206, 0.8796268, 0, 0, 0, 1, 1,
0.6561732, 3.23212, 0.9226112, 1, 1, 1, 1, 1,
0.6578318, 0.9656919, -0.549719, 1, 1, 1, 1, 1,
0.6614087, 2.180098, 1.034934, 1, 1, 1, 1, 1,
0.6615779, -0.5806749, 1.907724, 1, 1, 1, 1, 1,
0.6669054, 0.5669369, 2.576106, 1, 1, 1, 1, 1,
0.6786905, -0.6164114, 1.882508, 1, 1, 1, 1, 1,
0.6818581, 0.02868946, 1.644894, 1, 1, 1, 1, 1,
0.6830911, 0.04900566, 0.3096806, 1, 1, 1, 1, 1,
0.6917725, 0.2334694, 2.23656, 1, 1, 1, 1, 1,
0.6940714, 0.2071626, 3.435327, 1, 1, 1, 1, 1,
0.6958863, 0.6260794, 1.720235, 1, 1, 1, 1, 1,
0.6965418, 0.52157, 0.2506447, 1, 1, 1, 1, 1,
0.6988201, 1.359816, 1.452433, 1, 1, 1, 1, 1,
0.6989423, -0.9665439, 3.587803, 1, 1, 1, 1, 1,
0.700976, -0.5292128, 1.116386, 1, 1, 1, 1, 1,
0.7029352, 1.373613, 0.7510189, 0, 0, 1, 1, 1,
0.7033119, 1.541019, 1.872457, 1, 0, 0, 1, 1,
0.7096128, -1.765012, 3.540729, 1, 0, 0, 1, 1,
0.7157187, 1.712337, 1.769448, 1, 0, 0, 1, 1,
0.7168174, 0.6078626, 0.3854772, 1, 0, 0, 1, 1,
0.7177603, 0.1752639, 1.205462, 1, 0, 0, 1, 1,
0.730278, 0.05620246, 1.827124, 0, 0, 0, 1, 1,
0.7307302, -1.37068, 3.04905, 0, 0, 0, 1, 1,
0.7341144, -0.1391585, 0.2756996, 0, 0, 0, 1, 1,
0.7341467, 1.081641, -0.4194902, 0, 0, 0, 1, 1,
0.7349523, 0.8733394, 1.930621, 0, 0, 0, 1, 1,
0.7384509, -0.3966794, 0.8686558, 0, 0, 0, 1, 1,
0.7395921, -1.497328, 2.500644, 0, 0, 0, 1, 1,
0.74051, 1.267494, 0.05592709, 1, 1, 1, 1, 1,
0.7475193, -0.7601067, 3.205807, 1, 1, 1, 1, 1,
0.749539, -0.6508837, 1.205674, 1, 1, 1, 1, 1,
0.7559005, -1.107261, 2.187418, 1, 1, 1, 1, 1,
0.7577873, 0.8699119, 1.286264, 1, 1, 1, 1, 1,
0.7582992, -1.082822, 1.446701, 1, 1, 1, 1, 1,
0.7638199, -0.8372645, 2.359021, 1, 1, 1, 1, 1,
0.7662154, -1.559509, 1.902435, 1, 1, 1, 1, 1,
0.7663829, -0.2854201, 1.837871, 1, 1, 1, 1, 1,
0.7694135, -1.350831, 4.989903, 1, 1, 1, 1, 1,
0.7776911, 0.684692, 0.1786164, 1, 1, 1, 1, 1,
0.7824597, 0.2429315, 1.975055, 1, 1, 1, 1, 1,
0.785567, -2.009515, 3.19955, 1, 1, 1, 1, 1,
0.7864211, 0.1909313, 3.56374, 1, 1, 1, 1, 1,
0.7900189, -0.1595788, 1.154635, 1, 1, 1, 1, 1,
0.7903512, -0.02409199, 0.3016033, 0, 0, 1, 1, 1,
0.7917357, 0.500291, -0.2668355, 1, 0, 0, 1, 1,
0.7951252, -0.5891008, 3.725758, 1, 0, 0, 1, 1,
0.800885, -0.557543, 1.841964, 1, 0, 0, 1, 1,
0.8040842, -0.9489336, 3.017524, 1, 0, 0, 1, 1,
0.8062731, 0.03697732, 2.608797, 1, 0, 0, 1, 1,
0.8151155, -0.6220232, 0.8730205, 0, 0, 0, 1, 1,
0.8161083, 0.3300215, -0.2319684, 0, 0, 0, 1, 1,
0.8172188, -1.270413, 2.169785, 0, 0, 0, 1, 1,
0.8188575, 0.2085626, 2.881561, 0, 0, 0, 1, 1,
0.8239619, 0.9783915, -0.2591714, 0, 0, 0, 1, 1,
0.8270709, 0.3705921, 0.4719568, 0, 0, 0, 1, 1,
0.8286311, -0.5414411, 1.676948, 0, 0, 0, 1, 1,
0.8345928, 0.9657856, 0.03440424, 1, 1, 1, 1, 1,
0.8353797, -0.4906125, 2.721426, 1, 1, 1, 1, 1,
0.840852, -0.248541, 3.698561, 1, 1, 1, 1, 1,
0.8481995, -0.09157087, 2.457442, 1, 1, 1, 1, 1,
0.8490485, 0.2668011, 2.044219, 1, 1, 1, 1, 1,
0.8536946, 1.703018, 1.398222, 1, 1, 1, 1, 1,
0.854231, 0.356301, 2.35497, 1, 1, 1, 1, 1,
0.8557061, 0.1054226, 2.885187, 1, 1, 1, 1, 1,
0.8573788, 1.454568, 0.004274948, 1, 1, 1, 1, 1,
0.862362, -1.862496, 2.179756, 1, 1, 1, 1, 1,
0.8676084, 1.550846, 1.309487, 1, 1, 1, 1, 1,
0.8734032, 1.112493, 0.2992394, 1, 1, 1, 1, 1,
0.8734941, -0.7889237, 1.269499, 1, 1, 1, 1, 1,
0.875119, 2.093712, 0.5803853, 1, 1, 1, 1, 1,
0.885271, -1.002927, 1.326368, 1, 1, 1, 1, 1,
0.8918427, 1.672541, 1.633102, 0, 0, 1, 1, 1,
0.8955998, -0.638904, 2.703317, 1, 0, 0, 1, 1,
0.9053676, 1.461348, 0.643181, 1, 0, 0, 1, 1,
0.9057623, 0.8350216, 1.229106, 1, 0, 0, 1, 1,
0.9115441, -1.224193, 2.615284, 1, 0, 0, 1, 1,
0.9138686, 0.5972086, 1.691511, 1, 0, 0, 1, 1,
0.9179437, 0.4246706, 1.030815, 0, 0, 0, 1, 1,
0.9200222, -0.3806862, 3.651819, 0, 0, 0, 1, 1,
0.9225715, 0.8310878, 1.374176, 0, 0, 0, 1, 1,
0.926461, 0.3910038, 2.775354, 0, 0, 0, 1, 1,
0.9379823, 0.8940291, -1.080186, 0, 0, 0, 1, 1,
0.9398684, -0.7129645, 1.148632, 0, 0, 0, 1, 1,
0.9455358, -0.01736531, 0.4017275, 0, 0, 0, 1, 1,
0.9516243, -0.4707494, 2.546271, 1, 1, 1, 1, 1,
0.9545142, 0.1804242, 2.230736, 1, 1, 1, 1, 1,
0.964058, 0.3717739, 1.933971, 1, 1, 1, 1, 1,
0.9677012, 0.3311496, 1.66894, 1, 1, 1, 1, 1,
0.9706328, -1.517495, 2.495203, 1, 1, 1, 1, 1,
0.9717334, 0.7673982, 0.7200957, 1, 1, 1, 1, 1,
0.9747562, -1.909367, 1.28436, 1, 1, 1, 1, 1,
0.9760246, -1.490091, 2.101059, 1, 1, 1, 1, 1,
0.9940726, -0.2787562, 1.369961, 1, 1, 1, 1, 1,
0.9941258, 0.2291196, -0.2088968, 1, 1, 1, 1, 1,
0.99991, 0.8235809, -1.22194, 1, 1, 1, 1, 1,
1.000421, 0.932764, 2.185121, 1, 1, 1, 1, 1,
1.004085, 1.22802, -0.792111, 1, 1, 1, 1, 1,
1.005398, -0.7047464, 2.133352, 1, 1, 1, 1, 1,
1.007786, 0.9029931, 1.133847, 1, 1, 1, 1, 1,
1.0101, -0.7468497, 2.48763, 0, 0, 1, 1, 1,
1.020798, -1.079972, 1.582238, 1, 0, 0, 1, 1,
1.026068, -2.058208, 1.526365, 1, 0, 0, 1, 1,
1.031662, 0.00554953, 0.2390254, 1, 0, 0, 1, 1,
1.03181, 1.147184, 1.350853, 1, 0, 0, 1, 1,
1.034209, 1.164675, 1.638356, 1, 0, 0, 1, 1,
1.039406, -0.7885754, 2.474647, 0, 0, 0, 1, 1,
1.044779, -0.6644762, 3.338178, 0, 0, 0, 1, 1,
1.046102, -0.3789266, 1.324688, 0, 0, 0, 1, 1,
1.049632, 0.4217604, 2.346892, 0, 0, 0, 1, 1,
1.049747, 0.6252978, 0.5837438, 0, 0, 0, 1, 1,
1.053845, -0.09893318, 1.453884, 0, 0, 0, 1, 1,
1.054776, -1.545492, 2.296607, 0, 0, 0, 1, 1,
1.059483, -0.326287, 1.636752, 1, 1, 1, 1, 1,
1.072054, -2.071406, 0.8173504, 1, 1, 1, 1, 1,
1.079623, 0.4345704, 1.028838, 1, 1, 1, 1, 1,
1.082214, 0.5560436, 0.6328225, 1, 1, 1, 1, 1,
1.086446, 1.916303, -0.6584761, 1, 1, 1, 1, 1,
1.091103, 0.3043446, 1.605881, 1, 1, 1, 1, 1,
1.091789, -0.619407, 1.646467, 1, 1, 1, 1, 1,
1.093979, -1.433758, 2.756561, 1, 1, 1, 1, 1,
1.094285, 1.269871, 1.315807, 1, 1, 1, 1, 1,
1.094918, -2.049478, 3.117005, 1, 1, 1, 1, 1,
1.10187, -0.8733152, 5.142568, 1, 1, 1, 1, 1,
1.106557, 0.6705472, 1.360004, 1, 1, 1, 1, 1,
1.10831, -1.129944, 1.255419, 1, 1, 1, 1, 1,
1.11721, -0.1024109, 2.200991, 1, 1, 1, 1, 1,
1.135057, 0.08969631, 2.326844, 1, 1, 1, 1, 1,
1.140376, 1.887493, 0.7088119, 0, 0, 1, 1, 1,
1.142622, -0.5233548, 1.789663, 1, 0, 0, 1, 1,
1.145814, -1.558927, 0.8545747, 1, 0, 0, 1, 1,
1.151036, 0.3179596, 0.8695935, 1, 0, 0, 1, 1,
1.151858, 0.09246249, 2.340636, 1, 0, 0, 1, 1,
1.160401, 1.103851, 1.25195, 1, 0, 0, 1, 1,
1.163785, -1.480834, 3.245301, 0, 0, 0, 1, 1,
1.172396, 0.6920639, 0.3593959, 0, 0, 0, 1, 1,
1.190381, 2.254128, 0.0418008, 0, 0, 0, 1, 1,
1.192517, 0.2031225, 3.108202, 0, 0, 0, 1, 1,
1.193714, 0.161508, 3.743332, 0, 0, 0, 1, 1,
1.196178, -1.09289, 2.864921, 0, 0, 0, 1, 1,
1.197912, -1.159687, 2.270116, 0, 0, 0, 1, 1,
1.198791, -0.8072813, 2.04824, 1, 1, 1, 1, 1,
1.198977, -0.09963706, 1.073385, 1, 1, 1, 1, 1,
1.202308, -0.5564553, 3.434215, 1, 1, 1, 1, 1,
1.203012, 0.2707053, 2.71932, 1, 1, 1, 1, 1,
1.203833, 0.07521652, 2.854937, 1, 1, 1, 1, 1,
1.205438, -0.8583671, 4.103772, 1, 1, 1, 1, 1,
1.212588, -0.3926934, 1.615576, 1, 1, 1, 1, 1,
1.222877, 0.9889529, 0.9663054, 1, 1, 1, 1, 1,
1.224772, -0.05720254, 2.144755, 1, 1, 1, 1, 1,
1.225305, 2.149167, 0.9952381, 1, 1, 1, 1, 1,
1.229756, 1.24745, 2.800426, 1, 1, 1, 1, 1,
1.252528, 1.349128, 0.3507477, 1, 1, 1, 1, 1,
1.255324, 0.233712, 1.408553, 1, 1, 1, 1, 1,
1.255872, 0.6304727, 1.240356, 1, 1, 1, 1, 1,
1.256948, -0.2717781, 2.917699, 1, 1, 1, 1, 1,
1.262426, 0.4997382, -1.117549, 0, 0, 1, 1, 1,
1.269415, 0.3827281, 1.557314, 1, 0, 0, 1, 1,
1.269522, 1.10078, 1.628548, 1, 0, 0, 1, 1,
1.270084, 0.9227492, -0.8767549, 1, 0, 0, 1, 1,
1.270284, 0.05360251, 1.341733, 1, 0, 0, 1, 1,
1.271395, 0.08567595, 1.796081, 1, 0, 0, 1, 1,
1.289096, -0.9967179, 1.802373, 0, 0, 0, 1, 1,
1.291311, 0.5312586, 1.049231, 0, 0, 0, 1, 1,
1.293716, -1.60659, 2.005561, 0, 0, 0, 1, 1,
1.293791, 0.659493, 0.02189668, 0, 0, 0, 1, 1,
1.295833, 0.0001261909, 1.98701, 0, 0, 0, 1, 1,
1.299326, 0.3905253, 2.129719, 0, 0, 0, 1, 1,
1.300351, 0.6650636, 1.329203, 0, 0, 0, 1, 1,
1.30624, 0.2884167, 0.140993, 1, 1, 1, 1, 1,
1.31387, 0.7387384, 4.675997, 1, 1, 1, 1, 1,
1.31877, 1.259832, 2.098021, 1, 1, 1, 1, 1,
1.33282, 0.4252663, 1.87044, 1, 1, 1, 1, 1,
1.334279, 1.162835, 1.164549, 1, 1, 1, 1, 1,
1.349816, 0.6526081, 2.426206, 1, 1, 1, 1, 1,
1.355148, 0.2949127, 2.324461, 1, 1, 1, 1, 1,
1.360529, -0.3683579, 0.4732243, 1, 1, 1, 1, 1,
1.366262, -0.5376384, 1.203456, 1, 1, 1, 1, 1,
1.369737, 0.3746177, 0.8468744, 1, 1, 1, 1, 1,
1.373159, 0.5922434, 0.7905083, 1, 1, 1, 1, 1,
1.381893, 0.56932, 2.224316, 1, 1, 1, 1, 1,
1.385018, 2.403386, -0.5461029, 1, 1, 1, 1, 1,
1.392313, -1.556292, 1.943383, 1, 1, 1, 1, 1,
1.405466, -1.944077, 1.452654, 1, 1, 1, 1, 1,
1.415024, -0.9313338, 2.941864, 0, 0, 1, 1, 1,
1.420288, -1.243771, 0.527973, 1, 0, 0, 1, 1,
1.427088, -0.9868973, 2.398743, 1, 0, 0, 1, 1,
1.433737, 0.7517224, 2.129244, 1, 0, 0, 1, 1,
1.434507, 0.461891, 0.7557379, 1, 0, 0, 1, 1,
1.437555, 1.249632, 1.079971, 1, 0, 0, 1, 1,
1.442149, 1.498608, 2.069614, 0, 0, 0, 1, 1,
1.446224, 0.962585, 3.093751, 0, 0, 0, 1, 1,
1.45043, 0.9597399, 1.258437, 0, 0, 0, 1, 1,
1.452594, -0.1258527, 1.335916, 0, 0, 0, 1, 1,
1.456453, -0.07923663, 2.326841, 0, 0, 0, 1, 1,
1.474033, -1.166234, 1.918237, 0, 0, 0, 1, 1,
1.485559, 0.1231074, 1.192736, 0, 0, 0, 1, 1,
1.492203, 1.606267, 0.2760181, 1, 1, 1, 1, 1,
1.492694, 0.2638766, 0.4382334, 1, 1, 1, 1, 1,
1.494348, 0.9383331, 0.5642284, 1, 1, 1, 1, 1,
1.514037, 1.006984, 1.408682, 1, 1, 1, 1, 1,
1.514961, 1.054223, 1.626356, 1, 1, 1, 1, 1,
1.515466, -1.279217, 0.7005561, 1, 1, 1, 1, 1,
1.516202, 0.1738035, 2.135335, 1, 1, 1, 1, 1,
1.523215, 1.206102, 1.764974, 1, 1, 1, 1, 1,
1.5303, -0.05333564, 1.483968, 1, 1, 1, 1, 1,
1.547693, -2.049907, 2.984591, 1, 1, 1, 1, 1,
1.548517, -0.4059066, 1.903707, 1, 1, 1, 1, 1,
1.569075, -0.1216165, 1.666604, 1, 1, 1, 1, 1,
1.576191, 2.450247, 1.590388, 1, 1, 1, 1, 1,
1.583495, -1.303202, 1.941503, 1, 1, 1, 1, 1,
1.585279, 0.9879779, 0.6294829, 1, 1, 1, 1, 1,
1.593427, -0.7549029, 1.494284, 0, 0, 1, 1, 1,
1.616756, -0.5938981, 2.476249, 1, 0, 0, 1, 1,
1.646919, -0.573552, 1.647588, 1, 0, 0, 1, 1,
1.651355, 1.596188, -0.8102272, 1, 0, 0, 1, 1,
1.65507, -0.05913363, 2.462216, 1, 0, 0, 1, 1,
1.672936, -0.3577681, 2.567786, 1, 0, 0, 1, 1,
1.698123, -0.9317283, 1.572487, 0, 0, 0, 1, 1,
1.714479, -0.2352988, 1.228334, 0, 0, 0, 1, 1,
1.71584, 1.270587, 1.139007, 0, 0, 0, 1, 1,
1.716061, -0.0262306, 1.626434, 0, 0, 0, 1, 1,
1.72528, -1.036405, 1.455245, 0, 0, 0, 1, 1,
1.749375, -1.025002, 1.540488, 0, 0, 0, 1, 1,
1.75253, -0.135387, 2.260339, 0, 0, 0, 1, 1,
1.768004, -1.529502, 2.655274, 1, 1, 1, 1, 1,
1.77021, -0.9247404, 2.991747, 1, 1, 1, 1, 1,
1.781631, -0.6449291, 2.973171, 1, 1, 1, 1, 1,
1.825285, -0.1019525, 2.702358, 1, 1, 1, 1, 1,
1.835088, 0.8281906, 1.451624, 1, 1, 1, 1, 1,
1.858835, 0.2198387, 2.113358, 1, 1, 1, 1, 1,
1.884965, 0.7738626, 2.145527, 1, 1, 1, 1, 1,
1.923387, 1.013956, 1.841799, 1, 1, 1, 1, 1,
1.931253, 1.034915, 2.112588, 1, 1, 1, 1, 1,
1.931963, -0.7598154, 2.353663, 1, 1, 1, 1, 1,
1.948621, 0.9196858, -0.7884053, 1, 1, 1, 1, 1,
1.952846, -0.1330453, 1.533716, 1, 1, 1, 1, 1,
1.968052, 0.6302209, 2.307934, 1, 1, 1, 1, 1,
1.977056, -0.6061342, 1.835896, 1, 1, 1, 1, 1,
1.994126, -1.344301, 3.832942, 1, 1, 1, 1, 1,
1.996202, 0.9815384, 0.2560761, 0, 0, 1, 1, 1,
2.001036, -0.7243736, 2.733399, 1, 0, 0, 1, 1,
2.003488, -0.938677, 1.525343, 1, 0, 0, 1, 1,
2.042276, -1.801084, 1.465132, 1, 0, 0, 1, 1,
2.053682, 0.1384649, -0.2949357, 1, 0, 0, 1, 1,
2.056932, -1.962691, 3.22757, 1, 0, 0, 1, 1,
2.07424, -0.4483121, 2.220439, 0, 0, 0, 1, 1,
2.145392, -0.9559327, 3.386544, 0, 0, 0, 1, 1,
2.201611, 0.3831546, 1.178274, 0, 0, 0, 1, 1,
2.285334, -0.6813557, 1.722229, 0, 0, 0, 1, 1,
2.301099, 0.306506, 1.000384, 0, 0, 0, 1, 1,
2.33132, -0.5926031, 1.504891, 0, 0, 0, 1, 1,
2.364824, 0.2481029, 3.085569, 0, 0, 0, 1, 1,
2.397403, 0.4412256, 0.7835476, 1, 1, 1, 1, 1,
2.485892, -1.247941, 2.602247, 1, 1, 1, 1, 1,
2.637851, 0.709785, 2.861256, 1, 1, 1, 1, 1,
2.78782, 1.530452, 0.7622733, 1, 1, 1, 1, 1,
2.977455, -0.3125961, 1.915295, 1, 1, 1, 1, 1,
3.052658, 0.7201813, 3.222632, 1, 1, 1, 1, 1,
3.456544, 1.797012, -0.345641, 1, 1, 1, 1, 1
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
var radius = 10.11733;
var distance = 35.53669;
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
mvMatrix.translate( 0.01159191, 0.006814957, 0.5049906 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.53669);
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
