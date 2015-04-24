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
-3.291356, 0.2200317, -2.484162, 1, 0, 0, 1,
-3.11931, -0.6875757, -1.550502, 1, 0.007843138, 0, 1,
-2.88111, -0.1199948, -1.315636, 1, 0.01176471, 0, 1,
-2.86335, 0.777528, -3.021955, 1, 0.01960784, 0, 1,
-2.6421, -0.7299654, -2.201707, 1, 0.02352941, 0, 1,
-2.597654, 1.253063, 0.5148547, 1, 0.03137255, 0, 1,
-2.596895, 0.06452118, -1.200713, 1, 0.03529412, 0, 1,
-2.521548, -0.3877655, -1.81216, 1, 0.04313726, 0, 1,
-2.519017, 0.8337899, -0.7333167, 1, 0.04705882, 0, 1,
-2.431183, 0.5426365, -0.6692774, 1, 0.05490196, 0, 1,
-2.407507, 0.6985474, -2.265506, 1, 0.05882353, 0, 1,
-2.350495, 0.6783041, -2.067121, 1, 0.06666667, 0, 1,
-2.308704, -0.707754, -1.260822, 1, 0.07058824, 0, 1,
-2.308599, -0.3743299, -1.215342, 1, 0.07843138, 0, 1,
-2.259371, -0.05880289, 0.3211471, 1, 0.08235294, 0, 1,
-2.223758, -0.6006142, -0.4355561, 1, 0.09019608, 0, 1,
-2.206008, 0.3879988, -2.369793, 1, 0.09411765, 0, 1,
-2.198759, -0.4379182, -1.281407, 1, 0.1019608, 0, 1,
-2.194569, -0.06885178, 0.3598648, 1, 0.1098039, 0, 1,
-2.145759, 0.1722498, -0.8349319, 1, 0.1137255, 0, 1,
-2.143229, -2.538856, -0.6458699, 1, 0.1215686, 0, 1,
-2.121554, -0.5128908, -4.543588, 1, 0.1254902, 0, 1,
-2.116832, -1.202538, -3.684865, 1, 0.1333333, 0, 1,
-2.097841, 1.098144, -2.915153, 1, 0.1372549, 0, 1,
-2.097044, -1.572849, -3.197178, 1, 0.145098, 0, 1,
-2.047438, -1.580624, -0.5543108, 1, 0.1490196, 0, 1,
-2.046778, 0.1552581, -1.581275, 1, 0.1568628, 0, 1,
-2.011255, 0.7112002, -1.62151, 1, 0.1607843, 0, 1,
-1.984485, 0.6286501, -2.361638, 1, 0.1686275, 0, 1,
-1.983307, 0.6704082, -0.9822381, 1, 0.172549, 0, 1,
-1.952559, 3.014792, -0.8364447, 1, 0.1803922, 0, 1,
-1.946405, 0.8395833, -1.732395, 1, 0.1843137, 0, 1,
-1.930827, 0.8222677, -0.5877172, 1, 0.1921569, 0, 1,
-1.928422, -0.3034446, -2.244419, 1, 0.1960784, 0, 1,
-1.9237, 0.8652508, -3.352775, 1, 0.2039216, 0, 1,
-1.912002, 0.03387248, -1.857137, 1, 0.2117647, 0, 1,
-1.896268, -1.277632, -1.054373, 1, 0.2156863, 0, 1,
-1.896104, -0.979405, -0.1402459, 1, 0.2235294, 0, 1,
-1.877833, -0.7548521, -2.176685, 1, 0.227451, 0, 1,
-1.87006, 0.274074, -3.977144, 1, 0.2352941, 0, 1,
-1.817872, 0.4240416, 0.1918247, 1, 0.2392157, 0, 1,
-1.801443, 1.299257, 0.0334412, 1, 0.2470588, 0, 1,
-1.75076, -0.9555967, -2.60277, 1, 0.2509804, 0, 1,
-1.740949, 0.494667, -1.345071, 1, 0.2588235, 0, 1,
-1.719282, 1.379655, -1.292585, 1, 0.2627451, 0, 1,
-1.712129, 0.9431403, -2.429708, 1, 0.2705882, 0, 1,
-1.689462, 1.317409, -0.07804812, 1, 0.2745098, 0, 1,
-1.675096, -1.339679, -2.221658, 1, 0.282353, 0, 1,
-1.668992, -1.387665, -3.788368, 1, 0.2862745, 0, 1,
-1.634529, -1.142939, -1.471749, 1, 0.2941177, 0, 1,
-1.62626, -0.3389716, -1.771798, 1, 0.3019608, 0, 1,
-1.607888, 0.196496, 0.07457403, 1, 0.3058824, 0, 1,
-1.599985, -0.5782226, -3.675227, 1, 0.3137255, 0, 1,
-1.599777, 2.239547, -1.373672, 1, 0.3176471, 0, 1,
-1.593472, -0.3299487, -2.327564, 1, 0.3254902, 0, 1,
-1.580942, -0.6219415, -1.718781, 1, 0.3294118, 0, 1,
-1.580034, 0.03940287, -1.917242, 1, 0.3372549, 0, 1,
-1.578166, 0.08751227, -2.963623, 1, 0.3411765, 0, 1,
-1.577772, 0.7217233, -2.044155, 1, 0.3490196, 0, 1,
-1.557924, 0.3020975, -1.649952, 1, 0.3529412, 0, 1,
-1.551457, 0.2356439, -1.289481, 1, 0.3607843, 0, 1,
-1.542138, -1.787322, -3.196109, 1, 0.3647059, 0, 1,
-1.538694, 0.6841371, -2.375736, 1, 0.372549, 0, 1,
-1.536666, -0.9012445, -3.053563, 1, 0.3764706, 0, 1,
-1.536403, -0.3063957, -0.4993351, 1, 0.3843137, 0, 1,
-1.528143, 0.7676844, -1.07853, 1, 0.3882353, 0, 1,
-1.523691, 1.552219, -0.5430287, 1, 0.3960784, 0, 1,
-1.514258, -0.3490431, -2.867811, 1, 0.4039216, 0, 1,
-1.505652, 1.317304, -0.5343131, 1, 0.4078431, 0, 1,
-1.463099, 0.8272753, -1.231954, 1, 0.4156863, 0, 1,
-1.450061, -0.3374043, -1.217397, 1, 0.4196078, 0, 1,
-1.443909, 0.2020743, -1.682611, 1, 0.427451, 0, 1,
-1.398103, 0.4681587, 1.882165, 1, 0.4313726, 0, 1,
-1.377244, -0.3273138, -3.145659, 1, 0.4392157, 0, 1,
-1.375747, 0.9078603, 0.2095992, 1, 0.4431373, 0, 1,
-1.375461, -1.627897, -2.205196, 1, 0.4509804, 0, 1,
-1.371225, -0.5686291, -2.775945, 1, 0.454902, 0, 1,
-1.363106, -0.3565077, -1.590221, 1, 0.4627451, 0, 1,
-1.356522, -0.6746743, -2.429729, 1, 0.4666667, 0, 1,
-1.340864, -1.260672, -2.143322, 1, 0.4745098, 0, 1,
-1.333673, -2.443086, -3.087415, 1, 0.4784314, 0, 1,
-1.328773, 1.395704, -1.670582, 1, 0.4862745, 0, 1,
-1.326214, 0.549956, -0.4969063, 1, 0.4901961, 0, 1,
-1.318154, 1.782804, -0.1848349, 1, 0.4980392, 0, 1,
-1.313657, 1.845153, -1.102198, 1, 0.5058824, 0, 1,
-1.301647, 0.620449, -0.7122874, 1, 0.509804, 0, 1,
-1.283947, -1.52161, -0.6871282, 1, 0.5176471, 0, 1,
-1.281557, 1.071894, -1.291543, 1, 0.5215687, 0, 1,
-1.27463, -0.2576886, -1.254897, 1, 0.5294118, 0, 1,
-1.270642, 0.4305494, -1.710759, 1, 0.5333334, 0, 1,
-1.264175, -1.082777, -2.873338, 1, 0.5411765, 0, 1,
-1.255884, 0.622832, -1.315271, 1, 0.5450981, 0, 1,
-1.255166, 0.2741318, -3.580777, 1, 0.5529412, 0, 1,
-1.251612, -0.4291374, -0.4151359, 1, 0.5568628, 0, 1,
-1.243147, -0.3732998, -2.099704, 1, 0.5647059, 0, 1,
-1.241984, 0.847339, -0.3601768, 1, 0.5686275, 0, 1,
-1.234787, -0.0171583, -1.53621, 1, 0.5764706, 0, 1,
-1.231113, 1.23444, -1.623671, 1, 0.5803922, 0, 1,
-1.229737, -0.7896361, -3.039601, 1, 0.5882353, 0, 1,
-1.229398, 1.053392, -1.255535, 1, 0.5921569, 0, 1,
-1.210986, -0.250203, -1.966259, 1, 0.6, 0, 1,
-1.210612, -1.050716, -2.721945, 1, 0.6078432, 0, 1,
-1.21005, 0.0438358, -0.9442195, 1, 0.6117647, 0, 1,
-1.209638, -0.8330241, -2.086133, 1, 0.6196079, 0, 1,
-1.202825, -1.374426, -4.381937, 1, 0.6235294, 0, 1,
-1.197123, 0.370156, 0.3408691, 1, 0.6313726, 0, 1,
-1.194611, -0.5798085, -1.406043, 1, 0.6352941, 0, 1,
-1.191659, 0.5923985, -0.5879629, 1, 0.6431373, 0, 1,
-1.185494, 0.09959899, -1.331685, 1, 0.6470588, 0, 1,
-1.178559, 0.5394992, -1.02441, 1, 0.654902, 0, 1,
-1.154698, -0.2439558, -1.609047, 1, 0.6588235, 0, 1,
-1.144577, 0.5097929, -0.7402214, 1, 0.6666667, 0, 1,
-1.142924, -0.4755054, -0.6356933, 1, 0.6705883, 0, 1,
-1.134218, 0.1254473, -2.076412, 1, 0.6784314, 0, 1,
-1.127469, 0.1337292, -1.937826, 1, 0.682353, 0, 1,
-1.110679, 0.03174533, -0.523249, 1, 0.6901961, 0, 1,
-1.110624, -0.1642473, -1.804586, 1, 0.6941177, 0, 1,
-1.101514, 0.2571745, -2.003255, 1, 0.7019608, 0, 1,
-1.09851, 0.6393468, 0.6064536, 1, 0.7098039, 0, 1,
-1.096777, -1.44059, -2.830132, 1, 0.7137255, 0, 1,
-1.095736, -0.08662042, 0.301111, 1, 0.7215686, 0, 1,
-1.095134, 0.870542, -0.3943057, 1, 0.7254902, 0, 1,
-1.078134, -1.389873, -2.185454, 1, 0.7333333, 0, 1,
-1.07353, -0.7469735, -2.176323, 1, 0.7372549, 0, 1,
-1.071227, -0.655328, -3.054246, 1, 0.7450981, 0, 1,
-1.070992, 0.06014432, -1.381111, 1, 0.7490196, 0, 1,
-1.067358, -0.9550864, -3.434306, 1, 0.7568628, 0, 1,
-1.06563, 2.32716, -0.2215007, 1, 0.7607843, 0, 1,
-1.062905, 1.511792, -1.902415, 1, 0.7686275, 0, 1,
-1.059364, -1.277634, -3.569291, 1, 0.772549, 0, 1,
-1.058626, 0.5805032, -1.123327, 1, 0.7803922, 0, 1,
-1.057996, -0.005895008, -1.803421, 1, 0.7843137, 0, 1,
-1.046408, -0.1578477, -2.021017, 1, 0.7921569, 0, 1,
-1.019056, 0.3459043, -1.120902, 1, 0.7960784, 0, 1,
-1.015871, 0.07447661, -1.921001, 1, 0.8039216, 0, 1,
-1.008866, -0.8593854, -0.9953498, 1, 0.8117647, 0, 1,
-1.007178, 0.5633283, -0.4472241, 1, 0.8156863, 0, 1,
-0.9976446, -1.967674, -2.553455, 1, 0.8235294, 0, 1,
-0.990149, -0.7122608, -1.731294, 1, 0.827451, 0, 1,
-0.9887844, 0.8550146, -1.706304, 1, 0.8352941, 0, 1,
-0.9826646, 0.5935445, -1.077928, 1, 0.8392157, 0, 1,
-0.9814134, -1.958436, -3.746738, 1, 0.8470588, 0, 1,
-0.9808674, 0.6840571, 0.465682, 1, 0.8509804, 0, 1,
-0.9761012, -1.3121, -1.117718, 1, 0.8588235, 0, 1,
-0.9735072, -0.608136, -2.577266, 1, 0.8627451, 0, 1,
-0.9675035, 0.1975741, -1.212258, 1, 0.8705882, 0, 1,
-0.9673731, -0.6969707, -2.711163, 1, 0.8745098, 0, 1,
-0.9537693, 0.3513284, -0.8985022, 1, 0.8823529, 0, 1,
-0.9435459, -0.9217687, -2.125368, 1, 0.8862745, 0, 1,
-0.9430146, 1.792408, -0.8908463, 1, 0.8941177, 0, 1,
-0.9425973, -0.8923448, -3.429766, 1, 0.8980392, 0, 1,
-0.9413192, 1.442454, -1.729697, 1, 0.9058824, 0, 1,
-0.939799, -0.1477101, -2.016302, 1, 0.9137255, 0, 1,
-0.9353192, 0.3452223, -1.852303, 1, 0.9176471, 0, 1,
-0.9307329, -0.559392, -1.58672, 1, 0.9254902, 0, 1,
-0.9297054, -1.355588, -3.027897, 1, 0.9294118, 0, 1,
-0.9237682, -1.173929, -2.417942, 1, 0.9372549, 0, 1,
-0.9189677, -0.007650096, -2.13517, 1, 0.9411765, 0, 1,
-0.9180932, 1.026416, 0.3840753, 1, 0.9490196, 0, 1,
-0.9132625, -1.517796, -3.031404, 1, 0.9529412, 0, 1,
-0.9115832, 0.2817574, -1.806487, 1, 0.9607843, 0, 1,
-0.9065104, 1.207214, -0.3781887, 1, 0.9647059, 0, 1,
-0.9059417, 1.609526, -1.546582, 1, 0.972549, 0, 1,
-0.9045075, -0.5231106, -3.070021, 1, 0.9764706, 0, 1,
-0.9037039, -0.6058072, -4.213355, 1, 0.9843137, 0, 1,
-0.9030781, -1.881174, -1.323332, 1, 0.9882353, 0, 1,
-0.9025018, 0.05773737, -3.070156, 1, 0.9960784, 0, 1,
-0.8962163, 0.3599804, -0.4173915, 0.9960784, 1, 0, 1,
-0.8887653, -0.4838109, -3.606966, 0.9921569, 1, 0, 1,
-0.888695, -0.8326094, -2.839142, 0.9843137, 1, 0, 1,
-0.8842041, 0.5575477, -0.6865961, 0.9803922, 1, 0, 1,
-0.8824415, 1.01068, 1.204527, 0.972549, 1, 0, 1,
-0.8717983, -1.768787, -2.736766, 0.9686275, 1, 0, 1,
-0.867039, -0.818041, -2.650418, 0.9607843, 1, 0, 1,
-0.8665525, -1.421625, -0.1655321, 0.9568627, 1, 0, 1,
-0.8644422, -1.121775, -3.666263, 0.9490196, 1, 0, 1,
-0.8626929, 0.5692152, -0.8372014, 0.945098, 1, 0, 1,
-0.8570507, -0.1478195, -0.2102509, 0.9372549, 1, 0, 1,
-0.8532712, 0.7617984, -1.345416, 0.9333333, 1, 0, 1,
-0.8505528, -0.6233183, -1.304774, 0.9254902, 1, 0, 1,
-0.8491153, 1.605585, -0.3820437, 0.9215686, 1, 0, 1,
-0.8475891, 0.07432812, -0.8219196, 0.9137255, 1, 0, 1,
-0.8428788, -1.944163, -2.441797, 0.9098039, 1, 0, 1,
-0.8384578, -0.6391956, -0.7375684, 0.9019608, 1, 0, 1,
-0.8382723, -0.4143739, -3.143806, 0.8941177, 1, 0, 1,
-0.8377674, -0.01909549, -0.7103698, 0.8901961, 1, 0, 1,
-0.8361036, 1.396004, 1.442462, 0.8823529, 1, 0, 1,
-0.8351026, 0.777588, -1.746586, 0.8784314, 1, 0, 1,
-0.830788, 0.1807801, -2.185687, 0.8705882, 1, 0, 1,
-0.8216121, 1.946572, -0.3806261, 0.8666667, 1, 0, 1,
-0.8171689, 1.19406, 0.6954503, 0.8588235, 1, 0, 1,
-0.8155204, -0.04238797, -0.5061018, 0.854902, 1, 0, 1,
-0.805666, 0.4580593, -0.5750929, 0.8470588, 1, 0, 1,
-0.8011933, 0.5749742, -0.6027921, 0.8431373, 1, 0, 1,
-0.7987895, 1.065981, -1.473829, 0.8352941, 1, 0, 1,
-0.7962055, -0.8659642, -3.06356, 0.8313726, 1, 0, 1,
-0.7954204, 0.6737253, -1.446591, 0.8235294, 1, 0, 1,
-0.7947612, 0.1410789, -0.9080386, 0.8196079, 1, 0, 1,
-0.7902802, 1.600602, -0.1113073, 0.8117647, 1, 0, 1,
-0.7777543, -0.2963216, -0.1595307, 0.8078431, 1, 0, 1,
-0.7699087, 1.016489, -1.461054, 0.8, 1, 0, 1,
-0.7680669, 0.3252693, -0.8215666, 0.7921569, 1, 0, 1,
-0.7676962, -1.302791, -1.286957, 0.7882353, 1, 0, 1,
-0.7640827, 1.354179, -0.9050258, 0.7803922, 1, 0, 1,
-0.7514715, -0.7034224, -0.4524713, 0.7764706, 1, 0, 1,
-0.7509546, -0.1968988, -2.32104, 0.7686275, 1, 0, 1,
-0.7494863, -1.160354, -3.258455, 0.7647059, 1, 0, 1,
-0.7453715, 0.4047156, -2.055089, 0.7568628, 1, 0, 1,
-0.7452946, 1.495131, -0.4664753, 0.7529412, 1, 0, 1,
-0.744646, -0.1128982, -2.255414, 0.7450981, 1, 0, 1,
-0.7396381, 0.7160644, -1.497188, 0.7411765, 1, 0, 1,
-0.7375312, -0.4023131, -3.233549, 0.7333333, 1, 0, 1,
-0.7330759, 0.226827, -1.319937, 0.7294118, 1, 0, 1,
-0.7307375, 0.06672593, -0.623234, 0.7215686, 1, 0, 1,
-0.7239528, 0.5456321, -1.427227, 0.7176471, 1, 0, 1,
-0.7228684, 0.3698756, 0.2467272, 0.7098039, 1, 0, 1,
-0.719497, -0.06438806, -2.994465, 0.7058824, 1, 0, 1,
-0.7183086, -2.07826, -1.12151, 0.6980392, 1, 0, 1,
-0.7107349, -0.8539279, -3.190468, 0.6901961, 1, 0, 1,
-0.7101663, -1.768781, -3.121244, 0.6862745, 1, 0, 1,
-0.7049553, -0.2660289, -1.975726, 0.6784314, 1, 0, 1,
-0.700216, 0.1984014, -1.584915, 0.6745098, 1, 0, 1,
-0.6964361, 0.4647373, -1.968297, 0.6666667, 1, 0, 1,
-0.6963806, 0.7728792, -0.730195, 0.6627451, 1, 0, 1,
-0.695851, 1.752598, -2.394229, 0.654902, 1, 0, 1,
-0.6923211, 2.697779, -1.629533, 0.6509804, 1, 0, 1,
-0.6869026, -0.9715933, -2.627648, 0.6431373, 1, 0, 1,
-0.6855382, -0.9885414, -3.511246, 0.6392157, 1, 0, 1,
-0.6851575, 2.050724, -1.787372, 0.6313726, 1, 0, 1,
-0.6843818, 0.5826347, -2.191772, 0.627451, 1, 0, 1,
-0.6836606, 0.4096932, 1.46785, 0.6196079, 1, 0, 1,
-0.6753184, 1.42793, -1.151562, 0.6156863, 1, 0, 1,
-0.6719505, -1.286546, -4.148472, 0.6078432, 1, 0, 1,
-0.6683558, -0.02392031, 0.212589, 0.6039216, 1, 0, 1,
-0.6675829, 0.1563693, -2.543854, 0.5960785, 1, 0, 1,
-0.6652784, 1.187502, -0.8059269, 0.5882353, 1, 0, 1,
-0.6547156, 0.8041242, -0.2467496, 0.5843138, 1, 0, 1,
-0.6527448, 0.7161607, -1.756963, 0.5764706, 1, 0, 1,
-0.6510029, 1.225578, 0.3814809, 0.572549, 1, 0, 1,
-0.6504787, 0.4769011, -0.5603436, 0.5647059, 1, 0, 1,
-0.6485806, 0.5356795, -0.4790476, 0.5607843, 1, 0, 1,
-0.6466998, -0.3680992, -2.364913, 0.5529412, 1, 0, 1,
-0.6452504, -1.921888, -4.434481, 0.5490196, 1, 0, 1,
-0.6421394, -0.4963551, -1.719855, 0.5411765, 1, 0, 1,
-0.6386311, 0.3569544, -1.545431, 0.5372549, 1, 0, 1,
-0.6373674, 0.7629535, -3.216055, 0.5294118, 1, 0, 1,
-0.6312731, 0.6795841, 0.522985, 0.5254902, 1, 0, 1,
-0.6308879, 0.6160036, -0.8477681, 0.5176471, 1, 0, 1,
-0.6246082, -0.9706925, -3.483647, 0.5137255, 1, 0, 1,
-0.6226429, -0.1247803, -1.709324, 0.5058824, 1, 0, 1,
-0.6183934, 2.318983, 0.577231, 0.5019608, 1, 0, 1,
-0.6163399, -1.52623, -1.538914, 0.4941176, 1, 0, 1,
-0.6112182, -0.6185717, -3.032001, 0.4862745, 1, 0, 1,
-0.6091494, -0.4044447, -2.05916, 0.4823529, 1, 0, 1,
-0.6044002, 2.197359, 0.2766862, 0.4745098, 1, 0, 1,
-0.6023079, -1.101303, -1.997485, 0.4705882, 1, 0, 1,
-0.5993273, 0.02324176, -2.188922, 0.4627451, 1, 0, 1,
-0.5985534, 0.00157663, -1.66021, 0.4588235, 1, 0, 1,
-0.5943376, 1.98572, 1.44348, 0.4509804, 1, 0, 1,
-0.5921424, 0.06052389, -0.2534377, 0.4470588, 1, 0, 1,
-0.5910981, -0.4195399, -3.152158, 0.4392157, 1, 0, 1,
-0.5890534, -1.146076, -2.80489, 0.4352941, 1, 0, 1,
-0.5852802, -0.4980683, 0.004272244, 0.427451, 1, 0, 1,
-0.576537, 0.9511596, -1.005439, 0.4235294, 1, 0, 1,
-0.5755309, -0.8662713, -1.610264, 0.4156863, 1, 0, 1,
-0.5753902, -0.7178342, -1.950629, 0.4117647, 1, 0, 1,
-0.5652855, 0.8850765, 0.4914343, 0.4039216, 1, 0, 1,
-0.5615883, -0.07140929, -2.283747, 0.3960784, 1, 0, 1,
-0.5586845, 0.6400455, -1.268981, 0.3921569, 1, 0, 1,
-0.5570192, -1.447518, -4.144036, 0.3843137, 1, 0, 1,
-0.5481085, 0.6630998, -0.1236675, 0.3803922, 1, 0, 1,
-0.5468206, 0.3908501, -0.2668705, 0.372549, 1, 0, 1,
-0.5424997, -0.397705, -1.340334, 0.3686275, 1, 0, 1,
-0.5336495, 1.32038, -1.754778, 0.3607843, 1, 0, 1,
-0.5336027, -0.02842801, -0.9550166, 0.3568628, 1, 0, 1,
-0.5325367, -1.944724, -3.181191, 0.3490196, 1, 0, 1,
-0.5319394, 0.7937858, 0.1212784, 0.345098, 1, 0, 1,
-0.5319015, -1.807156, -2.158381, 0.3372549, 1, 0, 1,
-0.5312673, -0.9991051, -2.125385, 0.3333333, 1, 0, 1,
-0.5288765, -0.01797801, -2.892166, 0.3254902, 1, 0, 1,
-0.528757, -0.610193, -4.293209, 0.3215686, 1, 0, 1,
-0.5239173, 1.060549, -2.588812, 0.3137255, 1, 0, 1,
-0.5137771, 0.005720856, -1.820835, 0.3098039, 1, 0, 1,
-0.5096732, -0.8096893, -0.7000293, 0.3019608, 1, 0, 1,
-0.5076804, -0.4007497, -3.502202, 0.2941177, 1, 0, 1,
-0.498629, 0.5184521, -1.256416, 0.2901961, 1, 0, 1,
-0.4968379, -0.4829492, -2.300232, 0.282353, 1, 0, 1,
-0.4950698, -0.8346685, -1.715904, 0.2784314, 1, 0, 1,
-0.4934308, 1.630626, -0.8962963, 0.2705882, 1, 0, 1,
-0.4890986, 0.1035489, -2.250771, 0.2666667, 1, 0, 1,
-0.487735, 0.2206812, -0.8814795, 0.2588235, 1, 0, 1,
-0.4823648, -0.6289408, -2.255464, 0.254902, 1, 0, 1,
-0.4805651, 1.005708, 0.1244105, 0.2470588, 1, 0, 1,
-0.4793128, 0.3375384, 0.5484031, 0.2431373, 1, 0, 1,
-0.4700081, -0.9445808, -1.341652, 0.2352941, 1, 0, 1,
-0.4698568, 0.2732584, -3.121118, 0.2313726, 1, 0, 1,
-0.4649476, 0.7855828, 0.4918186, 0.2235294, 1, 0, 1,
-0.4648466, 1.330352, 1.676527, 0.2196078, 1, 0, 1,
-0.4648372, 0.8543274, 0.09468001, 0.2117647, 1, 0, 1,
-0.46449, 1.384215, -1.035726, 0.2078431, 1, 0, 1,
-0.4617374, 1.60614, -0.7834272, 0.2, 1, 0, 1,
-0.4597343, 0.04707301, -2.369522, 0.1921569, 1, 0, 1,
-0.4576419, -0.4099267, -1.453445, 0.1882353, 1, 0, 1,
-0.4529289, -0.4237575, -3.089728, 0.1803922, 1, 0, 1,
-0.4500866, 0.4009401, -1.48196, 0.1764706, 1, 0, 1,
-0.449854, 0.5711245, 0.05489811, 0.1686275, 1, 0, 1,
-0.4469384, -1.261617, -1.234112, 0.1647059, 1, 0, 1,
-0.4462112, -0.6782506, -0.7212437, 0.1568628, 1, 0, 1,
-0.4412915, -0.9735824, -0.8552311, 0.1529412, 1, 0, 1,
-0.4380976, -0.8603222, -1.589994, 0.145098, 1, 0, 1,
-0.4375587, -0.926862, -1.795019, 0.1411765, 1, 0, 1,
-0.4374768, -0.6944407, -1.874189, 0.1333333, 1, 0, 1,
-0.4352479, -0.4474015, -1.456776, 0.1294118, 1, 0, 1,
-0.4321518, 0.2799523, -0.4402504, 0.1215686, 1, 0, 1,
-0.4283383, -1.001932, -1.744121, 0.1176471, 1, 0, 1,
-0.426677, 1.116473, -1.283885, 0.1098039, 1, 0, 1,
-0.4252346, -0.6492649, -3.105771, 0.1058824, 1, 0, 1,
-0.4237198, -0.4511624, -2.449749, 0.09803922, 1, 0, 1,
-0.4223033, -0.07104537, -1.670269, 0.09019608, 1, 0, 1,
-0.4194267, 0.6945534, -0.7353733, 0.08627451, 1, 0, 1,
-0.4161385, -0.4265302, -2.279071, 0.07843138, 1, 0, 1,
-0.4144002, -0.6904176, -3.334396, 0.07450981, 1, 0, 1,
-0.4107243, 0.8005025, -1.659989, 0.06666667, 1, 0, 1,
-0.4057325, 2.841849, -2.894297, 0.0627451, 1, 0, 1,
-0.3967994, -0.4160798, -2.212606, 0.05490196, 1, 0, 1,
-0.3923204, -0.3447055, -3.944453, 0.05098039, 1, 0, 1,
-0.3828768, 1.317956, -0.9930882, 0.04313726, 1, 0, 1,
-0.3808737, -1.313683, -2.937452, 0.03921569, 1, 0, 1,
-0.379046, 1.539317, -2.253366, 0.03137255, 1, 0, 1,
-0.3768761, 1.476411, 0.938461, 0.02745098, 1, 0, 1,
-0.3750349, 0.3216041, -0.9712746, 0.01960784, 1, 0, 1,
-0.3731969, -0.9346414, -4.387947, 0.01568628, 1, 0, 1,
-0.3680373, -1.005605, -2.9927, 0.007843138, 1, 0, 1,
-0.3668534, -0.3092415, -1.711433, 0.003921569, 1, 0, 1,
-0.3651394, -0.7783125, -2.671965, 0, 1, 0.003921569, 1,
-0.3639141, -0.1043985, -2.274736, 0, 1, 0.01176471, 1,
-0.3556352, 0.2225717, -2.104417, 0, 1, 0.01568628, 1,
-0.3556044, -1.306767, -3.859278, 0, 1, 0.02352941, 1,
-0.3481122, -0.6667899, -2.688256, 0, 1, 0.02745098, 1,
-0.3470171, 0.02460698, -2.100214, 0, 1, 0.03529412, 1,
-0.3430216, 0.7950442, -0.7305955, 0, 1, 0.03921569, 1,
-0.3427262, -0.6550769, -3.44745, 0, 1, 0.04705882, 1,
-0.3412718, 0.5067806, -0.7876714, 0, 1, 0.05098039, 1,
-0.3358276, -0.113367, -1.969021, 0, 1, 0.05882353, 1,
-0.3342001, 0.6946892, -1.104201, 0, 1, 0.0627451, 1,
-0.3334433, 0.5314083, -1.966976, 0, 1, 0.07058824, 1,
-0.3278663, -1.817798, -2.312048, 0, 1, 0.07450981, 1,
-0.3269528, -0.6838754, -0.6590044, 0, 1, 0.08235294, 1,
-0.3184677, -0.3990376, -2.866958, 0, 1, 0.08627451, 1,
-0.3183963, 0.0482546, -1.211523, 0, 1, 0.09411765, 1,
-0.3182521, -1.200249, -4.860299, 0, 1, 0.1019608, 1,
-0.3141853, -0.5474834, -2.911591, 0, 1, 0.1058824, 1,
-0.3141219, -1.602581, -2.807978, 0, 1, 0.1137255, 1,
-0.3101604, -2.511679, -4.437901, 0, 1, 0.1176471, 1,
-0.3077615, -3.484994, -3.542591, 0, 1, 0.1254902, 1,
-0.3044143, -1.682141, -2.222616, 0, 1, 0.1294118, 1,
-0.3041054, -0.3555343, -1.310761, 0, 1, 0.1372549, 1,
-0.3022867, -1.131108, -3.656837, 0, 1, 0.1411765, 1,
-0.2981089, -1.012233, -2.67696, 0, 1, 0.1490196, 1,
-0.2924791, -1.02778, -3.654253, 0, 1, 0.1529412, 1,
-0.2922122, 0.3703337, -0.2673064, 0, 1, 0.1607843, 1,
-0.2904703, -0.6099574, -2.749903, 0, 1, 0.1647059, 1,
-0.2892845, 0.1146529, -1.513571, 0, 1, 0.172549, 1,
-0.2888844, -0.9066298, -3.92276, 0, 1, 0.1764706, 1,
-0.2789092, -0.5940391, -2.671254, 0, 1, 0.1843137, 1,
-0.2747487, -1.085756, -3.549729, 0, 1, 0.1882353, 1,
-0.2738673, 0.6946991, -1.971617, 0, 1, 0.1960784, 1,
-0.2733184, 1.115192, -0.9813094, 0, 1, 0.2039216, 1,
-0.2673225, -0.3812527, -1.882526, 0, 1, 0.2078431, 1,
-0.2665721, -0.2059045, -3.831709, 0, 1, 0.2156863, 1,
-0.2636677, 0.03625172, -1.744382, 0, 1, 0.2196078, 1,
-0.2629811, 0.1044583, -0.1765944, 0, 1, 0.227451, 1,
-0.2605476, -1.947536, -3.902457, 0, 1, 0.2313726, 1,
-0.2574123, -0.05276337, -3.241443, 0, 1, 0.2392157, 1,
-0.2571332, 0.5874658, -0.9558044, 0, 1, 0.2431373, 1,
-0.2563271, -0.9304611, -3.049304, 0, 1, 0.2509804, 1,
-0.2561164, 1.970868, 0.619114, 0, 1, 0.254902, 1,
-0.251152, -0.5144097, -2.484068, 0, 1, 0.2627451, 1,
-0.2484769, -0.3497765, -1.878504, 0, 1, 0.2666667, 1,
-0.2441311, 1.535217, -0.3351122, 0, 1, 0.2745098, 1,
-0.2422862, 0.6477804, -1.720569, 0, 1, 0.2784314, 1,
-0.2411524, -0.1784999, -2.864317, 0, 1, 0.2862745, 1,
-0.2373236, -2.160815, -2.864898, 0, 1, 0.2901961, 1,
-0.236481, 0.5725573, 1.492401, 0, 1, 0.2980392, 1,
-0.230903, 0.5829371, -0.5853286, 0, 1, 0.3058824, 1,
-0.2292435, 0.2728421, -0.7228521, 0, 1, 0.3098039, 1,
-0.2279958, 0.3371699, -0.5151983, 0, 1, 0.3176471, 1,
-0.2228732, -0.134998, -1.594498, 0, 1, 0.3215686, 1,
-0.2203663, -0.4428076, -1.880205, 0, 1, 0.3294118, 1,
-0.2177526, -0.2230874, -2.515062, 0, 1, 0.3333333, 1,
-0.2162776, -0.5492133, -4.954382, 0, 1, 0.3411765, 1,
-0.2113211, -0.4556833, -1.762856, 0, 1, 0.345098, 1,
-0.2108967, -0.6362013, -2.720786, 0, 1, 0.3529412, 1,
-0.2103901, -0.7504116, -2.227844, 0, 1, 0.3568628, 1,
-0.2093142, 0.824541, -0.1421815, 0, 1, 0.3647059, 1,
-0.2089173, -0.567737, -1.412371, 0, 1, 0.3686275, 1,
-0.2069801, 0.8529423, 0.52159, 0, 1, 0.3764706, 1,
-0.2047114, -0.8894799, -1.00517, 0, 1, 0.3803922, 1,
-0.2039371, -1.175135, -2.551068, 0, 1, 0.3882353, 1,
-0.2035174, 1.391795, 1.309077, 0, 1, 0.3921569, 1,
-0.2018549, -1.477289, -3.631083, 0, 1, 0.4, 1,
-0.2008701, -0.1054479, -2.070364, 0, 1, 0.4078431, 1,
-0.1990561, -0.4900022, -4.638528, 0, 1, 0.4117647, 1,
-0.1990124, -0.1556469, -1.917293, 0, 1, 0.4196078, 1,
-0.1970639, 0.4617814, -1.247695, 0, 1, 0.4235294, 1,
-0.193704, 0.9850498, -0.5755264, 0, 1, 0.4313726, 1,
-0.1888504, 0.06679267, -0.2590135, 0, 1, 0.4352941, 1,
-0.1878141, -1.036363, -3.328054, 0, 1, 0.4431373, 1,
-0.1862367, -1.701995, -3.078639, 0, 1, 0.4470588, 1,
-0.1844107, -0.7415005, -2.275235, 0, 1, 0.454902, 1,
-0.1804318, -2.016531, -3.243861, 0, 1, 0.4588235, 1,
-0.1740968, 1.474998, -0.5283443, 0, 1, 0.4666667, 1,
-0.1683811, 0.6176476, 0.4982879, 0, 1, 0.4705882, 1,
-0.1669373, -0.7842208, -2.014817, 0, 1, 0.4784314, 1,
-0.1665674, -0.1653436, -3.564262, 0, 1, 0.4823529, 1,
-0.1640397, 0.7341215, -1.054684, 0, 1, 0.4901961, 1,
-0.1638859, -0.9520556, -4.063994, 0, 1, 0.4941176, 1,
-0.1627979, -0.02010551, -2.653356, 0, 1, 0.5019608, 1,
-0.1619934, -0.843739, -2.997075, 0, 1, 0.509804, 1,
-0.1557318, -0.7306108, -3.230834, 0, 1, 0.5137255, 1,
-0.1523293, 1.069491, 0.3277652, 0, 1, 0.5215687, 1,
-0.1513198, 2.355046, -0.5058809, 0, 1, 0.5254902, 1,
-0.150998, -1.593104, -4.207486, 0, 1, 0.5333334, 1,
-0.1460923, 0.3380069, -2.036688, 0, 1, 0.5372549, 1,
-0.14223, -1.029663, -4.495018, 0, 1, 0.5450981, 1,
-0.1419887, -0.5266649, -4.130431, 0, 1, 0.5490196, 1,
-0.1407983, 2.068053, 0.7184478, 0, 1, 0.5568628, 1,
-0.1396678, 0.2687355, -0.7745176, 0, 1, 0.5607843, 1,
-0.1387415, 1.055154, -1.512747, 0, 1, 0.5686275, 1,
-0.1387127, -2.28889, -3.467523, 0, 1, 0.572549, 1,
-0.1355438, -1.089406, -2.767854, 0, 1, 0.5803922, 1,
-0.1317215, -0.9890167, -0.6409758, 0, 1, 0.5843138, 1,
-0.1273352, 0.03620829, -2.21262, 0, 1, 0.5921569, 1,
-0.1267714, -1.886283, -2.897776, 0, 1, 0.5960785, 1,
-0.1265066, -0.1460248, -2.477124, 0, 1, 0.6039216, 1,
-0.1193876, -0.5345495, -3.247857, 0, 1, 0.6117647, 1,
-0.1192039, 0.9521235, 1.533095, 0, 1, 0.6156863, 1,
-0.1179498, -0.6736187, -1.803038, 0, 1, 0.6235294, 1,
-0.1150689, 0.3853522, 0.572223, 0, 1, 0.627451, 1,
-0.1105041, -0.08960345, -2.567453, 0, 1, 0.6352941, 1,
-0.1073794, 0.06087502, -1.31165, 0, 1, 0.6392157, 1,
-0.1070041, -1.268993, -2.893229, 0, 1, 0.6470588, 1,
-0.103856, -0.7721517, -3.3675, 0, 1, 0.6509804, 1,
-0.1025137, -0.1161155, -1.58489, 0, 1, 0.6588235, 1,
-0.1010566, 0.0630531, -1.917719, 0, 1, 0.6627451, 1,
-0.09744927, 0.8842782, 0.6999751, 0, 1, 0.6705883, 1,
-0.09528538, -1.478116, -3.426107, 0, 1, 0.6745098, 1,
-0.09245049, 0.7888963, 0.674573, 0, 1, 0.682353, 1,
-0.08412614, -0.1407555, -1.49621, 0, 1, 0.6862745, 1,
-0.08284626, 1.040238, -0.353146, 0, 1, 0.6941177, 1,
-0.08254047, -0.2211847, -3.048329, 0, 1, 0.7019608, 1,
-0.07846226, -1.243419, -3.260071, 0, 1, 0.7058824, 1,
-0.07750935, 1.052894, 0.8260283, 0, 1, 0.7137255, 1,
-0.07607123, 1.751623, -0.1403733, 0, 1, 0.7176471, 1,
-0.07557989, -0.8229733, -4.583957, 0, 1, 0.7254902, 1,
-0.07507063, -1.213454, -2.376364, 0, 1, 0.7294118, 1,
-0.07399145, 0.519425, -0.3279912, 0, 1, 0.7372549, 1,
-0.07014527, -0.7085369, -4.073578, 0, 1, 0.7411765, 1,
-0.0678445, 1.438975, -0.2136138, 0, 1, 0.7490196, 1,
-0.06432658, 2.269287, -0.1905594, 0, 1, 0.7529412, 1,
-0.06144556, 0.09002358, -0.05890198, 0, 1, 0.7607843, 1,
-0.06075932, 2.319733, -0.7049505, 0, 1, 0.7647059, 1,
-0.05752533, 0.7116452, -0.3405057, 0, 1, 0.772549, 1,
-0.04891813, -0.9454169, -3.34943, 0, 1, 0.7764706, 1,
-0.04637559, -0.4603076, -0.4341263, 0, 1, 0.7843137, 1,
-0.04490537, 0.6294112, -0.4448295, 0, 1, 0.7882353, 1,
-0.04400087, 0.7313306, 1.675424, 0, 1, 0.7960784, 1,
-0.04360984, -0.8972402, -3.55333, 0, 1, 0.8039216, 1,
-0.04146696, 0.7370951, -0.40727, 0, 1, 0.8078431, 1,
-0.03771289, 0.9453964, 0.002607742, 0, 1, 0.8156863, 1,
-0.03378262, -0.3117854, -2.653115, 0, 1, 0.8196079, 1,
-0.03161036, -1.404729, -3.498806, 0, 1, 0.827451, 1,
-0.03066293, -1.608364, -3.751246, 0, 1, 0.8313726, 1,
-0.02732236, 2.653004, -1.502227, 0, 1, 0.8392157, 1,
-0.02616108, -0.2417215, -3.973883, 0, 1, 0.8431373, 1,
-0.02505119, -0.420993, -2.921259, 0, 1, 0.8509804, 1,
-0.02434881, -0.04568819, -1.152048, 0, 1, 0.854902, 1,
-0.01978027, 1.183852, -0.3269634, 0, 1, 0.8627451, 1,
-0.01689287, -0.7111149, -1.494859, 0, 1, 0.8666667, 1,
-0.01588755, -0.9830782, -5.180976, 0, 1, 0.8745098, 1,
-0.01586061, 0.7233952, -0.3401805, 0, 1, 0.8784314, 1,
-0.008116186, 0.1293555, 2.079833, 0, 1, 0.8862745, 1,
-0.005540344, -2.283698, -3.350058, 0, 1, 0.8901961, 1,
-0.004136558, -1.004957, -1.872598, 0, 1, 0.8980392, 1,
-0.002425592, -1.113576, -3.247514, 0, 1, 0.9058824, 1,
-0.0004956935, 0.2537526, -0.65849, 0, 1, 0.9098039, 1,
0.001430789, 0.5430626, -0.7323441, 0, 1, 0.9176471, 1,
0.00705306, -0.6298189, 3.858719, 0, 1, 0.9215686, 1,
0.01034705, 0.1925806, -1.205143, 0, 1, 0.9294118, 1,
0.01242103, 0.6673135, 1.067405, 0, 1, 0.9333333, 1,
0.01243979, -0.5336888, 3.448579, 0, 1, 0.9411765, 1,
0.0128965, 0.2036704, 1.692693, 0, 1, 0.945098, 1,
0.014962, 1.615045, 1.717141, 0, 1, 0.9529412, 1,
0.01788959, 0.6668399, -0.190096, 0, 1, 0.9568627, 1,
0.01930813, -0.08093602, 3.108387, 0, 1, 0.9647059, 1,
0.02344347, -0.5855024, 2.821805, 0, 1, 0.9686275, 1,
0.02382396, -1.543267, 3.291078, 0, 1, 0.9764706, 1,
0.03189375, 1.819654, 0.8758923, 0, 1, 0.9803922, 1,
0.03237132, -1.391735, 3.920129, 0, 1, 0.9882353, 1,
0.03407618, 1.314003, 0.4957894, 0, 1, 0.9921569, 1,
0.03586276, -1.006459, 3.330221, 0, 1, 1, 1,
0.03731319, -1.820184, 3.921549, 0, 0.9921569, 1, 1,
0.03759534, 0.212291, -0.5592901, 0, 0.9882353, 1, 1,
0.0397683, 0.1848761, -0.9410768, 0, 0.9803922, 1, 1,
0.04419591, 0.9075662, -0.0793375, 0, 0.9764706, 1, 1,
0.04711498, 0.6171948, -0.1027959, 0, 0.9686275, 1, 1,
0.04777627, 1.473199, 1.575451, 0, 0.9647059, 1, 1,
0.05190726, 0.5213314, 1.044387, 0, 0.9568627, 1, 1,
0.06085584, -0.1570495, 4.511907, 0, 0.9529412, 1, 1,
0.06185817, -0.481448, 2.399667, 0, 0.945098, 1, 1,
0.06252725, 1.152513, -0.2261078, 0, 0.9411765, 1, 1,
0.06286016, 0.2434153, 0.559918, 0, 0.9333333, 1, 1,
0.06570408, 1.253879, -0.6495165, 0, 0.9294118, 1, 1,
0.06585039, 0.3630114, 0.766849, 0, 0.9215686, 1, 1,
0.06795464, -1.057346, 2.620381, 0, 0.9176471, 1, 1,
0.07294661, 0.4813826, -0.4965727, 0, 0.9098039, 1, 1,
0.07700161, -0.4488679, 2.488507, 0, 0.9058824, 1, 1,
0.08688986, -1.420087, 4.022959, 0, 0.8980392, 1, 1,
0.0871156, -1.079236, 3.355217, 0, 0.8901961, 1, 1,
0.08822966, -1.024259, 3.509238, 0, 0.8862745, 1, 1,
0.09053311, -0.05058855, 1.936767, 0, 0.8784314, 1, 1,
0.0954247, 0.8872585, -0.2068924, 0, 0.8745098, 1, 1,
0.09576017, 0.01391728, 1.301239, 0, 0.8666667, 1, 1,
0.09890991, 0.1500835, 1.944692, 0, 0.8627451, 1, 1,
0.09992903, -1.838963, 1.054157, 0, 0.854902, 1, 1,
0.1022826, -1.873156, 3.014016, 0, 0.8509804, 1, 1,
0.1037783, -1.17857, 3.25284, 0, 0.8431373, 1, 1,
0.1044529, -0.04860603, 0.2810836, 0, 0.8392157, 1, 1,
0.1055588, 1.124512, -0.1960238, 0, 0.8313726, 1, 1,
0.1078964, -0.4329665, 3.330362, 0, 0.827451, 1, 1,
0.1084594, 0.002888246, 0.9974221, 0, 0.8196079, 1, 1,
0.1119695, -0.6973966, 3.41854, 0, 0.8156863, 1, 1,
0.1133794, 1.923135, -0.7943738, 0, 0.8078431, 1, 1,
0.1145552, -0.3864183, 2.904696, 0, 0.8039216, 1, 1,
0.1169481, -1.184305, 3.752227, 0, 0.7960784, 1, 1,
0.1177745, -1.202589, 3.170106, 0, 0.7882353, 1, 1,
0.1189643, 1.542255, -0.06127971, 0, 0.7843137, 1, 1,
0.1235425, -0.6777932, 3.996203, 0, 0.7764706, 1, 1,
0.123842, -0.3602053, 2.485857, 0, 0.772549, 1, 1,
0.1250646, -0.414923, 2.069768, 0, 0.7647059, 1, 1,
0.1251173, -1.057811, 2.7793, 0, 0.7607843, 1, 1,
0.1252434, 0.07979688, 1.965816, 0, 0.7529412, 1, 1,
0.1269254, 1.382656, 0.3854776, 0, 0.7490196, 1, 1,
0.1270846, 0.9489243, -1.553643, 0, 0.7411765, 1, 1,
0.1276096, -0.2170669, 0.9398993, 0, 0.7372549, 1, 1,
0.1276775, 0.700908, 0.2310101, 0, 0.7294118, 1, 1,
0.1300492, 1.109566, -0.6913075, 0, 0.7254902, 1, 1,
0.1305134, -0.935366, 3.51479, 0, 0.7176471, 1, 1,
0.1314042, -0.4136279, 1.965688, 0, 0.7137255, 1, 1,
0.1331817, -1.418764, 4.199495, 0, 0.7058824, 1, 1,
0.1337404, -0.7957176, 1.482877, 0, 0.6980392, 1, 1,
0.1338148, -0.07343066, 0.3336017, 0, 0.6941177, 1, 1,
0.1352809, -0.7233249, 2.474376, 0, 0.6862745, 1, 1,
0.136714, -0.2449745, 2.541723, 0, 0.682353, 1, 1,
0.140413, 0.7354504, -0.02853123, 0, 0.6745098, 1, 1,
0.1413053, 0.2800586, 0.7341635, 0, 0.6705883, 1, 1,
0.1576792, -1.440728, 5.578056, 0, 0.6627451, 1, 1,
0.1598018, 0.05256587, -0.02810455, 0, 0.6588235, 1, 1,
0.1609367, 0.2019989, 1.392659, 0, 0.6509804, 1, 1,
0.1636076, -0.5909668, 2.911539, 0, 0.6470588, 1, 1,
0.1665895, 1.040489, 1.360118, 0, 0.6392157, 1, 1,
0.1680373, -0.9504249, 3.265465, 0, 0.6352941, 1, 1,
0.1708057, -0.1835311, 4.953744, 0, 0.627451, 1, 1,
0.1728493, 2.713717, -1.315217, 0, 0.6235294, 1, 1,
0.1759137, 0.04254666, 2.997989, 0, 0.6156863, 1, 1,
0.1800644, 1.010254, -0.07363982, 0, 0.6117647, 1, 1,
0.1802027, -1.404939, 2.563453, 0, 0.6039216, 1, 1,
0.182526, 0.2134279, 0.5258992, 0, 0.5960785, 1, 1,
0.1875493, 1.507886, 0.4815299, 0, 0.5921569, 1, 1,
0.1890695, 0.3880616, 0.3836155, 0, 0.5843138, 1, 1,
0.1897081, -0.01757165, 2.13072, 0, 0.5803922, 1, 1,
0.19489, 1.652492, 0.2322669, 0, 0.572549, 1, 1,
0.1992462, -0.267746, 2.598948, 0, 0.5686275, 1, 1,
0.199322, 1.910053, -0.2981051, 0, 0.5607843, 1, 1,
0.2001045, -0.6644924, 3.465063, 0, 0.5568628, 1, 1,
0.2007615, 1.09338, 0.9389595, 0, 0.5490196, 1, 1,
0.2016016, 0.8501673, -0.1641154, 0, 0.5450981, 1, 1,
0.2029416, -0.2639354, 1.676634, 0, 0.5372549, 1, 1,
0.2092132, 0.8359576, 0.7905088, 0, 0.5333334, 1, 1,
0.2161297, -0.009790272, 2.541081, 0, 0.5254902, 1, 1,
0.2164314, 1.14402, 1.470329, 0, 0.5215687, 1, 1,
0.2170021, 1.359733, -0.6996018, 0, 0.5137255, 1, 1,
0.2197922, -0.3597139, 2.995561, 0, 0.509804, 1, 1,
0.2206994, -0.7805783, 2.556807, 0, 0.5019608, 1, 1,
0.2209072, -0.467951, 2.835047, 0, 0.4941176, 1, 1,
0.2234081, 1.500593, 0.09745549, 0, 0.4901961, 1, 1,
0.2238015, -1.000624, 4.536463, 0, 0.4823529, 1, 1,
0.2254115, 1.92995, 1.305956, 0, 0.4784314, 1, 1,
0.2308462, -1.542461, 3.853494, 0, 0.4705882, 1, 1,
0.2321687, -1.843554, 4.08285, 0, 0.4666667, 1, 1,
0.2366211, -0.690159, 1.444208, 0, 0.4588235, 1, 1,
0.239472, 0.5090108, 1.187032, 0, 0.454902, 1, 1,
0.2457792, -0.4943951, 2.483047, 0, 0.4470588, 1, 1,
0.2512619, 0.02419157, 2.264884, 0, 0.4431373, 1, 1,
0.2535466, 0.5950695, 1.991713, 0, 0.4352941, 1, 1,
0.2552908, -0.8011957, 1.445281, 0, 0.4313726, 1, 1,
0.2569756, -0.8627008, 2.902629, 0, 0.4235294, 1, 1,
0.258514, 0.8143753, -1.205431, 0, 0.4196078, 1, 1,
0.2594855, -0.4011008, 2.669736, 0, 0.4117647, 1, 1,
0.2616476, 2.401179, 0.3861288, 0, 0.4078431, 1, 1,
0.2636682, 1.014642, 2.215046, 0, 0.4, 1, 1,
0.2656829, 0.3852818, 0.01806814, 0, 0.3921569, 1, 1,
0.2707766, -0.2041163, 2.36272, 0, 0.3882353, 1, 1,
0.2711135, -1.713993, 2.833497, 0, 0.3803922, 1, 1,
0.2721802, -0.594274, 4.484904, 0, 0.3764706, 1, 1,
0.2772418, 0.3791298, -0.8833604, 0, 0.3686275, 1, 1,
0.2788207, -1.385182, 2.377336, 0, 0.3647059, 1, 1,
0.280776, 0.2694463, 2.08178, 0, 0.3568628, 1, 1,
0.2857142, 0.7414238, 0.7267401, 0, 0.3529412, 1, 1,
0.2883731, 0.8940772, 1.143486, 0, 0.345098, 1, 1,
0.2885806, -0.2704705, 2.606966, 0, 0.3411765, 1, 1,
0.298488, 0.05340665, 1.969883, 0, 0.3333333, 1, 1,
0.3028578, -0.01408672, 2.214558, 0, 0.3294118, 1, 1,
0.3047585, -0.08072513, 4.060308, 0, 0.3215686, 1, 1,
0.308202, -0.1310748, 2.115118, 0, 0.3176471, 1, 1,
0.3128856, -0.7319358, 4.837624, 0, 0.3098039, 1, 1,
0.3174239, -0.3779717, 1.669245, 0, 0.3058824, 1, 1,
0.328452, -0.09494818, 2.764576, 0, 0.2980392, 1, 1,
0.3294351, 0.4946037, 0.0842789, 0, 0.2901961, 1, 1,
0.336536, 1.047897, -0.2408102, 0, 0.2862745, 1, 1,
0.3435757, 0.8516249, 1.156199, 0, 0.2784314, 1, 1,
0.3446607, 0.2269445, 0.6564094, 0, 0.2745098, 1, 1,
0.3462114, 0.5301863, 2.069291, 0, 0.2666667, 1, 1,
0.3472079, 1.409836, 0.3067689, 0, 0.2627451, 1, 1,
0.3490552, 0.5230399, 1.50756, 0, 0.254902, 1, 1,
0.3492728, 1.216709, 0.2927904, 0, 0.2509804, 1, 1,
0.3501233, -0.4862148, 3.087998, 0, 0.2431373, 1, 1,
0.3514347, 1.128633, 1.766116, 0, 0.2392157, 1, 1,
0.3559952, -0.5527861, 0.4094849, 0, 0.2313726, 1, 1,
0.3615845, -0.7948232, 1.889028, 0, 0.227451, 1, 1,
0.3654724, 2.797037, 1.169635, 0, 0.2196078, 1, 1,
0.3683424, 0.06485592, 1.633364, 0, 0.2156863, 1, 1,
0.3694538, -0.9167387, 1.928409, 0, 0.2078431, 1, 1,
0.3697286, -0.6219273, 3.141572, 0, 0.2039216, 1, 1,
0.371911, -1.881786, 2.713665, 0, 0.1960784, 1, 1,
0.3756444, 0.5839845, -0.05536576, 0, 0.1882353, 1, 1,
0.3796652, -0.399463, 2.202381, 0, 0.1843137, 1, 1,
0.3800583, -1.455339, 4.43653, 0, 0.1764706, 1, 1,
0.383105, 1.373991, 1.072754, 0, 0.172549, 1, 1,
0.3867287, 0.2560171, -0.4906669, 0, 0.1647059, 1, 1,
0.3882037, -3.257454, 3.407917, 0, 0.1607843, 1, 1,
0.3889013, -1.056014, 3.641825, 0, 0.1529412, 1, 1,
0.3944786, -0.5945594, 4.529813, 0, 0.1490196, 1, 1,
0.3951998, -0.06583789, 3.52635, 0, 0.1411765, 1, 1,
0.3952276, 0.578373, -0.6401893, 0, 0.1372549, 1, 1,
0.4018239, -1.232773, 2.282201, 0, 0.1294118, 1, 1,
0.4125947, -0.7680473, 2.800373, 0, 0.1254902, 1, 1,
0.4196739, -1.360957, 3.830035, 0, 0.1176471, 1, 1,
0.4218096, 0.2528117, 0.3548053, 0, 0.1137255, 1, 1,
0.4240847, -1.734394, 2.405332, 0, 0.1058824, 1, 1,
0.4260235, -0.1693737, 2.055419, 0, 0.09803922, 1, 1,
0.4327253, 0.6431717, 0.8400658, 0, 0.09411765, 1, 1,
0.4332404, 0.3465297, 1.664637, 0, 0.08627451, 1, 1,
0.4350092, -1.108384, 3.825432, 0, 0.08235294, 1, 1,
0.4351282, 0.2261301, 0.8687904, 0, 0.07450981, 1, 1,
0.4380318, 0.1710165, 1.899722, 0, 0.07058824, 1, 1,
0.4393556, 0.8762697, 1.913032, 0, 0.0627451, 1, 1,
0.4426615, 1.042071, 0.2325834, 0, 0.05882353, 1, 1,
0.444481, 0.8462271, 1.518586, 0, 0.05098039, 1, 1,
0.4445764, 1.630432, -1.102099, 0, 0.04705882, 1, 1,
0.444859, 0.06741249, 1.055939, 0, 0.03921569, 1, 1,
0.4485932, -0.1228261, 2.483948, 0, 0.03529412, 1, 1,
0.449906, 0.300752, 1.22903, 0, 0.02745098, 1, 1,
0.4513586, 0.5695873, 1.241927, 0, 0.02352941, 1, 1,
0.4534028, -0.583059, 0.8862797, 0, 0.01568628, 1, 1,
0.4558167, 0.06354138, 2.913921, 0, 0.01176471, 1, 1,
0.4563321, -0.06910418, 1.205324, 0, 0.003921569, 1, 1,
0.46061, 1.524545, 0.2059384, 0.003921569, 0, 1, 1,
0.4619851, -0.6867038, 1.605217, 0.007843138, 0, 1, 1,
0.4628291, -2.299424, 3.539848, 0.01568628, 0, 1, 1,
0.4632927, -1.051515, 3.491671, 0.01960784, 0, 1, 1,
0.4640034, 0.2201555, 0.3952972, 0.02745098, 0, 1, 1,
0.4648333, -1.182048, 2.729917, 0.03137255, 0, 1, 1,
0.4678616, -0.2743596, 2.780988, 0.03921569, 0, 1, 1,
0.4695643, -0.3856847, 2.003344, 0.04313726, 0, 1, 1,
0.4718304, -0.5069023, 4.28362, 0.05098039, 0, 1, 1,
0.4721883, 0.3966462, 0.6938064, 0.05490196, 0, 1, 1,
0.4836306, -0.1934834, 3.390247, 0.0627451, 0, 1, 1,
0.4868327, 0.8388157, 1.244807, 0.06666667, 0, 1, 1,
0.4880563, 0.8507561, 1.600594, 0.07450981, 0, 1, 1,
0.4908323, -1.12193, 5.361702, 0.07843138, 0, 1, 1,
0.4959745, -1.462043, 2.991342, 0.08627451, 0, 1, 1,
0.4991306, -1.181272, 4.206371, 0.09019608, 0, 1, 1,
0.5021046, -0.9728632, 2.302261, 0.09803922, 0, 1, 1,
0.5022732, -0.1353129, 1.478714, 0.1058824, 0, 1, 1,
0.5025657, 0.3810202, 2.708225, 0.1098039, 0, 1, 1,
0.5079677, -1.025924, 2.754464, 0.1176471, 0, 1, 1,
0.5084378, -0.3851612, 1.226859, 0.1215686, 0, 1, 1,
0.5098305, -0.5107212, 2.631136, 0.1294118, 0, 1, 1,
0.5100908, -0.6465954, 1.379563, 0.1333333, 0, 1, 1,
0.510953, -0.4841909, 2.746811, 0.1411765, 0, 1, 1,
0.5208675, 1.114439, 0.9260679, 0.145098, 0, 1, 1,
0.5214591, -1.796039, 3.285517, 0.1529412, 0, 1, 1,
0.5260279, 0.4074691, 1.197601, 0.1568628, 0, 1, 1,
0.5266508, 0.8591405, -1.191375, 0.1647059, 0, 1, 1,
0.5271213, 0.4485444, 0.7440391, 0.1686275, 0, 1, 1,
0.531447, 0.07367179, 2.560862, 0.1764706, 0, 1, 1,
0.532193, 0.4354756, -0.1348972, 0.1803922, 0, 1, 1,
0.5325996, -0.5865342, 2.626464, 0.1882353, 0, 1, 1,
0.542615, -1.980227, 2.286278, 0.1921569, 0, 1, 1,
0.5439815, -0.2021872, 0.8194946, 0.2, 0, 1, 1,
0.54514, -0.8392137, 2.280868, 0.2078431, 0, 1, 1,
0.5518727, -0.6774368, 2.047141, 0.2117647, 0, 1, 1,
0.5621932, 0.8145678, 2.254948, 0.2196078, 0, 1, 1,
0.5650874, -0.6647764, 0.9782426, 0.2235294, 0, 1, 1,
0.5651134, 1.058024, 1.661573, 0.2313726, 0, 1, 1,
0.5662304, 1.554494, 1.274036, 0.2352941, 0, 1, 1,
0.5722805, -0.03544608, 2.27925, 0.2431373, 0, 1, 1,
0.5737942, -0.2800106, 1.590904, 0.2470588, 0, 1, 1,
0.5770129, -0.05477796, 2.312695, 0.254902, 0, 1, 1,
0.5809546, 1.673602, 0.9272947, 0.2588235, 0, 1, 1,
0.5868586, 1.264678, 1.701963, 0.2666667, 0, 1, 1,
0.5895694, -0.2771146, 2.209616, 0.2705882, 0, 1, 1,
0.5913403, 2.29443, -0.3165782, 0.2784314, 0, 1, 1,
0.5919523, 0.4621568, -0.8747253, 0.282353, 0, 1, 1,
0.5950676, -0.04443354, 2.682643, 0.2901961, 0, 1, 1,
0.6010226, 3.45766, -0.1679216, 0.2941177, 0, 1, 1,
0.6016545, -0.6497058, 2.265194, 0.3019608, 0, 1, 1,
0.6021631, 0.4872237, 2.220422, 0.3098039, 0, 1, 1,
0.6062822, -0.2600201, 1.191326, 0.3137255, 0, 1, 1,
0.6192366, 0.1198799, 2.620937, 0.3215686, 0, 1, 1,
0.6218367, -1.941207, 4.621766, 0.3254902, 0, 1, 1,
0.625536, 1.561688, -0.8207415, 0.3333333, 0, 1, 1,
0.629733, 1.173482, 0.7691997, 0.3372549, 0, 1, 1,
0.6351591, 1.566856, 0.7077929, 0.345098, 0, 1, 1,
0.6366447, -0.4741451, 1.418293, 0.3490196, 0, 1, 1,
0.6390404, 1.104021, 1.053474, 0.3568628, 0, 1, 1,
0.6441746, -0.2361606, 0.7436676, 0.3607843, 0, 1, 1,
0.6480529, -1.72472, 3.622583, 0.3686275, 0, 1, 1,
0.6510293, 0.4140421, -0.2588748, 0.372549, 0, 1, 1,
0.6539678, -0.1744459, 0.9898362, 0.3803922, 0, 1, 1,
0.6652093, -0.7996969, 2.375683, 0.3843137, 0, 1, 1,
0.6692639, 0.5321531, -0.1037123, 0.3921569, 0, 1, 1,
0.6712401, -0.02048063, 2.391985, 0.3960784, 0, 1, 1,
0.6732899, -0.7626982, 0.5920581, 0.4039216, 0, 1, 1,
0.6806147, 0.7633148, 0.09121196, 0.4117647, 0, 1, 1,
0.6838815, 1.38497, 1.227483, 0.4156863, 0, 1, 1,
0.6839591, -0.298376, 2.712385, 0.4235294, 0, 1, 1,
0.6861343, -1.219548, 2.17989, 0.427451, 0, 1, 1,
0.6902559, -1.604639, 2.201696, 0.4352941, 0, 1, 1,
0.6941235, -0.658514, 3.111087, 0.4392157, 0, 1, 1,
0.6941488, 1.477227, 1.902227, 0.4470588, 0, 1, 1,
0.7038338, 0.6652694, 0.9850442, 0.4509804, 0, 1, 1,
0.7078191, -1.542012, 2.399952, 0.4588235, 0, 1, 1,
0.7134176, 0.01248919, 1.887868, 0.4627451, 0, 1, 1,
0.7142008, -2.453798, 3.712984, 0.4705882, 0, 1, 1,
0.7259227, 1.613342, -0.9963264, 0.4745098, 0, 1, 1,
0.7272771, 1.534829, 0.2679266, 0.4823529, 0, 1, 1,
0.7291861, -0.7279252, 1.667515, 0.4862745, 0, 1, 1,
0.7363225, 0.6029741, 0.4994547, 0.4941176, 0, 1, 1,
0.7383184, -0.723536, 4.698712, 0.5019608, 0, 1, 1,
0.7386408, 0.8085475, -0.3496404, 0.5058824, 0, 1, 1,
0.7413913, 1.679758, 0.7185396, 0.5137255, 0, 1, 1,
0.7471796, -1.155688, 2.722124, 0.5176471, 0, 1, 1,
0.7487167, -0.6938198, 0.865967, 0.5254902, 0, 1, 1,
0.7504338, 0.262486, 1.161762, 0.5294118, 0, 1, 1,
0.7505167, -0.9067782, 2.25736, 0.5372549, 0, 1, 1,
0.7526273, 1.465728, 0.557136, 0.5411765, 0, 1, 1,
0.7541664, 1.185252, 1.124345, 0.5490196, 0, 1, 1,
0.7542405, -0.9149333, 1.851434, 0.5529412, 0, 1, 1,
0.7543361, 0.01022646, 0.8838814, 0.5607843, 0, 1, 1,
0.7562119, 0.2741768, 0.7582113, 0.5647059, 0, 1, 1,
0.760269, 0.2557883, 2.160301, 0.572549, 0, 1, 1,
0.7606181, 1.01878, 0.2161765, 0.5764706, 0, 1, 1,
0.7668918, -0.6376787, 1.114998, 0.5843138, 0, 1, 1,
0.767647, 0.1060783, 1.008891, 0.5882353, 0, 1, 1,
0.7683712, -0.1480431, 2.405463, 0.5960785, 0, 1, 1,
0.7726542, -1.71793, 4.576751, 0.6039216, 0, 1, 1,
0.7761087, 2.37925, -0.4529656, 0.6078432, 0, 1, 1,
0.779224, -1.682807, 1.232449, 0.6156863, 0, 1, 1,
0.7805553, -2.452406, 4.507219, 0.6196079, 0, 1, 1,
0.7862087, -0.9153686, 1.719168, 0.627451, 0, 1, 1,
0.7865118, 0.9498898, 0.1778554, 0.6313726, 0, 1, 1,
0.7915443, -0.8708209, 1.070763, 0.6392157, 0, 1, 1,
0.7930664, 0.07225574, -0.06081876, 0.6431373, 0, 1, 1,
0.8025703, 0.2435278, 2.510412, 0.6509804, 0, 1, 1,
0.8058406, -1.526136, 3.085595, 0.654902, 0, 1, 1,
0.8121895, -0.5369309, 2.446139, 0.6627451, 0, 1, 1,
0.8150266, -0.8312863, 2.79089, 0.6666667, 0, 1, 1,
0.8196068, 1.371826, -0.03301915, 0.6745098, 0, 1, 1,
0.8226958, 0.3929903, 0.1768911, 0.6784314, 0, 1, 1,
0.835456, 0.4016685, 1.006694, 0.6862745, 0, 1, 1,
0.8370252, 1.798371, -0.1626456, 0.6901961, 0, 1, 1,
0.8412365, 0.5722431, 1.967378, 0.6980392, 0, 1, 1,
0.8418014, -0.2137266, 0.9474266, 0.7058824, 0, 1, 1,
0.8439865, 0.133327, 2.816781, 0.7098039, 0, 1, 1,
0.8529322, -0.1190094, 0.8320509, 0.7176471, 0, 1, 1,
0.8548239, -0.5281186, -0.699687, 0.7215686, 0, 1, 1,
0.8568288, 0.1539586, 1.279922, 0.7294118, 0, 1, 1,
0.859559, -0.9840736, 3.79753, 0.7333333, 0, 1, 1,
0.8611521, -0.2988282, 2.635155, 0.7411765, 0, 1, 1,
0.8665253, -0.3794646, 1.718208, 0.7450981, 0, 1, 1,
0.8719376, 2.02139, 1.379203, 0.7529412, 0, 1, 1,
0.882571, -0.4930689, 1.356917, 0.7568628, 0, 1, 1,
0.8850539, 1.497991, 1.072885, 0.7647059, 0, 1, 1,
0.887947, 1.200857, 1.415223, 0.7686275, 0, 1, 1,
0.8886929, 0.09469632, 0.2189877, 0.7764706, 0, 1, 1,
0.8897922, 1.347612, -0.5371072, 0.7803922, 0, 1, 1,
0.8959981, 0.9345027, 0.6054184, 0.7882353, 0, 1, 1,
0.8975506, -0.1336583, 0.9559902, 0.7921569, 0, 1, 1,
0.8980379, 1.778119, 1.302941, 0.8, 0, 1, 1,
0.911399, 0.298291, -1.012898, 0.8078431, 0, 1, 1,
0.9171511, -0.4807691, 2.880563, 0.8117647, 0, 1, 1,
0.9177814, 1.831123, 0.9140317, 0.8196079, 0, 1, 1,
0.920894, 1.007141, -0.1415267, 0.8235294, 0, 1, 1,
0.9210383, -0.04848097, 2.108744, 0.8313726, 0, 1, 1,
0.9264314, 0.625067, 0.2761782, 0.8352941, 0, 1, 1,
0.9322306, 0.8018301, 2.247624, 0.8431373, 0, 1, 1,
0.935114, 1.339495, -0.2559913, 0.8470588, 0, 1, 1,
0.9371033, 0.6346967, 0.7757236, 0.854902, 0, 1, 1,
0.9437912, -0.2083812, 2.691355, 0.8588235, 0, 1, 1,
0.9450384, -0.01960498, 2.709489, 0.8666667, 0, 1, 1,
0.9477401, -0.9866157, -0.05547182, 0.8705882, 0, 1, 1,
0.9521121, -0.2599519, 0.336617, 0.8784314, 0, 1, 1,
0.9543801, 0.6635647, 1.474238, 0.8823529, 0, 1, 1,
0.9563899, -0.06202227, 0.26936, 0.8901961, 0, 1, 1,
0.9616675, -0.1642778, 1.793419, 0.8941177, 0, 1, 1,
0.9638649, 0.327768, 1.281037, 0.9019608, 0, 1, 1,
0.9655076, 0.001293142, -1.300901, 0.9098039, 0, 1, 1,
0.9673893, 0.5192081, 0.332472, 0.9137255, 0, 1, 1,
0.9674175, 0.09933817, -0.2720589, 0.9215686, 0, 1, 1,
0.968677, 1.297322, 0.8812449, 0.9254902, 0, 1, 1,
0.9746277, 0.4121559, 0.3170091, 0.9333333, 0, 1, 1,
0.9756293, -1.242747, -0.1230583, 0.9372549, 0, 1, 1,
0.9842511, -1.158848, 1.113194, 0.945098, 0, 1, 1,
0.9850707, -0.7873369, 2.718102, 0.9490196, 0, 1, 1,
0.9864763, -1.744843, 3.510266, 0.9568627, 0, 1, 1,
0.9918149, 1.091882, 0.3296521, 0.9607843, 0, 1, 1,
1.002855, 0.5164609, 1.249032, 0.9686275, 0, 1, 1,
1.00464, -1.043206, 2.101818, 0.972549, 0, 1, 1,
1.016383, -1.018695, 1.196347, 0.9803922, 0, 1, 1,
1.017861, 1.057236, 0.414048, 0.9843137, 0, 1, 1,
1.018762, -1.141197, 1.319845, 0.9921569, 0, 1, 1,
1.020461, -0.486621, 2.781262, 0.9960784, 0, 1, 1,
1.023956, 0.07397551, 1.165725, 1, 0, 0.9960784, 1,
1.024376, -0.7772119, 1.920345, 1, 0, 0.9882353, 1,
1.025541, 0.0329558, 0.5300401, 1, 0, 0.9843137, 1,
1.033541, -0.2395021, 0.7419259, 1, 0, 0.9764706, 1,
1.039622, -0.437746, 2.1781, 1, 0, 0.972549, 1,
1.043661, -1.361788, 3.857525, 1, 0, 0.9647059, 1,
1.055199, 0.137268, 1.16572, 1, 0, 0.9607843, 1,
1.056419, 1.049757, 1.346104, 1, 0, 0.9529412, 1,
1.056828, 0.4255107, 3.149863, 1, 0, 0.9490196, 1,
1.057784, -0.2965792, 2.079709, 1, 0, 0.9411765, 1,
1.059573, -0.01321083, 2.800423, 1, 0, 0.9372549, 1,
1.060027, 1.432509, 1.244008, 1, 0, 0.9294118, 1,
1.063596, 0.1478756, 0.1610824, 1, 0, 0.9254902, 1,
1.06851, 0.7541752, 0.8888251, 1, 0, 0.9176471, 1,
1.082342, 1.776147, 2.710229, 1, 0, 0.9137255, 1,
1.097593, 0.1164138, 0.473775, 1, 0, 0.9058824, 1,
1.097654, -2.130985, 1.746201, 1, 0, 0.9019608, 1,
1.098958, 0.3331233, 2.596561, 1, 0, 0.8941177, 1,
1.099077, -0.5888184, 2.172258, 1, 0, 0.8862745, 1,
1.104082, 0.635028, 2.407149, 1, 0, 0.8823529, 1,
1.104415, -0.4925639, 2.267938, 1, 0, 0.8745098, 1,
1.128858, 0.0121877, 1.997519, 1, 0, 0.8705882, 1,
1.13961, -0.9925577, 3.009216, 1, 0, 0.8627451, 1,
1.143887, 0.0852617, 0.08701239, 1, 0, 0.8588235, 1,
1.146142, -0.173628, 0.4724689, 1, 0, 0.8509804, 1,
1.156365, -1.465777, 2.527481, 1, 0, 0.8470588, 1,
1.157569, -0.03612711, 1.582662, 1, 0, 0.8392157, 1,
1.160454, -2.269385, 4.489145, 1, 0, 0.8352941, 1,
1.169214, -0.8612542, 1.902444, 1, 0, 0.827451, 1,
1.181009, -0.9209239, 3.341135, 1, 0, 0.8235294, 1,
1.187923, -0.2622028, 2.31515, 1, 0, 0.8156863, 1,
1.189005, 0.07312375, 0.9118344, 1, 0, 0.8117647, 1,
1.19417, -2.693352, 3.907793, 1, 0, 0.8039216, 1,
1.194177, -0.6914405, 2.935602, 1, 0, 0.7960784, 1,
1.198989, -1.561855, 1.337187, 1, 0, 0.7921569, 1,
1.200761, -0.3654903, 2.408866, 1, 0, 0.7843137, 1,
1.206475, -0.01962501, 3.689905, 1, 0, 0.7803922, 1,
1.20761, -0.1562545, 0.2119919, 1, 0, 0.772549, 1,
1.211983, -0.2525415, 0.7475424, 1, 0, 0.7686275, 1,
1.212373, -0.1114415, 2.4941, 1, 0, 0.7607843, 1,
1.215148, -0.8219531, -0.2201252, 1, 0, 0.7568628, 1,
1.227429, -0.3859456, 2.35287, 1, 0, 0.7490196, 1,
1.239901, 0.4139682, 2.640836, 1, 0, 0.7450981, 1,
1.240355, 0.0613542, 1.650714, 1, 0, 0.7372549, 1,
1.24248, -2.460396, 2.027077, 1, 0, 0.7333333, 1,
1.242927, 0.864348, 1.423115, 1, 0, 0.7254902, 1,
1.24907, 0.474666, 0.4902516, 1, 0, 0.7215686, 1,
1.249725, 0.8787645, -0.9741578, 1, 0, 0.7137255, 1,
1.269345, 0.499051, -0.8322875, 1, 0, 0.7098039, 1,
1.271541, 1.101007, 2.327391, 1, 0, 0.7019608, 1,
1.275634, -0.1951284, -0.06523267, 1, 0, 0.6941177, 1,
1.282869, -0.9325705, 3.138629, 1, 0, 0.6901961, 1,
1.287683, -1.578541, 2.7385, 1, 0, 0.682353, 1,
1.290745, 1.034912, 0.5227618, 1, 0, 0.6784314, 1,
1.291067, 0.02102272, 1.857564, 1, 0, 0.6705883, 1,
1.293247, 1.344899, 0.719419, 1, 0, 0.6666667, 1,
1.295104, -1.18337, 1.489217, 1, 0, 0.6588235, 1,
1.295855, 1.402369, 0.2026177, 1, 0, 0.654902, 1,
1.299894, -0.9952015, 2.064517, 1, 0, 0.6470588, 1,
1.301558, -0.791464, 2.262674, 1, 0, 0.6431373, 1,
1.302572, 0.5929192, -0.5997456, 1, 0, 0.6352941, 1,
1.30262, 1.716931, 0.4197797, 1, 0, 0.6313726, 1,
1.309797, -0.4181074, 1.8338, 1, 0, 0.6235294, 1,
1.310499, 0.2043333, 2.39339, 1, 0, 0.6196079, 1,
1.314036, -1.096866, 3.077232, 1, 0, 0.6117647, 1,
1.317108, -1.212699, 2.127377, 1, 0, 0.6078432, 1,
1.321113, -0.5657855, 1.549623, 1, 0, 0.6, 1,
1.321546, -0.4145789, 2.752601, 1, 0, 0.5921569, 1,
1.321727, 0.4520153, 0.6284028, 1, 0, 0.5882353, 1,
1.323399, -0.007085684, 1.832338, 1, 0, 0.5803922, 1,
1.327212, -0.9430065, 1.941209, 1, 0, 0.5764706, 1,
1.328402, -0.1576646, 1.217604, 1, 0, 0.5686275, 1,
1.337591, -1.084717, 1.80489, 1, 0, 0.5647059, 1,
1.337921, -0.4181864, 2.064157, 1, 0, 0.5568628, 1,
1.343349, -1.093685, 2.871664, 1, 0, 0.5529412, 1,
1.346722, 2.359324, 1.099248, 1, 0, 0.5450981, 1,
1.357964, 0.5776373, 1.15022, 1, 0, 0.5411765, 1,
1.359837, -1.968824, 2.443373, 1, 0, 0.5333334, 1,
1.365291, 0.5175794, 0.1016449, 1, 0, 0.5294118, 1,
1.36632, -0.2938855, 0.784238, 1, 0, 0.5215687, 1,
1.379406, 0.3316306, -0.08954158, 1, 0, 0.5176471, 1,
1.3915, -1.852968, 1.336801, 1, 0, 0.509804, 1,
1.407304, -0.4537036, 2.404678, 1, 0, 0.5058824, 1,
1.423597, -0.7084392, 0.04034122, 1, 0, 0.4980392, 1,
1.425427, 0.3552242, 2.266577, 1, 0, 0.4901961, 1,
1.438041, -0.6383541, 3.919412, 1, 0, 0.4862745, 1,
1.439123, 0.6598185, 0.1400665, 1, 0, 0.4784314, 1,
1.4393, 1.009273, -0.6966072, 1, 0, 0.4745098, 1,
1.452693, 0.2252685, 0.5037783, 1, 0, 0.4666667, 1,
1.453768, -0.2005613, -0.2377458, 1, 0, 0.4627451, 1,
1.45533, 4.232046, 0.8829426, 1, 0, 0.454902, 1,
1.456015, -0.7692965, 2.366816, 1, 0, 0.4509804, 1,
1.457067, 1.704477, 2.518023, 1, 0, 0.4431373, 1,
1.457515, -0.6786962, 2.867445, 1, 0, 0.4392157, 1,
1.457907, -1.219876, 4.793863, 1, 0, 0.4313726, 1,
1.461352, -0.6850647, 2.555859, 1, 0, 0.427451, 1,
1.479753, -0.8765352, 1.961213, 1, 0, 0.4196078, 1,
1.479944, 0.4698365, 2.581049, 1, 0, 0.4156863, 1,
1.480075, -0.2752338, 2.826385, 1, 0, 0.4078431, 1,
1.483285, -0.09202491, 2.410765, 1, 0, 0.4039216, 1,
1.48652, 1.49028, 0.9689665, 1, 0, 0.3960784, 1,
1.489347, -0.2927991, 0.3479756, 1, 0, 0.3882353, 1,
1.489751, 0.8763455, 0.9948831, 1, 0, 0.3843137, 1,
1.490164, 0.01487867, 1.458314, 1, 0, 0.3764706, 1,
1.4924, 0.05150957, 1.814432, 1, 0, 0.372549, 1,
1.496211, 0.4365493, 1.145364, 1, 0, 0.3647059, 1,
1.49669, -0.8367344, 1.705808, 1, 0, 0.3607843, 1,
1.497853, -0.6518412, 1.700542, 1, 0, 0.3529412, 1,
1.498685, 0.2124873, 1.516782, 1, 0, 0.3490196, 1,
1.498879, -1.484733, 2.810645, 1, 0, 0.3411765, 1,
1.511323, 1.022449, -1.567949, 1, 0, 0.3372549, 1,
1.521829, 0.6823317, -1.23325, 1, 0, 0.3294118, 1,
1.529006, -0.2535269, -0.8771022, 1, 0, 0.3254902, 1,
1.543432, -1.228112, 1.225185, 1, 0, 0.3176471, 1,
1.55384, 1.004022, 0.6884555, 1, 0, 0.3137255, 1,
1.579288, -1.031977, 1.173713, 1, 0, 0.3058824, 1,
1.583222, 1.566539, 0.8449841, 1, 0, 0.2980392, 1,
1.593326, 0.8450925, 2.228468, 1, 0, 0.2941177, 1,
1.596823, -0.9042669, 2.637506, 1, 0, 0.2862745, 1,
1.621535, 0.5319516, 1.804337, 1, 0, 0.282353, 1,
1.630048, -1.293737, 0.9966694, 1, 0, 0.2745098, 1,
1.645691, 1.286259, -1.432061, 1, 0, 0.2705882, 1,
1.645697, -0.5967438, 1.566331, 1, 0, 0.2627451, 1,
1.655598, 1.004526, -0.06631283, 1, 0, 0.2588235, 1,
1.658168, -1.435928, 3.336696, 1, 0, 0.2509804, 1,
1.66117, 0.8407319, 0.9404601, 1, 0, 0.2470588, 1,
1.670961, 0.6232389, 1.050719, 1, 0, 0.2392157, 1,
1.686899, 1.276867, 0.5478514, 1, 0, 0.2352941, 1,
1.712137, 1.572715, 1.247601, 1, 0, 0.227451, 1,
1.720698, 0.6061609, -0.4596462, 1, 0, 0.2235294, 1,
1.749693, 0.4357468, 2.45545, 1, 0, 0.2156863, 1,
1.757959, -0.1036007, 0.6884983, 1, 0, 0.2117647, 1,
1.760993, -2.103171, 3.170229, 1, 0, 0.2039216, 1,
1.775598, 0.4206589, 0.1535728, 1, 0, 0.1960784, 1,
1.852997, -0.6963899, 1.620149, 1, 0, 0.1921569, 1,
1.858431, -1.307148, 1.070049, 1, 0, 0.1843137, 1,
1.872007, 0.3158515, 0.3757792, 1, 0, 0.1803922, 1,
1.879193, -0.5194558, 1.95914, 1, 0, 0.172549, 1,
1.879711, -0.2111393, 1.531869, 1, 0, 0.1686275, 1,
1.880545, -0.8788936, 1.272434, 1, 0, 0.1607843, 1,
1.891412, 0.5250271, 1.972656, 1, 0, 0.1568628, 1,
1.911536, 1.259623, 0.3999006, 1, 0, 0.1490196, 1,
1.954229, -1.043972, 2.814932, 1, 0, 0.145098, 1,
1.959623, 0.6781221, 2.63846, 1, 0, 0.1372549, 1,
1.970968, 0.8994454, 2.323078, 1, 0, 0.1333333, 1,
1.979151, -1.891638, 3.909972, 1, 0, 0.1254902, 1,
1.982565, 0.09695233, 1.349755, 1, 0, 0.1215686, 1,
1.999176, -0.3911814, 3.121136, 1, 0, 0.1137255, 1,
2.001639, 1.304475, -1.127296, 1, 0, 0.1098039, 1,
2.068027, 1.575377, -0.07226566, 1, 0, 0.1019608, 1,
2.075005, 1.051464, 2.116648, 1, 0, 0.09411765, 1,
2.099839, 2.457191, 0.5133711, 1, 0, 0.09019608, 1,
2.103057, -1.61414, 2.156873, 1, 0, 0.08235294, 1,
2.109327, -0.4784878, 2.700294, 1, 0, 0.07843138, 1,
2.142604, -1.468469, 2.496684, 1, 0, 0.07058824, 1,
2.146167, 0.8014055, 0.4373433, 1, 0, 0.06666667, 1,
2.153294, -0.5543922, 0.7322667, 1, 0, 0.05882353, 1,
2.177988, 1.050994, 0.3549866, 1, 0, 0.05490196, 1,
2.240279, -0.7383797, 3.406157, 1, 0, 0.04705882, 1,
2.253885, -0.9847203, 2.360487, 1, 0, 0.04313726, 1,
2.332391, 1.214937, 1.291946, 1, 0, 0.03529412, 1,
2.428537, -0.2678012, -0.9435928, 1, 0, 0.03137255, 1,
2.51854, 0.72874, 0.1855222, 1, 0, 0.02352941, 1,
3.208664, 1.256594, 1.698168, 1, 0, 0.01960784, 1,
3.407717, 0.9597921, 2.843348, 1, 0, 0.01176471, 1,
3.622862, -0.02239541, 2.22023, 1, 0, 0.007843138, 1
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
0.1657529, -4.793032, -7.004632, 0, -0.5, 0.5, 0.5,
0.1657529, -4.793032, -7.004632, 1, -0.5, 0.5, 0.5,
0.1657529, -4.793032, -7.004632, 1, 1.5, 0.5, 0.5,
0.1657529, -4.793032, -7.004632, 0, 1.5, 0.5, 0.5
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
-4.463315, 0.3735259, -7.004632, 0, -0.5, 0.5, 0.5,
-4.463315, 0.3735259, -7.004632, 1, -0.5, 0.5, 0.5,
-4.463315, 0.3735259, -7.004632, 1, 1.5, 0.5, 0.5,
-4.463315, 0.3735259, -7.004632, 0, 1.5, 0.5, 0.5
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
-4.463315, -4.793032, 0.19854, 0, -0.5, 0.5, 0.5,
-4.463315, -4.793032, 0.19854, 1, -0.5, 0.5, 0.5,
-4.463315, -4.793032, 0.19854, 1, 1.5, 0.5, 0.5,
-4.463315, -4.793032, 0.19854, 0, 1.5, 0.5, 0.5
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
-3, -3.600749, -5.342362,
3, -3.600749, -5.342362,
-3, -3.600749, -5.342362,
-3, -3.799463, -5.619407,
-2, -3.600749, -5.342362,
-2, -3.799463, -5.619407,
-1, -3.600749, -5.342362,
-1, -3.799463, -5.619407,
0, -3.600749, -5.342362,
0, -3.799463, -5.619407,
1, -3.600749, -5.342362,
1, -3.799463, -5.619407,
2, -3.600749, -5.342362,
2, -3.799463, -5.619407,
3, -3.600749, -5.342362,
3, -3.799463, -5.619407
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
-3, -4.196891, -6.173497, 0, -0.5, 0.5, 0.5,
-3, -4.196891, -6.173497, 1, -0.5, 0.5, 0.5,
-3, -4.196891, -6.173497, 1, 1.5, 0.5, 0.5,
-3, -4.196891, -6.173497, 0, 1.5, 0.5, 0.5,
-2, -4.196891, -6.173497, 0, -0.5, 0.5, 0.5,
-2, -4.196891, -6.173497, 1, -0.5, 0.5, 0.5,
-2, -4.196891, -6.173497, 1, 1.5, 0.5, 0.5,
-2, -4.196891, -6.173497, 0, 1.5, 0.5, 0.5,
-1, -4.196891, -6.173497, 0, -0.5, 0.5, 0.5,
-1, -4.196891, -6.173497, 1, -0.5, 0.5, 0.5,
-1, -4.196891, -6.173497, 1, 1.5, 0.5, 0.5,
-1, -4.196891, -6.173497, 0, 1.5, 0.5, 0.5,
0, -4.196891, -6.173497, 0, -0.5, 0.5, 0.5,
0, -4.196891, -6.173497, 1, -0.5, 0.5, 0.5,
0, -4.196891, -6.173497, 1, 1.5, 0.5, 0.5,
0, -4.196891, -6.173497, 0, 1.5, 0.5, 0.5,
1, -4.196891, -6.173497, 0, -0.5, 0.5, 0.5,
1, -4.196891, -6.173497, 1, -0.5, 0.5, 0.5,
1, -4.196891, -6.173497, 1, 1.5, 0.5, 0.5,
1, -4.196891, -6.173497, 0, 1.5, 0.5, 0.5,
2, -4.196891, -6.173497, 0, -0.5, 0.5, 0.5,
2, -4.196891, -6.173497, 1, -0.5, 0.5, 0.5,
2, -4.196891, -6.173497, 1, 1.5, 0.5, 0.5,
2, -4.196891, -6.173497, 0, 1.5, 0.5, 0.5,
3, -4.196891, -6.173497, 0, -0.5, 0.5, 0.5,
3, -4.196891, -6.173497, 1, -0.5, 0.5, 0.5,
3, -4.196891, -6.173497, 1, 1.5, 0.5, 0.5,
3, -4.196891, -6.173497, 0, 1.5, 0.5, 0.5
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
-3.395069, -2, -5.342362,
-3.395069, 4, -5.342362,
-3.395069, -2, -5.342362,
-3.57311, -2, -5.619407,
-3.395069, 0, -5.342362,
-3.57311, 0, -5.619407,
-3.395069, 2, -5.342362,
-3.57311, 2, -5.619407,
-3.395069, 4, -5.342362,
-3.57311, 4, -5.619407
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
"0",
"2",
"4"
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
-3.929192, -2, -6.173497, 0, -0.5, 0.5, 0.5,
-3.929192, -2, -6.173497, 1, -0.5, 0.5, 0.5,
-3.929192, -2, -6.173497, 1, 1.5, 0.5, 0.5,
-3.929192, -2, -6.173497, 0, 1.5, 0.5, 0.5,
-3.929192, 0, -6.173497, 0, -0.5, 0.5, 0.5,
-3.929192, 0, -6.173497, 1, -0.5, 0.5, 0.5,
-3.929192, 0, -6.173497, 1, 1.5, 0.5, 0.5,
-3.929192, 0, -6.173497, 0, 1.5, 0.5, 0.5,
-3.929192, 2, -6.173497, 0, -0.5, 0.5, 0.5,
-3.929192, 2, -6.173497, 1, -0.5, 0.5, 0.5,
-3.929192, 2, -6.173497, 1, 1.5, 0.5, 0.5,
-3.929192, 2, -6.173497, 0, 1.5, 0.5, 0.5,
-3.929192, 4, -6.173497, 0, -0.5, 0.5, 0.5,
-3.929192, 4, -6.173497, 1, -0.5, 0.5, 0.5,
-3.929192, 4, -6.173497, 1, 1.5, 0.5, 0.5,
-3.929192, 4, -6.173497, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<4; i++) 
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
12, 13, 14, 12, 14, 15
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
-3.395069, -3.600749, -4,
-3.395069, -3.600749, 4,
-3.395069, -3.600749, -4,
-3.57311, -3.799463, -4,
-3.395069, -3.600749, -2,
-3.57311, -3.799463, -2,
-3.395069, -3.600749, 0,
-3.57311, -3.799463, 0,
-3.395069, -3.600749, 2,
-3.57311, -3.799463, 2,
-3.395069, -3.600749, 4,
-3.57311, -3.799463, 4
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
-3.929192, -4.196891, -4, 0, -0.5, 0.5, 0.5,
-3.929192, -4.196891, -4, 1, -0.5, 0.5, 0.5,
-3.929192, -4.196891, -4, 1, 1.5, 0.5, 0.5,
-3.929192, -4.196891, -4, 0, 1.5, 0.5, 0.5,
-3.929192, -4.196891, -2, 0, -0.5, 0.5, 0.5,
-3.929192, -4.196891, -2, 1, -0.5, 0.5, 0.5,
-3.929192, -4.196891, -2, 1, 1.5, 0.5, 0.5,
-3.929192, -4.196891, -2, 0, 1.5, 0.5, 0.5,
-3.929192, -4.196891, 0, 0, -0.5, 0.5, 0.5,
-3.929192, -4.196891, 0, 1, -0.5, 0.5, 0.5,
-3.929192, -4.196891, 0, 1, 1.5, 0.5, 0.5,
-3.929192, -4.196891, 0, 0, 1.5, 0.5, 0.5,
-3.929192, -4.196891, 2, 0, -0.5, 0.5, 0.5,
-3.929192, -4.196891, 2, 1, -0.5, 0.5, 0.5,
-3.929192, -4.196891, 2, 1, 1.5, 0.5, 0.5,
-3.929192, -4.196891, 2, 0, 1.5, 0.5, 0.5,
-3.929192, -4.196891, 4, 0, -0.5, 0.5, 0.5,
-3.929192, -4.196891, 4, 1, -0.5, 0.5, 0.5,
-3.929192, -4.196891, 4, 1, 1.5, 0.5, 0.5,
-3.929192, -4.196891, 4, 0, 1.5, 0.5, 0.5
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
-3.395069, -3.600749, -5.342362,
-3.395069, 4.347801, -5.342362,
-3.395069, -3.600749, 5.739442,
-3.395069, 4.347801, 5.739442,
-3.395069, -3.600749, -5.342362,
-3.395069, -3.600749, 5.739442,
-3.395069, 4.347801, -5.342362,
-3.395069, 4.347801, 5.739442,
-3.395069, -3.600749, -5.342362,
3.726575, -3.600749, -5.342362,
-3.395069, -3.600749, 5.739442,
3.726575, -3.600749, 5.739442,
-3.395069, 4.347801, -5.342362,
3.726575, 4.347801, -5.342362,
-3.395069, 4.347801, 5.739442,
3.726575, 4.347801, 5.739442,
3.726575, -3.600749, -5.342362,
3.726575, 4.347801, -5.342362,
3.726575, -3.600749, 5.739442,
3.726575, 4.347801, 5.739442,
3.726575, -3.600749, -5.342362,
3.726575, -3.600749, 5.739442,
3.726575, 4.347801, -5.342362,
3.726575, 4.347801, 5.739442
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
var radius = 8.215385;
var distance = 36.55118;
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
mvMatrix.translate( -0.1657529, -0.3735259, -0.19854 );
mvMatrix.scale( 1.247273, 1.117516, 0.8015514 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.55118);
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
gl.drawArrays(gl.LINES, 0, 10);
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
gl.drawElements(gl.TRIANGLES, 24, gl.UNSIGNED_SHORT, 0);
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
fenazaquin<-read.table("fenazaquin.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-fenazaquin$V2
```

```
## Error in eval(expr, envir, enclos): object 'fenazaquin' not found
```

```r
y<-fenazaquin$V3
```

```
## Error in eval(expr, envir, enclos): object 'fenazaquin' not found
```

```r
z<-fenazaquin$V4
```

```
## Error in eval(expr, envir, enclos): object 'fenazaquin' not found
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
-3.291356, 0.2200317, -2.484162, 0, 0, 1, 1, 1,
-3.11931, -0.6875757, -1.550502, 1, 0, 0, 1, 1,
-2.88111, -0.1199948, -1.315636, 1, 0, 0, 1, 1,
-2.86335, 0.777528, -3.021955, 1, 0, 0, 1, 1,
-2.6421, -0.7299654, -2.201707, 1, 0, 0, 1, 1,
-2.597654, 1.253063, 0.5148547, 1, 0, 0, 1, 1,
-2.596895, 0.06452118, -1.200713, 0, 0, 0, 1, 1,
-2.521548, -0.3877655, -1.81216, 0, 0, 0, 1, 1,
-2.519017, 0.8337899, -0.7333167, 0, 0, 0, 1, 1,
-2.431183, 0.5426365, -0.6692774, 0, 0, 0, 1, 1,
-2.407507, 0.6985474, -2.265506, 0, 0, 0, 1, 1,
-2.350495, 0.6783041, -2.067121, 0, 0, 0, 1, 1,
-2.308704, -0.707754, -1.260822, 0, 0, 0, 1, 1,
-2.308599, -0.3743299, -1.215342, 1, 1, 1, 1, 1,
-2.259371, -0.05880289, 0.3211471, 1, 1, 1, 1, 1,
-2.223758, -0.6006142, -0.4355561, 1, 1, 1, 1, 1,
-2.206008, 0.3879988, -2.369793, 1, 1, 1, 1, 1,
-2.198759, -0.4379182, -1.281407, 1, 1, 1, 1, 1,
-2.194569, -0.06885178, 0.3598648, 1, 1, 1, 1, 1,
-2.145759, 0.1722498, -0.8349319, 1, 1, 1, 1, 1,
-2.143229, -2.538856, -0.6458699, 1, 1, 1, 1, 1,
-2.121554, -0.5128908, -4.543588, 1, 1, 1, 1, 1,
-2.116832, -1.202538, -3.684865, 1, 1, 1, 1, 1,
-2.097841, 1.098144, -2.915153, 1, 1, 1, 1, 1,
-2.097044, -1.572849, -3.197178, 1, 1, 1, 1, 1,
-2.047438, -1.580624, -0.5543108, 1, 1, 1, 1, 1,
-2.046778, 0.1552581, -1.581275, 1, 1, 1, 1, 1,
-2.011255, 0.7112002, -1.62151, 1, 1, 1, 1, 1,
-1.984485, 0.6286501, -2.361638, 0, 0, 1, 1, 1,
-1.983307, 0.6704082, -0.9822381, 1, 0, 0, 1, 1,
-1.952559, 3.014792, -0.8364447, 1, 0, 0, 1, 1,
-1.946405, 0.8395833, -1.732395, 1, 0, 0, 1, 1,
-1.930827, 0.8222677, -0.5877172, 1, 0, 0, 1, 1,
-1.928422, -0.3034446, -2.244419, 1, 0, 0, 1, 1,
-1.9237, 0.8652508, -3.352775, 0, 0, 0, 1, 1,
-1.912002, 0.03387248, -1.857137, 0, 0, 0, 1, 1,
-1.896268, -1.277632, -1.054373, 0, 0, 0, 1, 1,
-1.896104, -0.979405, -0.1402459, 0, 0, 0, 1, 1,
-1.877833, -0.7548521, -2.176685, 0, 0, 0, 1, 1,
-1.87006, 0.274074, -3.977144, 0, 0, 0, 1, 1,
-1.817872, 0.4240416, 0.1918247, 0, 0, 0, 1, 1,
-1.801443, 1.299257, 0.0334412, 1, 1, 1, 1, 1,
-1.75076, -0.9555967, -2.60277, 1, 1, 1, 1, 1,
-1.740949, 0.494667, -1.345071, 1, 1, 1, 1, 1,
-1.719282, 1.379655, -1.292585, 1, 1, 1, 1, 1,
-1.712129, 0.9431403, -2.429708, 1, 1, 1, 1, 1,
-1.689462, 1.317409, -0.07804812, 1, 1, 1, 1, 1,
-1.675096, -1.339679, -2.221658, 1, 1, 1, 1, 1,
-1.668992, -1.387665, -3.788368, 1, 1, 1, 1, 1,
-1.634529, -1.142939, -1.471749, 1, 1, 1, 1, 1,
-1.62626, -0.3389716, -1.771798, 1, 1, 1, 1, 1,
-1.607888, 0.196496, 0.07457403, 1, 1, 1, 1, 1,
-1.599985, -0.5782226, -3.675227, 1, 1, 1, 1, 1,
-1.599777, 2.239547, -1.373672, 1, 1, 1, 1, 1,
-1.593472, -0.3299487, -2.327564, 1, 1, 1, 1, 1,
-1.580942, -0.6219415, -1.718781, 1, 1, 1, 1, 1,
-1.580034, 0.03940287, -1.917242, 0, 0, 1, 1, 1,
-1.578166, 0.08751227, -2.963623, 1, 0, 0, 1, 1,
-1.577772, 0.7217233, -2.044155, 1, 0, 0, 1, 1,
-1.557924, 0.3020975, -1.649952, 1, 0, 0, 1, 1,
-1.551457, 0.2356439, -1.289481, 1, 0, 0, 1, 1,
-1.542138, -1.787322, -3.196109, 1, 0, 0, 1, 1,
-1.538694, 0.6841371, -2.375736, 0, 0, 0, 1, 1,
-1.536666, -0.9012445, -3.053563, 0, 0, 0, 1, 1,
-1.536403, -0.3063957, -0.4993351, 0, 0, 0, 1, 1,
-1.528143, 0.7676844, -1.07853, 0, 0, 0, 1, 1,
-1.523691, 1.552219, -0.5430287, 0, 0, 0, 1, 1,
-1.514258, -0.3490431, -2.867811, 0, 0, 0, 1, 1,
-1.505652, 1.317304, -0.5343131, 0, 0, 0, 1, 1,
-1.463099, 0.8272753, -1.231954, 1, 1, 1, 1, 1,
-1.450061, -0.3374043, -1.217397, 1, 1, 1, 1, 1,
-1.443909, 0.2020743, -1.682611, 1, 1, 1, 1, 1,
-1.398103, 0.4681587, 1.882165, 1, 1, 1, 1, 1,
-1.377244, -0.3273138, -3.145659, 1, 1, 1, 1, 1,
-1.375747, 0.9078603, 0.2095992, 1, 1, 1, 1, 1,
-1.375461, -1.627897, -2.205196, 1, 1, 1, 1, 1,
-1.371225, -0.5686291, -2.775945, 1, 1, 1, 1, 1,
-1.363106, -0.3565077, -1.590221, 1, 1, 1, 1, 1,
-1.356522, -0.6746743, -2.429729, 1, 1, 1, 1, 1,
-1.340864, -1.260672, -2.143322, 1, 1, 1, 1, 1,
-1.333673, -2.443086, -3.087415, 1, 1, 1, 1, 1,
-1.328773, 1.395704, -1.670582, 1, 1, 1, 1, 1,
-1.326214, 0.549956, -0.4969063, 1, 1, 1, 1, 1,
-1.318154, 1.782804, -0.1848349, 1, 1, 1, 1, 1,
-1.313657, 1.845153, -1.102198, 0, 0, 1, 1, 1,
-1.301647, 0.620449, -0.7122874, 1, 0, 0, 1, 1,
-1.283947, -1.52161, -0.6871282, 1, 0, 0, 1, 1,
-1.281557, 1.071894, -1.291543, 1, 0, 0, 1, 1,
-1.27463, -0.2576886, -1.254897, 1, 0, 0, 1, 1,
-1.270642, 0.4305494, -1.710759, 1, 0, 0, 1, 1,
-1.264175, -1.082777, -2.873338, 0, 0, 0, 1, 1,
-1.255884, 0.622832, -1.315271, 0, 0, 0, 1, 1,
-1.255166, 0.2741318, -3.580777, 0, 0, 0, 1, 1,
-1.251612, -0.4291374, -0.4151359, 0, 0, 0, 1, 1,
-1.243147, -0.3732998, -2.099704, 0, 0, 0, 1, 1,
-1.241984, 0.847339, -0.3601768, 0, 0, 0, 1, 1,
-1.234787, -0.0171583, -1.53621, 0, 0, 0, 1, 1,
-1.231113, 1.23444, -1.623671, 1, 1, 1, 1, 1,
-1.229737, -0.7896361, -3.039601, 1, 1, 1, 1, 1,
-1.229398, 1.053392, -1.255535, 1, 1, 1, 1, 1,
-1.210986, -0.250203, -1.966259, 1, 1, 1, 1, 1,
-1.210612, -1.050716, -2.721945, 1, 1, 1, 1, 1,
-1.21005, 0.0438358, -0.9442195, 1, 1, 1, 1, 1,
-1.209638, -0.8330241, -2.086133, 1, 1, 1, 1, 1,
-1.202825, -1.374426, -4.381937, 1, 1, 1, 1, 1,
-1.197123, 0.370156, 0.3408691, 1, 1, 1, 1, 1,
-1.194611, -0.5798085, -1.406043, 1, 1, 1, 1, 1,
-1.191659, 0.5923985, -0.5879629, 1, 1, 1, 1, 1,
-1.185494, 0.09959899, -1.331685, 1, 1, 1, 1, 1,
-1.178559, 0.5394992, -1.02441, 1, 1, 1, 1, 1,
-1.154698, -0.2439558, -1.609047, 1, 1, 1, 1, 1,
-1.144577, 0.5097929, -0.7402214, 1, 1, 1, 1, 1,
-1.142924, -0.4755054, -0.6356933, 0, 0, 1, 1, 1,
-1.134218, 0.1254473, -2.076412, 1, 0, 0, 1, 1,
-1.127469, 0.1337292, -1.937826, 1, 0, 0, 1, 1,
-1.110679, 0.03174533, -0.523249, 1, 0, 0, 1, 1,
-1.110624, -0.1642473, -1.804586, 1, 0, 0, 1, 1,
-1.101514, 0.2571745, -2.003255, 1, 0, 0, 1, 1,
-1.09851, 0.6393468, 0.6064536, 0, 0, 0, 1, 1,
-1.096777, -1.44059, -2.830132, 0, 0, 0, 1, 1,
-1.095736, -0.08662042, 0.301111, 0, 0, 0, 1, 1,
-1.095134, 0.870542, -0.3943057, 0, 0, 0, 1, 1,
-1.078134, -1.389873, -2.185454, 0, 0, 0, 1, 1,
-1.07353, -0.7469735, -2.176323, 0, 0, 0, 1, 1,
-1.071227, -0.655328, -3.054246, 0, 0, 0, 1, 1,
-1.070992, 0.06014432, -1.381111, 1, 1, 1, 1, 1,
-1.067358, -0.9550864, -3.434306, 1, 1, 1, 1, 1,
-1.06563, 2.32716, -0.2215007, 1, 1, 1, 1, 1,
-1.062905, 1.511792, -1.902415, 1, 1, 1, 1, 1,
-1.059364, -1.277634, -3.569291, 1, 1, 1, 1, 1,
-1.058626, 0.5805032, -1.123327, 1, 1, 1, 1, 1,
-1.057996, -0.005895008, -1.803421, 1, 1, 1, 1, 1,
-1.046408, -0.1578477, -2.021017, 1, 1, 1, 1, 1,
-1.019056, 0.3459043, -1.120902, 1, 1, 1, 1, 1,
-1.015871, 0.07447661, -1.921001, 1, 1, 1, 1, 1,
-1.008866, -0.8593854, -0.9953498, 1, 1, 1, 1, 1,
-1.007178, 0.5633283, -0.4472241, 1, 1, 1, 1, 1,
-0.9976446, -1.967674, -2.553455, 1, 1, 1, 1, 1,
-0.990149, -0.7122608, -1.731294, 1, 1, 1, 1, 1,
-0.9887844, 0.8550146, -1.706304, 1, 1, 1, 1, 1,
-0.9826646, 0.5935445, -1.077928, 0, 0, 1, 1, 1,
-0.9814134, -1.958436, -3.746738, 1, 0, 0, 1, 1,
-0.9808674, 0.6840571, 0.465682, 1, 0, 0, 1, 1,
-0.9761012, -1.3121, -1.117718, 1, 0, 0, 1, 1,
-0.9735072, -0.608136, -2.577266, 1, 0, 0, 1, 1,
-0.9675035, 0.1975741, -1.212258, 1, 0, 0, 1, 1,
-0.9673731, -0.6969707, -2.711163, 0, 0, 0, 1, 1,
-0.9537693, 0.3513284, -0.8985022, 0, 0, 0, 1, 1,
-0.9435459, -0.9217687, -2.125368, 0, 0, 0, 1, 1,
-0.9430146, 1.792408, -0.8908463, 0, 0, 0, 1, 1,
-0.9425973, -0.8923448, -3.429766, 0, 0, 0, 1, 1,
-0.9413192, 1.442454, -1.729697, 0, 0, 0, 1, 1,
-0.939799, -0.1477101, -2.016302, 0, 0, 0, 1, 1,
-0.9353192, 0.3452223, -1.852303, 1, 1, 1, 1, 1,
-0.9307329, -0.559392, -1.58672, 1, 1, 1, 1, 1,
-0.9297054, -1.355588, -3.027897, 1, 1, 1, 1, 1,
-0.9237682, -1.173929, -2.417942, 1, 1, 1, 1, 1,
-0.9189677, -0.007650096, -2.13517, 1, 1, 1, 1, 1,
-0.9180932, 1.026416, 0.3840753, 1, 1, 1, 1, 1,
-0.9132625, -1.517796, -3.031404, 1, 1, 1, 1, 1,
-0.9115832, 0.2817574, -1.806487, 1, 1, 1, 1, 1,
-0.9065104, 1.207214, -0.3781887, 1, 1, 1, 1, 1,
-0.9059417, 1.609526, -1.546582, 1, 1, 1, 1, 1,
-0.9045075, -0.5231106, -3.070021, 1, 1, 1, 1, 1,
-0.9037039, -0.6058072, -4.213355, 1, 1, 1, 1, 1,
-0.9030781, -1.881174, -1.323332, 1, 1, 1, 1, 1,
-0.9025018, 0.05773737, -3.070156, 1, 1, 1, 1, 1,
-0.8962163, 0.3599804, -0.4173915, 1, 1, 1, 1, 1,
-0.8887653, -0.4838109, -3.606966, 0, 0, 1, 1, 1,
-0.888695, -0.8326094, -2.839142, 1, 0, 0, 1, 1,
-0.8842041, 0.5575477, -0.6865961, 1, 0, 0, 1, 1,
-0.8824415, 1.01068, 1.204527, 1, 0, 0, 1, 1,
-0.8717983, -1.768787, -2.736766, 1, 0, 0, 1, 1,
-0.867039, -0.818041, -2.650418, 1, 0, 0, 1, 1,
-0.8665525, -1.421625, -0.1655321, 0, 0, 0, 1, 1,
-0.8644422, -1.121775, -3.666263, 0, 0, 0, 1, 1,
-0.8626929, 0.5692152, -0.8372014, 0, 0, 0, 1, 1,
-0.8570507, -0.1478195, -0.2102509, 0, 0, 0, 1, 1,
-0.8532712, 0.7617984, -1.345416, 0, 0, 0, 1, 1,
-0.8505528, -0.6233183, -1.304774, 0, 0, 0, 1, 1,
-0.8491153, 1.605585, -0.3820437, 0, 0, 0, 1, 1,
-0.8475891, 0.07432812, -0.8219196, 1, 1, 1, 1, 1,
-0.8428788, -1.944163, -2.441797, 1, 1, 1, 1, 1,
-0.8384578, -0.6391956, -0.7375684, 1, 1, 1, 1, 1,
-0.8382723, -0.4143739, -3.143806, 1, 1, 1, 1, 1,
-0.8377674, -0.01909549, -0.7103698, 1, 1, 1, 1, 1,
-0.8361036, 1.396004, 1.442462, 1, 1, 1, 1, 1,
-0.8351026, 0.777588, -1.746586, 1, 1, 1, 1, 1,
-0.830788, 0.1807801, -2.185687, 1, 1, 1, 1, 1,
-0.8216121, 1.946572, -0.3806261, 1, 1, 1, 1, 1,
-0.8171689, 1.19406, 0.6954503, 1, 1, 1, 1, 1,
-0.8155204, -0.04238797, -0.5061018, 1, 1, 1, 1, 1,
-0.805666, 0.4580593, -0.5750929, 1, 1, 1, 1, 1,
-0.8011933, 0.5749742, -0.6027921, 1, 1, 1, 1, 1,
-0.7987895, 1.065981, -1.473829, 1, 1, 1, 1, 1,
-0.7962055, -0.8659642, -3.06356, 1, 1, 1, 1, 1,
-0.7954204, 0.6737253, -1.446591, 0, 0, 1, 1, 1,
-0.7947612, 0.1410789, -0.9080386, 1, 0, 0, 1, 1,
-0.7902802, 1.600602, -0.1113073, 1, 0, 0, 1, 1,
-0.7777543, -0.2963216, -0.1595307, 1, 0, 0, 1, 1,
-0.7699087, 1.016489, -1.461054, 1, 0, 0, 1, 1,
-0.7680669, 0.3252693, -0.8215666, 1, 0, 0, 1, 1,
-0.7676962, -1.302791, -1.286957, 0, 0, 0, 1, 1,
-0.7640827, 1.354179, -0.9050258, 0, 0, 0, 1, 1,
-0.7514715, -0.7034224, -0.4524713, 0, 0, 0, 1, 1,
-0.7509546, -0.1968988, -2.32104, 0, 0, 0, 1, 1,
-0.7494863, -1.160354, -3.258455, 0, 0, 0, 1, 1,
-0.7453715, 0.4047156, -2.055089, 0, 0, 0, 1, 1,
-0.7452946, 1.495131, -0.4664753, 0, 0, 0, 1, 1,
-0.744646, -0.1128982, -2.255414, 1, 1, 1, 1, 1,
-0.7396381, 0.7160644, -1.497188, 1, 1, 1, 1, 1,
-0.7375312, -0.4023131, -3.233549, 1, 1, 1, 1, 1,
-0.7330759, 0.226827, -1.319937, 1, 1, 1, 1, 1,
-0.7307375, 0.06672593, -0.623234, 1, 1, 1, 1, 1,
-0.7239528, 0.5456321, -1.427227, 1, 1, 1, 1, 1,
-0.7228684, 0.3698756, 0.2467272, 1, 1, 1, 1, 1,
-0.719497, -0.06438806, -2.994465, 1, 1, 1, 1, 1,
-0.7183086, -2.07826, -1.12151, 1, 1, 1, 1, 1,
-0.7107349, -0.8539279, -3.190468, 1, 1, 1, 1, 1,
-0.7101663, -1.768781, -3.121244, 1, 1, 1, 1, 1,
-0.7049553, -0.2660289, -1.975726, 1, 1, 1, 1, 1,
-0.700216, 0.1984014, -1.584915, 1, 1, 1, 1, 1,
-0.6964361, 0.4647373, -1.968297, 1, 1, 1, 1, 1,
-0.6963806, 0.7728792, -0.730195, 1, 1, 1, 1, 1,
-0.695851, 1.752598, -2.394229, 0, 0, 1, 1, 1,
-0.6923211, 2.697779, -1.629533, 1, 0, 0, 1, 1,
-0.6869026, -0.9715933, -2.627648, 1, 0, 0, 1, 1,
-0.6855382, -0.9885414, -3.511246, 1, 0, 0, 1, 1,
-0.6851575, 2.050724, -1.787372, 1, 0, 0, 1, 1,
-0.6843818, 0.5826347, -2.191772, 1, 0, 0, 1, 1,
-0.6836606, 0.4096932, 1.46785, 0, 0, 0, 1, 1,
-0.6753184, 1.42793, -1.151562, 0, 0, 0, 1, 1,
-0.6719505, -1.286546, -4.148472, 0, 0, 0, 1, 1,
-0.6683558, -0.02392031, 0.212589, 0, 0, 0, 1, 1,
-0.6675829, 0.1563693, -2.543854, 0, 0, 0, 1, 1,
-0.6652784, 1.187502, -0.8059269, 0, 0, 0, 1, 1,
-0.6547156, 0.8041242, -0.2467496, 0, 0, 0, 1, 1,
-0.6527448, 0.7161607, -1.756963, 1, 1, 1, 1, 1,
-0.6510029, 1.225578, 0.3814809, 1, 1, 1, 1, 1,
-0.6504787, 0.4769011, -0.5603436, 1, 1, 1, 1, 1,
-0.6485806, 0.5356795, -0.4790476, 1, 1, 1, 1, 1,
-0.6466998, -0.3680992, -2.364913, 1, 1, 1, 1, 1,
-0.6452504, -1.921888, -4.434481, 1, 1, 1, 1, 1,
-0.6421394, -0.4963551, -1.719855, 1, 1, 1, 1, 1,
-0.6386311, 0.3569544, -1.545431, 1, 1, 1, 1, 1,
-0.6373674, 0.7629535, -3.216055, 1, 1, 1, 1, 1,
-0.6312731, 0.6795841, 0.522985, 1, 1, 1, 1, 1,
-0.6308879, 0.6160036, -0.8477681, 1, 1, 1, 1, 1,
-0.6246082, -0.9706925, -3.483647, 1, 1, 1, 1, 1,
-0.6226429, -0.1247803, -1.709324, 1, 1, 1, 1, 1,
-0.6183934, 2.318983, 0.577231, 1, 1, 1, 1, 1,
-0.6163399, -1.52623, -1.538914, 1, 1, 1, 1, 1,
-0.6112182, -0.6185717, -3.032001, 0, 0, 1, 1, 1,
-0.6091494, -0.4044447, -2.05916, 1, 0, 0, 1, 1,
-0.6044002, 2.197359, 0.2766862, 1, 0, 0, 1, 1,
-0.6023079, -1.101303, -1.997485, 1, 0, 0, 1, 1,
-0.5993273, 0.02324176, -2.188922, 1, 0, 0, 1, 1,
-0.5985534, 0.00157663, -1.66021, 1, 0, 0, 1, 1,
-0.5943376, 1.98572, 1.44348, 0, 0, 0, 1, 1,
-0.5921424, 0.06052389, -0.2534377, 0, 0, 0, 1, 1,
-0.5910981, -0.4195399, -3.152158, 0, 0, 0, 1, 1,
-0.5890534, -1.146076, -2.80489, 0, 0, 0, 1, 1,
-0.5852802, -0.4980683, 0.004272244, 0, 0, 0, 1, 1,
-0.576537, 0.9511596, -1.005439, 0, 0, 0, 1, 1,
-0.5755309, -0.8662713, -1.610264, 0, 0, 0, 1, 1,
-0.5753902, -0.7178342, -1.950629, 1, 1, 1, 1, 1,
-0.5652855, 0.8850765, 0.4914343, 1, 1, 1, 1, 1,
-0.5615883, -0.07140929, -2.283747, 1, 1, 1, 1, 1,
-0.5586845, 0.6400455, -1.268981, 1, 1, 1, 1, 1,
-0.5570192, -1.447518, -4.144036, 1, 1, 1, 1, 1,
-0.5481085, 0.6630998, -0.1236675, 1, 1, 1, 1, 1,
-0.5468206, 0.3908501, -0.2668705, 1, 1, 1, 1, 1,
-0.5424997, -0.397705, -1.340334, 1, 1, 1, 1, 1,
-0.5336495, 1.32038, -1.754778, 1, 1, 1, 1, 1,
-0.5336027, -0.02842801, -0.9550166, 1, 1, 1, 1, 1,
-0.5325367, -1.944724, -3.181191, 1, 1, 1, 1, 1,
-0.5319394, 0.7937858, 0.1212784, 1, 1, 1, 1, 1,
-0.5319015, -1.807156, -2.158381, 1, 1, 1, 1, 1,
-0.5312673, -0.9991051, -2.125385, 1, 1, 1, 1, 1,
-0.5288765, -0.01797801, -2.892166, 1, 1, 1, 1, 1,
-0.528757, -0.610193, -4.293209, 0, 0, 1, 1, 1,
-0.5239173, 1.060549, -2.588812, 1, 0, 0, 1, 1,
-0.5137771, 0.005720856, -1.820835, 1, 0, 0, 1, 1,
-0.5096732, -0.8096893, -0.7000293, 1, 0, 0, 1, 1,
-0.5076804, -0.4007497, -3.502202, 1, 0, 0, 1, 1,
-0.498629, 0.5184521, -1.256416, 1, 0, 0, 1, 1,
-0.4968379, -0.4829492, -2.300232, 0, 0, 0, 1, 1,
-0.4950698, -0.8346685, -1.715904, 0, 0, 0, 1, 1,
-0.4934308, 1.630626, -0.8962963, 0, 0, 0, 1, 1,
-0.4890986, 0.1035489, -2.250771, 0, 0, 0, 1, 1,
-0.487735, 0.2206812, -0.8814795, 0, 0, 0, 1, 1,
-0.4823648, -0.6289408, -2.255464, 0, 0, 0, 1, 1,
-0.4805651, 1.005708, 0.1244105, 0, 0, 0, 1, 1,
-0.4793128, 0.3375384, 0.5484031, 1, 1, 1, 1, 1,
-0.4700081, -0.9445808, -1.341652, 1, 1, 1, 1, 1,
-0.4698568, 0.2732584, -3.121118, 1, 1, 1, 1, 1,
-0.4649476, 0.7855828, 0.4918186, 1, 1, 1, 1, 1,
-0.4648466, 1.330352, 1.676527, 1, 1, 1, 1, 1,
-0.4648372, 0.8543274, 0.09468001, 1, 1, 1, 1, 1,
-0.46449, 1.384215, -1.035726, 1, 1, 1, 1, 1,
-0.4617374, 1.60614, -0.7834272, 1, 1, 1, 1, 1,
-0.4597343, 0.04707301, -2.369522, 1, 1, 1, 1, 1,
-0.4576419, -0.4099267, -1.453445, 1, 1, 1, 1, 1,
-0.4529289, -0.4237575, -3.089728, 1, 1, 1, 1, 1,
-0.4500866, 0.4009401, -1.48196, 1, 1, 1, 1, 1,
-0.449854, 0.5711245, 0.05489811, 1, 1, 1, 1, 1,
-0.4469384, -1.261617, -1.234112, 1, 1, 1, 1, 1,
-0.4462112, -0.6782506, -0.7212437, 1, 1, 1, 1, 1,
-0.4412915, -0.9735824, -0.8552311, 0, 0, 1, 1, 1,
-0.4380976, -0.8603222, -1.589994, 1, 0, 0, 1, 1,
-0.4375587, -0.926862, -1.795019, 1, 0, 0, 1, 1,
-0.4374768, -0.6944407, -1.874189, 1, 0, 0, 1, 1,
-0.4352479, -0.4474015, -1.456776, 1, 0, 0, 1, 1,
-0.4321518, 0.2799523, -0.4402504, 1, 0, 0, 1, 1,
-0.4283383, -1.001932, -1.744121, 0, 0, 0, 1, 1,
-0.426677, 1.116473, -1.283885, 0, 0, 0, 1, 1,
-0.4252346, -0.6492649, -3.105771, 0, 0, 0, 1, 1,
-0.4237198, -0.4511624, -2.449749, 0, 0, 0, 1, 1,
-0.4223033, -0.07104537, -1.670269, 0, 0, 0, 1, 1,
-0.4194267, 0.6945534, -0.7353733, 0, 0, 0, 1, 1,
-0.4161385, -0.4265302, -2.279071, 0, 0, 0, 1, 1,
-0.4144002, -0.6904176, -3.334396, 1, 1, 1, 1, 1,
-0.4107243, 0.8005025, -1.659989, 1, 1, 1, 1, 1,
-0.4057325, 2.841849, -2.894297, 1, 1, 1, 1, 1,
-0.3967994, -0.4160798, -2.212606, 1, 1, 1, 1, 1,
-0.3923204, -0.3447055, -3.944453, 1, 1, 1, 1, 1,
-0.3828768, 1.317956, -0.9930882, 1, 1, 1, 1, 1,
-0.3808737, -1.313683, -2.937452, 1, 1, 1, 1, 1,
-0.379046, 1.539317, -2.253366, 1, 1, 1, 1, 1,
-0.3768761, 1.476411, 0.938461, 1, 1, 1, 1, 1,
-0.3750349, 0.3216041, -0.9712746, 1, 1, 1, 1, 1,
-0.3731969, -0.9346414, -4.387947, 1, 1, 1, 1, 1,
-0.3680373, -1.005605, -2.9927, 1, 1, 1, 1, 1,
-0.3668534, -0.3092415, -1.711433, 1, 1, 1, 1, 1,
-0.3651394, -0.7783125, -2.671965, 1, 1, 1, 1, 1,
-0.3639141, -0.1043985, -2.274736, 1, 1, 1, 1, 1,
-0.3556352, 0.2225717, -2.104417, 0, 0, 1, 1, 1,
-0.3556044, -1.306767, -3.859278, 1, 0, 0, 1, 1,
-0.3481122, -0.6667899, -2.688256, 1, 0, 0, 1, 1,
-0.3470171, 0.02460698, -2.100214, 1, 0, 0, 1, 1,
-0.3430216, 0.7950442, -0.7305955, 1, 0, 0, 1, 1,
-0.3427262, -0.6550769, -3.44745, 1, 0, 0, 1, 1,
-0.3412718, 0.5067806, -0.7876714, 0, 0, 0, 1, 1,
-0.3358276, -0.113367, -1.969021, 0, 0, 0, 1, 1,
-0.3342001, 0.6946892, -1.104201, 0, 0, 0, 1, 1,
-0.3334433, 0.5314083, -1.966976, 0, 0, 0, 1, 1,
-0.3278663, -1.817798, -2.312048, 0, 0, 0, 1, 1,
-0.3269528, -0.6838754, -0.6590044, 0, 0, 0, 1, 1,
-0.3184677, -0.3990376, -2.866958, 0, 0, 0, 1, 1,
-0.3183963, 0.0482546, -1.211523, 1, 1, 1, 1, 1,
-0.3182521, -1.200249, -4.860299, 1, 1, 1, 1, 1,
-0.3141853, -0.5474834, -2.911591, 1, 1, 1, 1, 1,
-0.3141219, -1.602581, -2.807978, 1, 1, 1, 1, 1,
-0.3101604, -2.511679, -4.437901, 1, 1, 1, 1, 1,
-0.3077615, -3.484994, -3.542591, 1, 1, 1, 1, 1,
-0.3044143, -1.682141, -2.222616, 1, 1, 1, 1, 1,
-0.3041054, -0.3555343, -1.310761, 1, 1, 1, 1, 1,
-0.3022867, -1.131108, -3.656837, 1, 1, 1, 1, 1,
-0.2981089, -1.012233, -2.67696, 1, 1, 1, 1, 1,
-0.2924791, -1.02778, -3.654253, 1, 1, 1, 1, 1,
-0.2922122, 0.3703337, -0.2673064, 1, 1, 1, 1, 1,
-0.2904703, -0.6099574, -2.749903, 1, 1, 1, 1, 1,
-0.2892845, 0.1146529, -1.513571, 1, 1, 1, 1, 1,
-0.2888844, -0.9066298, -3.92276, 1, 1, 1, 1, 1,
-0.2789092, -0.5940391, -2.671254, 0, 0, 1, 1, 1,
-0.2747487, -1.085756, -3.549729, 1, 0, 0, 1, 1,
-0.2738673, 0.6946991, -1.971617, 1, 0, 0, 1, 1,
-0.2733184, 1.115192, -0.9813094, 1, 0, 0, 1, 1,
-0.2673225, -0.3812527, -1.882526, 1, 0, 0, 1, 1,
-0.2665721, -0.2059045, -3.831709, 1, 0, 0, 1, 1,
-0.2636677, 0.03625172, -1.744382, 0, 0, 0, 1, 1,
-0.2629811, 0.1044583, -0.1765944, 0, 0, 0, 1, 1,
-0.2605476, -1.947536, -3.902457, 0, 0, 0, 1, 1,
-0.2574123, -0.05276337, -3.241443, 0, 0, 0, 1, 1,
-0.2571332, 0.5874658, -0.9558044, 0, 0, 0, 1, 1,
-0.2563271, -0.9304611, -3.049304, 0, 0, 0, 1, 1,
-0.2561164, 1.970868, 0.619114, 0, 0, 0, 1, 1,
-0.251152, -0.5144097, -2.484068, 1, 1, 1, 1, 1,
-0.2484769, -0.3497765, -1.878504, 1, 1, 1, 1, 1,
-0.2441311, 1.535217, -0.3351122, 1, 1, 1, 1, 1,
-0.2422862, 0.6477804, -1.720569, 1, 1, 1, 1, 1,
-0.2411524, -0.1784999, -2.864317, 1, 1, 1, 1, 1,
-0.2373236, -2.160815, -2.864898, 1, 1, 1, 1, 1,
-0.236481, 0.5725573, 1.492401, 1, 1, 1, 1, 1,
-0.230903, 0.5829371, -0.5853286, 1, 1, 1, 1, 1,
-0.2292435, 0.2728421, -0.7228521, 1, 1, 1, 1, 1,
-0.2279958, 0.3371699, -0.5151983, 1, 1, 1, 1, 1,
-0.2228732, -0.134998, -1.594498, 1, 1, 1, 1, 1,
-0.2203663, -0.4428076, -1.880205, 1, 1, 1, 1, 1,
-0.2177526, -0.2230874, -2.515062, 1, 1, 1, 1, 1,
-0.2162776, -0.5492133, -4.954382, 1, 1, 1, 1, 1,
-0.2113211, -0.4556833, -1.762856, 1, 1, 1, 1, 1,
-0.2108967, -0.6362013, -2.720786, 0, 0, 1, 1, 1,
-0.2103901, -0.7504116, -2.227844, 1, 0, 0, 1, 1,
-0.2093142, 0.824541, -0.1421815, 1, 0, 0, 1, 1,
-0.2089173, -0.567737, -1.412371, 1, 0, 0, 1, 1,
-0.2069801, 0.8529423, 0.52159, 1, 0, 0, 1, 1,
-0.2047114, -0.8894799, -1.00517, 1, 0, 0, 1, 1,
-0.2039371, -1.175135, -2.551068, 0, 0, 0, 1, 1,
-0.2035174, 1.391795, 1.309077, 0, 0, 0, 1, 1,
-0.2018549, -1.477289, -3.631083, 0, 0, 0, 1, 1,
-0.2008701, -0.1054479, -2.070364, 0, 0, 0, 1, 1,
-0.1990561, -0.4900022, -4.638528, 0, 0, 0, 1, 1,
-0.1990124, -0.1556469, -1.917293, 0, 0, 0, 1, 1,
-0.1970639, 0.4617814, -1.247695, 0, 0, 0, 1, 1,
-0.193704, 0.9850498, -0.5755264, 1, 1, 1, 1, 1,
-0.1888504, 0.06679267, -0.2590135, 1, 1, 1, 1, 1,
-0.1878141, -1.036363, -3.328054, 1, 1, 1, 1, 1,
-0.1862367, -1.701995, -3.078639, 1, 1, 1, 1, 1,
-0.1844107, -0.7415005, -2.275235, 1, 1, 1, 1, 1,
-0.1804318, -2.016531, -3.243861, 1, 1, 1, 1, 1,
-0.1740968, 1.474998, -0.5283443, 1, 1, 1, 1, 1,
-0.1683811, 0.6176476, 0.4982879, 1, 1, 1, 1, 1,
-0.1669373, -0.7842208, -2.014817, 1, 1, 1, 1, 1,
-0.1665674, -0.1653436, -3.564262, 1, 1, 1, 1, 1,
-0.1640397, 0.7341215, -1.054684, 1, 1, 1, 1, 1,
-0.1638859, -0.9520556, -4.063994, 1, 1, 1, 1, 1,
-0.1627979, -0.02010551, -2.653356, 1, 1, 1, 1, 1,
-0.1619934, -0.843739, -2.997075, 1, 1, 1, 1, 1,
-0.1557318, -0.7306108, -3.230834, 1, 1, 1, 1, 1,
-0.1523293, 1.069491, 0.3277652, 0, 0, 1, 1, 1,
-0.1513198, 2.355046, -0.5058809, 1, 0, 0, 1, 1,
-0.150998, -1.593104, -4.207486, 1, 0, 0, 1, 1,
-0.1460923, 0.3380069, -2.036688, 1, 0, 0, 1, 1,
-0.14223, -1.029663, -4.495018, 1, 0, 0, 1, 1,
-0.1419887, -0.5266649, -4.130431, 1, 0, 0, 1, 1,
-0.1407983, 2.068053, 0.7184478, 0, 0, 0, 1, 1,
-0.1396678, 0.2687355, -0.7745176, 0, 0, 0, 1, 1,
-0.1387415, 1.055154, -1.512747, 0, 0, 0, 1, 1,
-0.1387127, -2.28889, -3.467523, 0, 0, 0, 1, 1,
-0.1355438, -1.089406, -2.767854, 0, 0, 0, 1, 1,
-0.1317215, -0.9890167, -0.6409758, 0, 0, 0, 1, 1,
-0.1273352, 0.03620829, -2.21262, 0, 0, 0, 1, 1,
-0.1267714, -1.886283, -2.897776, 1, 1, 1, 1, 1,
-0.1265066, -0.1460248, -2.477124, 1, 1, 1, 1, 1,
-0.1193876, -0.5345495, -3.247857, 1, 1, 1, 1, 1,
-0.1192039, 0.9521235, 1.533095, 1, 1, 1, 1, 1,
-0.1179498, -0.6736187, -1.803038, 1, 1, 1, 1, 1,
-0.1150689, 0.3853522, 0.572223, 1, 1, 1, 1, 1,
-0.1105041, -0.08960345, -2.567453, 1, 1, 1, 1, 1,
-0.1073794, 0.06087502, -1.31165, 1, 1, 1, 1, 1,
-0.1070041, -1.268993, -2.893229, 1, 1, 1, 1, 1,
-0.103856, -0.7721517, -3.3675, 1, 1, 1, 1, 1,
-0.1025137, -0.1161155, -1.58489, 1, 1, 1, 1, 1,
-0.1010566, 0.0630531, -1.917719, 1, 1, 1, 1, 1,
-0.09744927, 0.8842782, 0.6999751, 1, 1, 1, 1, 1,
-0.09528538, -1.478116, -3.426107, 1, 1, 1, 1, 1,
-0.09245049, 0.7888963, 0.674573, 1, 1, 1, 1, 1,
-0.08412614, -0.1407555, -1.49621, 0, 0, 1, 1, 1,
-0.08284626, 1.040238, -0.353146, 1, 0, 0, 1, 1,
-0.08254047, -0.2211847, -3.048329, 1, 0, 0, 1, 1,
-0.07846226, -1.243419, -3.260071, 1, 0, 0, 1, 1,
-0.07750935, 1.052894, 0.8260283, 1, 0, 0, 1, 1,
-0.07607123, 1.751623, -0.1403733, 1, 0, 0, 1, 1,
-0.07557989, -0.8229733, -4.583957, 0, 0, 0, 1, 1,
-0.07507063, -1.213454, -2.376364, 0, 0, 0, 1, 1,
-0.07399145, 0.519425, -0.3279912, 0, 0, 0, 1, 1,
-0.07014527, -0.7085369, -4.073578, 0, 0, 0, 1, 1,
-0.0678445, 1.438975, -0.2136138, 0, 0, 0, 1, 1,
-0.06432658, 2.269287, -0.1905594, 0, 0, 0, 1, 1,
-0.06144556, 0.09002358, -0.05890198, 0, 0, 0, 1, 1,
-0.06075932, 2.319733, -0.7049505, 1, 1, 1, 1, 1,
-0.05752533, 0.7116452, -0.3405057, 1, 1, 1, 1, 1,
-0.04891813, -0.9454169, -3.34943, 1, 1, 1, 1, 1,
-0.04637559, -0.4603076, -0.4341263, 1, 1, 1, 1, 1,
-0.04490537, 0.6294112, -0.4448295, 1, 1, 1, 1, 1,
-0.04400087, 0.7313306, 1.675424, 1, 1, 1, 1, 1,
-0.04360984, -0.8972402, -3.55333, 1, 1, 1, 1, 1,
-0.04146696, 0.7370951, -0.40727, 1, 1, 1, 1, 1,
-0.03771289, 0.9453964, 0.002607742, 1, 1, 1, 1, 1,
-0.03378262, -0.3117854, -2.653115, 1, 1, 1, 1, 1,
-0.03161036, -1.404729, -3.498806, 1, 1, 1, 1, 1,
-0.03066293, -1.608364, -3.751246, 1, 1, 1, 1, 1,
-0.02732236, 2.653004, -1.502227, 1, 1, 1, 1, 1,
-0.02616108, -0.2417215, -3.973883, 1, 1, 1, 1, 1,
-0.02505119, -0.420993, -2.921259, 1, 1, 1, 1, 1,
-0.02434881, -0.04568819, -1.152048, 0, 0, 1, 1, 1,
-0.01978027, 1.183852, -0.3269634, 1, 0, 0, 1, 1,
-0.01689287, -0.7111149, -1.494859, 1, 0, 0, 1, 1,
-0.01588755, -0.9830782, -5.180976, 1, 0, 0, 1, 1,
-0.01586061, 0.7233952, -0.3401805, 1, 0, 0, 1, 1,
-0.008116186, 0.1293555, 2.079833, 1, 0, 0, 1, 1,
-0.005540344, -2.283698, -3.350058, 0, 0, 0, 1, 1,
-0.004136558, -1.004957, -1.872598, 0, 0, 0, 1, 1,
-0.002425592, -1.113576, -3.247514, 0, 0, 0, 1, 1,
-0.0004956935, 0.2537526, -0.65849, 0, 0, 0, 1, 1,
0.001430789, 0.5430626, -0.7323441, 0, 0, 0, 1, 1,
0.00705306, -0.6298189, 3.858719, 0, 0, 0, 1, 1,
0.01034705, 0.1925806, -1.205143, 0, 0, 0, 1, 1,
0.01242103, 0.6673135, 1.067405, 1, 1, 1, 1, 1,
0.01243979, -0.5336888, 3.448579, 1, 1, 1, 1, 1,
0.0128965, 0.2036704, 1.692693, 1, 1, 1, 1, 1,
0.014962, 1.615045, 1.717141, 1, 1, 1, 1, 1,
0.01788959, 0.6668399, -0.190096, 1, 1, 1, 1, 1,
0.01930813, -0.08093602, 3.108387, 1, 1, 1, 1, 1,
0.02344347, -0.5855024, 2.821805, 1, 1, 1, 1, 1,
0.02382396, -1.543267, 3.291078, 1, 1, 1, 1, 1,
0.03189375, 1.819654, 0.8758923, 1, 1, 1, 1, 1,
0.03237132, -1.391735, 3.920129, 1, 1, 1, 1, 1,
0.03407618, 1.314003, 0.4957894, 1, 1, 1, 1, 1,
0.03586276, -1.006459, 3.330221, 1, 1, 1, 1, 1,
0.03731319, -1.820184, 3.921549, 1, 1, 1, 1, 1,
0.03759534, 0.212291, -0.5592901, 1, 1, 1, 1, 1,
0.0397683, 0.1848761, -0.9410768, 1, 1, 1, 1, 1,
0.04419591, 0.9075662, -0.0793375, 0, 0, 1, 1, 1,
0.04711498, 0.6171948, -0.1027959, 1, 0, 0, 1, 1,
0.04777627, 1.473199, 1.575451, 1, 0, 0, 1, 1,
0.05190726, 0.5213314, 1.044387, 1, 0, 0, 1, 1,
0.06085584, -0.1570495, 4.511907, 1, 0, 0, 1, 1,
0.06185817, -0.481448, 2.399667, 1, 0, 0, 1, 1,
0.06252725, 1.152513, -0.2261078, 0, 0, 0, 1, 1,
0.06286016, 0.2434153, 0.559918, 0, 0, 0, 1, 1,
0.06570408, 1.253879, -0.6495165, 0, 0, 0, 1, 1,
0.06585039, 0.3630114, 0.766849, 0, 0, 0, 1, 1,
0.06795464, -1.057346, 2.620381, 0, 0, 0, 1, 1,
0.07294661, 0.4813826, -0.4965727, 0, 0, 0, 1, 1,
0.07700161, -0.4488679, 2.488507, 0, 0, 0, 1, 1,
0.08688986, -1.420087, 4.022959, 1, 1, 1, 1, 1,
0.0871156, -1.079236, 3.355217, 1, 1, 1, 1, 1,
0.08822966, -1.024259, 3.509238, 1, 1, 1, 1, 1,
0.09053311, -0.05058855, 1.936767, 1, 1, 1, 1, 1,
0.0954247, 0.8872585, -0.2068924, 1, 1, 1, 1, 1,
0.09576017, 0.01391728, 1.301239, 1, 1, 1, 1, 1,
0.09890991, 0.1500835, 1.944692, 1, 1, 1, 1, 1,
0.09992903, -1.838963, 1.054157, 1, 1, 1, 1, 1,
0.1022826, -1.873156, 3.014016, 1, 1, 1, 1, 1,
0.1037783, -1.17857, 3.25284, 1, 1, 1, 1, 1,
0.1044529, -0.04860603, 0.2810836, 1, 1, 1, 1, 1,
0.1055588, 1.124512, -0.1960238, 1, 1, 1, 1, 1,
0.1078964, -0.4329665, 3.330362, 1, 1, 1, 1, 1,
0.1084594, 0.002888246, 0.9974221, 1, 1, 1, 1, 1,
0.1119695, -0.6973966, 3.41854, 1, 1, 1, 1, 1,
0.1133794, 1.923135, -0.7943738, 0, 0, 1, 1, 1,
0.1145552, -0.3864183, 2.904696, 1, 0, 0, 1, 1,
0.1169481, -1.184305, 3.752227, 1, 0, 0, 1, 1,
0.1177745, -1.202589, 3.170106, 1, 0, 0, 1, 1,
0.1189643, 1.542255, -0.06127971, 1, 0, 0, 1, 1,
0.1235425, -0.6777932, 3.996203, 1, 0, 0, 1, 1,
0.123842, -0.3602053, 2.485857, 0, 0, 0, 1, 1,
0.1250646, -0.414923, 2.069768, 0, 0, 0, 1, 1,
0.1251173, -1.057811, 2.7793, 0, 0, 0, 1, 1,
0.1252434, 0.07979688, 1.965816, 0, 0, 0, 1, 1,
0.1269254, 1.382656, 0.3854776, 0, 0, 0, 1, 1,
0.1270846, 0.9489243, -1.553643, 0, 0, 0, 1, 1,
0.1276096, -0.2170669, 0.9398993, 0, 0, 0, 1, 1,
0.1276775, 0.700908, 0.2310101, 1, 1, 1, 1, 1,
0.1300492, 1.109566, -0.6913075, 1, 1, 1, 1, 1,
0.1305134, -0.935366, 3.51479, 1, 1, 1, 1, 1,
0.1314042, -0.4136279, 1.965688, 1, 1, 1, 1, 1,
0.1331817, -1.418764, 4.199495, 1, 1, 1, 1, 1,
0.1337404, -0.7957176, 1.482877, 1, 1, 1, 1, 1,
0.1338148, -0.07343066, 0.3336017, 1, 1, 1, 1, 1,
0.1352809, -0.7233249, 2.474376, 1, 1, 1, 1, 1,
0.136714, -0.2449745, 2.541723, 1, 1, 1, 1, 1,
0.140413, 0.7354504, -0.02853123, 1, 1, 1, 1, 1,
0.1413053, 0.2800586, 0.7341635, 1, 1, 1, 1, 1,
0.1576792, -1.440728, 5.578056, 1, 1, 1, 1, 1,
0.1598018, 0.05256587, -0.02810455, 1, 1, 1, 1, 1,
0.1609367, 0.2019989, 1.392659, 1, 1, 1, 1, 1,
0.1636076, -0.5909668, 2.911539, 1, 1, 1, 1, 1,
0.1665895, 1.040489, 1.360118, 0, 0, 1, 1, 1,
0.1680373, -0.9504249, 3.265465, 1, 0, 0, 1, 1,
0.1708057, -0.1835311, 4.953744, 1, 0, 0, 1, 1,
0.1728493, 2.713717, -1.315217, 1, 0, 0, 1, 1,
0.1759137, 0.04254666, 2.997989, 1, 0, 0, 1, 1,
0.1800644, 1.010254, -0.07363982, 1, 0, 0, 1, 1,
0.1802027, -1.404939, 2.563453, 0, 0, 0, 1, 1,
0.182526, 0.2134279, 0.5258992, 0, 0, 0, 1, 1,
0.1875493, 1.507886, 0.4815299, 0, 0, 0, 1, 1,
0.1890695, 0.3880616, 0.3836155, 0, 0, 0, 1, 1,
0.1897081, -0.01757165, 2.13072, 0, 0, 0, 1, 1,
0.19489, 1.652492, 0.2322669, 0, 0, 0, 1, 1,
0.1992462, -0.267746, 2.598948, 0, 0, 0, 1, 1,
0.199322, 1.910053, -0.2981051, 1, 1, 1, 1, 1,
0.2001045, -0.6644924, 3.465063, 1, 1, 1, 1, 1,
0.2007615, 1.09338, 0.9389595, 1, 1, 1, 1, 1,
0.2016016, 0.8501673, -0.1641154, 1, 1, 1, 1, 1,
0.2029416, -0.2639354, 1.676634, 1, 1, 1, 1, 1,
0.2092132, 0.8359576, 0.7905088, 1, 1, 1, 1, 1,
0.2161297, -0.009790272, 2.541081, 1, 1, 1, 1, 1,
0.2164314, 1.14402, 1.470329, 1, 1, 1, 1, 1,
0.2170021, 1.359733, -0.6996018, 1, 1, 1, 1, 1,
0.2197922, -0.3597139, 2.995561, 1, 1, 1, 1, 1,
0.2206994, -0.7805783, 2.556807, 1, 1, 1, 1, 1,
0.2209072, -0.467951, 2.835047, 1, 1, 1, 1, 1,
0.2234081, 1.500593, 0.09745549, 1, 1, 1, 1, 1,
0.2238015, -1.000624, 4.536463, 1, 1, 1, 1, 1,
0.2254115, 1.92995, 1.305956, 1, 1, 1, 1, 1,
0.2308462, -1.542461, 3.853494, 0, 0, 1, 1, 1,
0.2321687, -1.843554, 4.08285, 1, 0, 0, 1, 1,
0.2366211, -0.690159, 1.444208, 1, 0, 0, 1, 1,
0.239472, 0.5090108, 1.187032, 1, 0, 0, 1, 1,
0.2457792, -0.4943951, 2.483047, 1, 0, 0, 1, 1,
0.2512619, 0.02419157, 2.264884, 1, 0, 0, 1, 1,
0.2535466, 0.5950695, 1.991713, 0, 0, 0, 1, 1,
0.2552908, -0.8011957, 1.445281, 0, 0, 0, 1, 1,
0.2569756, -0.8627008, 2.902629, 0, 0, 0, 1, 1,
0.258514, 0.8143753, -1.205431, 0, 0, 0, 1, 1,
0.2594855, -0.4011008, 2.669736, 0, 0, 0, 1, 1,
0.2616476, 2.401179, 0.3861288, 0, 0, 0, 1, 1,
0.2636682, 1.014642, 2.215046, 0, 0, 0, 1, 1,
0.2656829, 0.3852818, 0.01806814, 1, 1, 1, 1, 1,
0.2707766, -0.2041163, 2.36272, 1, 1, 1, 1, 1,
0.2711135, -1.713993, 2.833497, 1, 1, 1, 1, 1,
0.2721802, -0.594274, 4.484904, 1, 1, 1, 1, 1,
0.2772418, 0.3791298, -0.8833604, 1, 1, 1, 1, 1,
0.2788207, -1.385182, 2.377336, 1, 1, 1, 1, 1,
0.280776, 0.2694463, 2.08178, 1, 1, 1, 1, 1,
0.2857142, 0.7414238, 0.7267401, 1, 1, 1, 1, 1,
0.2883731, 0.8940772, 1.143486, 1, 1, 1, 1, 1,
0.2885806, -0.2704705, 2.606966, 1, 1, 1, 1, 1,
0.298488, 0.05340665, 1.969883, 1, 1, 1, 1, 1,
0.3028578, -0.01408672, 2.214558, 1, 1, 1, 1, 1,
0.3047585, -0.08072513, 4.060308, 1, 1, 1, 1, 1,
0.308202, -0.1310748, 2.115118, 1, 1, 1, 1, 1,
0.3128856, -0.7319358, 4.837624, 1, 1, 1, 1, 1,
0.3174239, -0.3779717, 1.669245, 0, 0, 1, 1, 1,
0.328452, -0.09494818, 2.764576, 1, 0, 0, 1, 1,
0.3294351, 0.4946037, 0.0842789, 1, 0, 0, 1, 1,
0.336536, 1.047897, -0.2408102, 1, 0, 0, 1, 1,
0.3435757, 0.8516249, 1.156199, 1, 0, 0, 1, 1,
0.3446607, 0.2269445, 0.6564094, 1, 0, 0, 1, 1,
0.3462114, 0.5301863, 2.069291, 0, 0, 0, 1, 1,
0.3472079, 1.409836, 0.3067689, 0, 0, 0, 1, 1,
0.3490552, 0.5230399, 1.50756, 0, 0, 0, 1, 1,
0.3492728, 1.216709, 0.2927904, 0, 0, 0, 1, 1,
0.3501233, -0.4862148, 3.087998, 0, 0, 0, 1, 1,
0.3514347, 1.128633, 1.766116, 0, 0, 0, 1, 1,
0.3559952, -0.5527861, 0.4094849, 0, 0, 0, 1, 1,
0.3615845, -0.7948232, 1.889028, 1, 1, 1, 1, 1,
0.3654724, 2.797037, 1.169635, 1, 1, 1, 1, 1,
0.3683424, 0.06485592, 1.633364, 1, 1, 1, 1, 1,
0.3694538, -0.9167387, 1.928409, 1, 1, 1, 1, 1,
0.3697286, -0.6219273, 3.141572, 1, 1, 1, 1, 1,
0.371911, -1.881786, 2.713665, 1, 1, 1, 1, 1,
0.3756444, 0.5839845, -0.05536576, 1, 1, 1, 1, 1,
0.3796652, -0.399463, 2.202381, 1, 1, 1, 1, 1,
0.3800583, -1.455339, 4.43653, 1, 1, 1, 1, 1,
0.383105, 1.373991, 1.072754, 1, 1, 1, 1, 1,
0.3867287, 0.2560171, -0.4906669, 1, 1, 1, 1, 1,
0.3882037, -3.257454, 3.407917, 1, 1, 1, 1, 1,
0.3889013, -1.056014, 3.641825, 1, 1, 1, 1, 1,
0.3944786, -0.5945594, 4.529813, 1, 1, 1, 1, 1,
0.3951998, -0.06583789, 3.52635, 1, 1, 1, 1, 1,
0.3952276, 0.578373, -0.6401893, 0, 0, 1, 1, 1,
0.4018239, -1.232773, 2.282201, 1, 0, 0, 1, 1,
0.4125947, -0.7680473, 2.800373, 1, 0, 0, 1, 1,
0.4196739, -1.360957, 3.830035, 1, 0, 0, 1, 1,
0.4218096, 0.2528117, 0.3548053, 1, 0, 0, 1, 1,
0.4240847, -1.734394, 2.405332, 1, 0, 0, 1, 1,
0.4260235, -0.1693737, 2.055419, 0, 0, 0, 1, 1,
0.4327253, 0.6431717, 0.8400658, 0, 0, 0, 1, 1,
0.4332404, 0.3465297, 1.664637, 0, 0, 0, 1, 1,
0.4350092, -1.108384, 3.825432, 0, 0, 0, 1, 1,
0.4351282, 0.2261301, 0.8687904, 0, 0, 0, 1, 1,
0.4380318, 0.1710165, 1.899722, 0, 0, 0, 1, 1,
0.4393556, 0.8762697, 1.913032, 0, 0, 0, 1, 1,
0.4426615, 1.042071, 0.2325834, 1, 1, 1, 1, 1,
0.444481, 0.8462271, 1.518586, 1, 1, 1, 1, 1,
0.4445764, 1.630432, -1.102099, 1, 1, 1, 1, 1,
0.444859, 0.06741249, 1.055939, 1, 1, 1, 1, 1,
0.4485932, -0.1228261, 2.483948, 1, 1, 1, 1, 1,
0.449906, 0.300752, 1.22903, 1, 1, 1, 1, 1,
0.4513586, 0.5695873, 1.241927, 1, 1, 1, 1, 1,
0.4534028, -0.583059, 0.8862797, 1, 1, 1, 1, 1,
0.4558167, 0.06354138, 2.913921, 1, 1, 1, 1, 1,
0.4563321, -0.06910418, 1.205324, 1, 1, 1, 1, 1,
0.46061, 1.524545, 0.2059384, 1, 1, 1, 1, 1,
0.4619851, -0.6867038, 1.605217, 1, 1, 1, 1, 1,
0.4628291, -2.299424, 3.539848, 1, 1, 1, 1, 1,
0.4632927, -1.051515, 3.491671, 1, 1, 1, 1, 1,
0.4640034, 0.2201555, 0.3952972, 1, 1, 1, 1, 1,
0.4648333, -1.182048, 2.729917, 0, 0, 1, 1, 1,
0.4678616, -0.2743596, 2.780988, 1, 0, 0, 1, 1,
0.4695643, -0.3856847, 2.003344, 1, 0, 0, 1, 1,
0.4718304, -0.5069023, 4.28362, 1, 0, 0, 1, 1,
0.4721883, 0.3966462, 0.6938064, 1, 0, 0, 1, 1,
0.4836306, -0.1934834, 3.390247, 1, 0, 0, 1, 1,
0.4868327, 0.8388157, 1.244807, 0, 0, 0, 1, 1,
0.4880563, 0.8507561, 1.600594, 0, 0, 0, 1, 1,
0.4908323, -1.12193, 5.361702, 0, 0, 0, 1, 1,
0.4959745, -1.462043, 2.991342, 0, 0, 0, 1, 1,
0.4991306, -1.181272, 4.206371, 0, 0, 0, 1, 1,
0.5021046, -0.9728632, 2.302261, 0, 0, 0, 1, 1,
0.5022732, -0.1353129, 1.478714, 0, 0, 0, 1, 1,
0.5025657, 0.3810202, 2.708225, 1, 1, 1, 1, 1,
0.5079677, -1.025924, 2.754464, 1, 1, 1, 1, 1,
0.5084378, -0.3851612, 1.226859, 1, 1, 1, 1, 1,
0.5098305, -0.5107212, 2.631136, 1, 1, 1, 1, 1,
0.5100908, -0.6465954, 1.379563, 1, 1, 1, 1, 1,
0.510953, -0.4841909, 2.746811, 1, 1, 1, 1, 1,
0.5208675, 1.114439, 0.9260679, 1, 1, 1, 1, 1,
0.5214591, -1.796039, 3.285517, 1, 1, 1, 1, 1,
0.5260279, 0.4074691, 1.197601, 1, 1, 1, 1, 1,
0.5266508, 0.8591405, -1.191375, 1, 1, 1, 1, 1,
0.5271213, 0.4485444, 0.7440391, 1, 1, 1, 1, 1,
0.531447, 0.07367179, 2.560862, 1, 1, 1, 1, 1,
0.532193, 0.4354756, -0.1348972, 1, 1, 1, 1, 1,
0.5325996, -0.5865342, 2.626464, 1, 1, 1, 1, 1,
0.542615, -1.980227, 2.286278, 1, 1, 1, 1, 1,
0.5439815, -0.2021872, 0.8194946, 0, 0, 1, 1, 1,
0.54514, -0.8392137, 2.280868, 1, 0, 0, 1, 1,
0.5518727, -0.6774368, 2.047141, 1, 0, 0, 1, 1,
0.5621932, 0.8145678, 2.254948, 1, 0, 0, 1, 1,
0.5650874, -0.6647764, 0.9782426, 1, 0, 0, 1, 1,
0.5651134, 1.058024, 1.661573, 1, 0, 0, 1, 1,
0.5662304, 1.554494, 1.274036, 0, 0, 0, 1, 1,
0.5722805, -0.03544608, 2.27925, 0, 0, 0, 1, 1,
0.5737942, -0.2800106, 1.590904, 0, 0, 0, 1, 1,
0.5770129, -0.05477796, 2.312695, 0, 0, 0, 1, 1,
0.5809546, 1.673602, 0.9272947, 0, 0, 0, 1, 1,
0.5868586, 1.264678, 1.701963, 0, 0, 0, 1, 1,
0.5895694, -0.2771146, 2.209616, 0, 0, 0, 1, 1,
0.5913403, 2.29443, -0.3165782, 1, 1, 1, 1, 1,
0.5919523, 0.4621568, -0.8747253, 1, 1, 1, 1, 1,
0.5950676, -0.04443354, 2.682643, 1, 1, 1, 1, 1,
0.6010226, 3.45766, -0.1679216, 1, 1, 1, 1, 1,
0.6016545, -0.6497058, 2.265194, 1, 1, 1, 1, 1,
0.6021631, 0.4872237, 2.220422, 1, 1, 1, 1, 1,
0.6062822, -0.2600201, 1.191326, 1, 1, 1, 1, 1,
0.6192366, 0.1198799, 2.620937, 1, 1, 1, 1, 1,
0.6218367, -1.941207, 4.621766, 1, 1, 1, 1, 1,
0.625536, 1.561688, -0.8207415, 1, 1, 1, 1, 1,
0.629733, 1.173482, 0.7691997, 1, 1, 1, 1, 1,
0.6351591, 1.566856, 0.7077929, 1, 1, 1, 1, 1,
0.6366447, -0.4741451, 1.418293, 1, 1, 1, 1, 1,
0.6390404, 1.104021, 1.053474, 1, 1, 1, 1, 1,
0.6441746, -0.2361606, 0.7436676, 1, 1, 1, 1, 1,
0.6480529, -1.72472, 3.622583, 0, 0, 1, 1, 1,
0.6510293, 0.4140421, -0.2588748, 1, 0, 0, 1, 1,
0.6539678, -0.1744459, 0.9898362, 1, 0, 0, 1, 1,
0.6652093, -0.7996969, 2.375683, 1, 0, 0, 1, 1,
0.6692639, 0.5321531, -0.1037123, 1, 0, 0, 1, 1,
0.6712401, -0.02048063, 2.391985, 1, 0, 0, 1, 1,
0.6732899, -0.7626982, 0.5920581, 0, 0, 0, 1, 1,
0.6806147, 0.7633148, 0.09121196, 0, 0, 0, 1, 1,
0.6838815, 1.38497, 1.227483, 0, 0, 0, 1, 1,
0.6839591, -0.298376, 2.712385, 0, 0, 0, 1, 1,
0.6861343, -1.219548, 2.17989, 0, 0, 0, 1, 1,
0.6902559, -1.604639, 2.201696, 0, 0, 0, 1, 1,
0.6941235, -0.658514, 3.111087, 0, 0, 0, 1, 1,
0.6941488, 1.477227, 1.902227, 1, 1, 1, 1, 1,
0.7038338, 0.6652694, 0.9850442, 1, 1, 1, 1, 1,
0.7078191, -1.542012, 2.399952, 1, 1, 1, 1, 1,
0.7134176, 0.01248919, 1.887868, 1, 1, 1, 1, 1,
0.7142008, -2.453798, 3.712984, 1, 1, 1, 1, 1,
0.7259227, 1.613342, -0.9963264, 1, 1, 1, 1, 1,
0.7272771, 1.534829, 0.2679266, 1, 1, 1, 1, 1,
0.7291861, -0.7279252, 1.667515, 1, 1, 1, 1, 1,
0.7363225, 0.6029741, 0.4994547, 1, 1, 1, 1, 1,
0.7383184, -0.723536, 4.698712, 1, 1, 1, 1, 1,
0.7386408, 0.8085475, -0.3496404, 1, 1, 1, 1, 1,
0.7413913, 1.679758, 0.7185396, 1, 1, 1, 1, 1,
0.7471796, -1.155688, 2.722124, 1, 1, 1, 1, 1,
0.7487167, -0.6938198, 0.865967, 1, 1, 1, 1, 1,
0.7504338, 0.262486, 1.161762, 1, 1, 1, 1, 1,
0.7505167, -0.9067782, 2.25736, 0, 0, 1, 1, 1,
0.7526273, 1.465728, 0.557136, 1, 0, 0, 1, 1,
0.7541664, 1.185252, 1.124345, 1, 0, 0, 1, 1,
0.7542405, -0.9149333, 1.851434, 1, 0, 0, 1, 1,
0.7543361, 0.01022646, 0.8838814, 1, 0, 0, 1, 1,
0.7562119, 0.2741768, 0.7582113, 1, 0, 0, 1, 1,
0.760269, 0.2557883, 2.160301, 0, 0, 0, 1, 1,
0.7606181, 1.01878, 0.2161765, 0, 0, 0, 1, 1,
0.7668918, -0.6376787, 1.114998, 0, 0, 0, 1, 1,
0.767647, 0.1060783, 1.008891, 0, 0, 0, 1, 1,
0.7683712, -0.1480431, 2.405463, 0, 0, 0, 1, 1,
0.7726542, -1.71793, 4.576751, 0, 0, 0, 1, 1,
0.7761087, 2.37925, -0.4529656, 0, 0, 0, 1, 1,
0.779224, -1.682807, 1.232449, 1, 1, 1, 1, 1,
0.7805553, -2.452406, 4.507219, 1, 1, 1, 1, 1,
0.7862087, -0.9153686, 1.719168, 1, 1, 1, 1, 1,
0.7865118, 0.9498898, 0.1778554, 1, 1, 1, 1, 1,
0.7915443, -0.8708209, 1.070763, 1, 1, 1, 1, 1,
0.7930664, 0.07225574, -0.06081876, 1, 1, 1, 1, 1,
0.8025703, 0.2435278, 2.510412, 1, 1, 1, 1, 1,
0.8058406, -1.526136, 3.085595, 1, 1, 1, 1, 1,
0.8121895, -0.5369309, 2.446139, 1, 1, 1, 1, 1,
0.8150266, -0.8312863, 2.79089, 1, 1, 1, 1, 1,
0.8196068, 1.371826, -0.03301915, 1, 1, 1, 1, 1,
0.8226958, 0.3929903, 0.1768911, 1, 1, 1, 1, 1,
0.835456, 0.4016685, 1.006694, 1, 1, 1, 1, 1,
0.8370252, 1.798371, -0.1626456, 1, 1, 1, 1, 1,
0.8412365, 0.5722431, 1.967378, 1, 1, 1, 1, 1,
0.8418014, -0.2137266, 0.9474266, 0, 0, 1, 1, 1,
0.8439865, 0.133327, 2.816781, 1, 0, 0, 1, 1,
0.8529322, -0.1190094, 0.8320509, 1, 0, 0, 1, 1,
0.8548239, -0.5281186, -0.699687, 1, 0, 0, 1, 1,
0.8568288, 0.1539586, 1.279922, 1, 0, 0, 1, 1,
0.859559, -0.9840736, 3.79753, 1, 0, 0, 1, 1,
0.8611521, -0.2988282, 2.635155, 0, 0, 0, 1, 1,
0.8665253, -0.3794646, 1.718208, 0, 0, 0, 1, 1,
0.8719376, 2.02139, 1.379203, 0, 0, 0, 1, 1,
0.882571, -0.4930689, 1.356917, 0, 0, 0, 1, 1,
0.8850539, 1.497991, 1.072885, 0, 0, 0, 1, 1,
0.887947, 1.200857, 1.415223, 0, 0, 0, 1, 1,
0.8886929, 0.09469632, 0.2189877, 0, 0, 0, 1, 1,
0.8897922, 1.347612, -0.5371072, 1, 1, 1, 1, 1,
0.8959981, 0.9345027, 0.6054184, 1, 1, 1, 1, 1,
0.8975506, -0.1336583, 0.9559902, 1, 1, 1, 1, 1,
0.8980379, 1.778119, 1.302941, 1, 1, 1, 1, 1,
0.911399, 0.298291, -1.012898, 1, 1, 1, 1, 1,
0.9171511, -0.4807691, 2.880563, 1, 1, 1, 1, 1,
0.9177814, 1.831123, 0.9140317, 1, 1, 1, 1, 1,
0.920894, 1.007141, -0.1415267, 1, 1, 1, 1, 1,
0.9210383, -0.04848097, 2.108744, 1, 1, 1, 1, 1,
0.9264314, 0.625067, 0.2761782, 1, 1, 1, 1, 1,
0.9322306, 0.8018301, 2.247624, 1, 1, 1, 1, 1,
0.935114, 1.339495, -0.2559913, 1, 1, 1, 1, 1,
0.9371033, 0.6346967, 0.7757236, 1, 1, 1, 1, 1,
0.9437912, -0.2083812, 2.691355, 1, 1, 1, 1, 1,
0.9450384, -0.01960498, 2.709489, 1, 1, 1, 1, 1,
0.9477401, -0.9866157, -0.05547182, 0, 0, 1, 1, 1,
0.9521121, -0.2599519, 0.336617, 1, 0, 0, 1, 1,
0.9543801, 0.6635647, 1.474238, 1, 0, 0, 1, 1,
0.9563899, -0.06202227, 0.26936, 1, 0, 0, 1, 1,
0.9616675, -0.1642778, 1.793419, 1, 0, 0, 1, 1,
0.9638649, 0.327768, 1.281037, 1, 0, 0, 1, 1,
0.9655076, 0.001293142, -1.300901, 0, 0, 0, 1, 1,
0.9673893, 0.5192081, 0.332472, 0, 0, 0, 1, 1,
0.9674175, 0.09933817, -0.2720589, 0, 0, 0, 1, 1,
0.968677, 1.297322, 0.8812449, 0, 0, 0, 1, 1,
0.9746277, 0.4121559, 0.3170091, 0, 0, 0, 1, 1,
0.9756293, -1.242747, -0.1230583, 0, 0, 0, 1, 1,
0.9842511, -1.158848, 1.113194, 0, 0, 0, 1, 1,
0.9850707, -0.7873369, 2.718102, 1, 1, 1, 1, 1,
0.9864763, -1.744843, 3.510266, 1, 1, 1, 1, 1,
0.9918149, 1.091882, 0.3296521, 1, 1, 1, 1, 1,
1.002855, 0.5164609, 1.249032, 1, 1, 1, 1, 1,
1.00464, -1.043206, 2.101818, 1, 1, 1, 1, 1,
1.016383, -1.018695, 1.196347, 1, 1, 1, 1, 1,
1.017861, 1.057236, 0.414048, 1, 1, 1, 1, 1,
1.018762, -1.141197, 1.319845, 1, 1, 1, 1, 1,
1.020461, -0.486621, 2.781262, 1, 1, 1, 1, 1,
1.023956, 0.07397551, 1.165725, 1, 1, 1, 1, 1,
1.024376, -0.7772119, 1.920345, 1, 1, 1, 1, 1,
1.025541, 0.0329558, 0.5300401, 1, 1, 1, 1, 1,
1.033541, -0.2395021, 0.7419259, 1, 1, 1, 1, 1,
1.039622, -0.437746, 2.1781, 1, 1, 1, 1, 1,
1.043661, -1.361788, 3.857525, 1, 1, 1, 1, 1,
1.055199, 0.137268, 1.16572, 0, 0, 1, 1, 1,
1.056419, 1.049757, 1.346104, 1, 0, 0, 1, 1,
1.056828, 0.4255107, 3.149863, 1, 0, 0, 1, 1,
1.057784, -0.2965792, 2.079709, 1, 0, 0, 1, 1,
1.059573, -0.01321083, 2.800423, 1, 0, 0, 1, 1,
1.060027, 1.432509, 1.244008, 1, 0, 0, 1, 1,
1.063596, 0.1478756, 0.1610824, 0, 0, 0, 1, 1,
1.06851, 0.7541752, 0.8888251, 0, 0, 0, 1, 1,
1.082342, 1.776147, 2.710229, 0, 0, 0, 1, 1,
1.097593, 0.1164138, 0.473775, 0, 0, 0, 1, 1,
1.097654, -2.130985, 1.746201, 0, 0, 0, 1, 1,
1.098958, 0.3331233, 2.596561, 0, 0, 0, 1, 1,
1.099077, -0.5888184, 2.172258, 0, 0, 0, 1, 1,
1.104082, 0.635028, 2.407149, 1, 1, 1, 1, 1,
1.104415, -0.4925639, 2.267938, 1, 1, 1, 1, 1,
1.128858, 0.0121877, 1.997519, 1, 1, 1, 1, 1,
1.13961, -0.9925577, 3.009216, 1, 1, 1, 1, 1,
1.143887, 0.0852617, 0.08701239, 1, 1, 1, 1, 1,
1.146142, -0.173628, 0.4724689, 1, 1, 1, 1, 1,
1.156365, -1.465777, 2.527481, 1, 1, 1, 1, 1,
1.157569, -0.03612711, 1.582662, 1, 1, 1, 1, 1,
1.160454, -2.269385, 4.489145, 1, 1, 1, 1, 1,
1.169214, -0.8612542, 1.902444, 1, 1, 1, 1, 1,
1.181009, -0.9209239, 3.341135, 1, 1, 1, 1, 1,
1.187923, -0.2622028, 2.31515, 1, 1, 1, 1, 1,
1.189005, 0.07312375, 0.9118344, 1, 1, 1, 1, 1,
1.19417, -2.693352, 3.907793, 1, 1, 1, 1, 1,
1.194177, -0.6914405, 2.935602, 1, 1, 1, 1, 1,
1.198989, -1.561855, 1.337187, 0, 0, 1, 1, 1,
1.200761, -0.3654903, 2.408866, 1, 0, 0, 1, 1,
1.206475, -0.01962501, 3.689905, 1, 0, 0, 1, 1,
1.20761, -0.1562545, 0.2119919, 1, 0, 0, 1, 1,
1.211983, -0.2525415, 0.7475424, 1, 0, 0, 1, 1,
1.212373, -0.1114415, 2.4941, 1, 0, 0, 1, 1,
1.215148, -0.8219531, -0.2201252, 0, 0, 0, 1, 1,
1.227429, -0.3859456, 2.35287, 0, 0, 0, 1, 1,
1.239901, 0.4139682, 2.640836, 0, 0, 0, 1, 1,
1.240355, 0.0613542, 1.650714, 0, 0, 0, 1, 1,
1.24248, -2.460396, 2.027077, 0, 0, 0, 1, 1,
1.242927, 0.864348, 1.423115, 0, 0, 0, 1, 1,
1.24907, 0.474666, 0.4902516, 0, 0, 0, 1, 1,
1.249725, 0.8787645, -0.9741578, 1, 1, 1, 1, 1,
1.269345, 0.499051, -0.8322875, 1, 1, 1, 1, 1,
1.271541, 1.101007, 2.327391, 1, 1, 1, 1, 1,
1.275634, -0.1951284, -0.06523267, 1, 1, 1, 1, 1,
1.282869, -0.9325705, 3.138629, 1, 1, 1, 1, 1,
1.287683, -1.578541, 2.7385, 1, 1, 1, 1, 1,
1.290745, 1.034912, 0.5227618, 1, 1, 1, 1, 1,
1.291067, 0.02102272, 1.857564, 1, 1, 1, 1, 1,
1.293247, 1.344899, 0.719419, 1, 1, 1, 1, 1,
1.295104, -1.18337, 1.489217, 1, 1, 1, 1, 1,
1.295855, 1.402369, 0.2026177, 1, 1, 1, 1, 1,
1.299894, -0.9952015, 2.064517, 1, 1, 1, 1, 1,
1.301558, -0.791464, 2.262674, 1, 1, 1, 1, 1,
1.302572, 0.5929192, -0.5997456, 1, 1, 1, 1, 1,
1.30262, 1.716931, 0.4197797, 1, 1, 1, 1, 1,
1.309797, -0.4181074, 1.8338, 0, 0, 1, 1, 1,
1.310499, 0.2043333, 2.39339, 1, 0, 0, 1, 1,
1.314036, -1.096866, 3.077232, 1, 0, 0, 1, 1,
1.317108, -1.212699, 2.127377, 1, 0, 0, 1, 1,
1.321113, -0.5657855, 1.549623, 1, 0, 0, 1, 1,
1.321546, -0.4145789, 2.752601, 1, 0, 0, 1, 1,
1.321727, 0.4520153, 0.6284028, 0, 0, 0, 1, 1,
1.323399, -0.007085684, 1.832338, 0, 0, 0, 1, 1,
1.327212, -0.9430065, 1.941209, 0, 0, 0, 1, 1,
1.328402, -0.1576646, 1.217604, 0, 0, 0, 1, 1,
1.337591, -1.084717, 1.80489, 0, 0, 0, 1, 1,
1.337921, -0.4181864, 2.064157, 0, 0, 0, 1, 1,
1.343349, -1.093685, 2.871664, 0, 0, 0, 1, 1,
1.346722, 2.359324, 1.099248, 1, 1, 1, 1, 1,
1.357964, 0.5776373, 1.15022, 1, 1, 1, 1, 1,
1.359837, -1.968824, 2.443373, 1, 1, 1, 1, 1,
1.365291, 0.5175794, 0.1016449, 1, 1, 1, 1, 1,
1.36632, -0.2938855, 0.784238, 1, 1, 1, 1, 1,
1.379406, 0.3316306, -0.08954158, 1, 1, 1, 1, 1,
1.3915, -1.852968, 1.336801, 1, 1, 1, 1, 1,
1.407304, -0.4537036, 2.404678, 1, 1, 1, 1, 1,
1.423597, -0.7084392, 0.04034122, 1, 1, 1, 1, 1,
1.425427, 0.3552242, 2.266577, 1, 1, 1, 1, 1,
1.438041, -0.6383541, 3.919412, 1, 1, 1, 1, 1,
1.439123, 0.6598185, 0.1400665, 1, 1, 1, 1, 1,
1.4393, 1.009273, -0.6966072, 1, 1, 1, 1, 1,
1.452693, 0.2252685, 0.5037783, 1, 1, 1, 1, 1,
1.453768, -0.2005613, -0.2377458, 1, 1, 1, 1, 1,
1.45533, 4.232046, 0.8829426, 0, 0, 1, 1, 1,
1.456015, -0.7692965, 2.366816, 1, 0, 0, 1, 1,
1.457067, 1.704477, 2.518023, 1, 0, 0, 1, 1,
1.457515, -0.6786962, 2.867445, 1, 0, 0, 1, 1,
1.457907, -1.219876, 4.793863, 1, 0, 0, 1, 1,
1.461352, -0.6850647, 2.555859, 1, 0, 0, 1, 1,
1.479753, -0.8765352, 1.961213, 0, 0, 0, 1, 1,
1.479944, 0.4698365, 2.581049, 0, 0, 0, 1, 1,
1.480075, -0.2752338, 2.826385, 0, 0, 0, 1, 1,
1.483285, -0.09202491, 2.410765, 0, 0, 0, 1, 1,
1.48652, 1.49028, 0.9689665, 0, 0, 0, 1, 1,
1.489347, -0.2927991, 0.3479756, 0, 0, 0, 1, 1,
1.489751, 0.8763455, 0.9948831, 0, 0, 0, 1, 1,
1.490164, 0.01487867, 1.458314, 1, 1, 1, 1, 1,
1.4924, 0.05150957, 1.814432, 1, 1, 1, 1, 1,
1.496211, 0.4365493, 1.145364, 1, 1, 1, 1, 1,
1.49669, -0.8367344, 1.705808, 1, 1, 1, 1, 1,
1.497853, -0.6518412, 1.700542, 1, 1, 1, 1, 1,
1.498685, 0.2124873, 1.516782, 1, 1, 1, 1, 1,
1.498879, -1.484733, 2.810645, 1, 1, 1, 1, 1,
1.511323, 1.022449, -1.567949, 1, 1, 1, 1, 1,
1.521829, 0.6823317, -1.23325, 1, 1, 1, 1, 1,
1.529006, -0.2535269, -0.8771022, 1, 1, 1, 1, 1,
1.543432, -1.228112, 1.225185, 1, 1, 1, 1, 1,
1.55384, 1.004022, 0.6884555, 1, 1, 1, 1, 1,
1.579288, -1.031977, 1.173713, 1, 1, 1, 1, 1,
1.583222, 1.566539, 0.8449841, 1, 1, 1, 1, 1,
1.593326, 0.8450925, 2.228468, 1, 1, 1, 1, 1,
1.596823, -0.9042669, 2.637506, 0, 0, 1, 1, 1,
1.621535, 0.5319516, 1.804337, 1, 0, 0, 1, 1,
1.630048, -1.293737, 0.9966694, 1, 0, 0, 1, 1,
1.645691, 1.286259, -1.432061, 1, 0, 0, 1, 1,
1.645697, -0.5967438, 1.566331, 1, 0, 0, 1, 1,
1.655598, 1.004526, -0.06631283, 1, 0, 0, 1, 1,
1.658168, -1.435928, 3.336696, 0, 0, 0, 1, 1,
1.66117, 0.8407319, 0.9404601, 0, 0, 0, 1, 1,
1.670961, 0.6232389, 1.050719, 0, 0, 0, 1, 1,
1.686899, 1.276867, 0.5478514, 0, 0, 0, 1, 1,
1.712137, 1.572715, 1.247601, 0, 0, 0, 1, 1,
1.720698, 0.6061609, -0.4596462, 0, 0, 0, 1, 1,
1.749693, 0.4357468, 2.45545, 0, 0, 0, 1, 1,
1.757959, -0.1036007, 0.6884983, 1, 1, 1, 1, 1,
1.760993, -2.103171, 3.170229, 1, 1, 1, 1, 1,
1.775598, 0.4206589, 0.1535728, 1, 1, 1, 1, 1,
1.852997, -0.6963899, 1.620149, 1, 1, 1, 1, 1,
1.858431, -1.307148, 1.070049, 1, 1, 1, 1, 1,
1.872007, 0.3158515, 0.3757792, 1, 1, 1, 1, 1,
1.879193, -0.5194558, 1.95914, 1, 1, 1, 1, 1,
1.879711, -0.2111393, 1.531869, 1, 1, 1, 1, 1,
1.880545, -0.8788936, 1.272434, 1, 1, 1, 1, 1,
1.891412, 0.5250271, 1.972656, 1, 1, 1, 1, 1,
1.911536, 1.259623, 0.3999006, 1, 1, 1, 1, 1,
1.954229, -1.043972, 2.814932, 1, 1, 1, 1, 1,
1.959623, 0.6781221, 2.63846, 1, 1, 1, 1, 1,
1.970968, 0.8994454, 2.323078, 1, 1, 1, 1, 1,
1.979151, -1.891638, 3.909972, 1, 1, 1, 1, 1,
1.982565, 0.09695233, 1.349755, 0, 0, 1, 1, 1,
1.999176, -0.3911814, 3.121136, 1, 0, 0, 1, 1,
2.001639, 1.304475, -1.127296, 1, 0, 0, 1, 1,
2.068027, 1.575377, -0.07226566, 1, 0, 0, 1, 1,
2.075005, 1.051464, 2.116648, 1, 0, 0, 1, 1,
2.099839, 2.457191, 0.5133711, 1, 0, 0, 1, 1,
2.103057, -1.61414, 2.156873, 0, 0, 0, 1, 1,
2.109327, -0.4784878, 2.700294, 0, 0, 0, 1, 1,
2.142604, -1.468469, 2.496684, 0, 0, 0, 1, 1,
2.146167, 0.8014055, 0.4373433, 0, 0, 0, 1, 1,
2.153294, -0.5543922, 0.7322667, 0, 0, 0, 1, 1,
2.177988, 1.050994, 0.3549866, 0, 0, 0, 1, 1,
2.240279, -0.7383797, 3.406157, 0, 0, 0, 1, 1,
2.253885, -0.9847203, 2.360487, 1, 1, 1, 1, 1,
2.332391, 1.214937, 1.291946, 1, 1, 1, 1, 1,
2.428537, -0.2678012, -0.9435928, 1, 1, 1, 1, 1,
2.51854, 0.72874, 0.1855222, 1, 1, 1, 1, 1,
3.208664, 1.256594, 1.698168, 1, 1, 1, 1, 1,
3.407717, 0.9597921, 2.843348, 1, 1, 1, 1, 1,
3.622862, -0.02239541, 2.22023, 1, 1, 1, 1, 1
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
var radius = 10.09182;
var distance = 35.44709;
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
mvMatrix.translate( -0.1657529, -0.3735259, -0.19854 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.44709);
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