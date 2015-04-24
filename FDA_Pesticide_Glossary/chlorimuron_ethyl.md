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
-3.436366, 1.749499, -0.4340322, 1, 0, 0, 1,
-3.260197, -0.5635934, -0.5191747, 1, 0.007843138, 0, 1,
-2.966197, 1.262857, -1.425079, 1, 0.01176471, 0, 1,
-2.782558, 0.8599228, -0.8203094, 1, 0.01960784, 0, 1,
-2.780358, -0.4268464, -1.100397, 1, 0.02352941, 0, 1,
-2.759295, 0.3688317, 0.2557223, 1, 0.03137255, 0, 1,
-2.646933, -0.1561537, -0.9958008, 1, 0.03529412, 0, 1,
-2.504855, 1.756057, -2.470675, 1, 0.04313726, 0, 1,
-2.500629, -0.5888349, -1.922289, 1, 0.04705882, 0, 1,
-2.478472, 0.5483822, -1.746504, 1, 0.05490196, 0, 1,
-2.341344, 0.4102302, -1.164643, 1, 0.05882353, 0, 1,
-2.335971, 1.316374, -2.381533, 1, 0.06666667, 0, 1,
-2.302471, -0.6720344, -2.145516, 1, 0.07058824, 0, 1,
-2.301462, 0.3248055, -3.051669, 1, 0.07843138, 0, 1,
-2.268791, -0.5981054, -0.8062941, 1, 0.08235294, 0, 1,
-2.266558, -0.9553527, -0.7908372, 1, 0.09019608, 0, 1,
-2.259438, 0.7117218, -0.5295238, 1, 0.09411765, 0, 1,
-2.253868, 1.180557, -1.540756, 1, 0.1019608, 0, 1,
-2.136493, -0.7506058, -1.085093, 1, 0.1098039, 0, 1,
-2.101215, 0.01111849, -1.510926, 1, 0.1137255, 0, 1,
-2.086852, 0.4480557, -1.033133, 1, 0.1215686, 0, 1,
-2.075495, -0.9536227, -3.08507, 1, 0.1254902, 0, 1,
-2.069388, -0.3516402, -1.71117, 1, 0.1333333, 0, 1,
-2.018508, 0.1559342, -2.265024, 1, 0.1372549, 0, 1,
-2.01421, -1.576683, -1.438599, 1, 0.145098, 0, 1,
-2.0139, 0.6520883, -2.637723, 1, 0.1490196, 0, 1,
-1.969613, -1.188592, -3.293391, 1, 0.1568628, 0, 1,
-1.96048, -0.6428307, -2.235864, 1, 0.1607843, 0, 1,
-1.939262, -1.075819, -1.315522, 1, 0.1686275, 0, 1,
-1.931712, -1.017343, -2.13732, 1, 0.172549, 0, 1,
-1.876995, 0.6727507, -1.043875, 1, 0.1803922, 0, 1,
-1.836759, -0.9900237, -1.347585, 1, 0.1843137, 0, 1,
-1.827441, -0.5835895, -1.491454, 1, 0.1921569, 0, 1,
-1.8222, 1.26629, 0.04528066, 1, 0.1960784, 0, 1,
-1.821912, 1.748305, -1.676782, 1, 0.2039216, 0, 1,
-1.808246, -0.131038, -1.489, 1, 0.2117647, 0, 1,
-1.794168, -0.23555, -0.5355088, 1, 0.2156863, 0, 1,
-1.761223, -0.6167871, -3.564274, 1, 0.2235294, 0, 1,
-1.757681, 0.3630612, -2.434651, 1, 0.227451, 0, 1,
-1.756585, 1.500129, -0.2135811, 1, 0.2352941, 0, 1,
-1.747455, 0.2587524, -1.011765, 1, 0.2392157, 0, 1,
-1.737996, 1.651495, 0.1712921, 1, 0.2470588, 0, 1,
-1.735265, -1.578007, -2.902705, 1, 0.2509804, 0, 1,
-1.727966, -0.08970797, -3.257782, 1, 0.2588235, 0, 1,
-1.717543, 0.1741698, -1.233904, 1, 0.2627451, 0, 1,
-1.715155, 1.624558, -0.9773024, 1, 0.2705882, 0, 1,
-1.713453, 0.7106522, -0.543726, 1, 0.2745098, 0, 1,
-1.700235, -0.4497195, -0.8515278, 1, 0.282353, 0, 1,
-1.682533, -0.255867, -2.041295, 1, 0.2862745, 0, 1,
-1.681349, 0.8000714, -0.8320782, 1, 0.2941177, 0, 1,
-1.678936, 0.8604497, -0.6156468, 1, 0.3019608, 0, 1,
-1.672949, -0.8709626, -2.602276, 1, 0.3058824, 0, 1,
-1.6668, -0.4268253, -2.726612, 1, 0.3137255, 0, 1,
-1.665398, 1.102445, -2.093137, 1, 0.3176471, 0, 1,
-1.657684, 0.2779088, -1.246585, 1, 0.3254902, 0, 1,
-1.657057, 0.855771, -0.2576759, 1, 0.3294118, 0, 1,
-1.655406, -0.4783394, -0.7412735, 1, 0.3372549, 0, 1,
-1.646706, -0.5546057, -0.9674512, 1, 0.3411765, 0, 1,
-1.594856, -0.5597914, -3.929647, 1, 0.3490196, 0, 1,
-1.574849, -1.690747, -2.375742, 1, 0.3529412, 0, 1,
-1.564394, -0.901047, -2.351968, 1, 0.3607843, 0, 1,
-1.53771, -0.891179, -1.16786, 1, 0.3647059, 0, 1,
-1.530322, 0.4354112, -1.59614, 1, 0.372549, 0, 1,
-1.529681, 1.12776, -0.2121598, 1, 0.3764706, 0, 1,
-1.522765, -0.4481228, -2.548287, 1, 0.3843137, 0, 1,
-1.517896, 0.09275983, -1.173654, 1, 0.3882353, 0, 1,
-1.492845, 0.2653855, -0.7899194, 1, 0.3960784, 0, 1,
-1.483144, -2.560216, -1.293213, 1, 0.4039216, 0, 1,
-1.479807, 1.23001, -1.073093, 1, 0.4078431, 0, 1,
-1.477151, -1.288809, -1.131362, 1, 0.4156863, 0, 1,
-1.474235, 1.606578, -1.722953, 1, 0.4196078, 0, 1,
-1.471079, 1.091763, -0.5643565, 1, 0.427451, 0, 1,
-1.46078, 2.542029, -0.8840411, 1, 0.4313726, 0, 1,
-1.453175, -0.1532346, -2.730652, 1, 0.4392157, 0, 1,
-1.450899, -0.8349633, -1.722301, 1, 0.4431373, 0, 1,
-1.427607, -0.9920242, -1.601091, 1, 0.4509804, 0, 1,
-1.41992, 0.6578658, -0.8650584, 1, 0.454902, 0, 1,
-1.406345, 0.6023882, -0.945166, 1, 0.4627451, 0, 1,
-1.404451, 0.2670278, -0.3475393, 1, 0.4666667, 0, 1,
-1.40409, -0.8146961, -0.9676038, 1, 0.4745098, 0, 1,
-1.403702, -1.432283, -2.634529, 1, 0.4784314, 0, 1,
-1.394581, -0.6005492, -1.228491, 1, 0.4862745, 0, 1,
-1.3904, -0.8058541, -0.2885435, 1, 0.4901961, 0, 1,
-1.38457, 1.457551, -1.188342, 1, 0.4980392, 0, 1,
-1.378758, 1.002498, -0.3775905, 1, 0.5058824, 0, 1,
-1.378718, -0.8304183, -1.756121, 1, 0.509804, 0, 1,
-1.372268, -0.03560419, 0.1795458, 1, 0.5176471, 0, 1,
-1.368116, -0.3916148, -2.005774, 1, 0.5215687, 0, 1,
-1.362557, 0.1629118, -1.870798, 1, 0.5294118, 0, 1,
-1.358515, 0.2722702, -1.18711, 1, 0.5333334, 0, 1,
-1.357938, 1.422886, 0.9914002, 1, 0.5411765, 0, 1,
-1.35283, -0.005016677, -0.6323519, 1, 0.5450981, 0, 1,
-1.326584, -0.4254924, -1.376672, 1, 0.5529412, 0, 1,
-1.323605, -0.7027731, -2.428333, 1, 0.5568628, 0, 1,
-1.323315, 1.514134, -1.292106, 1, 0.5647059, 0, 1,
-1.320499, -1.232602, -3.539357, 1, 0.5686275, 0, 1,
-1.318052, 2.172283, -0.5013555, 1, 0.5764706, 0, 1,
-1.317758, -0.8152428, -1.559177, 1, 0.5803922, 0, 1,
-1.306776, -0.302748, -0.9781133, 1, 0.5882353, 0, 1,
-1.300864, -1.311774, -1.843854, 1, 0.5921569, 0, 1,
-1.295551, -0.2264617, -1.099386, 1, 0.6, 0, 1,
-1.291277, 1.384178, 1.197329, 1, 0.6078432, 0, 1,
-1.286639, -0.2209716, -1.226476, 1, 0.6117647, 0, 1,
-1.279285, -1.663556, -3.142798, 1, 0.6196079, 0, 1,
-1.272335, -0.2623792, -2.322536, 1, 0.6235294, 0, 1,
-1.269361, -0.6161484, -2.645925, 1, 0.6313726, 0, 1,
-1.265847, -0.5788152, -1.151463, 1, 0.6352941, 0, 1,
-1.253937, 1.068249, -1.453317, 1, 0.6431373, 0, 1,
-1.253829, -1.409752, -3.157347, 1, 0.6470588, 0, 1,
-1.245743, 1.10871, -1.019956, 1, 0.654902, 0, 1,
-1.243087, 1.604137, 1.622502, 1, 0.6588235, 0, 1,
-1.242333, -1.068562, -3.230168, 1, 0.6666667, 0, 1,
-1.238414, 0.3858756, -1.896984, 1, 0.6705883, 0, 1,
-1.222632, -0.4530227, -1.772274, 1, 0.6784314, 0, 1,
-1.213448, -1.243949, -3.00984, 1, 0.682353, 0, 1,
-1.211127, 0.8797615, -0.1391212, 1, 0.6901961, 0, 1,
-1.19581, -0.5542018, -1.310589, 1, 0.6941177, 0, 1,
-1.193748, -0.4272013, -1.08708, 1, 0.7019608, 0, 1,
-1.19321, -1.994472, -2.273936, 1, 0.7098039, 0, 1,
-1.185599, 0.1533352, -2.082984, 1, 0.7137255, 0, 1,
-1.182979, -0.1279672, -1.260788, 1, 0.7215686, 0, 1,
-1.18251, -0.3439235, -0.1742508, 1, 0.7254902, 0, 1,
-1.181054, 0.4198421, -0.9084264, 1, 0.7333333, 0, 1,
-1.169181, 1.926753, 0.2531412, 1, 0.7372549, 0, 1,
-1.161139, -0.08672322, -2.79774, 1, 0.7450981, 0, 1,
-1.159375, 0.3889031, -1.06379, 1, 0.7490196, 0, 1,
-1.14779, 0.008502782, -1.208531, 1, 0.7568628, 0, 1,
-1.143406, 0.02190458, -2.094816, 1, 0.7607843, 0, 1,
-1.142737, 0.02001596, 0.192507, 1, 0.7686275, 0, 1,
-1.137513, 0.9939047, -1.489336, 1, 0.772549, 0, 1,
-1.133522, -1.209015, -3.334132, 1, 0.7803922, 0, 1,
-1.126329, -0.7082538, -2.502948, 1, 0.7843137, 0, 1,
-1.124445, -0.4740238, -2.099803, 1, 0.7921569, 0, 1,
-1.113473, -0.9014503, -3.710248, 1, 0.7960784, 0, 1,
-1.108277, 0.830347, 0.6493241, 1, 0.8039216, 0, 1,
-1.104519, 0.1350247, -1.423869, 1, 0.8117647, 0, 1,
-1.104264, -0.2461352, -2.064327, 1, 0.8156863, 0, 1,
-1.095231, 0.3328151, -1.011728, 1, 0.8235294, 0, 1,
-1.090985, -0.6166998, -1.503537, 1, 0.827451, 0, 1,
-1.079958, 0.05897268, -1.667026, 1, 0.8352941, 0, 1,
-1.077697, -1.021308, -1.844599, 1, 0.8392157, 0, 1,
-1.070818, -0.1398216, -2.009917, 1, 0.8470588, 0, 1,
-1.060992, 0.413621, -0.997344, 1, 0.8509804, 0, 1,
-1.057649, -2.435266, -1.979066, 1, 0.8588235, 0, 1,
-1.056208, -1.480268, -2.195309, 1, 0.8627451, 0, 1,
-1.051545, 0.47838, -1.067382, 1, 0.8705882, 0, 1,
-1.046535, -0.8609622, -3.577548, 1, 0.8745098, 0, 1,
-1.042299, -1.629626, -1.700682, 1, 0.8823529, 0, 1,
-1.041273, 0.638499, -2.648881, 1, 0.8862745, 0, 1,
-1.035452, -1.15617, -2.358279, 1, 0.8941177, 0, 1,
-1.033307, -0.8939333, -4.545992, 1, 0.8980392, 0, 1,
-1.030979, 0.1399844, -0.3980702, 1, 0.9058824, 0, 1,
-1.030186, -1.123087, -2.6672, 1, 0.9137255, 0, 1,
-1.02486, 0.1229354, -1.570589, 1, 0.9176471, 0, 1,
-1.021474, -0.2793125, -3.319178, 1, 0.9254902, 0, 1,
-1.020028, -0.5757601, -3.682377, 1, 0.9294118, 0, 1,
-1.001139, 0.5608492, -1.340771, 1, 0.9372549, 0, 1,
-0.9962366, -0.08404661, -3.179989, 1, 0.9411765, 0, 1,
-0.994265, -0.1506532, -1.953963, 1, 0.9490196, 0, 1,
-0.9896106, 0.950153, -2.301167, 1, 0.9529412, 0, 1,
-0.9854603, -0.01727893, -0.464359, 1, 0.9607843, 0, 1,
-0.9832852, -0.3518776, -1.655704, 1, 0.9647059, 0, 1,
-0.9685074, -1.902646, -4.006053, 1, 0.972549, 0, 1,
-0.9683878, 2.645377, -0.4456918, 1, 0.9764706, 0, 1,
-0.967231, -0.6456948, -0.5360121, 1, 0.9843137, 0, 1,
-0.95745, 0.6342539, 0.2663296, 1, 0.9882353, 0, 1,
-0.9572527, -0.8811201, -3.042281, 1, 0.9960784, 0, 1,
-0.9551167, 0.4733156, -2.497521, 0.9960784, 1, 0, 1,
-0.948397, 0.1565456, -0.4796007, 0.9921569, 1, 0, 1,
-0.9407815, -1.145509, -1.980435, 0.9843137, 1, 0, 1,
-0.9407557, -0.3166288, -1.894961, 0.9803922, 1, 0, 1,
-0.9394484, 0.1905694, -0.9430707, 0.972549, 1, 0, 1,
-0.9365184, -1.173233, -0.6522326, 0.9686275, 1, 0, 1,
-0.9338285, 0.4253008, -2.165887, 0.9607843, 1, 0, 1,
-0.9273626, 0.8078986, -2.59514, 0.9568627, 1, 0, 1,
-0.9178916, 0.05521856, -1.282898, 0.9490196, 1, 0, 1,
-0.9154764, -1.168336, -1.462243, 0.945098, 1, 0, 1,
-0.9073283, -0.3784342, -0.2978939, 0.9372549, 1, 0, 1,
-0.8969358, -1.025998, -3.447594, 0.9333333, 1, 0, 1,
-0.8946502, -1.364538, -1.44282, 0.9254902, 1, 0, 1,
-0.8929444, 0.3424743, 0.1800945, 0.9215686, 1, 0, 1,
-0.8924728, -0.7762269, -2.050394, 0.9137255, 1, 0, 1,
-0.8911858, 0.1743449, 0.1321752, 0.9098039, 1, 0, 1,
-0.8872771, 0.3574259, 0.7950765, 0.9019608, 1, 0, 1,
-0.8849166, -1.282101, -2.785806, 0.8941177, 1, 0, 1,
-0.8806305, 1.710829, -0.4311932, 0.8901961, 1, 0, 1,
-0.880371, -0.1079781, -2.157681, 0.8823529, 1, 0, 1,
-0.8783814, -0.1679668, -2.038156, 0.8784314, 1, 0, 1,
-0.8782614, 0.9534772, 0.3716848, 0.8705882, 1, 0, 1,
-0.8769417, -0.3033219, -1.707871, 0.8666667, 1, 0, 1,
-0.8698037, -0.03860183, -2.18364, 0.8588235, 1, 0, 1,
-0.8689196, -1.044911, -1.551454, 0.854902, 1, 0, 1,
-0.8660682, -0.8571741, -2.241055, 0.8470588, 1, 0, 1,
-0.8538015, -0.2408422, -2.315109, 0.8431373, 1, 0, 1,
-0.8468378, 1.001903, -1.011567, 0.8352941, 1, 0, 1,
-0.8448328, -0.2063804, -2.572972, 0.8313726, 1, 0, 1,
-0.8443098, -1.740851, -0.9595683, 0.8235294, 1, 0, 1,
-0.8345739, -1.069217, -2.737158, 0.8196079, 1, 0, 1,
-0.8320249, 0.2353265, -2.444986, 0.8117647, 1, 0, 1,
-0.8297465, 0.434605, -1.518761, 0.8078431, 1, 0, 1,
-0.8194207, -1.151949, -0.9392737, 0.8, 1, 0, 1,
-0.8147352, -1.320146, -2.112031, 0.7921569, 1, 0, 1,
-0.8112389, -1.461369, -3.876431, 0.7882353, 1, 0, 1,
-0.8092293, 0.7307365, -1.473681, 0.7803922, 1, 0, 1,
-0.8091382, 0.958202, -0.6156731, 0.7764706, 1, 0, 1,
-0.7950884, 0.3286788, -2.089228, 0.7686275, 1, 0, 1,
-0.7910911, 2.032241, -1.453173, 0.7647059, 1, 0, 1,
-0.7903278, -0.7633752, -1.579183, 0.7568628, 1, 0, 1,
-0.7834823, 0.8557249, -2.512254, 0.7529412, 1, 0, 1,
-0.7774768, -0.6355264, -3.002475, 0.7450981, 1, 0, 1,
-0.772443, -0.0001323804, -0.9026699, 0.7411765, 1, 0, 1,
-0.7692548, -0.2876241, -1.868782, 0.7333333, 1, 0, 1,
-0.7634749, -1.343784, -3.855629, 0.7294118, 1, 0, 1,
-0.7582624, -0.4212598, -1.338563, 0.7215686, 1, 0, 1,
-0.7572299, -0.8079858, -2.071295, 0.7176471, 1, 0, 1,
-0.7561177, 1.139291, 0.2651282, 0.7098039, 1, 0, 1,
-0.7520886, 0.2570857, -0.7611613, 0.7058824, 1, 0, 1,
-0.751828, 2.099608, 0.6207901, 0.6980392, 1, 0, 1,
-0.7477748, -0.576149, -0.718501, 0.6901961, 1, 0, 1,
-0.7461585, 1.248919, -2.54828, 0.6862745, 1, 0, 1,
-0.735316, 1.574691, -0.6268308, 0.6784314, 1, 0, 1,
-0.7335208, -0.6713516, -1.322509, 0.6745098, 1, 0, 1,
-0.7330119, 0.01909654, -1.929388, 0.6666667, 1, 0, 1,
-0.732266, 0.8253646, -2.067174, 0.6627451, 1, 0, 1,
-0.7320113, 0.8107578, -1.921654, 0.654902, 1, 0, 1,
-0.7314308, 0.9747217, -1.106737, 0.6509804, 1, 0, 1,
-0.7312815, -1.013109, -2.813183, 0.6431373, 1, 0, 1,
-0.7312138, -0.1318904, -2.393955, 0.6392157, 1, 0, 1,
-0.7271959, -0.4579711, -2.570368, 0.6313726, 1, 0, 1,
-0.7253333, 0.1963852, -1.688562, 0.627451, 1, 0, 1,
-0.7251475, 1.611887, -1.250887, 0.6196079, 1, 0, 1,
-0.7206835, -0.1970537, -2.205547, 0.6156863, 1, 0, 1,
-0.7174246, 0.2627477, -1.347395, 0.6078432, 1, 0, 1,
-0.7162247, -0.6860718, -1.448165, 0.6039216, 1, 0, 1,
-0.7119684, 3.454586, 0.5413756, 0.5960785, 1, 0, 1,
-0.7081661, 0.9385282, -0.6075006, 0.5882353, 1, 0, 1,
-0.7035134, -0.8553744, -2.201118, 0.5843138, 1, 0, 1,
-0.6917719, -1.5523, -2.577578, 0.5764706, 1, 0, 1,
-0.6828908, 1.030508, 0.3763152, 0.572549, 1, 0, 1,
-0.6827328, -0.6171449, -1.10866, 0.5647059, 1, 0, 1,
-0.6770665, 0.3975499, -0.65888, 0.5607843, 1, 0, 1,
-0.6759054, -0.4213146, -1.333654, 0.5529412, 1, 0, 1,
-0.6739856, -1.096514, -2.372297, 0.5490196, 1, 0, 1,
-0.673721, 0.7730291, -0.4831501, 0.5411765, 1, 0, 1,
-0.6717112, -0.007432085, -1.760291, 0.5372549, 1, 0, 1,
-0.6712244, 1.560951, 0.5560136, 0.5294118, 1, 0, 1,
-0.6700583, 1.28696, -0.6480695, 0.5254902, 1, 0, 1,
-0.6623899, -1.600634, -1.679685, 0.5176471, 1, 0, 1,
-0.6583371, 0.4847943, 0.6152795, 0.5137255, 1, 0, 1,
-0.6551022, 0.2708143, -0.1077249, 0.5058824, 1, 0, 1,
-0.6544487, 0.2877304, -0.4105512, 0.5019608, 1, 0, 1,
-0.653222, 1.406631, 0.5539755, 0.4941176, 1, 0, 1,
-0.6527412, 0.2482567, -0.5522139, 0.4862745, 1, 0, 1,
-0.6462646, 0.2823189, -1.14083, 0.4823529, 1, 0, 1,
-0.6428474, 0.4052024, 2.256039, 0.4745098, 1, 0, 1,
-0.6390606, 1.493481, -0.8519472, 0.4705882, 1, 0, 1,
-0.6368313, 0.3572694, 0.1347707, 0.4627451, 1, 0, 1,
-0.6366373, 1.705012, -2.713366, 0.4588235, 1, 0, 1,
-0.6365815, 1.006839, -0.5340548, 0.4509804, 1, 0, 1,
-0.6349354, 0.3355143, 0.2574772, 0.4470588, 1, 0, 1,
-0.6340917, 0.6489059, -0.4545373, 0.4392157, 1, 0, 1,
-0.6326903, -0.3963166, -3.104689, 0.4352941, 1, 0, 1,
-0.6322343, 0.8155438, -1.939162, 0.427451, 1, 0, 1,
-0.6317057, -2.001913, -3.839292, 0.4235294, 1, 0, 1,
-0.6310121, 0.9448065, -0.8088567, 0.4156863, 1, 0, 1,
-0.6286742, 0.4011395, -1.185068, 0.4117647, 1, 0, 1,
-0.6246372, -0.6963964, -2.526524, 0.4039216, 1, 0, 1,
-0.6195192, 1.206889, -2.366729, 0.3960784, 1, 0, 1,
-0.6150088, 0.3742624, -2.170446, 0.3921569, 1, 0, 1,
-0.6145681, -0.6475124, -4.376329, 0.3843137, 1, 0, 1,
-0.6037837, -1.158442, -4.97959, 0.3803922, 1, 0, 1,
-0.5986528, 0.220836, -2.016878, 0.372549, 1, 0, 1,
-0.5972438, 1.868657, -0.377044, 0.3686275, 1, 0, 1,
-0.5942615, 0.6018541, -1.109536, 0.3607843, 1, 0, 1,
-0.5927519, -0.2352106, 0.07645317, 0.3568628, 1, 0, 1,
-0.5906029, 0.3563544, -0.6956741, 0.3490196, 1, 0, 1,
-0.5843906, 0.2624283, -1.022856, 0.345098, 1, 0, 1,
-0.5830675, 0.909537, -0.8130823, 0.3372549, 1, 0, 1,
-0.5806409, -0.6264542, -0.9851167, 0.3333333, 1, 0, 1,
-0.5768886, -0.0832692, -1.914935, 0.3254902, 1, 0, 1,
-0.5734724, 0.2389167, -0.13925, 0.3215686, 1, 0, 1,
-0.5713227, 1.312101, -0.4038685, 0.3137255, 1, 0, 1,
-0.5698074, 1.00507, 0.06560352, 0.3098039, 1, 0, 1,
-0.5697923, -1.649827, -2.51928, 0.3019608, 1, 0, 1,
-0.5693786, -0.7117645, -2.365167, 0.2941177, 1, 0, 1,
-0.5684184, -0.3766645, -2.994031, 0.2901961, 1, 0, 1,
-0.5662663, 0.4719363, -1.823965, 0.282353, 1, 0, 1,
-0.5655199, 2.282216, -0.3563307, 0.2784314, 1, 0, 1,
-0.5650425, -1.424607, -2.126686, 0.2705882, 1, 0, 1,
-0.555752, -0.3100724, -2.867975, 0.2666667, 1, 0, 1,
-0.5496496, -0.7652839, -2.872332, 0.2588235, 1, 0, 1,
-0.5495997, -0.1634354, -1.628503, 0.254902, 1, 0, 1,
-0.5462704, -0.6339635, -2.296569, 0.2470588, 1, 0, 1,
-0.5432286, 1.268039, -0.9616436, 0.2431373, 1, 0, 1,
-0.543183, 0.8195563, -0.814344, 0.2352941, 1, 0, 1,
-0.5398432, -1.219985, -3.613105, 0.2313726, 1, 0, 1,
-0.5374082, 0.3304898, 0.1866297, 0.2235294, 1, 0, 1,
-0.53717, 0.8328481, 1.803524, 0.2196078, 1, 0, 1,
-0.5341172, -0.5329881, -1.241771, 0.2117647, 1, 0, 1,
-0.5341132, 1.718313, -0.9380005, 0.2078431, 1, 0, 1,
-0.5330329, -0.745133, -2.736342, 0.2, 1, 0, 1,
-0.5317349, 0.4943722, -2.252971, 0.1921569, 1, 0, 1,
-0.5307745, -0.2932168, -1.995085, 0.1882353, 1, 0, 1,
-0.5293175, -0.2590826, -3.702313, 0.1803922, 1, 0, 1,
-0.526009, -1.397607, -2.257532, 0.1764706, 1, 0, 1,
-0.5220129, 0.7837368, -0.4595421, 0.1686275, 1, 0, 1,
-0.5186861, -0.2228211, -1.828226, 0.1647059, 1, 0, 1,
-0.5144916, -2.079008, -2.781641, 0.1568628, 1, 0, 1,
-0.5130928, 0.8131064, 1.208442, 0.1529412, 1, 0, 1,
-0.5120322, -0.4725225, -1.203133, 0.145098, 1, 0, 1,
-0.5104129, -0.2075527, -2.682408, 0.1411765, 1, 0, 1,
-0.5098715, 1.164936, -0.9699045, 0.1333333, 1, 0, 1,
-0.5090061, -0.1725578, -0.6733657, 0.1294118, 1, 0, 1,
-0.5063607, -1.039009, -2.178699, 0.1215686, 1, 0, 1,
-0.5053584, 0.3177284, -0.04645272, 0.1176471, 1, 0, 1,
-0.5021738, 0.2453498, -0.698827, 0.1098039, 1, 0, 1,
-0.4993953, -1.10544, -3.655291, 0.1058824, 1, 0, 1,
-0.4979079, -1.263863, -2.341831, 0.09803922, 1, 0, 1,
-0.4908474, 1.961836, -0.2273877, 0.09019608, 1, 0, 1,
-0.4902592, -0.2724079, -2.870873, 0.08627451, 1, 0, 1,
-0.4901915, 0.3340816, -0.565823, 0.07843138, 1, 0, 1,
-0.489891, -1.336858, -3.909656, 0.07450981, 1, 0, 1,
-0.4867369, 0.1203871, -0.3355536, 0.06666667, 1, 0, 1,
-0.48351, -1.093993, -1.945569, 0.0627451, 1, 0, 1,
-0.4821602, -1.480582, -3.732737, 0.05490196, 1, 0, 1,
-0.4792117, 0.01298238, -2.234805, 0.05098039, 1, 0, 1,
-0.4754102, 1.222488, -0.625334, 0.04313726, 1, 0, 1,
-0.4694192, 0.8379657, -0.8535514, 0.03921569, 1, 0, 1,
-0.4683431, 2.017569, -0.3259717, 0.03137255, 1, 0, 1,
-0.4639454, 1.117478, 0.5320032, 0.02745098, 1, 0, 1,
-0.4596942, -0.4219951, -3.020554, 0.01960784, 1, 0, 1,
-0.4590594, -0.8781137, -3.025458, 0.01568628, 1, 0, 1,
-0.4572297, 0.158609, -1.580439, 0.007843138, 1, 0, 1,
-0.4555371, 0.4005354, -2.509368, 0.003921569, 1, 0, 1,
-0.4549341, -1.005399, -2.739708, 0, 1, 0.003921569, 1,
-0.4434427, 2.825974, 0.6266083, 0, 1, 0.01176471, 1,
-0.4389274, -0.5837888, -2.582449, 0, 1, 0.01568628, 1,
-0.4379793, 0.2470295, -0.8635084, 0, 1, 0.02352941, 1,
-0.4295061, 0.6779165, 0.8752386, 0, 1, 0.02745098, 1,
-0.4288913, -0.3262059, -3.366226, 0, 1, 0.03529412, 1,
-0.4281653, -1.702178, -1.442663, 0, 1, 0.03921569, 1,
-0.4258893, -1.234129, -3.757857, 0, 1, 0.04705882, 1,
-0.4258525, -1.41975, -2.470152, 0, 1, 0.05098039, 1,
-0.4258277, 1.128857, -1.510198, 0, 1, 0.05882353, 1,
-0.4200925, 1.39318, -1.446422, 0, 1, 0.0627451, 1,
-0.4174001, -0.002736014, -0.9567149, 0, 1, 0.07058824, 1,
-0.4153754, -1.884414, -3.35305, 0, 1, 0.07450981, 1,
-0.4145892, 0.8737781, -1.940283, 0, 1, 0.08235294, 1,
-0.4090265, -0.03117352, 0.3332172, 0, 1, 0.08627451, 1,
-0.4041648, -1.028232, -3.391031, 0, 1, 0.09411765, 1,
-0.4037828, -3.070591, -3.989319, 0, 1, 0.1019608, 1,
-0.3991077, -0.3241082, -1.087739, 0, 1, 0.1058824, 1,
-0.3958404, -0.2448551, -2.808718, 0, 1, 0.1137255, 1,
-0.3923715, -0.5887388, -2.791926, 0, 1, 0.1176471, 1,
-0.3922412, -0.8693826, -0.8738107, 0, 1, 0.1254902, 1,
-0.3907325, -0.07043362, -2.34656, 0, 1, 0.1294118, 1,
-0.3880736, -0.1507687, -2.070001, 0, 1, 0.1372549, 1,
-0.3862495, 0.3646795, -0.4206988, 0, 1, 0.1411765, 1,
-0.3707793, 0.2219673, -1.70208, 0, 1, 0.1490196, 1,
-0.3692684, 1.252671, -1.203169, 0, 1, 0.1529412, 1,
-0.365673, 0.7656958, -0.7768582, 0, 1, 0.1607843, 1,
-0.3619685, 0.6670539, 1.496701, 0, 1, 0.1647059, 1,
-0.3619063, -0.0002942768, 0.10495, 0, 1, 0.172549, 1,
-0.3556585, 1.861857, 0.8105115, 0, 1, 0.1764706, 1,
-0.3542279, 0.1904256, 0.4062765, 0, 1, 0.1843137, 1,
-0.3507008, 0.4888564, -0.2414646, 0, 1, 0.1882353, 1,
-0.3484358, 0.5662896, -0.5338686, 0, 1, 0.1960784, 1,
-0.3473598, 1.204693, -0.9630467, 0, 1, 0.2039216, 1,
-0.3457268, -0.1165314, -1.471379, 0, 1, 0.2078431, 1,
-0.3455729, 0.04622599, -1.183205, 0, 1, 0.2156863, 1,
-0.3449957, -0.9402732, -2.905999, 0, 1, 0.2196078, 1,
-0.3436753, 0.2894621, -1.694004, 0, 1, 0.227451, 1,
-0.3432902, 1.878844, -0.04560927, 0, 1, 0.2313726, 1,
-0.3432507, 1.183182, -1.326872, 0, 1, 0.2392157, 1,
-0.3388443, 0.6428492, -0.6934267, 0, 1, 0.2431373, 1,
-0.3386107, 0.08006112, -0.547428, 0, 1, 0.2509804, 1,
-0.3366928, -1.831175, -2.138108, 0, 1, 0.254902, 1,
-0.3355746, -0.08845081, -2.373217, 0, 1, 0.2627451, 1,
-0.3352223, -0.107593, -1.733397, 0, 1, 0.2666667, 1,
-0.3352081, 0.6547672, 0.09213624, 0, 1, 0.2745098, 1,
-0.3334265, -1.846357, -3.300016, 0, 1, 0.2784314, 1,
-0.3291575, -1.851295, -2.005589, 0, 1, 0.2862745, 1,
-0.3270445, 0.1535697, -0.7498611, 0, 1, 0.2901961, 1,
-0.3261516, 0.8344315, -1.081851, 0, 1, 0.2980392, 1,
-0.3243468, -0.4201373, -4.613006, 0, 1, 0.3058824, 1,
-0.3239769, -0.4024723, -3.991652, 0, 1, 0.3098039, 1,
-0.3222593, 0.5527155, -0.2536241, 0, 1, 0.3176471, 1,
-0.3199997, -1.393463, -2.189822, 0, 1, 0.3215686, 1,
-0.3195774, -1.655125, -3.966611, 0, 1, 0.3294118, 1,
-0.3187226, -0.8938301, -4.992776, 0, 1, 0.3333333, 1,
-0.3106931, -1.158113, -0.8637092, 0, 1, 0.3411765, 1,
-0.3089387, -0.1326286, -1.5191, 0, 1, 0.345098, 1,
-0.3054246, 1.132935, -0.478958, 0, 1, 0.3529412, 1,
-0.3028006, 1.471201, 0.5053957, 0, 1, 0.3568628, 1,
-0.3022788, 1.245064, -1.166875, 0, 1, 0.3647059, 1,
-0.300274, 0.4284444, -0.5430233, 0, 1, 0.3686275, 1,
-0.296535, -0.8641437, -3.523309, 0, 1, 0.3764706, 1,
-0.294299, -0.1299533, -1.317196, 0, 1, 0.3803922, 1,
-0.2936944, 0.0232197, -2.021458, 0, 1, 0.3882353, 1,
-0.2911885, -0.1074934, -1.988908, 0, 1, 0.3921569, 1,
-0.2909109, 0.8770332, -1.036081, 0, 1, 0.4, 1,
-0.2873335, 0.3205312, -0.4229928, 0, 1, 0.4078431, 1,
-0.2799414, 0.2450597, -0.5068738, 0, 1, 0.4117647, 1,
-0.2799188, -0.1317969, -2.12188, 0, 1, 0.4196078, 1,
-0.2760554, -0.4875375, -4.361406, 0, 1, 0.4235294, 1,
-0.2759857, -0.8257579, -2.754586, 0, 1, 0.4313726, 1,
-0.2728586, -1.008341, -0.6243213, 0, 1, 0.4352941, 1,
-0.2728477, -0.3228917, -3.260368, 0, 1, 0.4431373, 1,
-0.2719768, -0.08046889, -0.2156061, 0, 1, 0.4470588, 1,
-0.2707241, 0.6312193, -0.7121263, 0, 1, 0.454902, 1,
-0.2692442, 1.124948, -0.2262101, 0, 1, 0.4588235, 1,
-0.2680613, 0.1064452, -0.3685725, 0, 1, 0.4666667, 1,
-0.2614368, -1.068854, -2.238038, 0, 1, 0.4705882, 1,
-0.2570049, 1.028564, -1.11584, 0, 1, 0.4784314, 1,
-0.2538016, 0.4478333, -1.126405, 0, 1, 0.4823529, 1,
-0.248509, -0.9423178, -2.880118, 0, 1, 0.4901961, 1,
-0.248369, -1.136129, -1.531331, 0, 1, 0.4941176, 1,
-0.2419978, -0.7614179, -2.61736, 0, 1, 0.5019608, 1,
-0.240961, 0.4586007, -2.319335, 0, 1, 0.509804, 1,
-0.2402683, 1.861176, -1.38575, 0, 1, 0.5137255, 1,
-0.2381092, -0.02635858, -0.9550657, 0, 1, 0.5215687, 1,
-0.2323512, -0.2360396, -2.200999, 0, 1, 0.5254902, 1,
-0.231265, -0.6362971, -4.502936, 0, 1, 0.5333334, 1,
-0.2265525, -0.2803456, -2.383288, 0, 1, 0.5372549, 1,
-0.2264405, 0.2114638, -0.7240096, 0, 1, 0.5450981, 1,
-0.2219367, -0.3930451, -2.428173, 0, 1, 0.5490196, 1,
-0.2112569, 1.608342, 0.2926302, 0, 1, 0.5568628, 1,
-0.2079217, 0.5220531, 0.4472391, 0, 1, 0.5607843, 1,
-0.2062518, 0.02340091, -1.377221, 0, 1, 0.5686275, 1,
-0.2042451, -0.4332814, -1.094731, 0, 1, 0.572549, 1,
-0.2036698, 1.229957, 1.036771, 0, 1, 0.5803922, 1,
-0.20265, -0.01424178, -0.6220234, 0, 1, 0.5843138, 1,
-0.2000079, -1.441645, -1.127743, 0, 1, 0.5921569, 1,
-0.1900497, -0.495764, -2.79855, 0, 1, 0.5960785, 1,
-0.1895388, -1.031729, -2.359568, 0, 1, 0.6039216, 1,
-0.1864897, 0.1956287, -2.369176, 0, 1, 0.6117647, 1,
-0.1833783, 0.07693116, -1.821171, 0, 1, 0.6156863, 1,
-0.1817131, 0.05166653, 0.7617514, 0, 1, 0.6235294, 1,
-0.18068, 0.6370777, -1.129952, 0, 1, 0.627451, 1,
-0.1806166, -1.309436, -3.711585, 0, 1, 0.6352941, 1,
-0.1799843, 1.082256, 0.2478857, 0, 1, 0.6392157, 1,
-0.1793042, 0.6240224, -0.8878568, 0, 1, 0.6470588, 1,
-0.1747318, 0.3151396, -1.005873, 0, 1, 0.6509804, 1,
-0.1648488, -0.01117359, -3.294956, 0, 1, 0.6588235, 1,
-0.1648087, 1.493118, 0.7355779, 0, 1, 0.6627451, 1,
-0.1576932, -0.4207554, -2.044175, 0, 1, 0.6705883, 1,
-0.157204, -0.06665752, -1.359376, 0, 1, 0.6745098, 1,
-0.1541139, 1.068445, -2.078125, 0, 1, 0.682353, 1,
-0.1461644, -0.2203689, -4.643497, 0, 1, 0.6862745, 1,
-0.1458928, 0.7607303, 1.080789, 0, 1, 0.6941177, 1,
-0.1417135, 1.126742, -0.4455022, 0, 1, 0.7019608, 1,
-0.1407804, 1.051322, 0.0357383, 0, 1, 0.7058824, 1,
-0.1399345, -0.3794835, -4.542196, 0, 1, 0.7137255, 1,
-0.1369182, 0.5363357, -0.3253822, 0, 1, 0.7176471, 1,
-0.1322015, -0.04831817, -0.8063827, 0, 1, 0.7254902, 1,
-0.1309668, -0.02109909, -1.380873, 0, 1, 0.7294118, 1,
-0.1283751, -0.5563622, -1.2286, 0, 1, 0.7372549, 1,
-0.1269101, -0.0143227, -2.673208, 0, 1, 0.7411765, 1,
-0.1247391, -0.5811041, -5.398112, 0, 1, 0.7490196, 1,
-0.1242937, -1.984976, -2.81319, 0, 1, 0.7529412, 1,
-0.1191065, -0.2183514, -2.701712, 0, 1, 0.7607843, 1,
-0.1115879, 0.08979977, -1.533158, 0, 1, 0.7647059, 1,
-0.107629, -0.9051114, -2.018531, 0, 1, 0.772549, 1,
-0.1038221, 1.239612, -0.4459938, 0, 1, 0.7764706, 1,
-0.1026927, 0.0373361, -2.104035, 0, 1, 0.7843137, 1,
-0.09509944, 0.4254034, 0.6570411, 0, 1, 0.7882353, 1,
-0.09379779, 0.06834479, -1.901479, 0, 1, 0.7960784, 1,
-0.09282898, 0.8943416, -0.3928542, 0, 1, 0.8039216, 1,
-0.0927254, 0.2277609, -1.949517, 0, 1, 0.8078431, 1,
-0.08905594, 0.1909432, -0.819071, 0, 1, 0.8156863, 1,
-0.08682445, 1.484941, -0.668954, 0, 1, 0.8196079, 1,
-0.07810815, 0.3752053, 0.3076306, 0, 1, 0.827451, 1,
-0.0778546, 0.4449682, 1.212492, 0, 1, 0.8313726, 1,
-0.07660405, -0.2741566, -3.227751, 0, 1, 0.8392157, 1,
-0.07514037, -1.461193, -3.37136, 0, 1, 0.8431373, 1,
-0.07333171, 1.052843, 0.6357822, 0, 1, 0.8509804, 1,
-0.07002278, 1.444873, -0.3695991, 0, 1, 0.854902, 1,
-0.06873632, -0.4025291, -4.019003, 0, 1, 0.8627451, 1,
-0.06650897, -0.009631476, 1.250271, 0, 1, 0.8666667, 1,
-0.06533317, -0.19902, -1.009624, 0, 1, 0.8745098, 1,
-0.06307309, -0.0850528, -2.449094, 0, 1, 0.8784314, 1,
-0.06233139, 1.721028, 0.5598057, 0, 1, 0.8862745, 1,
-0.05382292, -0.003902007, -1.354468, 0, 1, 0.8901961, 1,
-0.05351102, 1.943502, -0.888318, 0, 1, 0.8980392, 1,
-0.05345637, 0.3068322, 0.4877183, 0, 1, 0.9058824, 1,
-0.05243471, -0.4136007, -3.730361, 0, 1, 0.9098039, 1,
-0.05150121, 1.27717, -0.2862514, 0, 1, 0.9176471, 1,
-0.05127963, -0.03120154, -1.02764, 0, 1, 0.9215686, 1,
-0.05119571, -1.125684, -4.391686, 0, 1, 0.9294118, 1,
-0.04535121, 0.3754192, -0.4331316, 0, 1, 0.9333333, 1,
-0.04368315, -1.430002, -2.466931, 0, 1, 0.9411765, 1,
-0.04308688, -0.148651, -5.105026, 0, 1, 0.945098, 1,
-0.03858428, -0.8145329, -3.085294, 0, 1, 0.9529412, 1,
-0.03280157, -0.4724737, -2.277433, 0, 1, 0.9568627, 1,
-0.03270533, 0.4363033, -0.7395308, 0, 1, 0.9647059, 1,
-0.0308607, 1.453322, -0.209113, 0, 1, 0.9686275, 1,
-0.02923528, -1.14817, -4.778033, 0, 1, 0.9764706, 1,
-0.02732223, -0.1360956, -3.729011, 0, 1, 0.9803922, 1,
-0.02340468, 0.01939929, -0.5887327, 0, 1, 0.9882353, 1,
-0.02167211, 2.728095, -0.2116483, 0, 1, 0.9921569, 1,
-0.01661984, 1.43857, -0.2148095, 0, 1, 1, 1,
-0.01602314, 0.9358121, 1.73245, 0, 0.9921569, 1, 1,
-0.01531433, -1.519395, -3.999297, 0, 0.9882353, 1, 1,
-0.01074519, 2.313922, 0.7407929, 0, 0.9803922, 1, 1,
-0.01031309, -0.2465583, -3.569338, 0, 0.9764706, 1, 1,
-0.002446038, -0.9457378, -2.655602, 0, 0.9686275, 1, 1,
-6.623798e-05, 0.5247099, 0.4998902, 0, 0.9647059, 1, 1,
-1.802931e-06, -0.4746904, -3.21729, 0, 0.9568627, 1, 1,
0.00231924, -0.0116896, 4.428265, 0, 0.9529412, 1, 1,
0.003719843, 0.06617364, -0.4104027, 0, 0.945098, 1, 1,
0.005684825, 0.6285681, -1.297771, 0, 0.9411765, 1, 1,
0.01150454, -0.01833336, 1.949086, 0, 0.9333333, 1, 1,
0.01282436, -1.10759, 4.070848, 0, 0.9294118, 1, 1,
0.01309357, 0.08544559, 1.221066, 0, 0.9215686, 1, 1,
0.01499745, -0.1066892, 2.264457, 0, 0.9176471, 1, 1,
0.01684187, -1.739804, 3.034653, 0, 0.9098039, 1, 1,
0.02341658, -0.1892523, 2.571326, 0, 0.9058824, 1, 1,
0.02398544, 0.7573571, 0.008115536, 0, 0.8980392, 1, 1,
0.02495426, 0.1677187, 0.8872337, 0, 0.8901961, 1, 1,
0.02524328, 0.09898856, 0.585556, 0, 0.8862745, 1, 1,
0.02742613, 2.557805, -0.2644438, 0, 0.8784314, 1, 1,
0.02783557, -0.7608364, 2.798806, 0, 0.8745098, 1, 1,
0.02877567, 1.537426, 0.3598509, 0, 0.8666667, 1, 1,
0.02916029, -0.1664653, 2.176144, 0, 0.8627451, 1, 1,
0.02923962, -0.3822466, 4.987074, 0, 0.854902, 1, 1,
0.03284388, 1.49121, 0.8742732, 0, 0.8509804, 1, 1,
0.03462015, 0.1911476, 1.729373, 0, 0.8431373, 1, 1,
0.0433384, -0.3390401, 2.716996, 0, 0.8392157, 1, 1,
0.04430766, 0.7000995, -1.326795, 0, 0.8313726, 1, 1,
0.04503961, 0.01374333, 2.142707, 0, 0.827451, 1, 1,
0.04829827, 1.845713, -0.529741, 0, 0.8196079, 1, 1,
0.04921312, -0.7201695, 3.627442, 0, 0.8156863, 1, 1,
0.04974531, 0.2801957, 0.23513, 0, 0.8078431, 1, 1,
0.05202435, -0.05359469, 2.506464, 0, 0.8039216, 1, 1,
0.06126601, -0.4451353, 1.782049, 0, 0.7960784, 1, 1,
0.06320485, 1.450766, 0.6631998, 0, 0.7882353, 1, 1,
0.06530909, -0.5023167, 3.444779, 0, 0.7843137, 1, 1,
0.06605319, 0.4361065, 1.132241, 0, 0.7764706, 1, 1,
0.06638084, 1.777533, -0.5682316, 0, 0.772549, 1, 1,
0.06975286, 0.5292208, 0.4532583, 0, 0.7647059, 1, 1,
0.07150264, 1.722548, 1.373518, 0, 0.7607843, 1, 1,
0.07617933, -0.05965501, 1.649376, 0, 0.7529412, 1, 1,
0.08041298, 0.1728037, 1.208788, 0, 0.7490196, 1, 1,
0.08230637, 0.05401891, 0.5313059, 0, 0.7411765, 1, 1,
0.0877899, 0.8054088, 0.5823422, 0, 0.7372549, 1, 1,
0.0927557, 0.3374456, 1.712094, 0, 0.7294118, 1, 1,
0.09360901, -1.439246, 0.319305, 0, 0.7254902, 1, 1,
0.09432244, -0.9599918, 4.999364, 0, 0.7176471, 1, 1,
0.09760354, 0.6007833, -0.2843777, 0, 0.7137255, 1, 1,
0.09790812, 1.053992, -0.08284882, 0, 0.7058824, 1, 1,
0.09986427, 1.402507, 1.582584, 0, 0.6980392, 1, 1,
0.1008029, -1.843989, 1.025097, 0, 0.6941177, 1, 1,
0.1020336, -0.1849267, 1.795776, 0, 0.6862745, 1, 1,
0.1029652, -0.8725386, 3.114487, 0, 0.682353, 1, 1,
0.1032819, 1.03325, 0.7852873, 0, 0.6745098, 1, 1,
0.1041248, -1.102816, 2.238919, 0, 0.6705883, 1, 1,
0.1045786, 0.3418623, 0.2361417, 0, 0.6627451, 1, 1,
0.1077739, -0.1400497, 2.305012, 0, 0.6588235, 1, 1,
0.1101557, 1.309845, -0.4436616, 0, 0.6509804, 1, 1,
0.1106174, 0.9618754, 0.1833278, 0, 0.6470588, 1, 1,
0.112014, -0.243888, 3.182066, 0, 0.6392157, 1, 1,
0.1139513, 0.369625, 1.686599, 0, 0.6352941, 1, 1,
0.1193799, -1.717461, 2.67081, 0, 0.627451, 1, 1,
0.1234533, -1.848406, 2.815016, 0, 0.6235294, 1, 1,
0.1247673, -0.3350274, 0.7453483, 0, 0.6156863, 1, 1,
0.1259496, 0.9595383, -0.3383882, 0, 0.6117647, 1, 1,
0.1277328, -0.3506568, 3.595206, 0, 0.6039216, 1, 1,
0.1301772, 0.6241693, -1.08938, 0, 0.5960785, 1, 1,
0.1307184, -0.3842955, 2.703589, 0, 0.5921569, 1, 1,
0.1372596, -0.2912275, 2.062927, 0, 0.5843138, 1, 1,
0.1380563, -1.78972, 2.358868, 0, 0.5803922, 1, 1,
0.1413562, 0.01835627, 1.085681, 0, 0.572549, 1, 1,
0.1455684, -0.8537166, 1.854301, 0, 0.5686275, 1, 1,
0.145866, 0.6893069, -0.4629909, 0, 0.5607843, 1, 1,
0.1464124, -0.5060124, 4.50703, 0, 0.5568628, 1, 1,
0.1500202, 1.408213, -0.5731261, 0, 0.5490196, 1, 1,
0.1523216, 0.3465413, 0.9107714, 0, 0.5450981, 1, 1,
0.1534191, 0.5795481, 0.3981103, 0, 0.5372549, 1, 1,
0.1544678, -0.1547599, 2.339654, 0, 0.5333334, 1, 1,
0.1590642, -0.00449096, 1.916498, 0, 0.5254902, 1, 1,
0.1597053, 1.172508, 2.236054, 0, 0.5215687, 1, 1,
0.1599358, -0.2794403, 3.048729, 0, 0.5137255, 1, 1,
0.1618191, 1.305969, 1.482959, 0, 0.509804, 1, 1,
0.1681173, 0.7552863, 0.2618417, 0, 0.5019608, 1, 1,
0.1703188, -1.217698, 4.749215, 0, 0.4941176, 1, 1,
0.1722094, 2.06358, 0.5430928, 0, 0.4901961, 1, 1,
0.1732558, -0.04769048, 1.04869, 0, 0.4823529, 1, 1,
0.1735277, -0.8384381, 1.777281, 0, 0.4784314, 1, 1,
0.1764781, 0.6501389, 0.5164232, 0, 0.4705882, 1, 1,
0.1769884, -0.9383188, 3.199037, 0, 0.4666667, 1, 1,
0.1816301, 0.2990707, -0.1094893, 0, 0.4588235, 1, 1,
0.1828286, -0.3964587, 3.356988, 0, 0.454902, 1, 1,
0.1851175, -1.248637, 3.434507, 0, 0.4470588, 1, 1,
0.185408, -0.1572518, 2.591847, 0, 0.4431373, 1, 1,
0.186271, 0.5630221, 0.9133962, 0, 0.4352941, 1, 1,
0.1891153, 0.8626944, -1.106914, 0, 0.4313726, 1, 1,
0.1926244, 0.3951105, 1.166397, 0, 0.4235294, 1, 1,
0.1962613, 0.4375786, 0.1556879, 0, 0.4196078, 1, 1,
0.2020631, 0.02295716, 4.317062, 0, 0.4117647, 1, 1,
0.208051, -1.756909, 4.123386, 0, 0.4078431, 1, 1,
0.2112148, 0.7122424, -0.2246705, 0, 0.4, 1, 1,
0.215984, 1.633505, 1.699072, 0, 0.3921569, 1, 1,
0.2172292, 1.357857, 1.422219, 0, 0.3882353, 1, 1,
0.2172335, -0.9982559, 1.055929, 0, 0.3803922, 1, 1,
0.2193633, 0.07285278, 1.916684, 0, 0.3764706, 1, 1,
0.2245451, 1.64435, -0.124317, 0, 0.3686275, 1, 1,
0.2253445, 0.4900092, 0.6307092, 0, 0.3647059, 1, 1,
0.2253763, -0.08518194, 0.6610044, 0, 0.3568628, 1, 1,
0.2295778, -0.9311805, 0.7526647, 0, 0.3529412, 1, 1,
0.2374334, 0.6584741, -0.4291473, 0, 0.345098, 1, 1,
0.2403388, 1.560471, 1.285418, 0, 0.3411765, 1, 1,
0.2407646, -0.6045515, 1.69891, 0, 0.3333333, 1, 1,
0.248145, 0.5164311, 0.2145022, 0, 0.3294118, 1, 1,
0.2532637, -0.5017644, 1.715085, 0, 0.3215686, 1, 1,
0.2534452, -1.753587, 1.872093, 0, 0.3176471, 1, 1,
0.2535331, 1.064515, 0.02656512, 0, 0.3098039, 1, 1,
0.2688177, 1.557517, 0.03195098, 0, 0.3058824, 1, 1,
0.2719015, -1.067268, 3.169113, 0, 0.2980392, 1, 1,
0.2744563, -1.317782, 2.790522, 0, 0.2901961, 1, 1,
0.2780343, 0.9163388, 0.2383568, 0, 0.2862745, 1, 1,
0.2788568, 0.2023965, 0.0001219956, 0, 0.2784314, 1, 1,
0.2798542, -0.6938829, 2.545766, 0, 0.2745098, 1, 1,
0.2845066, 0.4821444, -0.4723862, 0, 0.2666667, 1, 1,
0.2855165, 0.0221451, 1.404725, 0, 0.2627451, 1, 1,
0.286934, -0.4542813, 1.78437, 0, 0.254902, 1, 1,
0.2913923, -2.233152, 2.473019, 0, 0.2509804, 1, 1,
0.293339, 0.9129088, -2.37149, 0, 0.2431373, 1, 1,
0.2959206, 1.311608, 1.051777, 0, 0.2392157, 1, 1,
0.298057, 1.080399, -0.3039782, 0, 0.2313726, 1, 1,
0.2997599, -0.3837577, 2.23974, 0, 0.227451, 1, 1,
0.3002676, 0.3698436, -0.9909711, 0, 0.2196078, 1, 1,
0.3009985, -0.2601488, 2.995079, 0, 0.2156863, 1, 1,
0.3027606, -0.4678814, 3.336399, 0, 0.2078431, 1, 1,
0.3038877, 0.241523, 1.774419, 0, 0.2039216, 1, 1,
0.3044905, 2.100353, 1.206448, 0, 0.1960784, 1, 1,
0.3045066, -0.1485959, 2.261666, 0, 0.1882353, 1, 1,
0.3057204, 0.9821345, 1.683179, 0, 0.1843137, 1, 1,
0.310452, -0.9931723, 2.974866, 0, 0.1764706, 1, 1,
0.3130761, -0.355686, 2.584936, 0, 0.172549, 1, 1,
0.3151568, -1.324265, 3.260596, 0, 0.1647059, 1, 1,
0.3229126, 2.348022, 1.079244, 0, 0.1607843, 1, 1,
0.3248588, 0.06286544, 1.026973, 0, 0.1529412, 1, 1,
0.3283134, -0.7510617, 2.91902, 0, 0.1490196, 1, 1,
0.3332304, 1.336059, -1.009921, 0, 0.1411765, 1, 1,
0.3366845, 0.02833868, 1.831387, 0, 0.1372549, 1, 1,
0.3385299, -0.8442963, 2.266339, 0, 0.1294118, 1, 1,
0.3436772, -0.2397707, 2.151844, 0, 0.1254902, 1, 1,
0.3458859, 0.7065221, -0.1161616, 0, 0.1176471, 1, 1,
0.3537548, 1.76557, -0.1961654, 0, 0.1137255, 1, 1,
0.3538002, -0.5421038, 2.940484, 0, 0.1058824, 1, 1,
0.3539835, 0.5415124, 0.07806923, 0, 0.09803922, 1, 1,
0.3543353, 0.2490475, -0.8035476, 0, 0.09411765, 1, 1,
0.358878, 1.078274, 0.2465148, 0, 0.08627451, 1, 1,
0.3612944, -1.110888, 2.439284, 0, 0.08235294, 1, 1,
0.3634885, 0.006580157, 2.306544, 0, 0.07450981, 1, 1,
0.375053, -0.6531156, 2.013049, 0, 0.07058824, 1, 1,
0.3838992, 0.6887076, -0.1243428, 0, 0.0627451, 1, 1,
0.3856632, -0.7276838, 3.064127, 0, 0.05882353, 1, 1,
0.3885646, 0.7779475, 0.4282025, 0, 0.05098039, 1, 1,
0.3918149, 0.5814265, 1.282546, 0, 0.04705882, 1, 1,
0.3948012, 0.454564, 2.101785, 0, 0.03921569, 1, 1,
0.3994485, -1.315023, 2.441223, 0, 0.03529412, 1, 1,
0.4002369, 1.287901, 0.5409747, 0, 0.02745098, 1, 1,
0.4072147, -0.2833968, 1.685346, 0, 0.02352941, 1, 1,
0.4118053, 2.493725, 0.02327807, 0, 0.01568628, 1, 1,
0.4142398, 0.2961033, 2.304461, 0, 0.01176471, 1, 1,
0.4154493, 0.1341475, 1.637644, 0, 0.003921569, 1, 1,
0.4161877, 1.188723, -0.6415264, 0.003921569, 0, 1, 1,
0.4215072, -0.2615745, 2.411724, 0.007843138, 0, 1, 1,
0.4223765, -0.6753446, 1.39335, 0.01568628, 0, 1, 1,
0.4226761, 0.4611716, -0.3773694, 0.01960784, 0, 1, 1,
0.4271549, 2.456667, 1.989173, 0.02745098, 0, 1, 1,
0.4293539, -1.620195, 1.9386, 0.03137255, 0, 1, 1,
0.432916, 0.2264385, 0.9772416, 0.03921569, 0, 1, 1,
0.4399417, -0.9837359, 2.582654, 0.04313726, 0, 1, 1,
0.4431158, -1.127387, 2.388306, 0.05098039, 0, 1, 1,
0.4433062, -1.934921, 3.033483, 0.05490196, 0, 1, 1,
0.445686, 0.09676427, 1.717306, 0.0627451, 0, 1, 1,
0.4495843, -0.5210472, 2.389989, 0.06666667, 0, 1, 1,
0.4509115, -0.3089738, 2.367362, 0.07450981, 0, 1, 1,
0.4548894, 0.6033931, 0.8665537, 0.07843138, 0, 1, 1,
0.4597266, -2.148529, 2.117458, 0.08627451, 0, 1, 1,
0.4620738, 0.2210836, 0.8013647, 0.09019608, 0, 1, 1,
0.4727672, 0.9828459, 0.03644148, 0.09803922, 0, 1, 1,
0.4744089, -0.3711407, 0.7433182, 0.1058824, 0, 1, 1,
0.4764712, -0.0593411, 2.49367, 0.1098039, 0, 1, 1,
0.4764899, 0.359295, 1.356055, 0.1176471, 0, 1, 1,
0.4842197, 1.321169, 1.726074, 0.1215686, 0, 1, 1,
0.4904233, -0.3701484, 2.547817, 0.1294118, 0, 1, 1,
0.4928184, 0.3389739, 0.5902302, 0.1333333, 0, 1, 1,
0.4975464, 0.4131116, 0.1544085, 0.1411765, 0, 1, 1,
0.5028914, 1.289144, 0.01508832, 0.145098, 0, 1, 1,
0.5061916, 1.176145, 0.1727175, 0.1529412, 0, 1, 1,
0.5105081, 0.6812336, 1.410631, 0.1568628, 0, 1, 1,
0.5107251, -0.9913858, 2.908082, 0.1647059, 0, 1, 1,
0.5232441, 0.7988559, 0.09399987, 0.1686275, 0, 1, 1,
0.5243263, -1.569645, 2.93329, 0.1764706, 0, 1, 1,
0.5294183, 2.059295, 2.086227, 0.1803922, 0, 1, 1,
0.5329723, -1.349792, 3.456419, 0.1882353, 0, 1, 1,
0.533905, 1.012418, 0.2609139, 0.1921569, 0, 1, 1,
0.5344618, -0.6168197, 3.267586, 0.2, 0, 1, 1,
0.5406797, 1.215516, 0.3582661, 0.2078431, 0, 1, 1,
0.5426037, 0.2345217, 1.137272, 0.2117647, 0, 1, 1,
0.5483108, -0.1637821, 3.189596, 0.2196078, 0, 1, 1,
0.5491324, -2.03609, 1.649925, 0.2235294, 0, 1, 1,
0.5493708, -0.7125326, 2.320102, 0.2313726, 0, 1, 1,
0.5500569, -0.6889461, 3.810379, 0.2352941, 0, 1, 1,
0.5516852, 0.1430755, 2.511183, 0.2431373, 0, 1, 1,
0.5527771, -0.2274418, 1.948284, 0.2470588, 0, 1, 1,
0.5556186, 0.3335163, 1.386092, 0.254902, 0, 1, 1,
0.5597631, 0.05545651, 1.153829, 0.2588235, 0, 1, 1,
0.5620023, 0.1888832, 1.186502, 0.2666667, 0, 1, 1,
0.5647679, -0.3230843, 2.369442, 0.2705882, 0, 1, 1,
0.5672197, 0.7122802, -1.428293, 0.2784314, 0, 1, 1,
0.5701525, -0.4590043, 2.252611, 0.282353, 0, 1, 1,
0.5708423, -0.4224286, 2.835788, 0.2901961, 0, 1, 1,
0.5746861, 1.359232, 0.3263685, 0.2941177, 0, 1, 1,
0.5768055, 0.3323312, -0.3407847, 0.3019608, 0, 1, 1,
0.5789635, 0.7288061, 0.3863678, 0.3098039, 0, 1, 1,
0.5816624, -0.7758532, 2.598612, 0.3137255, 0, 1, 1,
0.5835634, 1.67691, 0.5803788, 0.3215686, 0, 1, 1,
0.5853855, -0.7909165, 2.06783, 0.3254902, 0, 1, 1,
0.5907059, -1.274421, 3.081004, 0.3333333, 0, 1, 1,
0.5928933, -1.52117, 2.581666, 0.3372549, 0, 1, 1,
0.5929068, 0.4954872, -0.8073019, 0.345098, 0, 1, 1,
0.6003348, 1.002558, -0.5408438, 0.3490196, 0, 1, 1,
0.6011945, -1.046298, 3.229603, 0.3568628, 0, 1, 1,
0.6021377, -0.8012612, 2.45084, 0.3607843, 0, 1, 1,
0.6041708, -1.000411, 1.689988, 0.3686275, 0, 1, 1,
0.6048081, -1.016716, 3.280675, 0.372549, 0, 1, 1,
0.6080657, -0.2159581, 2.527462, 0.3803922, 0, 1, 1,
0.6082999, 1.3274, -0.0453278, 0.3843137, 0, 1, 1,
0.6089606, -1.514046, 1.224882, 0.3921569, 0, 1, 1,
0.6150558, 1.663417, 0.5158679, 0.3960784, 0, 1, 1,
0.6173139, 0.119251, 2.014735, 0.4039216, 0, 1, 1,
0.6183308, -0.4773607, 3.666808, 0.4117647, 0, 1, 1,
0.618683, 0.5618777, -0.9706773, 0.4156863, 0, 1, 1,
0.6214098, -0.09059548, 3.652108, 0.4235294, 0, 1, 1,
0.6261169, 0.2488571, 1.433743, 0.427451, 0, 1, 1,
0.6267698, -0.04679425, 1.353504, 0.4352941, 0, 1, 1,
0.6287242, 0.952852, -0.5098549, 0.4392157, 0, 1, 1,
0.6322881, 1.314594, 1.53472, 0.4470588, 0, 1, 1,
0.632817, -0.1556181, 0.7070727, 0.4509804, 0, 1, 1,
0.6344614, -0.6680683, 2.633621, 0.4588235, 0, 1, 1,
0.6415245, -0.1238419, 2.828301, 0.4627451, 0, 1, 1,
0.6460571, -1.168829, 1.759884, 0.4705882, 0, 1, 1,
0.6511916, -0.7128567, 2.070953, 0.4745098, 0, 1, 1,
0.6512641, -0.01125621, -0.8619374, 0.4823529, 0, 1, 1,
0.6545823, -0.3192491, 2.428422, 0.4862745, 0, 1, 1,
0.6611766, -0.9852561, 2.340103, 0.4941176, 0, 1, 1,
0.6657288, 1.306819, -0.3722102, 0.5019608, 0, 1, 1,
0.6736574, 1.901137, 0.02491533, 0.5058824, 0, 1, 1,
0.6805026, 0.244244, -0.4191482, 0.5137255, 0, 1, 1,
0.6806782, -0.4192108, 3.927093, 0.5176471, 0, 1, 1,
0.6821939, 2.244797, -0.1872204, 0.5254902, 0, 1, 1,
0.6824334, -0.637228, 2.981796, 0.5294118, 0, 1, 1,
0.6838279, 1.418167, -0.9150636, 0.5372549, 0, 1, 1,
0.6855485, -0.9237723, 2.188878, 0.5411765, 0, 1, 1,
0.6856651, 0.005225075, 0.3726881, 0.5490196, 0, 1, 1,
0.6904153, -0.8464662, 1.752906, 0.5529412, 0, 1, 1,
0.6930158, -0.792931, 3.432962, 0.5607843, 0, 1, 1,
0.6970558, -1.835222, 2.512208, 0.5647059, 0, 1, 1,
0.6986583, -1.011297, 1.709655, 0.572549, 0, 1, 1,
0.7031342, -0.2124014, 3.68549, 0.5764706, 0, 1, 1,
0.707, -0.757466, 1.944109, 0.5843138, 0, 1, 1,
0.707683, 1.756254, 1.00638, 0.5882353, 0, 1, 1,
0.7098362, 0.5829853, -0.5667797, 0.5960785, 0, 1, 1,
0.7161749, 0.9897972, 1.18616, 0.6039216, 0, 1, 1,
0.7245691, -0.1997074, 1.693706, 0.6078432, 0, 1, 1,
0.7252504, 1.153976, 1.258919, 0.6156863, 0, 1, 1,
0.7304464, -0.3615947, 1.699466, 0.6196079, 0, 1, 1,
0.7348127, -0.6376238, 2.581256, 0.627451, 0, 1, 1,
0.7375216, 0.7802586, 0.8026974, 0.6313726, 0, 1, 1,
0.7423749, -0.5027501, 1.549654, 0.6392157, 0, 1, 1,
0.7487042, 0.9066914, -1.005078, 0.6431373, 0, 1, 1,
0.7514521, 0.7174894, 0.3432306, 0.6509804, 0, 1, 1,
0.7549191, -1.294043, 3.270584, 0.654902, 0, 1, 1,
0.7554177, 0.1310917, 1.468711, 0.6627451, 0, 1, 1,
0.7562124, -1.629405, 3.565113, 0.6666667, 0, 1, 1,
0.7577833, -0.9214398, 1.741424, 0.6745098, 0, 1, 1,
0.762589, 1.236689, 1.087564, 0.6784314, 0, 1, 1,
0.7630606, -1.563211, 2.908169, 0.6862745, 0, 1, 1,
0.7637649, 0.8347978, 0.7776637, 0.6901961, 0, 1, 1,
0.7729939, 0.7773234, -1.271165, 0.6980392, 0, 1, 1,
0.7732835, -0.2793331, 2.424174, 0.7058824, 0, 1, 1,
0.773847, -0.3242086, 1.020879, 0.7098039, 0, 1, 1,
0.7740458, -1.365326, 1.747114, 0.7176471, 0, 1, 1,
0.7742676, 1.743862, -0.002893486, 0.7215686, 0, 1, 1,
0.7746919, 1.158971, -1.678699, 0.7294118, 0, 1, 1,
0.777602, 0.1794376, 1.510708, 0.7333333, 0, 1, 1,
0.7901493, -0.1823882, 3.799125, 0.7411765, 0, 1, 1,
0.7912642, -0.5880193, 2.416178, 0.7450981, 0, 1, 1,
0.7944408, 1.105923, 0.04334376, 0.7529412, 0, 1, 1,
0.7977462, 2.163245, 0.8240204, 0.7568628, 0, 1, 1,
0.8000312, -1.365408, 4.129209, 0.7647059, 0, 1, 1,
0.8008475, -0.7793754, 2.337919, 0.7686275, 0, 1, 1,
0.8071053, 0.8124424, -0.06343871, 0.7764706, 0, 1, 1,
0.8108351, 1.771339, 0.9573713, 0.7803922, 0, 1, 1,
0.8158788, 0.9870104, -0.3526034, 0.7882353, 0, 1, 1,
0.8170838, 1.037654, -1.655626, 0.7921569, 0, 1, 1,
0.827252, 0.4175347, -0.06638381, 0.8, 0, 1, 1,
0.8288792, -0.6205732, 1.563096, 0.8078431, 0, 1, 1,
0.8312382, 2.472178, -0.07902289, 0.8117647, 0, 1, 1,
0.8313355, 0.4515944, -0.1626646, 0.8196079, 0, 1, 1,
0.8392361, 0.8247481, 0.3727533, 0.8235294, 0, 1, 1,
0.8426961, 0.5901032, 0.480081, 0.8313726, 0, 1, 1,
0.8496754, 0.6952406, 2.085278, 0.8352941, 0, 1, 1,
0.8534139, 0.3615074, 1.457433, 0.8431373, 0, 1, 1,
0.8575002, -1.066566, 4.921481, 0.8470588, 0, 1, 1,
0.8580092, -0.6791239, 0.8368058, 0.854902, 0, 1, 1,
0.8607829, -1.415145, 1.692739, 0.8588235, 0, 1, 1,
0.8804793, 2.440003, 1.127046, 0.8666667, 0, 1, 1,
0.8830276, -1.2468, 2.125667, 0.8705882, 0, 1, 1,
0.8959138, 0.2912911, 0.6956647, 0.8784314, 0, 1, 1,
0.8986773, 0.4777954, 0.542863, 0.8823529, 0, 1, 1,
0.9007039, 0.2621331, 0.4142798, 0.8901961, 0, 1, 1,
0.904978, 0.518288, 2.304304, 0.8941177, 0, 1, 1,
0.9110112, 0.2976449, 0.6828922, 0.9019608, 0, 1, 1,
0.9118519, -1.433531, -0.6702978, 0.9098039, 0, 1, 1,
0.9129537, 0.4343052, -0.4276065, 0.9137255, 0, 1, 1,
0.9142262, -0.4117777, 1.914848, 0.9215686, 0, 1, 1,
0.9153444, -1.640497, 3.754073, 0.9254902, 0, 1, 1,
0.9195719, 0.8337665, -0.563496, 0.9333333, 0, 1, 1,
0.9266109, -0.2802597, 1.264194, 0.9372549, 0, 1, 1,
0.9332004, 0.1619526, 3.079271, 0.945098, 0, 1, 1,
0.9346462, -2.07468, 2.411339, 0.9490196, 0, 1, 1,
0.9395394, 1.440416, -0.2024403, 0.9568627, 0, 1, 1,
0.9450642, 0.3133823, 0.5635677, 0.9607843, 0, 1, 1,
0.9473544, -0.6674724, 3.853509, 0.9686275, 0, 1, 1,
0.947803, 0.7137341, 0.4480584, 0.972549, 0, 1, 1,
0.9667865, -1.107005, 3.414574, 0.9803922, 0, 1, 1,
0.9688711, 0.6557844, -1.172086, 0.9843137, 0, 1, 1,
0.9690931, 0.7486825, 0.9574194, 0.9921569, 0, 1, 1,
0.9716899, -0.3039942, 3.341754, 0.9960784, 0, 1, 1,
0.9981759, 0.2792991, 0.8476055, 1, 0, 0.9960784, 1,
1.000143, 0.03514222, 0.6270851, 1, 0, 0.9882353, 1,
1.001362, 0.4972499, 0.1319358, 1, 0, 0.9843137, 1,
1.003794, -0.2289891, 2.620457, 1, 0, 0.9764706, 1,
1.003834, -0.5741178, 1.706319, 1, 0, 0.972549, 1,
1.004181, 0.6341548, -0.2102425, 1, 0, 0.9647059, 1,
1.004992, -0.7352785, 0.6379941, 1, 0, 0.9607843, 1,
1.008155, -0.9757094, 1.080858, 1, 0, 0.9529412, 1,
1.00842, -1.368387, 2.023254, 1, 0, 0.9490196, 1,
1.008567, 0.05431375, 1.643155, 1, 0, 0.9411765, 1,
1.009272, -1.587042, 1.369206, 1, 0, 0.9372549, 1,
1.012967, 0.03129782, 1.066618, 1, 0, 0.9294118, 1,
1.013354, -0.04284611, 0.9247891, 1, 0, 0.9254902, 1,
1.014156, -0.6361368, 2.173489, 1, 0, 0.9176471, 1,
1.018376, 0.05865668, 1.75118, 1, 0, 0.9137255, 1,
1.026361, 0.202503, 0.927011, 1, 0, 0.9058824, 1,
1.029543, -1.822499, 2.249169, 1, 0, 0.9019608, 1,
1.031012, 0.4015245, 3.25325, 1, 0, 0.8941177, 1,
1.040135, 0.6711116, -0.8626653, 1, 0, 0.8862745, 1,
1.047633, -1.645517, 3.690884, 1, 0, 0.8823529, 1,
1.058497, 0.1434508, 2.566738, 1, 0, 0.8745098, 1,
1.059461, -1.540864, 2.123888, 1, 0, 0.8705882, 1,
1.060392, 0.950534, 2.471758, 1, 0, 0.8627451, 1,
1.060702, -0.02796043, 0.8565112, 1, 0, 0.8588235, 1,
1.080997, 0.2030822, 2.739634, 1, 0, 0.8509804, 1,
1.082273, -2.286907, 2.552808, 1, 0, 0.8470588, 1,
1.084658, 1.616811, 2.091578, 1, 0, 0.8392157, 1,
1.086886, 0.3340691, 0.4626451, 1, 0, 0.8352941, 1,
1.088577, -0.316725, 2.639637, 1, 0, 0.827451, 1,
1.088671, 1.553961, 0.9751604, 1, 0, 0.8235294, 1,
1.089965, 0.3429906, 1.233557, 1, 0, 0.8156863, 1,
1.094308, -1.707024, 2.058857, 1, 0, 0.8117647, 1,
1.100472, -0.908745, 2.252271, 1, 0, 0.8039216, 1,
1.101509, -1.816075, 3.144632, 1, 0, 0.7960784, 1,
1.109511, 0.8294426, 0.1447957, 1, 0, 0.7921569, 1,
1.113349, -0.6665984, 4.039083, 1, 0, 0.7843137, 1,
1.115793, 1.954866, 1.196288, 1, 0, 0.7803922, 1,
1.120129, 2.11014, 1.570528, 1, 0, 0.772549, 1,
1.120444, 0.2620014, 0.542199, 1, 0, 0.7686275, 1,
1.125515, -0.5613505, 0.49732, 1, 0, 0.7607843, 1,
1.128492, -2.011794, 2.455063, 1, 0, 0.7568628, 1,
1.132228, -1.269343, 1.452371, 1, 0, 0.7490196, 1,
1.154745, 0.1545386, 0.8234335, 1, 0, 0.7450981, 1,
1.15748, -0.1923382, 1.364674, 1, 0, 0.7372549, 1,
1.15865, 0.1125388, 1.818686, 1, 0, 0.7333333, 1,
1.158674, 0.9061661, 0.9038606, 1, 0, 0.7254902, 1,
1.159828, -0.5362279, 2.754389, 1, 0, 0.7215686, 1,
1.166431, -1.290458, 2.406417, 1, 0, 0.7137255, 1,
1.170489, 0.2932769, 0.3434297, 1, 0, 0.7098039, 1,
1.17149, 1.36992, -1.446744, 1, 0, 0.7019608, 1,
1.179223, -0.1644551, 1.55551, 1, 0, 0.6941177, 1,
1.181915, -0.513811, 1.855144, 1, 0, 0.6901961, 1,
1.184935, -2.248736, 2.380637, 1, 0, 0.682353, 1,
1.190253, 1.562638, 3.000753, 1, 0, 0.6784314, 1,
1.213346, 0.3706548, 1.421311, 1, 0, 0.6705883, 1,
1.22095, -2.838285, 3.220483, 1, 0, 0.6666667, 1,
1.222796, -0.5708062, 2.543022, 1, 0, 0.6588235, 1,
1.229086, -0.1987414, 0.2400531, 1, 0, 0.654902, 1,
1.230424, -0.2005521, 1.624189, 1, 0, 0.6470588, 1,
1.242539, 0.6233678, 3.250922, 1, 0, 0.6431373, 1,
1.243606, -0.8226969, 2.327178, 1, 0, 0.6352941, 1,
1.243673, 0.1901284, 1.641582, 1, 0, 0.6313726, 1,
1.243992, 0.8631867, 1.395544, 1, 0, 0.6235294, 1,
1.246543, -0.5731028, 2.668598, 1, 0, 0.6196079, 1,
1.247784, 0.1529331, 2.239108, 1, 0, 0.6117647, 1,
1.2508, 2.0633, 1.701932, 1, 0, 0.6078432, 1,
1.251383, 0.2850035, 1.86228, 1, 0, 0.6, 1,
1.252018, 0.1169045, 2.334622, 1, 0, 0.5921569, 1,
1.255533, -0.3956595, 2.380014, 1, 0, 0.5882353, 1,
1.265032, -2.480413, 2.688328, 1, 0, 0.5803922, 1,
1.282882, -1.314358, 1.471405, 1, 0, 0.5764706, 1,
1.286741, 0.2569817, 0.4218377, 1, 0, 0.5686275, 1,
1.29675, -0.8099973, 2.806338, 1, 0, 0.5647059, 1,
1.307992, -0.7768348, 1.728343, 1, 0, 0.5568628, 1,
1.317904, 0.3855297, 1.827415, 1, 0, 0.5529412, 1,
1.320657, -0.4684888, 3.391509, 1, 0, 0.5450981, 1,
1.321336, 1.824567, 0.4134259, 1, 0, 0.5411765, 1,
1.34252, 1.028352, 0.7589293, 1, 0, 0.5333334, 1,
1.342859, 1.383412, 1.726147, 1, 0, 0.5294118, 1,
1.344009, 0.7954887, 2.818129, 1, 0, 0.5215687, 1,
1.346158, -0.9648632, 2.274466, 1, 0, 0.5176471, 1,
1.352981, 0.1107645, 1.720387, 1, 0, 0.509804, 1,
1.368896, -0.5154613, 1.463829, 1, 0, 0.5058824, 1,
1.374851, -0.0305179, 2.298, 1, 0, 0.4980392, 1,
1.387571, 0.2870244, -0.1230997, 1, 0, 0.4901961, 1,
1.39332, -0.06274553, -0.09042022, 1, 0, 0.4862745, 1,
1.404795, 0.5307615, -1.439516, 1, 0, 0.4784314, 1,
1.405582, 0.3702601, 1.314902, 1, 0, 0.4745098, 1,
1.407835, -0.1558148, 1.21565, 1, 0, 0.4666667, 1,
1.417387, 0.3295552, 1.615812, 1, 0, 0.4627451, 1,
1.419426, 0.004520174, 0.547013, 1, 0, 0.454902, 1,
1.423734, -1.078562, 2.876939, 1, 0, 0.4509804, 1,
1.43874, -0.2324199, 0.7473816, 1, 0, 0.4431373, 1,
1.439326, -2.092106, 3.272179, 1, 0, 0.4392157, 1,
1.46382, 0.7298552, 1.252639, 1, 0, 0.4313726, 1,
1.494033, 0.8373238, 1.926184, 1, 0, 0.427451, 1,
1.498546, -2.436072, 1.228116, 1, 0, 0.4196078, 1,
1.499818, 0.547194, 1.451367, 1, 0, 0.4156863, 1,
1.511317, -0.01745922, 2.868647, 1, 0, 0.4078431, 1,
1.52747, 1.069672, 1.968259, 1, 0, 0.4039216, 1,
1.528348, -1.597183, 2.818576, 1, 0, 0.3960784, 1,
1.528513, -0.1429195, 3.317499, 1, 0, 0.3882353, 1,
1.530361, 0.02247735, 2.254143, 1, 0, 0.3843137, 1,
1.533359, 0.005172899, 1.474747, 1, 0, 0.3764706, 1,
1.545154, -0.9298273, 1.330742, 1, 0, 0.372549, 1,
1.57021, -0.51036, 1.921903, 1, 0, 0.3647059, 1,
1.577643, -3.195244, 2.443561, 1, 0, 0.3607843, 1,
1.57954, 0.8383349, -1.022518, 1, 0, 0.3529412, 1,
1.586767, -0.6107119, 2.647496, 1, 0, 0.3490196, 1,
1.588905, -0.3207742, 2.902346, 1, 0, 0.3411765, 1,
1.590128, 0.9614725, -0.6907726, 1, 0, 0.3372549, 1,
1.591185, -0.7937228, 0.5208476, 1, 0, 0.3294118, 1,
1.59434, 1.371933, 1.014497, 1, 0, 0.3254902, 1,
1.595626, -0.3976028, 0.5882956, 1, 0, 0.3176471, 1,
1.610082, -0.06655773, 2.2357, 1, 0, 0.3137255, 1,
1.61636, 1.08814, 0.7991762, 1, 0, 0.3058824, 1,
1.624641, -0.1773697, 1.599579, 1, 0, 0.2980392, 1,
1.624733, 1.822829, -0.4659346, 1, 0, 0.2941177, 1,
1.632103, 0.4392399, -0.03230358, 1, 0, 0.2862745, 1,
1.637529, 0.5095389, 1.555872, 1, 0, 0.282353, 1,
1.643624, -0.8313592, 3.558923, 1, 0, 0.2745098, 1,
1.668445, -1.212792, 2.655636, 1, 0, 0.2705882, 1,
1.692577, -0.04445391, 0.9213189, 1, 0, 0.2627451, 1,
1.696519, -0.1116762, 2.08089, 1, 0, 0.2588235, 1,
1.712203, 0.9245842, -1.741896, 1, 0, 0.2509804, 1,
1.712818, -1.572061, 2.955026, 1, 0, 0.2470588, 1,
1.715062, 0.388226, 0.1790795, 1, 0, 0.2392157, 1,
1.724968, 0.8206379, 2.519699, 1, 0, 0.2352941, 1,
1.759541, -1.959648, 2.879233, 1, 0, 0.227451, 1,
1.760303, -0.09035891, -1.147262, 1, 0, 0.2235294, 1,
1.761267, 1.598263, 1.947932, 1, 0, 0.2156863, 1,
1.780218, 1.35155, 2.199848, 1, 0, 0.2117647, 1,
1.801602, 1.240656, 1.622271, 1, 0, 0.2039216, 1,
1.830292, 0.876671, -0.9028659, 1, 0, 0.1960784, 1,
1.842116, -0.2783825, 1.100783, 1, 0, 0.1921569, 1,
1.858069, 0.7343666, 1.491543, 1, 0, 0.1843137, 1,
1.859264, 2.409348, 0.721817, 1, 0, 0.1803922, 1,
1.873762, 0.5317812, 1.028405, 1, 0, 0.172549, 1,
1.920182, 0.2776109, 1.165697, 1, 0, 0.1686275, 1,
1.926451, 0.6732666, 1.944567, 1, 0, 0.1607843, 1,
1.935606, 0.1824903, 0.9835933, 1, 0, 0.1568628, 1,
1.936074, 0.9193695, 0.310977, 1, 0, 0.1490196, 1,
1.936259, 0.005873921, 1.456168, 1, 0, 0.145098, 1,
1.949374, -0.5361563, 0.9647327, 1, 0, 0.1372549, 1,
1.969381, -0.8580244, 1.270644, 1, 0, 0.1333333, 1,
1.978929, -0.125239, 1.313652, 1, 0, 0.1254902, 1,
1.984199, -1.056269, 1.882115, 1, 0, 0.1215686, 1,
2.024755, 0.4378338, 1.821151, 1, 0, 0.1137255, 1,
2.048239, -2.105364, 1.567273, 1, 0, 0.1098039, 1,
2.06831, -2.338547, 2.910193, 1, 0, 0.1019608, 1,
2.069253, 0.192417, -0.6526919, 1, 0, 0.09411765, 1,
2.075934, -0.3937323, 2.110753, 1, 0, 0.09019608, 1,
2.11961, 0.6344116, 1.152434, 1, 0, 0.08235294, 1,
2.139569, 0.5905754, 2.075288, 1, 0, 0.07843138, 1,
2.160648, 1.032003, 0.2971049, 1, 0, 0.07058824, 1,
2.164077, -1.181406, 0.719315, 1, 0, 0.06666667, 1,
2.168364, -0.1513713, 0.981499, 1, 0, 0.05882353, 1,
2.214121, 2.193336, 0.1224451, 1, 0, 0.05490196, 1,
2.30625, -2.937447, -0.2364437, 1, 0, 0.04705882, 1,
2.347407, -1.909228, 3.916195, 1, 0, 0.04313726, 1,
2.452178, -0.446515, 0.3727507, 1, 0, 0.03529412, 1,
2.468468, 0.2858338, 2.067923, 1, 0, 0.03137255, 1,
2.48492, -2.061416, 3.115512, 1, 0, 0.02352941, 1,
2.587139, -0.4006313, 1.766504, 1, 0, 0.01960784, 1,
2.675245, -1.399914, 2.264871, 1, 0, 0.01176471, 1,
2.883415, 0.2983875, -0.1793105, 1, 0, 0.007843138, 1
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
-0.2764758, -4.322391, -7.160484, 0, -0.5, 0.5, 0.5,
-0.2764758, -4.322391, -7.160484, 1, -0.5, 0.5, 0.5,
-0.2764758, -4.322391, -7.160484, 1, 1.5, 0.5, 0.5,
-0.2764758, -4.322391, -7.160484, 0, 1.5, 0.5, 0.5
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
-4.507569, 0.129671, -7.160484, 0, -0.5, 0.5, 0.5,
-4.507569, 0.129671, -7.160484, 1, -0.5, 0.5, 0.5,
-4.507569, 0.129671, -7.160484, 1, 1.5, 0.5, 0.5,
-4.507569, 0.129671, -7.160484, 0, 1.5, 0.5, 0.5
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
-4.507569, -4.322391, -0.199374, 0, -0.5, 0.5, 0.5,
-4.507569, -4.322391, -0.199374, 1, -0.5, 0.5, 0.5,
-4.507569, -4.322391, -0.199374, 1, 1.5, 0.5, 0.5,
-4.507569, -4.322391, -0.199374, 0, 1.5, 0.5, 0.5
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
-3, -3.294992, -5.554074,
2, -3.294992, -5.554074,
-3, -3.294992, -5.554074,
-3, -3.466225, -5.821809,
-2, -3.294992, -5.554074,
-2, -3.466225, -5.821809,
-1, -3.294992, -5.554074,
-1, -3.466225, -5.821809,
0, -3.294992, -5.554074,
0, -3.466225, -5.821809,
1, -3.294992, -5.554074,
1, -3.466225, -5.821809,
2, -3.294992, -5.554074,
2, -3.466225, -5.821809
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
-3, -3.808691, -6.357279, 0, -0.5, 0.5, 0.5,
-3, -3.808691, -6.357279, 1, -0.5, 0.5, 0.5,
-3, -3.808691, -6.357279, 1, 1.5, 0.5, 0.5,
-3, -3.808691, -6.357279, 0, 1.5, 0.5, 0.5,
-2, -3.808691, -6.357279, 0, -0.5, 0.5, 0.5,
-2, -3.808691, -6.357279, 1, -0.5, 0.5, 0.5,
-2, -3.808691, -6.357279, 1, 1.5, 0.5, 0.5,
-2, -3.808691, -6.357279, 0, 1.5, 0.5, 0.5,
-1, -3.808691, -6.357279, 0, -0.5, 0.5, 0.5,
-1, -3.808691, -6.357279, 1, -0.5, 0.5, 0.5,
-1, -3.808691, -6.357279, 1, 1.5, 0.5, 0.5,
-1, -3.808691, -6.357279, 0, 1.5, 0.5, 0.5,
0, -3.808691, -6.357279, 0, -0.5, 0.5, 0.5,
0, -3.808691, -6.357279, 1, -0.5, 0.5, 0.5,
0, -3.808691, -6.357279, 1, 1.5, 0.5, 0.5,
0, -3.808691, -6.357279, 0, 1.5, 0.5, 0.5,
1, -3.808691, -6.357279, 0, -0.5, 0.5, 0.5,
1, -3.808691, -6.357279, 1, -0.5, 0.5, 0.5,
1, -3.808691, -6.357279, 1, 1.5, 0.5, 0.5,
1, -3.808691, -6.357279, 0, 1.5, 0.5, 0.5,
2, -3.808691, -6.357279, 0, -0.5, 0.5, 0.5,
2, -3.808691, -6.357279, 1, -0.5, 0.5, 0.5,
2, -3.808691, -6.357279, 1, 1.5, 0.5, 0.5,
2, -3.808691, -6.357279, 0, 1.5, 0.5, 0.5
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
-3.531163, -3, -5.554074,
-3.531163, 3, -5.554074,
-3.531163, -3, -5.554074,
-3.693897, -3, -5.821809,
-3.531163, -2, -5.554074,
-3.693897, -2, -5.821809,
-3.531163, -1, -5.554074,
-3.693897, -1, -5.821809,
-3.531163, 0, -5.554074,
-3.693897, 0, -5.821809,
-3.531163, 1, -5.554074,
-3.693897, 1, -5.821809,
-3.531163, 2, -5.554074,
-3.693897, 2, -5.821809,
-3.531163, 3, -5.554074,
-3.693897, 3, -5.821809
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
-4.019366, -3, -6.357279, 0, -0.5, 0.5, 0.5,
-4.019366, -3, -6.357279, 1, -0.5, 0.5, 0.5,
-4.019366, -3, -6.357279, 1, 1.5, 0.5, 0.5,
-4.019366, -3, -6.357279, 0, 1.5, 0.5, 0.5,
-4.019366, -2, -6.357279, 0, -0.5, 0.5, 0.5,
-4.019366, -2, -6.357279, 1, -0.5, 0.5, 0.5,
-4.019366, -2, -6.357279, 1, 1.5, 0.5, 0.5,
-4.019366, -2, -6.357279, 0, 1.5, 0.5, 0.5,
-4.019366, -1, -6.357279, 0, -0.5, 0.5, 0.5,
-4.019366, -1, -6.357279, 1, -0.5, 0.5, 0.5,
-4.019366, -1, -6.357279, 1, 1.5, 0.5, 0.5,
-4.019366, -1, -6.357279, 0, 1.5, 0.5, 0.5,
-4.019366, 0, -6.357279, 0, -0.5, 0.5, 0.5,
-4.019366, 0, -6.357279, 1, -0.5, 0.5, 0.5,
-4.019366, 0, -6.357279, 1, 1.5, 0.5, 0.5,
-4.019366, 0, -6.357279, 0, 1.5, 0.5, 0.5,
-4.019366, 1, -6.357279, 0, -0.5, 0.5, 0.5,
-4.019366, 1, -6.357279, 1, -0.5, 0.5, 0.5,
-4.019366, 1, -6.357279, 1, 1.5, 0.5, 0.5,
-4.019366, 1, -6.357279, 0, 1.5, 0.5, 0.5,
-4.019366, 2, -6.357279, 0, -0.5, 0.5, 0.5,
-4.019366, 2, -6.357279, 1, -0.5, 0.5, 0.5,
-4.019366, 2, -6.357279, 1, 1.5, 0.5, 0.5,
-4.019366, 2, -6.357279, 0, 1.5, 0.5, 0.5,
-4.019366, 3, -6.357279, 0, -0.5, 0.5, 0.5,
-4.019366, 3, -6.357279, 1, -0.5, 0.5, 0.5,
-4.019366, 3, -6.357279, 1, 1.5, 0.5, 0.5,
-4.019366, 3, -6.357279, 0, 1.5, 0.5, 0.5
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
-3.531163, -3.294992, -4,
-3.531163, -3.294992, 4,
-3.531163, -3.294992, -4,
-3.693897, -3.466225, -4,
-3.531163, -3.294992, -2,
-3.693897, -3.466225, -2,
-3.531163, -3.294992, 0,
-3.693897, -3.466225, 0,
-3.531163, -3.294992, 2,
-3.693897, -3.466225, 2,
-3.531163, -3.294992, 4,
-3.693897, -3.466225, 4
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
-4.019366, -3.808691, -4, 0, -0.5, 0.5, 0.5,
-4.019366, -3.808691, -4, 1, -0.5, 0.5, 0.5,
-4.019366, -3.808691, -4, 1, 1.5, 0.5, 0.5,
-4.019366, -3.808691, -4, 0, 1.5, 0.5, 0.5,
-4.019366, -3.808691, -2, 0, -0.5, 0.5, 0.5,
-4.019366, -3.808691, -2, 1, -0.5, 0.5, 0.5,
-4.019366, -3.808691, -2, 1, 1.5, 0.5, 0.5,
-4.019366, -3.808691, -2, 0, 1.5, 0.5, 0.5,
-4.019366, -3.808691, 0, 0, -0.5, 0.5, 0.5,
-4.019366, -3.808691, 0, 1, -0.5, 0.5, 0.5,
-4.019366, -3.808691, 0, 1, 1.5, 0.5, 0.5,
-4.019366, -3.808691, 0, 0, 1.5, 0.5, 0.5,
-4.019366, -3.808691, 2, 0, -0.5, 0.5, 0.5,
-4.019366, -3.808691, 2, 1, -0.5, 0.5, 0.5,
-4.019366, -3.808691, 2, 1, 1.5, 0.5, 0.5,
-4.019366, -3.808691, 2, 0, 1.5, 0.5, 0.5,
-4.019366, -3.808691, 4, 0, -0.5, 0.5, 0.5,
-4.019366, -3.808691, 4, 1, -0.5, 0.5, 0.5,
-4.019366, -3.808691, 4, 1, 1.5, 0.5, 0.5,
-4.019366, -3.808691, 4, 0, 1.5, 0.5, 0.5
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
-3.531163, -3.294992, -5.554074,
-3.531163, 3.554334, -5.554074,
-3.531163, -3.294992, 5.155326,
-3.531163, 3.554334, 5.155326,
-3.531163, -3.294992, -5.554074,
-3.531163, -3.294992, 5.155326,
-3.531163, 3.554334, -5.554074,
-3.531163, 3.554334, 5.155326,
-3.531163, -3.294992, -5.554074,
2.978211, -3.294992, -5.554074,
-3.531163, -3.294992, 5.155326,
2.978211, -3.294992, 5.155326,
-3.531163, 3.554334, -5.554074,
2.978211, 3.554334, -5.554074,
-3.531163, 3.554334, 5.155326,
2.978211, 3.554334, 5.155326,
2.978211, -3.294992, -5.554074,
2.978211, 3.554334, -5.554074,
2.978211, -3.294992, 5.155326,
2.978211, 3.554334, 5.155326,
2.978211, -3.294992, -5.554074,
2.978211, -3.294992, 5.155326,
2.978211, 3.554334, -5.554074,
2.978211, 3.554334, 5.155326
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
var radius = 7.626328;
var distance = 33.93039;
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
mvMatrix.translate( 0.2764758, -0.129671, 0.199374 );
mvMatrix.scale( 1.266748, 1.203876, 0.7699531 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.93039);
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
chlorimuron_ethyl<-read.table("chlorimuron_ethyl.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-chlorimuron_ethyl$V2
```

```
## Error in eval(expr, envir, enclos): object 'chlorimuron_ethyl' not found
```

```r
y<-chlorimuron_ethyl$V3
```

```
## Error in eval(expr, envir, enclos): object 'chlorimuron_ethyl' not found
```

```r
z<-chlorimuron_ethyl$V4
```

```
## Error in eval(expr, envir, enclos): object 'chlorimuron_ethyl' not found
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
-3.436366, 1.749499, -0.4340322, 0, 0, 1, 1, 1,
-3.260197, -0.5635934, -0.5191747, 1, 0, 0, 1, 1,
-2.966197, 1.262857, -1.425079, 1, 0, 0, 1, 1,
-2.782558, 0.8599228, -0.8203094, 1, 0, 0, 1, 1,
-2.780358, -0.4268464, -1.100397, 1, 0, 0, 1, 1,
-2.759295, 0.3688317, 0.2557223, 1, 0, 0, 1, 1,
-2.646933, -0.1561537, -0.9958008, 0, 0, 0, 1, 1,
-2.504855, 1.756057, -2.470675, 0, 0, 0, 1, 1,
-2.500629, -0.5888349, -1.922289, 0, 0, 0, 1, 1,
-2.478472, 0.5483822, -1.746504, 0, 0, 0, 1, 1,
-2.341344, 0.4102302, -1.164643, 0, 0, 0, 1, 1,
-2.335971, 1.316374, -2.381533, 0, 0, 0, 1, 1,
-2.302471, -0.6720344, -2.145516, 0, 0, 0, 1, 1,
-2.301462, 0.3248055, -3.051669, 1, 1, 1, 1, 1,
-2.268791, -0.5981054, -0.8062941, 1, 1, 1, 1, 1,
-2.266558, -0.9553527, -0.7908372, 1, 1, 1, 1, 1,
-2.259438, 0.7117218, -0.5295238, 1, 1, 1, 1, 1,
-2.253868, 1.180557, -1.540756, 1, 1, 1, 1, 1,
-2.136493, -0.7506058, -1.085093, 1, 1, 1, 1, 1,
-2.101215, 0.01111849, -1.510926, 1, 1, 1, 1, 1,
-2.086852, 0.4480557, -1.033133, 1, 1, 1, 1, 1,
-2.075495, -0.9536227, -3.08507, 1, 1, 1, 1, 1,
-2.069388, -0.3516402, -1.71117, 1, 1, 1, 1, 1,
-2.018508, 0.1559342, -2.265024, 1, 1, 1, 1, 1,
-2.01421, -1.576683, -1.438599, 1, 1, 1, 1, 1,
-2.0139, 0.6520883, -2.637723, 1, 1, 1, 1, 1,
-1.969613, -1.188592, -3.293391, 1, 1, 1, 1, 1,
-1.96048, -0.6428307, -2.235864, 1, 1, 1, 1, 1,
-1.939262, -1.075819, -1.315522, 0, 0, 1, 1, 1,
-1.931712, -1.017343, -2.13732, 1, 0, 0, 1, 1,
-1.876995, 0.6727507, -1.043875, 1, 0, 0, 1, 1,
-1.836759, -0.9900237, -1.347585, 1, 0, 0, 1, 1,
-1.827441, -0.5835895, -1.491454, 1, 0, 0, 1, 1,
-1.8222, 1.26629, 0.04528066, 1, 0, 0, 1, 1,
-1.821912, 1.748305, -1.676782, 0, 0, 0, 1, 1,
-1.808246, -0.131038, -1.489, 0, 0, 0, 1, 1,
-1.794168, -0.23555, -0.5355088, 0, 0, 0, 1, 1,
-1.761223, -0.6167871, -3.564274, 0, 0, 0, 1, 1,
-1.757681, 0.3630612, -2.434651, 0, 0, 0, 1, 1,
-1.756585, 1.500129, -0.2135811, 0, 0, 0, 1, 1,
-1.747455, 0.2587524, -1.011765, 0, 0, 0, 1, 1,
-1.737996, 1.651495, 0.1712921, 1, 1, 1, 1, 1,
-1.735265, -1.578007, -2.902705, 1, 1, 1, 1, 1,
-1.727966, -0.08970797, -3.257782, 1, 1, 1, 1, 1,
-1.717543, 0.1741698, -1.233904, 1, 1, 1, 1, 1,
-1.715155, 1.624558, -0.9773024, 1, 1, 1, 1, 1,
-1.713453, 0.7106522, -0.543726, 1, 1, 1, 1, 1,
-1.700235, -0.4497195, -0.8515278, 1, 1, 1, 1, 1,
-1.682533, -0.255867, -2.041295, 1, 1, 1, 1, 1,
-1.681349, 0.8000714, -0.8320782, 1, 1, 1, 1, 1,
-1.678936, 0.8604497, -0.6156468, 1, 1, 1, 1, 1,
-1.672949, -0.8709626, -2.602276, 1, 1, 1, 1, 1,
-1.6668, -0.4268253, -2.726612, 1, 1, 1, 1, 1,
-1.665398, 1.102445, -2.093137, 1, 1, 1, 1, 1,
-1.657684, 0.2779088, -1.246585, 1, 1, 1, 1, 1,
-1.657057, 0.855771, -0.2576759, 1, 1, 1, 1, 1,
-1.655406, -0.4783394, -0.7412735, 0, 0, 1, 1, 1,
-1.646706, -0.5546057, -0.9674512, 1, 0, 0, 1, 1,
-1.594856, -0.5597914, -3.929647, 1, 0, 0, 1, 1,
-1.574849, -1.690747, -2.375742, 1, 0, 0, 1, 1,
-1.564394, -0.901047, -2.351968, 1, 0, 0, 1, 1,
-1.53771, -0.891179, -1.16786, 1, 0, 0, 1, 1,
-1.530322, 0.4354112, -1.59614, 0, 0, 0, 1, 1,
-1.529681, 1.12776, -0.2121598, 0, 0, 0, 1, 1,
-1.522765, -0.4481228, -2.548287, 0, 0, 0, 1, 1,
-1.517896, 0.09275983, -1.173654, 0, 0, 0, 1, 1,
-1.492845, 0.2653855, -0.7899194, 0, 0, 0, 1, 1,
-1.483144, -2.560216, -1.293213, 0, 0, 0, 1, 1,
-1.479807, 1.23001, -1.073093, 0, 0, 0, 1, 1,
-1.477151, -1.288809, -1.131362, 1, 1, 1, 1, 1,
-1.474235, 1.606578, -1.722953, 1, 1, 1, 1, 1,
-1.471079, 1.091763, -0.5643565, 1, 1, 1, 1, 1,
-1.46078, 2.542029, -0.8840411, 1, 1, 1, 1, 1,
-1.453175, -0.1532346, -2.730652, 1, 1, 1, 1, 1,
-1.450899, -0.8349633, -1.722301, 1, 1, 1, 1, 1,
-1.427607, -0.9920242, -1.601091, 1, 1, 1, 1, 1,
-1.41992, 0.6578658, -0.8650584, 1, 1, 1, 1, 1,
-1.406345, 0.6023882, -0.945166, 1, 1, 1, 1, 1,
-1.404451, 0.2670278, -0.3475393, 1, 1, 1, 1, 1,
-1.40409, -0.8146961, -0.9676038, 1, 1, 1, 1, 1,
-1.403702, -1.432283, -2.634529, 1, 1, 1, 1, 1,
-1.394581, -0.6005492, -1.228491, 1, 1, 1, 1, 1,
-1.3904, -0.8058541, -0.2885435, 1, 1, 1, 1, 1,
-1.38457, 1.457551, -1.188342, 1, 1, 1, 1, 1,
-1.378758, 1.002498, -0.3775905, 0, 0, 1, 1, 1,
-1.378718, -0.8304183, -1.756121, 1, 0, 0, 1, 1,
-1.372268, -0.03560419, 0.1795458, 1, 0, 0, 1, 1,
-1.368116, -0.3916148, -2.005774, 1, 0, 0, 1, 1,
-1.362557, 0.1629118, -1.870798, 1, 0, 0, 1, 1,
-1.358515, 0.2722702, -1.18711, 1, 0, 0, 1, 1,
-1.357938, 1.422886, 0.9914002, 0, 0, 0, 1, 1,
-1.35283, -0.005016677, -0.6323519, 0, 0, 0, 1, 1,
-1.326584, -0.4254924, -1.376672, 0, 0, 0, 1, 1,
-1.323605, -0.7027731, -2.428333, 0, 0, 0, 1, 1,
-1.323315, 1.514134, -1.292106, 0, 0, 0, 1, 1,
-1.320499, -1.232602, -3.539357, 0, 0, 0, 1, 1,
-1.318052, 2.172283, -0.5013555, 0, 0, 0, 1, 1,
-1.317758, -0.8152428, -1.559177, 1, 1, 1, 1, 1,
-1.306776, -0.302748, -0.9781133, 1, 1, 1, 1, 1,
-1.300864, -1.311774, -1.843854, 1, 1, 1, 1, 1,
-1.295551, -0.2264617, -1.099386, 1, 1, 1, 1, 1,
-1.291277, 1.384178, 1.197329, 1, 1, 1, 1, 1,
-1.286639, -0.2209716, -1.226476, 1, 1, 1, 1, 1,
-1.279285, -1.663556, -3.142798, 1, 1, 1, 1, 1,
-1.272335, -0.2623792, -2.322536, 1, 1, 1, 1, 1,
-1.269361, -0.6161484, -2.645925, 1, 1, 1, 1, 1,
-1.265847, -0.5788152, -1.151463, 1, 1, 1, 1, 1,
-1.253937, 1.068249, -1.453317, 1, 1, 1, 1, 1,
-1.253829, -1.409752, -3.157347, 1, 1, 1, 1, 1,
-1.245743, 1.10871, -1.019956, 1, 1, 1, 1, 1,
-1.243087, 1.604137, 1.622502, 1, 1, 1, 1, 1,
-1.242333, -1.068562, -3.230168, 1, 1, 1, 1, 1,
-1.238414, 0.3858756, -1.896984, 0, 0, 1, 1, 1,
-1.222632, -0.4530227, -1.772274, 1, 0, 0, 1, 1,
-1.213448, -1.243949, -3.00984, 1, 0, 0, 1, 1,
-1.211127, 0.8797615, -0.1391212, 1, 0, 0, 1, 1,
-1.19581, -0.5542018, -1.310589, 1, 0, 0, 1, 1,
-1.193748, -0.4272013, -1.08708, 1, 0, 0, 1, 1,
-1.19321, -1.994472, -2.273936, 0, 0, 0, 1, 1,
-1.185599, 0.1533352, -2.082984, 0, 0, 0, 1, 1,
-1.182979, -0.1279672, -1.260788, 0, 0, 0, 1, 1,
-1.18251, -0.3439235, -0.1742508, 0, 0, 0, 1, 1,
-1.181054, 0.4198421, -0.9084264, 0, 0, 0, 1, 1,
-1.169181, 1.926753, 0.2531412, 0, 0, 0, 1, 1,
-1.161139, -0.08672322, -2.79774, 0, 0, 0, 1, 1,
-1.159375, 0.3889031, -1.06379, 1, 1, 1, 1, 1,
-1.14779, 0.008502782, -1.208531, 1, 1, 1, 1, 1,
-1.143406, 0.02190458, -2.094816, 1, 1, 1, 1, 1,
-1.142737, 0.02001596, 0.192507, 1, 1, 1, 1, 1,
-1.137513, 0.9939047, -1.489336, 1, 1, 1, 1, 1,
-1.133522, -1.209015, -3.334132, 1, 1, 1, 1, 1,
-1.126329, -0.7082538, -2.502948, 1, 1, 1, 1, 1,
-1.124445, -0.4740238, -2.099803, 1, 1, 1, 1, 1,
-1.113473, -0.9014503, -3.710248, 1, 1, 1, 1, 1,
-1.108277, 0.830347, 0.6493241, 1, 1, 1, 1, 1,
-1.104519, 0.1350247, -1.423869, 1, 1, 1, 1, 1,
-1.104264, -0.2461352, -2.064327, 1, 1, 1, 1, 1,
-1.095231, 0.3328151, -1.011728, 1, 1, 1, 1, 1,
-1.090985, -0.6166998, -1.503537, 1, 1, 1, 1, 1,
-1.079958, 0.05897268, -1.667026, 1, 1, 1, 1, 1,
-1.077697, -1.021308, -1.844599, 0, 0, 1, 1, 1,
-1.070818, -0.1398216, -2.009917, 1, 0, 0, 1, 1,
-1.060992, 0.413621, -0.997344, 1, 0, 0, 1, 1,
-1.057649, -2.435266, -1.979066, 1, 0, 0, 1, 1,
-1.056208, -1.480268, -2.195309, 1, 0, 0, 1, 1,
-1.051545, 0.47838, -1.067382, 1, 0, 0, 1, 1,
-1.046535, -0.8609622, -3.577548, 0, 0, 0, 1, 1,
-1.042299, -1.629626, -1.700682, 0, 0, 0, 1, 1,
-1.041273, 0.638499, -2.648881, 0, 0, 0, 1, 1,
-1.035452, -1.15617, -2.358279, 0, 0, 0, 1, 1,
-1.033307, -0.8939333, -4.545992, 0, 0, 0, 1, 1,
-1.030979, 0.1399844, -0.3980702, 0, 0, 0, 1, 1,
-1.030186, -1.123087, -2.6672, 0, 0, 0, 1, 1,
-1.02486, 0.1229354, -1.570589, 1, 1, 1, 1, 1,
-1.021474, -0.2793125, -3.319178, 1, 1, 1, 1, 1,
-1.020028, -0.5757601, -3.682377, 1, 1, 1, 1, 1,
-1.001139, 0.5608492, -1.340771, 1, 1, 1, 1, 1,
-0.9962366, -0.08404661, -3.179989, 1, 1, 1, 1, 1,
-0.994265, -0.1506532, -1.953963, 1, 1, 1, 1, 1,
-0.9896106, 0.950153, -2.301167, 1, 1, 1, 1, 1,
-0.9854603, -0.01727893, -0.464359, 1, 1, 1, 1, 1,
-0.9832852, -0.3518776, -1.655704, 1, 1, 1, 1, 1,
-0.9685074, -1.902646, -4.006053, 1, 1, 1, 1, 1,
-0.9683878, 2.645377, -0.4456918, 1, 1, 1, 1, 1,
-0.967231, -0.6456948, -0.5360121, 1, 1, 1, 1, 1,
-0.95745, 0.6342539, 0.2663296, 1, 1, 1, 1, 1,
-0.9572527, -0.8811201, -3.042281, 1, 1, 1, 1, 1,
-0.9551167, 0.4733156, -2.497521, 1, 1, 1, 1, 1,
-0.948397, 0.1565456, -0.4796007, 0, 0, 1, 1, 1,
-0.9407815, -1.145509, -1.980435, 1, 0, 0, 1, 1,
-0.9407557, -0.3166288, -1.894961, 1, 0, 0, 1, 1,
-0.9394484, 0.1905694, -0.9430707, 1, 0, 0, 1, 1,
-0.9365184, -1.173233, -0.6522326, 1, 0, 0, 1, 1,
-0.9338285, 0.4253008, -2.165887, 1, 0, 0, 1, 1,
-0.9273626, 0.8078986, -2.59514, 0, 0, 0, 1, 1,
-0.9178916, 0.05521856, -1.282898, 0, 0, 0, 1, 1,
-0.9154764, -1.168336, -1.462243, 0, 0, 0, 1, 1,
-0.9073283, -0.3784342, -0.2978939, 0, 0, 0, 1, 1,
-0.8969358, -1.025998, -3.447594, 0, 0, 0, 1, 1,
-0.8946502, -1.364538, -1.44282, 0, 0, 0, 1, 1,
-0.8929444, 0.3424743, 0.1800945, 0, 0, 0, 1, 1,
-0.8924728, -0.7762269, -2.050394, 1, 1, 1, 1, 1,
-0.8911858, 0.1743449, 0.1321752, 1, 1, 1, 1, 1,
-0.8872771, 0.3574259, 0.7950765, 1, 1, 1, 1, 1,
-0.8849166, -1.282101, -2.785806, 1, 1, 1, 1, 1,
-0.8806305, 1.710829, -0.4311932, 1, 1, 1, 1, 1,
-0.880371, -0.1079781, -2.157681, 1, 1, 1, 1, 1,
-0.8783814, -0.1679668, -2.038156, 1, 1, 1, 1, 1,
-0.8782614, 0.9534772, 0.3716848, 1, 1, 1, 1, 1,
-0.8769417, -0.3033219, -1.707871, 1, 1, 1, 1, 1,
-0.8698037, -0.03860183, -2.18364, 1, 1, 1, 1, 1,
-0.8689196, -1.044911, -1.551454, 1, 1, 1, 1, 1,
-0.8660682, -0.8571741, -2.241055, 1, 1, 1, 1, 1,
-0.8538015, -0.2408422, -2.315109, 1, 1, 1, 1, 1,
-0.8468378, 1.001903, -1.011567, 1, 1, 1, 1, 1,
-0.8448328, -0.2063804, -2.572972, 1, 1, 1, 1, 1,
-0.8443098, -1.740851, -0.9595683, 0, 0, 1, 1, 1,
-0.8345739, -1.069217, -2.737158, 1, 0, 0, 1, 1,
-0.8320249, 0.2353265, -2.444986, 1, 0, 0, 1, 1,
-0.8297465, 0.434605, -1.518761, 1, 0, 0, 1, 1,
-0.8194207, -1.151949, -0.9392737, 1, 0, 0, 1, 1,
-0.8147352, -1.320146, -2.112031, 1, 0, 0, 1, 1,
-0.8112389, -1.461369, -3.876431, 0, 0, 0, 1, 1,
-0.8092293, 0.7307365, -1.473681, 0, 0, 0, 1, 1,
-0.8091382, 0.958202, -0.6156731, 0, 0, 0, 1, 1,
-0.7950884, 0.3286788, -2.089228, 0, 0, 0, 1, 1,
-0.7910911, 2.032241, -1.453173, 0, 0, 0, 1, 1,
-0.7903278, -0.7633752, -1.579183, 0, 0, 0, 1, 1,
-0.7834823, 0.8557249, -2.512254, 0, 0, 0, 1, 1,
-0.7774768, -0.6355264, -3.002475, 1, 1, 1, 1, 1,
-0.772443, -0.0001323804, -0.9026699, 1, 1, 1, 1, 1,
-0.7692548, -0.2876241, -1.868782, 1, 1, 1, 1, 1,
-0.7634749, -1.343784, -3.855629, 1, 1, 1, 1, 1,
-0.7582624, -0.4212598, -1.338563, 1, 1, 1, 1, 1,
-0.7572299, -0.8079858, -2.071295, 1, 1, 1, 1, 1,
-0.7561177, 1.139291, 0.2651282, 1, 1, 1, 1, 1,
-0.7520886, 0.2570857, -0.7611613, 1, 1, 1, 1, 1,
-0.751828, 2.099608, 0.6207901, 1, 1, 1, 1, 1,
-0.7477748, -0.576149, -0.718501, 1, 1, 1, 1, 1,
-0.7461585, 1.248919, -2.54828, 1, 1, 1, 1, 1,
-0.735316, 1.574691, -0.6268308, 1, 1, 1, 1, 1,
-0.7335208, -0.6713516, -1.322509, 1, 1, 1, 1, 1,
-0.7330119, 0.01909654, -1.929388, 1, 1, 1, 1, 1,
-0.732266, 0.8253646, -2.067174, 1, 1, 1, 1, 1,
-0.7320113, 0.8107578, -1.921654, 0, 0, 1, 1, 1,
-0.7314308, 0.9747217, -1.106737, 1, 0, 0, 1, 1,
-0.7312815, -1.013109, -2.813183, 1, 0, 0, 1, 1,
-0.7312138, -0.1318904, -2.393955, 1, 0, 0, 1, 1,
-0.7271959, -0.4579711, -2.570368, 1, 0, 0, 1, 1,
-0.7253333, 0.1963852, -1.688562, 1, 0, 0, 1, 1,
-0.7251475, 1.611887, -1.250887, 0, 0, 0, 1, 1,
-0.7206835, -0.1970537, -2.205547, 0, 0, 0, 1, 1,
-0.7174246, 0.2627477, -1.347395, 0, 0, 0, 1, 1,
-0.7162247, -0.6860718, -1.448165, 0, 0, 0, 1, 1,
-0.7119684, 3.454586, 0.5413756, 0, 0, 0, 1, 1,
-0.7081661, 0.9385282, -0.6075006, 0, 0, 0, 1, 1,
-0.7035134, -0.8553744, -2.201118, 0, 0, 0, 1, 1,
-0.6917719, -1.5523, -2.577578, 1, 1, 1, 1, 1,
-0.6828908, 1.030508, 0.3763152, 1, 1, 1, 1, 1,
-0.6827328, -0.6171449, -1.10866, 1, 1, 1, 1, 1,
-0.6770665, 0.3975499, -0.65888, 1, 1, 1, 1, 1,
-0.6759054, -0.4213146, -1.333654, 1, 1, 1, 1, 1,
-0.6739856, -1.096514, -2.372297, 1, 1, 1, 1, 1,
-0.673721, 0.7730291, -0.4831501, 1, 1, 1, 1, 1,
-0.6717112, -0.007432085, -1.760291, 1, 1, 1, 1, 1,
-0.6712244, 1.560951, 0.5560136, 1, 1, 1, 1, 1,
-0.6700583, 1.28696, -0.6480695, 1, 1, 1, 1, 1,
-0.6623899, -1.600634, -1.679685, 1, 1, 1, 1, 1,
-0.6583371, 0.4847943, 0.6152795, 1, 1, 1, 1, 1,
-0.6551022, 0.2708143, -0.1077249, 1, 1, 1, 1, 1,
-0.6544487, 0.2877304, -0.4105512, 1, 1, 1, 1, 1,
-0.653222, 1.406631, 0.5539755, 1, 1, 1, 1, 1,
-0.6527412, 0.2482567, -0.5522139, 0, 0, 1, 1, 1,
-0.6462646, 0.2823189, -1.14083, 1, 0, 0, 1, 1,
-0.6428474, 0.4052024, 2.256039, 1, 0, 0, 1, 1,
-0.6390606, 1.493481, -0.8519472, 1, 0, 0, 1, 1,
-0.6368313, 0.3572694, 0.1347707, 1, 0, 0, 1, 1,
-0.6366373, 1.705012, -2.713366, 1, 0, 0, 1, 1,
-0.6365815, 1.006839, -0.5340548, 0, 0, 0, 1, 1,
-0.6349354, 0.3355143, 0.2574772, 0, 0, 0, 1, 1,
-0.6340917, 0.6489059, -0.4545373, 0, 0, 0, 1, 1,
-0.6326903, -0.3963166, -3.104689, 0, 0, 0, 1, 1,
-0.6322343, 0.8155438, -1.939162, 0, 0, 0, 1, 1,
-0.6317057, -2.001913, -3.839292, 0, 0, 0, 1, 1,
-0.6310121, 0.9448065, -0.8088567, 0, 0, 0, 1, 1,
-0.6286742, 0.4011395, -1.185068, 1, 1, 1, 1, 1,
-0.6246372, -0.6963964, -2.526524, 1, 1, 1, 1, 1,
-0.6195192, 1.206889, -2.366729, 1, 1, 1, 1, 1,
-0.6150088, 0.3742624, -2.170446, 1, 1, 1, 1, 1,
-0.6145681, -0.6475124, -4.376329, 1, 1, 1, 1, 1,
-0.6037837, -1.158442, -4.97959, 1, 1, 1, 1, 1,
-0.5986528, 0.220836, -2.016878, 1, 1, 1, 1, 1,
-0.5972438, 1.868657, -0.377044, 1, 1, 1, 1, 1,
-0.5942615, 0.6018541, -1.109536, 1, 1, 1, 1, 1,
-0.5927519, -0.2352106, 0.07645317, 1, 1, 1, 1, 1,
-0.5906029, 0.3563544, -0.6956741, 1, 1, 1, 1, 1,
-0.5843906, 0.2624283, -1.022856, 1, 1, 1, 1, 1,
-0.5830675, 0.909537, -0.8130823, 1, 1, 1, 1, 1,
-0.5806409, -0.6264542, -0.9851167, 1, 1, 1, 1, 1,
-0.5768886, -0.0832692, -1.914935, 1, 1, 1, 1, 1,
-0.5734724, 0.2389167, -0.13925, 0, 0, 1, 1, 1,
-0.5713227, 1.312101, -0.4038685, 1, 0, 0, 1, 1,
-0.5698074, 1.00507, 0.06560352, 1, 0, 0, 1, 1,
-0.5697923, -1.649827, -2.51928, 1, 0, 0, 1, 1,
-0.5693786, -0.7117645, -2.365167, 1, 0, 0, 1, 1,
-0.5684184, -0.3766645, -2.994031, 1, 0, 0, 1, 1,
-0.5662663, 0.4719363, -1.823965, 0, 0, 0, 1, 1,
-0.5655199, 2.282216, -0.3563307, 0, 0, 0, 1, 1,
-0.5650425, -1.424607, -2.126686, 0, 0, 0, 1, 1,
-0.555752, -0.3100724, -2.867975, 0, 0, 0, 1, 1,
-0.5496496, -0.7652839, -2.872332, 0, 0, 0, 1, 1,
-0.5495997, -0.1634354, -1.628503, 0, 0, 0, 1, 1,
-0.5462704, -0.6339635, -2.296569, 0, 0, 0, 1, 1,
-0.5432286, 1.268039, -0.9616436, 1, 1, 1, 1, 1,
-0.543183, 0.8195563, -0.814344, 1, 1, 1, 1, 1,
-0.5398432, -1.219985, -3.613105, 1, 1, 1, 1, 1,
-0.5374082, 0.3304898, 0.1866297, 1, 1, 1, 1, 1,
-0.53717, 0.8328481, 1.803524, 1, 1, 1, 1, 1,
-0.5341172, -0.5329881, -1.241771, 1, 1, 1, 1, 1,
-0.5341132, 1.718313, -0.9380005, 1, 1, 1, 1, 1,
-0.5330329, -0.745133, -2.736342, 1, 1, 1, 1, 1,
-0.5317349, 0.4943722, -2.252971, 1, 1, 1, 1, 1,
-0.5307745, -0.2932168, -1.995085, 1, 1, 1, 1, 1,
-0.5293175, -0.2590826, -3.702313, 1, 1, 1, 1, 1,
-0.526009, -1.397607, -2.257532, 1, 1, 1, 1, 1,
-0.5220129, 0.7837368, -0.4595421, 1, 1, 1, 1, 1,
-0.5186861, -0.2228211, -1.828226, 1, 1, 1, 1, 1,
-0.5144916, -2.079008, -2.781641, 1, 1, 1, 1, 1,
-0.5130928, 0.8131064, 1.208442, 0, 0, 1, 1, 1,
-0.5120322, -0.4725225, -1.203133, 1, 0, 0, 1, 1,
-0.5104129, -0.2075527, -2.682408, 1, 0, 0, 1, 1,
-0.5098715, 1.164936, -0.9699045, 1, 0, 0, 1, 1,
-0.5090061, -0.1725578, -0.6733657, 1, 0, 0, 1, 1,
-0.5063607, -1.039009, -2.178699, 1, 0, 0, 1, 1,
-0.5053584, 0.3177284, -0.04645272, 0, 0, 0, 1, 1,
-0.5021738, 0.2453498, -0.698827, 0, 0, 0, 1, 1,
-0.4993953, -1.10544, -3.655291, 0, 0, 0, 1, 1,
-0.4979079, -1.263863, -2.341831, 0, 0, 0, 1, 1,
-0.4908474, 1.961836, -0.2273877, 0, 0, 0, 1, 1,
-0.4902592, -0.2724079, -2.870873, 0, 0, 0, 1, 1,
-0.4901915, 0.3340816, -0.565823, 0, 0, 0, 1, 1,
-0.489891, -1.336858, -3.909656, 1, 1, 1, 1, 1,
-0.4867369, 0.1203871, -0.3355536, 1, 1, 1, 1, 1,
-0.48351, -1.093993, -1.945569, 1, 1, 1, 1, 1,
-0.4821602, -1.480582, -3.732737, 1, 1, 1, 1, 1,
-0.4792117, 0.01298238, -2.234805, 1, 1, 1, 1, 1,
-0.4754102, 1.222488, -0.625334, 1, 1, 1, 1, 1,
-0.4694192, 0.8379657, -0.8535514, 1, 1, 1, 1, 1,
-0.4683431, 2.017569, -0.3259717, 1, 1, 1, 1, 1,
-0.4639454, 1.117478, 0.5320032, 1, 1, 1, 1, 1,
-0.4596942, -0.4219951, -3.020554, 1, 1, 1, 1, 1,
-0.4590594, -0.8781137, -3.025458, 1, 1, 1, 1, 1,
-0.4572297, 0.158609, -1.580439, 1, 1, 1, 1, 1,
-0.4555371, 0.4005354, -2.509368, 1, 1, 1, 1, 1,
-0.4549341, -1.005399, -2.739708, 1, 1, 1, 1, 1,
-0.4434427, 2.825974, 0.6266083, 1, 1, 1, 1, 1,
-0.4389274, -0.5837888, -2.582449, 0, 0, 1, 1, 1,
-0.4379793, 0.2470295, -0.8635084, 1, 0, 0, 1, 1,
-0.4295061, 0.6779165, 0.8752386, 1, 0, 0, 1, 1,
-0.4288913, -0.3262059, -3.366226, 1, 0, 0, 1, 1,
-0.4281653, -1.702178, -1.442663, 1, 0, 0, 1, 1,
-0.4258893, -1.234129, -3.757857, 1, 0, 0, 1, 1,
-0.4258525, -1.41975, -2.470152, 0, 0, 0, 1, 1,
-0.4258277, 1.128857, -1.510198, 0, 0, 0, 1, 1,
-0.4200925, 1.39318, -1.446422, 0, 0, 0, 1, 1,
-0.4174001, -0.002736014, -0.9567149, 0, 0, 0, 1, 1,
-0.4153754, -1.884414, -3.35305, 0, 0, 0, 1, 1,
-0.4145892, 0.8737781, -1.940283, 0, 0, 0, 1, 1,
-0.4090265, -0.03117352, 0.3332172, 0, 0, 0, 1, 1,
-0.4041648, -1.028232, -3.391031, 1, 1, 1, 1, 1,
-0.4037828, -3.070591, -3.989319, 1, 1, 1, 1, 1,
-0.3991077, -0.3241082, -1.087739, 1, 1, 1, 1, 1,
-0.3958404, -0.2448551, -2.808718, 1, 1, 1, 1, 1,
-0.3923715, -0.5887388, -2.791926, 1, 1, 1, 1, 1,
-0.3922412, -0.8693826, -0.8738107, 1, 1, 1, 1, 1,
-0.3907325, -0.07043362, -2.34656, 1, 1, 1, 1, 1,
-0.3880736, -0.1507687, -2.070001, 1, 1, 1, 1, 1,
-0.3862495, 0.3646795, -0.4206988, 1, 1, 1, 1, 1,
-0.3707793, 0.2219673, -1.70208, 1, 1, 1, 1, 1,
-0.3692684, 1.252671, -1.203169, 1, 1, 1, 1, 1,
-0.365673, 0.7656958, -0.7768582, 1, 1, 1, 1, 1,
-0.3619685, 0.6670539, 1.496701, 1, 1, 1, 1, 1,
-0.3619063, -0.0002942768, 0.10495, 1, 1, 1, 1, 1,
-0.3556585, 1.861857, 0.8105115, 1, 1, 1, 1, 1,
-0.3542279, 0.1904256, 0.4062765, 0, 0, 1, 1, 1,
-0.3507008, 0.4888564, -0.2414646, 1, 0, 0, 1, 1,
-0.3484358, 0.5662896, -0.5338686, 1, 0, 0, 1, 1,
-0.3473598, 1.204693, -0.9630467, 1, 0, 0, 1, 1,
-0.3457268, -0.1165314, -1.471379, 1, 0, 0, 1, 1,
-0.3455729, 0.04622599, -1.183205, 1, 0, 0, 1, 1,
-0.3449957, -0.9402732, -2.905999, 0, 0, 0, 1, 1,
-0.3436753, 0.2894621, -1.694004, 0, 0, 0, 1, 1,
-0.3432902, 1.878844, -0.04560927, 0, 0, 0, 1, 1,
-0.3432507, 1.183182, -1.326872, 0, 0, 0, 1, 1,
-0.3388443, 0.6428492, -0.6934267, 0, 0, 0, 1, 1,
-0.3386107, 0.08006112, -0.547428, 0, 0, 0, 1, 1,
-0.3366928, -1.831175, -2.138108, 0, 0, 0, 1, 1,
-0.3355746, -0.08845081, -2.373217, 1, 1, 1, 1, 1,
-0.3352223, -0.107593, -1.733397, 1, 1, 1, 1, 1,
-0.3352081, 0.6547672, 0.09213624, 1, 1, 1, 1, 1,
-0.3334265, -1.846357, -3.300016, 1, 1, 1, 1, 1,
-0.3291575, -1.851295, -2.005589, 1, 1, 1, 1, 1,
-0.3270445, 0.1535697, -0.7498611, 1, 1, 1, 1, 1,
-0.3261516, 0.8344315, -1.081851, 1, 1, 1, 1, 1,
-0.3243468, -0.4201373, -4.613006, 1, 1, 1, 1, 1,
-0.3239769, -0.4024723, -3.991652, 1, 1, 1, 1, 1,
-0.3222593, 0.5527155, -0.2536241, 1, 1, 1, 1, 1,
-0.3199997, -1.393463, -2.189822, 1, 1, 1, 1, 1,
-0.3195774, -1.655125, -3.966611, 1, 1, 1, 1, 1,
-0.3187226, -0.8938301, -4.992776, 1, 1, 1, 1, 1,
-0.3106931, -1.158113, -0.8637092, 1, 1, 1, 1, 1,
-0.3089387, -0.1326286, -1.5191, 1, 1, 1, 1, 1,
-0.3054246, 1.132935, -0.478958, 0, 0, 1, 1, 1,
-0.3028006, 1.471201, 0.5053957, 1, 0, 0, 1, 1,
-0.3022788, 1.245064, -1.166875, 1, 0, 0, 1, 1,
-0.300274, 0.4284444, -0.5430233, 1, 0, 0, 1, 1,
-0.296535, -0.8641437, -3.523309, 1, 0, 0, 1, 1,
-0.294299, -0.1299533, -1.317196, 1, 0, 0, 1, 1,
-0.2936944, 0.0232197, -2.021458, 0, 0, 0, 1, 1,
-0.2911885, -0.1074934, -1.988908, 0, 0, 0, 1, 1,
-0.2909109, 0.8770332, -1.036081, 0, 0, 0, 1, 1,
-0.2873335, 0.3205312, -0.4229928, 0, 0, 0, 1, 1,
-0.2799414, 0.2450597, -0.5068738, 0, 0, 0, 1, 1,
-0.2799188, -0.1317969, -2.12188, 0, 0, 0, 1, 1,
-0.2760554, -0.4875375, -4.361406, 0, 0, 0, 1, 1,
-0.2759857, -0.8257579, -2.754586, 1, 1, 1, 1, 1,
-0.2728586, -1.008341, -0.6243213, 1, 1, 1, 1, 1,
-0.2728477, -0.3228917, -3.260368, 1, 1, 1, 1, 1,
-0.2719768, -0.08046889, -0.2156061, 1, 1, 1, 1, 1,
-0.2707241, 0.6312193, -0.7121263, 1, 1, 1, 1, 1,
-0.2692442, 1.124948, -0.2262101, 1, 1, 1, 1, 1,
-0.2680613, 0.1064452, -0.3685725, 1, 1, 1, 1, 1,
-0.2614368, -1.068854, -2.238038, 1, 1, 1, 1, 1,
-0.2570049, 1.028564, -1.11584, 1, 1, 1, 1, 1,
-0.2538016, 0.4478333, -1.126405, 1, 1, 1, 1, 1,
-0.248509, -0.9423178, -2.880118, 1, 1, 1, 1, 1,
-0.248369, -1.136129, -1.531331, 1, 1, 1, 1, 1,
-0.2419978, -0.7614179, -2.61736, 1, 1, 1, 1, 1,
-0.240961, 0.4586007, -2.319335, 1, 1, 1, 1, 1,
-0.2402683, 1.861176, -1.38575, 1, 1, 1, 1, 1,
-0.2381092, -0.02635858, -0.9550657, 0, 0, 1, 1, 1,
-0.2323512, -0.2360396, -2.200999, 1, 0, 0, 1, 1,
-0.231265, -0.6362971, -4.502936, 1, 0, 0, 1, 1,
-0.2265525, -0.2803456, -2.383288, 1, 0, 0, 1, 1,
-0.2264405, 0.2114638, -0.7240096, 1, 0, 0, 1, 1,
-0.2219367, -0.3930451, -2.428173, 1, 0, 0, 1, 1,
-0.2112569, 1.608342, 0.2926302, 0, 0, 0, 1, 1,
-0.2079217, 0.5220531, 0.4472391, 0, 0, 0, 1, 1,
-0.2062518, 0.02340091, -1.377221, 0, 0, 0, 1, 1,
-0.2042451, -0.4332814, -1.094731, 0, 0, 0, 1, 1,
-0.2036698, 1.229957, 1.036771, 0, 0, 0, 1, 1,
-0.20265, -0.01424178, -0.6220234, 0, 0, 0, 1, 1,
-0.2000079, -1.441645, -1.127743, 0, 0, 0, 1, 1,
-0.1900497, -0.495764, -2.79855, 1, 1, 1, 1, 1,
-0.1895388, -1.031729, -2.359568, 1, 1, 1, 1, 1,
-0.1864897, 0.1956287, -2.369176, 1, 1, 1, 1, 1,
-0.1833783, 0.07693116, -1.821171, 1, 1, 1, 1, 1,
-0.1817131, 0.05166653, 0.7617514, 1, 1, 1, 1, 1,
-0.18068, 0.6370777, -1.129952, 1, 1, 1, 1, 1,
-0.1806166, -1.309436, -3.711585, 1, 1, 1, 1, 1,
-0.1799843, 1.082256, 0.2478857, 1, 1, 1, 1, 1,
-0.1793042, 0.6240224, -0.8878568, 1, 1, 1, 1, 1,
-0.1747318, 0.3151396, -1.005873, 1, 1, 1, 1, 1,
-0.1648488, -0.01117359, -3.294956, 1, 1, 1, 1, 1,
-0.1648087, 1.493118, 0.7355779, 1, 1, 1, 1, 1,
-0.1576932, -0.4207554, -2.044175, 1, 1, 1, 1, 1,
-0.157204, -0.06665752, -1.359376, 1, 1, 1, 1, 1,
-0.1541139, 1.068445, -2.078125, 1, 1, 1, 1, 1,
-0.1461644, -0.2203689, -4.643497, 0, 0, 1, 1, 1,
-0.1458928, 0.7607303, 1.080789, 1, 0, 0, 1, 1,
-0.1417135, 1.126742, -0.4455022, 1, 0, 0, 1, 1,
-0.1407804, 1.051322, 0.0357383, 1, 0, 0, 1, 1,
-0.1399345, -0.3794835, -4.542196, 1, 0, 0, 1, 1,
-0.1369182, 0.5363357, -0.3253822, 1, 0, 0, 1, 1,
-0.1322015, -0.04831817, -0.8063827, 0, 0, 0, 1, 1,
-0.1309668, -0.02109909, -1.380873, 0, 0, 0, 1, 1,
-0.1283751, -0.5563622, -1.2286, 0, 0, 0, 1, 1,
-0.1269101, -0.0143227, -2.673208, 0, 0, 0, 1, 1,
-0.1247391, -0.5811041, -5.398112, 0, 0, 0, 1, 1,
-0.1242937, -1.984976, -2.81319, 0, 0, 0, 1, 1,
-0.1191065, -0.2183514, -2.701712, 0, 0, 0, 1, 1,
-0.1115879, 0.08979977, -1.533158, 1, 1, 1, 1, 1,
-0.107629, -0.9051114, -2.018531, 1, 1, 1, 1, 1,
-0.1038221, 1.239612, -0.4459938, 1, 1, 1, 1, 1,
-0.1026927, 0.0373361, -2.104035, 1, 1, 1, 1, 1,
-0.09509944, 0.4254034, 0.6570411, 1, 1, 1, 1, 1,
-0.09379779, 0.06834479, -1.901479, 1, 1, 1, 1, 1,
-0.09282898, 0.8943416, -0.3928542, 1, 1, 1, 1, 1,
-0.0927254, 0.2277609, -1.949517, 1, 1, 1, 1, 1,
-0.08905594, 0.1909432, -0.819071, 1, 1, 1, 1, 1,
-0.08682445, 1.484941, -0.668954, 1, 1, 1, 1, 1,
-0.07810815, 0.3752053, 0.3076306, 1, 1, 1, 1, 1,
-0.0778546, 0.4449682, 1.212492, 1, 1, 1, 1, 1,
-0.07660405, -0.2741566, -3.227751, 1, 1, 1, 1, 1,
-0.07514037, -1.461193, -3.37136, 1, 1, 1, 1, 1,
-0.07333171, 1.052843, 0.6357822, 1, 1, 1, 1, 1,
-0.07002278, 1.444873, -0.3695991, 0, 0, 1, 1, 1,
-0.06873632, -0.4025291, -4.019003, 1, 0, 0, 1, 1,
-0.06650897, -0.009631476, 1.250271, 1, 0, 0, 1, 1,
-0.06533317, -0.19902, -1.009624, 1, 0, 0, 1, 1,
-0.06307309, -0.0850528, -2.449094, 1, 0, 0, 1, 1,
-0.06233139, 1.721028, 0.5598057, 1, 0, 0, 1, 1,
-0.05382292, -0.003902007, -1.354468, 0, 0, 0, 1, 1,
-0.05351102, 1.943502, -0.888318, 0, 0, 0, 1, 1,
-0.05345637, 0.3068322, 0.4877183, 0, 0, 0, 1, 1,
-0.05243471, -0.4136007, -3.730361, 0, 0, 0, 1, 1,
-0.05150121, 1.27717, -0.2862514, 0, 0, 0, 1, 1,
-0.05127963, -0.03120154, -1.02764, 0, 0, 0, 1, 1,
-0.05119571, -1.125684, -4.391686, 0, 0, 0, 1, 1,
-0.04535121, 0.3754192, -0.4331316, 1, 1, 1, 1, 1,
-0.04368315, -1.430002, -2.466931, 1, 1, 1, 1, 1,
-0.04308688, -0.148651, -5.105026, 1, 1, 1, 1, 1,
-0.03858428, -0.8145329, -3.085294, 1, 1, 1, 1, 1,
-0.03280157, -0.4724737, -2.277433, 1, 1, 1, 1, 1,
-0.03270533, 0.4363033, -0.7395308, 1, 1, 1, 1, 1,
-0.0308607, 1.453322, -0.209113, 1, 1, 1, 1, 1,
-0.02923528, -1.14817, -4.778033, 1, 1, 1, 1, 1,
-0.02732223, -0.1360956, -3.729011, 1, 1, 1, 1, 1,
-0.02340468, 0.01939929, -0.5887327, 1, 1, 1, 1, 1,
-0.02167211, 2.728095, -0.2116483, 1, 1, 1, 1, 1,
-0.01661984, 1.43857, -0.2148095, 1, 1, 1, 1, 1,
-0.01602314, 0.9358121, 1.73245, 1, 1, 1, 1, 1,
-0.01531433, -1.519395, -3.999297, 1, 1, 1, 1, 1,
-0.01074519, 2.313922, 0.7407929, 1, 1, 1, 1, 1,
-0.01031309, -0.2465583, -3.569338, 0, 0, 1, 1, 1,
-0.002446038, -0.9457378, -2.655602, 1, 0, 0, 1, 1,
-6.623798e-05, 0.5247099, 0.4998902, 1, 0, 0, 1, 1,
-1.802931e-06, -0.4746904, -3.21729, 1, 0, 0, 1, 1,
0.00231924, -0.0116896, 4.428265, 1, 0, 0, 1, 1,
0.003719843, 0.06617364, -0.4104027, 1, 0, 0, 1, 1,
0.005684825, 0.6285681, -1.297771, 0, 0, 0, 1, 1,
0.01150454, -0.01833336, 1.949086, 0, 0, 0, 1, 1,
0.01282436, -1.10759, 4.070848, 0, 0, 0, 1, 1,
0.01309357, 0.08544559, 1.221066, 0, 0, 0, 1, 1,
0.01499745, -0.1066892, 2.264457, 0, 0, 0, 1, 1,
0.01684187, -1.739804, 3.034653, 0, 0, 0, 1, 1,
0.02341658, -0.1892523, 2.571326, 0, 0, 0, 1, 1,
0.02398544, 0.7573571, 0.008115536, 1, 1, 1, 1, 1,
0.02495426, 0.1677187, 0.8872337, 1, 1, 1, 1, 1,
0.02524328, 0.09898856, 0.585556, 1, 1, 1, 1, 1,
0.02742613, 2.557805, -0.2644438, 1, 1, 1, 1, 1,
0.02783557, -0.7608364, 2.798806, 1, 1, 1, 1, 1,
0.02877567, 1.537426, 0.3598509, 1, 1, 1, 1, 1,
0.02916029, -0.1664653, 2.176144, 1, 1, 1, 1, 1,
0.02923962, -0.3822466, 4.987074, 1, 1, 1, 1, 1,
0.03284388, 1.49121, 0.8742732, 1, 1, 1, 1, 1,
0.03462015, 0.1911476, 1.729373, 1, 1, 1, 1, 1,
0.0433384, -0.3390401, 2.716996, 1, 1, 1, 1, 1,
0.04430766, 0.7000995, -1.326795, 1, 1, 1, 1, 1,
0.04503961, 0.01374333, 2.142707, 1, 1, 1, 1, 1,
0.04829827, 1.845713, -0.529741, 1, 1, 1, 1, 1,
0.04921312, -0.7201695, 3.627442, 1, 1, 1, 1, 1,
0.04974531, 0.2801957, 0.23513, 0, 0, 1, 1, 1,
0.05202435, -0.05359469, 2.506464, 1, 0, 0, 1, 1,
0.06126601, -0.4451353, 1.782049, 1, 0, 0, 1, 1,
0.06320485, 1.450766, 0.6631998, 1, 0, 0, 1, 1,
0.06530909, -0.5023167, 3.444779, 1, 0, 0, 1, 1,
0.06605319, 0.4361065, 1.132241, 1, 0, 0, 1, 1,
0.06638084, 1.777533, -0.5682316, 0, 0, 0, 1, 1,
0.06975286, 0.5292208, 0.4532583, 0, 0, 0, 1, 1,
0.07150264, 1.722548, 1.373518, 0, 0, 0, 1, 1,
0.07617933, -0.05965501, 1.649376, 0, 0, 0, 1, 1,
0.08041298, 0.1728037, 1.208788, 0, 0, 0, 1, 1,
0.08230637, 0.05401891, 0.5313059, 0, 0, 0, 1, 1,
0.0877899, 0.8054088, 0.5823422, 0, 0, 0, 1, 1,
0.0927557, 0.3374456, 1.712094, 1, 1, 1, 1, 1,
0.09360901, -1.439246, 0.319305, 1, 1, 1, 1, 1,
0.09432244, -0.9599918, 4.999364, 1, 1, 1, 1, 1,
0.09760354, 0.6007833, -0.2843777, 1, 1, 1, 1, 1,
0.09790812, 1.053992, -0.08284882, 1, 1, 1, 1, 1,
0.09986427, 1.402507, 1.582584, 1, 1, 1, 1, 1,
0.1008029, -1.843989, 1.025097, 1, 1, 1, 1, 1,
0.1020336, -0.1849267, 1.795776, 1, 1, 1, 1, 1,
0.1029652, -0.8725386, 3.114487, 1, 1, 1, 1, 1,
0.1032819, 1.03325, 0.7852873, 1, 1, 1, 1, 1,
0.1041248, -1.102816, 2.238919, 1, 1, 1, 1, 1,
0.1045786, 0.3418623, 0.2361417, 1, 1, 1, 1, 1,
0.1077739, -0.1400497, 2.305012, 1, 1, 1, 1, 1,
0.1101557, 1.309845, -0.4436616, 1, 1, 1, 1, 1,
0.1106174, 0.9618754, 0.1833278, 1, 1, 1, 1, 1,
0.112014, -0.243888, 3.182066, 0, 0, 1, 1, 1,
0.1139513, 0.369625, 1.686599, 1, 0, 0, 1, 1,
0.1193799, -1.717461, 2.67081, 1, 0, 0, 1, 1,
0.1234533, -1.848406, 2.815016, 1, 0, 0, 1, 1,
0.1247673, -0.3350274, 0.7453483, 1, 0, 0, 1, 1,
0.1259496, 0.9595383, -0.3383882, 1, 0, 0, 1, 1,
0.1277328, -0.3506568, 3.595206, 0, 0, 0, 1, 1,
0.1301772, 0.6241693, -1.08938, 0, 0, 0, 1, 1,
0.1307184, -0.3842955, 2.703589, 0, 0, 0, 1, 1,
0.1372596, -0.2912275, 2.062927, 0, 0, 0, 1, 1,
0.1380563, -1.78972, 2.358868, 0, 0, 0, 1, 1,
0.1413562, 0.01835627, 1.085681, 0, 0, 0, 1, 1,
0.1455684, -0.8537166, 1.854301, 0, 0, 0, 1, 1,
0.145866, 0.6893069, -0.4629909, 1, 1, 1, 1, 1,
0.1464124, -0.5060124, 4.50703, 1, 1, 1, 1, 1,
0.1500202, 1.408213, -0.5731261, 1, 1, 1, 1, 1,
0.1523216, 0.3465413, 0.9107714, 1, 1, 1, 1, 1,
0.1534191, 0.5795481, 0.3981103, 1, 1, 1, 1, 1,
0.1544678, -0.1547599, 2.339654, 1, 1, 1, 1, 1,
0.1590642, -0.00449096, 1.916498, 1, 1, 1, 1, 1,
0.1597053, 1.172508, 2.236054, 1, 1, 1, 1, 1,
0.1599358, -0.2794403, 3.048729, 1, 1, 1, 1, 1,
0.1618191, 1.305969, 1.482959, 1, 1, 1, 1, 1,
0.1681173, 0.7552863, 0.2618417, 1, 1, 1, 1, 1,
0.1703188, -1.217698, 4.749215, 1, 1, 1, 1, 1,
0.1722094, 2.06358, 0.5430928, 1, 1, 1, 1, 1,
0.1732558, -0.04769048, 1.04869, 1, 1, 1, 1, 1,
0.1735277, -0.8384381, 1.777281, 1, 1, 1, 1, 1,
0.1764781, 0.6501389, 0.5164232, 0, 0, 1, 1, 1,
0.1769884, -0.9383188, 3.199037, 1, 0, 0, 1, 1,
0.1816301, 0.2990707, -0.1094893, 1, 0, 0, 1, 1,
0.1828286, -0.3964587, 3.356988, 1, 0, 0, 1, 1,
0.1851175, -1.248637, 3.434507, 1, 0, 0, 1, 1,
0.185408, -0.1572518, 2.591847, 1, 0, 0, 1, 1,
0.186271, 0.5630221, 0.9133962, 0, 0, 0, 1, 1,
0.1891153, 0.8626944, -1.106914, 0, 0, 0, 1, 1,
0.1926244, 0.3951105, 1.166397, 0, 0, 0, 1, 1,
0.1962613, 0.4375786, 0.1556879, 0, 0, 0, 1, 1,
0.2020631, 0.02295716, 4.317062, 0, 0, 0, 1, 1,
0.208051, -1.756909, 4.123386, 0, 0, 0, 1, 1,
0.2112148, 0.7122424, -0.2246705, 0, 0, 0, 1, 1,
0.215984, 1.633505, 1.699072, 1, 1, 1, 1, 1,
0.2172292, 1.357857, 1.422219, 1, 1, 1, 1, 1,
0.2172335, -0.9982559, 1.055929, 1, 1, 1, 1, 1,
0.2193633, 0.07285278, 1.916684, 1, 1, 1, 1, 1,
0.2245451, 1.64435, -0.124317, 1, 1, 1, 1, 1,
0.2253445, 0.4900092, 0.6307092, 1, 1, 1, 1, 1,
0.2253763, -0.08518194, 0.6610044, 1, 1, 1, 1, 1,
0.2295778, -0.9311805, 0.7526647, 1, 1, 1, 1, 1,
0.2374334, 0.6584741, -0.4291473, 1, 1, 1, 1, 1,
0.2403388, 1.560471, 1.285418, 1, 1, 1, 1, 1,
0.2407646, -0.6045515, 1.69891, 1, 1, 1, 1, 1,
0.248145, 0.5164311, 0.2145022, 1, 1, 1, 1, 1,
0.2532637, -0.5017644, 1.715085, 1, 1, 1, 1, 1,
0.2534452, -1.753587, 1.872093, 1, 1, 1, 1, 1,
0.2535331, 1.064515, 0.02656512, 1, 1, 1, 1, 1,
0.2688177, 1.557517, 0.03195098, 0, 0, 1, 1, 1,
0.2719015, -1.067268, 3.169113, 1, 0, 0, 1, 1,
0.2744563, -1.317782, 2.790522, 1, 0, 0, 1, 1,
0.2780343, 0.9163388, 0.2383568, 1, 0, 0, 1, 1,
0.2788568, 0.2023965, 0.0001219956, 1, 0, 0, 1, 1,
0.2798542, -0.6938829, 2.545766, 1, 0, 0, 1, 1,
0.2845066, 0.4821444, -0.4723862, 0, 0, 0, 1, 1,
0.2855165, 0.0221451, 1.404725, 0, 0, 0, 1, 1,
0.286934, -0.4542813, 1.78437, 0, 0, 0, 1, 1,
0.2913923, -2.233152, 2.473019, 0, 0, 0, 1, 1,
0.293339, 0.9129088, -2.37149, 0, 0, 0, 1, 1,
0.2959206, 1.311608, 1.051777, 0, 0, 0, 1, 1,
0.298057, 1.080399, -0.3039782, 0, 0, 0, 1, 1,
0.2997599, -0.3837577, 2.23974, 1, 1, 1, 1, 1,
0.3002676, 0.3698436, -0.9909711, 1, 1, 1, 1, 1,
0.3009985, -0.2601488, 2.995079, 1, 1, 1, 1, 1,
0.3027606, -0.4678814, 3.336399, 1, 1, 1, 1, 1,
0.3038877, 0.241523, 1.774419, 1, 1, 1, 1, 1,
0.3044905, 2.100353, 1.206448, 1, 1, 1, 1, 1,
0.3045066, -0.1485959, 2.261666, 1, 1, 1, 1, 1,
0.3057204, 0.9821345, 1.683179, 1, 1, 1, 1, 1,
0.310452, -0.9931723, 2.974866, 1, 1, 1, 1, 1,
0.3130761, -0.355686, 2.584936, 1, 1, 1, 1, 1,
0.3151568, -1.324265, 3.260596, 1, 1, 1, 1, 1,
0.3229126, 2.348022, 1.079244, 1, 1, 1, 1, 1,
0.3248588, 0.06286544, 1.026973, 1, 1, 1, 1, 1,
0.3283134, -0.7510617, 2.91902, 1, 1, 1, 1, 1,
0.3332304, 1.336059, -1.009921, 1, 1, 1, 1, 1,
0.3366845, 0.02833868, 1.831387, 0, 0, 1, 1, 1,
0.3385299, -0.8442963, 2.266339, 1, 0, 0, 1, 1,
0.3436772, -0.2397707, 2.151844, 1, 0, 0, 1, 1,
0.3458859, 0.7065221, -0.1161616, 1, 0, 0, 1, 1,
0.3537548, 1.76557, -0.1961654, 1, 0, 0, 1, 1,
0.3538002, -0.5421038, 2.940484, 1, 0, 0, 1, 1,
0.3539835, 0.5415124, 0.07806923, 0, 0, 0, 1, 1,
0.3543353, 0.2490475, -0.8035476, 0, 0, 0, 1, 1,
0.358878, 1.078274, 0.2465148, 0, 0, 0, 1, 1,
0.3612944, -1.110888, 2.439284, 0, 0, 0, 1, 1,
0.3634885, 0.006580157, 2.306544, 0, 0, 0, 1, 1,
0.375053, -0.6531156, 2.013049, 0, 0, 0, 1, 1,
0.3838992, 0.6887076, -0.1243428, 0, 0, 0, 1, 1,
0.3856632, -0.7276838, 3.064127, 1, 1, 1, 1, 1,
0.3885646, 0.7779475, 0.4282025, 1, 1, 1, 1, 1,
0.3918149, 0.5814265, 1.282546, 1, 1, 1, 1, 1,
0.3948012, 0.454564, 2.101785, 1, 1, 1, 1, 1,
0.3994485, -1.315023, 2.441223, 1, 1, 1, 1, 1,
0.4002369, 1.287901, 0.5409747, 1, 1, 1, 1, 1,
0.4072147, -0.2833968, 1.685346, 1, 1, 1, 1, 1,
0.4118053, 2.493725, 0.02327807, 1, 1, 1, 1, 1,
0.4142398, 0.2961033, 2.304461, 1, 1, 1, 1, 1,
0.4154493, 0.1341475, 1.637644, 1, 1, 1, 1, 1,
0.4161877, 1.188723, -0.6415264, 1, 1, 1, 1, 1,
0.4215072, -0.2615745, 2.411724, 1, 1, 1, 1, 1,
0.4223765, -0.6753446, 1.39335, 1, 1, 1, 1, 1,
0.4226761, 0.4611716, -0.3773694, 1, 1, 1, 1, 1,
0.4271549, 2.456667, 1.989173, 1, 1, 1, 1, 1,
0.4293539, -1.620195, 1.9386, 0, 0, 1, 1, 1,
0.432916, 0.2264385, 0.9772416, 1, 0, 0, 1, 1,
0.4399417, -0.9837359, 2.582654, 1, 0, 0, 1, 1,
0.4431158, -1.127387, 2.388306, 1, 0, 0, 1, 1,
0.4433062, -1.934921, 3.033483, 1, 0, 0, 1, 1,
0.445686, 0.09676427, 1.717306, 1, 0, 0, 1, 1,
0.4495843, -0.5210472, 2.389989, 0, 0, 0, 1, 1,
0.4509115, -0.3089738, 2.367362, 0, 0, 0, 1, 1,
0.4548894, 0.6033931, 0.8665537, 0, 0, 0, 1, 1,
0.4597266, -2.148529, 2.117458, 0, 0, 0, 1, 1,
0.4620738, 0.2210836, 0.8013647, 0, 0, 0, 1, 1,
0.4727672, 0.9828459, 0.03644148, 0, 0, 0, 1, 1,
0.4744089, -0.3711407, 0.7433182, 0, 0, 0, 1, 1,
0.4764712, -0.0593411, 2.49367, 1, 1, 1, 1, 1,
0.4764899, 0.359295, 1.356055, 1, 1, 1, 1, 1,
0.4842197, 1.321169, 1.726074, 1, 1, 1, 1, 1,
0.4904233, -0.3701484, 2.547817, 1, 1, 1, 1, 1,
0.4928184, 0.3389739, 0.5902302, 1, 1, 1, 1, 1,
0.4975464, 0.4131116, 0.1544085, 1, 1, 1, 1, 1,
0.5028914, 1.289144, 0.01508832, 1, 1, 1, 1, 1,
0.5061916, 1.176145, 0.1727175, 1, 1, 1, 1, 1,
0.5105081, 0.6812336, 1.410631, 1, 1, 1, 1, 1,
0.5107251, -0.9913858, 2.908082, 1, 1, 1, 1, 1,
0.5232441, 0.7988559, 0.09399987, 1, 1, 1, 1, 1,
0.5243263, -1.569645, 2.93329, 1, 1, 1, 1, 1,
0.5294183, 2.059295, 2.086227, 1, 1, 1, 1, 1,
0.5329723, -1.349792, 3.456419, 1, 1, 1, 1, 1,
0.533905, 1.012418, 0.2609139, 1, 1, 1, 1, 1,
0.5344618, -0.6168197, 3.267586, 0, 0, 1, 1, 1,
0.5406797, 1.215516, 0.3582661, 1, 0, 0, 1, 1,
0.5426037, 0.2345217, 1.137272, 1, 0, 0, 1, 1,
0.5483108, -0.1637821, 3.189596, 1, 0, 0, 1, 1,
0.5491324, -2.03609, 1.649925, 1, 0, 0, 1, 1,
0.5493708, -0.7125326, 2.320102, 1, 0, 0, 1, 1,
0.5500569, -0.6889461, 3.810379, 0, 0, 0, 1, 1,
0.5516852, 0.1430755, 2.511183, 0, 0, 0, 1, 1,
0.5527771, -0.2274418, 1.948284, 0, 0, 0, 1, 1,
0.5556186, 0.3335163, 1.386092, 0, 0, 0, 1, 1,
0.5597631, 0.05545651, 1.153829, 0, 0, 0, 1, 1,
0.5620023, 0.1888832, 1.186502, 0, 0, 0, 1, 1,
0.5647679, -0.3230843, 2.369442, 0, 0, 0, 1, 1,
0.5672197, 0.7122802, -1.428293, 1, 1, 1, 1, 1,
0.5701525, -0.4590043, 2.252611, 1, 1, 1, 1, 1,
0.5708423, -0.4224286, 2.835788, 1, 1, 1, 1, 1,
0.5746861, 1.359232, 0.3263685, 1, 1, 1, 1, 1,
0.5768055, 0.3323312, -0.3407847, 1, 1, 1, 1, 1,
0.5789635, 0.7288061, 0.3863678, 1, 1, 1, 1, 1,
0.5816624, -0.7758532, 2.598612, 1, 1, 1, 1, 1,
0.5835634, 1.67691, 0.5803788, 1, 1, 1, 1, 1,
0.5853855, -0.7909165, 2.06783, 1, 1, 1, 1, 1,
0.5907059, -1.274421, 3.081004, 1, 1, 1, 1, 1,
0.5928933, -1.52117, 2.581666, 1, 1, 1, 1, 1,
0.5929068, 0.4954872, -0.8073019, 1, 1, 1, 1, 1,
0.6003348, 1.002558, -0.5408438, 1, 1, 1, 1, 1,
0.6011945, -1.046298, 3.229603, 1, 1, 1, 1, 1,
0.6021377, -0.8012612, 2.45084, 1, 1, 1, 1, 1,
0.6041708, -1.000411, 1.689988, 0, 0, 1, 1, 1,
0.6048081, -1.016716, 3.280675, 1, 0, 0, 1, 1,
0.6080657, -0.2159581, 2.527462, 1, 0, 0, 1, 1,
0.6082999, 1.3274, -0.0453278, 1, 0, 0, 1, 1,
0.6089606, -1.514046, 1.224882, 1, 0, 0, 1, 1,
0.6150558, 1.663417, 0.5158679, 1, 0, 0, 1, 1,
0.6173139, 0.119251, 2.014735, 0, 0, 0, 1, 1,
0.6183308, -0.4773607, 3.666808, 0, 0, 0, 1, 1,
0.618683, 0.5618777, -0.9706773, 0, 0, 0, 1, 1,
0.6214098, -0.09059548, 3.652108, 0, 0, 0, 1, 1,
0.6261169, 0.2488571, 1.433743, 0, 0, 0, 1, 1,
0.6267698, -0.04679425, 1.353504, 0, 0, 0, 1, 1,
0.6287242, 0.952852, -0.5098549, 0, 0, 0, 1, 1,
0.6322881, 1.314594, 1.53472, 1, 1, 1, 1, 1,
0.632817, -0.1556181, 0.7070727, 1, 1, 1, 1, 1,
0.6344614, -0.6680683, 2.633621, 1, 1, 1, 1, 1,
0.6415245, -0.1238419, 2.828301, 1, 1, 1, 1, 1,
0.6460571, -1.168829, 1.759884, 1, 1, 1, 1, 1,
0.6511916, -0.7128567, 2.070953, 1, 1, 1, 1, 1,
0.6512641, -0.01125621, -0.8619374, 1, 1, 1, 1, 1,
0.6545823, -0.3192491, 2.428422, 1, 1, 1, 1, 1,
0.6611766, -0.9852561, 2.340103, 1, 1, 1, 1, 1,
0.6657288, 1.306819, -0.3722102, 1, 1, 1, 1, 1,
0.6736574, 1.901137, 0.02491533, 1, 1, 1, 1, 1,
0.6805026, 0.244244, -0.4191482, 1, 1, 1, 1, 1,
0.6806782, -0.4192108, 3.927093, 1, 1, 1, 1, 1,
0.6821939, 2.244797, -0.1872204, 1, 1, 1, 1, 1,
0.6824334, -0.637228, 2.981796, 1, 1, 1, 1, 1,
0.6838279, 1.418167, -0.9150636, 0, 0, 1, 1, 1,
0.6855485, -0.9237723, 2.188878, 1, 0, 0, 1, 1,
0.6856651, 0.005225075, 0.3726881, 1, 0, 0, 1, 1,
0.6904153, -0.8464662, 1.752906, 1, 0, 0, 1, 1,
0.6930158, -0.792931, 3.432962, 1, 0, 0, 1, 1,
0.6970558, -1.835222, 2.512208, 1, 0, 0, 1, 1,
0.6986583, -1.011297, 1.709655, 0, 0, 0, 1, 1,
0.7031342, -0.2124014, 3.68549, 0, 0, 0, 1, 1,
0.707, -0.757466, 1.944109, 0, 0, 0, 1, 1,
0.707683, 1.756254, 1.00638, 0, 0, 0, 1, 1,
0.7098362, 0.5829853, -0.5667797, 0, 0, 0, 1, 1,
0.7161749, 0.9897972, 1.18616, 0, 0, 0, 1, 1,
0.7245691, -0.1997074, 1.693706, 0, 0, 0, 1, 1,
0.7252504, 1.153976, 1.258919, 1, 1, 1, 1, 1,
0.7304464, -0.3615947, 1.699466, 1, 1, 1, 1, 1,
0.7348127, -0.6376238, 2.581256, 1, 1, 1, 1, 1,
0.7375216, 0.7802586, 0.8026974, 1, 1, 1, 1, 1,
0.7423749, -0.5027501, 1.549654, 1, 1, 1, 1, 1,
0.7487042, 0.9066914, -1.005078, 1, 1, 1, 1, 1,
0.7514521, 0.7174894, 0.3432306, 1, 1, 1, 1, 1,
0.7549191, -1.294043, 3.270584, 1, 1, 1, 1, 1,
0.7554177, 0.1310917, 1.468711, 1, 1, 1, 1, 1,
0.7562124, -1.629405, 3.565113, 1, 1, 1, 1, 1,
0.7577833, -0.9214398, 1.741424, 1, 1, 1, 1, 1,
0.762589, 1.236689, 1.087564, 1, 1, 1, 1, 1,
0.7630606, -1.563211, 2.908169, 1, 1, 1, 1, 1,
0.7637649, 0.8347978, 0.7776637, 1, 1, 1, 1, 1,
0.7729939, 0.7773234, -1.271165, 1, 1, 1, 1, 1,
0.7732835, -0.2793331, 2.424174, 0, 0, 1, 1, 1,
0.773847, -0.3242086, 1.020879, 1, 0, 0, 1, 1,
0.7740458, -1.365326, 1.747114, 1, 0, 0, 1, 1,
0.7742676, 1.743862, -0.002893486, 1, 0, 0, 1, 1,
0.7746919, 1.158971, -1.678699, 1, 0, 0, 1, 1,
0.777602, 0.1794376, 1.510708, 1, 0, 0, 1, 1,
0.7901493, -0.1823882, 3.799125, 0, 0, 0, 1, 1,
0.7912642, -0.5880193, 2.416178, 0, 0, 0, 1, 1,
0.7944408, 1.105923, 0.04334376, 0, 0, 0, 1, 1,
0.7977462, 2.163245, 0.8240204, 0, 0, 0, 1, 1,
0.8000312, -1.365408, 4.129209, 0, 0, 0, 1, 1,
0.8008475, -0.7793754, 2.337919, 0, 0, 0, 1, 1,
0.8071053, 0.8124424, -0.06343871, 0, 0, 0, 1, 1,
0.8108351, 1.771339, 0.9573713, 1, 1, 1, 1, 1,
0.8158788, 0.9870104, -0.3526034, 1, 1, 1, 1, 1,
0.8170838, 1.037654, -1.655626, 1, 1, 1, 1, 1,
0.827252, 0.4175347, -0.06638381, 1, 1, 1, 1, 1,
0.8288792, -0.6205732, 1.563096, 1, 1, 1, 1, 1,
0.8312382, 2.472178, -0.07902289, 1, 1, 1, 1, 1,
0.8313355, 0.4515944, -0.1626646, 1, 1, 1, 1, 1,
0.8392361, 0.8247481, 0.3727533, 1, 1, 1, 1, 1,
0.8426961, 0.5901032, 0.480081, 1, 1, 1, 1, 1,
0.8496754, 0.6952406, 2.085278, 1, 1, 1, 1, 1,
0.8534139, 0.3615074, 1.457433, 1, 1, 1, 1, 1,
0.8575002, -1.066566, 4.921481, 1, 1, 1, 1, 1,
0.8580092, -0.6791239, 0.8368058, 1, 1, 1, 1, 1,
0.8607829, -1.415145, 1.692739, 1, 1, 1, 1, 1,
0.8804793, 2.440003, 1.127046, 1, 1, 1, 1, 1,
0.8830276, -1.2468, 2.125667, 0, 0, 1, 1, 1,
0.8959138, 0.2912911, 0.6956647, 1, 0, 0, 1, 1,
0.8986773, 0.4777954, 0.542863, 1, 0, 0, 1, 1,
0.9007039, 0.2621331, 0.4142798, 1, 0, 0, 1, 1,
0.904978, 0.518288, 2.304304, 1, 0, 0, 1, 1,
0.9110112, 0.2976449, 0.6828922, 1, 0, 0, 1, 1,
0.9118519, -1.433531, -0.6702978, 0, 0, 0, 1, 1,
0.9129537, 0.4343052, -0.4276065, 0, 0, 0, 1, 1,
0.9142262, -0.4117777, 1.914848, 0, 0, 0, 1, 1,
0.9153444, -1.640497, 3.754073, 0, 0, 0, 1, 1,
0.9195719, 0.8337665, -0.563496, 0, 0, 0, 1, 1,
0.9266109, -0.2802597, 1.264194, 0, 0, 0, 1, 1,
0.9332004, 0.1619526, 3.079271, 0, 0, 0, 1, 1,
0.9346462, -2.07468, 2.411339, 1, 1, 1, 1, 1,
0.9395394, 1.440416, -0.2024403, 1, 1, 1, 1, 1,
0.9450642, 0.3133823, 0.5635677, 1, 1, 1, 1, 1,
0.9473544, -0.6674724, 3.853509, 1, 1, 1, 1, 1,
0.947803, 0.7137341, 0.4480584, 1, 1, 1, 1, 1,
0.9667865, -1.107005, 3.414574, 1, 1, 1, 1, 1,
0.9688711, 0.6557844, -1.172086, 1, 1, 1, 1, 1,
0.9690931, 0.7486825, 0.9574194, 1, 1, 1, 1, 1,
0.9716899, -0.3039942, 3.341754, 1, 1, 1, 1, 1,
0.9981759, 0.2792991, 0.8476055, 1, 1, 1, 1, 1,
1.000143, 0.03514222, 0.6270851, 1, 1, 1, 1, 1,
1.001362, 0.4972499, 0.1319358, 1, 1, 1, 1, 1,
1.003794, -0.2289891, 2.620457, 1, 1, 1, 1, 1,
1.003834, -0.5741178, 1.706319, 1, 1, 1, 1, 1,
1.004181, 0.6341548, -0.2102425, 1, 1, 1, 1, 1,
1.004992, -0.7352785, 0.6379941, 0, 0, 1, 1, 1,
1.008155, -0.9757094, 1.080858, 1, 0, 0, 1, 1,
1.00842, -1.368387, 2.023254, 1, 0, 0, 1, 1,
1.008567, 0.05431375, 1.643155, 1, 0, 0, 1, 1,
1.009272, -1.587042, 1.369206, 1, 0, 0, 1, 1,
1.012967, 0.03129782, 1.066618, 1, 0, 0, 1, 1,
1.013354, -0.04284611, 0.9247891, 0, 0, 0, 1, 1,
1.014156, -0.6361368, 2.173489, 0, 0, 0, 1, 1,
1.018376, 0.05865668, 1.75118, 0, 0, 0, 1, 1,
1.026361, 0.202503, 0.927011, 0, 0, 0, 1, 1,
1.029543, -1.822499, 2.249169, 0, 0, 0, 1, 1,
1.031012, 0.4015245, 3.25325, 0, 0, 0, 1, 1,
1.040135, 0.6711116, -0.8626653, 0, 0, 0, 1, 1,
1.047633, -1.645517, 3.690884, 1, 1, 1, 1, 1,
1.058497, 0.1434508, 2.566738, 1, 1, 1, 1, 1,
1.059461, -1.540864, 2.123888, 1, 1, 1, 1, 1,
1.060392, 0.950534, 2.471758, 1, 1, 1, 1, 1,
1.060702, -0.02796043, 0.8565112, 1, 1, 1, 1, 1,
1.080997, 0.2030822, 2.739634, 1, 1, 1, 1, 1,
1.082273, -2.286907, 2.552808, 1, 1, 1, 1, 1,
1.084658, 1.616811, 2.091578, 1, 1, 1, 1, 1,
1.086886, 0.3340691, 0.4626451, 1, 1, 1, 1, 1,
1.088577, -0.316725, 2.639637, 1, 1, 1, 1, 1,
1.088671, 1.553961, 0.9751604, 1, 1, 1, 1, 1,
1.089965, 0.3429906, 1.233557, 1, 1, 1, 1, 1,
1.094308, -1.707024, 2.058857, 1, 1, 1, 1, 1,
1.100472, -0.908745, 2.252271, 1, 1, 1, 1, 1,
1.101509, -1.816075, 3.144632, 1, 1, 1, 1, 1,
1.109511, 0.8294426, 0.1447957, 0, 0, 1, 1, 1,
1.113349, -0.6665984, 4.039083, 1, 0, 0, 1, 1,
1.115793, 1.954866, 1.196288, 1, 0, 0, 1, 1,
1.120129, 2.11014, 1.570528, 1, 0, 0, 1, 1,
1.120444, 0.2620014, 0.542199, 1, 0, 0, 1, 1,
1.125515, -0.5613505, 0.49732, 1, 0, 0, 1, 1,
1.128492, -2.011794, 2.455063, 0, 0, 0, 1, 1,
1.132228, -1.269343, 1.452371, 0, 0, 0, 1, 1,
1.154745, 0.1545386, 0.8234335, 0, 0, 0, 1, 1,
1.15748, -0.1923382, 1.364674, 0, 0, 0, 1, 1,
1.15865, 0.1125388, 1.818686, 0, 0, 0, 1, 1,
1.158674, 0.9061661, 0.9038606, 0, 0, 0, 1, 1,
1.159828, -0.5362279, 2.754389, 0, 0, 0, 1, 1,
1.166431, -1.290458, 2.406417, 1, 1, 1, 1, 1,
1.170489, 0.2932769, 0.3434297, 1, 1, 1, 1, 1,
1.17149, 1.36992, -1.446744, 1, 1, 1, 1, 1,
1.179223, -0.1644551, 1.55551, 1, 1, 1, 1, 1,
1.181915, -0.513811, 1.855144, 1, 1, 1, 1, 1,
1.184935, -2.248736, 2.380637, 1, 1, 1, 1, 1,
1.190253, 1.562638, 3.000753, 1, 1, 1, 1, 1,
1.213346, 0.3706548, 1.421311, 1, 1, 1, 1, 1,
1.22095, -2.838285, 3.220483, 1, 1, 1, 1, 1,
1.222796, -0.5708062, 2.543022, 1, 1, 1, 1, 1,
1.229086, -0.1987414, 0.2400531, 1, 1, 1, 1, 1,
1.230424, -0.2005521, 1.624189, 1, 1, 1, 1, 1,
1.242539, 0.6233678, 3.250922, 1, 1, 1, 1, 1,
1.243606, -0.8226969, 2.327178, 1, 1, 1, 1, 1,
1.243673, 0.1901284, 1.641582, 1, 1, 1, 1, 1,
1.243992, 0.8631867, 1.395544, 0, 0, 1, 1, 1,
1.246543, -0.5731028, 2.668598, 1, 0, 0, 1, 1,
1.247784, 0.1529331, 2.239108, 1, 0, 0, 1, 1,
1.2508, 2.0633, 1.701932, 1, 0, 0, 1, 1,
1.251383, 0.2850035, 1.86228, 1, 0, 0, 1, 1,
1.252018, 0.1169045, 2.334622, 1, 0, 0, 1, 1,
1.255533, -0.3956595, 2.380014, 0, 0, 0, 1, 1,
1.265032, -2.480413, 2.688328, 0, 0, 0, 1, 1,
1.282882, -1.314358, 1.471405, 0, 0, 0, 1, 1,
1.286741, 0.2569817, 0.4218377, 0, 0, 0, 1, 1,
1.29675, -0.8099973, 2.806338, 0, 0, 0, 1, 1,
1.307992, -0.7768348, 1.728343, 0, 0, 0, 1, 1,
1.317904, 0.3855297, 1.827415, 0, 0, 0, 1, 1,
1.320657, -0.4684888, 3.391509, 1, 1, 1, 1, 1,
1.321336, 1.824567, 0.4134259, 1, 1, 1, 1, 1,
1.34252, 1.028352, 0.7589293, 1, 1, 1, 1, 1,
1.342859, 1.383412, 1.726147, 1, 1, 1, 1, 1,
1.344009, 0.7954887, 2.818129, 1, 1, 1, 1, 1,
1.346158, -0.9648632, 2.274466, 1, 1, 1, 1, 1,
1.352981, 0.1107645, 1.720387, 1, 1, 1, 1, 1,
1.368896, -0.5154613, 1.463829, 1, 1, 1, 1, 1,
1.374851, -0.0305179, 2.298, 1, 1, 1, 1, 1,
1.387571, 0.2870244, -0.1230997, 1, 1, 1, 1, 1,
1.39332, -0.06274553, -0.09042022, 1, 1, 1, 1, 1,
1.404795, 0.5307615, -1.439516, 1, 1, 1, 1, 1,
1.405582, 0.3702601, 1.314902, 1, 1, 1, 1, 1,
1.407835, -0.1558148, 1.21565, 1, 1, 1, 1, 1,
1.417387, 0.3295552, 1.615812, 1, 1, 1, 1, 1,
1.419426, 0.004520174, 0.547013, 0, 0, 1, 1, 1,
1.423734, -1.078562, 2.876939, 1, 0, 0, 1, 1,
1.43874, -0.2324199, 0.7473816, 1, 0, 0, 1, 1,
1.439326, -2.092106, 3.272179, 1, 0, 0, 1, 1,
1.46382, 0.7298552, 1.252639, 1, 0, 0, 1, 1,
1.494033, 0.8373238, 1.926184, 1, 0, 0, 1, 1,
1.498546, -2.436072, 1.228116, 0, 0, 0, 1, 1,
1.499818, 0.547194, 1.451367, 0, 0, 0, 1, 1,
1.511317, -0.01745922, 2.868647, 0, 0, 0, 1, 1,
1.52747, 1.069672, 1.968259, 0, 0, 0, 1, 1,
1.528348, -1.597183, 2.818576, 0, 0, 0, 1, 1,
1.528513, -0.1429195, 3.317499, 0, 0, 0, 1, 1,
1.530361, 0.02247735, 2.254143, 0, 0, 0, 1, 1,
1.533359, 0.005172899, 1.474747, 1, 1, 1, 1, 1,
1.545154, -0.9298273, 1.330742, 1, 1, 1, 1, 1,
1.57021, -0.51036, 1.921903, 1, 1, 1, 1, 1,
1.577643, -3.195244, 2.443561, 1, 1, 1, 1, 1,
1.57954, 0.8383349, -1.022518, 1, 1, 1, 1, 1,
1.586767, -0.6107119, 2.647496, 1, 1, 1, 1, 1,
1.588905, -0.3207742, 2.902346, 1, 1, 1, 1, 1,
1.590128, 0.9614725, -0.6907726, 1, 1, 1, 1, 1,
1.591185, -0.7937228, 0.5208476, 1, 1, 1, 1, 1,
1.59434, 1.371933, 1.014497, 1, 1, 1, 1, 1,
1.595626, -0.3976028, 0.5882956, 1, 1, 1, 1, 1,
1.610082, -0.06655773, 2.2357, 1, 1, 1, 1, 1,
1.61636, 1.08814, 0.7991762, 1, 1, 1, 1, 1,
1.624641, -0.1773697, 1.599579, 1, 1, 1, 1, 1,
1.624733, 1.822829, -0.4659346, 1, 1, 1, 1, 1,
1.632103, 0.4392399, -0.03230358, 0, 0, 1, 1, 1,
1.637529, 0.5095389, 1.555872, 1, 0, 0, 1, 1,
1.643624, -0.8313592, 3.558923, 1, 0, 0, 1, 1,
1.668445, -1.212792, 2.655636, 1, 0, 0, 1, 1,
1.692577, -0.04445391, 0.9213189, 1, 0, 0, 1, 1,
1.696519, -0.1116762, 2.08089, 1, 0, 0, 1, 1,
1.712203, 0.9245842, -1.741896, 0, 0, 0, 1, 1,
1.712818, -1.572061, 2.955026, 0, 0, 0, 1, 1,
1.715062, 0.388226, 0.1790795, 0, 0, 0, 1, 1,
1.724968, 0.8206379, 2.519699, 0, 0, 0, 1, 1,
1.759541, -1.959648, 2.879233, 0, 0, 0, 1, 1,
1.760303, -0.09035891, -1.147262, 0, 0, 0, 1, 1,
1.761267, 1.598263, 1.947932, 0, 0, 0, 1, 1,
1.780218, 1.35155, 2.199848, 1, 1, 1, 1, 1,
1.801602, 1.240656, 1.622271, 1, 1, 1, 1, 1,
1.830292, 0.876671, -0.9028659, 1, 1, 1, 1, 1,
1.842116, -0.2783825, 1.100783, 1, 1, 1, 1, 1,
1.858069, 0.7343666, 1.491543, 1, 1, 1, 1, 1,
1.859264, 2.409348, 0.721817, 1, 1, 1, 1, 1,
1.873762, 0.5317812, 1.028405, 1, 1, 1, 1, 1,
1.920182, 0.2776109, 1.165697, 1, 1, 1, 1, 1,
1.926451, 0.6732666, 1.944567, 1, 1, 1, 1, 1,
1.935606, 0.1824903, 0.9835933, 1, 1, 1, 1, 1,
1.936074, 0.9193695, 0.310977, 1, 1, 1, 1, 1,
1.936259, 0.005873921, 1.456168, 1, 1, 1, 1, 1,
1.949374, -0.5361563, 0.9647327, 1, 1, 1, 1, 1,
1.969381, -0.8580244, 1.270644, 1, 1, 1, 1, 1,
1.978929, -0.125239, 1.313652, 1, 1, 1, 1, 1,
1.984199, -1.056269, 1.882115, 0, 0, 1, 1, 1,
2.024755, 0.4378338, 1.821151, 1, 0, 0, 1, 1,
2.048239, -2.105364, 1.567273, 1, 0, 0, 1, 1,
2.06831, -2.338547, 2.910193, 1, 0, 0, 1, 1,
2.069253, 0.192417, -0.6526919, 1, 0, 0, 1, 1,
2.075934, -0.3937323, 2.110753, 1, 0, 0, 1, 1,
2.11961, 0.6344116, 1.152434, 0, 0, 0, 1, 1,
2.139569, 0.5905754, 2.075288, 0, 0, 0, 1, 1,
2.160648, 1.032003, 0.2971049, 0, 0, 0, 1, 1,
2.164077, -1.181406, 0.719315, 0, 0, 0, 1, 1,
2.168364, -0.1513713, 0.981499, 0, 0, 0, 1, 1,
2.214121, 2.193336, 0.1224451, 0, 0, 0, 1, 1,
2.30625, -2.937447, -0.2364437, 0, 0, 0, 1, 1,
2.347407, -1.909228, 3.916195, 1, 1, 1, 1, 1,
2.452178, -0.446515, 0.3727507, 1, 1, 1, 1, 1,
2.468468, 0.2858338, 2.067923, 1, 1, 1, 1, 1,
2.48492, -2.061416, 3.115512, 1, 1, 1, 1, 1,
2.587139, -0.4006313, 1.766504, 1, 1, 1, 1, 1,
2.675245, -1.399914, 2.264871, 1, 1, 1, 1, 1,
2.883415, 0.2983875, -0.1793105, 1, 1, 1, 1, 1
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
var radius = 9.490261;
var distance = 33.33414;
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
mvMatrix.translate( 0.2764757, -0.1296709, 0.199374 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.33414);
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