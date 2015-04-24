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
-3.466397, 0.1077217, -0.2534074, 1, 0, 0, 1,
-3.251161, 1.035476, -0.8976746, 1, 0.007843138, 0, 1,
-2.859254, 1.239737, -1.836435, 1, 0.01176471, 0, 1,
-2.757688, 0.9426521, -1.449647, 1, 0.01960784, 0, 1,
-2.606212, -0.7487532, -2.79767, 1, 0.02352941, 0, 1,
-2.541694, 0.6555471, -2.594672, 1, 0.03137255, 0, 1,
-2.440648, -1.432737, -0.7076679, 1, 0.03529412, 0, 1,
-2.440567, -0.3367623, -0.2855458, 1, 0.04313726, 0, 1,
-2.432172, 2.734517, -0.773021, 1, 0.04705882, 0, 1,
-2.377494, 0.1509896, -5.517846, 1, 0.05490196, 0, 1,
-2.356807, -0.2494015, -2.396756, 1, 0.05882353, 0, 1,
-2.312214, -1.10181, -1.576557, 1, 0.06666667, 0, 1,
-2.305165, -1.01321, -1.513951, 1, 0.07058824, 0, 1,
-2.274374, 0.4580012, -1.453719, 1, 0.07843138, 0, 1,
-2.23254, 2.060242, -0.786993, 1, 0.08235294, 0, 1,
-2.208378, 0.9170594, -0.615932, 1, 0.09019608, 0, 1,
-2.19714, -0.166393, -1.177985, 1, 0.09411765, 0, 1,
-2.194484, 1.333887, -0.8206063, 1, 0.1019608, 0, 1,
-2.1928, 1.519451, -1.785547, 1, 0.1098039, 0, 1,
-2.153263, -0.4881436, -0.1144588, 1, 0.1137255, 0, 1,
-2.132119, 0.6565984, -1.320738, 1, 0.1215686, 0, 1,
-2.129837, -2.275861, -3.555717, 1, 0.1254902, 0, 1,
-2.067706, 1.549494, -0.5936035, 1, 0.1333333, 0, 1,
-2.059851, -0.3122309, -2.553617, 1, 0.1372549, 0, 1,
-2.010607, 1.264136, -0.2384558, 1, 0.145098, 0, 1,
-1.941172, -0.6464329, -1.864847, 1, 0.1490196, 0, 1,
-1.937998, 0.8759555, 0.2874585, 1, 0.1568628, 0, 1,
-1.914357, 0.8929918, -0.1217233, 1, 0.1607843, 0, 1,
-1.886512, 0.6657919, -1.631591, 1, 0.1686275, 0, 1,
-1.878528, -0.3904659, -3.599962, 1, 0.172549, 0, 1,
-1.865547, -0.2393529, -1.783356, 1, 0.1803922, 0, 1,
-1.832776, -0.5900298, -2.244368, 1, 0.1843137, 0, 1,
-1.828404, 0.3568956, -0.6444818, 1, 0.1921569, 0, 1,
-1.809856, 1.063918, -0.1825765, 1, 0.1960784, 0, 1,
-1.796141, -1.032996, -3.041696, 1, 0.2039216, 0, 1,
-1.790426, -1.485874, -1.847213, 1, 0.2117647, 0, 1,
-1.782658, -0.8464693, -0.8111135, 1, 0.2156863, 0, 1,
-1.779354, 0.3737436, -2.482582, 1, 0.2235294, 0, 1,
-1.760903, -0.8092288, -2.570512, 1, 0.227451, 0, 1,
-1.749073, -0.169917, -3.712387, 1, 0.2352941, 0, 1,
-1.739068, 0.4060645, -0.8331201, 1, 0.2392157, 0, 1,
-1.731142, -0.1202408, -1.226743, 1, 0.2470588, 0, 1,
-1.728182, 1.205624, 0.5892888, 1, 0.2509804, 0, 1,
-1.714943, -1.671767, -2.624449, 1, 0.2588235, 0, 1,
-1.707145, -0.2283878, -1.953235, 1, 0.2627451, 0, 1,
-1.706947, -1.124004, -1.997003, 1, 0.2705882, 0, 1,
-1.706787, -0.1898387, -1.84467, 1, 0.2745098, 0, 1,
-1.706562, 0.3036115, -0.1060174, 1, 0.282353, 0, 1,
-1.70502, 0.8900805, -1.507023, 1, 0.2862745, 0, 1,
-1.694276, -0.985437, -1.654212, 1, 0.2941177, 0, 1,
-1.676897, 1.630751, -1.09072, 1, 0.3019608, 0, 1,
-1.657669, 0.2199023, -1.566978, 1, 0.3058824, 0, 1,
-1.639426, 0.2132597, -1.241776, 1, 0.3137255, 0, 1,
-1.629383, 0.166391, -3.11671, 1, 0.3176471, 0, 1,
-1.589973, -0.05121664, -3.172574, 1, 0.3254902, 0, 1,
-1.573415, 1.572315, 1.475674, 1, 0.3294118, 0, 1,
-1.562583, -0.4308071, -1.790175, 1, 0.3372549, 0, 1,
-1.553927, 1.937005, 0.4436805, 1, 0.3411765, 0, 1,
-1.551663, 1.497619, 1.066574, 1, 0.3490196, 0, 1,
-1.54939, -1.468298, -2.457847, 1, 0.3529412, 0, 1,
-1.523962, -0.7337116, -0.677763, 1, 0.3607843, 0, 1,
-1.507971, 0.5334033, -2.329552, 1, 0.3647059, 0, 1,
-1.506198, 0.09590866, -1.419295, 1, 0.372549, 0, 1,
-1.500772, 0.08295123, -2.226058, 1, 0.3764706, 0, 1,
-1.498679, 0.3818443, -1.62872, 1, 0.3843137, 0, 1,
-1.494135, -0.1729381, -1.581809, 1, 0.3882353, 0, 1,
-1.491622, 0.5522721, -2.043396, 1, 0.3960784, 0, 1,
-1.47536, 0.2394703, -2.22222, 1, 0.4039216, 0, 1,
-1.464618, 0.8979902, -0.2910228, 1, 0.4078431, 0, 1,
-1.463373, 0.2839487, -2.245986, 1, 0.4156863, 0, 1,
-1.455843, 0.4000125, -2.881879, 1, 0.4196078, 0, 1,
-1.455656, -0.1793498, -2.175893, 1, 0.427451, 0, 1,
-1.452788, -0.4240698, -1.026837, 1, 0.4313726, 0, 1,
-1.452305, -1.188264, -3.034624, 1, 0.4392157, 0, 1,
-1.444266, 1.475234, -0.881312, 1, 0.4431373, 0, 1,
-1.438058, -0.1586201, -0.8719888, 1, 0.4509804, 0, 1,
-1.430272, -0.03160883, -1.722058, 1, 0.454902, 0, 1,
-1.429976, -0.608906, -1.588056, 1, 0.4627451, 0, 1,
-1.420138, -2.079444, -2.115062, 1, 0.4666667, 0, 1,
-1.418786, 0.3477266, -0.443011, 1, 0.4745098, 0, 1,
-1.415763, -1.946031, -1.543893, 1, 0.4784314, 0, 1,
-1.414964, -1.320928, -2.736792, 1, 0.4862745, 0, 1,
-1.398964, 1.443704, -1.285534, 1, 0.4901961, 0, 1,
-1.394405, 0.7757142, -2.315333, 1, 0.4980392, 0, 1,
-1.393392, 0.8375846, -1.44363, 1, 0.5058824, 0, 1,
-1.386861, 0.4816302, -1.352619, 1, 0.509804, 0, 1,
-1.383357, -0.523899, -3.330847, 1, 0.5176471, 0, 1,
-1.382364, 0.4654997, -1.376965, 1, 0.5215687, 0, 1,
-1.376122, -0.367809, -1.814949, 1, 0.5294118, 0, 1,
-1.360674, 1.140138, 0.4530706, 1, 0.5333334, 0, 1,
-1.358251, 0.2303067, -1.204293, 1, 0.5411765, 0, 1,
-1.352272, -0.02256594, -1.666303, 1, 0.5450981, 0, 1,
-1.351415, -0.960454, -2.186421, 1, 0.5529412, 0, 1,
-1.339002, -0.3910424, -0.5964783, 1, 0.5568628, 0, 1,
-1.330768, -1.738667, -3.632681, 1, 0.5647059, 0, 1,
-1.328849, -0.3539317, -2.859699, 1, 0.5686275, 0, 1,
-1.327978, 0.7457511, 0.02643375, 1, 0.5764706, 0, 1,
-1.323194, 0.1205769, -0.7267538, 1, 0.5803922, 0, 1,
-1.315785, 0.269257, -2.371101, 1, 0.5882353, 0, 1,
-1.313527, -0.4087479, -1.836744, 1, 0.5921569, 0, 1,
-1.294949, 0.2685873, 0.2595879, 1, 0.6, 0, 1,
-1.293302, -0.2085412, -1.120495, 1, 0.6078432, 0, 1,
-1.282421, 1.909341, -0.955895, 1, 0.6117647, 0, 1,
-1.271835, 0.6778893, -4.643405, 1, 0.6196079, 0, 1,
-1.268665, 1.241532, -0.7967346, 1, 0.6235294, 0, 1,
-1.236781, -0.6438615, -2.375388, 1, 0.6313726, 0, 1,
-1.214967, 0.3023769, 0.2880543, 1, 0.6352941, 0, 1,
-1.214853, -0.3456964, -2.614736, 1, 0.6431373, 0, 1,
-1.210617, -0.4919039, -2.635249, 1, 0.6470588, 0, 1,
-1.208956, 1.495076, -1.988271, 1, 0.654902, 0, 1,
-1.206873, -0.2569656, -2.088869, 1, 0.6588235, 0, 1,
-1.205772, -0.1968859, -1.146464, 1, 0.6666667, 0, 1,
-1.201668, 0.7900129, -0.4890219, 1, 0.6705883, 0, 1,
-1.198472, -0.08618419, -2.988022, 1, 0.6784314, 0, 1,
-1.195089, -1.277167, -1.978016, 1, 0.682353, 0, 1,
-1.192076, -1.712623, -3.211501, 1, 0.6901961, 0, 1,
-1.185258, -0.215286, -1.22808, 1, 0.6941177, 0, 1,
-1.181841, -0.2365382, -1.523281, 1, 0.7019608, 0, 1,
-1.177906, 0.5129362, -2.372987, 1, 0.7098039, 0, 1,
-1.173628, 1.366261, 0.1776051, 1, 0.7137255, 0, 1,
-1.172759, -1.492292, -1.809576, 1, 0.7215686, 0, 1,
-1.168844, 0.7646531, -0.3685933, 1, 0.7254902, 0, 1,
-1.167638, -0.2891925, -2.035907, 1, 0.7333333, 0, 1,
-1.163345, -1.74793, -0.7437702, 1, 0.7372549, 0, 1,
-1.162789, -1.154227, -1.196959, 1, 0.7450981, 0, 1,
-1.160454, 0.9047832, -1.395241, 1, 0.7490196, 0, 1,
-1.158989, -0.5868623, -1.070713, 1, 0.7568628, 0, 1,
-1.147356, 0.9159455, -0.37225, 1, 0.7607843, 0, 1,
-1.139294, 0.2824586, -1.059593, 1, 0.7686275, 0, 1,
-1.134531, -1.570242, -1.617169, 1, 0.772549, 0, 1,
-1.130917, -0.06373686, -0.006034725, 1, 0.7803922, 0, 1,
-1.126107, 0.1916447, -0.3023269, 1, 0.7843137, 0, 1,
-1.121925, 0.1665487, -1.115202, 1, 0.7921569, 0, 1,
-1.121202, 0.254158, -0.44758, 1, 0.7960784, 0, 1,
-1.12033, -0.5179884, -3.085224, 1, 0.8039216, 0, 1,
-1.118567, 1.178448, -0.6581987, 1, 0.8117647, 0, 1,
-1.117934, -1.252387, -2.657916, 1, 0.8156863, 0, 1,
-1.114475, -0.5357438, -1.473337, 1, 0.8235294, 0, 1,
-1.109498, -1.490076, -1.859369, 1, 0.827451, 0, 1,
-1.108501, 0.6102099, -0.1083639, 1, 0.8352941, 0, 1,
-1.107328, 2.861034, -1.497824, 1, 0.8392157, 0, 1,
-1.100622, -0.1109247, -0.5416253, 1, 0.8470588, 0, 1,
-1.096788, -0.6300927, -4.271843, 1, 0.8509804, 0, 1,
-1.091039, -0.8008677, -3.866051, 1, 0.8588235, 0, 1,
-1.090567, 1.67851, -0.2493667, 1, 0.8627451, 0, 1,
-1.08457, -0.06062813, -3.130148, 1, 0.8705882, 0, 1,
-1.079885, 1.384393, -2.174143, 1, 0.8745098, 0, 1,
-1.077194, -1.2266, -2.893376, 1, 0.8823529, 0, 1,
-1.075891, 1.594384, -1.174329, 1, 0.8862745, 0, 1,
-1.074878, 0.4112618, -1.273862, 1, 0.8941177, 0, 1,
-1.066011, 0.2911661, -0.9570641, 1, 0.8980392, 0, 1,
-1.058663, -0.3105887, -2.588212, 1, 0.9058824, 0, 1,
-1.057988, -1.871336, -1.318058, 1, 0.9137255, 0, 1,
-1.056957, 0.2371507, -1.597659, 1, 0.9176471, 0, 1,
-1.052239, -0.4070604, -1.958003, 1, 0.9254902, 0, 1,
-1.050114, -0.394629, -2.647468, 1, 0.9294118, 0, 1,
-1.042938, -0.1267446, -1.535366, 1, 0.9372549, 0, 1,
-1.03116, -0.1529451, -1.901674, 1, 0.9411765, 0, 1,
-1.031079, -0.8126855, -1.055935, 1, 0.9490196, 0, 1,
-1.017374, -0.479926, -1.606247, 1, 0.9529412, 0, 1,
-1.010719, -1.29972, -2.268624, 1, 0.9607843, 0, 1,
-1.010509, -0.9295098, -3.975189, 1, 0.9647059, 0, 1,
-1.006355, 0.287443, -1.807915, 1, 0.972549, 0, 1,
-1.003991, -0.9317583, -3.293408, 1, 0.9764706, 0, 1,
-1.003309, 0.07214136, -2.211664, 1, 0.9843137, 0, 1,
-1.002121, 0.5945423, -1.398025, 1, 0.9882353, 0, 1,
-1.00004, -0.9159607, -1.916225, 1, 0.9960784, 0, 1,
-0.9974906, 0.4202799, -1.353783, 0.9960784, 1, 0, 1,
-0.9970658, -0.447154, -2.445534, 0.9921569, 1, 0, 1,
-0.9894357, 0.5717986, -1.883198, 0.9843137, 1, 0, 1,
-0.9887211, -1.57519, -1.483441, 0.9803922, 1, 0, 1,
-0.9855635, 0.07506283, -1.205919, 0.972549, 1, 0, 1,
-0.9852628, -0.2701785, -1.158676, 0.9686275, 1, 0, 1,
-0.9850021, -0.5872154, -1.880668, 0.9607843, 1, 0, 1,
-0.9797882, -2.022215, -1.780231, 0.9568627, 1, 0, 1,
-0.974569, -2.165796, -3.924777, 0.9490196, 1, 0, 1,
-0.9646581, -2.009879, -2.739439, 0.945098, 1, 0, 1,
-0.9623919, 1.233264, -1.530863, 0.9372549, 1, 0, 1,
-0.9555528, 2.020182, -2.325719, 0.9333333, 1, 0, 1,
-0.9552758, 0.8970752, -0.2117729, 0.9254902, 1, 0, 1,
-0.948709, 0.5462053, -0.358777, 0.9215686, 1, 0, 1,
-0.9325797, -1.869954, -1.755515, 0.9137255, 1, 0, 1,
-0.9290531, -1.162612, -3.029053, 0.9098039, 1, 0, 1,
-0.9285709, 0.4412889, 0.8256462, 0.9019608, 1, 0, 1,
-0.9248436, -0.03202607, -1.656724, 0.8941177, 1, 0, 1,
-0.9223771, -0.6258714, -2.062678, 0.8901961, 1, 0, 1,
-0.9044139, 0.5659317, -0.7375764, 0.8823529, 1, 0, 1,
-0.8849094, 1.210075, -0.05477879, 0.8784314, 1, 0, 1,
-0.8788531, -0.1126046, -1.37878, 0.8705882, 1, 0, 1,
-0.8773699, -2.09542, -2.423207, 0.8666667, 1, 0, 1,
-0.876224, 1.111399, -0.7921196, 0.8588235, 1, 0, 1,
-0.873594, 1.673798, 1.215402, 0.854902, 1, 0, 1,
-0.872656, 0.5246825, -0.1639896, 0.8470588, 1, 0, 1,
-0.8720115, 0.4092573, -1.526072, 0.8431373, 1, 0, 1,
-0.8679067, -0.583042, -2.0791, 0.8352941, 1, 0, 1,
-0.8678998, -1.358173, -3.345424, 0.8313726, 1, 0, 1,
-0.867722, -0.3501484, -4.093062, 0.8235294, 1, 0, 1,
-0.863773, -0.9278761, -2.933747, 0.8196079, 1, 0, 1,
-0.8614831, 1.180869, 0.3517693, 0.8117647, 1, 0, 1,
-0.8589726, -0.4184687, -1.695388, 0.8078431, 1, 0, 1,
-0.8561714, 1.612721, -1.023555, 0.8, 1, 0, 1,
-0.8443992, 2.071444, -0.3771105, 0.7921569, 1, 0, 1,
-0.8365194, 0.700344, 0.8682853, 0.7882353, 1, 0, 1,
-0.835145, 0.6176782, -0.2744995, 0.7803922, 1, 0, 1,
-0.8326768, 0.1096477, -0.6267093, 0.7764706, 1, 0, 1,
-0.832194, 0.7542858, 0.8033252, 0.7686275, 1, 0, 1,
-0.83216, 0.7231385, -1.949873, 0.7647059, 1, 0, 1,
-0.8301125, -0.4608681, -2.32744, 0.7568628, 1, 0, 1,
-0.82638, 0.4614407, 0.02197035, 0.7529412, 1, 0, 1,
-0.8167064, -1.627653, -1.502544, 0.7450981, 1, 0, 1,
-0.8158966, 0.0872253, -1.209522, 0.7411765, 1, 0, 1,
-0.8137049, 1.177664, -0.5839891, 0.7333333, 1, 0, 1,
-0.8126789, -0.03917162, -0.6086195, 0.7294118, 1, 0, 1,
-0.8055871, 0.09345954, -1.32017, 0.7215686, 1, 0, 1,
-0.8028758, -0.7631225, -2.879689, 0.7176471, 1, 0, 1,
-0.8004128, 0.3420559, -3.001242, 0.7098039, 1, 0, 1,
-0.7977834, 0.3852521, -0.1374212, 0.7058824, 1, 0, 1,
-0.7950352, 0.1852443, -1.352539, 0.6980392, 1, 0, 1,
-0.7945685, -1.38938, -2.354502, 0.6901961, 1, 0, 1,
-0.7931601, 1.101485, 1.160476, 0.6862745, 1, 0, 1,
-0.7867547, 0.7677869, -0.4302284, 0.6784314, 1, 0, 1,
-0.786055, -0.001509849, -0.8010663, 0.6745098, 1, 0, 1,
-0.776066, -0.7841198, -1.237201, 0.6666667, 1, 0, 1,
-0.7744696, 0.6628359, -0.396827, 0.6627451, 1, 0, 1,
-0.7720541, 0.3924756, -1.467992, 0.654902, 1, 0, 1,
-0.7706389, 2.809246, 0.4127833, 0.6509804, 1, 0, 1,
-0.7567136, -0.2436435, -0.5614557, 0.6431373, 1, 0, 1,
-0.7477621, 1.032636, 0.03576177, 0.6392157, 1, 0, 1,
-0.7376571, -0.5257313, -4.003487, 0.6313726, 1, 0, 1,
-0.7370303, -1.522248, -2.215702, 0.627451, 1, 0, 1,
-0.7369249, -0.2908924, -2.729522, 0.6196079, 1, 0, 1,
-0.7324657, -1.663715, -4.3462, 0.6156863, 1, 0, 1,
-0.7307752, -1.203947, -3.229773, 0.6078432, 1, 0, 1,
-0.7300581, -0.3367557, -1.703097, 0.6039216, 1, 0, 1,
-0.7293035, 0.06237974, -1.033138, 0.5960785, 1, 0, 1,
-0.7272335, -0.3989326, -2.48575, 0.5882353, 1, 0, 1,
-0.7264455, -0.1218702, -1.307605, 0.5843138, 1, 0, 1,
-0.7241022, -0.1008826, -1.355858, 0.5764706, 1, 0, 1,
-0.7211682, -0.006081479, -2.176344, 0.572549, 1, 0, 1,
-0.714586, 1.074281, -1.428573, 0.5647059, 1, 0, 1,
-0.7143483, 0.3987295, 0.340251, 0.5607843, 1, 0, 1,
-0.7121326, -0.2436855, -2.617399, 0.5529412, 1, 0, 1,
-0.7092367, -0.4505723, -1.982212, 0.5490196, 1, 0, 1,
-0.707164, 1.531702, -1.803465, 0.5411765, 1, 0, 1,
-0.7019711, 0.6695705, -2.698245, 0.5372549, 1, 0, 1,
-0.6988873, -1.816329, -1.951709, 0.5294118, 1, 0, 1,
-0.6982253, -0.608959, -0.7987242, 0.5254902, 1, 0, 1,
-0.6953756, -0.5412454, -0.6140199, 0.5176471, 1, 0, 1,
-0.6940028, 0.8665289, -1.212137, 0.5137255, 1, 0, 1,
-0.6913446, -1.530951, -3.995106, 0.5058824, 1, 0, 1,
-0.688718, -0.3574951, -2.573621, 0.5019608, 1, 0, 1,
-0.6841801, -0.6096167, -2.904569, 0.4941176, 1, 0, 1,
-0.6825935, -0.5270501, -1.809517, 0.4862745, 1, 0, 1,
-0.681596, -0.4230027, -1.267179, 0.4823529, 1, 0, 1,
-0.6814436, -0.8922586, -2.457559, 0.4745098, 1, 0, 1,
-0.6809902, 2.585039, -0.01110798, 0.4705882, 1, 0, 1,
-0.6807529, 0.326426, -1.391025, 0.4627451, 1, 0, 1,
-0.6760029, -1.489879, -1.92779, 0.4588235, 1, 0, 1,
-0.671922, -1.697943, -3.600271, 0.4509804, 1, 0, 1,
-0.6696674, 0.6037033, -2.261606, 0.4470588, 1, 0, 1,
-0.6641992, -0.17285, -3.956113, 0.4392157, 1, 0, 1,
-0.6641927, -0.8204454, -2.689035, 0.4352941, 1, 0, 1,
-0.6614389, -0.5077805, -2.346793, 0.427451, 1, 0, 1,
-0.6614351, 1.636263, 0.1581172, 0.4235294, 1, 0, 1,
-0.6592805, -0.09120028, -1.185725, 0.4156863, 1, 0, 1,
-0.6552578, -0.6100281, -0.4767073, 0.4117647, 1, 0, 1,
-0.6526797, -0.9454556, -1.417824, 0.4039216, 1, 0, 1,
-0.6517622, 0.4003786, 2.099818, 0.3960784, 1, 0, 1,
-0.6466032, -0.5018198, -2.963587, 0.3921569, 1, 0, 1,
-0.6453035, -3.200406, -1.696963, 0.3843137, 1, 0, 1,
-0.6378235, 0.07451246, -2.237381, 0.3803922, 1, 0, 1,
-0.637045, 0.0223047, -1.893937, 0.372549, 1, 0, 1,
-0.6348494, -1.887168, -1.129587, 0.3686275, 1, 0, 1,
-0.6338646, 0.9631404, 0.4589699, 0.3607843, 1, 0, 1,
-0.6312984, -0.4428836, -2.81447, 0.3568628, 1, 0, 1,
-0.6240137, -1.017608, -1.161361, 0.3490196, 1, 0, 1,
-0.6219307, 1.334679, -0.9057676, 0.345098, 1, 0, 1,
-0.6196117, 1.208237, 0.1197048, 0.3372549, 1, 0, 1,
-0.6192669, 0.4763725, -0.6812041, 0.3333333, 1, 0, 1,
-0.6171105, -1.358641, -1.65353, 0.3254902, 1, 0, 1,
-0.6147939, -0.4518974, -3.212371, 0.3215686, 1, 0, 1,
-0.614687, 1.157424, 0.2766191, 0.3137255, 1, 0, 1,
-0.613847, -0.1274935, -1.951856, 0.3098039, 1, 0, 1,
-0.6134482, 0.5895914, -1.525251, 0.3019608, 1, 0, 1,
-0.6124136, 0.5114849, 0.4247067, 0.2941177, 1, 0, 1,
-0.611889, -0.07606059, -1.406408, 0.2901961, 1, 0, 1,
-0.6018762, -1.06605, -2.135589, 0.282353, 1, 0, 1,
-0.6017497, -1.271494, -4.362136, 0.2784314, 1, 0, 1,
-0.6015822, 0.06159169, -0.5136028, 0.2705882, 1, 0, 1,
-0.5932499, 2.036677, -0.505426, 0.2666667, 1, 0, 1,
-0.5931147, 0.5095085, 0.2485815, 0.2588235, 1, 0, 1,
-0.5914159, 0.8915998, -0.7902421, 0.254902, 1, 0, 1,
-0.5893246, 0.3298791, -1.019795, 0.2470588, 1, 0, 1,
-0.5882774, -1.043443, -1.588149, 0.2431373, 1, 0, 1,
-0.5723068, 2.040579, -0.8740206, 0.2352941, 1, 0, 1,
-0.5718253, -0.03063319, -1.200308, 0.2313726, 1, 0, 1,
-0.5708902, -0.7680365, -2.422285, 0.2235294, 1, 0, 1,
-0.5670186, 0.1878935, 0.4698015, 0.2196078, 1, 0, 1,
-0.5657694, -1.14626, -3.570834, 0.2117647, 1, 0, 1,
-0.5619694, -1.341178, -1.274421, 0.2078431, 1, 0, 1,
-0.5612209, 1.212211, -1.243197, 0.2, 1, 0, 1,
-0.559873, 0.7977098, -2.129572, 0.1921569, 1, 0, 1,
-0.5547779, 0.7023037, -0.2555138, 0.1882353, 1, 0, 1,
-0.5525686, -1.929196, -1.583502, 0.1803922, 1, 0, 1,
-0.5514371, -1.738742, -2.474943, 0.1764706, 1, 0, 1,
-0.548704, 1.519209, 0.08200859, 0.1686275, 1, 0, 1,
-0.5459515, 0.5628117, -3.074356, 0.1647059, 1, 0, 1,
-0.542464, -0.502555, -2.025485, 0.1568628, 1, 0, 1,
-0.5414785, -0.9941689, -1.863066, 0.1529412, 1, 0, 1,
-0.5385349, 1.120775, 1.381124, 0.145098, 1, 0, 1,
-0.531475, -1.175499, -1.722613, 0.1411765, 1, 0, 1,
-0.5258859, -1.478846, -2.705748, 0.1333333, 1, 0, 1,
-0.5230154, -1.578114, -3.161433, 0.1294118, 1, 0, 1,
-0.5207973, 0.4768519, -1.886322, 0.1215686, 1, 0, 1,
-0.5206571, -0.6145319, -2.23588, 0.1176471, 1, 0, 1,
-0.5203619, 1.865955, 0.7565467, 0.1098039, 1, 0, 1,
-0.5128754, 0.8251907, -1.373995, 0.1058824, 1, 0, 1,
-0.511193, 1.125131, 0.1030569, 0.09803922, 1, 0, 1,
-0.5099092, -2.640309, -3.499253, 0.09019608, 1, 0, 1,
-0.5088894, -1.914832, -4.133789, 0.08627451, 1, 0, 1,
-0.5087091, 0.7747056, -0.9214146, 0.07843138, 1, 0, 1,
-0.5065011, 0.7855237, -0.2750877, 0.07450981, 1, 0, 1,
-0.505856, -1.142594, -4.21662, 0.06666667, 1, 0, 1,
-0.5043194, -0.5839322, -2.028548, 0.0627451, 1, 0, 1,
-0.496158, -0.6228725, -2.746771, 0.05490196, 1, 0, 1,
-0.4944554, -0.5189666, -1.141503, 0.05098039, 1, 0, 1,
-0.4889675, -1.5168, -5.49429, 0.04313726, 1, 0, 1,
-0.4840885, 0.222823, -2.023774, 0.03921569, 1, 0, 1,
-0.472057, -0.4176844, -1.228615, 0.03137255, 1, 0, 1,
-0.4699275, -2.037824, -2.943956, 0.02745098, 1, 0, 1,
-0.4686465, 0.9554043, -1.743585, 0.01960784, 1, 0, 1,
-0.4655399, 1.240957, -0.9199639, 0.01568628, 1, 0, 1,
-0.4583195, -0.6961113, -1.719768, 0.007843138, 1, 0, 1,
-0.455798, 1.490585, -0.5263454, 0.003921569, 1, 0, 1,
-0.4538827, 0.2910298, -1.250276, 0, 1, 0.003921569, 1,
-0.4500562, 0.6174167, -1.113398, 0, 1, 0.01176471, 1,
-0.4478185, 0.08185102, -1.280844, 0, 1, 0.01568628, 1,
-0.4471651, 0.4802894, -0.6370063, 0, 1, 0.02352941, 1,
-0.4468595, -2.002189, -2.862237, 0, 1, 0.02745098, 1,
-0.4460752, -1.083821, -4.074352, 0, 1, 0.03529412, 1,
-0.4457713, -1.817409, -3.362969, 0, 1, 0.03921569, 1,
-0.435942, 0.2648914, -0.8363391, 0, 1, 0.04705882, 1,
-0.4341459, -0.6658105, -0.916487, 0, 1, 0.05098039, 1,
-0.4305635, -0.5768296, -0.861427, 0, 1, 0.05882353, 1,
-0.4277719, 0.1990112, -1.168893, 0, 1, 0.0627451, 1,
-0.4231226, -0.7697036, -2.178947, 0, 1, 0.07058824, 1,
-0.4166241, -1.037601, -3.789863, 0, 1, 0.07450981, 1,
-0.4163806, -0.1766223, -1.948705, 0, 1, 0.08235294, 1,
-0.4155366, 0.03413037, -1.877808, 0, 1, 0.08627451, 1,
-0.414251, 1.235897, -0.4587468, 0, 1, 0.09411765, 1,
-0.4142072, 1.405893, 0.5145398, 0, 1, 0.1019608, 1,
-0.4127256, -0.9985572, -4.903271, 0, 1, 0.1058824, 1,
-0.4121084, -0.2938706, -2.212004, 0, 1, 0.1137255, 1,
-0.410801, 1.261112, -0.8505133, 0, 1, 0.1176471, 1,
-0.4075229, 0.4439975, 0.7007369, 0, 1, 0.1254902, 1,
-0.4073964, -0.2164986, -2.685171, 0, 1, 0.1294118, 1,
-0.4063379, 0.9461201, 0.1596287, 0, 1, 0.1372549, 1,
-0.4053428, -1.35786, -2.257227, 0, 1, 0.1411765, 1,
-0.4035734, 0.5503682, -1.271982, 0, 1, 0.1490196, 1,
-0.3991678, 0.6924982, -1.386376, 0, 1, 0.1529412, 1,
-0.3985671, -0.2299373, -4.117985, 0, 1, 0.1607843, 1,
-0.3984306, -0.6142586, -0.6863454, 0, 1, 0.1647059, 1,
-0.3976994, 1.208461, 0.6226237, 0, 1, 0.172549, 1,
-0.3976895, -0.7287713, -1.834957, 0, 1, 0.1764706, 1,
-0.3948926, 0.103536, -0.7191666, 0, 1, 0.1843137, 1,
-0.3869685, -0.5476817, -1.751302, 0, 1, 0.1882353, 1,
-0.3819302, 0.07169572, -0.5157738, 0, 1, 0.1960784, 1,
-0.38112, 0.5946561, -0.9977656, 0, 1, 0.2039216, 1,
-0.3794822, 1.325976, -1.515572, 0, 1, 0.2078431, 1,
-0.3761647, -0.7244517, -3.157394, 0, 1, 0.2156863, 1,
-0.3694011, 2.219941, -1.331778, 0, 1, 0.2196078, 1,
-0.3675927, -0.01309054, -2.158491, 0, 1, 0.227451, 1,
-0.3669508, 0.5017586, -2.832127, 0, 1, 0.2313726, 1,
-0.3622118, -1.257783, -2.601414, 0, 1, 0.2392157, 1,
-0.3604226, -0.2996623, -1.889132, 0, 1, 0.2431373, 1,
-0.3529963, -1.527786, -1.957885, 0, 1, 0.2509804, 1,
-0.3523357, -0.4122949, -1.634742, 0, 1, 0.254902, 1,
-0.3501053, 1.010247, -0.5201181, 0, 1, 0.2627451, 1,
-0.3456745, 1.568722, 0.1725937, 0, 1, 0.2666667, 1,
-0.3443563, -0.7423248, -2.307723, 0, 1, 0.2745098, 1,
-0.3402581, -1.800293, -3.625701, 0, 1, 0.2784314, 1,
-0.331181, 0.04281176, -1.822367, 0, 1, 0.2862745, 1,
-0.3292646, 0.2300885, -1.163631, 0, 1, 0.2901961, 1,
-0.3232682, 0.8746476, -0.4974641, 0, 1, 0.2980392, 1,
-0.3224609, -0.2281398, -2.438462, 0, 1, 0.3058824, 1,
-0.3184863, 0.09688319, -1.540523, 0, 1, 0.3098039, 1,
-0.3167897, -1.775116, -2.019027, 0, 1, 0.3176471, 1,
-0.3139453, 0.9348165, 0.2493258, 0, 1, 0.3215686, 1,
-0.3106499, 1.654365, -0.5607859, 0, 1, 0.3294118, 1,
-0.3088687, -0.7052592, -1.027221, 0, 1, 0.3333333, 1,
-0.3017292, 0.6628129, 1.177595, 0, 1, 0.3411765, 1,
-0.2995768, -1.097938, -3.37883, 0, 1, 0.345098, 1,
-0.2955353, 0.05811092, -0.1859927, 0, 1, 0.3529412, 1,
-0.2953741, 1.035096, -0.6763943, 0, 1, 0.3568628, 1,
-0.294311, 0.3521313, 1.552239, 0, 1, 0.3647059, 1,
-0.294275, 0.2606553, -0.8673766, 0, 1, 0.3686275, 1,
-0.2935446, 1.666896, 0.6537302, 0, 1, 0.3764706, 1,
-0.2923558, 0.7020649, -0.8480458, 0, 1, 0.3803922, 1,
-0.2916498, 0.7439979, -0.8813763, 0, 1, 0.3882353, 1,
-0.2874352, -0.1460597, -1.780144, 0, 1, 0.3921569, 1,
-0.2864245, 1.221285, -0.2628399, 0, 1, 0.4, 1,
-0.2852344, 0.7252037, -2.065712, 0, 1, 0.4078431, 1,
-0.2818647, -0.4678584, -1.460059, 0, 1, 0.4117647, 1,
-0.2799895, -0.4065342, -4.09266, 0, 1, 0.4196078, 1,
-0.2797602, -0.02804435, -2.161837, 0, 1, 0.4235294, 1,
-0.2778358, 0.2669063, -0.005897694, 0, 1, 0.4313726, 1,
-0.2769184, 0.4293999, -0.3739592, 0, 1, 0.4352941, 1,
-0.2758098, 0.3595904, -0.6708097, 0, 1, 0.4431373, 1,
-0.2720582, -0.3628685, -2.7096, 0, 1, 0.4470588, 1,
-0.2687516, -1.137495, -2.951745, 0, 1, 0.454902, 1,
-0.2647747, 1.326457, 1.89299, 0, 1, 0.4588235, 1,
-0.2618468, -1.157346, -2.934959, 0, 1, 0.4666667, 1,
-0.2584904, -1.513709, -3.151834, 0, 1, 0.4705882, 1,
-0.2556989, -1.516351, -3.753818, 0, 1, 0.4784314, 1,
-0.2537914, -1.223004, -3.139859, 0, 1, 0.4823529, 1,
-0.2526893, 0.3201511, -0.1005089, 0, 1, 0.4901961, 1,
-0.2522763, 0.4548003, -1.217401, 0, 1, 0.4941176, 1,
-0.2517915, -0.7577355, -4.091754, 0, 1, 0.5019608, 1,
-0.2513039, 0.4517984, -0.6933244, 0, 1, 0.509804, 1,
-0.2446272, -0.5865898, -1.502624, 0, 1, 0.5137255, 1,
-0.2443107, 0.2171575, -0.7886709, 0, 1, 0.5215687, 1,
-0.2410574, -1.775161, -3.771615, 0, 1, 0.5254902, 1,
-0.2377551, -0.5832113, -2.80379, 0, 1, 0.5333334, 1,
-0.2372586, -0.9792103, -2.812177, 0, 1, 0.5372549, 1,
-0.2370003, 0.05469475, -0.5810594, 0, 1, 0.5450981, 1,
-0.2355001, 1.680241, 0.09013183, 0, 1, 0.5490196, 1,
-0.2335237, -0.3651823, -2.462255, 0, 1, 0.5568628, 1,
-0.2325098, -1.817309, -3.700235, 0, 1, 0.5607843, 1,
-0.230546, -0.3238696, -3.020957, 0, 1, 0.5686275, 1,
-0.2292326, 0.5448006, -1.891849, 0, 1, 0.572549, 1,
-0.2283679, 1.224229, 0.692786, 0, 1, 0.5803922, 1,
-0.2283079, -2.507458, -3.932173, 0, 1, 0.5843138, 1,
-0.2250094, 1.07801, 0.6549066, 0, 1, 0.5921569, 1,
-0.2237507, -0.1414289, -1.760945, 0, 1, 0.5960785, 1,
-0.2132012, 0.09210137, 0.7099455, 0, 1, 0.6039216, 1,
-0.2121391, -0.3995478, -2.827231, 0, 1, 0.6117647, 1,
-0.2117931, 0.06571475, -1.770409, 0, 1, 0.6156863, 1,
-0.2098188, 0.07291821, 0.2280563, 0, 1, 0.6235294, 1,
-0.2075702, -1.283707, -3.650311, 0, 1, 0.627451, 1,
-0.2050319, 1.47579, 0.2671393, 0, 1, 0.6352941, 1,
-0.2042532, -0.01248309, -0.7397917, 0, 1, 0.6392157, 1,
-0.2035249, 1.10183, 1.568237, 0, 1, 0.6470588, 1,
-0.2021992, -0.4968426, -1.860789, 0, 1, 0.6509804, 1,
-0.1997646, 0.09276407, -1.672782, 0, 1, 0.6588235, 1,
-0.1917904, -0.9377143, -2.957576, 0, 1, 0.6627451, 1,
-0.1883247, 1.105492, -0.07001583, 0, 1, 0.6705883, 1,
-0.1874886, -1.295066, -3.509343, 0, 1, 0.6745098, 1,
-0.1874866, -0.9014627, -3.372416, 0, 1, 0.682353, 1,
-0.1865893, -1.926481, -0.5792288, 0, 1, 0.6862745, 1,
-0.1860059, 0.3973028, -1.177872, 0, 1, 0.6941177, 1,
-0.1818547, -0.6866361, -1.29064, 0, 1, 0.7019608, 1,
-0.1663697, 0.9644988, -0.2320925, 0, 1, 0.7058824, 1,
-0.1657671, -0.1589395, -2.33041, 0, 1, 0.7137255, 1,
-0.162238, 1.206084, 0.4723695, 0, 1, 0.7176471, 1,
-0.1543923, 0.7096452, 0.1458889, 0, 1, 0.7254902, 1,
-0.1497133, -0.1037835, -1.983045, 0, 1, 0.7294118, 1,
-0.1474835, 0.4000027, -0.7640768, 0, 1, 0.7372549, 1,
-0.1463714, -0.3053999, -3.958194, 0, 1, 0.7411765, 1,
-0.1456386, 1.017226, -0.306683, 0, 1, 0.7490196, 1,
-0.1445798, 0.08970408, -1.362098, 0, 1, 0.7529412, 1,
-0.1443444, 0.7842731, -0.3492597, 0, 1, 0.7607843, 1,
-0.1429278, 0.6474952, -0.002924931, 0, 1, 0.7647059, 1,
-0.141245, -1.190788, -2.74628, 0, 1, 0.772549, 1,
-0.1404749, 0.7387924, 0.009274533, 0, 1, 0.7764706, 1,
-0.1351492, -0.2955226, -4.308895, 0, 1, 0.7843137, 1,
-0.1351454, -1.416006, -5.224538, 0, 1, 0.7882353, 1,
-0.1288171, 2.163503, -0.7371942, 0, 1, 0.7960784, 1,
-0.1242362, 0.2058546, -1.198967, 0, 1, 0.8039216, 1,
-0.1209757, 1.567942, 0.338689, 0, 1, 0.8078431, 1,
-0.1209195, -0.4044913, -3.820123, 0, 1, 0.8156863, 1,
-0.1204052, -0.141876, -2.320445, 0, 1, 0.8196079, 1,
-0.11881, 1.069434, 0.1143157, 0, 1, 0.827451, 1,
-0.1143241, -2.036635, -3.963085, 0, 1, 0.8313726, 1,
-0.1133613, 1.131564, 0.3522866, 0, 1, 0.8392157, 1,
-0.1107405, 0.3502093, -0.9659995, 0, 1, 0.8431373, 1,
-0.1081829, -0.05368732, -2.342523, 0, 1, 0.8509804, 1,
-0.1043399, -1.089795, -3.238662, 0, 1, 0.854902, 1,
-0.09730604, 2.68054, 2.123289, 0, 1, 0.8627451, 1,
-0.09545532, 0.19503, -1.239786, 0, 1, 0.8666667, 1,
-0.09404983, 0.05561514, -1.170493, 0, 1, 0.8745098, 1,
-0.09101541, -0.6107267, -3.143965, 0, 1, 0.8784314, 1,
-0.08584183, -0.4318051, -5.188303, 0, 1, 0.8862745, 1,
-0.08440037, -1.825349, -2.066273, 0, 1, 0.8901961, 1,
-0.08415161, 0.02185222, -2.748411, 0, 1, 0.8980392, 1,
-0.0780136, -0.4438866, -4.051728, 0, 1, 0.9058824, 1,
-0.07375841, 1.179603, 0.2018764, 0, 1, 0.9098039, 1,
-0.07303736, 1.666213, 0.1448647, 0, 1, 0.9176471, 1,
-0.07250236, -0.7287074, -4.834517, 0, 1, 0.9215686, 1,
-0.0622056, 2.316006, -0.3392974, 0, 1, 0.9294118, 1,
-0.05919597, -0.5785615, -2.423537, 0, 1, 0.9333333, 1,
-0.05147992, 0.2352953, -0.9398861, 0, 1, 0.9411765, 1,
-0.05005116, -0.02561279, -2.515438, 0, 1, 0.945098, 1,
-0.04573942, -1.290884, -2.528591, 0, 1, 0.9529412, 1,
-0.04564078, 0.3838241, 0.3778501, 0, 1, 0.9568627, 1,
-0.04102382, -0.3585924, -0.5983295, 0, 1, 0.9647059, 1,
-0.04055345, -0.6405066, -2.656861, 0, 1, 0.9686275, 1,
-0.03888313, -1.932032, -2.950385, 0, 1, 0.9764706, 1,
-0.03851165, -0.02978923, -2.058446, 0, 1, 0.9803922, 1,
-0.03263741, 1.98802, -2.584712, 0, 1, 0.9882353, 1,
-0.02820092, -0.1194001, -1.883724, 0, 1, 0.9921569, 1,
-0.02795933, -1.70248, -4.171217, 0, 1, 1, 1,
-0.02736903, -0.6706632, -3.885971, 0, 0.9921569, 1, 1,
-0.02521846, 0.9663864, 0.3825428, 0, 0.9882353, 1, 1,
-0.02497757, -1.552758, -2.948895, 0, 0.9803922, 1, 1,
-0.02353369, 1.462405, 0.4913402, 0, 0.9764706, 1, 1,
-0.018449, 0.8916411, -0.4169282, 0, 0.9686275, 1, 1,
-0.01777825, -0.3350631, -1.766551, 0, 0.9647059, 1, 1,
-0.01422713, -0.5231643, -3.579449, 0, 0.9568627, 1, 1,
-0.01399189, 0.0491029, 0.02610934, 0, 0.9529412, 1, 1,
-0.009489687, -0.6670104, -2.397804, 0, 0.945098, 1, 1,
-0.004594981, -0.04016813, -2.730947, 0, 0.9411765, 1, 1,
-0.001743698, -0.8680741, -2.901407, 0, 0.9333333, 1, 1,
-0.001572205, 0.0009748382, 0.3612098, 0, 0.9294118, 1, 1,
0.0003266037, -1.685804, 4.015482, 0, 0.9215686, 1, 1,
0.0008142127, 0.7785569, -0.2179921, 0, 0.9176471, 1, 1,
0.000857103, 1.643261, 0.4674566, 0, 0.9098039, 1, 1,
0.002827599, -0.1814129, 3.057616, 0, 0.9058824, 1, 1,
0.004747241, 0.711372, 0.9442956, 0, 0.8980392, 1, 1,
0.005632199, -0.6504575, 4.190824, 0, 0.8901961, 1, 1,
0.007282359, -1.640847, 2.599766, 0, 0.8862745, 1, 1,
0.01287274, -0.7522998, 3.043966, 0, 0.8784314, 1, 1,
0.01366402, -0.3929334, 2.662001, 0, 0.8745098, 1, 1,
0.01674704, 0.2262581, -0.3317218, 0, 0.8666667, 1, 1,
0.01956731, -0.1441328, 3.029554, 0, 0.8627451, 1, 1,
0.02306591, -1.676692, 3.201184, 0, 0.854902, 1, 1,
0.02717747, -0.2367815, 3.102714, 0, 0.8509804, 1, 1,
0.03059821, -0.904883, 3.710633, 0, 0.8431373, 1, 1,
0.03085737, -1.847273, 2.368602, 0, 0.8392157, 1, 1,
0.03161598, -1.322562, 4.818472, 0, 0.8313726, 1, 1,
0.03680602, -0.9179268, 2.892361, 0, 0.827451, 1, 1,
0.03736125, 0.3999176, 0.3157064, 0, 0.8196079, 1, 1,
0.0433965, -0.6969971, 1.86805, 0, 0.8156863, 1, 1,
0.0457011, 0.3466817, -1.959879, 0, 0.8078431, 1, 1,
0.04684855, -1.904202, 3.335228, 0, 0.8039216, 1, 1,
0.05000532, -0.6359171, 3.083182, 0, 0.7960784, 1, 1,
0.05294234, -0.3282236, 2.158145, 0, 0.7882353, 1, 1,
0.05319285, 0.8677755, -0.8828301, 0, 0.7843137, 1, 1,
0.05789324, 1.371291, 0.3104056, 0, 0.7764706, 1, 1,
0.06417699, -0.01196742, 2.750737, 0, 0.772549, 1, 1,
0.06807959, -1.170189, 3.437076, 0, 0.7647059, 1, 1,
0.06829492, 1.563738, 1.21344, 0, 0.7607843, 1, 1,
0.06964534, 1.645366, -0.5896659, 0, 0.7529412, 1, 1,
0.07213154, -0.2747569, 2.669222, 0, 0.7490196, 1, 1,
0.08150092, 0.9317155, 0.3138185, 0, 0.7411765, 1, 1,
0.08566996, 0.6215944, 0.5989604, 0, 0.7372549, 1, 1,
0.08597625, -1.608358, 4.14013, 0, 0.7294118, 1, 1,
0.08845513, -1.908084, 1.109575, 0, 0.7254902, 1, 1,
0.09084645, 0.7613499, 0.2327442, 0, 0.7176471, 1, 1,
0.09647219, -1.330129, 3.523386, 0, 0.7137255, 1, 1,
0.09787846, -1.828695, 2.96686, 0, 0.7058824, 1, 1,
0.09933962, 0.4070086, 0.3034884, 0, 0.6980392, 1, 1,
0.1031644, -0.1578405, 2.787389, 0, 0.6941177, 1, 1,
0.1104221, 0.7146868, 1.225247, 0, 0.6862745, 1, 1,
0.1170149, 0.7190592, -0.06804993, 0, 0.682353, 1, 1,
0.1170874, 0.1421225, 0.8352792, 0, 0.6745098, 1, 1,
0.1202163, 2.513663, -0.9320565, 0, 0.6705883, 1, 1,
0.123704, 0.8282051, 0.04524209, 0, 0.6627451, 1, 1,
0.1305073, -1.201411, 3.813086, 0, 0.6588235, 1, 1,
0.1341245, -0.01646047, 0.06782149, 0, 0.6509804, 1, 1,
0.1352548, 0.167505, 1.203476, 0, 0.6470588, 1, 1,
0.1359957, -1.051709, 5.069406, 0, 0.6392157, 1, 1,
0.1366852, 0.7123775, 0.5800154, 0, 0.6352941, 1, 1,
0.1384407, 0.1275265, 0.0363696, 0, 0.627451, 1, 1,
0.1464542, 0.9120367, 0.1261782, 0, 0.6235294, 1, 1,
0.1477628, -0.01907058, 1.135395, 0, 0.6156863, 1, 1,
0.1499766, 0.4413843, 0.5088212, 0, 0.6117647, 1, 1,
0.15043, 0.4282658, -2.341094, 0, 0.6039216, 1, 1,
0.1508562, 1.411282, 1.869012, 0, 0.5960785, 1, 1,
0.1596615, 1.363544, -0.5102047, 0, 0.5921569, 1, 1,
0.1630808, -0.768657, 4.05964, 0, 0.5843138, 1, 1,
0.1632392, 1.175697, 0.5858606, 0, 0.5803922, 1, 1,
0.1637698, 1.139785, -0.815771, 0, 0.572549, 1, 1,
0.1640249, 0.01874411, 2.903502, 0, 0.5686275, 1, 1,
0.1647594, -0.4698501, 3.0557, 0, 0.5607843, 1, 1,
0.1687645, 1.148325, 0.6819856, 0, 0.5568628, 1, 1,
0.1725845, 0.5330988, -1.177044, 0, 0.5490196, 1, 1,
0.1803745, 0.9194436, -0.5677003, 0, 0.5450981, 1, 1,
0.1806628, -1.373679, 2.176393, 0, 0.5372549, 1, 1,
0.1808721, -0.09746629, 3.542412, 0, 0.5333334, 1, 1,
0.1826252, 1.201358, 0.4403168, 0, 0.5254902, 1, 1,
0.1827958, 0.8053675, -0.2077677, 0, 0.5215687, 1, 1,
0.1831902, 0.8177718, -1.122952, 0, 0.5137255, 1, 1,
0.1839651, 2.040452, 0.5727007, 0, 0.509804, 1, 1,
0.1862675, 1.606745, 1.297688, 0, 0.5019608, 1, 1,
0.1883714, 0.5571894, 0.4593376, 0, 0.4941176, 1, 1,
0.1912289, -0.5464959, 2.453868, 0, 0.4901961, 1, 1,
0.1916253, -0.9974073, 3.628112, 0, 0.4823529, 1, 1,
0.1957562, 0.2368282, 1.507563, 0, 0.4784314, 1, 1,
0.1968091, 0.5304297, -0.2159181, 0, 0.4705882, 1, 1,
0.2018832, 0.1618482, 0.7697967, 0, 0.4666667, 1, 1,
0.2061899, 2.002438, 0.09029312, 0, 0.4588235, 1, 1,
0.2072574, 0.5951616, 1.537804, 0, 0.454902, 1, 1,
0.209575, 1.273041, -0.464621, 0, 0.4470588, 1, 1,
0.2104202, -1.676186, 4.001998, 0, 0.4431373, 1, 1,
0.2106843, 0.8921963, 1.716301, 0, 0.4352941, 1, 1,
0.2128368, -0.1723629, 3.251322, 0, 0.4313726, 1, 1,
0.2151679, 2.340065, -0.3959821, 0, 0.4235294, 1, 1,
0.2168122, 0.4128573, 1.270465, 0, 0.4196078, 1, 1,
0.2169542, 0.9620157, 1.220415, 0, 0.4117647, 1, 1,
0.2185937, -1.133237, 2.886927, 0, 0.4078431, 1, 1,
0.225071, -0.5036259, 0.3474032, 0, 0.4, 1, 1,
0.2254623, 0.9859083, -0.434923, 0, 0.3921569, 1, 1,
0.2280918, 0.8950505, 0.1403344, 0, 0.3882353, 1, 1,
0.2296871, -0.6184313, 1.590861, 0, 0.3803922, 1, 1,
0.2326377, 0.9104047, 0.7222338, 0, 0.3764706, 1, 1,
0.2331505, -0.4166706, 3.009591, 0, 0.3686275, 1, 1,
0.2334289, 0.05377097, 0.7840129, 0, 0.3647059, 1, 1,
0.235039, 0.4767993, -0.5831555, 0, 0.3568628, 1, 1,
0.2351895, 0.3025924, 0.7633724, 0, 0.3529412, 1, 1,
0.237151, 0.502042, -0.9810613, 0, 0.345098, 1, 1,
0.2385861, -1.000728, 1.799652, 0, 0.3411765, 1, 1,
0.2465596, -1.862478, 0.3310754, 0, 0.3333333, 1, 1,
0.2625314, -1.231108, 3.375232, 0, 0.3294118, 1, 1,
0.2664173, -1.107539, 2.127025, 0, 0.3215686, 1, 1,
0.2708413, -0.7778103, 3.161994, 0, 0.3176471, 1, 1,
0.2751879, -0.4446989, 4.151876, 0, 0.3098039, 1, 1,
0.276318, -0.4048611, 4.705172, 0, 0.3058824, 1, 1,
0.2763229, -0.2454324, 3.066876, 0, 0.2980392, 1, 1,
0.2813349, -0.4447176, 2.232377, 0, 0.2901961, 1, 1,
0.2855601, 1.569025, 0.5435094, 0, 0.2862745, 1, 1,
0.2901913, 2.727763, 1.026687, 0, 0.2784314, 1, 1,
0.2926067, -0.2358322, 1.871684, 0, 0.2745098, 1, 1,
0.2939504, -0.3444723, 1.804547, 0, 0.2666667, 1, 1,
0.2944972, 0.2749262, 0.4232517, 0, 0.2627451, 1, 1,
0.2982659, -0.6202142, 4.039608, 0, 0.254902, 1, 1,
0.3052857, 2.562028, 0.3958907, 0, 0.2509804, 1, 1,
0.3061411, 0.747083, 1.025945, 0, 0.2431373, 1, 1,
0.3104198, 1.401052, 1.324005, 0, 0.2392157, 1, 1,
0.3123283, -0.346683, 2.817208, 0, 0.2313726, 1, 1,
0.3140965, 0.476283, 1.545284, 0, 0.227451, 1, 1,
0.3171438, -0.2663622, 2.159225, 0, 0.2196078, 1, 1,
0.3186829, 0.1125781, 0.7552048, 0, 0.2156863, 1, 1,
0.3209484, -1.110905, 3.256119, 0, 0.2078431, 1, 1,
0.3226503, -0.5889562, 2.807164, 0, 0.2039216, 1, 1,
0.323224, -0.9110021, 3.623373, 0, 0.1960784, 1, 1,
0.3324606, -0.1228737, 1.722746, 0, 0.1882353, 1, 1,
0.3341969, -0.3012481, -0.3271676, 0, 0.1843137, 1, 1,
0.3378927, -1.29986, 5.631268, 0, 0.1764706, 1, 1,
0.347472, -0.9850734, 3.428385, 0, 0.172549, 1, 1,
0.3475592, -1.182984, 1.883064, 0, 0.1647059, 1, 1,
0.3478131, 0.6406161, -2.104948, 0, 0.1607843, 1, 1,
0.353574, -1.058326, 1.655833, 0, 0.1529412, 1, 1,
0.355986, 1.49072, -0.1019451, 0, 0.1490196, 1, 1,
0.3571978, -1.051621, 1.830351, 0, 0.1411765, 1, 1,
0.3582637, 2.224187, 1.594294, 0, 0.1372549, 1, 1,
0.3600588, -0.01310841, 2.127954, 0, 0.1294118, 1, 1,
0.3623136, 1.051004, 0.5163987, 0, 0.1254902, 1, 1,
0.3664708, 0.009262932, 1.904678, 0, 0.1176471, 1, 1,
0.3678549, -0.6591666, 2.747627, 0, 0.1137255, 1, 1,
0.3708492, -0.2849804, 4.270215, 0, 0.1058824, 1, 1,
0.3715001, -0.8996432, 3.362144, 0, 0.09803922, 1, 1,
0.3775142, 0.4044193, -0.4129441, 0, 0.09411765, 1, 1,
0.3775792, -0.8972651, 2.457922, 0, 0.08627451, 1, 1,
0.3802755, 0.4540958, 1.55334, 0, 0.08235294, 1, 1,
0.3825961, -2.083837, 3.341172, 0, 0.07450981, 1, 1,
0.3838636, -0.7499714, 2.669624, 0, 0.07058824, 1, 1,
0.3840438, -0.3708701, 3.428213, 0, 0.0627451, 1, 1,
0.389265, -0.6962911, 2.723431, 0, 0.05882353, 1, 1,
0.3895722, -1.764404, 2.011613, 0, 0.05098039, 1, 1,
0.390445, -1.533549, 2.657552, 0, 0.04705882, 1, 1,
0.3924536, -0.07955708, 2.561194, 0, 0.03921569, 1, 1,
0.3926916, -1.114379, 2.490445, 0, 0.03529412, 1, 1,
0.3943683, -0.138321, 3.72673, 0, 0.02745098, 1, 1,
0.3972262, -0.4085929, 3.59991, 0, 0.02352941, 1, 1,
0.3977041, 1.883558, -0.001950383, 0, 0.01568628, 1, 1,
0.3990109, 0.8813023, 0.5081812, 0, 0.01176471, 1, 1,
0.3998716, -0.2198518, 0.6992453, 0, 0.003921569, 1, 1,
0.4020218, -0.2845879, 3.20074, 0.003921569, 0, 1, 1,
0.4022853, 0.1129546, 2.004913, 0.007843138, 0, 1, 1,
0.404354, 0.2134294, 1.527524, 0.01568628, 0, 1, 1,
0.4081462, 1.400835, 0.3709064, 0.01960784, 0, 1, 1,
0.417706, -0.9246059, 2.367406, 0.02745098, 0, 1, 1,
0.4199899, -0.2603981, 2.045964, 0.03137255, 0, 1, 1,
0.4209199, -0.2370182, 3.788435, 0.03921569, 0, 1, 1,
0.424186, -0.5187383, -0.02613764, 0.04313726, 0, 1, 1,
0.4247503, 2.173211, 1.650005, 0.05098039, 0, 1, 1,
0.4280812, -0.7829158, 1.595947, 0.05490196, 0, 1, 1,
0.4298113, 0.5918118, -0.02252375, 0.0627451, 0, 1, 1,
0.4315158, 1.123364, -1.064791, 0.06666667, 0, 1, 1,
0.4358035, 0.7440736, 0.1607596, 0.07450981, 0, 1, 1,
0.4390018, -0.7346979, 2.663919, 0.07843138, 0, 1, 1,
0.4407927, 0.4015116, 1.723643, 0.08627451, 0, 1, 1,
0.4489586, -0.5965738, 5.263576, 0.09019608, 0, 1, 1,
0.4531488, 2.494748, 1.359716, 0.09803922, 0, 1, 1,
0.4563698, 1.093002, -1.292442, 0.1058824, 0, 1, 1,
0.4647228, 1.935732, -0.3745658, 0.1098039, 0, 1, 1,
0.4649961, 0.6876323, 1.199811, 0.1176471, 0, 1, 1,
0.466801, 1.00167, 0.5540907, 0.1215686, 0, 1, 1,
0.4685887, -0.5553048, 2.392265, 0.1294118, 0, 1, 1,
0.469817, -1.231065, 3.575718, 0.1333333, 0, 1, 1,
0.4733724, -1.699189, 3.588004, 0.1411765, 0, 1, 1,
0.4741209, -0.9748907, 4.138971, 0.145098, 0, 1, 1,
0.4800956, 0.1904451, 0.8972543, 0.1529412, 0, 1, 1,
0.4945182, -1.151844, 2.258659, 0.1568628, 0, 1, 1,
0.4953973, -1.305097, 1.561065, 0.1647059, 0, 1, 1,
0.4984248, -0.4178355, 2.538655, 0.1686275, 0, 1, 1,
0.5006167, 0.6108144, -0.4180343, 0.1764706, 0, 1, 1,
0.5006958, -0.5570088, 2.925456, 0.1803922, 0, 1, 1,
0.5021933, 0.5832975, 0.8590911, 0.1882353, 0, 1, 1,
0.505787, -0.1124752, 1.313049, 0.1921569, 0, 1, 1,
0.5085192, -0.3170307, 1.448683, 0.2, 0, 1, 1,
0.5101973, 0.7266413, 2.399376, 0.2078431, 0, 1, 1,
0.5215276, -1.244176, 2.462634, 0.2117647, 0, 1, 1,
0.5220276, 0.4813969, -0.0927453, 0.2196078, 0, 1, 1,
0.5327346, -2.197604, -0.2676663, 0.2235294, 0, 1, 1,
0.5348446, 0.6628284, -0.2918371, 0.2313726, 0, 1, 1,
0.5365564, 1.290202, 1.217303, 0.2352941, 0, 1, 1,
0.5478814, 1.079495, 0.5668951, 0.2431373, 0, 1, 1,
0.5480698, 0.9342206, 2.854592, 0.2470588, 0, 1, 1,
0.5498425, -1.91844, 2.0439, 0.254902, 0, 1, 1,
0.555686, -0.08555743, 2.57966, 0.2588235, 0, 1, 1,
0.5602294, 0.1415117, 2.346489, 0.2666667, 0, 1, 1,
0.5608397, -1.97747, 1.647332, 0.2705882, 0, 1, 1,
0.5643833, 0.1335949, 0.7065759, 0.2784314, 0, 1, 1,
0.5645837, 0.2750369, 2.488356, 0.282353, 0, 1, 1,
0.5668004, -1.076208, 4.160578, 0.2901961, 0, 1, 1,
0.5712402, 0.1341084, 0.03580173, 0.2941177, 0, 1, 1,
0.5745695, -1.993071, 3.146986, 0.3019608, 0, 1, 1,
0.5804568, 0.8585578, 0.9934979, 0.3098039, 0, 1, 1,
0.586748, 0.08881959, 1.810434, 0.3137255, 0, 1, 1,
0.5878253, -1.254298, 3.099399, 0.3215686, 0, 1, 1,
0.5930527, 0.6583581, -1.165837, 0.3254902, 0, 1, 1,
0.5957571, -0.879775, 0.7111039, 0.3333333, 0, 1, 1,
0.5994255, -1.329898, 1.448673, 0.3372549, 0, 1, 1,
0.6002935, 1.196454, -0.8877315, 0.345098, 0, 1, 1,
0.6166754, 0.4450695, 1.476826, 0.3490196, 0, 1, 1,
0.617498, 1.684053, 0.654671, 0.3568628, 0, 1, 1,
0.6232771, 0.09583686, 1.898301, 0.3607843, 0, 1, 1,
0.6288682, -0.5652074, 0.9299908, 0.3686275, 0, 1, 1,
0.6331312, -0.373846, 1.662775, 0.372549, 0, 1, 1,
0.6344509, -0.8885908, 2.812988, 0.3803922, 0, 1, 1,
0.6373071, 0.9628938, 0.9966605, 0.3843137, 0, 1, 1,
0.63916, 0.1393333, 0.3199987, 0.3921569, 0, 1, 1,
0.6412799, 1.038666, -0.2106111, 0.3960784, 0, 1, 1,
0.6466703, 1.792095, 0.5478342, 0.4039216, 0, 1, 1,
0.6486365, 0.3905116, 0.7156402, 0.4117647, 0, 1, 1,
0.6499017, 0.2824451, -0.2702783, 0.4156863, 0, 1, 1,
0.6531884, 0.7897894, 1.20875, 0.4235294, 0, 1, 1,
0.6546662, 2.107545, -2.420644, 0.427451, 0, 1, 1,
0.6547596, 0.02961214, 3.242903, 0.4352941, 0, 1, 1,
0.6618177, -0.4283374, 1.042161, 0.4392157, 0, 1, 1,
0.6730632, 0.1309847, -0.03020739, 0.4470588, 0, 1, 1,
0.6764106, -0.3660885, 3.339287, 0.4509804, 0, 1, 1,
0.6769318, -0.9036071, 2.286156, 0.4588235, 0, 1, 1,
0.6814602, -0.04529781, 0.7005087, 0.4627451, 0, 1, 1,
0.6853335, 0.8809558, 2.522839, 0.4705882, 0, 1, 1,
0.6860732, 1.598814, 0.8662694, 0.4745098, 0, 1, 1,
0.6873062, -0.1088075, 1.958184, 0.4823529, 0, 1, 1,
0.6876007, 0.9955753, 1.786705, 0.4862745, 0, 1, 1,
0.6884347, 2.050329, 1.062861, 0.4941176, 0, 1, 1,
0.6908866, 0.5870807, 0.6973878, 0.5019608, 0, 1, 1,
0.6921948, 0.2133936, 1.820736, 0.5058824, 0, 1, 1,
0.6955308, 1.260894, -1.004319, 0.5137255, 0, 1, 1,
0.6980945, 0.3581033, 1.300336, 0.5176471, 0, 1, 1,
0.7019602, -1.569335, 3.178936, 0.5254902, 0, 1, 1,
0.7072022, -0.8388435, 2.744503, 0.5294118, 0, 1, 1,
0.7082122, -1.367627, 2.715059, 0.5372549, 0, 1, 1,
0.7083958, -0.9263893, 1.327632, 0.5411765, 0, 1, 1,
0.7143679, -0.1383733, 2.237481, 0.5490196, 0, 1, 1,
0.718049, -0.894022, 2.557461, 0.5529412, 0, 1, 1,
0.7187505, -0.8983479, 3.537145, 0.5607843, 0, 1, 1,
0.720731, -1.200392, 2.133724, 0.5647059, 0, 1, 1,
0.7216157, 0.5793211, 0.6919742, 0.572549, 0, 1, 1,
0.723987, 0.1312473, 0.7353589, 0.5764706, 0, 1, 1,
0.7252522, 0.1562011, 1.523604, 0.5843138, 0, 1, 1,
0.7331749, -0.7498474, 2.388093, 0.5882353, 0, 1, 1,
0.7412999, -0.6702308, 3.028311, 0.5960785, 0, 1, 1,
0.7468867, -0.9716729, 2.072831, 0.6039216, 0, 1, 1,
0.7495152, 0.03693035, 1.742444, 0.6078432, 0, 1, 1,
0.7552577, -1.582189, 2.643661, 0.6156863, 0, 1, 1,
0.7566184, 0.2585818, 2.500452, 0.6196079, 0, 1, 1,
0.7601634, -0.1856061, 1.598778, 0.627451, 0, 1, 1,
0.767453, 1.69868, 1.700188, 0.6313726, 0, 1, 1,
0.7743766, 0.3296886, 2.39292, 0.6392157, 0, 1, 1,
0.7753899, -1.195258, 1.350346, 0.6431373, 0, 1, 1,
0.77919, 1.275271, -0.36182, 0.6509804, 0, 1, 1,
0.7803825, -0.4266658, 3.022758, 0.654902, 0, 1, 1,
0.7809187, -0.07743205, 1.169075, 0.6627451, 0, 1, 1,
0.7892067, 0.2051392, 1.167275, 0.6666667, 0, 1, 1,
0.7959704, -0.4257188, 3.56312, 0.6745098, 0, 1, 1,
0.7971423, 1.985207, 1.744429, 0.6784314, 0, 1, 1,
0.8040746, -1.279813, 4.221744, 0.6862745, 0, 1, 1,
0.8045058, -0.4843442, 2.576176, 0.6901961, 0, 1, 1,
0.8063464, 1.061324, -0.4265974, 0.6980392, 0, 1, 1,
0.8075284, -0.2648143, 1.903817, 0.7058824, 0, 1, 1,
0.818696, -0.789091, 2.252452, 0.7098039, 0, 1, 1,
0.819402, -0.6850063, 1.687392, 0.7176471, 0, 1, 1,
0.8235667, 0.0153517, 0.6797367, 0.7215686, 0, 1, 1,
0.8265679, -1.208733, 4.665715, 0.7294118, 0, 1, 1,
0.829069, 0.1655512, 0.6345465, 0.7333333, 0, 1, 1,
0.8296372, -1.038173, 1.492863, 0.7411765, 0, 1, 1,
0.8298682, 1.229807, 0.6430876, 0.7450981, 0, 1, 1,
0.8305745, 0.5905322, 1.734864, 0.7529412, 0, 1, 1,
0.8316236, 0.677212, 1.009213, 0.7568628, 0, 1, 1,
0.8349254, 1.153966, 0.625843, 0.7647059, 0, 1, 1,
0.8364936, 0.6062375, 2.250068, 0.7686275, 0, 1, 1,
0.8366032, 0.8544102, -0.4360549, 0.7764706, 0, 1, 1,
0.842517, 0.4978673, -0.03482182, 0.7803922, 0, 1, 1,
0.8428421, -0.4296562, 2.246929, 0.7882353, 0, 1, 1,
0.84782, 0.522213, 2.449404, 0.7921569, 0, 1, 1,
0.8484555, -0.6744358, 3.176797, 0.8, 0, 1, 1,
0.8505078, 0.03703066, 1.575656, 0.8078431, 0, 1, 1,
0.8510737, 0.4673032, -0.1656746, 0.8117647, 0, 1, 1,
0.854638, 0.6951283, 0.9332626, 0.8196079, 0, 1, 1,
0.8562213, 1.137094, 3.266877, 0.8235294, 0, 1, 1,
0.864116, -0.690208, 2.539269, 0.8313726, 0, 1, 1,
0.869094, -1.558861, 3.260154, 0.8352941, 0, 1, 1,
0.872452, 0.2583677, 1.741939, 0.8431373, 0, 1, 1,
0.8726147, -1.151528, 1.203161, 0.8470588, 0, 1, 1,
0.8752716, -0.1930381, 0.9354895, 0.854902, 0, 1, 1,
0.8763438, -1.759402, 3.161372, 0.8588235, 0, 1, 1,
0.8826951, 0.2761131, 0.9049872, 0.8666667, 0, 1, 1,
0.8836595, 0.3183255, 0.9054236, 0.8705882, 0, 1, 1,
0.884571, -0.8226396, 2.376987, 0.8784314, 0, 1, 1,
0.884975, 1.739958, -0.4223108, 0.8823529, 0, 1, 1,
0.8878545, -0.3894043, 0.9260119, 0.8901961, 0, 1, 1,
0.9084563, 0.2988131, 1.477409, 0.8941177, 0, 1, 1,
0.9096563, 0.9261665, -0.3294505, 0.9019608, 0, 1, 1,
0.9107094, -0.7020047, 2.846181, 0.9098039, 0, 1, 1,
0.9155216, 0.2761592, 2.292503, 0.9137255, 0, 1, 1,
0.9256034, 1.492788, -0.4486906, 0.9215686, 0, 1, 1,
0.9379351, -0.1381718, 1.410455, 0.9254902, 0, 1, 1,
0.9385667, -0.3128778, 2.154701, 0.9333333, 0, 1, 1,
0.9419442, -0.1410053, 0.05379525, 0.9372549, 0, 1, 1,
0.9472567, 0.9699045, 0.8110722, 0.945098, 0, 1, 1,
0.9495487, 1.395296, 1.102663, 0.9490196, 0, 1, 1,
0.9515846, 0.6044307, 1.425127, 0.9568627, 0, 1, 1,
0.9545115, -0.3491561, 0.09822014, 0.9607843, 0, 1, 1,
0.9595571, -1.000329, 2.213194, 0.9686275, 0, 1, 1,
0.9782903, 0.3056548, 2.118686, 0.972549, 0, 1, 1,
0.9791995, 1.567266, 0.7075405, 0.9803922, 0, 1, 1,
0.9799399, -2.149599, 3.910547, 0.9843137, 0, 1, 1,
0.9831951, 1.596798, 1.483925, 0.9921569, 0, 1, 1,
0.98685, 0.4520333, -0.3332549, 0.9960784, 0, 1, 1,
0.992608, -0.1885154, 1.144204, 1, 0, 0.9960784, 1,
0.9945444, -0.9289331, 2.03178, 1, 0, 0.9882353, 1,
0.9959187, -1.450006, 3.782204, 1, 0, 0.9843137, 1,
1.004647, 0.6609285, 0.3895336, 1, 0, 0.9764706, 1,
1.011067, 0.703169, -0.08045534, 1, 0, 0.972549, 1,
1.01124, 1.484856, 0.2739085, 1, 0, 0.9647059, 1,
1.014934, 1.156154, 1.14893, 1, 0, 0.9607843, 1,
1.016144, -1.36485, 2.631307, 1, 0, 0.9529412, 1,
1.016651, -0.2184627, 3.165802, 1, 0, 0.9490196, 1,
1.017863, -0.1482728, 0.398574, 1, 0, 0.9411765, 1,
1.034268, -0.115429, 1.867365, 1, 0, 0.9372549, 1,
1.03519, -0.6835781, 2.486756, 1, 0, 0.9294118, 1,
1.040886, 0.7894133, 0.3934719, 1, 0, 0.9254902, 1,
1.047667, -1.397675, 1.492315, 1, 0, 0.9176471, 1,
1.04773, -0.3318729, 1.048982, 1, 0, 0.9137255, 1,
1.051311, 1.214745, 0.4636988, 1, 0, 0.9058824, 1,
1.061254, -2.265806, 1.135162, 1, 0, 0.9019608, 1,
1.081977, 1.005623, 0.9409588, 1, 0, 0.8941177, 1,
1.086692, -0.2680312, 2.440932, 1, 0, 0.8862745, 1,
1.087104, 2.318458, 1.06451, 1, 0, 0.8823529, 1,
1.092579, -0.2723896, 2.003953, 1, 0, 0.8745098, 1,
1.095442, 0.5758541, 2.137363, 1, 0, 0.8705882, 1,
1.100522, 0.4635899, 2.701202, 1, 0, 0.8627451, 1,
1.100523, 0.7419525, 0.7647192, 1, 0, 0.8588235, 1,
1.100564, -0.7841873, 1.479106, 1, 0, 0.8509804, 1,
1.106267, 0.1596271, 2.779121, 1, 0, 0.8470588, 1,
1.110076, -0.8515604, 1.74209, 1, 0, 0.8392157, 1,
1.132764, -0.6899002, 2.123601, 1, 0, 0.8352941, 1,
1.132836, 1.776547, 2.372096, 1, 0, 0.827451, 1,
1.144589, 0.01730568, 2.609192, 1, 0, 0.8235294, 1,
1.149408, 0.5607128, 1.567946, 1, 0, 0.8156863, 1,
1.1507, 0.825552, 1.972375, 1, 0, 0.8117647, 1,
1.151798, -0.9073876, 3.073549, 1, 0, 0.8039216, 1,
1.151886, 0.3885002, 0.3527364, 1, 0, 0.7960784, 1,
1.153964, 0.7532094, 1.11145, 1, 0, 0.7921569, 1,
1.163007, 0.5253872, 2.445553, 1, 0, 0.7843137, 1,
1.176675, -0.4355899, 2.584484, 1, 0, 0.7803922, 1,
1.17769, -0.1856228, 1.871859, 1, 0, 0.772549, 1,
1.188232, 1.17433, 0.634519, 1, 0, 0.7686275, 1,
1.192041, 0.02327354, 1.549336, 1, 0, 0.7607843, 1,
1.195729, 1.848341, 2.350174, 1, 0, 0.7568628, 1,
1.20141, 0.01264856, 1.267106, 1, 0, 0.7490196, 1,
1.20228, -0.569413, 1.566589, 1, 0, 0.7450981, 1,
1.21535, -0.8708752, 1.910111, 1, 0, 0.7372549, 1,
1.221705, -0.744727, 2.193683, 1, 0, 0.7333333, 1,
1.224808, 1.013396, 1.16103, 1, 0, 0.7254902, 1,
1.225171, 0.2064195, 0.3953436, 1, 0, 0.7215686, 1,
1.229802, -1.227787, 2.458405, 1, 0, 0.7137255, 1,
1.234171, 0.7827791, -0.1563993, 1, 0, 0.7098039, 1,
1.242371, 0.446648, 4.202888, 1, 0, 0.7019608, 1,
1.242466, 1.621587, -0.100855, 1, 0, 0.6941177, 1,
1.243238, -0.5740532, 0.4945074, 1, 0, 0.6901961, 1,
1.253043, 0.967204, 2.474702, 1, 0, 0.682353, 1,
1.278977, -0.3886001, 2.186069, 1, 0, 0.6784314, 1,
1.284408, 1.328584, 1.014298, 1, 0, 0.6705883, 1,
1.284629, -1.308856, 1.773424, 1, 0, 0.6666667, 1,
1.288013, -0.5853724, 1.763397, 1, 0, 0.6588235, 1,
1.288859, 1.240676, 0.5878631, 1, 0, 0.654902, 1,
1.290434, -1.133252, 4.018511, 1, 0, 0.6470588, 1,
1.293937, -1.465397, 3.475027, 1, 0, 0.6431373, 1,
1.296621, -1.104584, 3.853372, 1, 0, 0.6352941, 1,
1.299608, 1.214105, 0.4075336, 1, 0, 0.6313726, 1,
1.299812, -0.9591597, 3.597225, 1, 0, 0.6235294, 1,
1.306806, 0.7717197, -0.7008037, 1, 0, 0.6196079, 1,
1.308433, 1.109006, 0.8202614, 1, 0, 0.6117647, 1,
1.322511, 1.805239, 2.57262, 1, 0, 0.6078432, 1,
1.329586, -0.4529891, 0.3551076, 1, 0, 0.6, 1,
1.331356, -0.3212439, 1.000024, 1, 0, 0.5921569, 1,
1.33209, -0.7186053, 3.039379, 1, 0, 0.5882353, 1,
1.335586, 0.7508152, 0.4922805, 1, 0, 0.5803922, 1,
1.33732, -0.6849831, 1.493841, 1, 0, 0.5764706, 1,
1.339429, -0.004970096, 0.2119917, 1, 0, 0.5686275, 1,
1.344168, 0.2102575, 1.516999, 1, 0, 0.5647059, 1,
1.344754, -1.19844, 1.711435, 1, 0, 0.5568628, 1,
1.34595, 0.05583803, 1.153109, 1, 0, 0.5529412, 1,
1.349742, 0.7223564, 1.397915, 1, 0, 0.5450981, 1,
1.357412, 0.979188, 1.459886, 1, 0, 0.5411765, 1,
1.358855, 0.2973322, 0.5540959, 1, 0, 0.5333334, 1,
1.362121, -0.842942, 2.794796, 1, 0, 0.5294118, 1,
1.387238, -0.484217, 2.106771, 1, 0, 0.5215687, 1,
1.433031, 0.9581502, 1.732035, 1, 0, 0.5176471, 1,
1.433343, -0.146368, 0.1983986, 1, 0, 0.509804, 1,
1.439277, -0.0009451113, 1.72525, 1, 0, 0.5058824, 1,
1.439301, 2.351088, -1.08204, 1, 0, 0.4980392, 1,
1.443748, -0.7627258, 1.470703, 1, 0, 0.4901961, 1,
1.443923, -2.139762, 2.786682, 1, 0, 0.4862745, 1,
1.446324, 1.45954, 0.2319887, 1, 0, 0.4784314, 1,
1.463559, 0.4013056, 0.2098511, 1, 0, 0.4745098, 1,
1.463823, 0.02330375, 0.4510708, 1, 0, 0.4666667, 1,
1.465032, 1.144082, 2.138943, 1, 0, 0.4627451, 1,
1.466833, -0.701794, 1.600968, 1, 0, 0.454902, 1,
1.473717, 0.09518488, 1.936671, 1, 0, 0.4509804, 1,
1.479546, -0.4624204, 2.728642, 1, 0, 0.4431373, 1,
1.483134, -1.090243, 1.719484, 1, 0, 0.4392157, 1,
1.487257, -0.8330218, 1.265484, 1, 0, 0.4313726, 1,
1.495659, -0.0608226, 0.9141272, 1, 0, 0.427451, 1,
1.499688, 0.09762856, 1.29344, 1, 0, 0.4196078, 1,
1.513609, -0.735711, 2.709996, 1, 0, 0.4156863, 1,
1.513878, 0.3362412, 0.9676742, 1, 0, 0.4078431, 1,
1.523072, 1.117254, 1.07889, 1, 0, 0.4039216, 1,
1.524921, 0.9261028, 1.269964, 1, 0, 0.3960784, 1,
1.539003, 0.1097696, 0.2135558, 1, 0, 0.3882353, 1,
1.540442, 0.4196485, 1.68922, 1, 0, 0.3843137, 1,
1.553525, -1.42729, 3.440778, 1, 0, 0.3764706, 1,
1.561703, -0.5577967, 0.7378106, 1, 0, 0.372549, 1,
1.566073, -1.417128, 2.039726, 1, 0, 0.3647059, 1,
1.583915, -1.177592, 2.373261, 1, 0, 0.3607843, 1,
1.593902, -0.535304, 2.551273, 1, 0, 0.3529412, 1,
1.600652, 0.5121332, 1.47072, 1, 0, 0.3490196, 1,
1.616054, 0.6113114, 0.132238, 1, 0, 0.3411765, 1,
1.62257, -0.05399661, 3.778736, 1, 0, 0.3372549, 1,
1.624068, 0.420723, 0.8501602, 1, 0, 0.3294118, 1,
1.632321, -0.01578674, 2.925198, 1, 0, 0.3254902, 1,
1.641155, 0.542004, 2.800035, 1, 0, 0.3176471, 1,
1.641977, 0.03653818, 4.350694, 1, 0, 0.3137255, 1,
1.652213, -1.875642, 3.029723, 1, 0, 0.3058824, 1,
1.663356, 0.5375122, -0.2397262, 1, 0, 0.2980392, 1,
1.66717, 0.622253, 0.4660628, 1, 0, 0.2941177, 1,
1.675546, 0.6741556, 1.299141, 1, 0, 0.2862745, 1,
1.695929, 0.8571848, 0.1880371, 1, 0, 0.282353, 1,
1.696548, 0.3500089, 1.598475, 1, 0, 0.2745098, 1,
1.706209, -0.1620999, 1.553322, 1, 0, 0.2705882, 1,
1.709036, 1.084621, 0.8926863, 1, 0, 0.2627451, 1,
1.73896, 0.666962, 2.701457, 1, 0, 0.2588235, 1,
1.740862, 1.549022, 0.07950738, 1, 0, 0.2509804, 1,
1.749903, 0.237223, 0.7861145, 1, 0, 0.2470588, 1,
1.750182, -1.441637, 2.961065, 1, 0, 0.2392157, 1,
1.763407, 1.543189, 1.030135, 1, 0, 0.2352941, 1,
1.771621, 0.1018973, 3.653561, 1, 0, 0.227451, 1,
1.793661, -1.334584, 2.699847, 1, 0, 0.2235294, 1,
1.796729, 0.4089043, -0.84883, 1, 0, 0.2156863, 1,
1.819713, -2.287329, 4.01652, 1, 0, 0.2117647, 1,
1.828211, -1.37858, 3.22451, 1, 0, 0.2039216, 1,
1.863865, -0.7860996, 1.400957, 1, 0, 0.1960784, 1,
1.922077, -0.03545508, 1.245925, 1, 0, 0.1921569, 1,
1.923167, 0.637499, 2.312624, 1, 0, 0.1843137, 1,
1.937999, 0.06806309, 1.231414, 1, 0, 0.1803922, 1,
1.955824, -0.2215609, 0.9414806, 1, 0, 0.172549, 1,
1.960927, 0.2503771, 1.476919, 1, 0, 0.1686275, 1,
1.971655, -0.9845223, 2.242341, 1, 0, 0.1607843, 1,
2.010988, -0.5290935, 2.047439, 1, 0, 0.1568628, 1,
2.012237, -0.3803533, 1.99452, 1, 0, 0.1490196, 1,
2.012478, -0.3653343, -0.0483464, 1, 0, 0.145098, 1,
2.045417, -1.629432, 1.129253, 1, 0, 0.1372549, 1,
2.088353, 0.2551419, 0.9496368, 1, 0, 0.1333333, 1,
2.089274, -0.2308945, 2.816985, 1, 0, 0.1254902, 1,
2.090878, 0.7461043, 1.083053, 1, 0, 0.1215686, 1,
2.0931, -1.081764, 1.688142, 1, 0, 0.1137255, 1,
2.131179, 1.551018, 0.7179946, 1, 0, 0.1098039, 1,
2.144901, 0.8407466, 2.245188, 1, 0, 0.1019608, 1,
2.150799, 0.5212297, 2.024631, 1, 0, 0.09411765, 1,
2.184431, 0.9443837, 0.7010503, 1, 0, 0.09019608, 1,
2.215604, 0.002831113, 0.7847259, 1, 0, 0.08235294, 1,
2.222198, -0.3640931, 0.1473177, 1, 0, 0.07843138, 1,
2.250607, -0.6889871, 2.979624, 1, 0, 0.07058824, 1,
2.261815, 1.318834, 1.500005, 1, 0, 0.06666667, 1,
2.280878, -0.4442981, 1.366063, 1, 0, 0.05882353, 1,
2.331424, -0.2886655, 1.076932, 1, 0, 0.05490196, 1,
2.343459, -1.791916, 3.336914, 1, 0, 0.04705882, 1,
2.346567, 0.2723361, 1.580892, 1, 0, 0.04313726, 1,
2.349311, -1.585514, 2.210726, 1, 0, 0.03529412, 1,
2.376527, 0.1192148, 1.686714, 1, 0, 0.03137255, 1,
2.422509, 1.001858, 0.1137343, 1, 0, 0.02352941, 1,
2.424098, 0.8089378, 2.331966, 1, 0, 0.01960784, 1,
2.441539, 0.07546709, 2.671479, 1, 0, 0.01176471, 1,
2.578578, 1.067768, 1.146104, 1, 0, 0.007843138, 1
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
-0.4439093, -4.22782, -7.40762, 0, -0.5, 0.5, 0.5,
-0.4439093, -4.22782, -7.40762, 1, -0.5, 0.5, 0.5,
-0.4439093, -4.22782, -7.40762, 1, 1.5, 0.5, 0.5,
-0.4439093, -4.22782, -7.40762, 0, 1.5, 0.5, 0.5
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
-4.49102, -0.169686, -7.40762, 0, -0.5, 0.5, 0.5,
-4.49102, -0.169686, -7.40762, 1, -0.5, 0.5, 0.5,
-4.49102, -0.169686, -7.40762, 1, 1.5, 0.5, 0.5,
-4.49102, -0.169686, -7.40762, 0, 1.5, 0.5, 0.5
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
-4.49102, -4.22782, 0.0567112, 0, -0.5, 0.5, 0.5,
-4.49102, -4.22782, 0.0567112, 1, -0.5, 0.5, 0.5,
-4.49102, -4.22782, 0.0567112, 1, 1.5, 0.5, 0.5,
-4.49102, -4.22782, 0.0567112, 0, 1.5, 0.5, 0.5
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
-3, -3.291328, -5.685082,
2, -3.291328, -5.685082,
-3, -3.291328, -5.685082,
-3, -3.44741, -5.972172,
-2, -3.291328, -5.685082,
-2, -3.44741, -5.972172,
-1, -3.291328, -5.685082,
-1, -3.44741, -5.972172,
0, -3.291328, -5.685082,
0, -3.44741, -5.972172,
1, -3.291328, -5.685082,
1, -3.44741, -5.972172,
2, -3.291328, -5.685082,
2, -3.44741, -5.972172
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
-3, -3.759574, -6.546351, 0, -0.5, 0.5, 0.5,
-3, -3.759574, -6.546351, 1, -0.5, 0.5, 0.5,
-3, -3.759574, -6.546351, 1, 1.5, 0.5, 0.5,
-3, -3.759574, -6.546351, 0, 1.5, 0.5, 0.5,
-2, -3.759574, -6.546351, 0, -0.5, 0.5, 0.5,
-2, -3.759574, -6.546351, 1, -0.5, 0.5, 0.5,
-2, -3.759574, -6.546351, 1, 1.5, 0.5, 0.5,
-2, -3.759574, -6.546351, 0, 1.5, 0.5, 0.5,
-1, -3.759574, -6.546351, 0, -0.5, 0.5, 0.5,
-1, -3.759574, -6.546351, 1, -0.5, 0.5, 0.5,
-1, -3.759574, -6.546351, 1, 1.5, 0.5, 0.5,
-1, -3.759574, -6.546351, 0, 1.5, 0.5, 0.5,
0, -3.759574, -6.546351, 0, -0.5, 0.5, 0.5,
0, -3.759574, -6.546351, 1, -0.5, 0.5, 0.5,
0, -3.759574, -6.546351, 1, 1.5, 0.5, 0.5,
0, -3.759574, -6.546351, 0, 1.5, 0.5, 0.5,
1, -3.759574, -6.546351, 0, -0.5, 0.5, 0.5,
1, -3.759574, -6.546351, 1, -0.5, 0.5, 0.5,
1, -3.759574, -6.546351, 1, 1.5, 0.5, 0.5,
1, -3.759574, -6.546351, 0, 1.5, 0.5, 0.5,
2, -3.759574, -6.546351, 0, -0.5, 0.5, 0.5,
2, -3.759574, -6.546351, 1, -0.5, 0.5, 0.5,
2, -3.759574, -6.546351, 1, 1.5, 0.5, 0.5,
2, -3.759574, -6.546351, 0, 1.5, 0.5, 0.5
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
-3.557072, -3, -5.685082,
-3.557072, 2, -5.685082,
-3.557072, -3, -5.685082,
-3.71273, -3, -5.972172,
-3.557072, -2, -5.685082,
-3.71273, -2, -5.972172,
-3.557072, -1, -5.685082,
-3.71273, -1, -5.972172,
-3.557072, 0, -5.685082,
-3.71273, 0, -5.972172,
-3.557072, 1, -5.685082,
-3.71273, 1, -5.972172,
-3.557072, 2, -5.685082,
-3.71273, 2, -5.972172
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
-4.024046, -3, -6.546351, 0, -0.5, 0.5, 0.5,
-4.024046, -3, -6.546351, 1, -0.5, 0.5, 0.5,
-4.024046, -3, -6.546351, 1, 1.5, 0.5, 0.5,
-4.024046, -3, -6.546351, 0, 1.5, 0.5, 0.5,
-4.024046, -2, -6.546351, 0, -0.5, 0.5, 0.5,
-4.024046, -2, -6.546351, 1, -0.5, 0.5, 0.5,
-4.024046, -2, -6.546351, 1, 1.5, 0.5, 0.5,
-4.024046, -2, -6.546351, 0, 1.5, 0.5, 0.5,
-4.024046, -1, -6.546351, 0, -0.5, 0.5, 0.5,
-4.024046, -1, -6.546351, 1, -0.5, 0.5, 0.5,
-4.024046, -1, -6.546351, 1, 1.5, 0.5, 0.5,
-4.024046, -1, -6.546351, 0, 1.5, 0.5, 0.5,
-4.024046, 0, -6.546351, 0, -0.5, 0.5, 0.5,
-4.024046, 0, -6.546351, 1, -0.5, 0.5, 0.5,
-4.024046, 0, -6.546351, 1, 1.5, 0.5, 0.5,
-4.024046, 0, -6.546351, 0, 1.5, 0.5, 0.5,
-4.024046, 1, -6.546351, 0, -0.5, 0.5, 0.5,
-4.024046, 1, -6.546351, 1, -0.5, 0.5, 0.5,
-4.024046, 1, -6.546351, 1, 1.5, 0.5, 0.5,
-4.024046, 1, -6.546351, 0, 1.5, 0.5, 0.5,
-4.024046, 2, -6.546351, 0, -0.5, 0.5, 0.5,
-4.024046, 2, -6.546351, 1, -0.5, 0.5, 0.5,
-4.024046, 2, -6.546351, 1, 1.5, 0.5, 0.5,
-4.024046, 2, -6.546351, 0, 1.5, 0.5, 0.5
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
-3.557072, -3.291328, -4,
-3.557072, -3.291328, 4,
-3.557072, -3.291328, -4,
-3.71273, -3.44741, -4,
-3.557072, -3.291328, -2,
-3.71273, -3.44741, -2,
-3.557072, -3.291328, 0,
-3.71273, -3.44741, 0,
-3.557072, -3.291328, 2,
-3.71273, -3.44741, 2,
-3.557072, -3.291328, 4,
-3.71273, -3.44741, 4
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
-4.024046, -3.759574, -4, 0, -0.5, 0.5, 0.5,
-4.024046, -3.759574, -4, 1, -0.5, 0.5, 0.5,
-4.024046, -3.759574, -4, 1, 1.5, 0.5, 0.5,
-4.024046, -3.759574, -4, 0, 1.5, 0.5, 0.5,
-4.024046, -3.759574, -2, 0, -0.5, 0.5, 0.5,
-4.024046, -3.759574, -2, 1, -0.5, 0.5, 0.5,
-4.024046, -3.759574, -2, 1, 1.5, 0.5, 0.5,
-4.024046, -3.759574, -2, 0, 1.5, 0.5, 0.5,
-4.024046, -3.759574, 0, 0, -0.5, 0.5, 0.5,
-4.024046, -3.759574, 0, 1, -0.5, 0.5, 0.5,
-4.024046, -3.759574, 0, 1, 1.5, 0.5, 0.5,
-4.024046, -3.759574, 0, 0, 1.5, 0.5, 0.5,
-4.024046, -3.759574, 2, 0, -0.5, 0.5, 0.5,
-4.024046, -3.759574, 2, 1, -0.5, 0.5, 0.5,
-4.024046, -3.759574, 2, 1, 1.5, 0.5, 0.5,
-4.024046, -3.759574, 2, 0, 1.5, 0.5, 0.5,
-4.024046, -3.759574, 4, 0, -0.5, 0.5, 0.5,
-4.024046, -3.759574, 4, 1, -0.5, 0.5, 0.5,
-4.024046, -3.759574, 4, 1, 1.5, 0.5, 0.5,
-4.024046, -3.759574, 4, 0, 1.5, 0.5, 0.5
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
-3.557072, -3.291328, -5.685082,
-3.557072, 2.951956, -5.685082,
-3.557072, -3.291328, 5.798505,
-3.557072, 2.951956, 5.798505,
-3.557072, -3.291328, -5.685082,
-3.557072, -3.291328, 5.798505,
-3.557072, 2.951956, -5.685082,
-3.557072, 2.951956, 5.798505,
-3.557072, -3.291328, -5.685082,
2.669253, -3.291328, -5.685082,
-3.557072, -3.291328, 5.798505,
2.669253, -3.291328, 5.798505,
-3.557072, 2.951956, -5.685082,
2.669253, 2.951956, -5.685082,
-3.557072, 2.951956, 5.798505,
2.669253, 2.951956, 5.798505,
2.669253, -3.291328, -5.685082,
2.669253, 2.951956, -5.685082,
2.669253, -3.291328, 5.798505,
2.669253, 2.951956, 5.798505,
2.669253, -3.291328, -5.685082,
2.669253, -3.291328, 5.798505,
2.669253, 2.951956, -5.685082,
2.669253, 2.951956, 5.798505
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
var radius = 7.731082;
var distance = 34.39646;
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
mvMatrix.translate( 0.4439093, 0.169686, -0.0567112 );
mvMatrix.scale( 1.342525, 1.338878, 0.7279082 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.39646);
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
hydramethylnon<-read.table("hydramethylnon.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-hydramethylnon$V2
```

```
## Error in eval(expr, envir, enclos): object 'hydramethylnon' not found
```

```r
y<-hydramethylnon$V3
```

```
## Error in eval(expr, envir, enclos): object 'hydramethylnon' not found
```

```r
z<-hydramethylnon$V4
```

```
## Error in eval(expr, envir, enclos): object 'hydramethylnon' not found
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
-3.466397, 0.1077217, -0.2534074, 0, 0, 1, 1, 1,
-3.251161, 1.035476, -0.8976746, 1, 0, 0, 1, 1,
-2.859254, 1.239737, -1.836435, 1, 0, 0, 1, 1,
-2.757688, 0.9426521, -1.449647, 1, 0, 0, 1, 1,
-2.606212, -0.7487532, -2.79767, 1, 0, 0, 1, 1,
-2.541694, 0.6555471, -2.594672, 1, 0, 0, 1, 1,
-2.440648, -1.432737, -0.7076679, 0, 0, 0, 1, 1,
-2.440567, -0.3367623, -0.2855458, 0, 0, 0, 1, 1,
-2.432172, 2.734517, -0.773021, 0, 0, 0, 1, 1,
-2.377494, 0.1509896, -5.517846, 0, 0, 0, 1, 1,
-2.356807, -0.2494015, -2.396756, 0, 0, 0, 1, 1,
-2.312214, -1.10181, -1.576557, 0, 0, 0, 1, 1,
-2.305165, -1.01321, -1.513951, 0, 0, 0, 1, 1,
-2.274374, 0.4580012, -1.453719, 1, 1, 1, 1, 1,
-2.23254, 2.060242, -0.786993, 1, 1, 1, 1, 1,
-2.208378, 0.9170594, -0.615932, 1, 1, 1, 1, 1,
-2.19714, -0.166393, -1.177985, 1, 1, 1, 1, 1,
-2.194484, 1.333887, -0.8206063, 1, 1, 1, 1, 1,
-2.1928, 1.519451, -1.785547, 1, 1, 1, 1, 1,
-2.153263, -0.4881436, -0.1144588, 1, 1, 1, 1, 1,
-2.132119, 0.6565984, -1.320738, 1, 1, 1, 1, 1,
-2.129837, -2.275861, -3.555717, 1, 1, 1, 1, 1,
-2.067706, 1.549494, -0.5936035, 1, 1, 1, 1, 1,
-2.059851, -0.3122309, -2.553617, 1, 1, 1, 1, 1,
-2.010607, 1.264136, -0.2384558, 1, 1, 1, 1, 1,
-1.941172, -0.6464329, -1.864847, 1, 1, 1, 1, 1,
-1.937998, 0.8759555, 0.2874585, 1, 1, 1, 1, 1,
-1.914357, 0.8929918, -0.1217233, 1, 1, 1, 1, 1,
-1.886512, 0.6657919, -1.631591, 0, 0, 1, 1, 1,
-1.878528, -0.3904659, -3.599962, 1, 0, 0, 1, 1,
-1.865547, -0.2393529, -1.783356, 1, 0, 0, 1, 1,
-1.832776, -0.5900298, -2.244368, 1, 0, 0, 1, 1,
-1.828404, 0.3568956, -0.6444818, 1, 0, 0, 1, 1,
-1.809856, 1.063918, -0.1825765, 1, 0, 0, 1, 1,
-1.796141, -1.032996, -3.041696, 0, 0, 0, 1, 1,
-1.790426, -1.485874, -1.847213, 0, 0, 0, 1, 1,
-1.782658, -0.8464693, -0.8111135, 0, 0, 0, 1, 1,
-1.779354, 0.3737436, -2.482582, 0, 0, 0, 1, 1,
-1.760903, -0.8092288, -2.570512, 0, 0, 0, 1, 1,
-1.749073, -0.169917, -3.712387, 0, 0, 0, 1, 1,
-1.739068, 0.4060645, -0.8331201, 0, 0, 0, 1, 1,
-1.731142, -0.1202408, -1.226743, 1, 1, 1, 1, 1,
-1.728182, 1.205624, 0.5892888, 1, 1, 1, 1, 1,
-1.714943, -1.671767, -2.624449, 1, 1, 1, 1, 1,
-1.707145, -0.2283878, -1.953235, 1, 1, 1, 1, 1,
-1.706947, -1.124004, -1.997003, 1, 1, 1, 1, 1,
-1.706787, -0.1898387, -1.84467, 1, 1, 1, 1, 1,
-1.706562, 0.3036115, -0.1060174, 1, 1, 1, 1, 1,
-1.70502, 0.8900805, -1.507023, 1, 1, 1, 1, 1,
-1.694276, -0.985437, -1.654212, 1, 1, 1, 1, 1,
-1.676897, 1.630751, -1.09072, 1, 1, 1, 1, 1,
-1.657669, 0.2199023, -1.566978, 1, 1, 1, 1, 1,
-1.639426, 0.2132597, -1.241776, 1, 1, 1, 1, 1,
-1.629383, 0.166391, -3.11671, 1, 1, 1, 1, 1,
-1.589973, -0.05121664, -3.172574, 1, 1, 1, 1, 1,
-1.573415, 1.572315, 1.475674, 1, 1, 1, 1, 1,
-1.562583, -0.4308071, -1.790175, 0, 0, 1, 1, 1,
-1.553927, 1.937005, 0.4436805, 1, 0, 0, 1, 1,
-1.551663, 1.497619, 1.066574, 1, 0, 0, 1, 1,
-1.54939, -1.468298, -2.457847, 1, 0, 0, 1, 1,
-1.523962, -0.7337116, -0.677763, 1, 0, 0, 1, 1,
-1.507971, 0.5334033, -2.329552, 1, 0, 0, 1, 1,
-1.506198, 0.09590866, -1.419295, 0, 0, 0, 1, 1,
-1.500772, 0.08295123, -2.226058, 0, 0, 0, 1, 1,
-1.498679, 0.3818443, -1.62872, 0, 0, 0, 1, 1,
-1.494135, -0.1729381, -1.581809, 0, 0, 0, 1, 1,
-1.491622, 0.5522721, -2.043396, 0, 0, 0, 1, 1,
-1.47536, 0.2394703, -2.22222, 0, 0, 0, 1, 1,
-1.464618, 0.8979902, -0.2910228, 0, 0, 0, 1, 1,
-1.463373, 0.2839487, -2.245986, 1, 1, 1, 1, 1,
-1.455843, 0.4000125, -2.881879, 1, 1, 1, 1, 1,
-1.455656, -0.1793498, -2.175893, 1, 1, 1, 1, 1,
-1.452788, -0.4240698, -1.026837, 1, 1, 1, 1, 1,
-1.452305, -1.188264, -3.034624, 1, 1, 1, 1, 1,
-1.444266, 1.475234, -0.881312, 1, 1, 1, 1, 1,
-1.438058, -0.1586201, -0.8719888, 1, 1, 1, 1, 1,
-1.430272, -0.03160883, -1.722058, 1, 1, 1, 1, 1,
-1.429976, -0.608906, -1.588056, 1, 1, 1, 1, 1,
-1.420138, -2.079444, -2.115062, 1, 1, 1, 1, 1,
-1.418786, 0.3477266, -0.443011, 1, 1, 1, 1, 1,
-1.415763, -1.946031, -1.543893, 1, 1, 1, 1, 1,
-1.414964, -1.320928, -2.736792, 1, 1, 1, 1, 1,
-1.398964, 1.443704, -1.285534, 1, 1, 1, 1, 1,
-1.394405, 0.7757142, -2.315333, 1, 1, 1, 1, 1,
-1.393392, 0.8375846, -1.44363, 0, 0, 1, 1, 1,
-1.386861, 0.4816302, -1.352619, 1, 0, 0, 1, 1,
-1.383357, -0.523899, -3.330847, 1, 0, 0, 1, 1,
-1.382364, 0.4654997, -1.376965, 1, 0, 0, 1, 1,
-1.376122, -0.367809, -1.814949, 1, 0, 0, 1, 1,
-1.360674, 1.140138, 0.4530706, 1, 0, 0, 1, 1,
-1.358251, 0.2303067, -1.204293, 0, 0, 0, 1, 1,
-1.352272, -0.02256594, -1.666303, 0, 0, 0, 1, 1,
-1.351415, -0.960454, -2.186421, 0, 0, 0, 1, 1,
-1.339002, -0.3910424, -0.5964783, 0, 0, 0, 1, 1,
-1.330768, -1.738667, -3.632681, 0, 0, 0, 1, 1,
-1.328849, -0.3539317, -2.859699, 0, 0, 0, 1, 1,
-1.327978, 0.7457511, 0.02643375, 0, 0, 0, 1, 1,
-1.323194, 0.1205769, -0.7267538, 1, 1, 1, 1, 1,
-1.315785, 0.269257, -2.371101, 1, 1, 1, 1, 1,
-1.313527, -0.4087479, -1.836744, 1, 1, 1, 1, 1,
-1.294949, 0.2685873, 0.2595879, 1, 1, 1, 1, 1,
-1.293302, -0.2085412, -1.120495, 1, 1, 1, 1, 1,
-1.282421, 1.909341, -0.955895, 1, 1, 1, 1, 1,
-1.271835, 0.6778893, -4.643405, 1, 1, 1, 1, 1,
-1.268665, 1.241532, -0.7967346, 1, 1, 1, 1, 1,
-1.236781, -0.6438615, -2.375388, 1, 1, 1, 1, 1,
-1.214967, 0.3023769, 0.2880543, 1, 1, 1, 1, 1,
-1.214853, -0.3456964, -2.614736, 1, 1, 1, 1, 1,
-1.210617, -0.4919039, -2.635249, 1, 1, 1, 1, 1,
-1.208956, 1.495076, -1.988271, 1, 1, 1, 1, 1,
-1.206873, -0.2569656, -2.088869, 1, 1, 1, 1, 1,
-1.205772, -0.1968859, -1.146464, 1, 1, 1, 1, 1,
-1.201668, 0.7900129, -0.4890219, 0, 0, 1, 1, 1,
-1.198472, -0.08618419, -2.988022, 1, 0, 0, 1, 1,
-1.195089, -1.277167, -1.978016, 1, 0, 0, 1, 1,
-1.192076, -1.712623, -3.211501, 1, 0, 0, 1, 1,
-1.185258, -0.215286, -1.22808, 1, 0, 0, 1, 1,
-1.181841, -0.2365382, -1.523281, 1, 0, 0, 1, 1,
-1.177906, 0.5129362, -2.372987, 0, 0, 0, 1, 1,
-1.173628, 1.366261, 0.1776051, 0, 0, 0, 1, 1,
-1.172759, -1.492292, -1.809576, 0, 0, 0, 1, 1,
-1.168844, 0.7646531, -0.3685933, 0, 0, 0, 1, 1,
-1.167638, -0.2891925, -2.035907, 0, 0, 0, 1, 1,
-1.163345, -1.74793, -0.7437702, 0, 0, 0, 1, 1,
-1.162789, -1.154227, -1.196959, 0, 0, 0, 1, 1,
-1.160454, 0.9047832, -1.395241, 1, 1, 1, 1, 1,
-1.158989, -0.5868623, -1.070713, 1, 1, 1, 1, 1,
-1.147356, 0.9159455, -0.37225, 1, 1, 1, 1, 1,
-1.139294, 0.2824586, -1.059593, 1, 1, 1, 1, 1,
-1.134531, -1.570242, -1.617169, 1, 1, 1, 1, 1,
-1.130917, -0.06373686, -0.006034725, 1, 1, 1, 1, 1,
-1.126107, 0.1916447, -0.3023269, 1, 1, 1, 1, 1,
-1.121925, 0.1665487, -1.115202, 1, 1, 1, 1, 1,
-1.121202, 0.254158, -0.44758, 1, 1, 1, 1, 1,
-1.12033, -0.5179884, -3.085224, 1, 1, 1, 1, 1,
-1.118567, 1.178448, -0.6581987, 1, 1, 1, 1, 1,
-1.117934, -1.252387, -2.657916, 1, 1, 1, 1, 1,
-1.114475, -0.5357438, -1.473337, 1, 1, 1, 1, 1,
-1.109498, -1.490076, -1.859369, 1, 1, 1, 1, 1,
-1.108501, 0.6102099, -0.1083639, 1, 1, 1, 1, 1,
-1.107328, 2.861034, -1.497824, 0, 0, 1, 1, 1,
-1.100622, -0.1109247, -0.5416253, 1, 0, 0, 1, 1,
-1.096788, -0.6300927, -4.271843, 1, 0, 0, 1, 1,
-1.091039, -0.8008677, -3.866051, 1, 0, 0, 1, 1,
-1.090567, 1.67851, -0.2493667, 1, 0, 0, 1, 1,
-1.08457, -0.06062813, -3.130148, 1, 0, 0, 1, 1,
-1.079885, 1.384393, -2.174143, 0, 0, 0, 1, 1,
-1.077194, -1.2266, -2.893376, 0, 0, 0, 1, 1,
-1.075891, 1.594384, -1.174329, 0, 0, 0, 1, 1,
-1.074878, 0.4112618, -1.273862, 0, 0, 0, 1, 1,
-1.066011, 0.2911661, -0.9570641, 0, 0, 0, 1, 1,
-1.058663, -0.3105887, -2.588212, 0, 0, 0, 1, 1,
-1.057988, -1.871336, -1.318058, 0, 0, 0, 1, 1,
-1.056957, 0.2371507, -1.597659, 1, 1, 1, 1, 1,
-1.052239, -0.4070604, -1.958003, 1, 1, 1, 1, 1,
-1.050114, -0.394629, -2.647468, 1, 1, 1, 1, 1,
-1.042938, -0.1267446, -1.535366, 1, 1, 1, 1, 1,
-1.03116, -0.1529451, -1.901674, 1, 1, 1, 1, 1,
-1.031079, -0.8126855, -1.055935, 1, 1, 1, 1, 1,
-1.017374, -0.479926, -1.606247, 1, 1, 1, 1, 1,
-1.010719, -1.29972, -2.268624, 1, 1, 1, 1, 1,
-1.010509, -0.9295098, -3.975189, 1, 1, 1, 1, 1,
-1.006355, 0.287443, -1.807915, 1, 1, 1, 1, 1,
-1.003991, -0.9317583, -3.293408, 1, 1, 1, 1, 1,
-1.003309, 0.07214136, -2.211664, 1, 1, 1, 1, 1,
-1.002121, 0.5945423, -1.398025, 1, 1, 1, 1, 1,
-1.00004, -0.9159607, -1.916225, 1, 1, 1, 1, 1,
-0.9974906, 0.4202799, -1.353783, 1, 1, 1, 1, 1,
-0.9970658, -0.447154, -2.445534, 0, 0, 1, 1, 1,
-0.9894357, 0.5717986, -1.883198, 1, 0, 0, 1, 1,
-0.9887211, -1.57519, -1.483441, 1, 0, 0, 1, 1,
-0.9855635, 0.07506283, -1.205919, 1, 0, 0, 1, 1,
-0.9852628, -0.2701785, -1.158676, 1, 0, 0, 1, 1,
-0.9850021, -0.5872154, -1.880668, 1, 0, 0, 1, 1,
-0.9797882, -2.022215, -1.780231, 0, 0, 0, 1, 1,
-0.974569, -2.165796, -3.924777, 0, 0, 0, 1, 1,
-0.9646581, -2.009879, -2.739439, 0, 0, 0, 1, 1,
-0.9623919, 1.233264, -1.530863, 0, 0, 0, 1, 1,
-0.9555528, 2.020182, -2.325719, 0, 0, 0, 1, 1,
-0.9552758, 0.8970752, -0.2117729, 0, 0, 0, 1, 1,
-0.948709, 0.5462053, -0.358777, 0, 0, 0, 1, 1,
-0.9325797, -1.869954, -1.755515, 1, 1, 1, 1, 1,
-0.9290531, -1.162612, -3.029053, 1, 1, 1, 1, 1,
-0.9285709, 0.4412889, 0.8256462, 1, 1, 1, 1, 1,
-0.9248436, -0.03202607, -1.656724, 1, 1, 1, 1, 1,
-0.9223771, -0.6258714, -2.062678, 1, 1, 1, 1, 1,
-0.9044139, 0.5659317, -0.7375764, 1, 1, 1, 1, 1,
-0.8849094, 1.210075, -0.05477879, 1, 1, 1, 1, 1,
-0.8788531, -0.1126046, -1.37878, 1, 1, 1, 1, 1,
-0.8773699, -2.09542, -2.423207, 1, 1, 1, 1, 1,
-0.876224, 1.111399, -0.7921196, 1, 1, 1, 1, 1,
-0.873594, 1.673798, 1.215402, 1, 1, 1, 1, 1,
-0.872656, 0.5246825, -0.1639896, 1, 1, 1, 1, 1,
-0.8720115, 0.4092573, -1.526072, 1, 1, 1, 1, 1,
-0.8679067, -0.583042, -2.0791, 1, 1, 1, 1, 1,
-0.8678998, -1.358173, -3.345424, 1, 1, 1, 1, 1,
-0.867722, -0.3501484, -4.093062, 0, 0, 1, 1, 1,
-0.863773, -0.9278761, -2.933747, 1, 0, 0, 1, 1,
-0.8614831, 1.180869, 0.3517693, 1, 0, 0, 1, 1,
-0.8589726, -0.4184687, -1.695388, 1, 0, 0, 1, 1,
-0.8561714, 1.612721, -1.023555, 1, 0, 0, 1, 1,
-0.8443992, 2.071444, -0.3771105, 1, 0, 0, 1, 1,
-0.8365194, 0.700344, 0.8682853, 0, 0, 0, 1, 1,
-0.835145, 0.6176782, -0.2744995, 0, 0, 0, 1, 1,
-0.8326768, 0.1096477, -0.6267093, 0, 0, 0, 1, 1,
-0.832194, 0.7542858, 0.8033252, 0, 0, 0, 1, 1,
-0.83216, 0.7231385, -1.949873, 0, 0, 0, 1, 1,
-0.8301125, -0.4608681, -2.32744, 0, 0, 0, 1, 1,
-0.82638, 0.4614407, 0.02197035, 0, 0, 0, 1, 1,
-0.8167064, -1.627653, -1.502544, 1, 1, 1, 1, 1,
-0.8158966, 0.0872253, -1.209522, 1, 1, 1, 1, 1,
-0.8137049, 1.177664, -0.5839891, 1, 1, 1, 1, 1,
-0.8126789, -0.03917162, -0.6086195, 1, 1, 1, 1, 1,
-0.8055871, 0.09345954, -1.32017, 1, 1, 1, 1, 1,
-0.8028758, -0.7631225, -2.879689, 1, 1, 1, 1, 1,
-0.8004128, 0.3420559, -3.001242, 1, 1, 1, 1, 1,
-0.7977834, 0.3852521, -0.1374212, 1, 1, 1, 1, 1,
-0.7950352, 0.1852443, -1.352539, 1, 1, 1, 1, 1,
-0.7945685, -1.38938, -2.354502, 1, 1, 1, 1, 1,
-0.7931601, 1.101485, 1.160476, 1, 1, 1, 1, 1,
-0.7867547, 0.7677869, -0.4302284, 1, 1, 1, 1, 1,
-0.786055, -0.001509849, -0.8010663, 1, 1, 1, 1, 1,
-0.776066, -0.7841198, -1.237201, 1, 1, 1, 1, 1,
-0.7744696, 0.6628359, -0.396827, 1, 1, 1, 1, 1,
-0.7720541, 0.3924756, -1.467992, 0, 0, 1, 1, 1,
-0.7706389, 2.809246, 0.4127833, 1, 0, 0, 1, 1,
-0.7567136, -0.2436435, -0.5614557, 1, 0, 0, 1, 1,
-0.7477621, 1.032636, 0.03576177, 1, 0, 0, 1, 1,
-0.7376571, -0.5257313, -4.003487, 1, 0, 0, 1, 1,
-0.7370303, -1.522248, -2.215702, 1, 0, 0, 1, 1,
-0.7369249, -0.2908924, -2.729522, 0, 0, 0, 1, 1,
-0.7324657, -1.663715, -4.3462, 0, 0, 0, 1, 1,
-0.7307752, -1.203947, -3.229773, 0, 0, 0, 1, 1,
-0.7300581, -0.3367557, -1.703097, 0, 0, 0, 1, 1,
-0.7293035, 0.06237974, -1.033138, 0, 0, 0, 1, 1,
-0.7272335, -0.3989326, -2.48575, 0, 0, 0, 1, 1,
-0.7264455, -0.1218702, -1.307605, 0, 0, 0, 1, 1,
-0.7241022, -0.1008826, -1.355858, 1, 1, 1, 1, 1,
-0.7211682, -0.006081479, -2.176344, 1, 1, 1, 1, 1,
-0.714586, 1.074281, -1.428573, 1, 1, 1, 1, 1,
-0.7143483, 0.3987295, 0.340251, 1, 1, 1, 1, 1,
-0.7121326, -0.2436855, -2.617399, 1, 1, 1, 1, 1,
-0.7092367, -0.4505723, -1.982212, 1, 1, 1, 1, 1,
-0.707164, 1.531702, -1.803465, 1, 1, 1, 1, 1,
-0.7019711, 0.6695705, -2.698245, 1, 1, 1, 1, 1,
-0.6988873, -1.816329, -1.951709, 1, 1, 1, 1, 1,
-0.6982253, -0.608959, -0.7987242, 1, 1, 1, 1, 1,
-0.6953756, -0.5412454, -0.6140199, 1, 1, 1, 1, 1,
-0.6940028, 0.8665289, -1.212137, 1, 1, 1, 1, 1,
-0.6913446, -1.530951, -3.995106, 1, 1, 1, 1, 1,
-0.688718, -0.3574951, -2.573621, 1, 1, 1, 1, 1,
-0.6841801, -0.6096167, -2.904569, 1, 1, 1, 1, 1,
-0.6825935, -0.5270501, -1.809517, 0, 0, 1, 1, 1,
-0.681596, -0.4230027, -1.267179, 1, 0, 0, 1, 1,
-0.6814436, -0.8922586, -2.457559, 1, 0, 0, 1, 1,
-0.6809902, 2.585039, -0.01110798, 1, 0, 0, 1, 1,
-0.6807529, 0.326426, -1.391025, 1, 0, 0, 1, 1,
-0.6760029, -1.489879, -1.92779, 1, 0, 0, 1, 1,
-0.671922, -1.697943, -3.600271, 0, 0, 0, 1, 1,
-0.6696674, 0.6037033, -2.261606, 0, 0, 0, 1, 1,
-0.6641992, -0.17285, -3.956113, 0, 0, 0, 1, 1,
-0.6641927, -0.8204454, -2.689035, 0, 0, 0, 1, 1,
-0.6614389, -0.5077805, -2.346793, 0, 0, 0, 1, 1,
-0.6614351, 1.636263, 0.1581172, 0, 0, 0, 1, 1,
-0.6592805, -0.09120028, -1.185725, 0, 0, 0, 1, 1,
-0.6552578, -0.6100281, -0.4767073, 1, 1, 1, 1, 1,
-0.6526797, -0.9454556, -1.417824, 1, 1, 1, 1, 1,
-0.6517622, 0.4003786, 2.099818, 1, 1, 1, 1, 1,
-0.6466032, -0.5018198, -2.963587, 1, 1, 1, 1, 1,
-0.6453035, -3.200406, -1.696963, 1, 1, 1, 1, 1,
-0.6378235, 0.07451246, -2.237381, 1, 1, 1, 1, 1,
-0.637045, 0.0223047, -1.893937, 1, 1, 1, 1, 1,
-0.6348494, -1.887168, -1.129587, 1, 1, 1, 1, 1,
-0.6338646, 0.9631404, 0.4589699, 1, 1, 1, 1, 1,
-0.6312984, -0.4428836, -2.81447, 1, 1, 1, 1, 1,
-0.6240137, -1.017608, -1.161361, 1, 1, 1, 1, 1,
-0.6219307, 1.334679, -0.9057676, 1, 1, 1, 1, 1,
-0.6196117, 1.208237, 0.1197048, 1, 1, 1, 1, 1,
-0.6192669, 0.4763725, -0.6812041, 1, 1, 1, 1, 1,
-0.6171105, -1.358641, -1.65353, 1, 1, 1, 1, 1,
-0.6147939, -0.4518974, -3.212371, 0, 0, 1, 1, 1,
-0.614687, 1.157424, 0.2766191, 1, 0, 0, 1, 1,
-0.613847, -0.1274935, -1.951856, 1, 0, 0, 1, 1,
-0.6134482, 0.5895914, -1.525251, 1, 0, 0, 1, 1,
-0.6124136, 0.5114849, 0.4247067, 1, 0, 0, 1, 1,
-0.611889, -0.07606059, -1.406408, 1, 0, 0, 1, 1,
-0.6018762, -1.06605, -2.135589, 0, 0, 0, 1, 1,
-0.6017497, -1.271494, -4.362136, 0, 0, 0, 1, 1,
-0.6015822, 0.06159169, -0.5136028, 0, 0, 0, 1, 1,
-0.5932499, 2.036677, -0.505426, 0, 0, 0, 1, 1,
-0.5931147, 0.5095085, 0.2485815, 0, 0, 0, 1, 1,
-0.5914159, 0.8915998, -0.7902421, 0, 0, 0, 1, 1,
-0.5893246, 0.3298791, -1.019795, 0, 0, 0, 1, 1,
-0.5882774, -1.043443, -1.588149, 1, 1, 1, 1, 1,
-0.5723068, 2.040579, -0.8740206, 1, 1, 1, 1, 1,
-0.5718253, -0.03063319, -1.200308, 1, 1, 1, 1, 1,
-0.5708902, -0.7680365, -2.422285, 1, 1, 1, 1, 1,
-0.5670186, 0.1878935, 0.4698015, 1, 1, 1, 1, 1,
-0.5657694, -1.14626, -3.570834, 1, 1, 1, 1, 1,
-0.5619694, -1.341178, -1.274421, 1, 1, 1, 1, 1,
-0.5612209, 1.212211, -1.243197, 1, 1, 1, 1, 1,
-0.559873, 0.7977098, -2.129572, 1, 1, 1, 1, 1,
-0.5547779, 0.7023037, -0.2555138, 1, 1, 1, 1, 1,
-0.5525686, -1.929196, -1.583502, 1, 1, 1, 1, 1,
-0.5514371, -1.738742, -2.474943, 1, 1, 1, 1, 1,
-0.548704, 1.519209, 0.08200859, 1, 1, 1, 1, 1,
-0.5459515, 0.5628117, -3.074356, 1, 1, 1, 1, 1,
-0.542464, -0.502555, -2.025485, 1, 1, 1, 1, 1,
-0.5414785, -0.9941689, -1.863066, 0, 0, 1, 1, 1,
-0.5385349, 1.120775, 1.381124, 1, 0, 0, 1, 1,
-0.531475, -1.175499, -1.722613, 1, 0, 0, 1, 1,
-0.5258859, -1.478846, -2.705748, 1, 0, 0, 1, 1,
-0.5230154, -1.578114, -3.161433, 1, 0, 0, 1, 1,
-0.5207973, 0.4768519, -1.886322, 1, 0, 0, 1, 1,
-0.5206571, -0.6145319, -2.23588, 0, 0, 0, 1, 1,
-0.5203619, 1.865955, 0.7565467, 0, 0, 0, 1, 1,
-0.5128754, 0.8251907, -1.373995, 0, 0, 0, 1, 1,
-0.511193, 1.125131, 0.1030569, 0, 0, 0, 1, 1,
-0.5099092, -2.640309, -3.499253, 0, 0, 0, 1, 1,
-0.5088894, -1.914832, -4.133789, 0, 0, 0, 1, 1,
-0.5087091, 0.7747056, -0.9214146, 0, 0, 0, 1, 1,
-0.5065011, 0.7855237, -0.2750877, 1, 1, 1, 1, 1,
-0.505856, -1.142594, -4.21662, 1, 1, 1, 1, 1,
-0.5043194, -0.5839322, -2.028548, 1, 1, 1, 1, 1,
-0.496158, -0.6228725, -2.746771, 1, 1, 1, 1, 1,
-0.4944554, -0.5189666, -1.141503, 1, 1, 1, 1, 1,
-0.4889675, -1.5168, -5.49429, 1, 1, 1, 1, 1,
-0.4840885, 0.222823, -2.023774, 1, 1, 1, 1, 1,
-0.472057, -0.4176844, -1.228615, 1, 1, 1, 1, 1,
-0.4699275, -2.037824, -2.943956, 1, 1, 1, 1, 1,
-0.4686465, 0.9554043, -1.743585, 1, 1, 1, 1, 1,
-0.4655399, 1.240957, -0.9199639, 1, 1, 1, 1, 1,
-0.4583195, -0.6961113, -1.719768, 1, 1, 1, 1, 1,
-0.455798, 1.490585, -0.5263454, 1, 1, 1, 1, 1,
-0.4538827, 0.2910298, -1.250276, 1, 1, 1, 1, 1,
-0.4500562, 0.6174167, -1.113398, 1, 1, 1, 1, 1,
-0.4478185, 0.08185102, -1.280844, 0, 0, 1, 1, 1,
-0.4471651, 0.4802894, -0.6370063, 1, 0, 0, 1, 1,
-0.4468595, -2.002189, -2.862237, 1, 0, 0, 1, 1,
-0.4460752, -1.083821, -4.074352, 1, 0, 0, 1, 1,
-0.4457713, -1.817409, -3.362969, 1, 0, 0, 1, 1,
-0.435942, 0.2648914, -0.8363391, 1, 0, 0, 1, 1,
-0.4341459, -0.6658105, -0.916487, 0, 0, 0, 1, 1,
-0.4305635, -0.5768296, -0.861427, 0, 0, 0, 1, 1,
-0.4277719, 0.1990112, -1.168893, 0, 0, 0, 1, 1,
-0.4231226, -0.7697036, -2.178947, 0, 0, 0, 1, 1,
-0.4166241, -1.037601, -3.789863, 0, 0, 0, 1, 1,
-0.4163806, -0.1766223, -1.948705, 0, 0, 0, 1, 1,
-0.4155366, 0.03413037, -1.877808, 0, 0, 0, 1, 1,
-0.414251, 1.235897, -0.4587468, 1, 1, 1, 1, 1,
-0.4142072, 1.405893, 0.5145398, 1, 1, 1, 1, 1,
-0.4127256, -0.9985572, -4.903271, 1, 1, 1, 1, 1,
-0.4121084, -0.2938706, -2.212004, 1, 1, 1, 1, 1,
-0.410801, 1.261112, -0.8505133, 1, 1, 1, 1, 1,
-0.4075229, 0.4439975, 0.7007369, 1, 1, 1, 1, 1,
-0.4073964, -0.2164986, -2.685171, 1, 1, 1, 1, 1,
-0.4063379, 0.9461201, 0.1596287, 1, 1, 1, 1, 1,
-0.4053428, -1.35786, -2.257227, 1, 1, 1, 1, 1,
-0.4035734, 0.5503682, -1.271982, 1, 1, 1, 1, 1,
-0.3991678, 0.6924982, -1.386376, 1, 1, 1, 1, 1,
-0.3985671, -0.2299373, -4.117985, 1, 1, 1, 1, 1,
-0.3984306, -0.6142586, -0.6863454, 1, 1, 1, 1, 1,
-0.3976994, 1.208461, 0.6226237, 1, 1, 1, 1, 1,
-0.3976895, -0.7287713, -1.834957, 1, 1, 1, 1, 1,
-0.3948926, 0.103536, -0.7191666, 0, 0, 1, 1, 1,
-0.3869685, -0.5476817, -1.751302, 1, 0, 0, 1, 1,
-0.3819302, 0.07169572, -0.5157738, 1, 0, 0, 1, 1,
-0.38112, 0.5946561, -0.9977656, 1, 0, 0, 1, 1,
-0.3794822, 1.325976, -1.515572, 1, 0, 0, 1, 1,
-0.3761647, -0.7244517, -3.157394, 1, 0, 0, 1, 1,
-0.3694011, 2.219941, -1.331778, 0, 0, 0, 1, 1,
-0.3675927, -0.01309054, -2.158491, 0, 0, 0, 1, 1,
-0.3669508, 0.5017586, -2.832127, 0, 0, 0, 1, 1,
-0.3622118, -1.257783, -2.601414, 0, 0, 0, 1, 1,
-0.3604226, -0.2996623, -1.889132, 0, 0, 0, 1, 1,
-0.3529963, -1.527786, -1.957885, 0, 0, 0, 1, 1,
-0.3523357, -0.4122949, -1.634742, 0, 0, 0, 1, 1,
-0.3501053, 1.010247, -0.5201181, 1, 1, 1, 1, 1,
-0.3456745, 1.568722, 0.1725937, 1, 1, 1, 1, 1,
-0.3443563, -0.7423248, -2.307723, 1, 1, 1, 1, 1,
-0.3402581, -1.800293, -3.625701, 1, 1, 1, 1, 1,
-0.331181, 0.04281176, -1.822367, 1, 1, 1, 1, 1,
-0.3292646, 0.2300885, -1.163631, 1, 1, 1, 1, 1,
-0.3232682, 0.8746476, -0.4974641, 1, 1, 1, 1, 1,
-0.3224609, -0.2281398, -2.438462, 1, 1, 1, 1, 1,
-0.3184863, 0.09688319, -1.540523, 1, 1, 1, 1, 1,
-0.3167897, -1.775116, -2.019027, 1, 1, 1, 1, 1,
-0.3139453, 0.9348165, 0.2493258, 1, 1, 1, 1, 1,
-0.3106499, 1.654365, -0.5607859, 1, 1, 1, 1, 1,
-0.3088687, -0.7052592, -1.027221, 1, 1, 1, 1, 1,
-0.3017292, 0.6628129, 1.177595, 1, 1, 1, 1, 1,
-0.2995768, -1.097938, -3.37883, 1, 1, 1, 1, 1,
-0.2955353, 0.05811092, -0.1859927, 0, 0, 1, 1, 1,
-0.2953741, 1.035096, -0.6763943, 1, 0, 0, 1, 1,
-0.294311, 0.3521313, 1.552239, 1, 0, 0, 1, 1,
-0.294275, 0.2606553, -0.8673766, 1, 0, 0, 1, 1,
-0.2935446, 1.666896, 0.6537302, 1, 0, 0, 1, 1,
-0.2923558, 0.7020649, -0.8480458, 1, 0, 0, 1, 1,
-0.2916498, 0.7439979, -0.8813763, 0, 0, 0, 1, 1,
-0.2874352, -0.1460597, -1.780144, 0, 0, 0, 1, 1,
-0.2864245, 1.221285, -0.2628399, 0, 0, 0, 1, 1,
-0.2852344, 0.7252037, -2.065712, 0, 0, 0, 1, 1,
-0.2818647, -0.4678584, -1.460059, 0, 0, 0, 1, 1,
-0.2799895, -0.4065342, -4.09266, 0, 0, 0, 1, 1,
-0.2797602, -0.02804435, -2.161837, 0, 0, 0, 1, 1,
-0.2778358, 0.2669063, -0.005897694, 1, 1, 1, 1, 1,
-0.2769184, 0.4293999, -0.3739592, 1, 1, 1, 1, 1,
-0.2758098, 0.3595904, -0.6708097, 1, 1, 1, 1, 1,
-0.2720582, -0.3628685, -2.7096, 1, 1, 1, 1, 1,
-0.2687516, -1.137495, -2.951745, 1, 1, 1, 1, 1,
-0.2647747, 1.326457, 1.89299, 1, 1, 1, 1, 1,
-0.2618468, -1.157346, -2.934959, 1, 1, 1, 1, 1,
-0.2584904, -1.513709, -3.151834, 1, 1, 1, 1, 1,
-0.2556989, -1.516351, -3.753818, 1, 1, 1, 1, 1,
-0.2537914, -1.223004, -3.139859, 1, 1, 1, 1, 1,
-0.2526893, 0.3201511, -0.1005089, 1, 1, 1, 1, 1,
-0.2522763, 0.4548003, -1.217401, 1, 1, 1, 1, 1,
-0.2517915, -0.7577355, -4.091754, 1, 1, 1, 1, 1,
-0.2513039, 0.4517984, -0.6933244, 1, 1, 1, 1, 1,
-0.2446272, -0.5865898, -1.502624, 1, 1, 1, 1, 1,
-0.2443107, 0.2171575, -0.7886709, 0, 0, 1, 1, 1,
-0.2410574, -1.775161, -3.771615, 1, 0, 0, 1, 1,
-0.2377551, -0.5832113, -2.80379, 1, 0, 0, 1, 1,
-0.2372586, -0.9792103, -2.812177, 1, 0, 0, 1, 1,
-0.2370003, 0.05469475, -0.5810594, 1, 0, 0, 1, 1,
-0.2355001, 1.680241, 0.09013183, 1, 0, 0, 1, 1,
-0.2335237, -0.3651823, -2.462255, 0, 0, 0, 1, 1,
-0.2325098, -1.817309, -3.700235, 0, 0, 0, 1, 1,
-0.230546, -0.3238696, -3.020957, 0, 0, 0, 1, 1,
-0.2292326, 0.5448006, -1.891849, 0, 0, 0, 1, 1,
-0.2283679, 1.224229, 0.692786, 0, 0, 0, 1, 1,
-0.2283079, -2.507458, -3.932173, 0, 0, 0, 1, 1,
-0.2250094, 1.07801, 0.6549066, 0, 0, 0, 1, 1,
-0.2237507, -0.1414289, -1.760945, 1, 1, 1, 1, 1,
-0.2132012, 0.09210137, 0.7099455, 1, 1, 1, 1, 1,
-0.2121391, -0.3995478, -2.827231, 1, 1, 1, 1, 1,
-0.2117931, 0.06571475, -1.770409, 1, 1, 1, 1, 1,
-0.2098188, 0.07291821, 0.2280563, 1, 1, 1, 1, 1,
-0.2075702, -1.283707, -3.650311, 1, 1, 1, 1, 1,
-0.2050319, 1.47579, 0.2671393, 1, 1, 1, 1, 1,
-0.2042532, -0.01248309, -0.7397917, 1, 1, 1, 1, 1,
-0.2035249, 1.10183, 1.568237, 1, 1, 1, 1, 1,
-0.2021992, -0.4968426, -1.860789, 1, 1, 1, 1, 1,
-0.1997646, 0.09276407, -1.672782, 1, 1, 1, 1, 1,
-0.1917904, -0.9377143, -2.957576, 1, 1, 1, 1, 1,
-0.1883247, 1.105492, -0.07001583, 1, 1, 1, 1, 1,
-0.1874886, -1.295066, -3.509343, 1, 1, 1, 1, 1,
-0.1874866, -0.9014627, -3.372416, 1, 1, 1, 1, 1,
-0.1865893, -1.926481, -0.5792288, 0, 0, 1, 1, 1,
-0.1860059, 0.3973028, -1.177872, 1, 0, 0, 1, 1,
-0.1818547, -0.6866361, -1.29064, 1, 0, 0, 1, 1,
-0.1663697, 0.9644988, -0.2320925, 1, 0, 0, 1, 1,
-0.1657671, -0.1589395, -2.33041, 1, 0, 0, 1, 1,
-0.162238, 1.206084, 0.4723695, 1, 0, 0, 1, 1,
-0.1543923, 0.7096452, 0.1458889, 0, 0, 0, 1, 1,
-0.1497133, -0.1037835, -1.983045, 0, 0, 0, 1, 1,
-0.1474835, 0.4000027, -0.7640768, 0, 0, 0, 1, 1,
-0.1463714, -0.3053999, -3.958194, 0, 0, 0, 1, 1,
-0.1456386, 1.017226, -0.306683, 0, 0, 0, 1, 1,
-0.1445798, 0.08970408, -1.362098, 0, 0, 0, 1, 1,
-0.1443444, 0.7842731, -0.3492597, 0, 0, 0, 1, 1,
-0.1429278, 0.6474952, -0.002924931, 1, 1, 1, 1, 1,
-0.141245, -1.190788, -2.74628, 1, 1, 1, 1, 1,
-0.1404749, 0.7387924, 0.009274533, 1, 1, 1, 1, 1,
-0.1351492, -0.2955226, -4.308895, 1, 1, 1, 1, 1,
-0.1351454, -1.416006, -5.224538, 1, 1, 1, 1, 1,
-0.1288171, 2.163503, -0.7371942, 1, 1, 1, 1, 1,
-0.1242362, 0.2058546, -1.198967, 1, 1, 1, 1, 1,
-0.1209757, 1.567942, 0.338689, 1, 1, 1, 1, 1,
-0.1209195, -0.4044913, -3.820123, 1, 1, 1, 1, 1,
-0.1204052, -0.141876, -2.320445, 1, 1, 1, 1, 1,
-0.11881, 1.069434, 0.1143157, 1, 1, 1, 1, 1,
-0.1143241, -2.036635, -3.963085, 1, 1, 1, 1, 1,
-0.1133613, 1.131564, 0.3522866, 1, 1, 1, 1, 1,
-0.1107405, 0.3502093, -0.9659995, 1, 1, 1, 1, 1,
-0.1081829, -0.05368732, -2.342523, 1, 1, 1, 1, 1,
-0.1043399, -1.089795, -3.238662, 0, 0, 1, 1, 1,
-0.09730604, 2.68054, 2.123289, 1, 0, 0, 1, 1,
-0.09545532, 0.19503, -1.239786, 1, 0, 0, 1, 1,
-0.09404983, 0.05561514, -1.170493, 1, 0, 0, 1, 1,
-0.09101541, -0.6107267, -3.143965, 1, 0, 0, 1, 1,
-0.08584183, -0.4318051, -5.188303, 1, 0, 0, 1, 1,
-0.08440037, -1.825349, -2.066273, 0, 0, 0, 1, 1,
-0.08415161, 0.02185222, -2.748411, 0, 0, 0, 1, 1,
-0.0780136, -0.4438866, -4.051728, 0, 0, 0, 1, 1,
-0.07375841, 1.179603, 0.2018764, 0, 0, 0, 1, 1,
-0.07303736, 1.666213, 0.1448647, 0, 0, 0, 1, 1,
-0.07250236, -0.7287074, -4.834517, 0, 0, 0, 1, 1,
-0.0622056, 2.316006, -0.3392974, 0, 0, 0, 1, 1,
-0.05919597, -0.5785615, -2.423537, 1, 1, 1, 1, 1,
-0.05147992, 0.2352953, -0.9398861, 1, 1, 1, 1, 1,
-0.05005116, -0.02561279, -2.515438, 1, 1, 1, 1, 1,
-0.04573942, -1.290884, -2.528591, 1, 1, 1, 1, 1,
-0.04564078, 0.3838241, 0.3778501, 1, 1, 1, 1, 1,
-0.04102382, -0.3585924, -0.5983295, 1, 1, 1, 1, 1,
-0.04055345, -0.6405066, -2.656861, 1, 1, 1, 1, 1,
-0.03888313, -1.932032, -2.950385, 1, 1, 1, 1, 1,
-0.03851165, -0.02978923, -2.058446, 1, 1, 1, 1, 1,
-0.03263741, 1.98802, -2.584712, 1, 1, 1, 1, 1,
-0.02820092, -0.1194001, -1.883724, 1, 1, 1, 1, 1,
-0.02795933, -1.70248, -4.171217, 1, 1, 1, 1, 1,
-0.02736903, -0.6706632, -3.885971, 1, 1, 1, 1, 1,
-0.02521846, 0.9663864, 0.3825428, 1, 1, 1, 1, 1,
-0.02497757, -1.552758, -2.948895, 1, 1, 1, 1, 1,
-0.02353369, 1.462405, 0.4913402, 0, 0, 1, 1, 1,
-0.018449, 0.8916411, -0.4169282, 1, 0, 0, 1, 1,
-0.01777825, -0.3350631, -1.766551, 1, 0, 0, 1, 1,
-0.01422713, -0.5231643, -3.579449, 1, 0, 0, 1, 1,
-0.01399189, 0.0491029, 0.02610934, 1, 0, 0, 1, 1,
-0.009489687, -0.6670104, -2.397804, 1, 0, 0, 1, 1,
-0.004594981, -0.04016813, -2.730947, 0, 0, 0, 1, 1,
-0.001743698, -0.8680741, -2.901407, 0, 0, 0, 1, 1,
-0.001572205, 0.0009748382, 0.3612098, 0, 0, 0, 1, 1,
0.0003266037, -1.685804, 4.015482, 0, 0, 0, 1, 1,
0.0008142127, 0.7785569, -0.2179921, 0, 0, 0, 1, 1,
0.000857103, 1.643261, 0.4674566, 0, 0, 0, 1, 1,
0.002827599, -0.1814129, 3.057616, 0, 0, 0, 1, 1,
0.004747241, 0.711372, 0.9442956, 1, 1, 1, 1, 1,
0.005632199, -0.6504575, 4.190824, 1, 1, 1, 1, 1,
0.007282359, -1.640847, 2.599766, 1, 1, 1, 1, 1,
0.01287274, -0.7522998, 3.043966, 1, 1, 1, 1, 1,
0.01366402, -0.3929334, 2.662001, 1, 1, 1, 1, 1,
0.01674704, 0.2262581, -0.3317218, 1, 1, 1, 1, 1,
0.01956731, -0.1441328, 3.029554, 1, 1, 1, 1, 1,
0.02306591, -1.676692, 3.201184, 1, 1, 1, 1, 1,
0.02717747, -0.2367815, 3.102714, 1, 1, 1, 1, 1,
0.03059821, -0.904883, 3.710633, 1, 1, 1, 1, 1,
0.03085737, -1.847273, 2.368602, 1, 1, 1, 1, 1,
0.03161598, -1.322562, 4.818472, 1, 1, 1, 1, 1,
0.03680602, -0.9179268, 2.892361, 1, 1, 1, 1, 1,
0.03736125, 0.3999176, 0.3157064, 1, 1, 1, 1, 1,
0.0433965, -0.6969971, 1.86805, 1, 1, 1, 1, 1,
0.0457011, 0.3466817, -1.959879, 0, 0, 1, 1, 1,
0.04684855, -1.904202, 3.335228, 1, 0, 0, 1, 1,
0.05000532, -0.6359171, 3.083182, 1, 0, 0, 1, 1,
0.05294234, -0.3282236, 2.158145, 1, 0, 0, 1, 1,
0.05319285, 0.8677755, -0.8828301, 1, 0, 0, 1, 1,
0.05789324, 1.371291, 0.3104056, 1, 0, 0, 1, 1,
0.06417699, -0.01196742, 2.750737, 0, 0, 0, 1, 1,
0.06807959, -1.170189, 3.437076, 0, 0, 0, 1, 1,
0.06829492, 1.563738, 1.21344, 0, 0, 0, 1, 1,
0.06964534, 1.645366, -0.5896659, 0, 0, 0, 1, 1,
0.07213154, -0.2747569, 2.669222, 0, 0, 0, 1, 1,
0.08150092, 0.9317155, 0.3138185, 0, 0, 0, 1, 1,
0.08566996, 0.6215944, 0.5989604, 0, 0, 0, 1, 1,
0.08597625, -1.608358, 4.14013, 1, 1, 1, 1, 1,
0.08845513, -1.908084, 1.109575, 1, 1, 1, 1, 1,
0.09084645, 0.7613499, 0.2327442, 1, 1, 1, 1, 1,
0.09647219, -1.330129, 3.523386, 1, 1, 1, 1, 1,
0.09787846, -1.828695, 2.96686, 1, 1, 1, 1, 1,
0.09933962, 0.4070086, 0.3034884, 1, 1, 1, 1, 1,
0.1031644, -0.1578405, 2.787389, 1, 1, 1, 1, 1,
0.1104221, 0.7146868, 1.225247, 1, 1, 1, 1, 1,
0.1170149, 0.7190592, -0.06804993, 1, 1, 1, 1, 1,
0.1170874, 0.1421225, 0.8352792, 1, 1, 1, 1, 1,
0.1202163, 2.513663, -0.9320565, 1, 1, 1, 1, 1,
0.123704, 0.8282051, 0.04524209, 1, 1, 1, 1, 1,
0.1305073, -1.201411, 3.813086, 1, 1, 1, 1, 1,
0.1341245, -0.01646047, 0.06782149, 1, 1, 1, 1, 1,
0.1352548, 0.167505, 1.203476, 1, 1, 1, 1, 1,
0.1359957, -1.051709, 5.069406, 0, 0, 1, 1, 1,
0.1366852, 0.7123775, 0.5800154, 1, 0, 0, 1, 1,
0.1384407, 0.1275265, 0.0363696, 1, 0, 0, 1, 1,
0.1464542, 0.9120367, 0.1261782, 1, 0, 0, 1, 1,
0.1477628, -0.01907058, 1.135395, 1, 0, 0, 1, 1,
0.1499766, 0.4413843, 0.5088212, 1, 0, 0, 1, 1,
0.15043, 0.4282658, -2.341094, 0, 0, 0, 1, 1,
0.1508562, 1.411282, 1.869012, 0, 0, 0, 1, 1,
0.1596615, 1.363544, -0.5102047, 0, 0, 0, 1, 1,
0.1630808, -0.768657, 4.05964, 0, 0, 0, 1, 1,
0.1632392, 1.175697, 0.5858606, 0, 0, 0, 1, 1,
0.1637698, 1.139785, -0.815771, 0, 0, 0, 1, 1,
0.1640249, 0.01874411, 2.903502, 0, 0, 0, 1, 1,
0.1647594, -0.4698501, 3.0557, 1, 1, 1, 1, 1,
0.1687645, 1.148325, 0.6819856, 1, 1, 1, 1, 1,
0.1725845, 0.5330988, -1.177044, 1, 1, 1, 1, 1,
0.1803745, 0.9194436, -0.5677003, 1, 1, 1, 1, 1,
0.1806628, -1.373679, 2.176393, 1, 1, 1, 1, 1,
0.1808721, -0.09746629, 3.542412, 1, 1, 1, 1, 1,
0.1826252, 1.201358, 0.4403168, 1, 1, 1, 1, 1,
0.1827958, 0.8053675, -0.2077677, 1, 1, 1, 1, 1,
0.1831902, 0.8177718, -1.122952, 1, 1, 1, 1, 1,
0.1839651, 2.040452, 0.5727007, 1, 1, 1, 1, 1,
0.1862675, 1.606745, 1.297688, 1, 1, 1, 1, 1,
0.1883714, 0.5571894, 0.4593376, 1, 1, 1, 1, 1,
0.1912289, -0.5464959, 2.453868, 1, 1, 1, 1, 1,
0.1916253, -0.9974073, 3.628112, 1, 1, 1, 1, 1,
0.1957562, 0.2368282, 1.507563, 1, 1, 1, 1, 1,
0.1968091, 0.5304297, -0.2159181, 0, 0, 1, 1, 1,
0.2018832, 0.1618482, 0.7697967, 1, 0, 0, 1, 1,
0.2061899, 2.002438, 0.09029312, 1, 0, 0, 1, 1,
0.2072574, 0.5951616, 1.537804, 1, 0, 0, 1, 1,
0.209575, 1.273041, -0.464621, 1, 0, 0, 1, 1,
0.2104202, -1.676186, 4.001998, 1, 0, 0, 1, 1,
0.2106843, 0.8921963, 1.716301, 0, 0, 0, 1, 1,
0.2128368, -0.1723629, 3.251322, 0, 0, 0, 1, 1,
0.2151679, 2.340065, -0.3959821, 0, 0, 0, 1, 1,
0.2168122, 0.4128573, 1.270465, 0, 0, 0, 1, 1,
0.2169542, 0.9620157, 1.220415, 0, 0, 0, 1, 1,
0.2185937, -1.133237, 2.886927, 0, 0, 0, 1, 1,
0.225071, -0.5036259, 0.3474032, 0, 0, 0, 1, 1,
0.2254623, 0.9859083, -0.434923, 1, 1, 1, 1, 1,
0.2280918, 0.8950505, 0.1403344, 1, 1, 1, 1, 1,
0.2296871, -0.6184313, 1.590861, 1, 1, 1, 1, 1,
0.2326377, 0.9104047, 0.7222338, 1, 1, 1, 1, 1,
0.2331505, -0.4166706, 3.009591, 1, 1, 1, 1, 1,
0.2334289, 0.05377097, 0.7840129, 1, 1, 1, 1, 1,
0.235039, 0.4767993, -0.5831555, 1, 1, 1, 1, 1,
0.2351895, 0.3025924, 0.7633724, 1, 1, 1, 1, 1,
0.237151, 0.502042, -0.9810613, 1, 1, 1, 1, 1,
0.2385861, -1.000728, 1.799652, 1, 1, 1, 1, 1,
0.2465596, -1.862478, 0.3310754, 1, 1, 1, 1, 1,
0.2625314, -1.231108, 3.375232, 1, 1, 1, 1, 1,
0.2664173, -1.107539, 2.127025, 1, 1, 1, 1, 1,
0.2708413, -0.7778103, 3.161994, 1, 1, 1, 1, 1,
0.2751879, -0.4446989, 4.151876, 1, 1, 1, 1, 1,
0.276318, -0.4048611, 4.705172, 0, 0, 1, 1, 1,
0.2763229, -0.2454324, 3.066876, 1, 0, 0, 1, 1,
0.2813349, -0.4447176, 2.232377, 1, 0, 0, 1, 1,
0.2855601, 1.569025, 0.5435094, 1, 0, 0, 1, 1,
0.2901913, 2.727763, 1.026687, 1, 0, 0, 1, 1,
0.2926067, -0.2358322, 1.871684, 1, 0, 0, 1, 1,
0.2939504, -0.3444723, 1.804547, 0, 0, 0, 1, 1,
0.2944972, 0.2749262, 0.4232517, 0, 0, 0, 1, 1,
0.2982659, -0.6202142, 4.039608, 0, 0, 0, 1, 1,
0.3052857, 2.562028, 0.3958907, 0, 0, 0, 1, 1,
0.3061411, 0.747083, 1.025945, 0, 0, 0, 1, 1,
0.3104198, 1.401052, 1.324005, 0, 0, 0, 1, 1,
0.3123283, -0.346683, 2.817208, 0, 0, 0, 1, 1,
0.3140965, 0.476283, 1.545284, 1, 1, 1, 1, 1,
0.3171438, -0.2663622, 2.159225, 1, 1, 1, 1, 1,
0.3186829, 0.1125781, 0.7552048, 1, 1, 1, 1, 1,
0.3209484, -1.110905, 3.256119, 1, 1, 1, 1, 1,
0.3226503, -0.5889562, 2.807164, 1, 1, 1, 1, 1,
0.323224, -0.9110021, 3.623373, 1, 1, 1, 1, 1,
0.3324606, -0.1228737, 1.722746, 1, 1, 1, 1, 1,
0.3341969, -0.3012481, -0.3271676, 1, 1, 1, 1, 1,
0.3378927, -1.29986, 5.631268, 1, 1, 1, 1, 1,
0.347472, -0.9850734, 3.428385, 1, 1, 1, 1, 1,
0.3475592, -1.182984, 1.883064, 1, 1, 1, 1, 1,
0.3478131, 0.6406161, -2.104948, 1, 1, 1, 1, 1,
0.353574, -1.058326, 1.655833, 1, 1, 1, 1, 1,
0.355986, 1.49072, -0.1019451, 1, 1, 1, 1, 1,
0.3571978, -1.051621, 1.830351, 1, 1, 1, 1, 1,
0.3582637, 2.224187, 1.594294, 0, 0, 1, 1, 1,
0.3600588, -0.01310841, 2.127954, 1, 0, 0, 1, 1,
0.3623136, 1.051004, 0.5163987, 1, 0, 0, 1, 1,
0.3664708, 0.009262932, 1.904678, 1, 0, 0, 1, 1,
0.3678549, -0.6591666, 2.747627, 1, 0, 0, 1, 1,
0.3708492, -0.2849804, 4.270215, 1, 0, 0, 1, 1,
0.3715001, -0.8996432, 3.362144, 0, 0, 0, 1, 1,
0.3775142, 0.4044193, -0.4129441, 0, 0, 0, 1, 1,
0.3775792, -0.8972651, 2.457922, 0, 0, 0, 1, 1,
0.3802755, 0.4540958, 1.55334, 0, 0, 0, 1, 1,
0.3825961, -2.083837, 3.341172, 0, 0, 0, 1, 1,
0.3838636, -0.7499714, 2.669624, 0, 0, 0, 1, 1,
0.3840438, -0.3708701, 3.428213, 0, 0, 0, 1, 1,
0.389265, -0.6962911, 2.723431, 1, 1, 1, 1, 1,
0.3895722, -1.764404, 2.011613, 1, 1, 1, 1, 1,
0.390445, -1.533549, 2.657552, 1, 1, 1, 1, 1,
0.3924536, -0.07955708, 2.561194, 1, 1, 1, 1, 1,
0.3926916, -1.114379, 2.490445, 1, 1, 1, 1, 1,
0.3943683, -0.138321, 3.72673, 1, 1, 1, 1, 1,
0.3972262, -0.4085929, 3.59991, 1, 1, 1, 1, 1,
0.3977041, 1.883558, -0.001950383, 1, 1, 1, 1, 1,
0.3990109, 0.8813023, 0.5081812, 1, 1, 1, 1, 1,
0.3998716, -0.2198518, 0.6992453, 1, 1, 1, 1, 1,
0.4020218, -0.2845879, 3.20074, 1, 1, 1, 1, 1,
0.4022853, 0.1129546, 2.004913, 1, 1, 1, 1, 1,
0.404354, 0.2134294, 1.527524, 1, 1, 1, 1, 1,
0.4081462, 1.400835, 0.3709064, 1, 1, 1, 1, 1,
0.417706, -0.9246059, 2.367406, 1, 1, 1, 1, 1,
0.4199899, -0.2603981, 2.045964, 0, 0, 1, 1, 1,
0.4209199, -0.2370182, 3.788435, 1, 0, 0, 1, 1,
0.424186, -0.5187383, -0.02613764, 1, 0, 0, 1, 1,
0.4247503, 2.173211, 1.650005, 1, 0, 0, 1, 1,
0.4280812, -0.7829158, 1.595947, 1, 0, 0, 1, 1,
0.4298113, 0.5918118, -0.02252375, 1, 0, 0, 1, 1,
0.4315158, 1.123364, -1.064791, 0, 0, 0, 1, 1,
0.4358035, 0.7440736, 0.1607596, 0, 0, 0, 1, 1,
0.4390018, -0.7346979, 2.663919, 0, 0, 0, 1, 1,
0.4407927, 0.4015116, 1.723643, 0, 0, 0, 1, 1,
0.4489586, -0.5965738, 5.263576, 0, 0, 0, 1, 1,
0.4531488, 2.494748, 1.359716, 0, 0, 0, 1, 1,
0.4563698, 1.093002, -1.292442, 0, 0, 0, 1, 1,
0.4647228, 1.935732, -0.3745658, 1, 1, 1, 1, 1,
0.4649961, 0.6876323, 1.199811, 1, 1, 1, 1, 1,
0.466801, 1.00167, 0.5540907, 1, 1, 1, 1, 1,
0.4685887, -0.5553048, 2.392265, 1, 1, 1, 1, 1,
0.469817, -1.231065, 3.575718, 1, 1, 1, 1, 1,
0.4733724, -1.699189, 3.588004, 1, 1, 1, 1, 1,
0.4741209, -0.9748907, 4.138971, 1, 1, 1, 1, 1,
0.4800956, 0.1904451, 0.8972543, 1, 1, 1, 1, 1,
0.4945182, -1.151844, 2.258659, 1, 1, 1, 1, 1,
0.4953973, -1.305097, 1.561065, 1, 1, 1, 1, 1,
0.4984248, -0.4178355, 2.538655, 1, 1, 1, 1, 1,
0.5006167, 0.6108144, -0.4180343, 1, 1, 1, 1, 1,
0.5006958, -0.5570088, 2.925456, 1, 1, 1, 1, 1,
0.5021933, 0.5832975, 0.8590911, 1, 1, 1, 1, 1,
0.505787, -0.1124752, 1.313049, 1, 1, 1, 1, 1,
0.5085192, -0.3170307, 1.448683, 0, 0, 1, 1, 1,
0.5101973, 0.7266413, 2.399376, 1, 0, 0, 1, 1,
0.5215276, -1.244176, 2.462634, 1, 0, 0, 1, 1,
0.5220276, 0.4813969, -0.0927453, 1, 0, 0, 1, 1,
0.5327346, -2.197604, -0.2676663, 1, 0, 0, 1, 1,
0.5348446, 0.6628284, -0.2918371, 1, 0, 0, 1, 1,
0.5365564, 1.290202, 1.217303, 0, 0, 0, 1, 1,
0.5478814, 1.079495, 0.5668951, 0, 0, 0, 1, 1,
0.5480698, 0.9342206, 2.854592, 0, 0, 0, 1, 1,
0.5498425, -1.91844, 2.0439, 0, 0, 0, 1, 1,
0.555686, -0.08555743, 2.57966, 0, 0, 0, 1, 1,
0.5602294, 0.1415117, 2.346489, 0, 0, 0, 1, 1,
0.5608397, -1.97747, 1.647332, 0, 0, 0, 1, 1,
0.5643833, 0.1335949, 0.7065759, 1, 1, 1, 1, 1,
0.5645837, 0.2750369, 2.488356, 1, 1, 1, 1, 1,
0.5668004, -1.076208, 4.160578, 1, 1, 1, 1, 1,
0.5712402, 0.1341084, 0.03580173, 1, 1, 1, 1, 1,
0.5745695, -1.993071, 3.146986, 1, 1, 1, 1, 1,
0.5804568, 0.8585578, 0.9934979, 1, 1, 1, 1, 1,
0.586748, 0.08881959, 1.810434, 1, 1, 1, 1, 1,
0.5878253, -1.254298, 3.099399, 1, 1, 1, 1, 1,
0.5930527, 0.6583581, -1.165837, 1, 1, 1, 1, 1,
0.5957571, -0.879775, 0.7111039, 1, 1, 1, 1, 1,
0.5994255, -1.329898, 1.448673, 1, 1, 1, 1, 1,
0.6002935, 1.196454, -0.8877315, 1, 1, 1, 1, 1,
0.6166754, 0.4450695, 1.476826, 1, 1, 1, 1, 1,
0.617498, 1.684053, 0.654671, 1, 1, 1, 1, 1,
0.6232771, 0.09583686, 1.898301, 1, 1, 1, 1, 1,
0.6288682, -0.5652074, 0.9299908, 0, 0, 1, 1, 1,
0.6331312, -0.373846, 1.662775, 1, 0, 0, 1, 1,
0.6344509, -0.8885908, 2.812988, 1, 0, 0, 1, 1,
0.6373071, 0.9628938, 0.9966605, 1, 0, 0, 1, 1,
0.63916, 0.1393333, 0.3199987, 1, 0, 0, 1, 1,
0.6412799, 1.038666, -0.2106111, 1, 0, 0, 1, 1,
0.6466703, 1.792095, 0.5478342, 0, 0, 0, 1, 1,
0.6486365, 0.3905116, 0.7156402, 0, 0, 0, 1, 1,
0.6499017, 0.2824451, -0.2702783, 0, 0, 0, 1, 1,
0.6531884, 0.7897894, 1.20875, 0, 0, 0, 1, 1,
0.6546662, 2.107545, -2.420644, 0, 0, 0, 1, 1,
0.6547596, 0.02961214, 3.242903, 0, 0, 0, 1, 1,
0.6618177, -0.4283374, 1.042161, 0, 0, 0, 1, 1,
0.6730632, 0.1309847, -0.03020739, 1, 1, 1, 1, 1,
0.6764106, -0.3660885, 3.339287, 1, 1, 1, 1, 1,
0.6769318, -0.9036071, 2.286156, 1, 1, 1, 1, 1,
0.6814602, -0.04529781, 0.7005087, 1, 1, 1, 1, 1,
0.6853335, 0.8809558, 2.522839, 1, 1, 1, 1, 1,
0.6860732, 1.598814, 0.8662694, 1, 1, 1, 1, 1,
0.6873062, -0.1088075, 1.958184, 1, 1, 1, 1, 1,
0.6876007, 0.9955753, 1.786705, 1, 1, 1, 1, 1,
0.6884347, 2.050329, 1.062861, 1, 1, 1, 1, 1,
0.6908866, 0.5870807, 0.6973878, 1, 1, 1, 1, 1,
0.6921948, 0.2133936, 1.820736, 1, 1, 1, 1, 1,
0.6955308, 1.260894, -1.004319, 1, 1, 1, 1, 1,
0.6980945, 0.3581033, 1.300336, 1, 1, 1, 1, 1,
0.7019602, -1.569335, 3.178936, 1, 1, 1, 1, 1,
0.7072022, -0.8388435, 2.744503, 1, 1, 1, 1, 1,
0.7082122, -1.367627, 2.715059, 0, 0, 1, 1, 1,
0.7083958, -0.9263893, 1.327632, 1, 0, 0, 1, 1,
0.7143679, -0.1383733, 2.237481, 1, 0, 0, 1, 1,
0.718049, -0.894022, 2.557461, 1, 0, 0, 1, 1,
0.7187505, -0.8983479, 3.537145, 1, 0, 0, 1, 1,
0.720731, -1.200392, 2.133724, 1, 0, 0, 1, 1,
0.7216157, 0.5793211, 0.6919742, 0, 0, 0, 1, 1,
0.723987, 0.1312473, 0.7353589, 0, 0, 0, 1, 1,
0.7252522, 0.1562011, 1.523604, 0, 0, 0, 1, 1,
0.7331749, -0.7498474, 2.388093, 0, 0, 0, 1, 1,
0.7412999, -0.6702308, 3.028311, 0, 0, 0, 1, 1,
0.7468867, -0.9716729, 2.072831, 0, 0, 0, 1, 1,
0.7495152, 0.03693035, 1.742444, 0, 0, 0, 1, 1,
0.7552577, -1.582189, 2.643661, 1, 1, 1, 1, 1,
0.7566184, 0.2585818, 2.500452, 1, 1, 1, 1, 1,
0.7601634, -0.1856061, 1.598778, 1, 1, 1, 1, 1,
0.767453, 1.69868, 1.700188, 1, 1, 1, 1, 1,
0.7743766, 0.3296886, 2.39292, 1, 1, 1, 1, 1,
0.7753899, -1.195258, 1.350346, 1, 1, 1, 1, 1,
0.77919, 1.275271, -0.36182, 1, 1, 1, 1, 1,
0.7803825, -0.4266658, 3.022758, 1, 1, 1, 1, 1,
0.7809187, -0.07743205, 1.169075, 1, 1, 1, 1, 1,
0.7892067, 0.2051392, 1.167275, 1, 1, 1, 1, 1,
0.7959704, -0.4257188, 3.56312, 1, 1, 1, 1, 1,
0.7971423, 1.985207, 1.744429, 1, 1, 1, 1, 1,
0.8040746, -1.279813, 4.221744, 1, 1, 1, 1, 1,
0.8045058, -0.4843442, 2.576176, 1, 1, 1, 1, 1,
0.8063464, 1.061324, -0.4265974, 1, 1, 1, 1, 1,
0.8075284, -0.2648143, 1.903817, 0, 0, 1, 1, 1,
0.818696, -0.789091, 2.252452, 1, 0, 0, 1, 1,
0.819402, -0.6850063, 1.687392, 1, 0, 0, 1, 1,
0.8235667, 0.0153517, 0.6797367, 1, 0, 0, 1, 1,
0.8265679, -1.208733, 4.665715, 1, 0, 0, 1, 1,
0.829069, 0.1655512, 0.6345465, 1, 0, 0, 1, 1,
0.8296372, -1.038173, 1.492863, 0, 0, 0, 1, 1,
0.8298682, 1.229807, 0.6430876, 0, 0, 0, 1, 1,
0.8305745, 0.5905322, 1.734864, 0, 0, 0, 1, 1,
0.8316236, 0.677212, 1.009213, 0, 0, 0, 1, 1,
0.8349254, 1.153966, 0.625843, 0, 0, 0, 1, 1,
0.8364936, 0.6062375, 2.250068, 0, 0, 0, 1, 1,
0.8366032, 0.8544102, -0.4360549, 0, 0, 0, 1, 1,
0.842517, 0.4978673, -0.03482182, 1, 1, 1, 1, 1,
0.8428421, -0.4296562, 2.246929, 1, 1, 1, 1, 1,
0.84782, 0.522213, 2.449404, 1, 1, 1, 1, 1,
0.8484555, -0.6744358, 3.176797, 1, 1, 1, 1, 1,
0.8505078, 0.03703066, 1.575656, 1, 1, 1, 1, 1,
0.8510737, 0.4673032, -0.1656746, 1, 1, 1, 1, 1,
0.854638, 0.6951283, 0.9332626, 1, 1, 1, 1, 1,
0.8562213, 1.137094, 3.266877, 1, 1, 1, 1, 1,
0.864116, -0.690208, 2.539269, 1, 1, 1, 1, 1,
0.869094, -1.558861, 3.260154, 1, 1, 1, 1, 1,
0.872452, 0.2583677, 1.741939, 1, 1, 1, 1, 1,
0.8726147, -1.151528, 1.203161, 1, 1, 1, 1, 1,
0.8752716, -0.1930381, 0.9354895, 1, 1, 1, 1, 1,
0.8763438, -1.759402, 3.161372, 1, 1, 1, 1, 1,
0.8826951, 0.2761131, 0.9049872, 1, 1, 1, 1, 1,
0.8836595, 0.3183255, 0.9054236, 0, 0, 1, 1, 1,
0.884571, -0.8226396, 2.376987, 1, 0, 0, 1, 1,
0.884975, 1.739958, -0.4223108, 1, 0, 0, 1, 1,
0.8878545, -0.3894043, 0.9260119, 1, 0, 0, 1, 1,
0.9084563, 0.2988131, 1.477409, 1, 0, 0, 1, 1,
0.9096563, 0.9261665, -0.3294505, 1, 0, 0, 1, 1,
0.9107094, -0.7020047, 2.846181, 0, 0, 0, 1, 1,
0.9155216, 0.2761592, 2.292503, 0, 0, 0, 1, 1,
0.9256034, 1.492788, -0.4486906, 0, 0, 0, 1, 1,
0.9379351, -0.1381718, 1.410455, 0, 0, 0, 1, 1,
0.9385667, -0.3128778, 2.154701, 0, 0, 0, 1, 1,
0.9419442, -0.1410053, 0.05379525, 0, 0, 0, 1, 1,
0.9472567, 0.9699045, 0.8110722, 0, 0, 0, 1, 1,
0.9495487, 1.395296, 1.102663, 1, 1, 1, 1, 1,
0.9515846, 0.6044307, 1.425127, 1, 1, 1, 1, 1,
0.9545115, -0.3491561, 0.09822014, 1, 1, 1, 1, 1,
0.9595571, -1.000329, 2.213194, 1, 1, 1, 1, 1,
0.9782903, 0.3056548, 2.118686, 1, 1, 1, 1, 1,
0.9791995, 1.567266, 0.7075405, 1, 1, 1, 1, 1,
0.9799399, -2.149599, 3.910547, 1, 1, 1, 1, 1,
0.9831951, 1.596798, 1.483925, 1, 1, 1, 1, 1,
0.98685, 0.4520333, -0.3332549, 1, 1, 1, 1, 1,
0.992608, -0.1885154, 1.144204, 1, 1, 1, 1, 1,
0.9945444, -0.9289331, 2.03178, 1, 1, 1, 1, 1,
0.9959187, -1.450006, 3.782204, 1, 1, 1, 1, 1,
1.004647, 0.6609285, 0.3895336, 1, 1, 1, 1, 1,
1.011067, 0.703169, -0.08045534, 1, 1, 1, 1, 1,
1.01124, 1.484856, 0.2739085, 1, 1, 1, 1, 1,
1.014934, 1.156154, 1.14893, 0, 0, 1, 1, 1,
1.016144, -1.36485, 2.631307, 1, 0, 0, 1, 1,
1.016651, -0.2184627, 3.165802, 1, 0, 0, 1, 1,
1.017863, -0.1482728, 0.398574, 1, 0, 0, 1, 1,
1.034268, -0.115429, 1.867365, 1, 0, 0, 1, 1,
1.03519, -0.6835781, 2.486756, 1, 0, 0, 1, 1,
1.040886, 0.7894133, 0.3934719, 0, 0, 0, 1, 1,
1.047667, -1.397675, 1.492315, 0, 0, 0, 1, 1,
1.04773, -0.3318729, 1.048982, 0, 0, 0, 1, 1,
1.051311, 1.214745, 0.4636988, 0, 0, 0, 1, 1,
1.061254, -2.265806, 1.135162, 0, 0, 0, 1, 1,
1.081977, 1.005623, 0.9409588, 0, 0, 0, 1, 1,
1.086692, -0.2680312, 2.440932, 0, 0, 0, 1, 1,
1.087104, 2.318458, 1.06451, 1, 1, 1, 1, 1,
1.092579, -0.2723896, 2.003953, 1, 1, 1, 1, 1,
1.095442, 0.5758541, 2.137363, 1, 1, 1, 1, 1,
1.100522, 0.4635899, 2.701202, 1, 1, 1, 1, 1,
1.100523, 0.7419525, 0.7647192, 1, 1, 1, 1, 1,
1.100564, -0.7841873, 1.479106, 1, 1, 1, 1, 1,
1.106267, 0.1596271, 2.779121, 1, 1, 1, 1, 1,
1.110076, -0.8515604, 1.74209, 1, 1, 1, 1, 1,
1.132764, -0.6899002, 2.123601, 1, 1, 1, 1, 1,
1.132836, 1.776547, 2.372096, 1, 1, 1, 1, 1,
1.144589, 0.01730568, 2.609192, 1, 1, 1, 1, 1,
1.149408, 0.5607128, 1.567946, 1, 1, 1, 1, 1,
1.1507, 0.825552, 1.972375, 1, 1, 1, 1, 1,
1.151798, -0.9073876, 3.073549, 1, 1, 1, 1, 1,
1.151886, 0.3885002, 0.3527364, 1, 1, 1, 1, 1,
1.153964, 0.7532094, 1.11145, 0, 0, 1, 1, 1,
1.163007, 0.5253872, 2.445553, 1, 0, 0, 1, 1,
1.176675, -0.4355899, 2.584484, 1, 0, 0, 1, 1,
1.17769, -0.1856228, 1.871859, 1, 0, 0, 1, 1,
1.188232, 1.17433, 0.634519, 1, 0, 0, 1, 1,
1.192041, 0.02327354, 1.549336, 1, 0, 0, 1, 1,
1.195729, 1.848341, 2.350174, 0, 0, 0, 1, 1,
1.20141, 0.01264856, 1.267106, 0, 0, 0, 1, 1,
1.20228, -0.569413, 1.566589, 0, 0, 0, 1, 1,
1.21535, -0.8708752, 1.910111, 0, 0, 0, 1, 1,
1.221705, -0.744727, 2.193683, 0, 0, 0, 1, 1,
1.224808, 1.013396, 1.16103, 0, 0, 0, 1, 1,
1.225171, 0.2064195, 0.3953436, 0, 0, 0, 1, 1,
1.229802, -1.227787, 2.458405, 1, 1, 1, 1, 1,
1.234171, 0.7827791, -0.1563993, 1, 1, 1, 1, 1,
1.242371, 0.446648, 4.202888, 1, 1, 1, 1, 1,
1.242466, 1.621587, -0.100855, 1, 1, 1, 1, 1,
1.243238, -0.5740532, 0.4945074, 1, 1, 1, 1, 1,
1.253043, 0.967204, 2.474702, 1, 1, 1, 1, 1,
1.278977, -0.3886001, 2.186069, 1, 1, 1, 1, 1,
1.284408, 1.328584, 1.014298, 1, 1, 1, 1, 1,
1.284629, -1.308856, 1.773424, 1, 1, 1, 1, 1,
1.288013, -0.5853724, 1.763397, 1, 1, 1, 1, 1,
1.288859, 1.240676, 0.5878631, 1, 1, 1, 1, 1,
1.290434, -1.133252, 4.018511, 1, 1, 1, 1, 1,
1.293937, -1.465397, 3.475027, 1, 1, 1, 1, 1,
1.296621, -1.104584, 3.853372, 1, 1, 1, 1, 1,
1.299608, 1.214105, 0.4075336, 1, 1, 1, 1, 1,
1.299812, -0.9591597, 3.597225, 0, 0, 1, 1, 1,
1.306806, 0.7717197, -0.7008037, 1, 0, 0, 1, 1,
1.308433, 1.109006, 0.8202614, 1, 0, 0, 1, 1,
1.322511, 1.805239, 2.57262, 1, 0, 0, 1, 1,
1.329586, -0.4529891, 0.3551076, 1, 0, 0, 1, 1,
1.331356, -0.3212439, 1.000024, 1, 0, 0, 1, 1,
1.33209, -0.7186053, 3.039379, 0, 0, 0, 1, 1,
1.335586, 0.7508152, 0.4922805, 0, 0, 0, 1, 1,
1.33732, -0.6849831, 1.493841, 0, 0, 0, 1, 1,
1.339429, -0.004970096, 0.2119917, 0, 0, 0, 1, 1,
1.344168, 0.2102575, 1.516999, 0, 0, 0, 1, 1,
1.344754, -1.19844, 1.711435, 0, 0, 0, 1, 1,
1.34595, 0.05583803, 1.153109, 0, 0, 0, 1, 1,
1.349742, 0.7223564, 1.397915, 1, 1, 1, 1, 1,
1.357412, 0.979188, 1.459886, 1, 1, 1, 1, 1,
1.358855, 0.2973322, 0.5540959, 1, 1, 1, 1, 1,
1.362121, -0.842942, 2.794796, 1, 1, 1, 1, 1,
1.387238, -0.484217, 2.106771, 1, 1, 1, 1, 1,
1.433031, 0.9581502, 1.732035, 1, 1, 1, 1, 1,
1.433343, -0.146368, 0.1983986, 1, 1, 1, 1, 1,
1.439277, -0.0009451113, 1.72525, 1, 1, 1, 1, 1,
1.439301, 2.351088, -1.08204, 1, 1, 1, 1, 1,
1.443748, -0.7627258, 1.470703, 1, 1, 1, 1, 1,
1.443923, -2.139762, 2.786682, 1, 1, 1, 1, 1,
1.446324, 1.45954, 0.2319887, 1, 1, 1, 1, 1,
1.463559, 0.4013056, 0.2098511, 1, 1, 1, 1, 1,
1.463823, 0.02330375, 0.4510708, 1, 1, 1, 1, 1,
1.465032, 1.144082, 2.138943, 1, 1, 1, 1, 1,
1.466833, -0.701794, 1.600968, 0, 0, 1, 1, 1,
1.473717, 0.09518488, 1.936671, 1, 0, 0, 1, 1,
1.479546, -0.4624204, 2.728642, 1, 0, 0, 1, 1,
1.483134, -1.090243, 1.719484, 1, 0, 0, 1, 1,
1.487257, -0.8330218, 1.265484, 1, 0, 0, 1, 1,
1.495659, -0.0608226, 0.9141272, 1, 0, 0, 1, 1,
1.499688, 0.09762856, 1.29344, 0, 0, 0, 1, 1,
1.513609, -0.735711, 2.709996, 0, 0, 0, 1, 1,
1.513878, 0.3362412, 0.9676742, 0, 0, 0, 1, 1,
1.523072, 1.117254, 1.07889, 0, 0, 0, 1, 1,
1.524921, 0.9261028, 1.269964, 0, 0, 0, 1, 1,
1.539003, 0.1097696, 0.2135558, 0, 0, 0, 1, 1,
1.540442, 0.4196485, 1.68922, 0, 0, 0, 1, 1,
1.553525, -1.42729, 3.440778, 1, 1, 1, 1, 1,
1.561703, -0.5577967, 0.7378106, 1, 1, 1, 1, 1,
1.566073, -1.417128, 2.039726, 1, 1, 1, 1, 1,
1.583915, -1.177592, 2.373261, 1, 1, 1, 1, 1,
1.593902, -0.535304, 2.551273, 1, 1, 1, 1, 1,
1.600652, 0.5121332, 1.47072, 1, 1, 1, 1, 1,
1.616054, 0.6113114, 0.132238, 1, 1, 1, 1, 1,
1.62257, -0.05399661, 3.778736, 1, 1, 1, 1, 1,
1.624068, 0.420723, 0.8501602, 1, 1, 1, 1, 1,
1.632321, -0.01578674, 2.925198, 1, 1, 1, 1, 1,
1.641155, 0.542004, 2.800035, 1, 1, 1, 1, 1,
1.641977, 0.03653818, 4.350694, 1, 1, 1, 1, 1,
1.652213, -1.875642, 3.029723, 1, 1, 1, 1, 1,
1.663356, 0.5375122, -0.2397262, 1, 1, 1, 1, 1,
1.66717, 0.622253, 0.4660628, 1, 1, 1, 1, 1,
1.675546, 0.6741556, 1.299141, 0, 0, 1, 1, 1,
1.695929, 0.8571848, 0.1880371, 1, 0, 0, 1, 1,
1.696548, 0.3500089, 1.598475, 1, 0, 0, 1, 1,
1.706209, -0.1620999, 1.553322, 1, 0, 0, 1, 1,
1.709036, 1.084621, 0.8926863, 1, 0, 0, 1, 1,
1.73896, 0.666962, 2.701457, 1, 0, 0, 1, 1,
1.740862, 1.549022, 0.07950738, 0, 0, 0, 1, 1,
1.749903, 0.237223, 0.7861145, 0, 0, 0, 1, 1,
1.750182, -1.441637, 2.961065, 0, 0, 0, 1, 1,
1.763407, 1.543189, 1.030135, 0, 0, 0, 1, 1,
1.771621, 0.1018973, 3.653561, 0, 0, 0, 1, 1,
1.793661, -1.334584, 2.699847, 0, 0, 0, 1, 1,
1.796729, 0.4089043, -0.84883, 0, 0, 0, 1, 1,
1.819713, -2.287329, 4.01652, 1, 1, 1, 1, 1,
1.828211, -1.37858, 3.22451, 1, 1, 1, 1, 1,
1.863865, -0.7860996, 1.400957, 1, 1, 1, 1, 1,
1.922077, -0.03545508, 1.245925, 1, 1, 1, 1, 1,
1.923167, 0.637499, 2.312624, 1, 1, 1, 1, 1,
1.937999, 0.06806309, 1.231414, 1, 1, 1, 1, 1,
1.955824, -0.2215609, 0.9414806, 1, 1, 1, 1, 1,
1.960927, 0.2503771, 1.476919, 1, 1, 1, 1, 1,
1.971655, -0.9845223, 2.242341, 1, 1, 1, 1, 1,
2.010988, -0.5290935, 2.047439, 1, 1, 1, 1, 1,
2.012237, -0.3803533, 1.99452, 1, 1, 1, 1, 1,
2.012478, -0.3653343, -0.0483464, 1, 1, 1, 1, 1,
2.045417, -1.629432, 1.129253, 1, 1, 1, 1, 1,
2.088353, 0.2551419, 0.9496368, 1, 1, 1, 1, 1,
2.089274, -0.2308945, 2.816985, 1, 1, 1, 1, 1,
2.090878, 0.7461043, 1.083053, 0, 0, 1, 1, 1,
2.0931, -1.081764, 1.688142, 1, 0, 0, 1, 1,
2.131179, 1.551018, 0.7179946, 1, 0, 0, 1, 1,
2.144901, 0.8407466, 2.245188, 1, 0, 0, 1, 1,
2.150799, 0.5212297, 2.024631, 1, 0, 0, 1, 1,
2.184431, 0.9443837, 0.7010503, 1, 0, 0, 1, 1,
2.215604, 0.002831113, 0.7847259, 0, 0, 0, 1, 1,
2.222198, -0.3640931, 0.1473177, 0, 0, 0, 1, 1,
2.250607, -0.6889871, 2.979624, 0, 0, 0, 1, 1,
2.261815, 1.318834, 1.500005, 0, 0, 0, 1, 1,
2.280878, -0.4442981, 1.366063, 0, 0, 0, 1, 1,
2.331424, -0.2886655, 1.076932, 0, 0, 0, 1, 1,
2.343459, -1.791916, 3.336914, 0, 0, 0, 1, 1,
2.346567, 0.2723361, 1.580892, 1, 1, 1, 1, 1,
2.349311, -1.585514, 2.210726, 1, 1, 1, 1, 1,
2.376527, 0.1192148, 1.686714, 1, 1, 1, 1, 1,
2.422509, 1.001858, 0.1137343, 1, 1, 1, 1, 1,
2.424098, 0.8089378, 2.331966, 1, 1, 1, 1, 1,
2.441539, 0.07546709, 2.671479, 1, 1, 1, 1, 1,
2.578578, 1.067768, 1.146104, 1, 1, 1, 1, 1
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
var radius = 9.567592;
var distance = 33.60576;
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
mvMatrix.translate( 0.4439094, 0.1696858, -0.0567112 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.60576);
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