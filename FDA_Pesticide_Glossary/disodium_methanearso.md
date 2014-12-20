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
-3.427083, 0.354831, -1.273114, 1, 0, 0, 1,
-3.411401, 0.02866251, -1.606383, 1, 0.007843138, 0, 1,
-3.171208, -0.4923895, -3.778463, 1, 0.01176471, 0, 1,
-3.074916, -0.6973294, -0.3603928, 1, 0.01960784, 0, 1,
-2.718206, 0.5763845, -1.332847, 1, 0.02352941, 0, 1,
-2.695875, -1.980314, -1.959844, 1, 0.03137255, 0, 1,
-2.471361, -0.665727, -2.117361, 1, 0.03529412, 0, 1,
-2.408256, 0.3069313, -1.095744, 1, 0.04313726, 0, 1,
-2.394231, 1.828175, -2.694419, 1, 0.04705882, 0, 1,
-2.37767, -0.5822144, -0.149474, 1, 0.05490196, 0, 1,
-2.334863, -1.176276, -2.658957, 1, 0.05882353, 0, 1,
-2.33398, -0.5696769, 0.7570916, 1, 0.06666667, 0, 1,
-2.325213, -1.079627, -1.19215, 1, 0.07058824, 0, 1,
-2.292454, -0.3921209, -1.950265, 1, 0.07843138, 0, 1,
-2.241513, 1.500963, -1.38956, 1, 0.08235294, 0, 1,
-2.233217, -0.06173125, -2.019919, 1, 0.09019608, 0, 1,
-2.158078, -0.7136862, -0.1233565, 1, 0.09411765, 0, 1,
-2.131279, -0.8083495, -2.195898, 1, 0.1019608, 0, 1,
-2.129768, -2.276867, -2.713278, 1, 0.1098039, 0, 1,
-2.127607, -1.213447, -0.7419019, 1, 0.1137255, 0, 1,
-2.118401, 0.8669394, 0.5150833, 1, 0.1215686, 0, 1,
-2.118302, -1.776495, -1.222523, 1, 0.1254902, 0, 1,
-2.084929, 0.8436258, -0.4855871, 1, 0.1333333, 0, 1,
-2.016537, 1.02601, -1.524515, 1, 0.1372549, 0, 1,
-2.014719, -0.1987339, -2.718506, 1, 0.145098, 0, 1,
-2.0092, 0.1511067, 0.05645283, 1, 0.1490196, 0, 1,
-1.996264, -0.3553163, -2.327638, 1, 0.1568628, 0, 1,
-1.97718, -1.520597, -3.777736, 1, 0.1607843, 0, 1,
-1.961948, -0.8618237, -2.197295, 1, 0.1686275, 0, 1,
-1.959181, -1.045084, -2.950687, 1, 0.172549, 0, 1,
-1.958803, -0.2065587, -1.597167, 1, 0.1803922, 0, 1,
-1.955352, -0.6533178, -4.363899, 1, 0.1843137, 0, 1,
-1.905143, 1.011561, -3.050961, 1, 0.1921569, 0, 1,
-1.89623, -0.7056196, -0.8735852, 1, 0.1960784, 0, 1,
-1.890467, -1.15113, -1.727027, 1, 0.2039216, 0, 1,
-1.861732, 0.4316293, -2.280085, 1, 0.2117647, 0, 1,
-1.841045, -0.07795297, -1.641922, 1, 0.2156863, 0, 1,
-1.831827, 0.9270411, -2.417493, 1, 0.2235294, 0, 1,
-1.830599, 0.03946513, -3.168328, 1, 0.227451, 0, 1,
-1.827832, 0.2848183, -2.28021, 1, 0.2352941, 0, 1,
-1.821526, 1.13214, 0.2883242, 1, 0.2392157, 0, 1,
-1.795444, 1.538468, -1.298293, 1, 0.2470588, 0, 1,
-1.79304, 0.09745677, -0.5929401, 1, 0.2509804, 0, 1,
-1.767591, 0.07820682, 0.07931828, 1, 0.2588235, 0, 1,
-1.752593, 1.689296, 0.1558913, 1, 0.2627451, 0, 1,
-1.725985, 1.281264, -1.664098, 1, 0.2705882, 0, 1,
-1.720772, 0.65461, -2.363922, 1, 0.2745098, 0, 1,
-1.703936, -2.222591, -2.305324, 1, 0.282353, 0, 1,
-1.678328, -0.4719179, 0.1321228, 1, 0.2862745, 0, 1,
-1.662984, 0.764364, -0.6107374, 1, 0.2941177, 0, 1,
-1.646363, 0.3989184, -2.298846, 1, 0.3019608, 0, 1,
-1.646129, 0.4872634, -2.469945, 1, 0.3058824, 0, 1,
-1.64056, 1.707956, -1.772388, 1, 0.3137255, 0, 1,
-1.636515, -0.6924652, -1.261352, 1, 0.3176471, 0, 1,
-1.632739, -1.615824, -1.756474, 1, 0.3254902, 0, 1,
-1.631695, 0.2253336, 0.37951, 1, 0.3294118, 0, 1,
-1.619395, 0.3669493, 0.9533087, 1, 0.3372549, 0, 1,
-1.609204, 1.550607, 0.2340253, 1, 0.3411765, 0, 1,
-1.604805, -0.2549159, -2.118287, 1, 0.3490196, 0, 1,
-1.583162, 0.7939217, -0.3696286, 1, 0.3529412, 0, 1,
-1.560023, -2.432827, -1.354819, 1, 0.3607843, 0, 1,
-1.552922, 3.22827, -0.4098342, 1, 0.3647059, 0, 1,
-1.55251, 1.151782, -1.883512, 1, 0.372549, 0, 1,
-1.548384, -0.5721312, -0.6245348, 1, 0.3764706, 0, 1,
-1.54598, -0.2359869, 1.282327, 1, 0.3843137, 0, 1,
-1.542413, 0.603758, -0.9404461, 1, 0.3882353, 0, 1,
-1.527039, -0.6275818, -2.717233, 1, 0.3960784, 0, 1,
-1.50032, -0.6171173, -2.32579, 1, 0.4039216, 0, 1,
-1.487297, 0.8703657, 0.8699242, 1, 0.4078431, 0, 1,
-1.480895, 0.0711333, 0.06973706, 1, 0.4156863, 0, 1,
-1.466076, -0.8605339, -2.441918, 1, 0.4196078, 0, 1,
-1.4596, 0.5460994, -0.1675687, 1, 0.427451, 0, 1,
-1.459136, 0.46616, -1.596793, 1, 0.4313726, 0, 1,
-1.447199, 0.4908014, -0.7759194, 1, 0.4392157, 0, 1,
-1.435964, 0.02960791, -0.9976196, 1, 0.4431373, 0, 1,
-1.435167, -0.4731139, -1.894204, 1, 0.4509804, 0, 1,
-1.434009, 1.185824, -0.4431247, 1, 0.454902, 0, 1,
-1.427634, -1.081888, -1.54307, 1, 0.4627451, 0, 1,
-1.415931, 0.01839135, -1.650492, 1, 0.4666667, 0, 1,
-1.400964, 1.956702, 1.669264, 1, 0.4745098, 0, 1,
-1.39661, 1.617013, -1.297309, 1, 0.4784314, 0, 1,
-1.385757, -0.4800505, -3.078349, 1, 0.4862745, 0, 1,
-1.376335, -1.081898, -1.797251, 1, 0.4901961, 0, 1,
-1.36898, 0.8058195, -1.162872, 1, 0.4980392, 0, 1,
-1.364213, 1.068353, 0.2366496, 1, 0.5058824, 0, 1,
-1.346203, 0.5199504, -1.08371, 1, 0.509804, 0, 1,
-1.342221, -1.067793, -1.502391, 1, 0.5176471, 0, 1,
-1.335579, -2.069248, -2.668726, 1, 0.5215687, 0, 1,
-1.335128, -1.148127, 0.2843371, 1, 0.5294118, 0, 1,
-1.32952, -0.8978329, -1.081326, 1, 0.5333334, 0, 1,
-1.325448, -0.2105115, -3.122015, 1, 0.5411765, 0, 1,
-1.325354, -1.236729, -3.575455, 1, 0.5450981, 0, 1,
-1.322218, -0.1936525, -3.567741, 1, 0.5529412, 0, 1,
-1.317872, -0.6738938, -0.1188106, 1, 0.5568628, 0, 1,
-1.309269, 0.4073602, 0.9826307, 1, 0.5647059, 0, 1,
-1.308031, 0.7673005, -0.7717488, 1, 0.5686275, 0, 1,
-1.300355, -0.2157528, -1.771822, 1, 0.5764706, 0, 1,
-1.286612, 0.482831, -0.6045672, 1, 0.5803922, 0, 1,
-1.281468, -1.504214, -2.607396, 1, 0.5882353, 0, 1,
-1.279099, -1.45612, -2.037211, 1, 0.5921569, 0, 1,
-1.275543, 0.383581, -1.231091, 1, 0.6, 0, 1,
-1.264637, -0.2824183, -2.188286, 1, 0.6078432, 0, 1,
-1.264606, 0.2957314, -1.040323, 1, 0.6117647, 0, 1,
-1.254325, 0.09496015, 0.05683769, 1, 0.6196079, 0, 1,
-1.251711, 0.8415704, -0.671178, 1, 0.6235294, 0, 1,
-1.251614, -0.2538218, -1.77872, 1, 0.6313726, 0, 1,
-1.247849, 1.08838, -2.288471, 1, 0.6352941, 0, 1,
-1.244068, 2.141124, -0.1798592, 1, 0.6431373, 0, 1,
-1.219332, 0.5903428, -1.782539, 1, 0.6470588, 0, 1,
-1.218909, -1.80209, -1.603004, 1, 0.654902, 0, 1,
-1.217572, 0.1806913, -2.287401, 1, 0.6588235, 0, 1,
-1.217559, -0.1772277, -0.4822266, 1, 0.6666667, 0, 1,
-1.216108, 0.2025856, -1.518002, 1, 0.6705883, 0, 1,
-1.215809, -0.4336783, -3.01917, 1, 0.6784314, 0, 1,
-1.215201, -0.7844853, -2.502288, 1, 0.682353, 0, 1,
-1.213789, -0.01284757, -1.783671, 1, 0.6901961, 0, 1,
-1.211836, -0.5367534, -1.101808, 1, 0.6941177, 0, 1,
-1.209448, 0.6250475, -1.075722, 1, 0.7019608, 0, 1,
-1.206674, 0.4498936, -0.6891565, 1, 0.7098039, 0, 1,
-1.197824, 0.2082963, -2.779562, 1, 0.7137255, 0, 1,
-1.194748, -0.7997261, -2.877049, 1, 0.7215686, 0, 1,
-1.189945, -0.2920462, -1.2142, 1, 0.7254902, 0, 1,
-1.183835, 0.4582462, -1.641765, 1, 0.7333333, 0, 1,
-1.170591, -0.7618427, -2.636851, 1, 0.7372549, 0, 1,
-1.168504, 1.077631, -0.01654102, 1, 0.7450981, 0, 1,
-1.165891, -0.6889198, -2.64149, 1, 0.7490196, 0, 1,
-1.164394, 0.7002001, -1.126156, 1, 0.7568628, 0, 1,
-1.163022, 1.352498, -2.404651, 1, 0.7607843, 0, 1,
-1.161254, -0.3475261, -3.818047, 1, 0.7686275, 0, 1,
-1.16002, 0.8267021, -0.4630926, 1, 0.772549, 0, 1,
-1.153695, 1.084902, -1.746119, 1, 0.7803922, 0, 1,
-1.147962, -0.9594901, -3.875706, 1, 0.7843137, 0, 1,
-1.145027, -0.8561655, -4.716118, 1, 0.7921569, 0, 1,
-1.139897, -0.3474489, -1.104268, 1, 0.7960784, 0, 1,
-1.13748, 0.9263554, -1.828683, 1, 0.8039216, 0, 1,
-1.12268, 0.8310974, -0.2625633, 1, 0.8117647, 0, 1,
-1.122133, 0.2938378, -0.820735, 1, 0.8156863, 0, 1,
-1.117057, 0.6649812, -2.546983, 1, 0.8235294, 0, 1,
-1.116277, 0.01544986, -1.303949, 1, 0.827451, 0, 1,
-1.108735, -0.1413476, -1.162859, 1, 0.8352941, 0, 1,
-1.096107, 0.5579835, -0.6388752, 1, 0.8392157, 0, 1,
-1.09207, 0.2800508, -1.178734, 1, 0.8470588, 0, 1,
-1.08404, 0.3878219, -1.391344, 1, 0.8509804, 0, 1,
-1.082718, 0.9952487, 0.2731178, 1, 0.8588235, 0, 1,
-1.078835, 0.5615913, -1.618047, 1, 0.8627451, 0, 1,
-1.069223, 2.472955, 0.751834, 1, 0.8705882, 0, 1,
-1.068398, -0.7377586, -0.8601201, 1, 0.8745098, 0, 1,
-1.064777, -1.531051, -4.48339, 1, 0.8823529, 0, 1,
-1.063232, -0.2326695, -2.549311, 1, 0.8862745, 0, 1,
-1.062894, -0.1977001, -0.5133005, 1, 0.8941177, 0, 1,
-1.06172, -0.1628204, -0.9675316, 1, 0.8980392, 0, 1,
-1.055112, -0.02273193, -0.8169061, 1, 0.9058824, 0, 1,
-1.044642, -0.5362909, -0.4004919, 1, 0.9137255, 0, 1,
-1.036267, 0.919372, 0.3764238, 1, 0.9176471, 0, 1,
-1.026857, -0.2152141, -2.216582, 1, 0.9254902, 0, 1,
-1.026539, -0.07235222, 1.179457, 1, 0.9294118, 0, 1,
-1.024656, 0.03116465, -1.309108, 1, 0.9372549, 0, 1,
-1.024238, -0.8369758, -1.765231, 1, 0.9411765, 0, 1,
-1.017296, 0.1619565, -1.791795, 1, 0.9490196, 0, 1,
-1.011865, -1.859247, -2.254091, 1, 0.9529412, 0, 1,
-1.007226, -0.6040155, -1.558244, 1, 0.9607843, 0, 1,
-0.9959564, -0.2678989, -2.015612, 1, 0.9647059, 0, 1,
-0.9910642, -1.185496, -4.421221, 1, 0.972549, 0, 1,
-0.9905067, 1.333146, -0.9027882, 1, 0.9764706, 0, 1,
-0.9836674, -2.198061, -3.652074, 1, 0.9843137, 0, 1,
-0.9812173, -1.565158, -3.240602, 1, 0.9882353, 0, 1,
-0.9799872, -1.021264, -0.8753145, 1, 0.9960784, 0, 1,
-0.9787331, 0.9821621, -2.067271, 0.9960784, 1, 0, 1,
-0.9664105, 0.4413351, -2.263437, 0.9921569, 1, 0, 1,
-0.9605261, -1.147075, -1.070313, 0.9843137, 1, 0, 1,
-0.9599709, -0.7433162, -1.138638, 0.9803922, 1, 0, 1,
-0.9490687, 0.6952971, -0.2424989, 0.972549, 1, 0, 1,
-0.946521, -0.7212276, -2.371191, 0.9686275, 1, 0, 1,
-0.9427853, 0.3037566, -2.110758, 0.9607843, 1, 0, 1,
-0.941259, -0.03521359, -2.068373, 0.9568627, 1, 0, 1,
-0.9371411, 0.2682385, -2.014175, 0.9490196, 1, 0, 1,
-0.9365274, -0.2112972, -1.337476, 0.945098, 1, 0, 1,
-0.9345588, 0.7709841, -1.332709, 0.9372549, 1, 0, 1,
-0.9339187, 0.6480614, -1.182051, 0.9333333, 1, 0, 1,
-0.9325626, 0.4108837, 1.088295, 0.9254902, 1, 0, 1,
-0.932291, -0.9912158, -1.24828, 0.9215686, 1, 0, 1,
-0.930465, -2.031287, -2.041169, 0.9137255, 1, 0, 1,
-0.9240786, 0.5981633, -1.627182, 0.9098039, 1, 0, 1,
-0.9199758, -1.240146, -4.831915, 0.9019608, 1, 0, 1,
-0.9190035, -0.04111436, -2.646428, 0.8941177, 1, 0, 1,
-0.9171441, 0.9144977, 0.2055255, 0.8901961, 1, 0, 1,
-0.9137153, -0.9318416, -4.524464, 0.8823529, 1, 0, 1,
-0.9135299, -0.6703345, -1.765297, 0.8784314, 1, 0, 1,
-0.9105775, 0.2838208, -0.991123, 0.8705882, 1, 0, 1,
-0.9098172, 0.1875249, -4.323844, 0.8666667, 1, 0, 1,
-0.9092282, -3.496602, -4.703247, 0.8588235, 1, 0, 1,
-0.9083712, 0.7504552, 1.471644, 0.854902, 1, 0, 1,
-0.9083674, -0.0009201927, -2.848836, 0.8470588, 1, 0, 1,
-0.9067147, -2.172147, 0.01994692, 0.8431373, 1, 0, 1,
-0.9052365, -0.2639896, -1.693302, 0.8352941, 1, 0, 1,
-0.9038655, -0.2958661, -2.506568, 0.8313726, 1, 0, 1,
-0.8934066, -0.6251774, -0.8235199, 0.8235294, 1, 0, 1,
-0.8911849, 0.2689947, -1.545821, 0.8196079, 1, 0, 1,
-0.8832826, -0.009446121, -1.259518, 0.8117647, 1, 0, 1,
-0.8828712, -1.550308, -1.273817, 0.8078431, 1, 0, 1,
-0.8806515, -2.496168, -4.408661, 0.8, 1, 0, 1,
-0.8793514, 0.7669376, -1.955732, 0.7921569, 1, 0, 1,
-0.8784267, -1.192456, -2.813291, 0.7882353, 1, 0, 1,
-0.8780133, -0.4700797, -2.612776, 0.7803922, 1, 0, 1,
-0.8763075, 0.483849, -1.549983, 0.7764706, 1, 0, 1,
-0.8746129, 0.6303526, -0.382224, 0.7686275, 1, 0, 1,
-0.8734196, 1.420021, -0.8105165, 0.7647059, 1, 0, 1,
-0.8660321, -0.7946581, -2.294961, 0.7568628, 1, 0, 1,
-0.8635944, -0.7386739, -0.1825038, 0.7529412, 1, 0, 1,
-0.8624333, -0.5301368, -3.889448, 0.7450981, 1, 0, 1,
-0.8617695, -0.9198483, -3.829758, 0.7411765, 1, 0, 1,
-0.8605756, -1.060792, -1.698322, 0.7333333, 1, 0, 1,
-0.8594137, -0.167693, -1.640908, 0.7294118, 1, 0, 1,
-0.8520607, 1.108947, -1.860382, 0.7215686, 1, 0, 1,
-0.8445927, -1.688281, -2.950049, 0.7176471, 1, 0, 1,
-0.8418356, -1.350347, -2.76235, 0.7098039, 1, 0, 1,
-0.8415993, 0.5693932, -2.179492, 0.7058824, 1, 0, 1,
-0.8362449, 1.349651, 0.3317728, 0.6980392, 1, 0, 1,
-0.8359348, 0.1084491, -0.7017483, 0.6901961, 1, 0, 1,
-0.8358123, -0.8833973, -0.8297752, 0.6862745, 1, 0, 1,
-0.8356417, 1.316937, -0.5532275, 0.6784314, 1, 0, 1,
-0.834243, 0.4142711, -1.563108, 0.6745098, 1, 0, 1,
-0.8338715, -0.7831067, -0.6297647, 0.6666667, 1, 0, 1,
-0.8334689, -0.9916611, -1.356553, 0.6627451, 1, 0, 1,
-0.8286172, 1.040311, -0.5957241, 0.654902, 1, 0, 1,
-0.8265396, 1.891472, -2.4433, 0.6509804, 1, 0, 1,
-0.8255516, 1.051858, 1.212471, 0.6431373, 1, 0, 1,
-0.8227031, 1.063322, -0.3392101, 0.6392157, 1, 0, 1,
-0.8164589, -0.5193228, -1.198803, 0.6313726, 1, 0, 1,
-0.8129568, -0.4218959, -2.360816, 0.627451, 1, 0, 1,
-0.7993684, -0.6016859, -1.673577, 0.6196079, 1, 0, 1,
-0.7944627, -0.6682716, -1.981619, 0.6156863, 1, 0, 1,
-0.7903536, 0.9051346, -3.073689, 0.6078432, 1, 0, 1,
-0.7891938, 1.082967, -1.957847, 0.6039216, 1, 0, 1,
-0.7847424, -0.6410348, -3.716193, 0.5960785, 1, 0, 1,
-0.7817151, 0.243425, 0.5716954, 0.5882353, 1, 0, 1,
-0.77487, 0.5769871, -1.546037, 0.5843138, 1, 0, 1,
-0.7734773, -0.6757036, -2.396835, 0.5764706, 1, 0, 1,
-0.7731131, -0.3183928, -2.198855, 0.572549, 1, 0, 1,
-0.7649755, -0.4256355, -2.156097, 0.5647059, 1, 0, 1,
-0.7649226, -0.01035259, -2.204973, 0.5607843, 1, 0, 1,
-0.7597462, 0.5092568, 0.6654916, 0.5529412, 1, 0, 1,
-0.7574643, -0.5423831, -0.3795438, 0.5490196, 1, 0, 1,
-0.7546445, -0.03516361, -1.34152, 0.5411765, 1, 0, 1,
-0.7522995, 0.8582403, -0.3692743, 0.5372549, 1, 0, 1,
-0.7513255, 0.4780003, -1.827642, 0.5294118, 1, 0, 1,
-0.7506387, 2.206371, 0.3281855, 0.5254902, 1, 0, 1,
-0.7463463, 1.541138, -1.134229, 0.5176471, 1, 0, 1,
-0.7444251, -2.819181, -2.597646, 0.5137255, 1, 0, 1,
-0.7424778, -0.3781125, -5.066697, 0.5058824, 1, 0, 1,
-0.7421882, 1.82309, -1.075515, 0.5019608, 1, 0, 1,
-0.7414291, 0.3980775, -1.418427, 0.4941176, 1, 0, 1,
-0.7413598, -0.0713758, -0.8137709, 0.4862745, 1, 0, 1,
-0.739516, 0.8991005, -0.757073, 0.4823529, 1, 0, 1,
-0.7374121, 1.225129, -0.4062628, 0.4745098, 1, 0, 1,
-0.7247392, 0.5196525, -0.2539729, 0.4705882, 1, 0, 1,
-0.7216743, -0.7393886, -2.458672, 0.4627451, 1, 0, 1,
-0.7190042, 0.6384119, -0.4207559, 0.4588235, 1, 0, 1,
-0.715898, -0.4089364, -2.73345, 0.4509804, 1, 0, 1,
-0.7120188, -0.5171523, -1.778363, 0.4470588, 1, 0, 1,
-0.705835, 0.8382507, -0.7708037, 0.4392157, 1, 0, 1,
-0.6969767, 0.7421526, 1.035287, 0.4352941, 1, 0, 1,
-0.6953709, 0.327492, -0.9687601, 0.427451, 1, 0, 1,
-0.68835, 0.4397353, -1.511838, 0.4235294, 1, 0, 1,
-0.6869205, 1.022473, 0.1008015, 0.4156863, 1, 0, 1,
-0.6842502, -0.400371, -1.604153, 0.4117647, 1, 0, 1,
-0.6791911, -0.3334131, -2.304696, 0.4039216, 1, 0, 1,
-0.6779745, -0.3305011, -1.942352, 0.3960784, 1, 0, 1,
-0.6762758, -0.3849053, -1.98834, 0.3921569, 1, 0, 1,
-0.6738831, -0.6480539, -2.007053, 0.3843137, 1, 0, 1,
-0.6726803, 0.9251503, -0.4826878, 0.3803922, 1, 0, 1,
-0.6709974, 1.386747, 0.3572452, 0.372549, 1, 0, 1,
-0.6708546, -1.230169, -4.088149, 0.3686275, 1, 0, 1,
-0.6664695, -0.7039551, -2.787718, 0.3607843, 1, 0, 1,
-0.6664351, -0.3407817, -2.550678, 0.3568628, 1, 0, 1,
-0.6639941, 1.025872, 0.1978652, 0.3490196, 1, 0, 1,
-0.6623107, -0.1137483, -0.05331123, 0.345098, 1, 0, 1,
-0.6595873, -1.088613, -3.984518, 0.3372549, 1, 0, 1,
-0.6516774, -0.1307088, -1.575057, 0.3333333, 1, 0, 1,
-0.6477777, -1.207888, -3.509077, 0.3254902, 1, 0, 1,
-0.6462706, -0.312221, -1.881077, 0.3215686, 1, 0, 1,
-0.6444247, 1.13658, -0.1610892, 0.3137255, 1, 0, 1,
-0.643904, -0.451135, -2.873206, 0.3098039, 1, 0, 1,
-0.6420272, -0.0577004, -2.038967, 0.3019608, 1, 0, 1,
-0.6360465, -2.132507, -3.725651, 0.2941177, 1, 0, 1,
-0.6354505, -0.7118791, -2.152957, 0.2901961, 1, 0, 1,
-0.6285267, -1.471449, -3.706568, 0.282353, 1, 0, 1,
-0.6257872, 0.09082717, -1.857459, 0.2784314, 1, 0, 1,
-0.6246396, 0.4262087, -0.5264369, 0.2705882, 1, 0, 1,
-0.6218141, 0.5976095, -0.06023632, 0.2666667, 1, 0, 1,
-0.6205806, 0.1794522, -2.041206, 0.2588235, 1, 0, 1,
-0.6172426, 0.4753864, -1.0563, 0.254902, 1, 0, 1,
-0.6172033, -0.3519609, -2.59899, 0.2470588, 1, 0, 1,
-0.6167917, -0.3396436, -3.91703, 0.2431373, 1, 0, 1,
-0.6166652, 0.006958297, -1.628158, 0.2352941, 1, 0, 1,
-0.6159741, -1.119096, -2.597312, 0.2313726, 1, 0, 1,
-0.6107398, -0.06937403, -1.533132, 0.2235294, 1, 0, 1,
-0.6087539, -0.3777837, -1.116079, 0.2196078, 1, 0, 1,
-0.6068932, -0.5281077, -1.390346, 0.2117647, 1, 0, 1,
-0.6002349, -0.5607858, -2.221693, 0.2078431, 1, 0, 1,
-0.5948803, -0.06525549, -2.022326, 0.2, 1, 0, 1,
-0.5944557, 1.082832, 0.7673874, 0.1921569, 1, 0, 1,
-0.5910138, 1.236922, -2.091262, 0.1882353, 1, 0, 1,
-0.5905645, -0.7376063, -2.582195, 0.1803922, 1, 0, 1,
-0.5835745, -0.626246, -3.269694, 0.1764706, 1, 0, 1,
-0.5799896, 1.915904, -0.3786564, 0.1686275, 1, 0, 1,
-0.579317, 2.254103, -1.205125, 0.1647059, 1, 0, 1,
-0.5661115, 1.469873, -0.3995793, 0.1568628, 1, 0, 1,
-0.5550105, -1.156859, -1.401228, 0.1529412, 1, 0, 1,
-0.5529324, -0.4525078, -3.017219, 0.145098, 1, 0, 1,
-0.5426562, 0.283773, -1.595097, 0.1411765, 1, 0, 1,
-0.5391988, 0.9022977, 0.09232787, 0.1333333, 1, 0, 1,
-0.5382265, -0.653605, -2.6629, 0.1294118, 1, 0, 1,
-0.5374006, 0.5762795, 0.1994556, 0.1215686, 1, 0, 1,
-0.5334405, -0.837616, -1.392696, 0.1176471, 1, 0, 1,
-0.5329915, 0.433652, 0.4888036, 0.1098039, 1, 0, 1,
-0.5324538, -1.750519, -3.647573, 0.1058824, 1, 0, 1,
-0.5280114, 1.385697, -1.78786, 0.09803922, 1, 0, 1,
-0.5266425, -0.01317566, 0.1550554, 0.09019608, 1, 0, 1,
-0.5245924, 1.597528, 0.04139274, 0.08627451, 1, 0, 1,
-0.5231012, 0.9249643, -1.12302, 0.07843138, 1, 0, 1,
-0.5192646, -1.661166, -3.324207, 0.07450981, 1, 0, 1,
-0.5190002, 1.503874, -0.6740574, 0.06666667, 1, 0, 1,
-0.5178884, 0.1621827, -0.9844822, 0.0627451, 1, 0, 1,
-0.5153775, 2.242786, -0.5079582, 0.05490196, 1, 0, 1,
-0.5150111, 2.050201, 0.7627628, 0.05098039, 1, 0, 1,
-0.5109408, 2.054994, -0.3192544, 0.04313726, 1, 0, 1,
-0.5082811, -0.2390335, -1.094117, 0.03921569, 1, 0, 1,
-0.5064836, -0.765142, -2.609326, 0.03137255, 1, 0, 1,
-0.502448, -1.008294, -1.16091, 0.02745098, 1, 0, 1,
-0.5021517, 0.06854406, -1.113656, 0.01960784, 1, 0, 1,
-0.5019805, 0.5897178, -0.6600518, 0.01568628, 1, 0, 1,
-0.5016062, -0.4276226, -2.893314, 0.007843138, 1, 0, 1,
-0.4998665, 1.037419, 0.8904401, 0.003921569, 1, 0, 1,
-0.4997479, -0.6015301, -2.04955, 0, 1, 0.003921569, 1,
-0.4986368, 0.6380369, 0.5291069, 0, 1, 0.01176471, 1,
-0.4966222, 0.5133635, 0.3267171, 0, 1, 0.01568628, 1,
-0.4958923, -0.3536232, -2.912722, 0, 1, 0.02352941, 1,
-0.4919261, 0.8139507, -0.09517487, 0, 1, 0.02745098, 1,
-0.4903673, 0.4380407, 1.203658, 0, 1, 0.03529412, 1,
-0.4864114, 0.384447, -1.6635, 0, 1, 0.03921569, 1,
-0.4812698, -0.04332691, -2.635739, 0, 1, 0.04705882, 1,
-0.4804948, 1.647871, 0.3415052, 0, 1, 0.05098039, 1,
-0.4750444, -0.6612504, -0.6100386, 0, 1, 0.05882353, 1,
-0.4731662, -0.8612898, -0.8420461, 0, 1, 0.0627451, 1,
-0.468679, -0.3120224, -0.2209392, 0, 1, 0.07058824, 1,
-0.4653195, -1.482257, -1.791564, 0, 1, 0.07450981, 1,
-0.4639458, -0.1500378, -3.304541, 0, 1, 0.08235294, 1,
-0.4570624, 0.878879, 0.6109417, 0, 1, 0.08627451, 1,
-0.4560022, 1.348507, 0.7349654, 0, 1, 0.09411765, 1,
-0.455044, 0.5151298, -0.1464032, 0, 1, 0.1019608, 1,
-0.4524254, -2.48753, -3.348986, 0, 1, 0.1058824, 1,
-0.4523801, -0.7533895, -2.969846, 0, 1, 0.1137255, 1,
-0.4517879, -0.729244, -2.684286, 0, 1, 0.1176471, 1,
-0.4505021, 0.5530655, 0.6179052, 0, 1, 0.1254902, 1,
-0.4496376, -0.5780133, -2.853049, 0, 1, 0.1294118, 1,
-0.4432162, -1.529608, -4.76399, 0, 1, 0.1372549, 1,
-0.4332431, -0.107685, -0.6789719, 0, 1, 0.1411765, 1,
-0.4271235, -0.09379175, -1.126256, 0, 1, 0.1490196, 1,
-0.4241289, 0.2537895, -1.943467, 0, 1, 0.1529412, 1,
-0.4166729, -1.271352, -4.911092, 0, 1, 0.1607843, 1,
-0.4044276, 1.259092, -2.0097, 0, 1, 0.1647059, 1,
-0.4036282, -1.754536, -3.633368, 0, 1, 0.172549, 1,
-0.4002088, -0.1155012, -1.04459, 0, 1, 0.1764706, 1,
-0.393126, -0.6574992, -1.435611, 0, 1, 0.1843137, 1,
-0.3912929, -0.6618215, -4.908368, 0, 1, 0.1882353, 1,
-0.3864435, 0.5875009, -1.364962, 0, 1, 0.1960784, 1,
-0.3859842, -0.9336919, -1.533139, 0, 1, 0.2039216, 1,
-0.3848832, -0.8081263, -0.76796, 0, 1, 0.2078431, 1,
-0.3828929, 0.6994742, -0.0396556, 0, 1, 0.2156863, 1,
-0.3726175, -0.5057164, -3.610638, 0, 1, 0.2196078, 1,
-0.3724504, 1.021042, -0.4965602, 0, 1, 0.227451, 1,
-0.3677729, 1.261855, 0.6126899, 0, 1, 0.2313726, 1,
-0.365872, -0.03596748, -2.810826, 0, 1, 0.2392157, 1,
-0.3655829, 0.5067648, -0.1377458, 0, 1, 0.2431373, 1,
-0.3621144, 0.3086297, -1.702984, 0, 1, 0.2509804, 1,
-0.3611533, 0.1306885, 0.6866028, 0, 1, 0.254902, 1,
-0.3575168, 0.2584582, -3.329983, 0, 1, 0.2627451, 1,
-0.3544141, 0.536992, -1.174683, 0, 1, 0.2666667, 1,
-0.3536775, -1.08413, -2.797178, 0, 1, 0.2745098, 1,
-0.3493369, -0.4842022, -2.392533, 0, 1, 0.2784314, 1,
-0.3490517, -1.267558, -3.491222, 0, 1, 0.2862745, 1,
-0.3471277, -1.056062, -1.816646, 0, 1, 0.2901961, 1,
-0.3457999, -0.5367332, -2.785804, 0, 1, 0.2980392, 1,
-0.344733, 0.1542893, -0.6774726, 0, 1, 0.3058824, 1,
-0.3444178, -0.1487285, -1.837209, 0, 1, 0.3098039, 1,
-0.3405641, 0.2846133, 0.3789802, 0, 1, 0.3176471, 1,
-0.3392747, -1.351788, -3.047747, 0, 1, 0.3215686, 1,
-0.3383128, 2.26412, -1.001876, 0, 1, 0.3294118, 1,
-0.3352439, 0.006152323, -1.391209, 0, 1, 0.3333333, 1,
-0.3351933, 0.247789, -2.66549, 0, 1, 0.3411765, 1,
-0.3336342, 0.1625699, -1.345234, 0, 1, 0.345098, 1,
-0.3282405, -0.9483021, -1.634863, 0, 1, 0.3529412, 1,
-0.3250345, 0.5481977, -1.996109, 0, 1, 0.3568628, 1,
-0.323852, 1.208027, -0.8992247, 0, 1, 0.3647059, 1,
-0.3227298, 1.929376, -0.2147169, 0, 1, 0.3686275, 1,
-0.3211217, -1.545688, -5.070582, 0, 1, 0.3764706, 1,
-0.3197454, -1.239635, -3.076086, 0, 1, 0.3803922, 1,
-0.3196106, 1.046142, -1.092681, 0, 1, 0.3882353, 1,
-0.3184346, 0.1731752, -1.11767, 0, 1, 0.3921569, 1,
-0.3119419, -0.1551768, -2.929332, 0, 1, 0.4, 1,
-0.3096462, -1.658596, -2.480637, 0, 1, 0.4078431, 1,
-0.3077981, 0.06627812, -0.2071063, 0, 1, 0.4117647, 1,
-0.3064427, -0.05933267, -0.536142, 0, 1, 0.4196078, 1,
-0.3000519, 1.067222, 0.1898008, 0, 1, 0.4235294, 1,
-0.2999279, -1.051668, -1.267374, 0, 1, 0.4313726, 1,
-0.2992401, -1.374326, -4.423184, 0, 1, 0.4352941, 1,
-0.2973087, 1.378456, -0.2452662, 0, 1, 0.4431373, 1,
-0.2910018, 0.2398734, -0.09516903, 0, 1, 0.4470588, 1,
-0.2882548, 0.857837, -3.877869, 0, 1, 0.454902, 1,
-0.2881781, -0.8511139, -3.544611, 0, 1, 0.4588235, 1,
-0.2867818, 1.717808, 0.4917993, 0, 1, 0.4666667, 1,
-0.2850447, -0.5962865, -4.008558, 0, 1, 0.4705882, 1,
-0.2834083, -1.384722, -2.825227, 0, 1, 0.4784314, 1,
-0.2709966, 0.07933425, -1.013536, 0, 1, 0.4823529, 1,
-0.2693282, 2.106925, 0.7270136, 0, 1, 0.4901961, 1,
-0.2650905, 0.4560778, -1.124592, 0, 1, 0.4941176, 1,
-0.2644236, 0.203475, -2.10782, 0, 1, 0.5019608, 1,
-0.2536684, 0.1575073, -0.6001748, 0, 1, 0.509804, 1,
-0.2526134, 0.920472, -0.0185636, 0, 1, 0.5137255, 1,
-0.2510566, 0.2666244, -1.533154, 0, 1, 0.5215687, 1,
-0.2440742, 0.1763488, -1.35766, 0, 1, 0.5254902, 1,
-0.2396062, 0.2814592, -0.899557, 0, 1, 0.5333334, 1,
-0.2353756, 0.3262783, -1.579463, 0, 1, 0.5372549, 1,
-0.2346063, -1.647601, -2.871824, 0, 1, 0.5450981, 1,
-0.2333897, -0.3591272, -2.163177, 0, 1, 0.5490196, 1,
-0.232957, -1.721577, -3.204308, 0, 1, 0.5568628, 1,
-0.2303608, 1.202393, 0.05189776, 0, 1, 0.5607843, 1,
-0.2291724, -0.1139148, -3.468715, 0, 1, 0.5686275, 1,
-0.2263028, -0.6718789, -3.303134, 0, 1, 0.572549, 1,
-0.2252208, 1.269177, 0.3125111, 0, 1, 0.5803922, 1,
-0.2237158, 1.339195, 0.1274158, 0, 1, 0.5843138, 1,
-0.2208305, 1.302786, -1.419372, 0, 1, 0.5921569, 1,
-0.2187592, -0.5054857, -1.701265, 0, 1, 0.5960785, 1,
-0.214212, -0.3427702, -2.053884, 0, 1, 0.6039216, 1,
-0.2090835, -1.884958, -5.145461, 0, 1, 0.6117647, 1,
-0.206512, 0.7051951, 0.3530453, 0, 1, 0.6156863, 1,
-0.2064477, -0.3016039, -4.176324, 0, 1, 0.6235294, 1,
-0.1999811, -0.896278, -2.597282, 0, 1, 0.627451, 1,
-0.199163, -0.9467552, -2.547982, 0, 1, 0.6352941, 1,
-0.1974982, 0.397601, -0.7644807, 0, 1, 0.6392157, 1,
-0.1947101, 0.6063016, -0.02192189, 0, 1, 0.6470588, 1,
-0.1946933, -1.136355, -2.361228, 0, 1, 0.6509804, 1,
-0.1942914, -0.04643236, -3.406648, 0, 1, 0.6588235, 1,
-0.1935072, -0.7138057, -2.595567, 0, 1, 0.6627451, 1,
-0.1911021, 0.5116064, -0.7306289, 0, 1, 0.6705883, 1,
-0.1892285, 0.1354575, 0.3400653, 0, 1, 0.6745098, 1,
-0.1779447, 1.319251, 0.3139344, 0, 1, 0.682353, 1,
-0.1768497, -0.06002032, -2.157815, 0, 1, 0.6862745, 1,
-0.1754661, -0.1683136, -1.119211, 0, 1, 0.6941177, 1,
-0.1739146, 0.1831321, 1.132888, 0, 1, 0.7019608, 1,
-0.1673581, -1.712041, -3.222888, 0, 1, 0.7058824, 1,
-0.1658389, -2.541068, -3.267644, 0, 1, 0.7137255, 1,
-0.1635373, 0.8414895, -1.186642, 0, 1, 0.7176471, 1,
-0.155346, -0.5317631, -4.048896, 0, 1, 0.7254902, 1,
-0.1515425, 1.819178, -0.07384427, 0, 1, 0.7294118, 1,
-0.1511346, 0.1941967, -0.6450782, 0, 1, 0.7372549, 1,
-0.1489944, 0.2041444, -0.445847, 0, 1, 0.7411765, 1,
-0.1488333, 1.382114, 0.7978293, 0, 1, 0.7490196, 1,
-0.146661, 1.168378, -1.141515, 0, 1, 0.7529412, 1,
-0.144535, -0.05166842, -2.121335, 0, 1, 0.7607843, 1,
-0.1435889, 0.20037, -1.097628, 0, 1, 0.7647059, 1,
-0.1432956, 0.08482497, -0.9712339, 0, 1, 0.772549, 1,
-0.1432849, -0.8934987, -2.508955, 0, 1, 0.7764706, 1,
-0.1384992, -0.9476783, -5.777715, 0, 1, 0.7843137, 1,
-0.1358981, 0.6928212, -0.02366252, 0, 1, 0.7882353, 1,
-0.1354134, 0.745364, 1.470723, 0, 1, 0.7960784, 1,
-0.1349465, 0.3296357, 0.7643734, 0, 1, 0.8039216, 1,
-0.1346057, -1.204837, -2.692119, 0, 1, 0.8078431, 1,
-0.1344499, -0.1607584, -2.096641, 0, 1, 0.8156863, 1,
-0.131777, -1.107764, -1.152352, 0, 1, 0.8196079, 1,
-0.1277442, -1.547926, -1.212311, 0, 1, 0.827451, 1,
-0.1245205, 0.6073621, -0.04847089, 0, 1, 0.8313726, 1,
-0.1200576, -0.8766553, -1.264746, 0, 1, 0.8392157, 1,
-0.1125642, 0.6202747, 0.9668736, 0, 1, 0.8431373, 1,
-0.1118229, 0.8243263, 0.5900999, 0, 1, 0.8509804, 1,
-0.108302, -1.049124, -2.289067, 0, 1, 0.854902, 1,
-0.09827411, 0.1252504, 0.6729017, 0, 1, 0.8627451, 1,
-0.09569048, -0.5129752, -2.438977, 0, 1, 0.8666667, 1,
-0.09552719, -0.4248291, -2.366179, 0, 1, 0.8745098, 1,
-0.09441808, -1.154053, -4.512398, 0, 1, 0.8784314, 1,
-0.08577775, 1.510158, 0.6972066, 0, 1, 0.8862745, 1,
-0.08383761, 0.9309571, -0.09541729, 0, 1, 0.8901961, 1,
-0.08032557, 2.100122, -0.6048683, 0, 1, 0.8980392, 1,
-0.07671975, 0.9429821, 1.396237, 0, 1, 0.9058824, 1,
-0.07664243, -1.104623, -2.439221, 0, 1, 0.9098039, 1,
-0.07646543, 0.9416509, 0.6431978, 0, 1, 0.9176471, 1,
-0.07573907, 1.215409, -1.13057, 0, 1, 0.9215686, 1,
-0.07545745, 0.4262584, 0.1762873, 0, 1, 0.9294118, 1,
-0.07464975, 0.3606696, 0.02706061, 0, 1, 0.9333333, 1,
-0.06892026, 0.5451139, 0.4369377, 0, 1, 0.9411765, 1,
-0.06711648, 1.64851, -0.798827, 0, 1, 0.945098, 1,
-0.0635346, 0.4278786, 0.6496632, 0, 1, 0.9529412, 1,
-0.06083779, -0.510556, -3.871894, 0, 1, 0.9568627, 1,
-0.05808835, -0.3420496, -3.703409, 0, 1, 0.9647059, 1,
-0.05481225, 0.3140172, -0.2338902, 0, 1, 0.9686275, 1,
-0.04554251, 1.028879, -1.885481, 0, 1, 0.9764706, 1,
-0.03832481, -1.898107, -1.694536, 0, 1, 0.9803922, 1,
-0.03723383, -0.7490049, -3.266002, 0, 1, 0.9882353, 1,
-0.03484833, 0.0586438, -0.5943651, 0, 1, 0.9921569, 1,
-0.0334069, 0.5362378, -0.7263741, 0, 1, 1, 1,
-0.03275482, -0.125739, -1.595972, 0, 0.9921569, 1, 1,
-0.03087247, 0.5502487, -0.008273765, 0, 0.9882353, 1, 1,
-0.03050373, 2.202863, 1.156401, 0, 0.9803922, 1, 1,
-0.02154136, -0.3206748, -5.717703, 0, 0.9764706, 1, 1,
-0.01780513, 1.117211, -0.3499244, 0, 0.9686275, 1, 1,
-0.01512555, -0.6925018, -3.763566, 0, 0.9647059, 1, 1,
-0.0143439, 2.343376, -1.339361, 0, 0.9568627, 1, 1,
-0.009802538, -1.464007, -2.843835, 0, 0.9529412, 1, 1,
-0.006083199, -0.07278807, -4.762309, 0, 0.945098, 1, 1,
0.001640772, 0.2941965, 0.6017447, 0, 0.9411765, 1, 1,
0.002152801, -0.6047319, 4.218821, 0, 0.9333333, 1, 1,
0.005827182, -0.7360286, 3.543756, 0, 0.9294118, 1, 1,
0.007076512, -0.09944105, 3.577963, 0, 0.9215686, 1, 1,
0.008508702, -0.6866196, 2.449301, 0, 0.9176471, 1, 1,
0.009113351, -0.7653088, 4.137146, 0, 0.9098039, 1, 1,
0.009223087, 0.8860191, -0.7734904, 0, 0.9058824, 1, 1,
0.01225566, 0.5095527, 1.208204, 0, 0.8980392, 1, 1,
0.01611872, -0.4579397, 3.303108, 0, 0.8901961, 1, 1,
0.01743807, 0.7034817, -0.4371703, 0, 0.8862745, 1, 1,
0.01980136, -1.229627, 1.998189, 0, 0.8784314, 1, 1,
0.01988264, 0.5626505, -0.06997203, 0, 0.8745098, 1, 1,
0.02373517, -1.010863, 4.990984, 0, 0.8666667, 1, 1,
0.02475632, -1.114819, 4.149658, 0, 0.8627451, 1, 1,
0.02742323, 1.307033, -1.06915, 0, 0.854902, 1, 1,
0.03366532, 0.3578362, -0.2251835, 0, 0.8509804, 1, 1,
0.03511497, 0.4048756, 0.3102013, 0, 0.8431373, 1, 1,
0.03765306, 1.555252, 0.789514, 0, 0.8392157, 1, 1,
0.04357267, 1.116622, 0.2063075, 0, 0.8313726, 1, 1,
0.04644446, 0.02900761, 1.647128, 0, 0.827451, 1, 1,
0.04711143, 0.09212141, 0.7728645, 0, 0.8196079, 1, 1,
0.04825604, -0.4570368, 2.613148, 0, 0.8156863, 1, 1,
0.04940703, -0.2582075, 3.36826, 0, 0.8078431, 1, 1,
0.05777778, 0.3266255, 1.015615, 0, 0.8039216, 1, 1,
0.06051179, 0.05752444, 2.319367, 0, 0.7960784, 1, 1,
0.06909952, -0.9897633, 2.496928, 0, 0.7882353, 1, 1,
0.07099345, 1.713776, -1.81429, 0, 0.7843137, 1, 1,
0.07663097, 2.18402, 2.779158, 0, 0.7764706, 1, 1,
0.07741217, 0.1968266, -0.4365398, 0, 0.772549, 1, 1,
0.07786364, -0.2269305, 3.10127, 0, 0.7647059, 1, 1,
0.07955238, 0.8623295, 0.7295728, 0, 0.7607843, 1, 1,
0.08140541, 0.4091045, -0.9844626, 0, 0.7529412, 1, 1,
0.08856326, 0.885217, 0.2704212, 0, 0.7490196, 1, 1,
0.09498235, 0.8191142, 1.022139, 0, 0.7411765, 1, 1,
0.1039915, 1.708031, -1.080642, 0, 0.7372549, 1, 1,
0.1093351, 0.291107, -1.054376, 0, 0.7294118, 1, 1,
0.1123871, -0.06042994, 2.229013, 0, 0.7254902, 1, 1,
0.1179981, -0.2921998, 3.732326, 0, 0.7176471, 1, 1,
0.1214201, 0.8912619, 0.557744, 0, 0.7137255, 1, 1,
0.127539, 1.204829, 0.07418175, 0, 0.7058824, 1, 1,
0.1321664, -1.132774, 2.792903, 0, 0.6980392, 1, 1,
0.1383687, -0.5437033, 2.627304, 0, 0.6941177, 1, 1,
0.1416938, -0.3646538, 2.661838, 0, 0.6862745, 1, 1,
0.1458119, -1.061686, 2.921361, 0, 0.682353, 1, 1,
0.1461009, -0.1906698, 2.448855, 0, 0.6745098, 1, 1,
0.1463517, 0.3870071, -1.403201, 0, 0.6705883, 1, 1,
0.1493139, 0.547829, 0.9054011, 0, 0.6627451, 1, 1,
0.1502265, 1.220754, -0.4490354, 0, 0.6588235, 1, 1,
0.1604783, -0.8898174, 1.429988, 0, 0.6509804, 1, 1,
0.160981, 0.6441624, 0.4114836, 0, 0.6470588, 1, 1,
0.1628674, 0.4286095, 0.8212407, 0, 0.6392157, 1, 1,
0.1655457, -0.4732057, 2.772944, 0, 0.6352941, 1, 1,
0.1690934, -1.027333, 2.458548, 0, 0.627451, 1, 1,
0.1710628, -0.3932983, 2.138528, 0, 0.6235294, 1, 1,
0.1720706, 0.1450859, 1.477156, 0, 0.6156863, 1, 1,
0.1723349, 0.7708792, -0.9598532, 0, 0.6117647, 1, 1,
0.1762745, -0.3653506, 2.37018, 0, 0.6039216, 1, 1,
0.1765102, -0.4428599, 1.281008, 0, 0.5960785, 1, 1,
0.1822228, 0.8708261, 0.4240897, 0, 0.5921569, 1, 1,
0.1836845, -0.05975974, 1.595482, 0, 0.5843138, 1, 1,
0.1850518, -1.122994, 4.818529, 0, 0.5803922, 1, 1,
0.1871061, -0.8201341, 1.74081, 0, 0.572549, 1, 1,
0.1923618, -0.2422961, 2.865961, 0, 0.5686275, 1, 1,
0.1973997, 2.331553, -1.168074, 0, 0.5607843, 1, 1,
0.1990755, -0.06520249, 1.883419, 0, 0.5568628, 1, 1,
0.2058759, -1.028937, 3.784375, 0, 0.5490196, 1, 1,
0.2064693, -0.8089734, 2.944679, 0, 0.5450981, 1, 1,
0.2067069, -0.1449446, 1.504997, 0, 0.5372549, 1, 1,
0.2082171, 0.8290746, 0.3639877, 0, 0.5333334, 1, 1,
0.209431, 0.3221036, 1.308197, 0, 0.5254902, 1, 1,
0.2107069, 0.1212875, 0.7005095, 0, 0.5215687, 1, 1,
0.2256571, 1.603444, 0.4012395, 0, 0.5137255, 1, 1,
0.2304467, 1.85104, 1.432229, 0, 0.509804, 1, 1,
0.231838, -0.7796656, 3.183139, 0, 0.5019608, 1, 1,
0.2345103, 0.1707152, 0.5891739, 0, 0.4941176, 1, 1,
0.2349376, 0.5776942, 1.68487, 0, 0.4901961, 1, 1,
0.2354387, -0.2357619, 0.9034311, 0, 0.4823529, 1, 1,
0.237714, -1.04976, 3.61972, 0, 0.4784314, 1, 1,
0.2426979, 0.2101886, 0.1452035, 0, 0.4705882, 1, 1,
0.2430817, -0.6328576, 5.014542, 0, 0.4666667, 1, 1,
0.245371, -0.115128, 0.9073838, 0, 0.4588235, 1, 1,
0.2454321, -0.9590483, 1.441287, 0, 0.454902, 1, 1,
0.2477403, -0.3711019, 1.764684, 0, 0.4470588, 1, 1,
0.2511109, 0.1997259, 1.717455, 0, 0.4431373, 1, 1,
0.2531989, -0.4602323, 2.766197, 0, 0.4352941, 1, 1,
0.2533897, -1.036244, 3.403787, 0, 0.4313726, 1, 1,
0.2575115, 0.6408998, -0.9315533, 0, 0.4235294, 1, 1,
0.2697857, -1.655329, 2.537193, 0, 0.4196078, 1, 1,
0.2700485, 0.4129785, -0.4823718, 0, 0.4117647, 1, 1,
0.2714711, 1.094466, 0.03689737, 0, 0.4078431, 1, 1,
0.271788, -1.264935, 3.8557, 0, 0.4, 1, 1,
0.2718663, 1.789459, -1.660105, 0, 0.3921569, 1, 1,
0.2750038, -1.036111, 2.15753, 0, 0.3882353, 1, 1,
0.2771469, -0.3249432, 2.741923, 0, 0.3803922, 1, 1,
0.2828422, 0.8390716, 0.1963675, 0, 0.3764706, 1, 1,
0.2833733, -0.4748302, 2.472634, 0, 0.3686275, 1, 1,
0.2937141, -0.5388862, 3.724311, 0, 0.3647059, 1, 1,
0.2975255, -0.4354487, 3.799623, 0, 0.3568628, 1, 1,
0.2976679, 0.6937529, 1.754961, 0, 0.3529412, 1, 1,
0.297962, 1.619466, 1.790667, 0, 0.345098, 1, 1,
0.3016764, -1.036139, 3.814267, 0, 0.3411765, 1, 1,
0.3024087, 0.9655809, -0.6106657, 0, 0.3333333, 1, 1,
0.3032811, 0.3417099, 0.4961477, 0, 0.3294118, 1, 1,
0.3067012, -0.4658379, 2.875202, 0, 0.3215686, 1, 1,
0.3079344, -0.2692096, 2.559919, 0, 0.3176471, 1, 1,
0.3080623, 1.541224, -1.245577, 0, 0.3098039, 1, 1,
0.3083019, -0.538744, 5.10558, 0, 0.3058824, 1, 1,
0.3181585, -0.9967743, 2.523049, 0, 0.2980392, 1, 1,
0.3181881, -0.7453379, 3.326214, 0, 0.2901961, 1, 1,
0.3220632, 1.330716, 1.637081, 0, 0.2862745, 1, 1,
0.3229254, -0.08972533, 2.106742, 0, 0.2784314, 1, 1,
0.3265187, -0.3791797, 1.019988, 0, 0.2745098, 1, 1,
0.3300742, 1.533244, 0.01768407, 0, 0.2666667, 1, 1,
0.3326806, 0.79111, 1.489794, 0, 0.2627451, 1, 1,
0.3329372, -0.1840912, 2.196917, 0, 0.254902, 1, 1,
0.334206, -1.789791, 3.263833, 0, 0.2509804, 1, 1,
0.3346923, -0.3842944, 2.619859, 0, 0.2431373, 1, 1,
0.3364927, -1.225827, 3.918058, 0, 0.2392157, 1, 1,
0.3396757, -1.034148, 1.704328, 0, 0.2313726, 1, 1,
0.3403411, -2.327851, 2.655599, 0, 0.227451, 1, 1,
0.3458474, -0.8777033, 2.499448, 0, 0.2196078, 1, 1,
0.3501263, 1.465565, 0.6563635, 0, 0.2156863, 1, 1,
0.3533675, -1.900047, 3.098746, 0, 0.2078431, 1, 1,
0.353572, -1.38707, 2.302114, 0, 0.2039216, 1, 1,
0.3604486, 0.2585519, 0.6886653, 0, 0.1960784, 1, 1,
0.362369, -0.2431958, 1.639491, 0, 0.1882353, 1, 1,
0.3624078, 0.003947314, 1.944315, 0, 0.1843137, 1, 1,
0.3639121, 1.311695, 0.360728, 0, 0.1764706, 1, 1,
0.3640101, 1.195676, 0.8516911, 0, 0.172549, 1, 1,
0.3655654, -2.14501, 2.099919, 0, 0.1647059, 1, 1,
0.3661779, 0.115817, 0.4043598, 0, 0.1607843, 1, 1,
0.3671573, 1.282075, -0.4895927, 0, 0.1529412, 1, 1,
0.3691126, 1.010245, 0.738687, 0, 0.1490196, 1, 1,
0.3707552, 0.3207014, 1.401495, 0, 0.1411765, 1, 1,
0.3750916, -0.1570331, 2.663913, 0, 0.1372549, 1, 1,
0.3811893, 0.7734985, 2.008972, 0, 0.1294118, 1, 1,
0.386368, -1.244058, 1.386371, 0, 0.1254902, 1, 1,
0.387141, -1.406289, 2.942542, 0, 0.1176471, 1, 1,
0.3877834, 0.4417261, 1.399193, 0, 0.1137255, 1, 1,
0.3880924, 0.3040987, 1.380278, 0, 0.1058824, 1, 1,
0.3969858, 0.7180411, 0.3187743, 0, 0.09803922, 1, 1,
0.3984793, -0.3287887, 3.920938, 0, 0.09411765, 1, 1,
0.401321, 0.5882709, 1.323855, 0, 0.08627451, 1, 1,
0.4046248, -0.6676664, 1.309155, 0, 0.08235294, 1, 1,
0.4057627, 1.205278, 0.2314212, 0, 0.07450981, 1, 1,
0.406052, -1.483781, 3.545489, 0, 0.07058824, 1, 1,
0.4063685, -0.2263678, 1.624303, 0, 0.0627451, 1, 1,
0.4096237, -0.6960348, -0.4112158, 0, 0.05882353, 1, 1,
0.4101394, -0.1064515, 2.295902, 0, 0.05098039, 1, 1,
0.4130843, 0.1160331, 3.06955, 0, 0.04705882, 1, 1,
0.4140191, 1.252277, 1.516802, 0, 0.03921569, 1, 1,
0.4198245, -1.675696, 3.41961, 0, 0.03529412, 1, 1,
0.4214045, -0.6941025, 2.992481, 0, 0.02745098, 1, 1,
0.4233064, 1.084131, 0.9954591, 0, 0.02352941, 1, 1,
0.428239, -1.221626, 1.232626, 0, 0.01568628, 1, 1,
0.4304144, 1.472144, 0.8286301, 0, 0.01176471, 1, 1,
0.4310034, -0.6770812, 2.041019, 0, 0.003921569, 1, 1,
0.432416, 0.5206496, 0.4328878, 0.003921569, 0, 1, 1,
0.4329945, 0.6976432, 0.3014739, 0.007843138, 0, 1, 1,
0.4366321, -2.1624, 1.709222, 0.01568628, 0, 1, 1,
0.4382974, 2.223561, -0.6983072, 0.01960784, 0, 1, 1,
0.440727, -0.0526692, 2.334548, 0.02745098, 0, 1, 1,
0.4457295, 1.831985, 1.905654, 0.03137255, 0, 1, 1,
0.4462708, -1.304732, 2.986273, 0.03921569, 0, 1, 1,
0.4489753, -1.752924, 1.608305, 0.04313726, 0, 1, 1,
0.4513122, 0.9308604, 1.617925, 0.05098039, 0, 1, 1,
0.4531458, -1.56351, 2.52563, 0.05490196, 0, 1, 1,
0.4556863, 0.8753543, 0.668743, 0.0627451, 0, 1, 1,
0.4563223, 0.9978505, 1.124951, 0.06666667, 0, 1, 1,
0.4566069, 0.4994714, 1.524006, 0.07450981, 0, 1, 1,
0.4600821, -0.2890129, 1.648545, 0.07843138, 0, 1, 1,
0.4617839, -1.145158, 2.533883, 0.08627451, 0, 1, 1,
0.464416, 1.960205, 2.307606, 0.09019608, 0, 1, 1,
0.466172, -1.485281, 1.991002, 0.09803922, 0, 1, 1,
0.4663731, -1.177613, 4.434363, 0.1058824, 0, 1, 1,
0.4706885, -0.6746971, 2.61452, 0.1098039, 0, 1, 1,
0.4710295, -0.04484082, -0.2157849, 0.1176471, 0, 1, 1,
0.4726175, 0.2439424, 1.328576, 0.1215686, 0, 1, 1,
0.4745202, 1.94437, 0.2555397, 0.1294118, 0, 1, 1,
0.4750952, 0.1500193, -0.1536305, 0.1333333, 0, 1, 1,
0.4776277, -0.4960347, 2.039428, 0.1411765, 0, 1, 1,
0.4814865, 1.017264, 0.3379976, 0.145098, 0, 1, 1,
0.4857466, -0.5247932, 0.7724414, 0.1529412, 0, 1, 1,
0.4886492, 0.2293001, -0.7601969, 0.1568628, 0, 1, 1,
0.4889381, 0.2021301, -0.6659713, 0.1647059, 0, 1, 1,
0.4890089, -0.4106995, 4.749626, 0.1686275, 0, 1, 1,
0.4918956, -0.1511172, 1.647228, 0.1764706, 0, 1, 1,
0.4921447, 1.461835, 0.3765069, 0.1803922, 0, 1, 1,
0.4941465, 1.469223, 0.4133802, 0.1882353, 0, 1, 1,
0.4986168, 1.643948, -1.601222, 0.1921569, 0, 1, 1,
0.5019543, 0.09523112, 1.395813, 0.2, 0, 1, 1,
0.5042829, -0.323471, 1.563435, 0.2078431, 0, 1, 1,
0.5046466, -1.602484, 1.849035, 0.2117647, 0, 1, 1,
0.5070693, 0.1401812, 2.288571, 0.2196078, 0, 1, 1,
0.5104963, -1.530701, 3.758934, 0.2235294, 0, 1, 1,
0.5117865, -0.5277007, 2.58934, 0.2313726, 0, 1, 1,
0.5131392, 1.187879, 1.150636, 0.2352941, 0, 1, 1,
0.5147566, -1.266129, 2.137677, 0.2431373, 0, 1, 1,
0.5152535, -0.3953516, 2.226789, 0.2470588, 0, 1, 1,
0.5176789, 0.2323392, 2.161156, 0.254902, 0, 1, 1,
0.5185286, 0.317748, 1.654674, 0.2588235, 0, 1, 1,
0.5245835, 2.158429, 0.9046639, 0.2666667, 0, 1, 1,
0.5251928, 0.3672026, 3.219833, 0.2705882, 0, 1, 1,
0.529792, -0.1941818, 1.839898, 0.2784314, 0, 1, 1,
0.5307009, -0.3425038, 2.110701, 0.282353, 0, 1, 1,
0.5310119, -0.824868, 1.635588, 0.2901961, 0, 1, 1,
0.5321337, 1.812997, -0.5263885, 0.2941177, 0, 1, 1,
0.5406127, -0.8100456, 2.352123, 0.3019608, 0, 1, 1,
0.5515198, -0.3242342, 0.5706505, 0.3098039, 0, 1, 1,
0.5519599, -0.1275334, 3.144675, 0.3137255, 0, 1, 1,
0.5566098, 0.6965853, 0.7045988, 0.3215686, 0, 1, 1,
0.5602759, 0.9924959, 1.353523, 0.3254902, 0, 1, 1,
0.5611756, -2.015738, 3.365858, 0.3333333, 0, 1, 1,
0.5612466, -1.089673, 1.877637, 0.3372549, 0, 1, 1,
0.5627907, 0.4304255, 1.094151, 0.345098, 0, 1, 1,
0.566666, 1.329369, -1.081937, 0.3490196, 0, 1, 1,
0.5682772, 0.8825704, 1.596068, 0.3568628, 0, 1, 1,
0.5743177, 1.212436, -0.9313004, 0.3607843, 0, 1, 1,
0.5765863, 1.628924, -0.4632457, 0.3686275, 0, 1, 1,
0.581548, 0.9658703, 1.154349, 0.372549, 0, 1, 1,
0.5914932, -1.093722, 1.084875, 0.3803922, 0, 1, 1,
0.594117, -0.06168993, 3.877913, 0.3843137, 0, 1, 1,
0.5944986, 0.1624955, 1.979516, 0.3921569, 0, 1, 1,
0.5964172, -2.284946, 4.042733, 0.3960784, 0, 1, 1,
0.6054012, 0.8177636, 1.217427, 0.4039216, 0, 1, 1,
0.6063092, 2.182302, 0.1892055, 0.4117647, 0, 1, 1,
0.6071112, -0.8546491, 2.910768, 0.4156863, 0, 1, 1,
0.6097856, 0.6699542, 1.988014, 0.4235294, 0, 1, 1,
0.6227204, 1.632071, 1.17442, 0.427451, 0, 1, 1,
0.629366, -1.094284, 3.223214, 0.4352941, 0, 1, 1,
0.6296504, 1.110236, 1.789874, 0.4392157, 0, 1, 1,
0.632472, -0.1574677, 1.157682, 0.4470588, 0, 1, 1,
0.6331302, 0.3307483, -1.33101, 0.4509804, 0, 1, 1,
0.6334993, 0.7091373, 0.59275, 0.4588235, 0, 1, 1,
0.6344729, -0.06170244, 1.878936, 0.4627451, 0, 1, 1,
0.6348593, -0.6108275, 1.284867, 0.4705882, 0, 1, 1,
0.6426212, -1.256888, 1.428634, 0.4745098, 0, 1, 1,
0.6428547, -0.1437335, 2.901742, 0.4823529, 0, 1, 1,
0.6432596, -0.369297, 0.9425388, 0.4862745, 0, 1, 1,
0.6434862, 0.8241218, 0.9533448, 0.4941176, 0, 1, 1,
0.6444049, 0.276596, 2.428163, 0.5019608, 0, 1, 1,
0.6449507, 0.2099173, 1.063897, 0.5058824, 0, 1, 1,
0.6499804, 0.7540867, 1.026254, 0.5137255, 0, 1, 1,
0.6551864, -1.722846, 3.336828, 0.5176471, 0, 1, 1,
0.6576853, 0.2972774, 2.013315, 0.5254902, 0, 1, 1,
0.6629898, -0.2230183, 0.3961412, 0.5294118, 0, 1, 1,
0.6640588, 0.03048997, 0.01421312, 0.5372549, 0, 1, 1,
0.6642712, -0.3846958, 2.108868, 0.5411765, 0, 1, 1,
0.6647367, 0.3003528, 1.854434, 0.5490196, 0, 1, 1,
0.6671118, 0.8912082, 0.7142089, 0.5529412, 0, 1, 1,
0.6676522, 1.683844, 1.003248, 0.5607843, 0, 1, 1,
0.6682284, -0.7527425, 3.043498, 0.5647059, 0, 1, 1,
0.6695105, 0.5934532, -0.2258464, 0.572549, 0, 1, 1,
0.6721663, -0.8088595, 2.03973, 0.5764706, 0, 1, 1,
0.6755933, 1.709471, 1.84613, 0.5843138, 0, 1, 1,
0.6773513, 0.7030984, 2.055123, 0.5882353, 0, 1, 1,
0.6802641, -1.237077, 3.270419, 0.5960785, 0, 1, 1,
0.6812598, 0.73735, 1.030798, 0.6039216, 0, 1, 1,
0.6873688, -1.54775, 3.082854, 0.6078432, 0, 1, 1,
0.6893605, -0.7096893, 1.253825, 0.6156863, 0, 1, 1,
0.6946462, -1.452559, 1.9603, 0.6196079, 0, 1, 1,
0.6950945, 1.027234, -2.673586, 0.627451, 0, 1, 1,
0.6986737, 1.370342, 0.2575063, 0.6313726, 0, 1, 1,
0.7005728, 0.3822082, 1.401923, 0.6392157, 0, 1, 1,
0.706222, -0.629066, 2.373495, 0.6431373, 0, 1, 1,
0.7277674, 1.702553, 1.092784, 0.6509804, 0, 1, 1,
0.7464072, -0.2470003, 3.708886, 0.654902, 0, 1, 1,
0.7470309, 0.5347082, 1.276445, 0.6627451, 0, 1, 1,
0.7540731, 0.6070841, 0.5714328, 0.6666667, 0, 1, 1,
0.7616756, -1.16056, 2.130855, 0.6745098, 0, 1, 1,
0.7628579, -0.7740614, 0.9295424, 0.6784314, 0, 1, 1,
0.7644711, -1.704129, 1.4964, 0.6862745, 0, 1, 1,
0.7664222, 1.023399, -0.102968, 0.6901961, 0, 1, 1,
0.7675293, 0.6693532, 0.3021986, 0.6980392, 0, 1, 1,
0.7695439, 0.6737137, 2.142134, 0.7058824, 0, 1, 1,
0.7758399, 0.2061792, 2.549701, 0.7098039, 0, 1, 1,
0.7826423, 1.165096, 1.398877, 0.7176471, 0, 1, 1,
0.7837451, -1.310579, 2.337374, 0.7215686, 0, 1, 1,
0.786475, -0.7013478, 1.261066, 0.7294118, 0, 1, 1,
0.7882053, 0.07391068, 0.1628737, 0.7333333, 0, 1, 1,
0.7994726, -0.4663128, 2.460194, 0.7411765, 0, 1, 1,
0.7995978, 1.207213, 0.6491938, 0.7450981, 0, 1, 1,
0.8133957, 0.8144323, 2.093786, 0.7529412, 0, 1, 1,
0.8211276, -0.2592927, 2.803657, 0.7568628, 0, 1, 1,
0.8277597, -0.270684, 0.9331471, 0.7647059, 0, 1, 1,
0.8288213, -1.519981, 3.28184, 0.7686275, 0, 1, 1,
0.8348325, 0.5868272, 3.248045, 0.7764706, 0, 1, 1,
0.8379928, -0.7076024, 3.902411, 0.7803922, 0, 1, 1,
0.8423701, -0.6514122, 1.71656, 0.7882353, 0, 1, 1,
0.8443395, -0.265721, 1.418599, 0.7921569, 0, 1, 1,
0.8475648, -1.089731, 2.929773, 0.8, 0, 1, 1,
0.8482184, -3.413644, 3.788533, 0.8078431, 0, 1, 1,
0.8501515, 0.6951862, 0.8217977, 0.8117647, 0, 1, 1,
0.850362, -0.508359, 2.447931, 0.8196079, 0, 1, 1,
0.8508052, -0.3006893, 1.427815, 0.8235294, 0, 1, 1,
0.8627178, 1.400474, -0.02632989, 0.8313726, 0, 1, 1,
0.8676864, -0.8376144, 2.030804, 0.8352941, 0, 1, 1,
0.8689327, 0.2216334, 1.46308, 0.8431373, 0, 1, 1,
0.8691724, 0.5865667, -0.5343015, 0.8470588, 0, 1, 1,
0.8758123, -0.02155009, 1.645576, 0.854902, 0, 1, 1,
0.8823345, 1.369137, -1.903761, 0.8588235, 0, 1, 1,
0.88296, 0.8361325, 1.135672, 0.8666667, 0, 1, 1,
0.8869736, 1.823616, -0.1714786, 0.8705882, 0, 1, 1,
0.8880977, 1.058363, -0.9066039, 0.8784314, 0, 1, 1,
0.8958886, 0.7914078, 1.864839, 0.8823529, 0, 1, 1,
0.8985376, 1.568849, 0.9447475, 0.8901961, 0, 1, 1,
0.9045717, 1.262896, 1.566646, 0.8941177, 0, 1, 1,
0.9144641, -0.2599631, 2.733459, 0.9019608, 0, 1, 1,
0.9232455, -1.336499, 3.570165, 0.9098039, 0, 1, 1,
0.951011, 0.4815135, 1.782998, 0.9137255, 0, 1, 1,
0.955183, -0.13862, -0.3767253, 0.9215686, 0, 1, 1,
0.95863, 0.2851512, 0.6846344, 0.9254902, 0, 1, 1,
0.9592349, -1.150883, 2.711287, 0.9333333, 0, 1, 1,
0.9652817, 1.26835, 0.9900257, 0.9372549, 0, 1, 1,
0.9739466, -0.3719013, 2.477943, 0.945098, 0, 1, 1,
0.9762051, -0.1514701, -1.05606, 0.9490196, 0, 1, 1,
0.9767058, -0.4762081, 1.848503, 0.9568627, 0, 1, 1,
0.9771749, 1.78348, -0.2101935, 0.9607843, 0, 1, 1,
0.9773696, -0.8492264, 1.735003, 0.9686275, 0, 1, 1,
0.9788497, -0.6386624, 2.684822, 0.972549, 0, 1, 1,
0.9812838, -0.902561, 2.337859, 0.9803922, 0, 1, 1,
0.9814494, 0.8821456, -0.1330016, 0.9843137, 0, 1, 1,
0.9957159, -0.3814267, 3.390641, 0.9921569, 0, 1, 1,
0.9995491, -0.1496268, 1.881929, 0.9960784, 0, 1, 1,
1.008575, 0.4497248, 0.8064038, 1, 0, 0.9960784, 1,
1.01814, -1.352287, 2.279011, 1, 0, 0.9882353, 1,
1.018331, -0.3269975, 2.741899, 1, 0, 0.9843137, 1,
1.019158, 0.5158201, 0.6830862, 1, 0, 0.9764706, 1,
1.027924, 1.466767, 2.341788, 1, 0, 0.972549, 1,
1.035197, -0.9880776, 2.132785, 1, 0, 0.9647059, 1,
1.037614, 0.1202057, 1.661735, 1, 0, 0.9607843, 1,
1.041687, 0.1964889, 0.8769071, 1, 0, 0.9529412, 1,
1.043922, -0.06641462, -0.2408824, 1, 0, 0.9490196, 1,
1.044791, -0.8649893, 2.522046, 1, 0, 0.9411765, 1,
1.048731, -0.7063432, 0.9758949, 1, 0, 0.9372549, 1,
1.065333, -0.3018938, 3.142796, 1, 0, 0.9294118, 1,
1.069569, -1.362751, 1.469131, 1, 0, 0.9254902, 1,
1.078221, -0.9555178, 1.131008, 1, 0, 0.9176471, 1,
1.083819, -1.810465, 4.497826, 1, 0, 0.9137255, 1,
1.088094, 1.718146, 1.154928, 1, 0, 0.9058824, 1,
1.088958, 0.9921917, 1.307892, 1, 0, 0.9019608, 1,
1.091021, 0.1983156, 1.923228, 1, 0, 0.8941177, 1,
1.093647, -0.9953631, 1.641909, 1, 0, 0.8862745, 1,
1.09921, 0.7942547, 1.246065, 1, 0, 0.8823529, 1,
1.106406, -0.6615032, 0.0467028, 1, 0, 0.8745098, 1,
1.107574, -0.04078754, 0.2257343, 1, 0, 0.8705882, 1,
1.10846, 2.092223, -0.9493105, 1, 0, 0.8627451, 1,
1.11304, 1.918168, 1.023823, 1, 0, 0.8588235, 1,
1.115348, 1.475401, -0.1358473, 1, 0, 0.8509804, 1,
1.115806, 2.043148, 0.8166909, 1, 0, 0.8470588, 1,
1.122463, -3.486865, 1.84555, 1, 0, 0.8392157, 1,
1.12408, -1.548657, 0.5658131, 1, 0, 0.8352941, 1,
1.128096, 0.2422254, 2.04437, 1, 0, 0.827451, 1,
1.128206, -0.3101095, 2.489572, 1, 0, 0.8235294, 1,
1.135922, 1.381845, 1.804195, 1, 0, 0.8156863, 1,
1.138851, -0.9198417, 3.016288, 1, 0, 0.8117647, 1,
1.145043, 1.592708, 0.8784804, 1, 0, 0.8039216, 1,
1.150771, 0.8573511, 0.4350733, 1, 0, 0.7960784, 1,
1.152549, -0.585157, 0.5209988, 1, 0, 0.7921569, 1,
1.157237, -0.9878442, 2.471331, 1, 0, 0.7843137, 1,
1.157855, -1.443518, 3.948049, 1, 0, 0.7803922, 1,
1.160141, 0.9845156, 1.116477, 1, 0, 0.772549, 1,
1.16236, 1.015359, 0.627962, 1, 0, 0.7686275, 1,
1.164472, 0.9212652, 2.033339, 1, 0, 0.7607843, 1,
1.168713, -0.582707, 2.161498, 1, 0, 0.7568628, 1,
1.17455, -0.1328105, 1.36576, 1, 0, 0.7490196, 1,
1.175495, 0.2750081, 2.265881, 1, 0, 0.7450981, 1,
1.186703, -0.5902112, 0.9214125, 1, 0, 0.7372549, 1,
1.191488, -0.5227548, 0.6476503, 1, 0, 0.7333333, 1,
1.192966, 1.592648, 0.1100706, 1, 0, 0.7254902, 1,
1.196182, -0.450677, 0.1463004, 1, 0, 0.7215686, 1,
1.202764, 1.101145, 2.020451, 1, 0, 0.7137255, 1,
1.207736, -1.049143, 1.942939, 1, 0, 0.7098039, 1,
1.207924, -0.3935299, 2.696861, 1, 0, 0.7019608, 1,
1.212709, 0.4174631, 1.917189, 1, 0, 0.6941177, 1,
1.216319, -1.93121, 1.326297, 1, 0, 0.6901961, 1,
1.216951, -0.499518, 2.922163, 1, 0, 0.682353, 1,
1.22033, 0.176205, 1.846956, 1, 0, 0.6784314, 1,
1.223579, 2.226854, 1.30363, 1, 0, 0.6705883, 1,
1.241648, 0.1143725, 1.072933, 1, 0, 0.6666667, 1,
1.248503, 0.2591439, 0.3872018, 1, 0, 0.6588235, 1,
1.249569, -0.519137, -0.3691334, 1, 0, 0.654902, 1,
1.251592, 0.8453722, -0.16312, 1, 0, 0.6470588, 1,
1.253821, -0.9054053, 2.117163, 1, 0, 0.6431373, 1,
1.254425, -1.038253, 1.997863, 1, 0, 0.6352941, 1,
1.260317, 0.003364926, 2.470896, 1, 0, 0.6313726, 1,
1.260777, -0.2577234, 2.746852, 1, 0, 0.6235294, 1,
1.275921, -1.143394, 3.189227, 1, 0, 0.6196079, 1,
1.277124, 0.03674169, 1.995649, 1, 0, 0.6117647, 1,
1.277581, -1.297239, 2.260741, 1, 0, 0.6078432, 1,
1.281331, 0.1818305, 0.5745969, 1, 0, 0.6, 1,
1.285807, 1.443269, 0.2847782, 1, 0, 0.5921569, 1,
1.287829, 0.08849864, 0.3921157, 1, 0, 0.5882353, 1,
1.289586, -0.1424767, 2.792584, 1, 0, 0.5803922, 1,
1.303567, 0.8557097, 2.688864, 1, 0, 0.5764706, 1,
1.309083, 1.768875, 0.4431788, 1, 0, 0.5686275, 1,
1.311325, 1.696704, 1.388285, 1, 0, 0.5647059, 1,
1.311572, -0.2200422, 0.7923924, 1, 0, 0.5568628, 1,
1.313135, -0.6896496, 1.566399, 1, 0, 0.5529412, 1,
1.31425, 0.2962998, -0.3759952, 1, 0, 0.5450981, 1,
1.320565, 2.756681, 1.055423, 1, 0, 0.5411765, 1,
1.32657, 0.3609107, 1.992303, 1, 0, 0.5333334, 1,
1.334578, -1.285727, 2.675934, 1, 0, 0.5294118, 1,
1.335466, -0.820848, 0.2126311, 1, 0, 0.5215687, 1,
1.338923, 1.301503, 2.084141, 1, 0, 0.5176471, 1,
1.339666, 1.975777, 0.7117941, 1, 0, 0.509804, 1,
1.342147, 0.9084184, 1.209898, 1, 0, 0.5058824, 1,
1.342382, 0.5691153, 2.182264, 1, 0, 0.4980392, 1,
1.348847, -1.035366, 3.210017, 1, 0, 0.4901961, 1,
1.351941, -2.151183, 3.317272, 1, 0, 0.4862745, 1,
1.362183, -1.001356, 1.510454, 1, 0, 0.4784314, 1,
1.369958, -0.1065851, 2.709991, 1, 0, 0.4745098, 1,
1.395018, -0.3557571, 3.518659, 1, 0, 0.4666667, 1,
1.39644, -0.2523925, 0.3417639, 1, 0, 0.4627451, 1,
1.399648, 1.004596, -0.1144791, 1, 0, 0.454902, 1,
1.401198, 1.637237, -0.1119315, 1, 0, 0.4509804, 1,
1.401417, 0.6818994, 1.139432, 1, 0, 0.4431373, 1,
1.410002, 2.250045, 1.290115, 1, 0, 0.4392157, 1,
1.411443, 0.9821326, 1.213011, 1, 0, 0.4313726, 1,
1.416084, 0.04855498, -0.2927919, 1, 0, 0.427451, 1,
1.419789, -0.4087509, 1.007502, 1, 0, 0.4196078, 1,
1.428837, -0.349345, 2.042484, 1, 0, 0.4156863, 1,
1.4296, 0.193023, 2.783394, 1, 0, 0.4078431, 1,
1.441774, 1.08619, 0.2856223, 1, 0, 0.4039216, 1,
1.442651, 0.492607, 0.910002, 1, 0, 0.3960784, 1,
1.443921, 1.20091, -0.1415024, 1, 0, 0.3882353, 1,
1.448351, 0.6821072, 0.6368426, 1, 0, 0.3843137, 1,
1.474021, 0.4944576, 0.833477, 1, 0, 0.3764706, 1,
1.484391, 0.9172263, -0.2517254, 1, 0, 0.372549, 1,
1.488493, -0.5521061, 2.599577, 1, 0, 0.3647059, 1,
1.499192, -2.079751, 3.773274, 1, 0, 0.3607843, 1,
1.503074, -0.3249733, 0.6605117, 1, 0, 0.3529412, 1,
1.504009, -0.2296438, 2.868487, 1, 0, 0.3490196, 1,
1.522874, -1.303995, 1.212205, 1, 0, 0.3411765, 1,
1.528951, 0.03154119, 0.4538112, 1, 0, 0.3372549, 1,
1.535449, -1.205739, 2.492961, 1, 0, 0.3294118, 1,
1.536358, 1.393295, 0.6604509, 1, 0, 0.3254902, 1,
1.568202, -0.4874412, 0.003151178, 1, 0, 0.3176471, 1,
1.568316, -0.3288977, 2.185494, 1, 0, 0.3137255, 1,
1.578179, 0.1835462, 0.3795282, 1, 0, 0.3058824, 1,
1.581896, -1.720906, 3.091182, 1, 0, 0.2980392, 1,
1.624904, -0.4141599, 2.896644, 1, 0, 0.2941177, 1,
1.641316, -1.878644, 2.985502, 1, 0, 0.2862745, 1,
1.642287, 0.5853508, 1.297889, 1, 0, 0.282353, 1,
1.651019, 0.2332089, 0.8561977, 1, 0, 0.2745098, 1,
1.652494, -1.430585, 1.787802, 1, 0, 0.2705882, 1,
1.653651, -0.2278413, 1.44003, 1, 0, 0.2627451, 1,
1.658001, 0.8207146, 1.954997, 1, 0, 0.2588235, 1,
1.664445, -0.2355373, 1.152447, 1, 0, 0.2509804, 1,
1.66502, -1.651358, 1.120315, 1, 0, 0.2470588, 1,
1.665786, 0.9214771, 2.541672, 1, 0, 0.2392157, 1,
1.666306, -0.4486743, 1.627275, 1, 0, 0.2352941, 1,
1.676619, -0.5524741, 1.364737, 1, 0, 0.227451, 1,
1.708617, 0.5347121, 1.65086, 1, 0, 0.2235294, 1,
1.727849, -1.629717, 3.147329, 1, 0, 0.2156863, 1,
1.795758, 1.444813, 1.346738, 1, 0, 0.2117647, 1,
1.820258, -0.6180182, 1.708829, 1, 0, 0.2039216, 1,
1.837195, -1.26337, 4.026041, 1, 0, 0.1960784, 1,
1.839307, -0.4655838, 0.8728418, 1, 0, 0.1921569, 1,
1.850938, -1.785861, 2.068204, 1, 0, 0.1843137, 1,
1.862317, -0.5629998, 1.185433, 1, 0, 0.1803922, 1,
1.893401, -1.02017, 1.882572, 1, 0, 0.172549, 1,
1.905401, -1.064726, 1.539006, 1, 0, 0.1686275, 1,
1.908384, -1.421504, 3.809302, 1, 0, 0.1607843, 1,
1.916227, 1.333367, 0.9128719, 1, 0, 0.1568628, 1,
1.919139, -0.7608768, 3.157917, 1, 0, 0.1490196, 1,
1.930607, 0.7470782, -0.05652377, 1, 0, 0.145098, 1,
1.946279, 0.9112965, 1.065673, 1, 0, 0.1372549, 1,
1.962543, 0.279915, 1.563772, 1, 0, 0.1333333, 1,
1.97003, 0.3318081, 1.601658, 1, 0, 0.1254902, 1,
1.970101, 0.8938883, 2.514728, 1, 0, 0.1215686, 1,
1.986634, 0.9222687, 2.891999, 1, 0, 0.1137255, 1,
2.010957, 0.6232607, 0.6095213, 1, 0, 0.1098039, 1,
2.018179, 1.398644, 2.699747, 1, 0, 0.1019608, 1,
2.020805, -0.1003467, 2.633338, 1, 0, 0.09411765, 1,
2.051528, 0.06529306, 1.249864, 1, 0, 0.09019608, 1,
2.086266, 0.04274486, 1.373885, 1, 0, 0.08235294, 1,
2.097827, -0.6488089, 0.7496547, 1, 0, 0.07843138, 1,
2.16798, 0.9049295, 0.5639216, 1, 0, 0.07058824, 1,
2.237862, 0.5445546, 1.956499, 1, 0, 0.06666667, 1,
2.299996, -0.143608, 1.39466, 1, 0, 0.05882353, 1,
2.330119, 0.9571493, 1.631855, 1, 0, 0.05490196, 1,
2.376193, -1.552234, 2.023138, 1, 0, 0.04705882, 1,
2.382519, 0.2820161, 0.1386185, 1, 0, 0.04313726, 1,
2.40585, -0.7202977, 3.244176, 1, 0, 0.03529412, 1,
2.570179, 0.8675777, 1.677636, 1, 0, 0.03137255, 1,
2.572607, 0.8525106, -0.04114668, 1, 0, 0.02352941, 1,
2.772711, 0.960486, -0.6067921, 1, 0, 0.01960784, 1,
3.128302, 0.3963424, 3.829279, 1, 0, 0.01176471, 1,
3.435695, 1.215694, -0.1443508, 1, 0, 0.007843138, 1
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
0.004306197, -4.636468, -7.622434, 0, -0.5, 0.5, 0.5,
0.004306197, -4.636468, -7.622434, 1, -0.5, 0.5, 0.5,
0.004306197, -4.636468, -7.622434, 1, 1.5, 0.5, 0.5,
0.004306197, -4.636468, -7.622434, 0, 1.5, 0.5, 0.5
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
-4.590324, -0.1341662, -7.622434, 0, -0.5, 0.5, 0.5,
-4.590324, -0.1341662, -7.622434, 1, -0.5, 0.5, 0.5,
-4.590324, -0.1341662, -7.622434, 1, 1.5, 0.5, 0.5,
-4.590324, -0.1341662, -7.622434, 0, 1.5, 0.5, 0.5
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
-4.590324, -4.636468, -0.3360674, 0, -0.5, 0.5, 0.5,
-4.590324, -4.636468, -0.3360674, 1, -0.5, 0.5, 0.5,
-4.590324, -4.636468, -0.3360674, 1, 1.5, 0.5, 0.5,
-4.590324, -4.636468, -0.3360674, 0, 1.5, 0.5, 0.5
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
-3, -3.597475, -5.940965,
3, -3.597475, -5.940965,
-3, -3.597475, -5.940965,
-3, -3.770641, -6.22121,
-2, -3.597475, -5.940965,
-2, -3.770641, -6.22121,
-1, -3.597475, -5.940965,
-1, -3.770641, -6.22121,
0, -3.597475, -5.940965,
0, -3.770641, -6.22121,
1, -3.597475, -5.940965,
1, -3.770641, -6.22121,
2, -3.597475, -5.940965,
2, -3.770641, -6.22121,
3, -3.597475, -5.940965,
3, -3.770641, -6.22121
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
-3, -4.116971, -6.781699, 0, -0.5, 0.5, 0.5,
-3, -4.116971, -6.781699, 1, -0.5, 0.5, 0.5,
-3, -4.116971, -6.781699, 1, 1.5, 0.5, 0.5,
-3, -4.116971, -6.781699, 0, 1.5, 0.5, 0.5,
-2, -4.116971, -6.781699, 0, -0.5, 0.5, 0.5,
-2, -4.116971, -6.781699, 1, -0.5, 0.5, 0.5,
-2, -4.116971, -6.781699, 1, 1.5, 0.5, 0.5,
-2, -4.116971, -6.781699, 0, 1.5, 0.5, 0.5,
-1, -4.116971, -6.781699, 0, -0.5, 0.5, 0.5,
-1, -4.116971, -6.781699, 1, -0.5, 0.5, 0.5,
-1, -4.116971, -6.781699, 1, 1.5, 0.5, 0.5,
-1, -4.116971, -6.781699, 0, 1.5, 0.5, 0.5,
0, -4.116971, -6.781699, 0, -0.5, 0.5, 0.5,
0, -4.116971, -6.781699, 1, -0.5, 0.5, 0.5,
0, -4.116971, -6.781699, 1, 1.5, 0.5, 0.5,
0, -4.116971, -6.781699, 0, 1.5, 0.5, 0.5,
1, -4.116971, -6.781699, 0, -0.5, 0.5, 0.5,
1, -4.116971, -6.781699, 1, -0.5, 0.5, 0.5,
1, -4.116971, -6.781699, 1, 1.5, 0.5, 0.5,
1, -4.116971, -6.781699, 0, 1.5, 0.5, 0.5,
2, -4.116971, -6.781699, 0, -0.5, 0.5, 0.5,
2, -4.116971, -6.781699, 1, -0.5, 0.5, 0.5,
2, -4.116971, -6.781699, 1, 1.5, 0.5, 0.5,
2, -4.116971, -6.781699, 0, 1.5, 0.5, 0.5,
3, -4.116971, -6.781699, 0, -0.5, 0.5, 0.5,
3, -4.116971, -6.781699, 1, -0.5, 0.5, 0.5,
3, -4.116971, -6.781699, 1, 1.5, 0.5, 0.5,
3, -4.116971, -6.781699, 0, 1.5, 0.5, 0.5
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
-3.530025, -3, -5.940965,
-3.530025, 3, -5.940965,
-3.530025, -3, -5.940965,
-3.706741, -3, -6.22121,
-3.530025, -2, -5.940965,
-3.706741, -2, -6.22121,
-3.530025, -1, -5.940965,
-3.706741, -1, -6.22121,
-3.530025, 0, -5.940965,
-3.706741, 0, -6.22121,
-3.530025, 1, -5.940965,
-3.706741, 1, -6.22121,
-3.530025, 2, -5.940965,
-3.706741, 2, -6.22121,
-3.530025, 3, -5.940965,
-3.706741, 3, -6.22121
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
-4.060174, -3, -6.781699, 0, -0.5, 0.5, 0.5,
-4.060174, -3, -6.781699, 1, -0.5, 0.5, 0.5,
-4.060174, -3, -6.781699, 1, 1.5, 0.5, 0.5,
-4.060174, -3, -6.781699, 0, 1.5, 0.5, 0.5,
-4.060174, -2, -6.781699, 0, -0.5, 0.5, 0.5,
-4.060174, -2, -6.781699, 1, -0.5, 0.5, 0.5,
-4.060174, -2, -6.781699, 1, 1.5, 0.5, 0.5,
-4.060174, -2, -6.781699, 0, 1.5, 0.5, 0.5,
-4.060174, -1, -6.781699, 0, -0.5, 0.5, 0.5,
-4.060174, -1, -6.781699, 1, -0.5, 0.5, 0.5,
-4.060174, -1, -6.781699, 1, 1.5, 0.5, 0.5,
-4.060174, -1, -6.781699, 0, 1.5, 0.5, 0.5,
-4.060174, 0, -6.781699, 0, -0.5, 0.5, 0.5,
-4.060174, 0, -6.781699, 1, -0.5, 0.5, 0.5,
-4.060174, 0, -6.781699, 1, 1.5, 0.5, 0.5,
-4.060174, 0, -6.781699, 0, 1.5, 0.5, 0.5,
-4.060174, 1, -6.781699, 0, -0.5, 0.5, 0.5,
-4.060174, 1, -6.781699, 1, -0.5, 0.5, 0.5,
-4.060174, 1, -6.781699, 1, 1.5, 0.5, 0.5,
-4.060174, 1, -6.781699, 0, 1.5, 0.5, 0.5,
-4.060174, 2, -6.781699, 0, -0.5, 0.5, 0.5,
-4.060174, 2, -6.781699, 1, -0.5, 0.5, 0.5,
-4.060174, 2, -6.781699, 1, 1.5, 0.5, 0.5,
-4.060174, 2, -6.781699, 0, 1.5, 0.5, 0.5,
-4.060174, 3, -6.781699, 0, -0.5, 0.5, 0.5,
-4.060174, 3, -6.781699, 1, -0.5, 0.5, 0.5,
-4.060174, 3, -6.781699, 1, 1.5, 0.5, 0.5,
-4.060174, 3, -6.781699, 0, 1.5, 0.5, 0.5
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
-3.530025, -3.597475, -4,
-3.530025, -3.597475, 4,
-3.530025, -3.597475, -4,
-3.706741, -3.770641, -4,
-3.530025, -3.597475, -2,
-3.706741, -3.770641, -2,
-3.530025, -3.597475, 0,
-3.706741, -3.770641, 0,
-3.530025, -3.597475, 2,
-3.706741, -3.770641, 2,
-3.530025, -3.597475, 4,
-3.706741, -3.770641, 4
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
-4.060174, -4.116971, -4, 0, -0.5, 0.5, 0.5,
-4.060174, -4.116971, -4, 1, -0.5, 0.5, 0.5,
-4.060174, -4.116971, -4, 1, 1.5, 0.5, 0.5,
-4.060174, -4.116971, -4, 0, 1.5, 0.5, 0.5,
-4.060174, -4.116971, -2, 0, -0.5, 0.5, 0.5,
-4.060174, -4.116971, -2, 1, -0.5, 0.5, 0.5,
-4.060174, -4.116971, -2, 1, 1.5, 0.5, 0.5,
-4.060174, -4.116971, -2, 0, 1.5, 0.5, 0.5,
-4.060174, -4.116971, 0, 0, -0.5, 0.5, 0.5,
-4.060174, -4.116971, 0, 1, -0.5, 0.5, 0.5,
-4.060174, -4.116971, 0, 1, 1.5, 0.5, 0.5,
-4.060174, -4.116971, 0, 0, 1.5, 0.5, 0.5,
-4.060174, -4.116971, 2, 0, -0.5, 0.5, 0.5,
-4.060174, -4.116971, 2, 1, -0.5, 0.5, 0.5,
-4.060174, -4.116971, 2, 1, 1.5, 0.5, 0.5,
-4.060174, -4.116971, 2, 0, 1.5, 0.5, 0.5,
-4.060174, -4.116971, 4, 0, -0.5, 0.5, 0.5,
-4.060174, -4.116971, 4, 1, -0.5, 0.5, 0.5,
-4.060174, -4.116971, 4, 1, 1.5, 0.5, 0.5,
-4.060174, -4.116971, 4, 0, 1.5, 0.5, 0.5
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
-3.530025, -3.597475, -5.940965,
-3.530025, 3.329143, -5.940965,
-3.530025, -3.597475, 5.26883,
-3.530025, 3.329143, 5.26883,
-3.530025, -3.597475, -5.940965,
-3.530025, -3.597475, 5.26883,
-3.530025, 3.329143, -5.940965,
-3.530025, 3.329143, 5.26883,
-3.530025, -3.597475, -5.940965,
3.538637, -3.597475, -5.940965,
-3.530025, -3.597475, 5.26883,
3.538637, -3.597475, 5.26883,
-3.530025, 3.329143, -5.940965,
3.538637, 3.329143, -5.940965,
-3.530025, 3.329143, 5.26883,
3.538637, 3.329143, 5.26883,
3.538637, -3.597475, -5.940965,
3.538637, 3.329143, -5.940965,
3.538637, -3.597475, 5.26883,
3.538637, 3.329143, 5.26883,
3.538637, -3.597475, -5.940965,
3.538637, -3.597475, 5.26883,
3.538637, 3.329143, -5.940965,
3.538637, 3.329143, 5.26883
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
var radius = 7.984813;
var distance = 35.52534;
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
mvMatrix.translate( -0.004306197, 0.1341662, 0.3360674 );
mvMatrix.scale( 1.221354, 1.2464, 0.7701601 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.52534);
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
disodium_methanearso<-read.table("disodium_methanearso.xyz", skip=1)
x<-disodium_methanearso$V2
y<-disodium_methanearso$V3
z<-disodium_methanearso$V4
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
6, 5, 2, 0, 0, 1, 1, 1,
1, 1, 1, 1, 0, 0, 1, 1,
2, 1, 1, 1, 0, 0, 1, 1,
4, 1, 1, 1, 0, 0, 1, 1,
4, 2, 1, 1, 0, 0, 1, 1,
4, 3, 1, 1, 0, 0, 1, 1,
5, 1, 1, 0, 0, 0, 1, 1,
3, 1, 1, 0, 0, 0, 1, 1,
1, 4, 1, 0, 0, 0, 1, 1,
2, 4, 1, 0, 0, 0, 1, 1
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
var radius = 5.332448;
var distance = 18.73;
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
mvMatrix.translate( -3.5, -3, -1.5 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -18.73);
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
for (var i = 0; i < 10; i++) {
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
