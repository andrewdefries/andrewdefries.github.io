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
-3.446431, 1.00516, 0.4347899, 1, 0, 0, 1,
-3.234681, -0.6076548, -3.80134, 1, 0.007843138, 0, 1,
-2.818324, -0.5219465, -0.06196911, 1, 0.01176471, 0, 1,
-2.78926, 0.2099719, -0.7109872, 1, 0.01960784, 0, 1,
-2.657026, 0.865235, -1.418683, 1, 0.02352941, 0, 1,
-2.653448, 1.993348, -0.6006548, 1, 0.03137255, 0, 1,
-2.546739, 0.4470445, 0.4751576, 1, 0.03529412, 0, 1,
-2.506999, 0.7719404, -1.690325, 1, 0.04313726, 0, 1,
-2.441846, -0.2410646, -1.467483, 1, 0.04705882, 0, 1,
-2.282113, 0.4776569, -0.6459999, 1, 0.05490196, 0, 1,
-2.269599, 2.134303, -1.051574, 1, 0.05882353, 0, 1,
-2.176934, -0.5080371, -2.029379, 1, 0.06666667, 0, 1,
-2.16152, 0.8121988, -2.354698, 1, 0.07058824, 0, 1,
-2.145592, -0.009632891, -1.725038, 1, 0.07843138, 0, 1,
-2.122886, 2.190165, -0.6394174, 1, 0.08235294, 0, 1,
-2.112033, 0.4253641, -3.518973, 1, 0.09019608, 0, 1,
-2.107296, 1.832623, -0.929046, 1, 0.09411765, 0, 1,
-2.079706, 1.444949, -0.3893867, 1, 0.1019608, 0, 1,
-2.073794, -1.167399, -3.001811, 1, 0.1098039, 0, 1,
-2.072622, 1.345481, 0.03426119, 1, 0.1137255, 0, 1,
-2.056691, 0.4481638, -4.648401, 1, 0.1215686, 0, 1,
-2.056483, -1.544813, -3.377135, 1, 0.1254902, 0, 1,
-2.025988, -1.124791, -1.101052, 1, 0.1333333, 0, 1,
-1.991338, -1.584811, -1.211982, 1, 0.1372549, 0, 1,
-1.969383, 0.05420569, -1.324186, 1, 0.145098, 0, 1,
-1.924903, -0.86092, -1.752242, 1, 0.1490196, 0, 1,
-1.889948, 0.5889423, -2.795353, 1, 0.1568628, 0, 1,
-1.877387, 0.2664528, -2.813655, 1, 0.1607843, 0, 1,
-1.863352, 1.432414, -2.356236, 1, 0.1686275, 0, 1,
-1.861209, 0.1867798, -0.6289713, 1, 0.172549, 0, 1,
-1.835394, -0.1914246, -2.01348, 1, 0.1803922, 0, 1,
-1.811081, 1.963658, -0.7507746, 1, 0.1843137, 0, 1,
-1.807423, 0.1138201, -2.407458, 1, 0.1921569, 0, 1,
-1.792936, -0.4487546, -1.116624, 1, 0.1960784, 0, 1,
-1.79241, -0.8035165, -2.013871, 1, 0.2039216, 0, 1,
-1.7767, 1.094889, 0.6613408, 1, 0.2117647, 0, 1,
-1.775281, -0.8646711, -2.283966, 1, 0.2156863, 0, 1,
-1.774578, -0.6883247, -2.499162, 1, 0.2235294, 0, 1,
-1.763546, 0.2892295, -0.7322332, 1, 0.227451, 0, 1,
-1.760661, -1.045707, -1.564954, 1, 0.2352941, 0, 1,
-1.748892, 1.419794, -1.324389, 1, 0.2392157, 0, 1,
-1.721537, 1.89712, -0.1715467, 1, 0.2470588, 0, 1,
-1.690893, 0.2255832, -2.418761, 1, 0.2509804, 0, 1,
-1.668294, -0.914823, -2.045272, 1, 0.2588235, 0, 1,
-1.662959, 0.6710642, -0.5213389, 1, 0.2627451, 0, 1,
-1.662913, 0.23552, -1.518884, 1, 0.2705882, 0, 1,
-1.654155, -0.1889573, -1.091047, 1, 0.2745098, 0, 1,
-1.653782, 1.100668, 0.2089561, 1, 0.282353, 0, 1,
-1.653732, 0.9788064, -3.140495, 1, 0.2862745, 0, 1,
-1.609723, -1.047235, -4.340376, 1, 0.2941177, 0, 1,
-1.600355, 0.03054676, -1.983494, 1, 0.3019608, 0, 1,
-1.600098, 1.02382, -2.191563, 1, 0.3058824, 0, 1,
-1.589323, -1.437081, -2.543304, 1, 0.3137255, 0, 1,
-1.587091, 0.4389312, -2.854599, 1, 0.3176471, 0, 1,
-1.546786, -0.5469455, 0.1706593, 1, 0.3254902, 0, 1,
-1.540448, -0.3988037, -2.161897, 1, 0.3294118, 0, 1,
-1.540282, 0.008550162, -1.390893, 1, 0.3372549, 0, 1,
-1.537802, -1.203224, -1.84523, 1, 0.3411765, 0, 1,
-1.533732, 0.6868924, -1.723967, 1, 0.3490196, 0, 1,
-1.515514, 0.6748316, -0.8231087, 1, 0.3529412, 0, 1,
-1.494846, 1.004178, -1.249119, 1, 0.3607843, 0, 1,
-1.477484, -1.078699, -2.510363, 1, 0.3647059, 0, 1,
-1.469851, -2.350133, -2.48336, 1, 0.372549, 0, 1,
-1.469053, -0.9286898, -3.54552, 1, 0.3764706, 0, 1,
-1.464679, -0.9283478, -0.692795, 1, 0.3843137, 0, 1,
-1.45417, 1.464268, -1.161142, 1, 0.3882353, 0, 1,
-1.444381, -0.6132758, -1.202729, 1, 0.3960784, 0, 1,
-1.438961, -0.6918892, -2.154407, 1, 0.4039216, 0, 1,
-1.419283, -0.1516895, -1.422488, 1, 0.4078431, 0, 1,
-1.416648, -0.8806814, -2.97683, 1, 0.4156863, 0, 1,
-1.416448, 0.7029729, -1.031996, 1, 0.4196078, 0, 1,
-1.411047, -0.5650958, -0.8397832, 1, 0.427451, 0, 1,
-1.401789, -2.21473, -2.998165, 1, 0.4313726, 0, 1,
-1.397566, -0.8900796, -2.741325, 1, 0.4392157, 0, 1,
-1.397319, 0.8958378, -0.3186766, 1, 0.4431373, 0, 1,
-1.392944, -0.7091851, -2.228872, 1, 0.4509804, 0, 1,
-1.372847, 0.7758284, -1.019267, 1, 0.454902, 0, 1,
-1.358882, -0.1257754, 0.07052547, 1, 0.4627451, 0, 1,
-1.355951, 1.055063, 0.01702236, 1, 0.4666667, 0, 1,
-1.351069, 1.424123, -0.5335599, 1, 0.4745098, 0, 1,
-1.344781, 0.1657403, -0.9262986, 1, 0.4784314, 0, 1,
-1.344753, 0.07916602, -3.475881, 1, 0.4862745, 0, 1,
-1.324781, 1.752634, -1.355026, 1, 0.4901961, 0, 1,
-1.316087, -0.0668285, -3.000594, 1, 0.4980392, 0, 1,
-1.307646, -1.278884, -1.221156, 1, 0.5058824, 0, 1,
-1.282953, -0.7827513, -2.712153, 1, 0.509804, 0, 1,
-1.278018, 1.947481, 1.285301, 1, 0.5176471, 0, 1,
-1.271724, -0.3218451, -4.239828, 1, 0.5215687, 0, 1,
-1.271239, 0.3907579, 1.360668, 1, 0.5294118, 0, 1,
-1.26927, -1.402718, -2.333119, 1, 0.5333334, 0, 1,
-1.268784, 1.182145, -0.6103455, 1, 0.5411765, 0, 1,
-1.26179, 0.2574801, -0.8381733, 1, 0.5450981, 0, 1,
-1.248689, -0.8971751, -2.14121, 1, 0.5529412, 0, 1,
-1.246186, 0.315808, -1.744733, 1, 0.5568628, 0, 1,
-1.225852, 0.7938029, -0.6633468, 1, 0.5647059, 0, 1,
-1.225104, -1.500598, -1.99538, 1, 0.5686275, 0, 1,
-1.219861, 0.0648081, -0.7766206, 1, 0.5764706, 0, 1,
-1.214465, 0.005919649, -1.887461, 1, 0.5803922, 0, 1,
-1.199804, -0.03924513, -0.2030696, 1, 0.5882353, 0, 1,
-1.197138, 1.198232, -0.49992, 1, 0.5921569, 0, 1,
-1.196018, 1.716053, -0.5096155, 1, 0.6, 0, 1,
-1.195711, -0.1517016, -2.716741, 1, 0.6078432, 0, 1,
-1.190529, 1.529698, -0.8880313, 1, 0.6117647, 0, 1,
-1.189567, 0.4204776, -0.8499743, 1, 0.6196079, 0, 1,
-1.188459, -0.4012242, -2.285955, 1, 0.6235294, 0, 1,
-1.187316, -1.247335, -1.817606, 1, 0.6313726, 0, 1,
-1.185131, -0.335464, -2.620712, 1, 0.6352941, 0, 1,
-1.183795, 0.7011711, -2.385514, 1, 0.6431373, 0, 1,
-1.180917, 2.00799, -1.136731, 1, 0.6470588, 0, 1,
-1.17434, 0.415136, -2.042651, 1, 0.654902, 0, 1,
-1.173176, 0.6310618, -0.7980568, 1, 0.6588235, 0, 1,
-1.173052, -0.8000894, -3.273066, 1, 0.6666667, 0, 1,
-1.170638, 0.02736955, -2.446678, 1, 0.6705883, 0, 1,
-1.170483, 0.1890354, -3.87637, 1, 0.6784314, 0, 1,
-1.167896, 1.025744, 0.2375876, 1, 0.682353, 0, 1,
-1.167271, 0.6596012, -3.078465, 1, 0.6901961, 0, 1,
-1.166552, -2.554225, -3.347997, 1, 0.6941177, 0, 1,
-1.163673, -1.049268, -0.9795783, 1, 0.7019608, 0, 1,
-1.160695, 0.7714619, -1.300813, 1, 0.7098039, 0, 1,
-1.160433, 2.192123, -1.072992, 1, 0.7137255, 0, 1,
-1.159312, -2.368684, -3.873452, 1, 0.7215686, 0, 1,
-1.150728, -2.026758, -1.151816, 1, 0.7254902, 0, 1,
-1.146249, -0.1134549, -1.041777, 1, 0.7333333, 0, 1,
-1.135078, -1.338516, -3.464617, 1, 0.7372549, 0, 1,
-1.130865, -1.165835, -2.053554, 1, 0.7450981, 0, 1,
-1.126903, -0.8271955, -1.814343, 1, 0.7490196, 0, 1,
-1.126645, -1.162787, -1.816957, 1, 0.7568628, 0, 1,
-1.12323, -0.6149247, -1.232025, 1, 0.7607843, 0, 1,
-1.121216, 0.2150273, -2.070148, 1, 0.7686275, 0, 1,
-1.104376, -0.5560078, -2.030131, 1, 0.772549, 0, 1,
-1.100034, -0.3497171, -2.401338, 1, 0.7803922, 0, 1,
-1.090232, -1.274113, -2.803323, 1, 0.7843137, 0, 1,
-1.090031, -0.148276, -2.339444, 1, 0.7921569, 0, 1,
-1.089402, -0.8706098, -2.074504, 1, 0.7960784, 0, 1,
-1.083366, -1.313065, -0.7931663, 1, 0.8039216, 0, 1,
-1.073636, -0.1818886, -0.458758, 1, 0.8117647, 0, 1,
-1.073202, 0.1121668, -2.296181, 1, 0.8156863, 0, 1,
-1.072858, -0.1814992, -1.386454, 1, 0.8235294, 0, 1,
-1.069233, 0.22065, -2.353003, 1, 0.827451, 0, 1,
-1.068434, 0.3218088, -1.317494, 1, 0.8352941, 0, 1,
-1.058579, -0.359534, -3.229288, 1, 0.8392157, 0, 1,
-1.057479, 0.3523911, -1.857285, 1, 0.8470588, 0, 1,
-1.04471, -2.537098, -2.381334, 1, 0.8509804, 0, 1,
-1.039713, -1.078779, -1.882468, 1, 0.8588235, 0, 1,
-1.034472, -0.599613, -1.532802, 1, 0.8627451, 0, 1,
-1.029131, 0.1341538, -1.115305, 1, 0.8705882, 0, 1,
-1.023945, -1.224887, -1.014612, 1, 0.8745098, 0, 1,
-1.019787, 0.04095191, -0.3799271, 1, 0.8823529, 0, 1,
-1.01808, 1.806657, -0.9712147, 1, 0.8862745, 0, 1,
-1.010176, -1.193137, -2.608932, 1, 0.8941177, 0, 1,
-1.00872, 0.6695222, -1.122554, 1, 0.8980392, 0, 1,
-1.004751, 1.308859, -1.591551, 1, 0.9058824, 0, 1,
-0.9987803, -0.6353738, -2.569607, 1, 0.9137255, 0, 1,
-0.9982709, 2.831333, 1.025507, 1, 0.9176471, 0, 1,
-0.9976993, 0.1222627, -1.588853, 1, 0.9254902, 0, 1,
-0.9964719, 1.537893, -0.450117, 1, 0.9294118, 0, 1,
-0.9951444, -1.02777, -1.582606, 1, 0.9372549, 0, 1,
-0.9948233, -0.9214503, -2.750159, 1, 0.9411765, 0, 1,
-0.9935949, 0.7768857, -0.1852169, 1, 0.9490196, 0, 1,
-0.9923096, -0.8390046, -2.125964, 1, 0.9529412, 0, 1,
-0.991529, -0.0786543, -1.711246, 1, 0.9607843, 0, 1,
-0.9880399, -0.8617206, -1.675454, 1, 0.9647059, 0, 1,
-0.9869972, 0.2902872, -1.703443, 1, 0.972549, 0, 1,
-0.9853193, 0.792011, -0.8728134, 1, 0.9764706, 0, 1,
-0.9842434, -2.818706, -3.212135, 1, 0.9843137, 0, 1,
-0.984061, -1.074563, -0.8429826, 1, 0.9882353, 0, 1,
-0.9833636, 0.5412407, -1.76092, 1, 0.9960784, 0, 1,
-0.9807987, 1.220556, -0.01256388, 0.9960784, 1, 0, 1,
-0.9773738, -0.8756405, -2.71497, 0.9921569, 1, 0, 1,
-0.9751891, 0.5367442, 0.4288829, 0.9843137, 1, 0, 1,
-0.9736956, -1.111697, -4.131816, 0.9803922, 1, 0, 1,
-0.9723396, -0.3824086, -0.213291, 0.972549, 1, 0, 1,
-0.9684765, -0.5953155, -2.635726, 0.9686275, 1, 0, 1,
-0.966018, 0.1991398, -1.60789, 0.9607843, 1, 0, 1,
-0.9627368, 0.9989828, -2.12994, 0.9568627, 1, 0, 1,
-0.9514846, 0.6184092, 2.571373, 0.9490196, 1, 0, 1,
-0.9486971, -1.057676, -3.073246, 0.945098, 1, 0, 1,
-0.9461282, 0.8717902, 0.0469985, 0.9372549, 1, 0, 1,
-0.9424741, 0.2629077, -1.537288, 0.9333333, 1, 0, 1,
-0.9414149, 1.102882, -0.957302, 0.9254902, 1, 0, 1,
-0.934091, 1.178059, -0.2267867, 0.9215686, 1, 0, 1,
-0.9300717, 1.189156, -0.6856968, 0.9137255, 1, 0, 1,
-0.9289616, -0.4171861, -0.1058147, 0.9098039, 1, 0, 1,
-0.9253367, -0.464487, -0.9751376, 0.9019608, 1, 0, 1,
-0.9161899, -2.090122, -2.371924, 0.8941177, 1, 0, 1,
-0.9126588, 0.1327834, -1.977222, 0.8901961, 1, 0, 1,
-0.9122559, -0.5711005, -3.729071, 0.8823529, 1, 0, 1,
-0.9088947, 1.676652, -0.2980223, 0.8784314, 1, 0, 1,
-0.9029123, 0.3181357, -2.265992, 0.8705882, 1, 0, 1,
-0.8967811, 0.6424084, -1.458765, 0.8666667, 1, 0, 1,
-0.8852673, 0.8960477, -1.070679, 0.8588235, 1, 0, 1,
-0.8850995, -0.5387806, -1.99884, 0.854902, 1, 0, 1,
-0.8745207, -1.035406, -1.594867, 0.8470588, 1, 0, 1,
-0.8718315, -1.00105, -1.637626, 0.8431373, 1, 0, 1,
-0.8686104, 0.6569161, -1.728463, 0.8352941, 1, 0, 1,
-0.8638914, -1.442393, -2.529444, 0.8313726, 1, 0, 1,
-0.8613328, 0.5819898, -2.899928, 0.8235294, 1, 0, 1,
-0.8601059, 0.5637952, -0.7658908, 0.8196079, 1, 0, 1,
-0.8582643, 0.8230745, -2.719234, 0.8117647, 1, 0, 1,
-0.8581789, -1.63161, -1.724674, 0.8078431, 1, 0, 1,
-0.8566206, 1.166586, -0.952711, 0.8, 1, 0, 1,
-0.8535649, 0.440541, -0.8536336, 0.7921569, 1, 0, 1,
-0.8517531, -1.450593, -3.129349, 0.7882353, 1, 0, 1,
-0.8461721, -0.4393477, -2.256486, 0.7803922, 1, 0, 1,
-0.8445553, 0.5861309, -2.15944, 0.7764706, 1, 0, 1,
-0.8445137, -0.4550655, -0.6451703, 0.7686275, 1, 0, 1,
-0.8420145, -0.3016586, -0.1698661, 0.7647059, 1, 0, 1,
-0.8360749, 0.7855901, -0.9068747, 0.7568628, 1, 0, 1,
-0.8235534, 1.974429, -0.2581372, 0.7529412, 1, 0, 1,
-0.8207293, -0.2948174, 0.560968, 0.7450981, 1, 0, 1,
-0.8143575, -0.2629118, -3.486396, 0.7411765, 1, 0, 1,
-0.8122418, 1.889318, -0.3237447, 0.7333333, 1, 0, 1,
-0.8113669, -0.0643687, -1.290965, 0.7294118, 1, 0, 1,
-0.8091437, -0.6023637, -1.79464, 0.7215686, 1, 0, 1,
-0.8056635, 1.998471, -1.616209, 0.7176471, 1, 0, 1,
-0.8047692, 2.000615, -2.67559, 0.7098039, 1, 0, 1,
-0.8016582, 0.45297, -0.6178575, 0.7058824, 1, 0, 1,
-0.7997927, 0.1003008, -2.456946, 0.6980392, 1, 0, 1,
-0.7972345, 0.3766906, -0.05340381, 0.6901961, 1, 0, 1,
-0.7943897, -0.7869388, -2.795281, 0.6862745, 1, 0, 1,
-0.7903544, -0.8754538, -2.569181, 0.6784314, 1, 0, 1,
-0.78664, 0.0309684, -0.7445258, 0.6745098, 1, 0, 1,
-0.7858042, -2.01133, -3.245007, 0.6666667, 1, 0, 1,
-0.7814875, 1.398097, -0.2013743, 0.6627451, 1, 0, 1,
-0.7785381, -0.5049875, -1.554846, 0.654902, 1, 0, 1,
-0.765605, 0.6192027, -1.316104, 0.6509804, 1, 0, 1,
-0.7588189, 0.6676282, -1.812299, 0.6431373, 1, 0, 1,
-0.7540673, -0.08298221, -2.054549, 0.6392157, 1, 0, 1,
-0.7538165, 1.026788, -1.150445, 0.6313726, 1, 0, 1,
-0.7509051, 0.7999228, -1.405148, 0.627451, 1, 0, 1,
-0.7492053, 0.7319463, -0.4925234, 0.6196079, 1, 0, 1,
-0.7437387, 0.3703963, -1.171389, 0.6156863, 1, 0, 1,
-0.7419771, 0.7931738, 1.447136, 0.6078432, 1, 0, 1,
-0.7399698, -1.660167, -3.017628, 0.6039216, 1, 0, 1,
-0.7341114, -0.8841945, -0.9091702, 0.5960785, 1, 0, 1,
-0.7308053, 0.5695587, -2.772296, 0.5882353, 1, 0, 1,
-0.7297066, -1.635544, -3.391705, 0.5843138, 1, 0, 1,
-0.7288382, 1.760263, 0.3872491, 0.5764706, 1, 0, 1,
-0.7287437, -0.3866021, -2.650549, 0.572549, 1, 0, 1,
-0.7265333, 1.699587, -0.8003912, 0.5647059, 1, 0, 1,
-0.7258427, 0.3737552, -1.271778, 0.5607843, 1, 0, 1,
-0.7254055, 0.4084224, -3.065206, 0.5529412, 1, 0, 1,
-0.7243131, 1.229249, -1.31007, 0.5490196, 1, 0, 1,
-0.7185521, -0.3269237, -3.524431, 0.5411765, 1, 0, 1,
-0.7185028, 0.07350364, -1.321556, 0.5372549, 1, 0, 1,
-0.7139918, -0.2865351, -1.606582, 0.5294118, 1, 0, 1,
-0.7128131, -0.4993823, -0.9495359, 0.5254902, 1, 0, 1,
-0.70253, -1.105708, -1.692463, 0.5176471, 1, 0, 1,
-0.699564, 1.726414, -0.7163429, 0.5137255, 1, 0, 1,
-0.6991634, 0.6315686, -1.079885, 0.5058824, 1, 0, 1,
-0.691891, 0.2613754, -3.502414, 0.5019608, 1, 0, 1,
-0.6882729, -1.763507, -2.459727, 0.4941176, 1, 0, 1,
-0.6831874, -0.0126424, -1.058127, 0.4862745, 1, 0, 1,
-0.6801019, -0.3644297, -1.786532, 0.4823529, 1, 0, 1,
-0.6730565, 0.2953862, -1.378172, 0.4745098, 1, 0, 1,
-0.6691859, 1.724574, -1.151777, 0.4705882, 1, 0, 1,
-0.665611, 0.8906894, 0.7611567, 0.4627451, 1, 0, 1,
-0.6587144, 1.083752, -1.887957, 0.4588235, 1, 0, 1,
-0.6551432, -1.559912, -3.416486, 0.4509804, 1, 0, 1,
-0.6533759, -0.07155906, -2.247345, 0.4470588, 1, 0, 1,
-0.6514041, 0.03328566, -0.5030013, 0.4392157, 1, 0, 1,
-0.6471078, -0.9177687, -3.012587, 0.4352941, 1, 0, 1,
-0.6423743, -0.430218, -2.080787, 0.427451, 1, 0, 1,
-0.6417212, -2.213293, -3.610378, 0.4235294, 1, 0, 1,
-0.6370488, 0.5409879, -0.2732274, 0.4156863, 1, 0, 1,
-0.632904, -0.7785831, -1.961144, 0.4117647, 1, 0, 1,
-0.6320571, 0.3776867, -2.356442, 0.4039216, 1, 0, 1,
-0.6304396, -0.1328614, -0.3650503, 0.3960784, 1, 0, 1,
-0.6213122, 1.113784, -0.1882677, 0.3921569, 1, 0, 1,
-0.6191511, -1.805151, -3.26317, 0.3843137, 1, 0, 1,
-0.6173449, 0.7623414, -1.138327, 0.3803922, 1, 0, 1,
-0.6150694, 0.04977951, -2.414239, 0.372549, 1, 0, 1,
-0.6100335, 1.015365, -1.448635, 0.3686275, 1, 0, 1,
-0.609758, 0.2604751, -0.4879539, 0.3607843, 1, 0, 1,
-0.6059602, 0.2471459, -0.9206374, 0.3568628, 1, 0, 1,
-0.5971131, 0.2637521, -2.999787, 0.3490196, 1, 0, 1,
-0.5890971, -0.5304776, -0.7720129, 0.345098, 1, 0, 1,
-0.5889484, -0.3277407, -1.240648, 0.3372549, 1, 0, 1,
-0.585964, 1.812032, -0.3878289, 0.3333333, 1, 0, 1,
-0.5716487, 0.8582612, -1.734797, 0.3254902, 1, 0, 1,
-0.5670232, 1.354854, -1.071866, 0.3215686, 1, 0, 1,
-0.5652374, -0.2696985, -1.568955, 0.3137255, 1, 0, 1,
-0.5649859, -0.2327032, -3.044444, 0.3098039, 1, 0, 1,
-0.5626953, 0.8042901, 0.08259654, 0.3019608, 1, 0, 1,
-0.5604002, 0.5126159, -2.083645, 0.2941177, 1, 0, 1,
-0.55399, -3.010569, -1.096427, 0.2901961, 1, 0, 1,
-0.553477, 2.497062, 0.04335236, 0.282353, 1, 0, 1,
-0.5512123, -0.4364253, -0.5565972, 0.2784314, 1, 0, 1,
-0.5484779, 0.02074525, -1.864017, 0.2705882, 1, 0, 1,
-0.5430021, 0.08711753, -2.065204, 0.2666667, 1, 0, 1,
-0.5399264, 0.6863291, 0.1655516, 0.2588235, 1, 0, 1,
-0.5354972, 0.9457145, -0.5483873, 0.254902, 1, 0, 1,
-0.5344387, 0.4487841, 0.29193, 0.2470588, 1, 0, 1,
-0.5285117, -0.37991, -3.481001, 0.2431373, 1, 0, 1,
-0.5268454, -0.05171071, -2.902983, 0.2352941, 1, 0, 1,
-0.5149576, 0.2217973, -1.897787, 0.2313726, 1, 0, 1,
-0.5131384, -1.063421, -1.755159, 0.2235294, 1, 0, 1,
-0.5118359, 0.2165404, -2.290171, 0.2196078, 1, 0, 1,
-0.5063946, 0.3767493, -0.3330002, 0.2117647, 1, 0, 1,
-0.5033202, -0.2998376, -0.7838907, 0.2078431, 1, 0, 1,
-0.4961235, -0.9761007, -3.436517, 0.2, 1, 0, 1,
-0.4952517, 0.8268907, 0.05008719, 0.1921569, 1, 0, 1,
-0.4916916, 1.917094, 0.3954455, 0.1882353, 1, 0, 1,
-0.4898095, -0.6158589, -4.38107, 0.1803922, 1, 0, 1,
-0.4876158, 1.028462, 0.6672455, 0.1764706, 1, 0, 1,
-0.4810891, 0.1257584, -1.855119, 0.1686275, 1, 0, 1,
-0.4713009, -0.6997256, -4.545657, 0.1647059, 1, 0, 1,
-0.4702178, 1.073867, -0.6410973, 0.1568628, 1, 0, 1,
-0.4692068, -0.9443076, -2.180919, 0.1529412, 1, 0, 1,
-0.467874, -0.6952579, -2.608027, 0.145098, 1, 0, 1,
-0.4659161, -0.3000474, -2.113715, 0.1411765, 1, 0, 1,
-0.4628483, 1.890682, 1.205069, 0.1333333, 1, 0, 1,
-0.4620234, 0.217688, 0.6254619, 0.1294118, 1, 0, 1,
-0.4595884, 0.1622046, -0.5604429, 0.1215686, 1, 0, 1,
-0.459217, 0.4758764, -0.633292, 0.1176471, 1, 0, 1,
-0.4580806, -0.1839104, -1.062413, 0.1098039, 1, 0, 1,
-0.4569331, 0.00183528, -1.220373, 0.1058824, 1, 0, 1,
-0.453858, 0.02171101, -0.2876249, 0.09803922, 1, 0, 1,
-0.4488306, 1.418462, -1.759287, 0.09019608, 1, 0, 1,
-0.4463714, 0.08863026, -3.264501, 0.08627451, 1, 0, 1,
-0.4362787, 0.1014737, -3.063559, 0.07843138, 1, 0, 1,
-0.4350156, -0.5401753, -2.144965, 0.07450981, 1, 0, 1,
-0.4348094, 0.2702694, -0.5442241, 0.06666667, 1, 0, 1,
-0.4321351, -0.5329142, -0.7544213, 0.0627451, 1, 0, 1,
-0.4292616, -0.5310082, -1.888132, 0.05490196, 1, 0, 1,
-0.4267478, -0.8740034, -4.084191, 0.05098039, 1, 0, 1,
-0.4210532, 0.8053671, 1.230356, 0.04313726, 1, 0, 1,
-0.4194376, -1.082044, -2.992877, 0.03921569, 1, 0, 1,
-0.4184199, -1.362813, -2.687128, 0.03137255, 1, 0, 1,
-0.4172716, -0.2045864, -3.086723, 0.02745098, 1, 0, 1,
-0.4093617, -0.9965072, -2.871568, 0.01960784, 1, 0, 1,
-0.4056798, 0.6959828, 0.9718937, 0.01568628, 1, 0, 1,
-0.4037795, 0.9231299, -0.3699417, 0.007843138, 1, 0, 1,
-0.4005954, 0.4519926, -2.22838, 0.003921569, 1, 0, 1,
-0.397606, -1.56197, -2.389758, 0, 1, 0.003921569, 1,
-0.3940773, 0.02542595, -1.718586, 0, 1, 0.01176471, 1,
-0.3914178, -0.527382, -4.067752, 0, 1, 0.01568628, 1,
-0.3881636, 0.8802802, -2.752772, 0, 1, 0.02352941, 1,
-0.3824324, 1.106635, -1.285521, 0, 1, 0.02745098, 1,
-0.3796321, -0.7305246, -2.688806, 0, 1, 0.03529412, 1,
-0.3794566, -0.6665639, -3.557854, 0, 1, 0.03921569, 1,
-0.374217, -1.483806, -3.009138, 0, 1, 0.04705882, 1,
-0.3737108, -0.3202877, -1.719828, 0, 1, 0.05098039, 1,
-0.3731128, -2.175954, -3.618136, 0, 1, 0.05882353, 1,
-0.3696389, -1.625454, -3.683692, 0, 1, 0.0627451, 1,
-0.3678652, 0.8499572, -0.1203355, 0, 1, 0.07058824, 1,
-0.3676716, -1.339595, -2.343278, 0, 1, 0.07450981, 1,
-0.3614083, -1.023221, -2.156777, 0, 1, 0.08235294, 1,
-0.3614008, 0.4918289, -1.723632, 0, 1, 0.08627451, 1,
-0.3572453, -1.346684, -2.448628, 0, 1, 0.09411765, 1,
-0.3567947, 0.9034967, 0.7019004, 0, 1, 0.1019608, 1,
-0.355364, -1.666841, -3.516696, 0, 1, 0.1058824, 1,
-0.3515702, 0.9198136, 0.4227084, 0, 1, 0.1137255, 1,
-0.3504491, 0.2944428, 0.8745617, 0, 1, 0.1176471, 1,
-0.3452779, -0.6859806, -4.086547, 0, 1, 0.1254902, 1,
-0.344641, 0.5814576, -1.160698, 0, 1, 0.1294118, 1,
-0.342652, 0.03742889, -0.9813434, 0, 1, 0.1372549, 1,
-0.340309, -2.109756, -2.133383, 0, 1, 0.1411765, 1,
-0.3390847, -1.609389, -2.915887, 0, 1, 0.1490196, 1,
-0.3366175, -1.593043, -3.831068, 0, 1, 0.1529412, 1,
-0.3362752, -0.2186209, -4.205726, 0, 1, 0.1607843, 1,
-0.330985, 0.2481223, -1.755277, 0, 1, 0.1647059, 1,
-0.328156, -0.1919523, -1.693357, 0, 1, 0.172549, 1,
-0.3280107, 1.210104, -1.507294, 0, 1, 0.1764706, 1,
-0.3272282, 0.3214017, 0.3200067, 0, 1, 0.1843137, 1,
-0.3233279, -0.0826022, -2.09233, 0, 1, 0.1882353, 1,
-0.3192906, 0.2100398, -0.5806878, 0, 1, 0.1960784, 1,
-0.3176463, -0.4763699, -5.253703, 0, 1, 0.2039216, 1,
-0.3156259, 0.4801335, -1.600138, 0, 1, 0.2078431, 1,
-0.3134748, 2.01737, 1.349893, 0, 1, 0.2156863, 1,
-0.3082198, -0.4755413, -4.349849, 0, 1, 0.2196078, 1,
-0.3079059, 0.09979997, -1.646266, 0, 1, 0.227451, 1,
-0.3014772, 0.540602, -0.04483012, 0, 1, 0.2313726, 1,
-0.2999849, -0.04611386, -1.074016, 0, 1, 0.2392157, 1,
-0.2936145, 1.433478, 0.3554977, 0, 1, 0.2431373, 1,
-0.2910685, -0.7308106, -1.54282, 0, 1, 0.2509804, 1,
-0.289176, 1.865774, -0.4959011, 0, 1, 0.254902, 1,
-0.2875848, -0.2798964, -1.182957, 0, 1, 0.2627451, 1,
-0.2863546, -0.3975702, -2.238753, 0, 1, 0.2666667, 1,
-0.2851793, 0.4227999, -1.120417, 0, 1, 0.2745098, 1,
-0.2844515, 0.6719412, 1.638922, 0, 1, 0.2784314, 1,
-0.2738553, -0.2915842, -2.377621, 0, 1, 0.2862745, 1,
-0.273744, 0.3326748, 0.7830108, 0, 1, 0.2901961, 1,
-0.2649899, -0.07696749, -1.510293, 0, 1, 0.2980392, 1,
-0.2614352, 0.9389473, 0.4838592, 0, 1, 0.3058824, 1,
-0.2562405, -0.9329346, -2.782248, 0, 1, 0.3098039, 1,
-0.2553347, -0.03351957, -1.159283, 0, 1, 0.3176471, 1,
-0.2489648, 0.2072143, -2.304273, 0, 1, 0.3215686, 1,
-0.2484445, -0.5082616, -4.215016, 0, 1, 0.3294118, 1,
-0.2406009, -1.375611, -1.745958, 0, 1, 0.3333333, 1,
-0.2381544, 0.0499468, -1.737949, 0, 1, 0.3411765, 1,
-0.2379285, -0.6382991, -2.576437, 0, 1, 0.345098, 1,
-0.2364643, -0.8216585, -4.289721, 0, 1, 0.3529412, 1,
-0.232066, -1.546596, -2.451595, 0, 1, 0.3568628, 1,
-0.228442, -0.07322204, -0.4390751, 0, 1, 0.3647059, 1,
-0.2276899, 1.366518, 0.6998473, 0, 1, 0.3686275, 1,
-0.2235858, 1.673066, 0.5057142, 0, 1, 0.3764706, 1,
-0.220346, 1.274687, 0.7022962, 0, 1, 0.3803922, 1,
-0.2184964, -0.05382152, -1.51972, 0, 1, 0.3882353, 1,
-0.2169098, 0.3001436, -0.2787218, 0, 1, 0.3921569, 1,
-0.2157836, 0.1566749, -0.2172154, 0, 1, 0.4, 1,
-0.2109208, -0.3834493, -3.098546, 0, 1, 0.4078431, 1,
-0.2105122, -0.3274596, -1.131138, 0, 1, 0.4117647, 1,
-0.2100124, -0.2717735, -2.557515, 0, 1, 0.4196078, 1,
-0.2081897, 0.2814089, -1.546243, 0, 1, 0.4235294, 1,
-0.2079148, -0.7028593, -3.096915, 0, 1, 0.4313726, 1,
-0.2053399, 0.9393704, 0.6585701, 0, 1, 0.4352941, 1,
-0.2027685, 0.04234618, -1.365496, 0, 1, 0.4431373, 1,
-0.2001817, 1.564728, -2.434668, 0, 1, 0.4470588, 1,
-0.1978794, -1.978245, -3.867437, 0, 1, 0.454902, 1,
-0.1951152, 1.283316, 0.5958239, 0, 1, 0.4588235, 1,
-0.1919715, -0.04110203, -2.775681, 0, 1, 0.4666667, 1,
-0.1901196, 0.4487074, -0.2657005, 0, 1, 0.4705882, 1,
-0.1899318, -1.360915, -3.563777, 0, 1, 0.4784314, 1,
-0.1834339, -1.060199, -4.118964, 0, 1, 0.4823529, 1,
-0.1750029, -0.2859105, -2.188447, 0, 1, 0.4901961, 1,
-0.1681119, -1.04485, -3.320835, 0, 1, 0.4941176, 1,
-0.1680321, 0.2773504, -0.2550192, 0, 1, 0.5019608, 1,
-0.166572, 2.164796, 3.822401, 0, 1, 0.509804, 1,
-0.165602, -0.4132917, -3.49943, 0, 1, 0.5137255, 1,
-0.1645141, 0.5906872, -0.7785665, 0, 1, 0.5215687, 1,
-0.1587579, 1.015307, -1.358565, 0, 1, 0.5254902, 1,
-0.1510837, -0.7953082, -5.13856, 0, 1, 0.5333334, 1,
-0.1496778, 1.599095, 0.7313903, 0, 1, 0.5372549, 1,
-0.1461131, 2.002761, -0.5815198, 0, 1, 0.5450981, 1,
-0.142544, -1.687105, -3.722593, 0, 1, 0.5490196, 1,
-0.1369263, -0.5534213, -3.152412, 0, 1, 0.5568628, 1,
-0.1348138, -0.4496595, -4.095029, 0, 1, 0.5607843, 1,
-0.1345897, -1.268962, -2.840051, 0, 1, 0.5686275, 1,
-0.1334152, 0.6506076, 0.9454772, 0, 1, 0.572549, 1,
-0.1321801, 0.6461827, -0.9117981, 0, 1, 0.5803922, 1,
-0.1296494, 0.1525319, -2.858574, 0, 1, 0.5843138, 1,
-0.1236923, 0.5405828, 0.9824905, 0, 1, 0.5921569, 1,
-0.1203389, -0.7034798, -1.899121, 0, 1, 0.5960785, 1,
-0.1147666, 0.8676556, -1.763228, 0, 1, 0.6039216, 1,
-0.1125295, 0.8340564, 0.8711179, 0, 1, 0.6117647, 1,
-0.1093373, -0.2508917, -3.836441, 0, 1, 0.6156863, 1,
-0.1074086, -0.641255, -2.986464, 0, 1, 0.6235294, 1,
-0.1067474, -1.471874, -2.109629, 0, 1, 0.627451, 1,
-0.1030326, 0.6910791, 1.415878, 0, 1, 0.6352941, 1,
-0.1017083, 1.311232, -0.2838904, 0, 1, 0.6392157, 1,
-0.1016279, -0.09927949, -2.183376, 0, 1, 0.6470588, 1,
-0.09500542, -0.2161985, -2.342579, 0, 1, 0.6509804, 1,
-0.09348249, 0.01030584, -2.426758, 0, 1, 0.6588235, 1,
-0.09301908, -1.287326, -3.092283, 0, 1, 0.6627451, 1,
-0.08696607, -1.358467, -3.078494, 0, 1, 0.6705883, 1,
-0.08585257, -0.4130925, -1.773394, 0, 1, 0.6745098, 1,
-0.08279219, -1.538558, -1.051212, 0, 1, 0.682353, 1,
-0.08081152, 0.161625, -3.261089, 0, 1, 0.6862745, 1,
-0.07787815, -0.8299293, -2.855637, 0, 1, 0.6941177, 1,
-0.07336584, -0.1941889, -2.101995, 0, 1, 0.7019608, 1,
-0.07065881, -0.4719897, -4.671922, 0, 1, 0.7058824, 1,
-0.06862333, -0.3401014, -2.552676, 0, 1, 0.7137255, 1,
-0.06202509, -0.00764138, -1.905209, 0, 1, 0.7176471, 1,
-0.06124477, 0.4087979, -0.01351624, 0, 1, 0.7254902, 1,
-0.05898054, 1.346521, -0.4190634, 0, 1, 0.7294118, 1,
-0.05644766, 0.9314416, 0.04894738, 0, 1, 0.7372549, 1,
-0.05617252, 0.3914522, 0.000136959, 0, 1, 0.7411765, 1,
-0.05431261, -0.6768086, -3.875517, 0, 1, 0.7490196, 1,
-0.05211216, 0.8920033, 1.145803, 0, 1, 0.7529412, 1,
-0.04570045, 1.33947, 0.8056615, 0, 1, 0.7607843, 1,
-0.04507569, 0.7658362, -0.1154425, 0, 1, 0.7647059, 1,
-0.04011117, -0.463041, -2.920069, 0, 1, 0.772549, 1,
-0.03945255, 0.9021595, 0.6942587, 0, 1, 0.7764706, 1,
-0.03882218, 1.819587, 2.02714, 0, 1, 0.7843137, 1,
-0.03644115, -1.375589, -1.652384, 0, 1, 0.7882353, 1,
-0.03520281, -0.2483043, -3.679045, 0, 1, 0.7960784, 1,
-0.02545585, 0.6163863, -0.2511159, 0, 1, 0.8039216, 1,
-0.02013451, 0.2407495, 0.9698828, 0, 1, 0.8078431, 1,
-0.01812619, 0.79398, -0.4867587, 0, 1, 0.8156863, 1,
-0.0176315, 0.421505, 0.6492584, 0, 1, 0.8196079, 1,
-0.01714187, 0.4797539, -1.162493, 0, 1, 0.827451, 1,
-0.01142974, 1.821125, 0.2468653, 0, 1, 0.8313726, 1,
-0.008946307, 0.6907912, 1.968369, 0, 1, 0.8392157, 1,
-0.004716246, -0.3823138, -4.728142, 0, 1, 0.8431373, 1,
0.0006608543, -0.1513884, 4.277219, 0, 1, 0.8509804, 1,
0.002081078, -1.283892, 5.771367, 0, 1, 0.854902, 1,
0.003508036, -0.9145592, 2.977282, 0, 1, 0.8627451, 1,
0.008847429, 0.8887122, 0.02473592, 0, 1, 0.8666667, 1,
0.009435562, -0.2985931, 4.474878, 0, 1, 0.8745098, 1,
0.02021496, 1.897157, 1.377308, 0, 1, 0.8784314, 1,
0.02105869, -0.2743304, 2.397046, 0, 1, 0.8862745, 1,
0.02541678, -0.8218406, 2.088619, 0, 1, 0.8901961, 1,
0.02793226, 1.274391, 1.090231, 0, 1, 0.8980392, 1,
0.02816579, 1.728412, 1.906888, 0, 1, 0.9058824, 1,
0.03169343, 0.2029146, -0.3465752, 0, 1, 0.9098039, 1,
0.03318136, 1.138775, 1.331675, 0, 1, 0.9176471, 1,
0.03489313, 1.107687, -1.995816, 0, 1, 0.9215686, 1,
0.03579009, 0.5517972, 0.6627557, 0, 1, 0.9294118, 1,
0.03680335, -1.3812, 4.204887, 0, 1, 0.9333333, 1,
0.03821242, 1.694369, 1.444408, 0, 1, 0.9411765, 1,
0.03990452, 0.3578506, 0.1144557, 0, 1, 0.945098, 1,
0.04332471, -0.3499533, 4.045624, 0, 1, 0.9529412, 1,
0.04361386, -0.8886236, 2.760635, 0, 1, 0.9568627, 1,
0.05445046, 2.944325, 0.6777162, 0, 1, 0.9647059, 1,
0.05477923, -0.8332375, 2.485272, 0, 1, 0.9686275, 1,
0.05795695, -2.091653, 2.715562, 0, 1, 0.9764706, 1,
0.06277489, -0.4241233, 1.295537, 0, 1, 0.9803922, 1,
0.07679779, 1.138058, -0.9005593, 0, 1, 0.9882353, 1,
0.07682534, -0.1998973, 4.232088, 0, 1, 0.9921569, 1,
0.08128314, -1.060547, 2.347254, 0, 1, 1, 1,
0.08181433, -0.9047415, 3.199404, 0, 0.9921569, 1, 1,
0.08310694, -1.20514, 3.474914, 0, 0.9882353, 1, 1,
0.08372458, 1.460422, -1.025734, 0, 0.9803922, 1, 1,
0.08584072, 0.0946739, 1.824612, 0, 0.9764706, 1, 1,
0.0872444, -0.9419194, 2.996715, 0, 0.9686275, 1, 1,
0.09074954, 1.830757, 0.864993, 0, 0.9647059, 1, 1,
0.09145002, -0.6233585, 4.214108, 0, 0.9568627, 1, 1,
0.09403675, 0.1556028, 0.2576569, 0, 0.9529412, 1, 1,
0.09459286, -0.06675988, 0.9634927, 0, 0.945098, 1, 1,
0.09540988, -1.207324, 2.372381, 0, 0.9411765, 1, 1,
0.09600926, -0.7045092, 1.889116, 0, 0.9333333, 1, 1,
0.09606665, 0.5776098, 0.1728756, 0, 0.9294118, 1, 1,
0.09926318, 0.8727083, 0.6999954, 0, 0.9215686, 1, 1,
0.1033819, 0.1368116, 0.6036735, 0, 0.9176471, 1, 1,
0.1058481, 0.5893499, 1.750454, 0, 0.9098039, 1, 1,
0.1079111, 1.721741, -1.43947, 0, 0.9058824, 1, 1,
0.1102399, 1.348115, -2.071352, 0, 0.8980392, 1, 1,
0.1103956, 0.7282642, 1.340761, 0, 0.8901961, 1, 1,
0.113486, 1.200802, 0.6957485, 0, 0.8862745, 1, 1,
0.1159913, -0.2476785, 1.630066, 0, 0.8784314, 1, 1,
0.1176062, -0.48806, 3.959261, 0, 0.8745098, 1, 1,
0.1204667, 1.547183, 0.2056933, 0, 0.8666667, 1, 1,
0.1242275, 0.9225369, -1.281527, 0, 0.8627451, 1, 1,
0.1245196, -0.4409186, 2.122096, 0, 0.854902, 1, 1,
0.1259477, -1.813625, 2.740976, 0, 0.8509804, 1, 1,
0.1336251, 0.652776, -0.3534765, 0, 0.8431373, 1, 1,
0.1349259, -0.8308171, 3.127408, 0, 0.8392157, 1, 1,
0.1368197, 0.2972854, 0.7593606, 0, 0.8313726, 1, 1,
0.1377938, -0.3937138, 4.306882, 0, 0.827451, 1, 1,
0.1406058, -1.818654, 2.379704, 0, 0.8196079, 1, 1,
0.1424434, 0.4540091, -0.06219339, 0, 0.8156863, 1, 1,
0.1500798, -0.03347734, 2.199558, 0, 0.8078431, 1, 1,
0.1511702, 0.3858525, 0.3593479, 0, 0.8039216, 1, 1,
0.1516988, 0.6678488, 0.9310526, 0, 0.7960784, 1, 1,
0.1527745, 0.2629595, -0.2592348, 0, 0.7882353, 1, 1,
0.1533778, -1.663546, 3.784735, 0, 0.7843137, 1, 1,
0.1543919, 0.5061195, 1.42809, 0, 0.7764706, 1, 1,
0.1544266, 1.969865, 0.8846806, 0, 0.772549, 1, 1,
0.1544312, -0.1568412, 2.560965, 0, 0.7647059, 1, 1,
0.1563402, -0.09911464, 2.692018, 0, 0.7607843, 1, 1,
0.1585971, -0.679559, 4.094548, 0, 0.7529412, 1, 1,
0.159242, 0.3282585, 0.9023676, 0, 0.7490196, 1, 1,
0.1611554, 1.179336, 0.1869543, 0, 0.7411765, 1, 1,
0.1653994, -1.051981, 3.753565, 0, 0.7372549, 1, 1,
0.1665193, 0.3672945, 1.113538, 0, 0.7294118, 1, 1,
0.1673781, -0.8188089, 3.007716, 0, 0.7254902, 1, 1,
0.1728031, 1.719287, 0.8239229, 0, 0.7176471, 1, 1,
0.1752452, 0.04621905, 1.55128, 0, 0.7137255, 1, 1,
0.1778055, -2.511348, 3.924808, 0, 0.7058824, 1, 1,
0.1835409, 0.9102099, 0.3408459, 0, 0.6980392, 1, 1,
0.1927367, -0.05941728, 0.08213857, 0, 0.6941177, 1, 1,
0.1932575, -0.480995, 1.857858, 0, 0.6862745, 1, 1,
0.1937055, 0.06890929, 1.553309, 0, 0.682353, 1, 1,
0.1948197, 0.4654304, -0.2861257, 0, 0.6745098, 1, 1,
0.1955346, 1.265705, -0.6220515, 0, 0.6705883, 1, 1,
0.1957927, 1.030436, -0.6171319, 0, 0.6627451, 1, 1,
0.1971034, -2.48084, 2.983067, 0, 0.6588235, 1, 1,
0.2035729, -1.65596, 2.353637, 0, 0.6509804, 1, 1,
0.2041126, 0.7666628, 1.174094, 0, 0.6470588, 1, 1,
0.2061791, 0.2602256, 1.976077, 0, 0.6392157, 1, 1,
0.207782, 2.089403, -0.5591794, 0, 0.6352941, 1, 1,
0.2080775, -0.5301114, 3.32891, 0, 0.627451, 1, 1,
0.2123659, -1.887455, 1.863882, 0, 0.6235294, 1, 1,
0.2175104, 0.5785489, -0.01998072, 0, 0.6156863, 1, 1,
0.2240777, 0.6848819, 1.396676, 0, 0.6117647, 1, 1,
0.2292819, -0.9228142, 2.314693, 0, 0.6039216, 1, 1,
0.2320753, -0.2531978, -0.02756277, 0, 0.5960785, 1, 1,
0.2344653, 0.3082402, 0.8342611, 0, 0.5921569, 1, 1,
0.2349246, 1.449196, -0.44941, 0, 0.5843138, 1, 1,
0.2389085, -0.9813863, 2.653749, 0, 0.5803922, 1, 1,
0.2454487, 0.3153744, 0.205105, 0, 0.572549, 1, 1,
0.2455932, 0.6399306, -0.774935, 0, 0.5686275, 1, 1,
0.2477595, -0.8777874, 3.363174, 0, 0.5607843, 1, 1,
0.2552817, 0.7286636, 1.77784, 0, 0.5568628, 1, 1,
0.2590965, -1.542871, 3.717501, 0, 0.5490196, 1, 1,
0.2594761, 0.1140205, 1.187859, 0, 0.5450981, 1, 1,
0.2627405, -1.5044, 3.152043, 0, 0.5372549, 1, 1,
0.2649092, -0.08865951, 2.23295, 0, 0.5333334, 1, 1,
0.2654517, -0.04606662, 0.2968927, 0, 0.5254902, 1, 1,
0.270711, 0.4260559, -0.5978249, 0, 0.5215687, 1, 1,
0.2710504, 1.222119, -0.1495718, 0, 0.5137255, 1, 1,
0.2762529, 0.5852977, 1.112017, 0, 0.509804, 1, 1,
0.2778021, -0.6975306, 3.562775, 0, 0.5019608, 1, 1,
0.2833518, 0.1662529, 1.362504, 0, 0.4941176, 1, 1,
0.2862065, 0.592283, 0.5277433, 0, 0.4901961, 1, 1,
0.2902397, 2.545664, 1.742259, 0, 0.4823529, 1, 1,
0.2905406, -1.293949, 3.819375, 0, 0.4784314, 1, 1,
0.2919262, -0.190713, 2.35077, 0, 0.4705882, 1, 1,
0.294358, -1.707618, 1.924328, 0, 0.4666667, 1, 1,
0.2997973, 1.085738, 1.339226, 0, 0.4588235, 1, 1,
0.3006546, -0.3106841, 2.952758, 0, 0.454902, 1, 1,
0.3092887, -0.8866109, 3.365134, 0, 0.4470588, 1, 1,
0.3114821, 0.4873006, 2.709044, 0, 0.4431373, 1, 1,
0.3125082, -0.09023956, 3.007683, 0, 0.4352941, 1, 1,
0.3131295, 1.055713, -0.95431, 0, 0.4313726, 1, 1,
0.3156447, -0.3680511, 2.65734, 0, 0.4235294, 1, 1,
0.3158129, 0.09605706, 0.8455235, 0, 0.4196078, 1, 1,
0.3162307, 2.276923, 1.368239, 0, 0.4117647, 1, 1,
0.3162656, -0.8816833, 4.022928, 0, 0.4078431, 1, 1,
0.3207579, -0.1671026, 2.096348, 0, 0.4, 1, 1,
0.3222367, -0.4309533, 3.072778, 0, 0.3921569, 1, 1,
0.3235305, -0.3818862, 3.653441, 0, 0.3882353, 1, 1,
0.3273931, 0.5721574, 0.8018834, 0, 0.3803922, 1, 1,
0.3298829, -1.287586, 1.637401, 0, 0.3764706, 1, 1,
0.330339, 0.4143504, 0.5531603, 0, 0.3686275, 1, 1,
0.3377788, 0.2439319, 1.427962, 0, 0.3647059, 1, 1,
0.3410958, -0.9981327, 2.43626, 0, 0.3568628, 1, 1,
0.3427005, 0.7555569, 1.875478, 0, 0.3529412, 1, 1,
0.3449137, 0.7467077, 1.090789, 0, 0.345098, 1, 1,
0.3498474, -0.7211838, 2.723866, 0, 0.3411765, 1, 1,
0.3499774, 0.4736979, 2.412263, 0, 0.3333333, 1, 1,
0.3502754, -0.6095748, 1.692021, 0, 0.3294118, 1, 1,
0.353975, 1.058782, 1.043396, 0, 0.3215686, 1, 1,
0.3545576, 0.9497045, 0.7982767, 0, 0.3176471, 1, 1,
0.356156, 1.588672, 0.6315971, 0, 0.3098039, 1, 1,
0.3572499, 0.8149462, 0.4683397, 0, 0.3058824, 1, 1,
0.366695, -1.684979, 3.571689, 0, 0.2980392, 1, 1,
0.3668285, 0.03294615, 1.594422, 0, 0.2901961, 1, 1,
0.3749725, -0.8178812, 3.493032, 0, 0.2862745, 1, 1,
0.3763023, -1.009605, 1.431252, 0, 0.2784314, 1, 1,
0.3832229, -0.8150596, 2.241095, 0, 0.2745098, 1, 1,
0.3839145, -0.9153591, 3.641254, 0, 0.2666667, 1, 1,
0.3851705, -1.358967, 4.042893, 0, 0.2627451, 1, 1,
0.38605, -0.6191199, 3.213839, 0, 0.254902, 1, 1,
0.3866171, 1.134468, 0.7225068, 0, 0.2509804, 1, 1,
0.3897387, -0.6855339, 1.865329, 0, 0.2431373, 1, 1,
0.3947525, -0.9595515, 2.962389, 0, 0.2392157, 1, 1,
0.3983368, 0.3128788, 1.1629, 0, 0.2313726, 1, 1,
0.4002334, -1.563462, 2.469133, 0, 0.227451, 1, 1,
0.4002715, 0.5939332, 0.6593004, 0, 0.2196078, 1, 1,
0.4042764, -0.3259856, 1.596745, 0, 0.2156863, 1, 1,
0.4077369, -0.7611746, 1.242652, 0, 0.2078431, 1, 1,
0.4143116, -1.173993, 3.565355, 0, 0.2039216, 1, 1,
0.4166321, 1.089407, 1.784225, 0, 0.1960784, 1, 1,
0.4225523, -0.8088448, 2.381785, 0, 0.1882353, 1, 1,
0.4259996, 0.1880062, 1.807933, 0, 0.1843137, 1, 1,
0.4294087, -0.2559232, 4.771592, 0, 0.1764706, 1, 1,
0.4376996, 0.7380769, 0.2867963, 0, 0.172549, 1, 1,
0.4383073, 0.8586056, -0.4585562, 0, 0.1647059, 1, 1,
0.4404084, -0.08328889, 1.976988, 0, 0.1607843, 1, 1,
0.4425429, 0.6518551, -1.143633, 0, 0.1529412, 1, 1,
0.4487659, 0.7830281, 0.8840411, 0, 0.1490196, 1, 1,
0.4515827, -1.402173, 3.259475, 0, 0.1411765, 1, 1,
0.4522524, -1.823395, 2.691438, 0, 0.1372549, 1, 1,
0.4579938, -0.277745, 1.123321, 0, 0.1294118, 1, 1,
0.4608634, 1.470416, 0.2261586, 0, 0.1254902, 1, 1,
0.4612926, -0.0101518, 1.978149, 0, 0.1176471, 1, 1,
0.4614953, 1.515715, -0.3445791, 0, 0.1137255, 1, 1,
0.4699131, 0.4932226, 0.7198133, 0, 0.1058824, 1, 1,
0.4816635, 0.125626, 0.7989957, 0, 0.09803922, 1, 1,
0.4845318, 2.321581, -3.52017, 0, 0.09411765, 1, 1,
0.4868259, -0.3501019, 3.336881, 0, 0.08627451, 1, 1,
0.4896292, -0.04236522, 0.9512932, 0, 0.08235294, 1, 1,
0.4897034, -0.4208172, 2.255657, 0, 0.07450981, 1, 1,
0.4907423, 0.7610508, 2.910748, 0, 0.07058824, 1, 1,
0.4918596, 2.158539, 0.2731183, 0, 0.0627451, 1, 1,
0.4931331, 0.9942792, -1.355911, 0, 0.05882353, 1, 1,
0.4945031, -0.6784079, 3.472204, 0, 0.05098039, 1, 1,
0.4947284, 0.7950041, 1.853915, 0, 0.04705882, 1, 1,
0.4962174, 0.4689635, -0.4034761, 0, 0.03921569, 1, 1,
0.496562, 0.004410876, 0.05112449, 0, 0.03529412, 1, 1,
0.4969422, 0.2978832, 1.194476, 0, 0.02745098, 1, 1,
0.4977858, -0.5968598, 2.506917, 0, 0.02352941, 1, 1,
0.4991372, -0.1421818, 0.8968685, 0, 0.01568628, 1, 1,
0.5015146, 0.09775373, 1.029405, 0, 0.01176471, 1, 1,
0.5040783, 0.239147, 1.864071, 0, 0.003921569, 1, 1,
0.5063992, 0.1197799, 1.007639, 0.003921569, 0, 1, 1,
0.5120953, 0.3576515, 1.714259, 0.007843138, 0, 1, 1,
0.5133252, 0.9160427, 1.917786, 0.01568628, 0, 1, 1,
0.5135235, 0.4449721, 1.711192, 0.01960784, 0, 1, 1,
0.515446, -0.3487719, 2.789045, 0.02745098, 0, 1, 1,
0.5163611, 0.3890057, 0.146283, 0.03137255, 0, 1, 1,
0.5168267, 0.2333373, 1.429161, 0.03921569, 0, 1, 1,
0.5190625, -0.133684, 2.102457, 0.04313726, 0, 1, 1,
0.5193824, 0.05156795, 3.450882, 0.05098039, 0, 1, 1,
0.521964, 0.6644409, -1.413945, 0.05490196, 0, 1, 1,
0.5244746, 0.1562971, 2.490443, 0.0627451, 0, 1, 1,
0.5258363, -1.204741, 2.853055, 0.06666667, 0, 1, 1,
0.5273343, -0.6055257, 1.66407, 0.07450981, 0, 1, 1,
0.5274324, 0.1784546, -0.4467644, 0.07843138, 0, 1, 1,
0.5335007, -0.5930702, 3.489, 0.08627451, 0, 1, 1,
0.5356762, 1.920678, -0.9527108, 0.09019608, 0, 1, 1,
0.5371116, -0.3236124, 0.7295167, 0.09803922, 0, 1, 1,
0.5383022, 0.1638485, 3.02122, 0.1058824, 0, 1, 1,
0.5414677, 0.7744451, 0.4775267, 0.1098039, 0, 1, 1,
0.5440767, 1.719782, 1.805972, 0.1176471, 0, 1, 1,
0.5494363, -2.459596, 2.325402, 0.1215686, 0, 1, 1,
0.5508443, -0.2483664, 3.334803, 0.1294118, 0, 1, 1,
0.5537024, 0.8224143, 0.5792394, 0.1333333, 0, 1, 1,
0.5605011, 0.5485919, 1.702673, 0.1411765, 0, 1, 1,
0.5636271, 0.8012367, 1.120453, 0.145098, 0, 1, 1,
0.5675833, 0.005608241, 0.5079026, 0.1529412, 0, 1, 1,
0.5691977, -0.8834885, 3.909711, 0.1568628, 0, 1, 1,
0.5731896, 3.407689, -0.048313, 0.1647059, 0, 1, 1,
0.5740291, 0.8506432, 0.6862031, 0.1686275, 0, 1, 1,
0.5753595, -0.2118147, 0.1048735, 0.1764706, 0, 1, 1,
0.5782245, -0.2756837, 2.179172, 0.1803922, 0, 1, 1,
0.5791724, 1.817324, -0.5661479, 0.1882353, 0, 1, 1,
0.5836202, -0.05456863, 3.076928, 0.1921569, 0, 1, 1,
0.5860593, 1.75233, 1.161219, 0.2, 0, 1, 1,
0.5887329, 1.077665, -0.337515, 0.2078431, 0, 1, 1,
0.5901176, -1.281594, 1.453243, 0.2117647, 0, 1, 1,
0.5928397, -0.3855985, 2.022916, 0.2196078, 0, 1, 1,
0.5983709, -1.159349, 2.63822, 0.2235294, 0, 1, 1,
0.6173351, 1.243593, 3.586192, 0.2313726, 0, 1, 1,
0.6187148, 2.01056, 0.9110425, 0.2352941, 0, 1, 1,
0.6217459, 0.5336859, 1.549476, 0.2431373, 0, 1, 1,
0.6295268, 1.264707, -1.726582, 0.2470588, 0, 1, 1,
0.6315665, 1.001072, 1.141687, 0.254902, 0, 1, 1,
0.635268, -0.6532463, 3.545488, 0.2588235, 0, 1, 1,
0.6355846, 1.195452, 1.566198, 0.2666667, 0, 1, 1,
0.6410296, -1.899583, 3.131738, 0.2705882, 0, 1, 1,
0.6443572, -0.00376177, 2.795219, 0.2784314, 0, 1, 1,
0.6486133, -0.6555036, 3.029518, 0.282353, 0, 1, 1,
0.6498225, -1.547993, 2.091609, 0.2901961, 0, 1, 1,
0.6500766, -1.944417, 2.612624, 0.2941177, 0, 1, 1,
0.6541188, -1.162014, 2.338488, 0.3019608, 0, 1, 1,
0.6564796, 1.506297, -0.008172761, 0.3098039, 0, 1, 1,
0.6575612, -0.5128831, 4.075515, 0.3137255, 0, 1, 1,
0.6621512, 0.7292323, 0.7309053, 0.3215686, 0, 1, 1,
0.6667326, 0.5161008, 1.130518, 0.3254902, 0, 1, 1,
0.6671991, 0.1746245, 0.8186285, 0.3333333, 0, 1, 1,
0.6676825, -0.9351014, 3.281874, 0.3372549, 0, 1, 1,
0.6752847, 0.2890754, 0.3079171, 0.345098, 0, 1, 1,
0.6895912, -0.6579954, 2.485898, 0.3490196, 0, 1, 1,
0.68975, 2.222687, -0.08913375, 0.3568628, 0, 1, 1,
0.6955195, 0.3208233, 1.850395, 0.3607843, 0, 1, 1,
0.6955702, 0.7864662, 0.9290008, 0.3686275, 0, 1, 1,
0.6997941, -0.6573284, 4.292032, 0.372549, 0, 1, 1,
0.7005513, 1.123132, -0.1996475, 0.3803922, 0, 1, 1,
0.714748, -1.657839, 4.064242, 0.3843137, 0, 1, 1,
0.7152563, 0.2499237, 0.3216431, 0.3921569, 0, 1, 1,
0.7185535, 0.03160064, 1.289697, 0.3960784, 0, 1, 1,
0.72068, 2.164918, 1.157451, 0.4039216, 0, 1, 1,
0.7252013, 0.4300869, -0.2803125, 0.4117647, 0, 1, 1,
0.7257634, -0.1425249, 2.55524, 0.4156863, 0, 1, 1,
0.7317848, 0.485926, -0.12577, 0.4235294, 0, 1, 1,
0.7320074, -0.1656628, 0.840076, 0.427451, 0, 1, 1,
0.7383277, 0.02049187, 2.510273, 0.4352941, 0, 1, 1,
0.7402889, -1.466297, 2.615035, 0.4392157, 0, 1, 1,
0.7408662, 1.760221, -1.162399, 0.4470588, 0, 1, 1,
0.7415959, 1.140175, 3.010985, 0.4509804, 0, 1, 1,
0.7438526, 0.1526766, 1.737655, 0.4588235, 0, 1, 1,
0.7488036, -0.04734084, 0.6968486, 0.4627451, 0, 1, 1,
0.7500585, -0.1525605, 2.849214, 0.4705882, 0, 1, 1,
0.7506434, -0.1644248, 3.384313, 0.4745098, 0, 1, 1,
0.753313, -0.02804165, 1.588672, 0.4823529, 0, 1, 1,
0.7540176, -0.001752451, 1.036418, 0.4862745, 0, 1, 1,
0.7550536, 1.356875, 0.2951306, 0.4941176, 0, 1, 1,
0.7563239, -0.1923731, 2.424342, 0.5019608, 0, 1, 1,
0.7595814, 1.513277, 0.9788902, 0.5058824, 0, 1, 1,
0.765864, -2.762065, 3.635965, 0.5137255, 0, 1, 1,
0.7693461, -0.550938, 1.548658, 0.5176471, 0, 1, 1,
0.7740991, 0.688253, 1.362329, 0.5254902, 0, 1, 1,
0.7741482, -0.2800969, 1.492032, 0.5294118, 0, 1, 1,
0.7776476, -0.1963455, 1.089791, 0.5372549, 0, 1, 1,
0.7826645, 0.4378626, 2.283679, 0.5411765, 0, 1, 1,
0.7834069, -0.8006085, 1.589493, 0.5490196, 0, 1, 1,
0.7849894, -0.2259313, 0.666641, 0.5529412, 0, 1, 1,
0.7938632, -0.7389697, 3.570957, 0.5607843, 0, 1, 1,
0.7949939, -0.01633935, 0.6792689, 0.5647059, 0, 1, 1,
0.7995122, -0.08194452, -0.5274423, 0.572549, 0, 1, 1,
0.7997203, 0.5264635, 0.1849527, 0.5764706, 0, 1, 1,
0.8006915, -0.6289374, 2.307066, 0.5843138, 0, 1, 1,
0.8014579, 0.4902277, 1.165989, 0.5882353, 0, 1, 1,
0.8046086, -1.118833, 1.61941, 0.5960785, 0, 1, 1,
0.810952, -0.799492, 1.790388, 0.6039216, 0, 1, 1,
0.8116661, 1.340921, -1.499995, 0.6078432, 0, 1, 1,
0.8118405, 0.3053027, 1.432494, 0.6156863, 0, 1, 1,
0.8123038, 0.1386059, 1.986051, 0.6196079, 0, 1, 1,
0.8169687, 0.9642568, 0.08395443, 0.627451, 0, 1, 1,
0.8229909, -0.4744829, -0.3359206, 0.6313726, 0, 1, 1,
0.8294384, 0.2274367, 1.357818, 0.6392157, 0, 1, 1,
0.8311003, -1.373601, 2.698962, 0.6431373, 0, 1, 1,
0.8381132, 0.6613421, 1.026084, 0.6509804, 0, 1, 1,
0.8395256, -0.001948386, 0.6240488, 0.654902, 0, 1, 1,
0.8407832, 1.446328, 1.722345, 0.6627451, 0, 1, 1,
0.8415871, -1.393766, 3.613806, 0.6666667, 0, 1, 1,
0.8416166, 1.551424, 0.4921953, 0.6745098, 0, 1, 1,
0.8515541, -0.1217248, -0.5847982, 0.6784314, 0, 1, 1,
0.8522065, -0.2568485, 3.403569, 0.6862745, 0, 1, 1,
0.85746, 0.3508925, 0.9774268, 0.6901961, 0, 1, 1,
0.8636013, 0.1564129, 2.32008, 0.6980392, 0, 1, 1,
0.8646537, -0.5356975, 2.565831, 0.7058824, 0, 1, 1,
0.8650139, 0.1945695, 1.336266, 0.7098039, 0, 1, 1,
0.8697503, -0.3230986, 3.238529, 0.7176471, 0, 1, 1,
0.8699121, 0.01699744, -1.116605, 0.7215686, 0, 1, 1,
0.8701453, 0.3183202, 2.216146, 0.7294118, 0, 1, 1,
0.8736809, 1.285103, -2.359188, 0.7333333, 0, 1, 1,
0.8785754, -0.7009415, 3.571203, 0.7411765, 0, 1, 1,
0.8816901, 1.215358, 1.412454, 0.7450981, 0, 1, 1,
0.8898793, -0.1013231, 2.560385, 0.7529412, 0, 1, 1,
0.8986617, -0.1929362, 4.263393, 0.7568628, 0, 1, 1,
0.9124256, -1.048746, 2.514909, 0.7647059, 0, 1, 1,
0.9125321, 0.9259176, 0.9753888, 0.7686275, 0, 1, 1,
0.913201, -0.3833414, 2.116283, 0.7764706, 0, 1, 1,
0.9159385, 0.03792242, 2.516713, 0.7803922, 0, 1, 1,
0.9241459, 0.9866982, 0.7057475, 0.7882353, 0, 1, 1,
0.9280809, -0.04320072, 0.8202444, 0.7921569, 0, 1, 1,
0.9343684, 0.418098, 1.035656, 0.8, 0, 1, 1,
0.9389997, -0.4397923, 2.807221, 0.8078431, 0, 1, 1,
0.9394794, 0.08555063, 3.088959, 0.8117647, 0, 1, 1,
0.947536, 0.4386812, 1.064969, 0.8196079, 0, 1, 1,
0.9552982, 0.01490898, 0.9453973, 0.8235294, 0, 1, 1,
0.9605489, 0.2665693, 1.737954, 0.8313726, 0, 1, 1,
0.9678572, -0.1831775, 1.679076, 0.8352941, 0, 1, 1,
0.9713036, 0.745487, 0.3037806, 0.8431373, 0, 1, 1,
0.9720945, 0.486925, -0.3820249, 0.8470588, 0, 1, 1,
0.9746365, 1.101942, 2.08108, 0.854902, 0, 1, 1,
0.98254, -0.3962729, 1.798755, 0.8588235, 0, 1, 1,
0.9874903, 1.620924, 0.32127, 0.8666667, 0, 1, 1,
0.993444, -0.186457, 1.540173, 0.8705882, 0, 1, 1,
0.9951652, 0.5906306, 1.576426, 0.8784314, 0, 1, 1,
0.9965255, -1.275369, 2.076749, 0.8823529, 0, 1, 1,
0.9970881, -1.444774, 3.425077, 0.8901961, 0, 1, 1,
1.003714, -0.4146495, 1.913417, 0.8941177, 0, 1, 1,
1.003719, 0.3098456, 1.615088, 0.9019608, 0, 1, 1,
1.005846, 0.2287813, -0.1705226, 0.9098039, 0, 1, 1,
1.013515, -0.2475144, 0.6980139, 0.9137255, 0, 1, 1,
1.01498, -2.888015, 1.585581, 0.9215686, 0, 1, 1,
1.02632, -1.230836, 2.080779, 0.9254902, 0, 1, 1,
1.028408, 0.2927525, 0.6726454, 0.9333333, 0, 1, 1,
1.032268, 0.3912546, 0.4009037, 0.9372549, 0, 1, 1,
1.03296, 0.1760087, 2.588986, 0.945098, 0, 1, 1,
1.034012, 1.165354, 1.694444, 0.9490196, 0, 1, 1,
1.034099, -0.5352502, 2.370672, 0.9568627, 0, 1, 1,
1.035619, -0.3116924, 0.9846863, 0.9607843, 0, 1, 1,
1.036744, -1.331673, 1.228619, 0.9686275, 0, 1, 1,
1.040446, 0.1598545, 1.973956, 0.972549, 0, 1, 1,
1.042804, 0.6359256, 1.911688, 0.9803922, 0, 1, 1,
1.048114, -0.523307, 1.681612, 0.9843137, 0, 1, 1,
1.053832, 0.5411337, 1.920547, 0.9921569, 0, 1, 1,
1.063638, -0.0310472, 1.991843, 0.9960784, 0, 1, 1,
1.063994, -1.253389, 0.9759489, 1, 0, 0.9960784, 1,
1.068568, -0.7023339, 1.488549, 1, 0, 0.9882353, 1,
1.0701, 0.8276415, 2.744188, 1, 0, 0.9843137, 1,
1.070939, 0.5214226, 0.915983, 1, 0, 0.9764706, 1,
1.072672, 0.7876453, 1.599072, 1, 0, 0.972549, 1,
1.075321, -0.5582863, 3.413418, 1, 0, 0.9647059, 1,
1.076541, -0.5584489, 0.1452557, 1, 0, 0.9607843, 1,
1.077031, 1.175186, -0.3418889, 1, 0, 0.9529412, 1,
1.077399, 1.492685, 1.061987, 1, 0, 0.9490196, 1,
1.083282, 1.574654, -0.1895915, 1, 0, 0.9411765, 1,
1.091499, -0.336161, 1.824374, 1, 0, 0.9372549, 1,
1.096498, 0.5969864, 1.06528, 1, 0, 0.9294118, 1,
1.098665, -0.3326247, 1.622667, 1, 0, 0.9254902, 1,
1.105045, -1.336526, 2.031899, 1, 0, 0.9176471, 1,
1.108016, 1.030431, 0.265383, 1, 0, 0.9137255, 1,
1.108375, 1.056151, 0.2579137, 1, 0, 0.9058824, 1,
1.108943, -1.311139, 4.185451, 1, 0, 0.9019608, 1,
1.110283, -0.09701191, 2.140112, 1, 0, 0.8941177, 1,
1.117475, 1.997381, 0.2242621, 1, 0, 0.8862745, 1,
1.118978, 0.7245615, 0.9230172, 1, 0, 0.8823529, 1,
1.119004, -0.9474788, 3.342723, 1, 0, 0.8745098, 1,
1.125278, 1.927345, 0.9346894, 1, 0, 0.8705882, 1,
1.126502, 0.2121964, 1.526251, 1, 0, 0.8627451, 1,
1.132619, -0.2214566, 2.317145, 1, 0, 0.8588235, 1,
1.137945, -1.439922, 3.645521, 1, 0, 0.8509804, 1,
1.144384, 0.5230894, 0.8469067, 1, 0, 0.8470588, 1,
1.144398, -0.4288503, 3.032321, 1, 0, 0.8392157, 1,
1.14954, -0.1843645, 1.505643, 1, 0, 0.8352941, 1,
1.155146, 0.1974909, 1.463044, 1, 0, 0.827451, 1,
1.157204, 0.7091216, 1.830981, 1, 0, 0.8235294, 1,
1.161943, -1.322139, 1.442771, 1, 0, 0.8156863, 1,
1.16304, -0.0970831, 1.151569, 1, 0, 0.8117647, 1,
1.163664, -0.2958832, 3.973094, 1, 0, 0.8039216, 1,
1.164566, -0.02743826, 3.226598, 1, 0, 0.7960784, 1,
1.164693, 0.5436197, 1.906753, 1, 0, 0.7921569, 1,
1.171803, -0.4192838, -0.2258362, 1, 0, 0.7843137, 1,
1.180806, 1.773741, 1.423248, 1, 0, 0.7803922, 1,
1.183387, 0.5108737, 1.340006, 1, 0, 0.772549, 1,
1.19293, 1.883128, 2.253664, 1, 0, 0.7686275, 1,
1.205635, -0.7763832, 1.309663, 1, 0, 0.7607843, 1,
1.212095, 0.1687967, 3.057137, 1, 0, 0.7568628, 1,
1.213697, -0.1307915, 2.0933, 1, 0, 0.7490196, 1,
1.22102, 0.2698536, 2.198518, 1, 0, 0.7450981, 1,
1.224991, 1.900914, 0.5042815, 1, 0, 0.7372549, 1,
1.229216, -0.3565089, 1.412877, 1, 0, 0.7333333, 1,
1.245373, -0.84196, 3.662147, 1, 0, 0.7254902, 1,
1.249324, 1.617114, 1.170774, 1, 0, 0.7215686, 1,
1.252018, -0.05779648, 0.9836609, 1, 0, 0.7137255, 1,
1.255307, 0.6463557, 0.786719, 1, 0, 0.7098039, 1,
1.263813, 1.277261, 2.326591, 1, 0, 0.7019608, 1,
1.274492, 2.357976, -0.01406617, 1, 0, 0.6941177, 1,
1.282626, -2.120708, 2.373868, 1, 0, 0.6901961, 1,
1.283652, -1.85327, 2.078838, 1, 0, 0.682353, 1,
1.284474, -0.6714311, 1.364722, 1, 0, 0.6784314, 1,
1.294994, -0.6082043, 1.144719, 1, 0, 0.6705883, 1,
1.295226, -0.4278143, 3.271326, 1, 0, 0.6666667, 1,
1.299966, 0.2543747, 1.99534, 1, 0, 0.6588235, 1,
1.306104, -0.8095272, 2.13011, 1, 0, 0.654902, 1,
1.308225, 1.757218, 0.7589415, 1, 0, 0.6470588, 1,
1.308568, -0.9265648, 3.485038, 1, 0, 0.6431373, 1,
1.322747, -0.4459234, 1.06358, 1, 0, 0.6352941, 1,
1.326921, 0.9493709, -2.645566, 1, 0, 0.6313726, 1,
1.330321, -1.25282, 3.574883, 1, 0, 0.6235294, 1,
1.337285, -0.03197219, 3.760088, 1, 0, 0.6196079, 1,
1.351421, -0.5667176, 1.912122, 1, 0, 0.6117647, 1,
1.354395, -1.208168, 2.1179, 1, 0, 0.6078432, 1,
1.362332, 0.1552198, -0.277121, 1, 0, 0.6, 1,
1.371548, 0.8905913, 1.367408, 1, 0, 0.5921569, 1,
1.376656, 0.1394962, 1.147155, 1, 0, 0.5882353, 1,
1.378152, 1.165161, 0.4986797, 1, 0, 0.5803922, 1,
1.378162, 0.2359769, 0.81038, 1, 0, 0.5764706, 1,
1.38003, 0.5232815, 1.958681, 1, 0, 0.5686275, 1,
1.385884, 0.1781421, 1.046654, 1, 0, 0.5647059, 1,
1.390998, -0.1756532, 1.05598, 1, 0, 0.5568628, 1,
1.392901, -0.09283634, -0.7734283, 1, 0, 0.5529412, 1,
1.41413, 0.05123709, 0.487317, 1, 0, 0.5450981, 1,
1.431185, 1.884763, 0.1672899, 1, 0, 0.5411765, 1,
1.431605, -0.08904068, 2.537187, 1, 0, 0.5333334, 1,
1.435234, 1.096176, -1.385169, 1, 0, 0.5294118, 1,
1.439647, 1.150322, 0.9219676, 1, 0, 0.5215687, 1,
1.459484, -0.5180708, 2.374762, 1, 0, 0.5176471, 1,
1.46066, 0.5836687, 2.221543, 1, 0, 0.509804, 1,
1.463004, 2.024014, 1.616804, 1, 0, 0.5058824, 1,
1.4671, -0.4869929, 2.127977, 1, 0, 0.4980392, 1,
1.469065, -0.1409379, 1.890534, 1, 0, 0.4901961, 1,
1.476557, 0.07602865, 0.6007105, 1, 0, 0.4862745, 1,
1.479984, -0.8967496, 2.979819, 1, 0, 0.4784314, 1,
1.482273, 2.370398, 1.656756, 1, 0, 0.4745098, 1,
1.485719, 0.02554712, 2.627711, 1, 0, 0.4666667, 1,
1.504214, 0.09926643, 2.515089, 1, 0, 0.4627451, 1,
1.510766, -0.6564813, 2.055617, 1, 0, 0.454902, 1,
1.513971, 0.6925622, 0.534133, 1, 0, 0.4509804, 1,
1.527003, -0.1869814, 0.9642225, 1, 0, 0.4431373, 1,
1.532673, -1.020045, 2.178197, 1, 0, 0.4392157, 1,
1.550397, 0.2128289, 1.950344, 1, 0, 0.4313726, 1,
1.551316, 1.330477, -0.5815154, 1, 0, 0.427451, 1,
1.556718, 1.105399, 1.498788, 1, 0, 0.4196078, 1,
1.564013, -0.4048473, 0.9387929, 1, 0, 0.4156863, 1,
1.564501, 1.604576, 1.866946, 1, 0, 0.4078431, 1,
1.566917, -0.1045608, 3.416897, 1, 0, 0.4039216, 1,
1.579371, 0.7482383, 1.090348, 1, 0, 0.3960784, 1,
1.583762, 0.08566289, 1.774505, 1, 0, 0.3882353, 1,
1.594424, -0.3516746, 1.375552, 1, 0, 0.3843137, 1,
1.612502, -1.316281, 3.39062, 1, 0, 0.3764706, 1,
1.614945, 1.101121, 0.4968623, 1, 0, 0.372549, 1,
1.642133, -0.16202, -0.05815034, 1, 0, 0.3647059, 1,
1.649044, 1.729413, 1.20212, 1, 0, 0.3607843, 1,
1.652525, 0.1365409, 1.544892, 1, 0, 0.3529412, 1,
1.669679, -0.03352561, 2.26481, 1, 0, 0.3490196, 1,
1.683196, 0.3580279, 2.391598, 1, 0, 0.3411765, 1,
1.70833, 0.5345975, 1.479186, 1, 0, 0.3372549, 1,
1.70856, 0.5397013, 1.102786, 1, 0, 0.3294118, 1,
1.715378, 0.351041, 2.000421, 1, 0, 0.3254902, 1,
1.726801, 1.463702, 1.374352, 1, 0, 0.3176471, 1,
1.731265, 0.5410956, 2.050743, 1, 0, 0.3137255, 1,
1.73683, 0.8175189, 0.6413206, 1, 0, 0.3058824, 1,
1.743646, -1.572742, 3.397686, 1, 0, 0.2980392, 1,
1.753923, 0.2606604, 2.892125, 1, 0, 0.2941177, 1,
1.754544, 0.2059311, 0.8215753, 1, 0, 0.2862745, 1,
1.766042, 0.8144902, 0.699588, 1, 0, 0.282353, 1,
1.772665, 0.2054326, 2.55489, 1, 0, 0.2745098, 1,
1.774512, -1.956555, 1.780976, 1, 0, 0.2705882, 1,
1.800329, -1.141229, 2.928387, 1, 0, 0.2627451, 1,
1.82038, -0.2579394, 1.427346, 1, 0, 0.2588235, 1,
1.848226, -1.347238, -0.4295762, 1, 0, 0.2509804, 1,
1.865807, 0.6784863, 2.313868, 1, 0, 0.2470588, 1,
1.883882, 0.2678535, 2.628076, 1, 0, 0.2392157, 1,
1.888211, 0.7428156, 1.752425, 1, 0, 0.2352941, 1,
1.891573, -0.7644817, 0.8130521, 1, 0, 0.227451, 1,
1.891708, -0.09244646, 0.3032628, 1, 0, 0.2235294, 1,
1.899808, 0.2928001, 1.23614, 1, 0, 0.2156863, 1,
1.921906, -0.2282917, -0.2194055, 1, 0, 0.2117647, 1,
1.923686, 0.3834233, 1.211125, 1, 0, 0.2039216, 1,
1.935035, 0.9912222, 0.5276367, 1, 0, 0.1960784, 1,
1.940806, -1.641009, 3.089846, 1, 0, 0.1921569, 1,
1.951342, 1.895248, 1.36751, 1, 0, 0.1843137, 1,
1.987048, -0.4708559, 0.4854872, 1, 0, 0.1803922, 1,
1.994074, -0.5804417, 2.448753, 1, 0, 0.172549, 1,
2.031857, -1.4397, 3.591441, 1, 0, 0.1686275, 1,
2.038713, 1.519009, 0.9301945, 1, 0, 0.1607843, 1,
2.046409, 0.3755671, 3.344288, 1, 0, 0.1568628, 1,
2.048788, -0.679826, 3.582339, 1, 0, 0.1490196, 1,
2.055408, 0.7974523, 2.583595, 1, 0, 0.145098, 1,
2.11036, -0.4876417, 1.331862, 1, 0, 0.1372549, 1,
2.171158, 0.7576123, 1.899461, 1, 0, 0.1333333, 1,
2.200133, 0.7871586, 1.749641, 1, 0, 0.1254902, 1,
2.212965, 0.1114792, 1.158608, 1, 0, 0.1215686, 1,
2.234416, 0.2252651, 2.813941, 1, 0, 0.1137255, 1,
2.244544, 0.9096536, 2.641398, 1, 0, 0.1098039, 1,
2.255018, 0.003575157, 2.362278, 1, 0, 0.1019608, 1,
2.290801, -0.4608056, 0.5449867, 1, 0, 0.09411765, 1,
2.334631, -1.135648, 2.376948, 1, 0, 0.09019608, 1,
2.357041, -2.143463, 2.200936, 1, 0, 0.08235294, 1,
2.446903, -0.4223011, 1.610265, 1, 0, 0.07843138, 1,
2.484414, 0.7436953, 1.068756, 1, 0, 0.07058824, 1,
2.616968, 0.5875553, 1.168128, 1, 0, 0.06666667, 1,
2.631113, -0.2510269, 3.393825, 1, 0, 0.05882353, 1,
2.733602, -0.6192476, 3.265797, 1, 0, 0.05490196, 1,
2.791993, -0.9218062, 1.190203, 1, 0, 0.04705882, 1,
2.828259, 0.3074926, 1.853169, 1, 0, 0.04313726, 1,
2.842512, -1.623497, 0.8892165, 1, 0, 0.03529412, 1,
3.113254, 0.6551273, 1.676769, 1, 0, 0.03137255, 1,
3.161369, -0.07322576, 2.269912, 1, 0, 0.02352941, 1,
3.383681, 0.9271634, -0.04241939, 1, 0, 0.01960784, 1,
3.420137, -0.2208095, 1.117016, 1, 0, 0.01176471, 1,
4.745487, 1.051635, 0.8298872, 1, 0, 0.007843138, 1
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
0.6495277, -4.098464, -7.122452, 0, -0.5, 0.5, 0.5,
0.6495277, -4.098464, -7.122452, 1, -0.5, 0.5, 0.5,
0.6495277, -4.098464, -7.122452, 1, 1.5, 0.5, 0.5,
0.6495277, -4.098464, -7.122452, 0, 1.5, 0.5, 0.5
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
-4.834961, 0.1985602, -7.122452, 0, -0.5, 0.5, 0.5,
-4.834961, 0.1985602, -7.122452, 1, -0.5, 0.5, 0.5,
-4.834961, 0.1985602, -7.122452, 1, 1.5, 0.5, 0.5,
-4.834961, 0.1985602, -7.122452, 0, 1.5, 0.5, 0.5
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
-4.834961, -4.098464, 0.2588317, 0, -0.5, 0.5, 0.5,
-4.834961, -4.098464, 0.2588317, 1, -0.5, 0.5, 0.5,
-4.834961, -4.098464, 0.2588317, 1, 1.5, 0.5, 0.5,
-4.834961, -4.098464, 0.2588317, 0, 1.5, 0.5, 0.5
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
-2, -3.106843, -5.419079,
4, -3.106843, -5.419079,
-2, -3.106843, -5.419079,
-2, -3.272113, -5.702975,
0, -3.106843, -5.419079,
0, -3.272113, -5.702975,
2, -3.106843, -5.419079,
2, -3.272113, -5.702975,
4, -3.106843, -5.419079,
4, -3.272113, -5.702975
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
"2",
"4"
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
-2, -3.602653, -6.270766, 0, -0.5, 0.5, 0.5,
-2, -3.602653, -6.270766, 1, -0.5, 0.5, 0.5,
-2, -3.602653, -6.270766, 1, 1.5, 0.5, 0.5,
-2, -3.602653, -6.270766, 0, 1.5, 0.5, 0.5,
0, -3.602653, -6.270766, 0, -0.5, 0.5, 0.5,
0, -3.602653, -6.270766, 1, -0.5, 0.5, 0.5,
0, -3.602653, -6.270766, 1, 1.5, 0.5, 0.5,
0, -3.602653, -6.270766, 0, 1.5, 0.5, 0.5,
2, -3.602653, -6.270766, 0, -0.5, 0.5, 0.5,
2, -3.602653, -6.270766, 1, -0.5, 0.5, 0.5,
2, -3.602653, -6.270766, 1, 1.5, 0.5, 0.5,
2, -3.602653, -6.270766, 0, 1.5, 0.5, 0.5,
4, -3.602653, -6.270766, 0, -0.5, 0.5, 0.5,
4, -3.602653, -6.270766, 1, -0.5, 0.5, 0.5,
4, -3.602653, -6.270766, 1, 1.5, 0.5, 0.5,
4, -3.602653, -6.270766, 0, 1.5, 0.5, 0.5
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
-3.56931, -3, -5.419079,
-3.56931, 3, -5.419079,
-3.56931, -3, -5.419079,
-3.780252, -3, -5.702975,
-3.56931, -2, -5.419079,
-3.780252, -2, -5.702975,
-3.56931, -1, -5.419079,
-3.780252, -1, -5.702975,
-3.56931, 0, -5.419079,
-3.780252, 0, -5.702975,
-3.56931, 1, -5.419079,
-3.780252, 1, -5.702975,
-3.56931, 2, -5.419079,
-3.780252, 2, -5.702975,
-3.56931, 3, -5.419079,
-3.780252, 3, -5.702975
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
-4.202136, -3, -6.270766, 0, -0.5, 0.5, 0.5,
-4.202136, -3, -6.270766, 1, -0.5, 0.5, 0.5,
-4.202136, -3, -6.270766, 1, 1.5, 0.5, 0.5,
-4.202136, -3, -6.270766, 0, 1.5, 0.5, 0.5,
-4.202136, -2, -6.270766, 0, -0.5, 0.5, 0.5,
-4.202136, -2, -6.270766, 1, -0.5, 0.5, 0.5,
-4.202136, -2, -6.270766, 1, 1.5, 0.5, 0.5,
-4.202136, -2, -6.270766, 0, 1.5, 0.5, 0.5,
-4.202136, -1, -6.270766, 0, -0.5, 0.5, 0.5,
-4.202136, -1, -6.270766, 1, -0.5, 0.5, 0.5,
-4.202136, -1, -6.270766, 1, 1.5, 0.5, 0.5,
-4.202136, -1, -6.270766, 0, 1.5, 0.5, 0.5,
-4.202136, 0, -6.270766, 0, -0.5, 0.5, 0.5,
-4.202136, 0, -6.270766, 1, -0.5, 0.5, 0.5,
-4.202136, 0, -6.270766, 1, 1.5, 0.5, 0.5,
-4.202136, 0, -6.270766, 0, 1.5, 0.5, 0.5,
-4.202136, 1, -6.270766, 0, -0.5, 0.5, 0.5,
-4.202136, 1, -6.270766, 1, -0.5, 0.5, 0.5,
-4.202136, 1, -6.270766, 1, 1.5, 0.5, 0.5,
-4.202136, 1, -6.270766, 0, 1.5, 0.5, 0.5,
-4.202136, 2, -6.270766, 0, -0.5, 0.5, 0.5,
-4.202136, 2, -6.270766, 1, -0.5, 0.5, 0.5,
-4.202136, 2, -6.270766, 1, 1.5, 0.5, 0.5,
-4.202136, 2, -6.270766, 0, 1.5, 0.5, 0.5,
-4.202136, 3, -6.270766, 0, -0.5, 0.5, 0.5,
-4.202136, 3, -6.270766, 1, -0.5, 0.5, 0.5,
-4.202136, 3, -6.270766, 1, 1.5, 0.5, 0.5,
-4.202136, 3, -6.270766, 0, 1.5, 0.5, 0.5
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
-3.56931, -3.106843, -4,
-3.56931, -3.106843, 4,
-3.56931, -3.106843, -4,
-3.780252, -3.272113, -4,
-3.56931, -3.106843, -2,
-3.780252, -3.272113, -2,
-3.56931, -3.106843, 0,
-3.780252, -3.272113, 0,
-3.56931, -3.106843, 2,
-3.780252, -3.272113, 2,
-3.56931, -3.106843, 4,
-3.780252, -3.272113, 4
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
-4.202136, -3.602653, -4, 0, -0.5, 0.5, 0.5,
-4.202136, -3.602653, -4, 1, -0.5, 0.5, 0.5,
-4.202136, -3.602653, -4, 1, 1.5, 0.5, 0.5,
-4.202136, -3.602653, -4, 0, 1.5, 0.5, 0.5,
-4.202136, -3.602653, -2, 0, -0.5, 0.5, 0.5,
-4.202136, -3.602653, -2, 1, -0.5, 0.5, 0.5,
-4.202136, -3.602653, -2, 1, 1.5, 0.5, 0.5,
-4.202136, -3.602653, -2, 0, 1.5, 0.5, 0.5,
-4.202136, -3.602653, 0, 0, -0.5, 0.5, 0.5,
-4.202136, -3.602653, 0, 1, -0.5, 0.5, 0.5,
-4.202136, -3.602653, 0, 1, 1.5, 0.5, 0.5,
-4.202136, -3.602653, 0, 0, 1.5, 0.5, 0.5,
-4.202136, -3.602653, 2, 0, -0.5, 0.5, 0.5,
-4.202136, -3.602653, 2, 1, -0.5, 0.5, 0.5,
-4.202136, -3.602653, 2, 1, 1.5, 0.5, 0.5,
-4.202136, -3.602653, 2, 0, 1.5, 0.5, 0.5,
-4.202136, -3.602653, 4, 0, -0.5, 0.5, 0.5,
-4.202136, -3.602653, 4, 1, -0.5, 0.5, 0.5,
-4.202136, -3.602653, 4, 1, 1.5, 0.5, 0.5,
-4.202136, -3.602653, 4, 0, 1.5, 0.5, 0.5
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
-3.56931, -3.106843, -5.419079,
-3.56931, 3.503963, -5.419079,
-3.56931, -3.106843, 5.936743,
-3.56931, 3.503963, 5.936743,
-3.56931, -3.106843, -5.419079,
-3.56931, -3.106843, 5.936743,
-3.56931, 3.503963, -5.419079,
-3.56931, 3.503963, 5.936743,
-3.56931, -3.106843, -5.419079,
4.868365, -3.106843, -5.419079,
-3.56931, -3.106843, 5.936743,
4.868365, -3.106843, 5.936743,
-3.56931, 3.503963, -5.419079,
4.868365, 3.503963, -5.419079,
-3.56931, 3.503963, 5.936743,
4.868365, 3.503963, 5.936743,
4.868365, -3.106843, -5.419079,
4.868365, 3.503963, -5.419079,
4.868365, -3.106843, 5.936743,
4.868365, 3.503963, 5.936743,
4.868365, -3.106843, -5.419079,
4.868365, -3.106843, 5.936743,
4.868365, 3.503963, -5.419079,
4.868365, 3.503963, 5.936743
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
var radius = 8.33851;
var distance = 37.09898;
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
mvMatrix.translate( -0.6495277, -0.1985602, -0.2588317 );
mvMatrix.scale( 1.068512, 1.363791, 0.7939329 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -37.09898);
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
carbamate<-read.table("carbamate.xyz")
```

```
## Error in read.table("carbamate.xyz"): no lines available in input
```

```r
x<-carbamate$V2
```

```
## Error in eval(expr, envir, enclos): object 'carbamate' not found
```

```r
y<-carbamate$V3
```

```
## Error in eval(expr, envir, enclos): object 'carbamate' not found
```

```r
z<-carbamate$V4
```

```
## Error in eval(expr, envir, enclos): object 'carbamate' not found
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
-3.446431, 1.00516, 0.4347899, 0, 0, 1, 1, 1,
-3.234681, -0.6076548, -3.80134, 1, 0, 0, 1, 1,
-2.818324, -0.5219465, -0.06196911, 1, 0, 0, 1, 1,
-2.78926, 0.2099719, -0.7109872, 1, 0, 0, 1, 1,
-2.657026, 0.865235, -1.418683, 1, 0, 0, 1, 1,
-2.653448, 1.993348, -0.6006548, 1, 0, 0, 1, 1,
-2.546739, 0.4470445, 0.4751576, 0, 0, 0, 1, 1,
-2.506999, 0.7719404, -1.690325, 0, 0, 0, 1, 1,
-2.441846, -0.2410646, -1.467483, 0, 0, 0, 1, 1,
-2.282113, 0.4776569, -0.6459999, 0, 0, 0, 1, 1,
-2.269599, 2.134303, -1.051574, 0, 0, 0, 1, 1,
-2.176934, -0.5080371, -2.029379, 0, 0, 0, 1, 1,
-2.16152, 0.8121988, -2.354698, 0, 0, 0, 1, 1,
-2.145592, -0.009632891, -1.725038, 1, 1, 1, 1, 1,
-2.122886, 2.190165, -0.6394174, 1, 1, 1, 1, 1,
-2.112033, 0.4253641, -3.518973, 1, 1, 1, 1, 1,
-2.107296, 1.832623, -0.929046, 1, 1, 1, 1, 1,
-2.079706, 1.444949, -0.3893867, 1, 1, 1, 1, 1,
-2.073794, -1.167399, -3.001811, 1, 1, 1, 1, 1,
-2.072622, 1.345481, 0.03426119, 1, 1, 1, 1, 1,
-2.056691, 0.4481638, -4.648401, 1, 1, 1, 1, 1,
-2.056483, -1.544813, -3.377135, 1, 1, 1, 1, 1,
-2.025988, -1.124791, -1.101052, 1, 1, 1, 1, 1,
-1.991338, -1.584811, -1.211982, 1, 1, 1, 1, 1,
-1.969383, 0.05420569, -1.324186, 1, 1, 1, 1, 1,
-1.924903, -0.86092, -1.752242, 1, 1, 1, 1, 1,
-1.889948, 0.5889423, -2.795353, 1, 1, 1, 1, 1,
-1.877387, 0.2664528, -2.813655, 1, 1, 1, 1, 1,
-1.863352, 1.432414, -2.356236, 0, 0, 1, 1, 1,
-1.861209, 0.1867798, -0.6289713, 1, 0, 0, 1, 1,
-1.835394, -0.1914246, -2.01348, 1, 0, 0, 1, 1,
-1.811081, 1.963658, -0.7507746, 1, 0, 0, 1, 1,
-1.807423, 0.1138201, -2.407458, 1, 0, 0, 1, 1,
-1.792936, -0.4487546, -1.116624, 1, 0, 0, 1, 1,
-1.79241, -0.8035165, -2.013871, 0, 0, 0, 1, 1,
-1.7767, 1.094889, 0.6613408, 0, 0, 0, 1, 1,
-1.775281, -0.8646711, -2.283966, 0, 0, 0, 1, 1,
-1.774578, -0.6883247, -2.499162, 0, 0, 0, 1, 1,
-1.763546, 0.2892295, -0.7322332, 0, 0, 0, 1, 1,
-1.760661, -1.045707, -1.564954, 0, 0, 0, 1, 1,
-1.748892, 1.419794, -1.324389, 0, 0, 0, 1, 1,
-1.721537, 1.89712, -0.1715467, 1, 1, 1, 1, 1,
-1.690893, 0.2255832, -2.418761, 1, 1, 1, 1, 1,
-1.668294, -0.914823, -2.045272, 1, 1, 1, 1, 1,
-1.662959, 0.6710642, -0.5213389, 1, 1, 1, 1, 1,
-1.662913, 0.23552, -1.518884, 1, 1, 1, 1, 1,
-1.654155, -0.1889573, -1.091047, 1, 1, 1, 1, 1,
-1.653782, 1.100668, 0.2089561, 1, 1, 1, 1, 1,
-1.653732, 0.9788064, -3.140495, 1, 1, 1, 1, 1,
-1.609723, -1.047235, -4.340376, 1, 1, 1, 1, 1,
-1.600355, 0.03054676, -1.983494, 1, 1, 1, 1, 1,
-1.600098, 1.02382, -2.191563, 1, 1, 1, 1, 1,
-1.589323, -1.437081, -2.543304, 1, 1, 1, 1, 1,
-1.587091, 0.4389312, -2.854599, 1, 1, 1, 1, 1,
-1.546786, -0.5469455, 0.1706593, 1, 1, 1, 1, 1,
-1.540448, -0.3988037, -2.161897, 1, 1, 1, 1, 1,
-1.540282, 0.008550162, -1.390893, 0, 0, 1, 1, 1,
-1.537802, -1.203224, -1.84523, 1, 0, 0, 1, 1,
-1.533732, 0.6868924, -1.723967, 1, 0, 0, 1, 1,
-1.515514, 0.6748316, -0.8231087, 1, 0, 0, 1, 1,
-1.494846, 1.004178, -1.249119, 1, 0, 0, 1, 1,
-1.477484, -1.078699, -2.510363, 1, 0, 0, 1, 1,
-1.469851, -2.350133, -2.48336, 0, 0, 0, 1, 1,
-1.469053, -0.9286898, -3.54552, 0, 0, 0, 1, 1,
-1.464679, -0.9283478, -0.692795, 0, 0, 0, 1, 1,
-1.45417, 1.464268, -1.161142, 0, 0, 0, 1, 1,
-1.444381, -0.6132758, -1.202729, 0, 0, 0, 1, 1,
-1.438961, -0.6918892, -2.154407, 0, 0, 0, 1, 1,
-1.419283, -0.1516895, -1.422488, 0, 0, 0, 1, 1,
-1.416648, -0.8806814, -2.97683, 1, 1, 1, 1, 1,
-1.416448, 0.7029729, -1.031996, 1, 1, 1, 1, 1,
-1.411047, -0.5650958, -0.8397832, 1, 1, 1, 1, 1,
-1.401789, -2.21473, -2.998165, 1, 1, 1, 1, 1,
-1.397566, -0.8900796, -2.741325, 1, 1, 1, 1, 1,
-1.397319, 0.8958378, -0.3186766, 1, 1, 1, 1, 1,
-1.392944, -0.7091851, -2.228872, 1, 1, 1, 1, 1,
-1.372847, 0.7758284, -1.019267, 1, 1, 1, 1, 1,
-1.358882, -0.1257754, 0.07052547, 1, 1, 1, 1, 1,
-1.355951, 1.055063, 0.01702236, 1, 1, 1, 1, 1,
-1.351069, 1.424123, -0.5335599, 1, 1, 1, 1, 1,
-1.344781, 0.1657403, -0.9262986, 1, 1, 1, 1, 1,
-1.344753, 0.07916602, -3.475881, 1, 1, 1, 1, 1,
-1.324781, 1.752634, -1.355026, 1, 1, 1, 1, 1,
-1.316087, -0.0668285, -3.000594, 1, 1, 1, 1, 1,
-1.307646, -1.278884, -1.221156, 0, 0, 1, 1, 1,
-1.282953, -0.7827513, -2.712153, 1, 0, 0, 1, 1,
-1.278018, 1.947481, 1.285301, 1, 0, 0, 1, 1,
-1.271724, -0.3218451, -4.239828, 1, 0, 0, 1, 1,
-1.271239, 0.3907579, 1.360668, 1, 0, 0, 1, 1,
-1.26927, -1.402718, -2.333119, 1, 0, 0, 1, 1,
-1.268784, 1.182145, -0.6103455, 0, 0, 0, 1, 1,
-1.26179, 0.2574801, -0.8381733, 0, 0, 0, 1, 1,
-1.248689, -0.8971751, -2.14121, 0, 0, 0, 1, 1,
-1.246186, 0.315808, -1.744733, 0, 0, 0, 1, 1,
-1.225852, 0.7938029, -0.6633468, 0, 0, 0, 1, 1,
-1.225104, -1.500598, -1.99538, 0, 0, 0, 1, 1,
-1.219861, 0.0648081, -0.7766206, 0, 0, 0, 1, 1,
-1.214465, 0.005919649, -1.887461, 1, 1, 1, 1, 1,
-1.199804, -0.03924513, -0.2030696, 1, 1, 1, 1, 1,
-1.197138, 1.198232, -0.49992, 1, 1, 1, 1, 1,
-1.196018, 1.716053, -0.5096155, 1, 1, 1, 1, 1,
-1.195711, -0.1517016, -2.716741, 1, 1, 1, 1, 1,
-1.190529, 1.529698, -0.8880313, 1, 1, 1, 1, 1,
-1.189567, 0.4204776, -0.8499743, 1, 1, 1, 1, 1,
-1.188459, -0.4012242, -2.285955, 1, 1, 1, 1, 1,
-1.187316, -1.247335, -1.817606, 1, 1, 1, 1, 1,
-1.185131, -0.335464, -2.620712, 1, 1, 1, 1, 1,
-1.183795, 0.7011711, -2.385514, 1, 1, 1, 1, 1,
-1.180917, 2.00799, -1.136731, 1, 1, 1, 1, 1,
-1.17434, 0.415136, -2.042651, 1, 1, 1, 1, 1,
-1.173176, 0.6310618, -0.7980568, 1, 1, 1, 1, 1,
-1.173052, -0.8000894, -3.273066, 1, 1, 1, 1, 1,
-1.170638, 0.02736955, -2.446678, 0, 0, 1, 1, 1,
-1.170483, 0.1890354, -3.87637, 1, 0, 0, 1, 1,
-1.167896, 1.025744, 0.2375876, 1, 0, 0, 1, 1,
-1.167271, 0.6596012, -3.078465, 1, 0, 0, 1, 1,
-1.166552, -2.554225, -3.347997, 1, 0, 0, 1, 1,
-1.163673, -1.049268, -0.9795783, 1, 0, 0, 1, 1,
-1.160695, 0.7714619, -1.300813, 0, 0, 0, 1, 1,
-1.160433, 2.192123, -1.072992, 0, 0, 0, 1, 1,
-1.159312, -2.368684, -3.873452, 0, 0, 0, 1, 1,
-1.150728, -2.026758, -1.151816, 0, 0, 0, 1, 1,
-1.146249, -0.1134549, -1.041777, 0, 0, 0, 1, 1,
-1.135078, -1.338516, -3.464617, 0, 0, 0, 1, 1,
-1.130865, -1.165835, -2.053554, 0, 0, 0, 1, 1,
-1.126903, -0.8271955, -1.814343, 1, 1, 1, 1, 1,
-1.126645, -1.162787, -1.816957, 1, 1, 1, 1, 1,
-1.12323, -0.6149247, -1.232025, 1, 1, 1, 1, 1,
-1.121216, 0.2150273, -2.070148, 1, 1, 1, 1, 1,
-1.104376, -0.5560078, -2.030131, 1, 1, 1, 1, 1,
-1.100034, -0.3497171, -2.401338, 1, 1, 1, 1, 1,
-1.090232, -1.274113, -2.803323, 1, 1, 1, 1, 1,
-1.090031, -0.148276, -2.339444, 1, 1, 1, 1, 1,
-1.089402, -0.8706098, -2.074504, 1, 1, 1, 1, 1,
-1.083366, -1.313065, -0.7931663, 1, 1, 1, 1, 1,
-1.073636, -0.1818886, -0.458758, 1, 1, 1, 1, 1,
-1.073202, 0.1121668, -2.296181, 1, 1, 1, 1, 1,
-1.072858, -0.1814992, -1.386454, 1, 1, 1, 1, 1,
-1.069233, 0.22065, -2.353003, 1, 1, 1, 1, 1,
-1.068434, 0.3218088, -1.317494, 1, 1, 1, 1, 1,
-1.058579, -0.359534, -3.229288, 0, 0, 1, 1, 1,
-1.057479, 0.3523911, -1.857285, 1, 0, 0, 1, 1,
-1.04471, -2.537098, -2.381334, 1, 0, 0, 1, 1,
-1.039713, -1.078779, -1.882468, 1, 0, 0, 1, 1,
-1.034472, -0.599613, -1.532802, 1, 0, 0, 1, 1,
-1.029131, 0.1341538, -1.115305, 1, 0, 0, 1, 1,
-1.023945, -1.224887, -1.014612, 0, 0, 0, 1, 1,
-1.019787, 0.04095191, -0.3799271, 0, 0, 0, 1, 1,
-1.01808, 1.806657, -0.9712147, 0, 0, 0, 1, 1,
-1.010176, -1.193137, -2.608932, 0, 0, 0, 1, 1,
-1.00872, 0.6695222, -1.122554, 0, 0, 0, 1, 1,
-1.004751, 1.308859, -1.591551, 0, 0, 0, 1, 1,
-0.9987803, -0.6353738, -2.569607, 0, 0, 0, 1, 1,
-0.9982709, 2.831333, 1.025507, 1, 1, 1, 1, 1,
-0.9976993, 0.1222627, -1.588853, 1, 1, 1, 1, 1,
-0.9964719, 1.537893, -0.450117, 1, 1, 1, 1, 1,
-0.9951444, -1.02777, -1.582606, 1, 1, 1, 1, 1,
-0.9948233, -0.9214503, -2.750159, 1, 1, 1, 1, 1,
-0.9935949, 0.7768857, -0.1852169, 1, 1, 1, 1, 1,
-0.9923096, -0.8390046, -2.125964, 1, 1, 1, 1, 1,
-0.991529, -0.0786543, -1.711246, 1, 1, 1, 1, 1,
-0.9880399, -0.8617206, -1.675454, 1, 1, 1, 1, 1,
-0.9869972, 0.2902872, -1.703443, 1, 1, 1, 1, 1,
-0.9853193, 0.792011, -0.8728134, 1, 1, 1, 1, 1,
-0.9842434, -2.818706, -3.212135, 1, 1, 1, 1, 1,
-0.984061, -1.074563, -0.8429826, 1, 1, 1, 1, 1,
-0.9833636, 0.5412407, -1.76092, 1, 1, 1, 1, 1,
-0.9807987, 1.220556, -0.01256388, 1, 1, 1, 1, 1,
-0.9773738, -0.8756405, -2.71497, 0, 0, 1, 1, 1,
-0.9751891, 0.5367442, 0.4288829, 1, 0, 0, 1, 1,
-0.9736956, -1.111697, -4.131816, 1, 0, 0, 1, 1,
-0.9723396, -0.3824086, -0.213291, 1, 0, 0, 1, 1,
-0.9684765, -0.5953155, -2.635726, 1, 0, 0, 1, 1,
-0.966018, 0.1991398, -1.60789, 1, 0, 0, 1, 1,
-0.9627368, 0.9989828, -2.12994, 0, 0, 0, 1, 1,
-0.9514846, 0.6184092, 2.571373, 0, 0, 0, 1, 1,
-0.9486971, -1.057676, -3.073246, 0, 0, 0, 1, 1,
-0.9461282, 0.8717902, 0.0469985, 0, 0, 0, 1, 1,
-0.9424741, 0.2629077, -1.537288, 0, 0, 0, 1, 1,
-0.9414149, 1.102882, -0.957302, 0, 0, 0, 1, 1,
-0.934091, 1.178059, -0.2267867, 0, 0, 0, 1, 1,
-0.9300717, 1.189156, -0.6856968, 1, 1, 1, 1, 1,
-0.9289616, -0.4171861, -0.1058147, 1, 1, 1, 1, 1,
-0.9253367, -0.464487, -0.9751376, 1, 1, 1, 1, 1,
-0.9161899, -2.090122, -2.371924, 1, 1, 1, 1, 1,
-0.9126588, 0.1327834, -1.977222, 1, 1, 1, 1, 1,
-0.9122559, -0.5711005, -3.729071, 1, 1, 1, 1, 1,
-0.9088947, 1.676652, -0.2980223, 1, 1, 1, 1, 1,
-0.9029123, 0.3181357, -2.265992, 1, 1, 1, 1, 1,
-0.8967811, 0.6424084, -1.458765, 1, 1, 1, 1, 1,
-0.8852673, 0.8960477, -1.070679, 1, 1, 1, 1, 1,
-0.8850995, -0.5387806, -1.99884, 1, 1, 1, 1, 1,
-0.8745207, -1.035406, -1.594867, 1, 1, 1, 1, 1,
-0.8718315, -1.00105, -1.637626, 1, 1, 1, 1, 1,
-0.8686104, 0.6569161, -1.728463, 1, 1, 1, 1, 1,
-0.8638914, -1.442393, -2.529444, 1, 1, 1, 1, 1,
-0.8613328, 0.5819898, -2.899928, 0, 0, 1, 1, 1,
-0.8601059, 0.5637952, -0.7658908, 1, 0, 0, 1, 1,
-0.8582643, 0.8230745, -2.719234, 1, 0, 0, 1, 1,
-0.8581789, -1.63161, -1.724674, 1, 0, 0, 1, 1,
-0.8566206, 1.166586, -0.952711, 1, 0, 0, 1, 1,
-0.8535649, 0.440541, -0.8536336, 1, 0, 0, 1, 1,
-0.8517531, -1.450593, -3.129349, 0, 0, 0, 1, 1,
-0.8461721, -0.4393477, -2.256486, 0, 0, 0, 1, 1,
-0.8445553, 0.5861309, -2.15944, 0, 0, 0, 1, 1,
-0.8445137, -0.4550655, -0.6451703, 0, 0, 0, 1, 1,
-0.8420145, -0.3016586, -0.1698661, 0, 0, 0, 1, 1,
-0.8360749, 0.7855901, -0.9068747, 0, 0, 0, 1, 1,
-0.8235534, 1.974429, -0.2581372, 0, 0, 0, 1, 1,
-0.8207293, -0.2948174, 0.560968, 1, 1, 1, 1, 1,
-0.8143575, -0.2629118, -3.486396, 1, 1, 1, 1, 1,
-0.8122418, 1.889318, -0.3237447, 1, 1, 1, 1, 1,
-0.8113669, -0.0643687, -1.290965, 1, 1, 1, 1, 1,
-0.8091437, -0.6023637, -1.79464, 1, 1, 1, 1, 1,
-0.8056635, 1.998471, -1.616209, 1, 1, 1, 1, 1,
-0.8047692, 2.000615, -2.67559, 1, 1, 1, 1, 1,
-0.8016582, 0.45297, -0.6178575, 1, 1, 1, 1, 1,
-0.7997927, 0.1003008, -2.456946, 1, 1, 1, 1, 1,
-0.7972345, 0.3766906, -0.05340381, 1, 1, 1, 1, 1,
-0.7943897, -0.7869388, -2.795281, 1, 1, 1, 1, 1,
-0.7903544, -0.8754538, -2.569181, 1, 1, 1, 1, 1,
-0.78664, 0.0309684, -0.7445258, 1, 1, 1, 1, 1,
-0.7858042, -2.01133, -3.245007, 1, 1, 1, 1, 1,
-0.7814875, 1.398097, -0.2013743, 1, 1, 1, 1, 1,
-0.7785381, -0.5049875, -1.554846, 0, 0, 1, 1, 1,
-0.765605, 0.6192027, -1.316104, 1, 0, 0, 1, 1,
-0.7588189, 0.6676282, -1.812299, 1, 0, 0, 1, 1,
-0.7540673, -0.08298221, -2.054549, 1, 0, 0, 1, 1,
-0.7538165, 1.026788, -1.150445, 1, 0, 0, 1, 1,
-0.7509051, 0.7999228, -1.405148, 1, 0, 0, 1, 1,
-0.7492053, 0.7319463, -0.4925234, 0, 0, 0, 1, 1,
-0.7437387, 0.3703963, -1.171389, 0, 0, 0, 1, 1,
-0.7419771, 0.7931738, 1.447136, 0, 0, 0, 1, 1,
-0.7399698, -1.660167, -3.017628, 0, 0, 0, 1, 1,
-0.7341114, -0.8841945, -0.9091702, 0, 0, 0, 1, 1,
-0.7308053, 0.5695587, -2.772296, 0, 0, 0, 1, 1,
-0.7297066, -1.635544, -3.391705, 0, 0, 0, 1, 1,
-0.7288382, 1.760263, 0.3872491, 1, 1, 1, 1, 1,
-0.7287437, -0.3866021, -2.650549, 1, 1, 1, 1, 1,
-0.7265333, 1.699587, -0.8003912, 1, 1, 1, 1, 1,
-0.7258427, 0.3737552, -1.271778, 1, 1, 1, 1, 1,
-0.7254055, 0.4084224, -3.065206, 1, 1, 1, 1, 1,
-0.7243131, 1.229249, -1.31007, 1, 1, 1, 1, 1,
-0.7185521, -0.3269237, -3.524431, 1, 1, 1, 1, 1,
-0.7185028, 0.07350364, -1.321556, 1, 1, 1, 1, 1,
-0.7139918, -0.2865351, -1.606582, 1, 1, 1, 1, 1,
-0.7128131, -0.4993823, -0.9495359, 1, 1, 1, 1, 1,
-0.70253, -1.105708, -1.692463, 1, 1, 1, 1, 1,
-0.699564, 1.726414, -0.7163429, 1, 1, 1, 1, 1,
-0.6991634, 0.6315686, -1.079885, 1, 1, 1, 1, 1,
-0.691891, 0.2613754, -3.502414, 1, 1, 1, 1, 1,
-0.6882729, -1.763507, -2.459727, 1, 1, 1, 1, 1,
-0.6831874, -0.0126424, -1.058127, 0, 0, 1, 1, 1,
-0.6801019, -0.3644297, -1.786532, 1, 0, 0, 1, 1,
-0.6730565, 0.2953862, -1.378172, 1, 0, 0, 1, 1,
-0.6691859, 1.724574, -1.151777, 1, 0, 0, 1, 1,
-0.665611, 0.8906894, 0.7611567, 1, 0, 0, 1, 1,
-0.6587144, 1.083752, -1.887957, 1, 0, 0, 1, 1,
-0.6551432, -1.559912, -3.416486, 0, 0, 0, 1, 1,
-0.6533759, -0.07155906, -2.247345, 0, 0, 0, 1, 1,
-0.6514041, 0.03328566, -0.5030013, 0, 0, 0, 1, 1,
-0.6471078, -0.9177687, -3.012587, 0, 0, 0, 1, 1,
-0.6423743, -0.430218, -2.080787, 0, 0, 0, 1, 1,
-0.6417212, -2.213293, -3.610378, 0, 0, 0, 1, 1,
-0.6370488, 0.5409879, -0.2732274, 0, 0, 0, 1, 1,
-0.632904, -0.7785831, -1.961144, 1, 1, 1, 1, 1,
-0.6320571, 0.3776867, -2.356442, 1, 1, 1, 1, 1,
-0.6304396, -0.1328614, -0.3650503, 1, 1, 1, 1, 1,
-0.6213122, 1.113784, -0.1882677, 1, 1, 1, 1, 1,
-0.6191511, -1.805151, -3.26317, 1, 1, 1, 1, 1,
-0.6173449, 0.7623414, -1.138327, 1, 1, 1, 1, 1,
-0.6150694, 0.04977951, -2.414239, 1, 1, 1, 1, 1,
-0.6100335, 1.015365, -1.448635, 1, 1, 1, 1, 1,
-0.609758, 0.2604751, -0.4879539, 1, 1, 1, 1, 1,
-0.6059602, 0.2471459, -0.9206374, 1, 1, 1, 1, 1,
-0.5971131, 0.2637521, -2.999787, 1, 1, 1, 1, 1,
-0.5890971, -0.5304776, -0.7720129, 1, 1, 1, 1, 1,
-0.5889484, -0.3277407, -1.240648, 1, 1, 1, 1, 1,
-0.585964, 1.812032, -0.3878289, 1, 1, 1, 1, 1,
-0.5716487, 0.8582612, -1.734797, 1, 1, 1, 1, 1,
-0.5670232, 1.354854, -1.071866, 0, 0, 1, 1, 1,
-0.5652374, -0.2696985, -1.568955, 1, 0, 0, 1, 1,
-0.5649859, -0.2327032, -3.044444, 1, 0, 0, 1, 1,
-0.5626953, 0.8042901, 0.08259654, 1, 0, 0, 1, 1,
-0.5604002, 0.5126159, -2.083645, 1, 0, 0, 1, 1,
-0.55399, -3.010569, -1.096427, 1, 0, 0, 1, 1,
-0.553477, 2.497062, 0.04335236, 0, 0, 0, 1, 1,
-0.5512123, -0.4364253, -0.5565972, 0, 0, 0, 1, 1,
-0.5484779, 0.02074525, -1.864017, 0, 0, 0, 1, 1,
-0.5430021, 0.08711753, -2.065204, 0, 0, 0, 1, 1,
-0.5399264, 0.6863291, 0.1655516, 0, 0, 0, 1, 1,
-0.5354972, 0.9457145, -0.5483873, 0, 0, 0, 1, 1,
-0.5344387, 0.4487841, 0.29193, 0, 0, 0, 1, 1,
-0.5285117, -0.37991, -3.481001, 1, 1, 1, 1, 1,
-0.5268454, -0.05171071, -2.902983, 1, 1, 1, 1, 1,
-0.5149576, 0.2217973, -1.897787, 1, 1, 1, 1, 1,
-0.5131384, -1.063421, -1.755159, 1, 1, 1, 1, 1,
-0.5118359, 0.2165404, -2.290171, 1, 1, 1, 1, 1,
-0.5063946, 0.3767493, -0.3330002, 1, 1, 1, 1, 1,
-0.5033202, -0.2998376, -0.7838907, 1, 1, 1, 1, 1,
-0.4961235, -0.9761007, -3.436517, 1, 1, 1, 1, 1,
-0.4952517, 0.8268907, 0.05008719, 1, 1, 1, 1, 1,
-0.4916916, 1.917094, 0.3954455, 1, 1, 1, 1, 1,
-0.4898095, -0.6158589, -4.38107, 1, 1, 1, 1, 1,
-0.4876158, 1.028462, 0.6672455, 1, 1, 1, 1, 1,
-0.4810891, 0.1257584, -1.855119, 1, 1, 1, 1, 1,
-0.4713009, -0.6997256, -4.545657, 1, 1, 1, 1, 1,
-0.4702178, 1.073867, -0.6410973, 1, 1, 1, 1, 1,
-0.4692068, -0.9443076, -2.180919, 0, 0, 1, 1, 1,
-0.467874, -0.6952579, -2.608027, 1, 0, 0, 1, 1,
-0.4659161, -0.3000474, -2.113715, 1, 0, 0, 1, 1,
-0.4628483, 1.890682, 1.205069, 1, 0, 0, 1, 1,
-0.4620234, 0.217688, 0.6254619, 1, 0, 0, 1, 1,
-0.4595884, 0.1622046, -0.5604429, 1, 0, 0, 1, 1,
-0.459217, 0.4758764, -0.633292, 0, 0, 0, 1, 1,
-0.4580806, -0.1839104, -1.062413, 0, 0, 0, 1, 1,
-0.4569331, 0.00183528, -1.220373, 0, 0, 0, 1, 1,
-0.453858, 0.02171101, -0.2876249, 0, 0, 0, 1, 1,
-0.4488306, 1.418462, -1.759287, 0, 0, 0, 1, 1,
-0.4463714, 0.08863026, -3.264501, 0, 0, 0, 1, 1,
-0.4362787, 0.1014737, -3.063559, 0, 0, 0, 1, 1,
-0.4350156, -0.5401753, -2.144965, 1, 1, 1, 1, 1,
-0.4348094, 0.2702694, -0.5442241, 1, 1, 1, 1, 1,
-0.4321351, -0.5329142, -0.7544213, 1, 1, 1, 1, 1,
-0.4292616, -0.5310082, -1.888132, 1, 1, 1, 1, 1,
-0.4267478, -0.8740034, -4.084191, 1, 1, 1, 1, 1,
-0.4210532, 0.8053671, 1.230356, 1, 1, 1, 1, 1,
-0.4194376, -1.082044, -2.992877, 1, 1, 1, 1, 1,
-0.4184199, -1.362813, -2.687128, 1, 1, 1, 1, 1,
-0.4172716, -0.2045864, -3.086723, 1, 1, 1, 1, 1,
-0.4093617, -0.9965072, -2.871568, 1, 1, 1, 1, 1,
-0.4056798, 0.6959828, 0.9718937, 1, 1, 1, 1, 1,
-0.4037795, 0.9231299, -0.3699417, 1, 1, 1, 1, 1,
-0.4005954, 0.4519926, -2.22838, 1, 1, 1, 1, 1,
-0.397606, -1.56197, -2.389758, 1, 1, 1, 1, 1,
-0.3940773, 0.02542595, -1.718586, 1, 1, 1, 1, 1,
-0.3914178, -0.527382, -4.067752, 0, 0, 1, 1, 1,
-0.3881636, 0.8802802, -2.752772, 1, 0, 0, 1, 1,
-0.3824324, 1.106635, -1.285521, 1, 0, 0, 1, 1,
-0.3796321, -0.7305246, -2.688806, 1, 0, 0, 1, 1,
-0.3794566, -0.6665639, -3.557854, 1, 0, 0, 1, 1,
-0.374217, -1.483806, -3.009138, 1, 0, 0, 1, 1,
-0.3737108, -0.3202877, -1.719828, 0, 0, 0, 1, 1,
-0.3731128, -2.175954, -3.618136, 0, 0, 0, 1, 1,
-0.3696389, -1.625454, -3.683692, 0, 0, 0, 1, 1,
-0.3678652, 0.8499572, -0.1203355, 0, 0, 0, 1, 1,
-0.3676716, -1.339595, -2.343278, 0, 0, 0, 1, 1,
-0.3614083, -1.023221, -2.156777, 0, 0, 0, 1, 1,
-0.3614008, 0.4918289, -1.723632, 0, 0, 0, 1, 1,
-0.3572453, -1.346684, -2.448628, 1, 1, 1, 1, 1,
-0.3567947, 0.9034967, 0.7019004, 1, 1, 1, 1, 1,
-0.355364, -1.666841, -3.516696, 1, 1, 1, 1, 1,
-0.3515702, 0.9198136, 0.4227084, 1, 1, 1, 1, 1,
-0.3504491, 0.2944428, 0.8745617, 1, 1, 1, 1, 1,
-0.3452779, -0.6859806, -4.086547, 1, 1, 1, 1, 1,
-0.344641, 0.5814576, -1.160698, 1, 1, 1, 1, 1,
-0.342652, 0.03742889, -0.9813434, 1, 1, 1, 1, 1,
-0.340309, -2.109756, -2.133383, 1, 1, 1, 1, 1,
-0.3390847, -1.609389, -2.915887, 1, 1, 1, 1, 1,
-0.3366175, -1.593043, -3.831068, 1, 1, 1, 1, 1,
-0.3362752, -0.2186209, -4.205726, 1, 1, 1, 1, 1,
-0.330985, 0.2481223, -1.755277, 1, 1, 1, 1, 1,
-0.328156, -0.1919523, -1.693357, 1, 1, 1, 1, 1,
-0.3280107, 1.210104, -1.507294, 1, 1, 1, 1, 1,
-0.3272282, 0.3214017, 0.3200067, 0, 0, 1, 1, 1,
-0.3233279, -0.0826022, -2.09233, 1, 0, 0, 1, 1,
-0.3192906, 0.2100398, -0.5806878, 1, 0, 0, 1, 1,
-0.3176463, -0.4763699, -5.253703, 1, 0, 0, 1, 1,
-0.3156259, 0.4801335, -1.600138, 1, 0, 0, 1, 1,
-0.3134748, 2.01737, 1.349893, 1, 0, 0, 1, 1,
-0.3082198, -0.4755413, -4.349849, 0, 0, 0, 1, 1,
-0.3079059, 0.09979997, -1.646266, 0, 0, 0, 1, 1,
-0.3014772, 0.540602, -0.04483012, 0, 0, 0, 1, 1,
-0.2999849, -0.04611386, -1.074016, 0, 0, 0, 1, 1,
-0.2936145, 1.433478, 0.3554977, 0, 0, 0, 1, 1,
-0.2910685, -0.7308106, -1.54282, 0, 0, 0, 1, 1,
-0.289176, 1.865774, -0.4959011, 0, 0, 0, 1, 1,
-0.2875848, -0.2798964, -1.182957, 1, 1, 1, 1, 1,
-0.2863546, -0.3975702, -2.238753, 1, 1, 1, 1, 1,
-0.2851793, 0.4227999, -1.120417, 1, 1, 1, 1, 1,
-0.2844515, 0.6719412, 1.638922, 1, 1, 1, 1, 1,
-0.2738553, -0.2915842, -2.377621, 1, 1, 1, 1, 1,
-0.273744, 0.3326748, 0.7830108, 1, 1, 1, 1, 1,
-0.2649899, -0.07696749, -1.510293, 1, 1, 1, 1, 1,
-0.2614352, 0.9389473, 0.4838592, 1, 1, 1, 1, 1,
-0.2562405, -0.9329346, -2.782248, 1, 1, 1, 1, 1,
-0.2553347, -0.03351957, -1.159283, 1, 1, 1, 1, 1,
-0.2489648, 0.2072143, -2.304273, 1, 1, 1, 1, 1,
-0.2484445, -0.5082616, -4.215016, 1, 1, 1, 1, 1,
-0.2406009, -1.375611, -1.745958, 1, 1, 1, 1, 1,
-0.2381544, 0.0499468, -1.737949, 1, 1, 1, 1, 1,
-0.2379285, -0.6382991, -2.576437, 1, 1, 1, 1, 1,
-0.2364643, -0.8216585, -4.289721, 0, 0, 1, 1, 1,
-0.232066, -1.546596, -2.451595, 1, 0, 0, 1, 1,
-0.228442, -0.07322204, -0.4390751, 1, 0, 0, 1, 1,
-0.2276899, 1.366518, 0.6998473, 1, 0, 0, 1, 1,
-0.2235858, 1.673066, 0.5057142, 1, 0, 0, 1, 1,
-0.220346, 1.274687, 0.7022962, 1, 0, 0, 1, 1,
-0.2184964, -0.05382152, -1.51972, 0, 0, 0, 1, 1,
-0.2169098, 0.3001436, -0.2787218, 0, 0, 0, 1, 1,
-0.2157836, 0.1566749, -0.2172154, 0, 0, 0, 1, 1,
-0.2109208, -0.3834493, -3.098546, 0, 0, 0, 1, 1,
-0.2105122, -0.3274596, -1.131138, 0, 0, 0, 1, 1,
-0.2100124, -0.2717735, -2.557515, 0, 0, 0, 1, 1,
-0.2081897, 0.2814089, -1.546243, 0, 0, 0, 1, 1,
-0.2079148, -0.7028593, -3.096915, 1, 1, 1, 1, 1,
-0.2053399, 0.9393704, 0.6585701, 1, 1, 1, 1, 1,
-0.2027685, 0.04234618, -1.365496, 1, 1, 1, 1, 1,
-0.2001817, 1.564728, -2.434668, 1, 1, 1, 1, 1,
-0.1978794, -1.978245, -3.867437, 1, 1, 1, 1, 1,
-0.1951152, 1.283316, 0.5958239, 1, 1, 1, 1, 1,
-0.1919715, -0.04110203, -2.775681, 1, 1, 1, 1, 1,
-0.1901196, 0.4487074, -0.2657005, 1, 1, 1, 1, 1,
-0.1899318, -1.360915, -3.563777, 1, 1, 1, 1, 1,
-0.1834339, -1.060199, -4.118964, 1, 1, 1, 1, 1,
-0.1750029, -0.2859105, -2.188447, 1, 1, 1, 1, 1,
-0.1681119, -1.04485, -3.320835, 1, 1, 1, 1, 1,
-0.1680321, 0.2773504, -0.2550192, 1, 1, 1, 1, 1,
-0.166572, 2.164796, 3.822401, 1, 1, 1, 1, 1,
-0.165602, -0.4132917, -3.49943, 1, 1, 1, 1, 1,
-0.1645141, 0.5906872, -0.7785665, 0, 0, 1, 1, 1,
-0.1587579, 1.015307, -1.358565, 1, 0, 0, 1, 1,
-0.1510837, -0.7953082, -5.13856, 1, 0, 0, 1, 1,
-0.1496778, 1.599095, 0.7313903, 1, 0, 0, 1, 1,
-0.1461131, 2.002761, -0.5815198, 1, 0, 0, 1, 1,
-0.142544, -1.687105, -3.722593, 1, 0, 0, 1, 1,
-0.1369263, -0.5534213, -3.152412, 0, 0, 0, 1, 1,
-0.1348138, -0.4496595, -4.095029, 0, 0, 0, 1, 1,
-0.1345897, -1.268962, -2.840051, 0, 0, 0, 1, 1,
-0.1334152, 0.6506076, 0.9454772, 0, 0, 0, 1, 1,
-0.1321801, 0.6461827, -0.9117981, 0, 0, 0, 1, 1,
-0.1296494, 0.1525319, -2.858574, 0, 0, 0, 1, 1,
-0.1236923, 0.5405828, 0.9824905, 0, 0, 0, 1, 1,
-0.1203389, -0.7034798, -1.899121, 1, 1, 1, 1, 1,
-0.1147666, 0.8676556, -1.763228, 1, 1, 1, 1, 1,
-0.1125295, 0.8340564, 0.8711179, 1, 1, 1, 1, 1,
-0.1093373, -0.2508917, -3.836441, 1, 1, 1, 1, 1,
-0.1074086, -0.641255, -2.986464, 1, 1, 1, 1, 1,
-0.1067474, -1.471874, -2.109629, 1, 1, 1, 1, 1,
-0.1030326, 0.6910791, 1.415878, 1, 1, 1, 1, 1,
-0.1017083, 1.311232, -0.2838904, 1, 1, 1, 1, 1,
-0.1016279, -0.09927949, -2.183376, 1, 1, 1, 1, 1,
-0.09500542, -0.2161985, -2.342579, 1, 1, 1, 1, 1,
-0.09348249, 0.01030584, -2.426758, 1, 1, 1, 1, 1,
-0.09301908, -1.287326, -3.092283, 1, 1, 1, 1, 1,
-0.08696607, -1.358467, -3.078494, 1, 1, 1, 1, 1,
-0.08585257, -0.4130925, -1.773394, 1, 1, 1, 1, 1,
-0.08279219, -1.538558, -1.051212, 1, 1, 1, 1, 1,
-0.08081152, 0.161625, -3.261089, 0, 0, 1, 1, 1,
-0.07787815, -0.8299293, -2.855637, 1, 0, 0, 1, 1,
-0.07336584, -0.1941889, -2.101995, 1, 0, 0, 1, 1,
-0.07065881, -0.4719897, -4.671922, 1, 0, 0, 1, 1,
-0.06862333, -0.3401014, -2.552676, 1, 0, 0, 1, 1,
-0.06202509, -0.00764138, -1.905209, 1, 0, 0, 1, 1,
-0.06124477, 0.4087979, -0.01351624, 0, 0, 0, 1, 1,
-0.05898054, 1.346521, -0.4190634, 0, 0, 0, 1, 1,
-0.05644766, 0.9314416, 0.04894738, 0, 0, 0, 1, 1,
-0.05617252, 0.3914522, 0.000136959, 0, 0, 0, 1, 1,
-0.05431261, -0.6768086, -3.875517, 0, 0, 0, 1, 1,
-0.05211216, 0.8920033, 1.145803, 0, 0, 0, 1, 1,
-0.04570045, 1.33947, 0.8056615, 0, 0, 0, 1, 1,
-0.04507569, 0.7658362, -0.1154425, 1, 1, 1, 1, 1,
-0.04011117, -0.463041, -2.920069, 1, 1, 1, 1, 1,
-0.03945255, 0.9021595, 0.6942587, 1, 1, 1, 1, 1,
-0.03882218, 1.819587, 2.02714, 1, 1, 1, 1, 1,
-0.03644115, -1.375589, -1.652384, 1, 1, 1, 1, 1,
-0.03520281, -0.2483043, -3.679045, 1, 1, 1, 1, 1,
-0.02545585, 0.6163863, -0.2511159, 1, 1, 1, 1, 1,
-0.02013451, 0.2407495, 0.9698828, 1, 1, 1, 1, 1,
-0.01812619, 0.79398, -0.4867587, 1, 1, 1, 1, 1,
-0.0176315, 0.421505, 0.6492584, 1, 1, 1, 1, 1,
-0.01714187, 0.4797539, -1.162493, 1, 1, 1, 1, 1,
-0.01142974, 1.821125, 0.2468653, 1, 1, 1, 1, 1,
-0.008946307, 0.6907912, 1.968369, 1, 1, 1, 1, 1,
-0.004716246, -0.3823138, -4.728142, 1, 1, 1, 1, 1,
0.0006608543, -0.1513884, 4.277219, 1, 1, 1, 1, 1,
0.002081078, -1.283892, 5.771367, 0, 0, 1, 1, 1,
0.003508036, -0.9145592, 2.977282, 1, 0, 0, 1, 1,
0.008847429, 0.8887122, 0.02473592, 1, 0, 0, 1, 1,
0.009435562, -0.2985931, 4.474878, 1, 0, 0, 1, 1,
0.02021496, 1.897157, 1.377308, 1, 0, 0, 1, 1,
0.02105869, -0.2743304, 2.397046, 1, 0, 0, 1, 1,
0.02541678, -0.8218406, 2.088619, 0, 0, 0, 1, 1,
0.02793226, 1.274391, 1.090231, 0, 0, 0, 1, 1,
0.02816579, 1.728412, 1.906888, 0, 0, 0, 1, 1,
0.03169343, 0.2029146, -0.3465752, 0, 0, 0, 1, 1,
0.03318136, 1.138775, 1.331675, 0, 0, 0, 1, 1,
0.03489313, 1.107687, -1.995816, 0, 0, 0, 1, 1,
0.03579009, 0.5517972, 0.6627557, 0, 0, 0, 1, 1,
0.03680335, -1.3812, 4.204887, 1, 1, 1, 1, 1,
0.03821242, 1.694369, 1.444408, 1, 1, 1, 1, 1,
0.03990452, 0.3578506, 0.1144557, 1, 1, 1, 1, 1,
0.04332471, -0.3499533, 4.045624, 1, 1, 1, 1, 1,
0.04361386, -0.8886236, 2.760635, 1, 1, 1, 1, 1,
0.05445046, 2.944325, 0.6777162, 1, 1, 1, 1, 1,
0.05477923, -0.8332375, 2.485272, 1, 1, 1, 1, 1,
0.05795695, -2.091653, 2.715562, 1, 1, 1, 1, 1,
0.06277489, -0.4241233, 1.295537, 1, 1, 1, 1, 1,
0.07679779, 1.138058, -0.9005593, 1, 1, 1, 1, 1,
0.07682534, -0.1998973, 4.232088, 1, 1, 1, 1, 1,
0.08128314, -1.060547, 2.347254, 1, 1, 1, 1, 1,
0.08181433, -0.9047415, 3.199404, 1, 1, 1, 1, 1,
0.08310694, -1.20514, 3.474914, 1, 1, 1, 1, 1,
0.08372458, 1.460422, -1.025734, 1, 1, 1, 1, 1,
0.08584072, 0.0946739, 1.824612, 0, 0, 1, 1, 1,
0.0872444, -0.9419194, 2.996715, 1, 0, 0, 1, 1,
0.09074954, 1.830757, 0.864993, 1, 0, 0, 1, 1,
0.09145002, -0.6233585, 4.214108, 1, 0, 0, 1, 1,
0.09403675, 0.1556028, 0.2576569, 1, 0, 0, 1, 1,
0.09459286, -0.06675988, 0.9634927, 1, 0, 0, 1, 1,
0.09540988, -1.207324, 2.372381, 0, 0, 0, 1, 1,
0.09600926, -0.7045092, 1.889116, 0, 0, 0, 1, 1,
0.09606665, 0.5776098, 0.1728756, 0, 0, 0, 1, 1,
0.09926318, 0.8727083, 0.6999954, 0, 0, 0, 1, 1,
0.1033819, 0.1368116, 0.6036735, 0, 0, 0, 1, 1,
0.1058481, 0.5893499, 1.750454, 0, 0, 0, 1, 1,
0.1079111, 1.721741, -1.43947, 0, 0, 0, 1, 1,
0.1102399, 1.348115, -2.071352, 1, 1, 1, 1, 1,
0.1103956, 0.7282642, 1.340761, 1, 1, 1, 1, 1,
0.113486, 1.200802, 0.6957485, 1, 1, 1, 1, 1,
0.1159913, -0.2476785, 1.630066, 1, 1, 1, 1, 1,
0.1176062, -0.48806, 3.959261, 1, 1, 1, 1, 1,
0.1204667, 1.547183, 0.2056933, 1, 1, 1, 1, 1,
0.1242275, 0.9225369, -1.281527, 1, 1, 1, 1, 1,
0.1245196, -0.4409186, 2.122096, 1, 1, 1, 1, 1,
0.1259477, -1.813625, 2.740976, 1, 1, 1, 1, 1,
0.1336251, 0.652776, -0.3534765, 1, 1, 1, 1, 1,
0.1349259, -0.8308171, 3.127408, 1, 1, 1, 1, 1,
0.1368197, 0.2972854, 0.7593606, 1, 1, 1, 1, 1,
0.1377938, -0.3937138, 4.306882, 1, 1, 1, 1, 1,
0.1406058, -1.818654, 2.379704, 1, 1, 1, 1, 1,
0.1424434, 0.4540091, -0.06219339, 1, 1, 1, 1, 1,
0.1500798, -0.03347734, 2.199558, 0, 0, 1, 1, 1,
0.1511702, 0.3858525, 0.3593479, 1, 0, 0, 1, 1,
0.1516988, 0.6678488, 0.9310526, 1, 0, 0, 1, 1,
0.1527745, 0.2629595, -0.2592348, 1, 0, 0, 1, 1,
0.1533778, -1.663546, 3.784735, 1, 0, 0, 1, 1,
0.1543919, 0.5061195, 1.42809, 1, 0, 0, 1, 1,
0.1544266, 1.969865, 0.8846806, 0, 0, 0, 1, 1,
0.1544312, -0.1568412, 2.560965, 0, 0, 0, 1, 1,
0.1563402, -0.09911464, 2.692018, 0, 0, 0, 1, 1,
0.1585971, -0.679559, 4.094548, 0, 0, 0, 1, 1,
0.159242, 0.3282585, 0.9023676, 0, 0, 0, 1, 1,
0.1611554, 1.179336, 0.1869543, 0, 0, 0, 1, 1,
0.1653994, -1.051981, 3.753565, 0, 0, 0, 1, 1,
0.1665193, 0.3672945, 1.113538, 1, 1, 1, 1, 1,
0.1673781, -0.8188089, 3.007716, 1, 1, 1, 1, 1,
0.1728031, 1.719287, 0.8239229, 1, 1, 1, 1, 1,
0.1752452, 0.04621905, 1.55128, 1, 1, 1, 1, 1,
0.1778055, -2.511348, 3.924808, 1, 1, 1, 1, 1,
0.1835409, 0.9102099, 0.3408459, 1, 1, 1, 1, 1,
0.1927367, -0.05941728, 0.08213857, 1, 1, 1, 1, 1,
0.1932575, -0.480995, 1.857858, 1, 1, 1, 1, 1,
0.1937055, 0.06890929, 1.553309, 1, 1, 1, 1, 1,
0.1948197, 0.4654304, -0.2861257, 1, 1, 1, 1, 1,
0.1955346, 1.265705, -0.6220515, 1, 1, 1, 1, 1,
0.1957927, 1.030436, -0.6171319, 1, 1, 1, 1, 1,
0.1971034, -2.48084, 2.983067, 1, 1, 1, 1, 1,
0.2035729, -1.65596, 2.353637, 1, 1, 1, 1, 1,
0.2041126, 0.7666628, 1.174094, 1, 1, 1, 1, 1,
0.2061791, 0.2602256, 1.976077, 0, 0, 1, 1, 1,
0.207782, 2.089403, -0.5591794, 1, 0, 0, 1, 1,
0.2080775, -0.5301114, 3.32891, 1, 0, 0, 1, 1,
0.2123659, -1.887455, 1.863882, 1, 0, 0, 1, 1,
0.2175104, 0.5785489, -0.01998072, 1, 0, 0, 1, 1,
0.2240777, 0.6848819, 1.396676, 1, 0, 0, 1, 1,
0.2292819, -0.9228142, 2.314693, 0, 0, 0, 1, 1,
0.2320753, -0.2531978, -0.02756277, 0, 0, 0, 1, 1,
0.2344653, 0.3082402, 0.8342611, 0, 0, 0, 1, 1,
0.2349246, 1.449196, -0.44941, 0, 0, 0, 1, 1,
0.2389085, -0.9813863, 2.653749, 0, 0, 0, 1, 1,
0.2454487, 0.3153744, 0.205105, 0, 0, 0, 1, 1,
0.2455932, 0.6399306, -0.774935, 0, 0, 0, 1, 1,
0.2477595, -0.8777874, 3.363174, 1, 1, 1, 1, 1,
0.2552817, 0.7286636, 1.77784, 1, 1, 1, 1, 1,
0.2590965, -1.542871, 3.717501, 1, 1, 1, 1, 1,
0.2594761, 0.1140205, 1.187859, 1, 1, 1, 1, 1,
0.2627405, -1.5044, 3.152043, 1, 1, 1, 1, 1,
0.2649092, -0.08865951, 2.23295, 1, 1, 1, 1, 1,
0.2654517, -0.04606662, 0.2968927, 1, 1, 1, 1, 1,
0.270711, 0.4260559, -0.5978249, 1, 1, 1, 1, 1,
0.2710504, 1.222119, -0.1495718, 1, 1, 1, 1, 1,
0.2762529, 0.5852977, 1.112017, 1, 1, 1, 1, 1,
0.2778021, -0.6975306, 3.562775, 1, 1, 1, 1, 1,
0.2833518, 0.1662529, 1.362504, 1, 1, 1, 1, 1,
0.2862065, 0.592283, 0.5277433, 1, 1, 1, 1, 1,
0.2902397, 2.545664, 1.742259, 1, 1, 1, 1, 1,
0.2905406, -1.293949, 3.819375, 1, 1, 1, 1, 1,
0.2919262, -0.190713, 2.35077, 0, 0, 1, 1, 1,
0.294358, -1.707618, 1.924328, 1, 0, 0, 1, 1,
0.2997973, 1.085738, 1.339226, 1, 0, 0, 1, 1,
0.3006546, -0.3106841, 2.952758, 1, 0, 0, 1, 1,
0.3092887, -0.8866109, 3.365134, 1, 0, 0, 1, 1,
0.3114821, 0.4873006, 2.709044, 1, 0, 0, 1, 1,
0.3125082, -0.09023956, 3.007683, 0, 0, 0, 1, 1,
0.3131295, 1.055713, -0.95431, 0, 0, 0, 1, 1,
0.3156447, -0.3680511, 2.65734, 0, 0, 0, 1, 1,
0.3158129, 0.09605706, 0.8455235, 0, 0, 0, 1, 1,
0.3162307, 2.276923, 1.368239, 0, 0, 0, 1, 1,
0.3162656, -0.8816833, 4.022928, 0, 0, 0, 1, 1,
0.3207579, -0.1671026, 2.096348, 0, 0, 0, 1, 1,
0.3222367, -0.4309533, 3.072778, 1, 1, 1, 1, 1,
0.3235305, -0.3818862, 3.653441, 1, 1, 1, 1, 1,
0.3273931, 0.5721574, 0.8018834, 1, 1, 1, 1, 1,
0.3298829, -1.287586, 1.637401, 1, 1, 1, 1, 1,
0.330339, 0.4143504, 0.5531603, 1, 1, 1, 1, 1,
0.3377788, 0.2439319, 1.427962, 1, 1, 1, 1, 1,
0.3410958, -0.9981327, 2.43626, 1, 1, 1, 1, 1,
0.3427005, 0.7555569, 1.875478, 1, 1, 1, 1, 1,
0.3449137, 0.7467077, 1.090789, 1, 1, 1, 1, 1,
0.3498474, -0.7211838, 2.723866, 1, 1, 1, 1, 1,
0.3499774, 0.4736979, 2.412263, 1, 1, 1, 1, 1,
0.3502754, -0.6095748, 1.692021, 1, 1, 1, 1, 1,
0.353975, 1.058782, 1.043396, 1, 1, 1, 1, 1,
0.3545576, 0.9497045, 0.7982767, 1, 1, 1, 1, 1,
0.356156, 1.588672, 0.6315971, 1, 1, 1, 1, 1,
0.3572499, 0.8149462, 0.4683397, 0, 0, 1, 1, 1,
0.366695, -1.684979, 3.571689, 1, 0, 0, 1, 1,
0.3668285, 0.03294615, 1.594422, 1, 0, 0, 1, 1,
0.3749725, -0.8178812, 3.493032, 1, 0, 0, 1, 1,
0.3763023, -1.009605, 1.431252, 1, 0, 0, 1, 1,
0.3832229, -0.8150596, 2.241095, 1, 0, 0, 1, 1,
0.3839145, -0.9153591, 3.641254, 0, 0, 0, 1, 1,
0.3851705, -1.358967, 4.042893, 0, 0, 0, 1, 1,
0.38605, -0.6191199, 3.213839, 0, 0, 0, 1, 1,
0.3866171, 1.134468, 0.7225068, 0, 0, 0, 1, 1,
0.3897387, -0.6855339, 1.865329, 0, 0, 0, 1, 1,
0.3947525, -0.9595515, 2.962389, 0, 0, 0, 1, 1,
0.3983368, 0.3128788, 1.1629, 0, 0, 0, 1, 1,
0.4002334, -1.563462, 2.469133, 1, 1, 1, 1, 1,
0.4002715, 0.5939332, 0.6593004, 1, 1, 1, 1, 1,
0.4042764, -0.3259856, 1.596745, 1, 1, 1, 1, 1,
0.4077369, -0.7611746, 1.242652, 1, 1, 1, 1, 1,
0.4143116, -1.173993, 3.565355, 1, 1, 1, 1, 1,
0.4166321, 1.089407, 1.784225, 1, 1, 1, 1, 1,
0.4225523, -0.8088448, 2.381785, 1, 1, 1, 1, 1,
0.4259996, 0.1880062, 1.807933, 1, 1, 1, 1, 1,
0.4294087, -0.2559232, 4.771592, 1, 1, 1, 1, 1,
0.4376996, 0.7380769, 0.2867963, 1, 1, 1, 1, 1,
0.4383073, 0.8586056, -0.4585562, 1, 1, 1, 1, 1,
0.4404084, -0.08328889, 1.976988, 1, 1, 1, 1, 1,
0.4425429, 0.6518551, -1.143633, 1, 1, 1, 1, 1,
0.4487659, 0.7830281, 0.8840411, 1, 1, 1, 1, 1,
0.4515827, -1.402173, 3.259475, 1, 1, 1, 1, 1,
0.4522524, -1.823395, 2.691438, 0, 0, 1, 1, 1,
0.4579938, -0.277745, 1.123321, 1, 0, 0, 1, 1,
0.4608634, 1.470416, 0.2261586, 1, 0, 0, 1, 1,
0.4612926, -0.0101518, 1.978149, 1, 0, 0, 1, 1,
0.4614953, 1.515715, -0.3445791, 1, 0, 0, 1, 1,
0.4699131, 0.4932226, 0.7198133, 1, 0, 0, 1, 1,
0.4816635, 0.125626, 0.7989957, 0, 0, 0, 1, 1,
0.4845318, 2.321581, -3.52017, 0, 0, 0, 1, 1,
0.4868259, -0.3501019, 3.336881, 0, 0, 0, 1, 1,
0.4896292, -0.04236522, 0.9512932, 0, 0, 0, 1, 1,
0.4897034, -0.4208172, 2.255657, 0, 0, 0, 1, 1,
0.4907423, 0.7610508, 2.910748, 0, 0, 0, 1, 1,
0.4918596, 2.158539, 0.2731183, 0, 0, 0, 1, 1,
0.4931331, 0.9942792, -1.355911, 1, 1, 1, 1, 1,
0.4945031, -0.6784079, 3.472204, 1, 1, 1, 1, 1,
0.4947284, 0.7950041, 1.853915, 1, 1, 1, 1, 1,
0.4962174, 0.4689635, -0.4034761, 1, 1, 1, 1, 1,
0.496562, 0.004410876, 0.05112449, 1, 1, 1, 1, 1,
0.4969422, 0.2978832, 1.194476, 1, 1, 1, 1, 1,
0.4977858, -0.5968598, 2.506917, 1, 1, 1, 1, 1,
0.4991372, -0.1421818, 0.8968685, 1, 1, 1, 1, 1,
0.5015146, 0.09775373, 1.029405, 1, 1, 1, 1, 1,
0.5040783, 0.239147, 1.864071, 1, 1, 1, 1, 1,
0.5063992, 0.1197799, 1.007639, 1, 1, 1, 1, 1,
0.5120953, 0.3576515, 1.714259, 1, 1, 1, 1, 1,
0.5133252, 0.9160427, 1.917786, 1, 1, 1, 1, 1,
0.5135235, 0.4449721, 1.711192, 1, 1, 1, 1, 1,
0.515446, -0.3487719, 2.789045, 1, 1, 1, 1, 1,
0.5163611, 0.3890057, 0.146283, 0, 0, 1, 1, 1,
0.5168267, 0.2333373, 1.429161, 1, 0, 0, 1, 1,
0.5190625, -0.133684, 2.102457, 1, 0, 0, 1, 1,
0.5193824, 0.05156795, 3.450882, 1, 0, 0, 1, 1,
0.521964, 0.6644409, -1.413945, 1, 0, 0, 1, 1,
0.5244746, 0.1562971, 2.490443, 1, 0, 0, 1, 1,
0.5258363, -1.204741, 2.853055, 0, 0, 0, 1, 1,
0.5273343, -0.6055257, 1.66407, 0, 0, 0, 1, 1,
0.5274324, 0.1784546, -0.4467644, 0, 0, 0, 1, 1,
0.5335007, -0.5930702, 3.489, 0, 0, 0, 1, 1,
0.5356762, 1.920678, -0.9527108, 0, 0, 0, 1, 1,
0.5371116, -0.3236124, 0.7295167, 0, 0, 0, 1, 1,
0.5383022, 0.1638485, 3.02122, 0, 0, 0, 1, 1,
0.5414677, 0.7744451, 0.4775267, 1, 1, 1, 1, 1,
0.5440767, 1.719782, 1.805972, 1, 1, 1, 1, 1,
0.5494363, -2.459596, 2.325402, 1, 1, 1, 1, 1,
0.5508443, -0.2483664, 3.334803, 1, 1, 1, 1, 1,
0.5537024, 0.8224143, 0.5792394, 1, 1, 1, 1, 1,
0.5605011, 0.5485919, 1.702673, 1, 1, 1, 1, 1,
0.5636271, 0.8012367, 1.120453, 1, 1, 1, 1, 1,
0.5675833, 0.005608241, 0.5079026, 1, 1, 1, 1, 1,
0.5691977, -0.8834885, 3.909711, 1, 1, 1, 1, 1,
0.5731896, 3.407689, -0.048313, 1, 1, 1, 1, 1,
0.5740291, 0.8506432, 0.6862031, 1, 1, 1, 1, 1,
0.5753595, -0.2118147, 0.1048735, 1, 1, 1, 1, 1,
0.5782245, -0.2756837, 2.179172, 1, 1, 1, 1, 1,
0.5791724, 1.817324, -0.5661479, 1, 1, 1, 1, 1,
0.5836202, -0.05456863, 3.076928, 1, 1, 1, 1, 1,
0.5860593, 1.75233, 1.161219, 0, 0, 1, 1, 1,
0.5887329, 1.077665, -0.337515, 1, 0, 0, 1, 1,
0.5901176, -1.281594, 1.453243, 1, 0, 0, 1, 1,
0.5928397, -0.3855985, 2.022916, 1, 0, 0, 1, 1,
0.5983709, -1.159349, 2.63822, 1, 0, 0, 1, 1,
0.6173351, 1.243593, 3.586192, 1, 0, 0, 1, 1,
0.6187148, 2.01056, 0.9110425, 0, 0, 0, 1, 1,
0.6217459, 0.5336859, 1.549476, 0, 0, 0, 1, 1,
0.6295268, 1.264707, -1.726582, 0, 0, 0, 1, 1,
0.6315665, 1.001072, 1.141687, 0, 0, 0, 1, 1,
0.635268, -0.6532463, 3.545488, 0, 0, 0, 1, 1,
0.6355846, 1.195452, 1.566198, 0, 0, 0, 1, 1,
0.6410296, -1.899583, 3.131738, 0, 0, 0, 1, 1,
0.6443572, -0.00376177, 2.795219, 1, 1, 1, 1, 1,
0.6486133, -0.6555036, 3.029518, 1, 1, 1, 1, 1,
0.6498225, -1.547993, 2.091609, 1, 1, 1, 1, 1,
0.6500766, -1.944417, 2.612624, 1, 1, 1, 1, 1,
0.6541188, -1.162014, 2.338488, 1, 1, 1, 1, 1,
0.6564796, 1.506297, -0.008172761, 1, 1, 1, 1, 1,
0.6575612, -0.5128831, 4.075515, 1, 1, 1, 1, 1,
0.6621512, 0.7292323, 0.7309053, 1, 1, 1, 1, 1,
0.6667326, 0.5161008, 1.130518, 1, 1, 1, 1, 1,
0.6671991, 0.1746245, 0.8186285, 1, 1, 1, 1, 1,
0.6676825, -0.9351014, 3.281874, 1, 1, 1, 1, 1,
0.6752847, 0.2890754, 0.3079171, 1, 1, 1, 1, 1,
0.6895912, -0.6579954, 2.485898, 1, 1, 1, 1, 1,
0.68975, 2.222687, -0.08913375, 1, 1, 1, 1, 1,
0.6955195, 0.3208233, 1.850395, 1, 1, 1, 1, 1,
0.6955702, 0.7864662, 0.9290008, 0, 0, 1, 1, 1,
0.6997941, -0.6573284, 4.292032, 1, 0, 0, 1, 1,
0.7005513, 1.123132, -0.1996475, 1, 0, 0, 1, 1,
0.714748, -1.657839, 4.064242, 1, 0, 0, 1, 1,
0.7152563, 0.2499237, 0.3216431, 1, 0, 0, 1, 1,
0.7185535, 0.03160064, 1.289697, 1, 0, 0, 1, 1,
0.72068, 2.164918, 1.157451, 0, 0, 0, 1, 1,
0.7252013, 0.4300869, -0.2803125, 0, 0, 0, 1, 1,
0.7257634, -0.1425249, 2.55524, 0, 0, 0, 1, 1,
0.7317848, 0.485926, -0.12577, 0, 0, 0, 1, 1,
0.7320074, -0.1656628, 0.840076, 0, 0, 0, 1, 1,
0.7383277, 0.02049187, 2.510273, 0, 0, 0, 1, 1,
0.7402889, -1.466297, 2.615035, 0, 0, 0, 1, 1,
0.7408662, 1.760221, -1.162399, 1, 1, 1, 1, 1,
0.7415959, 1.140175, 3.010985, 1, 1, 1, 1, 1,
0.7438526, 0.1526766, 1.737655, 1, 1, 1, 1, 1,
0.7488036, -0.04734084, 0.6968486, 1, 1, 1, 1, 1,
0.7500585, -0.1525605, 2.849214, 1, 1, 1, 1, 1,
0.7506434, -0.1644248, 3.384313, 1, 1, 1, 1, 1,
0.753313, -0.02804165, 1.588672, 1, 1, 1, 1, 1,
0.7540176, -0.001752451, 1.036418, 1, 1, 1, 1, 1,
0.7550536, 1.356875, 0.2951306, 1, 1, 1, 1, 1,
0.7563239, -0.1923731, 2.424342, 1, 1, 1, 1, 1,
0.7595814, 1.513277, 0.9788902, 1, 1, 1, 1, 1,
0.765864, -2.762065, 3.635965, 1, 1, 1, 1, 1,
0.7693461, -0.550938, 1.548658, 1, 1, 1, 1, 1,
0.7740991, 0.688253, 1.362329, 1, 1, 1, 1, 1,
0.7741482, -0.2800969, 1.492032, 1, 1, 1, 1, 1,
0.7776476, -0.1963455, 1.089791, 0, 0, 1, 1, 1,
0.7826645, 0.4378626, 2.283679, 1, 0, 0, 1, 1,
0.7834069, -0.8006085, 1.589493, 1, 0, 0, 1, 1,
0.7849894, -0.2259313, 0.666641, 1, 0, 0, 1, 1,
0.7938632, -0.7389697, 3.570957, 1, 0, 0, 1, 1,
0.7949939, -0.01633935, 0.6792689, 1, 0, 0, 1, 1,
0.7995122, -0.08194452, -0.5274423, 0, 0, 0, 1, 1,
0.7997203, 0.5264635, 0.1849527, 0, 0, 0, 1, 1,
0.8006915, -0.6289374, 2.307066, 0, 0, 0, 1, 1,
0.8014579, 0.4902277, 1.165989, 0, 0, 0, 1, 1,
0.8046086, -1.118833, 1.61941, 0, 0, 0, 1, 1,
0.810952, -0.799492, 1.790388, 0, 0, 0, 1, 1,
0.8116661, 1.340921, -1.499995, 0, 0, 0, 1, 1,
0.8118405, 0.3053027, 1.432494, 1, 1, 1, 1, 1,
0.8123038, 0.1386059, 1.986051, 1, 1, 1, 1, 1,
0.8169687, 0.9642568, 0.08395443, 1, 1, 1, 1, 1,
0.8229909, -0.4744829, -0.3359206, 1, 1, 1, 1, 1,
0.8294384, 0.2274367, 1.357818, 1, 1, 1, 1, 1,
0.8311003, -1.373601, 2.698962, 1, 1, 1, 1, 1,
0.8381132, 0.6613421, 1.026084, 1, 1, 1, 1, 1,
0.8395256, -0.001948386, 0.6240488, 1, 1, 1, 1, 1,
0.8407832, 1.446328, 1.722345, 1, 1, 1, 1, 1,
0.8415871, -1.393766, 3.613806, 1, 1, 1, 1, 1,
0.8416166, 1.551424, 0.4921953, 1, 1, 1, 1, 1,
0.8515541, -0.1217248, -0.5847982, 1, 1, 1, 1, 1,
0.8522065, -0.2568485, 3.403569, 1, 1, 1, 1, 1,
0.85746, 0.3508925, 0.9774268, 1, 1, 1, 1, 1,
0.8636013, 0.1564129, 2.32008, 1, 1, 1, 1, 1,
0.8646537, -0.5356975, 2.565831, 0, 0, 1, 1, 1,
0.8650139, 0.1945695, 1.336266, 1, 0, 0, 1, 1,
0.8697503, -0.3230986, 3.238529, 1, 0, 0, 1, 1,
0.8699121, 0.01699744, -1.116605, 1, 0, 0, 1, 1,
0.8701453, 0.3183202, 2.216146, 1, 0, 0, 1, 1,
0.8736809, 1.285103, -2.359188, 1, 0, 0, 1, 1,
0.8785754, -0.7009415, 3.571203, 0, 0, 0, 1, 1,
0.8816901, 1.215358, 1.412454, 0, 0, 0, 1, 1,
0.8898793, -0.1013231, 2.560385, 0, 0, 0, 1, 1,
0.8986617, -0.1929362, 4.263393, 0, 0, 0, 1, 1,
0.9124256, -1.048746, 2.514909, 0, 0, 0, 1, 1,
0.9125321, 0.9259176, 0.9753888, 0, 0, 0, 1, 1,
0.913201, -0.3833414, 2.116283, 0, 0, 0, 1, 1,
0.9159385, 0.03792242, 2.516713, 1, 1, 1, 1, 1,
0.9241459, 0.9866982, 0.7057475, 1, 1, 1, 1, 1,
0.9280809, -0.04320072, 0.8202444, 1, 1, 1, 1, 1,
0.9343684, 0.418098, 1.035656, 1, 1, 1, 1, 1,
0.9389997, -0.4397923, 2.807221, 1, 1, 1, 1, 1,
0.9394794, 0.08555063, 3.088959, 1, 1, 1, 1, 1,
0.947536, 0.4386812, 1.064969, 1, 1, 1, 1, 1,
0.9552982, 0.01490898, 0.9453973, 1, 1, 1, 1, 1,
0.9605489, 0.2665693, 1.737954, 1, 1, 1, 1, 1,
0.9678572, -0.1831775, 1.679076, 1, 1, 1, 1, 1,
0.9713036, 0.745487, 0.3037806, 1, 1, 1, 1, 1,
0.9720945, 0.486925, -0.3820249, 1, 1, 1, 1, 1,
0.9746365, 1.101942, 2.08108, 1, 1, 1, 1, 1,
0.98254, -0.3962729, 1.798755, 1, 1, 1, 1, 1,
0.9874903, 1.620924, 0.32127, 1, 1, 1, 1, 1,
0.993444, -0.186457, 1.540173, 0, 0, 1, 1, 1,
0.9951652, 0.5906306, 1.576426, 1, 0, 0, 1, 1,
0.9965255, -1.275369, 2.076749, 1, 0, 0, 1, 1,
0.9970881, -1.444774, 3.425077, 1, 0, 0, 1, 1,
1.003714, -0.4146495, 1.913417, 1, 0, 0, 1, 1,
1.003719, 0.3098456, 1.615088, 1, 0, 0, 1, 1,
1.005846, 0.2287813, -0.1705226, 0, 0, 0, 1, 1,
1.013515, -0.2475144, 0.6980139, 0, 0, 0, 1, 1,
1.01498, -2.888015, 1.585581, 0, 0, 0, 1, 1,
1.02632, -1.230836, 2.080779, 0, 0, 0, 1, 1,
1.028408, 0.2927525, 0.6726454, 0, 0, 0, 1, 1,
1.032268, 0.3912546, 0.4009037, 0, 0, 0, 1, 1,
1.03296, 0.1760087, 2.588986, 0, 0, 0, 1, 1,
1.034012, 1.165354, 1.694444, 1, 1, 1, 1, 1,
1.034099, -0.5352502, 2.370672, 1, 1, 1, 1, 1,
1.035619, -0.3116924, 0.9846863, 1, 1, 1, 1, 1,
1.036744, -1.331673, 1.228619, 1, 1, 1, 1, 1,
1.040446, 0.1598545, 1.973956, 1, 1, 1, 1, 1,
1.042804, 0.6359256, 1.911688, 1, 1, 1, 1, 1,
1.048114, -0.523307, 1.681612, 1, 1, 1, 1, 1,
1.053832, 0.5411337, 1.920547, 1, 1, 1, 1, 1,
1.063638, -0.0310472, 1.991843, 1, 1, 1, 1, 1,
1.063994, -1.253389, 0.9759489, 1, 1, 1, 1, 1,
1.068568, -0.7023339, 1.488549, 1, 1, 1, 1, 1,
1.0701, 0.8276415, 2.744188, 1, 1, 1, 1, 1,
1.070939, 0.5214226, 0.915983, 1, 1, 1, 1, 1,
1.072672, 0.7876453, 1.599072, 1, 1, 1, 1, 1,
1.075321, -0.5582863, 3.413418, 1, 1, 1, 1, 1,
1.076541, -0.5584489, 0.1452557, 0, 0, 1, 1, 1,
1.077031, 1.175186, -0.3418889, 1, 0, 0, 1, 1,
1.077399, 1.492685, 1.061987, 1, 0, 0, 1, 1,
1.083282, 1.574654, -0.1895915, 1, 0, 0, 1, 1,
1.091499, -0.336161, 1.824374, 1, 0, 0, 1, 1,
1.096498, 0.5969864, 1.06528, 1, 0, 0, 1, 1,
1.098665, -0.3326247, 1.622667, 0, 0, 0, 1, 1,
1.105045, -1.336526, 2.031899, 0, 0, 0, 1, 1,
1.108016, 1.030431, 0.265383, 0, 0, 0, 1, 1,
1.108375, 1.056151, 0.2579137, 0, 0, 0, 1, 1,
1.108943, -1.311139, 4.185451, 0, 0, 0, 1, 1,
1.110283, -0.09701191, 2.140112, 0, 0, 0, 1, 1,
1.117475, 1.997381, 0.2242621, 0, 0, 0, 1, 1,
1.118978, 0.7245615, 0.9230172, 1, 1, 1, 1, 1,
1.119004, -0.9474788, 3.342723, 1, 1, 1, 1, 1,
1.125278, 1.927345, 0.9346894, 1, 1, 1, 1, 1,
1.126502, 0.2121964, 1.526251, 1, 1, 1, 1, 1,
1.132619, -0.2214566, 2.317145, 1, 1, 1, 1, 1,
1.137945, -1.439922, 3.645521, 1, 1, 1, 1, 1,
1.144384, 0.5230894, 0.8469067, 1, 1, 1, 1, 1,
1.144398, -0.4288503, 3.032321, 1, 1, 1, 1, 1,
1.14954, -0.1843645, 1.505643, 1, 1, 1, 1, 1,
1.155146, 0.1974909, 1.463044, 1, 1, 1, 1, 1,
1.157204, 0.7091216, 1.830981, 1, 1, 1, 1, 1,
1.161943, -1.322139, 1.442771, 1, 1, 1, 1, 1,
1.16304, -0.0970831, 1.151569, 1, 1, 1, 1, 1,
1.163664, -0.2958832, 3.973094, 1, 1, 1, 1, 1,
1.164566, -0.02743826, 3.226598, 1, 1, 1, 1, 1,
1.164693, 0.5436197, 1.906753, 0, 0, 1, 1, 1,
1.171803, -0.4192838, -0.2258362, 1, 0, 0, 1, 1,
1.180806, 1.773741, 1.423248, 1, 0, 0, 1, 1,
1.183387, 0.5108737, 1.340006, 1, 0, 0, 1, 1,
1.19293, 1.883128, 2.253664, 1, 0, 0, 1, 1,
1.205635, -0.7763832, 1.309663, 1, 0, 0, 1, 1,
1.212095, 0.1687967, 3.057137, 0, 0, 0, 1, 1,
1.213697, -0.1307915, 2.0933, 0, 0, 0, 1, 1,
1.22102, 0.2698536, 2.198518, 0, 0, 0, 1, 1,
1.224991, 1.900914, 0.5042815, 0, 0, 0, 1, 1,
1.229216, -0.3565089, 1.412877, 0, 0, 0, 1, 1,
1.245373, -0.84196, 3.662147, 0, 0, 0, 1, 1,
1.249324, 1.617114, 1.170774, 0, 0, 0, 1, 1,
1.252018, -0.05779648, 0.9836609, 1, 1, 1, 1, 1,
1.255307, 0.6463557, 0.786719, 1, 1, 1, 1, 1,
1.263813, 1.277261, 2.326591, 1, 1, 1, 1, 1,
1.274492, 2.357976, -0.01406617, 1, 1, 1, 1, 1,
1.282626, -2.120708, 2.373868, 1, 1, 1, 1, 1,
1.283652, -1.85327, 2.078838, 1, 1, 1, 1, 1,
1.284474, -0.6714311, 1.364722, 1, 1, 1, 1, 1,
1.294994, -0.6082043, 1.144719, 1, 1, 1, 1, 1,
1.295226, -0.4278143, 3.271326, 1, 1, 1, 1, 1,
1.299966, 0.2543747, 1.99534, 1, 1, 1, 1, 1,
1.306104, -0.8095272, 2.13011, 1, 1, 1, 1, 1,
1.308225, 1.757218, 0.7589415, 1, 1, 1, 1, 1,
1.308568, -0.9265648, 3.485038, 1, 1, 1, 1, 1,
1.322747, -0.4459234, 1.06358, 1, 1, 1, 1, 1,
1.326921, 0.9493709, -2.645566, 1, 1, 1, 1, 1,
1.330321, -1.25282, 3.574883, 0, 0, 1, 1, 1,
1.337285, -0.03197219, 3.760088, 1, 0, 0, 1, 1,
1.351421, -0.5667176, 1.912122, 1, 0, 0, 1, 1,
1.354395, -1.208168, 2.1179, 1, 0, 0, 1, 1,
1.362332, 0.1552198, -0.277121, 1, 0, 0, 1, 1,
1.371548, 0.8905913, 1.367408, 1, 0, 0, 1, 1,
1.376656, 0.1394962, 1.147155, 0, 0, 0, 1, 1,
1.378152, 1.165161, 0.4986797, 0, 0, 0, 1, 1,
1.378162, 0.2359769, 0.81038, 0, 0, 0, 1, 1,
1.38003, 0.5232815, 1.958681, 0, 0, 0, 1, 1,
1.385884, 0.1781421, 1.046654, 0, 0, 0, 1, 1,
1.390998, -0.1756532, 1.05598, 0, 0, 0, 1, 1,
1.392901, -0.09283634, -0.7734283, 0, 0, 0, 1, 1,
1.41413, 0.05123709, 0.487317, 1, 1, 1, 1, 1,
1.431185, 1.884763, 0.1672899, 1, 1, 1, 1, 1,
1.431605, -0.08904068, 2.537187, 1, 1, 1, 1, 1,
1.435234, 1.096176, -1.385169, 1, 1, 1, 1, 1,
1.439647, 1.150322, 0.9219676, 1, 1, 1, 1, 1,
1.459484, -0.5180708, 2.374762, 1, 1, 1, 1, 1,
1.46066, 0.5836687, 2.221543, 1, 1, 1, 1, 1,
1.463004, 2.024014, 1.616804, 1, 1, 1, 1, 1,
1.4671, -0.4869929, 2.127977, 1, 1, 1, 1, 1,
1.469065, -0.1409379, 1.890534, 1, 1, 1, 1, 1,
1.476557, 0.07602865, 0.6007105, 1, 1, 1, 1, 1,
1.479984, -0.8967496, 2.979819, 1, 1, 1, 1, 1,
1.482273, 2.370398, 1.656756, 1, 1, 1, 1, 1,
1.485719, 0.02554712, 2.627711, 1, 1, 1, 1, 1,
1.504214, 0.09926643, 2.515089, 1, 1, 1, 1, 1,
1.510766, -0.6564813, 2.055617, 0, 0, 1, 1, 1,
1.513971, 0.6925622, 0.534133, 1, 0, 0, 1, 1,
1.527003, -0.1869814, 0.9642225, 1, 0, 0, 1, 1,
1.532673, -1.020045, 2.178197, 1, 0, 0, 1, 1,
1.550397, 0.2128289, 1.950344, 1, 0, 0, 1, 1,
1.551316, 1.330477, -0.5815154, 1, 0, 0, 1, 1,
1.556718, 1.105399, 1.498788, 0, 0, 0, 1, 1,
1.564013, -0.4048473, 0.9387929, 0, 0, 0, 1, 1,
1.564501, 1.604576, 1.866946, 0, 0, 0, 1, 1,
1.566917, -0.1045608, 3.416897, 0, 0, 0, 1, 1,
1.579371, 0.7482383, 1.090348, 0, 0, 0, 1, 1,
1.583762, 0.08566289, 1.774505, 0, 0, 0, 1, 1,
1.594424, -0.3516746, 1.375552, 0, 0, 0, 1, 1,
1.612502, -1.316281, 3.39062, 1, 1, 1, 1, 1,
1.614945, 1.101121, 0.4968623, 1, 1, 1, 1, 1,
1.642133, -0.16202, -0.05815034, 1, 1, 1, 1, 1,
1.649044, 1.729413, 1.20212, 1, 1, 1, 1, 1,
1.652525, 0.1365409, 1.544892, 1, 1, 1, 1, 1,
1.669679, -0.03352561, 2.26481, 1, 1, 1, 1, 1,
1.683196, 0.3580279, 2.391598, 1, 1, 1, 1, 1,
1.70833, 0.5345975, 1.479186, 1, 1, 1, 1, 1,
1.70856, 0.5397013, 1.102786, 1, 1, 1, 1, 1,
1.715378, 0.351041, 2.000421, 1, 1, 1, 1, 1,
1.726801, 1.463702, 1.374352, 1, 1, 1, 1, 1,
1.731265, 0.5410956, 2.050743, 1, 1, 1, 1, 1,
1.73683, 0.8175189, 0.6413206, 1, 1, 1, 1, 1,
1.743646, -1.572742, 3.397686, 1, 1, 1, 1, 1,
1.753923, 0.2606604, 2.892125, 1, 1, 1, 1, 1,
1.754544, 0.2059311, 0.8215753, 0, 0, 1, 1, 1,
1.766042, 0.8144902, 0.699588, 1, 0, 0, 1, 1,
1.772665, 0.2054326, 2.55489, 1, 0, 0, 1, 1,
1.774512, -1.956555, 1.780976, 1, 0, 0, 1, 1,
1.800329, -1.141229, 2.928387, 1, 0, 0, 1, 1,
1.82038, -0.2579394, 1.427346, 1, 0, 0, 1, 1,
1.848226, -1.347238, -0.4295762, 0, 0, 0, 1, 1,
1.865807, 0.6784863, 2.313868, 0, 0, 0, 1, 1,
1.883882, 0.2678535, 2.628076, 0, 0, 0, 1, 1,
1.888211, 0.7428156, 1.752425, 0, 0, 0, 1, 1,
1.891573, -0.7644817, 0.8130521, 0, 0, 0, 1, 1,
1.891708, -0.09244646, 0.3032628, 0, 0, 0, 1, 1,
1.899808, 0.2928001, 1.23614, 0, 0, 0, 1, 1,
1.921906, -0.2282917, -0.2194055, 1, 1, 1, 1, 1,
1.923686, 0.3834233, 1.211125, 1, 1, 1, 1, 1,
1.935035, 0.9912222, 0.5276367, 1, 1, 1, 1, 1,
1.940806, -1.641009, 3.089846, 1, 1, 1, 1, 1,
1.951342, 1.895248, 1.36751, 1, 1, 1, 1, 1,
1.987048, -0.4708559, 0.4854872, 1, 1, 1, 1, 1,
1.994074, -0.5804417, 2.448753, 1, 1, 1, 1, 1,
2.031857, -1.4397, 3.591441, 1, 1, 1, 1, 1,
2.038713, 1.519009, 0.9301945, 1, 1, 1, 1, 1,
2.046409, 0.3755671, 3.344288, 1, 1, 1, 1, 1,
2.048788, -0.679826, 3.582339, 1, 1, 1, 1, 1,
2.055408, 0.7974523, 2.583595, 1, 1, 1, 1, 1,
2.11036, -0.4876417, 1.331862, 1, 1, 1, 1, 1,
2.171158, 0.7576123, 1.899461, 1, 1, 1, 1, 1,
2.200133, 0.7871586, 1.749641, 1, 1, 1, 1, 1,
2.212965, 0.1114792, 1.158608, 0, 0, 1, 1, 1,
2.234416, 0.2252651, 2.813941, 1, 0, 0, 1, 1,
2.244544, 0.9096536, 2.641398, 1, 0, 0, 1, 1,
2.255018, 0.003575157, 2.362278, 1, 0, 0, 1, 1,
2.290801, -0.4608056, 0.5449867, 1, 0, 0, 1, 1,
2.334631, -1.135648, 2.376948, 1, 0, 0, 1, 1,
2.357041, -2.143463, 2.200936, 0, 0, 0, 1, 1,
2.446903, -0.4223011, 1.610265, 0, 0, 0, 1, 1,
2.484414, 0.7436953, 1.068756, 0, 0, 0, 1, 1,
2.616968, 0.5875553, 1.168128, 0, 0, 0, 1, 1,
2.631113, -0.2510269, 3.393825, 0, 0, 0, 1, 1,
2.733602, -0.6192476, 3.265797, 0, 0, 0, 1, 1,
2.791993, -0.9218062, 1.190203, 0, 0, 0, 1, 1,
2.828259, 0.3074926, 1.853169, 1, 1, 1, 1, 1,
2.842512, -1.623497, 0.8892165, 1, 1, 1, 1, 1,
3.113254, 0.6551273, 1.676769, 1, 1, 1, 1, 1,
3.161369, -0.07322576, 2.269912, 1, 1, 1, 1, 1,
3.383681, 0.9271634, -0.04241939, 1, 1, 1, 1, 1,
3.420137, -0.2208095, 1.117016, 1, 1, 1, 1, 1,
4.745487, 1.051635, 0.8298872, 1, 1, 1, 1, 1
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
var radius = 10.20683;
var distance = 35.85106;
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
mvMatrix.translate( -0.6495278, -0.1985602, -0.2588317 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.85106);
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
