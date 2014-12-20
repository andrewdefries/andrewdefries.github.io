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
-3.05436, 0.2233971, -2.362079, 1, 0, 0, 1,
-2.858914, 0.7751418, -1.961997, 1, 0.007843138, 0, 1,
-2.856554, 0.5872694, -2.385055, 1, 0.01176471, 0, 1,
-2.850111, 1.79158, -0.8799524, 1, 0.01960784, 0, 1,
-2.739321, -0.3198101, -0.1317065, 1, 0.02352941, 0, 1,
-2.64973, 0.4557434, -1.392511, 1, 0.03137255, 0, 1,
-2.592966, 0.1038021, -3.631508, 1, 0.03529412, 0, 1,
-2.483504, 0.6249349, -1.74755, 1, 0.04313726, 0, 1,
-2.438247, 0.236695, -2.187958, 1, 0.04705882, 0, 1,
-2.319136, -1.252084, -1.976866, 1, 0.05490196, 0, 1,
-2.293128, -0.6951615, -2.772161, 1, 0.05882353, 0, 1,
-2.226011, -0.9367702, -1.088549, 1, 0.06666667, 0, 1,
-2.215518, 0.8486978, -2.35473, 1, 0.07058824, 0, 1,
-2.135573, 0.08220501, -2.336339, 1, 0.07843138, 0, 1,
-2.117575, 1.232808, 0.2309445, 1, 0.08235294, 0, 1,
-2.113702, -0.9056497, -0.2740362, 1, 0.09019608, 0, 1,
-2.103083, 1.091177, -1.418281, 1, 0.09411765, 0, 1,
-2.097846, 1.359489, -1.080614, 1, 0.1019608, 0, 1,
-2.083656, 0.9582868, -0.554547, 1, 0.1098039, 0, 1,
-2.068018, -1.196157, -2.314954, 1, 0.1137255, 0, 1,
-2.04559, -0.4241328, -2.214839, 1, 0.1215686, 0, 1,
-2.038003, -1.530394, -2.012471, 1, 0.1254902, 0, 1,
-1.991635, -0.1958751, -0.3432084, 1, 0.1333333, 0, 1,
-1.971722, 0.230762, 0.07465507, 1, 0.1372549, 0, 1,
-1.951561, 0.2075589, -2.137772, 1, 0.145098, 0, 1,
-1.93915, 1.328127, 0.02228586, 1, 0.1490196, 0, 1,
-1.922684, -0.6781594, -2.05442, 1, 0.1568628, 0, 1,
-1.891486, -2.023635, -2.111013, 1, 0.1607843, 0, 1,
-1.873794, -0.4387284, 0.6039883, 1, 0.1686275, 0, 1,
-1.851421, 0.7138382, -2.701716, 1, 0.172549, 0, 1,
-1.827734, -0.6571736, -0.5604493, 1, 0.1803922, 0, 1,
-1.825652, 1.431577, 0.9211473, 1, 0.1843137, 0, 1,
-1.794201, -0.126334, -0.9872873, 1, 0.1921569, 0, 1,
-1.784373, 1.852294, -1.539997, 1, 0.1960784, 0, 1,
-1.779588, 1.996614, 0.7736707, 1, 0.2039216, 0, 1,
-1.771799, 1.41748, 0.8453237, 1, 0.2117647, 0, 1,
-1.769931, 0.1628955, -0.00746845, 1, 0.2156863, 0, 1,
-1.75801, -2.175516, -1.58311, 1, 0.2235294, 0, 1,
-1.747405, -0.5402909, -1.796681, 1, 0.227451, 0, 1,
-1.743038, 1.333245, -0.7054967, 1, 0.2352941, 0, 1,
-1.741032, -0.8133314, -1.409008, 1, 0.2392157, 0, 1,
-1.725206, -0.4691224, -2.746853, 1, 0.2470588, 0, 1,
-1.688891, -0.2983875, -0.6250741, 1, 0.2509804, 0, 1,
-1.680678, 1.68244, -1.199649, 1, 0.2588235, 0, 1,
-1.675824, -0.154021, -2.050463, 1, 0.2627451, 0, 1,
-1.674253, -0.7468201, -0.7913191, 1, 0.2705882, 0, 1,
-1.626374, 0.1622685, -1.459054, 1, 0.2745098, 0, 1,
-1.604316, -0.05905286, -2.437194, 1, 0.282353, 0, 1,
-1.592867, -0.4130963, -2.472524, 1, 0.2862745, 0, 1,
-1.58564, -2.288997, -3.546981, 1, 0.2941177, 0, 1,
-1.555553, 0.03217476, -2.975279, 1, 0.3019608, 0, 1,
-1.548764, -2.004863, -0.5424428, 1, 0.3058824, 0, 1,
-1.543907, 0.5190007, -0.1031202, 1, 0.3137255, 0, 1,
-1.537813, -0.2945557, -3.071788, 1, 0.3176471, 0, 1,
-1.53445, 0.5181438, -1.968145, 1, 0.3254902, 0, 1,
-1.526796, -0.6681019, -2.16555, 1, 0.3294118, 0, 1,
-1.5197, 0.7372407, -1.70891, 1, 0.3372549, 0, 1,
-1.504319, 1.494086, -1.618374, 1, 0.3411765, 0, 1,
-1.493655, -1.264728, -1.938845, 1, 0.3490196, 0, 1,
-1.488461, -0.6085275, -2.972161, 1, 0.3529412, 0, 1,
-1.468864, 0.1866435, -0.3017426, 1, 0.3607843, 0, 1,
-1.455209, 0.8594851, -1.412782, 1, 0.3647059, 0, 1,
-1.44471, -1.00212, -1.545496, 1, 0.372549, 0, 1,
-1.434856, 0.6838169, -1.727355, 1, 0.3764706, 0, 1,
-1.432078, 1.920962, -0.9128568, 1, 0.3843137, 0, 1,
-1.422793, -0.2347508, -2.943077, 1, 0.3882353, 0, 1,
-1.422523, -1.502061, -1.415081, 1, 0.3960784, 0, 1,
-1.416494, -0.1741736, -0.3551251, 1, 0.4039216, 0, 1,
-1.416454, -0.2104468, -2.696697, 1, 0.4078431, 0, 1,
-1.41592, -1.537506, -3.286228, 1, 0.4156863, 0, 1,
-1.391528, 2.118645, -0.5520958, 1, 0.4196078, 0, 1,
-1.391497, -0.4802673, -2.941858, 1, 0.427451, 0, 1,
-1.385525, -0.6412738, -2.333887, 1, 0.4313726, 0, 1,
-1.384448, -0.3436368, -3.104073, 1, 0.4392157, 0, 1,
-1.376181, 1.027635, -0.833611, 1, 0.4431373, 0, 1,
-1.372126, 0.1813215, -2.035035, 1, 0.4509804, 0, 1,
-1.370838, -1.306292, -2.592903, 1, 0.454902, 0, 1,
-1.360345, -0.8437498, -1.460387, 1, 0.4627451, 0, 1,
-1.359863, -0.2687482, -2.153184, 1, 0.4666667, 0, 1,
-1.349965, 0.1620141, -2.064623, 1, 0.4745098, 0, 1,
-1.347405, -0.08748662, -0.9379974, 1, 0.4784314, 0, 1,
-1.345447, -0.0280553, -1.133512, 1, 0.4862745, 0, 1,
-1.345322, -1.200707, -1.832218, 1, 0.4901961, 0, 1,
-1.343189, 0.9252951, -0.979829, 1, 0.4980392, 0, 1,
-1.341709, -1.323566, -2.9124, 1, 0.5058824, 0, 1,
-1.341262, -0.5916828, -2.033418, 1, 0.509804, 0, 1,
-1.340933, -0.1949638, -1.524981, 1, 0.5176471, 0, 1,
-1.329558, 0.1540574, -1.799412, 1, 0.5215687, 0, 1,
-1.329469, 0.5090394, -2.420341, 1, 0.5294118, 0, 1,
-1.326042, 1.705071, 1.098707, 1, 0.5333334, 0, 1,
-1.313705, 0.2585637, -1.918557, 1, 0.5411765, 0, 1,
-1.304412, -1.949759, -2.524407, 1, 0.5450981, 0, 1,
-1.301635, -0.2546214, -3.459026, 1, 0.5529412, 0, 1,
-1.298551, -0.7484467, -2.508307, 1, 0.5568628, 0, 1,
-1.29533, 0.2155219, -2.726609, 1, 0.5647059, 0, 1,
-1.286601, 0.9851468, -1.472704, 1, 0.5686275, 0, 1,
-1.267657, 0.4636158, -1.970993, 1, 0.5764706, 0, 1,
-1.254061, 0.8536162, 1.003581, 1, 0.5803922, 0, 1,
-1.224105, 0.2871535, 0.1635646, 1, 0.5882353, 0, 1,
-1.221613, -1.589076, -1.209081, 1, 0.5921569, 0, 1,
-1.211596, -0.2485145, -2.105725, 1, 0.6, 0, 1,
-1.21138, -0.1260667, -0.7488506, 1, 0.6078432, 0, 1,
-1.211172, -0.2483203, -2.21122, 1, 0.6117647, 0, 1,
-1.208482, 0.3616952, -2.140963, 1, 0.6196079, 0, 1,
-1.203685, 3.129809, 0.3335944, 1, 0.6235294, 0, 1,
-1.195972, -0.7353498, -1.385524, 1, 0.6313726, 0, 1,
-1.193182, -0.1857114, 1.178293, 1, 0.6352941, 0, 1,
-1.192898, 0.4093731, -0.6836378, 1, 0.6431373, 0, 1,
-1.172855, 0.2111414, -0.4568676, 1, 0.6470588, 0, 1,
-1.172558, -0.3194221, -0.7286912, 1, 0.654902, 0, 1,
-1.153988, 0.8149554, -2.679992, 1, 0.6588235, 0, 1,
-1.144701, 0.7235516, -2.496212, 1, 0.6666667, 0, 1,
-1.144214, 0.971146, -0.7868147, 1, 0.6705883, 0, 1,
-1.142597, -0.3801219, -0.6756941, 1, 0.6784314, 0, 1,
-1.140267, -0.1618776, -3.35585, 1, 0.682353, 0, 1,
-1.13926, -0.7342309, -2.216636, 1, 0.6901961, 0, 1,
-1.138335, -0.5519336, -1.823455, 1, 0.6941177, 0, 1,
-1.137769, 1.000263, -1.394227, 1, 0.7019608, 0, 1,
-1.133146, -1.00257, -3.219925, 1, 0.7098039, 0, 1,
-1.133005, 0.5709963, -1.471727, 1, 0.7137255, 0, 1,
-1.124442, -0.07766316, -2.350986, 1, 0.7215686, 0, 1,
-1.115912, -0.1042982, -1.675689, 1, 0.7254902, 0, 1,
-1.107239, 0.02800984, -1.614995, 1, 0.7333333, 0, 1,
-1.106246, -0.4537971, -2.467396, 1, 0.7372549, 0, 1,
-1.096293, 1.46069, -0.07001425, 1, 0.7450981, 0, 1,
-1.094355, 0.4493037, -1.445539, 1, 0.7490196, 0, 1,
-1.09172, 0.6025334, -0.7316937, 1, 0.7568628, 0, 1,
-1.08445, 1.826047, 0.6880513, 1, 0.7607843, 0, 1,
-1.082991, -0.6871571, -1.092703, 1, 0.7686275, 0, 1,
-1.080619, -0.5827606, -2.347909, 1, 0.772549, 0, 1,
-1.07688, 0.6319919, -2.754988, 1, 0.7803922, 0, 1,
-1.074843, 0.2078082, 0.5891926, 1, 0.7843137, 0, 1,
-1.072999, -0.6327108, -1.412158, 1, 0.7921569, 0, 1,
-1.070119, -0.6619481, -2.180642, 1, 0.7960784, 0, 1,
-1.067448, 0.2260964, -0.1647414, 1, 0.8039216, 0, 1,
-1.066387, 0.6926482, -0.3034023, 1, 0.8117647, 0, 1,
-1.06403, -1.455366, -2.395267, 1, 0.8156863, 0, 1,
-1.058748, 1.363112, -0.380527, 1, 0.8235294, 0, 1,
-1.052439, 0.4271288, -0.7597483, 1, 0.827451, 0, 1,
-1.049945, -1.239203, -3.695777, 1, 0.8352941, 0, 1,
-1.041403, -0.4133843, -1.504834, 1, 0.8392157, 0, 1,
-1.040903, 0.3942119, -1.626066, 1, 0.8470588, 0, 1,
-1.039853, 0.911193, -0.7075878, 1, 0.8509804, 0, 1,
-1.036176, -1.041464, -2.099266, 1, 0.8588235, 0, 1,
-1.033404, -0.1160352, -2.169465, 1, 0.8627451, 0, 1,
-1.03219, -0.901223, -2.927162, 1, 0.8705882, 0, 1,
-1.028402, -0.5322696, -2.602808, 1, 0.8745098, 0, 1,
-1.027375, 0.9669613, -2.571188, 1, 0.8823529, 0, 1,
-1.027304, -1.589072, -4.113723, 1, 0.8862745, 0, 1,
-1.025952, -1.081443, -2.191049, 1, 0.8941177, 0, 1,
-1.023728, 1.066632, -1.809457, 1, 0.8980392, 0, 1,
-1.019595, 0.003658086, -2.140047, 1, 0.9058824, 0, 1,
-1.012979, 0.4988607, -0.08334773, 1, 0.9137255, 0, 1,
-1.006052, 0.6911045, -0.8132759, 1, 0.9176471, 0, 1,
-1.002044, 0.04092843, -2.489818, 1, 0.9254902, 0, 1,
-1.000197, 0.8962945, -0.3682962, 1, 0.9294118, 0, 1,
-0.9973652, -0.7003196, -3.041469, 1, 0.9372549, 0, 1,
-0.9826788, 0.9458122, -0.6696824, 1, 0.9411765, 0, 1,
-0.9814144, 1.057526, -0.7772257, 1, 0.9490196, 0, 1,
-0.9762759, 0.294343, -0.7083439, 1, 0.9529412, 0, 1,
-0.9751144, 0.7500622, -1.390824, 1, 0.9607843, 0, 1,
-0.9663392, -1.832175, -1.953972, 1, 0.9647059, 0, 1,
-0.9615881, 2.056228, -0.1312243, 1, 0.972549, 0, 1,
-0.9525058, 0.09871298, -1.132993, 1, 0.9764706, 0, 1,
-0.9481928, -1.870178, -1.051746, 1, 0.9843137, 0, 1,
-0.945751, 0.2553745, 1.8999, 1, 0.9882353, 0, 1,
-0.9443883, -0.926594, -1.780399, 1, 0.9960784, 0, 1,
-0.9438521, -0.8759754, -3.204351, 0.9960784, 1, 0, 1,
-0.9420705, 0.1464474, -1.572248, 0.9921569, 1, 0, 1,
-0.9381899, -1.209184, -4.205235, 0.9843137, 1, 0, 1,
-0.9362418, 1.053542, -2.176328, 0.9803922, 1, 0, 1,
-0.9357455, -1.123424, -4.400627, 0.972549, 1, 0, 1,
-0.9331684, 0.5669632, 0.208911, 0.9686275, 1, 0, 1,
-0.9314606, 2.350228, 1.152308, 0.9607843, 1, 0, 1,
-0.9244904, -0.9152521, -2.445474, 0.9568627, 1, 0, 1,
-0.9234955, 1.499782, -0.246312, 0.9490196, 1, 0, 1,
-0.9216916, 0.5410299, -0.9190837, 0.945098, 1, 0, 1,
-0.9210454, -0.006360454, -0.8932772, 0.9372549, 1, 0, 1,
-0.8985958, -1.944868, -3.089201, 0.9333333, 1, 0, 1,
-0.8961769, 1.105278, -2.327375, 0.9254902, 1, 0, 1,
-0.8912407, 1.223089, -1.69022, 0.9215686, 1, 0, 1,
-0.8907607, -0.5995051, -3.19266, 0.9137255, 1, 0, 1,
-0.8806227, 1.19225, -0.9799674, 0.9098039, 1, 0, 1,
-0.8799084, -2.0198, -3.094895, 0.9019608, 1, 0, 1,
-0.8752763, -2.512144, -2.932723, 0.8941177, 1, 0, 1,
-0.8741977, 0.267749, -0.1963532, 0.8901961, 1, 0, 1,
-0.8648278, -0.1068015, -1.597047, 0.8823529, 1, 0, 1,
-0.8646724, 0.01822395, -2.77066, 0.8784314, 1, 0, 1,
-0.8629528, -0.7951682, -2.782904, 0.8705882, 1, 0, 1,
-0.8625884, 0.3066931, -1.822135, 0.8666667, 1, 0, 1,
-0.8612412, -0.7129725, -2.408398, 0.8588235, 1, 0, 1,
-0.8602314, -0.6660985, -3.354746, 0.854902, 1, 0, 1,
-0.8572729, 0.6271943, -0.01061738, 0.8470588, 1, 0, 1,
-0.8532124, 0.02070255, -2.384515, 0.8431373, 1, 0, 1,
-0.847278, 0.6607032, -1.861759, 0.8352941, 1, 0, 1,
-0.8465272, 0.2937345, 0.3565535, 0.8313726, 1, 0, 1,
-0.844769, 0.2394146, -1.466104, 0.8235294, 1, 0, 1,
-0.8391835, 0.8930711, -1.619261, 0.8196079, 1, 0, 1,
-0.8371133, -1.260789, -2.760817, 0.8117647, 1, 0, 1,
-0.8363768, -0.3225428, -1.12836, 0.8078431, 1, 0, 1,
-0.8346144, -0.09296849, -1.383108, 0.8, 1, 0, 1,
-0.8213935, -0.6394845, -1.876577, 0.7921569, 1, 0, 1,
-0.8210965, 0.8067157, -2.287626, 0.7882353, 1, 0, 1,
-0.8183696, -0.6735653, -3.534944, 0.7803922, 1, 0, 1,
-0.8180765, 0.6167017, -0.578179, 0.7764706, 1, 0, 1,
-0.8111098, -1.015478, -1.910435, 0.7686275, 1, 0, 1,
-0.806365, 0.7273099, -1.116163, 0.7647059, 1, 0, 1,
-0.8043319, 0.2531522, -2.485868, 0.7568628, 1, 0, 1,
-0.8024123, -0.9365224, -2.169145, 0.7529412, 1, 0, 1,
-0.7997405, -1.092662, 0.05249018, 0.7450981, 1, 0, 1,
-0.7915704, -1.281053, -2.270402, 0.7411765, 1, 0, 1,
-0.7889457, -1.215736, -3.491058, 0.7333333, 1, 0, 1,
-0.782598, 1.819191, -2.50035, 0.7294118, 1, 0, 1,
-0.7824059, 0.1724552, -1.924092, 0.7215686, 1, 0, 1,
-0.7708058, -0.7879687, -2.578783, 0.7176471, 1, 0, 1,
-0.769961, 0.1065949, -1.053929, 0.7098039, 1, 0, 1,
-0.7651516, -1.672597, -2.04722, 0.7058824, 1, 0, 1,
-0.7627217, 0.3019914, -1.613348, 0.6980392, 1, 0, 1,
-0.7618985, 0.4490379, -0.3026417, 0.6901961, 1, 0, 1,
-0.7553551, 1.171398, -0.8127766, 0.6862745, 1, 0, 1,
-0.7496696, 0.4144439, -1.444297, 0.6784314, 1, 0, 1,
-0.749593, -0.4600735, -1.131587, 0.6745098, 1, 0, 1,
-0.7463559, 1.13298, 0.2569753, 0.6666667, 1, 0, 1,
-0.7392309, 1.302342, 1.246221, 0.6627451, 1, 0, 1,
-0.738425, 0.2683724, -2.695544, 0.654902, 1, 0, 1,
-0.7342926, 0.04455154, -2.530555, 0.6509804, 1, 0, 1,
-0.7320712, -0.4260535, -0.6696422, 0.6431373, 1, 0, 1,
-0.72064, 0.02430869, -1.437067, 0.6392157, 1, 0, 1,
-0.7171633, 0.5009863, -0.3795187, 0.6313726, 1, 0, 1,
-0.715735, -1.055949, -2.548265, 0.627451, 1, 0, 1,
-0.7126608, -0.2744393, -0.453007, 0.6196079, 1, 0, 1,
-0.70218, -1.064258, -3.722589, 0.6156863, 1, 0, 1,
-0.7020994, -0.2731891, -2.819049, 0.6078432, 1, 0, 1,
-0.7011917, -1.452638, -4.15696, 0.6039216, 1, 0, 1,
-0.6913373, 0.2094982, -1.194268, 0.5960785, 1, 0, 1,
-0.6876391, 0.282102, -1.481078, 0.5882353, 1, 0, 1,
-0.6864183, 0.9766566, -1.994532, 0.5843138, 1, 0, 1,
-0.6859782, 0.5115838, 0.06093759, 0.5764706, 1, 0, 1,
-0.68064, 0.8185906, -1.476058, 0.572549, 1, 0, 1,
-0.6793653, -1.479782, -3.613563, 0.5647059, 1, 0, 1,
-0.6763105, 0.8692012, 0.4507118, 0.5607843, 1, 0, 1,
-0.6759114, 0.5858639, -1.860019, 0.5529412, 1, 0, 1,
-0.674362, 1.895591, -0.199588, 0.5490196, 1, 0, 1,
-0.6713923, 0.9333496, 0.9313173, 0.5411765, 1, 0, 1,
-0.6686502, -1.300959, -4.443997, 0.5372549, 1, 0, 1,
-0.6667355, 0.02027989, -2.719948, 0.5294118, 1, 0, 1,
-0.6657336, -1.762995, -3.843617, 0.5254902, 1, 0, 1,
-0.6618859, 0.970551, -1.537066, 0.5176471, 1, 0, 1,
-0.6596994, -0.664191, -1.323887, 0.5137255, 1, 0, 1,
-0.6593145, -1.162677, -2.624628, 0.5058824, 1, 0, 1,
-0.6575267, -0.2840226, -0.6390588, 0.5019608, 1, 0, 1,
-0.6514699, 1.084759, -0.04695033, 0.4941176, 1, 0, 1,
-0.647974, 0.4067755, -1.940973, 0.4862745, 1, 0, 1,
-0.6436713, 0.1491878, -1.799306, 0.4823529, 1, 0, 1,
-0.6407354, -1.038064, -2.046794, 0.4745098, 1, 0, 1,
-0.6397601, 1.273759, 0.326191, 0.4705882, 1, 0, 1,
-0.638749, 1.633321, 0.008664111, 0.4627451, 1, 0, 1,
-0.6327362, 0.4483318, -0.7971425, 0.4588235, 1, 0, 1,
-0.632479, -1.767258, -3.475618, 0.4509804, 1, 0, 1,
-0.6302497, 1.347172, -0.0144943, 0.4470588, 1, 0, 1,
-0.6286803, -1.141203, -0.9496278, 0.4392157, 1, 0, 1,
-0.6281747, 0.3975995, -0.001688401, 0.4352941, 1, 0, 1,
-0.6256516, -0.294983, -1.935569, 0.427451, 1, 0, 1,
-0.6238101, -0.8986878, -2.356693, 0.4235294, 1, 0, 1,
-0.6237199, -0.06459057, -1.760708, 0.4156863, 1, 0, 1,
-0.6198661, 0.2801197, -0.7697917, 0.4117647, 1, 0, 1,
-0.6160167, -0.6896547, -1.795639, 0.4039216, 1, 0, 1,
-0.6123739, -3.127525, -3.096347, 0.3960784, 1, 0, 1,
-0.6121364, 0.5186999, 1.03829, 0.3921569, 1, 0, 1,
-0.6075829, -1.146413, -3.214437, 0.3843137, 1, 0, 1,
-0.604486, -1.945015, -2.958701, 0.3803922, 1, 0, 1,
-0.5972663, 1.35811, -0.1152244, 0.372549, 1, 0, 1,
-0.5930076, -0.1195553, -2.816833, 0.3686275, 1, 0, 1,
-0.5901577, -2.896167, -0.4566197, 0.3607843, 1, 0, 1,
-0.5889748, -0.5733467, -2.32959, 0.3568628, 1, 0, 1,
-0.5880619, -1.298977, -1.970105, 0.3490196, 1, 0, 1,
-0.5847415, -0.3905932, -2.529749, 0.345098, 1, 0, 1,
-0.582541, -0.2678558, -3.971451, 0.3372549, 1, 0, 1,
-0.571695, -0.4476906, -2.615304, 0.3333333, 1, 0, 1,
-0.5681943, -0.4491806, 0.9277176, 0.3254902, 1, 0, 1,
-0.5637627, -0.373334, -1.268203, 0.3215686, 1, 0, 1,
-0.5619435, -0.1778657, -0.803097, 0.3137255, 1, 0, 1,
-0.5601391, -1.078502, -0.663276, 0.3098039, 1, 0, 1,
-0.5486094, 0.07572287, -1.127745, 0.3019608, 1, 0, 1,
-0.5469046, 2.519883, 2.103643, 0.2941177, 1, 0, 1,
-0.5422116, -0.6129142, -3.11125, 0.2901961, 1, 0, 1,
-0.5284915, 0.7593864, -2.791625, 0.282353, 1, 0, 1,
-0.5191771, 0.8745769, 0.1539855, 0.2784314, 1, 0, 1,
-0.5191297, 0.5545219, -3.462546, 0.2705882, 1, 0, 1,
-0.5189211, 0.4060466, 0.5188273, 0.2666667, 1, 0, 1,
-0.5140687, 0.2430775, -1.027789, 0.2588235, 1, 0, 1,
-0.5125664, -0.7854895, -2.133655, 0.254902, 1, 0, 1,
-0.5120224, 0.4084946, -0.1403901, 0.2470588, 1, 0, 1,
-0.5109323, 0.1030037, -1.314724, 0.2431373, 1, 0, 1,
-0.5051385, 0.3327017, -0.8536158, 0.2352941, 1, 0, 1,
-0.5012559, 1.156585, -0.04188677, 0.2313726, 1, 0, 1,
-0.4961904, 1.962961, 1.444436, 0.2235294, 1, 0, 1,
-0.4948206, 1.600968, 1.838099, 0.2196078, 1, 0, 1,
-0.4920296, 1.7447, 0.5354322, 0.2117647, 1, 0, 1,
-0.490853, -0.2303737, -0.8659849, 0.2078431, 1, 0, 1,
-0.4883566, 0.6258046, -0.2844636, 0.2, 1, 0, 1,
-0.4868926, -1.258796, -0.7285986, 0.1921569, 1, 0, 1,
-0.4852379, -1.458531, -2.735036, 0.1882353, 1, 0, 1,
-0.4816107, -0.3793221, -3.229616, 0.1803922, 1, 0, 1,
-0.4786364, -0.7950506, -2.745939, 0.1764706, 1, 0, 1,
-0.4778259, 1.793985, 0.005814714, 0.1686275, 1, 0, 1,
-0.4763856, 0.2280467, -0.8253501, 0.1647059, 1, 0, 1,
-0.474275, 0.5570387, -0.5906356, 0.1568628, 1, 0, 1,
-0.4734787, -1.922226, -2.886548, 0.1529412, 1, 0, 1,
-0.4639184, 1.200424, -1.239481, 0.145098, 1, 0, 1,
-0.4604063, -1.406612, -3.434026, 0.1411765, 1, 0, 1,
-0.451649, -0.7402924, -1.717992, 0.1333333, 1, 0, 1,
-0.4471295, -0.7555878, -3.332988, 0.1294118, 1, 0, 1,
-0.4354017, -1.237088, -3.345809, 0.1215686, 1, 0, 1,
-0.4345925, 0.7173176, 0.304911, 0.1176471, 1, 0, 1,
-0.4336392, 0.6855936, -0.6806323, 0.1098039, 1, 0, 1,
-0.4327275, 0.2399039, -0.152336, 0.1058824, 1, 0, 1,
-0.431574, 0.09491947, -2.114902, 0.09803922, 1, 0, 1,
-0.430786, -0.006513, -3.898677, 0.09019608, 1, 0, 1,
-0.4300801, -2.086986, -1.523842, 0.08627451, 1, 0, 1,
-0.4274333, 0.4503405, 0.147481, 0.07843138, 1, 0, 1,
-0.4266794, -0.9572905, -4.092819, 0.07450981, 1, 0, 1,
-0.4262126, 0.6743959, -2.225932, 0.06666667, 1, 0, 1,
-0.4214147, -0.1717393, -1.686996, 0.0627451, 1, 0, 1,
-0.4212055, -0.2767956, -2.746475, 0.05490196, 1, 0, 1,
-0.4178807, -2.405362, -3.095939, 0.05098039, 1, 0, 1,
-0.4119391, 1.5739, 1.078018, 0.04313726, 1, 0, 1,
-0.4065203, -0.4787062, -1.38649, 0.03921569, 1, 0, 1,
-0.4051943, 0.5095323, 1.076994, 0.03137255, 1, 0, 1,
-0.4046862, -0.2311871, -2.048373, 0.02745098, 1, 0, 1,
-0.4036537, 0.04645169, -0.8410498, 0.01960784, 1, 0, 1,
-0.4000359, -0.4829327, -2.873975, 0.01568628, 1, 0, 1,
-0.3912002, 0.6669149, -1.042693, 0.007843138, 1, 0, 1,
-0.387194, 1.698449, -0.2867664, 0.003921569, 1, 0, 1,
-0.3819733, 1.19409, -0.8789436, 0, 1, 0.003921569, 1,
-0.379948, -0.2346652, -3.606534, 0, 1, 0.01176471, 1,
-0.3794408, 0.825965, -1.470283, 0, 1, 0.01568628, 1,
-0.3783175, -0.2060221, -2.234844, 0, 1, 0.02352941, 1,
-0.3781137, 1.409353, -1.610837, 0, 1, 0.02745098, 1,
-0.3762501, -0.1409066, -0.3593257, 0, 1, 0.03529412, 1,
-0.3673734, -0.3999221, -3.838148, 0, 1, 0.03921569, 1,
-0.366859, 2.562844, -0.3008457, 0, 1, 0.04705882, 1,
-0.3667309, 0.1386858, -1.741321, 0, 1, 0.05098039, 1,
-0.3653422, -1.292585, -2.620893, 0, 1, 0.05882353, 1,
-0.3648461, 0.7291735, -0.4088624, 0, 1, 0.0627451, 1,
-0.3627626, 0.7642436, 0.6631593, 0, 1, 0.07058824, 1,
-0.361681, 0.6849162, 0.7318357, 0, 1, 0.07450981, 1,
-0.3605022, -0.4925035, -3.501961, 0, 1, 0.08235294, 1,
-0.3604535, -0.9216872, -2.116443, 0, 1, 0.08627451, 1,
-0.3588307, -0.6151409, -3.664462, 0, 1, 0.09411765, 1,
-0.3578131, 1.308288, -1.602924, 0, 1, 0.1019608, 1,
-0.3565287, 0.1351683, -1.830858, 0, 1, 0.1058824, 1,
-0.3565242, -0.5474141, -3.619356, 0, 1, 0.1137255, 1,
-0.3560529, -0.1899906, -2.344514, 0, 1, 0.1176471, 1,
-0.3434044, -1.397451, -2.321379, 0, 1, 0.1254902, 1,
-0.343349, -0.01517125, -1.806436, 0, 1, 0.1294118, 1,
-0.3389822, -1.381405, -1.636124, 0, 1, 0.1372549, 1,
-0.3361943, 1.585587, -1.119797, 0, 1, 0.1411765, 1,
-0.3312284, -0.8084595, -2.354243, 0, 1, 0.1490196, 1,
-0.3306637, -0.07894729, -3.203722, 0, 1, 0.1529412, 1,
-0.3290125, 0.9674565, -1.140337, 0, 1, 0.1607843, 1,
-0.3281831, -1.145008, -2.820372, 0, 1, 0.1647059, 1,
-0.3273202, -0.4614568, -3.022571, 0, 1, 0.172549, 1,
-0.3254935, 0.183904, -0.2977575, 0, 1, 0.1764706, 1,
-0.3190952, -0.5702221, -3.713896, 0, 1, 0.1843137, 1,
-0.3153037, -0.3367964, -0.01320969, 0, 1, 0.1882353, 1,
-0.31253, -0.2339659, -3.111837, 0, 1, 0.1960784, 1,
-0.304726, -1.005851, -2.293885, 0, 1, 0.2039216, 1,
-0.302674, -0.5409393, -1.535861, 0, 1, 0.2078431, 1,
-0.297365, 0.336795, -0.3036588, 0, 1, 0.2156863, 1,
-0.2952231, -0.3203963, -2.3855, 0, 1, 0.2196078, 1,
-0.2947089, 0.3552668, 0.7362786, 0, 1, 0.227451, 1,
-0.2939888, 0.0873664, -1.629603, 0, 1, 0.2313726, 1,
-0.2931129, -1.923163, -0.9455189, 0, 1, 0.2392157, 1,
-0.289732, -0.6540753, -3.271066, 0, 1, 0.2431373, 1,
-0.2894403, 1.100966, 1.103484, 0, 1, 0.2509804, 1,
-0.2867519, -0.548141, -5.18518, 0, 1, 0.254902, 1,
-0.2843213, 0.9523172, -0.3075883, 0, 1, 0.2627451, 1,
-0.2763275, 0.4172794, -0.5868384, 0, 1, 0.2666667, 1,
-0.2747525, 1.8741, 0.5186625, 0, 1, 0.2745098, 1,
-0.2700468, -1.367652, -2.879112, 0, 1, 0.2784314, 1,
-0.2677731, -0.3991436, -3.366474, 0, 1, 0.2862745, 1,
-0.261543, -0.559595, -1.980793, 0, 1, 0.2901961, 1,
-0.2611207, 1.074338, -1.175305, 0, 1, 0.2980392, 1,
-0.257194, -0.1126713, -2.164587, 0, 1, 0.3058824, 1,
-0.2556097, -0.1722845, -1.190777, 0, 1, 0.3098039, 1,
-0.2487986, 0.6856676, -0.6507884, 0, 1, 0.3176471, 1,
-0.2473653, -0.7755185, -2.672066, 0, 1, 0.3215686, 1,
-0.2437988, -0.3954561, -3.405259, 0, 1, 0.3294118, 1,
-0.2390039, -0.3169274, -2.250088, 0, 1, 0.3333333, 1,
-0.2379252, 1.237194, 0.3398762, 0, 1, 0.3411765, 1,
-0.2311392, -0.5697215, -3.821056, 0, 1, 0.345098, 1,
-0.228938, 1.092166, 0.5583755, 0, 1, 0.3529412, 1,
-0.2289344, 0.7610281, -1.918858, 0, 1, 0.3568628, 1,
-0.2257083, -1.215897, -2.798335, 0, 1, 0.3647059, 1,
-0.2232865, -0.4203833, -1.660485, 0, 1, 0.3686275, 1,
-0.2227692, 0.0533223, -0.1568891, 0, 1, 0.3764706, 1,
-0.2188766, -1.167292, -4.850717, 0, 1, 0.3803922, 1,
-0.2160054, -1.146386, -2.952919, 0, 1, 0.3882353, 1,
-0.2145773, 0.7798397, 0.3180784, 0, 1, 0.3921569, 1,
-0.2099605, -1.014467, -0.05338279, 0, 1, 0.4, 1,
-0.2091812, 0.4028654, -0.8031879, 0, 1, 0.4078431, 1,
-0.2077727, 0.7129785, -0.6765223, 0, 1, 0.4117647, 1,
-0.2014296, -0.9974045, -1.715573, 0, 1, 0.4196078, 1,
-0.1987197, -0.08231737, -3.024586, 0, 1, 0.4235294, 1,
-0.1986088, -0.9151306, -1.795913, 0, 1, 0.4313726, 1,
-0.1979653, 0.8900819, -0.01005148, 0, 1, 0.4352941, 1,
-0.1977953, 0.2879956, -1.753753, 0, 1, 0.4431373, 1,
-0.1962349, -1.164529, -2.193734, 0, 1, 0.4470588, 1,
-0.1921503, 1.285842, 0.05117798, 0, 1, 0.454902, 1,
-0.1912758, -0.1261849, -2.688855, 0, 1, 0.4588235, 1,
-0.1883382, -1.024024, -2.031765, 0, 1, 0.4666667, 1,
-0.1880801, -1.52654, -3.183928, 0, 1, 0.4705882, 1,
-0.1808255, 1.956255, 0.2969019, 0, 1, 0.4784314, 1,
-0.179611, 1.397368, 0.2592789, 0, 1, 0.4823529, 1,
-0.1791404, -0.4204857, -2.658073, 0, 1, 0.4901961, 1,
-0.1680902, 0.2563199, -0.07999996, 0, 1, 0.4941176, 1,
-0.1625192, -0.07108971, -1.611635, 0, 1, 0.5019608, 1,
-0.1578213, -0.1710082, -4.819308, 0, 1, 0.509804, 1,
-0.1575253, -0.6846231, -4.491935, 0, 1, 0.5137255, 1,
-0.1527074, -1.254891, -2.78066, 0, 1, 0.5215687, 1,
-0.1520088, -0.5105878, -1.445606, 0, 1, 0.5254902, 1,
-0.1498486, 0.3780006, -0.8148181, 0, 1, 0.5333334, 1,
-0.1498082, -0.8728096, -4.203542, 0, 1, 0.5372549, 1,
-0.1495311, -0.72945, -4.408601, 0, 1, 0.5450981, 1,
-0.1483664, -0.5074782, -2.982949, 0, 1, 0.5490196, 1,
-0.1457404, -0.6979618, -4.318838, 0, 1, 0.5568628, 1,
-0.1455852, 1.178625, -0.08832464, 0, 1, 0.5607843, 1,
-0.1417738, -0.4849255, -1.357126, 0, 1, 0.5686275, 1,
-0.1354119, 0.7909295, -0.3946579, 0, 1, 0.572549, 1,
-0.1349251, -0.4062595, -4.200772, 0, 1, 0.5803922, 1,
-0.1317623, 0.05643267, -0.7964835, 0, 1, 0.5843138, 1,
-0.1259884, 0.962128, -0.1981947, 0, 1, 0.5921569, 1,
-0.1253855, 1.620746, -0.2277739, 0, 1, 0.5960785, 1,
-0.1246417, -0.2507848, -4.354073, 0, 1, 0.6039216, 1,
-0.1237058, -0.4302239, -1.66476, 0, 1, 0.6117647, 1,
-0.1219685, -1.281106, -3.317832, 0, 1, 0.6156863, 1,
-0.1210088, -2.861869, -3.31366, 0, 1, 0.6235294, 1,
-0.1200651, 0.3581161, -0.170573, 0, 1, 0.627451, 1,
-0.1102549, -1.193951, -3.337002, 0, 1, 0.6352941, 1,
-0.1099936, -0.7404262, -2.326707, 0, 1, 0.6392157, 1,
-0.1097979, -1.41629, -2.428314, 0, 1, 0.6470588, 1,
-0.1044066, -1.643611, -2.558867, 0, 1, 0.6509804, 1,
-0.1018908, 0.9483272, -0.5918, 0, 1, 0.6588235, 1,
-0.1007973, 0.486797, -0.4199737, 0, 1, 0.6627451, 1,
-0.1000884, 0.5573158, -1.221279, 0, 1, 0.6705883, 1,
-0.09915468, -0.636498, -2.381855, 0, 1, 0.6745098, 1,
-0.09553458, 2.036874, 0.9866389, 0, 1, 0.682353, 1,
-0.09297588, 1.056048, -0.5718107, 0, 1, 0.6862745, 1,
-0.09287658, -0.8087982, -3.008347, 0, 1, 0.6941177, 1,
-0.092833, 1.095645, 2.118902, 0, 1, 0.7019608, 1,
-0.09227902, 1.374339, 2.701572, 0, 1, 0.7058824, 1,
-0.0868829, 1.023664, -0.5576908, 0, 1, 0.7137255, 1,
-0.07502545, -1.237138, -1.506578, 0, 1, 0.7176471, 1,
-0.0748692, -2.761444, -2.179762, 0, 1, 0.7254902, 1,
-0.07439435, -1.810029, -1.983657, 0, 1, 0.7294118, 1,
-0.06857539, 0.2238132, 1.015577, 0, 1, 0.7372549, 1,
-0.06825406, -0.5105507, -5.117059, 0, 1, 0.7411765, 1,
-0.06604394, -0.3438362, -3.373971, 0, 1, 0.7490196, 1,
-0.06541618, 0.1882207, -0.4298078, 0, 1, 0.7529412, 1,
-0.06108285, 1.390761, 0.9333417, 0, 1, 0.7607843, 1,
-0.06043031, 1.614286, 0.1136384, 0, 1, 0.7647059, 1,
-0.05575189, 1.066348, 0.7082673, 0, 1, 0.772549, 1,
-0.05280021, 0.1065416, -1.221563, 0, 1, 0.7764706, 1,
-0.04891941, 0.2428279, -0.715979, 0, 1, 0.7843137, 1,
-0.04603943, -1.976766, -1.429989, 0, 1, 0.7882353, 1,
-0.04226085, -1.45491, -2.823302, 0, 1, 0.7960784, 1,
-0.03854437, 1.464812, -0.1625535, 0, 1, 0.8039216, 1,
-0.03481166, -1.139592, -5.087475, 0, 1, 0.8078431, 1,
-0.03437539, -0.7153883, -3.094034, 0, 1, 0.8156863, 1,
-0.03229014, -2.206627, -4.024846, 0, 1, 0.8196079, 1,
-0.03213933, -0.4102758, -3.160655, 0, 1, 0.827451, 1,
-0.02831266, 1.123904, -1.133308, 0, 1, 0.8313726, 1,
-0.02223823, -1.272723, -4.334604, 0, 1, 0.8392157, 1,
-0.020592, 1.310357, -0.4610353, 0, 1, 0.8431373, 1,
-0.02012517, -0.2572292, -3.932256, 0, 1, 0.8509804, 1,
-0.01968163, -0.4094171, -2.425001, 0, 1, 0.854902, 1,
-0.01406026, -0.7927896, -3.565953, 0, 1, 0.8627451, 1,
-0.007847939, 2.605484, -1.067369, 0, 1, 0.8666667, 1,
-0.004961052, -0.1277695, -2.29492, 0, 1, 0.8745098, 1,
-0.001320928, -1.045246, -4.853348, 0, 1, 0.8784314, 1,
-0.0006325373, 1.557222, 0.3206368, 0, 1, 0.8862745, 1,
-0.0003773671, -0.4389786, -1.047031, 0, 1, 0.8901961, 1,
0.0004314079, -0.5781341, 1.859864, 0, 1, 0.8980392, 1,
0.003864524, 1.769609, -0.3470266, 0, 1, 0.9058824, 1,
0.004460865, 0.2832167, -0.4357464, 0, 1, 0.9098039, 1,
0.01156407, -0.9816849, 3.312626, 0, 1, 0.9176471, 1,
0.01409635, -0.6371788, 3.519512, 0, 1, 0.9215686, 1,
0.01647462, -0.348951, 2.475569, 0, 1, 0.9294118, 1,
0.02053221, 1.872408, -0.9206832, 0, 1, 0.9333333, 1,
0.02194441, -0.6816365, 3.745584, 0, 1, 0.9411765, 1,
0.02414422, -0.1570532, 4.008722, 0, 1, 0.945098, 1,
0.02886588, 1.322952, -0.02269699, 0, 1, 0.9529412, 1,
0.0310072, 0.1882056, -0.3099433, 0, 1, 0.9568627, 1,
0.04232825, -1.150812, 4.020379, 0, 1, 0.9647059, 1,
0.04619909, 1.865823, -0.83176, 0, 1, 0.9686275, 1,
0.04650896, -0.9842092, 3.625709, 0, 1, 0.9764706, 1,
0.04717158, 0.4010279, -0.6837748, 0, 1, 0.9803922, 1,
0.05011672, 0.07466344, 0.3579659, 0, 1, 0.9882353, 1,
0.05049467, 1.242798, 0.5639068, 0, 1, 0.9921569, 1,
0.05087543, 1.128975, 0.1328847, 0, 1, 1, 1,
0.05161061, 0.9182355, 0.1369163, 0, 0.9921569, 1, 1,
0.05728738, -0.8272141, 2.139207, 0, 0.9882353, 1, 1,
0.05814797, 0.8418459, 2.082074, 0, 0.9803922, 1, 1,
0.05834375, -1.976878, 1.557017, 0, 0.9764706, 1, 1,
0.0604311, 0.2151142, 0.02371503, 0, 0.9686275, 1, 1,
0.06093989, -1.29542, 2.197427, 0, 0.9647059, 1, 1,
0.06228559, -1.129259, 4.176025, 0, 0.9568627, 1, 1,
0.06293534, -0.9296113, 2.565981, 0, 0.9529412, 1, 1,
0.06435943, -1.623094, 2.450316, 0, 0.945098, 1, 1,
0.06515453, 1.200647, 0.3717142, 0, 0.9411765, 1, 1,
0.0652414, 1.334936, 0.7484375, 0, 0.9333333, 1, 1,
0.06663616, -0.6370311, 5.277192, 0, 0.9294118, 1, 1,
0.06790479, -1.290831, 2.883855, 0, 0.9215686, 1, 1,
0.07358368, 0.7590556, -2.1712, 0, 0.9176471, 1, 1,
0.07465953, -0.961121, 4.028661, 0, 0.9098039, 1, 1,
0.08164062, -0.6557035, 1.829756, 0, 0.9058824, 1, 1,
0.08236858, -0.6475296, 3.12233, 0, 0.8980392, 1, 1,
0.08447412, -0.2673237, 2.841556, 0, 0.8901961, 1, 1,
0.08755323, -0.9568717, 3.286364, 0, 0.8862745, 1, 1,
0.09029619, 0.1287105, -0.1620099, 0, 0.8784314, 1, 1,
0.09652171, -0.5870221, 3.248232, 0, 0.8745098, 1, 1,
0.09925038, -0.6053079, 0.5128137, 0, 0.8666667, 1, 1,
0.1014367, 0.0229387, 0.3455065, 0, 0.8627451, 1, 1,
0.107751, -1.099647, 2.693318, 0, 0.854902, 1, 1,
0.1078905, 0.7957584, 0.1804783, 0, 0.8509804, 1, 1,
0.1080408, 0.02059219, 2.667981, 0, 0.8431373, 1, 1,
0.1114384, 1.64436, -0.7937918, 0, 0.8392157, 1, 1,
0.112306, -1.289677, 1.427302, 0, 0.8313726, 1, 1,
0.1130316, 0.508319, 0.09031888, 0, 0.827451, 1, 1,
0.1139265, -1.909693, 2.345628, 0, 0.8196079, 1, 1,
0.119436, -0.1291385, 2.965109, 0, 0.8156863, 1, 1,
0.1195662, -0.3549943, 4.380009, 0, 0.8078431, 1, 1,
0.1215934, 0.4705216, 2.250653, 0, 0.8039216, 1, 1,
0.124303, 0.4483102, 1.369524, 0, 0.7960784, 1, 1,
0.1268968, 0.02671102, 0.7845636, 0, 0.7882353, 1, 1,
0.127424, -0.3011583, 2.122124, 0, 0.7843137, 1, 1,
0.1307965, -0.6449308, 3.73826, 0, 0.7764706, 1, 1,
0.1332516, -2.168914, 2.311476, 0, 0.772549, 1, 1,
0.1365112, -1.054183, 2.380838, 0, 0.7647059, 1, 1,
0.1413958, -0.6228105, 1.826004, 0, 0.7607843, 1, 1,
0.1420519, 0.8255451, -1.94384, 0, 0.7529412, 1, 1,
0.1465246, -0.2601151, 2.590784, 0, 0.7490196, 1, 1,
0.1482795, -0.5355921, 2.620616, 0, 0.7411765, 1, 1,
0.1494074, -1.242311, 3.598471, 0, 0.7372549, 1, 1,
0.1522184, -0.5502719, 2.024645, 0, 0.7294118, 1, 1,
0.1530134, -0.8360959, 2.405108, 0, 0.7254902, 1, 1,
0.1534322, -0.5797831, 3.099211, 0, 0.7176471, 1, 1,
0.153541, 0.3389204, 0.2524409, 0, 0.7137255, 1, 1,
0.1628759, -1.096569, 5.995241, 0, 0.7058824, 1, 1,
0.1661702, -0.4113747, 1.808038, 0, 0.6980392, 1, 1,
0.1701809, 0.2651295, 1.729285, 0, 0.6941177, 1, 1,
0.173175, 0.8868337, 0.5894635, 0, 0.6862745, 1, 1,
0.1741447, -0.350967, 5.476277, 0, 0.682353, 1, 1,
0.1826375, 2.194452, 0.874911, 0, 0.6745098, 1, 1,
0.1859597, -2.872592, 3.115672, 0, 0.6705883, 1, 1,
0.1901617, 0.9726105, -1.228781, 0, 0.6627451, 1, 1,
0.1906147, 0.4979048, 0.4609548, 0, 0.6588235, 1, 1,
0.1933404, -0.5018334, 2.618655, 0, 0.6509804, 1, 1,
0.1957424, -0.8910888, 3.895872, 0, 0.6470588, 1, 1,
0.1974152, 0.5303811, 1.842871, 0, 0.6392157, 1, 1,
0.1997852, -0.4485891, 0.9419802, 0, 0.6352941, 1, 1,
0.2044741, 1.227566, 1.943969, 0, 0.627451, 1, 1,
0.206449, 0.1435858, -0.740903, 0, 0.6235294, 1, 1,
0.2070642, 0.9053347, -1.01071, 0, 0.6156863, 1, 1,
0.2113117, -1.175261, 2.250112, 0, 0.6117647, 1, 1,
0.2133033, -1.222312, 2.879955, 0, 0.6039216, 1, 1,
0.2166788, 0.6529048, 0.5229803, 0, 0.5960785, 1, 1,
0.2167956, 0.04153254, 2.289076, 0, 0.5921569, 1, 1,
0.2204488, -0.9532432, 2.249487, 0, 0.5843138, 1, 1,
0.2215848, 0.2325322, 0.4227687, 0, 0.5803922, 1, 1,
0.2251985, 0.3361256, 0.4936362, 0, 0.572549, 1, 1,
0.2259921, 0.5454133, 0.7884785, 0, 0.5686275, 1, 1,
0.2263413, 0.6006441, 0.4046603, 0, 0.5607843, 1, 1,
0.2282443, -0.7028943, 2.056869, 0, 0.5568628, 1, 1,
0.2292609, 0.2383105, 1.900311, 0, 0.5490196, 1, 1,
0.2293929, -0.1870134, 2.70111, 0, 0.5450981, 1, 1,
0.2304651, -0.33008, 2.222807, 0, 0.5372549, 1, 1,
0.2305866, -2.450077, 5.087693, 0, 0.5333334, 1, 1,
0.2314976, 0.5824561, 1.561397, 0, 0.5254902, 1, 1,
0.2315069, 1.035792, -0.1677142, 0, 0.5215687, 1, 1,
0.2344317, -0.7633433, 0.563595, 0, 0.5137255, 1, 1,
0.2359047, -0.103259, 1.774914, 0, 0.509804, 1, 1,
0.2378666, 1.589981, 1.973945, 0, 0.5019608, 1, 1,
0.2440025, 0.647099, -0.1180601, 0, 0.4941176, 1, 1,
0.2474308, 0.6920989, 1.637879, 0, 0.4901961, 1, 1,
0.2495154, 0.9514545, 0.1115517, 0, 0.4823529, 1, 1,
0.2521404, -0.7300563, 3.044017, 0, 0.4784314, 1, 1,
0.2529413, -0.1867903, 3.152247, 0, 0.4705882, 1, 1,
0.2572151, 1.463609, 4.17796, 0, 0.4666667, 1, 1,
0.2574559, -0.8540456, 1.400581, 0, 0.4588235, 1, 1,
0.2579134, 1.070426, 1.336294, 0, 0.454902, 1, 1,
0.2642044, 0.5456591, 0.7280423, 0, 0.4470588, 1, 1,
0.2686748, 0.4271375, -0.9734922, 0, 0.4431373, 1, 1,
0.2711858, -1.153362, 1.931855, 0, 0.4352941, 1, 1,
0.2724572, 1.001519, 0.5871029, 0, 0.4313726, 1, 1,
0.2742396, -0.6911598, 1.909027, 0, 0.4235294, 1, 1,
0.2743489, 1.126062, 0.2807951, 0, 0.4196078, 1, 1,
0.2775032, 1.260644, 0.5536272, 0, 0.4117647, 1, 1,
0.2778791, 0.4484755, -0.362481, 0, 0.4078431, 1, 1,
0.2799478, -0.9998344, 3.19044, 0, 0.4, 1, 1,
0.2813225, -0.2014723, 3.430915, 0, 0.3921569, 1, 1,
0.2848606, -1.767501, 1.867342, 0, 0.3882353, 1, 1,
0.2888232, -0.06145875, 1.014838, 0, 0.3803922, 1, 1,
0.2894871, 0.582324, 3.13975, 0, 0.3764706, 1, 1,
0.2932685, -0.5980994, 1.904459, 0, 0.3686275, 1, 1,
0.2972194, 1.124518, 0.910737, 0, 0.3647059, 1, 1,
0.2972779, 1.151196, -0.1259859, 0, 0.3568628, 1, 1,
0.2979353, -0.04104427, 1.681622, 0, 0.3529412, 1, 1,
0.2990729, -1.268403, 1.597565, 0, 0.345098, 1, 1,
0.299327, 0.6249772, 2.174852, 0, 0.3411765, 1, 1,
0.3007762, -0.8103391, 4.887079, 0, 0.3333333, 1, 1,
0.3043453, -0.6982514, 3.302263, 0, 0.3294118, 1, 1,
0.3069489, -0.4198466, 2.213854, 0, 0.3215686, 1, 1,
0.3133308, -1.304735, 4.896836, 0, 0.3176471, 1, 1,
0.3183303, -0.7794811, 2.779477, 0, 0.3098039, 1, 1,
0.3250827, -2.085955, 2.875054, 0, 0.3058824, 1, 1,
0.3274326, -3.049383, 3.064652, 0, 0.2980392, 1, 1,
0.3284426, -2.102988, 3.506985, 0, 0.2901961, 1, 1,
0.3380764, -1.922716, 1.948344, 0, 0.2862745, 1, 1,
0.3389207, -0.03805684, 2.389076, 0, 0.2784314, 1, 1,
0.3412699, 0.2892296, -0.4428675, 0, 0.2745098, 1, 1,
0.3414594, 0.6554536, 2.291962, 0, 0.2666667, 1, 1,
0.3424974, -0.003464418, 1.411907, 0, 0.2627451, 1, 1,
0.3426357, 1.16478, -1.123002, 0, 0.254902, 1, 1,
0.3474921, -0.2962121, 3.569135, 0, 0.2509804, 1, 1,
0.3511963, 0.3735088, -0.5449368, 0, 0.2431373, 1, 1,
0.3515788, -0.2131731, 1.57174, 0, 0.2392157, 1, 1,
0.354086, 1.589393, 0.8228437, 0, 0.2313726, 1, 1,
0.3609118, 1.188177, 2.050752, 0, 0.227451, 1, 1,
0.3627942, -0.8927893, 1.510338, 0, 0.2196078, 1, 1,
0.3641083, 1.355254, 1.402595, 0, 0.2156863, 1, 1,
0.3732325, -2.010993, 4.115094, 0, 0.2078431, 1, 1,
0.3734817, -1.48328, 2.183792, 0, 0.2039216, 1, 1,
0.3821626, 0.8911076, 0.924108, 0, 0.1960784, 1, 1,
0.3905057, -0.1720897, 1.054553, 0, 0.1882353, 1, 1,
0.4007881, 0.5415262, 0.2287669, 0, 0.1843137, 1, 1,
0.4028656, -2.448107, 2.429988, 0, 0.1764706, 1, 1,
0.4053199, 0.08252948, 1.110637, 0, 0.172549, 1, 1,
0.4135652, -0.1045611, 1.079193, 0, 0.1647059, 1, 1,
0.4149407, 0.158693, 2.613758, 0, 0.1607843, 1, 1,
0.4161048, -0.1571743, 2.902815, 0, 0.1529412, 1, 1,
0.4200286, -0.989939, 3.739542, 0, 0.1490196, 1, 1,
0.4240482, -1.809237, 2.207227, 0, 0.1411765, 1, 1,
0.429559, -1.804509, 1.615702, 0, 0.1372549, 1, 1,
0.4297803, -1.361194, 1.750494, 0, 0.1294118, 1, 1,
0.4339195, 0.2789668, 1.234746, 0, 0.1254902, 1, 1,
0.4344323, 0.3671715, -0.02874525, 0, 0.1176471, 1, 1,
0.4384948, 0.2098716, 2.571963, 0, 0.1137255, 1, 1,
0.4418302, 0.5604417, -0.567852, 0, 0.1058824, 1, 1,
0.4486219, 1.095297, 1.631295, 0, 0.09803922, 1, 1,
0.4488786, 0.2838871, 0.1831943, 0, 0.09411765, 1, 1,
0.4493234, -0.9174235, 4.847071, 0, 0.08627451, 1, 1,
0.4508874, 0.5320436, 0.9052474, 0, 0.08235294, 1, 1,
0.451712, -0.1208588, 3.59368, 0, 0.07450981, 1, 1,
0.4558727, -0.5885761, 2.907352, 0, 0.07058824, 1, 1,
0.4565023, 0.04120009, 1.949564, 0, 0.0627451, 1, 1,
0.4589169, -0.9822745, 3.972381, 0, 0.05882353, 1, 1,
0.4600661, -1.493449, 1.987241, 0, 0.05098039, 1, 1,
0.4603531, -0.7564506, 2.001481, 0, 0.04705882, 1, 1,
0.4625804, -0.3568489, 1.216681, 0, 0.03921569, 1, 1,
0.4636113, -1.483408, 1.516451, 0, 0.03529412, 1, 1,
0.4670398, 1.333784, 2.537973, 0, 0.02745098, 1, 1,
0.4674952, -0.05749263, 3.508617, 0, 0.02352941, 1, 1,
0.4684225, 0.5832135, 1.222056, 0, 0.01568628, 1, 1,
0.4688591, 0.2373408, 1.252383, 0, 0.01176471, 1, 1,
0.469947, 1.82462, 0.4410069, 0, 0.003921569, 1, 1,
0.4745437, -0.7896394, 4.310245, 0.003921569, 0, 1, 1,
0.4767114, 0.8537303, 0.06501636, 0.007843138, 0, 1, 1,
0.4782073, -0.7962303, 3.689582, 0.01568628, 0, 1, 1,
0.481663, 1.179996, 1.708117, 0.01960784, 0, 1, 1,
0.4830506, 1.140443, 0.7877335, 0.02745098, 0, 1, 1,
0.4869543, -1.29784, 2.576181, 0.03137255, 0, 1, 1,
0.4871163, 0.4461113, -0.03228172, 0.03921569, 0, 1, 1,
0.4872211, 0.357364, 1.486122, 0.04313726, 0, 1, 1,
0.487285, -1.115326, 1.591244, 0.05098039, 0, 1, 1,
0.4874306, -0.5340268, 2.342721, 0.05490196, 0, 1, 1,
0.4875869, 1.707033, -0.5898669, 0.0627451, 0, 1, 1,
0.4879302, 0.3070404, -0.2529573, 0.06666667, 0, 1, 1,
0.4900096, -0.0138568, 2.247181, 0.07450981, 0, 1, 1,
0.4905394, -0.7093908, 1.489232, 0.07843138, 0, 1, 1,
0.4933394, -0.516266, 2.533371, 0.08627451, 0, 1, 1,
0.5000374, -0.7248293, 2.988646, 0.09019608, 0, 1, 1,
0.5029461, 0.5070494, -1.28845, 0.09803922, 0, 1, 1,
0.5057516, -0.5791276, 0.8405726, 0.1058824, 0, 1, 1,
0.5072987, -1.345566, 2.8275, 0.1098039, 0, 1, 1,
0.5082546, -0.1239776, 0.7782924, 0.1176471, 0, 1, 1,
0.5091509, -0.04228708, 2.170627, 0.1215686, 0, 1, 1,
0.509675, -1.011127, 4.684745, 0.1294118, 0, 1, 1,
0.5108347, 0.3119825, -1.092023, 0.1333333, 0, 1, 1,
0.5110877, -0.927196, 1.659782, 0.1411765, 0, 1, 1,
0.5110908, -0.244639, 1.750955, 0.145098, 0, 1, 1,
0.5145567, -0.1011583, 1.430976, 0.1529412, 0, 1, 1,
0.5146558, -1.621576, 4.490556, 0.1568628, 0, 1, 1,
0.5155789, -0.3947843, 3.09406, 0.1647059, 0, 1, 1,
0.5183627, 0.339238, 3.085101, 0.1686275, 0, 1, 1,
0.5199825, -1.45144, 2.450017, 0.1764706, 0, 1, 1,
0.5215293, 0.8296059, -1.042177, 0.1803922, 0, 1, 1,
0.5222288, -0.825667, 2.623863, 0.1882353, 0, 1, 1,
0.5224686, -0.6091096, 2.218578, 0.1921569, 0, 1, 1,
0.5226519, -0.3989983, 1.616752, 0.2, 0, 1, 1,
0.5269429, -0.05875633, -0.487607, 0.2078431, 0, 1, 1,
0.5269965, 1.484118, 0.8887814, 0.2117647, 0, 1, 1,
0.53253, 1.019605, 0.852971, 0.2196078, 0, 1, 1,
0.5332349, -0.7353093, 2.024367, 0.2235294, 0, 1, 1,
0.5334161, -0.526614, 2.163153, 0.2313726, 0, 1, 1,
0.5375625, -0.7020709, 1.408351, 0.2352941, 0, 1, 1,
0.5428397, 0.4150229, 1.884996, 0.2431373, 0, 1, 1,
0.5429058, -0.608738, 0.9963116, 0.2470588, 0, 1, 1,
0.5449355, -1.304326, 3.986555, 0.254902, 0, 1, 1,
0.5477349, 1.205144, 1.653284, 0.2588235, 0, 1, 1,
0.5483872, 0.2564363, 0.3869321, 0.2666667, 0, 1, 1,
0.5505631, -0.02876338, 1.893684, 0.2705882, 0, 1, 1,
0.5533813, 1.353874, 0.5932618, 0.2784314, 0, 1, 1,
0.5593321, -0.2029382, 3.266429, 0.282353, 0, 1, 1,
0.5604502, 0.1523758, -0.3452545, 0.2901961, 0, 1, 1,
0.5611377, -1.475489, 2.664534, 0.2941177, 0, 1, 1,
0.5672905, -0.3739086, 2.82287, 0.3019608, 0, 1, 1,
0.5701657, -0.614985, 4.008552, 0.3098039, 0, 1, 1,
0.5743821, 0.5854614, 1.83047, 0.3137255, 0, 1, 1,
0.5744335, -0.81045, 1.922076, 0.3215686, 0, 1, 1,
0.5750124, -0.4195433, 3.767683, 0.3254902, 0, 1, 1,
0.5771174, 0.7323005, 1.979273, 0.3333333, 0, 1, 1,
0.5776474, -0.8187594, 2.262076, 0.3372549, 0, 1, 1,
0.5827813, 1.181687, 0.9289689, 0.345098, 0, 1, 1,
0.5843643, 0.1187286, 0.6105653, 0.3490196, 0, 1, 1,
0.5853109, -1.107691, 4.113098, 0.3568628, 0, 1, 1,
0.5916136, -0.7099179, 4.031772, 0.3607843, 0, 1, 1,
0.5966592, -1.927673, 3.286417, 0.3686275, 0, 1, 1,
0.5990986, -0.9682765, 1.563387, 0.372549, 0, 1, 1,
0.5995678, -0.8171154, -0.8962915, 0.3803922, 0, 1, 1,
0.6024662, 0.2383793, -0.9597616, 0.3843137, 0, 1, 1,
0.618468, 1.251469, 0.1646938, 0.3921569, 0, 1, 1,
0.6203868, -1.55632, 1.17303, 0.3960784, 0, 1, 1,
0.6294972, -1.340047, 2.885198, 0.4039216, 0, 1, 1,
0.6299483, 0.7613313, 0.2333157, 0.4117647, 0, 1, 1,
0.6312606, -0.5459532, 0.7497078, 0.4156863, 0, 1, 1,
0.6354108, -0.1651607, 1.156131, 0.4235294, 0, 1, 1,
0.6399376, -1.17656, 1.161976, 0.427451, 0, 1, 1,
0.6412684, -1.389199, 3.232422, 0.4352941, 0, 1, 1,
0.6470129, 0.03282386, 2.172904, 0.4392157, 0, 1, 1,
0.6595679, 1.603489, 1.310829, 0.4470588, 0, 1, 1,
0.6605167, 0.1501184, 1.327634, 0.4509804, 0, 1, 1,
0.6631313, -1.71041, 4.034821, 0.4588235, 0, 1, 1,
0.6669901, 1.468829, 1.705504, 0.4627451, 0, 1, 1,
0.6691377, 1.081801, 0.1727813, 0.4705882, 0, 1, 1,
0.6721784, 1.543102, 1.307983, 0.4745098, 0, 1, 1,
0.6784831, -0.4306021, 0.1207335, 0.4823529, 0, 1, 1,
0.6797866, 0.4257087, 0.8019031, 0.4862745, 0, 1, 1,
0.6814368, 1.163624, 1.803559, 0.4941176, 0, 1, 1,
0.681681, 0.2510046, 1.26748, 0.5019608, 0, 1, 1,
0.6816811, 1.205471, 0.4526905, 0.5058824, 0, 1, 1,
0.6845278, 0.7622831, -0.9905366, 0.5137255, 0, 1, 1,
0.6865219, 0.4383292, 1.009574, 0.5176471, 0, 1, 1,
0.6896852, -0.5340616, 2.040112, 0.5254902, 0, 1, 1,
0.6933213, -0.49761, 0.7151255, 0.5294118, 0, 1, 1,
0.7020192, 0.5763854, -0.314748, 0.5372549, 0, 1, 1,
0.7043105, 0.7129648, -0.1364451, 0.5411765, 0, 1, 1,
0.7145575, 0.7517298, 1.123546, 0.5490196, 0, 1, 1,
0.7153957, 0.6811515, -0.2872227, 0.5529412, 0, 1, 1,
0.7180352, 0.03304482, 1.473531, 0.5607843, 0, 1, 1,
0.7205164, -0.0900889, 1.772099, 0.5647059, 0, 1, 1,
0.7217422, 0.06117605, 1.650887, 0.572549, 0, 1, 1,
0.7252517, 0.2153433, 2.817512, 0.5764706, 0, 1, 1,
0.7267023, -1.761114, 3.511744, 0.5843138, 0, 1, 1,
0.729142, 2.307438, 0.8740196, 0.5882353, 0, 1, 1,
0.7316983, 0.6933352, -0.6944963, 0.5960785, 0, 1, 1,
0.7357568, 0.07827324, 0.8762304, 0.6039216, 0, 1, 1,
0.7466684, 1.182675, -0.1065144, 0.6078432, 0, 1, 1,
0.7477441, 1.113472, 0.3133006, 0.6156863, 0, 1, 1,
0.7527112, -0.03505461, 2.538371, 0.6196079, 0, 1, 1,
0.7540612, -1.33311, 3.127145, 0.627451, 0, 1, 1,
0.7594136, 1.169784, 1.051896, 0.6313726, 0, 1, 1,
0.7602393, 1.164009, 1.649127, 0.6392157, 0, 1, 1,
0.7628514, 1.027428, -0.5560562, 0.6431373, 0, 1, 1,
0.7659331, -1.799955, 1.586829, 0.6509804, 0, 1, 1,
0.7678166, -1.068258, 3.235837, 0.654902, 0, 1, 1,
0.7679429, -1.19424, 1.325157, 0.6627451, 0, 1, 1,
0.7679868, 0.09374135, 2.93167, 0.6666667, 0, 1, 1,
0.7686092, 1.294146, 0.411344, 0.6745098, 0, 1, 1,
0.7707459, 2.710929, 0.05360248, 0.6784314, 0, 1, 1,
0.7708525, 0.5614144, -0.2738191, 0.6862745, 0, 1, 1,
0.7713959, 0.436662, 1.730894, 0.6901961, 0, 1, 1,
0.7717377, -1.048955, 2.872428, 0.6980392, 0, 1, 1,
0.7750328, 0.7917439, 0.7660704, 0.7058824, 0, 1, 1,
0.778267, -0.843376, 3.255228, 0.7098039, 0, 1, 1,
0.7886479, -0.2310536, 0.4642548, 0.7176471, 0, 1, 1,
0.799616, -0.5631767, 1.382344, 0.7215686, 0, 1, 1,
0.7998052, 0.8441581, -1.330841, 0.7294118, 0, 1, 1,
0.8053964, 0.8889213, 1.40872, 0.7333333, 0, 1, 1,
0.8074887, 0.2385694, 0.8699987, 0.7411765, 0, 1, 1,
0.8106307, 0.223158, 1.387241, 0.7450981, 0, 1, 1,
0.8126704, 0.2696574, 2.506831, 0.7529412, 0, 1, 1,
0.8151728, 0.1073972, 1.259579, 0.7568628, 0, 1, 1,
0.8164328, -0.9558676, 3.513551, 0.7647059, 0, 1, 1,
0.8200757, 1.092579, -0.5423748, 0.7686275, 0, 1, 1,
0.8201781, -1.497427, 1.285477, 0.7764706, 0, 1, 1,
0.8241841, -1.291947, 4.169322, 0.7803922, 0, 1, 1,
0.8263114, -1.215259, 3.155159, 0.7882353, 0, 1, 1,
0.8301731, -0.9858108, 2.200712, 0.7921569, 0, 1, 1,
0.8359724, -0.7898912, 1.132646, 0.8, 0, 1, 1,
0.8360069, 0.2172947, 1.663406, 0.8078431, 0, 1, 1,
0.8373204, 0.4061176, 2.892412, 0.8117647, 0, 1, 1,
0.8376699, 0.06158986, -0.9047731, 0.8196079, 0, 1, 1,
0.838025, -0.965196, 1.385401, 0.8235294, 0, 1, 1,
0.8397648, 0.8109604, -0.287152, 0.8313726, 0, 1, 1,
0.8425516, -0.02930066, 2.754686, 0.8352941, 0, 1, 1,
0.845845, 1.930159, 1.648244, 0.8431373, 0, 1, 1,
0.8514955, 1.424299, 0.6400629, 0.8470588, 0, 1, 1,
0.8516955, -0.658577, 3.777132, 0.854902, 0, 1, 1,
0.8520556, -0.2523086, 0.9787796, 0.8588235, 0, 1, 1,
0.8603104, 0.4128419, 0.9246211, 0.8666667, 0, 1, 1,
0.8637966, 0.3393497, 2.250676, 0.8705882, 0, 1, 1,
0.865104, -0.1280331, 1.491056, 0.8784314, 0, 1, 1,
0.8655329, 0.2950026, 0.385585, 0.8823529, 0, 1, 1,
0.8670011, -1.968254, 4.273651, 0.8901961, 0, 1, 1,
0.8702853, -0.4578917, 2.537458, 0.8941177, 0, 1, 1,
0.8703756, -0.4718181, 1.298226, 0.9019608, 0, 1, 1,
0.8723021, -0.0578521, 2.750014, 0.9098039, 0, 1, 1,
0.8843903, 0.1203583, 1.503539, 0.9137255, 0, 1, 1,
0.8860041, -0.3579924, 0.9044013, 0.9215686, 0, 1, 1,
0.8952908, 0.6392587, 1.090961, 0.9254902, 0, 1, 1,
0.8962315, -0.4900355, 3.48067, 0.9333333, 0, 1, 1,
0.9084983, -0.7748492, 3.274862, 0.9372549, 0, 1, 1,
0.9149752, 0.660605, 1.408853, 0.945098, 0, 1, 1,
0.9156815, -0.7782432, 2.100497, 0.9490196, 0, 1, 1,
0.9229362, 0.6025977, 2.436118, 0.9568627, 0, 1, 1,
0.9270604, 0.2013314, 0.4650342, 0.9607843, 0, 1, 1,
0.9292754, 0.3191552, 0.8227279, 0.9686275, 0, 1, 1,
0.9389913, -0.312897, 0.05309904, 0.972549, 0, 1, 1,
0.9426296, 0.2519181, 1.95814, 0.9803922, 0, 1, 1,
0.9432807, -0.2324271, 1.018497, 0.9843137, 0, 1, 1,
0.9437086, -0.4150394, 1.904238, 0.9921569, 0, 1, 1,
0.9453674, 2.16494, 0.3594889, 0.9960784, 0, 1, 1,
0.9574031, -2.329872, 2.813563, 1, 0, 0.9960784, 1,
0.9576494, 1.66135, 2.341944, 1, 0, 0.9882353, 1,
0.9585882, -0.9435262, 1.971083, 1, 0, 0.9843137, 1,
0.9607775, 0.4958692, 0.1728512, 1, 0, 0.9764706, 1,
0.9618244, -0.09600403, 0.08501618, 1, 0, 0.972549, 1,
0.971194, 1.693353, 0.02336085, 1, 0, 0.9647059, 1,
0.9745442, 1.876792, -1.178569, 1, 0, 0.9607843, 1,
0.9920354, 1.219217, 0.7713255, 1, 0, 0.9529412, 1,
0.9954777, 0.04263087, 2.095913, 1, 0, 0.9490196, 1,
1.000651, 0.5194699, 0.8026986, 1, 0, 0.9411765, 1,
1.001785, -0.02853518, 1.565134, 1, 0, 0.9372549, 1,
1.006115, -0.8262991, 1.357168, 1, 0, 0.9294118, 1,
1.008545, -0.3540951, 1.194965, 1, 0, 0.9254902, 1,
1.012243, 0.6631173, 0.6324462, 1, 0, 0.9176471, 1,
1.014723, 0.798788, 2.102103, 1, 0, 0.9137255, 1,
1.020489, -1.220275, 2.243635, 1, 0, 0.9058824, 1,
1.0226, 0.4592821, 1.657492, 1, 0, 0.9019608, 1,
1.023835, 0.8311913, 2.403333, 1, 0, 0.8941177, 1,
1.028254, -0.1943981, 1.574812, 1, 0, 0.8862745, 1,
1.029547, -0.3377493, 0.7794629, 1, 0, 0.8823529, 1,
1.032492, -1.110878, 2.50586, 1, 0, 0.8745098, 1,
1.042801, -0.135434, 0.2142651, 1, 0, 0.8705882, 1,
1.043934, 0.4628284, 2.439409, 1, 0, 0.8627451, 1,
1.045707, -0.05899209, 2.749983, 1, 0, 0.8588235, 1,
1.049244, -1.694492, 4.009071, 1, 0, 0.8509804, 1,
1.04953, -0.1482125, 0.9305332, 1, 0, 0.8470588, 1,
1.055409, 1.333283, 0.9971349, 1, 0, 0.8392157, 1,
1.056759, -0.2683012, 2.233035, 1, 0, 0.8352941, 1,
1.058763, 0.230827, 1.779118, 1, 0, 0.827451, 1,
1.065386, -0.8679968, 1.598563, 1, 0, 0.8235294, 1,
1.065947, 0.8702166, 1.517781, 1, 0, 0.8156863, 1,
1.067299, 1.494452, 0.8764811, 1, 0, 0.8117647, 1,
1.071429, 2.375038, 1.165298, 1, 0, 0.8039216, 1,
1.077235, 2.277658, 0.5771301, 1, 0, 0.7960784, 1,
1.078614, 0.8489991, -0.4254396, 1, 0, 0.7921569, 1,
1.081725, -0.07354949, 2.874303, 1, 0, 0.7843137, 1,
1.087532, -1.860865, 2.449628, 1, 0, 0.7803922, 1,
1.090241, -1.509, 2.551226, 1, 0, 0.772549, 1,
1.093386, 0.3610231, 2.036047, 1, 0, 0.7686275, 1,
1.09582, 0.273727, 1.134875, 1, 0, 0.7607843, 1,
1.09839, 0.7490107, 0.7293143, 1, 0, 0.7568628, 1,
1.117601, 1.586318, 0.5043481, 1, 0, 0.7490196, 1,
1.119966, -0.1531607, -0.494949, 1, 0, 0.7450981, 1,
1.129177, -1.410677, 1.438546, 1, 0, 0.7372549, 1,
1.131735, 1.231288, -1.41359, 1, 0, 0.7333333, 1,
1.132047, 0.03536012, 2.556604, 1, 0, 0.7254902, 1,
1.134254, 1.631358, 0.1192721, 1, 0, 0.7215686, 1,
1.141087, 0.0281997, 2.312961, 1, 0, 0.7137255, 1,
1.14115, 0.3261974, -0.07750307, 1, 0, 0.7098039, 1,
1.157304, 0.5265999, -0.5682041, 1, 0, 0.7019608, 1,
1.161474, -0.09717548, 2.104546, 1, 0, 0.6941177, 1,
1.162184, 2.863843, -1.82489, 1, 0, 0.6901961, 1,
1.183462, -0.4919539, 1.345116, 1, 0, 0.682353, 1,
1.211212, 0.7224551, 1.093724, 1, 0, 0.6784314, 1,
1.211757, 0.45454, 1.821519, 1, 0, 0.6705883, 1,
1.21447, 0.7248541, -0.9318646, 1, 0, 0.6666667, 1,
1.21798, -0.8917836, 1.725492, 1, 0, 0.6588235, 1,
1.218399, -1.598876, 3.579604, 1, 0, 0.654902, 1,
1.219657, 0.3280524, 1.259385, 1, 0, 0.6470588, 1,
1.224339, -0.3640792, 2.964768, 1, 0, 0.6431373, 1,
1.239919, -1.078464, 4.180998, 1, 0, 0.6352941, 1,
1.25721, 2.407184, -1.643013, 1, 0, 0.6313726, 1,
1.264061, -1.786927, 1.656957, 1, 0, 0.6235294, 1,
1.264741, -0.08060884, 1.264585, 1, 0, 0.6196079, 1,
1.266782, 0.1386835, -0.02362928, 1, 0, 0.6117647, 1,
1.267794, 0.5445406, 2.268576, 1, 0, 0.6078432, 1,
1.286092, -0.8053779, 3.603254, 1, 0, 0.6, 1,
1.290051, -0.1021306, 0.5376068, 1, 0, 0.5921569, 1,
1.291491, -0.003901297, 1.098735, 1, 0, 0.5882353, 1,
1.292863, 0.08399335, 2.685532, 1, 0, 0.5803922, 1,
1.30319, -0.1968027, 1.094253, 1, 0, 0.5764706, 1,
1.304323, -1.548715, 1.080592, 1, 0, 0.5686275, 1,
1.315765, 0.7062699, 0.01670816, 1, 0, 0.5647059, 1,
1.315978, -0.2917389, 1.476616, 1, 0, 0.5568628, 1,
1.327534, 0.8783696, 1.251693, 1, 0, 0.5529412, 1,
1.351855, -1.58436, 2.50488, 1, 0, 0.5450981, 1,
1.353355, 1.350221, 0.2454251, 1, 0, 0.5411765, 1,
1.355804, -0.9745354, 2.363204, 1, 0, 0.5333334, 1,
1.368808, 1.563024, 2.67023, 1, 0, 0.5294118, 1,
1.375554, 0.5571998, 1.228005, 1, 0, 0.5215687, 1,
1.37616, 0.2264797, 1.998505, 1, 0, 0.5176471, 1,
1.378262, 0.1841994, 1.78037, 1, 0, 0.509804, 1,
1.390417, -0.9076847, 2.920877, 1, 0, 0.5058824, 1,
1.392076, 1.39347, 1.10365, 1, 0, 0.4980392, 1,
1.392388, -1.200536, 4.022008, 1, 0, 0.4901961, 1,
1.392573, -2.155142, 2.066278, 1, 0, 0.4862745, 1,
1.392593, -1.04697, 3.192034, 1, 0, 0.4784314, 1,
1.410427, 0.9817485, 1.479091, 1, 0, 0.4745098, 1,
1.418373, 0.1685129, 0.1511626, 1, 0, 0.4666667, 1,
1.419991, -0.5809306, 1.123103, 1, 0, 0.4627451, 1,
1.422832, -0.02886217, 1.960661, 1, 0, 0.454902, 1,
1.42478, -1.336379, 1.70339, 1, 0, 0.4509804, 1,
1.426673, -0.02727333, 1.151581, 1, 0, 0.4431373, 1,
1.426964, 0.3042094, 2.664865, 1, 0, 0.4392157, 1,
1.427464, 1.168301, 1.259035, 1, 0, 0.4313726, 1,
1.43898, -0.045486, 2.6579, 1, 0, 0.427451, 1,
1.444473, -0.214177, 2.845633, 1, 0, 0.4196078, 1,
1.453522, -0.8019432, 2.763086, 1, 0, 0.4156863, 1,
1.465038, 0.1205149, 1.621994, 1, 0, 0.4078431, 1,
1.472545, 0.7273762, 0.1385007, 1, 0, 0.4039216, 1,
1.484432, 0.7899631, 0.6019179, 1, 0, 0.3960784, 1,
1.493085, 0.8741738, 2.307545, 1, 0, 0.3882353, 1,
1.493982, -0.9222749, 1.759222, 1, 0, 0.3843137, 1,
1.520168, 0.2508832, 0.7763454, 1, 0, 0.3764706, 1,
1.534874, -0.5864072, 1.601598, 1, 0, 0.372549, 1,
1.556496, 0.05917722, 1.867844, 1, 0, 0.3647059, 1,
1.573331, -0.7697595, 3.683547, 1, 0, 0.3607843, 1,
1.582498, 0.4840416, 0.1524478, 1, 0, 0.3529412, 1,
1.5883, -0.8922979, 0.6626855, 1, 0, 0.3490196, 1,
1.589797, 1.40166, 0.6792563, 1, 0, 0.3411765, 1,
1.592052, 0.5297447, 0.52332, 1, 0, 0.3372549, 1,
1.593018, -0.5089439, 0.9737706, 1, 0, 0.3294118, 1,
1.614354, -0.3759941, 1.4322, 1, 0, 0.3254902, 1,
1.617342, -0.1961275, 1.84558, 1, 0, 0.3176471, 1,
1.623973, 1.207496, 0.3102311, 1, 0, 0.3137255, 1,
1.624819, 0.7229381, 1.083368, 1, 0, 0.3058824, 1,
1.630545, 0.9441673, 1.98414, 1, 0, 0.2980392, 1,
1.632628, 0.4597522, 2.154857, 1, 0, 0.2941177, 1,
1.639127, 0.01313429, 1.433563, 1, 0, 0.2862745, 1,
1.653998, 1.078679, -0.07011204, 1, 0, 0.282353, 1,
1.676224, -0.1178707, 0.4080888, 1, 0, 0.2745098, 1,
1.684278, 0.6894515, 0.9708785, 1, 0, 0.2705882, 1,
1.695018, 1.229463, 1.774304, 1, 0, 0.2627451, 1,
1.699713, 0.4974413, 1.496815, 1, 0, 0.2588235, 1,
1.741204, -0.1018692, 2.101456, 1, 0, 0.2509804, 1,
1.773846, 0.6937653, 3.376465, 1, 0, 0.2470588, 1,
1.774915, -1.173517, 2.78771, 1, 0, 0.2392157, 1,
1.776746, 1.792374, 0.5017115, 1, 0, 0.2352941, 1,
1.795122, -0.9318386, 2.160983, 1, 0, 0.227451, 1,
1.808108, 0.5019327, -0.7131646, 1, 0, 0.2235294, 1,
1.823734, 0.9447135, 0.9482888, 1, 0, 0.2156863, 1,
1.832534, 0.1552319, 1.97858, 1, 0, 0.2117647, 1,
1.841005, -0.7580196, 0.9702052, 1, 0, 0.2039216, 1,
1.861525, 0.1354745, 2.456775, 1, 0, 0.1960784, 1,
1.872172, -1.507516, 2.473424, 1, 0, 0.1921569, 1,
1.88097, -0.7597079, 1.895245, 1, 0, 0.1843137, 1,
1.894149, 0.776816, 0.8478718, 1, 0, 0.1803922, 1,
1.908504, 0.1303627, 2.15575, 1, 0, 0.172549, 1,
1.928304, 0.6166962, 2.703117, 1, 0, 0.1686275, 1,
1.930476, -1.06553, 2.593194, 1, 0, 0.1607843, 1,
1.940177, -1.388441, 2.17764, 1, 0, 0.1568628, 1,
1.942846, 1.254584, 1.356329, 1, 0, 0.1490196, 1,
1.980614, -0.5463522, 1.960473, 1, 0, 0.145098, 1,
2.002479, 1.263033, 0.9621194, 1, 0, 0.1372549, 1,
2.010031, 0.718444, 0.09464905, 1, 0, 0.1333333, 1,
2.022649, 2.081652, 0.6192711, 1, 0, 0.1254902, 1,
2.058762, -0.7102633, 1.015216, 1, 0, 0.1215686, 1,
2.075984, -0.2781186, 1.696144, 1, 0, 0.1137255, 1,
2.076557, 0.6598479, 0.7214192, 1, 0, 0.1098039, 1,
2.129791, 0.1152603, 1.505701, 1, 0, 0.1019608, 1,
2.232736, 0.6827843, 0.05764913, 1, 0, 0.09411765, 1,
2.283454, 1.609228, -0.7869045, 1, 0, 0.09019608, 1,
2.358585, -0.3670353, 1.879483, 1, 0, 0.08235294, 1,
2.376587, 2.017247, 0.6482149, 1, 0, 0.07843138, 1,
2.381148, 0.2912071, 2.82391, 1, 0, 0.07058824, 1,
2.444783, -0.5931286, 1.651751, 1, 0, 0.06666667, 1,
2.477297, -0.5032079, 1.63236, 1, 0, 0.05882353, 1,
2.49014, 1.090788, 0.4590415, 1, 0, 0.05490196, 1,
2.592283, 1.238056, -0.07879378, 1, 0, 0.04705882, 1,
2.632979, 0.1285293, 1.282567, 1, 0, 0.04313726, 1,
2.667032, 0.3486413, 2.499037, 1, 0, 0.03529412, 1,
2.696206, 0.1839735, 0.8856394, 1, 0, 0.03137255, 1,
2.763886, 0.5668979, 1.813238, 1, 0, 0.02352941, 1,
2.792224, 0.2102616, 0.1113292, 1, 0, 0.01960784, 1,
3.198626, 1.250096, 1.897345, 1, 0, 0.01176471, 1,
3.25551, -0.2289229, 1.967707, 1, 0, 0.007843138, 1
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
0.1005752, -4.188143, -7.080261, 0, -0.5, 0.5, 0.5,
0.1005752, -4.188143, -7.080261, 1, -0.5, 0.5, 0.5,
0.1005752, -4.188143, -7.080261, 1, 1.5, 0.5, 0.5,
0.1005752, -4.188143, -7.080261, 0, 1.5, 0.5, 0.5
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
-4.123883, 0.001142383, -7.080261, 0, -0.5, 0.5, 0.5,
-4.123883, 0.001142383, -7.080261, 1, -0.5, 0.5, 0.5,
-4.123883, 0.001142383, -7.080261, 1, 1.5, 0.5, 0.5,
-4.123883, 0.001142383, -7.080261, 0, 1.5, 0.5, 0.5
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
-4.123883, -4.188143, 0.4050305, 0, -0.5, 0.5, 0.5,
-4.123883, -4.188143, 0.4050305, 1, -0.5, 0.5, 0.5,
-4.123883, -4.188143, 0.4050305, 1, 1.5, 0.5, 0.5,
-4.123883, -4.188143, 0.4050305, 0, 1.5, 0.5, 0.5
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
-3, -3.221385, -5.352886,
3, -3.221385, -5.352886,
-3, -3.221385, -5.352886,
-3, -3.382511, -5.640782,
-2, -3.221385, -5.352886,
-2, -3.382511, -5.640782,
-1, -3.221385, -5.352886,
-1, -3.382511, -5.640782,
0, -3.221385, -5.352886,
0, -3.382511, -5.640782,
1, -3.221385, -5.352886,
1, -3.382511, -5.640782,
2, -3.221385, -5.352886,
2, -3.382511, -5.640782,
3, -3.221385, -5.352886,
3, -3.382511, -5.640782
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
-3, -3.704764, -6.216574, 0, -0.5, 0.5, 0.5,
-3, -3.704764, -6.216574, 1, -0.5, 0.5, 0.5,
-3, -3.704764, -6.216574, 1, 1.5, 0.5, 0.5,
-3, -3.704764, -6.216574, 0, 1.5, 0.5, 0.5,
-2, -3.704764, -6.216574, 0, -0.5, 0.5, 0.5,
-2, -3.704764, -6.216574, 1, -0.5, 0.5, 0.5,
-2, -3.704764, -6.216574, 1, 1.5, 0.5, 0.5,
-2, -3.704764, -6.216574, 0, 1.5, 0.5, 0.5,
-1, -3.704764, -6.216574, 0, -0.5, 0.5, 0.5,
-1, -3.704764, -6.216574, 1, -0.5, 0.5, 0.5,
-1, -3.704764, -6.216574, 1, 1.5, 0.5, 0.5,
-1, -3.704764, -6.216574, 0, 1.5, 0.5, 0.5,
0, -3.704764, -6.216574, 0, -0.5, 0.5, 0.5,
0, -3.704764, -6.216574, 1, -0.5, 0.5, 0.5,
0, -3.704764, -6.216574, 1, 1.5, 0.5, 0.5,
0, -3.704764, -6.216574, 0, 1.5, 0.5, 0.5,
1, -3.704764, -6.216574, 0, -0.5, 0.5, 0.5,
1, -3.704764, -6.216574, 1, -0.5, 0.5, 0.5,
1, -3.704764, -6.216574, 1, 1.5, 0.5, 0.5,
1, -3.704764, -6.216574, 0, 1.5, 0.5, 0.5,
2, -3.704764, -6.216574, 0, -0.5, 0.5, 0.5,
2, -3.704764, -6.216574, 1, -0.5, 0.5, 0.5,
2, -3.704764, -6.216574, 1, 1.5, 0.5, 0.5,
2, -3.704764, -6.216574, 0, 1.5, 0.5, 0.5,
3, -3.704764, -6.216574, 0, -0.5, 0.5, 0.5,
3, -3.704764, -6.216574, 1, -0.5, 0.5, 0.5,
3, -3.704764, -6.216574, 1, 1.5, 0.5, 0.5,
3, -3.704764, -6.216574, 0, 1.5, 0.5, 0.5
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
-3.149008, -3, -5.352886,
-3.149008, 3, -5.352886,
-3.149008, -3, -5.352886,
-3.311487, -3, -5.640782,
-3.149008, -2, -5.352886,
-3.311487, -2, -5.640782,
-3.149008, -1, -5.352886,
-3.311487, -1, -5.640782,
-3.149008, 0, -5.352886,
-3.311487, 0, -5.640782,
-3.149008, 1, -5.352886,
-3.311487, 1, -5.640782,
-3.149008, 2, -5.352886,
-3.311487, 2, -5.640782,
-3.149008, 3, -5.352886,
-3.311487, 3, -5.640782
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
-3.636446, -3, -6.216574, 0, -0.5, 0.5, 0.5,
-3.636446, -3, -6.216574, 1, -0.5, 0.5, 0.5,
-3.636446, -3, -6.216574, 1, 1.5, 0.5, 0.5,
-3.636446, -3, -6.216574, 0, 1.5, 0.5, 0.5,
-3.636446, -2, -6.216574, 0, -0.5, 0.5, 0.5,
-3.636446, -2, -6.216574, 1, -0.5, 0.5, 0.5,
-3.636446, -2, -6.216574, 1, 1.5, 0.5, 0.5,
-3.636446, -2, -6.216574, 0, 1.5, 0.5, 0.5,
-3.636446, -1, -6.216574, 0, -0.5, 0.5, 0.5,
-3.636446, -1, -6.216574, 1, -0.5, 0.5, 0.5,
-3.636446, -1, -6.216574, 1, 1.5, 0.5, 0.5,
-3.636446, -1, -6.216574, 0, 1.5, 0.5, 0.5,
-3.636446, 0, -6.216574, 0, -0.5, 0.5, 0.5,
-3.636446, 0, -6.216574, 1, -0.5, 0.5, 0.5,
-3.636446, 0, -6.216574, 1, 1.5, 0.5, 0.5,
-3.636446, 0, -6.216574, 0, 1.5, 0.5, 0.5,
-3.636446, 1, -6.216574, 0, -0.5, 0.5, 0.5,
-3.636446, 1, -6.216574, 1, -0.5, 0.5, 0.5,
-3.636446, 1, -6.216574, 1, 1.5, 0.5, 0.5,
-3.636446, 1, -6.216574, 0, 1.5, 0.5, 0.5,
-3.636446, 2, -6.216574, 0, -0.5, 0.5, 0.5,
-3.636446, 2, -6.216574, 1, -0.5, 0.5, 0.5,
-3.636446, 2, -6.216574, 1, 1.5, 0.5, 0.5,
-3.636446, 2, -6.216574, 0, 1.5, 0.5, 0.5,
-3.636446, 3, -6.216574, 0, -0.5, 0.5, 0.5,
-3.636446, 3, -6.216574, 1, -0.5, 0.5, 0.5,
-3.636446, 3, -6.216574, 1, 1.5, 0.5, 0.5,
-3.636446, 3, -6.216574, 0, 1.5, 0.5, 0.5
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
-3.149008, -3.221385, -4,
-3.149008, -3.221385, 4,
-3.149008, -3.221385, -4,
-3.311487, -3.382511, -4,
-3.149008, -3.221385, -2,
-3.311487, -3.382511, -2,
-3.149008, -3.221385, 0,
-3.311487, -3.382511, 0,
-3.149008, -3.221385, 2,
-3.311487, -3.382511, 2,
-3.149008, -3.221385, 4,
-3.311487, -3.382511, 4
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
-3.636446, -3.704764, -4, 0, -0.5, 0.5, 0.5,
-3.636446, -3.704764, -4, 1, -0.5, 0.5, 0.5,
-3.636446, -3.704764, -4, 1, 1.5, 0.5, 0.5,
-3.636446, -3.704764, -4, 0, 1.5, 0.5, 0.5,
-3.636446, -3.704764, -2, 0, -0.5, 0.5, 0.5,
-3.636446, -3.704764, -2, 1, -0.5, 0.5, 0.5,
-3.636446, -3.704764, -2, 1, 1.5, 0.5, 0.5,
-3.636446, -3.704764, -2, 0, 1.5, 0.5, 0.5,
-3.636446, -3.704764, 0, 0, -0.5, 0.5, 0.5,
-3.636446, -3.704764, 0, 1, -0.5, 0.5, 0.5,
-3.636446, -3.704764, 0, 1, 1.5, 0.5, 0.5,
-3.636446, -3.704764, 0, 0, 1.5, 0.5, 0.5,
-3.636446, -3.704764, 2, 0, -0.5, 0.5, 0.5,
-3.636446, -3.704764, 2, 1, -0.5, 0.5, 0.5,
-3.636446, -3.704764, 2, 1, 1.5, 0.5, 0.5,
-3.636446, -3.704764, 2, 0, 1.5, 0.5, 0.5,
-3.636446, -3.704764, 4, 0, -0.5, 0.5, 0.5,
-3.636446, -3.704764, 4, 1, -0.5, 0.5, 0.5,
-3.636446, -3.704764, 4, 1, 1.5, 0.5, 0.5,
-3.636446, -3.704764, 4, 0, 1.5, 0.5, 0.5
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
-3.149008, -3.221385, -5.352886,
-3.149008, 3.223669, -5.352886,
-3.149008, -3.221385, 6.162947,
-3.149008, 3.223669, 6.162947,
-3.149008, -3.221385, -5.352886,
-3.149008, -3.221385, 6.162947,
-3.149008, 3.223669, -5.352886,
-3.149008, 3.223669, 6.162947,
-3.149008, -3.221385, -5.352886,
3.350158, -3.221385, -5.352886,
-3.149008, -3.221385, 6.162947,
3.350158, -3.221385, 6.162947,
-3.149008, 3.223669, -5.352886,
3.350158, 3.223669, -5.352886,
-3.149008, 3.223669, 6.162947,
3.350158, 3.223669, 6.162947,
3.350158, -3.221385, -5.352886,
3.350158, 3.223669, -5.352886,
3.350158, -3.221385, 6.162947,
3.350158, 3.223669, 6.162947,
3.350158, -3.221385, -5.352886,
3.350158, -3.221385, 6.162947,
3.350158, 3.223669, -5.352886,
3.350158, 3.223669, 6.162947
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
var radius = 7.855003;
var distance = 34.9478;
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
mvMatrix.translate( -0.1005752, -0.001142383, -0.4050305 );
mvMatrix.scale( 1.30678, 1.317752, 0.7375049 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.9478);
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


