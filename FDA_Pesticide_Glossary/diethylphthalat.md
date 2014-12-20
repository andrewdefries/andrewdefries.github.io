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
-3.238633, -0.3270483, -0.3883517, 1, 0, 0, 1,
-2.878405, 0.950548, -1.59434, 1, 0.007843138, 0, 1,
-2.63474, 0.6424916, 0.4361903, 1, 0.01176471, 0, 1,
-2.497969, 0.8601839, 0.4085191, 1, 0.01960784, 0, 1,
-2.445751, -0.1486481, -0.5178218, 1, 0.02352941, 0, 1,
-2.360456, -0.9009103, -2.799893, 1, 0.03137255, 0, 1,
-2.328289, 0.543614, -2.662211, 1, 0.03529412, 0, 1,
-2.328028, -1.263095, -1.072734, 1, 0.04313726, 0, 1,
-2.26258, 1.329802, -0.5515838, 1, 0.04705882, 0, 1,
-2.211942, -0.08200125, -2.379782, 1, 0.05490196, 0, 1,
-2.156055, -1.08361, -0.420291, 1, 0.05882353, 0, 1,
-2.113071, 0.3811792, -0.9959868, 1, 0.06666667, 0, 1,
-2.108607, 0.7809474, 0.6417928, 1, 0.07058824, 0, 1,
-2.107364, 0.6667432, -0.5937683, 1, 0.07843138, 0, 1,
-2.097772, -0.07236534, 0.4885434, 1, 0.08235294, 0, 1,
-2.097151, 1.099988, -1.698099, 1, 0.09019608, 0, 1,
-2.093262, 0.5104735, -0.5207348, 1, 0.09411765, 0, 1,
-2.086786, -0.4713065, -1.922395, 1, 0.1019608, 0, 1,
-2.080965, -0.6741876, -2.72824, 1, 0.1098039, 0, 1,
-2.040889, -2.250532, -1.596415, 1, 0.1137255, 0, 1,
-2.036937, -0.6792857, -1.272129, 1, 0.1215686, 0, 1,
-2.010742, 0.1787919, -3.740789, 1, 0.1254902, 0, 1,
-1.951937, -1.491139, -4.625101, 1, 0.1333333, 0, 1,
-1.946867, 0.8896892, -0.7753792, 1, 0.1372549, 0, 1,
-1.94267, -0.5613761, -2.009214, 1, 0.145098, 0, 1,
-1.931357, 0.4495539, -0.9167691, 1, 0.1490196, 0, 1,
-1.92689, 1.246304, -0.5035645, 1, 0.1568628, 0, 1,
-1.920953, -0.6408631, 0.7144021, 1, 0.1607843, 0, 1,
-1.917176, -0.1104436, -2.167455, 1, 0.1686275, 0, 1,
-1.909691, 0.3974397, 0.1696241, 1, 0.172549, 0, 1,
-1.908937, 0.0699221, -0.04909493, 1, 0.1803922, 0, 1,
-1.90149, -0.9171147, -0.8631974, 1, 0.1843137, 0, 1,
-1.900112, 1.424563, -2.979877, 1, 0.1921569, 0, 1,
-1.830953, 0.3173097, -1.733697, 1, 0.1960784, 0, 1,
-1.817063, -2.389397, -3.238568, 1, 0.2039216, 0, 1,
-1.806741, 0.5004972, -1.147528, 1, 0.2117647, 0, 1,
-1.772994, -0.669816, -3.160949, 1, 0.2156863, 0, 1,
-1.768237, 1.127775, 0.4093387, 1, 0.2235294, 0, 1,
-1.76549, 2.028043, -0.7900686, 1, 0.227451, 0, 1,
-1.751595, 0.05194007, -2.045, 1, 0.2352941, 0, 1,
-1.742101, 0.3749643, -2.135607, 1, 0.2392157, 0, 1,
-1.738962, 0.9156985, -0.9467893, 1, 0.2470588, 0, 1,
-1.723539, -0.3574299, -0.8507273, 1, 0.2509804, 0, 1,
-1.717473, 0.6819209, 0.2265938, 1, 0.2588235, 0, 1,
-1.70388, -0.3846326, -2.624164, 1, 0.2627451, 0, 1,
-1.699699, -0.1925603, -1.678423, 1, 0.2705882, 0, 1,
-1.696597, -0.2732605, -0.3795527, 1, 0.2745098, 0, 1,
-1.687583, -2.395096, -2.176981, 1, 0.282353, 0, 1,
-1.64716, 0.1582191, -2.679977, 1, 0.2862745, 0, 1,
-1.641394, -0.4562511, -1.528653, 1, 0.2941177, 0, 1,
-1.638994, 0.423178, -2.653434, 1, 0.3019608, 0, 1,
-1.633563, -1.242285, -3.065178, 1, 0.3058824, 0, 1,
-1.622484, 0.438092, -0.8758695, 1, 0.3137255, 0, 1,
-1.622452, -1.290035, -1.897254, 1, 0.3176471, 0, 1,
-1.620234, -0.4195082, -2.59906, 1, 0.3254902, 0, 1,
-1.614393, 0.86738, -0.3607126, 1, 0.3294118, 0, 1,
-1.609827, -0.008149009, -1.285316, 1, 0.3372549, 0, 1,
-1.601849, 0.8944606, 0.07105258, 1, 0.3411765, 0, 1,
-1.600603, -0.7850505, -1.239217, 1, 0.3490196, 0, 1,
-1.597715, 1.568575, -0.294767, 1, 0.3529412, 0, 1,
-1.590443, -1.339446, -4.405411, 1, 0.3607843, 0, 1,
-1.587874, -0.3166542, -2.896572, 1, 0.3647059, 0, 1,
-1.578309, -0.8078002, -2.447593, 1, 0.372549, 0, 1,
-1.572006, -0.5567529, -1.73436, 1, 0.3764706, 0, 1,
-1.569672, 1.752678, 0.8828946, 1, 0.3843137, 0, 1,
-1.560075, -0.2717991, -3.086667, 1, 0.3882353, 0, 1,
-1.557331, -0.5305216, -0.228463, 1, 0.3960784, 0, 1,
-1.546273, -0.04403197, -3.255992, 1, 0.4039216, 0, 1,
-1.527574, 1.139878, -0.997044, 1, 0.4078431, 0, 1,
-1.520047, 0.9844223, 0.9245354, 1, 0.4156863, 0, 1,
-1.516349, 0.2263671, 0.2543307, 1, 0.4196078, 0, 1,
-1.495882, -1.240628, -4.527208, 1, 0.427451, 0, 1,
-1.484005, 1.343674, -1.790025, 1, 0.4313726, 0, 1,
-1.483365, 0.5811268, -2.538831, 1, 0.4392157, 0, 1,
-1.480348, 0.5662004, -0.2249391, 1, 0.4431373, 0, 1,
-1.47903, 0.3854998, -2.964803, 1, 0.4509804, 0, 1,
-1.472222, -2.111923, -1.048497, 1, 0.454902, 0, 1,
-1.4701, -0.05834985, -3.153361, 1, 0.4627451, 0, 1,
-1.469109, -1.134291, -2.354138, 1, 0.4666667, 0, 1,
-1.464995, 0.8445352, -2.651022, 1, 0.4745098, 0, 1,
-1.463802, 1.716361, -2.140181, 1, 0.4784314, 0, 1,
-1.460734, 0.2063378, -1.323402, 1, 0.4862745, 0, 1,
-1.453064, 1.42146, -1.888571, 1, 0.4901961, 0, 1,
-1.441352, 1.120225, 0.1524108, 1, 0.4980392, 0, 1,
-1.438504, 0.9422345, -0.4846517, 1, 0.5058824, 0, 1,
-1.432611, -1.591337, -2.941193, 1, 0.509804, 0, 1,
-1.428723, -0.1282098, -1.621098, 1, 0.5176471, 0, 1,
-1.423685, 0.04954734, -0.7465992, 1, 0.5215687, 0, 1,
-1.406843, 0.6537395, -2.132069, 1, 0.5294118, 0, 1,
-1.391368, -0.08320704, -1.402785, 1, 0.5333334, 0, 1,
-1.375432, -2.709774, -1.887054, 1, 0.5411765, 0, 1,
-1.353687, 0.04017555, -1.527412, 1, 0.5450981, 0, 1,
-1.343449, 0.5018367, -1.509528, 1, 0.5529412, 0, 1,
-1.338379, -1.066103, -0.7111154, 1, 0.5568628, 0, 1,
-1.337196, -0.5773408, -1.861402, 1, 0.5647059, 0, 1,
-1.313913, -1.545157, -1.947714, 1, 0.5686275, 0, 1,
-1.312085, 0.5725256, -0.7247132, 1, 0.5764706, 0, 1,
-1.306182, -0.696752, -1.041358, 1, 0.5803922, 0, 1,
-1.297, 0.6537179, -1.629113, 1, 0.5882353, 0, 1,
-1.295888, 1.189812, -0.7350093, 1, 0.5921569, 0, 1,
-1.293718, -1.484097, -2.569339, 1, 0.6, 0, 1,
-1.286382, 1.970782, -0.4016111, 1, 0.6078432, 0, 1,
-1.283551, 1.369728, -0.2135315, 1, 0.6117647, 0, 1,
-1.28256, 0.6120911, -1.366016, 1, 0.6196079, 0, 1,
-1.277906, -0.202148, -1.90563, 1, 0.6235294, 0, 1,
-1.246014, 1.008986, 0.9747159, 1, 0.6313726, 0, 1,
-1.242653, 0.7872724, 0.2805779, 1, 0.6352941, 0, 1,
-1.240106, 1.258609, -0.7355617, 1, 0.6431373, 0, 1,
-1.232939, 0.4354853, -0.5482751, 1, 0.6470588, 0, 1,
-1.214258, -1.338085, -1.078821, 1, 0.654902, 0, 1,
-1.208791, 0.8361329, -0.8826514, 1, 0.6588235, 0, 1,
-1.208503, 0.3973935, 0.2425667, 1, 0.6666667, 0, 1,
-1.203298, -1.517318, -3.181749, 1, 0.6705883, 0, 1,
-1.199947, 1.955134, -1.15055, 1, 0.6784314, 0, 1,
-1.199335, 0.08212187, -1.489968, 1, 0.682353, 0, 1,
-1.188086, 0.5870686, -3.038228, 1, 0.6901961, 0, 1,
-1.183031, -1.221735, -3.184596, 1, 0.6941177, 0, 1,
-1.182466, 0.6761755, -0.309069, 1, 0.7019608, 0, 1,
-1.177079, 0.5678439, -4.170039, 1, 0.7098039, 0, 1,
-1.171501, -1.349519, -3.719634, 1, 0.7137255, 0, 1,
-1.153497, -2.021363, -2.479537, 1, 0.7215686, 0, 1,
-1.148943, 0.8706778, -1.200458, 1, 0.7254902, 0, 1,
-1.147211, -1.988709, -1.997432, 1, 0.7333333, 0, 1,
-1.1452, -1.11068, -1.825219, 1, 0.7372549, 0, 1,
-1.133621, 1.055197, -0.6530337, 1, 0.7450981, 0, 1,
-1.122354, 2.579522, 0.07269663, 1, 0.7490196, 0, 1,
-1.122226, 1.291108, 1.339401, 1, 0.7568628, 0, 1,
-1.121927, 0.8540333, -2.764154, 1, 0.7607843, 0, 1,
-1.12167, -1.544949, -1.099371, 1, 0.7686275, 0, 1,
-1.119345, -0.3718154, -0.6945314, 1, 0.772549, 0, 1,
-1.117557, -0.9619758, -2.189382, 1, 0.7803922, 0, 1,
-1.089009, 0.6742535, -1.950997, 1, 0.7843137, 0, 1,
-1.085932, 0.1183521, -1.198135, 1, 0.7921569, 0, 1,
-1.083228, 0.3202061, -0.256205, 1, 0.7960784, 0, 1,
-1.080137, -0.09564043, -2.109758, 1, 0.8039216, 0, 1,
-1.063277, -1.100766, -3.117852, 1, 0.8117647, 0, 1,
-1.056523, 1.095568, 0.08840797, 1, 0.8156863, 0, 1,
-1.048, 0.784965, -2.010282, 1, 0.8235294, 0, 1,
-1.047114, -1.297381, -1.241584, 1, 0.827451, 0, 1,
-1.045084, 0.2455747, -1.064645, 1, 0.8352941, 0, 1,
-1.044825, 0.4805685, 0.6184824, 1, 0.8392157, 0, 1,
-1.037606, 0.196219, -2.702139, 1, 0.8470588, 0, 1,
-1.036046, -0.3232931, -4.620466, 1, 0.8509804, 0, 1,
-1.028882, 0.08998717, -1.745828, 1, 0.8588235, 0, 1,
-1.02667, -1.510625, -2.142162, 1, 0.8627451, 0, 1,
-1.023135, 1.325284, -0.4032995, 1, 0.8705882, 0, 1,
-1.019758, 0.4231721, -1.287973, 1, 0.8745098, 0, 1,
-1.019533, 0.6777, -0.5195397, 1, 0.8823529, 0, 1,
-1.014917, 2.352545, -3.116676, 1, 0.8862745, 0, 1,
-1.014649, 0.1020309, 2.353176, 1, 0.8941177, 0, 1,
-1.002645, -0.6269422, -0.1635907, 1, 0.8980392, 0, 1,
-1.002565, -0.5805959, -2.194678, 1, 0.9058824, 0, 1,
-0.9975744, -0.2851771, -1.950601, 1, 0.9137255, 0, 1,
-0.9949503, -1.128959, -1.146818, 1, 0.9176471, 0, 1,
-0.9903244, -0.5073621, 0.3351845, 1, 0.9254902, 0, 1,
-0.9800012, 1.135592, -0.7988049, 1, 0.9294118, 0, 1,
-0.9785622, -0.9328857, -0.6800638, 1, 0.9372549, 0, 1,
-0.9776717, 0.190326, -1.406935, 1, 0.9411765, 0, 1,
-0.9756899, 1.175179, -1.003231, 1, 0.9490196, 0, 1,
-0.9745334, 0.01975811, -0.1610706, 1, 0.9529412, 0, 1,
-0.9578538, -1.37957, -1.943642, 1, 0.9607843, 0, 1,
-0.9572309, -1.071069, -2.312154, 1, 0.9647059, 0, 1,
-0.9559185, 0.4723286, -1.146028, 1, 0.972549, 0, 1,
-0.9430138, -1.677641, -0.8941815, 1, 0.9764706, 0, 1,
-0.9397584, -0.9438402, -3.11611, 1, 0.9843137, 0, 1,
-0.9339546, -1.085157, -0.7010649, 1, 0.9882353, 0, 1,
-0.928495, 1.076394, -2.708668, 1, 0.9960784, 0, 1,
-0.9256974, -1.21089, -1.006824, 0.9960784, 1, 0, 1,
-0.9153957, 0.8036968, -2.511911, 0.9921569, 1, 0, 1,
-0.9144062, -0.2186771, -0.04954758, 0.9843137, 1, 0, 1,
-0.9042246, 0.1211303, -2.333894, 0.9803922, 1, 0, 1,
-0.8926876, 1.191041, -1.010646, 0.972549, 1, 0, 1,
-0.8899708, 1.961866, -0.3760159, 0.9686275, 1, 0, 1,
-0.8843977, -0.7155687, -1.953725, 0.9607843, 1, 0, 1,
-0.8798677, 1.060256, -0.08509585, 0.9568627, 1, 0, 1,
-0.8731862, -0.373843, -0.3886397, 0.9490196, 1, 0, 1,
-0.8714555, 0.107219, -0.1563936, 0.945098, 1, 0, 1,
-0.8706995, 0.8101048, -1.550816, 0.9372549, 1, 0, 1,
-0.8666064, 0.2356965, -1.494787, 0.9333333, 1, 0, 1,
-0.8660631, -1.553829, -2.416679, 0.9254902, 1, 0, 1,
-0.8639697, -0.2845586, -3.71831, 0.9215686, 1, 0, 1,
-0.8622321, -1.026263, -2.412002, 0.9137255, 1, 0, 1,
-0.8590457, -1.887624, -2.706454, 0.9098039, 1, 0, 1,
-0.8574179, 0.4957001, -1.16597, 0.9019608, 1, 0, 1,
-0.8573393, -0.3800108, -2.789529, 0.8941177, 1, 0, 1,
-0.8496647, -0.9067094, -3.068412, 0.8901961, 1, 0, 1,
-0.8488725, -0.6796725, -3.624918, 0.8823529, 1, 0, 1,
-0.8463271, -0.9566489, -2.634105, 0.8784314, 1, 0, 1,
-0.843955, 0.3979287, -2.495679, 0.8705882, 1, 0, 1,
-0.8437176, 0.1868916, -1.730739, 0.8666667, 1, 0, 1,
-0.8432404, -0.825982, -0.9503304, 0.8588235, 1, 0, 1,
-0.8408859, 0.8390054, -0.6982523, 0.854902, 1, 0, 1,
-0.8180638, 1.383792, 0.533143, 0.8470588, 1, 0, 1,
-0.8113905, 1.416289, -2.300988, 0.8431373, 1, 0, 1,
-0.8103898, -2.450068, -3.8955, 0.8352941, 1, 0, 1,
-0.8071114, 1.246244, -1.669839, 0.8313726, 1, 0, 1,
-0.8066322, 0.4663113, -1.648735, 0.8235294, 1, 0, 1,
-0.8054107, -0.756711, -3.271091, 0.8196079, 1, 0, 1,
-0.8022658, -0.8455933, -2.821136, 0.8117647, 1, 0, 1,
-0.7852157, -0.6738433, -2.498782, 0.8078431, 1, 0, 1,
-0.7816564, -0.2387043, -3.182596, 0.8, 1, 0, 1,
-0.7805142, -1.070431, -3.195995, 0.7921569, 1, 0, 1,
-0.7777549, 1.531745, -1.137784, 0.7882353, 1, 0, 1,
-0.7686131, 0.01931172, -1.721355, 0.7803922, 1, 0, 1,
-0.7666372, 0.7166204, -3.145142, 0.7764706, 1, 0, 1,
-0.7646258, 0.7866076, -0.04601036, 0.7686275, 1, 0, 1,
-0.7614437, 0.8952794, -2.22815, 0.7647059, 1, 0, 1,
-0.7432014, -0.5415015, -2.806544, 0.7568628, 1, 0, 1,
-0.7423108, -0.5299866, -3.504096, 0.7529412, 1, 0, 1,
-0.7407086, -1.086124, -3.778572, 0.7450981, 1, 0, 1,
-0.7399694, 0.7607316, -1.879729, 0.7411765, 1, 0, 1,
-0.7354857, 0.5100202, -1.736238, 0.7333333, 1, 0, 1,
-0.7282275, 0.7916904, 0.7729367, 0.7294118, 1, 0, 1,
-0.7228034, 1.963112, -0.8154176, 0.7215686, 1, 0, 1,
-0.7225284, -1.670897, -3.579612, 0.7176471, 1, 0, 1,
-0.7222366, 0.1999959, -0.9758546, 0.7098039, 1, 0, 1,
-0.7176201, 0.08953394, -2.514737, 0.7058824, 1, 0, 1,
-0.7160701, -0.8529603, -1.781761, 0.6980392, 1, 0, 1,
-0.7078387, 0.6052234, -0.5687894, 0.6901961, 1, 0, 1,
-0.6880288, -0.607076, -1.594309, 0.6862745, 1, 0, 1,
-0.6824765, 0.4503421, -1.795403, 0.6784314, 1, 0, 1,
-0.6703955, 0.1895102, -1.388801, 0.6745098, 1, 0, 1,
-0.6670055, 1.065748, 0.331034, 0.6666667, 1, 0, 1,
-0.6595175, -0.006659251, -2.176959, 0.6627451, 1, 0, 1,
-0.6577666, -0.6653886, -3.507111, 0.654902, 1, 0, 1,
-0.6555776, -1.42892, -3.251034, 0.6509804, 1, 0, 1,
-0.6555445, -0.3182567, -2.455991, 0.6431373, 1, 0, 1,
-0.6491023, -0.1682345, -1.127987, 0.6392157, 1, 0, 1,
-0.6478104, -0.9847406, -1.749757, 0.6313726, 1, 0, 1,
-0.6453121, -0.4156063, -1.961735, 0.627451, 1, 0, 1,
-0.6443017, -1.323539, -2.397062, 0.6196079, 1, 0, 1,
-0.6413518, 0.03369053, -3.221357, 0.6156863, 1, 0, 1,
-0.6412553, 0.2506577, -1.766286, 0.6078432, 1, 0, 1,
-0.640808, -0.4755589, -0.8376014, 0.6039216, 1, 0, 1,
-0.6396015, -0.7258567, -2.710499, 0.5960785, 1, 0, 1,
-0.6312848, 2.234759, 1.263873, 0.5882353, 1, 0, 1,
-0.6231024, 0.716871, -0.2050532, 0.5843138, 1, 0, 1,
-0.6198102, 3.311671, -1.773912, 0.5764706, 1, 0, 1,
-0.6179833, -0.6363779, -0.7422897, 0.572549, 1, 0, 1,
-0.6164889, 0.1204342, 0.3117365, 0.5647059, 1, 0, 1,
-0.6161746, -0.595715, -3.458338, 0.5607843, 1, 0, 1,
-0.6113137, 2.119407, -0.8466736, 0.5529412, 1, 0, 1,
-0.6048369, 1.09643, -1.84, 0.5490196, 1, 0, 1,
-0.596397, -0.6221794, -1.743067, 0.5411765, 1, 0, 1,
-0.5961053, -0.5852793, -2.831143, 0.5372549, 1, 0, 1,
-0.5940498, 0.2511871, -0.8552804, 0.5294118, 1, 0, 1,
-0.5906824, -1.227621, -1.087975, 0.5254902, 1, 0, 1,
-0.5905253, -0.3273847, -2.368711, 0.5176471, 1, 0, 1,
-0.5901575, -0.8394462, -2.580999, 0.5137255, 1, 0, 1,
-0.5892566, -0.9582745, -1.798931, 0.5058824, 1, 0, 1,
-0.587729, 0.1302607, -0.9841189, 0.5019608, 1, 0, 1,
-0.5718942, 0.3691946, -1.320659, 0.4941176, 1, 0, 1,
-0.5702676, -1.058233, -2.708239, 0.4862745, 1, 0, 1,
-0.5681095, 0.8246024, -0.8843307, 0.4823529, 1, 0, 1,
-0.5658912, 0.9915243, -0.3893887, 0.4745098, 1, 0, 1,
-0.5629517, 0.4063485, -1.561619, 0.4705882, 1, 0, 1,
-0.5613641, -0.06215101, -2.994644, 0.4627451, 1, 0, 1,
-0.553836, -1.526077, -2.858242, 0.4588235, 1, 0, 1,
-0.5471234, -0.5338475, -2.617501, 0.4509804, 1, 0, 1,
-0.54702, -0.5496066, -1.680364, 0.4470588, 1, 0, 1,
-0.5432999, -0.3814887, -2.553066, 0.4392157, 1, 0, 1,
-0.541127, 0.250542, -0.9526758, 0.4352941, 1, 0, 1,
-0.5381772, -0.7382236, -3.721441, 0.427451, 1, 0, 1,
-0.5356495, 0.3409213, 0.204852, 0.4235294, 1, 0, 1,
-0.5346524, 0.9347185, -0.8398967, 0.4156863, 1, 0, 1,
-0.5322587, 1.294193, -0.5658771, 0.4117647, 1, 0, 1,
-0.5282853, 0.93748, -0.5261533, 0.4039216, 1, 0, 1,
-0.5272577, -0.4095785, -4.331479, 0.3960784, 1, 0, 1,
-0.5233918, 0.3955203, 1.458887, 0.3921569, 1, 0, 1,
-0.5177544, -0.2759374, -1.585036, 0.3843137, 1, 0, 1,
-0.5163202, -0.7068014, -3.249924, 0.3803922, 1, 0, 1,
-0.5158032, -1.328706, -2.836542, 0.372549, 1, 0, 1,
-0.5157168, -1.229133, -2.139191, 0.3686275, 1, 0, 1,
-0.5090172, 0.8374789, 0.6815601, 0.3607843, 1, 0, 1,
-0.5030999, -0.1300325, -2.48278, 0.3568628, 1, 0, 1,
-0.5002201, 0.4341024, -0.9880171, 0.3490196, 1, 0, 1,
-0.4999074, -1.45945, -2.077238, 0.345098, 1, 0, 1,
-0.4998871, 1.493527, -0.2364747, 0.3372549, 1, 0, 1,
-0.4990582, -0.03995823, -1.189718, 0.3333333, 1, 0, 1,
-0.4955819, 0.5787631, 0.6594849, 0.3254902, 1, 0, 1,
-0.4953505, -2.830606, -2.340106, 0.3215686, 1, 0, 1,
-0.4951469, 2.309676, 0.4226305, 0.3137255, 1, 0, 1,
-0.4929693, -0.5077131, -2.420905, 0.3098039, 1, 0, 1,
-0.4912716, 0.6701553, -1.224309, 0.3019608, 1, 0, 1,
-0.4877721, -0.1086535, -2.020445, 0.2941177, 1, 0, 1,
-0.487497, -0.4090727, -3.119681, 0.2901961, 1, 0, 1,
-0.4849477, 0.04813964, -1.969223, 0.282353, 1, 0, 1,
-0.4843161, 1.433613, 0.01441042, 0.2784314, 1, 0, 1,
-0.4774072, 1.034981, -1.143264, 0.2705882, 1, 0, 1,
-0.474867, 0.5103925, -0.01342186, 0.2666667, 1, 0, 1,
-0.4738038, -1.017683, -2.712076, 0.2588235, 1, 0, 1,
-0.4734995, 0.2650413, -1.909385, 0.254902, 1, 0, 1,
-0.4723568, -0.09937526, -1.419708, 0.2470588, 1, 0, 1,
-0.4701911, -0.02960626, -1.119924, 0.2431373, 1, 0, 1,
-0.463357, -0.1885747, -2.127111, 0.2352941, 1, 0, 1,
-0.462411, -0.8275514, -3.306885, 0.2313726, 1, 0, 1,
-0.460253, 1.711626, -0.2133941, 0.2235294, 1, 0, 1,
-0.4427429, 0.8408151, -0.4323234, 0.2196078, 1, 0, 1,
-0.441649, 0.1474687, -1.861541, 0.2117647, 1, 0, 1,
-0.4404993, -0.3765438, -2.153795, 0.2078431, 1, 0, 1,
-0.4374275, 0.7375561, -1.55792, 0.2, 1, 0, 1,
-0.4366244, 0.7184605, 0.3770473, 0.1921569, 1, 0, 1,
-0.4342986, 0.01657752, -2.793998, 0.1882353, 1, 0, 1,
-0.4298807, 0.1198361, -0.05683751, 0.1803922, 1, 0, 1,
-0.4258412, -1.046584, -2.754683, 0.1764706, 1, 0, 1,
-0.4253879, 0.3480233, -1.33278, 0.1686275, 1, 0, 1,
-0.4212303, 0.7142466, -0.6164477, 0.1647059, 1, 0, 1,
-0.4204151, 1.684894, -0.5240057, 0.1568628, 1, 0, 1,
-0.4197054, 1.603483, 2.826528, 0.1529412, 1, 0, 1,
-0.4187755, -1.630781, -3.602921, 0.145098, 1, 0, 1,
-0.3977546, 0.2513369, -1.597415, 0.1411765, 1, 0, 1,
-0.3966708, 1.190206, -0.1670501, 0.1333333, 1, 0, 1,
-0.3906319, 0.04769032, -1.290183, 0.1294118, 1, 0, 1,
-0.3900906, 0.9794781, 0.6180428, 0.1215686, 1, 0, 1,
-0.3900894, 1.063023, -0.8939124, 0.1176471, 1, 0, 1,
-0.3895241, -0.7563297, -2.559204, 0.1098039, 1, 0, 1,
-0.3865418, -0.4463091, -3.707187, 0.1058824, 1, 0, 1,
-0.3846639, -1.263951, -2.838603, 0.09803922, 1, 0, 1,
-0.3825665, -1.218179, -2.796609, 0.09019608, 1, 0, 1,
-0.3823498, -0.1210201, -0.3011324, 0.08627451, 1, 0, 1,
-0.3813155, -0.1763899, -1.184971, 0.07843138, 1, 0, 1,
-0.3794978, 1.150288, -0.8151746, 0.07450981, 1, 0, 1,
-0.3788873, -0.05370907, -2.491024, 0.06666667, 1, 0, 1,
-0.376377, -1.744651, -3.021169, 0.0627451, 1, 0, 1,
-0.375397, -0.4943689, -2.265876, 0.05490196, 1, 0, 1,
-0.3744824, -0.2402562, 0.9055057, 0.05098039, 1, 0, 1,
-0.3739904, 0.9057623, 0.7541912, 0.04313726, 1, 0, 1,
-0.3718812, 0.03113232, -1.161196, 0.03921569, 1, 0, 1,
-0.3700282, 0.1224661, -2.237959, 0.03137255, 1, 0, 1,
-0.3689924, -1.292649, -2.504465, 0.02745098, 1, 0, 1,
-0.3613439, 0.5333145, 0.3722663, 0.01960784, 1, 0, 1,
-0.3586847, -1.311583, -3.147825, 0.01568628, 1, 0, 1,
-0.358125, -0.4507683, -2.924157, 0.007843138, 1, 0, 1,
-0.354161, 0.2339383, 0.7859427, 0.003921569, 1, 0, 1,
-0.3504584, 1.642972, -1.359722, 0, 1, 0.003921569, 1,
-0.345857, -0.1411192, -3.400175, 0, 1, 0.01176471, 1,
-0.3440878, 0.8854645, -0.3317444, 0, 1, 0.01568628, 1,
-0.3380277, 0.9051078, 0.06396251, 0, 1, 0.02352941, 1,
-0.3345312, -1.055684, -2.389632, 0, 1, 0.02745098, 1,
-0.3294324, 0.5673975, 0.3154405, 0, 1, 0.03529412, 1,
-0.3287092, 0.3364302, 0.4934633, 0, 1, 0.03921569, 1,
-0.3251214, -1.252374, -2.949839, 0, 1, 0.04705882, 1,
-0.3202137, -0.8284112, -2.362216, 0, 1, 0.05098039, 1,
-0.3122911, 0.624441, -0.4669144, 0, 1, 0.05882353, 1,
-0.3053146, 1.193904, -1.259804, 0, 1, 0.0627451, 1,
-0.3050205, -0.06682957, -1.704341, 0, 1, 0.07058824, 1,
-0.3027747, -0.7741965, -2.174622, 0, 1, 0.07450981, 1,
-0.3000066, -1.296602, -2.571698, 0, 1, 0.08235294, 1,
-0.2997728, -0.6269102, -1.410657, 0, 1, 0.08627451, 1,
-0.2978655, 0.1998338, -1.04007, 0, 1, 0.09411765, 1,
-0.2931377, -0.3069489, -2.427754, 0, 1, 0.1019608, 1,
-0.2926432, -1.698396, -2.129591, 0, 1, 0.1058824, 1,
-0.2897198, -0.6115335, -3.106805, 0, 1, 0.1137255, 1,
-0.2895812, 1.338136, 2.127628, 0, 1, 0.1176471, 1,
-0.2857528, 0.3796366, 0.5472022, 0, 1, 0.1254902, 1,
-0.285057, 1.229811, -0.9006151, 0, 1, 0.1294118, 1,
-0.2836551, 0.7533944, 0.3798377, 0, 1, 0.1372549, 1,
-0.2816785, 1.840811, -0.4025451, 0, 1, 0.1411765, 1,
-0.2798994, -0.4188556, -2.165726, 0, 1, 0.1490196, 1,
-0.2718316, -0.6031526, -3.643636, 0, 1, 0.1529412, 1,
-0.2716014, 0.7716244, -0.8171424, 0, 1, 0.1607843, 1,
-0.2694877, 1.027167, 0.3272698, 0, 1, 0.1647059, 1,
-0.2689206, 0.4617104, 0.05728864, 0, 1, 0.172549, 1,
-0.268387, -0.6481393, -4.179207, 0, 1, 0.1764706, 1,
-0.268181, 0.9136041, -1.508346, 0, 1, 0.1843137, 1,
-0.2669294, -1.229764, -2.149723, 0, 1, 0.1882353, 1,
-0.2630266, -0.9951804, -2.762691, 0, 1, 0.1960784, 1,
-0.2601265, -0.8930498, -2.524508, 0, 1, 0.2039216, 1,
-0.2573431, -0.3332818, -2.250371, 0, 1, 0.2078431, 1,
-0.2496839, 0.0895928, -1.062467, 0, 1, 0.2156863, 1,
-0.2387353, 0.8850287, -1.273912, 0, 1, 0.2196078, 1,
-0.2383488, 0.8062523, 0.897259, 0, 1, 0.227451, 1,
-0.2380516, 0.4594752, -1.182096, 0, 1, 0.2313726, 1,
-0.2349339, -0.02901111, -2.41514, 0, 1, 0.2392157, 1,
-0.2333544, 0.5904792, -1.121463, 0, 1, 0.2431373, 1,
-0.2316179, 0.807845, 0.1409276, 0, 1, 0.2509804, 1,
-0.2283345, -0.7131228, -3.721922, 0, 1, 0.254902, 1,
-0.2229671, 0.5747082, -1.38616, 0, 1, 0.2627451, 1,
-0.222746, -0.01179474, -0.6618862, 0, 1, 0.2666667, 1,
-0.2206482, -0.09681375, -1.96622, 0, 1, 0.2745098, 1,
-0.2171588, -1.111147, -2.535469, 0, 1, 0.2784314, 1,
-0.2165168, -0.7070985, -2.235312, 0, 1, 0.2862745, 1,
-0.216484, -0.4088504, -3.064878, 0, 1, 0.2901961, 1,
-0.2155872, -1.10891, -2.550416, 0, 1, 0.2980392, 1,
-0.2132682, -0.7037511, -2.906224, 0, 1, 0.3058824, 1,
-0.2121807, 0.1326161, -0.6542107, 0, 1, 0.3098039, 1,
-0.2075309, -0.578477, -2.411358, 0, 1, 0.3176471, 1,
-0.2033447, -0.739211, -4.448103, 0, 1, 0.3215686, 1,
-0.2007087, -1.470613, -4.449826, 0, 1, 0.3294118, 1,
-0.1992967, -0.3876444, -2.54904, 0, 1, 0.3333333, 1,
-0.198435, -2.274549, -3.092852, 0, 1, 0.3411765, 1,
-0.1949273, -1.11065, -3.375004, 0, 1, 0.345098, 1,
-0.1919673, 0.05162179, -1.65086, 0, 1, 0.3529412, 1,
-0.18992, -0.8451724, -3.759017, 0, 1, 0.3568628, 1,
-0.1892231, 0.3879891, -1.499548, 0, 1, 0.3647059, 1,
-0.1885551, -0.626899, -2.417983, 0, 1, 0.3686275, 1,
-0.1872266, -1.121552, -1.203495, 0, 1, 0.3764706, 1,
-0.1869866, 0.8840665, 0.7088168, 0, 1, 0.3803922, 1,
-0.1862968, -0.1514446, -0.6087412, 0, 1, 0.3882353, 1,
-0.1853642, -0.2952541, -2.059902, 0, 1, 0.3921569, 1,
-0.1827421, -0.02152704, -0.9259486, 0, 1, 0.4, 1,
-0.1816535, 0.3965053, 0.4321833, 0, 1, 0.4078431, 1,
-0.1772772, 0.5964285, 0.3755704, 0, 1, 0.4117647, 1,
-0.1742419, 0.2025363, -1.152072, 0, 1, 0.4196078, 1,
-0.171988, 0.6864676, -0.4652293, 0, 1, 0.4235294, 1,
-0.1713813, -0.6881772, -2.567991, 0, 1, 0.4313726, 1,
-0.1707356, -0.4253624, -2.581886, 0, 1, 0.4352941, 1,
-0.1684607, -0.905802, -1.796068, 0, 1, 0.4431373, 1,
-0.1683559, 0.14943, -1.315117, 0, 1, 0.4470588, 1,
-0.165448, -0.2092521, -2.63847, 0, 1, 0.454902, 1,
-0.1627964, 0.1309097, -1.650707, 0, 1, 0.4588235, 1,
-0.1558032, 1.266122, 0.911603, 0, 1, 0.4666667, 1,
-0.1556799, 0.1748954, -0.8419708, 0, 1, 0.4705882, 1,
-0.1549901, 0.9315287, -0.7215337, 0, 1, 0.4784314, 1,
-0.1547741, 1.642226, 1.004684, 0, 1, 0.4823529, 1,
-0.1537164, 2.033671, -0.09729742, 0, 1, 0.4901961, 1,
-0.1536885, 0.9958283, -0.09561756, 0, 1, 0.4941176, 1,
-0.1534564, -0.1876244, -1.295184, 0, 1, 0.5019608, 1,
-0.1502028, 0.8553364, -0.7976223, 0, 1, 0.509804, 1,
-0.1474162, 1.001766, 1.636814, 0, 1, 0.5137255, 1,
-0.1461647, 0.5818874, -0.9178619, 0, 1, 0.5215687, 1,
-0.14351, 0.3354209, 0.9540023, 0, 1, 0.5254902, 1,
-0.143477, 1.925835, -1.054205, 0, 1, 0.5333334, 1,
-0.1363083, -0.4863262, -3.052428, 0, 1, 0.5372549, 1,
-0.1336739, -0.2185346, -3.135107, 0, 1, 0.5450981, 1,
-0.1320575, -0.3651738, -2.501314, 0, 1, 0.5490196, 1,
-0.128626, 0.8820493, -0.6963359, 0, 1, 0.5568628, 1,
-0.1283201, -2.721962, -2.10131, 0, 1, 0.5607843, 1,
-0.1279237, -0.1985519, -1.40256, 0, 1, 0.5686275, 1,
-0.1256759, -1.281445, -4.225085, 0, 1, 0.572549, 1,
-0.1256212, 0.2929968, -1.90405, 0, 1, 0.5803922, 1,
-0.1173992, 0.03244802, -1.87056, 0, 1, 0.5843138, 1,
-0.1149753, 0.1982916, -1.46139, 0, 1, 0.5921569, 1,
-0.1149717, 1.18105, -0.01240935, 0, 1, 0.5960785, 1,
-0.114414, -1.062908, -2.018151, 0, 1, 0.6039216, 1,
-0.1124143, 0.1543786, 0.1432747, 0, 1, 0.6117647, 1,
-0.1109299, -0.9696539, -3.056004, 0, 1, 0.6156863, 1,
-0.1105705, 0.1875982, -0.5124162, 0, 1, 0.6235294, 1,
-0.1029933, 0.484756, 0.3263102, 0, 1, 0.627451, 1,
-0.1019423, 0.4462755, -1.773334, 0, 1, 0.6352941, 1,
-0.09976491, 0.07271611, -0.3144458, 0, 1, 0.6392157, 1,
-0.09518833, -0.5068444, -3.89925, 0, 1, 0.6470588, 1,
-0.09390876, 0.952126, 0.3966909, 0, 1, 0.6509804, 1,
-0.09099863, 0.8601324, -0.2452921, 0, 1, 0.6588235, 1,
-0.08997833, -0.3265427, -4.095613, 0, 1, 0.6627451, 1,
-0.08780706, 0.4507979, 0.3772858, 0, 1, 0.6705883, 1,
-0.08449399, -0.2482517, -3.810508, 0, 1, 0.6745098, 1,
-0.082016, -0.9439542, -4.691023, 0, 1, 0.682353, 1,
-0.08198044, 0.2537322, 0.09476937, 0, 1, 0.6862745, 1,
-0.08080798, -0.07263757, -2.536646, 0, 1, 0.6941177, 1,
-0.07955589, 1.70625, 2.072236, 0, 1, 0.7019608, 1,
-0.07777379, -1.013895, -2.718879, 0, 1, 0.7058824, 1,
-0.07635183, 0.4450572, -2.288329, 0, 1, 0.7137255, 1,
-0.06760084, 0.230184, -0.5001387, 0, 1, 0.7176471, 1,
-0.06676499, 0.5036467, 1.066698, 0, 1, 0.7254902, 1,
-0.06660166, 0.002997811, -1.74706, 0, 1, 0.7294118, 1,
-0.06227325, -0.3736327, -5.432613, 0, 1, 0.7372549, 1,
-0.05866712, -1.433366, -2.258731, 0, 1, 0.7411765, 1,
-0.05722459, -1.024108, -1.930639, 0, 1, 0.7490196, 1,
-0.05439169, 0.8128166, -0.6041321, 0, 1, 0.7529412, 1,
-0.05430512, 1.038459, 0.162414, 0, 1, 0.7607843, 1,
-0.05034018, -1.188, -0.3262006, 0, 1, 0.7647059, 1,
-0.04925724, 1.697333, -0.1520344, 0, 1, 0.772549, 1,
-0.04854077, 1.008918, -0.2677188, 0, 1, 0.7764706, 1,
-0.04549586, 1.64967, 1.415719, 0, 1, 0.7843137, 1,
-0.04548458, -0.3039871, -1.353311, 0, 1, 0.7882353, 1,
-0.04203667, 0.9726142, -0.1723721, 0, 1, 0.7960784, 1,
-0.04118293, -0.7102718, -4.62033, 0, 1, 0.8039216, 1,
-0.04015959, -1.70956, -1.722464, 0, 1, 0.8078431, 1,
-0.04010648, 0.4379641, -0.2111293, 0, 1, 0.8156863, 1,
-0.03929124, 0.4617483, -0.4197107, 0, 1, 0.8196079, 1,
-0.03911406, 0.9756733, 0.3240337, 0, 1, 0.827451, 1,
-0.03651358, 0.2590815, 0.250642, 0, 1, 0.8313726, 1,
-0.03476481, -0.4814591, -1.627324, 0, 1, 0.8392157, 1,
-0.03321733, 1.256265, 0.8068098, 0, 1, 0.8431373, 1,
-0.03304682, -0.8225828, -3.533276, 0, 1, 0.8509804, 1,
-0.02770725, -1.309049, -2.820666, 0, 1, 0.854902, 1,
-0.02669724, 0.5050074, 0.1478678, 0, 1, 0.8627451, 1,
-0.02336912, -0.5157975, -2.374539, 0, 1, 0.8666667, 1,
-0.02327661, -0.08029987, -4.599425, 0, 1, 0.8745098, 1,
-0.02015208, -0.3011052, -3.471643, 0, 1, 0.8784314, 1,
-0.01968126, 1.129946, 1.465867, 0, 1, 0.8862745, 1,
-0.01735775, -0.9353147, -5.070171, 0, 1, 0.8901961, 1,
-0.01116188, -0.1038174, -3.506158, 0, 1, 0.8980392, 1,
-0.006549709, 0.2416174, -1.339863, 0, 1, 0.9058824, 1,
-0.005942714, -0.06932113, -3.656482, 0, 1, 0.9098039, 1,
-0.005630873, 0.4336769, 1.120183, 0, 1, 0.9176471, 1,
-0.005589206, 0.9519501, 0.2682906, 0, 1, 0.9215686, 1,
-0.005341057, -3.195437, -4.384819, 0, 1, 0.9294118, 1,
-0.002930172, 1.595274, 0.07318364, 0, 1, 0.9333333, 1,
-0.001919972, -0.2012577, -2.673162, 0, 1, 0.9411765, 1,
-0.001270762, 0.4133365, -0.3065655, 0, 1, 0.945098, 1,
0.0001376393, -0.2060136, 4.427383, 0, 1, 0.9529412, 1,
0.0004473398, -1.051447, 3.107347, 0, 1, 0.9568627, 1,
0.0055564, 1.080078, 0.1103151, 0, 1, 0.9647059, 1,
0.01032271, -0.7609261, 2.648237, 0, 1, 0.9686275, 1,
0.01250335, -1.528276, 5.727268, 0, 1, 0.9764706, 1,
0.01285246, 0.5152205, -0.6990862, 0, 1, 0.9803922, 1,
0.0136927, 1.559047, -0.2103466, 0, 1, 0.9882353, 1,
0.01542448, -0.9701334, 2.789452, 0, 1, 0.9921569, 1,
0.01993824, 0.9275278, -0.3765336, 0, 1, 1, 1,
0.02612207, -1.400415, 2.079586, 0, 0.9921569, 1, 1,
0.02874236, 1.527494, -0.2029139, 0, 0.9882353, 1, 1,
0.03222913, -0.4821151, 2.572923, 0, 0.9803922, 1, 1,
0.03813957, 0.26078, -0.4226194, 0, 0.9764706, 1, 1,
0.03836746, -0.5955709, 3.815317, 0, 0.9686275, 1, 1,
0.03869871, 0.6084503, 0.6034338, 0, 0.9647059, 1, 1,
0.04375542, -0.2781031, 2.831217, 0, 0.9568627, 1, 1,
0.04490613, 1.17672, -0.4969331, 0, 0.9529412, 1, 1,
0.0522022, -0.9572238, 1.770344, 0, 0.945098, 1, 1,
0.06206817, 1.470032, 0.444419, 0, 0.9411765, 1, 1,
0.06243799, 0.7755381, 0.1857027, 0, 0.9333333, 1, 1,
0.06307832, -1.648779, 1.938004, 0, 0.9294118, 1, 1,
0.06637134, 1.013629, -0.2274, 0, 0.9215686, 1, 1,
0.06805455, 0.1173699, 0.7194847, 0, 0.9176471, 1, 1,
0.06876121, 0.8622732, 2.277077, 0, 0.9098039, 1, 1,
0.0725174, 0.6072454, 1.68495, 0, 0.9058824, 1, 1,
0.07322357, 1.610699, -1.235355, 0, 0.8980392, 1, 1,
0.07511286, -1.479164, 3.306129, 0, 0.8901961, 1, 1,
0.08043217, 1.21155, 1.383585, 0, 0.8862745, 1, 1,
0.08382931, -0.7777589, 5.031857, 0, 0.8784314, 1, 1,
0.08433462, -0.7049807, 3.345466, 0, 0.8745098, 1, 1,
0.08473752, -0.8434061, 1.841153, 0, 0.8666667, 1, 1,
0.08638118, -0.3521796, 1.030077, 0, 0.8627451, 1, 1,
0.08912527, 0.5336461, 0.05114449, 0, 0.854902, 1, 1,
0.0891981, 1.265878, 0.1208938, 0, 0.8509804, 1, 1,
0.0948176, -1.481774, 0.9190453, 0, 0.8431373, 1, 1,
0.09764405, 0.4424626, -0.08291458, 0, 0.8392157, 1, 1,
0.09979264, 0.03034215, 1.253153, 0, 0.8313726, 1, 1,
0.1017291, -1.291367, 5.349888, 0, 0.827451, 1, 1,
0.1018071, 0.2020987, 1.043825, 0, 0.8196079, 1, 1,
0.1019439, -0.2902802, 3.201139, 0, 0.8156863, 1, 1,
0.1024803, -0.8770798, 3.524926, 0, 0.8078431, 1, 1,
0.1036737, -0.07948661, 1.903719, 0, 0.8039216, 1, 1,
0.1073451, 0.5327317, -0.3699717, 0, 0.7960784, 1, 1,
0.1091373, 0.2219226, 2.874721, 0, 0.7882353, 1, 1,
0.1103659, -1.374969, 1.803998, 0, 0.7843137, 1, 1,
0.1115124, 0.4926538, -0.7377824, 0, 0.7764706, 1, 1,
0.1151661, -0.320392, 2.257832, 0, 0.772549, 1, 1,
0.1152014, -0.5499927, 4.781423, 0, 0.7647059, 1, 1,
0.1155434, 0.2768656, 1.497917, 0, 0.7607843, 1, 1,
0.1166166, -1.144156, 4.156087, 0, 0.7529412, 1, 1,
0.1170734, -1.864522, 3.432664, 0, 0.7490196, 1, 1,
0.1172635, 1.66269, 0.01651908, 0, 0.7411765, 1, 1,
0.1177267, 2.42831, 0.6138919, 0, 0.7372549, 1, 1,
0.1215788, -0.7253488, 4.0054, 0, 0.7294118, 1, 1,
0.1227667, -1.209578, 2.624971, 0, 0.7254902, 1, 1,
0.1236191, 0.6208686, -0.7914923, 0, 0.7176471, 1, 1,
0.1303969, -0.1151056, 1.912391, 0, 0.7137255, 1, 1,
0.1327254, 0.6157087, 0.9187815, 0, 0.7058824, 1, 1,
0.1411167, 0.2124177, -1.914982, 0, 0.6980392, 1, 1,
0.1423094, -0.4614337, 1.057052, 0, 0.6941177, 1, 1,
0.1426479, -1.465699, 3.136064, 0, 0.6862745, 1, 1,
0.1453231, 0.3723611, 0.1750411, 0, 0.682353, 1, 1,
0.157095, -0.5605904, 2.144316, 0, 0.6745098, 1, 1,
0.157815, 0.227638, 0.1178091, 0, 0.6705883, 1, 1,
0.1589546, 0.3664298, 0.3281838, 0, 0.6627451, 1, 1,
0.1600621, 0.009873074, 0.4673347, 0, 0.6588235, 1, 1,
0.1640743, -0.3363535, 3.019583, 0, 0.6509804, 1, 1,
0.1647434, -0.302288, 3.597517, 0, 0.6470588, 1, 1,
0.1656091, 0.7863063, -0.09037763, 0, 0.6392157, 1, 1,
0.1685529, -0.5365407, 2.485253, 0, 0.6352941, 1, 1,
0.1700979, -0.4617814, 2.345535, 0, 0.627451, 1, 1,
0.1795827, 0.1399105, -0.9296145, 0, 0.6235294, 1, 1,
0.1797597, 0.03802365, 0.8376124, 0, 0.6156863, 1, 1,
0.1828639, 1.411267, 0.3716961, 0, 0.6117647, 1, 1,
0.1864387, -0.2829796, 3.865114, 0, 0.6039216, 1, 1,
0.1883916, 2.11445, -0.9433258, 0, 0.5960785, 1, 1,
0.1888857, -1.175754, 2.775578, 0, 0.5921569, 1, 1,
0.1893794, 2.2934, -0.2519682, 0, 0.5843138, 1, 1,
0.1930203, -0.2641335, 2.862847, 0, 0.5803922, 1, 1,
0.1980547, 0.2137698, 1.564535, 0, 0.572549, 1, 1,
0.2017971, 0.2800385, 1.424493, 0, 0.5686275, 1, 1,
0.2067753, -0.3633079, 1.50868, 0, 0.5607843, 1, 1,
0.2145079, 0.8570775, -1.058241, 0, 0.5568628, 1, 1,
0.2157575, -0.7015101, 1.564597, 0, 0.5490196, 1, 1,
0.216011, -0.5145154, 3.964657, 0, 0.5450981, 1, 1,
0.2163323, 0.5871857, -0.497428, 0, 0.5372549, 1, 1,
0.2200005, -0.4839346, 3.027885, 0, 0.5333334, 1, 1,
0.2200619, -1.859424, 1.935205, 0, 0.5254902, 1, 1,
0.2208181, 0.2220606, 1.852572, 0, 0.5215687, 1, 1,
0.2213633, -1.931139, 1.591709, 0, 0.5137255, 1, 1,
0.222975, 0.4302368, 2.45791, 0, 0.509804, 1, 1,
0.2234986, 0.759968, -0.8317559, 0, 0.5019608, 1, 1,
0.2252063, -1.249149, 2.664391, 0, 0.4941176, 1, 1,
0.2282483, 0.3073263, 1.031969, 0, 0.4901961, 1, 1,
0.2309154, -0.1438034, 2.195889, 0, 0.4823529, 1, 1,
0.2312143, -1.795168, 3.353548, 0, 0.4784314, 1, 1,
0.2335055, 1.57864, -1.444901, 0, 0.4705882, 1, 1,
0.2376595, 0.9814534, -0.57473, 0, 0.4666667, 1, 1,
0.2390183, -0.7650011, 2.575565, 0, 0.4588235, 1, 1,
0.2413115, 0.9902669, 0.7713057, 0, 0.454902, 1, 1,
0.2440752, 0.7778978, 0.7837612, 0, 0.4470588, 1, 1,
0.2446168, 0.2387801, 0.7518862, 0, 0.4431373, 1, 1,
0.2447485, 1.370191, 0.6446313, 0, 0.4352941, 1, 1,
0.2450896, 0.1674312, 2.342942, 0, 0.4313726, 1, 1,
0.2452863, 0.8005431, 0.151363, 0, 0.4235294, 1, 1,
0.2457378, -0.8282645, 3.761533, 0, 0.4196078, 1, 1,
0.2471879, -1.213881, 4.727102, 0, 0.4117647, 1, 1,
0.248463, -0.4183092, 3.477022, 0, 0.4078431, 1, 1,
0.2566325, -1.126625, 3.237979, 0, 0.4, 1, 1,
0.256831, 2.13991, -0.9535762, 0, 0.3921569, 1, 1,
0.2613361, -0.3227158, 3.783544, 0, 0.3882353, 1, 1,
0.2628458, -0.2062262, 3.580723, 0, 0.3803922, 1, 1,
0.2633456, 0.4393663, 1.353567, 0, 0.3764706, 1, 1,
0.2660272, -0.03396982, 2.577388, 0, 0.3686275, 1, 1,
0.2757186, -1.300348, 3.033311, 0, 0.3647059, 1, 1,
0.2796239, 0.8333746, -0.9330423, 0, 0.3568628, 1, 1,
0.2805721, 1.358891, -0.3781442, 0, 0.3529412, 1, 1,
0.2819202, 2.030364, -1.536296, 0, 0.345098, 1, 1,
0.2851345, 0.06104656, 1.533016, 0, 0.3411765, 1, 1,
0.2868042, -0.9186391, 2.487076, 0, 0.3333333, 1, 1,
0.2938908, 1.352161, -1.615555, 0, 0.3294118, 1, 1,
0.2941426, -0.7193695, 1.346802, 0, 0.3215686, 1, 1,
0.2952353, 0.1181133, 0.4755794, 0, 0.3176471, 1, 1,
0.2974306, 1.614214, -2.042562, 0, 0.3098039, 1, 1,
0.2989193, 0.6256649, 0.8754978, 0, 0.3058824, 1, 1,
0.3025886, -0.1445004, 1.262026, 0, 0.2980392, 1, 1,
0.3046387, 0.6083754, 0.8628159, 0, 0.2901961, 1, 1,
0.3059981, -0.654, 3.915058, 0, 0.2862745, 1, 1,
0.3078268, 1.553901, 0.6638275, 0, 0.2784314, 1, 1,
0.3097136, 0.3704511, 1.302344, 0, 0.2745098, 1, 1,
0.3098701, 0.719511, 1.774801, 0, 0.2666667, 1, 1,
0.3104033, -1.661717, 3.241956, 0, 0.2627451, 1, 1,
0.311946, 0.6068791, 0.1542473, 0, 0.254902, 1, 1,
0.3121189, 0.3708924, 1.601374, 0, 0.2509804, 1, 1,
0.3127844, -0.1251103, 2.106622, 0, 0.2431373, 1, 1,
0.3179163, -1.269993, 2.199537, 0, 0.2392157, 1, 1,
0.3185585, 0.3026032, 0.5700409, 0, 0.2313726, 1, 1,
0.3194301, 0.952326, -0.6420225, 0, 0.227451, 1, 1,
0.3204964, -1.25498, 4.082383, 0, 0.2196078, 1, 1,
0.3298798, 2.079431, -0.3531545, 0, 0.2156863, 1, 1,
0.3330303, -1.02551, 0.378738, 0, 0.2078431, 1, 1,
0.3353926, -0.4613492, 2.170821, 0, 0.2039216, 1, 1,
0.3354434, 0.6926519, 0.9705763, 0, 0.1960784, 1, 1,
0.3366038, 1.162338, 0.2594887, 0, 0.1882353, 1, 1,
0.3370759, -0.5180116, 0.6114661, 0, 0.1843137, 1, 1,
0.3374026, -1.020592, 4.832081, 0, 0.1764706, 1, 1,
0.3383819, -0.9017121, 3.873233, 0, 0.172549, 1, 1,
0.3393412, 1.00165, 0.4988081, 0, 0.1647059, 1, 1,
0.3419327, -1.408607, 2.805144, 0, 0.1607843, 1, 1,
0.3512941, 1.781869, 0.4313928, 0, 0.1529412, 1, 1,
0.3565117, -0.1056336, 2.006733, 0, 0.1490196, 1, 1,
0.3573273, -0.4632354, 1.329121, 0, 0.1411765, 1, 1,
0.3606079, 0.948984, -3.170785, 0, 0.1372549, 1, 1,
0.3666036, -1.537991, 3.559947, 0, 0.1294118, 1, 1,
0.3684565, -0.3023022, 1.490623, 0, 0.1254902, 1, 1,
0.3695408, -0.07152735, 2.236909, 0, 0.1176471, 1, 1,
0.3701479, 1.217016, 2.028751, 0, 0.1137255, 1, 1,
0.3714784, 0.1303275, -0.04873711, 0, 0.1058824, 1, 1,
0.3730373, 0.5597836, 0.3655639, 0, 0.09803922, 1, 1,
0.374976, -0.7597131, 2.063588, 0, 0.09411765, 1, 1,
0.3759127, 0.3081488, 0.9422659, 0, 0.08627451, 1, 1,
0.3790436, -0.5247788, 3.48835, 0, 0.08235294, 1, 1,
0.3802004, -2.693921, 2.19557, 0, 0.07450981, 1, 1,
0.3802312, 1.073369, -0.6966466, 0, 0.07058824, 1, 1,
0.3857191, 0.5930884, 0.09305122, 0, 0.0627451, 1, 1,
0.3865377, 0.2356435, 1.616128, 0, 0.05882353, 1, 1,
0.3876984, 0.6587813, 1.101224, 0, 0.05098039, 1, 1,
0.3934594, -0.3037366, 2.444106, 0, 0.04705882, 1, 1,
0.3989258, 0.3572229, -0.4417903, 0, 0.03921569, 1, 1,
0.3991037, 0.9003122, 0.1066736, 0, 0.03529412, 1, 1,
0.3995898, 0.1603237, 1.256045, 0, 0.02745098, 1, 1,
0.3997332, 1.175539, 0.6325634, 0, 0.02352941, 1, 1,
0.4044262, -1.413136, 2.629021, 0, 0.01568628, 1, 1,
0.4045526, -0.8226073, 1.417342, 0, 0.01176471, 1, 1,
0.4077472, -1.140545, 2.272692, 0, 0.003921569, 1, 1,
0.4096887, 0.5537157, 1.281022, 0.003921569, 0, 1, 1,
0.4141581, 2.054844, 0.08627779, 0.007843138, 0, 1, 1,
0.4145397, 0.3319265, 1.729014, 0.01568628, 0, 1, 1,
0.4200101, 0.134582, 0.1737839, 0.01960784, 0, 1, 1,
0.4210188, 0.2327783, 1.478224, 0.02745098, 0, 1, 1,
0.421039, 2.442951, 0.1868412, 0.03137255, 0, 1, 1,
0.4215234, 0.839443, 0.407094, 0.03921569, 0, 1, 1,
0.4279862, -0.07565475, 2.007619, 0.04313726, 0, 1, 1,
0.4327298, 1.751856, 0.5126221, 0.05098039, 0, 1, 1,
0.4414514, 1.394239, 1.490351, 0.05490196, 0, 1, 1,
0.4446233, -0.1253957, 1.583565, 0.0627451, 0, 1, 1,
0.4535508, -1.068329, 3.163604, 0.06666667, 0, 1, 1,
0.4583469, 1.311472, -0.8102793, 0.07450981, 0, 1, 1,
0.4590233, 1.437189, 0.9063737, 0.07843138, 0, 1, 1,
0.4641413, -0.4690493, 1.311716, 0.08627451, 0, 1, 1,
0.4651611, 0.05480587, -0.00996092, 0.09019608, 0, 1, 1,
0.4664562, -0.2558567, 4.369203, 0.09803922, 0, 1, 1,
0.4761449, 2.323019, 0.1225203, 0.1058824, 0, 1, 1,
0.4807759, 1.694967, -0.730491, 0.1098039, 0, 1, 1,
0.4814555, -1.079572, 2.705194, 0.1176471, 0, 1, 1,
0.4871505, -0.7500861, 3.731737, 0.1215686, 0, 1, 1,
0.4873667, -0.8298079, 2.042176, 0.1294118, 0, 1, 1,
0.4896115, 0.8301505, 0.9537309, 0.1333333, 0, 1, 1,
0.4898201, 2.018743, 0.8460478, 0.1411765, 0, 1, 1,
0.4912798, 0.907212, -0.2883859, 0.145098, 0, 1, 1,
0.497815, -0.9209198, 2.377692, 0.1529412, 0, 1, 1,
0.4988348, 0.8874997, 0.162325, 0.1568628, 0, 1, 1,
0.49932, -1.064043, 4.180617, 0.1647059, 0, 1, 1,
0.5073193, -0.4340557, 2.274594, 0.1686275, 0, 1, 1,
0.5129885, -1.650409, 0.9280117, 0.1764706, 0, 1, 1,
0.5156543, -0.09016271, 1.156027, 0.1803922, 0, 1, 1,
0.5173899, 0.2013326, 0.04990952, 0.1882353, 0, 1, 1,
0.5179947, -0.4925992, 0.5170486, 0.1921569, 0, 1, 1,
0.5184305, 0.2676148, 1.116133, 0.2, 0, 1, 1,
0.5258378, 0.05565842, 2.430792, 0.2078431, 0, 1, 1,
0.5277278, -2.774637, 2.80744, 0.2117647, 0, 1, 1,
0.5323573, -0.1727188, 2.729623, 0.2196078, 0, 1, 1,
0.5383978, 1.335743, -0.4718357, 0.2235294, 0, 1, 1,
0.544503, 0.518828, 0.6376347, 0.2313726, 0, 1, 1,
0.5476757, 0.2459287, 2.48606, 0.2352941, 0, 1, 1,
0.5495964, 0.5645016, 0.2520783, 0.2431373, 0, 1, 1,
0.5567143, -1.590719, 2.91256, 0.2470588, 0, 1, 1,
0.5589567, 1.430494, -0.2216988, 0.254902, 0, 1, 1,
0.5619699, -0.186118, 1.749546, 0.2588235, 0, 1, 1,
0.5627377, -0.1843634, -0.1391568, 0.2666667, 0, 1, 1,
0.5645118, -0.4933262, 2.460363, 0.2705882, 0, 1, 1,
0.568584, 0.6395127, 0.2309333, 0.2784314, 0, 1, 1,
0.5703951, -0.2832811, 1.682341, 0.282353, 0, 1, 1,
0.5772441, 0.6685312, 1.236508, 0.2901961, 0, 1, 1,
0.5805967, 0.5294103, 0.6790234, 0.2941177, 0, 1, 1,
0.5807427, -0.9824684, 2.208381, 0.3019608, 0, 1, 1,
0.5810099, -0.697176, 2.502267, 0.3098039, 0, 1, 1,
0.5819117, 1.499387, 0.162776, 0.3137255, 0, 1, 1,
0.583643, -2.256143, 3.175471, 0.3215686, 0, 1, 1,
0.5878632, -1.051261, 3.872684, 0.3254902, 0, 1, 1,
0.5992436, -0.2301442, 2.826149, 0.3333333, 0, 1, 1,
0.6006978, 0.4274208, 1.262948, 0.3372549, 0, 1, 1,
0.6022512, 0.2168095, 0.8146124, 0.345098, 0, 1, 1,
0.6054006, -0.7904514, 3.340614, 0.3490196, 0, 1, 1,
0.606301, 1.016691, -0.7417871, 0.3568628, 0, 1, 1,
0.6075372, -0.9110628, 1.672082, 0.3607843, 0, 1, 1,
0.6105892, -1.420678, 2.149602, 0.3686275, 0, 1, 1,
0.6115205, -0.2577262, 1.963095, 0.372549, 0, 1, 1,
0.6174047, -1.453889, 3.299084, 0.3803922, 0, 1, 1,
0.6209478, 0.8324816, 1.225334, 0.3843137, 0, 1, 1,
0.6216997, 0.7285901, 0.6637868, 0.3921569, 0, 1, 1,
0.6248081, 0.5684655, 0.8518581, 0.3960784, 0, 1, 1,
0.6262112, -1.038526, 2.761202, 0.4039216, 0, 1, 1,
0.6335266, -1.093837, 4.069597, 0.4117647, 0, 1, 1,
0.6397594, -0.4981626, 1.614755, 0.4156863, 0, 1, 1,
0.6555749, 0.5203465, -0.3920777, 0.4235294, 0, 1, 1,
0.6627085, 0.1105492, 1.801562, 0.427451, 0, 1, 1,
0.6646398, -1.580233, 2.60093, 0.4352941, 0, 1, 1,
0.6673219, -0.6763935, 1.516808, 0.4392157, 0, 1, 1,
0.6702996, 1.195408, 0.8372937, 0.4470588, 0, 1, 1,
0.6708162, 0.7723731, 1.114715, 0.4509804, 0, 1, 1,
0.6743242, 0.100552, 1.746164, 0.4588235, 0, 1, 1,
0.6775145, 0.4363419, -0.3991232, 0.4627451, 0, 1, 1,
0.6780613, 1.204527, 0.4950797, 0.4705882, 0, 1, 1,
0.6801354, 0.2530482, 1.00068, 0.4745098, 0, 1, 1,
0.6827803, -0.6997781, 0.9457996, 0.4823529, 0, 1, 1,
0.682907, -0.921182, 3.720392, 0.4862745, 0, 1, 1,
0.683585, -0.9908113, 2.683151, 0.4941176, 0, 1, 1,
0.6850097, -1.047875, 1.907317, 0.5019608, 0, 1, 1,
0.6863306, -0.67418, 2.139915, 0.5058824, 0, 1, 1,
0.6882165, 1.11158, 0.0845377, 0.5137255, 0, 1, 1,
0.6890155, 1.468804, 0.465225, 0.5176471, 0, 1, 1,
0.6891262, 0.7171745, 2.071526, 0.5254902, 0, 1, 1,
0.6922094, -0.2356546, 2.81445, 0.5294118, 0, 1, 1,
0.6933464, 1.546992, 0.9178446, 0.5372549, 0, 1, 1,
0.6962578, 0.1563696, 0.2938246, 0.5411765, 0, 1, 1,
0.7066225, -1.082615, 3.10758, 0.5490196, 0, 1, 1,
0.7115786, -0.01654734, 1.314779, 0.5529412, 0, 1, 1,
0.7165176, 0.4463041, 0.966862, 0.5607843, 0, 1, 1,
0.7166991, 1.010651, 2.176241, 0.5647059, 0, 1, 1,
0.7188162, -0.593784, 3.731094, 0.572549, 0, 1, 1,
0.7213019, 1.124747, -0.9048885, 0.5764706, 0, 1, 1,
0.7249592, 0.1239592, 2.192253, 0.5843138, 0, 1, 1,
0.7277513, 0.07143451, 1.287337, 0.5882353, 0, 1, 1,
0.7429323, -0.1045735, 1.039879, 0.5960785, 0, 1, 1,
0.7433817, -1.484643, 1.937692, 0.6039216, 0, 1, 1,
0.7436588, 0.6077738, -0.5390887, 0.6078432, 0, 1, 1,
0.7447081, 1.461812, 0.1982119, 0.6156863, 0, 1, 1,
0.745405, 0.4099032, 1.138821, 0.6196079, 0, 1, 1,
0.748312, 0.8796133, 2.782865, 0.627451, 0, 1, 1,
0.7485665, 0.195643, 1.267838, 0.6313726, 0, 1, 1,
0.7507045, -0.966426, 2.803201, 0.6392157, 0, 1, 1,
0.7525132, 0.8602579, 1.006835, 0.6431373, 0, 1, 1,
0.7555227, -1.511549, 2.098734, 0.6509804, 0, 1, 1,
0.7582659, 1.422164, 1.797042, 0.654902, 0, 1, 1,
0.7629017, 0.5097387, 1.614832, 0.6627451, 0, 1, 1,
0.7680037, 1.915081, 1.305196, 0.6666667, 0, 1, 1,
0.7708519, 0.003629863, 0.6403602, 0.6745098, 0, 1, 1,
0.7711095, -1.253724, 1.850698, 0.6784314, 0, 1, 1,
0.7718952, -0.6342844, 1.560374, 0.6862745, 0, 1, 1,
0.7767614, -0.05399291, 0.8415846, 0.6901961, 0, 1, 1,
0.7768963, 0.6262891, 0.442353, 0.6980392, 0, 1, 1,
0.7786186, -1.031148, 2.028978, 0.7058824, 0, 1, 1,
0.7786328, 1.818686, -0.3357947, 0.7098039, 0, 1, 1,
0.7812464, -0.5698636, 3.229675, 0.7176471, 0, 1, 1,
0.7869176, 0.4589339, 2.216155, 0.7215686, 0, 1, 1,
0.7911593, -0.7531386, 2.761537, 0.7294118, 0, 1, 1,
0.792062, 1.481925, 1.050139, 0.7333333, 0, 1, 1,
0.793014, 0.5495702, -1.12483, 0.7411765, 0, 1, 1,
0.7967902, 0.6693984, -0.6690415, 0.7450981, 0, 1, 1,
0.7976548, -0.9527761, 0.5609291, 0.7529412, 0, 1, 1,
0.8019196, 0.2908286, 0.687606, 0.7568628, 0, 1, 1,
0.8067533, -0.9813617, 1.51788, 0.7647059, 0, 1, 1,
0.8096088, 0.1590002, 1.115119, 0.7686275, 0, 1, 1,
0.811771, 0.9641453, -0.1836149, 0.7764706, 0, 1, 1,
0.8120111, -0.2922031, 2.872164, 0.7803922, 0, 1, 1,
0.8201845, 0.8098808, 1.395266, 0.7882353, 0, 1, 1,
0.8211617, -0.1148692, 2.552043, 0.7921569, 0, 1, 1,
0.8225367, 0.4932588, 0.7811005, 0.8, 0, 1, 1,
0.8254518, -0.8380245, 4.307283, 0.8078431, 0, 1, 1,
0.827792, -1.611174, 3.802861, 0.8117647, 0, 1, 1,
0.8316317, -0.8180358, 2.337848, 0.8196079, 0, 1, 1,
0.8324262, -0.06077635, 1.722606, 0.8235294, 0, 1, 1,
0.8330764, -0.01082317, 2.16069, 0.8313726, 0, 1, 1,
0.8346766, -0.6890488, 3.576435, 0.8352941, 0, 1, 1,
0.8410496, 0.4374241, 0.443774, 0.8431373, 0, 1, 1,
0.842962, -1.165016, 1.214142, 0.8470588, 0, 1, 1,
0.8434131, 0.03008248, 0.7347138, 0.854902, 0, 1, 1,
0.8463531, 0.1876445, 2.472464, 0.8588235, 0, 1, 1,
0.8468222, -1.908576, 1.403977, 0.8666667, 0, 1, 1,
0.8523842, -0.3111319, 0.6661327, 0.8705882, 0, 1, 1,
0.8564528, 0.8870484, -0.7271441, 0.8784314, 0, 1, 1,
0.8581716, 1.141466, 0.7738638, 0.8823529, 0, 1, 1,
0.8584036, 1.451771, -0.6177157, 0.8901961, 0, 1, 1,
0.862524, -1.061988, 2.984404, 0.8941177, 0, 1, 1,
0.8725411, 0.3356054, -0.5076599, 0.9019608, 0, 1, 1,
0.8768933, -1.536423, 1.79705, 0.9098039, 0, 1, 1,
0.8822792, 0.7800323, 0.6426395, 0.9137255, 0, 1, 1,
0.8850414, -1.158492, 1.954708, 0.9215686, 0, 1, 1,
0.8853893, -0.1685115, -0.0204305, 0.9254902, 0, 1, 1,
0.8873641, -0.905459, 2.80082, 0.9333333, 0, 1, 1,
0.8876337, 2.190849, 2.124441, 0.9372549, 0, 1, 1,
0.8928862, -0.03158217, 1.591414, 0.945098, 0, 1, 1,
0.9020863, 1.634063, 1.455414, 0.9490196, 0, 1, 1,
0.9070075, -0.7086463, 2.220002, 0.9568627, 0, 1, 1,
0.9073488, 0.4985285, 1.233337, 0.9607843, 0, 1, 1,
0.9098624, 0.1676223, 0.4486842, 0.9686275, 0, 1, 1,
0.9104332, 0.613911, 1.336366, 0.972549, 0, 1, 1,
0.9123926, -1.667306, 0.05972519, 0.9803922, 0, 1, 1,
0.9298645, 2.571373, -1.103126, 0.9843137, 0, 1, 1,
0.9371037, -0.1814873, 1.292817, 0.9921569, 0, 1, 1,
0.9498437, 0.01916387, 1.627932, 0.9960784, 0, 1, 1,
0.9640912, 0.7673774, 2.141154, 1, 0, 0.9960784, 1,
0.9772254, 0.7846314, 1.444091, 1, 0, 0.9882353, 1,
0.9827275, -0.09571811, 2.067218, 1, 0, 0.9843137, 1,
0.9931129, 0.1539287, 1.772459, 1, 0, 0.9764706, 1,
0.9941944, -0.1026528, 3.381214, 1, 0, 0.972549, 1,
0.994911, -0.7098851, -0.4897634, 1, 0, 0.9647059, 1,
1.004555, -0.1282833, 1.98063, 1, 0, 0.9607843, 1,
1.010903, -0.9906992, 1.116762, 1, 0, 0.9529412, 1,
1.011676, 1.330661, 0.459745, 1, 0, 0.9490196, 1,
1.021338, -1.183014, 2.025322, 1, 0, 0.9411765, 1,
1.025435, -0.2247135, 0.2694309, 1, 0, 0.9372549, 1,
1.034381, 0.2067899, 0.9459718, 1, 0, 0.9294118, 1,
1.043581, -0.1330319, 1.280296, 1, 0, 0.9254902, 1,
1.044822, -0.3309892, 2.123093, 1, 0, 0.9176471, 1,
1.049861, -0.4496501, 3.158998, 1, 0, 0.9137255, 1,
1.051239, 0.701585, 0.03648423, 1, 0, 0.9058824, 1,
1.053318, -0.4874214, 1.549711, 1, 0, 0.9019608, 1,
1.054115, 0.9191892, 0.4045356, 1, 0, 0.8941177, 1,
1.054329, -0.4285733, 3.542268, 1, 0, 0.8862745, 1,
1.055997, 0.3397356, 1.056546, 1, 0, 0.8823529, 1,
1.057029, 1.172346, 0.6386713, 1, 0, 0.8745098, 1,
1.059951, -1.482604, 3.422136, 1, 0, 0.8705882, 1,
1.061269, 1.518607, -0.8705661, 1, 0, 0.8627451, 1,
1.071554, 0.4836025, 1.036913, 1, 0, 0.8588235, 1,
1.073974, 0.3769276, 1.598693, 1, 0, 0.8509804, 1,
1.075701, -1.547038, 2.081179, 1, 0, 0.8470588, 1,
1.07624, -1.203959, 2.144967, 1, 0, 0.8392157, 1,
1.076651, -0.1581286, 1.922227, 1, 0, 0.8352941, 1,
1.086744, 0.1899032, 2.91336, 1, 0, 0.827451, 1,
1.087342, -0.5085685, 3.202325, 1, 0, 0.8235294, 1,
1.091526, -1.843008, 3.033581, 1, 0, 0.8156863, 1,
1.093059, 0.8790103, 1.618177, 1, 0, 0.8117647, 1,
1.099363, -1.673533, 1.658115, 1, 0, 0.8039216, 1,
1.101989, -1.847847, 2.261269, 1, 0, 0.7960784, 1,
1.108933, -0.7572557, 0.7277116, 1, 0, 0.7921569, 1,
1.109317, 0.01444223, 2.044881, 1, 0, 0.7843137, 1,
1.112043, 0.2294845, 2.778773, 1, 0, 0.7803922, 1,
1.1148, -0.1792173, 3.97085, 1, 0, 0.772549, 1,
1.120521, 0.8060417, 1.94051, 1, 0, 0.7686275, 1,
1.12165, 0.6955873, 0.8387985, 1, 0, 0.7607843, 1,
1.125993, 0.3950467, 1.82104, 1, 0, 0.7568628, 1,
1.127216, -0.8589362, 0.4011556, 1, 0, 0.7490196, 1,
1.128967, 2.903986, 0.06493829, 1, 0, 0.7450981, 1,
1.133614, -0.9795083, 1.692674, 1, 0, 0.7372549, 1,
1.13385, -0.2809252, 0.8369266, 1, 0, 0.7333333, 1,
1.157818, -0.1610129, 2.631449, 1, 0, 0.7254902, 1,
1.163598, 0.1979118, 2.586119, 1, 0, 0.7215686, 1,
1.165691, 0.9964908, -0.04880831, 1, 0, 0.7137255, 1,
1.178115, -0.6190742, 2.922812, 1, 0, 0.7098039, 1,
1.181536, -1.391179, 2.446784, 1, 0, 0.7019608, 1,
1.18165, -0.6972159, 1.196963, 1, 0, 0.6941177, 1,
1.183025, 1.640925, 2.008347, 1, 0, 0.6901961, 1,
1.18862, 0.06177135, 0.6967801, 1, 0, 0.682353, 1,
1.190466, -0.2603156, 1.233861, 1, 0, 0.6784314, 1,
1.191435, 0.6233348, 1.321647, 1, 0, 0.6705883, 1,
1.196837, 0.09178977, 0.5237071, 1, 0, 0.6666667, 1,
1.198527, 0.02139555, 2.726987, 1, 0, 0.6588235, 1,
1.200475, 0.166845, 0.4822758, 1, 0, 0.654902, 1,
1.208307, -1.273807, 0.7435123, 1, 0, 0.6470588, 1,
1.210235, -0.739815, 3.087535, 1, 0, 0.6431373, 1,
1.211542, -0.811257, 0.7995656, 1, 0, 0.6352941, 1,
1.221863, -0.7838696, 2.924991, 1, 0, 0.6313726, 1,
1.23014, -1.677005, 1.264295, 1, 0, 0.6235294, 1,
1.23148, 0.1501187, 1.300546, 1, 0, 0.6196079, 1,
1.236826, 0.7663004, 0.4162366, 1, 0, 0.6117647, 1,
1.239159, 0.9674124, 1.795854, 1, 0, 0.6078432, 1,
1.240153, 0.5887455, 1.938229, 1, 0, 0.6, 1,
1.240346, -1.454855, 3.380439, 1, 0, 0.5921569, 1,
1.240441, 1.242714, -1.103124, 1, 0, 0.5882353, 1,
1.240692, 0.09380033, 2.115014, 1, 0, 0.5803922, 1,
1.250044, 0.5250089, 0.4553132, 1, 0, 0.5764706, 1,
1.250084, 0.6606651, 1.22611, 1, 0, 0.5686275, 1,
1.250745, 0.6868476, 2.080663, 1, 0, 0.5647059, 1,
1.251532, 0.700097, 0.3232827, 1, 0, 0.5568628, 1,
1.259955, -1.214675, 0.1323998, 1, 0, 0.5529412, 1,
1.271886, 0.6567667, 0.3792662, 1, 0, 0.5450981, 1,
1.274967, 0.1945639, 2.241407, 1, 0, 0.5411765, 1,
1.280967, -1.878574, 2.671596, 1, 0, 0.5333334, 1,
1.282233, -0.9604383, 2.793983, 1, 0, 0.5294118, 1,
1.282875, -0.8137093, 1.974475, 1, 0, 0.5215687, 1,
1.311619, -1.323931, 2.384535, 1, 0, 0.5176471, 1,
1.319247, 1.591061, 1.103272, 1, 0, 0.509804, 1,
1.322433, -0.2626587, 4.531124, 1, 0, 0.5058824, 1,
1.325677, -1.92764, 3.56854, 1, 0, 0.4980392, 1,
1.329144, -1.015845, 2.214926, 1, 0, 0.4901961, 1,
1.340689, 1.715948, 2.61278, 1, 0, 0.4862745, 1,
1.342505, -1.589904, 4.098849, 1, 0, 0.4784314, 1,
1.342718, -1.13332, 2.434953, 1, 0, 0.4745098, 1,
1.344095, 0.3091724, 2.344957, 1, 0, 0.4666667, 1,
1.345235, -1.720133, 2.744375, 1, 0, 0.4627451, 1,
1.347857, 1.494948, 0.6500465, 1, 0, 0.454902, 1,
1.356257, -0.8145022, 2.132451, 1, 0, 0.4509804, 1,
1.366235, 1.504192, 1.083295, 1, 0, 0.4431373, 1,
1.378864, -0.5915653, 3.130741, 1, 0, 0.4392157, 1,
1.379552, -1.196352, 2.025062, 1, 0, 0.4313726, 1,
1.394487, -1.963357, 3.385642, 1, 0, 0.427451, 1,
1.404017, 0.04999024, 2.511579, 1, 0, 0.4196078, 1,
1.404444, 1.029568, 2.190312, 1, 0, 0.4156863, 1,
1.408715, -0.5792353, 1.973535, 1, 0, 0.4078431, 1,
1.418485, -0.8933674, 2.409106, 1, 0, 0.4039216, 1,
1.42091, -0.5553098, 1.979126, 1, 0, 0.3960784, 1,
1.426442, 0.4295866, 1.585005, 1, 0, 0.3882353, 1,
1.429894, -0.3187528, 2.638767, 1, 0, 0.3843137, 1,
1.442521, 0.618384, 1.816952, 1, 0, 0.3764706, 1,
1.455211, 1.451229, 0.8947852, 1, 0, 0.372549, 1,
1.456838, 1.816467, -0.1746505, 1, 0, 0.3647059, 1,
1.458015, 0.5805594, 0.9004399, 1, 0, 0.3607843, 1,
1.462061, 1.020449, -0.6382152, 1, 0, 0.3529412, 1,
1.464142, 1.598135, 0.6981396, 1, 0, 0.3490196, 1,
1.467253, -1.962815, 3.960571, 1, 0, 0.3411765, 1,
1.467613, -3.275225, 2.714791, 1, 0, 0.3372549, 1,
1.506874, -1.227723, 0.3691014, 1, 0, 0.3294118, 1,
1.514502, -0.3099545, 2.359092, 1, 0, 0.3254902, 1,
1.520256, -0.9699712, 3.086617, 1, 0, 0.3176471, 1,
1.528753, -0.3300264, 2.897705, 1, 0, 0.3137255, 1,
1.53473, 0.7358795, 1.734209, 1, 0, 0.3058824, 1,
1.540752, -0.3395295, 2.002151, 1, 0, 0.2980392, 1,
1.547544, 0.3400954, 0.7274939, 1, 0, 0.2941177, 1,
1.548218, 1.039812, 2.150287, 1, 0, 0.2862745, 1,
1.550264, -1.254991, 2.293441, 1, 0, 0.282353, 1,
1.572699, -1.579614, 1.216469, 1, 0, 0.2745098, 1,
1.58285, 0.4163794, 1.453049, 1, 0, 0.2705882, 1,
1.622963, -0.4053473, 2.800861, 1, 0, 0.2627451, 1,
1.642364, -1.027049, 0.7958498, 1, 0, 0.2588235, 1,
1.652235, 1.169824, -0.1130719, 1, 0, 0.2509804, 1,
1.659804, -0.7868082, 0.7609414, 1, 0, 0.2470588, 1,
1.67099, 0.8676513, 0.9903874, 1, 0, 0.2392157, 1,
1.686653, 0.9895231, 0.2293312, 1, 0, 0.2352941, 1,
1.689538, -1.769689, 1.916506, 1, 0, 0.227451, 1,
1.693972, 0.1221974, 0.9746703, 1, 0, 0.2235294, 1,
1.695063, 1.659935, 1.013175, 1, 0, 0.2156863, 1,
1.714941, -1.745442, 3.170092, 1, 0, 0.2117647, 1,
1.742819, 1.179063, 0.3205381, 1, 0, 0.2039216, 1,
1.770558, 0.03150126, 0.2978731, 1, 0, 0.1960784, 1,
1.799201, -0.4219112, 2.478133, 1, 0, 0.1921569, 1,
1.806657, -1.70272, 2.510407, 1, 0, 0.1843137, 1,
1.814626, 1.174101, 1.968974, 1, 0, 0.1803922, 1,
1.857209, -0.001630501, 0.2318958, 1, 0, 0.172549, 1,
1.859515, 0.8935027, 2.293663, 1, 0, 0.1686275, 1,
1.873309, 1.037803, 0.7533354, 1, 0, 0.1607843, 1,
1.878683, -0.3786204, 3.266165, 1, 0, 0.1568628, 1,
1.885498, -1.310462, 1.51681, 1, 0, 0.1490196, 1,
1.892217, -0.9789544, 3.871099, 1, 0, 0.145098, 1,
1.901667, 0.8865231, 0.2838423, 1, 0, 0.1372549, 1,
1.915675, -0.03981075, 1.832194, 1, 0, 0.1333333, 1,
1.941173, 0.651651, 0.7945683, 1, 0, 0.1254902, 1,
1.955749, 0.642964, 2.687858, 1, 0, 0.1215686, 1,
1.973325, -1.091891, 0.6496066, 1, 0, 0.1137255, 1,
1.979756, -0.01674609, 2.974353, 1, 0, 0.1098039, 1,
1.981889, 0.8337895, 1.028611, 1, 0, 0.1019608, 1,
1.988736, -0.02199111, 1.338567, 1, 0, 0.09411765, 1,
1.988826, -2.29338, 1.574436, 1, 0, 0.09019608, 1,
2.012695, 0.8487736, 0.7153062, 1, 0, 0.08235294, 1,
2.047485, -1.155482, 0.4162271, 1, 0, 0.07843138, 1,
2.065103, -1.141849, 1.08531, 1, 0, 0.07058824, 1,
2.076939, -0.4299177, 1.24497, 1, 0, 0.06666667, 1,
2.132839, 1.187852, 2.749117, 1, 0, 0.05882353, 1,
2.205274, 0.8787174, 1.474035, 1, 0, 0.05490196, 1,
2.297951, 0.5988472, 1.259879, 1, 0, 0.04705882, 1,
2.37242, -0.5675528, 1.778945, 1, 0, 0.04313726, 1,
2.576359, 0.491161, -0.09575035, 1, 0, 0.03529412, 1,
2.624446, 1.049654, 1.48783, 1, 0, 0.03137255, 1,
2.637599, -1.500841, 2.413611, 1, 0, 0.02352941, 1,
2.669083, -0.3048318, 2.971406, 1, 0, 0.01960784, 1,
2.683041, 0.1790012, 2.367701, 1, 0, 0.01176471, 1,
3.455194, 0.2200509, 1.344454, 1, 0, 0.007843138, 1
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
0.1082807, -4.391704, -7.324213, 0, -0.5, 0.5, 0.5,
0.1082807, -4.391704, -7.324213, 1, -0.5, 0.5, 0.5,
0.1082807, -4.391704, -7.324213, 1, 1.5, 0.5, 0.5,
0.1082807, -4.391704, -7.324213, 0, 1.5, 0.5, 0.5
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
-4.373237, 0.01822281, -7.324213, 0, -0.5, 0.5, 0.5,
-4.373237, 0.01822281, -7.324213, 1, -0.5, 0.5, 0.5,
-4.373237, 0.01822281, -7.324213, 1, 1.5, 0.5, 0.5,
-4.373237, 0.01822281, -7.324213, 0, 1.5, 0.5, 0.5
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
-4.373237, -4.391704, 0.1473274, 0, -0.5, 0.5, 0.5,
-4.373237, -4.391704, 0.1473274, 1, -0.5, 0.5, 0.5,
-4.373237, -4.391704, 0.1473274, 1, 1.5, 0.5, 0.5,
-4.373237, -4.391704, 0.1473274, 0, 1.5, 0.5, 0.5
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
-3, -3.374028, -5.600011,
3, -3.374028, -5.600011,
-3, -3.374028, -5.600011,
-3, -3.543641, -5.887378,
-2, -3.374028, -5.600011,
-2, -3.543641, -5.887378,
-1, -3.374028, -5.600011,
-1, -3.543641, -5.887378,
0, -3.374028, -5.600011,
0, -3.543641, -5.887378,
1, -3.374028, -5.600011,
1, -3.543641, -5.887378,
2, -3.374028, -5.600011,
2, -3.543641, -5.887378,
3, -3.374028, -5.600011,
3, -3.543641, -5.887378
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
-3, -3.882866, -6.462112, 0, -0.5, 0.5, 0.5,
-3, -3.882866, -6.462112, 1, -0.5, 0.5, 0.5,
-3, -3.882866, -6.462112, 1, 1.5, 0.5, 0.5,
-3, -3.882866, -6.462112, 0, 1.5, 0.5, 0.5,
-2, -3.882866, -6.462112, 0, -0.5, 0.5, 0.5,
-2, -3.882866, -6.462112, 1, -0.5, 0.5, 0.5,
-2, -3.882866, -6.462112, 1, 1.5, 0.5, 0.5,
-2, -3.882866, -6.462112, 0, 1.5, 0.5, 0.5,
-1, -3.882866, -6.462112, 0, -0.5, 0.5, 0.5,
-1, -3.882866, -6.462112, 1, -0.5, 0.5, 0.5,
-1, -3.882866, -6.462112, 1, 1.5, 0.5, 0.5,
-1, -3.882866, -6.462112, 0, 1.5, 0.5, 0.5,
0, -3.882866, -6.462112, 0, -0.5, 0.5, 0.5,
0, -3.882866, -6.462112, 1, -0.5, 0.5, 0.5,
0, -3.882866, -6.462112, 1, 1.5, 0.5, 0.5,
0, -3.882866, -6.462112, 0, 1.5, 0.5, 0.5,
1, -3.882866, -6.462112, 0, -0.5, 0.5, 0.5,
1, -3.882866, -6.462112, 1, -0.5, 0.5, 0.5,
1, -3.882866, -6.462112, 1, 1.5, 0.5, 0.5,
1, -3.882866, -6.462112, 0, 1.5, 0.5, 0.5,
2, -3.882866, -6.462112, 0, -0.5, 0.5, 0.5,
2, -3.882866, -6.462112, 1, -0.5, 0.5, 0.5,
2, -3.882866, -6.462112, 1, 1.5, 0.5, 0.5,
2, -3.882866, -6.462112, 0, 1.5, 0.5, 0.5,
3, -3.882866, -6.462112, 0, -0.5, 0.5, 0.5,
3, -3.882866, -6.462112, 1, -0.5, 0.5, 0.5,
3, -3.882866, -6.462112, 1, 1.5, 0.5, 0.5,
3, -3.882866, -6.462112, 0, 1.5, 0.5, 0.5
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
-3.339041, -3, -5.600011,
-3.339041, 3, -5.600011,
-3.339041, -3, -5.600011,
-3.511407, -3, -5.887378,
-3.339041, -2, -5.600011,
-3.511407, -2, -5.887378,
-3.339041, -1, -5.600011,
-3.511407, -1, -5.887378,
-3.339041, 0, -5.600011,
-3.511407, 0, -5.887378,
-3.339041, 1, -5.600011,
-3.511407, 1, -5.887378,
-3.339041, 2, -5.600011,
-3.511407, 2, -5.887378,
-3.339041, 3, -5.600011,
-3.511407, 3, -5.887378
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
-3.856139, -3, -6.462112, 0, -0.5, 0.5, 0.5,
-3.856139, -3, -6.462112, 1, -0.5, 0.5, 0.5,
-3.856139, -3, -6.462112, 1, 1.5, 0.5, 0.5,
-3.856139, -3, -6.462112, 0, 1.5, 0.5, 0.5,
-3.856139, -2, -6.462112, 0, -0.5, 0.5, 0.5,
-3.856139, -2, -6.462112, 1, -0.5, 0.5, 0.5,
-3.856139, -2, -6.462112, 1, 1.5, 0.5, 0.5,
-3.856139, -2, -6.462112, 0, 1.5, 0.5, 0.5,
-3.856139, -1, -6.462112, 0, -0.5, 0.5, 0.5,
-3.856139, -1, -6.462112, 1, -0.5, 0.5, 0.5,
-3.856139, -1, -6.462112, 1, 1.5, 0.5, 0.5,
-3.856139, -1, -6.462112, 0, 1.5, 0.5, 0.5,
-3.856139, 0, -6.462112, 0, -0.5, 0.5, 0.5,
-3.856139, 0, -6.462112, 1, -0.5, 0.5, 0.5,
-3.856139, 0, -6.462112, 1, 1.5, 0.5, 0.5,
-3.856139, 0, -6.462112, 0, 1.5, 0.5, 0.5,
-3.856139, 1, -6.462112, 0, -0.5, 0.5, 0.5,
-3.856139, 1, -6.462112, 1, -0.5, 0.5, 0.5,
-3.856139, 1, -6.462112, 1, 1.5, 0.5, 0.5,
-3.856139, 1, -6.462112, 0, 1.5, 0.5, 0.5,
-3.856139, 2, -6.462112, 0, -0.5, 0.5, 0.5,
-3.856139, 2, -6.462112, 1, -0.5, 0.5, 0.5,
-3.856139, 2, -6.462112, 1, 1.5, 0.5, 0.5,
-3.856139, 2, -6.462112, 0, 1.5, 0.5, 0.5,
-3.856139, 3, -6.462112, 0, -0.5, 0.5, 0.5,
-3.856139, 3, -6.462112, 1, -0.5, 0.5, 0.5,
-3.856139, 3, -6.462112, 1, 1.5, 0.5, 0.5,
-3.856139, 3, -6.462112, 0, 1.5, 0.5, 0.5
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
-3.339041, -3.374028, -4,
-3.339041, -3.374028, 4,
-3.339041, -3.374028, -4,
-3.511407, -3.543641, -4,
-3.339041, -3.374028, -2,
-3.511407, -3.543641, -2,
-3.339041, -3.374028, 0,
-3.511407, -3.543641, 0,
-3.339041, -3.374028, 2,
-3.511407, -3.543641, 2,
-3.339041, -3.374028, 4,
-3.511407, -3.543641, 4
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
-3.856139, -3.882866, -4, 0, -0.5, 0.5, 0.5,
-3.856139, -3.882866, -4, 1, -0.5, 0.5, 0.5,
-3.856139, -3.882866, -4, 1, 1.5, 0.5, 0.5,
-3.856139, -3.882866, -4, 0, 1.5, 0.5, 0.5,
-3.856139, -3.882866, -2, 0, -0.5, 0.5, 0.5,
-3.856139, -3.882866, -2, 1, -0.5, 0.5, 0.5,
-3.856139, -3.882866, -2, 1, 1.5, 0.5, 0.5,
-3.856139, -3.882866, -2, 0, 1.5, 0.5, 0.5,
-3.856139, -3.882866, 0, 0, -0.5, 0.5, 0.5,
-3.856139, -3.882866, 0, 1, -0.5, 0.5, 0.5,
-3.856139, -3.882866, 0, 1, 1.5, 0.5, 0.5,
-3.856139, -3.882866, 0, 0, 1.5, 0.5, 0.5,
-3.856139, -3.882866, 2, 0, -0.5, 0.5, 0.5,
-3.856139, -3.882866, 2, 1, -0.5, 0.5, 0.5,
-3.856139, -3.882866, 2, 1, 1.5, 0.5, 0.5,
-3.856139, -3.882866, 2, 0, 1.5, 0.5, 0.5,
-3.856139, -3.882866, 4, 0, -0.5, 0.5, 0.5,
-3.856139, -3.882866, 4, 1, -0.5, 0.5, 0.5,
-3.856139, -3.882866, 4, 1, 1.5, 0.5, 0.5,
-3.856139, -3.882866, 4, 0, 1.5, 0.5, 0.5
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
-3.339041, -3.374028, -5.600011,
-3.339041, 3.410474, -5.600011,
-3.339041, -3.374028, 5.894666,
-3.339041, 3.410474, 5.894666,
-3.339041, -3.374028, -5.600011,
-3.339041, -3.374028, 5.894666,
-3.339041, 3.410474, -5.600011,
-3.339041, 3.410474, 5.894666,
-3.339041, -3.374028, -5.600011,
3.555602, -3.374028, -5.600011,
-3.339041, -3.374028, 5.894666,
3.555602, -3.374028, 5.894666,
-3.339041, 3.410474, -5.600011,
3.555602, 3.410474, -5.600011,
-3.339041, 3.410474, 5.894666,
3.555602, 3.410474, 5.894666,
3.555602, -3.374028, -5.600011,
3.555602, 3.410474, -5.600011,
3.555602, -3.374028, 5.894666,
3.555602, 3.410474, 5.894666,
3.555602, -3.374028, -5.600011,
3.555602, -3.374028, 5.894666,
3.555602, 3.410474, -5.600011,
3.555602, 3.410474, 5.894666
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
var radius = 8.022037;
var distance = 35.69095;
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
mvMatrix.translate( -0.1082807, -0.01822281, -0.1473274 );
mvMatrix.scale( 1.258018, 1.278441, 0.7545739 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.69095);
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
diethylphthalat<-read.table("diethylphthalat.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-diethylphthalat$V2
```

```
## Error in eval(expr, envir, enclos): object 'diethylphthalat' not found
```

```r
y<-diethylphthalat$V3
```

```
## Error in eval(expr, envir, enclos): object 'diethylphthalat' not found
```

```r
z<-diethylphthalat$V4
```

```
## Error in eval(expr, envir, enclos): object 'diethylphthalat' not found
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
-3.238633, -0.3270483, -0.3883517, 0, 0, 1, 1, 1,
-2.878405, 0.950548, -1.59434, 1, 0, 0, 1, 1,
-2.63474, 0.6424916, 0.4361903, 1, 0, 0, 1, 1,
-2.497969, 0.8601839, 0.4085191, 1, 0, 0, 1, 1,
-2.445751, -0.1486481, -0.5178218, 1, 0, 0, 1, 1,
-2.360456, -0.9009103, -2.799893, 1, 0, 0, 1, 1,
-2.328289, 0.543614, -2.662211, 0, 0, 0, 1, 1,
-2.328028, -1.263095, -1.072734, 0, 0, 0, 1, 1,
-2.26258, 1.329802, -0.5515838, 0, 0, 0, 1, 1,
-2.211942, -0.08200125, -2.379782, 0, 0, 0, 1, 1,
-2.156055, -1.08361, -0.420291, 0, 0, 0, 1, 1,
-2.113071, 0.3811792, -0.9959868, 0, 0, 0, 1, 1,
-2.108607, 0.7809474, 0.6417928, 0, 0, 0, 1, 1,
-2.107364, 0.6667432, -0.5937683, 1, 1, 1, 1, 1,
-2.097772, -0.07236534, 0.4885434, 1, 1, 1, 1, 1,
-2.097151, 1.099988, -1.698099, 1, 1, 1, 1, 1,
-2.093262, 0.5104735, -0.5207348, 1, 1, 1, 1, 1,
-2.086786, -0.4713065, -1.922395, 1, 1, 1, 1, 1,
-2.080965, -0.6741876, -2.72824, 1, 1, 1, 1, 1,
-2.040889, -2.250532, -1.596415, 1, 1, 1, 1, 1,
-2.036937, -0.6792857, -1.272129, 1, 1, 1, 1, 1,
-2.010742, 0.1787919, -3.740789, 1, 1, 1, 1, 1,
-1.951937, -1.491139, -4.625101, 1, 1, 1, 1, 1,
-1.946867, 0.8896892, -0.7753792, 1, 1, 1, 1, 1,
-1.94267, -0.5613761, -2.009214, 1, 1, 1, 1, 1,
-1.931357, 0.4495539, -0.9167691, 1, 1, 1, 1, 1,
-1.92689, 1.246304, -0.5035645, 1, 1, 1, 1, 1,
-1.920953, -0.6408631, 0.7144021, 1, 1, 1, 1, 1,
-1.917176, -0.1104436, -2.167455, 0, 0, 1, 1, 1,
-1.909691, 0.3974397, 0.1696241, 1, 0, 0, 1, 1,
-1.908937, 0.0699221, -0.04909493, 1, 0, 0, 1, 1,
-1.90149, -0.9171147, -0.8631974, 1, 0, 0, 1, 1,
-1.900112, 1.424563, -2.979877, 1, 0, 0, 1, 1,
-1.830953, 0.3173097, -1.733697, 1, 0, 0, 1, 1,
-1.817063, -2.389397, -3.238568, 0, 0, 0, 1, 1,
-1.806741, 0.5004972, -1.147528, 0, 0, 0, 1, 1,
-1.772994, -0.669816, -3.160949, 0, 0, 0, 1, 1,
-1.768237, 1.127775, 0.4093387, 0, 0, 0, 1, 1,
-1.76549, 2.028043, -0.7900686, 0, 0, 0, 1, 1,
-1.751595, 0.05194007, -2.045, 0, 0, 0, 1, 1,
-1.742101, 0.3749643, -2.135607, 0, 0, 0, 1, 1,
-1.738962, 0.9156985, -0.9467893, 1, 1, 1, 1, 1,
-1.723539, -0.3574299, -0.8507273, 1, 1, 1, 1, 1,
-1.717473, 0.6819209, 0.2265938, 1, 1, 1, 1, 1,
-1.70388, -0.3846326, -2.624164, 1, 1, 1, 1, 1,
-1.699699, -0.1925603, -1.678423, 1, 1, 1, 1, 1,
-1.696597, -0.2732605, -0.3795527, 1, 1, 1, 1, 1,
-1.687583, -2.395096, -2.176981, 1, 1, 1, 1, 1,
-1.64716, 0.1582191, -2.679977, 1, 1, 1, 1, 1,
-1.641394, -0.4562511, -1.528653, 1, 1, 1, 1, 1,
-1.638994, 0.423178, -2.653434, 1, 1, 1, 1, 1,
-1.633563, -1.242285, -3.065178, 1, 1, 1, 1, 1,
-1.622484, 0.438092, -0.8758695, 1, 1, 1, 1, 1,
-1.622452, -1.290035, -1.897254, 1, 1, 1, 1, 1,
-1.620234, -0.4195082, -2.59906, 1, 1, 1, 1, 1,
-1.614393, 0.86738, -0.3607126, 1, 1, 1, 1, 1,
-1.609827, -0.008149009, -1.285316, 0, 0, 1, 1, 1,
-1.601849, 0.8944606, 0.07105258, 1, 0, 0, 1, 1,
-1.600603, -0.7850505, -1.239217, 1, 0, 0, 1, 1,
-1.597715, 1.568575, -0.294767, 1, 0, 0, 1, 1,
-1.590443, -1.339446, -4.405411, 1, 0, 0, 1, 1,
-1.587874, -0.3166542, -2.896572, 1, 0, 0, 1, 1,
-1.578309, -0.8078002, -2.447593, 0, 0, 0, 1, 1,
-1.572006, -0.5567529, -1.73436, 0, 0, 0, 1, 1,
-1.569672, 1.752678, 0.8828946, 0, 0, 0, 1, 1,
-1.560075, -0.2717991, -3.086667, 0, 0, 0, 1, 1,
-1.557331, -0.5305216, -0.228463, 0, 0, 0, 1, 1,
-1.546273, -0.04403197, -3.255992, 0, 0, 0, 1, 1,
-1.527574, 1.139878, -0.997044, 0, 0, 0, 1, 1,
-1.520047, 0.9844223, 0.9245354, 1, 1, 1, 1, 1,
-1.516349, 0.2263671, 0.2543307, 1, 1, 1, 1, 1,
-1.495882, -1.240628, -4.527208, 1, 1, 1, 1, 1,
-1.484005, 1.343674, -1.790025, 1, 1, 1, 1, 1,
-1.483365, 0.5811268, -2.538831, 1, 1, 1, 1, 1,
-1.480348, 0.5662004, -0.2249391, 1, 1, 1, 1, 1,
-1.47903, 0.3854998, -2.964803, 1, 1, 1, 1, 1,
-1.472222, -2.111923, -1.048497, 1, 1, 1, 1, 1,
-1.4701, -0.05834985, -3.153361, 1, 1, 1, 1, 1,
-1.469109, -1.134291, -2.354138, 1, 1, 1, 1, 1,
-1.464995, 0.8445352, -2.651022, 1, 1, 1, 1, 1,
-1.463802, 1.716361, -2.140181, 1, 1, 1, 1, 1,
-1.460734, 0.2063378, -1.323402, 1, 1, 1, 1, 1,
-1.453064, 1.42146, -1.888571, 1, 1, 1, 1, 1,
-1.441352, 1.120225, 0.1524108, 1, 1, 1, 1, 1,
-1.438504, 0.9422345, -0.4846517, 0, 0, 1, 1, 1,
-1.432611, -1.591337, -2.941193, 1, 0, 0, 1, 1,
-1.428723, -0.1282098, -1.621098, 1, 0, 0, 1, 1,
-1.423685, 0.04954734, -0.7465992, 1, 0, 0, 1, 1,
-1.406843, 0.6537395, -2.132069, 1, 0, 0, 1, 1,
-1.391368, -0.08320704, -1.402785, 1, 0, 0, 1, 1,
-1.375432, -2.709774, -1.887054, 0, 0, 0, 1, 1,
-1.353687, 0.04017555, -1.527412, 0, 0, 0, 1, 1,
-1.343449, 0.5018367, -1.509528, 0, 0, 0, 1, 1,
-1.338379, -1.066103, -0.7111154, 0, 0, 0, 1, 1,
-1.337196, -0.5773408, -1.861402, 0, 0, 0, 1, 1,
-1.313913, -1.545157, -1.947714, 0, 0, 0, 1, 1,
-1.312085, 0.5725256, -0.7247132, 0, 0, 0, 1, 1,
-1.306182, -0.696752, -1.041358, 1, 1, 1, 1, 1,
-1.297, 0.6537179, -1.629113, 1, 1, 1, 1, 1,
-1.295888, 1.189812, -0.7350093, 1, 1, 1, 1, 1,
-1.293718, -1.484097, -2.569339, 1, 1, 1, 1, 1,
-1.286382, 1.970782, -0.4016111, 1, 1, 1, 1, 1,
-1.283551, 1.369728, -0.2135315, 1, 1, 1, 1, 1,
-1.28256, 0.6120911, -1.366016, 1, 1, 1, 1, 1,
-1.277906, -0.202148, -1.90563, 1, 1, 1, 1, 1,
-1.246014, 1.008986, 0.9747159, 1, 1, 1, 1, 1,
-1.242653, 0.7872724, 0.2805779, 1, 1, 1, 1, 1,
-1.240106, 1.258609, -0.7355617, 1, 1, 1, 1, 1,
-1.232939, 0.4354853, -0.5482751, 1, 1, 1, 1, 1,
-1.214258, -1.338085, -1.078821, 1, 1, 1, 1, 1,
-1.208791, 0.8361329, -0.8826514, 1, 1, 1, 1, 1,
-1.208503, 0.3973935, 0.2425667, 1, 1, 1, 1, 1,
-1.203298, -1.517318, -3.181749, 0, 0, 1, 1, 1,
-1.199947, 1.955134, -1.15055, 1, 0, 0, 1, 1,
-1.199335, 0.08212187, -1.489968, 1, 0, 0, 1, 1,
-1.188086, 0.5870686, -3.038228, 1, 0, 0, 1, 1,
-1.183031, -1.221735, -3.184596, 1, 0, 0, 1, 1,
-1.182466, 0.6761755, -0.309069, 1, 0, 0, 1, 1,
-1.177079, 0.5678439, -4.170039, 0, 0, 0, 1, 1,
-1.171501, -1.349519, -3.719634, 0, 0, 0, 1, 1,
-1.153497, -2.021363, -2.479537, 0, 0, 0, 1, 1,
-1.148943, 0.8706778, -1.200458, 0, 0, 0, 1, 1,
-1.147211, -1.988709, -1.997432, 0, 0, 0, 1, 1,
-1.1452, -1.11068, -1.825219, 0, 0, 0, 1, 1,
-1.133621, 1.055197, -0.6530337, 0, 0, 0, 1, 1,
-1.122354, 2.579522, 0.07269663, 1, 1, 1, 1, 1,
-1.122226, 1.291108, 1.339401, 1, 1, 1, 1, 1,
-1.121927, 0.8540333, -2.764154, 1, 1, 1, 1, 1,
-1.12167, -1.544949, -1.099371, 1, 1, 1, 1, 1,
-1.119345, -0.3718154, -0.6945314, 1, 1, 1, 1, 1,
-1.117557, -0.9619758, -2.189382, 1, 1, 1, 1, 1,
-1.089009, 0.6742535, -1.950997, 1, 1, 1, 1, 1,
-1.085932, 0.1183521, -1.198135, 1, 1, 1, 1, 1,
-1.083228, 0.3202061, -0.256205, 1, 1, 1, 1, 1,
-1.080137, -0.09564043, -2.109758, 1, 1, 1, 1, 1,
-1.063277, -1.100766, -3.117852, 1, 1, 1, 1, 1,
-1.056523, 1.095568, 0.08840797, 1, 1, 1, 1, 1,
-1.048, 0.784965, -2.010282, 1, 1, 1, 1, 1,
-1.047114, -1.297381, -1.241584, 1, 1, 1, 1, 1,
-1.045084, 0.2455747, -1.064645, 1, 1, 1, 1, 1,
-1.044825, 0.4805685, 0.6184824, 0, 0, 1, 1, 1,
-1.037606, 0.196219, -2.702139, 1, 0, 0, 1, 1,
-1.036046, -0.3232931, -4.620466, 1, 0, 0, 1, 1,
-1.028882, 0.08998717, -1.745828, 1, 0, 0, 1, 1,
-1.02667, -1.510625, -2.142162, 1, 0, 0, 1, 1,
-1.023135, 1.325284, -0.4032995, 1, 0, 0, 1, 1,
-1.019758, 0.4231721, -1.287973, 0, 0, 0, 1, 1,
-1.019533, 0.6777, -0.5195397, 0, 0, 0, 1, 1,
-1.014917, 2.352545, -3.116676, 0, 0, 0, 1, 1,
-1.014649, 0.1020309, 2.353176, 0, 0, 0, 1, 1,
-1.002645, -0.6269422, -0.1635907, 0, 0, 0, 1, 1,
-1.002565, -0.5805959, -2.194678, 0, 0, 0, 1, 1,
-0.9975744, -0.2851771, -1.950601, 0, 0, 0, 1, 1,
-0.9949503, -1.128959, -1.146818, 1, 1, 1, 1, 1,
-0.9903244, -0.5073621, 0.3351845, 1, 1, 1, 1, 1,
-0.9800012, 1.135592, -0.7988049, 1, 1, 1, 1, 1,
-0.9785622, -0.9328857, -0.6800638, 1, 1, 1, 1, 1,
-0.9776717, 0.190326, -1.406935, 1, 1, 1, 1, 1,
-0.9756899, 1.175179, -1.003231, 1, 1, 1, 1, 1,
-0.9745334, 0.01975811, -0.1610706, 1, 1, 1, 1, 1,
-0.9578538, -1.37957, -1.943642, 1, 1, 1, 1, 1,
-0.9572309, -1.071069, -2.312154, 1, 1, 1, 1, 1,
-0.9559185, 0.4723286, -1.146028, 1, 1, 1, 1, 1,
-0.9430138, -1.677641, -0.8941815, 1, 1, 1, 1, 1,
-0.9397584, -0.9438402, -3.11611, 1, 1, 1, 1, 1,
-0.9339546, -1.085157, -0.7010649, 1, 1, 1, 1, 1,
-0.928495, 1.076394, -2.708668, 1, 1, 1, 1, 1,
-0.9256974, -1.21089, -1.006824, 1, 1, 1, 1, 1,
-0.9153957, 0.8036968, -2.511911, 0, 0, 1, 1, 1,
-0.9144062, -0.2186771, -0.04954758, 1, 0, 0, 1, 1,
-0.9042246, 0.1211303, -2.333894, 1, 0, 0, 1, 1,
-0.8926876, 1.191041, -1.010646, 1, 0, 0, 1, 1,
-0.8899708, 1.961866, -0.3760159, 1, 0, 0, 1, 1,
-0.8843977, -0.7155687, -1.953725, 1, 0, 0, 1, 1,
-0.8798677, 1.060256, -0.08509585, 0, 0, 0, 1, 1,
-0.8731862, -0.373843, -0.3886397, 0, 0, 0, 1, 1,
-0.8714555, 0.107219, -0.1563936, 0, 0, 0, 1, 1,
-0.8706995, 0.8101048, -1.550816, 0, 0, 0, 1, 1,
-0.8666064, 0.2356965, -1.494787, 0, 0, 0, 1, 1,
-0.8660631, -1.553829, -2.416679, 0, 0, 0, 1, 1,
-0.8639697, -0.2845586, -3.71831, 0, 0, 0, 1, 1,
-0.8622321, -1.026263, -2.412002, 1, 1, 1, 1, 1,
-0.8590457, -1.887624, -2.706454, 1, 1, 1, 1, 1,
-0.8574179, 0.4957001, -1.16597, 1, 1, 1, 1, 1,
-0.8573393, -0.3800108, -2.789529, 1, 1, 1, 1, 1,
-0.8496647, -0.9067094, -3.068412, 1, 1, 1, 1, 1,
-0.8488725, -0.6796725, -3.624918, 1, 1, 1, 1, 1,
-0.8463271, -0.9566489, -2.634105, 1, 1, 1, 1, 1,
-0.843955, 0.3979287, -2.495679, 1, 1, 1, 1, 1,
-0.8437176, 0.1868916, -1.730739, 1, 1, 1, 1, 1,
-0.8432404, -0.825982, -0.9503304, 1, 1, 1, 1, 1,
-0.8408859, 0.8390054, -0.6982523, 1, 1, 1, 1, 1,
-0.8180638, 1.383792, 0.533143, 1, 1, 1, 1, 1,
-0.8113905, 1.416289, -2.300988, 1, 1, 1, 1, 1,
-0.8103898, -2.450068, -3.8955, 1, 1, 1, 1, 1,
-0.8071114, 1.246244, -1.669839, 1, 1, 1, 1, 1,
-0.8066322, 0.4663113, -1.648735, 0, 0, 1, 1, 1,
-0.8054107, -0.756711, -3.271091, 1, 0, 0, 1, 1,
-0.8022658, -0.8455933, -2.821136, 1, 0, 0, 1, 1,
-0.7852157, -0.6738433, -2.498782, 1, 0, 0, 1, 1,
-0.7816564, -0.2387043, -3.182596, 1, 0, 0, 1, 1,
-0.7805142, -1.070431, -3.195995, 1, 0, 0, 1, 1,
-0.7777549, 1.531745, -1.137784, 0, 0, 0, 1, 1,
-0.7686131, 0.01931172, -1.721355, 0, 0, 0, 1, 1,
-0.7666372, 0.7166204, -3.145142, 0, 0, 0, 1, 1,
-0.7646258, 0.7866076, -0.04601036, 0, 0, 0, 1, 1,
-0.7614437, 0.8952794, -2.22815, 0, 0, 0, 1, 1,
-0.7432014, -0.5415015, -2.806544, 0, 0, 0, 1, 1,
-0.7423108, -0.5299866, -3.504096, 0, 0, 0, 1, 1,
-0.7407086, -1.086124, -3.778572, 1, 1, 1, 1, 1,
-0.7399694, 0.7607316, -1.879729, 1, 1, 1, 1, 1,
-0.7354857, 0.5100202, -1.736238, 1, 1, 1, 1, 1,
-0.7282275, 0.7916904, 0.7729367, 1, 1, 1, 1, 1,
-0.7228034, 1.963112, -0.8154176, 1, 1, 1, 1, 1,
-0.7225284, -1.670897, -3.579612, 1, 1, 1, 1, 1,
-0.7222366, 0.1999959, -0.9758546, 1, 1, 1, 1, 1,
-0.7176201, 0.08953394, -2.514737, 1, 1, 1, 1, 1,
-0.7160701, -0.8529603, -1.781761, 1, 1, 1, 1, 1,
-0.7078387, 0.6052234, -0.5687894, 1, 1, 1, 1, 1,
-0.6880288, -0.607076, -1.594309, 1, 1, 1, 1, 1,
-0.6824765, 0.4503421, -1.795403, 1, 1, 1, 1, 1,
-0.6703955, 0.1895102, -1.388801, 1, 1, 1, 1, 1,
-0.6670055, 1.065748, 0.331034, 1, 1, 1, 1, 1,
-0.6595175, -0.006659251, -2.176959, 1, 1, 1, 1, 1,
-0.6577666, -0.6653886, -3.507111, 0, 0, 1, 1, 1,
-0.6555776, -1.42892, -3.251034, 1, 0, 0, 1, 1,
-0.6555445, -0.3182567, -2.455991, 1, 0, 0, 1, 1,
-0.6491023, -0.1682345, -1.127987, 1, 0, 0, 1, 1,
-0.6478104, -0.9847406, -1.749757, 1, 0, 0, 1, 1,
-0.6453121, -0.4156063, -1.961735, 1, 0, 0, 1, 1,
-0.6443017, -1.323539, -2.397062, 0, 0, 0, 1, 1,
-0.6413518, 0.03369053, -3.221357, 0, 0, 0, 1, 1,
-0.6412553, 0.2506577, -1.766286, 0, 0, 0, 1, 1,
-0.640808, -0.4755589, -0.8376014, 0, 0, 0, 1, 1,
-0.6396015, -0.7258567, -2.710499, 0, 0, 0, 1, 1,
-0.6312848, 2.234759, 1.263873, 0, 0, 0, 1, 1,
-0.6231024, 0.716871, -0.2050532, 0, 0, 0, 1, 1,
-0.6198102, 3.311671, -1.773912, 1, 1, 1, 1, 1,
-0.6179833, -0.6363779, -0.7422897, 1, 1, 1, 1, 1,
-0.6164889, 0.1204342, 0.3117365, 1, 1, 1, 1, 1,
-0.6161746, -0.595715, -3.458338, 1, 1, 1, 1, 1,
-0.6113137, 2.119407, -0.8466736, 1, 1, 1, 1, 1,
-0.6048369, 1.09643, -1.84, 1, 1, 1, 1, 1,
-0.596397, -0.6221794, -1.743067, 1, 1, 1, 1, 1,
-0.5961053, -0.5852793, -2.831143, 1, 1, 1, 1, 1,
-0.5940498, 0.2511871, -0.8552804, 1, 1, 1, 1, 1,
-0.5906824, -1.227621, -1.087975, 1, 1, 1, 1, 1,
-0.5905253, -0.3273847, -2.368711, 1, 1, 1, 1, 1,
-0.5901575, -0.8394462, -2.580999, 1, 1, 1, 1, 1,
-0.5892566, -0.9582745, -1.798931, 1, 1, 1, 1, 1,
-0.587729, 0.1302607, -0.9841189, 1, 1, 1, 1, 1,
-0.5718942, 0.3691946, -1.320659, 1, 1, 1, 1, 1,
-0.5702676, -1.058233, -2.708239, 0, 0, 1, 1, 1,
-0.5681095, 0.8246024, -0.8843307, 1, 0, 0, 1, 1,
-0.5658912, 0.9915243, -0.3893887, 1, 0, 0, 1, 1,
-0.5629517, 0.4063485, -1.561619, 1, 0, 0, 1, 1,
-0.5613641, -0.06215101, -2.994644, 1, 0, 0, 1, 1,
-0.553836, -1.526077, -2.858242, 1, 0, 0, 1, 1,
-0.5471234, -0.5338475, -2.617501, 0, 0, 0, 1, 1,
-0.54702, -0.5496066, -1.680364, 0, 0, 0, 1, 1,
-0.5432999, -0.3814887, -2.553066, 0, 0, 0, 1, 1,
-0.541127, 0.250542, -0.9526758, 0, 0, 0, 1, 1,
-0.5381772, -0.7382236, -3.721441, 0, 0, 0, 1, 1,
-0.5356495, 0.3409213, 0.204852, 0, 0, 0, 1, 1,
-0.5346524, 0.9347185, -0.8398967, 0, 0, 0, 1, 1,
-0.5322587, 1.294193, -0.5658771, 1, 1, 1, 1, 1,
-0.5282853, 0.93748, -0.5261533, 1, 1, 1, 1, 1,
-0.5272577, -0.4095785, -4.331479, 1, 1, 1, 1, 1,
-0.5233918, 0.3955203, 1.458887, 1, 1, 1, 1, 1,
-0.5177544, -0.2759374, -1.585036, 1, 1, 1, 1, 1,
-0.5163202, -0.7068014, -3.249924, 1, 1, 1, 1, 1,
-0.5158032, -1.328706, -2.836542, 1, 1, 1, 1, 1,
-0.5157168, -1.229133, -2.139191, 1, 1, 1, 1, 1,
-0.5090172, 0.8374789, 0.6815601, 1, 1, 1, 1, 1,
-0.5030999, -0.1300325, -2.48278, 1, 1, 1, 1, 1,
-0.5002201, 0.4341024, -0.9880171, 1, 1, 1, 1, 1,
-0.4999074, -1.45945, -2.077238, 1, 1, 1, 1, 1,
-0.4998871, 1.493527, -0.2364747, 1, 1, 1, 1, 1,
-0.4990582, -0.03995823, -1.189718, 1, 1, 1, 1, 1,
-0.4955819, 0.5787631, 0.6594849, 1, 1, 1, 1, 1,
-0.4953505, -2.830606, -2.340106, 0, 0, 1, 1, 1,
-0.4951469, 2.309676, 0.4226305, 1, 0, 0, 1, 1,
-0.4929693, -0.5077131, -2.420905, 1, 0, 0, 1, 1,
-0.4912716, 0.6701553, -1.224309, 1, 0, 0, 1, 1,
-0.4877721, -0.1086535, -2.020445, 1, 0, 0, 1, 1,
-0.487497, -0.4090727, -3.119681, 1, 0, 0, 1, 1,
-0.4849477, 0.04813964, -1.969223, 0, 0, 0, 1, 1,
-0.4843161, 1.433613, 0.01441042, 0, 0, 0, 1, 1,
-0.4774072, 1.034981, -1.143264, 0, 0, 0, 1, 1,
-0.474867, 0.5103925, -0.01342186, 0, 0, 0, 1, 1,
-0.4738038, -1.017683, -2.712076, 0, 0, 0, 1, 1,
-0.4734995, 0.2650413, -1.909385, 0, 0, 0, 1, 1,
-0.4723568, -0.09937526, -1.419708, 0, 0, 0, 1, 1,
-0.4701911, -0.02960626, -1.119924, 1, 1, 1, 1, 1,
-0.463357, -0.1885747, -2.127111, 1, 1, 1, 1, 1,
-0.462411, -0.8275514, -3.306885, 1, 1, 1, 1, 1,
-0.460253, 1.711626, -0.2133941, 1, 1, 1, 1, 1,
-0.4427429, 0.8408151, -0.4323234, 1, 1, 1, 1, 1,
-0.441649, 0.1474687, -1.861541, 1, 1, 1, 1, 1,
-0.4404993, -0.3765438, -2.153795, 1, 1, 1, 1, 1,
-0.4374275, 0.7375561, -1.55792, 1, 1, 1, 1, 1,
-0.4366244, 0.7184605, 0.3770473, 1, 1, 1, 1, 1,
-0.4342986, 0.01657752, -2.793998, 1, 1, 1, 1, 1,
-0.4298807, 0.1198361, -0.05683751, 1, 1, 1, 1, 1,
-0.4258412, -1.046584, -2.754683, 1, 1, 1, 1, 1,
-0.4253879, 0.3480233, -1.33278, 1, 1, 1, 1, 1,
-0.4212303, 0.7142466, -0.6164477, 1, 1, 1, 1, 1,
-0.4204151, 1.684894, -0.5240057, 1, 1, 1, 1, 1,
-0.4197054, 1.603483, 2.826528, 0, 0, 1, 1, 1,
-0.4187755, -1.630781, -3.602921, 1, 0, 0, 1, 1,
-0.3977546, 0.2513369, -1.597415, 1, 0, 0, 1, 1,
-0.3966708, 1.190206, -0.1670501, 1, 0, 0, 1, 1,
-0.3906319, 0.04769032, -1.290183, 1, 0, 0, 1, 1,
-0.3900906, 0.9794781, 0.6180428, 1, 0, 0, 1, 1,
-0.3900894, 1.063023, -0.8939124, 0, 0, 0, 1, 1,
-0.3895241, -0.7563297, -2.559204, 0, 0, 0, 1, 1,
-0.3865418, -0.4463091, -3.707187, 0, 0, 0, 1, 1,
-0.3846639, -1.263951, -2.838603, 0, 0, 0, 1, 1,
-0.3825665, -1.218179, -2.796609, 0, 0, 0, 1, 1,
-0.3823498, -0.1210201, -0.3011324, 0, 0, 0, 1, 1,
-0.3813155, -0.1763899, -1.184971, 0, 0, 0, 1, 1,
-0.3794978, 1.150288, -0.8151746, 1, 1, 1, 1, 1,
-0.3788873, -0.05370907, -2.491024, 1, 1, 1, 1, 1,
-0.376377, -1.744651, -3.021169, 1, 1, 1, 1, 1,
-0.375397, -0.4943689, -2.265876, 1, 1, 1, 1, 1,
-0.3744824, -0.2402562, 0.9055057, 1, 1, 1, 1, 1,
-0.3739904, 0.9057623, 0.7541912, 1, 1, 1, 1, 1,
-0.3718812, 0.03113232, -1.161196, 1, 1, 1, 1, 1,
-0.3700282, 0.1224661, -2.237959, 1, 1, 1, 1, 1,
-0.3689924, -1.292649, -2.504465, 1, 1, 1, 1, 1,
-0.3613439, 0.5333145, 0.3722663, 1, 1, 1, 1, 1,
-0.3586847, -1.311583, -3.147825, 1, 1, 1, 1, 1,
-0.358125, -0.4507683, -2.924157, 1, 1, 1, 1, 1,
-0.354161, 0.2339383, 0.7859427, 1, 1, 1, 1, 1,
-0.3504584, 1.642972, -1.359722, 1, 1, 1, 1, 1,
-0.345857, -0.1411192, -3.400175, 1, 1, 1, 1, 1,
-0.3440878, 0.8854645, -0.3317444, 0, 0, 1, 1, 1,
-0.3380277, 0.9051078, 0.06396251, 1, 0, 0, 1, 1,
-0.3345312, -1.055684, -2.389632, 1, 0, 0, 1, 1,
-0.3294324, 0.5673975, 0.3154405, 1, 0, 0, 1, 1,
-0.3287092, 0.3364302, 0.4934633, 1, 0, 0, 1, 1,
-0.3251214, -1.252374, -2.949839, 1, 0, 0, 1, 1,
-0.3202137, -0.8284112, -2.362216, 0, 0, 0, 1, 1,
-0.3122911, 0.624441, -0.4669144, 0, 0, 0, 1, 1,
-0.3053146, 1.193904, -1.259804, 0, 0, 0, 1, 1,
-0.3050205, -0.06682957, -1.704341, 0, 0, 0, 1, 1,
-0.3027747, -0.7741965, -2.174622, 0, 0, 0, 1, 1,
-0.3000066, -1.296602, -2.571698, 0, 0, 0, 1, 1,
-0.2997728, -0.6269102, -1.410657, 0, 0, 0, 1, 1,
-0.2978655, 0.1998338, -1.04007, 1, 1, 1, 1, 1,
-0.2931377, -0.3069489, -2.427754, 1, 1, 1, 1, 1,
-0.2926432, -1.698396, -2.129591, 1, 1, 1, 1, 1,
-0.2897198, -0.6115335, -3.106805, 1, 1, 1, 1, 1,
-0.2895812, 1.338136, 2.127628, 1, 1, 1, 1, 1,
-0.2857528, 0.3796366, 0.5472022, 1, 1, 1, 1, 1,
-0.285057, 1.229811, -0.9006151, 1, 1, 1, 1, 1,
-0.2836551, 0.7533944, 0.3798377, 1, 1, 1, 1, 1,
-0.2816785, 1.840811, -0.4025451, 1, 1, 1, 1, 1,
-0.2798994, -0.4188556, -2.165726, 1, 1, 1, 1, 1,
-0.2718316, -0.6031526, -3.643636, 1, 1, 1, 1, 1,
-0.2716014, 0.7716244, -0.8171424, 1, 1, 1, 1, 1,
-0.2694877, 1.027167, 0.3272698, 1, 1, 1, 1, 1,
-0.2689206, 0.4617104, 0.05728864, 1, 1, 1, 1, 1,
-0.268387, -0.6481393, -4.179207, 1, 1, 1, 1, 1,
-0.268181, 0.9136041, -1.508346, 0, 0, 1, 1, 1,
-0.2669294, -1.229764, -2.149723, 1, 0, 0, 1, 1,
-0.2630266, -0.9951804, -2.762691, 1, 0, 0, 1, 1,
-0.2601265, -0.8930498, -2.524508, 1, 0, 0, 1, 1,
-0.2573431, -0.3332818, -2.250371, 1, 0, 0, 1, 1,
-0.2496839, 0.0895928, -1.062467, 1, 0, 0, 1, 1,
-0.2387353, 0.8850287, -1.273912, 0, 0, 0, 1, 1,
-0.2383488, 0.8062523, 0.897259, 0, 0, 0, 1, 1,
-0.2380516, 0.4594752, -1.182096, 0, 0, 0, 1, 1,
-0.2349339, -0.02901111, -2.41514, 0, 0, 0, 1, 1,
-0.2333544, 0.5904792, -1.121463, 0, 0, 0, 1, 1,
-0.2316179, 0.807845, 0.1409276, 0, 0, 0, 1, 1,
-0.2283345, -0.7131228, -3.721922, 0, 0, 0, 1, 1,
-0.2229671, 0.5747082, -1.38616, 1, 1, 1, 1, 1,
-0.222746, -0.01179474, -0.6618862, 1, 1, 1, 1, 1,
-0.2206482, -0.09681375, -1.96622, 1, 1, 1, 1, 1,
-0.2171588, -1.111147, -2.535469, 1, 1, 1, 1, 1,
-0.2165168, -0.7070985, -2.235312, 1, 1, 1, 1, 1,
-0.216484, -0.4088504, -3.064878, 1, 1, 1, 1, 1,
-0.2155872, -1.10891, -2.550416, 1, 1, 1, 1, 1,
-0.2132682, -0.7037511, -2.906224, 1, 1, 1, 1, 1,
-0.2121807, 0.1326161, -0.6542107, 1, 1, 1, 1, 1,
-0.2075309, -0.578477, -2.411358, 1, 1, 1, 1, 1,
-0.2033447, -0.739211, -4.448103, 1, 1, 1, 1, 1,
-0.2007087, -1.470613, -4.449826, 1, 1, 1, 1, 1,
-0.1992967, -0.3876444, -2.54904, 1, 1, 1, 1, 1,
-0.198435, -2.274549, -3.092852, 1, 1, 1, 1, 1,
-0.1949273, -1.11065, -3.375004, 1, 1, 1, 1, 1,
-0.1919673, 0.05162179, -1.65086, 0, 0, 1, 1, 1,
-0.18992, -0.8451724, -3.759017, 1, 0, 0, 1, 1,
-0.1892231, 0.3879891, -1.499548, 1, 0, 0, 1, 1,
-0.1885551, -0.626899, -2.417983, 1, 0, 0, 1, 1,
-0.1872266, -1.121552, -1.203495, 1, 0, 0, 1, 1,
-0.1869866, 0.8840665, 0.7088168, 1, 0, 0, 1, 1,
-0.1862968, -0.1514446, -0.6087412, 0, 0, 0, 1, 1,
-0.1853642, -0.2952541, -2.059902, 0, 0, 0, 1, 1,
-0.1827421, -0.02152704, -0.9259486, 0, 0, 0, 1, 1,
-0.1816535, 0.3965053, 0.4321833, 0, 0, 0, 1, 1,
-0.1772772, 0.5964285, 0.3755704, 0, 0, 0, 1, 1,
-0.1742419, 0.2025363, -1.152072, 0, 0, 0, 1, 1,
-0.171988, 0.6864676, -0.4652293, 0, 0, 0, 1, 1,
-0.1713813, -0.6881772, -2.567991, 1, 1, 1, 1, 1,
-0.1707356, -0.4253624, -2.581886, 1, 1, 1, 1, 1,
-0.1684607, -0.905802, -1.796068, 1, 1, 1, 1, 1,
-0.1683559, 0.14943, -1.315117, 1, 1, 1, 1, 1,
-0.165448, -0.2092521, -2.63847, 1, 1, 1, 1, 1,
-0.1627964, 0.1309097, -1.650707, 1, 1, 1, 1, 1,
-0.1558032, 1.266122, 0.911603, 1, 1, 1, 1, 1,
-0.1556799, 0.1748954, -0.8419708, 1, 1, 1, 1, 1,
-0.1549901, 0.9315287, -0.7215337, 1, 1, 1, 1, 1,
-0.1547741, 1.642226, 1.004684, 1, 1, 1, 1, 1,
-0.1537164, 2.033671, -0.09729742, 1, 1, 1, 1, 1,
-0.1536885, 0.9958283, -0.09561756, 1, 1, 1, 1, 1,
-0.1534564, -0.1876244, -1.295184, 1, 1, 1, 1, 1,
-0.1502028, 0.8553364, -0.7976223, 1, 1, 1, 1, 1,
-0.1474162, 1.001766, 1.636814, 1, 1, 1, 1, 1,
-0.1461647, 0.5818874, -0.9178619, 0, 0, 1, 1, 1,
-0.14351, 0.3354209, 0.9540023, 1, 0, 0, 1, 1,
-0.143477, 1.925835, -1.054205, 1, 0, 0, 1, 1,
-0.1363083, -0.4863262, -3.052428, 1, 0, 0, 1, 1,
-0.1336739, -0.2185346, -3.135107, 1, 0, 0, 1, 1,
-0.1320575, -0.3651738, -2.501314, 1, 0, 0, 1, 1,
-0.128626, 0.8820493, -0.6963359, 0, 0, 0, 1, 1,
-0.1283201, -2.721962, -2.10131, 0, 0, 0, 1, 1,
-0.1279237, -0.1985519, -1.40256, 0, 0, 0, 1, 1,
-0.1256759, -1.281445, -4.225085, 0, 0, 0, 1, 1,
-0.1256212, 0.2929968, -1.90405, 0, 0, 0, 1, 1,
-0.1173992, 0.03244802, -1.87056, 0, 0, 0, 1, 1,
-0.1149753, 0.1982916, -1.46139, 0, 0, 0, 1, 1,
-0.1149717, 1.18105, -0.01240935, 1, 1, 1, 1, 1,
-0.114414, -1.062908, -2.018151, 1, 1, 1, 1, 1,
-0.1124143, 0.1543786, 0.1432747, 1, 1, 1, 1, 1,
-0.1109299, -0.9696539, -3.056004, 1, 1, 1, 1, 1,
-0.1105705, 0.1875982, -0.5124162, 1, 1, 1, 1, 1,
-0.1029933, 0.484756, 0.3263102, 1, 1, 1, 1, 1,
-0.1019423, 0.4462755, -1.773334, 1, 1, 1, 1, 1,
-0.09976491, 0.07271611, -0.3144458, 1, 1, 1, 1, 1,
-0.09518833, -0.5068444, -3.89925, 1, 1, 1, 1, 1,
-0.09390876, 0.952126, 0.3966909, 1, 1, 1, 1, 1,
-0.09099863, 0.8601324, -0.2452921, 1, 1, 1, 1, 1,
-0.08997833, -0.3265427, -4.095613, 1, 1, 1, 1, 1,
-0.08780706, 0.4507979, 0.3772858, 1, 1, 1, 1, 1,
-0.08449399, -0.2482517, -3.810508, 1, 1, 1, 1, 1,
-0.082016, -0.9439542, -4.691023, 1, 1, 1, 1, 1,
-0.08198044, 0.2537322, 0.09476937, 0, 0, 1, 1, 1,
-0.08080798, -0.07263757, -2.536646, 1, 0, 0, 1, 1,
-0.07955589, 1.70625, 2.072236, 1, 0, 0, 1, 1,
-0.07777379, -1.013895, -2.718879, 1, 0, 0, 1, 1,
-0.07635183, 0.4450572, -2.288329, 1, 0, 0, 1, 1,
-0.06760084, 0.230184, -0.5001387, 1, 0, 0, 1, 1,
-0.06676499, 0.5036467, 1.066698, 0, 0, 0, 1, 1,
-0.06660166, 0.002997811, -1.74706, 0, 0, 0, 1, 1,
-0.06227325, -0.3736327, -5.432613, 0, 0, 0, 1, 1,
-0.05866712, -1.433366, -2.258731, 0, 0, 0, 1, 1,
-0.05722459, -1.024108, -1.930639, 0, 0, 0, 1, 1,
-0.05439169, 0.8128166, -0.6041321, 0, 0, 0, 1, 1,
-0.05430512, 1.038459, 0.162414, 0, 0, 0, 1, 1,
-0.05034018, -1.188, -0.3262006, 1, 1, 1, 1, 1,
-0.04925724, 1.697333, -0.1520344, 1, 1, 1, 1, 1,
-0.04854077, 1.008918, -0.2677188, 1, 1, 1, 1, 1,
-0.04549586, 1.64967, 1.415719, 1, 1, 1, 1, 1,
-0.04548458, -0.3039871, -1.353311, 1, 1, 1, 1, 1,
-0.04203667, 0.9726142, -0.1723721, 1, 1, 1, 1, 1,
-0.04118293, -0.7102718, -4.62033, 1, 1, 1, 1, 1,
-0.04015959, -1.70956, -1.722464, 1, 1, 1, 1, 1,
-0.04010648, 0.4379641, -0.2111293, 1, 1, 1, 1, 1,
-0.03929124, 0.4617483, -0.4197107, 1, 1, 1, 1, 1,
-0.03911406, 0.9756733, 0.3240337, 1, 1, 1, 1, 1,
-0.03651358, 0.2590815, 0.250642, 1, 1, 1, 1, 1,
-0.03476481, -0.4814591, -1.627324, 1, 1, 1, 1, 1,
-0.03321733, 1.256265, 0.8068098, 1, 1, 1, 1, 1,
-0.03304682, -0.8225828, -3.533276, 1, 1, 1, 1, 1,
-0.02770725, -1.309049, -2.820666, 0, 0, 1, 1, 1,
-0.02669724, 0.5050074, 0.1478678, 1, 0, 0, 1, 1,
-0.02336912, -0.5157975, -2.374539, 1, 0, 0, 1, 1,
-0.02327661, -0.08029987, -4.599425, 1, 0, 0, 1, 1,
-0.02015208, -0.3011052, -3.471643, 1, 0, 0, 1, 1,
-0.01968126, 1.129946, 1.465867, 1, 0, 0, 1, 1,
-0.01735775, -0.9353147, -5.070171, 0, 0, 0, 1, 1,
-0.01116188, -0.1038174, -3.506158, 0, 0, 0, 1, 1,
-0.006549709, 0.2416174, -1.339863, 0, 0, 0, 1, 1,
-0.005942714, -0.06932113, -3.656482, 0, 0, 0, 1, 1,
-0.005630873, 0.4336769, 1.120183, 0, 0, 0, 1, 1,
-0.005589206, 0.9519501, 0.2682906, 0, 0, 0, 1, 1,
-0.005341057, -3.195437, -4.384819, 0, 0, 0, 1, 1,
-0.002930172, 1.595274, 0.07318364, 1, 1, 1, 1, 1,
-0.001919972, -0.2012577, -2.673162, 1, 1, 1, 1, 1,
-0.001270762, 0.4133365, -0.3065655, 1, 1, 1, 1, 1,
0.0001376393, -0.2060136, 4.427383, 1, 1, 1, 1, 1,
0.0004473398, -1.051447, 3.107347, 1, 1, 1, 1, 1,
0.0055564, 1.080078, 0.1103151, 1, 1, 1, 1, 1,
0.01032271, -0.7609261, 2.648237, 1, 1, 1, 1, 1,
0.01250335, -1.528276, 5.727268, 1, 1, 1, 1, 1,
0.01285246, 0.5152205, -0.6990862, 1, 1, 1, 1, 1,
0.0136927, 1.559047, -0.2103466, 1, 1, 1, 1, 1,
0.01542448, -0.9701334, 2.789452, 1, 1, 1, 1, 1,
0.01993824, 0.9275278, -0.3765336, 1, 1, 1, 1, 1,
0.02612207, -1.400415, 2.079586, 1, 1, 1, 1, 1,
0.02874236, 1.527494, -0.2029139, 1, 1, 1, 1, 1,
0.03222913, -0.4821151, 2.572923, 1, 1, 1, 1, 1,
0.03813957, 0.26078, -0.4226194, 0, 0, 1, 1, 1,
0.03836746, -0.5955709, 3.815317, 1, 0, 0, 1, 1,
0.03869871, 0.6084503, 0.6034338, 1, 0, 0, 1, 1,
0.04375542, -0.2781031, 2.831217, 1, 0, 0, 1, 1,
0.04490613, 1.17672, -0.4969331, 1, 0, 0, 1, 1,
0.0522022, -0.9572238, 1.770344, 1, 0, 0, 1, 1,
0.06206817, 1.470032, 0.444419, 0, 0, 0, 1, 1,
0.06243799, 0.7755381, 0.1857027, 0, 0, 0, 1, 1,
0.06307832, -1.648779, 1.938004, 0, 0, 0, 1, 1,
0.06637134, 1.013629, -0.2274, 0, 0, 0, 1, 1,
0.06805455, 0.1173699, 0.7194847, 0, 0, 0, 1, 1,
0.06876121, 0.8622732, 2.277077, 0, 0, 0, 1, 1,
0.0725174, 0.6072454, 1.68495, 0, 0, 0, 1, 1,
0.07322357, 1.610699, -1.235355, 1, 1, 1, 1, 1,
0.07511286, -1.479164, 3.306129, 1, 1, 1, 1, 1,
0.08043217, 1.21155, 1.383585, 1, 1, 1, 1, 1,
0.08382931, -0.7777589, 5.031857, 1, 1, 1, 1, 1,
0.08433462, -0.7049807, 3.345466, 1, 1, 1, 1, 1,
0.08473752, -0.8434061, 1.841153, 1, 1, 1, 1, 1,
0.08638118, -0.3521796, 1.030077, 1, 1, 1, 1, 1,
0.08912527, 0.5336461, 0.05114449, 1, 1, 1, 1, 1,
0.0891981, 1.265878, 0.1208938, 1, 1, 1, 1, 1,
0.0948176, -1.481774, 0.9190453, 1, 1, 1, 1, 1,
0.09764405, 0.4424626, -0.08291458, 1, 1, 1, 1, 1,
0.09979264, 0.03034215, 1.253153, 1, 1, 1, 1, 1,
0.1017291, -1.291367, 5.349888, 1, 1, 1, 1, 1,
0.1018071, 0.2020987, 1.043825, 1, 1, 1, 1, 1,
0.1019439, -0.2902802, 3.201139, 1, 1, 1, 1, 1,
0.1024803, -0.8770798, 3.524926, 0, 0, 1, 1, 1,
0.1036737, -0.07948661, 1.903719, 1, 0, 0, 1, 1,
0.1073451, 0.5327317, -0.3699717, 1, 0, 0, 1, 1,
0.1091373, 0.2219226, 2.874721, 1, 0, 0, 1, 1,
0.1103659, -1.374969, 1.803998, 1, 0, 0, 1, 1,
0.1115124, 0.4926538, -0.7377824, 1, 0, 0, 1, 1,
0.1151661, -0.320392, 2.257832, 0, 0, 0, 1, 1,
0.1152014, -0.5499927, 4.781423, 0, 0, 0, 1, 1,
0.1155434, 0.2768656, 1.497917, 0, 0, 0, 1, 1,
0.1166166, -1.144156, 4.156087, 0, 0, 0, 1, 1,
0.1170734, -1.864522, 3.432664, 0, 0, 0, 1, 1,
0.1172635, 1.66269, 0.01651908, 0, 0, 0, 1, 1,
0.1177267, 2.42831, 0.6138919, 0, 0, 0, 1, 1,
0.1215788, -0.7253488, 4.0054, 1, 1, 1, 1, 1,
0.1227667, -1.209578, 2.624971, 1, 1, 1, 1, 1,
0.1236191, 0.6208686, -0.7914923, 1, 1, 1, 1, 1,
0.1303969, -0.1151056, 1.912391, 1, 1, 1, 1, 1,
0.1327254, 0.6157087, 0.9187815, 1, 1, 1, 1, 1,
0.1411167, 0.2124177, -1.914982, 1, 1, 1, 1, 1,
0.1423094, -0.4614337, 1.057052, 1, 1, 1, 1, 1,
0.1426479, -1.465699, 3.136064, 1, 1, 1, 1, 1,
0.1453231, 0.3723611, 0.1750411, 1, 1, 1, 1, 1,
0.157095, -0.5605904, 2.144316, 1, 1, 1, 1, 1,
0.157815, 0.227638, 0.1178091, 1, 1, 1, 1, 1,
0.1589546, 0.3664298, 0.3281838, 1, 1, 1, 1, 1,
0.1600621, 0.009873074, 0.4673347, 1, 1, 1, 1, 1,
0.1640743, -0.3363535, 3.019583, 1, 1, 1, 1, 1,
0.1647434, -0.302288, 3.597517, 1, 1, 1, 1, 1,
0.1656091, 0.7863063, -0.09037763, 0, 0, 1, 1, 1,
0.1685529, -0.5365407, 2.485253, 1, 0, 0, 1, 1,
0.1700979, -0.4617814, 2.345535, 1, 0, 0, 1, 1,
0.1795827, 0.1399105, -0.9296145, 1, 0, 0, 1, 1,
0.1797597, 0.03802365, 0.8376124, 1, 0, 0, 1, 1,
0.1828639, 1.411267, 0.3716961, 1, 0, 0, 1, 1,
0.1864387, -0.2829796, 3.865114, 0, 0, 0, 1, 1,
0.1883916, 2.11445, -0.9433258, 0, 0, 0, 1, 1,
0.1888857, -1.175754, 2.775578, 0, 0, 0, 1, 1,
0.1893794, 2.2934, -0.2519682, 0, 0, 0, 1, 1,
0.1930203, -0.2641335, 2.862847, 0, 0, 0, 1, 1,
0.1980547, 0.2137698, 1.564535, 0, 0, 0, 1, 1,
0.2017971, 0.2800385, 1.424493, 0, 0, 0, 1, 1,
0.2067753, -0.3633079, 1.50868, 1, 1, 1, 1, 1,
0.2145079, 0.8570775, -1.058241, 1, 1, 1, 1, 1,
0.2157575, -0.7015101, 1.564597, 1, 1, 1, 1, 1,
0.216011, -0.5145154, 3.964657, 1, 1, 1, 1, 1,
0.2163323, 0.5871857, -0.497428, 1, 1, 1, 1, 1,
0.2200005, -0.4839346, 3.027885, 1, 1, 1, 1, 1,
0.2200619, -1.859424, 1.935205, 1, 1, 1, 1, 1,
0.2208181, 0.2220606, 1.852572, 1, 1, 1, 1, 1,
0.2213633, -1.931139, 1.591709, 1, 1, 1, 1, 1,
0.222975, 0.4302368, 2.45791, 1, 1, 1, 1, 1,
0.2234986, 0.759968, -0.8317559, 1, 1, 1, 1, 1,
0.2252063, -1.249149, 2.664391, 1, 1, 1, 1, 1,
0.2282483, 0.3073263, 1.031969, 1, 1, 1, 1, 1,
0.2309154, -0.1438034, 2.195889, 1, 1, 1, 1, 1,
0.2312143, -1.795168, 3.353548, 1, 1, 1, 1, 1,
0.2335055, 1.57864, -1.444901, 0, 0, 1, 1, 1,
0.2376595, 0.9814534, -0.57473, 1, 0, 0, 1, 1,
0.2390183, -0.7650011, 2.575565, 1, 0, 0, 1, 1,
0.2413115, 0.9902669, 0.7713057, 1, 0, 0, 1, 1,
0.2440752, 0.7778978, 0.7837612, 1, 0, 0, 1, 1,
0.2446168, 0.2387801, 0.7518862, 1, 0, 0, 1, 1,
0.2447485, 1.370191, 0.6446313, 0, 0, 0, 1, 1,
0.2450896, 0.1674312, 2.342942, 0, 0, 0, 1, 1,
0.2452863, 0.8005431, 0.151363, 0, 0, 0, 1, 1,
0.2457378, -0.8282645, 3.761533, 0, 0, 0, 1, 1,
0.2471879, -1.213881, 4.727102, 0, 0, 0, 1, 1,
0.248463, -0.4183092, 3.477022, 0, 0, 0, 1, 1,
0.2566325, -1.126625, 3.237979, 0, 0, 0, 1, 1,
0.256831, 2.13991, -0.9535762, 1, 1, 1, 1, 1,
0.2613361, -0.3227158, 3.783544, 1, 1, 1, 1, 1,
0.2628458, -0.2062262, 3.580723, 1, 1, 1, 1, 1,
0.2633456, 0.4393663, 1.353567, 1, 1, 1, 1, 1,
0.2660272, -0.03396982, 2.577388, 1, 1, 1, 1, 1,
0.2757186, -1.300348, 3.033311, 1, 1, 1, 1, 1,
0.2796239, 0.8333746, -0.9330423, 1, 1, 1, 1, 1,
0.2805721, 1.358891, -0.3781442, 1, 1, 1, 1, 1,
0.2819202, 2.030364, -1.536296, 1, 1, 1, 1, 1,
0.2851345, 0.06104656, 1.533016, 1, 1, 1, 1, 1,
0.2868042, -0.9186391, 2.487076, 1, 1, 1, 1, 1,
0.2938908, 1.352161, -1.615555, 1, 1, 1, 1, 1,
0.2941426, -0.7193695, 1.346802, 1, 1, 1, 1, 1,
0.2952353, 0.1181133, 0.4755794, 1, 1, 1, 1, 1,
0.2974306, 1.614214, -2.042562, 1, 1, 1, 1, 1,
0.2989193, 0.6256649, 0.8754978, 0, 0, 1, 1, 1,
0.3025886, -0.1445004, 1.262026, 1, 0, 0, 1, 1,
0.3046387, 0.6083754, 0.8628159, 1, 0, 0, 1, 1,
0.3059981, -0.654, 3.915058, 1, 0, 0, 1, 1,
0.3078268, 1.553901, 0.6638275, 1, 0, 0, 1, 1,
0.3097136, 0.3704511, 1.302344, 1, 0, 0, 1, 1,
0.3098701, 0.719511, 1.774801, 0, 0, 0, 1, 1,
0.3104033, -1.661717, 3.241956, 0, 0, 0, 1, 1,
0.311946, 0.6068791, 0.1542473, 0, 0, 0, 1, 1,
0.3121189, 0.3708924, 1.601374, 0, 0, 0, 1, 1,
0.3127844, -0.1251103, 2.106622, 0, 0, 0, 1, 1,
0.3179163, -1.269993, 2.199537, 0, 0, 0, 1, 1,
0.3185585, 0.3026032, 0.5700409, 0, 0, 0, 1, 1,
0.3194301, 0.952326, -0.6420225, 1, 1, 1, 1, 1,
0.3204964, -1.25498, 4.082383, 1, 1, 1, 1, 1,
0.3298798, 2.079431, -0.3531545, 1, 1, 1, 1, 1,
0.3330303, -1.02551, 0.378738, 1, 1, 1, 1, 1,
0.3353926, -0.4613492, 2.170821, 1, 1, 1, 1, 1,
0.3354434, 0.6926519, 0.9705763, 1, 1, 1, 1, 1,
0.3366038, 1.162338, 0.2594887, 1, 1, 1, 1, 1,
0.3370759, -0.5180116, 0.6114661, 1, 1, 1, 1, 1,
0.3374026, -1.020592, 4.832081, 1, 1, 1, 1, 1,
0.3383819, -0.9017121, 3.873233, 1, 1, 1, 1, 1,
0.3393412, 1.00165, 0.4988081, 1, 1, 1, 1, 1,
0.3419327, -1.408607, 2.805144, 1, 1, 1, 1, 1,
0.3512941, 1.781869, 0.4313928, 1, 1, 1, 1, 1,
0.3565117, -0.1056336, 2.006733, 1, 1, 1, 1, 1,
0.3573273, -0.4632354, 1.329121, 1, 1, 1, 1, 1,
0.3606079, 0.948984, -3.170785, 0, 0, 1, 1, 1,
0.3666036, -1.537991, 3.559947, 1, 0, 0, 1, 1,
0.3684565, -0.3023022, 1.490623, 1, 0, 0, 1, 1,
0.3695408, -0.07152735, 2.236909, 1, 0, 0, 1, 1,
0.3701479, 1.217016, 2.028751, 1, 0, 0, 1, 1,
0.3714784, 0.1303275, -0.04873711, 1, 0, 0, 1, 1,
0.3730373, 0.5597836, 0.3655639, 0, 0, 0, 1, 1,
0.374976, -0.7597131, 2.063588, 0, 0, 0, 1, 1,
0.3759127, 0.3081488, 0.9422659, 0, 0, 0, 1, 1,
0.3790436, -0.5247788, 3.48835, 0, 0, 0, 1, 1,
0.3802004, -2.693921, 2.19557, 0, 0, 0, 1, 1,
0.3802312, 1.073369, -0.6966466, 0, 0, 0, 1, 1,
0.3857191, 0.5930884, 0.09305122, 0, 0, 0, 1, 1,
0.3865377, 0.2356435, 1.616128, 1, 1, 1, 1, 1,
0.3876984, 0.6587813, 1.101224, 1, 1, 1, 1, 1,
0.3934594, -0.3037366, 2.444106, 1, 1, 1, 1, 1,
0.3989258, 0.3572229, -0.4417903, 1, 1, 1, 1, 1,
0.3991037, 0.9003122, 0.1066736, 1, 1, 1, 1, 1,
0.3995898, 0.1603237, 1.256045, 1, 1, 1, 1, 1,
0.3997332, 1.175539, 0.6325634, 1, 1, 1, 1, 1,
0.4044262, -1.413136, 2.629021, 1, 1, 1, 1, 1,
0.4045526, -0.8226073, 1.417342, 1, 1, 1, 1, 1,
0.4077472, -1.140545, 2.272692, 1, 1, 1, 1, 1,
0.4096887, 0.5537157, 1.281022, 1, 1, 1, 1, 1,
0.4141581, 2.054844, 0.08627779, 1, 1, 1, 1, 1,
0.4145397, 0.3319265, 1.729014, 1, 1, 1, 1, 1,
0.4200101, 0.134582, 0.1737839, 1, 1, 1, 1, 1,
0.4210188, 0.2327783, 1.478224, 1, 1, 1, 1, 1,
0.421039, 2.442951, 0.1868412, 0, 0, 1, 1, 1,
0.4215234, 0.839443, 0.407094, 1, 0, 0, 1, 1,
0.4279862, -0.07565475, 2.007619, 1, 0, 0, 1, 1,
0.4327298, 1.751856, 0.5126221, 1, 0, 0, 1, 1,
0.4414514, 1.394239, 1.490351, 1, 0, 0, 1, 1,
0.4446233, -0.1253957, 1.583565, 1, 0, 0, 1, 1,
0.4535508, -1.068329, 3.163604, 0, 0, 0, 1, 1,
0.4583469, 1.311472, -0.8102793, 0, 0, 0, 1, 1,
0.4590233, 1.437189, 0.9063737, 0, 0, 0, 1, 1,
0.4641413, -0.4690493, 1.311716, 0, 0, 0, 1, 1,
0.4651611, 0.05480587, -0.00996092, 0, 0, 0, 1, 1,
0.4664562, -0.2558567, 4.369203, 0, 0, 0, 1, 1,
0.4761449, 2.323019, 0.1225203, 0, 0, 0, 1, 1,
0.4807759, 1.694967, -0.730491, 1, 1, 1, 1, 1,
0.4814555, -1.079572, 2.705194, 1, 1, 1, 1, 1,
0.4871505, -0.7500861, 3.731737, 1, 1, 1, 1, 1,
0.4873667, -0.8298079, 2.042176, 1, 1, 1, 1, 1,
0.4896115, 0.8301505, 0.9537309, 1, 1, 1, 1, 1,
0.4898201, 2.018743, 0.8460478, 1, 1, 1, 1, 1,
0.4912798, 0.907212, -0.2883859, 1, 1, 1, 1, 1,
0.497815, -0.9209198, 2.377692, 1, 1, 1, 1, 1,
0.4988348, 0.8874997, 0.162325, 1, 1, 1, 1, 1,
0.49932, -1.064043, 4.180617, 1, 1, 1, 1, 1,
0.5073193, -0.4340557, 2.274594, 1, 1, 1, 1, 1,
0.5129885, -1.650409, 0.9280117, 1, 1, 1, 1, 1,
0.5156543, -0.09016271, 1.156027, 1, 1, 1, 1, 1,
0.5173899, 0.2013326, 0.04990952, 1, 1, 1, 1, 1,
0.5179947, -0.4925992, 0.5170486, 1, 1, 1, 1, 1,
0.5184305, 0.2676148, 1.116133, 0, 0, 1, 1, 1,
0.5258378, 0.05565842, 2.430792, 1, 0, 0, 1, 1,
0.5277278, -2.774637, 2.80744, 1, 0, 0, 1, 1,
0.5323573, -0.1727188, 2.729623, 1, 0, 0, 1, 1,
0.5383978, 1.335743, -0.4718357, 1, 0, 0, 1, 1,
0.544503, 0.518828, 0.6376347, 1, 0, 0, 1, 1,
0.5476757, 0.2459287, 2.48606, 0, 0, 0, 1, 1,
0.5495964, 0.5645016, 0.2520783, 0, 0, 0, 1, 1,
0.5567143, -1.590719, 2.91256, 0, 0, 0, 1, 1,
0.5589567, 1.430494, -0.2216988, 0, 0, 0, 1, 1,
0.5619699, -0.186118, 1.749546, 0, 0, 0, 1, 1,
0.5627377, -0.1843634, -0.1391568, 0, 0, 0, 1, 1,
0.5645118, -0.4933262, 2.460363, 0, 0, 0, 1, 1,
0.568584, 0.6395127, 0.2309333, 1, 1, 1, 1, 1,
0.5703951, -0.2832811, 1.682341, 1, 1, 1, 1, 1,
0.5772441, 0.6685312, 1.236508, 1, 1, 1, 1, 1,
0.5805967, 0.5294103, 0.6790234, 1, 1, 1, 1, 1,
0.5807427, -0.9824684, 2.208381, 1, 1, 1, 1, 1,
0.5810099, -0.697176, 2.502267, 1, 1, 1, 1, 1,
0.5819117, 1.499387, 0.162776, 1, 1, 1, 1, 1,
0.583643, -2.256143, 3.175471, 1, 1, 1, 1, 1,
0.5878632, -1.051261, 3.872684, 1, 1, 1, 1, 1,
0.5992436, -0.2301442, 2.826149, 1, 1, 1, 1, 1,
0.6006978, 0.4274208, 1.262948, 1, 1, 1, 1, 1,
0.6022512, 0.2168095, 0.8146124, 1, 1, 1, 1, 1,
0.6054006, -0.7904514, 3.340614, 1, 1, 1, 1, 1,
0.606301, 1.016691, -0.7417871, 1, 1, 1, 1, 1,
0.6075372, -0.9110628, 1.672082, 1, 1, 1, 1, 1,
0.6105892, -1.420678, 2.149602, 0, 0, 1, 1, 1,
0.6115205, -0.2577262, 1.963095, 1, 0, 0, 1, 1,
0.6174047, -1.453889, 3.299084, 1, 0, 0, 1, 1,
0.6209478, 0.8324816, 1.225334, 1, 0, 0, 1, 1,
0.6216997, 0.7285901, 0.6637868, 1, 0, 0, 1, 1,
0.6248081, 0.5684655, 0.8518581, 1, 0, 0, 1, 1,
0.6262112, -1.038526, 2.761202, 0, 0, 0, 1, 1,
0.6335266, -1.093837, 4.069597, 0, 0, 0, 1, 1,
0.6397594, -0.4981626, 1.614755, 0, 0, 0, 1, 1,
0.6555749, 0.5203465, -0.3920777, 0, 0, 0, 1, 1,
0.6627085, 0.1105492, 1.801562, 0, 0, 0, 1, 1,
0.6646398, -1.580233, 2.60093, 0, 0, 0, 1, 1,
0.6673219, -0.6763935, 1.516808, 0, 0, 0, 1, 1,
0.6702996, 1.195408, 0.8372937, 1, 1, 1, 1, 1,
0.6708162, 0.7723731, 1.114715, 1, 1, 1, 1, 1,
0.6743242, 0.100552, 1.746164, 1, 1, 1, 1, 1,
0.6775145, 0.4363419, -0.3991232, 1, 1, 1, 1, 1,
0.6780613, 1.204527, 0.4950797, 1, 1, 1, 1, 1,
0.6801354, 0.2530482, 1.00068, 1, 1, 1, 1, 1,
0.6827803, -0.6997781, 0.9457996, 1, 1, 1, 1, 1,
0.682907, -0.921182, 3.720392, 1, 1, 1, 1, 1,
0.683585, -0.9908113, 2.683151, 1, 1, 1, 1, 1,
0.6850097, -1.047875, 1.907317, 1, 1, 1, 1, 1,
0.6863306, -0.67418, 2.139915, 1, 1, 1, 1, 1,
0.6882165, 1.11158, 0.0845377, 1, 1, 1, 1, 1,
0.6890155, 1.468804, 0.465225, 1, 1, 1, 1, 1,
0.6891262, 0.7171745, 2.071526, 1, 1, 1, 1, 1,
0.6922094, -0.2356546, 2.81445, 1, 1, 1, 1, 1,
0.6933464, 1.546992, 0.9178446, 0, 0, 1, 1, 1,
0.6962578, 0.1563696, 0.2938246, 1, 0, 0, 1, 1,
0.7066225, -1.082615, 3.10758, 1, 0, 0, 1, 1,
0.7115786, -0.01654734, 1.314779, 1, 0, 0, 1, 1,
0.7165176, 0.4463041, 0.966862, 1, 0, 0, 1, 1,
0.7166991, 1.010651, 2.176241, 1, 0, 0, 1, 1,
0.7188162, -0.593784, 3.731094, 0, 0, 0, 1, 1,
0.7213019, 1.124747, -0.9048885, 0, 0, 0, 1, 1,
0.7249592, 0.1239592, 2.192253, 0, 0, 0, 1, 1,
0.7277513, 0.07143451, 1.287337, 0, 0, 0, 1, 1,
0.7429323, -0.1045735, 1.039879, 0, 0, 0, 1, 1,
0.7433817, -1.484643, 1.937692, 0, 0, 0, 1, 1,
0.7436588, 0.6077738, -0.5390887, 0, 0, 0, 1, 1,
0.7447081, 1.461812, 0.1982119, 1, 1, 1, 1, 1,
0.745405, 0.4099032, 1.138821, 1, 1, 1, 1, 1,
0.748312, 0.8796133, 2.782865, 1, 1, 1, 1, 1,
0.7485665, 0.195643, 1.267838, 1, 1, 1, 1, 1,
0.7507045, -0.966426, 2.803201, 1, 1, 1, 1, 1,
0.7525132, 0.8602579, 1.006835, 1, 1, 1, 1, 1,
0.7555227, -1.511549, 2.098734, 1, 1, 1, 1, 1,
0.7582659, 1.422164, 1.797042, 1, 1, 1, 1, 1,
0.7629017, 0.5097387, 1.614832, 1, 1, 1, 1, 1,
0.7680037, 1.915081, 1.305196, 1, 1, 1, 1, 1,
0.7708519, 0.003629863, 0.6403602, 1, 1, 1, 1, 1,
0.7711095, -1.253724, 1.850698, 1, 1, 1, 1, 1,
0.7718952, -0.6342844, 1.560374, 1, 1, 1, 1, 1,
0.7767614, -0.05399291, 0.8415846, 1, 1, 1, 1, 1,
0.7768963, 0.6262891, 0.442353, 1, 1, 1, 1, 1,
0.7786186, -1.031148, 2.028978, 0, 0, 1, 1, 1,
0.7786328, 1.818686, -0.3357947, 1, 0, 0, 1, 1,
0.7812464, -0.5698636, 3.229675, 1, 0, 0, 1, 1,
0.7869176, 0.4589339, 2.216155, 1, 0, 0, 1, 1,
0.7911593, -0.7531386, 2.761537, 1, 0, 0, 1, 1,
0.792062, 1.481925, 1.050139, 1, 0, 0, 1, 1,
0.793014, 0.5495702, -1.12483, 0, 0, 0, 1, 1,
0.7967902, 0.6693984, -0.6690415, 0, 0, 0, 1, 1,
0.7976548, -0.9527761, 0.5609291, 0, 0, 0, 1, 1,
0.8019196, 0.2908286, 0.687606, 0, 0, 0, 1, 1,
0.8067533, -0.9813617, 1.51788, 0, 0, 0, 1, 1,
0.8096088, 0.1590002, 1.115119, 0, 0, 0, 1, 1,
0.811771, 0.9641453, -0.1836149, 0, 0, 0, 1, 1,
0.8120111, -0.2922031, 2.872164, 1, 1, 1, 1, 1,
0.8201845, 0.8098808, 1.395266, 1, 1, 1, 1, 1,
0.8211617, -0.1148692, 2.552043, 1, 1, 1, 1, 1,
0.8225367, 0.4932588, 0.7811005, 1, 1, 1, 1, 1,
0.8254518, -0.8380245, 4.307283, 1, 1, 1, 1, 1,
0.827792, -1.611174, 3.802861, 1, 1, 1, 1, 1,
0.8316317, -0.8180358, 2.337848, 1, 1, 1, 1, 1,
0.8324262, -0.06077635, 1.722606, 1, 1, 1, 1, 1,
0.8330764, -0.01082317, 2.16069, 1, 1, 1, 1, 1,
0.8346766, -0.6890488, 3.576435, 1, 1, 1, 1, 1,
0.8410496, 0.4374241, 0.443774, 1, 1, 1, 1, 1,
0.842962, -1.165016, 1.214142, 1, 1, 1, 1, 1,
0.8434131, 0.03008248, 0.7347138, 1, 1, 1, 1, 1,
0.8463531, 0.1876445, 2.472464, 1, 1, 1, 1, 1,
0.8468222, -1.908576, 1.403977, 1, 1, 1, 1, 1,
0.8523842, -0.3111319, 0.6661327, 0, 0, 1, 1, 1,
0.8564528, 0.8870484, -0.7271441, 1, 0, 0, 1, 1,
0.8581716, 1.141466, 0.7738638, 1, 0, 0, 1, 1,
0.8584036, 1.451771, -0.6177157, 1, 0, 0, 1, 1,
0.862524, -1.061988, 2.984404, 1, 0, 0, 1, 1,
0.8725411, 0.3356054, -0.5076599, 1, 0, 0, 1, 1,
0.8768933, -1.536423, 1.79705, 0, 0, 0, 1, 1,
0.8822792, 0.7800323, 0.6426395, 0, 0, 0, 1, 1,
0.8850414, -1.158492, 1.954708, 0, 0, 0, 1, 1,
0.8853893, -0.1685115, -0.0204305, 0, 0, 0, 1, 1,
0.8873641, -0.905459, 2.80082, 0, 0, 0, 1, 1,
0.8876337, 2.190849, 2.124441, 0, 0, 0, 1, 1,
0.8928862, -0.03158217, 1.591414, 0, 0, 0, 1, 1,
0.9020863, 1.634063, 1.455414, 1, 1, 1, 1, 1,
0.9070075, -0.7086463, 2.220002, 1, 1, 1, 1, 1,
0.9073488, 0.4985285, 1.233337, 1, 1, 1, 1, 1,
0.9098624, 0.1676223, 0.4486842, 1, 1, 1, 1, 1,
0.9104332, 0.613911, 1.336366, 1, 1, 1, 1, 1,
0.9123926, -1.667306, 0.05972519, 1, 1, 1, 1, 1,
0.9298645, 2.571373, -1.103126, 1, 1, 1, 1, 1,
0.9371037, -0.1814873, 1.292817, 1, 1, 1, 1, 1,
0.9498437, 0.01916387, 1.627932, 1, 1, 1, 1, 1,
0.9640912, 0.7673774, 2.141154, 1, 1, 1, 1, 1,
0.9772254, 0.7846314, 1.444091, 1, 1, 1, 1, 1,
0.9827275, -0.09571811, 2.067218, 1, 1, 1, 1, 1,
0.9931129, 0.1539287, 1.772459, 1, 1, 1, 1, 1,
0.9941944, -0.1026528, 3.381214, 1, 1, 1, 1, 1,
0.994911, -0.7098851, -0.4897634, 1, 1, 1, 1, 1,
1.004555, -0.1282833, 1.98063, 0, 0, 1, 1, 1,
1.010903, -0.9906992, 1.116762, 1, 0, 0, 1, 1,
1.011676, 1.330661, 0.459745, 1, 0, 0, 1, 1,
1.021338, -1.183014, 2.025322, 1, 0, 0, 1, 1,
1.025435, -0.2247135, 0.2694309, 1, 0, 0, 1, 1,
1.034381, 0.2067899, 0.9459718, 1, 0, 0, 1, 1,
1.043581, -0.1330319, 1.280296, 0, 0, 0, 1, 1,
1.044822, -0.3309892, 2.123093, 0, 0, 0, 1, 1,
1.049861, -0.4496501, 3.158998, 0, 0, 0, 1, 1,
1.051239, 0.701585, 0.03648423, 0, 0, 0, 1, 1,
1.053318, -0.4874214, 1.549711, 0, 0, 0, 1, 1,
1.054115, 0.9191892, 0.4045356, 0, 0, 0, 1, 1,
1.054329, -0.4285733, 3.542268, 0, 0, 0, 1, 1,
1.055997, 0.3397356, 1.056546, 1, 1, 1, 1, 1,
1.057029, 1.172346, 0.6386713, 1, 1, 1, 1, 1,
1.059951, -1.482604, 3.422136, 1, 1, 1, 1, 1,
1.061269, 1.518607, -0.8705661, 1, 1, 1, 1, 1,
1.071554, 0.4836025, 1.036913, 1, 1, 1, 1, 1,
1.073974, 0.3769276, 1.598693, 1, 1, 1, 1, 1,
1.075701, -1.547038, 2.081179, 1, 1, 1, 1, 1,
1.07624, -1.203959, 2.144967, 1, 1, 1, 1, 1,
1.076651, -0.1581286, 1.922227, 1, 1, 1, 1, 1,
1.086744, 0.1899032, 2.91336, 1, 1, 1, 1, 1,
1.087342, -0.5085685, 3.202325, 1, 1, 1, 1, 1,
1.091526, -1.843008, 3.033581, 1, 1, 1, 1, 1,
1.093059, 0.8790103, 1.618177, 1, 1, 1, 1, 1,
1.099363, -1.673533, 1.658115, 1, 1, 1, 1, 1,
1.101989, -1.847847, 2.261269, 1, 1, 1, 1, 1,
1.108933, -0.7572557, 0.7277116, 0, 0, 1, 1, 1,
1.109317, 0.01444223, 2.044881, 1, 0, 0, 1, 1,
1.112043, 0.2294845, 2.778773, 1, 0, 0, 1, 1,
1.1148, -0.1792173, 3.97085, 1, 0, 0, 1, 1,
1.120521, 0.8060417, 1.94051, 1, 0, 0, 1, 1,
1.12165, 0.6955873, 0.8387985, 1, 0, 0, 1, 1,
1.125993, 0.3950467, 1.82104, 0, 0, 0, 1, 1,
1.127216, -0.8589362, 0.4011556, 0, 0, 0, 1, 1,
1.128967, 2.903986, 0.06493829, 0, 0, 0, 1, 1,
1.133614, -0.9795083, 1.692674, 0, 0, 0, 1, 1,
1.13385, -0.2809252, 0.8369266, 0, 0, 0, 1, 1,
1.157818, -0.1610129, 2.631449, 0, 0, 0, 1, 1,
1.163598, 0.1979118, 2.586119, 0, 0, 0, 1, 1,
1.165691, 0.9964908, -0.04880831, 1, 1, 1, 1, 1,
1.178115, -0.6190742, 2.922812, 1, 1, 1, 1, 1,
1.181536, -1.391179, 2.446784, 1, 1, 1, 1, 1,
1.18165, -0.6972159, 1.196963, 1, 1, 1, 1, 1,
1.183025, 1.640925, 2.008347, 1, 1, 1, 1, 1,
1.18862, 0.06177135, 0.6967801, 1, 1, 1, 1, 1,
1.190466, -0.2603156, 1.233861, 1, 1, 1, 1, 1,
1.191435, 0.6233348, 1.321647, 1, 1, 1, 1, 1,
1.196837, 0.09178977, 0.5237071, 1, 1, 1, 1, 1,
1.198527, 0.02139555, 2.726987, 1, 1, 1, 1, 1,
1.200475, 0.166845, 0.4822758, 1, 1, 1, 1, 1,
1.208307, -1.273807, 0.7435123, 1, 1, 1, 1, 1,
1.210235, -0.739815, 3.087535, 1, 1, 1, 1, 1,
1.211542, -0.811257, 0.7995656, 1, 1, 1, 1, 1,
1.221863, -0.7838696, 2.924991, 1, 1, 1, 1, 1,
1.23014, -1.677005, 1.264295, 0, 0, 1, 1, 1,
1.23148, 0.1501187, 1.300546, 1, 0, 0, 1, 1,
1.236826, 0.7663004, 0.4162366, 1, 0, 0, 1, 1,
1.239159, 0.9674124, 1.795854, 1, 0, 0, 1, 1,
1.240153, 0.5887455, 1.938229, 1, 0, 0, 1, 1,
1.240346, -1.454855, 3.380439, 1, 0, 0, 1, 1,
1.240441, 1.242714, -1.103124, 0, 0, 0, 1, 1,
1.240692, 0.09380033, 2.115014, 0, 0, 0, 1, 1,
1.250044, 0.5250089, 0.4553132, 0, 0, 0, 1, 1,
1.250084, 0.6606651, 1.22611, 0, 0, 0, 1, 1,
1.250745, 0.6868476, 2.080663, 0, 0, 0, 1, 1,
1.251532, 0.700097, 0.3232827, 0, 0, 0, 1, 1,
1.259955, -1.214675, 0.1323998, 0, 0, 0, 1, 1,
1.271886, 0.6567667, 0.3792662, 1, 1, 1, 1, 1,
1.274967, 0.1945639, 2.241407, 1, 1, 1, 1, 1,
1.280967, -1.878574, 2.671596, 1, 1, 1, 1, 1,
1.282233, -0.9604383, 2.793983, 1, 1, 1, 1, 1,
1.282875, -0.8137093, 1.974475, 1, 1, 1, 1, 1,
1.311619, -1.323931, 2.384535, 1, 1, 1, 1, 1,
1.319247, 1.591061, 1.103272, 1, 1, 1, 1, 1,
1.322433, -0.2626587, 4.531124, 1, 1, 1, 1, 1,
1.325677, -1.92764, 3.56854, 1, 1, 1, 1, 1,
1.329144, -1.015845, 2.214926, 1, 1, 1, 1, 1,
1.340689, 1.715948, 2.61278, 1, 1, 1, 1, 1,
1.342505, -1.589904, 4.098849, 1, 1, 1, 1, 1,
1.342718, -1.13332, 2.434953, 1, 1, 1, 1, 1,
1.344095, 0.3091724, 2.344957, 1, 1, 1, 1, 1,
1.345235, -1.720133, 2.744375, 1, 1, 1, 1, 1,
1.347857, 1.494948, 0.6500465, 0, 0, 1, 1, 1,
1.356257, -0.8145022, 2.132451, 1, 0, 0, 1, 1,
1.366235, 1.504192, 1.083295, 1, 0, 0, 1, 1,
1.378864, -0.5915653, 3.130741, 1, 0, 0, 1, 1,
1.379552, -1.196352, 2.025062, 1, 0, 0, 1, 1,
1.394487, -1.963357, 3.385642, 1, 0, 0, 1, 1,
1.404017, 0.04999024, 2.511579, 0, 0, 0, 1, 1,
1.404444, 1.029568, 2.190312, 0, 0, 0, 1, 1,
1.408715, -0.5792353, 1.973535, 0, 0, 0, 1, 1,
1.418485, -0.8933674, 2.409106, 0, 0, 0, 1, 1,
1.42091, -0.5553098, 1.979126, 0, 0, 0, 1, 1,
1.426442, 0.4295866, 1.585005, 0, 0, 0, 1, 1,
1.429894, -0.3187528, 2.638767, 0, 0, 0, 1, 1,
1.442521, 0.618384, 1.816952, 1, 1, 1, 1, 1,
1.455211, 1.451229, 0.8947852, 1, 1, 1, 1, 1,
1.456838, 1.816467, -0.1746505, 1, 1, 1, 1, 1,
1.458015, 0.5805594, 0.9004399, 1, 1, 1, 1, 1,
1.462061, 1.020449, -0.6382152, 1, 1, 1, 1, 1,
1.464142, 1.598135, 0.6981396, 1, 1, 1, 1, 1,
1.467253, -1.962815, 3.960571, 1, 1, 1, 1, 1,
1.467613, -3.275225, 2.714791, 1, 1, 1, 1, 1,
1.506874, -1.227723, 0.3691014, 1, 1, 1, 1, 1,
1.514502, -0.3099545, 2.359092, 1, 1, 1, 1, 1,
1.520256, -0.9699712, 3.086617, 1, 1, 1, 1, 1,
1.528753, -0.3300264, 2.897705, 1, 1, 1, 1, 1,
1.53473, 0.7358795, 1.734209, 1, 1, 1, 1, 1,
1.540752, -0.3395295, 2.002151, 1, 1, 1, 1, 1,
1.547544, 0.3400954, 0.7274939, 1, 1, 1, 1, 1,
1.548218, 1.039812, 2.150287, 0, 0, 1, 1, 1,
1.550264, -1.254991, 2.293441, 1, 0, 0, 1, 1,
1.572699, -1.579614, 1.216469, 1, 0, 0, 1, 1,
1.58285, 0.4163794, 1.453049, 1, 0, 0, 1, 1,
1.622963, -0.4053473, 2.800861, 1, 0, 0, 1, 1,
1.642364, -1.027049, 0.7958498, 1, 0, 0, 1, 1,
1.652235, 1.169824, -0.1130719, 0, 0, 0, 1, 1,
1.659804, -0.7868082, 0.7609414, 0, 0, 0, 1, 1,
1.67099, 0.8676513, 0.9903874, 0, 0, 0, 1, 1,
1.686653, 0.9895231, 0.2293312, 0, 0, 0, 1, 1,
1.689538, -1.769689, 1.916506, 0, 0, 0, 1, 1,
1.693972, 0.1221974, 0.9746703, 0, 0, 0, 1, 1,
1.695063, 1.659935, 1.013175, 0, 0, 0, 1, 1,
1.714941, -1.745442, 3.170092, 1, 1, 1, 1, 1,
1.742819, 1.179063, 0.3205381, 1, 1, 1, 1, 1,
1.770558, 0.03150126, 0.2978731, 1, 1, 1, 1, 1,
1.799201, -0.4219112, 2.478133, 1, 1, 1, 1, 1,
1.806657, -1.70272, 2.510407, 1, 1, 1, 1, 1,
1.814626, 1.174101, 1.968974, 1, 1, 1, 1, 1,
1.857209, -0.001630501, 0.2318958, 1, 1, 1, 1, 1,
1.859515, 0.8935027, 2.293663, 1, 1, 1, 1, 1,
1.873309, 1.037803, 0.7533354, 1, 1, 1, 1, 1,
1.878683, -0.3786204, 3.266165, 1, 1, 1, 1, 1,
1.885498, -1.310462, 1.51681, 1, 1, 1, 1, 1,
1.892217, -0.9789544, 3.871099, 1, 1, 1, 1, 1,
1.901667, 0.8865231, 0.2838423, 1, 1, 1, 1, 1,
1.915675, -0.03981075, 1.832194, 1, 1, 1, 1, 1,
1.941173, 0.651651, 0.7945683, 1, 1, 1, 1, 1,
1.955749, 0.642964, 2.687858, 0, 0, 1, 1, 1,
1.973325, -1.091891, 0.6496066, 1, 0, 0, 1, 1,
1.979756, -0.01674609, 2.974353, 1, 0, 0, 1, 1,
1.981889, 0.8337895, 1.028611, 1, 0, 0, 1, 1,
1.988736, -0.02199111, 1.338567, 1, 0, 0, 1, 1,
1.988826, -2.29338, 1.574436, 1, 0, 0, 1, 1,
2.012695, 0.8487736, 0.7153062, 0, 0, 0, 1, 1,
2.047485, -1.155482, 0.4162271, 0, 0, 0, 1, 1,
2.065103, -1.141849, 1.08531, 0, 0, 0, 1, 1,
2.076939, -0.4299177, 1.24497, 0, 0, 0, 1, 1,
2.132839, 1.187852, 2.749117, 0, 0, 0, 1, 1,
2.205274, 0.8787174, 1.474035, 0, 0, 0, 1, 1,
2.297951, 0.5988472, 1.259879, 0, 0, 0, 1, 1,
2.37242, -0.5675528, 1.778945, 1, 1, 1, 1, 1,
2.576359, 0.491161, -0.09575035, 1, 1, 1, 1, 1,
2.624446, 1.049654, 1.48783, 1, 1, 1, 1, 1,
2.637599, -1.500841, 2.413611, 1, 1, 1, 1, 1,
2.669083, -0.3048318, 2.971406, 1, 1, 1, 1, 1,
2.683041, 0.1790012, 2.367701, 1, 1, 1, 1, 1,
3.455194, 0.2200509, 1.344454, 1, 1, 1, 1, 1
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
var radius = 9.877055;
var distance = 34.69274;
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
mvMatrix.translate( -0.1082807, -0.01822281, -0.1473274 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.69274);
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
