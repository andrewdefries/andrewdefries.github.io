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
-2.915432, 1.235919, -2.193543, 1, 0, 0, 1,
-2.892663, 0.3683401, -1.852713, 1, 0.007843138, 0, 1,
-2.872679, -0.03685408, -1.110118, 1, 0.01176471, 0, 1,
-2.613153, 0.9736868, -1.001927, 1, 0.01960784, 0, 1,
-2.612707, 0.3193946, -1.35306, 1, 0.02352941, 0, 1,
-2.611109, -0.3099035, -2.590854, 1, 0.03137255, 0, 1,
-2.540879, 1.80014, 0.2699211, 1, 0.03529412, 0, 1,
-2.438684, -0.5847328, -3.421033, 1, 0.04313726, 0, 1,
-2.393264, 0.4401052, -2.19797, 1, 0.04705882, 0, 1,
-2.334696, -0.1686694, -1.534087, 1, 0.05490196, 0, 1,
-2.302154, -0.6711232, -1.145215, 1, 0.05882353, 0, 1,
-2.272895, 1.975278, -2.159369, 1, 0.06666667, 0, 1,
-2.234547, -1.211007, -1.572522, 1, 0.07058824, 0, 1,
-2.194471, -0.4535747, -2.313455, 1, 0.07843138, 0, 1,
-2.179953, -0.2816477, -1.068676, 1, 0.08235294, 0, 1,
-2.154342, -0.8559547, -1.725625, 1, 0.09019608, 0, 1,
-2.106649, 0.08041366, -2.425262, 1, 0.09411765, 0, 1,
-2.098423, -0.725298, -3.267656, 1, 0.1019608, 0, 1,
-2.069578, 0.1426657, -2.336602, 1, 0.1098039, 0, 1,
-2.063648, -0.5409827, -1.379734, 1, 0.1137255, 0, 1,
-2.04876, 0.3659011, -2.833413, 1, 0.1215686, 0, 1,
-2.033681, 1.239641, -2.601406, 1, 0.1254902, 0, 1,
-2.02247, 0.6215881, -1.128792, 1, 0.1333333, 0, 1,
-1.978144, -0.6242273, -3.270997, 1, 0.1372549, 0, 1,
-1.952168, -1.596525, -2.121222, 1, 0.145098, 0, 1,
-1.948466, 0.8488658, -2.586564, 1, 0.1490196, 0, 1,
-1.94636, 1.915959, 1.245213, 1, 0.1568628, 0, 1,
-1.916792, -0.8612922, -2.521022, 1, 0.1607843, 0, 1,
-1.904253, 1.294151, -1.601439, 1, 0.1686275, 0, 1,
-1.895885, 0.5898705, -2.837622, 1, 0.172549, 0, 1,
-1.88978, 2.318383, -0.3812577, 1, 0.1803922, 0, 1,
-1.877041, 1.863513, -0.7883096, 1, 0.1843137, 0, 1,
-1.872713, 1.864474, -1.868178, 1, 0.1921569, 0, 1,
-1.863197, -0.2165969, -2.138597, 1, 0.1960784, 0, 1,
-1.857371, 0.214946, 1.646359, 1, 0.2039216, 0, 1,
-1.846758, 0.3859751, -1.67604, 1, 0.2117647, 0, 1,
-1.807246, -0.6617109, -1.587696, 1, 0.2156863, 0, 1,
-1.802529, -0.2901755, -2.820299, 1, 0.2235294, 0, 1,
-1.788225, -0.4173072, -3.060879, 1, 0.227451, 0, 1,
-1.766234, -0.206067, -1.720346, 1, 0.2352941, 0, 1,
-1.755371, 0.5700575, -0.7396559, 1, 0.2392157, 0, 1,
-1.746871, -2.005572, -0.78497, 1, 0.2470588, 0, 1,
-1.746605, 0.6289249, -1.812978, 1, 0.2509804, 0, 1,
-1.742116, -0.5200451, -0.09271675, 1, 0.2588235, 0, 1,
-1.74001, -1.765967, -3.297623, 1, 0.2627451, 0, 1,
-1.700655, 0.2042695, -1.461231, 1, 0.2705882, 0, 1,
-1.691374, -0.1541874, -1.437449, 1, 0.2745098, 0, 1,
-1.678979, -0.8958299, -2.407761, 1, 0.282353, 0, 1,
-1.655492, -0.175607, -1.122243, 1, 0.2862745, 0, 1,
-1.648339, 1.331286, -1.646312, 1, 0.2941177, 0, 1,
-1.640732, 0.573493, -1.858401, 1, 0.3019608, 0, 1,
-1.638314, -1.219558, -4.76478, 1, 0.3058824, 0, 1,
-1.576117, 1.322657, -0.7062439, 1, 0.3137255, 0, 1,
-1.570666, -1.474159, -1.787958, 1, 0.3176471, 0, 1,
-1.563001, -1.239699, -2.884564, 1, 0.3254902, 0, 1,
-1.559536, 0.008955149, -2.196756, 1, 0.3294118, 0, 1,
-1.551797, 0.1795022, -3.143811, 1, 0.3372549, 0, 1,
-1.535308, 0.6090526, -2.091277, 1, 0.3411765, 0, 1,
-1.528069, 0.3599111, -2.417863, 1, 0.3490196, 0, 1,
-1.519629, 0.004977306, -0.8572874, 1, 0.3529412, 0, 1,
-1.515066, -1.473673, -3.311116, 1, 0.3607843, 0, 1,
-1.507649, -1.666191, -3.565184, 1, 0.3647059, 0, 1,
-1.486238, -0.8523818, -0.787989, 1, 0.372549, 0, 1,
-1.482178, 1.155454, -2.273045, 1, 0.3764706, 0, 1,
-1.456541, 0.1394672, -1.795587, 1, 0.3843137, 0, 1,
-1.445816, -0.6976666, 0.7162189, 1, 0.3882353, 0, 1,
-1.443064, -0.298955, -0.9165429, 1, 0.3960784, 0, 1,
-1.425035, -1.417096, -2.072543, 1, 0.4039216, 0, 1,
-1.424257, 2.677973, -1.651161, 1, 0.4078431, 0, 1,
-1.410407, -0.8638346, -1.649306, 1, 0.4156863, 0, 1,
-1.404624, 2.690942, -0.610786, 1, 0.4196078, 0, 1,
-1.396832, -1.915135, -1.076783, 1, 0.427451, 0, 1,
-1.391073, 0.03281298, -2.759801, 1, 0.4313726, 0, 1,
-1.380116, 1.103825, -1.463039, 1, 0.4392157, 0, 1,
-1.379527, 2.156652, -0.1224353, 1, 0.4431373, 0, 1,
-1.361305, -0.184511, -0.8809565, 1, 0.4509804, 0, 1,
-1.360561, 0.336264, -1.948193, 1, 0.454902, 0, 1,
-1.356528, -0.5462456, 0.2614313, 1, 0.4627451, 0, 1,
-1.347299, 0.5969687, -0.9796221, 1, 0.4666667, 0, 1,
-1.336563, 3.194381, 0.8699257, 1, 0.4745098, 0, 1,
-1.33629, 1.829605, -2.012964, 1, 0.4784314, 0, 1,
-1.3326, -1.057717, -2.517485, 1, 0.4862745, 0, 1,
-1.322934, -0.953393, -0.442666, 1, 0.4901961, 0, 1,
-1.319695, 1.330794, -2.748784, 1, 0.4980392, 0, 1,
-1.316745, -0.7634347, -3.919396, 1, 0.5058824, 0, 1,
-1.308653, -0.01610793, -1.08673, 1, 0.509804, 0, 1,
-1.303098, 0.8078163, -0.1387228, 1, 0.5176471, 0, 1,
-1.30005, 0.2353773, -1.349396, 1, 0.5215687, 0, 1,
-1.285035, 0.1972793, -1.033142, 1, 0.5294118, 0, 1,
-1.263444, -1.805657, -4.958717, 1, 0.5333334, 0, 1,
-1.260574, 0.2732204, -1.478584, 1, 0.5411765, 0, 1,
-1.248501, 0.07754815, -2.405671, 1, 0.5450981, 0, 1,
-1.246072, -0.03041055, -3.38176, 1, 0.5529412, 0, 1,
-1.245577, 2.382991, -0.2497093, 1, 0.5568628, 0, 1,
-1.235869, 0.3015803, -1.716609, 1, 0.5647059, 0, 1,
-1.227353, -1.579146, -3.623873, 1, 0.5686275, 0, 1,
-1.222938, 0.1540941, -1.495947, 1, 0.5764706, 0, 1,
-1.219286, -1.753712, -2.517631, 1, 0.5803922, 0, 1,
-1.200175, -1.054761, -2.931564, 1, 0.5882353, 0, 1,
-1.194507, 0.2480662, -0.6543072, 1, 0.5921569, 0, 1,
-1.178801, 1.392554, -1.636557, 1, 0.6, 0, 1,
-1.169813, -1.316563, -2.155766, 1, 0.6078432, 0, 1,
-1.158052, 0.7569652, 1.015085, 1, 0.6117647, 0, 1,
-1.145701, 1.349082, -0.4386199, 1, 0.6196079, 0, 1,
-1.130989, -2.145331, -1.613034, 1, 0.6235294, 0, 1,
-1.127979, -1.567098, -1.379061, 1, 0.6313726, 0, 1,
-1.127671, -0.02865052, -2.96149, 1, 0.6352941, 0, 1,
-1.115966, -1.21318, -2.400832, 1, 0.6431373, 0, 1,
-1.110519, 0.4442675, -1.908208, 1, 0.6470588, 0, 1,
-1.097549, -1.252951, -2.129565, 1, 0.654902, 0, 1,
-1.089643, -0.6483845, -1.259669, 1, 0.6588235, 0, 1,
-1.089296, -0.4229632, -0.2001568, 1, 0.6666667, 0, 1,
-1.085571, 1.084638, 0.3629149, 1, 0.6705883, 0, 1,
-1.081399, 2.441103, 0.9851764, 1, 0.6784314, 0, 1,
-1.076114, -0.838732, -1.190791, 1, 0.682353, 0, 1,
-1.075823, 0.9093924, -1.315839, 1, 0.6901961, 0, 1,
-1.075706, -0.4590866, -1.89188, 1, 0.6941177, 0, 1,
-1.072261, 0.07964833, -0.1230392, 1, 0.7019608, 0, 1,
-1.070031, 1.552983, 1.545957, 1, 0.7098039, 0, 1,
-1.067069, -1.317482, -2.531297, 1, 0.7137255, 0, 1,
-1.065772, 0.6558138, -1.01758, 1, 0.7215686, 0, 1,
-1.064929, -0.9779863, -3.664639, 1, 0.7254902, 0, 1,
-1.060722, 0.1471473, -1.53996, 1, 0.7333333, 0, 1,
-1.056183, -0.9157839, -0.9619041, 1, 0.7372549, 0, 1,
-1.053274, 0.4974632, -0.05051722, 1, 0.7450981, 0, 1,
-1.051366, -0.6267043, -0.9986367, 1, 0.7490196, 0, 1,
-1.046644, 0.09463564, -0.3685138, 1, 0.7568628, 0, 1,
-1.03588, -0.6684294, -3.141991, 1, 0.7607843, 0, 1,
-1.033486, 1.261284, -0.5163826, 1, 0.7686275, 0, 1,
-1.032763, -1.210145, -3.736719, 1, 0.772549, 0, 1,
-1.032629, -0.5544188, -2.460273, 1, 0.7803922, 0, 1,
-1.031611, -0.3966025, -2.716276, 1, 0.7843137, 0, 1,
-1.030619, 1.367763, -0.3311171, 1, 0.7921569, 0, 1,
-1.017575, 0.04703962, -1.621789, 1, 0.7960784, 0, 1,
-1.015765, 0.3403015, 0.3340998, 1, 0.8039216, 0, 1,
-1.012511, 1.94716, -0.8854965, 1, 0.8117647, 0, 1,
-1.012003, -0.01333959, -1.952158, 1, 0.8156863, 0, 1,
-1.011699, -0.3290666, -2.623098, 1, 0.8235294, 0, 1,
-1.007493, -2.501496, -1.100448, 1, 0.827451, 0, 1,
-0.9928117, -0.4864601, -1.368545, 1, 0.8352941, 0, 1,
-0.9918078, -0.3031364, -2.050462, 1, 0.8392157, 0, 1,
-0.9842689, -0.69108, -1.641733, 1, 0.8470588, 0, 1,
-0.9829974, -1.420933, -1.124908, 1, 0.8509804, 0, 1,
-0.9777094, 1.939178, -0.7887126, 1, 0.8588235, 0, 1,
-0.9735261, -0.1943263, -3.386849, 1, 0.8627451, 0, 1,
-0.9658095, -0.7022614, -4.367035, 1, 0.8705882, 0, 1,
-0.9500943, -0.0786844, -1.846671, 1, 0.8745098, 0, 1,
-0.948833, -0.2667247, -0.7374668, 1, 0.8823529, 0, 1,
-0.9440447, -0.4504441, -0.8990958, 1, 0.8862745, 0, 1,
-0.9411179, 1.569042, -1.082619, 1, 0.8941177, 0, 1,
-0.9395375, -0.7646595, -2.305815, 1, 0.8980392, 0, 1,
-0.9378693, -0.4029981, -2.426005, 1, 0.9058824, 0, 1,
-0.9364562, 0.3495826, -1.831875, 1, 0.9137255, 0, 1,
-0.9306036, -0.9647509, -0.6654955, 1, 0.9176471, 0, 1,
-0.9277217, 1.541219, -0.7921661, 1, 0.9254902, 0, 1,
-0.924289, -0.2226714, -1.668876, 1, 0.9294118, 0, 1,
-0.9184651, -0.1977206, -0.175919, 1, 0.9372549, 0, 1,
-0.9162141, -0.7667584, -1.106231, 1, 0.9411765, 0, 1,
-0.9138884, -1.061065, -1.391604, 1, 0.9490196, 0, 1,
-0.9054378, 1.006065, 0.587138, 1, 0.9529412, 0, 1,
-0.9021609, -0.5117015, -1.973265, 1, 0.9607843, 0, 1,
-0.8997242, 0.09743094, -2.168888, 1, 0.9647059, 0, 1,
-0.8949071, -0.9908078, -1.864552, 1, 0.972549, 0, 1,
-0.8931808, 0.1831056, -0.8802451, 1, 0.9764706, 0, 1,
-0.888392, -1.322379, -2.893256, 1, 0.9843137, 0, 1,
-0.8866557, 1.056794, -1.610259, 1, 0.9882353, 0, 1,
-0.8862619, -1.40804, -1.840979, 1, 0.9960784, 0, 1,
-0.8838822, -0.4131596, -0.6899057, 0.9960784, 1, 0, 1,
-0.8820871, -0.6912991, -3.110814, 0.9921569, 1, 0, 1,
-0.8813334, -0.9917136, -0.5922782, 0.9843137, 1, 0, 1,
-0.8805113, -1.916469, -2.017931, 0.9803922, 1, 0, 1,
-0.8781717, 0.1111128, -1.917739, 0.972549, 1, 0, 1,
-0.8661838, 0.586171, -2.108916, 0.9686275, 1, 0, 1,
-0.8582858, -0.2291244, -1.389426, 0.9607843, 1, 0, 1,
-0.8580035, -0.7566623, -1.494012, 0.9568627, 1, 0, 1,
-0.8557346, 0.7543023, -2.157701, 0.9490196, 1, 0, 1,
-0.8552723, -0.7829716, -3.417499, 0.945098, 1, 0, 1,
-0.8525388, -1.084789, -2.788728, 0.9372549, 1, 0, 1,
-0.8483799, -1.694291, -3.076714, 0.9333333, 1, 0, 1,
-0.8435447, 0.2272886, -2.095759, 0.9254902, 1, 0, 1,
-0.8428271, 1.038605, -0.7203786, 0.9215686, 1, 0, 1,
-0.8364539, -1.132437, -1.328681, 0.9137255, 1, 0, 1,
-0.8320336, 1.415132, -1.194328, 0.9098039, 1, 0, 1,
-0.8293619, 0.2017189, -1.741481, 0.9019608, 1, 0, 1,
-0.8288639, 1.132783, -0.01773057, 0.8941177, 1, 0, 1,
-0.8235468, 0.265909, -2.805918, 0.8901961, 1, 0, 1,
-0.8221588, 0.02186374, -1.138453, 0.8823529, 1, 0, 1,
-0.8220735, -0.1530548, -1.270329, 0.8784314, 1, 0, 1,
-0.8189014, 0.7066499, -0.7893022, 0.8705882, 1, 0, 1,
-0.8082369, 0.1974773, -0.8212484, 0.8666667, 1, 0, 1,
-0.805855, -1.301526, -3.749143, 0.8588235, 1, 0, 1,
-0.8023819, -0.7683882, -1.600889, 0.854902, 1, 0, 1,
-0.8008717, -0.4943274, -3.113114, 0.8470588, 1, 0, 1,
-0.7863668, -0.1308128, -1.512641, 0.8431373, 1, 0, 1,
-0.7841769, -1.682996, 0.04913507, 0.8352941, 1, 0, 1,
-0.7836994, -0.2176299, -1.102277, 0.8313726, 1, 0, 1,
-0.7829357, -0.02651464, -1.544211, 0.8235294, 1, 0, 1,
-0.7818328, -2.460813, -1.67219, 0.8196079, 1, 0, 1,
-0.7799928, -2.296878, -3.808962, 0.8117647, 1, 0, 1,
-0.7693571, -0.4379906, -2.954903, 0.8078431, 1, 0, 1,
-0.766873, -1.094619, -3.695994, 0.8, 1, 0, 1,
-0.7649722, 2.766347, -1.77484, 0.7921569, 1, 0, 1,
-0.7618461, 0.3724605, -3.17151, 0.7882353, 1, 0, 1,
-0.759372, -0.3351494, -1.531989, 0.7803922, 1, 0, 1,
-0.7582626, 0.3259943, -1.675775, 0.7764706, 1, 0, 1,
-0.7524717, 1.879382, 0.4449483, 0.7686275, 1, 0, 1,
-0.7510909, 1.180344, 0.07721663, 0.7647059, 1, 0, 1,
-0.750872, -0.2804784, -0.7175025, 0.7568628, 1, 0, 1,
-0.7466246, 0.3035398, -1.863428, 0.7529412, 1, 0, 1,
-0.7419598, 2.802349, 1.475789, 0.7450981, 1, 0, 1,
-0.7413186, 1.079208, -1.165059, 0.7411765, 1, 0, 1,
-0.7403382, -0.6154863, -1.405484, 0.7333333, 1, 0, 1,
-0.7400299, -1.259239, -2.928179, 0.7294118, 1, 0, 1,
-0.7366045, 1.856962, 1.240039, 0.7215686, 1, 0, 1,
-0.7365643, 0.6986434, -0.3108792, 0.7176471, 1, 0, 1,
-0.7362708, -0.8063157, -2.375197, 0.7098039, 1, 0, 1,
-0.7333274, -0.1559952, -1.974784, 0.7058824, 1, 0, 1,
-0.7325096, -0.9705621, -4.46887, 0.6980392, 1, 0, 1,
-0.7305393, -0.9004801, -1.547384, 0.6901961, 1, 0, 1,
-0.7298602, -0.6790671, -3.179154, 0.6862745, 1, 0, 1,
-0.7267542, 0.1733961, -0.4910769, 0.6784314, 1, 0, 1,
-0.7249607, 0.07055546, 0.01737208, 0.6745098, 1, 0, 1,
-0.7234376, 0.9191679, 0.9726774, 0.6666667, 1, 0, 1,
-0.722156, -0.009037212, -3.05792, 0.6627451, 1, 0, 1,
-0.7157578, -0.5812532, -1.95651, 0.654902, 1, 0, 1,
-0.7154838, 0.1597074, -1.493362, 0.6509804, 1, 0, 1,
-0.7148675, 0.4639367, -3.177704, 0.6431373, 1, 0, 1,
-0.7122647, -1.052116, -2.697992, 0.6392157, 1, 0, 1,
-0.7108414, -2.739835, -1.886389, 0.6313726, 1, 0, 1,
-0.7098474, 1.695522, 0.3293912, 0.627451, 1, 0, 1,
-0.7098033, -2.336765, -2.056236, 0.6196079, 1, 0, 1,
-0.7083968, -0.3839917, -1.961079, 0.6156863, 1, 0, 1,
-0.7080688, -0.8923929, -2.449505, 0.6078432, 1, 0, 1,
-0.7072902, -0.5986781, -2.651807, 0.6039216, 1, 0, 1,
-0.7024656, 1.536898, 0.8496484, 0.5960785, 1, 0, 1,
-0.7006605, -0.1576648, -0.7567396, 0.5882353, 1, 0, 1,
-0.6934505, -1.125097, -0.6536097, 0.5843138, 1, 0, 1,
-0.6899601, 1.96278, -0.5850825, 0.5764706, 1, 0, 1,
-0.6805663, -0.07702348, -1.382235, 0.572549, 1, 0, 1,
-0.6803391, -0.6505511, -2.239739, 0.5647059, 1, 0, 1,
-0.6764037, -0.4907519, -2.350579, 0.5607843, 1, 0, 1,
-0.6753387, 0.3963475, 0.2113468, 0.5529412, 1, 0, 1,
-0.6749097, -0.725269, -2.619752, 0.5490196, 1, 0, 1,
-0.6745667, 1.835188, -0.2890762, 0.5411765, 1, 0, 1,
-0.6702222, -0.6154876, -3.675929, 0.5372549, 1, 0, 1,
-0.6663924, -1.244892, -3.092338, 0.5294118, 1, 0, 1,
-0.6658182, 0.2091725, -2.020458, 0.5254902, 1, 0, 1,
-0.6621602, 0.08065376, -0.8259314, 0.5176471, 1, 0, 1,
-0.654786, -0.7172051, -0.9422163, 0.5137255, 1, 0, 1,
-0.6514983, -0.07249556, -1.563362, 0.5058824, 1, 0, 1,
-0.6479495, -0.8796331, -1.459542, 0.5019608, 1, 0, 1,
-0.646658, 1.179238, -0.183822, 0.4941176, 1, 0, 1,
-0.6389502, 0.05553871, -1.93193, 0.4862745, 1, 0, 1,
-0.6371144, -0.5749148, -1.557035, 0.4823529, 1, 0, 1,
-0.6354541, 1.017845, -0.6771629, 0.4745098, 1, 0, 1,
-0.6334159, -0.3522804, -1.354356, 0.4705882, 1, 0, 1,
-0.6324839, -1.041199, -1.713356, 0.4627451, 1, 0, 1,
-0.6295841, 1.015732, 0.00197805, 0.4588235, 1, 0, 1,
-0.6258251, 0.4354374, -1.101167, 0.4509804, 1, 0, 1,
-0.6237034, -0.4763697, -0.7694764, 0.4470588, 1, 0, 1,
-0.6142904, -0.3906551, -2.308589, 0.4392157, 1, 0, 1,
-0.6125728, 0.6476905, 0.5500679, 0.4352941, 1, 0, 1,
-0.6099626, -1.68953, -2.495198, 0.427451, 1, 0, 1,
-0.607509, 2.00773, -1.613067, 0.4235294, 1, 0, 1,
-0.6073482, 0.2280587, -0.1231869, 0.4156863, 1, 0, 1,
-0.5860561, -1.265383, -3.119336, 0.4117647, 1, 0, 1,
-0.5824989, 0.2224164, -1.282587, 0.4039216, 1, 0, 1,
-0.5807929, 0.7932236, 0.6010476, 0.3960784, 1, 0, 1,
-0.5799538, 0.9965619, -0.5850144, 0.3921569, 1, 0, 1,
-0.578497, -0.1917449, -0.1547476, 0.3843137, 1, 0, 1,
-0.5736016, -0.5704529, -3.336441, 0.3803922, 1, 0, 1,
-0.5698127, -0.2430638, -3.487072, 0.372549, 1, 0, 1,
-0.5695973, -0.7715279, -0.4769626, 0.3686275, 1, 0, 1,
-0.5673582, 0.3149889, -1.506916, 0.3607843, 1, 0, 1,
-0.5623605, 1.249662, -0.9020483, 0.3568628, 1, 0, 1,
-0.5622979, -0.6081511, -2.659819, 0.3490196, 1, 0, 1,
-0.5616615, -0.6862465, -1.015074, 0.345098, 1, 0, 1,
-0.5590281, -1.907525, -2.638577, 0.3372549, 1, 0, 1,
-0.5503086, 2.029085, -0.5473871, 0.3333333, 1, 0, 1,
-0.5499451, 0.8348239, -0.7876989, 0.3254902, 1, 0, 1,
-0.5496492, -0.7236379, -1.698446, 0.3215686, 1, 0, 1,
-0.548509, -0.5222409, -3.868023, 0.3137255, 1, 0, 1,
-0.5465003, -0.1883764, -2.12014, 0.3098039, 1, 0, 1,
-0.5415218, -0.6381037, -2.934649, 0.3019608, 1, 0, 1,
-0.5388805, 0.7339875, -0.3265769, 0.2941177, 1, 0, 1,
-0.5374334, -1.281583, -0.801218, 0.2901961, 1, 0, 1,
-0.5345325, 1.352659, 1.582161, 0.282353, 1, 0, 1,
-0.5334766, -1.285491, -2.584869, 0.2784314, 1, 0, 1,
-0.5313774, 0.1318254, -1.288128, 0.2705882, 1, 0, 1,
-0.5249007, -1.12837, -2.064275, 0.2666667, 1, 0, 1,
-0.5227544, -0.8958709, -3.967865, 0.2588235, 1, 0, 1,
-0.5196065, 1.209076, 0.8940529, 0.254902, 1, 0, 1,
-0.5173379, -0.1568061, -2.357048, 0.2470588, 1, 0, 1,
-0.5088875, -0.3756299, -3.227026, 0.2431373, 1, 0, 1,
-0.5075425, 1.755504, 0.764577, 0.2352941, 1, 0, 1,
-0.5015391, -0.111656, -2.991893, 0.2313726, 1, 0, 1,
-0.5001605, 0.4068877, 1.826226, 0.2235294, 1, 0, 1,
-0.4960008, 0.7046877, -0.1173241, 0.2196078, 1, 0, 1,
-0.4946761, -2.685239, -2.797707, 0.2117647, 1, 0, 1,
-0.4922759, -0.9678049, -4.001263, 0.2078431, 1, 0, 1,
-0.4908249, -0.4229965, -1.576631, 0.2, 1, 0, 1,
-0.48933, 0.8267896, -1.468418, 0.1921569, 1, 0, 1,
-0.4893245, 0.5025188, -0.8438182, 0.1882353, 1, 0, 1,
-0.4879422, 1.735932, 2.575524, 0.1803922, 1, 0, 1,
-0.4864569, 1.657074, 0.5421327, 0.1764706, 1, 0, 1,
-0.482236, 0.644602, -1.559872, 0.1686275, 1, 0, 1,
-0.4812948, 0.6387534, -1.13148, 0.1647059, 1, 0, 1,
-0.4796249, -1.567558, -4.119548, 0.1568628, 1, 0, 1,
-0.4781956, 0.215848, 0.3442378, 0.1529412, 1, 0, 1,
-0.4731992, 0.817131, -0.7041265, 0.145098, 1, 0, 1,
-0.4696357, 0.3705391, -2.00308, 0.1411765, 1, 0, 1,
-0.4641896, -0.2330216, -2.573685, 0.1333333, 1, 0, 1,
-0.46258, 1.096994, -1.428514, 0.1294118, 1, 0, 1,
-0.4613067, -0.09670174, -3.163049, 0.1215686, 1, 0, 1,
-0.4600568, 0.3873698, -2.178429, 0.1176471, 1, 0, 1,
-0.4588194, -1.452413, -4.40281, 0.1098039, 1, 0, 1,
-0.4580604, 0.5636089, -1.758353, 0.1058824, 1, 0, 1,
-0.4567719, 2.432803, -0.4092934, 0.09803922, 1, 0, 1,
-0.4544938, 0.9382775, -1.260197, 0.09019608, 1, 0, 1,
-0.4525268, -2.467707, -2.2281, 0.08627451, 1, 0, 1,
-0.4517526, -0.8383732, -3.599192, 0.07843138, 1, 0, 1,
-0.4449253, 0.8430675, -1.930753, 0.07450981, 1, 0, 1,
-0.4415012, -0.7235929, -1.68546, 0.06666667, 1, 0, 1,
-0.4397071, 0.9790416, -0.9440613, 0.0627451, 1, 0, 1,
-0.4319453, 0.1738835, -0.452552, 0.05490196, 1, 0, 1,
-0.4316718, 0.8466984, 1.222286, 0.05098039, 1, 0, 1,
-0.429612, -0.5550119, -3.094053, 0.04313726, 1, 0, 1,
-0.4255805, 0.4702243, 0.5920919, 0.03921569, 1, 0, 1,
-0.424903, 1.286297, -1.554142, 0.03137255, 1, 0, 1,
-0.4238182, -0.7237105, -3.226125, 0.02745098, 1, 0, 1,
-0.4233209, -0.03899542, -2.786288, 0.01960784, 1, 0, 1,
-0.4226878, -0.594699, -0.6814446, 0.01568628, 1, 0, 1,
-0.4223478, -0.7458261, -4.726985, 0.007843138, 1, 0, 1,
-0.4221691, -0.3185507, -3.204929, 0.003921569, 1, 0, 1,
-0.4134288, -1.038724, -2.115885, 0, 1, 0.003921569, 1,
-0.4089039, -0.5023649, -1.846253, 0, 1, 0.01176471, 1,
-0.4078392, 0.4926025, -1.523361, 0, 1, 0.01568628, 1,
-0.4048515, -0.1513301, -1.6148, 0, 1, 0.02352941, 1,
-0.4035548, -1.96532, -2.892199, 0, 1, 0.02745098, 1,
-0.3983463, 0.2048353, -2.233209, 0, 1, 0.03529412, 1,
-0.3973533, 0.7044573, 0.2151725, 0, 1, 0.03921569, 1,
-0.3964061, 0.7895193, -2.302634, 0, 1, 0.04705882, 1,
-0.3926468, 0.2064213, -1.683617, 0, 1, 0.05098039, 1,
-0.3902467, -1.144136, -2.825431, 0, 1, 0.05882353, 1,
-0.3887061, 0.02471, -0.5112308, 0, 1, 0.0627451, 1,
-0.3882248, -0.4790802, -3.359498, 0, 1, 0.07058824, 1,
-0.3848261, -0.8357188, -1.791941, 0, 1, 0.07450981, 1,
-0.3846468, 1.587681, -2.741623, 0, 1, 0.08235294, 1,
-0.384481, -0.1060723, -2.645419, 0, 1, 0.08627451, 1,
-0.383545, 0.3161763, 0.8751463, 0, 1, 0.09411765, 1,
-0.3833859, 0.7583936, -0.9368876, 0, 1, 0.1019608, 1,
-0.3795178, -0.1758292, -2.430852, 0, 1, 0.1058824, 1,
-0.3740167, -1.655063, -4.584969, 0, 1, 0.1137255, 1,
-0.3713088, 0.2533258, -1.32301, 0, 1, 0.1176471, 1,
-0.364702, -0.113261, -1.980192, 0, 1, 0.1254902, 1,
-0.3637559, -0.1620078, -2.385028, 0, 1, 0.1294118, 1,
-0.3616818, 0.9738725, -0.5966287, 0, 1, 0.1372549, 1,
-0.3564894, 1.933161, 1.118291, 0, 1, 0.1411765, 1,
-0.3483969, -0.7666413, -4.292713, 0, 1, 0.1490196, 1,
-0.3483674, -0.5387256, -2.461437, 0, 1, 0.1529412, 1,
-0.3452258, -0.4855773, -1.823849, 0, 1, 0.1607843, 1,
-0.3431059, -0.7930627, -0.502023, 0, 1, 0.1647059, 1,
-0.3420653, 0.5068568, -0.2978555, 0, 1, 0.172549, 1,
-0.3393208, -0.5779219, -3.448425, 0, 1, 0.1764706, 1,
-0.3387714, -0.01414299, -0.1799225, 0, 1, 0.1843137, 1,
-0.3370838, 0.5078493, -0.5960991, 0, 1, 0.1882353, 1,
-0.3352721, 0.09340834, -1.998284, 0, 1, 0.1960784, 1,
-0.3339365, -0.2750644, -2.405471, 0, 1, 0.2039216, 1,
-0.3324011, -0.1259901, -3.155344, 0, 1, 0.2078431, 1,
-0.3319958, -0.6080051, -1.430275, 0, 1, 0.2156863, 1,
-0.3261836, -0.009334012, -1.811466, 0, 1, 0.2196078, 1,
-0.3255777, 2.39826, -0.3952387, 0, 1, 0.227451, 1,
-0.3237094, -0.7560682, -3.350137, 0, 1, 0.2313726, 1,
-0.3213542, -2.39235, -3.131345, 0, 1, 0.2392157, 1,
-0.3112124, 1.84009, -0.01364508, 0, 1, 0.2431373, 1,
-0.3100224, 1.72511, 1.631154, 0, 1, 0.2509804, 1,
-0.3087673, -0.1814395, -2.05729, 0, 1, 0.254902, 1,
-0.3069736, -1.791915, -4.082757, 0, 1, 0.2627451, 1,
-0.2983196, -1.194398, -2.859037, 0, 1, 0.2666667, 1,
-0.2962607, 0.7737304, 0.5484776, 0, 1, 0.2745098, 1,
-0.2959954, -1.000464, -3.152114, 0, 1, 0.2784314, 1,
-0.2930888, 1.391369, -0.3216695, 0, 1, 0.2862745, 1,
-0.2929752, -0.5610258, -4.557688, 0, 1, 0.2901961, 1,
-0.2888165, 0.8799959, -1.844313, 0, 1, 0.2980392, 1,
-0.2857842, -0.8101431, -4.035543, 0, 1, 0.3058824, 1,
-0.2855296, -1.129803, -4.569191, 0, 1, 0.3098039, 1,
-0.2834647, -1.462811, -2.051042, 0, 1, 0.3176471, 1,
-0.2806039, -1.434269, -4.424834, 0, 1, 0.3215686, 1,
-0.2757766, -1.810034, -4.274217, 0, 1, 0.3294118, 1,
-0.2737884, 0.8949849, -0.8679424, 0, 1, 0.3333333, 1,
-0.2726406, 1.295419, 1.33401, 0, 1, 0.3411765, 1,
-0.2723068, 0.5058962, -1.250028, 0, 1, 0.345098, 1,
-0.2694897, -1.242607, -4.156046, 0, 1, 0.3529412, 1,
-0.2619532, -0.4873079, -3.22557, 0, 1, 0.3568628, 1,
-0.2617507, -0.1685548, -2.628496, 0, 1, 0.3647059, 1,
-0.2608748, -0.2030579, -2.076942, 0, 1, 0.3686275, 1,
-0.2569931, -0.009542549, -3.586461, 0, 1, 0.3764706, 1,
-0.2559695, 0.3203036, -0.2267166, 0, 1, 0.3803922, 1,
-0.2545324, 0.4076165, -1.314447, 0, 1, 0.3882353, 1,
-0.2545161, 1.011363, -1.651597, 0, 1, 0.3921569, 1,
-0.2527907, -0.4569264, -2.023922, 0, 1, 0.4, 1,
-0.2523959, 0.1188917, -1.698583, 0, 1, 0.4078431, 1,
-0.2421819, 0.392094, -0.9271886, 0, 1, 0.4117647, 1,
-0.2419403, 1.949373, 0.3167202, 0, 1, 0.4196078, 1,
-0.2412164, -0.8492777, -3.758757, 0, 1, 0.4235294, 1,
-0.2398243, 0.5721574, -0.1048365, 0, 1, 0.4313726, 1,
-0.2393245, 0.8073566, 0.8124316, 0, 1, 0.4352941, 1,
-0.2388246, -1.430911, -4.056958, 0, 1, 0.4431373, 1,
-0.2380852, -0.31974, -2.796834, 0, 1, 0.4470588, 1,
-0.2378343, 1.681854, 1.414614, 0, 1, 0.454902, 1,
-0.236808, 0.3100039, -1.335976, 0, 1, 0.4588235, 1,
-0.2350189, -1.191615, -3.754108, 0, 1, 0.4666667, 1,
-0.2342416, -1.443735, -5.08072, 0, 1, 0.4705882, 1,
-0.2298728, -0.8435231, -3.209133, 0, 1, 0.4784314, 1,
-0.2290171, 0.8517827, 0.8343146, 0, 1, 0.4823529, 1,
-0.2284345, 1.380686, 0.3800322, 0, 1, 0.4901961, 1,
-0.2262205, -0.6521515, -4.889979, 0, 1, 0.4941176, 1,
-0.2252278, -2.595473, -3.546616, 0, 1, 0.5019608, 1,
-0.2212836, 0.0893124, 0.7649108, 0, 1, 0.509804, 1,
-0.2144618, -1.811108, -2.134058, 0, 1, 0.5137255, 1,
-0.2129128, -1.137739, -3.449624, 0, 1, 0.5215687, 1,
-0.2124607, -0.4125074, -2.344354, 0, 1, 0.5254902, 1,
-0.2124083, 1.522508, 1.02221, 0, 1, 0.5333334, 1,
-0.2120999, -0.9565344, -3.840031, 0, 1, 0.5372549, 1,
-0.2114616, -1.303539, -2.092827, 0, 1, 0.5450981, 1,
-0.1976518, -1.746115, -3.134844, 0, 1, 0.5490196, 1,
-0.1940613, 3.147086, -1.42674, 0, 1, 0.5568628, 1,
-0.1932246, 0.9097626, -0.1404099, 0, 1, 0.5607843, 1,
-0.1890721, -0.2419069, -1.230084, 0, 1, 0.5686275, 1,
-0.1877183, -0.8631334, -2.583241, 0, 1, 0.572549, 1,
-0.183229, 0.2327942, -1.124169, 0, 1, 0.5803922, 1,
-0.1807089, 0.2759738, -1.572049, 0, 1, 0.5843138, 1,
-0.1775382, 0.7097406, -1.395915, 0, 1, 0.5921569, 1,
-0.1772909, -1.732999, -2.837155, 0, 1, 0.5960785, 1,
-0.1742486, 0.5910739, 0.5176384, 0, 1, 0.6039216, 1,
-0.1732647, -0.8813143, -2.284053, 0, 1, 0.6117647, 1,
-0.1717698, 0.246776, -1.688577, 0, 1, 0.6156863, 1,
-0.1703428, 0.4633392, 1.025383, 0, 1, 0.6235294, 1,
-0.1698103, -0.684212, -2.295468, 0, 1, 0.627451, 1,
-0.1586095, 1.084091, 1.07828, 0, 1, 0.6352941, 1,
-0.1539482, -0.02805302, -1.514716, 0, 1, 0.6392157, 1,
-0.1496103, -0.6636541, -4.639478, 0, 1, 0.6470588, 1,
-0.1481759, 0.4439044, -0.3777907, 0, 1, 0.6509804, 1,
-0.1447091, 1.927045, -0.3599179, 0, 1, 0.6588235, 1,
-0.1417091, 0.2530185, -0.9741333, 0, 1, 0.6627451, 1,
-0.1414091, -1.313476, -2.99408, 0, 1, 0.6705883, 1,
-0.1410338, 1.045902, -1.851489, 0, 1, 0.6745098, 1,
-0.1339058, 0.3111167, -0.2737973, 0, 1, 0.682353, 1,
-0.1334492, 0.7748739, -0.9252594, 0, 1, 0.6862745, 1,
-0.1331591, -0.09975489, -3.464201, 0, 1, 0.6941177, 1,
-0.1318074, -1.477204, -3.878603, 0, 1, 0.7019608, 1,
-0.1293914, 1.819701, -0.7900585, 0, 1, 0.7058824, 1,
-0.127326, 0.7222416, 0.1643754, 0, 1, 0.7137255, 1,
-0.1228799, 1.694694, 0.1135723, 0, 1, 0.7176471, 1,
-0.121674, -1.116487, -1.641843, 0, 1, 0.7254902, 1,
-0.1198381, -1.340343, -2.083591, 0, 1, 0.7294118, 1,
-0.1185837, 0.03838741, -1.046311, 0, 1, 0.7372549, 1,
-0.1181244, -0.249546, -2.360993, 0, 1, 0.7411765, 1,
-0.1178079, 0.6220483, -2.029897, 0, 1, 0.7490196, 1,
-0.1151494, 0.7746391, -0.1243466, 0, 1, 0.7529412, 1,
-0.1135192, -0.1503934, -2.77839, 0, 1, 0.7607843, 1,
-0.1107978, -0.1701998, -3.398344, 0, 1, 0.7647059, 1,
-0.1058583, 0.7754201, 0.06263532, 0, 1, 0.772549, 1,
-0.1045333, 1.618631, -0.1518845, 0, 1, 0.7764706, 1,
-0.1037773, 1.457803, 0.07188576, 0, 1, 0.7843137, 1,
-0.09893592, -1.571597, -3.386984, 0, 1, 0.7882353, 1,
-0.09775241, -0.490028, -2.522517, 0, 1, 0.7960784, 1,
-0.09658729, -0.6010913, -4.052263, 0, 1, 0.8039216, 1,
-0.08528613, -0.9908186, -3.898535, 0, 1, 0.8078431, 1,
-0.08225857, -0.1999574, -1.998957, 0, 1, 0.8156863, 1,
-0.07804939, -0.5708467, -1.900219, 0, 1, 0.8196079, 1,
-0.07780226, -0.362792, -4.958349, 0, 1, 0.827451, 1,
-0.07639455, 1.699674, 0.6841443, 0, 1, 0.8313726, 1,
-0.07526432, -1.24035, -3.385021, 0, 1, 0.8392157, 1,
-0.0728917, -1.684476, -2.864507, 0, 1, 0.8431373, 1,
-0.07240687, -1.774761, -2.228174, 0, 1, 0.8509804, 1,
-0.07165066, 2.738288, -0.629184, 0, 1, 0.854902, 1,
-0.06016599, 0.3621606, 0.6106099, 0, 1, 0.8627451, 1,
-0.05741462, -0.03438747, -2.709493, 0, 1, 0.8666667, 1,
-0.05639605, -0.9531682, -2.744688, 0, 1, 0.8745098, 1,
-0.05501528, -0.2739018, -3.120152, 0, 1, 0.8784314, 1,
-0.0506035, -0.426264, -3.201691, 0, 1, 0.8862745, 1,
-0.05049761, -0.8087259, -3.423562, 0, 1, 0.8901961, 1,
-0.04903524, 0.09163447, 0.468974, 0, 1, 0.8980392, 1,
-0.0490237, 1.04766, -0.5841626, 0, 1, 0.9058824, 1,
-0.04588351, -1.007445, -1.117429, 0, 1, 0.9098039, 1,
-0.04354282, 1.206908, 0.8258057, 0, 1, 0.9176471, 1,
-0.04027959, -0.1091918, -3.391171, 0, 1, 0.9215686, 1,
-0.04022192, 1.170624, -0.06811339, 0, 1, 0.9294118, 1,
-0.03874313, -0.6694747, -3.364833, 0, 1, 0.9333333, 1,
-0.03734508, 1.236811, -0.3375224, 0, 1, 0.9411765, 1,
-0.03661209, -0.03948921, -2.11585, 0, 1, 0.945098, 1,
-0.03526406, -0.5270086, -4.180488, 0, 1, 0.9529412, 1,
-0.03033374, -1.202382, -3.668323, 0, 1, 0.9568627, 1,
-0.02889752, 0.03742887, -0.4032209, 0, 1, 0.9647059, 1,
-0.02438129, 1.407062, 0.5378005, 0, 1, 0.9686275, 1,
-0.01912599, 1.36985, -0.3578782, 0, 1, 0.9764706, 1,
-0.01824703, -0.3490122, -0.6455163, 0, 1, 0.9803922, 1,
-0.0176174, -0.2904651, -4.218527, 0, 1, 0.9882353, 1,
-0.0164388, -0.6456442, -1.974241, 0, 1, 0.9921569, 1,
-0.01212918, 0.1043275, -0.4529832, 0, 1, 1, 1,
-0.01155121, -0.3756637, -2.92759, 0, 0.9921569, 1, 1,
-0.003216966, 0.9553406, -0.1809027, 0, 0.9882353, 1, 1,
-0.002114872, 1.020534, 0.8380646, 0, 0.9803922, 1, 1,
-0.001633655, -0.5319034, -2.854198, 0, 0.9764706, 1, 1,
-0.001251001, 0.1027059, 1.694518, 0, 0.9686275, 1, 1,
-0.0001470154, -1.109981, -3.892044, 0, 0.9647059, 1, 1,
0.0001072357, 0.5039994, 1.018983, 0, 0.9568627, 1, 1,
0.003862657, -1.745206, 3.55334, 0, 0.9529412, 1, 1,
0.005423636, 1.111898, 0.1273111, 0, 0.945098, 1, 1,
0.007863631, 0.8245426, -1.514127, 0, 0.9411765, 1, 1,
0.01200987, 1.373882, 0.510788, 0, 0.9333333, 1, 1,
0.01600429, -0.4817804, 2.479911, 0, 0.9294118, 1, 1,
0.01626196, -0.100619, 5.348361, 0, 0.9215686, 1, 1,
0.01932256, -0.6005765, 2.978928, 0, 0.9176471, 1, 1,
0.02183611, -2.433069, 4.365811, 0, 0.9098039, 1, 1,
0.02726228, 0.771974, -0.579437, 0, 0.9058824, 1, 1,
0.02798, 0.2131397, -0.5010536, 0, 0.8980392, 1, 1,
0.03096458, -0.7420763, 1.542239, 0, 0.8901961, 1, 1,
0.03415987, 0.3575941, -0.4519534, 0, 0.8862745, 1, 1,
0.03567855, -0.3012773, 2.046236, 0, 0.8784314, 1, 1,
0.0413175, 0.04893541, -0.1261164, 0, 0.8745098, 1, 1,
0.04207618, -0.9338214, 5.457122, 0, 0.8666667, 1, 1,
0.04259664, 1.255585, 0.2246351, 0, 0.8627451, 1, 1,
0.04314981, 2.006917, -0.5454538, 0, 0.854902, 1, 1,
0.04528234, 0.381441, -0.7851802, 0, 0.8509804, 1, 1,
0.04824315, -1.185274, 1.829118, 0, 0.8431373, 1, 1,
0.04841722, 0.7708228, 1.47066, 0, 0.8392157, 1, 1,
0.04893937, -1.727263, 5.249823, 0, 0.8313726, 1, 1,
0.05014731, -2.462248, 3.03026, 0, 0.827451, 1, 1,
0.05199819, -0.8439186, 2.830167, 0, 0.8196079, 1, 1,
0.05648199, -0.212903, 4.292093, 0, 0.8156863, 1, 1,
0.05807727, -0.9766758, 3.175414, 0, 0.8078431, 1, 1,
0.05813089, 1.138326, 1.933467, 0, 0.8039216, 1, 1,
0.05841415, 0.2410282, 0.005969952, 0, 0.7960784, 1, 1,
0.05922495, 0.6500224, -0.9361807, 0, 0.7882353, 1, 1,
0.05944653, -0.2183041, 4.776838, 0, 0.7843137, 1, 1,
0.06477502, -1.210302, 3.253048, 0, 0.7764706, 1, 1,
0.06518551, 0.5814933, -0.7966561, 0, 0.772549, 1, 1,
0.07523851, -0.3610829, 3.396403, 0, 0.7647059, 1, 1,
0.07925186, 0.1942903, 1.697312, 0, 0.7607843, 1, 1,
0.07999286, -1.017992, 3.28317, 0, 0.7529412, 1, 1,
0.08184536, -2.011417, 1.670199, 0, 0.7490196, 1, 1,
0.08187307, -0.8220159, 4.152608, 0, 0.7411765, 1, 1,
0.08388579, -1.42661, 1.432028, 0, 0.7372549, 1, 1,
0.08582938, 0.1052619, 0.3691817, 0, 0.7294118, 1, 1,
0.09072159, -0.9815822, 4.744967, 0, 0.7254902, 1, 1,
0.09283489, -0.2249541, 1.279896, 0, 0.7176471, 1, 1,
0.09301968, -1.244667, 3.071153, 0, 0.7137255, 1, 1,
0.09664501, 0.4557329, -0.5572875, 0, 0.7058824, 1, 1,
0.09723847, 0.1536107, -0.2618301, 0, 0.6980392, 1, 1,
0.09863713, 0.7947834, -0.03787584, 0, 0.6941177, 1, 1,
0.1077251, -2.059746, 2.537596, 0, 0.6862745, 1, 1,
0.10919, -0.4626432, 1.658637, 0, 0.682353, 1, 1,
0.1103888, 1.283603, -1.022369, 0, 0.6745098, 1, 1,
0.1104713, 0.1675544, 0.8384991, 0, 0.6705883, 1, 1,
0.1108193, -0.8183109, 4.041902, 0, 0.6627451, 1, 1,
0.1112425, -1.407492, 2.388052, 0, 0.6588235, 1, 1,
0.1131886, -1.887488, 0.2857924, 0, 0.6509804, 1, 1,
0.1136451, 0.5906721, 0.3778882, 0, 0.6470588, 1, 1,
0.1138508, 0.4083402, 0.7599618, 0, 0.6392157, 1, 1,
0.1152903, 1.032746, 0.05407625, 0, 0.6352941, 1, 1,
0.116986, 0.2339108, 1.508607, 0, 0.627451, 1, 1,
0.1212415, 1.554613, -1.628262, 0, 0.6235294, 1, 1,
0.123001, 1.925145, 1.07604, 0, 0.6156863, 1, 1,
0.1291903, 0.2096352, 2.164994, 0, 0.6117647, 1, 1,
0.1297929, 0.8637533, 0.7976583, 0, 0.6039216, 1, 1,
0.1308317, -0.7136176, 2.149819, 0, 0.5960785, 1, 1,
0.1314649, -0.4664768, 0.6246637, 0, 0.5921569, 1, 1,
0.1402111, -0.3902784, 3.086502, 0, 0.5843138, 1, 1,
0.1429306, -1.407088, 2.606345, 0, 0.5803922, 1, 1,
0.1483319, -0.08948918, 1.491182, 0, 0.572549, 1, 1,
0.1506507, 2.041623, 0.1952505, 0, 0.5686275, 1, 1,
0.1520912, 0.4098114, 0.04443041, 0, 0.5607843, 1, 1,
0.15373, -0.2270216, 1.500074, 0, 0.5568628, 1, 1,
0.1540118, -1.108579, 2.912821, 0, 0.5490196, 1, 1,
0.1541095, 0.6335357, 0.05160822, 0, 0.5450981, 1, 1,
0.1552752, 1.447094, -0.8868441, 0, 0.5372549, 1, 1,
0.1554426, -0.2650155, 4.189158, 0, 0.5333334, 1, 1,
0.1654643, -0.5952088, 1.790082, 0, 0.5254902, 1, 1,
0.1677095, 0.1871148, -0.2885642, 0, 0.5215687, 1, 1,
0.1713247, 1.024712, 2.748872, 0, 0.5137255, 1, 1,
0.1752759, -0.6284831, 5.035697, 0, 0.509804, 1, 1,
0.1758247, -1.314803, 3.018684, 0, 0.5019608, 1, 1,
0.1778582, -1.752915, 3.962901, 0, 0.4941176, 1, 1,
0.1824687, -0.994357, 3.913876, 0, 0.4901961, 1, 1,
0.187751, 0.2247446, 1.515668, 0, 0.4823529, 1, 1,
0.1957515, -0.1922148, 2.44243, 0, 0.4784314, 1, 1,
0.1960945, 0.4566251, 1.225444, 0, 0.4705882, 1, 1,
0.1964879, 0.1959441, 0.4146712, 0, 0.4666667, 1, 1,
0.200794, 0.06994613, 0.7842062, 0, 0.4588235, 1, 1,
0.2032165, -1.350215, 1.375596, 0, 0.454902, 1, 1,
0.2035272, 1.463596, 1.468487, 0, 0.4470588, 1, 1,
0.2036996, -0.06558294, 1.059785, 0, 0.4431373, 1, 1,
0.2051892, 0.9928244, 0.2464479, 0, 0.4352941, 1, 1,
0.20539, 0.3879178, 0.4702263, 0, 0.4313726, 1, 1,
0.2080969, -0.07284285, 2.248184, 0, 0.4235294, 1, 1,
0.2084184, 2.468872, -2.166653, 0, 0.4196078, 1, 1,
0.2106059, -0.7424483, 3.687959, 0, 0.4117647, 1, 1,
0.2109462, -0.5296052, 2.160239, 0, 0.4078431, 1, 1,
0.2135893, -1.403265, 3.505785, 0, 0.4, 1, 1,
0.2164957, 0.59674, 0.9913167, 0, 0.3921569, 1, 1,
0.2181542, 1.477378, -0.2258568, 0, 0.3882353, 1, 1,
0.2184321, 0.6212215, 0.8089213, 0, 0.3803922, 1, 1,
0.2230151, 0.6285015, -0.5906751, 0, 0.3764706, 1, 1,
0.2254596, -0.2359925, 2.060605, 0, 0.3686275, 1, 1,
0.2264697, -0.2127825, 3.279483, 0, 0.3647059, 1, 1,
0.2270966, 1.177999, -0.4578975, 0, 0.3568628, 1, 1,
0.2345954, 0.5343164, 0.3699451, 0, 0.3529412, 1, 1,
0.2362483, -0.3338793, 1.425689, 0, 0.345098, 1, 1,
0.2453664, 1.830315, -0.09866717, 0, 0.3411765, 1, 1,
0.2462908, -1.602051, 3.186059, 0, 0.3333333, 1, 1,
0.2472415, -3.166723, 2.683648, 0, 0.3294118, 1, 1,
0.252717, -0.355389, 3.211803, 0, 0.3215686, 1, 1,
0.2527706, 0.7448463, -0.8342412, 0, 0.3176471, 1, 1,
0.2535017, 1.374387, -0.3413039, 0, 0.3098039, 1, 1,
0.2571057, 0.104209, 3.3424, 0, 0.3058824, 1, 1,
0.2575969, 0.5157568, -0.6904729, 0, 0.2980392, 1, 1,
0.2618751, -0.7273734, 2.566123, 0, 0.2901961, 1, 1,
0.2632767, 2.557357, 0.4074717, 0, 0.2862745, 1, 1,
0.2661433, 0.4917481, 1.580706, 0, 0.2784314, 1, 1,
0.2689424, 1.401095, -0.8626838, 0, 0.2745098, 1, 1,
0.2701035, -0.02974729, 1.436896, 0, 0.2666667, 1, 1,
0.2713847, -1.762437, 3.547158, 0, 0.2627451, 1, 1,
0.2732651, -1.999843, 2.463671, 0, 0.254902, 1, 1,
0.2802988, 0.1137237, 2.328157, 0, 0.2509804, 1, 1,
0.2895085, -3.794157, 2.397921, 0, 0.2431373, 1, 1,
0.2896237, 0.8435282, -0.9787712, 0, 0.2392157, 1, 1,
0.2899524, -0.6443114, 1.636204, 0, 0.2313726, 1, 1,
0.2943411, -0.1116456, 2.87719, 0, 0.227451, 1, 1,
0.2994247, -0.9822432, 2.344671, 0, 0.2196078, 1, 1,
0.2996308, 2.585012, 0.7710159, 0, 0.2156863, 1, 1,
0.3004287, -0.2385226, 2.795059, 0, 0.2078431, 1, 1,
0.3050642, -0.05867793, 1.680772, 0, 0.2039216, 1, 1,
0.3094249, -0.9053982, 2.093051, 0, 0.1960784, 1, 1,
0.3173532, -1.091795, 1.632618, 0, 0.1882353, 1, 1,
0.3194344, -0.5448416, 3.643779, 0, 0.1843137, 1, 1,
0.3218893, 0.3891683, 0.7171357, 0, 0.1764706, 1, 1,
0.3275081, -0.2050203, 2.891251, 0, 0.172549, 1, 1,
0.3304003, 0.1271526, 2.375396, 0, 0.1647059, 1, 1,
0.330806, 0.7202764, 1.807635, 0, 0.1607843, 1, 1,
0.3354678, 0.6924336, 0.5775643, 0, 0.1529412, 1, 1,
0.336091, -0.1801047, 1.731421, 0, 0.1490196, 1, 1,
0.3365821, -0.5551554, 4.590527, 0, 0.1411765, 1, 1,
0.3377514, 0.1751872, 0.06822629, 0, 0.1372549, 1, 1,
0.3394322, 0.6103821, 1.33055, 0, 0.1294118, 1, 1,
0.3417457, -1.588852, 2.615417, 0, 0.1254902, 1, 1,
0.3429833, -0.9223362, 1.969432, 0, 0.1176471, 1, 1,
0.3445411, -1.799093, 2.067393, 0, 0.1137255, 1, 1,
0.3455071, -0.1674453, 0.8989842, 0, 0.1058824, 1, 1,
0.3488808, 0.2413729, -0.2316619, 0, 0.09803922, 1, 1,
0.3535577, -0.6591063, 3.510566, 0, 0.09411765, 1, 1,
0.355916, 0.3415855, 0.2938913, 0, 0.08627451, 1, 1,
0.356976, -0.05895934, 0.3658245, 0, 0.08235294, 1, 1,
0.3570918, -0.6201559, 2.250789, 0, 0.07450981, 1, 1,
0.3588801, 0.395058, 3.319602, 0, 0.07058824, 1, 1,
0.3593525, -1.500674, 5.175565, 0, 0.0627451, 1, 1,
0.364277, 1.628709, -0.7102341, 0, 0.05882353, 1, 1,
0.3684096, 0.703947, 0.1588562, 0, 0.05098039, 1, 1,
0.3717166, -1.727389, 2.721859, 0, 0.04705882, 1, 1,
0.3745744, 0.6258354, 0.5490996, 0, 0.03921569, 1, 1,
0.3764291, -1.741991, 2.876005, 0, 0.03529412, 1, 1,
0.381863, 2.099254, -0.5409111, 0, 0.02745098, 1, 1,
0.3881094, -0.7988234, 2.066519, 0, 0.02352941, 1, 1,
0.3896184, 1.938567, -0.6656743, 0, 0.01568628, 1, 1,
0.3898368, 0.5075974, 1.052633, 0, 0.01176471, 1, 1,
0.3952516, -0.2964067, 1.441955, 0, 0.003921569, 1, 1,
0.3982599, 0.2880253, 3.152938, 0.003921569, 0, 1, 1,
0.3985634, 1.712055, -2.056572, 0.007843138, 0, 1, 1,
0.4014508, 1.008026, -0.4222317, 0.01568628, 0, 1, 1,
0.4015183, -1.166094, 3.567091, 0.01960784, 0, 1, 1,
0.4021073, 0.6819432, 0.7130778, 0.02745098, 0, 1, 1,
0.4037996, 0.9917347, 0.7696061, 0.03137255, 0, 1, 1,
0.4044025, -2.245674, 3.455242, 0.03921569, 0, 1, 1,
0.4055613, -1.806812, 3.559209, 0.04313726, 0, 1, 1,
0.4123295, -0.197992, 2.438585, 0.05098039, 0, 1, 1,
0.4133544, 1.339666, -1.247975, 0.05490196, 0, 1, 1,
0.4193369, 0.5727586, 2.539527, 0.0627451, 0, 1, 1,
0.4200171, 2.007588, 0.4473163, 0.06666667, 0, 1, 1,
0.4206469, -0.05016748, 3.480568, 0.07450981, 0, 1, 1,
0.4213824, 0.2008909, 1.850167, 0.07843138, 0, 1, 1,
0.4221104, -0.05393964, 0.7612186, 0.08627451, 0, 1, 1,
0.4225271, 0.2658241, 1.238907, 0.09019608, 0, 1, 1,
0.4244007, 0.5480468, 0.0587144, 0.09803922, 0, 1, 1,
0.4244365, -2.688571, 2.52504, 0.1058824, 0, 1, 1,
0.4263266, 0.006434711, 1.006907, 0.1098039, 0, 1, 1,
0.4357599, -0.802434, 0.3907775, 0.1176471, 0, 1, 1,
0.4368267, 0.4764404, 0.5626008, 0.1215686, 0, 1, 1,
0.437778, 2.181726, 1.872886, 0.1294118, 0, 1, 1,
0.4413647, 0.4452441, -0.4295569, 0.1333333, 0, 1, 1,
0.4416496, -0.5527691, 2.633112, 0.1411765, 0, 1, 1,
0.441843, -0.1443072, 0.5107775, 0.145098, 0, 1, 1,
0.4421568, 0.3098558, 0.8648379, 0.1529412, 0, 1, 1,
0.4450767, -0.4528667, 1.084432, 0.1568628, 0, 1, 1,
0.4467193, -0.3740567, 3.361199, 0.1647059, 0, 1, 1,
0.4493616, -0.6085446, 2.408247, 0.1686275, 0, 1, 1,
0.4641715, 0.3868394, 0.05826769, 0.1764706, 0, 1, 1,
0.4644708, -2.359823, 2.388804, 0.1803922, 0, 1, 1,
0.465835, -0.1941534, 3.466631, 0.1882353, 0, 1, 1,
0.4668092, -0.9800735, 4.328445, 0.1921569, 0, 1, 1,
0.4690266, -0.03633846, -0.2603438, 0.2, 0, 1, 1,
0.4693436, 0.5166931, 2.649394, 0.2078431, 0, 1, 1,
0.4758615, -1.296761, 2.913114, 0.2117647, 0, 1, 1,
0.4823811, -0.7301214, 1.446341, 0.2196078, 0, 1, 1,
0.4859452, 1.186901, 1.428144, 0.2235294, 0, 1, 1,
0.4952, -1.229684, 1.379097, 0.2313726, 0, 1, 1,
0.4966954, -0.6477361, 1.864081, 0.2352941, 0, 1, 1,
0.4974738, 1.153914, 1.480989, 0.2431373, 0, 1, 1,
0.4996011, 0.7823447, 2.075063, 0.2470588, 0, 1, 1,
0.5057924, -1.515831, 3.716837, 0.254902, 0, 1, 1,
0.5159975, -1.046775, 3.0143, 0.2588235, 0, 1, 1,
0.5169002, 0.2371766, 3.330899, 0.2666667, 0, 1, 1,
0.5186409, -0.7227885, 2.253415, 0.2705882, 0, 1, 1,
0.5187523, 0.1222682, 1.08518, 0.2784314, 0, 1, 1,
0.518919, 1.300478, 0.5374087, 0.282353, 0, 1, 1,
0.5203838, 0.7707645, 0.3400123, 0.2901961, 0, 1, 1,
0.5223666, -0.4914462, 3.387466, 0.2941177, 0, 1, 1,
0.5229598, -1.854237, 3.401329, 0.3019608, 0, 1, 1,
0.5232776, -0.08929957, 1.054232, 0.3098039, 0, 1, 1,
0.5258094, -1.461891, 3.009511, 0.3137255, 0, 1, 1,
0.5296025, -0.8691384, 2.431755, 0.3215686, 0, 1, 1,
0.5312561, -0.8871205, 2.806918, 0.3254902, 0, 1, 1,
0.5314074, 0.9148994, -0.4959722, 0.3333333, 0, 1, 1,
0.5318235, -2.050893, 4.062309, 0.3372549, 0, 1, 1,
0.5322042, 1.575613, 0.5475942, 0.345098, 0, 1, 1,
0.5396916, -1.623261, 2.032475, 0.3490196, 0, 1, 1,
0.5407218, 0.388324, 1.625529, 0.3568628, 0, 1, 1,
0.5463221, 1.997791, -0.287942, 0.3607843, 0, 1, 1,
0.5465723, 0.2228842, 1.063126, 0.3686275, 0, 1, 1,
0.5484911, -0.3886334, 3.026224, 0.372549, 0, 1, 1,
0.5497851, 1.446492, -0.4851575, 0.3803922, 0, 1, 1,
0.5543489, 0.6483928, 0.3014843, 0.3843137, 0, 1, 1,
0.5557916, 1.194162, 0.489491, 0.3921569, 0, 1, 1,
0.5569795, -0.7829894, 2.270196, 0.3960784, 0, 1, 1,
0.557606, -0.6610417, 1.316451, 0.4039216, 0, 1, 1,
0.5593687, -0.3205138, 2.15521, 0.4117647, 0, 1, 1,
0.5633053, 0.3068237, 1.323202, 0.4156863, 0, 1, 1,
0.5634307, 0.5826036, 1.304523, 0.4235294, 0, 1, 1,
0.5668882, 0.4725888, -0.4122482, 0.427451, 0, 1, 1,
0.567751, -1.055785, 4.975763, 0.4352941, 0, 1, 1,
0.5737536, 0.519069, -0.3402832, 0.4392157, 0, 1, 1,
0.5762159, 0.6653376, -0.7885697, 0.4470588, 0, 1, 1,
0.5790749, 0.1821454, -0.7398673, 0.4509804, 0, 1, 1,
0.5807167, 1.09596, 0.6779866, 0.4588235, 0, 1, 1,
0.5835429, 1.615268, 0.2315163, 0.4627451, 0, 1, 1,
0.5838826, 1.808495, 0.6150725, 0.4705882, 0, 1, 1,
0.5845779, 0.7850522, 1.148327, 0.4745098, 0, 1, 1,
0.5902492, 0.5749912, -0.2990504, 0.4823529, 0, 1, 1,
0.6080211, 1.630938, 1.943167, 0.4862745, 0, 1, 1,
0.6125414, 1.065906, 0.4209686, 0.4941176, 0, 1, 1,
0.6157314, -1.205977, 2.708719, 0.5019608, 0, 1, 1,
0.6218709, 0.2100155, 0.1784308, 0.5058824, 0, 1, 1,
0.6230283, 0.4274194, 1.191594, 0.5137255, 0, 1, 1,
0.6233261, -0.2519109, 1.167654, 0.5176471, 0, 1, 1,
0.6242457, -2.20818, 3.282665, 0.5254902, 0, 1, 1,
0.6263928, -0.5623018, 2.01756, 0.5294118, 0, 1, 1,
0.6268082, -0.3030645, 3.133311, 0.5372549, 0, 1, 1,
0.6269153, -0.1526345, 3.793607, 0.5411765, 0, 1, 1,
0.6328433, -0.8582721, 3.118506, 0.5490196, 0, 1, 1,
0.6354901, -1.530588, 2.706822, 0.5529412, 0, 1, 1,
0.6372587, 0.6544517, 1.112616, 0.5607843, 0, 1, 1,
0.6387048, -0.9367197, 1.942536, 0.5647059, 0, 1, 1,
0.6399246, -0.5367728, 4.150354, 0.572549, 0, 1, 1,
0.6415817, 0.5058316, 2.053788, 0.5764706, 0, 1, 1,
0.6439892, 0.252959, 1.743879, 0.5843138, 0, 1, 1,
0.6499395, -0.3976068, 2.517386, 0.5882353, 0, 1, 1,
0.650893, -0.3251773, 2.152194, 0.5960785, 0, 1, 1,
0.6546419, 1.217727, 2.879404, 0.6039216, 0, 1, 1,
0.6567631, 0.5628146, 1.546717, 0.6078432, 0, 1, 1,
0.6595562, -1.13973, 3.664646, 0.6156863, 0, 1, 1,
0.660919, 0.162733, 0.8751418, 0.6196079, 0, 1, 1,
0.66221, -0.09263275, 1.331629, 0.627451, 0, 1, 1,
0.6633045, 0.864668, -0.1590602, 0.6313726, 0, 1, 1,
0.6648217, 0.01976399, 1.681839, 0.6392157, 0, 1, 1,
0.6684762, 2.149365, 0.9790071, 0.6431373, 0, 1, 1,
0.6694798, -0.4930914, 1.067812, 0.6509804, 0, 1, 1,
0.6695883, 1.753122, -1.1218, 0.654902, 0, 1, 1,
0.6698204, -0.4462276, 1.26919, 0.6627451, 0, 1, 1,
0.6802794, 0.9210448, 1.263101, 0.6666667, 0, 1, 1,
0.6895092, -0.2291529, 1.176071, 0.6745098, 0, 1, 1,
0.689537, -0.3009383, 2.947964, 0.6784314, 0, 1, 1,
0.6902822, -0.1362521, 3.055794, 0.6862745, 0, 1, 1,
0.6997567, -2.164549, 2.921147, 0.6901961, 0, 1, 1,
0.6998854, 0.9317068, -1.195681, 0.6980392, 0, 1, 1,
0.7019565, 0.03091638, 2.752786, 0.7058824, 0, 1, 1,
0.7059081, 1.465027, 0.2698696, 0.7098039, 0, 1, 1,
0.7059794, -0.2800341, 3.246995, 0.7176471, 0, 1, 1,
0.7067026, -1.225347, 3.31707, 0.7215686, 0, 1, 1,
0.7085004, -0.859161, 1.908169, 0.7294118, 0, 1, 1,
0.7160624, -0.1988351, 1.044343, 0.7333333, 0, 1, 1,
0.7188991, -0.0136235, 0.3898449, 0.7411765, 0, 1, 1,
0.7195608, -2.218013, 3.298416, 0.7450981, 0, 1, 1,
0.7268278, 0.5357465, 0.2219989, 0.7529412, 0, 1, 1,
0.7323089, -1.817084, 1.459428, 0.7568628, 0, 1, 1,
0.7324418, 1.184853, 1.71965, 0.7647059, 0, 1, 1,
0.7339411, -0.6977012, 1.853747, 0.7686275, 0, 1, 1,
0.7340183, 1.805296, -0.3300278, 0.7764706, 0, 1, 1,
0.7347362, 1.297781, 0.4722311, 0.7803922, 0, 1, 1,
0.7421432, -1.691074, 1.925255, 0.7882353, 0, 1, 1,
0.7427787, 0.8521006, -0.2593213, 0.7921569, 0, 1, 1,
0.7438211, -1.49196, 3.172378, 0.8, 0, 1, 1,
0.7483715, -0.08717135, 1.543801, 0.8078431, 0, 1, 1,
0.7542983, 1.150832, 0.8185918, 0.8117647, 0, 1, 1,
0.756103, -1.696271, 3.417439, 0.8196079, 0, 1, 1,
0.7574736, -0.518783, 2.360971, 0.8235294, 0, 1, 1,
0.7590749, -0.8931772, 1.875781, 0.8313726, 0, 1, 1,
0.7607017, 0.199337, 0.8595405, 0.8352941, 0, 1, 1,
0.764453, -0.6880339, 3.881633, 0.8431373, 0, 1, 1,
0.7650285, -0.6373016, 2.10156, 0.8470588, 0, 1, 1,
0.7678447, -0.2310239, 1.501969, 0.854902, 0, 1, 1,
0.7775276, -1.927087, 1.669282, 0.8588235, 0, 1, 1,
0.7811544, 1.2283, 1.966766, 0.8666667, 0, 1, 1,
0.7865736, 0.6106918, 0.5946246, 0.8705882, 0, 1, 1,
0.7914729, -0.2495509, 0.5948759, 0.8784314, 0, 1, 1,
0.7935929, 1.699596, 0.836883, 0.8823529, 0, 1, 1,
0.7971001, 0.6953729, -0.09448963, 0.8901961, 0, 1, 1,
0.801958, 1.047588, 1.29688, 0.8941177, 0, 1, 1,
0.8059088, -0.09904046, 2.134726, 0.9019608, 0, 1, 1,
0.8093733, -0.8536124, 2.698713, 0.9098039, 0, 1, 1,
0.809596, -0.134603, 1.174368, 0.9137255, 0, 1, 1,
0.8146344, 0.4861868, 0.5441866, 0.9215686, 0, 1, 1,
0.8149219, -0.8621296, 2.59025, 0.9254902, 0, 1, 1,
0.8273492, 0.2648872, 1.611199, 0.9333333, 0, 1, 1,
0.8289384, 0.5669884, 1.8901, 0.9372549, 0, 1, 1,
0.8292544, -0.7587973, 1.876125, 0.945098, 0, 1, 1,
0.8321992, -0.8748852, 3.011158, 0.9490196, 0, 1, 1,
0.8333462, 2.735289, 0.2558172, 0.9568627, 0, 1, 1,
0.8361686, -0.344363, 3.516886, 0.9607843, 0, 1, 1,
0.8371766, 2.277796, 1.03897, 0.9686275, 0, 1, 1,
0.8421608, -0.9787827, 2.057919, 0.972549, 0, 1, 1,
0.8605734, -0.1866372, 1.402342, 0.9803922, 0, 1, 1,
0.8651628, 0.5157832, -0.1337415, 0.9843137, 0, 1, 1,
0.8728262, -0.2411514, 3.289736, 0.9921569, 0, 1, 1,
0.8728986, 2.300275, -0.8907442, 0.9960784, 0, 1, 1,
0.8733048, 0.3633204, 0.7719345, 1, 0, 0.9960784, 1,
0.8748326, -0.3691494, 3.890245, 1, 0, 0.9882353, 1,
0.8803171, -0.1448651, 2.021554, 1, 0, 0.9843137, 1,
0.8831704, 1.984767, 0.5786758, 1, 0, 0.9764706, 1,
0.8854912, -1.161532, 1.212066, 1, 0, 0.972549, 1,
0.8869324, -2.205943, 4.020116, 1, 0, 0.9647059, 1,
0.8930783, 1.716582, 0.3418705, 1, 0, 0.9607843, 1,
0.8970755, -1.000599, 3.399522, 1, 0, 0.9529412, 1,
0.9009188, 1.234587, 0.1995271, 1, 0, 0.9490196, 1,
0.9041942, -2.139511, 3.602351, 1, 0, 0.9411765, 1,
0.9208971, -1.637997, 2.074799, 1, 0, 0.9372549, 1,
0.9244689, 1.536959, -0.6643423, 1, 0, 0.9294118, 1,
0.9246893, -0.3732309, 1.974857, 1, 0, 0.9254902, 1,
0.9288322, 1.322899, 1.474395, 1, 0, 0.9176471, 1,
0.9350774, -0.2209923, 2.477925, 1, 0, 0.9137255, 1,
0.9448972, 1.323936, 0.05966898, 1, 0, 0.9058824, 1,
0.948871, 0.7984438, 0.2013923, 1, 0, 0.9019608, 1,
0.9530081, 0.5050334, 2.381583, 1, 0, 0.8941177, 1,
0.953452, 3.310896, 0.1630288, 1, 0, 0.8862745, 1,
0.9596896, -0.5915215, 2.283774, 1, 0, 0.8823529, 1,
0.967334, 0.9426268, 0.2870176, 1, 0, 0.8745098, 1,
0.9733448, 0.5224751, 1.229355, 1, 0, 0.8705882, 1,
0.9764264, 0.04729976, 1.498607, 1, 0, 0.8627451, 1,
0.9806431, 0.7102333, 0.9947461, 1, 0, 0.8588235, 1,
0.9825706, 1.04293, 0.570851, 1, 0, 0.8509804, 1,
0.9846507, 1.008923, 0.06889703, 1, 0, 0.8470588, 1,
0.9905012, 2.276887, -0.0839714, 1, 0, 0.8392157, 1,
1.003879, -1.712902, 3.653511, 1, 0, 0.8352941, 1,
1.01443, -0.3416792, 1.722735, 1, 0, 0.827451, 1,
1.021483, -0.2610975, 2.211065, 1, 0, 0.8235294, 1,
1.021684, -0.270394, 2.189391, 1, 0, 0.8156863, 1,
1.023792, 1.688782, 0.7759245, 1, 0, 0.8117647, 1,
1.024301, -1.0823, 1.918876, 1, 0, 0.8039216, 1,
1.024874, 0.9336632, 0.1251399, 1, 0, 0.7960784, 1,
1.026618, 0.4574169, 0.9295528, 1, 0, 0.7921569, 1,
1.027662, -1.23805, 2.302662, 1, 0, 0.7843137, 1,
1.027996, 0.1394645, 0.1615023, 1, 0, 0.7803922, 1,
1.028076, -1.97956, 0.583433, 1, 0, 0.772549, 1,
1.032331, 0.2134022, 2.657539, 1, 0, 0.7686275, 1,
1.038481, 1.157403, 1.393021, 1, 0, 0.7607843, 1,
1.04653, -1.402627, 1.532271, 1, 0, 0.7568628, 1,
1.046938, 0.2381384, 1.274375, 1, 0, 0.7490196, 1,
1.050875, -0.5116487, 3.257911, 1, 0, 0.7450981, 1,
1.056552, -0.03149558, 2.369636, 1, 0, 0.7372549, 1,
1.064708, 0.8181287, 1.516019, 1, 0, 0.7333333, 1,
1.069612, -1.372208, 2.621282, 1, 0, 0.7254902, 1,
1.070591, -0.6557949, 1.303473, 1, 0, 0.7215686, 1,
1.07152, -1.741361, 2.581617, 1, 0, 0.7137255, 1,
1.084911, 0.02409538, 1.758816, 1, 0, 0.7098039, 1,
1.085627, -1.328216, 1.52963, 1, 0, 0.7019608, 1,
1.089086, -0.4578518, 2.074697, 1, 0, 0.6941177, 1,
1.089118, 0.446962, 1.436387, 1, 0, 0.6901961, 1,
1.090575, -1.51295, 2.320185, 1, 0, 0.682353, 1,
1.092481, 1.016112, 2.485838, 1, 0, 0.6784314, 1,
1.098698, -0.09346436, 1.74993, 1, 0, 0.6705883, 1,
1.10051, -0.5761665, 1.477977, 1, 0, 0.6666667, 1,
1.106914, 0.02678079, 2.165764, 1, 0, 0.6588235, 1,
1.110469, 0.9772239, -0.0456637, 1, 0, 0.654902, 1,
1.116615, -1.780374, 4.830968, 1, 0, 0.6470588, 1,
1.124592, -0.905494, 4.013447, 1, 0, 0.6431373, 1,
1.126186, -0.08195347, 1.724852, 1, 0, 0.6352941, 1,
1.129046, -0.4996709, 2.192569, 1, 0, 0.6313726, 1,
1.138159, 1.199524, -0.1078733, 1, 0, 0.6235294, 1,
1.147293, 0.1407081, 1.029318, 1, 0, 0.6196079, 1,
1.147745, -2.129855, 4.003232, 1, 0, 0.6117647, 1,
1.149583, -0.1602091, 1.483851, 1, 0, 0.6078432, 1,
1.162567, 0.7186707, 0.9690399, 1, 0, 0.6, 1,
1.172812, 1.433733, 1.439412, 1, 0, 0.5921569, 1,
1.188786, -1.191405, 2.733585, 1, 0, 0.5882353, 1,
1.189408, -1.300915, 2.711424, 1, 0, 0.5803922, 1,
1.214853, -1.239924, 3.72396, 1, 0, 0.5764706, 1,
1.218652, 0.2384046, 1.537549, 1, 0, 0.5686275, 1,
1.227735, 0.03900287, 1.481847, 1, 0, 0.5647059, 1,
1.228819, 0.4109984, 0.4930562, 1, 0, 0.5568628, 1,
1.235047, -0.6780398, 4.318897, 1, 0, 0.5529412, 1,
1.236565, 0.7933935, 0.3542341, 1, 0, 0.5450981, 1,
1.254872, -0.5280142, 2.072241, 1, 0, 0.5411765, 1,
1.260656, 0.02100841, 0.6982741, 1, 0, 0.5333334, 1,
1.263265, -0.06221079, 1.782778, 1, 0, 0.5294118, 1,
1.271544, -0.3635695, 2.004249, 1, 0, 0.5215687, 1,
1.283552, -0.190932, 2.912896, 1, 0, 0.5176471, 1,
1.285296, 0.2699943, 0.9695753, 1, 0, 0.509804, 1,
1.289247, 0.8067526, 1.994236, 1, 0, 0.5058824, 1,
1.304122, -0.3093701, 1.724752, 1, 0, 0.4980392, 1,
1.320562, -0.3798873, -0.5254886, 1, 0, 0.4901961, 1,
1.32171, -2.546361, 0.8949849, 1, 0, 0.4862745, 1,
1.325382, 1.387038, 1.328018, 1, 0, 0.4784314, 1,
1.342295, 1.705563, 1.536444, 1, 0, 0.4745098, 1,
1.346507, 1.353731, 0.3819519, 1, 0, 0.4666667, 1,
1.354371, 0.1139246, 2.520689, 1, 0, 0.4627451, 1,
1.360798, 0.8521331, 2.106112, 1, 0, 0.454902, 1,
1.361598, -0.1534399, 1.193907, 1, 0, 0.4509804, 1,
1.370876, 0.7494164, -0.43618, 1, 0, 0.4431373, 1,
1.383407, 0.7539791, 0.8206266, 1, 0, 0.4392157, 1,
1.392192, -1.056056, 0.6322484, 1, 0, 0.4313726, 1,
1.398017, -1.976141, 2.06386, 1, 0, 0.427451, 1,
1.413973, -0.6326423, 2.513345, 1, 0, 0.4196078, 1,
1.42201, -0.794302, 1.826851, 1, 0, 0.4156863, 1,
1.42634, 0.01460047, 2.410164, 1, 0, 0.4078431, 1,
1.432765, 0.173575, 2.129683, 1, 0, 0.4039216, 1,
1.435577, 0.8185151, 1.567702, 1, 0, 0.3960784, 1,
1.442153, -0.9468165, 3.310974, 1, 0, 0.3882353, 1,
1.446905, -0.5158408, 2.690253, 1, 0, 0.3843137, 1,
1.48279, -0.3494502, 0.6986655, 1, 0, 0.3764706, 1,
1.492627, 1.827483, 0.4034451, 1, 0, 0.372549, 1,
1.49502, 0.1287086, 0.9971688, 1, 0, 0.3647059, 1,
1.50299, 0.5133464, 1.477717, 1, 0, 0.3607843, 1,
1.515643, 0.8155854, 0.812043, 1, 0, 0.3529412, 1,
1.516379, 0.5475268, 1.708969, 1, 0, 0.3490196, 1,
1.521933, -0.1628162, 1.453349, 1, 0, 0.3411765, 1,
1.553351, 0.1769011, 0.09631871, 1, 0, 0.3372549, 1,
1.583955, 0.555707, 1.721906, 1, 0, 0.3294118, 1,
1.60228, -0.9788738, 2.496186, 1, 0, 0.3254902, 1,
1.603447, 1.047027, -0.07574572, 1, 0, 0.3176471, 1,
1.61604, 0.1836089, 3.16909, 1, 0, 0.3137255, 1,
1.641622, 0.5831956, -0.1481245, 1, 0, 0.3058824, 1,
1.643317, -1.508612, 2.040491, 1, 0, 0.2980392, 1,
1.651651, -2.007209, 2.814296, 1, 0, 0.2941177, 1,
1.655453, 0.6844255, 2.343411, 1, 0, 0.2862745, 1,
1.656249, -0.2855873, 0.0005707865, 1, 0, 0.282353, 1,
1.658725, 0.173204, -0.2127286, 1, 0, 0.2745098, 1,
1.658938, 1.273494, -0.1773936, 1, 0, 0.2705882, 1,
1.67034, 0.761706, 2.476277, 1, 0, 0.2627451, 1,
1.671416, 0.4338094, 1.246995, 1, 0, 0.2588235, 1,
1.68011, 1.615492, 1.010406, 1, 0, 0.2509804, 1,
1.697713, 1.731283, 1.770745, 1, 0, 0.2470588, 1,
1.741226, 1.311188, 2.867514, 1, 0, 0.2392157, 1,
1.752617, -1.120134, 2.017368, 1, 0, 0.2352941, 1,
1.79581, -0.556231, 1.825021, 1, 0, 0.227451, 1,
1.79955, 0.702836, 1.635459, 1, 0, 0.2235294, 1,
1.800132, -0.4992947, 1.019373, 1, 0, 0.2156863, 1,
1.804757, -1.722029, 2.877197, 1, 0, 0.2117647, 1,
1.809518, -0.2828362, 1.228919, 1, 0, 0.2039216, 1,
1.835649, -0.983447, 3.747535, 1, 0, 0.1960784, 1,
1.840541, -0.6831602, 3.259973, 1, 0, 0.1921569, 1,
1.84167, -0.2279555, 1.543789, 1, 0, 0.1843137, 1,
1.843933, -2.070799, 1.39078, 1, 0, 0.1803922, 1,
1.870571, 1.405799, 1.541188, 1, 0, 0.172549, 1,
1.887512, 1.234833, 2.672326, 1, 0, 0.1686275, 1,
1.902274, -0.1305062, 0.4673003, 1, 0, 0.1607843, 1,
1.903179, -0.4587996, 1.801678, 1, 0, 0.1568628, 1,
1.913874, -0.246648, 3.18452, 1, 0, 0.1490196, 1,
1.933954, 1.799331, 1.189014, 1, 0, 0.145098, 1,
1.95882, -1.03628, 4.17759, 1, 0, 0.1372549, 1,
1.97221, -1.408169, 1.891464, 1, 0, 0.1333333, 1,
1.982872, -0.2260105, 0.9911652, 1, 0, 0.1254902, 1,
2.019081, -0.9259047, 3.0048, 1, 0, 0.1215686, 1,
2.051056, 0.9607539, 1.469794, 1, 0, 0.1137255, 1,
2.072082, -0.2163805, 2.744862, 1, 0, 0.1098039, 1,
2.089503, 0.2912056, 3.527748, 1, 0, 0.1019608, 1,
2.132702, 2.46551, 1.019325, 1, 0, 0.09411765, 1,
2.133249, -0.6975562, 3.138996, 1, 0, 0.09019608, 1,
2.165858, 0.4588343, -0.2358267, 1, 0, 0.08235294, 1,
2.194552, 0.1306303, -0.05963723, 1, 0, 0.07843138, 1,
2.202485, 0.3268793, 1.887949, 1, 0, 0.07058824, 1,
2.229137, 1.301955, -0.263121, 1, 0, 0.06666667, 1,
2.24424, -0.5318149, 1.219846, 1, 0, 0.05882353, 1,
2.246253, -0.2433787, 2.412276, 1, 0, 0.05490196, 1,
2.279459, 0.8444104, -0.0505898, 1, 0, 0.04705882, 1,
2.2941, 2.172786, 0.6953387, 1, 0, 0.04313726, 1,
2.396755, 2.449481, 1.711278, 1, 0, 0.03529412, 1,
2.422695, -0.6903334, 2.451627, 1, 0, 0.03137255, 1,
2.424073, -0.8639151, 1.552995, 1, 0, 0.02352941, 1,
2.428659, 1.007254, 0.07167484, 1, 0, 0.01960784, 1,
2.653937, 0.5895808, 1.429877, 1, 0, 0.01176471, 1,
3.069705, -1.377238, 0.973523, 1, 0, 0.007843138, 1
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
0.07713652, -4.998463, -6.866884, 0, -0.5, 0.5, 0.5,
0.07713652, -4.998463, -6.866884, 1, -0.5, 0.5, 0.5,
0.07713652, -4.998463, -6.866884, 1, 1.5, 0.5, 0.5,
0.07713652, -4.998463, -6.866884, 0, 1.5, 0.5, 0.5
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
-3.929912, -0.2416303, -6.866884, 0, -0.5, 0.5, 0.5,
-3.929912, -0.2416303, -6.866884, 1, -0.5, 0.5, 0.5,
-3.929912, -0.2416303, -6.866884, 1, 1.5, 0.5, 0.5,
-3.929912, -0.2416303, -6.866884, 0, 1.5, 0.5, 0.5
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
-3.929912, -4.998463, 0.188201, 0, -0.5, 0.5, 0.5,
-3.929912, -4.998463, 0.188201, 1, -0.5, 0.5, 0.5,
-3.929912, -4.998463, 0.188201, 1, 1.5, 0.5, 0.5,
-3.929912, -4.998463, 0.188201, 0, 1.5, 0.5, 0.5
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
-2, -3.900733, -5.238788,
3, -3.900733, -5.238788,
-2, -3.900733, -5.238788,
-2, -4.083688, -5.510137,
-1, -3.900733, -5.238788,
-1, -4.083688, -5.510137,
0, -3.900733, -5.238788,
0, -4.083688, -5.510137,
1, -3.900733, -5.238788,
1, -4.083688, -5.510137,
2, -3.900733, -5.238788,
2, -4.083688, -5.510137,
3, -3.900733, -5.238788,
3, -4.083688, -5.510137
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
-2, -4.449598, -6.052836, 0, -0.5, 0.5, 0.5,
-2, -4.449598, -6.052836, 1, -0.5, 0.5, 0.5,
-2, -4.449598, -6.052836, 1, 1.5, 0.5, 0.5,
-2, -4.449598, -6.052836, 0, 1.5, 0.5, 0.5,
-1, -4.449598, -6.052836, 0, -0.5, 0.5, 0.5,
-1, -4.449598, -6.052836, 1, -0.5, 0.5, 0.5,
-1, -4.449598, -6.052836, 1, 1.5, 0.5, 0.5,
-1, -4.449598, -6.052836, 0, 1.5, 0.5, 0.5,
0, -4.449598, -6.052836, 0, -0.5, 0.5, 0.5,
0, -4.449598, -6.052836, 1, -0.5, 0.5, 0.5,
0, -4.449598, -6.052836, 1, 1.5, 0.5, 0.5,
0, -4.449598, -6.052836, 0, 1.5, 0.5, 0.5,
1, -4.449598, -6.052836, 0, -0.5, 0.5, 0.5,
1, -4.449598, -6.052836, 1, -0.5, 0.5, 0.5,
1, -4.449598, -6.052836, 1, 1.5, 0.5, 0.5,
1, -4.449598, -6.052836, 0, 1.5, 0.5, 0.5,
2, -4.449598, -6.052836, 0, -0.5, 0.5, 0.5,
2, -4.449598, -6.052836, 1, -0.5, 0.5, 0.5,
2, -4.449598, -6.052836, 1, 1.5, 0.5, 0.5,
2, -4.449598, -6.052836, 0, 1.5, 0.5, 0.5,
3, -4.449598, -6.052836, 0, -0.5, 0.5, 0.5,
3, -4.449598, -6.052836, 1, -0.5, 0.5, 0.5,
3, -4.449598, -6.052836, 1, 1.5, 0.5, 0.5,
3, -4.449598, -6.052836, 0, 1.5, 0.5, 0.5
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
-3.005209, -2, -5.238788,
-3.005209, 2, -5.238788,
-3.005209, -2, -5.238788,
-3.159326, -2, -5.510137,
-3.005209, 0, -5.238788,
-3.159326, 0, -5.510137,
-3.005209, 2, -5.238788,
-3.159326, 2, -5.510137
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
-3.467561, -2, -6.052836, 0, -0.5, 0.5, 0.5,
-3.467561, -2, -6.052836, 1, -0.5, 0.5, 0.5,
-3.467561, -2, -6.052836, 1, 1.5, 0.5, 0.5,
-3.467561, -2, -6.052836, 0, 1.5, 0.5, 0.5,
-3.467561, 0, -6.052836, 0, -0.5, 0.5, 0.5,
-3.467561, 0, -6.052836, 1, -0.5, 0.5, 0.5,
-3.467561, 0, -6.052836, 1, 1.5, 0.5, 0.5,
-3.467561, 0, -6.052836, 0, 1.5, 0.5, 0.5,
-3.467561, 2, -6.052836, 0, -0.5, 0.5, 0.5,
-3.467561, 2, -6.052836, 1, -0.5, 0.5, 0.5,
-3.467561, 2, -6.052836, 1, 1.5, 0.5, 0.5,
-3.467561, 2, -6.052836, 0, 1.5, 0.5, 0.5
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
-3.005209, -3.900733, -4,
-3.005209, -3.900733, 4,
-3.005209, -3.900733, -4,
-3.159326, -4.083688, -4,
-3.005209, -3.900733, -2,
-3.159326, -4.083688, -2,
-3.005209, -3.900733, 0,
-3.159326, -4.083688, 0,
-3.005209, -3.900733, 2,
-3.159326, -4.083688, 2,
-3.005209, -3.900733, 4,
-3.159326, -4.083688, 4
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
-3.467561, -4.449598, -4, 0, -0.5, 0.5, 0.5,
-3.467561, -4.449598, -4, 1, -0.5, 0.5, 0.5,
-3.467561, -4.449598, -4, 1, 1.5, 0.5, 0.5,
-3.467561, -4.449598, -4, 0, 1.5, 0.5, 0.5,
-3.467561, -4.449598, -2, 0, -0.5, 0.5, 0.5,
-3.467561, -4.449598, -2, 1, -0.5, 0.5, 0.5,
-3.467561, -4.449598, -2, 1, 1.5, 0.5, 0.5,
-3.467561, -4.449598, -2, 0, 1.5, 0.5, 0.5,
-3.467561, -4.449598, 0, 0, -0.5, 0.5, 0.5,
-3.467561, -4.449598, 0, 1, -0.5, 0.5, 0.5,
-3.467561, -4.449598, 0, 1, 1.5, 0.5, 0.5,
-3.467561, -4.449598, 0, 0, 1.5, 0.5, 0.5,
-3.467561, -4.449598, 2, 0, -0.5, 0.5, 0.5,
-3.467561, -4.449598, 2, 1, -0.5, 0.5, 0.5,
-3.467561, -4.449598, 2, 1, 1.5, 0.5, 0.5,
-3.467561, -4.449598, 2, 0, 1.5, 0.5, 0.5,
-3.467561, -4.449598, 4, 0, -0.5, 0.5, 0.5,
-3.467561, -4.449598, 4, 1, -0.5, 0.5, 0.5,
-3.467561, -4.449598, 4, 1, 1.5, 0.5, 0.5,
-3.467561, -4.449598, 4, 0, 1.5, 0.5, 0.5
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
-3.005209, -3.900733, -5.238788,
-3.005209, 3.417472, -5.238788,
-3.005209, -3.900733, 5.61519,
-3.005209, 3.417472, 5.61519,
-3.005209, -3.900733, -5.238788,
-3.005209, -3.900733, 5.61519,
-3.005209, 3.417472, -5.238788,
-3.005209, 3.417472, 5.61519,
-3.005209, -3.900733, -5.238788,
3.159482, -3.900733, -5.238788,
-3.005209, -3.900733, 5.61519,
3.159482, -3.900733, 5.61519,
-3.005209, 3.417472, -5.238788,
3.159482, 3.417472, -5.238788,
-3.005209, 3.417472, 5.61519,
3.159482, 3.417472, 5.61519,
3.159482, -3.900733, -5.238788,
3.159482, 3.417472, -5.238788,
3.159482, -3.900733, 5.61519,
3.159482, 3.417472, 5.61519,
3.159482, -3.900733, -5.238788,
3.159482, -3.900733, 5.61519,
3.159482, 3.417472, -5.238788,
3.159482, 3.417472, 5.61519
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
var radius = 7.726467;
var distance = 34.37592;
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
mvMatrix.translate( -0.07713652, 0.2416303, -0.188201 );
mvMatrix.scale( 1.355138, 1.141538, 0.7696725 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.37592);
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
gl.drawArrays(gl.LINES, 0, 8);
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
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
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
flufenprox<-read.table("flufenprox.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-flufenprox$V2
```

```
## Error in eval(expr, envir, enclos): object 'flufenprox' not found
```

```r
y<-flufenprox$V3
```

```
## Error in eval(expr, envir, enclos): object 'flufenprox' not found
```

```r
z<-flufenprox$V4
```

```
## Error in eval(expr, envir, enclos): object 'flufenprox' not found
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
-2.915432, 1.235919, -2.193543, 0, 0, 1, 1, 1,
-2.892663, 0.3683401, -1.852713, 1, 0, 0, 1, 1,
-2.872679, -0.03685408, -1.110118, 1, 0, 0, 1, 1,
-2.613153, 0.9736868, -1.001927, 1, 0, 0, 1, 1,
-2.612707, 0.3193946, -1.35306, 1, 0, 0, 1, 1,
-2.611109, -0.3099035, -2.590854, 1, 0, 0, 1, 1,
-2.540879, 1.80014, 0.2699211, 0, 0, 0, 1, 1,
-2.438684, -0.5847328, -3.421033, 0, 0, 0, 1, 1,
-2.393264, 0.4401052, -2.19797, 0, 0, 0, 1, 1,
-2.334696, -0.1686694, -1.534087, 0, 0, 0, 1, 1,
-2.302154, -0.6711232, -1.145215, 0, 0, 0, 1, 1,
-2.272895, 1.975278, -2.159369, 0, 0, 0, 1, 1,
-2.234547, -1.211007, -1.572522, 0, 0, 0, 1, 1,
-2.194471, -0.4535747, -2.313455, 1, 1, 1, 1, 1,
-2.179953, -0.2816477, -1.068676, 1, 1, 1, 1, 1,
-2.154342, -0.8559547, -1.725625, 1, 1, 1, 1, 1,
-2.106649, 0.08041366, -2.425262, 1, 1, 1, 1, 1,
-2.098423, -0.725298, -3.267656, 1, 1, 1, 1, 1,
-2.069578, 0.1426657, -2.336602, 1, 1, 1, 1, 1,
-2.063648, -0.5409827, -1.379734, 1, 1, 1, 1, 1,
-2.04876, 0.3659011, -2.833413, 1, 1, 1, 1, 1,
-2.033681, 1.239641, -2.601406, 1, 1, 1, 1, 1,
-2.02247, 0.6215881, -1.128792, 1, 1, 1, 1, 1,
-1.978144, -0.6242273, -3.270997, 1, 1, 1, 1, 1,
-1.952168, -1.596525, -2.121222, 1, 1, 1, 1, 1,
-1.948466, 0.8488658, -2.586564, 1, 1, 1, 1, 1,
-1.94636, 1.915959, 1.245213, 1, 1, 1, 1, 1,
-1.916792, -0.8612922, -2.521022, 1, 1, 1, 1, 1,
-1.904253, 1.294151, -1.601439, 0, 0, 1, 1, 1,
-1.895885, 0.5898705, -2.837622, 1, 0, 0, 1, 1,
-1.88978, 2.318383, -0.3812577, 1, 0, 0, 1, 1,
-1.877041, 1.863513, -0.7883096, 1, 0, 0, 1, 1,
-1.872713, 1.864474, -1.868178, 1, 0, 0, 1, 1,
-1.863197, -0.2165969, -2.138597, 1, 0, 0, 1, 1,
-1.857371, 0.214946, 1.646359, 0, 0, 0, 1, 1,
-1.846758, 0.3859751, -1.67604, 0, 0, 0, 1, 1,
-1.807246, -0.6617109, -1.587696, 0, 0, 0, 1, 1,
-1.802529, -0.2901755, -2.820299, 0, 0, 0, 1, 1,
-1.788225, -0.4173072, -3.060879, 0, 0, 0, 1, 1,
-1.766234, -0.206067, -1.720346, 0, 0, 0, 1, 1,
-1.755371, 0.5700575, -0.7396559, 0, 0, 0, 1, 1,
-1.746871, -2.005572, -0.78497, 1, 1, 1, 1, 1,
-1.746605, 0.6289249, -1.812978, 1, 1, 1, 1, 1,
-1.742116, -0.5200451, -0.09271675, 1, 1, 1, 1, 1,
-1.74001, -1.765967, -3.297623, 1, 1, 1, 1, 1,
-1.700655, 0.2042695, -1.461231, 1, 1, 1, 1, 1,
-1.691374, -0.1541874, -1.437449, 1, 1, 1, 1, 1,
-1.678979, -0.8958299, -2.407761, 1, 1, 1, 1, 1,
-1.655492, -0.175607, -1.122243, 1, 1, 1, 1, 1,
-1.648339, 1.331286, -1.646312, 1, 1, 1, 1, 1,
-1.640732, 0.573493, -1.858401, 1, 1, 1, 1, 1,
-1.638314, -1.219558, -4.76478, 1, 1, 1, 1, 1,
-1.576117, 1.322657, -0.7062439, 1, 1, 1, 1, 1,
-1.570666, -1.474159, -1.787958, 1, 1, 1, 1, 1,
-1.563001, -1.239699, -2.884564, 1, 1, 1, 1, 1,
-1.559536, 0.008955149, -2.196756, 1, 1, 1, 1, 1,
-1.551797, 0.1795022, -3.143811, 0, 0, 1, 1, 1,
-1.535308, 0.6090526, -2.091277, 1, 0, 0, 1, 1,
-1.528069, 0.3599111, -2.417863, 1, 0, 0, 1, 1,
-1.519629, 0.004977306, -0.8572874, 1, 0, 0, 1, 1,
-1.515066, -1.473673, -3.311116, 1, 0, 0, 1, 1,
-1.507649, -1.666191, -3.565184, 1, 0, 0, 1, 1,
-1.486238, -0.8523818, -0.787989, 0, 0, 0, 1, 1,
-1.482178, 1.155454, -2.273045, 0, 0, 0, 1, 1,
-1.456541, 0.1394672, -1.795587, 0, 0, 0, 1, 1,
-1.445816, -0.6976666, 0.7162189, 0, 0, 0, 1, 1,
-1.443064, -0.298955, -0.9165429, 0, 0, 0, 1, 1,
-1.425035, -1.417096, -2.072543, 0, 0, 0, 1, 1,
-1.424257, 2.677973, -1.651161, 0, 0, 0, 1, 1,
-1.410407, -0.8638346, -1.649306, 1, 1, 1, 1, 1,
-1.404624, 2.690942, -0.610786, 1, 1, 1, 1, 1,
-1.396832, -1.915135, -1.076783, 1, 1, 1, 1, 1,
-1.391073, 0.03281298, -2.759801, 1, 1, 1, 1, 1,
-1.380116, 1.103825, -1.463039, 1, 1, 1, 1, 1,
-1.379527, 2.156652, -0.1224353, 1, 1, 1, 1, 1,
-1.361305, -0.184511, -0.8809565, 1, 1, 1, 1, 1,
-1.360561, 0.336264, -1.948193, 1, 1, 1, 1, 1,
-1.356528, -0.5462456, 0.2614313, 1, 1, 1, 1, 1,
-1.347299, 0.5969687, -0.9796221, 1, 1, 1, 1, 1,
-1.336563, 3.194381, 0.8699257, 1, 1, 1, 1, 1,
-1.33629, 1.829605, -2.012964, 1, 1, 1, 1, 1,
-1.3326, -1.057717, -2.517485, 1, 1, 1, 1, 1,
-1.322934, -0.953393, -0.442666, 1, 1, 1, 1, 1,
-1.319695, 1.330794, -2.748784, 1, 1, 1, 1, 1,
-1.316745, -0.7634347, -3.919396, 0, 0, 1, 1, 1,
-1.308653, -0.01610793, -1.08673, 1, 0, 0, 1, 1,
-1.303098, 0.8078163, -0.1387228, 1, 0, 0, 1, 1,
-1.30005, 0.2353773, -1.349396, 1, 0, 0, 1, 1,
-1.285035, 0.1972793, -1.033142, 1, 0, 0, 1, 1,
-1.263444, -1.805657, -4.958717, 1, 0, 0, 1, 1,
-1.260574, 0.2732204, -1.478584, 0, 0, 0, 1, 1,
-1.248501, 0.07754815, -2.405671, 0, 0, 0, 1, 1,
-1.246072, -0.03041055, -3.38176, 0, 0, 0, 1, 1,
-1.245577, 2.382991, -0.2497093, 0, 0, 0, 1, 1,
-1.235869, 0.3015803, -1.716609, 0, 0, 0, 1, 1,
-1.227353, -1.579146, -3.623873, 0, 0, 0, 1, 1,
-1.222938, 0.1540941, -1.495947, 0, 0, 0, 1, 1,
-1.219286, -1.753712, -2.517631, 1, 1, 1, 1, 1,
-1.200175, -1.054761, -2.931564, 1, 1, 1, 1, 1,
-1.194507, 0.2480662, -0.6543072, 1, 1, 1, 1, 1,
-1.178801, 1.392554, -1.636557, 1, 1, 1, 1, 1,
-1.169813, -1.316563, -2.155766, 1, 1, 1, 1, 1,
-1.158052, 0.7569652, 1.015085, 1, 1, 1, 1, 1,
-1.145701, 1.349082, -0.4386199, 1, 1, 1, 1, 1,
-1.130989, -2.145331, -1.613034, 1, 1, 1, 1, 1,
-1.127979, -1.567098, -1.379061, 1, 1, 1, 1, 1,
-1.127671, -0.02865052, -2.96149, 1, 1, 1, 1, 1,
-1.115966, -1.21318, -2.400832, 1, 1, 1, 1, 1,
-1.110519, 0.4442675, -1.908208, 1, 1, 1, 1, 1,
-1.097549, -1.252951, -2.129565, 1, 1, 1, 1, 1,
-1.089643, -0.6483845, -1.259669, 1, 1, 1, 1, 1,
-1.089296, -0.4229632, -0.2001568, 1, 1, 1, 1, 1,
-1.085571, 1.084638, 0.3629149, 0, 0, 1, 1, 1,
-1.081399, 2.441103, 0.9851764, 1, 0, 0, 1, 1,
-1.076114, -0.838732, -1.190791, 1, 0, 0, 1, 1,
-1.075823, 0.9093924, -1.315839, 1, 0, 0, 1, 1,
-1.075706, -0.4590866, -1.89188, 1, 0, 0, 1, 1,
-1.072261, 0.07964833, -0.1230392, 1, 0, 0, 1, 1,
-1.070031, 1.552983, 1.545957, 0, 0, 0, 1, 1,
-1.067069, -1.317482, -2.531297, 0, 0, 0, 1, 1,
-1.065772, 0.6558138, -1.01758, 0, 0, 0, 1, 1,
-1.064929, -0.9779863, -3.664639, 0, 0, 0, 1, 1,
-1.060722, 0.1471473, -1.53996, 0, 0, 0, 1, 1,
-1.056183, -0.9157839, -0.9619041, 0, 0, 0, 1, 1,
-1.053274, 0.4974632, -0.05051722, 0, 0, 0, 1, 1,
-1.051366, -0.6267043, -0.9986367, 1, 1, 1, 1, 1,
-1.046644, 0.09463564, -0.3685138, 1, 1, 1, 1, 1,
-1.03588, -0.6684294, -3.141991, 1, 1, 1, 1, 1,
-1.033486, 1.261284, -0.5163826, 1, 1, 1, 1, 1,
-1.032763, -1.210145, -3.736719, 1, 1, 1, 1, 1,
-1.032629, -0.5544188, -2.460273, 1, 1, 1, 1, 1,
-1.031611, -0.3966025, -2.716276, 1, 1, 1, 1, 1,
-1.030619, 1.367763, -0.3311171, 1, 1, 1, 1, 1,
-1.017575, 0.04703962, -1.621789, 1, 1, 1, 1, 1,
-1.015765, 0.3403015, 0.3340998, 1, 1, 1, 1, 1,
-1.012511, 1.94716, -0.8854965, 1, 1, 1, 1, 1,
-1.012003, -0.01333959, -1.952158, 1, 1, 1, 1, 1,
-1.011699, -0.3290666, -2.623098, 1, 1, 1, 1, 1,
-1.007493, -2.501496, -1.100448, 1, 1, 1, 1, 1,
-0.9928117, -0.4864601, -1.368545, 1, 1, 1, 1, 1,
-0.9918078, -0.3031364, -2.050462, 0, 0, 1, 1, 1,
-0.9842689, -0.69108, -1.641733, 1, 0, 0, 1, 1,
-0.9829974, -1.420933, -1.124908, 1, 0, 0, 1, 1,
-0.9777094, 1.939178, -0.7887126, 1, 0, 0, 1, 1,
-0.9735261, -0.1943263, -3.386849, 1, 0, 0, 1, 1,
-0.9658095, -0.7022614, -4.367035, 1, 0, 0, 1, 1,
-0.9500943, -0.0786844, -1.846671, 0, 0, 0, 1, 1,
-0.948833, -0.2667247, -0.7374668, 0, 0, 0, 1, 1,
-0.9440447, -0.4504441, -0.8990958, 0, 0, 0, 1, 1,
-0.9411179, 1.569042, -1.082619, 0, 0, 0, 1, 1,
-0.9395375, -0.7646595, -2.305815, 0, 0, 0, 1, 1,
-0.9378693, -0.4029981, -2.426005, 0, 0, 0, 1, 1,
-0.9364562, 0.3495826, -1.831875, 0, 0, 0, 1, 1,
-0.9306036, -0.9647509, -0.6654955, 1, 1, 1, 1, 1,
-0.9277217, 1.541219, -0.7921661, 1, 1, 1, 1, 1,
-0.924289, -0.2226714, -1.668876, 1, 1, 1, 1, 1,
-0.9184651, -0.1977206, -0.175919, 1, 1, 1, 1, 1,
-0.9162141, -0.7667584, -1.106231, 1, 1, 1, 1, 1,
-0.9138884, -1.061065, -1.391604, 1, 1, 1, 1, 1,
-0.9054378, 1.006065, 0.587138, 1, 1, 1, 1, 1,
-0.9021609, -0.5117015, -1.973265, 1, 1, 1, 1, 1,
-0.8997242, 0.09743094, -2.168888, 1, 1, 1, 1, 1,
-0.8949071, -0.9908078, -1.864552, 1, 1, 1, 1, 1,
-0.8931808, 0.1831056, -0.8802451, 1, 1, 1, 1, 1,
-0.888392, -1.322379, -2.893256, 1, 1, 1, 1, 1,
-0.8866557, 1.056794, -1.610259, 1, 1, 1, 1, 1,
-0.8862619, -1.40804, -1.840979, 1, 1, 1, 1, 1,
-0.8838822, -0.4131596, -0.6899057, 1, 1, 1, 1, 1,
-0.8820871, -0.6912991, -3.110814, 0, 0, 1, 1, 1,
-0.8813334, -0.9917136, -0.5922782, 1, 0, 0, 1, 1,
-0.8805113, -1.916469, -2.017931, 1, 0, 0, 1, 1,
-0.8781717, 0.1111128, -1.917739, 1, 0, 0, 1, 1,
-0.8661838, 0.586171, -2.108916, 1, 0, 0, 1, 1,
-0.8582858, -0.2291244, -1.389426, 1, 0, 0, 1, 1,
-0.8580035, -0.7566623, -1.494012, 0, 0, 0, 1, 1,
-0.8557346, 0.7543023, -2.157701, 0, 0, 0, 1, 1,
-0.8552723, -0.7829716, -3.417499, 0, 0, 0, 1, 1,
-0.8525388, -1.084789, -2.788728, 0, 0, 0, 1, 1,
-0.8483799, -1.694291, -3.076714, 0, 0, 0, 1, 1,
-0.8435447, 0.2272886, -2.095759, 0, 0, 0, 1, 1,
-0.8428271, 1.038605, -0.7203786, 0, 0, 0, 1, 1,
-0.8364539, -1.132437, -1.328681, 1, 1, 1, 1, 1,
-0.8320336, 1.415132, -1.194328, 1, 1, 1, 1, 1,
-0.8293619, 0.2017189, -1.741481, 1, 1, 1, 1, 1,
-0.8288639, 1.132783, -0.01773057, 1, 1, 1, 1, 1,
-0.8235468, 0.265909, -2.805918, 1, 1, 1, 1, 1,
-0.8221588, 0.02186374, -1.138453, 1, 1, 1, 1, 1,
-0.8220735, -0.1530548, -1.270329, 1, 1, 1, 1, 1,
-0.8189014, 0.7066499, -0.7893022, 1, 1, 1, 1, 1,
-0.8082369, 0.1974773, -0.8212484, 1, 1, 1, 1, 1,
-0.805855, -1.301526, -3.749143, 1, 1, 1, 1, 1,
-0.8023819, -0.7683882, -1.600889, 1, 1, 1, 1, 1,
-0.8008717, -0.4943274, -3.113114, 1, 1, 1, 1, 1,
-0.7863668, -0.1308128, -1.512641, 1, 1, 1, 1, 1,
-0.7841769, -1.682996, 0.04913507, 1, 1, 1, 1, 1,
-0.7836994, -0.2176299, -1.102277, 1, 1, 1, 1, 1,
-0.7829357, -0.02651464, -1.544211, 0, 0, 1, 1, 1,
-0.7818328, -2.460813, -1.67219, 1, 0, 0, 1, 1,
-0.7799928, -2.296878, -3.808962, 1, 0, 0, 1, 1,
-0.7693571, -0.4379906, -2.954903, 1, 0, 0, 1, 1,
-0.766873, -1.094619, -3.695994, 1, 0, 0, 1, 1,
-0.7649722, 2.766347, -1.77484, 1, 0, 0, 1, 1,
-0.7618461, 0.3724605, -3.17151, 0, 0, 0, 1, 1,
-0.759372, -0.3351494, -1.531989, 0, 0, 0, 1, 1,
-0.7582626, 0.3259943, -1.675775, 0, 0, 0, 1, 1,
-0.7524717, 1.879382, 0.4449483, 0, 0, 0, 1, 1,
-0.7510909, 1.180344, 0.07721663, 0, 0, 0, 1, 1,
-0.750872, -0.2804784, -0.7175025, 0, 0, 0, 1, 1,
-0.7466246, 0.3035398, -1.863428, 0, 0, 0, 1, 1,
-0.7419598, 2.802349, 1.475789, 1, 1, 1, 1, 1,
-0.7413186, 1.079208, -1.165059, 1, 1, 1, 1, 1,
-0.7403382, -0.6154863, -1.405484, 1, 1, 1, 1, 1,
-0.7400299, -1.259239, -2.928179, 1, 1, 1, 1, 1,
-0.7366045, 1.856962, 1.240039, 1, 1, 1, 1, 1,
-0.7365643, 0.6986434, -0.3108792, 1, 1, 1, 1, 1,
-0.7362708, -0.8063157, -2.375197, 1, 1, 1, 1, 1,
-0.7333274, -0.1559952, -1.974784, 1, 1, 1, 1, 1,
-0.7325096, -0.9705621, -4.46887, 1, 1, 1, 1, 1,
-0.7305393, -0.9004801, -1.547384, 1, 1, 1, 1, 1,
-0.7298602, -0.6790671, -3.179154, 1, 1, 1, 1, 1,
-0.7267542, 0.1733961, -0.4910769, 1, 1, 1, 1, 1,
-0.7249607, 0.07055546, 0.01737208, 1, 1, 1, 1, 1,
-0.7234376, 0.9191679, 0.9726774, 1, 1, 1, 1, 1,
-0.722156, -0.009037212, -3.05792, 1, 1, 1, 1, 1,
-0.7157578, -0.5812532, -1.95651, 0, 0, 1, 1, 1,
-0.7154838, 0.1597074, -1.493362, 1, 0, 0, 1, 1,
-0.7148675, 0.4639367, -3.177704, 1, 0, 0, 1, 1,
-0.7122647, -1.052116, -2.697992, 1, 0, 0, 1, 1,
-0.7108414, -2.739835, -1.886389, 1, 0, 0, 1, 1,
-0.7098474, 1.695522, 0.3293912, 1, 0, 0, 1, 1,
-0.7098033, -2.336765, -2.056236, 0, 0, 0, 1, 1,
-0.7083968, -0.3839917, -1.961079, 0, 0, 0, 1, 1,
-0.7080688, -0.8923929, -2.449505, 0, 0, 0, 1, 1,
-0.7072902, -0.5986781, -2.651807, 0, 0, 0, 1, 1,
-0.7024656, 1.536898, 0.8496484, 0, 0, 0, 1, 1,
-0.7006605, -0.1576648, -0.7567396, 0, 0, 0, 1, 1,
-0.6934505, -1.125097, -0.6536097, 0, 0, 0, 1, 1,
-0.6899601, 1.96278, -0.5850825, 1, 1, 1, 1, 1,
-0.6805663, -0.07702348, -1.382235, 1, 1, 1, 1, 1,
-0.6803391, -0.6505511, -2.239739, 1, 1, 1, 1, 1,
-0.6764037, -0.4907519, -2.350579, 1, 1, 1, 1, 1,
-0.6753387, 0.3963475, 0.2113468, 1, 1, 1, 1, 1,
-0.6749097, -0.725269, -2.619752, 1, 1, 1, 1, 1,
-0.6745667, 1.835188, -0.2890762, 1, 1, 1, 1, 1,
-0.6702222, -0.6154876, -3.675929, 1, 1, 1, 1, 1,
-0.6663924, -1.244892, -3.092338, 1, 1, 1, 1, 1,
-0.6658182, 0.2091725, -2.020458, 1, 1, 1, 1, 1,
-0.6621602, 0.08065376, -0.8259314, 1, 1, 1, 1, 1,
-0.654786, -0.7172051, -0.9422163, 1, 1, 1, 1, 1,
-0.6514983, -0.07249556, -1.563362, 1, 1, 1, 1, 1,
-0.6479495, -0.8796331, -1.459542, 1, 1, 1, 1, 1,
-0.646658, 1.179238, -0.183822, 1, 1, 1, 1, 1,
-0.6389502, 0.05553871, -1.93193, 0, 0, 1, 1, 1,
-0.6371144, -0.5749148, -1.557035, 1, 0, 0, 1, 1,
-0.6354541, 1.017845, -0.6771629, 1, 0, 0, 1, 1,
-0.6334159, -0.3522804, -1.354356, 1, 0, 0, 1, 1,
-0.6324839, -1.041199, -1.713356, 1, 0, 0, 1, 1,
-0.6295841, 1.015732, 0.00197805, 1, 0, 0, 1, 1,
-0.6258251, 0.4354374, -1.101167, 0, 0, 0, 1, 1,
-0.6237034, -0.4763697, -0.7694764, 0, 0, 0, 1, 1,
-0.6142904, -0.3906551, -2.308589, 0, 0, 0, 1, 1,
-0.6125728, 0.6476905, 0.5500679, 0, 0, 0, 1, 1,
-0.6099626, -1.68953, -2.495198, 0, 0, 0, 1, 1,
-0.607509, 2.00773, -1.613067, 0, 0, 0, 1, 1,
-0.6073482, 0.2280587, -0.1231869, 0, 0, 0, 1, 1,
-0.5860561, -1.265383, -3.119336, 1, 1, 1, 1, 1,
-0.5824989, 0.2224164, -1.282587, 1, 1, 1, 1, 1,
-0.5807929, 0.7932236, 0.6010476, 1, 1, 1, 1, 1,
-0.5799538, 0.9965619, -0.5850144, 1, 1, 1, 1, 1,
-0.578497, -0.1917449, -0.1547476, 1, 1, 1, 1, 1,
-0.5736016, -0.5704529, -3.336441, 1, 1, 1, 1, 1,
-0.5698127, -0.2430638, -3.487072, 1, 1, 1, 1, 1,
-0.5695973, -0.7715279, -0.4769626, 1, 1, 1, 1, 1,
-0.5673582, 0.3149889, -1.506916, 1, 1, 1, 1, 1,
-0.5623605, 1.249662, -0.9020483, 1, 1, 1, 1, 1,
-0.5622979, -0.6081511, -2.659819, 1, 1, 1, 1, 1,
-0.5616615, -0.6862465, -1.015074, 1, 1, 1, 1, 1,
-0.5590281, -1.907525, -2.638577, 1, 1, 1, 1, 1,
-0.5503086, 2.029085, -0.5473871, 1, 1, 1, 1, 1,
-0.5499451, 0.8348239, -0.7876989, 1, 1, 1, 1, 1,
-0.5496492, -0.7236379, -1.698446, 0, 0, 1, 1, 1,
-0.548509, -0.5222409, -3.868023, 1, 0, 0, 1, 1,
-0.5465003, -0.1883764, -2.12014, 1, 0, 0, 1, 1,
-0.5415218, -0.6381037, -2.934649, 1, 0, 0, 1, 1,
-0.5388805, 0.7339875, -0.3265769, 1, 0, 0, 1, 1,
-0.5374334, -1.281583, -0.801218, 1, 0, 0, 1, 1,
-0.5345325, 1.352659, 1.582161, 0, 0, 0, 1, 1,
-0.5334766, -1.285491, -2.584869, 0, 0, 0, 1, 1,
-0.5313774, 0.1318254, -1.288128, 0, 0, 0, 1, 1,
-0.5249007, -1.12837, -2.064275, 0, 0, 0, 1, 1,
-0.5227544, -0.8958709, -3.967865, 0, 0, 0, 1, 1,
-0.5196065, 1.209076, 0.8940529, 0, 0, 0, 1, 1,
-0.5173379, -0.1568061, -2.357048, 0, 0, 0, 1, 1,
-0.5088875, -0.3756299, -3.227026, 1, 1, 1, 1, 1,
-0.5075425, 1.755504, 0.764577, 1, 1, 1, 1, 1,
-0.5015391, -0.111656, -2.991893, 1, 1, 1, 1, 1,
-0.5001605, 0.4068877, 1.826226, 1, 1, 1, 1, 1,
-0.4960008, 0.7046877, -0.1173241, 1, 1, 1, 1, 1,
-0.4946761, -2.685239, -2.797707, 1, 1, 1, 1, 1,
-0.4922759, -0.9678049, -4.001263, 1, 1, 1, 1, 1,
-0.4908249, -0.4229965, -1.576631, 1, 1, 1, 1, 1,
-0.48933, 0.8267896, -1.468418, 1, 1, 1, 1, 1,
-0.4893245, 0.5025188, -0.8438182, 1, 1, 1, 1, 1,
-0.4879422, 1.735932, 2.575524, 1, 1, 1, 1, 1,
-0.4864569, 1.657074, 0.5421327, 1, 1, 1, 1, 1,
-0.482236, 0.644602, -1.559872, 1, 1, 1, 1, 1,
-0.4812948, 0.6387534, -1.13148, 1, 1, 1, 1, 1,
-0.4796249, -1.567558, -4.119548, 1, 1, 1, 1, 1,
-0.4781956, 0.215848, 0.3442378, 0, 0, 1, 1, 1,
-0.4731992, 0.817131, -0.7041265, 1, 0, 0, 1, 1,
-0.4696357, 0.3705391, -2.00308, 1, 0, 0, 1, 1,
-0.4641896, -0.2330216, -2.573685, 1, 0, 0, 1, 1,
-0.46258, 1.096994, -1.428514, 1, 0, 0, 1, 1,
-0.4613067, -0.09670174, -3.163049, 1, 0, 0, 1, 1,
-0.4600568, 0.3873698, -2.178429, 0, 0, 0, 1, 1,
-0.4588194, -1.452413, -4.40281, 0, 0, 0, 1, 1,
-0.4580604, 0.5636089, -1.758353, 0, 0, 0, 1, 1,
-0.4567719, 2.432803, -0.4092934, 0, 0, 0, 1, 1,
-0.4544938, 0.9382775, -1.260197, 0, 0, 0, 1, 1,
-0.4525268, -2.467707, -2.2281, 0, 0, 0, 1, 1,
-0.4517526, -0.8383732, -3.599192, 0, 0, 0, 1, 1,
-0.4449253, 0.8430675, -1.930753, 1, 1, 1, 1, 1,
-0.4415012, -0.7235929, -1.68546, 1, 1, 1, 1, 1,
-0.4397071, 0.9790416, -0.9440613, 1, 1, 1, 1, 1,
-0.4319453, 0.1738835, -0.452552, 1, 1, 1, 1, 1,
-0.4316718, 0.8466984, 1.222286, 1, 1, 1, 1, 1,
-0.429612, -0.5550119, -3.094053, 1, 1, 1, 1, 1,
-0.4255805, 0.4702243, 0.5920919, 1, 1, 1, 1, 1,
-0.424903, 1.286297, -1.554142, 1, 1, 1, 1, 1,
-0.4238182, -0.7237105, -3.226125, 1, 1, 1, 1, 1,
-0.4233209, -0.03899542, -2.786288, 1, 1, 1, 1, 1,
-0.4226878, -0.594699, -0.6814446, 1, 1, 1, 1, 1,
-0.4223478, -0.7458261, -4.726985, 1, 1, 1, 1, 1,
-0.4221691, -0.3185507, -3.204929, 1, 1, 1, 1, 1,
-0.4134288, -1.038724, -2.115885, 1, 1, 1, 1, 1,
-0.4089039, -0.5023649, -1.846253, 1, 1, 1, 1, 1,
-0.4078392, 0.4926025, -1.523361, 0, 0, 1, 1, 1,
-0.4048515, -0.1513301, -1.6148, 1, 0, 0, 1, 1,
-0.4035548, -1.96532, -2.892199, 1, 0, 0, 1, 1,
-0.3983463, 0.2048353, -2.233209, 1, 0, 0, 1, 1,
-0.3973533, 0.7044573, 0.2151725, 1, 0, 0, 1, 1,
-0.3964061, 0.7895193, -2.302634, 1, 0, 0, 1, 1,
-0.3926468, 0.2064213, -1.683617, 0, 0, 0, 1, 1,
-0.3902467, -1.144136, -2.825431, 0, 0, 0, 1, 1,
-0.3887061, 0.02471, -0.5112308, 0, 0, 0, 1, 1,
-0.3882248, -0.4790802, -3.359498, 0, 0, 0, 1, 1,
-0.3848261, -0.8357188, -1.791941, 0, 0, 0, 1, 1,
-0.3846468, 1.587681, -2.741623, 0, 0, 0, 1, 1,
-0.384481, -0.1060723, -2.645419, 0, 0, 0, 1, 1,
-0.383545, 0.3161763, 0.8751463, 1, 1, 1, 1, 1,
-0.3833859, 0.7583936, -0.9368876, 1, 1, 1, 1, 1,
-0.3795178, -0.1758292, -2.430852, 1, 1, 1, 1, 1,
-0.3740167, -1.655063, -4.584969, 1, 1, 1, 1, 1,
-0.3713088, 0.2533258, -1.32301, 1, 1, 1, 1, 1,
-0.364702, -0.113261, -1.980192, 1, 1, 1, 1, 1,
-0.3637559, -0.1620078, -2.385028, 1, 1, 1, 1, 1,
-0.3616818, 0.9738725, -0.5966287, 1, 1, 1, 1, 1,
-0.3564894, 1.933161, 1.118291, 1, 1, 1, 1, 1,
-0.3483969, -0.7666413, -4.292713, 1, 1, 1, 1, 1,
-0.3483674, -0.5387256, -2.461437, 1, 1, 1, 1, 1,
-0.3452258, -0.4855773, -1.823849, 1, 1, 1, 1, 1,
-0.3431059, -0.7930627, -0.502023, 1, 1, 1, 1, 1,
-0.3420653, 0.5068568, -0.2978555, 1, 1, 1, 1, 1,
-0.3393208, -0.5779219, -3.448425, 1, 1, 1, 1, 1,
-0.3387714, -0.01414299, -0.1799225, 0, 0, 1, 1, 1,
-0.3370838, 0.5078493, -0.5960991, 1, 0, 0, 1, 1,
-0.3352721, 0.09340834, -1.998284, 1, 0, 0, 1, 1,
-0.3339365, -0.2750644, -2.405471, 1, 0, 0, 1, 1,
-0.3324011, -0.1259901, -3.155344, 1, 0, 0, 1, 1,
-0.3319958, -0.6080051, -1.430275, 1, 0, 0, 1, 1,
-0.3261836, -0.009334012, -1.811466, 0, 0, 0, 1, 1,
-0.3255777, 2.39826, -0.3952387, 0, 0, 0, 1, 1,
-0.3237094, -0.7560682, -3.350137, 0, 0, 0, 1, 1,
-0.3213542, -2.39235, -3.131345, 0, 0, 0, 1, 1,
-0.3112124, 1.84009, -0.01364508, 0, 0, 0, 1, 1,
-0.3100224, 1.72511, 1.631154, 0, 0, 0, 1, 1,
-0.3087673, -0.1814395, -2.05729, 0, 0, 0, 1, 1,
-0.3069736, -1.791915, -4.082757, 1, 1, 1, 1, 1,
-0.2983196, -1.194398, -2.859037, 1, 1, 1, 1, 1,
-0.2962607, 0.7737304, 0.5484776, 1, 1, 1, 1, 1,
-0.2959954, -1.000464, -3.152114, 1, 1, 1, 1, 1,
-0.2930888, 1.391369, -0.3216695, 1, 1, 1, 1, 1,
-0.2929752, -0.5610258, -4.557688, 1, 1, 1, 1, 1,
-0.2888165, 0.8799959, -1.844313, 1, 1, 1, 1, 1,
-0.2857842, -0.8101431, -4.035543, 1, 1, 1, 1, 1,
-0.2855296, -1.129803, -4.569191, 1, 1, 1, 1, 1,
-0.2834647, -1.462811, -2.051042, 1, 1, 1, 1, 1,
-0.2806039, -1.434269, -4.424834, 1, 1, 1, 1, 1,
-0.2757766, -1.810034, -4.274217, 1, 1, 1, 1, 1,
-0.2737884, 0.8949849, -0.8679424, 1, 1, 1, 1, 1,
-0.2726406, 1.295419, 1.33401, 1, 1, 1, 1, 1,
-0.2723068, 0.5058962, -1.250028, 1, 1, 1, 1, 1,
-0.2694897, -1.242607, -4.156046, 0, 0, 1, 1, 1,
-0.2619532, -0.4873079, -3.22557, 1, 0, 0, 1, 1,
-0.2617507, -0.1685548, -2.628496, 1, 0, 0, 1, 1,
-0.2608748, -0.2030579, -2.076942, 1, 0, 0, 1, 1,
-0.2569931, -0.009542549, -3.586461, 1, 0, 0, 1, 1,
-0.2559695, 0.3203036, -0.2267166, 1, 0, 0, 1, 1,
-0.2545324, 0.4076165, -1.314447, 0, 0, 0, 1, 1,
-0.2545161, 1.011363, -1.651597, 0, 0, 0, 1, 1,
-0.2527907, -0.4569264, -2.023922, 0, 0, 0, 1, 1,
-0.2523959, 0.1188917, -1.698583, 0, 0, 0, 1, 1,
-0.2421819, 0.392094, -0.9271886, 0, 0, 0, 1, 1,
-0.2419403, 1.949373, 0.3167202, 0, 0, 0, 1, 1,
-0.2412164, -0.8492777, -3.758757, 0, 0, 0, 1, 1,
-0.2398243, 0.5721574, -0.1048365, 1, 1, 1, 1, 1,
-0.2393245, 0.8073566, 0.8124316, 1, 1, 1, 1, 1,
-0.2388246, -1.430911, -4.056958, 1, 1, 1, 1, 1,
-0.2380852, -0.31974, -2.796834, 1, 1, 1, 1, 1,
-0.2378343, 1.681854, 1.414614, 1, 1, 1, 1, 1,
-0.236808, 0.3100039, -1.335976, 1, 1, 1, 1, 1,
-0.2350189, -1.191615, -3.754108, 1, 1, 1, 1, 1,
-0.2342416, -1.443735, -5.08072, 1, 1, 1, 1, 1,
-0.2298728, -0.8435231, -3.209133, 1, 1, 1, 1, 1,
-0.2290171, 0.8517827, 0.8343146, 1, 1, 1, 1, 1,
-0.2284345, 1.380686, 0.3800322, 1, 1, 1, 1, 1,
-0.2262205, -0.6521515, -4.889979, 1, 1, 1, 1, 1,
-0.2252278, -2.595473, -3.546616, 1, 1, 1, 1, 1,
-0.2212836, 0.0893124, 0.7649108, 1, 1, 1, 1, 1,
-0.2144618, -1.811108, -2.134058, 1, 1, 1, 1, 1,
-0.2129128, -1.137739, -3.449624, 0, 0, 1, 1, 1,
-0.2124607, -0.4125074, -2.344354, 1, 0, 0, 1, 1,
-0.2124083, 1.522508, 1.02221, 1, 0, 0, 1, 1,
-0.2120999, -0.9565344, -3.840031, 1, 0, 0, 1, 1,
-0.2114616, -1.303539, -2.092827, 1, 0, 0, 1, 1,
-0.1976518, -1.746115, -3.134844, 1, 0, 0, 1, 1,
-0.1940613, 3.147086, -1.42674, 0, 0, 0, 1, 1,
-0.1932246, 0.9097626, -0.1404099, 0, 0, 0, 1, 1,
-0.1890721, -0.2419069, -1.230084, 0, 0, 0, 1, 1,
-0.1877183, -0.8631334, -2.583241, 0, 0, 0, 1, 1,
-0.183229, 0.2327942, -1.124169, 0, 0, 0, 1, 1,
-0.1807089, 0.2759738, -1.572049, 0, 0, 0, 1, 1,
-0.1775382, 0.7097406, -1.395915, 0, 0, 0, 1, 1,
-0.1772909, -1.732999, -2.837155, 1, 1, 1, 1, 1,
-0.1742486, 0.5910739, 0.5176384, 1, 1, 1, 1, 1,
-0.1732647, -0.8813143, -2.284053, 1, 1, 1, 1, 1,
-0.1717698, 0.246776, -1.688577, 1, 1, 1, 1, 1,
-0.1703428, 0.4633392, 1.025383, 1, 1, 1, 1, 1,
-0.1698103, -0.684212, -2.295468, 1, 1, 1, 1, 1,
-0.1586095, 1.084091, 1.07828, 1, 1, 1, 1, 1,
-0.1539482, -0.02805302, -1.514716, 1, 1, 1, 1, 1,
-0.1496103, -0.6636541, -4.639478, 1, 1, 1, 1, 1,
-0.1481759, 0.4439044, -0.3777907, 1, 1, 1, 1, 1,
-0.1447091, 1.927045, -0.3599179, 1, 1, 1, 1, 1,
-0.1417091, 0.2530185, -0.9741333, 1, 1, 1, 1, 1,
-0.1414091, -1.313476, -2.99408, 1, 1, 1, 1, 1,
-0.1410338, 1.045902, -1.851489, 1, 1, 1, 1, 1,
-0.1339058, 0.3111167, -0.2737973, 1, 1, 1, 1, 1,
-0.1334492, 0.7748739, -0.9252594, 0, 0, 1, 1, 1,
-0.1331591, -0.09975489, -3.464201, 1, 0, 0, 1, 1,
-0.1318074, -1.477204, -3.878603, 1, 0, 0, 1, 1,
-0.1293914, 1.819701, -0.7900585, 1, 0, 0, 1, 1,
-0.127326, 0.7222416, 0.1643754, 1, 0, 0, 1, 1,
-0.1228799, 1.694694, 0.1135723, 1, 0, 0, 1, 1,
-0.121674, -1.116487, -1.641843, 0, 0, 0, 1, 1,
-0.1198381, -1.340343, -2.083591, 0, 0, 0, 1, 1,
-0.1185837, 0.03838741, -1.046311, 0, 0, 0, 1, 1,
-0.1181244, -0.249546, -2.360993, 0, 0, 0, 1, 1,
-0.1178079, 0.6220483, -2.029897, 0, 0, 0, 1, 1,
-0.1151494, 0.7746391, -0.1243466, 0, 0, 0, 1, 1,
-0.1135192, -0.1503934, -2.77839, 0, 0, 0, 1, 1,
-0.1107978, -0.1701998, -3.398344, 1, 1, 1, 1, 1,
-0.1058583, 0.7754201, 0.06263532, 1, 1, 1, 1, 1,
-0.1045333, 1.618631, -0.1518845, 1, 1, 1, 1, 1,
-0.1037773, 1.457803, 0.07188576, 1, 1, 1, 1, 1,
-0.09893592, -1.571597, -3.386984, 1, 1, 1, 1, 1,
-0.09775241, -0.490028, -2.522517, 1, 1, 1, 1, 1,
-0.09658729, -0.6010913, -4.052263, 1, 1, 1, 1, 1,
-0.08528613, -0.9908186, -3.898535, 1, 1, 1, 1, 1,
-0.08225857, -0.1999574, -1.998957, 1, 1, 1, 1, 1,
-0.07804939, -0.5708467, -1.900219, 1, 1, 1, 1, 1,
-0.07780226, -0.362792, -4.958349, 1, 1, 1, 1, 1,
-0.07639455, 1.699674, 0.6841443, 1, 1, 1, 1, 1,
-0.07526432, -1.24035, -3.385021, 1, 1, 1, 1, 1,
-0.0728917, -1.684476, -2.864507, 1, 1, 1, 1, 1,
-0.07240687, -1.774761, -2.228174, 1, 1, 1, 1, 1,
-0.07165066, 2.738288, -0.629184, 0, 0, 1, 1, 1,
-0.06016599, 0.3621606, 0.6106099, 1, 0, 0, 1, 1,
-0.05741462, -0.03438747, -2.709493, 1, 0, 0, 1, 1,
-0.05639605, -0.9531682, -2.744688, 1, 0, 0, 1, 1,
-0.05501528, -0.2739018, -3.120152, 1, 0, 0, 1, 1,
-0.0506035, -0.426264, -3.201691, 1, 0, 0, 1, 1,
-0.05049761, -0.8087259, -3.423562, 0, 0, 0, 1, 1,
-0.04903524, 0.09163447, 0.468974, 0, 0, 0, 1, 1,
-0.0490237, 1.04766, -0.5841626, 0, 0, 0, 1, 1,
-0.04588351, -1.007445, -1.117429, 0, 0, 0, 1, 1,
-0.04354282, 1.206908, 0.8258057, 0, 0, 0, 1, 1,
-0.04027959, -0.1091918, -3.391171, 0, 0, 0, 1, 1,
-0.04022192, 1.170624, -0.06811339, 0, 0, 0, 1, 1,
-0.03874313, -0.6694747, -3.364833, 1, 1, 1, 1, 1,
-0.03734508, 1.236811, -0.3375224, 1, 1, 1, 1, 1,
-0.03661209, -0.03948921, -2.11585, 1, 1, 1, 1, 1,
-0.03526406, -0.5270086, -4.180488, 1, 1, 1, 1, 1,
-0.03033374, -1.202382, -3.668323, 1, 1, 1, 1, 1,
-0.02889752, 0.03742887, -0.4032209, 1, 1, 1, 1, 1,
-0.02438129, 1.407062, 0.5378005, 1, 1, 1, 1, 1,
-0.01912599, 1.36985, -0.3578782, 1, 1, 1, 1, 1,
-0.01824703, -0.3490122, -0.6455163, 1, 1, 1, 1, 1,
-0.0176174, -0.2904651, -4.218527, 1, 1, 1, 1, 1,
-0.0164388, -0.6456442, -1.974241, 1, 1, 1, 1, 1,
-0.01212918, 0.1043275, -0.4529832, 1, 1, 1, 1, 1,
-0.01155121, -0.3756637, -2.92759, 1, 1, 1, 1, 1,
-0.003216966, 0.9553406, -0.1809027, 1, 1, 1, 1, 1,
-0.002114872, 1.020534, 0.8380646, 1, 1, 1, 1, 1,
-0.001633655, -0.5319034, -2.854198, 0, 0, 1, 1, 1,
-0.001251001, 0.1027059, 1.694518, 1, 0, 0, 1, 1,
-0.0001470154, -1.109981, -3.892044, 1, 0, 0, 1, 1,
0.0001072357, 0.5039994, 1.018983, 1, 0, 0, 1, 1,
0.003862657, -1.745206, 3.55334, 1, 0, 0, 1, 1,
0.005423636, 1.111898, 0.1273111, 1, 0, 0, 1, 1,
0.007863631, 0.8245426, -1.514127, 0, 0, 0, 1, 1,
0.01200987, 1.373882, 0.510788, 0, 0, 0, 1, 1,
0.01600429, -0.4817804, 2.479911, 0, 0, 0, 1, 1,
0.01626196, -0.100619, 5.348361, 0, 0, 0, 1, 1,
0.01932256, -0.6005765, 2.978928, 0, 0, 0, 1, 1,
0.02183611, -2.433069, 4.365811, 0, 0, 0, 1, 1,
0.02726228, 0.771974, -0.579437, 0, 0, 0, 1, 1,
0.02798, 0.2131397, -0.5010536, 1, 1, 1, 1, 1,
0.03096458, -0.7420763, 1.542239, 1, 1, 1, 1, 1,
0.03415987, 0.3575941, -0.4519534, 1, 1, 1, 1, 1,
0.03567855, -0.3012773, 2.046236, 1, 1, 1, 1, 1,
0.0413175, 0.04893541, -0.1261164, 1, 1, 1, 1, 1,
0.04207618, -0.9338214, 5.457122, 1, 1, 1, 1, 1,
0.04259664, 1.255585, 0.2246351, 1, 1, 1, 1, 1,
0.04314981, 2.006917, -0.5454538, 1, 1, 1, 1, 1,
0.04528234, 0.381441, -0.7851802, 1, 1, 1, 1, 1,
0.04824315, -1.185274, 1.829118, 1, 1, 1, 1, 1,
0.04841722, 0.7708228, 1.47066, 1, 1, 1, 1, 1,
0.04893937, -1.727263, 5.249823, 1, 1, 1, 1, 1,
0.05014731, -2.462248, 3.03026, 1, 1, 1, 1, 1,
0.05199819, -0.8439186, 2.830167, 1, 1, 1, 1, 1,
0.05648199, -0.212903, 4.292093, 1, 1, 1, 1, 1,
0.05807727, -0.9766758, 3.175414, 0, 0, 1, 1, 1,
0.05813089, 1.138326, 1.933467, 1, 0, 0, 1, 1,
0.05841415, 0.2410282, 0.005969952, 1, 0, 0, 1, 1,
0.05922495, 0.6500224, -0.9361807, 1, 0, 0, 1, 1,
0.05944653, -0.2183041, 4.776838, 1, 0, 0, 1, 1,
0.06477502, -1.210302, 3.253048, 1, 0, 0, 1, 1,
0.06518551, 0.5814933, -0.7966561, 0, 0, 0, 1, 1,
0.07523851, -0.3610829, 3.396403, 0, 0, 0, 1, 1,
0.07925186, 0.1942903, 1.697312, 0, 0, 0, 1, 1,
0.07999286, -1.017992, 3.28317, 0, 0, 0, 1, 1,
0.08184536, -2.011417, 1.670199, 0, 0, 0, 1, 1,
0.08187307, -0.8220159, 4.152608, 0, 0, 0, 1, 1,
0.08388579, -1.42661, 1.432028, 0, 0, 0, 1, 1,
0.08582938, 0.1052619, 0.3691817, 1, 1, 1, 1, 1,
0.09072159, -0.9815822, 4.744967, 1, 1, 1, 1, 1,
0.09283489, -0.2249541, 1.279896, 1, 1, 1, 1, 1,
0.09301968, -1.244667, 3.071153, 1, 1, 1, 1, 1,
0.09664501, 0.4557329, -0.5572875, 1, 1, 1, 1, 1,
0.09723847, 0.1536107, -0.2618301, 1, 1, 1, 1, 1,
0.09863713, 0.7947834, -0.03787584, 1, 1, 1, 1, 1,
0.1077251, -2.059746, 2.537596, 1, 1, 1, 1, 1,
0.10919, -0.4626432, 1.658637, 1, 1, 1, 1, 1,
0.1103888, 1.283603, -1.022369, 1, 1, 1, 1, 1,
0.1104713, 0.1675544, 0.8384991, 1, 1, 1, 1, 1,
0.1108193, -0.8183109, 4.041902, 1, 1, 1, 1, 1,
0.1112425, -1.407492, 2.388052, 1, 1, 1, 1, 1,
0.1131886, -1.887488, 0.2857924, 1, 1, 1, 1, 1,
0.1136451, 0.5906721, 0.3778882, 1, 1, 1, 1, 1,
0.1138508, 0.4083402, 0.7599618, 0, 0, 1, 1, 1,
0.1152903, 1.032746, 0.05407625, 1, 0, 0, 1, 1,
0.116986, 0.2339108, 1.508607, 1, 0, 0, 1, 1,
0.1212415, 1.554613, -1.628262, 1, 0, 0, 1, 1,
0.123001, 1.925145, 1.07604, 1, 0, 0, 1, 1,
0.1291903, 0.2096352, 2.164994, 1, 0, 0, 1, 1,
0.1297929, 0.8637533, 0.7976583, 0, 0, 0, 1, 1,
0.1308317, -0.7136176, 2.149819, 0, 0, 0, 1, 1,
0.1314649, -0.4664768, 0.6246637, 0, 0, 0, 1, 1,
0.1402111, -0.3902784, 3.086502, 0, 0, 0, 1, 1,
0.1429306, -1.407088, 2.606345, 0, 0, 0, 1, 1,
0.1483319, -0.08948918, 1.491182, 0, 0, 0, 1, 1,
0.1506507, 2.041623, 0.1952505, 0, 0, 0, 1, 1,
0.1520912, 0.4098114, 0.04443041, 1, 1, 1, 1, 1,
0.15373, -0.2270216, 1.500074, 1, 1, 1, 1, 1,
0.1540118, -1.108579, 2.912821, 1, 1, 1, 1, 1,
0.1541095, 0.6335357, 0.05160822, 1, 1, 1, 1, 1,
0.1552752, 1.447094, -0.8868441, 1, 1, 1, 1, 1,
0.1554426, -0.2650155, 4.189158, 1, 1, 1, 1, 1,
0.1654643, -0.5952088, 1.790082, 1, 1, 1, 1, 1,
0.1677095, 0.1871148, -0.2885642, 1, 1, 1, 1, 1,
0.1713247, 1.024712, 2.748872, 1, 1, 1, 1, 1,
0.1752759, -0.6284831, 5.035697, 1, 1, 1, 1, 1,
0.1758247, -1.314803, 3.018684, 1, 1, 1, 1, 1,
0.1778582, -1.752915, 3.962901, 1, 1, 1, 1, 1,
0.1824687, -0.994357, 3.913876, 1, 1, 1, 1, 1,
0.187751, 0.2247446, 1.515668, 1, 1, 1, 1, 1,
0.1957515, -0.1922148, 2.44243, 1, 1, 1, 1, 1,
0.1960945, 0.4566251, 1.225444, 0, 0, 1, 1, 1,
0.1964879, 0.1959441, 0.4146712, 1, 0, 0, 1, 1,
0.200794, 0.06994613, 0.7842062, 1, 0, 0, 1, 1,
0.2032165, -1.350215, 1.375596, 1, 0, 0, 1, 1,
0.2035272, 1.463596, 1.468487, 1, 0, 0, 1, 1,
0.2036996, -0.06558294, 1.059785, 1, 0, 0, 1, 1,
0.2051892, 0.9928244, 0.2464479, 0, 0, 0, 1, 1,
0.20539, 0.3879178, 0.4702263, 0, 0, 0, 1, 1,
0.2080969, -0.07284285, 2.248184, 0, 0, 0, 1, 1,
0.2084184, 2.468872, -2.166653, 0, 0, 0, 1, 1,
0.2106059, -0.7424483, 3.687959, 0, 0, 0, 1, 1,
0.2109462, -0.5296052, 2.160239, 0, 0, 0, 1, 1,
0.2135893, -1.403265, 3.505785, 0, 0, 0, 1, 1,
0.2164957, 0.59674, 0.9913167, 1, 1, 1, 1, 1,
0.2181542, 1.477378, -0.2258568, 1, 1, 1, 1, 1,
0.2184321, 0.6212215, 0.8089213, 1, 1, 1, 1, 1,
0.2230151, 0.6285015, -0.5906751, 1, 1, 1, 1, 1,
0.2254596, -0.2359925, 2.060605, 1, 1, 1, 1, 1,
0.2264697, -0.2127825, 3.279483, 1, 1, 1, 1, 1,
0.2270966, 1.177999, -0.4578975, 1, 1, 1, 1, 1,
0.2345954, 0.5343164, 0.3699451, 1, 1, 1, 1, 1,
0.2362483, -0.3338793, 1.425689, 1, 1, 1, 1, 1,
0.2453664, 1.830315, -0.09866717, 1, 1, 1, 1, 1,
0.2462908, -1.602051, 3.186059, 1, 1, 1, 1, 1,
0.2472415, -3.166723, 2.683648, 1, 1, 1, 1, 1,
0.252717, -0.355389, 3.211803, 1, 1, 1, 1, 1,
0.2527706, 0.7448463, -0.8342412, 1, 1, 1, 1, 1,
0.2535017, 1.374387, -0.3413039, 1, 1, 1, 1, 1,
0.2571057, 0.104209, 3.3424, 0, 0, 1, 1, 1,
0.2575969, 0.5157568, -0.6904729, 1, 0, 0, 1, 1,
0.2618751, -0.7273734, 2.566123, 1, 0, 0, 1, 1,
0.2632767, 2.557357, 0.4074717, 1, 0, 0, 1, 1,
0.2661433, 0.4917481, 1.580706, 1, 0, 0, 1, 1,
0.2689424, 1.401095, -0.8626838, 1, 0, 0, 1, 1,
0.2701035, -0.02974729, 1.436896, 0, 0, 0, 1, 1,
0.2713847, -1.762437, 3.547158, 0, 0, 0, 1, 1,
0.2732651, -1.999843, 2.463671, 0, 0, 0, 1, 1,
0.2802988, 0.1137237, 2.328157, 0, 0, 0, 1, 1,
0.2895085, -3.794157, 2.397921, 0, 0, 0, 1, 1,
0.2896237, 0.8435282, -0.9787712, 0, 0, 0, 1, 1,
0.2899524, -0.6443114, 1.636204, 0, 0, 0, 1, 1,
0.2943411, -0.1116456, 2.87719, 1, 1, 1, 1, 1,
0.2994247, -0.9822432, 2.344671, 1, 1, 1, 1, 1,
0.2996308, 2.585012, 0.7710159, 1, 1, 1, 1, 1,
0.3004287, -0.2385226, 2.795059, 1, 1, 1, 1, 1,
0.3050642, -0.05867793, 1.680772, 1, 1, 1, 1, 1,
0.3094249, -0.9053982, 2.093051, 1, 1, 1, 1, 1,
0.3173532, -1.091795, 1.632618, 1, 1, 1, 1, 1,
0.3194344, -0.5448416, 3.643779, 1, 1, 1, 1, 1,
0.3218893, 0.3891683, 0.7171357, 1, 1, 1, 1, 1,
0.3275081, -0.2050203, 2.891251, 1, 1, 1, 1, 1,
0.3304003, 0.1271526, 2.375396, 1, 1, 1, 1, 1,
0.330806, 0.7202764, 1.807635, 1, 1, 1, 1, 1,
0.3354678, 0.6924336, 0.5775643, 1, 1, 1, 1, 1,
0.336091, -0.1801047, 1.731421, 1, 1, 1, 1, 1,
0.3365821, -0.5551554, 4.590527, 1, 1, 1, 1, 1,
0.3377514, 0.1751872, 0.06822629, 0, 0, 1, 1, 1,
0.3394322, 0.6103821, 1.33055, 1, 0, 0, 1, 1,
0.3417457, -1.588852, 2.615417, 1, 0, 0, 1, 1,
0.3429833, -0.9223362, 1.969432, 1, 0, 0, 1, 1,
0.3445411, -1.799093, 2.067393, 1, 0, 0, 1, 1,
0.3455071, -0.1674453, 0.8989842, 1, 0, 0, 1, 1,
0.3488808, 0.2413729, -0.2316619, 0, 0, 0, 1, 1,
0.3535577, -0.6591063, 3.510566, 0, 0, 0, 1, 1,
0.355916, 0.3415855, 0.2938913, 0, 0, 0, 1, 1,
0.356976, -0.05895934, 0.3658245, 0, 0, 0, 1, 1,
0.3570918, -0.6201559, 2.250789, 0, 0, 0, 1, 1,
0.3588801, 0.395058, 3.319602, 0, 0, 0, 1, 1,
0.3593525, -1.500674, 5.175565, 0, 0, 0, 1, 1,
0.364277, 1.628709, -0.7102341, 1, 1, 1, 1, 1,
0.3684096, 0.703947, 0.1588562, 1, 1, 1, 1, 1,
0.3717166, -1.727389, 2.721859, 1, 1, 1, 1, 1,
0.3745744, 0.6258354, 0.5490996, 1, 1, 1, 1, 1,
0.3764291, -1.741991, 2.876005, 1, 1, 1, 1, 1,
0.381863, 2.099254, -0.5409111, 1, 1, 1, 1, 1,
0.3881094, -0.7988234, 2.066519, 1, 1, 1, 1, 1,
0.3896184, 1.938567, -0.6656743, 1, 1, 1, 1, 1,
0.3898368, 0.5075974, 1.052633, 1, 1, 1, 1, 1,
0.3952516, -0.2964067, 1.441955, 1, 1, 1, 1, 1,
0.3982599, 0.2880253, 3.152938, 1, 1, 1, 1, 1,
0.3985634, 1.712055, -2.056572, 1, 1, 1, 1, 1,
0.4014508, 1.008026, -0.4222317, 1, 1, 1, 1, 1,
0.4015183, -1.166094, 3.567091, 1, 1, 1, 1, 1,
0.4021073, 0.6819432, 0.7130778, 1, 1, 1, 1, 1,
0.4037996, 0.9917347, 0.7696061, 0, 0, 1, 1, 1,
0.4044025, -2.245674, 3.455242, 1, 0, 0, 1, 1,
0.4055613, -1.806812, 3.559209, 1, 0, 0, 1, 1,
0.4123295, -0.197992, 2.438585, 1, 0, 0, 1, 1,
0.4133544, 1.339666, -1.247975, 1, 0, 0, 1, 1,
0.4193369, 0.5727586, 2.539527, 1, 0, 0, 1, 1,
0.4200171, 2.007588, 0.4473163, 0, 0, 0, 1, 1,
0.4206469, -0.05016748, 3.480568, 0, 0, 0, 1, 1,
0.4213824, 0.2008909, 1.850167, 0, 0, 0, 1, 1,
0.4221104, -0.05393964, 0.7612186, 0, 0, 0, 1, 1,
0.4225271, 0.2658241, 1.238907, 0, 0, 0, 1, 1,
0.4244007, 0.5480468, 0.0587144, 0, 0, 0, 1, 1,
0.4244365, -2.688571, 2.52504, 0, 0, 0, 1, 1,
0.4263266, 0.006434711, 1.006907, 1, 1, 1, 1, 1,
0.4357599, -0.802434, 0.3907775, 1, 1, 1, 1, 1,
0.4368267, 0.4764404, 0.5626008, 1, 1, 1, 1, 1,
0.437778, 2.181726, 1.872886, 1, 1, 1, 1, 1,
0.4413647, 0.4452441, -0.4295569, 1, 1, 1, 1, 1,
0.4416496, -0.5527691, 2.633112, 1, 1, 1, 1, 1,
0.441843, -0.1443072, 0.5107775, 1, 1, 1, 1, 1,
0.4421568, 0.3098558, 0.8648379, 1, 1, 1, 1, 1,
0.4450767, -0.4528667, 1.084432, 1, 1, 1, 1, 1,
0.4467193, -0.3740567, 3.361199, 1, 1, 1, 1, 1,
0.4493616, -0.6085446, 2.408247, 1, 1, 1, 1, 1,
0.4641715, 0.3868394, 0.05826769, 1, 1, 1, 1, 1,
0.4644708, -2.359823, 2.388804, 1, 1, 1, 1, 1,
0.465835, -0.1941534, 3.466631, 1, 1, 1, 1, 1,
0.4668092, -0.9800735, 4.328445, 1, 1, 1, 1, 1,
0.4690266, -0.03633846, -0.2603438, 0, 0, 1, 1, 1,
0.4693436, 0.5166931, 2.649394, 1, 0, 0, 1, 1,
0.4758615, -1.296761, 2.913114, 1, 0, 0, 1, 1,
0.4823811, -0.7301214, 1.446341, 1, 0, 0, 1, 1,
0.4859452, 1.186901, 1.428144, 1, 0, 0, 1, 1,
0.4952, -1.229684, 1.379097, 1, 0, 0, 1, 1,
0.4966954, -0.6477361, 1.864081, 0, 0, 0, 1, 1,
0.4974738, 1.153914, 1.480989, 0, 0, 0, 1, 1,
0.4996011, 0.7823447, 2.075063, 0, 0, 0, 1, 1,
0.5057924, -1.515831, 3.716837, 0, 0, 0, 1, 1,
0.5159975, -1.046775, 3.0143, 0, 0, 0, 1, 1,
0.5169002, 0.2371766, 3.330899, 0, 0, 0, 1, 1,
0.5186409, -0.7227885, 2.253415, 0, 0, 0, 1, 1,
0.5187523, 0.1222682, 1.08518, 1, 1, 1, 1, 1,
0.518919, 1.300478, 0.5374087, 1, 1, 1, 1, 1,
0.5203838, 0.7707645, 0.3400123, 1, 1, 1, 1, 1,
0.5223666, -0.4914462, 3.387466, 1, 1, 1, 1, 1,
0.5229598, -1.854237, 3.401329, 1, 1, 1, 1, 1,
0.5232776, -0.08929957, 1.054232, 1, 1, 1, 1, 1,
0.5258094, -1.461891, 3.009511, 1, 1, 1, 1, 1,
0.5296025, -0.8691384, 2.431755, 1, 1, 1, 1, 1,
0.5312561, -0.8871205, 2.806918, 1, 1, 1, 1, 1,
0.5314074, 0.9148994, -0.4959722, 1, 1, 1, 1, 1,
0.5318235, -2.050893, 4.062309, 1, 1, 1, 1, 1,
0.5322042, 1.575613, 0.5475942, 1, 1, 1, 1, 1,
0.5396916, -1.623261, 2.032475, 1, 1, 1, 1, 1,
0.5407218, 0.388324, 1.625529, 1, 1, 1, 1, 1,
0.5463221, 1.997791, -0.287942, 1, 1, 1, 1, 1,
0.5465723, 0.2228842, 1.063126, 0, 0, 1, 1, 1,
0.5484911, -0.3886334, 3.026224, 1, 0, 0, 1, 1,
0.5497851, 1.446492, -0.4851575, 1, 0, 0, 1, 1,
0.5543489, 0.6483928, 0.3014843, 1, 0, 0, 1, 1,
0.5557916, 1.194162, 0.489491, 1, 0, 0, 1, 1,
0.5569795, -0.7829894, 2.270196, 1, 0, 0, 1, 1,
0.557606, -0.6610417, 1.316451, 0, 0, 0, 1, 1,
0.5593687, -0.3205138, 2.15521, 0, 0, 0, 1, 1,
0.5633053, 0.3068237, 1.323202, 0, 0, 0, 1, 1,
0.5634307, 0.5826036, 1.304523, 0, 0, 0, 1, 1,
0.5668882, 0.4725888, -0.4122482, 0, 0, 0, 1, 1,
0.567751, -1.055785, 4.975763, 0, 0, 0, 1, 1,
0.5737536, 0.519069, -0.3402832, 0, 0, 0, 1, 1,
0.5762159, 0.6653376, -0.7885697, 1, 1, 1, 1, 1,
0.5790749, 0.1821454, -0.7398673, 1, 1, 1, 1, 1,
0.5807167, 1.09596, 0.6779866, 1, 1, 1, 1, 1,
0.5835429, 1.615268, 0.2315163, 1, 1, 1, 1, 1,
0.5838826, 1.808495, 0.6150725, 1, 1, 1, 1, 1,
0.5845779, 0.7850522, 1.148327, 1, 1, 1, 1, 1,
0.5902492, 0.5749912, -0.2990504, 1, 1, 1, 1, 1,
0.6080211, 1.630938, 1.943167, 1, 1, 1, 1, 1,
0.6125414, 1.065906, 0.4209686, 1, 1, 1, 1, 1,
0.6157314, -1.205977, 2.708719, 1, 1, 1, 1, 1,
0.6218709, 0.2100155, 0.1784308, 1, 1, 1, 1, 1,
0.6230283, 0.4274194, 1.191594, 1, 1, 1, 1, 1,
0.6233261, -0.2519109, 1.167654, 1, 1, 1, 1, 1,
0.6242457, -2.20818, 3.282665, 1, 1, 1, 1, 1,
0.6263928, -0.5623018, 2.01756, 1, 1, 1, 1, 1,
0.6268082, -0.3030645, 3.133311, 0, 0, 1, 1, 1,
0.6269153, -0.1526345, 3.793607, 1, 0, 0, 1, 1,
0.6328433, -0.8582721, 3.118506, 1, 0, 0, 1, 1,
0.6354901, -1.530588, 2.706822, 1, 0, 0, 1, 1,
0.6372587, 0.6544517, 1.112616, 1, 0, 0, 1, 1,
0.6387048, -0.9367197, 1.942536, 1, 0, 0, 1, 1,
0.6399246, -0.5367728, 4.150354, 0, 0, 0, 1, 1,
0.6415817, 0.5058316, 2.053788, 0, 0, 0, 1, 1,
0.6439892, 0.252959, 1.743879, 0, 0, 0, 1, 1,
0.6499395, -0.3976068, 2.517386, 0, 0, 0, 1, 1,
0.650893, -0.3251773, 2.152194, 0, 0, 0, 1, 1,
0.6546419, 1.217727, 2.879404, 0, 0, 0, 1, 1,
0.6567631, 0.5628146, 1.546717, 0, 0, 0, 1, 1,
0.6595562, -1.13973, 3.664646, 1, 1, 1, 1, 1,
0.660919, 0.162733, 0.8751418, 1, 1, 1, 1, 1,
0.66221, -0.09263275, 1.331629, 1, 1, 1, 1, 1,
0.6633045, 0.864668, -0.1590602, 1, 1, 1, 1, 1,
0.6648217, 0.01976399, 1.681839, 1, 1, 1, 1, 1,
0.6684762, 2.149365, 0.9790071, 1, 1, 1, 1, 1,
0.6694798, -0.4930914, 1.067812, 1, 1, 1, 1, 1,
0.6695883, 1.753122, -1.1218, 1, 1, 1, 1, 1,
0.6698204, -0.4462276, 1.26919, 1, 1, 1, 1, 1,
0.6802794, 0.9210448, 1.263101, 1, 1, 1, 1, 1,
0.6895092, -0.2291529, 1.176071, 1, 1, 1, 1, 1,
0.689537, -0.3009383, 2.947964, 1, 1, 1, 1, 1,
0.6902822, -0.1362521, 3.055794, 1, 1, 1, 1, 1,
0.6997567, -2.164549, 2.921147, 1, 1, 1, 1, 1,
0.6998854, 0.9317068, -1.195681, 1, 1, 1, 1, 1,
0.7019565, 0.03091638, 2.752786, 0, 0, 1, 1, 1,
0.7059081, 1.465027, 0.2698696, 1, 0, 0, 1, 1,
0.7059794, -0.2800341, 3.246995, 1, 0, 0, 1, 1,
0.7067026, -1.225347, 3.31707, 1, 0, 0, 1, 1,
0.7085004, -0.859161, 1.908169, 1, 0, 0, 1, 1,
0.7160624, -0.1988351, 1.044343, 1, 0, 0, 1, 1,
0.7188991, -0.0136235, 0.3898449, 0, 0, 0, 1, 1,
0.7195608, -2.218013, 3.298416, 0, 0, 0, 1, 1,
0.7268278, 0.5357465, 0.2219989, 0, 0, 0, 1, 1,
0.7323089, -1.817084, 1.459428, 0, 0, 0, 1, 1,
0.7324418, 1.184853, 1.71965, 0, 0, 0, 1, 1,
0.7339411, -0.6977012, 1.853747, 0, 0, 0, 1, 1,
0.7340183, 1.805296, -0.3300278, 0, 0, 0, 1, 1,
0.7347362, 1.297781, 0.4722311, 1, 1, 1, 1, 1,
0.7421432, -1.691074, 1.925255, 1, 1, 1, 1, 1,
0.7427787, 0.8521006, -0.2593213, 1, 1, 1, 1, 1,
0.7438211, -1.49196, 3.172378, 1, 1, 1, 1, 1,
0.7483715, -0.08717135, 1.543801, 1, 1, 1, 1, 1,
0.7542983, 1.150832, 0.8185918, 1, 1, 1, 1, 1,
0.756103, -1.696271, 3.417439, 1, 1, 1, 1, 1,
0.7574736, -0.518783, 2.360971, 1, 1, 1, 1, 1,
0.7590749, -0.8931772, 1.875781, 1, 1, 1, 1, 1,
0.7607017, 0.199337, 0.8595405, 1, 1, 1, 1, 1,
0.764453, -0.6880339, 3.881633, 1, 1, 1, 1, 1,
0.7650285, -0.6373016, 2.10156, 1, 1, 1, 1, 1,
0.7678447, -0.2310239, 1.501969, 1, 1, 1, 1, 1,
0.7775276, -1.927087, 1.669282, 1, 1, 1, 1, 1,
0.7811544, 1.2283, 1.966766, 1, 1, 1, 1, 1,
0.7865736, 0.6106918, 0.5946246, 0, 0, 1, 1, 1,
0.7914729, -0.2495509, 0.5948759, 1, 0, 0, 1, 1,
0.7935929, 1.699596, 0.836883, 1, 0, 0, 1, 1,
0.7971001, 0.6953729, -0.09448963, 1, 0, 0, 1, 1,
0.801958, 1.047588, 1.29688, 1, 0, 0, 1, 1,
0.8059088, -0.09904046, 2.134726, 1, 0, 0, 1, 1,
0.8093733, -0.8536124, 2.698713, 0, 0, 0, 1, 1,
0.809596, -0.134603, 1.174368, 0, 0, 0, 1, 1,
0.8146344, 0.4861868, 0.5441866, 0, 0, 0, 1, 1,
0.8149219, -0.8621296, 2.59025, 0, 0, 0, 1, 1,
0.8273492, 0.2648872, 1.611199, 0, 0, 0, 1, 1,
0.8289384, 0.5669884, 1.8901, 0, 0, 0, 1, 1,
0.8292544, -0.7587973, 1.876125, 0, 0, 0, 1, 1,
0.8321992, -0.8748852, 3.011158, 1, 1, 1, 1, 1,
0.8333462, 2.735289, 0.2558172, 1, 1, 1, 1, 1,
0.8361686, -0.344363, 3.516886, 1, 1, 1, 1, 1,
0.8371766, 2.277796, 1.03897, 1, 1, 1, 1, 1,
0.8421608, -0.9787827, 2.057919, 1, 1, 1, 1, 1,
0.8605734, -0.1866372, 1.402342, 1, 1, 1, 1, 1,
0.8651628, 0.5157832, -0.1337415, 1, 1, 1, 1, 1,
0.8728262, -0.2411514, 3.289736, 1, 1, 1, 1, 1,
0.8728986, 2.300275, -0.8907442, 1, 1, 1, 1, 1,
0.8733048, 0.3633204, 0.7719345, 1, 1, 1, 1, 1,
0.8748326, -0.3691494, 3.890245, 1, 1, 1, 1, 1,
0.8803171, -0.1448651, 2.021554, 1, 1, 1, 1, 1,
0.8831704, 1.984767, 0.5786758, 1, 1, 1, 1, 1,
0.8854912, -1.161532, 1.212066, 1, 1, 1, 1, 1,
0.8869324, -2.205943, 4.020116, 1, 1, 1, 1, 1,
0.8930783, 1.716582, 0.3418705, 0, 0, 1, 1, 1,
0.8970755, -1.000599, 3.399522, 1, 0, 0, 1, 1,
0.9009188, 1.234587, 0.1995271, 1, 0, 0, 1, 1,
0.9041942, -2.139511, 3.602351, 1, 0, 0, 1, 1,
0.9208971, -1.637997, 2.074799, 1, 0, 0, 1, 1,
0.9244689, 1.536959, -0.6643423, 1, 0, 0, 1, 1,
0.9246893, -0.3732309, 1.974857, 0, 0, 0, 1, 1,
0.9288322, 1.322899, 1.474395, 0, 0, 0, 1, 1,
0.9350774, -0.2209923, 2.477925, 0, 0, 0, 1, 1,
0.9448972, 1.323936, 0.05966898, 0, 0, 0, 1, 1,
0.948871, 0.7984438, 0.2013923, 0, 0, 0, 1, 1,
0.9530081, 0.5050334, 2.381583, 0, 0, 0, 1, 1,
0.953452, 3.310896, 0.1630288, 0, 0, 0, 1, 1,
0.9596896, -0.5915215, 2.283774, 1, 1, 1, 1, 1,
0.967334, 0.9426268, 0.2870176, 1, 1, 1, 1, 1,
0.9733448, 0.5224751, 1.229355, 1, 1, 1, 1, 1,
0.9764264, 0.04729976, 1.498607, 1, 1, 1, 1, 1,
0.9806431, 0.7102333, 0.9947461, 1, 1, 1, 1, 1,
0.9825706, 1.04293, 0.570851, 1, 1, 1, 1, 1,
0.9846507, 1.008923, 0.06889703, 1, 1, 1, 1, 1,
0.9905012, 2.276887, -0.0839714, 1, 1, 1, 1, 1,
1.003879, -1.712902, 3.653511, 1, 1, 1, 1, 1,
1.01443, -0.3416792, 1.722735, 1, 1, 1, 1, 1,
1.021483, -0.2610975, 2.211065, 1, 1, 1, 1, 1,
1.021684, -0.270394, 2.189391, 1, 1, 1, 1, 1,
1.023792, 1.688782, 0.7759245, 1, 1, 1, 1, 1,
1.024301, -1.0823, 1.918876, 1, 1, 1, 1, 1,
1.024874, 0.9336632, 0.1251399, 1, 1, 1, 1, 1,
1.026618, 0.4574169, 0.9295528, 0, 0, 1, 1, 1,
1.027662, -1.23805, 2.302662, 1, 0, 0, 1, 1,
1.027996, 0.1394645, 0.1615023, 1, 0, 0, 1, 1,
1.028076, -1.97956, 0.583433, 1, 0, 0, 1, 1,
1.032331, 0.2134022, 2.657539, 1, 0, 0, 1, 1,
1.038481, 1.157403, 1.393021, 1, 0, 0, 1, 1,
1.04653, -1.402627, 1.532271, 0, 0, 0, 1, 1,
1.046938, 0.2381384, 1.274375, 0, 0, 0, 1, 1,
1.050875, -0.5116487, 3.257911, 0, 0, 0, 1, 1,
1.056552, -0.03149558, 2.369636, 0, 0, 0, 1, 1,
1.064708, 0.8181287, 1.516019, 0, 0, 0, 1, 1,
1.069612, -1.372208, 2.621282, 0, 0, 0, 1, 1,
1.070591, -0.6557949, 1.303473, 0, 0, 0, 1, 1,
1.07152, -1.741361, 2.581617, 1, 1, 1, 1, 1,
1.084911, 0.02409538, 1.758816, 1, 1, 1, 1, 1,
1.085627, -1.328216, 1.52963, 1, 1, 1, 1, 1,
1.089086, -0.4578518, 2.074697, 1, 1, 1, 1, 1,
1.089118, 0.446962, 1.436387, 1, 1, 1, 1, 1,
1.090575, -1.51295, 2.320185, 1, 1, 1, 1, 1,
1.092481, 1.016112, 2.485838, 1, 1, 1, 1, 1,
1.098698, -0.09346436, 1.74993, 1, 1, 1, 1, 1,
1.10051, -0.5761665, 1.477977, 1, 1, 1, 1, 1,
1.106914, 0.02678079, 2.165764, 1, 1, 1, 1, 1,
1.110469, 0.9772239, -0.0456637, 1, 1, 1, 1, 1,
1.116615, -1.780374, 4.830968, 1, 1, 1, 1, 1,
1.124592, -0.905494, 4.013447, 1, 1, 1, 1, 1,
1.126186, -0.08195347, 1.724852, 1, 1, 1, 1, 1,
1.129046, -0.4996709, 2.192569, 1, 1, 1, 1, 1,
1.138159, 1.199524, -0.1078733, 0, 0, 1, 1, 1,
1.147293, 0.1407081, 1.029318, 1, 0, 0, 1, 1,
1.147745, -2.129855, 4.003232, 1, 0, 0, 1, 1,
1.149583, -0.1602091, 1.483851, 1, 0, 0, 1, 1,
1.162567, 0.7186707, 0.9690399, 1, 0, 0, 1, 1,
1.172812, 1.433733, 1.439412, 1, 0, 0, 1, 1,
1.188786, -1.191405, 2.733585, 0, 0, 0, 1, 1,
1.189408, -1.300915, 2.711424, 0, 0, 0, 1, 1,
1.214853, -1.239924, 3.72396, 0, 0, 0, 1, 1,
1.218652, 0.2384046, 1.537549, 0, 0, 0, 1, 1,
1.227735, 0.03900287, 1.481847, 0, 0, 0, 1, 1,
1.228819, 0.4109984, 0.4930562, 0, 0, 0, 1, 1,
1.235047, -0.6780398, 4.318897, 0, 0, 0, 1, 1,
1.236565, 0.7933935, 0.3542341, 1, 1, 1, 1, 1,
1.254872, -0.5280142, 2.072241, 1, 1, 1, 1, 1,
1.260656, 0.02100841, 0.6982741, 1, 1, 1, 1, 1,
1.263265, -0.06221079, 1.782778, 1, 1, 1, 1, 1,
1.271544, -0.3635695, 2.004249, 1, 1, 1, 1, 1,
1.283552, -0.190932, 2.912896, 1, 1, 1, 1, 1,
1.285296, 0.2699943, 0.9695753, 1, 1, 1, 1, 1,
1.289247, 0.8067526, 1.994236, 1, 1, 1, 1, 1,
1.304122, -0.3093701, 1.724752, 1, 1, 1, 1, 1,
1.320562, -0.3798873, -0.5254886, 1, 1, 1, 1, 1,
1.32171, -2.546361, 0.8949849, 1, 1, 1, 1, 1,
1.325382, 1.387038, 1.328018, 1, 1, 1, 1, 1,
1.342295, 1.705563, 1.536444, 1, 1, 1, 1, 1,
1.346507, 1.353731, 0.3819519, 1, 1, 1, 1, 1,
1.354371, 0.1139246, 2.520689, 1, 1, 1, 1, 1,
1.360798, 0.8521331, 2.106112, 0, 0, 1, 1, 1,
1.361598, -0.1534399, 1.193907, 1, 0, 0, 1, 1,
1.370876, 0.7494164, -0.43618, 1, 0, 0, 1, 1,
1.383407, 0.7539791, 0.8206266, 1, 0, 0, 1, 1,
1.392192, -1.056056, 0.6322484, 1, 0, 0, 1, 1,
1.398017, -1.976141, 2.06386, 1, 0, 0, 1, 1,
1.413973, -0.6326423, 2.513345, 0, 0, 0, 1, 1,
1.42201, -0.794302, 1.826851, 0, 0, 0, 1, 1,
1.42634, 0.01460047, 2.410164, 0, 0, 0, 1, 1,
1.432765, 0.173575, 2.129683, 0, 0, 0, 1, 1,
1.435577, 0.8185151, 1.567702, 0, 0, 0, 1, 1,
1.442153, -0.9468165, 3.310974, 0, 0, 0, 1, 1,
1.446905, -0.5158408, 2.690253, 0, 0, 0, 1, 1,
1.48279, -0.3494502, 0.6986655, 1, 1, 1, 1, 1,
1.492627, 1.827483, 0.4034451, 1, 1, 1, 1, 1,
1.49502, 0.1287086, 0.9971688, 1, 1, 1, 1, 1,
1.50299, 0.5133464, 1.477717, 1, 1, 1, 1, 1,
1.515643, 0.8155854, 0.812043, 1, 1, 1, 1, 1,
1.516379, 0.5475268, 1.708969, 1, 1, 1, 1, 1,
1.521933, -0.1628162, 1.453349, 1, 1, 1, 1, 1,
1.553351, 0.1769011, 0.09631871, 1, 1, 1, 1, 1,
1.583955, 0.555707, 1.721906, 1, 1, 1, 1, 1,
1.60228, -0.9788738, 2.496186, 1, 1, 1, 1, 1,
1.603447, 1.047027, -0.07574572, 1, 1, 1, 1, 1,
1.61604, 0.1836089, 3.16909, 1, 1, 1, 1, 1,
1.641622, 0.5831956, -0.1481245, 1, 1, 1, 1, 1,
1.643317, -1.508612, 2.040491, 1, 1, 1, 1, 1,
1.651651, -2.007209, 2.814296, 1, 1, 1, 1, 1,
1.655453, 0.6844255, 2.343411, 0, 0, 1, 1, 1,
1.656249, -0.2855873, 0.0005707865, 1, 0, 0, 1, 1,
1.658725, 0.173204, -0.2127286, 1, 0, 0, 1, 1,
1.658938, 1.273494, -0.1773936, 1, 0, 0, 1, 1,
1.67034, 0.761706, 2.476277, 1, 0, 0, 1, 1,
1.671416, 0.4338094, 1.246995, 1, 0, 0, 1, 1,
1.68011, 1.615492, 1.010406, 0, 0, 0, 1, 1,
1.697713, 1.731283, 1.770745, 0, 0, 0, 1, 1,
1.741226, 1.311188, 2.867514, 0, 0, 0, 1, 1,
1.752617, -1.120134, 2.017368, 0, 0, 0, 1, 1,
1.79581, -0.556231, 1.825021, 0, 0, 0, 1, 1,
1.79955, 0.702836, 1.635459, 0, 0, 0, 1, 1,
1.800132, -0.4992947, 1.019373, 0, 0, 0, 1, 1,
1.804757, -1.722029, 2.877197, 1, 1, 1, 1, 1,
1.809518, -0.2828362, 1.228919, 1, 1, 1, 1, 1,
1.835649, -0.983447, 3.747535, 1, 1, 1, 1, 1,
1.840541, -0.6831602, 3.259973, 1, 1, 1, 1, 1,
1.84167, -0.2279555, 1.543789, 1, 1, 1, 1, 1,
1.843933, -2.070799, 1.39078, 1, 1, 1, 1, 1,
1.870571, 1.405799, 1.541188, 1, 1, 1, 1, 1,
1.887512, 1.234833, 2.672326, 1, 1, 1, 1, 1,
1.902274, -0.1305062, 0.4673003, 1, 1, 1, 1, 1,
1.903179, -0.4587996, 1.801678, 1, 1, 1, 1, 1,
1.913874, -0.246648, 3.18452, 1, 1, 1, 1, 1,
1.933954, 1.799331, 1.189014, 1, 1, 1, 1, 1,
1.95882, -1.03628, 4.17759, 1, 1, 1, 1, 1,
1.97221, -1.408169, 1.891464, 1, 1, 1, 1, 1,
1.982872, -0.2260105, 0.9911652, 1, 1, 1, 1, 1,
2.019081, -0.9259047, 3.0048, 0, 0, 1, 1, 1,
2.051056, 0.9607539, 1.469794, 1, 0, 0, 1, 1,
2.072082, -0.2163805, 2.744862, 1, 0, 0, 1, 1,
2.089503, 0.2912056, 3.527748, 1, 0, 0, 1, 1,
2.132702, 2.46551, 1.019325, 1, 0, 0, 1, 1,
2.133249, -0.6975562, 3.138996, 1, 0, 0, 1, 1,
2.165858, 0.4588343, -0.2358267, 0, 0, 0, 1, 1,
2.194552, 0.1306303, -0.05963723, 0, 0, 0, 1, 1,
2.202485, 0.3268793, 1.887949, 0, 0, 0, 1, 1,
2.229137, 1.301955, -0.263121, 0, 0, 0, 1, 1,
2.24424, -0.5318149, 1.219846, 0, 0, 0, 1, 1,
2.246253, -0.2433787, 2.412276, 0, 0, 0, 1, 1,
2.279459, 0.8444104, -0.0505898, 0, 0, 0, 1, 1,
2.2941, 2.172786, 0.6953387, 1, 1, 1, 1, 1,
2.396755, 2.449481, 1.711278, 1, 1, 1, 1, 1,
2.422695, -0.6903334, 2.451627, 1, 1, 1, 1, 1,
2.424073, -0.8639151, 1.552995, 1, 1, 1, 1, 1,
2.428659, 1.007254, 0.07167484, 1, 1, 1, 1, 1,
2.653937, 0.5895808, 1.429877, 1, 1, 1, 1, 1,
3.069705, -1.377238, 0.973523, 1, 1, 1, 1, 1
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
var radius = 9.587399;
var distance = 33.67533;
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
mvMatrix.translate( -0.07713664, 0.2416306, -0.188201 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.67533);
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
