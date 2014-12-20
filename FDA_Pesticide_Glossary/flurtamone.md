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
-2.716843, 1.958279, -0.3828719, 1, 0, 0, 1,
-2.68614, 1.821733, 0.07916851, 1, 0.007843138, 0, 1,
-2.559167, 0.781893, -0.8148854, 1, 0.01176471, 0, 1,
-2.519797, 0.2931371, -2.464777, 1, 0.01960784, 0, 1,
-2.482256, -0.2118731, -0.6938193, 1, 0.02352941, 0, 1,
-2.380556, 0.3667782, -1.051041, 1, 0.03137255, 0, 1,
-2.317092, -0.1977205, -2.384219, 1, 0.03529412, 0, 1,
-2.314865, 1.574669, -1.18162, 1, 0.04313726, 0, 1,
-2.294289, -0.4144638, -0.91795, 1, 0.04705882, 0, 1,
-2.213964, -0.5941448, -2.38503, 1, 0.05490196, 0, 1,
-2.157248, -1.021691, -0.5523598, 1, 0.05882353, 0, 1,
-2.152072, 0.1330997, -0.8408885, 1, 0.06666667, 0, 1,
-2.145147, -1.278764, -2.294862, 1, 0.07058824, 0, 1,
-2.133326, -1.236132, -1.268951, 1, 0.07843138, 0, 1,
-2.114974, -0.4866905, -0.7413476, 1, 0.08235294, 0, 1,
-2.091392, -1.19889, -3.141297, 1, 0.09019608, 0, 1,
-2.091267, -0.5690907, -0.3274375, 1, 0.09411765, 0, 1,
-2.083842, -0.9885162, -1.712036, 1, 0.1019608, 0, 1,
-2.065727, -1.42015, -3.019507, 1, 0.1098039, 0, 1,
-2.039931, -0.3243806, -0.4459878, 1, 0.1137255, 0, 1,
-2.021737, -1.127125, -1.233581, 1, 0.1215686, 0, 1,
-2.017437, -0.6482457, -1.44966, 1, 0.1254902, 0, 1,
-2.013217, -0.460039, -2.876324, 1, 0.1333333, 0, 1,
-1.987851, -1.083608, -3.756083, 1, 0.1372549, 0, 1,
-1.933522, -0.1889203, -2.350656, 1, 0.145098, 0, 1,
-1.922991, 1.090772, -0.1357048, 1, 0.1490196, 0, 1,
-1.87762, -0.9636896, -1.265443, 1, 0.1568628, 0, 1,
-1.859482, -0.3996657, -0.4944365, 1, 0.1607843, 0, 1,
-1.848142, -0.2135404, -1.61052, 1, 0.1686275, 0, 1,
-1.83008, -1.662647, -2.306284, 1, 0.172549, 0, 1,
-1.827149, 1.284476, -1.580709, 1, 0.1803922, 0, 1,
-1.805225, -0.8460249, -1.085353, 1, 0.1843137, 0, 1,
-1.802428, 2.062078, -0.8227538, 1, 0.1921569, 0, 1,
-1.794279, -0.5282353, -2.473489, 1, 0.1960784, 0, 1,
-1.792453, -0.4555201, -1.103014, 1, 0.2039216, 0, 1,
-1.782336, -0.8427558, -2.061628, 1, 0.2117647, 0, 1,
-1.76608, -1.53339, -1.546067, 1, 0.2156863, 0, 1,
-1.727721, 0.05897469, -1.663187, 1, 0.2235294, 0, 1,
-1.722448, 1.173925, -0.09159876, 1, 0.227451, 0, 1,
-1.718961, -1.054902, -0.7430539, 1, 0.2352941, 0, 1,
-1.706185, 0.1882304, -1.003555, 1, 0.2392157, 0, 1,
-1.704907, -1.274415, -2.70577, 1, 0.2470588, 0, 1,
-1.697907, 1.138253, -0.8266775, 1, 0.2509804, 0, 1,
-1.696708, -0.2956353, -2.334936, 1, 0.2588235, 0, 1,
-1.680351, -0.1813565, -1.213337, 1, 0.2627451, 0, 1,
-1.679702, -0.5044324, -2.665536, 1, 0.2705882, 0, 1,
-1.657375, -1.166025, -0.9703805, 1, 0.2745098, 0, 1,
-1.654844, -1.163597, -2.960576, 1, 0.282353, 0, 1,
-1.653808, -0.3347435, -1.464984, 1, 0.2862745, 0, 1,
-1.642268, 0.5631915, -1.609465, 1, 0.2941177, 0, 1,
-1.638681, -0.7824872, -1.556632, 1, 0.3019608, 0, 1,
-1.636565, -1.101686, -1.142166, 1, 0.3058824, 0, 1,
-1.636412, 1.714433, -0.9379631, 1, 0.3137255, 0, 1,
-1.620724, -1.051594, -0.5299281, 1, 0.3176471, 0, 1,
-1.618363, -2.023504, -0.1853223, 1, 0.3254902, 0, 1,
-1.589323, -0.1066665, -2.473827, 1, 0.3294118, 0, 1,
-1.576632, -0.7589383, -3.393978, 1, 0.3372549, 0, 1,
-1.571069, -1.005917, -1.777571, 1, 0.3411765, 0, 1,
-1.570179, 0.2992958, -0.890121, 1, 0.3490196, 0, 1,
-1.563375, 0.4885587, -1.344591, 1, 0.3529412, 0, 1,
-1.549326, -1.231547, -1.910847, 1, 0.3607843, 0, 1,
-1.54549, 0.2275676, -4.229837, 1, 0.3647059, 0, 1,
-1.543343, -1.62863, -1.96013, 1, 0.372549, 0, 1,
-1.53906, -2.284717, -0.6690446, 1, 0.3764706, 0, 1,
-1.520659, -0.8045783, -1.608897, 1, 0.3843137, 0, 1,
-1.516644, 1.345342, -1.774652, 1, 0.3882353, 0, 1,
-1.506207, 0.01529785, -1.703961, 1, 0.3960784, 0, 1,
-1.503305, -0.9931858, -3.521154, 1, 0.4039216, 0, 1,
-1.490719, -0.4000013, -2.979005, 1, 0.4078431, 0, 1,
-1.481328, 0.4061582, -0.692624, 1, 0.4156863, 0, 1,
-1.478662, -2.09513, -2.74894, 1, 0.4196078, 0, 1,
-1.471817, -1.154454, -1.525528, 1, 0.427451, 0, 1,
-1.470397, -0.07705504, -2.453012, 1, 0.4313726, 0, 1,
-1.46927, 0.4338484, -2.390877, 1, 0.4392157, 0, 1,
-1.445782, -1.586116, -1.384119, 1, 0.4431373, 0, 1,
-1.425148, 0.3661843, -1.910839, 1, 0.4509804, 0, 1,
-1.416994, -0.1523106, -1.405044, 1, 0.454902, 0, 1,
-1.415535, 1.069552, 0.4381342, 1, 0.4627451, 0, 1,
-1.393428, -1.036909, -4.168077, 1, 0.4666667, 0, 1,
-1.387562, 1.998176, 0.0960294, 1, 0.4745098, 0, 1,
-1.386094, 1.080089, -2.408908, 1, 0.4784314, 0, 1,
-1.385138, 1.541998, -1.883217, 1, 0.4862745, 0, 1,
-1.380317, 1.369246, -0.829461, 1, 0.4901961, 0, 1,
-1.377171, -1.296971, -3.044905, 1, 0.4980392, 0, 1,
-1.374476, -0.2333332, -2.0865, 1, 0.5058824, 0, 1,
-1.372788, 0.773325, -1.625901, 1, 0.509804, 0, 1,
-1.371103, -0.8884099, -1.029192, 1, 0.5176471, 0, 1,
-1.362755, -1.279911, -1.570799, 1, 0.5215687, 0, 1,
-1.360706, 1.329977, 0.3738612, 1, 0.5294118, 0, 1,
-1.36009, 0.8097776, -0.813554, 1, 0.5333334, 0, 1,
-1.357283, -0.3258185, -1.465291, 1, 0.5411765, 0, 1,
-1.352, -0.4454707, -3.232376, 1, 0.5450981, 0, 1,
-1.351238, -0.5497537, -1.846887, 1, 0.5529412, 0, 1,
-1.349045, -1.982567, -2.235617, 1, 0.5568628, 0, 1,
-1.344559, -0.2618224, -2.701743, 1, 0.5647059, 0, 1,
-1.34434, -1.402943, -1.400463, 1, 0.5686275, 0, 1,
-1.3424, -0.09919733, -2.549144, 1, 0.5764706, 0, 1,
-1.319836, -0.3390865, -1.694147, 1, 0.5803922, 0, 1,
-1.318424, -0.3318586, -2.076084, 1, 0.5882353, 0, 1,
-1.31342, 2.03882, 0.3376395, 1, 0.5921569, 0, 1,
-1.303135, 0.2237094, -1.985364, 1, 0.6, 0, 1,
-1.302931, 0.3044604, 0.09980229, 1, 0.6078432, 0, 1,
-1.290484, -0.5151854, -1.585329, 1, 0.6117647, 0, 1,
-1.276671, 0.9723566, -0.8401273, 1, 0.6196079, 0, 1,
-1.263184, -0.183543, -3.534781, 1, 0.6235294, 0, 1,
-1.262253, -1.081719, -1.793972, 1, 0.6313726, 0, 1,
-1.253293, -0.5256602, -1.963661, 1, 0.6352941, 0, 1,
-1.245194, -1.295423, -1.67546, 1, 0.6431373, 0, 1,
-1.242191, 0.0006855779, -1.716429, 1, 0.6470588, 0, 1,
-1.241451, 0.03103659, -0.3686703, 1, 0.654902, 0, 1,
-1.237043, -0.1242237, -2.215702, 1, 0.6588235, 0, 1,
-1.228667, 0.9027626, 1.024357, 1, 0.6666667, 0, 1,
-1.223752, -0.1548695, -2.466071, 1, 0.6705883, 0, 1,
-1.217353, -0.2409216, -1.939503, 1, 0.6784314, 0, 1,
-1.196502, -1.599817, -2.795313, 1, 0.682353, 0, 1,
-1.194842, 0.7734901, -0.5762438, 1, 0.6901961, 0, 1,
-1.193848, -1.343701, -2.106243, 1, 0.6941177, 0, 1,
-1.192987, 0.6994392, 0.9392583, 1, 0.7019608, 0, 1,
-1.190214, -0.07799955, -4.029328, 1, 0.7098039, 0, 1,
-1.148446, -1.105345, -2.642641, 1, 0.7137255, 0, 1,
-1.13848, 0.1349317, -0.03382394, 1, 0.7215686, 0, 1,
-1.136565, -0.07342352, 0.01397953, 1, 0.7254902, 0, 1,
-1.134368, 1.024463, 0.4802695, 1, 0.7333333, 0, 1,
-1.128956, 0.4689699, -1.220432, 1, 0.7372549, 0, 1,
-1.114314, 0.3516202, -1.57588, 1, 0.7450981, 0, 1,
-1.099963, -1.011828, -0.4634139, 1, 0.7490196, 0, 1,
-1.088596, 0.8263538, -1.139758, 1, 0.7568628, 0, 1,
-1.07905, -2.089366, -1.575035, 1, 0.7607843, 0, 1,
-1.069396, 0.6583657, -2.683686, 1, 0.7686275, 0, 1,
-1.065307, 1.487272, -1.179646, 1, 0.772549, 0, 1,
-1.063515, -0.8099277, -2.241642, 1, 0.7803922, 0, 1,
-1.055009, -1.511905, -1.066817, 1, 0.7843137, 0, 1,
-1.04202, 0.7588298, -1.755598, 1, 0.7921569, 0, 1,
-1.038114, 0.4031521, 0.2290767, 1, 0.7960784, 0, 1,
-1.035513, -0.9162546, -2.408333, 1, 0.8039216, 0, 1,
-1.032545, 0.7698811, -0.4155073, 1, 0.8117647, 0, 1,
-1.031836, -1.407687, -2.318269, 1, 0.8156863, 0, 1,
-1.023989, -1.275823, -0.3633943, 1, 0.8235294, 0, 1,
-1.018199, -0.5122047, -3.978608, 1, 0.827451, 0, 1,
-1.016415, 0.9641123, -3.211953, 1, 0.8352941, 0, 1,
-1.015633, 0.3044087, -1.683484, 1, 0.8392157, 0, 1,
-1.014237, 0.9871193, 0.8481365, 1, 0.8470588, 0, 1,
-1.01423, 0.7392775, 0.1567491, 1, 0.8509804, 0, 1,
-0.9860985, 0.4513033, -1.311904, 1, 0.8588235, 0, 1,
-0.9842017, 1.424042, -0.2097385, 1, 0.8627451, 0, 1,
-0.9752534, -0.8125142, -2.488013, 1, 0.8705882, 0, 1,
-0.9729874, 1.53023, 0.8179202, 1, 0.8745098, 0, 1,
-0.9704145, 0.9926642, -2.184073, 1, 0.8823529, 0, 1,
-0.9692442, 0.8588639, 0.2282089, 1, 0.8862745, 0, 1,
-0.9654822, 0.9673022, -1.010972, 1, 0.8941177, 0, 1,
-0.9584141, -1.377199, -2.728442, 1, 0.8980392, 0, 1,
-0.9577956, -0.5073355, -1.60087, 1, 0.9058824, 0, 1,
-0.9573101, 0.5112386, -2.630417, 1, 0.9137255, 0, 1,
-0.9528927, -1.347972, -3.487618, 1, 0.9176471, 0, 1,
-0.9451457, -0.6280658, -3.272212, 1, 0.9254902, 0, 1,
-0.9405941, 0.6266981, -2.416985, 1, 0.9294118, 0, 1,
-0.9340969, 0.629434, -0.7823731, 1, 0.9372549, 0, 1,
-0.9307439, 0.6982352, -0.5874043, 1, 0.9411765, 0, 1,
-0.928474, 0.6488383, -2.42837, 1, 0.9490196, 0, 1,
-0.9282104, -1.310322, -2.874834, 1, 0.9529412, 0, 1,
-0.9278494, -0.4850973, -2.500554, 1, 0.9607843, 0, 1,
-0.9222056, -0.7829051, -2.661588, 1, 0.9647059, 0, 1,
-0.9185675, 0.1148745, -3.735819, 1, 0.972549, 0, 1,
-0.9182427, -0.1667429, -2.233114, 1, 0.9764706, 0, 1,
-0.9173116, 2.59908, -0.8044037, 1, 0.9843137, 0, 1,
-0.905458, 0.7117254, -0.04112999, 1, 0.9882353, 0, 1,
-0.8949352, 0.6428475, -0.234178, 1, 0.9960784, 0, 1,
-0.8833069, -1.459007, -1.909681, 0.9960784, 1, 0, 1,
-0.8828198, -0.1526202, -2.940111, 0.9921569, 1, 0, 1,
-0.8816242, 0.7425256, -2.275336, 0.9843137, 1, 0, 1,
-0.87808, -0.5742435, -1.285757, 0.9803922, 1, 0, 1,
-0.8768803, -0.5729861, -3.419634, 0.972549, 1, 0, 1,
-0.8720801, 0.725603, 0.395263, 0.9686275, 1, 0, 1,
-0.8594049, 1.264624, -1.543861, 0.9607843, 1, 0, 1,
-0.8594044, 0.8306446, 0.3090417, 0.9568627, 1, 0, 1,
-0.8552032, 0.7009522, -0.274739, 0.9490196, 1, 0, 1,
-0.8513365, 0.6905102, -0.7670754, 0.945098, 1, 0, 1,
-0.8458048, -1.296763, -0.850628, 0.9372549, 1, 0, 1,
-0.8427897, 0.3547701, 0.3702123, 0.9333333, 1, 0, 1,
-0.8393991, -1.521089, -2.70498, 0.9254902, 1, 0, 1,
-0.8377454, -0.2092898, -1.803544, 0.9215686, 1, 0, 1,
-0.837334, -1.170388, -2.071688, 0.9137255, 1, 0, 1,
-0.8367085, 1.015689, -0.9319528, 0.9098039, 1, 0, 1,
-0.8254777, 1.20709, -0.3172026, 0.9019608, 1, 0, 1,
-0.8252634, -0.5369852, -3.153746, 0.8941177, 1, 0, 1,
-0.8224233, 0.3282238, -0.5306556, 0.8901961, 1, 0, 1,
-0.820522, 0.7287518, -1.269409, 0.8823529, 1, 0, 1,
-0.8145847, 1.28148, -2.552086, 0.8784314, 1, 0, 1,
-0.8128389, 0.5597944, 0.5784778, 0.8705882, 1, 0, 1,
-0.811229, 0.3108675, -1.986492, 0.8666667, 1, 0, 1,
-0.8090053, -0.5846696, -1.831921, 0.8588235, 1, 0, 1,
-0.803601, -0.2462813, -0.9346766, 0.854902, 1, 0, 1,
-0.8005275, -1.059015, -1.581765, 0.8470588, 1, 0, 1,
-0.7907233, -0.3856949, -1.462248, 0.8431373, 1, 0, 1,
-0.7901627, -0.3599764, -2.018812, 0.8352941, 1, 0, 1,
-0.7893531, -0.08713667, -0.8993253, 0.8313726, 1, 0, 1,
-0.7857938, 0.645221, -0.6248094, 0.8235294, 1, 0, 1,
-0.78337, -0.4833003, -2.893221, 0.8196079, 1, 0, 1,
-0.7827903, -0.6101491, -2.852118, 0.8117647, 1, 0, 1,
-0.7796482, 0.4200794, -0.4740741, 0.8078431, 1, 0, 1,
-0.7771227, -0.1596127, -0.507623, 0.8, 1, 0, 1,
-0.7709892, 0.1507023, -2.456569, 0.7921569, 1, 0, 1,
-0.769397, 0.4074744, -0.1244808, 0.7882353, 1, 0, 1,
-0.7602108, -0.9786524, -2.88329, 0.7803922, 1, 0, 1,
-0.7578701, 0.6939381, -0.7692394, 0.7764706, 1, 0, 1,
-0.7560582, -0.8625019, -2.243283, 0.7686275, 1, 0, 1,
-0.7553185, -0.7682689, -1.434153, 0.7647059, 1, 0, 1,
-0.7537481, 1.681539, -0.5944673, 0.7568628, 1, 0, 1,
-0.7490411, 0.3285586, -1.414767, 0.7529412, 1, 0, 1,
-0.7417324, -0.1650698, -1.860372, 0.7450981, 1, 0, 1,
-0.7412214, -0.7450521, -3.190034, 0.7411765, 1, 0, 1,
-0.736701, -0.8464626, -1.129476, 0.7333333, 1, 0, 1,
-0.7366102, 1.328483, -0.6877756, 0.7294118, 1, 0, 1,
-0.7325159, -1.605209, -2.157699, 0.7215686, 1, 0, 1,
-0.7288728, -0.8680504, -4.187636, 0.7176471, 1, 0, 1,
-0.7261122, -1.827302, -2.782697, 0.7098039, 1, 0, 1,
-0.7251399, 0.5827526, -2.334415, 0.7058824, 1, 0, 1,
-0.7233929, -1.38765, -0.8566419, 0.6980392, 1, 0, 1,
-0.7201002, 0.4422749, -1.205403, 0.6901961, 1, 0, 1,
-0.718603, -0.7633185, -2.437157, 0.6862745, 1, 0, 1,
-0.7181661, -0.6865327, -1.963825, 0.6784314, 1, 0, 1,
-0.7157813, -1.028627, -2.703921, 0.6745098, 1, 0, 1,
-0.71368, 1.037142, 0.2341599, 0.6666667, 1, 0, 1,
-0.7132035, 0.2005526, 0.8134068, 0.6627451, 1, 0, 1,
-0.7061824, 0.7907705, -0.01616269, 0.654902, 1, 0, 1,
-0.7043376, 1.919057, -0.1005208, 0.6509804, 1, 0, 1,
-0.7036861, 0.5650687, 0.09192064, 0.6431373, 1, 0, 1,
-0.7023116, 1.54688, 1.970676, 0.6392157, 1, 0, 1,
-0.6968978, 1.295768, -0.6518577, 0.6313726, 1, 0, 1,
-0.6945842, 1.188719, 0.3183183, 0.627451, 1, 0, 1,
-0.6864454, 1.309102, -1.571232, 0.6196079, 1, 0, 1,
-0.6840634, -0.1364092, -2.317398, 0.6156863, 1, 0, 1,
-0.6833441, -1.137549, -2.374464, 0.6078432, 1, 0, 1,
-0.6758595, -0.6068333, -1.18005, 0.6039216, 1, 0, 1,
-0.667777, 0.5155894, 0.8067798, 0.5960785, 1, 0, 1,
-0.6655588, 0.8464641, 0.9580383, 0.5882353, 1, 0, 1,
-0.6625059, 1.394673, 0.3537512, 0.5843138, 1, 0, 1,
-0.65876, 0.184492, -1.332285, 0.5764706, 1, 0, 1,
-0.6509162, -0.3350905, -2.457163, 0.572549, 1, 0, 1,
-0.6473473, 1.064867, -0.7288749, 0.5647059, 1, 0, 1,
-0.6466218, -0.1954138, -0.8661122, 0.5607843, 1, 0, 1,
-0.6460579, -0.2855574, -2.302443, 0.5529412, 1, 0, 1,
-0.6444164, -0.5291938, -1.598035, 0.5490196, 1, 0, 1,
-0.6424793, 0.6051001, -2.221061, 0.5411765, 1, 0, 1,
-0.6403196, 0.4989691, -1.111893, 0.5372549, 1, 0, 1,
-0.6395559, 0.6985186, -2.028157, 0.5294118, 1, 0, 1,
-0.6376691, -0.4072071, -1.574034, 0.5254902, 1, 0, 1,
-0.6368836, 0.08628263, -3.272496, 0.5176471, 1, 0, 1,
-0.6289363, 0.4408926, -2.202399, 0.5137255, 1, 0, 1,
-0.6288241, -0.9760733, -2.114632, 0.5058824, 1, 0, 1,
-0.6241959, -0.9860194, -2.881451, 0.5019608, 1, 0, 1,
-0.6211988, 0.327452, 0.6730484, 0.4941176, 1, 0, 1,
-0.6206129, -2.087474, -4.204336, 0.4862745, 1, 0, 1,
-0.6199239, 1.323352, 0.3815932, 0.4823529, 1, 0, 1,
-0.6167907, -0.5357051, -2.635861, 0.4745098, 1, 0, 1,
-0.616387, 0.6567745, -1.190119, 0.4705882, 1, 0, 1,
-0.6117841, -1.908957, -2.616015, 0.4627451, 1, 0, 1,
-0.6098556, 0.3148765, 0.227728, 0.4588235, 1, 0, 1,
-0.6097338, 0.2564478, -2.526212, 0.4509804, 1, 0, 1,
-0.6060024, -0.8704501, -1.105135, 0.4470588, 1, 0, 1,
-0.6018929, 0.4754515, -0.1005437, 0.4392157, 1, 0, 1,
-0.5976932, 0.2769201, 0.8255554, 0.4352941, 1, 0, 1,
-0.5967463, 1.022435, 0.006168142, 0.427451, 1, 0, 1,
-0.5907508, 1.123256, -2.339628, 0.4235294, 1, 0, 1,
-0.5882713, -0.1570042, -1.801539, 0.4156863, 1, 0, 1,
-0.5853685, 0.7119406, -1.12963, 0.4117647, 1, 0, 1,
-0.5846784, -0.4931502, -2.882743, 0.4039216, 1, 0, 1,
-0.5834635, -1.390542, -2.070083, 0.3960784, 1, 0, 1,
-0.5799725, 0.8163363, -1.550204, 0.3921569, 1, 0, 1,
-0.5793732, 0.06779771, 0.4433468, 0.3843137, 1, 0, 1,
-0.569739, -0.3641682, -1.682276, 0.3803922, 1, 0, 1,
-0.5675749, 0.5650231, 0.2829627, 0.372549, 1, 0, 1,
-0.5673652, 0.7138609, -0.2118855, 0.3686275, 1, 0, 1,
-0.5665492, 0.9639726, -0.3674988, 0.3607843, 1, 0, 1,
-0.564178, -0.1649578, -0.3910155, 0.3568628, 1, 0, 1,
-0.5622781, 0.1554238, -2.243289, 0.3490196, 1, 0, 1,
-0.5611609, 1.187593, 0.6635644, 0.345098, 1, 0, 1,
-0.5603913, 0.4704599, -1.473332, 0.3372549, 1, 0, 1,
-0.5597534, 1.082532, -0.058724, 0.3333333, 1, 0, 1,
-0.552588, -1.497886, -3.325247, 0.3254902, 1, 0, 1,
-0.5518338, 0.2272399, -0.2931317, 0.3215686, 1, 0, 1,
-0.5496533, -0.4841801, -1.265166, 0.3137255, 1, 0, 1,
-0.5475789, -0.06336931, -0.9518014, 0.3098039, 1, 0, 1,
-0.5384185, -0.3436585, -3.224485, 0.3019608, 1, 0, 1,
-0.5331098, -1.727503, -3.173947, 0.2941177, 1, 0, 1,
-0.5328204, 0.02856224, -0.3464768, 0.2901961, 1, 0, 1,
-0.5320888, -0.412802, -2.720849, 0.282353, 1, 0, 1,
-0.5318413, 2.019987, -0.4090977, 0.2784314, 1, 0, 1,
-0.5306176, 0.583918, 0.5599442, 0.2705882, 1, 0, 1,
-0.5306041, 0.2737844, -1.369138, 0.2666667, 1, 0, 1,
-0.5296369, 1.194237, 0.9791732, 0.2588235, 1, 0, 1,
-0.529095, -1.190936, -3.928644, 0.254902, 1, 0, 1,
-0.5274696, 0.1563047, -0.6321287, 0.2470588, 1, 0, 1,
-0.5273697, 0.5403423, -1.887916, 0.2431373, 1, 0, 1,
-0.5262576, 0.5423428, -0.4370892, 0.2352941, 1, 0, 1,
-0.5261363, 0.514056, -1.862049, 0.2313726, 1, 0, 1,
-0.5252783, 2.090969, 0.132599, 0.2235294, 1, 0, 1,
-0.5242494, -0.09847417, -2.754462, 0.2196078, 1, 0, 1,
-0.5238662, 0.6570559, -1.022361, 0.2117647, 1, 0, 1,
-0.5226036, 1.439016, 0.651819, 0.2078431, 1, 0, 1,
-0.5225525, 1.166194, -0.1695707, 0.2, 1, 0, 1,
-0.5149785, -0.4519935, -2.904827, 0.1921569, 1, 0, 1,
-0.5129767, 0.9009264, -1.867682, 0.1882353, 1, 0, 1,
-0.5040966, -0.1007315, -0.3282131, 0.1803922, 1, 0, 1,
-0.5032439, -0.2512962, -1.386068, 0.1764706, 1, 0, 1,
-0.4980772, -0.7064688, -3.363991, 0.1686275, 1, 0, 1,
-0.4969075, -1.375975, -1.62169, 0.1647059, 1, 0, 1,
-0.4940385, -1.073786, -2.054419, 0.1568628, 1, 0, 1,
-0.4934062, -1.687295, -3.265931, 0.1529412, 1, 0, 1,
-0.4932496, -0.7384652, -0.9263141, 0.145098, 1, 0, 1,
-0.492033, 0.06312559, -2.272572, 0.1411765, 1, 0, 1,
-0.4894681, 0.6328903, -0.9354427, 0.1333333, 1, 0, 1,
-0.4865346, 0.2456615, -1.117247, 0.1294118, 1, 0, 1,
-0.4831105, -0.6971631, -2.398075, 0.1215686, 1, 0, 1,
-0.4820381, 0.1767743, -0.4752726, 0.1176471, 1, 0, 1,
-0.4783604, 1.018801, -1.829425, 0.1098039, 1, 0, 1,
-0.4734023, 1.997011, 0.1929954, 0.1058824, 1, 0, 1,
-0.4725545, 0.4688254, -0.2935548, 0.09803922, 1, 0, 1,
-0.468071, 1.293965, -1.840437, 0.09019608, 1, 0, 1,
-0.4664192, 0.09350307, -1.240662, 0.08627451, 1, 0, 1,
-0.4656815, -1.659079, -2.444674, 0.07843138, 1, 0, 1,
-0.4640465, -0.1179658, -3.032983, 0.07450981, 1, 0, 1,
-0.4591156, -0.5806513, -4.317826, 0.06666667, 1, 0, 1,
-0.4572602, -0.111014, -2.929416, 0.0627451, 1, 0, 1,
-0.4499483, -0.4176564, -0.4329284, 0.05490196, 1, 0, 1,
-0.4481866, 0.02863643, -1.342354, 0.05098039, 1, 0, 1,
-0.4477608, -0.005888743, -1.161364, 0.04313726, 1, 0, 1,
-0.4454249, -0.6452563, -3.651855, 0.03921569, 1, 0, 1,
-0.4393774, 1.563904, -2.499306, 0.03137255, 1, 0, 1,
-0.4387721, -1.320586, -4.256426, 0.02745098, 1, 0, 1,
-0.4345745, -1.994011, -4.537004, 0.01960784, 1, 0, 1,
-0.4339555, -1.060175, -3.314166, 0.01568628, 1, 0, 1,
-0.4329667, -1.545378, -2.218457, 0.007843138, 1, 0, 1,
-0.427726, 0.7511304, -1.051345, 0.003921569, 1, 0, 1,
-0.4276683, 0.1807156, -2.606181, 0, 1, 0.003921569, 1,
-0.4253832, 0.09644941, -1.272855, 0, 1, 0.01176471, 1,
-0.4206114, 0.303815, -1.809989, 0, 1, 0.01568628, 1,
-0.4195492, 1.307534, 0.4606999, 0, 1, 0.02352941, 1,
-0.4164548, 0.2174893, -1.653736, 0, 1, 0.02745098, 1,
-0.4148734, -0.02090363, -1.023823, 0, 1, 0.03529412, 1,
-0.4134915, 1.286916, 0.5611299, 0, 1, 0.03921569, 1,
-0.4092764, -0.5159153, -3.537763, 0, 1, 0.04705882, 1,
-0.4001633, -0.5222937, -2.412843, 0, 1, 0.05098039, 1,
-0.3977658, -0.08797663, -0.6507556, 0, 1, 0.05882353, 1,
-0.393537, 2.719686, 1.678344, 0, 1, 0.0627451, 1,
-0.3927867, -0.7364419, -2.961375, 0, 1, 0.07058824, 1,
-0.3905806, 1.445202, -0.0655254, 0, 1, 0.07450981, 1,
-0.3887651, -0.4105288, -1.790341, 0, 1, 0.08235294, 1,
-0.3874372, 0.0915696, -1.847725, 0, 1, 0.08627451, 1,
-0.3849552, 0.8160059, -1.300922, 0, 1, 0.09411765, 1,
-0.3808018, 0.4472371, -0.4826081, 0, 1, 0.1019608, 1,
-0.3784889, 0.2206028, -0.2098885, 0, 1, 0.1058824, 1,
-0.3783526, 0.756457, -0.8474191, 0, 1, 0.1137255, 1,
-0.3776687, -0.4423425, -1.204013, 0, 1, 0.1176471, 1,
-0.3746119, -0.4142512, -2.874176, 0, 1, 0.1254902, 1,
-0.3735668, -0.4555749, -1.844201, 0, 1, 0.1294118, 1,
-0.3726955, 0.8392822, -0.436941, 0, 1, 0.1372549, 1,
-0.3703805, -0.1570565, -3.20606, 0, 1, 0.1411765, 1,
-0.3671277, -0.140569, -0.9131651, 0, 1, 0.1490196, 1,
-0.3669747, 0.7168279, 0.497355, 0, 1, 0.1529412, 1,
-0.3637254, 0.006837233, 0.3110973, 0, 1, 0.1607843, 1,
-0.3609445, 0.6948572, -0.3847116, 0, 1, 0.1647059, 1,
-0.3603857, 0.59886, -2.058659, 0, 1, 0.172549, 1,
-0.3582844, -0.9220893, -4.549349, 0, 1, 0.1764706, 1,
-0.3547343, 1.072366, 0.06738277, 0, 1, 0.1843137, 1,
-0.3523671, 0.1969922, -1.659264, 0, 1, 0.1882353, 1,
-0.3521811, 2.144137, 1.394816, 0, 1, 0.1960784, 1,
-0.3507642, 0.9224034, -2.387961, 0, 1, 0.2039216, 1,
-0.3506103, 0.1479962, 0.4564815, 0, 1, 0.2078431, 1,
-0.3496308, -0.6096369, 0.01187026, 0, 1, 0.2156863, 1,
-0.3484872, 0.5622457, -1.822959, 0, 1, 0.2196078, 1,
-0.3482155, 1.791288, -0.3399223, 0, 1, 0.227451, 1,
-0.3460056, -1.486896, -2.779747, 0, 1, 0.2313726, 1,
-0.3440238, -0.2230636, -3.537479, 0, 1, 0.2392157, 1,
-0.3433636, 0.6706129, 0.4123645, 0, 1, 0.2431373, 1,
-0.3372071, 1.021618, -0.6559038, 0, 1, 0.2509804, 1,
-0.3335633, -0.8989603, -2.592896, 0, 1, 0.254902, 1,
-0.3304791, -2.576559, -4.352055, 0, 1, 0.2627451, 1,
-0.3292164, 1.286819, 0.9219036, 0, 1, 0.2666667, 1,
-0.3227947, 0.5554009, -1.436632, 0, 1, 0.2745098, 1,
-0.3227409, -1.093516, -3.360919, 0, 1, 0.2784314, 1,
-0.3116878, 0.3646999, -1.414984, 0, 1, 0.2862745, 1,
-0.3079633, 1.160163, -1.182993, 0, 1, 0.2901961, 1,
-0.3076587, -0.352923, -1.70566, 0, 1, 0.2980392, 1,
-0.3053952, -0.03263117, -3.763722, 0, 1, 0.3058824, 1,
-0.3039339, 0.08046366, -2.051151, 0, 1, 0.3098039, 1,
-0.3038486, -0.101185, -0.7696757, 0, 1, 0.3176471, 1,
-0.302751, 0.161885, -0.1191588, 0, 1, 0.3215686, 1,
-0.3022249, 0.5447506, -1.678792, 0, 1, 0.3294118, 1,
-0.2996715, 0.7097061, 1.467604, 0, 1, 0.3333333, 1,
-0.2988525, 0.1904702, -2.411171, 0, 1, 0.3411765, 1,
-0.2983033, -0.6841394, -2.510331, 0, 1, 0.345098, 1,
-0.2890239, -0.9685693, -3.051667, 0, 1, 0.3529412, 1,
-0.2829324, -0.5064874, -1.046142, 0, 1, 0.3568628, 1,
-0.2749964, -1.823103, -2.230739, 0, 1, 0.3647059, 1,
-0.2742737, -0.1594482, -0.648458, 0, 1, 0.3686275, 1,
-0.2733311, 0.08371045, -1.016267, 0, 1, 0.3764706, 1,
-0.2730072, 0.9004505, 0.5270641, 0, 1, 0.3803922, 1,
-0.2724039, -0.2502779, -1.575102, 0, 1, 0.3882353, 1,
-0.2706652, -0.9671811, -3.04404, 0, 1, 0.3921569, 1,
-0.2701374, 0.2029948, -0.007140044, 0, 1, 0.4, 1,
-0.2667534, -1.938116, -3.299049, 0, 1, 0.4078431, 1,
-0.2666429, 0.3157344, -1.046757, 0, 1, 0.4117647, 1,
-0.2644501, -0.9817009, -3.335265, 0, 1, 0.4196078, 1,
-0.2608961, -0.404534, -3.028552, 0, 1, 0.4235294, 1,
-0.2589366, 0.7256176, 1.623425, 0, 1, 0.4313726, 1,
-0.25627, -0.5625494, -4.997606, 0, 1, 0.4352941, 1,
-0.2538073, -0.3868891, -2.672879, 0, 1, 0.4431373, 1,
-0.2523995, 0.1749404, -0.3096416, 0, 1, 0.4470588, 1,
-0.2518533, -0.3730898, -1.503959, 0, 1, 0.454902, 1,
-0.2483022, 2.071379, 1.584208, 0, 1, 0.4588235, 1,
-0.2475258, 0.6781954, -0.119656, 0, 1, 0.4666667, 1,
-0.2459765, -1.363445, -4.787533, 0, 1, 0.4705882, 1,
-0.2456321, 2.919112, -0.3630928, 0, 1, 0.4784314, 1,
-0.2430171, 1.401288, 0.0288772, 0, 1, 0.4823529, 1,
-0.2429469, 0.8757959, -1.650741, 0, 1, 0.4901961, 1,
-0.2399237, 0.02473063, -0.9074606, 0, 1, 0.4941176, 1,
-0.2382306, -0.1662174, -2.856808, 0, 1, 0.5019608, 1,
-0.23665, 1.591618, -0.1489513, 0, 1, 0.509804, 1,
-0.233207, 0.3870798, -0.6609824, 0, 1, 0.5137255, 1,
-0.2308647, -1.591341, -2.995287, 0, 1, 0.5215687, 1,
-0.2275747, -0.6149001, -2.627829, 0, 1, 0.5254902, 1,
-0.2254248, -0.3599746, -5.019578, 0, 1, 0.5333334, 1,
-0.2210805, -0.1645446, -1.268185, 0, 1, 0.5372549, 1,
-0.2183936, 0.9236575, -0.02606403, 0, 1, 0.5450981, 1,
-0.2111349, 0.1962612, -1.931244, 0, 1, 0.5490196, 1,
-0.2066875, 0.8308559, 0.8116232, 0, 1, 0.5568628, 1,
-0.2010919, -0.5967053, -2.03886, 0, 1, 0.5607843, 1,
-0.2009514, 0.2286315, -1.158234, 0, 1, 0.5686275, 1,
-0.1923626, 0.5274103, -1.303344, 0, 1, 0.572549, 1,
-0.185014, -0.2505648, -3.452724, 0, 1, 0.5803922, 1,
-0.1837223, 1.926341, 0.9264626, 0, 1, 0.5843138, 1,
-0.1770651, -0.7584203, -2.652618, 0, 1, 0.5921569, 1,
-0.1749882, -1.07853, -3.240789, 0, 1, 0.5960785, 1,
-0.1732667, -0.9511165, -3.210728, 0, 1, 0.6039216, 1,
-0.1695554, -0.745443, -2.804686, 0, 1, 0.6117647, 1,
-0.1675688, -1.83685, -1.831218, 0, 1, 0.6156863, 1,
-0.1663499, 0.1677407, -1.91342, 0, 1, 0.6235294, 1,
-0.1649927, -0.3239339, -1.761546, 0, 1, 0.627451, 1,
-0.1641195, -0.2580329, -2.692459, 0, 1, 0.6352941, 1,
-0.1624994, 0.02182231, -2.716143, 0, 1, 0.6392157, 1,
-0.1613886, 0.464386, 1.19061, 0, 1, 0.6470588, 1,
-0.1596878, 0.4773855, 0.510648, 0, 1, 0.6509804, 1,
-0.159441, 0.0535434, -1.321381, 0, 1, 0.6588235, 1,
-0.1588294, -1.543282, -2.628127, 0, 1, 0.6627451, 1,
-0.1541015, -2.279137, -2.009694, 0, 1, 0.6705883, 1,
-0.1507066, -0.3792015, -2.287684, 0, 1, 0.6745098, 1,
-0.1484783, 1.388441, 0.09560124, 0, 1, 0.682353, 1,
-0.1477073, -0.9293342, -3.371541, 0, 1, 0.6862745, 1,
-0.1454009, -0.1224047, -3.711185, 0, 1, 0.6941177, 1,
-0.1439929, 1.255767, -0.4531743, 0, 1, 0.7019608, 1,
-0.1412762, 0.8607596, 0.7614612, 0, 1, 0.7058824, 1,
-0.1390339, 0.5391662, -1.639407, 0, 1, 0.7137255, 1,
-0.1381373, 0.6997582, 0.2426408, 0, 1, 0.7176471, 1,
-0.1375023, 0.5271451, -0.7597997, 0, 1, 0.7254902, 1,
-0.136686, 0.216045, -0.9816675, 0, 1, 0.7294118, 1,
-0.1354105, -0.3205249, -3.790171, 0, 1, 0.7372549, 1,
-0.1333085, -0.7916464, -4.747779, 0, 1, 0.7411765, 1,
-0.1267604, 0.3766017, 2.038021, 0, 1, 0.7490196, 1,
-0.1259899, 0.03063545, -0.5515634, 0, 1, 0.7529412, 1,
-0.1259129, 0.5837594, 0.6254619, 0, 1, 0.7607843, 1,
-0.1249756, 0.5445098, 0.1270987, 0, 1, 0.7647059, 1,
-0.1207495, 0.9012415, 0.4042496, 0, 1, 0.772549, 1,
-0.1201983, 0.4796386, -0.538779, 0, 1, 0.7764706, 1,
-0.1196891, 0.6082094, -0.3196405, 0, 1, 0.7843137, 1,
-0.1193334, -0.4183411, -3.268248, 0, 1, 0.7882353, 1,
-0.1129218, 0.8242104, 0.388635, 0, 1, 0.7960784, 1,
-0.1080331, 0.03459004, -1.659054, 0, 1, 0.8039216, 1,
-0.1067227, -0.02075767, -1.571729, 0, 1, 0.8078431, 1,
-0.1061556, 0.1341607, 0.07656167, 0, 1, 0.8156863, 1,
-0.1040213, -0.2414393, -2.614682, 0, 1, 0.8196079, 1,
-0.1026909, -0.3861411, -2.216398, 0, 1, 0.827451, 1,
-0.1022938, -1.28904, -3.668097, 0, 1, 0.8313726, 1,
-0.09671104, -0.2989005, -3.166465, 0, 1, 0.8392157, 1,
-0.09504858, -1.333158, -2.764835, 0, 1, 0.8431373, 1,
-0.09449264, -0.5266111, -3.039665, 0, 1, 0.8509804, 1,
-0.09127616, 0.7983577, -0.5925761, 0, 1, 0.854902, 1,
-0.09039845, -0.8540246, -3.531574, 0, 1, 0.8627451, 1,
-0.08434556, 0.3213039, -1.549097, 0, 1, 0.8666667, 1,
-0.0839178, 1.071749, 0.786895, 0, 1, 0.8745098, 1,
-0.08125706, 1.064541, 0.04981567, 0, 1, 0.8784314, 1,
-0.08107448, -0.401004, -1.53871, 0, 1, 0.8862745, 1,
-0.07809296, -0.6919509, -2.263791, 0, 1, 0.8901961, 1,
-0.07751084, 0.2819939, -2.141346, 0, 1, 0.8980392, 1,
-0.0765591, -0.7511817, -2.242888, 0, 1, 0.9058824, 1,
-0.06909429, 1.320948, 1.205927, 0, 1, 0.9098039, 1,
-0.06876754, -0.6035946, -2.942809, 0, 1, 0.9176471, 1,
-0.06690818, 0.2385716, -0.3671713, 0, 1, 0.9215686, 1,
-0.06675436, 0.2482885, -0.1459536, 0, 1, 0.9294118, 1,
-0.06484721, 1.018043, -1.234891, 0, 1, 0.9333333, 1,
-0.05835907, -0.03811768, -2.568521, 0, 1, 0.9411765, 1,
-0.05832128, -0.1298106, -3.827687, 0, 1, 0.945098, 1,
-0.05502297, 0.7168077, 0.7448153, 0, 1, 0.9529412, 1,
-0.05303416, -1.83845, -3.6154, 0, 1, 0.9568627, 1,
-0.0517139, 0.3790547, 0.9558717, 0, 1, 0.9647059, 1,
-0.05001971, 0.8025261, 0.4347786, 0, 1, 0.9686275, 1,
-0.04013314, -1.952902, -3.335337, 0, 1, 0.9764706, 1,
-0.03512763, -0.5168383, -2.451187, 0, 1, 0.9803922, 1,
-0.025779, -0.486329, -4.43919, 0, 1, 0.9882353, 1,
-0.02280139, 0.4073511, 0.3792129, 0, 1, 0.9921569, 1,
-0.02061706, -0.4572148, -1.657731, 0, 1, 1, 1,
-0.01943174, -0.5125558, -3.343284, 0, 0.9921569, 1, 1,
-0.01923186, 0.1174578, -0.7153546, 0, 0.9882353, 1, 1,
-0.01830001, -0.7411847, -3.251759, 0, 0.9803922, 1, 1,
-0.01354782, -1.123094, -2.087658, 0, 0.9764706, 1, 1,
-0.005154466, 0.5342411, -0.5334955, 0, 0.9686275, 1, 1,
-0.001633338, 0.1060324, -0.5778413, 0, 0.9647059, 1, 1,
0.003455582, 2.197066, 0.4175021, 0, 0.9568627, 1, 1,
0.004721852, 0.3300161, 0.6632186, 0, 0.9529412, 1, 1,
0.005962324, 2.034826, 0.7632118, 0, 0.945098, 1, 1,
0.008750308, -0.6180373, 3.248733, 0, 0.9411765, 1, 1,
0.009060614, -1.553203, 2.049371, 0, 0.9333333, 1, 1,
0.01048777, 0.9831917, -0.05010984, 0, 0.9294118, 1, 1,
0.01349504, -0.5571647, 3.993586, 0, 0.9215686, 1, 1,
0.01422243, -0.9109693, 2.721746, 0, 0.9176471, 1, 1,
0.01437361, 0.8669373, 0.1634737, 0, 0.9098039, 1, 1,
0.01477041, -1.605844, 4.812097, 0, 0.9058824, 1, 1,
0.01498512, -0.4212779, 4.585433, 0, 0.8980392, 1, 1,
0.01932059, -1.514401, 2.040308, 0, 0.8901961, 1, 1,
0.02038291, -0.1024959, 3.431336, 0, 0.8862745, 1, 1,
0.02341295, 0.995021, 0.1194635, 0, 0.8784314, 1, 1,
0.02620444, -1.450561, 3.714639, 0, 0.8745098, 1, 1,
0.02623097, -0.3181506, 3.754698, 0, 0.8666667, 1, 1,
0.03543926, -0.7981956, 6.267073, 0, 0.8627451, 1, 1,
0.03671799, -0.510599, 1.852951, 0, 0.854902, 1, 1,
0.04376419, -1.543213, 3.566274, 0, 0.8509804, 1, 1,
0.04378017, 0.3028907, 1.192381, 0, 0.8431373, 1, 1,
0.04524444, -0.3055503, 2.646301, 0, 0.8392157, 1, 1,
0.05278356, 0.5299987, 1.508561, 0, 0.8313726, 1, 1,
0.05303216, 0.4597575, 0.2802983, 0, 0.827451, 1, 1,
0.05680717, -1.516757, 3.682738, 0, 0.8196079, 1, 1,
0.05695651, 1.229809, -0.6761688, 0, 0.8156863, 1, 1,
0.05761047, -0.896584, 3.039153, 0, 0.8078431, 1, 1,
0.05854604, 1.000683, 1.066464, 0, 0.8039216, 1, 1,
0.05937125, 0.8440174, 1.593763, 0, 0.7960784, 1, 1,
0.06891099, 0.6298062, 0.7321567, 0, 0.7882353, 1, 1,
0.06915414, -0.8709643, 3.533318, 0, 0.7843137, 1, 1,
0.0693535, -0.4540026, 2.850865, 0, 0.7764706, 1, 1,
0.06939382, -0.704702, 3.854174, 0, 0.772549, 1, 1,
0.07082049, 1.615511, -1.014736, 0, 0.7647059, 1, 1,
0.07335931, 0.1184104, 0.6380026, 0, 0.7607843, 1, 1,
0.07436056, -0.1379409, 4.642003, 0, 0.7529412, 1, 1,
0.07707325, -0.4937796, 3.034811, 0, 0.7490196, 1, 1,
0.08059838, 0.01599572, 2.506359, 0, 0.7411765, 1, 1,
0.0827919, 0.5363685, 1.138504, 0, 0.7372549, 1, 1,
0.08303144, 0.6511289, -0.2945181, 0, 0.7294118, 1, 1,
0.08515264, 0.2285349, 0.6845153, 0, 0.7254902, 1, 1,
0.088736, -0.09414762, 2.576868, 0, 0.7176471, 1, 1,
0.09451544, -1.63381, 4.091316, 0, 0.7137255, 1, 1,
0.09625138, -0.9210036, 3.94582, 0, 0.7058824, 1, 1,
0.1012626, -1.201895, 3.082751, 0, 0.6980392, 1, 1,
0.1114562, -0.7089393, 4.56249, 0, 0.6941177, 1, 1,
0.1134605, -0.3740486, 1.915511, 0, 0.6862745, 1, 1,
0.1160263, 1.0361, 0.6206077, 0, 0.682353, 1, 1,
0.1184786, 1.144072, -3.110947, 0, 0.6745098, 1, 1,
0.1201861, 0.5356573, 0.5715188, 0, 0.6705883, 1, 1,
0.1231363, 0.4145875, 0.5378572, 0, 0.6627451, 1, 1,
0.1329838, -0.07160515, 0.09435088, 0, 0.6588235, 1, 1,
0.1346204, -1.311546, 2.430238, 0, 0.6509804, 1, 1,
0.1365226, -0.04515937, 2.026011, 0, 0.6470588, 1, 1,
0.138807, 0.7344917, -0.2748161, 0, 0.6392157, 1, 1,
0.1437309, 0.7456188, 1.127631, 0, 0.6352941, 1, 1,
0.1448095, 1.263482, -0.2082524, 0, 0.627451, 1, 1,
0.1470454, 1.251717, 0.4435012, 0, 0.6235294, 1, 1,
0.1490044, 1.275228, -0.9321675, 0, 0.6156863, 1, 1,
0.1502575, 0.4484242, -0.2353842, 0, 0.6117647, 1, 1,
0.1518466, -0.5802324, 2.40786, 0, 0.6039216, 1, 1,
0.1519454, -0.8897687, 4.70836, 0, 0.5960785, 1, 1,
0.1525302, 0.9344152, -2.267169, 0, 0.5921569, 1, 1,
0.1534394, 0.866401, 0.2039815, 0, 0.5843138, 1, 1,
0.1578463, -0.5056401, 0.2065087, 0, 0.5803922, 1, 1,
0.1589171, -0.002773626, 0.7842689, 0, 0.572549, 1, 1,
0.1657652, 0.8433457, 0.4460034, 0, 0.5686275, 1, 1,
0.1665671, -1.429357, 4.067008, 0, 0.5607843, 1, 1,
0.1672478, -0.1096274, 1.891164, 0, 0.5568628, 1, 1,
0.168339, 0.3198105, 0.7410653, 0, 0.5490196, 1, 1,
0.1757802, -0.2068848, 1.85732, 0, 0.5450981, 1, 1,
0.1758334, -1.16433, 4.058718, 0, 0.5372549, 1, 1,
0.1789449, 0.9009488, 0.577247, 0, 0.5333334, 1, 1,
0.1792048, -0.9888854, 3.147531, 0, 0.5254902, 1, 1,
0.1818693, -0.2914512, 2.78877, 0, 0.5215687, 1, 1,
0.1820581, -0.05871716, 1.505884, 0, 0.5137255, 1, 1,
0.183626, 0.1446407, 1.287416, 0, 0.509804, 1, 1,
0.1857325, 1.321637, -1.41009, 0, 0.5019608, 1, 1,
0.1860154, 1.489699, -0.5777277, 0, 0.4941176, 1, 1,
0.1871773, -0.01765185, -0.4392202, 0, 0.4901961, 1, 1,
0.1884453, 0.2349835, -0.3715874, 0, 0.4823529, 1, 1,
0.1954666, 0.1062207, 2.234755, 0, 0.4784314, 1, 1,
0.1975272, -0.2126141, 2.563584, 0, 0.4705882, 1, 1,
0.1994434, -1.484116, 4.396458, 0, 0.4666667, 1, 1,
0.2004623, 0.6875752, 1.116721, 0, 0.4588235, 1, 1,
0.2035946, 0.5884699, 1.952795, 0, 0.454902, 1, 1,
0.2057875, 1.372559, 0.2254555, 0, 0.4470588, 1, 1,
0.2082611, -0.41059, 1.188815, 0, 0.4431373, 1, 1,
0.216137, 0.5054487, 0.121235, 0, 0.4352941, 1, 1,
0.2182136, 0.6513772, 0.2515152, 0, 0.4313726, 1, 1,
0.2185479, 0.7730275, -0.5504602, 0, 0.4235294, 1, 1,
0.2202543, 0.0128951, 2.498915, 0, 0.4196078, 1, 1,
0.2276774, -1.198694, 2.174402, 0, 0.4117647, 1, 1,
0.2335312, 0.1759604, 1.462892, 0, 0.4078431, 1, 1,
0.237351, -0.6411334, 3.03315, 0, 0.4, 1, 1,
0.2400731, -1.937155, 2.544633, 0, 0.3921569, 1, 1,
0.2452435, -0.7873663, 3.044548, 0, 0.3882353, 1, 1,
0.2464761, 0.572958, 0.2879919, 0, 0.3803922, 1, 1,
0.2467969, -0.8307768, 2.206145, 0, 0.3764706, 1, 1,
0.2482988, -0.6287581, 0.9523313, 0, 0.3686275, 1, 1,
0.2483073, -2.443268, 2.455129, 0, 0.3647059, 1, 1,
0.2517762, -1.116165, 2.182009, 0, 0.3568628, 1, 1,
0.2548408, 0.713729, 1.133813, 0, 0.3529412, 1, 1,
0.2554533, -0.3767038, 2.733917, 0, 0.345098, 1, 1,
0.2625151, 1.210443, 0.4297202, 0, 0.3411765, 1, 1,
0.2675197, -0.5199693, 2.094156, 0, 0.3333333, 1, 1,
0.2725919, -1.6227, 2.134942, 0, 0.3294118, 1, 1,
0.2727335, -0.3020092, 2.54832, 0, 0.3215686, 1, 1,
0.2762329, -1.046637, 5.011599, 0, 0.3176471, 1, 1,
0.2772016, -0.4308945, 3.075836, 0, 0.3098039, 1, 1,
0.2786377, -0.3135331, 3.100791, 0, 0.3058824, 1, 1,
0.278995, -1.687635, 2.831926, 0, 0.2980392, 1, 1,
0.2803725, 0.2358068, 2.190398, 0, 0.2901961, 1, 1,
0.2823997, 2.233166, 0.5993528, 0, 0.2862745, 1, 1,
0.288005, -0.2316586, 0.03051114, 0, 0.2784314, 1, 1,
0.2889747, 0.4585573, -0.6352817, 0, 0.2745098, 1, 1,
0.2892887, -0.7078193, 3.043517, 0, 0.2666667, 1, 1,
0.293364, -0.1075811, 3.343895, 0, 0.2627451, 1, 1,
0.3026979, 0.01829887, 1.437639, 0, 0.254902, 1, 1,
0.3040681, 1.639813, -0.07974579, 0, 0.2509804, 1, 1,
0.304532, 1.339235, 1.311814, 0, 0.2431373, 1, 1,
0.3131475, 0.254704, -0.2428295, 0, 0.2392157, 1, 1,
0.3199959, -1.177867, 3.514408, 0, 0.2313726, 1, 1,
0.3279139, -0.0131137, 2.039533, 0, 0.227451, 1, 1,
0.3307872, 0.1263316, 1.406794, 0, 0.2196078, 1, 1,
0.3349728, -0.06279046, 2.106394, 0, 0.2156863, 1, 1,
0.3412863, 1.047638, 1.096041, 0, 0.2078431, 1, 1,
0.3415602, -0.4050801, 3.517916, 0, 0.2039216, 1, 1,
0.3425204, -0.09399394, 2.140129, 0, 0.1960784, 1, 1,
0.3428967, 1.225065, 2.185931, 0, 0.1882353, 1, 1,
0.3526221, 0.1777949, 0.8361571, 0, 0.1843137, 1, 1,
0.3530045, -0.4893638, 2.199486, 0, 0.1764706, 1, 1,
0.353065, -1.008086, 2.647362, 0, 0.172549, 1, 1,
0.355553, -0.7694736, 1.781735, 0, 0.1647059, 1, 1,
0.3559337, -0.6555985, 2.175441, 0, 0.1607843, 1, 1,
0.3565548, 0.1878779, 2.00486, 0, 0.1529412, 1, 1,
0.3579103, -0.7028549, 1.613312, 0, 0.1490196, 1, 1,
0.3585642, 0.1154659, 1.517359, 0, 0.1411765, 1, 1,
0.3597312, -0.2887232, 3.452528, 0, 0.1372549, 1, 1,
0.3598575, -0.6341264, 1.594231, 0, 0.1294118, 1, 1,
0.3636579, 0.6946646, -1.068273, 0, 0.1254902, 1, 1,
0.3644824, 0.3094451, 0.1432893, 0, 0.1176471, 1, 1,
0.3663609, 1.14575, 0.9780276, 0, 0.1137255, 1, 1,
0.3688421, 1.008037, 1.075732, 0, 0.1058824, 1, 1,
0.3690765, -0.1656955, 3.556278, 0, 0.09803922, 1, 1,
0.3725407, 0.1999105, 1.462484, 0, 0.09411765, 1, 1,
0.3743303, -0.2497834, 3.489407, 0, 0.08627451, 1, 1,
0.3761943, -0.5325208, 2.887094, 0, 0.08235294, 1, 1,
0.3774099, 0.1923325, -0.1553133, 0, 0.07450981, 1, 1,
0.3794062, 0.2437166, 0.5871753, 0, 0.07058824, 1, 1,
0.3806288, 0.8694617, -0.08966272, 0, 0.0627451, 1, 1,
0.3835727, 1.033848, 1.139161, 0, 0.05882353, 1, 1,
0.3850511, 0.8375925, 0.8900423, 0, 0.05098039, 1, 1,
0.3859242, 0.4680015, 2.675954, 0, 0.04705882, 1, 1,
0.3885582, 0.9657581, -0.4182387, 0, 0.03921569, 1, 1,
0.3917696, 1.203068, 1.259834, 0, 0.03529412, 1, 1,
0.394374, -1.503409, 0.695425, 0, 0.02745098, 1, 1,
0.3962104, 1.290785, -0.800999, 0, 0.02352941, 1, 1,
0.3962325, -0.6889554, 0.3161546, 0, 0.01568628, 1, 1,
0.3975363, -0.1836638, 3.175385, 0, 0.01176471, 1, 1,
0.4005327, 0.8943192, -1.55612, 0, 0.003921569, 1, 1,
0.4056619, -0.2350795, 2.17956, 0.003921569, 0, 1, 1,
0.408998, 0.2717355, 2.466525, 0.007843138, 0, 1, 1,
0.4140668, -0.4297647, 4.737435, 0.01568628, 0, 1, 1,
0.4146422, 0.1009, -0.2568002, 0.01960784, 0, 1, 1,
0.4149657, 1.451861, -0.2085062, 0.02745098, 0, 1, 1,
0.417371, 0.2627498, 1.599628, 0.03137255, 0, 1, 1,
0.4197327, 0.2050534, 0.4800312, 0.03921569, 0, 1, 1,
0.4210851, -1.042435, 3.215916, 0.04313726, 0, 1, 1,
0.4232153, 0.4257589, 0.1250293, 0.05098039, 0, 1, 1,
0.4233538, 0.2153244, 1.457221, 0.05490196, 0, 1, 1,
0.4286898, 0.8944165, 2.284975, 0.0627451, 0, 1, 1,
0.4288086, 1.823302, 0.06786816, 0.06666667, 0, 1, 1,
0.4296145, 1.056068, 1.301568, 0.07450981, 0, 1, 1,
0.4307437, -0.3742424, 2.183254, 0.07843138, 0, 1, 1,
0.4315496, 0.1118253, 1.268713, 0.08627451, 0, 1, 1,
0.433844, -0.07710978, 2.674028, 0.09019608, 0, 1, 1,
0.4345827, -0.83369, 3.107253, 0.09803922, 0, 1, 1,
0.440315, -0.9888495, 1.19986, 0.1058824, 0, 1, 1,
0.4409736, 0.02266756, 1.391913, 0.1098039, 0, 1, 1,
0.4423406, 0.7928603, -1.369882, 0.1176471, 0, 1, 1,
0.4444823, 0.4192784, 0.5319042, 0.1215686, 0, 1, 1,
0.4459416, 1.02789, -0.6956673, 0.1294118, 0, 1, 1,
0.4461832, 0.2498862, -1.51208, 0.1333333, 0, 1, 1,
0.450697, -1.320911, 4.654899, 0.1411765, 0, 1, 1,
0.4517597, 0.1860541, 0.4424633, 0.145098, 0, 1, 1,
0.4526012, -1.479209, 4.652019, 0.1529412, 0, 1, 1,
0.4580544, -0.4309047, 3.206818, 0.1568628, 0, 1, 1,
0.4589778, -0.3385663, 1.891446, 0.1647059, 0, 1, 1,
0.4606036, -0.301378, 1.359787, 0.1686275, 0, 1, 1,
0.4618699, 0.1548144, 2.55655, 0.1764706, 0, 1, 1,
0.4695726, -0.997156, 2.38133, 0.1803922, 0, 1, 1,
0.4698632, -1.243956, 3.79994, 0.1882353, 0, 1, 1,
0.4768339, -0.2214786, 1.4056, 0.1921569, 0, 1, 1,
0.4843023, -0.5828365, 3.035893, 0.2, 0, 1, 1,
0.4860529, 0.7846044, -0.5469511, 0.2078431, 0, 1, 1,
0.4919424, 0.03046666, -0.6137108, 0.2117647, 0, 1, 1,
0.4933648, 0.4565854, 1.028747, 0.2196078, 0, 1, 1,
0.495117, 0.01884658, 2.131174, 0.2235294, 0, 1, 1,
0.4981056, 0.4726013, -1.054363, 0.2313726, 0, 1, 1,
0.5029693, -1.569108, 3.331939, 0.2352941, 0, 1, 1,
0.5060466, 0.4689394, 0.5960285, 0.2431373, 0, 1, 1,
0.5166408, -0.7893581, 1.307506, 0.2470588, 0, 1, 1,
0.5180282, 0.003388932, 0.5615975, 0.254902, 0, 1, 1,
0.5224277, 0.7743413, 0.681938, 0.2588235, 0, 1, 1,
0.525306, -1.62834, 1.693836, 0.2666667, 0, 1, 1,
0.5328935, 0.3544773, 2.439473, 0.2705882, 0, 1, 1,
0.5343069, -0.4598317, 2.448197, 0.2784314, 0, 1, 1,
0.536711, 0.611904, 0.925637, 0.282353, 0, 1, 1,
0.5372852, -0.7520695, 3.422328, 0.2901961, 0, 1, 1,
0.5394148, -0.6095519, 0.6263804, 0.2941177, 0, 1, 1,
0.5398446, -0.8000504, 3.273557, 0.3019608, 0, 1, 1,
0.5399818, 0.1834704, 0.5039502, 0.3098039, 0, 1, 1,
0.5456384, -0.3024637, 2.185194, 0.3137255, 0, 1, 1,
0.5471908, 0.5127542, -0.1982235, 0.3215686, 0, 1, 1,
0.559618, -1.210443, 3.855591, 0.3254902, 0, 1, 1,
0.559934, 1.25869, 0.7338338, 0.3333333, 0, 1, 1,
0.5604658, 0.7568088, 0.2789415, 0.3372549, 0, 1, 1,
0.5694554, 2.334151, 1.103305, 0.345098, 0, 1, 1,
0.5726939, -0.4470687, 2.888776, 0.3490196, 0, 1, 1,
0.573466, 0.04540652, 2.895245, 0.3568628, 0, 1, 1,
0.5752347, 0.9107785, 0.5290922, 0.3607843, 0, 1, 1,
0.5767658, 0.01955063, 3.500038, 0.3686275, 0, 1, 1,
0.5806076, -0.1099147, 3.479424, 0.372549, 0, 1, 1,
0.5811237, -0.1063746, 2.194184, 0.3803922, 0, 1, 1,
0.5828911, 0.27031, 2.573745, 0.3843137, 0, 1, 1,
0.5854369, -0.2006632, 2.615904, 0.3921569, 0, 1, 1,
0.5871868, -0.7124876, 3.369436, 0.3960784, 0, 1, 1,
0.5882885, -0.217812, 1.914028, 0.4039216, 0, 1, 1,
0.594955, 1.487164, 0.7878325, 0.4117647, 0, 1, 1,
0.5950093, 0.8635876, -0.03065735, 0.4156863, 0, 1, 1,
0.5950471, 1.104051, 1.188631, 0.4235294, 0, 1, 1,
0.5954915, -1.106987, 3.367867, 0.427451, 0, 1, 1,
0.599923, 1.470466, 0.72093, 0.4352941, 0, 1, 1,
0.6061479, 0.04242323, 0.6091888, 0.4392157, 0, 1, 1,
0.6091458, 0.984188, 2.276155, 0.4470588, 0, 1, 1,
0.6127436, 0.5092334, 1.225491, 0.4509804, 0, 1, 1,
0.6137509, -1.517792, 1.612002, 0.4588235, 0, 1, 1,
0.61383, 0.1911978, 1.266953, 0.4627451, 0, 1, 1,
0.6151115, 1.28431, -0.728656, 0.4705882, 0, 1, 1,
0.616196, -1.654973, 1.164216, 0.4745098, 0, 1, 1,
0.6168896, -0.3201669, 3.558724, 0.4823529, 0, 1, 1,
0.6185957, -1.61742, 2.900119, 0.4862745, 0, 1, 1,
0.619181, -2.24511, 2.244386, 0.4941176, 0, 1, 1,
0.6269315, -0.3625067, 1.164029, 0.5019608, 0, 1, 1,
0.6320786, -1.074413, 3.193434, 0.5058824, 0, 1, 1,
0.6324105, 0.5941464, 1.547932, 0.5137255, 0, 1, 1,
0.6363401, -0.7465203, 1.980898, 0.5176471, 0, 1, 1,
0.6457762, 1.066427, 0.6045359, 0.5254902, 0, 1, 1,
0.6494615, 0.1085134, 1.207642, 0.5294118, 0, 1, 1,
0.6586863, -2.035024, 3.777579, 0.5372549, 0, 1, 1,
0.6643922, -1.412247, 2.980208, 0.5411765, 0, 1, 1,
0.6645064, 0.9277602, 0.2873794, 0.5490196, 0, 1, 1,
0.6714378, 0.379032, 1.326442, 0.5529412, 0, 1, 1,
0.6746227, -0.6931956, 2.642476, 0.5607843, 0, 1, 1,
0.6754977, -0.139719, 1.085073, 0.5647059, 0, 1, 1,
0.6768533, -0.146191, 2.028288, 0.572549, 0, 1, 1,
0.6773685, 0.1205392, -0.2852049, 0.5764706, 0, 1, 1,
0.6813377, 0.4166421, 2.146319, 0.5843138, 0, 1, 1,
0.6825997, 0.04559632, 0.6413643, 0.5882353, 0, 1, 1,
0.6837122, -1.107289, 2.725936, 0.5960785, 0, 1, 1,
0.6856547, 0.2164928, 1.651937, 0.6039216, 0, 1, 1,
0.6883214, 0.7393088, 1.431438, 0.6078432, 0, 1, 1,
0.6890881, 0.9475524, 0.8951904, 0.6156863, 0, 1, 1,
0.6893862, -0.1814691, 1.361513, 0.6196079, 0, 1, 1,
0.6899796, 1.585417, -0.5033074, 0.627451, 0, 1, 1,
0.6904275, -0.401286, 3.035283, 0.6313726, 0, 1, 1,
0.6937564, -0.3803787, 1.812257, 0.6392157, 0, 1, 1,
0.6958628, 1.433659, -0.08142468, 0.6431373, 0, 1, 1,
0.697167, 0.6577109, -1.365276, 0.6509804, 0, 1, 1,
0.701221, 0.6839722, 1.829541, 0.654902, 0, 1, 1,
0.7017478, 0.7929457, 0.42439, 0.6627451, 0, 1, 1,
0.7054943, -0.8820817, 2.670786, 0.6666667, 0, 1, 1,
0.7059425, -0.3168707, 2.143373, 0.6745098, 0, 1, 1,
0.7102449, 0.9400753, 0.2486202, 0.6784314, 0, 1, 1,
0.7183465, -1.533289, 2.863506, 0.6862745, 0, 1, 1,
0.719104, 0.312433, 0.1892991, 0.6901961, 0, 1, 1,
0.7207596, -0.2092407, 1.591954, 0.6980392, 0, 1, 1,
0.7209459, -0.6399038, 2.974065, 0.7058824, 0, 1, 1,
0.7221627, -1.07574, 4.222734, 0.7098039, 0, 1, 1,
0.724175, -0.8401716, 5.033478, 0.7176471, 0, 1, 1,
0.7315302, -1.510852, 1.910177, 0.7215686, 0, 1, 1,
0.7366547, -0.6933011, 2.440416, 0.7294118, 0, 1, 1,
0.7378762, 0.9665455, -0.3836212, 0.7333333, 0, 1, 1,
0.7529626, 2.244421, 1.649038, 0.7411765, 0, 1, 1,
0.7542907, -1.147151, 2.104637, 0.7450981, 0, 1, 1,
0.7547596, 0.4821403, 1.611273, 0.7529412, 0, 1, 1,
0.7551447, -0.3157161, 3.04046, 0.7568628, 0, 1, 1,
0.7562643, -0.2505766, -0.005025622, 0.7647059, 0, 1, 1,
0.7587579, -0.6143897, 1.141093, 0.7686275, 0, 1, 1,
0.7621965, 2.701916, 1.664055, 0.7764706, 0, 1, 1,
0.7649749, 0.515842, 1.120013, 0.7803922, 0, 1, 1,
0.7662039, -1.289583, 2.470456, 0.7882353, 0, 1, 1,
0.7691687, -0.2971546, 2.567888, 0.7921569, 0, 1, 1,
0.7788984, -0.1793228, 2.987218, 0.8, 0, 1, 1,
0.783062, -0.8741983, 3.192936, 0.8078431, 0, 1, 1,
0.7832553, -1.565128, 2.518713, 0.8117647, 0, 1, 1,
0.7870243, 1.160367, 1.489437, 0.8196079, 0, 1, 1,
0.7881835, -0.4810529, 4.040035, 0.8235294, 0, 1, 1,
0.7883407, 0.5398245, 0.5235377, 0.8313726, 0, 1, 1,
0.7929634, -0.1678336, 1.987908, 0.8352941, 0, 1, 1,
0.7964473, -0.07778941, 0.661127, 0.8431373, 0, 1, 1,
0.7988099, 0.9968115, 1.774254, 0.8470588, 0, 1, 1,
0.8016439, -0.5678713, 2.018383, 0.854902, 0, 1, 1,
0.8017663, 1.309789, 1.580699, 0.8588235, 0, 1, 1,
0.8044583, 0.4421459, 0.4155474, 0.8666667, 0, 1, 1,
0.806781, -0.1999796, 1.884776, 0.8705882, 0, 1, 1,
0.8073331, -1.207349, 0.7528845, 0.8784314, 0, 1, 1,
0.815493, -0.4240254, 1.793595, 0.8823529, 0, 1, 1,
0.817629, -0.2132798, 3.458021, 0.8901961, 0, 1, 1,
0.8185043, -1.44469, 2.402703, 0.8941177, 0, 1, 1,
0.8217726, -1.036099, 1.043928, 0.9019608, 0, 1, 1,
0.8236098, -0.04414672, -0.07437651, 0.9098039, 0, 1, 1,
0.8238826, -0.8968447, 3.37389, 0.9137255, 0, 1, 1,
0.827773, 1.9153, -0.05260571, 0.9215686, 0, 1, 1,
0.8361714, 0.06143359, 1.564821, 0.9254902, 0, 1, 1,
0.8384358, 0.5627893, 1.578922, 0.9333333, 0, 1, 1,
0.8480267, -0.04682916, 0.6571625, 0.9372549, 0, 1, 1,
0.848434, 0.7743807, 0.4933385, 0.945098, 0, 1, 1,
0.8505583, -0.2024461, 1.973165, 0.9490196, 0, 1, 1,
0.8521762, 1.016668, 1.580347, 0.9568627, 0, 1, 1,
0.8578922, -1.286016, 1.863534, 0.9607843, 0, 1, 1,
0.8621482, -0.9514627, 2.472068, 0.9686275, 0, 1, 1,
0.8688601, -0.2643518, 1.027138, 0.972549, 0, 1, 1,
0.8707601, -0.1114903, 2.58123, 0.9803922, 0, 1, 1,
0.8815248, 1.882939, -0.205241, 0.9843137, 0, 1, 1,
0.8907195, -0.1131287, 2.844459, 0.9921569, 0, 1, 1,
0.8911158, 1.592932, 0.4999153, 0.9960784, 0, 1, 1,
0.8912017, -0.1334825, 2.609704, 1, 0, 0.9960784, 1,
0.9080479, 0.8309304, 0.6540447, 1, 0, 0.9882353, 1,
0.9119169, 1.094056, -0.5819537, 1, 0, 0.9843137, 1,
0.9166943, 0.2955828, 3.694712, 1, 0, 0.9764706, 1,
0.9238585, 0.4231876, 1.164239, 1, 0, 0.972549, 1,
0.9303588, -0.9148299, 2.326915, 1, 0, 0.9647059, 1,
0.9369442, 0.001943416, 2.25566, 1, 0, 0.9607843, 1,
0.9381957, -0.7529253, 2.127781, 1, 0, 0.9529412, 1,
0.9384734, -0.54769, 2.400311, 1, 0, 0.9490196, 1,
0.9452395, -0.8075929, 2.337814, 1, 0, 0.9411765, 1,
0.9472737, -0.8586388, 2.815287, 1, 0, 0.9372549, 1,
0.956318, -1.758883, 2.262922, 1, 0, 0.9294118, 1,
0.963864, 1.115207, -0.5064303, 1, 0, 0.9254902, 1,
0.965066, 0.4715992, 1.638814, 1, 0, 0.9176471, 1,
0.9671553, -0.1145599, 2.181635, 1, 0, 0.9137255, 1,
0.9751448, 0.3466775, -0.02514046, 1, 0, 0.9058824, 1,
0.9834366, 0.5911554, 2.697528, 1, 0, 0.9019608, 1,
0.9879161, 0.07933936, 1.861981, 1, 0, 0.8941177, 1,
1.002965, 1.4589, -2.368492, 1, 0, 0.8862745, 1,
1.009495, -0.7502744, 2.755444, 1, 0, 0.8823529, 1,
1.010421, -0.7577004, 1.43616, 1, 0, 0.8745098, 1,
1.011614, 0.1219126, 0.5976, 1, 0, 0.8705882, 1,
1.019848, -1.104561, 2.794923, 1, 0, 0.8627451, 1,
1.026265, -1.285942, 4.181013, 1, 0, 0.8588235, 1,
1.028174, -1.380672, 1.576033, 1, 0, 0.8509804, 1,
1.03222, 0.1887136, 3.605375, 1, 0, 0.8470588, 1,
1.034554, 0.211711, 1.571914, 1, 0, 0.8392157, 1,
1.039374, 0.698019, 0.9461507, 1, 0, 0.8352941, 1,
1.045218, 0.4000889, 0.7864214, 1, 0, 0.827451, 1,
1.0498, -0.757486, 3.749874, 1, 0, 0.8235294, 1,
1.062455, 0.2422558, 1.833188, 1, 0, 0.8156863, 1,
1.063479, -0.5768338, 1.93989, 1, 0, 0.8117647, 1,
1.063979, -2.855779, 3.096091, 1, 0, 0.8039216, 1,
1.064881, 0.5132082, 0.01602832, 1, 0, 0.7960784, 1,
1.06604, -0.9050512, 2.219383, 1, 0, 0.7921569, 1,
1.067403, 0.3919447, 1.043539, 1, 0, 0.7843137, 1,
1.068468, -0.4981032, 2.254263, 1, 0, 0.7803922, 1,
1.084464, -0.2754969, 2.186596, 1, 0, 0.772549, 1,
1.087907, -0.8354851, 2.746976, 1, 0, 0.7686275, 1,
1.088274, -0.929053, 1.011052, 1, 0, 0.7607843, 1,
1.099614, 0.08228177, -0.1360601, 1, 0, 0.7568628, 1,
1.110449, 0.8558254, 1.63854, 1, 0, 0.7490196, 1,
1.124533, -1.263877, 3.709597, 1, 0, 0.7450981, 1,
1.126988, -0.7286612, 1.660732, 1, 0, 0.7372549, 1,
1.129077, 1.791258, -1.118838, 1, 0, 0.7333333, 1,
1.144237, -1.928712, 2.748892, 1, 0, 0.7254902, 1,
1.145843, 1.767584, -0.0800492, 1, 0, 0.7215686, 1,
1.152208, -0.296632, 2.546127, 1, 0, 0.7137255, 1,
1.158618, -0.6855996, 1.355437, 1, 0, 0.7098039, 1,
1.160989, -0.8178018, 2.482959, 1, 0, 0.7019608, 1,
1.172976, -0.3184034, 1.600318, 1, 0, 0.6941177, 1,
1.182263, 0.3491476, 1.772146, 1, 0, 0.6901961, 1,
1.190982, 0.6762163, 1.20545, 1, 0, 0.682353, 1,
1.218764, 1.099175, 3.083147, 1, 0, 0.6784314, 1,
1.223581, 2.566314, 2.901023, 1, 0, 0.6705883, 1,
1.232659, 0.01784858, 0.4810962, 1, 0, 0.6666667, 1,
1.233923, -0.4745709, 3.621797, 1, 0, 0.6588235, 1,
1.237427, -1.588588, 2.399202, 1, 0, 0.654902, 1,
1.242506, 1.344384, -0.1031922, 1, 0, 0.6470588, 1,
1.242899, 1.488454, -0.3433364, 1, 0, 0.6431373, 1,
1.252192, 0.01306141, 2.633647, 1, 0, 0.6352941, 1,
1.252633, 0.4700122, 0.1190448, 1, 0, 0.6313726, 1,
1.253235, 0.7312227, 1.803475, 1, 0, 0.6235294, 1,
1.254641, -0.1688508, 0.3151216, 1, 0, 0.6196079, 1,
1.257848, -0.117452, 2.51268, 1, 0, 0.6117647, 1,
1.259839, -0.1572941, 0.5711437, 1, 0, 0.6078432, 1,
1.267531, -0.8411462, 1.928026, 1, 0, 0.6, 1,
1.27193, 0.404595, 0.04363145, 1, 0, 0.5921569, 1,
1.273811, -0.05159028, 1.253406, 1, 0, 0.5882353, 1,
1.27681, -1.221199, 2.387255, 1, 0, 0.5803922, 1,
1.283005, 0.951808, 0.408569, 1, 0, 0.5764706, 1,
1.289386, -0.6788658, 0.5395558, 1, 0, 0.5686275, 1,
1.305077, 0.4306561, 0.8346774, 1, 0, 0.5647059, 1,
1.308831, 0.1537364, 2.983919, 1, 0, 0.5568628, 1,
1.30919, 0.3322499, 2.448895, 1, 0, 0.5529412, 1,
1.309354, 1.541772, 1.373128, 1, 0, 0.5450981, 1,
1.310895, -1.025031, 2.955209, 1, 0, 0.5411765, 1,
1.331386, -0.1061829, 0.2622906, 1, 0, 0.5333334, 1,
1.331773, -0.9974189, 2.086863, 1, 0, 0.5294118, 1,
1.332873, 1.054176, 0.4053902, 1, 0, 0.5215687, 1,
1.333646, 1.053144, 2.069731, 1, 0, 0.5176471, 1,
1.344933, -0.9881541, 2.701774, 1, 0, 0.509804, 1,
1.346869, 1.741772, -0.6878365, 1, 0, 0.5058824, 1,
1.351352, -1.574771, 2.470776, 1, 0, 0.4980392, 1,
1.364428, -0.671444, 1.631456, 1, 0, 0.4901961, 1,
1.376455, 0.836154, -1.175981, 1, 0, 0.4862745, 1,
1.404139, 0.1199602, 2.661912, 1, 0, 0.4784314, 1,
1.413183, 2.057364, 0.3974094, 1, 0, 0.4745098, 1,
1.415312, -1.536163, 2.189183, 1, 0, 0.4666667, 1,
1.418212, -0.5569595, 0.9640773, 1, 0, 0.4627451, 1,
1.42088, -0.3326883, 1.288321, 1, 0, 0.454902, 1,
1.425643, -0.4945247, 1.698381, 1, 0, 0.4509804, 1,
1.429774, -0.2806529, -0.7450696, 1, 0, 0.4431373, 1,
1.450066, -1.268606, 2.156701, 1, 0, 0.4392157, 1,
1.471241, 0.4618774, 0.395395, 1, 0, 0.4313726, 1,
1.475915, 0.624745, -0.113438, 1, 0, 0.427451, 1,
1.476788, -1.50206, 2.732157, 1, 0, 0.4196078, 1,
1.478722, -0.5947865, 1.692896, 1, 0, 0.4156863, 1,
1.495699, -0.6682056, 2.606637, 1, 0, 0.4078431, 1,
1.50685, -0.5986132, 2.495479, 1, 0, 0.4039216, 1,
1.51422, 2.356463, -0.02860222, 1, 0, 0.3960784, 1,
1.521765, 0.1495038, 1.908867, 1, 0, 0.3882353, 1,
1.524349, 0.05410208, 1.266572, 1, 0, 0.3843137, 1,
1.533729, 1.564868, -0.3407201, 1, 0, 0.3764706, 1,
1.538425, 0.136239, 0.2539256, 1, 0, 0.372549, 1,
1.545205, 1.197549, 1.804692, 1, 0, 0.3647059, 1,
1.560399, -1.548447, 0.7594633, 1, 0, 0.3607843, 1,
1.569596, -0.9687022, 1.2376, 1, 0, 0.3529412, 1,
1.591175, 1.094435, -0.5435883, 1, 0, 0.3490196, 1,
1.596276, 1.112179, 1.464051, 1, 0, 0.3411765, 1,
1.599962, -0.5466028, 2.324244, 1, 0, 0.3372549, 1,
1.618768, 0.03060398, 2.136212, 1, 0, 0.3294118, 1,
1.621447, -1.580299, 2.736739, 1, 0, 0.3254902, 1,
1.640063, 1.521026, 1.743185, 1, 0, 0.3176471, 1,
1.649136, -0.4491525, 3.156603, 1, 0, 0.3137255, 1,
1.659242, 0.426982, 0.1435579, 1, 0, 0.3058824, 1,
1.667999, -0.742757, 0.4989859, 1, 0, 0.2980392, 1,
1.679206, 0.9672254, -0.8928093, 1, 0, 0.2941177, 1,
1.681383, 0.2740762, 2.520934, 1, 0, 0.2862745, 1,
1.683409, -1.487856, 0.1669584, 1, 0, 0.282353, 1,
1.698521, 0.3786894, 1.018844, 1, 0, 0.2745098, 1,
1.716157, -0.6685891, 0.5085632, 1, 0, 0.2705882, 1,
1.780299, -0.1284739, 2.463527, 1, 0, 0.2627451, 1,
1.781117, -0.6435502, 3.065131, 1, 0, 0.2588235, 1,
1.788927, -0.9814577, 2.76725, 1, 0, 0.2509804, 1,
1.793969, -0.5048181, 0.8924503, 1, 0, 0.2470588, 1,
1.809773, 0.06808099, 1.189387, 1, 0, 0.2392157, 1,
1.820049, -2.241225, 1.903286, 1, 0, 0.2352941, 1,
1.825574, -0.7257994, 1.701875, 1, 0, 0.227451, 1,
1.83922, -0.8806582, 3.425669, 1, 0, 0.2235294, 1,
1.849743, 0.2060984, 1.187233, 1, 0, 0.2156863, 1,
1.851425, -1.025005, 1.495081, 1, 0, 0.2117647, 1,
1.856975, 0.5337769, 1.553799, 1, 0, 0.2039216, 1,
1.867321, -1.733561, 4.863598, 1, 0, 0.1960784, 1,
1.879634, -0.6233901, 2.178491, 1, 0, 0.1921569, 1,
1.88444, 0.1324368, 1.442026, 1, 0, 0.1843137, 1,
1.926123, -0.02100031, 2.230419, 1, 0, 0.1803922, 1,
1.990098, 0.2951638, 2.916086, 1, 0, 0.172549, 1,
2.011845, 0.06511403, 3.468245, 1, 0, 0.1686275, 1,
2.014459, -1.225346, 1.201697, 1, 0, 0.1607843, 1,
2.036187, -0.451619, -0.5588107, 1, 0, 0.1568628, 1,
2.060771, -0.2131227, -0.2930191, 1, 0, 0.1490196, 1,
2.067041, 0.01282259, 0.883646, 1, 0, 0.145098, 1,
2.088137, -0.9660545, 0.8130302, 1, 0, 0.1372549, 1,
2.096865, -0.02828144, 2.098347, 1, 0, 0.1333333, 1,
2.137123, -0.53993, 0.8090114, 1, 0, 0.1254902, 1,
2.153322, -0.01359044, 3.567555, 1, 0, 0.1215686, 1,
2.162937, -1.401398, 2.310963, 1, 0, 0.1137255, 1,
2.169723, 0.327565, 2.371826, 1, 0, 0.1098039, 1,
2.179982, 1.110963, 0.4022522, 1, 0, 0.1019608, 1,
2.187983, -0.0459192, 1.074975, 1, 0, 0.09411765, 1,
2.228752, -0.6744304, 2.427059, 1, 0, 0.09019608, 1,
2.266382, -1.425503, 2.273039, 1, 0, 0.08235294, 1,
2.293829, 0.8387129, 1.798527, 1, 0, 0.07843138, 1,
2.296806, 2.264529, 0.3934645, 1, 0, 0.07058824, 1,
2.330699, 0.2569846, 0.6427615, 1, 0, 0.06666667, 1,
2.348751, -0.6477029, 2.604527, 1, 0, 0.05882353, 1,
2.406264, 0.07382125, 1.844943, 1, 0, 0.05490196, 1,
2.417399, 1.079507, 0.3117643, 1, 0, 0.04705882, 1,
2.508464, -1.387874, 1.959667, 1, 0, 0.04313726, 1,
2.554603, 1.017594, 0.3996426, 1, 0, 0.03529412, 1,
2.63012, -0.2325334, 2.677892, 1, 0, 0.03137255, 1,
2.722209, 0.9710537, 0.6368055, 1, 0, 0.02352941, 1,
2.740341, -0.1658794, 1.281276, 1, 0, 0.01960784, 1,
2.940716, -0.1899531, 3.722338, 1, 0, 0.01176471, 1,
3.07123, 1.20122, 0.3813193, 1, 0, 0.007843138, 1
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
0.1771933, -3.834623, -6.932666, 0, -0.5, 0.5, 0.5,
0.1771933, -3.834623, -6.932666, 1, -0.5, 0.5, 0.5,
0.1771933, -3.834623, -6.932666, 1, 1.5, 0.5, 0.5,
0.1771933, -3.834623, -6.932666, 0, 1.5, 0.5, 0.5
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
-3.697922, 0.03166664, -6.932666, 0, -0.5, 0.5, 0.5,
-3.697922, 0.03166664, -6.932666, 1, -0.5, 0.5, 0.5,
-3.697922, 0.03166664, -6.932666, 1, 1.5, 0.5, 0.5,
-3.697922, 0.03166664, -6.932666, 0, 1.5, 0.5, 0.5
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
-3.697922, -3.834623, 0.6237473, 0, -0.5, 0.5, 0.5,
-3.697922, -3.834623, 0.6237473, 1, -0.5, 0.5, 0.5,
-3.697922, -3.834623, 0.6237473, 1, 1.5, 0.5, 0.5,
-3.697922, -3.834623, 0.6237473, 0, 1.5, 0.5, 0.5
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
-2, -2.942402, -5.188878,
3, -2.942402, -5.188878,
-2, -2.942402, -5.188878,
-2, -3.091105, -5.479509,
-1, -2.942402, -5.188878,
-1, -3.091105, -5.479509,
0, -2.942402, -5.188878,
0, -3.091105, -5.479509,
1, -2.942402, -5.188878,
1, -3.091105, -5.479509,
2, -2.942402, -5.188878,
2, -3.091105, -5.479509,
3, -2.942402, -5.188878,
3, -3.091105, -5.479509
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
-2, -3.388512, -6.060772, 0, -0.5, 0.5, 0.5,
-2, -3.388512, -6.060772, 1, -0.5, 0.5, 0.5,
-2, -3.388512, -6.060772, 1, 1.5, 0.5, 0.5,
-2, -3.388512, -6.060772, 0, 1.5, 0.5, 0.5,
-1, -3.388512, -6.060772, 0, -0.5, 0.5, 0.5,
-1, -3.388512, -6.060772, 1, -0.5, 0.5, 0.5,
-1, -3.388512, -6.060772, 1, 1.5, 0.5, 0.5,
-1, -3.388512, -6.060772, 0, 1.5, 0.5, 0.5,
0, -3.388512, -6.060772, 0, -0.5, 0.5, 0.5,
0, -3.388512, -6.060772, 1, -0.5, 0.5, 0.5,
0, -3.388512, -6.060772, 1, 1.5, 0.5, 0.5,
0, -3.388512, -6.060772, 0, 1.5, 0.5, 0.5,
1, -3.388512, -6.060772, 0, -0.5, 0.5, 0.5,
1, -3.388512, -6.060772, 1, -0.5, 0.5, 0.5,
1, -3.388512, -6.060772, 1, 1.5, 0.5, 0.5,
1, -3.388512, -6.060772, 0, 1.5, 0.5, 0.5,
2, -3.388512, -6.060772, 0, -0.5, 0.5, 0.5,
2, -3.388512, -6.060772, 1, -0.5, 0.5, 0.5,
2, -3.388512, -6.060772, 1, 1.5, 0.5, 0.5,
2, -3.388512, -6.060772, 0, 1.5, 0.5, 0.5,
3, -3.388512, -6.060772, 0, -0.5, 0.5, 0.5,
3, -3.388512, -6.060772, 1, -0.5, 0.5, 0.5,
3, -3.388512, -6.060772, 1, 1.5, 0.5, 0.5,
3, -3.388512, -6.060772, 0, 1.5, 0.5, 0.5
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
-2.803664, -2, -5.188878,
-2.803664, 2, -5.188878,
-2.803664, -2, -5.188878,
-2.952707, -2, -5.479509,
-2.803664, -1, -5.188878,
-2.952707, -1, -5.479509,
-2.803664, 0, -5.188878,
-2.952707, 0, -5.479509,
-2.803664, 1, -5.188878,
-2.952707, 1, -5.479509,
-2.803664, 2, -5.188878,
-2.952707, 2, -5.479509
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
-3.250793, -2, -6.060772, 0, -0.5, 0.5, 0.5,
-3.250793, -2, -6.060772, 1, -0.5, 0.5, 0.5,
-3.250793, -2, -6.060772, 1, 1.5, 0.5, 0.5,
-3.250793, -2, -6.060772, 0, 1.5, 0.5, 0.5,
-3.250793, -1, -6.060772, 0, -0.5, 0.5, 0.5,
-3.250793, -1, -6.060772, 1, -0.5, 0.5, 0.5,
-3.250793, -1, -6.060772, 1, 1.5, 0.5, 0.5,
-3.250793, -1, -6.060772, 0, 1.5, 0.5, 0.5,
-3.250793, 0, -6.060772, 0, -0.5, 0.5, 0.5,
-3.250793, 0, -6.060772, 1, -0.5, 0.5, 0.5,
-3.250793, 0, -6.060772, 1, 1.5, 0.5, 0.5,
-3.250793, 0, -6.060772, 0, 1.5, 0.5, 0.5,
-3.250793, 1, -6.060772, 0, -0.5, 0.5, 0.5,
-3.250793, 1, -6.060772, 1, -0.5, 0.5, 0.5,
-3.250793, 1, -6.060772, 1, 1.5, 0.5, 0.5,
-3.250793, 1, -6.060772, 0, 1.5, 0.5, 0.5,
-3.250793, 2, -6.060772, 0, -0.5, 0.5, 0.5,
-3.250793, 2, -6.060772, 1, -0.5, 0.5, 0.5,
-3.250793, 2, -6.060772, 1, 1.5, 0.5, 0.5,
-3.250793, 2, -6.060772, 0, 1.5, 0.5, 0.5
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
-2.803664, -2.942402, -4,
-2.803664, -2.942402, 6,
-2.803664, -2.942402, -4,
-2.952707, -3.091105, -4,
-2.803664, -2.942402, -2,
-2.952707, -3.091105, -2,
-2.803664, -2.942402, 0,
-2.952707, -3.091105, 0,
-2.803664, -2.942402, 2,
-2.952707, -3.091105, 2,
-2.803664, -2.942402, 4,
-2.952707, -3.091105, 4,
-2.803664, -2.942402, 6,
-2.952707, -3.091105, 6
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
"4",
"6"
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
-3.250793, -3.388512, -4, 0, -0.5, 0.5, 0.5,
-3.250793, -3.388512, -4, 1, -0.5, 0.5, 0.5,
-3.250793, -3.388512, -4, 1, 1.5, 0.5, 0.5,
-3.250793, -3.388512, -4, 0, 1.5, 0.5, 0.5,
-3.250793, -3.388512, -2, 0, -0.5, 0.5, 0.5,
-3.250793, -3.388512, -2, 1, -0.5, 0.5, 0.5,
-3.250793, -3.388512, -2, 1, 1.5, 0.5, 0.5,
-3.250793, -3.388512, -2, 0, 1.5, 0.5, 0.5,
-3.250793, -3.388512, 0, 0, -0.5, 0.5, 0.5,
-3.250793, -3.388512, 0, 1, -0.5, 0.5, 0.5,
-3.250793, -3.388512, 0, 1, 1.5, 0.5, 0.5,
-3.250793, -3.388512, 0, 0, 1.5, 0.5, 0.5,
-3.250793, -3.388512, 2, 0, -0.5, 0.5, 0.5,
-3.250793, -3.388512, 2, 1, -0.5, 0.5, 0.5,
-3.250793, -3.388512, 2, 1, 1.5, 0.5, 0.5,
-3.250793, -3.388512, 2, 0, 1.5, 0.5, 0.5,
-3.250793, -3.388512, 4, 0, -0.5, 0.5, 0.5,
-3.250793, -3.388512, 4, 1, -0.5, 0.5, 0.5,
-3.250793, -3.388512, 4, 1, 1.5, 0.5, 0.5,
-3.250793, -3.388512, 4, 0, 1.5, 0.5, 0.5,
-3.250793, -3.388512, 6, 0, -0.5, 0.5, 0.5,
-3.250793, -3.388512, 6, 1, -0.5, 0.5, 0.5,
-3.250793, -3.388512, 6, 1, 1.5, 0.5, 0.5,
-3.250793, -3.388512, 6, 0, 1.5, 0.5, 0.5
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
-2.803664, -2.942402, -5.188878,
-2.803664, 3.005735, -5.188878,
-2.803664, -2.942402, 6.436373,
-2.803664, 3.005735, 6.436373,
-2.803664, -2.942402, -5.188878,
-2.803664, -2.942402, 6.436373,
-2.803664, 3.005735, -5.188878,
-2.803664, 3.005735, 6.436373,
-2.803664, -2.942402, -5.188878,
3.158051, -2.942402, -5.188878,
-2.803664, -2.942402, 6.436373,
3.158051, -2.942402, 6.436373,
-2.803664, 3.005735, -5.188878,
3.158051, 3.005735, -5.188878,
-2.803664, 3.005735, 6.436373,
3.158051, 3.005735, 6.436373,
3.158051, -2.942402, -5.188878,
3.158051, 3.005735, -5.188878,
3.158051, -2.942402, 6.436373,
3.158051, 3.005735, 6.436373,
3.158051, -2.942402, -5.188878,
3.158051, -2.942402, 6.436373,
3.158051, 3.005735, -5.188878,
3.158051, 3.005735, 6.436373
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
var radius = 7.665344;
var distance = 34.10398;
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
mvMatrix.translate( -0.1771933, -0.03166664, -0.6237473 );
mvMatrix.scale( 1.39019, 1.393364, 0.7129239 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.10398);
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
gl.drawArrays(gl.LINES, 0, 12);
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
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
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
gl.drawArrays(gl.LINES, 0, 14);
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
gl.drawElements(gl.TRIANGLES, 36, gl.UNSIGNED_SHORT, 0);
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
flurtamone<-read.table("flurtamone.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-flurtamone$V2
```

```
## Error in eval(expr, envir, enclos): object 'flurtamone' not found
```

```r
y<-flurtamone$V3
```

```
## Error in eval(expr, envir, enclos): object 'flurtamone' not found
```

```r
z<-flurtamone$V4
```

```
## Error in eval(expr, envir, enclos): object 'flurtamone' not found
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
-2.716843, 1.958279, -0.3828719, 0, 0, 1, 1, 1,
-2.68614, 1.821733, 0.07916851, 1, 0, 0, 1, 1,
-2.559167, 0.781893, -0.8148854, 1, 0, 0, 1, 1,
-2.519797, 0.2931371, -2.464777, 1, 0, 0, 1, 1,
-2.482256, -0.2118731, -0.6938193, 1, 0, 0, 1, 1,
-2.380556, 0.3667782, -1.051041, 1, 0, 0, 1, 1,
-2.317092, -0.1977205, -2.384219, 0, 0, 0, 1, 1,
-2.314865, 1.574669, -1.18162, 0, 0, 0, 1, 1,
-2.294289, -0.4144638, -0.91795, 0, 0, 0, 1, 1,
-2.213964, -0.5941448, -2.38503, 0, 0, 0, 1, 1,
-2.157248, -1.021691, -0.5523598, 0, 0, 0, 1, 1,
-2.152072, 0.1330997, -0.8408885, 0, 0, 0, 1, 1,
-2.145147, -1.278764, -2.294862, 0, 0, 0, 1, 1,
-2.133326, -1.236132, -1.268951, 1, 1, 1, 1, 1,
-2.114974, -0.4866905, -0.7413476, 1, 1, 1, 1, 1,
-2.091392, -1.19889, -3.141297, 1, 1, 1, 1, 1,
-2.091267, -0.5690907, -0.3274375, 1, 1, 1, 1, 1,
-2.083842, -0.9885162, -1.712036, 1, 1, 1, 1, 1,
-2.065727, -1.42015, -3.019507, 1, 1, 1, 1, 1,
-2.039931, -0.3243806, -0.4459878, 1, 1, 1, 1, 1,
-2.021737, -1.127125, -1.233581, 1, 1, 1, 1, 1,
-2.017437, -0.6482457, -1.44966, 1, 1, 1, 1, 1,
-2.013217, -0.460039, -2.876324, 1, 1, 1, 1, 1,
-1.987851, -1.083608, -3.756083, 1, 1, 1, 1, 1,
-1.933522, -0.1889203, -2.350656, 1, 1, 1, 1, 1,
-1.922991, 1.090772, -0.1357048, 1, 1, 1, 1, 1,
-1.87762, -0.9636896, -1.265443, 1, 1, 1, 1, 1,
-1.859482, -0.3996657, -0.4944365, 1, 1, 1, 1, 1,
-1.848142, -0.2135404, -1.61052, 0, 0, 1, 1, 1,
-1.83008, -1.662647, -2.306284, 1, 0, 0, 1, 1,
-1.827149, 1.284476, -1.580709, 1, 0, 0, 1, 1,
-1.805225, -0.8460249, -1.085353, 1, 0, 0, 1, 1,
-1.802428, 2.062078, -0.8227538, 1, 0, 0, 1, 1,
-1.794279, -0.5282353, -2.473489, 1, 0, 0, 1, 1,
-1.792453, -0.4555201, -1.103014, 0, 0, 0, 1, 1,
-1.782336, -0.8427558, -2.061628, 0, 0, 0, 1, 1,
-1.76608, -1.53339, -1.546067, 0, 0, 0, 1, 1,
-1.727721, 0.05897469, -1.663187, 0, 0, 0, 1, 1,
-1.722448, 1.173925, -0.09159876, 0, 0, 0, 1, 1,
-1.718961, -1.054902, -0.7430539, 0, 0, 0, 1, 1,
-1.706185, 0.1882304, -1.003555, 0, 0, 0, 1, 1,
-1.704907, -1.274415, -2.70577, 1, 1, 1, 1, 1,
-1.697907, 1.138253, -0.8266775, 1, 1, 1, 1, 1,
-1.696708, -0.2956353, -2.334936, 1, 1, 1, 1, 1,
-1.680351, -0.1813565, -1.213337, 1, 1, 1, 1, 1,
-1.679702, -0.5044324, -2.665536, 1, 1, 1, 1, 1,
-1.657375, -1.166025, -0.9703805, 1, 1, 1, 1, 1,
-1.654844, -1.163597, -2.960576, 1, 1, 1, 1, 1,
-1.653808, -0.3347435, -1.464984, 1, 1, 1, 1, 1,
-1.642268, 0.5631915, -1.609465, 1, 1, 1, 1, 1,
-1.638681, -0.7824872, -1.556632, 1, 1, 1, 1, 1,
-1.636565, -1.101686, -1.142166, 1, 1, 1, 1, 1,
-1.636412, 1.714433, -0.9379631, 1, 1, 1, 1, 1,
-1.620724, -1.051594, -0.5299281, 1, 1, 1, 1, 1,
-1.618363, -2.023504, -0.1853223, 1, 1, 1, 1, 1,
-1.589323, -0.1066665, -2.473827, 1, 1, 1, 1, 1,
-1.576632, -0.7589383, -3.393978, 0, 0, 1, 1, 1,
-1.571069, -1.005917, -1.777571, 1, 0, 0, 1, 1,
-1.570179, 0.2992958, -0.890121, 1, 0, 0, 1, 1,
-1.563375, 0.4885587, -1.344591, 1, 0, 0, 1, 1,
-1.549326, -1.231547, -1.910847, 1, 0, 0, 1, 1,
-1.54549, 0.2275676, -4.229837, 1, 0, 0, 1, 1,
-1.543343, -1.62863, -1.96013, 0, 0, 0, 1, 1,
-1.53906, -2.284717, -0.6690446, 0, 0, 0, 1, 1,
-1.520659, -0.8045783, -1.608897, 0, 0, 0, 1, 1,
-1.516644, 1.345342, -1.774652, 0, 0, 0, 1, 1,
-1.506207, 0.01529785, -1.703961, 0, 0, 0, 1, 1,
-1.503305, -0.9931858, -3.521154, 0, 0, 0, 1, 1,
-1.490719, -0.4000013, -2.979005, 0, 0, 0, 1, 1,
-1.481328, 0.4061582, -0.692624, 1, 1, 1, 1, 1,
-1.478662, -2.09513, -2.74894, 1, 1, 1, 1, 1,
-1.471817, -1.154454, -1.525528, 1, 1, 1, 1, 1,
-1.470397, -0.07705504, -2.453012, 1, 1, 1, 1, 1,
-1.46927, 0.4338484, -2.390877, 1, 1, 1, 1, 1,
-1.445782, -1.586116, -1.384119, 1, 1, 1, 1, 1,
-1.425148, 0.3661843, -1.910839, 1, 1, 1, 1, 1,
-1.416994, -0.1523106, -1.405044, 1, 1, 1, 1, 1,
-1.415535, 1.069552, 0.4381342, 1, 1, 1, 1, 1,
-1.393428, -1.036909, -4.168077, 1, 1, 1, 1, 1,
-1.387562, 1.998176, 0.0960294, 1, 1, 1, 1, 1,
-1.386094, 1.080089, -2.408908, 1, 1, 1, 1, 1,
-1.385138, 1.541998, -1.883217, 1, 1, 1, 1, 1,
-1.380317, 1.369246, -0.829461, 1, 1, 1, 1, 1,
-1.377171, -1.296971, -3.044905, 1, 1, 1, 1, 1,
-1.374476, -0.2333332, -2.0865, 0, 0, 1, 1, 1,
-1.372788, 0.773325, -1.625901, 1, 0, 0, 1, 1,
-1.371103, -0.8884099, -1.029192, 1, 0, 0, 1, 1,
-1.362755, -1.279911, -1.570799, 1, 0, 0, 1, 1,
-1.360706, 1.329977, 0.3738612, 1, 0, 0, 1, 1,
-1.36009, 0.8097776, -0.813554, 1, 0, 0, 1, 1,
-1.357283, -0.3258185, -1.465291, 0, 0, 0, 1, 1,
-1.352, -0.4454707, -3.232376, 0, 0, 0, 1, 1,
-1.351238, -0.5497537, -1.846887, 0, 0, 0, 1, 1,
-1.349045, -1.982567, -2.235617, 0, 0, 0, 1, 1,
-1.344559, -0.2618224, -2.701743, 0, 0, 0, 1, 1,
-1.34434, -1.402943, -1.400463, 0, 0, 0, 1, 1,
-1.3424, -0.09919733, -2.549144, 0, 0, 0, 1, 1,
-1.319836, -0.3390865, -1.694147, 1, 1, 1, 1, 1,
-1.318424, -0.3318586, -2.076084, 1, 1, 1, 1, 1,
-1.31342, 2.03882, 0.3376395, 1, 1, 1, 1, 1,
-1.303135, 0.2237094, -1.985364, 1, 1, 1, 1, 1,
-1.302931, 0.3044604, 0.09980229, 1, 1, 1, 1, 1,
-1.290484, -0.5151854, -1.585329, 1, 1, 1, 1, 1,
-1.276671, 0.9723566, -0.8401273, 1, 1, 1, 1, 1,
-1.263184, -0.183543, -3.534781, 1, 1, 1, 1, 1,
-1.262253, -1.081719, -1.793972, 1, 1, 1, 1, 1,
-1.253293, -0.5256602, -1.963661, 1, 1, 1, 1, 1,
-1.245194, -1.295423, -1.67546, 1, 1, 1, 1, 1,
-1.242191, 0.0006855779, -1.716429, 1, 1, 1, 1, 1,
-1.241451, 0.03103659, -0.3686703, 1, 1, 1, 1, 1,
-1.237043, -0.1242237, -2.215702, 1, 1, 1, 1, 1,
-1.228667, 0.9027626, 1.024357, 1, 1, 1, 1, 1,
-1.223752, -0.1548695, -2.466071, 0, 0, 1, 1, 1,
-1.217353, -0.2409216, -1.939503, 1, 0, 0, 1, 1,
-1.196502, -1.599817, -2.795313, 1, 0, 0, 1, 1,
-1.194842, 0.7734901, -0.5762438, 1, 0, 0, 1, 1,
-1.193848, -1.343701, -2.106243, 1, 0, 0, 1, 1,
-1.192987, 0.6994392, 0.9392583, 1, 0, 0, 1, 1,
-1.190214, -0.07799955, -4.029328, 0, 0, 0, 1, 1,
-1.148446, -1.105345, -2.642641, 0, 0, 0, 1, 1,
-1.13848, 0.1349317, -0.03382394, 0, 0, 0, 1, 1,
-1.136565, -0.07342352, 0.01397953, 0, 0, 0, 1, 1,
-1.134368, 1.024463, 0.4802695, 0, 0, 0, 1, 1,
-1.128956, 0.4689699, -1.220432, 0, 0, 0, 1, 1,
-1.114314, 0.3516202, -1.57588, 0, 0, 0, 1, 1,
-1.099963, -1.011828, -0.4634139, 1, 1, 1, 1, 1,
-1.088596, 0.8263538, -1.139758, 1, 1, 1, 1, 1,
-1.07905, -2.089366, -1.575035, 1, 1, 1, 1, 1,
-1.069396, 0.6583657, -2.683686, 1, 1, 1, 1, 1,
-1.065307, 1.487272, -1.179646, 1, 1, 1, 1, 1,
-1.063515, -0.8099277, -2.241642, 1, 1, 1, 1, 1,
-1.055009, -1.511905, -1.066817, 1, 1, 1, 1, 1,
-1.04202, 0.7588298, -1.755598, 1, 1, 1, 1, 1,
-1.038114, 0.4031521, 0.2290767, 1, 1, 1, 1, 1,
-1.035513, -0.9162546, -2.408333, 1, 1, 1, 1, 1,
-1.032545, 0.7698811, -0.4155073, 1, 1, 1, 1, 1,
-1.031836, -1.407687, -2.318269, 1, 1, 1, 1, 1,
-1.023989, -1.275823, -0.3633943, 1, 1, 1, 1, 1,
-1.018199, -0.5122047, -3.978608, 1, 1, 1, 1, 1,
-1.016415, 0.9641123, -3.211953, 1, 1, 1, 1, 1,
-1.015633, 0.3044087, -1.683484, 0, 0, 1, 1, 1,
-1.014237, 0.9871193, 0.8481365, 1, 0, 0, 1, 1,
-1.01423, 0.7392775, 0.1567491, 1, 0, 0, 1, 1,
-0.9860985, 0.4513033, -1.311904, 1, 0, 0, 1, 1,
-0.9842017, 1.424042, -0.2097385, 1, 0, 0, 1, 1,
-0.9752534, -0.8125142, -2.488013, 1, 0, 0, 1, 1,
-0.9729874, 1.53023, 0.8179202, 0, 0, 0, 1, 1,
-0.9704145, 0.9926642, -2.184073, 0, 0, 0, 1, 1,
-0.9692442, 0.8588639, 0.2282089, 0, 0, 0, 1, 1,
-0.9654822, 0.9673022, -1.010972, 0, 0, 0, 1, 1,
-0.9584141, -1.377199, -2.728442, 0, 0, 0, 1, 1,
-0.9577956, -0.5073355, -1.60087, 0, 0, 0, 1, 1,
-0.9573101, 0.5112386, -2.630417, 0, 0, 0, 1, 1,
-0.9528927, -1.347972, -3.487618, 1, 1, 1, 1, 1,
-0.9451457, -0.6280658, -3.272212, 1, 1, 1, 1, 1,
-0.9405941, 0.6266981, -2.416985, 1, 1, 1, 1, 1,
-0.9340969, 0.629434, -0.7823731, 1, 1, 1, 1, 1,
-0.9307439, 0.6982352, -0.5874043, 1, 1, 1, 1, 1,
-0.928474, 0.6488383, -2.42837, 1, 1, 1, 1, 1,
-0.9282104, -1.310322, -2.874834, 1, 1, 1, 1, 1,
-0.9278494, -0.4850973, -2.500554, 1, 1, 1, 1, 1,
-0.9222056, -0.7829051, -2.661588, 1, 1, 1, 1, 1,
-0.9185675, 0.1148745, -3.735819, 1, 1, 1, 1, 1,
-0.9182427, -0.1667429, -2.233114, 1, 1, 1, 1, 1,
-0.9173116, 2.59908, -0.8044037, 1, 1, 1, 1, 1,
-0.905458, 0.7117254, -0.04112999, 1, 1, 1, 1, 1,
-0.8949352, 0.6428475, -0.234178, 1, 1, 1, 1, 1,
-0.8833069, -1.459007, -1.909681, 1, 1, 1, 1, 1,
-0.8828198, -0.1526202, -2.940111, 0, 0, 1, 1, 1,
-0.8816242, 0.7425256, -2.275336, 1, 0, 0, 1, 1,
-0.87808, -0.5742435, -1.285757, 1, 0, 0, 1, 1,
-0.8768803, -0.5729861, -3.419634, 1, 0, 0, 1, 1,
-0.8720801, 0.725603, 0.395263, 1, 0, 0, 1, 1,
-0.8594049, 1.264624, -1.543861, 1, 0, 0, 1, 1,
-0.8594044, 0.8306446, 0.3090417, 0, 0, 0, 1, 1,
-0.8552032, 0.7009522, -0.274739, 0, 0, 0, 1, 1,
-0.8513365, 0.6905102, -0.7670754, 0, 0, 0, 1, 1,
-0.8458048, -1.296763, -0.850628, 0, 0, 0, 1, 1,
-0.8427897, 0.3547701, 0.3702123, 0, 0, 0, 1, 1,
-0.8393991, -1.521089, -2.70498, 0, 0, 0, 1, 1,
-0.8377454, -0.2092898, -1.803544, 0, 0, 0, 1, 1,
-0.837334, -1.170388, -2.071688, 1, 1, 1, 1, 1,
-0.8367085, 1.015689, -0.9319528, 1, 1, 1, 1, 1,
-0.8254777, 1.20709, -0.3172026, 1, 1, 1, 1, 1,
-0.8252634, -0.5369852, -3.153746, 1, 1, 1, 1, 1,
-0.8224233, 0.3282238, -0.5306556, 1, 1, 1, 1, 1,
-0.820522, 0.7287518, -1.269409, 1, 1, 1, 1, 1,
-0.8145847, 1.28148, -2.552086, 1, 1, 1, 1, 1,
-0.8128389, 0.5597944, 0.5784778, 1, 1, 1, 1, 1,
-0.811229, 0.3108675, -1.986492, 1, 1, 1, 1, 1,
-0.8090053, -0.5846696, -1.831921, 1, 1, 1, 1, 1,
-0.803601, -0.2462813, -0.9346766, 1, 1, 1, 1, 1,
-0.8005275, -1.059015, -1.581765, 1, 1, 1, 1, 1,
-0.7907233, -0.3856949, -1.462248, 1, 1, 1, 1, 1,
-0.7901627, -0.3599764, -2.018812, 1, 1, 1, 1, 1,
-0.7893531, -0.08713667, -0.8993253, 1, 1, 1, 1, 1,
-0.7857938, 0.645221, -0.6248094, 0, 0, 1, 1, 1,
-0.78337, -0.4833003, -2.893221, 1, 0, 0, 1, 1,
-0.7827903, -0.6101491, -2.852118, 1, 0, 0, 1, 1,
-0.7796482, 0.4200794, -0.4740741, 1, 0, 0, 1, 1,
-0.7771227, -0.1596127, -0.507623, 1, 0, 0, 1, 1,
-0.7709892, 0.1507023, -2.456569, 1, 0, 0, 1, 1,
-0.769397, 0.4074744, -0.1244808, 0, 0, 0, 1, 1,
-0.7602108, -0.9786524, -2.88329, 0, 0, 0, 1, 1,
-0.7578701, 0.6939381, -0.7692394, 0, 0, 0, 1, 1,
-0.7560582, -0.8625019, -2.243283, 0, 0, 0, 1, 1,
-0.7553185, -0.7682689, -1.434153, 0, 0, 0, 1, 1,
-0.7537481, 1.681539, -0.5944673, 0, 0, 0, 1, 1,
-0.7490411, 0.3285586, -1.414767, 0, 0, 0, 1, 1,
-0.7417324, -0.1650698, -1.860372, 1, 1, 1, 1, 1,
-0.7412214, -0.7450521, -3.190034, 1, 1, 1, 1, 1,
-0.736701, -0.8464626, -1.129476, 1, 1, 1, 1, 1,
-0.7366102, 1.328483, -0.6877756, 1, 1, 1, 1, 1,
-0.7325159, -1.605209, -2.157699, 1, 1, 1, 1, 1,
-0.7288728, -0.8680504, -4.187636, 1, 1, 1, 1, 1,
-0.7261122, -1.827302, -2.782697, 1, 1, 1, 1, 1,
-0.7251399, 0.5827526, -2.334415, 1, 1, 1, 1, 1,
-0.7233929, -1.38765, -0.8566419, 1, 1, 1, 1, 1,
-0.7201002, 0.4422749, -1.205403, 1, 1, 1, 1, 1,
-0.718603, -0.7633185, -2.437157, 1, 1, 1, 1, 1,
-0.7181661, -0.6865327, -1.963825, 1, 1, 1, 1, 1,
-0.7157813, -1.028627, -2.703921, 1, 1, 1, 1, 1,
-0.71368, 1.037142, 0.2341599, 1, 1, 1, 1, 1,
-0.7132035, 0.2005526, 0.8134068, 1, 1, 1, 1, 1,
-0.7061824, 0.7907705, -0.01616269, 0, 0, 1, 1, 1,
-0.7043376, 1.919057, -0.1005208, 1, 0, 0, 1, 1,
-0.7036861, 0.5650687, 0.09192064, 1, 0, 0, 1, 1,
-0.7023116, 1.54688, 1.970676, 1, 0, 0, 1, 1,
-0.6968978, 1.295768, -0.6518577, 1, 0, 0, 1, 1,
-0.6945842, 1.188719, 0.3183183, 1, 0, 0, 1, 1,
-0.6864454, 1.309102, -1.571232, 0, 0, 0, 1, 1,
-0.6840634, -0.1364092, -2.317398, 0, 0, 0, 1, 1,
-0.6833441, -1.137549, -2.374464, 0, 0, 0, 1, 1,
-0.6758595, -0.6068333, -1.18005, 0, 0, 0, 1, 1,
-0.667777, 0.5155894, 0.8067798, 0, 0, 0, 1, 1,
-0.6655588, 0.8464641, 0.9580383, 0, 0, 0, 1, 1,
-0.6625059, 1.394673, 0.3537512, 0, 0, 0, 1, 1,
-0.65876, 0.184492, -1.332285, 1, 1, 1, 1, 1,
-0.6509162, -0.3350905, -2.457163, 1, 1, 1, 1, 1,
-0.6473473, 1.064867, -0.7288749, 1, 1, 1, 1, 1,
-0.6466218, -0.1954138, -0.8661122, 1, 1, 1, 1, 1,
-0.6460579, -0.2855574, -2.302443, 1, 1, 1, 1, 1,
-0.6444164, -0.5291938, -1.598035, 1, 1, 1, 1, 1,
-0.6424793, 0.6051001, -2.221061, 1, 1, 1, 1, 1,
-0.6403196, 0.4989691, -1.111893, 1, 1, 1, 1, 1,
-0.6395559, 0.6985186, -2.028157, 1, 1, 1, 1, 1,
-0.6376691, -0.4072071, -1.574034, 1, 1, 1, 1, 1,
-0.6368836, 0.08628263, -3.272496, 1, 1, 1, 1, 1,
-0.6289363, 0.4408926, -2.202399, 1, 1, 1, 1, 1,
-0.6288241, -0.9760733, -2.114632, 1, 1, 1, 1, 1,
-0.6241959, -0.9860194, -2.881451, 1, 1, 1, 1, 1,
-0.6211988, 0.327452, 0.6730484, 1, 1, 1, 1, 1,
-0.6206129, -2.087474, -4.204336, 0, 0, 1, 1, 1,
-0.6199239, 1.323352, 0.3815932, 1, 0, 0, 1, 1,
-0.6167907, -0.5357051, -2.635861, 1, 0, 0, 1, 1,
-0.616387, 0.6567745, -1.190119, 1, 0, 0, 1, 1,
-0.6117841, -1.908957, -2.616015, 1, 0, 0, 1, 1,
-0.6098556, 0.3148765, 0.227728, 1, 0, 0, 1, 1,
-0.6097338, 0.2564478, -2.526212, 0, 0, 0, 1, 1,
-0.6060024, -0.8704501, -1.105135, 0, 0, 0, 1, 1,
-0.6018929, 0.4754515, -0.1005437, 0, 0, 0, 1, 1,
-0.5976932, 0.2769201, 0.8255554, 0, 0, 0, 1, 1,
-0.5967463, 1.022435, 0.006168142, 0, 0, 0, 1, 1,
-0.5907508, 1.123256, -2.339628, 0, 0, 0, 1, 1,
-0.5882713, -0.1570042, -1.801539, 0, 0, 0, 1, 1,
-0.5853685, 0.7119406, -1.12963, 1, 1, 1, 1, 1,
-0.5846784, -0.4931502, -2.882743, 1, 1, 1, 1, 1,
-0.5834635, -1.390542, -2.070083, 1, 1, 1, 1, 1,
-0.5799725, 0.8163363, -1.550204, 1, 1, 1, 1, 1,
-0.5793732, 0.06779771, 0.4433468, 1, 1, 1, 1, 1,
-0.569739, -0.3641682, -1.682276, 1, 1, 1, 1, 1,
-0.5675749, 0.5650231, 0.2829627, 1, 1, 1, 1, 1,
-0.5673652, 0.7138609, -0.2118855, 1, 1, 1, 1, 1,
-0.5665492, 0.9639726, -0.3674988, 1, 1, 1, 1, 1,
-0.564178, -0.1649578, -0.3910155, 1, 1, 1, 1, 1,
-0.5622781, 0.1554238, -2.243289, 1, 1, 1, 1, 1,
-0.5611609, 1.187593, 0.6635644, 1, 1, 1, 1, 1,
-0.5603913, 0.4704599, -1.473332, 1, 1, 1, 1, 1,
-0.5597534, 1.082532, -0.058724, 1, 1, 1, 1, 1,
-0.552588, -1.497886, -3.325247, 1, 1, 1, 1, 1,
-0.5518338, 0.2272399, -0.2931317, 0, 0, 1, 1, 1,
-0.5496533, -0.4841801, -1.265166, 1, 0, 0, 1, 1,
-0.5475789, -0.06336931, -0.9518014, 1, 0, 0, 1, 1,
-0.5384185, -0.3436585, -3.224485, 1, 0, 0, 1, 1,
-0.5331098, -1.727503, -3.173947, 1, 0, 0, 1, 1,
-0.5328204, 0.02856224, -0.3464768, 1, 0, 0, 1, 1,
-0.5320888, -0.412802, -2.720849, 0, 0, 0, 1, 1,
-0.5318413, 2.019987, -0.4090977, 0, 0, 0, 1, 1,
-0.5306176, 0.583918, 0.5599442, 0, 0, 0, 1, 1,
-0.5306041, 0.2737844, -1.369138, 0, 0, 0, 1, 1,
-0.5296369, 1.194237, 0.9791732, 0, 0, 0, 1, 1,
-0.529095, -1.190936, -3.928644, 0, 0, 0, 1, 1,
-0.5274696, 0.1563047, -0.6321287, 0, 0, 0, 1, 1,
-0.5273697, 0.5403423, -1.887916, 1, 1, 1, 1, 1,
-0.5262576, 0.5423428, -0.4370892, 1, 1, 1, 1, 1,
-0.5261363, 0.514056, -1.862049, 1, 1, 1, 1, 1,
-0.5252783, 2.090969, 0.132599, 1, 1, 1, 1, 1,
-0.5242494, -0.09847417, -2.754462, 1, 1, 1, 1, 1,
-0.5238662, 0.6570559, -1.022361, 1, 1, 1, 1, 1,
-0.5226036, 1.439016, 0.651819, 1, 1, 1, 1, 1,
-0.5225525, 1.166194, -0.1695707, 1, 1, 1, 1, 1,
-0.5149785, -0.4519935, -2.904827, 1, 1, 1, 1, 1,
-0.5129767, 0.9009264, -1.867682, 1, 1, 1, 1, 1,
-0.5040966, -0.1007315, -0.3282131, 1, 1, 1, 1, 1,
-0.5032439, -0.2512962, -1.386068, 1, 1, 1, 1, 1,
-0.4980772, -0.7064688, -3.363991, 1, 1, 1, 1, 1,
-0.4969075, -1.375975, -1.62169, 1, 1, 1, 1, 1,
-0.4940385, -1.073786, -2.054419, 1, 1, 1, 1, 1,
-0.4934062, -1.687295, -3.265931, 0, 0, 1, 1, 1,
-0.4932496, -0.7384652, -0.9263141, 1, 0, 0, 1, 1,
-0.492033, 0.06312559, -2.272572, 1, 0, 0, 1, 1,
-0.4894681, 0.6328903, -0.9354427, 1, 0, 0, 1, 1,
-0.4865346, 0.2456615, -1.117247, 1, 0, 0, 1, 1,
-0.4831105, -0.6971631, -2.398075, 1, 0, 0, 1, 1,
-0.4820381, 0.1767743, -0.4752726, 0, 0, 0, 1, 1,
-0.4783604, 1.018801, -1.829425, 0, 0, 0, 1, 1,
-0.4734023, 1.997011, 0.1929954, 0, 0, 0, 1, 1,
-0.4725545, 0.4688254, -0.2935548, 0, 0, 0, 1, 1,
-0.468071, 1.293965, -1.840437, 0, 0, 0, 1, 1,
-0.4664192, 0.09350307, -1.240662, 0, 0, 0, 1, 1,
-0.4656815, -1.659079, -2.444674, 0, 0, 0, 1, 1,
-0.4640465, -0.1179658, -3.032983, 1, 1, 1, 1, 1,
-0.4591156, -0.5806513, -4.317826, 1, 1, 1, 1, 1,
-0.4572602, -0.111014, -2.929416, 1, 1, 1, 1, 1,
-0.4499483, -0.4176564, -0.4329284, 1, 1, 1, 1, 1,
-0.4481866, 0.02863643, -1.342354, 1, 1, 1, 1, 1,
-0.4477608, -0.005888743, -1.161364, 1, 1, 1, 1, 1,
-0.4454249, -0.6452563, -3.651855, 1, 1, 1, 1, 1,
-0.4393774, 1.563904, -2.499306, 1, 1, 1, 1, 1,
-0.4387721, -1.320586, -4.256426, 1, 1, 1, 1, 1,
-0.4345745, -1.994011, -4.537004, 1, 1, 1, 1, 1,
-0.4339555, -1.060175, -3.314166, 1, 1, 1, 1, 1,
-0.4329667, -1.545378, -2.218457, 1, 1, 1, 1, 1,
-0.427726, 0.7511304, -1.051345, 1, 1, 1, 1, 1,
-0.4276683, 0.1807156, -2.606181, 1, 1, 1, 1, 1,
-0.4253832, 0.09644941, -1.272855, 1, 1, 1, 1, 1,
-0.4206114, 0.303815, -1.809989, 0, 0, 1, 1, 1,
-0.4195492, 1.307534, 0.4606999, 1, 0, 0, 1, 1,
-0.4164548, 0.2174893, -1.653736, 1, 0, 0, 1, 1,
-0.4148734, -0.02090363, -1.023823, 1, 0, 0, 1, 1,
-0.4134915, 1.286916, 0.5611299, 1, 0, 0, 1, 1,
-0.4092764, -0.5159153, -3.537763, 1, 0, 0, 1, 1,
-0.4001633, -0.5222937, -2.412843, 0, 0, 0, 1, 1,
-0.3977658, -0.08797663, -0.6507556, 0, 0, 0, 1, 1,
-0.393537, 2.719686, 1.678344, 0, 0, 0, 1, 1,
-0.3927867, -0.7364419, -2.961375, 0, 0, 0, 1, 1,
-0.3905806, 1.445202, -0.0655254, 0, 0, 0, 1, 1,
-0.3887651, -0.4105288, -1.790341, 0, 0, 0, 1, 1,
-0.3874372, 0.0915696, -1.847725, 0, 0, 0, 1, 1,
-0.3849552, 0.8160059, -1.300922, 1, 1, 1, 1, 1,
-0.3808018, 0.4472371, -0.4826081, 1, 1, 1, 1, 1,
-0.3784889, 0.2206028, -0.2098885, 1, 1, 1, 1, 1,
-0.3783526, 0.756457, -0.8474191, 1, 1, 1, 1, 1,
-0.3776687, -0.4423425, -1.204013, 1, 1, 1, 1, 1,
-0.3746119, -0.4142512, -2.874176, 1, 1, 1, 1, 1,
-0.3735668, -0.4555749, -1.844201, 1, 1, 1, 1, 1,
-0.3726955, 0.8392822, -0.436941, 1, 1, 1, 1, 1,
-0.3703805, -0.1570565, -3.20606, 1, 1, 1, 1, 1,
-0.3671277, -0.140569, -0.9131651, 1, 1, 1, 1, 1,
-0.3669747, 0.7168279, 0.497355, 1, 1, 1, 1, 1,
-0.3637254, 0.006837233, 0.3110973, 1, 1, 1, 1, 1,
-0.3609445, 0.6948572, -0.3847116, 1, 1, 1, 1, 1,
-0.3603857, 0.59886, -2.058659, 1, 1, 1, 1, 1,
-0.3582844, -0.9220893, -4.549349, 1, 1, 1, 1, 1,
-0.3547343, 1.072366, 0.06738277, 0, 0, 1, 1, 1,
-0.3523671, 0.1969922, -1.659264, 1, 0, 0, 1, 1,
-0.3521811, 2.144137, 1.394816, 1, 0, 0, 1, 1,
-0.3507642, 0.9224034, -2.387961, 1, 0, 0, 1, 1,
-0.3506103, 0.1479962, 0.4564815, 1, 0, 0, 1, 1,
-0.3496308, -0.6096369, 0.01187026, 1, 0, 0, 1, 1,
-0.3484872, 0.5622457, -1.822959, 0, 0, 0, 1, 1,
-0.3482155, 1.791288, -0.3399223, 0, 0, 0, 1, 1,
-0.3460056, -1.486896, -2.779747, 0, 0, 0, 1, 1,
-0.3440238, -0.2230636, -3.537479, 0, 0, 0, 1, 1,
-0.3433636, 0.6706129, 0.4123645, 0, 0, 0, 1, 1,
-0.3372071, 1.021618, -0.6559038, 0, 0, 0, 1, 1,
-0.3335633, -0.8989603, -2.592896, 0, 0, 0, 1, 1,
-0.3304791, -2.576559, -4.352055, 1, 1, 1, 1, 1,
-0.3292164, 1.286819, 0.9219036, 1, 1, 1, 1, 1,
-0.3227947, 0.5554009, -1.436632, 1, 1, 1, 1, 1,
-0.3227409, -1.093516, -3.360919, 1, 1, 1, 1, 1,
-0.3116878, 0.3646999, -1.414984, 1, 1, 1, 1, 1,
-0.3079633, 1.160163, -1.182993, 1, 1, 1, 1, 1,
-0.3076587, -0.352923, -1.70566, 1, 1, 1, 1, 1,
-0.3053952, -0.03263117, -3.763722, 1, 1, 1, 1, 1,
-0.3039339, 0.08046366, -2.051151, 1, 1, 1, 1, 1,
-0.3038486, -0.101185, -0.7696757, 1, 1, 1, 1, 1,
-0.302751, 0.161885, -0.1191588, 1, 1, 1, 1, 1,
-0.3022249, 0.5447506, -1.678792, 1, 1, 1, 1, 1,
-0.2996715, 0.7097061, 1.467604, 1, 1, 1, 1, 1,
-0.2988525, 0.1904702, -2.411171, 1, 1, 1, 1, 1,
-0.2983033, -0.6841394, -2.510331, 1, 1, 1, 1, 1,
-0.2890239, -0.9685693, -3.051667, 0, 0, 1, 1, 1,
-0.2829324, -0.5064874, -1.046142, 1, 0, 0, 1, 1,
-0.2749964, -1.823103, -2.230739, 1, 0, 0, 1, 1,
-0.2742737, -0.1594482, -0.648458, 1, 0, 0, 1, 1,
-0.2733311, 0.08371045, -1.016267, 1, 0, 0, 1, 1,
-0.2730072, 0.9004505, 0.5270641, 1, 0, 0, 1, 1,
-0.2724039, -0.2502779, -1.575102, 0, 0, 0, 1, 1,
-0.2706652, -0.9671811, -3.04404, 0, 0, 0, 1, 1,
-0.2701374, 0.2029948, -0.007140044, 0, 0, 0, 1, 1,
-0.2667534, -1.938116, -3.299049, 0, 0, 0, 1, 1,
-0.2666429, 0.3157344, -1.046757, 0, 0, 0, 1, 1,
-0.2644501, -0.9817009, -3.335265, 0, 0, 0, 1, 1,
-0.2608961, -0.404534, -3.028552, 0, 0, 0, 1, 1,
-0.2589366, 0.7256176, 1.623425, 1, 1, 1, 1, 1,
-0.25627, -0.5625494, -4.997606, 1, 1, 1, 1, 1,
-0.2538073, -0.3868891, -2.672879, 1, 1, 1, 1, 1,
-0.2523995, 0.1749404, -0.3096416, 1, 1, 1, 1, 1,
-0.2518533, -0.3730898, -1.503959, 1, 1, 1, 1, 1,
-0.2483022, 2.071379, 1.584208, 1, 1, 1, 1, 1,
-0.2475258, 0.6781954, -0.119656, 1, 1, 1, 1, 1,
-0.2459765, -1.363445, -4.787533, 1, 1, 1, 1, 1,
-0.2456321, 2.919112, -0.3630928, 1, 1, 1, 1, 1,
-0.2430171, 1.401288, 0.0288772, 1, 1, 1, 1, 1,
-0.2429469, 0.8757959, -1.650741, 1, 1, 1, 1, 1,
-0.2399237, 0.02473063, -0.9074606, 1, 1, 1, 1, 1,
-0.2382306, -0.1662174, -2.856808, 1, 1, 1, 1, 1,
-0.23665, 1.591618, -0.1489513, 1, 1, 1, 1, 1,
-0.233207, 0.3870798, -0.6609824, 1, 1, 1, 1, 1,
-0.2308647, -1.591341, -2.995287, 0, 0, 1, 1, 1,
-0.2275747, -0.6149001, -2.627829, 1, 0, 0, 1, 1,
-0.2254248, -0.3599746, -5.019578, 1, 0, 0, 1, 1,
-0.2210805, -0.1645446, -1.268185, 1, 0, 0, 1, 1,
-0.2183936, 0.9236575, -0.02606403, 1, 0, 0, 1, 1,
-0.2111349, 0.1962612, -1.931244, 1, 0, 0, 1, 1,
-0.2066875, 0.8308559, 0.8116232, 0, 0, 0, 1, 1,
-0.2010919, -0.5967053, -2.03886, 0, 0, 0, 1, 1,
-0.2009514, 0.2286315, -1.158234, 0, 0, 0, 1, 1,
-0.1923626, 0.5274103, -1.303344, 0, 0, 0, 1, 1,
-0.185014, -0.2505648, -3.452724, 0, 0, 0, 1, 1,
-0.1837223, 1.926341, 0.9264626, 0, 0, 0, 1, 1,
-0.1770651, -0.7584203, -2.652618, 0, 0, 0, 1, 1,
-0.1749882, -1.07853, -3.240789, 1, 1, 1, 1, 1,
-0.1732667, -0.9511165, -3.210728, 1, 1, 1, 1, 1,
-0.1695554, -0.745443, -2.804686, 1, 1, 1, 1, 1,
-0.1675688, -1.83685, -1.831218, 1, 1, 1, 1, 1,
-0.1663499, 0.1677407, -1.91342, 1, 1, 1, 1, 1,
-0.1649927, -0.3239339, -1.761546, 1, 1, 1, 1, 1,
-0.1641195, -0.2580329, -2.692459, 1, 1, 1, 1, 1,
-0.1624994, 0.02182231, -2.716143, 1, 1, 1, 1, 1,
-0.1613886, 0.464386, 1.19061, 1, 1, 1, 1, 1,
-0.1596878, 0.4773855, 0.510648, 1, 1, 1, 1, 1,
-0.159441, 0.0535434, -1.321381, 1, 1, 1, 1, 1,
-0.1588294, -1.543282, -2.628127, 1, 1, 1, 1, 1,
-0.1541015, -2.279137, -2.009694, 1, 1, 1, 1, 1,
-0.1507066, -0.3792015, -2.287684, 1, 1, 1, 1, 1,
-0.1484783, 1.388441, 0.09560124, 1, 1, 1, 1, 1,
-0.1477073, -0.9293342, -3.371541, 0, 0, 1, 1, 1,
-0.1454009, -0.1224047, -3.711185, 1, 0, 0, 1, 1,
-0.1439929, 1.255767, -0.4531743, 1, 0, 0, 1, 1,
-0.1412762, 0.8607596, 0.7614612, 1, 0, 0, 1, 1,
-0.1390339, 0.5391662, -1.639407, 1, 0, 0, 1, 1,
-0.1381373, 0.6997582, 0.2426408, 1, 0, 0, 1, 1,
-0.1375023, 0.5271451, -0.7597997, 0, 0, 0, 1, 1,
-0.136686, 0.216045, -0.9816675, 0, 0, 0, 1, 1,
-0.1354105, -0.3205249, -3.790171, 0, 0, 0, 1, 1,
-0.1333085, -0.7916464, -4.747779, 0, 0, 0, 1, 1,
-0.1267604, 0.3766017, 2.038021, 0, 0, 0, 1, 1,
-0.1259899, 0.03063545, -0.5515634, 0, 0, 0, 1, 1,
-0.1259129, 0.5837594, 0.6254619, 0, 0, 0, 1, 1,
-0.1249756, 0.5445098, 0.1270987, 1, 1, 1, 1, 1,
-0.1207495, 0.9012415, 0.4042496, 1, 1, 1, 1, 1,
-0.1201983, 0.4796386, -0.538779, 1, 1, 1, 1, 1,
-0.1196891, 0.6082094, -0.3196405, 1, 1, 1, 1, 1,
-0.1193334, -0.4183411, -3.268248, 1, 1, 1, 1, 1,
-0.1129218, 0.8242104, 0.388635, 1, 1, 1, 1, 1,
-0.1080331, 0.03459004, -1.659054, 1, 1, 1, 1, 1,
-0.1067227, -0.02075767, -1.571729, 1, 1, 1, 1, 1,
-0.1061556, 0.1341607, 0.07656167, 1, 1, 1, 1, 1,
-0.1040213, -0.2414393, -2.614682, 1, 1, 1, 1, 1,
-0.1026909, -0.3861411, -2.216398, 1, 1, 1, 1, 1,
-0.1022938, -1.28904, -3.668097, 1, 1, 1, 1, 1,
-0.09671104, -0.2989005, -3.166465, 1, 1, 1, 1, 1,
-0.09504858, -1.333158, -2.764835, 1, 1, 1, 1, 1,
-0.09449264, -0.5266111, -3.039665, 1, 1, 1, 1, 1,
-0.09127616, 0.7983577, -0.5925761, 0, 0, 1, 1, 1,
-0.09039845, -0.8540246, -3.531574, 1, 0, 0, 1, 1,
-0.08434556, 0.3213039, -1.549097, 1, 0, 0, 1, 1,
-0.0839178, 1.071749, 0.786895, 1, 0, 0, 1, 1,
-0.08125706, 1.064541, 0.04981567, 1, 0, 0, 1, 1,
-0.08107448, -0.401004, -1.53871, 1, 0, 0, 1, 1,
-0.07809296, -0.6919509, -2.263791, 0, 0, 0, 1, 1,
-0.07751084, 0.2819939, -2.141346, 0, 0, 0, 1, 1,
-0.0765591, -0.7511817, -2.242888, 0, 0, 0, 1, 1,
-0.06909429, 1.320948, 1.205927, 0, 0, 0, 1, 1,
-0.06876754, -0.6035946, -2.942809, 0, 0, 0, 1, 1,
-0.06690818, 0.2385716, -0.3671713, 0, 0, 0, 1, 1,
-0.06675436, 0.2482885, -0.1459536, 0, 0, 0, 1, 1,
-0.06484721, 1.018043, -1.234891, 1, 1, 1, 1, 1,
-0.05835907, -0.03811768, -2.568521, 1, 1, 1, 1, 1,
-0.05832128, -0.1298106, -3.827687, 1, 1, 1, 1, 1,
-0.05502297, 0.7168077, 0.7448153, 1, 1, 1, 1, 1,
-0.05303416, -1.83845, -3.6154, 1, 1, 1, 1, 1,
-0.0517139, 0.3790547, 0.9558717, 1, 1, 1, 1, 1,
-0.05001971, 0.8025261, 0.4347786, 1, 1, 1, 1, 1,
-0.04013314, -1.952902, -3.335337, 1, 1, 1, 1, 1,
-0.03512763, -0.5168383, -2.451187, 1, 1, 1, 1, 1,
-0.025779, -0.486329, -4.43919, 1, 1, 1, 1, 1,
-0.02280139, 0.4073511, 0.3792129, 1, 1, 1, 1, 1,
-0.02061706, -0.4572148, -1.657731, 1, 1, 1, 1, 1,
-0.01943174, -0.5125558, -3.343284, 1, 1, 1, 1, 1,
-0.01923186, 0.1174578, -0.7153546, 1, 1, 1, 1, 1,
-0.01830001, -0.7411847, -3.251759, 1, 1, 1, 1, 1,
-0.01354782, -1.123094, -2.087658, 0, 0, 1, 1, 1,
-0.005154466, 0.5342411, -0.5334955, 1, 0, 0, 1, 1,
-0.001633338, 0.1060324, -0.5778413, 1, 0, 0, 1, 1,
0.003455582, 2.197066, 0.4175021, 1, 0, 0, 1, 1,
0.004721852, 0.3300161, 0.6632186, 1, 0, 0, 1, 1,
0.005962324, 2.034826, 0.7632118, 1, 0, 0, 1, 1,
0.008750308, -0.6180373, 3.248733, 0, 0, 0, 1, 1,
0.009060614, -1.553203, 2.049371, 0, 0, 0, 1, 1,
0.01048777, 0.9831917, -0.05010984, 0, 0, 0, 1, 1,
0.01349504, -0.5571647, 3.993586, 0, 0, 0, 1, 1,
0.01422243, -0.9109693, 2.721746, 0, 0, 0, 1, 1,
0.01437361, 0.8669373, 0.1634737, 0, 0, 0, 1, 1,
0.01477041, -1.605844, 4.812097, 0, 0, 0, 1, 1,
0.01498512, -0.4212779, 4.585433, 1, 1, 1, 1, 1,
0.01932059, -1.514401, 2.040308, 1, 1, 1, 1, 1,
0.02038291, -0.1024959, 3.431336, 1, 1, 1, 1, 1,
0.02341295, 0.995021, 0.1194635, 1, 1, 1, 1, 1,
0.02620444, -1.450561, 3.714639, 1, 1, 1, 1, 1,
0.02623097, -0.3181506, 3.754698, 1, 1, 1, 1, 1,
0.03543926, -0.7981956, 6.267073, 1, 1, 1, 1, 1,
0.03671799, -0.510599, 1.852951, 1, 1, 1, 1, 1,
0.04376419, -1.543213, 3.566274, 1, 1, 1, 1, 1,
0.04378017, 0.3028907, 1.192381, 1, 1, 1, 1, 1,
0.04524444, -0.3055503, 2.646301, 1, 1, 1, 1, 1,
0.05278356, 0.5299987, 1.508561, 1, 1, 1, 1, 1,
0.05303216, 0.4597575, 0.2802983, 1, 1, 1, 1, 1,
0.05680717, -1.516757, 3.682738, 1, 1, 1, 1, 1,
0.05695651, 1.229809, -0.6761688, 1, 1, 1, 1, 1,
0.05761047, -0.896584, 3.039153, 0, 0, 1, 1, 1,
0.05854604, 1.000683, 1.066464, 1, 0, 0, 1, 1,
0.05937125, 0.8440174, 1.593763, 1, 0, 0, 1, 1,
0.06891099, 0.6298062, 0.7321567, 1, 0, 0, 1, 1,
0.06915414, -0.8709643, 3.533318, 1, 0, 0, 1, 1,
0.0693535, -0.4540026, 2.850865, 1, 0, 0, 1, 1,
0.06939382, -0.704702, 3.854174, 0, 0, 0, 1, 1,
0.07082049, 1.615511, -1.014736, 0, 0, 0, 1, 1,
0.07335931, 0.1184104, 0.6380026, 0, 0, 0, 1, 1,
0.07436056, -0.1379409, 4.642003, 0, 0, 0, 1, 1,
0.07707325, -0.4937796, 3.034811, 0, 0, 0, 1, 1,
0.08059838, 0.01599572, 2.506359, 0, 0, 0, 1, 1,
0.0827919, 0.5363685, 1.138504, 0, 0, 0, 1, 1,
0.08303144, 0.6511289, -0.2945181, 1, 1, 1, 1, 1,
0.08515264, 0.2285349, 0.6845153, 1, 1, 1, 1, 1,
0.088736, -0.09414762, 2.576868, 1, 1, 1, 1, 1,
0.09451544, -1.63381, 4.091316, 1, 1, 1, 1, 1,
0.09625138, -0.9210036, 3.94582, 1, 1, 1, 1, 1,
0.1012626, -1.201895, 3.082751, 1, 1, 1, 1, 1,
0.1114562, -0.7089393, 4.56249, 1, 1, 1, 1, 1,
0.1134605, -0.3740486, 1.915511, 1, 1, 1, 1, 1,
0.1160263, 1.0361, 0.6206077, 1, 1, 1, 1, 1,
0.1184786, 1.144072, -3.110947, 1, 1, 1, 1, 1,
0.1201861, 0.5356573, 0.5715188, 1, 1, 1, 1, 1,
0.1231363, 0.4145875, 0.5378572, 1, 1, 1, 1, 1,
0.1329838, -0.07160515, 0.09435088, 1, 1, 1, 1, 1,
0.1346204, -1.311546, 2.430238, 1, 1, 1, 1, 1,
0.1365226, -0.04515937, 2.026011, 1, 1, 1, 1, 1,
0.138807, 0.7344917, -0.2748161, 0, 0, 1, 1, 1,
0.1437309, 0.7456188, 1.127631, 1, 0, 0, 1, 1,
0.1448095, 1.263482, -0.2082524, 1, 0, 0, 1, 1,
0.1470454, 1.251717, 0.4435012, 1, 0, 0, 1, 1,
0.1490044, 1.275228, -0.9321675, 1, 0, 0, 1, 1,
0.1502575, 0.4484242, -0.2353842, 1, 0, 0, 1, 1,
0.1518466, -0.5802324, 2.40786, 0, 0, 0, 1, 1,
0.1519454, -0.8897687, 4.70836, 0, 0, 0, 1, 1,
0.1525302, 0.9344152, -2.267169, 0, 0, 0, 1, 1,
0.1534394, 0.866401, 0.2039815, 0, 0, 0, 1, 1,
0.1578463, -0.5056401, 0.2065087, 0, 0, 0, 1, 1,
0.1589171, -0.002773626, 0.7842689, 0, 0, 0, 1, 1,
0.1657652, 0.8433457, 0.4460034, 0, 0, 0, 1, 1,
0.1665671, -1.429357, 4.067008, 1, 1, 1, 1, 1,
0.1672478, -0.1096274, 1.891164, 1, 1, 1, 1, 1,
0.168339, 0.3198105, 0.7410653, 1, 1, 1, 1, 1,
0.1757802, -0.2068848, 1.85732, 1, 1, 1, 1, 1,
0.1758334, -1.16433, 4.058718, 1, 1, 1, 1, 1,
0.1789449, 0.9009488, 0.577247, 1, 1, 1, 1, 1,
0.1792048, -0.9888854, 3.147531, 1, 1, 1, 1, 1,
0.1818693, -0.2914512, 2.78877, 1, 1, 1, 1, 1,
0.1820581, -0.05871716, 1.505884, 1, 1, 1, 1, 1,
0.183626, 0.1446407, 1.287416, 1, 1, 1, 1, 1,
0.1857325, 1.321637, -1.41009, 1, 1, 1, 1, 1,
0.1860154, 1.489699, -0.5777277, 1, 1, 1, 1, 1,
0.1871773, -0.01765185, -0.4392202, 1, 1, 1, 1, 1,
0.1884453, 0.2349835, -0.3715874, 1, 1, 1, 1, 1,
0.1954666, 0.1062207, 2.234755, 1, 1, 1, 1, 1,
0.1975272, -0.2126141, 2.563584, 0, 0, 1, 1, 1,
0.1994434, -1.484116, 4.396458, 1, 0, 0, 1, 1,
0.2004623, 0.6875752, 1.116721, 1, 0, 0, 1, 1,
0.2035946, 0.5884699, 1.952795, 1, 0, 0, 1, 1,
0.2057875, 1.372559, 0.2254555, 1, 0, 0, 1, 1,
0.2082611, -0.41059, 1.188815, 1, 0, 0, 1, 1,
0.216137, 0.5054487, 0.121235, 0, 0, 0, 1, 1,
0.2182136, 0.6513772, 0.2515152, 0, 0, 0, 1, 1,
0.2185479, 0.7730275, -0.5504602, 0, 0, 0, 1, 1,
0.2202543, 0.0128951, 2.498915, 0, 0, 0, 1, 1,
0.2276774, -1.198694, 2.174402, 0, 0, 0, 1, 1,
0.2335312, 0.1759604, 1.462892, 0, 0, 0, 1, 1,
0.237351, -0.6411334, 3.03315, 0, 0, 0, 1, 1,
0.2400731, -1.937155, 2.544633, 1, 1, 1, 1, 1,
0.2452435, -0.7873663, 3.044548, 1, 1, 1, 1, 1,
0.2464761, 0.572958, 0.2879919, 1, 1, 1, 1, 1,
0.2467969, -0.8307768, 2.206145, 1, 1, 1, 1, 1,
0.2482988, -0.6287581, 0.9523313, 1, 1, 1, 1, 1,
0.2483073, -2.443268, 2.455129, 1, 1, 1, 1, 1,
0.2517762, -1.116165, 2.182009, 1, 1, 1, 1, 1,
0.2548408, 0.713729, 1.133813, 1, 1, 1, 1, 1,
0.2554533, -0.3767038, 2.733917, 1, 1, 1, 1, 1,
0.2625151, 1.210443, 0.4297202, 1, 1, 1, 1, 1,
0.2675197, -0.5199693, 2.094156, 1, 1, 1, 1, 1,
0.2725919, -1.6227, 2.134942, 1, 1, 1, 1, 1,
0.2727335, -0.3020092, 2.54832, 1, 1, 1, 1, 1,
0.2762329, -1.046637, 5.011599, 1, 1, 1, 1, 1,
0.2772016, -0.4308945, 3.075836, 1, 1, 1, 1, 1,
0.2786377, -0.3135331, 3.100791, 0, 0, 1, 1, 1,
0.278995, -1.687635, 2.831926, 1, 0, 0, 1, 1,
0.2803725, 0.2358068, 2.190398, 1, 0, 0, 1, 1,
0.2823997, 2.233166, 0.5993528, 1, 0, 0, 1, 1,
0.288005, -0.2316586, 0.03051114, 1, 0, 0, 1, 1,
0.2889747, 0.4585573, -0.6352817, 1, 0, 0, 1, 1,
0.2892887, -0.7078193, 3.043517, 0, 0, 0, 1, 1,
0.293364, -0.1075811, 3.343895, 0, 0, 0, 1, 1,
0.3026979, 0.01829887, 1.437639, 0, 0, 0, 1, 1,
0.3040681, 1.639813, -0.07974579, 0, 0, 0, 1, 1,
0.304532, 1.339235, 1.311814, 0, 0, 0, 1, 1,
0.3131475, 0.254704, -0.2428295, 0, 0, 0, 1, 1,
0.3199959, -1.177867, 3.514408, 0, 0, 0, 1, 1,
0.3279139, -0.0131137, 2.039533, 1, 1, 1, 1, 1,
0.3307872, 0.1263316, 1.406794, 1, 1, 1, 1, 1,
0.3349728, -0.06279046, 2.106394, 1, 1, 1, 1, 1,
0.3412863, 1.047638, 1.096041, 1, 1, 1, 1, 1,
0.3415602, -0.4050801, 3.517916, 1, 1, 1, 1, 1,
0.3425204, -0.09399394, 2.140129, 1, 1, 1, 1, 1,
0.3428967, 1.225065, 2.185931, 1, 1, 1, 1, 1,
0.3526221, 0.1777949, 0.8361571, 1, 1, 1, 1, 1,
0.3530045, -0.4893638, 2.199486, 1, 1, 1, 1, 1,
0.353065, -1.008086, 2.647362, 1, 1, 1, 1, 1,
0.355553, -0.7694736, 1.781735, 1, 1, 1, 1, 1,
0.3559337, -0.6555985, 2.175441, 1, 1, 1, 1, 1,
0.3565548, 0.1878779, 2.00486, 1, 1, 1, 1, 1,
0.3579103, -0.7028549, 1.613312, 1, 1, 1, 1, 1,
0.3585642, 0.1154659, 1.517359, 1, 1, 1, 1, 1,
0.3597312, -0.2887232, 3.452528, 0, 0, 1, 1, 1,
0.3598575, -0.6341264, 1.594231, 1, 0, 0, 1, 1,
0.3636579, 0.6946646, -1.068273, 1, 0, 0, 1, 1,
0.3644824, 0.3094451, 0.1432893, 1, 0, 0, 1, 1,
0.3663609, 1.14575, 0.9780276, 1, 0, 0, 1, 1,
0.3688421, 1.008037, 1.075732, 1, 0, 0, 1, 1,
0.3690765, -0.1656955, 3.556278, 0, 0, 0, 1, 1,
0.3725407, 0.1999105, 1.462484, 0, 0, 0, 1, 1,
0.3743303, -0.2497834, 3.489407, 0, 0, 0, 1, 1,
0.3761943, -0.5325208, 2.887094, 0, 0, 0, 1, 1,
0.3774099, 0.1923325, -0.1553133, 0, 0, 0, 1, 1,
0.3794062, 0.2437166, 0.5871753, 0, 0, 0, 1, 1,
0.3806288, 0.8694617, -0.08966272, 0, 0, 0, 1, 1,
0.3835727, 1.033848, 1.139161, 1, 1, 1, 1, 1,
0.3850511, 0.8375925, 0.8900423, 1, 1, 1, 1, 1,
0.3859242, 0.4680015, 2.675954, 1, 1, 1, 1, 1,
0.3885582, 0.9657581, -0.4182387, 1, 1, 1, 1, 1,
0.3917696, 1.203068, 1.259834, 1, 1, 1, 1, 1,
0.394374, -1.503409, 0.695425, 1, 1, 1, 1, 1,
0.3962104, 1.290785, -0.800999, 1, 1, 1, 1, 1,
0.3962325, -0.6889554, 0.3161546, 1, 1, 1, 1, 1,
0.3975363, -0.1836638, 3.175385, 1, 1, 1, 1, 1,
0.4005327, 0.8943192, -1.55612, 1, 1, 1, 1, 1,
0.4056619, -0.2350795, 2.17956, 1, 1, 1, 1, 1,
0.408998, 0.2717355, 2.466525, 1, 1, 1, 1, 1,
0.4140668, -0.4297647, 4.737435, 1, 1, 1, 1, 1,
0.4146422, 0.1009, -0.2568002, 1, 1, 1, 1, 1,
0.4149657, 1.451861, -0.2085062, 1, 1, 1, 1, 1,
0.417371, 0.2627498, 1.599628, 0, 0, 1, 1, 1,
0.4197327, 0.2050534, 0.4800312, 1, 0, 0, 1, 1,
0.4210851, -1.042435, 3.215916, 1, 0, 0, 1, 1,
0.4232153, 0.4257589, 0.1250293, 1, 0, 0, 1, 1,
0.4233538, 0.2153244, 1.457221, 1, 0, 0, 1, 1,
0.4286898, 0.8944165, 2.284975, 1, 0, 0, 1, 1,
0.4288086, 1.823302, 0.06786816, 0, 0, 0, 1, 1,
0.4296145, 1.056068, 1.301568, 0, 0, 0, 1, 1,
0.4307437, -0.3742424, 2.183254, 0, 0, 0, 1, 1,
0.4315496, 0.1118253, 1.268713, 0, 0, 0, 1, 1,
0.433844, -0.07710978, 2.674028, 0, 0, 0, 1, 1,
0.4345827, -0.83369, 3.107253, 0, 0, 0, 1, 1,
0.440315, -0.9888495, 1.19986, 0, 0, 0, 1, 1,
0.4409736, 0.02266756, 1.391913, 1, 1, 1, 1, 1,
0.4423406, 0.7928603, -1.369882, 1, 1, 1, 1, 1,
0.4444823, 0.4192784, 0.5319042, 1, 1, 1, 1, 1,
0.4459416, 1.02789, -0.6956673, 1, 1, 1, 1, 1,
0.4461832, 0.2498862, -1.51208, 1, 1, 1, 1, 1,
0.450697, -1.320911, 4.654899, 1, 1, 1, 1, 1,
0.4517597, 0.1860541, 0.4424633, 1, 1, 1, 1, 1,
0.4526012, -1.479209, 4.652019, 1, 1, 1, 1, 1,
0.4580544, -0.4309047, 3.206818, 1, 1, 1, 1, 1,
0.4589778, -0.3385663, 1.891446, 1, 1, 1, 1, 1,
0.4606036, -0.301378, 1.359787, 1, 1, 1, 1, 1,
0.4618699, 0.1548144, 2.55655, 1, 1, 1, 1, 1,
0.4695726, -0.997156, 2.38133, 1, 1, 1, 1, 1,
0.4698632, -1.243956, 3.79994, 1, 1, 1, 1, 1,
0.4768339, -0.2214786, 1.4056, 1, 1, 1, 1, 1,
0.4843023, -0.5828365, 3.035893, 0, 0, 1, 1, 1,
0.4860529, 0.7846044, -0.5469511, 1, 0, 0, 1, 1,
0.4919424, 0.03046666, -0.6137108, 1, 0, 0, 1, 1,
0.4933648, 0.4565854, 1.028747, 1, 0, 0, 1, 1,
0.495117, 0.01884658, 2.131174, 1, 0, 0, 1, 1,
0.4981056, 0.4726013, -1.054363, 1, 0, 0, 1, 1,
0.5029693, -1.569108, 3.331939, 0, 0, 0, 1, 1,
0.5060466, 0.4689394, 0.5960285, 0, 0, 0, 1, 1,
0.5166408, -0.7893581, 1.307506, 0, 0, 0, 1, 1,
0.5180282, 0.003388932, 0.5615975, 0, 0, 0, 1, 1,
0.5224277, 0.7743413, 0.681938, 0, 0, 0, 1, 1,
0.525306, -1.62834, 1.693836, 0, 0, 0, 1, 1,
0.5328935, 0.3544773, 2.439473, 0, 0, 0, 1, 1,
0.5343069, -0.4598317, 2.448197, 1, 1, 1, 1, 1,
0.536711, 0.611904, 0.925637, 1, 1, 1, 1, 1,
0.5372852, -0.7520695, 3.422328, 1, 1, 1, 1, 1,
0.5394148, -0.6095519, 0.6263804, 1, 1, 1, 1, 1,
0.5398446, -0.8000504, 3.273557, 1, 1, 1, 1, 1,
0.5399818, 0.1834704, 0.5039502, 1, 1, 1, 1, 1,
0.5456384, -0.3024637, 2.185194, 1, 1, 1, 1, 1,
0.5471908, 0.5127542, -0.1982235, 1, 1, 1, 1, 1,
0.559618, -1.210443, 3.855591, 1, 1, 1, 1, 1,
0.559934, 1.25869, 0.7338338, 1, 1, 1, 1, 1,
0.5604658, 0.7568088, 0.2789415, 1, 1, 1, 1, 1,
0.5694554, 2.334151, 1.103305, 1, 1, 1, 1, 1,
0.5726939, -0.4470687, 2.888776, 1, 1, 1, 1, 1,
0.573466, 0.04540652, 2.895245, 1, 1, 1, 1, 1,
0.5752347, 0.9107785, 0.5290922, 1, 1, 1, 1, 1,
0.5767658, 0.01955063, 3.500038, 0, 0, 1, 1, 1,
0.5806076, -0.1099147, 3.479424, 1, 0, 0, 1, 1,
0.5811237, -0.1063746, 2.194184, 1, 0, 0, 1, 1,
0.5828911, 0.27031, 2.573745, 1, 0, 0, 1, 1,
0.5854369, -0.2006632, 2.615904, 1, 0, 0, 1, 1,
0.5871868, -0.7124876, 3.369436, 1, 0, 0, 1, 1,
0.5882885, -0.217812, 1.914028, 0, 0, 0, 1, 1,
0.594955, 1.487164, 0.7878325, 0, 0, 0, 1, 1,
0.5950093, 0.8635876, -0.03065735, 0, 0, 0, 1, 1,
0.5950471, 1.104051, 1.188631, 0, 0, 0, 1, 1,
0.5954915, -1.106987, 3.367867, 0, 0, 0, 1, 1,
0.599923, 1.470466, 0.72093, 0, 0, 0, 1, 1,
0.6061479, 0.04242323, 0.6091888, 0, 0, 0, 1, 1,
0.6091458, 0.984188, 2.276155, 1, 1, 1, 1, 1,
0.6127436, 0.5092334, 1.225491, 1, 1, 1, 1, 1,
0.6137509, -1.517792, 1.612002, 1, 1, 1, 1, 1,
0.61383, 0.1911978, 1.266953, 1, 1, 1, 1, 1,
0.6151115, 1.28431, -0.728656, 1, 1, 1, 1, 1,
0.616196, -1.654973, 1.164216, 1, 1, 1, 1, 1,
0.6168896, -0.3201669, 3.558724, 1, 1, 1, 1, 1,
0.6185957, -1.61742, 2.900119, 1, 1, 1, 1, 1,
0.619181, -2.24511, 2.244386, 1, 1, 1, 1, 1,
0.6269315, -0.3625067, 1.164029, 1, 1, 1, 1, 1,
0.6320786, -1.074413, 3.193434, 1, 1, 1, 1, 1,
0.6324105, 0.5941464, 1.547932, 1, 1, 1, 1, 1,
0.6363401, -0.7465203, 1.980898, 1, 1, 1, 1, 1,
0.6457762, 1.066427, 0.6045359, 1, 1, 1, 1, 1,
0.6494615, 0.1085134, 1.207642, 1, 1, 1, 1, 1,
0.6586863, -2.035024, 3.777579, 0, 0, 1, 1, 1,
0.6643922, -1.412247, 2.980208, 1, 0, 0, 1, 1,
0.6645064, 0.9277602, 0.2873794, 1, 0, 0, 1, 1,
0.6714378, 0.379032, 1.326442, 1, 0, 0, 1, 1,
0.6746227, -0.6931956, 2.642476, 1, 0, 0, 1, 1,
0.6754977, -0.139719, 1.085073, 1, 0, 0, 1, 1,
0.6768533, -0.146191, 2.028288, 0, 0, 0, 1, 1,
0.6773685, 0.1205392, -0.2852049, 0, 0, 0, 1, 1,
0.6813377, 0.4166421, 2.146319, 0, 0, 0, 1, 1,
0.6825997, 0.04559632, 0.6413643, 0, 0, 0, 1, 1,
0.6837122, -1.107289, 2.725936, 0, 0, 0, 1, 1,
0.6856547, 0.2164928, 1.651937, 0, 0, 0, 1, 1,
0.6883214, 0.7393088, 1.431438, 0, 0, 0, 1, 1,
0.6890881, 0.9475524, 0.8951904, 1, 1, 1, 1, 1,
0.6893862, -0.1814691, 1.361513, 1, 1, 1, 1, 1,
0.6899796, 1.585417, -0.5033074, 1, 1, 1, 1, 1,
0.6904275, -0.401286, 3.035283, 1, 1, 1, 1, 1,
0.6937564, -0.3803787, 1.812257, 1, 1, 1, 1, 1,
0.6958628, 1.433659, -0.08142468, 1, 1, 1, 1, 1,
0.697167, 0.6577109, -1.365276, 1, 1, 1, 1, 1,
0.701221, 0.6839722, 1.829541, 1, 1, 1, 1, 1,
0.7017478, 0.7929457, 0.42439, 1, 1, 1, 1, 1,
0.7054943, -0.8820817, 2.670786, 1, 1, 1, 1, 1,
0.7059425, -0.3168707, 2.143373, 1, 1, 1, 1, 1,
0.7102449, 0.9400753, 0.2486202, 1, 1, 1, 1, 1,
0.7183465, -1.533289, 2.863506, 1, 1, 1, 1, 1,
0.719104, 0.312433, 0.1892991, 1, 1, 1, 1, 1,
0.7207596, -0.2092407, 1.591954, 1, 1, 1, 1, 1,
0.7209459, -0.6399038, 2.974065, 0, 0, 1, 1, 1,
0.7221627, -1.07574, 4.222734, 1, 0, 0, 1, 1,
0.724175, -0.8401716, 5.033478, 1, 0, 0, 1, 1,
0.7315302, -1.510852, 1.910177, 1, 0, 0, 1, 1,
0.7366547, -0.6933011, 2.440416, 1, 0, 0, 1, 1,
0.7378762, 0.9665455, -0.3836212, 1, 0, 0, 1, 1,
0.7529626, 2.244421, 1.649038, 0, 0, 0, 1, 1,
0.7542907, -1.147151, 2.104637, 0, 0, 0, 1, 1,
0.7547596, 0.4821403, 1.611273, 0, 0, 0, 1, 1,
0.7551447, -0.3157161, 3.04046, 0, 0, 0, 1, 1,
0.7562643, -0.2505766, -0.005025622, 0, 0, 0, 1, 1,
0.7587579, -0.6143897, 1.141093, 0, 0, 0, 1, 1,
0.7621965, 2.701916, 1.664055, 0, 0, 0, 1, 1,
0.7649749, 0.515842, 1.120013, 1, 1, 1, 1, 1,
0.7662039, -1.289583, 2.470456, 1, 1, 1, 1, 1,
0.7691687, -0.2971546, 2.567888, 1, 1, 1, 1, 1,
0.7788984, -0.1793228, 2.987218, 1, 1, 1, 1, 1,
0.783062, -0.8741983, 3.192936, 1, 1, 1, 1, 1,
0.7832553, -1.565128, 2.518713, 1, 1, 1, 1, 1,
0.7870243, 1.160367, 1.489437, 1, 1, 1, 1, 1,
0.7881835, -0.4810529, 4.040035, 1, 1, 1, 1, 1,
0.7883407, 0.5398245, 0.5235377, 1, 1, 1, 1, 1,
0.7929634, -0.1678336, 1.987908, 1, 1, 1, 1, 1,
0.7964473, -0.07778941, 0.661127, 1, 1, 1, 1, 1,
0.7988099, 0.9968115, 1.774254, 1, 1, 1, 1, 1,
0.8016439, -0.5678713, 2.018383, 1, 1, 1, 1, 1,
0.8017663, 1.309789, 1.580699, 1, 1, 1, 1, 1,
0.8044583, 0.4421459, 0.4155474, 1, 1, 1, 1, 1,
0.806781, -0.1999796, 1.884776, 0, 0, 1, 1, 1,
0.8073331, -1.207349, 0.7528845, 1, 0, 0, 1, 1,
0.815493, -0.4240254, 1.793595, 1, 0, 0, 1, 1,
0.817629, -0.2132798, 3.458021, 1, 0, 0, 1, 1,
0.8185043, -1.44469, 2.402703, 1, 0, 0, 1, 1,
0.8217726, -1.036099, 1.043928, 1, 0, 0, 1, 1,
0.8236098, -0.04414672, -0.07437651, 0, 0, 0, 1, 1,
0.8238826, -0.8968447, 3.37389, 0, 0, 0, 1, 1,
0.827773, 1.9153, -0.05260571, 0, 0, 0, 1, 1,
0.8361714, 0.06143359, 1.564821, 0, 0, 0, 1, 1,
0.8384358, 0.5627893, 1.578922, 0, 0, 0, 1, 1,
0.8480267, -0.04682916, 0.6571625, 0, 0, 0, 1, 1,
0.848434, 0.7743807, 0.4933385, 0, 0, 0, 1, 1,
0.8505583, -0.2024461, 1.973165, 1, 1, 1, 1, 1,
0.8521762, 1.016668, 1.580347, 1, 1, 1, 1, 1,
0.8578922, -1.286016, 1.863534, 1, 1, 1, 1, 1,
0.8621482, -0.9514627, 2.472068, 1, 1, 1, 1, 1,
0.8688601, -0.2643518, 1.027138, 1, 1, 1, 1, 1,
0.8707601, -0.1114903, 2.58123, 1, 1, 1, 1, 1,
0.8815248, 1.882939, -0.205241, 1, 1, 1, 1, 1,
0.8907195, -0.1131287, 2.844459, 1, 1, 1, 1, 1,
0.8911158, 1.592932, 0.4999153, 1, 1, 1, 1, 1,
0.8912017, -0.1334825, 2.609704, 1, 1, 1, 1, 1,
0.9080479, 0.8309304, 0.6540447, 1, 1, 1, 1, 1,
0.9119169, 1.094056, -0.5819537, 1, 1, 1, 1, 1,
0.9166943, 0.2955828, 3.694712, 1, 1, 1, 1, 1,
0.9238585, 0.4231876, 1.164239, 1, 1, 1, 1, 1,
0.9303588, -0.9148299, 2.326915, 1, 1, 1, 1, 1,
0.9369442, 0.001943416, 2.25566, 0, 0, 1, 1, 1,
0.9381957, -0.7529253, 2.127781, 1, 0, 0, 1, 1,
0.9384734, -0.54769, 2.400311, 1, 0, 0, 1, 1,
0.9452395, -0.8075929, 2.337814, 1, 0, 0, 1, 1,
0.9472737, -0.8586388, 2.815287, 1, 0, 0, 1, 1,
0.956318, -1.758883, 2.262922, 1, 0, 0, 1, 1,
0.963864, 1.115207, -0.5064303, 0, 0, 0, 1, 1,
0.965066, 0.4715992, 1.638814, 0, 0, 0, 1, 1,
0.9671553, -0.1145599, 2.181635, 0, 0, 0, 1, 1,
0.9751448, 0.3466775, -0.02514046, 0, 0, 0, 1, 1,
0.9834366, 0.5911554, 2.697528, 0, 0, 0, 1, 1,
0.9879161, 0.07933936, 1.861981, 0, 0, 0, 1, 1,
1.002965, 1.4589, -2.368492, 0, 0, 0, 1, 1,
1.009495, -0.7502744, 2.755444, 1, 1, 1, 1, 1,
1.010421, -0.7577004, 1.43616, 1, 1, 1, 1, 1,
1.011614, 0.1219126, 0.5976, 1, 1, 1, 1, 1,
1.019848, -1.104561, 2.794923, 1, 1, 1, 1, 1,
1.026265, -1.285942, 4.181013, 1, 1, 1, 1, 1,
1.028174, -1.380672, 1.576033, 1, 1, 1, 1, 1,
1.03222, 0.1887136, 3.605375, 1, 1, 1, 1, 1,
1.034554, 0.211711, 1.571914, 1, 1, 1, 1, 1,
1.039374, 0.698019, 0.9461507, 1, 1, 1, 1, 1,
1.045218, 0.4000889, 0.7864214, 1, 1, 1, 1, 1,
1.0498, -0.757486, 3.749874, 1, 1, 1, 1, 1,
1.062455, 0.2422558, 1.833188, 1, 1, 1, 1, 1,
1.063479, -0.5768338, 1.93989, 1, 1, 1, 1, 1,
1.063979, -2.855779, 3.096091, 1, 1, 1, 1, 1,
1.064881, 0.5132082, 0.01602832, 1, 1, 1, 1, 1,
1.06604, -0.9050512, 2.219383, 0, 0, 1, 1, 1,
1.067403, 0.3919447, 1.043539, 1, 0, 0, 1, 1,
1.068468, -0.4981032, 2.254263, 1, 0, 0, 1, 1,
1.084464, -0.2754969, 2.186596, 1, 0, 0, 1, 1,
1.087907, -0.8354851, 2.746976, 1, 0, 0, 1, 1,
1.088274, -0.929053, 1.011052, 1, 0, 0, 1, 1,
1.099614, 0.08228177, -0.1360601, 0, 0, 0, 1, 1,
1.110449, 0.8558254, 1.63854, 0, 0, 0, 1, 1,
1.124533, -1.263877, 3.709597, 0, 0, 0, 1, 1,
1.126988, -0.7286612, 1.660732, 0, 0, 0, 1, 1,
1.129077, 1.791258, -1.118838, 0, 0, 0, 1, 1,
1.144237, -1.928712, 2.748892, 0, 0, 0, 1, 1,
1.145843, 1.767584, -0.0800492, 0, 0, 0, 1, 1,
1.152208, -0.296632, 2.546127, 1, 1, 1, 1, 1,
1.158618, -0.6855996, 1.355437, 1, 1, 1, 1, 1,
1.160989, -0.8178018, 2.482959, 1, 1, 1, 1, 1,
1.172976, -0.3184034, 1.600318, 1, 1, 1, 1, 1,
1.182263, 0.3491476, 1.772146, 1, 1, 1, 1, 1,
1.190982, 0.6762163, 1.20545, 1, 1, 1, 1, 1,
1.218764, 1.099175, 3.083147, 1, 1, 1, 1, 1,
1.223581, 2.566314, 2.901023, 1, 1, 1, 1, 1,
1.232659, 0.01784858, 0.4810962, 1, 1, 1, 1, 1,
1.233923, -0.4745709, 3.621797, 1, 1, 1, 1, 1,
1.237427, -1.588588, 2.399202, 1, 1, 1, 1, 1,
1.242506, 1.344384, -0.1031922, 1, 1, 1, 1, 1,
1.242899, 1.488454, -0.3433364, 1, 1, 1, 1, 1,
1.252192, 0.01306141, 2.633647, 1, 1, 1, 1, 1,
1.252633, 0.4700122, 0.1190448, 1, 1, 1, 1, 1,
1.253235, 0.7312227, 1.803475, 0, 0, 1, 1, 1,
1.254641, -0.1688508, 0.3151216, 1, 0, 0, 1, 1,
1.257848, -0.117452, 2.51268, 1, 0, 0, 1, 1,
1.259839, -0.1572941, 0.5711437, 1, 0, 0, 1, 1,
1.267531, -0.8411462, 1.928026, 1, 0, 0, 1, 1,
1.27193, 0.404595, 0.04363145, 1, 0, 0, 1, 1,
1.273811, -0.05159028, 1.253406, 0, 0, 0, 1, 1,
1.27681, -1.221199, 2.387255, 0, 0, 0, 1, 1,
1.283005, 0.951808, 0.408569, 0, 0, 0, 1, 1,
1.289386, -0.6788658, 0.5395558, 0, 0, 0, 1, 1,
1.305077, 0.4306561, 0.8346774, 0, 0, 0, 1, 1,
1.308831, 0.1537364, 2.983919, 0, 0, 0, 1, 1,
1.30919, 0.3322499, 2.448895, 0, 0, 0, 1, 1,
1.309354, 1.541772, 1.373128, 1, 1, 1, 1, 1,
1.310895, -1.025031, 2.955209, 1, 1, 1, 1, 1,
1.331386, -0.1061829, 0.2622906, 1, 1, 1, 1, 1,
1.331773, -0.9974189, 2.086863, 1, 1, 1, 1, 1,
1.332873, 1.054176, 0.4053902, 1, 1, 1, 1, 1,
1.333646, 1.053144, 2.069731, 1, 1, 1, 1, 1,
1.344933, -0.9881541, 2.701774, 1, 1, 1, 1, 1,
1.346869, 1.741772, -0.6878365, 1, 1, 1, 1, 1,
1.351352, -1.574771, 2.470776, 1, 1, 1, 1, 1,
1.364428, -0.671444, 1.631456, 1, 1, 1, 1, 1,
1.376455, 0.836154, -1.175981, 1, 1, 1, 1, 1,
1.404139, 0.1199602, 2.661912, 1, 1, 1, 1, 1,
1.413183, 2.057364, 0.3974094, 1, 1, 1, 1, 1,
1.415312, -1.536163, 2.189183, 1, 1, 1, 1, 1,
1.418212, -0.5569595, 0.9640773, 1, 1, 1, 1, 1,
1.42088, -0.3326883, 1.288321, 0, 0, 1, 1, 1,
1.425643, -0.4945247, 1.698381, 1, 0, 0, 1, 1,
1.429774, -0.2806529, -0.7450696, 1, 0, 0, 1, 1,
1.450066, -1.268606, 2.156701, 1, 0, 0, 1, 1,
1.471241, 0.4618774, 0.395395, 1, 0, 0, 1, 1,
1.475915, 0.624745, -0.113438, 1, 0, 0, 1, 1,
1.476788, -1.50206, 2.732157, 0, 0, 0, 1, 1,
1.478722, -0.5947865, 1.692896, 0, 0, 0, 1, 1,
1.495699, -0.6682056, 2.606637, 0, 0, 0, 1, 1,
1.50685, -0.5986132, 2.495479, 0, 0, 0, 1, 1,
1.51422, 2.356463, -0.02860222, 0, 0, 0, 1, 1,
1.521765, 0.1495038, 1.908867, 0, 0, 0, 1, 1,
1.524349, 0.05410208, 1.266572, 0, 0, 0, 1, 1,
1.533729, 1.564868, -0.3407201, 1, 1, 1, 1, 1,
1.538425, 0.136239, 0.2539256, 1, 1, 1, 1, 1,
1.545205, 1.197549, 1.804692, 1, 1, 1, 1, 1,
1.560399, -1.548447, 0.7594633, 1, 1, 1, 1, 1,
1.569596, -0.9687022, 1.2376, 1, 1, 1, 1, 1,
1.591175, 1.094435, -0.5435883, 1, 1, 1, 1, 1,
1.596276, 1.112179, 1.464051, 1, 1, 1, 1, 1,
1.599962, -0.5466028, 2.324244, 1, 1, 1, 1, 1,
1.618768, 0.03060398, 2.136212, 1, 1, 1, 1, 1,
1.621447, -1.580299, 2.736739, 1, 1, 1, 1, 1,
1.640063, 1.521026, 1.743185, 1, 1, 1, 1, 1,
1.649136, -0.4491525, 3.156603, 1, 1, 1, 1, 1,
1.659242, 0.426982, 0.1435579, 1, 1, 1, 1, 1,
1.667999, -0.742757, 0.4989859, 1, 1, 1, 1, 1,
1.679206, 0.9672254, -0.8928093, 1, 1, 1, 1, 1,
1.681383, 0.2740762, 2.520934, 0, 0, 1, 1, 1,
1.683409, -1.487856, 0.1669584, 1, 0, 0, 1, 1,
1.698521, 0.3786894, 1.018844, 1, 0, 0, 1, 1,
1.716157, -0.6685891, 0.5085632, 1, 0, 0, 1, 1,
1.780299, -0.1284739, 2.463527, 1, 0, 0, 1, 1,
1.781117, -0.6435502, 3.065131, 1, 0, 0, 1, 1,
1.788927, -0.9814577, 2.76725, 0, 0, 0, 1, 1,
1.793969, -0.5048181, 0.8924503, 0, 0, 0, 1, 1,
1.809773, 0.06808099, 1.189387, 0, 0, 0, 1, 1,
1.820049, -2.241225, 1.903286, 0, 0, 0, 1, 1,
1.825574, -0.7257994, 1.701875, 0, 0, 0, 1, 1,
1.83922, -0.8806582, 3.425669, 0, 0, 0, 1, 1,
1.849743, 0.2060984, 1.187233, 0, 0, 0, 1, 1,
1.851425, -1.025005, 1.495081, 1, 1, 1, 1, 1,
1.856975, 0.5337769, 1.553799, 1, 1, 1, 1, 1,
1.867321, -1.733561, 4.863598, 1, 1, 1, 1, 1,
1.879634, -0.6233901, 2.178491, 1, 1, 1, 1, 1,
1.88444, 0.1324368, 1.442026, 1, 1, 1, 1, 1,
1.926123, -0.02100031, 2.230419, 1, 1, 1, 1, 1,
1.990098, 0.2951638, 2.916086, 1, 1, 1, 1, 1,
2.011845, 0.06511403, 3.468245, 1, 1, 1, 1, 1,
2.014459, -1.225346, 1.201697, 1, 1, 1, 1, 1,
2.036187, -0.451619, -0.5588107, 1, 1, 1, 1, 1,
2.060771, -0.2131227, -0.2930191, 1, 1, 1, 1, 1,
2.067041, 0.01282259, 0.883646, 1, 1, 1, 1, 1,
2.088137, -0.9660545, 0.8130302, 1, 1, 1, 1, 1,
2.096865, -0.02828144, 2.098347, 1, 1, 1, 1, 1,
2.137123, -0.53993, 0.8090114, 1, 1, 1, 1, 1,
2.153322, -0.01359044, 3.567555, 0, 0, 1, 1, 1,
2.162937, -1.401398, 2.310963, 1, 0, 0, 1, 1,
2.169723, 0.327565, 2.371826, 1, 0, 0, 1, 1,
2.179982, 1.110963, 0.4022522, 1, 0, 0, 1, 1,
2.187983, -0.0459192, 1.074975, 1, 0, 0, 1, 1,
2.228752, -0.6744304, 2.427059, 1, 0, 0, 1, 1,
2.266382, -1.425503, 2.273039, 0, 0, 0, 1, 1,
2.293829, 0.8387129, 1.798527, 0, 0, 0, 1, 1,
2.296806, 2.264529, 0.3934645, 0, 0, 0, 1, 1,
2.330699, 0.2569846, 0.6427615, 0, 0, 0, 1, 1,
2.348751, -0.6477029, 2.604527, 0, 0, 0, 1, 1,
2.406264, 0.07382125, 1.844943, 0, 0, 0, 1, 1,
2.417399, 1.079507, 0.3117643, 0, 0, 0, 1, 1,
2.508464, -1.387874, 1.959667, 1, 1, 1, 1, 1,
2.554603, 1.017594, 0.3996426, 1, 1, 1, 1, 1,
2.63012, -0.2325334, 2.677892, 1, 1, 1, 1, 1,
2.722209, 0.9710537, 0.6368055, 1, 1, 1, 1, 1,
2.740341, -0.1658794, 1.281276, 1, 1, 1, 1, 1,
2.940716, -0.1899531, 3.722338, 1, 1, 1, 1, 1,
3.07123, 1.20122, 0.3813193, 1, 1, 1, 1, 1
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
var radius = 9.488705;
var distance = 33.32867;
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
mvMatrix.translate( -0.1771933, -0.03166664, -0.6237473 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.32867);
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
