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
-3.764333, 0.2211064, -1.40659, 1, 0, 0, 1,
-2.987012, 0.2451796, -1.284314, 1, 0.007843138, 0, 1,
-2.862701, -0.7045683, -3.136328, 1, 0.01176471, 0, 1,
-2.760115, -0.1888293, -2.999463, 1, 0.01960784, 0, 1,
-2.689131, 0.8509724, -2.018044, 1, 0.02352941, 0, 1,
-2.657247, -0.2229626, -2.305495, 1, 0.03137255, 0, 1,
-2.489836, -1.9473, -0.8180538, 1, 0.03529412, 0, 1,
-2.439022, -0.1006868, -0.7455494, 1, 0.04313726, 0, 1,
-2.339006, 0.06380123, -1.465369, 1, 0.04705882, 0, 1,
-2.274077, -0.4557231, 0.3338132, 1, 0.05490196, 0, 1,
-2.241903, -0.8597, -4.118683, 1, 0.05882353, 0, 1,
-2.223907, 0.4537039, -1.198109, 1, 0.06666667, 0, 1,
-2.215059, 0.1591752, -1.982356, 1, 0.07058824, 0, 1,
-2.200403, 0.2025017, 0.07683986, 1, 0.07843138, 0, 1,
-2.13447, -2.393357, -2.597095, 1, 0.08235294, 0, 1,
-2.125038, -1.048605, -0.6379611, 1, 0.09019608, 0, 1,
-2.089959, -0.4157839, -2.85858, 1, 0.09411765, 0, 1,
-2.069514, 0.05668512, -0.3306846, 1, 0.1019608, 0, 1,
-2.02263, 0.4532019, -2.466921, 1, 0.1098039, 0, 1,
-2.012478, 0.5026127, -1.12003, 1, 0.1137255, 0, 1,
-1.986814, 1.009185, -1.127668, 1, 0.1215686, 0, 1,
-1.984597, -0.498669, -0.7657631, 1, 0.1254902, 0, 1,
-1.967281, 0.3091284, -2.217956, 1, 0.1333333, 0, 1,
-1.962911, -2.097106, -2.128243, 1, 0.1372549, 0, 1,
-1.961473, 0.3147194, -1.016436, 1, 0.145098, 0, 1,
-1.940718, -0.5303873, -1.271017, 1, 0.1490196, 0, 1,
-1.928423, 0.6356893, -1.062083, 1, 0.1568628, 0, 1,
-1.92826, -0.6211344, -1.69277, 1, 0.1607843, 0, 1,
-1.899853, 1.191715, 0.2410404, 1, 0.1686275, 0, 1,
-1.894462, 0.1018446, -1.7833, 1, 0.172549, 0, 1,
-1.894245, 0.4315537, -1.675756, 1, 0.1803922, 0, 1,
-1.869118, 0.02966343, -1.681141, 1, 0.1843137, 0, 1,
-1.860956, -1.511548, -1.058837, 1, 0.1921569, 0, 1,
-1.837278, -0.1049804, -1.458647, 1, 0.1960784, 0, 1,
-1.826127, 0.1234558, -0.3710084, 1, 0.2039216, 0, 1,
-1.798634, 0.5105454, -1.344806, 1, 0.2117647, 0, 1,
-1.788816, 3.299258, -0.6292502, 1, 0.2156863, 0, 1,
-1.787347, -0.8313259, -2.525164, 1, 0.2235294, 0, 1,
-1.785492, 0.9699488, -1.185114, 1, 0.227451, 0, 1,
-1.782145, -0.7789967, -4.154068, 1, 0.2352941, 0, 1,
-1.730952, 0.1801699, -1.579457, 1, 0.2392157, 0, 1,
-1.720977, 1.39174, 0.08336824, 1, 0.2470588, 0, 1,
-1.697985, -0.183925, -3.246251, 1, 0.2509804, 0, 1,
-1.697791, -0.02919221, -2.084643, 1, 0.2588235, 0, 1,
-1.689564, 0.8887967, -1.490651, 1, 0.2627451, 0, 1,
-1.6851, 0.9355801, -2.797395, 1, 0.2705882, 0, 1,
-1.681106, -0.8779165, -2.276698, 1, 0.2745098, 0, 1,
-1.674448, 0.5067159, -0.7016342, 1, 0.282353, 0, 1,
-1.661574, -0.5216238, -3.122831, 1, 0.2862745, 0, 1,
-1.635756, 1.12492, -1.935961, 1, 0.2941177, 0, 1,
-1.625417, 2.41292, 0.6191382, 1, 0.3019608, 0, 1,
-1.601769, 0.05065108, -2.154884, 1, 0.3058824, 0, 1,
-1.596939, -0.6818981, -2.91084, 1, 0.3137255, 0, 1,
-1.592584, 0.08655728, -2.049656, 1, 0.3176471, 0, 1,
-1.585898, -1.829779, -1.727321, 1, 0.3254902, 0, 1,
-1.568923, -1.302794, -3.038671, 1, 0.3294118, 0, 1,
-1.558998, 1.926237, -1.365425, 1, 0.3372549, 0, 1,
-1.554715, 0.9990636, -2.253954, 1, 0.3411765, 0, 1,
-1.553494, 0.332269, -2.39838, 1, 0.3490196, 0, 1,
-1.522687, -0.487619, -0.7440454, 1, 0.3529412, 0, 1,
-1.508319, 0.6415504, -2.253241, 1, 0.3607843, 0, 1,
-1.505543, 0.03430642, -1.237657, 1, 0.3647059, 0, 1,
-1.494128, -0.5830008, -3.07708, 1, 0.372549, 0, 1,
-1.48886, -1.136194, -0.9114228, 1, 0.3764706, 0, 1,
-1.487093, -0.3454285, -3.814278, 1, 0.3843137, 0, 1,
-1.474652, 0.6794875, -0.9842451, 1, 0.3882353, 0, 1,
-1.465659, -0.9326862, -1.857879, 1, 0.3960784, 0, 1,
-1.454296, 0.5762547, -0.3552583, 1, 0.4039216, 0, 1,
-1.438335, -0.2773025, -2.175951, 1, 0.4078431, 0, 1,
-1.406763, -0.3676099, -1.472367, 1, 0.4156863, 0, 1,
-1.40148, -0.4474777, -2.586498, 1, 0.4196078, 0, 1,
-1.392619, 0.3530804, -1.75882, 1, 0.427451, 0, 1,
-1.38509, -0.6442824, -1.418912, 1, 0.4313726, 0, 1,
-1.38318, -1.307794, -2.773832, 1, 0.4392157, 0, 1,
-1.380584, 0.7302784, -2.960217, 1, 0.4431373, 0, 1,
-1.376853, -0.6863713, -1.830709, 1, 0.4509804, 0, 1,
-1.366413, 0.5749521, -1.81908, 1, 0.454902, 0, 1,
-1.351821, 0.9362742, -0.7237956, 1, 0.4627451, 0, 1,
-1.35148, -1.826835, -1.969388, 1, 0.4666667, 0, 1,
-1.330033, 0.6569963, -0.3170142, 1, 0.4745098, 0, 1,
-1.324024, 0.3233827, -0.7894838, 1, 0.4784314, 0, 1,
-1.32024, 0.1456599, -0.5840092, 1, 0.4862745, 0, 1,
-1.316595, -0.4736997, -2.353373, 1, 0.4901961, 0, 1,
-1.308138, -1.138095, -1.799705, 1, 0.4980392, 0, 1,
-1.305714, -0.03791391, -1.515335, 1, 0.5058824, 0, 1,
-1.296677, 1.072998, -2.646782, 1, 0.509804, 0, 1,
-1.296311, -0.6118848, -1.382161, 1, 0.5176471, 0, 1,
-1.28821, -1.141319, -3.300476, 1, 0.5215687, 0, 1,
-1.287385, 0.6789985, -2.510935, 1, 0.5294118, 0, 1,
-1.286631, 0.8212104, 0.5415661, 1, 0.5333334, 0, 1,
-1.282712, -0.9420733, -2.45438, 1, 0.5411765, 0, 1,
-1.27858, -0.6231894, -3.931901, 1, 0.5450981, 0, 1,
-1.272741, -1.161283, -2.580655, 1, 0.5529412, 0, 1,
-1.270906, -1.180737, -3.296849, 1, 0.5568628, 0, 1,
-1.25673, 1.232439, 1.553647, 1, 0.5647059, 0, 1,
-1.252939, -1.165386, -2.73377, 1, 0.5686275, 0, 1,
-1.247516, 0.7763302, -0.2896996, 1, 0.5764706, 0, 1,
-1.241154, -1.524947, -2.536291, 1, 0.5803922, 0, 1,
-1.230924, 0.01126086, -1.622773, 1, 0.5882353, 0, 1,
-1.229419, -3.257694, -3.68329, 1, 0.5921569, 0, 1,
-1.225438, 0.3729904, -0.7258984, 1, 0.6, 0, 1,
-1.224711, 0.2014312, 0.4665751, 1, 0.6078432, 0, 1,
-1.206754, -0.7034481, -1.140471, 1, 0.6117647, 0, 1,
-1.204386, -2.216985, -2.631955, 1, 0.6196079, 0, 1,
-1.200739, 0.5288007, -1.88712, 1, 0.6235294, 0, 1,
-1.187753, 1.022035, -0.6720451, 1, 0.6313726, 0, 1,
-1.186626, 0.7503715, -1.525359, 1, 0.6352941, 0, 1,
-1.182451, -0.6377787, -2.952142, 1, 0.6431373, 0, 1,
-1.172232, -0.391082, -1.580012, 1, 0.6470588, 0, 1,
-1.168142, -1.029827, -1.961839, 1, 0.654902, 0, 1,
-1.165114, -0.911788, -2.128062, 1, 0.6588235, 0, 1,
-1.162181, 1.605051, -1.697415, 1, 0.6666667, 0, 1,
-1.156353, -0.6131486, -2.78778, 1, 0.6705883, 0, 1,
-1.154542, -0.9550629, -1.816921, 1, 0.6784314, 0, 1,
-1.152128, -2.01562, -2.318218, 1, 0.682353, 0, 1,
-1.150854, -0.2999951, -2.883666, 1, 0.6901961, 0, 1,
-1.148016, -1.05219, -3.873569, 1, 0.6941177, 0, 1,
-1.145825, 0.8948368, -0.6241161, 1, 0.7019608, 0, 1,
-1.142765, -1.420771, -1.809805, 1, 0.7098039, 0, 1,
-1.130585, -0.5557262, -1.992766, 1, 0.7137255, 0, 1,
-1.128791, 1.458132, 0.4394586, 1, 0.7215686, 0, 1,
-1.128713, -0.5328551, -1.744445, 1, 0.7254902, 0, 1,
-1.128294, 0.8402441, -0.565585, 1, 0.7333333, 0, 1,
-1.123719, 1.277242, -0.3134763, 1, 0.7372549, 0, 1,
-1.1192, -0.1425707, -0.9403803, 1, 0.7450981, 0, 1,
-1.116728, 0.4391418, -0.6763942, 1, 0.7490196, 0, 1,
-1.11404, 1.559893, 0.05776251, 1, 0.7568628, 0, 1,
-1.113849, -0.2330763, -1.134723, 1, 0.7607843, 0, 1,
-1.109136, -1.622622, -3.437137, 1, 0.7686275, 0, 1,
-1.105724, -1.659768, -2.148072, 1, 0.772549, 0, 1,
-1.097468, 0.6198786, -0.17641, 1, 0.7803922, 0, 1,
-1.096473, 0.7253054, -0.4112268, 1, 0.7843137, 0, 1,
-1.09598, 1.392189, -1.045268, 1, 0.7921569, 0, 1,
-1.093798, 0.1984958, -0.2755731, 1, 0.7960784, 0, 1,
-1.092363, -0.453426, -3.015094, 1, 0.8039216, 0, 1,
-1.091895, -1.676962, -3.017513, 1, 0.8117647, 0, 1,
-1.090359, 0.8598994, -0.964938, 1, 0.8156863, 0, 1,
-1.086714, 0.2590619, -1.035811, 1, 0.8235294, 0, 1,
-1.085082, 0.9865632, -1.541457, 1, 0.827451, 0, 1,
-1.083873, 0.2104712, -0.9858824, 1, 0.8352941, 0, 1,
-1.082927, -0.1356232, -2.245735, 1, 0.8392157, 0, 1,
-1.078564, -0.7874567, -2.081243, 1, 0.8470588, 0, 1,
-1.075926, 1.30443, -2.073596, 1, 0.8509804, 0, 1,
-1.065989, -2.063896, -1.561719, 1, 0.8588235, 0, 1,
-1.057968, 1.50026, -1.632121, 1, 0.8627451, 0, 1,
-1.052999, -0.4082849, -0.9714987, 1, 0.8705882, 0, 1,
-1.052418, 1.574064, -1.865082, 1, 0.8745098, 0, 1,
-1.052305, 0.06108407, -2.29649, 1, 0.8823529, 0, 1,
-1.051601, 0.4067152, -1.744064, 1, 0.8862745, 0, 1,
-1.050697, -0.6368869, -1.605759, 1, 0.8941177, 0, 1,
-1.045551, 0.074251, -1.570171, 1, 0.8980392, 0, 1,
-1.042432, -0.4800867, -1.666218, 1, 0.9058824, 0, 1,
-1.039053, 1.329808, 1.475761, 1, 0.9137255, 0, 1,
-1.037977, -0.5031875, -0.7592552, 1, 0.9176471, 0, 1,
-1.033669, -0.4399036, -3.186557, 1, 0.9254902, 0, 1,
-1.029768, 1.409016, -1.271089, 1, 0.9294118, 0, 1,
-1.025881, -0.9543568, -0.7220871, 1, 0.9372549, 0, 1,
-1.025737, 2.261769, -0.6389891, 1, 0.9411765, 0, 1,
-1.016175, 1.71007, -1.388306, 1, 0.9490196, 0, 1,
-1.014264, 0.9191229, -0.862501, 1, 0.9529412, 0, 1,
-1.014144, 0.1203687, -2.07023, 1, 0.9607843, 0, 1,
-1.008056, 2.196389, -2.719369, 1, 0.9647059, 0, 1,
-1.002932, 0.4868143, -1.58981, 1, 0.972549, 0, 1,
-1.001066, -0.4699566, -2.600928, 1, 0.9764706, 0, 1,
-1.00008, 0.2346198, -1.592231, 1, 0.9843137, 0, 1,
-0.9951544, -1.329896, -1.272932, 1, 0.9882353, 0, 1,
-0.9859807, 0.4071193, -1.793659, 1, 0.9960784, 0, 1,
-0.9855254, -1.204829, -4.110158, 0.9960784, 1, 0, 1,
-0.9791079, -1.737146, -1.314001, 0.9921569, 1, 0, 1,
-0.9767832, 0.3498397, -1.413548, 0.9843137, 1, 0, 1,
-0.9649261, 0.3475183, 0.1978518, 0.9803922, 1, 0, 1,
-0.9636548, 0.1976085, -3.281563, 0.972549, 1, 0, 1,
-0.963089, -0.3405555, -2.811235, 0.9686275, 1, 0, 1,
-0.9473825, 1.78247, 0.08436866, 0.9607843, 1, 0, 1,
-0.94287, 0.8125317, -0.2428557, 0.9568627, 1, 0, 1,
-0.9417513, 0.2007182, -2.171184, 0.9490196, 1, 0, 1,
-0.9412227, 0.0636976, -3.272562, 0.945098, 1, 0, 1,
-0.9392899, -0.7188269, -0.9963684, 0.9372549, 1, 0, 1,
-0.939063, 2.601374, -1.624739, 0.9333333, 1, 0, 1,
-0.9383727, -0.8707286, -2.706489, 0.9254902, 1, 0, 1,
-0.9292861, 0.1838089, -3.576188, 0.9215686, 1, 0, 1,
-0.9236221, 0.04785606, -1.893481, 0.9137255, 1, 0, 1,
-0.9180529, 1.719904, -1.403087, 0.9098039, 1, 0, 1,
-0.906541, -0.6491656, -0.4874696, 0.9019608, 1, 0, 1,
-0.8971611, -1.290195, -1.433211, 0.8941177, 1, 0, 1,
-0.8965518, -0.2846992, -1.785761, 0.8901961, 1, 0, 1,
-0.884204, -0.8539516, -2.988782, 0.8823529, 1, 0, 1,
-0.8754307, 0.356826, -1.820601, 0.8784314, 1, 0, 1,
-0.8749819, -2.013694, -3.342196, 0.8705882, 1, 0, 1,
-0.8713611, -0.4624929, -0.2877024, 0.8666667, 1, 0, 1,
-0.8694273, 0.5576801, -0.04427728, 0.8588235, 1, 0, 1,
-0.8557712, -0.5794895, -1.113818, 0.854902, 1, 0, 1,
-0.8525258, 0.2193317, -0.5628086, 0.8470588, 1, 0, 1,
-0.8450551, -0.483709, -3.61223, 0.8431373, 1, 0, 1,
-0.839418, 1.289228, -0.07290039, 0.8352941, 1, 0, 1,
-0.8386255, 0.1358943, -0.2141759, 0.8313726, 1, 0, 1,
-0.8343659, -0.784696, -0.5959399, 0.8235294, 1, 0, 1,
-0.8323315, 1.011067, -0.2875642, 0.8196079, 1, 0, 1,
-0.8323246, 1.235712, -1.137257, 0.8117647, 1, 0, 1,
-0.8321538, -0.3855728, -0.5202081, 0.8078431, 1, 0, 1,
-0.8317902, 0.4567038, -1.527948, 0.8, 1, 0, 1,
-0.8310327, -0.2100148, -0.686042, 0.7921569, 1, 0, 1,
-0.8256266, -1.7526, -2.395998, 0.7882353, 1, 0, 1,
-0.8252504, -1.044324, -1.657016, 0.7803922, 1, 0, 1,
-0.8222097, 1.057907, 0.9296099, 0.7764706, 1, 0, 1,
-0.8200454, 0.5122599, -0.7113357, 0.7686275, 1, 0, 1,
-0.8086598, 0.563421, -0.5983593, 0.7647059, 1, 0, 1,
-0.8054557, 1.795692, -0.4663863, 0.7568628, 1, 0, 1,
-0.7996193, 0.413271, -1.737574, 0.7529412, 1, 0, 1,
-0.7967417, 1.929891, -0.1063612, 0.7450981, 1, 0, 1,
-0.7941266, 1.562934, -1.621878, 0.7411765, 1, 0, 1,
-0.7939519, 0.7221885, -1.118981, 0.7333333, 1, 0, 1,
-0.7927815, 0.2236002, -1.906088, 0.7294118, 1, 0, 1,
-0.7877603, -0.3468292, -1.757276, 0.7215686, 1, 0, 1,
-0.787733, -1.680309, -1.897663, 0.7176471, 1, 0, 1,
-0.7840745, 1.563208, 1.596192, 0.7098039, 1, 0, 1,
-0.7826602, -0.7187443, -2.899864, 0.7058824, 1, 0, 1,
-0.7727827, -0.5116972, -2.49503, 0.6980392, 1, 0, 1,
-0.7691916, -1.243491, -3.127854, 0.6901961, 1, 0, 1,
-0.7690207, -0.2044069, -3.588637, 0.6862745, 1, 0, 1,
-0.769007, -1.573967, -1.355403, 0.6784314, 1, 0, 1,
-0.7672207, 0.2502572, -4.073132, 0.6745098, 1, 0, 1,
-0.7629615, 0.9937041, 0.5815802, 0.6666667, 1, 0, 1,
-0.7597307, 1.831853, 0.09544242, 0.6627451, 1, 0, 1,
-0.7555037, 0.3725278, -0.06940596, 0.654902, 1, 0, 1,
-0.7551354, -0.2552277, -1.846388, 0.6509804, 1, 0, 1,
-0.7383417, 2.164539, 1.20353, 0.6431373, 1, 0, 1,
-0.7381561, 0.6928862, -0.5731344, 0.6392157, 1, 0, 1,
-0.7342726, -0.02728443, -2.217331, 0.6313726, 1, 0, 1,
-0.7331629, -0.1648664, -3.680441, 0.627451, 1, 0, 1,
-0.7318422, -1.18066, -2.49754, 0.6196079, 1, 0, 1,
-0.730924, -0.7639795, -1.275019, 0.6156863, 1, 0, 1,
-0.7295121, 2.407521, -0.6556751, 0.6078432, 1, 0, 1,
-0.7293649, -0.5102646, -2.160828, 0.6039216, 1, 0, 1,
-0.727754, 0.800537, -1.616146, 0.5960785, 1, 0, 1,
-0.7208923, 0.8159132, -1.185139, 0.5882353, 1, 0, 1,
-0.7145089, -0.56947, -3.224945, 0.5843138, 1, 0, 1,
-0.7107577, -0.8164051, -3.237724, 0.5764706, 1, 0, 1,
-0.7080332, 0.5324291, -0.1043833, 0.572549, 1, 0, 1,
-0.7074314, -1.876678, -3.739018, 0.5647059, 1, 0, 1,
-0.7012368, -0.2682413, -0.02784021, 0.5607843, 1, 0, 1,
-0.6974524, 0.6399893, -0.4212572, 0.5529412, 1, 0, 1,
-0.6935611, 0.3925838, -0.09938928, 0.5490196, 1, 0, 1,
-0.6929908, -0.7669828, -2.048238, 0.5411765, 1, 0, 1,
-0.6914077, 1.549446, -0.9426042, 0.5372549, 1, 0, 1,
-0.6852848, -0.5951471, -1.084499, 0.5294118, 1, 0, 1,
-0.6842183, 0.8644406, -0.8541134, 0.5254902, 1, 0, 1,
-0.6810047, 0.1490035, -3.414199, 0.5176471, 1, 0, 1,
-0.6803619, -0.5968505, -2.231068, 0.5137255, 1, 0, 1,
-0.6800993, 1.78448, -1.081396, 0.5058824, 1, 0, 1,
-0.6780915, -0.07322346, -1.765724, 0.5019608, 1, 0, 1,
-0.6777244, -0.2197489, -2.639492, 0.4941176, 1, 0, 1,
-0.6773684, -0.7151638, -3.816812, 0.4862745, 1, 0, 1,
-0.6728084, 0.4237396, 0.756592, 0.4823529, 1, 0, 1,
-0.6668477, 0.429709, -0.8775354, 0.4745098, 1, 0, 1,
-0.6656808, 1.542672, -1.733127, 0.4705882, 1, 0, 1,
-0.6650811, -0.4076011, 0.3285015, 0.4627451, 1, 0, 1,
-0.663871, 2.41055, -0.6364763, 0.4588235, 1, 0, 1,
-0.6638273, -0.1028928, -3.477263, 0.4509804, 1, 0, 1,
-0.660895, -0.6739889, -2.688744, 0.4470588, 1, 0, 1,
-0.6583408, 0.7259599, -1.181792, 0.4392157, 1, 0, 1,
-0.6539896, 0.9352289, -1.236937, 0.4352941, 1, 0, 1,
-0.6531731, -0.4252165, -1.354339, 0.427451, 1, 0, 1,
-0.6523454, -0.3472249, -4.699147, 0.4235294, 1, 0, 1,
-0.6522054, -0.8063357, -1.852943, 0.4156863, 1, 0, 1,
-0.6423599, -0.4526615, -1.89117, 0.4117647, 1, 0, 1,
-0.6414912, -0.1071887, -1.012679, 0.4039216, 1, 0, 1,
-0.6387428, -0.3628282, -2.504148, 0.3960784, 1, 0, 1,
-0.6323034, 1.03902, -0.8650645, 0.3921569, 1, 0, 1,
-0.6314197, -1.322827, -1.40547, 0.3843137, 1, 0, 1,
-0.628926, -0.5491554, -1.297768, 0.3803922, 1, 0, 1,
-0.6247895, -0.4230516, -2.674554, 0.372549, 1, 0, 1,
-0.623828, -0.4811592, -2.744587, 0.3686275, 1, 0, 1,
-0.6220272, -0.6413112, -2.705302, 0.3607843, 1, 0, 1,
-0.6212538, -0.2910087, -1.281573, 0.3568628, 1, 0, 1,
-0.6147746, 1.285519, -0.03641897, 0.3490196, 1, 0, 1,
-0.6102155, -0.1148839, -1.292114, 0.345098, 1, 0, 1,
-0.6085274, -0.3645834, -2.574121, 0.3372549, 1, 0, 1,
-0.5991555, -1.125347, -3.964473, 0.3333333, 1, 0, 1,
-0.5991122, 0.3853536, 0.4043302, 0.3254902, 1, 0, 1,
-0.5947143, 0.1104636, -2.226537, 0.3215686, 1, 0, 1,
-0.5902486, 0.5059197, -0.5545578, 0.3137255, 1, 0, 1,
-0.5875404, -0.4250998, -0.9751414, 0.3098039, 1, 0, 1,
-0.5798081, -0.4936125, -1.977138, 0.3019608, 1, 0, 1,
-0.5797691, -0.528425, -2.771808, 0.2941177, 1, 0, 1,
-0.5790496, -0.455038, -1.613345, 0.2901961, 1, 0, 1,
-0.5787741, 1.808418, 1.54588, 0.282353, 1, 0, 1,
-0.5754511, -0.4473783, -1.226554, 0.2784314, 1, 0, 1,
-0.5735725, -0.5225937, -0.8348805, 0.2705882, 1, 0, 1,
-0.5714504, 0.6318787, -1.113335, 0.2666667, 1, 0, 1,
-0.5653909, 0.8317919, 0.58983, 0.2588235, 1, 0, 1,
-0.5648629, 0.5750397, -0.4129094, 0.254902, 1, 0, 1,
-0.5643082, -0.8992791, -5.319681, 0.2470588, 1, 0, 1,
-0.5626194, -0.5633751, -3.627799, 0.2431373, 1, 0, 1,
-0.5619415, -0.03455124, 0.2454012, 0.2352941, 1, 0, 1,
-0.5612395, -1.179508, -3.158404, 0.2313726, 1, 0, 1,
-0.5591694, 1.72291, -0.323498, 0.2235294, 1, 0, 1,
-0.5531573, 0.1871229, -2.968341, 0.2196078, 1, 0, 1,
-0.5438081, 0.4132962, 0.2424827, 0.2117647, 1, 0, 1,
-0.5357926, -0.534736, -1.047789, 0.2078431, 1, 0, 1,
-0.5357016, 1.351629, -0.6832375, 0.2, 1, 0, 1,
-0.5301107, -0.5902466, -2.753321, 0.1921569, 1, 0, 1,
-0.5299811, -0.3499064, -2.867966, 0.1882353, 1, 0, 1,
-0.5297338, -0.1701839, -0.2754284, 0.1803922, 1, 0, 1,
-0.5281299, 0.4683615, -0.8637672, 0.1764706, 1, 0, 1,
-0.5260428, 0.8527977, -1.815846, 0.1686275, 1, 0, 1,
-0.5237054, 1.812437, -1.712757, 0.1647059, 1, 0, 1,
-0.5223011, -0.566355, -1.733019, 0.1568628, 1, 0, 1,
-0.5219286, -1.116387, -4.55872, 0.1529412, 1, 0, 1,
-0.5139329, 0.4531589, -0.697879, 0.145098, 1, 0, 1,
-0.5138117, -0.8986207, -3.897071, 0.1411765, 1, 0, 1,
-0.5135877, -1.512834, -2.791496, 0.1333333, 1, 0, 1,
-0.5106003, -0.4030783, -1.176252, 0.1294118, 1, 0, 1,
-0.5078255, -0.797012, -4.124071, 0.1215686, 1, 0, 1,
-0.5037583, 0.5484838, -1.443617, 0.1176471, 1, 0, 1,
-0.5031247, 0.6148522, 0.544461, 0.1098039, 1, 0, 1,
-0.501115, -0.5209193, -2.165471, 0.1058824, 1, 0, 1,
-0.4990003, -0.5244476, -3.160094, 0.09803922, 1, 0, 1,
-0.4986769, 0.4102511, -1.072881, 0.09019608, 1, 0, 1,
-0.4951259, -0.3967319, -2.691103, 0.08627451, 1, 0, 1,
-0.4938067, 0.2733314, -1.75706, 0.07843138, 1, 0, 1,
-0.4936966, 0.06839667, -0.3130887, 0.07450981, 1, 0, 1,
-0.4926874, 0.4749295, 1.109863, 0.06666667, 1, 0, 1,
-0.4922626, 0.6376472, -1.364161, 0.0627451, 1, 0, 1,
-0.4912248, -1.982068, -2.600774, 0.05490196, 1, 0, 1,
-0.4856734, 0.3299226, 0.1498775, 0.05098039, 1, 0, 1,
-0.4811252, 0.4160012, 0.8474021, 0.04313726, 1, 0, 1,
-0.4799846, -1.398563, -3.43758, 0.03921569, 1, 0, 1,
-0.4786786, -1.379577, -3.131314, 0.03137255, 1, 0, 1,
-0.4772154, -0.6477686, -1.927321, 0.02745098, 1, 0, 1,
-0.4748235, -0.3984739, -1.840503, 0.01960784, 1, 0, 1,
-0.4735778, -1.276032, -2.844898, 0.01568628, 1, 0, 1,
-0.4722081, 1.316885, -1.609254, 0.007843138, 1, 0, 1,
-0.4623792, 0.767996, -0.8954953, 0.003921569, 1, 0, 1,
-0.4606579, -0.6735598, -1.709493, 0, 1, 0.003921569, 1,
-0.4567217, 0.07748044, -2.63945, 0, 1, 0.01176471, 1,
-0.4536039, -0.1063425, -2.421509, 0, 1, 0.01568628, 1,
-0.4487707, 0.2896656, 0.567435, 0, 1, 0.02352941, 1,
-0.4391545, 0.2174263, -1.358702, 0, 1, 0.02745098, 1,
-0.4381872, 1.065322, -0.6322699, 0, 1, 0.03529412, 1,
-0.4343022, -0.7662963, -2.512854, 0, 1, 0.03921569, 1,
-0.4285996, 0.8009675, -1.198977, 0, 1, 0.04705882, 1,
-0.4262206, 0.852974, 0.5029052, 0, 1, 0.05098039, 1,
-0.42458, -1.287392, -1.781526, 0, 1, 0.05882353, 1,
-0.4171698, -0.09797221, -3.34983, 0, 1, 0.0627451, 1,
-0.4166976, -2.4473, -1.735186, 0, 1, 0.07058824, 1,
-0.4159734, -0.1036442, -3.059305, 0, 1, 0.07450981, 1,
-0.415151, -1.565632, -2.875874, 0, 1, 0.08235294, 1,
-0.4131442, -0.5768785, -3.077045, 0, 1, 0.08627451, 1,
-0.4089538, -1.768475, -3.550332, 0, 1, 0.09411765, 1,
-0.4065148, -0.09587526, -0.6374572, 0, 1, 0.1019608, 1,
-0.4048283, 0.9498948, -0.9074198, 0, 1, 0.1058824, 1,
-0.4006247, 1.86272, 1.917281, 0, 1, 0.1137255, 1,
-0.397367, 0.9900488, -1.104232, 0, 1, 0.1176471, 1,
-0.3944128, 1.678684, -0.1127573, 0, 1, 0.1254902, 1,
-0.3933207, -1.821742, -1.944729, 0, 1, 0.1294118, 1,
-0.3930365, -0.3709118, -1.438978, 0, 1, 0.1372549, 1,
-0.3836009, 0.4933738, -1.177241, 0, 1, 0.1411765, 1,
-0.3786072, 0.5689393, -0.981392, 0, 1, 0.1490196, 1,
-0.376974, -0.04766993, -1.094844, 0, 1, 0.1529412, 1,
-0.3608823, -0.7182071, -1.871911, 0, 1, 0.1607843, 1,
-0.3591571, 0.3707724, -1.796947, 0, 1, 0.1647059, 1,
-0.3574282, -0.5981765, -3.682365, 0, 1, 0.172549, 1,
-0.3554945, -0.04829519, -0.7451311, 0, 1, 0.1764706, 1,
-0.3546999, -0.2208367, -2.821924, 0, 1, 0.1843137, 1,
-0.3530248, -0.006313257, -0.8749632, 0, 1, 0.1882353, 1,
-0.3502595, 0.6750382, 1.374131, 0, 1, 0.1960784, 1,
-0.3485782, 0.3189171, -0.06407998, 0, 1, 0.2039216, 1,
-0.3454713, -1.493082, -1.439009, 0, 1, 0.2078431, 1,
-0.3399038, 0.7605423, -1.228401, 0, 1, 0.2156863, 1,
-0.3382376, -0.7663811, -2.947012, 0, 1, 0.2196078, 1,
-0.3344133, 0.8890727, -0.605606, 0, 1, 0.227451, 1,
-0.3267786, -0.3932478, -2.694756, 0, 1, 0.2313726, 1,
-0.3242489, 0.9021044, -0.3433411, 0, 1, 0.2392157, 1,
-0.3235748, -0.4480186, -2.286222, 0, 1, 0.2431373, 1,
-0.3221862, 0.769264, 0.846445, 0, 1, 0.2509804, 1,
-0.3180378, -0.3106295, -3.656817, 0, 1, 0.254902, 1,
-0.31256, -0.934424, -3.252432, 0, 1, 0.2627451, 1,
-0.3100758, 0.3034918, -1.272908, 0, 1, 0.2666667, 1,
-0.3089876, -2.442111, -4.025815, 0, 1, 0.2745098, 1,
-0.307501, -0.1281262, -2.710725, 0, 1, 0.2784314, 1,
-0.3072598, -0.3452751, -2.758203, 0, 1, 0.2862745, 1,
-0.3055141, 0.3771177, 0.8853626, 0, 1, 0.2901961, 1,
-0.3028594, 0.938747, 1.014203, 0, 1, 0.2980392, 1,
-0.2991417, -0.2942548, -2.097125, 0, 1, 0.3058824, 1,
-0.2947094, 0.5029145, -1.230986, 0, 1, 0.3098039, 1,
-0.2923873, -1.979793, -2.300066, 0, 1, 0.3176471, 1,
-0.2889073, 0.5872084, -0.7395464, 0, 1, 0.3215686, 1,
-0.2877655, -0.05330312, -2.489853, 0, 1, 0.3294118, 1,
-0.2856613, 1.05845, -1.042742, 0, 1, 0.3333333, 1,
-0.2843213, -0.4163702, -2.088386, 0, 1, 0.3411765, 1,
-0.2834916, 0.2549592, -1.02645, 0, 1, 0.345098, 1,
-0.2825031, 1.612186, 0.2034256, 0, 1, 0.3529412, 1,
-0.2815531, -0.8342481, -1.953732, 0, 1, 0.3568628, 1,
-0.2796211, -0.635337, -3.253355, 0, 1, 0.3647059, 1,
-0.2795824, -0.1364427, -1.791247, 0, 1, 0.3686275, 1,
-0.2795196, 0.1297581, -0.5129929, 0, 1, 0.3764706, 1,
-0.2728185, 0.02553069, -2.469987, 0, 1, 0.3803922, 1,
-0.2713035, -2.098428, -1.748118, 0, 1, 0.3882353, 1,
-0.2679164, -0.7605693, -3.286164, 0, 1, 0.3921569, 1,
-0.2659307, -1.61396, -5.288696, 0, 1, 0.4, 1,
-0.2645889, 0.04771758, -0.4999306, 0, 1, 0.4078431, 1,
-0.2507325, -0.2155125, -1.819103, 0, 1, 0.4117647, 1,
-0.250118, 0.966231, -0.06270504, 0, 1, 0.4196078, 1,
-0.2486206, 1.176941, -0.6800769, 0, 1, 0.4235294, 1,
-0.2457345, 0.3747111, -0.854966, 0, 1, 0.4313726, 1,
-0.2432567, -0.5463687, -2.413627, 0, 1, 0.4352941, 1,
-0.2400995, 1.41603, 0.0960978, 0, 1, 0.4431373, 1,
-0.2388725, 0.3802687, -2.088953, 0, 1, 0.4470588, 1,
-0.2388169, 0.4532503, 0.3406191, 0, 1, 0.454902, 1,
-0.2371648, -0.6403686, -2.672913, 0, 1, 0.4588235, 1,
-0.2305412, 0.01288111, -0.8217778, 0, 1, 0.4666667, 1,
-0.2285607, -1.294659, -4.042641, 0, 1, 0.4705882, 1,
-0.2276228, -1.833957, -2.344364, 0, 1, 0.4784314, 1,
-0.2273469, 0.9865382, 2.652588, 0, 1, 0.4823529, 1,
-0.2266257, -0.4112737, -3.27073, 0, 1, 0.4901961, 1,
-0.2223006, -0.5370981, -3.402689, 0, 1, 0.4941176, 1,
-0.2169282, -0.4925198, -2.45735, 0, 1, 0.5019608, 1,
-0.2147572, -1.269956, -2.262306, 0, 1, 0.509804, 1,
-0.213554, -1.467745, -3.380118, 0, 1, 0.5137255, 1,
-0.2078367, 1.021053, 0.3790475, 0, 1, 0.5215687, 1,
-0.2065148, 0.5081622, 0.6858153, 0, 1, 0.5254902, 1,
-0.2064905, 2.052553, 0.1180202, 0, 1, 0.5333334, 1,
-0.2063234, 0.7740076, 0.3059428, 0, 1, 0.5372549, 1,
-0.2055481, 1.264007, -0.7339206, 0, 1, 0.5450981, 1,
-0.2038315, -0.8983759, -3.555062, 0, 1, 0.5490196, 1,
-0.2028738, -0.4677735, -0.9500516, 0, 1, 0.5568628, 1,
-0.1931269, 1.414527, 0.6659953, 0, 1, 0.5607843, 1,
-0.1922184, -0.5455679, -4.110476, 0, 1, 0.5686275, 1,
-0.1901277, -0.02047512, -2.314941, 0, 1, 0.572549, 1,
-0.187666, 0.6791814, -1.482353, 0, 1, 0.5803922, 1,
-0.1852255, -1.355475, -2.710129, 0, 1, 0.5843138, 1,
-0.1851617, 1.049791, -0.5507875, 0, 1, 0.5921569, 1,
-0.1842919, -0.2686935, -0.8359827, 0, 1, 0.5960785, 1,
-0.1801121, 2.082838, -0.7587282, 0, 1, 0.6039216, 1,
-0.1781442, 0.2398596, -0.9713418, 0, 1, 0.6117647, 1,
-0.17796, -2.290089, -3.883474, 0, 1, 0.6156863, 1,
-0.1641597, 0.01940956, -0.5685242, 0, 1, 0.6235294, 1,
-0.1629778, 1.202183, -1.1854, 0, 1, 0.627451, 1,
-0.1620177, 1.650849, 1.077788, 0, 1, 0.6352941, 1,
-0.1594695, -0.5566838, -1.892008, 0, 1, 0.6392157, 1,
-0.1583312, -0.7671376, -2.680995, 0, 1, 0.6470588, 1,
-0.1557288, -0.2662757, -1.604819, 0, 1, 0.6509804, 1,
-0.1532183, -1.906552, -4.194653, 0, 1, 0.6588235, 1,
-0.1529079, 1.352026, -1.841992, 0, 1, 0.6627451, 1,
-0.152661, -1.327985, -3.018288, 0, 1, 0.6705883, 1,
-0.1510678, 0.06235729, -1.399413, 0, 1, 0.6745098, 1,
-0.1501087, 0.3140826, 0.06697229, 0, 1, 0.682353, 1,
-0.1500528, 0.4327442, -1.863339, 0, 1, 0.6862745, 1,
-0.1497595, -1.525201, -4.241775, 0, 1, 0.6941177, 1,
-0.1485177, -1.802858, -2.618324, 0, 1, 0.7019608, 1,
-0.1470205, 1.324, 0.7763478, 0, 1, 0.7058824, 1,
-0.1456151, -0.6885841, -4.969667, 0, 1, 0.7137255, 1,
-0.145195, -0.6732455, -3.914031, 0, 1, 0.7176471, 1,
-0.1413725, -0.2644833, -2.462085, 0, 1, 0.7254902, 1,
-0.1389991, -1.596503, -4.045544, 0, 1, 0.7294118, 1,
-0.135838, -0.6590691, -3.11371, 0, 1, 0.7372549, 1,
-0.1290489, -0.5767113, -2.241654, 0, 1, 0.7411765, 1,
-0.1283461, 1.213864, -0.8715201, 0, 1, 0.7490196, 1,
-0.1213012, -1.361905, -3.578309, 0, 1, 0.7529412, 1,
-0.1205518, -0.6967571, -4.314458, 0, 1, 0.7607843, 1,
-0.1160935, 0.3924719, -1.76391, 0, 1, 0.7647059, 1,
-0.1155059, -0.007200208, -0.7990767, 0, 1, 0.772549, 1,
-0.107473, -0.02742478, -2.996102, 0, 1, 0.7764706, 1,
-0.1041417, 0.1189366, -1.962327, 0, 1, 0.7843137, 1,
-0.1035273, 0.1456396, -0.892917, 0, 1, 0.7882353, 1,
-0.1004836, -0.2169359, -2.334598, 0, 1, 0.7960784, 1,
-0.09982572, -0.9298666, -2.792432, 0, 1, 0.8039216, 1,
-0.09832561, 0.02925782, -1.233834, 0, 1, 0.8078431, 1,
-0.09733691, -0.3488686, -2.283547, 0, 1, 0.8156863, 1,
-0.09402292, 2.168754, 0.4455434, 0, 1, 0.8196079, 1,
-0.09358954, 0.1229628, -0.1217821, 0, 1, 0.827451, 1,
-0.08758545, -0.01001577, -0.3985686, 0, 1, 0.8313726, 1,
-0.08625128, -1.220523, -2.159718, 0, 1, 0.8392157, 1,
-0.07976996, -0.6402995, -4.885169, 0, 1, 0.8431373, 1,
-0.07872774, -1.542735, -2.592955, 0, 1, 0.8509804, 1,
-0.07517699, -0.7697778, -3.276494, 0, 1, 0.854902, 1,
-0.07410929, 0.7211525, 2.478077, 0, 1, 0.8627451, 1,
-0.07196914, 0.297929, 0.7313958, 0, 1, 0.8666667, 1,
-0.07123382, -0.2012852, -2.346915, 0, 1, 0.8745098, 1,
-0.07020906, 0.3205633, -1.728391, 0, 1, 0.8784314, 1,
-0.06949794, 0.1852771, -1.54425, 0, 1, 0.8862745, 1,
-0.06418005, 0.6762149, -2.035923, 0, 1, 0.8901961, 1,
-0.06275398, 0.2126614, -1.87295, 0, 1, 0.8980392, 1,
-0.05990648, 0.0716759, 0.3298492, 0, 1, 0.9058824, 1,
-0.04767856, -0.8266142, -3.007677, 0, 1, 0.9098039, 1,
-0.04748004, -1.563965, -3.291314, 0, 1, 0.9176471, 1,
-0.04649335, 0.5505879, -0.5979032, 0, 1, 0.9215686, 1,
-0.041882, 0.7415158, 0.8000596, 0, 1, 0.9294118, 1,
-0.04156079, 0.370172, -0.5186462, 0, 1, 0.9333333, 1,
-0.03993499, -0.3428483, -0.7003964, 0, 1, 0.9411765, 1,
-0.03455498, -0.3367111, -2.949387, 0, 1, 0.945098, 1,
-0.03183832, 0.1285965, 1.014477, 0, 1, 0.9529412, 1,
-0.0262144, -0.449097, -2.221868, 0, 1, 0.9568627, 1,
-0.02139479, 0.4993113, 0.3632942, 0, 1, 0.9647059, 1,
-0.02096727, -1.94647, -2.65792, 0, 1, 0.9686275, 1,
-0.01561431, -0.9274489, -2.240479, 0, 1, 0.9764706, 1,
-0.01440084, 0.386385, -0.4689524, 0, 1, 0.9803922, 1,
-0.01170811, -0.4855079, -3.191803, 0, 1, 0.9882353, 1,
-0.006696428, -0.09636826, -2.676159, 0, 1, 0.9921569, 1,
-0.001762523, -0.2545692, -3.489585, 0, 1, 1, 1,
0.001088043, 1.782305, 0.008057652, 0, 0.9921569, 1, 1,
0.003488339, -1.424567, 3.320923, 0, 0.9882353, 1, 1,
0.006078096, -0.5977885, 3.886187, 0, 0.9803922, 1, 1,
0.007885681, 0.8979208, 0.2650154, 0, 0.9764706, 1, 1,
0.01000256, -1.181505, 1.527541, 0, 0.9686275, 1, 1,
0.01254233, 0.3154314, 1.136457, 0, 0.9647059, 1, 1,
0.0154883, -0.85545, 1.033495, 0, 0.9568627, 1, 1,
0.01658723, 1.035842, -0.4707527, 0, 0.9529412, 1, 1,
0.02077061, 0.02038775, 0.00800706, 0, 0.945098, 1, 1,
0.0236057, -0.4708216, 4.238352, 0, 0.9411765, 1, 1,
0.02421778, -0.1264189, 3.146938, 0, 0.9333333, 1, 1,
0.03021335, 0.6332611, -0.108198, 0, 0.9294118, 1, 1,
0.0306494, -0.2413168, 5.041041, 0, 0.9215686, 1, 1,
0.03813718, 1.001322, -0.02750565, 0, 0.9176471, 1, 1,
0.03868858, -0.6775978, 3.585394, 0, 0.9098039, 1, 1,
0.03962542, -1.764724, 2.808433, 0, 0.9058824, 1, 1,
0.04100002, 1.0422, 1.513844, 0, 0.8980392, 1, 1,
0.04110911, -0.1924815, 2.734796, 0, 0.8901961, 1, 1,
0.04111309, 0.2253647, 1.251533, 0, 0.8862745, 1, 1,
0.04205481, 1.091995, 0.3218792, 0, 0.8784314, 1, 1,
0.04538476, 0.159265, 0.930185, 0, 0.8745098, 1, 1,
0.04859699, 0.8301904, 1.335083, 0, 0.8666667, 1, 1,
0.05050723, -0.8553743, 1.576617, 0, 0.8627451, 1, 1,
0.05389708, -0.4657149, 3.210774, 0, 0.854902, 1, 1,
0.05670585, -1.480033, 1.501642, 0, 0.8509804, 1, 1,
0.05836465, 0.338066, 0.04722833, 0, 0.8431373, 1, 1,
0.0591836, -0.7552027, 2.396238, 0, 0.8392157, 1, 1,
0.05966322, 0.961445, 0.3051037, 0, 0.8313726, 1, 1,
0.06040208, -0.5047896, 1.188555, 0, 0.827451, 1, 1,
0.06119677, -0.4727507, 2.21917, 0, 0.8196079, 1, 1,
0.06352618, 0.9069411, -1.392267, 0, 0.8156863, 1, 1,
0.06513485, -1.776819, 3.94698, 0, 0.8078431, 1, 1,
0.06550699, -0.478367, 2.988892, 0, 0.8039216, 1, 1,
0.06679233, -0.1649765, 4.068787, 0, 0.7960784, 1, 1,
0.0686463, -0.743274, 2.262047, 0, 0.7882353, 1, 1,
0.07369152, 0.733622, -0.5007209, 0, 0.7843137, 1, 1,
0.08233994, 0.6684245, 0.5994712, 0, 0.7764706, 1, 1,
0.08979421, -1.870138, 3.243817, 0, 0.772549, 1, 1,
0.08991402, -0.864872, 3.169208, 0, 0.7647059, 1, 1,
0.0905657, 0.1357815, 0.8514742, 0, 0.7607843, 1, 1,
0.09141355, 0.7750796, -1.727775, 0, 0.7529412, 1, 1,
0.09204279, -0.8713037, 4.300642, 0, 0.7490196, 1, 1,
0.09275354, 0.5609746, -1.829001, 0, 0.7411765, 1, 1,
0.09392947, 0.7165676, -1.547756, 0, 0.7372549, 1, 1,
0.09520321, 0.1877678, 0.05550972, 0, 0.7294118, 1, 1,
0.09749603, -2.150569, 2.992603, 0, 0.7254902, 1, 1,
0.09983379, 1.470264, -0.2307051, 0, 0.7176471, 1, 1,
0.1030072, 0.1494119, 2.096906, 0, 0.7137255, 1, 1,
0.10325, 0.9355453, -0.3037236, 0, 0.7058824, 1, 1,
0.1100803, -1.529529, 4.231593, 0, 0.6980392, 1, 1,
0.1213662, 0.3181893, 0.07176903, 0, 0.6941177, 1, 1,
0.1251131, -0.7933043, 4.350688, 0, 0.6862745, 1, 1,
0.1263565, -1.936496, 4.385974, 0, 0.682353, 1, 1,
0.1303658, -0.585375, 1.133347, 0, 0.6745098, 1, 1,
0.1309843, 0.08667012, 0.5590848, 0, 0.6705883, 1, 1,
0.1366031, 0.7753881, -0.1462408, 0, 0.6627451, 1, 1,
0.143681, -2.278032, 2.902362, 0, 0.6588235, 1, 1,
0.1450292, -0.4921799, 3.18958, 0, 0.6509804, 1, 1,
0.147291, -0.1665408, 2.337718, 0, 0.6470588, 1, 1,
0.1518746, -1.713466, 2.507231, 0, 0.6392157, 1, 1,
0.1529387, 1.548656, -0.353559, 0, 0.6352941, 1, 1,
0.1548104, -2.625051, 3.792697, 0, 0.627451, 1, 1,
0.1550301, 0.6513906, 0.5411816, 0, 0.6235294, 1, 1,
0.1657168, -2.575804, 2.40166, 0, 0.6156863, 1, 1,
0.1674781, -0.8519195, 3.22404, 0, 0.6117647, 1, 1,
0.1725081, -0.1812402, 1.801268, 0, 0.6039216, 1, 1,
0.1741421, -0.3606128, 2.893828, 0, 0.5960785, 1, 1,
0.1806453, 2.420464, 2.40963, 0, 0.5921569, 1, 1,
0.1824184, 2.210217, 0.3530132, 0, 0.5843138, 1, 1,
0.1868425, 1.327221, 1.022496, 0, 0.5803922, 1, 1,
0.1939895, -0.5560834, 3.900054, 0, 0.572549, 1, 1,
0.2052777, 0.1818588, 1.773886, 0, 0.5686275, 1, 1,
0.2067208, 1.284527, 1.376129, 0, 0.5607843, 1, 1,
0.2083482, -0.4009443, 1.263795, 0, 0.5568628, 1, 1,
0.2119872, -0.8244206, 2.856963, 0, 0.5490196, 1, 1,
0.2126199, -0.005560889, 0.4471272, 0, 0.5450981, 1, 1,
0.212869, 0.3166226, 0.7313566, 0, 0.5372549, 1, 1,
0.2130021, 0.9101385, 0.1158778, 0, 0.5333334, 1, 1,
0.2140847, 2.255483, -0.3633277, 0, 0.5254902, 1, 1,
0.2203943, -1.328251, 1.873634, 0, 0.5215687, 1, 1,
0.220964, -0.3652129, 3.186033, 0, 0.5137255, 1, 1,
0.2277931, -0.4130102, 2.803272, 0, 0.509804, 1, 1,
0.2310845, 1.471822, -0.2513782, 0, 0.5019608, 1, 1,
0.2355737, 2.015874, -0.07121696, 0, 0.4941176, 1, 1,
0.2381431, -0.2691243, 2.949052, 0, 0.4901961, 1, 1,
0.2384823, -0.8717003, 2.036159, 0, 0.4823529, 1, 1,
0.2391153, 1.58043, 2.397912, 0, 0.4784314, 1, 1,
0.2401213, -0.3489561, 2.141039, 0, 0.4705882, 1, 1,
0.241604, -2.035006, 2.508373, 0, 0.4666667, 1, 1,
0.2443051, -0.2217209, 2.92953, 0, 0.4588235, 1, 1,
0.2458775, -0.03586267, 1.785414, 0, 0.454902, 1, 1,
0.2486834, 2.662182, -0.4964114, 0, 0.4470588, 1, 1,
0.2509205, 1.463898, -0.231698, 0, 0.4431373, 1, 1,
0.2534665, -0.8681312, 4.366566, 0, 0.4352941, 1, 1,
0.2541279, 0.5839154, -1.437989, 0, 0.4313726, 1, 1,
0.2543204, -0.5777342, 2.509269, 0, 0.4235294, 1, 1,
0.2553598, -0.9161494, 2.069689, 0, 0.4196078, 1, 1,
0.2646245, -0.3459168, 2.395671, 0, 0.4117647, 1, 1,
0.2666622, -0.4269609, 1.913742, 0, 0.4078431, 1, 1,
0.2719132, 0.2082374, 0.7922515, 0, 0.4, 1, 1,
0.2727547, -0.3111013, 1.914713, 0, 0.3921569, 1, 1,
0.274679, -0.3752399, 4.723116, 0, 0.3882353, 1, 1,
0.2775806, 0.6884391, 1.233079, 0, 0.3803922, 1, 1,
0.2801187, -1.675051, 3.644974, 0, 0.3764706, 1, 1,
0.2814885, 0.3305777, 1.54031, 0, 0.3686275, 1, 1,
0.2822635, 1.542588, -0.7060228, 0, 0.3647059, 1, 1,
0.2836524, 0.6383417, 1.408303, 0, 0.3568628, 1, 1,
0.2877665, 0.790599, 1.447059, 0, 0.3529412, 1, 1,
0.2912165, -0.4952874, 3.518271, 0, 0.345098, 1, 1,
0.2928459, -0.06386819, 1.4076, 0, 0.3411765, 1, 1,
0.2968065, 1.615056, 0.5885078, 0, 0.3333333, 1, 1,
0.2977001, -0.4319047, 2.582057, 0, 0.3294118, 1, 1,
0.2995239, 1.361617, -0.8702041, 0, 0.3215686, 1, 1,
0.3042531, 0.6957856, 0.3886257, 0, 0.3176471, 1, 1,
0.3074236, -0.456206, 5.020596, 0, 0.3098039, 1, 1,
0.3129263, 0.1253747, 3.084929, 0, 0.3058824, 1, 1,
0.3182702, -0.7623371, 2.270849, 0, 0.2980392, 1, 1,
0.3231384, -1.233142, 3.639369, 0, 0.2901961, 1, 1,
0.3258066, -0.8798754, 2.951926, 0, 0.2862745, 1, 1,
0.3258585, 0.9376479, 0.8643003, 0, 0.2784314, 1, 1,
0.3266929, -0.8422848, 4.812669, 0, 0.2745098, 1, 1,
0.3288484, 1.034772, 0.559866, 0, 0.2666667, 1, 1,
0.3291178, 1.202343, 0.2503404, 0, 0.2627451, 1, 1,
0.333699, -0.96012, 2.119812, 0, 0.254902, 1, 1,
0.3341581, 0.3841031, 0.4934667, 0, 0.2509804, 1, 1,
0.336191, 0.8253664, 0.651409, 0, 0.2431373, 1, 1,
0.3388201, 1.632008, -0.4458612, 0, 0.2392157, 1, 1,
0.3390805, -0.7102783, 2.331436, 0, 0.2313726, 1, 1,
0.3456136, -1.264248, 3.786246, 0, 0.227451, 1, 1,
0.3466045, 0.3075716, 2.172813, 0, 0.2196078, 1, 1,
0.3506133, -0.9165934, 3.396317, 0, 0.2156863, 1, 1,
0.3524321, 0.1484465, 0.7158149, 0, 0.2078431, 1, 1,
0.3581781, -0.1992478, 4.019607, 0, 0.2039216, 1, 1,
0.3599144, -1.070694, 3.087669, 0, 0.1960784, 1, 1,
0.374551, 0.718518, -0.2247564, 0, 0.1882353, 1, 1,
0.3747951, 0.5836576, -1.216598, 0, 0.1843137, 1, 1,
0.3800082, -0.5620514, 1.280711, 0, 0.1764706, 1, 1,
0.3802865, 0.8316287, 2.257833, 0, 0.172549, 1, 1,
0.3813684, 2.194662, 0.581744, 0, 0.1647059, 1, 1,
0.3838663, -0.2641962, 2.427254, 0, 0.1607843, 1, 1,
0.3856133, 0.755014, 0.8717118, 0, 0.1529412, 1, 1,
0.3877972, 0.7598183, 0.3075927, 0, 0.1490196, 1, 1,
0.3892443, -0.08750195, 0.2445544, 0, 0.1411765, 1, 1,
0.3915804, 0.790369, 1.594487, 0, 0.1372549, 1, 1,
0.3917547, -1.262308, 3.508502, 0, 0.1294118, 1, 1,
0.3986401, -0.6220916, 3.009571, 0, 0.1254902, 1, 1,
0.4010726, 1.11416, 2.356571, 0, 0.1176471, 1, 1,
0.4016742, 0.352087, 1.809579, 0, 0.1137255, 1, 1,
0.4182212, 0.4566015, 0.3435917, 0, 0.1058824, 1, 1,
0.4224502, 1.466561, -2.053096, 0, 0.09803922, 1, 1,
0.4231167, 1.903763, 1.2953, 0, 0.09411765, 1, 1,
0.4231363, -0.7217343, 3.446899, 0, 0.08627451, 1, 1,
0.4281259, 0.2346025, -1.156566, 0, 0.08235294, 1, 1,
0.4333621, 0.2842217, 0.7593597, 0, 0.07450981, 1, 1,
0.4352949, 2.478423, 0.2382566, 0, 0.07058824, 1, 1,
0.4382375, 0.6465554, 2.592898, 0, 0.0627451, 1, 1,
0.4435244, -1.909943, 1.625775, 0, 0.05882353, 1, 1,
0.4439605, -0.6223385, 3.303336, 0, 0.05098039, 1, 1,
0.4479198, -0.2771549, 2.402945, 0, 0.04705882, 1, 1,
0.449338, 1.18667, -0.3989523, 0, 0.03921569, 1, 1,
0.4514585, -0.7458582, 4.232568, 0, 0.03529412, 1, 1,
0.4520714, -1.150206, 2.957426, 0, 0.02745098, 1, 1,
0.4551937, 0.07784819, 1.282135, 0, 0.02352941, 1, 1,
0.457023, -2.296274, 3.145106, 0, 0.01568628, 1, 1,
0.4578725, -1.073584, 3.126745, 0, 0.01176471, 1, 1,
0.4587775, 0.9166439, 0.9784287, 0, 0.003921569, 1, 1,
0.4593895, 0.3359104, 0.121487, 0.003921569, 0, 1, 1,
0.4645609, 1.079138, 0.1202303, 0.007843138, 0, 1, 1,
0.4673857, -1.571826, 1.036201, 0.01568628, 0, 1, 1,
0.4680753, 0.1448836, 2.703255, 0.01960784, 0, 1, 1,
0.4838675, -1.77298, 2.172509, 0.02745098, 0, 1, 1,
0.4848461, -0.9201769, 1.918415, 0.03137255, 0, 1, 1,
0.4853728, -0.8718354, 2.569128, 0.03921569, 0, 1, 1,
0.4872839, 1.97876, 1.167848, 0.04313726, 0, 1, 1,
0.4878128, 0.5314103, 0.924215, 0.05098039, 0, 1, 1,
0.4891923, 1.094297, -0.5378906, 0.05490196, 0, 1, 1,
0.4892151, 0.6897297, 0.7826151, 0.0627451, 0, 1, 1,
0.4898252, -1.706556, 3.680804, 0.06666667, 0, 1, 1,
0.4936092, -0.58511, 1.307837, 0.07450981, 0, 1, 1,
0.4942162, 1.080713, 1.75883, 0.07843138, 0, 1, 1,
0.4990507, -0.009265815, 3.743252, 0.08627451, 0, 1, 1,
0.4993848, 1.794809, 0.2162406, 0.09019608, 0, 1, 1,
0.5106415, 0.1784115, 1.937174, 0.09803922, 0, 1, 1,
0.5121875, 1.454548, 1.754949, 0.1058824, 0, 1, 1,
0.5155821, -1.899353, 4.244909, 0.1098039, 0, 1, 1,
0.5182342, 0.8569404, 1.671772, 0.1176471, 0, 1, 1,
0.5186897, -0.3043253, 2.115355, 0.1215686, 0, 1, 1,
0.5244908, 1.803124, 1.686134, 0.1294118, 0, 1, 1,
0.5258734, -1.169581, 2.401374, 0.1333333, 0, 1, 1,
0.5286371, -1.560582, 3.631326, 0.1411765, 0, 1, 1,
0.5310318, -0.8202925, 3.78666, 0.145098, 0, 1, 1,
0.5350563, -0.7807819, 2.791067, 0.1529412, 0, 1, 1,
0.5355855, -0.1476512, 2.39096, 0.1568628, 0, 1, 1,
0.5375097, 1.428878, -0.08503629, 0.1647059, 0, 1, 1,
0.5394568, 0.2527032, 0.9865617, 0.1686275, 0, 1, 1,
0.5405306, 1.3353, 0.2314401, 0.1764706, 0, 1, 1,
0.5437854, -0.04026759, 2.874696, 0.1803922, 0, 1, 1,
0.5457217, -1.124057, 2.683601, 0.1882353, 0, 1, 1,
0.5484852, 0.9052522, 0.3554927, 0.1921569, 0, 1, 1,
0.5512169, 1.106127, -0.2899915, 0.2, 0, 1, 1,
0.5523917, 1.283041, -0.2936835, 0.2078431, 0, 1, 1,
0.5551991, -1.08907, 3.313481, 0.2117647, 0, 1, 1,
0.556024, -0.7941244, 2.190632, 0.2196078, 0, 1, 1,
0.5575644, -0.8039114, 1.862403, 0.2235294, 0, 1, 1,
0.5579848, 0.399614, 1.961133, 0.2313726, 0, 1, 1,
0.5637205, -1.526688, 1.777586, 0.2352941, 0, 1, 1,
0.5659147, 1.311713, 0.1626948, 0.2431373, 0, 1, 1,
0.5698676, -0.973707, 2.639138, 0.2470588, 0, 1, 1,
0.5721793, -0.7794813, 2.237841, 0.254902, 0, 1, 1,
0.5759183, -0.1857045, 1.307812, 0.2588235, 0, 1, 1,
0.5783175, 1.201052, 0.607465, 0.2666667, 0, 1, 1,
0.5840617, 0.7328662, 1.493735, 0.2705882, 0, 1, 1,
0.5882757, 1.093247, 0.605884, 0.2784314, 0, 1, 1,
0.5883759, 1.019749, 1.518714, 0.282353, 0, 1, 1,
0.5896606, 1.578891, 0.9647291, 0.2901961, 0, 1, 1,
0.5905457, -1.405422, 2.322006, 0.2941177, 0, 1, 1,
0.5961835, -0.2363976, 1.751002, 0.3019608, 0, 1, 1,
0.5963815, 0.2441193, 3.036902, 0.3098039, 0, 1, 1,
0.5966175, 0.2698061, 0.03751947, 0.3137255, 0, 1, 1,
0.5996753, -1.465748, 2.605634, 0.3215686, 0, 1, 1,
0.6097748, -0.7197251, 4.88269, 0.3254902, 0, 1, 1,
0.6199068, 0.8348154, -0.05461647, 0.3333333, 0, 1, 1,
0.6262524, 0.1973424, 0.2268324, 0.3372549, 0, 1, 1,
0.627046, -0.0261913, 0.4633206, 0.345098, 0, 1, 1,
0.629469, 1.297125, 1.506307, 0.3490196, 0, 1, 1,
0.6312873, 1.214535, -0.5008513, 0.3568628, 0, 1, 1,
0.6330451, 2.04461, 0.3161257, 0.3607843, 0, 1, 1,
0.6346079, -1.405302, 1.798517, 0.3686275, 0, 1, 1,
0.637676, -2.886568, 3.637395, 0.372549, 0, 1, 1,
0.638414, -0.9649379, 1.918281, 0.3803922, 0, 1, 1,
0.6431211, 0.4308997, 1.422023, 0.3843137, 0, 1, 1,
0.6462549, 0.2189768, 1.430965, 0.3921569, 0, 1, 1,
0.6462558, 1.203678, -1.040083, 0.3960784, 0, 1, 1,
0.6506587, -0.4814762, 1.840392, 0.4039216, 0, 1, 1,
0.6553368, 2.849697, -0.5722646, 0.4117647, 0, 1, 1,
0.6571976, 0.3192545, 1.557798, 0.4156863, 0, 1, 1,
0.6635069, 0.3510843, -0.02147225, 0.4235294, 0, 1, 1,
0.6724389, 0.6184571, 2.038238, 0.427451, 0, 1, 1,
0.6765895, 0.1781497, -1.204373, 0.4352941, 0, 1, 1,
0.6780363, 1.391672, -0.6516919, 0.4392157, 0, 1, 1,
0.6804841, 0.7370104, 0.1210384, 0.4470588, 0, 1, 1,
0.6813982, -0.7616565, 2.20024, 0.4509804, 0, 1, 1,
0.6851896, -0.8234904, 2.510437, 0.4588235, 0, 1, 1,
0.6852639, -1.381371, 3.11599, 0.4627451, 0, 1, 1,
0.6879011, 2.010819, -0.6325291, 0.4705882, 0, 1, 1,
0.6900442, 0.814914, -1.302384, 0.4745098, 0, 1, 1,
0.6901758, 0.009262335, 1.836672, 0.4823529, 0, 1, 1,
0.69073, 0.1053109, 1.955642, 0.4862745, 0, 1, 1,
0.6918101, -0.4647542, 1.881197, 0.4941176, 0, 1, 1,
0.6948035, -0.4098871, 1.856401, 0.5019608, 0, 1, 1,
0.7026983, -0.01808731, 1.389303, 0.5058824, 0, 1, 1,
0.7069991, -0.6350421, 1.639733, 0.5137255, 0, 1, 1,
0.7104401, -0.5627652, 4.49071, 0.5176471, 0, 1, 1,
0.7141892, 0.3784884, 0.2129059, 0.5254902, 0, 1, 1,
0.7204161, -0.3922202, 2.704202, 0.5294118, 0, 1, 1,
0.7225155, 1.242686, -0.7871235, 0.5372549, 0, 1, 1,
0.7346417, -0.7383288, 1.620857, 0.5411765, 0, 1, 1,
0.7409603, -0.1604481, 2.143387, 0.5490196, 0, 1, 1,
0.7508512, -1.234083, 4.640461, 0.5529412, 0, 1, 1,
0.7560133, 1.007533, 1.672586, 0.5607843, 0, 1, 1,
0.7631528, -0.7189415, 2.63442, 0.5647059, 0, 1, 1,
0.7667806, 0.4909638, 1.266423, 0.572549, 0, 1, 1,
0.7711473, -1.128316, 4.634202, 0.5764706, 0, 1, 1,
0.7723617, 1.526105, 0.3677797, 0.5843138, 0, 1, 1,
0.7753296, -1.107763, 2.637913, 0.5882353, 0, 1, 1,
0.7821048, -1.19035, 4.066124, 0.5960785, 0, 1, 1,
0.7880089, -0.7308082, 2.620814, 0.6039216, 0, 1, 1,
0.7948976, -0.7976504, 1.032151, 0.6078432, 0, 1, 1,
0.7991834, -0.509966, 2.58446, 0.6156863, 0, 1, 1,
0.8004414, -1.3384, 1.365315, 0.6196079, 0, 1, 1,
0.8027464, 0.1012253, 1.127104, 0.627451, 0, 1, 1,
0.8036615, -1.136446, 2.815483, 0.6313726, 0, 1, 1,
0.8053536, -0.3680801, -0.7656505, 0.6392157, 0, 1, 1,
0.8064746, 0.2487544, 1.238113, 0.6431373, 0, 1, 1,
0.8111395, 0.167211, 1.329265, 0.6509804, 0, 1, 1,
0.8165457, 0.04712592, -0.2642497, 0.654902, 0, 1, 1,
0.8198735, -0.1573918, 1.731268, 0.6627451, 0, 1, 1,
0.8215076, -1.058058, 1.501198, 0.6666667, 0, 1, 1,
0.8244928, -0.3200307, 1.608822, 0.6745098, 0, 1, 1,
0.8258979, 1.519956, 1.209425, 0.6784314, 0, 1, 1,
0.8260707, 0.07123674, 1.141443, 0.6862745, 0, 1, 1,
0.830884, -1.762524, 2.019375, 0.6901961, 0, 1, 1,
0.8352318, -0.2262794, 3.619916, 0.6980392, 0, 1, 1,
0.8390468, 0.5385698, 1.051733, 0.7058824, 0, 1, 1,
0.8409037, -0.4808992, 0.6998251, 0.7098039, 0, 1, 1,
0.8428264, -2.149074, 2.980671, 0.7176471, 0, 1, 1,
0.8498997, 2.811421, -0.4189861, 0.7215686, 0, 1, 1,
0.8555465, 0.6686853, 0.2282304, 0.7294118, 0, 1, 1,
0.8566853, 0.03686263, 2.988287, 0.7333333, 0, 1, 1,
0.8600255, -0.4059568, 2.697934, 0.7411765, 0, 1, 1,
0.86353, -1.066119, 3.474369, 0.7450981, 0, 1, 1,
0.8655043, 0.01040291, 1.307744, 0.7529412, 0, 1, 1,
0.8676506, -1.188963, 0.2138262, 0.7568628, 0, 1, 1,
0.8676673, -0.556453, 2.638632, 0.7647059, 0, 1, 1,
0.8858923, -1.201558, 4.044123, 0.7686275, 0, 1, 1,
0.8888035, 0.3229606, -0.6660876, 0.7764706, 0, 1, 1,
0.8918101, -0.7112526, 4.121459, 0.7803922, 0, 1, 1,
0.8925684, -1.073164, 0.5548526, 0.7882353, 0, 1, 1,
0.902098, -0.4578521, 2.077197, 0.7921569, 0, 1, 1,
0.9033166, 0.01945975, 1.560443, 0.8, 0, 1, 1,
0.9046679, -1.054624, 2.970962, 0.8078431, 0, 1, 1,
0.9100752, -1.350617, 1.983106, 0.8117647, 0, 1, 1,
0.9141549, -0.5672438, 1.817007, 0.8196079, 0, 1, 1,
0.9203521, 0.9236624, -1.128444, 0.8235294, 0, 1, 1,
0.9205281, -1.135494, -0.0107546, 0.8313726, 0, 1, 1,
0.9218683, 0.5216306, -0.8652097, 0.8352941, 0, 1, 1,
0.9260486, 0.5787894, 1.205886, 0.8431373, 0, 1, 1,
0.9274386, 1.004481, 2.441423, 0.8470588, 0, 1, 1,
0.9297872, 1.588963, 0.712545, 0.854902, 0, 1, 1,
0.9300875, 0.05383182, 0.8568858, 0.8588235, 0, 1, 1,
0.9326016, 1.234421, -0.1609926, 0.8666667, 0, 1, 1,
0.9353938, 1.35409, 1.245396, 0.8705882, 0, 1, 1,
0.9354863, 0.8159262, 0.9067807, 0.8784314, 0, 1, 1,
0.9370161, -0.6916299, 1.3561, 0.8823529, 0, 1, 1,
0.9435874, 0.2250939, 1.775437, 0.8901961, 0, 1, 1,
0.9476888, -1.071474, 1.009352, 0.8941177, 0, 1, 1,
0.9496995, 2.106067, 1.049625, 0.9019608, 0, 1, 1,
0.9515591, 0.4732536, 2.959924, 0.9098039, 0, 1, 1,
0.9588366, 1.484038, 0.8906358, 0.9137255, 0, 1, 1,
0.9685504, 0.3036274, 0.242082, 0.9215686, 0, 1, 1,
0.9692501, -2.506453, 2.192715, 0.9254902, 0, 1, 1,
0.9828692, -0.6830152, 2.285902, 0.9333333, 0, 1, 1,
0.9959332, 1.073311, 1.164727, 0.9372549, 0, 1, 1,
0.996348, 0.9057024, 1.762401, 0.945098, 0, 1, 1,
0.9970798, -1.10098, 1.646765, 0.9490196, 0, 1, 1,
0.9994171, 0.541443, 1.761602, 0.9568627, 0, 1, 1,
1.001522, -0.6912638, 1.98657, 0.9607843, 0, 1, 1,
1.00604, -0.01347642, 0.6637976, 0.9686275, 0, 1, 1,
1.006075, 0.3761119, 1.385553, 0.972549, 0, 1, 1,
1.00657, -0.02432988, 1.768839, 0.9803922, 0, 1, 1,
1.007117, 1.309877, 0.3216215, 0.9843137, 0, 1, 1,
1.026281, -0.6114109, 3.75977, 0.9921569, 0, 1, 1,
1.030692, -0.1454547, 1.253776, 0.9960784, 0, 1, 1,
1.03477, 0.6924514, 0.7631758, 1, 0, 0.9960784, 1,
1.041094, 1.767537, 0.4412161, 1, 0, 0.9882353, 1,
1.043168, -1.247528, 1.386441, 1, 0, 0.9843137, 1,
1.044334, 0.4283882, 0.8777496, 1, 0, 0.9764706, 1,
1.047887, 1.722351, -0.196068, 1, 0, 0.972549, 1,
1.048204, -0.4947637, 1.398982, 1, 0, 0.9647059, 1,
1.050737, -1.14716, 3.387636, 1, 0, 0.9607843, 1,
1.05724, -0.8151138, 3.974175, 1, 0, 0.9529412, 1,
1.057989, 0.8318397, 0.09377078, 1, 0, 0.9490196, 1,
1.059939, 2.527556, -0.9575299, 1, 0, 0.9411765, 1,
1.063159, 1.487872, 0.4263606, 1, 0, 0.9372549, 1,
1.074811, -0.2797043, 1.636008, 1, 0, 0.9294118, 1,
1.09036, 1.446714, 0.1580899, 1, 0, 0.9254902, 1,
1.100996, -0.007958024, 0.2007371, 1, 0, 0.9176471, 1,
1.102614, -1.294016, 4.57293, 1, 0, 0.9137255, 1,
1.103435, -0.603247, 2.170883, 1, 0, 0.9058824, 1,
1.105609, -0.1398756, -1.308791, 1, 0, 0.9019608, 1,
1.105919, -1.610898, 1.501299, 1, 0, 0.8941177, 1,
1.107589, -0.9497679, 1.129168, 1, 0, 0.8862745, 1,
1.112064, 1.139272, 1.765883, 1, 0, 0.8823529, 1,
1.115132, -0.8213041, 2.732865, 1, 0, 0.8745098, 1,
1.127793, -0.59269, 1.819103, 1, 0, 0.8705882, 1,
1.128914, 0.1116854, 1.707257, 1, 0, 0.8627451, 1,
1.133116, -0.8348094, 1.038367, 1, 0, 0.8588235, 1,
1.134944, 0.5575761, 1.290237, 1, 0, 0.8509804, 1,
1.135278, 0.7316056, 1.380948, 1, 0, 0.8470588, 1,
1.138073, -0.6019087, 1.641148, 1, 0, 0.8392157, 1,
1.147519, 0.3884363, 0.3322967, 1, 0, 0.8352941, 1,
1.150728, -0.398534, 2.756953, 1, 0, 0.827451, 1,
1.150768, 1.103276, 0.09829757, 1, 0, 0.8235294, 1,
1.151158, 0.2303561, 0.05260872, 1, 0, 0.8156863, 1,
1.151708, 0.4211592, 0.971274, 1, 0, 0.8117647, 1,
1.154349, 0.09150656, 1.482004, 1, 0, 0.8039216, 1,
1.154819, -1.401058, 0.9444709, 1, 0, 0.7960784, 1,
1.168126, -1.578563, 4.666459, 1, 0, 0.7921569, 1,
1.168782, 0.4912178, 1.03565, 1, 0, 0.7843137, 1,
1.170384, -1.314131, 1.84772, 1, 0, 0.7803922, 1,
1.170457, 0.8715994, 1.61715, 1, 0, 0.772549, 1,
1.1769, -0.1032394, 0.8269414, 1, 0, 0.7686275, 1,
1.189414, -1.092489, 2.328148, 1, 0, 0.7607843, 1,
1.195399, 0.2469482, 1.004967, 1, 0, 0.7568628, 1,
1.196795, -1.021561, 0.05724018, 1, 0, 0.7490196, 1,
1.197291, 0.3107935, 1.510238, 1, 0, 0.7450981, 1,
1.199488, 1.468127, 0.97161, 1, 0, 0.7372549, 1,
1.201483, 0.5190014, 2.635885, 1, 0, 0.7333333, 1,
1.201485, 2.863656, 2.666816, 1, 0, 0.7254902, 1,
1.21341, -2.243241, 3.880205, 1, 0, 0.7215686, 1,
1.226886, -0.6797579, 0.5751618, 1, 0, 0.7137255, 1,
1.233717, 2.360367, 0.3058866, 1, 0, 0.7098039, 1,
1.234263, 0.2862319, 1.458556, 1, 0, 0.7019608, 1,
1.236144, 1.722798, 2.074062, 1, 0, 0.6941177, 1,
1.238832, 1.456454, 0.1299775, 1, 0, 0.6901961, 1,
1.240679, -1.836857, 3.899566, 1, 0, 0.682353, 1,
1.246457, 0.1124492, 1.675474, 1, 0, 0.6784314, 1,
1.25189, -0.01716109, 1.093053, 1, 0, 0.6705883, 1,
1.255987, -0.1269312, 1.008621, 1, 0, 0.6666667, 1,
1.261363, 0.009643862, 3.023142, 1, 0, 0.6588235, 1,
1.269724, 0.6856426, -0.04542291, 1, 0, 0.654902, 1,
1.270676, 0.7430667, 0.6947988, 1, 0, 0.6470588, 1,
1.275244, -0.1713814, 2.615864, 1, 0, 0.6431373, 1,
1.281954, -0.6859353, 1.601357, 1, 0, 0.6352941, 1,
1.286676, -0.7876974, 2.716085, 1, 0, 0.6313726, 1,
1.290664, 1.270962, 2.19275, 1, 0, 0.6235294, 1,
1.294763, -1.115756, 3.243664, 1, 0, 0.6196079, 1,
1.297639, -0.9303933, 2.692631, 1, 0, 0.6117647, 1,
1.307274, 0.3068472, 1.038517, 1, 0, 0.6078432, 1,
1.309772, -0.2209025, 2.165827, 1, 0, 0.6, 1,
1.321356, -0.2072612, 3.232282, 1, 0, 0.5921569, 1,
1.338448, -1.403562, 3.554649, 1, 0, 0.5882353, 1,
1.339884, 0.2865287, 0.2657473, 1, 0, 0.5803922, 1,
1.344982, 0.1210046, 1.305174, 1, 0, 0.5764706, 1,
1.367383, -1.198911, 3.127428, 1, 0, 0.5686275, 1,
1.367435, 1.395332, 0.1040025, 1, 0, 0.5647059, 1,
1.370211, -0.9382226, 1.948438, 1, 0, 0.5568628, 1,
1.372455, -1.591137, 1.449475, 1, 0, 0.5529412, 1,
1.372758, -0.7442368, 3.148188, 1, 0, 0.5450981, 1,
1.377244, 0.1856693, 1.932728, 1, 0, 0.5411765, 1,
1.378776, -0.8772671, 1.552427, 1, 0, 0.5333334, 1,
1.396585, -0.2362232, 3.549969, 1, 0, 0.5294118, 1,
1.397714, -0.292298, 1.615487, 1, 0, 0.5215687, 1,
1.398592, 1.016139, 1.984485, 1, 0, 0.5176471, 1,
1.401651, -0.5877461, 1.146465, 1, 0, 0.509804, 1,
1.402217, -0.2226215, 0.5040773, 1, 0, 0.5058824, 1,
1.408544, -0.02250165, 1.30118, 1, 0, 0.4980392, 1,
1.413222, -0.159401, 1.056123, 1, 0, 0.4901961, 1,
1.446208, 1.402473, -0.2808279, 1, 0, 0.4862745, 1,
1.4656, -0.5913996, 1.984917, 1, 0, 0.4784314, 1,
1.468222, 0.06504212, 2.555838, 1, 0, 0.4745098, 1,
1.469473, -0.7744418, 2.640802, 1, 0, 0.4666667, 1,
1.469677, 0.2154934, 2.15764, 1, 0, 0.4627451, 1,
1.473799, 1.854667, 0.9273134, 1, 0, 0.454902, 1,
1.475055, -0.5074548, 0.9771687, 1, 0, 0.4509804, 1,
1.476778, -0.5576414, 0.8399393, 1, 0, 0.4431373, 1,
1.477742, -1.544238, 1.527852, 1, 0, 0.4392157, 1,
1.508421, -1.80261, 3.80485, 1, 0, 0.4313726, 1,
1.516804, -0.5920701, 3.29968, 1, 0, 0.427451, 1,
1.517417, 1.647474, 1.316384, 1, 0, 0.4196078, 1,
1.528152, -0.4380646, 1.945313, 1, 0, 0.4156863, 1,
1.530034, 1.89913, -0.4362195, 1, 0, 0.4078431, 1,
1.531477, -1.773928, 1.956598, 1, 0, 0.4039216, 1,
1.535594, -0.5357466, 2.615711, 1, 0, 0.3960784, 1,
1.536925, 1.213122, 1.685294, 1, 0, 0.3882353, 1,
1.543362, -0.2346634, 0.841248, 1, 0, 0.3843137, 1,
1.550915, 0.06651311, 1.738771, 1, 0, 0.3764706, 1,
1.554655, -0.4047564, 0.809098, 1, 0, 0.372549, 1,
1.568183, 0.04700199, 2.746491, 1, 0, 0.3647059, 1,
1.575449, -1.8272, 2.235288, 1, 0, 0.3607843, 1,
1.577955, -0.3926287, 0.04081584, 1, 0, 0.3529412, 1,
1.590973, -0.3728618, 1.17577, 1, 0, 0.3490196, 1,
1.611625, 0.3875112, 1.102715, 1, 0, 0.3411765, 1,
1.616146, -0.07360358, 1.880027, 1, 0, 0.3372549, 1,
1.627295, -1.279351, 3.298777, 1, 0, 0.3294118, 1,
1.634717, 1.275147, 2.306909, 1, 0, 0.3254902, 1,
1.651446, 0.4395309, 0.7271577, 1, 0, 0.3176471, 1,
1.656715, -0.8384867, 0.728237, 1, 0, 0.3137255, 1,
1.685487, -1.169679, 3.52277, 1, 0, 0.3058824, 1,
1.687885, -0.1184776, 2.756305, 1, 0, 0.2980392, 1,
1.717932, 1.9869, 0.6235816, 1, 0, 0.2941177, 1,
1.747925, -0.6653063, 0.06550613, 1, 0, 0.2862745, 1,
1.758259, -1.890586, 3.425812, 1, 0, 0.282353, 1,
1.768666, -1.236966, 1.827259, 1, 0, 0.2745098, 1,
1.777054, -1.451044, 4.502735, 1, 0, 0.2705882, 1,
1.787921, 1.659431, 1.174325, 1, 0, 0.2627451, 1,
1.789273, 0.3265394, 1.156417, 1, 0, 0.2588235, 1,
1.79168, 0.9032307, 2.156204, 1, 0, 0.2509804, 1,
1.801606, -0.1608203, 2.253679, 1, 0, 0.2470588, 1,
1.811793, 0.323636, 1.747414, 1, 0, 0.2392157, 1,
1.813812, -0.8653232, 2.928815, 1, 0, 0.2352941, 1,
1.814892, -0.3855247, 1.795022, 1, 0, 0.227451, 1,
1.816298, -0.32075, 1.053935, 1, 0, 0.2235294, 1,
1.823804, 1.1103, 0.9355243, 1, 0, 0.2156863, 1,
1.828029, 0.01760785, 0.7193993, 1, 0, 0.2117647, 1,
1.848406, -1.005434, 3.329045, 1, 0, 0.2039216, 1,
1.861335, 0.6377478, 0.8152347, 1, 0, 0.1960784, 1,
1.862908, 0.2132643, -0.2973648, 1, 0, 0.1921569, 1,
1.864936, -0.9425878, 2.841949, 1, 0, 0.1843137, 1,
1.909364, 0.4151111, 1.879536, 1, 0, 0.1803922, 1,
1.921667, 0.6231189, -0.2056112, 1, 0, 0.172549, 1,
1.941811, 0.9760365, 1.881786, 1, 0, 0.1686275, 1,
1.967776, 0.2960258, 2.213122, 1, 0, 0.1607843, 1,
1.97032, -0.187041, 0.7112021, 1, 0, 0.1568628, 1,
1.970662, 0.2476367, 0.2703745, 1, 0, 0.1490196, 1,
2.000175, -0.1593837, 1.241062, 1, 0, 0.145098, 1,
2.008038, -1.388973, 1.272807, 1, 0, 0.1372549, 1,
2.016472, -0.3862039, -0.5319579, 1, 0, 0.1333333, 1,
2.01752, -0.1724585, 0.8168333, 1, 0, 0.1254902, 1,
2.033338, -0.04061187, 3.905201, 1, 0, 0.1215686, 1,
2.045532, -1.530426, 1.502688, 1, 0, 0.1137255, 1,
2.04785, 0.6252022, 0.4080331, 1, 0, 0.1098039, 1,
2.054808, 1.196892, 0.5978599, 1, 0, 0.1019608, 1,
2.055055, 0.3280592, 1.142424, 1, 0, 0.09411765, 1,
2.100941, -0.1490604, 2.708768, 1, 0, 0.09019608, 1,
2.116951, -0.4901598, 1.505243, 1, 0, 0.08235294, 1,
2.125081, 1.214387, 2.91885, 1, 0, 0.07843138, 1,
2.133533, 0.4560329, 1.632696, 1, 0, 0.07058824, 1,
2.155159, 1.276938, 0.9917049, 1, 0, 0.06666667, 1,
2.433028, -0.8764149, 3.061036, 1, 0, 0.05882353, 1,
2.481785, 1.024297, 0.4339653, 1, 0, 0.05490196, 1,
2.519339, -0.2264056, 1.520468, 1, 0, 0.04705882, 1,
2.525151, -1.181684, 0.3247314, 1, 0, 0.04313726, 1,
2.542739, 0.4575673, 1.272832, 1, 0, 0.03529412, 1,
2.556943, -0.674798, 3.366876, 1, 0, 0.03137255, 1,
2.704385, 1.397232, 1.534284, 1, 0, 0.02352941, 1,
2.950329, -0.9055397, 1.786112, 1, 0, 0.01960784, 1,
3.017906, -1.112632, 3.502463, 1, 0, 0.01176471, 1,
3.256117, -0.6694266, 4.243569, 1, 0, 0.007843138, 1
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
-0.2541083, -4.369098, -7.075823, 0, -0.5, 0.5, 0.5,
-0.2541083, -4.369098, -7.075823, 1, -0.5, 0.5, 0.5,
-0.2541083, -4.369098, -7.075823, 1, 1.5, 0.5, 0.5,
-0.2541083, -4.369098, -7.075823, 0, 1.5, 0.5, 0.5
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
-4.954299, 0.02078176, -7.075823, 0, -0.5, 0.5, 0.5,
-4.954299, 0.02078176, -7.075823, 1, -0.5, 0.5, 0.5,
-4.954299, 0.02078176, -7.075823, 1, 1.5, 0.5, 0.5,
-4.954299, 0.02078176, -7.075823, 0, 1.5, 0.5, 0.5
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
-4.954299, -4.369098, -0.1393199, 0, -0.5, 0.5, 0.5,
-4.954299, -4.369098, -0.1393199, 1, -0.5, 0.5, 0.5,
-4.954299, -4.369098, -0.1393199, 1, 1.5, 0.5, 0.5,
-4.954299, -4.369098, -0.1393199, 0, 1.5, 0.5, 0.5
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
-2, -3.356049, -5.475091,
2, -3.356049, -5.475091,
-2, -3.356049, -5.475091,
-2, -3.52489, -5.74188,
0, -3.356049, -5.475091,
0, -3.52489, -5.74188,
2, -3.356049, -5.475091,
2, -3.52489, -5.74188
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
-2, -3.862573, -6.275457, 0, -0.5, 0.5, 0.5,
-2, -3.862573, -6.275457, 1, -0.5, 0.5, 0.5,
-2, -3.862573, -6.275457, 1, 1.5, 0.5, 0.5,
-2, -3.862573, -6.275457, 0, 1.5, 0.5, 0.5,
0, -3.862573, -6.275457, 0, -0.5, 0.5, 0.5,
0, -3.862573, -6.275457, 1, -0.5, 0.5, 0.5,
0, -3.862573, -6.275457, 1, 1.5, 0.5, 0.5,
0, -3.862573, -6.275457, 0, 1.5, 0.5, 0.5,
2, -3.862573, -6.275457, 0, -0.5, 0.5, 0.5,
2, -3.862573, -6.275457, 1, -0.5, 0.5, 0.5,
2, -3.862573, -6.275457, 1, 1.5, 0.5, 0.5,
2, -3.862573, -6.275457, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<3; i++) 
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
8, 9, 10, 8, 10, 11
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
-3.86964, -3, -5.475091,
-3.86964, 3, -5.475091,
-3.86964, -3, -5.475091,
-4.050416, -3, -5.74188,
-3.86964, -2, -5.475091,
-4.050416, -2, -5.74188,
-3.86964, -1, -5.475091,
-4.050416, -1, -5.74188,
-3.86964, 0, -5.475091,
-4.050416, 0, -5.74188,
-3.86964, 1, -5.475091,
-4.050416, 1, -5.74188,
-3.86964, 2, -5.475091,
-4.050416, 2, -5.74188,
-3.86964, 3, -5.475091,
-4.050416, 3, -5.74188
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
-4.41197, -3, -6.275457, 0, -0.5, 0.5, 0.5,
-4.41197, -3, -6.275457, 1, -0.5, 0.5, 0.5,
-4.41197, -3, -6.275457, 1, 1.5, 0.5, 0.5,
-4.41197, -3, -6.275457, 0, 1.5, 0.5, 0.5,
-4.41197, -2, -6.275457, 0, -0.5, 0.5, 0.5,
-4.41197, -2, -6.275457, 1, -0.5, 0.5, 0.5,
-4.41197, -2, -6.275457, 1, 1.5, 0.5, 0.5,
-4.41197, -2, -6.275457, 0, 1.5, 0.5, 0.5,
-4.41197, -1, -6.275457, 0, -0.5, 0.5, 0.5,
-4.41197, -1, -6.275457, 1, -0.5, 0.5, 0.5,
-4.41197, -1, -6.275457, 1, 1.5, 0.5, 0.5,
-4.41197, -1, -6.275457, 0, 1.5, 0.5, 0.5,
-4.41197, 0, -6.275457, 0, -0.5, 0.5, 0.5,
-4.41197, 0, -6.275457, 1, -0.5, 0.5, 0.5,
-4.41197, 0, -6.275457, 1, 1.5, 0.5, 0.5,
-4.41197, 0, -6.275457, 0, 1.5, 0.5, 0.5,
-4.41197, 1, -6.275457, 0, -0.5, 0.5, 0.5,
-4.41197, 1, -6.275457, 1, -0.5, 0.5, 0.5,
-4.41197, 1, -6.275457, 1, 1.5, 0.5, 0.5,
-4.41197, 1, -6.275457, 0, 1.5, 0.5, 0.5,
-4.41197, 2, -6.275457, 0, -0.5, 0.5, 0.5,
-4.41197, 2, -6.275457, 1, -0.5, 0.5, 0.5,
-4.41197, 2, -6.275457, 1, 1.5, 0.5, 0.5,
-4.41197, 2, -6.275457, 0, 1.5, 0.5, 0.5,
-4.41197, 3, -6.275457, 0, -0.5, 0.5, 0.5,
-4.41197, 3, -6.275457, 1, -0.5, 0.5, 0.5,
-4.41197, 3, -6.275457, 1, 1.5, 0.5, 0.5,
-4.41197, 3, -6.275457, 0, 1.5, 0.5, 0.5
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
-3.86964, -3.356049, -4,
-3.86964, -3.356049, 4,
-3.86964, -3.356049, -4,
-4.050416, -3.52489, -4,
-3.86964, -3.356049, -2,
-4.050416, -3.52489, -2,
-3.86964, -3.356049, 0,
-4.050416, -3.52489, 0,
-3.86964, -3.356049, 2,
-4.050416, -3.52489, 2,
-3.86964, -3.356049, 4,
-4.050416, -3.52489, 4
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
-4.41197, -3.862573, -4, 0, -0.5, 0.5, 0.5,
-4.41197, -3.862573, -4, 1, -0.5, 0.5, 0.5,
-4.41197, -3.862573, -4, 1, 1.5, 0.5, 0.5,
-4.41197, -3.862573, -4, 0, 1.5, 0.5, 0.5,
-4.41197, -3.862573, -2, 0, -0.5, 0.5, 0.5,
-4.41197, -3.862573, -2, 1, -0.5, 0.5, 0.5,
-4.41197, -3.862573, -2, 1, 1.5, 0.5, 0.5,
-4.41197, -3.862573, -2, 0, 1.5, 0.5, 0.5,
-4.41197, -3.862573, 0, 0, -0.5, 0.5, 0.5,
-4.41197, -3.862573, 0, 1, -0.5, 0.5, 0.5,
-4.41197, -3.862573, 0, 1, 1.5, 0.5, 0.5,
-4.41197, -3.862573, 0, 0, 1.5, 0.5, 0.5,
-4.41197, -3.862573, 2, 0, -0.5, 0.5, 0.5,
-4.41197, -3.862573, 2, 1, -0.5, 0.5, 0.5,
-4.41197, -3.862573, 2, 1, 1.5, 0.5, 0.5,
-4.41197, -3.862573, 2, 0, 1.5, 0.5, 0.5,
-4.41197, -3.862573, 4, 0, -0.5, 0.5, 0.5,
-4.41197, -3.862573, 4, 1, -0.5, 0.5, 0.5,
-4.41197, -3.862573, 4, 1, 1.5, 0.5, 0.5,
-4.41197, -3.862573, 4, 0, 1.5, 0.5, 0.5
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
-3.86964, -3.356049, -5.475091,
-3.86964, 3.397612, -5.475091,
-3.86964, -3.356049, 5.196452,
-3.86964, 3.397612, 5.196452,
-3.86964, -3.356049, -5.475091,
-3.86964, -3.356049, 5.196452,
-3.86964, 3.397612, -5.475091,
-3.86964, 3.397612, 5.196452,
-3.86964, -3.356049, -5.475091,
3.361423, -3.356049, -5.475091,
-3.86964, -3.356049, 5.196452,
3.361423, -3.356049, 5.196452,
-3.86964, 3.397612, -5.475091,
3.361423, 3.397612, -5.475091,
-3.86964, 3.397612, 5.196452,
3.361423, 3.397612, 5.196452,
3.361423, -3.356049, -5.475091,
3.361423, 3.397612, -5.475091,
3.361423, -3.356049, 5.196452,
3.361423, 3.397612, 5.196452,
3.361423, -3.356049, -5.475091,
3.361423, -3.356049, 5.196452,
3.361423, 3.397612, -5.475091,
3.361423, 3.397612, 5.196452
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
var radius = 7.770877;
var distance = 34.57351;
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
mvMatrix.translate( 0.2541083, -0.02078176, 0.1393199 );
mvMatrix.scale( 1.161935, 1.24407, 0.7873299 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.57351);
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
gl.drawArrays(gl.LINES, 0, 8);
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
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
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
bromopropylate_1-met<-read.table("bromopropylate_1-met.xyz")
```

```
## Error in read.table("bromopropylate_1-met.xyz"): no lines available in input
```

```r
x<-bromopropylate_1-met$V2
```

```
## Error in eval(expr, envir, enclos): object 'bromopropylate_1' not found
```

```r
y<-bromopropylate_1-met$V3
```

```
## Error in eval(expr, envir, enclos): object 'bromopropylate_1' not found
```

```r
z<-bromopropylate_1-met$V4
```

```
## Error in eval(expr, envir, enclos): object 'bromopropylate_1' not found
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
-3.764333, 0.2211064, -1.40659, 0, 0, 1, 1, 1,
-2.987012, 0.2451796, -1.284314, 1, 0, 0, 1, 1,
-2.862701, -0.7045683, -3.136328, 1, 0, 0, 1, 1,
-2.760115, -0.1888293, -2.999463, 1, 0, 0, 1, 1,
-2.689131, 0.8509724, -2.018044, 1, 0, 0, 1, 1,
-2.657247, -0.2229626, -2.305495, 1, 0, 0, 1, 1,
-2.489836, -1.9473, -0.8180538, 0, 0, 0, 1, 1,
-2.439022, -0.1006868, -0.7455494, 0, 0, 0, 1, 1,
-2.339006, 0.06380123, -1.465369, 0, 0, 0, 1, 1,
-2.274077, -0.4557231, 0.3338132, 0, 0, 0, 1, 1,
-2.241903, -0.8597, -4.118683, 0, 0, 0, 1, 1,
-2.223907, 0.4537039, -1.198109, 0, 0, 0, 1, 1,
-2.215059, 0.1591752, -1.982356, 0, 0, 0, 1, 1,
-2.200403, 0.2025017, 0.07683986, 1, 1, 1, 1, 1,
-2.13447, -2.393357, -2.597095, 1, 1, 1, 1, 1,
-2.125038, -1.048605, -0.6379611, 1, 1, 1, 1, 1,
-2.089959, -0.4157839, -2.85858, 1, 1, 1, 1, 1,
-2.069514, 0.05668512, -0.3306846, 1, 1, 1, 1, 1,
-2.02263, 0.4532019, -2.466921, 1, 1, 1, 1, 1,
-2.012478, 0.5026127, -1.12003, 1, 1, 1, 1, 1,
-1.986814, 1.009185, -1.127668, 1, 1, 1, 1, 1,
-1.984597, -0.498669, -0.7657631, 1, 1, 1, 1, 1,
-1.967281, 0.3091284, -2.217956, 1, 1, 1, 1, 1,
-1.962911, -2.097106, -2.128243, 1, 1, 1, 1, 1,
-1.961473, 0.3147194, -1.016436, 1, 1, 1, 1, 1,
-1.940718, -0.5303873, -1.271017, 1, 1, 1, 1, 1,
-1.928423, 0.6356893, -1.062083, 1, 1, 1, 1, 1,
-1.92826, -0.6211344, -1.69277, 1, 1, 1, 1, 1,
-1.899853, 1.191715, 0.2410404, 0, 0, 1, 1, 1,
-1.894462, 0.1018446, -1.7833, 1, 0, 0, 1, 1,
-1.894245, 0.4315537, -1.675756, 1, 0, 0, 1, 1,
-1.869118, 0.02966343, -1.681141, 1, 0, 0, 1, 1,
-1.860956, -1.511548, -1.058837, 1, 0, 0, 1, 1,
-1.837278, -0.1049804, -1.458647, 1, 0, 0, 1, 1,
-1.826127, 0.1234558, -0.3710084, 0, 0, 0, 1, 1,
-1.798634, 0.5105454, -1.344806, 0, 0, 0, 1, 1,
-1.788816, 3.299258, -0.6292502, 0, 0, 0, 1, 1,
-1.787347, -0.8313259, -2.525164, 0, 0, 0, 1, 1,
-1.785492, 0.9699488, -1.185114, 0, 0, 0, 1, 1,
-1.782145, -0.7789967, -4.154068, 0, 0, 0, 1, 1,
-1.730952, 0.1801699, -1.579457, 0, 0, 0, 1, 1,
-1.720977, 1.39174, 0.08336824, 1, 1, 1, 1, 1,
-1.697985, -0.183925, -3.246251, 1, 1, 1, 1, 1,
-1.697791, -0.02919221, -2.084643, 1, 1, 1, 1, 1,
-1.689564, 0.8887967, -1.490651, 1, 1, 1, 1, 1,
-1.6851, 0.9355801, -2.797395, 1, 1, 1, 1, 1,
-1.681106, -0.8779165, -2.276698, 1, 1, 1, 1, 1,
-1.674448, 0.5067159, -0.7016342, 1, 1, 1, 1, 1,
-1.661574, -0.5216238, -3.122831, 1, 1, 1, 1, 1,
-1.635756, 1.12492, -1.935961, 1, 1, 1, 1, 1,
-1.625417, 2.41292, 0.6191382, 1, 1, 1, 1, 1,
-1.601769, 0.05065108, -2.154884, 1, 1, 1, 1, 1,
-1.596939, -0.6818981, -2.91084, 1, 1, 1, 1, 1,
-1.592584, 0.08655728, -2.049656, 1, 1, 1, 1, 1,
-1.585898, -1.829779, -1.727321, 1, 1, 1, 1, 1,
-1.568923, -1.302794, -3.038671, 1, 1, 1, 1, 1,
-1.558998, 1.926237, -1.365425, 0, 0, 1, 1, 1,
-1.554715, 0.9990636, -2.253954, 1, 0, 0, 1, 1,
-1.553494, 0.332269, -2.39838, 1, 0, 0, 1, 1,
-1.522687, -0.487619, -0.7440454, 1, 0, 0, 1, 1,
-1.508319, 0.6415504, -2.253241, 1, 0, 0, 1, 1,
-1.505543, 0.03430642, -1.237657, 1, 0, 0, 1, 1,
-1.494128, -0.5830008, -3.07708, 0, 0, 0, 1, 1,
-1.48886, -1.136194, -0.9114228, 0, 0, 0, 1, 1,
-1.487093, -0.3454285, -3.814278, 0, 0, 0, 1, 1,
-1.474652, 0.6794875, -0.9842451, 0, 0, 0, 1, 1,
-1.465659, -0.9326862, -1.857879, 0, 0, 0, 1, 1,
-1.454296, 0.5762547, -0.3552583, 0, 0, 0, 1, 1,
-1.438335, -0.2773025, -2.175951, 0, 0, 0, 1, 1,
-1.406763, -0.3676099, -1.472367, 1, 1, 1, 1, 1,
-1.40148, -0.4474777, -2.586498, 1, 1, 1, 1, 1,
-1.392619, 0.3530804, -1.75882, 1, 1, 1, 1, 1,
-1.38509, -0.6442824, -1.418912, 1, 1, 1, 1, 1,
-1.38318, -1.307794, -2.773832, 1, 1, 1, 1, 1,
-1.380584, 0.7302784, -2.960217, 1, 1, 1, 1, 1,
-1.376853, -0.6863713, -1.830709, 1, 1, 1, 1, 1,
-1.366413, 0.5749521, -1.81908, 1, 1, 1, 1, 1,
-1.351821, 0.9362742, -0.7237956, 1, 1, 1, 1, 1,
-1.35148, -1.826835, -1.969388, 1, 1, 1, 1, 1,
-1.330033, 0.6569963, -0.3170142, 1, 1, 1, 1, 1,
-1.324024, 0.3233827, -0.7894838, 1, 1, 1, 1, 1,
-1.32024, 0.1456599, -0.5840092, 1, 1, 1, 1, 1,
-1.316595, -0.4736997, -2.353373, 1, 1, 1, 1, 1,
-1.308138, -1.138095, -1.799705, 1, 1, 1, 1, 1,
-1.305714, -0.03791391, -1.515335, 0, 0, 1, 1, 1,
-1.296677, 1.072998, -2.646782, 1, 0, 0, 1, 1,
-1.296311, -0.6118848, -1.382161, 1, 0, 0, 1, 1,
-1.28821, -1.141319, -3.300476, 1, 0, 0, 1, 1,
-1.287385, 0.6789985, -2.510935, 1, 0, 0, 1, 1,
-1.286631, 0.8212104, 0.5415661, 1, 0, 0, 1, 1,
-1.282712, -0.9420733, -2.45438, 0, 0, 0, 1, 1,
-1.27858, -0.6231894, -3.931901, 0, 0, 0, 1, 1,
-1.272741, -1.161283, -2.580655, 0, 0, 0, 1, 1,
-1.270906, -1.180737, -3.296849, 0, 0, 0, 1, 1,
-1.25673, 1.232439, 1.553647, 0, 0, 0, 1, 1,
-1.252939, -1.165386, -2.73377, 0, 0, 0, 1, 1,
-1.247516, 0.7763302, -0.2896996, 0, 0, 0, 1, 1,
-1.241154, -1.524947, -2.536291, 1, 1, 1, 1, 1,
-1.230924, 0.01126086, -1.622773, 1, 1, 1, 1, 1,
-1.229419, -3.257694, -3.68329, 1, 1, 1, 1, 1,
-1.225438, 0.3729904, -0.7258984, 1, 1, 1, 1, 1,
-1.224711, 0.2014312, 0.4665751, 1, 1, 1, 1, 1,
-1.206754, -0.7034481, -1.140471, 1, 1, 1, 1, 1,
-1.204386, -2.216985, -2.631955, 1, 1, 1, 1, 1,
-1.200739, 0.5288007, -1.88712, 1, 1, 1, 1, 1,
-1.187753, 1.022035, -0.6720451, 1, 1, 1, 1, 1,
-1.186626, 0.7503715, -1.525359, 1, 1, 1, 1, 1,
-1.182451, -0.6377787, -2.952142, 1, 1, 1, 1, 1,
-1.172232, -0.391082, -1.580012, 1, 1, 1, 1, 1,
-1.168142, -1.029827, -1.961839, 1, 1, 1, 1, 1,
-1.165114, -0.911788, -2.128062, 1, 1, 1, 1, 1,
-1.162181, 1.605051, -1.697415, 1, 1, 1, 1, 1,
-1.156353, -0.6131486, -2.78778, 0, 0, 1, 1, 1,
-1.154542, -0.9550629, -1.816921, 1, 0, 0, 1, 1,
-1.152128, -2.01562, -2.318218, 1, 0, 0, 1, 1,
-1.150854, -0.2999951, -2.883666, 1, 0, 0, 1, 1,
-1.148016, -1.05219, -3.873569, 1, 0, 0, 1, 1,
-1.145825, 0.8948368, -0.6241161, 1, 0, 0, 1, 1,
-1.142765, -1.420771, -1.809805, 0, 0, 0, 1, 1,
-1.130585, -0.5557262, -1.992766, 0, 0, 0, 1, 1,
-1.128791, 1.458132, 0.4394586, 0, 0, 0, 1, 1,
-1.128713, -0.5328551, -1.744445, 0, 0, 0, 1, 1,
-1.128294, 0.8402441, -0.565585, 0, 0, 0, 1, 1,
-1.123719, 1.277242, -0.3134763, 0, 0, 0, 1, 1,
-1.1192, -0.1425707, -0.9403803, 0, 0, 0, 1, 1,
-1.116728, 0.4391418, -0.6763942, 1, 1, 1, 1, 1,
-1.11404, 1.559893, 0.05776251, 1, 1, 1, 1, 1,
-1.113849, -0.2330763, -1.134723, 1, 1, 1, 1, 1,
-1.109136, -1.622622, -3.437137, 1, 1, 1, 1, 1,
-1.105724, -1.659768, -2.148072, 1, 1, 1, 1, 1,
-1.097468, 0.6198786, -0.17641, 1, 1, 1, 1, 1,
-1.096473, 0.7253054, -0.4112268, 1, 1, 1, 1, 1,
-1.09598, 1.392189, -1.045268, 1, 1, 1, 1, 1,
-1.093798, 0.1984958, -0.2755731, 1, 1, 1, 1, 1,
-1.092363, -0.453426, -3.015094, 1, 1, 1, 1, 1,
-1.091895, -1.676962, -3.017513, 1, 1, 1, 1, 1,
-1.090359, 0.8598994, -0.964938, 1, 1, 1, 1, 1,
-1.086714, 0.2590619, -1.035811, 1, 1, 1, 1, 1,
-1.085082, 0.9865632, -1.541457, 1, 1, 1, 1, 1,
-1.083873, 0.2104712, -0.9858824, 1, 1, 1, 1, 1,
-1.082927, -0.1356232, -2.245735, 0, 0, 1, 1, 1,
-1.078564, -0.7874567, -2.081243, 1, 0, 0, 1, 1,
-1.075926, 1.30443, -2.073596, 1, 0, 0, 1, 1,
-1.065989, -2.063896, -1.561719, 1, 0, 0, 1, 1,
-1.057968, 1.50026, -1.632121, 1, 0, 0, 1, 1,
-1.052999, -0.4082849, -0.9714987, 1, 0, 0, 1, 1,
-1.052418, 1.574064, -1.865082, 0, 0, 0, 1, 1,
-1.052305, 0.06108407, -2.29649, 0, 0, 0, 1, 1,
-1.051601, 0.4067152, -1.744064, 0, 0, 0, 1, 1,
-1.050697, -0.6368869, -1.605759, 0, 0, 0, 1, 1,
-1.045551, 0.074251, -1.570171, 0, 0, 0, 1, 1,
-1.042432, -0.4800867, -1.666218, 0, 0, 0, 1, 1,
-1.039053, 1.329808, 1.475761, 0, 0, 0, 1, 1,
-1.037977, -0.5031875, -0.7592552, 1, 1, 1, 1, 1,
-1.033669, -0.4399036, -3.186557, 1, 1, 1, 1, 1,
-1.029768, 1.409016, -1.271089, 1, 1, 1, 1, 1,
-1.025881, -0.9543568, -0.7220871, 1, 1, 1, 1, 1,
-1.025737, 2.261769, -0.6389891, 1, 1, 1, 1, 1,
-1.016175, 1.71007, -1.388306, 1, 1, 1, 1, 1,
-1.014264, 0.9191229, -0.862501, 1, 1, 1, 1, 1,
-1.014144, 0.1203687, -2.07023, 1, 1, 1, 1, 1,
-1.008056, 2.196389, -2.719369, 1, 1, 1, 1, 1,
-1.002932, 0.4868143, -1.58981, 1, 1, 1, 1, 1,
-1.001066, -0.4699566, -2.600928, 1, 1, 1, 1, 1,
-1.00008, 0.2346198, -1.592231, 1, 1, 1, 1, 1,
-0.9951544, -1.329896, -1.272932, 1, 1, 1, 1, 1,
-0.9859807, 0.4071193, -1.793659, 1, 1, 1, 1, 1,
-0.9855254, -1.204829, -4.110158, 1, 1, 1, 1, 1,
-0.9791079, -1.737146, -1.314001, 0, 0, 1, 1, 1,
-0.9767832, 0.3498397, -1.413548, 1, 0, 0, 1, 1,
-0.9649261, 0.3475183, 0.1978518, 1, 0, 0, 1, 1,
-0.9636548, 0.1976085, -3.281563, 1, 0, 0, 1, 1,
-0.963089, -0.3405555, -2.811235, 1, 0, 0, 1, 1,
-0.9473825, 1.78247, 0.08436866, 1, 0, 0, 1, 1,
-0.94287, 0.8125317, -0.2428557, 0, 0, 0, 1, 1,
-0.9417513, 0.2007182, -2.171184, 0, 0, 0, 1, 1,
-0.9412227, 0.0636976, -3.272562, 0, 0, 0, 1, 1,
-0.9392899, -0.7188269, -0.9963684, 0, 0, 0, 1, 1,
-0.939063, 2.601374, -1.624739, 0, 0, 0, 1, 1,
-0.9383727, -0.8707286, -2.706489, 0, 0, 0, 1, 1,
-0.9292861, 0.1838089, -3.576188, 0, 0, 0, 1, 1,
-0.9236221, 0.04785606, -1.893481, 1, 1, 1, 1, 1,
-0.9180529, 1.719904, -1.403087, 1, 1, 1, 1, 1,
-0.906541, -0.6491656, -0.4874696, 1, 1, 1, 1, 1,
-0.8971611, -1.290195, -1.433211, 1, 1, 1, 1, 1,
-0.8965518, -0.2846992, -1.785761, 1, 1, 1, 1, 1,
-0.884204, -0.8539516, -2.988782, 1, 1, 1, 1, 1,
-0.8754307, 0.356826, -1.820601, 1, 1, 1, 1, 1,
-0.8749819, -2.013694, -3.342196, 1, 1, 1, 1, 1,
-0.8713611, -0.4624929, -0.2877024, 1, 1, 1, 1, 1,
-0.8694273, 0.5576801, -0.04427728, 1, 1, 1, 1, 1,
-0.8557712, -0.5794895, -1.113818, 1, 1, 1, 1, 1,
-0.8525258, 0.2193317, -0.5628086, 1, 1, 1, 1, 1,
-0.8450551, -0.483709, -3.61223, 1, 1, 1, 1, 1,
-0.839418, 1.289228, -0.07290039, 1, 1, 1, 1, 1,
-0.8386255, 0.1358943, -0.2141759, 1, 1, 1, 1, 1,
-0.8343659, -0.784696, -0.5959399, 0, 0, 1, 1, 1,
-0.8323315, 1.011067, -0.2875642, 1, 0, 0, 1, 1,
-0.8323246, 1.235712, -1.137257, 1, 0, 0, 1, 1,
-0.8321538, -0.3855728, -0.5202081, 1, 0, 0, 1, 1,
-0.8317902, 0.4567038, -1.527948, 1, 0, 0, 1, 1,
-0.8310327, -0.2100148, -0.686042, 1, 0, 0, 1, 1,
-0.8256266, -1.7526, -2.395998, 0, 0, 0, 1, 1,
-0.8252504, -1.044324, -1.657016, 0, 0, 0, 1, 1,
-0.8222097, 1.057907, 0.9296099, 0, 0, 0, 1, 1,
-0.8200454, 0.5122599, -0.7113357, 0, 0, 0, 1, 1,
-0.8086598, 0.563421, -0.5983593, 0, 0, 0, 1, 1,
-0.8054557, 1.795692, -0.4663863, 0, 0, 0, 1, 1,
-0.7996193, 0.413271, -1.737574, 0, 0, 0, 1, 1,
-0.7967417, 1.929891, -0.1063612, 1, 1, 1, 1, 1,
-0.7941266, 1.562934, -1.621878, 1, 1, 1, 1, 1,
-0.7939519, 0.7221885, -1.118981, 1, 1, 1, 1, 1,
-0.7927815, 0.2236002, -1.906088, 1, 1, 1, 1, 1,
-0.7877603, -0.3468292, -1.757276, 1, 1, 1, 1, 1,
-0.787733, -1.680309, -1.897663, 1, 1, 1, 1, 1,
-0.7840745, 1.563208, 1.596192, 1, 1, 1, 1, 1,
-0.7826602, -0.7187443, -2.899864, 1, 1, 1, 1, 1,
-0.7727827, -0.5116972, -2.49503, 1, 1, 1, 1, 1,
-0.7691916, -1.243491, -3.127854, 1, 1, 1, 1, 1,
-0.7690207, -0.2044069, -3.588637, 1, 1, 1, 1, 1,
-0.769007, -1.573967, -1.355403, 1, 1, 1, 1, 1,
-0.7672207, 0.2502572, -4.073132, 1, 1, 1, 1, 1,
-0.7629615, 0.9937041, 0.5815802, 1, 1, 1, 1, 1,
-0.7597307, 1.831853, 0.09544242, 1, 1, 1, 1, 1,
-0.7555037, 0.3725278, -0.06940596, 0, 0, 1, 1, 1,
-0.7551354, -0.2552277, -1.846388, 1, 0, 0, 1, 1,
-0.7383417, 2.164539, 1.20353, 1, 0, 0, 1, 1,
-0.7381561, 0.6928862, -0.5731344, 1, 0, 0, 1, 1,
-0.7342726, -0.02728443, -2.217331, 1, 0, 0, 1, 1,
-0.7331629, -0.1648664, -3.680441, 1, 0, 0, 1, 1,
-0.7318422, -1.18066, -2.49754, 0, 0, 0, 1, 1,
-0.730924, -0.7639795, -1.275019, 0, 0, 0, 1, 1,
-0.7295121, 2.407521, -0.6556751, 0, 0, 0, 1, 1,
-0.7293649, -0.5102646, -2.160828, 0, 0, 0, 1, 1,
-0.727754, 0.800537, -1.616146, 0, 0, 0, 1, 1,
-0.7208923, 0.8159132, -1.185139, 0, 0, 0, 1, 1,
-0.7145089, -0.56947, -3.224945, 0, 0, 0, 1, 1,
-0.7107577, -0.8164051, -3.237724, 1, 1, 1, 1, 1,
-0.7080332, 0.5324291, -0.1043833, 1, 1, 1, 1, 1,
-0.7074314, -1.876678, -3.739018, 1, 1, 1, 1, 1,
-0.7012368, -0.2682413, -0.02784021, 1, 1, 1, 1, 1,
-0.6974524, 0.6399893, -0.4212572, 1, 1, 1, 1, 1,
-0.6935611, 0.3925838, -0.09938928, 1, 1, 1, 1, 1,
-0.6929908, -0.7669828, -2.048238, 1, 1, 1, 1, 1,
-0.6914077, 1.549446, -0.9426042, 1, 1, 1, 1, 1,
-0.6852848, -0.5951471, -1.084499, 1, 1, 1, 1, 1,
-0.6842183, 0.8644406, -0.8541134, 1, 1, 1, 1, 1,
-0.6810047, 0.1490035, -3.414199, 1, 1, 1, 1, 1,
-0.6803619, -0.5968505, -2.231068, 1, 1, 1, 1, 1,
-0.6800993, 1.78448, -1.081396, 1, 1, 1, 1, 1,
-0.6780915, -0.07322346, -1.765724, 1, 1, 1, 1, 1,
-0.6777244, -0.2197489, -2.639492, 1, 1, 1, 1, 1,
-0.6773684, -0.7151638, -3.816812, 0, 0, 1, 1, 1,
-0.6728084, 0.4237396, 0.756592, 1, 0, 0, 1, 1,
-0.6668477, 0.429709, -0.8775354, 1, 0, 0, 1, 1,
-0.6656808, 1.542672, -1.733127, 1, 0, 0, 1, 1,
-0.6650811, -0.4076011, 0.3285015, 1, 0, 0, 1, 1,
-0.663871, 2.41055, -0.6364763, 1, 0, 0, 1, 1,
-0.6638273, -0.1028928, -3.477263, 0, 0, 0, 1, 1,
-0.660895, -0.6739889, -2.688744, 0, 0, 0, 1, 1,
-0.6583408, 0.7259599, -1.181792, 0, 0, 0, 1, 1,
-0.6539896, 0.9352289, -1.236937, 0, 0, 0, 1, 1,
-0.6531731, -0.4252165, -1.354339, 0, 0, 0, 1, 1,
-0.6523454, -0.3472249, -4.699147, 0, 0, 0, 1, 1,
-0.6522054, -0.8063357, -1.852943, 0, 0, 0, 1, 1,
-0.6423599, -0.4526615, -1.89117, 1, 1, 1, 1, 1,
-0.6414912, -0.1071887, -1.012679, 1, 1, 1, 1, 1,
-0.6387428, -0.3628282, -2.504148, 1, 1, 1, 1, 1,
-0.6323034, 1.03902, -0.8650645, 1, 1, 1, 1, 1,
-0.6314197, -1.322827, -1.40547, 1, 1, 1, 1, 1,
-0.628926, -0.5491554, -1.297768, 1, 1, 1, 1, 1,
-0.6247895, -0.4230516, -2.674554, 1, 1, 1, 1, 1,
-0.623828, -0.4811592, -2.744587, 1, 1, 1, 1, 1,
-0.6220272, -0.6413112, -2.705302, 1, 1, 1, 1, 1,
-0.6212538, -0.2910087, -1.281573, 1, 1, 1, 1, 1,
-0.6147746, 1.285519, -0.03641897, 1, 1, 1, 1, 1,
-0.6102155, -0.1148839, -1.292114, 1, 1, 1, 1, 1,
-0.6085274, -0.3645834, -2.574121, 1, 1, 1, 1, 1,
-0.5991555, -1.125347, -3.964473, 1, 1, 1, 1, 1,
-0.5991122, 0.3853536, 0.4043302, 1, 1, 1, 1, 1,
-0.5947143, 0.1104636, -2.226537, 0, 0, 1, 1, 1,
-0.5902486, 0.5059197, -0.5545578, 1, 0, 0, 1, 1,
-0.5875404, -0.4250998, -0.9751414, 1, 0, 0, 1, 1,
-0.5798081, -0.4936125, -1.977138, 1, 0, 0, 1, 1,
-0.5797691, -0.528425, -2.771808, 1, 0, 0, 1, 1,
-0.5790496, -0.455038, -1.613345, 1, 0, 0, 1, 1,
-0.5787741, 1.808418, 1.54588, 0, 0, 0, 1, 1,
-0.5754511, -0.4473783, -1.226554, 0, 0, 0, 1, 1,
-0.5735725, -0.5225937, -0.8348805, 0, 0, 0, 1, 1,
-0.5714504, 0.6318787, -1.113335, 0, 0, 0, 1, 1,
-0.5653909, 0.8317919, 0.58983, 0, 0, 0, 1, 1,
-0.5648629, 0.5750397, -0.4129094, 0, 0, 0, 1, 1,
-0.5643082, -0.8992791, -5.319681, 0, 0, 0, 1, 1,
-0.5626194, -0.5633751, -3.627799, 1, 1, 1, 1, 1,
-0.5619415, -0.03455124, 0.2454012, 1, 1, 1, 1, 1,
-0.5612395, -1.179508, -3.158404, 1, 1, 1, 1, 1,
-0.5591694, 1.72291, -0.323498, 1, 1, 1, 1, 1,
-0.5531573, 0.1871229, -2.968341, 1, 1, 1, 1, 1,
-0.5438081, 0.4132962, 0.2424827, 1, 1, 1, 1, 1,
-0.5357926, -0.534736, -1.047789, 1, 1, 1, 1, 1,
-0.5357016, 1.351629, -0.6832375, 1, 1, 1, 1, 1,
-0.5301107, -0.5902466, -2.753321, 1, 1, 1, 1, 1,
-0.5299811, -0.3499064, -2.867966, 1, 1, 1, 1, 1,
-0.5297338, -0.1701839, -0.2754284, 1, 1, 1, 1, 1,
-0.5281299, 0.4683615, -0.8637672, 1, 1, 1, 1, 1,
-0.5260428, 0.8527977, -1.815846, 1, 1, 1, 1, 1,
-0.5237054, 1.812437, -1.712757, 1, 1, 1, 1, 1,
-0.5223011, -0.566355, -1.733019, 1, 1, 1, 1, 1,
-0.5219286, -1.116387, -4.55872, 0, 0, 1, 1, 1,
-0.5139329, 0.4531589, -0.697879, 1, 0, 0, 1, 1,
-0.5138117, -0.8986207, -3.897071, 1, 0, 0, 1, 1,
-0.5135877, -1.512834, -2.791496, 1, 0, 0, 1, 1,
-0.5106003, -0.4030783, -1.176252, 1, 0, 0, 1, 1,
-0.5078255, -0.797012, -4.124071, 1, 0, 0, 1, 1,
-0.5037583, 0.5484838, -1.443617, 0, 0, 0, 1, 1,
-0.5031247, 0.6148522, 0.544461, 0, 0, 0, 1, 1,
-0.501115, -0.5209193, -2.165471, 0, 0, 0, 1, 1,
-0.4990003, -0.5244476, -3.160094, 0, 0, 0, 1, 1,
-0.4986769, 0.4102511, -1.072881, 0, 0, 0, 1, 1,
-0.4951259, -0.3967319, -2.691103, 0, 0, 0, 1, 1,
-0.4938067, 0.2733314, -1.75706, 0, 0, 0, 1, 1,
-0.4936966, 0.06839667, -0.3130887, 1, 1, 1, 1, 1,
-0.4926874, 0.4749295, 1.109863, 1, 1, 1, 1, 1,
-0.4922626, 0.6376472, -1.364161, 1, 1, 1, 1, 1,
-0.4912248, -1.982068, -2.600774, 1, 1, 1, 1, 1,
-0.4856734, 0.3299226, 0.1498775, 1, 1, 1, 1, 1,
-0.4811252, 0.4160012, 0.8474021, 1, 1, 1, 1, 1,
-0.4799846, -1.398563, -3.43758, 1, 1, 1, 1, 1,
-0.4786786, -1.379577, -3.131314, 1, 1, 1, 1, 1,
-0.4772154, -0.6477686, -1.927321, 1, 1, 1, 1, 1,
-0.4748235, -0.3984739, -1.840503, 1, 1, 1, 1, 1,
-0.4735778, -1.276032, -2.844898, 1, 1, 1, 1, 1,
-0.4722081, 1.316885, -1.609254, 1, 1, 1, 1, 1,
-0.4623792, 0.767996, -0.8954953, 1, 1, 1, 1, 1,
-0.4606579, -0.6735598, -1.709493, 1, 1, 1, 1, 1,
-0.4567217, 0.07748044, -2.63945, 1, 1, 1, 1, 1,
-0.4536039, -0.1063425, -2.421509, 0, 0, 1, 1, 1,
-0.4487707, 0.2896656, 0.567435, 1, 0, 0, 1, 1,
-0.4391545, 0.2174263, -1.358702, 1, 0, 0, 1, 1,
-0.4381872, 1.065322, -0.6322699, 1, 0, 0, 1, 1,
-0.4343022, -0.7662963, -2.512854, 1, 0, 0, 1, 1,
-0.4285996, 0.8009675, -1.198977, 1, 0, 0, 1, 1,
-0.4262206, 0.852974, 0.5029052, 0, 0, 0, 1, 1,
-0.42458, -1.287392, -1.781526, 0, 0, 0, 1, 1,
-0.4171698, -0.09797221, -3.34983, 0, 0, 0, 1, 1,
-0.4166976, -2.4473, -1.735186, 0, 0, 0, 1, 1,
-0.4159734, -0.1036442, -3.059305, 0, 0, 0, 1, 1,
-0.415151, -1.565632, -2.875874, 0, 0, 0, 1, 1,
-0.4131442, -0.5768785, -3.077045, 0, 0, 0, 1, 1,
-0.4089538, -1.768475, -3.550332, 1, 1, 1, 1, 1,
-0.4065148, -0.09587526, -0.6374572, 1, 1, 1, 1, 1,
-0.4048283, 0.9498948, -0.9074198, 1, 1, 1, 1, 1,
-0.4006247, 1.86272, 1.917281, 1, 1, 1, 1, 1,
-0.397367, 0.9900488, -1.104232, 1, 1, 1, 1, 1,
-0.3944128, 1.678684, -0.1127573, 1, 1, 1, 1, 1,
-0.3933207, -1.821742, -1.944729, 1, 1, 1, 1, 1,
-0.3930365, -0.3709118, -1.438978, 1, 1, 1, 1, 1,
-0.3836009, 0.4933738, -1.177241, 1, 1, 1, 1, 1,
-0.3786072, 0.5689393, -0.981392, 1, 1, 1, 1, 1,
-0.376974, -0.04766993, -1.094844, 1, 1, 1, 1, 1,
-0.3608823, -0.7182071, -1.871911, 1, 1, 1, 1, 1,
-0.3591571, 0.3707724, -1.796947, 1, 1, 1, 1, 1,
-0.3574282, -0.5981765, -3.682365, 1, 1, 1, 1, 1,
-0.3554945, -0.04829519, -0.7451311, 1, 1, 1, 1, 1,
-0.3546999, -0.2208367, -2.821924, 0, 0, 1, 1, 1,
-0.3530248, -0.006313257, -0.8749632, 1, 0, 0, 1, 1,
-0.3502595, 0.6750382, 1.374131, 1, 0, 0, 1, 1,
-0.3485782, 0.3189171, -0.06407998, 1, 0, 0, 1, 1,
-0.3454713, -1.493082, -1.439009, 1, 0, 0, 1, 1,
-0.3399038, 0.7605423, -1.228401, 1, 0, 0, 1, 1,
-0.3382376, -0.7663811, -2.947012, 0, 0, 0, 1, 1,
-0.3344133, 0.8890727, -0.605606, 0, 0, 0, 1, 1,
-0.3267786, -0.3932478, -2.694756, 0, 0, 0, 1, 1,
-0.3242489, 0.9021044, -0.3433411, 0, 0, 0, 1, 1,
-0.3235748, -0.4480186, -2.286222, 0, 0, 0, 1, 1,
-0.3221862, 0.769264, 0.846445, 0, 0, 0, 1, 1,
-0.3180378, -0.3106295, -3.656817, 0, 0, 0, 1, 1,
-0.31256, -0.934424, -3.252432, 1, 1, 1, 1, 1,
-0.3100758, 0.3034918, -1.272908, 1, 1, 1, 1, 1,
-0.3089876, -2.442111, -4.025815, 1, 1, 1, 1, 1,
-0.307501, -0.1281262, -2.710725, 1, 1, 1, 1, 1,
-0.3072598, -0.3452751, -2.758203, 1, 1, 1, 1, 1,
-0.3055141, 0.3771177, 0.8853626, 1, 1, 1, 1, 1,
-0.3028594, 0.938747, 1.014203, 1, 1, 1, 1, 1,
-0.2991417, -0.2942548, -2.097125, 1, 1, 1, 1, 1,
-0.2947094, 0.5029145, -1.230986, 1, 1, 1, 1, 1,
-0.2923873, -1.979793, -2.300066, 1, 1, 1, 1, 1,
-0.2889073, 0.5872084, -0.7395464, 1, 1, 1, 1, 1,
-0.2877655, -0.05330312, -2.489853, 1, 1, 1, 1, 1,
-0.2856613, 1.05845, -1.042742, 1, 1, 1, 1, 1,
-0.2843213, -0.4163702, -2.088386, 1, 1, 1, 1, 1,
-0.2834916, 0.2549592, -1.02645, 1, 1, 1, 1, 1,
-0.2825031, 1.612186, 0.2034256, 0, 0, 1, 1, 1,
-0.2815531, -0.8342481, -1.953732, 1, 0, 0, 1, 1,
-0.2796211, -0.635337, -3.253355, 1, 0, 0, 1, 1,
-0.2795824, -0.1364427, -1.791247, 1, 0, 0, 1, 1,
-0.2795196, 0.1297581, -0.5129929, 1, 0, 0, 1, 1,
-0.2728185, 0.02553069, -2.469987, 1, 0, 0, 1, 1,
-0.2713035, -2.098428, -1.748118, 0, 0, 0, 1, 1,
-0.2679164, -0.7605693, -3.286164, 0, 0, 0, 1, 1,
-0.2659307, -1.61396, -5.288696, 0, 0, 0, 1, 1,
-0.2645889, 0.04771758, -0.4999306, 0, 0, 0, 1, 1,
-0.2507325, -0.2155125, -1.819103, 0, 0, 0, 1, 1,
-0.250118, 0.966231, -0.06270504, 0, 0, 0, 1, 1,
-0.2486206, 1.176941, -0.6800769, 0, 0, 0, 1, 1,
-0.2457345, 0.3747111, -0.854966, 1, 1, 1, 1, 1,
-0.2432567, -0.5463687, -2.413627, 1, 1, 1, 1, 1,
-0.2400995, 1.41603, 0.0960978, 1, 1, 1, 1, 1,
-0.2388725, 0.3802687, -2.088953, 1, 1, 1, 1, 1,
-0.2388169, 0.4532503, 0.3406191, 1, 1, 1, 1, 1,
-0.2371648, -0.6403686, -2.672913, 1, 1, 1, 1, 1,
-0.2305412, 0.01288111, -0.8217778, 1, 1, 1, 1, 1,
-0.2285607, -1.294659, -4.042641, 1, 1, 1, 1, 1,
-0.2276228, -1.833957, -2.344364, 1, 1, 1, 1, 1,
-0.2273469, 0.9865382, 2.652588, 1, 1, 1, 1, 1,
-0.2266257, -0.4112737, -3.27073, 1, 1, 1, 1, 1,
-0.2223006, -0.5370981, -3.402689, 1, 1, 1, 1, 1,
-0.2169282, -0.4925198, -2.45735, 1, 1, 1, 1, 1,
-0.2147572, -1.269956, -2.262306, 1, 1, 1, 1, 1,
-0.213554, -1.467745, -3.380118, 1, 1, 1, 1, 1,
-0.2078367, 1.021053, 0.3790475, 0, 0, 1, 1, 1,
-0.2065148, 0.5081622, 0.6858153, 1, 0, 0, 1, 1,
-0.2064905, 2.052553, 0.1180202, 1, 0, 0, 1, 1,
-0.2063234, 0.7740076, 0.3059428, 1, 0, 0, 1, 1,
-0.2055481, 1.264007, -0.7339206, 1, 0, 0, 1, 1,
-0.2038315, -0.8983759, -3.555062, 1, 0, 0, 1, 1,
-0.2028738, -0.4677735, -0.9500516, 0, 0, 0, 1, 1,
-0.1931269, 1.414527, 0.6659953, 0, 0, 0, 1, 1,
-0.1922184, -0.5455679, -4.110476, 0, 0, 0, 1, 1,
-0.1901277, -0.02047512, -2.314941, 0, 0, 0, 1, 1,
-0.187666, 0.6791814, -1.482353, 0, 0, 0, 1, 1,
-0.1852255, -1.355475, -2.710129, 0, 0, 0, 1, 1,
-0.1851617, 1.049791, -0.5507875, 0, 0, 0, 1, 1,
-0.1842919, -0.2686935, -0.8359827, 1, 1, 1, 1, 1,
-0.1801121, 2.082838, -0.7587282, 1, 1, 1, 1, 1,
-0.1781442, 0.2398596, -0.9713418, 1, 1, 1, 1, 1,
-0.17796, -2.290089, -3.883474, 1, 1, 1, 1, 1,
-0.1641597, 0.01940956, -0.5685242, 1, 1, 1, 1, 1,
-0.1629778, 1.202183, -1.1854, 1, 1, 1, 1, 1,
-0.1620177, 1.650849, 1.077788, 1, 1, 1, 1, 1,
-0.1594695, -0.5566838, -1.892008, 1, 1, 1, 1, 1,
-0.1583312, -0.7671376, -2.680995, 1, 1, 1, 1, 1,
-0.1557288, -0.2662757, -1.604819, 1, 1, 1, 1, 1,
-0.1532183, -1.906552, -4.194653, 1, 1, 1, 1, 1,
-0.1529079, 1.352026, -1.841992, 1, 1, 1, 1, 1,
-0.152661, -1.327985, -3.018288, 1, 1, 1, 1, 1,
-0.1510678, 0.06235729, -1.399413, 1, 1, 1, 1, 1,
-0.1501087, 0.3140826, 0.06697229, 1, 1, 1, 1, 1,
-0.1500528, 0.4327442, -1.863339, 0, 0, 1, 1, 1,
-0.1497595, -1.525201, -4.241775, 1, 0, 0, 1, 1,
-0.1485177, -1.802858, -2.618324, 1, 0, 0, 1, 1,
-0.1470205, 1.324, 0.7763478, 1, 0, 0, 1, 1,
-0.1456151, -0.6885841, -4.969667, 1, 0, 0, 1, 1,
-0.145195, -0.6732455, -3.914031, 1, 0, 0, 1, 1,
-0.1413725, -0.2644833, -2.462085, 0, 0, 0, 1, 1,
-0.1389991, -1.596503, -4.045544, 0, 0, 0, 1, 1,
-0.135838, -0.6590691, -3.11371, 0, 0, 0, 1, 1,
-0.1290489, -0.5767113, -2.241654, 0, 0, 0, 1, 1,
-0.1283461, 1.213864, -0.8715201, 0, 0, 0, 1, 1,
-0.1213012, -1.361905, -3.578309, 0, 0, 0, 1, 1,
-0.1205518, -0.6967571, -4.314458, 0, 0, 0, 1, 1,
-0.1160935, 0.3924719, -1.76391, 1, 1, 1, 1, 1,
-0.1155059, -0.007200208, -0.7990767, 1, 1, 1, 1, 1,
-0.107473, -0.02742478, -2.996102, 1, 1, 1, 1, 1,
-0.1041417, 0.1189366, -1.962327, 1, 1, 1, 1, 1,
-0.1035273, 0.1456396, -0.892917, 1, 1, 1, 1, 1,
-0.1004836, -0.2169359, -2.334598, 1, 1, 1, 1, 1,
-0.09982572, -0.9298666, -2.792432, 1, 1, 1, 1, 1,
-0.09832561, 0.02925782, -1.233834, 1, 1, 1, 1, 1,
-0.09733691, -0.3488686, -2.283547, 1, 1, 1, 1, 1,
-0.09402292, 2.168754, 0.4455434, 1, 1, 1, 1, 1,
-0.09358954, 0.1229628, -0.1217821, 1, 1, 1, 1, 1,
-0.08758545, -0.01001577, -0.3985686, 1, 1, 1, 1, 1,
-0.08625128, -1.220523, -2.159718, 1, 1, 1, 1, 1,
-0.07976996, -0.6402995, -4.885169, 1, 1, 1, 1, 1,
-0.07872774, -1.542735, -2.592955, 1, 1, 1, 1, 1,
-0.07517699, -0.7697778, -3.276494, 0, 0, 1, 1, 1,
-0.07410929, 0.7211525, 2.478077, 1, 0, 0, 1, 1,
-0.07196914, 0.297929, 0.7313958, 1, 0, 0, 1, 1,
-0.07123382, -0.2012852, -2.346915, 1, 0, 0, 1, 1,
-0.07020906, 0.3205633, -1.728391, 1, 0, 0, 1, 1,
-0.06949794, 0.1852771, -1.54425, 1, 0, 0, 1, 1,
-0.06418005, 0.6762149, -2.035923, 0, 0, 0, 1, 1,
-0.06275398, 0.2126614, -1.87295, 0, 0, 0, 1, 1,
-0.05990648, 0.0716759, 0.3298492, 0, 0, 0, 1, 1,
-0.04767856, -0.8266142, -3.007677, 0, 0, 0, 1, 1,
-0.04748004, -1.563965, -3.291314, 0, 0, 0, 1, 1,
-0.04649335, 0.5505879, -0.5979032, 0, 0, 0, 1, 1,
-0.041882, 0.7415158, 0.8000596, 0, 0, 0, 1, 1,
-0.04156079, 0.370172, -0.5186462, 1, 1, 1, 1, 1,
-0.03993499, -0.3428483, -0.7003964, 1, 1, 1, 1, 1,
-0.03455498, -0.3367111, -2.949387, 1, 1, 1, 1, 1,
-0.03183832, 0.1285965, 1.014477, 1, 1, 1, 1, 1,
-0.0262144, -0.449097, -2.221868, 1, 1, 1, 1, 1,
-0.02139479, 0.4993113, 0.3632942, 1, 1, 1, 1, 1,
-0.02096727, -1.94647, -2.65792, 1, 1, 1, 1, 1,
-0.01561431, -0.9274489, -2.240479, 1, 1, 1, 1, 1,
-0.01440084, 0.386385, -0.4689524, 1, 1, 1, 1, 1,
-0.01170811, -0.4855079, -3.191803, 1, 1, 1, 1, 1,
-0.006696428, -0.09636826, -2.676159, 1, 1, 1, 1, 1,
-0.001762523, -0.2545692, -3.489585, 1, 1, 1, 1, 1,
0.001088043, 1.782305, 0.008057652, 1, 1, 1, 1, 1,
0.003488339, -1.424567, 3.320923, 1, 1, 1, 1, 1,
0.006078096, -0.5977885, 3.886187, 1, 1, 1, 1, 1,
0.007885681, 0.8979208, 0.2650154, 0, 0, 1, 1, 1,
0.01000256, -1.181505, 1.527541, 1, 0, 0, 1, 1,
0.01254233, 0.3154314, 1.136457, 1, 0, 0, 1, 1,
0.0154883, -0.85545, 1.033495, 1, 0, 0, 1, 1,
0.01658723, 1.035842, -0.4707527, 1, 0, 0, 1, 1,
0.02077061, 0.02038775, 0.00800706, 1, 0, 0, 1, 1,
0.0236057, -0.4708216, 4.238352, 0, 0, 0, 1, 1,
0.02421778, -0.1264189, 3.146938, 0, 0, 0, 1, 1,
0.03021335, 0.6332611, -0.108198, 0, 0, 0, 1, 1,
0.0306494, -0.2413168, 5.041041, 0, 0, 0, 1, 1,
0.03813718, 1.001322, -0.02750565, 0, 0, 0, 1, 1,
0.03868858, -0.6775978, 3.585394, 0, 0, 0, 1, 1,
0.03962542, -1.764724, 2.808433, 0, 0, 0, 1, 1,
0.04100002, 1.0422, 1.513844, 1, 1, 1, 1, 1,
0.04110911, -0.1924815, 2.734796, 1, 1, 1, 1, 1,
0.04111309, 0.2253647, 1.251533, 1, 1, 1, 1, 1,
0.04205481, 1.091995, 0.3218792, 1, 1, 1, 1, 1,
0.04538476, 0.159265, 0.930185, 1, 1, 1, 1, 1,
0.04859699, 0.8301904, 1.335083, 1, 1, 1, 1, 1,
0.05050723, -0.8553743, 1.576617, 1, 1, 1, 1, 1,
0.05389708, -0.4657149, 3.210774, 1, 1, 1, 1, 1,
0.05670585, -1.480033, 1.501642, 1, 1, 1, 1, 1,
0.05836465, 0.338066, 0.04722833, 1, 1, 1, 1, 1,
0.0591836, -0.7552027, 2.396238, 1, 1, 1, 1, 1,
0.05966322, 0.961445, 0.3051037, 1, 1, 1, 1, 1,
0.06040208, -0.5047896, 1.188555, 1, 1, 1, 1, 1,
0.06119677, -0.4727507, 2.21917, 1, 1, 1, 1, 1,
0.06352618, 0.9069411, -1.392267, 1, 1, 1, 1, 1,
0.06513485, -1.776819, 3.94698, 0, 0, 1, 1, 1,
0.06550699, -0.478367, 2.988892, 1, 0, 0, 1, 1,
0.06679233, -0.1649765, 4.068787, 1, 0, 0, 1, 1,
0.0686463, -0.743274, 2.262047, 1, 0, 0, 1, 1,
0.07369152, 0.733622, -0.5007209, 1, 0, 0, 1, 1,
0.08233994, 0.6684245, 0.5994712, 1, 0, 0, 1, 1,
0.08979421, -1.870138, 3.243817, 0, 0, 0, 1, 1,
0.08991402, -0.864872, 3.169208, 0, 0, 0, 1, 1,
0.0905657, 0.1357815, 0.8514742, 0, 0, 0, 1, 1,
0.09141355, 0.7750796, -1.727775, 0, 0, 0, 1, 1,
0.09204279, -0.8713037, 4.300642, 0, 0, 0, 1, 1,
0.09275354, 0.5609746, -1.829001, 0, 0, 0, 1, 1,
0.09392947, 0.7165676, -1.547756, 0, 0, 0, 1, 1,
0.09520321, 0.1877678, 0.05550972, 1, 1, 1, 1, 1,
0.09749603, -2.150569, 2.992603, 1, 1, 1, 1, 1,
0.09983379, 1.470264, -0.2307051, 1, 1, 1, 1, 1,
0.1030072, 0.1494119, 2.096906, 1, 1, 1, 1, 1,
0.10325, 0.9355453, -0.3037236, 1, 1, 1, 1, 1,
0.1100803, -1.529529, 4.231593, 1, 1, 1, 1, 1,
0.1213662, 0.3181893, 0.07176903, 1, 1, 1, 1, 1,
0.1251131, -0.7933043, 4.350688, 1, 1, 1, 1, 1,
0.1263565, -1.936496, 4.385974, 1, 1, 1, 1, 1,
0.1303658, -0.585375, 1.133347, 1, 1, 1, 1, 1,
0.1309843, 0.08667012, 0.5590848, 1, 1, 1, 1, 1,
0.1366031, 0.7753881, -0.1462408, 1, 1, 1, 1, 1,
0.143681, -2.278032, 2.902362, 1, 1, 1, 1, 1,
0.1450292, -0.4921799, 3.18958, 1, 1, 1, 1, 1,
0.147291, -0.1665408, 2.337718, 1, 1, 1, 1, 1,
0.1518746, -1.713466, 2.507231, 0, 0, 1, 1, 1,
0.1529387, 1.548656, -0.353559, 1, 0, 0, 1, 1,
0.1548104, -2.625051, 3.792697, 1, 0, 0, 1, 1,
0.1550301, 0.6513906, 0.5411816, 1, 0, 0, 1, 1,
0.1657168, -2.575804, 2.40166, 1, 0, 0, 1, 1,
0.1674781, -0.8519195, 3.22404, 1, 0, 0, 1, 1,
0.1725081, -0.1812402, 1.801268, 0, 0, 0, 1, 1,
0.1741421, -0.3606128, 2.893828, 0, 0, 0, 1, 1,
0.1806453, 2.420464, 2.40963, 0, 0, 0, 1, 1,
0.1824184, 2.210217, 0.3530132, 0, 0, 0, 1, 1,
0.1868425, 1.327221, 1.022496, 0, 0, 0, 1, 1,
0.1939895, -0.5560834, 3.900054, 0, 0, 0, 1, 1,
0.2052777, 0.1818588, 1.773886, 0, 0, 0, 1, 1,
0.2067208, 1.284527, 1.376129, 1, 1, 1, 1, 1,
0.2083482, -0.4009443, 1.263795, 1, 1, 1, 1, 1,
0.2119872, -0.8244206, 2.856963, 1, 1, 1, 1, 1,
0.2126199, -0.005560889, 0.4471272, 1, 1, 1, 1, 1,
0.212869, 0.3166226, 0.7313566, 1, 1, 1, 1, 1,
0.2130021, 0.9101385, 0.1158778, 1, 1, 1, 1, 1,
0.2140847, 2.255483, -0.3633277, 1, 1, 1, 1, 1,
0.2203943, -1.328251, 1.873634, 1, 1, 1, 1, 1,
0.220964, -0.3652129, 3.186033, 1, 1, 1, 1, 1,
0.2277931, -0.4130102, 2.803272, 1, 1, 1, 1, 1,
0.2310845, 1.471822, -0.2513782, 1, 1, 1, 1, 1,
0.2355737, 2.015874, -0.07121696, 1, 1, 1, 1, 1,
0.2381431, -0.2691243, 2.949052, 1, 1, 1, 1, 1,
0.2384823, -0.8717003, 2.036159, 1, 1, 1, 1, 1,
0.2391153, 1.58043, 2.397912, 1, 1, 1, 1, 1,
0.2401213, -0.3489561, 2.141039, 0, 0, 1, 1, 1,
0.241604, -2.035006, 2.508373, 1, 0, 0, 1, 1,
0.2443051, -0.2217209, 2.92953, 1, 0, 0, 1, 1,
0.2458775, -0.03586267, 1.785414, 1, 0, 0, 1, 1,
0.2486834, 2.662182, -0.4964114, 1, 0, 0, 1, 1,
0.2509205, 1.463898, -0.231698, 1, 0, 0, 1, 1,
0.2534665, -0.8681312, 4.366566, 0, 0, 0, 1, 1,
0.2541279, 0.5839154, -1.437989, 0, 0, 0, 1, 1,
0.2543204, -0.5777342, 2.509269, 0, 0, 0, 1, 1,
0.2553598, -0.9161494, 2.069689, 0, 0, 0, 1, 1,
0.2646245, -0.3459168, 2.395671, 0, 0, 0, 1, 1,
0.2666622, -0.4269609, 1.913742, 0, 0, 0, 1, 1,
0.2719132, 0.2082374, 0.7922515, 0, 0, 0, 1, 1,
0.2727547, -0.3111013, 1.914713, 1, 1, 1, 1, 1,
0.274679, -0.3752399, 4.723116, 1, 1, 1, 1, 1,
0.2775806, 0.6884391, 1.233079, 1, 1, 1, 1, 1,
0.2801187, -1.675051, 3.644974, 1, 1, 1, 1, 1,
0.2814885, 0.3305777, 1.54031, 1, 1, 1, 1, 1,
0.2822635, 1.542588, -0.7060228, 1, 1, 1, 1, 1,
0.2836524, 0.6383417, 1.408303, 1, 1, 1, 1, 1,
0.2877665, 0.790599, 1.447059, 1, 1, 1, 1, 1,
0.2912165, -0.4952874, 3.518271, 1, 1, 1, 1, 1,
0.2928459, -0.06386819, 1.4076, 1, 1, 1, 1, 1,
0.2968065, 1.615056, 0.5885078, 1, 1, 1, 1, 1,
0.2977001, -0.4319047, 2.582057, 1, 1, 1, 1, 1,
0.2995239, 1.361617, -0.8702041, 1, 1, 1, 1, 1,
0.3042531, 0.6957856, 0.3886257, 1, 1, 1, 1, 1,
0.3074236, -0.456206, 5.020596, 1, 1, 1, 1, 1,
0.3129263, 0.1253747, 3.084929, 0, 0, 1, 1, 1,
0.3182702, -0.7623371, 2.270849, 1, 0, 0, 1, 1,
0.3231384, -1.233142, 3.639369, 1, 0, 0, 1, 1,
0.3258066, -0.8798754, 2.951926, 1, 0, 0, 1, 1,
0.3258585, 0.9376479, 0.8643003, 1, 0, 0, 1, 1,
0.3266929, -0.8422848, 4.812669, 1, 0, 0, 1, 1,
0.3288484, 1.034772, 0.559866, 0, 0, 0, 1, 1,
0.3291178, 1.202343, 0.2503404, 0, 0, 0, 1, 1,
0.333699, -0.96012, 2.119812, 0, 0, 0, 1, 1,
0.3341581, 0.3841031, 0.4934667, 0, 0, 0, 1, 1,
0.336191, 0.8253664, 0.651409, 0, 0, 0, 1, 1,
0.3388201, 1.632008, -0.4458612, 0, 0, 0, 1, 1,
0.3390805, -0.7102783, 2.331436, 0, 0, 0, 1, 1,
0.3456136, -1.264248, 3.786246, 1, 1, 1, 1, 1,
0.3466045, 0.3075716, 2.172813, 1, 1, 1, 1, 1,
0.3506133, -0.9165934, 3.396317, 1, 1, 1, 1, 1,
0.3524321, 0.1484465, 0.7158149, 1, 1, 1, 1, 1,
0.3581781, -0.1992478, 4.019607, 1, 1, 1, 1, 1,
0.3599144, -1.070694, 3.087669, 1, 1, 1, 1, 1,
0.374551, 0.718518, -0.2247564, 1, 1, 1, 1, 1,
0.3747951, 0.5836576, -1.216598, 1, 1, 1, 1, 1,
0.3800082, -0.5620514, 1.280711, 1, 1, 1, 1, 1,
0.3802865, 0.8316287, 2.257833, 1, 1, 1, 1, 1,
0.3813684, 2.194662, 0.581744, 1, 1, 1, 1, 1,
0.3838663, -0.2641962, 2.427254, 1, 1, 1, 1, 1,
0.3856133, 0.755014, 0.8717118, 1, 1, 1, 1, 1,
0.3877972, 0.7598183, 0.3075927, 1, 1, 1, 1, 1,
0.3892443, -0.08750195, 0.2445544, 1, 1, 1, 1, 1,
0.3915804, 0.790369, 1.594487, 0, 0, 1, 1, 1,
0.3917547, -1.262308, 3.508502, 1, 0, 0, 1, 1,
0.3986401, -0.6220916, 3.009571, 1, 0, 0, 1, 1,
0.4010726, 1.11416, 2.356571, 1, 0, 0, 1, 1,
0.4016742, 0.352087, 1.809579, 1, 0, 0, 1, 1,
0.4182212, 0.4566015, 0.3435917, 1, 0, 0, 1, 1,
0.4224502, 1.466561, -2.053096, 0, 0, 0, 1, 1,
0.4231167, 1.903763, 1.2953, 0, 0, 0, 1, 1,
0.4231363, -0.7217343, 3.446899, 0, 0, 0, 1, 1,
0.4281259, 0.2346025, -1.156566, 0, 0, 0, 1, 1,
0.4333621, 0.2842217, 0.7593597, 0, 0, 0, 1, 1,
0.4352949, 2.478423, 0.2382566, 0, 0, 0, 1, 1,
0.4382375, 0.6465554, 2.592898, 0, 0, 0, 1, 1,
0.4435244, -1.909943, 1.625775, 1, 1, 1, 1, 1,
0.4439605, -0.6223385, 3.303336, 1, 1, 1, 1, 1,
0.4479198, -0.2771549, 2.402945, 1, 1, 1, 1, 1,
0.449338, 1.18667, -0.3989523, 1, 1, 1, 1, 1,
0.4514585, -0.7458582, 4.232568, 1, 1, 1, 1, 1,
0.4520714, -1.150206, 2.957426, 1, 1, 1, 1, 1,
0.4551937, 0.07784819, 1.282135, 1, 1, 1, 1, 1,
0.457023, -2.296274, 3.145106, 1, 1, 1, 1, 1,
0.4578725, -1.073584, 3.126745, 1, 1, 1, 1, 1,
0.4587775, 0.9166439, 0.9784287, 1, 1, 1, 1, 1,
0.4593895, 0.3359104, 0.121487, 1, 1, 1, 1, 1,
0.4645609, 1.079138, 0.1202303, 1, 1, 1, 1, 1,
0.4673857, -1.571826, 1.036201, 1, 1, 1, 1, 1,
0.4680753, 0.1448836, 2.703255, 1, 1, 1, 1, 1,
0.4838675, -1.77298, 2.172509, 1, 1, 1, 1, 1,
0.4848461, -0.9201769, 1.918415, 0, 0, 1, 1, 1,
0.4853728, -0.8718354, 2.569128, 1, 0, 0, 1, 1,
0.4872839, 1.97876, 1.167848, 1, 0, 0, 1, 1,
0.4878128, 0.5314103, 0.924215, 1, 0, 0, 1, 1,
0.4891923, 1.094297, -0.5378906, 1, 0, 0, 1, 1,
0.4892151, 0.6897297, 0.7826151, 1, 0, 0, 1, 1,
0.4898252, -1.706556, 3.680804, 0, 0, 0, 1, 1,
0.4936092, -0.58511, 1.307837, 0, 0, 0, 1, 1,
0.4942162, 1.080713, 1.75883, 0, 0, 0, 1, 1,
0.4990507, -0.009265815, 3.743252, 0, 0, 0, 1, 1,
0.4993848, 1.794809, 0.2162406, 0, 0, 0, 1, 1,
0.5106415, 0.1784115, 1.937174, 0, 0, 0, 1, 1,
0.5121875, 1.454548, 1.754949, 0, 0, 0, 1, 1,
0.5155821, -1.899353, 4.244909, 1, 1, 1, 1, 1,
0.5182342, 0.8569404, 1.671772, 1, 1, 1, 1, 1,
0.5186897, -0.3043253, 2.115355, 1, 1, 1, 1, 1,
0.5244908, 1.803124, 1.686134, 1, 1, 1, 1, 1,
0.5258734, -1.169581, 2.401374, 1, 1, 1, 1, 1,
0.5286371, -1.560582, 3.631326, 1, 1, 1, 1, 1,
0.5310318, -0.8202925, 3.78666, 1, 1, 1, 1, 1,
0.5350563, -0.7807819, 2.791067, 1, 1, 1, 1, 1,
0.5355855, -0.1476512, 2.39096, 1, 1, 1, 1, 1,
0.5375097, 1.428878, -0.08503629, 1, 1, 1, 1, 1,
0.5394568, 0.2527032, 0.9865617, 1, 1, 1, 1, 1,
0.5405306, 1.3353, 0.2314401, 1, 1, 1, 1, 1,
0.5437854, -0.04026759, 2.874696, 1, 1, 1, 1, 1,
0.5457217, -1.124057, 2.683601, 1, 1, 1, 1, 1,
0.5484852, 0.9052522, 0.3554927, 1, 1, 1, 1, 1,
0.5512169, 1.106127, -0.2899915, 0, 0, 1, 1, 1,
0.5523917, 1.283041, -0.2936835, 1, 0, 0, 1, 1,
0.5551991, -1.08907, 3.313481, 1, 0, 0, 1, 1,
0.556024, -0.7941244, 2.190632, 1, 0, 0, 1, 1,
0.5575644, -0.8039114, 1.862403, 1, 0, 0, 1, 1,
0.5579848, 0.399614, 1.961133, 1, 0, 0, 1, 1,
0.5637205, -1.526688, 1.777586, 0, 0, 0, 1, 1,
0.5659147, 1.311713, 0.1626948, 0, 0, 0, 1, 1,
0.5698676, -0.973707, 2.639138, 0, 0, 0, 1, 1,
0.5721793, -0.7794813, 2.237841, 0, 0, 0, 1, 1,
0.5759183, -0.1857045, 1.307812, 0, 0, 0, 1, 1,
0.5783175, 1.201052, 0.607465, 0, 0, 0, 1, 1,
0.5840617, 0.7328662, 1.493735, 0, 0, 0, 1, 1,
0.5882757, 1.093247, 0.605884, 1, 1, 1, 1, 1,
0.5883759, 1.019749, 1.518714, 1, 1, 1, 1, 1,
0.5896606, 1.578891, 0.9647291, 1, 1, 1, 1, 1,
0.5905457, -1.405422, 2.322006, 1, 1, 1, 1, 1,
0.5961835, -0.2363976, 1.751002, 1, 1, 1, 1, 1,
0.5963815, 0.2441193, 3.036902, 1, 1, 1, 1, 1,
0.5966175, 0.2698061, 0.03751947, 1, 1, 1, 1, 1,
0.5996753, -1.465748, 2.605634, 1, 1, 1, 1, 1,
0.6097748, -0.7197251, 4.88269, 1, 1, 1, 1, 1,
0.6199068, 0.8348154, -0.05461647, 1, 1, 1, 1, 1,
0.6262524, 0.1973424, 0.2268324, 1, 1, 1, 1, 1,
0.627046, -0.0261913, 0.4633206, 1, 1, 1, 1, 1,
0.629469, 1.297125, 1.506307, 1, 1, 1, 1, 1,
0.6312873, 1.214535, -0.5008513, 1, 1, 1, 1, 1,
0.6330451, 2.04461, 0.3161257, 1, 1, 1, 1, 1,
0.6346079, -1.405302, 1.798517, 0, 0, 1, 1, 1,
0.637676, -2.886568, 3.637395, 1, 0, 0, 1, 1,
0.638414, -0.9649379, 1.918281, 1, 0, 0, 1, 1,
0.6431211, 0.4308997, 1.422023, 1, 0, 0, 1, 1,
0.6462549, 0.2189768, 1.430965, 1, 0, 0, 1, 1,
0.6462558, 1.203678, -1.040083, 1, 0, 0, 1, 1,
0.6506587, -0.4814762, 1.840392, 0, 0, 0, 1, 1,
0.6553368, 2.849697, -0.5722646, 0, 0, 0, 1, 1,
0.6571976, 0.3192545, 1.557798, 0, 0, 0, 1, 1,
0.6635069, 0.3510843, -0.02147225, 0, 0, 0, 1, 1,
0.6724389, 0.6184571, 2.038238, 0, 0, 0, 1, 1,
0.6765895, 0.1781497, -1.204373, 0, 0, 0, 1, 1,
0.6780363, 1.391672, -0.6516919, 0, 0, 0, 1, 1,
0.6804841, 0.7370104, 0.1210384, 1, 1, 1, 1, 1,
0.6813982, -0.7616565, 2.20024, 1, 1, 1, 1, 1,
0.6851896, -0.8234904, 2.510437, 1, 1, 1, 1, 1,
0.6852639, -1.381371, 3.11599, 1, 1, 1, 1, 1,
0.6879011, 2.010819, -0.6325291, 1, 1, 1, 1, 1,
0.6900442, 0.814914, -1.302384, 1, 1, 1, 1, 1,
0.6901758, 0.009262335, 1.836672, 1, 1, 1, 1, 1,
0.69073, 0.1053109, 1.955642, 1, 1, 1, 1, 1,
0.6918101, -0.4647542, 1.881197, 1, 1, 1, 1, 1,
0.6948035, -0.4098871, 1.856401, 1, 1, 1, 1, 1,
0.7026983, -0.01808731, 1.389303, 1, 1, 1, 1, 1,
0.7069991, -0.6350421, 1.639733, 1, 1, 1, 1, 1,
0.7104401, -0.5627652, 4.49071, 1, 1, 1, 1, 1,
0.7141892, 0.3784884, 0.2129059, 1, 1, 1, 1, 1,
0.7204161, -0.3922202, 2.704202, 1, 1, 1, 1, 1,
0.7225155, 1.242686, -0.7871235, 0, 0, 1, 1, 1,
0.7346417, -0.7383288, 1.620857, 1, 0, 0, 1, 1,
0.7409603, -0.1604481, 2.143387, 1, 0, 0, 1, 1,
0.7508512, -1.234083, 4.640461, 1, 0, 0, 1, 1,
0.7560133, 1.007533, 1.672586, 1, 0, 0, 1, 1,
0.7631528, -0.7189415, 2.63442, 1, 0, 0, 1, 1,
0.7667806, 0.4909638, 1.266423, 0, 0, 0, 1, 1,
0.7711473, -1.128316, 4.634202, 0, 0, 0, 1, 1,
0.7723617, 1.526105, 0.3677797, 0, 0, 0, 1, 1,
0.7753296, -1.107763, 2.637913, 0, 0, 0, 1, 1,
0.7821048, -1.19035, 4.066124, 0, 0, 0, 1, 1,
0.7880089, -0.7308082, 2.620814, 0, 0, 0, 1, 1,
0.7948976, -0.7976504, 1.032151, 0, 0, 0, 1, 1,
0.7991834, -0.509966, 2.58446, 1, 1, 1, 1, 1,
0.8004414, -1.3384, 1.365315, 1, 1, 1, 1, 1,
0.8027464, 0.1012253, 1.127104, 1, 1, 1, 1, 1,
0.8036615, -1.136446, 2.815483, 1, 1, 1, 1, 1,
0.8053536, -0.3680801, -0.7656505, 1, 1, 1, 1, 1,
0.8064746, 0.2487544, 1.238113, 1, 1, 1, 1, 1,
0.8111395, 0.167211, 1.329265, 1, 1, 1, 1, 1,
0.8165457, 0.04712592, -0.2642497, 1, 1, 1, 1, 1,
0.8198735, -0.1573918, 1.731268, 1, 1, 1, 1, 1,
0.8215076, -1.058058, 1.501198, 1, 1, 1, 1, 1,
0.8244928, -0.3200307, 1.608822, 1, 1, 1, 1, 1,
0.8258979, 1.519956, 1.209425, 1, 1, 1, 1, 1,
0.8260707, 0.07123674, 1.141443, 1, 1, 1, 1, 1,
0.830884, -1.762524, 2.019375, 1, 1, 1, 1, 1,
0.8352318, -0.2262794, 3.619916, 1, 1, 1, 1, 1,
0.8390468, 0.5385698, 1.051733, 0, 0, 1, 1, 1,
0.8409037, -0.4808992, 0.6998251, 1, 0, 0, 1, 1,
0.8428264, -2.149074, 2.980671, 1, 0, 0, 1, 1,
0.8498997, 2.811421, -0.4189861, 1, 0, 0, 1, 1,
0.8555465, 0.6686853, 0.2282304, 1, 0, 0, 1, 1,
0.8566853, 0.03686263, 2.988287, 1, 0, 0, 1, 1,
0.8600255, -0.4059568, 2.697934, 0, 0, 0, 1, 1,
0.86353, -1.066119, 3.474369, 0, 0, 0, 1, 1,
0.8655043, 0.01040291, 1.307744, 0, 0, 0, 1, 1,
0.8676506, -1.188963, 0.2138262, 0, 0, 0, 1, 1,
0.8676673, -0.556453, 2.638632, 0, 0, 0, 1, 1,
0.8858923, -1.201558, 4.044123, 0, 0, 0, 1, 1,
0.8888035, 0.3229606, -0.6660876, 0, 0, 0, 1, 1,
0.8918101, -0.7112526, 4.121459, 1, 1, 1, 1, 1,
0.8925684, -1.073164, 0.5548526, 1, 1, 1, 1, 1,
0.902098, -0.4578521, 2.077197, 1, 1, 1, 1, 1,
0.9033166, 0.01945975, 1.560443, 1, 1, 1, 1, 1,
0.9046679, -1.054624, 2.970962, 1, 1, 1, 1, 1,
0.9100752, -1.350617, 1.983106, 1, 1, 1, 1, 1,
0.9141549, -0.5672438, 1.817007, 1, 1, 1, 1, 1,
0.9203521, 0.9236624, -1.128444, 1, 1, 1, 1, 1,
0.9205281, -1.135494, -0.0107546, 1, 1, 1, 1, 1,
0.9218683, 0.5216306, -0.8652097, 1, 1, 1, 1, 1,
0.9260486, 0.5787894, 1.205886, 1, 1, 1, 1, 1,
0.9274386, 1.004481, 2.441423, 1, 1, 1, 1, 1,
0.9297872, 1.588963, 0.712545, 1, 1, 1, 1, 1,
0.9300875, 0.05383182, 0.8568858, 1, 1, 1, 1, 1,
0.9326016, 1.234421, -0.1609926, 1, 1, 1, 1, 1,
0.9353938, 1.35409, 1.245396, 0, 0, 1, 1, 1,
0.9354863, 0.8159262, 0.9067807, 1, 0, 0, 1, 1,
0.9370161, -0.6916299, 1.3561, 1, 0, 0, 1, 1,
0.9435874, 0.2250939, 1.775437, 1, 0, 0, 1, 1,
0.9476888, -1.071474, 1.009352, 1, 0, 0, 1, 1,
0.9496995, 2.106067, 1.049625, 1, 0, 0, 1, 1,
0.9515591, 0.4732536, 2.959924, 0, 0, 0, 1, 1,
0.9588366, 1.484038, 0.8906358, 0, 0, 0, 1, 1,
0.9685504, 0.3036274, 0.242082, 0, 0, 0, 1, 1,
0.9692501, -2.506453, 2.192715, 0, 0, 0, 1, 1,
0.9828692, -0.6830152, 2.285902, 0, 0, 0, 1, 1,
0.9959332, 1.073311, 1.164727, 0, 0, 0, 1, 1,
0.996348, 0.9057024, 1.762401, 0, 0, 0, 1, 1,
0.9970798, -1.10098, 1.646765, 1, 1, 1, 1, 1,
0.9994171, 0.541443, 1.761602, 1, 1, 1, 1, 1,
1.001522, -0.6912638, 1.98657, 1, 1, 1, 1, 1,
1.00604, -0.01347642, 0.6637976, 1, 1, 1, 1, 1,
1.006075, 0.3761119, 1.385553, 1, 1, 1, 1, 1,
1.00657, -0.02432988, 1.768839, 1, 1, 1, 1, 1,
1.007117, 1.309877, 0.3216215, 1, 1, 1, 1, 1,
1.026281, -0.6114109, 3.75977, 1, 1, 1, 1, 1,
1.030692, -0.1454547, 1.253776, 1, 1, 1, 1, 1,
1.03477, 0.6924514, 0.7631758, 1, 1, 1, 1, 1,
1.041094, 1.767537, 0.4412161, 1, 1, 1, 1, 1,
1.043168, -1.247528, 1.386441, 1, 1, 1, 1, 1,
1.044334, 0.4283882, 0.8777496, 1, 1, 1, 1, 1,
1.047887, 1.722351, -0.196068, 1, 1, 1, 1, 1,
1.048204, -0.4947637, 1.398982, 1, 1, 1, 1, 1,
1.050737, -1.14716, 3.387636, 0, 0, 1, 1, 1,
1.05724, -0.8151138, 3.974175, 1, 0, 0, 1, 1,
1.057989, 0.8318397, 0.09377078, 1, 0, 0, 1, 1,
1.059939, 2.527556, -0.9575299, 1, 0, 0, 1, 1,
1.063159, 1.487872, 0.4263606, 1, 0, 0, 1, 1,
1.074811, -0.2797043, 1.636008, 1, 0, 0, 1, 1,
1.09036, 1.446714, 0.1580899, 0, 0, 0, 1, 1,
1.100996, -0.007958024, 0.2007371, 0, 0, 0, 1, 1,
1.102614, -1.294016, 4.57293, 0, 0, 0, 1, 1,
1.103435, -0.603247, 2.170883, 0, 0, 0, 1, 1,
1.105609, -0.1398756, -1.308791, 0, 0, 0, 1, 1,
1.105919, -1.610898, 1.501299, 0, 0, 0, 1, 1,
1.107589, -0.9497679, 1.129168, 0, 0, 0, 1, 1,
1.112064, 1.139272, 1.765883, 1, 1, 1, 1, 1,
1.115132, -0.8213041, 2.732865, 1, 1, 1, 1, 1,
1.127793, -0.59269, 1.819103, 1, 1, 1, 1, 1,
1.128914, 0.1116854, 1.707257, 1, 1, 1, 1, 1,
1.133116, -0.8348094, 1.038367, 1, 1, 1, 1, 1,
1.134944, 0.5575761, 1.290237, 1, 1, 1, 1, 1,
1.135278, 0.7316056, 1.380948, 1, 1, 1, 1, 1,
1.138073, -0.6019087, 1.641148, 1, 1, 1, 1, 1,
1.147519, 0.3884363, 0.3322967, 1, 1, 1, 1, 1,
1.150728, -0.398534, 2.756953, 1, 1, 1, 1, 1,
1.150768, 1.103276, 0.09829757, 1, 1, 1, 1, 1,
1.151158, 0.2303561, 0.05260872, 1, 1, 1, 1, 1,
1.151708, 0.4211592, 0.971274, 1, 1, 1, 1, 1,
1.154349, 0.09150656, 1.482004, 1, 1, 1, 1, 1,
1.154819, -1.401058, 0.9444709, 1, 1, 1, 1, 1,
1.168126, -1.578563, 4.666459, 0, 0, 1, 1, 1,
1.168782, 0.4912178, 1.03565, 1, 0, 0, 1, 1,
1.170384, -1.314131, 1.84772, 1, 0, 0, 1, 1,
1.170457, 0.8715994, 1.61715, 1, 0, 0, 1, 1,
1.1769, -0.1032394, 0.8269414, 1, 0, 0, 1, 1,
1.189414, -1.092489, 2.328148, 1, 0, 0, 1, 1,
1.195399, 0.2469482, 1.004967, 0, 0, 0, 1, 1,
1.196795, -1.021561, 0.05724018, 0, 0, 0, 1, 1,
1.197291, 0.3107935, 1.510238, 0, 0, 0, 1, 1,
1.199488, 1.468127, 0.97161, 0, 0, 0, 1, 1,
1.201483, 0.5190014, 2.635885, 0, 0, 0, 1, 1,
1.201485, 2.863656, 2.666816, 0, 0, 0, 1, 1,
1.21341, -2.243241, 3.880205, 0, 0, 0, 1, 1,
1.226886, -0.6797579, 0.5751618, 1, 1, 1, 1, 1,
1.233717, 2.360367, 0.3058866, 1, 1, 1, 1, 1,
1.234263, 0.2862319, 1.458556, 1, 1, 1, 1, 1,
1.236144, 1.722798, 2.074062, 1, 1, 1, 1, 1,
1.238832, 1.456454, 0.1299775, 1, 1, 1, 1, 1,
1.240679, -1.836857, 3.899566, 1, 1, 1, 1, 1,
1.246457, 0.1124492, 1.675474, 1, 1, 1, 1, 1,
1.25189, -0.01716109, 1.093053, 1, 1, 1, 1, 1,
1.255987, -0.1269312, 1.008621, 1, 1, 1, 1, 1,
1.261363, 0.009643862, 3.023142, 1, 1, 1, 1, 1,
1.269724, 0.6856426, -0.04542291, 1, 1, 1, 1, 1,
1.270676, 0.7430667, 0.6947988, 1, 1, 1, 1, 1,
1.275244, -0.1713814, 2.615864, 1, 1, 1, 1, 1,
1.281954, -0.6859353, 1.601357, 1, 1, 1, 1, 1,
1.286676, -0.7876974, 2.716085, 1, 1, 1, 1, 1,
1.290664, 1.270962, 2.19275, 0, 0, 1, 1, 1,
1.294763, -1.115756, 3.243664, 1, 0, 0, 1, 1,
1.297639, -0.9303933, 2.692631, 1, 0, 0, 1, 1,
1.307274, 0.3068472, 1.038517, 1, 0, 0, 1, 1,
1.309772, -0.2209025, 2.165827, 1, 0, 0, 1, 1,
1.321356, -0.2072612, 3.232282, 1, 0, 0, 1, 1,
1.338448, -1.403562, 3.554649, 0, 0, 0, 1, 1,
1.339884, 0.2865287, 0.2657473, 0, 0, 0, 1, 1,
1.344982, 0.1210046, 1.305174, 0, 0, 0, 1, 1,
1.367383, -1.198911, 3.127428, 0, 0, 0, 1, 1,
1.367435, 1.395332, 0.1040025, 0, 0, 0, 1, 1,
1.370211, -0.9382226, 1.948438, 0, 0, 0, 1, 1,
1.372455, -1.591137, 1.449475, 0, 0, 0, 1, 1,
1.372758, -0.7442368, 3.148188, 1, 1, 1, 1, 1,
1.377244, 0.1856693, 1.932728, 1, 1, 1, 1, 1,
1.378776, -0.8772671, 1.552427, 1, 1, 1, 1, 1,
1.396585, -0.2362232, 3.549969, 1, 1, 1, 1, 1,
1.397714, -0.292298, 1.615487, 1, 1, 1, 1, 1,
1.398592, 1.016139, 1.984485, 1, 1, 1, 1, 1,
1.401651, -0.5877461, 1.146465, 1, 1, 1, 1, 1,
1.402217, -0.2226215, 0.5040773, 1, 1, 1, 1, 1,
1.408544, -0.02250165, 1.30118, 1, 1, 1, 1, 1,
1.413222, -0.159401, 1.056123, 1, 1, 1, 1, 1,
1.446208, 1.402473, -0.2808279, 1, 1, 1, 1, 1,
1.4656, -0.5913996, 1.984917, 1, 1, 1, 1, 1,
1.468222, 0.06504212, 2.555838, 1, 1, 1, 1, 1,
1.469473, -0.7744418, 2.640802, 1, 1, 1, 1, 1,
1.469677, 0.2154934, 2.15764, 1, 1, 1, 1, 1,
1.473799, 1.854667, 0.9273134, 0, 0, 1, 1, 1,
1.475055, -0.5074548, 0.9771687, 1, 0, 0, 1, 1,
1.476778, -0.5576414, 0.8399393, 1, 0, 0, 1, 1,
1.477742, -1.544238, 1.527852, 1, 0, 0, 1, 1,
1.508421, -1.80261, 3.80485, 1, 0, 0, 1, 1,
1.516804, -0.5920701, 3.29968, 1, 0, 0, 1, 1,
1.517417, 1.647474, 1.316384, 0, 0, 0, 1, 1,
1.528152, -0.4380646, 1.945313, 0, 0, 0, 1, 1,
1.530034, 1.89913, -0.4362195, 0, 0, 0, 1, 1,
1.531477, -1.773928, 1.956598, 0, 0, 0, 1, 1,
1.535594, -0.5357466, 2.615711, 0, 0, 0, 1, 1,
1.536925, 1.213122, 1.685294, 0, 0, 0, 1, 1,
1.543362, -0.2346634, 0.841248, 0, 0, 0, 1, 1,
1.550915, 0.06651311, 1.738771, 1, 1, 1, 1, 1,
1.554655, -0.4047564, 0.809098, 1, 1, 1, 1, 1,
1.568183, 0.04700199, 2.746491, 1, 1, 1, 1, 1,
1.575449, -1.8272, 2.235288, 1, 1, 1, 1, 1,
1.577955, -0.3926287, 0.04081584, 1, 1, 1, 1, 1,
1.590973, -0.3728618, 1.17577, 1, 1, 1, 1, 1,
1.611625, 0.3875112, 1.102715, 1, 1, 1, 1, 1,
1.616146, -0.07360358, 1.880027, 1, 1, 1, 1, 1,
1.627295, -1.279351, 3.298777, 1, 1, 1, 1, 1,
1.634717, 1.275147, 2.306909, 1, 1, 1, 1, 1,
1.651446, 0.4395309, 0.7271577, 1, 1, 1, 1, 1,
1.656715, -0.8384867, 0.728237, 1, 1, 1, 1, 1,
1.685487, -1.169679, 3.52277, 1, 1, 1, 1, 1,
1.687885, -0.1184776, 2.756305, 1, 1, 1, 1, 1,
1.717932, 1.9869, 0.6235816, 1, 1, 1, 1, 1,
1.747925, -0.6653063, 0.06550613, 0, 0, 1, 1, 1,
1.758259, -1.890586, 3.425812, 1, 0, 0, 1, 1,
1.768666, -1.236966, 1.827259, 1, 0, 0, 1, 1,
1.777054, -1.451044, 4.502735, 1, 0, 0, 1, 1,
1.787921, 1.659431, 1.174325, 1, 0, 0, 1, 1,
1.789273, 0.3265394, 1.156417, 1, 0, 0, 1, 1,
1.79168, 0.9032307, 2.156204, 0, 0, 0, 1, 1,
1.801606, -0.1608203, 2.253679, 0, 0, 0, 1, 1,
1.811793, 0.323636, 1.747414, 0, 0, 0, 1, 1,
1.813812, -0.8653232, 2.928815, 0, 0, 0, 1, 1,
1.814892, -0.3855247, 1.795022, 0, 0, 0, 1, 1,
1.816298, -0.32075, 1.053935, 0, 0, 0, 1, 1,
1.823804, 1.1103, 0.9355243, 0, 0, 0, 1, 1,
1.828029, 0.01760785, 0.7193993, 1, 1, 1, 1, 1,
1.848406, -1.005434, 3.329045, 1, 1, 1, 1, 1,
1.861335, 0.6377478, 0.8152347, 1, 1, 1, 1, 1,
1.862908, 0.2132643, -0.2973648, 1, 1, 1, 1, 1,
1.864936, -0.9425878, 2.841949, 1, 1, 1, 1, 1,
1.909364, 0.4151111, 1.879536, 1, 1, 1, 1, 1,
1.921667, 0.6231189, -0.2056112, 1, 1, 1, 1, 1,
1.941811, 0.9760365, 1.881786, 1, 1, 1, 1, 1,
1.967776, 0.2960258, 2.213122, 1, 1, 1, 1, 1,
1.97032, -0.187041, 0.7112021, 1, 1, 1, 1, 1,
1.970662, 0.2476367, 0.2703745, 1, 1, 1, 1, 1,
2.000175, -0.1593837, 1.241062, 1, 1, 1, 1, 1,
2.008038, -1.388973, 1.272807, 1, 1, 1, 1, 1,
2.016472, -0.3862039, -0.5319579, 1, 1, 1, 1, 1,
2.01752, -0.1724585, 0.8168333, 1, 1, 1, 1, 1,
2.033338, -0.04061187, 3.905201, 0, 0, 1, 1, 1,
2.045532, -1.530426, 1.502688, 1, 0, 0, 1, 1,
2.04785, 0.6252022, 0.4080331, 1, 0, 0, 1, 1,
2.054808, 1.196892, 0.5978599, 1, 0, 0, 1, 1,
2.055055, 0.3280592, 1.142424, 1, 0, 0, 1, 1,
2.100941, -0.1490604, 2.708768, 1, 0, 0, 1, 1,
2.116951, -0.4901598, 1.505243, 0, 0, 0, 1, 1,
2.125081, 1.214387, 2.91885, 0, 0, 0, 1, 1,
2.133533, 0.4560329, 1.632696, 0, 0, 0, 1, 1,
2.155159, 1.276938, 0.9917049, 0, 0, 0, 1, 1,
2.433028, -0.8764149, 3.061036, 0, 0, 0, 1, 1,
2.481785, 1.024297, 0.4339653, 0, 0, 0, 1, 1,
2.519339, -0.2264056, 1.520468, 0, 0, 0, 1, 1,
2.525151, -1.181684, 0.3247314, 1, 1, 1, 1, 1,
2.542739, 0.4575673, 1.272832, 1, 1, 1, 1, 1,
2.556943, -0.674798, 3.366876, 1, 1, 1, 1, 1,
2.704385, 1.397232, 1.534284, 1, 1, 1, 1, 1,
2.950329, -0.9055397, 1.786112, 1, 1, 1, 1, 1,
3.017906, -1.112632, 3.502463, 1, 1, 1, 1, 1,
3.256117, -0.6694266, 4.243569, 1, 1, 1, 1, 1
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
var radius = 9.6427;
var distance = 33.86958;
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
mvMatrix.translate( 0.2541082, -0.02078199, 0.1393199 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.86958);
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
