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
-3.269905, -2.29508, 0.1756524, 1, 0, 0, 1,
-2.629557, 1.49353, -0.9102793, 1, 0.007843138, 0, 1,
-2.526351, 0.6560757, -0.6340587, 1, 0.01176471, 0, 1,
-2.501765, 0.6532776, -2.578222, 1, 0.01960784, 0, 1,
-2.477312, 0.16312, -1.165072, 1, 0.02352941, 0, 1,
-2.421112, -1.935863, -2.74311, 1, 0.03137255, 0, 1,
-2.328059, 0.8587047, 0.4421912, 1, 0.03529412, 0, 1,
-2.291106, -0.4814796, -1.505027, 1, 0.04313726, 0, 1,
-2.210802, -0.4193089, -2.449418, 1, 0.04705882, 0, 1,
-2.173871, 1.067608, -1.81337, 1, 0.05490196, 0, 1,
-2.151154, -1.640709, -1.031114, 1, 0.05882353, 0, 1,
-2.149819, -0.3794198, -1.936254, 1, 0.06666667, 0, 1,
-2.138818, 0.09803528, -2.783726, 1, 0.07058824, 0, 1,
-2.114872, -1.123953, -0.817942, 1, 0.07843138, 0, 1,
-2.10477, 1.258982, -0.4199918, 1, 0.08235294, 0, 1,
-2.06, 1.276317, -1.516847, 1, 0.09019608, 0, 1,
-2.049795, -1.317021, -1.671977, 1, 0.09411765, 0, 1,
-2.046776, -0.01192243, -1.43071, 1, 0.1019608, 0, 1,
-2.031411, 0.110109, -1.54058, 1, 0.1098039, 0, 1,
-2.027883, 0.2385461, -1.898038, 1, 0.1137255, 0, 1,
-2.023736, -0.05185178, -1.366404, 1, 0.1215686, 0, 1,
-2.020635, -1.492189, -3.768647, 1, 0.1254902, 0, 1,
-1.986927, 1.40529, 0.3229123, 1, 0.1333333, 0, 1,
-1.975637, 1.186777, -0.5689806, 1, 0.1372549, 0, 1,
-1.945877, 0.9814597, -1.491425, 1, 0.145098, 0, 1,
-1.93123, -0.6117871, -1.318681, 1, 0.1490196, 0, 1,
-1.914695, -0.2958716, -1.959976, 1, 0.1568628, 0, 1,
-1.910835, 1.079405, -0.2381527, 1, 0.1607843, 0, 1,
-1.906422, 0.3105167, -0.7137014, 1, 0.1686275, 0, 1,
-1.889896, -0.2271432, -2.074793, 1, 0.172549, 0, 1,
-1.884033, -0.7931509, -2.223266, 1, 0.1803922, 0, 1,
-1.878065, 0.4515288, -1.659134, 1, 0.1843137, 0, 1,
-1.877995, -0.4771471, -2.714035, 1, 0.1921569, 0, 1,
-1.861593, -1.983119, -3.122888, 1, 0.1960784, 0, 1,
-1.855395, -1.043143, -1.1002, 1, 0.2039216, 0, 1,
-1.852769, -0.6504415, -2.011397, 1, 0.2117647, 0, 1,
-1.835898, 1.895079, 0.296418, 1, 0.2156863, 0, 1,
-1.824604, 0.4183137, -0.4030901, 1, 0.2235294, 0, 1,
-1.780678, 0.243404, -1.028201, 1, 0.227451, 0, 1,
-1.772457, -0.02302296, -1.24231, 1, 0.2352941, 0, 1,
-1.746031, 0.5558991, -0.2774462, 1, 0.2392157, 0, 1,
-1.737319, -0.1903051, -1.422807, 1, 0.2470588, 0, 1,
-1.732374, 0.3147261, -2.240224, 1, 0.2509804, 0, 1,
-1.696877, -0.8110666, -2.209826, 1, 0.2588235, 0, 1,
-1.695238, -1.302226, -2.437174, 1, 0.2627451, 0, 1,
-1.686499, 0.3501923, -0.3615516, 1, 0.2705882, 0, 1,
-1.681698, 0.1658624, -2.679877, 1, 0.2745098, 0, 1,
-1.638519, -1.472781, -1.739437, 1, 0.282353, 0, 1,
-1.602705, 0.7351695, -1.281286, 1, 0.2862745, 0, 1,
-1.585857, -0.9195754, -1.080693, 1, 0.2941177, 0, 1,
-1.581029, -0.7164151, -3.32544, 1, 0.3019608, 0, 1,
-1.564634, -0.5464664, -2.146116, 1, 0.3058824, 0, 1,
-1.536625, 1.542158, -1.867989, 1, 0.3137255, 0, 1,
-1.53045, -0.444172, 0.2624078, 1, 0.3176471, 0, 1,
-1.529693, 1.042717, -2.702068, 1, 0.3254902, 0, 1,
-1.520231, -0.7212554, -2.066879, 1, 0.3294118, 0, 1,
-1.514088, -0.1063216, -0.4184192, 1, 0.3372549, 0, 1,
-1.511728, 0.5283401, -1.735091, 1, 0.3411765, 0, 1,
-1.508411, -0.3520972, -0.7302318, 1, 0.3490196, 0, 1,
-1.495713, -0.9180591, -2.627233, 1, 0.3529412, 0, 1,
-1.480251, 1.563839, -1.266508, 1, 0.3607843, 0, 1,
-1.478166, 0.342067, -1.481072, 1, 0.3647059, 0, 1,
-1.477361, -0.8317841, -1.587615, 1, 0.372549, 0, 1,
-1.469084, 0.05854738, -0.2891797, 1, 0.3764706, 0, 1,
-1.462759, 0.5921853, -0.8800403, 1, 0.3843137, 0, 1,
-1.460214, -0.2787762, -0.8437914, 1, 0.3882353, 0, 1,
-1.454477, -1.107933, -0.2006205, 1, 0.3960784, 0, 1,
-1.445407, 0.7539259, -0.1265783, 1, 0.4039216, 0, 1,
-1.435134, 1.176851, -1.728517, 1, 0.4078431, 0, 1,
-1.434202, 2.697062, -1.343296, 1, 0.4156863, 0, 1,
-1.433057, 1.17987, -0.1393896, 1, 0.4196078, 0, 1,
-1.419019, -0.1590683, -1.488594, 1, 0.427451, 0, 1,
-1.418415, -0.7176908, 0.1418835, 1, 0.4313726, 0, 1,
-1.414434, -0.4149472, -4.220102, 1, 0.4392157, 0, 1,
-1.410106, 0.9207855, 0.4305071, 1, 0.4431373, 0, 1,
-1.387197, -0.770229, -1.041197, 1, 0.4509804, 0, 1,
-1.382181, -0.7930282, 0.3032531, 1, 0.454902, 0, 1,
-1.375736, 0.2576694, -0.4906891, 1, 0.4627451, 0, 1,
-1.371937, -1.062797, -2.037664, 1, 0.4666667, 0, 1,
-1.359342, -0.07089275, -2.414807, 1, 0.4745098, 0, 1,
-1.347787, -0.9981783, -1.869931, 1, 0.4784314, 0, 1,
-1.333504, -0.1987263, -2.257554, 1, 0.4862745, 0, 1,
-1.327557, 0.8190696, -0.9729779, 1, 0.4901961, 0, 1,
-1.326249, 0.1334186, -1.664019, 1, 0.4980392, 0, 1,
-1.326121, -0.8229961, -2.75554, 1, 0.5058824, 0, 1,
-1.320928, 0.4665757, 0.2591822, 1, 0.509804, 0, 1,
-1.3196, -0.2141899, -3.117537, 1, 0.5176471, 0, 1,
-1.303353, -0.06864626, -0.7440912, 1, 0.5215687, 0, 1,
-1.303212, -2.111985, -1.731163, 1, 0.5294118, 0, 1,
-1.286081, 1.259815, -0.158607, 1, 0.5333334, 0, 1,
-1.277755, 0.6122227, -1.171536, 1, 0.5411765, 0, 1,
-1.276938, 0.09014782, -0.2067037, 1, 0.5450981, 0, 1,
-1.271962, 0.5796644, -1.38688, 1, 0.5529412, 0, 1,
-1.266279, -0.2930869, -1.49958, 1, 0.5568628, 0, 1,
-1.263601, -1.194013, -3.079323, 1, 0.5647059, 0, 1,
-1.247987, 0.9559529, -1.106441, 1, 0.5686275, 0, 1,
-1.243717, -0.9188849, -2.144119, 1, 0.5764706, 0, 1,
-1.242678, 0.5988348, -0.7995749, 1, 0.5803922, 0, 1,
-1.2399, -0.1155293, -1.930716, 1, 0.5882353, 0, 1,
-1.218787, 1.527109, -0.09020562, 1, 0.5921569, 0, 1,
-1.218591, 0.144843, -2.611026, 1, 0.6, 0, 1,
-1.211915, 0.09688736, -0.692746, 1, 0.6078432, 0, 1,
-1.210199, -0.9023987, -3.196847, 1, 0.6117647, 0, 1,
-1.208304, -0.8426403, -2.256193, 1, 0.6196079, 0, 1,
-1.207097, 0.5843083, -0.9011591, 1, 0.6235294, 0, 1,
-1.20281, 1.127975, -0.359307, 1, 0.6313726, 0, 1,
-1.176735, -1.034047, -3.14322, 1, 0.6352941, 0, 1,
-1.176622, 1.138615, 0.3273522, 1, 0.6431373, 0, 1,
-1.17634, -0.2854454, -2.28307, 1, 0.6470588, 0, 1,
-1.17253, -1.027776, -2.65638, 1, 0.654902, 0, 1,
-1.17234, -1.464524, -1.863951, 1, 0.6588235, 0, 1,
-1.167026, 0.5038676, -0.979338, 1, 0.6666667, 0, 1,
-1.166075, 1.559573, 1.307566, 1, 0.6705883, 0, 1,
-1.15119, 0.7978231, -0.914435, 1, 0.6784314, 0, 1,
-1.136207, 1.132808, -0.379315, 1, 0.682353, 0, 1,
-1.128536, -0.02751368, -2.547462, 1, 0.6901961, 0, 1,
-1.128486, 0.07782592, -0.3023163, 1, 0.6941177, 0, 1,
-1.120497, -0.1249039, -0.7180493, 1, 0.7019608, 0, 1,
-1.110037, -0.3262641, -0.2934834, 1, 0.7098039, 0, 1,
-1.108382, -0.9411583, -2.222511, 1, 0.7137255, 0, 1,
-1.107083, 2.02219, 0.8854257, 1, 0.7215686, 0, 1,
-1.103842, -0.03791834, -3.226531, 1, 0.7254902, 0, 1,
-1.101762, -0.3963071, -1.55134, 1, 0.7333333, 0, 1,
-1.100318, 0.1115949, -1.409144, 1, 0.7372549, 0, 1,
-1.097805, 1.537552, -0.3189908, 1, 0.7450981, 0, 1,
-1.09642, 1.452828, -0.9966547, 1, 0.7490196, 0, 1,
-1.095514, 1.063672, -0.3083293, 1, 0.7568628, 0, 1,
-1.095216, 0.3345546, -1.343589, 1, 0.7607843, 0, 1,
-1.085175, -0.2711906, -1.832242, 1, 0.7686275, 0, 1,
-1.084756, 0.4531731, -0.3077421, 1, 0.772549, 0, 1,
-1.08337, 0.7910976, -2.76538, 1, 0.7803922, 0, 1,
-1.078464, -0.8752334, 0.1607151, 1, 0.7843137, 0, 1,
-1.077414, -0.9448039, -3.111459, 1, 0.7921569, 0, 1,
-1.075797, 1.303374, -0.6289096, 1, 0.7960784, 0, 1,
-1.075747, -0.6580781, -1.425568, 1, 0.8039216, 0, 1,
-1.071128, 0.4301406, -0.1351895, 1, 0.8117647, 0, 1,
-1.070982, -0.5144809, -2.959433, 1, 0.8156863, 0, 1,
-1.069829, 0.9280998, -0.8343799, 1, 0.8235294, 0, 1,
-1.063844, 0.7296011, -1.859807, 1, 0.827451, 0, 1,
-1.06243, 0.6599978, -1.556088, 1, 0.8352941, 0, 1,
-1.062096, 0.7404872, -1.611705, 1, 0.8392157, 0, 1,
-1.052838, 1.383152, 0.0415765, 1, 0.8470588, 0, 1,
-1.046258, 0.6466417, -0.4020802, 1, 0.8509804, 0, 1,
-1.044205, 0.2905674, -1.658724, 1, 0.8588235, 0, 1,
-1.041289, 0.8023742, 0.008343248, 1, 0.8627451, 0, 1,
-1.038088, 0.7693994, -1.828145, 1, 0.8705882, 0, 1,
-1.036598, 0.08456233, -0.2345982, 1, 0.8745098, 0, 1,
-1.035266, -0.3494655, -0.4636298, 1, 0.8823529, 0, 1,
-1.023643, 2.596004, -0.1029759, 1, 0.8862745, 0, 1,
-1.02161, -2.583193, -3.598442, 1, 0.8941177, 0, 1,
-1.017748, 0.1049599, -2.170446, 1, 0.8980392, 0, 1,
-1.016806, 0.146558, -1.509898, 1, 0.9058824, 0, 1,
-1.014705, 0.4929958, -1.370114, 1, 0.9137255, 0, 1,
-1.012283, 0.7638941, -1.170624, 1, 0.9176471, 0, 1,
-1.011839, 0.3826776, 0.07675449, 1, 0.9254902, 0, 1,
-1.00506, -0.1003748, -1.045511, 1, 0.9294118, 0, 1,
-1.00494, -0.5158064, -0.0298897, 1, 0.9372549, 0, 1,
-1.002215, -1.640699, -3.303352, 1, 0.9411765, 0, 1,
-1.001991, -0.7253276, -2.72098, 1, 0.9490196, 0, 1,
-0.996616, 0.4145842, -0.8078399, 1, 0.9529412, 0, 1,
-0.9958757, -0.9709392, -3.366798, 1, 0.9607843, 0, 1,
-0.9931469, 1.384339, -2.72837, 1, 0.9647059, 0, 1,
-0.9878904, 1.054276, -1.952386, 1, 0.972549, 0, 1,
-0.9874177, -0.7653809, -2.61169, 1, 0.9764706, 0, 1,
-0.9828079, 1.009385, 0.8268713, 1, 0.9843137, 0, 1,
-0.9771588, 0.7189595, -1.970464, 1, 0.9882353, 0, 1,
-0.9735702, -0.6395212, -4.021105, 1, 0.9960784, 0, 1,
-0.9696733, -1.358363, -2.490669, 0.9960784, 1, 0, 1,
-0.9635674, -0.6890157, -0.2071693, 0.9921569, 1, 0, 1,
-0.9595242, 0.5737702, 1.133723, 0.9843137, 1, 0, 1,
-0.9588342, -0.7544302, -2.598104, 0.9803922, 1, 0, 1,
-0.9576533, -0.5138696, -1.156857, 0.972549, 1, 0, 1,
-0.9534912, -0.2933553, -2.897312, 0.9686275, 1, 0, 1,
-0.9421369, 1.123361, -1.476363, 0.9607843, 1, 0, 1,
-0.9417644, -1.324026, -1.745718, 0.9568627, 1, 0, 1,
-0.9396354, -1.031764, -1.073114, 0.9490196, 1, 0, 1,
-0.9345601, 1.035607, -0.8932121, 0.945098, 1, 0, 1,
-0.9335654, -0.6129331, -2.644531, 0.9372549, 1, 0, 1,
-0.930159, 0.3788343, -0.07902157, 0.9333333, 1, 0, 1,
-0.9299343, 0.09872305, -2.025555, 0.9254902, 1, 0, 1,
-0.9220176, 0.06997391, -1.299671, 0.9215686, 1, 0, 1,
-0.920008, -0.2749815, -3.031969, 0.9137255, 1, 0, 1,
-0.9164752, 0.2390072, -2.286419, 0.9098039, 1, 0, 1,
-0.9128411, 0.7467701, 0.1799664, 0.9019608, 1, 0, 1,
-0.9108543, 0.6457553, -1.445551, 0.8941177, 1, 0, 1,
-0.9103444, 1.382357, -0.7131299, 0.8901961, 1, 0, 1,
-0.9057741, 0.01158942, -1.37114, 0.8823529, 1, 0, 1,
-0.9040788, 0.3163729, -1.210319, 0.8784314, 1, 0, 1,
-0.8933116, 0.2736757, -1.452695, 0.8705882, 1, 0, 1,
-0.8857284, -0.9217235, -2.400116, 0.8666667, 1, 0, 1,
-0.8834813, 2.667616, -0.9569654, 0.8588235, 1, 0, 1,
-0.8801304, 0.112867, -1.468961, 0.854902, 1, 0, 1,
-0.8777583, 0.3848683, -0.3458594, 0.8470588, 1, 0, 1,
-0.8776885, 0.6628099, 0.6211849, 0.8431373, 1, 0, 1,
-0.8738135, -0.4470964, -1.992705, 0.8352941, 1, 0, 1,
-0.8730303, -0.02854873, -1.992128, 0.8313726, 1, 0, 1,
-0.8720171, 1.432645, 0.6815285, 0.8235294, 1, 0, 1,
-0.8710817, 0.8775232, -1.709801, 0.8196079, 1, 0, 1,
-0.8710654, 1.83884, -1.071005, 0.8117647, 1, 0, 1,
-0.8709024, 0.1361219, -1.286045, 0.8078431, 1, 0, 1,
-0.8527883, -0.3961141, 0.01112138, 0.8, 1, 0, 1,
-0.8515449, 0.5507658, -0.2031059, 0.7921569, 1, 0, 1,
-0.8420514, 0.128926, -0.6581224, 0.7882353, 1, 0, 1,
-0.8371046, -0.7353721, -2.509587, 0.7803922, 1, 0, 1,
-0.8359416, 0.3809485, 0.2193208, 0.7764706, 1, 0, 1,
-0.8351325, 0.3866949, -3.177927, 0.7686275, 1, 0, 1,
-0.8203768, 0.3260007, -2.044387, 0.7647059, 1, 0, 1,
-0.8187857, 0.9429133, 0.1214123, 0.7568628, 1, 0, 1,
-0.8153057, -1.120151, -3.211747, 0.7529412, 1, 0, 1,
-0.814981, -1.039228, -3.519592, 0.7450981, 1, 0, 1,
-0.8116826, 0.7695661, -1.986936, 0.7411765, 1, 0, 1,
-0.8108797, -0.8101634, -3.279791, 0.7333333, 1, 0, 1,
-0.8102682, -0.2105577, -1.518966, 0.7294118, 1, 0, 1,
-0.8074694, -0.1424417, -1.206677, 0.7215686, 1, 0, 1,
-0.8066272, 0.09599636, -1.412899, 0.7176471, 1, 0, 1,
-0.8053343, 1.72593, 0.7732272, 0.7098039, 1, 0, 1,
-0.80121, 0.4804149, -1.527115, 0.7058824, 1, 0, 1,
-0.7995341, -0.282486, 0.4496543, 0.6980392, 1, 0, 1,
-0.7979639, -2.593497, -2.616501, 0.6901961, 1, 0, 1,
-0.7932789, 1.494523, 0.8121479, 0.6862745, 1, 0, 1,
-0.7889139, 0.9604272, -1.837725, 0.6784314, 1, 0, 1,
-0.7856204, 1.827194, -0.7394289, 0.6745098, 1, 0, 1,
-0.7840682, 0.2173095, -1.539278, 0.6666667, 1, 0, 1,
-0.7806725, -0.9160513, -4.715767, 0.6627451, 1, 0, 1,
-0.779395, 0.8047348, 0.6270885, 0.654902, 1, 0, 1,
-0.7781985, -0.2399626, -3.320329, 0.6509804, 1, 0, 1,
-0.7724534, -1.018624, -3.206673, 0.6431373, 1, 0, 1,
-0.7707918, -1.120352, -3.091959, 0.6392157, 1, 0, 1,
-0.7693477, 1.02627, -1.418291, 0.6313726, 1, 0, 1,
-0.7662972, 0.0916176, -2.531034, 0.627451, 1, 0, 1,
-0.7652426, 1.003725, -0.0506858, 0.6196079, 1, 0, 1,
-0.7639319, -0.2673238, -1.273547, 0.6156863, 1, 0, 1,
-0.7574142, -0.3565962, -1.920101, 0.6078432, 1, 0, 1,
-0.7554443, 0.1029865, -1.567066, 0.6039216, 1, 0, 1,
-0.7553253, 0.858077, -0.3544942, 0.5960785, 1, 0, 1,
-0.7541954, 2.285158, -1.327657, 0.5882353, 1, 0, 1,
-0.7539423, 1.38012, -1.10012, 0.5843138, 1, 0, 1,
-0.750245, -1.410218, -2.720065, 0.5764706, 1, 0, 1,
-0.7500149, 1.496482, -0.3023849, 0.572549, 1, 0, 1,
-0.7496476, 0.3965316, 0.2878287, 0.5647059, 1, 0, 1,
-0.7431796, 0.1510238, -2.65133, 0.5607843, 1, 0, 1,
-0.7339837, 1.277973, -0.5952326, 0.5529412, 1, 0, 1,
-0.7283834, -0.359449, -1.590245, 0.5490196, 1, 0, 1,
-0.7270459, -0.166274, -2.413285, 0.5411765, 1, 0, 1,
-0.722215, 0.6262808, 1.099088, 0.5372549, 1, 0, 1,
-0.7182339, 1.569521, 0.8784478, 0.5294118, 1, 0, 1,
-0.7156113, 0.2562831, -0.9249885, 0.5254902, 1, 0, 1,
-0.7102236, -0.4556173, -1.948991, 0.5176471, 1, 0, 1,
-0.7097597, 0.664195, -0.4254979, 0.5137255, 1, 0, 1,
-0.7078199, -0.1724855, -0.7417813, 0.5058824, 1, 0, 1,
-0.7055479, 0.7717255, -0.9179744, 0.5019608, 1, 0, 1,
-0.7029222, -0.1603473, -1.224, 0.4941176, 1, 0, 1,
-0.7012346, -0.2384289, -1.693358, 0.4862745, 1, 0, 1,
-0.7005517, 0.3424381, -2.519175, 0.4823529, 1, 0, 1,
-0.7005243, 0.03094229, -0.4206827, 0.4745098, 1, 0, 1,
-0.6993838, 1.229636, 0.7685797, 0.4705882, 1, 0, 1,
-0.6955699, -0.5664797, -1.713119, 0.4627451, 1, 0, 1,
-0.6949516, -0.3717557, -3.712934, 0.4588235, 1, 0, 1,
-0.6883751, 0.8112476, -1.423962, 0.4509804, 1, 0, 1,
-0.6874973, 0.227478, -1.456341, 0.4470588, 1, 0, 1,
-0.6837052, -0.2623091, -1.905716, 0.4392157, 1, 0, 1,
-0.6792724, -0.3994298, 0.09002589, 0.4352941, 1, 0, 1,
-0.6791611, 1.345276, -0.5254821, 0.427451, 1, 0, 1,
-0.6732804, -0.5536107, -4.219914, 0.4235294, 1, 0, 1,
-0.6722713, 0.3218237, -1.880591, 0.4156863, 1, 0, 1,
-0.6716003, -1.007318, -2.065113, 0.4117647, 1, 0, 1,
-0.671063, -1.062599, -3.39676, 0.4039216, 1, 0, 1,
-0.6705784, 2.72736, -0.4448974, 0.3960784, 1, 0, 1,
-0.6697841, -0.9718934, -1.01146, 0.3921569, 1, 0, 1,
-0.6621139, -0.9720758, -4.427036, 0.3843137, 1, 0, 1,
-0.6575095, -0.4558008, -2.584623, 0.3803922, 1, 0, 1,
-0.6572855, -1.355889, -3.0059, 0.372549, 1, 0, 1,
-0.654266, -0.2284584, -2.31928, 0.3686275, 1, 0, 1,
-0.6517498, 0.9127749, -1.693946, 0.3607843, 1, 0, 1,
-0.6501561, 0.1526755, -1.838, 0.3568628, 1, 0, 1,
-0.640132, 0.8011141, -0.5023135, 0.3490196, 1, 0, 1,
-0.6277999, 1.529883, 1.545731, 0.345098, 1, 0, 1,
-0.6256903, 0.2892164, -3.339998, 0.3372549, 1, 0, 1,
-0.6231547, 0.7660285, -1.594136, 0.3333333, 1, 0, 1,
-0.6231067, -1.706331, -3.103441, 0.3254902, 1, 0, 1,
-0.6211532, 0.2151615, 0.47677, 0.3215686, 1, 0, 1,
-0.6178899, -0.2536005, 0.006873785, 0.3137255, 1, 0, 1,
-0.6158546, -0.7632197, -2.182837, 0.3098039, 1, 0, 1,
-0.6106324, -1.351066, -2.78195, 0.3019608, 1, 0, 1,
-0.6093363, 1.012396, -1.203049, 0.2941177, 1, 0, 1,
-0.6044333, 0.6473028, -1.106051, 0.2901961, 1, 0, 1,
-0.6027418, -0.4638225, -1.429503, 0.282353, 1, 0, 1,
-0.6024659, -0.6110083, -3.259115, 0.2784314, 1, 0, 1,
-0.5957309, 0.6241644, -1.712899, 0.2705882, 1, 0, 1,
-0.5935834, 0.04275207, -2.255038, 0.2666667, 1, 0, 1,
-0.5932131, -1.833659, -3.820512, 0.2588235, 1, 0, 1,
-0.5928408, -1.15301, -3.337478, 0.254902, 1, 0, 1,
-0.5916639, 1.6527, 0.3086818, 0.2470588, 1, 0, 1,
-0.590291, 1.035759, -0.72306, 0.2431373, 1, 0, 1,
-0.5842059, 0.8076403, -0.4571339, 0.2352941, 1, 0, 1,
-0.5834192, 0.7684278, -2.399013, 0.2313726, 1, 0, 1,
-0.5816162, -1.276584, -2.461007, 0.2235294, 1, 0, 1,
-0.5797503, 0.1551782, -2.010521, 0.2196078, 1, 0, 1,
-0.5766307, 0.751846, -1.364905, 0.2117647, 1, 0, 1,
-0.5762681, 0.5579801, -2.691323, 0.2078431, 1, 0, 1,
-0.5674713, 0.8625816, -0.8213431, 0.2, 1, 0, 1,
-0.5662703, 0.2829152, -1.630641, 0.1921569, 1, 0, 1,
-0.561208, -0.4899031, -2.105898, 0.1882353, 1, 0, 1,
-0.5580075, 0.3271071, -1.726455, 0.1803922, 1, 0, 1,
-0.5560104, -1.009106, -1.625902, 0.1764706, 1, 0, 1,
-0.5543287, 0.04987894, -3.484685, 0.1686275, 1, 0, 1,
-0.5536544, -1.99616, -1.138195, 0.1647059, 1, 0, 1,
-0.5516439, -0.1225364, -1.758025, 0.1568628, 1, 0, 1,
-0.5491803, -2.013009, -3.379388, 0.1529412, 1, 0, 1,
-0.5392647, -1.703186, -4.041365, 0.145098, 1, 0, 1,
-0.5370294, 0.5353471, -1.236867, 0.1411765, 1, 0, 1,
-0.5258051, -0.176998, -1.545579, 0.1333333, 1, 0, 1,
-0.5200343, -1.931819, -3.038713, 0.1294118, 1, 0, 1,
-0.5179577, -1.219113, -2.293844, 0.1215686, 1, 0, 1,
-0.5174631, -0.02520685, -2.217656, 0.1176471, 1, 0, 1,
-0.5161668, -1.965763, -2.787023, 0.1098039, 1, 0, 1,
-0.5144963, -0.1545352, -2.287345, 0.1058824, 1, 0, 1,
-0.5128824, 0.3440945, -3.17122, 0.09803922, 1, 0, 1,
-0.5099241, 1.641356, 0.6045392, 0.09019608, 1, 0, 1,
-0.499671, -1.954261, -3.690248, 0.08627451, 1, 0, 1,
-0.4912934, 1.580245, -0.4506051, 0.07843138, 1, 0, 1,
-0.4897548, -0.8870054, -3.77253, 0.07450981, 1, 0, 1,
-0.4894204, -0.3856579, -3.640623, 0.06666667, 1, 0, 1,
-0.4868582, 1.007184, -0.08411943, 0.0627451, 1, 0, 1,
-0.4852139, -1.280744, -1.879493, 0.05490196, 1, 0, 1,
-0.4825504, -0.004607972, -3.707986, 0.05098039, 1, 0, 1,
-0.4817178, 1.721033, 1.460837, 0.04313726, 1, 0, 1,
-0.4796487, 2.39845, 0.2574406, 0.03921569, 1, 0, 1,
-0.4725208, 1.200037, -1.91881, 0.03137255, 1, 0, 1,
-0.472185, -1.513604, -2.618357, 0.02745098, 1, 0, 1,
-0.4708839, -1.841886, -2.482832, 0.01960784, 1, 0, 1,
-0.4699238, -0.074352, -1.896101, 0.01568628, 1, 0, 1,
-0.4688266, 1.120321, 0.5336859, 0.007843138, 1, 0, 1,
-0.4637259, -0.7249162, -3.485483, 0.003921569, 1, 0, 1,
-0.4616536, -0.8098298, -5.280489, 0, 1, 0.003921569, 1,
-0.4583915, 0.05545274, -0.7394999, 0, 1, 0.01176471, 1,
-0.4507637, -0.05341798, -1.884684, 0, 1, 0.01568628, 1,
-0.449812, -0.3920328, -1.528526, 0, 1, 0.02352941, 1,
-0.4478476, 1.04105, 1.397358, 0, 1, 0.02745098, 1,
-0.4440564, -0.6388711, -1.895486, 0, 1, 0.03529412, 1,
-0.4430975, 0.1402383, -2.674947, 0, 1, 0.03921569, 1,
-0.4407975, 0.2467789, -1.173542, 0, 1, 0.04705882, 1,
-0.4395517, 1.332107, -0.5016933, 0, 1, 0.05098039, 1,
-0.4346945, 1.351621, -0.6015864, 0, 1, 0.05882353, 1,
-0.4341754, -0.3383233, -0.5242847, 0, 1, 0.0627451, 1,
-0.4337354, 1.495896, 0.8750621, 0, 1, 0.07058824, 1,
-0.4271063, 1.525235, -0.8901432, 0, 1, 0.07450981, 1,
-0.4270531, 1.081925, -0.4576713, 0, 1, 0.08235294, 1,
-0.423779, -0.7396945, -4.574114, 0, 1, 0.08627451, 1,
-0.4226215, -0.8356628, -1.185294, 0, 1, 0.09411765, 1,
-0.4152457, 0.7425555, -0.9893327, 0, 1, 0.1019608, 1,
-0.4126636, 0.4807591, -0.1939792, 0, 1, 0.1058824, 1,
-0.409476, 0.5162914, -0.7528356, 0, 1, 0.1137255, 1,
-0.4048016, -0.6092798, -1.27953, 0, 1, 0.1176471, 1,
-0.4023911, 0.7640636, -1.324405, 0, 1, 0.1254902, 1,
-0.4021824, 0.6820465, -1.587077, 0, 1, 0.1294118, 1,
-0.4019515, 0.726368, 0.7222663, 0, 1, 0.1372549, 1,
-0.4005679, -0.3581323, -0.1909186, 0, 1, 0.1411765, 1,
-0.3993018, -0.2892392, -2.004662, 0, 1, 0.1490196, 1,
-0.3988349, -0.2632352, -2.87884, 0, 1, 0.1529412, 1,
-0.3926664, 1.19153, -0.02102816, 0, 1, 0.1607843, 1,
-0.3894871, -0.1910543, -2.4216, 0, 1, 0.1647059, 1,
-0.3863774, -0.04806966, -1.520329, 0, 1, 0.172549, 1,
-0.3830642, -1.435343, -3.327323, 0, 1, 0.1764706, 1,
-0.3732056, 0.1489033, -2.386913, 0, 1, 0.1843137, 1,
-0.3667282, 0.8307692, -1.658626, 0, 1, 0.1882353, 1,
-0.3639561, 0.9159952, 1.526095, 0, 1, 0.1960784, 1,
-0.3596364, -1.190592, -2.518841, 0, 1, 0.2039216, 1,
-0.3562116, 0.1345457, -0.9195447, 0, 1, 0.2078431, 1,
-0.3535228, 1.363106, 1.110483, 0, 1, 0.2156863, 1,
-0.345412, -1.78449, -1.494384, 0, 1, 0.2196078, 1,
-0.3439205, -0.6606352, -2.778973, 0, 1, 0.227451, 1,
-0.3438987, 1.024373, 1.389642, 0, 1, 0.2313726, 1,
-0.3425507, 0.269107, -3.602102, 0, 1, 0.2392157, 1,
-0.341561, 0.0645908, -2.260832, 0, 1, 0.2431373, 1,
-0.3411156, -1.006967, -2.173967, 0, 1, 0.2509804, 1,
-0.3402216, 0.6659145, -1.218848, 0, 1, 0.254902, 1,
-0.3386123, 1.378573, 0.750211, 0, 1, 0.2627451, 1,
-0.3359258, 1.233051, 0.3438501, 0, 1, 0.2666667, 1,
-0.3348573, -0.1663855, -1.901432, 0, 1, 0.2745098, 1,
-0.3284289, -1.733886, -2.080871, 0, 1, 0.2784314, 1,
-0.3232287, -0.05721715, -0.41475, 0, 1, 0.2862745, 1,
-0.3223539, -1.296653, -3.192799, 0, 1, 0.2901961, 1,
-0.3101846, 0.8599783, 0.2133428, 0, 1, 0.2980392, 1,
-0.3094708, 0.4206402, 0.02055435, 0, 1, 0.3058824, 1,
-0.3061641, -0.8968631, -3.319955, 0, 1, 0.3098039, 1,
-0.3048986, 0.8164986, -0.6101039, 0, 1, 0.3176471, 1,
-0.3008689, -1.201738, -3.01399, 0, 1, 0.3215686, 1,
-0.2997963, 0.5339221, -1.224201, 0, 1, 0.3294118, 1,
-0.2961135, -0.2768572, -1.077441, 0, 1, 0.3333333, 1,
-0.2946374, -0.3391802, -2.972028, 0, 1, 0.3411765, 1,
-0.2928563, -0.7905527, -2.545768, 0, 1, 0.345098, 1,
-0.2919473, -0.2893661, -3.155107, 0, 1, 0.3529412, 1,
-0.289278, -0.4970619, -3.133295, 0, 1, 0.3568628, 1,
-0.288632, 0.222659, -2.225382, 0, 1, 0.3647059, 1,
-0.2853507, 0.06758295, 0.3596996, 0, 1, 0.3686275, 1,
-0.2843804, -0.6203845, -2.141994, 0, 1, 0.3764706, 1,
-0.2839697, -0.8336374, -2.094169, 0, 1, 0.3803922, 1,
-0.2817585, -0.727035, -3.262231, 0, 1, 0.3882353, 1,
-0.2749388, 0.156307, -2.889238, 0, 1, 0.3921569, 1,
-0.2689362, 0.6745089, -2.200242, 0, 1, 0.4, 1,
-0.268152, -0.8238606, -1.899757, 0, 1, 0.4078431, 1,
-0.2668439, -0.7131689, -2.621239, 0, 1, 0.4117647, 1,
-0.2633538, -0.6828635, -4.143438, 0, 1, 0.4196078, 1,
-0.2619878, -0.2336016, -1.420101, 0, 1, 0.4235294, 1,
-0.2608486, 1.110925, -0.4816246, 0, 1, 0.4313726, 1,
-0.2607444, 0.3588635, 1.91384, 0, 1, 0.4352941, 1,
-0.2459947, 1.2915, 0.8789417, 0, 1, 0.4431373, 1,
-0.2458495, 0.1448939, -1.218795, 0, 1, 0.4470588, 1,
-0.241636, -0.7445489, -1.210899, 0, 1, 0.454902, 1,
-0.2399856, 0.01840897, -1.829, 0, 1, 0.4588235, 1,
-0.2379442, -1.151332, -4.037951, 0, 1, 0.4666667, 1,
-0.2371192, 0.4631658, 0.4669348, 0, 1, 0.4705882, 1,
-0.2367729, 2.537658, -0.30164, 0, 1, 0.4784314, 1,
-0.2344729, -2.485829, -2.785347, 0, 1, 0.4823529, 1,
-0.233958, -1.049359, -4.109601, 0, 1, 0.4901961, 1,
-0.2332339, -0.2625714, -1.907845, 0, 1, 0.4941176, 1,
-0.2300256, -1.623345, -3.764885, 0, 1, 0.5019608, 1,
-0.2299946, -0.4213129, -2.911252, 0, 1, 0.509804, 1,
-0.2290891, 0.4955745, -0.3613349, 0, 1, 0.5137255, 1,
-0.2259813, 1.524052, -0.7656161, 0, 1, 0.5215687, 1,
-0.2198458, 2.217931, 1.816998, 0, 1, 0.5254902, 1,
-0.2185661, -1.006802, -2.375725, 0, 1, 0.5333334, 1,
-0.2132257, 0.01831999, -0.5483541, 0, 1, 0.5372549, 1,
-0.2119745, 0.9481934, 0.6260374, 0, 1, 0.5450981, 1,
-0.2113009, 2.737073, -0.9159526, 0, 1, 0.5490196, 1,
-0.2103324, -0.1090108, -0.3633769, 0, 1, 0.5568628, 1,
-0.2098103, -0.3175705, -3.68697, 0, 1, 0.5607843, 1,
-0.2078108, 0.2947606, -1.430999, 0, 1, 0.5686275, 1,
-0.2068263, 0.9275944, -0.7990433, 0, 1, 0.572549, 1,
-0.2046325, -1.328222, -4.545339, 0, 1, 0.5803922, 1,
-0.2015373, -0.009904421, -1.632036, 0, 1, 0.5843138, 1,
-0.1989407, -1.995184, -2.287148, 0, 1, 0.5921569, 1,
-0.1952293, 1.591978, -0.2797395, 0, 1, 0.5960785, 1,
-0.1897494, -0.9710529, -1.398773, 0, 1, 0.6039216, 1,
-0.187328, 0.01452574, -1.20673, 0, 1, 0.6117647, 1,
-0.1803681, -0.2785357, -3.180892, 0, 1, 0.6156863, 1,
-0.1780774, -1.428444, -2.906273, 0, 1, 0.6235294, 1,
-0.1775444, 0.2906106, -1.220471, 0, 1, 0.627451, 1,
-0.1701816, 1.192248, 0.3991149, 0, 1, 0.6352941, 1,
-0.1698678, 0.8570672, 1.379166, 0, 1, 0.6392157, 1,
-0.1653814, 1.727139, -0.9812504, 0, 1, 0.6470588, 1,
-0.1596657, -1.811974, -4.742527, 0, 1, 0.6509804, 1,
-0.1578411, -0.2341777, -3.097473, 0, 1, 0.6588235, 1,
-0.1575772, 2.761603, 2.527109, 0, 1, 0.6627451, 1,
-0.1555773, 2.151318, -0.06087956, 0, 1, 0.6705883, 1,
-0.146336, -0.7580271, -1.025283, 0, 1, 0.6745098, 1,
-0.1457282, -0.5346723, -0.4567029, 0, 1, 0.682353, 1,
-0.1446612, 0.05050054, -2.149501, 0, 1, 0.6862745, 1,
-0.1416644, 1.292761, -0.1388208, 0, 1, 0.6941177, 1,
-0.1399102, -0.4567263, -1.409452, 0, 1, 0.7019608, 1,
-0.1355812, 0.4365945, -0.06653571, 0, 1, 0.7058824, 1,
-0.1351381, -1.250471, -3.409054, 0, 1, 0.7137255, 1,
-0.1271898, 1.528485, -0.1138649, 0, 1, 0.7176471, 1,
-0.1241306, 0.1752359, -1.522078, 0, 1, 0.7254902, 1,
-0.1225317, 2.192158, 0.3717878, 0, 1, 0.7294118, 1,
-0.1214755, 0.495599, 0.5374019, 0, 1, 0.7372549, 1,
-0.1109162, 0.9307882, -0.08153557, 0, 1, 0.7411765, 1,
-0.1088375, 0.8068249, -0.1234237, 0, 1, 0.7490196, 1,
-0.1075145, 0.2830923, -0.3273466, 0, 1, 0.7529412, 1,
-0.1067531, -0.9334828, -3.143033, 0, 1, 0.7607843, 1,
-0.1066408, -0.171522, -5.208665, 0, 1, 0.7647059, 1,
-0.1062951, -1.03612, -3.675766, 0, 1, 0.772549, 1,
-0.1060601, 1.19107, -1.077471, 0, 1, 0.7764706, 1,
-0.1048557, -0.515689, -1.837988, 0, 1, 0.7843137, 1,
-0.1016235, 0.4250518, 2.456503, 0, 1, 0.7882353, 1,
-0.1004563, -0.4977749, -1.579594, 0, 1, 0.7960784, 1,
-0.099892, 0.0446983, -1.724512, 0, 1, 0.8039216, 1,
-0.09803203, 0.4706878, 0.07498183, 0, 1, 0.8078431, 1,
-0.09773372, -0.4341449, -1.18248, 0, 1, 0.8156863, 1,
-0.08599357, -0.2489841, -2.596529, 0, 1, 0.8196079, 1,
-0.08438315, -0.1861698, -0.7648175, 0, 1, 0.827451, 1,
-0.08314109, -1.654865, -2.236129, 0, 1, 0.8313726, 1,
-0.08245638, -2.415184, -4.29489, 0, 1, 0.8392157, 1,
-0.08179458, -0.6830521, -1.064006, 0, 1, 0.8431373, 1,
-0.07474414, -0.4393415, -4.025743, 0, 1, 0.8509804, 1,
-0.07385663, -0.2672588, -2.518014, 0, 1, 0.854902, 1,
-0.07217083, 0.2591039, 0.2011885, 0, 1, 0.8627451, 1,
-0.07155481, -0.7342013, -3.574934, 0, 1, 0.8666667, 1,
-0.07110903, 0.1139552, 0.1428438, 0, 1, 0.8745098, 1,
-0.06992536, 0.1292698, -1.121601, 0, 1, 0.8784314, 1,
-0.06475966, 1.997056, -0.1454168, 0, 1, 0.8862745, 1,
-0.06446402, -0.3261062, -2.219449, 0, 1, 0.8901961, 1,
-0.0639952, 0.7576554, -0.7352157, 0, 1, 0.8980392, 1,
-0.06075971, 0.4857711, -0.3901864, 0, 1, 0.9058824, 1,
-0.0511625, -1.087436, -1.72519, 0, 1, 0.9098039, 1,
-0.04558526, 1.677345, -1.099077, 0, 1, 0.9176471, 1,
-0.0382173, -0.2231039, -4.201888, 0, 1, 0.9215686, 1,
-0.0372209, 0.7715552, -1.327183, 0, 1, 0.9294118, 1,
-0.03064048, -0.2552536, -3.538787, 0, 1, 0.9333333, 1,
-0.02996911, 1.288091, 0.4628369, 0, 1, 0.9411765, 1,
-0.02920448, 0.1371405, -0.07884047, 0, 1, 0.945098, 1,
-0.02661042, -0.7369801, -1.185177, 0, 1, 0.9529412, 1,
-0.02563787, -0.02876921, -3.077616, 0, 1, 0.9568627, 1,
-0.02283754, -0.7385087, -3.388104, 0, 1, 0.9647059, 1,
-0.02124877, 1.705116, 0.4396597, 0, 1, 0.9686275, 1,
-0.01998859, 1.730162, -0.6072227, 0, 1, 0.9764706, 1,
-0.01812366, -1.286561, -3.31102, 0, 1, 0.9803922, 1,
-0.01639937, 1.133404, -0.3002832, 0, 1, 0.9882353, 1,
-0.0163343, -1.314094, -2.771106, 0, 1, 0.9921569, 1,
-0.01525389, 0.8932411, 1.494295, 0, 1, 1, 1,
-0.01484263, -1.4038, -3.851238, 0, 0.9921569, 1, 1,
-0.01242931, -0.9051241, -3.99087, 0, 0.9882353, 1, 1,
-0.01111077, -0.4179812, -2.198391, 0, 0.9803922, 1, 1,
-0.01053971, 0.5634903, 0.1172641, 0, 0.9764706, 1, 1,
0.0003089631, 0.2989709, -0.8023316, 0, 0.9686275, 1, 1,
0.005326814, 0.3668636, -1.017526, 0, 0.9647059, 1, 1,
0.009654807, 0.1336831, 0.2527661, 0, 0.9568627, 1, 1,
0.01050349, 0.3797787, -0.241795, 0, 0.9529412, 1, 1,
0.01104118, -0.2199819, 2.935112, 0, 0.945098, 1, 1,
0.01322777, 0.5038758, 2.036371, 0, 0.9411765, 1, 1,
0.01396524, 1.053044, 1.141202, 0, 0.9333333, 1, 1,
0.01759551, 1.419665, 0.1065332, 0, 0.9294118, 1, 1,
0.01847599, -0.3636222, 1.143178, 0, 0.9215686, 1, 1,
0.01857373, -0.9736359, 2.719752, 0, 0.9176471, 1, 1,
0.01965185, -1.96163, 2.657878, 0, 0.9098039, 1, 1,
0.01998261, -0.4165005, 2.430455, 0, 0.9058824, 1, 1,
0.02162017, 2.086568, -1.476009, 0, 0.8980392, 1, 1,
0.0290381, 0.3518124, -0.8143085, 0, 0.8901961, 1, 1,
0.03499047, 0.8367898, -1.208438, 0, 0.8862745, 1, 1,
0.04221355, 0.651997, 0.5820778, 0, 0.8784314, 1, 1,
0.04298949, 1.598107, 0.8680856, 0, 0.8745098, 1, 1,
0.04413632, 0.5158284, -0.2164256, 0, 0.8666667, 1, 1,
0.04485549, 0.2889947, 0.6048587, 0, 0.8627451, 1, 1,
0.04582246, 0.5162645, 1.919213, 0, 0.854902, 1, 1,
0.04852229, 1.449956, 0.5573796, 0, 0.8509804, 1, 1,
0.05485424, -1.16868, 4.333039, 0, 0.8431373, 1, 1,
0.05572963, -0.4963142, 3.447798, 0, 0.8392157, 1, 1,
0.05694744, -1.612572, 3.027826, 0, 0.8313726, 1, 1,
0.05764688, 0.2458898, 0.5719123, 0, 0.827451, 1, 1,
0.0631725, 0.155906, 0.8847346, 0, 0.8196079, 1, 1,
0.06413451, 0.2909298, 0.3891429, 0, 0.8156863, 1, 1,
0.06654561, 1.240673, -0.6869413, 0, 0.8078431, 1, 1,
0.06687998, -1.732402, 1.175761, 0, 0.8039216, 1, 1,
0.0669832, 0.6314, -0.6803319, 0, 0.7960784, 1, 1,
0.06973683, -1.708513, 3.319293, 0, 0.7882353, 1, 1,
0.07202572, -0.09440233, 2.962539, 0, 0.7843137, 1, 1,
0.0729091, 0.1579684, -0.4089902, 0, 0.7764706, 1, 1,
0.07379514, -0.1236227, 3.759681, 0, 0.772549, 1, 1,
0.07584091, 1.066832, 1.239062, 0, 0.7647059, 1, 1,
0.07679705, 1.051586, 1.127013, 0, 0.7607843, 1, 1,
0.07804248, -0.4298346, 0.06363577, 0, 0.7529412, 1, 1,
0.08561371, 0.2271871, 0.4042054, 0, 0.7490196, 1, 1,
0.09681057, 0.675484, -0.6188042, 0, 0.7411765, 1, 1,
0.1020674, -0.6583686, 2.360472, 0, 0.7372549, 1, 1,
0.1044036, 0.7171311, 0.4608664, 0, 0.7294118, 1, 1,
0.1059119, 0.531104, 0.03273775, 0, 0.7254902, 1, 1,
0.1093217, -0.8337329, 2.848779, 0, 0.7176471, 1, 1,
0.1102897, 0.3237967, 0.5471514, 0, 0.7137255, 1, 1,
0.1115152, 0.01513279, 0.4091275, 0, 0.7058824, 1, 1,
0.1125344, 1.395034, -0.7700523, 0, 0.6980392, 1, 1,
0.1166726, 0.1797211, -0.3093154, 0, 0.6941177, 1, 1,
0.117028, -1.349079, 3.160933, 0, 0.6862745, 1, 1,
0.1260142, 2.033181, 1.087082, 0, 0.682353, 1, 1,
0.1264472, 0.05946534, 1.883598, 0, 0.6745098, 1, 1,
0.1284073, 2.128987, -0.6254971, 0, 0.6705883, 1, 1,
0.1286723, -0.2125596, 3.276151, 0, 0.6627451, 1, 1,
0.1297776, 0.5793223, -0.04665772, 0, 0.6588235, 1, 1,
0.1348368, -0.6406614, 3.51214, 0, 0.6509804, 1, 1,
0.1366253, 0.8925425, -1.414188, 0, 0.6470588, 1, 1,
0.1387576, -1.91029, 4.416205, 0, 0.6392157, 1, 1,
0.1430839, -1.224684, 4.729115, 0, 0.6352941, 1, 1,
0.1461337, -1.029152, 3.978692, 0, 0.627451, 1, 1,
0.1502923, -1.119483, 3.166314, 0, 0.6235294, 1, 1,
0.1518506, -0.3357741, 3.140434, 0, 0.6156863, 1, 1,
0.154194, 1.100795, 1.3279, 0, 0.6117647, 1, 1,
0.1568593, -1.070775, 4.832198, 0, 0.6039216, 1, 1,
0.1601003, -1.133446, 2.73877, 0, 0.5960785, 1, 1,
0.1610304, -0.7735934, 1.568489, 0, 0.5921569, 1, 1,
0.1627976, -0.6777133, 2.803613, 0, 0.5843138, 1, 1,
0.1630165, 0.07189668, 0.3103556, 0, 0.5803922, 1, 1,
0.1658088, 1.585959, 0.02454031, 0, 0.572549, 1, 1,
0.1701137, -1.004161, 3.246607, 0, 0.5686275, 1, 1,
0.1718515, 0.08872124, 0.8647025, 0, 0.5607843, 1, 1,
0.1726336, 0.5548456, -2.175588, 0, 0.5568628, 1, 1,
0.1738806, -1.102985, 3.01048, 0, 0.5490196, 1, 1,
0.1746621, 1.149868, -1.15301, 0, 0.5450981, 1, 1,
0.1819499, 1.404963, 1.600304, 0, 0.5372549, 1, 1,
0.1829125, 1.039385, 0.4372235, 0, 0.5333334, 1, 1,
0.1830423, -1.76621, 3.736611, 0, 0.5254902, 1, 1,
0.1833796, -0.74488, 4.244312, 0, 0.5215687, 1, 1,
0.1876339, 1.910807, 1.123468, 0, 0.5137255, 1, 1,
0.1890055, -1.157156, 2.330479, 0, 0.509804, 1, 1,
0.1901444, 1.846742, 0.07175981, 0, 0.5019608, 1, 1,
0.1913019, -0.61063, 2.000472, 0, 0.4941176, 1, 1,
0.1989, 0.2982786, -0.485637, 0, 0.4901961, 1, 1,
0.1989239, -1.083338, 0.5350453, 0, 0.4823529, 1, 1,
0.2044594, 0.102545, 1.115395, 0, 0.4784314, 1, 1,
0.2047284, -0.302736, 3.005183, 0, 0.4705882, 1, 1,
0.2066533, 0.9523146, -0.03856141, 0, 0.4666667, 1, 1,
0.2131233, -0.9581105, 1.539648, 0, 0.4588235, 1, 1,
0.2144517, -0.08641739, -0.827485, 0, 0.454902, 1, 1,
0.2147864, -0.4878597, 1.324821, 0, 0.4470588, 1, 1,
0.221921, 0.2661582, 1.905814, 0, 0.4431373, 1, 1,
0.222349, -0.6174147, 1.490448, 0, 0.4352941, 1, 1,
0.22656, 0.4090855, -0.2646189, 0, 0.4313726, 1, 1,
0.2271355, -0.9890691, 3.417831, 0, 0.4235294, 1, 1,
0.2302538, -1.019048, 3.518543, 0, 0.4196078, 1, 1,
0.2324828, -1.44329, 4.238542, 0, 0.4117647, 1, 1,
0.2366284, 1.544837, 0.04771946, 0, 0.4078431, 1, 1,
0.2412344, 0.1148354, 2.255539, 0, 0.4, 1, 1,
0.2415904, -1.095812, 1.916053, 0, 0.3921569, 1, 1,
0.2452206, 1.410884, -0.2778448, 0, 0.3882353, 1, 1,
0.2475498, -0.1818118, 3.411105, 0, 0.3803922, 1, 1,
0.2500946, 0.2722577, 1.525939, 0, 0.3764706, 1, 1,
0.2575802, 0.4639986, -0.5500309, 0, 0.3686275, 1, 1,
0.2586166, 0.8422949, 0.8347808, 0, 0.3647059, 1, 1,
0.2596129, -1.2549, 4.973601, 0, 0.3568628, 1, 1,
0.2601897, -0.4930987, 3.119108, 0, 0.3529412, 1, 1,
0.261069, -0.4244054, 2.15741, 0, 0.345098, 1, 1,
0.2625088, 0.883342, 0.9718885, 0, 0.3411765, 1, 1,
0.2629935, 1.64281, 1.384384, 0, 0.3333333, 1, 1,
0.2632939, -0.2347193, 2.205997, 0, 0.3294118, 1, 1,
0.2649247, -0.6671429, 3.839784, 0, 0.3215686, 1, 1,
0.2654347, 1.400513, -0.493705, 0, 0.3176471, 1, 1,
0.2659228, -0.6530455, 2.439981, 0, 0.3098039, 1, 1,
0.2720344, -0.2659502, 2.431352, 0, 0.3058824, 1, 1,
0.2743911, -0.4750578, 3.56483, 0, 0.2980392, 1, 1,
0.2879096, -0.7668386, 3.661926, 0, 0.2901961, 1, 1,
0.2942082, 0.3093748, 0.1138629, 0, 0.2862745, 1, 1,
0.2947933, -2.013327, 3.756739, 0, 0.2784314, 1, 1,
0.2975945, 1.930281, 0.3651544, 0, 0.2745098, 1, 1,
0.2991566, -0.2263122, 3.118599, 0, 0.2666667, 1, 1,
0.2996591, 1.383469, 1.620309, 0, 0.2627451, 1, 1,
0.2997996, -0.3623925, 3.703556, 0, 0.254902, 1, 1,
0.3008436, -0.252224, 2.607892, 0, 0.2509804, 1, 1,
0.3013777, -1.128612, 1.674723, 0, 0.2431373, 1, 1,
0.3027883, -0.4323796, 0.9097032, 0, 0.2392157, 1, 1,
0.3058414, 0.08240914, 1.995237, 0, 0.2313726, 1, 1,
0.3086771, -0.7854416, 3.849079, 0, 0.227451, 1, 1,
0.310648, 1.866511, 0.4214278, 0, 0.2196078, 1, 1,
0.3119703, -1.413699, 2.683522, 0, 0.2156863, 1, 1,
0.3121395, -0.595292, 3.105472, 0, 0.2078431, 1, 1,
0.3130404, 0.928337, -1.353442, 0, 0.2039216, 1, 1,
0.3155305, 0.2140139, 1.794615, 0, 0.1960784, 1, 1,
0.3172145, -1.337694, 4.115109, 0, 0.1882353, 1, 1,
0.3220589, -0.3874689, 3.152386, 0, 0.1843137, 1, 1,
0.3221954, 0.7759356, -0.3338885, 0, 0.1764706, 1, 1,
0.3232982, 0.7097682, 0.8690215, 0, 0.172549, 1, 1,
0.3241544, 0.125604, 1.61124, 0, 0.1647059, 1, 1,
0.3252541, 0.1538092, 1.038955, 0, 0.1607843, 1, 1,
0.3278092, -0.5209557, 2.522984, 0, 0.1529412, 1, 1,
0.3336229, 0.5057262, -0.868115, 0, 0.1490196, 1, 1,
0.3387839, -0.156744, 3.094572, 0, 0.1411765, 1, 1,
0.3449391, 0.4525, 1.957877, 0, 0.1372549, 1, 1,
0.3462671, -0.8724034, 2.277902, 0, 0.1294118, 1, 1,
0.3472078, -1.261894, 2.154795, 0, 0.1254902, 1, 1,
0.3475114, 0.07425165, 1.175477, 0, 0.1176471, 1, 1,
0.3496745, 0.02579501, 1.457396, 0, 0.1137255, 1, 1,
0.3553125, 0.002090611, 2.50371, 0, 0.1058824, 1, 1,
0.364949, 0.3582137, 1.680538, 0, 0.09803922, 1, 1,
0.3650847, 0.4865452, 0.3092358, 0, 0.09411765, 1, 1,
0.3685817, 0.6939214, -0.3840433, 0, 0.08627451, 1, 1,
0.37276, 0.9445987, 0.1956503, 0, 0.08235294, 1, 1,
0.3738351, 0.2012103, 1.206722, 0, 0.07450981, 1, 1,
0.375058, 1.062472, 1.390598, 0, 0.07058824, 1, 1,
0.3754216, -1.001335, 1.923123, 0, 0.0627451, 1, 1,
0.3759236, 0.8833846, 0.7151365, 0, 0.05882353, 1, 1,
0.3762968, -1.20028, 3.645953, 0, 0.05098039, 1, 1,
0.3788854, -0.5220276, 3.745322, 0, 0.04705882, 1, 1,
0.3819013, -0.2431254, 0.4891247, 0, 0.03921569, 1, 1,
0.3828562, 2.255642, -0.9106806, 0, 0.03529412, 1, 1,
0.38505, -1.273759, 2.050654, 0, 0.02745098, 1, 1,
0.3869843, 0.3848793, 2.219417, 0, 0.02352941, 1, 1,
0.3875875, 0.5648441, 0.4088532, 0, 0.01568628, 1, 1,
0.387698, 0.4605588, 1.202907, 0, 0.01176471, 1, 1,
0.3913082, -0.7695673, 5.202312, 0, 0.003921569, 1, 1,
0.3943638, 1.062793, 2.041331, 0.003921569, 0, 1, 1,
0.3965283, -0.856442, 4.997472, 0.007843138, 0, 1, 1,
0.3997083, 1.262908, -0.04818099, 0.01568628, 0, 1, 1,
0.4039434, -0.6219794, 3.007569, 0.01960784, 0, 1, 1,
0.4060592, -0.9504283, 6.210893e-05, 0.02745098, 0, 1, 1,
0.4084468, 0.9387966, 1.088277, 0.03137255, 0, 1, 1,
0.4113654, -1.708138, 3.659172, 0.03921569, 0, 1, 1,
0.4175482, -0.4008279, 3.344201, 0.04313726, 0, 1, 1,
0.4194047, -1.736382, 3.45801, 0.05098039, 0, 1, 1,
0.423089, 1.356528, 1.00884, 0.05490196, 0, 1, 1,
0.4232495, -0.08045183, 1.490595, 0.0627451, 0, 1, 1,
0.4261702, 1.010529, 1.439611, 0.06666667, 0, 1, 1,
0.4294901, 0.2953981, 0.05449288, 0.07450981, 0, 1, 1,
0.4346097, -0.4862498, 3.783577, 0.07843138, 0, 1, 1,
0.4383513, -0.02370631, 2.357957, 0.08627451, 0, 1, 1,
0.4408975, -1.389241, 3.042422, 0.09019608, 0, 1, 1,
0.4442039, 1.07494, 0.4497215, 0.09803922, 0, 1, 1,
0.4449871, -0.1127802, 1.64467, 0.1058824, 0, 1, 1,
0.4465404, 1.249599, 1.391978, 0.1098039, 0, 1, 1,
0.4471717, -0.5986198, 2.363242, 0.1176471, 0, 1, 1,
0.4485247, -1.755688, 3.346128, 0.1215686, 0, 1, 1,
0.4495528, -0.2841652, 2.801613, 0.1294118, 0, 1, 1,
0.4496543, 0.2179905, 0.7279662, 0.1333333, 0, 1, 1,
0.4508073, -0.8575628, 2.622082, 0.1411765, 0, 1, 1,
0.4510382, 0.4237284, 0.2571718, 0.145098, 0, 1, 1,
0.45641, 3.235169, -0.5699514, 0.1529412, 0, 1, 1,
0.468, 1.909965, 0.1043436, 0.1568628, 0, 1, 1,
0.4686892, -0.1285775, 2.835426, 0.1647059, 0, 1, 1,
0.4778512, 2.316958, 1.114853, 0.1686275, 0, 1, 1,
0.4787954, -0.2594005, 0.4638065, 0.1764706, 0, 1, 1,
0.4795622, 0.1108776, 0.2482033, 0.1803922, 0, 1, 1,
0.4814608, -0.2321387, 1.768325, 0.1882353, 0, 1, 1,
0.4846892, -0.3908814, 2.827723, 0.1921569, 0, 1, 1,
0.4858741, -0.68553, 3.081375, 0.2, 0, 1, 1,
0.4874822, 1.437494, -0.7967748, 0.2078431, 0, 1, 1,
0.4908222, -0.4359453, 3.308782, 0.2117647, 0, 1, 1,
0.4956078, -1.557793, 4.848561, 0.2196078, 0, 1, 1,
0.4991966, -0.8315834, 2.929818, 0.2235294, 0, 1, 1,
0.504545, -1.092556, 2.338764, 0.2313726, 0, 1, 1,
0.5057526, 0.7124979, 1.484529, 0.2352941, 0, 1, 1,
0.5095859, 0.006703998, 2.749801, 0.2431373, 0, 1, 1,
0.5105009, 0.5663691, 2.862301, 0.2470588, 0, 1, 1,
0.5118901, 0.6936991, 0.567733, 0.254902, 0, 1, 1,
0.5151197, -0.2802105, 3.065628, 0.2588235, 0, 1, 1,
0.5185384, -0.3472966, 1.667677, 0.2666667, 0, 1, 1,
0.5191879, 1.742009, 0.1671197, 0.2705882, 0, 1, 1,
0.5194989, -0.4658891, 1.39759, 0.2784314, 0, 1, 1,
0.5195763, -1.131994, 2.586906, 0.282353, 0, 1, 1,
0.5215426, 0.3647586, 1.418034, 0.2901961, 0, 1, 1,
0.5235878, 2.459157, 0.5623435, 0.2941177, 0, 1, 1,
0.5250821, 0.6959141, 0.2218215, 0.3019608, 0, 1, 1,
0.5253301, -0.4379982, 0.9714507, 0.3098039, 0, 1, 1,
0.5322351, 0.2771838, 0.6061741, 0.3137255, 0, 1, 1,
0.5323021, -0.3411783, 3.891767, 0.3215686, 0, 1, 1,
0.5323232, -1.081292, 2.800852, 0.3254902, 0, 1, 1,
0.534454, -0.7637409, 0.7487572, 0.3333333, 0, 1, 1,
0.5352829, 1.529698, -0.5256705, 0.3372549, 0, 1, 1,
0.5389445, 1.267118, 0.4112136, 0.345098, 0, 1, 1,
0.5469238, 0.6670537, 0.02495486, 0.3490196, 0, 1, 1,
0.547459, 1.158338, 1.153305, 0.3568628, 0, 1, 1,
0.5506695, 1.351207, 2.05072, 0.3607843, 0, 1, 1,
0.557734, -0.8455321, 0.8472497, 0.3686275, 0, 1, 1,
0.5588334, -0.1837851, 1.315292, 0.372549, 0, 1, 1,
0.5600893, -1.175484, 4.489665, 0.3803922, 0, 1, 1,
0.5622916, 0.2345904, -0.1627954, 0.3843137, 0, 1, 1,
0.5625969, 0.2464931, 1.34735, 0.3921569, 0, 1, 1,
0.565416, 0.6951776, 0.5978776, 0.3960784, 0, 1, 1,
0.566687, -1.010447, 2.951225, 0.4039216, 0, 1, 1,
0.5675532, -0.237857, 2.296129, 0.4117647, 0, 1, 1,
0.567982, -0.3095757, 3.673798, 0.4156863, 0, 1, 1,
0.5698335, 0.7482758, -0.632731, 0.4235294, 0, 1, 1,
0.5709321, -0.7695435, 2.394583, 0.427451, 0, 1, 1,
0.5726047, -1.126054, 2.483119, 0.4352941, 0, 1, 1,
0.5752565, 1.02807, 0.5464152, 0.4392157, 0, 1, 1,
0.5801137, -0.6297419, 1.868816, 0.4470588, 0, 1, 1,
0.58448, -0.3809573, 0.5581638, 0.4509804, 0, 1, 1,
0.5854802, -0.4262573, 2.877578, 0.4588235, 0, 1, 1,
0.5878135, -1.196941, 1.371662, 0.4627451, 0, 1, 1,
0.5950792, -0.4384118, 2.96824, 0.4705882, 0, 1, 1,
0.5959677, 0.4450015, -0.07414437, 0.4745098, 0, 1, 1,
0.5978751, 0.4624149, 0.1645846, 0.4823529, 0, 1, 1,
0.6014858, -0.495667, 0.6187066, 0.4862745, 0, 1, 1,
0.6025202, -1.480157, 2.762293, 0.4941176, 0, 1, 1,
0.6031716, 1.022469, -0.204664, 0.5019608, 0, 1, 1,
0.6060239, -2.488676, 2.96741, 0.5058824, 0, 1, 1,
0.6082236, -0.01865485, 3.191258, 0.5137255, 0, 1, 1,
0.6115279, -0.2551591, 3.147991, 0.5176471, 0, 1, 1,
0.6128446, 0.5446925, 1.952923, 0.5254902, 0, 1, 1,
0.6137466, -1.651919, 1.506706, 0.5294118, 0, 1, 1,
0.6148221, 0.007008683, 0.2481554, 0.5372549, 0, 1, 1,
0.6231404, -1.346272, 3.287352, 0.5411765, 0, 1, 1,
0.6288453, 0.7823296, -0.02327475, 0.5490196, 0, 1, 1,
0.6291626, 0.726746, 1.231392, 0.5529412, 0, 1, 1,
0.6326942, -0.0266123, 1.80551, 0.5607843, 0, 1, 1,
0.633918, -0.3515503, 1.118961, 0.5647059, 0, 1, 1,
0.6363373, -2.222947, 2.970337, 0.572549, 0, 1, 1,
0.6364072, -1.796985, 3.159541, 0.5764706, 0, 1, 1,
0.6365325, 1.77577, 0.4706241, 0.5843138, 0, 1, 1,
0.6392086, -0.6703454, 3.52115, 0.5882353, 0, 1, 1,
0.6411682, 0.4375757, -0.3750299, 0.5960785, 0, 1, 1,
0.6421788, -0.254319, 1.977878, 0.6039216, 0, 1, 1,
0.6460404, 0.1448082, 0.400863, 0.6078432, 0, 1, 1,
0.648904, 1.284701, -0.09285676, 0.6156863, 0, 1, 1,
0.6524939, -0.8067725, 3.223807, 0.6196079, 0, 1, 1,
0.6559451, -0.02087911, 2.198755, 0.627451, 0, 1, 1,
0.6568146, -0.5167643, 1.359834, 0.6313726, 0, 1, 1,
0.6597238, -0.30788, 2.957414, 0.6392157, 0, 1, 1,
0.6633153, 2.35228, -0.8551607, 0.6431373, 0, 1, 1,
0.665359, 0.6099295, -1.509398, 0.6509804, 0, 1, 1,
0.6654179, -0.7136311, 3.19892, 0.654902, 0, 1, 1,
0.6734223, 1.121562, 0.3644452, 0.6627451, 0, 1, 1,
0.6749875, -0.2690907, 1.714282, 0.6666667, 0, 1, 1,
0.6751739, 0.6161625, 1.541499, 0.6745098, 0, 1, 1,
0.6813477, 1.251214, 1.886618, 0.6784314, 0, 1, 1,
0.6816483, -0.3721125, 3.219744, 0.6862745, 0, 1, 1,
0.6835588, 2.089845, 2.010319, 0.6901961, 0, 1, 1,
0.6839801, 1.109125, 0.6043554, 0.6980392, 0, 1, 1,
0.6846842, -1.268256, 2.646275, 0.7058824, 0, 1, 1,
0.6852456, 0.5265871, 0.9831042, 0.7098039, 0, 1, 1,
0.68893, -0.8773651, 2.561076, 0.7176471, 0, 1, 1,
0.6913424, 0.3619167, 1.515201, 0.7215686, 0, 1, 1,
0.6955925, -0.4719542, 1.987288, 0.7294118, 0, 1, 1,
0.6972958, -0.7915311, 1.837934, 0.7333333, 0, 1, 1,
0.6998934, 2.003929, -1.304612, 0.7411765, 0, 1, 1,
0.7052414, 0.1870208, 1.61518, 0.7450981, 0, 1, 1,
0.7116969, -0.2189916, 2.410475, 0.7529412, 0, 1, 1,
0.7127421, -0.7577091, 2.260492, 0.7568628, 0, 1, 1,
0.7183791, -0.9947656, 2.356532, 0.7647059, 0, 1, 1,
0.7221583, 0.6297562, -0.7592831, 0.7686275, 0, 1, 1,
0.7222711, 0.2495241, 1.643959, 0.7764706, 0, 1, 1,
0.7224811, -0.7020444, 1.287598, 0.7803922, 0, 1, 1,
0.7279844, -0.6241282, 2.614633, 0.7882353, 0, 1, 1,
0.7287576, -1.031636, 3.623888, 0.7921569, 0, 1, 1,
0.7287902, 1.69081, 0.5763883, 0.8, 0, 1, 1,
0.728937, -0.5400754, 2.945012, 0.8078431, 0, 1, 1,
0.734626, -1.511607, 4.646109, 0.8117647, 0, 1, 1,
0.7349429, 1.217597, 0.4653793, 0.8196079, 0, 1, 1,
0.7362935, -0.1810679, 0.1751989, 0.8235294, 0, 1, 1,
0.7435246, 0.8959033, 1.378644, 0.8313726, 0, 1, 1,
0.745407, -0.9051306, 4.767784, 0.8352941, 0, 1, 1,
0.7469412, -0.6651143, 2.039882, 0.8431373, 0, 1, 1,
0.7606051, -0.8158988, 1.622122, 0.8470588, 0, 1, 1,
0.7663728, -1.007065, 2.634099, 0.854902, 0, 1, 1,
0.7716267, 0.3796381, 2.751704, 0.8588235, 0, 1, 1,
0.7737429, 0.7279877, 0.3250466, 0.8666667, 0, 1, 1,
0.7798591, -0.7107326, 3.283843, 0.8705882, 0, 1, 1,
0.7833359, 0.146227, 0.9835891, 0.8784314, 0, 1, 1,
0.7912247, 0.04203688, 0.470947, 0.8823529, 0, 1, 1,
0.795516, 1.329941, 2.163063, 0.8901961, 0, 1, 1,
0.8045096, 1.593351, 0.1142295, 0.8941177, 0, 1, 1,
0.8053834, 0.2958657, 2.061787, 0.9019608, 0, 1, 1,
0.8072246, -0.738708, 1.659796, 0.9098039, 0, 1, 1,
0.8142422, -0.6996189, 0.5225593, 0.9137255, 0, 1, 1,
0.8221223, 0.2023995, 1.11937, 0.9215686, 0, 1, 1,
0.8229955, -2.701523, 2.816854, 0.9254902, 0, 1, 1,
0.8249879, 0.3283494, 1.202219, 0.9333333, 0, 1, 1,
0.834079, -0.9637187, 2.508506, 0.9372549, 0, 1, 1,
0.8362686, -0.005478198, 2.004822, 0.945098, 0, 1, 1,
0.8513181, 0.4451319, 1.283729, 0.9490196, 0, 1, 1,
0.8517218, -0.2840477, 2.251643, 0.9568627, 0, 1, 1,
0.8536338, -0.7100083, 1.867831, 0.9607843, 0, 1, 1,
0.8552039, 2.298805, -0.1778971, 0.9686275, 0, 1, 1,
0.8584434, 0.7766244, 0.6927922, 0.972549, 0, 1, 1,
0.865379, -1.297827, 3.021104, 0.9803922, 0, 1, 1,
0.8687053, -0.1563708, 1.285602, 0.9843137, 0, 1, 1,
0.8695921, 0.3431338, 1.83557, 0.9921569, 0, 1, 1,
0.8793935, 0.1712862, 2.2365, 0.9960784, 0, 1, 1,
0.8907254, 0.06240056, 1.780528, 1, 0, 0.9960784, 1,
0.8960595, -1.510981, 2.710553, 1, 0, 0.9882353, 1,
0.8973571, 0.6149141, -0.164646, 1, 0, 0.9843137, 1,
0.9060427, -1.310164, 4.098428, 1, 0, 0.9764706, 1,
0.9084536, -0.738429, 0.2158276, 1, 0, 0.972549, 1,
0.9088345, -0.5864037, 3.11451, 1, 0, 0.9647059, 1,
0.910937, 1.567186, 0.7391247, 1, 0, 0.9607843, 1,
0.9146894, 1.803745, 1.022749, 1, 0, 0.9529412, 1,
0.9153222, -0.0936818, 1.636904, 1, 0, 0.9490196, 1,
0.9159872, -1.698679, 1.971554, 1, 0, 0.9411765, 1,
0.9178124, 0.5438354, 2.633607, 1, 0, 0.9372549, 1,
0.9191253, -0.6858286, 1.184671, 1, 0, 0.9294118, 1,
0.9200189, -0.4938688, 2.314088, 1, 0, 0.9254902, 1,
0.9222876, -0.7425037, 3.701105, 1, 0, 0.9176471, 1,
0.9227936, 2.052949, 0.1526778, 1, 0, 0.9137255, 1,
0.924347, 0.4076912, 1.726861, 1, 0, 0.9058824, 1,
0.9277064, -1.273545, 4.903744, 1, 0, 0.9019608, 1,
0.930524, -0.6366802, 3.353386, 1, 0, 0.8941177, 1,
0.9366016, 0.3512152, -0.5426126, 1, 0, 0.8862745, 1,
0.9368064, 0.7062893, 1.427978, 1, 0, 0.8823529, 1,
0.9375052, -1.010277, 3.113217, 1, 0, 0.8745098, 1,
0.9403936, 0.4317427, 2.639896, 1, 0, 0.8705882, 1,
0.9417797, -0.8290899, 1.64009, 1, 0, 0.8627451, 1,
0.9446785, -2.24897, 1.951281, 1, 0, 0.8588235, 1,
0.9492947, 1.89266, -0.1054532, 1, 0, 0.8509804, 1,
0.9502916, 0.04338599, 2.131079, 1, 0, 0.8470588, 1,
0.9562995, 0.05311331, 2.668771, 1, 0, 0.8392157, 1,
0.9627028, 1.284786, 1.102652, 1, 0, 0.8352941, 1,
0.9673469, 1.449153, 1.180626, 1, 0, 0.827451, 1,
0.9699935, -1.08294, 3.537373, 1, 0, 0.8235294, 1,
0.9762954, -0.2497652, 2.274199, 1, 0, 0.8156863, 1,
0.9822505, -0.3430962, 1.078904, 1, 0, 0.8117647, 1,
0.9827806, 0.08551721, -1.060798, 1, 0, 0.8039216, 1,
0.9874901, 0.3186669, 1.443994, 1, 0, 0.7960784, 1,
0.9896334, 1.705485, -0.4858143, 1, 0, 0.7921569, 1,
1.007177, 0.08451267, -0.07132327, 1, 0, 0.7843137, 1,
1.009542, -0.9903006, 4.12607, 1, 0, 0.7803922, 1,
1.013201, -1.199321, 2.776408, 1, 0, 0.772549, 1,
1.01439, -2.18313, 2.047435, 1, 0, 0.7686275, 1,
1.014705, -0.9005602, 2.079865, 1, 0, 0.7607843, 1,
1.015709, -0.7075476, 3.054398, 1, 0, 0.7568628, 1,
1.019525, 0.5151287, 2.290808, 1, 0, 0.7490196, 1,
1.028341, 0.01601484, 0.05826931, 1, 0, 0.7450981, 1,
1.031373, 0.003371562, 0.4079306, 1, 0, 0.7372549, 1,
1.044043, 0.3240934, 1.381427, 1, 0, 0.7333333, 1,
1.05116, 1.391782, 1.020866, 1, 0, 0.7254902, 1,
1.055955, 0.08482714, 1.221069, 1, 0, 0.7215686, 1,
1.058775, 0.2687666, 1.835898, 1, 0, 0.7137255, 1,
1.065131, 0.5789267, 2.168812, 1, 0, 0.7098039, 1,
1.065548, -1.191797, 4.417163, 1, 0, 0.7019608, 1,
1.083609, 0.3333221, 1.416707, 1, 0, 0.6941177, 1,
1.090908, 0.7301321, 1.415872, 1, 0, 0.6901961, 1,
1.093542, -1.01267, 1.717858, 1, 0, 0.682353, 1,
1.095557, 1.196539, -0.06583025, 1, 0, 0.6784314, 1,
1.09782, 0.9531481, 1.36378, 1, 0, 0.6705883, 1,
1.098119, 1.938146, 0.04807111, 1, 0, 0.6666667, 1,
1.101183, -1.546879, 2.245236, 1, 0, 0.6588235, 1,
1.110564, -1.779033, 2.158099, 1, 0, 0.654902, 1,
1.111467, 3.235555, 0.8860281, 1, 0, 0.6470588, 1,
1.115654, -0.1552908, -0.3977306, 1, 0, 0.6431373, 1,
1.119396, -1.052388, 3.951832, 1, 0, 0.6352941, 1,
1.121621, -0.4397848, 1.924096, 1, 0, 0.6313726, 1,
1.122262, 1.647389, 0.1464407, 1, 0, 0.6235294, 1,
1.12247, -0.1696967, 1.428124, 1, 0, 0.6196079, 1,
1.12738, 2.533699, -0.4217677, 1, 0, 0.6117647, 1,
1.130679, -0.7152131, 3.567105, 1, 0, 0.6078432, 1,
1.134999, 1.562622, 2.300284, 1, 0, 0.6, 1,
1.143964, -1.314981, 2.060723, 1, 0, 0.5921569, 1,
1.145023, -0.3757525, 1.471798, 1, 0, 0.5882353, 1,
1.14637, -0.584312, 1.331784, 1, 0, 0.5803922, 1,
1.151141, 0.8463469, 1.319848, 1, 0, 0.5764706, 1,
1.156646, -1.539802, 2.033429, 1, 0, 0.5686275, 1,
1.165373, 0.3567157, 0.3305556, 1, 0, 0.5647059, 1,
1.169141, -1.071078, 2.870401, 1, 0, 0.5568628, 1,
1.173075, 0.8751123, 1.943246, 1, 0, 0.5529412, 1,
1.185593, -0.5021996, 2.990064, 1, 0, 0.5450981, 1,
1.187322, 1.693563, 1.111278, 1, 0, 0.5411765, 1,
1.18873, -0.9125311, 3.407956, 1, 0, 0.5333334, 1,
1.206742, -3.03451, 4.072235, 1, 0, 0.5294118, 1,
1.254132, -0.5136295, 2.896856, 1, 0, 0.5215687, 1,
1.2568, -0.2385656, 2.714275, 1, 0, 0.5176471, 1,
1.26312, 0.2635387, 0.6076576, 1, 0, 0.509804, 1,
1.264553, -1.467531, 3.771675, 1, 0, 0.5058824, 1,
1.270751, 0.6098779, -0.595201, 1, 0, 0.4980392, 1,
1.271322, 0.6879365, 1.415916, 1, 0, 0.4901961, 1,
1.28324, 1.598137, 0.9154187, 1, 0, 0.4862745, 1,
1.285079, 1.502936, 1.124888, 1, 0, 0.4784314, 1,
1.296483, 0.04704321, 1.013101, 1, 0, 0.4745098, 1,
1.296667, 0.509635, -0.3291639, 1, 0, 0.4666667, 1,
1.298311, 0.03926678, 2.148796, 1, 0, 0.4627451, 1,
1.304975, 1.211084, -0.4750444, 1, 0, 0.454902, 1,
1.313352, -0.4615988, 2.401783, 1, 0, 0.4509804, 1,
1.31837, 0.05587983, 2.016095, 1, 0, 0.4431373, 1,
1.334181, -1.317043, 2.51956, 1, 0, 0.4392157, 1,
1.34685, -1.368042, 4.259314, 1, 0, 0.4313726, 1,
1.35636, -0.1618908, 1.209051, 1, 0, 0.427451, 1,
1.361524, -0.9667923, 3.638181, 1, 0, 0.4196078, 1,
1.414868, -1.104055, 3.707449, 1, 0, 0.4156863, 1,
1.420853, 0.8867841, -0.1152707, 1, 0, 0.4078431, 1,
1.423989, 0.9371191, -0.4287486, 1, 0, 0.4039216, 1,
1.446622, 0.2841189, 0.7067121, 1, 0, 0.3960784, 1,
1.467312, -0.7326233, 2.691755, 1, 0, 0.3882353, 1,
1.471173, 0.6224866, 1.315312, 1, 0, 0.3843137, 1,
1.476096, -1.354916, 1.687955, 1, 0, 0.3764706, 1,
1.476526, 0.829729, 1.294106, 1, 0, 0.372549, 1,
1.478261, 0.1570419, 0.4511563, 1, 0, 0.3647059, 1,
1.482473, 2.326102, -0.2834374, 1, 0, 0.3607843, 1,
1.485867, -0.3736575, 0.5059663, 1, 0, 0.3529412, 1,
1.493881, -0.4511701, 3.089686, 1, 0, 0.3490196, 1,
1.497493, -0.2315513, 0.9485452, 1, 0, 0.3411765, 1,
1.501841, 0.6328453, 0.3899269, 1, 0, 0.3372549, 1,
1.504461, -0.02948201, 1.662604, 1, 0, 0.3294118, 1,
1.508152, 0.1496477, 0.4467762, 1, 0, 0.3254902, 1,
1.511141, -0.7125388, 1.877787, 1, 0, 0.3176471, 1,
1.519291, 0.3046266, 2.257076, 1, 0, 0.3137255, 1,
1.551921, -0.5064445, 1.320562, 1, 0, 0.3058824, 1,
1.57948, 1.405956, 1.547826, 1, 0, 0.2980392, 1,
1.582735, -0.2827647, 2.37045, 1, 0, 0.2941177, 1,
1.611456, -0.8244742, 1.055104, 1, 0, 0.2862745, 1,
1.619464, -2.073273, 1.627844, 1, 0, 0.282353, 1,
1.628753, -1.816673, 3.59332, 1, 0, 0.2745098, 1,
1.661772, -0.7282516, 2.865558, 1, 0, 0.2705882, 1,
1.663172, 0.5446485, 1.441889, 1, 0, 0.2627451, 1,
1.673858, 1.045628, 0.6815892, 1, 0, 0.2588235, 1,
1.674769, -0.04896227, 0.6832266, 1, 0, 0.2509804, 1,
1.686889, 0.07756492, 0.04921068, 1, 0, 0.2470588, 1,
1.735369, -0.3330367, 1.61251, 1, 0, 0.2392157, 1,
1.759754, 0.8731656, 0.6736717, 1, 0, 0.2352941, 1,
1.761041, 0.9667203, 1.040294, 1, 0, 0.227451, 1,
1.784004, 1.473247, 2.694561, 1, 0, 0.2235294, 1,
1.789472, 0.8993998, 1.382155, 1, 0, 0.2156863, 1,
1.795554, 0.1837252, 0.3366786, 1, 0, 0.2117647, 1,
1.798361, 0.3585626, 1.739873, 1, 0, 0.2039216, 1,
1.798944, -0.5000539, 1.598616, 1, 0, 0.1960784, 1,
1.819862, 0.7826968, 0.7542238, 1, 0, 0.1921569, 1,
1.828228, -1.605786, 1.677004, 1, 0, 0.1843137, 1,
1.857592, -0.1107553, 1.087855, 1, 0, 0.1803922, 1,
1.85844, 0.4779787, -0.1072609, 1, 0, 0.172549, 1,
1.88986, 0.7942707, -0.5134441, 1, 0, 0.1686275, 1,
1.894449, 0.3082888, 0.006674377, 1, 0, 0.1607843, 1,
1.90974, 0.6489628, 0.9696633, 1, 0, 0.1568628, 1,
1.926086, 0.6998864, 0.434552, 1, 0, 0.1490196, 1,
1.937683, 0.56536, 0.5634029, 1, 0, 0.145098, 1,
1.939105, -0.5403169, 2.248978, 1, 0, 0.1372549, 1,
1.946689, 1.491656, 0.2898989, 1, 0, 0.1333333, 1,
1.960731, 1.140887, 0.9464277, 1, 0, 0.1254902, 1,
1.962415, 1.971652, 1.746558, 1, 0, 0.1215686, 1,
1.969286, -0.7232566, 1.503176, 1, 0, 0.1137255, 1,
1.995927, 0.0314997, 0.925343, 1, 0, 0.1098039, 1,
2.064137, 0.476171, 1.687052, 1, 0, 0.1019608, 1,
2.069332, 0.1204394, -0.3091574, 1, 0, 0.09411765, 1,
2.088246, -0.6144823, 2.628212, 1, 0, 0.09019608, 1,
2.119924, 1.304331, 3.463361, 1, 0, 0.08235294, 1,
2.134838, 0.4308787, 2.694689, 1, 0, 0.07843138, 1,
2.210743, -0.8793134, 1.506563, 1, 0, 0.07058824, 1,
2.212624, 0.7865232, 2.64728, 1, 0, 0.06666667, 1,
2.239335, -0.6221883, 2.497696, 1, 0, 0.05882353, 1,
2.33897, -0.4759482, 1.417961, 1, 0, 0.05490196, 1,
2.339898, -1.053266, 3.489284, 1, 0, 0.04705882, 1,
2.353072, 3.02308, 0.6565486, 1, 0, 0.04313726, 1,
2.394851, 0.6285826, 2.061713, 1, 0, 0.03529412, 1,
2.400796, -0.8894189, 2.323366, 1, 0, 0.03137255, 1,
2.409929, -0.1889617, 2.804791, 1, 0, 0.02352941, 1,
2.455903, 0.598152, 2.579192, 1, 0, 0.01960784, 1,
2.703151, -0.8135527, 1.54811, 1, 0, 0.01176471, 1,
3.425173, -0.3467746, 1.687183, 1, 0, 0.007843138, 1
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
0.07763422, -4.097287, -7.057324, 0, -0.5, 0.5, 0.5,
0.07763422, -4.097287, -7.057324, 1, -0.5, 0.5, 0.5,
0.07763422, -4.097287, -7.057324, 1, 1.5, 0.5, 0.5,
0.07763422, -4.097287, -7.057324, 0, 1.5, 0.5, 0.5
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
-4.404721, 0.1005225, -7.057324, 0, -0.5, 0.5, 0.5,
-4.404721, 0.1005225, -7.057324, 1, -0.5, 0.5, 0.5,
-4.404721, 0.1005225, -7.057324, 1, 1.5, 0.5, 0.5,
-4.404721, 0.1005225, -7.057324, 0, 1.5, 0.5, 0.5
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
-4.404721, -4.097287, -0.03908873, 0, -0.5, 0.5, 0.5,
-4.404721, -4.097287, -0.03908873, 1, -0.5, 0.5, 0.5,
-4.404721, -4.097287, -0.03908873, 1, 1.5, 0.5, 0.5,
-4.404721, -4.097287, -0.03908873, 0, 1.5, 0.5, 0.5
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
-3, -3.128561, -5.437731,
3, -3.128561, -5.437731,
-3, -3.128561, -5.437731,
-3, -3.290015, -5.707664,
-2, -3.128561, -5.437731,
-2, -3.290015, -5.707664,
-1, -3.128561, -5.437731,
-1, -3.290015, -5.707664,
0, -3.128561, -5.437731,
0, -3.290015, -5.707664,
1, -3.128561, -5.437731,
1, -3.290015, -5.707664,
2, -3.128561, -5.437731,
2, -3.290015, -5.707664,
3, -3.128561, -5.437731,
3, -3.290015, -5.707664
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
-3, -3.612924, -6.247528, 0, -0.5, 0.5, 0.5,
-3, -3.612924, -6.247528, 1, -0.5, 0.5, 0.5,
-3, -3.612924, -6.247528, 1, 1.5, 0.5, 0.5,
-3, -3.612924, -6.247528, 0, 1.5, 0.5, 0.5,
-2, -3.612924, -6.247528, 0, -0.5, 0.5, 0.5,
-2, -3.612924, -6.247528, 1, -0.5, 0.5, 0.5,
-2, -3.612924, -6.247528, 1, 1.5, 0.5, 0.5,
-2, -3.612924, -6.247528, 0, 1.5, 0.5, 0.5,
-1, -3.612924, -6.247528, 0, -0.5, 0.5, 0.5,
-1, -3.612924, -6.247528, 1, -0.5, 0.5, 0.5,
-1, -3.612924, -6.247528, 1, 1.5, 0.5, 0.5,
-1, -3.612924, -6.247528, 0, 1.5, 0.5, 0.5,
0, -3.612924, -6.247528, 0, -0.5, 0.5, 0.5,
0, -3.612924, -6.247528, 1, -0.5, 0.5, 0.5,
0, -3.612924, -6.247528, 1, 1.5, 0.5, 0.5,
0, -3.612924, -6.247528, 0, 1.5, 0.5, 0.5,
1, -3.612924, -6.247528, 0, -0.5, 0.5, 0.5,
1, -3.612924, -6.247528, 1, -0.5, 0.5, 0.5,
1, -3.612924, -6.247528, 1, 1.5, 0.5, 0.5,
1, -3.612924, -6.247528, 0, 1.5, 0.5, 0.5,
2, -3.612924, -6.247528, 0, -0.5, 0.5, 0.5,
2, -3.612924, -6.247528, 1, -0.5, 0.5, 0.5,
2, -3.612924, -6.247528, 1, 1.5, 0.5, 0.5,
2, -3.612924, -6.247528, 0, 1.5, 0.5, 0.5,
3, -3.612924, -6.247528, 0, -0.5, 0.5, 0.5,
3, -3.612924, -6.247528, 1, -0.5, 0.5, 0.5,
3, -3.612924, -6.247528, 1, 1.5, 0.5, 0.5,
3, -3.612924, -6.247528, 0, 1.5, 0.5, 0.5
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
-3.370331, -3, -5.437731,
-3.370331, 3, -5.437731,
-3.370331, -3, -5.437731,
-3.542729, -3, -5.707664,
-3.370331, -2, -5.437731,
-3.542729, -2, -5.707664,
-3.370331, -1, -5.437731,
-3.542729, -1, -5.707664,
-3.370331, 0, -5.437731,
-3.542729, 0, -5.707664,
-3.370331, 1, -5.437731,
-3.542729, 1, -5.707664,
-3.370331, 2, -5.437731,
-3.542729, 2, -5.707664,
-3.370331, 3, -5.437731,
-3.542729, 3, -5.707664
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
-3.887526, -3, -6.247528, 0, -0.5, 0.5, 0.5,
-3.887526, -3, -6.247528, 1, -0.5, 0.5, 0.5,
-3.887526, -3, -6.247528, 1, 1.5, 0.5, 0.5,
-3.887526, -3, -6.247528, 0, 1.5, 0.5, 0.5,
-3.887526, -2, -6.247528, 0, -0.5, 0.5, 0.5,
-3.887526, -2, -6.247528, 1, -0.5, 0.5, 0.5,
-3.887526, -2, -6.247528, 1, 1.5, 0.5, 0.5,
-3.887526, -2, -6.247528, 0, 1.5, 0.5, 0.5,
-3.887526, -1, -6.247528, 0, -0.5, 0.5, 0.5,
-3.887526, -1, -6.247528, 1, -0.5, 0.5, 0.5,
-3.887526, -1, -6.247528, 1, 1.5, 0.5, 0.5,
-3.887526, -1, -6.247528, 0, 1.5, 0.5, 0.5,
-3.887526, 0, -6.247528, 0, -0.5, 0.5, 0.5,
-3.887526, 0, -6.247528, 1, -0.5, 0.5, 0.5,
-3.887526, 0, -6.247528, 1, 1.5, 0.5, 0.5,
-3.887526, 0, -6.247528, 0, 1.5, 0.5, 0.5,
-3.887526, 1, -6.247528, 0, -0.5, 0.5, 0.5,
-3.887526, 1, -6.247528, 1, -0.5, 0.5, 0.5,
-3.887526, 1, -6.247528, 1, 1.5, 0.5, 0.5,
-3.887526, 1, -6.247528, 0, 1.5, 0.5, 0.5,
-3.887526, 2, -6.247528, 0, -0.5, 0.5, 0.5,
-3.887526, 2, -6.247528, 1, -0.5, 0.5, 0.5,
-3.887526, 2, -6.247528, 1, 1.5, 0.5, 0.5,
-3.887526, 2, -6.247528, 0, 1.5, 0.5, 0.5,
-3.887526, 3, -6.247528, 0, -0.5, 0.5, 0.5,
-3.887526, 3, -6.247528, 1, -0.5, 0.5, 0.5,
-3.887526, 3, -6.247528, 1, 1.5, 0.5, 0.5,
-3.887526, 3, -6.247528, 0, 1.5, 0.5, 0.5
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
-3.370331, -3.128561, -4,
-3.370331, -3.128561, 4,
-3.370331, -3.128561, -4,
-3.542729, -3.290015, -4,
-3.370331, -3.128561, -2,
-3.542729, -3.290015, -2,
-3.370331, -3.128561, 0,
-3.542729, -3.290015, 0,
-3.370331, -3.128561, 2,
-3.542729, -3.290015, 2,
-3.370331, -3.128561, 4,
-3.542729, -3.290015, 4
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
-3.887526, -3.612924, -4, 0, -0.5, 0.5, 0.5,
-3.887526, -3.612924, -4, 1, -0.5, 0.5, 0.5,
-3.887526, -3.612924, -4, 1, 1.5, 0.5, 0.5,
-3.887526, -3.612924, -4, 0, 1.5, 0.5, 0.5,
-3.887526, -3.612924, -2, 0, -0.5, 0.5, 0.5,
-3.887526, -3.612924, -2, 1, -0.5, 0.5, 0.5,
-3.887526, -3.612924, -2, 1, 1.5, 0.5, 0.5,
-3.887526, -3.612924, -2, 0, 1.5, 0.5, 0.5,
-3.887526, -3.612924, 0, 0, -0.5, 0.5, 0.5,
-3.887526, -3.612924, 0, 1, -0.5, 0.5, 0.5,
-3.887526, -3.612924, 0, 1, 1.5, 0.5, 0.5,
-3.887526, -3.612924, 0, 0, 1.5, 0.5, 0.5,
-3.887526, -3.612924, 2, 0, -0.5, 0.5, 0.5,
-3.887526, -3.612924, 2, 1, -0.5, 0.5, 0.5,
-3.887526, -3.612924, 2, 1, 1.5, 0.5, 0.5,
-3.887526, -3.612924, 2, 0, 1.5, 0.5, 0.5,
-3.887526, -3.612924, 4, 0, -0.5, 0.5, 0.5,
-3.887526, -3.612924, 4, 1, -0.5, 0.5, 0.5,
-3.887526, -3.612924, 4, 1, 1.5, 0.5, 0.5,
-3.887526, -3.612924, 4, 0, 1.5, 0.5, 0.5
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
-3.370331, -3.128561, -5.437731,
-3.370331, 3.329606, -5.437731,
-3.370331, -3.128561, 5.359554,
-3.370331, 3.329606, 5.359554,
-3.370331, -3.128561, -5.437731,
-3.370331, -3.128561, 5.359554,
-3.370331, 3.329606, -5.437731,
-3.370331, 3.329606, 5.359554,
-3.370331, -3.128561, -5.437731,
3.525599, -3.128561, -5.437731,
-3.370331, -3.128561, 5.359554,
3.525599, -3.128561, 5.359554,
-3.370331, 3.329606, -5.437731,
3.525599, 3.329606, -5.437731,
-3.370331, 3.329606, 5.359554,
3.525599, 3.329606, 5.359554,
3.525599, -3.128561, -5.437731,
3.525599, 3.329606, -5.437731,
3.525599, -3.128561, 5.359554,
3.525599, 3.329606, 5.359554,
3.525599, -3.128561, -5.437731,
3.525599, -3.128561, 5.359554,
3.525599, 3.329606, -5.437731,
3.525599, 3.329606, 5.359554
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
var radius = 7.661145;
var distance = 34.0853;
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
mvMatrix.translate( -0.07763422, -0.1005225, 0.03908873 );
mvMatrix.scale( 1.201198, 1.282621, 0.7671725 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.0853);
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


