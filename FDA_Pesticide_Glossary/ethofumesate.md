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
-3.177959, 1.360993, -3.6532, 1, 0, 0, 1,
-2.641332, 1.297407, -0.7220806, 1, 0.007843138, 0, 1,
-2.630398, -0.2586074, -0.6435809, 1, 0.01176471, 0, 1,
-2.547542, -0.161399, -1.631365, 1, 0.01960784, 0, 1,
-2.461996, 0.3862792, 1.416399, 1, 0.02352941, 0, 1,
-2.432228, -0.2193885, 0.006571534, 1, 0.03137255, 0, 1,
-2.370181, 1.073251, -2.674673, 1, 0.03529412, 0, 1,
-2.31032, -0.7730204, -2.618318, 1, 0.04313726, 0, 1,
-2.276156, -0.6191545, -1.736694, 1, 0.04705882, 0, 1,
-2.26007, -1.464558, -3.855615, 1, 0.05490196, 0, 1,
-2.235626, 1.148886, -1.638366, 1, 0.05882353, 0, 1,
-2.180011, 1.404329, -1.632923, 1, 0.06666667, 0, 1,
-2.163681, 1.132311, -1.200905, 1, 0.07058824, 0, 1,
-2.145806, 1.36994, -1.126732, 1, 0.07843138, 0, 1,
-2.118274, 0.4862812, 0.4727767, 1, 0.08235294, 0, 1,
-2.10707, -0.7314834, -3.386863, 1, 0.09019608, 0, 1,
-2.09972, 0.7558235, -2.297959, 1, 0.09411765, 0, 1,
-2.087495, -0.113916, -0.6080824, 1, 0.1019608, 0, 1,
-2.072071, 1.554728, -1.833621, 1, 0.1098039, 0, 1,
-2.022421, -0.08260875, -1.329337, 1, 0.1137255, 0, 1,
-2.001503, 0.0190914, -2.939407, 1, 0.1215686, 0, 1,
-1.997103, -1.249333, -0.6927581, 1, 0.1254902, 0, 1,
-1.965347, 0.3947709, 0.116507, 1, 0.1333333, 0, 1,
-1.908297, -1.139333, -2.903567, 1, 0.1372549, 0, 1,
-1.90721, 1.266508, -1.603567, 1, 0.145098, 0, 1,
-1.904179, 0.2995781, -0.2178506, 1, 0.1490196, 0, 1,
-1.888136, 0.2422376, -1.429929, 1, 0.1568628, 0, 1,
-1.869071, 0.1625916, 0.002931861, 1, 0.1607843, 0, 1,
-1.859069, -1.813541, -2.961179, 1, 0.1686275, 0, 1,
-1.856723, -0.7700697, -0.8561208, 1, 0.172549, 0, 1,
-1.856564, 0.0797788, -1.318549, 1, 0.1803922, 0, 1,
-1.843829, -0.2161895, -1.716841, 1, 0.1843137, 0, 1,
-1.839596, 0.3261157, -2.639871, 1, 0.1921569, 0, 1,
-1.838474, 1.067338, -1.222868, 1, 0.1960784, 0, 1,
-1.810681, -1.970666, -2.72892, 1, 0.2039216, 0, 1,
-1.781585, -1.720897, -2.488657, 1, 0.2117647, 0, 1,
-1.774262, -0.8025889, -1.692914, 1, 0.2156863, 0, 1,
-1.766027, -0.09897039, -0.4169878, 1, 0.2235294, 0, 1,
-1.750886, -1.439784, -2.920207, 1, 0.227451, 0, 1,
-1.743493, 0.5903045, 0.2098096, 1, 0.2352941, 0, 1,
-1.726091, -0.7297276, -0.4977092, 1, 0.2392157, 0, 1,
-1.717569, 1.405061, -0.9232976, 1, 0.2470588, 0, 1,
-1.70854, -1.829444, -1.692409, 1, 0.2509804, 0, 1,
-1.705014, -0.122091, -1.837001, 1, 0.2588235, 0, 1,
-1.70055, 0.8063708, -2.091571, 1, 0.2627451, 0, 1,
-1.695694, 0.2817489, -0.4291527, 1, 0.2705882, 0, 1,
-1.692687, -1.654932, -2.705725, 1, 0.2745098, 0, 1,
-1.679837, 1.671603, -0.2852581, 1, 0.282353, 0, 1,
-1.651887, -0.4819147, -0.661707, 1, 0.2862745, 0, 1,
-1.633281, -0.2584259, -0.3052402, 1, 0.2941177, 0, 1,
-1.624683, -1.800976, -4.193453, 1, 0.3019608, 0, 1,
-1.624603, 1.100015, -1.744015, 1, 0.3058824, 0, 1,
-1.622714, 0.2954991, 0.816628, 1, 0.3137255, 0, 1,
-1.613409, 0.3577617, -0.3357526, 1, 0.3176471, 0, 1,
-1.613181, 0.810111, -0.4085998, 1, 0.3254902, 0, 1,
-1.61004, 0.7968311, 0.1260195, 1, 0.3294118, 0, 1,
-1.609544, 0.2183781, -1.832379, 1, 0.3372549, 0, 1,
-1.579588, -0.1446263, -2.659033, 1, 0.3411765, 0, 1,
-1.57252, 2.483598, 0.008973501, 1, 0.3490196, 0, 1,
-1.564463, -1.368601, -4.159891, 1, 0.3529412, 0, 1,
-1.551445, 0.4076619, -0.2235123, 1, 0.3607843, 0, 1,
-1.546424, -1.706435, -1.884834, 1, 0.3647059, 0, 1,
-1.541947, -0.6984818, -2.849003, 1, 0.372549, 0, 1,
-1.539304, 0.4150721, -0.3409331, 1, 0.3764706, 0, 1,
-1.537387, -0.9296919, -2.316441, 1, 0.3843137, 0, 1,
-1.525352, 1.281793, -0.3216676, 1, 0.3882353, 0, 1,
-1.522083, 1.461153, -1.882883, 1, 0.3960784, 0, 1,
-1.511266, -2.304227, -1.756914, 1, 0.4039216, 0, 1,
-1.492575, 0.4444087, -0.1040119, 1, 0.4078431, 0, 1,
-1.492558, -0.6024911, -0.6247389, 1, 0.4156863, 0, 1,
-1.469658, -0.5404067, -1.984243, 1, 0.4196078, 0, 1,
-1.462946, -0.02867152, -0.973844, 1, 0.427451, 0, 1,
-1.461637, 0.3230347, -1.268905, 1, 0.4313726, 0, 1,
-1.457328, -0.123207, -1.545852, 1, 0.4392157, 0, 1,
-1.455833, 0.8804406, -1.139812, 1, 0.4431373, 0, 1,
-1.449089, -0.6903238, -1.49622, 1, 0.4509804, 0, 1,
-1.448563, -0.5562262, -3.306396, 1, 0.454902, 0, 1,
-1.447877, 1.363045, 0.546281, 1, 0.4627451, 0, 1,
-1.430974, -0.9887933, -2.745608, 1, 0.4666667, 0, 1,
-1.427716, 0.07889125, -2.288783, 1, 0.4745098, 0, 1,
-1.425382, -1.75135, -1.138669, 1, 0.4784314, 0, 1,
-1.405161, 2.274393, 1.621917, 1, 0.4862745, 0, 1,
-1.403938, 1.224258, -1.228966, 1, 0.4901961, 0, 1,
-1.402901, 1.872806, -1.817834, 1, 0.4980392, 0, 1,
-1.401056, -0.984308, -1.655795, 1, 0.5058824, 0, 1,
-1.397365, -1.619347, -2.400244, 1, 0.509804, 0, 1,
-1.393363, -0.578363, -1.891233, 1, 0.5176471, 0, 1,
-1.390123, 1.492927, -1.727522, 1, 0.5215687, 0, 1,
-1.387729, -0.468632, -2.765182, 1, 0.5294118, 0, 1,
-1.384191, -0.8857934, -2.776477, 1, 0.5333334, 0, 1,
-1.382044, 0.1196842, -1.358594, 1, 0.5411765, 0, 1,
-1.374984, -0.8767428, -1.369492, 1, 0.5450981, 0, 1,
-1.370448, 0.8604802, 0.7178298, 1, 0.5529412, 0, 1,
-1.36984, -0.9330336, -1.159663, 1, 0.5568628, 0, 1,
-1.3651, -1.061224, -2.760217, 1, 0.5647059, 0, 1,
-1.360516, 0.1900287, 0.3067447, 1, 0.5686275, 0, 1,
-1.355633, -1.187152, -2.854676, 1, 0.5764706, 0, 1,
-1.353711, 0.4606664, -1.239839, 1, 0.5803922, 0, 1,
-1.348298, -0.9566916, -2.654274, 1, 0.5882353, 0, 1,
-1.347311, 0.3898506, -3.160062, 1, 0.5921569, 0, 1,
-1.34438, 0.3406184, -1.597307, 1, 0.6, 0, 1,
-1.339946, -0.7194149, -1.800641, 1, 0.6078432, 0, 1,
-1.335618, -1.116373, -1.851882, 1, 0.6117647, 0, 1,
-1.327866, 1.230484, 0.6791269, 1, 0.6196079, 0, 1,
-1.312262, -0.1073555, -2.436567, 1, 0.6235294, 0, 1,
-1.307115, -0.9580573, -0.9141348, 1, 0.6313726, 0, 1,
-1.303676, 0.6708675, -2.282137, 1, 0.6352941, 0, 1,
-1.288511, 1.744952, -0.02560431, 1, 0.6431373, 0, 1,
-1.277518, 0.0347291, -2.779886, 1, 0.6470588, 0, 1,
-1.274708, 1.003367, -2.020802, 1, 0.654902, 0, 1,
-1.26731, -0.4471625, -0.6032535, 1, 0.6588235, 0, 1,
-1.253148, 1.304893, -0.1791577, 1, 0.6666667, 0, 1,
-1.233266, -0.746506, -1.263314, 1, 0.6705883, 0, 1,
-1.219932, -0.1278273, -1.433667, 1, 0.6784314, 0, 1,
-1.213712, -0.195945, -1.344424, 1, 0.682353, 0, 1,
-1.205907, 1.536053, -1.874248, 1, 0.6901961, 0, 1,
-1.193208, 2.133862, -1.789086, 1, 0.6941177, 0, 1,
-1.186163, 0.2879923, -0.3894964, 1, 0.7019608, 0, 1,
-1.183946, -0.4581519, -1.642992, 1, 0.7098039, 0, 1,
-1.183691, 0.2110348, -2.129, 1, 0.7137255, 0, 1,
-1.171768, -0.3548347, -3.01121, 1, 0.7215686, 0, 1,
-1.17032, 1.428151, -0.1818605, 1, 0.7254902, 0, 1,
-1.165171, 0.6802135, -2.312101, 1, 0.7333333, 0, 1,
-1.156669, -0.1742901, -1.282098, 1, 0.7372549, 0, 1,
-1.154511, -0.2563627, -1.952262, 1, 0.7450981, 0, 1,
-1.153116, 0.7487659, -1.295809, 1, 0.7490196, 0, 1,
-1.151639, 0.5092714, -0.7198654, 1, 0.7568628, 0, 1,
-1.150593, 0.4963311, -0.6384659, 1, 0.7607843, 0, 1,
-1.146318, 0.7445365, 0.04969148, 1, 0.7686275, 0, 1,
-1.138374, -0.698197, -1.340456, 1, 0.772549, 0, 1,
-1.134944, -0.08677105, -3.670367, 1, 0.7803922, 0, 1,
-1.126309, 0.6028125, -0.159384, 1, 0.7843137, 0, 1,
-1.123995, -0.7164515, -2.874124, 1, 0.7921569, 0, 1,
-1.119367, -1.333667, -3.198687, 1, 0.7960784, 0, 1,
-1.114931, 0.3575326, -3.559872, 1, 0.8039216, 0, 1,
-1.113326, 1.499684, -1.10916, 1, 0.8117647, 0, 1,
-1.112672, 0.3995589, -1.532354, 1, 0.8156863, 0, 1,
-1.112476, 1.135938, -1.94797, 1, 0.8235294, 0, 1,
-1.10288, 1.574203, -1.233988, 1, 0.827451, 0, 1,
-1.100567, -0.002666088, -0.2572367, 1, 0.8352941, 0, 1,
-1.078913, 0.6850284, -1.571271, 1, 0.8392157, 0, 1,
-1.076207, -1.075194, -2.082993, 1, 0.8470588, 0, 1,
-1.071131, 0.4959905, 0.5947187, 1, 0.8509804, 0, 1,
-1.066386, -0.6653348, -0.4353838, 1, 0.8588235, 0, 1,
-1.062996, -0.3089775, -3.101576, 1, 0.8627451, 0, 1,
-1.059842, -0.4368396, -1.724017, 1, 0.8705882, 0, 1,
-1.056983, -0.1104865, -1.075426, 1, 0.8745098, 0, 1,
-1.055118, 1.296952, -0.7566395, 1, 0.8823529, 0, 1,
-1.0501, -0.8851148, -3.365923, 1, 0.8862745, 0, 1,
-1.048369, 0.1799373, -0.4569348, 1, 0.8941177, 0, 1,
-1.041386, 0.7446808, -2.608873, 1, 0.8980392, 0, 1,
-1.040109, 1.301273, -2.436131, 1, 0.9058824, 0, 1,
-1.03021, 0.9763749, -0.1778937, 1, 0.9137255, 0, 1,
-1.020075, 1.14079, -0.37587, 1, 0.9176471, 0, 1,
-1.013191, -0.6641898, -2.908469, 1, 0.9254902, 0, 1,
-1.009553, 0.5041389, -1.34064, 1, 0.9294118, 0, 1,
-1.004599, -1.178641, -3.161976, 1, 0.9372549, 0, 1,
-1.004027, 0.5391359, -1.648224, 1, 0.9411765, 0, 1,
-1.00337, 0.3763222, -2.107983, 1, 0.9490196, 0, 1,
-1.00318, -1.028817, -2.832443, 1, 0.9529412, 0, 1,
-0.9971658, 0.4773087, -0.2181463, 1, 0.9607843, 0, 1,
-0.9874604, -1.882381, -1.515401, 1, 0.9647059, 0, 1,
-0.9834229, 0.4737028, -1.274045, 1, 0.972549, 0, 1,
-0.9795383, -2.124157, -1.168267, 1, 0.9764706, 0, 1,
-0.9788717, 0.5528324, -0.8620338, 1, 0.9843137, 0, 1,
-0.9764663, 0.6302149, -2.004086, 1, 0.9882353, 0, 1,
-0.9741021, 2.074932, 0.4057781, 1, 0.9960784, 0, 1,
-0.9735921, -0.1162652, -1.536549, 0.9960784, 1, 0, 1,
-0.9679006, 0.3918391, -1.653734, 0.9921569, 1, 0, 1,
-0.9579554, -0.1855494, -2.051668, 0.9843137, 1, 0, 1,
-0.9567304, 1.31785, 0.2300456, 0.9803922, 1, 0, 1,
-0.9551461, -0.4985476, -3.10893, 0.972549, 1, 0, 1,
-0.9550826, -1.953278, -1.500946, 0.9686275, 1, 0, 1,
-0.9435525, 0.2984108, 0.2851825, 0.9607843, 1, 0, 1,
-0.9410796, 0.6867385, -0.8268116, 0.9568627, 1, 0, 1,
-0.9396991, 0.1237359, -1.146013, 0.9490196, 1, 0, 1,
-0.9392402, -1.680352, -1.702784, 0.945098, 1, 0, 1,
-0.9383646, -1.023914, -2.689001, 0.9372549, 1, 0, 1,
-0.9337466, -0.1699225, -1.492151, 0.9333333, 1, 0, 1,
-0.9289768, 0.07602374, -1.936779, 0.9254902, 1, 0, 1,
-0.9245887, 0.8162079, -1.077137, 0.9215686, 1, 0, 1,
-0.9187373, -0.2839808, -3.134751, 0.9137255, 1, 0, 1,
-0.9169511, 0.1552536, -1.725516, 0.9098039, 1, 0, 1,
-0.9138492, -0.6492175, -3.151508, 0.9019608, 1, 0, 1,
-0.9113145, -0.3937589, -0.07869244, 0.8941177, 1, 0, 1,
-0.907128, -0.5397189, -1.577705, 0.8901961, 1, 0, 1,
-0.9026995, 0.3025273, -0.8633775, 0.8823529, 1, 0, 1,
-0.8981593, -1.603778, -3.58079, 0.8784314, 1, 0, 1,
-0.8939653, -1.70443, -4.101109, 0.8705882, 1, 0, 1,
-0.8928978, 2.09383, 0.3317115, 0.8666667, 1, 0, 1,
-0.8914419, -0.5877967, -1.198334, 0.8588235, 1, 0, 1,
-0.8902529, -0.5013793, -1.148966, 0.854902, 1, 0, 1,
-0.8599365, 1.547023, -0.4996179, 0.8470588, 1, 0, 1,
-0.8560653, 0.2883256, 0.964366, 0.8431373, 1, 0, 1,
-0.8525757, 2.043188, 0.5782089, 0.8352941, 1, 0, 1,
-0.8493631, -1.32719, -1.888468, 0.8313726, 1, 0, 1,
-0.8425707, 1.565363, 0.8596362, 0.8235294, 1, 0, 1,
-0.840804, 0.6347311, -0.48733, 0.8196079, 1, 0, 1,
-0.8376536, -0.04380875, -2.333113, 0.8117647, 1, 0, 1,
-0.8364813, 1.015158, -1.337105, 0.8078431, 1, 0, 1,
-0.8343759, -0.4880721, -2.618091, 0.8, 1, 0, 1,
-0.8330335, -1.198837, -1.488391, 0.7921569, 1, 0, 1,
-0.832314, 0.7751626, -0.4289381, 0.7882353, 1, 0, 1,
-0.8304433, -1.281956, -2.506117, 0.7803922, 1, 0, 1,
-0.8302742, 1.613206, -0.4114979, 0.7764706, 1, 0, 1,
-0.8260901, 0.8971856, -1.156928, 0.7686275, 1, 0, 1,
-0.8214448, 0.2120128, 0.04034499, 0.7647059, 1, 0, 1,
-0.8212401, -1.096567, -3.101346, 0.7568628, 1, 0, 1,
-0.8170274, 1.351011, -0.8760443, 0.7529412, 1, 0, 1,
-0.8139229, 0.3869188, 0.2241221, 0.7450981, 1, 0, 1,
-0.8102831, -0.4416976, -1.839409, 0.7411765, 1, 0, 1,
-0.8061652, -0.5536647, -2.204844, 0.7333333, 1, 0, 1,
-0.8060737, -0.4108666, -2.971788, 0.7294118, 1, 0, 1,
-0.8039361, -0.001875582, -3.255313, 0.7215686, 1, 0, 1,
-0.8025273, 0.8198685, -1.86632, 0.7176471, 1, 0, 1,
-0.7871305, 0.01871934, -1.988974, 0.7098039, 1, 0, 1,
-0.7839682, -2.101649, -2.710232, 0.7058824, 1, 0, 1,
-0.7810853, 1.728473, -1.639406, 0.6980392, 1, 0, 1,
-0.7788358, 0.380261, 0.447558, 0.6901961, 1, 0, 1,
-0.7712848, 0.6626109, -0.4435301, 0.6862745, 1, 0, 1,
-0.7648269, -1.217119, -0.9778805, 0.6784314, 1, 0, 1,
-0.763957, -0.1134794, -3.211058, 0.6745098, 1, 0, 1,
-0.7620463, 0.8191582, 1.562431, 0.6666667, 1, 0, 1,
-0.7613427, 1.198884, 1.000835, 0.6627451, 1, 0, 1,
-0.7541517, 0.8489863, 1.579276, 0.654902, 1, 0, 1,
-0.754003, 1.756389, -0.3205658, 0.6509804, 1, 0, 1,
-0.7537992, -0.5131611, -0.9420979, 0.6431373, 1, 0, 1,
-0.750895, 0.3911615, -0.4935023, 0.6392157, 1, 0, 1,
-0.7497342, 0.3519775, -0.4005244, 0.6313726, 1, 0, 1,
-0.7450011, 0.6877443, -0.5819094, 0.627451, 1, 0, 1,
-0.737286, 0.8416836, -0.3857834, 0.6196079, 1, 0, 1,
-0.7367547, -1.09769, -1.78902, 0.6156863, 1, 0, 1,
-0.7361899, -0.0643163, -2.330764, 0.6078432, 1, 0, 1,
-0.7351837, 0.1811281, 0.110172, 0.6039216, 1, 0, 1,
-0.7347636, 0.4341845, -1.917128, 0.5960785, 1, 0, 1,
-0.7324495, 1.577597, -1.546719, 0.5882353, 1, 0, 1,
-0.7319431, 1.328211, 0.5209258, 0.5843138, 1, 0, 1,
-0.7237009, 0.6707488, -1.818509, 0.5764706, 1, 0, 1,
-0.7228949, -0.5770317, -2.322532, 0.572549, 1, 0, 1,
-0.7203736, -0.08671097, -1.465872, 0.5647059, 1, 0, 1,
-0.7124912, 0.04666546, -1.129396, 0.5607843, 1, 0, 1,
-0.7120501, 1.876243, -0.9178613, 0.5529412, 1, 0, 1,
-0.7076514, 0.3081406, -1.457841, 0.5490196, 1, 0, 1,
-0.7067788, 0.06901102, -1.412069, 0.5411765, 1, 0, 1,
-0.7044623, -0.7429052, -1.36993, 0.5372549, 1, 0, 1,
-0.7036827, -0.6184906, -3.184679, 0.5294118, 1, 0, 1,
-0.7034859, -1.538185, -2.980433, 0.5254902, 1, 0, 1,
-0.6991109, 0.6518614, -0.8444971, 0.5176471, 1, 0, 1,
-0.6972318, 0.07998306, -1.736501, 0.5137255, 1, 0, 1,
-0.6962345, 1.71907, -0.1895139, 0.5058824, 1, 0, 1,
-0.6935129, 0.3372775, -2.954949, 0.5019608, 1, 0, 1,
-0.6921976, -0.02088939, 0.1729165, 0.4941176, 1, 0, 1,
-0.6890556, -1.461732, -2.819598, 0.4862745, 1, 0, 1,
-0.6879964, -0.1221283, -1.517214, 0.4823529, 1, 0, 1,
-0.6867106, 1.124333, -0.3960302, 0.4745098, 1, 0, 1,
-0.6855074, -0.8654008, -4.330983, 0.4705882, 1, 0, 1,
-0.6839527, -1.507553, -1.597364, 0.4627451, 1, 0, 1,
-0.6825308, -0.0412484, -2.162272, 0.4588235, 1, 0, 1,
-0.6775366, -0.5189119, -2.795455, 0.4509804, 1, 0, 1,
-0.6744034, -1.120855, -2.390765, 0.4470588, 1, 0, 1,
-0.6733608, -0.5501143, -3.201785, 0.4392157, 1, 0, 1,
-0.672872, -0.4143627, -2.370726, 0.4352941, 1, 0, 1,
-0.6680034, 0.8072869, -0.2141801, 0.427451, 1, 0, 1,
-0.6648839, -0.7798774, -1.618996, 0.4235294, 1, 0, 1,
-0.6485711, 0.9564723, 0.9911367, 0.4156863, 1, 0, 1,
-0.6467251, 0.495731, -1.53357, 0.4117647, 1, 0, 1,
-0.6460155, -0.09384387, -1.639922, 0.4039216, 1, 0, 1,
-0.6458455, -0.228869, -0.6090238, 0.3960784, 1, 0, 1,
-0.6417236, -1.048818, -2.807121, 0.3921569, 1, 0, 1,
-0.6384712, -0.7791421, -1.76391, 0.3843137, 1, 0, 1,
-0.6258655, -2.517327, -4.715714, 0.3803922, 1, 0, 1,
-0.624119, 0.3280772, -1.009967, 0.372549, 1, 0, 1,
-0.6229264, 0.1680046, -0.7546626, 0.3686275, 1, 0, 1,
-0.6214802, 0.5561857, -1.797511, 0.3607843, 1, 0, 1,
-0.6214086, 0.7068442, -1.211109, 0.3568628, 1, 0, 1,
-0.6181899, -0.4670141, -1.448664, 0.3490196, 1, 0, 1,
-0.6147289, -0.4120668, -2.78641, 0.345098, 1, 0, 1,
-0.6137116, -0.8652882, -2.597512, 0.3372549, 1, 0, 1,
-0.6116857, -1.226859, -2.265658, 0.3333333, 1, 0, 1,
-0.6058987, 0.299583, -3.217466, 0.3254902, 1, 0, 1,
-0.6029717, -2.666387, -1.642325, 0.3215686, 1, 0, 1,
-0.6027666, -0.658323, -3.414989, 0.3137255, 1, 0, 1,
-0.6025995, 0.1608158, -1.802639, 0.3098039, 1, 0, 1,
-0.6014956, -1.005277, -1.886739, 0.3019608, 1, 0, 1,
-0.5911632, 0.4546558, -1.042714, 0.2941177, 1, 0, 1,
-0.5894893, -1.760559, -3.57957, 0.2901961, 1, 0, 1,
-0.5876724, -0.8521503, -3.407545, 0.282353, 1, 0, 1,
-0.584069, 2.073019, -0.6150227, 0.2784314, 1, 0, 1,
-0.5827799, -1.265303, -3.28702, 0.2705882, 1, 0, 1,
-0.5806885, -0.03600984, -1.544965, 0.2666667, 1, 0, 1,
-0.5769349, -0.3938932, -2.447415, 0.2588235, 1, 0, 1,
-0.5766966, 0.4339021, -0.6980299, 0.254902, 1, 0, 1,
-0.5727032, -0.9464656, -1.909572, 0.2470588, 1, 0, 1,
-0.5682067, 1.367651, 2.641123, 0.2431373, 1, 0, 1,
-0.5677851, 0.004222907, -0.6821368, 0.2352941, 1, 0, 1,
-0.5665877, -1.302588, -2.916636, 0.2313726, 1, 0, 1,
-0.5651678, 2.682958, -0.4562327, 0.2235294, 1, 0, 1,
-0.5646802, 1.10515, -0.8889537, 0.2196078, 1, 0, 1,
-0.5632834, 0.6491744, -1.499712, 0.2117647, 1, 0, 1,
-0.5628285, -0.6192299, -4.251244, 0.2078431, 1, 0, 1,
-0.5584601, -0.9749154, -1.779484, 0.2, 1, 0, 1,
-0.5570411, 1.268685, -1.77389, 0.1921569, 1, 0, 1,
-0.5538982, 0.6909798, -1.717523, 0.1882353, 1, 0, 1,
-0.5521173, 0.2688673, -1.005774, 0.1803922, 1, 0, 1,
-0.5516975, -0.3199476, -2.244643, 0.1764706, 1, 0, 1,
-0.5455557, 0.7686742, -0.9571392, 0.1686275, 1, 0, 1,
-0.5411615, 0.7813745, -0.8678294, 0.1647059, 1, 0, 1,
-0.534938, -0.009435844, -0.6610956, 0.1568628, 1, 0, 1,
-0.525512, 0.880146, -1.026785, 0.1529412, 1, 0, 1,
-0.5219702, 0.2955559, 1.445007, 0.145098, 1, 0, 1,
-0.5196494, -0.8090579, -4.547678, 0.1411765, 1, 0, 1,
-0.5131828, 0.5514516, -1.239152, 0.1333333, 1, 0, 1,
-0.5035145, 0.164863, -4.947236, 0.1294118, 1, 0, 1,
-0.5022107, -1.195844, -3.16578, 0.1215686, 1, 0, 1,
-0.50054, 0.4096779, -0.5830768, 0.1176471, 1, 0, 1,
-0.4986737, -2.638931, -3.519506, 0.1098039, 1, 0, 1,
-0.4884592, 1.212801, -3.557376, 0.1058824, 1, 0, 1,
-0.4881925, -0.2722898, -0.9285829, 0.09803922, 1, 0, 1,
-0.4857716, 0.6072555, -0.8541414, 0.09019608, 1, 0, 1,
-0.4777161, 1.070433, -0.8709422, 0.08627451, 1, 0, 1,
-0.4752139, 1.406232, -0.3795412, 0.07843138, 1, 0, 1,
-0.4721162, 0.9950957, -0.2239531, 0.07450981, 1, 0, 1,
-0.462416, 1.217253, -0.4604527, 0.06666667, 1, 0, 1,
-0.4617388, 0.876256, -0.1481371, 0.0627451, 1, 0, 1,
-0.4589229, 0.3151108, -1.618404, 0.05490196, 1, 0, 1,
-0.4553358, -0.5525678, -3.187146, 0.05098039, 1, 0, 1,
-0.4492922, -0.007797111, -1.042565, 0.04313726, 1, 0, 1,
-0.4436798, 0.7992868, 1.288857, 0.03921569, 1, 0, 1,
-0.4404101, 1.361518, -1.970413, 0.03137255, 1, 0, 1,
-0.4398226, -0.1877082, -2.093494, 0.02745098, 1, 0, 1,
-0.4344214, -0.7639225, -3.684616, 0.01960784, 1, 0, 1,
-0.4336916, -0.3825526, -1.208673, 0.01568628, 1, 0, 1,
-0.4335827, 0.1930335, -1.772343, 0.007843138, 1, 0, 1,
-0.4307745, -0.05411812, -0.4088727, 0.003921569, 1, 0, 1,
-0.4307562, -1.352078, -4.22744, 0, 1, 0.003921569, 1,
-0.4292659, -0.08790755, -1.927418, 0, 1, 0.01176471, 1,
-0.4287224, -0.5864559, -3.520247, 0, 1, 0.01568628, 1,
-0.4216963, 1.015167, -2.971327, 0, 1, 0.02352941, 1,
-0.4202736, 0.6769221, -0.8041646, 0, 1, 0.02745098, 1,
-0.4195377, -0.8338034, -3.746192, 0, 1, 0.03529412, 1,
-0.4036441, -0.4374917, -1.731931, 0, 1, 0.03921569, 1,
-0.402421, -0.54533, -2.938862, 0, 1, 0.04705882, 1,
-0.401736, -0.3393084, -3.011447, 0, 1, 0.05098039, 1,
-0.3993317, 2.322891, -0.1797803, 0, 1, 0.05882353, 1,
-0.3982813, 0.9763138, -0.5760925, 0, 1, 0.0627451, 1,
-0.3954221, 0.3279438, 0.407181, 0, 1, 0.07058824, 1,
-0.3919583, 0.6996385, -1.194701, 0, 1, 0.07450981, 1,
-0.383987, -0.9427318, -2.746197, 0, 1, 0.08235294, 1,
-0.3721038, 0.1999423, -1.869307, 0, 1, 0.08627451, 1,
-0.3659415, 0.4663697, 0.5925963, 0, 1, 0.09411765, 1,
-0.3649453, 0.5407527, -0.05955592, 0, 1, 0.1019608, 1,
-0.3648924, 0.9939044, -0.303259, 0, 1, 0.1058824, 1,
-0.3627903, 1.65439, -0.7070635, 0, 1, 0.1137255, 1,
-0.3624443, 0.07653044, -1.085182, 0, 1, 0.1176471, 1,
-0.3598701, -0.3665087, -3.016937, 0, 1, 0.1254902, 1,
-0.3566517, 0.3850727, -0.4292609, 0, 1, 0.1294118, 1,
-0.3556511, -1.046531, -1.093928, 0, 1, 0.1372549, 1,
-0.3553177, -0.2454897, -1.821029, 0, 1, 0.1411765, 1,
-0.3543576, 0.07654474, -0.792066, 0, 1, 0.1490196, 1,
-0.35344, -0.7661824, -3.070673, 0, 1, 0.1529412, 1,
-0.3531964, 1.498902, -1.041511, 0, 1, 0.1607843, 1,
-0.350766, 0.1280334, -0.9579974, 0, 1, 0.1647059, 1,
-0.3400847, -1.032848, -3.316276, 0, 1, 0.172549, 1,
-0.3397461, 1.323929, 0.04917761, 0, 1, 0.1764706, 1,
-0.3334327, -1.021195, -3.353197, 0, 1, 0.1843137, 1,
-0.3328022, -2.081802, -3.255425, 0, 1, 0.1882353, 1,
-0.3313447, -1.144352, 0.3297141, 0, 1, 0.1960784, 1,
-0.3252445, 0.06130825, -2.150657, 0, 1, 0.2039216, 1,
-0.3249902, 0.7492236, -0.6826008, 0, 1, 0.2078431, 1,
-0.3243338, -0.01647543, 0.5187927, 0, 1, 0.2156863, 1,
-0.3236854, 0.1238278, -0.6827855, 0, 1, 0.2196078, 1,
-0.3233584, 0.2085069, -0.605022, 0, 1, 0.227451, 1,
-0.3185161, -0.8745864, -5.083, 0, 1, 0.2313726, 1,
-0.3149725, -1.373782, -2.729281, 0, 1, 0.2392157, 1,
-0.3131276, 0.6036489, 0.3585843, 0, 1, 0.2431373, 1,
-0.3023349, -1.295478, -2.133276, 0, 1, 0.2509804, 1,
-0.3010269, -0.2011198, -2.979046, 0, 1, 0.254902, 1,
-0.2954484, 1.392588, 0.3734568, 0, 1, 0.2627451, 1,
-0.2941925, 1.610588, 0.1385769, 0, 1, 0.2666667, 1,
-0.2936113, -1.792127, -3.183133, 0, 1, 0.2745098, 1,
-0.2868188, -0.8903197, -1.712034, 0, 1, 0.2784314, 1,
-0.2865554, -0.1748156, -4.665452, 0, 1, 0.2862745, 1,
-0.2826201, -0.1539883, -0.6120532, 0, 1, 0.2901961, 1,
-0.2817588, -0.7645287, -1.172336, 0, 1, 0.2980392, 1,
-0.2815941, 0.8000606, -1.006764, 0, 1, 0.3058824, 1,
-0.2676065, 0.3253039, 0.7641095, 0, 1, 0.3098039, 1,
-0.2597949, -1.495262, -4.425232, 0, 1, 0.3176471, 1,
-0.2533574, -0.0489203, -1.092145, 0, 1, 0.3215686, 1,
-0.2522917, 1.892603, -0.7481036, 0, 1, 0.3294118, 1,
-0.2515023, 1.103243, -0.1655522, 0, 1, 0.3333333, 1,
-0.2513874, 1.359464, 0.1796277, 0, 1, 0.3411765, 1,
-0.2316225, 0.6763618, -0.02648329, 0, 1, 0.345098, 1,
-0.2295972, 0.2845467, 0.4084391, 0, 1, 0.3529412, 1,
-0.2292897, -0.0653169, -3.265067, 0, 1, 0.3568628, 1,
-0.2252409, 0.7255747, 1.650961, 0, 1, 0.3647059, 1,
-0.2224951, 0.8265096, -1.246001, 0, 1, 0.3686275, 1,
-0.2211927, 1.108986, -0.3963229, 0, 1, 0.3764706, 1,
-0.2207344, 1.158735, 1.188506, 0, 1, 0.3803922, 1,
-0.2095048, 0.2107747, -0.06669408, 0, 1, 0.3882353, 1,
-0.208433, 0.3047744, -0.4599529, 0, 1, 0.3921569, 1,
-0.2077621, -0.4376769, -2.758243, 0, 1, 0.4, 1,
-0.2065272, -0.2128723, -1.581009, 0, 1, 0.4078431, 1,
-0.204064, 0.8443492, -0.401679, 0, 1, 0.4117647, 1,
-0.2028314, -0.5425667, -1.75756, 0, 1, 0.4196078, 1,
-0.1984505, -1.019372, -2.963976, 0, 1, 0.4235294, 1,
-0.1980516, 0.2524281, 0.1461037, 0, 1, 0.4313726, 1,
-0.1931164, 0.3367375, -1.226809, 0, 1, 0.4352941, 1,
-0.1930445, -0.2919288, -3.379184, 0, 1, 0.4431373, 1,
-0.1925097, -2.677355, -4.196033, 0, 1, 0.4470588, 1,
-0.1896754, 0.4366281, -1.472533, 0, 1, 0.454902, 1,
-0.1894249, -0.3923215, -2.953315, 0, 1, 0.4588235, 1,
-0.1884331, -0.222655, -2.747557, 0, 1, 0.4666667, 1,
-0.1860457, -1.180029, -4.652156, 0, 1, 0.4705882, 1,
-0.1853611, -0.3335168, -1.603204, 0, 1, 0.4784314, 1,
-0.1845163, 1.610298, 0.3020623, 0, 1, 0.4823529, 1,
-0.1844016, -1.108453, -1.310307, 0, 1, 0.4901961, 1,
-0.1802411, 0.01600942, -1.239187, 0, 1, 0.4941176, 1,
-0.1792189, 0.4089064, -0.1188634, 0, 1, 0.5019608, 1,
-0.1790061, 0.4865927, 1.613108, 0, 1, 0.509804, 1,
-0.1788971, 0.9161507, 0.1600115, 0, 1, 0.5137255, 1,
-0.178246, -0.6338394, -1.786741, 0, 1, 0.5215687, 1,
-0.1766815, -0.7528629, -2.84568, 0, 1, 0.5254902, 1,
-0.1765303, -0.9668494, -2.33115, 0, 1, 0.5333334, 1,
-0.1756908, -0.7229387, -2.900241, 0, 1, 0.5372549, 1,
-0.1727612, 0.8214158, -0.9833941, 0, 1, 0.5450981, 1,
-0.1717681, 1.000918, -0.3611026, 0, 1, 0.5490196, 1,
-0.1706225, 0.07404144, -2.812192, 0, 1, 0.5568628, 1,
-0.1701199, -1.400137, -2.318736, 0, 1, 0.5607843, 1,
-0.1694412, 0.6622588, -1.104635, 0, 1, 0.5686275, 1,
-0.1640803, -0.3431334, -1.529233, 0, 1, 0.572549, 1,
-0.1630272, 2.155363, -0.8501071, 0, 1, 0.5803922, 1,
-0.1620473, 0.9462147, 0.8743717, 0, 1, 0.5843138, 1,
-0.1605332, 0.7171046, -1.183605, 0, 1, 0.5921569, 1,
-0.1513944, -1.071709, -3.190604, 0, 1, 0.5960785, 1,
-0.1502105, -1.548681, -2.871091, 0, 1, 0.6039216, 1,
-0.1479438, -0.6536783, -2.318578, 0, 1, 0.6117647, 1,
-0.1468103, -0.3310703, -2.927505, 0, 1, 0.6156863, 1,
-0.1467577, 0.5859264, -0.5081748, 0, 1, 0.6235294, 1,
-0.1414258, 1.051048, 0.9950585, 0, 1, 0.627451, 1,
-0.1406114, 0.3503694, -0.2370301, 0, 1, 0.6352941, 1,
-0.1375684, 0.1015895, -1.544468, 0, 1, 0.6392157, 1,
-0.1359694, 0.9120547, -0.725207, 0, 1, 0.6470588, 1,
-0.13459, -1.20649, -3.036367, 0, 1, 0.6509804, 1,
-0.1334008, -0.5915191, -2.79998, 0, 1, 0.6588235, 1,
-0.1286068, 0.2476237, 0.4016323, 0, 1, 0.6627451, 1,
-0.1220866, -1.071018, -4.32456, 0, 1, 0.6705883, 1,
-0.1200197, -1.304206, -3.431087, 0, 1, 0.6745098, 1,
-0.1153684, 0.1455494, -1.048667, 0, 1, 0.682353, 1,
-0.1118577, 0.4049324, -0.7040203, 0, 1, 0.6862745, 1,
-0.1110252, 0.9965183, 0.1221867, 0, 1, 0.6941177, 1,
-0.1078696, -0.7240639, -1.352599, 0, 1, 0.7019608, 1,
-0.1049266, -0.4224463, -3.532772, 0, 1, 0.7058824, 1,
-0.1042304, -0.2396255, -1.814801, 0, 1, 0.7137255, 1,
-0.09991302, -0.3924592, -2.588393, 0, 1, 0.7176471, 1,
-0.09950914, 0.6361793, -0.7756957, 0, 1, 0.7254902, 1,
-0.09943828, -1.46129, -3.08007, 0, 1, 0.7294118, 1,
-0.09833084, -0.3755848, -2.377232, 0, 1, 0.7372549, 1,
-0.09514216, 0.8384326, -0.8349621, 0, 1, 0.7411765, 1,
-0.09224503, -1.618841, -1.721936, 0, 1, 0.7490196, 1,
-0.09152938, 0.8899775, -0.2481147, 0, 1, 0.7529412, 1,
-0.09143452, 0.8977562, 0.7956578, 0, 1, 0.7607843, 1,
-0.08196311, 0.5856098, 0.3875422, 0, 1, 0.7647059, 1,
-0.08017212, 0.568227, -1.322744, 0, 1, 0.772549, 1,
-0.07461276, -0.3084213, -1.520418, 0, 1, 0.7764706, 1,
-0.07331195, 0.04750684, 0.7412497, 0, 1, 0.7843137, 1,
-0.07155041, 0.1847048, -0.4707485, 0, 1, 0.7882353, 1,
-0.06821447, 0.04749645, -1.898241, 0, 1, 0.7960784, 1,
-0.0653794, -0.7054557, -3.68628, 0, 1, 0.8039216, 1,
-0.06360865, 2.331912, -0.1191534, 0, 1, 0.8078431, 1,
-0.06294247, -0.5502928, -2.346908, 0, 1, 0.8156863, 1,
-0.06079325, 0.4226329, -0.8124968, 0, 1, 0.8196079, 1,
-0.05720137, 0.2322673, -0.1397619, 0, 1, 0.827451, 1,
-0.05364463, 1.120849, 0.6172141, 0, 1, 0.8313726, 1,
-0.05298656, -1.200724, -4.349403, 0, 1, 0.8392157, 1,
-0.05233118, -0.7759758, -2.325424, 0, 1, 0.8431373, 1,
-0.05135868, -0.6889522, -3.078172, 0, 1, 0.8509804, 1,
-0.04951577, 0.2174338, -0.2137877, 0, 1, 0.854902, 1,
-0.04807156, 1.297163, -0.01865244, 0, 1, 0.8627451, 1,
-0.04760397, -1.151198, -3.014516, 0, 1, 0.8666667, 1,
-0.04723338, -0.2857873, -1.480442, 0, 1, 0.8745098, 1,
-0.04446895, 0.4650262, -1.352164, 0, 1, 0.8784314, 1,
-0.04266387, -0.3926327, -4.560064, 0, 1, 0.8862745, 1,
-0.04055963, -0.4286287, -3.954047, 0, 1, 0.8901961, 1,
-0.03971322, -0.7482737, -4.835267, 0, 1, 0.8980392, 1,
-0.03965273, 0.2879874, -0.1595725, 0, 1, 0.9058824, 1,
-0.03921603, -0.1760667, -3.334417, 0, 1, 0.9098039, 1,
-0.03865055, 0.648961, 0.7637931, 0, 1, 0.9176471, 1,
-0.03339406, 1.738772, -0.4948757, 0, 1, 0.9215686, 1,
-0.02742244, 1.195016, 0.531436, 0, 1, 0.9294118, 1,
-0.02689017, -0.4290542, -1.187775, 0, 1, 0.9333333, 1,
-0.02627754, -0.1694232, -2.202363, 0, 1, 0.9411765, 1,
-0.02590055, -0.6013783, -4.024962, 0, 1, 0.945098, 1,
-0.02455348, 1.325636, -0.7177368, 0, 1, 0.9529412, 1,
-0.02052358, -1.056293, -4.301474, 0, 1, 0.9568627, 1,
-0.01347221, -0.2676899, -1.073274, 0, 1, 0.9647059, 1,
-0.01240782, 0.4483888, 0.09495776, 0, 1, 0.9686275, 1,
-0.01003474, 0.5558378, 0.4665525, 0, 1, 0.9764706, 1,
-0.009553918, -0.1530917, -2.280205, 0, 1, 0.9803922, 1,
-0.008813889, 1.231528, -0.4543929, 0, 1, 0.9882353, 1,
-0.005211586, 0.9143222, 0.4972576, 0, 1, 0.9921569, 1,
0.004333578, -0.4300513, 3.190018, 0, 1, 1, 1,
0.004982671, 0.2117088, 0.3959706, 0, 0.9921569, 1, 1,
0.008336642, 0.1488736, -0.7882655, 0, 0.9882353, 1, 1,
0.008992331, 0.5253024, -0.8090403, 0, 0.9803922, 1, 1,
0.009295361, -0.1168735, 2.866154, 0, 0.9764706, 1, 1,
0.0111338, 0.1042559, -0.1935071, 0, 0.9686275, 1, 1,
0.01129153, 0.2498968, 1.273467, 0, 0.9647059, 1, 1,
0.01334392, -0.02883565, 3.814941, 0, 0.9568627, 1, 1,
0.01410241, -1.507058, 0.02369446, 0, 0.9529412, 1, 1,
0.01889498, 0.6628241, -0.08251847, 0, 0.945098, 1, 1,
0.02282398, 1.785999, 2.65747, 0, 0.9411765, 1, 1,
0.02288329, 0.3113868, 0.4426766, 0, 0.9333333, 1, 1,
0.02325573, 0.6602898, -0.8138236, 0, 0.9294118, 1, 1,
0.02933533, -1.466989, 4.506217, 0, 0.9215686, 1, 1,
0.02943056, 0.6340889, -0.8699145, 0, 0.9176471, 1, 1,
0.02992791, 0.2565141, -0.2545483, 0, 0.9098039, 1, 1,
0.03706903, -0.7193407, 1.818895, 0, 0.9058824, 1, 1,
0.03835079, -1.841522, 1.801374, 0, 0.8980392, 1, 1,
0.03960605, -0.5206907, 3.105633, 0, 0.8901961, 1, 1,
0.04420021, -1.655835, 2.325672, 0, 0.8862745, 1, 1,
0.0489515, 0.05382886, 2.110458, 0, 0.8784314, 1, 1,
0.05583892, -1.909625, 2.470693, 0, 0.8745098, 1, 1,
0.05621677, 1.353882, -1.034089, 0, 0.8666667, 1, 1,
0.05672987, -1.329431, 0.4425776, 0, 0.8627451, 1, 1,
0.05980134, -0.08667301, 1.812441, 0, 0.854902, 1, 1,
0.06514779, 1.615501, -1.738379, 0, 0.8509804, 1, 1,
0.06584579, -0.8926634, 2.174319, 0, 0.8431373, 1, 1,
0.06609797, 0.6772978, 1.398208, 0, 0.8392157, 1, 1,
0.06628237, -1.428753, 4.139064, 0, 0.8313726, 1, 1,
0.06638461, 0.5389327, 1.877205, 0, 0.827451, 1, 1,
0.06645808, 1.599464, 1.202737, 0, 0.8196079, 1, 1,
0.06951677, -0.6706473, 5.030201, 0, 0.8156863, 1, 1,
0.07179498, 1.18349, -0.06357519, 0, 0.8078431, 1, 1,
0.08062074, -1.269678, 3.53582, 0, 0.8039216, 1, 1,
0.08288987, -0.364139, 3.033134, 0, 0.7960784, 1, 1,
0.08388753, -0.1738105, 2.677962, 0, 0.7882353, 1, 1,
0.08756798, -0.1922779, 3.376807, 0, 0.7843137, 1, 1,
0.08949549, 1.448494, -0.3397244, 0, 0.7764706, 1, 1,
0.09241838, 1.009862, -0.4285074, 0, 0.772549, 1, 1,
0.09420566, -0.8731153, 2.41187, 0, 0.7647059, 1, 1,
0.09495924, 2.219675, -0.9007887, 0, 0.7607843, 1, 1,
0.09530571, -0.210946, 3.451661, 0, 0.7529412, 1, 1,
0.09711274, -0.8896423, 3.995665, 0, 0.7490196, 1, 1,
0.0981956, -1.139705, 3.466361, 0, 0.7411765, 1, 1,
0.1063171, -0.5532122, 1.976669, 0, 0.7372549, 1, 1,
0.1083166, -0.9808887, 1.932282, 0, 0.7294118, 1, 1,
0.1103616, 0.5454459, -1.537401, 0, 0.7254902, 1, 1,
0.1157327, 1.230145, -0.9837055, 0, 0.7176471, 1, 1,
0.1202049, -0.4332649, 3.327615, 0, 0.7137255, 1, 1,
0.1202154, -1.055906, 3.073376, 0, 0.7058824, 1, 1,
0.1209954, -0.1896994, 0.9228531, 0, 0.6980392, 1, 1,
0.1220422, -1.551184, 3.145997, 0, 0.6941177, 1, 1,
0.1221823, -1.345792, 3.744073, 0, 0.6862745, 1, 1,
0.125221, 0.6770246, 0.6646798, 0, 0.682353, 1, 1,
0.1256812, 0.3362069, -2.58469, 0, 0.6745098, 1, 1,
0.1271011, -2.649993, 4.066308, 0, 0.6705883, 1, 1,
0.1281189, 2.138033, 1.381342, 0, 0.6627451, 1, 1,
0.1281444, 0.02643897, -0.5016482, 0, 0.6588235, 1, 1,
0.1317547, -0.6582891, 2.633663, 0, 0.6509804, 1, 1,
0.1376852, 1.406679, 0.2464005, 0, 0.6470588, 1, 1,
0.1421591, 1.650114, -0.01048932, 0, 0.6392157, 1, 1,
0.1447446, 0.3014727, 0.5472946, 0, 0.6352941, 1, 1,
0.1447922, 0.3121556, 0.2354486, 0, 0.627451, 1, 1,
0.1508692, -0.9834999, 2.171682, 0, 0.6235294, 1, 1,
0.155254, 0.8616808, -0.960005, 0, 0.6156863, 1, 1,
0.1557167, 0.4078785, -0.07740192, 0, 0.6117647, 1, 1,
0.1571359, -1.059608, 2.102028, 0, 0.6039216, 1, 1,
0.1581963, 0.03332255, 1.144886, 0, 0.5960785, 1, 1,
0.1587628, -1.380177, 2.669868, 0, 0.5921569, 1, 1,
0.1590614, -1.473026, 3.66119, 0, 0.5843138, 1, 1,
0.1607454, -0.300458, 2.587181, 0, 0.5803922, 1, 1,
0.161519, 0.3182124, 1.06441, 0, 0.572549, 1, 1,
0.1654587, 0.2080696, 1.132968, 0, 0.5686275, 1, 1,
0.1660843, -1.002553, 4.03251, 0, 0.5607843, 1, 1,
0.1677399, 0.8470935, -0.4792713, 0, 0.5568628, 1, 1,
0.1720062, 0.368699, 0.2988693, 0, 0.5490196, 1, 1,
0.1752067, 0.141071, 2.550633, 0, 0.5450981, 1, 1,
0.1792862, 0.4626073, 2.412649, 0, 0.5372549, 1, 1,
0.1811443, 0.4528923, 2.640939, 0, 0.5333334, 1, 1,
0.1819961, 0.8842113, -0.2767971, 0, 0.5254902, 1, 1,
0.1821439, 0.3848163, -0.2079891, 0, 0.5215687, 1, 1,
0.1821647, 3.078109, 0.4082964, 0, 0.5137255, 1, 1,
0.1849823, 1.43714, -2.059029, 0, 0.509804, 1, 1,
0.185349, -0.3938527, 4.065581, 0, 0.5019608, 1, 1,
0.1969146, -0.1483167, 2.122209, 0, 0.4941176, 1, 1,
0.1994036, -1.211577, 3.758543, 0, 0.4901961, 1, 1,
0.2022263, -2.034467, 3.670801, 0, 0.4823529, 1, 1,
0.2023842, -0.8052198, 2.943445, 0, 0.4784314, 1, 1,
0.2036149, -2.776432, 3.133897, 0, 0.4705882, 1, 1,
0.2135574, -1.243742, 2.632321, 0, 0.4666667, 1, 1,
0.2153456, 1.347819, 0.345095, 0, 0.4588235, 1, 1,
0.2165418, 1.353328, 0.8446761, 0, 0.454902, 1, 1,
0.2171418, -1.148946, 3.003849, 0, 0.4470588, 1, 1,
0.2172297, 0.438244, -0.693291, 0, 0.4431373, 1, 1,
0.2172949, -1.444355, 1.93389, 0, 0.4352941, 1, 1,
0.2192423, 0.4683093, 1.428895, 0, 0.4313726, 1, 1,
0.2199577, 0.9056696, 0.03501452, 0, 0.4235294, 1, 1,
0.2204472, -1.071732, 2.644915, 0, 0.4196078, 1, 1,
0.2228335, 0.08356912, 1.269394, 0, 0.4117647, 1, 1,
0.225505, 0.3658747, 1.773553, 0, 0.4078431, 1, 1,
0.2269176, -1.211683, 1.113623, 0, 0.4, 1, 1,
0.2334345, 0.2399611, -1.061966, 0, 0.3921569, 1, 1,
0.2415181, 1.409727, -0.4653692, 0, 0.3882353, 1, 1,
0.2416535, 0.3593897, 1.058823, 0, 0.3803922, 1, 1,
0.242998, 1.6305, -0.2982557, 0, 0.3764706, 1, 1,
0.2531986, -1.222514, 3.022228, 0, 0.3686275, 1, 1,
0.2576685, -0.175419, 2.745297, 0, 0.3647059, 1, 1,
0.2577956, -0.7051505, 1.342394, 0, 0.3568628, 1, 1,
0.2582483, -0.4779262, 2.473598, 0, 0.3529412, 1, 1,
0.2673423, 1.010723, 0.9879717, 0, 0.345098, 1, 1,
0.2701097, -1.137347, 2.201565, 0, 0.3411765, 1, 1,
0.2703606, 0.4755815, 1.000302, 0, 0.3333333, 1, 1,
0.270831, 0.7828208, -0.2119928, 0, 0.3294118, 1, 1,
0.2713564, 0.9497994, 0.7800896, 0, 0.3215686, 1, 1,
0.2728931, 0.6436077, -1.594701, 0, 0.3176471, 1, 1,
0.2734816, -0.901579, 3.389296, 0, 0.3098039, 1, 1,
0.2747136, 0.7275115, 2.728825, 0, 0.3058824, 1, 1,
0.2773784, -1.139804, 0.1942566, 0, 0.2980392, 1, 1,
0.2778609, -1.378391, 4.386893, 0, 0.2901961, 1, 1,
0.2780437, 0.6163813, 2.285852, 0, 0.2862745, 1, 1,
0.2798726, -0.6060548, 2.642475, 0, 0.2784314, 1, 1,
0.2857804, -1.031471, 3.51736, 0, 0.2745098, 1, 1,
0.2893493, 0.5524221, -1.549432, 0, 0.2666667, 1, 1,
0.2939324, -0.7134799, 2.67061, 0, 0.2627451, 1, 1,
0.2953131, -0.9477357, 2.527449, 0, 0.254902, 1, 1,
0.2968141, 0.1436055, -0.9317596, 0, 0.2509804, 1, 1,
0.2971127, -0.4653751, 2.060475, 0, 0.2431373, 1, 1,
0.3035165, 0.09864596, -0.3319454, 0, 0.2392157, 1, 1,
0.3056062, 1.555723, 0.3076256, 0, 0.2313726, 1, 1,
0.3120837, 0.03228991, -0.7027273, 0, 0.227451, 1, 1,
0.3128579, 1.056282, 0.3241099, 0, 0.2196078, 1, 1,
0.3188772, -1.34761, 3.840801, 0, 0.2156863, 1, 1,
0.3197546, 0.766102, -0.681694, 0, 0.2078431, 1, 1,
0.3208886, -0.9861909, 3.297711, 0, 0.2039216, 1, 1,
0.3214455, 2.365231, 0.2230034, 0, 0.1960784, 1, 1,
0.3284446, -0.1907198, 4.105585, 0, 0.1882353, 1, 1,
0.328594, 0.3032986, 2.05345, 0, 0.1843137, 1, 1,
0.3293299, 1.048915, 0.1853254, 0, 0.1764706, 1, 1,
0.3322571, 1.021028, 1.081779, 0, 0.172549, 1, 1,
0.3334914, -0.4973318, 2.726357, 0, 0.1647059, 1, 1,
0.3380103, 0.03330206, 1.273612, 0, 0.1607843, 1, 1,
0.338288, 1.659836, 0.417481, 0, 0.1529412, 1, 1,
0.3400713, 2.088161, 1.24694, 0, 0.1490196, 1, 1,
0.341766, 0.03076046, 0.06450358, 0, 0.1411765, 1, 1,
0.3505057, 1.388811, -0.425797, 0, 0.1372549, 1, 1,
0.3513314, -0.4097727, 3.21213, 0, 0.1294118, 1, 1,
0.3555814, 1.19754, 0.5886273, 0, 0.1254902, 1, 1,
0.3610786, 0.277494, 0.3681273, 0, 0.1176471, 1, 1,
0.3620878, 0.7100448, 0.9103602, 0, 0.1137255, 1, 1,
0.3629895, -1.611151, 2.211062, 0, 0.1058824, 1, 1,
0.3643118, -0.6798701, 4.078563, 0, 0.09803922, 1, 1,
0.3655862, 0.06173627, 1.210321, 0, 0.09411765, 1, 1,
0.3669387, -0.5974802, 4.093233, 0, 0.08627451, 1, 1,
0.3689662, 0.06247915, 2.063001, 0, 0.08235294, 1, 1,
0.3795702, -1.863723, 4.496593, 0, 0.07450981, 1, 1,
0.3825942, -0.8872321, 3.110645, 0, 0.07058824, 1, 1,
0.3831453, 0.6396407, 0.9001764, 0, 0.0627451, 1, 1,
0.3876695, -0.327199, 2.955408, 0, 0.05882353, 1, 1,
0.3919453, 1.940992, 0.4687832, 0, 0.05098039, 1, 1,
0.3934588, 0.1379486, 0.5892068, 0, 0.04705882, 1, 1,
0.4016841, -0.8834934, 1.564126, 0, 0.03921569, 1, 1,
0.4052845, -0.2905309, 2.743788, 0, 0.03529412, 1, 1,
0.4088621, -0.8350013, 3.199948, 0, 0.02745098, 1, 1,
0.4215169, 0.06862587, 1.77672, 0, 0.02352941, 1, 1,
0.4222491, -0.8171755, 1.99808, 0, 0.01568628, 1, 1,
0.423441, 0.0628114, 3.151893, 0, 0.01176471, 1, 1,
0.4265007, -1.904392, 3.769551, 0, 0.003921569, 1, 1,
0.4275914, 0.2759351, 1.26922, 0.003921569, 0, 1, 1,
0.4304893, -0.0533825, 0.5134986, 0.007843138, 0, 1, 1,
0.43273, -1.367083, 3.389532, 0.01568628, 0, 1, 1,
0.4334939, 0.1882156, 1.899611, 0.01960784, 0, 1, 1,
0.4389111, -1.369651, 3.34816, 0.02745098, 0, 1, 1,
0.4405201, 3.034226, -1.260102, 0.03137255, 0, 1, 1,
0.444892, 2.28239, 0.6130959, 0.03921569, 0, 1, 1,
0.4450259, -0.2021549, 2.687685, 0.04313726, 0, 1, 1,
0.4474553, -0.2045533, 1.582961, 0.05098039, 0, 1, 1,
0.4486483, -0.3071377, 2.68038, 0.05490196, 0, 1, 1,
0.4506338, -0.7696378, 1.493137, 0.0627451, 0, 1, 1,
0.4626039, 0.2053835, 3.830891, 0.06666667, 0, 1, 1,
0.4639619, 0.1925715, 1.077686, 0.07450981, 0, 1, 1,
0.4646919, -0.3093497, 1.921529, 0.07843138, 0, 1, 1,
0.4710615, 0.8921911, 0.5586649, 0.08627451, 0, 1, 1,
0.4743922, -0.7839947, 2.456768, 0.09019608, 0, 1, 1,
0.4766833, -2.787446, 2.687425, 0.09803922, 0, 1, 1,
0.4775346, -0.8702476, 2.286185, 0.1058824, 0, 1, 1,
0.4816352, -0.6438833, 3.133293, 0.1098039, 0, 1, 1,
0.4825612, 1.081029, -1.027715, 0.1176471, 0, 1, 1,
0.4837264, -2.138368, 2.848243, 0.1215686, 0, 1, 1,
0.4852466, -1.430123, 3.567885, 0.1294118, 0, 1, 1,
0.4865175, -0.3688972, 2.076574, 0.1333333, 0, 1, 1,
0.4892361, 0.6429359, 1.353375, 0.1411765, 0, 1, 1,
0.4915705, -0.1935305, 1.227456, 0.145098, 0, 1, 1,
0.4927365, 1.276415, 0.4454487, 0.1529412, 0, 1, 1,
0.4930867, 1.870371, -0.7515413, 0.1568628, 0, 1, 1,
0.5001085, -0.4476551, 3.711202, 0.1647059, 0, 1, 1,
0.5021663, -0.8727745, 3.169064, 0.1686275, 0, 1, 1,
0.5029446, -0.6316165, 0.6003037, 0.1764706, 0, 1, 1,
0.5082194, -0.5502738, 1.672999, 0.1803922, 0, 1, 1,
0.5094084, -2.771539, 4.483945, 0.1882353, 0, 1, 1,
0.5125276, 0.1180618, -0.7501521, 0.1921569, 0, 1, 1,
0.5126605, -1.032511, 1.958284, 0.2, 0, 1, 1,
0.513866, 1.457517, 0.8052703, 0.2078431, 0, 1, 1,
0.5166004, -1.534758, 2.876126, 0.2117647, 0, 1, 1,
0.5194669, 0.3080713, 1.231271, 0.2196078, 0, 1, 1,
0.5198985, -0.7471387, 3.583769, 0.2235294, 0, 1, 1,
0.5201393, 1.725979, 2.099248, 0.2313726, 0, 1, 1,
0.5217194, 1.293493, -1.143424, 0.2352941, 0, 1, 1,
0.524242, -1.527856, 3.25395, 0.2431373, 0, 1, 1,
0.5254599, -0.9144637, 2.019808, 0.2470588, 0, 1, 1,
0.5297937, -1.259779, 3.278263, 0.254902, 0, 1, 1,
0.530993, -0.1785353, 2.610023, 0.2588235, 0, 1, 1,
0.5333232, 0.3362591, 0.7319342, 0.2666667, 0, 1, 1,
0.5340501, 0.8588567, 1.859657, 0.2705882, 0, 1, 1,
0.5343087, -0.1621211, 0.5129763, 0.2784314, 0, 1, 1,
0.5365669, -0.6694807, 1.860161, 0.282353, 0, 1, 1,
0.5454768, 1.993299, -0.2200235, 0.2901961, 0, 1, 1,
0.5492133, -0.1521542, 2.955735, 0.2941177, 0, 1, 1,
0.5503184, 0.6843516, 2.78534, 0.3019608, 0, 1, 1,
0.5534018, -1.106666, 1.174091, 0.3098039, 0, 1, 1,
0.5537526, -0.8559715, 3.40881, 0.3137255, 0, 1, 1,
0.5617715, -0.2572927, 2.002002, 0.3215686, 0, 1, 1,
0.5626681, -0.5737837, 1.562387, 0.3254902, 0, 1, 1,
0.5646791, 0.2323825, 0.7533929, 0.3333333, 0, 1, 1,
0.5759559, 0.1874302, 2.007272, 0.3372549, 0, 1, 1,
0.5809362, -0.6955881, 2.94896, 0.345098, 0, 1, 1,
0.5827787, -0.9568717, -0.5752699, 0.3490196, 0, 1, 1,
0.585685, 0.7638668, 0.3750865, 0.3568628, 0, 1, 1,
0.5875162, 0.9334472, 0.6422824, 0.3607843, 0, 1, 1,
0.5878147, -0.5578956, 2.191327, 0.3686275, 0, 1, 1,
0.5896868, 0.7536605, -0.4552843, 0.372549, 0, 1, 1,
0.5942832, 0.3349082, -0.3053785, 0.3803922, 0, 1, 1,
0.5998498, 0.2526328, 1.604593, 0.3843137, 0, 1, 1,
0.6040691, -0.9832759, 1.526445, 0.3921569, 0, 1, 1,
0.6047414, 0.0658726, 2.650878, 0.3960784, 0, 1, 1,
0.6106694, 0.3837665, 0.5296799, 0.4039216, 0, 1, 1,
0.6126679, 0.06172775, 0.6397997, 0.4117647, 0, 1, 1,
0.6170045, -0.9603603, 2.765364, 0.4156863, 0, 1, 1,
0.6201605, -1.018987, 1.075099, 0.4235294, 0, 1, 1,
0.6318496, 1.145577, -1.567277, 0.427451, 0, 1, 1,
0.6347751, -0.1018874, 3.050386, 0.4352941, 0, 1, 1,
0.6380062, -0.231599, -0.4343321, 0.4392157, 0, 1, 1,
0.6396174, 1.288912, 0.2936583, 0.4470588, 0, 1, 1,
0.6399971, -2.474991, 0.5264003, 0.4509804, 0, 1, 1,
0.6416037, 0.8104236, 1.015042, 0.4588235, 0, 1, 1,
0.6419059, -0.3092225, 1.532848, 0.4627451, 0, 1, 1,
0.6491412, -0.7134162, 3.138384, 0.4705882, 0, 1, 1,
0.6511956, -0.93396, 1.316941, 0.4745098, 0, 1, 1,
0.6518309, -2.042137, 2.472221, 0.4823529, 0, 1, 1,
0.6613566, 0.6472365, 0.5329037, 0.4862745, 0, 1, 1,
0.6627871, 0.8014274, 0.06519316, 0.4941176, 0, 1, 1,
0.6648005, 0.006852733, 1.3179, 0.5019608, 0, 1, 1,
0.6667034, 0.1184549, 0.0295988, 0.5058824, 0, 1, 1,
0.6720359, -1.269845, 0.4984606, 0.5137255, 0, 1, 1,
0.6791751, 0.6593698, 0.888994, 0.5176471, 0, 1, 1,
0.6802464, -0.3607064, 1.330167, 0.5254902, 0, 1, 1,
0.6807651, 0.06861223, 0.7296105, 0.5294118, 0, 1, 1,
0.6832363, 0.08354778, 0.634317, 0.5372549, 0, 1, 1,
0.6848268, 0.440372, 1.745571, 0.5411765, 0, 1, 1,
0.6906992, -1.403886, 3.562377, 0.5490196, 0, 1, 1,
0.6945301, -0.861407, 2.879287, 0.5529412, 0, 1, 1,
0.6961585, -1.272312, 2.987411, 0.5607843, 0, 1, 1,
0.6978167, 0.4229031, 1.360903, 0.5647059, 0, 1, 1,
0.700492, -1.278006, 4.942326, 0.572549, 0, 1, 1,
0.7086901, 1.380589, 0.06115201, 0.5764706, 0, 1, 1,
0.7206367, 0.0571719, 1.489855, 0.5843138, 0, 1, 1,
0.7213136, 0.7124552, -0.2270246, 0.5882353, 0, 1, 1,
0.7220945, 0.6356064, -0.2066854, 0.5960785, 0, 1, 1,
0.7231659, 0.1852984, 1.689324, 0.6039216, 0, 1, 1,
0.7269856, 1.501647, 0.9536056, 0.6078432, 0, 1, 1,
0.7281496, 0.5020805, 1.757466, 0.6156863, 0, 1, 1,
0.7328112, 1.176976, -0.2973442, 0.6196079, 0, 1, 1,
0.733672, -0.3450828, 1.313648, 0.627451, 0, 1, 1,
0.7420238, 1.376604, -0.5035543, 0.6313726, 0, 1, 1,
0.7590761, -1.670652, 2.484724, 0.6392157, 0, 1, 1,
0.7604048, -0.7785877, 1.520246, 0.6431373, 0, 1, 1,
0.762632, 0.105727, -1.038481, 0.6509804, 0, 1, 1,
0.7642292, -0.304674, 2.768405, 0.654902, 0, 1, 1,
0.7656488, -2.020643, 3.494955, 0.6627451, 0, 1, 1,
0.7677628, 2.027038, 3.270293, 0.6666667, 0, 1, 1,
0.7720107, -0.7730848, 1.434151, 0.6745098, 0, 1, 1,
0.7780621, 1.450618, 0.716072, 0.6784314, 0, 1, 1,
0.7828359, -1.498055, 2.681657, 0.6862745, 0, 1, 1,
0.7849315, -1.790841, 3.905825, 0.6901961, 0, 1, 1,
0.7920371, 0.24365, 0.6078396, 0.6980392, 0, 1, 1,
0.7925876, -0.9309695, 1.332458, 0.7058824, 0, 1, 1,
0.7959281, -0.3107691, 1.404611, 0.7098039, 0, 1, 1,
0.8013615, -0.4491329, -0.8932104, 0.7176471, 0, 1, 1,
0.8035058, 1.649106, -0.4060336, 0.7215686, 0, 1, 1,
0.8106133, -0.9997078, 2.357435, 0.7294118, 0, 1, 1,
0.8112532, 1.051791, 0.3760584, 0.7333333, 0, 1, 1,
0.8120197, 0.3763918, 1.895783, 0.7411765, 0, 1, 1,
0.8124587, 0.02286051, 0.1051246, 0.7450981, 0, 1, 1,
0.8137665, 2.050794, 0.07323806, 0.7529412, 0, 1, 1,
0.8215923, 0.1512293, 0.2794243, 0.7568628, 0, 1, 1,
0.8252798, 0.1309215, 0.445133, 0.7647059, 0, 1, 1,
0.826088, -0.6042539, 1.815372, 0.7686275, 0, 1, 1,
0.8288282, -1.275627, 1.968501, 0.7764706, 0, 1, 1,
0.8312255, 0.9116437, 1.426071, 0.7803922, 0, 1, 1,
0.8375188, -0.0469096, 0.9146816, 0.7882353, 0, 1, 1,
0.8377304, -0.6115103, 1.008564, 0.7921569, 0, 1, 1,
0.837797, 0.6957313, 0.8227029, 0.8, 0, 1, 1,
0.839016, 1.452284, 0.2692596, 0.8078431, 0, 1, 1,
0.8401909, 0.4521965, 2.159239, 0.8117647, 0, 1, 1,
0.8410746, 0.5681192, 0.874786, 0.8196079, 0, 1, 1,
0.8490371, -0.2539713, 2.132775, 0.8235294, 0, 1, 1,
0.8504312, 1.44081, -0.4475625, 0.8313726, 0, 1, 1,
0.8541951, -0.8322552, 1.02739, 0.8352941, 0, 1, 1,
0.8559807, -2.048146, 4.743864, 0.8431373, 0, 1, 1,
0.861711, 0.5933453, 0.7154671, 0.8470588, 0, 1, 1,
0.8633487, -0.2801513, 0.7567919, 0.854902, 0, 1, 1,
0.8636103, -0.8255671, 1.853235, 0.8588235, 0, 1, 1,
0.8662573, 2.36835, 1.65431, 0.8666667, 0, 1, 1,
0.877005, -0.6155048, 3.171571, 0.8705882, 0, 1, 1,
0.8821179, 0.9386188, 0.5388479, 0.8784314, 0, 1, 1,
0.8825404, 0.06690253, 1.757408, 0.8823529, 0, 1, 1,
0.8836195, 0.9018158, 1.317709, 0.8901961, 0, 1, 1,
0.8849937, -0.963194, 1.922261, 0.8941177, 0, 1, 1,
0.8896611, 0.03718873, 1.434139, 0.9019608, 0, 1, 1,
0.8915558, -0.3407945, 3.189825, 0.9098039, 0, 1, 1,
0.8977808, 0.4543958, 0.7735268, 0.9137255, 0, 1, 1,
0.8993592, -0.7864633, 2.380517, 0.9215686, 0, 1, 1,
0.9003671, -0.2955966, 1.623122, 0.9254902, 0, 1, 1,
0.903464, -0.2032138, 1.051616, 0.9333333, 0, 1, 1,
0.9035987, -0.04794572, -0.1554435, 0.9372549, 0, 1, 1,
0.9050375, -0.2330383, 2.457393, 0.945098, 0, 1, 1,
0.9178796, -1.360661, 4.220142, 0.9490196, 0, 1, 1,
0.9243916, 0.3632632, 1.839512, 0.9568627, 0, 1, 1,
0.9309061, -0.6498098, 2.299893, 0.9607843, 0, 1, 1,
0.9370219, -0.9162271, 1.275792, 0.9686275, 0, 1, 1,
0.937887, 0.06666331, 3.327233, 0.972549, 0, 1, 1,
0.9379662, -0.2959371, 2.709439, 0.9803922, 0, 1, 1,
0.9420878, -1.197883, 1.858307, 0.9843137, 0, 1, 1,
0.9608567, 0.8521706, -0.6729984, 0.9921569, 0, 1, 1,
0.9618855, 0.2333395, 1.029612, 0.9960784, 0, 1, 1,
0.965747, 0.5561219, 2.830122, 1, 0, 0.9960784, 1,
0.9705783, 0.3963116, 1.472521, 1, 0, 0.9882353, 1,
0.9718385, 0.9230002, 0.561422, 1, 0, 0.9843137, 1,
0.9720755, 2.418869, 0.7292487, 1, 0, 0.9764706, 1,
0.9768022, -0.8154126, 0.941135, 1, 0, 0.972549, 1,
0.9772874, -0.04079987, 0.7255021, 1, 0, 0.9647059, 1,
0.9849371, -0.1297742, 1.83022, 1, 0, 0.9607843, 1,
0.9931857, 0.9989181, 0.799185, 1, 0, 0.9529412, 1,
0.9980056, -0.7880477, 4.018214, 1, 0, 0.9490196, 1,
1.00312, 0.04484594, 0.4887888, 1, 0, 0.9411765, 1,
1.003614, 0.3559933, 1.895277, 1, 0, 0.9372549, 1,
1.005028, -2.216833, 2.150159, 1, 0, 0.9294118, 1,
1.009534, -0.3683307, 1.619249, 1, 0, 0.9254902, 1,
1.013202, -1.639805, 1.276495, 1, 0, 0.9176471, 1,
1.015325, -0.1078736, 1.227325, 1, 0, 0.9137255, 1,
1.019196, 0.03839485, 1.556252, 1, 0, 0.9058824, 1,
1.022022, 1.280903, 0.1454087, 1, 0, 0.9019608, 1,
1.024872, 1.277947, 0.5559899, 1, 0, 0.8941177, 1,
1.025919, -0.9457568, 2.627248, 1, 0, 0.8862745, 1,
1.027039, 0.3618874, 2.410725, 1, 0, 0.8823529, 1,
1.034868, -1.567001, 1.573231, 1, 0, 0.8745098, 1,
1.036012, 0.04646187, 0.3106492, 1, 0, 0.8705882, 1,
1.03949, -0.9552968, 4.065872, 1, 0, 0.8627451, 1,
1.042025, 1.791599, 0.8573737, 1, 0, 0.8588235, 1,
1.046774, -0.6943117, 1.631099, 1, 0, 0.8509804, 1,
1.053067, 0.04822313, 0.7933667, 1, 0, 0.8470588, 1,
1.05871, 1.689429, 0.9537484, 1, 0, 0.8392157, 1,
1.060145, -0.1307718, 1.329566, 1, 0, 0.8352941, 1,
1.060165, -1.047349, 3.357593, 1, 0, 0.827451, 1,
1.064336, -0.7935181, 3.311713, 1, 0, 0.8235294, 1,
1.0677, -0.669096, 2.4519, 1, 0, 0.8156863, 1,
1.078995, -0.8173624, 3.59563, 1, 0, 0.8117647, 1,
1.081855, 0.06739634, 1.705421, 1, 0, 0.8039216, 1,
1.082948, -1.080407, 2.965327, 1, 0, 0.7960784, 1,
1.084948, 0.4756113, 1.4913, 1, 0, 0.7921569, 1,
1.087202, 1.755867, 1.46293, 1, 0, 0.7843137, 1,
1.105027, 0.1920342, 2.485479, 1, 0, 0.7803922, 1,
1.115992, 0.04720759, 2.032813, 1, 0, 0.772549, 1,
1.11601, -1.329827, 0.8788185, 1, 0, 0.7686275, 1,
1.118454, -0.1717254, 1.211225, 1, 0, 0.7607843, 1,
1.122449, -0.5272654, 1.208876, 1, 0, 0.7568628, 1,
1.123136, 0.367934, -0.5905465, 1, 0, 0.7490196, 1,
1.124041, 0.6640447, 2.70501, 1, 0, 0.7450981, 1,
1.137772, 0.3709641, 4.363378, 1, 0, 0.7372549, 1,
1.138798, -1.020946, 2.816547, 1, 0, 0.7333333, 1,
1.139006, 0.4541361, 2.414397, 1, 0, 0.7254902, 1,
1.141345, -0.4370682, 2.418646, 1, 0, 0.7215686, 1,
1.146795, -0.4236182, 2.1448, 1, 0, 0.7137255, 1,
1.157806, -1.330133, 2.793938, 1, 0, 0.7098039, 1,
1.158295, 1.129648, 0.4855567, 1, 0, 0.7019608, 1,
1.158498, 0.200652, 1.149655, 1, 0, 0.6941177, 1,
1.161825, 0.7901928, 2.242589, 1, 0, 0.6901961, 1,
1.16669, 0.6067007, 0.6945278, 1, 0, 0.682353, 1,
1.166691, -1.414324, 2.525067, 1, 0, 0.6784314, 1,
1.175273, -0.4191006, 3.021003, 1, 0, 0.6705883, 1,
1.175455, 1.991797, 0.8619512, 1, 0, 0.6666667, 1,
1.177049, -0.8133835, 3.82106, 1, 0, 0.6588235, 1,
1.179886, -0.573778, 2.791401, 1, 0, 0.654902, 1,
1.191279, -0.8731536, 3.075861, 1, 0, 0.6470588, 1,
1.197922, -0.3264469, 3.333515, 1, 0, 0.6431373, 1,
1.208866, 1.316899, 1.252049, 1, 0, 0.6352941, 1,
1.213463, -1.03112, 1.634794, 1, 0, 0.6313726, 1,
1.217791, -0.3053508, 2.549121, 1, 0, 0.6235294, 1,
1.227281, -0.8853825, 2.54656, 1, 0, 0.6196079, 1,
1.244463, -0.2666928, 1.045835, 1, 0, 0.6117647, 1,
1.248377, 0.001312491, 0.7224978, 1, 0, 0.6078432, 1,
1.249918, 0.3414399, 1.166563, 1, 0, 0.6, 1,
1.25636, -0.5194487, 1.201665, 1, 0, 0.5921569, 1,
1.273246, 1.08652, 1.606676, 1, 0, 0.5882353, 1,
1.273855, 0.9387816, 0.5002837, 1, 0, 0.5803922, 1,
1.276276, -0.4876136, 3.49595, 1, 0, 0.5764706, 1,
1.279902, 0.8787881, 1.23568, 1, 0, 0.5686275, 1,
1.297452, -0.538556, 2.342532, 1, 0, 0.5647059, 1,
1.304876, 0.1379354, 1.199338, 1, 0, 0.5568628, 1,
1.305664, 0.06484941, 2.245471, 1, 0, 0.5529412, 1,
1.306438, 0.5359902, 2.166682, 1, 0, 0.5450981, 1,
1.309986, -0.03865776, -0.03839656, 1, 0, 0.5411765, 1,
1.310072, -0.3227958, 1.848601, 1, 0, 0.5333334, 1,
1.310185, -1.299835, 0.991199, 1, 0, 0.5294118, 1,
1.312839, -0.4043407, 0.3737831, 1, 0, 0.5215687, 1,
1.314354, 0.9139063, 0.8280396, 1, 0, 0.5176471, 1,
1.315725, -0.134307, -1.247118, 1, 0, 0.509804, 1,
1.317441, -0.2722599, 1.54061, 1, 0, 0.5058824, 1,
1.344562, -0.4982125, 3.395069, 1, 0, 0.4980392, 1,
1.358255, 0.779312, 1.420137, 1, 0, 0.4901961, 1,
1.371256, -1.060527, 1.551176, 1, 0, 0.4862745, 1,
1.376052, 0.6975005, 1.53093, 1, 0, 0.4784314, 1,
1.376289, 0.6690068, 3.39017, 1, 0, 0.4745098, 1,
1.376302, -0.9105124, 2.385515, 1, 0, 0.4666667, 1,
1.388379, -0.3338916, 1.356543, 1, 0, 0.4627451, 1,
1.392321, -0.252166, 1.908111, 1, 0, 0.454902, 1,
1.393618, -0.06676217, 1.945422, 1, 0, 0.4509804, 1,
1.396257, -1.71189, 5.158317, 1, 0, 0.4431373, 1,
1.409631, 0.3998909, 2.011475, 1, 0, 0.4392157, 1,
1.416143, 0.6662841, 0.4311104, 1, 0, 0.4313726, 1,
1.420948, 0.6512032, 0.8734598, 1, 0, 0.427451, 1,
1.428943, -0.6957334, 1.150717, 1, 0, 0.4196078, 1,
1.432559, -0.8910198, 1.99956, 1, 0, 0.4156863, 1,
1.438468, -1.674606, 2.099257, 1, 0, 0.4078431, 1,
1.444608, 0.7629256, 0.1402248, 1, 0, 0.4039216, 1,
1.449969, 0.02479749, -0.5910931, 1, 0, 0.3960784, 1,
1.450912, -0.1819481, 0.4848876, 1, 0, 0.3882353, 1,
1.452509, -0.6740445, 1.276599, 1, 0, 0.3843137, 1,
1.468536, -1.778249, 4.351426, 1, 0, 0.3764706, 1,
1.477332, -0.837994, 3.730424, 1, 0, 0.372549, 1,
1.47959, 0.08307303, 1.390466, 1, 0, 0.3647059, 1,
1.480631, 2.616673, 2.133638, 1, 0, 0.3607843, 1,
1.482142, 0.7501985, 1.97414, 1, 0, 0.3529412, 1,
1.508423, -0.05274353, 1.105702, 1, 0, 0.3490196, 1,
1.512697, 0.4252922, 0.599213, 1, 0, 0.3411765, 1,
1.524555, -0.5338826, -0.9933131, 1, 0, 0.3372549, 1,
1.533076, 0.8631298, 2.656653, 1, 0, 0.3294118, 1,
1.533185, 0.2276827, 2.586676, 1, 0, 0.3254902, 1,
1.534272, -2.162376, 2.818179, 1, 0, 0.3176471, 1,
1.53632, -0.3673107, 1.847469, 1, 0, 0.3137255, 1,
1.544785, 0.6474122, 0.8349311, 1, 0, 0.3058824, 1,
1.557227, 0.2809167, 1.240291, 1, 0, 0.2980392, 1,
1.565217, 0.02753353, 1.590539, 1, 0, 0.2941177, 1,
1.578363, 0.871505, 2.210994, 1, 0, 0.2862745, 1,
1.592835, -1.090872, 3.439716, 1, 0, 0.282353, 1,
1.606346, -1.264426, 2.317987, 1, 0, 0.2745098, 1,
1.622058, 0.4555238, 1.339532, 1, 0, 0.2705882, 1,
1.645023, -0.3490623, 1.174404, 1, 0, 0.2627451, 1,
1.649264, -1.183291, 1.340155, 1, 0, 0.2588235, 1,
1.661952, 1.299076, 0.851392, 1, 0, 0.2509804, 1,
1.691615, 2.097291, -0.2170867, 1, 0, 0.2470588, 1,
1.691624, -2.364234, 1.986172, 1, 0, 0.2392157, 1,
1.715246, -0.1635294, 2.7348, 1, 0, 0.2352941, 1,
1.720816, -1.260502, 3.201505, 1, 0, 0.227451, 1,
1.758889, 0.0419705, 2.688681, 1, 0, 0.2235294, 1,
1.766393, 1.434745, -0.0554309, 1, 0, 0.2156863, 1,
1.775758, 1.533431, 0.248366, 1, 0, 0.2117647, 1,
1.811699, 0.7061931, 1.483282, 1, 0, 0.2039216, 1,
1.825476, -0.1239701, 3.493704, 1, 0, 0.1960784, 1,
1.828964, 1.634419, 0.5438792, 1, 0, 0.1921569, 1,
1.843446, -0.3362397, 1.699445, 1, 0, 0.1843137, 1,
1.846571, 0.1946659, 0.4605914, 1, 0, 0.1803922, 1,
1.854302, -0.6035282, 1.826986, 1, 0, 0.172549, 1,
1.901455, 0.599252, 1.281505, 1, 0, 0.1686275, 1,
1.931328, -0.921929, 2.924286, 1, 0, 0.1607843, 1,
1.955056, 0.7030079, 3.555716, 1, 0, 0.1568628, 1,
1.9803, -0.9983589, 2.048031, 1, 0, 0.1490196, 1,
1.993542, 0.8506241, 1.498137, 1, 0, 0.145098, 1,
2.000677, -0.1515631, 2.943566, 1, 0, 0.1372549, 1,
2.004695, -0.7051107, 3.896029, 1, 0, 0.1333333, 1,
2.086369, -0.4512942, 1.530327, 1, 0, 0.1254902, 1,
2.096666, 0.9586846, 0.1514153, 1, 0, 0.1215686, 1,
2.123352, -0.8369054, 0.7844158, 1, 0, 0.1137255, 1,
2.136505, -1.130113, 2.234767, 1, 0, 0.1098039, 1,
2.152936, 1.057693, -0.4986113, 1, 0, 0.1019608, 1,
2.158642, -2.033164, 0.8252453, 1, 0, 0.09411765, 1,
2.167545, 0.8556278, 0.9124711, 1, 0, 0.09019608, 1,
2.207926, -1.198125, 2.367145, 1, 0, 0.08235294, 1,
2.21439, -0.1677343, 1.228084, 1, 0, 0.07843138, 1,
2.321265, -0.1440196, 4.20383, 1, 0, 0.07058824, 1,
2.327564, -1.150018, 0.4450401, 1, 0, 0.06666667, 1,
2.352057, 1.46862, 0.1740088, 1, 0, 0.05882353, 1,
2.423708, 1.012201, 1.660195, 1, 0, 0.05490196, 1,
2.449335, 1.086421, 1.359673, 1, 0, 0.04705882, 1,
2.550107, -0.2767358, 1.417525, 1, 0, 0.04313726, 1,
2.581784, -1.765083, 2.79962, 1, 0, 0.03529412, 1,
2.612129, 0.4963802, 1.062787, 1, 0, 0.03137255, 1,
2.623307, 0.7483489, 1.224782, 1, 0, 0.02352941, 1,
2.758475, -0.476515, 0.3280614, 1, 0, 0.01960784, 1,
2.936719, -0.7202018, 0.977713, 1, 0, 0.01176471, 1,
3.437422, -0.2026905, 2.384717, 1, 0, 0.007843138, 1
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
0.1297312, -3.781658, -6.818903, 0, -0.5, 0.5, 0.5,
0.1297312, -3.781658, -6.818903, 1, -0.5, 0.5, 0.5,
0.1297312, -3.781658, -6.818903, 1, 1.5, 0.5, 0.5,
0.1297312, -3.781658, -6.818903, 0, 1.5, 0.5, 0.5
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
-4.299266, 0.1453314, -6.818903, 0, -0.5, 0.5, 0.5,
-4.299266, 0.1453314, -6.818903, 1, -0.5, 0.5, 0.5,
-4.299266, 0.1453314, -6.818903, 1, 1.5, 0.5, 0.5,
-4.299266, 0.1453314, -6.818903, 0, 1.5, 0.5, 0.5
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
-4.299266, -3.781658, 0.03765821, 0, -0.5, 0.5, 0.5,
-4.299266, -3.781658, 0.03765821, 1, -0.5, 0.5, 0.5,
-4.299266, -3.781658, 0.03765821, 1, 1.5, 0.5, 0.5,
-4.299266, -3.781658, 0.03765821, 0, 1.5, 0.5, 0.5
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
-3, -2.87543, -5.23662,
3, -2.87543, -5.23662,
-3, -2.87543, -5.23662,
-3, -3.026468, -5.500334,
-2, -2.87543, -5.23662,
-2, -3.026468, -5.500334,
-1, -2.87543, -5.23662,
-1, -3.026468, -5.500334,
0, -2.87543, -5.23662,
0, -3.026468, -5.500334,
1, -2.87543, -5.23662,
1, -3.026468, -5.500334,
2, -2.87543, -5.23662,
2, -3.026468, -5.500334,
3, -2.87543, -5.23662,
3, -3.026468, -5.500334
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
-3, -3.328544, -6.027761, 0, -0.5, 0.5, 0.5,
-3, -3.328544, -6.027761, 1, -0.5, 0.5, 0.5,
-3, -3.328544, -6.027761, 1, 1.5, 0.5, 0.5,
-3, -3.328544, -6.027761, 0, 1.5, 0.5, 0.5,
-2, -3.328544, -6.027761, 0, -0.5, 0.5, 0.5,
-2, -3.328544, -6.027761, 1, -0.5, 0.5, 0.5,
-2, -3.328544, -6.027761, 1, 1.5, 0.5, 0.5,
-2, -3.328544, -6.027761, 0, 1.5, 0.5, 0.5,
-1, -3.328544, -6.027761, 0, -0.5, 0.5, 0.5,
-1, -3.328544, -6.027761, 1, -0.5, 0.5, 0.5,
-1, -3.328544, -6.027761, 1, 1.5, 0.5, 0.5,
-1, -3.328544, -6.027761, 0, 1.5, 0.5, 0.5,
0, -3.328544, -6.027761, 0, -0.5, 0.5, 0.5,
0, -3.328544, -6.027761, 1, -0.5, 0.5, 0.5,
0, -3.328544, -6.027761, 1, 1.5, 0.5, 0.5,
0, -3.328544, -6.027761, 0, 1.5, 0.5, 0.5,
1, -3.328544, -6.027761, 0, -0.5, 0.5, 0.5,
1, -3.328544, -6.027761, 1, -0.5, 0.5, 0.5,
1, -3.328544, -6.027761, 1, 1.5, 0.5, 0.5,
1, -3.328544, -6.027761, 0, 1.5, 0.5, 0.5,
2, -3.328544, -6.027761, 0, -0.5, 0.5, 0.5,
2, -3.328544, -6.027761, 1, -0.5, 0.5, 0.5,
2, -3.328544, -6.027761, 1, 1.5, 0.5, 0.5,
2, -3.328544, -6.027761, 0, 1.5, 0.5, 0.5,
3, -3.328544, -6.027761, 0, -0.5, 0.5, 0.5,
3, -3.328544, -6.027761, 1, -0.5, 0.5, 0.5,
3, -3.328544, -6.027761, 1, 1.5, 0.5, 0.5,
3, -3.328544, -6.027761, 0, 1.5, 0.5, 0.5
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
-3.27719, -2, -5.23662,
-3.27719, 3, -5.23662,
-3.27719, -2, -5.23662,
-3.447536, -2, -5.500334,
-3.27719, -1, -5.23662,
-3.447536, -1, -5.500334,
-3.27719, 0, -5.23662,
-3.447536, 0, -5.500334,
-3.27719, 1, -5.23662,
-3.447536, 1, -5.500334,
-3.27719, 2, -5.23662,
-3.447536, 2, -5.500334,
-3.27719, 3, -5.23662,
-3.447536, 3, -5.500334
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
-3.788228, -2, -6.027761, 0, -0.5, 0.5, 0.5,
-3.788228, -2, -6.027761, 1, -0.5, 0.5, 0.5,
-3.788228, -2, -6.027761, 1, 1.5, 0.5, 0.5,
-3.788228, -2, -6.027761, 0, 1.5, 0.5, 0.5,
-3.788228, -1, -6.027761, 0, -0.5, 0.5, 0.5,
-3.788228, -1, -6.027761, 1, -0.5, 0.5, 0.5,
-3.788228, -1, -6.027761, 1, 1.5, 0.5, 0.5,
-3.788228, -1, -6.027761, 0, 1.5, 0.5, 0.5,
-3.788228, 0, -6.027761, 0, -0.5, 0.5, 0.5,
-3.788228, 0, -6.027761, 1, -0.5, 0.5, 0.5,
-3.788228, 0, -6.027761, 1, 1.5, 0.5, 0.5,
-3.788228, 0, -6.027761, 0, 1.5, 0.5, 0.5,
-3.788228, 1, -6.027761, 0, -0.5, 0.5, 0.5,
-3.788228, 1, -6.027761, 1, -0.5, 0.5, 0.5,
-3.788228, 1, -6.027761, 1, 1.5, 0.5, 0.5,
-3.788228, 1, -6.027761, 0, 1.5, 0.5, 0.5,
-3.788228, 2, -6.027761, 0, -0.5, 0.5, 0.5,
-3.788228, 2, -6.027761, 1, -0.5, 0.5, 0.5,
-3.788228, 2, -6.027761, 1, 1.5, 0.5, 0.5,
-3.788228, 2, -6.027761, 0, 1.5, 0.5, 0.5,
-3.788228, 3, -6.027761, 0, -0.5, 0.5, 0.5,
-3.788228, 3, -6.027761, 1, -0.5, 0.5, 0.5,
-3.788228, 3, -6.027761, 1, 1.5, 0.5, 0.5,
-3.788228, 3, -6.027761, 0, 1.5, 0.5, 0.5
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
-3.27719, -2.87543, -4,
-3.27719, -2.87543, 4,
-3.27719, -2.87543, -4,
-3.447536, -3.026468, -4,
-3.27719, -2.87543, -2,
-3.447536, -3.026468, -2,
-3.27719, -2.87543, 0,
-3.447536, -3.026468, 0,
-3.27719, -2.87543, 2,
-3.447536, -3.026468, 2,
-3.27719, -2.87543, 4,
-3.447536, -3.026468, 4
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
-3.788228, -3.328544, -4, 0, -0.5, 0.5, 0.5,
-3.788228, -3.328544, -4, 1, -0.5, 0.5, 0.5,
-3.788228, -3.328544, -4, 1, 1.5, 0.5, 0.5,
-3.788228, -3.328544, -4, 0, 1.5, 0.5, 0.5,
-3.788228, -3.328544, -2, 0, -0.5, 0.5, 0.5,
-3.788228, -3.328544, -2, 1, -0.5, 0.5, 0.5,
-3.788228, -3.328544, -2, 1, 1.5, 0.5, 0.5,
-3.788228, -3.328544, -2, 0, 1.5, 0.5, 0.5,
-3.788228, -3.328544, 0, 0, -0.5, 0.5, 0.5,
-3.788228, -3.328544, 0, 1, -0.5, 0.5, 0.5,
-3.788228, -3.328544, 0, 1, 1.5, 0.5, 0.5,
-3.788228, -3.328544, 0, 0, 1.5, 0.5, 0.5,
-3.788228, -3.328544, 2, 0, -0.5, 0.5, 0.5,
-3.788228, -3.328544, 2, 1, -0.5, 0.5, 0.5,
-3.788228, -3.328544, 2, 1, 1.5, 0.5, 0.5,
-3.788228, -3.328544, 2, 0, 1.5, 0.5, 0.5,
-3.788228, -3.328544, 4, 0, -0.5, 0.5, 0.5,
-3.788228, -3.328544, 4, 1, -0.5, 0.5, 0.5,
-3.788228, -3.328544, 4, 1, 1.5, 0.5, 0.5,
-3.788228, -3.328544, 4, 0, 1.5, 0.5, 0.5
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
-3.27719, -2.87543, -5.23662,
-3.27719, 3.166093, -5.23662,
-3.27719, -2.87543, 5.311936,
-3.27719, 3.166093, 5.311936,
-3.27719, -2.87543, -5.23662,
-3.27719, -2.87543, 5.311936,
-3.27719, 3.166093, -5.23662,
-3.27719, 3.166093, 5.311936,
-3.27719, -2.87543, -5.23662,
3.536652, -2.87543, -5.23662,
-3.27719, -2.87543, 5.311936,
3.536652, -2.87543, 5.311936,
-3.27719, 3.166093, -5.23662,
3.536652, 3.166093, -5.23662,
-3.27719, 3.166093, 5.311936,
3.536652, 3.166093, 5.311936,
3.536652, -2.87543, -5.23662,
3.536652, 3.166093, -5.23662,
3.536652, -2.87543, 5.311936,
3.536652, 3.166093, 5.311936,
3.536652, -2.87543, -5.23662,
3.536652, -2.87543, 5.311936,
3.536652, 3.166093, -5.23662,
3.536652, 3.166093, 5.311936
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
var radius = 7.441331;
var distance = 33.10732;
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
mvMatrix.translate( -0.1297312, -0.1453314, -0.03765821 );
mvMatrix.scale( 1.180789, 1.331736, 0.7627312 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.10732);
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
ethofumesate<-read.table("ethofumesate.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-ethofumesate$V2
```

```
## Error in eval(expr, envir, enclos): object 'ethofumesate' not found
```

```r
y<-ethofumesate$V3
```

```
## Error in eval(expr, envir, enclos): object 'ethofumesate' not found
```

```r
z<-ethofumesate$V4
```

```
## Error in eval(expr, envir, enclos): object 'ethofumesate' not found
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
-3.177959, 1.360993, -3.6532, 0, 0, 1, 1, 1,
-2.641332, 1.297407, -0.7220806, 1, 0, 0, 1, 1,
-2.630398, -0.2586074, -0.6435809, 1, 0, 0, 1, 1,
-2.547542, -0.161399, -1.631365, 1, 0, 0, 1, 1,
-2.461996, 0.3862792, 1.416399, 1, 0, 0, 1, 1,
-2.432228, -0.2193885, 0.006571534, 1, 0, 0, 1, 1,
-2.370181, 1.073251, -2.674673, 0, 0, 0, 1, 1,
-2.31032, -0.7730204, -2.618318, 0, 0, 0, 1, 1,
-2.276156, -0.6191545, -1.736694, 0, 0, 0, 1, 1,
-2.26007, -1.464558, -3.855615, 0, 0, 0, 1, 1,
-2.235626, 1.148886, -1.638366, 0, 0, 0, 1, 1,
-2.180011, 1.404329, -1.632923, 0, 0, 0, 1, 1,
-2.163681, 1.132311, -1.200905, 0, 0, 0, 1, 1,
-2.145806, 1.36994, -1.126732, 1, 1, 1, 1, 1,
-2.118274, 0.4862812, 0.4727767, 1, 1, 1, 1, 1,
-2.10707, -0.7314834, -3.386863, 1, 1, 1, 1, 1,
-2.09972, 0.7558235, -2.297959, 1, 1, 1, 1, 1,
-2.087495, -0.113916, -0.6080824, 1, 1, 1, 1, 1,
-2.072071, 1.554728, -1.833621, 1, 1, 1, 1, 1,
-2.022421, -0.08260875, -1.329337, 1, 1, 1, 1, 1,
-2.001503, 0.0190914, -2.939407, 1, 1, 1, 1, 1,
-1.997103, -1.249333, -0.6927581, 1, 1, 1, 1, 1,
-1.965347, 0.3947709, 0.116507, 1, 1, 1, 1, 1,
-1.908297, -1.139333, -2.903567, 1, 1, 1, 1, 1,
-1.90721, 1.266508, -1.603567, 1, 1, 1, 1, 1,
-1.904179, 0.2995781, -0.2178506, 1, 1, 1, 1, 1,
-1.888136, 0.2422376, -1.429929, 1, 1, 1, 1, 1,
-1.869071, 0.1625916, 0.002931861, 1, 1, 1, 1, 1,
-1.859069, -1.813541, -2.961179, 0, 0, 1, 1, 1,
-1.856723, -0.7700697, -0.8561208, 1, 0, 0, 1, 1,
-1.856564, 0.0797788, -1.318549, 1, 0, 0, 1, 1,
-1.843829, -0.2161895, -1.716841, 1, 0, 0, 1, 1,
-1.839596, 0.3261157, -2.639871, 1, 0, 0, 1, 1,
-1.838474, 1.067338, -1.222868, 1, 0, 0, 1, 1,
-1.810681, -1.970666, -2.72892, 0, 0, 0, 1, 1,
-1.781585, -1.720897, -2.488657, 0, 0, 0, 1, 1,
-1.774262, -0.8025889, -1.692914, 0, 0, 0, 1, 1,
-1.766027, -0.09897039, -0.4169878, 0, 0, 0, 1, 1,
-1.750886, -1.439784, -2.920207, 0, 0, 0, 1, 1,
-1.743493, 0.5903045, 0.2098096, 0, 0, 0, 1, 1,
-1.726091, -0.7297276, -0.4977092, 0, 0, 0, 1, 1,
-1.717569, 1.405061, -0.9232976, 1, 1, 1, 1, 1,
-1.70854, -1.829444, -1.692409, 1, 1, 1, 1, 1,
-1.705014, -0.122091, -1.837001, 1, 1, 1, 1, 1,
-1.70055, 0.8063708, -2.091571, 1, 1, 1, 1, 1,
-1.695694, 0.2817489, -0.4291527, 1, 1, 1, 1, 1,
-1.692687, -1.654932, -2.705725, 1, 1, 1, 1, 1,
-1.679837, 1.671603, -0.2852581, 1, 1, 1, 1, 1,
-1.651887, -0.4819147, -0.661707, 1, 1, 1, 1, 1,
-1.633281, -0.2584259, -0.3052402, 1, 1, 1, 1, 1,
-1.624683, -1.800976, -4.193453, 1, 1, 1, 1, 1,
-1.624603, 1.100015, -1.744015, 1, 1, 1, 1, 1,
-1.622714, 0.2954991, 0.816628, 1, 1, 1, 1, 1,
-1.613409, 0.3577617, -0.3357526, 1, 1, 1, 1, 1,
-1.613181, 0.810111, -0.4085998, 1, 1, 1, 1, 1,
-1.61004, 0.7968311, 0.1260195, 1, 1, 1, 1, 1,
-1.609544, 0.2183781, -1.832379, 0, 0, 1, 1, 1,
-1.579588, -0.1446263, -2.659033, 1, 0, 0, 1, 1,
-1.57252, 2.483598, 0.008973501, 1, 0, 0, 1, 1,
-1.564463, -1.368601, -4.159891, 1, 0, 0, 1, 1,
-1.551445, 0.4076619, -0.2235123, 1, 0, 0, 1, 1,
-1.546424, -1.706435, -1.884834, 1, 0, 0, 1, 1,
-1.541947, -0.6984818, -2.849003, 0, 0, 0, 1, 1,
-1.539304, 0.4150721, -0.3409331, 0, 0, 0, 1, 1,
-1.537387, -0.9296919, -2.316441, 0, 0, 0, 1, 1,
-1.525352, 1.281793, -0.3216676, 0, 0, 0, 1, 1,
-1.522083, 1.461153, -1.882883, 0, 0, 0, 1, 1,
-1.511266, -2.304227, -1.756914, 0, 0, 0, 1, 1,
-1.492575, 0.4444087, -0.1040119, 0, 0, 0, 1, 1,
-1.492558, -0.6024911, -0.6247389, 1, 1, 1, 1, 1,
-1.469658, -0.5404067, -1.984243, 1, 1, 1, 1, 1,
-1.462946, -0.02867152, -0.973844, 1, 1, 1, 1, 1,
-1.461637, 0.3230347, -1.268905, 1, 1, 1, 1, 1,
-1.457328, -0.123207, -1.545852, 1, 1, 1, 1, 1,
-1.455833, 0.8804406, -1.139812, 1, 1, 1, 1, 1,
-1.449089, -0.6903238, -1.49622, 1, 1, 1, 1, 1,
-1.448563, -0.5562262, -3.306396, 1, 1, 1, 1, 1,
-1.447877, 1.363045, 0.546281, 1, 1, 1, 1, 1,
-1.430974, -0.9887933, -2.745608, 1, 1, 1, 1, 1,
-1.427716, 0.07889125, -2.288783, 1, 1, 1, 1, 1,
-1.425382, -1.75135, -1.138669, 1, 1, 1, 1, 1,
-1.405161, 2.274393, 1.621917, 1, 1, 1, 1, 1,
-1.403938, 1.224258, -1.228966, 1, 1, 1, 1, 1,
-1.402901, 1.872806, -1.817834, 1, 1, 1, 1, 1,
-1.401056, -0.984308, -1.655795, 0, 0, 1, 1, 1,
-1.397365, -1.619347, -2.400244, 1, 0, 0, 1, 1,
-1.393363, -0.578363, -1.891233, 1, 0, 0, 1, 1,
-1.390123, 1.492927, -1.727522, 1, 0, 0, 1, 1,
-1.387729, -0.468632, -2.765182, 1, 0, 0, 1, 1,
-1.384191, -0.8857934, -2.776477, 1, 0, 0, 1, 1,
-1.382044, 0.1196842, -1.358594, 0, 0, 0, 1, 1,
-1.374984, -0.8767428, -1.369492, 0, 0, 0, 1, 1,
-1.370448, 0.8604802, 0.7178298, 0, 0, 0, 1, 1,
-1.36984, -0.9330336, -1.159663, 0, 0, 0, 1, 1,
-1.3651, -1.061224, -2.760217, 0, 0, 0, 1, 1,
-1.360516, 0.1900287, 0.3067447, 0, 0, 0, 1, 1,
-1.355633, -1.187152, -2.854676, 0, 0, 0, 1, 1,
-1.353711, 0.4606664, -1.239839, 1, 1, 1, 1, 1,
-1.348298, -0.9566916, -2.654274, 1, 1, 1, 1, 1,
-1.347311, 0.3898506, -3.160062, 1, 1, 1, 1, 1,
-1.34438, 0.3406184, -1.597307, 1, 1, 1, 1, 1,
-1.339946, -0.7194149, -1.800641, 1, 1, 1, 1, 1,
-1.335618, -1.116373, -1.851882, 1, 1, 1, 1, 1,
-1.327866, 1.230484, 0.6791269, 1, 1, 1, 1, 1,
-1.312262, -0.1073555, -2.436567, 1, 1, 1, 1, 1,
-1.307115, -0.9580573, -0.9141348, 1, 1, 1, 1, 1,
-1.303676, 0.6708675, -2.282137, 1, 1, 1, 1, 1,
-1.288511, 1.744952, -0.02560431, 1, 1, 1, 1, 1,
-1.277518, 0.0347291, -2.779886, 1, 1, 1, 1, 1,
-1.274708, 1.003367, -2.020802, 1, 1, 1, 1, 1,
-1.26731, -0.4471625, -0.6032535, 1, 1, 1, 1, 1,
-1.253148, 1.304893, -0.1791577, 1, 1, 1, 1, 1,
-1.233266, -0.746506, -1.263314, 0, 0, 1, 1, 1,
-1.219932, -0.1278273, -1.433667, 1, 0, 0, 1, 1,
-1.213712, -0.195945, -1.344424, 1, 0, 0, 1, 1,
-1.205907, 1.536053, -1.874248, 1, 0, 0, 1, 1,
-1.193208, 2.133862, -1.789086, 1, 0, 0, 1, 1,
-1.186163, 0.2879923, -0.3894964, 1, 0, 0, 1, 1,
-1.183946, -0.4581519, -1.642992, 0, 0, 0, 1, 1,
-1.183691, 0.2110348, -2.129, 0, 0, 0, 1, 1,
-1.171768, -0.3548347, -3.01121, 0, 0, 0, 1, 1,
-1.17032, 1.428151, -0.1818605, 0, 0, 0, 1, 1,
-1.165171, 0.6802135, -2.312101, 0, 0, 0, 1, 1,
-1.156669, -0.1742901, -1.282098, 0, 0, 0, 1, 1,
-1.154511, -0.2563627, -1.952262, 0, 0, 0, 1, 1,
-1.153116, 0.7487659, -1.295809, 1, 1, 1, 1, 1,
-1.151639, 0.5092714, -0.7198654, 1, 1, 1, 1, 1,
-1.150593, 0.4963311, -0.6384659, 1, 1, 1, 1, 1,
-1.146318, 0.7445365, 0.04969148, 1, 1, 1, 1, 1,
-1.138374, -0.698197, -1.340456, 1, 1, 1, 1, 1,
-1.134944, -0.08677105, -3.670367, 1, 1, 1, 1, 1,
-1.126309, 0.6028125, -0.159384, 1, 1, 1, 1, 1,
-1.123995, -0.7164515, -2.874124, 1, 1, 1, 1, 1,
-1.119367, -1.333667, -3.198687, 1, 1, 1, 1, 1,
-1.114931, 0.3575326, -3.559872, 1, 1, 1, 1, 1,
-1.113326, 1.499684, -1.10916, 1, 1, 1, 1, 1,
-1.112672, 0.3995589, -1.532354, 1, 1, 1, 1, 1,
-1.112476, 1.135938, -1.94797, 1, 1, 1, 1, 1,
-1.10288, 1.574203, -1.233988, 1, 1, 1, 1, 1,
-1.100567, -0.002666088, -0.2572367, 1, 1, 1, 1, 1,
-1.078913, 0.6850284, -1.571271, 0, 0, 1, 1, 1,
-1.076207, -1.075194, -2.082993, 1, 0, 0, 1, 1,
-1.071131, 0.4959905, 0.5947187, 1, 0, 0, 1, 1,
-1.066386, -0.6653348, -0.4353838, 1, 0, 0, 1, 1,
-1.062996, -0.3089775, -3.101576, 1, 0, 0, 1, 1,
-1.059842, -0.4368396, -1.724017, 1, 0, 0, 1, 1,
-1.056983, -0.1104865, -1.075426, 0, 0, 0, 1, 1,
-1.055118, 1.296952, -0.7566395, 0, 0, 0, 1, 1,
-1.0501, -0.8851148, -3.365923, 0, 0, 0, 1, 1,
-1.048369, 0.1799373, -0.4569348, 0, 0, 0, 1, 1,
-1.041386, 0.7446808, -2.608873, 0, 0, 0, 1, 1,
-1.040109, 1.301273, -2.436131, 0, 0, 0, 1, 1,
-1.03021, 0.9763749, -0.1778937, 0, 0, 0, 1, 1,
-1.020075, 1.14079, -0.37587, 1, 1, 1, 1, 1,
-1.013191, -0.6641898, -2.908469, 1, 1, 1, 1, 1,
-1.009553, 0.5041389, -1.34064, 1, 1, 1, 1, 1,
-1.004599, -1.178641, -3.161976, 1, 1, 1, 1, 1,
-1.004027, 0.5391359, -1.648224, 1, 1, 1, 1, 1,
-1.00337, 0.3763222, -2.107983, 1, 1, 1, 1, 1,
-1.00318, -1.028817, -2.832443, 1, 1, 1, 1, 1,
-0.9971658, 0.4773087, -0.2181463, 1, 1, 1, 1, 1,
-0.9874604, -1.882381, -1.515401, 1, 1, 1, 1, 1,
-0.9834229, 0.4737028, -1.274045, 1, 1, 1, 1, 1,
-0.9795383, -2.124157, -1.168267, 1, 1, 1, 1, 1,
-0.9788717, 0.5528324, -0.8620338, 1, 1, 1, 1, 1,
-0.9764663, 0.6302149, -2.004086, 1, 1, 1, 1, 1,
-0.9741021, 2.074932, 0.4057781, 1, 1, 1, 1, 1,
-0.9735921, -0.1162652, -1.536549, 1, 1, 1, 1, 1,
-0.9679006, 0.3918391, -1.653734, 0, 0, 1, 1, 1,
-0.9579554, -0.1855494, -2.051668, 1, 0, 0, 1, 1,
-0.9567304, 1.31785, 0.2300456, 1, 0, 0, 1, 1,
-0.9551461, -0.4985476, -3.10893, 1, 0, 0, 1, 1,
-0.9550826, -1.953278, -1.500946, 1, 0, 0, 1, 1,
-0.9435525, 0.2984108, 0.2851825, 1, 0, 0, 1, 1,
-0.9410796, 0.6867385, -0.8268116, 0, 0, 0, 1, 1,
-0.9396991, 0.1237359, -1.146013, 0, 0, 0, 1, 1,
-0.9392402, -1.680352, -1.702784, 0, 0, 0, 1, 1,
-0.9383646, -1.023914, -2.689001, 0, 0, 0, 1, 1,
-0.9337466, -0.1699225, -1.492151, 0, 0, 0, 1, 1,
-0.9289768, 0.07602374, -1.936779, 0, 0, 0, 1, 1,
-0.9245887, 0.8162079, -1.077137, 0, 0, 0, 1, 1,
-0.9187373, -0.2839808, -3.134751, 1, 1, 1, 1, 1,
-0.9169511, 0.1552536, -1.725516, 1, 1, 1, 1, 1,
-0.9138492, -0.6492175, -3.151508, 1, 1, 1, 1, 1,
-0.9113145, -0.3937589, -0.07869244, 1, 1, 1, 1, 1,
-0.907128, -0.5397189, -1.577705, 1, 1, 1, 1, 1,
-0.9026995, 0.3025273, -0.8633775, 1, 1, 1, 1, 1,
-0.8981593, -1.603778, -3.58079, 1, 1, 1, 1, 1,
-0.8939653, -1.70443, -4.101109, 1, 1, 1, 1, 1,
-0.8928978, 2.09383, 0.3317115, 1, 1, 1, 1, 1,
-0.8914419, -0.5877967, -1.198334, 1, 1, 1, 1, 1,
-0.8902529, -0.5013793, -1.148966, 1, 1, 1, 1, 1,
-0.8599365, 1.547023, -0.4996179, 1, 1, 1, 1, 1,
-0.8560653, 0.2883256, 0.964366, 1, 1, 1, 1, 1,
-0.8525757, 2.043188, 0.5782089, 1, 1, 1, 1, 1,
-0.8493631, -1.32719, -1.888468, 1, 1, 1, 1, 1,
-0.8425707, 1.565363, 0.8596362, 0, 0, 1, 1, 1,
-0.840804, 0.6347311, -0.48733, 1, 0, 0, 1, 1,
-0.8376536, -0.04380875, -2.333113, 1, 0, 0, 1, 1,
-0.8364813, 1.015158, -1.337105, 1, 0, 0, 1, 1,
-0.8343759, -0.4880721, -2.618091, 1, 0, 0, 1, 1,
-0.8330335, -1.198837, -1.488391, 1, 0, 0, 1, 1,
-0.832314, 0.7751626, -0.4289381, 0, 0, 0, 1, 1,
-0.8304433, -1.281956, -2.506117, 0, 0, 0, 1, 1,
-0.8302742, 1.613206, -0.4114979, 0, 0, 0, 1, 1,
-0.8260901, 0.8971856, -1.156928, 0, 0, 0, 1, 1,
-0.8214448, 0.2120128, 0.04034499, 0, 0, 0, 1, 1,
-0.8212401, -1.096567, -3.101346, 0, 0, 0, 1, 1,
-0.8170274, 1.351011, -0.8760443, 0, 0, 0, 1, 1,
-0.8139229, 0.3869188, 0.2241221, 1, 1, 1, 1, 1,
-0.8102831, -0.4416976, -1.839409, 1, 1, 1, 1, 1,
-0.8061652, -0.5536647, -2.204844, 1, 1, 1, 1, 1,
-0.8060737, -0.4108666, -2.971788, 1, 1, 1, 1, 1,
-0.8039361, -0.001875582, -3.255313, 1, 1, 1, 1, 1,
-0.8025273, 0.8198685, -1.86632, 1, 1, 1, 1, 1,
-0.7871305, 0.01871934, -1.988974, 1, 1, 1, 1, 1,
-0.7839682, -2.101649, -2.710232, 1, 1, 1, 1, 1,
-0.7810853, 1.728473, -1.639406, 1, 1, 1, 1, 1,
-0.7788358, 0.380261, 0.447558, 1, 1, 1, 1, 1,
-0.7712848, 0.6626109, -0.4435301, 1, 1, 1, 1, 1,
-0.7648269, -1.217119, -0.9778805, 1, 1, 1, 1, 1,
-0.763957, -0.1134794, -3.211058, 1, 1, 1, 1, 1,
-0.7620463, 0.8191582, 1.562431, 1, 1, 1, 1, 1,
-0.7613427, 1.198884, 1.000835, 1, 1, 1, 1, 1,
-0.7541517, 0.8489863, 1.579276, 0, 0, 1, 1, 1,
-0.754003, 1.756389, -0.3205658, 1, 0, 0, 1, 1,
-0.7537992, -0.5131611, -0.9420979, 1, 0, 0, 1, 1,
-0.750895, 0.3911615, -0.4935023, 1, 0, 0, 1, 1,
-0.7497342, 0.3519775, -0.4005244, 1, 0, 0, 1, 1,
-0.7450011, 0.6877443, -0.5819094, 1, 0, 0, 1, 1,
-0.737286, 0.8416836, -0.3857834, 0, 0, 0, 1, 1,
-0.7367547, -1.09769, -1.78902, 0, 0, 0, 1, 1,
-0.7361899, -0.0643163, -2.330764, 0, 0, 0, 1, 1,
-0.7351837, 0.1811281, 0.110172, 0, 0, 0, 1, 1,
-0.7347636, 0.4341845, -1.917128, 0, 0, 0, 1, 1,
-0.7324495, 1.577597, -1.546719, 0, 0, 0, 1, 1,
-0.7319431, 1.328211, 0.5209258, 0, 0, 0, 1, 1,
-0.7237009, 0.6707488, -1.818509, 1, 1, 1, 1, 1,
-0.7228949, -0.5770317, -2.322532, 1, 1, 1, 1, 1,
-0.7203736, -0.08671097, -1.465872, 1, 1, 1, 1, 1,
-0.7124912, 0.04666546, -1.129396, 1, 1, 1, 1, 1,
-0.7120501, 1.876243, -0.9178613, 1, 1, 1, 1, 1,
-0.7076514, 0.3081406, -1.457841, 1, 1, 1, 1, 1,
-0.7067788, 0.06901102, -1.412069, 1, 1, 1, 1, 1,
-0.7044623, -0.7429052, -1.36993, 1, 1, 1, 1, 1,
-0.7036827, -0.6184906, -3.184679, 1, 1, 1, 1, 1,
-0.7034859, -1.538185, -2.980433, 1, 1, 1, 1, 1,
-0.6991109, 0.6518614, -0.8444971, 1, 1, 1, 1, 1,
-0.6972318, 0.07998306, -1.736501, 1, 1, 1, 1, 1,
-0.6962345, 1.71907, -0.1895139, 1, 1, 1, 1, 1,
-0.6935129, 0.3372775, -2.954949, 1, 1, 1, 1, 1,
-0.6921976, -0.02088939, 0.1729165, 1, 1, 1, 1, 1,
-0.6890556, -1.461732, -2.819598, 0, 0, 1, 1, 1,
-0.6879964, -0.1221283, -1.517214, 1, 0, 0, 1, 1,
-0.6867106, 1.124333, -0.3960302, 1, 0, 0, 1, 1,
-0.6855074, -0.8654008, -4.330983, 1, 0, 0, 1, 1,
-0.6839527, -1.507553, -1.597364, 1, 0, 0, 1, 1,
-0.6825308, -0.0412484, -2.162272, 1, 0, 0, 1, 1,
-0.6775366, -0.5189119, -2.795455, 0, 0, 0, 1, 1,
-0.6744034, -1.120855, -2.390765, 0, 0, 0, 1, 1,
-0.6733608, -0.5501143, -3.201785, 0, 0, 0, 1, 1,
-0.672872, -0.4143627, -2.370726, 0, 0, 0, 1, 1,
-0.6680034, 0.8072869, -0.2141801, 0, 0, 0, 1, 1,
-0.6648839, -0.7798774, -1.618996, 0, 0, 0, 1, 1,
-0.6485711, 0.9564723, 0.9911367, 0, 0, 0, 1, 1,
-0.6467251, 0.495731, -1.53357, 1, 1, 1, 1, 1,
-0.6460155, -0.09384387, -1.639922, 1, 1, 1, 1, 1,
-0.6458455, -0.228869, -0.6090238, 1, 1, 1, 1, 1,
-0.6417236, -1.048818, -2.807121, 1, 1, 1, 1, 1,
-0.6384712, -0.7791421, -1.76391, 1, 1, 1, 1, 1,
-0.6258655, -2.517327, -4.715714, 1, 1, 1, 1, 1,
-0.624119, 0.3280772, -1.009967, 1, 1, 1, 1, 1,
-0.6229264, 0.1680046, -0.7546626, 1, 1, 1, 1, 1,
-0.6214802, 0.5561857, -1.797511, 1, 1, 1, 1, 1,
-0.6214086, 0.7068442, -1.211109, 1, 1, 1, 1, 1,
-0.6181899, -0.4670141, -1.448664, 1, 1, 1, 1, 1,
-0.6147289, -0.4120668, -2.78641, 1, 1, 1, 1, 1,
-0.6137116, -0.8652882, -2.597512, 1, 1, 1, 1, 1,
-0.6116857, -1.226859, -2.265658, 1, 1, 1, 1, 1,
-0.6058987, 0.299583, -3.217466, 1, 1, 1, 1, 1,
-0.6029717, -2.666387, -1.642325, 0, 0, 1, 1, 1,
-0.6027666, -0.658323, -3.414989, 1, 0, 0, 1, 1,
-0.6025995, 0.1608158, -1.802639, 1, 0, 0, 1, 1,
-0.6014956, -1.005277, -1.886739, 1, 0, 0, 1, 1,
-0.5911632, 0.4546558, -1.042714, 1, 0, 0, 1, 1,
-0.5894893, -1.760559, -3.57957, 1, 0, 0, 1, 1,
-0.5876724, -0.8521503, -3.407545, 0, 0, 0, 1, 1,
-0.584069, 2.073019, -0.6150227, 0, 0, 0, 1, 1,
-0.5827799, -1.265303, -3.28702, 0, 0, 0, 1, 1,
-0.5806885, -0.03600984, -1.544965, 0, 0, 0, 1, 1,
-0.5769349, -0.3938932, -2.447415, 0, 0, 0, 1, 1,
-0.5766966, 0.4339021, -0.6980299, 0, 0, 0, 1, 1,
-0.5727032, -0.9464656, -1.909572, 0, 0, 0, 1, 1,
-0.5682067, 1.367651, 2.641123, 1, 1, 1, 1, 1,
-0.5677851, 0.004222907, -0.6821368, 1, 1, 1, 1, 1,
-0.5665877, -1.302588, -2.916636, 1, 1, 1, 1, 1,
-0.5651678, 2.682958, -0.4562327, 1, 1, 1, 1, 1,
-0.5646802, 1.10515, -0.8889537, 1, 1, 1, 1, 1,
-0.5632834, 0.6491744, -1.499712, 1, 1, 1, 1, 1,
-0.5628285, -0.6192299, -4.251244, 1, 1, 1, 1, 1,
-0.5584601, -0.9749154, -1.779484, 1, 1, 1, 1, 1,
-0.5570411, 1.268685, -1.77389, 1, 1, 1, 1, 1,
-0.5538982, 0.6909798, -1.717523, 1, 1, 1, 1, 1,
-0.5521173, 0.2688673, -1.005774, 1, 1, 1, 1, 1,
-0.5516975, -0.3199476, -2.244643, 1, 1, 1, 1, 1,
-0.5455557, 0.7686742, -0.9571392, 1, 1, 1, 1, 1,
-0.5411615, 0.7813745, -0.8678294, 1, 1, 1, 1, 1,
-0.534938, -0.009435844, -0.6610956, 1, 1, 1, 1, 1,
-0.525512, 0.880146, -1.026785, 0, 0, 1, 1, 1,
-0.5219702, 0.2955559, 1.445007, 1, 0, 0, 1, 1,
-0.5196494, -0.8090579, -4.547678, 1, 0, 0, 1, 1,
-0.5131828, 0.5514516, -1.239152, 1, 0, 0, 1, 1,
-0.5035145, 0.164863, -4.947236, 1, 0, 0, 1, 1,
-0.5022107, -1.195844, -3.16578, 1, 0, 0, 1, 1,
-0.50054, 0.4096779, -0.5830768, 0, 0, 0, 1, 1,
-0.4986737, -2.638931, -3.519506, 0, 0, 0, 1, 1,
-0.4884592, 1.212801, -3.557376, 0, 0, 0, 1, 1,
-0.4881925, -0.2722898, -0.9285829, 0, 0, 0, 1, 1,
-0.4857716, 0.6072555, -0.8541414, 0, 0, 0, 1, 1,
-0.4777161, 1.070433, -0.8709422, 0, 0, 0, 1, 1,
-0.4752139, 1.406232, -0.3795412, 0, 0, 0, 1, 1,
-0.4721162, 0.9950957, -0.2239531, 1, 1, 1, 1, 1,
-0.462416, 1.217253, -0.4604527, 1, 1, 1, 1, 1,
-0.4617388, 0.876256, -0.1481371, 1, 1, 1, 1, 1,
-0.4589229, 0.3151108, -1.618404, 1, 1, 1, 1, 1,
-0.4553358, -0.5525678, -3.187146, 1, 1, 1, 1, 1,
-0.4492922, -0.007797111, -1.042565, 1, 1, 1, 1, 1,
-0.4436798, 0.7992868, 1.288857, 1, 1, 1, 1, 1,
-0.4404101, 1.361518, -1.970413, 1, 1, 1, 1, 1,
-0.4398226, -0.1877082, -2.093494, 1, 1, 1, 1, 1,
-0.4344214, -0.7639225, -3.684616, 1, 1, 1, 1, 1,
-0.4336916, -0.3825526, -1.208673, 1, 1, 1, 1, 1,
-0.4335827, 0.1930335, -1.772343, 1, 1, 1, 1, 1,
-0.4307745, -0.05411812, -0.4088727, 1, 1, 1, 1, 1,
-0.4307562, -1.352078, -4.22744, 1, 1, 1, 1, 1,
-0.4292659, -0.08790755, -1.927418, 1, 1, 1, 1, 1,
-0.4287224, -0.5864559, -3.520247, 0, 0, 1, 1, 1,
-0.4216963, 1.015167, -2.971327, 1, 0, 0, 1, 1,
-0.4202736, 0.6769221, -0.8041646, 1, 0, 0, 1, 1,
-0.4195377, -0.8338034, -3.746192, 1, 0, 0, 1, 1,
-0.4036441, -0.4374917, -1.731931, 1, 0, 0, 1, 1,
-0.402421, -0.54533, -2.938862, 1, 0, 0, 1, 1,
-0.401736, -0.3393084, -3.011447, 0, 0, 0, 1, 1,
-0.3993317, 2.322891, -0.1797803, 0, 0, 0, 1, 1,
-0.3982813, 0.9763138, -0.5760925, 0, 0, 0, 1, 1,
-0.3954221, 0.3279438, 0.407181, 0, 0, 0, 1, 1,
-0.3919583, 0.6996385, -1.194701, 0, 0, 0, 1, 1,
-0.383987, -0.9427318, -2.746197, 0, 0, 0, 1, 1,
-0.3721038, 0.1999423, -1.869307, 0, 0, 0, 1, 1,
-0.3659415, 0.4663697, 0.5925963, 1, 1, 1, 1, 1,
-0.3649453, 0.5407527, -0.05955592, 1, 1, 1, 1, 1,
-0.3648924, 0.9939044, -0.303259, 1, 1, 1, 1, 1,
-0.3627903, 1.65439, -0.7070635, 1, 1, 1, 1, 1,
-0.3624443, 0.07653044, -1.085182, 1, 1, 1, 1, 1,
-0.3598701, -0.3665087, -3.016937, 1, 1, 1, 1, 1,
-0.3566517, 0.3850727, -0.4292609, 1, 1, 1, 1, 1,
-0.3556511, -1.046531, -1.093928, 1, 1, 1, 1, 1,
-0.3553177, -0.2454897, -1.821029, 1, 1, 1, 1, 1,
-0.3543576, 0.07654474, -0.792066, 1, 1, 1, 1, 1,
-0.35344, -0.7661824, -3.070673, 1, 1, 1, 1, 1,
-0.3531964, 1.498902, -1.041511, 1, 1, 1, 1, 1,
-0.350766, 0.1280334, -0.9579974, 1, 1, 1, 1, 1,
-0.3400847, -1.032848, -3.316276, 1, 1, 1, 1, 1,
-0.3397461, 1.323929, 0.04917761, 1, 1, 1, 1, 1,
-0.3334327, -1.021195, -3.353197, 0, 0, 1, 1, 1,
-0.3328022, -2.081802, -3.255425, 1, 0, 0, 1, 1,
-0.3313447, -1.144352, 0.3297141, 1, 0, 0, 1, 1,
-0.3252445, 0.06130825, -2.150657, 1, 0, 0, 1, 1,
-0.3249902, 0.7492236, -0.6826008, 1, 0, 0, 1, 1,
-0.3243338, -0.01647543, 0.5187927, 1, 0, 0, 1, 1,
-0.3236854, 0.1238278, -0.6827855, 0, 0, 0, 1, 1,
-0.3233584, 0.2085069, -0.605022, 0, 0, 0, 1, 1,
-0.3185161, -0.8745864, -5.083, 0, 0, 0, 1, 1,
-0.3149725, -1.373782, -2.729281, 0, 0, 0, 1, 1,
-0.3131276, 0.6036489, 0.3585843, 0, 0, 0, 1, 1,
-0.3023349, -1.295478, -2.133276, 0, 0, 0, 1, 1,
-0.3010269, -0.2011198, -2.979046, 0, 0, 0, 1, 1,
-0.2954484, 1.392588, 0.3734568, 1, 1, 1, 1, 1,
-0.2941925, 1.610588, 0.1385769, 1, 1, 1, 1, 1,
-0.2936113, -1.792127, -3.183133, 1, 1, 1, 1, 1,
-0.2868188, -0.8903197, -1.712034, 1, 1, 1, 1, 1,
-0.2865554, -0.1748156, -4.665452, 1, 1, 1, 1, 1,
-0.2826201, -0.1539883, -0.6120532, 1, 1, 1, 1, 1,
-0.2817588, -0.7645287, -1.172336, 1, 1, 1, 1, 1,
-0.2815941, 0.8000606, -1.006764, 1, 1, 1, 1, 1,
-0.2676065, 0.3253039, 0.7641095, 1, 1, 1, 1, 1,
-0.2597949, -1.495262, -4.425232, 1, 1, 1, 1, 1,
-0.2533574, -0.0489203, -1.092145, 1, 1, 1, 1, 1,
-0.2522917, 1.892603, -0.7481036, 1, 1, 1, 1, 1,
-0.2515023, 1.103243, -0.1655522, 1, 1, 1, 1, 1,
-0.2513874, 1.359464, 0.1796277, 1, 1, 1, 1, 1,
-0.2316225, 0.6763618, -0.02648329, 1, 1, 1, 1, 1,
-0.2295972, 0.2845467, 0.4084391, 0, 0, 1, 1, 1,
-0.2292897, -0.0653169, -3.265067, 1, 0, 0, 1, 1,
-0.2252409, 0.7255747, 1.650961, 1, 0, 0, 1, 1,
-0.2224951, 0.8265096, -1.246001, 1, 0, 0, 1, 1,
-0.2211927, 1.108986, -0.3963229, 1, 0, 0, 1, 1,
-0.2207344, 1.158735, 1.188506, 1, 0, 0, 1, 1,
-0.2095048, 0.2107747, -0.06669408, 0, 0, 0, 1, 1,
-0.208433, 0.3047744, -0.4599529, 0, 0, 0, 1, 1,
-0.2077621, -0.4376769, -2.758243, 0, 0, 0, 1, 1,
-0.2065272, -0.2128723, -1.581009, 0, 0, 0, 1, 1,
-0.204064, 0.8443492, -0.401679, 0, 0, 0, 1, 1,
-0.2028314, -0.5425667, -1.75756, 0, 0, 0, 1, 1,
-0.1984505, -1.019372, -2.963976, 0, 0, 0, 1, 1,
-0.1980516, 0.2524281, 0.1461037, 1, 1, 1, 1, 1,
-0.1931164, 0.3367375, -1.226809, 1, 1, 1, 1, 1,
-0.1930445, -0.2919288, -3.379184, 1, 1, 1, 1, 1,
-0.1925097, -2.677355, -4.196033, 1, 1, 1, 1, 1,
-0.1896754, 0.4366281, -1.472533, 1, 1, 1, 1, 1,
-0.1894249, -0.3923215, -2.953315, 1, 1, 1, 1, 1,
-0.1884331, -0.222655, -2.747557, 1, 1, 1, 1, 1,
-0.1860457, -1.180029, -4.652156, 1, 1, 1, 1, 1,
-0.1853611, -0.3335168, -1.603204, 1, 1, 1, 1, 1,
-0.1845163, 1.610298, 0.3020623, 1, 1, 1, 1, 1,
-0.1844016, -1.108453, -1.310307, 1, 1, 1, 1, 1,
-0.1802411, 0.01600942, -1.239187, 1, 1, 1, 1, 1,
-0.1792189, 0.4089064, -0.1188634, 1, 1, 1, 1, 1,
-0.1790061, 0.4865927, 1.613108, 1, 1, 1, 1, 1,
-0.1788971, 0.9161507, 0.1600115, 1, 1, 1, 1, 1,
-0.178246, -0.6338394, -1.786741, 0, 0, 1, 1, 1,
-0.1766815, -0.7528629, -2.84568, 1, 0, 0, 1, 1,
-0.1765303, -0.9668494, -2.33115, 1, 0, 0, 1, 1,
-0.1756908, -0.7229387, -2.900241, 1, 0, 0, 1, 1,
-0.1727612, 0.8214158, -0.9833941, 1, 0, 0, 1, 1,
-0.1717681, 1.000918, -0.3611026, 1, 0, 0, 1, 1,
-0.1706225, 0.07404144, -2.812192, 0, 0, 0, 1, 1,
-0.1701199, -1.400137, -2.318736, 0, 0, 0, 1, 1,
-0.1694412, 0.6622588, -1.104635, 0, 0, 0, 1, 1,
-0.1640803, -0.3431334, -1.529233, 0, 0, 0, 1, 1,
-0.1630272, 2.155363, -0.8501071, 0, 0, 0, 1, 1,
-0.1620473, 0.9462147, 0.8743717, 0, 0, 0, 1, 1,
-0.1605332, 0.7171046, -1.183605, 0, 0, 0, 1, 1,
-0.1513944, -1.071709, -3.190604, 1, 1, 1, 1, 1,
-0.1502105, -1.548681, -2.871091, 1, 1, 1, 1, 1,
-0.1479438, -0.6536783, -2.318578, 1, 1, 1, 1, 1,
-0.1468103, -0.3310703, -2.927505, 1, 1, 1, 1, 1,
-0.1467577, 0.5859264, -0.5081748, 1, 1, 1, 1, 1,
-0.1414258, 1.051048, 0.9950585, 1, 1, 1, 1, 1,
-0.1406114, 0.3503694, -0.2370301, 1, 1, 1, 1, 1,
-0.1375684, 0.1015895, -1.544468, 1, 1, 1, 1, 1,
-0.1359694, 0.9120547, -0.725207, 1, 1, 1, 1, 1,
-0.13459, -1.20649, -3.036367, 1, 1, 1, 1, 1,
-0.1334008, -0.5915191, -2.79998, 1, 1, 1, 1, 1,
-0.1286068, 0.2476237, 0.4016323, 1, 1, 1, 1, 1,
-0.1220866, -1.071018, -4.32456, 1, 1, 1, 1, 1,
-0.1200197, -1.304206, -3.431087, 1, 1, 1, 1, 1,
-0.1153684, 0.1455494, -1.048667, 1, 1, 1, 1, 1,
-0.1118577, 0.4049324, -0.7040203, 0, 0, 1, 1, 1,
-0.1110252, 0.9965183, 0.1221867, 1, 0, 0, 1, 1,
-0.1078696, -0.7240639, -1.352599, 1, 0, 0, 1, 1,
-0.1049266, -0.4224463, -3.532772, 1, 0, 0, 1, 1,
-0.1042304, -0.2396255, -1.814801, 1, 0, 0, 1, 1,
-0.09991302, -0.3924592, -2.588393, 1, 0, 0, 1, 1,
-0.09950914, 0.6361793, -0.7756957, 0, 0, 0, 1, 1,
-0.09943828, -1.46129, -3.08007, 0, 0, 0, 1, 1,
-0.09833084, -0.3755848, -2.377232, 0, 0, 0, 1, 1,
-0.09514216, 0.8384326, -0.8349621, 0, 0, 0, 1, 1,
-0.09224503, -1.618841, -1.721936, 0, 0, 0, 1, 1,
-0.09152938, 0.8899775, -0.2481147, 0, 0, 0, 1, 1,
-0.09143452, 0.8977562, 0.7956578, 0, 0, 0, 1, 1,
-0.08196311, 0.5856098, 0.3875422, 1, 1, 1, 1, 1,
-0.08017212, 0.568227, -1.322744, 1, 1, 1, 1, 1,
-0.07461276, -0.3084213, -1.520418, 1, 1, 1, 1, 1,
-0.07331195, 0.04750684, 0.7412497, 1, 1, 1, 1, 1,
-0.07155041, 0.1847048, -0.4707485, 1, 1, 1, 1, 1,
-0.06821447, 0.04749645, -1.898241, 1, 1, 1, 1, 1,
-0.0653794, -0.7054557, -3.68628, 1, 1, 1, 1, 1,
-0.06360865, 2.331912, -0.1191534, 1, 1, 1, 1, 1,
-0.06294247, -0.5502928, -2.346908, 1, 1, 1, 1, 1,
-0.06079325, 0.4226329, -0.8124968, 1, 1, 1, 1, 1,
-0.05720137, 0.2322673, -0.1397619, 1, 1, 1, 1, 1,
-0.05364463, 1.120849, 0.6172141, 1, 1, 1, 1, 1,
-0.05298656, -1.200724, -4.349403, 1, 1, 1, 1, 1,
-0.05233118, -0.7759758, -2.325424, 1, 1, 1, 1, 1,
-0.05135868, -0.6889522, -3.078172, 1, 1, 1, 1, 1,
-0.04951577, 0.2174338, -0.2137877, 0, 0, 1, 1, 1,
-0.04807156, 1.297163, -0.01865244, 1, 0, 0, 1, 1,
-0.04760397, -1.151198, -3.014516, 1, 0, 0, 1, 1,
-0.04723338, -0.2857873, -1.480442, 1, 0, 0, 1, 1,
-0.04446895, 0.4650262, -1.352164, 1, 0, 0, 1, 1,
-0.04266387, -0.3926327, -4.560064, 1, 0, 0, 1, 1,
-0.04055963, -0.4286287, -3.954047, 0, 0, 0, 1, 1,
-0.03971322, -0.7482737, -4.835267, 0, 0, 0, 1, 1,
-0.03965273, 0.2879874, -0.1595725, 0, 0, 0, 1, 1,
-0.03921603, -0.1760667, -3.334417, 0, 0, 0, 1, 1,
-0.03865055, 0.648961, 0.7637931, 0, 0, 0, 1, 1,
-0.03339406, 1.738772, -0.4948757, 0, 0, 0, 1, 1,
-0.02742244, 1.195016, 0.531436, 0, 0, 0, 1, 1,
-0.02689017, -0.4290542, -1.187775, 1, 1, 1, 1, 1,
-0.02627754, -0.1694232, -2.202363, 1, 1, 1, 1, 1,
-0.02590055, -0.6013783, -4.024962, 1, 1, 1, 1, 1,
-0.02455348, 1.325636, -0.7177368, 1, 1, 1, 1, 1,
-0.02052358, -1.056293, -4.301474, 1, 1, 1, 1, 1,
-0.01347221, -0.2676899, -1.073274, 1, 1, 1, 1, 1,
-0.01240782, 0.4483888, 0.09495776, 1, 1, 1, 1, 1,
-0.01003474, 0.5558378, 0.4665525, 1, 1, 1, 1, 1,
-0.009553918, -0.1530917, -2.280205, 1, 1, 1, 1, 1,
-0.008813889, 1.231528, -0.4543929, 1, 1, 1, 1, 1,
-0.005211586, 0.9143222, 0.4972576, 1, 1, 1, 1, 1,
0.004333578, -0.4300513, 3.190018, 1, 1, 1, 1, 1,
0.004982671, 0.2117088, 0.3959706, 1, 1, 1, 1, 1,
0.008336642, 0.1488736, -0.7882655, 1, 1, 1, 1, 1,
0.008992331, 0.5253024, -0.8090403, 1, 1, 1, 1, 1,
0.009295361, -0.1168735, 2.866154, 0, 0, 1, 1, 1,
0.0111338, 0.1042559, -0.1935071, 1, 0, 0, 1, 1,
0.01129153, 0.2498968, 1.273467, 1, 0, 0, 1, 1,
0.01334392, -0.02883565, 3.814941, 1, 0, 0, 1, 1,
0.01410241, -1.507058, 0.02369446, 1, 0, 0, 1, 1,
0.01889498, 0.6628241, -0.08251847, 1, 0, 0, 1, 1,
0.02282398, 1.785999, 2.65747, 0, 0, 0, 1, 1,
0.02288329, 0.3113868, 0.4426766, 0, 0, 0, 1, 1,
0.02325573, 0.6602898, -0.8138236, 0, 0, 0, 1, 1,
0.02933533, -1.466989, 4.506217, 0, 0, 0, 1, 1,
0.02943056, 0.6340889, -0.8699145, 0, 0, 0, 1, 1,
0.02992791, 0.2565141, -0.2545483, 0, 0, 0, 1, 1,
0.03706903, -0.7193407, 1.818895, 0, 0, 0, 1, 1,
0.03835079, -1.841522, 1.801374, 1, 1, 1, 1, 1,
0.03960605, -0.5206907, 3.105633, 1, 1, 1, 1, 1,
0.04420021, -1.655835, 2.325672, 1, 1, 1, 1, 1,
0.0489515, 0.05382886, 2.110458, 1, 1, 1, 1, 1,
0.05583892, -1.909625, 2.470693, 1, 1, 1, 1, 1,
0.05621677, 1.353882, -1.034089, 1, 1, 1, 1, 1,
0.05672987, -1.329431, 0.4425776, 1, 1, 1, 1, 1,
0.05980134, -0.08667301, 1.812441, 1, 1, 1, 1, 1,
0.06514779, 1.615501, -1.738379, 1, 1, 1, 1, 1,
0.06584579, -0.8926634, 2.174319, 1, 1, 1, 1, 1,
0.06609797, 0.6772978, 1.398208, 1, 1, 1, 1, 1,
0.06628237, -1.428753, 4.139064, 1, 1, 1, 1, 1,
0.06638461, 0.5389327, 1.877205, 1, 1, 1, 1, 1,
0.06645808, 1.599464, 1.202737, 1, 1, 1, 1, 1,
0.06951677, -0.6706473, 5.030201, 1, 1, 1, 1, 1,
0.07179498, 1.18349, -0.06357519, 0, 0, 1, 1, 1,
0.08062074, -1.269678, 3.53582, 1, 0, 0, 1, 1,
0.08288987, -0.364139, 3.033134, 1, 0, 0, 1, 1,
0.08388753, -0.1738105, 2.677962, 1, 0, 0, 1, 1,
0.08756798, -0.1922779, 3.376807, 1, 0, 0, 1, 1,
0.08949549, 1.448494, -0.3397244, 1, 0, 0, 1, 1,
0.09241838, 1.009862, -0.4285074, 0, 0, 0, 1, 1,
0.09420566, -0.8731153, 2.41187, 0, 0, 0, 1, 1,
0.09495924, 2.219675, -0.9007887, 0, 0, 0, 1, 1,
0.09530571, -0.210946, 3.451661, 0, 0, 0, 1, 1,
0.09711274, -0.8896423, 3.995665, 0, 0, 0, 1, 1,
0.0981956, -1.139705, 3.466361, 0, 0, 0, 1, 1,
0.1063171, -0.5532122, 1.976669, 0, 0, 0, 1, 1,
0.1083166, -0.9808887, 1.932282, 1, 1, 1, 1, 1,
0.1103616, 0.5454459, -1.537401, 1, 1, 1, 1, 1,
0.1157327, 1.230145, -0.9837055, 1, 1, 1, 1, 1,
0.1202049, -0.4332649, 3.327615, 1, 1, 1, 1, 1,
0.1202154, -1.055906, 3.073376, 1, 1, 1, 1, 1,
0.1209954, -0.1896994, 0.9228531, 1, 1, 1, 1, 1,
0.1220422, -1.551184, 3.145997, 1, 1, 1, 1, 1,
0.1221823, -1.345792, 3.744073, 1, 1, 1, 1, 1,
0.125221, 0.6770246, 0.6646798, 1, 1, 1, 1, 1,
0.1256812, 0.3362069, -2.58469, 1, 1, 1, 1, 1,
0.1271011, -2.649993, 4.066308, 1, 1, 1, 1, 1,
0.1281189, 2.138033, 1.381342, 1, 1, 1, 1, 1,
0.1281444, 0.02643897, -0.5016482, 1, 1, 1, 1, 1,
0.1317547, -0.6582891, 2.633663, 1, 1, 1, 1, 1,
0.1376852, 1.406679, 0.2464005, 1, 1, 1, 1, 1,
0.1421591, 1.650114, -0.01048932, 0, 0, 1, 1, 1,
0.1447446, 0.3014727, 0.5472946, 1, 0, 0, 1, 1,
0.1447922, 0.3121556, 0.2354486, 1, 0, 0, 1, 1,
0.1508692, -0.9834999, 2.171682, 1, 0, 0, 1, 1,
0.155254, 0.8616808, -0.960005, 1, 0, 0, 1, 1,
0.1557167, 0.4078785, -0.07740192, 1, 0, 0, 1, 1,
0.1571359, -1.059608, 2.102028, 0, 0, 0, 1, 1,
0.1581963, 0.03332255, 1.144886, 0, 0, 0, 1, 1,
0.1587628, -1.380177, 2.669868, 0, 0, 0, 1, 1,
0.1590614, -1.473026, 3.66119, 0, 0, 0, 1, 1,
0.1607454, -0.300458, 2.587181, 0, 0, 0, 1, 1,
0.161519, 0.3182124, 1.06441, 0, 0, 0, 1, 1,
0.1654587, 0.2080696, 1.132968, 0, 0, 0, 1, 1,
0.1660843, -1.002553, 4.03251, 1, 1, 1, 1, 1,
0.1677399, 0.8470935, -0.4792713, 1, 1, 1, 1, 1,
0.1720062, 0.368699, 0.2988693, 1, 1, 1, 1, 1,
0.1752067, 0.141071, 2.550633, 1, 1, 1, 1, 1,
0.1792862, 0.4626073, 2.412649, 1, 1, 1, 1, 1,
0.1811443, 0.4528923, 2.640939, 1, 1, 1, 1, 1,
0.1819961, 0.8842113, -0.2767971, 1, 1, 1, 1, 1,
0.1821439, 0.3848163, -0.2079891, 1, 1, 1, 1, 1,
0.1821647, 3.078109, 0.4082964, 1, 1, 1, 1, 1,
0.1849823, 1.43714, -2.059029, 1, 1, 1, 1, 1,
0.185349, -0.3938527, 4.065581, 1, 1, 1, 1, 1,
0.1969146, -0.1483167, 2.122209, 1, 1, 1, 1, 1,
0.1994036, -1.211577, 3.758543, 1, 1, 1, 1, 1,
0.2022263, -2.034467, 3.670801, 1, 1, 1, 1, 1,
0.2023842, -0.8052198, 2.943445, 1, 1, 1, 1, 1,
0.2036149, -2.776432, 3.133897, 0, 0, 1, 1, 1,
0.2135574, -1.243742, 2.632321, 1, 0, 0, 1, 1,
0.2153456, 1.347819, 0.345095, 1, 0, 0, 1, 1,
0.2165418, 1.353328, 0.8446761, 1, 0, 0, 1, 1,
0.2171418, -1.148946, 3.003849, 1, 0, 0, 1, 1,
0.2172297, 0.438244, -0.693291, 1, 0, 0, 1, 1,
0.2172949, -1.444355, 1.93389, 0, 0, 0, 1, 1,
0.2192423, 0.4683093, 1.428895, 0, 0, 0, 1, 1,
0.2199577, 0.9056696, 0.03501452, 0, 0, 0, 1, 1,
0.2204472, -1.071732, 2.644915, 0, 0, 0, 1, 1,
0.2228335, 0.08356912, 1.269394, 0, 0, 0, 1, 1,
0.225505, 0.3658747, 1.773553, 0, 0, 0, 1, 1,
0.2269176, -1.211683, 1.113623, 0, 0, 0, 1, 1,
0.2334345, 0.2399611, -1.061966, 1, 1, 1, 1, 1,
0.2415181, 1.409727, -0.4653692, 1, 1, 1, 1, 1,
0.2416535, 0.3593897, 1.058823, 1, 1, 1, 1, 1,
0.242998, 1.6305, -0.2982557, 1, 1, 1, 1, 1,
0.2531986, -1.222514, 3.022228, 1, 1, 1, 1, 1,
0.2576685, -0.175419, 2.745297, 1, 1, 1, 1, 1,
0.2577956, -0.7051505, 1.342394, 1, 1, 1, 1, 1,
0.2582483, -0.4779262, 2.473598, 1, 1, 1, 1, 1,
0.2673423, 1.010723, 0.9879717, 1, 1, 1, 1, 1,
0.2701097, -1.137347, 2.201565, 1, 1, 1, 1, 1,
0.2703606, 0.4755815, 1.000302, 1, 1, 1, 1, 1,
0.270831, 0.7828208, -0.2119928, 1, 1, 1, 1, 1,
0.2713564, 0.9497994, 0.7800896, 1, 1, 1, 1, 1,
0.2728931, 0.6436077, -1.594701, 1, 1, 1, 1, 1,
0.2734816, -0.901579, 3.389296, 1, 1, 1, 1, 1,
0.2747136, 0.7275115, 2.728825, 0, 0, 1, 1, 1,
0.2773784, -1.139804, 0.1942566, 1, 0, 0, 1, 1,
0.2778609, -1.378391, 4.386893, 1, 0, 0, 1, 1,
0.2780437, 0.6163813, 2.285852, 1, 0, 0, 1, 1,
0.2798726, -0.6060548, 2.642475, 1, 0, 0, 1, 1,
0.2857804, -1.031471, 3.51736, 1, 0, 0, 1, 1,
0.2893493, 0.5524221, -1.549432, 0, 0, 0, 1, 1,
0.2939324, -0.7134799, 2.67061, 0, 0, 0, 1, 1,
0.2953131, -0.9477357, 2.527449, 0, 0, 0, 1, 1,
0.2968141, 0.1436055, -0.9317596, 0, 0, 0, 1, 1,
0.2971127, -0.4653751, 2.060475, 0, 0, 0, 1, 1,
0.3035165, 0.09864596, -0.3319454, 0, 0, 0, 1, 1,
0.3056062, 1.555723, 0.3076256, 0, 0, 0, 1, 1,
0.3120837, 0.03228991, -0.7027273, 1, 1, 1, 1, 1,
0.3128579, 1.056282, 0.3241099, 1, 1, 1, 1, 1,
0.3188772, -1.34761, 3.840801, 1, 1, 1, 1, 1,
0.3197546, 0.766102, -0.681694, 1, 1, 1, 1, 1,
0.3208886, -0.9861909, 3.297711, 1, 1, 1, 1, 1,
0.3214455, 2.365231, 0.2230034, 1, 1, 1, 1, 1,
0.3284446, -0.1907198, 4.105585, 1, 1, 1, 1, 1,
0.328594, 0.3032986, 2.05345, 1, 1, 1, 1, 1,
0.3293299, 1.048915, 0.1853254, 1, 1, 1, 1, 1,
0.3322571, 1.021028, 1.081779, 1, 1, 1, 1, 1,
0.3334914, -0.4973318, 2.726357, 1, 1, 1, 1, 1,
0.3380103, 0.03330206, 1.273612, 1, 1, 1, 1, 1,
0.338288, 1.659836, 0.417481, 1, 1, 1, 1, 1,
0.3400713, 2.088161, 1.24694, 1, 1, 1, 1, 1,
0.341766, 0.03076046, 0.06450358, 1, 1, 1, 1, 1,
0.3505057, 1.388811, -0.425797, 0, 0, 1, 1, 1,
0.3513314, -0.4097727, 3.21213, 1, 0, 0, 1, 1,
0.3555814, 1.19754, 0.5886273, 1, 0, 0, 1, 1,
0.3610786, 0.277494, 0.3681273, 1, 0, 0, 1, 1,
0.3620878, 0.7100448, 0.9103602, 1, 0, 0, 1, 1,
0.3629895, -1.611151, 2.211062, 1, 0, 0, 1, 1,
0.3643118, -0.6798701, 4.078563, 0, 0, 0, 1, 1,
0.3655862, 0.06173627, 1.210321, 0, 0, 0, 1, 1,
0.3669387, -0.5974802, 4.093233, 0, 0, 0, 1, 1,
0.3689662, 0.06247915, 2.063001, 0, 0, 0, 1, 1,
0.3795702, -1.863723, 4.496593, 0, 0, 0, 1, 1,
0.3825942, -0.8872321, 3.110645, 0, 0, 0, 1, 1,
0.3831453, 0.6396407, 0.9001764, 0, 0, 0, 1, 1,
0.3876695, -0.327199, 2.955408, 1, 1, 1, 1, 1,
0.3919453, 1.940992, 0.4687832, 1, 1, 1, 1, 1,
0.3934588, 0.1379486, 0.5892068, 1, 1, 1, 1, 1,
0.4016841, -0.8834934, 1.564126, 1, 1, 1, 1, 1,
0.4052845, -0.2905309, 2.743788, 1, 1, 1, 1, 1,
0.4088621, -0.8350013, 3.199948, 1, 1, 1, 1, 1,
0.4215169, 0.06862587, 1.77672, 1, 1, 1, 1, 1,
0.4222491, -0.8171755, 1.99808, 1, 1, 1, 1, 1,
0.423441, 0.0628114, 3.151893, 1, 1, 1, 1, 1,
0.4265007, -1.904392, 3.769551, 1, 1, 1, 1, 1,
0.4275914, 0.2759351, 1.26922, 1, 1, 1, 1, 1,
0.4304893, -0.0533825, 0.5134986, 1, 1, 1, 1, 1,
0.43273, -1.367083, 3.389532, 1, 1, 1, 1, 1,
0.4334939, 0.1882156, 1.899611, 1, 1, 1, 1, 1,
0.4389111, -1.369651, 3.34816, 1, 1, 1, 1, 1,
0.4405201, 3.034226, -1.260102, 0, 0, 1, 1, 1,
0.444892, 2.28239, 0.6130959, 1, 0, 0, 1, 1,
0.4450259, -0.2021549, 2.687685, 1, 0, 0, 1, 1,
0.4474553, -0.2045533, 1.582961, 1, 0, 0, 1, 1,
0.4486483, -0.3071377, 2.68038, 1, 0, 0, 1, 1,
0.4506338, -0.7696378, 1.493137, 1, 0, 0, 1, 1,
0.4626039, 0.2053835, 3.830891, 0, 0, 0, 1, 1,
0.4639619, 0.1925715, 1.077686, 0, 0, 0, 1, 1,
0.4646919, -0.3093497, 1.921529, 0, 0, 0, 1, 1,
0.4710615, 0.8921911, 0.5586649, 0, 0, 0, 1, 1,
0.4743922, -0.7839947, 2.456768, 0, 0, 0, 1, 1,
0.4766833, -2.787446, 2.687425, 0, 0, 0, 1, 1,
0.4775346, -0.8702476, 2.286185, 0, 0, 0, 1, 1,
0.4816352, -0.6438833, 3.133293, 1, 1, 1, 1, 1,
0.4825612, 1.081029, -1.027715, 1, 1, 1, 1, 1,
0.4837264, -2.138368, 2.848243, 1, 1, 1, 1, 1,
0.4852466, -1.430123, 3.567885, 1, 1, 1, 1, 1,
0.4865175, -0.3688972, 2.076574, 1, 1, 1, 1, 1,
0.4892361, 0.6429359, 1.353375, 1, 1, 1, 1, 1,
0.4915705, -0.1935305, 1.227456, 1, 1, 1, 1, 1,
0.4927365, 1.276415, 0.4454487, 1, 1, 1, 1, 1,
0.4930867, 1.870371, -0.7515413, 1, 1, 1, 1, 1,
0.5001085, -0.4476551, 3.711202, 1, 1, 1, 1, 1,
0.5021663, -0.8727745, 3.169064, 1, 1, 1, 1, 1,
0.5029446, -0.6316165, 0.6003037, 1, 1, 1, 1, 1,
0.5082194, -0.5502738, 1.672999, 1, 1, 1, 1, 1,
0.5094084, -2.771539, 4.483945, 1, 1, 1, 1, 1,
0.5125276, 0.1180618, -0.7501521, 1, 1, 1, 1, 1,
0.5126605, -1.032511, 1.958284, 0, 0, 1, 1, 1,
0.513866, 1.457517, 0.8052703, 1, 0, 0, 1, 1,
0.5166004, -1.534758, 2.876126, 1, 0, 0, 1, 1,
0.5194669, 0.3080713, 1.231271, 1, 0, 0, 1, 1,
0.5198985, -0.7471387, 3.583769, 1, 0, 0, 1, 1,
0.5201393, 1.725979, 2.099248, 1, 0, 0, 1, 1,
0.5217194, 1.293493, -1.143424, 0, 0, 0, 1, 1,
0.524242, -1.527856, 3.25395, 0, 0, 0, 1, 1,
0.5254599, -0.9144637, 2.019808, 0, 0, 0, 1, 1,
0.5297937, -1.259779, 3.278263, 0, 0, 0, 1, 1,
0.530993, -0.1785353, 2.610023, 0, 0, 0, 1, 1,
0.5333232, 0.3362591, 0.7319342, 0, 0, 0, 1, 1,
0.5340501, 0.8588567, 1.859657, 0, 0, 0, 1, 1,
0.5343087, -0.1621211, 0.5129763, 1, 1, 1, 1, 1,
0.5365669, -0.6694807, 1.860161, 1, 1, 1, 1, 1,
0.5454768, 1.993299, -0.2200235, 1, 1, 1, 1, 1,
0.5492133, -0.1521542, 2.955735, 1, 1, 1, 1, 1,
0.5503184, 0.6843516, 2.78534, 1, 1, 1, 1, 1,
0.5534018, -1.106666, 1.174091, 1, 1, 1, 1, 1,
0.5537526, -0.8559715, 3.40881, 1, 1, 1, 1, 1,
0.5617715, -0.2572927, 2.002002, 1, 1, 1, 1, 1,
0.5626681, -0.5737837, 1.562387, 1, 1, 1, 1, 1,
0.5646791, 0.2323825, 0.7533929, 1, 1, 1, 1, 1,
0.5759559, 0.1874302, 2.007272, 1, 1, 1, 1, 1,
0.5809362, -0.6955881, 2.94896, 1, 1, 1, 1, 1,
0.5827787, -0.9568717, -0.5752699, 1, 1, 1, 1, 1,
0.585685, 0.7638668, 0.3750865, 1, 1, 1, 1, 1,
0.5875162, 0.9334472, 0.6422824, 1, 1, 1, 1, 1,
0.5878147, -0.5578956, 2.191327, 0, 0, 1, 1, 1,
0.5896868, 0.7536605, -0.4552843, 1, 0, 0, 1, 1,
0.5942832, 0.3349082, -0.3053785, 1, 0, 0, 1, 1,
0.5998498, 0.2526328, 1.604593, 1, 0, 0, 1, 1,
0.6040691, -0.9832759, 1.526445, 1, 0, 0, 1, 1,
0.6047414, 0.0658726, 2.650878, 1, 0, 0, 1, 1,
0.6106694, 0.3837665, 0.5296799, 0, 0, 0, 1, 1,
0.6126679, 0.06172775, 0.6397997, 0, 0, 0, 1, 1,
0.6170045, -0.9603603, 2.765364, 0, 0, 0, 1, 1,
0.6201605, -1.018987, 1.075099, 0, 0, 0, 1, 1,
0.6318496, 1.145577, -1.567277, 0, 0, 0, 1, 1,
0.6347751, -0.1018874, 3.050386, 0, 0, 0, 1, 1,
0.6380062, -0.231599, -0.4343321, 0, 0, 0, 1, 1,
0.6396174, 1.288912, 0.2936583, 1, 1, 1, 1, 1,
0.6399971, -2.474991, 0.5264003, 1, 1, 1, 1, 1,
0.6416037, 0.8104236, 1.015042, 1, 1, 1, 1, 1,
0.6419059, -0.3092225, 1.532848, 1, 1, 1, 1, 1,
0.6491412, -0.7134162, 3.138384, 1, 1, 1, 1, 1,
0.6511956, -0.93396, 1.316941, 1, 1, 1, 1, 1,
0.6518309, -2.042137, 2.472221, 1, 1, 1, 1, 1,
0.6613566, 0.6472365, 0.5329037, 1, 1, 1, 1, 1,
0.6627871, 0.8014274, 0.06519316, 1, 1, 1, 1, 1,
0.6648005, 0.006852733, 1.3179, 1, 1, 1, 1, 1,
0.6667034, 0.1184549, 0.0295988, 1, 1, 1, 1, 1,
0.6720359, -1.269845, 0.4984606, 1, 1, 1, 1, 1,
0.6791751, 0.6593698, 0.888994, 1, 1, 1, 1, 1,
0.6802464, -0.3607064, 1.330167, 1, 1, 1, 1, 1,
0.6807651, 0.06861223, 0.7296105, 1, 1, 1, 1, 1,
0.6832363, 0.08354778, 0.634317, 0, 0, 1, 1, 1,
0.6848268, 0.440372, 1.745571, 1, 0, 0, 1, 1,
0.6906992, -1.403886, 3.562377, 1, 0, 0, 1, 1,
0.6945301, -0.861407, 2.879287, 1, 0, 0, 1, 1,
0.6961585, -1.272312, 2.987411, 1, 0, 0, 1, 1,
0.6978167, 0.4229031, 1.360903, 1, 0, 0, 1, 1,
0.700492, -1.278006, 4.942326, 0, 0, 0, 1, 1,
0.7086901, 1.380589, 0.06115201, 0, 0, 0, 1, 1,
0.7206367, 0.0571719, 1.489855, 0, 0, 0, 1, 1,
0.7213136, 0.7124552, -0.2270246, 0, 0, 0, 1, 1,
0.7220945, 0.6356064, -0.2066854, 0, 0, 0, 1, 1,
0.7231659, 0.1852984, 1.689324, 0, 0, 0, 1, 1,
0.7269856, 1.501647, 0.9536056, 0, 0, 0, 1, 1,
0.7281496, 0.5020805, 1.757466, 1, 1, 1, 1, 1,
0.7328112, 1.176976, -0.2973442, 1, 1, 1, 1, 1,
0.733672, -0.3450828, 1.313648, 1, 1, 1, 1, 1,
0.7420238, 1.376604, -0.5035543, 1, 1, 1, 1, 1,
0.7590761, -1.670652, 2.484724, 1, 1, 1, 1, 1,
0.7604048, -0.7785877, 1.520246, 1, 1, 1, 1, 1,
0.762632, 0.105727, -1.038481, 1, 1, 1, 1, 1,
0.7642292, -0.304674, 2.768405, 1, 1, 1, 1, 1,
0.7656488, -2.020643, 3.494955, 1, 1, 1, 1, 1,
0.7677628, 2.027038, 3.270293, 1, 1, 1, 1, 1,
0.7720107, -0.7730848, 1.434151, 1, 1, 1, 1, 1,
0.7780621, 1.450618, 0.716072, 1, 1, 1, 1, 1,
0.7828359, -1.498055, 2.681657, 1, 1, 1, 1, 1,
0.7849315, -1.790841, 3.905825, 1, 1, 1, 1, 1,
0.7920371, 0.24365, 0.6078396, 1, 1, 1, 1, 1,
0.7925876, -0.9309695, 1.332458, 0, 0, 1, 1, 1,
0.7959281, -0.3107691, 1.404611, 1, 0, 0, 1, 1,
0.8013615, -0.4491329, -0.8932104, 1, 0, 0, 1, 1,
0.8035058, 1.649106, -0.4060336, 1, 0, 0, 1, 1,
0.8106133, -0.9997078, 2.357435, 1, 0, 0, 1, 1,
0.8112532, 1.051791, 0.3760584, 1, 0, 0, 1, 1,
0.8120197, 0.3763918, 1.895783, 0, 0, 0, 1, 1,
0.8124587, 0.02286051, 0.1051246, 0, 0, 0, 1, 1,
0.8137665, 2.050794, 0.07323806, 0, 0, 0, 1, 1,
0.8215923, 0.1512293, 0.2794243, 0, 0, 0, 1, 1,
0.8252798, 0.1309215, 0.445133, 0, 0, 0, 1, 1,
0.826088, -0.6042539, 1.815372, 0, 0, 0, 1, 1,
0.8288282, -1.275627, 1.968501, 0, 0, 0, 1, 1,
0.8312255, 0.9116437, 1.426071, 1, 1, 1, 1, 1,
0.8375188, -0.0469096, 0.9146816, 1, 1, 1, 1, 1,
0.8377304, -0.6115103, 1.008564, 1, 1, 1, 1, 1,
0.837797, 0.6957313, 0.8227029, 1, 1, 1, 1, 1,
0.839016, 1.452284, 0.2692596, 1, 1, 1, 1, 1,
0.8401909, 0.4521965, 2.159239, 1, 1, 1, 1, 1,
0.8410746, 0.5681192, 0.874786, 1, 1, 1, 1, 1,
0.8490371, -0.2539713, 2.132775, 1, 1, 1, 1, 1,
0.8504312, 1.44081, -0.4475625, 1, 1, 1, 1, 1,
0.8541951, -0.8322552, 1.02739, 1, 1, 1, 1, 1,
0.8559807, -2.048146, 4.743864, 1, 1, 1, 1, 1,
0.861711, 0.5933453, 0.7154671, 1, 1, 1, 1, 1,
0.8633487, -0.2801513, 0.7567919, 1, 1, 1, 1, 1,
0.8636103, -0.8255671, 1.853235, 1, 1, 1, 1, 1,
0.8662573, 2.36835, 1.65431, 1, 1, 1, 1, 1,
0.877005, -0.6155048, 3.171571, 0, 0, 1, 1, 1,
0.8821179, 0.9386188, 0.5388479, 1, 0, 0, 1, 1,
0.8825404, 0.06690253, 1.757408, 1, 0, 0, 1, 1,
0.8836195, 0.9018158, 1.317709, 1, 0, 0, 1, 1,
0.8849937, -0.963194, 1.922261, 1, 0, 0, 1, 1,
0.8896611, 0.03718873, 1.434139, 1, 0, 0, 1, 1,
0.8915558, -0.3407945, 3.189825, 0, 0, 0, 1, 1,
0.8977808, 0.4543958, 0.7735268, 0, 0, 0, 1, 1,
0.8993592, -0.7864633, 2.380517, 0, 0, 0, 1, 1,
0.9003671, -0.2955966, 1.623122, 0, 0, 0, 1, 1,
0.903464, -0.2032138, 1.051616, 0, 0, 0, 1, 1,
0.9035987, -0.04794572, -0.1554435, 0, 0, 0, 1, 1,
0.9050375, -0.2330383, 2.457393, 0, 0, 0, 1, 1,
0.9178796, -1.360661, 4.220142, 1, 1, 1, 1, 1,
0.9243916, 0.3632632, 1.839512, 1, 1, 1, 1, 1,
0.9309061, -0.6498098, 2.299893, 1, 1, 1, 1, 1,
0.9370219, -0.9162271, 1.275792, 1, 1, 1, 1, 1,
0.937887, 0.06666331, 3.327233, 1, 1, 1, 1, 1,
0.9379662, -0.2959371, 2.709439, 1, 1, 1, 1, 1,
0.9420878, -1.197883, 1.858307, 1, 1, 1, 1, 1,
0.9608567, 0.8521706, -0.6729984, 1, 1, 1, 1, 1,
0.9618855, 0.2333395, 1.029612, 1, 1, 1, 1, 1,
0.965747, 0.5561219, 2.830122, 1, 1, 1, 1, 1,
0.9705783, 0.3963116, 1.472521, 1, 1, 1, 1, 1,
0.9718385, 0.9230002, 0.561422, 1, 1, 1, 1, 1,
0.9720755, 2.418869, 0.7292487, 1, 1, 1, 1, 1,
0.9768022, -0.8154126, 0.941135, 1, 1, 1, 1, 1,
0.9772874, -0.04079987, 0.7255021, 1, 1, 1, 1, 1,
0.9849371, -0.1297742, 1.83022, 0, 0, 1, 1, 1,
0.9931857, 0.9989181, 0.799185, 1, 0, 0, 1, 1,
0.9980056, -0.7880477, 4.018214, 1, 0, 0, 1, 1,
1.00312, 0.04484594, 0.4887888, 1, 0, 0, 1, 1,
1.003614, 0.3559933, 1.895277, 1, 0, 0, 1, 1,
1.005028, -2.216833, 2.150159, 1, 0, 0, 1, 1,
1.009534, -0.3683307, 1.619249, 0, 0, 0, 1, 1,
1.013202, -1.639805, 1.276495, 0, 0, 0, 1, 1,
1.015325, -0.1078736, 1.227325, 0, 0, 0, 1, 1,
1.019196, 0.03839485, 1.556252, 0, 0, 0, 1, 1,
1.022022, 1.280903, 0.1454087, 0, 0, 0, 1, 1,
1.024872, 1.277947, 0.5559899, 0, 0, 0, 1, 1,
1.025919, -0.9457568, 2.627248, 0, 0, 0, 1, 1,
1.027039, 0.3618874, 2.410725, 1, 1, 1, 1, 1,
1.034868, -1.567001, 1.573231, 1, 1, 1, 1, 1,
1.036012, 0.04646187, 0.3106492, 1, 1, 1, 1, 1,
1.03949, -0.9552968, 4.065872, 1, 1, 1, 1, 1,
1.042025, 1.791599, 0.8573737, 1, 1, 1, 1, 1,
1.046774, -0.6943117, 1.631099, 1, 1, 1, 1, 1,
1.053067, 0.04822313, 0.7933667, 1, 1, 1, 1, 1,
1.05871, 1.689429, 0.9537484, 1, 1, 1, 1, 1,
1.060145, -0.1307718, 1.329566, 1, 1, 1, 1, 1,
1.060165, -1.047349, 3.357593, 1, 1, 1, 1, 1,
1.064336, -0.7935181, 3.311713, 1, 1, 1, 1, 1,
1.0677, -0.669096, 2.4519, 1, 1, 1, 1, 1,
1.078995, -0.8173624, 3.59563, 1, 1, 1, 1, 1,
1.081855, 0.06739634, 1.705421, 1, 1, 1, 1, 1,
1.082948, -1.080407, 2.965327, 1, 1, 1, 1, 1,
1.084948, 0.4756113, 1.4913, 0, 0, 1, 1, 1,
1.087202, 1.755867, 1.46293, 1, 0, 0, 1, 1,
1.105027, 0.1920342, 2.485479, 1, 0, 0, 1, 1,
1.115992, 0.04720759, 2.032813, 1, 0, 0, 1, 1,
1.11601, -1.329827, 0.8788185, 1, 0, 0, 1, 1,
1.118454, -0.1717254, 1.211225, 1, 0, 0, 1, 1,
1.122449, -0.5272654, 1.208876, 0, 0, 0, 1, 1,
1.123136, 0.367934, -0.5905465, 0, 0, 0, 1, 1,
1.124041, 0.6640447, 2.70501, 0, 0, 0, 1, 1,
1.137772, 0.3709641, 4.363378, 0, 0, 0, 1, 1,
1.138798, -1.020946, 2.816547, 0, 0, 0, 1, 1,
1.139006, 0.4541361, 2.414397, 0, 0, 0, 1, 1,
1.141345, -0.4370682, 2.418646, 0, 0, 0, 1, 1,
1.146795, -0.4236182, 2.1448, 1, 1, 1, 1, 1,
1.157806, -1.330133, 2.793938, 1, 1, 1, 1, 1,
1.158295, 1.129648, 0.4855567, 1, 1, 1, 1, 1,
1.158498, 0.200652, 1.149655, 1, 1, 1, 1, 1,
1.161825, 0.7901928, 2.242589, 1, 1, 1, 1, 1,
1.16669, 0.6067007, 0.6945278, 1, 1, 1, 1, 1,
1.166691, -1.414324, 2.525067, 1, 1, 1, 1, 1,
1.175273, -0.4191006, 3.021003, 1, 1, 1, 1, 1,
1.175455, 1.991797, 0.8619512, 1, 1, 1, 1, 1,
1.177049, -0.8133835, 3.82106, 1, 1, 1, 1, 1,
1.179886, -0.573778, 2.791401, 1, 1, 1, 1, 1,
1.191279, -0.8731536, 3.075861, 1, 1, 1, 1, 1,
1.197922, -0.3264469, 3.333515, 1, 1, 1, 1, 1,
1.208866, 1.316899, 1.252049, 1, 1, 1, 1, 1,
1.213463, -1.03112, 1.634794, 1, 1, 1, 1, 1,
1.217791, -0.3053508, 2.549121, 0, 0, 1, 1, 1,
1.227281, -0.8853825, 2.54656, 1, 0, 0, 1, 1,
1.244463, -0.2666928, 1.045835, 1, 0, 0, 1, 1,
1.248377, 0.001312491, 0.7224978, 1, 0, 0, 1, 1,
1.249918, 0.3414399, 1.166563, 1, 0, 0, 1, 1,
1.25636, -0.5194487, 1.201665, 1, 0, 0, 1, 1,
1.273246, 1.08652, 1.606676, 0, 0, 0, 1, 1,
1.273855, 0.9387816, 0.5002837, 0, 0, 0, 1, 1,
1.276276, -0.4876136, 3.49595, 0, 0, 0, 1, 1,
1.279902, 0.8787881, 1.23568, 0, 0, 0, 1, 1,
1.297452, -0.538556, 2.342532, 0, 0, 0, 1, 1,
1.304876, 0.1379354, 1.199338, 0, 0, 0, 1, 1,
1.305664, 0.06484941, 2.245471, 0, 0, 0, 1, 1,
1.306438, 0.5359902, 2.166682, 1, 1, 1, 1, 1,
1.309986, -0.03865776, -0.03839656, 1, 1, 1, 1, 1,
1.310072, -0.3227958, 1.848601, 1, 1, 1, 1, 1,
1.310185, -1.299835, 0.991199, 1, 1, 1, 1, 1,
1.312839, -0.4043407, 0.3737831, 1, 1, 1, 1, 1,
1.314354, 0.9139063, 0.8280396, 1, 1, 1, 1, 1,
1.315725, -0.134307, -1.247118, 1, 1, 1, 1, 1,
1.317441, -0.2722599, 1.54061, 1, 1, 1, 1, 1,
1.344562, -0.4982125, 3.395069, 1, 1, 1, 1, 1,
1.358255, 0.779312, 1.420137, 1, 1, 1, 1, 1,
1.371256, -1.060527, 1.551176, 1, 1, 1, 1, 1,
1.376052, 0.6975005, 1.53093, 1, 1, 1, 1, 1,
1.376289, 0.6690068, 3.39017, 1, 1, 1, 1, 1,
1.376302, -0.9105124, 2.385515, 1, 1, 1, 1, 1,
1.388379, -0.3338916, 1.356543, 1, 1, 1, 1, 1,
1.392321, -0.252166, 1.908111, 0, 0, 1, 1, 1,
1.393618, -0.06676217, 1.945422, 1, 0, 0, 1, 1,
1.396257, -1.71189, 5.158317, 1, 0, 0, 1, 1,
1.409631, 0.3998909, 2.011475, 1, 0, 0, 1, 1,
1.416143, 0.6662841, 0.4311104, 1, 0, 0, 1, 1,
1.420948, 0.6512032, 0.8734598, 1, 0, 0, 1, 1,
1.428943, -0.6957334, 1.150717, 0, 0, 0, 1, 1,
1.432559, -0.8910198, 1.99956, 0, 0, 0, 1, 1,
1.438468, -1.674606, 2.099257, 0, 0, 0, 1, 1,
1.444608, 0.7629256, 0.1402248, 0, 0, 0, 1, 1,
1.449969, 0.02479749, -0.5910931, 0, 0, 0, 1, 1,
1.450912, -0.1819481, 0.4848876, 0, 0, 0, 1, 1,
1.452509, -0.6740445, 1.276599, 0, 0, 0, 1, 1,
1.468536, -1.778249, 4.351426, 1, 1, 1, 1, 1,
1.477332, -0.837994, 3.730424, 1, 1, 1, 1, 1,
1.47959, 0.08307303, 1.390466, 1, 1, 1, 1, 1,
1.480631, 2.616673, 2.133638, 1, 1, 1, 1, 1,
1.482142, 0.7501985, 1.97414, 1, 1, 1, 1, 1,
1.508423, -0.05274353, 1.105702, 1, 1, 1, 1, 1,
1.512697, 0.4252922, 0.599213, 1, 1, 1, 1, 1,
1.524555, -0.5338826, -0.9933131, 1, 1, 1, 1, 1,
1.533076, 0.8631298, 2.656653, 1, 1, 1, 1, 1,
1.533185, 0.2276827, 2.586676, 1, 1, 1, 1, 1,
1.534272, -2.162376, 2.818179, 1, 1, 1, 1, 1,
1.53632, -0.3673107, 1.847469, 1, 1, 1, 1, 1,
1.544785, 0.6474122, 0.8349311, 1, 1, 1, 1, 1,
1.557227, 0.2809167, 1.240291, 1, 1, 1, 1, 1,
1.565217, 0.02753353, 1.590539, 1, 1, 1, 1, 1,
1.578363, 0.871505, 2.210994, 0, 0, 1, 1, 1,
1.592835, -1.090872, 3.439716, 1, 0, 0, 1, 1,
1.606346, -1.264426, 2.317987, 1, 0, 0, 1, 1,
1.622058, 0.4555238, 1.339532, 1, 0, 0, 1, 1,
1.645023, -0.3490623, 1.174404, 1, 0, 0, 1, 1,
1.649264, -1.183291, 1.340155, 1, 0, 0, 1, 1,
1.661952, 1.299076, 0.851392, 0, 0, 0, 1, 1,
1.691615, 2.097291, -0.2170867, 0, 0, 0, 1, 1,
1.691624, -2.364234, 1.986172, 0, 0, 0, 1, 1,
1.715246, -0.1635294, 2.7348, 0, 0, 0, 1, 1,
1.720816, -1.260502, 3.201505, 0, 0, 0, 1, 1,
1.758889, 0.0419705, 2.688681, 0, 0, 0, 1, 1,
1.766393, 1.434745, -0.0554309, 0, 0, 0, 1, 1,
1.775758, 1.533431, 0.248366, 1, 1, 1, 1, 1,
1.811699, 0.7061931, 1.483282, 1, 1, 1, 1, 1,
1.825476, -0.1239701, 3.493704, 1, 1, 1, 1, 1,
1.828964, 1.634419, 0.5438792, 1, 1, 1, 1, 1,
1.843446, -0.3362397, 1.699445, 1, 1, 1, 1, 1,
1.846571, 0.1946659, 0.4605914, 1, 1, 1, 1, 1,
1.854302, -0.6035282, 1.826986, 1, 1, 1, 1, 1,
1.901455, 0.599252, 1.281505, 1, 1, 1, 1, 1,
1.931328, -0.921929, 2.924286, 1, 1, 1, 1, 1,
1.955056, 0.7030079, 3.555716, 1, 1, 1, 1, 1,
1.9803, -0.9983589, 2.048031, 1, 1, 1, 1, 1,
1.993542, 0.8506241, 1.498137, 1, 1, 1, 1, 1,
2.000677, -0.1515631, 2.943566, 1, 1, 1, 1, 1,
2.004695, -0.7051107, 3.896029, 1, 1, 1, 1, 1,
2.086369, -0.4512942, 1.530327, 1, 1, 1, 1, 1,
2.096666, 0.9586846, 0.1514153, 0, 0, 1, 1, 1,
2.123352, -0.8369054, 0.7844158, 1, 0, 0, 1, 1,
2.136505, -1.130113, 2.234767, 1, 0, 0, 1, 1,
2.152936, 1.057693, -0.4986113, 1, 0, 0, 1, 1,
2.158642, -2.033164, 0.8252453, 1, 0, 0, 1, 1,
2.167545, 0.8556278, 0.9124711, 1, 0, 0, 1, 1,
2.207926, -1.198125, 2.367145, 0, 0, 0, 1, 1,
2.21439, -0.1677343, 1.228084, 0, 0, 0, 1, 1,
2.321265, -0.1440196, 4.20383, 0, 0, 0, 1, 1,
2.327564, -1.150018, 0.4450401, 0, 0, 0, 1, 1,
2.352057, 1.46862, 0.1740088, 0, 0, 0, 1, 1,
2.423708, 1.012201, 1.660195, 0, 0, 0, 1, 1,
2.449335, 1.086421, 1.359673, 0, 0, 0, 1, 1,
2.550107, -0.2767358, 1.417525, 1, 1, 1, 1, 1,
2.581784, -1.765083, 2.79962, 1, 1, 1, 1, 1,
2.612129, 0.4963802, 1.062787, 1, 1, 1, 1, 1,
2.623307, 0.7483489, 1.224782, 1, 1, 1, 1, 1,
2.758475, -0.476515, 0.3280614, 1, 1, 1, 1, 1,
2.936719, -0.7202018, 0.977713, 1, 1, 1, 1, 1,
3.437422, -0.2026905, 2.384717, 1, 1, 1, 1, 1
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
var radius = 9.300394;
var distance = 32.66724;
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
mvMatrix.translate( -0.1297312, -0.1453314, -0.03765821 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.66724);
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
