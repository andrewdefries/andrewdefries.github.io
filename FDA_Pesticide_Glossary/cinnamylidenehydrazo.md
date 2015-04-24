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
-3.084992, -2.470037, -1.586091, 1, 0, 0, 1,
-2.893491, -1.507239, -1.792717, 1, 0.007843138, 0, 1,
-2.775172, -1.438183, -2.092026, 1, 0.01176471, 0, 1,
-2.740684, 0.3007293, -2.516297, 1, 0.01960784, 0, 1,
-2.519898, 1.050918, -1.001767, 1, 0.02352941, 0, 1,
-2.50822, -0.02576674, -2.699672, 1, 0.03137255, 0, 1,
-2.452891, 1.381295, -0.3964399, 1, 0.03529412, 0, 1,
-2.402656, -0.4569113, -2.270922, 1, 0.04313726, 0, 1,
-2.398854, 1.383122, -1.334337, 1, 0.04705882, 0, 1,
-2.390725, -0.9699442, -1.863971, 1, 0.05490196, 0, 1,
-2.357074, -0.4733571, -0.9473968, 1, 0.05882353, 0, 1,
-2.321373, 0.5982754, -2.41145, 1, 0.06666667, 0, 1,
-2.315064, 0.453444, -1.155286, 1, 0.07058824, 0, 1,
-2.191736, 0.7775514, -1.44544, 1, 0.07843138, 0, 1,
-2.170965, 0.5660051, -1.300486, 1, 0.08235294, 0, 1,
-2.164273, 0.5899089, -0.901351, 1, 0.09019608, 0, 1,
-2.158553, -1.121894, -0.5090726, 1, 0.09411765, 0, 1,
-2.109456, -0.4230051, -3.169662, 1, 0.1019608, 0, 1,
-2.087792, 0.02974074, -0.04252778, 1, 0.1098039, 0, 1,
-2.072927, 2.485184, 0.8534949, 1, 0.1137255, 0, 1,
-2.072737, -0.4864325, -3.182128, 1, 0.1215686, 0, 1,
-2.040506, 0.3150527, -2.542445, 1, 0.1254902, 0, 1,
-2.010172, 0.6145766, 0.207074, 1, 0.1333333, 0, 1,
-1.976316, 0.3328272, -3.218107, 1, 0.1372549, 0, 1,
-1.968134, -0.6157807, -1.487144, 1, 0.145098, 0, 1,
-1.961089, -0.7752291, -0.9906554, 1, 0.1490196, 0, 1,
-1.958874, -0.2926624, -2.490647, 1, 0.1568628, 0, 1,
-1.949299, -0.6287076, -1.325931, 1, 0.1607843, 0, 1,
-1.945548, 0.4971429, -2.721055, 1, 0.1686275, 0, 1,
-1.939453, 1.047683, -0.1808601, 1, 0.172549, 0, 1,
-1.938263, 0.18228, -1.949669, 1, 0.1803922, 0, 1,
-1.872251, -0.3673119, -1.938868, 1, 0.1843137, 0, 1,
-1.84273, -0.1379835, -2.044586, 1, 0.1921569, 0, 1,
-1.838591, -0.6616827, -2.177343, 1, 0.1960784, 0, 1,
-1.79286, 0.8355584, -1.004697, 1, 0.2039216, 0, 1,
-1.789569, 1.250926, -1.149969, 1, 0.2117647, 0, 1,
-1.779148, 0.6895986, -1.216612, 1, 0.2156863, 0, 1,
-1.771467, -0.7401564, -1.43108, 1, 0.2235294, 0, 1,
-1.75746, -0.9956455, -1.028973, 1, 0.227451, 0, 1,
-1.719675, -1.390801, -3.117362, 1, 0.2352941, 0, 1,
-1.693186, -0.2370891, -1.970784, 1, 0.2392157, 0, 1,
-1.674396, 0.7986619, -0.5113052, 1, 0.2470588, 0, 1,
-1.67263, 0.5985546, -1.88171, 1, 0.2509804, 0, 1,
-1.663664, -0.2399359, -2.122996, 1, 0.2588235, 0, 1,
-1.66263, 0.3360938, -1.176623, 1, 0.2627451, 0, 1,
-1.65489, 1.110736, 0.2656058, 1, 0.2705882, 0, 1,
-1.654692, 0.04651925, -2.95333, 1, 0.2745098, 0, 1,
-1.650071, 0.3422865, -0.7978578, 1, 0.282353, 0, 1,
-1.64626, -1.360444, -2.359746, 1, 0.2862745, 0, 1,
-1.645095, 0.1554881, -1.659149, 1, 0.2941177, 0, 1,
-1.637443, 1.21046, 0.3001324, 1, 0.3019608, 0, 1,
-1.634787, 0.3378773, -1.126768, 1, 0.3058824, 0, 1,
-1.627354, -1.296763, -4.765678, 1, 0.3137255, 0, 1,
-1.624661, -1.397934, -2.364654, 1, 0.3176471, 0, 1,
-1.616228, -1.023392, -1.767906, 1, 0.3254902, 0, 1,
-1.615721, -0.9566252, -4.522412, 1, 0.3294118, 0, 1,
-1.605498, 0.7263551, -1.455939, 1, 0.3372549, 0, 1,
-1.589684, -1.935082, -2.707966, 1, 0.3411765, 0, 1,
-1.574053, 1.093594, -0.6233797, 1, 0.3490196, 0, 1,
-1.568281, -0.2167808, -1.790337, 1, 0.3529412, 0, 1,
-1.549543, -0.9289292, -1.976395, 1, 0.3607843, 0, 1,
-1.549411, 0.8331378, 0.05342074, 1, 0.3647059, 0, 1,
-1.545069, 0.5549775, -0.8898302, 1, 0.372549, 0, 1,
-1.530089, 0.6480144, -1.074243, 1, 0.3764706, 0, 1,
-1.52822, 0.2003251, 0.3931243, 1, 0.3843137, 0, 1,
-1.513562, 0.6614148, -0.862578, 1, 0.3882353, 0, 1,
-1.502368, -0.747834, 0.4128957, 1, 0.3960784, 0, 1,
-1.483179, 1.444656, -0.6256422, 1, 0.4039216, 0, 1,
-1.466354, 0.9820799, -1.066624, 1, 0.4078431, 0, 1,
-1.444724, -0.551606, -3.516926, 1, 0.4156863, 0, 1,
-1.44171, 1.356096, -0.960672, 1, 0.4196078, 0, 1,
-1.43668, 0.6057062, -1.827108, 1, 0.427451, 0, 1,
-1.424929, -1.200164, -3.253107, 1, 0.4313726, 0, 1,
-1.423827, 0.2595387, -2.71643, 1, 0.4392157, 0, 1,
-1.416151, 1.135162, -1.126708, 1, 0.4431373, 0, 1,
-1.413554, 0.6185009, -0.9267418, 1, 0.4509804, 0, 1,
-1.405676, 0.3203303, -3.30873, 1, 0.454902, 0, 1,
-1.405007, -0.09474194, -0.1468504, 1, 0.4627451, 0, 1,
-1.389893, -1.057055, -1.856073, 1, 0.4666667, 0, 1,
-1.389529, -0.9602959, -1.300269, 1, 0.4745098, 0, 1,
-1.388033, -0.1365902, -0.2324893, 1, 0.4784314, 0, 1,
-1.377716, -1.807293, -2.903773, 1, 0.4862745, 0, 1,
-1.370486, -0.7862152, -2.433228, 1, 0.4901961, 0, 1,
-1.360579, 0.1271892, -1.776632, 1, 0.4980392, 0, 1,
-1.359411, 0.6899029, -1.852501, 1, 0.5058824, 0, 1,
-1.357394, -0.2935895, -0.2533726, 1, 0.509804, 0, 1,
-1.341874, -0.3394893, -2.871645, 1, 0.5176471, 0, 1,
-1.335259, -0.3035592, -0.8223593, 1, 0.5215687, 0, 1,
-1.327857, 0.6801528, -2.648497, 1, 0.5294118, 0, 1,
-1.327484, 1.337724, 0.5967293, 1, 0.5333334, 0, 1,
-1.323566, -0.7121237, -1.198693, 1, 0.5411765, 0, 1,
-1.318927, -1.426479, -3.301084, 1, 0.5450981, 0, 1,
-1.294453, -0.4550827, -1.909246, 1, 0.5529412, 0, 1,
-1.27117, -0.1599629, -3.373455, 1, 0.5568628, 0, 1,
-1.268244, 0.8320873, -1.511065, 1, 0.5647059, 0, 1,
-1.266837, 1.420736, -1.764345, 1, 0.5686275, 0, 1,
-1.251379, 0.9566445, -2.883938, 1, 0.5764706, 0, 1,
-1.250869, 0.5825441, -2.406912, 1, 0.5803922, 0, 1,
-1.249563, -0.3374425, -3.299877, 1, 0.5882353, 0, 1,
-1.233442, 0.668179, -3.164972, 1, 0.5921569, 0, 1,
-1.213542, 0.093187, -3.079602, 1, 0.6, 0, 1,
-1.20803, 0.1612479, -0.2368277, 1, 0.6078432, 0, 1,
-1.202574, 0.5674813, 0.3443667, 1, 0.6117647, 0, 1,
-1.199223, 0.2310521, -0.4414133, 1, 0.6196079, 0, 1,
-1.197433, -0.6098289, -3.319257, 1, 0.6235294, 0, 1,
-1.195646, 2.501262, -0.4294903, 1, 0.6313726, 0, 1,
-1.194754, -0.3066278, -1.823019, 1, 0.6352941, 0, 1,
-1.192599, -0.4913056, -1.935926, 1, 0.6431373, 0, 1,
-1.190111, 1.63131, -0.7160511, 1, 0.6470588, 0, 1,
-1.184019, -0.459341, -3.671223, 1, 0.654902, 0, 1,
-1.178923, -0.519384, -0.8777002, 1, 0.6588235, 0, 1,
-1.174051, 1.209659, -1.011261, 1, 0.6666667, 0, 1,
-1.164356, 0.8565109, -0.4179881, 1, 0.6705883, 0, 1,
-1.163992, -0.4237758, -0.8362079, 1, 0.6784314, 0, 1,
-1.158508, -0.09334753, -1.662862, 1, 0.682353, 0, 1,
-1.15774, 0.8722609, -1.52082, 1, 0.6901961, 0, 1,
-1.154383, 0.3327478, -0.01020088, 1, 0.6941177, 0, 1,
-1.153828, -0.2283882, -0.8456562, 1, 0.7019608, 0, 1,
-1.151598, -0.1794365, -1.823491, 1, 0.7098039, 0, 1,
-1.146708, -2.304867, -0.8499912, 1, 0.7137255, 0, 1,
-1.145633, 0.2884332, -1.683218, 1, 0.7215686, 0, 1,
-1.142362, 0.01035739, -2.192645, 1, 0.7254902, 0, 1,
-1.141662, -0.6020379, -2.672561, 1, 0.7333333, 0, 1,
-1.13789, 0.1225678, -1.60305, 1, 0.7372549, 0, 1,
-1.130524, -0.9583935, -2.84638, 1, 0.7450981, 0, 1,
-1.127973, -1.765179, -1.449278, 1, 0.7490196, 0, 1,
-1.126574, -0.5012612, -1.984327, 1, 0.7568628, 0, 1,
-1.126436, 0.5488492, 0.1617973, 1, 0.7607843, 0, 1,
-1.11349, -1.08658, -2.369375, 1, 0.7686275, 0, 1,
-1.099826, 1.095843, -2.019163, 1, 0.772549, 0, 1,
-1.098914, 2.823627, -0.1331467, 1, 0.7803922, 0, 1,
-1.089314, -0.104273, -1.971764, 1, 0.7843137, 0, 1,
-1.078705, 0.4663103, -2.007243, 1, 0.7921569, 0, 1,
-1.072845, -0.8248678, -3.697031, 1, 0.7960784, 0, 1,
-1.064544, -0.1835604, -2.378448, 1, 0.8039216, 0, 1,
-1.063709, -0.5207269, -0.009816331, 1, 0.8117647, 0, 1,
-1.056878, -0.224067, -2.709222, 1, 0.8156863, 0, 1,
-1.052449, 1.413515, -3.218766, 1, 0.8235294, 0, 1,
-1.051278, -1.165412, -3.150275, 1, 0.827451, 0, 1,
-1.044393, 0.6423291, -0.6009533, 1, 0.8352941, 0, 1,
-1.042984, -0.8115489, -1.582885, 1, 0.8392157, 0, 1,
-1.042117, 0.7583273, -2.058917, 1, 0.8470588, 0, 1,
-1.028858, -0.6559892, -0.964201, 1, 0.8509804, 0, 1,
-1.028779, 0.7385225, 0.3184314, 1, 0.8588235, 0, 1,
-1.022892, -0.9666442, -3.246361, 1, 0.8627451, 0, 1,
-1.015721, 1.527033, -0.2141773, 1, 0.8705882, 0, 1,
-1.009648, 0.1203501, -2.136101, 1, 0.8745098, 0, 1,
-1.009157, 0.8705392, 0.01575226, 1, 0.8823529, 0, 1,
-1.004221, -1.654912, -0.9618725, 1, 0.8862745, 0, 1,
-0.9999314, -0.2714123, -1.425558, 1, 0.8941177, 0, 1,
-0.9945391, -0.2046578, -1.78092, 1, 0.8980392, 0, 1,
-0.9862748, 0.3576542, -0.5593759, 1, 0.9058824, 0, 1,
-0.9852766, -1.667274, -2.20758, 1, 0.9137255, 0, 1,
-0.9824993, 0.0582179, -0.1912126, 1, 0.9176471, 0, 1,
-0.9815672, -1.403254, -2.438968, 1, 0.9254902, 0, 1,
-0.9774777, 0.03379467, -0.7129584, 1, 0.9294118, 0, 1,
-0.974779, -0.3121453, -1.344588, 1, 0.9372549, 0, 1,
-0.9682262, -0.4117918, -2.296537, 1, 0.9411765, 0, 1,
-0.9675782, -0.8065407, -2.051656, 1, 0.9490196, 0, 1,
-0.9661494, 0.7532768, -0.4705938, 1, 0.9529412, 0, 1,
-0.9643592, -0.8635716, -0.6547338, 1, 0.9607843, 0, 1,
-0.9624525, 0.2940759, -2.781504, 1, 0.9647059, 0, 1,
-0.9543, -0.3578839, -2.163414, 1, 0.972549, 0, 1,
-0.9533723, -0.3132641, -0.7187308, 1, 0.9764706, 0, 1,
-0.9512743, 0.4979679, -1.218851, 1, 0.9843137, 0, 1,
-0.946802, 0.6421473, -0.1415815, 1, 0.9882353, 0, 1,
-0.9450423, -1.031269, -1.475548, 1, 0.9960784, 0, 1,
-0.9424362, 0.2714522, -1.34646, 0.9960784, 1, 0, 1,
-0.9337642, 0.3203187, -1.395979, 0.9921569, 1, 0, 1,
-0.9298315, 0.1669265, -1.133809, 0.9843137, 1, 0, 1,
-0.9237689, 0.9086359, -0.9279258, 0.9803922, 1, 0, 1,
-0.9161106, -1.002416, -2.559236, 0.972549, 1, 0, 1,
-0.9157199, -0.8963664, -2.48461, 0.9686275, 1, 0, 1,
-0.9118827, -1.632137, -3.564873, 0.9607843, 1, 0, 1,
-0.9103494, 1.305251, -1.546351, 0.9568627, 1, 0, 1,
-0.9076132, -1.002863, -3.28006, 0.9490196, 1, 0, 1,
-0.8950059, -0.07277359, -2.077777, 0.945098, 1, 0, 1,
-0.8908901, -0.7121075, -3.724412, 0.9372549, 1, 0, 1,
-0.8901013, -0.6307288, -3.518046, 0.9333333, 1, 0, 1,
-0.8884346, 0.4371676, -0.2344298, 0.9254902, 1, 0, 1,
-0.8876677, 0.7285705, -0.6317063, 0.9215686, 1, 0, 1,
-0.884937, -0.05065211, -2.476614, 0.9137255, 1, 0, 1,
-0.8751918, 1.578875, -1.445343, 0.9098039, 1, 0, 1,
-0.864483, -0.4843699, -3.42396, 0.9019608, 1, 0, 1,
-0.8586784, 1.391955, -1.478655, 0.8941177, 1, 0, 1,
-0.8539004, -0.2549466, -2.424956, 0.8901961, 1, 0, 1,
-0.8517321, 0.631231, 0.06637809, 0.8823529, 1, 0, 1,
-0.8492798, 1.38102, -0.6429893, 0.8784314, 1, 0, 1,
-0.8491534, -0.03481737, -2.548894, 0.8705882, 1, 0, 1,
-0.8468403, 0.6280739, 0.2616625, 0.8666667, 1, 0, 1,
-0.84022, 1.422221, -1.234712, 0.8588235, 1, 0, 1,
-0.8399331, -0.3931484, -1.772664, 0.854902, 1, 0, 1,
-0.8387221, 0.2970822, -0.4005271, 0.8470588, 1, 0, 1,
-0.8338681, -0.2258166, -1.279435, 0.8431373, 1, 0, 1,
-0.832538, 2.058769, 2.297985, 0.8352941, 1, 0, 1,
-0.8208817, 1.547277, -0.161969, 0.8313726, 1, 0, 1,
-0.8192058, -0.0876568, -1.410845, 0.8235294, 1, 0, 1,
-0.8191008, 0.1088194, -2.316737, 0.8196079, 1, 0, 1,
-0.8123409, -0.5929351, -2.352897, 0.8117647, 1, 0, 1,
-0.7960991, -0.6711251, -2.835067, 0.8078431, 1, 0, 1,
-0.7956935, -0.569317, -1.993583, 0.8, 1, 0, 1,
-0.794168, -0.4439664, -2.446837, 0.7921569, 1, 0, 1,
-0.7894268, -0.714159, -0.9526469, 0.7882353, 1, 0, 1,
-0.78874, 0.1259507, 0.5368828, 0.7803922, 1, 0, 1,
-0.7875037, 0.7203074, -1.309905, 0.7764706, 1, 0, 1,
-0.7874174, -2.255047, -3.480998, 0.7686275, 1, 0, 1,
-0.7835206, 0.5059296, -1.721813, 0.7647059, 1, 0, 1,
-0.7733775, -0.1147017, -2.547324, 0.7568628, 1, 0, 1,
-0.7723892, -0.8148469, -2.032161, 0.7529412, 1, 0, 1,
-0.7667491, 0.5903735, -0.6125411, 0.7450981, 1, 0, 1,
-0.7636515, 0.1165497, -1.20828, 0.7411765, 1, 0, 1,
-0.763458, -1.571805, -1.976024, 0.7333333, 1, 0, 1,
-0.7627407, -0.4820412, -1.562382, 0.7294118, 1, 0, 1,
-0.761262, 2.221267, 0.1052269, 0.7215686, 1, 0, 1,
-0.7593846, 0.1086783, -2.871553, 0.7176471, 1, 0, 1,
-0.7586707, -0.26483, -2.887661, 0.7098039, 1, 0, 1,
-0.7522697, -0.6758531, -0.6281186, 0.7058824, 1, 0, 1,
-0.7502539, 1.616139, -0.06891218, 0.6980392, 1, 0, 1,
-0.7492535, -0.3720835, -2.694363, 0.6901961, 1, 0, 1,
-0.7438781, -0.7763888, -3.750841, 0.6862745, 1, 0, 1,
-0.7420821, 0.5012048, -1.200172, 0.6784314, 1, 0, 1,
-0.7399948, -1.579992, -2.687842, 0.6745098, 1, 0, 1,
-0.7381097, 0.5482832, -2.419943, 0.6666667, 1, 0, 1,
-0.736735, -0.5188025, -3.225807, 0.6627451, 1, 0, 1,
-0.7366533, -0.8209196, -2.316195, 0.654902, 1, 0, 1,
-0.7318932, -0.7844843, -1.09063, 0.6509804, 1, 0, 1,
-0.7283633, 0.7153978, 0.6803507, 0.6431373, 1, 0, 1,
-0.7275889, -0.6787412, -1.339276, 0.6392157, 1, 0, 1,
-0.7234398, -0.168716, -1.374407, 0.6313726, 1, 0, 1,
-0.7230522, 0.4378681, -1.764508, 0.627451, 1, 0, 1,
-0.7159047, -0.9174986, -4.050108, 0.6196079, 1, 0, 1,
-0.7101755, 0.3665362, 0.6563702, 0.6156863, 1, 0, 1,
-0.7048802, -0.3279902, -3.065238, 0.6078432, 1, 0, 1,
-0.7030943, 0.9379758, -1.402736, 0.6039216, 1, 0, 1,
-0.6983409, 1.871229, -1.302017, 0.5960785, 1, 0, 1,
-0.6969213, -2.190035, -3.267695, 0.5882353, 1, 0, 1,
-0.6962515, -0.5780663, -1.837821, 0.5843138, 1, 0, 1,
-0.6962209, 0.7639242, -0.330592, 0.5764706, 1, 0, 1,
-0.695913, 0.4876993, -1.281968, 0.572549, 1, 0, 1,
-0.6958494, -1.33571, -2.912178, 0.5647059, 1, 0, 1,
-0.6928461, 0.1641711, -1.695226, 0.5607843, 1, 0, 1,
-0.6927553, 1.124524, -1.586695, 0.5529412, 1, 0, 1,
-0.6894659, -0.009149278, -1.201916, 0.5490196, 1, 0, 1,
-0.6852829, 2.486912, 0.09757922, 0.5411765, 1, 0, 1,
-0.6825191, 0.06116479, -2.746381, 0.5372549, 1, 0, 1,
-0.6807398, 1.309962, -0.5341485, 0.5294118, 1, 0, 1,
-0.6782167, 1.319297, 0.893567, 0.5254902, 1, 0, 1,
-0.671938, 2.499885, -0.8195438, 0.5176471, 1, 0, 1,
-0.6715701, 1.164085, 0.1685774, 0.5137255, 1, 0, 1,
-0.6696256, 0.6222736, -0.05463573, 0.5058824, 1, 0, 1,
-0.6686006, 0.2739632, -1.611529, 0.5019608, 1, 0, 1,
-0.6673635, -0.8507982, -3.191296, 0.4941176, 1, 0, 1,
-0.666891, 1.133964, 0.7282365, 0.4862745, 1, 0, 1,
-0.6665532, 1.588257, 0.9494011, 0.4823529, 1, 0, 1,
-0.6661838, -1.208243, -2.764811, 0.4745098, 1, 0, 1,
-0.6657751, -1.191488, -2.546118, 0.4705882, 1, 0, 1,
-0.6646695, 0.1247031, -4.993697, 0.4627451, 1, 0, 1,
-0.6639869, -0.963901, -3.906202, 0.4588235, 1, 0, 1,
-0.6589081, 0.391973, -0.2570865, 0.4509804, 1, 0, 1,
-0.6578304, 1.089315, -1.688113, 0.4470588, 1, 0, 1,
-0.6562295, -0.4450906, -1.592843, 0.4392157, 1, 0, 1,
-0.650428, 1.33924, -1.61056, 0.4352941, 1, 0, 1,
-0.6497343, -1.063981, -0.757395, 0.427451, 1, 0, 1,
-0.6462909, 0.1010347, -1.724936, 0.4235294, 1, 0, 1,
-0.6460124, -0.256702, -2.180535, 0.4156863, 1, 0, 1,
-0.6443001, -0.337702, -1.784856, 0.4117647, 1, 0, 1,
-0.6441141, -2.182739, -2.902661, 0.4039216, 1, 0, 1,
-0.6432711, 1.267388, -1.446148, 0.3960784, 1, 0, 1,
-0.6368525, -0.7625272, -2.432213, 0.3921569, 1, 0, 1,
-0.6333247, -0.1008224, -1.03578, 0.3843137, 1, 0, 1,
-0.6319509, -0.7965729, -4.471379, 0.3803922, 1, 0, 1,
-0.6319228, -0.8926932, -2.746596, 0.372549, 1, 0, 1,
-0.6282517, -2.052004, -2.430246, 0.3686275, 1, 0, 1,
-0.6274564, -0.6866535, -2.785797, 0.3607843, 1, 0, 1,
-0.6251442, 0.6414732, 0.2130299, 0.3568628, 1, 0, 1,
-0.6213772, 0.04251156, -2.632119, 0.3490196, 1, 0, 1,
-0.6150287, 1.123136, -0.2056904, 0.345098, 1, 0, 1,
-0.6129356, 0.09421223, -1.794983, 0.3372549, 1, 0, 1,
-0.6106584, 0.8190108, 1.136607, 0.3333333, 1, 0, 1,
-0.6072674, -2.834282, -4.022396, 0.3254902, 1, 0, 1,
-0.6071612, -0.8917452, -2.27209, 0.3215686, 1, 0, 1,
-0.6040347, 0.59254, -0.05473626, 0.3137255, 1, 0, 1,
-0.6017102, 0.3302676, -2.330278, 0.3098039, 1, 0, 1,
-0.6012475, 0.01144912, -1.738329, 0.3019608, 1, 0, 1,
-0.597726, -0.613481, -1.78083, 0.2941177, 1, 0, 1,
-0.5931904, -0.4511555, -2.080482, 0.2901961, 1, 0, 1,
-0.5907069, 0.008838529, -2.47293, 0.282353, 1, 0, 1,
-0.5906553, 0.02585518, -0.6774111, 0.2784314, 1, 0, 1,
-0.5803429, 0.4045022, -0.3921228, 0.2705882, 1, 0, 1,
-0.5772651, 1.655751, 0.9140882, 0.2666667, 1, 0, 1,
-0.5769917, -0.1898489, -0.3299386, 0.2588235, 1, 0, 1,
-0.5727159, 0.6308821, -0.8361333, 0.254902, 1, 0, 1,
-0.5705621, -0.6297927, -1.351997, 0.2470588, 1, 0, 1,
-0.570071, 0.1022291, -1.427224, 0.2431373, 1, 0, 1,
-0.5670983, -0.2252008, -2.891571, 0.2352941, 1, 0, 1,
-0.56675, 0.8746856, -0.6176879, 0.2313726, 1, 0, 1,
-0.5643224, -0.9922757, -1.178125, 0.2235294, 1, 0, 1,
-0.5579665, 0.1827573, -1.022286, 0.2196078, 1, 0, 1,
-0.5574383, -3.220052, -3.895184, 0.2117647, 1, 0, 1,
-0.5569441, 1.749837, 0.5777324, 0.2078431, 1, 0, 1,
-0.5566986, 1.165, -0.428823, 0.2, 1, 0, 1,
-0.5552307, 0.2276647, -1.047047, 0.1921569, 1, 0, 1,
-0.5521581, -0.6840204, -1.177766, 0.1882353, 1, 0, 1,
-0.5491031, -0.5290974, -1.449031, 0.1803922, 1, 0, 1,
-0.5463002, 0.04070338, -2.886417, 0.1764706, 1, 0, 1,
-0.5454986, -0.4663772, -1.85358, 0.1686275, 1, 0, 1,
-0.5419977, -0.3069935, -3.262191, 0.1647059, 1, 0, 1,
-0.5328405, -0.6901211, -1.846904, 0.1568628, 1, 0, 1,
-0.5327489, 0.5939214, -0.9022352, 0.1529412, 1, 0, 1,
-0.5320415, 0.7310721, -1.61298, 0.145098, 1, 0, 1,
-0.5181206, 1.336447, 0.1294628, 0.1411765, 1, 0, 1,
-0.5163959, -1.396435, -2.424737, 0.1333333, 1, 0, 1,
-0.5111161, 0.7095997, -0.871257, 0.1294118, 1, 0, 1,
-0.5107298, 1.001151, -1.070612, 0.1215686, 1, 0, 1,
-0.5102165, -0.7216427, -3.25778, 0.1176471, 1, 0, 1,
-0.5099929, -0.4385206, -3.523745, 0.1098039, 1, 0, 1,
-0.5014098, -0.93239, -2.643546, 0.1058824, 1, 0, 1,
-0.4983246, 1.410983, -1.310456, 0.09803922, 1, 0, 1,
-0.4967658, -0.974432, -4.528101, 0.09019608, 1, 0, 1,
-0.491972, 0.01878203, -1.45186, 0.08627451, 1, 0, 1,
-0.4914246, -1.446289, -2.13745, 0.07843138, 1, 0, 1,
-0.485974, -1.69023, -2.808573, 0.07450981, 1, 0, 1,
-0.4775321, 1.126032, 0.3880635, 0.06666667, 1, 0, 1,
-0.4752732, -0.5740615, -2.608106, 0.0627451, 1, 0, 1,
-0.4741202, -1.358856, -2.925576, 0.05490196, 1, 0, 1,
-0.4718108, 1.454033, -1.595714, 0.05098039, 1, 0, 1,
-0.4712711, -1.516573, -2.45481, 0.04313726, 1, 0, 1,
-0.4692559, 0.5379767, -2.379129, 0.03921569, 1, 0, 1,
-0.4647399, -0.3313922, -1.249977, 0.03137255, 1, 0, 1,
-0.4632056, -0.617669, -2.457822, 0.02745098, 1, 0, 1,
-0.463144, -0.2357569, -0.4572864, 0.01960784, 1, 0, 1,
-0.4629688, 0.1187567, -3.831522, 0.01568628, 1, 0, 1,
-0.4575506, 1.645803, 0.8076143, 0.007843138, 1, 0, 1,
-0.4573968, -0.1135208, -3.872646, 0.003921569, 1, 0, 1,
-0.4562585, -0.06929256, -2.495142, 0, 1, 0.003921569, 1,
-0.4561138, 0.1460294, -1.424161, 0, 1, 0.01176471, 1,
-0.4538859, 1.931273, -1.099118, 0, 1, 0.01568628, 1,
-0.4535803, -1.629986, -3.739712, 0, 1, 0.02352941, 1,
-0.4530051, -0.3327513, -2.714107, 0, 1, 0.02745098, 1,
-0.4508129, -1.318549, -2.917286, 0, 1, 0.03529412, 1,
-0.448353, -0.7827872, -2.870999, 0, 1, 0.03921569, 1,
-0.4479009, 1.06684, -1.456225, 0, 1, 0.04705882, 1,
-0.4458105, -0.2645378, -0.2169883, 0, 1, 0.05098039, 1,
-0.4413194, 0.2309188, -1.537064, 0, 1, 0.05882353, 1,
-0.4406353, -1.488907, -2.7605, 0, 1, 0.0627451, 1,
-0.4402747, -1.337147, -2.80028, 0, 1, 0.07058824, 1,
-0.4393798, 0.1142505, -1.186754, 0, 1, 0.07450981, 1,
-0.4367061, 2.77167, -0.3706028, 0, 1, 0.08235294, 1,
-0.4349048, -1.387861, -4.146856, 0, 1, 0.08627451, 1,
-0.4286723, -0.1809165, -1.752561, 0, 1, 0.09411765, 1,
-0.4190596, -2.127262, -4.796531, 0, 1, 0.1019608, 1,
-0.4178107, 0.9453621, -0.1064492, 0, 1, 0.1058824, 1,
-0.4170963, 0.9341649, 1.732503, 0, 1, 0.1137255, 1,
-0.4147011, 0.2051786, -1.340279, 0, 1, 0.1176471, 1,
-0.4138042, -0.5045091, -2.228595, 0, 1, 0.1254902, 1,
-0.4124417, -0.4855082, -2.041355, 0, 1, 0.1294118, 1,
-0.4058984, -1.061247, -1.799224, 0, 1, 0.1372549, 1,
-0.4038545, 0.4033389, -1.467263, 0, 1, 0.1411765, 1,
-0.4036172, -0.9581198, -0.6995759, 0, 1, 0.1490196, 1,
-0.4026377, 0.3766596, -0.1049534, 0, 1, 0.1529412, 1,
-0.4021367, -0.1253621, -1.559005, 0, 1, 0.1607843, 1,
-0.3967502, 0.9468027, 0.8505384, 0, 1, 0.1647059, 1,
-0.3960521, 1.053943, 0.5787482, 0, 1, 0.172549, 1,
-0.3932615, -0.3191968, -2.54267, 0, 1, 0.1764706, 1,
-0.392195, -0.3001823, -3.056716, 0, 1, 0.1843137, 1,
-0.3873188, 1.285461, -0.5529329, 0, 1, 0.1882353, 1,
-0.3847789, -2.634201, -2.68316, 0, 1, 0.1960784, 1,
-0.3825573, -1.112001, -4.518332, 0, 1, 0.2039216, 1,
-0.3775074, 0.4008943, -3.104098, 0, 1, 0.2078431, 1,
-0.3711458, 0.3226261, -1.141835, 0, 1, 0.2156863, 1,
-0.3628005, 1.037843, -0.3940342, 0, 1, 0.2196078, 1,
-0.3571467, 0.8611793, 0.1863298, 0, 1, 0.227451, 1,
-0.3513233, 0.7733763, 0.2257946, 0, 1, 0.2313726, 1,
-0.3513034, 0.3973864, 0.009919343, 0, 1, 0.2392157, 1,
-0.3501255, -0.8412825, -3.213847, 0, 1, 0.2431373, 1,
-0.3464004, -1.904892, -2.573449, 0, 1, 0.2509804, 1,
-0.3450567, 0.2611143, -0.5102952, 0, 1, 0.254902, 1,
-0.3438073, -1.064873, -2.532784, 0, 1, 0.2627451, 1,
-0.338963, 0.1602401, -0.8045517, 0, 1, 0.2666667, 1,
-0.3372065, -1.398489, -2.833353, 0, 1, 0.2745098, 1,
-0.3357243, 0.7736132, 0.03931393, 0, 1, 0.2784314, 1,
-0.3356828, -0.4205157, -4.877378, 0, 1, 0.2862745, 1,
-0.3312762, 0.7881607, -1.699132, 0, 1, 0.2901961, 1,
-0.3272354, 0.9251348, -0.02621588, 0, 1, 0.2980392, 1,
-0.3268245, -0.3106401, -1.07647, 0, 1, 0.3058824, 1,
-0.3209746, -1.120933, -1.356286, 0, 1, 0.3098039, 1,
-0.3135022, -0.2958292, -3.210675, 0, 1, 0.3176471, 1,
-0.309451, -1.658741, -2.373104, 0, 1, 0.3215686, 1,
-0.3079511, 0.6586812, 0.4811193, 0, 1, 0.3294118, 1,
-0.296773, 2.476069, -0.1589185, 0, 1, 0.3333333, 1,
-0.2964343, -0.8434373, -1.564595, 0, 1, 0.3411765, 1,
-0.2922106, 1.212985, -0.907816, 0, 1, 0.345098, 1,
-0.2886803, -0.3622822, -2.676323, 0, 1, 0.3529412, 1,
-0.2845981, 0.03137173, -2.791474, 0, 1, 0.3568628, 1,
-0.2820917, -0.02243024, -0.2872886, 0, 1, 0.3647059, 1,
-0.2782123, 0.117277, -0.8274245, 0, 1, 0.3686275, 1,
-0.2727343, 1.484238, -1.019496, 0, 1, 0.3764706, 1,
-0.2705976, -1.477646, -2.382253, 0, 1, 0.3803922, 1,
-0.2694901, 1.202755, 1.155623, 0, 1, 0.3882353, 1,
-0.2693199, -0.4961862, -1.928751, 0, 1, 0.3921569, 1,
-0.2678403, 0.4474441, 0.4463859, 0, 1, 0.4, 1,
-0.2630731, -0.2260081, -2.28173, 0, 1, 0.4078431, 1,
-0.2626539, -1.206397, -4.267924, 0, 1, 0.4117647, 1,
-0.260318, 0.2389359, -0.575325, 0, 1, 0.4196078, 1,
-0.2586544, -0.1332849, -2.370668, 0, 1, 0.4235294, 1,
-0.2585375, -0.3734259, -1.792884, 0, 1, 0.4313726, 1,
-0.2546757, -0.02755748, -0.4887141, 0, 1, 0.4352941, 1,
-0.2492314, -1.559324, -2.958162, 0, 1, 0.4431373, 1,
-0.2487077, -0.5097461, -2.745808, 0, 1, 0.4470588, 1,
-0.2475141, -0.09446473, -3.439271, 0, 1, 0.454902, 1,
-0.2426736, 0.8500147, 0.7501308, 0, 1, 0.4588235, 1,
-0.2306456, 1.308876, -0.6618946, 0, 1, 0.4666667, 1,
-0.2255003, -0.5772521, -3.829185, 0, 1, 0.4705882, 1,
-0.2143074, 1.04551, 0.643832, 0, 1, 0.4784314, 1,
-0.2137222, -1.236761, -1.591417, 0, 1, 0.4823529, 1,
-0.2130471, -2.069727, -2.090416, 0, 1, 0.4901961, 1,
-0.212127, -1.053708, -3.733731, 0, 1, 0.4941176, 1,
-0.2114342, 2.967974, 2.214455, 0, 1, 0.5019608, 1,
-0.2106626, -1.251707, -2.26507, 0, 1, 0.509804, 1,
-0.2066031, 0.462963, 0.01437466, 0, 1, 0.5137255, 1,
-0.2033174, -0.4302125, -2.462189, 0, 1, 0.5215687, 1,
-0.2024365, 0.5705513, 0.5610374, 0, 1, 0.5254902, 1,
-0.1996155, -0.6851859, -4.446589, 0, 1, 0.5333334, 1,
-0.1893122, -0.7961442, -3.459471, 0, 1, 0.5372549, 1,
-0.1885535, 0.9940306, 0.2422849, 0, 1, 0.5450981, 1,
-0.187597, 2.087334, -1.277213, 0, 1, 0.5490196, 1,
-0.1865921, -0.04562294, -3.244101, 0, 1, 0.5568628, 1,
-0.1863004, -0.3381689, -3.275316, 0, 1, 0.5607843, 1,
-0.1840594, 1.208177, -0.4391421, 0, 1, 0.5686275, 1,
-0.1809734, -0.2912427, -1.594071, 0, 1, 0.572549, 1,
-0.1809599, 0.1065554, -0.127874, 0, 1, 0.5803922, 1,
-0.1764303, 0.1073734, 0.2431505, 0, 1, 0.5843138, 1,
-0.1744824, 0.5454828, 0.4465189, 0, 1, 0.5921569, 1,
-0.1693849, 0.3941027, 0.4667343, 0, 1, 0.5960785, 1,
-0.1550178, 0.6299953, 1.403781, 0, 1, 0.6039216, 1,
-0.1542489, 0.198576, -2.791661, 0, 1, 0.6117647, 1,
-0.1507219, -1.207857, -3.280358, 0, 1, 0.6156863, 1,
-0.1474069, 0.8602596, 0.1856305, 0, 1, 0.6235294, 1,
-0.1452649, -0.2996647, -4.127781, 0, 1, 0.627451, 1,
-0.1390672, 0.6444715, -2.247567, 0, 1, 0.6352941, 1,
-0.1345337, 1.55899, -0.199316, 0, 1, 0.6392157, 1,
-0.1305664, 0.7889607, -0.2919916, 0, 1, 0.6470588, 1,
-0.1304376, -1.153659, -1.874134, 0, 1, 0.6509804, 1,
-0.1279999, -0.9144741, -4.715947, 0, 1, 0.6588235, 1,
-0.1265973, -0.4206108, -5.017754, 0, 1, 0.6627451, 1,
-0.1235982, -0.9076632, -3.765744, 0, 1, 0.6705883, 1,
-0.1228444, 0.3151633, -0.8175015, 0, 1, 0.6745098, 1,
-0.1210763, 0.691775, -0.4987411, 0, 1, 0.682353, 1,
-0.1175615, 1.105494, 1.15576, 0, 1, 0.6862745, 1,
-0.116529, 2.383463, 1.610392, 0, 1, 0.6941177, 1,
-0.113464, -0.06535316, -1.050722, 0, 1, 0.7019608, 1,
-0.1131091, -0.227493, -1.673787, 0, 1, 0.7058824, 1,
-0.1125935, 1.407588, -0.4911424, 0, 1, 0.7137255, 1,
-0.112585, 0.1963779, 0.04712828, 0, 1, 0.7176471, 1,
-0.1080022, 1.318063, -0.8119069, 0, 1, 0.7254902, 1,
-0.1078662, -0.819872, -3.112765, 0, 1, 0.7294118, 1,
-0.1074915, -2.125172, -3.229165, 0, 1, 0.7372549, 1,
-0.1070268, 0.7295272, 0.7224712, 0, 1, 0.7411765, 1,
-0.1000823, -0.3246724, -2.580783, 0, 1, 0.7490196, 1,
-0.09742597, -0.4057952, -1.678074, 0, 1, 0.7529412, 1,
-0.09618305, 0.8685415, 0.1721377, 0, 1, 0.7607843, 1,
-0.09459457, -0.2173322, -2.480386, 0, 1, 0.7647059, 1,
-0.09088912, -1.255673, -4.015872, 0, 1, 0.772549, 1,
-0.08962231, -0.8908408, -3.186884, 0, 1, 0.7764706, 1,
-0.08900817, 0.1248172, 0.3315924, 0, 1, 0.7843137, 1,
-0.08788722, -0.4434628, -2.171192, 0, 1, 0.7882353, 1,
-0.08623711, 1.197232, 2.065778, 0, 1, 0.7960784, 1,
-0.08597352, 0.2819306, -0.2513858, 0, 1, 0.8039216, 1,
-0.08245827, 0.9391087, 0.4987766, 0, 1, 0.8078431, 1,
-0.07078619, -0.1583657, -2.355786, 0, 1, 0.8156863, 1,
-0.06885089, -0.8007733, -4.528359, 0, 1, 0.8196079, 1,
-0.06658937, 0.4066419, 0.05617798, 0, 1, 0.827451, 1,
-0.06641489, -0.5393736, -1.947779, 0, 1, 0.8313726, 1,
-0.06465433, -0.8853942, -2.136938, 0, 1, 0.8392157, 1,
-0.06286253, 0.01923541, -1.215148, 0, 1, 0.8431373, 1,
-0.05797367, 1.366382, 0.4126568, 0, 1, 0.8509804, 1,
-0.05648897, 0.9586509, -0.9746702, 0, 1, 0.854902, 1,
-0.05398103, 0.6892284, -0.5657316, 0, 1, 0.8627451, 1,
-0.0520807, 0.7596886, -0.205035, 0, 1, 0.8666667, 1,
-0.05157477, 0.1230663, -1.09015, 0, 1, 0.8745098, 1,
-0.0497768, 0.2566933, -1.038328, 0, 1, 0.8784314, 1,
-0.04842026, 0.4827779, -0.787035, 0, 1, 0.8862745, 1,
-0.04766849, -0.3109266, -2.428546, 0, 1, 0.8901961, 1,
-0.04697876, 1.126542, 1.092004, 0, 1, 0.8980392, 1,
-0.04160932, -0.3729136, -3.05135, 0, 1, 0.9058824, 1,
-0.03707016, -0.2356728, -2.775111, 0, 1, 0.9098039, 1,
-0.03593593, 0.7759954, -0.3394249, 0, 1, 0.9176471, 1,
-0.03450873, -1.837877, -2.404111, 0, 1, 0.9215686, 1,
-0.02992372, 2.038733, 0.8696924, 0, 1, 0.9294118, 1,
-0.0253091, -1.993959, -2.159927, 0, 1, 0.9333333, 1,
-0.02364457, -0.09816109, -2.485614, 0, 1, 0.9411765, 1,
-0.02193182, 0.1840966, -1.255983, 0, 1, 0.945098, 1,
-0.01499636, -0.4390156, -3.134488, 0, 1, 0.9529412, 1,
-0.008573901, 1.480643, -0.3691089, 0, 1, 0.9568627, 1,
-0.001767501, 0.9527234, -0.5843797, 0, 1, 0.9647059, 1,
0.002034038, -1.124562, 1.956852, 0, 1, 0.9686275, 1,
0.003149313, 1.577598, -0.6753864, 0, 1, 0.9764706, 1,
0.003999842, 0.3681759, 0.1374716, 0, 1, 0.9803922, 1,
0.004385132, -0.7400028, 4.139982, 0, 1, 0.9882353, 1,
0.008759849, -0.6132034, 2.382011, 0, 1, 0.9921569, 1,
0.01157631, 0.631928, 1.544426, 0, 1, 1, 1,
0.01195992, 0.5231457, 0.7166545, 0, 0.9921569, 1, 1,
0.01251099, -0.6329162, 4.665961, 0, 0.9882353, 1, 1,
0.01262906, -0.5070133, 3.002888, 0, 0.9803922, 1, 1,
0.01494197, 0.9860004, -0.06957394, 0, 0.9764706, 1, 1,
0.01787867, -0.6215922, 1.632324, 0, 0.9686275, 1, 1,
0.02235026, 1.526407, -0.1118535, 0, 0.9647059, 1, 1,
0.02309161, -0.5200143, 2.99166, 0, 0.9568627, 1, 1,
0.02723375, -1.512983, 2.931083, 0, 0.9529412, 1, 1,
0.02803141, -0.8229427, 2.210205, 0, 0.945098, 1, 1,
0.03046666, -0.8016377, 1.922425, 0, 0.9411765, 1, 1,
0.03224281, -0.1460492, 1.997279, 0, 0.9333333, 1, 1,
0.03233169, 0.3168937, 0.2816928, 0, 0.9294118, 1, 1,
0.03271483, 0.9090657, -0.3990995, 0, 0.9215686, 1, 1,
0.03459827, -0.7724057, 2.146492, 0, 0.9176471, 1, 1,
0.03841299, -0.02540345, 4.092297, 0, 0.9098039, 1, 1,
0.04137884, -0.3697635, 2.418625, 0, 0.9058824, 1, 1,
0.04362718, 0.4755295, -1.066022, 0, 0.8980392, 1, 1,
0.04433063, -0.1932603, 3.235224, 0, 0.8901961, 1, 1,
0.05516065, 0.2332033, 2.010065, 0, 0.8862745, 1, 1,
0.05736414, -0.01415547, 1.155955, 0, 0.8784314, 1, 1,
0.05889815, -0.3199417, 1.788091, 0, 0.8745098, 1, 1,
0.06069685, -0.9603446, 3.274349, 0, 0.8666667, 1, 1,
0.06250127, 1.250629, -0.6994897, 0, 0.8627451, 1, 1,
0.06429493, 0.7370299, 1.222725, 0, 0.854902, 1, 1,
0.06532349, 0.2217721, 0.8295617, 0, 0.8509804, 1, 1,
0.06820654, -0.1123802, 3.634692, 0, 0.8431373, 1, 1,
0.0705511, -0.2672792, 3.125632, 0, 0.8392157, 1, 1,
0.07063223, -1.729853, 3.845731, 0, 0.8313726, 1, 1,
0.07198949, 0.8650973, 2.091027, 0, 0.827451, 1, 1,
0.0752058, -0.235033, 1.806602, 0, 0.8196079, 1, 1,
0.07670102, 0.396975, -0.122217, 0, 0.8156863, 1, 1,
0.07925141, -0.382411, 2.619915, 0, 0.8078431, 1, 1,
0.08734936, 0.03536996, 0.1865344, 0, 0.8039216, 1, 1,
0.09127759, -0.2725965, 4.66692, 0, 0.7960784, 1, 1,
0.1038163, -1.048373, 3.149129, 0, 0.7882353, 1, 1,
0.105514, -0.4549684, 3.157807, 0, 0.7843137, 1, 1,
0.1062857, -0.1734943, 2.392222, 0, 0.7764706, 1, 1,
0.1229635, 1.111781, -0.06670385, 0, 0.772549, 1, 1,
0.1282316, -0.06010852, 2.616862, 0, 0.7647059, 1, 1,
0.1308328, -0.8301869, 3.950151, 0, 0.7607843, 1, 1,
0.132138, 1.250594, 1.082363, 0, 0.7529412, 1, 1,
0.1353815, -0.6760983, 3.451478, 0, 0.7490196, 1, 1,
0.1374122, -0.9446136, 2.280581, 0, 0.7411765, 1, 1,
0.1374724, -0.3226595, 0.9094808, 0, 0.7372549, 1, 1,
0.1403777, 1.619522, -0.9383989, 0, 0.7294118, 1, 1,
0.1416409, 0.8661434, -0.1831473, 0, 0.7254902, 1, 1,
0.1423203, 0.9177673, -0.5102265, 0, 0.7176471, 1, 1,
0.1437142, 1.077267, -0.1958449, 0, 0.7137255, 1, 1,
0.1444464, 0.6411555, 0.3604826, 0, 0.7058824, 1, 1,
0.1480965, -1.207028, 1.43628, 0, 0.6980392, 1, 1,
0.152485, -0.2030746, 1.09887, 0, 0.6941177, 1, 1,
0.1536891, -0.9052215, 4.5646, 0, 0.6862745, 1, 1,
0.1545371, -0.1102769, 0.8932557, 0, 0.682353, 1, 1,
0.1548975, 0.686056, -0.1752968, 0, 0.6745098, 1, 1,
0.1560907, 0.3738553, -0.3868724, 0, 0.6705883, 1, 1,
0.1583355, 0.2908571, 3.176492, 0, 0.6627451, 1, 1,
0.1645542, -0.3831955, 4.505592, 0, 0.6588235, 1, 1,
0.1659945, 0.6419185, -0.6149164, 0, 0.6509804, 1, 1,
0.166855, 0.5747451, 1.675279, 0, 0.6470588, 1, 1,
0.1693052, 2.166131, 0.2383078, 0, 0.6392157, 1, 1,
0.1693554, 1.813858, 1.737781, 0, 0.6352941, 1, 1,
0.1705143, 0.9683397, 0.09540422, 0, 0.627451, 1, 1,
0.1721234, -0.6413254, 5.816057, 0, 0.6235294, 1, 1,
0.1747661, 0.4899938, 0.6897218, 0, 0.6156863, 1, 1,
0.1772232, 0.9684198, 2.230504, 0, 0.6117647, 1, 1,
0.1832274, 0.7682574, 0.660994, 0, 0.6039216, 1, 1,
0.1836425, -0.2183074, 2.262801, 0, 0.5960785, 1, 1,
0.189614, 1.155723, 0.03460433, 0, 0.5921569, 1, 1,
0.1907014, -1.063528, 2.636366, 0, 0.5843138, 1, 1,
0.1917501, 1.150081, -0.1215067, 0, 0.5803922, 1, 1,
0.1940307, 0.971323, -0.04613196, 0, 0.572549, 1, 1,
0.1940642, -0.1720821, 2.378814, 0, 0.5686275, 1, 1,
0.197605, -1.948951, 2.113022, 0, 0.5607843, 1, 1,
0.2037081, -0.9729015, 2.608968, 0, 0.5568628, 1, 1,
0.2054968, -1.623979, 3.953258, 0, 0.5490196, 1, 1,
0.2092737, -2.355299, 2.810608, 0, 0.5450981, 1, 1,
0.2105072, 0.7058664, 0.3422226, 0, 0.5372549, 1, 1,
0.212869, -0.1608516, 1.144729, 0, 0.5333334, 1, 1,
0.2144603, -1.264589, 2.535975, 0, 0.5254902, 1, 1,
0.2154493, 1.140168, 0.8160967, 0, 0.5215687, 1, 1,
0.2185254, -1.570967, 4.007838, 0, 0.5137255, 1, 1,
0.2202709, 1.20779, -1.894772, 0, 0.509804, 1, 1,
0.2210521, 1.924385, 0.579096, 0, 0.5019608, 1, 1,
0.2228029, 0.4878036, 0.1610022, 0, 0.4941176, 1, 1,
0.2255768, -0.9802237, 3.527468, 0, 0.4901961, 1, 1,
0.228273, -1.126816, 2.273377, 0, 0.4823529, 1, 1,
0.2293514, 0.8170467, 0.8914577, 0, 0.4784314, 1, 1,
0.2338677, -1.65468, 4.060611, 0, 0.4705882, 1, 1,
0.2344353, -0.4917919, 2.00997, 0, 0.4666667, 1, 1,
0.2348863, 0.2458135, 0.3687988, 0, 0.4588235, 1, 1,
0.2377612, -2.522604, 3.008036, 0, 0.454902, 1, 1,
0.238542, 0.2770807, 1.952024, 0, 0.4470588, 1, 1,
0.2396756, 0.5718123, 1.043099, 0, 0.4431373, 1, 1,
0.2413337, -0.09907565, 0.2522435, 0, 0.4352941, 1, 1,
0.2417346, 0.05840202, 1.570574, 0, 0.4313726, 1, 1,
0.2418528, -0.2716963, 3.643763, 0, 0.4235294, 1, 1,
0.2422204, 0.1612929, 0.8408473, 0, 0.4196078, 1, 1,
0.2429473, 0.7984206, 0.3089322, 0, 0.4117647, 1, 1,
0.2433565, -1.639888, 2.194946, 0, 0.4078431, 1, 1,
0.2471137, -1.654799, 2.951673, 0, 0.4, 1, 1,
0.2488385, -1.990763, 3.035519, 0, 0.3921569, 1, 1,
0.2571223, -0.195235, 1.677037, 0, 0.3882353, 1, 1,
0.2592235, -1.221485, 2.834789, 0, 0.3803922, 1, 1,
0.2594458, 1.320852, 1.21835, 0, 0.3764706, 1, 1,
0.2609757, 0.5377841, 0.4839142, 0, 0.3686275, 1, 1,
0.2642433, 0.4296146, -1.87243, 0, 0.3647059, 1, 1,
0.2756309, -0.1618172, 2.747689, 0, 0.3568628, 1, 1,
0.2793184, -0.5735111, 2.111178, 0, 0.3529412, 1, 1,
0.2854982, -0.3767664, 2.696675, 0, 0.345098, 1, 1,
0.2884791, -0.05502556, 2.668499, 0, 0.3411765, 1, 1,
0.2886145, -0.4834734, 3.683771, 0, 0.3333333, 1, 1,
0.2944915, -1.201298, 2.548184, 0, 0.3294118, 1, 1,
0.295189, 0.3279023, 2.092386, 0, 0.3215686, 1, 1,
0.2964154, 1.14966, 1.183133, 0, 0.3176471, 1, 1,
0.3001919, -0.810728, 3.015442, 0, 0.3098039, 1, 1,
0.3033129, -0.2345441, 3.794466, 0, 0.3058824, 1, 1,
0.3048937, 0.0922434, 2.886368, 0, 0.2980392, 1, 1,
0.3153602, 1.140462, -1.067125, 0, 0.2901961, 1, 1,
0.3161843, -0.05139712, 1.500057, 0, 0.2862745, 1, 1,
0.3167114, -1.732631, 2.189837, 0, 0.2784314, 1, 1,
0.3181486, -1.552748, 3.712886, 0, 0.2745098, 1, 1,
0.3183093, -0.1628944, 3.520255, 0, 0.2666667, 1, 1,
0.3185249, 1.304142, 1.309645, 0, 0.2627451, 1, 1,
0.3187581, 0.3337478, 2.190017, 0, 0.254902, 1, 1,
0.3294054, 0.5650086, -0.8858446, 0, 0.2509804, 1, 1,
0.3318117, -1.572245, 2.467527, 0, 0.2431373, 1, 1,
0.3390395, 1.268079, 0.3369233, 0, 0.2392157, 1, 1,
0.3400016, 1.231332, -0.4301238, 0, 0.2313726, 1, 1,
0.3426571, -1.44067, 1.93697, 0, 0.227451, 1, 1,
0.3435766, -0.3823458, 3.268332, 0, 0.2196078, 1, 1,
0.3441797, 2.44383, 1.636522, 0, 0.2156863, 1, 1,
0.3503936, 1.308149, 1.2711, 0, 0.2078431, 1, 1,
0.3510826, 1.050203, 1.125256, 0, 0.2039216, 1, 1,
0.3546143, 0.5440482, 0.9428928, 0, 0.1960784, 1, 1,
0.3614793, 0.241533, 0.2988556, 0, 0.1882353, 1, 1,
0.3647515, 2.048299, 0.3477182, 0, 0.1843137, 1, 1,
0.3670232, 0.08933222, 1.836261, 0, 0.1764706, 1, 1,
0.3677049, 0.9866654, 0.9872085, 0, 0.172549, 1, 1,
0.3680894, -1.089965, 1.534937, 0, 0.1647059, 1, 1,
0.3683701, -0.7578576, 2.781884, 0, 0.1607843, 1, 1,
0.3742566, -0.4398991, 1.865684, 0, 0.1529412, 1, 1,
0.3790968, 0.8255322, 1.630207, 0, 0.1490196, 1, 1,
0.3827126, 0.1424147, 1.389312, 0, 0.1411765, 1, 1,
0.3829018, -0.4502644, 2.443512, 0, 0.1372549, 1, 1,
0.3836731, 0.5257642, 0.9463685, 0, 0.1294118, 1, 1,
0.3881071, 1.182479, -1.014512, 0, 0.1254902, 1, 1,
0.3941961, 0.03437023, 0.2366389, 0, 0.1176471, 1, 1,
0.3983127, 0.05460069, 1.196505, 0, 0.1137255, 1, 1,
0.3985633, -2.127739, 3.256084, 0, 0.1058824, 1, 1,
0.3994803, 0.5579965, 1.059614, 0, 0.09803922, 1, 1,
0.3997969, -1.188042, 3.276841, 0, 0.09411765, 1, 1,
0.4006567, -0.3494283, 2.97249, 0, 0.08627451, 1, 1,
0.4008009, 0.1201929, 2.317874, 0, 0.08235294, 1, 1,
0.4015583, 0.07403163, 3.03576, 0, 0.07450981, 1, 1,
0.4071951, -2.069507, 3.671178, 0, 0.07058824, 1, 1,
0.4100799, 1.353046, -0.1116876, 0, 0.0627451, 1, 1,
0.4106988, -0.5027316, 3.108671, 0, 0.05882353, 1, 1,
0.4109793, -2.058292, 1.529792, 0, 0.05098039, 1, 1,
0.4110068, 0.5260999, -0.2916391, 0, 0.04705882, 1, 1,
0.411162, -2.754073, 2.938479, 0, 0.03921569, 1, 1,
0.4186042, 1.023029, 0.1980097, 0, 0.03529412, 1, 1,
0.4210266, 0.1176645, 0.9050863, 0, 0.02745098, 1, 1,
0.421179, -0.808446, 3.755529, 0, 0.02352941, 1, 1,
0.4222139, -1.30031, 1.432264, 0, 0.01568628, 1, 1,
0.4242416, 1.32577, -0.7695553, 0, 0.01176471, 1, 1,
0.4282023, -0.06919544, 2.927243, 0, 0.003921569, 1, 1,
0.4293396, 1.814999, 0.6456546, 0.003921569, 0, 1, 1,
0.4436654, -0.7373342, 3.071877, 0.007843138, 0, 1, 1,
0.4440223, -1.525244, 4.906241, 0.01568628, 0, 1, 1,
0.4448417, -2.368441, 6.084673, 0.01960784, 0, 1, 1,
0.4456575, -1.702514, 3.590081, 0.02745098, 0, 1, 1,
0.4468328, 0.2447297, 3.526086, 0.03137255, 0, 1, 1,
0.4537435, -0.8617848, 0.0255176, 0.03921569, 0, 1, 1,
0.4542576, -0.17703, 0.9038413, 0.04313726, 0, 1, 1,
0.458116, 0.747692, -0.1998303, 0.05098039, 0, 1, 1,
0.4594898, -0.7690696, 4.851896, 0.05490196, 0, 1, 1,
0.460974, -1.022357, 2.527218, 0.0627451, 0, 1, 1,
0.4623877, -0.8680987, 1.502771, 0.06666667, 0, 1, 1,
0.4644721, 1.201821, 0.3940064, 0.07450981, 0, 1, 1,
0.4661921, -1.812023, 3.193583, 0.07843138, 0, 1, 1,
0.4663993, 0.8082526, -0.358224, 0.08627451, 0, 1, 1,
0.467499, 1.90686, -1.351894, 0.09019608, 0, 1, 1,
0.4686065, -1.590636, 2.644409, 0.09803922, 0, 1, 1,
0.470457, 0.1690736, 1.848155, 0.1058824, 0, 1, 1,
0.4740111, -0.2288943, 2.871254, 0.1098039, 0, 1, 1,
0.4765327, 1.232437, 1.10148, 0.1176471, 0, 1, 1,
0.4784423, 1.271297, -0.3996013, 0.1215686, 0, 1, 1,
0.4850765, -1.590345, 3.438764, 0.1294118, 0, 1, 1,
0.4864576, 0.6478379, 1.964431, 0.1333333, 0, 1, 1,
0.4882443, -2.679069, 3.232255, 0.1411765, 0, 1, 1,
0.4962791, 1.284399, 2.043042, 0.145098, 0, 1, 1,
0.4993185, -0.1394927, 1.959779, 0.1529412, 0, 1, 1,
0.5003299, 0.3208137, 1.204848, 0.1568628, 0, 1, 1,
0.5026126, 0.4973465, -1.093278, 0.1647059, 0, 1, 1,
0.5079113, 0.6973048, 1.515082, 0.1686275, 0, 1, 1,
0.5084068, 0.7162326, 1.051077, 0.1764706, 0, 1, 1,
0.5097578, -2.186109, 2.617617, 0.1803922, 0, 1, 1,
0.5141184, -0.4916596, 3.31198, 0.1882353, 0, 1, 1,
0.5155236, 0.03890081, 1.471103, 0.1921569, 0, 1, 1,
0.5183648, -1.518033, 4.143745, 0.2, 0, 1, 1,
0.5195427, 0.6274312, 0.7606792, 0.2078431, 0, 1, 1,
0.5258342, -1.506153, 2.777805, 0.2117647, 0, 1, 1,
0.5285844, 1.012058, 2.037587, 0.2196078, 0, 1, 1,
0.5331455, -1.939956, 2.930673, 0.2235294, 0, 1, 1,
0.534697, 0.2013435, 2.297234, 0.2313726, 0, 1, 1,
0.5355638, 0.1609021, 2.35668, 0.2352941, 0, 1, 1,
0.5385512, 0.3873382, 2.958297, 0.2431373, 0, 1, 1,
0.5420051, -0.3059351, 0.5236687, 0.2470588, 0, 1, 1,
0.5464433, 1.035426, 0.04799483, 0.254902, 0, 1, 1,
0.5466633, 0.4910092, 0.2282967, 0.2588235, 0, 1, 1,
0.5490908, 1.376354, 0.02034028, 0.2666667, 0, 1, 1,
0.5502378, 0.4799614, 1.575516, 0.2705882, 0, 1, 1,
0.555057, -0.6239257, 3.212816, 0.2784314, 0, 1, 1,
0.5626277, -0.6747155, 1.916033, 0.282353, 0, 1, 1,
0.562696, -1.197478, 1.539383, 0.2901961, 0, 1, 1,
0.5708665, -0.6595308, 4.034984, 0.2941177, 0, 1, 1,
0.5804684, -0.6366067, 4.112926, 0.3019608, 0, 1, 1,
0.5819094, -0.4486453, 1.242247, 0.3098039, 0, 1, 1,
0.5858108, -1.039108, 1.003111, 0.3137255, 0, 1, 1,
0.5881367, 0.2008291, 2.057744, 0.3215686, 0, 1, 1,
0.5890521, -0.04341263, 1.530958, 0.3254902, 0, 1, 1,
0.5913607, 0.3113007, 1.960706, 0.3333333, 0, 1, 1,
0.5919454, 0.801617, -0.4187443, 0.3372549, 0, 1, 1,
0.5934289, -0.2915667, 1.814094, 0.345098, 0, 1, 1,
0.5940489, -1.543823, 3.060923, 0.3490196, 0, 1, 1,
0.5949943, 0.0339921, 1.062719, 0.3568628, 0, 1, 1,
0.5951072, -0.6269504, 2.678514, 0.3607843, 0, 1, 1,
0.5969315, -0.2583364, 2.171739, 0.3686275, 0, 1, 1,
0.6000257, 1.068937, 0.001679003, 0.372549, 0, 1, 1,
0.610239, 0.1261859, 2.253381, 0.3803922, 0, 1, 1,
0.6153495, 0.1282034, -0.7510387, 0.3843137, 0, 1, 1,
0.6187614, 1.447291, 1.736072, 0.3921569, 0, 1, 1,
0.627691, -0.5684853, 2.591264, 0.3960784, 0, 1, 1,
0.6282909, 1.038997, -0.3090566, 0.4039216, 0, 1, 1,
0.6298432, 0.2299533, 2.560375, 0.4117647, 0, 1, 1,
0.6371983, -0.9743197, 4.216789, 0.4156863, 0, 1, 1,
0.6401984, 0.9096127, 0.01549938, 0.4235294, 0, 1, 1,
0.641591, 0.7183886, 0.885672, 0.427451, 0, 1, 1,
0.6438493, 0.7118411, 0.3822484, 0.4352941, 0, 1, 1,
0.646008, -0.8872155, 3.813423, 0.4392157, 0, 1, 1,
0.6474905, -1.123851, 3.607244, 0.4470588, 0, 1, 1,
0.6476318, 3.175053, 0.5680642, 0.4509804, 0, 1, 1,
0.656783, -0.1111978, 0.6197341, 0.4588235, 0, 1, 1,
0.6585296, -0.7429522, 2.066279, 0.4627451, 0, 1, 1,
0.6705509, 0.2303994, 1.258249, 0.4705882, 0, 1, 1,
0.6747619, 0.3128361, 2.680678, 0.4745098, 0, 1, 1,
0.6774757, 1.243381, 1.243879, 0.4823529, 0, 1, 1,
0.6786942, -0.9417425, 2.904583, 0.4862745, 0, 1, 1,
0.6797451, 0.07529735, 1.29538, 0.4941176, 0, 1, 1,
0.6803955, -0.6780956, 1.919046, 0.5019608, 0, 1, 1,
0.6812669, -0.7277038, 3.09713, 0.5058824, 0, 1, 1,
0.6896436, -1.636849, 2.398532, 0.5137255, 0, 1, 1,
0.6905473, -0.07073281, 3.066451, 0.5176471, 0, 1, 1,
0.6906089, 0.3270836, 3.270673, 0.5254902, 0, 1, 1,
0.6916977, 0.433433, -0.5279435, 0.5294118, 0, 1, 1,
0.692627, -0.0009176154, 1.989264, 0.5372549, 0, 1, 1,
0.6945474, -0.5344416, 2.141552, 0.5411765, 0, 1, 1,
0.69605, -1.103095, 2.906157, 0.5490196, 0, 1, 1,
0.7006727, 1.132973, 0.801409, 0.5529412, 0, 1, 1,
0.7016352, -1.672084, 3.962726, 0.5607843, 0, 1, 1,
0.702828, 0.6419241, 3.376014, 0.5647059, 0, 1, 1,
0.7050495, -0.6932592, 1.963159, 0.572549, 0, 1, 1,
0.7079362, -0.357736, 1.298017, 0.5764706, 0, 1, 1,
0.7105941, 1.133677, 1.350299, 0.5843138, 0, 1, 1,
0.7131761, 1.442006, -0.4743192, 0.5882353, 0, 1, 1,
0.7140526, 1.017944, 0.4728217, 0.5960785, 0, 1, 1,
0.714971, -1.321664, 1.045184, 0.6039216, 0, 1, 1,
0.7218724, -0.8687348, 1.290161, 0.6078432, 0, 1, 1,
0.7227405, -0.463576, 0.7911529, 0.6156863, 0, 1, 1,
0.7291004, -0.2008116, 0.5973651, 0.6196079, 0, 1, 1,
0.7298521, 1.706715, 2.846708, 0.627451, 0, 1, 1,
0.7305921, -0.08382111, 2.942397, 0.6313726, 0, 1, 1,
0.7312548, -0.0989281, 1.104954, 0.6392157, 0, 1, 1,
0.7380586, 1.358516, 0.75488, 0.6431373, 0, 1, 1,
0.7394133, -1.238463, 1.868665, 0.6509804, 0, 1, 1,
0.7396494, 2.018272, 1.404632, 0.654902, 0, 1, 1,
0.7472896, -0.6274486, 2.367804, 0.6627451, 0, 1, 1,
0.7527769, 0.6440976, -0.2643125, 0.6666667, 0, 1, 1,
0.7541562, 0.2748062, -0.1137195, 0.6745098, 0, 1, 1,
0.7545364, -0.7808301, 0.6468372, 0.6784314, 0, 1, 1,
0.7645184, -1.294599, 2.700886, 0.6862745, 0, 1, 1,
0.7674657, 0.7689579, 1.473905, 0.6901961, 0, 1, 1,
0.7715628, 0.8194402, 2.050982, 0.6980392, 0, 1, 1,
0.7726596, 1.098048, -0.1041518, 0.7058824, 0, 1, 1,
0.7730302, 0.4693867, 0.07049373, 0.7098039, 0, 1, 1,
0.7732263, 0.3187606, 1.490632, 0.7176471, 0, 1, 1,
0.7764161, 0.6350654, -0.2058314, 0.7215686, 0, 1, 1,
0.7768936, -0.9339897, 3.548264, 0.7294118, 0, 1, 1,
0.7833031, -0.08969496, -0.1234673, 0.7333333, 0, 1, 1,
0.7846796, 1.164292, -0.1680221, 0.7411765, 0, 1, 1,
0.7857543, 0.3240772, 1.6619, 0.7450981, 0, 1, 1,
0.7867348, -1.46575, 3.306484, 0.7529412, 0, 1, 1,
0.7867763, -2.54268, 2.314924, 0.7568628, 0, 1, 1,
0.7911782, -0.813073, 1.83332, 0.7647059, 0, 1, 1,
0.7991443, -2.018631, 2.371566, 0.7686275, 0, 1, 1,
0.801971, 0.03060968, 2.514152, 0.7764706, 0, 1, 1,
0.802122, -0.8515284, 0.136649, 0.7803922, 0, 1, 1,
0.8060641, -1.191652, 3.398849, 0.7882353, 0, 1, 1,
0.8085668, 1.248523, 0.09681657, 0.7921569, 0, 1, 1,
0.8123381, 0.1735914, 1.938893, 0.8, 0, 1, 1,
0.8182662, 0.8126573, 0.8508696, 0.8078431, 0, 1, 1,
0.822556, -0.7452748, 2.675121, 0.8117647, 0, 1, 1,
0.8241367, -2.146676, 3.827097, 0.8196079, 0, 1, 1,
0.8359514, -0.6643753, 2.704652, 0.8235294, 0, 1, 1,
0.8387508, -1.831334, 1.433002, 0.8313726, 0, 1, 1,
0.841627, 1.616455, -0.8809865, 0.8352941, 0, 1, 1,
0.8442513, -0.2081111, 2.038658, 0.8431373, 0, 1, 1,
0.8464273, 0.8620721, -0.1171021, 0.8470588, 0, 1, 1,
0.849943, 0.1844963, 0.6913903, 0.854902, 0, 1, 1,
0.8566632, 0.603579, 1.771608, 0.8588235, 0, 1, 1,
0.8591981, -0.6329443, 3.357369, 0.8666667, 0, 1, 1,
0.862882, -0.6115066, 1.706554, 0.8705882, 0, 1, 1,
0.8667832, -0.4865038, 2.105003, 0.8784314, 0, 1, 1,
0.8690187, 0.0006385788, 0.5723931, 0.8823529, 0, 1, 1,
0.8754139, 0.4174444, -0.3570803, 0.8901961, 0, 1, 1,
0.8774777, 1.541835, 1.885806, 0.8941177, 0, 1, 1,
0.8844441, -1.046269, 3.150696, 0.9019608, 0, 1, 1,
0.8852409, 1.076842, 0.1240145, 0.9098039, 0, 1, 1,
0.8896144, 0.9712028, -0.4677688, 0.9137255, 0, 1, 1,
0.8916395, 1.608018, 0.4913342, 0.9215686, 0, 1, 1,
0.8962829, -0.03081692, 2.415155, 0.9254902, 0, 1, 1,
0.9041731, -1.478526, 2.996811, 0.9333333, 0, 1, 1,
0.9047698, -0.8244635, 2.462255, 0.9372549, 0, 1, 1,
0.9097685, -2.189017, 2.529389, 0.945098, 0, 1, 1,
0.9128167, 0.2160107, 0.9482375, 0.9490196, 0, 1, 1,
0.9166865, -0.04391513, 1.044396, 0.9568627, 0, 1, 1,
0.9201185, 1.439771, 1.352663, 0.9607843, 0, 1, 1,
0.9287309, -1.17341, 1.058487, 0.9686275, 0, 1, 1,
0.9289951, 0.3277326, 1.248164, 0.972549, 0, 1, 1,
0.9292108, 1.491289, -0.7375187, 0.9803922, 0, 1, 1,
0.9313199, 0.6028349, 1.807331, 0.9843137, 0, 1, 1,
0.9425488, 0.04616827, 3.160257, 0.9921569, 0, 1, 1,
0.9452919, 0.1506921, 1.656545, 0.9960784, 0, 1, 1,
0.9461524, -0.8679327, 3.496622, 1, 0, 0.9960784, 1,
0.9494559, 1.201882, 1.081391, 1, 0, 0.9882353, 1,
0.9505932, -0.7670447, 1.754185, 1, 0, 0.9843137, 1,
0.9518867, -0.681819, 0.1202, 1, 0, 0.9764706, 1,
0.9569744, 0.584923, 1.29713, 1, 0, 0.972549, 1,
0.9611624, 0.4869877, 0.8573419, 1, 0, 0.9647059, 1,
0.9632491, -1.292007, 2.31916, 1, 0, 0.9607843, 1,
0.9637021, -3.090514, 1.433139, 1, 0, 0.9529412, 1,
0.9752241, 0.2700169, 3.597488, 1, 0, 0.9490196, 1,
0.9770278, -1.657102, 4.24833, 1, 0, 0.9411765, 1,
0.9823612, 0.6522933, 1.791406, 1, 0, 0.9372549, 1,
0.9852089, -1.263543, 2.624475, 1, 0, 0.9294118, 1,
0.9867162, -1.016755, 3.046229, 1, 0, 0.9254902, 1,
0.9867239, 1.69264, -0.6704571, 1, 0, 0.9176471, 1,
0.9889014, -0.4273328, 0.9577048, 1, 0, 0.9137255, 1,
0.9891971, 0.9912738, 0.6503928, 1, 0, 0.9058824, 1,
0.9923972, -1.503935, 2.739448, 1, 0, 0.9019608, 1,
0.9952054, 1.074252, -0.05306549, 1, 0, 0.8941177, 1,
0.9967294, 1.459877, 0.1025248, 1, 0, 0.8862745, 1,
1.00615, -1.188971, 2.65013, 1, 0, 0.8823529, 1,
1.006906, -0.9051459, 1.648385, 1, 0, 0.8745098, 1,
1.012753, -1.360066, 1.948731, 1, 0, 0.8705882, 1,
1.023507, 0.6811125, 1.454343, 1, 0, 0.8627451, 1,
1.02475, -0.2260862, 2.344722, 1, 0, 0.8588235, 1,
1.039349, 0.7747678, 1.185321, 1, 0, 0.8509804, 1,
1.04318, 1.264375, 1.302115, 1, 0, 0.8470588, 1,
1.052349, 1.003541, 1.118089, 1, 0, 0.8392157, 1,
1.05725, 0.08529527, 1.84496, 1, 0, 0.8352941, 1,
1.060377, -0.5731056, 2.117637, 1, 0, 0.827451, 1,
1.068815, 1.795497, -1.051826, 1, 0, 0.8235294, 1,
1.069223, 0.7792929, 2.336623, 1, 0, 0.8156863, 1,
1.069598, -0.08620241, 1.728195, 1, 0, 0.8117647, 1,
1.072206, 0.1230221, 0.2942455, 1, 0, 0.8039216, 1,
1.076486, 1.345563, 0.3184839, 1, 0, 0.7960784, 1,
1.076924, 0.8316493, -0.02777185, 1, 0, 0.7921569, 1,
1.079737, 1.057268, -1.647879, 1, 0, 0.7843137, 1,
1.082, 1.052482, 2.28978, 1, 0, 0.7803922, 1,
1.082594, 1.299661, -0.2376452, 1, 0, 0.772549, 1,
1.083166, 0.960942, 2.896794, 1, 0, 0.7686275, 1,
1.083748, 0.3092226, 2.462409, 1, 0, 0.7607843, 1,
1.095069, -0.4333535, 4.554501, 1, 0, 0.7568628, 1,
1.103189, -1.211627, 1.881365, 1, 0, 0.7490196, 1,
1.104558, 0.1754523, 1.746329, 1, 0, 0.7450981, 1,
1.10642, -0.001246435, 2.201716, 1, 0, 0.7372549, 1,
1.106901, 1.511271, 1.153311, 1, 0, 0.7333333, 1,
1.110225, 0.2537441, -0.01295046, 1, 0, 0.7254902, 1,
1.116547, 0.02531907, 1.779149, 1, 0, 0.7215686, 1,
1.122277, -0.651932, 1.938281, 1, 0, 0.7137255, 1,
1.124735, 1.265747, 0.5870417, 1, 0, 0.7098039, 1,
1.124819, -0.8245304, 2.065562, 1, 0, 0.7019608, 1,
1.137557, -2.142656, 1.981446, 1, 0, 0.6941177, 1,
1.139551, -0.9167578, 2.607208, 1, 0, 0.6901961, 1,
1.155572, -0.3492532, 1.104971, 1, 0, 0.682353, 1,
1.155575, -1.203238, 5.336509, 1, 0, 0.6784314, 1,
1.161644, 0.8005735, 0.5594606, 1, 0, 0.6705883, 1,
1.16477, 0.3837844, 0.7195625, 1, 0, 0.6666667, 1,
1.17519, -1.364815, 1.156148, 1, 0, 0.6588235, 1,
1.175386, 1.70202, 0.09069164, 1, 0, 0.654902, 1,
1.181576, 0.2831164, 0.3009576, 1, 0, 0.6470588, 1,
1.1871, -0.08961046, 0.936253, 1, 0, 0.6431373, 1,
1.189733, -0.5695038, 1.104323, 1, 0, 0.6352941, 1,
1.190767, 0.1049156, 1.859464, 1, 0, 0.6313726, 1,
1.191074, 1.877472, -0.0883886, 1, 0, 0.6235294, 1,
1.197164, -1.557329, 4.512734, 1, 0, 0.6196079, 1,
1.212038, 0.1614196, 0.9377223, 1, 0, 0.6117647, 1,
1.212673, -0.2898012, 3.149742, 1, 0, 0.6078432, 1,
1.224465, 0.9118766, 0.5929452, 1, 0, 0.6, 1,
1.231604, 0.5483132, 0.02487943, 1, 0, 0.5921569, 1,
1.237296, 0.1040273, 2.846543, 1, 0, 0.5882353, 1,
1.248115, 0.3267967, 2.417805, 1, 0, 0.5803922, 1,
1.250237, 1.681831, 1.257931, 1, 0, 0.5764706, 1,
1.262827, -0.1662905, 1.887887, 1, 0, 0.5686275, 1,
1.263003, 1.750453, 0.116605, 1, 0, 0.5647059, 1,
1.265036, -0.3786625, 0.7666895, 1, 0, 0.5568628, 1,
1.265907, -1.232222, 4.015583, 1, 0, 0.5529412, 1,
1.27619, -1.431948, 1.804587, 1, 0, 0.5450981, 1,
1.276815, 0.1355237, 1.878571, 1, 0, 0.5411765, 1,
1.283331, -2.290289, 1.147959, 1, 0, 0.5333334, 1,
1.286475, -1.237357, 2.633598, 1, 0, 0.5294118, 1,
1.287457, 0.4419018, 1.668295, 1, 0, 0.5215687, 1,
1.291982, -0.2794529, 2.481658, 1, 0, 0.5176471, 1,
1.304076, -0.3236775, 1.245798, 1, 0, 0.509804, 1,
1.308547, -0.5522278, 2.060892, 1, 0, 0.5058824, 1,
1.322948, -1.155898, 3.571309, 1, 0, 0.4980392, 1,
1.323847, 0.5270262, 1.553479, 1, 0, 0.4901961, 1,
1.328779, 0.132839, 0.2119552, 1, 0, 0.4862745, 1,
1.364341, 1.03569, 2.875196, 1, 0, 0.4784314, 1,
1.371332, 0.141949, 1.309596, 1, 0, 0.4745098, 1,
1.374342, -0.01968226, 1.804655, 1, 0, 0.4666667, 1,
1.379294, 0.5068648, 1.17418, 1, 0, 0.4627451, 1,
1.379519, -0.7328078, 1.920044, 1, 0, 0.454902, 1,
1.384451, 0.3387691, 2.083681, 1, 0, 0.4509804, 1,
1.38665, -0.07555117, 1.163654, 1, 0, 0.4431373, 1,
1.412849, -0.478769, 2.825063, 1, 0, 0.4392157, 1,
1.420916, -1.095108, 1.464302, 1, 0, 0.4313726, 1,
1.42288, -0.08499752, 1.2068, 1, 0, 0.427451, 1,
1.423527, -1.023342, 2.12935, 1, 0, 0.4196078, 1,
1.432267, -0.4584183, 2.961994, 1, 0, 0.4156863, 1,
1.438763, 1.279557, 0.5323079, 1, 0, 0.4078431, 1,
1.445146, 0.6779544, 1.22982, 1, 0, 0.4039216, 1,
1.44767, 0.2268955, 0.8979256, 1, 0, 0.3960784, 1,
1.44861, -1.088527, 1.723331, 1, 0, 0.3882353, 1,
1.48558, -0.7020245, 1.360367, 1, 0, 0.3843137, 1,
1.494013, 0.9322407, 2.126796, 1, 0, 0.3764706, 1,
1.496889, 0.3912581, 0.9399767, 1, 0, 0.372549, 1,
1.498409, 0.7054469, 1.400713, 1, 0, 0.3647059, 1,
1.501588, -0.4036916, 0.7610142, 1, 0, 0.3607843, 1,
1.516995, 1.229467, 0.5772285, 1, 0, 0.3529412, 1,
1.534813, -1.746248, 2.718275, 1, 0, 0.3490196, 1,
1.559126, -0.9538581, 2.527086, 1, 0, 0.3411765, 1,
1.561697, -0.1116791, 2.209699, 1, 0, 0.3372549, 1,
1.56546, 0.767301, 1.710387, 1, 0, 0.3294118, 1,
1.59409, -1.372626, 1.555953, 1, 0, 0.3254902, 1,
1.613564, 0.3122655, 1.419631, 1, 0, 0.3176471, 1,
1.619264, 0.573175, 0.3216075, 1, 0, 0.3137255, 1,
1.634591, 0.1768181, 1.54152, 1, 0, 0.3058824, 1,
1.661141, 1.153098, 1.634006, 1, 0, 0.2980392, 1,
1.669057, -1.374058, 2.087178, 1, 0, 0.2941177, 1,
1.674718, -0.01371161, 2.727883, 1, 0, 0.2862745, 1,
1.682827, 0.4708907, -0.1260816, 1, 0, 0.282353, 1,
1.710388, 1.751025, -0.6139365, 1, 0, 0.2745098, 1,
1.715498, -0.3289438, 1.076474, 1, 0, 0.2705882, 1,
1.71923, -1.027851, 0.9391412, 1, 0, 0.2627451, 1,
1.721914, -0.2630647, 1.913942, 1, 0, 0.2588235, 1,
1.727884, 1.063235, 1.255904, 1, 0, 0.2509804, 1,
1.72894, 1.317471, -0.3831875, 1, 0, 0.2470588, 1,
1.743738, -0.5542663, 2.162161, 1, 0, 0.2392157, 1,
1.780003, 0.1770303, 0.6569792, 1, 0, 0.2352941, 1,
1.800013, 0.2874044, -0.04564687, 1, 0, 0.227451, 1,
1.808187, -0.5078627, 1.930085, 1, 0, 0.2235294, 1,
1.823853, 0.9747512, 0.9322729, 1, 0, 0.2156863, 1,
1.832992, -0.04728322, 1.930877, 1, 0, 0.2117647, 1,
1.893409, 0.03549002, 0.6620666, 1, 0, 0.2039216, 1,
1.893618, 0.6242256, 1.644105, 1, 0, 0.1960784, 1,
1.925063, 0.3512739, 1.337219, 1, 0, 0.1921569, 1,
1.959714, 1.552954, 3.041774, 1, 0, 0.1843137, 1,
1.97043, 1.570566, 0.8692781, 1, 0, 0.1803922, 1,
1.978968, -0.4330249, 0.01823507, 1, 0, 0.172549, 1,
1.98224, -0.02594525, 1.687496, 1, 0, 0.1686275, 1,
1.985849, -0.4202072, 1.503367, 1, 0, 0.1607843, 1,
1.998322, 1.235813, 1.897716, 1, 0, 0.1568628, 1,
2.03341, -1.050748, 1.311732, 1, 0, 0.1490196, 1,
2.035685, 0.4748509, 1.359886, 1, 0, 0.145098, 1,
2.069994, 1.666408, 0.4946756, 1, 0, 0.1372549, 1,
2.096717, 1.273129, 2.0014, 1, 0, 0.1333333, 1,
2.099055, -0.9647447, 2.049293, 1, 0, 0.1254902, 1,
2.099573, 0.1871655, 1.858559, 1, 0, 0.1215686, 1,
2.125469, -0.7507951, 3.2756, 1, 0, 0.1137255, 1,
2.139882, -0.1100389, 2.737602, 1, 0, 0.1098039, 1,
2.148186, 0.5993355, 1.974339, 1, 0, 0.1019608, 1,
2.185408, 0.519242, 1.85273, 1, 0, 0.09411765, 1,
2.187926, 1.89829, -0.2854532, 1, 0, 0.09019608, 1,
2.204486, -0.5381078, 0.9363177, 1, 0, 0.08235294, 1,
2.259256, -1.007566, 1.474524, 1, 0, 0.07843138, 1,
2.295979, -0.7510517, 1.114506, 1, 0, 0.07058824, 1,
2.336287, 2.073735, 1.319096, 1, 0, 0.06666667, 1,
2.346646, -0.3665437, 2.698689, 1, 0, 0.05882353, 1,
2.365271, -0.6326263, 0.4707014, 1, 0, 0.05490196, 1,
2.399929, 0.7263742, 2.112943, 1, 0, 0.04705882, 1,
2.469074, -1.046696, 2.362609, 1, 0, 0.04313726, 1,
2.560981, 1.914803, 0.4441667, 1, 0, 0.03529412, 1,
2.585262, -0.1723841, 1.470691, 1, 0, 0.03137255, 1,
2.811623, 1.796332, 0.645486, 1, 0, 0.02352941, 1,
3.011142, 0.2645856, 1.785439, 1, 0, 0.01960784, 1,
3.204962, 0.1740083, 2.538002, 1, 0, 0.01176471, 1,
3.482336, -0.6976326, 1.874007, 1, 0, 0.007843138, 1
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
0.1986719, -4.304022, -6.899615, 0, -0.5, 0.5, 0.5,
0.1986719, -4.304022, -6.899615, 1, -0.5, 0.5, 0.5,
0.1986719, -4.304022, -6.899615, 1, 1.5, 0.5, 0.5,
0.1986719, -4.304022, -6.899615, 0, 1.5, 0.5, 0.5
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
-4.198154, -0.02249908, -6.899615, 0, -0.5, 0.5, 0.5,
-4.198154, -0.02249908, -6.899615, 1, -0.5, 0.5, 0.5,
-4.198154, -0.02249908, -6.899615, 1, 1.5, 0.5, 0.5,
-4.198154, -0.02249908, -6.899615, 0, 1.5, 0.5, 0.5
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
-4.198154, -4.304022, 0.5334599, 0, -0.5, 0.5, 0.5,
-4.198154, -4.304022, 0.5334599, 1, -0.5, 0.5, 0.5,
-4.198154, -4.304022, 0.5334599, 1, 1.5, 0.5, 0.5,
-4.198154, -4.304022, 0.5334599, 0, 1.5, 0.5, 0.5
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
-3, -3.315978, -5.18429,
3, -3.315978, -5.18429,
-3, -3.315978, -5.18429,
-3, -3.480652, -5.470178,
-2, -3.315978, -5.18429,
-2, -3.480652, -5.470178,
-1, -3.315978, -5.18429,
-1, -3.480652, -5.470178,
0, -3.315978, -5.18429,
0, -3.480652, -5.470178,
1, -3.315978, -5.18429,
1, -3.480652, -5.470178,
2, -3.315978, -5.18429,
2, -3.480652, -5.470178,
3, -3.315978, -5.18429,
3, -3.480652, -5.470178
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
-3, -3.81, -6.041953, 0, -0.5, 0.5, 0.5,
-3, -3.81, -6.041953, 1, -0.5, 0.5, 0.5,
-3, -3.81, -6.041953, 1, 1.5, 0.5, 0.5,
-3, -3.81, -6.041953, 0, 1.5, 0.5, 0.5,
-2, -3.81, -6.041953, 0, -0.5, 0.5, 0.5,
-2, -3.81, -6.041953, 1, -0.5, 0.5, 0.5,
-2, -3.81, -6.041953, 1, 1.5, 0.5, 0.5,
-2, -3.81, -6.041953, 0, 1.5, 0.5, 0.5,
-1, -3.81, -6.041953, 0, -0.5, 0.5, 0.5,
-1, -3.81, -6.041953, 1, -0.5, 0.5, 0.5,
-1, -3.81, -6.041953, 1, 1.5, 0.5, 0.5,
-1, -3.81, -6.041953, 0, 1.5, 0.5, 0.5,
0, -3.81, -6.041953, 0, -0.5, 0.5, 0.5,
0, -3.81, -6.041953, 1, -0.5, 0.5, 0.5,
0, -3.81, -6.041953, 1, 1.5, 0.5, 0.5,
0, -3.81, -6.041953, 0, 1.5, 0.5, 0.5,
1, -3.81, -6.041953, 0, -0.5, 0.5, 0.5,
1, -3.81, -6.041953, 1, -0.5, 0.5, 0.5,
1, -3.81, -6.041953, 1, 1.5, 0.5, 0.5,
1, -3.81, -6.041953, 0, 1.5, 0.5, 0.5,
2, -3.81, -6.041953, 0, -0.5, 0.5, 0.5,
2, -3.81, -6.041953, 1, -0.5, 0.5, 0.5,
2, -3.81, -6.041953, 1, 1.5, 0.5, 0.5,
2, -3.81, -6.041953, 0, 1.5, 0.5, 0.5,
3, -3.81, -6.041953, 0, -0.5, 0.5, 0.5,
3, -3.81, -6.041953, 1, -0.5, 0.5, 0.5,
3, -3.81, -6.041953, 1, 1.5, 0.5, 0.5,
3, -3.81, -6.041953, 0, 1.5, 0.5, 0.5
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
-3.183502, -3, -5.18429,
-3.183502, 3, -5.18429,
-3.183502, -3, -5.18429,
-3.352611, -3, -5.470178,
-3.183502, -2, -5.18429,
-3.352611, -2, -5.470178,
-3.183502, -1, -5.18429,
-3.352611, -1, -5.470178,
-3.183502, 0, -5.18429,
-3.352611, 0, -5.470178,
-3.183502, 1, -5.18429,
-3.352611, 1, -5.470178,
-3.183502, 2, -5.18429,
-3.352611, 2, -5.470178,
-3.183502, 3, -5.18429,
-3.352611, 3, -5.470178
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
-3.690829, -3, -6.041953, 0, -0.5, 0.5, 0.5,
-3.690829, -3, -6.041953, 1, -0.5, 0.5, 0.5,
-3.690829, -3, -6.041953, 1, 1.5, 0.5, 0.5,
-3.690829, -3, -6.041953, 0, 1.5, 0.5, 0.5,
-3.690829, -2, -6.041953, 0, -0.5, 0.5, 0.5,
-3.690829, -2, -6.041953, 1, -0.5, 0.5, 0.5,
-3.690829, -2, -6.041953, 1, 1.5, 0.5, 0.5,
-3.690829, -2, -6.041953, 0, 1.5, 0.5, 0.5,
-3.690829, -1, -6.041953, 0, -0.5, 0.5, 0.5,
-3.690829, -1, -6.041953, 1, -0.5, 0.5, 0.5,
-3.690829, -1, -6.041953, 1, 1.5, 0.5, 0.5,
-3.690829, -1, -6.041953, 0, 1.5, 0.5, 0.5,
-3.690829, 0, -6.041953, 0, -0.5, 0.5, 0.5,
-3.690829, 0, -6.041953, 1, -0.5, 0.5, 0.5,
-3.690829, 0, -6.041953, 1, 1.5, 0.5, 0.5,
-3.690829, 0, -6.041953, 0, 1.5, 0.5, 0.5,
-3.690829, 1, -6.041953, 0, -0.5, 0.5, 0.5,
-3.690829, 1, -6.041953, 1, -0.5, 0.5, 0.5,
-3.690829, 1, -6.041953, 1, 1.5, 0.5, 0.5,
-3.690829, 1, -6.041953, 0, 1.5, 0.5, 0.5,
-3.690829, 2, -6.041953, 0, -0.5, 0.5, 0.5,
-3.690829, 2, -6.041953, 1, -0.5, 0.5, 0.5,
-3.690829, 2, -6.041953, 1, 1.5, 0.5, 0.5,
-3.690829, 2, -6.041953, 0, 1.5, 0.5, 0.5,
-3.690829, 3, -6.041953, 0, -0.5, 0.5, 0.5,
-3.690829, 3, -6.041953, 1, -0.5, 0.5, 0.5,
-3.690829, 3, -6.041953, 1, 1.5, 0.5, 0.5,
-3.690829, 3, -6.041953, 0, 1.5, 0.5, 0.5
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
-3.183502, -3.315978, -4,
-3.183502, -3.315978, 6,
-3.183502, -3.315978, -4,
-3.352611, -3.480652, -4,
-3.183502, -3.315978, -2,
-3.352611, -3.480652, -2,
-3.183502, -3.315978, 0,
-3.352611, -3.480652, 0,
-3.183502, -3.315978, 2,
-3.352611, -3.480652, 2,
-3.183502, -3.315978, 4,
-3.352611, -3.480652, 4,
-3.183502, -3.315978, 6,
-3.352611, -3.480652, 6
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
-3.690829, -3.81, -4, 0, -0.5, 0.5, 0.5,
-3.690829, -3.81, -4, 1, -0.5, 0.5, 0.5,
-3.690829, -3.81, -4, 1, 1.5, 0.5, 0.5,
-3.690829, -3.81, -4, 0, 1.5, 0.5, 0.5,
-3.690829, -3.81, -2, 0, -0.5, 0.5, 0.5,
-3.690829, -3.81, -2, 1, -0.5, 0.5, 0.5,
-3.690829, -3.81, -2, 1, 1.5, 0.5, 0.5,
-3.690829, -3.81, -2, 0, 1.5, 0.5, 0.5,
-3.690829, -3.81, 0, 0, -0.5, 0.5, 0.5,
-3.690829, -3.81, 0, 1, -0.5, 0.5, 0.5,
-3.690829, -3.81, 0, 1, 1.5, 0.5, 0.5,
-3.690829, -3.81, 0, 0, 1.5, 0.5, 0.5,
-3.690829, -3.81, 2, 0, -0.5, 0.5, 0.5,
-3.690829, -3.81, 2, 1, -0.5, 0.5, 0.5,
-3.690829, -3.81, 2, 1, 1.5, 0.5, 0.5,
-3.690829, -3.81, 2, 0, 1.5, 0.5, 0.5,
-3.690829, -3.81, 4, 0, -0.5, 0.5, 0.5,
-3.690829, -3.81, 4, 1, -0.5, 0.5, 0.5,
-3.690829, -3.81, 4, 1, 1.5, 0.5, 0.5,
-3.690829, -3.81, 4, 0, 1.5, 0.5, 0.5,
-3.690829, -3.81, 6, 0, -0.5, 0.5, 0.5,
-3.690829, -3.81, 6, 1, -0.5, 0.5, 0.5,
-3.690829, -3.81, 6, 1, 1.5, 0.5, 0.5,
-3.690829, -3.81, 6, 0, 1.5, 0.5, 0.5
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
-3.183502, -3.315978, -5.18429,
-3.183502, 3.27098, -5.18429,
-3.183502, -3.315978, 6.25121,
-3.183502, 3.27098, 6.25121,
-3.183502, -3.315978, -5.18429,
-3.183502, -3.315978, 6.25121,
-3.183502, 3.27098, -5.18429,
-3.183502, 3.27098, 6.25121,
-3.183502, -3.315978, -5.18429,
3.580846, -3.315978, -5.18429,
-3.183502, -3.315978, 6.25121,
3.580846, -3.315978, 6.25121,
-3.183502, 3.27098, -5.18429,
3.580846, 3.27098, -5.18429,
-3.183502, 3.27098, 6.25121,
3.580846, 3.27098, 6.25121,
3.580846, -3.315978, -5.18429,
3.580846, 3.27098, -5.18429,
3.580846, -3.315978, 6.25121,
3.580846, 3.27098, 6.25121,
3.580846, -3.315978, -5.18429,
3.580846, -3.315978, 6.25121,
3.580846, 3.27098, -5.18429,
3.580846, 3.27098, 6.25121
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
var radius = 7.918683;
var distance = 35.23111;
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
mvMatrix.translate( -0.1986719, 0.02249908, -0.5334599 );
mvMatrix.scale( 1.26573, 1.299816, 0.7487067 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.23111);
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
cinnamylidenehydrazo<-read.table("cinnamylidenehydrazo.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-cinnamylidenehydrazo$V2
```

```
## Error in eval(expr, envir, enclos): object 'cinnamylidenehydrazo' not found
```

```r
y<-cinnamylidenehydrazo$V3
```

```
## Error in eval(expr, envir, enclos): object 'cinnamylidenehydrazo' not found
```

```r
z<-cinnamylidenehydrazo$V4
```

```
## Error in eval(expr, envir, enclos): object 'cinnamylidenehydrazo' not found
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
-3.084992, -2.470037, -1.586091, 0, 0, 1, 1, 1,
-2.893491, -1.507239, -1.792717, 1, 0, 0, 1, 1,
-2.775172, -1.438183, -2.092026, 1, 0, 0, 1, 1,
-2.740684, 0.3007293, -2.516297, 1, 0, 0, 1, 1,
-2.519898, 1.050918, -1.001767, 1, 0, 0, 1, 1,
-2.50822, -0.02576674, -2.699672, 1, 0, 0, 1, 1,
-2.452891, 1.381295, -0.3964399, 0, 0, 0, 1, 1,
-2.402656, -0.4569113, -2.270922, 0, 0, 0, 1, 1,
-2.398854, 1.383122, -1.334337, 0, 0, 0, 1, 1,
-2.390725, -0.9699442, -1.863971, 0, 0, 0, 1, 1,
-2.357074, -0.4733571, -0.9473968, 0, 0, 0, 1, 1,
-2.321373, 0.5982754, -2.41145, 0, 0, 0, 1, 1,
-2.315064, 0.453444, -1.155286, 0, 0, 0, 1, 1,
-2.191736, 0.7775514, -1.44544, 1, 1, 1, 1, 1,
-2.170965, 0.5660051, -1.300486, 1, 1, 1, 1, 1,
-2.164273, 0.5899089, -0.901351, 1, 1, 1, 1, 1,
-2.158553, -1.121894, -0.5090726, 1, 1, 1, 1, 1,
-2.109456, -0.4230051, -3.169662, 1, 1, 1, 1, 1,
-2.087792, 0.02974074, -0.04252778, 1, 1, 1, 1, 1,
-2.072927, 2.485184, 0.8534949, 1, 1, 1, 1, 1,
-2.072737, -0.4864325, -3.182128, 1, 1, 1, 1, 1,
-2.040506, 0.3150527, -2.542445, 1, 1, 1, 1, 1,
-2.010172, 0.6145766, 0.207074, 1, 1, 1, 1, 1,
-1.976316, 0.3328272, -3.218107, 1, 1, 1, 1, 1,
-1.968134, -0.6157807, -1.487144, 1, 1, 1, 1, 1,
-1.961089, -0.7752291, -0.9906554, 1, 1, 1, 1, 1,
-1.958874, -0.2926624, -2.490647, 1, 1, 1, 1, 1,
-1.949299, -0.6287076, -1.325931, 1, 1, 1, 1, 1,
-1.945548, 0.4971429, -2.721055, 0, 0, 1, 1, 1,
-1.939453, 1.047683, -0.1808601, 1, 0, 0, 1, 1,
-1.938263, 0.18228, -1.949669, 1, 0, 0, 1, 1,
-1.872251, -0.3673119, -1.938868, 1, 0, 0, 1, 1,
-1.84273, -0.1379835, -2.044586, 1, 0, 0, 1, 1,
-1.838591, -0.6616827, -2.177343, 1, 0, 0, 1, 1,
-1.79286, 0.8355584, -1.004697, 0, 0, 0, 1, 1,
-1.789569, 1.250926, -1.149969, 0, 0, 0, 1, 1,
-1.779148, 0.6895986, -1.216612, 0, 0, 0, 1, 1,
-1.771467, -0.7401564, -1.43108, 0, 0, 0, 1, 1,
-1.75746, -0.9956455, -1.028973, 0, 0, 0, 1, 1,
-1.719675, -1.390801, -3.117362, 0, 0, 0, 1, 1,
-1.693186, -0.2370891, -1.970784, 0, 0, 0, 1, 1,
-1.674396, 0.7986619, -0.5113052, 1, 1, 1, 1, 1,
-1.67263, 0.5985546, -1.88171, 1, 1, 1, 1, 1,
-1.663664, -0.2399359, -2.122996, 1, 1, 1, 1, 1,
-1.66263, 0.3360938, -1.176623, 1, 1, 1, 1, 1,
-1.65489, 1.110736, 0.2656058, 1, 1, 1, 1, 1,
-1.654692, 0.04651925, -2.95333, 1, 1, 1, 1, 1,
-1.650071, 0.3422865, -0.7978578, 1, 1, 1, 1, 1,
-1.64626, -1.360444, -2.359746, 1, 1, 1, 1, 1,
-1.645095, 0.1554881, -1.659149, 1, 1, 1, 1, 1,
-1.637443, 1.21046, 0.3001324, 1, 1, 1, 1, 1,
-1.634787, 0.3378773, -1.126768, 1, 1, 1, 1, 1,
-1.627354, -1.296763, -4.765678, 1, 1, 1, 1, 1,
-1.624661, -1.397934, -2.364654, 1, 1, 1, 1, 1,
-1.616228, -1.023392, -1.767906, 1, 1, 1, 1, 1,
-1.615721, -0.9566252, -4.522412, 1, 1, 1, 1, 1,
-1.605498, 0.7263551, -1.455939, 0, 0, 1, 1, 1,
-1.589684, -1.935082, -2.707966, 1, 0, 0, 1, 1,
-1.574053, 1.093594, -0.6233797, 1, 0, 0, 1, 1,
-1.568281, -0.2167808, -1.790337, 1, 0, 0, 1, 1,
-1.549543, -0.9289292, -1.976395, 1, 0, 0, 1, 1,
-1.549411, 0.8331378, 0.05342074, 1, 0, 0, 1, 1,
-1.545069, 0.5549775, -0.8898302, 0, 0, 0, 1, 1,
-1.530089, 0.6480144, -1.074243, 0, 0, 0, 1, 1,
-1.52822, 0.2003251, 0.3931243, 0, 0, 0, 1, 1,
-1.513562, 0.6614148, -0.862578, 0, 0, 0, 1, 1,
-1.502368, -0.747834, 0.4128957, 0, 0, 0, 1, 1,
-1.483179, 1.444656, -0.6256422, 0, 0, 0, 1, 1,
-1.466354, 0.9820799, -1.066624, 0, 0, 0, 1, 1,
-1.444724, -0.551606, -3.516926, 1, 1, 1, 1, 1,
-1.44171, 1.356096, -0.960672, 1, 1, 1, 1, 1,
-1.43668, 0.6057062, -1.827108, 1, 1, 1, 1, 1,
-1.424929, -1.200164, -3.253107, 1, 1, 1, 1, 1,
-1.423827, 0.2595387, -2.71643, 1, 1, 1, 1, 1,
-1.416151, 1.135162, -1.126708, 1, 1, 1, 1, 1,
-1.413554, 0.6185009, -0.9267418, 1, 1, 1, 1, 1,
-1.405676, 0.3203303, -3.30873, 1, 1, 1, 1, 1,
-1.405007, -0.09474194, -0.1468504, 1, 1, 1, 1, 1,
-1.389893, -1.057055, -1.856073, 1, 1, 1, 1, 1,
-1.389529, -0.9602959, -1.300269, 1, 1, 1, 1, 1,
-1.388033, -0.1365902, -0.2324893, 1, 1, 1, 1, 1,
-1.377716, -1.807293, -2.903773, 1, 1, 1, 1, 1,
-1.370486, -0.7862152, -2.433228, 1, 1, 1, 1, 1,
-1.360579, 0.1271892, -1.776632, 1, 1, 1, 1, 1,
-1.359411, 0.6899029, -1.852501, 0, 0, 1, 1, 1,
-1.357394, -0.2935895, -0.2533726, 1, 0, 0, 1, 1,
-1.341874, -0.3394893, -2.871645, 1, 0, 0, 1, 1,
-1.335259, -0.3035592, -0.8223593, 1, 0, 0, 1, 1,
-1.327857, 0.6801528, -2.648497, 1, 0, 0, 1, 1,
-1.327484, 1.337724, 0.5967293, 1, 0, 0, 1, 1,
-1.323566, -0.7121237, -1.198693, 0, 0, 0, 1, 1,
-1.318927, -1.426479, -3.301084, 0, 0, 0, 1, 1,
-1.294453, -0.4550827, -1.909246, 0, 0, 0, 1, 1,
-1.27117, -0.1599629, -3.373455, 0, 0, 0, 1, 1,
-1.268244, 0.8320873, -1.511065, 0, 0, 0, 1, 1,
-1.266837, 1.420736, -1.764345, 0, 0, 0, 1, 1,
-1.251379, 0.9566445, -2.883938, 0, 0, 0, 1, 1,
-1.250869, 0.5825441, -2.406912, 1, 1, 1, 1, 1,
-1.249563, -0.3374425, -3.299877, 1, 1, 1, 1, 1,
-1.233442, 0.668179, -3.164972, 1, 1, 1, 1, 1,
-1.213542, 0.093187, -3.079602, 1, 1, 1, 1, 1,
-1.20803, 0.1612479, -0.2368277, 1, 1, 1, 1, 1,
-1.202574, 0.5674813, 0.3443667, 1, 1, 1, 1, 1,
-1.199223, 0.2310521, -0.4414133, 1, 1, 1, 1, 1,
-1.197433, -0.6098289, -3.319257, 1, 1, 1, 1, 1,
-1.195646, 2.501262, -0.4294903, 1, 1, 1, 1, 1,
-1.194754, -0.3066278, -1.823019, 1, 1, 1, 1, 1,
-1.192599, -0.4913056, -1.935926, 1, 1, 1, 1, 1,
-1.190111, 1.63131, -0.7160511, 1, 1, 1, 1, 1,
-1.184019, -0.459341, -3.671223, 1, 1, 1, 1, 1,
-1.178923, -0.519384, -0.8777002, 1, 1, 1, 1, 1,
-1.174051, 1.209659, -1.011261, 1, 1, 1, 1, 1,
-1.164356, 0.8565109, -0.4179881, 0, 0, 1, 1, 1,
-1.163992, -0.4237758, -0.8362079, 1, 0, 0, 1, 1,
-1.158508, -0.09334753, -1.662862, 1, 0, 0, 1, 1,
-1.15774, 0.8722609, -1.52082, 1, 0, 0, 1, 1,
-1.154383, 0.3327478, -0.01020088, 1, 0, 0, 1, 1,
-1.153828, -0.2283882, -0.8456562, 1, 0, 0, 1, 1,
-1.151598, -0.1794365, -1.823491, 0, 0, 0, 1, 1,
-1.146708, -2.304867, -0.8499912, 0, 0, 0, 1, 1,
-1.145633, 0.2884332, -1.683218, 0, 0, 0, 1, 1,
-1.142362, 0.01035739, -2.192645, 0, 0, 0, 1, 1,
-1.141662, -0.6020379, -2.672561, 0, 0, 0, 1, 1,
-1.13789, 0.1225678, -1.60305, 0, 0, 0, 1, 1,
-1.130524, -0.9583935, -2.84638, 0, 0, 0, 1, 1,
-1.127973, -1.765179, -1.449278, 1, 1, 1, 1, 1,
-1.126574, -0.5012612, -1.984327, 1, 1, 1, 1, 1,
-1.126436, 0.5488492, 0.1617973, 1, 1, 1, 1, 1,
-1.11349, -1.08658, -2.369375, 1, 1, 1, 1, 1,
-1.099826, 1.095843, -2.019163, 1, 1, 1, 1, 1,
-1.098914, 2.823627, -0.1331467, 1, 1, 1, 1, 1,
-1.089314, -0.104273, -1.971764, 1, 1, 1, 1, 1,
-1.078705, 0.4663103, -2.007243, 1, 1, 1, 1, 1,
-1.072845, -0.8248678, -3.697031, 1, 1, 1, 1, 1,
-1.064544, -0.1835604, -2.378448, 1, 1, 1, 1, 1,
-1.063709, -0.5207269, -0.009816331, 1, 1, 1, 1, 1,
-1.056878, -0.224067, -2.709222, 1, 1, 1, 1, 1,
-1.052449, 1.413515, -3.218766, 1, 1, 1, 1, 1,
-1.051278, -1.165412, -3.150275, 1, 1, 1, 1, 1,
-1.044393, 0.6423291, -0.6009533, 1, 1, 1, 1, 1,
-1.042984, -0.8115489, -1.582885, 0, 0, 1, 1, 1,
-1.042117, 0.7583273, -2.058917, 1, 0, 0, 1, 1,
-1.028858, -0.6559892, -0.964201, 1, 0, 0, 1, 1,
-1.028779, 0.7385225, 0.3184314, 1, 0, 0, 1, 1,
-1.022892, -0.9666442, -3.246361, 1, 0, 0, 1, 1,
-1.015721, 1.527033, -0.2141773, 1, 0, 0, 1, 1,
-1.009648, 0.1203501, -2.136101, 0, 0, 0, 1, 1,
-1.009157, 0.8705392, 0.01575226, 0, 0, 0, 1, 1,
-1.004221, -1.654912, -0.9618725, 0, 0, 0, 1, 1,
-0.9999314, -0.2714123, -1.425558, 0, 0, 0, 1, 1,
-0.9945391, -0.2046578, -1.78092, 0, 0, 0, 1, 1,
-0.9862748, 0.3576542, -0.5593759, 0, 0, 0, 1, 1,
-0.9852766, -1.667274, -2.20758, 0, 0, 0, 1, 1,
-0.9824993, 0.0582179, -0.1912126, 1, 1, 1, 1, 1,
-0.9815672, -1.403254, -2.438968, 1, 1, 1, 1, 1,
-0.9774777, 0.03379467, -0.7129584, 1, 1, 1, 1, 1,
-0.974779, -0.3121453, -1.344588, 1, 1, 1, 1, 1,
-0.9682262, -0.4117918, -2.296537, 1, 1, 1, 1, 1,
-0.9675782, -0.8065407, -2.051656, 1, 1, 1, 1, 1,
-0.9661494, 0.7532768, -0.4705938, 1, 1, 1, 1, 1,
-0.9643592, -0.8635716, -0.6547338, 1, 1, 1, 1, 1,
-0.9624525, 0.2940759, -2.781504, 1, 1, 1, 1, 1,
-0.9543, -0.3578839, -2.163414, 1, 1, 1, 1, 1,
-0.9533723, -0.3132641, -0.7187308, 1, 1, 1, 1, 1,
-0.9512743, 0.4979679, -1.218851, 1, 1, 1, 1, 1,
-0.946802, 0.6421473, -0.1415815, 1, 1, 1, 1, 1,
-0.9450423, -1.031269, -1.475548, 1, 1, 1, 1, 1,
-0.9424362, 0.2714522, -1.34646, 1, 1, 1, 1, 1,
-0.9337642, 0.3203187, -1.395979, 0, 0, 1, 1, 1,
-0.9298315, 0.1669265, -1.133809, 1, 0, 0, 1, 1,
-0.9237689, 0.9086359, -0.9279258, 1, 0, 0, 1, 1,
-0.9161106, -1.002416, -2.559236, 1, 0, 0, 1, 1,
-0.9157199, -0.8963664, -2.48461, 1, 0, 0, 1, 1,
-0.9118827, -1.632137, -3.564873, 1, 0, 0, 1, 1,
-0.9103494, 1.305251, -1.546351, 0, 0, 0, 1, 1,
-0.9076132, -1.002863, -3.28006, 0, 0, 0, 1, 1,
-0.8950059, -0.07277359, -2.077777, 0, 0, 0, 1, 1,
-0.8908901, -0.7121075, -3.724412, 0, 0, 0, 1, 1,
-0.8901013, -0.6307288, -3.518046, 0, 0, 0, 1, 1,
-0.8884346, 0.4371676, -0.2344298, 0, 0, 0, 1, 1,
-0.8876677, 0.7285705, -0.6317063, 0, 0, 0, 1, 1,
-0.884937, -0.05065211, -2.476614, 1, 1, 1, 1, 1,
-0.8751918, 1.578875, -1.445343, 1, 1, 1, 1, 1,
-0.864483, -0.4843699, -3.42396, 1, 1, 1, 1, 1,
-0.8586784, 1.391955, -1.478655, 1, 1, 1, 1, 1,
-0.8539004, -0.2549466, -2.424956, 1, 1, 1, 1, 1,
-0.8517321, 0.631231, 0.06637809, 1, 1, 1, 1, 1,
-0.8492798, 1.38102, -0.6429893, 1, 1, 1, 1, 1,
-0.8491534, -0.03481737, -2.548894, 1, 1, 1, 1, 1,
-0.8468403, 0.6280739, 0.2616625, 1, 1, 1, 1, 1,
-0.84022, 1.422221, -1.234712, 1, 1, 1, 1, 1,
-0.8399331, -0.3931484, -1.772664, 1, 1, 1, 1, 1,
-0.8387221, 0.2970822, -0.4005271, 1, 1, 1, 1, 1,
-0.8338681, -0.2258166, -1.279435, 1, 1, 1, 1, 1,
-0.832538, 2.058769, 2.297985, 1, 1, 1, 1, 1,
-0.8208817, 1.547277, -0.161969, 1, 1, 1, 1, 1,
-0.8192058, -0.0876568, -1.410845, 0, 0, 1, 1, 1,
-0.8191008, 0.1088194, -2.316737, 1, 0, 0, 1, 1,
-0.8123409, -0.5929351, -2.352897, 1, 0, 0, 1, 1,
-0.7960991, -0.6711251, -2.835067, 1, 0, 0, 1, 1,
-0.7956935, -0.569317, -1.993583, 1, 0, 0, 1, 1,
-0.794168, -0.4439664, -2.446837, 1, 0, 0, 1, 1,
-0.7894268, -0.714159, -0.9526469, 0, 0, 0, 1, 1,
-0.78874, 0.1259507, 0.5368828, 0, 0, 0, 1, 1,
-0.7875037, 0.7203074, -1.309905, 0, 0, 0, 1, 1,
-0.7874174, -2.255047, -3.480998, 0, 0, 0, 1, 1,
-0.7835206, 0.5059296, -1.721813, 0, 0, 0, 1, 1,
-0.7733775, -0.1147017, -2.547324, 0, 0, 0, 1, 1,
-0.7723892, -0.8148469, -2.032161, 0, 0, 0, 1, 1,
-0.7667491, 0.5903735, -0.6125411, 1, 1, 1, 1, 1,
-0.7636515, 0.1165497, -1.20828, 1, 1, 1, 1, 1,
-0.763458, -1.571805, -1.976024, 1, 1, 1, 1, 1,
-0.7627407, -0.4820412, -1.562382, 1, 1, 1, 1, 1,
-0.761262, 2.221267, 0.1052269, 1, 1, 1, 1, 1,
-0.7593846, 0.1086783, -2.871553, 1, 1, 1, 1, 1,
-0.7586707, -0.26483, -2.887661, 1, 1, 1, 1, 1,
-0.7522697, -0.6758531, -0.6281186, 1, 1, 1, 1, 1,
-0.7502539, 1.616139, -0.06891218, 1, 1, 1, 1, 1,
-0.7492535, -0.3720835, -2.694363, 1, 1, 1, 1, 1,
-0.7438781, -0.7763888, -3.750841, 1, 1, 1, 1, 1,
-0.7420821, 0.5012048, -1.200172, 1, 1, 1, 1, 1,
-0.7399948, -1.579992, -2.687842, 1, 1, 1, 1, 1,
-0.7381097, 0.5482832, -2.419943, 1, 1, 1, 1, 1,
-0.736735, -0.5188025, -3.225807, 1, 1, 1, 1, 1,
-0.7366533, -0.8209196, -2.316195, 0, 0, 1, 1, 1,
-0.7318932, -0.7844843, -1.09063, 1, 0, 0, 1, 1,
-0.7283633, 0.7153978, 0.6803507, 1, 0, 0, 1, 1,
-0.7275889, -0.6787412, -1.339276, 1, 0, 0, 1, 1,
-0.7234398, -0.168716, -1.374407, 1, 0, 0, 1, 1,
-0.7230522, 0.4378681, -1.764508, 1, 0, 0, 1, 1,
-0.7159047, -0.9174986, -4.050108, 0, 0, 0, 1, 1,
-0.7101755, 0.3665362, 0.6563702, 0, 0, 0, 1, 1,
-0.7048802, -0.3279902, -3.065238, 0, 0, 0, 1, 1,
-0.7030943, 0.9379758, -1.402736, 0, 0, 0, 1, 1,
-0.6983409, 1.871229, -1.302017, 0, 0, 0, 1, 1,
-0.6969213, -2.190035, -3.267695, 0, 0, 0, 1, 1,
-0.6962515, -0.5780663, -1.837821, 0, 0, 0, 1, 1,
-0.6962209, 0.7639242, -0.330592, 1, 1, 1, 1, 1,
-0.695913, 0.4876993, -1.281968, 1, 1, 1, 1, 1,
-0.6958494, -1.33571, -2.912178, 1, 1, 1, 1, 1,
-0.6928461, 0.1641711, -1.695226, 1, 1, 1, 1, 1,
-0.6927553, 1.124524, -1.586695, 1, 1, 1, 1, 1,
-0.6894659, -0.009149278, -1.201916, 1, 1, 1, 1, 1,
-0.6852829, 2.486912, 0.09757922, 1, 1, 1, 1, 1,
-0.6825191, 0.06116479, -2.746381, 1, 1, 1, 1, 1,
-0.6807398, 1.309962, -0.5341485, 1, 1, 1, 1, 1,
-0.6782167, 1.319297, 0.893567, 1, 1, 1, 1, 1,
-0.671938, 2.499885, -0.8195438, 1, 1, 1, 1, 1,
-0.6715701, 1.164085, 0.1685774, 1, 1, 1, 1, 1,
-0.6696256, 0.6222736, -0.05463573, 1, 1, 1, 1, 1,
-0.6686006, 0.2739632, -1.611529, 1, 1, 1, 1, 1,
-0.6673635, -0.8507982, -3.191296, 1, 1, 1, 1, 1,
-0.666891, 1.133964, 0.7282365, 0, 0, 1, 1, 1,
-0.6665532, 1.588257, 0.9494011, 1, 0, 0, 1, 1,
-0.6661838, -1.208243, -2.764811, 1, 0, 0, 1, 1,
-0.6657751, -1.191488, -2.546118, 1, 0, 0, 1, 1,
-0.6646695, 0.1247031, -4.993697, 1, 0, 0, 1, 1,
-0.6639869, -0.963901, -3.906202, 1, 0, 0, 1, 1,
-0.6589081, 0.391973, -0.2570865, 0, 0, 0, 1, 1,
-0.6578304, 1.089315, -1.688113, 0, 0, 0, 1, 1,
-0.6562295, -0.4450906, -1.592843, 0, 0, 0, 1, 1,
-0.650428, 1.33924, -1.61056, 0, 0, 0, 1, 1,
-0.6497343, -1.063981, -0.757395, 0, 0, 0, 1, 1,
-0.6462909, 0.1010347, -1.724936, 0, 0, 0, 1, 1,
-0.6460124, -0.256702, -2.180535, 0, 0, 0, 1, 1,
-0.6443001, -0.337702, -1.784856, 1, 1, 1, 1, 1,
-0.6441141, -2.182739, -2.902661, 1, 1, 1, 1, 1,
-0.6432711, 1.267388, -1.446148, 1, 1, 1, 1, 1,
-0.6368525, -0.7625272, -2.432213, 1, 1, 1, 1, 1,
-0.6333247, -0.1008224, -1.03578, 1, 1, 1, 1, 1,
-0.6319509, -0.7965729, -4.471379, 1, 1, 1, 1, 1,
-0.6319228, -0.8926932, -2.746596, 1, 1, 1, 1, 1,
-0.6282517, -2.052004, -2.430246, 1, 1, 1, 1, 1,
-0.6274564, -0.6866535, -2.785797, 1, 1, 1, 1, 1,
-0.6251442, 0.6414732, 0.2130299, 1, 1, 1, 1, 1,
-0.6213772, 0.04251156, -2.632119, 1, 1, 1, 1, 1,
-0.6150287, 1.123136, -0.2056904, 1, 1, 1, 1, 1,
-0.6129356, 0.09421223, -1.794983, 1, 1, 1, 1, 1,
-0.6106584, 0.8190108, 1.136607, 1, 1, 1, 1, 1,
-0.6072674, -2.834282, -4.022396, 1, 1, 1, 1, 1,
-0.6071612, -0.8917452, -2.27209, 0, 0, 1, 1, 1,
-0.6040347, 0.59254, -0.05473626, 1, 0, 0, 1, 1,
-0.6017102, 0.3302676, -2.330278, 1, 0, 0, 1, 1,
-0.6012475, 0.01144912, -1.738329, 1, 0, 0, 1, 1,
-0.597726, -0.613481, -1.78083, 1, 0, 0, 1, 1,
-0.5931904, -0.4511555, -2.080482, 1, 0, 0, 1, 1,
-0.5907069, 0.008838529, -2.47293, 0, 0, 0, 1, 1,
-0.5906553, 0.02585518, -0.6774111, 0, 0, 0, 1, 1,
-0.5803429, 0.4045022, -0.3921228, 0, 0, 0, 1, 1,
-0.5772651, 1.655751, 0.9140882, 0, 0, 0, 1, 1,
-0.5769917, -0.1898489, -0.3299386, 0, 0, 0, 1, 1,
-0.5727159, 0.6308821, -0.8361333, 0, 0, 0, 1, 1,
-0.5705621, -0.6297927, -1.351997, 0, 0, 0, 1, 1,
-0.570071, 0.1022291, -1.427224, 1, 1, 1, 1, 1,
-0.5670983, -0.2252008, -2.891571, 1, 1, 1, 1, 1,
-0.56675, 0.8746856, -0.6176879, 1, 1, 1, 1, 1,
-0.5643224, -0.9922757, -1.178125, 1, 1, 1, 1, 1,
-0.5579665, 0.1827573, -1.022286, 1, 1, 1, 1, 1,
-0.5574383, -3.220052, -3.895184, 1, 1, 1, 1, 1,
-0.5569441, 1.749837, 0.5777324, 1, 1, 1, 1, 1,
-0.5566986, 1.165, -0.428823, 1, 1, 1, 1, 1,
-0.5552307, 0.2276647, -1.047047, 1, 1, 1, 1, 1,
-0.5521581, -0.6840204, -1.177766, 1, 1, 1, 1, 1,
-0.5491031, -0.5290974, -1.449031, 1, 1, 1, 1, 1,
-0.5463002, 0.04070338, -2.886417, 1, 1, 1, 1, 1,
-0.5454986, -0.4663772, -1.85358, 1, 1, 1, 1, 1,
-0.5419977, -0.3069935, -3.262191, 1, 1, 1, 1, 1,
-0.5328405, -0.6901211, -1.846904, 1, 1, 1, 1, 1,
-0.5327489, 0.5939214, -0.9022352, 0, 0, 1, 1, 1,
-0.5320415, 0.7310721, -1.61298, 1, 0, 0, 1, 1,
-0.5181206, 1.336447, 0.1294628, 1, 0, 0, 1, 1,
-0.5163959, -1.396435, -2.424737, 1, 0, 0, 1, 1,
-0.5111161, 0.7095997, -0.871257, 1, 0, 0, 1, 1,
-0.5107298, 1.001151, -1.070612, 1, 0, 0, 1, 1,
-0.5102165, -0.7216427, -3.25778, 0, 0, 0, 1, 1,
-0.5099929, -0.4385206, -3.523745, 0, 0, 0, 1, 1,
-0.5014098, -0.93239, -2.643546, 0, 0, 0, 1, 1,
-0.4983246, 1.410983, -1.310456, 0, 0, 0, 1, 1,
-0.4967658, -0.974432, -4.528101, 0, 0, 0, 1, 1,
-0.491972, 0.01878203, -1.45186, 0, 0, 0, 1, 1,
-0.4914246, -1.446289, -2.13745, 0, 0, 0, 1, 1,
-0.485974, -1.69023, -2.808573, 1, 1, 1, 1, 1,
-0.4775321, 1.126032, 0.3880635, 1, 1, 1, 1, 1,
-0.4752732, -0.5740615, -2.608106, 1, 1, 1, 1, 1,
-0.4741202, -1.358856, -2.925576, 1, 1, 1, 1, 1,
-0.4718108, 1.454033, -1.595714, 1, 1, 1, 1, 1,
-0.4712711, -1.516573, -2.45481, 1, 1, 1, 1, 1,
-0.4692559, 0.5379767, -2.379129, 1, 1, 1, 1, 1,
-0.4647399, -0.3313922, -1.249977, 1, 1, 1, 1, 1,
-0.4632056, -0.617669, -2.457822, 1, 1, 1, 1, 1,
-0.463144, -0.2357569, -0.4572864, 1, 1, 1, 1, 1,
-0.4629688, 0.1187567, -3.831522, 1, 1, 1, 1, 1,
-0.4575506, 1.645803, 0.8076143, 1, 1, 1, 1, 1,
-0.4573968, -0.1135208, -3.872646, 1, 1, 1, 1, 1,
-0.4562585, -0.06929256, -2.495142, 1, 1, 1, 1, 1,
-0.4561138, 0.1460294, -1.424161, 1, 1, 1, 1, 1,
-0.4538859, 1.931273, -1.099118, 0, 0, 1, 1, 1,
-0.4535803, -1.629986, -3.739712, 1, 0, 0, 1, 1,
-0.4530051, -0.3327513, -2.714107, 1, 0, 0, 1, 1,
-0.4508129, -1.318549, -2.917286, 1, 0, 0, 1, 1,
-0.448353, -0.7827872, -2.870999, 1, 0, 0, 1, 1,
-0.4479009, 1.06684, -1.456225, 1, 0, 0, 1, 1,
-0.4458105, -0.2645378, -0.2169883, 0, 0, 0, 1, 1,
-0.4413194, 0.2309188, -1.537064, 0, 0, 0, 1, 1,
-0.4406353, -1.488907, -2.7605, 0, 0, 0, 1, 1,
-0.4402747, -1.337147, -2.80028, 0, 0, 0, 1, 1,
-0.4393798, 0.1142505, -1.186754, 0, 0, 0, 1, 1,
-0.4367061, 2.77167, -0.3706028, 0, 0, 0, 1, 1,
-0.4349048, -1.387861, -4.146856, 0, 0, 0, 1, 1,
-0.4286723, -0.1809165, -1.752561, 1, 1, 1, 1, 1,
-0.4190596, -2.127262, -4.796531, 1, 1, 1, 1, 1,
-0.4178107, 0.9453621, -0.1064492, 1, 1, 1, 1, 1,
-0.4170963, 0.9341649, 1.732503, 1, 1, 1, 1, 1,
-0.4147011, 0.2051786, -1.340279, 1, 1, 1, 1, 1,
-0.4138042, -0.5045091, -2.228595, 1, 1, 1, 1, 1,
-0.4124417, -0.4855082, -2.041355, 1, 1, 1, 1, 1,
-0.4058984, -1.061247, -1.799224, 1, 1, 1, 1, 1,
-0.4038545, 0.4033389, -1.467263, 1, 1, 1, 1, 1,
-0.4036172, -0.9581198, -0.6995759, 1, 1, 1, 1, 1,
-0.4026377, 0.3766596, -0.1049534, 1, 1, 1, 1, 1,
-0.4021367, -0.1253621, -1.559005, 1, 1, 1, 1, 1,
-0.3967502, 0.9468027, 0.8505384, 1, 1, 1, 1, 1,
-0.3960521, 1.053943, 0.5787482, 1, 1, 1, 1, 1,
-0.3932615, -0.3191968, -2.54267, 1, 1, 1, 1, 1,
-0.392195, -0.3001823, -3.056716, 0, 0, 1, 1, 1,
-0.3873188, 1.285461, -0.5529329, 1, 0, 0, 1, 1,
-0.3847789, -2.634201, -2.68316, 1, 0, 0, 1, 1,
-0.3825573, -1.112001, -4.518332, 1, 0, 0, 1, 1,
-0.3775074, 0.4008943, -3.104098, 1, 0, 0, 1, 1,
-0.3711458, 0.3226261, -1.141835, 1, 0, 0, 1, 1,
-0.3628005, 1.037843, -0.3940342, 0, 0, 0, 1, 1,
-0.3571467, 0.8611793, 0.1863298, 0, 0, 0, 1, 1,
-0.3513233, 0.7733763, 0.2257946, 0, 0, 0, 1, 1,
-0.3513034, 0.3973864, 0.009919343, 0, 0, 0, 1, 1,
-0.3501255, -0.8412825, -3.213847, 0, 0, 0, 1, 1,
-0.3464004, -1.904892, -2.573449, 0, 0, 0, 1, 1,
-0.3450567, 0.2611143, -0.5102952, 0, 0, 0, 1, 1,
-0.3438073, -1.064873, -2.532784, 1, 1, 1, 1, 1,
-0.338963, 0.1602401, -0.8045517, 1, 1, 1, 1, 1,
-0.3372065, -1.398489, -2.833353, 1, 1, 1, 1, 1,
-0.3357243, 0.7736132, 0.03931393, 1, 1, 1, 1, 1,
-0.3356828, -0.4205157, -4.877378, 1, 1, 1, 1, 1,
-0.3312762, 0.7881607, -1.699132, 1, 1, 1, 1, 1,
-0.3272354, 0.9251348, -0.02621588, 1, 1, 1, 1, 1,
-0.3268245, -0.3106401, -1.07647, 1, 1, 1, 1, 1,
-0.3209746, -1.120933, -1.356286, 1, 1, 1, 1, 1,
-0.3135022, -0.2958292, -3.210675, 1, 1, 1, 1, 1,
-0.309451, -1.658741, -2.373104, 1, 1, 1, 1, 1,
-0.3079511, 0.6586812, 0.4811193, 1, 1, 1, 1, 1,
-0.296773, 2.476069, -0.1589185, 1, 1, 1, 1, 1,
-0.2964343, -0.8434373, -1.564595, 1, 1, 1, 1, 1,
-0.2922106, 1.212985, -0.907816, 1, 1, 1, 1, 1,
-0.2886803, -0.3622822, -2.676323, 0, 0, 1, 1, 1,
-0.2845981, 0.03137173, -2.791474, 1, 0, 0, 1, 1,
-0.2820917, -0.02243024, -0.2872886, 1, 0, 0, 1, 1,
-0.2782123, 0.117277, -0.8274245, 1, 0, 0, 1, 1,
-0.2727343, 1.484238, -1.019496, 1, 0, 0, 1, 1,
-0.2705976, -1.477646, -2.382253, 1, 0, 0, 1, 1,
-0.2694901, 1.202755, 1.155623, 0, 0, 0, 1, 1,
-0.2693199, -0.4961862, -1.928751, 0, 0, 0, 1, 1,
-0.2678403, 0.4474441, 0.4463859, 0, 0, 0, 1, 1,
-0.2630731, -0.2260081, -2.28173, 0, 0, 0, 1, 1,
-0.2626539, -1.206397, -4.267924, 0, 0, 0, 1, 1,
-0.260318, 0.2389359, -0.575325, 0, 0, 0, 1, 1,
-0.2586544, -0.1332849, -2.370668, 0, 0, 0, 1, 1,
-0.2585375, -0.3734259, -1.792884, 1, 1, 1, 1, 1,
-0.2546757, -0.02755748, -0.4887141, 1, 1, 1, 1, 1,
-0.2492314, -1.559324, -2.958162, 1, 1, 1, 1, 1,
-0.2487077, -0.5097461, -2.745808, 1, 1, 1, 1, 1,
-0.2475141, -0.09446473, -3.439271, 1, 1, 1, 1, 1,
-0.2426736, 0.8500147, 0.7501308, 1, 1, 1, 1, 1,
-0.2306456, 1.308876, -0.6618946, 1, 1, 1, 1, 1,
-0.2255003, -0.5772521, -3.829185, 1, 1, 1, 1, 1,
-0.2143074, 1.04551, 0.643832, 1, 1, 1, 1, 1,
-0.2137222, -1.236761, -1.591417, 1, 1, 1, 1, 1,
-0.2130471, -2.069727, -2.090416, 1, 1, 1, 1, 1,
-0.212127, -1.053708, -3.733731, 1, 1, 1, 1, 1,
-0.2114342, 2.967974, 2.214455, 1, 1, 1, 1, 1,
-0.2106626, -1.251707, -2.26507, 1, 1, 1, 1, 1,
-0.2066031, 0.462963, 0.01437466, 1, 1, 1, 1, 1,
-0.2033174, -0.4302125, -2.462189, 0, 0, 1, 1, 1,
-0.2024365, 0.5705513, 0.5610374, 1, 0, 0, 1, 1,
-0.1996155, -0.6851859, -4.446589, 1, 0, 0, 1, 1,
-0.1893122, -0.7961442, -3.459471, 1, 0, 0, 1, 1,
-0.1885535, 0.9940306, 0.2422849, 1, 0, 0, 1, 1,
-0.187597, 2.087334, -1.277213, 1, 0, 0, 1, 1,
-0.1865921, -0.04562294, -3.244101, 0, 0, 0, 1, 1,
-0.1863004, -0.3381689, -3.275316, 0, 0, 0, 1, 1,
-0.1840594, 1.208177, -0.4391421, 0, 0, 0, 1, 1,
-0.1809734, -0.2912427, -1.594071, 0, 0, 0, 1, 1,
-0.1809599, 0.1065554, -0.127874, 0, 0, 0, 1, 1,
-0.1764303, 0.1073734, 0.2431505, 0, 0, 0, 1, 1,
-0.1744824, 0.5454828, 0.4465189, 0, 0, 0, 1, 1,
-0.1693849, 0.3941027, 0.4667343, 1, 1, 1, 1, 1,
-0.1550178, 0.6299953, 1.403781, 1, 1, 1, 1, 1,
-0.1542489, 0.198576, -2.791661, 1, 1, 1, 1, 1,
-0.1507219, -1.207857, -3.280358, 1, 1, 1, 1, 1,
-0.1474069, 0.8602596, 0.1856305, 1, 1, 1, 1, 1,
-0.1452649, -0.2996647, -4.127781, 1, 1, 1, 1, 1,
-0.1390672, 0.6444715, -2.247567, 1, 1, 1, 1, 1,
-0.1345337, 1.55899, -0.199316, 1, 1, 1, 1, 1,
-0.1305664, 0.7889607, -0.2919916, 1, 1, 1, 1, 1,
-0.1304376, -1.153659, -1.874134, 1, 1, 1, 1, 1,
-0.1279999, -0.9144741, -4.715947, 1, 1, 1, 1, 1,
-0.1265973, -0.4206108, -5.017754, 1, 1, 1, 1, 1,
-0.1235982, -0.9076632, -3.765744, 1, 1, 1, 1, 1,
-0.1228444, 0.3151633, -0.8175015, 1, 1, 1, 1, 1,
-0.1210763, 0.691775, -0.4987411, 1, 1, 1, 1, 1,
-0.1175615, 1.105494, 1.15576, 0, 0, 1, 1, 1,
-0.116529, 2.383463, 1.610392, 1, 0, 0, 1, 1,
-0.113464, -0.06535316, -1.050722, 1, 0, 0, 1, 1,
-0.1131091, -0.227493, -1.673787, 1, 0, 0, 1, 1,
-0.1125935, 1.407588, -0.4911424, 1, 0, 0, 1, 1,
-0.112585, 0.1963779, 0.04712828, 1, 0, 0, 1, 1,
-0.1080022, 1.318063, -0.8119069, 0, 0, 0, 1, 1,
-0.1078662, -0.819872, -3.112765, 0, 0, 0, 1, 1,
-0.1074915, -2.125172, -3.229165, 0, 0, 0, 1, 1,
-0.1070268, 0.7295272, 0.7224712, 0, 0, 0, 1, 1,
-0.1000823, -0.3246724, -2.580783, 0, 0, 0, 1, 1,
-0.09742597, -0.4057952, -1.678074, 0, 0, 0, 1, 1,
-0.09618305, 0.8685415, 0.1721377, 0, 0, 0, 1, 1,
-0.09459457, -0.2173322, -2.480386, 1, 1, 1, 1, 1,
-0.09088912, -1.255673, -4.015872, 1, 1, 1, 1, 1,
-0.08962231, -0.8908408, -3.186884, 1, 1, 1, 1, 1,
-0.08900817, 0.1248172, 0.3315924, 1, 1, 1, 1, 1,
-0.08788722, -0.4434628, -2.171192, 1, 1, 1, 1, 1,
-0.08623711, 1.197232, 2.065778, 1, 1, 1, 1, 1,
-0.08597352, 0.2819306, -0.2513858, 1, 1, 1, 1, 1,
-0.08245827, 0.9391087, 0.4987766, 1, 1, 1, 1, 1,
-0.07078619, -0.1583657, -2.355786, 1, 1, 1, 1, 1,
-0.06885089, -0.8007733, -4.528359, 1, 1, 1, 1, 1,
-0.06658937, 0.4066419, 0.05617798, 1, 1, 1, 1, 1,
-0.06641489, -0.5393736, -1.947779, 1, 1, 1, 1, 1,
-0.06465433, -0.8853942, -2.136938, 1, 1, 1, 1, 1,
-0.06286253, 0.01923541, -1.215148, 1, 1, 1, 1, 1,
-0.05797367, 1.366382, 0.4126568, 1, 1, 1, 1, 1,
-0.05648897, 0.9586509, -0.9746702, 0, 0, 1, 1, 1,
-0.05398103, 0.6892284, -0.5657316, 1, 0, 0, 1, 1,
-0.0520807, 0.7596886, -0.205035, 1, 0, 0, 1, 1,
-0.05157477, 0.1230663, -1.09015, 1, 0, 0, 1, 1,
-0.0497768, 0.2566933, -1.038328, 1, 0, 0, 1, 1,
-0.04842026, 0.4827779, -0.787035, 1, 0, 0, 1, 1,
-0.04766849, -0.3109266, -2.428546, 0, 0, 0, 1, 1,
-0.04697876, 1.126542, 1.092004, 0, 0, 0, 1, 1,
-0.04160932, -0.3729136, -3.05135, 0, 0, 0, 1, 1,
-0.03707016, -0.2356728, -2.775111, 0, 0, 0, 1, 1,
-0.03593593, 0.7759954, -0.3394249, 0, 0, 0, 1, 1,
-0.03450873, -1.837877, -2.404111, 0, 0, 0, 1, 1,
-0.02992372, 2.038733, 0.8696924, 0, 0, 0, 1, 1,
-0.0253091, -1.993959, -2.159927, 1, 1, 1, 1, 1,
-0.02364457, -0.09816109, -2.485614, 1, 1, 1, 1, 1,
-0.02193182, 0.1840966, -1.255983, 1, 1, 1, 1, 1,
-0.01499636, -0.4390156, -3.134488, 1, 1, 1, 1, 1,
-0.008573901, 1.480643, -0.3691089, 1, 1, 1, 1, 1,
-0.001767501, 0.9527234, -0.5843797, 1, 1, 1, 1, 1,
0.002034038, -1.124562, 1.956852, 1, 1, 1, 1, 1,
0.003149313, 1.577598, -0.6753864, 1, 1, 1, 1, 1,
0.003999842, 0.3681759, 0.1374716, 1, 1, 1, 1, 1,
0.004385132, -0.7400028, 4.139982, 1, 1, 1, 1, 1,
0.008759849, -0.6132034, 2.382011, 1, 1, 1, 1, 1,
0.01157631, 0.631928, 1.544426, 1, 1, 1, 1, 1,
0.01195992, 0.5231457, 0.7166545, 1, 1, 1, 1, 1,
0.01251099, -0.6329162, 4.665961, 1, 1, 1, 1, 1,
0.01262906, -0.5070133, 3.002888, 1, 1, 1, 1, 1,
0.01494197, 0.9860004, -0.06957394, 0, 0, 1, 1, 1,
0.01787867, -0.6215922, 1.632324, 1, 0, 0, 1, 1,
0.02235026, 1.526407, -0.1118535, 1, 0, 0, 1, 1,
0.02309161, -0.5200143, 2.99166, 1, 0, 0, 1, 1,
0.02723375, -1.512983, 2.931083, 1, 0, 0, 1, 1,
0.02803141, -0.8229427, 2.210205, 1, 0, 0, 1, 1,
0.03046666, -0.8016377, 1.922425, 0, 0, 0, 1, 1,
0.03224281, -0.1460492, 1.997279, 0, 0, 0, 1, 1,
0.03233169, 0.3168937, 0.2816928, 0, 0, 0, 1, 1,
0.03271483, 0.9090657, -0.3990995, 0, 0, 0, 1, 1,
0.03459827, -0.7724057, 2.146492, 0, 0, 0, 1, 1,
0.03841299, -0.02540345, 4.092297, 0, 0, 0, 1, 1,
0.04137884, -0.3697635, 2.418625, 0, 0, 0, 1, 1,
0.04362718, 0.4755295, -1.066022, 1, 1, 1, 1, 1,
0.04433063, -0.1932603, 3.235224, 1, 1, 1, 1, 1,
0.05516065, 0.2332033, 2.010065, 1, 1, 1, 1, 1,
0.05736414, -0.01415547, 1.155955, 1, 1, 1, 1, 1,
0.05889815, -0.3199417, 1.788091, 1, 1, 1, 1, 1,
0.06069685, -0.9603446, 3.274349, 1, 1, 1, 1, 1,
0.06250127, 1.250629, -0.6994897, 1, 1, 1, 1, 1,
0.06429493, 0.7370299, 1.222725, 1, 1, 1, 1, 1,
0.06532349, 0.2217721, 0.8295617, 1, 1, 1, 1, 1,
0.06820654, -0.1123802, 3.634692, 1, 1, 1, 1, 1,
0.0705511, -0.2672792, 3.125632, 1, 1, 1, 1, 1,
0.07063223, -1.729853, 3.845731, 1, 1, 1, 1, 1,
0.07198949, 0.8650973, 2.091027, 1, 1, 1, 1, 1,
0.0752058, -0.235033, 1.806602, 1, 1, 1, 1, 1,
0.07670102, 0.396975, -0.122217, 1, 1, 1, 1, 1,
0.07925141, -0.382411, 2.619915, 0, 0, 1, 1, 1,
0.08734936, 0.03536996, 0.1865344, 1, 0, 0, 1, 1,
0.09127759, -0.2725965, 4.66692, 1, 0, 0, 1, 1,
0.1038163, -1.048373, 3.149129, 1, 0, 0, 1, 1,
0.105514, -0.4549684, 3.157807, 1, 0, 0, 1, 1,
0.1062857, -0.1734943, 2.392222, 1, 0, 0, 1, 1,
0.1229635, 1.111781, -0.06670385, 0, 0, 0, 1, 1,
0.1282316, -0.06010852, 2.616862, 0, 0, 0, 1, 1,
0.1308328, -0.8301869, 3.950151, 0, 0, 0, 1, 1,
0.132138, 1.250594, 1.082363, 0, 0, 0, 1, 1,
0.1353815, -0.6760983, 3.451478, 0, 0, 0, 1, 1,
0.1374122, -0.9446136, 2.280581, 0, 0, 0, 1, 1,
0.1374724, -0.3226595, 0.9094808, 0, 0, 0, 1, 1,
0.1403777, 1.619522, -0.9383989, 1, 1, 1, 1, 1,
0.1416409, 0.8661434, -0.1831473, 1, 1, 1, 1, 1,
0.1423203, 0.9177673, -0.5102265, 1, 1, 1, 1, 1,
0.1437142, 1.077267, -0.1958449, 1, 1, 1, 1, 1,
0.1444464, 0.6411555, 0.3604826, 1, 1, 1, 1, 1,
0.1480965, -1.207028, 1.43628, 1, 1, 1, 1, 1,
0.152485, -0.2030746, 1.09887, 1, 1, 1, 1, 1,
0.1536891, -0.9052215, 4.5646, 1, 1, 1, 1, 1,
0.1545371, -0.1102769, 0.8932557, 1, 1, 1, 1, 1,
0.1548975, 0.686056, -0.1752968, 1, 1, 1, 1, 1,
0.1560907, 0.3738553, -0.3868724, 1, 1, 1, 1, 1,
0.1583355, 0.2908571, 3.176492, 1, 1, 1, 1, 1,
0.1645542, -0.3831955, 4.505592, 1, 1, 1, 1, 1,
0.1659945, 0.6419185, -0.6149164, 1, 1, 1, 1, 1,
0.166855, 0.5747451, 1.675279, 1, 1, 1, 1, 1,
0.1693052, 2.166131, 0.2383078, 0, 0, 1, 1, 1,
0.1693554, 1.813858, 1.737781, 1, 0, 0, 1, 1,
0.1705143, 0.9683397, 0.09540422, 1, 0, 0, 1, 1,
0.1721234, -0.6413254, 5.816057, 1, 0, 0, 1, 1,
0.1747661, 0.4899938, 0.6897218, 1, 0, 0, 1, 1,
0.1772232, 0.9684198, 2.230504, 1, 0, 0, 1, 1,
0.1832274, 0.7682574, 0.660994, 0, 0, 0, 1, 1,
0.1836425, -0.2183074, 2.262801, 0, 0, 0, 1, 1,
0.189614, 1.155723, 0.03460433, 0, 0, 0, 1, 1,
0.1907014, -1.063528, 2.636366, 0, 0, 0, 1, 1,
0.1917501, 1.150081, -0.1215067, 0, 0, 0, 1, 1,
0.1940307, 0.971323, -0.04613196, 0, 0, 0, 1, 1,
0.1940642, -0.1720821, 2.378814, 0, 0, 0, 1, 1,
0.197605, -1.948951, 2.113022, 1, 1, 1, 1, 1,
0.2037081, -0.9729015, 2.608968, 1, 1, 1, 1, 1,
0.2054968, -1.623979, 3.953258, 1, 1, 1, 1, 1,
0.2092737, -2.355299, 2.810608, 1, 1, 1, 1, 1,
0.2105072, 0.7058664, 0.3422226, 1, 1, 1, 1, 1,
0.212869, -0.1608516, 1.144729, 1, 1, 1, 1, 1,
0.2144603, -1.264589, 2.535975, 1, 1, 1, 1, 1,
0.2154493, 1.140168, 0.8160967, 1, 1, 1, 1, 1,
0.2185254, -1.570967, 4.007838, 1, 1, 1, 1, 1,
0.2202709, 1.20779, -1.894772, 1, 1, 1, 1, 1,
0.2210521, 1.924385, 0.579096, 1, 1, 1, 1, 1,
0.2228029, 0.4878036, 0.1610022, 1, 1, 1, 1, 1,
0.2255768, -0.9802237, 3.527468, 1, 1, 1, 1, 1,
0.228273, -1.126816, 2.273377, 1, 1, 1, 1, 1,
0.2293514, 0.8170467, 0.8914577, 1, 1, 1, 1, 1,
0.2338677, -1.65468, 4.060611, 0, 0, 1, 1, 1,
0.2344353, -0.4917919, 2.00997, 1, 0, 0, 1, 1,
0.2348863, 0.2458135, 0.3687988, 1, 0, 0, 1, 1,
0.2377612, -2.522604, 3.008036, 1, 0, 0, 1, 1,
0.238542, 0.2770807, 1.952024, 1, 0, 0, 1, 1,
0.2396756, 0.5718123, 1.043099, 1, 0, 0, 1, 1,
0.2413337, -0.09907565, 0.2522435, 0, 0, 0, 1, 1,
0.2417346, 0.05840202, 1.570574, 0, 0, 0, 1, 1,
0.2418528, -0.2716963, 3.643763, 0, 0, 0, 1, 1,
0.2422204, 0.1612929, 0.8408473, 0, 0, 0, 1, 1,
0.2429473, 0.7984206, 0.3089322, 0, 0, 0, 1, 1,
0.2433565, -1.639888, 2.194946, 0, 0, 0, 1, 1,
0.2471137, -1.654799, 2.951673, 0, 0, 0, 1, 1,
0.2488385, -1.990763, 3.035519, 1, 1, 1, 1, 1,
0.2571223, -0.195235, 1.677037, 1, 1, 1, 1, 1,
0.2592235, -1.221485, 2.834789, 1, 1, 1, 1, 1,
0.2594458, 1.320852, 1.21835, 1, 1, 1, 1, 1,
0.2609757, 0.5377841, 0.4839142, 1, 1, 1, 1, 1,
0.2642433, 0.4296146, -1.87243, 1, 1, 1, 1, 1,
0.2756309, -0.1618172, 2.747689, 1, 1, 1, 1, 1,
0.2793184, -0.5735111, 2.111178, 1, 1, 1, 1, 1,
0.2854982, -0.3767664, 2.696675, 1, 1, 1, 1, 1,
0.2884791, -0.05502556, 2.668499, 1, 1, 1, 1, 1,
0.2886145, -0.4834734, 3.683771, 1, 1, 1, 1, 1,
0.2944915, -1.201298, 2.548184, 1, 1, 1, 1, 1,
0.295189, 0.3279023, 2.092386, 1, 1, 1, 1, 1,
0.2964154, 1.14966, 1.183133, 1, 1, 1, 1, 1,
0.3001919, -0.810728, 3.015442, 1, 1, 1, 1, 1,
0.3033129, -0.2345441, 3.794466, 0, 0, 1, 1, 1,
0.3048937, 0.0922434, 2.886368, 1, 0, 0, 1, 1,
0.3153602, 1.140462, -1.067125, 1, 0, 0, 1, 1,
0.3161843, -0.05139712, 1.500057, 1, 0, 0, 1, 1,
0.3167114, -1.732631, 2.189837, 1, 0, 0, 1, 1,
0.3181486, -1.552748, 3.712886, 1, 0, 0, 1, 1,
0.3183093, -0.1628944, 3.520255, 0, 0, 0, 1, 1,
0.3185249, 1.304142, 1.309645, 0, 0, 0, 1, 1,
0.3187581, 0.3337478, 2.190017, 0, 0, 0, 1, 1,
0.3294054, 0.5650086, -0.8858446, 0, 0, 0, 1, 1,
0.3318117, -1.572245, 2.467527, 0, 0, 0, 1, 1,
0.3390395, 1.268079, 0.3369233, 0, 0, 0, 1, 1,
0.3400016, 1.231332, -0.4301238, 0, 0, 0, 1, 1,
0.3426571, -1.44067, 1.93697, 1, 1, 1, 1, 1,
0.3435766, -0.3823458, 3.268332, 1, 1, 1, 1, 1,
0.3441797, 2.44383, 1.636522, 1, 1, 1, 1, 1,
0.3503936, 1.308149, 1.2711, 1, 1, 1, 1, 1,
0.3510826, 1.050203, 1.125256, 1, 1, 1, 1, 1,
0.3546143, 0.5440482, 0.9428928, 1, 1, 1, 1, 1,
0.3614793, 0.241533, 0.2988556, 1, 1, 1, 1, 1,
0.3647515, 2.048299, 0.3477182, 1, 1, 1, 1, 1,
0.3670232, 0.08933222, 1.836261, 1, 1, 1, 1, 1,
0.3677049, 0.9866654, 0.9872085, 1, 1, 1, 1, 1,
0.3680894, -1.089965, 1.534937, 1, 1, 1, 1, 1,
0.3683701, -0.7578576, 2.781884, 1, 1, 1, 1, 1,
0.3742566, -0.4398991, 1.865684, 1, 1, 1, 1, 1,
0.3790968, 0.8255322, 1.630207, 1, 1, 1, 1, 1,
0.3827126, 0.1424147, 1.389312, 1, 1, 1, 1, 1,
0.3829018, -0.4502644, 2.443512, 0, 0, 1, 1, 1,
0.3836731, 0.5257642, 0.9463685, 1, 0, 0, 1, 1,
0.3881071, 1.182479, -1.014512, 1, 0, 0, 1, 1,
0.3941961, 0.03437023, 0.2366389, 1, 0, 0, 1, 1,
0.3983127, 0.05460069, 1.196505, 1, 0, 0, 1, 1,
0.3985633, -2.127739, 3.256084, 1, 0, 0, 1, 1,
0.3994803, 0.5579965, 1.059614, 0, 0, 0, 1, 1,
0.3997969, -1.188042, 3.276841, 0, 0, 0, 1, 1,
0.4006567, -0.3494283, 2.97249, 0, 0, 0, 1, 1,
0.4008009, 0.1201929, 2.317874, 0, 0, 0, 1, 1,
0.4015583, 0.07403163, 3.03576, 0, 0, 0, 1, 1,
0.4071951, -2.069507, 3.671178, 0, 0, 0, 1, 1,
0.4100799, 1.353046, -0.1116876, 0, 0, 0, 1, 1,
0.4106988, -0.5027316, 3.108671, 1, 1, 1, 1, 1,
0.4109793, -2.058292, 1.529792, 1, 1, 1, 1, 1,
0.4110068, 0.5260999, -0.2916391, 1, 1, 1, 1, 1,
0.411162, -2.754073, 2.938479, 1, 1, 1, 1, 1,
0.4186042, 1.023029, 0.1980097, 1, 1, 1, 1, 1,
0.4210266, 0.1176645, 0.9050863, 1, 1, 1, 1, 1,
0.421179, -0.808446, 3.755529, 1, 1, 1, 1, 1,
0.4222139, -1.30031, 1.432264, 1, 1, 1, 1, 1,
0.4242416, 1.32577, -0.7695553, 1, 1, 1, 1, 1,
0.4282023, -0.06919544, 2.927243, 1, 1, 1, 1, 1,
0.4293396, 1.814999, 0.6456546, 1, 1, 1, 1, 1,
0.4436654, -0.7373342, 3.071877, 1, 1, 1, 1, 1,
0.4440223, -1.525244, 4.906241, 1, 1, 1, 1, 1,
0.4448417, -2.368441, 6.084673, 1, 1, 1, 1, 1,
0.4456575, -1.702514, 3.590081, 1, 1, 1, 1, 1,
0.4468328, 0.2447297, 3.526086, 0, 0, 1, 1, 1,
0.4537435, -0.8617848, 0.0255176, 1, 0, 0, 1, 1,
0.4542576, -0.17703, 0.9038413, 1, 0, 0, 1, 1,
0.458116, 0.747692, -0.1998303, 1, 0, 0, 1, 1,
0.4594898, -0.7690696, 4.851896, 1, 0, 0, 1, 1,
0.460974, -1.022357, 2.527218, 1, 0, 0, 1, 1,
0.4623877, -0.8680987, 1.502771, 0, 0, 0, 1, 1,
0.4644721, 1.201821, 0.3940064, 0, 0, 0, 1, 1,
0.4661921, -1.812023, 3.193583, 0, 0, 0, 1, 1,
0.4663993, 0.8082526, -0.358224, 0, 0, 0, 1, 1,
0.467499, 1.90686, -1.351894, 0, 0, 0, 1, 1,
0.4686065, -1.590636, 2.644409, 0, 0, 0, 1, 1,
0.470457, 0.1690736, 1.848155, 0, 0, 0, 1, 1,
0.4740111, -0.2288943, 2.871254, 1, 1, 1, 1, 1,
0.4765327, 1.232437, 1.10148, 1, 1, 1, 1, 1,
0.4784423, 1.271297, -0.3996013, 1, 1, 1, 1, 1,
0.4850765, -1.590345, 3.438764, 1, 1, 1, 1, 1,
0.4864576, 0.6478379, 1.964431, 1, 1, 1, 1, 1,
0.4882443, -2.679069, 3.232255, 1, 1, 1, 1, 1,
0.4962791, 1.284399, 2.043042, 1, 1, 1, 1, 1,
0.4993185, -0.1394927, 1.959779, 1, 1, 1, 1, 1,
0.5003299, 0.3208137, 1.204848, 1, 1, 1, 1, 1,
0.5026126, 0.4973465, -1.093278, 1, 1, 1, 1, 1,
0.5079113, 0.6973048, 1.515082, 1, 1, 1, 1, 1,
0.5084068, 0.7162326, 1.051077, 1, 1, 1, 1, 1,
0.5097578, -2.186109, 2.617617, 1, 1, 1, 1, 1,
0.5141184, -0.4916596, 3.31198, 1, 1, 1, 1, 1,
0.5155236, 0.03890081, 1.471103, 1, 1, 1, 1, 1,
0.5183648, -1.518033, 4.143745, 0, 0, 1, 1, 1,
0.5195427, 0.6274312, 0.7606792, 1, 0, 0, 1, 1,
0.5258342, -1.506153, 2.777805, 1, 0, 0, 1, 1,
0.5285844, 1.012058, 2.037587, 1, 0, 0, 1, 1,
0.5331455, -1.939956, 2.930673, 1, 0, 0, 1, 1,
0.534697, 0.2013435, 2.297234, 1, 0, 0, 1, 1,
0.5355638, 0.1609021, 2.35668, 0, 0, 0, 1, 1,
0.5385512, 0.3873382, 2.958297, 0, 0, 0, 1, 1,
0.5420051, -0.3059351, 0.5236687, 0, 0, 0, 1, 1,
0.5464433, 1.035426, 0.04799483, 0, 0, 0, 1, 1,
0.5466633, 0.4910092, 0.2282967, 0, 0, 0, 1, 1,
0.5490908, 1.376354, 0.02034028, 0, 0, 0, 1, 1,
0.5502378, 0.4799614, 1.575516, 0, 0, 0, 1, 1,
0.555057, -0.6239257, 3.212816, 1, 1, 1, 1, 1,
0.5626277, -0.6747155, 1.916033, 1, 1, 1, 1, 1,
0.562696, -1.197478, 1.539383, 1, 1, 1, 1, 1,
0.5708665, -0.6595308, 4.034984, 1, 1, 1, 1, 1,
0.5804684, -0.6366067, 4.112926, 1, 1, 1, 1, 1,
0.5819094, -0.4486453, 1.242247, 1, 1, 1, 1, 1,
0.5858108, -1.039108, 1.003111, 1, 1, 1, 1, 1,
0.5881367, 0.2008291, 2.057744, 1, 1, 1, 1, 1,
0.5890521, -0.04341263, 1.530958, 1, 1, 1, 1, 1,
0.5913607, 0.3113007, 1.960706, 1, 1, 1, 1, 1,
0.5919454, 0.801617, -0.4187443, 1, 1, 1, 1, 1,
0.5934289, -0.2915667, 1.814094, 1, 1, 1, 1, 1,
0.5940489, -1.543823, 3.060923, 1, 1, 1, 1, 1,
0.5949943, 0.0339921, 1.062719, 1, 1, 1, 1, 1,
0.5951072, -0.6269504, 2.678514, 1, 1, 1, 1, 1,
0.5969315, -0.2583364, 2.171739, 0, 0, 1, 1, 1,
0.6000257, 1.068937, 0.001679003, 1, 0, 0, 1, 1,
0.610239, 0.1261859, 2.253381, 1, 0, 0, 1, 1,
0.6153495, 0.1282034, -0.7510387, 1, 0, 0, 1, 1,
0.6187614, 1.447291, 1.736072, 1, 0, 0, 1, 1,
0.627691, -0.5684853, 2.591264, 1, 0, 0, 1, 1,
0.6282909, 1.038997, -0.3090566, 0, 0, 0, 1, 1,
0.6298432, 0.2299533, 2.560375, 0, 0, 0, 1, 1,
0.6371983, -0.9743197, 4.216789, 0, 0, 0, 1, 1,
0.6401984, 0.9096127, 0.01549938, 0, 0, 0, 1, 1,
0.641591, 0.7183886, 0.885672, 0, 0, 0, 1, 1,
0.6438493, 0.7118411, 0.3822484, 0, 0, 0, 1, 1,
0.646008, -0.8872155, 3.813423, 0, 0, 0, 1, 1,
0.6474905, -1.123851, 3.607244, 1, 1, 1, 1, 1,
0.6476318, 3.175053, 0.5680642, 1, 1, 1, 1, 1,
0.656783, -0.1111978, 0.6197341, 1, 1, 1, 1, 1,
0.6585296, -0.7429522, 2.066279, 1, 1, 1, 1, 1,
0.6705509, 0.2303994, 1.258249, 1, 1, 1, 1, 1,
0.6747619, 0.3128361, 2.680678, 1, 1, 1, 1, 1,
0.6774757, 1.243381, 1.243879, 1, 1, 1, 1, 1,
0.6786942, -0.9417425, 2.904583, 1, 1, 1, 1, 1,
0.6797451, 0.07529735, 1.29538, 1, 1, 1, 1, 1,
0.6803955, -0.6780956, 1.919046, 1, 1, 1, 1, 1,
0.6812669, -0.7277038, 3.09713, 1, 1, 1, 1, 1,
0.6896436, -1.636849, 2.398532, 1, 1, 1, 1, 1,
0.6905473, -0.07073281, 3.066451, 1, 1, 1, 1, 1,
0.6906089, 0.3270836, 3.270673, 1, 1, 1, 1, 1,
0.6916977, 0.433433, -0.5279435, 1, 1, 1, 1, 1,
0.692627, -0.0009176154, 1.989264, 0, 0, 1, 1, 1,
0.6945474, -0.5344416, 2.141552, 1, 0, 0, 1, 1,
0.69605, -1.103095, 2.906157, 1, 0, 0, 1, 1,
0.7006727, 1.132973, 0.801409, 1, 0, 0, 1, 1,
0.7016352, -1.672084, 3.962726, 1, 0, 0, 1, 1,
0.702828, 0.6419241, 3.376014, 1, 0, 0, 1, 1,
0.7050495, -0.6932592, 1.963159, 0, 0, 0, 1, 1,
0.7079362, -0.357736, 1.298017, 0, 0, 0, 1, 1,
0.7105941, 1.133677, 1.350299, 0, 0, 0, 1, 1,
0.7131761, 1.442006, -0.4743192, 0, 0, 0, 1, 1,
0.7140526, 1.017944, 0.4728217, 0, 0, 0, 1, 1,
0.714971, -1.321664, 1.045184, 0, 0, 0, 1, 1,
0.7218724, -0.8687348, 1.290161, 0, 0, 0, 1, 1,
0.7227405, -0.463576, 0.7911529, 1, 1, 1, 1, 1,
0.7291004, -0.2008116, 0.5973651, 1, 1, 1, 1, 1,
0.7298521, 1.706715, 2.846708, 1, 1, 1, 1, 1,
0.7305921, -0.08382111, 2.942397, 1, 1, 1, 1, 1,
0.7312548, -0.0989281, 1.104954, 1, 1, 1, 1, 1,
0.7380586, 1.358516, 0.75488, 1, 1, 1, 1, 1,
0.7394133, -1.238463, 1.868665, 1, 1, 1, 1, 1,
0.7396494, 2.018272, 1.404632, 1, 1, 1, 1, 1,
0.7472896, -0.6274486, 2.367804, 1, 1, 1, 1, 1,
0.7527769, 0.6440976, -0.2643125, 1, 1, 1, 1, 1,
0.7541562, 0.2748062, -0.1137195, 1, 1, 1, 1, 1,
0.7545364, -0.7808301, 0.6468372, 1, 1, 1, 1, 1,
0.7645184, -1.294599, 2.700886, 1, 1, 1, 1, 1,
0.7674657, 0.7689579, 1.473905, 1, 1, 1, 1, 1,
0.7715628, 0.8194402, 2.050982, 1, 1, 1, 1, 1,
0.7726596, 1.098048, -0.1041518, 0, 0, 1, 1, 1,
0.7730302, 0.4693867, 0.07049373, 1, 0, 0, 1, 1,
0.7732263, 0.3187606, 1.490632, 1, 0, 0, 1, 1,
0.7764161, 0.6350654, -0.2058314, 1, 0, 0, 1, 1,
0.7768936, -0.9339897, 3.548264, 1, 0, 0, 1, 1,
0.7833031, -0.08969496, -0.1234673, 1, 0, 0, 1, 1,
0.7846796, 1.164292, -0.1680221, 0, 0, 0, 1, 1,
0.7857543, 0.3240772, 1.6619, 0, 0, 0, 1, 1,
0.7867348, -1.46575, 3.306484, 0, 0, 0, 1, 1,
0.7867763, -2.54268, 2.314924, 0, 0, 0, 1, 1,
0.7911782, -0.813073, 1.83332, 0, 0, 0, 1, 1,
0.7991443, -2.018631, 2.371566, 0, 0, 0, 1, 1,
0.801971, 0.03060968, 2.514152, 0, 0, 0, 1, 1,
0.802122, -0.8515284, 0.136649, 1, 1, 1, 1, 1,
0.8060641, -1.191652, 3.398849, 1, 1, 1, 1, 1,
0.8085668, 1.248523, 0.09681657, 1, 1, 1, 1, 1,
0.8123381, 0.1735914, 1.938893, 1, 1, 1, 1, 1,
0.8182662, 0.8126573, 0.8508696, 1, 1, 1, 1, 1,
0.822556, -0.7452748, 2.675121, 1, 1, 1, 1, 1,
0.8241367, -2.146676, 3.827097, 1, 1, 1, 1, 1,
0.8359514, -0.6643753, 2.704652, 1, 1, 1, 1, 1,
0.8387508, -1.831334, 1.433002, 1, 1, 1, 1, 1,
0.841627, 1.616455, -0.8809865, 1, 1, 1, 1, 1,
0.8442513, -0.2081111, 2.038658, 1, 1, 1, 1, 1,
0.8464273, 0.8620721, -0.1171021, 1, 1, 1, 1, 1,
0.849943, 0.1844963, 0.6913903, 1, 1, 1, 1, 1,
0.8566632, 0.603579, 1.771608, 1, 1, 1, 1, 1,
0.8591981, -0.6329443, 3.357369, 1, 1, 1, 1, 1,
0.862882, -0.6115066, 1.706554, 0, 0, 1, 1, 1,
0.8667832, -0.4865038, 2.105003, 1, 0, 0, 1, 1,
0.8690187, 0.0006385788, 0.5723931, 1, 0, 0, 1, 1,
0.8754139, 0.4174444, -0.3570803, 1, 0, 0, 1, 1,
0.8774777, 1.541835, 1.885806, 1, 0, 0, 1, 1,
0.8844441, -1.046269, 3.150696, 1, 0, 0, 1, 1,
0.8852409, 1.076842, 0.1240145, 0, 0, 0, 1, 1,
0.8896144, 0.9712028, -0.4677688, 0, 0, 0, 1, 1,
0.8916395, 1.608018, 0.4913342, 0, 0, 0, 1, 1,
0.8962829, -0.03081692, 2.415155, 0, 0, 0, 1, 1,
0.9041731, -1.478526, 2.996811, 0, 0, 0, 1, 1,
0.9047698, -0.8244635, 2.462255, 0, 0, 0, 1, 1,
0.9097685, -2.189017, 2.529389, 0, 0, 0, 1, 1,
0.9128167, 0.2160107, 0.9482375, 1, 1, 1, 1, 1,
0.9166865, -0.04391513, 1.044396, 1, 1, 1, 1, 1,
0.9201185, 1.439771, 1.352663, 1, 1, 1, 1, 1,
0.9287309, -1.17341, 1.058487, 1, 1, 1, 1, 1,
0.9289951, 0.3277326, 1.248164, 1, 1, 1, 1, 1,
0.9292108, 1.491289, -0.7375187, 1, 1, 1, 1, 1,
0.9313199, 0.6028349, 1.807331, 1, 1, 1, 1, 1,
0.9425488, 0.04616827, 3.160257, 1, 1, 1, 1, 1,
0.9452919, 0.1506921, 1.656545, 1, 1, 1, 1, 1,
0.9461524, -0.8679327, 3.496622, 1, 1, 1, 1, 1,
0.9494559, 1.201882, 1.081391, 1, 1, 1, 1, 1,
0.9505932, -0.7670447, 1.754185, 1, 1, 1, 1, 1,
0.9518867, -0.681819, 0.1202, 1, 1, 1, 1, 1,
0.9569744, 0.584923, 1.29713, 1, 1, 1, 1, 1,
0.9611624, 0.4869877, 0.8573419, 1, 1, 1, 1, 1,
0.9632491, -1.292007, 2.31916, 0, 0, 1, 1, 1,
0.9637021, -3.090514, 1.433139, 1, 0, 0, 1, 1,
0.9752241, 0.2700169, 3.597488, 1, 0, 0, 1, 1,
0.9770278, -1.657102, 4.24833, 1, 0, 0, 1, 1,
0.9823612, 0.6522933, 1.791406, 1, 0, 0, 1, 1,
0.9852089, -1.263543, 2.624475, 1, 0, 0, 1, 1,
0.9867162, -1.016755, 3.046229, 0, 0, 0, 1, 1,
0.9867239, 1.69264, -0.6704571, 0, 0, 0, 1, 1,
0.9889014, -0.4273328, 0.9577048, 0, 0, 0, 1, 1,
0.9891971, 0.9912738, 0.6503928, 0, 0, 0, 1, 1,
0.9923972, -1.503935, 2.739448, 0, 0, 0, 1, 1,
0.9952054, 1.074252, -0.05306549, 0, 0, 0, 1, 1,
0.9967294, 1.459877, 0.1025248, 0, 0, 0, 1, 1,
1.00615, -1.188971, 2.65013, 1, 1, 1, 1, 1,
1.006906, -0.9051459, 1.648385, 1, 1, 1, 1, 1,
1.012753, -1.360066, 1.948731, 1, 1, 1, 1, 1,
1.023507, 0.6811125, 1.454343, 1, 1, 1, 1, 1,
1.02475, -0.2260862, 2.344722, 1, 1, 1, 1, 1,
1.039349, 0.7747678, 1.185321, 1, 1, 1, 1, 1,
1.04318, 1.264375, 1.302115, 1, 1, 1, 1, 1,
1.052349, 1.003541, 1.118089, 1, 1, 1, 1, 1,
1.05725, 0.08529527, 1.84496, 1, 1, 1, 1, 1,
1.060377, -0.5731056, 2.117637, 1, 1, 1, 1, 1,
1.068815, 1.795497, -1.051826, 1, 1, 1, 1, 1,
1.069223, 0.7792929, 2.336623, 1, 1, 1, 1, 1,
1.069598, -0.08620241, 1.728195, 1, 1, 1, 1, 1,
1.072206, 0.1230221, 0.2942455, 1, 1, 1, 1, 1,
1.076486, 1.345563, 0.3184839, 1, 1, 1, 1, 1,
1.076924, 0.8316493, -0.02777185, 0, 0, 1, 1, 1,
1.079737, 1.057268, -1.647879, 1, 0, 0, 1, 1,
1.082, 1.052482, 2.28978, 1, 0, 0, 1, 1,
1.082594, 1.299661, -0.2376452, 1, 0, 0, 1, 1,
1.083166, 0.960942, 2.896794, 1, 0, 0, 1, 1,
1.083748, 0.3092226, 2.462409, 1, 0, 0, 1, 1,
1.095069, -0.4333535, 4.554501, 0, 0, 0, 1, 1,
1.103189, -1.211627, 1.881365, 0, 0, 0, 1, 1,
1.104558, 0.1754523, 1.746329, 0, 0, 0, 1, 1,
1.10642, -0.001246435, 2.201716, 0, 0, 0, 1, 1,
1.106901, 1.511271, 1.153311, 0, 0, 0, 1, 1,
1.110225, 0.2537441, -0.01295046, 0, 0, 0, 1, 1,
1.116547, 0.02531907, 1.779149, 0, 0, 0, 1, 1,
1.122277, -0.651932, 1.938281, 1, 1, 1, 1, 1,
1.124735, 1.265747, 0.5870417, 1, 1, 1, 1, 1,
1.124819, -0.8245304, 2.065562, 1, 1, 1, 1, 1,
1.137557, -2.142656, 1.981446, 1, 1, 1, 1, 1,
1.139551, -0.9167578, 2.607208, 1, 1, 1, 1, 1,
1.155572, -0.3492532, 1.104971, 1, 1, 1, 1, 1,
1.155575, -1.203238, 5.336509, 1, 1, 1, 1, 1,
1.161644, 0.8005735, 0.5594606, 1, 1, 1, 1, 1,
1.16477, 0.3837844, 0.7195625, 1, 1, 1, 1, 1,
1.17519, -1.364815, 1.156148, 1, 1, 1, 1, 1,
1.175386, 1.70202, 0.09069164, 1, 1, 1, 1, 1,
1.181576, 0.2831164, 0.3009576, 1, 1, 1, 1, 1,
1.1871, -0.08961046, 0.936253, 1, 1, 1, 1, 1,
1.189733, -0.5695038, 1.104323, 1, 1, 1, 1, 1,
1.190767, 0.1049156, 1.859464, 1, 1, 1, 1, 1,
1.191074, 1.877472, -0.0883886, 0, 0, 1, 1, 1,
1.197164, -1.557329, 4.512734, 1, 0, 0, 1, 1,
1.212038, 0.1614196, 0.9377223, 1, 0, 0, 1, 1,
1.212673, -0.2898012, 3.149742, 1, 0, 0, 1, 1,
1.224465, 0.9118766, 0.5929452, 1, 0, 0, 1, 1,
1.231604, 0.5483132, 0.02487943, 1, 0, 0, 1, 1,
1.237296, 0.1040273, 2.846543, 0, 0, 0, 1, 1,
1.248115, 0.3267967, 2.417805, 0, 0, 0, 1, 1,
1.250237, 1.681831, 1.257931, 0, 0, 0, 1, 1,
1.262827, -0.1662905, 1.887887, 0, 0, 0, 1, 1,
1.263003, 1.750453, 0.116605, 0, 0, 0, 1, 1,
1.265036, -0.3786625, 0.7666895, 0, 0, 0, 1, 1,
1.265907, -1.232222, 4.015583, 0, 0, 0, 1, 1,
1.27619, -1.431948, 1.804587, 1, 1, 1, 1, 1,
1.276815, 0.1355237, 1.878571, 1, 1, 1, 1, 1,
1.283331, -2.290289, 1.147959, 1, 1, 1, 1, 1,
1.286475, -1.237357, 2.633598, 1, 1, 1, 1, 1,
1.287457, 0.4419018, 1.668295, 1, 1, 1, 1, 1,
1.291982, -0.2794529, 2.481658, 1, 1, 1, 1, 1,
1.304076, -0.3236775, 1.245798, 1, 1, 1, 1, 1,
1.308547, -0.5522278, 2.060892, 1, 1, 1, 1, 1,
1.322948, -1.155898, 3.571309, 1, 1, 1, 1, 1,
1.323847, 0.5270262, 1.553479, 1, 1, 1, 1, 1,
1.328779, 0.132839, 0.2119552, 1, 1, 1, 1, 1,
1.364341, 1.03569, 2.875196, 1, 1, 1, 1, 1,
1.371332, 0.141949, 1.309596, 1, 1, 1, 1, 1,
1.374342, -0.01968226, 1.804655, 1, 1, 1, 1, 1,
1.379294, 0.5068648, 1.17418, 1, 1, 1, 1, 1,
1.379519, -0.7328078, 1.920044, 0, 0, 1, 1, 1,
1.384451, 0.3387691, 2.083681, 1, 0, 0, 1, 1,
1.38665, -0.07555117, 1.163654, 1, 0, 0, 1, 1,
1.412849, -0.478769, 2.825063, 1, 0, 0, 1, 1,
1.420916, -1.095108, 1.464302, 1, 0, 0, 1, 1,
1.42288, -0.08499752, 1.2068, 1, 0, 0, 1, 1,
1.423527, -1.023342, 2.12935, 0, 0, 0, 1, 1,
1.432267, -0.4584183, 2.961994, 0, 0, 0, 1, 1,
1.438763, 1.279557, 0.5323079, 0, 0, 0, 1, 1,
1.445146, 0.6779544, 1.22982, 0, 0, 0, 1, 1,
1.44767, 0.2268955, 0.8979256, 0, 0, 0, 1, 1,
1.44861, -1.088527, 1.723331, 0, 0, 0, 1, 1,
1.48558, -0.7020245, 1.360367, 0, 0, 0, 1, 1,
1.494013, 0.9322407, 2.126796, 1, 1, 1, 1, 1,
1.496889, 0.3912581, 0.9399767, 1, 1, 1, 1, 1,
1.498409, 0.7054469, 1.400713, 1, 1, 1, 1, 1,
1.501588, -0.4036916, 0.7610142, 1, 1, 1, 1, 1,
1.516995, 1.229467, 0.5772285, 1, 1, 1, 1, 1,
1.534813, -1.746248, 2.718275, 1, 1, 1, 1, 1,
1.559126, -0.9538581, 2.527086, 1, 1, 1, 1, 1,
1.561697, -0.1116791, 2.209699, 1, 1, 1, 1, 1,
1.56546, 0.767301, 1.710387, 1, 1, 1, 1, 1,
1.59409, -1.372626, 1.555953, 1, 1, 1, 1, 1,
1.613564, 0.3122655, 1.419631, 1, 1, 1, 1, 1,
1.619264, 0.573175, 0.3216075, 1, 1, 1, 1, 1,
1.634591, 0.1768181, 1.54152, 1, 1, 1, 1, 1,
1.661141, 1.153098, 1.634006, 1, 1, 1, 1, 1,
1.669057, -1.374058, 2.087178, 1, 1, 1, 1, 1,
1.674718, -0.01371161, 2.727883, 0, 0, 1, 1, 1,
1.682827, 0.4708907, -0.1260816, 1, 0, 0, 1, 1,
1.710388, 1.751025, -0.6139365, 1, 0, 0, 1, 1,
1.715498, -0.3289438, 1.076474, 1, 0, 0, 1, 1,
1.71923, -1.027851, 0.9391412, 1, 0, 0, 1, 1,
1.721914, -0.2630647, 1.913942, 1, 0, 0, 1, 1,
1.727884, 1.063235, 1.255904, 0, 0, 0, 1, 1,
1.72894, 1.317471, -0.3831875, 0, 0, 0, 1, 1,
1.743738, -0.5542663, 2.162161, 0, 0, 0, 1, 1,
1.780003, 0.1770303, 0.6569792, 0, 0, 0, 1, 1,
1.800013, 0.2874044, -0.04564687, 0, 0, 0, 1, 1,
1.808187, -0.5078627, 1.930085, 0, 0, 0, 1, 1,
1.823853, 0.9747512, 0.9322729, 0, 0, 0, 1, 1,
1.832992, -0.04728322, 1.930877, 1, 1, 1, 1, 1,
1.893409, 0.03549002, 0.6620666, 1, 1, 1, 1, 1,
1.893618, 0.6242256, 1.644105, 1, 1, 1, 1, 1,
1.925063, 0.3512739, 1.337219, 1, 1, 1, 1, 1,
1.959714, 1.552954, 3.041774, 1, 1, 1, 1, 1,
1.97043, 1.570566, 0.8692781, 1, 1, 1, 1, 1,
1.978968, -0.4330249, 0.01823507, 1, 1, 1, 1, 1,
1.98224, -0.02594525, 1.687496, 1, 1, 1, 1, 1,
1.985849, -0.4202072, 1.503367, 1, 1, 1, 1, 1,
1.998322, 1.235813, 1.897716, 1, 1, 1, 1, 1,
2.03341, -1.050748, 1.311732, 1, 1, 1, 1, 1,
2.035685, 0.4748509, 1.359886, 1, 1, 1, 1, 1,
2.069994, 1.666408, 0.4946756, 1, 1, 1, 1, 1,
2.096717, 1.273129, 2.0014, 1, 1, 1, 1, 1,
2.099055, -0.9647447, 2.049293, 1, 1, 1, 1, 1,
2.099573, 0.1871655, 1.858559, 0, 0, 1, 1, 1,
2.125469, -0.7507951, 3.2756, 1, 0, 0, 1, 1,
2.139882, -0.1100389, 2.737602, 1, 0, 0, 1, 1,
2.148186, 0.5993355, 1.974339, 1, 0, 0, 1, 1,
2.185408, 0.519242, 1.85273, 1, 0, 0, 1, 1,
2.187926, 1.89829, -0.2854532, 1, 0, 0, 1, 1,
2.204486, -0.5381078, 0.9363177, 0, 0, 0, 1, 1,
2.259256, -1.007566, 1.474524, 0, 0, 0, 1, 1,
2.295979, -0.7510517, 1.114506, 0, 0, 0, 1, 1,
2.336287, 2.073735, 1.319096, 0, 0, 0, 1, 1,
2.346646, -0.3665437, 2.698689, 0, 0, 0, 1, 1,
2.365271, -0.6326263, 0.4707014, 0, 0, 0, 1, 1,
2.399929, 0.7263742, 2.112943, 0, 0, 0, 1, 1,
2.469074, -1.046696, 2.362609, 1, 1, 1, 1, 1,
2.560981, 1.914803, 0.4441667, 1, 1, 1, 1, 1,
2.585262, -0.1723841, 1.470691, 1, 1, 1, 1, 1,
2.811623, 1.796332, 0.645486, 1, 1, 1, 1, 1,
3.011142, 0.2645856, 1.785439, 1, 1, 1, 1, 1,
3.204962, 0.1740083, 2.538002, 1, 1, 1, 1, 1,
3.482336, -0.6976326, 1.874007, 1, 1, 1, 1, 1
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
var radius = 9.770058;
var distance = 34.31691;
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
mvMatrix.translate( -0.1986718, 0.02249908, -0.5334599 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.31691);
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