```r
open3d()
```

```
## glX 
##   2
```

```r
copper_copper_monoet<-read.table("copper_copper_monoet.xyz", skip=1)
```

```
## Error in read.table("copper_copper_monoet.xyz", skip = 1): duplicate 'row.names' are not allowed
```

```r
x<-copper_copper_monoet$V2
```

```
## Error in eval(expr, envir, enclos): object 'copper_copper_monoet' not found
```

```r
y<-copper_copper_monoet$V3
```

```
## Error in eval(expr, envir, enclos): object 'copper_copper_monoet' not found
```

```r
z<-copper_copper_monoet$V4
```

```
## Error in eval(expr, envir, enclos): object 'copper_copper_monoet' not found
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
-3.05436, 0.2233971, -2.362079, 0, 0, 1, 1, 1,
-2.858914, 0.7751418, -1.961997, 1, 0, 0, 1, 1,
-2.856554, 0.5872694, -2.385055, 1, 0, 0, 1, 1,
-2.850111, 1.79158, -0.8799524, 1, 0, 0, 1, 1,
-2.739321, -0.3198101, -0.1317065, 1, 0, 0, 1, 1,
-2.64973, 0.4557434, -1.392511, 1, 0, 0, 1, 1,
-2.592966, 0.1038021, -3.631508, 0, 0, 0, 1, 1,
-2.483504, 0.6249349, -1.74755, 0, 0, 0, 1, 1,
-2.438247, 0.236695, -2.187958, 0, 0, 0, 1, 1,
-2.319136, -1.252084, -1.976866, 0, 0, 0, 1, 1,
-2.293128, -0.6951615, -2.772161, 0, 0, 0, 1, 1,
-2.226011, -0.9367702, -1.088549, 0, 0, 0, 1, 1,
-2.215518, 0.8486978, -2.35473, 0, 0, 0, 1, 1,
-2.135573, 0.08220501, -2.336339, 1, 1, 1, 1, 1,
-2.117575, 1.232808, 0.2309445, 1, 1, 1, 1, 1,
-2.113702, -0.9056497, -0.2740362, 1, 1, 1, 1, 1,
-2.103083, 1.091177, -1.418281, 1, 1, 1, 1, 1,
-2.097846, 1.359489, -1.080614, 1, 1, 1, 1, 1,
-2.083656, 0.9582868, -0.554547, 1, 1, 1, 1, 1,
-2.068018, -1.196157, -2.314954, 1, 1, 1, 1, 1,
-2.04559, -0.4241328, -2.214839, 1, 1, 1, 1, 1,
-2.038003, -1.530394, -2.012471, 1, 1, 1, 1, 1,
-1.991635, -0.1958751, -0.3432084, 1, 1, 1, 1, 1,
-1.971722, 0.230762, 0.07465507, 1, 1, 1, 1, 1,
-1.951561, 0.2075589, -2.137772, 1, 1, 1, 1, 1,
-1.93915, 1.328127, 0.02228586, 1, 1, 1, 1, 1,
-1.922684, -0.6781594, -2.05442, 1, 1, 1, 1, 1,
-1.891486, -2.023635, -2.111013, 1, 1, 1, 1, 1,
-1.873794, -0.4387284, 0.6039883, 0, 0, 1, 1, 1,
-1.851421, 0.7138382, -2.701716, 1, 0, 0, 1, 1,
-1.827734, -0.6571736, -0.5604493, 1, 0, 0, 1, 1,
-1.825652, 1.431577, 0.9211473, 1, 0, 0, 1, 1,
-1.794201, -0.126334, -0.9872873, 1, 0, 0, 1, 1,
-1.784373, 1.852294, -1.539997, 1, 0, 0, 1, 1,
-1.779588, 1.996614, 0.7736707, 0, 0, 0, 1, 1,
-1.771799, 1.41748, 0.8453237, 0, 0, 0, 1, 1,
-1.769931, 0.1628955, -0.00746845, 0, 0, 0, 1, 1,
-1.75801, -2.175516, -1.58311, 0, 0, 0, 1, 1,
-1.747405, -0.5402909, -1.796681, 0, 0, 0, 1, 1,
-1.743038, 1.333245, -0.7054967, 0, 0, 0, 1, 1,
-1.741032, -0.8133314, -1.409008, 0, 0, 0, 1, 1,
-1.725206, -0.4691224, -2.746853, 1, 1, 1, 1, 1,
-1.688891, -0.2983875, -0.6250741, 1, 1, 1, 1, 1,
-1.680678, 1.68244, -1.199649, 1, 1, 1, 1, 1,
-1.675824, -0.154021, -2.050463, 1, 1, 1, 1, 1,
-1.674253, -0.7468201, -0.7913191, 1, 1, 1, 1, 1,
-1.626374, 0.1622685, -1.459054, 1, 1, 1, 1, 1,
-1.604316, -0.05905286, -2.437194, 1, 1, 1, 1, 1,
-1.592867, -0.4130963, -2.472524, 1, 1, 1, 1, 1,
-1.58564, -2.288997, -3.546981, 1, 1, 1, 1, 1,
-1.555553, 0.03217476, -2.975279, 1, 1, 1, 1, 1,
-1.548764, -2.004863, -0.5424428, 1, 1, 1, 1, 1,
-1.543907, 0.5190007, -0.1031202, 1, 1, 1, 1, 1,
-1.537813, -0.2945557, -3.071788, 1, 1, 1, 1, 1,
-1.53445, 0.5181438, -1.968145, 1, 1, 1, 1, 1,
-1.526796, -0.6681019, -2.16555, 1, 1, 1, 1, 1,
-1.5197, 0.7372407, -1.70891, 0, 0, 1, 1, 1,
-1.504319, 1.494086, -1.618374, 1, 0, 0, 1, 1,
-1.493655, -1.264728, -1.938845, 1, 0, 0, 1, 1,
-1.488461, -0.6085275, -2.972161, 1, 0, 0, 1, 1,
-1.468864, 0.1866435, -0.3017426, 1, 0, 0, 1, 1,
-1.455209, 0.8594851, -1.412782, 1, 0, 0, 1, 1,
-1.44471, -1.00212, -1.545496, 0, 0, 0, 1, 1,
-1.434856, 0.6838169, -1.727355, 0, 0, 0, 1, 1,
-1.432078, 1.920962, -0.9128568, 0, 0, 0, 1, 1,
-1.422793, -0.2347508, -2.943077, 0, 0, 0, 1, 1,
-1.422523, -1.502061, -1.415081, 0, 0, 0, 1, 1,
-1.416494, -0.1741736, -0.3551251, 0, 0, 0, 1, 1,
-1.416454, -0.2104468, -2.696697, 0, 0, 0, 1, 1,
-1.41592, -1.537506, -3.286228, 1, 1, 1, 1, 1,
-1.391528, 2.118645, -0.5520958, 1, 1, 1, 1, 1,
-1.391497, -0.4802673, -2.941858, 1, 1, 1, 1, 1,
-1.385525, -0.6412738, -2.333887, 1, 1, 1, 1, 1,
-1.384448, -0.3436368, -3.104073, 1, 1, 1, 1, 1,
-1.376181, 1.027635, -0.833611, 1, 1, 1, 1, 1,
-1.372126, 0.1813215, -2.035035, 1, 1, 1, 1, 1,
-1.370838, -1.306292, -2.592903, 1, 1, 1, 1, 1,
-1.360345, -0.8437498, -1.460387, 1, 1, 1, 1, 1,
-1.359863, -0.2687482, -2.153184, 1, 1, 1, 1, 1,
-1.349965, 0.1620141, -2.064623, 1, 1, 1, 1, 1,
-1.347405, -0.08748662, -0.9379974, 1, 1, 1, 1, 1,
-1.345447, -0.0280553, -1.133512, 1, 1, 1, 1, 1,
-1.345322, -1.200707, -1.832218, 1, 1, 1, 1, 1,
-1.343189, 0.9252951, -0.979829, 1, 1, 1, 1, 1,
-1.341709, -1.323566, -2.9124, 0, 0, 1, 1, 1,
-1.341262, -0.5916828, -2.033418, 1, 0, 0, 1, 1,
-1.340933, -0.1949638, -1.524981, 1, 0, 0, 1, 1,
-1.329558, 0.1540574, -1.799412, 1, 0, 0, 1, 1,
-1.329469, 0.5090394, -2.420341, 1, 0, 0, 1, 1,
-1.326042, 1.705071, 1.098707, 1, 0, 0, 1, 1,
-1.313705, 0.2585637, -1.918557, 0, 0, 0, 1, 1,
-1.304412, -1.949759, -2.524407, 0, 0, 0, 1, 1,
-1.301635, -0.2546214, -3.459026, 0, 0, 0, 1, 1,
-1.298551, -0.7484467, -2.508307, 0, 0, 0, 1, 1,
-1.29533, 0.2155219, -2.726609, 0, 0, 0, 1, 1,
-1.286601, 0.9851468, -1.472704, 0, 0, 0, 1, 1,
-1.267657, 0.4636158, -1.970993, 0, 0, 0, 1, 1,
-1.254061, 0.8536162, 1.003581, 1, 1, 1, 1, 1,
-1.224105, 0.2871535, 0.1635646, 1, 1, 1, 1, 1,
-1.221613, -1.589076, -1.209081, 1, 1, 1, 1, 1,
-1.211596, -0.2485145, -2.105725, 1, 1, 1, 1, 1,
-1.21138, -0.1260667, -0.7488506, 1, 1, 1, 1, 1,
-1.211172, -0.2483203, -2.21122, 1, 1, 1, 1, 1,
-1.208482, 0.3616952, -2.140963, 1, 1, 1, 1, 1,
-1.203685, 3.129809, 0.3335944, 1, 1, 1, 1, 1,
-1.195972, -0.7353498, -1.385524, 1, 1, 1, 1, 1,
-1.193182, -0.1857114, 1.178293, 1, 1, 1, 1, 1,
-1.192898, 0.4093731, -0.6836378, 1, 1, 1, 1, 1,
-1.172855, 0.2111414, -0.4568676, 1, 1, 1, 1, 1,
-1.172558, -0.3194221, -0.7286912, 1, 1, 1, 1, 1,
-1.153988, 0.8149554, -2.679992, 1, 1, 1, 1, 1,
-1.144701, 0.7235516, -2.496212, 1, 1, 1, 1, 1,
-1.144214, 0.971146, -0.7868147, 0, 0, 1, 1, 1,
-1.142597, -0.3801219, -0.6756941, 1, 0, 0, 1, 1,
-1.140267, -0.1618776, -3.35585, 1, 0, 0, 1, 1,
-1.13926, -0.7342309, -2.216636, 1, 0, 0, 1, 1,
-1.138335, -0.5519336, -1.823455, 1, 0, 0, 1, 1,
-1.137769, 1.000263, -1.394227, 1, 0, 0, 1, 1,
-1.133146, -1.00257, -3.219925, 0, 0, 0, 1, 1,
-1.133005, 0.5709963, -1.471727, 0, 0, 0, 1, 1,
-1.124442, -0.07766316, -2.350986, 0, 0, 0, 1, 1,
-1.115912, -0.1042982, -1.675689, 0, 0, 0, 1, 1,
-1.107239, 0.02800984, -1.614995, 0, 0, 0, 1, 1,
-1.106246, -0.4537971, -2.467396, 0, 0, 0, 1, 1,
-1.096293, 1.46069, -0.07001425, 0, 0, 0, 1, 1,
-1.094355, 0.4493037, -1.445539, 1, 1, 1, 1, 1,
-1.09172, 0.6025334, -0.7316937, 1, 1, 1, 1, 1,
-1.08445, 1.826047, 0.6880513, 1, 1, 1, 1, 1,
-1.082991, -0.6871571, -1.092703, 1, 1, 1, 1, 1,
-1.080619, -0.5827606, -2.347909, 1, 1, 1, 1, 1,
-1.07688, 0.6319919, -2.754988, 1, 1, 1, 1, 1,
-1.074843, 0.2078082, 0.5891926, 1, 1, 1, 1, 1,
-1.072999, -0.6327108, -1.412158, 1, 1, 1, 1, 1,
-1.070119, -0.6619481, -2.180642, 1, 1, 1, 1, 1,
-1.067448, 0.2260964, -0.1647414, 1, 1, 1, 1, 1,
-1.066387, 0.6926482, -0.3034023, 1, 1, 1, 1, 1,
-1.06403, -1.455366, -2.395267, 1, 1, 1, 1, 1,
-1.058748, 1.363112, -0.380527, 1, 1, 1, 1, 1,
-1.052439, 0.4271288, -0.7597483, 1, 1, 1, 1, 1,
-1.049945, -1.239203, -3.695777, 1, 1, 1, 1, 1,
-1.041403, -0.4133843, -1.504834, 0, 0, 1, 1, 1,
-1.040903, 0.3942119, -1.626066, 1, 0, 0, 1, 1,
-1.039853, 0.911193, -0.7075878, 1, 0, 0, 1, 1,
-1.036176, -1.041464, -2.099266, 1, 0, 0, 1, 1,
-1.033404, -0.1160352, -2.169465, 1, 0, 0, 1, 1,
-1.03219, -0.901223, -2.927162, 1, 0, 0, 1, 1,
-1.028402, -0.5322696, -2.602808, 0, 0, 0, 1, 1,
-1.027375, 0.9669613, -2.571188, 0, 0, 0, 1, 1,
-1.027304, -1.589072, -4.113723, 0, 0, 0, 1, 1,
-1.025952, -1.081443, -2.191049, 0, 0, 0, 1, 1,
-1.023728, 1.066632, -1.809457, 0, 0, 0, 1, 1,
-1.019595, 0.003658086, -2.140047, 0, 0, 0, 1, 1,
-1.012979, 0.4988607, -0.08334773, 0, 0, 0, 1, 1,
-1.006052, 0.6911045, -0.8132759, 1, 1, 1, 1, 1,
-1.002044, 0.04092843, -2.489818, 1, 1, 1, 1, 1,
-1.000197, 0.8962945, -0.3682962, 1, 1, 1, 1, 1,
-0.9973652, -0.7003196, -3.041469, 1, 1, 1, 1, 1,
-0.9826788, 0.9458122, -0.6696824, 1, 1, 1, 1, 1,
-0.9814144, 1.057526, -0.7772257, 1, 1, 1, 1, 1,
-0.9762759, 0.294343, -0.7083439, 1, 1, 1, 1, 1,
-0.9751144, 0.7500622, -1.390824, 1, 1, 1, 1, 1,
-0.9663392, -1.832175, -1.953972, 1, 1, 1, 1, 1,
-0.9615881, 2.056228, -0.1312243, 1, 1, 1, 1, 1,
-0.9525058, 0.09871298, -1.132993, 1, 1, 1, 1, 1,
-0.9481928, -1.870178, -1.051746, 1, 1, 1, 1, 1,
-0.945751, 0.2553745, 1.8999, 1, 1, 1, 1, 1,
-0.9443883, -0.926594, -1.780399, 1, 1, 1, 1, 1,
-0.9438521, -0.8759754, -3.204351, 1, 1, 1, 1, 1,
-0.9420705, 0.1464474, -1.572248, 0, 0, 1, 1, 1,
-0.9381899, -1.209184, -4.205235, 1, 0, 0, 1, 1,
-0.9362418, 1.053542, -2.176328, 1, 0, 0, 1, 1,
-0.9357455, -1.123424, -4.400627, 1, 0, 0, 1, 1,
-0.9331684, 0.5669632, 0.208911, 1, 0, 0, 1, 1,
-0.9314606, 2.350228, 1.152308, 1, 0, 0, 1, 1,
-0.9244904, -0.9152521, -2.445474, 0, 0, 0, 1, 1,
-0.9234955, 1.499782, -0.246312, 0, 0, 0, 1, 1,
-0.9216916, 0.5410299, -0.9190837, 0, 0, 0, 1, 1,
-0.9210454, -0.006360454, -0.8932772, 0, 0, 0, 1, 1,
-0.8985958, -1.944868, -3.089201, 0, 0, 0, 1, 1,
-0.8961769, 1.105278, -2.327375, 0, 0, 0, 1, 1,
-0.8912407, 1.223089, -1.69022, 0, 0, 0, 1, 1,
-0.8907607, -0.5995051, -3.19266, 1, 1, 1, 1, 1,
-0.8806227, 1.19225, -0.9799674, 1, 1, 1, 1, 1,
-0.8799084, -2.0198, -3.094895, 1, 1, 1, 1, 1,
-0.8752763, -2.512144, -2.932723, 1, 1, 1, 1, 1,
-0.8741977, 0.267749, -0.1963532, 1, 1, 1, 1, 1,
-0.8648278, -0.1068015, -1.597047, 1, 1, 1, 1, 1,
-0.8646724, 0.01822395, -2.77066, 1, 1, 1, 1, 1,
-0.8629528, -0.7951682, -2.782904, 1, 1, 1, 1, 1,
-0.8625884, 0.3066931, -1.822135, 1, 1, 1, 1, 1,
-0.8612412, -0.7129725, -2.408398, 1, 1, 1, 1, 1,
-0.8602314, -0.6660985, -3.354746, 1, 1, 1, 1, 1,
-0.8572729, 0.6271943, -0.01061738, 1, 1, 1, 1, 1,
-0.8532124, 0.02070255, -2.384515, 1, 1, 1, 1, 1,
-0.847278, 0.6607032, -1.861759, 1, 1, 1, 1, 1,
-0.8465272, 0.2937345, 0.3565535, 1, 1, 1, 1, 1,
-0.844769, 0.2394146, -1.466104, 0, 0, 1, 1, 1,
-0.8391835, 0.8930711, -1.619261, 1, 0, 0, 1, 1,
-0.8371133, -1.260789, -2.760817, 1, 0, 0, 1, 1,
-0.8363768, -0.3225428, -1.12836, 1, 0, 0, 1, 1,
-0.8346144, -0.09296849, -1.383108, 1, 0, 0, 1, 1,
-0.8213935, -0.6394845, -1.876577, 1, 0, 0, 1, 1,
-0.8210965, 0.8067157, -2.287626, 0, 0, 0, 1, 1,
-0.8183696, -0.6735653, -3.534944, 0, 0, 0, 1, 1,
-0.8180765, 0.6167017, -0.578179, 0, 0, 0, 1, 1,
-0.8111098, -1.015478, -1.910435, 0, 0, 0, 1, 1,
-0.806365, 0.7273099, -1.116163, 0, 0, 0, 1, 1,
-0.8043319, 0.2531522, -2.485868, 0, 0, 0, 1, 1,
-0.8024123, -0.9365224, -2.169145, 0, 0, 0, 1, 1,
-0.7997405, -1.092662, 0.05249018, 1, 1, 1, 1, 1,
-0.7915704, -1.281053, -2.270402, 1, 1, 1, 1, 1,
-0.7889457, -1.215736, -3.491058, 1, 1, 1, 1, 1,
-0.782598, 1.819191, -2.50035, 1, 1, 1, 1, 1,
-0.7824059, 0.1724552, -1.924092, 1, 1, 1, 1, 1,
-0.7708058, -0.7879687, -2.578783, 1, 1, 1, 1, 1,
-0.769961, 0.1065949, -1.053929, 1, 1, 1, 1, 1,
-0.7651516, -1.672597, -2.04722, 1, 1, 1, 1, 1,
-0.7627217, 0.3019914, -1.613348, 1, 1, 1, 1, 1,
-0.7618985, 0.4490379, -0.3026417, 1, 1, 1, 1, 1,
-0.7553551, 1.171398, -0.8127766, 1, 1, 1, 1, 1,
-0.7496696, 0.4144439, -1.444297, 1, 1, 1, 1, 1,
-0.749593, -0.4600735, -1.131587, 1, 1, 1, 1, 1,
-0.7463559, 1.13298, 0.2569753, 1, 1, 1, 1, 1,
-0.7392309, 1.302342, 1.246221, 1, 1, 1, 1, 1,
-0.738425, 0.2683724, -2.695544, 0, 0, 1, 1, 1,
-0.7342926, 0.04455154, -2.530555, 1, 0, 0, 1, 1,
-0.7320712, -0.4260535, -0.6696422, 1, 0, 0, 1, 1,
-0.72064, 0.02430869, -1.437067, 1, 0, 0, 1, 1,
-0.7171633, 0.5009863, -0.3795187, 1, 0, 0, 1, 1,
-0.715735, -1.055949, -2.548265, 1, 0, 0, 1, 1,
-0.7126608, -0.2744393, -0.453007, 0, 0, 0, 1, 1,
-0.70218, -1.064258, -3.722589, 0, 0, 0, 1, 1,
-0.7020994, -0.2731891, -2.819049, 0, 0, 0, 1, 1,
-0.7011917, -1.452638, -4.15696, 0, 0, 0, 1, 1,
-0.6913373, 0.2094982, -1.194268, 0, 0, 0, 1, 1,
-0.6876391, 0.282102, -1.481078, 0, 0, 0, 1, 1,
-0.6864183, 0.9766566, -1.994532, 0, 0, 0, 1, 1,
-0.6859782, 0.5115838, 0.06093759, 1, 1, 1, 1, 1,
-0.68064, 0.8185906, -1.476058, 1, 1, 1, 1, 1,
-0.6793653, -1.479782, -3.613563, 1, 1, 1, 1, 1,
-0.6763105, 0.8692012, 0.4507118, 1, 1, 1, 1, 1,
-0.6759114, 0.5858639, -1.860019, 1, 1, 1, 1, 1,
-0.674362, 1.895591, -0.199588, 1, 1, 1, 1, 1,
-0.6713923, 0.9333496, 0.9313173, 1, 1, 1, 1, 1,
-0.6686502, -1.300959, -4.443997, 1, 1, 1, 1, 1,
-0.6667355, 0.02027989, -2.719948, 1, 1, 1, 1, 1,
-0.6657336, -1.762995, -3.843617, 1, 1, 1, 1, 1,
-0.6618859, 0.970551, -1.537066, 1, 1, 1, 1, 1,
-0.6596994, -0.664191, -1.323887, 1, 1, 1, 1, 1,
-0.6593145, -1.162677, -2.624628, 1, 1, 1, 1, 1,
-0.6575267, -0.2840226, -0.6390588, 1, 1, 1, 1, 1,
-0.6514699, 1.084759, -0.04695033, 1, 1, 1, 1, 1,
-0.647974, 0.4067755, -1.940973, 0, 0, 1, 1, 1,
-0.6436713, 0.1491878, -1.799306, 1, 0, 0, 1, 1,
-0.6407354, -1.038064, -2.046794, 1, 0, 0, 1, 1,
-0.6397601, 1.273759, 0.326191, 1, 0, 0, 1, 1,
-0.638749, 1.633321, 0.008664111, 1, 0, 0, 1, 1,
-0.6327362, 0.4483318, -0.7971425, 1, 0, 0, 1, 1,
-0.632479, -1.767258, -3.475618, 0, 0, 0, 1, 1,
-0.6302497, 1.347172, -0.0144943, 0, 0, 0, 1, 1,
-0.6286803, -1.141203, -0.9496278, 0, 0, 0, 1, 1,
-0.6281747, 0.3975995, -0.001688401, 0, 0, 0, 1, 1,
-0.6256516, -0.294983, -1.935569, 0, 0, 0, 1, 1,
-0.6238101, -0.8986878, -2.356693, 0, 0, 0, 1, 1,
-0.6237199, -0.06459057, -1.760708, 0, 0, 0, 1, 1,
-0.6198661, 0.2801197, -0.7697917, 1, 1, 1, 1, 1,
-0.6160167, -0.6896547, -1.795639, 1, 1, 1, 1, 1,
-0.6123739, -3.127525, -3.096347, 1, 1, 1, 1, 1,
-0.6121364, 0.5186999, 1.03829, 1, 1, 1, 1, 1,
-0.6075829, -1.146413, -3.214437, 1, 1, 1, 1, 1,
-0.604486, -1.945015, -2.958701, 1, 1, 1, 1, 1,
-0.5972663, 1.35811, -0.1152244, 1, 1, 1, 1, 1,
-0.5930076, -0.1195553, -2.816833, 1, 1, 1, 1, 1,
-0.5901577, -2.896167, -0.4566197, 1, 1, 1, 1, 1,
-0.5889748, -0.5733467, -2.32959, 1, 1, 1, 1, 1,
-0.5880619, -1.298977, -1.970105, 1, 1, 1, 1, 1,
-0.5847415, -0.3905932, -2.529749, 1, 1, 1, 1, 1,
-0.582541, -0.2678558, -3.971451, 1, 1, 1, 1, 1,
-0.571695, -0.4476906, -2.615304, 1, 1, 1, 1, 1,
-0.5681943, -0.4491806, 0.9277176, 1, 1, 1, 1, 1,
-0.5637627, -0.373334, -1.268203, 0, 0, 1, 1, 1,
-0.5619435, -0.1778657, -0.803097, 1, 0, 0, 1, 1,
-0.5601391, -1.078502, -0.663276, 1, 0, 0, 1, 1,
-0.5486094, 0.07572287, -1.127745, 1, 0, 0, 1, 1,
-0.5469046, 2.519883, 2.103643, 1, 0, 0, 1, 1,
-0.5422116, -0.6129142, -3.11125, 1, 0, 0, 1, 1,
-0.5284915, 0.7593864, -2.791625, 0, 0, 0, 1, 1,
-0.5191771, 0.8745769, 0.1539855, 0, 0, 0, 1, 1,
-0.5191297, 0.5545219, -3.462546, 0, 0, 0, 1, 1,
-0.5189211, 0.4060466, 0.5188273, 0, 0, 0, 1, 1,
-0.5140687, 0.2430775, -1.027789, 0, 0, 0, 1, 1,
-0.5125664, -0.7854895, -2.133655, 0, 0, 0, 1, 1,
-0.5120224, 0.4084946, -0.1403901, 0, 0, 0, 1, 1,
-0.5109323, 0.1030037, -1.314724, 1, 1, 1, 1, 1,
-0.5051385, 0.3327017, -0.8536158, 1, 1, 1, 1, 1,
-0.5012559, 1.156585, -0.04188677, 1, 1, 1, 1, 1,
-0.4961904, 1.962961, 1.444436, 1, 1, 1, 1, 1,
-0.4948206, 1.600968, 1.838099, 1, 1, 1, 1, 1,
-0.4920296, 1.7447, 0.5354322, 1, 1, 1, 1, 1,
-0.490853, -0.2303737, -0.8659849, 1, 1, 1, 1, 1,
-0.4883566, 0.6258046, -0.2844636, 1, 1, 1, 1, 1,
-0.4868926, -1.258796, -0.7285986, 1, 1, 1, 1, 1,
-0.4852379, -1.458531, -2.735036, 1, 1, 1, 1, 1,
-0.4816107, -0.3793221, -3.229616, 1, 1, 1, 1, 1,
-0.4786364, -0.7950506, -2.745939, 1, 1, 1, 1, 1,
-0.4778259, 1.793985, 0.005814714, 1, 1, 1, 1, 1,
-0.4763856, 0.2280467, -0.8253501, 1, 1, 1, 1, 1,
-0.474275, 0.5570387, -0.5906356, 1, 1, 1, 1, 1,
-0.4734787, -1.922226, -2.886548, 0, 0, 1, 1, 1,
-0.4639184, 1.200424, -1.239481, 1, 0, 0, 1, 1,
-0.4604063, -1.406612, -3.434026, 1, 0, 0, 1, 1,
-0.451649, -0.7402924, -1.717992, 1, 0, 0, 1, 1,
-0.4471295, -0.7555878, -3.332988, 1, 0, 0, 1, 1,
-0.4354017, -1.237088, -3.345809, 1, 0, 0, 1, 1,
-0.4345925, 0.7173176, 0.304911, 0, 0, 0, 1, 1,
-0.4336392, 0.6855936, -0.6806323, 0, 0, 0, 1, 1,
-0.4327275, 0.2399039, -0.152336, 0, 0, 0, 1, 1,
-0.431574, 0.09491947, -2.114902, 0, 0, 0, 1, 1,
-0.430786, -0.006513, -3.898677, 0, 0, 0, 1, 1,
-0.4300801, -2.086986, -1.523842, 0, 0, 0, 1, 1,
-0.4274333, 0.4503405, 0.147481, 0, 0, 0, 1, 1,
-0.4266794, -0.9572905, -4.092819, 1, 1, 1, 1, 1,
-0.4262126, 0.6743959, -2.225932, 1, 1, 1, 1, 1,
-0.4214147, -0.1717393, -1.686996, 1, 1, 1, 1, 1,
-0.4212055, -0.2767956, -2.746475, 1, 1, 1, 1, 1,
-0.4178807, -2.405362, -3.095939, 1, 1, 1, 1, 1,
-0.4119391, 1.5739, 1.078018, 1, 1, 1, 1, 1,
-0.4065203, -0.4787062, -1.38649, 1, 1, 1, 1, 1,
-0.4051943, 0.5095323, 1.076994, 1, 1, 1, 1, 1,
-0.4046862, -0.2311871, -2.048373, 1, 1, 1, 1, 1,
-0.4036537, 0.04645169, -0.8410498, 1, 1, 1, 1, 1,
-0.4000359, -0.4829327, -2.873975, 1, 1, 1, 1, 1,
-0.3912002, 0.6669149, -1.042693, 1, 1, 1, 1, 1,
-0.387194, 1.698449, -0.2867664, 1, 1, 1, 1, 1,
-0.3819733, 1.19409, -0.8789436, 1, 1, 1, 1, 1,
-0.379948, -0.2346652, -3.606534, 1, 1, 1, 1, 1,
-0.3794408, 0.825965, -1.470283, 0, 0, 1, 1, 1,
-0.3783175, -0.2060221, -2.234844, 1, 0, 0, 1, 1,
-0.3781137, 1.409353, -1.610837, 1, 0, 0, 1, 1,
-0.3762501, -0.1409066, -0.3593257, 1, 0, 0, 1, 1,
-0.3673734, -0.3999221, -3.838148, 1, 0, 0, 1, 1,
-0.366859, 2.562844, -0.3008457, 1, 0, 0, 1, 1,
-0.3667309, 0.1386858, -1.741321, 0, 0, 0, 1, 1,
-0.3653422, -1.292585, -2.620893, 0, 0, 0, 1, 1,
-0.3648461, 0.7291735, -0.4088624, 0, 0, 0, 1, 1,
-0.3627626, 0.7642436, 0.6631593, 0, 0, 0, 1, 1,
-0.361681, 0.6849162, 0.7318357, 0, 0, 0, 1, 1,
-0.3605022, -0.4925035, -3.501961, 0, 0, 0, 1, 1,
-0.3604535, -0.9216872, -2.116443, 0, 0, 0, 1, 1,
-0.3588307, -0.6151409, -3.664462, 1, 1, 1, 1, 1,
-0.3578131, 1.308288, -1.602924, 1, 1, 1, 1, 1,
-0.3565287, 0.1351683, -1.830858, 1, 1, 1, 1, 1,
-0.3565242, -0.5474141, -3.619356, 1, 1, 1, 1, 1,
-0.3560529, -0.1899906, -2.344514, 1, 1, 1, 1, 1,
-0.3434044, -1.397451, -2.321379, 1, 1, 1, 1, 1,
-0.343349, -0.01517125, -1.806436, 1, 1, 1, 1, 1,
-0.3389822, -1.381405, -1.636124, 1, 1, 1, 1, 1,
-0.3361943, 1.585587, -1.119797, 1, 1, 1, 1, 1,
-0.3312284, -0.8084595, -2.354243, 1, 1, 1, 1, 1,
-0.3306637, -0.07894729, -3.203722, 1, 1, 1, 1, 1,
-0.3290125, 0.9674565, -1.140337, 1, 1, 1, 1, 1,
-0.3281831, -1.145008, -2.820372, 1, 1, 1, 1, 1,
-0.3273202, -0.4614568, -3.022571, 1, 1, 1, 1, 1,
-0.3254935, 0.183904, -0.2977575, 1, 1, 1, 1, 1,
-0.3190952, -0.5702221, -3.713896, 0, 0, 1, 1, 1,
-0.3153037, -0.3367964, -0.01320969, 1, 0, 0, 1, 1,
-0.31253, -0.2339659, -3.111837, 1, 0, 0, 1, 1,
-0.304726, -1.005851, -2.293885, 1, 0, 0, 1, 1,
-0.302674, -0.5409393, -1.535861, 1, 0, 0, 1, 1,
-0.297365, 0.336795, -0.3036588, 1, 0, 0, 1, 1,
-0.2952231, -0.3203963, -2.3855, 0, 0, 0, 1, 1,
-0.2947089, 0.3552668, 0.7362786, 0, 0, 0, 1, 1,
-0.2939888, 0.0873664, -1.629603, 0, 0, 0, 1, 1,
-0.2931129, -1.923163, -0.9455189, 0, 0, 0, 1, 1,
-0.289732, -0.6540753, -3.271066, 0, 0, 0, 1, 1,
-0.2894403, 1.100966, 1.103484, 0, 0, 0, 1, 1,
-0.2867519, -0.548141, -5.18518, 0, 0, 0, 1, 1,
-0.2843213, 0.9523172, -0.3075883, 1, 1, 1, 1, 1,
-0.2763275, 0.4172794, -0.5868384, 1, 1, 1, 1, 1,
-0.2747525, 1.8741, 0.5186625, 1, 1, 1, 1, 1,
-0.2700468, -1.367652, -2.879112, 1, 1, 1, 1, 1,
-0.2677731, -0.3991436, -3.366474, 1, 1, 1, 1, 1,
-0.261543, -0.559595, -1.980793, 1, 1, 1, 1, 1,
-0.2611207, 1.074338, -1.175305, 1, 1, 1, 1, 1,
-0.257194, -0.1126713, -2.164587, 1, 1, 1, 1, 1,
-0.2556097, -0.1722845, -1.190777, 1, 1, 1, 1, 1,
-0.2487986, 0.6856676, -0.6507884, 1, 1, 1, 1, 1,
-0.2473653, -0.7755185, -2.672066, 1, 1, 1, 1, 1,
-0.2437988, -0.3954561, -3.405259, 1, 1, 1, 1, 1,
-0.2390039, -0.3169274, -2.250088, 1, 1, 1, 1, 1,
-0.2379252, 1.237194, 0.3398762, 1, 1, 1, 1, 1,
-0.2311392, -0.5697215, -3.821056, 1, 1, 1, 1, 1,
-0.228938, 1.092166, 0.5583755, 0, 0, 1, 1, 1,
-0.2289344, 0.7610281, -1.918858, 1, 0, 0, 1, 1,
-0.2257083, -1.215897, -2.798335, 1, 0, 0, 1, 1,
-0.2232865, -0.4203833, -1.660485, 1, 0, 0, 1, 1,
-0.2227692, 0.0533223, -0.1568891, 1, 0, 0, 1, 1,
-0.2188766, -1.167292, -4.850717, 1, 0, 0, 1, 1,
-0.2160054, -1.146386, -2.952919, 0, 0, 0, 1, 1,
-0.2145773, 0.7798397, 0.3180784, 0, 0, 0, 1, 1,
-0.2099605, -1.014467, -0.05338279, 0, 0, 0, 1, 1,
-0.2091812, 0.4028654, -0.8031879, 0, 0, 0, 1, 1,
-0.2077727, 0.7129785, -0.6765223, 0, 0, 0, 1, 1,
-0.2014296, -0.9974045, -1.715573, 0, 0, 0, 1, 1,
-0.1987197, -0.08231737, -3.024586, 0, 0, 0, 1, 1,
-0.1986088, -0.9151306, -1.795913, 1, 1, 1, 1, 1,
-0.1979653, 0.8900819, -0.01005148, 1, 1, 1, 1, 1,
-0.1977953, 0.2879956, -1.753753, 1, 1, 1, 1, 1,
-0.1962349, -1.164529, -2.193734, 1, 1, 1, 1, 1,
-0.1921503, 1.285842, 0.05117798, 1, 1, 1, 1, 1,
-0.1912758, -0.1261849, -2.688855, 1, 1, 1, 1, 1,
-0.1883382, -1.024024, -2.031765, 1, 1, 1, 1, 1,
-0.1880801, -1.52654, -3.183928, 1, 1, 1, 1, 1,
-0.1808255, 1.956255, 0.2969019, 1, 1, 1, 1, 1,
-0.179611, 1.397368, 0.2592789, 1, 1, 1, 1, 1,
-0.1791404, -0.4204857, -2.658073, 1, 1, 1, 1, 1,
-0.1680902, 0.2563199, -0.07999996, 1, 1, 1, 1, 1,
-0.1625192, -0.07108971, -1.611635, 1, 1, 1, 1, 1,
-0.1578213, -0.1710082, -4.819308, 1, 1, 1, 1, 1,
-0.1575253, -0.6846231, -4.491935, 1, 1, 1, 1, 1,
-0.1527074, -1.254891, -2.78066, 0, 0, 1, 1, 1,
-0.1520088, -0.5105878, -1.445606, 1, 0, 0, 1, 1,
-0.1498486, 0.3780006, -0.8148181, 1, 0, 0, 1, 1,
-0.1498082, -0.8728096, -4.203542, 1, 0, 0, 1, 1,
-0.1495311, -0.72945, -4.408601, 1, 0, 0, 1, 1,
-0.1483664, -0.5074782, -2.982949, 1, 0, 0, 1, 1,
-0.1457404, -0.6979618, -4.318838, 0, 0, 0, 1, 1,
-0.1455852, 1.178625, -0.08832464, 0, 0, 0, 1, 1,
-0.1417738, -0.4849255, -1.357126, 0, 0, 0, 1, 1,
-0.1354119, 0.7909295, -0.3946579, 0, 0, 0, 1, 1,
-0.1349251, -0.4062595, -4.200772, 0, 0, 0, 1, 1,
-0.1317623, 0.05643267, -0.7964835, 0, 0, 0, 1, 1,
-0.1259884, 0.962128, -0.1981947, 0, 0, 0, 1, 1,
-0.1253855, 1.620746, -0.2277739, 1, 1, 1, 1, 1,
-0.1246417, -0.2507848, -4.354073, 1, 1, 1, 1, 1,
-0.1237058, -0.4302239, -1.66476, 1, 1, 1, 1, 1,
-0.1219685, -1.281106, -3.317832, 1, 1, 1, 1, 1,
-0.1210088, -2.861869, -3.31366, 1, 1, 1, 1, 1,
-0.1200651, 0.3581161, -0.170573, 1, 1, 1, 1, 1,
-0.1102549, -1.193951, -3.337002, 1, 1, 1, 1, 1,
-0.1099936, -0.7404262, -2.326707, 1, 1, 1, 1, 1,
-0.1097979, -1.41629, -2.428314, 1, 1, 1, 1, 1,
-0.1044066, -1.643611, -2.558867, 1, 1, 1, 1, 1,
-0.1018908, 0.9483272, -0.5918, 1, 1, 1, 1, 1,
-0.1007973, 0.486797, -0.4199737, 1, 1, 1, 1, 1,
-0.1000884, 0.5573158, -1.221279, 1, 1, 1, 1, 1,
-0.09915468, -0.636498, -2.381855, 1, 1, 1, 1, 1,
-0.09553458, 2.036874, 0.9866389, 1, 1, 1, 1, 1,
-0.09297588, 1.056048, -0.5718107, 0, 0, 1, 1, 1,
-0.09287658, -0.8087982, -3.008347, 1, 0, 0, 1, 1,
-0.092833, 1.095645, 2.118902, 1, 0, 0, 1, 1,
-0.09227902, 1.374339, 2.701572, 1, 0, 0, 1, 1,
-0.0868829, 1.023664, -0.5576908, 1, 0, 0, 1, 1,
-0.07502545, -1.237138, -1.506578, 1, 0, 0, 1, 1,
-0.0748692, -2.761444, -2.179762, 0, 0, 0, 1, 1,
-0.07439435, -1.810029, -1.983657, 0, 0, 0, 1, 1,
-0.06857539, 0.2238132, 1.015577, 0, 0, 0, 1, 1,
-0.06825406, -0.5105507, -5.117059, 0, 0, 0, 1, 1,
-0.06604394, -0.3438362, -3.373971, 0, 0, 0, 1, 1,
-0.06541618, 0.1882207, -0.4298078, 0, 0, 0, 1, 1,
-0.06108285, 1.390761, 0.9333417, 0, 0, 0, 1, 1,
-0.06043031, 1.614286, 0.1136384, 1, 1, 1, 1, 1,
-0.05575189, 1.066348, 0.7082673, 1, 1, 1, 1, 1,
-0.05280021, 0.1065416, -1.221563, 1, 1, 1, 1, 1,
-0.04891941, 0.2428279, -0.715979, 1, 1, 1, 1, 1,
-0.04603943, -1.976766, -1.429989, 1, 1, 1, 1, 1,
-0.04226085, -1.45491, -2.823302, 1, 1, 1, 1, 1,
-0.03854437, 1.464812, -0.1625535, 1, 1, 1, 1, 1,
-0.03481166, -1.139592, -5.087475, 1, 1, 1, 1, 1,
-0.03437539, -0.7153883, -3.094034, 1, 1, 1, 1, 1,
-0.03229014, -2.206627, -4.024846, 1, 1, 1, 1, 1,
-0.03213933, -0.4102758, -3.160655, 1, 1, 1, 1, 1,
-0.02831266, 1.123904, -1.133308, 1, 1, 1, 1, 1,
-0.02223823, -1.272723, -4.334604, 1, 1, 1, 1, 1,
-0.020592, 1.310357, -0.4610353, 1, 1, 1, 1, 1,
-0.02012517, -0.2572292, -3.932256, 1, 1, 1, 1, 1,
-0.01968163, -0.4094171, -2.425001, 0, 0, 1, 1, 1,
-0.01406026, -0.7927896, -3.565953, 1, 0, 0, 1, 1,
-0.007847939, 2.605484, -1.067369, 1, 0, 0, 1, 1,
-0.004961052, -0.1277695, -2.29492, 1, 0, 0, 1, 1,
-0.001320928, -1.045246, -4.853348, 1, 0, 0, 1, 1,
-0.0006325373, 1.557222, 0.3206368, 1, 0, 0, 1, 1,
-0.0003773671, -0.4389786, -1.047031, 0, 0, 0, 1, 1,
0.0004314079, -0.5781341, 1.859864, 0, 0, 0, 1, 1,
0.003864524, 1.769609, -0.3470266, 0, 0, 0, 1, 1,
0.004460865, 0.2832167, -0.4357464, 0, 0, 0, 1, 1,
0.01156407, -0.9816849, 3.312626, 0, 0, 0, 1, 1,
0.01409635, -0.6371788, 3.519512, 0, 0, 0, 1, 1,
0.01647462, -0.348951, 2.475569, 0, 0, 0, 1, 1,
0.02053221, 1.872408, -0.9206832, 1, 1, 1, 1, 1,
0.02194441, -0.6816365, 3.745584, 1, 1, 1, 1, 1,
0.02414422, -0.1570532, 4.008722, 1, 1, 1, 1, 1,
0.02886588, 1.322952, -0.02269699, 1, 1, 1, 1, 1,
0.0310072, 0.1882056, -0.3099433, 1, 1, 1, 1, 1,
0.04232825, -1.150812, 4.020379, 1, 1, 1, 1, 1,
0.04619909, 1.865823, -0.83176, 1, 1, 1, 1, 1,
0.04650896, -0.9842092, 3.625709, 1, 1, 1, 1, 1,
0.04717158, 0.4010279, -0.6837748, 1, 1, 1, 1, 1,
0.05011672, 0.07466344, 0.3579659, 1, 1, 1, 1, 1,
0.05049467, 1.242798, 0.5639068, 1, 1, 1, 1, 1,
0.05087543, 1.128975, 0.1328847, 1, 1, 1, 1, 1,
0.05161061, 0.9182355, 0.1369163, 1, 1, 1, 1, 1,
0.05728738, -0.8272141, 2.139207, 1, 1, 1, 1, 1,
0.05814797, 0.8418459, 2.082074, 1, 1, 1, 1, 1,
0.05834375, -1.976878, 1.557017, 0, 0, 1, 1, 1,
0.0604311, 0.2151142, 0.02371503, 1, 0, 0, 1, 1,
0.06093989, -1.29542, 2.197427, 1, 0, 0, 1, 1,
0.06228559, -1.129259, 4.176025, 1, 0, 0, 1, 1,
0.06293534, -0.9296113, 2.565981, 1, 0, 0, 1, 1,
0.06435943, -1.623094, 2.450316, 1, 0, 0, 1, 1,
0.06515453, 1.200647, 0.3717142, 0, 0, 0, 1, 1,
0.0652414, 1.334936, 0.7484375, 0, 0, 0, 1, 1,
0.06663616, -0.6370311, 5.277192, 0, 0, 0, 1, 1,
0.06790479, -1.290831, 2.883855, 0, 0, 0, 1, 1,
0.07358368, 0.7590556, -2.1712, 0, 0, 0, 1, 1,
0.07465953, -0.961121, 4.028661, 0, 0, 0, 1, 1,
0.08164062, -0.6557035, 1.829756, 0, 0, 0, 1, 1,
0.08236858, -0.6475296, 3.12233, 1, 1, 1, 1, 1,
0.08447412, -0.2673237, 2.841556, 1, 1, 1, 1, 1,
0.08755323, -0.9568717, 3.286364, 1, 1, 1, 1, 1,
0.09029619, 0.1287105, -0.1620099, 1, 1, 1, 1, 1,
0.09652171, -0.5870221, 3.248232, 1, 1, 1, 1, 1,
0.09925038, -0.6053079, 0.5128137, 1, 1, 1, 1, 1,
0.1014367, 0.0229387, 0.3455065, 1, 1, 1, 1, 1,
0.107751, -1.099647, 2.693318, 1, 1, 1, 1, 1,
0.1078905, 0.7957584, 0.1804783, 1, 1, 1, 1, 1,
0.1080408, 0.02059219, 2.667981, 1, 1, 1, 1, 1,
0.1114384, 1.64436, -0.7937918, 1, 1, 1, 1, 1,
0.112306, -1.289677, 1.427302, 1, 1, 1, 1, 1,
0.1130316, 0.508319, 0.09031888, 1, 1, 1, 1, 1,
0.1139265, -1.909693, 2.345628, 1, 1, 1, 1, 1,
0.119436, -0.1291385, 2.965109, 1, 1, 1, 1, 1,
0.1195662, -0.3549943, 4.380009, 0, 0, 1, 1, 1,
0.1215934, 0.4705216, 2.250653, 1, 0, 0, 1, 1,
0.124303, 0.4483102, 1.369524, 1, 0, 0, 1, 1,
0.1268968, 0.02671102, 0.7845636, 1, 0, 0, 1, 1,
0.127424, -0.3011583, 2.122124, 1, 0, 0, 1, 1,
0.1307965, -0.6449308, 3.73826, 1, 0, 0, 1, 1,
0.1332516, -2.168914, 2.311476, 0, 0, 0, 1, 1,
0.1365112, -1.054183, 2.380838, 0, 0, 0, 1, 1,
0.1413958, -0.6228105, 1.826004, 0, 0, 0, 1, 1,
0.1420519, 0.8255451, -1.94384, 0, 0, 0, 1, 1,
0.1465246, -0.2601151, 2.590784, 0, 0, 0, 1, 1,
0.1482795, -0.5355921, 2.620616, 0, 0, 0, 1, 1,
0.1494074, -1.242311, 3.598471, 0, 0, 0, 1, 1,
0.1522184, -0.5502719, 2.024645, 1, 1, 1, 1, 1,
0.1530134, -0.8360959, 2.405108, 1, 1, 1, 1, 1,
0.1534322, -0.5797831, 3.099211, 1, 1, 1, 1, 1,
0.153541, 0.3389204, 0.2524409, 1, 1, 1, 1, 1,
0.1628759, -1.096569, 5.995241, 1, 1, 1, 1, 1,
0.1661702, -0.4113747, 1.808038, 1, 1, 1, 1, 1,
0.1701809, 0.2651295, 1.729285, 1, 1, 1, 1, 1,
0.173175, 0.8868337, 0.5894635, 1, 1, 1, 1, 1,
0.1741447, -0.350967, 5.476277, 1, 1, 1, 1, 1,
0.1826375, 2.194452, 0.874911, 1, 1, 1, 1, 1,
0.1859597, -2.872592, 3.115672, 1, 1, 1, 1, 1,
0.1901617, 0.9726105, -1.228781, 1, 1, 1, 1, 1,
0.1906147, 0.4979048, 0.4609548, 1, 1, 1, 1, 1,
0.1933404, -0.5018334, 2.618655, 1, 1, 1, 1, 1,
0.1957424, -0.8910888, 3.895872, 1, 1, 1, 1, 1,
0.1974152, 0.5303811, 1.842871, 0, 0, 1, 1, 1,
0.1997852, -0.4485891, 0.9419802, 1, 0, 0, 1, 1,
0.2044741, 1.227566, 1.943969, 1, 0, 0, 1, 1,
0.206449, 0.1435858, -0.740903, 1, 0, 0, 1, 1,
0.2070642, 0.9053347, -1.01071, 1, 0, 0, 1, 1,
0.2113117, -1.175261, 2.250112, 1, 0, 0, 1, 1,
0.2133033, -1.222312, 2.879955, 0, 0, 0, 1, 1,
0.2166788, 0.6529048, 0.5229803, 0, 0, 0, 1, 1,
0.2167956, 0.04153254, 2.289076, 0, 0, 0, 1, 1,
0.2204488, -0.9532432, 2.249487, 0, 0, 0, 1, 1,
0.2215848, 0.2325322, 0.4227687, 0, 0, 0, 1, 1,
0.2251985, 0.3361256, 0.4936362, 0, 0, 0, 1, 1,
0.2259921, 0.5454133, 0.7884785, 0, 0, 0, 1, 1,
0.2263413, 0.6006441, 0.4046603, 1, 1, 1, 1, 1,
0.2282443, -0.7028943, 2.056869, 1, 1, 1, 1, 1,
0.2292609, 0.2383105, 1.900311, 1, 1, 1, 1, 1,
0.2293929, -0.1870134, 2.70111, 1, 1, 1, 1, 1,
0.2304651, -0.33008, 2.222807, 1, 1, 1, 1, 1,
0.2305866, -2.450077, 5.087693, 1, 1, 1, 1, 1,
0.2314976, 0.5824561, 1.561397, 1, 1, 1, 1, 1,
0.2315069, 1.035792, -0.1677142, 1, 1, 1, 1, 1,
0.2344317, -0.7633433, 0.563595, 1, 1, 1, 1, 1,
0.2359047, -0.103259, 1.774914, 1, 1, 1, 1, 1,
0.2378666, 1.589981, 1.973945, 1, 1, 1, 1, 1,
0.2440025, 0.647099, -0.1180601, 1, 1, 1, 1, 1,
0.2474308, 0.6920989, 1.637879, 1, 1, 1, 1, 1,
0.2495154, 0.9514545, 0.1115517, 1, 1, 1, 1, 1,
0.2521404, -0.7300563, 3.044017, 1, 1, 1, 1, 1,
0.2529413, -0.1867903, 3.152247, 0, 0, 1, 1, 1,
0.2572151, 1.463609, 4.17796, 1, 0, 0, 1, 1,
0.2574559, -0.8540456, 1.400581, 1, 0, 0, 1, 1,
0.2579134, 1.070426, 1.336294, 1, 0, 0, 1, 1,
0.2642044, 0.5456591, 0.7280423, 1, 0, 0, 1, 1,
0.2686748, 0.4271375, -0.9734922, 1, 0, 0, 1, 1,
0.2711858, -1.153362, 1.931855, 0, 0, 0, 1, 1,
0.2724572, 1.001519, 0.5871029, 0, 0, 0, 1, 1,
0.2742396, -0.6911598, 1.909027, 0, 0, 0, 1, 1,
0.2743489, 1.126062, 0.2807951, 0, 0, 0, 1, 1,
0.2775032, 1.260644, 0.5536272, 0, 0, 0, 1, 1,
0.2778791, 0.4484755, -0.362481, 0, 0, 0, 1, 1,
0.2799478, -0.9998344, 3.19044, 0, 0, 0, 1, 1,
0.2813225, -0.2014723, 3.430915, 1, 1, 1, 1, 1,
0.2848606, -1.767501, 1.867342, 1, 1, 1, 1, 1,
0.2888232, -0.06145875, 1.014838, 1, 1, 1, 1, 1,
0.2894871, 0.582324, 3.13975, 1, 1, 1, 1, 1,
0.2932685, -0.5980994, 1.904459, 1, 1, 1, 1, 1,
0.2972194, 1.124518, 0.910737, 1, 1, 1, 1, 1,
0.2972779, 1.151196, -0.1259859, 1, 1, 1, 1, 1,
0.2979353, -0.04104427, 1.681622, 1, 1, 1, 1, 1,
0.2990729, -1.268403, 1.597565, 1, 1, 1, 1, 1,
0.299327, 0.6249772, 2.174852, 1, 1, 1, 1, 1,
0.3007762, -0.8103391, 4.887079, 1, 1, 1, 1, 1,
0.3043453, -0.6982514, 3.302263, 1, 1, 1, 1, 1,
0.3069489, -0.4198466, 2.213854, 1, 1, 1, 1, 1,
0.3133308, -1.304735, 4.896836, 1, 1, 1, 1, 1,
0.3183303, -0.7794811, 2.779477, 1, 1, 1, 1, 1,
0.3250827, -2.085955, 2.875054, 0, 0, 1, 1, 1,
0.3274326, -3.049383, 3.064652, 1, 0, 0, 1, 1,
0.3284426, -2.102988, 3.506985, 1, 0, 0, 1, 1,
0.3380764, -1.922716, 1.948344, 1, 0, 0, 1, 1,
0.3389207, -0.03805684, 2.389076, 1, 0, 0, 1, 1,
0.3412699, 0.2892296, -0.4428675, 1, 0, 0, 1, 1,
0.3414594, 0.6554536, 2.291962, 0, 0, 0, 1, 1,
0.3424974, -0.003464418, 1.411907, 0, 0, 0, 1, 1,
0.3426357, 1.16478, -1.123002, 0, 0, 0, 1, 1,
0.3474921, -0.2962121, 3.569135, 0, 0, 0, 1, 1,
0.3511963, 0.3735088, -0.5449368, 0, 0, 0, 1, 1,
0.3515788, -0.2131731, 1.57174, 0, 0, 0, 1, 1,
0.354086, 1.589393, 0.8228437, 0, 0, 0, 1, 1,
0.3609118, 1.188177, 2.050752, 1, 1, 1, 1, 1,
0.3627942, -0.8927893, 1.510338, 1, 1, 1, 1, 1,
0.3641083, 1.355254, 1.402595, 1, 1, 1, 1, 1,
0.3732325, -2.010993, 4.115094, 1, 1, 1, 1, 1,
0.3734817, -1.48328, 2.183792, 1, 1, 1, 1, 1,
0.3821626, 0.8911076, 0.924108, 1, 1, 1, 1, 1,
0.3905057, -0.1720897, 1.054553, 1, 1, 1, 1, 1,
0.4007881, 0.5415262, 0.2287669, 1, 1, 1, 1, 1,
0.4028656, -2.448107, 2.429988, 1, 1, 1, 1, 1,
0.4053199, 0.08252948, 1.110637, 1, 1, 1, 1, 1,
0.4135652, -0.1045611, 1.079193, 1, 1, 1, 1, 1,
0.4149407, 0.158693, 2.613758, 1, 1, 1, 1, 1,
0.4161048, -0.1571743, 2.902815, 1, 1, 1, 1, 1,
0.4200286, -0.989939, 3.739542, 1, 1, 1, 1, 1,
0.4240482, -1.809237, 2.207227, 1, 1, 1, 1, 1,
0.429559, -1.804509, 1.615702, 0, 0, 1, 1, 1,
0.4297803, -1.361194, 1.750494, 1, 0, 0, 1, 1,
0.4339195, 0.2789668, 1.234746, 1, 0, 0, 1, 1,
0.4344323, 0.3671715, -0.02874525, 1, 0, 0, 1, 1,
0.4384948, 0.2098716, 2.571963, 1, 0, 0, 1, 1,
0.4418302, 0.5604417, -0.567852, 1, 0, 0, 1, 1,
0.4486219, 1.095297, 1.631295, 0, 0, 0, 1, 1,
0.4488786, 0.2838871, 0.1831943, 0, 0, 0, 1, 1,
0.4493234, -0.9174235, 4.847071, 0, 0, 0, 1, 1,
0.4508874, 0.5320436, 0.9052474, 0, 0, 0, 1, 1,
0.451712, -0.1208588, 3.59368, 0, 0, 0, 1, 1,
0.4558727, -0.5885761, 2.907352, 0, 0, 0, 1, 1,
0.4565023, 0.04120009, 1.949564, 0, 0, 0, 1, 1,
0.4589169, -0.9822745, 3.972381, 1, 1, 1, 1, 1,
0.4600661, -1.493449, 1.987241, 1, 1, 1, 1, 1,
0.4603531, -0.7564506, 2.001481, 1, 1, 1, 1, 1,
0.4625804, -0.3568489, 1.216681, 1, 1, 1, 1, 1,
0.4636113, -1.483408, 1.516451, 1, 1, 1, 1, 1,
0.4670398, 1.333784, 2.537973, 1, 1, 1, 1, 1,
0.4674952, -0.05749263, 3.508617, 1, 1, 1, 1, 1,
0.4684225, 0.5832135, 1.222056, 1, 1, 1, 1, 1,
0.4688591, 0.2373408, 1.252383, 1, 1, 1, 1, 1,
0.469947, 1.82462, 0.4410069, 1, 1, 1, 1, 1,
0.4745437, -0.7896394, 4.310245, 1, 1, 1, 1, 1,
0.4767114, 0.8537303, 0.06501636, 1, 1, 1, 1, 1,
0.4782073, -0.7962303, 3.689582, 1, 1, 1, 1, 1,
0.481663, 1.179996, 1.708117, 1, 1, 1, 1, 1,
0.4830506, 1.140443, 0.7877335, 1, 1, 1, 1, 1,
0.4869543, -1.29784, 2.576181, 0, 0, 1, 1, 1,
0.4871163, 0.4461113, -0.03228172, 1, 0, 0, 1, 1,
0.4872211, 0.357364, 1.486122, 1, 0, 0, 1, 1,
0.487285, -1.115326, 1.591244, 1, 0, 0, 1, 1,
0.4874306, -0.5340268, 2.342721, 1, 0, 0, 1, 1,
0.4875869, 1.707033, -0.5898669, 1, 0, 0, 1, 1,
0.4879302, 0.3070404, -0.2529573, 0, 0, 0, 1, 1,
0.4900096, -0.0138568, 2.247181, 0, 0, 0, 1, 1,
0.4905394, -0.7093908, 1.489232, 0, 0, 0, 1, 1,
0.4933394, -0.516266, 2.533371, 0, 0, 0, 1, 1,
0.5000374, -0.7248293, 2.988646, 0, 0, 0, 1, 1,
0.5029461, 0.5070494, -1.28845, 0, 0, 0, 1, 1,
0.5057516, -0.5791276, 0.8405726, 0, 0, 0, 1, 1,
0.5072987, -1.345566, 2.8275, 1, 1, 1, 1, 1,
0.5082546, -0.1239776, 0.7782924, 1, 1, 1, 1, 1,
0.5091509, -0.04228708, 2.170627, 1, 1, 1, 1, 1,
0.509675, -1.011127, 4.684745, 1, 1, 1, 1, 1,
0.5108347, 0.3119825, -1.092023, 1, 1, 1, 1, 1,
0.5110877, -0.927196, 1.659782, 1, 1, 1, 1, 1,
0.5110908, -0.244639, 1.750955, 1, 1, 1, 1, 1,
0.5145567, -0.1011583, 1.430976, 1, 1, 1, 1, 1,
0.5146558, -1.621576, 4.490556, 1, 1, 1, 1, 1,
0.5155789, -0.3947843, 3.09406, 1, 1, 1, 1, 1,
0.5183627, 0.339238, 3.085101, 1, 1, 1, 1, 1,
0.5199825, -1.45144, 2.450017, 1, 1, 1, 1, 1,
0.5215293, 0.8296059, -1.042177, 1, 1, 1, 1, 1,
0.5222288, -0.825667, 2.623863, 1, 1, 1, 1, 1,
0.5224686, -0.6091096, 2.218578, 1, 1, 1, 1, 1,
0.5226519, -0.3989983, 1.616752, 0, 0, 1, 1, 1,
0.5269429, -0.05875633, -0.487607, 1, 0, 0, 1, 1,
0.5269965, 1.484118, 0.8887814, 1, 0, 0, 1, 1,
0.53253, 1.019605, 0.852971, 1, 0, 0, 1, 1,
0.5332349, -0.7353093, 2.024367, 1, 0, 0, 1, 1,
0.5334161, -0.526614, 2.163153, 1, 0, 0, 1, 1,
0.5375625, -0.7020709, 1.408351, 0, 0, 0, 1, 1,
0.5428397, 0.4150229, 1.884996, 0, 0, 0, 1, 1,
0.5429058, -0.608738, 0.9963116, 0, 0, 0, 1, 1,
0.5449355, -1.304326, 3.986555, 0, 0, 0, 1, 1,
0.5477349, 1.205144, 1.653284, 0, 0, 0, 1, 1,
0.5483872, 0.2564363, 0.3869321, 0, 0, 0, 1, 1,
0.5505631, -0.02876338, 1.893684, 0, 0, 0, 1, 1,
0.5533813, 1.353874, 0.5932618, 1, 1, 1, 1, 1,
0.5593321, -0.2029382, 3.266429, 1, 1, 1, 1, 1,
0.5604502, 0.1523758, -0.3452545, 1, 1, 1, 1, 1,
0.5611377, -1.475489, 2.664534, 1, 1, 1, 1, 1,
0.5672905, -0.3739086, 2.82287, 1, 1, 1, 1, 1,
0.5701657, -0.614985, 4.008552, 1, 1, 1, 1, 1,
0.5743821, 0.5854614, 1.83047, 1, 1, 1, 1, 1,
0.5744335, -0.81045, 1.922076, 1, 1, 1, 1, 1,
0.5750124, -0.4195433, 3.767683, 1, 1, 1, 1, 1,
0.5771174, 0.7323005, 1.979273, 1, 1, 1, 1, 1,
0.5776474, -0.8187594, 2.262076, 1, 1, 1, 1, 1,
0.5827813, 1.181687, 0.9289689, 1, 1, 1, 1, 1,
0.5843643, 0.1187286, 0.6105653, 1, 1, 1, 1, 1,
0.5853109, -1.107691, 4.113098, 1, 1, 1, 1, 1,
0.5916136, -0.7099179, 4.031772, 1, 1, 1, 1, 1,
0.5966592, -1.927673, 3.286417, 0, 0, 1, 1, 1,
0.5990986, -0.9682765, 1.563387, 1, 0, 0, 1, 1,
0.5995678, -0.8171154, -0.8962915, 1, 0, 0, 1, 1,
0.6024662, 0.2383793, -0.9597616, 1, 0, 0, 1, 1,
0.618468, 1.251469, 0.1646938, 1, 0, 0, 1, 1,
0.6203868, -1.55632, 1.17303, 1, 0, 0, 1, 1,
0.6294972, -1.340047, 2.885198, 0, 0, 0, 1, 1,
0.6299483, 0.7613313, 0.2333157, 0, 0, 0, 1, 1,
0.6312606, -0.5459532, 0.7497078, 0, 0, 0, 1, 1,
0.6354108, -0.1651607, 1.156131, 0, 0, 0, 1, 1,
0.6399376, -1.17656, 1.161976, 0, 0, 0, 1, 1,
0.6412684, -1.389199, 3.232422, 0, 0, 0, 1, 1,
0.6470129, 0.03282386, 2.172904, 0, 0, 0, 1, 1,
0.6595679, 1.603489, 1.310829, 1, 1, 1, 1, 1,
0.6605167, 0.1501184, 1.327634, 1, 1, 1, 1, 1,
0.6631313, -1.71041, 4.034821, 1, 1, 1, 1, 1,
0.6669901, 1.468829, 1.705504, 1, 1, 1, 1, 1,
0.6691377, 1.081801, 0.1727813, 1, 1, 1, 1, 1,
0.6721784, 1.543102, 1.307983, 1, 1, 1, 1, 1,
0.6784831, -0.4306021, 0.1207335, 1, 1, 1, 1, 1,
0.6797866, 0.4257087, 0.8019031, 1, 1, 1, 1, 1,
0.6814368, 1.163624, 1.803559, 1, 1, 1, 1, 1,
0.681681, 0.2510046, 1.26748, 1, 1, 1, 1, 1,
0.6816811, 1.205471, 0.4526905, 1, 1, 1, 1, 1,
0.6845278, 0.7622831, -0.9905366, 1, 1, 1, 1, 1,
0.6865219, 0.4383292, 1.009574, 1, 1, 1, 1, 1,
0.6896852, -0.5340616, 2.040112, 1, 1, 1, 1, 1,
0.6933213, -0.49761, 0.7151255, 1, 1, 1, 1, 1,
0.7020192, 0.5763854, -0.314748, 0, 0, 1, 1, 1,
0.7043105, 0.7129648, -0.1364451, 1, 0, 0, 1, 1,
0.7145575, 0.7517298, 1.123546, 1, 0, 0, 1, 1,
0.7153957, 0.6811515, -0.2872227, 1, 0, 0, 1, 1,
0.7180352, 0.03304482, 1.473531, 1, 0, 0, 1, 1,
0.7205164, -0.0900889, 1.772099, 1, 0, 0, 1, 1,
0.7217422, 0.06117605, 1.650887, 0, 0, 0, 1, 1,
0.7252517, 0.2153433, 2.817512, 0, 0, 0, 1, 1,
0.7267023, -1.761114, 3.511744, 0, 0, 0, 1, 1,
0.729142, 2.307438, 0.8740196, 0, 0, 0, 1, 1,
0.7316983, 0.6933352, -0.6944963, 0, 0, 0, 1, 1,
0.7357568, 0.07827324, 0.8762304, 0, 0, 0, 1, 1,
0.7466684, 1.182675, -0.1065144, 0, 0, 0, 1, 1,
0.7477441, 1.113472, 0.3133006, 1, 1, 1, 1, 1,
0.7527112, -0.03505461, 2.538371, 1, 1, 1, 1, 1,
0.7540612, -1.33311, 3.127145, 1, 1, 1, 1, 1,
0.7594136, 1.169784, 1.051896, 1, 1, 1, 1, 1,
0.7602393, 1.164009, 1.649127, 1, 1, 1, 1, 1,
0.7628514, 1.027428, -0.5560562, 1, 1, 1, 1, 1,
0.7659331, -1.799955, 1.586829, 1, 1, 1, 1, 1,
0.7678166, -1.068258, 3.235837, 1, 1, 1, 1, 1,
0.7679429, -1.19424, 1.325157, 1, 1, 1, 1, 1,
0.7679868, 0.09374135, 2.93167, 1, 1, 1, 1, 1,
0.7686092, 1.294146, 0.411344, 1, 1, 1, 1, 1,
0.7707459, 2.710929, 0.05360248, 1, 1, 1, 1, 1,
0.7708525, 0.5614144, -0.2738191, 1, 1, 1, 1, 1,
0.7713959, 0.436662, 1.730894, 1, 1, 1, 1, 1,
0.7717377, -1.048955, 2.872428, 1, 1, 1, 1, 1,
0.7750328, 0.7917439, 0.7660704, 0, 0, 1, 1, 1,
0.778267, -0.843376, 3.255228, 1, 0, 0, 1, 1,
0.7886479, -0.2310536, 0.4642548, 1, 0, 0, 1, 1,
0.799616, -0.5631767, 1.382344, 1, 0, 0, 1, 1,
0.7998052, 0.8441581, -1.330841, 1, 0, 0, 1, 1,
0.8053964, 0.8889213, 1.40872, 1, 0, 0, 1, 1,
0.8074887, 0.2385694, 0.8699987, 0, 0, 0, 1, 1,
0.8106307, 0.223158, 1.387241, 0, 0, 0, 1, 1,
0.8126704, 0.2696574, 2.506831, 0, 0, 0, 1, 1,
0.8151728, 0.1073972, 1.259579, 0, 0, 0, 1, 1,
0.8164328, -0.9558676, 3.513551, 0, 0, 0, 1, 1,
0.8200757, 1.092579, -0.5423748, 0, 0, 0, 1, 1,
0.8201781, -1.497427, 1.285477, 0, 0, 0, 1, 1,
0.8241841, -1.291947, 4.169322, 1, 1, 1, 1, 1,
0.8263114, -1.215259, 3.155159, 1, 1, 1, 1, 1,
0.8301731, -0.9858108, 2.200712, 1, 1, 1, 1, 1,
0.8359724, -0.7898912, 1.132646, 1, 1, 1, 1, 1,
0.8360069, 0.2172947, 1.663406, 1, 1, 1, 1, 1,
0.8373204, 0.4061176, 2.892412, 1, 1, 1, 1, 1,
0.8376699, 0.06158986, -0.9047731, 1, 1, 1, 1, 1,
0.838025, -0.965196, 1.385401, 1, 1, 1, 1, 1,
0.8397648, 0.8109604, -0.287152, 1, 1, 1, 1, 1,
0.8425516, -0.02930066, 2.754686, 1, 1, 1, 1, 1,
0.845845, 1.930159, 1.648244, 1, 1, 1, 1, 1,
0.8514955, 1.424299, 0.6400629, 1, 1, 1, 1, 1,
0.8516955, -0.658577, 3.777132, 1, 1, 1, 1, 1,
0.8520556, -0.2523086, 0.9787796, 1, 1, 1, 1, 1,
0.8603104, 0.4128419, 0.9246211, 1, 1, 1, 1, 1,
0.8637966, 0.3393497, 2.250676, 0, 0, 1, 1, 1,
0.865104, -0.1280331, 1.491056, 1, 0, 0, 1, 1,
0.8655329, 0.2950026, 0.385585, 1, 0, 0, 1, 1,
0.8670011, -1.968254, 4.273651, 1, 0, 0, 1, 1,
0.8702853, -0.4578917, 2.537458, 1, 0, 0, 1, 1,
0.8703756, -0.4718181, 1.298226, 1, 0, 0, 1, 1,
0.8723021, -0.0578521, 2.750014, 0, 0, 0, 1, 1,
0.8843903, 0.1203583, 1.503539, 0, 0, 0, 1, 1,
0.8860041, -0.3579924, 0.9044013, 0, 0, 0, 1, 1,
0.8952908, 0.6392587, 1.090961, 0, 0, 0, 1, 1,
0.8962315, -0.4900355, 3.48067, 0, 0, 0, 1, 1,
0.9084983, -0.7748492, 3.274862, 0, 0, 0, 1, 1,
0.9149752, 0.660605, 1.408853, 0, 0, 0, 1, 1,
0.9156815, -0.7782432, 2.100497, 1, 1, 1, 1, 1,
0.9229362, 0.6025977, 2.436118, 1, 1, 1, 1, 1,
0.9270604, 0.2013314, 0.4650342, 1, 1, 1, 1, 1,
0.9292754, 0.3191552, 0.8227279, 1, 1, 1, 1, 1,
0.9389913, -0.312897, 0.05309904, 1, 1, 1, 1, 1,
0.9426296, 0.2519181, 1.95814, 1, 1, 1, 1, 1,
0.9432807, -0.2324271, 1.018497, 1, 1, 1, 1, 1,
0.9437086, -0.4150394, 1.904238, 1, 1, 1, 1, 1,
0.9453674, 2.16494, 0.3594889, 1, 1, 1, 1, 1,
0.9574031, -2.329872, 2.813563, 1, 1, 1, 1, 1,
0.9576494, 1.66135, 2.341944, 1, 1, 1, 1, 1,
0.9585882, -0.9435262, 1.971083, 1, 1, 1, 1, 1,
0.9607775, 0.4958692, 0.1728512, 1, 1, 1, 1, 1,
0.9618244, -0.09600403, 0.08501618, 1, 1, 1, 1, 1,
0.971194, 1.693353, 0.02336085, 1, 1, 1, 1, 1,
0.9745442, 1.876792, -1.178569, 0, 0, 1, 1, 1,
0.9920354, 1.219217, 0.7713255, 1, 0, 0, 1, 1,
0.9954777, 0.04263087, 2.095913, 1, 0, 0, 1, 1,
1.000651, 0.5194699, 0.8026986, 1, 0, 0, 1, 1,
1.001785, -0.02853518, 1.565134, 1, 0, 0, 1, 1,
1.006115, -0.8262991, 1.357168, 1, 0, 0, 1, 1,
1.008545, -0.3540951, 1.194965, 0, 0, 0, 1, 1,
1.012243, 0.6631173, 0.6324462, 0, 0, 0, 1, 1,
1.014723, 0.798788, 2.102103, 0, 0, 0, 1, 1,
1.020489, -1.220275, 2.243635, 0, 0, 0, 1, 1,
1.0226, 0.4592821, 1.657492, 0, 0, 0, 1, 1,
1.023835, 0.8311913, 2.403333, 0, 0, 0, 1, 1,
1.028254, -0.1943981, 1.574812, 0, 0, 0, 1, 1,
1.029547, -0.3377493, 0.7794629, 1, 1, 1, 1, 1,
1.032492, -1.110878, 2.50586, 1, 1, 1, 1, 1,
1.042801, -0.135434, 0.2142651, 1, 1, 1, 1, 1,
1.043934, 0.4628284, 2.439409, 1, 1, 1, 1, 1,
1.045707, -0.05899209, 2.749983, 1, 1, 1, 1, 1,
1.049244, -1.694492, 4.009071, 1, 1, 1, 1, 1,
1.04953, -0.1482125, 0.9305332, 1, 1, 1, 1, 1,
1.055409, 1.333283, 0.9971349, 1, 1, 1, 1, 1,
1.056759, -0.2683012, 2.233035, 1, 1, 1, 1, 1,
1.058763, 0.230827, 1.779118, 1, 1, 1, 1, 1,
1.065386, -0.8679968, 1.598563, 1, 1, 1, 1, 1,
1.065947, 0.8702166, 1.517781, 1, 1, 1, 1, 1,
1.067299, 1.494452, 0.8764811, 1, 1, 1, 1, 1,
1.071429, 2.375038, 1.165298, 1, 1, 1, 1, 1,
1.077235, 2.277658, 0.5771301, 1, 1, 1, 1, 1,
1.078614, 0.8489991, -0.4254396, 0, 0, 1, 1, 1,
1.081725, -0.07354949, 2.874303, 1, 0, 0, 1, 1,
1.087532, -1.860865, 2.449628, 1, 0, 0, 1, 1,
1.090241, -1.509, 2.551226, 1, 0, 0, 1, 1,
1.093386, 0.3610231, 2.036047, 1, 0, 0, 1, 1,
1.09582, 0.273727, 1.134875, 1, 0, 0, 1, 1,
1.09839, 0.7490107, 0.7293143, 0, 0, 0, 1, 1,
1.117601, 1.586318, 0.5043481, 0, 0, 0, 1, 1,
1.119966, -0.1531607, -0.494949, 0, 0, 0, 1, 1,
1.129177, -1.410677, 1.438546, 0, 0, 0, 1, 1,
1.131735, 1.231288, -1.41359, 0, 0, 0, 1, 1,
1.132047, 0.03536012, 2.556604, 0, 0, 0, 1, 1,
1.134254, 1.631358, 0.1192721, 0, 0, 0, 1, 1,
1.141087, 0.0281997, 2.312961, 1, 1, 1, 1, 1,
1.14115, 0.3261974, -0.07750307, 1, 1, 1, 1, 1,
1.157304, 0.5265999, -0.5682041, 1, 1, 1, 1, 1,
1.161474, -0.09717548, 2.104546, 1, 1, 1, 1, 1,
1.162184, 2.863843, -1.82489, 1, 1, 1, 1, 1,
1.183462, -0.4919539, 1.345116, 1, 1, 1, 1, 1,
1.211212, 0.7224551, 1.093724, 1, 1, 1, 1, 1,
1.211757, 0.45454, 1.821519, 1, 1, 1, 1, 1,
1.21447, 0.7248541, -0.9318646, 1, 1, 1, 1, 1,
1.21798, -0.8917836, 1.725492, 1, 1, 1, 1, 1,
1.218399, -1.598876, 3.579604, 1, 1, 1, 1, 1,
1.219657, 0.3280524, 1.259385, 1, 1, 1, 1, 1,
1.224339, -0.3640792, 2.964768, 1, 1, 1, 1, 1,
1.239919, -1.078464, 4.180998, 1, 1, 1, 1, 1,
1.25721, 2.407184, -1.643013, 1, 1, 1, 1, 1,
1.264061, -1.786927, 1.656957, 0, 0, 1, 1, 1,
1.264741, -0.08060884, 1.264585, 1, 0, 0, 1, 1,
1.266782, 0.1386835, -0.02362928, 1, 0, 0, 1, 1,
1.267794, 0.5445406, 2.268576, 1, 0, 0, 1, 1,
1.286092, -0.8053779, 3.603254, 1, 0, 0, 1, 1,
1.290051, -0.1021306, 0.5376068, 1, 0, 0, 1, 1,
1.291491, -0.003901297, 1.098735, 0, 0, 0, 1, 1,
1.292863, 0.08399335, 2.685532, 0, 0, 0, 1, 1,
1.30319, -0.1968027, 1.094253, 0, 0, 0, 1, 1,
1.304323, -1.548715, 1.080592, 0, 0, 0, 1, 1,
1.315765, 0.7062699, 0.01670816, 0, 0, 0, 1, 1,
1.315978, -0.2917389, 1.476616, 0, 0, 0, 1, 1,
1.327534, 0.8783696, 1.251693, 0, 0, 0, 1, 1,
1.351855, -1.58436, 2.50488, 1, 1, 1, 1, 1,
1.353355, 1.350221, 0.2454251, 1, 1, 1, 1, 1,
1.355804, -0.9745354, 2.363204, 1, 1, 1, 1, 1,
1.368808, 1.563024, 2.67023, 1, 1, 1, 1, 1,
1.375554, 0.5571998, 1.228005, 1, 1, 1, 1, 1,
1.37616, 0.2264797, 1.998505, 1, 1, 1, 1, 1,
1.378262, 0.1841994, 1.78037, 1, 1, 1, 1, 1,
1.390417, -0.9076847, 2.920877, 1, 1, 1, 1, 1,
1.392076, 1.39347, 1.10365, 1, 1, 1, 1, 1,
1.392388, -1.200536, 4.022008, 1, 1, 1, 1, 1,
1.392573, -2.155142, 2.066278, 1, 1, 1, 1, 1,
1.392593, -1.04697, 3.192034, 1, 1, 1, 1, 1,
1.410427, 0.9817485, 1.479091, 1, 1, 1, 1, 1,
1.418373, 0.1685129, 0.1511626, 1, 1, 1, 1, 1,
1.419991, -0.5809306, 1.123103, 1, 1, 1, 1, 1,
1.422832, -0.02886217, 1.960661, 0, 0, 1, 1, 1,
1.42478, -1.336379, 1.70339, 1, 0, 0, 1, 1,
1.426673, -0.02727333, 1.151581, 1, 0, 0, 1, 1,
1.426964, 0.3042094, 2.664865, 1, 0, 0, 1, 1,
1.427464, 1.168301, 1.259035, 1, 0, 0, 1, 1,
1.43898, -0.045486, 2.6579, 1, 0, 0, 1, 1,
1.444473, -0.214177, 2.845633, 0, 0, 0, 1, 1,
1.453522, -0.8019432, 2.763086, 0, 0, 0, 1, 1,
1.465038, 0.1205149, 1.621994, 0, 0, 0, 1, 1,
1.472545, 0.7273762, 0.1385007, 0, 0, 0, 1, 1,
1.484432, 0.7899631, 0.6019179, 0, 0, 0, 1, 1,
1.493085, 0.8741738, 2.307545, 0, 0, 0, 1, 1,
1.493982, -0.9222749, 1.759222, 0, 0, 0, 1, 1,
1.520168, 0.2508832, 0.7763454, 1, 1, 1, 1, 1,
1.534874, -0.5864072, 1.601598, 1, 1, 1, 1, 1,
1.556496, 0.05917722, 1.867844, 1, 1, 1, 1, 1,
1.573331, -0.7697595, 3.683547, 1, 1, 1, 1, 1,
1.582498, 0.4840416, 0.1524478, 1, 1, 1, 1, 1,
1.5883, -0.8922979, 0.6626855, 1, 1, 1, 1, 1,
1.589797, 1.40166, 0.6792563, 1, 1, 1, 1, 1,
1.592052, 0.5297447, 0.52332, 1, 1, 1, 1, 1,
1.593018, -0.5089439, 0.9737706, 1, 1, 1, 1, 1,
1.614354, -0.3759941, 1.4322, 1, 1, 1, 1, 1,
1.617342, -0.1961275, 1.84558, 1, 1, 1, 1, 1,
1.623973, 1.207496, 0.3102311, 1, 1, 1, 1, 1,
1.624819, 0.7229381, 1.083368, 1, 1, 1, 1, 1,
1.630545, 0.9441673, 1.98414, 1, 1, 1, 1, 1,
1.632628, 0.4597522, 2.154857, 1, 1, 1, 1, 1,
1.639127, 0.01313429, 1.433563, 0, 0, 1, 1, 1,
1.653998, 1.078679, -0.07011204, 1, 0, 0, 1, 1,
1.676224, -0.1178707, 0.4080888, 1, 0, 0, 1, 1,
1.684278, 0.6894515, 0.9708785, 1, 0, 0, 1, 1,
1.695018, 1.229463, 1.774304, 1, 0, 0, 1, 1,
1.699713, 0.4974413, 1.496815, 1, 0, 0, 1, 1,
1.741204, -0.1018692, 2.101456, 0, 0, 0, 1, 1,
1.773846, 0.6937653, 3.376465, 0, 0, 0, 1, 1,
1.774915, -1.173517, 2.78771, 0, 0, 0, 1, 1,
1.776746, 1.792374, 0.5017115, 0, 0, 0, 1, 1,
1.795122, -0.9318386, 2.160983, 0, 0, 0, 1, 1,
1.808108, 0.5019327, -0.7131646, 0, 0, 0, 1, 1,
1.823734, 0.9447135, 0.9482888, 0, 0, 0, 1, 1,
1.832534, 0.1552319, 1.97858, 1, 1, 1, 1, 1,
1.841005, -0.7580196, 0.9702052, 1, 1, 1, 1, 1,
1.861525, 0.1354745, 2.456775, 1, 1, 1, 1, 1,
1.872172, -1.507516, 2.473424, 1, 1, 1, 1, 1,
1.88097, -0.7597079, 1.895245, 1, 1, 1, 1, 1,
1.894149, 0.776816, 0.8478718, 1, 1, 1, 1, 1,
1.908504, 0.1303627, 2.15575, 1, 1, 1, 1, 1,
1.928304, 0.6166962, 2.703117, 1, 1, 1, 1, 1,
1.930476, -1.06553, 2.593194, 1, 1, 1, 1, 1,
1.940177, -1.388441, 2.17764, 1, 1, 1, 1, 1,
1.942846, 1.254584, 1.356329, 1, 1, 1, 1, 1,
1.980614, -0.5463522, 1.960473, 1, 1, 1, 1, 1,
2.002479, 1.263033, 0.9621194, 1, 1, 1, 1, 1,
2.010031, 0.718444, 0.09464905, 1, 1, 1, 1, 1,
2.022649, 2.081652, 0.6192711, 1, 1, 1, 1, 1,
2.058762, -0.7102633, 1.015216, 0, 0, 1, 1, 1,
2.075984, -0.2781186, 1.696144, 1, 0, 0, 1, 1,
2.076557, 0.6598479, 0.7214192, 1, 0, 0, 1, 1,
2.129791, 0.1152603, 1.505701, 1, 0, 0, 1, 1,
2.232736, 0.6827843, 0.05764913, 1, 0, 0, 1, 1,
2.283454, 1.609228, -0.7869045, 1, 0, 0, 1, 1,
2.358585, -0.3670353, 1.879483, 0, 0, 0, 1, 1,
2.376587, 2.017247, 0.6482149, 0, 0, 0, 1, 1,
2.381148, 0.2912071, 2.82391, 0, 0, 0, 1, 1,
2.444783, -0.5931286, 1.651751, 0, 0, 0, 1, 1,
2.477297, -0.5032079, 1.63236, 0, 0, 0, 1, 1,
2.49014, 1.090788, 0.4590415, 0, 0, 0, 1, 1,
2.592283, 1.238056, -0.07879378, 0, 0, 0, 1, 1,
2.632979, 0.1285293, 1.282567, 1, 1, 1, 1, 1,
2.667032, 0.3486413, 2.499037, 1, 1, 1, 1, 1,
2.696206, 0.1839735, 0.8856394, 1, 1, 1, 1, 1,
2.763886, 0.5668979, 1.813238, 1, 1, 1, 1, 1,
2.792224, 0.2102616, 0.1113292, 1, 1, 1, 1, 1,
3.198626, 1.250096, 1.897345, 1, 1, 1, 1, 1,
3.25551, -0.2289229, 1.967707, 1, 1, 1, 1, 1
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
var radius = 9.698747;
var distance = 34.06644;
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
mvMatrix.translate( -0.1005752, -0.001142502, -0.4050305 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.06644);
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
