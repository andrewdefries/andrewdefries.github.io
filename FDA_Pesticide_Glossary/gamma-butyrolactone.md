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
-3.183365, 0.1686825, -1.449712, 1, 0, 0, 1,
-3.032491, -0.4386343, -1.776487, 1, 0.007843138, 0, 1,
-2.729948, 1.76729, -1.322753, 1, 0.01176471, 0, 1,
-2.701346, -1.049433, -2.566124, 1, 0.01960784, 0, 1,
-2.695537, -0.3693248, -1.78189, 1, 0.02352941, 0, 1,
-2.683032, 0.5068852, -1.209342, 1, 0.03137255, 0, 1,
-2.610351, 0.7446188, 0.1112333, 1, 0.03529412, 0, 1,
-2.417788, 1.140803, -3.556632, 1, 0.04313726, 0, 1,
-2.320364, -1.041669, -3.006477, 1, 0.04705882, 0, 1,
-2.316757, -0.3695849, -1.002559, 1, 0.05490196, 0, 1,
-2.157652, -1.226289, -2.987625, 1, 0.05882353, 0, 1,
-2.152698, -0.5590783, -1.312654, 1, 0.06666667, 0, 1,
-2.127445, 0.0978351, -0.8765712, 1, 0.07058824, 0, 1,
-2.113749, 1.075697, -0.9175051, 1, 0.07843138, 0, 1,
-2.008527, 0.8799895, -0.6893211, 1, 0.08235294, 0, 1,
-1.964637, 0.4332427, -0.3426332, 1, 0.09019608, 0, 1,
-1.949088, 0.6008115, -1.384218, 1, 0.09411765, 0, 1,
-1.927872, -1.070038, -1.986832, 1, 0.1019608, 0, 1,
-1.91954, 1.787145, -1.992357, 1, 0.1098039, 0, 1,
-1.914877, -0.2735868, -0.937344, 1, 0.1137255, 0, 1,
-1.902714, 0.4882756, -1.168704, 1, 0.1215686, 0, 1,
-1.888787, 0.7554569, -1.930043, 1, 0.1254902, 0, 1,
-1.875948, -1.290719, -1.368544, 1, 0.1333333, 0, 1,
-1.873025, -0.5795847, -1.498253, 1, 0.1372549, 0, 1,
-1.872383, 0.9856448, 0.1688633, 1, 0.145098, 0, 1,
-1.867788, 0.8162585, -2.56603, 1, 0.1490196, 0, 1,
-1.857206, 0.02648178, -4.065606, 1, 0.1568628, 0, 1,
-1.837756, -0.03898788, -2.439239, 1, 0.1607843, 0, 1,
-1.83492, -0.2885672, -3.452158, 1, 0.1686275, 0, 1,
-1.822, 0.6003774, -1.319619, 1, 0.172549, 0, 1,
-1.806827, 0.9983516, 0.4984409, 1, 0.1803922, 0, 1,
-1.792121, 0.6786734, -0.5093105, 1, 0.1843137, 0, 1,
-1.772492, 1.916695, -2.61537, 1, 0.1921569, 0, 1,
-1.734781, -0.3537214, -1.988029, 1, 0.1960784, 0, 1,
-1.732547, -0.5002819, -2.310333, 1, 0.2039216, 0, 1,
-1.72603, 0.7761488, -3.141986, 1, 0.2117647, 0, 1,
-1.719068, 1.238264, -0.1790651, 1, 0.2156863, 0, 1,
-1.718032, -0.4712275, -2.909399, 1, 0.2235294, 0, 1,
-1.705441, -0.02456578, 1.020363, 1, 0.227451, 0, 1,
-1.693723, 1.01643, -2.369944, 1, 0.2352941, 0, 1,
-1.693045, -0.8455051, -3.336717, 1, 0.2392157, 0, 1,
-1.675678, 0.3306848, -0.2999062, 1, 0.2470588, 0, 1,
-1.656602, 0.4840803, -2.36673, 1, 0.2509804, 0, 1,
-1.653002, -0.4848119, -0.7449817, 1, 0.2588235, 0, 1,
-1.633013, -1.136393, -0.5649574, 1, 0.2627451, 0, 1,
-1.626196, -0.522181, -1.227804, 1, 0.2705882, 0, 1,
-1.571962, 0.8283051, -0.536139, 1, 0.2745098, 0, 1,
-1.5662, -0.3360808, -1.527118, 1, 0.282353, 0, 1,
-1.561002, -0.09119586, -2.78984, 1, 0.2862745, 0, 1,
-1.559971, 0.08260781, -3.767455, 1, 0.2941177, 0, 1,
-1.554878, 1.029475, 0.3876651, 1, 0.3019608, 0, 1,
-1.553333, 0.1544748, -1.256928, 1, 0.3058824, 0, 1,
-1.548229, 0.6462247, 0.4781084, 1, 0.3137255, 0, 1,
-1.537668, -0.5577229, -3.671048, 1, 0.3176471, 0, 1,
-1.530065, -0.4596793, -2.003395, 1, 0.3254902, 0, 1,
-1.516793, 0.4823022, -2.415275, 1, 0.3294118, 0, 1,
-1.514609, -0.233637, -2.793018, 1, 0.3372549, 0, 1,
-1.514247, 1.358423, -1.489513, 1, 0.3411765, 0, 1,
-1.501045, 0.2858751, -1.196086, 1, 0.3490196, 0, 1,
-1.488241, -1.077699, -1.040207, 1, 0.3529412, 0, 1,
-1.471962, -0.9581721, -2.363875, 1, 0.3607843, 0, 1,
-1.470458, -1.50927, -3.873332, 1, 0.3647059, 0, 1,
-1.468247, -1.02093, -2.290789, 1, 0.372549, 0, 1,
-1.456289, -0.9734864, -1.875637, 1, 0.3764706, 0, 1,
-1.446797, -0.2883123, -1.692801, 1, 0.3843137, 0, 1,
-1.444518, 0.6013374, -1.479465, 1, 0.3882353, 0, 1,
-1.44147, -0.2992412, -1.99576, 1, 0.3960784, 0, 1,
-1.436112, -0.6528485, -0.431035, 1, 0.4039216, 0, 1,
-1.425125, -0.6882927, -1.817125, 1, 0.4078431, 0, 1,
-1.419182, 1.531768, 0.5312618, 1, 0.4156863, 0, 1,
-1.415225, -0.4275288, -1.322954, 1, 0.4196078, 0, 1,
-1.394645, 1.030128, -1.337124, 1, 0.427451, 0, 1,
-1.394479, 0.7177811, -1.930472, 1, 0.4313726, 0, 1,
-1.392126, -0.01026959, -2.843422, 1, 0.4392157, 0, 1,
-1.387502, 0.2996545, -1.018234, 1, 0.4431373, 0, 1,
-1.380587, -0.7286858, -1.273617, 1, 0.4509804, 0, 1,
-1.362107, 0.2902977, -1.444369, 1, 0.454902, 0, 1,
-1.360612, -1.334908, -2.798153, 1, 0.4627451, 0, 1,
-1.359803, -1.172718, -1.93633, 1, 0.4666667, 0, 1,
-1.359282, 1.06168, -0.1760804, 1, 0.4745098, 0, 1,
-1.350344, 0.9856092, 0.04360184, 1, 0.4784314, 0, 1,
-1.349551, 0.6717302, -3.401445, 1, 0.4862745, 0, 1,
-1.342141, 0.3487782, -0.9044048, 1, 0.4901961, 0, 1,
-1.339647, -1.464775, -1.998476, 1, 0.4980392, 0, 1,
-1.334051, -0.2743737, -2.481588, 1, 0.5058824, 0, 1,
-1.332548, -1.347614, -0.3849323, 1, 0.509804, 0, 1,
-1.32406, -0.3877146, -3.132036, 1, 0.5176471, 0, 1,
-1.309569, 0.8499938, -0.9012093, 1, 0.5215687, 0, 1,
-1.294689, 0.5432235, -2.766034, 1, 0.5294118, 0, 1,
-1.294034, 2.162098, -0.5821564, 1, 0.5333334, 0, 1,
-1.282974, -0.1065022, -2.950502, 1, 0.5411765, 0, 1,
-1.262447, 0.454869, -1.87248, 1, 0.5450981, 0, 1,
-1.259889, 0.7560246, -0.4326774, 1, 0.5529412, 0, 1,
-1.227874, 1.307532, -1.04272, 1, 0.5568628, 0, 1,
-1.222328, 0.4858798, -1.342977, 1, 0.5647059, 0, 1,
-1.220049, 0.5908087, -1.105095, 1, 0.5686275, 0, 1,
-1.216735, -0.5067059, -3.181878, 1, 0.5764706, 0, 1,
-1.213998, 0.5549107, -0.3848927, 1, 0.5803922, 0, 1,
-1.206798, 0.1994879, -2.056387, 1, 0.5882353, 0, 1,
-1.204236, 0.5110866, 0.9378883, 1, 0.5921569, 0, 1,
-1.200561, 0.9440478, -1.996321, 1, 0.6, 0, 1,
-1.194454, 0.5308732, -1.166917, 1, 0.6078432, 0, 1,
-1.185732, -1.022306, -4.937864, 1, 0.6117647, 0, 1,
-1.183411, -0.3613391, -2.579448, 1, 0.6196079, 0, 1,
-1.178772, 0.963919, -1.42856, 1, 0.6235294, 0, 1,
-1.173386, -0.3050106, -2.035619, 1, 0.6313726, 0, 1,
-1.164071, 1.591347, -0.8708462, 1, 0.6352941, 0, 1,
-1.162194, 0.4009739, -1.093445, 1, 0.6431373, 0, 1,
-1.153159, 0.488399, -0.5273203, 1, 0.6470588, 0, 1,
-1.14325, 1.747986, -1.319273, 1, 0.654902, 0, 1,
-1.14093, -1.908845, -3.65752, 1, 0.6588235, 0, 1,
-1.138054, -1.797541, -2.271354, 1, 0.6666667, 0, 1,
-1.130759, 0.003045425, -0.2190587, 1, 0.6705883, 0, 1,
-1.130486, -0.6024796, -1.166216, 1, 0.6784314, 0, 1,
-1.129404, -0.8270888, -0.03961761, 1, 0.682353, 0, 1,
-1.123441, 0.6358591, -0.9178783, 1, 0.6901961, 0, 1,
-1.115888, 1.014945, -2.899723, 1, 0.6941177, 0, 1,
-1.114123, -0.6371077, -3.187194, 1, 0.7019608, 0, 1,
-1.110172, -1.103667, -2.268796, 1, 0.7098039, 0, 1,
-1.110072, -1.947248, -3.10533, 1, 0.7137255, 0, 1,
-1.109659, -0.4765492, -1.617478, 1, 0.7215686, 0, 1,
-1.100599, 1.56378, -1.338011, 1, 0.7254902, 0, 1,
-1.083183, 1.049317, -2.199023, 1, 0.7333333, 0, 1,
-1.080873, -0.1177294, -3.251932, 1, 0.7372549, 0, 1,
-1.074306, 0.7073583, -1.851419, 1, 0.7450981, 0, 1,
-1.067695, 0.06749732, -1.234969, 1, 0.7490196, 0, 1,
-1.061142, 1.670153, -0.1287241, 1, 0.7568628, 0, 1,
-1.054113, 0.05556472, -1.91848, 1, 0.7607843, 0, 1,
-1.051797, 0.2583217, -2.264853, 1, 0.7686275, 0, 1,
-1.049457, 0.1123242, -1.972078, 1, 0.772549, 0, 1,
-1.036248, 1.098625, 0.4882652, 1, 0.7803922, 0, 1,
-1.035738, -1.609933, -3.030249, 1, 0.7843137, 0, 1,
-1.035398, -0.0512338, -1.172112, 1, 0.7921569, 0, 1,
-1.034822, -1.798598, -2.349422, 1, 0.7960784, 0, 1,
-1.032284, 1.031628, -0.8968372, 1, 0.8039216, 0, 1,
-1.032282, 1.008332, 1.165718, 1, 0.8117647, 0, 1,
-1.029502, 0.4525284, 0.1325001, 1, 0.8156863, 0, 1,
-1.013955, 0.8182822, -0.8190281, 1, 0.8235294, 0, 1,
-1.008659, 0.07819376, -3.067708, 1, 0.827451, 0, 1,
-1.008151, -0.6901231, -2.95174, 1, 0.8352941, 0, 1,
-1.007383, 0.5990189, -2.278457, 1, 0.8392157, 0, 1,
-1.002369, -0.4939466, -3.181833, 1, 0.8470588, 0, 1,
-0.9955267, -1.309957, -2.68788, 1, 0.8509804, 0, 1,
-0.992465, -1.531125, -3.748357, 1, 0.8588235, 0, 1,
-0.9897812, 0.185538, -3.220344, 1, 0.8627451, 0, 1,
-0.9893692, -1.545137, -1.619065, 1, 0.8705882, 0, 1,
-0.9767265, -0.7939689, -2.254419, 1, 0.8745098, 0, 1,
-0.9754108, -0.9118016, -5.503902, 1, 0.8823529, 0, 1,
-0.9734073, 0.3112839, -0.08434235, 1, 0.8862745, 0, 1,
-0.9727219, -1.889984, -2.39176, 1, 0.8941177, 0, 1,
-0.9571996, 0.5008432, 0.2221156, 1, 0.8980392, 0, 1,
-0.9563461, -3.542233e-05, -1.692777, 1, 0.9058824, 0, 1,
-0.9500516, -2.358276, -2.501422, 1, 0.9137255, 0, 1,
-0.9442921, 1.287373, -0.1847191, 1, 0.9176471, 0, 1,
-0.9421429, -0.05922053, -2.259639, 1, 0.9254902, 0, 1,
-0.9342143, 0.04649058, -2.334621, 1, 0.9294118, 0, 1,
-0.9304359, -1.461593, -1.614395, 1, 0.9372549, 0, 1,
-0.9271638, -0.3028402, -2.760353, 1, 0.9411765, 0, 1,
-0.9145992, 2.59021, -0.7007809, 1, 0.9490196, 0, 1,
-0.9123071, 0.2843048, -1.045652, 1, 0.9529412, 0, 1,
-0.9010066, -2.483615, -1.893039, 1, 0.9607843, 0, 1,
-0.9006354, -0.9880589, 1.116371, 1, 0.9647059, 0, 1,
-0.899436, 0.4049042, -2.675903, 1, 0.972549, 0, 1,
-0.8993072, -1.401846, -1.115729, 1, 0.9764706, 0, 1,
-0.897388, 1.022171, -1.134736, 1, 0.9843137, 0, 1,
-0.8939379, -0.3361337, -2.79246, 1, 0.9882353, 0, 1,
-0.8888832, 0.08286361, -1.501652, 1, 0.9960784, 0, 1,
-0.8822551, 1.856774, 1.287009, 0.9960784, 1, 0, 1,
-0.8786916, 0.5648014, -0.302969, 0.9921569, 1, 0, 1,
-0.8764742, 1.688133, -1.870753, 0.9843137, 1, 0, 1,
-0.8730398, -0.9926348, -3.79625, 0.9803922, 1, 0, 1,
-0.8588791, -0.5643938, -3.655081, 0.972549, 1, 0, 1,
-0.8549351, -0.5643301, -1.638535, 0.9686275, 1, 0, 1,
-0.8540098, -0.1776257, -0.7691057, 0.9607843, 1, 0, 1,
-0.8538154, -1.183622, -2.370698, 0.9568627, 1, 0, 1,
-0.8477842, -0.7261519, -1.869992, 0.9490196, 1, 0, 1,
-0.8464867, 0.7212539, 0.2588921, 0.945098, 1, 0, 1,
-0.8463987, -0.1154235, -2.330949, 0.9372549, 1, 0, 1,
-0.8394772, -1.018091, -2.886987, 0.9333333, 1, 0, 1,
-0.838245, -1.216197, -1.624193, 0.9254902, 1, 0, 1,
-0.8376002, 1.462895, -0.1824445, 0.9215686, 1, 0, 1,
-0.8369699, 0.4447612, 0.5742366, 0.9137255, 1, 0, 1,
-0.8314551, -0.217425, -0.96286, 0.9098039, 1, 0, 1,
-0.8302195, 1.482052, -0.8435413, 0.9019608, 1, 0, 1,
-0.8234904, 0.344889, -2.253132, 0.8941177, 1, 0, 1,
-0.8216211, -0.2425153, -0.5338883, 0.8901961, 1, 0, 1,
-0.8206751, 0.7235416, 0.3943518, 0.8823529, 1, 0, 1,
-0.8081045, 0.3735754, -0.01708246, 0.8784314, 1, 0, 1,
-0.803044, -0.6029102, -4.103051, 0.8705882, 1, 0, 1,
-0.8007716, 0.2397094, -1.546876, 0.8666667, 1, 0, 1,
-0.7983067, -0.5568876, -1.99241, 0.8588235, 1, 0, 1,
-0.7958359, 0.3473839, -2.38788, 0.854902, 1, 0, 1,
-0.7944867, 1.205183, -2.69238, 0.8470588, 1, 0, 1,
-0.7904236, 0.7179097, -1.915361, 0.8431373, 1, 0, 1,
-0.7818828, -0.1746051, -2.404681, 0.8352941, 1, 0, 1,
-0.7778566, 1.449347, -1.84687, 0.8313726, 1, 0, 1,
-0.7775505, -1.411974, -1.242662, 0.8235294, 1, 0, 1,
-0.7772225, 0.8695673, -0.7963488, 0.8196079, 1, 0, 1,
-0.7770981, -0.2539586, -1.455414, 0.8117647, 1, 0, 1,
-0.7696232, -0.05444096, -0.7556729, 0.8078431, 1, 0, 1,
-0.7649768, 0.1902279, -2.088941, 0.8, 1, 0, 1,
-0.7632851, 1.013366, 0.1929905, 0.7921569, 1, 0, 1,
-0.7564795, -0.2386145, -1.619018, 0.7882353, 1, 0, 1,
-0.7508652, 0.4850344, -1.433692, 0.7803922, 1, 0, 1,
-0.7496735, -0.1306773, -1.662274, 0.7764706, 1, 0, 1,
-0.7413582, 0.4521718, -0.8904632, 0.7686275, 1, 0, 1,
-0.7407073, 1.149684, -1.250691, 0.7647059, 1, 0, 1,
-0.7370989, -0.2630224, -1.187038, 0.7568628, 1, 0, 1,
-0.7354007, -0.5258762, -1.248329, 0.7529412, 1, 0, 1,
-0.7303789, 0.1043576, -1.371265, 0.7450981, 1, 0, 1,
-0.7284406, 0.9703269, -0.4696089, 0.7411765, 1, 0, 1,
-0.7251519, -0.7451559, -1.28341, 0.7333333, 1, 0, 1,
-0.7248992, -1.114453, -3.61777, 0.7294118, 1, 0, 1,
-0.7204587, -1.782161, -2.823498, 0.7215686, 1, 0, 1,
-0.7193575, 0.8052082, 3.002261, 0.7176471, 1, 0, 1,
-0.7139397, -0.6713773, -2.670771, 0.7098039, 1, 0, 1,
-0.7133299, -0.1793453, -2.239351, 0.7058824, 1, 0, 1,
-0.7044126, -1.039405, -3.242779, 0.6980392, 1, 0, 1,
-0.7040781, 0.09109837, -2.872051, 0.6901961, 1, 0, 1,
-0.7026448, 1.417967, -0.2840356, 0.6862745, 1, 0, 1,
-0.7025032, -0.001175605, -2.134201, 0.6784314, 1, 0, 1,
-0.7018738, -0.4947565, -1.300393, 0.6745098, 1, 0, 1,
-0.6994, 0.6742505, -1.124176, 0.6666667, 1, 0, 1,
-0.699365, -0.4430573, -2.240381, 0.6627451, 1, 0, 1,
-0.6937659, -0.3095398, -2.145863, 0.654902, 1, 0, 1,
-0.6907024, 0.1179014, -2.761158, 0.6509804, 1, 0, 1,
-0.6892643, -1.473641, -0.9145762, 0.6431373, 1, 0, 1,
-0.6882711, 0.3669259, -1.391251, 0.6392157, 1, 0, 1,
-0.6876228, -0.3417558, -1.244515, 0.6313726, 1, 0, 1,
-0.6839259, 0.2754011, -1.441238, 0.627451, 1, 0, 1,
-0.6830957, 0.8225098, -0.7589492, 0.6196079, 1, 0, 1,
-0.6815755, -1.149325, -1.86782, 0.6156863, 1, 0, 1,
-0.6785665, 1.227558, 1.219253, 0.6078432, 1, 0, 1,
-0.6775385, -0.7948596, -4.115588, 0.6039216, 1, 0, 1,
-0.6772501, 1.327323, -1.2139, 0.5960785, 1, 0, 1,
-0.677195, 1.099014, 1.021458, 0.5882353, 1, 0, 1,
-0.6763664, 0.8323931, -0.2063872, 0.5843138, 1, 0, 1,
-0.6719956, -0.1470711, -2.544479, 0.5764706, 1, 0, 1,
-0.6654509, -1.392489, -3.185638, 0.572549, 1, 0, 1,
-0.6485983, 0.7323396, 0.02967005, 0.5647059, 1, 0, 1,
-0.6476789, 0.5445524, -0.41188, 0.5607843, 1, 0, 1,
-0.6473987, -0.5368521, -2.578874, 0.5529412, 1, 0, 1,
-0.6447811, 1.095014, -2.300311, 0.5490196, 1, 0, 1,
-0.6422108, -0.03650342, -2.47588, 0.5411765, 1, 0, 1,
-0.6412354, 0.3060639, -2.926828, 0.5372549, 1, 0, 1,
-0.639681, -0.4462506, -2.93218, 0.5294118, 1, 0, 1,
-0.6324508, 1.302132, 0.580673, 0.5254902, 1, 0, 1,
-0.6272146, -0.4164495, -1.827241, 0.5176471, 1, 0, 1,
-0.6244224, 0.2409808, -2.266993, 0.5137255, 1, 0, 1,
-0.6150772, 0.2658806, 0.3321477, 0.5058824, 1, 0, 1,
-0.609545, -2.136328, -1.945361, 0.5019608, 1, 0, 1,
-0.6090044, -0.5197075, -1.361628, 0.4941176, 1, 0, 1,
-0.6088758, -0.1257807, -2.358986, 0.4862745, 1, 0, 1,
-0.6078491, -0.2612501, -2.484664, 0.4823529, 1, 0, 1,
-0.6066623, -1.482924, -2.87139, 0.4745098, 1, 0, 1,
-0.6028829, -1.553959, -2.458658, 0.4705882, 1, 0, 1,
-0.6003641, 1.702049, -0.09457233, 0.4627451, 1, 0, 1,
-0.5981698, -0.07785674, -0.8162174, 0.4588235, 1, 0, 1,
-0.5957279, 0.1082193, -3.63205, 0.4509804, 1, 0, 1,
-0.594852, 0.9191598, -1.286637, 0.4470588, 1, 0, 1,
-0.5934286, 0.002074308, -2.30599, 0.4392157, 1, 0, 1,
-0.5915849, -0.8325858, -2.431323, 0.4352941, 1, 0, 1,
-0.5868806, 0.7730178, -0.6476247, 0.427451, 1, 0, 1,
-0.579438, -0.4954362, -2.567432, 0.4235294, 1, 0, 1,
-0.5755342, -0.9450563, -0.7716013, 0.4156863, 1, 0, 1,
-0.5705831, -0.8802796, -1.677673, 0.4117647, 1, 0, 1,
-0.5703912, -0.2798965, -1.507122, 0.4039216, 1, 0, 1,
-0.5528991, -0.08980745, -2.700537, 0.3960784, 1, 0, 1,
-0.5508361, 1.307456, -1.294113, 0.3921569, 1, 0, 1,
-0.5472338, -0.2789259, -3.266622, 0.3843137, 1, 0, 1,
-0.5384606, 0.242877, -1.738721, 0.3803922, 1, 0, 1,
-0.5379397, 0.8161135, -0.4371811, 0.372549, 1, 0, 1,
-0.5369918, 0.1369359, -0.4073241, 0.3686275, 1, 0, 1,
-0.5282944, -0.5968241, -1.298868, 0.3607843, 1, 0, 1,
-0.5280919, 0.8513251, -0.5383353, 0.3568628, 1, 0, 1,
-0.5255538, -0.258461, -1.953695, 0.3490196, 1, 0, 1,
-0.5200159, 1.157279, 0.5777668, 0.345098, 1, 0, 1,
-0.5110592, -0.2175097, -4.283644, 0.3372549, 1, 0, 1,
-0.5053569, 0.4557691, -1.729844, 0.3333333, 1, 0, 1,
-0.5036845, -0.8387055, -1.486824, 0.3254902, 1, 0, 1,
-0.502678, 0.4826353, -2.164452, 0.3215686, 1, 0, 1,
-0.5015193, -0.3443263, -1.253678, 0.3137255, 1, 0, 1,
-0.5009395, -0.2168897, -0.2790244, 0.3098039, 1, 0, 1,
-0.4988481, 0.717785, -2.400524, 0.3019608, 1, 0, 1,
-0.4916637, -0.07359552, -2.937717, 0.2941177, 1, 0, 1,
-0.4903694, -1.134987, -1.567298, 0.2901961, 1, 0, 1,
-0.4885994, 2.029099, -0.1998848, 0.282353, 1, 0, 1,
-0.4883331, 0.4948741, -0.5809035, 0.2784314, 1, 0, 1,
-0.4874381, -1.336794, -2.147902, 0.2705882, 1, 0, 1,
-0.4870577, -1.300498, -3.988555, 0.2666667, 1, 0, 1,
-0.4829417, -0.9520493, -1.115048, 0.2588235, 1, 0, 1,
-0.4824398, 0.5411688, -0.5688714, 0.254902, 1, 0, 1,
-0.4818249, -0.1163294, -0.9301167, 0.2470588, 1, 0, 1,
-0.4816394, -0.1343785, -0.5260091, 0.2431373, 1, 0, 1,
-0.4806964, 0.07549484, -0.751703, 0.2352941, 1, 0, 1,
-0.4753099, -0.6387127, -1.489388, 0.2313726, 1, 0, 1,
-0.4750871, -0.1287754, -2.105071, 0.2235294, 1, 0, 1,
-0.473906, -0.1265333, -1.506115, 0.2196078, 1, 0, 1,
-0.4731718, -0.2560805, -2.387752, 0.2117647, 1, 0, 1,
-0.4713591, 1.458946, -0.5487749, 0.2078431, 1, 0, 1,
-0.4682555, 1.583162, -1.429621, 0.2, 1, 0, 1,
-0.468053, 0.2429842, -1.688053, 0.1921569, 1, 0, 1,
-0.4672839, 0.8693077, -0.6332247, 0.1882353, 1, 0, 1,
-0.4644799, -0.2622454, -0.9513264, 0.1803922, 1, 0, 1,
-0.4625319, 0.7712879, 0.2355084, 0.1764706, 1, 0, 1,
-0.462064, -1.62414, -2.715189, 0.1686275, 1, 0, 1,
-0.4586035, -0.6408542, -3.837954, 0.1647059, 1, 0, 1,
-0.4578127, -1.623946, -3.2226, 0.1568628, 1, 0, 1,
-0.4572288, 0.6209291, -0.5527741, 0.1529412, 1, 0, 1,
-0.456906, -1.234657, -2.912125, 0.145098, 1, 0, 1,
-0.4565159, -0.938204, -1.248008, 0.1411765, 1, 0, 1,
-0.4544149, 0.2638008, -1.572446, 0.1333333, 1, 0, 1,
-0.4519067, -0.4561277, -3.05925, 0.1294118, 1, 0, 1,
-0.4451403, 1.952109, -1.722642, 0.1215686, 1, 0, 1,
-0.442971, 2.5668, 0.4969169, 0.1176471, 1, 0, 1,
-0.4341115, -1.39804, -1.578275, 0.1098039, 1, 0, 1,
-0.4330313, 0.7138385, -0.1112094, 0.1058824, 1, 0, 1,
-0.4285503, -1.057289, -1.939419, 0.09803922, 1, 0, 1,
-0.4234802, 0.4291409, -1.008415, 0.09019608, 1, 0, 1,
-0.4232923, 0.1899488, -1.187565, 0.08627451, 1, 0, 1,
-0.423187, -0.8558743, -2.657735, 0.07843138, 1, 0, 1,
-0.421666, -1.404684, -1.793877, 0.07450981, 1, 0, 1,
-0.419743, -0.8707709, -4.168358, 0.06666667, 1, 0, 1,
-0.4192663, 1.114538, -0.3546157, 0.0627451, 1, 0, 1,
-0.4190238, 0.6550113, 0.116612, 0.05490196, 1, 0, 1,
-0.4122308, 0.05832275, -3.291185, 0.05098039, 1, 0, 1,
-0.4111593, 1.458892, -1.434916, 0.04313726, 1, 0, 1,
-0.4061366, -0.699369, -4.518157, 0.03921569, 1, 0, 1,
-0.4059928, 1.569524, 0.07265572, 0.03137255, 1, 0, 1,
-0.4055013, -0.1270698, 0.3755952, 0.02745098, 1, 0, 1,
-0.397737, 2.647459, -1.149064, 0.01960784, 1, 0, 1,
-0.3910732, -0.6244692, -4.225297, 0.01568628, 1, 0, 1,
-0.3830267, 1.154164, -0.4698438, 0.007843138, 1, 0, 1,
-0.3740115, 0.01407709, -2.710266, 0.003921569, 1, 0, 1,
-0.3722216, -0.9469133, -1.177896, 0, 1, 0.003921569, 1,
-0.3657415, 0.9020237, 0.04404576, 0, 1, 0.01176471, 1,
-0.365191, 1.78026, -1.807921, 0, 1, 0.01568628, 1,
-0.3600622, 0.5650657, 0.1474928, 0, 1, 0.02352941, 1,
-0.3578699, 0.2891679, -1.868393, 0, 1, 0.02745098, 1,
-0.3513338, -0.2116975, -1.950125, 0, 1, 0.03529412, 1,
-0.3398277, 0.3800579, 0.0857967, 0, 1, 0.03921569, 1,
-0.3382832, -0.8422658, -4.27436, 0, 1, 0.04705882, 1,
-0.3374845, 1.209284, 1.237906, 0, 1, 0.05098039, 1,
-0.3369905, 0.6786939, -0.1710421, 0, 1, 0.05882353, 1,
-0.3344395, -0.126976, -2.264275, 0, 1, 0.0627451, 1,
-0.3256552, -0.5065603, -4.362177, 0, 1, 0.07058824, 1,
-0.3249542, -0.03434503, -1.894491, 0, 1, 0.07450981, 1,
-0.3244076, -1.020412, -4.102182, 0, 1, 0.08235294, 1,
-0.3221978, 0.3089432, 0.06103421, 0, 1, 0.08627451, 1,
-0.3177949, 0.2028745, -0.1073816, 0, 1, 0.09411765, 1,
-0.3086678, -1.088148, -3.975781, 0, 1, 0.1019608, 1,
-0.3040703, -0.4915976, -3.34134, 0, 1, 0.1058824, 1,
-0.292589, 1.832581, -0.591201, 0, 1, 0.1137255, 1,
-0.2924686, -0.7553685, -1.437876, 0, 1, 0.1176471, 1,
-0.2783586, -0.8930445, -4.220356, 0, 1, 0.1254902, 1,
-0.2715194, -0.5007411, -2.346295, 0, 1, 0.1294118, 1,
-0.2708288, -1.517239, -2.929368, 0, 1, 0.1372549, 1,
-0.2645304, 0.4240446, -1.176778, 0, 1, 0.1411765, 1,
-0.2622581, -1.115832, -3.382547, 0, 1, 0.1490196, 1,
-0.2601296, 0.6508865, -0.8568421, 0, 1, 0.1529412, 1,
-0.2483106, -1.529708, -1.076222, 0, 1, 0.1607843, 1,
-0.2435211, 0.5652701, -0.08028311, 0, 1, 0.1647059, 1,
-0.240958, -2.12919, -5.286165, 0, 1, 0.172549, 1,
-0.2355357, -0.1700166, -2.009358, 0, 1, 0.1764706, 1,
-0.2353068, -0.3303035, -3.274312, 0, 1, 0.1843137, 1,
-0.231654, 1.350274, -0.8439209, 0, 1, 0.1882353, 1,
-0.2316095, -1.159992, -3.315935, 0, 1, 0.1960784, 1,
-0.2297665, 0.1597406, 0.3368789, 0, 1, 0.2039216, 1,
-0.2296716, 1.111767, -0.6578594, 0, 1, 0.2078431, 1,
-0.2189897, 0.4761977, -1.957405, 0, 1, 0.2156863, 1,
-0.2189682, -0.3786513, -3.289463, 0, 1, 0.2196078, 1,
-0.2179969, -0.03925149, -1.402271, 0, 1, 0.227451, 1,
-0.2135875, -1.005951, -3.481897, 0, 1, 0.2313726, 1,
-0.2129976, -0.1475184, -2.774481, 0, 1, 0.2392157, 1,
-0.2098159, 0.159887, 0.5346689, 0, 1, 0.2431373, 1,
-0.2091152, 0.2760252, -1.441096, 0, 1, 0.2509804, 1,
-0.2086792, -1.300384, -2.524821, 0, 1, 0.254902, 1,
-0.2086095, -0.8421986, -4.408127, 0, 1, 0.2627451, 1,
-0.2007353, 1.118488, -1.01686, 0, 1, 0.2666667, 1,
-0.1963347, 0.08036575, -1.433212, 0, 1, 0.2745098, 1,
-0.1946386, 1.60903, 0.3429744, 0, 1, 0.2784314, 1,
-0.1944843, 1.005664, 1.181754, 0, 1, 0.2862745, 1,
-0.1937561, 1.388916, 1.528898, 0, 1, 0.2901961, 1,
-0.1868601, 1.433887, 0.7762287, 0, 1, 0.2980392, 1,
-0.1755645, -1.144017, -4.70182, 0, 1, 0.3058824, 1,
-0.1654652, 0.5764347, -0.282547, 0, 1, 0.3098039, 1,
-0.1610604, -0.5202122, -2.415465, 0, 1, 0.3176471, 1,
-0.1607551, 1.512678, -1.344534, 0, 1, 0.3215686, 1,
-0.1576955, -0.6173875, -5.497175, 0, 1, 0.3294118, 1,
-0.1565679, -0.5380276, -2.264934, 0, 1, 0.3333333, 1,
-0.1557446, 0.4567918, -0.08560771, 0, 1, 0.3411765, 1,
-0.1551348, -1.642801, -2.104678, 0, 1, 0.345098, 1,
-0.1508288, -0.3546928, -5.126269, 0, 1, 0.3529412, 1,
-0.1503584, -0.6631836, -1.757868, 0, 1, 0.3568628, 1,
-0.1469911, 1.69624, 0.1540498, 0, 1, 0.3647059, 1,
-0.1469051, -0.5335651, -4.001893, 0, 1, 0.3686275, 1,
-0.1458489, -0.2759448, -2.857486, 0, 1, 0.3764706, 1,
-0.1440221, 0.6372719, 0.8390259, 0, 1, 0.3803922, 1,
-0.140388, 0.6003183, -0.8648567, 0, 1, 0.3882353, 1,
-0.1388045, -0.9420583, -0.8135486, 0, 1, 0.3921569, 1,
-0.1386033, -0.02568238, -1.078922, 0, 1, 0.4, 1,
-0.1370688, 0.1452592, -2.20923, 0, 1, 0.4078431, 1,
-0.1323029, 0.1797147, -1.036079, 0, 1, 0.4117647, 1,
-0.1315691, 0.7575511, -0.2211615, 0, 1, 0.4196078, 1,
-0.1312951, -0.8279679, -2.465845, 0, 1, 0.4235294, 1,
-0.1310971, -1.373379, -4.113025, 0, 1, 0.4313726, 1,
-0.1306468, -0.8853785, -2.677471, 0, 1, 0.4352941, 1,
-0.129773, -1.660386, -1.917216, 0, 1, 0.4431373, 1,
-0.1207571, 0.02996629, -1.057099, 0, 1, 0.4470588, 1,
-0.1187238, 1.415437, -0.7490849, 0, 1, 0.454902, 1,
-0.1160582, 1.681675, 0.2552596, 0, 1, 0.4588235, 1,
-0.1116543, 0.5758497, 0.1596347, 0, 1, 0.4666667, 1,
-0.1116308, 0.8960599, -0.1307544, 0, 1, 0.4705882, 1,
-0.1093383, -0.6168507, -3.820435, 0, 1, 0.4784314, 1,
-0.1079038, -0.28446, -2.996142, 0, 1, 0.4823529, 1,
-0.1040967, 1.215079, 0.5305863, 0, 1, 0.4901961, 1,
-0.1030278, 0.4565346, -1.955805, 0, 1, 0.4941176, 1,
-0.09707521, 0.3971676, 0.5802916, 0, 1, 0.5019608, 1,
-0.09647886, 0.9160602, -1.0885, 0, 1, 0.509804, 1,
-0.0937347, -0.006705329, 0.3340432, 0, 1, 0.5137255, 1,
-0.0881719, 1.12991, -1.611626, 0, 1, 0.5215687, 1,
-0.08635265, -0.8271306, -3.566919, 0, 1, 0.5254902, 1,
-0.0855392, -0.02140456, -2.911406, 0, 1, 0.5333334, 1,
-0.08100469, -0.2680313, -0.7881883, 0, 1, 0.5372549, 1,
-0.07987968, -0.1777231, -1.520499, 0, 1, 0.5450981, 1,
-0.07916658, 0.4521514, -1.552082, 0, 1, 0.5490196, 1,
-0.07639419, -0.1154024, -4.142076, 0, 1, 0.5568628, 1,
-0.07089942, 0.1249353, -1.90152, 0, 1, 0.5607843, 1,
-0.06896641, 0.6095796, 0.6362548, 0, 1, 0.5686275, 1,
-0.06575413, -0.4242196, -4.107026, 0, 1, 0.572549, 1,
-0.06206443, 1.170023, -1.388135, 0, 1, 0.5803922, 1,
-0.05788988, 0.04962367, -0.4549693, 0, 1, 0.5843138, 1,
-0.05683479, -0.84641, -3.11625, 0, 1, 0.5921569, 1,
-0.05389374, 0.916826, -1.42317, 0, 1, 0.5960785, 1,
-0.05190831, 0.2688887, 0.918302, 0, 1, 0.6039216, 1,
-0.05064761, 0.7245618, 1.674396, 0, 1, 0.6117647, 1,
-0.04726354, -1.000318, -3.088731, 0, 1, 0.6156863, 1,
-0.04572221, 0.9138225, -0.4233107, 0, 1, 0.6235294, 1,
-0.04131804, 0.8881014, 1.95588, 0, 1, 0.627451, 1,
-0.03905104, 0.003925527, -2.550425, 0, 1, 0.6352941, 1,
-0.03868908, 1.70317, -0.07319878, 0, 1, 0.6392157, 1,
-0.03837372, -2.181713, -1.896324, 0, 1, 0.6470588, 1,
-0.03569769, -0.5845858, -1.813167, 0, 1, 0.6509804, 1,
-0.03548183, 0.01720391, -1.12522, 0, 1, 0.6588235, 1,
-0.02930094, 0.1229483, -2.102912, 0, 1, 0.6627451, 1,
-0.02879113, 0.9587442, -0.9053401, 0, 1, 0.6705883, 1,
-0.02728267, -0.8849822, -2.805821, 0, 1, 0.6745098, 1,
-0.02559718, -0.8375286, -2.349999, 0, 1, 0.682353, 1,
-0.02526991, -1.179432, -4.119079, 0, 1, 0.6862745, 1,
-0.02097764, -0.7617446, -3.36495, 0, 1, 0.6941177, 1,
-0.02041262, -1.111579, -1.660277, 0, 1, 0.7019608, 1,
-0.01964539, -0.1921322, -3.744147, 0, 1, 0.7058824, 1,
-0.01920568, -0.6213219, -3.175173, 0, 1, 0.7137255, 1,
-0.01258395, -0.1551258, -1.791184, 0, 1, 0.7176471, 1,
-0.009640977, 0.3661406, -0.8603989, 0, 1, 0.7254902, 1,
-0.008312557, -0.7231085, -3.638804, 0, 1, 0.7294118, 1,
-0.001765982, 0.3438729, -1.262896, 0, 1, 0.7372549, 1,
0.0002976756, -0.5771516, 2.1549, 0, 1, 0.7411765, 1,
0.001180163, 1.124012, -0.4024698, 0, 1, 0.7490196, 1,
0.001536893, 0.05817547, 0.8612484, 0, 1, 0.7529412, 1,
0.007793369, -1.861925, 2.9358, 0, 1, 0.7607843, 1,
0.01006409, -1.038177, 3.041244, 0, 1, 0.7647059, 1,
0.01334654, 0.6723943, 0.591614, 0, 1, 0.772549, 1,
0.01407792, 1.732159, 0.4622663, 0, 1, 0.7764706, 1,
0.01482085, 0.7454413, -0.8464013, 0, 1, 0.7843137, 1,
0.01584491, 1.462746, -0.07081565, 0, 1, 0.7882353, 1,
0.01942708, -1.028304, 3.055541, 0, 1, 0.7960784, 1,
0.02571394, -0.726258, 3.889452, 0, 1, 0.8039216, 1,
0.02591895, -0.75144, 3.661742, 0, 1, 0.8078431, 1,
0.02595348, 0.193297, -0.5160276, 0, 1, 0.8156863, 1,
0.0271133, 0.3741188, -0.7707162, 0, 1, 0.8196079, 1,
0.02883751, 1.504292, -1.458387, 0, 1, 0.827451, 1,
0.02959905, -0.5678115, 5.177027, 0, 1, 0.8313726, 1,
0.03775453, -0.1732634, 2.813957, 0, 1, 0.8392157, 1,
0.03905092, -1.792963, 2.074524, 0, 1, 0.8431373, 1,
0.03963156, -2.044788, 2.459994, 0, 1, 0.8509804, 1,
0.05106413, -0.5340421, 3.552875, 0, 1, 0.854902, 1,
0.05112719, -1.219545, 3.377622, 0, 1, 0.8627451, 1,
0.05125443, 0.06744926, 0.2228196, 0, 1, 0.8666667, 1,
0.05167783, 0.806912, -0.2247111, 0, 1, 0.8745098, 1,
0.0529679, 0.3309857, -1.133345, 0, 1, 0.8784314, 1,
0.05574319, 1.311522, 2.438737, 0, 1, 0.8862745, 1,
0.06049745, -0.4189755, 3.177803, 0, 1, 0.8901961, 1,
0.06906179, -0.08204594, 3.361721, 0, 1, 0.8980392, 1,
0.06915246, -1.107787, 2.98923, 0, 1, 0.9058824, 1,
0.07073174, 0.5343549, -0.08915431, 0, 1, 0.9098039, 1,
0.07125127, -2.171992, 4.334906, 0, 1, 0.9176471, 1,
0.0717863, 0.874097, 1.131017, 0, 1, 0.9215686, 1,
0.07308305, 1.09929, 0.1562386, 0, 1, 0.9294118, 1,
0.07683914, -0.5507421, 4.750033, 0, 1, 0.9333333, 1,
0.07835843, -1.023992, 3.015781, 0, 1, 0.9411765, 1,
0.07944427, -0.8727102, 2.963014, 0, 1, 0.945098, 1,
0.08031823, -1.362393, 3.408576, 0, 1, 0.9529412, 1,
0.08353721, -1.978646, 2.721599, 0, 1, 0.9568627, 1,
0.08525343, -1.479118, 3.209262, 0, 1, 0.9647059, 1,
0.08568048, 0.4304107, 1.111676, 0, 1, 0.9686275, 1,
0.08745204, 1.982235, 1.817667, 0, 1, 0.9764706, 1,
0.08930781, -1.332617, 3.023495, 0, 1, 0.9803922, 1,
0.09060186, -0.2431867, 3.730621, 0, 1, 0.9882353, 1,
0.0922954, 0.5836232, 0.1863239, 0, 1, 0.9921569, 1,
0.0930752, 0.8460845, -0.6249292, 0, 1, 1, 1,
0.1044798, 0.5061336, 0.8836616, 0, 0.9921569, 1, 1,
0.1073104, 0.1629877, 1.10354, 0, 0.9882353, 1, 1,
0.1090563, 0.84922, -1.460926, 0, 0.9803922, 1, 1,
0.1191336, 0.2264937, 1.121834, 0, 0.9764706, 1, 1,
0.1206036, 1.280379, -1.101531, 0, 0.9686275, 1, 1,
0.1221498, -0.7726688, 3.928929, 0, 0.9647059, 1, 1,
0.1239798, -2.644069, 2.81676, 0, 0.9568627, 1, 1,
0.1255686, 0.9322974, 0.2911972, 0, 0.9529412, 1, 1,
0.1338554, -0.1794316, 2.579989, 0, 0.945098, 1, 1,
0.1343144, 0.1224609, 2.36281, 0, 0.9411765, 1, 1,
0.1367767, 1.829967, -1.664491, 0, 0.9333333, 1, 1,
0.1376213, 1.876846, -0.6241624, 0, 0.9294118, 1, 1,
0.1376487, -0.1587352, 3.433912, 0, 0.9215686, 1, 1,
0.1392351, -0.7920967, 3.588279, 0, 0.9176471, 1, 1,
0.1413558, -0.5080394, 2.42532, 0, 0.9098039, 1, 1,
0.1421387, -0.9737833, 2.734934, 0, 0.9058824, 1, 1,
0.142336, -0.8996666, 3.118675, 0, 0.8980392, 1, 1,
0.1426841, -0.06958726, 3.660738, 0, 0.8901961, 1, 1,
0.143526, -0.5764038, 2.476603, 0, 0.8862745, 1, 1,
0.1488939, -1.154215, 1.002892, 0, 0.8784314, 1, 1,
0.1522155, 0.2072776, -0.1634987, 0, 0.8745098, 1, 1,
0.1526908, 1.20747, 0.9638442, 0, 0.8666667, 1, 1,
0.1532515, 0.9065474, 0.5936632, 0, 0.8627451, 1, 1,
0.1574417, -0.4833992, 2.355285, 0, 0.854902, 1, 1,
0.1606161, -0.6839031, 2.523596, 0, 0.8509804, 1, 1,
0.1609867, -0.3315468, 2.038201, 0, 0.8431373, 1, 1,
0.1610265, -0.6494987, 4.603906, 0, 0.8392157, 1, 1,
0.1633175, -1.153199, 1.673189, 0, 0.8313726, 1, 1,
0.1702935, -2.147623, 1.161232, 0, 0.827451, 1, 1,
0.1742298, -1.808087, 3.953982, 0, 0.8196079, 1, 1,
0.1743806, -1.107207, 3.670467, 0, 0.8156863, 1, 1,
0.176654, -1.138043, 1.00376, 0, 0.8078431, 1, 1,
0.1827761, -0.08225981, 2.97616, 0, 0.8039216, 1, 1,
0.1875641, -1.578671, 3.493427, 0, 0.7960784, 1, 1,
0.1921655, 1.186347, 1.133864, 0, 0.7882353, 1, 1,
0.192293, 0.8632749, -1.229327, 0, 0.7843137, 1, 1,
0.1934438, -1.680909, 5.080913, 0, 0.7764706, 1, 1,
0.199722, -1.78633, 3.171087, 0, 0.772549, 1, 1,
0.2017587, -0.3274284, 2.440706, 0, 0.7647059, 1, 1,
0.2033454, 0.3590061, 2.329682, 0, 0.7607843, 1, 1,
0.2058663, 0.7149543, 0.9983385, 0, 0.7529412, 1, 1,
0.2071313, 0.5506654, 1.106554, 0, 0.7490196, 1, 1,
0.2071991, 0.2140455, 0.2366295, 0, 0.7411765, 1, 1,
0.207775, -0.2598026, 2.895359, 0, 0.7372549, 1, 1,
0.2079062, -1.263549, 3.109593, 0, 0.7294118, 1, 1,
0.2084017, 0.5792627, 1.51451, 0, 0.7254902, 1, 1,
0.2100492, -1.117582, 3.455281, 0, 0.7176471, 1, 1,
0.2176458, 0.6151082, -0.7750106, 0, 0.7137255, 1, 1,
0.2207954, -1.311533, 1.784487, 0, 0.7058824, 1, 1,
0.2214193, 0.7725088, -0.9488109, 0, 0.6980392, 1, 1,
0.2280446, 0.1843006, -1.692612, 0, 0.6941177, 1, 1,
0.2292347, 1.664961, 1.329435, 0, 0.6862745, 1, 1,
0.2342607, -0.7464897, 5.064608, 0, 0.682353, 1, 1,
0.2343972, -1.131092, 3.971765, 0, 0.6745098, 1, 1,
0.2358916, -0.2122758, 2.892718, 0, 0.6705883, 1, 1,
0.2362255, -0.3010695, 1.450363, 0, 0.6627451, 1, 1,
0.2424416, -0.007605935, 0.2649708, 0, 0.6588235, 1, 1,
0.2431, -2.832251, 2.575783, 0, 0.6509804, 1, 1,
0.243743, -0.2216132, 3.643713, 0, 0.6470588, 1, 1,
0.2443199, 1.066698, -0.9649329, 0, 0.6392157, 1, 1,
0.2452645, -1.486989, 3.76278, 0, 0.6352941, 1, 1,
0.247067, -0.4179307, 3.732724, 0, 0.627451, 1, 1,
0.2491772, -1.652593, 2.459505, 0, 0.6235294, 1, 1,
0.2513377, -0.2761449, 1.294785, 0, 0.6156863, 1, 1,
0.2527955, -1.65234, 3.360981, 0, 0.6117647, 1, 1,
0.2557715, -0.8149295, 2.557986, 0, 0.6039216, 1, 1,
0.258947, -0.5227764, 1.588055, 0, 0.5960785, 1, 1,
0.2623399, -0.8332791, 2.807782, 0, 0.5921569, 1, 1,
0.2676444, 1.612863, -0.6676469, 0, 0.5843138, 1, 1,
0.2691622, -1.445276, 4.834419, 0, 0.5803922, 1, 1,
0.2700537, 1.260944, -0.3869602, 0, 0.572549, 1, 1,
0.2704366, 0.3826926, 0.2391401, 0, 0.5686275, 1, 1,
0.2709399, -0.04810829, 2.142673, 0, 0.5607843, 1, 1,
0.2755451, -1.011314, 1.704474, 0, 0.5568628, 1, 1,
0.2758066, -1.430254, 2.227112, 0, 0.5490196, 1, 1,
0.280614, 1.003222, 0.3333201, 0, 0.5450981, 1, 1,
0.2830633, 0.8190975, 1.906406, 0, 0.5372549, 1, 1,
0.2833025, -0.1483262, 0.497889, 0, 0.5333334, 1, 1,
0.2834233, -0.1884374, 2.140216, 0, 0.5254902, 1, 1,
0.2849113, 1.099165, 1.226332, 0, 0.5215687, 1, 1,
0.2895535, -0.7816124, 2.515352, 0, 0.5137255, 1, 1,
0.2897898, -1.690189, 4.555951, 0, 0.509804, 1, 1,
0.2988254, -0.299109, 1.691119, 0, 0.5019608, 1, 1,
0.3098893, -0.2241173, 3.697314, 0, 0.4941176, 1, 1,
0.3101304, 1.868919, -0.7141322, 0, 0.4901961, 1, 1,
0.3195068, 0.9700664, -0.05909114, 0, 0.4823529, 1, 1,
0.3211022, -0.6141936, 2.396033, 0, 0.4784314, 1, 1,
0.3241807, -0.7594187, 2.968531, 0, 0.4705882, 1, 1,
0.3243762, 0.4470675, 1.205897, 0, 0.4666667, 1, 1,
0.3250776, 0.3400414, 0.08616565, 0, 0.4588235, 1, 1,
0.3268586, -0.708453, 2.662636, 0, 0.454902, 1, 1,
0.3280977, -0.04104467, 0.6323349, 0, 0.4470588, 1, 1,
0.3292532, 0.5480009, 0.8836132, 0, 0.4431373, 1, 1,
0.3307963, -0.7062942, 2.905824, 0, 0.4352941, 1, 1,
0.3312584, -0.8736879, 2.755279, 0, 0.4313726, 1, 1,
0.3325794, 1.324041, 0.2382288, 0, 0.4235294, 1, 1,
0.3367087, -0.3274342, 0.7901573, 0, 0.4196078, 1, 1,
0.3529772, 0.8104603, 1.059486, 0, 0.4117647, 1, 1,
0.3564347, -0.3242762, 2.252352, 0, 0.4078431, 1, 1,
0.356815, 0.2908746, 0.3996767, 0, 0.4, 1, 1,
0.356932, 0.6293017, -0.03253214, 0, 0.3921569, 1, 1,
0.3624801, -1.213286, 3.582742, 0, 0.3882353, 1, 1,
0.3627222, -0.6262282, 1.224255, 0, 0.3803922, 1, 1,
0.3634226, 0.8331025, -0.01246353, 0, 0.3764706, 1, 1,
0.3704493, -0.8201309, 2.042476, 0, 0.3686275, 1, 1,
0.3714822, -0.4569388, 2.753659, 0, 0.3647059, 1, 1,
0.3755985, -2.081119, 2.503199, 0, 0.3568628, 1, 1,
0.3766781, 1.499759, -0.1860477, 0, 0.3529412, 1, 1,
0.3818073, -1.658002, 1.969652, 0, 0.345098, 1, 1,
0.3836907, 0.4335997, -0.1463709, 0, 0.3411765, 1, 1,
0.3870937, -0.4758596, 2.322634, 0, 0.3333333, 1, 1,
0.3874555, -0.08293144, 1.745147, 0, 0.3294118, 1, 1,
0.3900286, -0.4222197, 4.23907, 0, 0.3215686, 1, 1,
0.3904321, -0.07117744, 0.1855433, 0, 0.3176471, 1, 1,
0.3910589, -1.919766, 1.745375, 0, 0.3098039, 1, 1,
0.3927169, 0.5177841, -0.538816, 0, 0.3058824, 1, 1,
0.3933859, 0.7898487, 0.5216349, 0, 0.2980392, 1, 1,
0.3982907, -0.2839553, 0.9787375, 0, 0.2901961, 1, 1,
0.3992604, -0.5660552, 2.848434, 0, 0.2862745, 1, 1,
0.4026983, 1.451519, 0.4664316, 0, 0.2784314, 1, 1,
0.408298, -0.04462157, 2.017357, 0, 0.2745098, 1, 1,
0.409801, -0.2518667, 2.055346, 0, 0.2666667, 1, 1,
0.4127455, 1.230703, 0.3986745, 0, 0.2627451, 1, 1,
0.4156929, -1.044147, 3.725998, 0, 0.254902, 1, 1,
0.4160019, -0.5217101, 1.046486, 0, 0.2509804, 1, 1,
0.4171523, 1.555614, 1.311952, 0, 0.2431373, 1, 1,
0.4190079, 0.1376064, 1.926564, 0, 0.2392157, 1, 1,
0.4249902, 1.866228, 1.629688, 0, 0.2313726, 1, 1,
0.4254057, 1.140721, 2.077892, 0, 0.227451, 1, 1,
0.4272873, -0.09325562, 1.532204, 0, 0.2196078, 1, 1,
0.4295151, 0.4215039, 2.347817, 0, 0.2156863, 1, 1,
0.429541, 0.9442313, 0.4287141, 0, 0.2078431, 1, 1,
0.4360328, 1.30905, 0.883411, 0, 0.2039216, 1, 1,
0.4369507, -0.7758501, 3.784532, 0, 0.1960784, 1, 1,
0.4380569, -1.085578, 3.17088, 0, 0.1882353, 1, 1,
0.440226, 0.8505386, -1.945593, 0, 0.1843137, 1, 1,
0.4430954, -0.9668932, 0.7585217, 0, 0.1764706, 1, 1,
0.4446632, 1.362976, -1.454737, 0, 0.172549, 1, 1,
0.4468823, 0.3030254, 2.851391, 0, 0.1647059, 1, 1,
0.4482594, 0.7546216, 1.173385, 0, 0.1607843, 1, 1,
0.4519122, -2.368702, 2.775834, 0, 0.1529412, 1, 1,
0.4562039, 0.4756595, 0.9050652, 0, 0.1490196, 1, 1,
0.4563427, 0.5071644, 0.6600282, 0, 0.1411765, 1, 1,
0.4666001, 1.347535, 1.681136, 0, 0.1372549, 1, 1,
0.4690516, -1.408173, 0.810552, 0, 0.1294118, 1, 1,
0.4702806, 0.8877119, 0.7984859, 0, 0.1254902, 1, 1,
0.474544, -1.050172, 2.797278, 0, 0.1176471, 1, 1,
0.4759138, -0.1903257, 0.6304578, 0, 0.1137255, 1, 1,
0.4812185, -1.180199, 2.35413, 0, 0.1058824, 1, 1,
0.4838544, -0.08077349, 1.525957, 0, 0.09803922, 1, 1,
0.4883573, -1.579091, 3.31857, 0, 0.09411765, 1, 1,
0.4904356, 1.362385, -0.6024955, 0, 0.08627451, 1, 1,
0.4905331, -1.163576, 2.931833, 0, 0.08235294, 1, 1,
0.493046, 2.295714, 0.4084078, 0, 0.07450981, 1, 1,
0.4938295, -0.469678, 3.797097, 0, 0.07058824, 1, 1,
0.4965301, 0.6016098, -0.3987536, 0, 0.0627451, 1, 1,
0.4981126, -1.881111, 2.937891, 0, 0.05882353, 1, 1,
0.5004479, 1.088644, 0.006389824, 0, 0.05098039, 1, 1,
0.5006585, -1.619016, 3.451014, 0, 0.04705882, 1, 1,
0.5007922, -0.1024077, 3.603811, 0, 0.03921569, 1, 1,
0.5024929, -0.966682, 3.600379, 0, 0.03529412, 1, 1,
0.5031545, -0.4108948, 3.859527, 0, 0.02745098, 1, 1,
0.5067182, 0.2553533, 1.391943, 0, 0.02352941, 1, 1,
0.5096862, -0.1861549, 1.504159, 0, 0.01568628, 1, 1,
0.509982, 1.889329, -1.031036, 0, 0.01176471, 1, 1,
0.5118345, -2.610986, 3.267357, 0, 0.003921569, 1, 1,
0.5148237, -0.3288433, 1.620381, 0.003921569, 0, 1, 1,
0.516172, 0.2411626, 0.3322071, 0.007843138, 0, 1, 1,
0.5186315, 0.9965267, -0.2444613, 0.01568628, 0, 1, 1,
0.5207341, 0.1004342, 1.54077, 0.01960784, 0, 1, 1,
0.5209695, -0.2113379, 2.175812, 0.02745098, 0, 1, 1,
0.5227229, 1.1975, 0.2135314, 0.03137255, 0, 1, 1,
0.5236014, 0.04663691, 3.032709, 0.03921569, 0, 1, 1,
0.5241516, 0.4791644, 0.529309, 0.04313726, 0, 1, 1,
0.5288804, -0.3245566, 3.372625, 0.05098039, 0, 1, 1,
0.536319, -1.28233, 3.442333, 0.05490196, 0, 1, 1,
0.5407712, -0.06195145, 1.737606, 0.0627451, 0, 1, 1,
0.5429553, 0.2715293, 1.170905, 0.06666667, 0, 1, 1,
0.5472291, -1.111139, 4.13112, 0.07450981, 0, 1, 1,
0.5490584, -1.050766, 1.610232, 0.07843138, 0, 1, 1,
0.5507628, 2.427953, 0.5488463, 0.08627451, 0, 1, 1,
0.5513618, -0.7760447, 3.994982, 0.09019608, 0, 1, 1,
0.5618091, 0.5801758, 1.060909, 0.09803922, 0, 1, 1,
0.5652394, -0.781445, 3.28899, 0.1058824, 0, 1, 1,
0.5703987, 0.2374305, 1.553406, 0.1098039, 0, 1, 1,
0.5717891, 2.802938, 0.4667766, 0.1176471, 0, 1, 1,
0.5723027, 1.426474, 1.951057, 0.1215686, 0, 1, 1,
0.5746952, 1.01446, 0.6346845, 0.1294118, 0, 1, 1,
0.5752788, -1.518873, 2.783565, 0.1333333, 0, 1, 1,
0.5778958, -0.6431913, 3.397395, 0.1411765, 0, 1, 1,
0.5791602, -1.609332, 2.690418, 0.145098, 0, 1, 1,
0.5797049, -1.851377, 4.09684, 0.1529412, 0, 1, 1,
0.5854813, 2.352471, 1.402171, 0.1568628, 0, 1, 1,
0.5889187, -0.5236554, 2.257723, 0.1647059, 0, 1, 1,
0.5903177, -0.1680825, -0.9599262, 0.1686275, 0, 1, 1,
0.5908208, -0.8915535, 2.448593, 0.1764706, 0, 1, 1,
0.5926879, 0.1635044, 0.967458, 0.1803922, 0, 1, 1,
0.5946101, 0.6698523, 0.3658692, 0.1882353, 0, 1, 1,
0.5954449, -0.3679873, 0.406885, 0.1921569, 0, 1, 1,
0.6073706, -0.1192277, 1.20051, 0.2, 0, 1, 1,
0.6077223, -0.4057775, 2.661197, 0.2078431, 0, 1, 1,
0.6093834, 0.5007844, -1.629451, 0.2117647, 0, 1, 1,
0.6104658, 0.5125652, 2.542529, 0.2196078, 0, 1, 1,
0.6114947, 0.8921074, 2.307339, 0.2235294, 0, 1, 1,
0.6147412, 1.028988, 0.8507865, 0.2313726, 0, 1, 1,
0.6193662, 0.089914, 0.1866986, 0.2352941, 0, 1, 1,
0.6227949, 0.6807392, 1.521814, 0.2431373, 0, 1, 1,
0.6248399, -0.8753123, 1.178261, 0.2470588, 0, 1, 1,
0.6252107, 0.5749009, 0.1885354, 0.254902, 0, 1, 1,
0.6285555, -1.550371, 0.9798962, 0.2588235, 0, 1, 1,
0.6363508, 2.087854, -0.3772184, 0.2666667, 0, 1, 1,
0.6381381, -1.53583, 4.241518, 0.2705882, 0, 1, 1,
0.64065, -0.9744218, 2.303615, 0.2784314, 0, 1, 1,
0.6430102, 0.8681182, 0.9046416, 0.282353, 0, 1, 1,
0.6443519, -1.457932, 1.360324, 0.2901961, 0, 1, 1,
0.6478165, 0.2491543, 1.034034, 0.2941177, 0, 1, 1,
0.648444, -2.382764, 2.628481, 0.3019608, 0, 1, 1,
0.6494078, -1.073896, 3.609246, 0.3098039, 0, 1, 1,
0.6495085, -1.09656, 1.947351, 0.3137255, 0, 1, 1,
0.6578431, -0.2780443, 2.486196, 0.3215686, 0, 1, 1,
0.6597601, 0.08524897, 2.369824, 0.3254902, 0, 1, 1,
0.6600382, 0.1508346, -0.01108605, 0.3333333, 0, 1, 1,
0.6630174, 0.2550331, 0.8334993, 0.3372549, 0, 1, 1,
0.6646111, -0.4849864, 1.257693, 0.345098, 0, 1, 1,
0.6647182, 1.178177, 0.5250232, 0.3490196, 0, 1, 1,
0.6832486, 0.6922863, 1.491694, 0.3568628, 0, 1, 1,
0.6842164, -1.163134, 3.026308, 0.3607843, 0, 1, 1,
0.6869665, -0.7071657, 3.014508, 0.3686275, 0, 1, 1,
0.6886297, -0.8989866, 1.801729, 0.372549, 0, 1, 1,
0.6891933, 0.3756967, 0.8877628, 0.3803922, 0, 1, 1,
0.68941, -1.116234, 0.4158395, 0.3843137, 0, 1, 1,
0.691062, -2.262746, 2.729049, 0.3921569, 0, 1, 1,
0.7024643, -0.2131744, 1.223492, 0.3960784, 0, 1, 1,
0.7066374, -1.714495, 2.684882, 0.4039216, 0, 1, 1,
0.7076359, -0.01249092, 1.779988, 0.4117647, 0, 1, 1,
0.7079393, -0.359915, 1.850255, 0.4156863, 0, 1, 1,
0.7092078, -0.9856407, 2.384422, 0.4235294, 0, 1, 1,
0.7163774, -0.4357577, 2.798326, 0.427451, 0, 1, 1,
0.7177896, 1.141759, 1.624273, 0.4352941, 0, 1, 1,
0.7181485, 0.2760331, 1.150489, 0.4392157, 0, 1, 1,
0.7187341, 2.014308, 0.02197483, 0.4470588, 0, 1, 1,
0.7189955, 0.5137213, 2.115441, 0.4509804, 0, 1, 1,
0.7197726, -1.031083, 1.6391, 0.4588235, 0, 1, 1,
0.724813, 1.768242, 0.2750014, 0.4627451, 0, 1, 1,
0.7248545, 0.7679698, 0.3810025, 0.4705882, 0, 1, 1,
0.7287525, -0.1429768, 3.381638, 0.4745098, 0, 1, 1,
0.7365666, -0.1643809, 1.791287, 0.4823529, 0, 1, 1,
0.7389341, 0.8718816, 1.568992, 0.4862745, 0, 1, 1,
0.7389544, 0.6910939, 0.6067318, 0.4941176, 0, 1, 1,
0.7421774, 0.4330249, 0.936278, 0.5019608, 0, 1, 1,
0.7455336, -0.2306587, 2.049831, 0.5058824, 0, 1, 1,
0.765889, -0.5113392, 3.26699, 0.5137255, 0, 1, 1,
0.766996, -0.0004224915, -0.2234363, 0.5176471, 0, 1, 1,
0.7730776, -0.708892, 1.466362, 0.5254902, 0, 1, 1,
0.7745821, -0.3847135, 1.184085, 0.5294118, 0, 1, 1,
0.7767913, 0.7902433, 0.008979511, 0.5372549, 0, 1, 1,
0.7794107, 0.08990596, 2.460569, 0.5411765, 0, 1, 1,
0.7803859, -0.8277922, 1.284607, 0.5490196, 0, 1, 1,
0.7833419, -0.9253178, 3.794055, 0.5529412, 0, 1, 1,
0.7833799, -1.743432, 4.335386, 0.5607843, 0, 1, 1,
0.7875192, -0.350714, 2.143772, 0.5647059, 0, 1, 1,
0.7888596, -0.2035975, 1.93709, 0.572549, 0, 1, 1,
0.7945248, -0.8766192, 3.19982, 0.5764706, 0, 1, 1,
0.7946243, -0.63718, 2.172014, 0.5843138, 0, 1, 1,
0.7969565, -0.3217202, 4.1364, 0.5882353, 0, 1, 1,
0.7998235, 1.300467, 0.03630598, 0.5960785, 0, 1, 1,
0.8006414, 0.2214832, 1.217262, 0.6039216, 0, 1, 1,
0.8059915, -1.335787, 2.603271, 0.6078432, 0, 1, 1,
0.8171223, 0.9599912, 1.591556, 0.6156863, 0, 1, 1,
0.8178462, -1.215094, 4.535801, 0.6196079, 0, 1, 1,
0.8187676, -1.559134, 1.245376, 0.627451, 0, 1, 1,
0.8218863, -2.342406, 2.72375, 0.6313726, 0, 1, 1,
0.8258287, 1.337329, -0.5966773, 0.6392157, 0, 1, 1,
0.8272907, -0.8750813, 1.328642, 0.6431373, 0, 1, 1,
0.8352084, 1.207953, -0.4610129, 0.6509804, 0, 1, 1,
0.8352644, -1.07014, 2.018273, 0.654902, 0, 1, 1,
0.8370565, -0.5565276, 2.163802, 0.6627451, 0, 1, 1,
0.8392385, 0.5275205, 1.18654, 0.6666667, 0, 1, 1,
0.8399544, 0.5599757, 0.2158342, 0.6745098, 0, 1, 1,
0.8423488, 0.8025832, 0.5107253, 0.6784314, 0, 1, 1,
0.8446901, 1.954474, 1.656278, 0.6862745, 0, 1, 1,
0.8449603, 2.030586, -1.435586, 0.6901961, 0, 1, 1,
0.848389, 0.6769508, 0.6044339, 0.6980392, 0, 1, 1,
0.848536, 0.09249254, 2.110088, 0.7058824, 0, 1, 1,
0.8528222, 0.5221867, 1.157546, 0.7098039, 0, 1, 1,
0.8561069, -0.1303105, 3.175202, 0.7176471, 0, 1, 1,
0.8580632, -0.4159959, 1.938097, 0.7215686, 0, 1, 1,
0.8717935, -1.993385, 3.556545, 0.7294118, 0, 1, 1,
0.8750266, -0.4517067, 1.855856, 0.7333333, 0, 1, 1,
0.8798289, 0.5172809, 1.354613, 0.7411765, 0, 1, 1,
0.882421, 1.300634, -0.1099224, 0.7450981, 0, 1, 1,
0.8828782, 1.46287, 1.17784, 0.7529412, 0, 1, 1,
0.8839884, -0.5036011, 2.725343, 0.7568628, 0, 1, 1,
0.8848702, -0.5606377, 0.2411734, 0.7647059, 0, 1, 1,
0.8914844, -0.3642878, 2.067495, 0.7686275, 0, 1, 1,
0.9039711, -0.06776632, 3.494932, 0.7764706, 0, 1, 1,
0.9040384, 1.441759, 0.2340638, 0.7803922, 0, 1, 1,
0.905126, 0.886362, 0.4110513, 0.7882353, 0, 1, 1,
0.9081702, 1.030153, -0.01535634, 0.7921569, 0, 1, 1,
0.9114047, 1.864833, 0.2524794, 0.8, 0, 1, 1,
0.9138857, 1.108676, 1.342934, 0.8078431, 0, 1, 1,
0.9202406, -0.459799, 1.232222, 0.8117647, 0, 1, 1,
0.9218482, 1.849834, 0.08967655, 0.8196079, 0, 1, 1,
0.9232681, 2.191197, 0.8378336, 0.8235294, 0, 1, 1,
0.9266466, -0.4387556, 0.7255775, 0.8313726, 0, 1, 1,
0.9266877, 0.8466665, 1.426578, 0.8352941, 0, 1, 1,
0.9373021, -0.5375797, 1.904889, 0.8431373, 0, 1, 1,
0.9393446, 1.204757, -0.05443959, 0.8470588, 0, 1, 1,
0.9533452, -0.9654632, 2.467327, 0.854902, 0, 1, 1,
0.9541432, -0.3314244, 1.73082, 0.8588235, 0, 1, 1,
0.9544752, -0.8642492, 2.685991, 0.8666667, 0, 1, 1,
0.9584838, -0.06863317, 1.133782, 0.8705882, 0, 1, 1,
0.9651443, 1.1576, 2.41297, 0.8784314, 0, 1, 1,
0.9657996, 0.5500314, 1.038558, 0.8823529, 0, 1, 1,
0.9742386, 0.5228245, 0.8740296, 0.8901961, 0, 1, 1,
0.9748054, 0.3608969, -0.4056555, 0.8941177, 0, 1, 1,
0.9804893, -0.2657662, 0.6631994, 0.9019608, 0, 1, 1,
0.9815772, -0.6052684, 1.778701, 0.9098039, 0, 1, 1,
0.9822165, 0.5729787, -0.0977844, 0.9137255, 0, 1, 1,
0.9835951, -0.4677039, 1.43978, 0.9215686, 0, 1, 1,
0.9870228, 0.7771721, 2.332585, 0.9254902, 0, 1, 1,
0.9876282, -0.2603179, 0.193326, 0.9333333, 0, 1, 1,
0.989334, -0.1487787, 1.148212, 0.9372549, 0, 1, 1,
0.9895329, 0.9757857, 1.481284, 0.945098, 0, 1, 1,
0.9938881, -1.584367, 1.658151, 0.9490196, 0, 1, 1,
0.9949208, -2.213117, 3.668276, 0.9568627, 0, 1, 1,
0.9961943, -0.2084157, 2.289982, 0.9607843, 0, 1, 1,
1.001295, -0.1558048, 2.605792, 0.9686275, 0, 1, 1,
1.00186, -0.9872738, 3.589198, 0.972549, 0, 1, 1,
1.006825, 0.09419623, 2.429661, 0.9803922, 0, 1, 1,
1.007695, -0.320718, 1.98952, 0.9843137, 0, 1, 1,
1.00803, -0.4272901, 0.2703066, 0.9921569, 0, 1, 1,
1.019913, 1.150389, 2.42028, 0.9960784, 0, 1, 1,
1.019989, -0.8728508, 2.547016, 1, 0, 0.9960784, 1,
1.022684, -0.9902493, 2.338359, 1, 0, 0.9882353, 1,
1.028073, -0.1839305, 3.50205, 1, 0, 0.9843137, 1,
1.030547, 0.9384894, 0.6589947, 1, 0, 0.9764706, 1,
1.03768, 1.611974, 1.369295, 1, 0, 0.972549, 1,
1.043939, 0.1243914, 2.445309, 1, 0, 0.9647059, 1,
1.049007, 0.1784065, 1.985888, 1, 0, 0.9607843, 1,
1.068495, -1.41029, 2.619777, 1, 0, 0.9529412, 1,
1.080444, 0.6001708, 0.4838661, 1, 0, 0.9490196, 1,
1.084419, -0.5098625, 2.604823, 1, 0, 0.9411765, 1,
1.091342, -0.006007972, 2.214784, 1, 0, 0.9372549, 1,
1.093854, 0.4683892, 0.06148941, 1, 0, 0.9294118, 1,
1.094109, -1.272255, 1.478634, 1, 0, 0.9254902, 1,
1.100239, 0.07425997, 1.353939, 1, 0, 0.9176471, 1,
1.104274, -0.4845244, 1.66815, 1, 0, 0.9137255, 1,
1.107166, 0.6181678, 1.62484, 1, 0, 0.9058824, 1,
1.113736, 0.1231388, -0.5947496, 1, 0, 0.9019608, 1,
1.141341, 0.9030896, 2.294254, 1, 0, 0.8941177, 1,
1.144927, 1.216634, 0.01714183, 1, 0, 0.8862745, 1,
1.150875, 1.757702, 0.4439109, 1, 0, 0.8823529, 1,
1.156074, -0.4963472, 3.300212, 1, 0, 0.8745098, 1,
1.163949, -0.5333273, 0.6710399, 1, 0, 0.8705882, 1,
1.165573, 0.2177473, -0.5280439, 1, 0, 0.8627451, 1,
1.168916, -0.4073895, 1.178991, 1, 0, 0.8588235, 1,
1.17231, 0.9692715, 1.018511, 1, 0, 0.8509804, 1,
1.185217, 0.6753061, 1.402595, 1, 0, 0.8470588, 1,
1.186621, 1.238035, 0.5663957, 1, 0, 0.8392157, 1,
1.193408, 0.05620038, 1.002676, 1, 0, 0.8352941, 1,
1.195282, -0.6198353, 1.926929, 1, 0, 0.827451, 1,
1.217372, -0.08653695, 1.526787, 1, 0, 0.8235294, 1,
1.224391, 0.5563893, 3.185578, 1, 0, 0.8156863, 1,
1.227085, -0.3486766, 1.2897, 1, 0, 0.8117647, 1,
1.227501, -0.5558872, 2.899246, 1, 0, 0.8039216, 1,
1.228833, -0.9737494, 3.918174, 1, 0, 0.7960784, 1,
1.230574, 0.1576668, 3.256948, 1, 0, 0.7921569, 1,
1.239172, -0.3399328, 1.22225, 1, 0, 0.7843137, 1,
1.23959, -1.204825, 3.795065, 1, 0, 0.7803922, 1,
1.252899, -0.2000348, 1.380526, 1, 0, 0.772549, 1,
1.262238, 0.6520823, 0.5741121, 1, 0, 0.7686275, 1,
1.262887, -1.10406, 1.514654, 1, 0, 0.7607843, 1,
1.263987, -0.1657351, 0.8988784, 1, 0, 0.7568628, 1,
1.266738, 0.8316945, 0.2872293, 1, 0, 0.7490196, 1,
1.268022, 1.291945, 1.851499, 1, 0, 0.7450981, 1,
1.278434, 0.3225073, 2.172777, 1, 0, 0.7372549, 1,
1.279295, 0.1894578, 0.4401641, 1, 0, 0.7333333, 1,
1.279747, 0.5646201, 0.04661596, 1, 0, 0.7254902, 1,
1.284584, -0.6021779, 2.365, 1, 0, 0.7215686, 1,
1.319537, -0.3788888, 2.912768, 1, 0, 0.7137255, 1,
1.321081, 0.6675657, 1.103906, 1, 0, 0.7098039, 1,
1.321202, 0.0610144, 0.8872779, 1, 0, 0.7019608, 1,
1.32523, 1.378922, 3.623631, 1, 0, 0.6941177, 1,
1.328936, -0.5313501, 2.581444, 1, 0, 0.6901961, 1,
1.338978, 1.326117, 1.407582, 1, 0, 0.682353, 1,
1.342229, -0.2344974, 0.8934252, 1, 0, 0.6784314, 1,
1.355542, 1.388617, 1.475985, 1, 0, 0.6705883, 1,
1.356412, 0.05088955, 0.3795281, 1, 0, 0.6666667, 1,
1.356893, 0.5155141, -0.8719552, 1, 0, 0.6588235, 1,
1.370607, 0.2131187, 0.418763, 1, 0, 0.654902, 1,
1.385263, 0.156366, 3.024399, 1, 0, 0.6470588, 1,
1.385504, -0.08897249, 3.180274, 1, 0, 0.6431373, 1,
1.401469, 0.7499926, 1.509781, 1, 0, 0.6352941, 1,
1.402282, -1.288939, 2.077518, 1, 0, 0.6313726, 1,
1.402965, -0.7000171, 0.8796558, 1, 0, 0.6235294, 1,
1.404696, 1.673205, 0.2378233, 1, 0, 0.6196079, 1,
1.408203, 1.599841, 0.04064196, 1, 0, 0.6117647, 1,
1.424551, 0.1857325, 1.045733, 1, 0, 0.6078432, 1,
1.425289, -0.619094, 2.213163, 1, 0, 0.6, 1,
1.429308, 0.5169997, 0.3044289, 1, 0, 0.5921569, 1,
1.437984, -1.337666, 2.019619, 1, 0, 0.5882353, 1,
1.439716, 0.0006157116, 1.371482, 1, 0, 0.5803922, 1,
1.440874, 0.720589, 2.281939, 1, 0, 0.5764706, 1,
1.448355, -0.01967434, 2.451993, 1, 0, 0.5686275, 1,
1.448962, -1.383435, 0.5230556, 1, 0, 0.5647059, 1,
1.452323, 1.679741, -0.584074, 1, 0, 0.5568628, 1,
1.456637, 0.1827178, 2.416529, 1, 0, 0.5529412, 1,
1.462486, 0.3891464, 1.266678, 1, 0, 0.5450981, 1,
1.471851, -0.1018243, 1.936284, 1, 0, 0.5411765, 1,
1.499924, 1.060987, 2.580961, 1, 0, 0.5333334, 1,
1.505401, 1.496287, -0.2010594, 1, 0, 0.5294118, 1,
1.506397, 0.6816273, 1.113438, 1, 0, 0.5215687, 1,
1.510898, -0.07334587, 2.992381, 1, 0, 0.5176471, 1,
1.517272, -0.04944082, 1.98161, 1, 0, 0.509804, 1,
1.519702, 2.479183, 1.408965, 1, 0, 0.5058824, 1,
1.534522, -0.2499763, 3.219498, 1, 0, 0.4980392, 1,
1.537833, -0.2726826, 2.568902, 1, 0, 0.4901961, 1,
1.538732, -0.01424842, -0.09599203, 1, 0, 0.4862745, 1,
1.539482, -1.500422, 3.041916, 1, 0, 0.4784314, 1,
1.545795, 1.376807, 1.242437, 1, 0, 0.4745098, 1,
1.546845, -1.410178, 1.194432, 1, 0, 0.4666667, 1,
1.54974, -0.6458314, 0.6827108, 1, 0, 0.4627451, 1,
1.553116, -0.05221874, 1.208628, 1, 0, 0.454902, 1,
1.57693, -0.6884657, 1.529765, 1, 0, 0.4509804, 1,
1.57827, 1.067628, 0.3639476, 1, 0, 0.4431373, 1,
1.616468, 1.115754, 0.02429082, 1, 0, 0.4392157, 1,
1.630227, -1.472266, 1.869996, 1, 0, 0.4313726, 1,
1.646133, 1.492195, -0.1165402, 1, 0, 0.427451, 1,
1.655705, -0.1506178, 1.36156, 1, 0, 0.4196078, 1,
1.684474, 0.9964344, -0.5012952, 1, 0, 0.4156863, 1,
1.689638, 0.65787, 0.3881286, 1, 0, 0.4078431, 1,
1.699914, 1.114868, 1.24097, 1, 0, 0.4039216, 1,
1.704788, 0.6433392, 0.4977052, 1, 0, 0.3960784, 1,
1.708595, -1.27482, 2.803173, 1, 0, 0.3882353, 1,
1.711014, -1.15173, 3.272522, 1, 0, 0.3843137, 1,
1.717342, -0.4822653, -0.316682, 1, 0, 0.3764706, 1,
1.722355, -3.140129, 1.792547, 1, 0, 0.372549, 1,
1.733411, 0.8777534, 0.9997538, 1, 0, 0.3647059, 1,
1.744241, -1.894336, 0.9795597, 1, 0, 0.3607843, 1,
1.760615, 1.335526, 1.165694, 1, 0, 0.3529412, 1,
1.766947, -0.01034421, 1.259994, 1, 0, 0.3490196, 1,
1.772763, 0.8654951, 2.160536, 1, 0, 0.3411765, 1,
1.773073, -0.5418745, 2.871145, 1, 0, 0.3372549, 1,
1.776625, -0.5348258, 3.115164, 1, 0, 0.3294118, 1,
1.810972, -1.394606, 0.181132, 1, 0, 0.3254902, 1,
1.812408, -0.8599123, 1.373121, 1, 0, 0.3176471, 1,
1.820433, 0.07479935, 1.776317, 1, 0, 0.3137255, 1,
1.820596, -1.233924, 1.959719, 1, 0, 0.3058824, 1,
1.827105, -0.4229609, 0.784185, 1, 0, 0.2980392, 1,
1.82781, -0.2839791, 1.23387, 1, 0, 0.2941177, 1,
1.828699, -0.5532754, 2.750313, 1, 0, 0.2862745, 1,
1.840629, -0.5269566, 1.13596, 1, 0, 0.282353, 1,
1.841983, 1.697025, -0.3938508, 1, 0, 0.2745098, 1,
1.845455, -1.389796, 3.37125, 1, 0, 0.2705882, 1,
1.850292, 0.9242842, 1.584035, 1, 0, 0.2627451, 1,
1.854326, 0.9603974, 0.8873059, 1, 0, 0.2588235, 1,
1.865135, -0.1641613, 0.6837879, 1, 0, 0.2509804, 1,
1.870759, -0.171965, 1.689778, 1, 0, 0.2470588, 1,
1.873536, 0.5609145, 1.606696, 1, 0, 0.2392157, 1,
1.876305, 0.1910512, 1.324401, 1, 0, 0.2352941, 1,
1.884644, -0.8398091, 0.6727671, 1, 0, 0.227451, 1,
1.904129, -0.1237836, 1.578772, 1, 0, 0.2235294, 1,
1.908541, -0.2208907, 3.553247, 1, 0, 0.2156863, 1,
1.922833, -0.2597646, 3.715026, 1, 0, 0.2117647, 1,
1.928529, 1.176101, 0.86353, 1, 0, 0.2039216, 1,
1.956808, 0.5687057, 1.748218, 1, 0, 0.1960784, 1,
1.957007, -0.1211775, 1.15317, 1, 0, 0.1921569, 1,
1.985822, -0.773487, 2.009443, 1, 0, 0.1843137, 1,
1.99189, -1.420657, 2.134938, 1, 0, 0.1803922, 1,
2.009073, -0.06053822, 1.331094, 1, 0, 0.172549, 1,
2.05686, 0.3546755, 1.954553, 1, 0, 0.1686275, 1,
2.060206, 1.24834, 0.9358729, 1, 0, 0.1607843, 1,
2.081701, -0.8696239, 1.535168, 1, 0, 0.1568628, 1,
2.113277, 0.3050314, 1.05476, 1, 0, 0.1490196, 1,
2.154389, 0.8160161, -0.731873, 1, 0, 0.145098, 1,
2.158996, -1.723171, 3.281018, 1, 0, 0.1372549, 1,
2.162255, 0.5661, 4.284598, 1, 0, 0.1333333, 1,
2.176947, -1.935127, 1.249439, 1, 0, 0.1254902, 1,
2.185722, 0.7550406, 0.4416938, 1, 0, 0.1215686, 1,
2.196955, 1.738187, 1.412409, 1, 0, 0.1137255, 1,
2.219903, -0.2543742, 1.851325, 1, 0, 0.1098039, 1,
2.22593, -0.237177, 0.9771479, 1, 0, 0.1019608, 1,
2.229671, -0.2323345, 3.843326, 1, 0, 0.09411765, 1,
2.2322, 0.7162356, 1.623577, 1, 0, 0.09019608, 1,
2.238201, -0.5593958, 0.189577, 1, 0, 0.08235294, 1,
2.274361, -0.5060977, 1.620128, 1, 0, 0.07843138, 1,
2.275002, -0.5888959, 2.495619, 1, 0, 0.07058824, 1,
2.280168, -0.1776217, 2.277617, 1, 0, 0.06666667, 1,
2.340554, -1.415143, 2.516855, 1, 0, 0.05882353, 1,
2.36373, 1.344847, 0.9757044, 1, 0, 0.05490196, 1,
2.413387, 0.8410915, 0.8573416, 1, 0, 0.04705882, 1,
2.452806, 0.1642038, 0.7208797, 1, 0, 0.04313726, 1,
2.471592, -0.03407576, 1.013567, 1, 0, 0.03529412, 1,
2.515664, -0.5935884, 1.287542, 1, 0, 0.03137255, 1,
2.577457, 0.4257476, -0.4246183, 1, 0, 0.02352941, 1,
2.71678, 0.5903984, 1.696063, 1, 0, 0.01960784, 1,
2.82081, -0.889394, 0.2641049, 1, 0, 0.01176471, 1,
2.952674, -1.425586, 2.012555, 1, 0, 0.007843138, 1
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
-0.1153457, -4.147479, -7.31432, 0, -0.5, 0.5, 0.5,
-0.1153457, -4.147479, -7.31432, 1, -0.5, 0.5, 0.5,
-0.1153457, -4.147479, -7.31432, 1, 1.5, 0.5, 0.5,
-0.1153457, -4.147479, -7.31432, 0, 1.5, 0.5, 0.5
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
-4.223424, -0.1685953, -7.31432, 0, -0.5, 0.5, 0.5,
-4.223424, -0.1685953, -7.31432, 1, -0.5, 0.5, 0.5,
-4.223424, -0.1685953, -7.31432, 1, 1.5, 0.5, 0.5,
-4.223424, -0.1685953, -7.31432, 0, 1.5, 0.5, 0.5
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
-4.223424, -4.147479, -0.1634376, 0, -0.5, 0.5, 0.5,
-4.223424, -4.147479, -0.1634376, 1, -0.5, 0.5, 0.5,
-4.223424, -4.147479, -0.1634376, 1, 1.5, 0.5, 0.5,
-4.223424, -4.147479, -0.1634376, 0, 1.5, 0.5, 0.5
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
-3, -3.229275, -5.664116,
2, -3.229275, -5.664116,
-3, -3.229275, -5.664116,
-3, -3.382309, -5.93915,
-2, -3.229275, -5.664116,
-2, -3.382309, -5.93915,
-1, -3.229275, -5.664116,
-1, -3.382309, -5.93915,
0, -3.229275, -5.664116,
0, -3.382309, -5.93915,
1, -3.229275, -5.664116,
1, -3.382309, -5.93915,
2, -3.229275, -5.664116,
2, -3.382309, -5.93915
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
-3, -3.688377, -6.489218, 0, -0.5, 0.5, 0.5,
-3, -3.688377, -6.489218, 1, -0.5, 0.5, 0.5,
-3, -3.688377, -6.489218, 1, 1.5, 0.5, 0.5,
-3, -3.688377, -6.489218, 0, 1.5, 0.5, 0.5,
-2, -3.688377, -6.489218, 0, -0.5, 0.5, 0.5,
-2, -3.688377, -6.489218, 1, -0.5, 0.5, 0.5,
-2, -3.688377, -6.489218, 1, 1.5, 0.5, 0.5,
-2, -3.688377, -6.489218, 0, 1.5, 0.5, 0.5,
-1, -3.688377, -6.489218, 0, -0.5, 0.5, 0.5,
-1, -3.688377, -6.489218, 1, -0.5, 0.5, 0.5,
-1, -3.688377, -6.489218, 1, 1.5, 0.5, 0.5,
-1, -3.688377, -6.489218, 0, 1.5, 0.5, 0.5,
0, -3.688377, -6.489218, 0, -0.5, 0.5, 0.5,
0, -3.688377, -6.489218, 1, -0.5, 0.5, 0.5,
0, -3.688377, -6.489218, 1, 1.5, 0.5, 0.5,
0, -3.688377, -6.489218, 0, 1.5, 0.5, 0.5,
1, -3.688377, -6.489218, 0, -0.5, 0.5, 0.5,
1, -3.688377, -6.489218, 1, -0.5, 0.5, 0.5,
1, -3.688377, -6.489218, 1, 1.5, 0.5, 0.5,
1, -3.688377, -6.489218, 0, 1.5, 0.5, 0.5,
2, -3.688377, -6.489218, 0, -0.5, 0.5, 0.5,
2, -3.688377, -6.489218, 1, -0.5, 0.5, 0.5,
2, -3.688377, -6.489218, 1, 1.5, 0.5, 0.5,
2, -3.688377, -6.489218, 0, 1.5, 0.5, 0.5
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
-3.275406, -3, -5.664116,
-3.275406, 2, -5.664116,
-3.275406, -3, -5.664116,
-3.433409, -3, -5.93915,
-3.275406, -2, -5.664116,
-3.433409, -2, -5.93915,
-3.275406, -1, -5.664116,
-3.433409, -1, -5.93915,
-3.275406, 0, -5.664116,
-3.433409, 0, -5.93915,
-3.275406, 1, -5.664116,
-3.433409, 1, -5.93915,
-3.275406, 2, -5.664116,
-3.433409, 2, -5.93915
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
-3.749415, -3, -6.489218, 0, -0.5, 0.5, 0.5,
-3.749415, -3, -6.489218, 1, -0.5, 0.5, 0.5,
-3.749415, -3, -6.489218, 1, 1.5, 0.5, 0.5,
-3.749415, -3, -6.489218, 0, 1.5, 0.5, 0.5,
-3.749415, -2, -6.489218, 0, -0.5, 0.5, 0.5,
-3.749415, -2, -6.489218, 1, -0.5, 0.5, 0.5,
-3.749415, -2, -6.489218, 1, 1.5, 0.5, 0.5,
-3.749415, -2, -6.489218, 0, 1.5, 0.5, 0.5,
-3.749415, -1, -6.489218, 0, -0.5, 0.5, 0.5,
-3.749415, -1, -6.489218, 1, -0.5, 0.5, 0.5,
-3.749415, -1, -6.489218, 1, 1.5, 0.5, 0.5,
-3.749415, -1, -6.489218, 0, 1.5, 0.5, 0.5,
-3.749415, 0, -6.489218, 0, -0.5, 0.5, 0.5,
-3.749415, 0, -6.489218, 1, -0.5, 0.5, 0.5,
-3.749415, 0, -6.489218, 1, 1.5, 0.5, 0.5,
-3.749415, 0, -6.489218, 0, 1.5, 0.5, 0.5,
-3.749415, 1, -6.489218, 0, -0.5, 0.5, 0.5,
-3.749415, 1, -6.489218, 1, -0.5, 0.5, 0.5,
-3.749415, 1, -6.489218, 1, 1.5, 0.5, 0.5,
-3.749415, 1, -6.489218, 0, 1.5, 0.5, 0.5,
-3.749415, 2, -6.489218, 0, -0.5, 0.5, 0.5,
-3.749415, 2, -6.489218, 1, -0.5, 0.5, 0.5,
-3.749415, 2, -6.489218, 1, 1.5, 0.5, 0.5,
-3.749415, 2, -6.489218, 0, 1.5, 0.5, 0.5
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
-3.275406, -3.229275, -4,
-3.275406, -3.229275, 4,
-3.275406, -3.229275, -4,
-3.433409, -3.382309, -4,
-3.275406, -3.229275, -2,
-3.433409, -3.382309, -2,
-3.275406, -3.229275, 0,
-3.433409, -3.382309, 0,
-3.275406, -3.229275, 2,
-3.433409, -3.382309, 2,
-3.275406, -3.229275, 4,
-3.433409, -3.382309, 4
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
-3.749415, -3.688377, -4, 0, -0.5, 0.5, 0.5,
-3.749415, -3.688377, -4, 1, -0.5, 0.5, 0.5,
-3.749415, -3.688377, -4, 1, 1.5, 0.5, 0.5,
-3.749415, -3.688377, -4, 0, 1.5, 0.5, 0.5,
-3.749415, -3.688377, -2, 0, -0.5, 0.5, 0.5,
-3.749415, -3.688377, -2, 1, -0.5, 0.5, 0.5,
-3.749415, -3.688377, -2, 1, 1.5, 0.5, 0.5,
-3.749415, -3.688377, -2, 0, 1.5, 0.5, 0.5,
-3.749415, -3.688377, 0, 0, -0.5, 0.5, 0.5,
-3.749415, -3.688377, 0, 1, -0.5, 0.5, 0.5,
-3.749415, -3.688377, 0, 1, 1.5, 0.5, 0.5,
-3.749415, -3.688377, 0, 0, 1.5, 0.5, 0.5,
-3.749415, -3.688377, 2, 0, -0.5, 0.5, 0.5,
-3.749415, -3.688377, 2, 1, -0.5, 0.5, 0.5,
-3.749415, -3.688377, 2, 1, 1.5, 0.5, 0.5,
-3.749415, -3.688377, 2, 0, 1.5, 0.5, 0.5,
-3.749415, -3.688377, 4, 0, -0.5, 0.5, 0.5,
-3.749415, -3.688377, 4, 1, -0.5, 0.5, 0.5,
-3.749415, -3.688377, 4, 1, 1.5, 0.5, 0.5,
-3.749415, -3.688377, 4, 0, 1.5, 0.5, 0.5
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
-3.275406, -3.229275, -5.664116,
-3.275406, 2.892084, -5.664116,
-3.275406, -3.229275, 5.337241,
-3.275406, 2.892084, 5.337241,
-3.275406, -3.229275, -5.664116,
-3.275406, -3.229275, 5.337241,
-3.275406, 2.892084, -5.664116,
-3.275406, 2.892084, 5.337241,
-3.275406, -3.229275, -5.664116,
3.044714, -3.229275, -5.664116,
-3.275406, -3.229275, 5.337241,
3.044714, -3.229275, 5.337241,
-3.275406, 2.892084, -5.664116,
3.044714, 2.892084, -5.664116,
-3.275406, 2.892084, 5.337241,
3.044714, 2.892084, 5.337241,
3.044714, -3.229275, -5.664116,
3.044714, 2.892084, -5.664116,
3.044714, -3.229275, 5.337241,
3.044714, 2.892084, 5.337241,
3.044714, -3.229275, -5.664116,
3.044714, -3.229275, 5.337241,
3.044714, 2.892084, -5.664116,
3.044714, 2.892084, 5.337241
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
var radius = 7.522208;
var distance = 33.46716;
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
mvMatrix.translate( 0.1153457, 0.1685953, 0.1634376 );
mvMatrix.scale( 1.286868, 1.328652, 0.7392868 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.46716);
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
gamma-butyrolactone<-read.table("gamma-butyrolactone.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-gamma-butyrolactone$V2
```

```
## Error in eval(expr, envir, enclos): object 'butyrolactone' not found
```

```r
y<-gamma-butyrolactone$V3
```

```
## Error in eval(expr, envir, enclos): object 'butyrolactone' not found
```

```r
z<-gamma-butyrolactone$V4
```

```
## Error in eval(expr, envir, enclos): object 'butyrolactone' not found
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
-3.183365, 0.1686825, -1.449712, 0, 0, 1, 1, 1,
-3.032491, -0.4386343, -1.776487, 1, 0, 0, 1, 1,
-2.729948, 1.76729, -1.322753, 1, 0, 0, 1, 1,
-2.701346, -1.049433, -2.566124, 1, 0, 0, 1, 1,
-2.695537, -0.3693248, -1.78189, 1, 0, 0, 1, 1,
-2.683032, 0.5068852, -1.209342, 1, 0, 0, 1, 1,
-2.610351, 0.7446188, 0.1112333, 0, 0, 0, 1, 1,
-2.417788, 1.140803, -3.556632, 0, 0, 0, 1, 1,
-2.320364, -1.041669, -3.006477, 0, 0, 0, 1, 1,
-2.316757, -0.3695849, -1.002559, 0, 0, 0, 1, 1,
-2.157652, -1.226289, -2.987625, 0, 0, 0, 1, 1,
-2.152698, -0.5590783, -1.312654, 0, 0, 0, 1, 1,
-2.127445, 0.0978351, -0.8765712, 0, 0, 0, 1, 1,
-2.113749, 1.075697, -0.9175051, 1, 1, 1, 1, 1,
-2.008527, 0.8799895, -0.6893211, 1, 1, 1, 1, 1,
-1.964637, 0.4332427, -0.3426332, 1, 1, 1, 1, 1,
-1.949088, 0.6008115, -1.384218, 1, 1, 1, 1, 1,
-1.927872, -1.070038, -1.986832, 1, 1, 1, 1, 1,
-1.91954, 1.787145, -1.992357, 1, 1, 1, 1, 1,
-1.914877, -0.2735868, -0.937344, 1, 1, 1, 1, 1,
-1.902714, 0.4882756, -1.168704, 1, 1, 1, 1, 1,
-1.888787, 0.7554569, -1.930043, 1, 1, 1, 1, 1,
-1.875948, -1.290719, -1.368544, 1, 1, 1, 1, 1,
-1.873025, -0.5795847, -1.498253, 1, 1, 1, 1, 1,
-1.872383, 0.9856448, 0.1688633, 1, 1, 1, 1, 1,
-1.867788, 0.8162585, -2.56603, 1, 1, 1, 1, 1,
-1.857206, 0.02648178, -4.065606, 1, 1, 1, 1, 1,
-1.837756, -0.03898788, -2.439239, 1, 1, 1, 1, 1,
-1.83492, -0.2885672, -3.452158, 0, 0, 1, 1, 1,
-1.822, 0.6003774, -1.319619, 1, 0, 0, 1, 1,
-1.806827, 0.9983516, 0.4984409, 1, 0, 0, 1, 1,
-1.792121, 0.6786734, -0.5093105, 1, 0, 0, 1, 1,
-1.772492, 1.916695, -2.61537, 1, 0, 0, 1, 1,
-1.734781, -0.3537214, -1.988029, 1, 0, 0, 1, 1,
-1.732547, -0.5002819, -2.310333, 0, 0, 0, 1, 1,
-1.72603, 0.7761488, -3.141986, 0, 0, 0, 1, 1,
-1.719068, 1.238264, -0.1790651, 0, 0, 0, 1, 1,
-1.718032, -0.4712275, -2.909399, 0, 0, 0, 1, 1,
-1.705441, -0.02456578, 1.020363, 0, 0, 0, 1, 1,
-1.693723, 1.01643, -2.369944, 0, 0, 0, 1, 1,
-1.693045, -0.8455051, -3.336717, 0, 0, 0, 1, 1,
-1.675678, 0.3306848, -0.2999062, 1, 1, 1, 1, 1,
-1.656602, 0.4840803, -2.36673, 1, 1, 1, 1, 1,
-1.653002, -0.4848119, -0.7449817, 1, 1, 1, 1, 1,
-1.633013, -1.136393, -0.5649574, 1, 1, 1, 1, 1,
-1.626196, -0.522181, -1.227804, 1, 1, 1, 1, 1,
-1.571962, 0.8283051, -0.536139, 1, 1, 1, 1, 1,
-1.5662, -0.3360808, -1.527118, 1, 1, 1, 1, 1,
-1.561002, -0.09119586, -2.78984, 1, 1, 1, 1, 1,
-1.559971, 0.08260781, -3.767455, 1, 1, 1, 1, 1,
-1.554878, 1.029475, 0.3876651, 1, 1, 1, 1, 1,
-1.553333, 0.1544748, -1.256928, 1, 1, 1, 1, 1,
-1.548229, 0.6462247, 0.4781084, 1, 1, 1, 1, 1,
-1.537668, -0.5577229, -3.671048, 1, 1, 1, 1, 1,
-1.530065, -0.4596793, -2.003395, 1, 1, 1, 1, 1,
-1.516793, 0.4823022, -2.415275, 1, 1, 1, 1, 1,
-1.514609, -0.233637, -2.793018, 0, 0, 1, 1, 1,
-1.514247, 1.358423, -1.489513, 1, 0, 0, 1, 1,
-1.501045, 0.2858751, -1.196086, 1, 0, 0, 1, 1,
-1.488241, -1.077699, -1.040207, 1, 0, 0, 1, 1,
-1.471962, -0.9581721, -2.363875, 1, 0, 0, 1, 1,
-1.470458, -1.50927, -3.873332, 1, 0, 0, 1, 1,
-1.468247, -1.02093, -2.290789, 0, 0, 0, 1, 1,
-1.456289, -0.9734864, -1.875637, 0, 0, 0, 1, 1,
-1.446797, -0.2883123, -1.692801, 0, 0, 0, 1, 1,
-1.444518, 0.6013374, -1.479465, 0, 0, 0, 1, 1,
-1.44147, -0.2992412, -1.99576, 0, 0, 0, 1, 1,
-1.436112, -0.6528485, -0.431035, 0, 0, 0, 1, 1,
-1.425125, -0.6882927, -1.817125, 0, 0, 0, 1, 1,
-1.419182, 1.531768, 0.5312618, 1, 1, 1, 1, 1,
-1.415225, -0.4275288, -1.322954, 1, 1, 1, 1, 1,
-1.394645, 1.030128, -1.337124, 1, 1, 1, 1, 1,
-1.394479, 0.7177811, -1.930472, 1, 1, 1, 1, 1,
-1.392126, -0.01026959, -2.843422, 1, 1, 1, 1, 1,
-1.387502, 0.2996545, -1.018234, 1, 1, 1, 1, 1,
-1.380587, -0.7286858, -1.273617, 1, 1, 1, 1, 1,
-1.362107, 0.2902977, -1.444369, 1, 1, 1, 1, 1,
-1.360612, -1.334908, -2.798153, 1, 1, 1, 1, 1,
-1.359803, -1.172718, -1.93633, 1, 1, 1, 1, 1,
-1.359282, 1.06168, -0.1760804, 1, 1, 1, 1, 1,
-1.350344, 0.9856092, 0.04360184, 1, 1, 1, 1, 1,
-1.349551, 0.6717302, -3.401445, 1, 1, 1, 1, 1,
-1.342141, 0.3487782, -0.9044048, 1, 1, 1, 1, 1,
-1.339647, -1.464775, -1.998476, 1, 1, 1, 1, 1,
-1.334051, -0.2743737, -2.481588, 0, 0, 1, 1, 1,
-1.332548, -1.347614, -0.3849323, 1, 0, 0, 1, 1,
-1.32406, -0.3877146, -3.132036, 1, 0, 0, 1, 1,
-1.309569, 0.8499938, -0.9012093, 1, 0, 0, 1, 1,
-1.294689, 0.5432235, -2.766034, 1, 0, 0, 1, 1,
-1.294034, 2.162098, -0.5821564, 1, 0, 0, 1, 1,
-1.282974, -0.1065022, -2.950502, 0, 0, 0, 1, 1,
-1.262447, 0.454869, -1.87248, 0, 0, 0, 1, 1,
-1.259889, 0.7560246, -0.4326774, 0, 0, 0, 1, 1,
-1.227874, 1.307532, -1.04272, 0, 0, 0, 1, 1,
-1.222328, 0.4858798, -1.342977, 0, 0, 0, 1, 1,
-1.220049, 0.5908087, -1.105095, 0, 0, 0, 1, 1,
-1.216735, -0.5067059, -3.181878, 0, 0, 0, 1, 1,
-1.213998, 0.5549107, -0.3848927, 1, 1, 1, 1, 1,
-1.206798, 0.1994879, -2.056387, 1, 1, 1, 1, 1,
-1.204236, 0.5110866, 0.9378883, 1, 1, 1, 1, 1,
-1.200561, 0.9440478, -1.996321, 1, 1, 1, 1, 1,
-1.194454, 0.5308732, -1.166917, 1, 1, 1, 1, 1,
-1.185732, -1.022306, -4.937864, 1, 1, 1, 1, 1,
-1.183411, -0.3613391, -2.579448, 1, 1, 1, 1, 1,
-1.178772, 0.963919, -1.42856, 1, 1, 1, 1, 1,
-1.173386, -0.3050106, -2.035619, 1, 1, 1, 1, 1,
-1.164071, 1.591347, -0.8708462, 1, 1, 1, 1, 1,
-1.162194, 0.4009739, -1.093445, 1, 1, 1, 1, 1,
-1.153159, 0.488399, -0.5273203, 1, 1, 1, 1, 1,
-1.14325, 1.747986, -1.319273, 1, 1, 1, 1, 1,
-1.14093, -1.908845, -3.65752, 1, 1, 1, 1, 1,
-1.138054, -1.797541, -2.271354, 1, 1, 1, 1, 1,
-1.130759, 0.003045425, -0.2190587, 0, 0, 1, 1, 1,
-1.130486, -0.6024796, -1.166216, 1, 0, 0, 1, 1,
-1.129404, -0.8270888, -0.03961761, 1, 0, 0, 1, 1,
-1.123441, 0.6358591, -0.9178783, 1, 0, 0, 1, 1,
-1.115888, 1.014945, -2.899723, 1, 0, 0, 1, 1,
-1.114123, -0.6371077, -3.187194, 1, 0, 0, 1, 1,
-1.110172, -1.103667, -2.268796, 0, 0, 0, 1, 1,
-1.110072, -1.947248, -3.10533, 0, 0, 0, 1, 1,
-1.109659, -0.4765492, -1.617478, 0, 0, 0, 1, 1,
-1.100599, 1.56378, -1.338011, 0, 0, 0, 1, 1,
-1.083183, 1.049317, -2.199023, 0, 0, 0, 1, 1,
-1.080873, -0.1177294, -3.251932, 0, 0, 0, 1, 1,
-1.074306, 0.7073583, -1.851419, 0, 0, 0, 1, 1,
-1.067695, 0.06749732, -1.234969, 1, 1, 1, 1, 1,
-1.061142, 1.670153, -0.1287241, 1, 1, 1, 1, 1,
-1.054113, 0.05556472, -1.91848, 1, 1, 1, 1, 1,
-1.051797, 0.2583217, -2.264853, 1, 1, 1, 1, 1,
-1.049457, 0.1123242, -1.972078, 1, 1, 1, 1, 1,
-1.036248, 1.098625, 0.4882652, 1, 1, 1, 1, 1,
-1.035738, -1.609933, -3.030249, 1, 1, 1, 1, 1,
-1.035398, -0.0512338, -1.172112, 1, 1, 1, 1, 1,
-1.034822, -1.798598, -2.349422, 1, 1, 1, 1, 1,
-1.032284, 1.031628, -0.8968372, 1, 1, 1, 1, 1,
-1.032282, 1.008332, 1.165718, 1, 1, 1, 1, 1,
-1.029502, 0.4525284, 0.1325001, 1, 1, 1, 1, 1,
-1.013955, 0.8182822, -0.8190281, 1, 1, 1, 1, 1,
-1.008659, 0.07819376, -3.067708, 1, 1, 1, 1, 1,
-1.008151, -0.6901231, -2.95174, 1, 1, 1, 1, 1,
-1.007383, 0.5990189, -2.278457, 0, 0, 1, 1, 1,
-1.002369, -0.4939466, -3.181833, 1, 0, 0, 1, 1,
-0.9955267, -1.309957, -2.68788, 1, 0, 0, 1, 1,
-0.992465, -1.531125, -3.748357, 1, 0, 0, 1, 1,
-0.9897812, 0.185538, -3.220344, 1, 0, 0, 1, 1,
-0.9893692, -1.545137, -1.619065, 1, 0, 0, 1, 1,
-0.9767265, -0.7939689, -2.254419, 0, 0, 0, 1, 1,
-0.9754108, -0.9118016, -5.503902, 0, 0, 0, 1, 1,
-0.9734073, 0.3112839, -0.08434235, 0, 0, 0, 1, 1,
-0.9727219, -1.889984, -2.39176, 0, 0, 0, 1, 1,
-0.9571996, 0.5008432, 0.2221156, 0, 0, 0, 1, 1,
-0.9563461, -3.542233e-05, -1.692777, 0, 0, 0, 1, 1,
-0.9500516, -2.358276, -2.501422, 0, 0, 0, 1, 1,
-0.9442921, 1.287373, -0.1847191, 1, 1, 1, 1, 1,
-0.9421429, -0.05922053, -2.259639, 1, 1, 1, 1, 1,
-0.9342143, 0.04649058, -2.334621, 1, 1, 1, 1, 1,
-0.9304359, -1.461593, -1.614395, 1, 1, 1, 1, 1,
-0.9271638, -0.3028402, -2.760353, 1, 1, 1, 1, 1,
-0.9145992, 2.59021, -0.7007809, 1, 1, 1, 1, 1,
-0.9123071, 0.2843048, -1.045652, 1, 1, 1, 1, 1,
-0.9010066, -2.483615, -1.893039, 1, 1, 1, 1, 1,
-0.9006354, -0.9880589, 1.116371, 1, 1, 1, 1, 1,
-0.899436, 0.4049042, -2.675903, 1, 1, 1, 1, 1,
-0.8993072, -1.401846, -1.115729, 1, 1, 1, 1, 1,
-0.897388, 1.022171, -1.134736, 1, 1, 1, 1, 1,
-0.8939379, -0.3361337, -2.79246, 1, 1, 1, 1, 1,
-0.8888832, 0.08286361, -1.501652, 1, 1, 1, 1, 1,
-0.8822551, 1.856774, 1.287009, 1, 1, 1, 1, 1,
-0.8786916, 0.5648014, -0.302969, 0, 0, 1, 1, 1,
-0.8764742, 1.688133, -1.870753, 1, 0, 0, 1, 1,
-0.8730398, -0.9926348, -3.79625, 1, 0, 0, 1, 1,
-0.8588791, -0.5643938, -3.655081, 1, 0, 0, 1, 1,
-0.8549351, -0.5643301, -1.638535, 1, 0, 0, 1, 1,
-0.8540098, -0.1776257, -0.7691057, 1, 0, 0, 1, 1,
-0.8538154, -1.183622, -2.370698, 0, 0, 0, 1, 1,
-0.8477842, -0.7261519, -1.869992, 0, 0, 0, 1, 1,
-0.8464867, 0.7212539, 0.2588921, 0, 0, 0, 1, 1,
-0.8463987, -0.1154235, -2.330949, 0, 0, 0, 1, 1,
-0.8394772, -1.018091, -2.886987, 0, 0, 0, 1, 1,
-0.838245, -1.216197, -1.624193, 0, 0, 0, 1, 1,
-0.8376002, 1.462895, -0.1824445, 0, 0, 0, 1, 1,
-0.8369699, 0.4447612, 0.5742366, 1, 1, 1, 1, 1,
-0.8314551, -0.217425, -0.96286, 1, 1, 1, 1, 1,
-0.8302195, 1.482052, -0.8435413, 1, 1, 1, 1, 1,
-0.8234904, 0.344889, -2.253132, 1, 1, 1, 1, 1,
-0.8216211, -0.2425153, -0.5338883, 1, 1, 1, 1, 1,
-0.8206751, 0.7235416, 0.3943518, 1, 1, 1, 1, 1,
-0.8081045, 0.3735754, -0.01708246, 1, 1, 1, 1, 1,
-0.803044, -0.6029102, -4.103051, 1, 1, 1, 1, 1,
-0.8007716, 0.2397094, -1.546876, 1, 1, 1, 1, 1,
-0.7983067, -0.5568876, -1.99241, 1, 1, 1, 1, 1,
-0.7958359, 0.3473839, -2.38788, 1, 1, 1, 1, 1,
-0.7944867, 1.205183, -2.69238, 1, 1, 1, 1, 1,
-0.7904236, 0.7179097, -1.915361, 1, 1, 1, 1, 1,
-0.7818828, -0.1746051, -2.404681, 1, 1, 1, 1, 1,
-0.7778566, 1.449347, -1.84687, 1, 1, 1, 1, 1,
-0.7775505, -1.411974, -1.242662, 0, 0, 1, 1, 1,
-0.7772225, 0.8695673, -0.7963488, 1, 0, 0, 1, 1,
-0.7770981, -0.2539586, -1.455414, 1, 0, 0, 1, 1,
-0.7696232, -0.05444096, -0.7556729, 1, 0, 0, 1, 1,
-0.7649768, 0.1902279, -2.088941, 1, 0, 0, 1, 1,
-0.7632851, 1.013366, 0.1929905, 1, 0, 0, 1, 1,
-0.7564795, -0.2386145, -1.619018, 0, 0, 0, 1, 1,
-0.7508652, 0.4850344, -1.433692, 0, 0, 0, 1, 1,
-0.7496735, -0.1306773, -1.662274, 0, 0, 0, 1, 1,
-0.7413582, 0.4521718, -0.8904632, 0, 0, 0, 1, 1,
-0.7407073, 1.149684, -1.250691, 0, 0, 0, 1, 1,
-0.7370989, -0.2630224, -1.187038, 0, 0, 0, 1, 1,
-0.7354007, -0.5258762, -1.248329, 0, 0, 0, 1, 1,
-0.7303789, 0.1043576, -1.371265, 1, 1, 1, 1, 1,
-0.7284406, 0.9703269, -0.4696089, 1, 1, 1, 1, 1,
-0.7251519, -0.7451559, -1.28341, 1, 1, 1, 1, 1,
-0.7248992, -1.114453, -3.61777, 1, 1, 1, 1, 1,
-0.7204587, -1.782161, -2.823498, 1, 1, 1, 1, 1,
-0.7193575, 0.8052082, 3.002261, 1, 1, 1, 1, 1,
-0.7139397, -0.6713773, -2.670771, 1, 1, 1, 1, 1,
-0.7133299, -0.1793453, -2.239351, 1, 1, 1, 1, 1,
-0.7044126, -1.039405, -3.242779, 1, 1, 1, 1, 1,
-0.7040781, 0.09109837, -2.872051, 1, 1, 1, 1, 1,
-0.7026448, 1.417967, -0.2840356, 1, 1, 1, 1, 1,
-0.7025032, -0.001175605, -2.134201, 1, 1, 1, 1, 1,
-0.7018738, -0.4947565, -1.300393, 1, 1, 1, 1, 1,
-0.6994, 0.6742505, -1.124176, 1, 1, 1, 1, 1,
-0.699365, -0.4430573, -2.240381, 1, 1, 1, 1, 1,
-0.6937659, -0.3095398, -2.145863, 0, 0, 1, 1, 1,
-0.6907024, 0.1179014, -2.761158, 1, 0, 0, 1, 1,
-0.6892643, -1.473641, -0.9145762, 1, 0, 0, 1, 1,
-0.6882711, 0.3669259, -1.391251, 1, 0, 0, 1, 1,
-0.6876228, -0.3417558, -1.244515, 1, 0, 0, 1, 1,
-0.6839259, 0.2754011, -1.441238, 1, 0, 0, 1, 1,
-0.6830957, 0.8225098, -0.7589492, 0, 0, 0, 1, 1,
-0.6815755, -1.149325, -1.86782, 0, 0, 0, 1, 1,
-0.6785665, 1.227558, 1.219253, 0, 0, 0, 1, 1,
-0.6775385, -0.7948596, -4.115588, 0, 0, 0, 1, 1,
-0.6772501, 1.327323, -1.2139, 0, 0, 0, 1, 1,
-0.677195, 1.099014, 1.021458, 0, 0, 0, 1, 1,
-0.6763664, 0.8323931, -0.2063872, 0, 0, 0, 1, 1,
-0.6719956, -0.1470711, -2.544479, 1, 1, 1, 1, 1,
-0.6654509, -1.392489, -3.185638, 1, 1, 1, 1, 1,
-0.6485983, 0.7323396, 0.02967005, 1, 1, 1, 1, 1,
-0.6476789, 0.5445524, -0.41188, 1, 1, 1, 1, 1,
-0.6473987, -0.5368521, -2.578874, 1, 1, 1, 1, 1,
-0.6447811, 1.095014, -2.300311, 1, 1, 1, 1, 1,
-0.6422108, -0.03650342, -2.47588, 1, 1, 1, 1, 1,
-0.6412354, 0.3060639, -2.926828, 1, 1, 1, 1, 1,
-0.639681, -0.4462506, -2.93218, 1, 1, 1, 1, 1,
-0.6324508, 1.302132, 0.580673, 1, 1, 1, 1, 1,
-0.6272146, -0.4164495, -1.827241, 1, 1, 1, 1, 1,
-0.6244224, 0.2409808, -2.266993, 1, 1, 1, 1, 1,
-0.6150772, 0.2658806, 0.3321477, 1, 1, 1, 1, 1,
-0.609545, -2.136328, -1.945361, 1, 1, 1, 1, 1,
-0.6090044, -0.5197075, -1.361628, 1, 1, 1, 1, 1,
-0.6088758, -0.1257807, -2.358986, 0, 0, 1, 1, 1,
-0.6078491, -0.2612501, -2.484664, 1, 0, 0, 1, 1,
-0.6066623, -1.482924, -2.87139, 1, 0, 0, 1, 1,
-0.6028829, -1.553959, -2.458658, 1, 0, 0, 1, 1,
-0.6003641, 1.702049, -0.09457233, 1, 0, 0, 1, 1,
-0.5981698, -0.07785674, -0.8162174, 1, 0, 0, 1, 1,
-0.5957279, 0.1082193, -3.63205, 0, 0, 0, 1, 1,
-0.594852, 0.9191598, -1.286637, 0, 0, 0, 1, 1,
-0.5934286, 0.002074308, -2.30599, 0, 0, 0, 1, 1,
-0.5915849, -0.8325858, -2.431323, 0, 0, 0, 1, 1,
-0.5868806, 0.7730178, -0.6476247, 0, 0, 0, 1, 1,
-0.579438, -0.4954362, -2.567432, 0, 0, 0, 1, 1,
-0.5755342, -0.9450563, -0.7716013, 0, 0, 0, 1, 1,
-0.5705831, -0.8802796, -1.677673, 1, 1, 1, 1, 1,
-0.5703912, -0.2798965, -1.507122, 1, 1, 1, 1, 1,
-0.5528991, -0.08980745, -2.700537, 1, 1, 1, 1, 1,
-0.5508361, 1.307456, -1.294113, 1, 1, 1, 1, 1,
-0.5472338, -0.2789259, -3.266622, 1, 1, 1, 1, 1,
-0.5384606, 0.242877, -1.738721, 1, 1, 1, 1, 1,
-0.5379397, 0.8161135, -0.4371811, 1, 1, 1, 1, 1,
-0.5369918, 0.1369359, -0.4073241, 1, 1, 1, 1, 1,
-0.5282944, -0.5968241, -1.298868, 1, 1, 1, 1, 1,
-0.5280919, 0.8513251, -0.5383353, 1, 1, 1, 1, 1,
-0.5255538, -0.258461, -1.953695, 1, 1, 1, 1, 1,
-0.5200159, 1.157279, 0.5777668, 1, 1, 1, 1, 1,
-0.5110592, -0.2175097, -4.283644, 1, 1, 1, 1, 1,
-0.5053569, 0.4557691, -1.729844, 1, 1, 1, 1, 1,
-0.5036845, -0.8387055, -1.486824, 1, 1, 1, 1, 1,
-0.502678, 0.4826353, -2.164452, 0, 0, 1, 1, 1,
-0.5015193, -0.3443263, -1.253678, 1, 0, 0, 1, 1,
-0.5009395, -0.2168897, -0.2790244, 1, 0, 0, 1, 1,
-0.4988481, 0.717785, -2.400524, 1, 0, 0, 1, 1,
-0.4916637, -0.07359552, -2.937717, 1, 0, 0, 1, 1,
-0.4903694, -1.134987, -1.567298, 1, 0, 0, 1, 1,
-0.4885994, 2.029099, -0.1998848, 0, 0, 0, 1, 1,
-0.4883331, 0.4948741, -0.5809035, 0, 0, 0, 1, 1,
-0.4874381, -1.336794, -2.147902, 0, 0, 0, 1, 1,
-0.4870577, -1.300498, -3.988555, 0, 0, 0, 1, 1,
-0.4829417, -0.9520493, -1.115048, 0, 0, 0, 1, 1,
-0.4824398, 0.5411688, -0.5688714, 0, 0, 0, 1, 1,
-0.4818249, -0.1163294, -0.9301167, 0, 0, 0, 1, 1,
-0.4816394, -0.1343785, -0.5260091, 1, 1, 1, 1, 1,
-0.4806964, 0.07549484, -0.751703, 1, 1, 1, 1, 1,
-0.4753099, -0.6387127, -1.489388, 1, 1, 1, 1, 1,
-0.4750871, -0.1287754, -2.105071, 1, 1, 1, 1, 1,
-0.473906, -0.1265333, -1.506115, 1, 1, 1, 1, 1,
-0.4731718, -0.2560805, -2.387752, 1, 1, 1, 1, 1,
-0.4713591, 1.458946, -0.5487749, 1, 1, 1, 1, 1,
-0.4682555, 1.583162, -1.429621, 1, 1, 1, 1, 1,
-0.468053, 0.2429842, -1.688053, 1, 1, 1, 1, 1,
-0.4672839, 0.8693077, -0.6332247, 1, 1, 1, 1, 1,
-0.4644799, -0.2622454, -0.9513264, 1, 1, 1, 1, 1,
-0.4625319, 0.7712879, 0.2355084, 1, 1, 1, 1, 1,
-0.462064, -1.62414, -2.715189, 1, 1, 1, 1, 1,
-0.4586035, -0.6408542, -3.837954, 1, 1, 1, 1, 1,
-0.4578127, -1.623946, -3.2226, 1, 1, 1, 1, 1,
-0.4572288, 0.6209291, -0.5527741, 0, 0, 1, 1, 1,
-0.456906, -1.234657, -2.912125, 1, 0, 0, 1, 1,
-0.4565159, -0.938204, -1.248008, 1, 0, 0, 1, 1,
-0.4544149, 0.2638008, -1.572446, 1, 0, 0, 1, 1,
-0.4519067, -0.4561277, -3.05925, 1, 0, 0, 1, 1,
-0.4451403, 1.952109, -1.722642, 1, 0, 0, 1, 1,
-0.442971, 2.5668, 0.4969169, 0, 0, 0, 1, 1,
-0.4341115, -1.39804, -1.578275, 0, 0, 0, 1, 1,
-0.4330313, 0.7138385, -0.1112094, 0, 0, 0, 1, 1,
-0.4285503, -1.057289, -1.939419, 0, 0, 0, 1, 1,
-0.4234802, 0.4291409, -1.008415, 0, 0, 0, 1, 1,
-0.4232923, 0.1899488, -1.187565, 0, 0, 0, 1, 1,
-0.423187, -0.8558743, -2.657735, 0, 0, 0, 1, 1,
-0.421666, -1.404684, -1.793877, 1, 1, 1, 1, 1,
-0.419743, -0.8707709, -4.168358, 1, 1, 1, 1, 1,
-0.4192663, 1.114538, -0.3546157, 1, 1, 1, 1, 1,
-0.4190238, 0.6550113, 0.116612, 1, 1, 1, 1, 1,
-0.4122308, 0.05832275, -3.291185, 1, 1, 1, 1, 1,
-0.4111593, 1.458892, -1.434916, 1, 1, 1, 1, 1,
-0.4061366, -0.699369, -4.518157, 1, 1, 1, 1, 1,
-0.4059928, 1.569524, 0.07265572, 1, 1, 1, 1, 1,
-0.4055013, -0.1270698, 0.3755952, 1, 1, 1, 1, 1,
-0.397737, 2.647459, -1.149064, 1, 1, 1, 1, 1,
-0.3910732, -0.6244692, -4.225297, 1, 1, 1, 1, 1,
-0.3830267, 1.154164, -0.4698438, 1, 1, 1, 1, 1,
-0.3740115, 0.01407709, -2.710266, 1, 1, 1, 1, 1,
-0.3722216, -0.9469133, -1.177896, 1, 1, 1, 1, 1,
-0.3657415, 0.9020237, 0.04404576, 1, 1, 1, 1, 1,
-0.365191, 1.78026, -1.807921, 0, 0, 1, 1, 1,
-0.3600622, 0.5650657, 0.1474928, 1, 0, 0, 1, 1,
-0.3578699, 0.2891679, -1.868393, 1, 0, 0, 1, 1,
-0.3513338, -0.2116975, -1.950125, 1, 0, 0, 1, 1,
-0.3398277, 0.3800579, 0.0857967, 1, 0, 0, 1, 1,
-0.3382832, -0.8422658, -4.27436, 1, 0, 0, 1, 1,
-0.3374845, 1.209284, 1.237906, 0, 0, 0, 1, 1,
-0.3369905, 0.6786939, -0.1710421, 0, 0, 0, 1, 1,
-0.3344395, -0.126976, -2.264275, 0, 0, 0, 1, 1,
-0.3256552, -0.5065603, -4.362177, 0, 0, 0, 1, 1,
-0.3249542, -0.03434503, -1.894491, 0, 0, 0, 1, 1,
-0.3244076, -1.020412, -4.102182, 0, 0, 0, 1, 1,
-0.3221978, 0.3089432, 0.06103421, 0, 0, 0, 1, 1,
-0.3177949, 0.2028745, -0.1073816, 1, 1, 1, 1, 1,
-0.3086678, -1.088148, -3.975781, 1, 1, 1, 1, 1,
-0.3040703, -0.4915976, -3.34134, 1, 1, 1, 1, 1,
-0.292589, 1.832581, -0.591201, 1, 1, 1, 1, 1,
-0.2924686, -0.7553685, -1.437876, 1, 1, 1, 1, 1,
-0.2783586, -0.8930445, -4.220356, 1, 1, 1, 1, 1,
-0.2715194, -0.5007411, -2.346295, 1, 1, 1, 1, 1,
-0.2708288, -1.517239, -2.929368, 1, 1, 1, 1, 1,
-0.2645304, 0.4240446, -1.176778, 1, 1, 1, 1, 1,
-0.2622581, -1.115832, -3.382547, 1, 1, 1, 1, 1,
-0.2601296, 0.6508865, -0.8568421, 1, 1, 1, 1, 1,
-0.2483106, -1.529708, -1.076222, 1, 1, 1, 1, 1,
-0.2435211, 0.5652701, -0.08028311, 1, 1, 1, 1, 1,
-0.240958, -2.12919, -5.286165, 1, 1, 1, 1, 1,
-0.2355357, -0.1700166, -2.009358, 1, 1, 1, 1, 1,
-0.2353068, -0.3303035, -3.274312, 0, 0, 1, 1, 1,
-0.231654, 1.350274, -0.8439209, 1, 0, 0, 1, 1,
-0.2316095, -1.159992, -3.315935, 1, 0, 0, 1, 1,
-0.2297665, 0.1597406, 0.3368789, 1, 0, 0, 1, 1,
-0.2296716, 1.111767, -0.6578594, 1, 0, 0, 1, 1,
-0.2189897, 0.4761977, -1.957405, 1, 0, 0, 1, 1,
-0.2189682, -0.3786513, -3.289463, 0, 0, 0, 1, 1,
-0.2179969, -0.03925149, -1.402271, 0, 0, 0, 1, 1,
-0.2135875, -1.005951, -3.481897, 0, 0, 0, 1, 1,
-0.2129976, -0.1475184, -2.774481, 0, 0, 0, 1, 1,
-0.2098159, 0.159887, 0.5346689, 0, 0, 0, 1, 1,
-0.2091152, 0.2760252, -1.441096, 0, 0, 0, 1, 1,
-0.2086792, -1.300384, -2.524821, 0, 0, 0, 1, 1,
-0.2086095, -0.8421986, -4.408127, 1, 1, 1, 1, 1,
-0.2007353, 1.118488, -1.01686, 1, 1, 1, 1, 1,
-0.1963347, 0.08036575, -1.433212, 1, 1, 1, 1, 1,
-0.1946386, 1.60903, 0.3429744, 1, 1, 1, 1, 1,
-0.1944843, 1.005664, 1.181754, 1, 1, 1, 1, 1,
-0.1937561, 1.388916, 1.528898, 1, 1, 1, 1, 1,
-0.1868601, 1.433887, 0.7762287, 1, 1, 1, 1, 1,
-0.1755645, -1.144017, -4.70182, 1, 1, 1, 1, 1,
-0.1654652, 0.5764347, -0.282547, 1, 1, 1, 1, 1,
-0.1610604, -0.5202122, -2.415465, 1, 1, 1, 1, 1,
-0.1607551, 1.512678, -1.344534, 1, 1, 1, 1, 1,
-0.1576955, -0.6173875, -5.497175, 1, 1, 1, 1, 1,
-0.1565679, -0.5380276, -2.264934, 1, 1, 1, 1, 1,
-0.1557446, 0.4567918, -0.08560771, 1, 1, 1, 1, 1,
-0.1551348, -1.642801, -2.104678, 1, 1, 1, 1, 1,
-0.1508288, -0.3546928, -5.126269, 0, 0, 1, 1, 1,
-0.1503584, -0.6631836, -1.757868, 1, 0, 0, 1, 1,
-0.1469911, 1.69624, 0.1540498, 1, 0, 0, 1, 1,
-0.1469051, -0.5335651, -4.001893, 1, 0, 0, 1, 1,
-0.1458489, -0.2759448, -2.857486, 1, 0, 0, 1, 1,
-0.1440221, 0.6372719, 0.8390259, 1, 0, 0, 1, 1,
-0.140388, 0.6003183, -0.8648567, 0, 0, 0, 1, 1,
-0.1388045, -0.9420583, -0.8135486, 0, 0, 0, 1, 1,
-0.1386033, -0.02568238, -1.078922, 0, 0, 0, 1, 1,
-0.1370688, 0.1452592, -2.20923, 0, 0, 0, 1, 1,
-0.1323029, 0.1797147, -1.036079, 0, 0, 0, 1, 1,
-0.1315691, 0.7575511, -0.2211615, 0, 0, 0, 1, 1,
-0.1312951, -0.8279679, -2.465845, 0, 0, 0, 1, 1,
-0.1310971, -1.373379, -4.113025, 1, 1, 1, 1, 1,
-0.1306468, -0.8853785, -2.677471, 1, 1, 1, 1, 1,
-0.129773, -1.660386, -1.917216, 1, 1, 1, 1, 1,
-0.1207571, 0.02996629, -1.057099, 1, 1, 1, 1, 1,
-0.1187238, 1.415437, -0.7490849, 1, 1, 1, 1, 1,
-0.1160582, 1.681675, 0.2552596, 1, 1, 1, 1, 1,
-0.1116543, 0.5758497, 0.1596347, 1, 1, 1, 1, 1,
-0.1116308, 0.8960599, -0.1307544, 1, 1, 1, 1, 1,
-0.1093383, -0.6168507, -3.820435, 1, 1, 1, 1, 1,
-0.1079038, -0.28446, -2.996142, 1, 1, 1, 1, 1,
-0.1040967, 1.215079, 0.5305863, 1, 1, 1, 1, 1,
-0.1030278, 0.4565346, -1.955805, 1, 1, 1, 1, 1,
-0.09707521, 0.3971676, 0.5802916, 1, 1, 1, 1, 1,
-0.09647886, 0.9160602, -1.0885, 1, 1, 1, 1, 1,
-0.0937347, -0.006705329, 0.3340432, 1, 1, 1, 1, 1,
-0.0881719, 1.12991, -1.611626, 0, 0, 1, 1, 1,
-0.08635265, -0.8271306, -3.566919, 1, 0, 0, 1, 1,
-0.0855392, -0.02140456, -2.911406, 1, 0, 0, 1, 1,
-0.08100469, -0.2680313, -0.7881883, 1, 0, 0, 1, 1,
-0.07987968, -0.1777231, -1.520499, 1, 0, 0, 1, 1,
-0.07916658, 0.4521514, -1.552082, 1, 0, 0, 1, 1,
-0.07639419, -0.1154024, -4.142076, 0, 0, 0, 1, 1,
-0.07089942, 0.1249353, -1.90152, 0, 0, 0, 1, 1,
-0.06896641, 0.6095796, 0.6362548, 0, 0, 0, 1, 1,
-0.06575413, -0.4242196, -4.107026, 0, 0, 0, 1, 1,
-0.06206443, 1.170023, -1.388135, 0, 0, 0, 1, 1,
-0.05788988, 0.04962367, -0.4549693, 0, 0, 0, 1, 1,
-0.05683479, -0.84641, -3.11625, 0, 0, 0, 1, 1,
-0.05389374, 0.916826, -1.42317, 1, 1, 1, 1, 1,
-0.05190831, 0.2688887, 0.918302, 1, 1, 1, 1, 1,
-0.05064761, 0.7245618, 1.674396, 1, 1, 1, 1, 1,
-0.04726354, -1.000318, -3.088731, 1, 1, 1, 1, 1,
-0.04572221, 0.9138225, -0.4233107, 1, 1, 1, 1, 1,
-0.04131804, 0.8881014, 1.95588, 1, 1, 1, 1, 1,
-0.03905104, 0.003925527, -2.550425, 1, 1, 1, 1, 1,
-0.03868908, 1.70317, -0.07319878, 1, 1, 1, 1, 1,
-0.03837372, -2.181713, -1.896324, 1, 1, 1, 1, 1,
-0.03569769, -0.5845858, -1.813167, 1, 1, 1, 1, 1,
-0.03548183, 0.01720391, -1.12522, 1, 1, 1, 1, 1,
-0.02930094, 0.1229483, -2.102912, 1, 1, 1, 1, 1,
-0.02879113, 0.9587442, -0.9053401, 1, 1, 1, 1, 1,
-0.02728267, -0.8849822, -2.805821, 1, 1, 1, 1, 1,
-0.02559718, -0.8375286, -2.349999, 1, 1, 1, 1, 1,
-0.02526991, -1.179432, -4.119079, 0, 0, 1, 1, 1,
-0.02097764, -0.7617446, -3.36495, 1, 0, 0, 1, 1,
-0.02041262, -1.111579, -1.660277, 1, 0, 0, 1, 1,
-0.01964539, -0.1921322, -3.744147, 1, 0, 0, 1, 1,
-0.01920568, -0.6213219, -3.175173, 1, 0, 0, 1, 1,
-0.01258395, -0.1551258, -1.791184, 1, 0, 0, 1, 1,
-0.009640977, 0.3661406, -0.8603989, 0, 0, 0, 1, 1,
-0.008312557, -0.7231085, -3.638804, 0, 0, 0, 1, 1,
-0.001765982, 0.3438729, -1.262896, 0, 0, 0, 1, 1,
0.0002976756, -0.5771516, 2.1549, 0, 0, 0, 1, 1,
0.001180163, 1.124012, -0.4024698, 0, 0, 0, 1, 1,
0.001536893, 0.05817547, 0.8612484, 0, 0, 0, 1, 1,
0.007793369, -1.861925, 2.9358, 0, 0, 0, 1, 1,
0.01006409, -1.038177, 3.041244, 1, 1, 1, 1, 1,
0.01334654, 0.6723943, 0.591614, 1, 1, 1, 1, 1,
0.01407792, 1.732159, 0.4622663, 1, 1, 1, 1, 1,
0.01482085, 0.7454413, -0.8464013, 1, 1, 1, 1, 1,
0.01584491, 1.462746, -0.07081565, 1, 1, 1, 1, 1,
0.01942708, -1.028304, 3.055541, 1, 1, 1, 1, 1,
0.02571394, -0.726258, 3.889452, 1, 1, 1, 1, 1,
0.02591895, -0.75144, 3.661742, 1, 1, 1, 1, 1,
0.02595348, 0.193297, -0.5160276, 1, 1, 1, 1, 1,
0.0271133, 0.3741188, -0.7707162, 1, 1, 1, 1, 1,
0.02883751, 1.504292, -1.458387, 1, 1, 1, 1, 1,
0.02959905, -0.5678115, 5.177027, 1, 1, 1, 1, 1,
0.03775453, -0.1732634, 2.813957, 1, 1, 1, 1, 1,
0.03905092, -1.792963, 2.074524, 1, 1, 1, 1, 1,
0.03963156, -2.044788, 2.459994, 1, 1, 1, 1, 1,
0.05106413, -0.5340421, 3.552875, 0, 0, 1, 1, 1,
0.05112719, -1.219545, 3.377622, 1, 0, 0, 1, 1,
0.05125443, 0.06744926, 0.2228196, 1, 0, 0, 1, 1,
0.05167783, 0.806912, -0.2247111, 1, 0, 0, 1, 1,
0.0529679, 0.3309857, -1.133345, 1, 0, 0, 1, 1,
0.05574319, 1.311522, 2.438737, 1, 0, 0, 1, 1,
0.06049745, -0.4189755, 3.177803, 0, 0, 0, 1, 1,
0.06906179, -0.08204594, 3.361721, 0, 0, 0, 1, 1,
0.06915246, -1.107787, 2.98923, 0, 0, 0, 1, 1,
0.07073174, 0.5343549, -0.08915431, 0, 0, 0, 1, 1,
0.07125127, -2.171992, 4.334906, 0, 0, 0, 1, 1,
0.0717863, 0.874097, 1.131017, 0, 0, 0, 1, 1,
0.07308305, 1.09929, 0.1562386, 0, 0, 0, 1, 1,
0.07683914, -0.5507421, 4.750033, 1, 1, 1, 1, 1,
0.07835843, -1.023992, 3.015781, 1, 1, 1, 1, 1,
0.07944427, -0.8727102, 2.963014, 1, 1, 1, 1, 1,
0.08031823, -1.362393, 3.408576, 1, 1, 1, 1, 1,
0.08353721, -1.978646, 2.721599, 1, 1, 1, 1, 1,
0.08525343, -1.479118, 3.209262, 1, 1, 1, 1, 1,
0.08568048, 0.4304107, 1.111676, 1, 1, 1, 1, 1,
0.08745204, 1.982235, 1.817667, 1, 1, 1, 1, 1,
0.08930781, -1.332617, 3.023495, 1, 1, 1, 1, 1,
0.09060186, -0.2431867, 3.730621, 1, 1, 1, 1, 1,
0.0922954, 0.5836232, 0.1863239, 1, 1, 1, 1, 1,
0.0930752, 0.8460845, -0.6249292, 1, 1, 1, 1, 1,
0.1044798, 0.5061336, 0.8836616, 1, 1, 1, 1, 1,
0.1073104, 0.1629877, 1.10354, 1, 1, 1, 1, 1,
0.1090563, 0.84922, -1.460926, 1, 1, 1, 1, 1,
0.1191336, 0.2264937, 1.121834, 0, 0, 1, 1, 1,
0.1206036, 1.280379, -1.101531, 1, 0, 0, 1, 1,
0.1221498, -0.7726688, 3.928929, 1, 0, 0, 1, 1,
0.1239798, -2.644069, 2.81676, 1, 0, 0, 1, 1,
0.1255686, 0.9322974, 0.2911972, 1, 0, 0, 1, 1,
0.1338554, -0.1794316, 2.579989, 1, 0, 0, 1, 1,
0.1343144, 0.1224609, 2.36281, 0, 0, 0, 1, 1,
0.1367767, 1.829967, -1.664491, 0, 0, 0, 1, 1,
0.1376213, 1.876846, -0.6241624, 0, 0, 0, 1, 1,
0.1376487, -0.1587352, 3.433912, 0, 0, 0, 1, 1,
0.1392351, -0.7920967, 3.588279, 0, 0, 0, 1, 1,
0.1413558, -0.5080394, 2.42532, 0, 0, 0, 1, 1,
0.1421387, -0.9737833, 2.734934, 0, 0, 0, 1, 1,
0.142336, -0.8996666, 3.118675, 1, 1, 1, 1, 1,
0.1426841, -0.06958726, 3.660738, 1, 1, 1, 1, 1,
0.143526, -0.5764038, 2.476603, 1, 1, 1, 1, 1,
0.1488939, -1.154215, 1.002892, 1, 1, 1, 1, 1,
0.1522155, 0.2072776, -0.1634987, 1, 1, 1, 1, 1,
0.1526908, 1.20747, 0.9638442, 1, 1, 1, 1, 1,
0.1532515, 0.9065474, 0.5936632, 1, 1, 1, 1, 1,
0.1574417, -0.4833992, 2.355285, 1, 1, 1, 1, 1,
0.1606161, -0.6839031, 2.523596, 1, 1, 1, 1, 1,
0.1609867, -0.3315468, 2.038201, 1, 1, 1, 1, 1,
0.1610265, -0.6494987, 4.603906, 1, 1, 1, 1, 1,
0.1633175, -1.153199, 1.673189, 1, 1, 1, 1, 1,
0.1702935, -2.147623, 1.161232, 1, 1, 1, 1, 1,
0.1742298, -1.808087, 3.953982, 1, 1, 1, 1, 1,
0.1743806, -1.107207, 3.670467, 1, 1, 1, 1, 1,
0.176654, -1.138043, 1.00376, 0, 0, 1, 1, 1,
0.1827761, -0.08225981, 2.97616, 1, 0, 0, 1, 1,
0.1875641, -1.578671, 3.493427, 1, 0, 0, 1, 1,
0.1921655, 1.186347, 1.133864, 1, 0, 0, 1, 1,
0.192293, 0.8632749, -1.229327, 1, 0, 0, 1, 1,
0.1934438, -1.680909, 5.080913, 1, 0, 0, 1, 1,
0.199722, -1.78633, 3.171087, 0, 0, 0, 1, 1,
0.2017587, -0.3274284, 2.440706, 0, 0, 0, 1, 1,
0.2033454, 0.3590061, 2.329682, 0, 0, 0, 1, 1,
0.2058663, 0.7149543, 0.9983385, 0, 0, 0, 1, 1,
0.2071313, 0.5506654, 1.106554, 0, 0, 0, 1, 1,
0.2071991, 0.2140455, 0.2366295, 0, 0, 0, 1, 1,
0.207775, -0.2598026, 2.895359, 0, 0, 0, 1, 1,
0.2079062, -1.263549, 3.109593, 1, 1, 1, 1, 1,
0.2084017, 0.5792627, 1.51451, 1, 1, 1, 1, 1,
0.2100492, -1.117582, 3.455281, 1, 1, 1, 1, 1,
0.2176458, 0.6151082, -0.7750106, 1, 1, 1, 1, 1,
0.2207954, -1.311533, 1.784487, 1, 1, 1, 1, 1,
0.2214193, 0.7725088, -0.9488109, 1, 1, 1, 1, 1,
0.2280446, 0.1843006, -1.692612, 1, 1, 1, 1, 1,
0.2292347, 1.664961, 1.329435, 1, 1, 1, 1, 1,
0.2342607, -0.7464897, 5.064608, 1, 1, 1, 1, 1,
0.2343972, -1.131092, 3.971765, 1, 1, 1, 1, 1,
0.2358916, -0.2122758, 2.892718, 1, 1, 1, 1, 1,
0.2362255, -0.3010695, 1.450363, 1, 1, 1, 1, 1,
0.2424416, -0.007605935, 0.2649708, 1, 1, 1, 1, 1,
0.2431, -2.832251, 2.575783, 1, 1, 1, 1, 1,
0.243743, -0.2216132, 3.643713, 1, 1, 1, 1, 1,
0.2443199, 1.066698, -0.9649329, 0, 0, 1, 1, 1,
0.2452645, -1.486989, 3.76278, 1, 0, 0, 1, 1,
0.247067, -0.4179307, 3.732724, 1, 0, 0, 1, 1,
0.2491772, -1.652593, 2.459505, 1, 0, 0, 1, 1,
0.2513377, -0.2761449, 1.294785, 1, 0, 0, 1, 1,
0.2527955, -1.65234, 3.360981, 1, 0, 0, 1, 1,
0.2557715, -0.8149295, 2.557986, 0, 0, 0, 1, 1,
0.258947, -0.5227764, 1.588055, 0, 0, 0, 1, 1,
0.2623399, -0.8332791, 2.807782, 0, 0, 0, 1, 1,
0.2676444, 1.612863, -0.6676469, 0, 0, 0, 1, 1,
0.2691622, -1.445276, 4.834419, 0, 0, 0, 1, 1,
0.2700537, 1.260944, -0.3869602, 0, 0, 0, 1, 1,
0.2704366, 0.3826926, 0.2391401, 0, 0, 0, 1, 1,
0.2709399, -0.04810829, 2.142673, 1, 1, 1, 1, 1,
0.2755451, -1.011314, 1.704474, 1, 1, 1, 1, 1,
0.2758066, -1.430254, 2.227112, 1, 1, 1, 1, 1,
0.280614, 1.003222, 0.3333201, 1, 1, 1, 1, 1,
0.2830633, 0.8190975, 1.906406, 1, 1, 1, 1, 1,
0.2833025, -0.1483262, 0.497889, 1, 1, 1, 1, 1,
0.2834233, -0.1884374, 2.140216, 1, 1, 1, 1, 1,
0.2849113, 1.099165, 1.226332, 1, 1, 1, 1, 1,
0.2895535, -0.7816124, 2.515352, 1, 1, 1, 1, 1,
0.2897898, -1.690189, 4.555951, 1, 1, 1, 1, 1,
0.2988254, -0.299109, 1.691119, 1, 1, 1, 1, 1,
0.3098893, -0.2241173, 3.697314, 1, 1, 1, 1, 1,
0.3101304, 1.868919, -0.7141322, 1, 1, 1, 1, 1,
0.3195068, 0.9700664, -0.05909114, 1, 1, 1, 1, 1,
0.3211022, -0.6141936, 2.396033, 1, 1, 1, 1, 1,
0.3241807, -0.7594187, 2.968531, 0, 0, 1, 1, 1,
0.3243762, 0.4470675, 1.205897, 1, 0, 0, 1, 1,
0.3250776, 0.3400414, 0.08616565, 1, 0, 0, 1, 1,
0.3268586, -0.708453, 2.662636, 1, 0, 0, 1, 1,
0.3280977, -0.04104467, 0.6323349, 1, 0, 0, 1, 1,
0.3292532, 0.5480009, 0.8836132, 1, 0, 0, 1, 1,
0.3307963, -0.7062942, 2.905824, 0, 0, 0, 1, 1,
0.3312584, -0.8736879, 2.755279, 0, 0, 0, 1, 1,
0.3325794, 1.324041, 0.2382288, 0, 0, 0, 1, 1,
0.3367087, -0.3274342, 0.7901573, 0, 0, 0, 1, 1,
0.3529772, 0.8104603, 1.059486, 0, 0, 0, 1, 1,
0.3564347, -0.3242762, 2.252352, 0, 0, 0, 1, 1,
0.356815, 0.2908746, 0.3996767, 0, 0, 0, 1, 1,
0.356932, 0.6293017, -0.03253214, 1, 1, 1, 1, 1,
0.3624801, -1.213286, 3.582742, 1, 1, 1, 1, 1,
0.3627222, -0.6262282, 1.224255, 1, 1, 1, 1, 1,
0.3634226, 0.8331025, -0.01246353, 1, 1, 1, 1, 1,
0.3704493, -0.8201309, 2.042476, 1, 1, 1, 1, 1,
0.3714822, -0.4569388, 2.753659, 1, 1, 1, 1, 1,
0.3755985, -2.081119, 2.503199, 1, 1, 1, 1, 1,
0.3766781, 1.499759, -0.1860477, 1, 1, 1, 1, 1,
0.3818073, -1.658002, 1.969652, 1, 1, 1, 1, 1,
0.3836907, 0.4335997, -0.1463709, 1, 1, 1, 1, 1,
0.3870937, -0.4758596, 2.322634, 1, 1, 1, 1, 1,
0.3874555, -0.08293144, 1.745147, 1, 1, 1, 1, 1,
0.3900286, -0.4222197, 4.23907, 1, 1, 1, 1, 1,
0.3904321, -0.07117744, 0.1855433, 1, 1, 1, 1, 1,
0.3910589, -1.919766, 1.745375, 1, 1, 1, 1, 1,
0.3927169, 0.5177841, -0.538816, 0, 0, 1, 1, 1,
0.3933859, 0.7898487, 0.5216349, 1, 0, 0, 1, 1,
0.3982907, -0.2839553, 0.9787375, 1, 0, 0, 1, 1,
0.3992604, -0.5660552, 2.848434, 1, 0, 0, 1, 1,
0.4026983, 1.451519, 0.4664316, 1, 0, 0, 1, 1,
0.408298, -0.04462157, 2.017357, 1, 0, 0, 1, 1,
0.409801, -0.2518667, 2.055346, 0, 0, 0, 1, 1,
0.4127455, 1.230703, 0.3986745, 0, 0, 0, 1, 1,
0.4156929, -1.044147, 3.725998, 0, 0, 0, 1, 1,
0.4160019, -0.5217101, 1.046486, 0, 0, 0, 1, 1,
0.4171523, 1.555614, 1.311952, 0, 0, 0, 1, 1,
0.4190079, 0.1376064, 1.926564, 0, 0, 0, 1, 1,
0.4249902, 1.866228, 1.629688, 0, 0, 0, 1, 1,
0.4254057, 1.140721, 2.077892, 1, 1, 1, 1, 1,
0.4272873, -0.09325562, 1.532204, 1, 1, 1, 1, 1,
0.4295151, 0.4215039, 2.347817, 1, 1, 1, 1, 1,
0.429541, 0.9442313, 0.4287141, 1, 1, 1, 1, 1,
0.4360328, 1.30905, 0.883411, 1, 1, 1, 1, 1,
0.4369507, -0.7758501, 3.784532, 1, 1, 1, 1, 1,
0.4380569, -1.085578, 3.17088, 1, 1, 1, 1, 1,
0.440226, 0.8505386, -1.945593, 1, 1, 1, 1, 1,
0.4430954, -0.9668932, 0.7585217, 1, 1, 1, 1, 1,
0.4446632, 1.362976, -1.454737, 1, 1, 1, 1, 1,
0.4468823, 0.3030254, 2.851391, 1, 1, 1, 1, 1,
0.4482594, 0.7546216, 1.173385, 1, 1, 1, 1, 1,
0.4519122, -2.368702, 2.775834, 1, 1, 1, 1, 1,
0.4562039, 0.4756595, 0.9050652, 1, 1, 1, 1, 1,
0.4563427, 0.5071644, 0.6600282, 1, 1, 1, 1, 1,
0.4666001, 1.347535, 1.681136, 0, 0, 1, 1, 1,
0.4690516, -1.408173, 0.810552, 1, 0, 0, 1, 1,
0.4702806, 0.8877119, 0.7984859, 1, 0, 0, 1, 1,
0.474544, -1.050172, 2.797278, 1, 0, 0, 1, 1,
0.4759138, -0.1903257, 0.6304578, 1, 0, 0, 1, 1,
0.4812185, -1.180199, 2.35413, 1, 0, 0, 1, 1,
0.4838544, -0.08077349, 1.525957, 0, 0, 0, 1, 1,
0.4883573, -1.579091, 3.31857, 0, 0, 0, 1, 1,
0.4904356, 1.362385, -0.6024955, 0, 0, 0, 1, 1,
0.4905331, -1.163576, 2.931833, 0, 0, 0, 1, 1,
0.493046, 2.295714, 0.4084078, 0, 0, 0, 1, 1,
0.4938295, -0.469678, 3.797097, 0, 0, 0, 1, 1,
0.4965301, 0.6016098, -0.3987536, 0, 0, 0, 1, 1,
0.4981126, -1.881111, 2.937891, 1, 1, 1, 1, 1,
0.5004479, 1.088644, 0.006389824, 1, 1, 1, 1, 1,
0.5006585, -1.619016, 3.451014, 1, 1, 1, 1, 1,
0.5007922, -0.1024077, 3.603811, 1, 1, 1, 1, 1,
0.5024929, -0.966682, 3.600379, 1, 1, 1, 1, 1,
0.5031545, -0.4108948, 3.859527, 1, 1, 1, 1, 1,
0.5067182, 0.2553533, 1.391943, 1, 1, 1, 1, 1,
0.5096862, -0.1861549, 1.504159, 1, 1, 1, 1, 1,
0.509982, 1.889329, -1.031036, 1, 1, 1, 1, 1,
0.5118345, -2.610986, 3.267357, 1, 1, 1, 1, 1,
0.5148237, -0.3288433, 1.620381, 1, 1, 1, 1, 1,
0.516172, 0.2411626, 0.3322071, 1, 1, 1, 1, 1,
0.5186315, 0.9965267, -0.2444613, 1, 1, 1, 1, 1,
0.5207341, 0.1004342, 1.54077, 1, 1, 1, 1, 1,
0.5209695, -0.2113379, 2.175812, 1, 1, 1, 1, 1,
0.5227229, 1.1975, 0.2135314, 0, 0, 1, 1, 1,
0.5236014, 0.04663691, 3.032709, 1, 0, 0, 1, 1,
0.5241516, 0.4791644, 0.529309, 1, 0, 0, 1, 1,
0.5288804, -0.3245566, 3.372625, 1, 0, 0, 1, 1,
0.536319, -1.28233, 3.442333, 1, 0, 0, 1, 1,
0.5407712, -0.06195145, 1.737606, 1, 0, 0, 1, 1,
0.5429553, 0.2715293, 1.170905, 0, 0, 0, 1, 1,
0.5472291, -1.111139, 4.13112, 0, 0, 0, 1, 1,
0.5490584, -1.050766, 1.610232, 0, 0, 0, 1, 1,
0.5507628, 2.427953, 0.5488463, 0, 0, 0, 1, 1,
0.5513618, -0.7760447, 3.994982, 0, 0, 0, 1, 1,
0.5618091, 0.5801758, 1.060909, 0, 0, 0, 1, 1,
0.5652394, -0.781445, 3.28899, 0, 0, 0, 1, 1,
0.5703987, 0.2374305, 1.553406, 1, 1, 1, 1, 1,
0.5717891, 2.802938, 0.4667766, 1, 1, 1, 1, 1,
0.5723027, 1.426474, 1.951057, 1, 1, 1, 1, 1,
0.5746952, 1.01446, 0.6346845, 1, 1, 1, 1, 1,
0.5752788, -1.518873, 2.783565, 1, 1, 1, 1, 1,
0.5778958, -0.6431913, 3.397395, 1, 1, 1, 1, 1,
0.5791602, -1.609332, 2.690418, 1, 1, 1, 1, 1,
0.5797049, -1.851377, 4.09684, 1, 1, 1, 1, 1,
0.5854813, 2.352471, 1.402171, 1, 1, 1, 1, 1,
0.5889187, -0.5236554, 2.257723, 1, 1, 1, 1, 1,
0.5903177, -0.1680825, -0.9599262, 1, 1, 1, 1, 1,
0.5908208, -0.8915535, 2.448593, 1, 1, 1, 1, 1,
0.5926879, 0.1635044, 0.967458, 1, 1, 1, 1, 1,
0.5946101, 0.6698523, 0.3658692, 1, 1, 1, 1, 1,
0.5954449, -0.3679873, 0.406885, 1, 1, 1, 1, 1,
0.6073706, -0.1192277, 1.20051, 0, 0, 1, 1, 1,
0.6077223, -0.4057775, 2.661197, 1, 0, 0, 1, 1,
0.6093834, 0.5007844, -1.629451, 1, 0, 0, 1, 1,
0.6104658, 0.5125652, 2.542529, 1, 0, 0, 1, 1,
0.6114947, 0.8921074, 2.307339, 1, 0, 0, 1, 1,
0.6147412, 1.028988, 0.8507865, 1, 0, 0, 1, 1,
0.6193662, 0.089914, 0.1866986, 0, 0, 0, 1, 1,
0.6227949, 0.6807392, 1.521814, 0, 0, 0, 1, 1,
0.6248399, -0.8753123, 1.178261, 0, 0, 0, 1, 1,
0.6252107, 0.5749009, 0.1885354, 0, 0, 0, 1, 1,
0.6285555, -1.550371, 0.9798962, 0, 0, 0, 1, 1,
0.6363508, 2.087854, -0.3772184, 0, 0, 0, 1, 1,
0.6381381, -1.53583, 4.241518, 0, 0, 0, 1, 1,
0.64065, -0.9744218, 2.303615, 1, 1, 1, 1, 1,
0.6430102, 0.8681182, 0.9046416, 1, 1, 1, 1, 1,
0.6443519, -1.457932, 1.360324, 1, 1, 1, 1, 1,
0.6478165, 0.2491543, 1.034034, 1, 1, 1, 1, 1,
0.648444, -2.382764, 2.628481, 1, 1, 1, 1, 1,
0.6494078, -1.073896, 3.609246, 1, 1, 1, 1, 1,
0.6495085, -1.09656, 1.947351, 1, 1, 1, 1, 1,
0.6578431, -0.2780443, 2.486196, 1, 1, 1, 1, 1,
0.6597601, 0.08524897, 2.369824, 1, 1, 1, 1, 1,
0.6600382, 0.1508346, -0.01108605, 1, 1, 1, 1, 1,
0.6630174, 0.2550331, 0.8334993, 1, 1, 1, 1, 1,
0.6646111, -0.4849864, 1.257693, 1, 1, 1, 1, 1,
0.6647182, 1.178177, 0.5250232, 1, 1, 1, 1, 1,
0.6832486, 0.6922863, 1.491694, 1, 1, 1, 1, 1,
0.6842164, -1.163134, 3.026308, 1, 1, 1, 1, 1,
0.6869665, -0.7071657, 3.014508, 0, 0, 1, 1, 1,
0.6886297, -0.8989866, 1.801729, 1, 0, 0, 1, 1,
0.6891933, 0.3756967, 0.8877628, 1, 0, 0, 1, 1,
0.68941, -1.116234, 0.4158395, 1, 0, 0, 1, 1,
0.691062, -2.262746, 2.729049, 1, 0, 0, 1, 1,
0.7024643, -0.2131744, 1.223492, 1, 0, 0, 1, 1,
0.7066374, -1.714495, 2.684882, 0, 0, 0, 1, 1,
0.7076359, -0.01249092, 1.779988, 0, 0, 0, 1, 1,
0.7079393, -0.359915, 1.850255, 0, 0, 0, 1, 1,
0.7092078, -0.9856407, 2.384422, 0, 0, 0, 1, 1,
0.7163774, -0.4357577, 2.798326, 0, 0, 0, 1, 1,
0.7177896, 1.141759, 1.624273, 0, 0, 0, 1, 1,
0.7181485, 0.2760331, 1.150489, 0, 0, 0, 1, 1,
0.7187341, 2.014308, 0.02197483, 1, 1, 1, 1, 1,
0.7189955, 0.5137213, 2.115441, 1, 1, 1, 1, 1,
0.7197726, -1.031083, 1.6391, 1, 1, 1, 1, 1,
0.724813, 1.768242, 0.2750014, 1, 1, 1, 1, 1,
0.7248545, 0.7679698, 0.3810025, 1, 1, 1, 1, 1,
0.7287525, -0.1429768, 3.381638, 1, 1, 1, 1, 1,
0.7365666, -0.1643809, 1.791287, 1, 1, 1, 1, 1,
0.7389341, 0.8718816, 1.568992, 1, 1, 1, 1, 1,
0.7389544, 0.6910939, 0.6067318, 1, 1, 1, 1, 1,
0.7421774, 0.4330249, 0.936278, 1, 1, 1, 1, 1,
0.7455336, -0.2306587, 2.049831, 1, 1, 1, 1, 1,
0.765889, -0.5113392, 3.26699, 1, 1, 1, 1, 1,
0.766996, -0.0004224915, -0.2234363, 1, 1, 1, 1, 1,
0.7730776, -0.708892, 1.466362, 1, 1, 1, 1, 1,
0.7745821, -0.3847135, 1.184085, 1, 1, 1, 1, 1,
0.7767913, 0.7902433, 0.008979511, 0, 0, 1, 1, 1,
0.7794107, 0.08990596, 2.460569, 1, 0, 0, 1, 1,
0.7803859, -0.8277922, 1.284607, 1, 0, 0, 1, 1,
0.7833419, -0.9253178, 3.794055, 1, 0, 0, 1, 1,
0.7833799, -1.743432, 4.335386, 1, 0, 0, 1, 1,
0.7875192, -0.350714, 2.143772, 1, 0, 0, 1, 1,
0.7888596, -0.2035975, 1.93709, 0, 0, 0, 1, 1,
0.7945248, -0.8766192, 3.19982, 0, 0, 0, 1, 1,
0.7946243, -0.63718, 2.172014, 0, 0, 0, 1, 1,
0.7969565, -0.3217202, 4.1364, 0, 0, 0, 1, 1,
0.7998235, 1.300467, 0.03630598, 0, 0, 0, 1, 1,
0.8006414, 0.2214832, 1.217262, 0, 0, 0, 1, 1,
0.8059915, -1.335787, 2.603271, 0, 0, 0, 1, 1,
0.8171223, 0.9599912, 1.591556, 1, 1, 1, 1, 1,
0.8178462, -1.215094, 4.535801, 1, 1, 1, 1, 1,
0.8187676, -1.559134, 1.245376, 1, 1, 1, 1, 1,
0.8218863, -2.342406, 2.72375, 1, 1, 1, 1, 1,
0.8258287, 1.337329, -0.5966773, 1, 1, 1, 1, 1,
0.8272907, -0.8750813, 1.328642, 1, 1, 1, 1, 1,
0.8352084, 1.207953, -0.4610129, 1, 1, 1, 1, 1,
0.8352644, -1.07014, 2.018273, 1, 1, 1, 1, 1,
0.8370565, -0.5565276, 2.163802, 1, 1, 1, 1, 1,
0.8392385, 0.5275205, 1.18654, 1, 1, 1, 1, 1,
0.8399544, 0.5599757, 0.2158342, 1, 1, 1, 1, 1,
0.8423488, 0.8025832, 0.5107253, 1, 1, 1, 1, 1,
0.8446901, 1.954474, 1.656278, 1, 1, 1, 1, 1,
0.8449603, 2.030586, -1.435586, 1, 1, 1, 1, 1,
0.848389, 0.6769508, 0.6044339, 1, 1, 1, 1, 1,
0.848536, 0.09249254, 2.110088, 0, 0, 1, 1, 1,
0.8528222, 0.5221867, 1.157546, 1, 0, 0, 1, 1,
0.8561069, -0.1303105, 3.175202, 1, 0, 0, 1, 1,
0.8580632, -0.4159959, 1.938097, 1, 0, 0, 1, 1,
0.8717935, -1.993385, 3.556545, 1, 0, 0, 1, 1,
0.8750266, -0.4517067, 1.855856, 1, 0, 0, 1, 1,
0.8798289, 0.5172809, 1.354613, 0, 0, 0, 1, 1,
0.882421, 1.300634, -0.1099224, 0, 0, 0, 1, 1,
0.8828782, 1.46287, 1.17784, 0, 0, 0, 1, 1,
0.8839884, -0.5036011, 2.725343, 0, 0, 0, 1, 1,
0.8848702, -0.5606377, 0.2411734, 0, 0, 0, 1, 1,
0.8914844, -0.3642878, 2.067495, 0, 0, 0, 1, 1,
0.9039711, -0.06776632, 3.494932, 0, 0, 0, 1, 1,
0.9040384, 1.441759, 0.2340638, 1, 1, 1, 1, 1,
0.905126, 0.886362, 0.4110513, 1, 1, 1, 1, 1,
0.9081702, 1.030153, -0.01535634, 1, 1, 1, 1, 1,
0.9114047, 1.864833, 0.2524794, 1, 1, 1, 1, 1,
0.9138857, 1.108676, 1.342934, 1, 1, 1, 1, 1,
0.9202406, -0.459799, 1.232222, 1, 1, 1, 1, 1,
0.9218482, 1.849834, 0.08967655, 1, 1, 1, 1, 1,
0.9232681, 2.191197, 0.8378336, 1, 1, 1, 1, 1,
0.9266466, -0.4387556, 0.7255775, 1, 1, 1, 1, 1,
0.9266877, 0.8466665, 1.426578, 1, 1, 1, 1, 1,
0.9373021, -0.5375797, 1.904889, 1, 1, 1, 1, 1,
0.9393446, 1.204757, -0.05443959, 1, 1, 1, 1, 1,
0.9533452, -0.9654632, 2.467327, 1, 1, 1, 1, 1,
0.9541432, -0.3314244, 1.73082, 1, 1, 1, 1, 1,
0.9544752, -0.8642492, 2.685991, 1, 1, 1, 1, 1,
0.9584838, -0.06863317, 1.133782, 0, 0, 1, 1, 1,
0.9651443, 1.1576, 2.41297, 1, 0, 0, 1, 1,
0.9657996, 0.5500314, 1.038558, 1, 0, 0, 1, 1,
0.9742386, 0.5228245, 0.8740296, 1, 0, 0, 1, 1,
0.9748054, 0.3608969, -0.4056555, 1, 0, 0, 1, 1,
0.9804893, -0.2657662, 0.6631994, 1, 0, 0, 1, 1,
0.9815772, -0.6052684, 1.778701, 0, 0, 0, 1, 1,
0.9822165, 0.5729787, -0.0977844, 0, 0, 0, 1, 1,
0.9835951, -0.4677039, 1.43978, 0, 0, 0, 1, 1,
0.9870228, 0.7771721, 2.332585, 0, 0, 0, 1, 1,
0.9876282, -0.2603179, 0.193326, 0, 0, 0, 1, 1,
0.989334, -0.1487787, 1.148212, 0, 0, 0, 1, 1,
0.9895329, 0.9757857, 1.481284, 0, 0, 0, 1, 1,
0.9938881, -1.584367, 1.658151, 1, 1, 1, 1, 1,
0.9949208, -2.213117, 3.668276, 1, 1, 1, 1, 1,
0.9961943, -0.2084157, 2.289982, 1, 1, 1, 1, 1,
1.001295, -0.1558048, 2.605792, 1, 1, 1, 1, 1,
1.00186, -0.9872738, 3.589198, 1, 1, 1, 1, 1,
1.006825, 0.09419623, 2.429661, 1, 1, 1, 1, 1,
1.007695, -0.320718, 1.98952, 1, 1, 1, 1, 1,
1.00803, -0.4272901, 0.2703066, 1, 1, 1, 1, 1,
1.019913, 1.150389, 2.42028, 1, 1, 1, 1, 1,
1.019989, -0.8728508, 2.547016, 1, 1, 1, 1, 1,
1.022684, -0.9902493, 2.338359, 1, 1, 1, 1, 1,
1.028073, -0.1839305, 3.50205, 1, 1, 1, 1, 1,
1.030547, 0.9384894, 0.6589947, 1, 1, 1, 1, 1,
1.03768, 1.611974, 1.369295, 1, 1, 1, 1, 1,
1.043939, 0.1243914, 2.445309, 1, 1, 1, 1, 1,
1.049007, 0.1784065, 1.985888, 0, 0, 1, 1, 1,
1.068495, -1.41029, 2.619777, 1, 0, 0, 1, 1,
1.080444, 0.6001708, 0.4838661, 1, 0, 0, 1, 1,
1.084419, -0.5098625, 2.604823, 1, 0, 0, 1, 1,
1.091342, -0.006007972, 2.214784, 1, 0, 0, 1, 1,
1.093854, 0.4683892, 0.06148941, 1, 0, 0, 1, 1,
1.094109, -1.272255, 1.478634, 0, 0, 0, 1, 1,
1.100239, 0.07425997, 1.353939, 0, 0, 0, 1, 1,
1.104274, -0.4845244, 1.66815, 0, 0, 0, 1, 1,
1.107166, 0.6181678, 1.62484, 0, 0, 0, 1, 1,
1.113736, 0.1231388, -0.5947496, 0, 0, 0, 1, 1,
1.141341, 0.9030896, 2.294254, 0, 0, 0, 1, 1,
1.144927, 1.216634, 0.01714183, 0, 0, 0, 1, 1,
1.150875, 1.757702, 0.4439109, 1, 1, 1, 1, 1,
1.156074, -0.4963472, 3.300212, 1, 1, 1, 1, 1,
1.163949, -0.5333273, 0.6710399, 1, 1, 1, 1, 1,
1.165573, 0.2177473, -0.5280439, 1, 1, 1, 1, 1,
1.168916, -0.4073895, 1.178991, 1, 1, 1, 1, 1,
1.17231, 0.9692715, 1.018511, 1, 1, 1, 1, 1,
1.185217, 0.6753061, 1.402595, 1, 1, 1, 1, 1,
1.186621, 1.238035, 0.5663957, 1, 1, 1, 1, 1,
1.193408, 0.05620038, 1.002676, 1, 1, 1, 1, 1,
1.195282, -0.6198353, 1.926929, 1, 1, 1, 1, 1,
1.217372, -0.08653695, 1.526787, 1, 1, 1, 1, 1,
1.224391, 0.5563893, 3.185578, 1, 1, 1, 1, 1,
1.227085, -0.3486766, 1.2897, 1, 1, 1, 1, 1,
1.227501, -0.5558872, 2.899246, 1, 1, 1, 1, 1,
1.228833, -0.9737494, 3.918174, 1, 1, 1, 1, 1,
1.230574, 0.1576668, 3.256948, 0, 0, 1, 1, 1,
1.239172, -0.3399328, 1.22225, 1, 0, 0, 1, 1,
1.23959, -1.204825, 3.795065, 1, 0, 0, 1, 1,
1.252899, -0.2000348, 1.380526, 1, 0, 0, 1, 1,
1.262238, 0.6520823, 0.5741121, 1, 0, 0, 1, 1,
1.262887, -1.10406, 1.514654, 1, 0, 0, 1, 1,
1.263987, -0.1657351, 0.8988784, 0, 0, 0, 1, 1,
1.266738, 0.8316945, 0.2872293, 0, 0, 0, 1, 1,
1.268022, 1.291945, 1.851499, 0, 0, 0, 1, 1,
1.278434, 0.3225073, 2.172777, 0, 0, 0, 1, 1,
1.279295, 0.1894578, 0.4401641, 0, 0, 0, 1, 1,
1.279747, 0.5646201, 0.04661596, 0, 0, 0, 1, 1,
1.284584, -0.6021779, 2.365, 0, 0, 0, 1, 1,
1.319537, -0.3788888, 2.912768, 1, 1, 1, 1, 1,
1.321081, 0.6675657, 1.103906, 1, 1, 1, 1, 1,
1.321202, 0.0610144, 0.8872779, 1, 1, 1, 1, 1,
1.32523, 1.378922, 3.623631, 1, 1, 1, 1, 1,
1.328936, -0.5313501, 2.581444, 1, 1, 1, 1, 1,
1.338978, 1.326117, 1.407582, 1, 1, 1, 1, 1,
1.342229, -0.2344974, 0.8934252, 1, 1, 1, 1, 1,
1.355542, 1.388617, 1.475985, 1, 1, 1, 1, 1,
1.356412, 0.05088955, 0.3795281, 1, 1, 1, 1, 1,
1.356893, 0.5155141, -0.8719552, 1, 1, 1, 1, 1,
1.370607, 0.2131187, 0.418763, 1, 1, 1, 1, 1,
1.385263, 0.156366, 3.024399, 1, 1, 1, 1, 1,
1.385504, -0.08897249, 3.180274, 1, 1, 1, 1, 1,
1.401469, 0.7499926, 1.509781, 1, 1, 1, 1, 1,
1.402282, -1.288939, 2.077518, 1, 1, 1, 1, 1,
1.402965, -0.7000171, 0.8796558, 0, 0, 1, 1, 1,
1.404696, 1.673205, 0.2378233, 1, 0, 0, 1, 1,
1.408203, 1.599841, 0.04064196, 1, 0, 0, 1, 1,
1.424551, 0.1857325, 1.045733, 1, 0, 0, 1, 1,
1.425289, -0.619094, 2.213163, 1, 0, 0, 1, 1,
1.429308, 0.5169997, 0.3044289, 1, 0, 0, 1, 1,
1.437984, -1.337666, 2.019619, 0, 0, 0, 1, 1,
1.439716, 0.0006157116, 1.371482, 0, 0, 0, 1, 1,
1.440874, 0.720589, 2.281939, 0, 0, 0, 1, 1,
1.448355, -0.01967434, 2.451993, 0, 0, 0, 1, 1,
1.448962, -1.383435, 0.5230556, 0, 0, 0, 1, 1,
1.452323, 1.679741, -0.584074, 0, 0, 0, 1, 1,
1.456637, 0.1827178, 2.416529, 0, 0, 0, 1, 1,
1.462486, 0.3891464, 1.266678, 1, 1, 1, 1, 1,
1.471851, -0.1018243, 1.936284, 1, 1, 1, 1, 1,
1.499924, 1.060987, 2.580961, 1, 1, 1, 1, 1,
1.505401, 1.496287, -0.2010594, 1, 1, 1, 1, 1,
1.506397, 0.6816273, 1.113438, 1, 1, 1, 1, 1,
1.510898, -0.07334587, 2.992381, 1, 1, 1, 1, 1,
1.517272, -0.04944082, 1.98161, 1, 1, 1, 1, 1,
1.519702, 2.479183, 1.408965, 1, 1, 1, 1, 1,
1.534522, -0.2499763, 3.219498, 1, 1, 1, 1, 1,
1.537833, -0.2726826, 2.568902, 1, 1, 1, 1, 1,
1.538732, -0.01424842, -0.09599203, 1, 1, 1, 1, 1,
1.539482, -1.500422, 3.041916, 1, 1, 1, 1, 1,
1.545795, 1.376807, 1.242437, 1, 1, 1, 1, 1,
1.546845, -1.410178, 1.194432, 1, 1, 1, 1, 1,
1.54974, -0.6458314, 0.6827108, 1, 1, 1, 1, 1,
1.553116, -0.05221874, 1.208628, 0, 0, 1, 1, 1,
1.57693, -0.6884657, 1.529765, 1, 0, 0, 1, 1,
1.57827, 1.067628, 0.3639476, 1, 0, 0, 1, 1,
1.616468, 1.115754, 0.02429082, 1, 0, 0, 1, 1,
1.630227, -1.472266, 1.869996, 1, 0, 0, 1, 1,
1.646133, 1.492195, -0.1165402, 1, 0, 0, 1, 1,
1.655705, -0.1506178, 1.36156, 0, 0, 0, 1, 1,
1.684474, 0.9964344, -0.5012952, 0, 0, 0, 1, 1,
1.689638, 0.65787, 0.3881286, 0, 0, 0, 1, 1,
1.699914, 1.114868, 1.24097, 0, 0, 0, 1, 1,
1.704788, 0.6433392, 0.4977052, 0, 0, 0, 1, 1,
1.708595, -1.27482, 2.803173, 0, 0, 0, 1, 1,
1.711014, -1.15173, 3.272522, 0, 0, 0, 1, 1,
1.717342, -0.4822653, -0.316682, 1, 1, 1, 1, 1,
1.722355, -3.140129, 1.792547, 1, 1, 1, 1, 1,
1.733411, 0.8777534, 0.9997538, 1, 1, 1, 1, 1,
1.744241, -1.894336, 0.9795597, 1, 1, 1, 1, 1,
1.760615, 1.335526, 1.165694, 1, 1, 1, 1, 1,
1.766947, -0.01034421, 1.259994, 1, 1, 1, 1, 1,
1.772763, 0.8654951, 2.160536, 1, 1, 1, 1, 1,
1.773073, -0.5418745, 2.871145, 1, 1, 1, 1, 1,
1.776625, -0.5348258, 3.115164, 1, 1, 1, 1, 1,
1.810972, -1.394606, 0.181132, 1, 1, 1, 1, 1,
1.812408, -0.8599123, 1.373121, 1, 1, 1, 1, 1,
1.820433, 0.07479935, 1.776317, 1, 1, 1, 1, 1,
1.820596, -1.233924, 1.959719, 1, 1, 1, 1, 1,
1.827105, -0.4229609, 0.784185, 1, 1, 1, 1, 1,
1.82781, -0.2839791, 1.23387, 1, 1, 1, 1, 1,
1.828699, -0.5532754, 2.750313, 0, 0, 1, 1, 1,
1.840629, -0.5269566, 1.13596, 1, 0, 0, 1, 1,
1.841983, 1.697025, -0.3938508, 1, 0, 0, 1, 1,
1.845455, -1.389796, 3.37125, 1, 0, 0, 1, 1,
1.850292, 0.9242842, 1.584035, 1, 0, 0, 1, 1,
1.854326, 0.9603974, 0.8873059, 1, 0, 0, 1, 1,
1.865135, -0.1641613, 0.6837879, 0, 0, 0, 1, 1,
1.870759, -0.171965, 1.689778, 0, 0, 0, 1, 1,
1.873536, 0.5609145, 1.606696, 0, 0, 0, 1, 1,
1.876305, 0.1910512, 1.324401, 0, 0, 0, 1, 1,
1.884644, -0.8398091, 0.6727671, 0, 0, 0, 1, 1,
1.904129, -0.1237836, 1.578772, 0, 0, 0, 1, 1,
1.908541, -0.2208907, 3.553247, 0, 0, 0, 1, 1,
1.922833, -0.2597646, 3.715026, 1, 1, 1, 1, 1,
1.928529, 1.176101, 0.86353, 1, 1, 1, 1, 1,
1.956808, 0.5687057, 1.748218, 1, 1, 1, 1, 1,
1.957007, -0.1211775, 1.15317, 1, 1, 1, 1, 1,
1.985822, -0.773487, 2.009443, 1, 1, 1, 1, 1,
1.99189, -1.420657, 2.134938, 1, 1, 1, 1, 1,
2.009073, -0.06053822, 1.331094, 1, 1, 1, 1, 1,
2.05686, 0.3546755, 1.954553, 1, 1, 1, 1, 1,
2.060206, 1.24834, 0.9358729, 1, 1, 1, 1, 1,
2.081701, -0.8696239, 1.535168, 1, 1, 1, 1, 1,
2.113277, 0.3050314, 1.05476, 1, 1, 1, 1, 1,
2.154389, 0.8160161, -0.731873, 1, 1, 1, 1, 1,
2.158996, -1.723171, 3.281018, 1, 1, 1, 1, 1,
2.162255, 0.5661, 4.284598, 1, 1, 1, 1, 1,
2.176947, -1.935127, 1.249439, 1, 1, 1, 1, 1,
2.185722, 0.7550406, 0.4416938, 0, 0, 1, 1, 1,
2.196955, 1.738187, 1.412409, 1, 0, 0, 1, 1,
2.219903, -0.2543742, 1.851325, 1, 0, 0, 1, 1,
2.22593, -0.237177, 0.9771479, 1, 0, 0, 1, 1,
2.229671, -0.2323345, 3.843326, 1, 0, 0, 1, 1,
2.2322, 0.7162356, 1.623577, 1, 0, 0, 1, 1,
2.238201, -0.5593958, 0.189577, 0, 0, 0, 1, 1,
2.274361, -0.5060977, 1.620128, 0, 0, 0, 1, 1,
2.275002, -0.5888959, 2.495619, 0, 0, 0, 1, 1,
2.280168, -0.1776217, 2.277617, 0, 0, 0, 1, 1,
2.340554, -1.415143, 2.516855, 0, 0, 0, 1, 1,
2.36373, 1.344847, 0.9757044, 0, 0, 0, 1, 1,
2.413387, 0.8410915, 0.8573416, 0, 0, 0, 1, 1,
2.452806, 0.1642038, 0.7208797, 1, 1, 1, 1, 1,
2.471592, -0.03407576, 1.013567, 1, 1, 1, 1, 1,
2.515664, -0.5935884, 1.287542, 1, 1, 1, 1, 1,
2.577457, 0.4257476, -0.4246183, 1, 1, 1, 1, 1,
2.71678, 0.5903984, 1.696063, 1, 1, 1, 1, 1,
2.82081, -0.889394, 0.2641049, 1, 1, 1, 1, 1,
2.952674, -1.425586, 2.012555, 1, 1, 1, 1, 1
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
var radius = 9.367671;
var distance = 32.90355;
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
mvMatrix.translate( 0.1153457, 0.1685953, 0.1634376 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.90355);
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
