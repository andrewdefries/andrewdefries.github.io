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
-2.939332, 1.579962, -1.088942, 1, 0, 0, 1,
-2.911942, -0.6468034, -0.4720476, 1, 0.007843138, 0, 1,
-2.895315, -1.398105, -1.551607, 1, 0.01176471, 0, 1,
-2.771139, -0.2697815, -2.928811, 1, 0.01960784, 0, 1,
-2.729496, -0.07853374, -1.950288, 1, 0.02352941, 0, 1,
-2.699999, 0.5472358, -1.37742, 1, 0.03137255, 0, 1,
-2.629092, -0.008810749, -1.486588, 1, 0.03529412, 0, 1,
-2.58773, -0.4496127, -0.452111, 1, 0.04313726, 0, 1,
-2.514229, 0.5327455, -1.091179, 1, 0.04705882, 0, 1,
-2.428766, 1.466764, 0.1507789, 1, 0.05490196, 0, 1,
-2.31163, -0.5574017, -3.26589, 1, 0.05882353, 0, 1,
-2.23128, 0.858272, 0.09578379, 1, 0.06666667, 0, 1,
-2.178499, -0.1037977, -1.319891, 1, 0.07058824, 0, 1,
-2.170181, -0.8016295, -2.815473, 1, 0.07843138, 0, 1,
-2.163824, -1.090847, -1.400041, 1, 0.08235294, 0, 1,
-2.156241, -0.4325362, -1.912775, 1, 0.09019608, 0, 1,
-2.154936, -0.996838, -1.092082, 1, 0.09411765, 0, 1,
-2.152828, -0.9323012, -2.372986, 1, 0.1019608, 0, 1,
-2.145882, -0.326187, -1.343538, 1, 0.1098039, 0, 1,
-2.139316, 0.7074852, -1.363587, 1, 0.1137255, 0, 1,
-2.133222, 0.4220912, 1.173331, 1, 0.1215686, 0, 1,
-2.132465, -0.1180087, -1.641941, 1, 0.1254902, 0, 1,
-2.123454, 0.7845332, -2.13171, 1, 0.1333333, 0, 1,
-2.087181, 1.076049, -1.800546, 1, 0.1372549, 0, 1,
-2.042961, 1.210367, 0.5867172, 1, 0.145098, 0, 1,
-2.039428, 0.5365006, -1.930889, 1, 0.1490196, 0, 1,
-2.036046, 3.063531, -0.2787471, 1, 0.1568628, 0, 1,
-2.031825, -0.2349981, -0.7905082, 1, 0.1607843, 0, 1,
-2.025971, 0.3361228, -1.914086, 1, 0.1686275, 0, 1,
-2.013711, -0.8503169, -1.101172, 1, 0.172549, 0, 1,
-1.99674, 1.210672, 0.9920736, 1, 0.1803922, 0, 1,
-1.993494, -1.130515, -3.347642, 1, 0.1843137, 0, 1,
-1.980034, 1.019049, -0.162055, 1, 0.1921569, 0, 1,
-1.945441, -1.401661, -2.661119, 1, 0.1960784, 0, 1,
-1.931659, -0.99782, -1.200206, 1, 0.2039216, 0, 1,
-1.90032, 0.1296228, -1.65951, 1, 0.2117647, 0, 1,
-1.858454, -1.524301, -2.30054, 1, 0.2156863, 0, 1,
-1.842533, -1.732484, -2.2159, 1, 0.2235294, 0, 1,
-1.801389, -0.4816067, -1.48569, 1, 0.227451, 0, 1,
-1.792505, 0.6992972, -0.01850607, 1, 0.2352941, 0, 1,
-1.754893, 0.08219327, -1.877643, 1, 0.2392157, 0, 1,
-1.754194, 0.8258961, -0.2456196, 1, 0.2470588, 0, 1,
-1.732524, 0.52596, -0.1234542, 1, 0.2509804, 0, 1,
-1.724525, 1.279654, -1.583904, 1, 0.2588235, 0, 1,
-1.717467, 0.3014401, -1.04502, 1, 0.2627451, 0, 1,
-1.704203, -0.7160489, -2.061364, 1, 0.2705882, 0, 1,
-1.690352, -0.642338, -2.33973, 1, 0.2745098, 0, 1,
-1.687422, 0.1040064, 0.1208103, 1, 0.282353, 0, 1,
-1.684586, 0.2141492, -2.676324, 1, 0.2862745, 0, 1,
-1.669863, -1.236713, -2.350063, 1, 0.2941177, 0, 1,
-1.664063, 1.296868, -1.261692, 1, 0.3019608, 0, 1,
-1.65921, 0.8193346, 0.4761108, 1, 0.3058824, 0, 1,
-1.659107, -0.2663767, -1.854896, 1, 0.3137255, 0, 1,
-1.656635, -1.179913, -1.471609, 1, 0.3176471, 0, 1,
-1.648997, -0.3555982, -2.923014, 1, 0.3254902, 0, 1,
-1.643902, 1.2947, 1.041296, 1, 0.3294118, 0, 1,
-1.627321, 0.1574124, -2.995191, 1, 0.3372549, 0, 1,
-1.625472, 0.4361315, 0.9302059, 1, 0.3411765, 0, 1,
-1.615538, -0.06849156, -1.573328, 1, 0.3490196, 0, 1,
-1.607898, 0.2262477, -0.6850194, 1, 0.3529412, 0, 1,
-1.60682, 1.629178, -0.9720784, 1, 0.3607843, 0, 1,
-1.599667, 0.9626815, -1.713901, 1, 0.3647059, 0, 1,
-1.59372, -1.076941, -2.7954, 1, 0.372549, 0, 1,
-1.5906, -0.1112662, -3.410983, 1, 0.3764706, 0, 1,
-1.590165, -0.1423394, -1.428302, 1, 0.3843137, 0, 1,
-1.583207, 1.800807, 0.6433088, 1, 0.3882353, 0, 1,
-1.580207, 0.1538129, -1.493051, 1, 0.3960784, 0, 1,
-1.577034, -0.7257209, -2.307476, 1, 0.4039216, 0, 1,
-1.558392, -1.034973, -2.751817, 1, 0.4078431, 0, 1,
-1.547774, -0.4474669, -0.7186955, 1, 0.4156863, 0, 1,
-1.544967, 1.786275, -1.179434, 1, 0.4196078, 0, 1,
-1.542614, 0.3564337, -0.4674024, 1, 0.427451, 0, 1,
-1.537632, -0.05661602, -0.4299851, 1, 0.4313726, 0, 1,
-1.531291, -0.01052529, -1.750502, 1, 0.4392157, 0, 1,
-1.523753, 0.6588158, -1.513845, 1, 0.4431373, 0, 1,
-1.518868, 1.04728, -3.107363, 1, 0.4509804, 0, 1,
-1.491341, -1.005372, -3.976788, 1, 0.454902, 0, 1,
-1.487882, 0.4546438, -2.336464, 1, 0.4627451, 0, 1,
-1.480577, -1.372199, -0.5551369, 1, 0.4666667, 0, 1,
-1.479919, -2.421744, -2.790813, 1, 0.4745098, 0, 1,
-1.472982, 0.6805204, -1.912225, 1, 0.4784314, 0, 1,
-1.441809, 0.4800148, -0.3713862, 1, 0.4862745, 0, 1,
-1.441609, 0.003193168, -1.389732, 1, 0.4901961, 0, 1,
-1.441208, 0.1892161, -1.758315, 1, 0.4980392, 0, 1,
-1.434273, -1.780833, -3.156227, 1, 0.5058824, 0, 1,
-1.433878, 0.8679509, -1.2092, 1, 0.509804, 0, 1,
-1.422246, -1.020552, -2.020204, 1, 0.5176471, 0, 1,
-1.41487, -0.07311906, -4.091067, 1, 0.5215687, 0, 1,
-1.403062, 1.302691, -0.9354122, 1, 0.5294118, 0, 1,
-1.401787, -0.6186983, -1.668477, 1, 0.5333334, 0, 1,
-1.399014, 0.2960594, -2.332889, 1, 0.5411765, 0, 1,
-1.397977, -0.9486471, -0.6850486, 1, 0.5450981, 0, 1,
-1.383504, 0.9796928, -2.648567, 1, 0.5529412, 0, 1,
-1.373179, 1.176471, -1.747339, 1, 0.5568628, 0, 1,
-1.371366, 0.2831419, -3.699068, 1, 0.5647059, 0, 1,
-1.366233, 2.363529, 0.07486293, 1, 0.5686275, 0, 1,
-1.360623, -1.666828, -2.91204, 1, 0.5764706, 0, 1,
-1.360282, 1.255603, -1.524687, 1, 0.5803922, 0, 1,
-1.355087, -0.5748079, -3.033999, 1, 0.5882353, 0, 1,
-1.34361, -0.3770323, -1.476162, 1, 0.5921569, 0, 1,
-1.341907, 0.3179193, -2.274877, 1, 0.6, 0, 1,
-1.330079, -0.8888606, -1.205453, 1, 0.6078432, 0, 1,
-1.323738, 0.3827992, -2.223177, 1, 0.6117647, 0, 1,
-1.32105, -0.4217589, -3.591539, 1, 0.6196079, 0, 1,
-1.320898, 0.4431992, -0.5774884, 1, 0.6235294, 0, 1,
-1.316779, 0.1154539, -1.676086, 1, 0.6313726, 0, 1,
-1.315679, 0.997555, 0.1275432, 1, 0.6352941, 0, 1,
-1.31356, 0.8295718, -1.270657, 1, 0.6431373, 0, 1,
-1.297865, 1.159275, -0.7685028, 1, 0.6470588, 0, 1,
-1.297758, 2.514306, -0.860674, 1, 0.654902, 0, 1,
-1.29615, 0.6474299, -0.7895251, 1, 0.6588235, 0, 1,
-1.295076, 0.96035, -0.396067, 1, 0.6666667, 0, 1,
-1.294981, 0.3872685, -0.1161188, 1, 0.6705883, 0, 1,
-1.289972, -1.147662, -2.657945, 1, 0.6784314, 0, 1,
-1.275904, 1.847788, -0.7922051, 1, 0.682353, 0, 1,
-1.270886, -0.4868053, -2.134945, 1, 0.6901961, 0, 1,
-1.260062, 1.502365, 0.7074845, 1, 0.6941177, 0, 1,
-1.256238, -1.64087, -2.91397, 1, 0.7019608, 0, 1,
-1.243997, -1.483457, -2.623191, 1, 0.7098039, 0, 1,
-1.237037, 0.3025569, -0.6383008, 1, 0.7137255, 0, 1,
-1.236944, -0.8343229, -2.422181, 1, 0.7215686, 0, 1,
-1.227308, 0.982846, -0.6603246, 1, 0.7254902, 0, 1,
-1.224636, -1.555659, -4.474035, 1, 0.7333333, 0, 1,
-1.223305, -2.471081, -1.007559, 1, 0.7372549, 0, 1,
-1.221226, -1.428049, -4.142929, 1, 0.7450981, 0, 1,
-1.213513, 0.5389028, -2.727723, 1, 0.7490196, 0, 1,
-1.21023, 1.479332, -0.1346906, 1, 0.7568628, 0, 1,
-1.210009, 1.027162, -1.358986, 1, 0.7607843, 0, 1,
-1.205696, -0.04325684, -1.536541, 1, 0.7686275, 0, 1,
-1.204439, 0.2055592, -1.615075, 1, 0.772549, 0, 1,
-1.196895, -0.5846399, -1.120327, 1, 0.7803922, 0, 1,
-1.196549, -0.05692483, -3.544183, 1, 0.7843137, 0, 1,
-1.191729, 0.4820668, -1.043806, 1, 0.7921569, 0, 1,
-1.190248, 0.3666568, -0.4883248, 1, 0.7960784, 0, 1,
-1.177586, 0.6395088, -0.7270813, 1, 0.8039216, 0, 1,
-1.175104, 0.2860806, -1.227346, 1, 0.8117647, 0, 1,
-1.173728, -0.0168069, -2.389531, 1, 0.8156863, 0, 1,
-1.166547, -0.4889086, -2.469053, 1, 0.8235294, 0, 1,
-1.16564, -1.482774, -3.368076, 1, 0.827451, 0, 1,
-1.16466, -0.1518336, -0.1545954, 1, 0.8352941, 0, 1,
-1.162834, -1.060017, -1.044728, 1, 0.8392157, 0, 1,
-1.155141, -1.369499, -2.124068, 1, 0.8470588, 0, 1,
-1.14204, -1.155151, -1.410362, 1, 0.8509804, 0, 1,
-1.139751, -0.557373, -1.26718, 1, 0.8588235, 0, 1,
-1.135376, -0.07571535, -1.467813, 1, 0.8627451, 0, 1,
-1.126431, -1.394462, -3.964429, 1, 0.8705882, 0, 1,
-1.122469, 1.151316, -0.3576267, 1, 0.8745098, 0, 1,
-1.120929, -1.711437, -1.297724, 1, 0.8823529, 0, 1,
-1.11657, 0.4451977, -1.739735, 1, 0.8862745, 0, 1,
-1.114656, 2.654886, 0.2285017, 1, 0.8941177, 0, 1,
-1.110759, -0.3039079, -1.560615, 1, 0.8980392, 0, 1,
-1.102709, 0.4885642, 0.05507179, 1, 0.9058824, 0, 1,
-1.097035, -0.0295797, -0.8577454, 1, 0.9137255, 0, 1,
-1.095201, 1.345832, -0.7155201, 1, 0.9176471, 0, 1,
-1.084389, 1.10495, -1.462473, 1, 0.9254902, 0, 1,
-1.080675, 0.1907075, -0.9801075, 1, 0.9294118, 0, 1,
-1.076797, 1.839487, 0.0435424, 1, 0.9372549, 0, 1,
-1.073886, 0.1173181, -2.672882, 1, 0.9411765, 0, 1,
-1.061892, 1.265729, 0.2725042, 1, 0.9490196, 0, 1,
-1.053503, -0.5198146, -2.290397, 1, 0.9529412, 0, 1,
-1.052998, -1.620534, -3.323809, 1, 0.9607843, 0, 1,
-1.036727, -0.8885993, -1.575625, 1, 0.9647059, 0, 1,
-1.033697, -1.396971, -2.180835, 1, 0.972549, 0, 1,
-1.026008, 1.578425, -0.5542856, 1, 0.9764706, 0, 1,
-1.024752, -0.905201, -4.151702, 1, 0.9843137, 0, 1,
-1.011857, -0.09394428, -0.887803, 1, 0.9882353, 0, 1,
-1.007218, 0.9010607, -0.6000424, 1, 0.9960784, 0, 1,
-1.000195, 0.5203236, -3.054851, 0.9960784, 1, 0, 1,
-0.9846704, 0.5915154, -2.461109, 0.9921569, 1, 0, 1,
-0.9833589, -2.267186, -3.093247, 0.9843137, 1, 0, 1,
-0.96999, 0.1539149, -0.7911477, 0.9803922, 1, 0, 1,
-0.9686409, -0.2487409, -1.987192, 0.972549, 1, 0, 1,
-0.9677065, -1.047723, -2.022207, 0.9686275, 1, 0, 1,
-0.9662296, 0.6618744, -1.23471, 0.9607843, 1, 0, 1,
-0.9634092, -1.506927, -2.810632, 0.9568627, 1, 0, 1,
-0.9614549, 2.389245, -2.664972, 0.9490196, 1, 0, 1,
-0.9606209, -0.5144044, -2.122973, 0.945098, 1, 0, 1,
-0.9597353, -0.09243348, -3.162924, 0.9372549, 1, 0, 1,
-0.9542899, 0.8302254, -1.27487, 0.9333333, 1, 0, 1,
-0.9519614, 0.8967854, 0.69715, 0.9254902, 1, 0, 1,
-0.9448859, -0.7544803, -1.803544, 0.9215686, 1, 0, 1,
-0.9406342, -0.1315088, -1.257251, 0.9137255, 1, 0, 1,
-0.9349109, -1.444522, -1.737403, 0.9098039, 1, 0, 1,
-0.9263175, -0.3374424, -1.515774, 0.9019608, 1, 0, 1,
-0.9259669, -0.1088107, -1.784759, 0.8941177, 1, 0, 1,
-0.9224494, 1.589581, -0.7033968, 0.8901961, 1, 0, 1,
-0.9185082, -0.1634361, -2.809926, 0.8823529, 1, 0, 1,
-0.9160672, 1.930345, -1.081165, 0.8784314, 1, 0, 1,
-0.9078337, 0.9544661, -1.400966, 0.8705882, 1, 0, 1,
-0.9041353, 1.311818, -0.7451567, 0.8666667, 1, 0, 1,
-0.9002294, 1.065042, -1.991713, 0.8588235, 1, 0, 1,
-0.9002001, 1.182879, -2.032768, 0.854902, 1, 0, 1,
-0.8830844, -0.03701042, -2.177049, 0.8470588, 1, 0, 1,
-0.8810405, 0.8013872, -1.125055, 0.8431373, 1, 0, 1,
-0.8721347, -0.2542242, -0.7763823, 0.8352941, 1, 0, 1,
-0.8661347, -0.002135416, -1.480436, 0.8313726, 1, 0, 1,
-0.8631908, -1.739635, -3.149623, 0.8235294, 1, 0, 1,
-0.8619894, 0.7017568, -1.674407, 0.8196079, 1, 0, 1,
-0.861007, 0.5502397, -1.719323, 0.8117647, 1, 0, 1,
-0.8567589, -1.303055, -2.477617, 0.8078431, 1, 0, 1,
-0.8531982, 0.3274836, -0.6705178, 0.8, 1, 0, 1,
-0.8523515, -0.1158436, -1.322535, 0.7921569, 1, 0, 1,
-0.8441248, -2.0286, -3.645175, 0.7882353, 1, 0, 1,
-0.8245411, -1.273382, -3.270455, 0.7803922, 1, 0, 1,
-0.8172449, -0.171439, 0.2525072, 0.7764706, 1, 0, 1,
-0.8166559, 0.8187376, -0.4782573, 0.7686275, 1, 0, 1,
-0.811351, 1.395529, -0.8718339, 0.7647059, 1, 0, 1,
-0.7999713, 1.23345, -1.720764, 0.7568628, 1, 0, 1,
-0.7917542, -0.5101418, -2.810429, 0.7529412, 1, 0, 1,
-0.7842393, -1.080123, -3.934016, 0.7450981, 1, 0, 1,
-0.7803606, -0.4459278, -0.3738213, 0.7411765, 1, 0, 1,
-0.7780119, -0.2705084, -1.415352, 0.7333333, 1, 0, 1,
-0.7707111, -1.852967, -3.321925, 0.7294118, 1, 0, 1,
-0.7686363, -0.9640049, -2.689451, 0.7215686, 1, 0, 1,
-0.7647389, 0.4431937, -1.781602, 0.7176471, 1, 0, 1,
-0.7644687, 0.6199678, -0.2108566, 0.7098039, 1, 0, 1,
-0.760576, 0.3891521, 0.9864677, 0.7058824, 1, 0, 1,
-0.7578706, 0.5698419, -0.4142511, 0.6980392, 1, 0, 1,
-0.7552711, 1.188491, 0.2867744, 0.6901961, 1, 0, 1,
-0.7541774, 0.5207223, -1.035953, 0.6862745, 1, 0, 1,
-0.7532822, -0.07786959, -1.34199, 0.6784314, 1, 0, 1,
-0.7512246, 0.8227921, 0.2108371, 0.6745098, 1, 0, 1,
-0.7510719, -0.6372039, -0.6329278, 0.6666667, 1, 0, 1,
-0.750532, 0.735755, -1.879564, 0.6627451, 1, 0, 1,
-0.7478992, 0.1913043, -1.718946, 0.654902, 1, 0, 1,
-0.7469434, 1.691403, -0.8498192, 0.6509804, 1, 0, 1,
-0.7443883, 0.9462175, 0.3292747, 0.6431373, 1, 0, 1,
-0.7441917, 0.585891, -0.856793, 0.6392157, 1, 0, 1,
-0.7404798, -0.5388821, -3.993255, 0.6313726, 1, 0, 1,
-0.7396882, 0.2015616, -1.701446, 0.627451, 1, 0, 1,
-0.7396433, -1.044382, -1.986734, 0.6196079, 1, 0, 1,
-0.7392738, -1.384213, -2.587411, 0.6156863, 1, 0, 1,
-0.7366935, -1.277328, -0.8424491, 0.6078432, 1, 0, 1,
-0.7340096, 1.295316, -1.191913, 0.6039216, 1, 0, 1,
-0.7329625, -0.6409191, -1.478962, 0.5960785, 1, 0, 1,
-0.7281809, 1.645753, -0.4341613, 0.5882353, 1, 0, 1,
-0.7269862, -0.6976609, -2.568188, 0.5843138, 1, 0, 1,
-0.7264968, -0.242185, -2.526248, 0.5764706, 1, 0, 1,
-0.725283, -0.05227417, -0.4494149, 0.572549, 1, 0, 1,
-0.7252603, 0.7927001, 1.018586, 0.5647059, 1, 0, 1,
-0.7246978, 0.6975143, -0.5716401, 0.5607843, 1, 0, 1,
-0.7240441, -0.9871877, -1.874886, 0.5529412, 1, 0, 1,
-0.7200916, 0.7735813, -0.1360158, 0.5490196, 1, 0, 1,
-0.7185964, 0.8447726, -0.8802861, 0.5411765, 1, 0, 1,
-0.7166818, -0.1313872, -0.8949118, 0.5372549, 1, 0, 1,
-0.7080996, 0.1621223, -2.095695, 0.5294118, 1, 0, 1,
-0.7079286, -0.9854013, -1.856055, 0.5254902, 1, 0, 1,
-0.7075637, 0.05170349, -2.505166, 0.5176471, 1, 0, 1,
-0.7062722, -2.61738, -2.835932, 0.5137255, 1, 0, 1,
-0.7025554, 0.6475244, -0.9255056, 0.5058824, 1, 0, 1,
-0.7023372, 0.02820037, -1.217323, 0.5019608, 1, 0, 1,
-0.7012464, -2.626742, -0.7740678, 0.4941176, 1, 0, 1,
-0.6938397, 1.009885, -1.110205, 0.4862745, 1, 0, 1,
-0.693204, 0.4385269, 0.4855239, 0.4823529, 1, 0, 1,
-0.6905426, 0.4110392, -0.8854606, 0.4745098, 1, 0, 1,
-0.688985, -0.3399016, -2.072794, 0.4705882, 1, 0, 1,
-0.6872606, 0.3575184, -1.222986, 0.4627451, 1, 0, 1,
-0.6775374, -1.065027, -0.8867587, 0.4588235, 1, 0, 1,
-0.6754584, -0.06494876, 0.3363403, 0.4509804, 1, 0, 1,
-0.6741531, 0.3357621, -0.7297364, 0.4470588, 1, 0, 1,
-0.670383, 0.4116789, -0.715881, 0.4392157, 1, 0, 1,
-0.6698691, -0.05111451, -1.53809, 0.4352941, 1, 0, 1,
-0.6660087, 0.1148266, -0.3618079, 0.427451, 1, 0, 1,
-0.6645991, 0.1906628, -0.3449034, 0.4235294, 1, 0, 1,
-0.663713, 0.4349922, -0.5295888, 0.4156863, 1, 0, 1,
-0.6632696, -2.054683, -2.025288, 0.4117647, 1, 0, 1,
-0.6614984, 1.227821, -0.2370863, 0.4039216, 1, 0, 1,
-0.6592651, 0.09109806, -1.421399, 0.3960784, 1, 0, 1,
-0.6564968, -0.5533594, -1.777025, 0.3921569, 1, 0, 1,
-0.6510563, -0.933781, -3.329334, 0.3843137, 1, 0, 1,
-0.6504879, -0.7135698, -1.387914, 0.3803922, 1, 0, 1,
-0.6450579, -0.002630973, -1.259674, 0.372549, 1, 0, 1,
-0.6437299, -0.4749723, -2.628313, 0.3686275, 1, 0, 1,
-0.6432471, -0.2793816, -1.57639, 0.3607843, 1, 0, 1,
-0.6429155, 1.153018, -1.632868, 0.3568628, 1, 0, 1,
-0.6374621, 0.5089471, -2.333493, 0.3490196, 1, 0, 1,
-0.6367534, -0.37654, -2.45234, 0.345098, 1, 0, 1,
-0.6204282, -0.4711025, -3.434483, 0.3372549, 1, 0, 1,
-0.6085951, -0.333774, -4.974534, 0.3333333, 1, 0, 1,
-0.608459, 1.145378, -1.619911, 0.3254902, 1, 0, 1,
-0.6082697, -0.3826952, -0.3927099, 0.3215686, 1, 0, 1,
-0.6021073, 0.6857398, -1.264244, 0.3137255, 1, 0, 1,
-0.596818, 0.4115807, -0.5798517, 0.3098039, 1, 0, 1,
-0.5965478, -0.02180887, -1.28567, 0.3019608, 1, 0, 1,
-0.5932492, 0.4112377, 0.299897, 0.2941177, 1, 0, 1,
-0.5906893, 0.8317786, -0.9933187, 0.2901961, 1, 0, 1,
-0.5797138, 2.000032, 0.4818562, 0.282353, 1, 0, 1,
-0.5761788, 0.423005, -2.788344, 0.2784314, 1, 0, 1,
-0.5716382, -0.1385038, -3.62624, 0.2705882, 1, 0, 1,
-0.5672799, -0.5940834, -1.913174, 0.2666667, 1, 0, 1,
-0.5645806, 1.860891, 0.4130771, 0.2588235, 1, 0, 1,
-0.5605519, 0.5004756, -1.012481, 0.254902, 1, 0, 1,
-0.5585904, -0.3252252, -2.703475, 0.2470588, 1, 0, 1,
-0.5570018, -1.458336, -3.002115, 0.2431373, 1, 0, 1,
-0.5534248, -0.7511399, -3.778487, 0.2352941, 1, 0, 1,
-0.5510556, 1.867857, -1.48946, 0.2313726, 1, 0, 1,
-0.5487904, 2.147361, 1.389561, 0.2235294, 1, 0, 1,
-0.5484743, -1.093368, -3.057148, 0.2196078, 1, 0, 1,
-0.5462262, 1.818266, 0.6261308, 0.2117647, 1, 0, 1,
-0.5426658, 0.8927391, 0.5718428, 0.2078431, 1, 0, 1,
-0.5418257, -0.2198769, -2.443633, 0.2, 1, 0, 1,
-0.5347982, 0.2509823, -0.04343701, 0.1921569, 1, 0, 1,
-0.5196483, 1.268428, 0.003875645, 0.1882353, 1, 0, 1,
-0.5176145, 0.4825022, 0.04978771, 0.1803922, 1, 0, 1,
-0.5154699, 0.1549126, -0.931911, 0.1764706, 1, 0, 1,
-0.5146603, 0.8634511, -1.553194, 0.1686275, 1, 0, 1,
-0.5069632, -0.3289133, -0.9057747, 0.1647059, 1, 0, 1,
-0.5040122, 0.4977525, 0.1784422, 0.1568628, 1, 0, 1,
-0.5030037, -1.783388, -3.818306, 0.1529412, 1, 0, 1,
-0.4975889, -1.336494, -4.154772, 0.145098, 1, 0, 1,
-0.4923514, 0.8422458, 1.094495, 0.1411765, 1, 0, 1,
-0.4895704, -0.4445143, -1.476827, 0.1333333, 1, 0, 1,
-0.4859502, 1.287657, 0.524529, 0.1294118, 1, 0, 1,
-0.4819248, -1.010912, -2.825024, 0.1215686, 1, 0, 1,
-0.4736903, -0.005850656, -1.848502, 0.1176471, 1, 0, 1,
-0.4729974, -0.9860616, -2.056871, 0.1098039, 1, 0, 1,
-0.4688768, 1.052666, -0.4815941, 0.1058824, 1, 0, 1,
-0.4676687, 1.422492, -0.4421228, 0.09803922, 1, 0, 1,
-0.463909, -0.132264, -2.120088, 0.09019608, 1, 0, 1,
-0.4628595, -2.653084, -4.835059, 0.08627451, 1, 0, 1,
-0.4622249, 1.643097, -2.244872, 0.07843138, 1, 0, 1,
-0.4609145, 0.1854237, -1.973689, 0.07450981, 1, 0, 1,
-0.4607542, 0.4447459, 0.4783129, 0.06666667, 1, 0, 1,
-0.4559774, -1.676595, -3.344726, 0.0627451, 1, 0, 1,
-0.4556582, 2.053371, 0.6275668, 0.05490196, 1, 0, 1,
-0.4548436, 1.49289, -0.8845612, 0.05098039, 1, 0, 1,
-0.4479218, -0.2749074, -0.3276572, 0.04313726, 1, 0, 1,
-0.44486, 2.013591, 0.2634651, 0.03921569, 1, 0, 1,
-0.4441227, -1.266612, -2.932648, 0.03137255, 1, 0, 1,
-0.4432008, -1.097587, -3.698259, 0.02745098, 1, 0, 1,
-0.4413222, 0.9810621, 0.556967, 0.01960784, 1, 0, 1,
-0.4369343, -0.5043299, -3.217607, 0.01568628, 1, 0, 1,
-0.4262486, -0.7309229, -2.343972, 0.007843138, 1, 0, 1,
-0.4257947, -0.5910142, -0.9120405, 0.003921569, 1, 0, 1,
-0.4249185, 1.409607, -2.778485, 0, 1, 0.003921569, 1,
-0.4239416, -0.7197098, -2.179329, 0, 1, 0.01176471, 1,
-0.4233531, 0.5473221, -0.191242, 0, 1, 0.01568628, 1,
-0.4202916, 1.514416, -0.513706, 0, 1, 0.02352941, 1,
-0.409344, -1.086102, -2.614707, 0, 1, 0.02745098, 1,
-0.4073556, 1.477862, 0.1693439, 0, 1, 0.03529412, 1,
-0.4069673, -1.343763, -3.41351, 0, 1, 0.03921569, 1,
-0.4068756, -1.464617, -2.304961, 0, 1, 0.04705882, 1,
-0.4022779, -0.9529064, -3.544632, 0, 1, 0.05098039, 1,
-0.3966002, 0.9037018, 1.700416, 0, 1, 0.05882353, 1,
-0.3958893, 0.6596836, 0.4770904, 0, 1, 0.0627451, 1,
-0.3957758, -0.176738, 0.05647834, 0, 1, 0.07058824, 1,
-0.394612, -0.7140965, -2.243001, 0, 1, 0.07450981, 1,
-0.3932268, 0.3189093, -0.9187244, 0, 1, 0.08235294, 1,
-0.392818, -0.7842323, -2.590929, 0, 1, 0.08627451, 1,
-0.3895705, -1.19066, -4.574904, 0, 1, 0.09411765, 1,
-0.3886154, -1.182152, -4.235871, 0, 1, 0.1019608, 1,
-0.3798276, -1.505621, -3.902704, 0, 1, 0.1058824, 1,
-0.3779045, -1.10102, -2.578105, 0, 1, 0.1137255, 1,
-0.3705271, 1.677192, -1.78071, 0, 1, 0.1176471, 1,
-0.3671596, 1.711313, 0.6954194, 0, 1, 0.1254902, 1,
-0.3663319, 0.4214792, -1.563486, 0, 1, 0.1294118, 1,
-0.3654251, 0.1638438, -0.6504794, 0, 1, 0.1372549, 1,
-0.3615036, -0.02884522, -1.051473, 0, 1, 0.1411765, 1,
-0.3612949, 0.2850271, 0.1859677, 0, 1, 0.1490196, 1,
-0.3586584, -1.137887, -3.541177, 0, 1, 0.1529412, 1,
-0.3567242, 0.3664202, -0.1762229, 0, 1, 0.1607843, 1,
-0.3548053, 0.3454802, -0.06693378, 0, 1, 0.1647059, 1,
-0.3506249, 0.3864296, 0.230455, 0, 1, 0.172549, 1,
-0.3444906, -0.8198966, -5.29237, 0, 1, 0.1764706, 1,
-0.3408581, 1.057359, -0.7133183, 0, 1, 0.1843137, 1,
-0.3388805, -0.1529588, -1.425655, 0, 1, 0.1882353, 1,
-0.3345608, 0.4582886, -0.2345901, 0, 1, 0.1960784, 1,
-0.3336189, -0.1423108, -3.64221, 0, 1, 0.2039216, 1,
-0.3331009, 0.1103279, 0.1300579, 0, 1, 0.2078431, 1,
-0.3329412, -0.4193156, -2.050143, 0, 1, 0.2156863, 1,
-0.3266366, -0.04169066, -0.971791, 0, 1, 0.2196078, 1,
-0.3261861, -0.01471215, 0.7100163, 0, 1, 0.227451, 1,
-0.3249888, 1.139967, 0.4855317, 0, 1, 0.2313726, 1,
-0.3199253, 0.8491576, -1.040986, 0, 1, 0.2392157, 1,
-0.319508, -0.339165, -2.283421, 0, 1, 0.2431373, 1,
-0.3157417, 0.5081054, 0.2195389, 0, 1, 0.2509804, 1,
-0.3101423, 0.2105455, -1.331599, 0, 1, 0.254902, 1,
-0.310111, -2.421647, -3.21847, 0, 1, 0.2627451, 1,
-0.3084379, -1.390498, -2.62202, 0, 1, 0.2666667, 1,
-0.3047579, 0.04703539, -1.720231, 0, 1, 0.2745098, 1,
-0.3041256, 1.018844, -0.771121, 0, 1, 0.2784314, 1,
-0.3035796, -0.6254241, -2.175106, 0, 1, 0.2862745, 1,
-0.3008164, -0.5471706, -3.144752, 0, 1, 0.2901961, 1,
-0.2984451, 0.163035, -0.3058998, 0, 1, 0.2980392, 1,
-0.2909683, 1.712807, 0.1803533, 0, 1, 0.3058824, 1,
-0.2904805, -0.251779, -3.039383, 0, 1, 0.3098039, 1,
-0.2856965, -1.89328, -2.403539, 0, 1, 0.3176471, 1,
-0.2853079, -0.02110257, -3.41125, 0, 1, 0.3215686, 1,
-0.2844901, 1.609227, -0.2047106, 0, 1, 0.3294118, 1,
-0.2821105, -0.0104832, -1.796443, 0, 1, 0.3333333, 1,
-0.2817314, 1.147587, 0.8374424, 0, 1, 0.3411765, 1,
-0.2811604, 1.04156, -0.3092242, 0, 1, 0.345098, 1,
-0.2800162, 1.732115, -0.4463, 0, 1, 0.3529412, 1,
-0.2762279, -0.6750726, -4.465182, 0, 1, 0.3568628, 1,
-0.2717346, 1.800593, -1.355301, 0, 1, 0.3647059, 1,
-0.270723, 0.6845748, -2.290593, 0, 1, 0.3686275, 1,
-0.2705624, -1.198815, -3.850191, 0, 1, 0.3764706, 1,
-0.2679429, -1.527149, -3.250737, 0, 1, 0.3803922, 1,
-0.2669584, 0.3297723, -1.54378, 0, 1, 0.3882353, 1,
-0.2660314, 0.7631359, -1.612872, 0, 1, 0.3921569, 1,
-0.2604258, -0.667994, -2.748955, 0, 1, 0.4, 1,
-0.2600732, 0.2321851, 0.5287895, 0, 1, 0.4078431, 1,
-0.2574079, -0.8698985, -2.348003, 0, 1, 0.4117647, 1,
-0.2573108, -0.1160907, -1.842234, 0, 1, 0.4196078, 1,
-0.2570906, 0.5406224, -0.5120998, 0, 1, 0.4235294, 1,
-0.2547353, 0.1769549, -0.4091299, 0, 1, 0.4313726, 1,
-0.2510076, 1.223029, 1.352434, 0, 1, 0.4352941, 1,
-0.2455745, 0.7794871, -1.045471, 0, 1, 0.4431373, 1,
-0.2454955, 0.8405793, 1.411095, 0, 1, 0.4470588, 1,
-0.2452215, 0.3369069, -3.30021, 0, 1, 0.454902, 1,
-0.2420366, 1.4531, -1.762529, 0, 1, 0.4588235, 1,
-0.2348847, -0.6095528, -1.327678, 0, 1, 0.4666667, 1,
-0.2338446, 0.8301015, -0.2177216, 0, 1, 0.4705882, 1,
-0.2330422, 0.5028347, -1.312554, 0, 1, 0.4784314, 1,
-0.2328759, 0.8863778, -0.7581679, 0, 1, 0.4823529, 1,
-0.2324714, -0.09314002, -1.940914, 0, 1, 0.4901961, 1,
-0.231315, -0.7030591, -3.29776, 0, 1, 0.4941176, 1,
-0.2311387, -0.939625, -3.278977, 0, 1, 0.5019608, 1,
-0.2298851, -0.6429926, -4.942637, 0, 1, 0.509804, 1,
-0.2288282, -2.369327, -2.715267, 0, 1, 0.5137255, 1,
-0.228516, 1.760493, -0.4262944, 0, 1, 0.5215687, 1,
-0.2270262, 0.9297727, -1.288064, 0, 1, 0.5254902, 1,
-0.2244641, -0.3375192, -3.542482, 0, 1, 0.5333334, 1,
-0.2236007, -0.9381742, -1.520989, 0, 1, 0.5372549, 1,
-0.2220114, -0.1326058, -1.586085, 0, 1, 0.5450981, 1,
-0.2212896, 0.934507, -0.01113562, 0, 1, 0.5490196, 1,
-0.2207974, 0.6569605, -0.04695863, 0, 1, 0.5568628, 1,
-0.2103826, 0.251039, -0.3261431, 0, 1, 0.5607843, 1,
-0.2083033, -0.8901771, -1.868035, 0, 1, 0.5686275, 1,
-0.2010993, 0.8763941, -0.06155926, 0, 1, 0.572549, 1,
-0.19176, -0.1602295, -1.781803, 0, 1, 0.5803922, 1,
-0.1870951, -0.05497561, -2.653689, 0, 1, 0.5843138, 1,
-0.1861745, -1.245089, -2.993567, 0, 1, 0.5921569, 1,
-0.1861668, 1.045062, -0.4886302, 0, 1, 0.5960785, 1,
-0.1859147, 1.583005, -0.9298671, 0, 1, 0.6039216, 1,
-0.1817649, -0.7260709, -3.348817, 0, 1, 0.6117647, 1,
-0.1762696, 0.1028636, -0.9972781, 0, 1, 0.6156863, 1,
-0.1751326, 0.8048687, -0.9168153, 0, 1, 0.6235294, 1,
-0.1746458, 1.552186, -0.3079576, 0, 1, 0.627451, 1,
-0.1674831, -0.5632868, -1.113763, 0, 1, 0.6352941, 1,
-0.1629752, 0.6911667, -1.093386, 0, 1, 0.6392157, 1,
-0.1585424, -1.607182, -3.253632, 0, 1, 0.6470588, 1,
-0.1545091, 0.7700024, -0.6240002, 0, 1, 0.6509804, 1,
-0.1480139, -0.7705909, -2.224304, 0, 1, 0.6588235, 1,
-0.1455953, -0.006396041, 1.914067, 0, 1, 0.6627451, 1,
-0.1411945, 0.6160576, -0.03965268, 0, 1, 0.6705883, 1,
-0.1391646, -2.344949, -3.54901, 0, 1, 0.6745098, 1,
-0.1324772, -1.844878, -4.063016, 0, 1, 0.682353, 1,
-0.1301183, 2.498483, 0.6169435, 0, 1, 0.6862745, 1,
-0.1263605, 0.4903276, -0.9047541, 0, 1, 0.6941177, 1,
-0.1254107, 0.2170293, -0.5714909, 0, 1, 0.7019608, 1,
-0.1249218, -0.07398427, -0.9679385, 0, 1, 0.7058824, 1,
-0.1232628, 1.691998, -0.5791333, 0, 1, 0.7137255, 1,
-0.1205296, -0.6324798, -4.110418, 0, 1, 0.7176471, 1,
-0.1151599, -0.9800669, -4.519521, 0, 1, 0.7254902, 1,
-0.1098737, -0.6756175, -2.624886, 0, 1, 0.7294118, 1,
-0.1069108, 0.9547192, -1.534014, 0, 1, 0.7372549, 1,
-0.1039554, -0.5154316, -4.427751, 0, 1, 0.7411765, 1,
-0.1001169, 0.3313632, 0.1735649, 0, 1, 0.7490196, 1,
-0.09708536, -1.135347, -2.847407, 0, 1, 0.7529412, 1,
-0.08855052, -0.06125344, -3.064059, 0, 1, 0.7607843, 1,
-0.08836177, 0.4459778, 1.289238, 0, 1, 0.7647059, 1,
-0.08717411, -0.44253, -3.508671, 0, 1, 0.772549, 1,
-0.08119477, 1.103937, -1.565503, 0, 1, 0.7764706, 1,
-0.06800714, 0.9038427, -0.5503139, 0, 1, 0.7843137, 1,
-0.06110555, 0.02363129, -1.039013, 0, 1, 0.7882353, 1,
-0.05817292, 0.7798622, 0.1699239, 0, 1, 0.7960784, 1,
-0.0537839, 0.6224847, -1.010482, 0, 1, 0.8039216, 1,
-0.0471576, -0.4223473, -1.020677, 0, 1, 0.8078431, 1,
-0.04612107, 2.002972, -2.700714, 0, 1, 0.8156863, 1,
-0.04594988, 1.187986, -1.17589, 0, 1, 0.8196079, 1,
-0.04476971, -1.168543, -2.556505, 0, 1, 0.827451, 1,
-0.04378473, 1.010127, 0.7060106, 0, 1, 0.8313726, 1,
-0.0412961, 0.8137898, -1.332049, 0, 1, 0.8392157, 1,
-0.04079746, 1.277553, 0.1868053, 0, 1, 0.8431373, 1,
-0.03766045, -0.2394699, -4.156532, 0, 1, 0.8509804, 1,
-0.03089581, -1.944863, -1.378699, 0, 1, 0.854902, 1,
-0.02862772, 1.394376, 1.140193, 0, 1, 0.8627451, 1,
-0.02662104, 1.712435, 1.189458, 0, 1, 0.8666667, 1,
-0.02426224, -0.8004535, -1.986858, 0, 1, 0.8745098, 1,
-0.02304693, -0.428692, -2.55413, 0, 1, 0.8784314, 1,
-0.01983904, 0.8295215, 1.903603, 0, 1, 0.8862745, 1,
-0.01960566, 0.6407948, 0.7468976, 0, 1, 0.8901961, 1,
-0.01774259, -1.200898, -3.781366, 0, 1, 0.8980392, 1,
-0.01483207, -1.571917, -2.63218, 0, 1, 0.9058824, 1,
-0.009259209, 1.631941, -0.2513445, 0, 1, 0.9098039, 1,
-0.006346506, -1.538402, -3.560835, 0, 1, 0.9176471, 1,
-0.002977407, 0.2160031, -0.05702671, 0, 1, 0.9215686, 1,
-0.002742332, 0.955273, -0.5180737, 0, 1, 0.9294118, 1,
0.001055351, 0.002134935, -0.3682214, 0, 1, 0.9333333, 1,
0.001337055, 0.7207074, 0.2984345, 0, 1, 0.9411765, 1,
0.002448598, 0.03875947, -0.269683, 0, 1, 0.945098, 1,
0.00367517, 1.062283, 0.5553594, 0, 1, 0.9529412, 1,
0.006255555, -1.033549, 3.686236, 0, 1, 0.9568627, 1,
0.009063288, 0.8680862, -2.034231, 0, 1, 0.9647059, 1,
0.009312526, -0.4348042, 2.300782, 0, 1, 0.9686275, 1,
0.009797282, -0.8713521, 4.888425, 0, 1, 0.9764706, 1,
0.0100049, 0.6120994, 1.54026, 0, 1, 0.9803922, 1,
0.01405572, 0.09536781, 1.596054, 0, 1, 0.9882353, 1,
0.01500296, -2.006227, 4.995356, 0, 1, 0.9921569, 1,
0.01592912, 0.0356767, -0.5325041, 0, 1, 1, 1,
0.01627465, 2.807544, -0.08709379, 0, 0.9921569, 1, 1,
0.02118303, 0.2321217, -0.1632192, 0, 0.9882353, 1, 1,
0.02119946, 0.4172947, 0.004681773, 0, 0.9803922, 1, 1,
0.02651958, -0.2183008, 1.22892, 0, 0.9764706, 1, 1,
0.03181421, -1.195617, 4.635797, 0, 0.9686275, 1, 1,
0.03266283, 1.814668, -0.1332105, 0, 0.9647059, 1, 1,
0.03355676, 2.156658, 0.9973926, 0, 0.9568627, 1, 1,
0.03586611, 1.517443, 0.7609524, 0, 0.9529412, 1, 1,
0.03666611, 0.6242419, 0.5102455, 0, 0.945098, 1, 1,
0.03809007, 0.9948738, -0.195332, 0, 0.9411765, 1, 1,
0.03986656, 1.636084, -0.3828798, 0, 0.9333333, 1, 1,
0.04061243, -0.463441, 4.485905, 0, 0.9294118, 1, 1,
0.0414699, 0.7532921, -1.211133, 0, 0.9215686, 1, 1,
0.04482586, 0.8815135, -1.294195, 0, 0.9176471, 1, 1,
0.0449841, 0.5929354, -0.9497619, 0, 0.9098039, 1, 1,
0.04804602, -0.03060737, 2.112081, 0, 0.9058824, 1, 1,
0.04892101, -0.4251506, 3.651006, 0, 0.8980392, 1, 1,
0.05857027, 1.008464, -1.018237, 0, 0.8901961, 1, 1,
0.058638, 0.5435671, -0.6115862, 0, 0.8862745, 1, 1,
0.05888323, 0.3974678, 0.4261601, 0, 0.8784314, 1, 1,
0.06061883, 0.5043305, 2.829799, 0, 0.8745098, 1, 1,
0.06281961, 0.1469481, 0.2430243, 0, 0.8666667, 1, 1,
0.06344512, 1.286242, -0.3053929, 0, 0.8627451, 1, 1,
0.06599538, 0.2721298, 1.233862, 0, 0.854902, 1, 1,
0.06739284, -1.044341, 2.027414, 0, 0.8509804, 1, 1,
0.06759473, -1.492047, 2.168401, 0, 0.8431373, 1, 1,
0.067956, -0.4860994, 5.35404, 0, 0.8392157, 1, 1,
0.06875667, 0.5187765, 1.758703, 0, 0.8313726, 1, 1,
0.07153482, 1.561871, -0.4297723, 0, 0.827451, 1, 1,
0.07196583, 1.283674, 0.1893416, 0, 0.8196079, 1, 1,
0.07536322, -0.1892075, 2.795329, 0, 0.8156863, 1, 1,
0.08138062, 0.06067329, -0.5425601, 0, 0.8078431, 1, 1,
0.08154873, -0.9595164, 2.313582, 0, 0.8039216, 1, 1,
0.08477902, 0.7764418, -1.147197, 0, 0.7960784, 1, 1,
0.08515821, 1.991348, -1.047347, 0, 0.7882353, 1, 1,
0.08645894, -0.1410917, 3.969195, 0, 0.7843137, 1, 1,
0.08822208, 0.367405, 1.370502, 0, 0.7764706, 1, 1,
0.08920331, -1.021026, 4.242466, 0, 0.772549, 1, 1,
0.0892097, 2.687495, 0.855208, 0, 0.7647059, 1, 1,
0.09470303, 0.2954734, 0.5771024, 0, 0.7607843, 1, 1,
0.09589259, 2.202926, -0.2138795, 0, 0.7529412, 1, 1,
0.10198, 0.2143106, -0.1314018, 0, 0.7490196, 1, 1,
0.1055984, -0.1326501, 4.214745, 0, 0.7411765, 1, 1,
0.1066619, 0.2891489, 0.1495892, 0, 0.7372549, 1, 1,
0.1078028, 0.1115495, 1.320457, 0, 0.7294118, 1, 1,
0.109652, -0.8644862, 3.544134, 0, 0.7254902, 1, 1,
0.1109039, 0.2172615, 0.4654367, 0, 0.7176471, 1, 1,
0.1122392, -1.071372, 5.178889, 0, 0.7137255, 1, 1,
0.1151433, 1.505434, -0.5982061, 0, 0.7058824, 1, 1,
0.115835, 1.010885, -0.3475849, 0, 0.6980392, 1, 1,
0.1158472, -1.083306, 3.105854, 0, 0.6941177, 1, 1,
0.118189, -0.5611306, 2.357343, 0, 0.6862745, 1, 1,
0.120119, -0.6178448, 2.855495, 0, 0.682353, 1, 1,
0.1216509, -0.06765997, 2.653982, 0, 0.6745098, 1, 1,
0.1226889, 0.07062826, 2.555977, 0, 0.6705883, 1, 1,
0.1248275, 1.877889, -0.2997945, 0, 0.6627451, 1, 1,
0.1256969, 0.9878052, -0.01278585, 0, 0.6588235, 1, 1,
0.1338853, -0.3578329, 3.390799, 0, 0.6509804, 1, 1,
0.1369127, 1.24209, -1.150377, 0, 0.6470588, 1, 1,
0.1377149, 2.171468, 0.4529383, 0, 0.6392157, 1, 1,
0.1379183, 1.252504, -0.3938402, 0, 0.6352941, 1, 1,
0.1383642, 1.986837, -0.2561659, 0, 0.627451, 1, 1,
0.1395325, -2.430484, 2.257752, 0, 0.6235294, 1, 1,
0.1433077, 0.9682299, 0.2622785, 0, 0.6156863, 1, 1,
0.144419, 0.8824638, 0.2049845, 0, 0.6117647, 1, 1,
0.1451612, -0.1159995, 2.925678, 0, 0.6039216, 1, 1,
0.1466579, 2.901774, -1.463554, 0, 0.5960785, 1, 1,
0.1473521, -0.2805019, 2.364258, 0, 0.5921569, 1, 1,
0.1500283, -0.2739649, 2.676828, 0, 0.5843138, 1, 1,
0.1577656, 0.01203224, 0.9598252, 0, 0.5803922, 1, 1,
0.1580868, 0.6054794, 0.8288844, 0, 0.572549, 1, 1,
0.1629533, -0.9556728, 2.502498, 0, 0.5686275, 1, 1,
0.1661321, 0.5787755, 2.872477, 0, 0.5607843, 1, 1,
0.1719158, 1.909148, 0.3827329, 0, 0.5568628, 1, 1,
0.1719442, -0.5298792, 3.873425, 0, 0.5490196, 1, 1,
0.1739939, -0.1585643, 0.156654, 0, 0.5450981, 1, 1,
0.1752732, -2.234859, 3.031891, 0, 0.5372549, 1, 1,
0.1851787, 1.643918, -0.7791497, 0, 0.5333334, 1, 1,
0.1880259, -0.7927825, 2.260399, 0, 0.5254902, 1, 1,
0.1919477, -0.1953711, 2.279342, 0, 0.5215687, 1, 1,
0.1979875, 0.1019847, 3.18493, 0, 0.5137255, 1, 1,
0.1995462, 1.727546, 1.275116, 0, 0.509804, 1, 1,
0.2002461, 0.4257551, 0.5231966, 0, 0.5019608, 1, 1,
0.2014782, -0.6550004, 0.2982527, 0, 0.4941176, 1, 1,
0.2038608, 2.390162, 1.447712, 0, 0.4901961, 1, 1,
0.2055416, -0.6892148, 2.156472, 0, 0.4823529, 1, 1,
0.2101098, 0.860768, 0.2500251, 0, 0.4784314, 1, 1,
0.2102318, -0.5478959, 3.637676, 0, 0.4705882, 1, 1,
0.2122785, -0.242451, 2.161923, 0, 0.4666667, 1, 1,
0.217858, 2.165789, 0.5094577, 0, 0.4588235, 1, 1,
0.2210164, 1.308826, 1.246571, 0, 0.454902, 1, 1,
0.2231491, 1.330998, -1.728499, 0, 0.4470588, 1, 1,
0.2258862, 0.3622468, 0.7792561, 0, 0.4431373, 1, 1,
0.2304804, -0.03818002, 1.807307, 0, 0.4352941, 1, 1,
0.2310305, 3.549414, -1.406868, 0, 0.4313726, 1, 1,
0.2366538, -1.333182, 5.279212, 0, 0.4235294, 1, 1,
0.243855, 1.160107, 1.731679, 0, 0.4196078, 1, 1,
0.2453105, -1.712368, 2.999827, 0, 0.4117647, 1, 1,
0.2458086, 0.555396, 0.9164649, 0, 0.4078431, 1, 1,
0.249412, 0.5493339, 0.2591443, 0, 0.4, 1, 1,
0.2534707, 1.876084, 0.1265354, 0, 0.3921569, 1, 1,
0.2541287, -0.390301, 1.352588, 0, 0.3882353, 1, 1,
0.2565324, 1.626071, -1.826055, 0, 0.3803922, 1, 1,
0.2568266, -1.341179, 4.433394, 0, 0.3764706, 1, 1,
0.2582085, 0.3248899, 1.566841, 0, 0.3686275, 1, 1,
0.2591305, -0.7345828, 0.3934749, 0, 0.3647059, 1, 1,
0.2610978, -0.5021667, 1.500049, 0, 0.3568628, 1, 1,
0.2616309, -0.4476555, 1.363693, 0, 0.3529412, 1, 1,
0.2620759, -1.35765, 3.901576, 0, 0.345098, 1, 1,
0.2643575, -0.1360032, 1.66499, 0, 0.3411765, 1, 1,
0.2665895, 2.295466, -0.7868285, 0, 0.3333333, 1, 1,
0.2678989, 0.7714105, 1.177763, 0, 0.3294118, 1, 1,
0.2683375, -0.292625, 3.769702, 0, 0.3215686, 1, 1,
0.2705356, 0.6388738, 0.3707236, 0, 0.3176471, 1, 1,
0.2711603, -2.38185, 1.352393, 0, 0.3098039, 1, 1,
0.2727516, -0.3236522, 2.548528, 0, 0.3058824, 1, 1,
0.2739784, -0.9622829, 3.634961, 0, 0.2980392, 1, 1,
0.2748612, -0.281944, 3.187065, 0, 0.2901961, 1, 1,
0.2754315, -0.08479611, 2.23238, 0, 0.2862745, 1, 1,
0.2762411, 0.06807691, 1.777675, 0, 0.2784314, 1, 1,
0.2780956, -0.9800988, 2.829385, 0, 0.2745098, 1, 1,
0.2794368, 0.6860135, -0.7407392, 0, 0.2666667, 1, 1,
0.2812044, 0.8705757, 1.078218, 0, 0.2627451, 1, 1,
0.2905984, 2.067388, -0.2552891, 0, 0.254902, 1, 1,
0.290948, -0.09455223, 1.825202, 0, 0.2509804, 1, 1,
0.2911146, 0.6422414, -0.3697801, 0, 0.2431373, 1, 1,
0.295117, 0.1491565, 1.48036, 0, 0.2392157, 1, 1,
0.2994464, 0.2944928, 1.651509, 0, 0.2313726, 1, 1,
0.3007534, -0.9490941, 3.441481, 0, 0.227451, 1, 1,
0.3021472, 0.5696775, 1.076249, 0, 0.2196078, 1, 1,
0.3050388, 0.5050433, 0.3438141, 0, 0.2156863, 1, 1,
0.3053299, 0.8898579, 0.5077132, 0, 0.2078431, 1, 1,
0.3061055, -1.918054, 2.269319, 0, 0.2039216, 1, 1,
0.3071815, -0.8490537, 3.251422, 0, 0.1960784, 1, 1,
0.3098252, -0.6942484, 2.777776, 0, 0.1882353, 1, 1,
0.3103394, -0.2921705, 3.546288, 0, 0.1843137, 1, 1,
0.3169785, -0.6812968, 4.874352, 0, 0.1764706, 1, 1,
0.3240954, 0.1360301, 1.442168, 0, 0.172549, 1, 1,
0.325315, 0.2207416, 0.1869474, 0, 0.1647059, 1, 1,
0.3264011, 0.7115893, 0.6253088, 0, 0.1607843, 1, 1,
0.3276496, -0.9899232, 2.353737, 0, 0.1529412, 1, 1,
0.3343424, -0.3539827, 1.614501, 0, 0.1490196, 1, 1,
0.343403, 0.06840843, 2.202781, 0, 0.1411765, 1, 1,
0.3446794, 0.5248191, -0.008190873, 0, 0.1372549, 1, 1,
0.3486858, 0.3888364, 0.7596189, 0, 0.1294118, 1, 1,
0.3514413, 0.7375392, -0.3767352, 0, 0.1254902, 1, 1,
0.3522992, -0.05536666, 2.405009, 0, 0.1176471, 1, 1,
0.3533545, -0.3325108, 3.713017, 0, 0.1137255, 1, 1,
0.3647098, -1.986646, 1.590415, 0, 0.1058824, 1, 1,
0.3648721, 1.370881, -0.4375371, 0, 0.09803922, 1, 1,
0.3671046, -1.430673, 1.374677, 0, 0.09411765, 1, 1,
0.3714487, -0.2010637, 1.304636, 0, 0.08627451, 1, 1,
0.3736223, 0.4641684, -0.04160277, 0, 0.08235294, 1, 1,
0.3774423, 1.871272, 2.382177, 0, 0.07450981, 1, 1,
0.3810038, -0.7761919, 1.643177, 0, 0.07058824, 1, 1,
0.3944245, -0.6923019, 3.526011, 0, 0.0627451, 1, 1,
0.3951305, 0.5205148, -1.006777, 0, 0.05882353, 1, 1,
0.397595, 0.01196744, 2.468969, 0, 0.05098039, 1, 1,
0.3999671, 1.828044, -0.6706989, 0, 0.04705882, 1, 1,
0.4003447, 0.1208673, 2.151071, 0, 0.03921569, 1, 1,
0.4007577, -0.8100338, 1.814462, 0, 0.03529412, 1, 1,
0.4020896, -0.5216452, 2.458794, 0, 0.02745098, 1, 1,
0.403495, 0.1508471, 1.501242, 0, 0.02352941, 1, 1,
0.4045604, 0.2689295, 1.067436, 0, 0.01568628, 1, 1,
0.4097966, 0.5513095, 1.167997, 0, 0.01176471, 1, 1,
0.4127097, 0.4783826, 0.076729, 0, 0.003921569, 1, 1,
0.4157803, 0.2240059, 1.618129, 0.003921569, 0, 1, 1,
0.415799, -1.432019, 2.738949, 0.007843138, 0, 1, 1,
0.4201758, -1.153315, 3.547755, 0.01568628, 0, 1, 1,
0.422302, 0.1821515, 2.487169, 0.01960784, 0, 1, 1,
0.4267187, -1.096521, 3.517626, 0.02745098, 0, 1, 1,
0.4281139, 0.2029955, 0.9155062, 0.03137255, 0, 1, 1,
0.4284645, 0.5952361, 1.108043, 0.03921569, 0, 1, 1,
0.4332066, -0.1320566, 0.7900423, 0.04313726, 0, 1, 1,
0.4354281, -0.6570773, 0.0939512, 0.05098039, 0, 1, 1,
0.4408562, 0.4485739, -0.2534566, 0.05490196, 0, 1, 1,
0.4423917, -0.769437, 2.843569, 0.0627451, 0, 1, 1,
0.4500047, -1.104759, 3.60175, 0.06666667, 0, 1, 1,
0.4524984, -0.6888486, 2.40668, 0.07450981, 0, 1, 1,
0.453013, -0.4974619, 2.873492, 0.07843138, 0, 1, 1,
0.4550885, -0.2142345, 1.803588, 0.08627451, 0, 1, 1,
0.45906, 0.7986904, -0.8278281, 0.09019608, 0, 1, 1,
0.4602983, 0.6426423, 2.747426, 0.09803922, 0, 1, 1,
0.4611817, -0.2975894, 1.926278, 0.1058824, 0, 1, 1,
0.4621934, -0.7574615, 2.496584, 0.1098039, 0, 1, 1,
0.464653, 1.754575, 0.115455, 0.1176471, 0, 1, 1,
0.4777628, -1.815077, 2.47513, 0.1215686, 0, 1, 1,
0.4788553, 0.06848405, -0.1911169, 0.1294118, 0, 1, 1,
0.4868367, 0.4922382, -0.01803531, 0.1333333, 0, 1, 1,
0.4873577, 1.277131, 0.5929478, 0.1411765, 0, 1, 1,
0.4903163, 0.08515278, 1.619462, 0.145098, 0, 1, 1,
0.4950681, -0.9167582, 2.314374, 0.1529412, 0, 1, 1,
0.497114, -1.131101, 2.987138, 0.1568628, 0, 1, 1,
0.4971959, 0.6293434, -1.06546, 0.1647059, 0, 1, 1,
0.498213, -0.6304198, 1.870375, 0.1686275, 0, 1, 1,
0.4997368, -0.5092993, 2.517949, 0.1764706, 0, 1, 1,
0.5004495, -0.9902484, 3.900835, 0.1803922, 0, 1, 1,
0.5018875, 0.5790362, 1.586425, 0.1882353, 0, 1, 1,
0.5022054, -0.3230907, 0.8357505, 0.1921569, 0, 1, 1,
0.5025715, -0.5780131, 2.834957, 0.2, 0, 1, 1,
0.5046285, -1.639851, 2.24496, 0.2078431, 0, 1, 1,
0.5088264, -1.205374, 2.260637, 0.2117647, 0, 1, 1,
0.5184319, -0.6408698, 3.254586, 0.2196078, 0, 1, 1,
0.5214813, -1.398313, 2.771099, 0.2235294, 0, 1, 1,
0.5244746, 1.25754, 1.163513, 0.2313726, 0, 1, 1,
0.5298178, 0.5357507, 1.01762, 0.2352941, 0, 1, 1,
0.5364766, 0.9906448, 0.1480539, 0.2431373, 0, 1, 1,
0.5423654, 1.834718, 0.3699103, 0.2470588, 0, 1, 1,
0.5439057, 2.222175, 0.5031796, 0.254902, 0, 1, 1,
0.5440515, -0.3266489, 1.069243, 0.2588235, 0, 1, 1,
0.5452246, -0.5207376, 2.435098, 0.2666667, 0, 1, 1,
0.549761, 0.5937447, 0.5040221, 0.2705882, 0, 1, 1,
0.5522165, -0.1649251, 2.810926, 0.2784314, 0, 1, 1,
0.5523645, -0.6581298, 3.355287, 0.282353, 0, 1, 1,
0.5545158, 0.05289994, 1.928254, 0.2901961, 0, 1, 1,
0.5671405, -0.09306207, 1.644318, 0.2941177, 0, 1, 1,
0.567143, -1.435416, 2.107671, 0.3019608, 0, 1, 1,
0.569388, -1.220715, 1.623566, 0.3098039, 0, 1, 1,
0.5729656, 0.5871858, -0.8891465, 0.3137255, 0, 1, 1,
0.5756987, -0.9187286, 1.230962, 0.3215686, 0, 1, 1,
0.5792419, -0.5790773, 2.737776, 0.3254902, 0, 1, 1,
0.5816766, 0.2435985, 1.598438, 0.3333333, 0, 1, 1,
0.5832615, 0.983712, 0.3511828, 0.3372549, 0, 1, 1,
0.5863953, 0.07341176, 1.763945, 0.345098, 0, 1, 1,
0.5902934, 1.432638, 2.166874, 0.3490196, 0, 1, 1,
0.5909548, 0.2777478, 2.991792, 0.3568628, 0, 1, 1,
0.5928995, 0.2525645, 0.4684851, 0.3607843, 0, 1, 1,
0.5992076, 0.05029038, 0.9793077, 0.3686275, 0, 1, 1,
0.6061624, -0.6087846, -0.06846579, 0.372549, 0, 1, 1,
0.6068088, -0.6084815, 0.3190982, 0.3803922, 0, 1, 1,
0.6113328, 2.187366, 0.2168144, 0.3843137, 0, 1, 1,
0.6114912, -0.9391481, 1.746784, 0.3921569, 0, 1, 1,
0.6131275, 1.52853, 1.592316, 0.3960784, 0, 1, 1,
0.6137863, 0.4384861, 0.4304399, 0.4039216, 0, 1, 1,
0.6145785, -0.9444467, 2.686423, 0.4117647, 0, 1, 1,
0.617955, -1.348265, 3.177132, 0.4156863, 0, 1, 1,
0.6187018, 0.1176962, -1.955013, 0.4235294, 0, 1, 1,
0.6196716, 0.3993846, 2.455398, 0.427451, 0, 1, 1,
0.6247997, 0.81751, 2.212411, 0.4352941, 0, 1, 1,
0.62695, 0.2688893, 1.805294, 0.4392157, 0, 1, 1,
0.6275317, -1.232934, 2.025361, 0.4470588, 0, 1, 1,
0.6294824, 0.916477, 1.646776, 0.4509804, 0, 1, 1,
0.6322189, -0.04895722, 1.965703, 0.4588235, 0, 1, 1,
0.6344875, -1.168427, 2.559864, 0.4627451, 0, 1, 1,
0.6418775, 0.8385717, 0.7329871, 0.4705882, 0, 1, 1,
0.6436156, -0.5210905, 2.370371, 0.4745098, 0, 1, 1,
0.6441618, 0.646384, 0.5953094, 0.4823529, 0, 1, 1,
0.6482874, -0.6134291, 2.001451, 0.4862745, 0, 1, 1,
0.6523461, -0.7596425, 0.6793664, 0.4941176, 0, 1, 1,
0.6539, 0.7830942, 1.1926, 0.5019608, 0, 1, 1,
0.6573685, -0.3135145, 0.4225287, 0.5058824, 0, 1, 1,
0.6607826, 0.6621555, 2.826429, 0.5137255, 0, 1, 1,
0.6680795, 0.5821999, 0.5394588, 0.5176471, 0, 1, 1,
0.681963, -0.2974665, 3.072112, 0.5254902, 0, 1, 1,
0.6896837, -0.6076312, 1.612794, 0.5294118, 0, 1, 1,
0.69708, 0.8081861, -1.153669, 0.5372549, 0, 1, 1,
0.6989253, 0.4585446, -0.9390089, 0.5411765, 0, 1, 1,
0.6994683, 0.7209806, 2.091249, 0.5490196, 0, 1, 1,
0.7022672, -0.02821957, 0.04445878, 0.5529412, 0, 1, 1,
0.71127, -0.05572997, 1.40881, 0.5607843, 0, 1, 1,
0.7146089, 0.3557434, 0.4422173, 0.5647059, 0, 1, 1,
0.7161356, 1.281165, -0.8507435, 0.572549, 0, 1, 1,
0.7171727, -0.4402754, 3.213065, 0.5764706, 0, 1, 1,
0.718474, -0.7989327, 1.212565, 0.5843138, 0, 1, 1,
0.722874, -0.788282, -0.0755199, 0.5882353, 0, 1, 1,
0.7239401, -1.050656, 1.912029, 0.5960785, 0, 1, 1,
0.7247917, 1.412583, -0.2337413, 0.6039216, 0, 1, 1,
0.7306176, -1.780716, 0.05769204, 0.6078432, 0, 1, 1,
0.7312557, -1.903092, 3.065072, 0.6156863, 0, 1, 1,
0.7321944, 0.748265, 1.874879, 0.6196079, 0, 1, 1,
0.7327418, -2.146097, 2.383792, 0.627451, 0, 1, 1,
0.733005, 0.6053953, 0.4785902, 0.6313726, 0, 1, 1,
0.7340775, 1.509613, -0.1216116, 0.6392157, 0, 1, 1,
0.7432565, -0.6412317, 0.4346119, 0.6431373, 0, 1, 1,
0.7438198, 0.2546156, 2.733589, 0.6509804, 0, 1, 1,
0.7439928, -0.8124104, 2.554234, 0.654902, 0, 1, 1,
0.7454132, 0.9325578, 1.105925, 0.6627451, 0, 1, 1,
0.7504181, 1.323543, 1.128155, 0.6666667, 0, 1, 1,
0.7506841, -2.528126, 3.618888, 0.6745098, 0, 1, 1,
0.752046, 2.208072, -1.085033, 0.6784314, 0, 1, 1,
0.7522264, -0.3403996, 2.361012, 0.6862745, 0, 1, 1,
0.7571463, 0.003347873, 1.479495, 0.6901961, 0, 1, 1,
0.7576844, 0.3245094, 1.130572, 0.6980392, 0, 1, 1,
0.7609128, -0.6007195, 3.750435, 0.7058824, 0, 1, 1,
0.7617639, 0.1909559, 1.867273, 0.7098039, 0, 1, 1,
0.7637572, -0.6984482, 4.069464, 0.7176471, 0, 1, 1,
0.7660082, 0.3133224, 0.7429249, 0.7215686, 0, 1, 1,
0.7706019, 0.2393692, 0.7278775, 0.7294118, 0, 1, 1,
0.7745752, -1.31063, 3.422341, 0.7333333, 0, 1, 1,
0.7748515, -0.3611477, 1.819633, 0.7411765, 0, 1, 1,
0.7800521, 1.519787, 1.657189, 0.7450981, 0, 1, 1,
0.7860336, 0.324903, 0.1472537, 0.7529412, 0, 1, 1,
0.7874057, 0.1472029, 0.6952365, 0.7568628, 0, 1, 1,
0.7914577, 0.05275745, 0.8207864, 0.7647059, 0, 1, 1,
0.7924041, 0.2324984, 3.782083, 0.7686275, 0, 1, 1,
0.7940711, -1.293254, 3.004722, 0.7764706, 0, 1, 1,
0.7973013, 0.2281104, 1.886404, 0.7803922, 0, 1, 1,
0.8012887, 1.46535, -0.01900962, 0.7882353, 0, 1, 1,
0.801792, 0.5838139, 0.5425337, 0.7921569, 0, 1, 1,
0.8046485, -0.5298268, 0.4990811, 0.8, 0, 1, 1,
0.8075208, -0.518922, 4.136517, 0.8078431, 0, 1, 1,
0.8141125, 0.2274317, -0.1636609, 0.8117647, 0, 1, 1,
0.8156186, 2.09576, -1.297689, 0.8196079, 0, 1, 1,
0.8181149, 0.5731589, 1.679903, 0.8235294, 0, 1, 1,
0.818787, 1.020226, 3.377379, 0.8313726, 0, 1, 1,
0.8197827, -0.1074411, 3.216215, 0.8352941, 0, 1, 1,
0.8245916, -1.903149, 2.574639, 0.8431373, 0, 1, 1,
0.8246183, -0.7057101, 3.095258, 0.8470588, 0, 1, 1,
0.8330868, -0.08770391, -0.4439808, 0.854902, 0, 1, 1,
0.8335096, -1.727204, 2.436735, 0.8588235, 0, 1, 1,
0.8337007, -2.135028, 2.91177, 0.8666667, 0, 1, 1,
0.8338532, 0.004745413, 1.99016, 0.8705882, 0, 1, 1,
0.8485057, 1.161386, 1.850778, 0.8784314, 0, 1, 1,
0.8488641, 1.369221, 0.2655399, 0.8823529, 0, 1, 1,
0.8569405, 2.007765, 0.04856379, 0.8901961, 0, 1, 1,
0.8575336, -0.4669238, 2.661072, 0.8941177, 0, 1, 1,
0.8585875, 0.9695678, 1.423867, 0.9019608, 0, 1, 1,
0.8634772, -0.8453274, 3.885431, 0.9098039, 0, 1, 1,
0.8682485, 1.616659, 0.7622725, 0.9137255, 0, 1, 1,
0.8724697, 0.6030785, 1.890488, 0.9215686, 0, 1, 1,
0.8838987, 0.6658363, 0.02930961, 0.9254902, 0, 1, 1,
0.8845992, -0.8453137, 3.866668, 0.9333333, 0, 1, 1,
0.8863815, 1.942432, -0.2071039, 0.9372549, 0, 1, 1,
0.894119, -1.129673, 1.092947, 0.945098, 0, 1, 1,
0.9042876, -1.145452, 3.419312, 0.9490196, 0, 1, 1,
0.904984, 0.5422717, 0.8459917, 0.9568627, 0, 1, 1,
0.905475, 0.7223522, 1.955336, 0.9607843, 0, 1, 1,
0.9112147, -1.260076, 2.207444, 0.9686275, 0, 1, 1,
0.9112157, -0.7806432, 3.726495, 0.972549, 0, 1, 1,
0.9146045, 0.4216719, 1.089452, 0.9803922, 0, 1, 1,
0.9296013, -2.004646, 4.41317, 0.9843137, 0, 1, 1,
0.9301517, 0.7043267, 2.086093, 0.9921569, 0, 1, 1,
0.9302759, 0.02106561, 2.617072, 0.9960784, 0, 1, 1,
0.9446095, 0.6950684, 2.246718, 1, 0, 0.9960784, 1,
0.9495333, 0.1710095, 2.101578, 1, 0, 0.9882353, 1,
0.95138, 0.2891128, -1.106987, 1, 0, 0.9843137, 1,
0.9521518, 2.452085, 2.323555, 1, 0, 0.9764706, 1,
0.9522177, 0.01174419, 1.192716, 1, 0, 0.972549, 1,
0.955574, 1.179476, 1.540924, 1, 0, 0.9647059, 1,
0.9586727, -0.8904076, 2.609294, 1, 0, 0.9607843, 1,
0.9647282, -1.917039, 2.868921, 1, 0, 0.9529412, 1,
0.9662859, -0.7011539, 1.527457, 1, 0, 0.9490196, 1,
0.9683574, 0.330601, 1.565821, 1, 0, 0.9411765, 1,
0.9684886, 0.3618752, 1.527257, 1, 0, 0.9372549, 1,
0.9686672, 0.2613061, -0.01784666, 1, 0, 0.9294118, 1,
0.9714295, -0.2228223, 2.200511, 1, 0, 0.9254902, 1,
0.9732618, -0.4197117, 3.686357, 1, 0, 0.9176471, 1,
0.9769737, 0.4397124, 1.513313, 1, 0, 0.9137255, 1,
0.9781191, -0.7396227, 1.432997, 1, 0, 0.9058824, 1,
0.9791406, 1.168422, 0.9440414, 1, 0, 0.9019608, 1,
0.9828289, 1.613131, 0.4492406, 1, 0, 0.8941177, 1,
0.9829957, -0.0399373, 0.2100541, 1, 0, 0.8862745, 1,
0.9862384, 1.256236, 1.624701, 1, 0, 0.8823529, 1,
0.9985123, -1.24216, 3.391326, 1, 0, 0.8745098, 1,
1.005533, -0.6910848, 1.110504, 1, 0, 0.8705882, 1,
1.015906, 0.2841297, 0.1980772, 1, 0, 0.8627451, 1,
1.015929, 0.5930669, 0.8300518, 1, 0, 0.8588235, 1,
1.019761, 0.1734602, 1.355303, 1, 0, 0.8509804, 1,
1.021119, 1.901643, 1.70332, 1, 0, 0.8470588, 1,
1.030016, -0.07814596, 2.322807, 1, 0, 0.8392157, 1,
1.031598, 0.8379912, 0.8013914, 1, 0, 0.8352941, 1,
1.04563, 0.292044, 0.326053, 1, 0, 0.827451, 1,
1.050513, -0.5968865, 2.134218, 1, 0, 0.8235294, 1,
1.065131, -0.5286391, -0.5184191, 1, 0, 0.8156863, 1,
1.066308, 0.7231656, 1.163857, 1, 0, 0.8117647, 1,
1.067295, 1.668814, 2.440032, 1, 0, 0.8039216, 1,
1.067977, -0.9111505, 3.434047, 1, 0, 0.7960784, 1,
1.068157, -0.2809446, 0.5733244, 1, 0, 0.7921569, 1,
1.06847, -2.563914, 1.388435, 1, 0, 0.7843137, 1,
1.071206, 0.8427855, 1.098625, 1, 0, 0.7803922, 1,
1.07755, 0.06971198, 3.043073, 1, 0, 0.772549, 1,
1.083689, -0.1295229, 2.163557, 1, 0, 0.7686275, 1,
1.101938, -0.1547159, 1.915009, 1, 0, 0.7607843, 1,
1.102928, -0.5154426, 2.743504, 1, 0, 0.7568628, 1,
1.109206, 0.9934329, 0.9429225, 1, 0, 0.7490196, 1,
1.117242, -0.03875159, -0.9108199, 1, 0, 0.7450981, 1,
1.12377, 0.7232251, -0.01742654, 1, 0, 0.7372549, 1,
1.135953, -0.5001914, 2.327538, 1, 0, 0.7333333, 1,
1.146341, -1.146237, 0.486041, 1, 0, 0.7254902, 1,
1.147102, 1.554734, -0.1162741, 1, 0, 0.7215686, 1,
1.150831, -0.08520975, 3.230109, 1, 0, 0.7137255, 1,
1.154907, 0.6227571, 0.7603921, 1, 0, 0.7098039, 1,
1.162126, -0.5169459, 1.918191, 1, 0, 0.7019608, 1,
1.163752, 1.304556, -1.675413, 1, 0, 0.6941177, 1,
1.163757, -1.929535, 0.8640431, 1, 0, 0.6901961, 1,
1.171916, 0.4495966, 1.675995, 1, 0, 0.682353, 1,
1.176827, 0.28283, -0.3824145, 1, 0, 0.6784314, 1,
1.177634, 0.7768709, -0.1689396, 1, 0, 0.6705883, 1,
1.180348, 0.7980712, 1.479571, 1, 0, 0.6666667, 1,
1.181128, 0.3811292, -0.0477306, 1, 0, 0.6588235, 1,
1.195846, 2.210309, -0.4235308, 1, 0, 0.654902, 1,
1.201989, -1.440188, 2.113017, 1, 0, 0.6470588, 1,
1.206704, 0.5251721, -0.5664567, 1, 0, 0.6431373, 1,
1.206996, -1.40725, 3.277243, 1, 0, 0.6352941, 1,
1.212978, 0.7695498, 0.5210353, 1, 0, 0.6313726, 1,
1.217594, -0.6622537, 1.163517, 1, 0, 0.6235294, 1,
1.219018, -1.809705, 2.42681, 1, 0, 0.6196079, 1,
1.219064, 0.06936421, 2.393125, 1, 0, 0.6117647, 1,
1.224195, -0.05588509, 1.996507, 1, 0, 0.6078432, 1,
1.233231, 0.1983047, 1.715612, 1, 0, 0.6, 1,
1.240158, -0.9185465, 3.595567, 1, 0, 0.5921569, 1,
1.240498, -2.331683, 3.3611, 1, 0, 0.5882353, 1,
1.253657, 1.909994, 1.463351, 1, 0, 0.5803922, 1,
1.254894, 0.1695626, 0.960348, 1, 0, 0.5764706, 1,
1.266507, -1.457872, 2.027947, 1, 0, 0.5686275, 1,
1.271241, -0.6187977, 3.549567, 1, 0, 0.5647059, 1,
1.284397, -1.229579, 1.023165, 1, 0, 0.5568628, 1,
1.296076, -0.3391963, 3.049871, 1, 0, 0.5529412, 1,
1.298675, -0.4804917, 1.279709, 1, 0, 0.5450981, 1,
1.305079, -0.6823086, 3.22261, 1, 0, 0.5411765, 1,
1.313034, -1.123264, 0.6861094, 1, 0, 0.5333334, 1,
1.316612, -0.2851216, 0.9171472, 1, 0, 0.5294118, 1,
1.324378, 0.4749531, 0.9992218, 1, 0, 0.5215687, 1,
1.337493, -0.1469457, 2.310436, 1, 0, 0.5176471, 1,
1.344929, -1.754431, 2.205273, 1, 0, 0.509804, 1,
1.347823, -0.328507, 1.084489, 1, 0, 0.5058824, 1,
1.352548, -1.757854, 2.695822, 1, 0, 0.4980392, 1,
1.363998, 1.547955, 0.3363898, 1, 0, 0.4901961, 1,
1.368844, -0.04157421, 0.7772985, 1, 0, 0.4862745, 1,
1.378232, -1.266574, 4.416999, 1, 0, 0.4784314, 1,
1.38082, 1.652524, 1.425933, 1, 0, 0.4745098, 1,
1.381676, -0.7684005, 3.074975, 1, 0, 0.4666667, 1,
1.384619, 1.138164, 2.699828, 1, 0, 0.4627451, 1,
1.394814, 1.252041, 2.300148, 1, 0, 0.454902, 1,
1.395265, -1.593265, 2.567489, 1, 0, 0.4509804, 1,
1.3973, 0.9758221, -0.1676436, 1, 0, 0.4431373, 1,
1.406399, -0.55908, 2.18851, 1, 0, 0.4392157, 1,
1.407952, 0.5546006, -0.5606267, 1, 0, 0.4313726, 1,
1.410475, 0.304384, 1.504455, 1, 0, 0.427451, 1,
1.417568, -2.30602, 1.755702, 1, 0, 0.4196078, 1,
1.427801, 0.9679404, -0.4993185, 1, 0, 0.4156863, 1,
1.435832, -0.03812688, 3.129764, 1, 0, 0.4078431, 1,
1.435835, -0.4373314, 1.843035, 1, 0, 0.4039216, 1,
1.439499, 0.6792495, 2.30554, 1, 0, 0.3960784, 1,
1.482171, 0.005242077, 1.590422, 1, 0, 0.3882353, 1,
1.484917, -1.309338, 0.924022, 1, 0, 0.3843137, 1,
1.486188, 0.641579, 0.2110778, 1, 0, 0.3764706, 1,
1.506087, 1.390732, 1.579048, 1, 0, 0.372549, 1,
1.507343, -1.938299, 1.727418, 1, 0, 0.3647059, 1,
1.517037, -0.8535686, 1.652207, 1, 0, 0.3607843, 1,
1.520933, -0.3131313, 2.117212, 1, 0, 0.3529412, 1,
1.558337, 1.315959, 1.594429, 1, 0, 0.3490196, 1,
1.561265, -1.794765, 0.9852566, 1, 0, 0.3411765, 1,
1.566604, -0.2921029, 0.8876569, 1, 0, 0.3372549, 1,
1.56683, -0.7714053, 2.168685, 1, 0, 0.3294118, 1,
1.58472, 1.323144, 1.350919, 1, 0, 0.3254902, 1,
1.594113, 0.2157099, 1.210413, 1, 0, 0.3176471, 1,
1.595633, 1.096613, -0.2406968, 1, 0, 0.3137255, 1,
1.616903, 1.126078, -0.09668998, 1, 0, 0.3058824, 1,
1.625022, -0.5033066, 1.057935, 1, 0, 0.2980392, 1,
1.636003, 0.5702851, 2.272106, 1, 0, 0.2941177, 1,
1.645714, -0.3213149, 2.636704, 1, 0, 0.2862745, 1,
1.660067, -0.9329022, 1.261843, 1, 0, 0.282353, 1,
1.668231, 1.140927, 2.575133, 1, 0, 0.2745098, 1,
1.684927, 0.2680041, 1.130243, 1, 0, 0.2705882, 1,
1.687683, -0.3153586, 2.234488, 1, 0, 0.2627451, 1,
1.707318, 0.07165544, 0.641905, 1, 0, 0.2588235, 1,
1.709103, 0.1679867, 3.715504, 1, 0, 0.2509804, 1,
1.716475, -0.8134465, 2.334285, 1, 0, 0.2470588, 1,
1.72449, -0.001941146, 1.812709, 1, 0, 0.2392157, 1,
1.743733, 0.7077096, -0.0939763, 1, 0, 0.2352941, 1,
1.749344, 1.259174, 2.728672, 1, 0, 0.227451, 1,
1.794105, -0.08091658, 3.102335, 1, 0, 0.2235294, 1,
1.822171, 0.7202793, 2.892694, 1, 0, 0.2156863, 1,
1.827198, 0.7813597, 0.3856502, 1, 0, 0.2117647, 1,
1.827684, -0.5733205, 1.133432, 1, 0, 0.2039216, 1,
1.828891, 0.52266, 1.952373, 1, 0, 0.1960784, 1,
1.839553, -1.631677, 3.715515, 1, 0, 0.1921569, 1,
1.870963, 1.528738, 1.145001, 1, 0, 0.1843137, 1,
1.880314, 1.45454, 0.22226, 1, 0, 0.1803922, 1,
1.909605, 0.104035, 2.382944, 1, 0, 0.172549, 1,
1.927001, -1.697861, 1.989632, 1, 0, 0.1686275, 1,
1.938104, 0.7794423, 0.211878, 1, 0, 0.1607843, 1,
1.968595, 0.4418819, 1.696291, 1, 0, 0.1568628, 1,
1.971464, 0.4803754, 1.579413, 1, 0, 0.1490196, 1,
1.972569, 0.7682915, 0.8886919, 1, 0, 0.145098, 1,
1.986908, -0.3145964, 2.782172, 1, 0, 0.1372549, 1,
1.989464, 1.048903, -1.014545, 1, 0, 0.1333333, 1,
1.995152, 0.1324565, 3.149285, 1, 0, 0.1254902, 1,
1.996803, 0.6796819, 0.1109613, 1, 0, 0.1215686, 1,
2.022901, 0.9392375, 1.587834, 1, 0, 0.1137255, 1,
2.05918, -1.009021, 1.633026, 1, 0, 0.1098039, 1,
2.079839, 1.364155, 0.7269735, 1, 0, 0.1019608, 1,
2.101679, 0.846651, 0.4796822, 1, 0, 0.09411765, 1,
2.107647, -1.147137, 0.7971679, 1, 0, 0.09019608, 1,
2.118044, 1.143756, -0.1326898, 1, 0, 0.08235294, 1,
2.147589, -0.6909031, 2.52765, 1, 0, 0.07843138, 1,
2.150417, 0.9280492, 1.349137, 1, 0, 0.07058824, 1,
2.186363, 0.8274051, 0.9151266, 1, 0, 0.06666667, 1,
2.193838, -2.228828, 2.504255, 1, 0, 0.05882353, 1,
2.230737, 2.119198, 0.8931019, 1, 0, 0.05490196, 1,
2.2626, -0.9634827, 2.291412, 1, 0, 0.04705882, 1,
2.383582, -0.950129, 2.636846, 1, 0, 0.04313726, 1,
2.597911, -1.338687, 2.03475, 1, 0, 0.03529412, 1,
2.6312, -2.698581, 2.274515, 1, 0, 0.03137255, 1,
2.795407, 0.05511084, 2.289492, 1, 0, 0.02352941, 1,
2.956915, -1.802828, 3.282827, 1, 0, 0.01960784, 1,
3.015947, 0.5860803, 1.348132, 1, 0, 0.01176471, 1,
3.114221, -1.181439, 2.221773, 1, 0, 0.007843138, 1
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
0.0874449, -3.757616, -7.096937, 0, -0.5, 0.5, 0.5,
0.0874449, -3.757616, -7.096937, 1, -0.5, 0.5, 0.5,
0.0874449, -3.757616, -7.096937, 1, 1.5, 0.5, 0.5,
0.0874449, -3.757616, -7.096937, 0, 1.5, 0.5, 0.5
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
-3.965409, 0.4254164, -7.096937, 0, -0.5, 0.5, 0.5,
-3.965409, 0.4254164, -7.096937, 1, -0.5, 0.5, 0.5,
-3.965409, 0.4254164, -7.096937, 1, 1.5, 0.5, 0.5,
-3.965409, 0.4254164, -7.096937, 0, 1.5, 0.5, 0.5
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
-3.965409, -3.757616, 0.03083467, 0, -0.5, 0.5, 0.5,
-3.965409, -3.757616, 0.03083467, 1, -0.5, 0.5, 0.5,
-3.965409, -3.757616, 0.03083467, 1, 1.5, 0.5, 0.5,
-3.965409, -3.757616, 0.03083467, 0, 1.5, 0.5, 0.5
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
-2, -2.792301, -5.452066,
3, -2.792301, -5.452066,
-2, -2.792301, -5.452066,
-2, -2.953187, -5.726212,
-1, -2.792301, -5.452066,
-1, -2.953187, -5.726212,
0, -2.792301, -5.452066,
0, -2.953187, -5.726212,
1, -2.792301, -5.452066,
1, -2.953187, -5.726212,
2, -2.792301, -5.452066,
2, -2.953187, -5.726212,
3, -2.792301, -5.452066,
3, -2.953187, -5.726212
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
-2, -3.274958, -6.274502, 0, -0.5, 0.5, 0.5,
-2, -3.274958, -6.274502, 1, -0.5, 0.5, 0.5,
-2, -3.274958, -6.274502, 1, 1.5, 0.5, 0.5,
-2, -3.274958, -6.274502, 0, 1.5, 0.5, 0.5,
-1, -3.274958, -6.274502, 0, -0.5, 0.5, 0.5,
-1, -3.274958, -6.274502, 1, -0.5, 0.5, 0.5,
-1, -3.274958, -6.274502, 1, 1.5, 0.5, 0.5,
-1, -3.274958, -6.274502, 0, 1.5, 0.5, 0.5,
0, -3.274958, -6.274502, 0, -0.5, 0.5, 0.5,
0, -3.274958, -6.274502, 1, -0.5, 0.5, 0.5,
0, -3.274958, -6.274502, 1, 1.5, 0.5, 0.5,
0, -3.274958, -6.274502, 0, 1.5, 0.5, 0.5,
1, -3.274958, -6.274502, 0, -0.5, 0.5, 0.5,
1, -3.274958, -6.274502, 1, -0.5, 0.5, 0.5,
1, -3.274958, -6.274502, 1, 1.5, 0.5, 0.5,
1, -3.274958, -6.274502, 0, 1.5, 0.5, 0.5,
2, -3.274958, -6.274502, 0, -0.5, 0.5, 0.5,
2, -3.274958, -6.274502, 1, -0.5, 0.5, 0.5,
2, -3.274958, -6.274502, 1, 1.5, 0.5, 0.5,
2, -3.274958, -6.274502, 0, 1.5, 0.5, 0.5,
3, -3.274958, -6.274502, 0, -0.5, 0.5, 0.5,
3, -3.274958, -6.274502, 1, -0.5, 0.5, 0.5,
3, -3.274958, -6.274502, 1, 1.5, 0.5, 0.5,
3, -3.274958, -6.274502, 0, 1.5, 0.5, 0.5
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
-3.030135, -2, -5.452066,
-3.030135, 3, -5.452066,
-3.030135, -2, -5.452066,
-3.186014, -2, -5.726212,
-3.030135, -1, -5.452066,
-3.186014, -1, -5.726212,
-3.030135, 0, -5.452066,
-3.186014, 0, -5.726212,
-3.030135, 1, -5.452066,
-3.186014, 1, -5.726212,
-3.030135, 2, -5.452066,
-3.186014, 2, -5.726212,
-3.030135, 3, -5.452066,
-3.186014, 3, -5.726212
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
-3.497772, -2, -6.274502, 0, -0.5, 0.5, 0.5,
-3.497772, -2, -6.274502, 1, -0.5, 0.5, 0.5,
-3.497772, -2, -6.274502, 1, 1.5, 0.5, 0.5,
-3.497772, -2, -6.274502, 0, 1.5, 0.5, 0.5,
-3.497772, -1, -6.274502, 0, -0.5, 0.5, 0.5,
-3.497772, -1, -6.274502, 1, -0.5, 0.5, 0.5,
-3.497772, -1, -6.274502, 1, 1.5, 0.5, 0.5,
-3.497772, -1, -6.274502, 0, 1.5, 0.5, 0.5,
-3.497772, 0, -6.274502, 0, -0.5, 0.5, 0.5,
-3.497772, 0, -6.274502, 1, -0.5, 0.5, 0.5,
-3.497772, 0, -6.274502, 1, 1.5, 0.5, 0.5,
-3.497772, 0, -6.274502, 0, 1.5, 0.5, 0.5,
-3.497772, 1, -6.274502, 0, -0.5, 0.5, 0.5,
-3.497772, 1, -6.274502, 1, -0.5, 0.5, 0.5,
-3.497772, 1, -6.274502, 1, 1.5, 0.5, 0.5,
-3.497772, 1, -6.274502, 0, 1.5, 0.5, 0.5,
-3.497772, 2, -6.274502, 0, -0.5, 0.5, 0.5,
-3.497772, 2, -6.274502, 1, -0.5, 0.5, 0.5,
-3.497772, 2, -6.274502, 1, 1.5, 0.5, 0.5,
-3.497772, 2, -6.274502, 0, 1.5, 0.5, 0.5,
-3.497772, 3, -6.274502, 0, -0.5, 0.5, 0.5,
-3.497772, 3, -6.274502, 1, -0.5, 0.5, 0.5,
-3.497772, 3, -6.274502, 1, 1.5, 0.5, 0.5,
-3.497772, 3, -6.274502, 0, 1.5, 0.5, 0.5
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
-3.030135, -2.792301, -4,
-3.030135, -2.792301, 4,
-3.030135, -2.792301, -4,
-3.186014, -2.953187, -4,
-3.030135, -2.792301, -2,
-3.186014, -2.953187, -2,
-3.030135, -2.792301, 0,
-3.186014, -2.953187, 0,
-3.030135, -2.792301, 2,
-3.186014, -2.953187, 2,
-3.030135, -2.792301, 4,
-3.186014, -2.953187, 4
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
-3.497772, -3.274958, -4, 0, -0.5, 0.5, 0.5,
-3.497772, -3.274958, -4, 1, -0.5, 0.5, 0.5,
-3.497772, -3.274958, -4, 1, 1.5, 0.5, 0.5,
-3.497772, -3.274958, -4, 0, 1.5, 0.5, 0.5,
-3.497772, -3.274958, -2, 0, -0.5, 0.5, 0.5,
-3.497772, -3.274958, -2, 1, -0.5, 0.5, 0.5,
-3.497772, -3.274958, -2, 1, 1.5, 0.5, 0.5,
-3.497772, -3.274958, -2, 0, 1.5, 0.5, 0.5,
-3.497772, -3.274958, 0, 0, -0.5, 0.5, 0.5,
-3.497772, -3.274958, 0, 1, -0.5, 0.5, 0.5,
-3.497772, -3.274958, 0, 1, 1.5, 0.5, 0.5,
-3.497772, -3.274958, 0, 0, 1.5, 0.5, 0.5,
-3.497772, -3.274958, 2, 0, -0.5, 0.5, 0.5,
-3.497772, -3.274958, 2, 1, -0.5, 0.5, 0.5,
-3.497772, -3.274958, 2, 1, 1.5, 0.5, 0.5,
-3.497772, -3.274958, 2, 0, 1.5, 0.5, 0.5,
-3.497772, -3.274958, 4, 0, -0.5, 0.5, 0.5,
-3.497772, -3.274958, 4, 1, -0.5, 0.5, 0.5,
-3.497772, -3.274958, 4, 1, 1.5, 0.5, 0.5,
-3.497772, -3.274958, 4, 0, 1.5, 0.5, 0.5
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
-3.030135, -2.792301, -5.452066,
-3.030135, 3.643134, -5.452066,
-3.030135, -2.792301, 5.513736,
-3.030135, 3.643134, 5.513736,
-3.030135, -2.792301, -5.452066,
-3.030135, -2.792301, 5.513736,
-3.030135, 3.643134, -5.452066,
-3.030135, 3.643134, 5.513736,
-3.030135, -2.792301, -5.452066,
3.205025, -2.792301, -5.452066,
-3.030135, -2.792301, 5.513736,
3.205025, -2.792301, 5.513736,
-3.030135, 3.643134, -5.452066,
3.205025, 3.643134, -5.452066,
-3.030135, 3.643134, 5.513736,
3.205025, 3.643134, 5.513736,
3.205025, -2.792301, -5.452066,
3.205025, 3.643134, -5.452066,
3.205025, -2.792301, 5.513736,
3.205025, 3.643134, 5.513736,
3.205025, -2.792301, -5.452066,
3.205025, -2.792301, 5.513736,
3.205025, 3.643134, -5.452066,
3.205025, 3.643134, 5.513736
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
var radius = 7.561829;
var distance = 33.64343;
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
mvMatrix.translate( -0.0874449, -0.4254164, -0.03083467 );
mvMatrix.scale( 1.311273, 1.270466, 0.7455905 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.64343);
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
fenuron<-read.table("fenuron.xyz")
```

```
## Error in read.table("fenuron.xyz"): no lines available in input
```

```r
x<-fenuron$V2
```

```
## Error in eval(expr, envir, enclos): object 'fenuron' not found
```

```r
y<-fenuron$V3
```

```
## Error in eval(expr, envir, enclos): object 'fenuron' not found
```

```r
z<-fenuron$V4
```

```
## Error in eval(expr, envir, enclos): object 'fenuron' not found
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
-2.939332, 1.579962, -1.088942, 0, 0, 1, 1, 1,
-2.911942, -0.6468034, -0.4720476, 1, 0, 0, 1, 1,
-2.895315, -1.398105, -1.551607, 1, 0, 0, 1, 1,
-2.771139, -0.2697815, -2.928811, 1, 0, 0, 1, 1,
-2.729496, -0.07853374, -1.950288, 1, 0, 0, 1, 1,
-2.699999, 0.5472358, -1.37742, 1, 0, 0, 1, 1,
-2.629092, -0.008810749, -1.486588, 0, 0, 0, 1, 1,
-2.58773, -0.4496127, -0.452111, 0, 0, 0, 1, 1,
-2.514229, 0.5327455, -1.091179, 0, 0, 0, 1, 1,
-2.428766, 1.466764, 0.1507789, 0, 0, 0, 1, 1,
-2.31163, -0.5574017, -3.26589, 0, 0, 0, 1, 1,
-2.23128, 0.858272, 0.09578379, 0, 0, 0, 1, 1,
-2.178499, -0.1037977, -1.319891, 0, 0, 0, 1, 1,
-2.170181, -0.8016295, -2.815473, 1, 1, 1, 1, 1,
-2.163824, -1.090847, -1.400041, 1, 1, 1, 1, 1,
-2.156241, -0.4325362, -1.912775, 1, 1, 1, 1, 1,
-2.154936, -0.996838, -1.092082, 1, 1, 1, 1, 1,
-2.152828, -0.9323012, -2.372986, 1, 1, 1, 1, 1,
-2.145882, -0.326187, -1.343538, 1, 1, 1, 1, 1,
-2.139316, 0.7074852, -1.363587, 1, 1, 1, 1, 1,
-2.133222, 0.4220912, 1.173331, 1, 1, 1, 1, 1,
-2.132465, -0.1180087, -1.641941, 1, 1, 1, 1, 1,
-2.123454, 0.7845332, -2.13171, 1, 1, 1, 1, 1,
-2.087181, 1.076049, -1.800546, 1, 1, 1, 1, 1,
-2.042961, 1.210367, 0.5867172, 1, 1, 1, 1, 1,
-2.039428, 0.5365006, -1.930889, 1, 1, 1, 1, 1,
-2.036046, 3.063531, -0.2787471, 1, 1, 1, 1, 1,
-2.031825, -0.2349981, -0.7905082, 1, 1, 1, 1, 1,
-2.025971, 0.3361228, -1.914086, 0, 0, 1, 1, 1,
-2.013711, -0.8503169, -1.101172, 1, 0, 0, 1, 1,
-1.99674, 1.210672, 0.9920736, 1, 0, 0, 1, 1,
-1.993494, -1.130515, -3.347642, 1, 0, 0, 1, 1,
-1.980034, 1.019049, -0.162055, 1, 0, 0, 1, 1,
-1.945441, -1.401661, -2.661119, 1, 0, 0, 1, 1,
-1.931659, -0.99782, -1.200206, 0, 0, 0, 1, 1,
-1.90032, 0.1296228, -1.65951, 0, 0, 0, 1, 1,
-1.858454, -1.524301, -2.30054, 0, 0, 0, 1, 1,
-1.842533, -1.732484, -2.2159, 0, 0, 0, 1, 1,
-1.801389, -0.4816067, -1.48569, 0, 0, 0, 1, 1,
-1.792505, 0.6992972, -0.01850607, 0, 0, 0, 1, 1,
-1.754893, 0.08219327, -1.877643, 0, 0, 0, 1, 1,
-1.754194, 0.8258961, -0.2456196, 1, 1, 1, 1, 1,
-1.732524, 0.52596, -0.1234542, 1, 1, 1, 1, 1,
-1.724525, 1.279654, -1.583904, 1, 1, 1, 1, 1,
-1.717467, 0.3014401, -1.04502, 1, 1, 1, 1, 1,
-1.704203, -0.7160489, -2.061364, 1, 1, 1, 1, 1,
-1.690352, -0.642338, -2.33973, 1, 1, 1, 1, 1,
-1.687422, 0.1040064, 0.1208103, 1, 1, 1, 1, 1,
-1.684586, 0.2141492, -2.676324, 1, 1, 1, 1, 1,
-1.669863, -1.236713, -2.350063, 1, 1, 1, 1, 1,
-1.664063, 1.296868, -1.261692, 1, 1, 1, 1, 1,
-1.65921, 0.8193346, 0.4761108, 1, 1, 1, 1, 1,
-1.659107, -0.2663767, -1.854896, 1, 1, 1, 1, 1,
-1.656635, -1.179913, -1.471609, 1, 1, 1, 1, 1,
-1.648997, -0.3555982, -2.923014, 1, 1, 1, 1, 1,
-1.643902, 1.2947, 1.041296, 1, 1, 1, 1, 1,
-1.627321, 0.1574124, -2.995191, 0, 0, 1, 1, 1,
-1.625472, 0.4361315, 0.9302059, 1, 0, 0, 1, 1,
-1.615538, -0.06849156, -1.573328, 1, 0, 0, 1, 1,
-1.607898, 0.2262477, -0.6850194, 1, 0, 0, 1, 1,
-1.60682, 1.629178, -0.9720784, 1, 0, 0, 1, 1,
-1.599667, 0.9626815, -1.713901, 1, 0, 0, 1, 1,
-1.59372, -1.076941, -2.7954, 0, 0, 0, 1, 1,
-1.5906, -0.1112662, -3.410983, 0, 0, 0, 1, 1,
-1.590165, -0.1423394, -1.428302, 0, 0, 0, 1, 1,
-1.583207, 1.800807, 0.6433088, 0, 0, 0, 1, 1,
-1.580207, 0.1538129, -1.493051, 0, 0, 0, 1, 1,
-1.577034, -0.7257209, -2.307476, 0, 0, 0, 1, 1,
-1.558392, -1.034973, -2.751817, 0, 0, 0, 1, 1,
-1.547774, -0.4474669, -0.7186955, 1, 1, 1, 1, 1,
-1.544967, 1.786275, -1.179434, 1, 1, 1, 1, 1,
-1.542614, 0.3564337, -0.4674024, 1, 1, 1, 1, 1,
-1.537632, -0.05661602, -0.4299851, 1, 1, 1, 1, 1,
-1.531291, -0.01052529, -1.750502, 1, 1, 1, 1, 1,
-1.523753, 0.6588158, -1.513845, 1, 1, 1, 1, 1,
-1.518868, 1.04728, -3.107363, 1, 1, 1, 1, 1,
-1.491341, -1.005372, -3.976788, 1, 1, 1, 1, 1,
-1.487882, 0.4546438, -2.336464, 1, 1, 1, 1, 1,
-1.480577, -1.372199, -0.5551369, 1, 1, 1, 1, 1,
-1.479919, -2.421744, -2.790813, 1, 1, 1, 1, 1,
-1.472982, 0.6805204, -1.912225, 1, 1, 1, 1, 1,
-1.441809, 0.4800148, -0.3713862, 1, 1, 1, 1, 1,
-1.441609, 0.003193168, -1.389732, 1, 1, 1, 1, 1,
-1.441208, 0.1892161, -1.758315, 1, 1, 1, 1, 1,
-1.434273, -1.780833, -3.156227, 0, 0, 1, 1, 1,
-1.433878, 0.8679509, -1.2092, 1, 0, 0, 1, 1,
-1.422246, -1.020552, -2.020204, 1, 0, 0, 1, 1,
-1.41487, -0.07311906, -4.091067, 1, 0, 0, 1, 1,
-1.403062, 1.302691, -0.9354122, 1, 0, 0, 1, 1,
-1.401787, -0.6186983, -1.668477, 1, 0, 0, 1, 1,
-1.399014, 0.2960594, -2.332889, 0, 0, 0, 1, 1,
-1.397977, -0.9486471, -0.6850486, 0, 0, 0, 1, 1,
-1.383504, 0.9796928, -2.648567, 0, 0, 0, 1, 1,
-1.373179, 1.176471, -1.747339, 0, 0, 0, 1, 1,
-1.371366, 0.2831419, -3.699068, 0, 0, 0, 1, 1,
-1.366233, 2.363529, 0.07486293, 0, 0, 0, 1, 1,
-1.360623, -1.666828, -2.91204, 0, 0, 0, 1, 1,
-1.360282, 1.255603, -1.524687, 1, 1, 1, 1, 1,
-1.355087, -0.5748079, -3.033999, 1, 1, 1, 1, 1,
-1.34361, -0.3770323, -1.476162, 1, 1, 1, 1, 1,
-1.341907, 0.3179193, -2.274877, 1, 1, 1, 1, 1,
-1.330079, -0.8888606, -1.205453, 1, 1, 1, 1, 1,
-1.323738, 0.3827992, -2.223177, 1, 1, 1, 1, 1,
-1.32105, -0.4217589, -3.591539, 1, 1, 1, 1, 1,
-1.320898, 0.4431992, -0.5774884, 1, 1, 1, 1, 1,
-1.316779, 0.1154539, -1.676086, 1, 1, 1, 1, 1,
-1.315679, 0.997555, 0.1275432, 1, 1, 1, 1, 1,
-1.31356, 0.8295718, -1.270657, 1, 1, 1, 1, 1,
-1.297865, 1.159275, -0.7685028, 1, 1, 1, 1, 1,
-1.297758, 2.514306, -0.860674, 1, 1, 1, 1, 1,
-1.29615, 0.6474299, -0.7895251, 1, 1, 1, 1, 1,
-1.295076, 0.96035, -0.396067, 1, 1, 1, 1, 1,
-1.294981, 0.3872685, -0.1161188, 0, 0, 1, 1, 1,
-1.289972, -1.147662, -2.657945, 1, 0, 0, 1, 1,
-1.275904, 1.847788, -0.7922051, 1, 0, 0, 1, 1,
-1.270886, -0.4868053, -2.134945, 1, 0, 0, 1, 1,
-1.260062, 1.502365, 0.7074845, 1, 0, 0, 1, 1,
-1.256238, -1.64087, -2.91397, 1, 0, 0, 1, 1,
-1.243997, -1.483457, -2.623191, 0, 0, 0, 1, 1,
-1.237037, 0.3025569, -0.6383008, 0, 0, 0, 1, 1,
-1.236944, -0.8343229, -2.422181, 0, 0, 0, 1, 1,
-1.227308, 0.982846, -0.6603246, 0, 0, 0, 1, 1,
-1.224636, -1.555659, -4.474035, 0, 0, 0, 1, 1,
-1.223305, -2.471081, -1.007559, 0, 0, 0, 1, 1,
-1.221226, -1.428049, -4.142929, 0, 0, 0, 1, 1,
-1.213513, 0.5389028, -2.727723, 1, 1, 1, 1, 1,
-1.21023, 1.479332, -0.1346906, 1, 1, 1, 1, 1,
-1.210009, 1.027162, -1.358986, 1, 1, 1, 1, 1,
-1.205696, -0.04325684, -1.536541, 1, 1, 1, 1, 1,
-1.204439, 0.2055592, -1.615075, 1, 1, 1, 1, 1,
-1.196895, -0.5846399, -1.120327, 1, 1, 1, 1, 1,
-1.196549, -0.05692483, -3.544183, 1, 1, 1, 1, 1,
-1.191729, 0.4820668, -1.043806, 1, 1, 1, 1, 1,
-1.190248, 0.3666568, -0.4883248, 1, 1, 1, 1, 1,
-1.177586, 0.6395088, -0.7270813, 1, 1, 1, 1, 1,
-1.175104, 0.2860806, -1.227346, 1, 1, 1, 1, 1,
-1.173728, -0.0168069, -2.389531, 1, 1, 1, 1, 1,
-1.166547, -0.4889086, -2.469053, 1, 1, 1, 1, 1,
-1.16564, -1.482774, -3.368076, 1, 1, 1, 1, 1,
-1.16466, -0.1518336, -0.1545954, 1, 1, 1, 1, 1,
-1.162834, -1.060017, -1.044728, 0, 0, 1, 1, 1,
-1.155141, -1.369499, -2.124068, 1, 0, 0, 1, 1,
-1.14204, -1.155151, -1.410362, 1, 0, 0, 1, 1,
-1.139751, -0.557373, -1.26718, 1, 0, 0, 1, 1,
-1.135376, -0.07571535, -1.467813, 1, 0, 0, 1, 1,
-1.126431, -1.394462, -3.964429, 1, 0, 0, 1, 1,
-1.122469, 1.151316, -0.3576267, 0, 0, 0, 1, 1,
-1.120929, -1.711437, -1.297724, 0, 0, 0, 1, 1,
-1.11657, 0.4451977, -1.739735, 0, 0, 0, 1, 1,
-1.114656, 2.654886, 0.2285017, 0, 0, 0, 1, 1,
-1.110759, -0.3039079, -1.560615, 0, 0, 0, 1, 1,
-1.102709, 0.4885642, 0.05507179, 0, 0, 0, 1, 1,
-1.097035, -0.0295797, -0.8577454, 0, 0, 0, 1, 1,
-1.095201, 1.345832, -0.7155201, 1, 1, 1, 1, 1,
-1.084389, 1.10495, -1.462473, 1, 1, 1, 1, 1,
-1.080675, 0.1907075, -0.9801075, 1, 1, 1, 1, 1,
-1.076797, 1.839487, 0.0435424, 1, 1, 1, 1, 1,
-1.073886, 0.1173181, -2.672882, 1, 1, 1, 1, 1,
-1.061892, 1.265729, 0.2725042, 1, 1, 1, 1, 1,
-1.053503, -0.5198146, -2.290397, 1, 1, 1, 1, 1,
-1.052998, -1.620534, -3.323809, 1, 1, 1, 1, 1,
-1.036727, -0.8885993, -1.575625, 1, 1, 1, 1, 1,
-1.033697, -1.396971, -2.180835, 1, 1, 1, 1, 1,
-1.026008, 1.578425, -0.5542856, 1, 1, 1, 1, 1,
-1.024752, -0.905201, -4.151702, 1, 1, 1, 1, 1,
-1.011857, -0.09394428, -0.887803, 1, 1, 1, 1, 1,
-1.007218, 0.9010607, -0.6000424, 1, 1, 1, 1, 1,
-1.000195, 0.5203236, -3.054851, 1, 1, 1, 1, 1,
-0.9846704, 0.5915154, -2.461109, 0, 0, 1, 1, 1,
-0.9833589, -2.267186, -3.093247, 1, 0, 0, 1, 1,
-0.96999, 0.1539149, -0.7911477, 1, 0, 0, 1, 1,
-0.9686409, -0.2487409, -1.987192, 1, 0, 0, 1, 1,
-0.9677065, -1.047723, -2.022207, 1, 0, 0, 1, 1,
-0.9662296, 0.6618744, -1.23471, 1, 0, 0, 1, 1,
-0.9634092, -1.506927, -2.810632, 0, 0, 0, 1, 1,
-0.9614549, 2.389245, -2.664972, 0, 0, 0, 1, 1,
-0.9606209, -0.5144044, -2.122973, 0, 0, 0, 1, 1,
-0.9597353, -0.09243348, -3.162924, 0, 0, 0, 1, 1,
-0.9542899, 0.8302254, -1.27487, 0, 0, 0, 1, 1,
-0.9519614, 0.8967854, 0.69715, 0, 0, 0, 1, 1,
-0.9448859, -0.7544803, -1.803544, 0, 0, 0, 1, 1,
-0.9406342, -0.1315088, -1.257251, 1, 1, 1, 1, 1,
-0.9349109, -1.444522, -1.737403, 1, 1, 1, 1, 1,
-0.9263175, -0.3374424, -1.515774, 1, 1, 1, 1, 1,
-0.9259669, -0.1088107, -1.784759, 1, 1, 1, 1, 1,
-0.9224494, 1.589581, -0.7033968, 1, 1, 1, 1, 1,
-0.9185082, -0.1634361, -2.809926, 1, 1, 1, 1, 1,
-0.9160672, 1.930345, -1.081165, 1, 1, 1, 1, 1,
-0.9078337, 0.9544661, -1.400966, 1, 1, 1, 1, 1,
-0.9041353, 1.311818, -0.7451567, 1, 1, 1, 1, 1,
-0.9002294, 1.065042, -1.991713, 1, 1, 1, 1, 1,
-0.9002001, 1.182879, -2.032768, 1, 1, 1, 1, 1,
-0.8830844, -0.03701042, -2.177049, 1, 1, 1, 1, 1,
-0.8810405, 0.8013872, -1.125055, 1, 1, 1, 1, 1,
-0.8721347, -0.2542242, -0.7763823, 1, 1, 1, 1, 1,
-0.8661347, -0.002135416, -1.480436, 1, 1, 1, 1, 1,
-0.8631908, -1.739635, -3.149623, 0, 0, 1, 1, 1,
-0.8619894, 0.7017568, -1.674407, 1, 0, 0, 1, 1,
-0.861007, 0.5502397, -1.719323, 1, 0, 0, 1, 1,
-0.8567589, -1.303055, -2.477617, 1, 0, 0, 1, 1,
-0.8531982, 0.3274836, -0.6705178, 1, 0, 0, 1, 1,
-0.8523515, -0.1158436, -1.322535, 1, 0, 0, 1, 1,
-0.8441248, -2.0286, -3.645175, 0, 0, 0, 1, 1,
-0.8245411, -1.273382, -3.270455, 0, 0, 0, 1, 1,
-0.8172449, -0.171439, 0.2525072, 0, 0, 0, 1, 1,
-0.8166559, 0.8187376, -0.4782573, 0, 0, 0, 1, 1,
-0.811351, 1.395529, -0.8718339, 0, 0, 0, 1, 1,
-0.7999713, 1.23345, -1.720764, 0, 0, 0, 1, 1,
-0.7917542, -0.5101418, -2.810429, 0, 0, 0, 1, 1,
-0.7842393, -1.080123, -3.934016, 1, 1, 1, 1, 1,
-0.7803606, -0.4459278, -0.3738213, 1, 1, 1, 1, 1,
-0.7780119, -0.2705084, -1.415352, 1, 1, 1, 1, 1,
-0.7707111, -1.852967, -3.321925, 1, 1, 1, 1, 1,
-0.7686363, -0.9640049, -2.689451, 1, 1, 1, 1, 1,
-0.7647389, 0.4431937, -1.781602, 1, 1, 1, 1, 1,
-0.7644687, 0.6199678, -0.2108566, 1, 1, 1, 1, 1,
-0.760576, 0.3891521, 0.9864677, 1, 1, 1, 1, 1,
-0.7578706, 0.5698419, -0.4142511, 1, 1, 1, 1, 1,
-0.7552711, 1.188491, 0.2867744, 1, 1, 1, 1, 1,
-0.7541774, 0.5207223, -1.035953, 1, 1, 1, 1, 1,
-0.7532822, -0.07786959, -1.34199, 1, 1, 1, 1, 1,
-0.7512246, 0.8227921, 0.2108371, 1, 1, 1, 1, 1,
-0.7510719, -0.6372039, -0.6329278, 1, 1, 1, 1, 1,
-0.750532, 0.735755, -1.879564, 1, 1, 1, 1, 1,
-0.7478992, 0.1913043, -1.718946, 0, 0, 1, 1, 1,
-0.7469434, 1.691403, -0.8498192, 1, 0, 0, 1, 1,
-0.7443883, 0.9462175, 0.3292747, 1, 0, 0, 1, 1,
-0.7441917, 0.585891, -0.856793, 1, 0, 0, 1, 1,
-0.7404798, -0.5388821, -3.993255, 1, 0, 0, 1, 1,
-0.7396882, 0.2015616, -1.701446, 1, 0, 0, 1, 1,
-0.7396433, -1.044382, -1.986734, 0, 0, 0, 1, 1,
-0.7392738, -1.384213, -2.587411, 0, 0, 0, 1, 1,
-0.7366935, -1.277328, -0.8424491, 0, 0, 0, 1, 1,
-0.7340096, 1.295316, -1.191913, 0, 0, 0, 1, 1,
-0.7329625, -0.6409191, -1.478962, 0, 0, 0, 1, 1,
-0.7281809, 1.645753, -0.4341613, 0, 0, 0, 1, 1,
-0.7269862, -0.6976609, -2.568188, 0, 0, 0, 1, 1,
-0.7264968, -0.242185, -2.526248, 1, 1, 1, 1, 1,
-0.725283, -0.05227417, -0.4494149, 1, 1, 1, 1, 1,
-0.7252603, 0.7927001, 1.018586, 1, 1, 1, 1, 1,
-0.7246978, 0.6975143, -0.5716401, 1, 1, 1, 1, 1,
-0.7240441, -0.9871877, -1.874886, 1, 1, 1, 1, 1,
-0.7200916, 0.7735813, -0.1360158, 1, 1, 1, 1, 1,
-0.7185964, 0.8447726, -0.8802861, 1, 1, 1, 1, 1,
-0.7166818, -0.1313872, -0.8949118, 1, 1, 1, 1, 1,
-0.7080996, 0.1621223, -2.095695, 1, 1, 1, 1, 1,
-0.7079286, -0.9854013, -1.856055, 1, 1, 1, 1, 1,
-0.7075637, 0.05170349, -2.505166, 1, 1, 1, 1, 1,
-0.7062722, -2.61738, -2.835932, 1, 1, 1, 1, 1,
-0.7025554, 0.6475244, -0.9255056, 1, 1, 1, 1, 1,
-0.7023372, 0.02820037, -1.217323, 1, 1, 1, 1, 1,
-0.7012464, -2.626742, -0.7740678, 1, 1, 1, 1, 1,
-0.6938397, 1.009885, -1.110205, 0, 0, 1, 1, 1,
-0.693204, 0.4385269, 0.4855239, 1, 0, 0, 1, 1,
-0.6905426, 0.4110392, -0.8854606, 1, 0, 0, 1, 1,
-0.688985, -0.3399016, -2.072794, 1, 0, 0, 1, 1,
-0.6872606, 0.3575184, -1.222986, 1, 0, 0, 1, 1,
-0.6775374, -1.065027, -0.8867587, 1, 0, 0, 1, 1,
-0.6754584, -0.06494876, 0.3363403, 0, 0, 0, 1, 1,
-0.6741531, 0.3357621, -0.7297364, 0, 0, 0, 1, 1,
-0.670383, 0.4116789, -0.715881, 0, 0, 0, 1, 1,
-0.6698691, -0.05111451, -1.53809, 0, 0, 0, 1, 1,
-0.6660087, 0.1148266, -0.3618079, 0, 0, 0, 1, 1,
-0.6645991, 0.1906628, -0.3449034, 0, 0, 0, 1, 1,
-0.663713, 0.4349922, -0.5295888, 0, 0, 0, 1, 1,
-0.6632696, -2.054683, -2.025288, 1, 1, 1, 1, 1,
-0.6614984, 1.227821, -0.2370863, 1, 1, 1, 1, 1,
-0.6592651, 0.09109806, -1.421399, 1, 1, 1, 1, 1,
-0.6564968, -0.5533594, -1.777025, 1, 1, 1, 1, 1,
-0.6510563, -0.933781, -3.329334, 1, 1, 1, 1, 1,
-0.6504879, -0.7135698, -1.387914, 1, 1, 1, 1, 1,
-0.6450579, -0.002630973, -1.259674, 1, 1, 1, 1, 1,
-0.6437299, -0.4749723, -2.628313, 1, 1, 1, 1, 1,
-0.6432471, -0.2793816, -1.57639, 1, 1, 1, 1, 1,
-0.6429155, 1.153018, -1.632868, 1, 1, 1, 1, 1,
-0.6374621, 0.5089471, -2.333493, 1, 1, 1, 1, 1,
-0.6367534, -0.37654, -2.45234, 1, 1, 1, 1, 1,
-0.6204282, -0.4711025, -3.434483, 1, 1, 1, 1, 1,
-0.6085951, -0.333774, -4.974534, 1, 1, 1, 1, 1,
-0.608459, 1.145378, -1.619911, 1, 1, 1, 1, 1,
-0.6082697, -0.3826952, -0.3927099, 0, 0, 1, 1, 1,
-0.6021073, 0.6857398, -1.264244, 1, 0, 0, 1, 1,
-0.596818, 0.4115807, -0.5798517, 1, 0, 0, 1, 1,
-0.5965478, -0.02180887, -1.28567, 1, 0, 0, 1, 1,
-0.5932492, 0.4112377, 0.299897, 1, 0, 0, 1, 1,
-0.5906893, 0.8317786, -0.9933187, 1, 0, 0, 1, 1,
-0.5797138, 2.000032, 0.4818562, 0, 0, 0, 1, 1,
-0.5761788, 0.423005, -2.788344, 0, 0, 0, 1, 1,
-0.5716382, -0.1385038, -3.62624, 0, 0, 0, 1, 1,
-0.5672799, -0.5940834, -1.913174, 0, 0, 0, 1, 1,
-0.5645806, 1.860891, 0.4130771, 0, 0, 0, 1, 1,
-0.5605519, 0.5004756, -1.012481, 0, 0, 0, 1, 1,
-0.5585904, -0.3252252, -2.703475, 0, 0, 0, 1, 1,
-0.5570018, -1.458336, -3.002115, 1, 1, 1, 1, 1,
-0.5534248, -0.7511399, -3.778487, 1, 1, 1, 1, 1,
-0.5510556, 1.867857, -1.48946, 1, 1, 1, 1, 1,
-0.5487904, 2.147361, 1.389561, 1, 1, 1, 1, 1,
-0.5484743, -1.093368, -3.057148, 1, 1, 1, 1, 1,
-0.5462262, 1.818266, 0.6261308, 1, 1, 1, 1, 1,
-0.5426658, 0.8927391, 0.5718428, 1, 1, 1, 1, 1,
-0.5418257, -0.2198769, -2.443633, 1, 1, 1, 1, 1,
-0.5347982, 0.2509823, -0.04343701, 1, 1, 1, 1, 1,
-0.5196483, 1.268428, 0.003875645, 1, 1, 1, 1, 1,
-0.5176145, 0.4825022, 0.04978771, 1, 1, 1, 1, 1,
-0.5154699, 0.1549126, -0.931911, 1, 1, 1, 1, 1,
-0.5146603, 0.8634511, -1.553194, 1, 1, 1, 1, 1,
-0.5069632, -0.3289133, -0.9057747, 1, 1, 1, 1, 1,
-0.5040122, 0.4977525, 0.1784422, 1, 1, 1, 1, 1,
-0.5030037, -1.783388, -3.818306, 0, 0, 1, 1, 1,
-0.4975889, -1.336494, -4.154772, 1, 0, 0, 1, 1,
-0.4923514, 0.8422458, 1.094495, 1, 0, 0, 1, 1,
-0.4895704, -0.4445143, -1.476827, 1, 0, 0, 1, 1,
-0.4859502, 1.287657, 0.524529, 1, 0, 0, 1, 1,
-0.4819248, -1.010912, -2.825024, 1, 0, 0, 1, 1,
-0.4736903, -0.005850656, -1.848502, 0, 0, 0, 1, 1,
-0.4729974, -0.9860616, -2.056871, 0, 0, 0, 1, 1,
-0.4688768, 1.052666, -0.4815941, 0, 0, 0, 1, 1,
-0.4676687, 1.422492, -0.4421228, 0, 0, 0, 1, 1,
-0.463909, -0.132264, -2.120088, 0, 0, 0, 1, 1,
-0.4628595, -2.653084, -4.835059, 0, 0, 0, 1, 1,
-0.4622249, 1.643097, -2.244872, 0, 0, 0, 1, 1,
-0.4609145, 0.1854237, -1.973689, 1, 1, 1, 1, 1,
-0.4607542, 0.4447459, 0.4783129, 1, 1, 1, 1, 1,
-0.4559774, -1.676595, -3.344726, 1, 1, 1, 1, 1,
-0.4556582, 2.053371, 0.6275668, 1, 1, 1, 1, 1,
-0.4548436, 1.49289, -0.8845612, 1, 1, 1, 1, 1,
-0.4479218, -0.2749074, -0.3276572, 1, 1, 1, 1, 1,
-0.44486, 2.013591, 0.2634651, 1, 1, 1, 1, 1,
-0.4441227, -1.266612, -2.932648, 1, 1, 1, 1, 1,
-0.4432008, -1.097587, -3.698259, 1, 1, 1, 1, 1,
-0.4413222, 0.9810621, 0.556967, 1, 1, 1, 1, 1,
-0.4369343, -0.5043299, -3.217607, 1, 1, 1, 1, 1,
-0.4262486, -0.7309229, -2.343972, 1, 1, 1, 1, 1,
-0.4257947, -0.5910142, -0.9120405, 1, 1, 1, 1, 1,
-0.4249185, 1.409607, -2.778485, 1, 1, 1, 1, 1,
-0.4239416, -0.7197098, -2.179329, 1, 1, 1, 1, 1,
-0.4233531, 0.5473221, -0.191242, 0, 0, 1, 1, 1,
-0.4202916, 1.514416, -0.513706, 1, 0, 0, 1, 1,
-0.409344, -1.086102, -2.614707, 1, 0, 0, 1, 1,
-0.4073556, 1.477862, 0.1693439, 1, 0, 0, 1, 1,
-0.4069673, -1.343763, -3.41351, 1, 0, 0, 1, 1,
-0.4068756, -1.464617, -2.304961, 1, 0, 0, 1, 1,
-0.4022779, -0.9529064, -3.544632, 0, 0, 0, 1, 1,
-0.3966002, 0.9037018, 1.700416, 0, 0, 0, 1, 1,
-0.3958893, 0.6596836, 0.4770904, 0, 0, 0, 1, 1,
-0.3957758, -0.176738, 0.05647834, 0, 0, 0, 1, 1,
-0.394612, -0.7140965, -2.243001, 0, 0, 0, 1, 1,
-0.3932268, 0.3189093, -0.9187244, 0, 0, 0, 1, 1,
-0.392818, -0.7842323, -2.590929, 0, 0, 0, 1, 1,
-0.3895705, -1.19066, -4.574904, 1, 1, 1, 1, 1,
-0.3886154, -1.182152, -4.235871, 1, 1, 1, 1, 1,
-0.3798276, -1.505621, -3.902704, 1, 1, 1, 1, 1,
-0.3779045, -1.10102, -2.578105, 1, 1, 1, 1, 1,
-0.3705271, 1.677192, -1.78071, 1, 1, 1, 1, 1,
-0.3671596, 1.711313, 0.6954194, 1, 1, 1, 1, 1,
-0.3663319, 0.4214792, -1.563486, 1, 1, 1, 1, 1,
-0.3654251, 0.1638438, -0.6504794, 1, 1, 1, 1, 1,
-0.3615036, -0.02884522, -1.051473, 1, 1, 1, 1, 1,
-0.3612949, 0.2850271, 0.1859677, 1, 1, 1, 1, 1,
-0.3586584, -1.137887, -3.541177, 1, 1, 1, 1, 1,
-0.3567242, 0.3664202, -0.1762229, 1, 1, 1, 1, 1,
-0.3548053, 0.3454802, -0.06693378, 1, 1, 1, 1, 1,
-0.3506249, 0.3864296, 0.230455, 1, 1, 1, 1, 1,
-0.3444906, -0.8198966, -5.29237, 1, 1, 1, 1, 1,
-0.3408581, 1.057359, -0.7133183, 0, 0, 1, 1, 1,
-0.3388805, -0.1529588, -1.425655, 1, 0, 0, 1, 1,
-0.3345608, 0.4582886, -0.2345901, 1, 0, 0, 1, 1,
-0.3336189, -0.1423108, -3.64221, 1, 0, 0, 1, 1,
-0.3331009, 0.1103279, 0.1300579, 1, 0, 0, 1, 1,
-0.3329412, -0.4193156, -2.050143, 1, 0, 0, 1, 1,
-0.3266366, -0.04169066, -0.971791, 0, 0, 0, 1, 1,
-0.3261861, -0.01471215, 0.7100163, 0, 0, 0, 1, 1,
-0.3249888, 1.139967, 0.4855317, 0, 0, 0, 1, 1,
-0.3199253, 0.8491576, -1.040986, 0, 0, 0, 1, 1,
-0.319508, -0.339165, -2.283421, 0, 0, 0, 1, 1,
-0.3157417, 0.5081054, 0.2195389, 0, 0, 0, 1, 1,
-0.3101423, 0.2105455, -1.331599, 0, 0, 0, 1, 1,
-0.310111, -2.421647, -3.21847, 1, 1, 1, 1, 1,
-0.3084379, -1.390498, -2.62202, 1, 1, 1, 1, 1,
-0.3047579, 0.04703539, -1.720231, 1, 1, 1, 1, 1,
-0.3041256, 1.018844, -0.771121, 1, 1, 1, 1, 1,
-0.3035796, -0.6254241, -2.175106, 1, 1, 1, 1, 1,
-0.3008164, -0.5471706, -3.144752, 1, 1, 1, 1, 1,
-0.2984451, 0.163035, -0.3058998, 1, 1, 1, 1, 1,
-0.2909683, 1.712807, 0.1803533, 1, 1, 1, 1, 1,
-0.2904805, -0.251779, -3.039383, 1, 1, 1, 1, 1,
-0.2856965, -1.89328, -2.403539, 1, 1, 1, 1, 1,
-0.2853079, -0.02110257, -3.41125, 1, 1, 1, 1, 1,
-0.2844901, 1.609227, -0.2047106, 1, 1, 1, 1, 1,
-0.2821105, -0.0104832, -1.796443, 1, 1, 1, 1, 1,
-0.2817314, 1.147587, 0.8374424, 1, 1, 1, 1, 1,
-0.2811604, 1.04156, -0.3092242, 1, 1, 1, 1, 1,
-0.2800162, 1.732115, -0.4463, 0, 0, 1, 1, 1,
-0.2762279, -0.6750726, -4.465182, 1, 0, 0, 1, 1,
-0.2717346, 1.800593, -1.355301, 1, 0, 0, 1, 1,
-0.270723, 0.6845748, -2.290593, 1, 0, 0, 1, 1,
-0.2705624, -1.198815, -3.850191, 1, 0, 0, 1, 1,
-0.2679429, -1.527149, -3.250737, 1, 0, 0, 1, 1,
-0.2669584, 0.3297723, -1.54378, 0, 0, 0, 1, 1,
-0.2660314, 0.7631359, -1.612872, 0, 0, 0, 1, 1,
-0.2604258, -0.667994, -2.748955, 0, 0, 0, 1, 1,
-0.2600732, 0.2321851, 0.5287895, 0, 0, 0, 1, 1,
-0.2574079, -0.8698985, -2.348003, 0, 0, 0, 1, 1,
-0.2573108, -0.1160907, -1.842234, 0, 0, 0, 1, 1,
-0.2570906, 0.5406224, -0.5120998, 0, 0, 0, 1, 1,
-0.2547353, 0.1769549, -0.4091299, 1, 1, 1, 1, 1,
-0.2510076, 1.223029, 1.352434, 1, 1, 1, 1, 1,
-0.2455745, 0.7794871, -1.045471, 1, 1, 1, 1, 1,
-0.2454955, 0.8405793, 1.411095, 1, 1, 1, 1, 1,
-0.2452215, 0.3369069, -3.30021, 1, 1, 1, 1, 1,
-0.2420366, 1.4531, -1.762529, 1, 1, 1, 1, 1,
-0.2348847, -0.6095528, -1.327678, 1, 1, 1, 1, 1,
-0.2338446, 0.8301015, -0.2177216, 1, 1, 1, 1, 1,
-0.2330422, 0.5028347, -1.312554, 1, 1, 1, 1, 1,
-0.2328759, 0.8863778, -0.7581679, 1, 1, 1, 1, 1,
-0.2324714, -0.09314002, -1.940914, 1, 1, 1, 1, 1,
-0.231315, -0.7030591, -3.29776, 1, 1, 1, 1, 1,
-0.2311387, -0.939625, -3.278977, 1, 1, 1, 1, 1,
-0.2298851, -0.6429926, -4.942637, 1, 1, 1, 1, 1,
-0.2288282, -2.369327, -2.715267, 1, 1, 1, 1, 1,
-0.228516, 1.760493, -0.4262944, 0, 0, 1, 1, 1,
-0.2270262, 0.9297727, -1.288064, 1, 0, 0, 1, 1,
-0.2244641, -0.3375192, -3.542482, 1, 0, 0, 1, 1,
-0.2236007, -0.9381742, -1.520989, 1, 0, 0, 1, 1,
-0.2220114, -0.1326058, -1.586085, 1, 0, 0, 1, 1,
-0.2212896, 0.934507, -0.01113562, 1, 0, 0, 1, 1,
-0.2207974, 0.6569605, -0.04695863, 0, 0, 0, 1, 1,
-0.2103826, 0.251039, -0.3261431, 0, 0, 0, 1, 1,
-0.2083033, -0.8901771, -1.868035, 0, 0, 0, 1, 1,
-0.2010993, 0.8763941, -0.06155926, 0, 0, 0, 1, 1,
-0.19176, -0.1602295, -1.781803, 0, 0, 0, 1, 1,
-0.1870951, -0.05497561, -2.653689, 0, 0, 0, 1, 1,
-0.1861745, -1.245089, -2.993567, 0, 0, 0, 1, 1,
-0.1861668, 1.045062, -0.4886302, 1, 1, 1, 1, 1,
-0.1859147, 1.583005, -0.9298671, 1, 1, 1, 1, 1,
-0.1817649, -0.7260709, -3.348817, 1, 1, 1, 1, 1,
-0.1762696, 0.1028636, -0.9972781, 1, 1, 1, 1, 1,
-0.1751326, 0.8048687, -0.9168153, 1, 1, 1, 1, 1,
-0.1746458, 1.552186, -0.3079576, 1, 1, 1, 1, 1,
-0.1674831, -0.5632868, -1.113763, 1, 1, 1, 1, 1,
-0.1629752, 0.6911667, -1.093386, 1, 1, 1, 1, 1,
-0.1585424, -1.607182, -3.253632, 1, 1, 1, 1, 1,
-0.1545091, 0.7700024, -0.6240002, 1, 1, 1, 1, 1,
-0.1480139, -0.7705909, -2.224304, 1, 1, 1, 1, 1,
-0.1455953, -0.006396041, 1.914067, 1, 1, 1, 1, 1,
-0.1411945, 0.6160576, -0.03965268, 1, 1, 1, 1, 1,
-0.1391646, -2.344949, -3.54901, 1, 1, 1, 1, 1,
-0.1324772, -1.844878, -4.063016, 1, 1, 1, 1, 1,
-0.1301183, 2.498483, 0.6169435, 0, 0, 1, 1, 1,
-0.1263605, 0.4903276, -0.9047541, 1, 0, 0, 1, 1,
-0.1254107, 0.2170293, -0.5714909, 1, 0, 0, 1, 1,
-0.1249218, -0.07398427, -0.9679385, 1, 0, 0, 1, 1,
-0.1232628, 1.691998, -0.5791333, 1, 0, 0, 1, 1,
-0.1205296, -0.6324798, -4.110418, 1, 0, 0, 1, 1,
-0.1151599, -0.9800669, -4.519521, 0, 0, 0, 1, 1,
-0.1098737, -0.6756175, -2.624886, 0, 0, 0, 1, 1,
-0.1069108, 0.9547192, -1.534014, 0, 0, 0, 1, 1,
-0.1039554, -0.5154316, -4.427751, 0, 0, 0, 1, 1,
-0.1001169, 0.3313632, 0.1735649, 0, 0, 0, 1, 1,
-0.09708536, -1.135347, -2.847407, 0, 0, 0, 1, 1,
-0.08855052, -0.06125344, -3.064059, 0, 0, 0, 1, 1,
-0.08836177, 0.4459778, 1.289238, 1, 1, 1, 1, 1,
-0.08717411, -0.44253, -3.508671, 1, 1, 1, 1, 1,
-0.08119477, 1.103937, -1.565503, 1, 1, 1, 1, 1,
-0.06800714, 0.9038427, -0.5503139, 1, 1, 1, 1, 1,
-0.06110555, 0.02363129, -1.039013, 1, 1, 1, 1, 1,
-0.05817292, 0.7798622, 0.1699239, 1, 1, 1, 1, 1,
-0.0537839, 0.6224847, -1.010482, 1, 1, 1, 1, 1,
-0.0471576, -0.4223473, -1.020677, 1, 1, 1, 1, 1,
-0.04612107, 2.002972, -2.700714, 1, 1, 1, 1, 1,
-0.04594988, 1.187986, -1.17589, 1, 1, 1, 1, 1,
-0.04476971, -1.168543, -2.556505, 1, 1, 1, 1, 1,
-0.04378473, 1.010127, 0.7060106, 1, 1, 1, 1, 1,
-0.0412961, 0.8137898, -1.332049, 1, 1, 1, 1, 1,
-0.04079746, 1.277553, 0.1868053, 1, 1, 1, 1, 1,
-0.03766045, -0.2394699, -4.156532, 1, 1, 1, 1, 1,
-0.03089581, -1.944863, -1.378699, 0, 0, 1, 1, 1,
-0.02862772, 1.394376, 1.140193, 1, 0, 0, 1, 1,
-0.02662104, 1.712435, 1.189458, 1, 0, 0, 1, 1,
-0.02426224, -0.8004535, -1.986858, 1, 0, 0, 1, 1,
-0.02304693, -0.428692, -2.55413, 1, 0, 0, 1, 1,
-0.01983904, 0.8295215, 1.903603, 1, 0, 0, 1, 1,
-0.01960566, 0.6407948, 0.7468976, 0, 0, 0, 1, 1,
-0.01774259, -1.200898, -3.781366, 0, 0, 0, 1, 1,
-0.01483207, -1.571917, -2.63218, 0, 0, 0, 1, 1,
-0.009259209, 1.631941, -0.2513445, 0, 0, 0, 1, 1,
-0.006346506, -1.538402, -3.560835, 0, 0, 0, 1, 1,
-0.002977407, 0.2160031, -0.05702671, 0, 0, 0, 1, 1,
-0.002742332, 0.955273, -0.5180737, 0, 0, 0, 1, 1,
0.001055351, 0.002134935, -0.3682214, 1, 1, 1, 1, 1,
0.001337055, 0.7207074, 0.2984345, 1, 1, 1, 1, 1,
0.002448598, 0.03875947, -0.269683, 1, 1, 1, 1, 1,
0.00367517, 1.062283, 0.5553594, 1, 1, 1, 1, 1,
0.006255555, -1.033549, 3.686236, 1, 1, 1, 1, 1,
0.009063288, 0.8680862, -2.034231, 1, 1, 1, 1, 1,
0.009312526, -0.4348042, 2.300782, 1, 1, 1, 1, 1,
0.009797282, -0.8713521, 4.888425, 1, 1, 1, 1, 1,
0.0100049, 0.6120994, 1.54026, 1, 1, 1, 1, 1,
0.01405572, 0.09536781, 1.596054, 1, 1, 1, 1, 1,
0.01500296, -2.006227, 4.995356, 1, 1, 1, 1, 1,
0.01592912, 0.0356767, -0.5325041, 1, 1, 1, 1, 1,
0.01627465, 2.807544, -0.08709379, 1, 1, 1, 1, 1,
0.02118303, 0.2321217, -0.1632192, 1, 1, 1, 1, 1,
0.02119946, 0.4172947, 0.004681773, 1, 1, 1, 1, 1,
0.02651958, -0.2183008, 1.22892, 0, 0, 1, 1, 1,
0.03181421, -1.195617, 4.635797, 1, 0, 0, 1, 1,
0.03266283, 1.814668, -0.1332105, 1, 0, 0, 1, 1,
0.03355676, 2.156658, 0.9973926, 1, 0, 0, 1, 1,
0.03586611, 1.517443, 0.7609524, 1, 0, 0, 1, 1,
0.03666611, 0.6242419, 0.5102455, 1, 0, 0, 1, 1,
0.03809007, 0.9948738, -0.195332, 0, 0, 0, 1, 1,
0.03986656, 1.636084, -0.3828798, 0, 0, 0, 1, 1,
0.04061243, -0.463441, 4.485905, 0, 0, 0, 1, 1,
0.0414699, 0.7532921, -1.211133, 0, 0, 0, 1, 1,
0.04482586, 0.8815135, -1.294195, 0, 0, 0, 1, 1,
0.0449841, 0.5929354, -0.9497619, 0, 0, 0, 1, 1,
0.04804602, -0.03060737, 2.112081, 0, 0, 0, 1, 1,
0.04892101, -0.4251506, 3.651006, 1, 1, 1, 1, 1,
0.05857027, 1.008464, -1.018237, 1, 1, 1, 1, 1,
0.058638, 0.5435671, -0.6115862, 1, 1, 1, 1, 1,
0.05888323, 0.3974678, 0.4261601, 1, 1, 1, 1, 1,
0.06061883, 0.5043305, 2.829799, 1, 1, 1, 1, 1,
0.06281961, 0.1469481, 0.2430243, 1, 1, 1, 1, 1,
0.06344512, 1.286242, -0.3053929, 1, 1, 1, 1, 1,
0.06599538, 0.2721298, 1.233862, 1, 1, 1, 1, 1,
0.06739284, -1.044341, 2.027414, 1, 1, 1, 1, 1,
0.06759473, -1.492047, 2.168401, 1, 1, 1, 1, 1,
0.067956, -0.4860994, 5.35404, 1, 1, 1, 1, 1,
0.06875667, 0.5187765, 1.758703, 1, 1, 1, 1, 1,
0.07153482, 1.561871, -0.4297723, 1, 1, 1, 1, 1,
0.07196583, 1.283674, 0.1893416, 1, 1, 1, 1, 1,
0.07536322, -0.1892075, 2.795329, 1, 1, 1, 1, 1,
0.08138062, 0.06067329, -0.5425601, 0, 0, 1, 1, 1,
0.08154873, -0.9595164, 2.313582, 1, 0, 0, 1, 1,
0.08477902, 0.7764418, -1.147197, 1, 0, 0, 1, 1,
0.08515821, 1.991348, -1.047347, 1, 0, 0, 1, 1,
0.08645894, -0.1410917, 3.969195, 1, 0, 0, 1, 1,
0.08822208, 0.367405, 1.370502, 1, 0, 0, 1, 1,
0.08920331, -1.021026, 4.242466, 0, 0, 0, 1, 1,
0.0892097, 2.687495, 0.855208, 0, 0, 0, 1, 1,
0.09470303, 0.2954734, 0.5771024, 0, 0, 0, 1, 1,
0.09589259, 2.202926, -0.2138795, 0, 0, 0, 1, 1,
0.10198, 0.2143106, -0.1314018, 0, 0, 0, 1, 1,
0.1055984, -0.1326501, 4.214745, 0, 0, 0, 1, 1,
0.1066619, 0.2891489, 0.1495892, 0, 0, 0, 1, 1,
0.1078028, 0.1115495, 1.320457, 1, 1, 1, 1, 1,
0.109652, -0.8644862, 3.544134, 1, 1, 1, 1, 1,
0.1109039, 0.2172615, 0.4654367, 1, 1, 1, 1, 1,
0.1122392, -1.071372, 5.178889, 1, 1, 1, 1, 1,
0.1151433, 1.505434, -0.5982061, 1, 1, 1, 1, 1,
0.115835, 1.010885, -0.3475849, 1, 1, 1, 1, 1,
0.1158472, -1.083306, 3.105854, 1, 1, 1, 1, 1,
0.118189, -0.5611306, 2.357343, 1, 1, 1, 1, 1,
0.120119, -0.6178448, 2.855495, 1, 1, 1, 1, 1,
0.1216509, -0.06765997, 2.653982, 1, 1, 1, 1, 1,
0.1226889, 0.07062826, 2.555977, 1, 1, 1, 1, 1,
0.1248275, 1.877889, -0.2997945, 1, 1, 1, 1, 1,
0.1256969, 0.9878052, -0.01278585, 1, 1, 1, 1, 1,
0.1338853, -0.3578329, 3.390799, 1, 1, 1, 1, 1,
0.1369127, 1.24209, -1.150377, 1, 1, 1, 1, 1,
0.1377149, 2.171468, 0.4529383, 0, 0, 1, 1, 1,
0.1379183, 1.252504, -0.3938402, 1, 0, 0, 1, 1,
0.1383642, 1.986837, -0.2561659, 1, 0, 0, 1, 1,
0.1395325, -2.430484, 2.257752, 1, 0, 0, 1, 1,
0.1433077, 0.9682299, 0.2622785, 1, 0, 0, 1, 1,
0.144419, 0.8824638, 0.2049845, 1, 0, 0, 1, 1,
0.1451612, -0.1159995, 2.925678, 0, 0, 0, 1, 1,
0.1466579, 2.901774, -1.463554, 0, 0, 0, 1, 1,
0.1473521, -0.2805019, 2.364258, 0, 0, 0, 1, 1,
0.1500283, -0.2739649, 2.676828, 0, 0, 0, 1, 1,
0.1577656, 0.01203224, 0.9598252, 0, 0, 0, 1, 1,
0.1580868, 0.6054794, 0.8288844, 0, 0, 0, 1, 1,
0.1629533, -0.9556728, 2.502498, 0, 0, 0, 1, 1,
0.1661321, 0.5787755, 2.872477, 1, 1, 1, 1, 1,
0.1719158, 1.909148, 0.3827329, 1, 1, 1, 1, 1,
0.1719442, -0.5298792, 3.873425, 1, 1, 1, 1, 1,
0.1739939, -0.1585643, 0.156654, 1, 1, 1, 1, 1,
0.1752732, -2.234859, 3.031891, 1, 1, 1, 1, 1,
0.1851787, 1.643918, -0.7791497, 1, 1, 1, 1, 1,
0.1880259, -0.7927825, 2.260399, 1, 1, 1, 1, 1,
0.1919477, -0.1953711, 2.279342, 1, 1, 1, 1, 1,
0.1979875, 0.1019847, 3.18493, 1, 1, 1, 1, 1,
0.1995462, 1.727546, 1.275116, 1, 1, 1, 1, 1,
0.2002461, 0.4257551, 0.5231966, 1, 1, 1, 1, 1,
0.2014782, -0.6550004, 0.2982527, 1, 1, 1, 1, 1,
0.2038608, 2.390162, 1.447712, 1, 1, 1, 1, 1,
0.2055416, -0.6892148, 2.156472, 1, 1, 1, 1, 1,
0.2101098, 0.860768, 0.2500251, 1, 1, 1, 1, 1,
0.2102318, -0.5478959, 3.637676, 0, 0, 1, 1, 1,
0.2122785, -0.242451, 2.161923, 1, 0, 0, 1, 1,
0.217858, 2.165789, 0.5094577, 1, 0, 0, 1, 1,
0.2210164, 1.308826, 1.246571, 1, 0, 0, 1, 1,
0.2231491, 1.330998, -1.728499, 1, 0, 0, 1, 1,
0.2258862, 0.3622468, 0.7792561, 1, 0, 0, 1, 1,
0.2304804, -0.03818002, 1.807307, 0, 0, 0, 1, 1,
0.2310305, 3.549414, -1.406868, 0, 0, 0, 1, 1,
0.2366538, -1.333182, 5.279212, 0, 0, 0, 1, 1,
0.243855, 1.160107, 1.731679, 0, 0, 0, 1, 1,
0.2453105, -1.712368, 2.999827, 0, 0, 0, 1, 1,
0.2458086, 0.555396, 0.9164649, 0, 0, 0, 1, 1,
0.249412, 0.5493339, 0.2591443, 0, 0, 0, 1, 1,
0.2534707, 1.876084, 0.1265354, 1, 1, 1, 1, 1,
0.2541287, -0.390301, 1.352588, 1, 1, 1, 1, 1,
0.2565324, 1.626071, -1.826055, 1, 1, 1, 1, 1,
0.2568266, -1.341179, 4.433394, 1, 1, 1, 1, 1,
0.2582085, 0.3248899, 1.566841, 1, 1, 1, 1, 1,
0.2591305, -0.7345828, 0.3934749, 1, 1, 1, 1, 1,
0.2610978, -0.5021667, 1.500049, 1, 1, 1, 1, 1,
0.2616309, -0.4476555, 1.363693, 1, 1, 1, 1, 1,
0.2620759, -1.35765, 3.901576, 1, 1, 1, 1, 1,
0.2643575, -0.1360032, 1.66499, 1, 1, 1, 1, 1,
0.2665895, 2.295466, -0.7868285, 1, 1, 1, 1, 1,
0.2678989, 0.7714105, 1.177763, 1, 1, 1, 1, 1,
0.2683375, -0.292625, 3.769702, 1, 1, 1, 1, 1,
0.2705356, 0.6388738, 0.3707236, 1, 1, 1, 1, 1,
0.2711603, -2.38185, 1.352393, 1, 1, 1, 1, 1,
0.2727516, -0.3236522, 2.548528, 0, 0, 1, 1, 1,
0.2739784, -0.9622829, 3.634961, 1, 0, 0, 1, 1,
0.2748612, -0.281944, 3.187065, 1, 0, 0, 1, 1,
0.2754315, -0.08479611, 2.23238, 1, 0, 0, 1, 1,
0.2762411, 0.06807691, 1.777675, 1, 0, 0, 1, 1,
0.2780956, -0.9800988, 2.829385, 1, 0, 0, 1, 1,
0.2794368, 0.6860135, -0.7407392, 0, 0, 0, 1, 1,
0.2812044, 0.8705757, 1.078218, 0, 0, 0, 1, 1,
0.2905984, 2.067388, -0.2552891, 0, 0, 0, 1, 1,
0.290948, -0.09455223, 1.825202, 0, 0, 0, 1, 1,
0.2911146, 0.6422414, -0.3697801, 0, 0, 0, 1, 1,
0.295117, 0.1491565, 1.48036, 0, 0, 0, 1, 1,
0.2994464, 0.2944928, 1.651509, 0, 0, 0, 1, 1,
0.3007534, -0.9490941, 3.441481, 1, 1, 1, 1, 1,
0.3021472, 0.5696775, 1.076249, 1, 1, 1, 1, 1,
0.3050388, 0.5050433, 0.3438141, 1, 1, 1, 1, 1,
0.3053299, 0.8898579, 0.5077132, 1, 1, 1, 1, 1,
0.3061055, -1.918054, 2.269319, 1, 1, 1, 1, 1,
0.3071815, -0.8490537, 3.251422, 1, 1, 1, 1, 1,
0.3098252, -0.6942484, 2.777776, 1, 1, 1, 1, 1,
0.3103394, -0.2921705, 3.546288, 1, 1, 1, 1, 1,
0.3169785, -0.6812968, 4.874352, 1, 1, 1, 1, 1,
0.3240954, 0.1360301, 1.442168, 1, 1, 1, 1, 1,
0.325315, 0.2207416, 0.1869474, 1, 1, 1, 1, 1,
0.3264011, 0.7115893, 0.6253088, 1, 1, 1, 1, 1,
0.3276496, -0.9899232, 2.353737, 1, 1, 1, 1, 1,
0.3343424, -0.3539827, 1.614501, 1, 1, 1, 1, 1,
0.343403, 0.06840843, 2.202781, 1, 1, 1, 1, 1,
0.3446794, 0.5248191, -0.008190873, 0, 0, 1, 1, 1,
0.3486858, 0.3888364, 0.7596189, 1, 0, 0, 1, 1,
0.3514413, 0.7375392, -0.3767352, 1, 0, 0, 1, 1,
0.3522992, -0.05536666, 2.405009, 1, 0, 0, 1, 1,
0.3533545, -0.3325108, 3.713017, 1, 0, 0, 1, 1,
0.3647098, -1.986646, 1.590415, 1, 0, 0, 1, 1,
0.3648721, 1.370881, -0.4375371, 0, 0, 0, 1, 1,
0.3671046, -1.430673, 1.374677, 0, 0, 0, 1, 1,
0.3714487, -0.2010637, 1.304636, 0, 0, 0, 1, 1,
0.3736223, 0.4641684, -0.04160277, 0, 0, 0, 1, 1,
0.3774423, 1.871272, 2.382177, 0, 0, 0, 1, 1,
0.3810038, -0.7761919, 1.643177, 0, 0, 0, 1, 1,
0.3944245, -0.6923019, 3.526011, 0, 0, 0, 1, 1,
0.3951305, 0.5205148, -1.006777, 1, 1, 1, 1, 1,
0.397595, 0.01196744, 2.468969, 1, 1, 1, 1, 1,
0.3999671, 1.828044, -0.6706989, 1, 1, 1, 1, 1,
0.4003447, 0.1208673, 2.151071, 1, 1, 1, 1, 1,
0.4007577, -0.8100338, 1.814462, 1, 1, 1, 1, 1,
0.4020896, -0.5216452, 2.458794, 1, 1, 1, 1, 1,
0.403495, 0.1508471, 1.501242, 1, 1, 1, 1, 1,
0.4045604, 0.2689295, 1.067436, 1, 1, 1, 1, 1,
0.4097966, 0.5513095, 1.167997, 1, 1, 1, 1, 1,
0.4127097, 0.4783826, 0.076729, 1, 1, 1, 1, 1,
0.4157803, 0.2240059, 1.618129, 1, 1, 1, 1, 1,
0.415799, -1.432019, 2.738949, 1, 1, 1, 1, 1,
0.4201758, -1.153315, 3.547755, 1, 1, 1, 1, 1,
0.422302, 0.1821515, 2.487169, 1, 1, 1, 1, 1,
0.4267187, -1.096521, 3.517626, 1, 1, 1, 1, 1,
0.4281139, 0.2029955, 0.9155062, 0, 0, 1, 1, 1,
0.4284645, 0.5952361, 1.108043, 1, 0, 0, 1, 1,
0.4332066, -0.1320566, 0.7900423, 1, 0, 0, 1, 1,
0.4354281, -0.6570773, 0.0939512, 1, 0, 0, 1, 1,
0.4408562, 0.4485739, -0.2534566, 1, 0, 0, 1, 1,
0.4423917, -0.769437, 2.843569, 1, 0, 0, 1, 1,
0.4500047, -1.104759, 3.60175, 0, 0, 0, 1, 1,
0.4524984, -0.6888486, 2.40668, 0, 0, 0, 1, 1,
0.453013, -0.4974619, 2.873492, 0, 0, 0, 1, 1,
0.4550885, -0.2142345, 1.803588, 0, 0, 0, 1, 1,
0.45906, 0.7986904, -0.8278281, 0, 0, 0, 1, 1,
0.4602983, 0.6426423, 2.747426, 0, 0, 0, 1, 1,
0.4611817, -0.2975894, 1.926278, 0, 0, 0, 1, 1,
0.4621934, -0.7574615, 2.496584, 1, 1, 1, 1, 1,
0.464653, 1.754575, 0.115455, 1, 1, 1, 1, 1,
0.4777628, -1.815077, 2.47513, 1, 1, 1, 1, 1,
0.4788553, 0.06848405, -0.1911169, 1, 1, 1, 1, 1,
0.4868367, 0.4922382, -0.01803531, 1, 1, 1, 1, 1,
0.4873577, 1.277131, 0.5929478, 1, 1, 1, 1, 1,
0.4903163, 0.08515278, 1.619462, 1, 1, 1, 1, 1,
0.4950681, -0.9167582, 2.314374, 1, 1, 1, 1, 1,
0.497114, -1.131101, 2.987138, 1, 1, 1, 1, 1,
0.4971959, 0.6293434, -1.06546, 1, 1, 1, 1, 1,
0.498213, -0.6304198, 1.870375, 1, 1, 1, 1, 1,
0.4997368, -0.5092993, 2.517949, 1, 1, 1, 1, 1,
0.5004495, -0.9902484, 3.900835, 1, 1, 1, 1, 1,
0.5018875, 0.5790362, 1.586425, 1, 1, 1, 1, 1,
0.5022054, -0.3230907, 0.8357505, 1, 1, 1, 1, 1,
0.5025715, -0.5780131, 2.834957, 0, 0, 1, 1, 1,
0.5046285, -1.639851, 2.24496, 1, 0, 0, 1, 1,
0.5088264, -1.205374, 2.260637, 1, 0, 0, 1, 1,
0.5184319, -0.6408698, 3.254586, 1, 0, 0, 1, 1,
0.5214813, -1.398313, 2.771099, 1, 0, 0, 1, 1,
0.5244746, 1.25754, 1.163513, 1, 0, 0, 1, 1,
0.5298178, 0.5357507, 1.01762, 0, 0, 0, 1, 1,
0.5364766, 0.9906448, 0.1480539, 0, 0, 0, 1, 1,
0.5423654, 1.834718, 0.3699103, 0, 0, 0, 1, 1,
0.5439057, 2.222175, 0.5031796, 0, 0, 0, 1, 1,
0.5440515, -0.3266489, 1.069243, 0, 0, 0, 1, 1,
0.5452246, -0.5207376, 2.435098, 0, 0, 0, 1, 1,
0.549761, 0.5937447, 0.5040221, 0, 0, 0, 1, 1,
0.5522165, -0.1649251, 2.810926, 1, 1, 1, 1, 1,
0.5523645, -0.6581298, 3.355287, 1, 1, 1, 1, 1,
0.5545158, 0.05289994, 1.928254, 1, 1, 1, 1, 1,
0.5671405, -0.09306207, 1.644318, 1, 1, 1, 1, 1,
0.567143, -1.435416, 2.107671, 1, 1, 1, 1, 1,
0.569388, -1.220715, 1.623566, 1, 1, 1, 1, 1,
0.5729656, 0.5871858, -0.8891465, 1, 1, 1, 1, 1,
0.5756987, -0.9187286, 1.230962, 1, 1, 1, 1, 1,
0.5792419, -0.5790773, 2.737776, 1, 1, 1, 1, 1,
0.5816766, 0.2435985, 1.598438, 1, 1, 1, 1, 1,
0.5832615, 0.983712, 0.3511828, 1, 1, 1, 1, 1,
0.5863953, 0.07341176, 1.763945, 1, 1, 1, 1, 1,
0.5902934, 1.432638, 2.166874, 1, 1, 1, 1, 1,
0.5909548, 0.2777478, 2.991792, 1, 1, 1, 1, 1,
0.5928995, 0.2525645, 0.4684851, 1, 1, 1, 1, 1,
0.5992076, 0.05029038, 0.9793077, 0, 0, 1, 1, 1,
0.6061624, -0.6087846, -0.06846579, 1, 0, 0, 1, 1,
0.6068088, -0.6084815, 0.3190982, 1, 0, 0, 1, 1,
0.6113328, 2.187366, 0.2168144, 1, 0, 0, 1, 1,
0.6114912, -0.9391481, 1.746784, 1, 0, 0, 1, 1,
0.6131275, 1.52853, 1.592316, 1, 0, 0, 1, 1,
0.6137863, 0.4384861, 0.4304399, 0, 0, 0, 1, 1,
0.6145785, -0.9444467, 2.686423, 0, 0, 0, 1, 1,
0.617955, -1.348265, 3.177132, 0, 0, 0, 1, 1,
0.6187018, 0.1176962, -1.955013, 0, 0, 0, 1, 1,
0.6196716, 0.3993846, 2.455398, 0, 0, 0, 1, 1,
0.6247997, 0.81751, 2.212411, 0, 0, 0, 1, 1,
0.62695, 0.2688893, 1.805294, 0, 0, 0, 1, 1,
0.6275317, -1.232934, 2.025361, 1, 1, 1, 1, 1,
0.6294824, 0.916477, 1.646776, 1, 1, 1, 1, 1,
0.6322189, -0.04895722, 1.965703, 1, 1, 1, 1, 1,
0.6344875, -1.168427, 2.559864, 1, 1, 1, 1, 1,
0.6418775, 0.8385717, 0.7329871, 1, 1, 1, 1, 1,
0.6436156, -0.5210905, 2.370371, 1, 1, 1, 1, 1,
0.6441618, 0.646384, 0.5953094, 1, 1, 1, 1, 1,
0.6482874, -0.6134291, 2.001451, 1, 1, 1, 1, 1,
0.6523461, -0.7596425, 0.6793664, 1, 1, 1, 1, 1,
0.6539, 0.7830942, 1.1926, 1, 1, 1, 1, 1,
0.6573685, -0.3135145, 0.4225287, 1, 1, 1, 1, 1,
0.6607826, 0.6621555, 2.826429, 1, 1, 1, 1, 1,
0.6680795, 0.5821999, 0.5394588, 1, 1, 1, 1, 1,
0.681963, -0.2974665, 3.072112, 1, 1, 1, 1, 1,
0.6896837, -0.6076312, 1.612794, 1, 1, 1, 1, 1,
0.69708, 0.8081861, -1.153669, 0, 0, 1, 1, 1,
0.6989253, 0.4585446, -0.9390089, 1, 0, 0, 1, 1,
0.6994683, 0.7209806, 2.091249, 1, 0, 0, 1, 1,
0.7022672, -0.02821957, 0.04445878, 1, 0, 0, 1, 1,
0.71127, -0.05572997, 1.40881, 1, 0, 0, 1, 1,
0.7146089, 0.3557434, 0.4422173, 1, 0, 0, 1, 1,
0.7161356, 1.281165, -0.8507435, 0, 0, 0, 1, 1,
0.7171727, -0.4402754, 3.213065, 0, 0, 0, 1, 1,
0.718474, -0.7989327, 1.212565, 0, 0, 0, 1, 1,
0.722874, -0.788282, -0.0755199, 0, 0, 0, 1, 1,
0.7239401, -1.050656, 1.912029, 0, 0, 0, 1, 1,
0.7247917, 1.412583, -0.2337413, 0, 0, 0, 1, 1,
0.7306176, -1.780716, 0.05769204, 0, 0, 0, 1, 1,
0.7312557, -1.903092, 3.065072, 1, 1, 1, 1, 1,
0.7321944, 0.748265, 1.874879, 1, 1, 1, 1, 1,
0.7327418, -2.146097, 2.383792, 1, 1, 1, 1, 1,
0.733005, 0.6053953, 0.4785902, 1, 1, 1, 1, 1,
0.7340775, 1.509613, -0.1216116, 1, 1, 1, 1, 1,
0.7432565, -0.6412317, 0.4346119, 1, 1, 1, 1, 1,
0.7438198, 0.2546156, 2.733589, 1, 1, 1, 1, 1,
0.7439928, -0.8124104, 2.554234, 1, 1, 1, 1, 1,
0.7454132, 0.9325578, 1.105925, 1, 1, 1, 1, 1,
0.7504181, 1.323543, 1.128155, 1, 1, 1, 1, 1,
0.7506841, -2.528126, 3.618888, 1, 1, 1, 1, 1,
0.752046, 2.208072, -1.085033, 1, 1, 1, 1, 1,
0.7522264, -0.3403996, 2.361012, 1, 1, 1, 1, 1,
0.7571463, 0.003347873, 1.479495, 1, 1, 1, 1, 1,
0.7576844, 0.3245094, 1.130572, 1, 1, 1, 1, 1,
0.7609128, -0.6007195, 3.750435, 0, 0, 1, 1, 1,
0.7617639, 0.1909559, 1.867273, 1, 0, 0, 1, 1,
0.7637572, -0.6984482, 4.069464, 1, 0, 0, 1, 1,
0.7660082, 0.3133224, 0.7429249, 1, 0, 0, 1, 1,
0.7706019, 0.2393692, 0.7278775, 1, 0, 0, 1, 1,
0.7745752, -1.31063, 3.422341, 1, 0, 0, 1, 1,
0.7748515, -0.3611477, 1.819633, 0, 0, 0, 1, 1,
0.7800521, 1.519787, 1.657189, 0, 0, 0, 1, 1,
0.7860336, 0.324903, 0.1472537, 0, 0, 0, 1, 1,
0.7874057, 0.1472029, 0.6952365, 0, 0, 0, 1, 1,
0.7914577, 0.05275745, 0.8207864, 0, 0, 0, 1, 1,
0.7924041, 0.2324984, 3.782083, 0, 0, 0, 1, 1,
0.7940711, -1.293254, 3.004722, 0, 0, 0, 1, 1,
0.7973013, 0.2281104, 1.886404, 1, 1, 1, 1, 1,
0.8012887, 1.46535, -0.01900962, 1, 1, 1, 1, 1,
0.801792, 0.5838139, 0.5425337, 1, 1, 1, 1, 1,
0.8046485, -0.5298268, 0.4990811, 1, 1, 1, 1, 1,
0.8075208, -0.518922, 4.136517, 1, 1, 1, 1, 1,
0.8141125, 0.2274317, -0.1636609, 1, 1, 1, 1, 1,
0.8156186, 2.09576, -1.297689, 1, 1, 1, 1, 1,
0.8181149, 0.5731589, 1.679903, 1, 1, 1, 1, 1,
0.818787, 1.020226, 3.377379, 1, 1, 1, 1, 1,
0.8197827, -0.1074411, 3.216215, 1, 1, 1, 1, 1,
0.8245916, -1.903149, 2.574639, 1, 1, 1, 1, 1,
0.8246183, -0.7057101, 3.095258, 1, 1, 1, 1, 1,
0.8330868, -0.08770391, -0.4439808, 1, 1, 1, 1, 1,
0.8335096, -1.727204, 2.436735, 1, 1, 1, 1, 1,
0.8337007, -2.135028, 2.91177, 1, 1, 1, 1, 1,
0.8338532, 0.004745413, 1.99016, 0, 0, 1, 1, 1,
0.8485057, 1.161386, 1.850778, 1, 0, 0, 1, 1,
0.8488641, 1.369221, 0.2655399, 1, 0, 0, 1, 1,
0.8569405, 2.007765, 0.04856379, 1, 0, 0, 1, 1,
0.8575336, -0.4669238, 2.661072, 1, 0, 0, 1, 1,
0.8585875, 0.9695678, 1.423867, 1, 0, 0, 1, 1,
0.8634772, -0.8453274, 3.885431, 0, 0, 0, 1, 1,
0.8682485, 1.616659, 0.7622725, 0, 0, 0, 1, 1,
0.8724697, 0.6030785, 1.890488, 0, 0, 0, 1, 1,
0.8838987, 0.6658363, 0.02930961, 0, 0, 0, 1, 1,
0.8845992, -0.8453137, 3.866668, 0, 0, 0, 1, 1,
0.8863815, 1.942432, -0.2071039, 0, 0, 0, 1, 1,
0.894119, -1.129673, 1.092947, 0, 0, 0, 1, 1,
0.9042876, -1.145452, 3.419312, 1, 1, 1, 1, 1,
0.904984, 0.5422717, 0.8459917, 1, 1, 1, 1, 1,
0.905475, 0.7223522, 1.955336, 1, 1, 1, 1, 1,
0.9112147, -1.260076, 2.207444, 1, 1, 1, 1, 1,
0.9112157, -0.7806432, 3.726495, 1, 1, 1, 1, 1,
0.9146045, 0.4216719, 1.089452, 1, 1, 1, 1, 1,
0.9296013, -2.004646, 4.41317, 1, 1, 1, 1, 1,
0.9301517, 0.7043267, 2.086093, 1, 1, 1, 1, 1,
0.9302759, 0.02106561, 2.617072, 1, 1, 1, 1, 1,
0.9446095, 0.6950684, 2.246718, 1, 1, 1, 1, 1,
0.9495333, 0.1710095, 2.101578, 1, 1, 1, 1, 1,
0.95138, 0.2891128, -1.106987, 1, 1, 1, 1, 1,
0.9521518, 2.452085, 2.323555, 1, 1, 1, 1, 1,
0.9522177, 0.01174419, 1.192716, 1, 1, 1, 1, 1,
0.955574, 1.179476, 1.540924, 1, 1, 1, 1, 1,
0.9586727, -0.8904076, 2.609294, 0, 0, 1, 1, 1,
0.9647282, -1.917039, 2.868921, 1, 0, 0, 1, 1,
0.9662859, -0.7011539, 1.527457, 1, 0, 0, 1, 1,
0.9683574, 0.330601, 1.565821, 1, 0, 0, 1, 1,
0.9684886, 0.3618752, 1.527257, 1, 0, 0, 1, 1,
0.9686672, 0.2613061, -0.01784666, 1, 0, 0, 1, 1,
0.9714295, -0.2228223, 2.200511, 0, 0, 0, 1, 1,
0.9732618, -0.4197117, 3.686357, 0, 0, 0, 1, 1,
0.9769737, 0.4397124, 1.513313, 0, 0, 0, 1, 1,
0.9781191, -0.7396227, 1.432997, 0, 0, 0, 1, 1,
0.9791406, 1.168422, 0.9440414, 0, 0, 0, 1, 1,
0.9828289, 1.613131, 0.4492406, 0, 0, 0, 1, 1,
0.9829957, -0.0399373, 0.2100541, 0, 0, 0, 1, 1,
0.9862384, 1.256236, 1.624701, 1, 1, 1, 1, 1,
0.9985123, -1.24216, 3.391326, 1, 1, 1, 1, 1,
1.005533, -0.6910848, 1.110504, 1, 1, 1, 1, 1,
1.015906, 0.2841297, 0.1980772, 1, 1, 1, 1, 1,
1.015929, 0.5930669, 0.8300518, 1, 1, 1, 1, 1,
1.019761, 0.1734602, 1.355303, 1, 1, 1, 1, 1,
1.021119, 1.901643, 1.70332, 1, 1, 1, 1, 1,
1.030016, -0.07814596, 2.322807, 1, 1, 1, 1, 1,
1.031598, 0.8379912, 0.8013914, 1, 1, 1, 1, 1,
1.04563, 0.292044, 0.326053, 1, 1, 1, 1, 1,
1.050513, -0.5968865, 2.134218, 1, 1, 1, 1, 1,
1.065131, -0.5286391, -0.5184191, 1, 1, 1, 1, 1,
1.066308, 0.7231656, 1.163857, 1, 1, 1, 1, 1,
1.067295, 1.668814, 2.440032, 1, 1, 1, 1, 1,
1.067977, -0.9111505, 3.434047, 1, 1, 1, 1, 1,
1.068157, -0.2809446, 0.5733244, 0, 0, 1, 1, 1,
1.06847, -2.563914, 1.388435, 1, 0, 0, 1, 1,
1.071206, 0.8427855, 1.098625, 1, 0, 0, 1, 1,
1.07755, 0.06971198, 3.043073, 1, 0, 0, 1, 1,
1.083689, -0.1295229, 2.163557, 1, 0, 0, 1, 1,
1.101938, -0.1547159, 1.915009, 1, 0, 0, 1, 1,
1.102928, -0.5154426, 2.743504, 0, 0, 0, 1, 1,
1.109206, 0.9934329, 0.9429225, 0, 0, 0, 1, 1,
1.117242, -0.03875159, -0.9108199, 0, 0, 0, 1, 1,
1.12377, 0.7232251, -0.01742654, 0, 0, 0, 1, 1,
1.135953, -0.5001914, 2.327538, 0, 0, 0, 1, 1,
1.146341, -1.146237, 0.486041, 0, 0, 0, 1, 1,
1.147102, 1.554734, -0.1162741, 0, 0, 0, 1, 1,
1.150831, -0.08520975, 3.230109, 1, 1, 1, 1, 1,
1.154907, 0.6227571, 0.7603921, 1, 1, 1, 1, 1,
1.162126, -0.5169459, 1.918191, 1, 1, 1, 1, 1,
1.163752, 1.304556, -1.675413, 1, 1, 1, 1, 1,
1.163757, -1.929535, 0.8640431, 1, 1, 1, 1, 1,
1.171916, 0.4495966, 1.675995, 1, 1, 1, 1, 1,
1.176827, 0.28283, -0.3824145, 1, 1, 1, 1, 1,
1.177634, 0.7768709, -0.1689396, 1, 1, 1, 1, 1,
1.180348, 0.7980712, 1.479571, 1, 1, 1, 1, 1,
1.181128, 0.3811292, -0.0477306, 1, 1, 1, 1, 1,
1.195846, 2.210309, -0.4235308, 1, 1, 1, 1, 1,
1.201989, -1.440188, 2.113017, 1, 1, 1, 1, 1,
1.206704, 0.5251721, -0.5664567, 1, 1, 1, 1, 1,
1.206996, -1.40725, 3.277243, 1, 1, 1, 1, 1,
1.212978, 0.7695498, 0.5210353, 1, 1, 1, 1, 1,
1.217594, -0.6622537, 1.163517, 0, 0, 1, 1, 1,
1.219018, -1.809705, 2.42681, 1, 0, 0, 1, 1,
1.219064, 0.06936421, 2.393125, 1, 0, 0, 1, 1,
1.224195, -0.05588509, 1.996507, 1, 0, 0, 1, 1,
1.233231, 0.1983047, 1.715612, 1, 0, 0, 1, 1,
1.240158, -0.9185465, 3.595567, 1, 0, 0, 1, 1,
1.240498, -2.331683, 3.3611, 0, 0, 0, 1, 1,
1.253657, 1.909994, 1.463351, 0, 0, 0, 1, 1,
1.254894, 0.1695626, 0.960348, 0, 0, 0, 1, 1,
1.266507, -1.457872, 2.027947, 0, 0, 0, 1, 1,
1.271241, -0.6187977, 3.549567, 0, 0, 0, 1, 1,
1.284397, -1.229579, 1.023165, 0, 0, 0, 1, 1,
1.296076, -0.3391963, 3.049871, 0, 0, 0, 1, 1,
1.298675, -0.4804917, 1.279709, 1, 1, 1, 1, 1,
1.305079, -0.6823086, 3.22261, 1, 1, 1, 1, 1,
1.313034, -1.123264, 0.6861094, 1, 1, 1, 1, 1,
1.316612, -0.2851216, 0.9171472, 1, 1, 1, 1, 1,
1.324378, 0.4749531, 0.9992218, 1, 1, 1, 1, 1,
1.337493, -0.1469457, 2.310436, 1, 1, 1, 1, 1,
1.344929, -1.754431, 2.205273, 1, 1, 1, 1, 1,
1.347823, -0.328507, 1.084489, 1, 1, 1, 1, 1,
1.352548, -1.757854, 2.695822, 1, 1, 1, 1, 1,
1.363998, 1.547955, 0.3363898, 1, 1, 1, 1, 1,
1.368844, -0.04157421, 0.7772985, 1, 1, 1, 1, 1,
1.378232, -1.266574, 4.416999, 1, 1, 1, 1, 1,
1.38082, 1.652524, 1.425933, 1, 1, 1, 1, 1,
1.381676, -0.7684005, 3.074975, 1, 1, 1, 1, 1,
1.384619, 1.138164, 2.699828, 1, 1, 1, 1, 1,
1.394814, 1.252041, 2.300148, 0, 0, 1, 1, 1,
1.395265, -1.593265, 2.567489, 1, 0, 0, 1, 1,
1.3973, 0.9758221, -0.1676436, 1, 0, 0, 1, 1,
1.406399, -0.55908, 2.18851, 1, 0, 0, 1, 1,
1.407952, 0.5546006, -0.5606267, 1, 0, 0, 1, 1,
1.410475, 0.304384, 1.504455, 1, 0, 0, 1, 1,
1.417568, -2.30602, 1.755702, 0, 0, 0, 1, 1,
1.427801, 0.9679404, -0.4993185, 0, 0, 0, 1, 1,
1.435832, -0.03812688, 3.129764, 0, 0, 0, 1, 1,
1.435835, -0.4373314, 1.843035, 0, 0, 0, 1, 1,
1.439499, 0.6792495, 2.30554, 0, 0, 0, 1, 1,
1.482171, 0.005242077, 1.590422, 0, 0, 0, 1, 1,
1.484917, -1.309338, 0.924022, 0, 0, 0, 1, 1,
1.486188, 0.641579, 0.2110778, 1, 1, 1, 1, 1,
1.506087, 1.390732, 1.579048, 1, 1, 1, 1, 1,
1.507343, -1.938299, 1.727418, 1, 1, 1, 1, 1,
1.517037, -0.8535686, 1.652207, 1, 1, 1, 1, 1,
1.520933, -0.3131313, 2.117212, 1, 1, 1, 1, 1,
1.558337, 1.315959, 1.594429, 1, 1, 1, 1, 1,
1.561265, -1.794765, 0.9852566, 1, 1, 1, 1, 1,
1.566604, -0.2921029, 0.8876569, 1, 1, 1, 1, 1,
1.56683, -0.7714053, 2.168685, 1, 1, 1, 1, 1,
1.58472, 1.323144, 1.350919, 1, 1, 1, 1, 1,
1.594113, 0.2157099, 1.210413, 1, 1, 1, 1, 1,
1.595633, 1.096613, -0.2406968, 1, 1, 1, 1, 1,
1.616903, 1.126078, -0.09668998, 1, 1, 1, 1, 1,
1.625022, -0.5033066, 1.057935, 1, 1, 1, 1, 1,
1.636003, 0.5702851, 2.272106, 1, 1, 1, 1, 1,
1.645714, -0.3213149, 2.636704, 0, 0, 1, 1, 1,
1.660067, -0.9329022, 1.261843, 1, 0, 0, 1, 1,
1.668231, 1.140927, 2.575133, 1, 0, 0, 1, 1,
1.684927, 0.2680041, 1.130243, 1, 0, 0, 1, 1,
1.687683, -0.3153586, 2.234488, 1, 0, 0, 1, 1,
1.707318, 0.07165544, 0.641905, 1, 0, 0, 1, 1,
1.709103, 0.1679867, 3.715504, 0, 0, 0, 1, 1,
1.716475, -0.8134465, 2.334285, 0, 0, 0, 1, 1,
1.72449, -0.001941146, 1.812709, 0, 0, 0, 1, 1,
1.743733, 0.7077096, -0.0939763, 0, 0, 0, 1, 1,
1.749344, 1.259174, 2.728672, 0, 0, 0, 1, 1,
1.794105, -0.08091658, 3.102335, 0, 0, 0, 1, 1,
1.822171, 0.7202793, 2.892694, 0, 0, 0, 1, 1,
1.827198, 0.7813597, 0.3856502, 1, 1, 1, 1, 1,
1.827684, -0.5733205, 1.133432, 1, 1, 1, 1, 1,
1.828891, 0.52266, 1.952373, 1, 1, 1, 1, 1,
1.839553, -1.631677, 3.715515, 1, 1, 1, 1, 1,
1.870963, 1.528738, 1.145001, 1, 1, 1, 1, 1,
1.880314, 1.45454, 0.22226, 1, 1, 1, 1, 1,
1.909605, 0.104035, 2.382944, 1, 1, 1, 1, 1,
1.927001, -1.697861, 1.989632, 1, 1, 1, 1, 1,
1.938104, 0.7794423, 0.211878, 1, 1, 1, 1, 1,
1.968595, 0.4418819, 1.696291, 1, 1, 1, 1, 1,
1.971464, 0.4803754, 1.579413, 1, 1, 1, 1, 1,
1.972569, 0.7682915, 0.8886919, 1, 1, 1, 1, 1,
1.986908, -0.3145964, 2.782172, 1, 1, 1, 1, 1,
1.989464, 1.048903, -1.014545, 1, 1, 1, 1, 1,
1.995152, 0.1324565, 3.149285, 1, 1, 1, 1, 1,
1.996803, 0.6796819, 0.1109613, 0, 0, 1, 1, 1,
2.022901, 0.9392375, 1.587834, 1, 0, 0, 1, 1,
2.05918, -1.009021, 1.633026, 1, 0, 0, 1, 1,
2.079839, 1.364155, 0.7269735, 1, 0, 0, 1, 1,
2.101679, 0.846651, 0.4796822, 1, 0, 0, 1, 1,
2.107647, -1.147137, 0.7971679, 1, 0, 0, 1, 1,
2.118044, 1.143756, -0.1326898, 0, 0, 0, 1, 1,
2.147589, -0.6909031, 2.52765, 0, 0, 0, 1, 1,
2.150417, 0.9280492, 1.349137, 0, 0, 0, 1, 1,
2.186363, 0.8274051, 0.9151266, 0, 0, 0, 1, 1,
2.193838, -2.228828, 2.504255, 0, 0, 0, 1, 1,
2.230737, 2.119198, 0.8931019, 0, 0, 0, 1, 1,
2.2626, -0.9634827, 2.291412, 0, 0, 0, 1, 1,
2.383582, -0.950129, 2.636846, 1, 1, 1, 1, 1,
2.597911, -1.338687, 2.03475, 1, 1, 1, 1, 1,
2.6312, -2.698581, 2.274515, 1, 1, 1, 1, 1,
2.795407, 0.05511084, 2.289492, 1, 1, 1, 1, 1,
2.956915, -1.802828, 3.282827, 1, 1, 1, 1, 1,
3.015947, 0.5860803, 1.348132, 1, 1, 1, 1, 1,
3.114221, -1.181439, 2.221773, 1, 1, 1, 1, 1
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
var radius = 9.411604;
var distance = 33.05786;
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
mvMatrix.translate( -0.08744502, -0.4254164, -0.03083467 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.05786);
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
