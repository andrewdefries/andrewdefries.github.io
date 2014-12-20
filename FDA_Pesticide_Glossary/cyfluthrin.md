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
-2.764293, -1.16386, -2.383932, 1, 0, 0, 1,
-2.589758, 0.6623408, -1.387037, 1, 0.007843138, 0, 1,
-2.499783, 1.992258, -1.99546, 1, 0.01176471, 0, 1,
-2.419029, 0.9096208, -1.536663, 1, 0.01960784, 0, 1,
-2.415485, 0.2397991, 0.1094675, 1, 0.02352941, 0, 1,
-2.398215, -0.382031, -2.346837, 1, 0.03137255, 0, 1,
-2.32988, -1.141579, -1.260579, 1, 0.03529412, 0, 1,
-2.326008, 0.7036885, -1.448631, 1, 0.04313726, 0, 1,
-2.295473, -0.3667504, -0.3018148, 1, 0.04705882, 0, 1,
-2.262453, -0.2966782, -3.30196, 1, 0.05490196, 0, 1,
-2.256859, -1.07888, -0.5017413, 1, 0.05882353, 0, 1,
-2.164672, 1.455904, -1.193164, 1, 0.06666667, 0, 1,
-2.14194, 0.3213823, -2.620728, 1, 0.07058824, 0, 1,
-2.116903, -1.027987, -2.348744, 1, 0.07843138, 0, 1,
-2.077357, 1.533321, -1.700834, 1, 0.08235294, 0, 1,
-2.0581, -0.2559143, -1.371912, 1, 0.09019608, 0, 1,
-2.04456, 0.2072699, -0.1013002, 1, 0.09411765, 0, 1,
-2.02738, 0.5034645, -2.529332, 1, 0.1019608, 0, 1,
-2.013576, -0.1155037, 0.07562804, 1, 0.1098039, 0, 1,
-1.957252, -1.902906, -2.08297, 1, 0.1137255, 0, 1,
-1.94819, 0.5031114, -2.272734, 1, 0.1215686, 0, 1,
-1.945145, 0.9487826, 0.3934288, 1, 0.1254902, 0, 1,
-1.925947, 0.8388364, -2.166728, 1, 0.1333333, 0, 1,
-1.888422, 1.134113, -0.9645047, 1, 0.1372549, 0, 1,
-1.886062, -1.132546, -2.331438, 1, 0.145098, 0, 1,
-1.848046, -1.46232, -3.070515, 1, 0.1490196, 0, 1,
-1.823885, -0.3255451, -2.432911, 1, 0.1568628, 0, 1,
-1.820993, 0.2413612, -1.819623, 1, 0.1607843, 0, 1,
-1.815312, -0.9102589, -2.672585, 1, 0.1686275, 0, 1,
-1.808028, 0.5343062, -2.494485, 1, 0.172549, 0, 1,
-1.801042, 1.689805, -1.045167, 1, 0.1803922, 0, 1,
-1.786187, -1.222176, -1.95658, 1, 0.1843137, 0, 1,
-1.772746, -0.01912158, -1.078286, 1, 0.1921569, 0, 1,
-1.748847, 2.021021, -1.729394, 1, 0.1960784, 0, 1,
-1.734035, -0.8627542, -1.987962, 1, 0.2039216, 0, 1,
-1.708802, 0.9669987, -1.142864, 1, 0.2117647, 0, 1,
-1.7057, -0.2917455, -1.119499, 1, 0.2156863, 0, 1,
-1.703459, -1.984119, -1.803025, 1, 0.2235294, 0, 1,
-1.694392, 0.3031902, -2.71613, 1, 0.227451, 0, 1,
-1.688843, -1.664039, -2.794232, 1, 0.2352941, 0, 1,
-1.674789, 0.4818858, -1.491052, 1, 0.2392157, 0, 1,
-1.656391, 0.6917986, -2.569396, 1, 0.2470588, 0, 1,
-1.654787, 0.7216222, -1.533671, 1, 0.2509804, 0, 1,
-1.635962, 0.4200993, -0.1351263, 1, 0.2588235, 0, 1,
-1.635066, -0.08023387, -1.232782, 1, 0.2627451, 0, 1,
-1.604961, 0.5662449, -1.439891, 1, 0.2705882, 0, 1,
-1.596503, -1.432992, -3.984758, 1, 0.2745098, 0, 1,
-1.586424, 0.3451718, -2.642004, 1, 0.282353, 0, 1,
-1.562032, -0.472545, -1.419324, 1, 0.2862745, 0, 1,
-1.555494, 0.1308159, -2.417564, 1, 0.2941177, 0, 1,
-1.5496, -0.4953738, -2.800889, 1, 0.3019608, 0, 1,
-1.542936, 2.327056, 1.252968, 1, 0.3058824, 0, 1,
-1.530588, -0.943679, -1.437539, 1, 0.3137255, 0, 1,
-1.524968, -0.005779146, -0.9746366, 1, 0.3176471, 0, 1,
-1.511985, 0.6983972, -0.6857422, 1, 0.3254902, 0, 1,
-1.502399, -0.9344959, -1.114496, 1, 0.3294118, 0, 1,
-1.502312, -0.05725161, -2.199127, 1, 0.3372549, 0, 1,
-1.490243, 1.29616, 0.5884811, 1, 0.3411765, 0, 1,
-1.48397, -1.440813, -1.790253, 1, 0.3490196, 0, 1,
-1.466075, -0.8303359, -0.7127368, 1, 0.3529412, 0, 1,
-1.464638, -1.118877, -1.773666, 1, 0.3607843, 0, 1,
-1.462704, 1.144896, -1.416697, 1, 0.3647059, 0, 1,
-1.4627, -0.03282755, -1.258292, 1, 0.372549, 0, 1,
-1.456394, -1.188616, -1.641635, 1, 0.3764706, 0, 1,
-1.4382, -0.5951379, -2.147063, 1, 0.3843137, 0, 1,
-1.435279, -0.4401065, -1.618507, 1, 0.3882353, 0, 1,
-1.426707, -0.02191153, 0.1512774, 1, 0.3960784, 0, 1,
-1.424949, -1.61596, -2.783378, 1, 0.4039216, 0, 1,
-1.417087, 0.2688834, -3.376816, 1, 0.4078431, 0, 1,
-1.398269, -1.633414, -2.465285, 1, 0.4156863, 0, 1,
-1.395423, -0.06490379, -2.482044, 1, 0.4196078, 0, 1,
-1.395339, 0.07993262, -2.313542, 1, 0.427451, 0, 1,
-1.390949, -0.8144356, -2.128442, 1, 0.4313726, 0, 1,
-1.376921, 0.06447569, -2.196844, 1, 0.4392157, 0, 1,
-1.3713, 0.01924184, -0.2636904, 1, 0.4431373, 0, 1,
-1.371091, -0.2255699, -2.327221, 1, 0.4509804, 0, 1,
-1.368868, -1.461834, -2.919272, 1, 0.454902, 0, 1,
-1.367984, -1.822934, -2.639553, 1, 0.4627451, 0, 1,
-1.367325, 0.3703209, -0.2888612, 1, 0.4666667, 0, 1,
-1.350169, 0.009271035, -2.180513, 1, 0.4745098, 0, 1,
-1.342188, 0.7365947, -1.764704, 1, 0.4784314, 0, 1,
-1.332458, -1.100487, -2.079723, 1, 0.4862745, 0, 1,
-1.326808, -0.3688715, -3.582007, 1, 0.4901961, 0, 1,
-1.315175, 0.8578851, -1.161346, 1, 0.4980392, 0, 1,
-1.312782, -1.044967, -2.578008, 1, 0.5058824, 0, 1,
-1.302136, -0.479077, -2.409458, 1, 0.509804, 0, 1,
-1.300229, -0.5279251, -2.183727, 1, 0.5176471, 0, 1,
-1.288752, -0.2124523, -3.558552, 1, 0.5215687, 0, 1,
-1.288271, -2.183739, -2.815613, 1, 0.5294118, 0, 1,
-1.286093, -0.06316648, -2.944681, 1, 0.5333334, 0, 1,
-1.277, -0.4023379, -1.27327, 1, 0.5411765, 0, 1,
-1.274369, 0.3652195, 0.07649231, 1, 0.5450981, 0, 1,
-1.254903, -1.580607, -1.508944, 1, 0.5529412, 0, 1,
-1.251718, 1.125138, -1.968523, 1, 0.5568628, 0, 1,
-1.237063, 0.4600632, -2.316576, 1, 0.5647059, 0, 1,
-1.235155, -0.4316044, -3.696502, 1, 0.5686275, 0, 1,
-1.228719, -0.03248667, -0.1056703, 1, 0.5764706, 0, 1,
-1.228294, -2.4489, -2.935315, 1, 0.5803922, 0, 1,
-1.223616, 0.1407019, -2.581985, 1, 0.5882353, 0, 1,
-1.222223, 0.7605932, -0.3496469, 1, 0.5921569, 0, 1,
-1.221108, -2.252747, -2.495888, 1, 0.6, 0, 1,
-1.202207, 1.674389, -1.187784, 1, 0.6078432, 0, 1,
-1.201321, -0.3796269, -0.6069204, 1, 0.6117647, 0, 1,
-1.189732, 0.1820705, -2.165631, 1, 0.6196079, 0, 1,
-1.183746, -0.5336782, -2.276665, 1, 0.6235294, 0, 1,
-1.181388, 1.395894, -0.6213841, 1, 0.6313726, 0, 1,
-1.179786, -0.1883228, 1.123307, 1, 0.6352941, 0, 1,
-1.175269, 1.268132, 0.6960537, 1, 0.6431373, 0, 1,
-1.17445, -0.866031, -2.062619, 1, 0.6470588, 0, 1,
-1.168092, -0.7138935, -1.650447, 1, 0.654902, 0, 1,
-1.164884, 0.4465803, -1.085325, 1, 0.6588235, 0, 1,
-1.159478, -0.009039539, -0.8615095, 1, 0.6666667, 0, 1,
-1.157846, -0.08349172, -2.408031, 1, 0.6705883, 0, 1,
-1.157165, -1.150711, -3.496211, 1, 0.6784314, 0, 1,
-1.155848, 0.4125984, -0.9596017, 1, 0.682353, 0, 1,
-1.155078, -0.8741052, -2.809484, 1, 0.6901961, 0, 1,
-1.153674, 0.02201071, -2.326535, 1, 0.6941177, 0, 1,
-1.150292, 0.7107715, 0.1767815, 1, 0.7019608, 0, 1,
-1.146044, 0.8470842, -1.01311, 1, 0.7098039, 0, 1,
-1.140986, -2.091898, -2.21128, 1, 0.7137255, 0, 1,
-1.138283, 0.3007955, -0.5400098, 1, 0.7215686, 0, 1,
-1.137808, 0.605195, 0.8674103, 1, 0.7254902, 0, 1,
-1.129157, 1.276109, 1.164111, 1, 0.7333333, 0, 1,
-1.128701, -0.4128865, -1.889479, 1, 0.7372549, 0, 1,
-1.126413, 0.2376047, -2.07352, 1, 0.7450981, 0, 1,
-1.109381, 1.267689, -1.578833, 1, 0.7490196, 0, 1,
-1.098085, 0.6758984, -0.7706397, 1, 0.7568628, 0, 1,
-1.097677, 0.03777005, -2.33751, 1, 0.7607843, 0, 1,
-1.095214, 0.9777988, -0.703227, 1, 0.7686275, 0, 1,
-1.085042, -0.6507542, -0.4087432, 1, 0.772549, 0, 1,
-1.083589, 0.1505727, -2.075572, 1, 0.7803922, 0, 1,
-1.080754, 0.6810737, -2.003911, 1, 0.7843137, 0, 1,
-1.074808, -1.814971, -3.644132, 1, 0.7921569, 0, 1,
-1.073165, 1.152066, -0.6791625, 1, 0.7960784, 0, 1,
-1.073093, -0.9704478, -1.74196, 1, 0.8039216, 0, 1,
-1.070711, -0.9619048, -1.369996, 1, 0.8117647, 0, 1,
-1.060588, -1.702681, -2.482759, 1, 0.8156863, 0, 1,
-1.060031, -0.5034199, -1.759486, 1, 0.8235294, 0, 1,
-1.057441, 1.787588, -2.573731, 1, 0.827451, 0, 1,
-1.057337, -1.441754, -0.5924036, 1, 0.8352941, 0, 1,
-1.057252, 1.883533, 0.8910044, 1, 0.8392157, 0, 1,
-1.056095, 0.4633183, -0.7773746, 1, 0.8470588, 0, 1,
-1.051482, 0.3110147, -0.8099331, 1, 0.8509804, 0, 1,
-1.050371, -0.1751225, -2.353708, 1, 0.8588235, 0, 1,
-1.047726, 0.7982605, -0.4816278, 1, 0.8627451, 0, 1,
-1.046942, 1.067113, -1.710129, 1, 0.8705882, 0, 1,
-1.041901, 0.3903994, 0.04570159, 1, 0.8745098, 0, 1,
-1.034828, -0.5724185, -2.101799, 1, 0.8823529, 0, 1,
-1.034309, -0.1748018, -1.830884, 1, 0.8862745, 0, 1,
-1.033778, -0.4884752, -3.515493, 1, 0.8941177, 0, 1,
-1.032199, 1.364338, 0.1901008, 1, 0.8980392, 0, 1,
-1.030448, -0.8251018, -2.036299, 1, 0.9058824, 0, 1,
-1.028074, -0.3593943, -1.088492, 1, 0.9137255, 0, 1,
-1.027615, -0.07203554, -2.654644, 1, 0.9176471, 0, 1,
-1.024474, 0.7678449, 0.6747907, 1, 0.9254902, 0, 1,
-1.022938, -0.9076337, -1.691912, 1, 0.9294118, 0, 1,
-1.021636, 0.3378901, 0.2157143, 1, 0.9372549, 0, 1,
-1.019489, 1.5764, -0.2242017, 1, 0.9411765, 0, 1,
-1.017609, -0.455314, -3.464104, 1, 0.9490196, 0, 1,
-1.015011, 0.7665923, -1.840077, 1, 0.9529412, 0, 1,
-1.013946, 0.05788309, 0.1047922, 1, 0.9607843, 0, 1,
-1.004255, -0.8325811, -1.756806, 1, 0.9647059, 0, 1,
-1.000415, 0.9373121, -1.689506, 1, 0.972549, 0, 1,
-0.9897698, -0.8258999, -2.751193, 1, 0.9764706, 0, 1,
-0.9891283, -0.7209297, -3.464056, 1, 0.9843137, 0, 1,
-0.9876425, 0.7764965, 1.43444, 1, 0.9882353, 0, 1,
-0.9865426, 0.1725961, -3.241911, 1, 0.9960784, 0, 1,
-0.9860322, -0.5199241, 0.5143299, 0.9960784, 1, 0, 1,
-0.982195, -0.004810225, -3.369957, 0.9921569, 1, 0, 1,
-0.9757811, -0.1357819, -1.95271, 0.9843137, 1, 0, 1,
-0.9745367, -0.6110553, -2.921997, 0.9803922, 1, 0, 1,
-0.9735175, -1.619365, -0.7847634, 0.972549, 1, 0, 1,
-0.9704151, 0.171862, -0.810423, 0.9686275, 1, 0, 1,
-0.9651318, 1.551763, 2.183618, 0.9607843, 1, 0, 1,
-0.9641654, -0.2218976, -1.657746, 0.9568627, 1, 0, 1,
-0.9636964, -2.310201, -2.929798, 0.9490196, 1, 0, 1,
-0.9620357, 1.541834, -0.2062457, 0.945098, 1, 0, 1,
-0.9611604, -0.4991557, -4.872655, 0.9372549, 1, 0, 1,
-0.9578381, -0.3631992, -1.076558, 0.9333333, 1, 0, 1,
-0.9530221, 0.2514023, -0.07793385, 0.9254902, 1, 0, 1,
-0.9432312, -0.8512363, -1.100882, 0.9215686, 1, 0, 1,
-0.9426721, 1.623247, -0.7122842, 0.9137255, 1, 0, 1,
-0.9408171, -0.01366469, -2.190264, 0.9098039, 1, 0, 1,
-0.9308648, 2.033115, -3.325803, 0.9019608, 1, 0, 1,
-0.9287776, -0.1753502, -2.180855, 0.8941177, 1, 0, 1,
-0.9229105, -0.3967808, -2.867648, 0.8901961, 1, 0, 1,
-0.9223213, 1.874595, -1.010445, 0.8823529, 1, 0, 1,
-0.9206113, -1.129618, -2.114507, 0.8784314, 1, 0, 1,
-0.9170734, -0.1571692, -0.7180736, 0.8705882, 1, 0, 1,
-0.914939, -0.3754848, -1.995739, 0.8666667, 1, 0, 1,
-0.9130864, 0.6457864, -1.67322, 0.8588235, 1, 0, 1,
-0.9096874, -1.881738, 0.4879828, 0.854902, 1, 0, 1,
-0.9040773, 0.1485072, -1.131466, 0.8470588, 1, 0, 1,
-0.8935409, 0.8430979, 0.6923817, 0.8431373, 1, 0, 1,
-0.8886411, -0.3005382, -1.857079, 0.8352941, 1, 0, 1,
-0.8825185, -1.432015, -2.217622, 0.8313726, 1, 0, 1,
-0.8810486, -0.9390127, -2.415688, 0.8235294, 1, 0, 1,
-0.8804321, 1.849548, -3.389342, 0.8196079, 1, 0, 1,
-0.8803301, -1.486065, -4.003168, 0.8117647, 1, 0, 1,
-0.8802225, 1.058147, -1.535681, 0.8078431, 1, 0, 1,
-0.8793507, -1.314137, -3.644561, 0.8, 1, 0, 1,
-0.8768417, -0.3255619, -3.060534, 0.7921569, 1, 0, 1,
-0.8754514, 0.06449583, -2.041614, 0.7882353, 1, 0, 1,
-0.873679, -0.6027181, -1.32299, 0.7803922, 1, 0, 1,
-0.8706359, -1.111802, -1.37539, 0.7764706, 1, 0, 1,
-0.8697122, -2.131206, -3.269168, 0.7686275, 1, 0, 1,
-0.860131, 0.5815101, -0.05680161, 0.7647059, 1, 0, 1,
-0.859695, -0.2627176, -0.9945952, 0.7568628, 1, 0, 1,
-0.8583819, -0.4012193, -1.634642, 0.7529412, 1, 0, 1,
-0.8555349, -1.04248, -3.452542, 0.7450981, 1, 0, 1,
-0.8540448, 1.069003, -2.074862, 0.7411765, 1, 0, 1,
-0.8507884, -0.8585097, -0.575326, 0.7333333, 1, 0, 1,
-0.8375402, -1.459392, -3.863619, 0.7294118, 1, 0, 1,
-0.8358123, -0.5263586, -1.77835, 0.7215686, 1, 0, 1,
-0.832111, -0.2463044, -2.032883, 0.7176471, 1, 0, 1,
-0.826381, -1.449637, -4.399974, 0.7098039, 1, 0, 1,
-0.8115001, 1.49778, -0.310969, 0.7058824, 1, 0, 1,
-0.8083525, -1.109334, -1.871132, 0.6980392, 1, 0, 1,
-0.8038984, 0.65938, 0.5781559, 0.6901961, 1, 0, 1,
-0.8037103, 2.301189, 0.8106546, 0.6862745, 1, 0, 1,
-0.803171, 1.577131, -0.7322953, 0.6784314, 1, 0, 1,
-0.8022484, 0.6778123, -0.8519999, 0.6745098, 1, 0, 1,
-0.7983437, 0.3590494, -1.575253, 0.6666667, 1, 0, 1,
-0.7966881, -1.287757, -1.972072, 0.6627451, 1, 0, 1,
-0.793232, -0.9123948, -2.752455, 0.654902, 1, 0, 1,
-0.7881895, 0.04166683, -1.859334, 0.6509804, 1, 0, 1,
-0.788072, 1.671532, -1.9073, 0.6431373, 1, 0, 1,
-0.7822216, 0.01694191, -2.45542, 0.6392157, 1, 0, 1,
-0.7739735, -0.7880524, -2.335175, 0.6313726, 1, 0, 1,
-0.7703705, -0.2198009, -1.750799, 0.627451, 1, 0, 1,
-0.7692512, -1.010998, -1.600605, 0.6196079, 1, 0, 1,
-0.7643594, -1.755504, -2.011698, 0.6156863, 1, 0, 1,
-0.7604692, -0.1881603, -2.751438, 0.6078432, 1, 0, 1,
-0.7532568, -1.231818, -2.167064, 0.6039216, 1, 0, 1,
-0.7513198, 0.5689717, -1.655058, 0.5960785, 1, 0, 1,
-0.7512589, 0.01320038, -2.847774, 0.5882353, 1, 0, 1,
-0.7477655, -0.1878883, -1.850647, 0.5843138, 1, 0, 1,
-0.7476273, 1.056342, -1.607857, 0.5764706, 1, 0, 1,
-0.7471476, -1.830053, -2.702348, 0.572549, 1, 0, 1,
-0.7462548, 0.3503784, -1.584366, 0.5647059, 1, 0, 1,
-0.7413297, -3.470675, -4.563044, 0.5607843, 1, 0, 1,
-0.7405551, 1.089142, -0.347393, 0.5529412, 1, 0, 1,
-0.7338503, -0.07136712, -1.743304, 0.5490196, 1, 0, 1,
-0.733377, 0.4334849, 0.2431966, 0.5411765, 1, 0, 1,
-0.7213451, -0.505754, -3.796121, 0.5372549, 1, 0, 1,
-0.7205334, -1.108225, -2.167252, 0.5294118, 1, 0, 1,
-0.7197184, 0.2128266, -1.30123, 0.5254902, 1, 0, 1,
-0.7191211, -0.3030371, -0.9133202, 0.5176471, 1, 0, 1,
-0.7094074, -0.5868393, -2.32609, 0.5137255, 1, 0, 1,
-0.7089436, 2.175343, 0.6078451, 0.5058824, 1, 0, 1,
-0.7078722, -1.59549, -1.608918, 0.5019608, 1, 0, 1,
-0.7044804, 1.713056, -0.02668972, 0.4941176, 1, 0, 1,
-0.704466, -0.6470917, -2.515927, 0.4862745, 1, 0, 1,
-0.6949667, -0.04117797, -2.876318, 0.4823529, 1, 0, 1,
-0.693462, 0.01647121, -2.340679, 0.4745098, 1, 0, 1,
-0.6892394, -0.6992564, -2.783125, 0.4705882, 1, 0, 1,
-0.6879203, -1.023324, -2.387144, 0.4627451, 1, 0, 1,
-0.6856095, -0.4235296, -1.402811, 0.4588235, 1, 0, 1,
-0.6847001, 0.4930161, -1.763919, 0.4509804, 1, 0, 1,
-0.6823252, -0.6458407, -3.057939, 0.4470588, 1, 0, 1,
-0.6820037, 1.0417, 0.361828, 0.4392157, 1, 0, 1,
-0.6758056, -0.2708845, -2.08007, 0.4352941, 1, 0, 1,
-0.6753833, -0.3942882, -1.913333, 0.427451, 1, 0, 1,
-0.6744944, -3.567986, -2.556877, 0.4235294, 1, 0, 1,
-0.6706814, -1.200188, -1.344137, 0.4156863, 1, 0, 1,
-0.6685374, 0.5294075, -0.278022, 0.4117647, 1, 0, 1,
-0.6613846, -0.0755875, -1.026703, 0.4039216, 1, 0, 1,
-0.6601723, 0.169335, -0.5911009, 0.3960784, 1, 0, 1,
-0.6593105, -0.03076087, -1.518319, 0.3921569, 1, 0, 1,
-0.6543968, -1.344175, -3.060647, 0.3843137, 1, 0, 1,
-0.6534728, 0.8873876, -0.3832245, 0.3803922, 1, 0, 1,
-0.6524896, 0.6496366, 0.2913046, 0.372549, 1, 0, 1,
-0.6497791, -0.1024815, -1.822916, 0.3686275, 1, 0, 1,
-0.6417243, 0.6706473, 0.4435503, 0.3607843, 1, 0, 1,
-0.6397855, -0.4785593, -2.964893, 0.3568628, 1, 0, 1,
-0.639067, -0.02381413, -1.003215, 0.3490196, 1, 0, 1,
-0.6381511, -0.2228564, -1.238813, 0.345098, 1, 0, 1,
-0.6329624, -0.6610978, -2.148143, 0.3372549, 1, 0, 1,
-0.6323158, 1.536322, -0.0618404, 0.3333333, 1, 0, 1,
-0.6277441, 0.5000753, -1.606311, 0.3254902, 1, 0, 1,
-0.6242566, 0.36101, -2.287558, 0.3215686, 1, 0, 1,
-0.6191933, 0.6512476, -2.103005, 0.3137255, 1, 0, 1,
-0.6171823, -0.7411945, -0.6139111, 0.3098039, 1, 0, 1,
-0.6168668, -0.4843197, -1.007947, 0.3019608, 1, 0, 1,
-0.6166348, -1.253698, -3.487194, 0.2941177, 1, 0, 1,
-0.6159143, 1.171562, 0.07136454, 0.2901961, 1, 0, 1,
-0.6138672, -0.2256444, -1.316927, 0.282353, 1, 0, 1,
-0.61326, 0.4292185, -1.065789, 0.2784314, 1, 0, 1,
-0.6119605, -0.1342995, -1.027231, 0.2705882, 1, 0, 1,
-0.6023262, -0.08009601, -1.417243, 0.2666667, 1, 0, 1,
-0.5973136, -0.6851045, -1.816374, 0.2588235, 1, 0, 1,
-0.5883334, -1.815139, -3.129382, 0.254902, 1, 0, 1,
-0.5875441, 0.6977042, -1.484464, 0.2470588, 1, 0, 1,
-0.5808728, 0.4072659, -1.015104, 0.2431373, 1, 0, 1,
-0.5760642, -1.055051, -1.037965, 0.2352941, 1, 0, 1,
-0.5721156, 0.2967895, 0.348552, 0.2313726, 1, 0, 1,
-0.569392, 1.291242, -0.5055736, 0.2235294, 1, 0, 1,
-0.5620734, 0.1319531, 0.1441577, 0.2196078, 1, 0, 1,
-0.5588841, -0.2849427, -1.276012, 0.2117647, 1, 0, 1,
-0.5582228, -0.9530972, -2.513901, 0.2078431, 1, 0, 1,
-0.5559436, -0.7007214, -2.957203, 0.2, 1, 0, 1,
-0.5533276, -1.011216, -2.592599, 0.1921569, 1, 0, 1,
-0.5510792, 0.1035274, -0.8799228, 0.1882353, 1, 0, 1,
-0.5510416, 0.6876683, 0.3637303, 0.1803922, 1, 0, 1,
-0.5467755, -0.7833462, -3.253972, 0.1764706, 1, 0, 1,
-0.5436502, -0.06149794, -1.565081, 0.1686275, 1, 0, 1,
-0.5297105, 0.5964503, 0.06686243, 0.1647059, 1, 0, 1,
-0.5281698, -0.9128408, -2.845338, 0.1568628, 1, 0, 1,
-0.5247976, -0.0003595603, -0.9380614, 0.1529412, 1, 0, 1,
-0.5181362, -1.8444, -1.708226, 0.145098, 1, 0, 1,
-0.5121933, -0.6771951, -3.905543, 0.1411765, 1, 0, 1,
-0.5116304, -1.860053, -2.472185, 0.1333333, 1, 0, 1,
-0.5089611, -1.885925, -2.410741, 0.1294118, 1, 0, 1,
-0.5051313, -0.8177299, -0.8292859, 0.1215686, 1, 0, 1,
-0.4945587, -0.9365014, -2.436013, 0.1176471, 1, 0, 1,
-0.492364, -0.2487888, -1.58923, 0.1098039, 1, 0, 1,
-0.487306, 1.523296, -0.1902066, 0.1058824, 1, 0, 1,
-0.4863212, 2.004131, 0.84698, 0.09803922, 1, 0, 1,
-0.4816552, -0.1482852, -1.195702, 0.09019608, 1, 0, 1,
-0.4798596, -1.244216, -2.176489, 0.08627451, 1, 0, 1,
-0.4791786, -1.105289, -2.656286, 0.07843138, 1, 0, 1,
-0.4748186, 1.29113, 0.01880079, 0.07450981, 1, 0, 1,
-0.4701973, 0.2500611, -0.4975856, 0.06666667, 1, 0, 1,
-0.4694179, 0.6245254, -1.55935, 0.0627451, 1, 0, 1,
-0.4693626, -0.3148369, -2.577168, 0.05490196, 1, 0, 1,
-0.4692474, -0.3987845, -2.84361, 0.05098039, 1, 0, 1,
-0.4691774, -0.7681575, -2.172926, 0.04313726, 1, 0, 1,
-0.4685962, 0.4054503, -0.4782513, 0.03921569, 1, 0, 1,
-0.4675677, 1.075601, 1.106695, 0.03137255, 1, 0, 1,
-0.4649125, 0.5723169, -0.4939866, 0.02745098, 1, 0, 1,
-0.4642305, -0.950316, -4.073484, 0.01960784, 1, 0, 1,
-0.4608816, -1.105281, -2.577713, 0.01568628, 1, 0, 1,
-0.4586985, 0.510559, -0.990292, 0.007843138, 1, 0, 1,
-0.457203, -0.6131116, -3.695812, 0.003921569, 1, 0, 1,
-0.4559677, 0.460245, -1.561163, 0, 1, 0.003921569, 1,
-0.4555902, -0.6988294, -1.569031, 0, 1, 0.01176471, 1,
-0.4546593, -0.3969321, -1.582533, 0, 1, 0.01568628, 1,
-0.4497219, 0.9102536, 0.6069821, 0, 1, 0.02352941, 1,
-0.4496149, -1.08099, -4.133145, 0, 1, 0.02745098, 1,
-0.4415641, 0.7960126, -0.1410227, 0, 1, 0.03529412, 1,
-0.4410802, -0.1838412, -1.943873, 0, 1, 0.03921569, 1,
-0.4395477, -0.9956461, -4.803095, 0, 1, 0.04705882, 1,
-0.4323948, 1.045057, -0.3026091, 0, 1, 0.05098039, 1,
-0.4321806, 1.26853, -0.7587729, 0, 1, 0.05882353, 1,
-0.4316702, 0.5116432, -1.714993, 0, 1, 0.0627451, 1,
-0.4264994, -2.341815, -2.851611, 0, 1, 0.07058824, 1,
-0.4246389, 1.754926, 1.08558, 0, 1, 0.07450981, 1,
-0.4242146, 0.3919285, -2.558486, 0, 1, 0.08235294, 1,
-0.4221281, 1.095146, -1.861402, 0, 1, 0.08627451, 1,
-0.4213156, -1.101168, -2.826202, 0, 1, 0.09411765, 1,
-0.4176556, -1.046742, -1.207744, 0, 1, 0.1019608, 1,
-0.4166354, -1.264, -1.146541, 0, 1, 0.1058824, 1,
-0.4110485, 0.4400979, 0.4442747, 0, 1, 0.1137255, 1,
-0.4091561, -0.3621719, -1.562687, 0, 1, 0.1176471, 1,
-0.4069708, -1.895853, -2.92147, 0, 1, 0.1254902, 1,
-0.3994767, 1.318347, 0.4870832, 0, 1, 0.1294118, 1,
-0.3982916, 0.2369564, -2.004574, 0, 1, 0.1372549, 1,
-0.3981992, -0.2932344, -1.929882, 0, 1, 0.1411765, 1,
-0.3913364, 0.19539, 0.2062408, 0, 1, 0.1490196, 1,
-0.383347, 0.642376, 0.2290835, 0, 1, 0.1529412, 1,
-0.3742565, 1.525295, 0.5552301, 0, 1, 0.1607843, 1,
-0.368686, -1.207443, -2.361765, 0, 1, 0.1647059, 1,
-0.3685654, -1.355922, -4.566613, 0, 1, 0.172549, 1,
-0.3683628, 0.4375929, -0.3118673, 0, 1, 0.1764706, 1,
-0.3634307, 0.05893212, -1.003467, 0, 1, 0.1843137, 1,
-0.3625149, 0.8472922, -0.8344584, 0, 1, 0.1882353, 1,
-0.3607627, -1.927956, -3.037752, 0, 1, 0.1960784, 1,
-0.3573885, 0.2975881, 0.9907219, 0, 1, 0.2039216, 1,
-0.3536018, 0.9668159, -0.1965671, 0, 1, 0.2078431, 1,
-0.35233, 0.8830024, -0.8465369, 0, 1, 0.2156863, 1,
-0.3463888, 1.373019, 1.470439, 0, 1, 0.2196078, 1,
-0.3444044, -1.552187, -1.904669, 0, 1, 0.227451, 1,
-0.3442157, -2.299545, -3.237874, 0, 1, 0.2313726, 1,
-0.3417696, 0.1164993, -1.648769, 0, 1, 0.2392157, 1,
-0.3320673, 0.5770766, 0.1825951, 0, 1, 0.2431373, 1,
-0.3313053, 1.819119, -0.191627, 0, 1, 0.2509804, 1,
-0.3282229, -0.1776315, -1.694741, 0, 1, 0.254902, 1,
-0.3276586, 0.4107494, -0.2348065, 0, 1, 0.2627451, 1,
-0.3256177, 0.9368703, 0.1047758, 0, 1, 0.2666667, 1,
-0.3253573, 0.7153531, -1.283634, 0, 1, 0.2745098, 1,
-0.3240252, 0.7148157, -0.3569187, 0, 1, 0.2784314, 1,
-0.322842, 0.1260438, -1.764204, 0, 1, 0.2862745, 1,
-0.3219075, -0.5552027, -2.255561, 0, 1, 0.2901961, 1,
-0.3214521, 0.3874621, -0.9118932, 0, 1, 0.2980392, 1,
-0.3204148, 0.0209405, -1.097216, 0, 1, 0.3058824, 1,
-0.3196667, 1.52487, -1.288266, 0, 1, 0.3098039, 1,
-0.3189498, 0.7382433, -0.8628262, 0, 1, 0.3176471, 1,
-0.3155676, -0.4664404, -3.237854, 0, 1, 0.3215686, 1,
-0.3109952, -0.8529525, -2.227433, 0, 1, 0.3294118, 1,
-0.3092412, -0.3549973, -0.6157792, 0, 1, 0.3333333, 1,
-0.3064339, -1.016807, -2.086649, 0, 1, 0.3411765, 1,
-0.3038122, 0.2182305, -1.455749, 0, 1, 0.345098, 1,
-0.300551, 0.255461, -1.075593, 0, 1, 0.3529412, 1,
-0.2933174, -1.356855, -4.215031, 0, 1, 0.3568628, 1,
-0.289961, -0.06130617, -2.008686, 0, 1, 0.3647059, 1,
-0.2899411, -0.2684155, -1.126347, 0, 1, 0.3686275, 1,
-0.2800944, -1.082039, -2.250554, 0, 1, 0.3764706, 1,
-0.2799052, 1.95509, -1.686474, 0, 1, 0.3803922, 1,
-0.2783974, 0.6923049, -0.5854276, 0, 1, 0.3882353, 1,
-0.277766, 1.339749, -0.8622817, 0, 1, 0.3921569, 1,
-0.275971, 1.498841, -0.3679898, 0, 1, 0.4, 1,
-0.2757088, 0.5677533, -0.1579383, 0, 1, 0.4078431, 1,
-0.2740302, 0.6421907, -0.6985633, 0, 1, 0.4117647, 1,
-0.271615, 0.7243273, -0.2172085, 0, 1, 0.4196078, 1,
-0.2710966, 1.037663, -0.05814638, 0, 1, 0.4235294, 1,
-0.260693, 1.42224, 0.3820969, 0, 1, 0.4313726, 1,
-0.2579363, 0.633159, 0.7713148, 0, 1, 0.4352941, 1,
-0.2558609, 0.6202994, -0.2524268, 0, 1, 0.4431373, 1,
-0.2558331, 1.335433, -1.262219, 0, 1, 0.4470588, 1,
-0.2551455, -0.1358905, -4.308507, 0, 1, 0.454902, 1,
-0.2478812, -1.029829, -2.686162, 0, 1, 0.4588235, 1,
-0.2477471, 1.764033, -0.4466324, 0, 1, 0.4666667, 1,
-0.2442394, 0.9765998, -0.2245524, 0, 1, 0.4705882, 1,
-0.2439793, -1.725925, -2.042742, 0, 1, 0.4784314, 1,
-0.2410713, 0.8160428, -0.7273615, 0, 1, 0.4823529, 1,
-0.2369248, -1.201071, -3.673251, 0, 1, 0.4901961, 1,
-0.2365234, -0.657207, -0.9689658, 0, 1, 0.4941176, 1,
-0.2316111, 0.9244681, -0.4086393, 0, 1, 0.5019608, 1,
-0.2313032, -0.1391437, -2.498768, 0, 1, 0.509804, 1,
-0.229059, -0.5820265, -1.118973, 0, 1, 0.5137255, 1,
-0.2277843, -0.8433214, -1.468673, 0, 1, 0.5215687, 1,
-0.2273163, 0.210826, -1.591465, 0, 1, 0.5254902, 1,
-0.2252439, -0.8299795, -4.726033, 0, 1, 0.5333334, 1,
-0.2219009, -0.07506246, -2.923707, 0, 1, 0.5372549, 1,
-0.2141721, -0.4528089, -3.046731, 0, 1, 0.5450981, 1,
-0.2135643, -1.181375, -1.677428, 0, 1, 0.5490196, 1,
-0.2100422, 0.2740564, -0.1380524, 0, 1, 0.5568628, 1,
-0.2087226, -0.3286322, -2.88551, 0, 1, 0.5607843, 1,
-0.2053484, 0.04401511, -0.7153854, 0, 1, 0.5686275, 1,
-0.2043579, -0.4762923, -0.1510141, 0, 1, 0.572549, 1,
-0.2040901, -0.5830737, -1.636491, 0, 1, 0.5803922, 1,
-0.20335, 0.4688089, -1.000832, 0, 1, 0.5843138, 1,
-0.1983766, -0.0804562, -1.970498, 0, 1, 0.5921569, 1,
-0.1929022, 1.232223, 0.6997413, 0, 1, 0.5960785, 1,
-0.1887383, -0.1344985, -1.745831, 0, 1, 0.6039216, 1,
-0.1856219, -0.2176651, -3.595062, 0, 1, 0.6117647, 1,
-0.1827364, -1.358, -3.163379, 0, 1, 0.6156863, 1,
-0.1799037, -2.012717, -1.479216, 0, 1, 0.6235294, 1,
-0.1790672, 0.434314, -0.6864998, 0, 1, 0.627451, 1,
-0.1785972, 0.7455614, 0.4051849, 0, 1, 0.6352941, 1,
-0.1773715, 1.391237, -0.5218435, 0, 1, 0.6392157, 1,
-0.1773203, -0.1956303, -0.7412421, 0, 1, 0.6470588, 1,
-0.1741109, -0.8913454, -2.154972, 0, 1, 0.6509804, 1,
-0.1740274, -0.07795638, -3.790031, 0, 1, 0.6588235, 1,
-0.173852, -0.16835, -1.842657, 0, 1, 0.6627451, 1,
-0.1681497, 0.2414967, -0.5825307, 0, 1, 0.6705883, 1,
-0.1668483, 1.094815, -0.3304702, 0, 1, 0.6745098, 1,
-0.1585995, -0.3347589, -2.591116, 0, 1, 0.682353, 1,
-0.1508926, -1.411331, -3.368258, 0, 1, 0.6862745, 1,
-0.1501956, 0.3428646, -0.610658, 0, 1, 0.6941177, 1,
-0.149844, -1.253668, -3.793536, 0, 1, 0.7019608, 1,
-0.1483137, 0.209671, 0.1135138, 0, 1, 0.7058824, 1,
-0.1467167, 0.3441336, -0.8937678, 0, 1, 0.7137255, 1,
-0.1426381, -0.721269, -5.4051, 0, 1, 0.7176471, 1,
-0.1425817, 0.03098125, -0.8380901, 0, 1, 0.7254902, 1,
-0.1424679, -0.09385387, -1.484609, 0, 1, 0.7294118, 1,
-0.1395941, -0.8993035, -2.323496, 0, 1, 0.7372549, 1,
-0.136475, 0.6154645, -1.085695, 0, 1, 0.7411765, 1,
-0.1353896, 0.9999491, -0.4221103, 0, 1, 0.7490196, 1,
-0.1349435, -0.8404766, -2.189511, 0, 1, 0.7529412, 1,
-0.1285865, 1.429682, -0.02168806, 0, 1, 0.7607843, 1,
-0.1270685, 0.4986104, -0.3400781, 0, 1, 0.7647059, 1,
-0.1260709, 0.8288071, -0.1947917, 0, 1, 0.772549, 1,
-0.1225626, -0.2356745, -1.093774, 0, 1, 0.7764706, 1,
-0.1216415, -0.837728, -1.595547, 0, 1, 0.7843137, 1,
-0.1195871, 1.221281, 0.2050154, 0, 1, 0.7882353, 1,
-0.117617, 1.750858, 0.02874743, 0, 1, 0.7960784, 1,
-0.1161298, 0.1392622, -1.288326, 0, 1, 0.8039216, 1,
-0.1129891, -0.7254231, -2.007805, 0, 1, 0.8078431, 1,
-0.1098382, 1.648407, -0.4696404, 0, 1, 0.8156863, 1,
-0.1086519, 0.7367448, 0.09452204, 0, 1, 0.8196079, 1,
-0.1072361, 0.9008147, -1.909581, 0, 1, 0.827451, 1,
-0.1057039, -0.04744482, -0.9557428, 0, 1, 0.8313726, 1,
-0.1001728, 0.5884606, 0.8098463, 0, 1, 0.8392157, 1,
-0.09506568, 0.6967937, 0.6536505, 0, 1, 0.8431373, 1,
-0.09444451, 0.4330305, -1.990074, 0, 1, 0.8509804, 1,
-0.09364066, 0.5879086, 0.7123368, 0, 1, 0.854902, 1,
-0.09093088, -0.9285377, -1.339705, 0, 1, 0.8627451, 1,
-0.09084426, -0.1789751, -2.025766, 0, 1, 0.8666667, 1,
-0.09019654, 0.3937893, -0.1638065, 0, 1, 0.8745098, 1,
-0.08500391, -1.677874, -2.625487, 0, 1, 0.8784314, 1,
-0.08445854, -0.6585532, -2.32985, 0, 1, 0.8862745, 1,
-0.08317702, 0.5321658, -0.6591284, 0, 1, 0.8901961, 1,
-0.07874013, -0.9261968, -3.212517, 0, 1, 0.8980392, 1,
-0.0755598, 0.8767152, -0.1885192, 0, 1, 0.9058824, 1,
-0.07457473, -2.109667, -1.334588, 0, 1, 0.9098039, 1,
-0.06084149, -0.319644, -2.662378, 0, 1, 0.9176471, 1,
-0.05713642, -0.4887259, -4.218607, 0, 1, 0.9215686, 1,
-0.05644151, -1.790174, -2.062742, 0, 1, 0.9294118, 1,
-0.0560285, -0.04613433, -1.766615, 0, 1, 0.9333333, 1,
-0.05300618, -0.9826422, -3.545101, 0, 1, 0.9411765, 1,
-0.04912846, 0.579486, 0.891765, 0, 1, 0.945098, 1,
-0.04361991, 0.1360404, -1.418715, 0, 1, 0.9529412, 1,
-0.04254734, -0.6790493, -2.148384, 0, 1, 0.9568627, 1,
-0.04229783, -0.04296666, -2.052713, 0, 1, 0.9647059, 1,
-0.04083675, 0.06534548, -0.7967629, 0, 1, 0.9686275, 1,
-0.04056884, -1.053819, -2.412546, 0, 1, 0.9764706, 1,
-0.03956588, -0.5267738, -2.70061, 0, 1, 0.9803922, 1,
-0.03627546, 0.7335865, 0.1496435, 0, 1, 0.9882353, 1,
-0.0357924, 1.228789, -0.007118858, 0, 1, 0.9921569, 1,
-0.03197076, 1.414495, -1.816031, 0, 1, 1, 1,
-0.03039925, -1.329537, -5.461416, 0, 0.9921569, 1, 1,
-0.02685465, -0.6653956, -4.095135, 0, 0.9882353, 1, 1,
-0.02471013, 0.09439047, -1.033626, 0, 0.9803922, 1, 1,
-0.02351939, -1.228888, -2.202199, 0, 0.9764706, 1, 1,
-0.02193982, -1.025444, -3.037384, 0, 0.9686275, 1, 1,
-0.01893923, 1.154223, 0.7942951, 0, 0.9647059, 1, 1,
-0.01706036, -1.752433, -2.802122, 0, 0.9568627, 1, 1,
-0.01468991, 0.3277484, 0.5392237, 0, 0.9529412, 1, 1,
-0.01347222, 1.272717, -0.8011293, 0, 0.945098, 1, 1,
-0.01267518, 1.170198, -0.08049654, 0, 0.9411765, 1, 1,
-0.009622757, -0.2536132, -3.705259, 0, 0.9333333, 1, 1,
-0.008591328, 0.199521, 0.0928058, 0, 0.9294118, 1, 1,
-0.007571872, 0.7872835, 0.4668478, 0, 0.9215686, 1, 1,
-0.007378419, -0.2689826, -2.41315, 0, 0.9176471, 1, 1,
-0.001892273, 0.4049704, 1.273486, 0, 0.9098039, 1, 1,
0.004554417, 0.3928908, -0.6593954, 0, 0.9058824, 1, 1,
0.005922978, -1.850849, 3.46898, 0, 0.8980392, 1, 1,
0.005986901, -0.4866678, 2.468609, 0, 0.8901961, 1, 1,
0.006984615, -1.428024, 4.095026, 0, 0.8862745, 1, 1,
0.008566239, -1.982879, 2.625183, 0, 0.8784314, 1, 1,
0.009323831, -0.3798155, 3.339247, 0, 0.8745098, 1, 1,
0.01057961, -0.2529191, 2.420179, 0, 0.8666667, 1, 1,
0.01615904, 1.151322, -0.7797064, 0, 0.8627451, 1, 1,
0.01629942, 1.350755, 2.026481, 0, 0.854902, 1, 1,
0.01844142, 0.9535915, 0.3843357, 0, 0.8509804, 1, 1,
0.02235805, -0.6513843, 2.334006, 0, 0.8431373, 1, 1,
0.02390803, 1.114116, 0.02076823, 0, 0.8392157, 1, 1,
0.02715056, 0.03508328, 1.034037, 0, 0.8313726, 1, 1,
0.03199718, -0.4653056, 1.866529, 0, 0.827451, 1, 1,
0.03212991, 0.4637086, 0.3504521, 0, 0.8196079, 1, 1,
0.0329794, 0.2072381, 0.2848408, 0, 0.8156863, 1, 1,
0.03336644, 0.5979797, 0.7991931, 0, 0.8078431, 1, 1,
0.03569007, 1.473188, -1.33842, 0, 0.8039216, 1, 1,
0.0358628, -0.3574539, 1.722537, 0, 0.7960784, 1, 1,
0.03632643, 1.071895, -0.7058144, 0, 0.7882353, 1, 1,
0.03996099, -0.1679707, 2.042369, 0, 0.7843137, 1, 1,
0.04313836, 0.3644404, -0.9047463, 0, 0.7764706, 1, 1,
0.04406773, 0.7253356, 0.3434854, 0, 0.772549, 1, 1,
0.04419455, 1.2604, -0.7800124, 0, 0.7647059, 1, 1,
0.04741194, 1.046042, 1.620834, 0, 0.7607843, 1, 1,
0.0511938, 0.5941448, 1.937894, 0, 0.7529412, 1, 1,
0.05305009, -0.2359231, 2.291201, 0, 0.7490196, 1, 1,
0.05332015, -0.2779463, 1.798641, 0, 0.7411765, 1, 1,
0.0557198, -0.3314364, 3.900693, 0, 0.7372549, 1, 1,
0.06007141, 0.3012807, -0.7262212, 0, 0.7294118, 1, 1,
0.06089254, 0.7936518, 0.6285818, 0, 0.7254902, 1, 1,
0.06180242, 0.07077184, -0.1203457, 0, 0.7176471, 1, 1,
0.06268241, 0.4505196, 1.076712, 0, 0.7137255, 1, 1,
0.06324053, -1.236586, 3.435721, 0, 0.7058824, 1, 1,
0.0652662, -1.567551, 3.270521, 0, 0.6980392, 1, 1,
0.0670813, -0.2127746, 3.120173, 0, 0.6941177, 1, 1,
0.07869422, 0.7384998, 1.575907, 0, 0.6862745, 1, 1,
0.07954246, 1.190226, 0.507142, 0, 0.682353, 1, 1,
0.07983047, -0.09126807, 2.345924, 0, 0.6745098, 1, 1,
0.08082569, 1.92425, 0.2618105, 0, 0.6705883, 1, 1,
0.08310506, -0.9776273, 4.149175, 0, 0.6627451, 1, 1,
0.09264803, -0.02893824, 2.914695, 0, 0.6588235, 1, 1,
0.09374595, -1.388718, 3.800321, 0, 0.6509804, 1, 1,
0.09701275, -0.3413315, 2.680509, 0, 0.6470588, 1, 1,
0.1009321, -0.2772362, 3.918222, 0, 0.6392157, 1, 1,
0.1013743, -0.810986, 1.408459, 0, 0.6352941, 1, 1,
0.1034544, 0.3523898, -0.09349683, 0, 0.627451, 1, 1,
0.1035944, 0.2503313, 1.113788, 0, 0.6235294, 1, 1,
0.1169049, 0.7364911, -1.271119, 0, 0.6156863, 1, 1,
0.1203609, -0.7403365, 4.433691, 0, 0.6117647, 1, 1,
0.1238264, 0.5527393, 0.1978931, 0, 0.6039216, 1, 1,
0.1248754, -0.3280071, 2.515738, 0, 0.5960785, 1, 1,
0.1326507, -1.037236, 2.216589, 0, 0.5921569, 1, 1,
0.1337106, 0.4284596, -0.7634027, 0, 0.5843138, 1, 1,
0.1367059, 0.935596, -0.3382349, 0, 0.5803922, 1, 1,
0.1467211, -0.5702615, 3.664242, 0, 0.572549, 1, 1,
0.1511585, 0.7531268, 0.1948236, 0, 0.5686275, 1, 1,
0.1514777, -0.05250014, 1.192414, 0, 0.5607843, 1, 1,
0.1549051, -0.5552408, 3.788891, 0, 0.5568628, 1, 1,
0.155553, 0.1560119, -0.8751233, 0, 0.5490196, 1, 1,
0.1566451, -0.03128608, 1.377113, 0, 0.5450981, 1, 1,
0.1576419, 0.9420546, -0.972497, 0, 0.5372549, 1, 1,
0.1602914, -2.126795, 3.201104, 0, 0.5333334, 1, 1,
0.1620911, -0.2010516, 1.630323, 0, 0.5254902, 1, 1,
0.1642802, -1.646909, 1.893203, 0, 0.5215687, 1, 1,
0.164658, -1.266829, 4.023114, 0, 0.5137255, 1, 1,
0.1652951, -0.6330137, 2.466456, 0, 0.509804, 1, 1,
0.1747207, -0.6036409, 2.874557, 0, 0.5019608, 1, 1,
0.1764968, -1.554374, 3.155083, 0, 0.4941176, 1, 1,
0.1767711, 1.564763, -2.137066, 0, 0.4901961, 1, 1,
0.1779843, 0.1468638, 0.0007230621, 0, 0.4823529, 1, 1,
0.1817797, -0.3754515, 5.924063, 0, 0.4784314, 1, 1,
0.1823455, 0.3557931, 0.924136, 0, 0.4705882, 1, 1,
0.1888881, 1.296694, -0.1670812, 0, 0.4666667, 1, 1,
0.1896604, 0.260645, 0.4507791, 0, 0.4588235, 1, 1,
0.1903749, -0.8812053, 1.036989, 0, 0.454902, 1, 1,
0.1910463, 1.444207, 1.028043, 0, 0.4470588, 1, 1,
0.1923827, -0.651306, 3.122672, 0, 0.4431373, 1, 1,
0.1926243, -0.6089657, 3.106256, 0, 0.4352941, 1, 1,
0.1938824, 0.5513803, 0.3724667, 0, 0.4313726, 1, 1,
0.195993, -1.394618, 1.958249, 0, 0.4235294, 1, 1,
0.1968887, -1.051328, 3.109813, 0, 0.4196078, 1, 1,
0.1996644, -0.1838286, 1.837906, 0, 0.4117647, 1, 1,
0.199916, 1.622392, -2.657171, 0, 0.4078431, 1, 1,
0.2001376, 0.7834972, 0.4909845, 0, 0.4, 1, 1,
0.2059806, 0.9399624, -0.5697646, 0, 0.3921569, 1, 1,
0.2082718, -1.343944, 3.772648, 0, 0.3882353, 1, 1,
0.2167367, -0.7551667, 1.769587, 0, 0.3803922, 1, 1,
0.2175469, -0.1434963, 2.736256, 0, 0.3764706, 1, 1,
0.2183234, -0.005482714, 2.205695, 0, 0.3686275, 1, 1,
0.2191345, 0.3336075, -1.462176, 0, 0.3647059, 1, 1,
0.2194043, -0.8061563, 3.824997, 0, 0.3568628, 1, 1,
0.2231501, -1.056959, 3.506994, 0, 0.3529412, 1, 1,
0.2241933, 0.7194869, -0.5482561, 0, 0.345098, 1, 1,
0.2282833, 1.384243, -0.9386096, 0, 0.3411765, 1, 1,
0.2355156, 0.1419843, 1.789989, 0, 0.3333333, 1, 1,
0.2379464, -0.9045299, 4.536963, 0, 0.3294118, 1, 1,
0.240257, 0.2887796, -0.4072067, 0, 0.3215686, 1, 1,
0.2420894, 0.6339468, 0.2713382, 0, 0.3176471, 1, 1,
0.2445873, -0.09541345, 2.346245, 0, 0.3098039, 1, 1,
0.245751, -2.356114, 3.722281, 0, 0.3058824, 1, 1,
0.2514798, 0.07679611, 1.277008, 0, 0.2980392, 1, 1,
0.2527153, 0.5077695, 0.8615528, 0, 0.2901961, 1, 1,
0.2533745, 0.6539904, 1.521722, 0, 0.2862745, 1, 1,
0.2591662, 0.3844673, -0.9392961, 0, 0.2784314, 1, 1,
0.2592433, 0.5485412, 1.935497, 0, 0.2745098, 1, 1,
0.2592788, 1.860587, -0.2395765, 0, 0.2666667, 1, 1,
0.2624058, 0.9177132, -0.5191119, 0, 0.2627451, 1, 1,
0.2640878, -0.01638038, 2.261246, 0, 0.254902, 1, 1,
0.2723149, 0.2421066, 0.6092572, 0, 0.2509804, 1, 1,
0.2730024, 0.9813498, -1.282183, 0, 0.2431373, 1, 1,
0.2762117, -1.292444, 3.241021, 0, 0.2392157, 1, 1,
0.2764672, -0.1787811, 2.985575, 0, 0.2313726, 1, 1,
0.2777069, 1.129997, 0.6522535, 0, 0.227451, 1, 1,
0.2821509, 0.1294085, 1.074526, 0, 0.2196078, 1, 1,
0.2823231, -0.383275, 3.32383, 0, 0.2156863, 1, 1,
0.2830232, 0.917406, -0.03275089, 0, 0.2078431, 1, 1,
0.2849441, -0.8410291, 3.732627, 0, 0.2039216, 1, 1,
0.2850325, -0.928324, 0.9462667, 0, 0.1960784, 1, 1,
0.2875456, 0.09592652, 2.519725, 0, 0.1882353, 1, 1,
0.289099, -0.9870049, 3.677771, 0, 0.1843137, 1, 1,
0.2946846, 0.1940168, 0.8023662, 0, 0.1764706, 1, 1,
0.2955654, 1.730986, -2.374037, 0, 0.172549, 1, 1,
0.2999584, -0.6765714, -0.5582719, 0, 0.1647059, 1, 1,
0.3000979, 0.1472616, 0.4454355, 0, 0.1607843, 1, 1,
0.3052672, -0.7446563, 1.997077, 0, 0.1529412, 1, 1,
0.3068167, 0.5217419, 0.1072619, 0, 0.1490196, 1, 1,
0.3072307, 0.1501186, 1.554625, 0, 0.1411765, 1, 1,
0.3093123, 0.230232, -0.2708697, 0, 0.1372549, 1, 1,
0.3182966, 0.305911, 0.864979, 0, 0.1294118, 1, 1,
0.3247146, -0.8337455, 4.381352, 0, 0.1254902, 1, 1,
0.3251521, -0.9642674, 2.313642, 0, 0.1176471, 1, 1,
0.3274845, -0.3135767, 2.574311, 0, 0.1137255, 1, 1,
0.3284964, -2.2201, 3.653104, 0, 0.1058824, 1, 1,
0.3305573, -1.837194, 4.467114, 0, 0.09803922, 1, 1,
0.3344094, -0.08845159, 1.948436, 0, 0.09411765, 1, 1,
0.3429591, 0.4774837, 2.07891, 0, 0.08627451, 1, 1,
0.3431564, 1.256383, 0.04198974, 0, 0.08235294, 1, 1,
0.3445224, 1.041911, -0.2703164, 0, 0.07450981, 1, 1,
0.3473709, -0.7719407, 2.323939, 0, 0.07058824, 1, 1,
0.3506781, -0.1339634, 1.471941, 0, 0.0627451, 1, 1,
0.353361, -0.3109881, 3.929216, 0, 0.05882353, 1, 1,
0.3551726, -0.5795265, 0.5565882, 0, 0.05098039, 1, 1,
0.3573791, -0.3938977, 2.151499, 0, 0.04705882, 1, 1,
0.3620261, 1.13399, 1.231487, 0, 0.03921569, 1, 1,
0.3664052, -0.6436167, 2.734851, 0, 0.03529412, 1, 1,
0.3666182, 0.6646433, 1.18426, 0, 0.02745098, 1, 1,
0.3704642, 0.3118979, 2.833381, 0, 0.02352941, 1, 1,
0.3751059, 0.1947766, 1.476406, 0, 0.01568628, 1, 1,
0.3754726, 0.4240243, 0.5171851, 0, 0.01176471, 1, 1,
0.3773411, -0.4740965, 2.662041, 0, 0.003921569, 1, 1,
0.3773915, -0.4055026, 3.679568, 0.003921569, 0, 1, 1,
0.3787363, 1.184223, 1.391271, 0.007843138, 0, 1, 1,
0.3831419, 1.888994, -0.9908521, 0.01568628, 0, 1, 1,
0.3853669, -0.5781178, 2.168364, 0.01960784, 0, 1, 1,
0.3869278, -0.1549812, 2.370555, 0.02745098, 0, 1, 1,
0.3884201, -0.3665362, 3.00645, 0.03137255, 0, 1, 1,
0.3909515, 2.188843, -0.3585667, 0.03921569, 0, 1, 1,
0.3950286, -1.414474, 2.744426, 0.04313726, 0, 1, 1,
0.3990228, 0.9801169, 0.5700769, 0.05098039, 0, 1, 1,
0.4001839, 0.320481, -0.53139, 0.05490196, 0, 1, 1,
0.4015969, -1.048249, 2.519847, 0.0627451, 0, 1, 1,
0.4020223, -0.4184138, 0.8068927, 0.06666667, 0, 1, 1,
0.4040029, 0.3759832, 0.5668417, 0.07450981, 0, 1, 1,
0.4053458, -0.5462791, 1.7486, 0.07843138, 0, 1, 1,
0.4057047, 0.6423483, 0.3719024, 0.08627451, 0, 1, 1,
0.4079317, -0.1783256, 0.7308641, 0.09019608, 0, 1, 1,
0.4090547, 0.1836959, 1.04091, 0.09803922, 0, 1, 1,
0.4145809, 0.7806751, 0.3764181, 0.1058824, 0, 1, 1,
0.414847, -2.26921, 1.921006, 0.1098039, 0, 1, 1,
0.4158311, 0.3892554, 0.509904, 0.1176471, 0, 1, 1,
0.419636, -0.7896549, 2.937151, 0.1215686, 0, 1, 1,
0.4275606, -0.835641, 2.093755, 0.1294118, 0, 1, 1,
0.4356986, 0.8631079, -1.04915, 0.1333333, 0, 1, 1,
0.4392216, -0.6759071, 0.760921, 0.1411765, 0, 1, 1,
0.4400926, -1.216768, 2.602488, 0.145098, 0, 1, 1,
0.4413994, 0.7318453, -0.3326473, 0.1529412, 0, 1, 1,
0.4480226, 0.161718, 3.458445, 0.1568628, 0, 1, 1,
0.4490379, 0.1794125, 0.9588242, 0.1647059, 0, 1, 1,
0.4499674, -1.410876, 1.705997, 0.1686275, 0, 1, 1,
0.4557118, 0.8372312, 0.1311512, 0.1764706, 0, 1, 1,
0.457812, 0.6074583, 1.103633, 0.1803922, 0, 1, 1,
0.4594033, -1.26389, 2.184264, 0.1882353, 0, 1, 1,
0.4770241, 0.6593351, -0.1124469, 0.1921569, 0, 1, 1,
0.478607, 0.9215977, 0.5386593, 0.2, 0, 1, 1,
0.4798008, -0.5080544, 1.507519, 0.2078431, 0, 1, 1,
0.4844799, 1.068928, 1.476783, 0.2117647, 0, 1, 1,
0.4850842, -0.8974069, 2.018261, 0.2196078, 0, 1, 1,
0.4913747, 0.2451737, 3.142266, 0.2235294, 0, 1, 1,
0.4939715, -0.4731527, 2.688951, 0.2313726, 0, 1, 1,
0.4989858, 0.3953232, -0.1513271, 0.2352941, 0, 1, 1,
0.4994725, 0.2437901, 0.8141593, 0.2431373, 0, 1, 1,
0.4996673, -0.6361919, 1.592608, 0.2470588, 0, 1, 1,
0.5034446, 0.4531327, -0.4931597, 0.254902, 0, 1, 1,
0.5034792, -0.648638, 0.9560933, 0.2588235, 0, 1, 1,
0.5141134, -0.07299536, 1.413375, 0.2666667, 0, 1, 1,
0.5153716, 1.450596, 0.343759, 0.2705882, 0, 1, 1,
0.5154824, -1.1714, 2.648327, 0.2784314, 0, 1, 1,
0.5198092, 0.4006742, 2.067907, 0.282353, 0, 1, 1,
0.5212516, -0.6789427, 0.7072679, 0.2901961, 0, 1, 1,
0.5219247, -0.4308664, 2.163914, 0.2941177, 0, 1, 1,
0.5220332, 2.241321, -0.4865151, 0.3019608, 0, 1, 1,
0.5305509, 1.627442, 0.5952588, 0.3098039, 0, 1, 1,
0.5337963, 1.021182, -0.65559, 0.3137255, 0, 1, 1,
0.5339484, -1.093903, 5.169271, 0.3215686, 0, 1, 1,
0.5383912, -0.3487543, 1.93087, 0.3254902, 0, 1, 1,
0.5407962, 1.368379, 0.7713454, 0.3333333, 0, 1, 1,
0.5421414, 1.095794, 1.216277, 0.3372549, 0, 1, 1,
0.5460588, 1.753814, 0.7692811, 0.345098, 0, 1, 1,
0.5463259, 0.3312756, 0.8884699, 0.3490196, 0, 1, 1,
0.5476869, -1.043908, 2.804561, 0.3568628, 0, 1, 1,
0.5500299, 0.430285, 0.859234, 0.3607843, 0, 1, 1,
0.5544994, -0.5214839, 0.5243621, 0.3686275, 0, 1, 1,
0.5579488, -0.1715049, 3.088339, 0.372549, 0, 1, 1,
0.5606412, 0.7492082, -0.1273405, 0.3803922, 0, 1, 1,
0.5622412, -0.411428, 3.182034, 0.3843137, 0, 1, 1,
0.5632708, -0.9582309, 4.232145, 0.3921569, 0, 1, 1,
0.5635123, 0.07755536, 2.444353, 0.3960784, 0, 1, 1,
0.5640486, 0.2466275, 1.529887, 0.4039216, 0, 1, 1,
0.5685346, 0.8327632, 1.053511, 0.4117647, 0, 1, 1,
0.5693392, 0.4790566, 0.5658642, 0.4156863, 0, 1, 1,
0.5693706, -0.85543, 2.841094, 0.4235294, 0, 1, 1,
0.5697863, 0.8758695, -0.5916309, 0.427451, 0, 1, 1,
0.5773168, -0.5300987, 0.9247841, 0.4352941, 0, 1, 1,
0.5835971, 1.030047, 2.02471, 0.4392157, 0, 1, 1,
0.5891623, -1.067033, 2.872928, 0.4470588, 0, 1, 1,
0.5951086, 1.137186, 1.274818, 0.4509804, 0, 1, 1,
0.5964407, -0.391459, 3.004787, 0.4588235, 0, 1, 1,
0.5970365, 0.6598898, 0.2766592, 0.4627451, 0, 1, 1,
0.5985543, -0.7182953, 4.787903, 0.4705882, 0, 1, 1,
0.5996587, 0.5133401, 1.343889, 0.4745098, 0, 1, 1,
0.6011461, -0.2079968, 0.2644585, 0.4823529, 0, 1, 1,
0.6071007, -0.7163139, 2.932282, 0.4862745, 0, 1, 1,
0.6089077, -0.8906738, 2.725879, 0.4941176, 0, 1, 1,
0.6133834, -0.450258, 1.483982, 0.5019608, 0, 1, 1,
0.6154807, 0.2209821, 3.084249, 0.5058824, 0, 1, 1,
0.6169093, -2.67732, 2.953187, 0.5137255, 0, 1, 1,
0.6169925, -0.1210052, 2.263331, 0.5176471, 0, 1, 1,
0.6180601, 0.2340859, 2.257788, 0.5254902, 0, 1, 1,
0.6223776, -1.495757, 3.198709, 0.5294118, 0, 1, 1,
0.6229702, -2.912714, 2.888472, 0.5372549, 0, 1, 1,
0.6246062, -0.3546743, 1.196577, 0.5411765, 0, 1, 1,
0.6246662, 2.317564, -1.554651, 0.5490196, 0, 1, 1,
0.6393335, -0.9184753, 1.278477, 0.5529412, 0, 1, 1,
0.6427916, -1.662813, 0.1942624, 0.5607843, 0, 1, 1,
0.6430299, -2.093013, 0.372069, 0.5647059, 0, 1, 1,
0.6483696, 0.05604203, 2.577959, 0.572549, 0, 1, 1,
0.6503766, 0.8853109, 0.07168553, 0.5764706, 0, 1, 1,
0.6536021, -0.3793976, 1.190914, 0.5843138, 0, 1, 1,
0.6565583, 1.136271, 0.4908873, 0.5882353, 0, 1, 1,
0.6576052, -0.421537, 2.598643, 0.5960785, 0, 1, 1,
0.6675088, 1.640045, 1.829642, 0.6039216, 0, 1, 1,
0.6693028, 0.7897683, 0.7285152, 0.6078432, 0, 1, 1,
0.6756192, -0.3318989, -0.1472906, 0.6156863, 0, 1, 1,
0.6792119, 0.4995092, 1.901958, 0.6196079, 0, 1, 1,
0.6803506, 0.4248418, -1.036004, 0.627451, 0, 1, 1,
0.6905165, -0.8975407, 3.014146, 0.6313726, 0, 1, 1,
0.6969124, 1.509335, 0.8411902, 0.6392157, 0, 1, 1,
0.6995156, -0.7027474, 2.131381, 0.6431373, 0, 1, 1,
0.7008644, 1.1156, 1.754291, 0.6509804, 0, 1, 1,
0.7194017, 0.2886368, 2.391482, 0.654902, 0, 1, 1,
0.7210422, 0.7246377, 0.7581415, 0.6627451, 0, 1, 1,
0.7311001, 0.4747367, 1.38632, 0.6666667, 0, 1, 1,
0.7406603, -1.912211, 1.508828, 0.6745098, 0, 1, 1,
0.7417454, 1.631879, 1.12092, 0.6784314, 0, 1, 1,
0.7449108, -0.735615, 4.480011, 0.6862745, 0, 1, 1,
0.7461434, -0.4333339, 2.40148, 0.6901961, 0, 1, 1,
0.7471594, -0.7612023, 4.204517, 0.6980392, 0, 1, 1,
0.7501431, 0.8869625, 0.5036111, 0.7058824, 0, 1, 1,
0.7513925, -0.3900246, 2.267573, 0.7098039, 0, 1, 1,
0.7527829, -0.3538921, 1.662223, 0.7176471, 0, 1, 1,
0.7564802, -1.471303, 2.367108, 0.7215686, 0, 1, 1,
0.7576075, -0.7751417, 2.028277, 0.7294118, 0, 1, 1,
0.7577118, 0.4515618, 0.2154499, 0.7333333, 0, 1, 1,
0.7601658, 0.4729572, 0.2936516, 0.7411765, 0, 1, 1,
0.7605902, 1.1765, 1.484057, 0.7450981, 0, 1, 1,
0.7638928, 2.229721, 0.209203, 0.7529412, 0, 1, 1,
0.7755697, 1.815854, 0.3968289, 0.7568628, 0, 1, 1,
0.7848036, -1.172827, 2.003225, 0.7647059, 0, 1, 1,
0.7948518, -0.02077201, 3.133966, 0.7686275, 0, 1, 1,
0.7952133, 0.3875406, 1.495587, 0.7764706, 0, 1, 1,
0.7961792, -0.6831846, 3.002182, 0.7803922, 0, 1, 1,
0.7978419, 0.6291256, 2.555635, 0.7882353, 0, 1, 1,
0.8023441, 0.4707649, 2.527119, 0.7921569, 0, 1, 1,
0.8027875, -0.5144675, 2.517159, 0.8, 0, 1, 1,
0.8054689, -0.7172403, 2.150666, 0.8078431, 0, 1, 1,
0.8109806, -1.233197, 1.179451, 0.8117647, 0, 1, 1,
0.8132925, -0.714007, 5.397069, 0.8196079, 0, 1, 1,
0.8133798, -0.03089074, 0.7247988, 0.8235294, 0, 1, 1,
0.815026, -0.4684652, -0.3650958, 0.8313726, 0, 1, 1,
0.8184412, 0.2640216, 0.0748568, 0.8352941, 0, 1, 1,
0.8210077, -1.19576, 3.323685, 0.8431373, 0, 1, 1,
0.8237366, 0.2970102, 1.711732, 0.8470588, 0, 1, 1,
0.8244197, 1.113782, 1.230967, 0.854902, 0, 1, 1,
0.8316044, 0.02675507, 2.207237, 0.8588235, 0, 1, 1,
0.8434692, 1.134812, 1.481911, 0.8666667, 0, 1, 1,
0.8484253, 0.5318677, 1.468674, 0.8705882, 0, 1, 1,
0.8513603, -1.37966, 2.567773, 0.8784314, 0, 1, 1,
0.8516684, -0.2604029, 2.965274, 0.8823529, 0, 1, 1,
0.8529519, -1.532023, 2.664876, 0.8901961, 0, 1, 1,
0.8724645, 1.669877, 0.3463674, 0.8941177, 0, 1, 1,
0.8734335, 0.8322901, -1.163137, 0.9019608, 0, 1, 1,
0.8736611, -1.165505, 1.961828, 0.9098039, 0, 1, 1,
0.8738207, 0.03545521, 0.1845521, 0.9137255, 0, 1, 1,
0.8819668, 0.3969444, 1.531662, 0.9215686, 0, 1, 1,
0.8847067, -1.98056, 3.191756, 0.9254902, 0, 1, 1,
0.8940034, -0.1706616, 0.5196834, 0.9333333, 0, 1, 1,
0.8973545, 0.7855613, 1.384101, 0.9372549, 0, 1, 1,
0.9004486, 0.8334383, 2.355002, 0.945098, 0, 1, 1,
0.9010056, 0.8615911, 1.116317, 0.9490196, 0, 1, 1,
0.9017587, 1.257861, 0.5199203, 0.9568627, 0, 1, 1,
0.9037102, 0.5098897, 1.729747, 0.9607843, 0, 1, 1,
0.9039023, -0.8425325, 3.792015, 0.9686275, 0, 1, 1,
0.9122967, 0.3704194, 1.00839, 0.972549, 0, 1, 1,
0.9136865, 2.887072, 1.451714, 0.9803922, 0, 1, 1,
0.9141815, -0.1735616, 0.9642206, 0.9843137, 0, 1, 1,
0.9255805, -1.159874, 2.983098, 0.9921569, 0, 1, 1,
0.9264018, 0.366491, 0.8962387, 0.9960784, 0, 1, 1,
0.9281066, -0.6337737, 0.4037087, 1, 0, 0.9960784, 1,
0.9298823, 1.46444, 0.7671049, 1, 0, 0.9882353, 1,
0.9302208, -0.5459501, 2.725753, 1, 0, 0.9843137, 1,
0.9398506, 0.6593391, 2.677224, 1, 0, 0.9764706, 1,
0.9457394, 0.5435184, 2.112947, 1, 0, 0.972549, 1,
0.9505447, 0.8583977, 2.27998, 1, 0, 0.9647059, 1,
0.9527506, -0.2553822, 0.3718581, 1, 0, 0.9607843, 1,
0.9560344, 1.542376, 1.939308, 1, 0, 0.9529412, 1,
0.9586518, 0.8575913, -1.553315, 1, 0, 0.9490196, 1,
0.9607797, -0.360306, 1.349567, 1, 0, 0.9411765, 1,
0.9639906, -0.05739745, 1.636453, 1, 0, 0.9372549, 1,
0.9650202, -0.8725974, 2.148492, 1, 0, 0.9294118, 1,
0.97125, 0.6420957, 0.00197351, 1, 0, 0.9254902, 1,
0.9731317, -1.090011, 2.159276, 1, 0, 0.9176471, 1,
0.9755452, -0.6293295, 1.526712, 1, 0, 0.9137255, 1,
0.9806196, 0.8598214, 2.728532, 1, 0, 0.9058824, 1,
0.9808025, 1.169384, 1.141664, 1, 0, 0.9019608, 1,
0.9854237, 0.3870622, 0.8999538, 1, 0, 0.8941177, 1,
0.9881198, 0.9616925, 0.4473471, 1, 0, 0.8862745, 1,
0.9881645, 0.06285772, 1.993579, 1, 0, 0.8823529, 1,
0.9915184, -0.2660337, 3.360837, 1, 0, 0.8745098, 1,
0.9947625, -1.268901, 2.071436, 1, 0, 0.8705882, 1,
0.9951474, -1.557047, 1.187534, 1, 0, 0.8627451, 1,
0.9985654, -0.6919189, 1.807896, 1, 0, 0.8588235, 1,
1.004755, 0.3555711, 0.7786934, 1, 0, 0.8509804, 1,
1.018938, -0.912331, 3.151459, 1, 0, 0.8470588, 1,
1.026218, -0.6429089, 0.6890193, 1, 0, 0.8392157, 1,
1.026877, -0.5152438, -0.7619478, 1, 0, 0.8352941, 1,
1.028287, 0.875716, -0.07638256, 1, 0, 0.827451, 1,
1.040861, -1.031331, 1.826345, 1, 0, 0.8235294, 1,
1.053136, -0.8900061, 3.593258, 1, 0, 0.8156863, 1,
1.057207, 1.260262, 0.6640563, 1, 0, 0.8117647, 1,
1.057783, 0.6895626, 1.282688, 1, 0, 0.8039216, 1,
1.058719, 0.817657, -0.4907489, 1, 0, 0.7960784, 1,
1.05898, -2.964956, 2.0182, 1, 0, 0.7921569, 1,
1.064874, 0.9616427, 2.078113, 1, 0, 0.7843137, 1,
1.068522, -0.446249, 2.033786, 1, 0, 0.7803922, 1,
1.074744, -0.447592, 0.9429765, 1, 0, 0.772549, 1,
1.076636, -0.3549303, 0.2840151, 1, 0, 0.7686275, 1,
1.084489, 0.987821, -0.9357303, 1, 0, 0.7607843, 1,
1.094381, 0.02687836, 2.157773, 1, 0, 0.7568628, 1,
1.096729, -0.9911957, 1.924335, 1, 0, 0.7490196, 1,
1.098146, 0.04762721, 2.452821, 1, 0, 0.7450981, 1,
1.099079, 1.020227, -0.8014318, 1, 0, 0.7372549, 1,
1.099362, -0.02736818, 2.391142, 1, 0, 0.7333333, 1,
1.111851, 0.2943092, -0.5594558, 1, 0, 0.7254902, 1,
1.114706, 0.2736963, 1.66811, 1, 0, 0.7215686, 1,
1.121925, -0.004275523, 0.5962449, 1, 0, 0.7137255, 1,
1.127756, 0.5693958, -0.5668187, 1, 0, 0.7098039, 1,
1.128509, -0.5797727, 2.307543, 1, 0, 0.7019608, 1,
1.142538, 1.687885, -0.06655078, 1, 0, 0.6941177, 1,
1.14956, 0.6971599, 1.944044, 1, 0, 0.6901961, 1,
1.151276, -1.396326, 2.973635, 1, 0, 0.682353, 1,
1.172521, -1.045294, 1.996644, 1, 0, 0.6784314, 1,
1.176515, -0.9308639, 2.589974, 1, 0, 0.6705883, 1,
1.176656, -2.100839, 2.146689, 1, 0, 0.6666667, 1,
1.177397, 0.6791961, 1.883365, 1, 0, 0.6588235, 1,
1.180985, 0.4277754, 1.641796, 1, 0, 0.654902, 1,
1.185189, -1.60896, 1.260302, 1, 0, 0.6470588, 1,
1.188075, 1.242442, -0.9294012, 1, 0, 0.6431373, 1,
1.188946, -2.434929, 2.437697, 1, 0, 0.6352941, 1,
1.213726, 1.252335, 1.218052, 1, 0, 0.6313726, 1,
1.215382, -0.2269615, 1.475387, 1, 0, 0.6235294, 1,
1.216676, -0.5647513, 1.844793, 1, 0, 0.6196079, 1,
1.245157, 1.681981, 0.03493913, 1, 0, 0.6117647, 1,
1.251875, -1.365266, 2.486812, 1, 0, 0.6078432, 1,
1.264912, 1.220127, 1.345711, 1, 0, 0.6, 1,
1.26687, -0.5695852, 0.6298196, 1, 0, 0.5921569, 1,
1.279365, -2.066422, 0.791262, 1, 0, 0.5882353, 1,
1.289555, -0.5376219, 0.8624125, 1, 0, 0.5803922, 1,
1.301288, -0.4180542, 2.307879, 1, 0, 0.5764706, 1,
1.302486, 0.5608867, 2.434196, 1, 0, 0.5686275, 1,
1.303521, 1.03474, 0.496058, 1, 0, 0.5647059, 1,
1.306205, 0.5495626, 2.147356, 1, 0, 0.5568628, 1,
1.307573, -0.5728155, 1.722077, 1, 0, 0.5529412, 1,
1.308164, 0.2774803, 0.7337489, 1, 0, 0.5450981, 1,
1.311031, -1.644968, 1.704259, 1, 0, 0.5411765, 1,
1.323511, -1.972595, 3.7852, 1, 0, 0.5333334, 1,
1.3394, 0.1747986, 1.519114, 1, 0, 0.5294118, 1,
1.340218, -0.4955174, 3.300448, 1, 0, 0.5215687, 1,
1.341317, -1.48661, 2.362701, 1, 0, 0.5176471, 1,
1.346204, 1.1818, 2.044084, 1, 0, 0.509804, 1,
1.350487, -0.4926738, 1.674219, 1, 0, 0.5058824, 1,
1.350773, -1.128616, 1.745258, 1, 0, 0.4980392, 1,
1.351946, -0.4305046, 2.346883, 1, 0, 0.4901961, 1,
1.356323, 0.2113189, 2.398418, 1, 0, 0.4862745, 1,
1.356754, -0.2651362, 1.914981, 1, 0, 0.4784314, 1,
1.36939, 0.1628824, 2.681211, 1, 0, 0.4745098, 1,
1.381519, -0.5713381, 2.757476, 1, 0, 0.4666667, 1,
1.38426, -0.6985458, 1.014171, 1, 0, 0.4627451, 1,
1.385416, 0.6607242, 0.2081517, 1, 0, 0.454902, 1,
1.404255, 1.660308, 2.436231, 1, 0, 0.4509804, 1,
1.408885, 0.6172139, -1.263221, 1, 0, 0.4431373, 1,
1.415694, -0.3168963, 1.903338, 1, 0, 0.4392157, 1,
1.448277, -1.381183, 3.291081, 1, 0, 0.4313726, 1,
1.450683, -0.2001705, 3.287315, 1, 0, 0.427451, 1,
1.464473, -1.562737, 2.365327, 1, 0, 0.4196078, 1,
1.469173, -1.155357, 1.236682, 1, 0, 0.4156863, 1,
1.471706, -0.5577513, 1.599603, 1, 0, 0.4078431, 1,
1.473046, 0.6201359, -0.7416997, 1, 0, 0.4039216, 1,
1.476441, -0.3413211, 2.234546, 1, 0, 0.3960784, 1,
1.482081, 0.3129373, 3.545125, 1, 0, 0.3882353, 1,
1.499262, -0.8018984, 3.094306, 1, 0, 0.3843137, 1,
1.505136, -0.9700618, 2.480279, 1, 0, 0.3764706, 1,
1.507381, 1.048641, 0.9417019, 1, 0, 0.372549, 1,
1.507537, 1.6364, 0.3582161, 1, 0, 0.3647059, 1,
1.509449, 0.09058803, 0.6504906, 1, 0, 0.3607843, 1,
1.511451, -0.8366127, 2.210213, 1, 0, 0.3529412, 1,
1.522027, 0.03259412, 1.565224, 1, 0, 0.3490196, 1,
1.529046, 0.2146936, 0.5566778, 1, 0, 0.3411765, 1,
1.562577, -0.7234361, 2.854097, 1, 0, 0.3372549, 1,
1.567972, 2.531514, 1.251678, 1, 0, 0.3294118, 1,
1.581259, 1.31276, -0.7756953, 1, 0, 0.3254902, 1,
1.584352, -0.5753417, 2.036665, 1, 0, 0.3176471, 1,
1.586597, 0.2987639, 1.937958, 1, 0, 0.3137255, 1,
1.589981, -1.020992, 1.47527, 1, 0, 0.3058824, 1,
1.603836, 0.04098482, 2.459041, 1, 0, 0.2980392, 1,
1.605734, -1.064906, 2.366517, 1, 0, 0.2941177, 1,
1.6091, 0.2233835, 2.552868, 1, 0, 0.2862745, 1,
1.622161, 1.427541, 0.8342651, 1, 0, 0.282353, 1,
1.638926, 1.597346, 1.192538, 1, 0, 0.2745098, 1,
1.654322, 0.1738799, 3.949125, 1, 0, 0.2705882, 1,
1.678516, 0.9130995, 0.1907248, 1, 0, 0.2627451, 1,
1.686693, -0.9251978, 1.793715, 1, 0, 0.2588235, 1,
1.719854, 2.325399, 2.644418, 1, 0, 0.2509804, 1,
1.720236, -0.05114637, 1.500817, 1, 0, 0.2470588, 1,
1.740275, -0.3368363, 2.718326, 1, 0, 0.2392157, 1,
1.75483, -0.321502, 1.960174, 1, 0, 0.2352941, 1,
1.811782, 1.636215, -0.4817091, 1, 0, 0.227451, 1,
1.864699, -1.095422, 1.746832, 1, 0, 0.2235294, 1,
1.865743, -0.3824221, 2.11583, 1, 0, 0.2156863, 1,
1.909383, 1.105332, 2.141495, 1, 0, 0.2117647, 1,
1.933375, -0.1751525, 1.014009, 1, 0, 0.2039216, 1,
1.937401, 1.456832, 0.7844912, 1, 0, 0.1960784, 1,
1.956231, -1.311924, 3.774757, 1, 0, 0.1921569, 1,
1.95992, -1.361577, 2.615331, 1, 0, 0.1843137, 1,
1.968259, 0.3987588, 2.331442, 1, 0, 0.1803922, 1,
1.985867, 0.3139212, 2.609709, 1, 0, 0.172549, 1,
2.007487, -0.6893613, 0.5047467, 1, 0, 0.1686275, 1,
2.019533, -0.6269613, 2.659417, 1, 0, 0.1607843, 1,
2.023028, 0.297216, -0.05623649, 1, 0, 0.1568628, 1,
2.028207, -1.420595, 1.265066, 1, 0, 0.1490196, 1,
2.031368, 0.7837312, 1.891243, 1, 0, 0.145098, 1,
2.033407, -0.0690827, 1.460142, 1, 0, 0.1372549, 1,
2.048201, 2.167414, -0.8956418, 1, 0, 0.1333333, 1,
2.053935, 0.6207324, 0.6777661, 1, 0, 0.1254902, 1,
2.058862, 0.9119095, -0.01672011, 1, 0, 0.1215686, 1,
2.075447, 0.8880558, -0.2102199, 1, 0, 0.1137255, 1,
2.100527, 0.9412324, 0.8059399, 1, 0, 0.1098039, 1,
2.102144, -0.1863023, 2.138376, 1, 0, 0.1019608, 1,
2.106081, -1.971434, 1.969266, 1, 0, 0.09411765, 1,
2.114704, -0.312776, 2.054898, 1, 0, 0.09019608, 1,
2.115213, 2.226603, -0.05280546, 1, 0, 0.08235294, 1,
2.129049, -0.5748824, 1.10753, 1, 0, 0.07843138, 1,
2.173819, 0.9318061, 1.174006, 1, 0, 0.07058824, 1,
2.198907, -1.42487, 0.008316266, 1, 0, 0.06666667, 1,
2.221923, -0.2113188, 1.520083, 1, 0, 0.05882353, 1,
2.230994, 0.2127903, 0.3969484, 1, 0, 0.05490196, 1,
2.286272, 0.4386927, 1.060955, 1, 0, 0.04705882, 1,
2.357933, 0.1710083, 1.756796, 1, 0, 0.04313726, 1,
2.538274, -0.5429966, 2.151861, 1, 0, 0.03529412, 1,
2.600457, -0.1292425, 2.136085, 1, 0, 0.03137255, 1,
2.647968, -1.50211, 1.444817, 1, 0, 0.02352941, 1,
2.706889, -0.2458158, 3.398067, 1, 0, 0.01960784, 1,
2.768621, 1.558138, 1.036765, 1, 0, 0.01176471, 1,
3.452008, -1.158583, 0.5833732, 1, 0, 0.007843138, 1
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
0.3438576, -4.662118, -7.391254, 0, -0.5, 0.5, 0.5,
0.3438576, -4.662118, -7.391254, 1, -0.5, 0.5, 0.5,
0.3438576, -4.662118, -7.391254, 1, 1.5, 0.5, 0.5,
0.3438576, -4.662118, -7.391254, 0, 1.5, 0.5, 0.5
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
-3.817956, -0.3404571, -7.391254, 0, -0.5, 0.5, 0.5,
-3.817956, -0.3404571, -7.391254, 1, -0.5, 0.5, 0.5,
-3.817956, -0.3404571, -7.391254, 1, 1.5, 0.5, 0.5,
-3.817956, -0.3404571, -7.391254, 0, 1.5, 0.5, 0.5
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
-3.817956, -4.662118, 0.2313237, 0, -0.5, 0.5, 0.5,
-3.817956, -4.662118, 0.2313237, 1, -0.5, 0.5, 0.5,
-3.817956, -4.662118, 0.2313237, 1, 1.5, 0.5, 0.5,
-3.817956, -4.662118, 0.2313237, 0, 1.5, 0.5, 0.5
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
-2, -3.664812, -5.632198,
3, -3.664812, -5.632198,
-2, -3.664812, -5.632198,
-2, -3.83103, -5.925374,
-1, -3.664812, -5.632198,
-1, -3.83103, -5.925374,
0, -3.664812, -5.632198,
0, -3.83103, -5.925374,
1, -3.664812, -5.632198,
1, -3.83103, -5.925374,
2, -3.664812, -5.632198,
2, -3.83103, -5.925374,
3, -3.664812, -5.632198,
3, -3.83103, -5.925374
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
-2, -4.163465, -6.511726, 0, -0.5, 0.5, 0.5,
-2, -4.163465, -6.511726, 1, -0.5, 0.5, 0.5,
-2, -4.163465, -6.511726, 1, 1.5, 0.5, 0.5,
-2, -4.163465, -6.511726, 0, 1.5, 0.5, 0.5,
-1, -4.163465, -6.511726, 0, -0.5, 0.5, 0.5,
-1, -4.163465, -6.511726, 1, -0.5, 0.5, 0.5,
-1, -4.163465, -6.511726, 1, 1.5, 0.5, 0.5,
-1, -4.163465, -6.511726, 0, 1.5, 0.5, 0.5,
0, -4.163465, -6.511726, 0, -0.5, 0.5, 0.5,
0, -4.163465, -6.511726, 1, -0.5, 0.5, 0.5,
0, -4.163465, -6.511726, 1, 1.5, 0.5, 0.5,
0, -4.163465, -6.511726, 0, 1.5, 0.5, 0.5,
1, -4.163465, -6.511726, 0, -0.5, 0.5, 0.5,
1, -4.163465, -6.511726, 1, -0.5, 0.5, 0.5,
1, -4.163465, -6.511726, 1, 1.5, 0.5, 0.5,
1, -4.163465, -6.511726, 0, 1.5, 0.5, 0.5,
2, -4.163465, -6.511726, 0, -0.5, 0.5, 0.5,
2, -4.163465, -6.511726, 1, -0.5, 0.5, 0.5,
2, -4.163465, -6.511726, 1, 1.5, 0.5, 0.5,
2, -4.163465, -6.511726, 0, 1.5, 0.5, 0.5,
3, -4.163465, -6.511726, 0, -0.5, 0.5, 0.5,
3, -4.163465, -6.511726, 1, -0.5, 0.5, 0.5,
3, -4.163465, -6.511726, 1, 1.5, 0.5, 0.5,
3, -4.163465, -6.511726, 0, 1.5, 0.5, 0.5
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
-2.857538, -3, -5.632198,
-2.857538, 2, -5.632198,
-2.857538, -3, -5.632198,
-3.017607, -3, -5.925374,
-2.857538, -2, -5.632198,
-3.017607, -2, -5.925374,
-2.857538, -1, -5.632198,
-3.017607, -1, -5.925374,
-2.857538, 0, -5.632198,
-3.017607, 0, -5.925374,
-2.857538, 1, -5.632198,
-3.017607, 1, -5.925374,
-2.857538, 2, -5.632198,
-3.017607, 2, -5.925374
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
-3.337747, -3, -6.511726, 0, -0.5, 0.5, 0.5,
-3.337747, -3, -6.511726, 1, -0.5, 0.5, 0.5,
-3.337747, -3, -6.511726, 1, 1.5, 0.5, 0.5,
-3.337747, -3, -6.511726, 0, 1.5, 0.5, 0.5,
-3.337747, -2, -6.511726, 0, -0.5, 0.5, 0.5,
-3.337747, -2, -6.511726, 1, -0.5, 0.5, 0.5,
-3.337747, -2, -6.511726, 1, 1.5, 0.5, 0.5,
-3.337747, -2, -6.511726, 0, 1.5, 0.5, 0.5,
-3.337747, -1, -6.511726, 0, -0.5, 0.5, 0.5,
-3.337747, -1, -6.511726, 1, -0.5, 0.5, 0.5,
-3.337747, -1, -6.511726, 1, 1.5, 0.5, 0.5,
-3.337747, -1, -6.511726, 0, 1.5, 0.5, 0.5,
-3.337747, 0, -6.511726, 0, -0.5, 0.5, 0.5,
-3.337747, 0, -6.511726, 1, -0.5, 0.5, 0.5,
-3.337747, 0, -6.511726, 1, 1.5, 0.5, 0.5,
-3.337747, 0, -6.511726, 0, 1.5, 0.5, 0.5,
-3.337747, 1, -6.511726, 0, -0.5, 0.5, 0.5,
-3.337747, 1, -6.511726, 1, -0.5, 0.5, 0.5,
-3.337747, 1, -6.511726, 1, 1.5, 0.5, 0.5,
-3.337747, 1, -6.511726, 0, 1.5, 0.5, 0.5,
-3.337747, 2, -6.511726, 0, -0.5, 0.5, 0.5,
-3.337747, 2, -6.511726, 1, -0.5, 0.5, 0.5,
-3.337747, 2, -6.511726, 1, 1.5, 0.5, 0.5,
-3.337747, 2, -6.511726, 0, 1.5, 0.5, 0.5
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
-2.857538, -3.664812, -4,
-2.857538, -3.664812, 4,
-2.857538, -3.664812, -4,
-3.017607, -3.83103, -4,
-2.857538, -3.664812, -2,
-3.017607, -3.83103, -2,
-2.857538, -3.664812, 0,
-3.017607, -3.83103, 0,
-2.857538, -3.664812, 2,
-3.017607, -3.83103, 2,
-2.857538, -3.664812, 4,
-3.017607, -3.83103, 4
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
-3.337747, -4.163465, -4, 0, -0.5, 0.5, 0.5,
-3.337747, -4.163465, -4, 1, -0.5, 0.5, 0.5,
-3.337747, -4.163465, -4, 1, 1.5, 0.5, 0.5,
-3.337747, -4.163465, -4, 0, 1.5, 0.5, 0.5,
-3.337747, -4.163465, -2, 0, -0.5, 0.5, 0.5,
-3.337747, -4.163465, -2, 1, -0.5, 0.5, 0.5,
-3.337747, -4.163465, -2, 1, 1.5, 0.5, 0.5,
-3.337747, -4.163465, -2, 0, 1.5, 0.5, 0.5,
-3.337747, -4.163465, 0, 0, -0.5, 0.5, 0.5,
-3.337747, -4.163465, 0, 1, -0.5, 0.5, 0.5,
-3.337747, -4.163465, 0, 1, 1.5, 0.5, 0.5,
-3.337747, -4.163465, 0, 0, 1.5, 0.5, 0.5,
-3.337747, -4.163465, 2, 0, -0.5, 0.5, 0.5,
-3.337747, -4.163465, 2, 1, -0.5, 0.5, 0.5,
-3.337747, -4.163465, 2, 1, 1.5, 0.5, 0.5,
-3.337747, -4.163465, 2, 0, 1.5, 0.5, 0.5,
-3.337747, -4.163465, 4, 0, -0.5, 0.5, 0.5,
-3.337747, -4.163465, 4, 1, -0.5, 0.5, 0.5,
-3.337747, -4.163465, 4, 1, 1.5, 0.5, 0.5,
-3.337747, -4.163465, 4, 0, 1.5, 0.5, 0.5
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
-2.857538, -3.664812, -5.632198,
-2.857538, 2.983898, -5.632198,
-2.857538, -3.664812, 6.094845,
-2.857538, 2.983898, 6.094845,
-2.857538, -3.664812, -5.632198,
-2.857538, -3.664812, 6.094845,
-2.857538, 2.983898, -5.632198,
-2.857538, 2.983898, 6.094845,
-2.857538, -3.664812, -5.632198,
3.545253, -3.664812, -5.632198,
-2.857538, -3.664812, 6.094845,
3.545253, -3.664812, 6.094845,
-2.857538, 2.983898, -5.632198,
3.545253, 2.983898, -5.632198,
-2.857538, 2.983898, 6.094845,
3.545253, 2.983898, 6.094845,
3.545253, -3.664812, -5.632198,
3.545253, 2.983898, -5.632198,
3.545253, -3.664812, 6.094845,
3.545253, 2.983898, 6.094845,
3.545253, -3.664812, -5.632198,
3.545253, -3.664812, 6.094845,
3.545253, 2.983898, -5.632198,
3.545253, 2.983898, 6.094845
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
var radius = 7.969106;
var distance = 35.45545;
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
mvMatrix.translate( -0.3438576, 0.3404571, -0.2313237 );
mvMatrix.scale( 1.345719, 1.295943, 0.7347422 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.45545);
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
cyfluthrin<-read.table("cyfluthrin.xyz")
```

```
## Error in read.table("cyfluthrin.xyz"): no lines available in input
```

```r
x<-cyfluthrin$V2
```

```
## Error in eval(expr, envir, enclos): object 'cyfluthrin' not found
```

```r
y<-cyfluthrin$V3
```

```
## Error in eval(expr, envir, enclos): object 'cyfluthrin' not found
```

```r
z<-cyfluthrin$V4
```

```
## Error in eval(expr, envir, enclos): object 'cyfluthrin' not found
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
-2.764293, -1.16386, -2.383932, 0, 0, 1, 1, 1,
-2.589758, 0.6623408, -1.387037, 1, 0, 0, 1, 1,
-2.499783, 1.992258, -1.99546, 1, 0, 0, 1, 1,
-2.419029, 0.9096208, -1.536663, 1, 0, 0, 1, 1,
-2.415485, 0.2397991, 0.1094675, 1, 0, 0, 1, 1,
-2.398215, -0.382031, -2.346837, 1, 0, 0, 1, 1,
-2.32988, -1.141579, -1.260579, 0, 0, 0, 1, 1,
-2.326008, 0.7036885, -1.448631, 0, 0, 0, 1, 1,
-2.295473, -0.3667504, -0.3018148, 0, 0, 0, 1, 1,
-2.262453, -0.2966782, -3.30196, 0, 0, 0, 1, 1,
-2.256859, -1.07888, -0.5017413, 0, 0, 0, 1, 1,
-2.164672, 1.455904, -1.193164, 0, 0, 0, 1, 1,
-2.14194, 0.3213823, -2.620728, 0, 0, 0, 1, 1,
-2.116903, -1.027987, -2.348744, 1, 1, 1, 1, 1,
-2.077357, 1.533321, -1.700834, 1, 1, 1, 1, 1,
-2.0581, -0.2559143, -1.371912, 1, 1, 1, 1, 1,
-2.04456, 0.2072699, -0.1013002, 1, 1, 1, 1, 1,
-2.02738, 0.5034645, -2.529332, 1, 1, 1, 1, 1,
-2.013576, -0.1155037, 0.07562804, 1, 1, 1, 1, 1,
-1.957252, -1.902906, -2.08297, 1, 1, 1, 1, 1,
-1.94819, 0.5031114, -2.272734, 1, 1, 1, 1, 1,
-1.945145, 0.9487826, 0.3934288, 1, 1, 1, 1, 1,
-1.925947, 0.8388364, -2.166728, 1, 1, 1, 1, 1,
-1.888422, 1.134113, -0.9645047, 1, 1, 1, 1, 1,
-1.886062, -1.132546, -2.331438, 1, 1, 1, 1, 1,
-1.848046, -1.46232, -3.070515, 1, 1, 1, 1, 1,
-1.823885, -0.3255451, -2.432911, 1, 1, 1, 1, 1,
-1.820993, 0.2413612, -1.819623, 1, 1, 1, 1, 1,
-1.815312, -0.9102589, -2.672585, 0, 0, 1, 1, 1,
-1.808028, 0.5343062, -2.494485, 1, 0, 0, 1, 1,
-1.801042, 1.689805, -1.045167, 1, 0, 0, 1, 1,
-1.786187, -1.222176, -1.95658, 1, 0, 0, 1, 1,
-1.772746, -0.01912158, -1.078286, 1, 0, 0, 1, 1,
-1.748847, 2.021021, -1.729394, 1, 0, 0, 1, 1,
-1.734035, -0.8627542, -1.987962, 0, 0, 0, 1, 1,
-1.708802, 0.9669987, -1.142864, 0, 0, 0, 1, 1,
-1.7057, -0.2917455, -1.119499, 0, 0, 0, 1, 1,
-1.703459, -1.984119, -1.803025, 0, 0, 0, 1, 1,
-1.694392, 0.3031902, -2.71613, 0, 0, 0, 1, 1,
-1.688843, -1.664039, -2.794232, 0, 0, 0, 1, 1,
-1.674789, 0.4818858, -1.491052, 0, 0, 0, 1, 1,
-1.656391, 0.6917986, -2.569396, 1, 1, 1, 1, 1,
-1.654787, 0.7216222, -1.533671, 1, 1, 1, 1, 1,
-1.635962, 0.4200993, -0.1351263, 1, 1, 1, 1, 1,
-1.635066, -0.08023387, -1.232782, 1, 1, 1, 1, 1,
-1.604961, 0.5662449, -1.439891, 1, 1, 1, 1, 1,
-1.596503, -1.432992, -3.984758, 1, 1, 1, 1, 1,
-1.586424, 0.3451718, -2.642004, 1, 1, 1, 1, 1,
-1.562032, -0.472545, -1.419324, 1, 1, 1, 1, 1,
-1.555494, 0.1308159, -2.417564, 1, 1, 1, 1, 1,
-1.5496, -0.4953738, -2.800889, 1, 1, 1, 1, 1,
-1.542936, 2.327056, 1.252968, 1, 1, 1, 1, 1,
-1.530588, -0.943679, -1.437539, 1, 1, 1, 1, 1,
-1.524968, -0.005779146, -0.9746366, 1, 1, 1, 1, 1,
-1.511985, 0.6983972, -0.6857422, 1, 1, 1, 1, 1,
-1.502399, -0.9344959, -1.114496, 1, 1, 1, 1, 1,
-1.502312, -0.05725161, -2.199127, 0, 0, 1, 1, 1,
-1.490243, 1.29616, 0.5884811, 1, 0, 0, 1, 1,
-1.48397, -1.440813, -1.790253, 1, 0, 0, 1, 1,
-1.466075, -0.8303359, -0.7127368, 1, 0, 0, 1, 1,
-1.464638, -1.118877, -1.773666, 1, 0, 0, 1, 1,
-1.462704, 1.144896, -1.416697, 1, 0, 0, 1, 1,
-1.4627, -0.03282755, -1.258292, 0, 0, 0, 1, 1,
-1.456394, -1.188616, -1.641635, 0, 0, 0, 1, 1,
-1.4382, -0.5951379, -2.147063, 0, 0, 0, 1, 1,
-1.435279, -0.4401065, -1.618507, 0, 0, 0, 1, 1,
-1.426707, -0.02191153, 0.1512774, 0, 0, 0, 1, 1,
-1.424949, -1.61596, -2.783378, 0, 0, 0, 1, 1,
-1.417087, 0.2688834, -3.376816, 0, 0, 0, 1, 1,
-1.398269, -1.633414, -2.465285, 1, 1, 1, 1, 1,
-1.395423, -0.06490379, -2.482044, 1, 1, 1, 1, 1,
-1.395339, 0.07993262, -2.313542, 1, 1, 1, 1, 1,
-1.390949, -0.8144356, -2.128442, 1, 1, 1, 1, 1,
-1.376921, 0.06447569, -2.196844, 1, 1, 1, 1, 1,
-1.3713, 0.01924184, -0.2636904, 1, 1, 1, 1, 1,
-1.371091, -0.2255699, -2.327221, 1, 1, 1, 1, 1,
-1.368868, -1.461834, -2.919272, 1, 1, 1, 1, 1,
-1.367984, -1.822934, -2.639553, 1, 1, 1, 1, 1,
-1.367325, 0.3703209, -0.2888612, 1, 1, 1, 1, 1,
-1.350169, 0.009271035, -2.180513, 1, 1, 1, 1, 1,
-1.342188, 0.7365947, -1.764704, 1, 1, 1, 1, 1,
-1.332458, -1.100487, -2.079723, 1, 1, 1, 1, 1,
-1.326808, -0.3688715, -3.582007, 1, 1, 1, 1, 1,
-1.315175, 0.8578851, -1.161346, 1, 1, 1, 1, 1,
-1.312782, -1.044967, -2.578008, 0, 0, 1, 1, 1,
-1.302136, -0.479077, -2.409458, 1, 0, 0, 1, 1,
-1.300229, -0.5279251, -2.183727, 1, 0, 0, 1, 1,
-1.288752, -0.2124523, -3.558552, 1, 0, 0, 1, 1,
-1.288271, -2.183739, -2.815613, 1, 0, 0, 1, 1,
-1.286093, -0.06316648, -2.944681, 1, 0, 0, 1, 1,
-1.277, -0.4023379, -1.27327, 0, 0, 0, 1, 1,
-1.274369, 0.3652195, 0.07649231, 0, 0, 0, 1, 1,
-1.254903, -1.580607, -1.508944, 0, 0, 0, 1, 1,
-1.251718, 1.125138, -1.968523, 0, 0, 0, 1, 1,
-1.237063, 0.4600632, -2.316576, 0, 0, 0, 1, 1,
-1.235155, -0.4316044, -3.696502, 0, 0, 0, 1, 1,
-1.228719, -0.03248667, -0.1056703, 0, 0, 0, 1, 1,
-1.228294, -2.4489, -2.935315, 1, 1, 1, 1, 1,
-1.223616, 0.1407019, -2.581985, 1, 1, 1, 1, 1,
-1.222223, 0.7605932, -0.3496469, 1, 1, 1, 1, 1,
-1.221108, -2.252747, -2.495888, 1, 1, 1, 1, 1,
-1.202207, 1.674389, -1.187784, 1, 1, 1, 1, 1,
-1.201321, -0.3796269, -0.6069204, 1, 1, 1, 1, 1,
-1.189732, 0.1820705, -2.165631, 1, 1, 1, 1, 1,
-1.183746, -0.5336782, -2.276665, 1, 1, 1, 1, 1,
-1.181388, 1.395894, -0.6213841, 1, 1, 1, 1, 1,
-1.179786, -0.1883228, 1.123307, 1, 1, 1, 1, 1,
-1.175269, 1.268132, 0.6960537, 1, 1, 1, 1, 1,
-1.17445, -0.866031, -2.062619, 1, 1, 1, 1, 1,
-1.168092, -0.7138935, -1.650447, 1, 1, 1, 1, 1,
-1.164884, 0.4465803, -1.085325, 1, 1, 1, 1, 1,
-1.159478, -0.009039539, -0.8615095, 1, 1, 1, 1, 1,
-1.157846, -0.08349172, -2.408031, 0, 0, 1, 1, 1,
-1.157165, -1.150711, -3.496211, 1, 0, 0, 1, 1,
-1.155848, 0.4125984, -0.9596017, 1, 0, 0, 1, 1,
-1.155078, -0.8741052, -2.809484, 1, 0, 0, 1, 1,
-1.153674, 0.02201071, -2.326535, 1, 0, 0, 1, 1,
-1.150292, 0.7107715, 0.1767815, 1, 0, 0, 1, 1,
-1.146044, 0.8470842, -1.01311, 0, 0, 0, 1, 1,
-1.140986, -2.091898, -2.21128, 0, 0, 0, 1, 1,
-1.138283, 0.3007955, -0.5400098, 0, 0, 0, 1, 1,
-1.137808, 0.605195, 0.8674103, 0, 0, 0, 1, 1,
-1.129157, 1.276109, 1.164111, 0, 0, 0, 1, 1,
-1.128701, -0.4128865, -1.889479, 0, 0, 0, 1, 1,
-1.126413, 0.2376047, -2.07352, 0, 0, 0, 1, 1,
-1.109381, 1.267689, -1.578833, 1, 1, 1, 1, 1,
-1.098085, 0.6758984, -0.7706397, 1, 1, 1, 1, 1,
-1.097677, 0.03777005, -2.33751, 1, 1, 1, 1, 1,
-1.095214, 0.9777988, -0.703227, 1, 1, 1, 1, 1,
-1.085042, -0.6507542, -0.4087432, 1, 1, 1, 1, 1,
-1.083589, 0.1505727, -2.075572, 1, 1, 1, 1, 1,
-1.080754, 0.6810737, -2.003911, 1, 1, 1, 1, 1,
-1.074808, -1.814971, -3.644132, 1, 1, 1, 1, 1,
-1.073165, 1.152066, -0.6791625, 1, 1, 1, 1, 1,
-1.073093, -0.9704478, -1.74196, 1, 1, 1, 1, 1,
-1.070711, -0.9619048, -1.369996, 1, 1, 1, 1, 1,
-1.060588, -1.702681, -2.482759, 1, 1, 1, 1, 1,
-1.060031, -0.5034199, -1.759486, 1, 1, 1, 1, 1,
-1.057441, 1.787588, -2.573731, 1, 1, 1, 1, 1,
-1.057337, -1.441754, -0.5924036, 1, 1, 1, 1, 1,
-1.057252, 1.883533, 0.8910044, 0, 0, 1, 1, 1,
-1.056095, 0.4633183, -0.7773746, 1, 0, 0, 1, 1,
-1.051482, 0.3110147, -0.8099331, 1, 0, 0, 1, 1,
-1.050371, -0.1751225, -2.353708, 1, 0, 0, 1, 1,
-1.047726, 0.7982605, -0.4816278, 1, 0, 0, 1, 1,
-1.046942, 1.067113, -1.710129, 1, 0, 0, 1, 1,
-1.041901, 0.3903994, 0.04570159, 0, 0, 0, 1, 1,
-1.034828, -0.5724185, -2.101799, 0, 0, 0, 1, 1,
-1.034309, -0.1748018, -1.830884, 0, 0, 0, 1, 1,
-1.033778, -0.4884752, -3.515493, 0, 0, 0, 1, 1,
-1.032199, 1.364338, 0.1901008, 0, 0, 0, 1, 1,
-1.030448, -0.8251018, -2.036299, 0, 0, 0, 1, 1,
-1.028074, -0.3593943, -1.088492, 0, 0, 0, 1, 1,
-1.027615, -0.07203554, -2.654644, 1, 1, 1, 1, 1,
-1.024474, 0.7678449, 0.6747907, 1, 1, 1, 1, 1,
-1.022938, -0.9076337, -1.691912, 1, 1, 1, 1, 1,
-1.021636, 0.3378901, 0.2157143, 1, 1, 1, 1, 1,
-1.019489, 1.5764, -0.2242017, 1, 1, 1, 1, 1,
-1.017609, -0.455314, -3.464104, 1, 1, 1, 1, 1,
-1.015011, 0.7665923, -1.840077, 1, 1, 1, 1, 1,
-1.013946, 0.05788309, 0.1047922, 1, 1, 1, 1, 1,
-1.004255, -0.8325811, -1.756806, 1, 1, 1, 1, 1,
-1.000415, 0.9373121, -1.689506, 1, 1, 1, 1, 1,
-0.9897698, -0.8258999, -2.751193, 1, 1, 1, 1, 1,
-0.9891283, -0.7209297, -3.464056, 1, 1, 1, 1, 1,
-0.9876425, 0.7764965, 1.43444, 1, 1, 1, 1, 1,
-0.9865426, 0.1725961, -3.241911, 1, 1, 1, 1, 1,
-0.9860322, -0.5199241, 0.5143299, 1, 1, 1, 1, 1,
-0.982195, -0.004810225, -3.369957, 0, 0, 1, 1, 1,
-0.9757811, -0.1357819, -1.95271, 1, 0, 0, 1, 1,
-0.9745367, -0.6110553, -2.921997, 1, 0, 0, 1, 1,
-0.9735175, -1.619365, -0.7847634, 1, 0, 0, 1, 1,
-0.9704151, 0.171862, -0.810423, 1, 0, 0, 1, 1,
-0.9651318, 1.551763, 2.183618, 1, 0, 0, 1, 1,
-0.9641654, -0.2218976, -1.657746, 0, 0, 0, 1, 1,
-0.9636964, -2.310201, -2.929798, 0, 0, 0, 1, 1,
-0.9620357, 1.541834, -0.2062457, 0, 0, 0, 1, 1,
-0.9611604, -0.4991557, -4.872655, 0, 0, 0, 1, 1,
-0.9578381, -0.3631992, -1.076558, 0, 0, 0, 1, 1,
-0.9530221, 0.2514023, -0.07793385, 0, 0, 0, 1, 1,
-0.9432312, -0.8512363, -1.100882, 0, 0, 0, 1, 1,
-0.9426721, 1.623247, -0.7122842, 1, 1, 1, 1, 1,
-0.9408171, -0.01366469, -2.190264, 1, 1, 1, 1, 1,
-0.9308648, 2.033115, -3.325803, 1, 1, 1, 1, 1,
-0.9287776, -0.1753502, -2.180855, 1, 1, 1, 1, 1,
-0.9229105, -0.3967808, -2.867648, 1, 1, 1, 1, 1,
-0.9223213, 1.874595, -1.010445, 1, 1, 1, 1, 1,
-0.9206113, -1.129618, -2.114507, 1, 1, 1, 1, 1,
-0.9170734, -0.1571692, -0.7180736, 1, 1, 1, 1, 1,
-0.914939, -0.3754848, -1.995739, 1, 1, 1, 1, 1,
-0.9130864, 0.6457864, -1.67322, 1, 1, 1, 1, 1,
-0.9096874, -1.881738, 0.4879828, 1, 1, 1, 1, 1,
-0.9040773, 0.1485072, -1.131466, 1, 1, 1, 1, 1,
-0.8935409, 0.8430979, 0.6923817, 1, 1, 1, 1, 1,
-0.8886411, -0.3005382, -1.857079, 1, 1, 1, 1, 1,
-0.8825185, -1.432015, -2.217622, 1, 1, 1, 1, 1,
-0.8810486, -0.9390127, -2.415688, 0, 0, 1, 1, 1,
-0.8804321, 1.849548, -3.389342, 1, 0, 0, 1, 1,
-0.8803301, -1.486065, -4.003168, 1, 0, 0, 1, 1,
-0.8802225, 1.058147, -1.535681, 1, 0, 0, 1, 1,
-0.8793507, -1.314137, -3.644561, 1, 0, 0, 1, 1,
-0.8768417, -0.3255619, -3.060534, 1, 0, 0, 1, 1,
-0.8754514, 0.06449583, -2.041614, 0, 0, 0, 1, 1,
-0.873679, -0.6027181, -1.32299, 0, 0, 0, 1, 1,
-0.8706359, -1.111802, -1.37539, 0, 0, 0, 1, 1,
-0.8697122, -2.131206, -3.269168, 0, 0, 0, 1, 1,
-0.860131, 0.5815101, -0.05680161, 0, 0, 0, 1, 1,
-0.859695, -0.2627176, -0.9945952, 0, 0, 0, 1, 1,
-0.8583819, -0.4012193, -1.634642, 0, 0, 0, 1, 1,
-0.8555349, -1.04248, -3.452542, 1, 1, 1, 1, 1,
-0.8540448, 1.069003, -2.074862, 1, 1, 1, 1, 1,
-0.8507884, -0.8585097, -0.575326, 1, 1, 1, 1, 1,
-0.8375402, -1.459392, -3.863619, 1, 1, 1, 1, 1,
-0.8358123, -0.5263586, -1.77835, 1, 1, 1, 1, 1,
-0.832111, -0.2463044, -2.032883, 1, 1, 1, 1, 1,
-0.826381, -1.449637, -4.399974, 1, 1, 1, 1, 1,
-0.8115001, 1.49778, -0.310969, 1, 1, 1, 1, 1,
-0.8083525, -1.109334, -1.871132, 1, 1, 1, 1, 1,
-0.8038984, 0.65938, 0.5781559, 1, 1, 1, 1, 1,
-0.8037103, 2.301189, 0.8106546, 1, 1, 1, 1, 1,
-0.803171, 1.577131, -0.7322953, 1, 1, 1, 1, 1,
-0.8022484, 0.6778123, -0.8519999, 1, 1, 1, 1, 1,
-0.7983437, 0.3590494, -1.575253, 1, 1, 1, 1, 1,
-0.7966881, -1.287757, -1.972072, 1, 1, 1, 1, 1,
-0.793232, -0.9123948, -2.752455, 0, 0, 1, 1, 1,
-0.7881895, 0.04166683, -1.859334, 1, 0, 0, 1, 1,
-0.788072, 1.671532, -1.9073, 1, 0, 0, 1, 1,
-0.7822216, 0.01694191, -2.45542, 1, 0, 0, 1, 1,
-0.7739735, -0.7880524, -2.335175, 1, 0, 0, 1, 1,
-0.7703705, -0.2198009, -1.750799, 1, 0, 0, 1, 1,
-0.7692512, -1.010998, -1.600605, 0, 0, 0, 1, 1,
-0.7643594, -1.755504, -2.011698, 0, 0, 0, 1, 1,
-0.7604692, -0.1881603, -2.751438, 0, 0, 0, 1, 1,
-0.7532568, -1.231818, -2.167064, 0, 0, 0, 1, 1,
-0.7513198, 0.5689717, -1.655058, 0, 0, 0, 1, 1,
-0.7512589, 0.01320038, -2.847774, 0, 0, 0, 1, 1,
-0.7477655, -0.1878883, -1.850647, 0, 0, 0, 1, 1,
-0.7476273, 1.056342, -1.607857, 1, 1, 1, 1, 1,
-0.7471476, -1.830053, -2.702348, 1, 1, 1, 1, 1,
-0.7462548, 0.3503784, -1.584366, 1, 1, 1, 1, 1,
-0.7413297, -3.470675, -4.563044, 1, 1, 1, 1, 1,
-0.7405551, 1.089142, -0.347393, 1, 1, 1, 1, 1,
-0.7338503, -0.07136712, -1.743304, 1, 1, 1, 1, 1,
-0.733377, 0.4334849, 0.2431966, 1, 1, 1, 1, 1,
-0.7213451, -0.505754, -3.796121, 1, 1, 1, 1, 1,
-0.7205334, -1.108225, -2.167252, 1, 1, 1, 1, 1,
-0.7197184, 0.2128266, -1.30123, 1, 1, 1, 1, 1,
-0.7191211, -0.3030371, -0.9133202, 1, 1, 1, 1, 1,
-0.7094074, -0.5868393, -2.32609, 1, 1, 1, 1, 1,
-0.7089436, 2.175343, 0.6078451, 1, 1, 1, 1, 1,
-0.7078722, -1.59549, -1.608918, 1, 1, 1, 1, 1,
-0.7044804, 1.713056, -0.02668972, 1, 1, 1, 1, 1,
-0.704466, -0.6470917, -2.515927, 0, 0, 1, 1, 1,
-0.6949667, -0.04117797, -2.876318, 1, 0, 0, 1, 1,
-0.693462, 0.01647121, -2.340679, 1, 0, 0, 1, 1,
-0.6892394, -0.6992564, -2.783125, 1, 0, 0, 1, 1,
-0.6879203, -1.023324, -2.387144, 1, 0, 0, 1, 1,
-0.6856095, -0.4235296, -1.402811, 1, 0, 0, 1, 1,
-0.6847001, 0.4930161, -1.763919, 0, 0, 0, 1, 1,
-0.6823252, -0.6458407, -3.057939, 0, 0, 0, 1, 1,
-0.6820037, 1.0417, 0.361828, 0, 0, 0, 1, 1,
-0.6758056, -0.2708845, -2.08007, 0, 0, 0, 1, 1,
-0.6753833, -0.3942882, -1.913333, 0, 0, 0, 1, 1,
-0.6744944, -3.567986, -2.556877, 0, 0, 0, 1, 1,
-0.6706814, -1.200188, -1.344137, 0, 0, 0, 1, 1,
-0.6685374, 0.5294075, -0.278022, 1, 1, 1, 1, 1,
-0.6613846, -0.0755875, -1.026703, 1, 1, 1, 1, 1,
-0.6601723, 0.169335, -0.5911009, 1, 1, 1, 1, 1,
-0.6593105, -0.03076087, -1.518319, 1, 1, 1, 1, 1,
-0.6543968, -1.344175, -3.060647, 1, 1, 1, 1, 1,
-0.6534728, 0.8873876, -0.3832245, 1, 1, 1, 1, 1,
-0.6524896, 0.6496366, 0.2913046, 1, 1, 1, 1, 1,
-0.6497791, -0.1024815, -1.822916, 1, 1, 1, 1, 1,
-0.6417243, 0.6706473, 0.4435503, 1, 1, 1, 1, 1,
-0.6397855, -0.4785593, -2.964893, 1, 1, 1, 1, 1,
-0.639067, -0.02381413, -1.003215, 1, 1, 1, 1, 1,
-0.6381511, -0.2228564, -1.238813, 1, 1, 1, 1, 1,
-0.6329624, -0.6610978, -2.148143, 1, 1, 1, 1, 1,
-0.6323158, 1.536322, -0.0618404, 1, 1, 1, 1, 1,
-0.6277441, 0.5000753, -1.606311, 1, 1, 1, 1, 1,
-0.6242566, 0.36101, -2.287558, 0, 0, 1, 1, 1,
-0.6191933, 0.6512476, -2.103005, 1, 0, 0, 1, 1,
-0.6171823, -0.7411945, -0.6139111, 1, 0, 0, 1, 1,
-0.6168668, -0.4843197, -1.007947, 1, 0, 0, 1, 1,
-0.6166348, -1.253698, -3.487194, 1, 0, 0, 1, 1,
-0.6159143, 1.171562, 0.07136454, 1, 0, 0, 1, 1,
-0.6138672, -0.2256444, -1.316927, 0, 0, 0, 1, 1,
-0.61326, 0.4292185, -1.065789, 0, 0, 0, 1, 1,
-0.6119605, -0.1342995, -1.027231, 0, 0, 0, 1, 1,
-0.6023262, -0.08009601, -1.417243, 0, 0, 0, 1, 1,
-0.5973136, -0.6851045, -1.816374, 0, 0, 0, 1, 1,
-0.5883334, -1.815139, -3.129382, 0, 0, 0, 1, 1,
-0.5875441, 0.6977042, -1.484464, 0, 0, 0, 1, 1,
-0.5808728, 0.4072659, -1.015104, 1, 1, 1, 1, 1,
-0.5760642, -1.055051, -1.037965, 1, 1, 1, 1, 1,
-0.5721156, 0.2967895, 0.348552, 1, 1, 1, 1, 1,
-0.569392, 1.291242, -0.5055736, 1, 1, 1, 1, 1,
-0.5620734, 0.1319531, 0.1441577, 1, 1, 1, 1, 1,
-0.5588841, -0.2849427, -1.276012, 1, 1, 1, 1, 1,
-0.5582228, -0.9530972, -2.513901, 1, 1, 1, 1, 1,
-0.5559436, -0.7007214, -2.957203, 1, 1, 1, 1, 1,
-0.5533276, -1.011216, -2.592599, 1, 1, 1, 1, 1,
-0.5510792, 0.1035274, -0.8799228, 1, 1, 1, 1, 1,
-0.5510416, 0.6876683, 0.3637303, 1, 1, 1, 1, 1,
-0.5467755, -0.7833462, -3.253972, 1, 1, 1, 1, 1,
-0.5436502, -0.06149794, -1.565081, 1, 1, 1, 1, 1,
-0.5297105, 0.5964503, 0.06686243, 1, 1, 1, 1, 1,
-0.5281698, -0.9128408, -2.845338, 1, 1, 1, 1, 1,
-0.5247976, -0.0003595603, -0.9380614, 0, 0, 1, 1, 1,
-0.5181362, -1.8444, -1.708226, 1, 0, 0, 1, 1,
-0.5121933, -0.6771951, -3.905543, 1, 0, 0, 1, 1,
-0.5116304, -1.860053, -2.472185, 1, 0, 0, 1, 1,
-0.5089611, -1.885925, -2.410741, 1, 0, 0, 1, 1,
-0.5051313, -0.8177299, -0.8292859, 1, 0, 0, 1, 1,
-0.4945587, -0.9365014, -2.436013, 0, 0, 0, 1, 1,
-0.492364, -0.2487888, -1.58923, 0, 0, 0, 1, 1,
-0.487306, 1.523296, -0.1902066, 0, 0, 0, 1, 1,
-0.4863212, 2.004131, 0.84698, 0, 0, 0, 1, 1,
-0.4816552, -0.1482852, -1.195702, 0, 0, 0, 1, 1,
-0.4798596, -1.244216, -2.176489, 0, 0, 0, 1, 1,
-0.4791786, -1.105289, -2.656286, 0, 0, 0, 1, 1,
-0.4748186, 1.29113, 0.01880079, 1, 1, 1, 1, 1,
-0.4701973, 0.2500611, -0.4975856, 1, 1, 1, 1, 1,
-0.4694179, 0.6245254, -1.55935, 1, 1, 1, 1, 1,
-0.4693626, -0.3148369, -2.577168, 1, 1, 1, 1, 1,
-0.4692474, -0.3987845, -2.84361, 1, 1, 1, 1, 1,
-0.4691774, -0.7681575, -2.172926, 1, 1, 1, 1, 1,
-0.4685962, 0.4054503, -0.4782513, 1, 1, 1, 1, 1,
-0.4675677, 1.075601, 1.106695, 1, 1, 1, 1, 1,
-0.4649125, 0.5723169, -0.4939866, 1, 1, 1, 1, 1,
-0.4642305, -0.950316, -4.073484, 1, 1, 1, 1, 1,
-0.4608816, -1.105281, -2.577713, 1, 1, 1, 1, 1,
-0.4586985, 0.510559, -0.990292, 1, 1, 1, 1, 1,
-0.457203, -0.6131116, -3.695812, 1, 1, 1, 1, 1,
-0.4559677, 0.460245, -1.561163, 1, 1, 1, 1, 1,
-0.4555902, -0.6988294, -1.569031, 1, 1, 1, 1, 1,
-0.4546593, -0.3969321, -1.582533, 0, 0, 1, 1, 1,
-0.4497219, 0.9102536, 0.6069821, 1, 0, 0, 1, 1,
-0.4496149, -1.08099, -4.133145, 1, 0, 0, 1, 1,
-0.4415641, 0.7960126, -0.1410227, 1, 0, 0, 1, 1,
-0.4410802, -0.1838412, -1.943873, 1, 0, 0, 1, 1,
-0.4395477, -0.9956461, -4.803095, 1, 0, 0, 1, 1,
-0.4323948, 1.045057, -0.3026091, 0, 0, 0, 1, 1,
-0.4321806, 1.26853, -0.7587729, 0, 0, 0, 1, 1,
-0.4316702, 0.5116432, -1.714993, 0, 0, 0, 1, 1,
-0.4264994, -2.341815, -2.851611, 0, 0, 0, 1, 1,
-0.4246389, 1.754926, 1.08558, 0, 0, 0, 1, 1,
-0.4242146, 0.3919285, -2.558486, 0, 0, 0, 1, 1,
-0.4221281, 1.095146, -1.861402, 0, 0, 0, 1, 1,
-0.4213156, -1.101168, -2.826202, 1, 1, 1, 1, 1,
-0.4176556, -1.046742, -1.207744, 1, 1, 1, 1, 1,
-0.4166354, -1.264, -1.146541, 1, 1, 1, 1, 1,
-0.4110485, 0.4400979, 0.4442747, 1, 1, 1, 1, 1,
-0.4091561, -0.3621719, -1.562687, 1, 1, 1, 1, 1,
-0.4069708, -1.895853, -2.92147, 1, 1, 1, 1, 1,
-0.3994767, 1.318347, 0.4870832, 1, 1, 1, 1, 1,
-0.3982916, 0.2369564, -2.004574, 1, 1, 1, 1, 1,
-0.3981992, -0.2932344, -1.929882, 1, 1, 1, 1, 1,
-0.3913364, 0.19539, 0.2062408, 1, 1, 1, 1, 1,
-0.383347, 0.642376, 0.2290835, 1, 1, 1, 1, 1,
-0.3742565, 1.525295, 0.5552301, 1, 1, 1, 1, 1,
-0.368686, -1.207443, -2.361765, 1, 1, 1, 1, 1,
-0.3685654, -1.355922, -4.566613, 1, 1, 1, 1, 1,
-0.3683628, 0.4375929, -0.3118673, 1, 1, 1, 1, 1,
-0.3634307, 0.05893212, -1.003467, 0, 0, 1, 1, 1,
-0.3625149, 0.8472922, -0.8344584, 1, 0, 0, 1, 1,
-0.3607627, -1.927956, -3.037752, 1, 0, 0, 1, 1,
-0.3573885, 0.2975881, 0.9907219, 1, 0, 0, 1, 1,
-0.3536018, 0.9668159, -0.1965671, 1, 0, 0, 1, 1,
-0.35233, 0.8830024, -0.8465369, 1, 0, 0, 1, 1,
-0.3463888, 1.373019, 1.470439, 0, 0, 0, 1, 1,
-0.3444044, -1.552187, -1.904669, 0, 0, 0, 1, 1,
-0.3442157, -2.299545, -3.237874, 0, 0, 0, 1, 1,
-0.3417696, 0.1164993, -1.648769, 0, 0, 0, 1, 1,
-0.3320673, 0.5770766, 0.1825951, 0, 0, 0, 1, 1,
-0.3313053, 1.819119, -0.191627, 0, 0, 0, 1, 1,
-0.3282229, -0.1776315, -1.694741, 0, 0, 0, 1, 1,
-0.3276586, 0.4107494, -0.2348065, 1, 1, 1, 1, 1,
-0.3256177, 0.9368703, 0.1047758, 1, 1, 1, 1, 1,
-0.3253573, 0.7153531, -1.283634, 1, 1, 1, 1, 1,
-0.3240252, 0.7148157, -0.3569187, 1, 1, 1, 1, 1,
-0.322842, 0.1260438, -1.764204, 1, 1, 1, 1, 1,
-0.3219075, -0.5552027, -2.255561, 1, 1, 1, 1, 1,
-0.3214521, 0.3874621, -0.9118932, 1, 1, 1, 1, 1,
-0.3204148, 0.0209405, -1.097216, 1, 1, 1, 1, 1,
-0.3196667, 1.52487, -1.288266, 1, 1, 1, 1, 1,
-0.3189498, 0.7382433, -0.8628262, 1, 1, 1, 1, 1,
-0.3155676, -0.4664404, -3.237854, 1, 1, 1, 1, 1,
-0.3109952, -0.8529525, -2.227433, 1, 1, 1, 1, 1,
-0.3092412, -0.3549973, -0.6157792, 1, 1, 1, 1, 1,
-0.3064339, -1.016807, -2.086649, 1, 1, 1, 1, 1,
-0.3038122, 0.2182305, -1.455749, 1, 1, 1, 1, 1,
-0.300551, 0.255461, -1.075593, 0, 0, 1, 1, 1,
-0.2933174, -1.356855, -4.215031, 1, 0, 0, 1, 1,
-0.289961, -0.06130617, -2.008686, 1, 0, 0, 1, 1,
-0.2899411, -0.2684155, -1.126347, 1, 0, 0, 1, 1,
-0.2800944, -1.082039, -2.250554, 1, 0, 0, 1, 1,
-0.2799052, 1.95509, -1.686474, 1, 0, 0, 1, 1,
-0.2783974, 0.6923049, -0.5854276, 0, 0, 0, 1, 1,
-0.277766, 1.339749, -0.8622817, 0, 0, 0, 1, 1,
-0.275971, 1.498841, -0.3679898, 0, 0, 0, 1, 1,
-0.2757088, 0.5677533, -0.1579383, 0, 0, 0, 1, 1,
-0.2740302, 0.6421907, -0.6985633, 0, 0, 0, 1, 1,
-0.271615, 0.7243273, -0.2172085, 0, 0, 0, 1, 1,
-0.2710966, 1.037663, -0.05814638, 0, 0, 0, 1, 1,
-0.260693, 1.42224, 0.3820969, 1, 1, 1, 1, 1,
-0.2579363, 0.633159, 0.7713148, 1, 1, 1, 1, 1,
-0.2558609, 0.6202994, -0.2524268, 1, 1, 1, 1, 1,
-0.2558331, 1.335433, -1.262219, 1, 1, 1, 1, 1,
-0.2551455, -0.1358905, -4.308507, 1, 1, 1, 1, 1,
-0.2478812, -1.029829, -2.686162, 1, 1, 1, 1, 1,
-0.2477471, 1.764033, -0.4466324, 1, 1, 1, 1, 1,
-0.2442394, 0.9765998, -0.2245524, 1, 1, 1, 1, 1,
-0.2439793, -1.725925, -2.042742, 1, 1, 1, 1, 1,
-0.2410713, 0.8160428, -0.7273615, 1, 1, 1, 1, 1,
-0.2369248, -1.201071, -3.673251, 1, 1, 1, 1, 1,
-0.2365234, -0.657207, -0.9689658, 1, 1, 1, 1, 1,
-0.2316111, 0.9244681, -0.4086393, 1, 1, 1, 1, 1,
-0.2313032, -0.1391437, -2.498768, 1, 1, 1, 1, 1,
-0.229059, -0.5820265, -1.118973, 1, 1, 1, 1, 1,
-0.2277843, -0.8433214, -1.468673, 0, 0, 1, 1, 1,
-0.2273163, 0.210826, -1.591465, 1, 0, 0, 1, 1,
-0.2252439, -0.8299795, -4.726033, 1, 0, 0, 1, 1,
-0.2219009, -0.07506246, -2.923707, 1, 0, 0, 1, 1,
-0.2141721, -0.4528089, -3.046731, 1, 0, 0, 1, 1,
-0.2135643, -1.181375, -1.677428, 1, 0, 0, 1, 1,
-0.2100422, 0.2740564, -0.1380524, 0, 0, 0, 1, 1,
-0.2087226, -0.3286322, -2.88551, 0, 0, 0, 1, 1,
-0.2053484, 0.04401511, -0.7153854, 0, 0, 0, 1, 1,
-0.2043579, -0.4762923, -0.1510141, 0, 0, 0, 1, 1,
-0.2040901, -0.5830737, -1.636491, 0, 0, 0, 1, 1,
-0.20335, 0.4688089, -1.000832, 0, 0, 0, 1, 1,
-0.1983766, -0.0804562, -1.970498, 0, 0, 0, 1, 1,
-0.1929022, 1.232223, 0.6997413, 1, 1, 1, 1, 1,
-0.1887383, -0.1344985, -1.745831, 1, 1, 1, 1, 1,
-0.1856219, -0.2176651, -3.595062, 1, 1, 1, 1, 1,
-0.1827364, -1.358, -3.163379, 1, 1, 1, 1, 1,
-0.1799037, -2.012717, -1.479216, 1, 1, 1, 1, 1,
-0.1790672, 0.434314, -0.6864998, 1, 1, 1, 1, 1,
-0.1785972, 0.7455614, 0.4051849, 1, 1, 1, 1, 1,
-0.1773715, 1.391237, -0.5218435, 1, 1, 1, 1, 1,
-0.1773203, -0.1956303, -0.7412421, 1, 1, 1, 1, 1,
-0.1741109, -0.8913454, -2.154972, 1, 1, 1, 1, 1,
-0.1740274, -0.07795638, -3.790031, 1, 1, 1, 1, 1,
-0.173852, -0.16835, -1.842657, 1, 1, 1, 1, 1,
-0.1681497, 0.2414967, -0.5825307, 1, 1, 1, 1, 1,
-0.1668483, 1.094815, -0.3304702, 1, 1, 1, 1, 1,
-0.1585995, -0.3347589, -2.591116, 1, 1, 1, 1, 1,
-0.1508926, -1.411331, -3.368258, 0, 0, 1, 1, 1,
-0.1501956, 0.3428646, -0.610658, 1, 0, 0, 1, 1,
-0.149844, -1.253668, -3.793536, 1, 0, 0, 1, 1,
-0.1483137, 0.209671, 0.1135138, 1, 0, 0, 1, 1,
-0.1467167, 0.3441336, -0.8937678, 1, 0, 0, 1, 1,
-0.1426381, -0.721269, -5.4051, 1, 0, 0, 1, 1,
-0.1425817, 0.03098125, -0.8380901, 0, 0, 0, 1, 1,
-0.1424679, -0.09385387, -1.484609, 0, 0, 0, 1, 1,
-0.1395941, -0.8993035, -2.323496, 0, 0, 0, 1, 1,
-0.136475, 0.6154645, -1.085695, 0, 0, 0, 1, 1,
-0.1353896, 0.9999491, -0.4221103, 0, 0, 0, 1, 1,
-0.1349435, -0.8404766, -2.189511, 0, 0, 0, 1, 1,
-0.1285865, 1.429682, -0.02168806, 0, 0, 0, 1, 1,
-0.1270685, 0.4986104, -0.3400781, 1, 1, 1, 1, 1,
-0.1260709, 0.8288071, -0.1947917, 1, 1, 1, 1, 1,
-0.1225626, -0.2356745, -1.093774, 1, 1, 1, 1, 1,
-0.1216415, -0.837728, -1.595547, 1, 1, 1, 1, 1,
-0.1195871, 1.221281, 0.2050154, 1, 1, 1, 1, 1,
-0.117617, 1.750858, 0.02874743, 1, 1, 1, 1, 1,
-0.1161298, 0.1392622, -1.288326, 1, 1, 1, 1, 1,
-0.1129891, -0.7254231, -2.007805, 1, 1, 1, 1, 1,
-0.1098382, 1.648407, -0.4696404, 1, 1, 1, 1, 1,
-0.1086519, 0.7367448, 0.09452204, 1, 1, 1, 1, 1,
-0.1072361, 0.9008147, -1.909581, 1, 1, 1, 1, 1,
-0.1057039, -0.04744482, -0.9557428, 1, 1, 1, 1, 1,
-0.1001728, 0.5884606, 0.8098463, 1, 1, 1, 1, 1,
-0.09506568, 0.6967937, 0.6536505, 1, 1, 1, 1, 1,
-0.09444451, 0.4330305, -1.990074, 1, 1, 1, 1, 1,
-0.09364066, 0.5879086, 0.7123368, 0, 0, 1, 1, 1,
-0.09093088, -0.9285377, -1.339705, 1, 0, 0, 1, 1,
-0.09084426, -0.1789751, -2.025766, 1, 0, 0, 1, 1,
-0.09019654, 0.3937893, -0.1638065, 1, 0, 0, 1, 1,
-0.08500391, -1.677874, -2.625487, 1, 0, 0, 1, 1,
-0.08445854, -0.6585532, -2.32985, 1, 0, 0, 1, 1,
-0.08317702, 0.5321658, -0.6591284, 0, 0, 0, 1, 1,
-0.07874013, -0.9261968, -3.212517, 0, 0, 0, 1, 1,
-0.0755598, 0.8767152, -0.1885192, 0, 0, 0, 1, 1,
-0.07457473, -2.109667, -1.334588, 0, 0, 0, 1, 1,
-0.06084149, -0.319644, -2.662378, 0, 0, 0, 1, 1,
-0.05713642, -0.4887259, -4.218607, 0, 0, 0, 1, 1,
-0.05644151, -1.790174, -2.062742, 0, 0, 0, 1, 1,
-0.0560285, -0.04613433, -1.766615, 1, 1, 1, 1, 1,
-0.05300618, -0.9826422, -3.545101, 1, 1, 1, 1, 1,
-0.04912846, 0.579486, 0.891765, 1, 1, 1, 1, 1,
-0.04361991, 0.1360404, -1.418715, 1, 1, 1, 1, 1,
-0.04254734, -0.6790493, -2.148384, 1, 1, 1, 1, 1,
-0.04229783, -0.04296666, -2.052713, 1, 1, 1, 1, 1,
-0.04083675, 0.06534548, -0.7967629, 1, 1, 1, 1, 1,
-0.04056884, -1.053819, -2.412546, 1, 1, 1, 1, 1,
-0.03956588, -0.5267738, -2.70061, 1, 1, 1, 1, 1,
-0.03627546, 0.7335865, 0.1496435, 1, 1, 1, 1, 1,
-0.0357924, 1.228789, -0.007118858, 1, 1, 1, 1, 1,
-0.03197076, 1.414495, -1.816031, 1, 1, 1, 1, 1,
-0.03039925, -1.329537, -5.461416, 1, 1, 1, 1, 1,
-0.02685465, -0.6653956, -4.095135, 1, 1, 1, 1, 1,
-0.02471013, 0.09439047, -1.033626, 1, 1, 1, 1, 1,
-0.02351939, -1.228888, -2.202199, 0, 0, 1, 1, 1,
-0.02193982, -1.025444, -3.037384, 1, 0, 0, 1, 1,
-0.01893923, 1.154223, 0.7942951, 1, 0, 0, 1, 1,
-0.01706036, -1.752433, -2.802122, 1, 0, 0, 1, 1,
-0.01468991, 0.3277484, 0.5392237, 1, 0, 0, 1, 1,
-0.01347222, 1.272717, -0.8011293, 1, 0, 0, 1, 1,
-0.01267518, 1.170198, -0.08049654, 0, 0, 0, 1, 1,
-0.009622757, -0.2536132, -3.705259, 0, 0, 0, 1, 1,
-0.008591328, 0.199521, 0.0928058, 0, 0, 0, 1, 1,
-0.007571872, 0.7872835, 0.4668478, 0, 0, 0, 1, 1,
-0.007378419, -0.2689826, -2.41315, 0, 0, 0, 1, 1,
-0.001892273, 0.4049704, 1.273486, 0, 0, 0, 1, 1,
0.004554417, 0.3928908, -0.6593954, 0, 0, 0, 1, 1,
0.005922978, -1.850849, 3.46898, 1, 1, 1, 1, 1,
0.005986901, -0.4866678, 2.468609, 1, 1, 1, 1, 1,
0.006984615, -1.428024, 4.095026, 1, 1, 1, 1, 1,
0.008566239, -1.982879, 2.625183, 1, 1, 1, 1, 1,
0.009323831, -0.3798155, 3.339247, 1, 1, 1, 1, 1,
0.01057961, -0.2529191, 2.420179, 1, 1, 1, 1, 1,
0.01615904, 1.151322, -0.7797064, 1, 1, 1, 1, 1,
0.01629942, 1.350755, 2.026481, 1, 1, 1, 1, 1,
0.01844142, 0.9535915, 0.3843357, 1, 1, 1, 1, 1,
0.02235805, -0.6513843, 2.334006, 1, 1, 1, 1, 1,
0.02390803, 1.114116, 0.02076823, 1, 1, 1, 1, 1,
0.02715056, 0.03508328, 1.034037, 1, 1, 1, 1, 1,
0.03199718, -0.4653056, 1.866529, 1, 1, 1, 1, 1,
0.03212991, 0.4637086, 0.3504521, 1, 1, 1, 1, 1,
0.0329794, 0.2072381, 0.2848408, 1, 1, 1, 1, 1,
0.03336644, 0.5979797, 0.7991931, 0, 0, 1, 1, 1,
0.03569007, 1.473188, -1.33842, 1, 0, 0, 1, 1,
0.0358628, -0.3574539, 1.722537, 1, 0, 0, 1, 1,
0.03632643, 1.071895, -0.7058144, 1, 0, 0, 1, 1,
0.03996099, -0.1679707, 2.042369, 1, 0, 0, 1, 1,
0.04313836, 0.3644404, -0.9047463, 1, 0, 0, 1, 1,
0.04406773, 0.7253356, 0.3434854, 0, 0, 0, 1, 1,
0.04419455, 1.2604, -0.7800124, 0, 0, 0, 1, 1,
0.04741194, 1.046042, 1.620834, 0, 0, 0, 1, 1,
0.0511938, 0.5941448, 1.937894, 0, 0, 0, 1, 1,
0.05305009, -0.2359231, 2.291201, 0, 0, 0, 1, 1,
0.05332015, -0.2779463, 1.798641, 0, 0, 0, 1, 1,
0.0557198, -0.3314364, 3.900693, 0, 0, 0, 1, 1,
0.06007141, 0.3012807, -0.7262212, 1, 1, 1, 1, 1,
0.06089254, 0.7936518, 0.6285818, 1, 1, 1, 1, 1,
0.06180242, 0.07077184, -0.1203457, 1, 1, 1, 1, 1,
0.06268241, 0.4505196, 1.076712, 1, 1, 1, 1, 1,
0.06324053, -1.236586, 3.435721, 1, 1, 1, 1, 1,
0.0652662, -1.567551, 3.270521, 1, 1, 1, 1, 1,
0.0670813, -0.2127746, 3.120173, 1, 1, 1, 1, 1,
0.07869422, 0.7384998, 1.575907, 1, 1, 1, 1, 1,
0.07954246, 1.190226, 0.507142, 1, 1, 1, 1, 1,
0.07983047, -0.09126807, 2.345924, 1, 1, 1, 1, 1,
0.08082569, 1.92425, 0.2618105, 1, 1, 1, 1, 1,
0.08310506, -0.9776273, 4.149175, 1, 1, 1, 1, 1,
0.09264803, -0.02893824, 2.914695, 1, 1, 1, 1, 1,
0.09374595, -1.388718, 3.800321, 1, 1, 1, 1, 1,
0.09701275, -0.3413315, 2.680509, 1, 1, 1, 1, 1,
0.1009321, -0.2772362, 3.918222, 0, 0, 1, 1, 1,
0.1013743, -0.810986, 1.408459, 1, 0, 0, 1, 1,
0.1034544, 0.3523898, -0.09349683, 1, 0, 0, 1, 1,
0.1035944, 0.2503313, 1.113788, 1, 0, 0, 1, 1,
0.1169049, 0.7364911, -1.271119, 1, 0, 0, 1, 1,
0.1203609, -0.7403365, 4.433691, 1, 0, 0, 1, 1,
0.1238264, 0.5527393, 0.1978931, 0, 0, 0, 1, 1,
0.1248754, -0.3280071, 2.515738, 0, 0, 0, 1, 1,
0.1326507, -1.037236, 2.216589, 0, 0, 0, 1, 1,
0.1337106, 0.4284596, -0.7634027, 0, 0, 0, 1, 1,
0.1367059, 0.935596, -0.3382349, 0, 0, 0, 1, 1,
0.1467211, -0.5702615, 3.664242, 0, 0, 0, 1, 1,
0.1511585, 0.7531268, 0.1948236, 0, 0, 0, 1, 1,
0.1514777, -0.05250014, 1.192414, 1, 1, 1, 1, 1,
0.1549051, -0.5552408, 3.788891, 1, 1, 1, 1, 1,
0.155553, 0.1560119, -0.8751233, 1, 1, 1, 1, 1,
0.1566451, -0.03128608, 1.377113, 1, 1, 1, 1, 1,
0.1576419, 0.9420546, -0.972497, 1, 1, 1, 1, 1,
0.1602914, -2.126795, 3.201104, 1, 1, 1, 1, 1,
0.1620911, -0.2010516, 1.630323, 1, 1, 1, 1, 1,
0.1642802, -1.646909, 1.893203, 1, 1, 1, 1, 1,
0.164658, -1.266829, 4.023114, 1, 1, 1, 1, 1,
0.1652951, -0.6330137, 2.466456, 1, 1, 1, 1, 1,
0.1747207, -0.6036409, 2.874557, 1, 1, 1, 1, 1,
0.1764968, -1.554374, 3.155083, 1, 1, 1, 1, 1,
0.1767711, 1.564763, -2.137066, 1, 1, 1, 1, 1,
0.1779843, 0.1468638, 0.0007230621, 1, 1, 1, 1, 1,
0.1817797, -0.3754515, 5.924063, 1, 1, 1, 1, 1,
0.1823455, 0.3557931, 0.924136, 0, 0, 1, 1, 1,
0.1888881, 1.296694, -0.1670812, 1, 0, 0, 1, 1,
0.1896604, 0.260645, 0.4507791, 1, 0, 0, 1, 1,
0.1903749, -0.8812053, 1.036989, 1, 0, 0, 1, 1,
0.1910463, 1.444207, 1.028043, 1, 0, 0, 1, 1,
0.1923827, -0.651306, 3.122672, 1, 0, 0, 1, 1,
0.1926243, -0.6089657, 3.106256, 0, 0, 0, 1, 1,
0.1938824, 0.5513803, 0.3724667, 0, 0, 0, 1, 1,
0.195993, -1.394618, 1.958249, 0, 0, 0, 1, 1,
0.1968887, -1.051328, 3.109813, 0, 0, 0, 1, 1,
0.1996644, -0.1838286, 1.837906, 0, 0, 0, 1, 1,
0.199916, 1.622392, -2.657171, 0, 0, 0, 1, 1,
0.2001376, 0.7834972, 0.4909845, 0, 0, 0, 1, 1,
0.2059806, 0.9399624, -0.5697646, 1, 1, 1, 1, 1,
0.2082718, -1.343944, 3.772648, 1, 1, 1, 1, 1,
0.2167367, -0.7551667, 1.769587, 1, 1, 1, 1, 1,
0.2175469, -0.1434963, 2.736256, 1, 1, 1, 1, 1,
0.2183234, -0.005482714, 2.205695, 1, 1, 1, 1, 1,
0.2191345, 0.3336075, -1.462176, 1, 1, 1, 1, 1,
0.2194043, -0.8061563, 3.824997, 1, 1, 1, 1, 1,
0.2231501, -1.056959, 3.506994, 1, 1, 1, 1, 1,
0.2241933, 0.7194869, -0.5482561, 1, 1, 1, 1, 1,
0.2282833, 1.384243, -0.9386096, 1, 1, 1, 1, 1,
0.2355156, 0.1419843, 1.789989, 1, 1, 1, 1, 1,
0.2379464, -0.9045299, 4.536963, 1, 1, 1, 1, 1,
0.240257, 0.2887796, -0.4072067, 1, 1, 1, 1, 1,
0.2420894, 0.6339468, 0.2713382, 1, 1, 1, 1, 1,
0.2445873, -0.09541345, 2.346245, 1, 1, 1, 1, 1,
0.245751, -2.356114, 3.722281, 0, 0, 1, 1, 1,
0.2514798, 0.07679611, 1.277008, 1, 0, 0, 1, 1,
0.2527153, 0.5077695, 0.8615528, 1, 0, 0, 1, 1,
0.2533745, 0.6539904, 1.521722, 1, 0, 0, 1, 1,
0.2591662, 0.3844673, -0.9392961, 1, 0, 0, 1, 1,
0.2592433, 0.5485412, 1.935497, 1, 0, 0, 1, 1,
0.2592788, 1.860587, -0.2395765, 0, 0, 0, 1, 1,
0.2624058, 0.9177132, -0.5191119, 0, 0, 0, 1, 1,
0.2640878, -0.01638038, 2.261246, 0, 0, 0, 1, 1,
0.2723149, 0.2421066, 0.6092572, 0, 0, 0, 1, 1,
0.2730024, 0.9813498, -1.282183, 0, 0, 0, 1, 1,
0.2762117, -1.292444, 3.241021, 0, 0, 0, 1, 1,
0.2764672, -0.1787811, 2.985575, 0, 0, 0, 1, 1,
0.2777069, 1.129997, 0.6522535, 1, 1, 1, 1, 1,
0.2821509, 0.1294085, 1.074526, 1, 1, 1, 1, 1,
0.2823231, -0.383275, 3.32383, 1, 1, 1, 1, 1,
0.2830232, 0.917406, -0.03275089, 1, 1, 1, 1, 1,
0.2849441, -0.8410291, 3.732627, 1, 1, 1, 1, 1,
0.2850325, -0.928324, 0.9462667, 1, 1, 1, 1, 1,
0.2875456, 0.09592652, 2.519725, 1, 1, 1, 1, 1,
0.289099, -0.9870049, 3.677771, 1, 1, 1, 1, 1,
0.2946846, 0.1940168, 0.8023662, 1, 1, 1, 1, 1,
0.2955654, 1.730986, -2.374037, 1, 1, 1, 1, 1,
0.2999584, -0.6765714, -0.5582719, 1, 1, 1, 1, 1,
0.3000979, 0.1472616, 0.4454355, 1, 1, 1, 1, 1,
0.3052672, -0.7446563, 1.997077, 1, 1, 1, 1, 1,
0.3068167, 0.5217419, 0.1072619, 1, 1, 1, 1, 1,
0.3072307, 0.1501186, 1.554625, 1, 1, 1, 1, 1,
0.3093123, 0.230232, -0.2708697, 0, 0, 1, 1, 1,
0.3182966, 0.305911, 0.864979, 1, 0, 0, 1, 1,
0.3247146, -0.8337455, 4.381352, 1, 0, 0, 1, 1,
0.3251521, -0.9642674, 2.313642, 1, 0, 0, 1, 1,
0.3274845, -0.3135767, 2.574311, 1, 0, 0, 1, 1,
0.3284964, -2.2201, 3.653104, 1, 0, 0, 1, 1,
0.3305573, -1.837194, 4.467114, 0, 0, 0, 1, 1,
0.3344094, -0.08845159, 1.948436, 0, 0, 0, 1, 1,
0.3429591, 0.4774837, 2.07891, 0, 0, 0, 1, 1,
0.3431564, 1.256383, 0.04198974, 0, 0, 0, 1, 1,
0.3445224, 1.041911, -0.2703164, 0, 0, 0, 1, 1,
0.3473709, -0.7719407, 2.323939, 0, 0, 0, 1, 1,
0.3506781, -0.1339634, 1.471941, 0, 0, 0, 1, 1,
0.353361, -0.3109881, 3.929216, 1, 1, 1, 1, 1,
0.3551726, -0.5795265, 0.5565882, 1, 1, 1, 1, 1,
0.3573791, -0.3938977, 2.151499, 1, 1, 1, 1, 1,
0.3620261, 1.13399, 1.231487, 1, 1, 1, 1, 1,
0.3664052, -0.6436167, 2.734851, 1, 1, 1, 1, 1,
0.3666182, 0.6646433, 1.18426, 1, 1, 1, 1, 1,
0.3704642, 0.3118979, 2.833381, 1, 1, 1, 1, 1,
0.3751059, 0.1947766, 1.476406, 1, 1, 1, 1, 1,
0.3754726, 0.4240243, 0.5171851, 1, 1, 1, 1, 1,
0.3773411, -0.4740965, 2.662041, 1, 1, 1, 1, 1,
0.3773915, -0.4055026, 3.679568, 1, 1, 1, 1, 1,
0.3787363, 1.184223, 1.391271, 1, 1, 1, 1, 1,
0.3831419, 1.888994, -0.9908521, 1, 1, 1, 1, 1,
0.3853669, -0.5781178, 2.168364, 1, 1, 1, 1, 1,
0.3869278, -0.1549812, 2.370555, 1, 1, 1, 1, 1,
0.3884201, -0.3665362, 3.00645, 0, 0, 1, 1, 1,
0.3909515, 2.188843, -0.3585667, 1, 0, 0, 1, 1,
0.3950286, -1.414474, 2.744426, 1, 0, 0, 1, 1,
0.3990228, 0.9801169, 0.5700769, 1, 0, 0, 1, 1,
0.4001839, 0.320481, -0.53139, 1, 0, 0, 1, 1,
0.4015969, -1.048249, 2.519847, 1, 0, 0, 1, 1,
0.4020223, -0.4184138, 0.8068927, 0, 0, 0, 1, 1,
0.4040029, 0.3759832, 0.5668417, 0, 0, 0, 1, 1,
0.4053458, -0.5462791, 1.7486, 0, 0, 0, 1, 1,
0.4057047, 0.6423483, 0.3719024, 0, 0, 0, 1, 1,
0.4079317, -0.1783256, 0.7308641, 0, 0, 0, 1, 1,
0.4090547, 0.1836959, 1.04091, 0, 0, 0, 1, 1,
0.4145809, 0.7806751, 0.3764181, 0, 0, 0, 1, 1,
0.414847, -2.26921, 1.921006, 1, 1, 1, 1, 1,
0.4158311, 0.3892554, 0.509904, 1, 1, 1, 1, 1,
0.419636, -0.7896549, 2.937151, 1, 1, 1, 1, 1,
0.4275606, -0.835641, 2.093755, 1, 1, 1, 1, 1,
0.4356986, 0.8631079, -1.04915, 1, 1, 1, 1, 1,
0.4392216, -0.6759071, 0.760921, 1, 1, 1, 1, 1,
0.4400926, -1.216768, 2.602488, 1, 1, 1, 1, 1,
0.4413994, 0.7318453, -0.3326473, 1, 1, 1, 1, 1,
0.4480226, 0.161718, 3.458445, 1, 1, 1, 1, 1,
0.4490379, 0.1794125, 0.9588242, 1, 1, 1, 1, 1,
0.4499674, -1.410876, 1.705997, 1, 1, 1, 1, 1,
0.4557118, 0.8372312, 0.1311512, 1, 1, 1, 1, 1,
0.457812, 0.6074583, 1.103633, 1, 1, 1, 1, 1,
0.4594033, -1.26389, 2.184264, 1, 1, 1, 1, 1,
0.4770241, 0.6593351, -0.1124469, 1, 1, 1, 1, 1,
0.478607, 0.9215977, 0.5386593, 0, 0, 1, 1, 1,
0.4798008, -0.5080544, 1.507519, 1, 0, 0, 1, 1,
0.4844799, 1.068928, 1.476783, 1, 0, 0, 1, 1,
0.4850842, -0.8974069, 2.018261, 1, 0, 0, 1, 1,
0.4913747, 0.2451737, 3.142266, 1, 0, 0, 1, 1,
0.4939715, -0.4731527, 2.688951, 1, 0, 0, 1, 1,
0.4989858, 0.3953232, -0.1513271, 0, 0, 0, 1, 1,
0.4994725, 0.2437901, 0.8141593, 0, 0, 0, 1, 1,
0.4996673, -0.6361919, 1.592608, 0, 0, 0, 1, 1,
0.5034446, 0.4531327, -0.4931597, 0, 0, 0, 1, 1,
0.5034792, -0.648638, 0.9560933, 0, 0, 0, 1, 1,
0.5141134, -0.07299536, 1.413375, 0, 0, 0, 1, 1,
0.5153716, 1.450596, 0.343759, 0, 0, 0, 1, 1,
0.5154824, -1.1714, 2.648327, 1, 1, 1, 1, 1,
0.5198092, 0.4006742, 2.067907, 1, 1, 1, 1, 1,
0.5212516, -0.6789427, 0.7072679, 1, 1, 1, 1, 1,
0.5219247, -0.4308664, 2.163914, 1, 1, 1, 1, 1,
0.5220332, 2.241321, -0.4865151, 1, 1, 1, 1, 1,
0.5305509, 1.627442, 0.5952588, 1, 1, 1, 1, 1,
0.5337963, 1.021182, -0.65559, 1, 1, 1, 1, 1,
0.5339484, -1.093903, 5.169271, 1, 1, 1, 1, 1,
0.5383912, -0.3487543, 1.93087, 1, 1, 1, 1, 1,
0.5407962, 1.368379, 0.7713454, 1, 1, 1, 1, 1,
0.5421414, 1.095794, 1.216277, 1, 1, 1, 1, 1,
0.5460588, 1.753814, 0.7692811, 1, 1, 1, 1, 1,
0.5463259, 0.3312756, 0.8884699, 1, 1, 1, 1, 1,
0.5476869, -1.043908, 2.804561, 1, 1, 1, 1, 1,
0.5500299, 0.430285, 0.859234, 1, 1, 1, 1, 1,
0.5544994, -0.5214839, 0.5243621, 0, 0, 1, 1, 1,
0.5579488, -0.1715049, 3.088339, 1, 0, 0, 1, 1,
0.5606412, 0.7492082, -0.1273405, 1, 0, 0, 1, 1,
0.5622412, -0.411428, 3.182034, 1, 0, 0, 1, 1,
0.5632708, -0.9582309, 4.232145, 1, 0, 0, 1, 1,
0.5635123, 0.07755536, 2.444353, 1, 0, 0, 1, 1,
0.5640486, 0.2466275, 1.529887, 0, 0, 0, 1, 1,
0.5685346, 0.8327632, 1.053511, 0, 0, 0, 1, 1,
0.5693392, 0.4790566, 0.5658642, 0, 0, 0, 1, 1,
0.5693706, -0.85543, 2.841094, 0, 0, 0, 1, 1,
0.5697863, 0.8758695, -0.5916309, 0, 0, 0, 1, 1,
0.5773168, -0.5300987, 0.9247841, 0, 0, 0, 1, 1,
0.5835971, 1.030047, 2.02471, 0, 0, 0, 1, 1,
0.5891623, -1.067033, 2.872928, 1, 1, 1, 1, 1,
0.5951086, 1.137186, 1.274818, 1, 1, 1, 1, 1,
0.5964407, -0.391459, 3.004787, 1, 1, 1, 1, 1,
0.5970365, 0.6598898, 0.2766592, 1, 1, 1, 1, 1,
0.5985543, -0.7182953, 4.787903, 1, 1, 1, 1, 1,
0.5996587, 0.5133401, 1.343889, 1, 1, 1, 1, 1,
0.6011461, -0.2079968, 0.2644585, 1, 1, 1, 1, 1,
0.6071007, -0.7163139, 2.932282, 1, 1, 1, 1, 1,
0.6089077, -0.8906738, 2.725879, 1, 1, 1, 1, 1,
0.6133834, -0.450258, 1.483982, 1, 1, 1, 1, 1,
0.6154807, 0.2209821, 3.084249, 1, 1, 1, 1, 1,
0.6169093, -2.67732, 2.953187, 1, 1, 1, 1, 1,
0.6169925, -0.1210052, 2.263331, 1, 1, 1, 1, 1,
0.6180601, 0.2340859, 2.257788, 1, 1, 1, 1, 1,
0.6223776, -1.495757, 3.198709, 1, 1, 1, 1, 1,
0.6229702, -2.912714, 2.888472, 0, 0, 1, 1, 1,
0.6246062, -0.3546743, 1.196577, 1, 0, 0, 1, 1,
0.6246662, 2.317564, -1.554651, 1, 0, 0, 1, 1,
0.6393335, -0.9184753, 1.278477, 1, 0, 0, 1, 1,
0.6427916, -1.662813, 0.1942624, 1, 0, 0, 1, 1,
0.6430299, -2.093013, 0.372069, 1, 0, 0, 1, 1,
0.6483696, 0.05604203, 2.577959, 0, 0, 0, 1, 1,
0.6503766, 0.8853109, 0.07168553, 0, 0, 0, 1, 1,
0.6536021, -0.3793976, 1.190914, 0, 0, 0, 1, 1,
0.6565583, 1.136271, 0.4908873, 0, 0, 0, 1, 1,
0.6576052, -0.421537, 2.598643, 0, 0, 0, 1, 1,
0.6675088, 1.640045, 1.829642, 0, 0, 0, 1, 1,
0.6693028, 0.7897683, 0.7285152, 0, 0, 0, 1, 1,
0.6756192, -0.3318989, -0.1472906, 1, 1, 1, 1, 1,
0.6792119, 0.4995092, 1.901958, 1, 1, 1, 1, 1,
0.6803506, 0.4248418, -1.036004, 1, 1, 1, 1, 1,
0.6905165, -0.8975407, 3.014146, 1, 1, 1, 1, 1,
0.6969124, 1.509335, 0.8411902, 1, 1, 1, 1, 1,
0.6995156, -0.7027474, 2.131381, 1, 1, 1, 1, 1,
0.7008644, 1.1156, 1.754291, 1, 1, 1, 1, 1,
0.7194017, 0.2886368, 2.391482, 1, 1, 1, 1, 1,
0.7210422, 0.7246377, 0.7581415, 1, 1, 1, 1, 1,
0.7311001, 0.4747367, 1.38632, 1, 1, 1, 1, 1,
0.7406603, -1.912211, 1.508828, 1, 1, 1, 1, 1,
0.7417454, 1.631879, 1.12092, 1, 1, 1, 1, 1,
0.7449108, -0.735615, 4.480011, 1, 1, 1, 1, 1,
0.7461434, -0.4333339, 2.40148, 1, 1, 1, 1, 1,
0.7471594, -0.7612023, 4.204517, 1, 1, 1, 1, 1,
0.7501431, 0.8869625, 0.5036111, 0, 0, 1, 1, 1,
0.7513925, -0.3900246, 2.267573, 1, 0, 0, 1, 1,
0.7527829, -0.3538921, 1.662223, 1, 0, 0, 1, 1,
0.7564802, -1.471303, 2.367108, 1, 0, 0, 1, 1,
0.7576075, -0.7751417, 2.028277, 1, 0, 0, 1, 1,
0.7577118, 0.4515618, 0.2154499, 1, 0, 0, 1, 1,
0.7601658, 0.4729572, 0.2936516, 0, 0, 0, 1, 1,
0.7605902, 1.1765, 1.484057, 0, 0, 0, 1, 1,
0.7638928, 2.229721, 0.209203, 0, 0, 0, 1, 1,
0.7755697, 1.815854, 0.3968289, 0, 0, 0, 1, 1,
0.7848036, -1.172827, 2.003225, 0, 0, 0, 1, 1,
0.7948518, -0.02077201, 3.133966, 0, 0, 0, 1, 1,
0.7952133, 0.3875406, 1.495587, 0, 0, 0, 1, 1,
0.7961792, -0.6831846, 3.002182, 1, 1, 1, 1, 1,
0.7978419, 0.6291256, 2.555635, 1, 1, 1, 1, 1,
0.8023441, 0.4707649, 2.527119, 1, 1, 1, 1, 1,
0.8027875, -0.5144675, 2.517159, 1, 1, 1, 1, 1,
0.8054689, -0.7172403, 2.150666, 1, 1, 1, 1, 1,
0.8109806, -1.233197, 1.179451, 1, 1, 1, 1, 1,
0.8132925, -0.714007, 5.397069, 1, 1, 1, 1, 1,
0.8133798, -0.03089074, 0.7247988, 1, 1, 1, 1, 1,
0.815026, -0.4684652, -0.3650958, 1, 1, 1, 1, 1,
0.8184412, 0.2640216, 0.0748568, 1, 1, 1, 1, 1,
0.8210077, -1.19576, 3.323685, 1, 1, 1, 1, 1,
0.8237366, 0.2970102, 1.711732, 1, 1, 1, 1, 1,
0.8244197, 1.113782, 1.230967, 1, 1, 1, 1, 1,
0.8316044, 0.02675507, 2.207237, 1, 1, 1, 1, 1,
0.8434692, 1.134812, 1.481911, 1, 1, 1, 1, 1,
0.8484253, 0.5318677, 1.468674, 0, 0, 1, 1, 1,
0.8513603, -1.37966, 2.567773, 1, 0, 0, 1, 1,
0.8516684, -0.2604029, 2.965274, 1, 0, 0, 1, 1,
0.8529519, -1.532023, 2.664876, 1, 0, 0, 1, 1,
0.8724645, 1.669877, 0.3463674, 1, 0, 0, 1, 1,
0.8734335, 0.8322901, -1.163137, 1, 0, 0, 1, 1,
0.8736611, -1.165505, 1.961828, 0, 0, 0, 1, 1,
0.8738207, 0.03545521, 0.1845521, 0, 0, 0, 1, 1,
0.8819668, 0.3969444, 1.531662, 0, 0, 0, 1, 1,
0.8847067, -1.98056, 3.191756, 0, 0, 0, 1, 1,
0.8940034, -0.1706616, 0.5196834, 0, 0, 0, 1, 1,
0.8973545, 0.7855613, 1.384101, 0, 0, 0, 1, 1,
0.9004486, 0.8334383, 2.355002, 0, 0, 0, 1, 1,
0.9010056, 0.8615911, 1.116317, 1, 1, 1, 1, 1,
0.9017587, 1.257861, 0.5199203, 1, 1, 1, 1, 1,
0.9037102, 0.5098897, 1.729747, 1, 1, 1, 1, 1,
0.9039023, -0.8425325, 3.792015, 1, 1, 1, 1, 1,
0.9122967, 0.3704194, 1.00839, 1, 1, 1, 1, 1,
0.9136865, 2.887072, 1.451714, 1, 1, 1, 1, 1,
0.9141815, -0.1735616, 0.9642206, 1, 1, 1, 1, 1,
0.9255805, -1.159874, 2.983098, 1, 1, 1, 1, 1,
0.9264018, 0.366491, 0.8962387, 1, 1, 1, 1, 1,
0.9281066, -0.6337737, 0.4037087, 1, 1, 1, 1, 1,
0.9298823, 1.46444, 0.7671049, 1, 1, 1, 1, 1,
0.9302208, -0.5459501, 2.725753, 1, 1, 1, 1, 1,
0.9398506, 0.6593391, 2.677224, 1, 1, 1, 1, 1,
0.9457394, 0.5435184, 2.112947, 1, 1, 1, 1, 1,
0.9505447, 0.8583977, 2.27998, 1, 1, 1, 1, 1,
0.9527506, -0.2553822, 0.3718581, 0, 0, 1, 1, 1,
0.9560344, 1.542376, 1.939308, 1, 0, 0, 1, 1,
0.9586518, 0.8575913, -1.553315, 1, 0, 0, 1, 1,
0.9607797, -0.360306, 1.349567, 1, 0, 0, 1, 1,
0.9639906, -0.05739745, 1.636453, 1, 0, 0, 1, 1,
0.9650202, -0.8725974, 2.148492, 1, 0, 0, 1, 1,
0.97125, 0.6420957, 0.00197351, 0, 0, 0, 1, 1,
0.9731317, -1.090011, 2.159276, 0, 0, 0, 1, 1,
0.9755452, -0.6293295, 1.526712, 0, 0, 0, 1, 1,
0.9806196, 0.8598214, 2.728532, 0, 0, 0, 1, 1,
0.9808025, 1.169384, 1.141664, 0, 0, 0, 1, 1,
0.9854237, 0.3870622, 0.8999538, 0, 0, 0, 1, 1,
0.9881198, 0.9616925, 0.4473471, 0, 0, 0, 1, 1,
0.9881645, 0.06285772, 1.993579, 1, 1, 1, 1, 1,
0.9915184, -0.2660337, 3.360837, 1, 1, 1, 1, 1,
0.9947625, -1.268901, 2.071436, 1, 1, 1, 1, 1,
0.9951474, -1.557047, 1.187534, 1, 1, 1, 1, 1,
0.9985654, -0.6919189, 1.807896, 1, 1, 1, 1, 1,
1.004755, 0.3555711, 0.7786934, 1, 1, 1, 1, 1,
1.018938, -0.912331, 3.151459, 1, 1, 1, 1, 1,
1.026218, -0.6429089, 0.6890193, 1, 1, 1, 1, 1,
1.026877, -0.5152438, -0.7619478, 1, 1, 1, 1, 1,
1.028287, 0.875716, -0.07638256, 1, 1, 1, 1, 1,
1.040861, -1.031331, 1.826345, 1, 1, 1, 1, 1,
1.053136, -0.8900061, 3.593258, 1, 1, 1, 1, 1,
1.057207, 1.260262, 0.6640563, 1, 1, 1, 1, 1,
1.057783, 0.6895626, 1.282688, 1, 1, 1, 1, 1,
1.058719, 0.817657, -0.4907489, 1, 1, 1, 1, 1,
1.05898, -2.964956, 2.0182, 0, 0, 1, 1, 1,
1.064874, 0.9616427, 2.078113, 1, 0, 0, 1, 1,
1.068522, -0.446249, 2.033786, 1, 0, 0, 1, 1,
1.074744, -0.447592, 0.9429765, 1, 0, 0, 1, 1,
1.076636, -0.3549303, 0.2840151, 1, 0, 0, 1, 1,
1.084489, 0.987821, -0.9357303, 1, 0, 0, 1, 1,
1.094381, 0.02687836, 2.157773, 0, 0, 0, 1, 1,
1.096729, -0.9911957, 1.924335, 0, 0, 0, 1, 1,
1.098146, 0.04762721, 2.452821, 0, 0, 0, 1, 1,
1.099079, 1.020227, -0.8014318, 0, 0, 0, 1, 1,
1.099362, -0.02736818, 2.391142, 0, 0, 0, 1, 1,
1.111851, 0.2943092, -0.5594558, 0, 0, 0, 1, 1,
1.114706, 0.2736963, 1.66811, 0, 0, 0, 1, 1,
1.121925, -0.004275523, 0.5962449, 1, 1, 1, 1, 1,
1.127756, 0.5693958, -0.5668187, 1, 1, 1, 1, 1,
1.128509, -0.5797727, 2.307543, 1, 1, 1, 1, 1,
1.142538, 1.687885, -0.06655078, 1, 1, 1, 1, 1,
1.14956, 0.6971599, 1.944044, 1, 1, 1, 1, 1,
1.151276, -1.396326, 2.973635, 1, 1, 1, 1, 1,
1.172521, -1.045294, 1.996644, 1, 1, 1, 1, 1,
1.176515, -0.9308639, 2.589974, 1, 1, 1, 1, 1,
1.176656, -2.100839, 2.146689, 1, 1, 1, 1, 1,
1.177397, 0.6791961, 1.883365, 1, 1, 1, 1, 1,
1.180985, 0.4277754, 1.641796, 1, 1, 1, 1, 1,
1.185189, -1.60896, 1.260302, 1, 1, 1, 1, 1,
1.188075, 1.242442, -0.9294012, 1, 1, 1, 1, 1,
1.188946, -2.434929, 2.437697, 1, 1, 1, 1, 1,
1.213726, 1.252335, 1.218052, 1, 1, 1, 1, 1,
1.215382, -0.2269615, 1.475387, 0, 0, 1, 1, 1,
1.216676, -0.5647513, 1.844793, 1, 0, 0, 1, 1,
1.245157, 1.681981, 0.03493913, 1, 0, 0, 1, 1,
1.251875, -1.365266, 2.486812, 1, 0, 0, 1, 1,
1.264912, 1.220127, 1.345711, 1, 0, 0, 1, 1,
1.26687, -0.5695852, 0.6298196, 1, 0, 0, 1, 1,
1.279365, -2.066422, 0.791262, 0, 0, 0, 1, 1,
1.289555, -0.5376219, 0.8624125, 0, 0, 0, 1, 1,
1.301288, -0.4180542, 2.307879, 0, 0, 0, 1, 1,
1.302486, 0.5608867, 2.434196, 0, 0, 0, 1, 1,
1.303521, 1.03474, 0.496058, 0, 0, 0, 1, 1,
1.306205, 0.5495626, 2.147356, 0, 0, 0, 1, 1,
1.307573, -0.5728155, 1.722077, 0, 0, 0, 1, 1,
1.308164, 0.2774803, 0.7337489, 1, 1, 1, 1, 1,
1.311031, -1.644968, 1.704259, 1, 1, 1, 1, 1,
1.323511, -1.972595, 3.7852, 1, 1, 1, 1, 1,
1.3394, 0.1747986, 1.519114, 1, 1, 1, 1, 1,
1.340218, -0.4955174, 3.300448, 1, 1, 1, 1, 1,
1.341317, -1.48661, 2.362701, 1, 1, 1, 1, 1,
1.346204, 1.1818, 2.044084, 1, 1, 1, 1, 1,
1.350487, -0.4926738, 1.674219, 1, 1, 1, 1, 1,
1.350773, -1.128616, 1.745258, 1, 1, 1, 1, 1,
1.351946, -0.4305046, 2.346883, 1, 1, 1, 1, 1,
1.356323, 0.2113189, 2.398418, 1, 1, 1, 1, 1,
1.356754, -0.2651362, 1.914981, 1, 1, 1, 1, 1,
1.36939, 0.1628824, 2.681211, 1, 1, 1, 1, 1,
1.381519, -0.5713381, 2.757476, 1, 1, 1, 1, 1,
1.38426, -0.6985458, 1.014171, 1, 1, 1, 1, 1,
1.385416, 0.6607242, 0.2081517, 0, 0, 1, 1, 1,
1.404255, 1.660308, 2.436231, 1, 0, 0, 1, 1,
1.408885, 0.6172139, -1.263221, 1, 0, 0, 1, 1,
1.415694, -0.3168963, 1.903338, 1, 0, 0, 1, 1,
1.448277, -1.381183, 3.291081, 1, 0, 0, 1, 1,
1.450683, -0.2001705, 3.287315, 1, 0, 0, 1, 1,
1.464473, -1.562737, 2.365327, 0, 0, 0, 1, 1,
1.469173, -1.155357, 1.236682, 0, 0, 0, 1, 1,
1.471706, -0.5577513, 1.599603, 0, 0, 0, 1, 1,
1.473046, 0.6201359, -0.7416997, 0, 0, 0, 1, 1,
1.476441, -0.3413211, 2.234546, 0, 0, 0, 1, 1,
1.482081, 0.3129373, 3.545125, 0, 0, 0, 1, 1,
1.499262, -0.8018984, 3.094306, 0, 0, 0, 1, 1,
1.505136, -0.9700618, 2.480279, 1, 1, 1, 1, 1,
1.507381, 1.048641, 0.9417019, 1, 1, 1, 1, 1,
1.507537, 1.6364, 0.3582161, 1, 1, 1, 1, 1,
1.509449, 0.09058803, 0.6504906, 1, 1, 1, 1, 1,
1.511451, -0.8366127, 2.210213, 1, 1, 1, 1, 1,
1.522027, 0.03259412, 1.565224, 1, 1, 1, 1, 1,
1.529046, 0.2146936, 0.5566778, 1, 1, 1, 1, 1,
1.562577, -0.7234361, 2.854097, 1, 1, 1, 1, 1,
1.567972, 2.531514, 1.251678, 1, 1, 1, 1, 1,
1.581259, 1.31276, -0.7756953, 1, 1, 1, 1, 1,
1.584352, -0.5753417, 2.036665, 1, 1, 1, 1, 1,
1.586597, 0.2987639, 1.937958, 1, 1, 1, 1, 1,
1.589981, -1.020992, 1.47527, 1, 1, 1, 1, 1,
1.603836, 0.04098482, 2.459041, 1, 1, 1, 1, 1,
1.605734, -1.064906, 2.366517, 1, 1, 1, 1, 1,
1.6091, 0.2233835, 2.552868, 0, 0, 1, 1, 1,
1.622161, 1.427541, 0.8342651, 1, 0, 0, 1, 1,
1.638926, 1.597346, 1.192538, 1, 0, 0, 1, 1,
1.654322, 0.1738799, 3.949125, 1, 0, 0, 1, 1,
1.678516, 0.9130995, 0.1907248, 1, 0, 0, 1, 1,
1.686693, -0.9251978, 1.793715, 1, 0, 0, 1, 1,
1.719854, 2.325399, 2.644418, 0, 0, 0, 1, 1,
1.720236, -0.05114637, 1.500817, 0, 0, 0, 1, 1,
1.740275, -0.3368363, 2.718326, 0, 0, 0, 1, 1,
1.75483, -0.321502, 1.960174, 0, 0, 0, 1, 1,
1.811782, 1.636215, -0.4817091, 0, 0, 0, 1, 1,
1.864699, -1.095422, 1.746832, 0, 0, 0, 1, 1,
1.865743, -0.3824221, 2.11583, 0, 0, 0, 1, 1,
1.909383, 1.105332, 2.141495, 1, 1, 1, 1, 1,
1.933375, -0.1751525, 1.014009, 1, 1, 1, 1, 1,
1.937401, 1.456832, 0.7844912, 1, 1, 1, 1, 1,
1.956231, -1.311924, 3.774757, 1, 1, 1, 1, 1,
1.95992, -1.361577, 2.615331, 1, 1, 1, 1, 1,
1.968259, 0.3987588, 2.331442, 1, 1, 1, 1, 1,
1.985867, 0.3139212, 2.609709, 1, 1, 1, 1, 1,
2.007487, -0.6893613, 0.5047467, 1, 1, 1, 1, 1,
2.019533, -0.6269613, 2.659417, 1, 1, 1, 1, 1,
2.023028, 0.297216, -0.05623649, 1, 1, 1, 1, 1,
2.028207, -1.420595, 1.265066, 1, 1, 1, 1, 1,
2.031368, 0.7837312, 1.891243, 1, 1, 1, 1, 1,
2.033407, -0.0690827, 1.460142, 1, 1, 1, 1, 1,
2.048201, 2.167414, -0.8956418, 1, 1, 1, 1, 1,
2.053935, 0.6207324, 0.6777661, 1, 1, 1, 1, 1,
2.058862, 0.9119095, -0.01672011, 0, 0, 1, 1, 1,
2.075447, 0.8880558, -0.2102199, 1, 0, 0, 1, 1,
2.100527, 0.9412324, 0.8059399, 1, 0, 0, 1, 1,
2.102144, -0.1863023, 2.138376, 1, 0, 0, 1, 1,
2.106081, -1.971434, 1.969266, 1, 0, 0, 1, 1,
2.114704, -0.312776, 2.054898, 1, 0, 0, 1, 1,
2.115213, 2.226603, -0.05280546, 0, 0, 0, 1, 1,
2.129049, -0.5748824, 1.10753, 0, 0, 0, 1, 1,
2.173819, 0.9318061, 1.174006, 0, 0, 0, 1, 1,
2.198907, -1.42487, 0.008316266, 0, 0, 0, 1, 1,
2.221923, -0.2113188, 1.520083, 0, 0, 0, 1, 1,
2.230994, 0.2127903, 0.3969484, 0, 0, 0, 1, 1,
2.286272, 0.4386927, 1.060955, 0, 0, 0, 1, 1,
2.357933, 0.1710083, 1.756796, 1, 1, 1, 1, 1,
2.538274, -0.5429966, 2.151861, 1, 1, 1, 1, 1,
2.600457, -0.1292425, 2.136085, 1, 1, 1, 1, 1,
2.647968, -1.50211, 1.444817, 1, 1, 1, 1, 1,
2.706889, -0.2458158, 3.398067, 1, 1, 1, 1, 1,
2.768621, 1.558138, 1.036765, 1, 1, 1, 1, 1,
3.452008, -1.158583, 0.5833732, 1, 1, 1, 1, 1
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
var radius = 9.810475;
var distance = 34.45888;
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
mvMatrix.translate( -0.3438576, 0.3404572, -0.2313237 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.45888);
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
