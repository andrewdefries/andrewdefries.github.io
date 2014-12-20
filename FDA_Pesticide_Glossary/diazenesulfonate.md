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
-3.134887, -1.672547, -1.1827, 1, 0, 0, 1,
-2.657351, -1.768386, -1.483503, 1, 0.007843138, 0, 1,
-2.513051, 0.1706716, -3.226135, 1, 0.01176471, 0, 1,
-2.496456, 0.4217214, -1.698415, 1, 0.01960784, 0, 1,
-2.491449, -0.03689712, 0.2618479, 1, 0.02352941, 0, 1,
-2.473725, 1.447177, -0.5206912, 1, 0.03137255, 0, 1,
-2.463671, 1.512359, -0.3290097, 1, 0.03529412, 0, 1,
-2.458651, 0.8579271, -1.125044, 1, 0.04313726, 0, 1,
-2.408355, 0.498984, -0.05691458, 1, 0.04705882, 0, 1,
-2.363548, -0.1897245, -2.101888, 1, 0.05490196, 0, 1,
-2.363198, 0.2344525, -2.628281, 1, 0.05882353, 0, 1,
-2.180715, -2.098627, -1.078523, 1, 0.06666667, 0, 1,
-2.148094, -1.642519, -1.701728, 1, 0.07058824, 0, 1,
-2.128787, -0.6515673, -2.010248, 1, 0.07843138, 0, 1,
-2.111252, -1.321917, -1.699642, 1, 0.08235294, 0, 1,
-1.988802, 0.3287658, -1.469356, 1, 0.09019608, 0, 1,
-1.95468, -0.2908898, -1.808172, 1, 0.09411765, 0, 1,
-1.953505, 1.378531, -1.494414, 1, 0.1019608, 0, 1,
-1.950884, 1.426, -1.28057, 1, 0.1098039, 0, 1,
-1.930682, 1.07644, -0.810313, 1, 0.1137255, 0, 1,
-1.928615, -0.05220706, -0.5892816, 1, 0.1215686, 0, 1,
-1.927517, -0.9031294, -3.172474, 1, 0.1254902, 0, 1,
-1.927458, -0.9542105, -3.117256, 1, 0.1333333, 0, 1,
-1.916277, 0.8790566, 0.7319425, 1, 0.1372549, 0, 1,
-1.910355, -0.5214214, -1.971594, 1, 0.145098, 0, 1,
-1.856285, 0.1116756, 0.04286879, 1, 0.1490196, 0, 1,
-1.847829, -0.9294218, -2.562125, 1, 0.1568628, 0, 1,
-1.840449, -1.214019, -2.517742, 1, 0.1607843, 0, 1,
-1.823642, -0.9048474, -1.378581, 1, 0.1686275, 0, 1,
-1.806305, -1.114787, -2.226567, 1, 0.172549, 0, 1,
-1.795665, 1.180097, 0.3195595, 1, 0.1803922, 0, 1,
-1.794576, 0.730284, -0.1864723, 1, 0.1843137, 0, 1,
-1.791826, -1.365232, -1.317719, 1, 0.1921569, 0, 1,
-1.785867, 0.3408593, -1.862675, 1, 0.1960784, 0, 1,
-1.773719, 0.7886871, -0.7484707, 1, 0.2039216, 0, 1,
-1.760519, 0.9189488, -1.169542, 1, 0.2117647, 0, 1,
-1.74438, 1.162721, 0.1126364, 1, 0.2156863, 0, 1,
-1.725047, -1.776911, -1.594191, 1, 0.2235294, 0, 1,
-1.721142, 0.3818558, -1.026786, 1, 0.227451, 0, 1,
-1.706606, 0.3208951, -1.158135, 1, 0.2352941, 0, 1,
-1.695327, -0.7044026, -2.067836, 1, 0.2392157, 0, 1,
-1.69322, -0.3319218, -2.240732, 1, 0.2470588, 0, 1,
-1.689611, -0.7868063, -2.770911, 1, 0.2509804, 0, 1,
-1.682517, -1.039268, -1.416093, 1, 0.2588235, 0, 1,
-1.681499, 1.295903, -0.9612933, 1, 0.2627451, 0, 1,
-1.669562, 1.015052, 0.08922703, 1, 0.2705882, 0, 1,
-1.659617, -0.1185321, -1.680293, 1, 0.2745098, 0, 1,
-1.646766, 0.6542425, 0.5577042, 1, 0.282353, 0, 1,
-1.643626, 1.781413, 0.4159519, 1, 0.2862745, 0, 1,
-1.642683, 0.275047, -3.541987, 1, 0.2941177, 0, 1,
-1.64171, 2.194753, 0.213944, 1, 0.3019608, 0, 1,
-1.639636, 1.067932, -0.9618677, 1, 0.3058824, 0, 1,
-1.608674, 0.4328749, -0.6980088, 1, 0.3137255, 0, 1,
-1.595666, -0.1515118, -1.521264, 1, 0.3176471, 0, 1,
-1.595246, -0.9256262, -1.33462, 1, 0.3254902, 0, 1,
-1.590697, -0.8874975, -4.594883, 1, 0.3294118, 0, 1,
-1.581114, -0.1563725, -2.167715, 1, 0.3372549, 0, 1,
-1.564493, 2.699212, -0.2693156, 1, 0.3411765, 0, 1,
-1.555913, -0.8326194, -1.820208, 1, 0.3490196, 0, 1,
-1.535231, -2.175593, -3.730651, 1, 0.3529412, 0, 1,
-1.519468, -0.1367428, -1.321397, 1, 0.3607843, 0, 1,
-1.508929, -0.4962148, -1.46359, 1, 0.3647059, 0, 1,
-1.505823, 1.350553, -0.04010903, 1, 0.372549, 0, 1,
-1.505444, -0.2173438, -1.816965, 1, 0.3764706, 0, 1,
-1.485406, 0.4704041, -1.346441, 1, 0.3843137, 0, 1,
-1.484492, 2.331597, -2.299385, 1, 0.3882353, 0, 1,
-1.475221, 1.226634, -0.7530513, 1, 0.3960784, 0, 1,
-1.473022, 0.7893599, -0.225193, 1, 0.4039216, 0, 1,
-1.468523, -0.3287331, -0.6791008, 1, 0.4078431, 0, 1,
-1.459345, -0.9104819, -4.241146, 1, 0.4156863, 0, 1,
-1.451597, -0.9336993, -0.08791339, 1, 0.4196078, 0, 1,
-1.449912, 1.25426, -0.5633212, 1, 0.427451, 0, 1,
-1.438609, 0.9449501, -1.051899, 1, 0.4313726, 0, 1,
-1.436092, -0.442938, -3.181782, 1, 0.4392157, 0, 1,
-1.430239, -0.08745834, -2.551316, 1, 0.4431373, 0, 1,
-1.423785, -0.01374327, -2.54341, 1, 0.4509804, 0, 1,
-1.421533, 0.2068518, -2.432036, 1, 0.454902, 0, 1,
-1.40933, 0.9863086, -1.410522, 1, 0.4627451, 0, 1,
-1.388189, 0.4539671, -1.526255, 1, 0.4666667, 0, 1,
-1.38724, 0.4035606, -3.681727, 1, 0.4745098, 0, 1,
-1.382249, 2.090195, -1.155222, 1, 0.4784314, 0, 1,
-1.38178, -0.6644234, -1.807398, 1, 0.4862745, 0, 1,
-1.365915, 1.0395, -0.4497366, 1, 0.4901961, 0, 1,
-1.349686, -1.346378, -3.619541, 1, 0.4980392, 0, 1,
-1.341038, -0.5772838, -1.423116, 1, 0.5058824, 0, 1,
-1.34062, 0.5760854, -1.747842, 1, 0.509804, 0, 1,
-1.334662, 0.9249814, -1.567837, 1, 0.5176471, 0, 1,
-1.324216, 0.1153897, 0.5925062, 1, 0.5215687, 0, 1,
-1.323306, 1.436703, -0.5663083, 1, 0.5294118, 0, 1,
-1.320324, -0.2747143, -2.169036, 1, 0.5333334, 0, 1,
-1.319334, -0.5292261, -0.7839072, 1, 0.5411765, 0, 1,
-1.314088, -0.6666318, -1.04976, 1, 0.5450981, 0, 1,
-1.297626, -0.08439304, -2.588439, 1, 0.5529412, 0, 1,
-1.295193, -1.147778, -3.459268, 1, 0.5568628, 0, 1,
-1.280314, -0.1153708, -2.250985, 1, 0.5647059, 0, 1,
-1.270629, 0.6324093, -2.077445, 1, 0.5686275, 0, 1,
-1.270384, -0.2509043, -1.98884, 1, 0.5764706, 0, 1,
-1.264441, -0.2271418, -0.9054469, 1, 0.5803922, 0, 1,
-1.262742, -0.1111877, -1.414236, 1, 0.5882353, 0, 1,
-1.261917, 0.8769246, -1.396269, 1, 0.5921569, 0, 1,
-1.261629, 0.2394156, 0.8705626, 1, 0.6, 0, 1,
-1.248522, 1.599212, -3.112664, 1, 0.6078432, 0, 1,
-1.245643, -0.3995231, -2.143357, 1, 0.6117647, 0, 1,
-1.242383, 0.89476, -1.534732, 1, 0.6196079, 0, 1,
-1.241725, -0.6616033, -1.422571, 1, 0.6235294, 0, 1,
-1.233862, 1.832621, 0.9212433, 1, 0.6313726, 0, 1,
-1.233792, 0.3776117, -1.841662, 1, 0.6352941, 0, 1,
-1.209715, -1.191287, -1.338045, 1, 0.6431373, 0, 1,
-1.193383, -0.469123, -2.431446, 1, 0.6470588, 0, 1,
-1.185579, 0.06562045, -3.952039, 1, 0.654902, 0, 1,
-1.171262, 1.1934, -0.3190116, 1, 0.6588235, 0, 1,
-1.170803, 0.9010095, 0.3890817, 1, 0.6666667, 0, 1,
-1.160936, 2.192199, -1.402001, 1, 0.6705883, 0, 1,
-1.154012, 0.004857939, -1.515155, 1, 0.6784314, 0, 1,
-1.151788, 0.9962325, -1.30319, 1, 0.682353, 0, 1,
-1.143867, 1.424878, 0.3198195, 1, 0.6901961, 0, 1,
-1.141185, 0.1746744, 0.3014649, 1, 0.6941177, 0, 1,
-1.138468, -0.39891, -1.394621, 1, 0.7019608, 0, 1,
-1.137306, -0.3100306, -2.034625, 1, 0.7098039, 0, 1,
-1.136127, -1.095363, -1.537289, 1, 0.7137255, 0, 1,
-1.132399, 0.697832, -1.733437, 1, 0.7215686, 0, 1,
-1.130389, -0.005762987, -3.25896, 1, 0.7254902, 0, 1,
-1.116185, -0.6195542, -1.468037, 1, 0.7333333, 0, 1,
-1.111659, -0.4395972, -2.709405, 1, 0.7372549, 0, 1,
-1.111292, -0.658163, -2.74095, 1, 0.7450981, 0, 1,
-1.107859, -0.9418592, -3.046917, 1, 0.7490196, 0, 1,
-1.10698, -0.3447771, 0.9274678, 1, 0.7568628, 0, 1,
-1.104518, -0.3133986, -2.380816, 1, 0.7607843, 0, 1,
-1.103077, 0.1936758, -1.615712, 1, 0.7686275, 0, 1,
-1.098349, -0.09442929, -3.39169, 1, 0.772549, 0, 1,
-1.098144, -0.02429562, -1.886795, 1, 0.7803922, 0, 1,
-1.096511, -0.2120225, -1.598041, 1, 0.7843137, 0, 1,
-1.09017, 0.9690199, -0.7747224, 1, 0.7921569, 0, 1,
-1.089566, -0.1466236, -1.042609, 1, 0.7960784, 0, 1,
-1.086844, 0.2858726, -1.636825, 1, 0.8039216, 0, 1,
-1.080003, 0.3871918, -1.685239, 1, 0.8117647, 0, 1,
-1.078589, 0.5583276, 0.5677209, 1, 0.8156863, 0, 1,
-1.066647, -1.589286, -2.293078, 1, 0.8235294, 0, 1,
-1.064938, 0.7252427, -1.004257, 1, 0.827451, 0, 1,
-1.05994, 0.198407, -2.387598, 1, 0.8352941, 0, 1,
-1.0531, 0.7491006, 0.2540401, 1, 0.8392157, 0, 1,
-1.051433, -0.3583915, -0.3404202, 1, 0.8470588, 0, 1,
-1.040779, -0.1503464, -2.671376, 1, 0.8509804, 0, 1,
-1.038337, -0.8586708, -2.031453, 1, 0.8588235, 0, 1,
-1.037106, -0.7099103, -2.607841, 1, 0.8627451, 0, 1,
-1.009675, -0.1312116, -2.788527, 1, 0.8705882, 0, 1,
-1.009265, 0.2383167, -2.73509, 1, 0.8745098, 0, 1,
-1.002813, 0.5203919, 0.2000503, 1, 0.8823529, 0, 1,
-1.001715, 0.7385038, 1.436164, 1, 0.8862745, 0, 1,
-0.99532, -1.621469, -1.42317, 1, 0.8941177, 0, 1,
-0.9947732, -0.3243858, -1.417122, 1, 0.8980392, 0, 1,
-0.9932217, 0.6173011, -1.586308, 1, 0.9058824, 0, 1,
-0.9902187, 1.578254, 0.2601316, 1, 0.9137255, 0, 1,
-0.9882188, 0.6927367, -0.2936962, 1, 0.9176471, 0, 1,
-0.9809927, -1.335168, -2.178803, 1, 0.9254902, 0, 1,
-0.9784474, 1.625807, -1.577249, 1, 0.9294118, 0, 1,
-0.9783572, 0.006901579, 0.4739143, 1, 0.9372549, 0, 1,
-0.9693198, 0.9129413, -1.071508, 1, 0.9411765, 0, 1,
-0.9610061, 0.4278147, 0.7876304, 1, 0.9490196, 0, 1,
-0.955802, -0.6460915, -1.957188, 1, 0.9529412, 0, 1,
-0.9520005, 0.4661968, -3.4057, 1, 0.9607843, 0, 1,
-0.9505827, -1.433976, -3.83304, 1, 0.9647059, 0, 1,
-0.9494869, 0.6679117, -0.6413609, 1, 0.972549, 0, 1,
-0.9427065, 0.1548094, -0.8663965, 1, 0.9764706, 0, 1,
-0.9412193, 0.7624242, -2.834237, 1, 0.9843137, 0, 1,
-0.9400525, -0.3560395, -3.068319, 1, 0.9882353, 0, 1,
-0.9353778, -0.3172892, -2.330065, 1, 0.9960784, 0, 1,
-0.9321595, -0.7861803, -1.456342, 0.9960784, 1, 0, 1,
-0.9278941, -1.148088, -0.3029321, 0.9921569, 1, 0, 1,
-0.9243045, 1.138779, -0.7972019, 0.9843137, 1, 0, 1,
-0.9233141, 0.4346364, -1.591105, 0.9803922, 1, 0, 1,
-0.9229239, -0.8690137, -2.512371, 0.972549, 1, 0, 1,
-0.9187955, 1.216479, 0.2677064, 0.9686275, 1, 0, 1,
-0.9169409, -0.6467335, -1.58961, 0.9607843, 1, 0, 1,
-0.9015144, 0.3190694, -0.9937454, 0.9568627, 1, 0, 1,
-0.9011742, 0.4198724, -0.611098, 0.9490196, 1, 0, 1,
-0.8981922, 0.3678264, -2.345935, 0.945098, 1, 0, 1,
-0.8941855, 0.06234811, -3.652966, 0.9372549, 1, 0, 1,
-0.8919086, 0.2373729, -0.1076191, 0.9333333, 1, 0, 1,
-0.8903385, 0.2697451, -0.9211038, 0.9254902, 1, 0, 1,
-0.8863183, 0.3134756, -0.5723625, 0.9215686, 1, 0, 1,
-0.88114, -0.229242, -0.715489, 0.9137255, 1, 0, 1,
-0.8775209, 1.367503, -0.7656802, 0.9098039, 1, 0, 1,
-0.867559, 0.2264359, -1.027669, 0.9019608, 1, 0, 1,
-0.8605779, 0.2402196, -2.339038, 0.8941177, 1, 0, 1,
-0.8496651, 0.1798285, -0.8242658, 0.8901961, 1, 0, 1,
-0.8484417, -1.287596, -1.385602, 0.8823529, 1, 0, 1,
-0.8443317, -0.01185954, -0.0272606, 0.8784314, 1, 0, 1,
-0.8405538, -0.2761433, -2.478307, 0.8705882, 1, 0, 1,
-0.8385356, 2.106292, -0.7821044, 0.8666667, 1, 0, 1,
-0.8323421, -1.377253, -2.470143, 0.8588235, 1, 0, 1,
-0.831897, 0.02143165, -1.322685, 0.854902, 1, 0, 1,
-0.8278701, 1.312438, -2.158468, 0.8470588, 1, 0, 1,
-0.823984, -0.6808001, -2.921302, 0.8431373, 1, 0, 1,
-0.8147825, -0.6120215, -2.713519, 0.8352941, 1, 0, 1,
-0.8140407, -0.07563759, -1.507384, 0.8313726, 1, 0, 1,
-0.8114182, -0.02778899, -2.118597, 0.8235294, 1, 0, 1,
-0.8100896, -1.096028, -0.8767992, 0.8196079, 1, 0, 1,
-0.8095643, -0.3547154, -1.166622, 0.8117647, 1, 0, 1,
-0.8071783, 0.8153263, 0.06023072, 0.8078431, 1, 0, 1,
-0.8033004, -0.3325504, -1.711392, 0.8, 1, 0, 1,
-0.7934088, -2.147793, -2.743063, 0.7921569, 1, 0, 1,
-0.7928343, -0.09742218, -0.4704069, 0.7882353, 1, 0, 1,
-0.7786576, 0.04060052, -3.311171, 0.7803922, 1, 0, 1,
-0.7785975, 0.5310064, -1.980957, 0.7764706, 1, 0, 1,
-0.7777071, 1.013754, 0.9661974, 0.7686275, 1, 0, 1,
-0.7721633, 0.02553305, -2.281785, 0.7647059, 1, 0, 1,
-0.7704703, 0.8694953, -0.45955, 0.7568628, 1, 0, 1,
-0.7704085, 0.1170919, -1.255267, 0.7529412, 1, 0, 1,
-0.7657862, -0.965333, -3.913649, 0.7450981, 1, 0, 1,
-0.7634999, -0.2434276, -3.882389, 0.7411765, 1, 0, 1,
-0.7618499, 1.058757, 0.2196003, 0.7333333, 1, 0, 1,
-0.7613835, 0.7755976, -0.7587376, 0.7294118, 1, 0, 1,
-0.7591247, -0.7972789, -3.023346, 0.7215686, 1, 0, 1,
-0.7572857, -0.01217664, -1.608146, 0.7176471, 1, 0, 1,
-0.7572522, 0.9000545, -2.688003, 0.7098039, 1, 0, 1,
-0.7535775, -1.487, -2.415653, 0.7058824, 1, 0, 1,
-0.7530488, 1.237885, -1.990313, 0.6980392, 1, 0, 1,
-0.7522717, 0.4050511, -1.927578, 0.6901961, 1, 0, 1,
-0.7483217, 1.286478, -0.7267402, 0.6862745, 1, 0, 1,
-0.7468408, -0.3538087, -1.714188, 0.6784314, 1, 0, 1,
-0.746621, 0.3195856, -0.5878356, 0.6745098, 1, 0, 1,
-0.7435485, 0.415748, -1.171646, 0.6666667, 1, 0, 1,
-0.734441, -0.2641092, -0.01490114, 0.6627451, 1, 0, 1,
-0.7288923, 0.8562468, -0.8852612, 0.654902, 1, 0, 1,
-0.7288294, -1.780138, -4.05603, 0.6509804, 1, 0, 1,
-0.7282909, 0.4988054, -0.7823794, 0.6431373, 1, 0, 1,
-0.728223, -1.377701, -1.49962, 0.6392157, 1, 0, 1,
-0.7265423, -0.07568385, -1.049905, 0.6313726, 1, 0, 1,
-0.7155009, -0.7150978, -2.356587, 0.627451, 1, 0, 1,
-0.715249, 0.9893148, -0.8374093, 0.6196079, 1, 0, 1,
-0.7006656, -0.146193, -1.444342, 0.6156863, 1, 0, 1,
-0.6969267, 0.4100628, -1.88819, 0.6078432, 1, 0, 1,
-0.6950547, 1.165495, 0.2916216, 0.6039216, 1, 0, 1,
-0.6947824, 1.507957, 1.265776, 0.5960785, 1, 0, 1,
-0.6928664, -0.1467801, -0.8356034, 0.5882353, 1, 0, 1,
-0.6909296, -0.2260268, -1.76674, 0.5843138, 1, 0, 1,
-0.6891072, -0.7618715, -2.508488, 0.5764706, 1, 0, 1,
-0.6845155, 0.2137599, -1.155133, 0.572549, 1, 0, 1,
-0.675195, 0.4182831, -0.04227796, 0.5647059, 1, 0, 1,
-0.6715299, -0.5249223, -2.230203, 0.5607843, 1, 0, 1,
-0.6687694, -2.456092, 0.0855849, 0.5529412, 1, 0, 1,
-0.6663855, 0.3610197, -1.482726, 0.5490196, 1, 0, 1,
-0.664887, 2.482518, -1.217189, 0.5411765, 1, 0, 1,
-0.6631264, -1.923142, -3.783696, 0.5372549, 1, 0, 1,
-0.6509171, -0.1862115, -2.200745, 0.5294118, 1, 0, 1,
-0.650212, 1.047573, -0.4758066, 0.5254902, 1, 0, 1,
-0.6500427, 0.5316699, -2.212801, 0.5176471, 1, 0, 1,
-0.6423189, -1.373508, -2.961538, 0.5137255, 1, 0, 1,
-0.6369146, 1.235369, 0.09545897, 0.5058824, 1, 0, 1,
-0.6354259, 1.431655, -2.46737, 0.5019608, 1, 0, 1,
-0.63381, -1.10983, -3.491967, 0.4941176, 1, 0, 1,
-0.6327722, 1.07581, -0.172089, 0.4862745, 1, 0, 1,
-0.6306799, 0.1201995, -0.8931815, 0.4823529, 1, 0, 1,
-0.6242595, 1.388576, -0.5334992, 0.4745098, 1, 0, 1,
-0.6239706, 0.2646684, -1.692228, 0.4705882, 1, 0, 1,
-0.6167796, 0.8343433, -0.02039968, 0.4627451, 1, 0, 1,
-0.6104852, 0.609738, -0.2032403, 0.4588235, 1, 0, 1,
-0.6085959, -1.072618, -2.53473, 0.4509804, 1, 0, 1,
-0.6071019, -0.2338881, -0.8529446, 0.4470588, 1, 0, 1,
-0.6029384, -0.647667, -1.021075, 0.4392157, 1, 0, 1,
-0.6020904, 1.79857, -1.157951, 0.4352941, 1, 0, 1,
-0.6007085, 0.7458048, -1.724278, 0.427451, 1, 0, 1,
-0.5997387, 0.2869737, -1.38, 0.4235294, 1, 0, 1,
-0.5975304, -0.8877038, -3.003715, 0.4156863, 1, 0, 1,
-0.5959508, -1.320225, -4.110039, 0.4117647, 1, 0, 1,
-0.5948914, -2.567931, -2.198627, 0.4039216, 1, 0, 1,
-0.5940412, -2.558003, -2.791907, 0.3960784, 1, 0, 1,
-0.591373, -0.313666, -3.381674, 0.3921569, 1, 0, 1,
-0.59089, 0.09304153, -0.5183062, 0.3843137, 1, 0, 1,
-0.5769274, -1.083688, -4.106956, 0.3803922, 1, 0, 1,
-0.5708675, 2.275864, -0.5087957, 0.372549, 1, 0, 1,
-0.5707132, 0.6328977, -0.6800129, 0.3686275, 1, 0, 1,
-0.5648242, -1.08892, -1.954151, 0.3607843, 1, 0, 1,
-0.559648, -0.483489, -3.806375, 0.3568628, 1, 0, 1,
-0.5592953, -0.5680218, -1.601572, 0.3490196, 1, 0, 1,
-0.559103, -1.476091, -1.125102, 0.345098, 1, 0, 1,
-0.5582606, -0.07594275, -0.5272561, 0.3372549, 1, 0, 1,
-0.557075, -0.09986836, -3.493709, 0.3333333, 1, 0, 1,
-0.5494991, 1.366434, -1.217006, 0.3254902, 1, 0, 1,
-0.5421255, -0.129694, -2.137051, 0.3215686, 1, 0, 1,
-0.5379067, 1.709674, 0.8213284, 0.3137255, 1, 0, 1,
-0.537882, 0.3426317, -1.906816, 0.3098039, 1, 0, 1,
-0.5369391, -0.04477552, -0.9104689, 0.3019608, 1, 0, 1,
-0.5361894, 1.769313, 0.5857562, 0.2941177, 1, 0, 1,
-0.5358644, -0.3556553, -3.782061, 0.2901961, 1, 0, 1,
-0.5354257, 0.2542709, -2.331675, 0.282353, 1, 0, 1,
-0.5323038, 0.3953619, -1.671894, 0.2784314, 1, 0, 1,
-0.5292428, 0.7410212, -1.454421, 0.2705882, 1, 0, 1,
-0.5287132, -0.1435534, -2.620347, 0.2666667, 1, 0, 1,
-0.5215524, -0.7459887, -0.8590879, 0.2588235, 1, 0, 1,
-0.518624, 2.24068, 1.110075, 0.254902, 1, 0, 1,
-0.515946, 0.3216651, -1.708361, 0.2470588, 1, 0, 1,
-0.5139937, -0.6201344, -2.262014, 0.2431373, 1, 0, 1,
-0.513798, -2.606509, -3.84719, 0.2352941, 1, 0, 1,
-0.5094628, 0.608237, -0.6956046, 0.2313726, 1, 0, 1,
-0.5083343, 1.082679, 2.171783, 0.2235294, 1, 0, 1,
-0.4970393, -1.252608, -2.797117, 0.2196078, 1, 0, 1,
-0.4945032, -0.01698089, -2.170503, 0.2117647, 1, 0, 1,
-0.4919844, -0.2750104, -2.516765, 0.2078431, 1, 0, 1,
-0.4903198, 1.135041, 1.315018, 0.2, 1, 0, 1,
-0.4859864, -0.02671665, -1.447577, 0.1921569, 1, 0, 1,
-0.4812859, 1.056952, -0.5542111, 0.1882353, 1, 0, 1,
-0.4770607, 0.7604718, -0.5340743, 0.1803922, 1, 0, 1,
-0.4737852, -1.026361, -2.896908, 0.1764706, 1, 0, 1,
-0.4729354, -0.8807296, -4.179524, 0.1686275, 1, 0, 1,
-0.4721638, 0.7216066, -1.421458, 0.1647059, 1, 0, 1,
-0.4716395, -0.7081193, -2.707779, 0.1568628, 1, 0, 1,
-0.4646895, -0.2293409, -1.787309, 0.1529412, 1, 0, 1,
-0.4617524, -0.8181331, -2.600104, 0.145098, 1, 0, 1,
-0.4606436, 2.050645, -0.6419093, 0.1411765, 1, 0, 1,
-0.459166, 1.06872, 0.564059, 0.1333333, 1, 0, 1,
-0.4532847, -0.7672555, -2.906431, 0.1294118, 1, 0, 1,
-0.4422312, 0.7502734, 0.06317677, 0.1215686, 1, 0, 1,
-0.4422218, 0.9514241, -0.2183437, 0.1176471, 1, 0, 1,
-0.4387171, 0.3183548, -3.4099, 0.1098039, 1, 0, 1,
-0.438411, -1.433766, -3.555757, 0.1058824, 1, 0, 1,
-0.4379207, -1.813932, -2.275492, 0.09803922, 1, 0, 1,
-0.4365937, -0.8119309, -2.671863, 0.09019608, 1, 0, 1,
-0.4354659, 0.5004128, -1.504527, 0.08627451, 1, 0, 1,
-0.4312233, 1.609529, -0.2413611, 0.07843138, 1, 0, 1,
-0.431082, -0.3501051, -2.229133, 0.07450981, 1, 0, 1,
-0.4307189, -0.01580149, -4.41235, 0.06666667, 1, 0, 1,
-0.4283296, -1.111295, -4.608623, 0.0627451, 1, 0, 1,
-0.4236282, 1.401923, 0.7971094, 0.05490196, 1, 0, 1,
-0.4235079, 2.056748, -0.162688, 0.05098039, 1, 0, 1,
-0.4222568, 1.445209, 1.064922, 0.04313726, 1, 0, 1,
-0.4174161, -0.9063888, -2.315627, 0.03921569, 1, 0, 1,
-0.4147146, -0.9767895, -2.400424, 0.03137255, 1, 0, 1,
-0.3988832, 0.1860597, -1.087198, 0.02745098, 1, 0, 1,
-0.3980534, 0.6016766, -0.1093944, 0.01960784, 1, 0, 1,
-0.3954669, -0.7137142, -3.954909, 0.01568628, 1, 0, 1,
-0.3918132, -0.3407677, -1.648899, 0.007843138, 1, 0, 1,
-0.3890788, -1.324654, -3.536988, 0.003921569, 1, 0, 1,
-0.3888829, -0.7934292, -2.462229, 0, 1, 0.003921569, 1,
-0.3884733, 1.215852, 1.69149, 0, 1, 0.01176471, 1,
-0.388287, -0.5157061, -2.830769, 0, 1, 0.01568628, 1,
-0.3877083, -2.345855, -2.312163, 0, 1, 0.02352941, 1,
-0.3833993, 0.8383815, -0.01532016, 0, 1, 0.02745098, 1,
-0.3832901, 0.05237343, -0.3080661, 0, 1, 0.03529412, 1,
-0.3819428, -1.306887, -2.483969, 0, 1, 0.03921569, 1,
-0.3763428, 0.3533097, 0.001833982, 0, 1, 0.04705882, 1,
-0.3757636, 0.3409483, -0.009739649, 0, 1, 0.05098039, 1,
-0.3752668, -0.1217147, -0.9921018, 0, 1, 0.05882353, 1,
-0.3746599, 0.5954954, -0.06362808, 0, 1, 0.0627451, 1,
-0.3709367, 1.112586, 0.002534878, 0, 1, 0.07058824, 1,
-0.3669563, -1.102048, -2.210197, 0, 1, 0.07450981, 1,
-0.3664012, -0.3263448, -1.698346, 0, 1, 0.08235294, 1,
-0.3659978, 0.7388489, -1.095353, 0, 1, 0.08627451, 1,
-0.3634481, 1.340899, 1.61541, 0, 1, 0.09411765, 1,
-0.3604608, 0.8541893, -0.6873662, 0, 1, 0.1019608, 1,
-0.3604096, 0.4875778, 0.449191, 0, 1, 0.1058824, 1,
-0.3602108, -0.4030712, -2.933033, 0, 1, 0.1137255, 1,
-0.3560429, 0.04920065, -1.564676, 0, 1, 0.1176471, 1,
-0.3532894, 0.8914426, -0.2826075, 0, 1, 0.1254902, 1,
-0.3477797, 0.8308705, 0.9968207, 0, 1, 0.1294118, 1,
-0.3468772, 0.5355108, 0.1288299, 0, 1, 0.1372549, 1,
-0.3468178, -0.9085826, -3.420398, 0, 1, 0.1411765, 1,
-0.345814, -0.2470109, 1.127748, 0, 1, 0.1490196, 1,
-0.3426692, 0.3597487, 0.04751587, 0, 1, 0.1529412, 1,
-0.3356908, -0.257563, -3.305868, 0, 1, 0.1607843, 1,
-0.3331397, 0.2550482, -1.680563, 0, 1, 0.1647059, 1,
-0.3255691, -0.07519726, -0.8153981, 0, 1, 0.172549, 1,
-0.3211749, 0.3187289, -1.093152, 0, 1, 0.1764706, 1,
-0.3206579, 0.570866, 0.6095386, 0, 1, 0.1843137, 1,
-0.3200669, -0.3580775, -3.833079, 0, 1, 0.1882353, 1,
-0.3174503, 0.1384386, 0.1014009, 0, 1, 0.1960784, 1,
-0.3157173, 1.61805, 0.06942698, 0, 1, 0.2039216, 1,
-0.3127817, 0.9903671, 1.653017, 0, 1, 0.2078431, 1,
-0.3101214, 1.213766, 0.883828, 0, 1, 0.2156863, 1,
-0.308152, -1.599062, -3.425111, 0, 1, 0.2196078, 1,
-0.303849, 0.1861372, 1.513865, 0, 1, 0.227451, 1,
-0.3037683, -1.783323, -4.501679, 0, 1, 0.2313726, 1,
-0.2983514, 0.118105, -0.4943101, 0, 1, 0.2392157, 1,
-0.2981171, -1.392589, -2.838695, 0, 1, 0.2431373, 1,
-0.2952883, -0.3143486, -1.469043, 0, 1, 0.2509804, 1,
-0.2938557, -0.01182142, -1.828571, 0, 1, 0.254902, 1,
-0.2909872, -0.5054737, -1.825095, 0, 1, 0.2627451, 1,
-0.290419, 0.7925655, 0.1510726, 0, 1, 0.2666667, 1,
-0.2884573, -0.4505348, -1.90107, 0, 1, 0.2745098, 1,
-0.2858002, 0.3565974, -0.7680321, 0, 1, 0.2784314, 1,
-0.2856525, 0.113306, -0.03839584, 0, 1, 0.2862745, 1,
-0.2855048, 0.06229137, -1.20666, 0, 1, 0.2901961, 1,
-0.2792608, -1.219732, -1.855611, 0, 1, 0.2980392, 1,
-0.2773777, 0.104935, -0.6433313, 0, 1, 0.3058824, 1,
-0.2739879, -0.3455088, -3.21587, 0, 1, 0.3098039, 1,
-0.2733488, 1.558363, -0.2818689, 0, 1, 0.3176471, 1,
-0.2699133, 1.27622, -0.7292854, 0, 1, 0.3215686, 1,
-0.2689348, -1.626275, -3.616619, 0, 1, 0.3294118, 1,
-0.2659012, -0.1602542, -2.14607, 0, 1, 0.3333333, 1,
-0.2657208, 0.5231992, 0.1780983, 0, 1, 0.3411765, 1,
-0.2653196, -3.24366, -4.265789, 0, 1, 0.345098, 1,
-0.2635241, 1.41963, -0.4168381, 0, 1, 0.3529412, 1,
-0.2615747, -1.84631, -4.954095, 0, 1, 0.3568628, 1,
-0.257416, 0.3948483, -1.707004, 0, 1, 0.3647059, 1,
-0.2557865, -0.05326307, -0.7494639, 0, 1, 0.3686275, 1,
-0.2543448, 0.6721877, 0.3360054, 0, 1, 0.3764706, 1,
-0.2507152, 0.0648421, -1.266868, 0, 1, 0.3803922, 1,
-0.248069, 0.7298157, -0.7259106, 0, 1, 0.3882353, 1,
-0.2468352, -0.232803, -1.662065, 0, 1, 0.3921569, 1,
-0.2461249, -1.341088, -4.8684, 0, 1, 0.4, 1,
-0.2452211, -1.442698, -2.607282, 0, 1, 0.4078431, 1,
-0.2398567, 0.8298291, -2.128104, 0, 1, 0.4117647, 1,
-0.2342864, -2.055478, -1.304028, 0, 1, 0.4196078, 1,
-0.2331807, 0.8769053, 0.4840202, 0, 1, 0.4235294, 1,
-0.2329793, -0.05194418, -1.959135, 0, 1, 0.4313726, 1,
-0.2320741, 0.9936743, -0.07869734, 0, 1, 0.4352941, 1,
-0.2312284, 1.247376, 1.593329, 0, 1, 0.4431373, 1,
-0.2273964, -0.4944603, -1.87691, 0, 1, 0.4470588, 1,
-0.2260459, 0.618176, -1.777261, 0, 1, 0.454902, 1,
-0.2143594, -0.950856, -2.846479, 0, 1, 0.4588235, 1,
-0.2124633, 0.2733654, -1.245803, 0, 1, 0.4666667, 1,
-0.2116441, -0.05587609, -1.809523, 0, 1, 0.4705882, 1,
-0.2110158, 1.132046, -0.0803363, 0, 1, 0.4784314, 1,
-0.2074249, -1.355632, -3.336528, 0, 1, 0.4823529, 1,
-0.2073297, 2.520344, -0.09981309, 0, 1, 0.4901961, 1,
-0.2051049, -1.107027, -2.773762, 0, 1, 0.4941176, 1,
-0.2045475, 1.167804, 0.9087048, 0, 1, 0.5019608, 1,
-0.2020505, -1.564731, -4.184869, 0, 1, 0.509804, 1,
-0.2010077, 0.716796, -0.01780295, 0, 1, 0.5137255, 1,
-0.2002437, 0.9773837, 0.142276, 0, 1, 0.5215687, 1,
-0.1971894, 1.316499, -0.003126809, 0, 1, 0.5254902, 1,
-0.1967964, -1.551449, -3.290784, 0, 1, 0.5333334, 1,
-0.1950027, 0.05840231, -0.998251, 0, 1, 0.5372549, 1,
-0.1932399, 0.4499617, -0.7785662, 0, 1, 0.5450981, 1,
-0.190408, -0.8736901, -1.946606, 0, 1, 0.5490196, 1,
-0.1866695, 0.8560184, 1.071732, 0, 1, 0.5568628, 1,
-0.1828564, 1.18459, -1.712445, 0, 1, 0.5607843, 1,
-0.1815209, 0.07480061, -0.3823242, 0, 1, 0.5686275, 1,
-0.1811726, 0.4347093, -1.301224, 0, 1, 0.572549, 1,
-0.1810058, 0.7357857, 0.1296913, 0, 1, 0.5803922, 1,
-0.1787062, 0.02759629, 0.6427007, 0, 1, 0.5843138, 1,
-0.1753159, -0.7490401, -3.118968, 0, 1, 0.5921569, 1,
-0.1731501, -0.8507144, -1.214629, 0, 1, 0.5960785, 1,
-0.1719007, 2.046206, 0.5497922, 0, 1, 0.6039216, 1,
-0.1670969, 0.03589501, -1.667501, 0, 1, 0.6117647, 1,
-0.1586151, 0.5947728, -1.90586, 0, 1, 0.6156863, 1,
-0.1580909, -0.3698013, -2.54314, 0, 1, 0.6235294, 1,
-0.1499333, 0.1501167, -1.939006, 0, 1, 0.627451, 1,
-0.1497741, 0.4158915, -1.144873, 0, 1, 0.6352941, 1,
-0.1475974, -0.02837789, -1.50815, 0, 1, 0.6392157, 1,
-0.1456506, -0.1071507, -1.34647, 0, 1, 0.6470588, 1,
-0.1385266, 0.2656215, 0.822004, 0, 1, 0.6509804, 1,
-0.1360061, 0.2909962, -1.110577, 0, 1, 0.6588235, 1,
-0.1354457, -0.283252, -2.934317, 0, 1, 0.6627451, 1,
-0.1331583, 0.8049687, -0.9581062, 0, 1, 0.6705883, 1,
-0.1316911, 1.067899, 1.493277, 0, 1, 0.6745098, 1,
-0.130109, -1.497526, -3.842791, 0, 1, 0.682353, 1,
-0.1287781, 0.435678, 0.1090223, 0, 1, 0.6862745, 1,
-0.1254616, 1.822467, -0.596352, 0, 1, 0.6941177, 1,
-0.1166068, 0.8367262, 0.5742405, 0, 1, 0.7019608, 1,
-0.1142875, 0.9416667, -0.362409, 0, 1, 0.7058824, 1,
-0.1132192, -1.244804, -2.518831, 0, 1, 0.7137255, 1,
-0.1114257, 0.8058097, 0.6608143, 0, 1, 0.7176471, 1,
-0.1099671, 0.06724809, -2.038075, 0, 1, 0.7254902, 1,
-0.1065196, 0.4939134, -0.1180972, 0, 1, 0.7294118, 1,
-0.1042038, -0.9834263, -4.340179, 0, 1, 0.7372549, 1,
-0.1031119, 0.9464191, -0.8246868, 0, 1, 0.7411765, 1,
-0.1021846, 0.5477242, 0.07854158, 0, 1, 0.7490196, 1,
-0.1008036, 1.267185, -2.119344, 0, 1, 0.7529412, 1,
-0.1007787, 0.2354625, -0.6041348, 0, 1, 0.7607843, 1,
-0.09802789, -0.07843045, -2.856142, 0, 1, 0.7647059, 1,
-0.0954314, -0.190727, -0.8164445, 0, 1, 0.772549, 1,
-0.09226022, -0.1819559, -2.506992, 0, 1, 0.7764706, 1,
-0.08704773, 0.564289, -0.2303348, 0, 1, 0.7843137, 1,
-0.08550043, 0.8826976, -2.227324, 0, 1, 0.7882353, 1,
-0.08066051, -0.1967516, -3.719765, 0, 1, 0.7960784, 1,
-0.07980586, -0.09624249, -1.707348, 0, 1, 0.8039216, 1,
-0.06892718, 0.2892312, 0.03724674, 0, 1, 0.8078431, 1,
-0.06470644, 0.1625554, -0.1652317, 0, 1, 0.8156863, 1,
-0.06391429, 1.697554, -0.6198109, 0, 1, 0.8196079, 1,
-0.0627676, -0.5592676, -3.204662, 0, 1, 0.827451, 1,
-0.05983203, 1.037806, 0.2144457, 0, 1, 0.8313726, 1,
-0.05490448, -1.093775, -3.809952, 0, 1, 0.8392157, 1,
-0.04965714, 0.7997829, 0.3445616, 0, 1, 0.8431373, 1,
-0.04906681, 0.6476011, 0.5588355, 0, 1, 0.8509804, 1,
-0.04739899, -0.9836844, -2.030515, 0, 1, 0.854902, 1,
-0.04671632, 0.1184999, -2.029274, 0, 1, 0.8627451, 1,
-0.04468412, 1.712473, 1.799582, 0, 1, 0.8666667, 1,
-0.04045186, 0.8014702, -0.2066326, 0, 1, 0.8745098, 1,
-0.03881683, -0.4147062, -4.453734, 0, 1, 0.8784314, 1,
-0.03623083, 0.3089918, 0.3673987, 0, 1, 0.8862745, 1,
-0.03215926, -0.9489881, -2.408716, 0, 1, 0.8901961, 1,
-0.03113431, 0.6600819, -1.332576, 0, 1, 0.8980392, 1,
-0.0239321, -0.04683383, -2.876722, 0, 1, 0.9058824, 1,
-0.02151484, 0.8907548, 0.01640018, 0, 1, 0.9098039, 1,
-0.01097994, 1.475956, 2.104823, 0, 1, 0.9176471, 1,
-0.006965033, -0.3217945, -3.992668, 0, 1, 0.9215686, 1,
-0.006001645, 0.6050374, 1.533331, 0, 1, 0.9294118, 1,
-0.004709586, 1.44933, -0.09414314, 0, 1, 0.9333333, 1,
-0.002115194, 1.622842, 0.2646999, 0, 1, 0.9411765, 1,
-0.000115052, 0.9285166, -1.136363, 0, 1, 0.945098, 1,
0.0004419545, 0.8971258, -0.066016, 0, 1, 0.9529412, 1,
0.002559625, 1.083029, 0.2452539, 0, 1, 0.9568627, 1,
0.003942514, 0.1493667, -0.6339551, 0, 1, 0.9647059, 1,
0.006779126, -0.8002476, 3.115449, 0, 1, 0.9686275, 1,
0.008223541, 0.4095214, 2.027817, 0, 1, 0.9764706, 1,
0.009006548, -0.5637816, 2.099932, 0, 1, 0.9803922, 1,
0.01144278, 0.7116604, 0.05581556, 0, 1, 0.9882353, 1,
0.01968205, 0.2950945, -0.372264, 0, 1, 0.9921569, 1,
0.02340606, 0.3577264, 0.198029, 0, 1, 1, 1,
0.02781124, 0.6538996, 0.7497174, 0, 0.9921569, 1, 1,
0.02919873, -1.247801, 3.861108, 0, 0.9882353, 1, 1,
0.03046468, -0.04212589, 3.880356, 0, 0.9803922, 1, 1,
0.03077227, -0.5361034, 0.5771811, 0, 0.9764706, 1, 1,
0.03140185, -0.0232765, 2.522062, 0, 0.9686275, 1, 1,
0.03514305, -0.806992, 4.004142, 0, 0.9647059, 1, 1,
0.03715501, 1.557311, -0.1336395, 0, 0.9568627, 1, 1,
0.04427996, -2.032896, 3.492235, 0, 0.9529412, 1, 1,
0.05253305, 0.6373639, -0.751096, 0, 0.945098, 1, 1,
0.05570446, 0.4864509, -0.1681771, 0, 0.9411765, 1, 1,
0.05674725, -1.111231, 2.193966, 0, 0.9333333, 1, 1,
0.06013089, -0.697178, 2.628452, 0, 0.9294118, 1, 1,
0.06197733, -1.244056, 3.490537, 0, 0.9215686, 1, 1,
0.07958774, -1.277489, 2.225558, 0, 0.9176471, 1, 1,
0.08134793, -1.340986, 3.038587, 0, 0.9098039, 1, 1,
0.08420295, -0.1928893, 2.408676, 0, 0.9058824, 1, 1,
0.08643177, 0.9456301, -1.002638, 0, 0.8980392, 1, 1,
0.0866026, 0.6529855, -0.08433454, 0, 0.8901961, 1, 1,
0.09166845, 1.698148, -0.0932506, 0, 0.8862745, 1, 1,
0.09313419, -0.7267047, 4.03167, 0, 0.8784314, 1, 1,
0.09741926, -0.02694923, 3.720294, 0, 0.8745098, 1, 1,
0.09758728, 0.8795124, -0.6287167, 0, 0.8666667, 1, 1,
0.1008407, -2.626056, 1.221808, 0, 0.8627451, 1, 1,
0.10195, 0.4912294, -0.08569485, 0, 0.854902, 1, 1,
0.1025272, -1.558502, 3.490924, 0, 0.8509804, 1, 1,
0.1102899, 0.1925921, 2.284866, 0, 0.8431373, 1, 1,
0.1111543, -1.783419, 5.074594, 0, 0.8392157, 1, 1,
0.1117881, 0.5921777, 0.07263193, 0, 0.8313726, 1, 1,
0.1217977, 0.7312239, 0.2500272, 0, 0.827451, 1, 1,
0.1267556, -0.5274169, 3.09838, 0, 0.8196079, 1, 1,
0.1285833, 0.7060306, 0.9018015, 0, 0.8156863, 1, 1,
0.1296529, 1.298934, -2.298899, 0, 0.8078431, 1, 1,
0.1296896, -0.7656575, 2.866773, 0, 0.8039216, 1, 1,
0.1321532, -1.309503, 2.88818, 0, 0.7960784, 1, 1,
0.1333079, -1.6481, 3.208346, 0, 0.7882353, 1, 1,
0.1361639, 1.094121, 0.6306075, 0, 0.7843137, 1, 1,
0.1367379, -0.4219212, 4.674862, 0, 0.7764706, 1, 1,
0.1413225, -0.5403891, 5.101505, 0, 0.772549, 1, 1,
0.1421763, 0.05091525, 0.6404576, 0, 0.7647059, 1, 1,
0.1438684, 0.6296947, 0.8267755, 0, 0.7607843, 1, 1,
0.1508574, 0.2508741, 2.148105, 0, 0.7529412, 1, 1,
0.1508933, 0.5581562, -0.4086331, 0, 0.7490196, 1, 1,
0.1509359, 0.4147635, 1.316675, 0, 0.7411765, 1, 1,
0.1510898, -0.7578024, 2.943935, 0, 0.7372549, 1, 1,
0.1512222, -1.233192, 4.46794, 0, 0.7294118, 1, 1,
0.1535866, -0.8960044, 1.713825, 0, 0.7254902, 1, 1,
0.1536279, 0.02025621, 0.7942725, 0, 0.7176471, 1, 1,
0.1549348, 0.2028234, 0.09171399, 0, 0.7137255, 1, 1,
0.1592709, 0.4715174, -0.5658785, 0, 0.7058824, 1, 1,
0.1644873, 0.3609718, -0.2243193, 0, 0.6980392, 1, 1,
0.16608, -0.8308756, 2.350662, 0, 0.6941177, 1, 1,
0.1701018, -2.983292, 3.050942, 0, 0.6862745, 1, 1,
0.171265, -0.11767, 2.092131, 0, 0.682353, 1, 1,
0.1723049, 0.8902844, 0.8027453, 0, 0.6745098, 1, 1,
0.1725131, -0.1332677, 3.929677, 0, 0.6705883, 1, 1,
0.1739708, 0.4039218, -0.4320494, 0, 0.6627451, 1, 1,
0.1797362, -0.7445896, 1.730003, 0, 0.6588235, 1, 1,
0.180201, 0.4027776, 1.636963, 0, 0.6509804, 1, 1,
0.1858788, 1.860812, 0.2520615, 0, 0.6470588, 1, 1,
0.1881245, 0.2387803, 0.8680722, 0, 0.6392157, 1, 1,
0.1975088, -0.7947203, 1.38866, 0, 0.6352941, 1, 1,
0.2022616, -0.3486958, 3.008788, 0, 0.627451, 1, 1,
0.2109735, 0.6541384, 1.804476, 0, 0.6235294, 1, 1,
0.2130945, 1.446932, -0.3729506, 0, 0.6156863, 1, 1,
0.2189801, -0.230873, 2.235574, 0, 0.6117647, 1, 1,
0.223167, -0.9088497, 2.259673, 0, 0.6039216, 1, 1,
0.2257611, 0.4275724, 1.31207, 0, 0.5960785, 1, 1,
0.2277557, -1.649328, 2.783706, 0, 0.5921569, 1, 1,
0.2287025, 0.2603482, -0.7885388, 0, 0.5843138, 1, 1,
0.2292664, 0.9267268, -0.8244122, 0, 0.5803922, 1, 1,
0.2295939, -1.044983, 3.450727, 0, 0.572549, 1, 1,
0.2322178, -0.3417028, 2.500478, 0, 0.5686275, 1, 1,
0.2356771, -0.8244374, 2.983046, 0, 0.5607843, 1, 1,
0.2357297, 0.4805946, 0.2974728, 0, 0.5568628, 1, 1,
0.2372546, 0.6869863, 0.8168745, 0, 0.5490196, 1, 1,
0.2426195, 2.001945, -1.064174, 0, 0.5450981, 1, 1,
0.2436682, 0.2806934, 0.8387651, 0, 0.5372549, 1, 1,
0.2445136, -0.09508347, 1.590091, 0, 0.5333334, 1, 1,
0.2452525, 0.3351286, 1.140813, 0, 0.5254902, 1, 1,
0.2469801, -0.6736631, 3.437586, 0, 0.5215687, 1, 1,
0.253582, 0.1395358, 1.202892, 0, 0.5137255, 1, 1,
0.2540796, 0.6357009, 0.6434525, 0, 0.509804, 1, 1,
0.2578672, 1.055624, 1.896964, 0, 0.5019608, 1, 1,
0.2623681, -0.6844602, 2.557769, 0, 0.4941176, 1, 1,
0.2628081, 1.026565, 1.941123, 0, 0.4901961, 1, 1,
0.2637731, -1.329495, 2.91087, 0, 0.4823529, 1, 1,
0.2646731, -1.419532, 2.224948, 0, 0.4784314, 1, 1,
0.2690339, 1.087876, 1.020823, 0, 0.4705882, 1, 1,
0.2781839, -0.5534575, 3.489293, 0, 0.4666667, 1, 1,
0.286111, 0.6521679, 0.3946697, 0, 0.4588235, 1, 1,
0.290486, -1.034719, 2.823641, 0, 0.454902, 1, 1,
0.2992375, -0.2984454, 2.831016, 0, 0.4470588, 1, 1,
0.3023746, -0.5523005, -0.1258937, 0, 0.4431373, 1, 1,
0.3061331, -0.803145, 4.380477, 0, 0.4352941, 1, 1,
0.3097935, -1.359331, 3.192039, 0, 0.4313726, 1, 1,
0.3104177, 1.74804, 0.4737701, 0, 0.4235294, 1, 1,
0.3120948, -0.5248265, 3.476206, 0, 0.4196078, 1, 1,
0.3125941, -0.2960455, 2.01039, 0, 0.4117647, 1, 1,
0.3136724, 0.857111, 0.8383983, 0, 0.4078431, 1, 1,
0.3159937, -0.8462664, 3.463899, 0, 0.4, 1, 1,
0.3177678, 0.1425759, 1.041194, 0, 0.3921569, 1, 1,
0.3198291, -0.7040349, 3.380651, 0, 0.3882353, 1, 1,
0.3198391, 0.1832039, 1.609653, 0, 0.3803922, 1, 1,
0.3215056, -0.9036712, 3.219604, 0, 0.3764706, 1, 1,
0.3222353, -0.02039782, 0.5610215, 0, 0.3686275, 1, 1,
0.3241591, 1.58384, 0.429043, 0, 0.3647059, 1, 1,
0.3280446, -1.392558, 4.346601, 0, 0.3568628, 1, 1,
0.330626, 0.5207158, -0.9989402, 0, 0.3529412, 1, 1,
0.3363277, -1.246946, 4.419897, 0, 0.345098, 1, 1,
0.3363549, -0.4197452, 2.805149, 0, 0.3411765, 1, 1,
0.3371704, -0.4669627, 3.57495, 0, 0.3333333, 1, 1,
0.3404046, -1.077592, 4.12306, 0, 0.3294118, 1, 1,
0.3413844, 1.181666, 1.306351, 0, 0.3215686, 1, 1,
0.342694, 0.7330745, 1.097343, 0, 0.3176471, 1, 1,
0.3437212, -1.398765, 1.565109, 0, 0.3098039, 1, 1,
0.3486414, -1.41817, 3.810873, 0, 0.3058824, 1, 1,
0.3490469, 0.9737189, -0.02084984, 0, 0.2980392, 1, 1,
0.3493839, -1.050326, 3.934871, 0, 0.2901961, 1, 1,
0.3524686, 1.313092, -1.649357, 0, 0.2862745, 1, 1,
0.3525125, 0.8998228, -0.9559703, 0, 0.2784314, 1, 1,
0.3527526, 0.9468099, -0.07142024, 0, 0.2745098, 1, 1,
0.3533596, 0.8721753, -0.08162706, 0, 0.2666667, 1, 1,
0.355466, 0.399729, -0.4880082, 0, 0.2627451, 1, 1,
0.3639557, 0.517364, 0.3282475, 0, 0.254902, 1, 1,
0.3653513, 1.554733, 0.02880331, 0, 0.2509804, 1, 1,
0.3656362, -1.174474, 3.437097, 0, 0.2431373, 1, 1,
0.3666005, 1.488777, 2.592101, 0, 0.2392157, 1, 1,
0.3678467, 0.09528976, 1.003221, 0, 0.2313726, 1, 1,
0.3694075, 0.8638286, -0.1687386, 0, 0.227451, 1, 1,
0.3711646, -0.6252731, 1.88377, 0, 0.2196078, 1, 1,
0.3809435, 0.3629508, 0.8883731, 0, 0.2156863, 1, 1,
0.3816603, 0.2102446, 0.5388365, 0, 0.2078431, 1, 1,
0.3817411, -0.9425358, 0.14759, 0, 0.2039216, 1, 1,
0.381954, -0.2083087, 4.364965, 0, 0.1960784, 1, 1,
0.3848941, -0.05312335, 1.950446, 0, 0.1882353, 1, 1,
0.3850009, -0.4857509, 4.002176, 0, 0.1843137, 1, 1,
0.3909705, -0.8558723, 1.152838, 0, 0.1764706, 1, 1,
0.3922044, -0.7764732, 0.9803661, 0, 0.172549, 1, 1,
0.3924037, 0.0852917, 1.453257, 0, 0.1647059, 1, 1,
0.3993788, -0.9590554, 3.144243, 0, 0.1607843, 1, 1,
0.4024721, -1.34782, 2.63583, 0, 0.1529412, 1, 1,
0.4037166, 0.4150704, -0.3862724, 0, 0.1490196, 1, 1,
0.4055949, 2.517417, -1.239288, 0, 0.1411765, 1, 1,
0.4056749, -0.5035734, 1.890703, 0, 0.1372549, 1, 1,
0.4065902, -0.4935098, 2.81046, 0, 0.1294118, 1, 1,
0.4199165, -0.003708583, 2.448942, 0, 0.1254902, 1, 1,
0.4200585, 3.101279, -1.665155, 0, 0.1176471, 1, 1,
0.4209775, -0.09273498, 3.23055, 0, 0.1137255, 1, 1,
0.4242198, -1.308982, 2.405838, 0, 0.1058824, 1, 1,
0.4302769, -1.402685, 2.468317, 0, 0.09803922, 1, 1,
0.433726, 0.371306, 0.2768205, 0, 0.09411765, 1, 1,
0.4365917, -1.127526, 2.624191, 0, 0.08627451, 1, 1,
0.4406917, 1.389055, -1.03148, 0, 0.08235294, 1, 1,
0.4428729, 0.3706338, 3.725649, 0, 0.07450981, 1, 1,
0.4466572, -0.9887609, 4.584939, 0, 0.07058824, 1, 1,
0.4475467, -0.3812986, 2.198668, 0, 0.0627451, 1, 1,
0.4557152, -2.309501, 2.11735, 0, 0.05882353, 1, 1,
0.4587855, 0.7433857, -1.02011, 0, 0.05098039, 1, 1,
0.4615771, -0.8051799, 3.423455, 0, 0.04705882, 1, 1,
0.462416, -3.221952, 3.519388, 0, 0.03921569, 1, 1,
0.464273, 1.353779, 0.2636977, 0, 0.03529412, 1, 1,
0.4659338, -1.206469, 1.843344, 0, 0.02745098, 1, 1,
0.4721063, -0.9307948, 4.053339, 0, 0.02352941, 1, 1,
0.4765556, -1.813028, 2.76274, 0, 0.01568628, 1, 1,
0.485056, -0.5476289, 3.6469, 0, 0.01176471, 1, 1,
0.4851161, 1.144479, 0.01314438, 0, 0.003921569, 1, 1,
0.4875107, 0.08102734, 1.858943, 0.003921569, 0, 1, 1,
0.4904982, -0.7694538, 3.012834, 0.007843138, 0, 1, 1,
0.4948647, 0.4256578, -0.5335931, 0.01568628, 0, 1, 1,
0.4959293, -0.9378599, 2.562306, 0.01960784, 0, 1, 1,
0.4975592, -0.1041583, 2.244667, 0.02745098, 0, 1, 1,
0.5006457, 1.78388, 2.284678, 0.03137255, 0, 1, 1,
0.5011119, -0.5345545, 2.537863, 0.03921569, 0, 1, 1,
0.5025278, -0.1270446, 1.833275, 0.04313726, 0, 1, 1,
0.503628, 1.639326, -1.612649, 0.05098039, 0, 1, 1,
0.5055583, 0.6937304, 0.188539, 0.05490196, 0, 1, 1,
0.5056866, 1.550164, -1.883922, 0.0627451, 0, 1, 1,
0.5064551, -1.64146, 1.655055, 0.06666667, 0, 1, 1,
0.5132856, 1.832123, -0.429386, 0.07450981, 0, 1, 1,
0.5183061, 0.4633704, 0.302249, 0.07843138, 0, 1, 1,
0.5212409, -0.01009909, 1.546701, 0.08627451, 0, 1, 1,
0.5218796, -0.5657876, 2.810442, 0.09019608, 0, 1, 1,
0.5250531, 0.0857191, 2.635738, 0.09803922, 0, 1, 1,
0.5288057, 2.338239, -0.5137135, 0.1058824, 0, 1, 1,
0.5336573, 1.561188, 0.8638145, 0.1098039, 0, 1, 1,
0.534865, -0.8351298, 1.834845, 0.1176471, 0, 1, 1,
0.5366621, -0.7394856, 2.092767, 0.1215686, 0, 1, 1,
0.5407672, -1.756638, 3.054087, 0.1294118, 0, 1, 1,
0.5422317, 0.4872724, 0.6504684, 0.1333333, 0, 1, 1,
0.5435132, -0.5159451, 1.403543, 0.1411765, 0, 1, 1,
0.5526488, -0.5987054, 3.374844, 0.145098, 0, 1, 1,
0.5586442, 0.2751951, 2.221754, 0.1529412, 0, 1, 1,
0.5597461, -0.46224, 2.089661, 0.1568628, 0, 1, 1,
0.567979, -1.790482, 1.935139, 0.1647059, 0, 1, 1,
0.5692387, 1.102095, 1.798807, 0.1686275, 0, 1, 1,
0.5764905, -0.7753606, 2.911025, 0.1764706, 0, 1, 1,
0.5768224, 0.4658376, 2.278675, 0.1803922, 0, 1, 1,
0.5826483, -1.216481, 2.752262, 0.1882353, 0, 1, 1,
0.5839715, -2.669655, 2.325189, 0.1921569, 0, 1, 1,
0.5844797, 1.097476, 0.6465057, 0.2, 0, 1, 1,
0.5848314, 0.3889441, 0.6899039, 0.2078431, 0, 1, 1,
0.5899288, 0.6008376, 1.639443, 0.2117647, 0, 1, 1,
0.5933213, -0.08150624, 1.862163, 0.2196078, 0, 1, 1,
0.5958178, 2.031406, -0.5306612, 0.2235294, 0, 1, 1,
0.6002524, 0.3525886, 0.04459742, 0.2313726, 0, 1, 1,
0.6009362, -0.1521061, 3.875754, 0.2352941, 0, 1, 1,
0.6009513, 0.7516057, 1.283795, 0.2431373, 0, 1, 1,
0.6064152, -0.7425372, 2.488926, 0.2470588, 0, 1, 1,
0.6075516, 0.8321636, 0.09063392, 0.254902, 0, 1, 1,
0.609647, -0.5916141, 2.237575, 0.2588235, 0, 1, 1,
0.6101801, -0.2755438, 0.60147, 0.2666667, 0, 1, 1,
0.6253264, -2.070292, 3.274435, 0.2705882, 0, 1, 1,
0.6278123, 0.03309401, 3.203068, 0.2784314, 0, 1, 1,
0.6292743, -0.08771311, 2.775604, 0.282353, 0, 1, 1,
0.6333822, -0.6295074, 1.611735, 0.2901961, 0, 1, 1,
0.6339603, -1.634795, -0.6447185, 0.2941177, 0, 1, 1,
0.6347721, 0.2495724, 1.28307, 0.3019608, 0, 1, 1,
0.6351078, -1.247782, 1.243022, 0.3098039, 0, 1, 1,
0.6368435, -0.8137143, 1.728005, 0.3137255, 0, 1, 1,
0.6388285, -1.283623, 1.104345, 0.3215686, 0, 1, 1,
0.6418469, 0.195394, 2.371665, 0.3254902, 0, 1, 1,
0.6459672, 0.9027702, 1.48046, 0.3333333, 0, 1, 1,
0.6570755, 0.1306766, 2.509991, 0.3372549, 0, 1, 1,
0.6583468, -2.584737, 2.609639, 0.345098, 0, 1, 1,
0.6584182, 0.6191652, 2.050904, 0.3490196, 0, 1, 1,
0.6591895, 1.468756, 0.1714749, 0.3568628, 0, 1, 1,
0.6595646, 0.4243362, 0.5944579, 0.3607843, 0, 1, 1,
0.6607972, -0.02447911, 2.137891, 0.3686275, 0, 1, 1,
0.6632216, 1.780471, -0.1503458, 0.372549, 0, 1, 1,
0.6635724, -1.235863, 3.357838, 0.3803922, 0, 1, 1,
0.6640636, -0.8919825, 1.477702, 0.3843137, 0, 1, 1,
0.6671968, 0.8081918, 0.7844495, 0.3921569, 0, 1, 1,
0.6675482, 0.3827818, 0.3893301, 0.3960784, 0, 1, 1,
0.6702598, -1.24189, 2.458399, 0.4039216, 0, 1, 1,
0.6733696, -0.08112835, 0.9967252, 0.4117647, 0, 1, 1,
0.677035, -0.3308842, 1.481573, 0.4156863, 0, 1, 1,
0.6802834, 1.305502, -0.07017474, 0.4235294, 0, 1, 1,
0.6841152, -2.510568, 2.160315, 0.427451, 0, 1, 1,
0.6852837, 1.5826, -0.5378706, 0.4352941, 0, 1, 1,
0.6888258, 0.5068015, 1.105839, 0.4392157, 0, 1, 1,
0.6943299, 2.103142, -0.1464188, 0.4470588, 0, 1, 1,
0.6950691, -0.1377724, 1.297992, 0.4509804, 0, 1, 1,
0.6971882, 0.2885105, 1.122678, 0.4588235, 0, 1, 1,
0.697993, -0.04646202, 2.172795, 0.4627451, 0, 1, 1,
0.6981502, -0.3666996, 2.00084, 0.4705882, 0, 1, 1,
0.6989834, -0.1796643, 1.028927, 0.4745098, 0, 1, 1,
0.7066588, 0.9317654, 1.385321, 0.4823529, 0, 1, 1,
0.7073647, -1.041134, 3.67167, 0.4862745, 0, 1, 1,
0.7092099, 0.9878611, 0.5458619, 0.4941176, 0, 1, 1,
0.7097532, -0.3053131, 1.587946, 0.5019608, 0, 1, 1,
0.7163278, 0.9460903, 0.7769668, 0.5058824, 0, 1, 1,
0.7168732, 0.6086503, 1.289005, 0.5137255, 0, 1, 1,
0.7171523, 0.05859492, 1.597066, 0.5176471, 0, 1, 1,
0.7253133, 1.138498, 0.01529452, 0.5254902, 0, 1, 1,
0.7304769, -0.5095973, 2.364712, 0.5294118, 0, 1, 1,
0.7333145, -0.08502311, 1.823737, 0.5372549, 0, 1, 1,
0.7334232, -1.261559, 2.044345, 0.5411765, 0, 1, 1,
0.7378111, 0.6044329, 3.391427, 0.5490196, 0, 1, 1,
0.7388718, -0.2512827, 1.406418, 0.5529412, 0, 1, 1,
0.7410434, -0.5830499, 4.384267, 0.5607843, 0, 1, 1,
0.7428457, 0.9926475, 0.9831752, 0.5647059, 0, 1, 1,
0.7435176, -0.5596308, 2.058505, 0.572549, 0, 1, 1,
0.7437078, 1.034001, -0.2375844, 0.5764706, 0, 1, 1,
0.750363, -1.077059, 1.519479, 0.5843138, 0, 1, 1,
0.7509801, -0.8630894, 2.261259, 0.5882353, 0, 1, 1,
0.751809, 0.7811962, 1.216875, 0.5960785, 0, 1, 1,
0.7529218, -1.124635, 1.048817, 0.6039216, 0, 1, 1,
0.7537697, -0.009300859, 2.005612, 0.6078432, 0, 1, 1,
0.7572649, 0.5194255, 2.88718, 0.6156863, 0, 1, 1,
0.7676695, -0.8634467, 3.381194, 0.6196079, 0, 1, 1,
0.7679879, 0.2156544, 0.5040932, 0.627451, 0, 1, 1,
0.7683512, 0.01227494, 2.618076, 0.6313726, 0, 1, 1,
0.7695686, -0.1239404, 2.606621, 0.6392157, 0, 1, 1,
0.7762007, -0.5158443, 1.636063, 0.6431373, 0, 1, 1,
0.7791686, 0.3736835, 1.134648, 0.6509804, 0, 1, 1,
0.7810836, -0.04402336, 1.064241, 0.654902, 0, 1, 1,
0.7904697, 0.9499613, -0.288562, 0.6627451, 0, 1, 1,
0.790517, 2.138129, 0.5259533, 0.6666667, 0, 1, 1,
0.7921281, 2.076102, 0.7601551, 0.6745098, 0, 1, 1,
0.7968691, 2.202033, 0.4396415, 0.6784314, 0, 1, 1,
0.7972326, -0.6727662, 3.458863, 0.6862745, 0, 1, 1,
0.8111664, -0.8182793, 1.800603, 0.6901961, 0, 1, 1,
0.8119719, -1.410376, 3.193124, 0.6980392, 0, 1, 1,
0.8141626, -1.136612, 3.038393, 0.7058824, 0, 1, 1,
0.8203996, 0.3185701, 2.309799, 0.7098039, 0, 1, 1,
0.8289688, 1.005613, 1.223464, 0.7176471, 0, 1, 1,
0.8319323, -0.7866027, 2.075422, 0.7215686, 0, 1, 1,
0.84226, 1.671116, 0.6262689, 0.7294118, 0, 1, 1,
0.8433872, -0.2177704, 2.987412, 0.7333333, 0, 1, 1,
0.8471243, -1.086677, 2.374654, 0.7411765, 0, 1, 1,
0.8509609, -0.4451176, 2.690348, 0.7450981, 0, 1, 1,
0.8601934, 0.6926008, 0.1449372, 0.7529412, 0, 1, 1,
0.8639953, 0.4487151, -0.7541777, 0.7568628, 0, 1, 1,
0.8715584, 1.096288, -0.8516098, 0.7647059, 0, 1, 1,
0.8723039, 0.6210961, -0.2288949, 0.7686275, 0, 1, 1,
0.8723621, 1.596136, -2.090234, 0.7764706, 0, 1, 1,
0.8749658, 2.467401, 0.5323, 0.7803922, 0, 1, 1,
0.8779366, 0.05975732, 1.166185, 0.7882353, 0, 1, 1,
0.8824843, 0.4556657, 1.552184, 0.7921569, 0, 1, 1,
0.8879531, 0.03389071, 1.017285, 0.8, 0, 1, 1,
0.8894834, -0.03771654, 2.207868, 0.8078431, 0, 1, 1,
0.8896232, 0.343796, 0.3341498, 0.8117647, 0, 1, 1,
0.8905016, 1.295133, 2.502128, 0.8196079, 0, 1, 1,
0.8957364, 0.06306041, 0.3905112, 0.8235294, 0, 1, 1,
0.8967455, 0.8681864, 0.707819, 0.8313726, 0, 1, 1,
0.9053333, 0.05092236, 1.865533, 0.8352941, 0, 1, 1,
0.9098703, 0.8603368, 0.3928515, 0.8431373, 0, 1, 1,
0.9127805, -0.6138774, 3.810922, 0.8470588, 0, 1, 1,
0.9131666, 0.9216177, 1.161588, 0.854902, 0, 1, 1,
0.9152727, -0.8155421, 2.895402, 0.8588235, 0, 1, 1,
0.9176664, 0.7466525, 1.884644, 0.8666667, 0, 1, 1,
0.9176853, -0.08641768, 0.1689383, 0.8705882, 0, 1, 1,
0.9222944, 0.8739022, 0.7812211, 0.8784314, 0, 1, 1,
0.9355767, -1.092663, 3.810246, 0.8823529, 0, 1, 1,
0.9362568, 0.1903673, 2.353299, 0.8901961, 0, 1, 1,
0.9380408, 0.7020706, -0.444913, 0.8941177, 0, 1, 1,
0.9380952, 0.9465775, 1.18115, 0.9019608, 0, 1, 1,
0.9445817, -0.2665561, 2.084205, 0.9098039, 0, 1, 1,
0.9469172, 0.696901, -0.1877529, 0.9137255, 0, 1, 1,
0.9527729, 2.452066, -1.820856, 0.9215686, 0, 1, 1,
0.9558083, 0.363082, 2.325082, 0.9254902, 0, 1, 1,
0.9587096, -0.6169127, 2.19448, 0.9333333, 0, 1, 1,
0.9750896, 0.02303816, 1.536025, 0.9372549, 0, 1, 1,
0.9781809, -1.342878, 1.141768, 0.945098, 0, 1, 1,
0.9965518, -0.5723112, 0.09244111, 0.9490196, 0, 1, 1,
0.9992621, -0.6487198, 1.433485, 0.9568627, 0, 1, 1,
1.001453, -1.542314, 1.885123, 0.9607843, 0, 1, 1,
1.003677, 0.06329397, 3.038541, 0.9686275, 0, 1, 1,
1.006461, 0.6711724, 4.636737, 0.972549, 0, 1, 1,
1.006743, -2.624779, 2.341228, 0.9803922, 0, 1, 1,
1.010522, -0.8408339, 2.017428, 0.9843137, 0, 1, 1,
1.011824, -0.2189355, 2.078149, 0.9921569, 0, 1, 1,
1.012427, 1.848361, -0.4380915, 0.9960784, 0, 1, 1,
1.014429, 1.631039, 0.07991554, 1, 0, 0.9960784, 1,
1.016053, 1.314509, 1.994916, 1, 0, 0.9882353, 1,
1.017677, -1.277085, 1.532436, 1, 0, 0.9843137, 1,
1.024606, -0.2873414, 2.940564, 1, 0, 0.9764706, 1,
1.025201, 0.8787577, 1.633355, 1, 0, 0.972549, 1,
1.026186, -1.802214, 0.9661494, 1, 0, 0.9647059, 1,
1.030869, -0.4340261, 3.201667, 1, 0, 0.9607843, 1,
1.031327, -1.11401, 2.380306, 1, 0, 0.9529412, 1,
1.040007, -0.3188311, 2.701155, 1, 0, 0.9490196, 1,
1.053893, -0.4374889, 1.337461, 1, 0, 0.9411765, 1,
1.056045, -0.07162588, 1.639096, 1, 0, 0.9372549, 1,
1.059634, 0.2226473, 0.3845544, 1, 0, 0.9294118, 1,
1.061207, 0.7708675, -0.3108592, 1, 0, 0.9254902, 1,
1.064016, -2.274057, 1.68352, 1, 0, 0.9176471, 1,
1.065869, 1.036376, -1.117929, 1, 0, 0.9137255, 1,
1.066265, -0.4483675, 1.493922, 1, 0, 0.9058824, 1,
1.067439, 2.191281, 0.2034618, 1, 0, 0.9019608, 1,
1.077915, 0.8531117, 1.721656, 1, 0, 0.8941177, 1,
1.081978, 0.06812698, 0.6782434, 1, 0, 0.8862745, 1,
1.093402, -0.4867386, 0.9680884, 1, 0, 0.8823529, 1,
1.095225, 0.2296635, -0.02879091, 1, 0, 0.8745098, 1,
1.099902, 0.410352, 2.090942, 1, 0, 0.8705882, 1,
1.100803, -0.3777184, 3.090178, 1, 0, 0.8627451, 1,
1.104472, 0.3514241, 1.364519, 1, 0, 0.8588235, 1,
1.107812, -0.5245144, 3.952843, 1, 0, 0.8509804, 1,
1.118524, 0.4812355, 0.3803066, 1, 0, 0.8470588, 1,
1.120821, 0.03595787, -0.09204946, 1, 0, 0.8392157, 1,
1.122274, 0.9957514, 1.180834, 1, 0, 0.8352941, 1,
1.132684, 1.777847, 0.2649736, 1, 0, 0.827451, 1,
1.138406, -0.5993741, 2.819844, 1, 0, 0.8235294, 1,
1.144582, 1.615394, 0.5957225, 1, 0, 0.8156863, 1,
1.151077, -0.4959477, 1.811485, 1, 0, 0.8117647, 1,
1.151916, 0.1679753, 1.279673, 1, 0, 0.8039216, 1,
1.169284, -0.6569909, 1.004411, 1, 0, 0.7960784, 1,
1.176334, 0.2903269, 1.30485, 1, 0, 0.7921569, 1,
1.180058, 0.4946744, 1.029119, 1, 0, 0.7843137, 1,
1.195006, 0.2170857, 2.90373, 1, 0, 0.7803922, 1,
1.197628, 0.5784234, 0.6572117, 1, 0, 0.772549, 1,
1.212856, -1.369972, 3.82244, 1, 0, 0.7686275, 1,
1.218785, 0.3341163, 0.4478231, 1, 0, 0.7607843, 1,
1.223698, -0.4270664, -0.1783485, 1, 0, 0.7568628, 1,
1.22443, -0.9228527, 1.849902, 1, 0, 0.7490196, 1,
1.2267, -2.238725, 1.320646, 1, 0, 0.7450981, 1,
1.228685, -0.791356, 2.807785, 1, 0, 0.7372549, 1,
1.237346, 0.6626234, 3.181589, 1, 0, 0.7333333, 1,
1.239423, 0.2511397, -1.043545, 1, 0, 0.7254902, 1,
1.239631, -0.7857072, 3.256089, 1, 0, 0.7215686, 1,
1.241798, -0.1084774, 0.6712907, 1, 0, 0.7137255, 1,
1.248725, 0.2460916, 1.651326, 1, 0, 0.7098039, 1,
1.252977, 0.3959574, 0.5451593, 1, 0, 0.7019608, 1,
1.253927, -0.6896595, 1.941077, 1, 0, 0.6941177, 1,
1.257513, 0.101017, -0.01553384, 1, 0, 0.6901961, 1,
1.270634, 1.173821, -1.414999, 1, 0, 0.682353, 1,
1.271854, 1.398737, 0.8324809, 1, 0, 0.6784314, 1,
1.287808, 1.350378, 1.021122, 1, 0, 0.6705883, 1,
1.298335, -1.351716, 4.608671, 1, 0, 0.6666667, 1,
1.299338, 0.07551888, 2.188934, 1, 0, 0.6588235, 1,
1.300202, -0.4924116, 2.51388, 1, 0, 0.654902, 1,
1.309577, -1.506535, 1.278512, 1, 0, 0.6470588, 1,
1.312971, 0.2920863, 1.276788, 1, 0, 0.6431373, 1,
1.314004, 1.207784, 0.9210362, 1, 0, 0.6352941, 1,
1.315202, 0.1624708, 3.256356, 1, 0, 0.6313726, 1,
1.318956, -0.5206626, 3.758721, 1, 0, 0.6235294, 1,
1.320372, -0.4270407, 3.409535, 1, 0, 0.6196079, 1,
1.322693, -1.06213, 2.462523, 1, 0, 0.6117647, 1,
1.324979, 0.06308435, 2.039242, 1, 0, 0.6078432, 1,
1.32936, 0.1004726, 0.4729551, 1, 0, 0.6, 1,
1.331398, 0.681502, -1.271914, 1, 0, 0.5921569, 1,
1.33934, -0.5344006, 1.756348, 1, 0, 0.5882353, 1,
1.348096, -0.455961, 1.782338, 1, 0, 0.5803922, 1,
1.360102, -1.61173, 0.6008117, 1, 0, 0.5764706, 1,
1.370896, -0.7279291, 4.312025, 1, 0, 0.5686275, 1,
1.376006, 0.1941008, 2.528006, 1, 0, 0.5647059, 1,
1.401872, 0.8635247, 1.525003, 1, 0, 0.5568628, 1,
1.414602, -0.8031327, 1.353157, 1, 0, 0.5529412, 1,
1.423918, 0.2715699, 0.4404671, 1, 0, 0.5450981, 1,
1.424626, 1.77743, 1.483258, 1, 0, 0.5411765, 1,
1.432307, -0.3246496, 2.780594, 1, 0, 0.5333334, 1,
1.43501, 0.5847087, -0.453584, 1, 0, 0.5294118, 1,
1.43804, -0.2018655, 0.2084503, 1, 0, 0.5215687, 1,
1.439739, -1.418521, 3.076965, 1, 0, 0.5176471, 1,
1.446342, -0.843067, 1.43271, 1, 0, 0.509804, 1,
1.473969, 0.9036512, -0.6702278, 1, 0, 0.5058824, 1,
1.478878, 1.389371, 0.1147342, 1, 0, 0.4980392, 1,
1.47974, -0.2834347, 1.353943, 1, 0, 0.4901961, 1,
1.490744, 0.6281821, 2.238424, 1, 0, 0.4862745, 1,
1.497032, 1.703035, 1.071928, 1, 0, 0.4784314, 1,
1.498455, 0.2685833, 1.22048, 1, 0, 0.4745098, 1,
1.504118, 0.3028782, 0.6572511, 1, 0, 0.4666667, 1,
1.504581, -1.236062, 2.360797, 1, 0, 0.4627451, 1,
1.507562, -0.1911733, 2.356013, 1, 0, 0.454902, 1,
1.51157, -1.218653, 1.134516, 1, 0, 0.4509804, 1,
1.511853, 1.033034, 0.5248564, 1, 0, 0.4431373, 1,
1.512698, -2.927876, 2.156767, 1, 0, 0.4392157, 1,
1.516768, -1.781675, 1.818125, 1, 0, 0.4313726, 1,
1.518793, -0.4746342, 3.612615, 1, 0, 0.427451, 1,
1.522424, -0.2906573, 2.722144, 1, 0, 0.4196078, 1,
1.530408, -0.3020384, 1.787693, 1, 0, 0.4156863, 1,
1.5345, 2.763958, 0.3679511, 1, 0, 0.4078431, 1,
1.537453, -1.035137, 2.165364, 1, 0, 0.4039216, 1,
1.552761, 0.5066127, 2.15072, 1, 0, 0.3960784, 1,
1.553744, -1.161832, 2.468259, 1, 0, 0.3882353, 1,
1.556417, 0.5055946, -0.6458873, 1, 0, 0.3843137, 1,
1.56073, 1.73464, 0.7953341, 1, 0, 0.3764706, 1,
1.573003, -2.467403, 1.843987, 1, 0, 0.372549, 1,
1.58216, 0.7739099, 1.063619, 1, 0, 0.3647059, 1,
1.583245, -1.126204, 1.806345, 1, 0, 0.3607843, 1,
1.591095, -0.4346238, 0.8190142, 1, 0, 0.3529412, 1,
1.609558, -2.049091, 4.153611, 1, 0, 0.3490196, 1,
1.622407, -0.09594622, 2.699727, 1, 0, 0.3411765, 1,
1.622711, 0.8853324, 1.742228, 1, 0, 0.3372549, 1,
1.623148, 0.08073165, -0.1617741, 1, 0, 0.3294118, 1,
1.634345, 0.3230359, 1.653931, 1, 0, 0.3254902, 1,
1.6461, -0.3962494, 3.237924, 1, 0, 0.3176471, 1,
1.648471, -0.7806538, 2.297998, 1, 0, 0.3137255, 1,
1.657004, 0.3091723, 1.400916, 1, 0, 0.3058824, 1,
1.668995, -1.002368, 0.2323968, 1, 0, 0.2980392, 1,
1.680528, -0.4818423, 2.550366, 1, 0, 0.2941177, 1,
1.741172, -0.899394, 1.317018, 1, 0, 0.2862745, 1,
1.743049, -0.1202935, 1.61988, 1, 0, 0.282353, 1,
1.748936, -0.7237763, 3.002023, 1, 0, 0.2745098, 1,
1.780249, 1.030733, 1.075784, 1, 0, 0.2705882, 1,
1.797474, 0.7393258, 2.677122, 1, 0, 0.2627451, 1,
1.801801, 0.4145861, -0.2281577, 1, 0, 0.2588235, 1,
1.805617, 0.1186261, 0.5509002, 1, 0, 0.2509804, 1,
1.845442, 0.2507386, 2.181706, 1, 0, 0.2470588, 1,
1.849688, 0.4394969, 2.600271, 1, 0, 0.2392157, 1,
1.86255, -0.2933288, 0.9294801, 1, 0, 0.2352941, 1,
1.89595, -1.721122, 2.845389, 1, 0, 0.227451, 1,
1.930058, -0.006410753, 2.178052, 1, 0, 0.2235294, 1,
1.930832, 0.2250066, 1.818952, 1, 0, 0.2156863, 1,
1.933623, 0.9085161, 0.08073311, 1, 0, 0.2117647, 1,
1.959073, -0.1950079, 0.4763777, 1, 0, 0.2039216, 1,
1.9646, -0.3518682, 1.686267, 1, 0, 0.1960784, 1,
1.981861, -0.3488206, 0.987116, 1, 0, 0.1921569, 1,
1.981887, -1.851957, -0.8820475, 1, 0, 0.1843137, 1,
1.998502, -0.4633359, 1.693312, 1, 0, 0.1803922, 1,
2.017216, -0.6190527, 0.8434147, 1, 0, 0.172549, 1,
2.043292, -1.16916, 1.669623, 1, 0, 0.1686275, 1,
2.043441, 0.6652011, 3.582207, 1, 0, 0.1607843, 1,
2.046362, 0.2016698, 2.253507, 1, 0, 0.1568628, 1,
2.058942, -0.08258021, 1.608041, 1, 0, 0.1490196, 1,
2.077653, 0.5608003, 0.8066728, 1, 0, 0.145098, 1,
2.094265, 0.729874, 1.833374, 1, 0, 0.1372549, 1,
2.146317, 1.813701, 1.153042, 1, 0, 0.1333333, 1,
2.148299, 1.040382, 1.243537, 1, 0, 0.1254902, 1,
2.16704, 0.07491465, 1.921743, 1, 0, 0.1215686, 1,
2.178172, 0.5998452, -0.1829617, 1, 0, 0.1137255, 1,
2.178366, -0.7815844, 1.610847, 1, 0, 0.1098039, 1,
2.180742, 0.1436704, 2.274523, 1, 0, 0.1019608, 1,
2.201008, -0.4117612, 1.273779, 1, 0, 0.09411765, 1,
2.204451, -0.6538897, 2.631356, 1, 0, 0.09019608, 1,
2.238951, 0.5127043, 2.323046, 1, 0, 0.08235294, 1,
2.332526, 0.2294969, 2.372611, 1, 0, 0.07843138, 1,
2.371845, -0.5885699, 1.544599, 1, 0, 0.07058824, 1,
2.388218, 0.4732768, 2.088538, 1, 0, 0.06666667, 1,
2.410262, 0.9125049, 0.07205539, 1, 0, 0.05882353, 1,
2.422452, -1.16065, 2.617307, 1, 0, 0.05490196, 1,
2.438018, 0.1267661, 2.290159, 1, 0, 0.04705882, 1,
2.481293, 0.7487817, 1.459243, 1, 0, 0.04313726, 1,
2.564044, -0.8095794, 2.542579, 1, 0, 0.03529412, 1,
2.660463, 0.3388948, 1.044607, 1, 0, 0.03137255, 1,
2.693716, 3.505056, 2.966123, 1, 0, 0.02352941, 1,
2.803364, 0.3106111, 3.041073, 1, 0, 0.01960784, 1,
2.924267, 0.2224167, 1.8727, 1, 0, 0.01176471, 1,
3.937811, 1.988827, 0.1541589, 1, 0, 0.007843138, 1
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
0.4014621, -4.387568, -6.658519, 0, -0.5, 0.5, 0.5,
0.4014621, -4.387568, -6.658519, 1, -0.5, 0.5, 0.5,
0.4014621, -4.387568, -6.658519, 1, 1.5, 0.5, 0.5,
0.4014621, -4.387568, -6.658519, 0, 1.5, 0.5, 0.5
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
-4.33371, 0.1306977, -6.658519, 0, -0.5, 0.5, 0.5,
-4.33371, 0.1306977, -6.658519, 1, -0.5, 0.5, 0.5,
-4.33371, 0.1306977, -6.658519, 1, 1.5, 0.5, 0.5,
-4.33371, 0.1306977, -6.658519, 0, 1.5, 0.5, 0.5
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
-4.33371, -4.387568, 0.07370496, 0, -0.5, 0.5, 0.5,
-4.33371, -4.387568, 0.07370496, 1, -0.5, 0.5, 0.5,
-4.33371, -4.387568, 0.07370496, 1, 1.5, 0.5, 0.5,
-4.33371, -4.387568, 0.07370496, 0, 1.5, 0.5, 0.5
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
-2, -3.344891, -5.104929,
2, -3.344891, -5.104929,
-2, -3.344891, -5.104929,
-2, -3.518671, -5.363861,
0, -3.344891, -5.104929,
0, -3.518671, -5.363861,
2, -3.344891, -5.104929,
2, -3.518671, -5.363861
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
-2, -3.86623, -5.881724, 0, -0.5, 0.5, 0.5,
-2, -3.86623, -5.881724, 1, -0.5, 0.5, 0.5,
-2, -3.86623, -5.881724, 1, 1.5, 0.5, 0.5,
-2, -3.86623, -5.881724, 0, 1.5, 0.5, 0.5,
0, -3.86623, -5.881724, 0, -0.5, 0.5, 0.5,
0, -3.86623, -5.881724, 1, -0.5, 0.5, 0.5,
0, -3.86623, -5.881724, 1, 1.5, 0.5, 0.5,
0, -3.86623, -5.881724, 0, 1.5, 0.5, 0.5,
2, -3.86623, -5.881724, 0, -0.5, 0.5, 0.5,
2, -3.86623, -5.881724, 1, -0.5, 0.5, 0.5,
2, -3.86623, -5.881724, 1, 1.5, 0.5, 0.5,
2, -3.86623, -5.881724, 0, 1.5, 0.5, 0.5
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
-3.240978, -3, -5.104929,
-3.240978, 3, -5.104929,
-3.240978, -3, -5.104929,
-3.4231, -3, -5.363861,
-3.240978, -2, -5.104929,
-3.4231, -2, -5.363861,
-3.240978, -1, -5.104929,
-3.4231, -1, -5.363861,
-3.240978, 0, -5.104929,
-3.4231, 0, -5.363861,
-3.240978, 1, -5.104929,
-3.4231, 1, -5.363861,
-3.240978, 2, -5.104929,
-3.4231, 2, -5.363861,
-3.240978, 3, -5.104929,
-3.4231, 3, -5.363861
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
-3.787344, -3, -5.881724, 0, -0.5, 0.5, 0.5,
-3.787344, -3, -5.881724, 1, -0.5, 0.5, 0.5,
-3.787344, -3, -5.881724, 1, 1.5, 0.5, 0.5,
-3.787344, -3, -5.881724, 0, 1.5, 0.5, 0.5,
-3.787344, -2, -5.881724, 0, -0.5, 0.5, 0.5,
-3.787344, -2, -5.881724, 1, -0.5, 0.5, 0.5,
-3.787344, -2, -5.881724, 1, 1.5, 0.5, 0.5,
-3.787344, -2, -5.881724, 0, 1.5, 0.5, 0.5,
-3.787344, -1, -5.881724, 0, -0.5, 0.5, 0.5,
-3.787344, -1, -5.881724, 1, -0.5, 0.5, 0.5,
-3.787344, -1, -5.881724, 1, 1.5, 0.5, 0.5,
-3.787344, -1, -5.881724, 0, 1.5, 0.5, 0.5,
-3.787344, 0, -5.881724, 0, -0.5, 0.5, 0.5,
-3.787344, 0, -5.881724, 1, -0.5, 0.5, 0.5,
-3.787344, 0, -5.881724, 1, 1.5, 0.5, 0.5,
-3.787344, 0, -5.881724, 0, 1.5, 0.5, 0.5,
-3.787344, 1, -5.881724, 0, -0.5, 0.5, 0.5,
-3.787344, 1, -5.881724, 1, -0.5, 0.5, 0.5,
-3.787344, 1, -5.881724, 1, 1.5, 0.5, 0.5,
-3.787344, 1, -5.881724, 0, 1.5, 0.5, 0.5,
-3.787344, 2, -5.881724, 0, -0.5, 0.5, 0.5,
-3.787344, 2, -5.881724, 1, -0.5, 0.5, 0.5,
-3.787344, 2, -5.881724, 1, 1.5, 0.5, 0.5,
-3.787344, 2, -5.881724, 0, 1.5, 0.5, 0.5,
-3.787344, 3, -5.881724, 0, -0.5, 0.5, 0.5,
-3.787344, 3, -5.881724, 1, -0.5, 0.5, 0.5,
-3.787344, 3, -5.881724, 1, 1.5, 0.5, 0.5,
-3.787344, 3, -5.881724, 0, 1.5, 0.5, 0.5
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
-3.240978, -3.344891, -4,
-3.240978, -3.344891, 4,
-3.240978, -3.344891, -4,
-3.4231, -3.518671, -4,
-3.240978, -3.344891, -2,
-3.4231, -3.518671, -2,
-3.240978, -3.344891, 0,
-3.4231, -3.518671, 0,
-3.240978, -3.344891, 2,
-3.4231, -3.518671, 2,
-3.240978, -3.344891, 4,
-3.4231, -3.518671, 4
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
-3.787344, -3.86623, -4, 0, -0.5, 0.5, 0.5,
-3.787344, -3.86623, -4, 1, -0.5, 0.5, 0.5,
-3.787344, -3.86623, -4, 1, 1.5, 0.5, 0.5,
-3.787344, -3.86623, -4, 0, 1.5, 0.5, 0.5,
-3.787344, -3.86623, -2, 0, -0.5, 0.5, 0.5,
-3.787344, -3.86623, -2, 1, -0.5, 0.5, 0.5,
-3.787344, -3.86623, -2, 1, 1.5, 0.5, 0.5,
-3.787344, -3.86623, -2, 0, 1.5, 0.5, 0.5,
-3.787344, -3.86623, 0, 0, -0.5, 0.5, 0.5,
-3.787344, -3.86623, 0, 1, -0.5, 0.5, 0.5,
-3.787344, -3.86623, 0, 1, 1.5, 0.5, 0.5,
-3.787344, -3.86623, 0, 0, 1.5, 0.5, 0.5,
-3.787344, -3.86623, 2, 0, -0.5, 0.5, 0.5,
-3.787344, -3.86623, 2, 1, -0.5, 0.5, 0.5,
-3.787344, -3.86623, 2, 1, 1.5, 0.5, 0.5,
-3.787344, -3.86623, 2, 0, 1.5, 0.5, 0.5,
-3.787344, -3.86623, 4, 0, -0.5, 0.5, 0.5,
-3.787344, -3.86623, 4, 1, -0.5, 0.5, 0.5,
-3.787344, -3.86623, 4, 1, 1.5, 0.5, 0.5,
-3.787344, -3.86623, 4, 0, 1.5, 0.5, 0.5
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
-3.240978, -3.344891, -5.104929,
-3.240978, 3.606287, -5.104929,
-3.240978, -3.344891, 5.252339,
-3.240978, 3.606287, 5.252339,
-3.240978, -3.344891, -5.104929,
-3.240978, -3.344891, 5.252339,
-3.240978, 3.606287, -5.104929,
-3.240978, 3.606287, 5.252339,
-3.240978, -3.344891, -5.104929,
4.043902, -3.344891, -5.104929,
-3.240978, -3.344891, 5.252339,
4.043902, -3.344891, 5.252339,
-3.240978, 3.606287, -5.104929,
4.043902, 3.606287, -5.104929,
-3.240978, 3.606287, 5.252339,
4.043902, 3.606287, 5.252339,
4.043902, -3.344891, -5.104929,
4.043902, 3.606287, -5.104929,
4.043902, -3.344891, 5.252339,
4.043902, 3.606287, 5.252339,
4.043902, -3.344891, -5.104929,
4.043902, -3.344891, 5.252339,
4.043902, 3.606287, -5.104929,
4.043902, 3.606287, 5.252339
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
var radius = 7.713411;
var distance = 34.31784;
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
mvMatrix.translate( -0.4014621, -0.1306977, -0.07370496 );
mvMatrix.scale( 1.144822, 1.199781, 0.8052211 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.31784);
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
diazenesulfonate<-read.table("diazenesulfonate.xyz")
```

```
## Error in read.table("diazenesulfonate.xyz"): no lines available in input
```

```r
x<-diazenesulfonate$V2
```

```
## Error in eval(expr, envir, enclos): object 'diazenesulfonate' not found
```

```r
y<-diazenesulfonate$V3
```

```
## Error in eval(expr, envir, enclos): object 'diazenesulfonate' not found
```

```r
z<-diazenesulfonate$V4
```

```
## Error in eval(expr, envir, enclos): object 'diazenesulfonate' not found
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
-3.134887, -1.672547, -1.1827, 0, 0, 1, 1, 1,
-2.657351, -1.768386, -1.483503, 1, 0, 0, 1, 1,
-2.513051, 0.1706716, -3.226135, 1, 0, 0, 1, 1,
-2.496456, 0.4217214, -1.698415, 1, 0, 0, 1, 1,
-2.491449, -0.03689712, 0.2618479, 1, 0, 0, 1, 1,
-2.473725, 1.447177, -0.5206912, 1, 0, 0, 1, 1,
-2.463671, 1.512359, -0.3290097, 0, 0, 0, 1, 1,
-2.458651, 0.8579271, -1.125044, 0, 0, 0, 1, 1,
-2.408355, 0.498984, -0.05691458, 0, 0, 0, 1, 1,
-2.363548, -0.1897245, -2.101888, 0, 0, 0, 1, 1,
-2.363198, 0.2344525, -2.628281, 0, 0, 0, 1, 1,
-2.180715, -2.098627, -1.078523, 0, 0, 0, 1, 1,
-2.148094, -1.642519, -1.701728, 0, 0, 0, 1, 1,
-2.128787, -0.6515673, -2.010248, 1, 1, 1, 1, 1,
-2.111252, -1.321917, -1.699642, 1, 1, 1, 1, 1,
-1.988802, 0.3287658, -1.469356, 1, 1, 1, 1, 1,
-1.95468, -0.2908898, -1.808172, 1, 1, 1, 1, 1,
-1.953505, 1.378531, -1.494414, 1, 1, 1, 1, 1,
-1.950884, 1.426, -1.28057, 1, 1, 1, 1, 1,
-1.930682, 1.07644, -0.810313, 1, 1, 1, 1, 1,
-1.928615, -0.05220706, -0.5892816, 1, 1, 1, 1, 1,
-1.927517, -0.9031294, -3.172474, 1, 1, 1, 1, 1,
-1.927458, -0.9542105, -3.117256, 1, 1, 1, 1, 1,
-1.916277, 0.8790566, 0.7319425, 1, 1, 1, 1, 1,
-1.910355, -0.5214214, -1.971594, 1, 1, 1, 1, 1,
-1.856285, 0.1116756, 0.04286879, 1, 1, 1, 1, 1,
-1.847829, -0.9294218, -2.562125, 1, 1, 1, 1, 1,
-1.840449, -1.214019, -2.517742, 1, 1, 1, 1, 1,
-1.823642, -0.9048474, -1.378581, 0, 0, 1, 1, 1,
-1.806305, -1.114787, -2.226567, 1, 0, 0, 1, 1,
-1.795665, 1.180097, 0.3195595, 1, 0, 0, 1, 1,
-1.794576, 0.730284, -0.1864723, 1, 0, 0, 1, 1,
-1.791826, -1.365232, -1.317719, 1, 0, 0, 1, 1,
-1.785867, 0.3408593, -1.862675, 1, 0, 0, 1, 1,
-1.773719, 0.7886871, -0.7484707, 0, 0, 0, 1, 1,
-1.760519, 0.9189488, -1.169542, 0, 0, 0, 1, 1,
-1.74438, 1.162721, 0.1126364, 0, 0, 0, 1, 1,
-1.725047, -1.776911, -1.594191, 0, 0, 0, 1, 1,
-1.721142, 0.3818558, -1.026786, 0, 0, 0, 1, 1,
-1.706606, 0.3208951, -1.158135, 0, 0, 0, 1, 1,
-1.695327, -0.7044026, -2.067836, 0, 0, 0, 1, 1,
-1.69322, -0.3319218, -2.240732, 1, 1, 1, 1, 1,
-1.689611, -0.7868063, -2.770911, 1, 1, 1, 1, 1,
-1.682517, -1.039268, -1.416093, 1, 1, 1, 1, 1,
-1.681499, 1.295903, -0.9612933, 1, 1, 1, 1, 1,
-1.669562, 1.015052, 0.08922703, 1, 1, 1, 1, 1,
-1.659617, -0.1185321, -1.680293, 1, 1, 1, 1, 1,
-1.646766, 0.6542425, 0.5577042, 1, 1, 1, 1, 1,
-1.643626, 1.781413, 0.4159519, 1, 1, 1, 1, 1,
-1.642683, 0.275047, -3.541987, 1, 1, 1, 1, 1,
-1.64171, 2.194753, 0.213944, 1, 1, 1, 1, 1,
-1.639636, 1.067932, -0.9618677, 1, 1, 1, 1, 1,
-1.608674, 0.4328749, -0.6980088, 1, 1, 1, 1, 1,
-1.595666, -0.1515118, -1.521264, 1, 1, 1, 1, 1,
-1.595246, -0.9256262, -1.33462, 1, 1, 1, 1, 1,
-1.590697, -0.8874975, -4.594883, 1, 1, 1, 1, 1,
-1.581114, -0.1563725, -2.167715, 0, 0, 1, 1, 1,
-1.564493, 2.699212, -0.2693156, 1, 0, 0, 1, 1,
-1.555913, -0.8326194, -1.820208, 1, 0, 0, 1, 1,
-1.535231, -2.175593, -3.730651, 1, 0, 0, 1, 1,
-1.519468, -0.1367428, -1.321397, 1, 0, 0, 1, 1,
-1.508929, -0.4962148, -1.46359, 1, 0, 0, 1, 1,
-1.505823, 1.350553, -0.04010903, 0, 0, 0, 1, 1,
-1.505444, -0.2173438, -1.816965, 0, 0, 0, 1, 1,
-1.485406, 0.4704041, -1.346441, 0, 0, 0, 1, 1,
-1.484492, 2.331597, -2.299385, 0, 0, 0, 1, 1,
-1.475221, 1.226634, -0.7530513, 0, 0, 0, 1, 1,
-1.473022, 0.7893599, -0.225193, 0, 0, 0, 1, 1,
-1.468523, -0.3287331, -0.6791008, 0, 0, 0, 1, 1,
-1.459345, -0.9104819, -4.241146, 1, 1, 1, 1, 1,
-1.451597, -0.9336993, -0.08791339, 1, 1, 1, 1, 1,
-1.449912, 1.25426, -0.5633212, 1, 1, 1, 1, 1,
-1.438609, 0.9449501, -1.051899, 1, 1, 1, 1, 1,
-1.436092, -0.442938, -3.181782, 1, 1, 1, 1, 1,
-1.430239, -0.08745834, -2.551316, 1, 1, 1, 1, 1,
-1.423785, -0.01374327, -2.54341, 1, 1, 1, 1, 1,
-1.421533, 0.2068518, -2.432036, 1, 1, 1, 1, 1,
-1.40933, 0.9863086, -1.410522, 1, 1, 1, 1, 1,
-1.388189, 0.4539671, -1.526255, 1, 1, 1, 1, 1,
-1.38724, 0.4035606, -3.681727, 1, 1, 1, 1, 1,
-1.382249, 2.090195, -1.155222, 1, 1, 1, 1, 1,
-1.38178, -0.6644234, -1.807398, 1, 1, 1, 1, 1,
-1.365915, 1.0395, -0.4497366, 1, 1, 1, 1, 1,
-1.349686, -1.346378, -3.619541, 1, 1, 1, 1, 1,
-1.341038, -0.5772838, -1.423116, 0, 0, 1, 1, 1,
-1.34062, 0.5760854, -1.747842, 1, 0, 0, 1, 1,
-1.334662, 0.9249814, -1.567837, 1, 0, 0, 1, 1,
-1.324216, 0.1153897, 0.5925062, 1, 0, 0, 1, 1,
-1.323306, 1.436703, -0.5663083, 1, 0, 0, 1, 1,
-1.320324, -0.2747143, -2.169036, 1, 0, 0, 1, 1,
-1.319334, -0.5292261, -0.7839072, 0, 0, 0, 1, 1,
-1.314088, -0.6666318, -1.04976, 0, 0, 0, 1, 1,
-1.297626, -0.08439304, -2.588439, 0, 0, 0, 1, 1,
-1.295193, -1.147778, -3.459268, 0, 0, 0, 1, 1,
-1.280314, -0.1153708, -2.250985, 0, 0, 0, 1, 1,
-1.270629, 0.6324093, -2.077445, 0, 0, 0, 1, 1,
-1.270384, -0.2509043, -1.98884, 0, 0, 0, 1, 1,
-1.264441, -0.2271418, -0.9054469, 1, 1, 1, 1, 1,
-1.262742, -0.1111877, -1.414236, 1, 1, 1, 1, 1,
-1.261917, 0.8769246, -1.396269, 1, 1, 1, 1, 1,
-1.261629, 0.2394156, 0.8705626, 1, 1, 1, 1, 1,
-1.248522, 1.599212, -3.112664, 1, 1, 1, 1, 1,
-1.245643, -0.3995231, -2.143357, 1, 1, 1, 1, 1,
-1.242383, 0.89476, -1.534732, 1, 1, 1, 1, 1,
-1.241725, -0.6616033, -1.422571, 1, 1, 1, 1, 1,
-1.233862, 1.832621, 0.9212433, 1, 1, 1, 1, 1,
-1.233792, 0.3776117, -1.841662, 1, 1, 1, 1, 1,
-1.209715, -1.191287, -1.338045, 1, 1, 1, 1, 1,
-1.193383, -0.469123, -2.431446, 1, 1, 1, 1, 1,
-1.185579, 0.06562045, -3.952039, 1, 1, 1, 1, 1,
-1.171262, 1.1934, -0.3190116, 1, 1, 1, 1, 1,
-1.170803, 0.9010095, 0.3890817, 1, 1, 1, 1, 1,
-1.160936, 2.192199, -1.402001, 0, 0, 1, 1, 1,
-1.154012, 0.004857939, -1.515155, 1, 0, 0, 1, 1,
-1.151788, 0.9962325, -1.30319, 1, 0, 0, 1, 1,
-1.143867, 1.424878, 0.3198195, 1, 0, 0, 1, 1,
-1.141185, 0.1746744, 0.3014649, 1, 0, 0, 1, 1,
-1.138468, -0.39891, -1.394621, 1, 0, 0, 1, 1,
-1.137306, -0.3100306, -2.034625, 0, 0, 0, 1, 1,
-1.136127, -1.095363, -1.537289, 0, 0, 0, 1, 1,
-1.132399, 0.697832, -1.733437, 0, 0, 0, 1, 1,
-1.130389, -0.005762987, -3.25896, 0, 0, 0, 1, 1,
-1.116185, -0.6195542, -1.468037, 0, 0, 0, 1, 1,
-1.111659, -0.4395972, -2.709405, 0, 0, 0, 1, 1,
-1.111292, -0.658163, -2.74095, 0, 0, 0, 1, 1,
-1.107859, -0.9418592, -3.046917, 1, 1, 1, 1, 1,
-1.10698, -0.3447771, 0.9274678, 1, 1, 1, 1, 1,
-1.104518, -0.3133986, -2.380816, 1, 1, 1, 1, 1,
-1.103077, 0.1936758, -1.615712, 1, 1, 1, 1, 1,
-1.098349, -0.09442929, -3.39169, 1, 1, 1, 1, 1,
-1.098144, -0.02429562, -1.886795, 1, 1, 1, 1, 1,
-1.096511, -0.2120225, -1.598041, 1, 1, 1, 1, 1,
-1.09017, 0.9690199, -0.7747224, 1, 1, 1, 1, 1,
-1.089566, -0.1466236, -1.042609, 1, 1, 1, 1, 1,
-1.086844, 0.2858726, -1.636825, 1, 1, 1, 1, 1,
-1.080003, 0.3871918, -1.685239, 1, 1, 1, 1, 1,
-1.078589, 0.5583276, 0.5677209, 1, 1, 1, 1, 1,
-1.066647, -1.589286, -2.293078, 1, 1, 1, 1, 1,
-1.064938, 0.7252427, -1.004257, 1, 1, 1, 1, 1,
-1.05994, 0.198407, -2.387598, 1, 1, 1, 1, 1,
-1.0531, 0.7491006, 0.2540401, 0, 0, 1, 1, 1,
-1.051433, -0.3583915, -0.3404202, 1, 0, 0, 1, 1,
-1.040779, -0.1503464, -2.671376, 1, 0, 0, 1, 1,
-1.038337, -0.8586708, -2.031453, 1, 0, 0, 1, 1,
-1.037106, -0.7099103, -2.607841, 1, 0, 0, 1, 1,
-1.009675, -0.1312116, -2.788527, 1, 0, 0, 1, 1,
-1.009265, 0.2383167, -2.73509, 0, 0, 0, 1, 1,
-1.002813, 0.5203919, 0.2000503, 0, 0, 0, 1, 1,
-1.001715, 0.7385038, 1.436164, 0, 0, 0, 1, 1,
-0.99532, -1.621469, -1.42317, 0, 0, 0, 1, 1,
-0.9947732, -0.3243858, -1.417122, 0, 0, 0, 1, 1,
-0.9932217, 0.6173011, -1.586308, 0, 0, 0, 1, 1,
-0.9902187, 1.578254, 0.2601316, 0, 0, 0, 1, 1,
-0.9882188, 0.6927367, -0.2936962, 1, 1, 1, 1, 1,
-0.9809927, -1.335168, -2.178803, 1, 1, 1, 1, 1,
-0.9784474, 1.625807, -1.577249, 1, 1, 1, 1, 1,
-0.9783572, 0.006901579, 0.4739143, 1, 1, 1, 1, 1,
-0.9693198, 0.9129413, -1.071508, 1, 1, 1, 1, 1,
-0.9610061, 0.4278147, 0.7876304, 1, 1, 1, 1, 1,
-0.955802, -0.6460915, -1.957188, 1, 1, 1, 1, 1,
-0.9520005, 0.4661968, -3.4057, 1, 1, 1, 1, 1,
-0.9505827, -1.433976, -3.83304, 1, 1, 1, 1, 1,
-0.9494869, 0.6679117, -0.6413609, 1, 1, 1, 1, 1,
-0.9427065, 0.1548094, -0.8663965, 1, 1, 1, 1, 1,
-0.9412193, 0.7624242, -2.834237, 1, 1, 1, 1, 1,
-0.9400525, -0.3560395, -3.068319, 1, 1, 1, 1, 1,
-0.9353778, -0.3172892, -2.330065, 1, 1, 1, 1, 1,
-0.9321595, -0.7861803, -1.456342, 1, 1, 1, 1, 1,
-0.9278941, -1.148088, -0.3029321, 0, 0, 1, 1, 1,
-0.9243045, 1.138779, -0.7972019, 1, 0, 0, 1, 1,
-0.9233141, 0.4346364, -1.591105, 1, 0, 0, 1, 1,
-0.9229239, -0.8690137, -2.512371, 1, 0, 0, 1, 1,
-0.9187955, 1.216479, 0.2677064, 1, 0, 0, 1, 1,
-0.9169409, -0.6467335, -1.58961, 1, 0, 0, 1, 1,
-0.9015144, 0.3190694, -0.9937454, 0, 0, 0, 1, 1,
-0.9011742, 0.4198724, -0.611098, 0, 0, 0, 1, 1,
-0.8981922, 0.3678264, -2.345935, 0, 0, 0, 1, 1,
-0.8941855, 0.06234811, -3.652966, 0, 0, 0, 1, 1,
-0.8919086, 0.2373729, -0.1076191, 0, 0, 0, 1, 1,
-0.8903385, 0.2697451, -0.9211038, 0, 0, 0, 1, 1,
-0.8863183, 0.3134756, -0.5723625, 0, 0, 0, 1, 1,
-0.88114, -0.229242, -0.715489, 1, 1, 1, 1, 1,
-0.8775209, 1.367503, -0.7656802, 1, 1, 1, 1, 1,
-0.867559, 0.2264359, -1.027669, 1, 1, 1, 1, 1,
-0.8605779, 0.2402196, -2.339038, 1, 1, 1, 1, 1,
-0.8496651, 0.1798285, -0.8242658, 1, 1, 1, 1, 1,
-0.8484417, -1.287596, -1.385602, 1, 1, 1, 1, 1,
-0.8443317, -0.01185954, -0.0272606, 1, 1, 1, 1, 1,
-0.8405538, -0.2761433, -2.478307, 1, 1, 1, 1, 1,
-0.8385356, 2.106292, -0.7821044, 1, 1, 1, 1, 1,
-0.8323421, -1.377253, -2.470143, 1, 1, 1, 1, 1,
-0.831897, 0.02143165, -1.322685, 1, 1, 1, 1, 1,
-0.8278701, 1.312438, -2.158468, 1, 1, 1, 1, 1,
-0.823984, -0.6808001, -2.921302, 1, 1, 1, 1, 1,
-0.8147825, -0.6120215, -2.713519, 1, 1, 1, 1, 1,
-0.8140407, -0.07563759, -1.507384, 1, 1, 1, 1, 1,
-0.8114182, -0.02778899, -2.118597, 0, 0, 1, 1, 1,
-0.8100896, -1.096028, -0.8767992, 1, 0, 0, 1, 1,
-0.8095643, -0.3547154, -1.166622, 1, 0, 0, 1, 1,
-0.8071783, 0.8153263, 0.06023072, 1, 0, 0, 1, 1,
-0.8033004, -0.3325504, -1.711392, 1, 0, 0, 1, 1,
-0.7934088, -2.147793, -2.743063, 1, 0, 0, 1, 1,
-0.7928343, -0.09742218, -0.4704069, 0, 0, 0, 1, 1,
-0.7786576, 0.04060052, -3.311171, 0, 0, 0, 1, 1,
-0.7785975, 0.5310064, -1.980957, 0, 0, 0, 1, 1,
-0.7777071, 1.013754, 0.9661974, 0, 0, 0, 1, 1,
-0.7721633, 0.02553305, -2.281785, 0, 0, 0, 1, 1,
-0.7704703, 0.8694953, -0.45955, 0, 0, 0, 1, 1,
-0.7704085, 0.1170919, -1.255267, 0, 0, 0, 1, 1,
-0.7657862, -0.965333, -3.913649, 1, 1, 1, 1, 1,
-0.7634999, -0.2434276, -3.882389, 1, 1, 1, 1, 1,
-0.7618499, 1.058757, 0.2196003, 1, 1, 1, 1, 1,
-0.7613835, 0.7755976, -0.7587376, 1, 1, 1, 1, 1,
-0.7591247, -0.7972789, -3.023346, 1, 1, 1, 1, 1,
-0.7572857, -0.01217664, -1.608146, 1, 1, 1, 1, 1,
-0.7572522, 0.9000545, -2.688003, 1, 1, 1, 1, 1,
-0.7535775, -1.487, -2.415653, 1, 1, 1, 1, 1,
-0.7530488, 1.237885, -1.990313, 1, 1, 1, 1, 1,
-0.7522717, 0.4050511, -1.927578, 1, 1, 1, 1, 1,
-0.7483217, 1.286478, -0.7267402, 1, 1, 1, 1, 1,
-0.7468408, -0.3538087, -1.714188, 1, 1, 1, 1, 1,
-0.746621, 0.3195856, -0.5878356, 1, 1, 1, 1, 1,
-0.7435485, 0.415748, -1.171646, 1, 1, 1, 1, 1,
-0.734441, -0.2641092, -0.01490114, 1, 1, 1, 1, 1,
-0.7288923, 0.8562468, -0.8852612, 0, 0, 1, 1, 1,
-0.7288294, -1.780138, -4.05603, 1, 0, 0, 1, 1,
-0.7282909, 0.4988054, -0.7823794, 1, 0, 0, 1, 1,
-0.728223, -1.377701, -1.49962, 1, 0, 0, 1, 1,
-0.7265423, -0.07568385, -1.049905, 1, 0, 0, 1, 1,
-0.7155009, -0.7150978, -2.356587, 1, 0, 0, 1, 1,
-0.715249, 0.9893148, -0.8374093, 0, 0, 0, 1, 1,
-0.7006656, -0.146193, -1.444342, 0, 0, 0, 1, 1,
-0.6969267, 0.4100628, -1.88819, 0, 0, 0, 1, 1,
-0.6950547, 1.165495, 0.2916216, 0, 0, 0, 1, 1,
-0.6947824, 1.507957, 1.265776, 0, 0, 0, 1, 1,
-0.6928664, -0.1467801, -0.8356034, 0, 0, 0, 1, 1,
-0.6909296, -0.2260268, -1.76674, 0, 0, 0, 1, 1,
-0.6891072, -0.7618715, -2.508488, 1, 1, 1, 1, 1,
-0.6845155, 0.2137599, -1.155133, 1, 1, 1, 1, 1,
-0.675195, 0.4182831, -0.04227796, 1, 1, 1, 1, 1,
-0.6715299, -0.5249223, -2.230203, 1, 1, 1, 1, 1,
-0.6687694, -2.456092, 0.0855849, 1, 1, 1, 1, 1,
-0.6663855, 0.3610197, -1.482726, 1, 1, 1, 1, 1,
-0.664887, 2.482518, -1.217189, 1, 1, 1, 1, 1,
-0.6631264, -1.923142, -3.783696, 1, 1, 1, 1, 1,
-0.6509171, -0.1862115, -2.200745, 1, 1, 1, 1, 1,
-0.650212, 1.047573, -0.4758066, 1, 1, 1, 1, 1,
-0.6500427, 0.5316699, -2.212801, 1, 1, 1, 1, 1,
-0.6423189, -1.373508, -2.961538, 1, 1, 1, 1, 1,
-0.6369146, 1.235369, 0.09545897, 1, 1, 1, 1, 1,
-0.6354259, 1.431655, -2.46737, 1, 1, 1, 1, 1,
-0.63381, -1.10983, -3.491967, 1, 1, 1, 1, 1,
-0.6327722, 1.07581, -0.172089, 0, 0, 1, 1, 1,
-0.6306799, 0.1201995, -0.8931815, 1, 0, 0, 1, 1,
-0.6242595, 1.388576, -0.5334992, 1, 0, 0, 1, 1,
-0.6239706, 0.2646684, -1.692228, 1, 0, 0, 1, 1,
-0.6167796, 0.8343433, -0.02039968, 1, 0, 0, 1, 1,
-0.6104852, 0.609738, -0.2032403, 1, 0, 0, 1, 1,
-0.6085959, -1.072618, -2.53473, 0, 0, 0, 1, 1,
-0.6071019, -0.2338881, -0.8529446, 0, 0, 0, 1, 1,
-0.6029384, -0.647667, -1.021075, 0, 0, 0, 1, 1,
-0.6020904, 1.79857, -1.157951, 0, 0, 0, 1, 1,
-0.6007085, 0.7458048, -1.724278, 0, 0, 0, 1, 1,
-0.5997387, 0.2869737, -1.38, 0, 0, 0, 1, 1,
-0.5975304, -0.8877038, -3.003715, 0, 0, 0, 1, 1,
-0.5959508, -1.320225, -4.110039, 1, 1, 1, 1, 1,
-0.5948914, -2.567931, -2.198627, 1, 1, 1, 1, 1,
-0.5940412, -2.558003, -2.791907, 1, 1, 1, 1, 1,
-0.591373, -0.313666, -3.381674, 1, 1, 1, 1, 1,
-0.59089, 0.09304153, -0.5183062, 1, 1, 1, 1, 1,
-0.5769274, -1.083688, -4.106956, 1, 1, 1, 1, 1,
-0.5708675, 2.275864, -0.5087957, 1, 1, 1, 1, 1,
-0.5707132, 0.6328977, -0.6800129, 1, 1, 1, 1, 1,
-0.5648242, -1.08892, -1.954151, 1, 1, 1, 1, 1,
-0.559648, -0.483489, -3.806375, 1, 1, 1, 1, 1,
-0.5592953, -0.5680218, -1.601572, 1, 1, 1, 1, 1,
-0.559103, -1.476091, -1.125102, 1, 1, 1, 1, 1,
-0.5582606, -0.07594275, -0.5272561, 1, 1, 1, 1, 1,
-0.557075, -0.09986836, -3.493709, 1, 1, 1, 1, 1,
-0.5494991, 1.366434, -1.217006, 1, 1, 1, 1, 1,
-0.5421255, -0.129694, -2.137051, 0, 0, 1, 1, 1,
-0.5379067, 1.709674, 0.8213284, 1, 0, 0, 1, 1,
-0.537882, 0.3426317, -1.906816, 1, 0, 0, 1, 1,
-0.5369391, -0.04477552, -0.9104689, 1, 0, 0, 1, 1,
-0.5361894, 1.769313, 0.5857562, 1, 0, 0, 1, 1,
-0.5358644, -0.3556553, -3.782061, 1, 0, 0, 1, 1,
-0.5354257, 0.2542709, -2.331675, 0, 0, 0, 1, 1,
-0.5323038, 0.3953619, -1.671894, 0, 0, 0, 1, 1,
-0.5292428, 0.7410212, -1.454421, 0, 0, 0, 1, 1,
-0.5287132, -0.1435534, -2.620347, 0, 0, 0, 1, 1,
-0.5215524, -0.7459887, -0.8590879, 0, 0, 0, 1, 1,
-0.518624, 2.24068, 1.110075, 0, 0, 0, 1, 1,
-0.515946, 0.3216651, -1.708361, 0, 0, 0, 1, 1,
-0.5139937, -0.6201344, -2.262014, 1, 1, 1, 1, 1,
-0.513798, -2.606509, -3.84719, 1, 1, 1, 1, 1,
-0.5094628, 0.608237, -0.6956046, 1, 1, 1, 1, 1,
-0.5083343, 1.082679, 2.171783, 1, 1, 1, 1, 1,
-0.4970393, -1.252608, -2.797117, 1, 1, 1, 1, 1,
-0.4945032, -0.01698089, -2.170503, 1, 1, 1, 1, 1,
-0.4919844, -0.2750104, -2.516765, 1, 1, 1, 1, 1,
-0.4903198, 1.135041, 1.315018, 1, 1, 1, 1, 1,
-0.4859864, -0.02671665, -1.447577, 1, 1, 1, 1, 1,
-0.4812859, 1.056952, -0.5542111, 1, 1, 1, 1, 1,
-0.4770607, 0.7604718, -0.5340743, 1, 1, 1, 1, 1,
-0.4737852, -1.026361, -2.896908, 1, 1, 1, 1, 1,
-0.4729354, -0.8807296, -4.179524, 1, 1, 1, 1, 1,
-0.4721638, 0.7216066, -1.421458, 1, 1, 1, 1, 1,
-0.4716395, -0.7081193, -2.707779, 1, 1, 1, 1, 1,
-0.4646895, -0.2293409, -1.787309, 0, 0, 1, 1, 1,
-0.4617524, -0.8181331, -2.600104, 1, 0, 0, 1, 1,
-0.4606436, 2.050645, -0.6419093, 1, 0, 0, 1, 1,
-0.459166, 1.06872, 0.564059, 1, 0, 0, 1, 1,
-0.4532847, -0.7672555, -2.906431, 1, 0, 0, 1, 1,
-0.4422312, 0.7502734, 0.06317677, 1, 0, 0, 1, 1,
-0.4422218, 0.9514241, -0.2183437, 0, 0, 0, 1, 1,
-0.4387171, 0.3183548, -3.4099, 0, 0, 0, 1, 1,
-0.438411, -1.433766, -3.555757, 0, 0, 0, 1, 1,
-0.4379207, -1.813932, -2.275492, 0, 0, 0, 1, 1,
-0.4365937, -0.8119309, -2.671863, 0, 0, 0, 1, 1,
-0.4354659, 0.5004128, -1.504527, 0, 0, 0, 1, 1,
-0.4312233, 1.609529, -0.2413611, 0, 0, 0, 1, 1,
-0.431082, -0.3501051, -2.229133, 1, 1, 1, 1, 1,
-0.4307189, -0.01580149, -4.41235, 1, 1, 1, 1, 1,
-0.4283296, -1.111295, -4.608623, 1, 1, 1, 1, 1,
-0.4236282, 1.401923, 0.7971094, 1, 1, 1, 1, 1,
-0.4235079, 2.056748, -0.162688, 1, 1, 1, 1, 1,
-0.4222568, 1.445209, 1.064922, 1, 1, 1, 1, 1,
-0.4174161, -0.9063888, -2.315627, 1, 1, 1, 1, 1,
-0.4147146, -0.9767895, -2.400424, 1, 1, 1, 1, 1,
-0.3988832, 0.1860597, -1.087198, 1, 1, 1, 1, 1,
-0.3980534, 0.6016766, -0.1093944, 1, 1, 1, 1, 1,
-0.3954669, -0.7137142, -3.954909, 1, 1, 1, 1, 1,
-0.3918132, -0.3407677, -1.648899, 1, 1, 1, 1, 1,
-0.3890788, -1.324654, -3.536988, 1, 1, 1, 1, 1,
-0.3888829, -0.7934292, -2.462229, 1, 1, 1, 1, 1,
-0.3884733, 1.215852, 1.69149, 1, 1, 1, 1, 1,
-0.388287, -0.5157061, -2.830769, 0, 0, 1, 1, 1,
-0.3877083, -2.345855, -2.312163, 1, 0, 0, 1, 1,
-0.3833993, 0.8383815, -0.01532016, 1, 0, 0, 1, 1,
-0.3832901, 0.05237343, -0.3080661, 1, 0, 0, 1, 1,
-0.3819428, -1.306887, -2.483969, 1, 0, 0, 1, 1,
-0.3763428, 0.3533097, 0.001833982, 1, 0, 0, 1, 1,
-0.3757636, 0.3409483, -0.009739649, 0, 0, 0, 1, 1,
-0.3752668, -0.1217147, -0.9921018, 0, 0, 0, 1, 1,
-0.3746599, 0.5954954, -0.06362808, 0, 0, 0, 1, 1,
-0.3709367, 1.112586, 0.002534878, 0, 0, 0, 1, 1,
-0.3669563, -1.102048, -2.210197, 0, 0, 0, 1, 1,
-0.3664012, -0.3263448, -1.698346, 0, 0, 0, 1, 1,
-0.3659978, 0.7388489, -1.095353, 0, 0, 0, 1, 1,
-0.3634481, 1.340899, 1.61541, 1, 1, 1, 1, 1,
-0.3604608, 0.8541893, -0.6873662, 1, 1, 1, 1, 1,
-0.3604096, 0.4875778, 0.449191, 1, 1, 1, 1, 1,
-0.3602108, -0.4030712, -2.933033, 1, 1, 1, 1, 1,
-0.3560429, 0.04920065, -1.564676, 1, 1, 1, 1, 1,
-0.3532894, 0.8914426, -0.2826075, 1, 1, 1, 1, 1,
-0.3477797, 0.8308705, 0.9968207, 1, 1, 1, 1, 1,
-0.3468772, 0.5355108, 0.1288299, 1, 1, 1, 1, 1,
-0.3468178, -0.9085826, -3.420398, 1, 1, 1, 1, 1,
-0.345814, -0.2470109, 1.127748, 1, 1, 1, 1, 1,
-0.3426692, 0.3597487, 0.04751587, 1, 1, 1, 1, 1,
-0.3356908, -0.257563, -3.305868, 1, 1, 1, 1, 1,
-0.3331397, 0.2550482, -1.680563, 1, 1, 1, 1, 1,
-0.3255691, -0.07519726, -0.8153981, 1, 1, 1, 1, 1,
-0.3211749, 0.3187289, -1.093152, 1, 1, 1, 1, 1,
-0.3206579, 0.570866, 0.6095386, 0, 0, 1, 1, 1,
-0.3200669, -0.3580775, -3.833079, 1, 0, 0, 1, 1,
-0.3174503, 0.1384386, 0.1014009, 1, 0, 0, 1, 1,
-0.3157173, 1.61805, 0.06942698, 1, 0, 0, 1, 1,
-0.3127817, 0.9903671, 1.653017, 1, 0, 0, 1, 1,
-0.3101214, 1.213766, 0.883828, 1, 0, 0, 1, 1,
-0.308152, -1.599062, -3.425111, 0, 0, 0, 1, 1,
-0.303849, 0.1861372, 1.513865, 0, 0, 0, 1, 1,
-0.3037683, -1.783323, -4.501679, 0, 0, 0, 1, 1,
-0.2983514, 0.118105, -0.4943101, 0, 0, 0, 1, 1,
-0.2981171, -1.392589, -2.838695, 0, 0, 0, 1, 1,
-0.2952883, -0.3143486, -1.469043, 0, 0, 0, 1, 1,
-0.2938557, -0.01182142, -1.828571, 0, 0, 0, 1, 1,
-0.2909872, -0.5054737, -1.825095, 1, 1, 1, 1, 1,
-0.290419, 0.7925655, 0.1510726, 1, 1, 1, 1, 1,
-0.2884573, -0.4505348, -1.90107, 1, 1, 1, 1, 1,
-0.2858002, 0.3565974, -0.7680321, 1, 1, 1, 1, 1,
-0.2856525, 0.113306, -0.03839584, 1, 1, 1, 1, 1,
-0.2855048, 0.06229137, -1.20666, 1, 1, 1, 1, 1,
-0.2792608, -1.219732, -1.855611, 1, 1, 1, 1, 1,
-0.2773777, 0.104935, -0.6433313, 1, 1, 1, 1, 1,
-0.2739879, -0.3455088, -3.21587, 1, 1, 1, 1, 1,
-0.2733488, 1.558363, -0.2818689, 1, 1, 1, 1, 1,
-0.2699133, 1.27622, -0.7292854, 1, 1, 1, 1, 1,
-0.2689348, -1.626275, -3.616619, 1, 1, 1, 1, 1,
-0.2659012, -0.1602542, -2.14607, 1, 1, 1, 1, 1,
-0.2657208, 0.5231992, 0.1780983, 1, 1, 1, 1, 1,
-0.2653196, -3.24366, -4.265789, 1, 1, 1, 1, 1,
-0.2635241, 1.41963, -0.4168381, 0, 0, 1, 1, 1,
-0.2615747, -1.84631, -4.954095, 1, 0, 0, 1, 1,
-0.257416, 0.3948483, -1.707004, 1, 0, 0, 1, 1,
-0.2557865, -0.05326307, -0.7494639, 1, 0, 0, 1, 1,
-0.2543448, 0.6721877, 0.3360054, 1, 0, 0, 1, 1,
-0.2507152, 0.0648421, -1.266868, 1, 0, 0, 1, 1,
-0.248069, 0.7298157, -0.7259106, 0, 0, 0, 1, 1,
-0.2468352, -0.232803, -1.662065, 0, 0, 0, 1, 1,
-0.2461249, -1.341088, -4.8684, 0, 0, 0, 1, 1,
-0.2452211, -1.442698, -2.607282, 0, 0, 0, 1, 1,
-0.2398567, 0.8298291, -2.128104, 0, 0, 0, 1, 1,
-0.2342864, -2.055478, -1.304028, 0, 0, 0, 1, 1,
-0.2331807, 0.8769053, 0.4840202, 0, 0, 0, 1, 1,
-0.2329793, -0.05194418, -1.959135, 1, 1, 1, 1, 1,
-0.2320741, 0.9936743, -0.07869734, 1, 1, 1, 1, 1,
-0.2312284, 1.247376, 1.593329, 1, 1, 1, 1, 1,
-0.2273964, -0.4944603, -1.87691, 1, 1, 1, 1, 1,
-0.2260459, 0.618176, -1.777261, 1, 1, 1, 1, 1,
-0.2143594, -0.950856, -2.846479, 1, 1, 1, 1, 1,
-0.2124633, 0.2733654, -1.245803, 1, 1, 1, 1, 1,
-0.2116441, -0.05587609, -1.809523, 1, 1, 1, 1, 1,
-0.2110158, 1.132046, -0.0803363, 1, 1, 1, 1, 1,
-0.2074249, -1.355632, -3.336528, 1, 1, 1, 1, 1,
-0.2073297, 2.520344, -0.09981309, 1, 1, 1, 1, 1,
-0.2051049, -1.107027, -2.773762, 1, 1, 1, 1, 1,
-0.2045475, 1.167804, 0.9087048, 1, 1, 1, 1, 1,
-0.2020505, -1.564731, -4.184869, 1, 1, 1, 1, 1,
-0.2010077, 0.716796, -0.01780295, 1, 1, 1, 1, 1,
-0.2002437, 0.9773837, 0.142276, 0, 0, 1, 1, 1,
-0.1971894, 1.316499, -0.003126809, 1, 0, 0, 1, 1,
-0.1967964, -1.551449, -3.290784, 1, 0, 0, 1, 1,
-0.1950027, 0.05840231, -0.998251, 1, 0, 0, 1, 1,
-0.1932399, 0.4499617, -0.7785662, 1, 0, 0, 1, 1,
-0.190408, -0.8736901, -1.946606, 1, 0, 0, 1, 1,
-0.1866695, 0.8560184, 1.071732, 0, 0, 0, 1, 1,
-0.1828564, 1.18459, -1.712445, 0, 0, 0, 1, 1,
-0.1815209, 0.07480061, -0.3823242, 0, 0, 0, 1, 1,
-0.1811726, 0.4347093, -1.301224, 0, 0, 0, 1, 1,
-0.1810058, 0.7357857, 0.1296913, 0, 0, 0, 1, 1,
-0.1787062, 0.02759629, 0.6427007, 0, 0, 0, 1, 1,
-0.1753159, -0.7490401, -3.118968, 0, 0, 0, 1, 1,
-0.1731501, -0.8507144, -1.214629, 1, 1, 1, 1, 1,
-0.1719007, 2.046206, 0.5497922, 1, 1, 1, 1, 1,
-0.1670969, 0.03589501, -1.667501, 1, 1, 1, 1, 1,
-0.1586151, 0.5947728, -1.90586, 1, 1, 1, 1, 1,
-0.1580909, -0.3698013, -2.54314, 1, 1, 1, 1, 1,
-0.1499333, 0.1501167, -1.939006, 1, 1, 1, 1, 1,
-0.1497741, 0.4158915, -1.144873, 1, 1, 1, 1, 1,
-0.1475974, -0.02837789, -1.50815, 1, 1, 1, 1, 1,
-0.1456506, -0.1071507, -1.34647, 1, 1, 1, 1, 1,
-0.1385266, 0.2656215, 0.822004, 1, 1, 1, 1, 1,
-0.1360061, 0.2909962, -1.110577, 1, 1, 1, 1, 1,
-0.1354457, -0.283252, -2.934317, 1, 1, 1, 1, 1,
-0.1331583, 0.8049687, -0.9581062, 1, 1, 1, 1, 1,
-0.1316911, 1.067899, 1.493277, 1, 1, 1, 1, 1,
-0.130109, -1.497526, -3.842791, 1, 1, 1, 1, 1,
-0.1287781, 0.435678, 0.1090223, 0, 0, 1, 1, 1,
-0.1254616, 1.822467, -0.596352, 1, 0, 0, 1, 1,
-0.1166068, 0.8367262, 0.5742405, 1, 0, 0, 1, 1,
-0.1142875, 0.9416667, -0.362409, 1, 0, 0, 1, 1,
-0.1132192, -1.244804, -2.518831, 1, 0, 0, 1, 1,
-0.1114257, 0.8058097, 0.6608143, 1, 0, 0, 1, 1,
-0.1099671, 0.06724809, -2.038075, 0, 0, 0, 1, 1,
-0.1065196, 0.4939134, -0.1180972, 0, 0, 0, 1, 1,
-0.1042038, -0.9834263, -4.340179, 0, 0, 0, 1, 1,
-0.1031119, 0.9464191, -0.8246868, 0, 0, 0, 1, 1,
-0.1021846, 0.5477242, 0.07854158, 0, 0, 0, 1, 1,
-0.1008036, 1.267185, -2.119344, 0, 0, 0, 1, 1,
-0.1007787, 0.2354625, -0.6041348, 0, 0, 0, 1, 1,
-0.09802789, -0.07843045, -2.856142, 1, 1, 1, 1, 1,
-0.0954314, -0.190727, -0.8164445, 1, 1, 1, 1, 1,
-0.09226022, -0.1819559, -2.506992, 1, 1, 1, 1, 1,
-0.08704773, 0.564289, -0.2303348, 1, 1, 1, 1, 1,
-0.08550043, 0.8826976, -2.227324, 1, 1, 1, 1, 1,
-0.08066051, -0.1967516, -3.719765, 1, 1, 1, 1, 1,
-0.07980586, -0.09624249, -1.707348, 1, 1, 1, 1, 1,
-0.06892718, 0.2892312, 0.03724674, 1, 1, 1, 1, 1,
-0.06470644, 0.1625554, -0.1652317, 1, 1, 1, 1, 1,
-0.06391429, 1.697554, -0.6198109, 1, 1, 1, 1, 1,
-0.0627676, -0.5592676, -3.204662, 1, 1, 1, 1, 1,
-0.05983203, 1.037806, 0.2144457, 1, 1, 1, 1, 1,
-0.05490448, -1.093775, -3.809952, 1, 1, 1, 1, 1,
-0.04965714, 0.7997829, 0.3445616, 1, 1, 1, 1, 1,
-0.04906681, 0.6476011, 0.5588355, 1, 1, 1, 1, 1,
-0.04739899, -0.9836844, -2.030515, 0, 0, 1, 1, 1,
-0.04671632, 0.1184999, -2.029274, 1, 0, 0, 1, 1,
-0.04468412, 1.712473, 1.799582, 1, 0, 0, 1, 1,
-0.04045186, 0.8014702, -0.2066326, 1, 0, 0, 1, 1,
-0.03881683, -0.4147062, -4.453734, 1, 0, 0, 1, 1,
-0.03623083, 0.3089918, 0.3673987, 1, 0, 0, 1, 1,
-0.03215926, -0.9489881, -2.408716, 0, 0, 0, 1, 1,
-0.03113431, 0.6600819, -1.332576, 0, 0, 0, 1, 1,
-0.0239321, -0.04683383, -2.876722, 0, 0, 0, 1, 1,
-0.02151484, 0.8907548, 0.01640018, 0, 0, 0, 1, 1,
-0.01097994, 1.475956, 2.104823, 0, 0, 0, 1, 1,
-0.006965033, -0.3217945, -3.992668, 0, 0, 0, 1, 1,
-0.006001645, 0.6050374, 1.533331, 0, 0, 0, 1, 1,
-0.004709586, 1.44933, -0.09414314, 1, 1, 1, 1, 1,
-0.002115194, 1.622842, 0.2646999, 1, 1, 1, 1, 1,
-0.000115052, 0.9285166, -1.136363, 1, 1, 1, 1, 1,
0.0004419545, 0.8971258, -0.066016, 1, 1, 1, 1, 1,
0.002559625, 1.083029, 0.2452539, 1, 1, 1, 1, 1,
0.003942514, 0.1493667, -0.6339551, 1, 1, 1, 1, 1,
0.006779126, -0.8002476, 3.115449, 1, 1, 1, 1, 1,
0.008223541, 0.4095214, 2.027817, 1, 1, 1, 1, 1,
0.009006548, -0.5637816, 2.099932, 1, 1, 1, 1, 1,
0.01144278, 0.7116604, 0.05581556, 1, 1, 1, 1, 1,
0.01968205, 0.2950945, -0.372264, 1, 1, 1, 1, 1,
0.02340606, 0.3577264, 0.198029, 1, 1, 1, 1, 1,
0.02781124, 0.6538996, 0.7497174, 1, 1, 1, 1, 1,
0.02919873, -1.247801, 3.861108, 1, 1, 1, 1, 1,
0.03046468, -0.04212589, 3.880356, 1, 1, 1, 1, 1,
0.03077227, -0.5361034, 0.5771811, 0, 0, 1, 1, 1,
0.03140185, -0.0232765, 2.522062, 1, 0, 0, 1, 1,
0.03514305, -0.806992, 4.004142, 1, 0, 0, 1, 1,
0.03715501, 1.557311, -0.1336395, 1, 0, 0, 1, 1,
0.04427996, -2.032896, 3.492235, 1, 0, 0, 1, 1,
0.05253305, 0.6373639, -0.751096, 1, 0, 0, 1, 1,
0.05570446, 0.4864509, -0.1681771, 0, 0, 0, 1, 1,
0.05674725, -1.111231, 2.193966, 0, 0, 0, 1, 1,
0.06013089, -0.697178, 2.628452, 0, 0, 0, 1, 1,
0.06197733, -1.244056, 3.490537, 0, 0, 0, 1, 1,
0.07958774, -1.277489, 2.225558, 0, 0, 0, 1, 1,
0.08134793, -1.340986, 3.038587, 0, 0, 0, 1, 1,
0.08420295, -0.1928893, 2.408676, 0, 0, 0, 1, 1,
0.08643177, 0.9456301, -1.002638, 1, 1, 1, 1, 1,
0.0866026, 0.6529855, -0.08433454, 1, 1, 1, 1, 1,
0.09166845, 1.698148, -0.0932506, 1, 1, 1, 1, 1,
0.09313419, -0.7267047, 4.03167, 1, 1, 1, 1, 1,
0.09741926, -0.02694923, 3.720294, 1, 1, 1, 1, 1,
0.09758728, 0.8795124, -0.6287167, 1, 1, 1, 1, 1,
0.1008407, -2.626056, 1.221808, 1, 1, 1, 1, 1,
0.10195, 0.4912294, -0.08569485, 1, 1, 1, 1, 1,
0.1025272, -1.558502, 3.490924, 1, 1, 1, 1, 1,
0.1102899, 0.1925921, 2.284866, 1, 1, 1, 1, 1,
0.1111543, -1.783419, 5.074594, 1, 1, 1, 1, 1,
0.1117881, 0.5921777, 0.07263193, 1, 1, 1, 1, 1,
0.1217977, 0.7312239, 0.2500272, 1, 1, 1, 1, 1,
0.1267556, -0.5274169, 3.09838, 1, 1, 1, 1, 1,
0.1285833, 0.7060306, 0.9018015, 1, 1, 1, 1, 1,
0.1296529, 1.298934, -2.298899, 0, 0, 1, 1, 1,
0.1296896, -0.7656575, 2.866773, 1, 0, 0, 1, 1,
0.1321532, -1.309503, 2.88818, 1, 0, 0, 1, 1,
0.1333079, -1.6481, 3.208346, 1, 0, 0, 1, 1,
0.1361639, 1.094121, 0.6306075, 1, 0, 0, 1, 1,
0.1367379, -0.4219212, 4.674862, 1, 0, 0, 1, 1,
0.1413225, -0.5403891, 5.101505, 0, 0, 0, 1, 1,
0.1421763, 0.05091525, 0.6404576, 0, 0, 0, 1, 1,
0.1438684, 0.6296947, 0.8267755, 0, 0, 0, 1, 1,
0.1508574, 0.2508741, 2.148105, 0, 0, 0, 1, 1,
0.1508933, 0.5581562, -0.4086331, 0, 0, 0, 1, 1,
0.1509359, 0.4147635, 1.316675, 0, 0, 0, 1, 1,
0.1510898, -0.7578024, 2.943935, 0, 0, 0, 1, 1,
0.1512222, -1.233192, 4.46794, 1, 1, 1, 1, 1,
0.1535866, -0.8960044, 1.713825, 1, 1, 1, 1, 1,
0.1536279, 0.02025621, 0.7942725, 1, 1, 1, 1, 1,
0.1549348, 0.2028234, 0.09171399, 1, 1, 1, 1, 1,
0.1592709, 0.4715174, -0.5658785, 1, 1, 1, 1, 1,
0.1644873, 0.3609718, -0.2243193, 1, 1, 1, 1, 1,
0.16608, -0.8308756, 2.350662, 1, 1, 1, 1, 1,
0.1701018, -2.983292, 3.050942, 1, 1, 1, 1, 1,
0.171265, -0.11767, 2.092131, 1, 1, 1, 1, 1,
0.1723049, 0.8902844, 0.8027453, 1, 1, 1, 1, 1,
0.1725131, -0.1332677, 3.929677, 1, 1, 1, 1, 1,
0.1739708, 0.4039218, -0.4320494, 1, 1, 1, 1, 1,
0.1797362, -0.7445896, 1.730003, 1, 1, 1, 1, 1,
0.180201, 0.4027776, 1.636963, 1, 1, 1, 1, 1,
0.1858788, 1.860812, 0.2520615, 1, 1, 1, 1, 1,
0.1881245, 0.2387803, 0.8680722, 0, 0, 1, 1, 1,
0.1975088, -0.7947203, 1.38866, 1, 0, 0, 1, 1,
0.2022616, -0.3486958, 3.008788, 1, 0, 0, 1, 1,
0.2109735, 0.6541384, 1.804476, 1, 0, 0, 1, 1,
0.2130945, 1.446932, -0.3729506, 1, 0, 0, 1, 1,
0.2189801, -0.230873, 2.235574, 1, 0, 0, 1, 1,
0.223167, -0.9088497, 2.259673, 0, 0, 0, 1, 1,
0.2257611, 0.4275724, 1.31207, 0, 0, 0, 1, 1,
0.2277557, -1.649328, 2.783706, 0, 0, 0, 1, 1,
0.2287025, 0.2603482, -0.7885388, 0, 0, 0, 1, 1,
0.2292664, 0.9267268, -0.8244122, 0, 0, 0, 1, 1,
0.2295939, -1.044983, 3.450727, 0, 0, 0, 1, 1,
0.2322178, -0.3417028, 2.500478, 0, 0, 0, 1, 1,
0.2356771, -0.8244374, 2.983046, 1, 1, 1, 1, 1,
0.2357297, 0.4805946, 0.2974728, 1, 1, 1, 1, 1,
0.2372546, 0.6869863, 0.8168745, 1, 1, 1, 1, 1,
0.2426195, 2.001945, -1.064174, 1, 1, 1, 1, 1,
0.2436682, 0.2806934, 0.8387651, 1, 1, 1, 1, 1,
0.2445136, -0.09508347, 1.590091, 1, 1, 1, 1, 1,
0.2452525, 0.3351286, 1.140813, 1, 1, 1, 1, 1,
0.2469801, -0.6736631, 3.437586, 1, 1, 1, 1, 1,
0.253582, 0.1395358, 1.202892, 1, 1, 1, 1, 1,
0.2540796, 0.6357009, 0.6434525, 1, 1, 1, 1, 1,
0.2578672, 1.055624, 1.896964, 1, 1, 1, 1, 1,
0.2623681, -0.6844602, 2.557769, 1, 1, 1, 1, 1,
0.2628081, 1.026565, 1.941123, 1, 1, 1, 1, 1,
0.2637731, -1.329495, 2.91087, 1, 1, 1, 1, 1,
0.2646731, -1.419532, 2.224948, 1, 1, 1, 1, 1,
0.2690339, 1.087876, 1.020823, 0, 0, 1, 1, 1,
0.2781839, -0.5534575, 3.489293, 1, 0, 0, 1, 1,
0.286111, 0.6521679, 0.3946697, 1, 0, 0, 1, 1,
0.290486, -1.034719, 2.823641, 1, 0, 0, 1, 1,
0.2992375, -0.2984454, 2.831016, 1, 0, 0, 1, 1,
0.3023746, -0.5523005, -0.1258937, 1, 0, 0, 1, 1,
0.3061331, -0.803145, 4.380477, 0, 0, 0, 1, 1,
0.3097935, -1.359331, 3.192039, 0, 0, 0, 1, 1,
0.3104177, 1.74804, 0.4737701, 0, 0, 0, 1, 1,
0.3120948, -0.5248265, 3.476206, 0, 0, 0, 1, 1,
0.3125941, -0.2960455, 2.01039, 0, 0, 0, 1, 1,
0.3136724, 0.857111, 0.8383983, 0, 0, 0, 1, 1,
0.3159937, -0.8462664, 3.463899, 0, 0, 0, 1, 1,
0.3177678, 0.1425759, 1.041194, 1, 1, 1, 1, 1,
0.3198291, -0.7040349, 3.380651, 1, 1, 1, 1, 1,
0.3198391, 0.1832039, 1.609653, 1, 1, 1, 1, 1,
0.3215056, -0.9036712, 3.219604, 1, 1, 1, 1, 1,
0.3222353, -0.02039782, 0.5610215, 1, 1, 1, 1, 1,
0.3241591, 1.58384, 0.429043, 1, 1, 1, 1, 1,
0.3280446, -1.392558, 4.346601, 1, 1, 1, 1, 1,
0.330626, 0.5207158, -0.9989402, 1, 1, 1, 1, 1,
0.3363277, -1.246946, 4.419897, 1, 1, 1, 1, 1,
0.3363549, -0.4197452, 2.805149, 1, 1, 1, 1, 1,
0.3371704, -0.4669627, 3.57495, 1, 1, 1, 1, 1,
0.3404046, -1.077592, 4.12306, 1, 1, 1, 1, 1,
0.3413844, 1.181666, 1.306351, 1, 1, 1, 1, 1,
0.342694, 0.7330745, 1.097343, 1, 1, 1, 1, 1,
0.3437212, -1.398765, 1.565109, 1, 1, 1, 1, 1,
0.3486414, -1.41817, 3.810873, 0, 0, 1, 1, 1,
0.3490469, 0.9737189, -0.02084984, 1, 0, 0, 1, 1,
0.3493839, -1.050326, 3.934871, 1, 0, 0, 1, 1,
0.3524686, 1.313092, -1.649357, 1, 0, 0, 1, 1,
0.3525125, 0.8998228, -0.9559703, 1, 0, 0, 1, 1,
0.3527526, 0.9468099, -0.07142024, 1, 0, 0, 1, 1,
0.3533596, 0.8721753, -0.08162706, 0, 0, 0, 1, 1,
0.355466, 0.399729, -0.4880082, 0, 0, 0, 1, 1,
0.3639557, 0.517364, 0.3282475, 0, 0, 0, 1, 1,
0.3653513, 1.554733, 0.02880331, 0, 0, 0, 1, 1,
0.3656362, -1.174474, 3.437097, 0, 0, 0, 1, 1,
0.3666005, 1.488777, 2.592101, 0, 0, 0, 1, 1,
0.3678467, 0.09528976, 1.003221, 0, 0, 0, 1, 1,
0.3694075, 0.8638286, -0.1687386, 1, 1, 1, 1, 1,
0.3711646, -0.6252731, 1.88377, 1, 1, 1, 1, 1,
0.3809435, 0.3629508, 0.8883731, 1, 1, 1, 1, 1,
0.3816603, 0.2102446, 0.5388365, 1, 1, 1, 1, 1,
0.3817411, -0.9425358, 0.14759, 1, 1, 1, 1, 1,
0.381954, -0.2083087, 4.364965, 1, 1, 1, 1, 1,
0.3848941, -0.05312335, 1.950446, 1, 1, 1, 1, 1,
0.3850009, -0.4857509, 4.002176, 1, 1, 1, 1, 1,
0.3909705, -0.8558723, 1.152838, 1, 1, 1, 1, 1,
0.3922044, -0.7764732, 0.9803661, 1, 1, 1, 1, 1,
0.3924037, 0.0852917, 1.453257, 1, 1, 1, 1, 1,
0.3993788, -0.9590554, 3.144243, 1, 1, 1, 1, 1,
0.4024721, -1.34782, 2.63583, 1, 1, 1, 1, 1,
0.4037166, 0.4150704, -0.3862724, 1, 1, 1, 1, 1,
0.4055949, 2.517417, -1.239288, 1, 1, 1, 1, 1,
0.4056749, -0.5035734, 1.890703, 0, 0, 1, 1, 1,
0.4065902, -0.4935098, 2.81046, 1, 0, 0, 1, 1,
0.4199165, -0.003708583, 2.448942, 1, 0, 0, 1, 1,
0.4200585, 3.101279, -1.665155, 1, 0, 0, 1, 1,
0.4209775, -0.09273498, 3.23055, 1, 0, 0, 1, 1,
0.4242198, -1.308982, 2.405838, 1, 0, 0, 1, 1,
0.4302769, -1.402685, 2.468317, 0, 0, 0, 1, 1,
0.433726, 0.371306, 0.2768205, 0, 0, 0, 1, 1,
0.4365917, -1.127526, 2.624191, 0, 0, 0, 1, 1,
0.4406917, 1.389055, -1.03148, 0, 0, 0, 1, 1,
0.4428729, 0.3706338, 3.725649, 0, 0, 0, 1, 1,
0.4466572, -0.9887609, 4.584939, 0, 0, 0, 1, 1,
0.4475467, -0.3812986, 2.198668, 0, 0, 0, 1, 1,
0.4557152, -2.309501, 2.11735, 1, 1, 1, 1, 1,
0.4587855, 0.7433857, -1.02011, 1, 1, 1, 1, 1,
0.4615771, -0.8051799, 3.423455, 1, 1, 1, 1, 1,
0.462416, -3.221952, 3.519388, 1, 1, 1, 1, 1,
0.464273, 1.353779, 0.2636977, 1, 1, 1, 1, 1,
0.4659338, -1.206469, 1.843344, 1, 1, 1, 1, 1,
0.4721063, -0.9307948, 4.053339, 1, 1, 1, 1, 1,
0.4765556, -1.813028, 2.76274, 1, 1, 1, 1, 1,
0.485056, -0.5476289, 3.6469, 1, 1, 1, 1, 1,
0.4851161, 1.144479, 0.01314438, 1, 1, 1, 1, 1,
0.4875107, 0.08102734, 1.858943, 1, 1, 1, 1, 1,
0.4904982, -0.7694538, 3.012834, 1, 1, 1, 1, 1,
0.4948647, 0.4256578, -0.5335931, 1, 1, 1, 1, 1,
0.4959293, -0.9378599, 2.562306, 1, 1, 1, 1, 1,
0.4975592, -0.1041583, 2.244667, 1, 1, 1, 1, 1,
0.5006457, 1.78388, 2.284678, 0, 0, 1, 1, 1,
0.5011119, -0.5345545, 2.537863, 1, 0, 0, 1, 1,
0.5025278, -0.1270446, 1.833275, 1, 0, 0, 1, 1,
0.503628, 1.639326, -1.612649, 1, 0, 0, 1, 1,
0.5055583, 0.6937304, 0.188539, 1, 0, 0, 1, 1,
0.5056866, 1.550164, -1.883922, 1, 0, 0, 1, 1,
0.5064551, -1.64146, 1.655055, 0, 0, 0, 1, 1,
0.5132856, 1.832123, -0.429386, 0, 0, 0, 1, 1,
0.5183061, 0.4633704, 0.302249, 0, 0, 0, 1, 1,
0.5212409, -0.01009909, 1.546701, 0, 0, 0, 1, 1,
0.5218796, -0.5657876, 2.810442, 0, 0, 0, 1, 1,
0.5250531, 0.0857191, 2.635738, 0, 0, 0, 1, 1,
0.5288057, 2.338239, -0.5137135, 0, 0, 0, 1, 1,
0.5336573, 1.561188, 0.8638145, 1, 1, 1, 1, 1,
0.534865, -0.8351298, 1.834845, 1, 1, 1, 1, 1,
0.5366621, -0.7394856, 2.092767, 1, 1, 1, 1, 1,
0.5407672, -1.756638, 3.054087, 1, 1, 1, 1, 1,
0.5422317, 0.4872724, 0.6504684, 1, 1, 1, 1, 1,
0.5435132, -0.5159451, 1.403543, 1, 1, 1, 1, 1,
0.5526488, -0.5987054, 3.374844, 1, 1, 1, 1, 1,
0.5586442, 0.2751951, 2.221754, 1, 1, 1, 1, 1,
0.5597461, -0.46224, 2.089661, 1, 1, 1, 1, 1,
0.567979, -1.790482, 1.935139, 1, 1, 1, 1, 1,
0.5692387, 1.102095, 1.798807, 1, 1, 1, 1, 1,
0.5764905, -0.7753606, 2.911025, 1, 1, 1, 1, 1,
0.5768224, 0.4658376, 2.278675, 1, 1, 1, 1, 1,
0.5826483, -1.216481, 2.752262, 1, 1, 1, 1, 1,
0.5839715, -2.669655, 2.325189, 1, 1, 1, 1, 1,
0.5844797, 1.097476, 0.6465057, 0, 0, 1, 1, 1,
0.5848314, 0.3889441, 0.6899039, 1, 0, 0, 1, 1,
0.5899288, 0.6008376, 1.639443, 1, 0, 0, 1, 1,
0.5933213, -0.08150624, 1.862163, 1, 0, 0, 1, 1,
0.5958178, 2.031406, -0.5306612, 1, 0, 0, 1, 1,
0.6002524, 0.3525886, 0.04459742, 1, 0, 0, 1, 1,
0.6009362, -0.1521061, 3.875754, 0, 0, 0, 1, 1,
0.6009513, 0.7516057, 1.283795, 0, 0, 0, 1, 1,
0.6064152, -0.7425372, 2.488926, 0, 0, 0, 1, 1,
0.6075516, 0.8321636, 0.09063392, 0, 0, 0, 1, 1,
0.609647, -0.5916141, 2.237575, 0, 0, 0, 1, 1,
0.6101801, -0.2755438, 0.60147, 0, 0, 0, 1, 1,
0.6253264, -2.070292, 3.274435, 0, 0, 0, 1, 1,
0.6278123, 0.03309401, 3.203068, 1, 1, 1, 1, 1,
0.6292743, -0.08771311, 2.775604, 1, 1, 1, 1, 1,
0.6333822, -0.6295074, 1.611735, 1, 1, 1, 1, 1,
0.6339603, -1.634795, -0.6447185, 1, 1, 1, 1, 1,
0.6347721, 0.2495724, 1.28307, 1, 1, 1, 1, 1,
0.6351078, -1.247782, 1.243022, 1, 1, 1, 1, 1,
0.6368435, -0.8137143, 1.728005, 1, 1, 1, 1, 1,
0.6388285, -1.283623, 1.104345, 1, 1, 1, 1, 1,
0.6418469, 0.195394, 2.371665, 1, 1, 1, 1, 1,
0.6459672, 0.9027702, 1.48046, 1, 1, 1, 1, 1,
0.6570755, 0.1306766, 2.509991, 1, 1, 1, 1, 1,
0.6583468, -2.584737, 2.609639, 1, 1, 1, 1, 1,
0.6584182, 0.6191652, 2.050904, 1, 1, 1, 1, 1,
0.6591895, 1.468756, 0.1714749, 1, 1, 1, 1, 1,
0.6595646, 0.4243362, 0.5944579, 1, 1, 1, 1, 1,
0.6607972, -0.02447911, 2.137891, 0, 0, 1, 1, 1,
0.6632216, 1.780471, -0.1503458, 1, 0, 0, 1, 1,
0.6635724, -1.235863, 3.357838, 1, 0, 0, 1, 1,
0.6640636, -0.8919825, 1.477702, 1, 0, 0, 1, 1,
0.6671968, 0.8081918, 0.7844495, 1, 0, 0, 1, 1,
0.6675482, 0.3827818, 0.3893301, 1, 0, 0, 1, 1,
0.6702598, -1.24189, 2.458399, 0, 0, 0, 1, 1,
0.6733696, -0.08112835, 0.9967252, 0, 0, 0, 1, 1,
0.677035, -0.3308842, 1.481573, 0, 0, 0, 1, 1,
0.6802834, 1.305502, -0.07017474, 0, 0, 0, 1, 1,
0.6841152, -2.510568, 2.160315, 0, 0, 0, 1, 1,
0.6852837, 1.5826, -0.5378706, 0, 0, 0, 1, 1,
0.6888258, 0.5068015, 1.105839, 0, 0, 0, 1, 1,
0.6943299, 2.103142, -0.1464188, 1, 1, 1, 1, 1,
0.6950691, -0.1377724, 1.297992, 1, 1, 1, 1, 1,
0.6971882, 0.2885105, 1.122678, 1, 1, 1, 1, 1,
0.697993, -0.04646202, 2.172795, 1, 1, 1, 1, 1,
0.6981502, -0.3666996, 2.00084, 1, 1, 1, 1, 1,
0.6989834, -0.1796643, 1.028927, 1, 1, 1, 1, 1,
0.7066588, 0.9317654, 1.385321, 1, 1, 1, 1, 1,
0.7073647, -1.041134, 3.67167, 1, 1, 1, 1, 1,
0.7092099, 0.9878611, 0.5458619, 1, 1, 1, 1, 1,
0.7097532, -0.3053131, 1.587946, 1, 1, 1, 1, 1,
0.7163278, 0.9460903, 0.7769668, 1, 1, 1, 1, 1,
0.7168732, 0.6086503, 1.289005, 1, 1, 1, 1, 1,
0.7171523, 0.05859492, 1.597066, 1, 1, 1, 1, 1,
0.7253133, 1.138498, 0.01529452, 1, 1, 1, 1, 1,
0.7304769, -0.5095973, 2.364712, 1, 1, 1, 1, 1,
0.7333145, -0.08502311, 1.823737, 0, 0, 1, 1, 1,
0.7334232, -1.261559, 2.044345, 1, 0, 0, 1, 1,
0.7378111, 0.6044329, 3.391427, 1, 0, 0, 1, 1,
0.7388718, -0.2512827, 1.406418, 1, 0, 0, 1, 1,
0.7410434, -0.5830499, 4.384267, 1, 0, 0, 1, 1,
0.7428457, 0.9926475, 0.9831752, 1, 0, 0, 1, 1,
0.7435176, -0.5596308, 2.058505, 0, 0, 0, 1, 1,
0.7437078, 1.034001, -0.2375844, 0, 0, 0, 1, 1,
0.750363, -1.077059, 1.519479, 0, 0, 0, 1, 1,
0.7509801, -0.8630894, 2.261259, 0, 0, 0, 1, 1,
0.751809, 0.7811962, 1.216875, 0, 0, 0, 1, 1,
0.7529218, -1.124635, 1.048817, 0, 0, 0, 1, 1,
0.7537697, -0.009300859, 2.005612, 0, 0, 0, 1, 1,
0.7572649, 0.5194255, 2.88718, 1, 1, 1, 1, 1,
0.7676695, -0.8634467, 3.381194, 1, 1, 1, 1, 1,
0.7679879, 0.2156544, 0.5040932, 1, 1, 1, 1, 1,
0.7683512, 0.01227494, 2.618076, 1, 1, 1, 1, 1,
0.7695686, -0.1239404, 2.606621, 1, 1, 1, 1, 1,
0.7762007, -0.5158443, 1.636063, 1, 1, 1, 1, 1,
0.7791686, 0.3736835, 1.134648, 1, 1, 1, 1, 1,
0.7810836, -0.04402336, 1.064241, 1, 1, 1, 1, 1,
0.7904697, 0.9499613, -0.288562, 1, 1, 1, 1, 1,
0.790517, 2.138129, 0.5259533, 1, 1, 1, 1, 1,
0.7921281, 2.076102, 0.7601551, 1, 1, 1, 1, 1,
0.7968691, 2.202033, 0.4396415, 1, 1, 1, 1, 1,
0.7972326, -0.6727662, 3.458863, 1, 1, 1, 1, 1,
0.8111664, -0.8182793, 1.800603, 1, 1, 1, 1, 1,
0.8119719, -1.410376, 3.193124, 1, 1, 1, 1, 1,
0.8141626, -1.136612, 3.038393, 0, 0, 1, 1, 1,
0.8203996, 0.3185701, 2.309799, 1, 0, 0, 1, 1,
0.8289688, 1.005613, 1.223464, 1, 0, 0, 1, 1,
0.8319323, -0.7866027, 2.075422, 1, 0, 0, 1, 1,
0.84226, 1.671116, 0.6262689, 1, 0, 0, 1, 1,
0.8433872, -0.2177704, 2.987412, 1, 0, 0, 1, 1,
0.8471243, -1.086677, 2.374654, 0, 0, 0, 1, 1,
0.8509609, -0.4451176, 2.690348, 0, 0, 0, 1, 1,
0.8601934, 0.6926008, 0.1449372, 0, 0, 0, 1, 1,
0.8639953, 0.4487151, -0.7541777, 0, 0, 0, 1, 1,
0.8715584, 1.096288, -0.8516098, 0, 0, 0, 1, 1,
0.8723039, 0.6210961, -0.2288949, 0, 0, 0, 1, 1,
0.8723621, 1.596136, -2.090234, 0, 0, 0, 1, 1,
0.8749658, 2.467401, 0.5323, 1, 1, 1, 1, 1,
0.8779366, 0.05975732, 1.166185, 1, 1, 1, 1, 1,
0.8824843, 0.4556657, 1.552184, 1, 1, 1, 1, 1,
0.8879531, 0.03389071, 1.017285, 1, 1, 1, 1, 1,
0.8894834, -0.03771654, 2.207868, 1, 1, 1, 1, 1,
0.8896232, 0.343796, 0.3341498, 1, 1, 1, 1, 1,
0.8905016, 1.295133, 2.502128, 1, 1, 1, 1, 1,
0.8957364, 0.06306041, 0.3905112, 1, 1, 1, 1, 1,
0.8967455, 0.8681864, 0.707819, 1, 1, 1, 1, 1,
0.9053333, 0.05092236, 1.865533, 1, 1, 1, 1, 1,
0.9098703, 0.8603368, 0.3928515, 1, 1, 1, 1, 1,
0.9127805, -0.6138774, 3.810922, 1, 1, 1, 1, 1,
0.9131666, 0.9216177, 1.161588, 1, 1, 1, 1, 1,
0.9152727, -0.8155421, 2.895402, 1, 1, 1, 1, 1,
0.9176664, 0.7466525, 1.884644, 1, 1, 1, 1, 1,
0.9176853, -0.08641768, 0.1689383, 0, 0, 1, 1, 1,
0.9222944, 0.8739022, 0.7812211, 1, 0, 0, 1, 1,
0.9355767, -1.092663, 3.810246, 1, 0, 0, 1, 1,
0.9362568, 0.1903673, 2.353299, 1, 0, 0, 1, 1,
0.9380408, 0.7020706, -0.444913, 1, 0, 0, 1, 1,
0.9380952, 0.9465775, 1.18115, 1, 0, 0, 1, 1,
0.9445817, -0.2665561, 2.084205, 0, 0, 0, 1, 1,
0.9469172, 0.696901, -0.1877529, 0, 0, 0, 1, 1,
0.9527729, 2.452066, -1.820856, 0, 0, 0, 1, 1,
0.9558083, 0.363082, 2.325082, 0, 0, 0, 1, 1,
0.9587096, -0.6169127, 2.19448, 0, 0, 0, 1, 1,
0.9750896, 0.02303816, 1.536025, 0, 0, 0, 1, 1,
0.9781809, -1.342878, 1.141768, 0, 0, 0, 1, 1,
0.9965518, -0.5723112, 0.09244111, 1, 1, 1, 1, 1,
0.9992621, -0.6487198, 1.433485, 1, 1, 1, 1, 1,
1.001453, -1.542314, 1.885123, 1, 1, 1, 1, 1,
1.003677, 0.06329397, 3.038541, 1, 1, 1, 1, 1,
1.006461, 0.6711724, 4.636737, 1, 1, 1, 1, 1,
1.006743, -2.624779, 2.341228, 1, 1, 1, 1, 1,
1.010522, -0.8408339, 2.017428, 1, 1, 1, 1, 1,
1.011824, -0.2189355, 2.078149, 1, 1, 1, 1, 1,
1.012427, 1.848361, -0.4380915, 1, 1, 1, 1, 1,
1.014429, 1.631039, 0.07991554, 1, 1, 1, 1, 1,
1.016053, 1.314509, 1.994916, 1, 1, 1, 1, 1,
1.017677, -1.277085, 1.532436, 1, 1, 1, 1, 1,
1.024606, -0.2873414, 2.940564, 1, 1, 1, 1, 1,
1.025201, 0.8787577, 1.633355, 1, 1, 1, 1, 1,
1.026186, -1.802214, 0.9661494, 1, 1, 1, 1, 1,
1.030869, -0.4340261, 3.201667, 0, 0, 1, 1, 1,
1.031327, -1.11401, 2.380306, 1, 0, 0, 1, 1,
1.040007, -0.3188311, 2.701155, 1, 0, 0, 1, 1,
1.053893, -0.4374889, 1.337461, 1, 0, 0, 1, 1,
1.056045, -0.07162588, 1.639096, 1, 0, 0, 1, 1,
1.059634, 0.2226473, 0.3845544, 1, 0, 0, 1, 1,
1.061207, 0.7708675, -0.3108592, 0, 0, 0, 1, 1,
1.064016, -2.274057, 1.68352, 0, 0, 0, 1, 1,
1.065869, 1.036376, -1.117929, 0, 0, 0, 1, 1,
1.066265, -0.4483675, 1.493922, 0, 0, 0, 1, 1,
1.067439, 2.191281, 0.2034618, 0, 0, 0, 1, 1,
1.077915, 0.8531117, 1.721656, 0, 0, 0, 1, 1,
1.081978, 0.06812698, 0.6782434, 0, 0, 0, 1, 1,
1.093402, -0.4867386, 0.9680884, 1, 1, 1, 1, 1,
1.095225, 0.2296635, -0.02879091, 1, 1, 1, 1, 1,
1.099902, 0.410352, 2.090942, 1, 1, 1, 1, 1,
1.100803, -0.3777184, 3.090178, 1, 1, 1, 1, 1,
1.104472, 0.3514241, 1.364519, 1, 1, 1, 1, 1,
1.107812, -0.5245144, 3.952843, 1, 1, 1, 1, 1,
1.118524, 0.4812355, 0.3803066, 1, 1, 1, 1, 1,
1.120821, 0.03595787, -0.09204946, 1, 1, 1, 1, 1,
1.122274, 0.9957514, 1.180834, 1, 1, 1, 1, 1,
1.132684, 1.777847, 0.2649736, 1, 1, 1, 1, 1,
1.138406, -0.5993741, 2.819844, 1, 1, 1, 1, 1,
1.144582, 1.615394, 0.5957225, 1, 1, 1, 1, 1,
1.151077, -0.4959477, 1.811485, 1, 1, 1, 1, 1,
1.151916, 0.1679753, 1.279673, 1, 1, 1, 1, 1,
1.169284, -0.6569909, 1.004411, 1, 1, 1, 1, 1,
1.176334, 0.2903269, 1.30485, 0, 0, 1, 1, 1,
1.180058, 0.4946744, 1.029119, 1, 0, 0, 1, 1,
1.195006, 0.2170857, 2.90373, 1, 0, 0, 1, 1,
1.197628, 0.5784234, 0.6572117, 1, 0, 0, 1, 1,
1.212856, -1.369972, 3.82244, 1, 0, 0, 1, 1,
1.218785, 0.3341163, 0.4478231, 1, 0, 0, 1, 1,
1.223698, -0.4270664, -0.1783485, 0, 0, 0, 1, 1,
1.22443, -0.9228527, 1.849902, 0, 0, 0, 1, 1,
1.2267, -2.238725, 1.320646, 0, 0, 0, 1, 1,
1.228685, -0.791356, 2.807785, 0, 0, 0, 1, 1,
1.237346, 0.6626234, 3.181589, 0, 0, 0, 1, 1,
1.239423, 0.2511397, -1.043545, 0, 0, 0, 1, 1,
1.239631, -0.7857072, 3.256089, 0, 0, 0, 1, 1,
1.241798, -0.1084774, 0.6712907, 1, 1, 1, 1, 1,
1.248725, 0.2460916, 1.651326, 1, 1, 1, 1, 1,
1.252977, 0.3959574, 0.5451593, 1, 1, 1, 1, 1,
1.253927, -0.6896595, 1.941077, 1, 1, 1, 1, 1,
1.257513, 0.101017, -0.01553384, 1, 1, 1, 1, 1,
1.270634, 1.173821, -1.414999, 1, 1, 1, 1, 1,
1.271854, 1.398737, 0.8324809, 1, 1, 1, 1, 1,
1.287808, 1.350378, 1.021122, 1, 1, 1, 1, 1,
1.298335, -1.351716, 4.608671, 1, 1, 1, 1, 1,
1.299338, 0.07551888, 2.188934, 1, 1, 1, 1, 1,
1.300202, -0.4924116, 2.51388, 1, 1, 1, 1, 1,
1.309577, -1.506535, 1.278512, 1, 1, 1, 1, 1,
1.312971, 0.2920863, 1.276788, 1, 1, 1, 1, 1,
1.314004, 1.207784, 0.9210362, 1, 1, 1, 1, 1,
1.315202, 0.1624708, 3.256356, 1, 1, 1, 1, 1,
1.318956, -0.5206626, 3.758721, 0, 0, 1, 1, 1,
1.320372, -0.4270407, 3.409535, 1, 0, 0, 1, 1,
1.322693, -1.06213, 2.462523, 1, 0, 0, 1, 1,
1.324979, 0.06308435, 2.039242, 1, 0, 0, 1, 1,
1.32936, 0.1004726, 0.4729551, 1, 0, 0, 1, 1,
1.331398, 0.681502, -1.271914, 1, 0, 0, 1, 1,
1.33934, -0.5344006, 1.756348, 0, 0, 0, 1, 1,
1.348096, -0.455961, 1.782338, 0, 0, 0, 1, 1,
1.360102, -1.61173, 0.6008117, 0, 0, 0, 1, 1,
1.370896, -0.7279291, 4.312025, 0, 0, 0, 1, 1,
1.376006, 0.1941008, 2.528006, 0, 0, 0, 1, 1,
1.401872, 0.8635247, 1.525003, 0, 0, 0, 1, 1,
1.414602, -0.8031327, 1.353157, 0, 0, 0, 1, 1,
1.423918, 0.2715699, 0.4404671, 1, 1, 1, 1, 1,
1.424626, 1.77743, 1.483258, 1, 1, 1, 1, 1,
1.432307, -0.3246496, 2.780594, 1, 1, 1, 1, 1,
1.43501, 0.5847087, -0.453584, 1, 1, 1, 1, 1,
1.43804, -0.2018655, 0.2084503, 1, 1, 1, 1, 1,
1.439739, -1.418521, 3.076965, 1, 1, 1, 1, 1,
1.446342, -0.843067, 1.43271, 1, 1, 1, 1, 1,
1.473969, 0.9036512, -0.6702278, 1, 1, 1, 1, 1,
1.478878, 1.389371, 0.1147342, 1, 1, 1, 1, 1,
1.47974, -0.2834347, 1.353943, 1, 1, 1, 1, 1,
1.490744, 0.6281821, 2.238424, 1, 1, 1, 1, 1,
1.497032, 1.703035, 1.071928, 1, 1, 1, 1, 1,
1.498455, 0.2685833, 1.22048, 1, 1, 1, 1, 1,
1.504118, 0.3028782, 0.6572511, 1, 1, 1, 1, 1,
1.504581, -1.236062, 2.360797, 1, 1, 1, 1, 1,
1.507562, -0.1911733, 2.356013, 0, 0, 1, 1, 1,
1.51157, -1.218653, 1.134516, 1, 0, 0, 1, 1,
1.511853, 1.033034, 0.5248564, 1, 0, 0, 1, 1,
1.512698, -2.927876, 2.156767, 1, 0, 0, 1, 1,
1.516768, -1.781675, 1.818125, 1, 0, 0, 1, 1,
1.518793, -0.4746342, 3.612615, 1, 0, 0, 1, 1,
1.522424, -0.2906573, 2.722144, 0, 0, 0, 1, 1,
1.530408, -0.3020384, 1.787693, 0, 0, 0, 1, 1,
1.5345, 2.763958, 0.3679511, 0, 0, 0, 1, 1,
1.537453, -1.035137, 2.165364, 0, 0, 0, 1, 1,
1.552761, 0.5066127, 2.15072, 0, 0, 0, 1, 1,
1.553744, -1.161832, 2.468259, 0, 0, 0, 1, 1,
1.556417, 0.5055946, -0.6458873, 0, 0, 0, 1, 1,
1.56073, 1.73464, 0.7953341, 1, 1, 1, 1, 1,
1.573003, -2.467403, 1.843987, 1, 1, 1, 1, 1,
1.58216, 0.7739099, 1.063619, 1, 1, 1, 1, 1,
1.583245, -1.126204, 1.806345, 1, 1, 1, 1, 1,
1.591095, -0.4346238, 0.8190142, 1, 1, 1, 1, 1,
1.609558, -2.049091, 4.153611, 1, 1, 1, 1, 1,
1.622407, -0.09594622, 2.699727, 1, 1, 1, 1, 1,
1.622711, 0.8853324, 1.742228, 1, 1, 1, 1, 1,
1.623148, 0.08073165, -0.1617741, 1, 1, 1, 1, 1,
1.634345, 0.3230359, 1.653931, 1, 1, 1, 1, 1,
1.6461, -0.3962494, 3.237924, 1, 1, 1, 1, 1,
1.648471, -0.7806538, 2.297998, 1, 1, 1, 1, 1,
1.657004, 0.3091723, 1.400916, 1, 1, 1, 1, 1,
1.668995, -1.002368, 0.2323968, 1, 1, 1, 1, 1,
1.680528, -0.4818423, 2.550366, 1, 1, 1, 1, 1,
1.741172, -0.899394, 1.317018, 0, 0, 1, 1, 1,
1.743049, -0.1202935, 1.61988, 1, 0, 0, 1, 1,
1.748936, -0.7237763, 3.002023, 1, 0, 0, 1, 1,
1.780249, 1.030733, 1.075784, 1, 0, 0, 1, 1,
1.797474, 0.7393258, 2.677122, 1, 0, 0, 1, 1,
1.801801, 0.4145861, -0.2281577, 1, 0, 0, 1, 1,
1.805617, 0.1186261, 0.5509002, 0, 0, 0, 1, 1,
1.845442, 0.2507386, 2.181706, 0, 0, 0, 1, 1,
1.849688, 0.4394969, 2.600271, 0, 0, 0, 1, 1,
1.86255, -0.2933288, 0.9294801, 0, 0, 0, 1, 1,
1.89595, -1.721122, 2.845389, 0, 0, 0, 1, 1,
1.930058, -0.006410753, 2.178052, 0, 0, 0, 1, 1,
1.930832, 0.2250066, 1.818952, 0, 0, 0, 1, 1,
1.933623, 0.9085161, 0.08073311, 1, 1, 1, 1, 1,
1.959073, -0.1950079, 0.4763777, 1, 1, 1, 1, 1,
1.9646, -0.3518682, 1.686267, 1, 1, 1, 1, 1,
1.981861, -0.3488206, 0.987116, 1, 1, 1, 1, 1,
1.981887, -1.851957, -0.8820475, 1, 1, 1, 1, 1,
1.998502, -0.4633359, 1.693312, 1, 1, 1, 1, 1,
2.017216, -0.6190527, 0.8434147, 1, 1, 1, 1, 1,
2.043292, -1.16916, 1.669623, 1, 1, 1, 1, 1,
2.043441, 0.6652011, 3.582207, 1, 1, 1, 1, 1,
2.046362, 0.2016698, 2.253507, 1, 1, 1, 1, 1,
2.058942, -0.08258021, 1.608041, 1, 1, 1, 1, 1,
2.077653, 0.5608003, 0.8066728, 1, 1, 1, 1, 1,
2.094265, 0.729874, 1.833374, 1, 1, 1, 1, 1,
2.146317, 1.813701, 1.153042, 1, 1, 1, 1, 1,
2.148299, 1.040382, 1.243537, 1, 1, 1, 1, 1,
2.16704, 0.07491465, 1.921743, 0, 0, 1, 1, 1,
2.178172, 0.5998452, -0.1829617, 1, 0, 0, 1, 1,
2.178366, -0.7815844, 1.610847, 1, 0, 0, 1, 1,
2.180742, 0.1436704, 2.274523, 1, 0, 0, 1, 1,
2.201008, -0.4117612, 1.273779, 1, 0, 0, 1, 1,
2.204451, -0.6538897, 2.631356, 1, 0, 0, 1, 1,
2.238951, 0.5127043, 2.323046, 0, 0, 0, 1, 1,
2.332526, 0.2294969, 2.372611, 0, 0, 0, 1, 1,
2.371845, -0.5885699, 1.544599, 0, 0, 0, 1, 1,
2.388218, 0.4732768, 2.088538, 0, 0, 0, 1, 1,
2.410262, 0.9125049, 0.07205539, 0, 0, 0, 1, 1,
2.422452, -1.16065, 2.617307, 0, 0, 0, 1, 1,
2.438018, 0.1267661, 2.290159, 0, 0, 0, 1, 1,
2.481293, 0.7487817, 1.459243, 1, 1, 1, 1, 1,
2.564044, -0.8095794, 2.542579, 1, 1, 1, 1, 1,
2.660463, 0.3388948, 1.044607, 1, 1, 1, 1, 1,
2.693716, 3.505056, 2.966123, 1, 1, 1, 1, 1,
2.803364, 0.3106111, 3.041073, 1, 1, 1, 1, 1,
2.924267, 0.2224167, 1.8727, 1, 1, 1, 1, 1,
3.937811, 1.988827, 0.1541589, 1, 1, 1, 1, 1
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
var radius = 9.592596;
var distance = 33.69359;
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
mvMatrix.translate( -0.4014621, -0.1306977, -0.07370496 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.69359);
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
