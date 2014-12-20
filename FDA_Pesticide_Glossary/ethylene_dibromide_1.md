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
-3.216951, 1.201847, -0.869696, 1, 0, 0, 1,
-3.159858, -0.2825856, -1.968313, 1, 0.007843138, 0, 1,
-2.938738, -0.6879483, -1.275212, 1, 0.01176471, 0, 1,
-2.871265, 1.533477, -0.3920921, 1, 0.01960784, 0, 1,
-2.825624, 1.957066, -1.047655, 1, 0.02352941, 0, 1,
-2.631937, 0.5819298, -1.146921, 1, 0.03137255, 0, 1,
-2.560231, -0.248319, -2.632941, 1, 0.03529412, 0, 1,
-2.529325, 0.1622606, -1.541784, 1, 0.04313726, 0, 1,
-2.382128, 1.047917, -0.5191582, 1, 0.04705882, 0, 1,
-2.355942, -0.03904237, -0.9686055, 1, 0.05490196, 0, 1,
-2.312918, -1.227164, -2.549909, 1, 0.05882353, 0, 1,
-2.311599, -0.1019645, -1.843124, 1, 0.06666667, 0, 1,
-2.279143, 0.5858275, -0.6882939, 1, 0.07058824, 0, 1,
-2.267772, -0.3297931, -3.393585, 1, 0.07843138, 0, 1,
-2.259237, -0.1111775, -1.071634, 1, 0.08235294, 0, 1,
-2.23958, 0.1687993, -1.239673, 1, 0.09019608, 0, 1,
-2.238635, 0.1077949, -1.314987, 1, 0.09411765, 0, 1,
-2.175915, -0.05935491, -1.462424, 1, 0.1019608, 0, 1,
-2.154606, -0.3318268, -1.453171, 1, 0.1098039, 0, 1,
-2.136333, 0.1719693, -1.248535, 1, 0.1137255, 0, 1,
-2.059466, 0.07543892, -1.792571, 1, 0.1215686, 0, 1,
-2.057585, 0.543399, -0.3374231, 1, 0.1254902, 0, 1,
-2.050229, -1.100129, -1.850369, 1, 0.1333333, 0, 1,
-2.037268, -0.06420938, -2.404553, 1, 0.1372549, 0, 1,
-1.994028, 1.143735, -0.7988201, 1, 0.145098, 0, 1,
-1.978374, 1.529991, -2.056781, 1, 0.1490196, 0, 1,
-1.974053, -0.6169006, -2.402422, 1, 0.1568628, 0, 1,
-1.966939, -0.5932622, -1.293679, 1, 0.1607843, 0, 1,
-1.949259, -1.295007, 0.4811709, 1, 0.1686275, 0, 1,
-1.884258, 1.199848, -1.908435, 1, 0.172549, 0, 1,
-1.874078, 0.9878725, -1.752691, 1, 0.1803922, 0, 1,
-1.870084, -0.5139059, -2.024384, 1, 0.1843137, 0, 1,
-1.860902, 0.3813586, -0.005937384, 1, 0.1921569, 0, 1,
-1.845293, 0.8404633, 0.7864928, 1, 0.1960784, 0, 1,
-1.826883, -0.6965554, -2.304138, 1, 0.2039216, 0, 1,
-1.806582, -0.7789434, -1.844434, 1, 0.2117647, 0, 1,
-1.80045, -0.8247516, -2.196672, 1, 0.2156863, 0, 1,
-1.795704, -1.35795, -2.808017, 1, 0.2235294, 0, 1,
-1.777997, 2.025137, 1.068617, 1, 0.227451, 0, 1,
-1.757835, -0.6001704, -3.560525, 1, 0.2352941, 0, 1,
-1.752674, 0.09751151, -0.5588703, 1, 0.2392157, 0, 1,
-1.718923, 0.2413466, -1.259908, 1, 0.2470588, 0, 1,
-1.707911, -0.1585702, -1.216693, 1, 0.2509804, 0, 1,
-1.701995, 0.3919517, -0.7320811, 1, 0.2588235, 0, 1,
-1.680581, 0.2786262, -1.752536, 1, 0.2627451, 0, 1,
-1.679688, -0.3424979, -0.4564441, 1, 0.2705882, 0, 1,
-1.676341, -1.18801, -1.714523, 1, 0.2745098, 0, 1,
-1.638341, 0.4091865, -0.5636165, 1, 0.282353, 0, 1,
-1.637492, -1.229868, -0.5775177, 1, 0.2862745, 0, 1,
-1.620713, 0.2938804, -2.115532, 1, 0.2941177, 0, 1,
-1.614579, 0.4163577, -1.044984, 1, 0.3019608, 0, 1,
-1.605782, -0.416745, -2.782283, 1, 0.3058824, 0, 1,
-1.583677, -0.3203912, -1.488736, 1, 0.3137255, 0, 1,
-1.572814, -1.043419, -1.66297, 1, 0.3176471, 0, 1,
-1.570235, -0.2379864, -1.27027, 1, 0.3254902, 0, 1,
-1.55649, 0.1931787, -2.264667, 1, 0.3294118, 0, 1,
-1.553941, -0.470818, -3.096132, 1, 0.3372549, 0, 1,
-1.550306, 0.6579224, -0.5996507, 1, 0.3411765, 0, 1,
-1.531926, 1.126963, -0.9287617, 1, 0.3490196, 0, 1,
-1.525728, 1.294928, -1.056008, 1, 0.3529412, 0, 1,
-1.518715, 0.8510378, -0.4120161, 1, 0.3607843, 0, 1,
-1.512608, -0.4605757, -2.49605, 1, 0.3647059, 0, 1,
-1.494011, 0.0624641, -1.373949, 1, 0.372549, 0, 1,
-1.493974, 1.026002, 0.1856342, 1, 0.3764706, 0, 1,
-1.487573, 1.145199, -0.9040824, 1, 0.3843137, 0, 1,
-1.482584, -0.8007697, -1.516916, 1, 0.3882353, 0, 1,
-1.481542, 0.3737956, -1.629165, 1, 0.3960784, 0, 1,
-1.479601, 1.425943, -1.696321, 1, 0.4039216, 0, 1,
-1.479212, -1.806436, -0.5634297, 1, 0.4078431, 0, 1,
-1.471977, -0.7292089, -1.695084, 1, 0.4156863, 0, 1,
-1.45903, 1.25834, -2.371269, 1, 0.4196078, 0, 1,
-1.45286, 1.614295, -1.364221, 1, 0.427451, 0, 1,
-1.451461, 0.9321358, -0.8608558, 1, 0.4313726, 0, 1,
-1.435863, 1.194026, -1.330226, 1, 0.4392157, 0, 1,
-1.431436, -0.852457, -1.922973, 1, 0.4431373, 0, 1,
-1.428208, 1.175401, 0.1825104, 1, 0.4509804, 0, 1,
-1.426793, 0.6353502, -0.7978207, 1, 0.454902, 0, 1,
-1.411032, -0.3583006, -1.783766, 1, 0.4627451, 0, 1,
-1.396881, -1.725078, -2.584792, 1, 0.4666667, 0, 1,
-1.38455, -0.8869528, -2.187736, 1, 0.4745098, 0, 1,
-1.382287, 0.1624417, 0.2125995, 1, 0.4784314, 0, 1,
-1.380269, 1.229725, 0.9291068, 1, 0.4862745, 0, 1,
-1.378546, -0.6998326, -2.442983, 1, 0.4901961, 0, 1,
-1.372892, 0.6954035, -0.5580991, 1, 0.4980392, 0, 1,
-1.371676, 1.319442, 1.068339, 1, 0.5058824, 0, 1,
-1.345134, -2.714578, -0.747096, 1, 0.509804, 0, 1,
-1.341365, 0.2525316, -1.129483, 1, 0.5176471, 0, 1,
-1.334737, 0.5521661, -1.292691, 1, 0.5215687, 0, 1,
-1.301952, -1.621853, -2.142736, 1, 0.5294118, 0, 1,
-1.275478, 0.1580384, -1.252977, 1, 0.5333334, 0, 1,
-1.271449, 1.662995, -2.383382, 1, 0.5411765, 0, 1,
-1.270558, -0.1076842, -1.480912, 1, 0.5450981, 0, 1,
-1.245087, -0.3070311, -1.515828, 1, 0.5529412, 0, 1,
-1.241093, -1.04898, -1.557427, 1, 0.5568628, 0, 1,
-1.239835, -2.120313, -2.805322, 1, 0.5647059, 0, 1,
-1.218351, -0.2066209, -2.588014, 1, 0.5686275, 0, 1,
-1.214938, -0.6022067, -1.183709, 1, 0.5764706, 0, 1,
-1.210842, 0.4659855, -0.270252, 1, 0.5803922, 0, 1,
-1.19532, -0.2923379, -1.272324, 1, 0.5882353, 0, 1,
-1.183036, 0.3306591, -0.8906724, 1, 0.5921569, 0, 1,
-1.176483, 0.8650206, -1.509081, 1, 0.6, 0, 1,
-1.161828, 0.1910956, -2.099882, 1, 0.6078432, 0, 1,
-1.159678, 1.038699, -3.191802, 1, 0.6117647, 0, 1,
-1.159076, -0.6125585, -3.120815, 1, 0.6196079, 0, 1,
-1.157819, 1.271442, -0.3253097, 1, 0.6235294, 0, 1,
-1.154739, 1.268065, -3.0022, 1, 0.6313726, 0, 1,
-1.15066, -0.8449113, -3.672268, 1, 0.6352941, 0, 1,
-1.133654, -0.768627, -3.361802, 1, 0.6431373, 0, 1,
-1.129793, -0.4746462, -0.2034056, 1, 0.6470588, 0, 1,
-1.124604, -0.82175, -1.961784, 1, 0.654902, 0, 1,
-1.123938, -0.7267694, -2.580972, 1, 0.6588235, 0, 1,
-1.123757, 1.661116, -2.001819, 1, 0.6666667, 0, 1,
-1.122765, -0.03627469, -3.845037, 1, 0.6705883, 0, 1,
-1.110665, -1.150042, -2.07285, 1, 0.6784314, 0, 1,
-1.099018, 0.4075143, -1.057387, 1, 0.682353, 0, 1,
-1.098841, -0.9388527, -2.041659, 1, 0.6901961, 0, 1,
-1.089047, 1.244049, -0.03452886, 1, 0.6941177, 0, 1,
-1.088711, 0.9126834, -0.3624342, 1, 0.7019608, 0, 1,
-1.084462, 1.76341, -0.2980658, 1, 0.7098039, 0, 1,
-1.083102, 1.879654, -1.25499, 1, 0.7137255, 0, 1,
-1.082964, -0.2330584, -1.753451, 1, 0.7215686, 0, 1,
-1.082364, 1.196264, -1.087884, 1, 0.7254902, 0, 1,
-1.081686, -2.285083, -3.061457, 1, 0.7333333, 0, 1,
-1.081595, 1.200282, -1.291427, 1, 0.7372549, 0, 1,
-1.08158, 0.8376663, -0.8468667, 1, 0.7450981, 0, 1,
-1.076756, 0.7827969, 0.05626966, 1, 0.7490196, 0, 1,
-1.07636, -0.1537202, -3.008945, 1, 0.7568628, 0, 1,
-1.076257, 0.6489373, -0.6218023, 1, 0.7607843, 0, 1,
-1.07429, 0.09658853, -2.469106, 1, 0.7686275, 0, 1,
-1.067654, 0.2193495, -1.186749, 1, 0.772549, 0, 1,
-1.063108, 1.2997, 1.280395, 1, 0.7803922, 0, 1,
-1.059163, -0.8735283, -3.158844, 1, 0.7843137, 0, 1,
-1.055056, 1.318913, -1.630488, 1, 0.7921569, 0, 1,
-1.05165, 0.1134633, -2.235213, 1, 0.7960784, 0, 1,
-1.049874, -1.304564, -2.490963, 1, 0.8039216, 0, 1,
-1.041552, 0.2985587, -2.401365, 1, 0.8117647, 0, 1,
-1.041136, 0.3344819, -1.107151, 1, 0.8156863, 0, 1,
-1.040512, 0.5216391, -0.2990045, 1, 0.8235294, 0, 1,
-1.038401, 0.8981143, 0.5074729, 1, 0.827451, 0, 1,
-1.037142, 0.2855686, -1.967569, 1, 0.8352941, 0, 1,
-1.036639, 1.788218, 0.2820503, 1, 0.8392157, 0, 1,
-1.031165, -0.9828514, -3.402579, 1, 0.8470588, 0, 1,
-1.028799, -0.3151299, -1.020549, 1, 0.8509804, 0, 1,
-1.02741, 1.414181, -0.6590837, 1, 0.8588235, 0, 1,
-1.017386, -2.54089, -2.360688, 1, 0.8627451, 0, 1,
-1.016722, 0.9350386, -0.7579817, 1, 0.8705882, 0, 1,
-1.014411, -0.9239795, -1.511681, 1, 0.8745098, 0, 1,
-1.010385, -1.958837, -2.089777, 1, 0.8823529, 0, 1,
-1.010261, -1.140208, -3.363808, 1, 0.8862745, 0, 1,
-1.007732, 1.268782, -0.2742662, 1, 0.8941177, 0, 1,
-1.006508, -2.196915, -5.276175, 1, 0.8980392, 0, 1,
-1.00489, 0.1455767, -0.5481251, 1, 0.9058824, 0, 1,
-1.004543, -1.346564, -2.813036, 1, 0.9137255, 0, 1,
-1.003951, -1.333866, -3.091556, 1, 0.9176471, 0, 1,
-1.000912, 0.4384681, -1.819221, 1, 0.9254902, 0, 1,
-0.9972434, 0.7748368, -2.643749, 1, 0.9294118, 0, 1,
-0.9916683, 0.8504789, -0.9991544, 1, 0.9372549, 0, 1,
-0.9898794, 0.8774512, 0.3462941, 1, 0.9411765, 0, 1,
-0.9852225, 1.19399, -1.961316, 1, 0.9490196, 0, 1,
-0.9733652, 1.304238, 0.4541131, 1, 0.9529412, 0, 1,
-0.965115, 0.8695068, -3.504884, 1, 0.9607843, 0, 1,
-0.9630583, -0.2139311, -0.4056932, 1, 0.9647059, 0, 1,
-0.9619225, 0.6684171, -0.4361295, 1, 0.972549, 0, 1,
-0.9575139, 0.3109078, -0.1634231, 1, 0.9764706, 0, 1,
-0.9491979, 0.7245495, -0.06111022, 1, 0.9843137, 0, 1,
-0.9467309, 1.31094, -0.677049, 1, 0.9882353, 0, 1,
-0.9379886, 0.8992375, -1.533977, 1, 0.9960784, 0, 1,
-0.9317341, -0.9578662, -1.825824, 0.9960784, 1, 0, 1,
-0.9312436, 0.5852609, -3.124039, 0.9921569, 1, 0, 1,
-0.916564, -0.4506394, -2.898933, 0.9843137, 1, 0, 1,
-0.9165211, 0.9061166, -0.8818893, 0.9803922, 1, 0, 1,
-0.9074609, -0.1064529, -0.9835668, 0.972549, 1, 0, 1,
-0.9059329, -0.4271894, -2.931371, 0.9686275, 1, 0, 1,
-0.9059168, -0.8307487, -4.506788, 0.9607843, 1, 0, 1,
-0.9051691, -1.005661, -1.468206, 0.9568627, 1, 0, 1,
-0.8955281, -1.689504, -3.24664, 0.9490196, 1, 0, 1,
-0.8946783, -0.4417939, -1.941634, 0.945098, 1, 0, 1,
-0.8887508, 2.457231, -0.8428044, 0.9372549, 1, 0, 1,
-0.886605, -1.235391, -1.891361, 0.9333333, 1, 0, 1,
-0.8842962, 0.4859789, 0.3721834, 0.9254902, 1, 0, 1,
-0.8783349, -1.078449, -1.92375, 0.9215686, 1, 0, 1,
-0.8781673, -0.08398917, -1.880481, 0.9137255, 1, 0, 1,
-0.8781133, 0.04349811, -3.639829, 0.9098039, 1, 0, 1,
-0.8752411, -0.3062958, -1.575137, 0.9019608, 1, 0, 1,
-0.8722442, 0.765894, -1.10566, 0.8941177, 1, 0, 1,
-0.8700053, -1.145522, -4.539937, 0.8901961, 1, 0, 1,
-0.8689335, -0.6172574, -1.917345, 0.8823529, 1, 0, 1,
-0.8665522, -0.6380652, -2.026761, 0.8784314, 1, 0, 1,
-0.8658992, 0.166701, -0.7749729, 0.8705882, 1, 0, 1,
-0.858483, 1.196203, -1.793298, 0.8666667, 1, 0, 1,
-0.8529091, 1.412525, -1.920586, 0.8588235, 1, 0, 1,
-0.8482159, 0.1880528, -0.3766553, 0.854902, 1, 0, 1,
-0.8453871, 0.4386415, -0.2618653, 0.8470588, 1, 0, 1,
-0.8445726, -1.400814, -3.521479, 0.8431373, 1, 0, 1,
-0.8397826, -0.5479949, -1.889168, 0.8352941, 1, 0, 1,
-0.8389155, 1.237579, -0.6601864, 0.8313726, 1, 0, 1,
-0.83876, 0.4200313, -0.2161892, 0.8235294, 1, 0, 1,
-0.8357631, 0.02032951, -2.962225, 0.8196079, 1, 0, 1,
-0.8356135, 0.5496793, -1.870187, 0.8117647, 1, 0, 1,
-0.8336285, 1.454014, -1.036064, 0.8078431, 1, 0, 1,
-0.8211219, 0.5100041, -1.163961, 0.8, 1, 0, 1,
-0.8177761, -0.3788654, -1.502646, 0.7921569, 1, 0, 1,
-0.8170957, 1.574991, -0.4031507, 0.7882353, 1, 0, 1,
-0.8167212, -0.325215, -2.438527, 0.7803922, 1, 0, 1,
-0.8141859, 1.403267, -0.1582407, 0.7764706, 1, 0, 1,
-0.811461, 1.748145, -1.40088, 0.7686275, 1, 0, 1,
-0.8046696, -0.5018607, -0.6570061, 0.7647059, 1, 0, 1,
-0.8021334, -1.62118, -4.374694, 0.7568628, 1, 0, 1,
-0.7964063, -0.2160155, -3.348469, 0.7529412, 1, 0, 1,
-0.7887307, -1.055216, -1.425042, 0.7450981, 1, 0, 1,
-0.7875688, 0.03870608, -1.138475, 0.7411765, 1, 0, 1,
-0.7759448, 1.399787, 1.43286, 0.7333333, 1, 0, 1,
-0.7752345, 0.3587293, -3.044001, 0.7294118, 1, 0, 1,
-0.7696381, -0.05925815, -1.764558, 0.7215686, 1, 0, 1,
-0.7639184, 0.7347373, -3.473738, 0.7176471, 1, 0, 1,
-0.7626441, 0.7239996, -0.2074249, 0.7098039, 1, 0, 1,
-0.7621845, 0.6213573, -1.624423, 0.7058824, 1, 0, 1,
-0.762183, 2.091355, -0.07399813, 0.6980392, 1, 0, 1,
-0.7584317, 0.9734201, -0.7155566, 0.6901961, 1, 0, 1,
-0.7568013, 0.9007913, 0.2857873, 0.6862745, 1, 0, 1,
-0.7567064, 0.5244827, -1.941909, 0.6784314, 1, 0, 1,
-0.7563065, 0.9149873, 0.1571575, 0.6745098, 1, 0, 1,
-0.7476867, -0.3675784, -1.913837, 0.6666667, 1, 0, 1,
-0.7455071, -0.4475906, -3.75696, 0.6627451, 1, 0, 1,
-0.7335257, 0.6857634, -0.01528545, 0.654902, 1, 0, 1,
-0.7292159, -1.642835, -3.223223, 0.6509804, 1, 0, 1,
-0.7164076, -0.2119925, -2.451796, 0.6431373, 1, 0, 1,
-0.7126794, -1.385716, -2.5018, 0.6392157, 1, 0, 1,
-0.7080224, -0.634975, -1.495357, 0.6313726, 1, 0, 1,
-0.694281, -0.6620644, -0.6011876, 0.627451, 1, 0, 1,
-0.6884227, 2.665384, 0.04954308, 0.6196079, 1, 0, 1,
-0.6880206, 0.7620951, -1.202381, 0.6156863, 1, 0, 1,
-0.6786292, -0.5964543, -1.277102, 0.6078432, 1, 0, 1,
-0.6763771, -0.179784, -2.260916, 0.6039216, 1, 0, 1,
-0.6754202, -1.026546, -0.4861759, 0.5960785, 1, 0, 1,
-0.6753985, -2.307378, -1.746138, 0.5882353, 1, 0, 1,
-0.6721712, -0.413231, -2.761947, 0.5843138, 1, 0, 1,
-0.6719984, -0.3217286, -3.065174, 0.5764706, 1, 0, 1,
-0.6702489, 1.147327, 0.680039, 0.572549, 1, 0, 1,
-0.6640821, 1.153644, -1.849547, 0.5647059, 1, 0, 1,
-0.6628917, -0.4755076, -3.233243, 0.5607843, 1, 0, 1,
-0.6571876, 1.544831, -1.452198, 0.5529412, 1, 0, 1,
-0.6544129, 0.2692513, -2.041967, 0.5490196, 1, 0, 1,
-0.6518872, -0.2715643, -2.717342, 0.5411765, 1, 0, 1,
-0.6503688, 0.6218985, 0.3118607, 0.5372549, 1, 0, 1,
-0.6405087, -1.350034, -1.829395, 0.5294118, 1, 0, 1,
-0.6368561, -0.8744705, -1.942943, 0.5254902, 1, 0, 1,
-0.6327009, -0.004268151, -0.9084527, 0.5176471, 1, 0, 1,
-0.63134, 0.03149665, -0.9030651, 0.5137255, 1, 0, 1,
-0.6312776, 1.030697, -0.7727928, 0.5058824, 1, 0, 1,
-0.6244011, 0.9022833, -1.044888, 0.5019608, 1, 0, 1,
-0.6220315, -0.6453521, -1.795616, 0.4941176, 1, 0, 1,
-0.6212301, -1.077943, -1.897182, 0.4862745, 1, 0, 1,
-0.6130232, -0.1240946, -1.635557, 0.4823529, 1, 0, 1,
-0.594901, -0.614414, -3.585891, 0.4745098, 1, 0, 1,
-0.5928019, 0.858868, 0.5241143, 0.4705882, 1, 0, 1,
-0.5855439, -0.5388352, -3.284734, 0.4627451, 1, 0, 1,
-0.5801201, -1.445604, -1.499662, 0.4588235, 1, 0, 1,
-0.5742152, -0.06649045, -2.688338, 0.4509804, 1, 0, 1,
-0.5737213, -0.5633301, -0.8699417, 0.4470588, 1, 0, 1,
-0.5711311, 2.001028, -0.05798152, 0.4392157, 1, 0, 1,
-0.5703368, 0.2514644, -1.943877, 0.4352941, 1, 0, 1,
-0.5690829, -0.2063644, -2.989082, 0.427451, 1, 0, 1,
-0.5630671, -1.263379, -2.686844, 0.4235294, 1, 0, 1,
-0.5618214, -1.378981, -3.343721, 0.4156863, 1, 0, 1,
-0.5555408, -0.1688097, -2.416277, 0.4117647, 1, 0, 1,
-0.547523, -1.1847, -3.295531, 0.4039216, 1, 0, 1,
-0.5473218, 0.09643275, -0.9683901, 0.3960784, 1, 0, 1,
-0.5444977, 1.316705, -2.508834, 0.3921569, 1, 0, 1,
-0.540767, 0.2935647, -1.478528, 0.3843137, 1, 0, 1,
-0.5383708, -1.378524, -4.028039, 0.3803922, 1, 0, 1,
-0.529978, -0.7139248, -2.760863, 0.372549, 1, 0, 1,
-0.5299146, 0.1431416, -3.025057, 0.3686275, 1, 0, 1,
-0.5241803, -1.410111, -4.369446, 0.3607843, 1, 0, 1,
-0.5228242, -0.7038642, -1.357169, 0.3568628, 1, 0, 1,
-0.5223525, -0.3219343, -2.738053, 0.3490196, 1, 0, 1,
-0.5195742, 1.423334, -1.062811, 0.345098, 1, 0, 1,
-0.5188473, 0.9930264, -1.009819, 0.3372549, 1, 0, 1,
-0.5184715, 0.8915873, -1.527776, 0.3333333, 1, 0, 1,
-0.5150442, 1.22555, -0.7321231, 0.3254902, 1, 0, 1,
-0.5132165, 0.4216487, -0.9006919, 0.3215686, 1, 0, 1,
-0.5128171, -0.1852455, -2.742677, 0.3137255, 1, 0, 1,
-0.5113894, 2.335664, 0.2672788, 0.3098039, 1, 0, 1,
-0.5069964, 0.8069406, 0.02473995, 0.3019608, 1, 0, 1,
-0.5063414, 0.193273, -0.08079763, 0.2941177, 1, 0, 1,
-0.5050623, 0.5848572, 0.03154724, 0.2901961, 1, 0, 1,
-0.5029515, -0.2683312, -3.848374, 0.282353, 1, 0, 1,
-0.4996504, 0.05540675, -1.103977, 0.2784314, 1, 0, 1,
-0.4972818, 0.3086349, -0.037712, 0.2705882, 1, 0, 1,
-0.4956076, -1.078675, -3.573411, 0.2666667, 1, 0, 1,
-0.4894221, -0.8914571, -3.101022, 0.2588235, 1, 0, 1,
-0.489413, 1.349459, -0.4273029, 0.254902, 1, 0, 1,
-0.4851711, -0.04488028, -1.250462, 0.2470588, 1, 0, 1,
-0.483693, -0.8350698, -3.284005, 0.2431373, 1, 0, 1,
-0.4821708, 0.3815013, -0.8290432, 0.2352941, 1, 0, 1,
-0.4818665, 1.117187, 0.4273401, 0.2313726, 1, 0, 1,
-0.4777664, -2.090844, -2.477792, 0.2235294, 1, 0, 1,
-0.4764931, 0.1717055, -1.353298, 0.2196078, 1, 0, 1,
-0.4743139, 0.4731697, -1.268988, 0.2117647, 1, 0, 1,
-0.4740871, -1.26043, -3.982258, 0.2078431, 1, 0, 1,
-0.4728878, 0.3824466, -2.133385, 0.2, 1, 0, 1,
-0.4700765, -0.08934352, -0.4829347, 0.1921569, 1, 0, 1,
-0.4665347, -0.08147717, -1.659004, 0.1882353, 1, 0, 1,
-0.4644602, -0.3747199, -2.568333, 0.1803922, 1, 0, 1,
-0.4642666, -0.5839807, -2.842556, 0.1764706, 1, 0, 1,
-0.4637676, -1.277544, -1.47827, 0.1686275, 1, 0, 1,
-0.4609899, 1.158061, -2.171777, 0.1647059, 1, 0, 1,
-0.4557805, -1.36819, -2.380004, 0.1568628, 1, 0, 1,
-0.4548989, 1.087176, 0.5141001, 0.1529412, 1, 0, 1,
-0.4530484, -1.232355, -1.939444, 0.145098, 1, 0, 1,
-0.4460151, 0.3961507, 0.346417, 0.1411765, 1, 0, 1,
-0.4455836, -0.1370516, -3.125302, 0.1333333, 1, 0, 1,
-0.4403335, 0.8367481, 0.5205513, 0.1294118, 1, 0, 1,
-0.4305863, -0.7852081, -2.130515, 0.1215686, 1, 0, 1,
-0.4246715, 0.8996463, 0.4177085, 0.1176471, 1, 0, 1,
-0.4237624, 0.7061676, 0.07415901, 0.1098039, 1, 0, 1,
-0.4196377, 0.1223831, -0.7719415, 0.1058824, 1, 0, 1,
-0.4172128, 0.8729283, 0.1016461, 0.09803922, 1, 0, 1,
-0.4160237, -0.4099057, -2.635486, 0.09019608, 1, 0, 1,
-0.4033966, 0.04838302, -1.787545, 0.08627451, 1, 0, 1,
-0.3940376, -1.238607, -4.181716, 0.07843138, 1, 0, 1,
-0.3921811, -0.4444049, -3.54018, 0.07450981, 1, 0, 1,
-0.3881035, -0.024992, -3.220939, 0.06666667, 1, 0, 1,
-0.3865456, 0.8322009, 0.1843701, 0.0627451, 1, 0, 1,
-0.3846596, 0.8008988, -1.433803, 0.05490196, 1, 0, 1,
-0.3837327, -0.09130125, -2.320687, 0.05098039, 1, 0, 1,
-0.3828121, -0.5260196, -2.780365, 0.04313726, 1, 0, 1,
-0.3798889, -1.689609, -3.642053, 0.03921569, 1, 0, 1,
-0.376627, 0.8025436, -1.532962, 0.03137255, 1, 0, 1,
-0.3745861, -0.7247691, -1.294641, 0.02745098, 1, 0, 1,
-0.3736386, 0.3888058, 0.7562233, 0.01960784, 1, 0, 1,
-0.3726263, 1.049496, -1.742206, 0.01568628, 1, 0, 1,
-0.364832, -0.1549569, -1.755563, 0.007843138, 1, 0, 1,
-0.3639697, 1.027352, 0.374406, 0.003921569, 1, 0, 1,
-0.3619062, 0.4690672, -2.096126, 0, 1, 0.003921569, 1,
-0.3592936, 1.575249, -1.425608, 0, 1, 0.01176471, 1,
-0.3564854, -0.8197218, -2.51246, 0, 1, 0.01568628, 1,
-0.349353, 0.8356139, -0.4797359, 0, 1, 0.02352941, 1,
-0.3474876, -0.182864, 0.04698924, 0, 1, 0.02745098, 1,
-0.3457425, 1.685552, -1.125165, 0, 1, 0.03529412, 1,
-0.3452468, -0.214909, -2.002528, 0, 1, 0.03921569, 1,
-0.3431146, -0.1256967, -2.756988, 0, 1, 0.04705882, 1,
-0.3410037, 1.130698, -0.4205332, 0, 1, 0.05098039, 1,
-0.3323911, -0.4013968, -3.624879, 0, 1, 0.05882353, 1,
-0.3317519, 0.7610278, -0.05302228, 0, 1, 0.0627451, 1,
-0.3311409, 0.6170094, -0.1735016, 0, 1, 0.07058824, 1,
-0.3293008, 0.4236221, -0.4358895, 0, 1, 0.07450981, 1,
-0.3291043, 0.1166079, -0.2982875, 0, 1, 0.08235294, 1,
-0.3249431, -1.908905, -3.78496, 0, 1, 0.08627451, 1,
-0.3249179, -0.5077103, -3.285971, 0, 1, 0.09411765, 1,
-0.3233643, 0.2881159, -0.1846177, 0, 1, 0.1019608, 1,
-0.3204537, -0.1836987, 0.145905, 0, 1, 0.1058824, 1,
-0.3189755, 1.020204, -0.4271913, 0, 1, 0.1137255, 1,
-0.3111692, 1.424017, -0.8006136, 0, 1, 0.1176471, 1,
-0.3092282, 0.9658035, 0.3566805, 0, 1, 0.1254902, 1,
-0.3074394, -0.01210257, 0.4576609, 0, 1, 0.1294118, 1,
-0.3065203, 0.1842972, 0.250178, 0, 1, 0.1372549, 1,
-0.3057154, 0.6821564, -0.08700392, 0, 1, 0.1411765, 1,
-0.3018627, 0.8460675, -1.201347, 0, 1, 0.1490196, 1,
-0.2971743, 0.4969235, -0.523186, 0, 1, 0.1529412, 1,
-0.2943625, -0.3690571, -1.570195, 0, 1, 0.1607843, 1,
-0.2912203, 0.2301903, -1.581543, 0, 1, 0.1647059, 1,
-0.2885154, 0.01691818, -2.282168, 0, 1, 0.172549, 1,
-0.2808006, -0.3531612, -3.876627, 0, 1, 0.1764706, 1,
-0.2786546, 1.239046, 0.5928258, 0, 1, 0.1843137, 1,
-0.2782377, 0.9502167, -0.1181529, 0, 1, 0.1882353, 1,
-0.275427, 0.7261164, 0.3848418, 0, 1, 0.1960784, 1,
-0.2748356, -0.2002672, -2.423612, 0, 1, 0.2039216, 1,
-0.2738619, 1.451857, -0.9379496, 0, 1, 0.2078431, 1,
-0.2705907, 0.3335673, 1.571467, 0, 1, 0.2156863, 1,
-0.2663245, -0.3409456, -1.452757, 0, 1, 0.2196078, 1,
-0.2636522, 0.3960243, -0.7320877, 0, 1, 0.227451, 1,
-0.262123, -1.005131, -2.071866, 0, 1, 0.2313726, 1,
-0.2604914, 0.1875654, -0.3162127, 0, 1, 0.2392157, 1,
-0.2603165, 1.564101, -0.6416391, 0, 1, 0.2431373, 1,
-0.2602185, 0.3692437, -0.5513062, 0, 1, 0.2509804, 1,
-0.2598409, -0.0381734, -0.9254678, 0, 1, 0.254902, 1,
-0.2588583, 2.053109, -1.59561, 0, 1, 0.2627451, 1,
-0.2584187, 0.7131941, -1.511893, 0, 1, 0.2666667, 1,
-0.2575414, 2.08724, 0.4092555, 0, 1, 0.2745098, 1,
-0.2557463, 1.531187, -0.1017992, 0, 1, 0.2784314, 1,
-0.2544702, -1.20796, -3.137889, 0, 1, 0.2862745, 1,
-0.2535406, -0.4192047, -1.870395, 0, 1, 0.2901961, 1,
-0.253361, 0.4469417, -0.6802399, 0, 1, 0.2980392, 1,
-0.2523912, -0.2778148, -2.226256, 0, 1, 0.3058824, 1,
-0.2476596, 0.01926479, -1.657223, 0, 1, 0.3098039, 1,
-0.2399237, 0.9582685, -0.7648106, 0, 1, 0.3176471, 1,
-0.2398384, -1.99036, -4.253009, 0, 1, 0.3215686, 1,
-0.2395695, 0.1815037, -1.221384, 0, 1, 0.3294118, 1,
-0.2350746, -0.08371691, -1.905886, 0, 1, 0.3333333, 1,
-0.233631, 1.546259, -0.6444859, 0, 1, 0.3411765, 1,
-0.2262107, 0.04323633, 0.4697846, 0, 1, 0.345098, 1,
-0.2240277, -1.211321, -3.096586, 0, 1, 0.3529412, 1,
-0.2239124, 0.3569432, 0.09921642, 0, 1, 0.3568628, 1,
-0.2164435, -0.2748509, -2.523657, 0, 1, 0.3647059, 1,
-0.2143505, -0.1244342, -0.9797041, 0, 1, 0.3686275, 1,
-0.205797, -0.6126295, -2.045193, 0, 1, 0.3764706, 1,
-0.2044831, -0.8084173, -1.224582, 0, 1, 0.3803922, 1,
-0.2026522, -1.014287, -3.582927, 0, 1, 0.3882353, 1,
-0.2024996, -1.004519, -1.349926, 0, 1, 0.3921569, 1,
-0.2021407, 1.244883, 0.7938989, 0, 1, 0.4, 1,
-0.2017003, -0.6325072, -1.795793, 0, 1, 0.4078431, 1,
-0.2011269, 0.6668629, -0.2353792, 0, 1, 0.4117647, 1,
-0.2006352, 1.382929, 1.339976, 0, 1, 0.4196078, 1,
-0.1963199, 0.8909742, -1.538574, 0, 1, 0.4235294, 1,
-0.1961074, 0.7626513, -0.4312328, 0, 1, 0.4313726, 1,
-0.1944142, 0.411688, -0.3091805, 0, 1, 0.4352941, 1,
-0.191809, -0.06313305, -0.8065565, 0, 1, 0.4431373, 1,
-0.1911772, -1.667351, -1.948038, 0, 1, 0.4470588, 1,
-0.1910131, -0.2915148, -4.24614, 0, 1, 0.454902, 1,
-0.1883872, 0.906946, 0.215185, 0, 1, 0.4588235, 1,
-0.1869332, 0.8650553, -1.509051, 0, 1, 0.4666667, 1,
-0.1854235, -0.4053981, -2.784098, 0, 1, 0.4705882, 1,
-0.1830458, 1.507057, -0.8785715, 0, 1, 0.4784314, 1,
-0.1797608, 0.1300744, 0.2286685, 0, 1, 0.4823529, 1,
-0.1763417, 1.474491, -0.7295194, 0, 1, 0.4901961, 1,
-0.1762094, -0.1148865, -1.787419, 0, 1, 0.4941176, 1,
-0.1678732, -1.161862, -0.8839156, 0, 1, 0.5019608, 1,
-0.1664739, -0.05620158, 0.4096384, 0, 1, 0.509804, 1,
-0.1662394, 0.8718852, 0.2003127, 0, 1, 0.5137255, 1,
-0.1654842, 1.248259, -0.6813827, 0, 1, 0.5215687, 1,
-0.1654261, 0.5498787, -1.050507, 0, 1, 0.5254902, 1,
-0.1616082, -1.83107, -1.794587, 0, 1, 0.5333334, 1,
-0.159685, -0.5773388, -2.299524, 0, 1, 0.5372549, 1,
-0.1564502, -2.147654, -2.174717, 0, 1, 0.5450981, 1,
-0.1560986, -0.6454816, -2.448298, 0, 1, 0.5490196, 1,
-0.1559192, 0.2091303, 0.2289769, 0, 1, 0.5568628, 1,
-0.1557296, -1.269637, -2.433818, 0, 1, 0.5607843, 1,
-0.1556618, -0.1100188, -2.427713, 0, 1, 0.5686275, 1,
-0.1552974, 0.6848317, -0.399191, 0, 1, 0.572549, 1,
-0.153607, -0.337451, -3.504451, 0, 1, 0.5803922, 1,
-0.1525809, 0.4196554, -0.5680383, 0, 1, 0.5843138, 1,
-0.150327, -0.0788771, -2.447078, 0, 1, 0.5921569, 1,
-0.1456247, 0.4511511, -0.09173083, 0, 1, 0.5960785, 1,
-0.1447295, -1.544456, -4.037295, 0, 1, 0.6039216, 1,
-0.1398324, -0.4610552, -3.763285, 0, 1, 0.6117647, 1,
-0.1384243, 1.255972, 0.1143211, 0, 1, 0.6156863, 1,
-0.135839, 1.430985, -0.7361912, 0, 1, 0.6235294, 1,
-0.1349978, 0.3055106, 0.6508711, 0, 1, 0.627451, 1,
-0.12971, -0.1688259, -3.614238, 0, 1, 0.6352941, 1,
-0.1183741, 2.045238, 0.1868364, 0, 1, 0.6392157, 1,
-0.1123176, -0.7149249, -2.380436, 0, 1, 0.6470588, 1,
-0.1091605, 0.3788389, -0.2337584, 0, 1, 0.6509804, 1,
-0.1089985, -0.317696, -1.832784, 0, 1, 0.6588235, 1,
-0.104481, -1.112078, -3.536646, 0, 1, 0.6627451, 1,
-0.1021401, -0.458813, -5.687907, 0, 1, 0.6705883, 1,
-0.08894313, 0.619076, -0.1121695, 0, 1, 0.6745098, 1,
-0.08497958, 0.2182164, -0.4563708, 0, 1, 0.682353, 1,
-0.08382266, -0.5601775, -1.709258, 0, 1, 0.6862745, 1,
-0.08330981, 0.6900343, -0.1935881, 0, 1, 0.6941177, 1,
-0.08176477, -0.8012206, -2.199783, 0, 1, 0.7019608, 1,
-0.08016553, -1.469526, -2.639705, 0, 1, 0.7058824, 1,
-0.07623421, 0.3527449, -1.210777, 0, 1, 0.7137255, 1,
-0.07569801, -0.1159661, -1.706428, 0, 1, 0.7176471, 1,
-0.07553968, -0.2243821, -1.942037, 0, 1, 0.7254902, 1,
-0.06928473, 0.2899523, 0.7760344, 0, 1, 0.7294118, 1,
-0.06766734, 1.708215, 1.108756, 0, 1, 0.7372549, 1,
-0.06638957, 1.083197, -0.3006284, 0, 1, 0.7411765, 1,
-0.06248734, -0.02552561, -1.877642, 0, 1, 0.7490196, 1,
-0.0617388, 1.754803, 0.02954056, 0, 1, 0.7529412, 1,
-0.05952903, 1.244135, 1.211245, 0, 1, 0.7607843, 1,
-0.05798193, 0.3782633, -0.5138735, 0, 1, 0.7647059, 1,
-0.05304598, -2.671418, -4.45675, 0, 1, 0.772549, 1,
-0.05145613, -0.1407963, -2.017751, 0, 1, 0.7764706, 1,
-0.04848178, -0.5523301, -2.834219, 0, 1, 0.7843137, 1,
-0.04603919, -0.1182442, -3.525316, 0, 1, 0.7882353, 1,
-0.04247005, -0.311689, -3.55874, 0, 1, 0.7960784, 1,
-0.04224627, -0.5741749, -3.078554, 0, 1, 0.8039216, 1,
-0.04023701, 0.2725832, -0.8649201, 0, 1, 0.8078431, 1,
-0.0377192, 0.8671731, 2.275942, 0, 1, 0.8156863, 1,
-0.0317296, -1.323082, -3.53086, 0, 1, 0.8196079, 1,
-0.03142459, -1.885387, -3.628442, 0, 1, 0.827451, 1,
-0.02900544, 0.1230434, -1.304509, 0, 1, 0.8313726, 1,
-0.02838783, -1.528077, -1.808297, 0, 1, 0.8392157, 1,
-0.02635771, 0.05930577, -0.5904084, 0, 1, 0.8431373, 1,
-0.02344791, -1.618753, -2.995319, 0, 1, 0.8509804, 1,
-0.02283501, -0.8334998, -1.396552, 0, 1, 0.854902, 1,
-0.02083973, 0.4075547, 0.3486202, 0, 1, 0.8627451, 1,
-0.01968275, 1.721481, -0.2778637, 0, 1, 0.8666667, 1,
-0.0194791, 1.663872, -1.13639, 0, 1, 0.8745098, 1,
-0.01696295, -0.8298929, -4.694273, 0, 1, 0.8784314, 1,
-0.01686051, 1.083314, 0.6288114, 0, 1, 0.8862745, 1,
-0.01674208, -0.1295964, -2.095013, 0, 1, 0.8901961, 1,
-0.01650655, -1.050694, -3.157469, 0, 1, 0.8980392, 1,
-0.01489597, -0.2683682, -0.5929017, 0, 1, 0.9058824, 1,
-0.01418704, 1.612976, -0.5302345, 0, 1, 0.9098039, 1,
-0.01247252, -0.6543902, -2.964428, 0, 1, 0.9176471, 1,
-0.01110235, -1.068477, -2.850103, 0, 1, 0.9215686, 1,
-0.01022297, 1.1004, 1.072407, 0, 1, 0.9294118, 1,
-0.008677341, -1.271778, -2.970476, 0, 1, 0.9333333, 1,
-0.006173709, -1.093842, -2.867051, 0, 1, 0.9411765, 1,
-0.001652642, -1.226105, -1.992592, 0, 1, 0.945098, 1,
-0.00138424, 0.4575542, -1.070269, 0, 1, 0.9529412, 1,
0.0005003089, -0.1720618, 4.693866, 0, 1, 0.9568627, 1,
0.003457578, -0.4509487, 2.627309, 0, 1, 0.9647059, 1,
0.004954314, 0.3361874, 1.346974, 0, 1, 0.9686275, 1,
0.006542637, -3.261555, 2.643374, 0, 1, 0.9764706, 1,
0.008742617, -0.5316433, 3.447816, 0, 1, 0.9803922, 1,
0.009153438, 0.118081, -0.8147318, 0, 1, 0.9882353, 1,
0.0110371, 0.3583097, 0.5481912, 0, 1, 0.9921569, 1,
0.01326733, 1.111074, 0.308992, 0, 1, 1, 1,
0.01728168, 1.593046, -1.616582, 0, 0.9921569, 1, 1,
0.01896123, -0.6725232, 3.232135, 0, 0.9882353, 1, 1,
0.01912538, 0.01992575, 0.8390145, 0, 0.9803922, 1, 1,
0.02093979, 0.4476204, -1.560141, 0, 0.9764706, 1, 1,
0.02145962, -0.9938427, 4.12897, 0, 0.9686275, 1, 1,
0.02330866, -0.555366, 4.59971, 0, 0.9647059, 1, 1,
0.02620552, 0.6848769, -1.07414, 0, 0.9568627, 1, 1,
0.02642363, 0.2006987, 1.22887, 0, 0.9529412, 1, 1,
0.02750096, 0.2633859, 0.5104768, 0, 0.945098, 1, 1,
0.02950087, -2.573529, 3.647554, 0, 0.9411765, 1, 1,
0.03077973, -0.8144361, 2.389392, 0, 0.9333333, 1, 1,
0.03127878, -0.04517929, 1.64344, 0, 0.9294118, 1, 1,
0.03299277, 1.908656, -1.990908, 0, 0.9215686, 1, 1,
0.03334199, 1.709813, -0.4490214, 0, 0.9176471, 1, 1,
0.03502182, 0.2558269, 1.333492, 0, 0.9098039, 1, 1,
0.03570895, 1.749259, -0.1153916, 0, 0.9058824, 1, 1,
0.03592576, 0.9598716, 1.563788, 0, 0.8980392, 1, 1,
0.03807685, 0.5478452, -0.2855077, 0, 0.8901961, 1, 1,
0.04049505, 1.179926, 0.8939964, 0, 0.8862745, 1, 1,
0.0439177, -0.1786431, 2.13738, 0, 0.8784314, 1, 1,
0.05006663, 0.2572615, 1.145277, 0, 0.8745098, 1, 1,
0.05094917, -0.2606513, 3.51739, 0, 0.8666667, 1, 1,
0.05484252, 0.1049057, -0.1202214, 0, 0.8627451, 1, 1,
0.05825079, 0.09974308, 1.558293, 0, 0.854902, 1, 1,
0.05909735, 0.4293813, 0.502181, 0, 0.8509804, 1, 1,
0.05976135, 0.9311317, 1.486154, 0, 0.8431373, 1, 1,
0.0615863, 0.495494, -1.433635, 0, 0.8392157, 1, 1,
0.06957184, 0.3899896, 0.9212664, 0, 0.8313726, 1, 1,
0.07330138, -1.436286, 1.097202, 0, 0.827451, 1, 1,
0.07371336, -0.1786512, 4.447721, 0, 0.8196079, 1, 1,
0.07577976, -0.4476584, 2.299336, 0, 0.8156863, 1, 1,
0.07898164, 0.6976842, -0.2384161, 0, 0.8078431, 1, 1,
0.08253728, 0.5790349, 0.9283136, 0, 0.8039216, 1, 1,
0.08275143, -1.390258, 3.534896, 0, 0.7960784, 1, 1,
0.08319046, -0.5516565, 2.985571, 0, 0.7882353, 1, 1,
0.08338729, -0.1101072, 1.805937, 0, 0.7843137, 1, 1,
0.08374735, -0.7321547, 3.954162, 0, 0.7764706, 1, 1,
0.08492023, -1.314741, 3.382527, 0, 0.772549, 1, 1,
0.086092, -0.07915504, 4.157374, 0, 0.7647059, 1, 1,
0.08776645, -0.433008, 3.859927, 0, 0.7607843, 1, 1,
0.09091681, 1.200127, 0.6666363, 0, 0.7529412, 1, 1,
0.09209993, 0.2673764, -0.2536167, 0, 0.7490196, 1, 1,
0.09352113, -1.582521, 4.227139, 0, 0.7411765, 1, 1,
0.09400915, -2.189631, 3.954259, 0, 0.7372549, 1, 1,
0.09589429, -1.125762, 2.539932, 0, 0.7294118, 1, 1,
0.09624794, 2.25752, 0.3880958, 0, 0.7254902, 1, 1,
0.09975152, -1.03818, 2.202749, 0, 0.7176471, 1, 1,
0.104833, 0.5584887, 0.4365631, 0, 0.7137255, 1, 1,
0.1052466, 0.1099719, 0.8403686, 0, 0.7058824, 1, 1,
0.1066605, 1.083484, -1.595835, 0, 0.6980392, 1, 1,
0.1104374, 0.3659801, 1.157505, 0, 0.6941177, 1, 1,
0.111509, -0.5520906, 3.247048, 0, 0.6862745, 1, 1,
0.1147768, -0.5667531, 4.028001, 0, 0.682353, 1, 1,
0.1153239, -1.346637, 2.444486, 0, 0.6745098, 1, 1,
0.1158212, 1.083359, -0.6573594, 0, 0.6705883, 1, 1,
0.1169816, 0.8856574, -0.1374475, 0, 0.6627451, 1, 1,
0.11882, -1.004492, 3.779131, 0, 0.6588235, 1, 1,
0.1194272, 0.5455664, -0.9519047, 0, 0.6509804, 1, 1,
0.132037, -0.819106, 2.924844, 0, 0.6470588, 1, 1,
0.1344318, -0.3845274, 4.297734, 0, 0.6392157, 1, 1,
0.1392003, -0.7833951, 1.369838, 0, 0.6352941, 1, 1,
0.1402203, -0.5757368, 1.713936, 0, 0.627451, 1, 1,
0.1445152, 0.1132163, 2.460518, 0, 0.6235294, 1, 1,
0.1446708, 0.4728504, 0.7925031, 0, 0.6156863, 1, 1,
0.1458688, -1.169802, 1.359576, 0, 0.6117647, 1, 1,
0.1472098, 0.1193453, -0.1407861, 0, 0.6039216, 1, 1,
0.1485798, -0.4199055, 3.512666, 0, 0.5960785, 1, 1,
0.151404, -0.6228455, 4.801283, 0, 0.5921569, 1, 1,
0.1514377, -0.8587101, 1.026579, 0, 0.5843138, 1, 1,
0.1548022, 1.017906, -0.4226121, 0, 0.5803922, 1, 1,
0.1555406, 0.3293885, -1.025953, 0, 0.572549, 1, 1,
0.1576525, 0.8721884, 1.982817, 0, 0.5686275, 1, 1,
0.1583908, -0.0790844, 2.624192, 0, 0.5607843, 1, 1,
0.1594979, -0.2203111, 1.661945, 0, 0.5568628, 1, 1,
0.1597059, 1.014962, 1.161614, 0, 0.5490196, 1, 1,
0.1619362, 0.9832883, 0.9580836, 0, 0.5450981, 1, 1,
0.1640341, -0.668026, 4.617563, 0, 0.5372549, 1, 1,
0.1641791, 0.8255869, -0.7807118, 0, 0.5333334, 1, 1,
0.1701932, -0.8870251, 3.105899, 0, 0.5254902, 1, 1,
0.1709144, 0.9581504, -0.04683141, 0, 0.5215687, 1, 1,
0.1746593, 0.7955515, -1.394665, 0, 0.5137255, 1, 1,
0.1747519, 1.074184, 0.7745743, 0, 0.509804, 1, 1,
0.1773808, -1.46379, 1.83333, 0, 0.5019608, 1, 1,
0.1776839, -0.6212199, 4.865408, 0, 0.4941176, 1, 1,
0.178692, 0.09231557, 0.4329967, 0, 0.4901961, 1, 1,
0.1812902, -1.078812, 2.378544, 0, 0.4823529, 1, 1,
0.1824395, 0.8824455, 1.348293, 0, 0.4784314, 1, 1,
0.1890043, 0.5779927, 2.752691, 0, 0.4705882, 1, 1,
0.1969208, 1.206523, -0.02590255, 0, 0.4666667, 1, 1,
0.1998979, 0.453517, 0.3628538, 0, 0.4588235, 1, 1,
0.2010698, -1.877455, 3.959247, 0, 0.454902, 1, 1,
0.201731, -0.01143205, 1.155839, 0, 0.4470588, 1, 1,
0.2063179, -0.02505147, 4.360425, 0, 0.4431373, 1, 1,
0.2088548, -0.2220085, 2.155735, 0, 0.4352941, 1, 1,
0.2090887, 0.8649625, -1.075714, 0, 0.4313726, 1, 1,
0.2098096, 0.3506651, 1.443523, 0, 0.4235294, 1, 1,
0.2211096, 0.2636852, 3.331692, 0, 0.4196078, 1, 1,
0.2225788, -2.483594, 1.473458, 0, 0.4117647, 1, 1,
0.2245303, 0.5081925, -0.3234778, 0, 0.4078431, 1, 1,
0.2305518, -0.5687887, 3.769555, 0, 0.4, 1, 1,
0.2424825, 1.622932, -1.631367, 0, 0.3921569, 1, 1,
0.24943, -0.8261352, 3.244113, 0, 0.3882353, 1, 1,
0.2517216, -1.000951, 2.768521, 0, 0.3803922, 1, 1,
0.2521693, -1.706309, 4.783207, 0, 0.3764706, 1, 1,
0.2577348, -0.5424178, 2.910465, 0, 0.3686275, 1, 1,
0.2587053, -0.2782795, 1.995195, 0, 0.3647059, 1, 1,
0.2610683, 0.2014567, 1.331536, 0, 0.3568628, 1, 1,
0.2639055, 2.271719, 0.08115332, 0, 0.3529412, 1, 1,
0.2667232, -0.7581769, 2.649547, 0, 0.345098, 1, 1,
0.2685039, 0.2362729, 1.232946, 0, 0.3411765, 1, 1,
0.2696008, -0.8610578, 2.434112, 0, 0.3333333, 1, 1,
0.2745399, 0.6528817, -1.359723, 0, 0.3294118, 1, 1,
0.2772233, 0.9693613, 0.4104576, 0, 0.3215686, 1, 1,
0.2775183, 0.686083, -1.111619, 0, 0.3176471, 1, 1,
0.2789381, 0.7631063, 0.2591054, 0, 0.3098039, 1, 1,
0.2851317, 1.013622, 0.4213124, 0, 0.3058824, 1, 1,
0.288859, 1.150229, -0.2660371, 0, 0.2980392, 1, 1,
0.2891553, -1.193682, 3.20077, 0, 0.2901961, 1, 1,
0.2922221, -1.445648, 3.235091, 0, 0.2862745, 1, 1,
0.2960568, -0.1997532, 3.731183, 0, 0.2784314, 1, 1,
0.2967185, 0.5622252, 0.2845131, 0, 0.2745098, 1, 1,
0.3050584, -1.416597, 2.404527, 0, 0.2666667, 1, 1,
0.3057028, 0.1854832, 1.836698, 0, 0.2627451, 1, 1,
0.311204, -0.8667797, 2.725658, 0, 0.254902, 1, 1,
0.3136944, -0.320017, 1.3999, 0, 0.2509804, 1, 1,
0.3146565, -0.5133853, 2.28213, 0, 0.2431373, 1, 1,
0.3146572, 0.5651075, -0.2819009, 0, 0.2392157, 1, 1,
0.3181508, 0.8147812, 0.8761108, 0, 0.2313726, 1, 1,
0.3182607, -0.9515032, 2.958176, 0, 0.227451, 1, 1,
0.3188782, -0.168276, 3.001116, 0, 0.2196078, 1, 1,
0.3248146, -1.692426, 3.47708, 0, 0.2156863, 1, 1,
0.329224, -0.08046442, 0.1631867, 0, 0.2078431, 1, 1,
0.33186, 0.5641756, 0.1766132, 0, 0.2039216, 1, 1,
0.3383583, 1.378485, -0.7794235, 0, 0.1960784, 1, 1,
0.34448, -0.04114026, 2.215455, 0, 0.1882353, 1, 1,
0.3449563, -0.05408389, 0.6843834, 0, 0.1843137, 1, 1,
0.3522139, 0.5424047, 0.3076649, 0, 0.1764706, 1, 1,
0.3560569, 1.119048, -0.3854286, 0, 0.172549, 1, 1,
0.3569, -0.4914714, 3.044106, 0, 0.1647059, 1, 1,
0.3585197, 0.4410261, -1.131109, 0, 0.1607843, 1, 1,
0.3588476, -1.049228, 3.289345, 0, 0.1529412, 1, 1,
0.3612876, -0.264313, 3.547397, 0, 0.1490196, 1, 1,
0.3630309, 0.1938181, 0.4900637, 0, 0.1411765, 1, 1,
0.3635539, -1.547881, 4.075902, 0, 0.1372549, 1, 1,
0.3637089, -0.6479228, 2.566452, 0, 0.1294118, 1, 1,
0.3641796, 0.9290557, 1.543316, 0, 0.1254902, 1, 1,
0.3744771, -0.8310111, 1.391675, 0, 0.1176471, 1, 1,
0.3787587, 1.437583, -0.1522692, 0, 0.1137255, 1, 1,
0.383997, -0.6061596, 2.324252, 0, 0.1058824, 1, 1,
0.384991, -0.9600219, 3.238048, 0, 0.09803922, 1, 1,
0.3856446, 0.8015218, -1.053187, 0, 0.09411765, 1, 1,
0.3861696, 0.5261474, 0.4429566, 0, 0.08627451, 1, 1,
0.3875028, -0.4455965, 1.97102, 0, 0.08235294, 1, 1,
0.3921501, -0.4656301, 3.00179, 0, 0.07450981, 1, 1,
0.3927766, 0.115873, -0.3968664, 0, 0.07058824, 1, 1,
0.4000106, -0.1696973, 2.314598, 0, 0.0627451, 1, 1,
0.4051068, -1.397016, 2.4411, 0, 0.05882353, 1, 1,
0.4115945, 0.5167034, -0.100414, 0, 0.05098039, 1, 1,
0.41236, -0.268675, 1.209904, 0, 0.04705882, 1, 1,
0.4136225, -0.4996192, 3.381346, 0, 0.03921569, 1, 1,
0.4136432, 0.101581, 1.330516, 0, 0.03529412, 1, 1,
0.413966, -0.6345862, 1.714913, 0, 0.02745098, 1, 1,
0.4139754, 0.9176237, -0.7081719, 0, 0.02352941, 1, 1,
0.4142626, 0.1495171, 1.679387, 0, 0.01568628, 1, 1,
0.4144664, -0.3517381, 0.7309567, 0, 0.01176471, 1, 1,
0.4159084, 1.080327, 0.6013598, 0, 0.003921569, 1, 1,
0.4166875, -0.5417586, 2.146047, 0.003921569, 0, 1, 1,
0.419777, -0.163402, 0.2145889, 0.007843138, 0, 1, 1,
0.4229041, -1.257706, 4.287783, 0.01568628, 0, 1, 1,
0.4235183, 2.969836, 1.182502, 0.01960784, 0, 1, 1,
0.4245355, -0.7378668, 2.933561, 0.02745098, 0, 1, 1,
0.4279645, 0.09316715, 2.824523, 0.03137255, 0, 1, 1,
0.4304233, 1.057778, 1.300689, 0.03921569, 0, 1, 1,
0.4315983, -0.1908293, 1.2765, 0.04313726, 0, 1, 1,
0.4317276, 0.6414895, 2.122352, 0.05098039, 0, 1, 1,
0.4362993, -0.5230231, 2.126419, 0.05490196, 0, 1, 1,
0.4376271, -0.7611095, 1.927415, 0.0627451, 0, 1, 1,
0.4399418, -2.313582, 3.595178, 0.06666667, 0, 1, 1,
0.444957, 0.02952337, 1.413961, 0.07450981, 0, 1, 1,
0.4450978, -0.6398719, 4.371181, 0.07843138, 0, 1, 1,
0.4503569, 0.6250386, -1.210942, 0.08627451, 0, 1, 1,
0.4511184, -1.477935, 3.258991, 0.09019608, 0, 1, 1,
0.4513054, 0.6092066, -0.5297695, 0.09803922, 0, 1, 1,
0.4547862, 0.3424304, 0.5495558, 0.1058824, 0, 1, 1,
0.4568757, 0.2905079, 1.052869, 0.1098039, 0, 1, 1,
0.4579969, 0.2078048, 0.6310771, 0.1176471, 0, 1, 1,
0.4625663, 0.3988815, 0.9733648, 0.1215686, 0, 1, 1,
0.4685478, 0.0469924, 2.25133, 0.1294118, 0, 1, 1,
0.4685918, -0.2012631, 2.07957, 0.1333333, 0, 1, 1,
0.4725326, 1.132591, 0.5833721, 0.1411765, 0, 1, 1,
0.4742363, -1.478984, 2.372585, 0.145098, 0, 1, 1,
0.4798286, -2.487245, 2.29803, 0.1529412, 0, 1, 1,
0.480702, -0.5759057, 1.718515, 0.1568628, 0, 1, 1,
0.4810934, 0.6063021, 0.4414937, 0.1647059, 0, 1, 1,
0.4828325, 0.2338725, 1.792046, 0.1686275, 0, 1, 1,
0.4859457, -1.10048, 0.9878805, 0.1764706, 0, 1, 1,
0.4897134, -0.2579456, 2.56476, 0.1803922, 0, 1, 1,
0.4943509, -0.04662318, -1.339145, 0.1882353, 0, 1, 1,
0.4953907, 1.975356, -0.4183, 0.1921569, 0, 1, 1,
0.4971199, 1.542036, -1.078045, 0.2, 0, 1, 1,
0.5006105, -0.970989, 2.162549, 0.2078431, 0, 1, 1,
0.5035577, 0.4694268, -0.3614271, 0.2117647, 0, 1, 1,
0.5092428, -1.483279, 5.949014, 0.2196078, 0, 1, 1,
0.5139828, 0.1869819, 1.572766, 0.2235294, 0, 1, 1,
0.5144943, 1.025536, 0.2967478, 0.2313726, 0, 1, 1,
0.5174977, 1.215643, 1.2099, 0.2352941, 0, 1, 1,
0.5183787, 0.1428233, 3.438314, 0.2431373, 0, 1, 1,
0.5210589, 0.4101225, 0.8658158, 0.2470588, 0, 1, 1,
0.5251827, 0.4556259, -1.125833, 0.254902, 0, 1, 1,
0.5301144, 0.3387647, -0.2790849, 0.2588235, 0, 1, 1,
0.5357953, 1.775281, -0.8545324, 0.2666667, 0, 1, 1,
0.5367185, 0.1206642, 2.12138, 0.2705882, 0, 1, 1,
0.5372971, 0.5317762, 1.834604, 0.2784314, 0, 1, 1,
0.5377066, -0.6353415, 0.4975642, 0.282353, 0, 1, 1,
0.5452805, 0.9722786, -0.8861511, 0.2901961, 0, 1, 1,
0.5460019, -0.1809578, 1.795079, 0.2941177, 0, 1, 1,
0.5497175, -0.02078318, -0.3433617, 0.3019608, 0, 1, 1,
0.5520855, 0.4870684, 2.016837, 0.3098039, 0, 1, 1,
0.5560232, -0.4349582, 2.396633, 0.3137255, 0, 1, 1,
0.5638222, -0.7141691, 0.7559253, 0.3215686, 0, 1, 1,
0.5681714, -0.1947497, 3.118623, 0.3254902, 0, 1, 1,
0.5688089, -1.869178, 3.926391, 0.3333333, 0, 1, 1,
0.5706853, -0.1710467, 0.9278007, 0.3372549, 0, 1, 1,
0.5718947, -0.01949331, 1.349983, 0.345098, 0, 1, 1,
0.574042, -0.764514, 3.381261, 0.3490196, 0, 1, 1,
0.5740447, -0.6432666, 1.329385, 0.3568628, 0, 1, 1,
0.574066, 0.5829908, -0.2777592, 0.3607843, 0, 1, 1,
0.5744717, -0.780559, 2.872352, 0.3686275, 0, 1, 1,
0.576625, -0.0575261, 1.671517, 0.372549, 0, 1, 1,
0.5814306, 0.3858052, 0.6439879, 0.3803922, 0, 1, 1,
0.589034, -0.7846586, 2.956872, 0.3843137, 0, 1, 1,
0.592504, -0.1606078, 1.830197, 0.3921569, 0, 1, 1,
0.5974898, 1.215911, -0.5171685, 0.3960784, 0, 1, 1,
0.5989515, -0.3370911, 0.1625776, 0.4039216, 0, 1, 1,
0.6019803, -1.076673, 2.765623, 0.4117647, 0, 1, 1,
0.6027692, 0.2616117, 0.7737966, 0.4156863, 0, 1, 1,
0.6237257, 0.1892598, 1.338296, 0.4235294, 0, 1, 1,
0.6255831, -1.603518, 2.787797, 0.427451, 0, 1, 1,
0.6293904, 0.6554631, -0.1567987, 0.4352941, 0, 1, 1,
0.6362464, 0.442486, 2.025445, 0.4392157, 0, 1, 1,
0.6413979, -0.6499568, 2.685114, 0.4470588, 0, 1, 1,
0.6421931, -0.8464895, 2.543866, 0.4509804, 0, 1, 1,
0.647821, 1.502836, 0.2081145, 0.4588235, 0, 1, 1,
0.6480696, 0.3577334, -0.6339446, 0.4627451, 0, 1, 1,
0.6568906, -1.051162, 3.082558, 0.4705882, 0, 1, 1,
0.6579561, 0.6277821, 0.8239139, 0.4745098, 0, 1, 1,
0.659815, 0.8739545, 0.7609119, 0.4823529, 0, 1, 1,
0.660279, -0.4649216, 2.467004, 0.4862745, 0, 1, 1,
0.6616886, 0.6365989, -1.037207, 0.4941176, 0, 1, 1,
0.6659977, 0.7905218, 1.29545, 0.5019608, 0, 1, 1,
0.6698931, -2.728032, 1.194401, 0.5058824, 0, 1, 1,
0.6725039, 0.9739286, 0.5479504, 0.5137255, 0, 1, 1,
0.6729146, -1.547228, 4.161434, 0.5176471, 0, 1, 1,
0.6742537, 0.8742359, 1.592336, 0.5254902, 0, 1, 1,
0.6786253, 0.9722568, 0.1725049, 0.5294118, 0, 1, 1,
0.6787271, -0.9275284, 1.368758, 0.5372549, 0, 1, 1,
0.6808082, -0.7685342, 1.46265, 0.5411765, 0, 1, 1,
0.6830456, 1.259103, -0.2037775, 0.5490196, 0, 1, 1,
0.687686, -1.025788, 2.521384, 0.5529412, 0, 1, 1,
0.6885998, -1.017795, 3.468115, 0.5607843, 0, 1, 1,
0.6910413, -0.1835312, 0.4312119, 0.5647059, 0, 1, 1,
0.6950585, -0.05874259, 3.806984, 0.572549, 0, 1, 1,
0.6982005, 0.5373946, 0.2092268, 0.5764706, 0, 1, 1,
0.6990186, -0.3999744, 2.591216, 0.5843138, 0, 1, 1,
0.7005641, -1.925673, 2.82631, 0.5882353, 0, 1, 1,
0.7054407, 0.1071602, 2.294656, 0.5960785, 0, 1, 1,
0.709309, -0.9368563, 2.161596, 0.6039216, 0, 1, 1,
0.7114539, 0.1150775, 0.08339377, 0.6078432, 0, 1, 1,
0.7142791, 1.833071, 1.370916, 0.6156863, 0, 1, 1,
0.715636, -0.4427535, 0.1839402, 0.6196079, 0, 1, 1,
0.7167523, -0.09215689, 3.396042, 0.627451, 0, 1, 1,
0.7201252, 0.1975601, 0.3058606, 0.6313726, 0, 1, 1,
0.7283017, -1.183373, 3.06641, 0.6392157, 0, 1, 1,
0.7293951, 0.3133686, 1.757909, 0.6431373, 0, 1, 1,
0.7301349, 2.492221, -0.8352817, 0.6509804, 0, 1, 1,
0.7337258, 0.6287471, 0.9222828, 0.654902, 0, 1, 1,
0.7368333, -1.097916, 1.378752, 0.6627451, 0, 1, 1,
0.7375777, 0.736321, 0.6988844, 0.6666667, 0, 1, 1,
0.7384837, -1.610439, 3.790454, 0.6745098, 0, 1, 1,
0.7405473, -0.5638236, 1.681692, 0.6784314, 0, 1, 1,
0.7405921, 0.4115826, 1.80017, 0.6862745, 0, 1, 1,
0.7416453, -2.557075, 3.636941, 0.6901961, 0, 1, 1,
0.7444775, -0.4605827, 2.672981, 0.6980392, 0, 1, 1,
0.7460418, 1.031427, 0.5477862, 0.7058824, 0, 1, 1,
0.7479843, -0.9527137, 3.37155, 0.7098039, 0, 1, 1,
0.7511098, 0.8750726, 1.390698, 0.7176471, 0, 1, 1,
0.7512111, 0.2703779, 0.9765331, 0.7215686, 0, 1, 1,
0.7519552, -0.06523474, 2.016235, 0.7294118, 0, 1, 1,
0.7546862, -0.03646315, 1.96891, 0.7333333, 0, 1, 1,
0.7768564, -0.1505971, 2.137323, 0.7411765, 0, 1, 1,
0.7794026, -0.5723982, 1.806198, 0.7450981, 0, 1, 1,
0.7845011, 0.2287495, 2.44408, 0.7529412, 0, 1, 1,
0.786144, 0.7528465, 2.744332, 0.7568628, 0, 1, 1,
0.790147, 0.1076234, 1.936092, 0.7647059, 0, 1, 1,
0.7916427, -0.02337767, 0.7113734, 0.7686275, 0, 1, 1,
0.8067242, -0.7962958, 1.599674, 0.7764706, 0, 1, 1,
0.8095885, -0.6113378, 3.015003, 0.7803922, 0, 1, 1,
0.8111393, 1.809915, 0.1885168, 0.7882353, 0, 1, 1,
0.813435, 0.9470441, 1.164107, 0.7921569, 0, 1, 1,
0.8211843, 2.921284, 0.4667501, 0.8, 0, 1, 1,
0.8234156, 0.2515177, -0.4107638, 0.8078431, 0, 1, 1,
0.8270102, 0.4947687, 0.7953124, 0.8117647, 0, 1, 1,
0.8272454, -0.9586591, 1.999783, 0.8196079, 0, 1, 1,
0.8275061, 1.478208, 1.068544, 0.8235294, 0, 1, 1,
0.8302869, 0.498382, -0.639342, 0.8313726, 0, 1, 1,
0.8337749, 1.500152, 1.267664, 0.8352941, 0, 1, 1,
0.8339798, -0.8857015, 1.916021, 0.8431373, 0, 1, 1,
0.8350545, 0.8915454, 1.158807, 0.8470588, 0, 1, 1,
0.8384525, 0.2254782, -0.05027142, 0.854902, 0, 1, 1,
0.8407615, -0.4241445, 2.347394, 0.8588235, 0, 1, 1,
0.8413755, -0.8744152, 2.911409, 0.8666667, 0, 1, 1,
0.8521931, -0.1975639, 1.720106, 0.8705882, 0, 1, 1,
0.8551314, 0.6339897, 1.901515, 0.8784314, 0, 1, 1,
0.8559645, 1.082578, -0.2851984, 0.8823529, 0, 1, 1,
0.8580552, 0.862137, 0.7856615, 0.8901961, 0, 1, 1,
0.8756417, 0.9816632, 0.2854556, 0.8941177, 0, 1, 1,
0.8783867, -0.1442618, 1.009103, 0.9019608, 0, 1, 1,
0.8784463, 0.3746939, 0.04228461, 0.9098039, 0, 1, 1,
0.8823813, -0.06112975, 1.729971, 0.9137255, 0, 1, 1,
0.8838461, 0.3003393, 3.512905, 0.9215686, 0, 1, 1,
0.8851644, 0.3745656, 3.00331, 0.9254902, 0, 1, 1,
0.8892786, -0.4952813, 1.784007, 0.9333333, 0, 1, 1,
0.8930476, -1.06432, 4.112643, 0.9372549, 0, 1, 1,
0.8934158, 0.214682, 2.203984, 0.945098, 0, 1, 1,
0.9051878, -2.195937, 1.056841, 0.9490196, 0, 1, 1,
0.9138032, -0.1508064, 1.597079, 0.9568627, 0, 1, 1,
0.9148869, -0.1110232, 2.026858, 0.9607843, 0, 1, 1,
0.9149309, -0.8284262, 1.959812, 0.9686275, 0, 1, 1,
0.9178357, -1.088611, 2.324024, 0.972549, 0, 1, 1,
0.9195055, 0.6043004, -1.911554, 0.9803922, 0, 1, 1,
0.9245222, 0.5152722, 1.086585, 0.9843137, 0, 1, 1,
0.9325637, -0.9214472, 2.847701, 0.9921569, 0, 1, 1,
0.9374893, 0.7836532, 0.5623126, 0.9960784, 0, 1, 1,
0.9381564, 1.392465, 1.243393, 1, 0, 0.9960784, 1,
0.943659, -0.8337749, 2.164881, 1, 0, 0.9882353, 1,
0.9460877, 0.3093016, 2.318283, 1, 0, 0.9843137, 1,
0.9491594, -0.4608648, 1.933925, 1, 0, 0.9764706, 1,
0.9518338, 0.6801089, 0.4702502, 1, 0, 0.972549, 1,
0.9605548, 0.7767762, 0.02513818, 1, 0, 0.9647059, 1,
0.9654149, -0.2568053, 2.72111, 1, 0, 0.9607843, 1,
0.9770761, -0.7238767, 0.6876158, 1, 0, 0.9529412, 1,
0.9793962, -2.380474, 2.326579, 1, 0, 0.9490196, 1,
0.9803436, 0.7937667, 0.6607394, 1, 0, 0.9411765, 1,
0.992281, -1.112195, 2.567051, 1, 0, 0.9372549, 1,
0.9927247, -0.8752128, 3.492225, 1, 0, 0.9294118, 1,
0.9990547, 1.422452, 0.6360682, 1, 0, 0.9254902, 1,
1.00561, -1.204957, 3.66854, 1, 0, 0.9176471, 1,
1.006255, 0.3341979, -0.4799628, 1, 0, 0.9137255, 1,
1.010852, 0.5135011, 0.6001511, 1, 0, 0.9058824, 1,
1.014605, 1.863509, 1.109337, 1, 0, 0.9019608, 1,
1.019125, -0.5691897, 3.046858, 1, 0, 0.8941177, 1,
1.025314, 1.096785, 0.290082, 1, 0, 0.8862745, 1,
1.027117, 0.3256988, 2.434389, 1, 0, 0.8823529, 1,
1.027468, -0.6154197, 3.894031, 1, 0, 0.8745098, 1,
1.036815, 0.8437122, 1.807985, 1, 0, 0.8705882, 1,
1.038264, 0.3688179, 2.317, 1, 0, 0.8627451, 1,
1.039811, 1.172566, 2.721618, 1, 0, 0.8588235, 1,
1.041588, 0.8582292, 0.0169164, 1, 0, 0.8509804, 1,
1.044039, -0.2175794, 3.96505, 1, 0, 0.8470588, 1,
1.048379, -0.09814902, 0.694614, 1, 0, 0.8392157, 1,
1.050441, -0.2569472, 1.72712, 1, 0, 0.8352941, 1,
1.05678, -1.838072, 2.621935, 1, 0, 0.827451, 1,
1.06764, 0.8670992, 2.119474, 1, 0, 0.8235294, 1,
1.07136, -2.199336, 1.346337, 1, 0, 0.8156863, 1,
1.080835, 0.6196483, 0.2445864, 1, 0, 0.8117647, 1,
1.082988, -0.8419724, 3.901093, 1, 0, 0.8039216, 1,
1.084512, -0.3453608, 0.9130349, 1, 0, 0.7960784, 1,
1.092043, 0.7089021, 0.9222993, 1, 0, 0.7921569, 1,
1.093413, 1.416857, 0.2017446, 1, 0, 0.7843137, 1,
1.096239, 0.5360394, 3.736558, 1, 0, 0.7803922, 1,
1.096836, -1.817613, 2.868026, 1, 0, 0.772549, 1,
1.09996, 0.2467484, 0.5799959, 1, 0, 0.7686275, 1,
1.101458, -0.03268784, 0.1141716, 1, 0, 0.7607843, 1,
1.103332, 0.350442, 2.07727, 1, 0, 0.7568628, 1,
1.105573, -1.302694, 0.6141592, 1, 0, 0.7490196, 1,
1.126043, -0.9537043, 2.872004, 1, 0, 0.7450981, 1,
1.134415, -0.9410125, 1.152018, 1, 0, 0.7372549, 1,
1.146577, 1.215848, 1.976279, 1, 0, 0.7333333, 1,
1.148604, -1.066792, 3.051476, 1, 0, 0.7254902, 1,
1.158573, -0.7335086, 3.320602, 1, 0, 0.7215686, 1,
1.162102, -1.292338, 2.707087, 1, 0, 0.7137255, 1,
1.166419, -0.8383033, 2.462462, 1, 0, 0.7098039, 1,
1.169903, -0.1701879, 2.23128, 1, 0, 0.7019608, 1,
1.170615, -0.4176978, 2.592832, 1, 0, 0.6941177, 1,
1.175918, 0.6371087, 0.9582193, 1, 0, 0.6901961, 1,
1.181071, 1.400985, -0.4292322, 1, 0, 0.682353, 1,
1.181668, 1.218437, 0.4559757, 1, 0, 0.6784314, 1,
1.184472, -1.364586, 2.202751, 1, 0, 0.6705883, 1,
1.186511, -0.118917, -0.3028647, 1, 0, 0.6666667, 1,
1.188132, 2.586573, 0.4466567, 1, 0, 0.6588235, 1,
1.190257, -0.8360037, 1.580496, 1, 0, 0.654902, 1,
1.192823, 1.646385, 1.813712, 1, 0, 0.6470588, 1,
1.195978, 1.237474, 1.515372, 1, 0, 0.6431373, 1,
1.209954, 0.9322476, 1.044466, 1, 0, 0.6352941, 1,
1.227173, -0.3114576, 0.2364569, 1, 0, 0.6313726, 1,
1.231721, 1.098641, 0.4891153, 1, 0, 0.6235294, 1,
1.242772, -1.379239, 1.233107, 1, 0, 0.6196079, 1,
1.248426, -0.4434703, 2.277309, 1, 0, 0.6117647, 1,
1.249395, -0.5476714, 2.256992, 1, 0, 0.6078432, 1,
1.250415, -0.5437561, 1.446596, 1, 0, 0.6, 1,
1.252227, 0.7433991, 1.433299, 1, 0, 0.5921569, 1,
1.257481, 1.528605, 2.665433, 1, 0, 0.5882353, 1,
1.287022, -0.4460966, 1.395288, 1, 0, 0.5803922, 1,
1.287835, -1.197078, 2.944051, 1, 0, 0.5764706, 1,
1.293977, 0.3687927, 2.209803, 1, 0, 0.5686275, 1,
1.298317, 2.218739, -0.5962533, 1, 0, 0.5647059, 1,
1.304233, 0.003424277, -0.1244222, 1, 0, 0.5568628, 1,
1.313437, 3.283513, -0.5849212, 1, 0, 0.5529412, 1,
1.318201, -2.334907, 3.685642, 1, 0, 0.5450981, 1,
1.341299, -0.1863339, 0.6104355, 1, 0, 0.5411765, 1,
1.342073, -0.235001, 4.602773, 1, 0, 0.5333334, 1,
1.345573, -1.026095, 1.707137, 1, 0, 0.5294118, 1,
1.346204, -0.092874, 2.699554, 1, 0, 0.5215687, 1,
1.361425, 1.471239, 1.604758, 1, 0, 0.5176471, 1,
1.368382, -0.2426763, 3.449712, 1, 0, 0.509804, 1,
1.371575, 0.5136637, 2.164305, 1, 0, 0.5058824, 1,
1.380966, 1.126567, 1.73313, 1, 0, 0.4980392, 1,
1.38153, -0.4013909, 2.073035, 1, 0, 0.4901961, 1,
1.391721, 0.09628073, 2.567181, 1, 0, 0.4862745, 1,
1.398265, -0.8376207, 2.390677, 1, 0, 0.4784314, 1,
1.401617, 0.2436105, 1.102725, 1, 0, 0.4745098, 1,
1.40165, 1.420151, 0.7904202, 1, 0, 0.4666667, 1,
1.417239, -1.466193, 2.06957, 1, 0, 0.4627451, 1,
1.431066, -2.547922, 2.116908, 1, 0, 0.454902, 1,
1.431952, 0.04744796, 0.7423386, 1, 0, 0.4509804, 1,
1.439298, 0.09929231, 0.8548014, 1, 0, 0.4431373, 1,
1.443396, -0.4484469, 2.392606, 1, 0, 0.4392157, 1,
1.449562, -1.088091, 3.457425, 1, 0, 0.4313726, 1,
1.451318, -1.499779, 1.18819, 1, 0, 0.427451, 1,
1.457854, -0.06028312, 1.183617, 1, 0, 0.4196078, 1,
1.460637, -0.9238676, 2.27154, 1, 0, 0.4156863, 1,
1.476699, 0.2416589, 2.116498, 1, 0, 0.4078431, 1,
1.479119, 0.6467834, 1.802662, 1, 0, 0.4039216, 1,
1.4848, 0.1386084, -0.3479989, 1, 0, 0.3960784, 1,
1.49533, -1.619726, 2.6865, 1, 0, 0.3882353, 1,
1.4971, 2.300894, 0.8069305, 1, 0, 0.3843137, 1,
1.503831, -1.415398, 3.739939, 1, 0, 0.3764706, 1,
1.517571, 0.1275785, -0.7515697, 1, 0, 0.372549, 1,
1.519571, 0.8680344, 2.332069, 1, 0, 0.3647059, 1,
1.526286, -0.9015703, 3.126255, 1, 0, 0.3607843, 1,
1.535946, 1.089482, 1.489555, 1, 0, 0.3529412, 1,
1.539117, 0.7246237, 0.4452934, 1, 0, 0.3490196, 1,
1.539893, 0.7138956, 1.876608, 1, 0, 0.3411765, 1,
1.539959, 1.755227, 2.294369, 1, 0, 0.3372549, 1,
1.54461, -0.3741625, 1.638827, 1, 0, 0.3294118, 1,
1.553866, 1.196342, 1.807796, 1, 0, 0.3254902, 1,
1.591235, 0.9316996, 1.583701, 1, 0, 0.3176471, 1,
1.596614, 1.877509, -0.3173911, 1, 0, 0.3137255, 1,
1.598236, 0.3042753, 0.2102376, 1, 0, 0.3058824, 1,
1.60496, -1.340784, 1.934127, 1, 0, 0.2980392, 1,
1.631686, 0.8938309, 1.918762, 1, 0, 0.2941177, 1,
1.638029, -1.281402, 2.955053, 1, 0, 0.2862745, 1,
1.642462, 0.3537014, 0.6975999, 1, 0, 0.282353, 1,
1.649044, 0.984263, 1.7449, 1, 0, 0.2745098, 1,
1.658273, -0.3659219, 1.130054, 1, 0, 0.2705882, 1,
1.664919, 0.2600134, 0.6584502, 1, 0, 0.2627451, 1,
1.676666, 0.2555693, 0.4148353, 1, 0, 0.2588235, 1,
1.68216, -2.066615, 2.54068, 1, 0, 0.2509804, 1,
1.720049, 0.06657039, 2.622651, 1, 0, 0.2470588, 1,
1.733692, -0.691348, 1.667912, 1, 0, 0.2392157, 1,
1.752464, 0.009247696, 0.8030066, 1, 0, 0.2352941, 1,
1.753699, -1.569631, 2.662755, 1, 0, 0.227451, 1,
1.768733, -0.08319606, 1.574259, 1, 0, 0.2235294, 1,
1.775819, 2.0617, 2.13788, 1, 0, 0.2156863, 1,
1.778431, 0.1706308, 2.436091, 1, 0, 0.2117647, 1,
1.796076, -1.217796, 1.649226, 1, 0, 0.2039216, 1,
1.796145, -1.023048, 2.496139, 1, 0, 0.1960784, 1,
1.802536, -0.953839, 2.436584, 1, 0, 0.1921569, 1,
1.829312, 0.7807847, 1.686154, 1, 0, 0.1843137, 1,
1.830389, 0.5310677, 2.555836, 1, 0, 0.1803922, 1,
1.840393, 1.517247, 0.2790717, 1, 0, 0.172549, 1,
1.861732, 2.851825, -0.9976196, 1, 0, 0.1686275, 1,
1.892004, -0.287089, -0.1423484, 1, 0, 0.1607843, 1,
1.907514, 0.3977096, 0.6624133, 1, 0, 0.1568628, 1,
1.921403, 0.5410273, 2.204592, 1, 0, 0.1490196, 1,
1.926626, 0.09667814, -1.146383, 1, 0, 0.145098, 1,
1.93239, 0.1032474, 1.695143, 1, 0, 0.1372549, 1,
1.946481, -0.939197, 0.0698264, 1, 0, 0.1333333, 1,
1.95513, 1.050456, 2.312506, 1, 0, 0.1254902, 1,
1.992187, -0.9261616, 2.659569, 1, 0, 0.1215686, 1,
2.093595, -0.5779223, 1.432333, 1, 0, 0.1137255, 1,
2.095912, 1.710949, 0.2931399, 1, 0, 0.1098039, 1,
2.117716, -0.6581056, 2.670769, 1, 0, 0.1019608, 1,
2.130048, 0.128556, -0.2523858, 1, 0, 0.09411765, 1,
2.173357, 0.09281638, -1.205639, 1, 0, 0.09019608, 1,
2.179302, 0.7847189, 1.757311, 1, 0, 0.08235294, 1,
2.217593, 1.157351, 0.5567628, 1, 0, 0.07843138, 1,
2.221851, -1.610302, 1.832866, 1, 0, 0.07058824, 1,
2.264584, 0.2241792, 1.158799, 1, 0, 0.06666667, 1,
2.273692, 1.235783, 0.3489119, 1, 0, 0.05882353, 1,
2.288448, 0.7047783, 1.61588, 1, 0, 0.05490196, 1,
2.316398, 1.058795, 2.346129, 1, 0, 0.04705882, 1,
2.36563, 0.384469, 0.4616088, 1, 0, 0.04313726, 1,
2.457695, 0.5116423, 1.519232, 1, 0, 0.03529412, 1,
2.478089, -0.02039983, 1.715636, 1, 0, 0.03137255, 1,
2.606387, -0.07445381, 1.719092, 1, 0, 0.02352941, 1,
2.836804, 0.4431096, 1.748193, 1, 0, 0.01960784, 1,
2.912665, 0.03479169, 1.853851, 1, 0, 0.01176471, 1,
3.1875, 1.955352, 0.02476883, 1, 0, 0.007843138, 1
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
-0.01472545, -4.370944, -7.660365, 0, -0.5, 0.5, 0.5,
-0.01472545, -4.370944, -7.660365, 1, -0.5, 0.5, 0.5,
-0.01472545, -4.370944, -7.660365, 1, 1.5, 0.5, 0.5,
-0.01472545, -4.370944, -7.660365, 0, 1.5, 0.5, 0.5
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
-4.302505, 0.01097882, -7.660365, 0, -0.5, 0.5, 0.5,
-4.302505, 0.01097882, -7.660365, 1, -0.5, 0.5, 0.5,
-4.302505, 0.01097882, -7.660365, 1, 1.5, 0.5, 0.5,
-4.302505, 0.01097882, -7.660365, 0, 1.5, 0.5, 0.5
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
-4.302505, -4.370944, 0.1305537, 0, -0.5, 0.5, 0.5,
-4.302505, -4.370944, 0.1305537, 1, -0.5, 0.5, 0.5,
-4.302505, -4.370944, 0.1305537, 1, 1.5, 0.5, 0.5,
-4.302505, -4.370944, 0.1305537, 0, 1.5, 0.5, 0.5
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
-3, -3.359731, -5.862461,
3, -3.359731, -5.862461,
-3, -3.359731, -5.862461,
-3, -3.528267, -6.162111,
-2, -3.359731, -5.862461,
-2, -3.528267, -6.162111,
-1, -3.359731, -5.862461,
-1, -3.528267, -6.162111,
0, -3.359731, -5.862461,
0, -3.528267, -6.162111,
1, -3.359731, -5.862461,
1, -3.528267, -6.162111,
2, -3.359731, -5.862461,
2, -3.528267, -6.162111,
3, -3.359731, -5.862461,
3, -3.528267, -6.162111
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
-3, -3.865338, -6.761413, 0, -0.5, 0.5, 0.5,
-3, -3.865338, -6.761413, 1, -0.5, 0.5, 0.5,
-3, -3.865338, -6.761413, 1, 1.5, 0.5, 0.5,
-3, -3.865338, -6.761413, 0, 1.5, 0.5, 0.5,
-2, -3.865338, -6.761413, 0, -0.5, 0.5, 0.5,
-2, -3.865338, -6.761413, 1, -0.5, 0.5, 0.5,
-2, -3.865338, -6.761413, 1, 1.5, 0.5, 0.5,
-2, -3.865338, -6.761413, 0, 1.5, 0.5, 0.5,
-1, -3.865338, -6.761413, 0, -0.5, 0.5, 0.5,
-1, -3.865338, -6.761413, 1, -0.5, 0.5, 0.5,
-1, -3.865338, -6.761413, 1, 1.5, 0.5, 0.5,
-1, -3.865338, -6.761413, 0, 1.5, 0.5, 0.5,
0, -3.865338, -6.761413, 0, -0.5, 0.5, 0.5,
0, -3.865338, -6.761413, 1, -0.5, 0.5, 0.5,
0, -3.865338, -6.761413, 1, 1.5, 0.5, 0.5,
0, -3.865338, -6.761413, 0, 1.5, 0.5, 0.5,
1, -3.865338, -6.761413, 0, -0.5, 0.5, 0.5,
1, -3.865338, -6.761413, 1, -0.5, 0.5, 0.5,
1, -3.865338, -6.761413, 1, 1.5, 0.5, 0.5,
1, -3.865338, -6.761413, 0, 1.5, 0.5, 0.5,
2, -3.865338, -6.761413, 0, -0.5, 0.5, 0.5,
2, -3.865338, -6.761413, 1, -0.5, 0.5, 0.5,
2, -3.865338, -6.761413, 1, 1.5, 0.5, 0.5,
2, -3.865338, -6.761413, 0, 1.5, 0.5, 0.5,
3, -3.865338, -6.761413, 0, -0.5, 0.5, 0.5,
3, -3.865338, -6.761413, 1, -0.5, 0.5, 0.5,
3, -3.865338, -6.761413, 1, 1.5, 0.5, 0.5,
3, -3.865338, -6.761413, 0, 1.5, 0.5, 0.5
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
-3.313018, -3, -5.862461,
-3.313018, 3, -5.862461,
-3.313018, -3, -5.862461,
-3.477932, -3, -6.162111,
-3.313018, -2, -5.862461,
-3.477932, -2, -6.162111,
-3.313018, -1, -5.862461,
-3.477932, -1, -6.162111,
-3.313018, 0, -5.862461,
-3.477932, 0, -6.162111,
-3.313018, 1, -5.862461,
-3.477932, 1, -6.162111,
-3.313018, 2, -5.862461,
-3.477932, 2, -6.162111,
-3.313018, 3, -5.862461,
-3.477932, 3, -6.162111
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
-3.807761, -3, -6.761413, 0, -0.5, 0.5, 0.5,
-3.807761, -3, -6.761413, 1, -0.5, 0.5, 0.5,
-3.807761, -3, -6.761413, 1, 1.5, 0.5, 0.5,
-3.807761, -3, -6.761413, 0, 1.5, 0.5, 0.5,
-3.807761, -2, -6.761413, 0, -0.5, 0.5, 0.5,
-3.807761, -2, -6.761413, 1, -0.5, 0.5, 0.5,
-3.807761, -2, -6.761413, 1, 1.5, 0.5, 0.5,
-3.807761, -2, -6.761413, 0, 1.5, 0.5, 0.5,
-3.807761, -1, -6.761413, 0, -0.5, 0.5, 0.5,
-3.807761, -1, -6.761413, 1, -0.5, 0.5, 0.5,
-3.807761, -1, -6.761413, 1, 1.5, 0.5, 0.5,
-3.807761, -1, -6.761413, 0, 1.5, 0.5, 0.5,
-3.807761, 0, -6.761413, 0, -0.5, 0.5, 0.5,
-3.807761, 0, -6.761413, 1, -0.5, 0.5, 0.5,
-3.807761, 0, -6.761413, 1, 1.5, 0.5, 0.5,
-3.807761, 0, -6.761413, 0, 1.5, 0.5, 0.5,
-3.807761, 1, -6.761413, 0, -0.5, 0.5, 0.5,
-3.807761, 1, -6.761413, 1, -0.5, 0.5, 0.5,
-3.807761, 1, -6.761413, 1, 1.5, 0.5, 0.5,
-3.807761, 1, -6.761413, 0, 1.5, 0.5, 0.5,
-3.807761, 2, -6.761413, 0, -0.5, 0.5, 0.5,
-3.807761, 2, -6.761413, 1, -0.5, 0.5, 0.5,
-3.807761, 2, -6.761413, 1, 1.5, 0.5, 0.5,
-3.807761, 2, -6.761413, 0, 1.5, 0.5, 0.5,
-3.807761, 3, -6.761413, 0, -0.5, 0.5, 0.5,
-3.807761, 3, -6.761413, 1, -0.5, 0.5, 0.5,
-3.807761, 3, -6.761413, 1, 1.5, 0.5, 0.5,
-3.807761, 3, -6.761413, 0, 1.5, 0.5, 0.5
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
-3.313018, -3.359731, -4,
-3.313018, -3.359731, 4,
-3.313018, -3.359731, -4,
-3.477932, -3.528267, -4,
-3.313018, -3.359731, -2,
-3.477932, -3.528267, -2,
-3.313018, -3.359731, 0,
-3.477932, -3.528267, 0,
-3.313018, -3.359731, 2,
-3.477932, -3.528267, 2,
-3.313018, -3.359731, 4,
-3.477932, -3.528267, 4
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
-3.807761, -3.865338, -4, 0, -0.5, 0.5, 0.5,
-3.807761, -3.865338, -4, 1, -0.5, 0.5, 0.5,
-3.807761, -3.865338, -4, 1, 1.5, 0.5, 0.5,
-3.807761, -3.865338, -4, 0, 1.5, 0.5, 0.5,
-3.807761, -3.865338, -2, 0, -0.5, 0.5, 0.5,
-3.807761, -3.865338, -2, 1, -0.5, 0.5, 0.5,
-3.807761, -3.865338, -2, 1, 1.5, 0.5, 0.5,
-3.807761, -3.865338, -2, 0, 1.5, 0.5, 0.5,
-3.807761, -3.865338, 0, 0, -0.5, 0.5, 0.5,
-3.807761, -3.865338, 0, 1, -0.5, 0.5, 0.5,
-3.807761, -3.865338, 0, 1, 1.5, 0.5, 0.5,
-3.807761, -3.865338, 0, 0, 1.5, 0.5, 0.5,
-3.807761, -3.865338, 2, 0, -0.5, 0.5, 0.5,
-3.807761, -3.865338, 2, 1, -0.5, 0.5, 0.5,
-3.807761, -3.865338, 2, 1, 1.5, 0.5, 0.5,
-3.807761, -3.865338, 2, 0, 1.5, 0.5, 0.5,
-3.807761, -3.865338, 4, 0, -0.5, 0.5, 0.5,
-3.807761, -3.865338, 4, 1, -0.5, 0.5, 0.5,
-3.807761, -3.865338, 4, 1, 1.5, 0.5, 0.5,
-3.807761, -3.865338, 4, 0, 1.5, 0.5, 0.5
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
-3.313018, -3.359731, -5.862461,
-3.313018, 3.381689, -5.862461,
-3.313018, -3.359731, 6.123568,
-3.313018, 3.381689, 6.123568,
-3.313018, -3.359731, -5.862461,
-3.313018, -3.359731, 6.123568,
-3.313018, 3.381689, -5.862461,
-3.313018, 3.381689, 6.123568,
-3.313018, -3.359731, -5.862461,
3.283567, -3.359731, -5.862461,
-3.313018, -3.359731, 6.123568,
3.283567, -3.359731, 6.123568,
-3.313018, 3.381689, -5.862461,
3.283567, 3.381689, -5.862461,
-3.313018, 3.381689, 6.123568,
3.283567, 3.381689, 6.123568,
3.283567, -3.359731, -5.862461,
3.283567, 3.381689, -5.862461,
3.283567, -3.359731, 6.123568,
3.283567, 3.381689, 6.123568,
3.283567, -3.359731, -5.862461,
3.283567, -3.359731, 6.123568,
3.283567, 3.381689, -5.862461,
3.283567, 3.381689, 6.123568
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
var radius = 8.144325;
var distance = 36.23503;
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
mvMatrix.translate( 0.01472545, -0.01097882, -0.1305537 );
mvMatrix.scale( 1.334904, 1.306224, 0.7346724 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.23503);
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
ethylene_dibromide_1<-read.table("ethylene_dibromide_1.xyz")
```

```
## Error in read.table("ethylene_dibromide_1.xyz"): no lines available in input
```

```r
x<-ethylene_dibromide_1$V2
```

```
## Error in eval(expr, envir, enclos): object 'ethylene_dibromide_1' not found
```

```r
y<-ethylene_dibromide_1$V3
```

```
## Error in eval(expr, envir, enclos): object 'ethylene_dibromide_1' not found
```

```r
z<-ethylene_dibromide_1$V4
```

```
## Error in eval(expr, envir, enclos): object 'ethylene_dibromide_1' not found
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
-3.216951, 1.201847, -0.869696, 0, 0, 1, 1, 1,
-3.159858, -0.2825856, -1.968313, 1, 0, 0, 1, 1,
-2.938738, -0.6879483, -1.275212, 1, 0, 0, 1, 1,
-2.871265, 1.533477, -0.3920921, 1, 0, 0, 1, 1,
-2.825624, 1.957066, -1.047655, 1, 0, 0, 1, 1,
-2.631937, 0.5819298, -1.146921, 1, 0, 0, 1, 1,
-2.560231, -0.248319, -2.632941, 0, 0, 0, 1, 1,
-2.529325, 0.1622606, -1.541784, 0, 0, 0, 1, 1,
-2.382128, 1.047917, -0.5191582, 0, 0, 0, 1, 1,
-2.355942, -0.03904237, -0.9686055, 0, 0, 0, 1, 1,
-2.312918, -1.227164, -2.549909, 0, 0, 0, 1, 1,
-2.311599, -0.1019645, -1.843124, 0, 0, 0, 1, 1,
-2.279143, 0.5858275, -0.6882939, 0, 0, 0, 1, 1,
-2.267772, -0.3297931, -3.393585, 1, 1, 1, 1, 1,
-2.259237, -0.1111775, -1.071634, 1, 1, 1, 1, 1,
-2.23958, 0.1687993, -1.239673, 1, 1, 1, 1, 1,
-2.238635, 0.1077949, -1.314987, 1, 1, 1, 1, 1,
-2.175915, -0.05935491, -1.462424, 1, 1, 1, 1, 1,
-2.154606, -0.3318268, -1.453171, 1, 1, 1, 1, 1,
-2.136333, 0.1719693, -1.248535, 1, 1, 1, 1, 1,
-2.059466, 0.07543892, -1.792571, 1, 1, 1, 1, 1,
-2.057585, 0.543399, -0.3374231, 1, 1, 1, 1, 1,
-2.050229, -1.100129, -1.850369, 1, 1, 1, 1, 1,
-2.037268, -0.06420938, -2.404553, 1, 1, 1, 1, 1,
-1.994028, 1.143735, -0.7988201, 1, 1, 1, 1, 1,
-1.978374, 1.529991, -2.056781, 1, 1, 1, 1, 1,
-1.974053, -0.6169006, -2.402422, 1, 1, 1, 1, 1,
-1.966939, -0.5932622, -1.293679, 1, 1, 1, 1, 1,
-1.949259, -1.295007, 0.4811709, 0, 0, 1, 1, 1,
-1.884258, 1.199848, -1.908435, 1, 0, 0, 1, 1,
-1.874078, 0.9878725, -1.752691, 1, 0, 0, 1, 1,
-1.870084, -0.5139059, -2.024384, 1, 0, 0, 1, 1,
-1.860902, 0.3813586, -0.005937384, 1, 0, 0, 1, 1,
-1.845293, 0.8404633, 0.7864928, 1, 0, 0, 1, 1,
-1.826883, -0.6965554, -2.304138, 0, 0, 0, 1, 1,
-1.806582, -0.7789434, -1.844434, 0, 0, 0, 1, 1,
-1.80045, -0.8247516, -2.196672, 0, 0, 0, 1, 1,
-1.795704, -1.35795, -2.808017, 0, 0, 0, 1, 1,
-1.777997, 2.025137, 1.068617, 0, 0, 0, 1, 1,
-1.757835, -0.6001704, -3.560525, 0, 0, 0, 1, 1,
-1.752674, 0.09751151, -0.5588703, 0, 0, 0, 1, 1,
-1.718923, 0.2413466, -1.259908, 1, 1, 1, 1, 1,
-1.707911, -0.1585702, -1.216693, 1, 1, 1, 1, 1,
-1.701995, 0.3919517, -0.7320811, 1, 1, 1, 1, 1,
-1.680581, 0.2786262, -1.752536, 1, 1, 1, 1, 1,
-1.679688, -0.3424979, -0.4564441, 1, 1, 1, 1, 1,
-1.676341, -1.18801, -1.714523, 1, 1, 1, 1, 1,
-1.638341, 0.4091865, -0.5636165, 1, 1, 1, 1, 1,
-1.637492, -1.229868, -0.5775177, 1, 1, 1, 1, 1,
-1.620713, 0.2938804, -2.115532, 1, 1, 1, 1, 1,
-1.614579, 0.4163577, -1.044984, 1, 1, 1, 1, 1,
-1.605782, -0.416745, -2.782283, 1, 1, 1, 1, 1,
-1.583677, -0.3203912, -1.488736, 1, 1, 1, 1, 1,
-1.572814, -1.043419, -1.66297, 1, 1, 1, 1, 1,
-1.570235, -0.2379864, -1.27027, 1, 1, 1, 1, 1,
-1.55649, 0.1931787, -2.264667, 1, 1, 1, 1, 1,
-1.553941, -0.470818, -3.096132, 0, 0, 1, 1, 1,
-1.550306, 0.6579224, -0.5996507, 1, 0, 0, 1, 1,
-1.531926, 1.126963, -0.9287617, 1, 0, 0, 1, 1,
-1.525728, 1.294928, -1.056008, 1, 0, 0, 1, 1,
-1.518715, 0.8510378, -0.4120161, 1, 0, 0, 1, 1,
-1.512608, -0.4605757, -2.49605, 1, 0, 0, 1, 1,
-1.494011, 0.0624641, -1.373949, 0, 0, 0, 1, 1,
-1.493974, 1.026002, 0.1856342, 0, 0, 0, 1, 1,
-1.487573, 1.145199, -0.9040824, 0, 0, 0, 1, 1,
-1.482584, -0.8007697, -1.516916, 0, 0, 0, 1, 1,
-1.481542, 0.3737956, -1.629165, 0, 0, 0, 1, 1,
-1.479601, 1.425943, -1.696321, 0, 0, 0, 1, 1,
-1.479212, -1.806436, -0.5634297, 0, 0, 0, 1, 1,
-1.471977, -0.7292089, -1.695084, 1, 1, 1, 1, 1,
-1.45903, 1.25834, -2.371269, 1, 1, 1, 1, 1,
-1.45286, 1.614295, -1.364221, 1, 1, 1, 1, 1,
-1.451461, 0.9321358, -0.8608558, 1, 1, 1, 1, 1,
-1.435863, 1.194026, -1.330226, 1, 1, 1, 1, 1,
-1.431436, -0.852457, -1.922973, 1, 1, 1, 1, 1,
-1.428208, 1.175401, 0.1825104, 1, 1, 1, 1, 1,
-1.426793, 0.6353502, -0.7978207, 1, 1, 1, 1, 1,
-1.411032, -0.3583006, -1.783766, 1, 1, 1, 1, 1,
-1.396881, -1.725078, -2.584792, 1, 1, 1, 1, 1,
-1.38455, -0.8869528, -2.187736, 1, 1, 1, 1, 1,
-1.382287, 0.1624417, 0.2125995, 1, 1, 1, 1, 1,
-1.380269, 1.229725, 0.9291068, 1, 1, 1, 1, 1,
-1.378546, -0.6998326, -2.442983, 1, 1, 1, 1, 1,
-1.372892, 0.6954035, -0.5580991, 1, 1, 1, 1, 1,
-1.371676, 1.319442, 1.068339, 0, 0, 1, 1, 1,
-1.345134, -2.714578, -0.747096, 1, 0, 0, 1, 1,
-1.341365, 0.2525316, -1.129483, 1, 0, 0, 1, 1,
-1.334737, 0.5521661, -1.292691, 1, 0, 0, 1, 1,
-1.301952, -1.621853, -2.142736, 1, 0, 0, 1, 1,
-1.275478, 0.1580384, -1.252977, 1, 0, 0, 1, 1,
-1.271449, 1.662995, -2.383382, 0, 0, 0, 1, 1,
-1.270558, -0.1076842, -1.480912, 0, 0, 0, 1, 1,
-1.245087, -0.3070311, -1.515828, 0, 0, 0, 1, 1,
-1.241093, -1.04898, -1.557427, 0, 0, 0, 1, 1,
-1.239835, -2.120313, -2.805322, 0, 0, 0, 1, 1,
-1.218351, -0.2066209, -2.588014, 0, 0, 0, 1, 1,
-1.214938, -0.6022067, -1.183709, 0, 0, 0, 1, 1,
-1.210842, 0.4659855, -0.270252, 1, 1, 1, 1, 1,
-1.19532, -0.2923379, -1.272324, 1, 1, 1, 1, 1,
-1.183036, 0.3306591, -0.8906724, 1, 1, 1, 1, 1,
-1.176483, 0.8650206, -1.509081, 1, 1, 1, 1, 1,
-1.161828, 0.1910956, -2.099882, 1, 1, 1, 1, 1,
-1.159678, 1.038699, -3.191802, 1, 1, 1, 1, 1,
-1.159076, -0.6125585, -3.120815, 1, 1, 1, 1, 1,
-1.157819, 1.271442, -0.3253097, 1, 1, 1, 1, 1,
-1.154739, 1.268065, -3.0022, 1, 1, 1, 1, 1,
-1.15066, -0.8449113, -3.672268, 1, 1, 1, 1, 1,
-1.133654, -0.768627, -3.361802, 1, 1, 1, 1, 1,
-1.129793, -0.4746462, -0.2034056, 1, 1, 1, 1, 1,
-1.124604, -0.82175, -1.961784, 1, 1, 1, 1, 1,
-1.123938, -0.7267694, -2.580972, 1, 1, 1, 1, 1,
-1.123757, 1.661116, -2.001819, 1, 1, 1, 1, 1,
-1.122765, -0.03627469, -3.845037, 0, 0, 1, 1, 1,
-1.110665, -1.150042, -2.07285, 1, 0, 0, 1, 1,
-1.099018, 0.4075143, -1.057387, 1, 0, 0, 1, 1,
-1.098841, -0.9388527, -2.041659, 1, 0, 0, 1, 1,
-1.089047, 1.244049, -0.03452886, 1, 0, 0, 1, 1,
-1.088711, 0.9126834, -0.3624342, 1, 0, 0, 1, 1,
-1.084462, 1.76341, -0.2980658, 0, 0, 0, 1, 1,
-1.083102, 1.879654, -1.25499, 0, 0, 0, 1, 1,
-1.082964, -0.2330584, -1.753451, 0, 0, 0, 1, 1,
-1.082364, 1.196264, -1.087884, 0, 0, 0, 1, 1,
-1.081686, -2.285083, -3.061457, 0, 0, 0, 1, 1,
-1.081595, 1.200282, -1.291427, 0, 0, 0, 1, 1,
-1.08158, 0.8376663, -0.8468667, 0, 0, 0, 1, 1,
-1.076756, 0.7827969, 0.05626966, 1, 1, 1, 1, 1,
-1.07636, -0.1537202, -3.008945, 1, 1, 1, 1, 1,
-1.076257, 0.6489373, -0.6218023, 1, 1, 1, 1, 1,
-1.07429, 0.09658853, -2.469106, 1, 1, 1, 1, 1,
-1.067654, 0.2193495, -1.186749, 1, 1, 1, 1, 1,
-1.063108, 1.2997, 1.280395, 1, 1, 1, 1, 1,
-1.059163, -0.8735283, -3.158844, 1, 1, 1, 1, 1,
-1.055056, 1.318913, -1.630488, 1, 1, 1, 1, 1,
-1.05165, 0.1134633, -2.235213, 1, 1, 1, 1, 1,
-1.049874, -1.304564, -2.490963, 1, 1, 1, 1, 1,
-1.041552, 0.2985587, -2.401365, 1, 1, 1, 1, 1,
-1.041136, 0.3344819, -1.107151, 1, 1, 1, 1, 1,
-1.040512, 0.5216391, -0.2990045, 1, 1, 1, 1, 1,
-1.038401, 0.8981143, 0.5074729, 1, 1, 1, 1, 1,
-1.037142, 0.2855686, -1.967569, 1, 1, 1, 1, 1,
-1.036639, 1.788218, 0.2820503, 0, 0, 1, 1, 1,
-1.031165, -0.9828514, -3.402579, 1, 0, 0, 1, 1,
-1.028799, -0.3151299, -1.020549, 1, 0, 0, 1, 1,
-1.02741, 1.414181, -0.6590837, 1, 0, 0, 1, 1,
-1.017386, -2.54089, -2.360688, 1, 0, 0, 1, 1,
-1.016722, 0.9350386, -0.7579817, 1, 0, 0, 1, 1,
-1.014411, -0.9239795, -1.511681, 0, 0, 0, 1, 1,
-1.010385, -1.958837, -2.089777, 0, 0, 0, 1, 1,
-1.010261, -1.140208, -3.363808, 0, 0, 0, 1, 1,
-1.007732, 1.268782, -0.2742662, 0, 0, 0, 1, 1,
-1.006508, -2.196915, -5.276175, 0, 0, 0, 1, 1,
-1.00489, 0.1455767, -0.5481251, 0, 0, 0, 1, 1,
-1.004543, -1.346564, -2.813036, 0, 0, 0, 1, 1,
-1.003951, -1.333866, -3.091556, 1, 1, 1, 1, 1,
-1.000912, 0.4384681, -1.819221, 1, 1, 1, 1, 1,
-0.9972434, 0.7748368, -2.643749, 1, 1, 1, 1, 1,
-0.9916683, 0.8504789, -0.9991544, 1, 1, 1, 1, 1,
-0.9898794, 0.8774512, 0.3462941, 1, 1, 1, 1, 1,
-0.9852225, 1.19399, -1.961316, 1, 1, 1, 1, 1,
-0.9733652, 1.304238, 0.4541131, 1, 1, 1, 1, 1,
-0.965115, 0.8695068, -3.504884, 1, 1, 1, 1, 1,
-0.9630583, -0.2139311, -0.4056932, 1, 1, 1, 1, 1,
-0.9619225, 0.6684171, -0.4361295, 1, 1, 1, 1, 1,
-0.9575139, 0.3109078, -0.1634231, 1, 1, 1, 1, 1,
-0.9491979, 0.7245495, -0.06111022, 1, 1, 1, 1, 1,
-0.9467309, 1.31094, -0.677049, 1, 1, 1, 1, 1,
-0.9379886, 0.8992375, -1.533977, 1, 1, 1, 1, 1,
-0.9317341, -0.9578662, -1.825824, 1, 1, 1, 1, 1,
-0.9312436, 0.5852609, -3.124039, 0, 0, 1, 1, 1,
-0.916564, -0.4506394, -2.898933, 1, 0, 0, 1, 1,
-0.9165211, 0.9061166, -0.8818893, 1, 0, 0, 1, 1,
-0.9074609, -0.1064529, -0.9835668, 1, 0, 0, 1, 1,
-0.9059329, -0.4271894, -2.931371, 1, 0, 0, 1, 1,
-0.9059168, -0.8307487, -4.506788, 1, 0, 0, 1, 1,
-0.9051691, -1.005661, -1.468206, 0, 0, 0, 1, 1,
-0.8955281, -1.689504, -3.24664, 0, 0, 0, 1, 1,
-0.8946783, -0.4417939, -1.941634, 0, 0, 0, 1, 1,
-0.8887508, 2.457231, -0.8428044, 0, 0, 0, 1, 1,
-0.886605, -1.235391, -1.891361, 0, 0, 0, 1, 1,
-0.8842962, 0.4859789, 0.3721834, 0, 0, 0, 1, 1,
-0.8783349, -1.078449, -1.92375, 0, 0, 0, 1, 1,
-0.8781673, -0.08398917, -1.880481, 1, 1, 1, 1, 1,
-0.8781133, 0.04349811, -3.639829, 1, 1, 1, 1, 1,
-0.8752411, -0.3062958, -1.575137, 1, 1, 1, 1, 1,
-0.8722442, 0.765894, -1.10566, 1, 1, 1, 1, 1,
-0.8700053, -1.145522, -4.539937, 1, 1, 1, 1, 1,
-0.8689335, -0.6172574, -1.917345, 1, 1, 1, 1, 1,
-0.8665522, -0.6380652, -2.026761, 1, 1, 1, 1, 1,
-0.8658992, 0.166701, -0.7749729, 1, 1, 1, 1, 1,
-0.858483, 1.196203, -1.793298, 1, 1, 1, 1, 1,
-0.8529091, 1.412525, -1.920586, 1, 1, 1, 1, 1,
-0.8482159, 0.1880528, -0.3766553, 1, 1, 1, 1, 1,
-0.8453871, 0.4386415, -0.2618653, 1, 1, 1, 1, 1,
-0.8445726, -1.400814, -3.521479, 1, 1, 1, 1, 1,
-0.8397826, -0.5479949, -1.889168, 1, 1, 1, 1, 1,
-0.8389155, 1.237579, -0.6601864, 1, 1, 1, 1, 1,
-0.83876, 0.4200313, -0.2161892, 0, 0, 1, 1, 1,
-0.8357631, 0.02032951, -2.962225, 1, 0, 0, 1, 1,
-0.8356135, 0.5496793, -1.870187, 1, 0, 0, 1, 1,
-0.8336285, 1.454014, -1.036064, 1, 0, 0, 1, 1,
-0.8211219, 0.5100041, -1.163961, 1, 0, 0, 1, 1,
-0.8177761, -0.3788654, -1.502646, 1, 0, 0, 1, 1,
-0.8170957, 1.574991, -0.4031507, 0, 0, 0, 1, 1,
-0.8167212, -0.325215, -2.438527, 0, 0, 0, 1, 1,
-0.8141859, 1.403267, -0.1582407, 0, 0, 0, 1, 1,
-0.811461, 1.748145, -1.40088, 0, 0, 0, 1, 1,
-0.8046696, -0.5018607, -0.6570061, 0, 0, 0, 1, 1,
-0.8021334, -1.62118, -4.374694, 0, 0, 0, 1, 1,
-0.7964063, -0.2160155, -3.348469, 0, 0, 0, 1, 1,
-0.7887307, -1.055216, -1.425042, 1, 1, 1, 1, 1,
-0.7875688, 0.03870608, -1.138475, 1, 1, 1, 1, 1,
-0.7759448, 1.399787, 1.43286, 1, 1, 1, 1, 1,
-0.7752345, 0.3587293, -3.044001, 1, 1, 1, 1, 1,
-0.7696381, -0.05925815, -1.764558, 1, 1, 1, 1, 1,
-0.7639184, 0.7347373, -3.473738, 1, 1, 1, 1, 1,
-0.7626441, 0.7239996, -0.2074249, 1, 1, 1, 1, 1,
-0.7621845, 0.6213573, -1.624423, 1, 1, 1, 1, 1,
-0.762183, 2.091355, -0.07399813, 1, 1, 1, 1, 1,
-0.7584317, 0.9734201, -0.7155566, 1, 1, 1, 1, 1,
-0.7568013, 0.9007913, 0.2857873, 1, 1, 1, 1, 1,
-0.7567064, 0.5244827, -1.941909, 1, 1, 1, 1, 1,
-0.7563065, 0.9149873, 0.1571575, 1, 1, 1, 1, 1,
-0.7476867, -0.3675784, -1.913837, 1, 1, 1, 1, 1,
-0.7455071, -0.4475906, -3.75696, 1, 1, 1, 1, 1,
-0.7335257, 0.6857634, -0.01528545, 0, 0, 1, 1, 1,
-0.7292159, -1.642835, -3.223223, 1, 0, 0, 1, 1,
-0.7164076, -0.2119925, -2.451796, 1, 0, 0, 1, 1,
-0.7126794, -1.385716, -2.5018, 1, 0, 0, 1, 1,
-0.7080224, -0.634975, -1.495357, 1, 0, 0, 1, 1,
-0.694281, -0.6620644, -0.6011876, 1, 0, 0, 1, 1,
-0.6884227, 2.665384, 0.04954308, 0, 0, 0, 1, 1,
-0.6880206, 0.7620951, -1.202381, 0, 0, 0, 1, 1,
-0.6786292, -0.5964543, -1.277102, 0, 0, 0, 1, 1,
-0.6763771, -0.179784, -2.260916, 0, 0, 0, 1, 1,
-0.6754202, -1.026546, -0.4861759, 0, 0, 0, 1, 1,
-0.6753985, -2.307378, -1.746138, 0, 0, 0, 1, 1,
-0.6721712, -0.413231, -2.761947, 0, 0, 0, 1, 1,
-0.6719984, -0.3217286, -3.065174, 1, 1, 1, 1, 1,
-0.6702489, 1.147327, 0.680039, 1, 1, 1, 1, 1,
-0.6640821, 1.153644, -1.849547, 1, 1, 1, 1, 1,
-0.6628917, -0.4755076, -3.233243, 1, 1, 1, 1, 1,
-0.6571876, 1.544831, -1.452198, 1, 1, 1, 1, 1,
-0.6544129, 0.2692513, -2.041967, 1, 1, 1, 1, 1,
-0.6518872, -0.2715643, -2.717342, 1, 1, 1, 1, 1,
-0.6503688, 0.6218985, 0.3118607, 1, 1, 1, 1, 1,
-0.6405087, -1.350034, -1.829395, 1, 1, 1, 1, 1,
-0.6368561, -0.8744705, -1.942943, 1, 1, 1, 1, 1,
-0.6327009, -0.004268151, -0.9084527, 1, 1, 1, 1, 1,
-0.63134, 0.03149665, -0.9030651, 1, 1, 1, 1, 1,
-0.6312776, 1.030697, -0.7727928, 1, 1, 1, 1, 1,
-0.6244011, 0.9022833, -1.044888, 1, 1, 1, 1, 1,
-0.6220315, -0.6453521, -1.795616, 1, 1, 1, 1, 1,
-0.6212301, -1.077943, -1.897182, 0, 0, 1, 1, 1,
-0.6130232, -0.1240946, -1.635557, 1, 0, 0, 1, 1,
-0.594901, -0.614414, -3.585891, 1, 0, 0, 1, 1,
-0.5928019, 0.858868, 0.5241143, 1, 0, 0, 1, 1,
-0.5855439, -0.5388352, -3.284734, 1, 0, 0, 1, 1,
-0.5801201, -1.445604, -1.499662, 1, 0, 0, 1, 1,
-0.5742152, -0.06649045, -2.688338, 0, 0, 0, 1, 1,
-0.5737213, -0.5633301, -0.8699417, 0, 0, 0, 1, 1,
-0.5711311, 2.001028, -0.05798152, 0, 0, 0, 1, 1,
-0.5703368, 0.2514644, -1.943877, 0, 0, 0, 1, 1,
-0.5690829, -0.2063644, -2.989082, 0, 0, 0, 1, 1,
-0.5630671, -1.263379, -2.686844, 0, 0, 0, 1, 1,
-0.5618214, -1.378981, -3.343721, 0, 0, 0, 1, 1,
-0.5555408, -0.1688097, -2.416277, 1, 1, 1, 1, 1,
-0.547523, -1.1847, -3.295531, 1, 1, 1, 1, 1,
-0.5473218, 0.09643275, -0.9683901, 1, 1, 1, 1, 1,
-0.5444977, 1.316705, -2.508834, 1, 1, 1, 1, 1,
-0.540767, 0.2935647, -1.478528, 1, 1, 1, 1, 1,
-0.5383708, -1.378524, -4.028039, 1, 1, 1, 1, 1,
-0.529978, -0.7139248, -2.760863, 1, 1, 1, 1, 1,
-0.5299146, 0.1431416, -3.025057, 1, 1, 1, 1, 1,
-0.5241803, -1.410111, -4.369446, 1, 1, 1, 1, 1,
-0.5228242, -0.7038642, -1.357169, 1, 1, 1, 1, 1,
-0.5223525, -0.3219343, -2.738053, 1, 1, 1, 1, 1,
-0.5195742, 1.423334, -1.062811, 1, 1, 1, 1, 1,
-0.5188473, 0.9930264, -1.009819, 1, 1, 1, 1, 1,
-0.5184715, 0.8915873, -1.527776, 1, 1, 1, 1, 1,
-0.5150442, 1.22555, -0.7321231, 1, 1, 1, 1, 1,
-0.5132165, 0.4216487, -0.9006919, 0, 0, 1, 1, 1,
-0.5128171, -0.1852455, -2.742677, 1, 0, 0, 1, 1,
-0.5113894, 2.335664, 0.2672788, 1, 0, 0, 1, 1,
-0.5069964, 0.8069406, 0.02473995, 1, 0, 0, 1, 1,
-0.5063414, 0.193273, -0.08079763, 1, 0, 0, 1, 1,
-0.5050623, 0.5848572, 0.03154724, 1, 0, 0, 1, 1,
-0.5029515, -0.2683312, -3.848374, 0, 0, 0, 1, 1,
-0.4996504, 0.05540675, -1.103977, 0, 0, 0, 1, 1,
-0.4972818, 0.3086349, -0.037712, 0, 0, 0, 1, 1,
-0.4956076, -1.078675, -3.573411, 0, 0, 0, 1, 1,
-0.4894221, -0.8914571, -3.101022, 0, 0, 0, 1, 1,
-0.489413, 1.349459, -0.4273029, 0, 0, 0, 1, 1,
-0.4851711, -0.04488028, -1.250462, 0, 0, 0, 1, 1,
-0.483693, -0.8350698, -3.284005, 1, 1, 1, 1, 1,
-0.4821708, 0.3815013, -0.8290432, 1, 1, 1, 1, 1,
-0.4818665, 1.117187, 0.4273401, 1, 1, 1, 1, 1,
-0.4777664, -2.090844, -2.477792, 1, 1, 1, 1, 1,
-0.4764931, 0.1717055, -1.353298, 1, 1, 1, 1, 1,
-0.4743139, 0.4731697, -1.268988, 1, 1, 1, 1, 1,
-0.4740871, -1.26043, -3.982258, 1, 1, 1, 1, 1,
-0.4728878, 0.3824466, -2.133385, 1, 1, 1, 1, 1,
-0.4700765, -0.08934352, -0.4829347, 1, 1, 1, 1, 1,
-0.4665347, -0.08147717, -1.659004, 1, 1, 1, 1, 1,
-0.4644602, -0.3747199, -2.568333, 1, 1, 1, 1, 1,
-0.4642666, -0.5839807, -2.842556, 1, 1, 1, 1, 1,
-0.4637676, -1.277544, -1.47827, 1, 1, 1, 1, 1,
-0.4609899, 1.158061, -2.171777, 1, 1, 1, 1, 1,
-0.4557805, -1.36819, -2.380004, 1, 1, 1, 1, 1,
-0.4548989, 1.087176, 0.5141001, 0, 0, 1, 1, 1,
-0.4530484, -1.232355, -1.939444, 1, 0, 0, 1, 1,
-0.4460151, 0.3961507, 0.346417, 1, 0, 0, 1, 1,
-0.4455836, -0.1370516, -3.125302, 1, 0, 0, 1, 1,
-0.4403335, 0.8367481, 0.5205513, 1, 0, 0, 1, 1,
-0.4305863, -0.7852081, -2.130515, 1, 0, 0, 1, 1,
-0.4246715, 0.8996463, 0.4177085, 0, 0, 0, 1, 1,
-0.4237624, 0.7061676, 0.07415901, 0, 0, 0, 1, 1,
-0.4196377, 0.1223831, -0.7719415, 0, 0, 0, 1, 1,
-0.4172128, 0.8729283, 0.1016461, 0, 0, 0, 1, 1,
-0.4160237, -0.4099057, -2.635486, 0, 0, 0, 1, 1,
-0.4033966, 0.04838302, -1.787545, 0, 0, 0, 1, 1,
-0.3940376, -1.238607, -4.181716, 0, 0, 0, 1, 1,
-0.3921811, -0.4444049, -3.54018, 1, 1, 1, 1, 1,
-0.3881035, -0.024992, -3.220939, 1, 1, 1, 1, 1,
-0.3865456, 0.8322009, 0.1843701, 1, 1, 1, 1, 1,
-0.3846596, 0.8008988, -1.433803, 1, 1, 1, 1, 1,
-0.3837327, -0.09130125, -2.320687, 1, 1, 1, 1, 1,
-0.3828121, -0.5260196, -2.780365, 1, 1, 1, 1, 1,
-0.3798889, -1.689609, -3.642053, 1, 1, 1, 1, 1,
-0.376627, 0.8025436, -1.532962, 1, 1, 1, 1, 1,
-0.3745861, -0.7247691, -1.294641, 1, 1, 1, 1, 1,
-0.3736386, 0.3888058, 0.7562233, 1, 1, 1, 1, 1,
-0.3726263, 1.049496, -1.742206, 1, 1, 1, 1, 1,
-0.364832, -0.1549569, -1.755563, 1, 1, 1, 1, 1,
-0.3639697, 1.027352, 0.374406, 1, 1, 1, 1, 1,
-0.3619062, 0.4690672, -2.096126, 1, 1, 1, 1, 1,
-0.3592936, 1.575249, -1.425608, 1, 1, 1, 1, 1,
-0.3564854, -0.8197218, -2.51246, 0, 0, 1, 1, 1,
-0.349353, 0.8356139, -0.4797359, 1, 0, 0, 1, 1,
-0.3474876, -0.182864, 0.04698924, 1, 0, 0, 1, 1,
-0.3457425, 1.685552, -1.125165, 1, 0, 0, 1, 1,
-0.3452468, -0.214909, -2.002528, 1, 0, 0, 1, 1,
-0.3431146, -0.1256967, -2.756988, 1, 0, 0, 1, 1,
-0.3410037, 1.130698, -0.4205332, 0, 0, 0, 1, 1,
-0.3323911, -0.4013968, -3.624879, 0, 0, 0, 1, 1,
-0.3317519, 0.7610278, -0.05302228, 0, 0, 0, 1, 1,
-0.3311409, 0.6170094, -0.1735016, 0, 0, 0, 1, 1,
-0.3293008, 0.4236221, -0.4358895, 0, 0, 0, 1, 1,
-0.3291043, 0.1166079, -0.2982875, 0, 0, 0, 1, 1,
-0.3249431, -1.908905, -3.78496, 0, 0, 0, 1, 1,
-0.3249179, -0.5077103, -3.285971, 1, 1, 1, 1, 1,
-0.3233643, 0.2881159, -0.1846177, 1, 1, 1, 1, 1,
-0.3204537, -0.1836987, 0.145905, 1, 1, 1, 1, 1,
-0.3189755, 1.020204, -0.4271913, 1, 1, 1, 1, 1,
-0.3111692, 1.424017, -0.8006136, 1, 1, 1, 1, 1,
-0.3092282, 0.9658035, 0.3566805, 1, 1, 1, 1, 1,
-0.3074394, -0.01210257, 0.4576609, 1, 1, 1, 1, 1,
-0.3065203, 0.1842972, 0.250178, 1, 1, 1, 1, 1,
-0.3057154, 0.6821564, -0.08700392, 1, 1, 1, 1, 1,
-0.3018627, 0.8460675, -1.201347, 1, 1, 1, 1, 1,
-0.2971743, 0.4969235, -0.523186, 1, 1, 1, 1, 1,
-0.2943625, -0.3690571, -1.570195, 1, 1, 1, 1, 1,
-0.2912203, 0.2301903, -1.581543, 1, 1, 1, 1, 1,
-0.2885154, 0.01691818, -2.282168, 1, 1, 1, 1, 1,
-0.2808006, -0.3531612, -3.876627, 1, 1, 1, 1, 1,
-0.2786546, 1.239046, 0.5928258, 0, 0, 1, 1, 1,
-0.2782377, 0.9502167, -0.1181529, 1, 0, 0, 1, 1,
-0.275427, 0.7261164, 0.3848418, 1, 0, 0, 1, 1,
-0.2748356, -0.2002672, -2.423612, 1, 0, 0, 1, 1,
-0.2738619, 1.451857, -0.9379496, 1, 0, 0, 1, 1,
-0.2705907, 0.3335673, 1.571467, 1, 0, 0, 1, 1,
-0.2663245, -0.3409456, -1.452757, 0, 0, 0, 1, 1,
-0.2636522, 0.3960243, -0.7320877, 0, 0, 0, 1, 1,
-0.262123, -1.005131, -2.071866, 0, 0, 0, 1, 1,
-0.2604914, 0.1875654, -0.3162127, 0, 0, 0, 1, 1,
-0.2603165, 1.564101, -0.6416391, 0, 0, 0, 1, 1,
-0.2602185, 0.3692437, -0.5513062, 0, 0, 0, 1, 1,
-0.2598409, -0.0381734, -0.9254678, 0, 0, 0, 1, 1,
-0.2588583, 2.053109, -1.59561, 1, 1, 1, 1, 1,
-0.2584187, 0.7131941, -1.511893, 1, 1, 1, 1, 1,
-0.2575414, 2.08724, 0.4092555, 1, 1, 1, 1, 1,
-0.2557463, 1.531187, -0.1017992, 1, 1, 1, 1, 1,
-0.2544702, -1.20796, -3.137889, 1, 1, 1, 1, 1,
-0.2535406, -0.4192047, -1.870395, 1, 1, 1, 1, 1,
-0.253361, 0.4469417, -0.6802399, 1, 1, 1, 1, 1,
-0.2523912, -0.2778148, -2.226256, 1, 1, 1, 1, 1,
-0.2476596, 0.01926479, -1.657223, 1, 1, 1, 1, 1,
-0.2399237, 0.9582685, -0.7648106, 1, 1, 1, 1, 1,
-0.2398384, -1.99036, -4.253009, 1, 1, 1, 1, 1,
-0.2395695, 0.1815037, -1.221384, 1, 1, 1, 1, 1,
-0.2350746, -0.08371691, -1.905886, 1, 1, 1, 1, 1,
-0.233631, 1.546259, -0.6444859, 1, 1, 1, 1, 1,
-0.2262107, 0.04323633, 0.4697846, 1, 1, 1, 1, 1,
-0.2240277, -1.211321, -3.096586, 0, 0, 1, 1, 1,
-0.2239124, 0.3569432, 0.09921642, 1, 0, 0, 1, 1,
-0.2164435, -0.2748509, -2.523657, 1, 0, 0, 1, 1,
-0.2143505, -0.1244342, -0.9797041, 1, 0, 0, 1, 1,
-0.205797, -0.6126295, -2.045193, 1, 0, 0, 1, 1,
-0.2044831, -0.8084173, -1.224582, 1, 0, 0, 1, 1,
-0.2026522, -1.014287, -3.582927, 0, 0, 0, 1, 1,
-0.2024996, -1.004519, -1.349926, 0, 0, 0, 1, 1,
-0.2021407, 1.244883, 0.7938989, 0, 0, 0, 1, 1,
-0.2017003, -0.6325072, -1.795793, 0, 0, 0, 1, 1,
-0.2011269, 0.6668629, -0.2353792, 0, 0, 0, 1, 1,
-0.2006352, 1.382929, 1.339976, 0, 0, 0, 1, 1,
-0.1963199, 0.8909742, -1.538574, 0, 0, 0, 1, 1,
-0.1961074, 0.7626513, -0.4312328, 1, 1, 1, 1, 1,
-0.1944142, 0.411688, -0.3091805, 1, 1, 1, 1, 1,
-0.191809, -0.06313305, -0.8065565, 1, 1, 1, 1, 1,
-0.1911772, -1.667351, -1.948038, 1, 1, 1, 1, 1,
-0.1910131, -0.2915148, -4.24614, 1, 1, 1, 1, 1,
-0.1883872, 0.906946, 0.215185, 1, 1, 1, 1, 1,
-0.1869332, 0.8650553, -1.509051, 1, 1, 1, 1, 1,
-0.1854235, -0.4053981, -2.784098, 1, 1, 1, 1, 1,
-0.1830458, 1.507057, -0.8785715, 1, 1, 1, 1, 1,
-0.1797608, 0.1300744, 0.2286685, 1, 1, 1, 1, 1,
-0.1763417, 1.474491, -0.7295194, 1, 1, 1, 1, 1,
-0.1762094, -0.1148865, -1.787419, 1, 1, 1, 1, 1,
-0.1678732, -1.161862, -0.8839156, 1, 1, 1, 1, 1,
-0.1664739, -0.05620158, 0.4096384, 1, 1, 1, 1, 1,
-0.1662394, 0.8718852, 0.2003127, 1, 1, 1, 1, 1,
-0.1654842, 1.248259, -0.6813827, 0, 0, 1, 1, 1,
-0.1654261, 0.5498787, -1.050507, 1, 0, 0, 1, 1,
-0.1616082, -1.83107, -1.794587, 1, 0, 0, 1, 1,
-0.159685, -0.5773388, -2.299524, 1, 0, 0, 1, 1,
-0.1564502, -2.147654, -2.174717, 1, 0, 0, 1, 1,
-0.1560986, -0.6454816, -2.448298, 1, 0, 0, 1, 1,
-0.1559192, 0.2091303, 0.2289769, 0, 0, 0, 1, 1,
-0.1557296, -1.269637, -2.433818, 0, 0, 0, 1, 1,
-0.1556618, -0.1100188, -2.427713, 0, 0, 0, 1, 1,
-0.1552974, 0.6848317, -0.399191, 0, 0, 0, 1, 1,
-0.153607, -0.337451, -3.504451, 0, 0, 0, 1, 1,
-0.1525809, 0.4196554, -0.5680383, 0, 0, 0, 1, 1,
-0.150327, -0.0788771, -2.447078, 0, 0, 0, 1, 1,
-0.1456247, 0.4511511, -0.09173083, 1, 1, 1, 1, 1,
-0.1447295, -1.544456, -4.037295, 1, 1, 1, 1, 1,
-0.1398324, -0.4610552, -3.763285, 1, 1, 1, 1, 1,
-0.1384243, 1.255972, 0.1143211, 1, 1, 1, 1, 1,
-0.135839, 1.430985, -0.7361912, 1, 1, 1, 1, 1,
-0.1349978, 0.3055106, 0.6508711, 1, 1, 1, 1, 1,
-0.12971, -0.1688259, -3.614238, 1, 1, 1, 1, 1,
-0.1183741, 2.045238, 0.1868364, 1, 1, 1, 1, 1,
-0.1123176, -0.7149249, -2.380436, 1, 1, 1, 1, 1,
-0.1091605, 0.3788389, -0.2337584, 1, 1, 1, 1, 1,
-0.1089985, -0.317696, -1.832784, 1, 1, 1, 1, 1,
-0.104481, -1.112078, -3.536646, 1, 1, 1, 1, 1,
-0.1021401, -0.458813, -5.687907, 1, 1, 1, 1, 1,
-0.08894313, 0.619076, -0.1121695, 1, 1, 1, 1, 1,
-0.08497958, 0.2182164, -0.4563708, 1, 1, 1, 1, 1,
-0.08382266, -0.5601775, -1.709258, 0, 0, 1, 1, 1,
-0.08330981, 0.6900343, -0.1935881, 1, 0, 0, 1, 1,
-0.08176477, -0.8012206, -2.199783, 1, 0, 0, 1, 1,
-0.08016553, -1.469526, -2.639705, 1, 0, 0, 1, 1,
-0.07623421, 0.3527449, -1.210777, 1, 0, 0, 1, 1,
-0.07569801, -0.1159661, -1.706428, 1, 0, 0, 1, 1,
-0.07553968, -0.2243821, -1.942037, 0, 0, 0, 1, 1,
-0.06928473, 0.2899523, 0.7760344, 0, 0, 0, 1, 1,
-0.06766734, 1.708215, 1.108756, 0, 0, 0, 1, 1,
-0.06638957, 1.083197, -0.3006284, 0, 0, 0, 1, 1,
-0.06248734, -0.02552561, -1.877642, 0, 0, 0, 1, 1,
-0.0617388, 1.754803, 0.02954056, 0, 0, 0, 1, 1,
-0.05952903, 1.244135, 1.211245, 0, 0, 0, 1, 1,
-0.05798193, 0.3782633, -0.5138735, 1, 1, 1, 1, 1,
-0.05304598, -2.671418, -4.45675, 1, 1, 1, 1, 1,
-0.05145613, -0.1407963, -2.017751, 1, 1, 1, 1, 1,
-0.04848178, -0.5523301, -2.834219, 1, 1, 1, 1, 1,
-0.04603919, -0.1182442, -3.525316, 1, 1, 1, 1, 1,
-0.04247005, -0.311689, -3.55874, 1, 1, 1, 1, 1,
-0.04224627, -0.5741749, -3.078554, 1, 1, 1, 1, 1,
-0.04023701, 0.2725832, -0.8649201, 1, 1, 1, 1, 1,
-0.0377192, 0.8671731, 2.275942, 1, 1, 1, 1, 1,
-0.0317296, -1.323082, -3.53086, 1, 1, 1, 1, 1,
-0.03142459, -1.885387, -3.628442, 1, 1, 1, 1, 1,
-0.02900544, 0.1230434, -1.304509, 1, 1, 1, 1, 1,
-0.02838783, -1.528077, -1.808297, 1, 1, 1, 1, 1,
-0.02635771, 0.05930577, -0.5904084, 1, 1, 1, 1, 1,
-0.02344791, -1.618753, -2.995319, 1, 1, 1, 1, 1,
-0.02283501, -0.8334998, -1.396552, 0, 0, 1, 1, 1,
-0.02083973, 0.4075547, 0.3486202, 1, 0, 0, 1, 1,
-0.01968275, 1.721481, -0.2778637, 1, 0, 0, 1, 1,
-0.0194791, 1.663872, -1.13639, 1, 0, 0, 1, 1,
-0.01696295, -0.8298929, -4.694273, 1, 0, 0, 1, 1,
-0.01686051, 1.083314, 0.6288114, 1, 0, 0, 1, 1,
-0.01674208, -0.1295964, -2.095013, 0, 0, 0, 1, 1,
-0.01650655, -1.050694, -3.157469, 0, 0, 0, 1, 1,
-0.01489597, -0.2683682, -0.5929017, 0, 0, 0, 1, 1,
-0.01418704, 1.612976, -0.5302345, 0, 0, 0, 1, 1,
-0.01247252, -0.6543902, -2.964428, 0, 0, 0, 1, 1,
-0.01110235, -1.068477, -2.850103, 0, 0, 0, 1, 1,
-0.01022297, 1.1004, 1.072407, 0, 0, 0, 1, 1,
-0.008677341, -1.271778, -2.970476, 1, 1, 1, 1, 1,
-0.006173709, -1.093842, -2.867051, 1, 1, 1, 1, 1,
-0.001652642, -1.226105, -1.992592, 1, 1, 1, 1, 1,
-0.00138424, 0.4575542, -1.070269, 1, 1, 1, 1, 1,
0.0005003089, -0.1720618, 4.693866, 1, 1, 1, 1, 1,
0.003457578, -0.4509487, 2.627309, 1, 1, 1, 1, 1,
0.004954314, 0.3361874, 1.346974, 1, 1, 1, 1, 1,
0.006542637, -3.261555, 2.643374, 1, 1, 1, 1, 1,
0.008742617, -0.5316433, 3.447816, 1, 1, 1, 1, 1,
0.009153438, 0.118081, -0.8147318, 1, 1, 1, 1, 1,
0.0110371, 0.3583097, 0.5481912, 1, 1, 1, 1, 1,
0.01326733, 1.111074, 0.308992, 1, 1, 1, 1, 1,
0.01728168, 1.593046, -1.616582, 1, 1, 1, 1, 1,
0.01896123, -0.6725232, 3.232135, 1, 1, 1, 1, 1,
0.01912538, 0.01992575, 0.8390145, 1, 1, 1, 1, 1,
0.02093979, 0.4476204, -1.560141, 0, 0, 1, 1, 1,
0.02145962, -0.9938427, 4.12897, 1, 0, 0, 1, 1,
0.02330866, -0.555366, 4.59971, 1, 0, 0, 1, 1,
0.02620552, 0.6848769, -1.07414, 1, 0, 0, 1, 1,
0.02642363, 0.2006987, 1.22887, 1, 0, 0, 1, 1,
0.02750096, 0.2633859, 0.5104768, 1, 0, 0, 1, 1,
0.02950087, -2.573529, 3.647554, 0, 0, 0, 1, 1,
0.03077973, -0.8144361, 2.389392, 0, 0, 0, 1, 1,
0.03127878, -0.04517929, 1.64344, 0, 0, 0, 1, 1,
0.03299277, 1.908656, -1.990908, 0, 0, 0, 1, 1,
0.03334199, 1.709813, -0.4490214, 0, 0, 0, 1, 1,
0.03502182, 0.2558269, 1.333492, 0, 0, 0, 1, 1,
0.03570895, 1.749259, -0.1153916, 0, 0, 0, 1, 1,
0.03592576, 0.9598716, 1.563788, 1, 1, 1, 1, 1,
0.03807685, 0.5478452, -0.2855077, 1, 1, 1, 1, 1,
0.04049505, 1.179926, 0.8939964, 1, 1, 1, 1, 1,
0.0439177, -0.1786431, 2.13738, 1, 1, 1, 1, 1,
0.05006663, 0.2572615, 1.145277, 1, 1, 1, 1, 1,
0.05094917, -0.2606513, 3.51739, 1, 1, 1, 1, 1,
0.05484252, 0.1049057, -0.1202214, 1, 1, 1, 1, 1,
0.05825079, 0.09974308, 1.558293, 1, 1, 1, 1, 1,
0.05909735, 0.4293813, 0.502181, 1, 1, 1, 1, 1,
0.05976135, 0.9311317, 1.486154, 1, 1, 1, 1, 1,
0.0615863, 0.495494, -1.433635, 1, 1, 1, 1, 1,
0.06957184, 0.3899896, 0.9212664, 1, 1, 1, 1, 1,
0.07330138, -1.436286, 1.097202, 1, 1, 1, 1, 1,
0.07371336, -0.1786512, 4.447721, 1, 1, 1, 1, 1,
0.07577976, -0.4476584, 2.299336, 1, 1, 1, 1, 1,
0.07898164, 0.6976842, -0.2384161, 0, 0, 1, 1, 1,
0.08253728, 0.5790349, 0.9283136, 1, 0, 0, 1, 1,
0.08275143, -1.390258, 3.534896, 1, 0, 0, 1, 1,
0.08319046, -0.5516565, 2.985571, 1, 0, 0, 1, 1,
0.08338729, -0.1101072, 1.805937, 1, 0, 0, 1, 1,
0.08374735, -0.7321547, 3.954162, 1, 0, 0, 1, 1,
0.08492023, -1.314741, 3.382527, 0, 0, 0, 1, 1,
0.086092, -0.07915504, 4.157374, 0, 0, 0, 1, 1,
0.08776645, -0.433008, 3.859927, 0, 0, 0, 1, 1,
0.09091681, 1.200127, 0.6666363, 0, 0, 0, 1, 1,
0.09209993, 0.2673764, -0.2536167, 0, 0, 0, 1, 1,
0.09352113, -1.582521, 4.227139, 0, 0, 0, 1, 1,
0.09400915, -2.189631, 3.954259, 0, 0, 0, 1, 1,
0.09589429, -1.125762, 2.539932, 1, 1, 1, 1, 1,
0.09624794, 2.25752, 0.3880958, 1, 1, 1, 1, 1,
0.09975152, -1.03818, 2.202749, 1, 1, 1, 1, 1,
0.104833, 0.5584887, 0.4365631, 1, 1, 1, 1, 1,
0.1052466, 0.1099719, 0.8403686, 1, 1, 1, 1, 1,
0.1066605, 1.083484, -1.595835, 1, 1, 1, 1, 1,
0.1104374, 0.3659801, 1.157505, 1, 1, 1, 1, 1,
0.111509, -0.5520906, 3.247048, 1, 1, 1, 1, 1,
0.1147768, -0.5667531, 4.028001, 1, 1, 1, 1, 1,
0.1153239, -1.346637, 2.444486, 1, 1, 1, 1, 1,
0.1158212, 1.083359, -0.6573594, 1, 1, 1, 1, 1,
0.1169816, 0.8856574, -0.1374475, 1, 1, 1, 1, 1,
0.11882, -1.004492, 3.779131, 1, 1, 1, 1, 1,
0.1194272, 0.5455664, -0.9519047, 1, 1, 1, 1, 1,
0.132037, -0.819106, 2.924844, 1, 1, 1, 1, 1,
0.1344318, -0.3845274, 4.297734, 0, 0, 1, 1, 1,
0.1392003, -0.7833951, 1.369838, 1, 0, 0, 1, 1,
0.1402203, -0.5757368, 1.713936, 1, 0, 0, 1, 1,
0.1445152, 0.1132163, 2.460518, 1, 0, 0, 1, 1,
0.1446708, 0.4728504, 0.7925031, 1, 0, 0, 1, 1,
0.1458688, -1.169802, 1.359576, 1, 0, 0, 1, 1,
0.1472098, 0.1193453, -0.1407861, 0, 0, 0, 1, 1,
0.1485798, -0.4199055, 3.512666, 0, 0, 0, 1, 1,
0.151404, -0.6228455, 4.801283, 0, 0, 0, 1, 1,
0.1514377, -0.8587101, 1.026579, 0, 0, 0, 1, 1,
0.1548022, 1.017906, -0.4226121, 0, 0, 0, 1, 1,
0.1555406, 0.3293885, -1.025953, 0, 0, 0, 1, 1,
0.1576525, 0.8721884, 1.982817, 0, 0, 0, 1, 1,
0.1583908, -0.0790844, 2.624192, 1, 1, 1, 1, 1,
0.1594979, -0.2203111, 1.661945, 1, 1, 1, 1, 1,
0.1597059, 1.014962, 1.161614, 1, 1, 1, 1, 1,
0.1619362, 0.9832883, 0.9580836, 1, 1, 1, 1, 1,
0.1640341, -0.668026, 4.617563, 1, 1, 1, 1, 1,
0.1641791, 0.8255869, -0.7807118, 1, 1, 1, 1, 1,
0.1701932, -0.8870251, 3.105899, 1, 1, 1, 1, 1,
0.1709144, 0.9581504, -0.04683141, 1, 1, 1, 1, 1,
0.1746593, 0.7955515, -1.394665, 1, 1, 1, 1, 1,
0.1747519, 1.074184, 0.7745743, 1, 1, 1, 1, 1,
0.1773808, -1.46379, 1.83333, 1, 1, 1, 1, 1,
0.1776839, -0.6212199, 4.865408, 1, 1, 1, 1, 1,
0.178692, 0.09231557, 0.4329967, 1, 1, 1, 1, 1,
0.1812902, -1.078812, 2.378544, 1, 1, 1, 1, 1,
0.1824395, 0.8824455, 1.348293, 1, 1, 1, 1, 1,
0.1890043, 0.5779927, 2.752691, 0, 0, 1, 1, 1,
0.1969208, 1.206523, -0.02590255, 1, 0, 0, 1, 1,
0.1998979, 0.453517, 0.3628538, 1, 0, 0, 1, 1,
0.2010698, -1.877455, 3.959247, 1, 0, 0, 1, 1,
0.201731, -0.01143205, 1.155839, 1, 0, 0, 1, 1,
0.2063179, -0.02505147, 4.360425, 1, 0, 0, 1, 1,
0.2088548, -0.2220085, 2.155735, 0, 0, 0, 1, 1,
0.2090887, 0.8649625, -1.075714, 0, 0, 0, 1, 1,
0.2098096, 0.3506651, 1.443523, 0, 0, 0, 1, 1,
0.2211096, 0.2636852, 3.331692, 0, 0, 0, 1, 1,
0.2225788, -2.483594, 1.473458, 0, 0, 0, 1, 1,
0.2245303, 0.5081925, -0.3234778, 0, 0, 0, 1, 1,
0.2305518, -0.5687887, 3.769555, 0, 0, 0, 1, 1,
0.2424825, 1.622932, -1.631367, 1, 1, 1, 1, 1,
0.24943, -0.8261352, 3.244113, 1, 1, 1, 1, 1,
0.2517216, -1.000951, 2.768521, 1, 1, 1, 1, 1,
0.2521693, -1.706309, 4.783207, 1, 1, 1, 1, 1,
0.2577348, -0.5424178, 2.910465, 1, 1, 1, 1, 1,
0.2587053, -0.2782795, 1.995195, 1, 1, 1, 1, 1,
0.2610683, 0.2014567, 1.331536, 1, 1, 1, 1, 1,
0.2639055, 2.271719, 0.08115332, 1, 1, 1, 1, 1,
0.2667232, -0.7581769, 2.649547, 1, 1, 1, 1, 1,
0.2685039, 0.2362729, 1.232946, 1, 1, 1, 1, 1,
0.2696008, -0.8610578, 2.434112, 1, 1, 1, 1, 1,
0.2745399, 0.6528817, -1.359723, 1, 1, 1, 1, 1,
0.2772233, 0.9693613, 0.4104576, 1, 1, 1, 1, 1,
0.2775183, 0.686083, -1.111619, 1, 1, 1, 1, 1,
0.2789381, 0.7631063, 0.2591054, 1, 1, 1, 1, 1,
0.2851317, 1.013622, 0.4213124, 0, 0, 1, 1, 1,
0.288859, 1.150229, -0.2660371, 1, 0, 0, 1, 1,
0.2891553, -1.193682, 3.20077, 1, 0, 0, 1, 1,
0.2922221, -1.445648, 3.235091, 1, 0, 0, 1, 1,
0.2960568, -0.1997532, 3.731183, 1, 0, 0, 1, 1,
0.2967185, 0.5622252, 0.2845131, 1, 0, 0, 1, 1,
0.3050584, -1.416597, 2.404527, 0, 0, 0, 1, 1,
0.3057028, 0.1854832, 1.836698, 0, 0, 0, 1, 1,
0.311204, -0.8667797, 2.725658, 0, 0, 0, 1, 1,
0.3136944, -0.320017, 1.3999, 0, 0, 0, 1, 1,
0.3146565, -0.5133853, 2.28213, 0, 0, 0, 1, 1,
0.3146572, 0.5651075, -0.2819009, 0, 0, 0, 1, 1,
0.3181508, 0.8147812, 0.8761108, 0, 0, 0, 1, 1,
0.3182607, -0.9515032, 2.958176, 1, 1, 1, 1, 1,
0.3188782, -0.168276, 3.001116, 1, 1, 1, 1, 1,
0.3248146, -1.692426, 3.47708, 1, 1, 1, 1, 1,
0.329224, -0.08046442, 0.1631867, 1, 1, 1, 1, 1,
0.33186, 0.5641756, 0.1766132, 1, 1, 1, 1, 1,
0.3383583, 1.378485, -0.7794235, 1, 1, 1, 1, 1,
0.34448, -0.04114026, 2.215455, 1, 1, 1, 1, 1,
0.3449563, -0.05408389, 0.6843834, 1, 1, 1, 1, 1,
0.3522139, 0.5424047, 0.3076649, 1, 1, 1, 1, 1,
0.3560569, 1.119048, -0.3854286, 1, 1, 1, 1, 1,
0.3569, -0.4914714, 3.044106, 1, 1, 1, 1, 1,
0.3585197, 0.4410261, -1.131109, 1, 1, 1, 1, 1,
0.3588476, -1.049228, 3.289345, 1, 1, 1, 1, 1,
0.3612876, -0.264313, 3.547397, 1, 1, 1, 1, 1,
0.3630309, 0.1938181, 0.4900637, 1, 1, 1, 1, 1,
0.3635539, -1.547881, 4.075902, 0, 0, 1, 1, 1,
0.3637089, -0.6479228, 2.566452, 1, 0, 0, 1, 1,
0.3641796, 0.9290557, 1.543316, 1, 0, 0, 1, 1,
0.3744771, -0.8310111, 1.391675, 1, 0, 0, 1, 1,
0.3787587, 1.437583, -0.1522692, 1, 0, 0, 1, 1,
0.383997, -0.6061596, 2.324252, 1, 0, 0, 1, 1,
0.384991, -0.9600219, 3.238048, 0, 0, 0, 1, 1,
0.3856446, 0.8015218, -1.053187, 0, 0, 0, 1, 1,
0.3861696, 0.5261474, 0.4429566, 0, 0, 0, 1, 1,
0.3875028, -0.4455965, 1.97102, 0, 0, 0, 1, 1,
0.3921501, -0.4656301, 3.00179, 0, 0, 0, 1, 1,
0.3927766, 0.115873, -0.3968664, 0, 0, 0, 1, 1,
0.4000106, -0.1696973, 2.314598, 0, 0, 0, 1, 1,
0.4051068, -1.397016, 2.4411, 1, 1, 1, 1, 1,
0.4115945, 0.5167034, -0.100414, 1, 1, 1, 1, 1,
0.41236, -0.268675, 1.209904, 1, 1, 1, 1, 1,
0.4136225, -0.4996192, 3.381346, 1, 1, 1, 1, 1,
0.4136432, 0.101581, 1.330516, 1, 1, 1, 1, 1,
0.413966, -0.6345862, 1.714913, 1, 1, 1, 1, 1,
0.4139754, 0.9176237, -0.7081719, 1, 1, 1, 1, 1,
0.4142626, 0.1495171, 1.679387, 1, 1, 1, 1, 1,
0.4144664, -0.3517381, 0.7309567, 1, 1, 1, 1, 1,
0.4159084, 1.080327, 0.6013598, 1, 1, 1, 1, 1,
0.4166875, -0.5417586, 2.146047, 1, 1, 1, 1, 1,
0.419777, -0.163402, 0.2145889, 1, 1, 1, 1, 1,
0.4229041, -1.257706, 4.287783, 1, 1, 1, 1, 1,
0.4235183, 2.969836, 1.182502, 1, 1, 1, 1, 1,
0.4245355, -0.7378668, 2.933561, 1, 1, 1, 1, 1,
0.4279645, 0.09316715, 2.824523, 0, 0, 1, 1, 1,
0.4304233, 1.057778, 1.300689, 1, 0, 0, 1, 1,
0.4315983, -0.1908293, 1.2765, 1, 0, 0, 1, 1,
0.4317276, 0.6414895, 2.122352, 1, 0, 0, 1, 1,
0.4362993, -0.5230231, 2.126419, 1, 0, 0, 1, 1,
0.4376271, -0.7611095, 1.927415, 1, 0, 0, 1, 1,
0.4399418, -2.313582, 3.595178, 0, 0, 0, 1, 1,
0.444957, 0.02952337, 1.413961, 0, 0, 0, 1, 1,
0.4450978, -0.6398719, 4.371181, 0, 0, 0, 1, 1,
0.4503569, 0.6250386, -1.210942, 0, 0, 0, 1, 1,
0.4511184, -1.477935, 3.258991, 0, 0, 0, 1, 1,
0.4513054, 0.6092066, -0.5297695, 0, 0, 0, 1, 1,
0.4547862, 0.3424304, 0.5495558, 0, 0, 0, 1, 1,
0.4568757, 0.2905079, 1.052869, 1, 1, 1, 1, 1,
0.4579969, 0.2078048, 0.6310771, 1, 1, 1, 1, 1,
0.4625663, 0.3988815, 0.9733648, 1, 1, 1, 1, 1,
0.4685478, 0.0469924, 2.25133, 1, 1, 1, 1, 1,
0.4685918, -0.2012631, 2.07957, 1, 1, 1, 1, 1,
0.4725326, 1.132591, 0.5833721, 1, 1, 1, 1, 1,
0.4742363, -1.478984, 2.372585, 1, 1, 1, 1, 1,
0.4798286, -2.487245, 2.29803, 1, 1, 1, 1, 1,
0.480702, -0.5759057, 1.718515, 1, 1, 1, 1, 1,
0.4810934, 0.6063021, 0.4414937, 1, 1, 1, 1, 1,
0.4828325, 0.2338725, 1.792046, 1, 1, 1, 1, 1,
0.4859457, -1.10048, 0.9878805, 1, 1, 1, 1, 1,
0.4897134, -0.2579456, 2.56476, 1, 1, 1, 1, 1,
0.4943509, -0.04662318, -1.339145, 1, 1, 1, 1, 1,
0.4953907, 1.975356, -0.4183, 1, 1, 1, 1, 1,
0.4971199, 1.542036, -1.078045, 0, 0, 1, 1, 1,
0.5006105, -0.970989, 2.162549, 1, 0, 0, 1, 1,
0.5035577, 0.4694268, -0.3614271, 1, 0, 0, 1, 1,
0.5092428, -1.483279, 5.949014, 1, 0, 0, 1, 1,
0.5139828, 0.1869819, 1.572766, 1, 0, 0, 1, 1,
0.5144943, 1.025536, 0.2967478, 1, 0, 0, 1, 1,
0.5174977, 1.215643, 1.2099, 0, 0, 0, 1, 1,
0.5183787, 0.1428233, 3.438314, 0, 0, 0, 1, 1,
0.5210589, 0.4101225, 0.8658158, 0, 0, 0, 1, 1,
0.5251827, 0.4556259, -1.125833, 0, 0, 0, 1, 1,
0.5301144, 0.3387647, -0.2790849, 0, 0, 0, 1, 1,
0.5357953, 1.775281, -0.8545324, 0, 0, 0, 1, 1,
0.5367185, 0.1206642, 2.12138, 0, 0, 0, 1, 1,
0.5372971, 0.5317762, 1.834604, 1, 1, 1, 1, 1,
0.5377066, -0.6353415, 0.4975642, 1, 1, 1, 1, 1,
0.5452805, 0.9722786, -0.8861511, 1, 1, 1, 1, 1,
0.5460019, -0.1809578, 1.795079, 1, 1, 1, 1, 1,
0.5497175, -0.02078318, -0.3433617, 1, 1, 1, 1, 1,
0.5520855, 0.4870684, 2.016837, 1, 1, 1, 1, 1,
0.5560232, -0.4349582, 2.396633, 1, 1, 1, 1, 1,
0.5638222, -0.7141691, 0.7559253, 1, 1, 1, 1, 1,
0.5681714, -0.1947497, 3.118623, 1, 1, 1, 1, 1,
0.5688089, -1.869178, 3.926391, 1, 1, 1, 1, 1,
0.5706853, -0.1710467, 0.9278007, 1, 1, 1, 1, 1,
0.5718947, -0.01949331, 1.349983, 1, 1, 1, 1, 1,
0.574042, -0.764514, 3.381261, 1, 1, 1, 1, 1,
0.5740447, -0.6432666, 1.329385, 1, 1, 1, 1, 1,
0.574066, 0.5829908, -0.2777592, 1, 1, 1, 1, 1,
0.5744717, -0.780559, 2.872352, 0, 0, 1, 1, 1,
0.576625, -0.0575261, 1.671517, 1, 0, 0, 1, 1,
0.5814306, 0.3858052, 0.6439879, 1, 0, 0, 1, 1,
0.589034, -0.7846586, 2.956872, 1, 0, 0, 1, 1,
0.592504, -0.1606078, 1.830197, 1, 0, 0, 1, 1,
0.5974898, 1.215911, -0.5171685, 1, 0, 0, 1, 1,
0.5989515, -0.3370911, 0.1625776, 0, 0, 0, 1, 1,
0.6019803, -1.076673, 2.765623, 0, 0, 0, 1, 1,
0.6027692, 0.2616117, 0.7737966, 0, 0, 0, 1, 1,
0.6237257, 0.1892598, 1.338296, 0, 0, 0, 1, 1,
0.6255831, -1.603518, 2.787797, 0, 0, 0, 1, 1,
0.6293904, 0.6554631, -0.1567987, 0, 0, 0, 1, 1,
0.6362464, 0.442486, 2.025445, 0, 0, 0, 1, 1,
0.6413979, -0.6499568, 2.685114, 1, 1, 1, 1, 1,
0.6421931, -0.8464895, 2.543866, 1, 1, 1, 1, 1,
0.647821, 1.502836, 0.2081145, 1, 1, 1, 1, 1,
0.6480696, 0.3577334, -0.6339446, 1, 1, 1, 1, 1,
0.6568906, -1.051162, 3.082558, 1, 1, 1, 1, 1,
0.6579561, 0.6277821, 0.8239139, 1, 1, 1, 1, 1,
0.659815, 0.8739545, 0.7609119, 1, 1, 1, 1, 1,
0.660279, -0.4649216, 2.467004, 1, 1, 1, 1, 1,
0.6616886, 0.6365989, -1.037207, 1, 1, 1, 1, 1,
0.6659977, 0.7905218, 1.29545, 1, 1, 1, 1, 1,
0.6698931, -2.728032, 1.194401, 1, 1, 1, 1, 1,
0.6725039, 0.9739286, 0.5479504, 1, 1, 1, 1, 1,
0.6729146, -1.547228, 4.161434, 1, 1, 1, 1, 1,
0.6742537, 0.8742359, 1.592336, 1, 1, 1, 1, 1,
0.6786253, 0.9722568, 0.1725049, 1, 1, 1, 1, 1,
0.6787271, -0.9275284, 1.368758, 0, 0, 1, 1, 1,
0.6808082, -0.7685342, 1.46265, 1, 0, 0, 1, 1,
0.6830456, 1.259103, -0.2037775, 1, 0, 0, 1, 1,
0.687686, -1.025788, 2.521384, 1, 0, 0, 1, 1,
0.6885998, -1.017795, 3.468115, 1, 0, 0, 1, 1,
0.6910413, -0.1835312, 0.4312119, 1, 0, 0, 1, 1,
0.6950585, -0.05874259, 3.806984, 0, 0, 0, 1, 1,
0.6982005, 0.5373946, 0.2092268, 0, 0, 0, 1, 1,
0.6990186, -0.3999744, 2.591216, 0, 0, 0, 1, 1,
0.7005641, -1.925673, 2.82631, 0, 0, 0, 1, 1,
0.7054407, 0.1071602, 2.294656, 0, 0, 0, 1, 1,
0.709309, -0.9368563, 2.161596, 0, 0, 0, 1, 1,
0.7114539, 0.1150775, 0.08339377, 0, 0, 0, 1, 1,
0.7142791, 1.833071, 1.370916, 1, 1, 1, 1, 1,
0.715636, -0.4427535, 0.1839402, 1, 1, 1, 1, 1,
0.7167523, -0.09215689, 3.396042, 1, 1, 1, 1, 1,
0.7201252, 0.1975601, 0.3058606, 1, 1, 1, 1, 1,
0.7283017, -1.183373, 3.06641, 1, 1, 1, 1, 1,
0.7293951, 0.3133686, 1.757909, 1, 1, 1, 1, 1,
0.7301349, 2.492221, -0.8352817, 1, 1, 1, 1, 1,
0.7337258, 0.6287471, 0.9222828, 1, 1, 1, 1, 1,
0.7368333, -1.097916, 1.378752, 1, 1, 1, 1, 1,
0.7375777, 0.736321, 0.6988844, 1, 1, 1, 1, 1,
0.7384837, -1.610439, 3.790454, 1, 1, 1, 1, 1,
0.7405473, -0.5638236, 1.681692, 1, 1, 1, 1, 1,
0.7405921, 0.4115826, 1.80017, 1, 1, 1, 1, 1,
0.7416453, -2.557075, 3.636941, 1, 1, 1, 1, 1,
0.7444775, -0.4605827, 2.672981, 1, 1, 1, 1, 1,
0.7460418, 1.031427, 0.5477862, 0, 0, 1, 1, 1,
0.7479843, -0.9527137, 3.37155, 1, 0, 0, 1, 1,
0.7511098, 0.8750726, 1.390698, 1, 0, 0, 1, 1,
0.7512111, 0.2703779, 0.9765331, 1, 0, 0, 1, 1,
0.7519552, -0.06523474, 2.016235, 1, 0, 0, 1, 1,
0.7546862, -0.03646315, 1.96891, 1, 0, 0, 1, 1,
0.7768564, -0.1505971, 2.137323, 0, 0, 0, 1, 1,
0.7794026, -0.5723982, 1.806198, 0, 0, 0, 1, 1,
0.7845011, 0.2287495, 2.44408, 0, 0, 0, 1, 1,
0.786144, 0.7528465, 2.744332, 0, 0, 0, 1, 1,
0.790147, 0.1076234, 1.936092, 0, 0, 0, 1, 1,
0.7916427, -0.02337767, 0.7113734, 0, 0, 0, 1, 1,
0.8067242, -0.7962958, 1.599674, 0, 0, 0, 1, 1,
0.8095885, -0.6113378, 3.015003, 1, 1, 1, 1, 1,
0.8111393, 1.809915, 0.1885168, 1, 1, 1, 1, 1,
0.813435, 0.9470441, 1.164107, 1, 1, 1, 1, 1,
0.8211843, 2.921284, 0.4667501, 1, 1, 1, 1, 1,
0.8234156, 0.2515177, -0.4107638, 1, 1, 1, 1, 1,
0.8270102, 0.4947687, 0.7953124, 1, 1, 1, 1, 1,
0.8272454, -0.9586591, 1.999783, 1, 1, 1, 1, 1,
0.8275061, 1.478208, 1.068544, 1, 1, 1, 1, 1,
0.8302869, 0.498382, -0.639342, 1, 1, 1, 1, 1,
0.8337749, 1.500152, 1.267664, 1, 1, 1, 1, 1,
0.8339798, -0.8857015, 1.916021, 1, 1, 1, 1, 1,
0.8350545, 0.8915454, 1.158807, 1, 1, 1, 1, 1,
0.8384525, 0.2254782, -0.05027142, 1, 1, 1, 1, 1,
0.8407615, -0.4241445, 2.347394, 1, 1, 1, 1, 1,
0.8413755, -0.8744152, 2.911409, 1, 1, 1, 1, 1,
0.8521931, -0.1975639, 1.720106, 0, 0, 1, 1, 1,
0.8551314, 0.6339897, 1.901515, 1, 0, 0, 1, 1,
0.8559645, 1.082578, -0.2851984, 1, 0, 0, 1, 1,
0.8580552, 0.862137, 0.7856615, 1, 0, 0, 1, 1,
0.8756417, 0.9816632, 0.2854556, 1, 0, 0, 1, 1,
0.8783867, -0.1442618, 1.009103, 1, 0, 0, 1, 1,
0.8784463, 0.3746939, 0.04228461, 0, 0, 0, 1, 1,
0.8823813, -0.06112975, 1.729971, 0, 0, 0, 1, 1,
0.8838461, 0.3003393, 3.512905, 0, 0, 0, 1, 1,
0.8851644, 0.3745656, 3.00331, 0, 0, 0, 1, 1,
0.8892786, -0.4952813, 1.784007, 0, 0, 0, 1, 1,
0.8930476, -1.06432, 4.112643, 0, 0, 0, 1, 1,
0.8934158, 0.214682, 2.203984, 0, 0, 0, 1, 1,
0.9051878, -2.195937, 1.056841, 1, 1, 1, 1, 1,
0.9138032, -0.1508064, 1.597079, 1, 1, 1, 1, 1,
0.9148869, -0.1110232, 2.026858, 1, 1, 1, 1, 1,
0.9149309, -0.8284262, 1.959812, 1, 1, 1, 1, 1,
0.9178357, -1.088611, 2.324024, 1, 1, 1, 1, 1,
0.9195055, 0.6043004, -1.911554, 1, 1, 1, 1, 1,
0.9245222, 0.5152722, 1.086585, 1, 1, 1, 1, 1,
0.9325637, -0.9214472, 2.847701, 1, 1, 1, 1, 1,
0.9374893, 0.7836532, 0.5623126, 1, 1, 1, 1, 1,
0.9381564, 1.392465, 1.243393, 1, 1, 1, 1, 1,
0.943659, -0.8337749, 2.164881, 1, 1, 1, 1, 1,
0.9460877, 0.3093016, 2.318283, 1, 1, 1, 1, 1,
0.9491594, -0.4608648, 1.933925, 1, 1, 1, 1, 1,
0.9518338, 0.6801089, 0.4702502, 1, 1, 1, 1, 1,
0.9605548, 0.7767762, 0.02513818, 1, 1, 1, 1, 1,
0.9654149, -0.2568053, 2.72111, 0, 0, 1, 1, 1,
0.9770761, -0.7238767, 0.6876158, 1, 0, 0, 1, 1,
0.9793962, -2.380474, 2.326579, 1, 0, 0, 1, 1,
0.9803436, 0.7937667, 0.6607394, 1, 0, 0, 1, 1,
0.992281, -1.112195, 2.567051, 1, 0, 0, 1, 1,
0.9927247, -0.8752128, 3.492225, 1, 0, 0, 1, 1,
0.9990547, 1.422452, 0.6360682, 0, 0, 0, 1, 1,
1.00561, -1.204957, 3.66854, 0, 0, 0, 1, 1,
1.006255, 0.3341979, -0.4799628, 0, 0, 0, 1, 1,
1.010852, 0.5135011, 0.6001511, 0, 0, 0, 1, 1,
1.014605, 1.863509, 1.109337, 0, 0, 0, 1, 1,
1.019125, -0.5691897, 3.046858, 0, 0, 0, 1, 1,
1.025314, 1.096785, 0.290082, 0, 0, 0, 1, 1,
1.027117, 0.3256988, 2.434389, 1, 1, 1, 1, 1,
1.027468, -0.6154197, 3.894031, 1, 1, 1, 1, 1,
1.036815, 0.8437122, 1.807985, 1, 1, 1, 1, 1,
1.038264, 0.3688179, 2.317, 1, 1, 1, 1, 1,
1.039811, 1.172566, 2.721618, 1, 1, 1, 1, 1,
1.041588, 0.8582292, 0.0169164, 1, 1, 1, 1, 1,
1.044039, -0.2175794, 3.96505, 1, 1, 1, 1, 1,
1.048379, -0.09814902, 0.694614, 1, 1, 1, 1, 1,
1.050441, -0.2569472, 1.72712, 1, 1, 1, 1, 1,
1.05678, -1.838072, 2.621935, 1, 1, 1, 1, 1,
1.06764, 0.8670992, 2.119474, 1, 1, 1, 1, 1,
1.07136, -2.199336, 1.346337, 1, 1, 1, 1, 1,
1.080835, 0.6196483, 0.2445864, 1, 1, 1, 1, 1,
1.082988, -0.8419724, 3.901093, 1, 1, 1, 1, 1,
1.084512, -0.3453608, 0.9130349, 1, 1, 1, 1, 1,
1.092043, 0.7089021, 0.9222993, 0, 0, 1, 1, 1,
1.093413, 1.416857, 0.2017446, 1, 0, 0, 1, 1,
1.096239, 0.5360394, 3.736558, 1, 0, 0, 1, 1,
1.096836, -1.817613, 2.868026, 1, 0, 0, 1, 1,
1.09996, 0.2467484, 0.5799959, 1, 0, 0, 1, 1,
1.101458, -0.03268784, 0.1141716, 1, 0, 0, 1, 1,
1.103332, 0.350442, 2.07727, 0, 0, 0, 1, 1,
1.105573, -1.302694, 0.6141592, 0, 0, 0, 1, 1,
1.126043, -0.9537043, 2.872004, 0, 0, 0, 1, 1,
1.134415, -0.9410125, 1.152018, 0, 0, 0, 1, 1,
1.146577, 1.215848, 1.976279, 0, 0, 0, 1, 1,
1.148604, -1.066792, 3.051476, 0, 0, 0, 1, 1,
1.158573, -0.7335086, 3.320602, 0, 0, 0, 1, 1,
1.162102, -1.292338, 2.707087, 1, 1, 1, 1, 1,
1.166419, -0.8383033, 2.462462, 1, 1, 1, 1, 1,
1.169903, -0.1701879, 2.23128, 1, 1, 1, 1, 1,
1.170615, -0.4176978, 2.592832, 1, 1, 1, 1, 1,
1.175918, 0.6371087, 0.9582193, 1, 1, 1, 1, 1,
1.181071, 1.400985, -0.4292322, 1, 1, 1, 1, 1,
1.181668, 1.218437, 0.4559757, 1, 1, 1, 1, 1,
1.184472, -1.364586, 2.202751, 1, 1, 1, 1, 1,
1.186511, -0.118917, -0.3028647, 1, 1, 1, 1, 1,
1.188132, 2.586573, 0.4466567, 1, 1, 1, 1, 1,
1.190257, -0.8360037, 1.580496, 1, 1, 1, 1, 1,
1.192823, 1.646385, 1.813712, 1, 1, 1, 1, 1,
1.195978, 1.237474, 1.515372, 1, 1, 1, 1, 1,
1.209954, 0.9322476, 1.044466, 1, 1, 1, 1, 1,
1.227173, -0.3114576, 0.2364569, 1, 1, 1, 1, 1,
1.231721, 1.098641, 0.4891153, 0, 0, 1, 1, 1,
1.242772, -1.379239, 1.233107, 1, 0, 0, 1, 1,
1.248426, -0.4434703, 2.277309, 1, 0, 0, 1, 1,
1.249395, -0.5476714, 2.256992, 1, 0, 0, 1, 1,
1.250415, -0.5437561, 1.446596, 1, 0, 0, 1, 1,
1.252227, 0.7433991, 1.433299, 1, 0, 0, 1, 1,
1.257481, 1.528605, 2.665433, 0, 0, 0, 1, 1,
1.287022, -0.4460966, 1.395288, 0, 0, 0, 1, 1,
1.287835, -1.197078, 2.944051, 0, 0, 0, 1, 1,
1.293977, 0.3687927, 2.209803, 0, 0, 0, 1, 1,
1.298317, 2.218739, -0.5962533, 0, 0, 0, 1, 1,
1.304233, 0.003424277, -0.1244222, 0, 0, 0, 1, 1,
1.313437, 3.283513, -0.5849212, 0, 0, 0, 1, 1,
1.318201, -2.334907, 3.685642, 1, 1, 1, 1, 1,
1.341299, -0.1863339, 0.6104355, 1, 1, 1, 1, 1,
1.342073, -0.235001, 4.602773, 1, 1, 1, 1, 1,
1.345573, -1.026095, 1.707137, 1, 1, 1, 1, 1,
1.346204, -0.092874, 2.699554, 1, 1, 1, 1, 1,
1.361425, 1.471239, 1.604758, 1, 1, 1, 1, 1,
1.368382, -0.2426763, 3.449712, 1, 1, 1, 1, 1,
1.371575, 0.5136637, 2.164305, 1, 1, 1, 1, 1,
1.380966, 1.126567, 1.73313, 1, 1, 1, 1, 1,
1.38153, -0.4013909, 2.073035, 1, 1, 1, 1, 1,
1.391721, 0.09628073, 2.567181, 1, 1, 1, 1, 1,
1.398265, -0.8376207, 2.390677, 1, 1, 1, 1, 1,
1.401617, 0.2436105, 1.102725, 1, 1, 1, 1, 1,
1.40165, 1.420151, 0.7904202, 1, 1, 1, 1, 1,
1.417239, -1.466193, 2.06957, 1, 1, 1, 1, 1,
1.431066, -2.547922, 2.116908, 0, 0, 1, 1, 1,
1.431952, 0.04744796, 0.7423386, 1, 0, 0, 1, 1,
1.439298, 0.09929231, 0.8548014, 1, 0, 0, 1, 1,
1.443396, -0.4484469, 2.392606, 1, 0, 0, 1, 1,
1.449562, -1.088091, 3.457425, 1, 0, 0, 1, 1,
1.451318, -1.499779, 1.18819, 1, 0, 0, 1, 1,
1.457854, -0.06028312, 1.183617, 0, 0, 0, 1, 1,
1.460637, -0.9238676, 2.27154, 0, 0, 0, 1, 1,
1.476699, 0.2416589, 2.116498, 0, 0, 0, 1, 1,
1.479119, 0.6467834, 1.802662, 0, 0, 0, 1, 1,
1.4848, 0.1386084, -0.3479989, 0, 0, 0, 1, 1,
1.49533, -1.619726, 2.6865, 0, 0, 0, 1, 1,
1.4971, 2.300894, 0.8069305, 0, 0, 0, 1, 1,
1.503831, -1.415398, 3.739939, 1, 1, 1, 1, 1,
1.517571, 0.1275785, -0.7515697, 1, 1, 1, 1, 1,
1.519571, 0.8680344, 2.332069, 1, 1, 1, 1, 1,
1.526286, -0.9015703, 3.126255, 1, 1, 1, 1, 1,
1.535946, 1.089482, 1.489555, 1, 1, 1, 1, 1,
1.539117, 0.7246237, 0.4452934, 1, 1, 1, 1, 1,
1.539893, 0.7138956, 1.876608, 1, 1, 1, 1, 1,
1.539959, 1.755227, 2.294369, 1, 1, 1, 1, 1,
1.54461, -0.3741625, 1.638827, 1, 1, 1, 1, 1,
1.553866, 1.196342, 1.807796, 1, 1, 1, 1, 1,
1.591235, 0.9316996, 1.583701, 1, 1, 1, 1, 1,
1.596614, 1.877509, -0.3173911, 1, 1, 1, 1, 1,
1.598236, 0.3042753, 0.2102376, 1, 1, 1, 1, 1,
1.60496, -1.340784, 1.934127, 1, 1, 1, 1, 1,
1.631686, 0.8938309, 1.918762, 1, 1, 1, 1, 1,
1.638029, -1.281402, 2.955053, 0, 0, 1, 1, 1,
1.642462, 0.3537014, 0.6975999, 1, 0, 0, 1, 1,
1.649044, 0.984263, 1.7449, 1, 0, 0, 1, 1,
1.658273, -0.3659219, 1.130054, 1, 0, 0, 1, 1,
1.664919, 0.2600134, 0.6584502, 1, 0, 0, 1, 1,
1.676666, 0.2555693, 0.4148353, 1, 0, 0, 1, 1,
1.68216, -2.066615, 2.54068, 0, 0, 0, 1, 1,
1.720049, 0.06657039, 2.622651, 0, 0, 0, 1, 1,
1.733692, -0.691348, 1.667912, 0, 0, 0, 1, 1,
1.752464, 0.009247696, 0.8030066, 0, 0, 0, 1, 1,
1.753699, -1.569631, 2.662755, 0, 0, 0, 1, 1,
1.768733, -0.08319606, 1.574259, 0, 0, 0, 1, 1,
1.775819, 2.0617, 2.13788, 0, 0, 0, 1, 1,
1.778431, 0.1706308, 2.436091, 1, 1, 1, 1, 1,
1.796076, -1.217796, 1.649226, 1, 1, 1, 1, 1,
1.796145, -1.023048, 2.496139, 1, 1, 1, 1, 1,
1.802536, -0.953839, 2.436584, 1, 1, 1, 1, 1,
1.829312, 0.7807847, 1.686154, 1, 1, 1, 1, 1,
1.830389, 0.5310677, 2.555836, 1, 1, 1, 1, 1,
1.840393, 1.517247, 0.2790717, 1, 1, 1, 1, 1,
1.861732, 2.851825, -0.9976196, 1, 1, 1, 1, 1,
1.892004, -0.287089, -0.1423484, 1, 1, 1, 1, 1,
1.907514, 0.3977096, 0.6624133, 1, 1, 1, 1, 1,
1.921403, 0.5410273, 2.204592, 1, 1, 1, 1, 1,
1.926626, 0.09667814, -1.146383, 1, 1, 1, 1, 1,
1.93239, 0.1032474, 1.695143, 1, 1, 1, 1, 1,
1.946481, -0.939197, 0.0698264, 1, 1, 1, 1, 1,
1.95513, 1.050456, 2.312506, 1, 1, 1, 1, 1,
1.992187, -0.9261616, 2.659569, 0, 0, 1, 1, 1,
2.093595, -0.5779223, 1.432333, 1, 0, 0, 1, 1,
2.095912, 1.710949, 0.2931399, 1, 0, 0, 1, 1,
2.117716, -0.6581056, 2.670769, 1, 0, 0, 1, 1,
2.130048, 0.128556, -0.2523858, 1, 0, 0, 1, 1,
2.173357, 0.09281638, -1.205639, 1, 0, 0, 1, 1,
2.179302, 0.7847189, 1.757311, 0, 0, 0, 1, 1,
2.217593, 1.157351, 0.5567628, 0, 0, 0, 1, 1,
2.221851, -1.610302, 1.832866, 0, 0, 0, 1, 1,
2.264584, 0.2241792, 1.158799, 0, 0, 0, 1, 1,
2.273692, 1.235783, 0.3489119, 0, 0, 0, 1, 1,
2.288448, 0.7047783, 1.61588, 0, 0, 0, 1, 1,
2.316398, 1.058795, 2.346129, 0, 0, 0, 1, 1,
2.36563, 0.384469, 0.4616088, 1, 1, 1, 1, 1,
2.457695, 0.5116423, 1.519232, 1, 1, 1, 1, 1,
2.478089, -0.02039983, 1.715636, 1, 1, 1, 1, 1,
2.606387, -0.07445381, 1.719092, 1, 1, 1, 1, 1,
2.836804, 0.4431096, 1.748193, 1, 1, 1, 1, 1,
2.912665, 0.03479169, 1.853851, 1, 1, 1, 1, 1,
3.1875, 1.955352, 0.02476883, 1, 1, 1, 1, 1
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
var radius = 9.985471;
var distance = 35.07354;
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
mvMatrix.translate( 0.01472545, -0.0109787, -0.1305537 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.07354);
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
