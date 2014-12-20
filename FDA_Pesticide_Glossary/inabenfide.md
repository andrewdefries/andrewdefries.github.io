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
-3.354455, -0.08122286, 0.3852839, 1, 0, 0, 1,
-3.115127, -2.006227, -2.559645, 1, 0.007843138, 0, 1,
-3.011421, 0.238759, -1.782357, 1, 0.01176471, 0, 1,
-2.714281, 1.852457, -2.408613, 1, 0.01960784, 0, 1,
-2.673244, 0.9294083, -0.1428036, 1, 0.02352941, 0, 1,
-2.391143, -1.295356, -1.768236, 1, 0.03137255, 0, 1,
-2.381477, 0.7973517, -1.599978, 1, 0.03529412, 0, 1,
-2.326684, 0.9187631, -1.455382, 1, 0.04313726, 0, 1,
-2.295742, -1.11037, 0.2640494, 1, 0.04705882, 0, 1,
-2.265294, -1.495488, -1.821281, 1, 0.05490196, 0, 1,
-2.226735, 0.06775957, -1.409391, 1, 0.05882353, 0, 1,
-2.153235, -0.1117558, -1.360928, 1, 0.06666667, 0, 1,
-2.137905, -0.09587275, -1.269724, 1, 0.07058824, 0, 1,
-2.068022, -1.218973, -3.105494, 1, 0.07843138, 0, 1,
-2.051121, 0.1345953, -1.711007, 1, 0.08235294, 0, 1,
-2.035457, -0.3100195, -1.637503, 1, 0.09019608, 0, 1,
-2.03094, 0.1024524, -2.013131, 1, 0.09411765, 0, 1,
-1.996289, -1.634977, -2.635759, 1, 0.1019608, 0, 1,
-1.989481, -2.015777, -2.630629, 1, 0.1098039, 0, 1,
-1.979362, 0.05203283, 0.06470881, 1, 0.1137255, 0, 1,
-1.97917, 0.5645408, -1.109033, 1, 0.1215686, 0, 1,
-1.969922, 1.239855, 1.000255, 1, 0.1254902, 0, 1,
-1.95722, -0.84024, -1.58421, 1, 0.1333333, 0, 1,
-1.948152, -0.3745493, -1.61192, 1, 0.1372549, 0, 1,
-1.936531, 0.9880808, -0.01121887, 1, 0.145098, 0, 1,
-1.922782, -0.5030336, -3.397923, 1, 0.1490196, 0, 1,
-1.922151, 1.223151, -1.103456, 1, 0.1568628, 0, 1,
-1.909721, -0.1435715, -0.1148001, 1, 0.1607843, 0, 1,
-1.896713, 1.441088, -1.109145, 1, 0.1686275, 0, 1,
-1.862711, 0.8163916, -1.417205, 1, 0.172549, 0, 1,
-1.862239, 0.1598594, -1.309926, 1, 0.1803922, 0, 1,
-1.858114, 0.1286556, -1.837358, 1, 0.1843137, 0, 1,
-1.849051, 0.6400362, 0.2271157, 1, 0.1921569, 0, 1,
-1.845378, 0.5192994, 0.7189056, 1, 0.1960784, 0, 1,
-1.774166, 0.1023227, -3.149232, 1, 0.2039216, 0, 1,
-1.746725, -0.1096921, -1.898538, 1, 0.2117647, 0, 1,
-1.744546, 0.3270331, -1.800804, 1, 0.2156863, 0, 1,
-1.730274, -0.06696668, -3.009027, 1, 0.2235294, 0, 1,
-1.715813, 0.9118446, -1.280074, 1, 0.227451, 0, 1,
-1.713024, -0.2211006, -2.584164, 1, 0.2352941, 0, 1,
-1.707248, 0.6036175, -1.688863, 1, 0.2392157, 0, 1,
-1.693393, 1.77978, -1.496909, 1, 0.2470588, 0, 1,
-1.691979, 1.812034, 1.122507, 1, 0.2509804, 0, 1,
-1.691797, -0.6302915, -0.2852831, 1, 0.2588235, 0, 1,
-1.686598, 0.6955001, -0.6283941, 1, 0.2627451, 0, 1,
-1.674463, -0.739693, -2.239545, 1, 0.2705882, 0, 1,
-1.666047, -0.9101504, -1.532602, 1, 0.2745098, 0, 1,
-1.656731, -1.07322, -2.952306, 1, 0.282353, 0, 1,
-1.652827, 1.111184, -0.07916252, 1, 0.2862745, 0, 1,
-1.649921, -0.7710113, -2.261841, 1, 0.2941177, 0, 1,
-1.643494, -0.4864378, -2.261251, 1, 0.3019608, 0, 1,
-1.621388, 0.8355929, -0.6293439, 1, 0.3058824, 0, 1,
-1.600061, -0.7997835, -1.303846, 1, 0.3137255, 0, 1,
-1.599916, 0.08905568, -2.483807, 1, 0.3176471, 0, 1,
-1.582324, -2.244667, -4.484594, 1, 0.3254902, 0, 1,
-1.574584, 0.1681751, -1.17626, 1, 0.3294118, 0, 1,
-1.56831, -1.529652, -2.791742, 1, 0.3372549, 0, 1,
-1.553641, 0.1724425, -0.2836133, 1, 0.3411765, 0, 1,
-1.552942, 0.001359805, -0.8643232, 1, 0.3490196, 0, 1,
-1.535291, 1.075776, -0.2020915, 1, 0.3529412, 0, 1,
-1.530544, 1.195699, -2.000115, 1, 0.3607843, 0, 1,
-1.527895, -0.7758991, -2.087429, 1, 0.3647059, 0, 1,
-1.520523, 2.032953, -2.495226, 1, 0.372549, 0, 1,
-1.520039, -0.2931507, -1.048456, 1, 0.3764706, 0, 1,
-1.515514, 0.4030231, -1.256703, 1, 0.3843137, 0, 1,
-1.502525, 0.03013336, -1.698064, 1, 0.3882353, 0, 1,
-1.495969, -0.3654853, -1.58127, 1, 0.3960784, 0, 1,
-1.492344, -1.656366, -3.207624, 1, 0.4039216, 0, 1,
-1.485263, -0.6568949, -3.036948, 1, 0.4078431, 0, 1,
-1.481357, -0.2884932, -1.973859, 1, 0.4156863, 0, 1,
-1.47696, -0.3976448, -1.910598, 1, 0.4196078, 0, 1,
-1.475344, -1.569785, -4.727198, 1, 0.427451, 0, 1,
-1.474239, 1.268874, -0.2668464, 1, 0.4313726, 0, 1,
-1.47387, -0.1199591, -2.266044, 1, 0.4392157, 0, 1,
-1.471932, 0.9811404, 1.895288, 1, 0.4431373, 0, 1,
-1.466196, -0.7610537, -1.30125, 1, 0.4509804, 0, 1,
-1.461159, 1.375064, -1.206936, 1, 0.454902, 0, 1,
-1.457824, -1.122236, -2.210044, 1, 0.4627451, 0, 1,
-1.449872, -0.8543817, -1.196222, 1, 0.4666667, 0, 1,
-1.437409, 0.459503, -1.291197, 1, 0.4745098, 0, 1,
-1.433986, -0.1151678, -3.061926, 1, 0.4784314, 0, 1,
-1.43081, -0.863736, -1.113276, 1, 0.4862745, 0, 1,
-1.424957, 1.432609, -0.09088163, 1, 0.4901961, 0, 1,
-1.420361, 1.135284, -0.8240798, 1, 0.4980392, 0, 1,
-1.405716, 1.539992, -1.380293, 1, 0.5058824, 0, 1,
-1.403958, 0.0629888, -0.6009405, 1, 0.509804, 0, 1,
-1.395994, 0.2422125, -2.235733, 1, 0.5176471, 0, 1,
-1.369364, -0.4789631, -3.025454, 1, 0.5215687, 0, 1,
-1.354415, -0.9032835, -2.220551, 1, 0.5294118, 0, 1,
-1.350436, -1.564201, -2.719795, 1, 0.5333334, 0, 1,
-1.347083, 0.1127448, -0.5607307, 1, 0.5411765, 0, 1,
-1.346193, -1.156464, -2.06062, 1, 0.5450981, 0, 1,
-1.344757, -0.7058542, -2.672875, 1, 0.5529412, 0, 1,
-1.342522, 0.7517565, 0.170127, 1, 0.5568628, 0, 1,
-1.338283, 0.4094057, -2.559707, 1, 0.5647059, 0, 1,
-1.31859, -1.310391, -2.195195, 1, 0.5686275, 0, 1,
-1.311494, -1.409089, -1.525144, 1, 0.5764706, 0, 1,
-1.30091, -0.3284069, -1.188683, 1, 0.5803922, 0, 1,
-1.299859, -1.724682, -3.305426, 1, 0.5882353, 0, 1,
-1.297649, 0.9921416, -0.6219873, 1, 0.5921569, 0, 1,
-1.289992, 0.4059311, -0.2442424, 1, 0.6, 0, 1,
-1.278709, -0.3556218, -1.954592, 1, 0.6078432, 0, 1,
-1.275357, 1.120934, 0.006693758, 1, 0.6117647, 0, 1,
-1.274251, -1.304363, -2.08281, 1, 0.6196079, 0, 1,
-1.271072, -2.697531, -2.018581, 1, 0.6235294, 0, 1,
-1.259073, -1.440747, -3.937959, 1, 0.6313726, 0, 1,
-1.256664, 0.09069627, -1.999118, 1, 0.6352941, 0, 1,
-1.255195, 0.2707427, -2.030371, 1, 0.6431373, 0, 1,
-1.255013, -0.05356203, -2.079448, 1, 0.6470588, 0, 1,
-1.243413, -0.7428848, -0.3891289, 1, 0.654902, 0, 1,
-1.241474, -1.006129, -1.464979, 1, 0.6588235, 0, 1,
-1.239853, -1.238273, -2.109473, 1, 0.6666667, 0, 1,
-1.237212, 1.186861, -0.6557307, 1, 0.6705883, 0, 1,
-1.225515, 1.338597, -1.107802, 1, 0.6784314, 0, 1,
-1.219696, -0.8772367, -2.734894, 1, 0.682353, 0, 1,
-1.204566, 0.4563264, -1.814352, 1, 0.6901961, 0, 1,
-1.190878, -0.4928703, -0.8764837, 1, 0.6941177, 0, 1,
-1.177804, -1.218755, -3.734807, 1, 0.7019608, 0, 1,
-1.171951, 0.757939, -2.047756, 1, 0.7098039, 0, 1,
-1.171367, -0.8291863, -1.902856, 1, 0.7137255, 0, 1,
-1.162187, 0.4941568, -1.477218, 1, 0.7215686, 0, 1,
-1.147557, -0.3730288, -3.522776, 1, 0.7254902, 0, 1,
-1.14618, 0.7433426, -0.5897154, 1, 0.7333333, 0, 1,
-1.142266, -1.891994, -1.49103, 1, 0.7372549, 0, 1,
-1.133814, 0.683137, -0.844057, 1, 0.7450981, 0, 1,
-1.130468, -1.843554, -2.758553, 1, 0.7490196, 0, 1,
-1.123791, -0.2345008, -1.83001, 1, 0.7568628, 0, 1,
-1.118541, 0.1768562, -2.886788, 1, 0.7607843, 0, 1,
-1.115652, -1.862435, -3.252075, 1, 0.7686275, 0, 1,
-1.11536, -0.8906052, -3.581424, 1, 0.772549, 0, 1,
-1.112056, -1.067462, -2.131927, 1, 0.7803922, 0, 1,
-1.111605, 0.6096163, -2.692706, 1, 0.7843137, 0, 1,
-1.107531, 0.7044092, -0.005738961, 1, 0.7921569, 0, 1,
-1.106976, -0.5106986, -0.7294948, 1, 0.7960784, 0, 1,
-1.106272, -0.6935847, -1.775129, 1, 0.8039216, 0, 1,
-1.10332, -0.7096093, -0.8109964, 1, 0.8117647, 0, 1,
-1.102707, 0.6714363, -2.627766, 1, 0.8156863, 0, 1,
-1.093409, -0.7944587, -0.580911, 1, 0.8235294, 0, 1,
-1.085112, 1.312683, 0.6664139, 1, 0.827451, 0, 1,
-1.071615, -0.2001558, -2.308244, 1, 0.8352941, 0, 1,
-1.065792, -0.1541954, -3.309861, 1, 0.8392157, 0, 1,
-1.061193, 0.7678968, 0.1047176, 1, 0.8470588, 0, 1,
-1.060036, -1.022122, -1.585721, 1, 0.8509804, 0, 1,
-1.056694, -1.020369, -1.796527, 1, 0.8588235, 0, 1,
-1.049759, -0.6456783, -1.904752, 1, 0.8627451, 0, 1,
-1.027217, 3.095495, -1.146411, 1, 0.8705882, 0, 1,
-1.025119, -0.1782374, 0.09807307, 1, 0.8745098, 0, 1,
-1.017218, -1.17719, -2.628732, 1, 0.8823529, 0, 1,
-1.015462, 0.03258329, -1.554732, 1, 0.8862745, 0, 1,
-1.0139, -1.032412, -0.9841517, 1, 0.8941177, 0, 1,
-1.012591, -0.5710602, -0.9748937, 1, 0.8980392, 0, 1,
-1.008664, -0.3559742, -0.6912795, 1, 0.9058824, 0, 1,
-1.002328, -0.8511013, -4.103053, 1, 0.9137255, 0, 1,
-1.001875, -0.0736986, -1.575759, 1, 0.9176471, 0, 1,
-1.001607, -0.8725495, -2.8808, 1, 0.9254902, 0, 1,
-1.001582, 0.4578372, -1.613717, 1, 0.9294118, 0, 1,
-0.9950124, 0.3398533, -1.401025, 1, 0.9372549, 0, 1,
-0.9948047, 0.505482, -1.058171, 1, 0.9411765, 0, 1,
-0.9933451, -0.4369376, -0.7720324, 1, 0.9490196, 0, 1,
-0.9906166, -0.7581261, -3.496601, 1, 0.9529412, 0, 1,
-0.9890683, -0.5213308, -4.058227, 1, 0.9607843, 0, 1,
-0.9830168, 0.4470727, -0.2509339, 1, 0.9647059, 0, 1,
-0.9795707, -1.325073, -1.182898, 1, 0.972549, 0, 1,
-0.9789671, 1.6225, -1.941246, 1, 0.9764706, 0, 1,
-0.9754006, 1.130817, -2.523482, 1, 0.9843137, 0, 1,
-0.9722447, 0.01897494, -0.8400844, 1, 0.9882353, 0, 1,
-0.9703305, 0.590713, -1.835639, 1, 0.9960784, 0, 1,
-0.9560689, 0.3821218, -1.496644, 0.9960784, 1, 0, 1,
-0.951125, 0.727269, 0.4804512, 0.9921569, 1, 0, 1,
-0.9476239, 1.331854, -1.705998, 0.9843137, 1, 0, 1,
-0.9427738, 0.6422421, -0.02178172, 0.9803922, 1, 0, 1,
-0.9359825, 0.636697, -0.5504696, 0.972549, 1, 0, 1,
-0.9265399, -1.164286, -3.200563, 0.9686275, 1, 0, 1,
-0.924957, 0.1339853, -1.984021, 0.9607843, 1, 0, 1,
-0.9221408, 0.2856838, -0.9053999, 0.9568627, 1, 0, 1,
-0.9213562, 2.197538, -0.1944062, 0.9490196, 1, 0, 1,
-0.9155174, 0.7246636, -2.155212, 0.945098, 1, 0, 1,
-0.9137883, 0.2523831, 0.7737939, 0.9372549, 1, 0, 1,
-0.9122223, -1.424144, -2.083876, 0.9333333, 1, 0, 1,
-0.910955, -0.1634322, -2.25069, 0.9254902, 1, 0, 1,
-0.90862, -0.2137668, -3.274065, 0.9215686, 1, 0, 1,
-0.9044149, 0.01025735, -1.991751, 0.9137255, 1, 0, 1,
-0.904323, 1.740174, 0.1224733, 0.9098039, 1, 0, 1,
-0.9012676, 1.482237, 0.6792023, 0.9019608, 1, 0, 1,
-0.8994867, 1.840222, -2.318261, 0.8941177, 1, 0, 1,
-0.8993653, -0.9341224, -2.658853, 0.8901961, 1, 0, 1,
-0.8948576, -0.3518058, -1.125223, 0.8823529, 1, 0, 1,
-0.8928164, 0.2079071, -1.831549, 0.8784314, 1, 0, 1,
-0.8854787, 0.5301499, -0.223968, 0.8705882, 1, 0, 1,
-0.8817933, -0.5141305, -2.33, 0.8666667, 1, 0, 1,
-0.8813615, -1.199689, -2.902409, 0.8588235, 1, 0, 1,
-0.8806485, -0.3403497, -1.899595, 0.854902, 1, 0, 1,
-0.8793518, -0.4237654, -1.672958, 0.8470588, 1, 0, 1,
-0.8773755, -1.305162, -2.295927, 0.8431373, 1, 0, 1,
-0.8744301, -0.0533761, -3.048764, 0.8352941, 1, 0, 1,
-0.8718873, -1.295169, -2.512228, 0.8313726, 1, 0, 1,
-0.8713984, 0.4904889, -1.777302, 0.8235294, 1, 0, 1,
-0.863978, 0.6193608, -2.220419, 0.8196079, 1, 0, 1,
-0.8593433, 1.299893, -1.021497, 0.8117647, 1, 0, 1,
-0.8593431, -0.08445161, -4.01674, 0.8078431, 1, 0, 1,
-0.858696, 0.3080642, -2.029381, 0.8, 1, 0, 1,
-0.858444, 0.687208, 0.264708, 0.7921569, 1, 0, 1,
-0.8459046, 0.1842063, -2.595009, 0.7882353, 1, 0, 1,
-0.8428841, 0.9962213, 1.173387, 0.7803922, 1, 0, 1,
-0.8398611, -1.784335, -2.800907, 0.7764706, 1, 0, 1,
-0.839459, 2.753852, -0.1079352, 0.7686275, 1, 0, 1,
-0.8379419, 2.286191, -0.5094426, 0.7647059, 1, 0, 1,
-0.8360738, 2.768231, -0.6653759, 0.7568628, 1, 0, 1,
-0.8358098, -0.2574058, -0.2306442, 0.7529412, 1, 0, 1,
-0.8322408, 1.859621, -2.592149, 0.7450981, 1, 0, 1,
-0.8275661, 0.8623428, -0.1153884, 0.7411765, 1, 0, 1,
-0.8251275, -0.5232217, -2.600573, 0.7333333, 1, 0, 1,
-0.8238512, 1.511267, -0.4280248, 0.7294118, 1, 0, 1,
-0.8210822, -1.03876, -2.386271, 0.7215686, 1, 0, 1,
-0.8112462, 0.1595592, -1.283777, 0.7176471, 1, 0, 1,
-0.8066866, 1.891875, -0.6806926, 0.7098039, 1, 0, 1,
-0.7978444, -2.082176, -2.73574, 0.7058824, 1, 0, 1,
-0.792586, 0.1197077, -1.143109, 0.6980392, 1, 0, 1,
-0.7885309, 1.791274, -0.8548137, 0.6901961, 1, 0, 1,
-0.7852295, -0.4946296, -1.406044, 0.6862745, 1, 0, 1,
-0.7778656, -1.660023, -1.653774, 0.6784314, 1, 0, 1,
-0.7685443, 0.6965258, 0.1140051, 0.6745098, 1, 0, 1,
-0.7674475, -1.071956, -2.016877, 0.6666667, 1, 0, 1,
-0.7617841, 0.5981086, -0.3318082, 0.6627451, 1, 0, 1,
-0.7599777, 0.8275638, -2.831505, 0.654902, 1, 0, 1,
-0.7599655, -0.0358172, -0.5239006, 0.6509804, 1, 0, 1,
-0.7553023, 1.433177, -1.214058, 0.6431373, 1, 0, 1,
-0.7501643, -1.387601, -2.829704, 0.6392157, 1, 0, 1,
-0.749669, 0.1113241, -1.599703, 0.6313726, 1, 0, 1,
-0.7433211, -0.4604656, -2.675192, 0.627451, 1, 0, 1,
-0.7431446, 0.2128761, -1.652675, 0.6196079, 1, 0, 1,
-0.7414953, -0.4537691, -2.385548, 0.6156863, 1, 0, 1,
-0.736982, -0.7264817, -1.969281, 0.6078432, 1, 0, 1,
-0.7322055, -1.679438, -1.496098, 0.6039216, 1, 0, 1,
-0.7316649, -0.5316523, -1.808932, 0.5960785, 1, 0, 1,
-0.7249655, -0.1663293, -0.8138941, 0.5882353, 1, 0, 1,
-0.7202705, 0.2476508, 0.01131725, 0.5843138, 1, 0, 1,
-0.7183841, 0.3391581, -1.603705, 0.5764706, 1, 0, 1,
-0.7157616, 1.890061, -1.958891, 0.572549, 1, 0, 1,
-0.7077061, 0.583116, 0.1785466, 0.5647059, 1, 0, 1,
-0.7035418, -0.7693797, -3.48366, 0.5607843, 1, 0, 1,
-0.7017089, -0.6450503, -1.919103, 0.5529412, 1, 0, 1,
-0.6969363, -0.2145514, -2.133334, 0.5490196, 1, 0, 1,
-0.6965672, -0.1061189, -3.476381, 0.5411765, 1, 0, 1,
-0.6965539, -0.8194476, -0.786603, 0.5372549, 1, 0, 1,
-0.6960572, -0.3772726, -1.4082, 0.5294118, 1, 0, 1,
-0.6873257, 1.196499, 0.5415467, 0.5254902, 1, 0, 1,
-0.6847871, 0.005805706, 0.09810185, 0.5176471, 1, 0, 1,
-0.6802379, -0.4174397, -2.532299, 0.5137255, 1, 0, 1,
-0.6765229, -0.899627, -4.425143, 0.5058824, 1, 0, 1,
-0.6725073, 0.04919912, -0.8657119, 0.5019608, 1, 0, 1,
-0.672077, 1.381018, -0.9993212, 0.4941176, 1, 0, 1,
-0.6703342, -0.4190171, -3.009753, 0.4862745, 1, 0, 1,
-0.666189, -1.196695, -4.449793, 0.4823529, 1, 0, 1,
-0.6609445, -0.464168, -3.879806, 0.4745098, 1, 0, 1,
-0.6596425, 0.9407676, -0.4616045, 0.4705882, 1, 0, 1,
-0.6588652, 0.5033276, -0.7731735, 0.4627451, 1, 0, 1,
-0.6574358, -0.5916895, -3.600594, 0.4588235, 1, 0, 1,
-0.6500172, 0.658047, -1.407973, 0.4509804, 1, 0, 1,
-0.6489263, 0.6399691, -0.795496, 0.4470588, 1, 0, 1,
-0.6486115, -0.725365, -2.419007, 0.4392157, 1, 0, 1,
-0.6484511, -0.5404717, -2.953583, 0.4352941, 1, 0, 1,
-0.647851, 1.369482, -1.431926, 0.427451, 1, 0, 1,
-0.6465749, -1.302301, -2.734553, 0.4235294, 1, 0, 1,
-0.6432441, -2.056364, -1.572401, 0.4156863, 1, 0, 1,
-0.6365907, -0.2054078, -2.920522, 0.4117647, 1, 0, 1,
-0.6318889, -1.156015, -2.974437, 0.4039216, 1, 0, 1,
-0.6315372, -2.224504, -3.585161, 0.3960784, 1, 0, 1,
-0.6290959, 0.02138608, -1.600512, 0.3921569, 1, 0, 1,
-0.6217039, 1.463849, 0.8174785, 0.3843137, 1, 0, 1,
-0.6214785, 0.5755698, -1.287658, 0.3803922, 1, 0, 1,
-0.6208851, 0.8977895, -2.069846, 0.372549, 1, 0, 1,
-0.6089492, -0.1305899, -2.0622, 0.3686275, 1, 0, 1,
-0.6071163, -0.3199327, -3.502185, 0.3607843, 1, 0, 1,
-0.6039241, 0.4151537, -2.050336, 0.3568628, 1, 0, 1,
-0.6022446, -0.01130221, -0.4296725, 0.3490196, 1, 0, 1,
-0.6020902, -0.7012034, -4.544263, 0.345098, 1, 0, 1,
-0.6008914, 0.1560659, -2.085817, 0.3372549, 1, 0, 1,
-0.5974037, 0.04627041, -1.341122, 0.3333333, 1, 0, 1,
-0.5952407, 0.3044575, -0.8014669, 0.3254902, 1, 0, 1,
-0.5941775, -0.5084589, -2.174342, 0.3215686, 1, 0, 1,
-0.5916905, -0.266901, -1.730832, 0.3137255, 1, 0, 1,
-0.5910265, -0.1945532, -3.016003, 0.3098039, 1, 0, 1,
-0.5879114, -0.3978629, -1.892011, 0.3019608, 1, 0, 1,
-0.5862236, 1.125571, -1.091468, 0.2941177, 1, 0, 1,
-0.5860692, 0.4760296, -2.626222, 0.2901961, 1, 0, 1,
-0.5837986, -0.7417164, -3.746487, 0.282353, 1, 0, 1,
-0.5812598, -0.4419782, -3.542768, 0.2784314, 1, 0, 1,
-0.5798561, -0.1927577, -1.626943, 0.2705882, 1, 0, 1,
-0.5745137, 1.178544, -0.8622272, 0.2666667, 1, 0, 1,
-0.5724725, -0.5685529, -3.936447, 0.2588235, 1, 0, 1,
-0.5615065, 1.42572, -0.004515836, 0.254902, 1, 0, 1,
-0.5597438, 0.9209027, -1.498741, 0.2470588, 1, 0, 1,
-0.559679, -1.663065, -3.329833, 0.2431373, 1, 0, 1,
-0.5539913, 0.1560162, -2.005572, 0.2352941, 1, 0, 1,
-0.545875, 0.09476235, -2.957641, 0.2313726, 1, 0, 1,
-0.5433279, 0.2299606, -0.5311542, 0.2235294, 1, 0, 1,
-0.5408205, 1.045698, 0.4385615, 0.2196078, 1, 0, 1,
-0.5392, 0.4395969, -1.583254, 0.2117647, 1, 0, 1,
-0.5299054, -0.458658, -2.859772, 0.2078431, 1, 0, 1,
-0.5296453, -0.05893576, -1.566253, 0.2, 1, 0, 1,
-0.5262359, 0.942981, -2.40367, 0.1921569, 1, 0, 1,
-0.5246621, 0.1144163, -2.646024, 0.1882353, 1, 0, 1,
-0.5235279, 0.5559616, -0.4696918, 0.1803922, 1, 0, 1,
-0.5232607, 1.459508, 1.272645, 0.1764706, 1, 0, 1,
-0.5222042, -1.204199, -3.226011, 0.1686275, 1, 0, 1,
-0.5216246, -0.1545298, -2.415034, 0.1647059, 1, 0, 1,
-0.5205261, 0.08185108, -0.5705132, 0.1568628, 1, 0, 1,
-0.5162643, -0.06346064, -1.165886, 0.1529412, 1, 0, 1,
-0.5153164, 0.01298423, -0.01630108, 0.145098, 1, 0, 1,
-0.5152567, 0.2813575, -1.344364, 0.1411765, 1, 0, 1,
-0.5151252, -1.014294, -1.013773, 0.1333333, 1, 0, 1,
-0.5125259, 0.4642584, -1.276902, 0.1294118, 1, 0, 1,
-0.4991154, 1.103525, -0.9616954, 0.1215686, 1, 0, 1,
-0.4986444, 0.5796175, 0.614549, 0.1176471, 1, 0, 1,
-0.4960865, -1.139177, -4.505878, 0.1098039, 1, 0, 1,
-0.4938652, -0.5425857, -3.2179, 0.1058824, 1, 0, 1,
-0.4883537, -0.1437095, -1.785281, 0.09803922, 1, 0, 1,
-0.4860384, -1.171347, -1.799957, 0.09019608, 1, 0, 1,
-0.4814587, 1.68787, -0.01480802, 0.08627451, 1, 0, 1,
-0.4804637, -0.395033, -2.036624, 0.07843138, 1, 0, 1,
-0.4789185, -0.07143029, -1.588326, 0.07450981, 1, 0, 1,
-0.4762108, -0.3450966, -1.450968, 0.06666667, 1, 0, 1,
-0.4757296, -0.08846347, -1.346853, 0.0627451, 1, 0, 1,
-0.4754713, -0.7487443, -0.4299213, 0.05490196, 1, 0, 1,
-0.467954, 1.337206, -1.165369, 0.05098039, 1, 0, 1,
-0.466424, -0.2687249, -0.4212462, 0.04313726, 1, 0, 1,
-0.4647273, -0.9306967, -1.658793, 0.03921569, 1, 0, 1,
-0.4630253, 1.543753, 0.5388424, 0.03137255, 1, 0, 1,
-0.4604686, -0.463971, -1.353777, 0.02745098, 1, 0, 1,
-0.4594099, 0.07984494, -2.370442, 0.01960784, 1, 0, 1,
-0.4585198, 0.5197106, -1.245456, 0.01568628, 1, 0, 1,
-0.4550531, -0.7045648, -2.945318, 0.007843138, 1, 0, 1,
-0.4535073, -0.1252566, -3.738616, 0.003921569, 1, 0, 1,
-0.4534308, 0.1124379, -1.749727, 0, 1, 0.003921569, 1,
-0.4473582, 0.2052577, -0.7594346, 0, 1, 0.01176471, 1,
-0.4454763, 1.210364, -1.011795, 0, 1, 0.01568628, 1,
-0.4451414, 1.177904, -0.1180913, 0, 1, 0.02352941, 1,
-0.4384958, -1.437352, -2.330188, 0, 1, 0.02745098, 1,
-0.4346888, -0.72742, -2.140108, 0, 1, 0.03529412, 1,
-0.4323365, 0.9452552, -1.341253, 0, 1, 0.03921569, 1,
-0.431606, -0.3297503, -1.312456, 0, 1, 0.04705882, 1,
-0.4302802, -2.125288, -2.569814, 0, 1, 0.05098039, 1,
-0.4244882, 2.61942, -0.6890197, 0, 1, 0.05882353, 1,
-0.4210003, 0.1731903, -2.420458, 0, 1, 0.0627451, 1,
-0.4131969, -0.4810786, -1.393534, 0, 1, 0.07058824, 1,
-0.4131862, -0.6858807, -2.809281, 0, 1, 0.07450981, 1,
-0.4118748, -0.1227428, -1.677697, 0, 1, 0.08235294, 1,
-0.4056655, -0.4075872, -4.218089, 0, 1, 0.08627451, 1,
-0.4051184, 1.024673, -0.7220309, 0, 1, 0.09411765, 1,
-0.4043357, -0.08854979, -4.243167, 0, 1, 0.1019608, 1,
-0.3986164, -0.5830441, -3.117809, 0, 1, 0.1058824, 1,
-0.3985354, 0.550055, -0.1706219, 0, 1, 0.1137255, 1,
-0.3977334, 0.6900327, -0.6197842, 0, 1, 0.1176471, 1,
-0.3974269, 0.5670234, 0.5948656, 0, 1, 0.1254902, 1,
-0.3932653, -0.812064, -2.797493, 0, 1, 0.1294118, 1,
-0.3925492, 2.700081, -2.214319, 0, 1, 0.1372549, 1,
-0.3858047, -0.2733912, -1.36124, 0, 1, 0.1411765, 1,
-0.3820551, 1.098194, -0.6983898, 0, 1, 0.1490196, 1,
-0.3816232, 0.2948815, -2.072327, 0, 1, 0.1529412, 1,
-0.3811784, -0.4708472, -1.047109, 0, 1, 0.1607843, 1,
-0.3802177, -0.5863638, -3.33041, 0, 1, 0.1647059, 1,
-0.3797115, 0.3652021, -1.887587, 0, 1, 0.172549, 1,
-0.3726385, -1.976307, -2.226591, 0, 1, 0.1764706, 1,
-0.3718762, -1.01556, -5.113896, 0, 1, 0.1843137, 1,
-0.3708939, -0.08487498, -1.36819, 0, 1, 0.1882353, 1,
-0.3699672, -0.01915558, -2.851335, 0, 1, 0.1960784, 1,
-0.3680181, -1.820983, -3.238003, 0, 1, 0.2039216, 1,
-0.3668444, 0.213676, -0.04264405, 0, 1, 0.2078431, 1,
-0.3609689, -1.544077, -3.244442, 0, 1, 0.2156863, 1,
-0.3587518, 0.6115572, -0.8185576, 0, 1, 0.2196078, 1,
-0.3581064, 0.4324196, 0.6165982, 0, 1, 0.227451, 1,
-0.3566264, 0.3334646, -1.358323, 0, 1, 0.2313726, 1,
-0.3528746, 0.09782393, -1.224949, 0, 1, 0.2392157, 1,
-0.3472745, -0.8811265, -3.501265, 0, 1, 0.2431373, 1,
-0.3453917, 1.00174, -0.2482747, 0, 1, 0.2509804, 1,
-0.3431786, 0.4163134, 0.3381543, 0, 1, 0.254902, 1,
-0.34192, -0.6433102, -3.052157, 0, 1, 0.2627451, 1,
-0.3405976, -0.4804137, -2.066392, 0, 1, 0.2666667, 1,
-0.3400199, -0.02321531, -3.065918, 0, 1, 0.2745098, 1,
-0.338217, 1.525704, -0.4802742, 0, 1, 0.2784314, 1,
-0.3358072, -0.4023203, -2.806216, 0, 1, 0.2862745, 1,
-0.333754, -0.1492066, -1.239004, 0, 1, 0.2901961, 1,
-0.3310344, 1.772871, -0.007146674, 0, 1, 0.2980392, 1,
-0.3283057, -1.135326, -3.532722, 0, 1, 0.3058824, 1,
-0.325312, 0.7820264, -0.3371904, 0, 1, 0.3098039, 1,
-0.3207875, 0.9864211, 0.5317869, 0, 1, 0.3176471, 1,
-0.320249, -0.8683484, -1.141033, 0, 1, 0.3215686, 1,
-0.3180461, -2.075774, -5.315761, 0, 1, 0.3294118, 1,
-0.3174995, -1.222888, -2.814518, 0, 1, 0.3333333, 1,
-0.3144656, -1.530905, -1.027893, 0, 1, 0.3411765, 1,
-0.3136818, -0.4902696, -0.3508607, 0, 1, 0.345098, 1,
-0.3126497, 0.854901, -1.135657, 0, 1, 0.3529412, 1,
-0.3099788, -1.116662, -2.097869, 0, 1, 0.3568628, 1,
-0.3064865, 1.071118, 0.04046822, 0, 1, 0.3647059, 1,
-0.3032928, 1.167899, 0.1876825, 0, 1, 0.3686275, 1,
-0.3027512, 0.3053249, 0.9383466, 0, 1, 0.3764706, 1,
-0.3014903, -0.8185677, -4.336326, 0, 1, 0.3803922, 1,
-0.2988334, 0.186077, -1.616003, 0, 1, 0.3882353, 1,
-0.2978038, 0.6493762, -0.5085412, 0, 1, 0.3921569, 1,
-0.2970777, 0.3647428, -0.4513463, 0, 1, 0.4, 1,
-0.2941679, -0.1475787, -1.579485, 0, 1, 0.4078431, 1,
-0.288855, -0.1656491, -1.916331, 0, 1, 0.4117647, 1,
-0.2880953, 0.2770261, -2.453982, 0, 1, 0.4196078, 1,
-0.2879606, -1.494771, -2.570716, 0, 1, 0.4235294, 1,
-0.2870603, -0.590437, -1.598357, 0, 1, 0.4313726, 1,
-0.2823995, -0.4094513, -2.161358, 0, 1, 0.4352941, 1,
-0.2750489, -1.151871, -3.299036, 0, 1, 0.4431373, 1,
-0.2748351, -0.2368264, -1.902661, 0, 1, 0.4470588, 1,
-0.2744533, -0.3120452, -1.102852, 0, 1, 0.454902, 1,
-0.2742927, 1.179992, -1.141284, 0, 1, 0.4588235, 1,
-0.2706197, -0.3674613, -2.466251, 0, 1, 0.4666667, 1,
-0.2697662, -1.68238, -3.308939, 0, 1, 0.4705882, 1,
-0.268106, -0.3120129, -4.381772, 0, 1, 0.4784314, 1,
-0.267795, 0.1177348, -1.96516, 0, 1, 0.4823529, 1,
-0.2674353, 1.104774, -0.09425625, 0, 1, 0.4901961, 1,
-0.2660117, 0.1304214, -0.3817567, 0, 1, 0.4941176, 1,
-0.2629332, 2.226465, 0.5590069, 0, 1, 0.5019608, 1,
-0.2600058, -0.114677, -2.485479, 0, 1, 0.509804, 1,
-0.2559896, 0.5969575, -2.032283, 0, 1, 0.5137255, 1,
-0.2557697, 1.587606, -0.4443527, 0, 1, 0.5215687, 1,
-0.2439621, -0.5955519, -0.7107427, 0, 1, 0.5254902, 1,
-0.2425478, -1.086232, -3.07001, 0, 1, 0.5333334, 1,
-0.2412722, 1.122352, 0.7456962, 0, 1, 0.5372549, 1,
-0.238727, 0.8471379, 0.07441207, 0, 1, 0.5450981, 1,
-0.2324642, -0.4477126, -3.053705, 0, 1, 0.5490196, 1,
-0.2317822, -0.1501793, -1.092306, 0, 1, 0.5568628, 1,
-0.231212, 0.6388096, -0.3029514, 0, 1, 0.5607843, 1,
-0.2293625, 2.781821, -1.264189, 0, 1, 0.5686275, 1,
-0.2286205, -0.1305003, 0.5881485, 0, 1, 0.572549, 1,
-0.2123696, -0.70883, -3.396633, 0, 1, 0.5803922, 1,
-0.2118613, -0.9026349, -2.755297, 0, 1, 0.5843138, 1,
-0.2102792, -0.1728111, -1.529877, 0, 1, 0.5921569, 1,
-0.2065695, 0.8790317, -0.2970504, 0, 1, 0.5960785, 1,
-0.2045866, -0.4338243, -2.436088, 0, 1, 0.6039216, 1,
-0.1939508, -0.1516089, -1.948517, 0, 1, 0.6117647, 1,
-0.1915927, -0.5114637, -4.252269, 0, 1, 0.6156863, 1,
-0.1891619, -0.816916, -1.008919, 0, 1, 0.6235294, 1,
-0.1890352, -0.242761, -2.146123, 0, 1, 0.627451, 1,
-0.1888545, -2.231213, -2.88132, 0, 1, 0.6352941, 1,
-0.1884476, -1.712523, -3.517808, 0, 1, 0.6392157, 1,
-0.1830984, 0.0761257, -1.017886, 0, 1, 0.6470588, 1,
-0.180214, -1.293658, -3.919238, 0, 1, 0.6509804, 1,
-0.1775784, 0.8512924, -1.90983, 0, 1, 0.6588235, 1,
-0.1704275, -0.2783928, -2.093391, 0, 1, 0.6627451, 1,
-0.1695742, -0.7466112, -1.498847, 0, 1, 0.6705883, 1,
-0.1672873, 1.49295, 0.3643506, 0, 1, 0.6745098, 1,
-0.1597183, 0.1294058, 0.4334904, 0, 1, 0.682353, 1,
-0.1511271, 0.5275218, 1.594959, 0, 1, 0.6862745, 1,
-0.1482577, -1.190262, -5.163668, 0, 1, 0.6941177, 1,
-0.1473204, 0.5728796, 1.178366, 0, 1, 0.7019608, 1,
-0.1418707, -0.9358742, -0.9154733, 0, 1, 0.7058824, 1,
-0.1406718, 0.4240661, 0.3094755, 0, 1, 0.7137255, 1,
-0.1328944, -0.9492317, -2.158917, 0, 1, 0.7176471, 1,
-0.1315508, 1.088488, -0.8147004, 0, 1, 0.7254902, 1,
-0.1249786, -1.287563, -3.050523, 0, 1, 0.7294118, 1,
-0.1220075, 0.1970608, 0.9144654, 0, 1, 0.7372549, 1,
-0.121681, 0.5840492, 0.1927722, 0, 1, 0.7411765, 1,
-0.1194052, -0.2645804, -2.706748, 0, 1, 0.7490196, 1,
-0.1182841, 0.7616169, -1.436519, 0, 1, 0.7529412, 1,
-0.1172557, 0.3706873, -0.104178, 0, 1, 0.7607843, 1,
-0.1166407, 1.154627, -0.3329135, 0, 1, 0.7647059, 1,
-0.1105883, 2.139823, 0.1259898, 0, 1, 0.772549, 1,
-0.1093556, -0.6695499, -3.433896, 0, 1, 0.7764706, 1,
-0.1077626, 0.668865, 0.4912868, 0, 1, 0.7843137, 1,
-0.1066967, 1.725047, 0.3375065, 0, 1, 0.7882353, 1,
-0.1041425, -0.6932518, -1.761819, 0, 1, 0.7960784, 1,
-0.1021178, 0.4447554, -0.5059432, 0, 1, 0.8039216, 1,
-0.1015464, -1.584124, -2.497554, 0, 1, 0.8078431, 1,
-0.1013853, 0.9112108, 0.1711436, 0, 1, 0.8156863, 1,
-0.1011383, -0.8264163, -2.132063, 0, 1, 0.8196079, 1,
-0.09994758, -1.216689, -2.204517, 0, 1, 0.827451, 1,
-0.09846663, 0.2221197, -1.336128, 0, 1, 0.8313726, 1,
-0.09460082, 0.1645668, -1.405671, 0, 1, 0.8392157, 1,
-0.09399411, -0.2584707, -1.278657, 0, 1, 0.8431373, 1,
-0.087986, 0.9259865, -0.7062594, 0, 1, 0.8509804, 1,
-0.08086271, -1.684452, -3.220006, 0, 1, 0.854902, 1,
-0.08054507, 3.461289, -0.2742377, 0, 1, 0.8627451, 1,
-0.07716554, -1.486187, -2.734171, 0, 1, 0.8666667, 1,
-0.07427512, -0.1616025, -4.254083, 0, 1, 0.8745098, 1,
-0.07361405, 1.639423, 0.5407032, 0, 1, 0.8784314, 1,
-0.06750619, -2.036907, -2.082988, 0, 1, 0.8862745, 1,
-0.06749205, -2.126134, -2.65117, 0, 1, 0.8901961, 1,
-0.06539678, -0.773086, -3.926669, 0, 1, 0.8980392, 1,
-0.06500878, -1.8415, -2.872988, 0, 1, 0.9058824, 1,
-0.06448477, 0.2003222, -1.068749, 0, 1, 0.9098039, 1,
-0.06303503, -0.4566178, -2.643178, 0, 1, 0.9176471, 1,
-0.06160669, -1.957116, -0.8181913, 0, 1, 0.9215686, 1,
-0.06000895, 0.6353711, 0.6124987, 0, 1, 0.9294118, 1,
-0.05752704, -0.2703266, -2.473979, 0, 1, 0.9333333, 1,
-0.0569054, 0.1115769, 0.4604172, 0, 1, 0.9411765, 1,
-0.05570969, -0.7191058, -4.771574, 0, 1, 0.945098, 1,
-0.05097375, -0.4959946, -4.181438, 0, 1, 0.9529412, 1,
-0.04775218, 0.4167477, -1.158313, 0, 1, 0.9568627, 1,
-0.04578471, -0.453114, -5.495598, 0, 1, 0.9647059, 1,
-0.04503099, 0.9660325, -0.2501991, 0, 1, 0.9686275, 1,
-0.04253745, 0.4152029, -1.135512, 0, 1, 0.9764706, 1,
-0.03462132, -2.157919, -4.432638, 0, 1, 0.9803922, 1,
-0.03317474, -0.5121953, -2.591052, 0, 1, 0.9882353, 1,
-0.03304454, 1.070458, 0.2289939, 0, 1, 0.9921569, 1,
-0.02277569, 0.5714664, 1.923887, 0, 1, 1, 1,
-0.02108311, 0.412489, 1.044688, 0, 0.9921569, 1, 1,
-0.02064748, 0.02515407, 0.08063874, 0, 0.9882353, 1, 1,
-0.01647247, -0.4003895, -0.7273655, 0, 0.9803922, 1, 1,
-0.01330837, -0.6935262, -2.668296, 0, 0.9764706, 1, 1,
-0.01162086, 0.2818809, -1.711714, 0, 0.9686275, 1, 1,
-0.01157904, 0.3283138, -0.931527, 0, 0.9647059, 1, 1,
-0.01041082, 0.1849725, 0.3180639, 0, 0.9568627, 1, 1,
-0.002357699, -0.3220784, -4.932971, 0, 0.9529412, 1, 1,
-0.001752976, 1.26648, 1.042632, 0, 0.945098, 1, 1,
0.0002874513, 0.4550414, 1.892442, 0, 0.9411765, 1, 1,
0.003824605, 1.151319, -2.194941, 0, 0.9333333, 1, 1,
0.004320151, 2.255388, -0.3843576, 0, 0.9294118, 1, 1,
0.004755909, -1.662839, 4.050757, 0, 0.9215686, 1, 1,
0.01242251, -0.9403106, 2.508179, 0, 0.9176471, 1, 1,
0.01932793, -2.663066, 2.314366, 0, 0.9098039, 1, 1,
0.02397068, 2.132933, 0.2167038, 0, 0.9058824, 1, 1,
0.02493154, 0.1616255, -0.5993296, 0, 0.8980392, 1, 1,
0.02692292, -1.963884, 6.223146, 0, 0.8901961, 1, 1,
0.02838258, -0.2181371, 2.110938, 0, 0.8862745, 1, 1,
0.02872866, 0.8061216, 0.2491632, 0, 0.8784314, 1, 1,
0.03158573, 0.2925044, -1.05667, 0, 0.8745098, 1, 1,
0.03570445, -0.6153038, 3.596873, 0, 0.8666667, 1, 1,
0.03806346, -1.270303, 2.286768, 0, 0.8627451, 1, 1,
0.04450939, -1.611061, 4.214135, 0, 0.854902, 1, 1,
0.04557929, 0.6548045, 0.08473189, 0, 0.8509804, 1, 1,
0.05138624, -0.7239377, 3.881715, 0, 0.8431373, 1, 1,
0.05197287, -0.2035147, 1.941669, 0, 0.8392157, 1, 1,
0.05333558, 0.5037343, -0.3757299, 0, 0.8313726, 1, 1,
0.05550989, 1.485802, -0.864444, 0, 0.827451, 1, 1,
0.05642619, 0.2801367, 0.9400783, 0, 0.8196079, 1, 1,
0.06064682, 0.504775, -0.6417689, 0, 0.8156863, 1, 1,
0.06194675, 0.6019632, 1.437237, 0, 0.8078431, 1, 1,
0.06324966, 2.7234, -0.2661914, 0, 0.8039216, 1, 1,
0.06492276, 1.886216, 0.8064731, 0, 0.7960784, 1, 1,
0.06851974, -0.4561924, 3.151109, 0, 0.7882353, 1, 1,
0.06871082, -0.07211461, 0.003021314, 0, 0.7843137, 1, 1,
0.07052556, 0.05479818, 3.163826, 0, 0.7764706, 1, 1,
0.07709278, 0.9738623, 0.5950255, 0, 0.772549, 1, 1,
0.08177842, 1.62931, 0.002823598, 0, 0.7647059, 1, 1,
0.0827807, -1.039581, 2.049995, 0, 0.7607843, 1, 1,
0.08414723, -1.171735, 5.067677, 0, 0.7529412, 1, 1,
0.08443721, -1.385078, 2.076436, 0, 0.7490196, 1, 1,
0.08989582, -1.44556, 2.739837, 0, 0.7411765, 1, 1,
0.09134539, 0.2193048, -0.213836, 0, 0.7372549, 1, 1,
0.09316898, -2.33726, 2.261395, 0, 0.7294118, 1, 1,
0.1018865, -0.3111641, 2.240747, 0, 0.7254902, 1, 1,
0.101947, 0.6156841, 0.6010913, 0, 0.7176471, 1, 1,
0.1048641, -0.381079, 1.969937, 0, 0.7137255, 1, 1,
0.1085012, -0.06903255, -0.6845028, 0, 0.7058824, 1, 1,
0.1085372, 0.1520183, 2.472285, 0, 0.6980392, 1, 1,
0.1092535, -1.614934, 5.51652, 0, 0.6941177, 1, 1,
0.1098341, -0.3007559, 2.770432, 0, 0.6862745, 1, 1,
0.1133407, -0.5666087, 3.454697, 0, 0.682353, 1, 1,
0.1170295, 1.556517, -1.321841, 0, 0.6745098, 1, 1,
0.1182948, 0.5703114, 1.902518, 0, 0.6705883, 1, 1,
0.1204082, -1.878685, 2.759794, 0, 0.6627451, 1, 1,
0.1215568, 0.9984176, -0.386133, 0, 0.6588235, 1, 1,
0.1271866, -0.6377677, 2.959494, 0, 0.6509804, 1, 1,
0.1277959, -0.2578873, 2.373504, 0, 0.6470588, 1, 1,
0.1282359, -1.181689, 2.437753, 0, 0.6392157, 1, 1,
0.1321327, -1.51762, 3.466526, 0, 0.6352941, 1, 1,
0.1368084, -1.007752, 1.783154, 0, 0.627451, 1, 1,
0.1398924, -0.0328331, 2.031041, 0, 0.6235294, 1, 1,
0.1414353, 0.7246141, 0.1808072, 0, 0.6156863, 1, 1,
0.1419999, -0.04558474, 3.133698, 0, 0.6117647, 1, 1,
0.1423612, 1.589262, 2.102041, 0, 0.6039216, 1, 1,
0.1431117, -0.6392161, 3.118897, 0, 0.5960785, 1, 1,
0.1438356, -0.01178218, 1.69826, 0, 0.5921569, 1, 1,
0.1449457, 0.01874724, 2.063385, 0, 0.5843138, 1, 1,
0.1452545, 0.4066743, 0.8591921, 0, 0.5803922, 1, 1,
0.1462135, -0.4758182, 1.218553, 0, 0.572549, 1, 1,
0.1463353, 1.470241, 0.2369189, 0, 0.5686275, 1, 1,
0.1474094, -0.3559259, 3.72898, 0, 0.5607843, 1, 1,
0.1489176, 0.76945, -0.7362705, 0, 0.5568628, 1, 1,
0.149316, -0.8381073, 3.084942, 0, 0.5490196, 1, 1,
0.1530056, 0.5231247, 0.3409373, 0, 0.5450981, 1, 1,
0.1568458, -0.5159276, 1.280659, 0, 0.5372549, 1, 1,
0.1643145, -1.179489, 2.673011, 0, 0.5333334, 1, 1,
0.1713912, 1.600916, 1.617793, 0, 0.5254902, 1, 1,
0.1757598, -0.6798618, 2.582104, 0, 0.5215687, 1, 1,
0.1763532, 1.823811, 0.2354401, 0, 0.5137255, 1, 1,
0.1768776, 0.2587717, 0.4917961, 0, 0.509804, 1, 1,
0.1777951, -1.98866, 3.879289, 0, 0.5019608, 1, 1,
0.1787125, 1.554975, -0.5593137, 0, 0.4941176, 1, 1,
0.1793218, 1.572641, -0.3358535, 0, 0.4901961, 1, 1,
0.1825899, -1.883329, 3.050549, 0, 0.4823529, 1, 1,
0.1828502, -0.8839532, 2.424923, 0, 0.4784314, 1, 1,
0.1847976, 0.9035147, -0.7265145, 0, 0.4705882, 1, 1,
0.1849832, -0.2438651, 3.167888, 0, 0.4666667, 1, 1,
0.1878892, 2.063339, 0.4552184, 0, 0.4588235, 1, 1,
0.1883179, 0.3318554, 0.6274985, 0, 0.454902, 1, 1,
0.1883756, 0.6028996, -0.7886567, 0, 0.4470588, 1, 1,
0.1895222, -0.3996774, 1.986609, 0, 0.4431373, 1, 1,
0.1903267, 2.265076, 1.490794, 0, 0.4352941, 1, 1,
0.1913296, -1.477283, 5.052388, 0, 0.4313726, 1, 1,
0.1930237, 0.2684034, 1.328113, 0, 0.4235294, 1, 1,
0.19638, 1.724694, 0.8098717, 0, 0.4196078, 1, 1,
0.1983421, 0.4758133, 0.5878092, 0, 0.4117647, 1, 1,
0.2007084, 0.09498005, 0.7684362, 0, 0.4078431, 1, 1,
0.2017741, 1.343673, -0.03741991, 0, 0.4, 1, 1,
0.2028552, 0.4778714, 0.7759218, 0, 0.3921569, 1, 1,
0.2031176, -0.4704123, 2.67899, 0, 0.3882353, 1, 1,
0.20566, -0.4945577, 2.865122, 0, 0.3803922, 1, 1,
0.2079999, -0.8705077, 3.546213, 0, 0.3764706, 1, 1,
0.2084409, 0.03546399, 0.4470992, 0, 0.3686275, 1, 1,
0.2103523, -2.109251, 3.499275, 0, 0.3647059, 1, 1,
0.2135073, 1.554086, -1.189683, 0, 0.3568628, 1, 1,
0.2206989, -1.340459, 2.817406, 0, 0.3529412, 1, 1,
0.221518, -0.2875617, 1.787163, 0, 0.345098, 1, 1,
0.2220489, -2.115281, 1.073099, 0, 0.3411765, 1, 1,
0.2230555, -1.071293, 2.38015, 0, 0.3333333, 1, 1,
0.2265913, -0.8219519, 3.7156, 0, 0.3294118, 1, 1,
0.2287039, -0.8056684, 4.551566, 0, 0.3215686, 1, 1,
0.2287321, -1.132243, 2.549634, 0, 0.3176471, 1, 1,
0.2349228, -0.7358489, 3.680814, 0, 0.3098039, 1, 1,
0.23558, -0.5204833, 2.032105, 0, 0.3058824, 1, 1,
0.2364963, 1.323231, 1.379156, 0, 0.2980392, 1, 1,
0.236587, -0.5220198, 1.983992, 0, 0.2901961, 1, 1,
0.2382759, -0.8471351, 3.621734, 0, 0.2862745, 1, 1,
0.2410027, -0.5011917, 2.118901, 0, 0.2784314, 1, 1,
0.243851, -0.02762329, 1.491553, 0, 0.2745098, 1, 1,
0.2466415, 0.05703749, 0.2537657, 0, 0.2666667, 1, 1,
0.248787, -0.5135312, 2.102449, 0, 0.2627451, 1, 1,
0.2489111, -0.2255923, 3.733344, 0, 0.254902, 1, 1,
0.2504215, -0.2101284, -0.3658778, 0, 0.2509804, 1, 1,
0.2574323, -0.3444046, 2.881568, 0, 0.2431373, 1, 1,
0.257828, 1.213519, -0.03037861, 0, 0.2392157, 1, 1,
0.2661779, 1.005409, 0.8913372, 0, 0.2313726, 1, 1,
0.2671479, -0.9694533, 2.163908, 0, 0.227451, 1, 1,
0.2697595, -1.208835, 1.743418, 0, 0.2196078, 1, 1,
0.2704746, 0.5217649, 0.7618339, 0, 0.2156863, 1, 1,
0.2811832, -0.3801169, 2.54134, 0, 0.2078431, 1, 1,
0.2833066, -0.8937793, 3.010947, 0, 0.2039216, 1, 1,
0.2835852, -0.1846867, 1.773481, 0, 0.1960784, 1, 1,
0.2862432, 0.09180719, 1.494424, 0, 0.1882353, 1, 1,
0.2866102, -0.004913258, 0.351888, 0, 0.1843137, 1, 1,
0.2871189, 0.7825428, 2.062485, 0, 0.1764706, 1, 1,
0.2904839, -2.127887, 3.666218, 0, 0.172549, 1, 1,
0.2905179, -1.074341, 0.6066641, 0, 0.1647059, 1, 1,
0.2957464, 1.233492, 0.7646725, 0, 0.1607843, 1, 1,
0.297459, -0.3671818, 1.655905, 0, 0.1529412, 1, 1,
0.2981445, -0.4209018, 2.419373, 0, 0.1490196, 1, 1,
0.2981898, -0.3229235, 1.319246, 0, 0.1411765, 1, 1,
0.3007919, -0.7343187, 3.1765, 0, 0.1372549, 1, 1,
0.3008382, -2.544385, 1.606819, 0, 0.1294118, 1, 1,
0.3019637, -0.6990452, 3.968751, 0, 0.1254902, 1, 1,
0.302308, -0.3991264, 2.913502, 0, 0.1176471, 1, 1,
0.3026611, -0.2398039, 2.889036, 0, 0.1137255, 1, 1,
0.3040731, 2.054648, -0.5948226, 0, 0.1058824, 1, 1,
0.3041993, -0.7173703, -0.144853, 0, 0.09803922, 1, 1,
0.3057331, 1.311864, -0.9439327, 0, 0.09411765, 1, 1,
0.3070501, -1.993322, 3.25831, 0, 0.08627451, 1, 1,
0.3118608, -1.285799, 2.763786, 0, 0.08235294, 1, 1,
0.314545, -0.5269104, 3.344026, 0, 0.07450981, 1, 1,
0.315891, -0.3842777, 2.624155, 0, 0.07058824, 1, 1,
0.3231826, -0.05315141, 1.23908, 0, 0.0627451, 1, 1,
0.3268947, -1.149642, 1.466169, 0, 0.05882353, 1, 1,
0.3333519, -1.064939, 1.853378, 0, 0.05098039, 1, 1,
0.3384656, 0.1943425, 0.5987273, 0, 0.04705882, 1, 1,
0.340745, 1.232411, 0.1855401, 0, 0.03921569, 1, 1,
0.3441871, 0.7155956, 0.3201301, 0, 0.03529412, 1, 1,
0.3467078, 1.177185, 1.787928, 0, 0.02745098, 1, 1,
0.3484832, 0.4024675, 3.252241, 0, 0.02352941, 1, 1,
0.3487062, -0.2912298, 1.454267, 0, 0.01568628, 1, 1,
0.3531583, -0.4693451, 2.225501, 0, 0.01176471, 1, 1,
0.3557352, -0.1851165, 2.267071, 0, 0.003921569, 1, 1,
0.3558837, 1.624776, 1.75727, 0.003921569, 0, 1, 1,
0.3588435, -1.155105, 4.61333, 0.007843138, 0, 1, 1,
0.3596969, 0.1676816, 1.307208, 0.01568628, 0, 1, 1,
0.361441, -0.7834325, 2.421744, 0.01960784, 0, 1, 1,
0.3615163, -0.5040068, 2.512696, 0.02745098, 0, 1, 1,
0.3624523, -0.7011356, 3.666875, 0.03137255, 0, 1, 1,
0.3628222, -0.2376073, 2.458932, 0.03921569, 0, 1, 1,
0.3745188, -0.4493154, 2.965587, 0.04313726, 0, 1, 1,
0.3757542, -0.1127855, 1.867626, 0.05098039, 0, 1, 1,
0.3780736, 0.4501872, 1.669198, 0.05490196, 0, 1, 1,
0.3791068, 0.6014349, -0.3978728, 0.0627451, 0, 1, 1,
0.3792218, -0.1847466, 3.057199, 0.06666667, 0, 1, 1,
0.3831732, 1.797425, 0.3718224, 0.07450981, 0, 1, 1,
0.3859545, -1.735181, 2.055293, 0.07843138, 0, 1, 1,
0.3892126, 1.035854, 0.6666738, 0.08627451, 0, 1, 1,
0.3898158, 1.37801, 0.4875788, 0.09019608, 0, 1, 1,
0.3912971, 0.2669294, 2.185399, 0.09803922, 0, 1, 1,
0.3921916, 0.0005657316, 1.941384, 0.1058824, 0, 1, 1,
0.3952422, -0.7818608, 2.873858, 0.1098039, 0, 1, 1,
0.3954593, -1.526866, 2.658926, 0.1176471, 0, 1, 1,
0.3978516, -1.386205, 2.647418, 0.1215686, 0, 1, 1,
0.4034532, 1.113725, -0.7659401, 0.1294118, 0, 1, 1,
0.4058643, 1.859263, 1.415168, 0.1333333, 0, 1, 1,
0.418294, -1.845416, 5.005731, 0.1411765, 0, 1, 1,
0.4270197, -0.6519647, 1.98049, 0.145098, 0, 1, 1,
0.4273087, 0.2293435, -0.2781273, 0.1529412, 0, 1, 1,
0.4313829, -0.6246012, 2.302508, 0.1568628, 0, 1, 1,
0.4317503, 0.3523634, -0.5702284, 0.1647059, 0, 1, 1,
0.4384621, -1.049759, 2.504353, 0.1686275, 0, 1, 1,
0.4399156, -0.644336, 1.757564, 0.1764706, 0, 1, 1,
0.4401249, -0.3686115, 3.876332, 0.1803922, 0, 1, 1,
0.4410216, -0.5015798, 2.320576, 0.1882353, 0, 1, 1,
0.445555, 0.5900798, 1.186123, 0.1921569, 0, 1, 1,
0.4494165, -1.091964, 3.608012, 0.2, 0, 1, 1,
0.4517946, -0.46739, 2.682479, 0.2078431, 0, 1, 1,
0.452558, 0.8240899, 2.053381, 0.2117647, 0, 1, 1,
0.4613856, -1.064214, 3.656757, 0.2196078, 0, 1, 1,
0.4634503, -0.365364, 2.89412, 0.2235294, 0, 1, 1,
0.4651119, 1.121267, 1.058285, 0.2313726, 0, 1, 1,
0.4669555, 0.1889445, 2.647766, 0.2352941, 0, 1, 1,
0.4674685, -0.2856708, 2.980479, 0.2431373, 0, 1, 1,
0.4675259, 0.6944492, 0.5699055, 0.2470588, 0, 1, 1,
0.4708562, -0.2036597, 3.469396, 0.254902, 0, 1, 1,
0.4715218, -0.4197149, 1.324032, 0.2588235, 0, 1, 1,
0.4723639, -0.6823412, 4.846273, 0.2666667, 0, 1, 1,
0.4726299, -0.9483467, 1.463203, 0.2705882, 0, 1, 1,
0.4738137, 1.219697, 0.6347868, 0.2784314, 0, 1, 1,
0.475461, 1.445537, -0.1809069, 0.282353, 0, 1, 1,
0.4788035, 0.4963594, 0.2761913, 0.2901961, 0, 1, 1,
0.4788879, -0.5531393, 2.488093, 0.2941177, 0, 1, 1,
0.479383, 0.2308705, 0.7877947, 0.3019608, 0, 1, 1,
0.482296, -0.2791868, 2.197957, 0.3098039, 0, 1, 1,
0.4861489, -0.9039134, 1.934504, 0.3137255, 0, 1, 1,
0.49027, 1.462364, 0.3879464, 0.3215686, 0, 1, 1,
0.4952987, 0.2172985, 0.9061976, 0.3254902, 0, 1, 1,
0.4961858, -0.5417669, 2.615081, 0.3333333, 0, 1, 1,
0.4980624, -2.301872, 1.97231, 0.3372549, 0, 1, 1,
0.498573, 0.6670404, 0.5910186, 0.345098, 0, 1, 1,
0.4988034, -0.9772182, 1.552214, 0.3490196, 0, 1, 1,
0.5005251, -0.0493334, 0.7702346, 0.3568628, 0, 1, 1,
0.5091282, 1.370869, -0.6335725, 0.3607843, 0, 1, 1,
0.5146079, 0.1371203, 1.092398, 0.3686275, 0, 1, 1,
0.5179852, 0.1694182, 0.09510352, 0.372549, 0, 1, 1,
0.5187024, 0.7334469, -0.1203828, 0.3803922, 0, 1, 1,
0.5220007, 1.859418, 0.6733639, 0.3843137, 0, 1, 1,
0.5268459, 0.284913, 0.5829839, 0.3921569, 0, 1, 1,
0.5314212, -0.7912133, 2.610534, 0.3960784, 0, 1, 1,
0.5330798, 1.278946, 2.921783, 0.4039216, 0, 1, 1,
0.535984, -0.8183133, 4.6111, 0.4117647, 0, 1, 1,
0.5386498, 0.5578502, 0.9982012, 0.4156863, 0, 1, 1,
0.5393501, 0.8774021, 0.5099002, 0.4235294, 0, 1, 1,
0.5416602, 0.9157743, -0.01028698, 0.427451, 0, 1, 1,
0.547451, -0.8770298, 4.284796, 0.4352941, 0, 1, 1,
0.547706, -1.687138, 3.181142, 0.4392157, 0, 1, 1,
0.5477995, 1.106496, 0.1187295, 0.4470588, 0, 1, 1,
0.5502681, -0.007648851, 2.733903, 0.4509804, 0, 1, 1,
0.5522507, 0.04048078, 0.8810663, 0.4588235, 0, 1, 1,
0.553639, 0.1482084, 2.364348, 0.4627451, 0, 1, 1,
0.5543489, 0.06832861, 1.310635, 0.4705882, 0, 1, 1,
0.5561183, 0.5066331, 0.8612998, 0.4745098, 0, 1, 1,
0.5581022, -0.1248378, 1.523809, 0.4823529, 0, 1, 1,
0.5631638, 0.6093425, 2.09842, 0.4862745, 0, 1, 1,
0.5632252, -0.07583721, 2.906616, 0.4941176, 0, 1, 1,
0.5654005, 0.9867372, -1.910334, 0.5019608, 0, 1, 1,
0.5741588, -1.065687, 4.288445, 0.5058824, 0, 1, 1,
0.586215, 0.4126743, 0.6902125, 0.5137255, 0, 1, 1,
0.5862226, -1.514173, 2.923155, 0.5176471, 0, 1, 1,
0.586464, -0.5289529, 1.403393, 0.5254902, 0, 1, 1,
0.5884256, -0.2462354, 3.187897, 0.5294118, 0, 1, 1,
0.5917069, -0.04153724, 2.604347, 0.5372549, 0, 1, 1,
0.604715, 0.4506742, 1.086992, 0.5411765, 0, 1, 1,
0.6064098, 0.01773719, 2.321146, 0.5490196, 0, 1, 1,
0.6077108, -0.4778983, 1.143065, 0.5529412, 0, 1, 1,
0.6208145, 0.3321583, -0.5771481, 0.5607843, 0, 1, 1,
0.6221237, 1.403925, 1.535546, 0.5647059, 0, 1, 1,
0.6273582, 0.1636312, 2.43512, 0.572549, 0, 1, 1,
0.6334686, -1.451877, 2.928028, 0.5764706, 0, 1, 1,
0.6363642, -1.765996, 2.241142, 0.5843138, 0, 1, 1,
0.6572538, 0.0306419, 1.828776, 0.5882353, 0, 1, 1,
0.6594284, -1.466806, 3.894196, 0.5960785, 0, 1, 1,
0.6606197, -1.078336, 1.877164, 0.6039216, 0, 1, 1,
0.6610096, 2.327278, -0.7036315, 0.6078432, 0, 1, 1,
0.6647881, -1.245445, 3.318396, 0.6156863, 0, 1, 1,
0.6709816, 0.8347564, 2.887574, 0.6196079, 0, 1, 1,
0.6749761, -1.091287, 1.583234, 0.627451, 0, 1, 1,
0.6789376, -0.09313817, 3.196752, 0.6313726, 0, 1, 1,
0.7284818, 0.9480352, 2.528577, 0.6392157, 0, 1, 1,
0.7331491, 0.2443294, -1.477092, 0.6431373, 0, 1, 1,
0.7340361, 0.1985514, 1.669146, 0.6509804, 0, 1, 1,
0.7440196, -0.1293619, 4.082272, 0.654902, 0, 1, 1,
0.7486895, -1.398455, 2.884062, 0.6627451, 0, 1, 1,
0.7545774, 1.035677, -0.7881987, 0.6666667, 0, 1, 1,
0.7633969, 0.6899542, 1.559769, 0.6745098, 0, 1, 1,
0.7648811, 0.1657788, 2.400561, 0.6784314, 0, 1, 1,
0.7744473, -0.3480968, 2.23798, 0.6862745, 0, 1, 1,
0.7775369, -0.8093761, 2.152586, 0.6901961, 0, 1, 1,
0.7783459, 0.413131, -0.2802915, 0.6980392, 0, 1, 1,
0.7810087, 0.7037691, 2.47218, 0.7058824, 0, 1, 1,
0.7961042, -0.2888934, 2.195621, 0.7098039, 0, 1, 1,
0.7985345, 1.334877, 0.9849228, 0.7176471, 0, 1, 1,
0.7998327, -1.250395, 3.125578, 0.7215686, 0, 1, 1,
0.8011075, -0.1394265, 0.1639734, 0.7294118, 0, 1, 1,
0.8016404, 0.349025, 1.42504, 0.7333333, 0, 1, 1,
0.8024868, 1.002358, 1.766751, 0.7411765, 0, 1, 1,
0.8059779, -0.543425, 1.024248, 0.7450981, 0, 1, 1,
0.8068331, 0.6592799, 1.327395, 0.7529412, 0, 1, 1,
0.8111185, 0.07548268, 0.3267858, 0.7568628, 0, 1, 1,
0.8148444, 0.04836933, 1.744371, 0.7647059, 0, 1, 1,
0.8228116, -0.3608267, 0.0531425, 0.7686275, 0, 1, 1,
0.8304564, 0.08762952, 0.6307595, 0.7764706, 0, 1, 1,
0.8311589, -1.1958, 3.534543, 0.7803922, 0, 1, 1,
0.8342525, -0.5020471, 1.985397, 0.7882353, 0, 1, 1,
0.8474233, 0.2254138, 3.273434, 0.7921569, 0, 1, 1,
0.8550338, -0.5020709, 4.056176, 0.8, 0, 1, 1,
0.8587797, 0.6878141, 0.4998492, 0.8078431, 0, 1, 1,
0.8595914, -0.6480182, 1.182338, 0.8117647, 0, 1, 1,
0.8607479, -0.6571491, 1.516902, 0.8196079, 0, 1, 1,
0.8620447, -2.144021, 2.25431, 0.8235294, 0, 1, 1,
0.8645558, 0.9809342, 1.230657, 0.8313726, 0, 1, 1,
0.8661053, -0.101338, 1.346291, 0.8352941, 0, 1, 1,
0.8735271, -0.9655907, -0.669376, 0.8431373, 0, 1, 1,
0.8742994, -0.3978964, 1.200386, 0.8470588, 0, 1, 1,
0.8780811, 0.76144, 0.861851, 0.854902, 0, 1, 1,
0.8791917, 1.626431, 0.2320104, 0.8588235, 0, 1, 1,
0.8811614, 0.7116555, 1.420859, 0.8666667, 0, 1, 1,
0.8827049, 0.5847584, 1.762986, 0.8705882, 0, 1, 1,
0.8933502, 1.307642, -0.2790184, 0.8784314, 0, 1, 1,
0.8944039, 0.8411751, 0.1990491, 0.8823529, 0, 1, 1,
0.8981453, 0.1217427, 0.4309515, 0.8901961, 0, 1, 1,
0.9089225, -0.08846828, 1.810149, 0.8941177, 0, 1, 1,
0.9093934, 0.2575188, 1.983822, 0.9019608, 0, 1, 1,
0.9152278, -0.4447145, 3.379641, 0.9098039, 0, 1, 1,
0.9219775, 0.5156424, 0.9258673, 0.9137255, 0, 1, 1,
0.9307028, -0.6027859, 3.044374, 0.9215686, 0, 1, 1,
0.9427383, -1.013024, 1.60608, 0.9254902, 0, 1, 1,
0.9501132, -0.3332976, 1.025105, 0.9333333, 0, 1, 1,
0.9517641, 0.1687701, 2.65924, 0.9372549, 0, 1, 1,
0.9518072, -0.816287, 3.241434, 0.945098, 0, 1, 1,
0.955813, 0.4991098, 0.2237847, 0.9490196, 0, 1, 1,
0.95874, 0.1168852, 1.984041, 0.9568627, 0, 1, 1,
0.960142, 0.7076696, 2.097183, 0.9607843, 0, 1, 1,
0.9634413, -0.4798755, 2.094929, 0.9686275, 0, 1, 1,
0.9671376, -1.474893, 2.665344, 0.972549, 0, 1, 1,
0.9748139, 0.5122693, 0.8046321, 0.9803922, 0, 1, 1,
0.9902495, 0.4134599, 0.4143736, 0.9843137, 0, 1, 1,
0.9912086, 1.60311, 2.087079, 0.9921569, 0, 1, 1,
1.004764, -0.05118026, 1.768347, 0.9960784, 0, 1, 1,
1.012384, -1.203128, 2.430524, 1, 0, 0.9960784, 1,
1.014329, 0.1904698, 2.685804, 1, 0, 0.9882353, 1,
1.01598, -0.5149804, 3.548898, 1, 0, 0.9843137, 1,
1.016174, -0.2762414, 0.4883924, 1, 0, 0.9764706, 1,
1.021327, -0.7490637, 1.900278, 1, 0, 0.972549, 1,
1.022146, 0.07441196, 0.899433, 1, 0, 0.9647059, 1,
1.023545, 1.48583, -0.223656, 1, 0, 0.9607843, 1,
1.02712, 1.935739, 0.484524, 1, 0, 0.9529412, 1,
1.027824, 1.33758, 2.031342, 1, 0, 0.9490196, 1,
1.029213, 0.2528001, 0.5507864, 1, 0, 0.9411765, 1,
1.032543, 0.1411363, 2.588247, 1, 0, 0.9372549, 1,
1.038047, 1.404188, -0.8186693, 1, 0, 0.9294118, 1,
1.044552, -1.363523, 2.584435, 1, 0, 0.9254902, 1,
1.045285, -0.7647868, 1.931078, 1, 0, 0.9176471, 1,
1.045459, -0.4881899, 1.261298, 1, 0, 0.9137255, 1,
1.045747, -0.1577878, 1.303086, 1, 0, 0.9058824, 1,
1.05166, 0.7530468, 3.102885, 1, 0, 0.9019608, 1,
1.05309, -0.3006946, 3.996547, 1, 0, 0.8941177, 1,
1.059235, -0.1748471, 1.553571, 1, 0, 0.8862745, 1,
1.062509, 0.7447228, 0.6586997, 1, 0, 0.8823529, 1,
1.068027, -0.4040408, 3.150122, 1, 0, 0.8745098, 1,
1.108751, -2.102508, 1.898902, 1, 0, 0.8705882, 1,
1.110365, -0.1204251, 1.819397, 1, 0, 0.8627451, 1,
1.110801, -0.6147656, 0.7834325, 1, 0, 0.8588235, 1,
1.112282, -1.823647, 2.248994, 1, 0, 0.8509804, 1,
1.115686, 0.9625068, 1.118594, 1, 0, 0.8470588, 1,
1.121904, -0.3812284, 3.078453, 1, 0, 0.8392157, 1,
1.124959, -0.6145042, 0.9810958, 1, 0, 0.8352941, 1,
1.130083, -0.4119048, 3.718061, 1, 0, 0.827451, 1,
1.13433, 1.064891, -1.582857, 1, 0, 0.8235294, 1,
1.13452, -0.08562876, -1.444893, 1, 0, 0.8156863, 1,
1.136744, 0.1256803, 1.869842, 1, 0, 0.8117647, 1,
1.154854, 2.085347, 1.074458, 1, 0, 0.8039216, 1,
1.157064, -0.9790103, 1.735958, 1, 0, 0.7960784, 1,
1.161113, -0.1509573, 0.1845359, 1, 0, 0.7921569, 1,
1.161778, 1.652836, 0.8997102, 1, 0, 0.7843137, 1,
1.172542, -0.3999815, 3.022514, 1, 0, 0.7803922, 1,
1.173946, 0.1444671, 0.6121985, 1, 0, 0.772549, 1,
1.174071, -0.4796296, 0.0460007, 1, 0, 0.7686275, 1,
1.17675, 0.2945794, 2.13316, 1, 0, 0.7607843, 1,
1.181796, 0.9399813, 1.454388, 1, 0, 0.7568628, 1,
1.196039, 0.1607417, 1.255197, 1, 0, 0.7490196, 1,
1.203831, -0.5703771, 1.080174, 1, 0, 0.7450981, 1,
1.204149, 0.0211695, 1.319445, 1, 0, 0.7372549, 1,
1.205781, -0.2152966, 2.260334, 1, 0, 0.7333333, 1,
1.20634, 0.6786507, 2.038321, 1, 0, 0.7254902, 1,
1.206691, -0.1169517, 2.258065, 1, 0, 0.7215686, 1,
1.207979, 0.5744182, 1.521829, 1, 0, 0.7137255, 1,
1.213047, -0.4318105, 2.535619, 1, 0, 0.7098039, 1,
1.214105, -0.4792231, 2.552596, 1, 0, 0.7019608, 1,
1.219184, 0.001334573, 2.680347, 1, 0, 0.6941177, 1,
1.225965, 0.246941, 1.984523, 1, 0, 0.6901961, 1,
1.226355, 0.02402684, 1.860301, 1, 0, 0.682353, 1,
1.231807, -0.7836583, 3.516978, 1, 0, 0.6784314, 1,
1.240026, -0.3366743, 2.668012, 1, 0, 0.6705883, 1,
1.240504, -1.383725, 0.1194666, 1, 0, 0.6666667, 1,
1.247006, 0.2693868, 2.840147, 1, 0, 0.6588235, 1,
1.265989, -2.040194, 2.409996, 1, 0, 0.654902, 1,
1.272387, 0.9521749, 0.7743044, 1, 0, 0.6470588, 1,
1.274625, 0.3560998, 2.792682, 1, 0, 0.6431373, 1,
1.279568, 1.112807, 1.414797, 1, 0, 0.6352941, 1,
1.285733, -0.5579865, 3.622316, 1, 0, 0.6313726, 1,
1.287139, -0.09788819, 0.1206424, 1, 0, 0.6235294, 1,
1.290863, 0.8316141, 1.633817, 1, 0, 0.6196079, 1,
1.294173, -0.722514, 4.57228, 1, 0, 0.6117647, 1,
1.296651, 2.07674, 0.2068553, 1, 0, 0.6078432, 1,
1.29704, 0.2181916, 0.7414262, 1, 0, 0.6, 1,
1.300464, -1.321375, 2.586066, 1, 0, 0.5921569, 1,
1.300988, 0.1509823, 0.6836247, 1, 0, 0.5882353, 1,
1.302983, -0.7364886, 1.727606, 1, 0, 0.5803922, 1,
1.311634, 0.08081548, 2.272804, 1, 0, 0.5764706, 1,
1.314172, 1.704825, 1.026301, 1, 0, 0.5686275, 1,
1.316371, -1.313742, 0.6614076, 1, 0, 0.5647059, 1,
1.325846, -0.7439836, 1.445449, 1, 0, 0.5568628, 1,
1.326893, -0.6252374, 0.4741849, 1, 0, 0.5529412, 1,
1.333774, 0.8749326, -0.5963677, 1, 0, 0.5450981, 1,
1.334175, 1.313546, 2.002253, 1, 0, 0.5411765, 1,
1.33972, -1.586384, 1.910825, 1, 0, 0.5333334, 1,
1.340623, 0.6539336, 2.673346, 1, 0, 0.5294118, 1,
1.347237, 1.197979, 1.157811, 1, 0, 0.5215687, 1,
1.356836, 1.512947, -1.1841, 1, 0, 0.5176471, 1,
1.365594, -0.769634, 0.5858102, 1, 0, 0.509804, 1,
1.36877, 0.653084, 0.7936342, 1, 0, 0.5058824, 1,
1.370469, 1.180398, -0.716731, 1, 0, 0.4980392, 1,
1.372409, 0.7466438, 2.874139, 1, 0, 0.4901961, 1,
1.380545, 0.1596433, 2.722176, 1, 0, 0.4862745, 1,
1.395007, 0.9898661, 0.4456429, 1, 0, 0.4784314, 1,
1.395391, 0.777137, -0.2576557, 1, 0, 0.4745098, 1,
1.397198, -0.1536582, 3.143101, 1, 0, 0.4666667, 1,
1.406691, 0.4719032, 1.210802, 1, 0, 0.4627451, 1,
1.409032, -0.4554815, 1.086731, 1, 0, 0.454902, 1,
1.412689, 0.1925448, 2.085968, 1, 0, 0.4509804, 1,
1.413432, 0.237311, 1.557467, 1, 0, 0.4431373, 1,
1.43538, 0.4466093, 1.343163, 1, 0, 0.4392157, 1,
1.440114, -1.503291, 2.045826, 1, 0, 0.4313726, 1,
1.442373, -1.33467, 2.433853, 1, 0, 0.427451, 1,
1.445244, 0.6246045, 2.162786, 1, 0, 0.4196078, 1,
1.452524, -0.6491501, 1.048487, 1, 0, 0.4156863, 1,
1.461812, -1.315511, 0.8716761, 1, 0, 0.4078431, 1,
1.481509, -0.1261117, 1.966765, 1, 0, 0.4039216, 1,
1.500247, 0.6152706, 1.735548, 1, 0, 0.3960784, 1,
1.503918, -0.585936, 2.435426, 1, 0, 0.3882353, 1,
1.507668, 0.9080037, 2.019043, 1, 0, 0.3843137, 1,
1.507812, -0.01858395, 2.363275, 1, 0, 0.3764706, 1,
1.510654, 0.5398317, 0.4789569, 1, 0, 0.372549, 1,
1.521723, 0.6459205, -0.3524526, 1, 0, 0.3647059, 1,
1.523332, -1.813523, 3.044376, 1, 0, 0.3607843, 1,
1.524369, 1.972856, 2.837126, 1, 0, 0.3529412, 1,
1.524556, -0.5362101, 3.022657, 1, 0, 0.3490196, 1,
1.545745, -1.095725, 1.212924, 1, 0, 0.3411765, 1,
1.550146, -0.1567001, 2.117519, 1, 0, 0.3372549, 1,
1.559422, -0.9050982, 2.218907, 1, 0, 0.3294118, 1,
1.56275, -1.930419, 0.8603587, 1, 0, 0.3254902, 1,
1.590474, -1.141016, 2.613363, 1, 0, 0.3176471, 1,
1.599935, 1.69466, 0.8021169, 1, 0, 0.3137255, 1,
1.609255, -0.2520981, 1.20456, 1, 0, 0.3058824, 1,
1.612928, -0.5032038, 2.115619, 1, 0, 0.2980392, 1,
1.615838, 0.5706128, 1.972667, 1, 0, 0.2941177, 1,
1.634358, -1.029289, 1.762903, 1, 0, 0.2862745, 1,
1.642794, 0.3487801, 2.165434, 1, 0, 0.282353, 1,
1.662621, 1.506877, 0.6165341, 1, 0, 0.2745098, 1,
1.667216, 0.1207767, 0.6303433, 1, 0, 0.2705882, 1,
1.682878, 0.6813458, 2.030813, 1, 0, 0.2627451, 1,
1.686081, 1.401336, 2.889534, 1, 0, 0.2588235, 1,
1.694107, 0.07076838, 1.56074, 1, 0, 0.2509804, 1,
1.710693, -0.9382502, 1.210658, 1, 0, 0.2470588, 1,
1.725888, 0.9465621, 0.8330976, 1, 0, 0.2392157, 1,
1.729977, -0.9670319, 2.69438, 1, 0, 0.2352941, 1,
1.744341, 0.8241595, 2.626411, 1, 0, 0.227451, 1,
1.749191, -0.6151322, 0.8360005, 1, 0, 0.2235294, 1,
1.75062, -1.718106, 2.212984, 1, 0, 0.2156863, 1,
1.793041, -0.1903067, 1.001302, 1, 0, 0.2117647, 1,
1.811793, -0.8809372, 2.08685, 1, 0, 0.2039216, 1,
1.815721, -0.2360854, 0.5675412, 1, 0, 0.1960784, 1,
1.829093, -0.009288227, 4.065746, 1, 0, 0.1921569, 1,
1.847794, -0.3111846, 0.4815803, 1, 0, 0.1843137, 1,
1.849648, -0.7433518, 3.640275, 1, 0, 0.1803922, 1,
1.867536, 1.306926, 1.231432, 1, 0, 0.172549, 1,
1.883185, -0.6237456, 2.194258, 1, 0, 0.1686275, 1,
1.884328, 1.701706, -0.8195324, 1, 0, 0.1607843, 1,
1.887055, -0.05297315, 1.817496, 1, 0, 0.1568628, 1,
1.922231, -1.765535, 0.3890001, 1, 0, 0.1490196, 1,
1.968334, -0.5285312, 1.620006, 1, 0, 0.145098, 1,
1.971383, -0.7482754, 2.605402, 1, 0, 0.1372549, 1,
1.973673, -1.541048, 1.134948, 1, 0, 0.1333333, 1,
2.040721, 0.6802734, 1.012466, 1, 0, 0.1254902, 1,
2.067238, 0.0958355, 1.720432, 1, 0, 0.1215686, 1,
2.068423, 0.5699323, 3.188458, 1, 0, 0.1137255, 1,
2.070675, -1.496942, 3.633195, 1, 0, 0.1098039, 1,
2.08416, 0.2739207, 0.424533, 1, 0, 0.1019608, 1,
2.110789, -0.6087076, 2.549929, 1, 0, 0.09411765, 1,
2.122058, -0.08463624, 2.756608, 1, 0, 0.09019608, 1,
2.248526, 0.2961456, 3.753319, 1, 0, 0.08235294, 1,
2.259657, 1.700325, 1.241431, 1, 0, 0.07843138, 1,
2.279068, -0.3289107, 2.704828, 1, 0, 0.07058824, 1,
2.322672, -0.3730667, 0.4348453, 1, 0, 0.06666667, 1,
2.354798, -0.1395253, 1.187797, 1, 0, 0.05882353, 1,
2.45623, 0.3796175, 2.033855, 1, 0, 0.05490196, 1,
2.532688, 0.5959296, 0.6626178, 1, 0, 0.04705882, 1,
2.549498, -0.3000806, 0.7808287, 1, 0, 0.04313726, 1,
2.572951, 0.1763862, 1.709956, 1, 0, 0.03529412, 1,
2.573671, -1.360428, 3.093037, 1, 0, 0.03137255, 1,
2.807571, 0.04615444, 1.333786, 1, 0, 0.02352941, 1,
2.859591, 0.2072751, 2.119571, 1, 0, 0.01960784, 1,
2.901202, -1.120118, 1.409571, 1, 0, 0.01176471, 1,
3.88126, -0.614235, 0.4927886, 1, 0, 0.007843138, 1
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
0.2634023, -3.741451, -7.481925, 0, -0.5, 0.5, 0.5,
0.2634023, -3.741451, -7.481925, 1, -0.5, 0.5, 0.5,
0.2634023, -3.741451, -7.481925, 1, 1.5, 0.5, 0.5,
0.2634023, -3.741451, -7.481925, 0, 1.5, 0.5, 0.5
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
-4.580909, 0.3818792, -7.481925, 0, -0.5, 0.5, 0.5,
-4.580909, 0.3818792, -7.481925, 1, -0.5, 0.5, 0.5,
-4.580909, 0.3818792, -7.481925, 1, 1.5, 0.5, 0.5,
-4.580909, 0.3818792, -7.481925, 0, 1.5, 0.5, 0.5
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
-4.580909, -3.741451, 0.3637741, 0, -0.5, 0.5, 0.5,
-4.580909, -3.741451, 0.3637741, 1, -0.5, 0.5, 0.5,
-4.580909, -3.741451, 0.3637741, 1, 1.5, 0.5, 0.5,
-4.580909, -3.741451, 0.3637741, 0, 1.5, 0.5, 0.5
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
-2, -2.789913, -5.67138,
2, -2.789913, -5.67138,
-2, -2.789913, -5.67138,
-2, -2.948503, -5.973137,
0, -2.789913, -5.67138,
0, -2.948503, -5.973137,
2, -2.789913, -5.67138,
2, -2.948503, -5.973137
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
"0",
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
-2, -3.265682, -6.576653, 0, -0.5, 0.5, 0.5,
-2, -3.265682, -6.576653, 1, -0.5, 0.5, 0.5,
-2, -3.265682, -6.576653, 1, 1.5, 0.5, 0.5,
-2, -3.265682, -6.576653, 0, 1.5, 0.5, 0.5,
0, -3.265682, -6.576653, 0, -0.5, 0.5, 0.5,
0, -3.265682, -6.576653, 1, -0.5, 0.5, 0.5,
0, -3.265682, -6.576653, 1, 1.5, 0.5, 0.5,
0, -3.265682, -6.576653, 0, 1.5, 0.5, 0.5,
2, -3.265682, -6.576653, 0, -0.5, 0.5, 0.5,
2, -3.265682, -6.576653, 1, -0.5, 0.5, 0.5,
2, -3.265682, -6.576653, 1, 1.5, 0.5, 0.5,
2, -3.265682, -6.576653, 0, 1.5, 0.5, 0.5
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
-3.462991, -2, -5.67138,
-3.462991, 3, -5.67138,
-3.462991, -2, -5.67138,
-3.64931, -2, -5.973137,
-3.462991, -1, -5.67138,
-3.64931, -1, -5.973137,
-3.462991, 0, -5.67138,
-3.64931, 0, -5.973137,
-3.462991, 1, -5.67138,
-3.64931, 1, -5.973137,
-3.462991, 2, -5.67138,
-3.64931, 2, -5.973137,
-3.462991, 3, -5.67138,
-3.64931, 3, -5.973137
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
-4.02195, -2, -6.576653, 0, -0.5, 0.5, 0.5,
-4.02195, -2, -6.576653, 1, -0.5, 0.5, 0.5,
-4.02195, -2, -6.576653, 1, 1.5, 0.5, 0.5,
-4.02195, -2, -6.576653, 0, 1.5, 0.5, 0.5,
-4.02195, -1, -6.576653, 0, -0.5, 0.5, 0.5,
-4.02195, -1, -6.576653, 1, -0.5, 0.5, 0.5,
-4.02195, -1, -6.576653, 1, 1.5, 0.5, 0.5,
-4.02195, -1, -6.576653, 0, 1.5, 0.5, 0.5,
-4.02195, 0, -6.576653, 0, -0.5, 0.5, 0.5,
-4.02195, 0, -6.576653, 1, -0.5, 0.5, 0.5,
-4.02195, 0, -6.576653, 1, 1.5, 0.5, 0.5,
-4.02195, 0, -6.576653, 0, 1.5, 0.5, 0.5,
-4.02195, 1, -6.576653, 0, -0.5, 0.5, 0.5,
-4.02195, 1, -6.576653, 1, -0.5, 0.5, 0.5,
-4.02195, 1, -6.576653, 1, 1.5, 0.5, 0.5,
-4.02195, 1, -6.576653, 0, 1.5, 0.5, 0.5,
-4.02195, 2, -6.576653, 0, -0.5, 0.5, 0.5,
-4.02195, 2, -6.576653, 1, -0.5, 0.5, 0.5,
-4.02195, 2, -6.576653, 1, 1.5, 0.5, 0.5,
-4.02195, 2, -6.576653, 0, 1.5, 0.5, 0.5,
-4.02195, 3, -6.576653, 0, -0.5, 0.5, 0.5,
-4.02195, 3, -6.576653, 1, -0.5, 0.5, 0.5,
-4.02195, 3, -6.576653, 1, 1.5, 0.5, 0.5,
-4.02195, 3, -6.576653, 0, 1.5, 0.5, 0.5
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
-3.462991, -2.789913, -4,
-3.462991, -2.789913, 6,
-3.462991, -2.789913, -4,
-3.64931, -2.948503, -4,
-3.462991, -2.789913, -2,
-3.64931, -2.948503, -2,
-3.462991, -2.789913, 0,
-3.64931, -2.948503, 0,
-3.462991, -2.789913, 2,
-3.64931, -2.948503, 2,
-3.462991, -2.789913, 4,
-3.64931, -2.948503, 4,
-3.462991, -2.789913, 6,
-3.64931, -2.948503, 6
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
-4.02195, -3.265682, -4, 0, -0.5, 0.5, 0.5,
-4.02195, -3.265682, -4, 1, -0.5, 0.5, 0.5,
-4.02195, -3.265682, -4, 1, 1.5, 0.5, 0.5,
-4.02195, -3.265682, -4, 0, 1.5, 0.5, 0.5,
-4.02195, -3.265682, -2, 0, -0.5, 0.5, 0.5,
-4.02195, -3.265682, -2, 1, -0.5, 0.5, 0.5,
-4.02195, -3.265682, -2, 1, 1.5, 0.5, 0.5,
-4.02195, -3.265682, -2, 0, 1.5, 0.5, 0.5,
-4.02195, -3.265682, 0, 0, -0.5, 0.5, 0.5,
-4.02195, -3.265682, 0, 1, -0.5, 0.5, 0.5,
-4.02195, -3.265682, 0, 1, 1.5, 0.5, 0.5,
-4.02195, -3.265682, 0, 0, 1.5, 0.5, 0.5,
-4.02195, -3.265682, 2, 0, -0.5, 0.5, 0.5,
-4.02195, -3.265682, 2, 1, -0.5, 0.5, 0.5,
-4.02195, -3.265682, 2, 1, 1.5, 0.5, 0.5,
-4.02195, -3.265682, 2, 0, 1.5, 0.5, 0.5,
-4.02195, -3.265682, 4, 0, -0.5, 0.5, 0.5,
-4.02195, -3.265682, 4, 1, -0.5, 0.5, 0.5,
-4.02195, -3.265682, 4, 1, 1.5, 0.5, 0.5,
-4.02195, -3.265682, 4, 0, 1.5, 0.5, 0.5,
-4.02195, -3.265682, 6, 0, -0.5, 0.5, 0.5,
-4.02195, -3.265682, 6, 1, -0.5, 0.5, 0.5,
-4.02195, -3.265682, 6, 1, 1.5, 0.5, 0.5,
-4.02195, -3.265682, 6, 0, 1.5, 0.5, 0.5
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
-3.462991, -2.789913, -5.67138,
-3.462991, 3.553672, -5.67138,
-3.462991, -2.789913, 6.398928,
-3.462991, 3.553672, 6.398928,
-3.462991, -2.789913, -5.67138,
-3.462991, -2.789913, 6.398928,
-3.462991, 3.553672, -5.67138,
-3.462991, 3.553672, 6.398928,
-3.462991, -2.789913, -5.67138,
3.989795, -2.789913, -5.67138,
-3.462991, -2.789913, 6.398928,
3.989795, -2.789913, 6.398928,
-3.462991, 3.553672, -5.67138,
3.989795, 3.553672, -5.67138,
-3.462991, 3.553672, 6.398928,
3.989795, 3.553672, 6.398928,
3.989795, -2.789913, -5.67138,
3.989795, 3.553672, -5.67138,
3.989795, -2.789913, 6.398928,
3.989795, 3.553672, 6.398928,
3.989795, -2.789913, -5.67138,
3.989795, -2.789913, 6.398928,
3.989795, 3.553672, -5.67138,
3.989795, 3.553672, 6.398928
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
var radius = 8.297814;
var distance = 36.91791;
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
mvMatrix.translate( -0.2634023, -0.3818792, -0.3637741 );
mvMatrix.scale( 1.203813, 1.414304, 0.7432917 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.91791);
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
gl.drawArrays(gl.LINES, 0, 8);
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
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
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
inabenfide<-read.table("inabenfide.xyz")
```

```
## Error in read.table("inabenfide.xyz"): no lines available in input
```

```r
x<-inabenfide$V2
```

```
## Error in eval(expr, envir, enclos): object 'inabenfide' not found
```

```r
y<-inabenfide$V3
```

```
## Error in eval(expr, envir, enclos): object 'inabenfide' not found
```

```r
z<-inabenfide$V4
```

```
## Error in eval(expr, envir, enclos): object 'inabenfide' not found
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
-3.354455, -0.08122286, 0.3852839, 0, 0, 1, 1, 1,
-3.115127, -2.006227, -2.559645, 1, 0, 0, 1, 1,
-3.011421, 0.238759, -1.782357, 1, 0, 0, 1, 1,
-2.714281, 1.852457, -2.408613, 1, 0, 0, 1, 1,
-2.673244, 0.9294083, -0.1428036, 1, 0, 0, 1, 1,
-2.391143, -1.295356, -1.768236, 1, 0, 0, 1, 1,
-2.381477, 0.7973517, -1.599978, 0, 0, 0, 1, 1,
-2.326684, 0.9187631, -1.455382, 0, 0, 0, 1, 1,
-2.295742, -1.11037, 0.2640494, 0, 0, 0, 1, 1,
-2.265294, -1.495488, -1.821281, 0, 0, 0, 1, 1,
-2.226735, 0.06775957, -1.409391, 0, 0, 0, 1, 1,
-2.153235, -0.1117558, -1.360928, 0, 0, 0, 1, 1,
-2.137905, -0.09587275, -1.269724, 0, 0, 0, 1, 1,
-2.068022, -1.218973, -3.105494, 1, 1, 1, 1, 1,
-2.051121, 0.1345953, -1.711007, 1, 1, 1, 1, 1,
-2.035457, -0.3100195, -1.637503, 1, 1, 1, 1, 1,
-2.03094, 0.1024524, -2.013131, 1, 1, 1, 1, 1,
-1.996289, -1.634977, -2.635759, 1, 1, 1, 1, 1,
-1.989481, -2.015777, -2.630629, 1, 1, 1, 1, 1,
-1.979362, 0.05203283, 0.06470881, 1, 1, 1, 1, 1,
-1.97917, 0.5645408, -1.109033, 1, 1, 1, 1, 1,
-1.969922, 1.239855, 1.000255, 1, 1, 1, 1, 1,
-1.95722, -0.84024, -1.58421, 1, 1, 1, 1, 1,
-1.948152, -0.3745493, -1.61192, 1, 1, 1, 1, 1,
-1.936531, 0.9880808, -0.01121887, 1, 1, 1, 1, 1,
-1.922782, -0.5030336, -3.397923, 1, 1, 1, 1, 1,
-1.922151, 1.223151, -1.103456, 1, 1, 1, 1, 1,
-1.909721, -0.1435715, -0.1148001, 1, 1, 1, 1, 1,
-1.896713, 1.441088, -1.109145, 0, 0, 1, 1, 1,
-1.862711, 0.8163916, -1.417205, 1, 0, 0, 1, 1,
-1.862239, 0.1598594, -1.309926, 1, 0, 0, 1, 1,
-1.858114, 0.1286556, -1.837358, 1, 0, 0, 1, 1,
-1.849051, 0.6400362, 0.2271157, 1, 0, 0, 1, 1,
-1.845378, 0.5192994, 0.7189056, 1, 0, 0, 1, 1,
-1.774166, 0.1023227, -3.149232, 0, 0, 0, 1, 1,
-1.746725, -0.1096921, -1.898538, 0, 0, 0, 1, 1,
-1.744546, 0.3270331, -1.800804, 0, 0, 0, 1, 1,
-1.730274, -0.06696668, -3.009027, 0, 0, 0, 1, 1,
-1.715813, 0.9118446, -1.280074, 0, 0, 0, 1, 1,
-1.713024, -0.2211006, -2.584164, 0, 0, 0, 1, 1,
-1.707248, 0.6036175, -1.688863, 0, 0, 0, 1, 1,
-1.693393, 1.77978, -1.496909, 1, 1, 1, 1, 1,
-1.691979, 1.812034, 1.122507, 1, 1, 1, 1, 1,
-1.691797, -0.6302915, -0.2852831, 1, 1, 1, 1, 1,
-1.686598, 0.6955001, -0.6283941, 1, 1, 1, 1, 1,
-1.674463, -0.739693, -2.239545, 1, 1, 1, 1, 1,
-1.666047, -0.9101504, -1.532602, 1, 1, 1, 1, 1,
-1.656731, -1.07322, -2.952306, 1, 1, 1, 1, 1,
-1.652827, 1.111184, -0.07916252, 1, 1, 1, 1, 1,
-1.649921, -0.7710113, -2.261841, 1, 1, 1, 1, 1,
-1.643494, -0.4864378, -2.261251, 1, 1, 1, 1, 1,
-1.621388, 0.8355929, -0.6293439, 1, 1, 1, 1, 1,
-1.600061, -0.7997835, -1.303846, 1, 1, 1, 1, 1,
-1.599916, 0.08905568, -2.483807, 1, 1, 1, 1, 1,
-1.582324, -2.244667, -4.484594, 1, 1, 1, 1, 1,
-1.574584, 0.1681751, -1.17626, 1, 1, 1, 1, 1,
-1.56831, -1.529652, -2.791742, 0, 0, 1, 1, 1,
-1.553641, 0.1724425, -0.2836133, 1, 0, 0, 1, 1,
-1.552942, 0.001359805, -0.8643232, 1, 0, 0, 1, 1,
-1.535291, 1.075776, -0.2020915, 1, 0, 0, 1, 1,
-1.530544, 1.195699, -2.000115, 1, 0, 0, 1, 1,
-1.527895, -0.7758991, -2.087429, 1, 0, 0, 1, 1,
-1.520523, 2.032953, -2.495226, 0, 0, 0, 1, 1,
-1.520039, -0.2931507, -1.048456, 0, 0, 0, 1, 1,
-1.515514, 0.4030231, -1.256703, 0, 0, 0, 1, 1,
-1.502525, 0.03013336, -1.698064, 0, 0, 0, 1, 1,
-1.495969, -0.3654853, -1.58127, 0, 0, 0, 1, 1,
-1.492344, -1.656366, -3.207624, 0, 0, 0, 1, 1,
-1.485263, -0.6568949, -3.036948, 0, 0, 0, 1, 1,
-1.481357, -0.2884932, -1.973859, 1, 1, 1, 1, 1,
-1.47696, -0.3976448, -1.910598, 1, 1, 1, 1, 1,
-1.475344, -1.569785, -4.727198, 1, 1, 1, 1, 1,
-1.474239, 1.268874, -0.2668464, 1, 1, 1, 1, 1,
-1.47387, -0.1199591, -2.266044, 1, 1, 1, 1, 1,
-1.471932, 0.9811404, 1.895288, 1, 1, 1, 1, 1,
-1.466196, -0.7610537, -1.30125, 1, 1, 1, 1, 1,
-1.461159, 1.375064, -1.206936, 1, 1, 1, 1, 1,
-1.457824, -1.122236, -2.210044, 1, 1, 1, 1, 1,
-1.449872, -0.8543817, -1.196222, 1, 1, 1, 1, 1,
-1.437409, 0.459503, -1.291197, 1, 1, 1, 1, 1,
-1.433986, -0.1151678, -3.061926, 1, 1, 1, 1, 1,
-1.43081, -0.863736, -1.113276, 1, 1, 1, 1, 1,
-1.424957, 1.432609, -0.09088163, 1, 1, 1, 1, 1,
-1.420361, 1.135284, -0.8240798, 1, 1, 1, 1, 1,
-1.405716, 1.539992, -1.380293, 0, 0, 1, 1, 1,
-1.403958, 0.0629888, -0.6009405, 1, 0, 0, 1, 1,
-1.395994, 0.2422125, -2.235733, 1, 0, 0, 1, 1,
-1.369364, -0.4789631, -3.025454, 1, 0, 0, 1, 1,
-1.354415, -0.9032835, -2.220551, 1, 0, 0, 1, 1,
-1.350436, -1.564201, -2.719795, 1, 0, 0, 1, 1,
-1.347083, 0.1127448, -0.5607307, 0, 0, 0, 1, 1,
-1.346193, -1.156464, -2.06062, 0, 0, 0, 1, 1,
-1.344757, -0.7058542, -2.672875, 0, 0, 0, 1, 1,
-1.342522, 0.7517565, 0.170127, 0, 0, 0, 1, 1,
-1.338283, 0.4094057, -2.559707, 0, 0, 0, 1, 1,
-1.31859, -1.310391, -2.195195, 0, 0, 0, 1, 1,
-1.311494, -1.409089, -1.525144, 0, 0, 0, 1, 1,
-1.30091, -0.3284069, -1.188683, 1, 1, 1, 1, 1,
-1.299859, -1.724682, -3.305426, 1, 1, 1, 1, 1,
-1.297649, 0.9921416, -0.6219873, 1, 1, 1, 1, 1,
-1.289992, 0.4059311, -0.2442424, 1, 1, 1, 1, 1,
-1.278709, -0.3556218, -1.954592, 1, 1, 1, 1, 1,
-1.275357, 1.120934, 0.006693758, 1, 1, 1, 1, 1,
-1.274251, -1.304363, -2.08281, 1, 1, 1, 1, 1,
-1.271072, -2.697531, -2.018581, 1, 1, 1, 1, 1,
-1.259073, -1.440747, -3.937959, 1, 1, 1, 1, 1,
-1.256664, 0.09069627, -1.999118, 1, 1, 1, 1, 1,
-1.255195, 0.2707427, -2.030371, 1, 1, 1, 1, 1,
-1.255013, -0.05356203, -2.079448, 1, 1, 1, 1, 1,
-1.243413, -0.7428848, -0.3891289, 1, 1, 1, 1, 1,
-1.241474, -1.006129, -1.464979, 1, 1, 1, 1, 1,
-1.239853, -1.238273, -2.109473, 1, 1, 1, 1, 1,
-1.237212, 1.186861, -0.6557307, 0, 0, 1, 1, 1,
-1.225515, 1.338597, -1.107802, 1, 0, 0, 1, 1,
-1.219696, -0.8772367, -2.734894, 1, 0, 0, 1, 1,
-1.204566, 0.4563264, -1.814352, 1, 0, 0, 1, 1,
-1.190878, -0.4928703, -0.8764837, 1, 0, 0, 1, 1,
-1.177804, -1.218755, -3.734807, 1, 0, 0, 1, 1,
-1.171951, 0.757939, -2.047756, 0, 0, 0, 1, 1,
-1.171367, -0.8291863, -1.902856, 0, 0, 0, 1, 1,
-1.162187, 0.4941568, -1.477218, 0, 0, 0, 1, 1,
-1.147557, -0.3730288, -3.522776, 0, 0, 0, 1, 1,
-1.14618, 0.7433426, -0.5897154, 0, 0, 0, 1, 1,
-1.142266, -1.891994, -1.49103, 0, 0, 0, 1, 1,
-1.133814, 0.683137, -0.844057, 0, 0, 0, 1, 1,
-1.130468, -1.843554, -2.758553, 1, 1, 1, 1, 1,
-1.123791, -0.2345008, -1.83001, 1, 1, 1, 1, 1,
-1.118541, 0.1768562, -2.886788, 1, 1, 1, 1, 1,
-1.115652, -1.862435, -3.252075, 1, 1, 1, 1, 1,
-1.11536, -0.8906052, -3.581424, 1, 1, 1, 1, 1,
-1.112056, -1.067462, -2.131927, 1, 1, 1, 1, 1,
-1.111605, 0.6096163, -2.692706, 1, 1, 1, 1, 1,
-1.107531, 0.7044092, -0.005738961, 1, 1, 1, 1, 1,
-1.106976, -0.5106986, -0.7294948, 1, 1, 1, 1, 1,
-1.106272, -0.6935847, -1.775129, 1, 1, 1, 1, 1,
-1.10332, -0.7096093, -0.8109964, 1, 1, 1, 1, 1,
-1.102707, 0.6714363, -2.627766, 1, 1, 1, 1, 1,
-1.093409, -0.7944587, -0.580911, 1, 1, 1, 1, 1,
-1.085112, 1.312683, 0.6664139, 1, 1, 1, 1, 1,
-1.071615, -0.2001558, -2.308244, 1, 1, 1, 1, 1,
-1.065792, -0.1541954, -3.309861, 0, 0, 1, 1, 1,
-1.061193, 0.7678968, 0.1047176, 1, 0, 0, 1, 1,
-1.060036, -1.022122, -1.585721, 1, 0, 0, 1, 1,
-1.056694, -1.020369, -1.796527, 1, 0, 0, 1, 1,
-1.049759, -0.6456783, -1.904752, 1, 0, 0, 1, 1,
-1.027217, 3.095495, -1.146411, 1, 0, 0, 1, 1,
-1.025119, -0.1782374, 0.09807307, 0, 0, 0, 1, 1,
-1.017218, -1.17719, -2.628732, 0, 0, 0, 1, 1,
-1.015462, 0.03258329, -1.554732, 0, 0, 0, 1, 1,
-1.0139, -1.032412, -0.9841517, 0, 0, 0, 1, 1,
-1.012591, -0.5710602, -0.9748937, 0, 0, 0, 1, 1,
-1.008664, -0.3559742, -0.6912795, 0, 0, 0, 1, 1,
-1.002328, -0.8511013, -4.103053, 0, 0, 0, 1, 1,
-1.001875, -0.0736986, -1.575759, 1, 1, 1, 1, 1,
-1.001607, -0.8725495, -2.8808, 1, 1, 1, 1, 1,
-1.001582, 0.4578372, -1.613717, 1, 1, 1, 1, 1,
-0.9950124, 0.3398533, -1.401025, 1, 1, 1, 1, 1,
-0.9948047, 0.505482, -1.058171, 1, 1, 1, 1, 1,
-0.9933451, -0.4369376, -0.7720324, 1, 1, 1, 1, 1,
-0.9906166, -0.7581261, -3.496601, 1, 1, 1, 1, 1,
-0.9890683, -0.5213308, -4.058227, 1, 1, 1, 1, 1,
-0.9830168, 0.4470727, -0.2509339, 1, 1, 1, 1, 1,
-0.9795707, -1.325073, -1.182898, 1, 1, 1, 1, 1,
-0.9789671, 1.6225, -1.941246, 1, 1, 1, 1, 1,
-0.9754006, 1.130817, -2.523482, 1, 1, 1, 1, 1,
-0.9722447, 0.01897494, -0.8400844, 1, 1, 1, 1, 1,
-0.9703305, 0.590713, -1.835639, 1, 1, 1, 1, 1,
-0.9560689, 0.3821218, -1.496644, 1, 1, 1, 1, 1,
-0.951125, 0.727269, 0.4804512, 0, 0, 1, 1, 1,
-0.9476239, 1.331854, -1.705998, 1, 0, 0, 1, 1,
-0.9427738, 0.6422421, -0.02178172, 1, 0, 0, 1, 1,
-0.9359825, 0.636697, -0.5504696, 1, 0, 0, 1, 1,
-0.9265399, -1.164286, -3.200563, 1, 0, 0, 1, 1,
-0.924957, 0.1339853, -1.984021, 1, 0, 0, 1, 1,
-0.9221408, 0.2856838, -0.9053999, 0, 0, 0, 1, 1,
-0.9213562, 2.197538, -0.1944062, 0, 0, 0, 1, 1,
-0.9155174, 0.7246636, -2.155212, 0, 0, 0, 1, 1,
-0.9137883, 0.2523831, 0.7737939, 0, 0, 0, 1, 1,
-0.9122223, -1.424144, -2.083876, 0, 0, 0, 1, 1,
-0.910955, -0.1634322, -2.25069, 0, 0, 0, 1, 1,
-0.90862, -0.2137668, -3.274065, 0, 0, 0, 1, 1,
-0.9044149, 0.01025735, -1.991751, 1, 1, 1, 1, 1,
-0.904323, 1.740174, 0.1224733, 1, 1, 1, 1, 1,
-0.9012676, 1.482237, 0.6792023, 1, 1, 1, 1, 1,
-0.8994867, 1.840222, -2.318261, 1, 1, 1, 1, 1,
-0.8993653, -0.9341224, -2.658853, 1, 1, 1, 1, 1,
-0.8948576, -0.3518058, -1.125223, 1, 1, 1, 1, 1,
-0.8928164, 0.2079071, -1.831549, 1, 1, 1, 1, 1,
-0.8854787, 0.5301499, -0.223968, 1, 1, 1, 1, 1,
-0.8817933, -0.5141305, -2.33, 1, 1, 1, 1, 1,
-0.8813615, -1.199689, -2.902409, 1, 1, 1, 1, 1,
-0.8806485, -0.3403497, -1.899595, 1, 1, 1, 1, 1,
-0.8793518, -0.4237654, -1.672958, 1, 1, 1, 1, 1,
-0.8773755, -1.305162, -2.295927, 1, 1, 1, 1, 1,
-0.8744301, -0.0533761, -3.048764, 1, 1, 1, 1, 1,
-0.8718873, -1.295169, -2.512228, 1, 1, 1, 1, 1,
-0.8713984, 0.4904889, -1.777302, 0, 0, 1, 1, 1,
-0.863978, 0.6193608, -2.220419, 1, 0, 0, 1, 1,
-0.8593433, 1.299893, -1.021497, 1, 0, 0, 1, 1,
-0.8593431, -0.08445161, -4.01674, 1, 0, 0, 1, 1,
-0.858696, 0.3080642, -2.029381, 1, 0, 0, 1, 1,
-0.858444, 0.687208, 0.264708, 1, 0, 0, 1, 1,
-0.8459046, 0.1842063, -2.595009, 0, 0, 0, 1, 1,
-0.8428841, 0.9962213, 1.173387, 0, 0, 0, 1, 1,
-0.8398611, -1.784335, -2.800907, 0, 0, 0, 1, 1,
-0.839459, 2.753852, -0.1079352, 0, 0, 0, 1, 1,
-0.8379419, 2.286191, -0.5094426, 0, 0, 0, 1, 1,
-0.8360738, 2.768231, -0.6653759, 0, 0, 0, 1, 1,
-0.8358098, -0.2574058, -0.2306442, 0, 0, 0, 1, 1,
-0.8322408, 1.859621, -2.592149, 1, 1, 1, 1, 1,
-0.8275661, 0.8623428, -0.1153884, 1, 1, 1, 1, 1,
-0.8251275, -0.5232217, -2.600573, 1, 1, 1, 1, 1,
-0.8238512, 1.511267, -0.4280248, 1, 1, 1, 1, 1,
-0.8210822, -1.03876, -2.386271, 1, 1, 1, 1, 1,
-0.8112462, 0.1595592, -1.283777, 1, 1, 1, 1, 1,
-0.8066866, 1.891875, -0.6806926, 1, 1, 1, 1, 1,
-0.7978444, -2.082176, -2.73574, 1, 1, 1, 1, 1,
-0.792586, 0.1197077, -1.143109, 1, 1, 1, 1, 1,
-0.7885309, 1.791274, -0.8548137, 1, 1, 1, 1, 1,
-0.7852295, -0.4946296, -1.406044, 1, 1, 1, 1, 1,
-0.7778656, -1.660023, -1.653774, 1, 1, 1, 1, 1,
-0.7685443, 0.6965258, 0.1140051, 1, 1, 1, 1, 1,
-0.7674475, -1.071956, -2.016877, 1, 1, 1, 1, 1,
-0.7617841, 0.5981086, -0.3318082, 1, 1, 1, 1, 1,
-0.7599777, 0.8275638, -2.831505, 0, 0, 1, 1, 1,
-0.7599655, -0.0358172, -0.5239006, 1, 0, 0, 1, 1,
-0.7553023, 1.433177, -1.214058, 1, 0, 0, 1, 1,
-0.7501643, -1.387601, -2.829704, 1, 0, 0, 1, 1,
-0.749669, 0.1113241, -1.599703, 1, 0, 0, 1, 1,
-0.7433211, -0.4604656, -2.675192, 1, 0, 0, 1, 1,
-0.7431446, 0.2128761, -1.652675, 0, 0, 0, 1, 1,
-0.7414953, -0.4537691, -2.385548, 0, 0, 0, 1, 1,
-0.736982, -0.7264817, -1.969281, 0, 0, 0, 1, 1,
-0.7322055, -1.679438, -1.496098, 0, 0, 0, 1, 1,
-0.7316649, -0.5316523, -1.808932, 0, 0, 0, 1, 1,
-0.7249655, -0.1663293, -0.8138941, 0, 0, 0, 1, 1,
-0.7202705, 0.2476508, 0.01131725, 0, 0, 0, 1, 1,
-0.7183841, 0.3391581, -1.603705, 1, 1, 1, 1, 1,
-0.7157616, 1.890061, -1.958891, 1, 1, 1, 1, 1,
-0.7077061, 0.583116, 0.1785466, 1, 1, 1, 1, 1,
-0.7035418, -0.7693797, -3.48366, 1, 1, 1, 1, 1,
-0.7017089, -0.6450503, -1.919103, 1, 1, 1, 1, 1,
-0.6969363, -0.2145514, -2.133334, 1, 1, 1, 1, 1,
-0.6965672, -0.1061189, -3.476381, 1, 1, 1, 1, 1,
-0.6965539, -0.8194476, -0.786603, 1, 1, 1, 1, 1,
-0.6960572, -0.3772726, -1.4082, 1, 1, 1, 1, 1,
-0.6873257, 1.196499, 0.5415467, 1, 1, 1, 1, 1,
-0.6847871, 0.005805706, 0.09810185, 1, 1, 1, 1, 1,
-0.6802379, -0.4174397, -2.532299, 1, 1, 1, 1, 1,
-0.6765229, -0.899627, -4.425143, 1, 1, 1, 1, 1,
-0.6725073, 0.04919912, -0.8657119, 1, 1, 1, 1, 1,
-0.672077, 1.381018, -0.9993212, 1, 1, 1, 1, 1,
-0.6703342, -0.4190171, -3.009753, 0, 0, 1, 1, 1,
-0.666189, -1.196695, -4.449793, 1, 0, 0, 1, 1,
-0.6609445, -0.464168, -3.879806, 1, 0, 0, 1, 1,
-0.6596425, 0.9407676, -0.4616045, 1, 0, 0, 1, 1,
-0.6588652, 0.5033276, -0.7731735, 1, 0, 0, 1, 1,
-0.6574358, -0.5916895, -3.600594, 1, 0, 0, 1, 1,
-0.6500172, 0.658047, -1.407973, 0, 0, 0, 1, 1,
-0.6489263, 0.6399691, -0.795496, 0, 0, 0, 1, 1,
-0.6486115, -0.725365, -2.419007, 0, 0, 0, 1, 1,
-0.6484511, -0.5404717, -2.953583, 0, 0, 0, 1, 1,
-0.647851, 1.369482, -1.431926, 0, 0, 0, 1, 1,
-0.6465749, -1.302301, -2.734553, 0, 0, 0, 1, 1,
-0.6432441, -2.056364, -1.572401, 0, 0, 0, 1, 1,
-0.6365907, -0.2054078, -2.920522, 1, 1, 1, 1, 1,
-0.6318889, -1.156015, -2.974437, 1, 1, 1, 1, 1,
-0.6315372, -2.224504, -3.585161, 1, 1, 1, 1, 1,
-0.6290959, 0.02138608, -1.600512, 1, 1, 1, 1, 1,
-0.6217039, 1.463849, 0.8174785, 1, 1, 1, 1, 1,
-0.6214785, 0.5755698, -1.287658, 1, 1, 1, 1, 1,
-0.6208851, 0.8977895, -2.069846, 1, 1, 1, 1, 1,
-0.6089492, -0.1305899, -2.0622, 1, 1, 1, 1, 1,
-0.6071163, -0.3199327, -3.502185, 1, 1, 1, 1, 1,
-0.6039241, 0.4151537, -2.050336, 1, 1, 1, 1, 1,
-0.6022446, -0.01130221, -0.4296725, 1, 1, 1, 1, 1,
-0.6020902, -0.7012034, -4.544263, 1, 1, 1, 1, 1,
-0.6008914, 0.1560659, -2.085817, 1, 1, 1, 1, 1,
-0.5974037, 0.04627041, -1.341122, 1, 1, 1, 1, 1,
-0.5952407, 0.3044575, -0.8014669, 1, 1, 1, 1, 1,
-0.5941775, -0.5084589, -2.174342, 0, 0, 1, 1, 1,
-0.5916905, -0.266901, -1.730832, 1, 0, 0, 1, 1,
-0.5910265, -0.1945532, -3.016003, 1, 0, 0, 1, 1,
-0.5879114, -0.3978629, -1.892011, 1, 0, 0, 1, 1,
-0.5862236, 1.125571, -1.091468, 1, 0, 0, 1, 1,
-0.5860692, 0.4760296, -2.626222, 1, 0, 0, 1, 1,
-0.5837986, -0.7417164, -3.746487, 0, 0, 0, 1, 1,
-0.5812598, -0.4419782, -3.542768, 0, 0, 0, 1, 1,
-0.5798561, -0.1927577, -1.626943, 0, 0, 0, 1, 1,
-0.5745137, 1.178544, -0.8622272, 0, 0, 0, 1, 1,
-0.5724725, -0.5685529, -3.936447, 0, 0, 0, 1, 1,
-0.5615065, 1.42572, -0.004515836, 0, 0, 0, 1, 1,
-0.5597438, 0.9209027, -1.498741, 0, 0, 0, 1, 1,
-0.559679, -1.663065, -3.329833, 1, 1, 1, 1, 1,
-0.5539913, 0.1560162, -2.005572, 1, 1, 1, 1, 1,
-0.545875, 0.09476235, -2.957641, 1, 1, 1, 1, 1,
-0.5433279, 0.2299606, -0.5311542, 1, 1, 1, 1, 1,
-0.5408205, 1.045698, 0.4385615, 1, 1, 1, 1, 1,
-0.5392, 0.4395969, -1.583254, 1, 1, 1, 1, 1,
-0.5299054, -0.458658, -2.859772, 1, 1, 1, 1, 1,
-0.5296453, -0.05893576, -1.566253, 1, 1, 1, 1, 1,
-0.5262359, 0.942981, -2.40367, 1, 1, 1, 1, 1,
-0.5246621, 0.1144163, -2.646024, 1, 1, 1, 1, 1,
-0.5235279, 0.5559616, -0.4696918, 1, 1, 1, 1, 1,
-0.5232607, 1.459508, 1.272645, 1, 1, 1, 1, 1,
-0.5222042, -1.204199, -3.226011, 1, 1, 1, 1, 1,
-0.5216246, -0.1545298, -2.415034, 1, 1, 1, 1, 1,
-0.5205261, 0.08185108, -0.5705132, 1, 1, 1, 1, 1,
-0.5162643, -0.06346064, -1.165886, 0, 0, 1, 1, 1,
-0.5153164, 0.01298423, -0.01630108, 1, 0, 0, 1, 1,
-0.5152567, 0.2813575, -1.344364, 1, 0, 0, 1, 1,
-0.5151252, -1.014294, -1.013773, 1, 0, 0, 1, 1,
-0.5125259, 0.4642584, -1.276902, 1, 0, 0, 1, 1,
-0.4991154, 1.103525, -0.9616954, 1, 0, 0, 1, 1,
-0.4986444, 0.5796175, 0.614549, 0, 0, 0, 1, 1,
-0.4960865, -1.139177, -4.505878, 0, 0, 0, 1, 1,
-0.4938652, -0.5425857, -3.2179, 0, 0, 0, 1, 1,
-0.4883537, -0.1437095, -1.785281, 0, 0, 0, 1, 1,
-0.4860384, -1.171347, -1.799957, 0, 0, 0, 1, 1,
-0.4814587, 1.68787, -0.01480802, 0, 0, 0, 1, 1,
-0.4804637, -0.395033, -2.036624, 0, 0, 0, 1, 1,
-0.4789185, -0.07143029, -1.588326, 1, 1, 1, 1, 1,
-0.4762108, -0.3450966, -1.450968, 1, 1, 1, 1, 1,
-0.4757296, -0.08846347, -1.346853, 1, 1, 1, 1, 1,
-0.4754713, -0.7487443, -0.4299213, 1, 1, 1, 1, 1,
-0.467954, 1.337206, -1.165369, 1, 1, 1, 1, 1,
-0.466424, -0.2687249, -0.4212462, 1, 1, 1, 1, 1,
-0.4647273, -0.9306967, -1.658793, 1, 1, 1, 1, 1,
-0.4630253, 1.543753, 0.5388424, 1, 1, 1, 1, 1,
-0.4604686, -0.463971, -1.353777, 1, 1, 1, 1, 1,
-0.4594099, 0.07984494, -2.370442, 1, 1, 1, 1, 1,
-0.4585198, 0.5197106, -1.245456, 1, 1, 1, 1, 1,
-0.4550531, -0.7045648, -2.945318, 1, 1, 1, 1, 1,
-0.4535073, -0.1252566, -3.738616, 1, 1, 1, 1, 1,
-0.4534308, 0.1124379, -1.749727, 1, 1, 1, 1, 1,
-0.4473582, 0.2052577, -0.7594346, 1, 1, 1, 1, 1,
-0.4454763, 1.210364, -1.011795, 0, 0, 1, 1, 1,
-0.4451414, 1.177904, -0.1180913, 1, 0, 0, 1, 1,
-0.4384958, -1.437352, -2.330188, 1, 0, 0, 1, 1,
-0.4346888, -0.72742, -2.140108, 1, 0, 0, 1, 1,
-0.4323365, 0.9452552, -1.341253, 1, 0, 0, 1, 1,
-0.431606, -0.3297503, -1.312456, 1, 0, 0, 1, 1,
-0.4302802, -2.125288, -2.569814, 0, 0, 0, 1, 1,
-0.4244882, 2.61942, -0.6890197, 0, 0, 0, 1, 1,
-0.4210003, 0.1731903, -2.420458, 0, 0, 0, 1, 1,
-0.4131969, -0.4810786, -1.393534, 0, 0, 0, 1, 1,
-0.4131862, -0.6858807, -2.809281, 0, 0, 0, 1, 1,
-0.4118748, -0.1227428, -1.677697, 0, 0, 0, 1, 1,
-0.4056655, -0.4075872, -4.218089, 0, 0, 0, 1, 1,
-0.4051184, 1.024673, -0.7220309, 1, 1, 1, 1, 1,
-0.4043357, -0.08854979, -4.243167, 1, 1, 1, 1, 1,
-0.3986164, -0.5830441, -3.117809, 1, 1, 1, 1, 1,
-0.3985354, 0.550055, -0.1706219, 1, 1, 1, 1, 1,
-0.3977334, 0.6900327, -0.6197842, 1, 1, 1, 1, 1,
-0.3974269, 0.5670234, 0.5948656, 1, 1, 1, 1, 1,
-0.3932653, -0.812064, -2.797493, 1, 1, 1, 1, 1,
-0.3925492, 2.700081, -2.214319, 1, 1, 1, 1, 1,
-0.3858047, -0.2733912, -1.36124, 1, 1, 1, 1, 1,
-0.3820551, 1.098194, -0.6983898, 1, 1, 1, 1, 1,
-0.3816232, 0.2948815, -2.072327, 1, 1, 1, 1, 1,
-0.3811784, -0.4708472, -1.047109, 1, 1, 1, 1, 1,
-0.3802177, -0.5863638, -3.33041, 1, 1, 1, 1, 1,
-0.3797115, 0.3652021, -1.887587, 1, 1, 1, 1, 1,
-0.3726385, -1.976307, -2.226591, 1, 1, 1, 1, 1,
-0.3718762, -1.01556, -5.113896, 0, 0, 1, 1, 1,
-0.3708939, -0.08487498, -1.36819, 1, 0, 0, 1, 1,
-0.3699672, -0.01915558, -2.851335, 1, 0, 0, 1, 1,
-0.3680181, -1.820983, -3.238003, 1, 0, 0, 1, 1,
-0.3668444, 0.213676, -0.04264405, 1, 0, 0, 1, 1,
-0.3609689, -1.544077, -3.244442, 1, 0, 0, 1, 1,
-0.3587518, 0.6115572, -0.8185576, 0, 0, 0, 1, 1,
-0.3581064, 0.4324196, 0.6165982, 0, 0, 0, 1, 1,
-0.3566264, 0.3334646, -1.358323, 0, 0, 0, 1, 1,
-0.3528746, 0.09782393, -1.224949, 0, 0, 0, 1, 1,
-0.3472745, -0.8811265, -3.501265, 0, 0, 0, 1, 1,
-0.3453917, 1.00174, -0.2482747, 0, 0, 0, 1, 1,
-0.3431786, 0.4163134, 0.3381543, 0, 0, 0, 1, 1,
-0.34192, -0.6433102, -3.052157, 1, 1, 1, 1, 1,
-0.3405976, -0.4804137, -2.066392, 1, 1, 1, 1, 1,
-0.3400199, -0.02321531, -3.065918, 1, 1, 1, 1, 1,
-0.338217, 1.525704, -0.4802742, 1, 1, 1, 1, 1,
-0.3358072, -0.4023203, -2.806216, 1, 1, 1, 1, 1,
-0.333754, -0.1492066, -1.239004, 1, 1, 1, 1, 1,
-0.3310344, 1.772871, -0.007146674, 1, 1, 1, 1, 1,
-0.3283057, -1.135326, -3.532722, 1, 1, 1, 1, 1,
-0.325312, 0.7820264, -0.3371904, 1, 1, 1, 1, 1,
-0.3207875, 0.9864211, 0.5317869, 1, 1, 1, 1, 1,
-0.320249, -0.8683484, -1.141033, 1, 1, 1, 1, 1,
-0.3180461, -2.075774, -5.315761, 1, 1, 1, 1, 1,
-0.3174995, -1.222888, -2.814518, 1, 1, 1, 1, 1,
-0.3144656, -1.530905, -1.027893, 1, 1, 1, 1, 1,
-0.3136818, -0.4902696, -0.3508607, 1, 1, 1, 1, 1,
-0.3126497, 0.854901, -1.135657, 0, 0, 1, 1, 1,
-0.3099788, -1.116662, -2.097869, 1, 0, 0, 1, 1,
-0.3064865, 1.071118, 0.04046822, 1, 0, 0, 1, 1,
-0.3032928, 1.167899, 0.1876825, 1, 0, 0, 1, 1,
-0.3027512, 0.3053249, 0.9383466, 1, 0, 0, 1, 1,
-0.3014903, -0.8185677, -4.336326, 1, 0, 0, 1, 1,
-0.2988334, 0.186077, -1.616003, 0, 0, 0, 1, 1,
-0.2978038, 0.6493762, -0.5085412, 0, 0, 0, 1, 1,
-0.2970777, 0.3647428, -0.4513463, 0, 0, 0, 1, 1,
-0.2941679, -0.1475787, -1.579485, 0, 0, 0, 1, 1,
-0.288855, -0.1656491, -1.916331, 0, 0, 0, 1, 1,
-0.2880953, 0.2770261, -2.453982, 0, 0, 0, 1, 1,
-0.2879606, -1.494771, -2.570716, 0, 0, 0, 1, 1,
-0.2870603, -0.590437, -1.598357, 1, 1, 1, 1, 1,
-0.2823995, -0.4094513, -2.161358, 1, 1, 1, 1, 1,
-0.2750489, -1.151871, -3.299036, 1, 1, 1, 1, 1,
-0.2748351, -0.2368264, -1.902661, 1, 1, 1, 1, 1,
-0.2744533, -0.3120452, -1.102852, 1, 1, 1, 1, 1,
-0.2742927, 1.179992, -1.141284, 1, 1, 1, 1, 1,
-0.2706197, -0.3674613, -2.466251, 1, 1, 1, 1, 1,
-0.2697662, -1.68238, -3.308939, 1, 1, 1, 1, 1,
-0.268106, -0.3120129, -4.381772, 1, 1, 1, 1, 1,
-0.267795, 0.1177348, -1.96516, 1, 1, 1, 1, 1,
-0.2674353, 1.104774, -0.09425625, 1, 1, 1, 1, 1,
-0.2660117, 0.1304214, -0.3817567, 1, 1, 1, 1, 1,
-0.2629332, 2.226465, 0.5590069, 1, 1, 1, 1, 1,
-0.2600058, -0.114677, -2.485479, 1, 1, 1, 1, 1,
-0.2559896, 0.5969575, -2.032283, 1, 1, 1, 1, 1,
-0.2557697, 1.587606, -0.4443527, 0, 0, 1, 1, 1,
-0.2439621, -0.5955519, -0.7107427, 1, 0, 0, 1, 1,
-0.2425478, -1.086232, -3.07001, 1, 0, 0, 1, 1,
-0.2412722, 1.122352, 0.7456962, 1, 0, 0, 1, 1,
-0.238727, 0.8471379, 0.07441207, 1, 0, 0, 1, 1,
-0.2324642, -0.4477126, -3.053705, 1, 0, 0, 1, 1,
-0.2317822, -0.1501793, -1.092306, 0, 0, 0, 1, 1,
-0.231212, 0.6388096, -0.3029514, 0, 0, 0, 1, 1,
-0.2293625, 2.781821, -1.264189, 0, 0, 0, 1, 1,
-0.2286205, -0.1305003, 0.5881485, 0, 0, 0, 1, 1,
-0.2123696, -0.70883, -3.396633, 0, 0, 0, 1, 1,
-0.2118613, -0.9026349, -2.755297, 0, 0, 0, 1, 1,
-0.2102792, -0.1728111, -1.529877, 0, 0, 0, 1, 1,
-0.2065695, 0.8790317, -0.2970504, 1, 1, 1, 1, 1,
-0.2045866, -0.4338243, -2.436088, 1, 1, 1, 1, 1,
-0.1939508, -0.1516089, -1.948517, 1, 1, 1, 1, 1,
-0.1915927, -0.5114637, -4.252269, 1, 1, 1, 1, 1,
-0.1891619, -0.816916, -1.008919, 1, 1, 1, 1, 1,
-0.1890352, -0.242761, -2.146123, 1, 1, 1, 1, 1,
-0.1888545, -2.231213, -2.88132, 1, 1, 1, 1, 1,
-0.1884476, -1.712523, -3.517808, 1, 1, 1, 1, 1,
-0.1830984, 0.0761257, -1.017886, 1, 1, 1, 1, 1,
-0.180214, -1.293658, -3.919238, 1, 1, 1, 1, 1,
-0.1775784, 0.8512924, -1.90983, 1, 1, 1, 1, 1,
-0.1704275, -0.2783928, -2.093391, 1, 1, 1, 1, 1,
-0.1695742, -0.7466112, -1.498847, 1, 1, 1, 1, 1,
-0.1672873, 1.49295, 0.3643506, 1, 1, 1, 1, 1,
-0.1597183, 0.1294058, 0.4334904, 1, 1, 1, 1, 1,
-0.1511271, 0.5275218, 1.594959, 0, 0, 1, 1, 1,
-0.1482577, -1.190262, -5.163668, 1, 0, 0, 1, 1,
-0.1473204, 0.5728796, 1.178366, 1, 0, 0, 1, 1,
-0.1418707, -0.9358742, -0.9154733, 1, 0, 0, 1, 1,
-0.1406718, 0.4240661, 0.3094755, 1, 0, 0, 1, 1,
-0.1328944, -0.9492317, -2.158917, 1, 0, 0, 1, 1,
-0.1315508, 1.088488, -0.8147004, 0, 0, 0, 1, 1,
-0.1249786, -1.287563, -3.050523, 0, 0, 0, 1, 1,
-0.1220075, 0.1970608, 0.9144654, 0, 0, 0, 1, 1,
-0.121681, 0.5840492, 0.1927722, 0, 0, 0, 1, 1,
-0.1194052, -0.2645804, -2.706748, 0, 0, 0, 1, 1,
-0.1182841, 0.7616169, -1.436519, 0, 0, 0, 1, 1,
-0.1172557, 0.3706873, -0.104178, 0, 0, 0, 1, 1,
-0.1166407, 1.154627, -0.3329135, 1, 1, 1, 1, 1,
-0.1105883, 2.139823, 0.1259898, 1, 1, 1, 1, 1,
-0.1093556, -0.6695499, -3.433896, 1, 1, 1, 1, 1,
-0.1077626, 0.668865, 0.4912868, 1, 1, 1, 1, 1,
-0.1066967, 1.725047, 0.3375065, 1, 1, 1, 1, 1,
-0.1041425, -0.6932518, -1.761819, 1, 1, 1, 1, 1,
-0.1021178, 0.4447554, -0.5059432, 1, 1, 1, 1, 1,
-0.1015464, -1.584124, -2.497554, 1, 1, 1, 1, 1,
-0.1013853, 0.9112108, 0.1711436, 1, 1, 1, 1, 1,
-0.1011383, -0.8264163, -2.132063, 1, 1, 1, 1, 1,
-0.09994758, -1.216689, -2.204517, 1, 1, 1, 1, 1,
-0.09846663, 0.2221197, -1.336128, 1, 1, 1, 1, 1,
-0.09460082, 0.1645668, -1.405671, 1, 1, 1, 1, 1,
-0.09399411, -0.2584707, -1.278657, 1, 1, 1, 1, 1,
-0.087986, 0.9259865, -0.7062594, 1, 1, 1, 1, 1,
-0.08086271, -1.684452, -3.220006, 0, 0, 1, 1, 1,
-0.08054507, 3.461289, -0.2742377, 1, 0, 0, 1, 1,
-0.07716554, -1.486187, -2.734171, 1, 0, 0, 1, 1,
-0.07427512, -0.1616025, -4.254083, 1, 0, 0, 1, 1,
-0.07361405, 1.639423, 0.5407032, 1, 0, 0, 1, 1,
-0.06750619, -2.036907, -2.082988, 1, 0, 0, 1, 1,
-0.06749205, -2.126134, -2.65117, 0, 0, 0, 1, 1,
-0.06539678, -0.773086, -3.926669, 0, 0, 0, 1, 1,
-0.06500878, -1.8415, -2.872988, 0, 0, 0, 1, 1,
-0.06448477, 0.2003222, -1.068749, 0, 0, 0, 1, 1,
-0.06303503, -0.4566178, -2.643178, 0, 0, 0, 1, 1,
-0.06160669, -1.957116, -0.8181913, 0, 0, 0, 1, 1,
-0.06000895, 0.6353711, 0.6124987, 0, 0, 0, 1, 1,
-0.05752704, -0.2703266, -2.473979, 1, 1, 1, 1, 1,
-0.0569054, 0.1115769, 0.4604172, 1, 1, 1, 1, 1,
-0.05570969, -0.7191058, -4.771574, 1, 1, 1, 1, 1,
-0.05097375, -0.4959946, -4.181438, 1, 1, 1, 1, 1,
-0.04775218, 0.4167477, -1.158313, 1, 1, 1, 1, 1,
-0.04578471, -0.453114, -5.495598, 1, 1, 1, 1, 1,
-0.04503099, 0.9660325, -0.2501991, 1, 1, 1, 1, 1,
-0.04253745, 0.4152029, -1.135512, 1, 1, 1, 1, 1,
-0.03462132, -2.157919, -4.432638, 1, 1, 1, 1, 1,
-0.03317474, -0.5121953, -2.591052, 1, 1, 1, 1, 1,
-0.03304454, 1.070458, 0.2289939, 1, 1, 1, 1, 1,
-0.02277569, 0.5714664, 1.923887, 1, 1, 1, 1, 1,
-0.02108311, 0.412489, 1.044688, 1, 1, 1, 1, 1,
-0.02064748, 0.02515407, 0.08063874, 1, 1, 1, 1, 1,
-0.01647247, -0.4003895, -0.7273655, 1, 1, 1, 1, 1,
-0.01330837, -0.6935262, -2.668296, 0, 0, 1, 1, 1,
-0.01162086, 0.2818809, -1.711714, 1, 0, 0, 1, 1,
-0.01157904, 0.3283138, -0.931527, 1, 0, 0, 1, 1,
-0.01041082, 0.1849725, 0.3180639, 1, 0, 0, 1, 1,
-0.002357699, -0.3220784, -4.932971, 1, 0, 0, 1, 1,
-0.001752976, 1.26648, 1.042632, 1, 0, 0, 1, 1,
0.0002874513, 0.4550414, 1.892442, 0, 0, 0, 1, 1,
0.003824605, 1.151319, -2.194941, 0, 0, 0, 1, 1,
0.004320151, 2.255388, -0.3843576, 0, 0, 0, 1, 1,
0.004755909, -1.662839, 4.050757, 0, 0, 0, 1, 1,
0.01242251, -0.9403106, 2.508179, 0, 0, 0, 1, 1,
0.01932793, -2.663066, 2.314366, 0, 0, 0, 1, 1,
0.02397068, 2.132933, 0.2167038, 0, 0, 0, 1, 1,
0.02493154, 0.1616255, -0.5993296, 1, 1, 1, 1, 1,
0.02692292, -1.963884, 6.223146, 1, 1, 1, 1, 1,
0.02838258, -0.2181371, 2.110938, 1, 1, 1, 1, 1,
0.02872866, 0.8061216, 0.2491632, 1, 1, 1, 1, 1,
0.03158573, 0.2925044, -1.05667, 1, 1, 1, 1, 1,
0.03570445, -0.6153038, 3.596873, 1, 1, 1, 1, 1,
0.03806346, -1.270303, 2.286768, 1, 1, 1, 1, 1,
0.04450939, -1.611061, 4.214135, 1, 1, 1, 1, 1,
0.04557929, 0.6548045, 0.08473189, 1, 1, 1, 1, 1,
0.05138624, -0.7239377, 3.881715, 1, 1, 1, 1, 1,
0.05197287, -0.2035147, 1.941669, 1, 1, 1, 1, 1,
0.05333558, 0.5037343, -0.3757299, 1, 1, 1, 1, 1,
0.05550989, 1.485802, -0.864444, 1, 1, 1, 1, 1,
0.05642619, 0.2801367, 0.9400783, 1, 1, 1, 1, 1,
0.06064682, 0.504775, -0.6417689, 1, 1, 1, 1, 1,
0.06194675, 0.6019632, 1.437237, 0, 0, 1, 1, 1,
0.06324966, 2.7234, -0.2661914, 1, 0, 0, 1, 1,
0.06492276, 1.886216, 0.8064731, 1, 0, 0, 1, 1,
0.06851974, -0.4561924, 3.151109, 1, 0, 0, 1, 1,
0.06871082, -0.07211461, 0.003021314, 1, 0, 0, 1, 1,
0.07052556, 0.05479818, 3.163826, 1, 0, 0, 1, 1,
0.07709278, 0.9738623, 0.5950255, 0, 0, 0, 1, 1,
0.08177842, 1.62931, 0.002823598, 0, 0, 0, 1, 1,
0.0827807, -1.039581, 2.049995, 0, 0, 0, 1, 1,
0.08414723, -1.171735, 5.067677, 0, 0, 0, 1, 1,
0.08443721, -1.385078, 2.076436, 0, 0, 0, 1, 1,
0.08989582, -1.44556, 2.739837, 0, 0, 0, 1, 1,
0.09134539, 0.2193048, -0.213836, 0, 0, 0, 1, 1,
0.09316898, -2.33726, 2.261395, 1, 1, 1, 1, 1,
0.1018865, -0.3111641, 2.240747, 1, 1, 1, 1, 1,
0.101947, 0.6156841, 0.6010913, 1, 1, 1, 1, 1,
0.1048641, -0.381079, 1.969937, 1, 1, 1, 1, 1,
0.1085012, -0.06903255, -0.6845028, 1, 1, 1, 1, 1,
0.1085372, 0.1520183, 2.472285, 1, 1, 1, 1, 1,
0.1092535, -1.614934, 5.51652, 1, 1, 1, 1, 1,
0.1098341, -0.3007559, 2.770432, 1, 1, 1, 1, 1,
0.1133407, -0.5666087, 3.454697, 1, 1, 1, 1, 1,
0.1170295, 1.556517, -1.321841, 1, 1, 1, 1, 1,
0.1182948, 0.5703114, 1.902518, 1, 1, 1, 1, 1,
0.1204082, -1.878685, 2.759794, 1, 1, 1, 1, 1,
0.1215568, 0.9984176, -0.386133, 1, 1, 1, 1, 1,
0.1271866, -0.6377677, 2.959494, 1, 1, 1, 1, 1,
0.1277959, -0.2578873, 2.373504, 1, 1, 1, 1, 1,
0.1282359, -1.181689, 2.437753, 0, 0, 1, 1, 1,
0.1321327, -1.51762, 3.466526, 1, 0, 0, 1, 1,
0.1368084, -1.007752, 1.783154, 1, 0, 0, 1, 1,
0.1398924, -0.0328331, 2.031041, 1, 0, 0, 1, 1,
0.1414353, 0.7246141, 0.1808072, 1, 0, 0, 1, 1,
0.1419999, -0.04558474, 3.133698, 1, 0, 0, 1, 1,
0.1423612, 1.589262, 2.102041, 0, 0, 0, 1, 1,
0.1431117, -0.6392161, 3.118897, 0, 0, 0, 1, 1,
0.1438356, -0.01178218, 1.69826, 0, 0, 0, 1, 1,
0.1449457, 0.01874724, 2.063385, 0, 0, 0, 1, 1,
0.1452545, 0.4066743, 0.8591921, 0, 0, 0, 1, 1,
0.1462135, -0.4758182, 1.218553, 0, 0, 0, 1, 1,
0.1463353, 1.470241, 0.2369189, 0, 0, 0, 1, 1,
0.1474094, -0.3559259, 3.72898, 1, 1, 1, 1, 1,
0.1489176, 0.76945, -0.7362705, 1, 1, 1, 1, 1,
0.149316, -0.8381073, 3.084942, 1, 1, 1, 1, 1,
0.1530056, 0.5231247, 0.3409373, 1, 1, 1, 1, 1,
0.1568458, -0.5159276, 1.280659, 1, 1, 1, 1, 1,
0.1643145, -1.179489, 2.673011, 1, 1, 1, 1, 1,
0.1713912, 1.600916, 1.617793, 1, 1, 1, 1, 1,
0.1757598, -0.6798618, 2.582104, 1, 1, 1, 1, 1,
0.1763532, 1.823811, 0.2354401, 1, 1, 1, 1, 1,
0.1768776, 0.2587717, 0.4917961, 1, 1, 1, 1, 1,
0.1777951, -1.98866, 3.879289, 1, 1, 1, 1, 1,
0.1787125, 1.554975, -0.5593137, 1, 1, 1, 1, 1,
0.1793218, 1.572641, -0.3358535, 1, 1, 1, 1, 1,
0.1825899, -1.883329, 3.050549, 1, 1, 1, 1, 1,
0.1828502, -0.8839532, 2.424923, 1, 1, 1, 1, 1,
0.1847976, 0.9035147, -0.7265145, 0, 0, 1, 1, 1,
0.1849832, -0.2438651, 3.167888, 1, 0, 0, 1, 1,
0.1878892, 2.063339, 0.4552184, 1, 0, 0, 1, 1,
0.1883179, 0.3318554, 0.6274985, 1, 0, 0, 1, 1,
0.1883756, 0.6028996, -0.7886567, 1, 0, 0, 1, 1,
0.1895222, -0.3996774, 1.986609, 1, 0, 0, 1, 1,
0.1903267, 2.265076, 1.490794, 0, 0, 0, 1, 1,
0.1913296, -1.477283, 5.052388, 0, 0, 0, 1, 1,
0.1930237, 0.2684034, 1.328113, 0, 0, 0, 1, 1,
0.19638, 1.724694, 0.8098717, 0, 0, 0, 1, 1,
0.1983421, 0.4758133, 0.5878092, 0, 0, 0, 1, 1,
0.2007084, 0.09498005, 0.7684362, 0, 0, 0, 1, 1,
0.2017741, 1.343673, -0.03741991, 0, 0, 0, 1, 1,
0.2028552, 0.4778714, 0.7759218, 1, 1, 1, 1, 1,
0.2031176, -0.4704123, 2.67899, 1, 1, 1, 1, 1,
0.20566, -0.4945577, 2.865122, 1, 1, 1, 1, 1,
0.2079999, -0.8705077, 3.546213, 1, 1, 1, 1, 1,
0.2084409, 0.03546399, 0.4470992, 1, 1, 1, 1, 1,
0.2103523, -2.109251, 3.499275, 1, 1, 1, 1, 1,
0.2135073, 1.554086, -1.189683, 1, 1, 1, 1, 1,
0.2206989, -1.340459, 2.817406, 1, 1, 1, 1, 1,
0.221518, -0.2875617, 1.787163, 1, 1, 1, 1, 1,
0.2220489, -2.115281, 1.073099, 1, 1, 1, 1, 1,
0.2230555, -1.071293, 2.38015, 1, 1, 1, 1, 1,
0.2265913, -0.8219519, 3.7156, 1, 1, 1, 1, 1,
0.2287039, -0.8056684, 4.551566, 1, 1, 1, 1, 1,
0.2287321, -1.132243, 2.549634, 1, 1, 1, 1, 1,
0.2349228, -0.7358489, 3.680814, 1, 1, 1, 1, 1,
0.23558, -0.5204833, 2.032105, 0, 0, 1, 1, 1,
0.2364963, 1.323231, 1.379156, 1, 0, 0, 1, 1,
0.236587, -0.5220198, 1.983992, 1, 0, 0, 1, 1,
0.2382759, -0.8471351, 3.621734, 1, 0, 0, 1, 1,
0.2410027, -0.5011917, 2.118901, 1, 0, 0, 1, 1,
0.243851, -0.02762329, 1.491553, 1, 0, 0, 1, 1,
0.2466415, 0.05703749, 0.2537657, 0, 0, 0, 1, 1,
0.248787, -0.5135312, 2.102449, 0, 0, 0, 1, 1,
0.2489111, -0.2255923, 3.733344, 0, 0, 0, 1, 1,
0.2504215, -0.2101284, -0.3658778, 0, 0, 0, 1, 1,
0.2574323, -0.3444046, 2.881568, 0, 0, 0, 1, 1,
0.257828, 1.213519, -0.03037861, 0, 0, 0, 1, 1,
0.2661779, 1.005409, 0.8913372, 0, 0, 0, 1, 1,
0.2671479, -0.9694533, 2.163908, 1, 1, 1, 1, 1,
0.2697595, -1.208835, 1.743418, 1, 1, 1, 1, 1,
0.2704746, 0.5217649, 0.7618339, 1, 1, 1, 1, 1,
0.2811832, -0.3801169, 2.54134, 1, 1, 1, 1, 1,
0.2833066, -0.8937793, 3.010947, 1, 1, 1, 1, 1,
0.2835852, -0.1846867, 1.773481, 1, 1, 1, 1, 1,
0.2862432, 0.09180719, 1.494424, 1, 1, 1, 1, 1,
0.2866102, -0.004913258, 0.351888, 1, 1, 1, 1, 1,
0.2871189, 0.7825428, 2.062485, 1, 1, 1, 1, 1,
0.2904839, -2.127887, 3.666218, 1, 1, 1, 1, 1,
0.2905179, -1.074341, 0.6066641, 1, 1, 1, 1, 1,
0.2957464, 1.233492, 0.7646725, 1, 1, 1, 1, 1,
0.297459, -0.3671818, 1.655905, 1, 1, 1, 1, 1,
0.2981445, -0.4209018, 2.419373, 1, 1, 1, 1, 1,
0.2981898, -0.3229235, 1.319246, 1, 1, 1, 1, 1,
0.3007919, -0.7343187, 3.1765, 0, 0, 1, 1, 1,
0.3008382, -2.544385, 1.606819, 1, 0, 0, 1, 1,
0.3019637, -0.6990452, 3.968751, 1, 0, 0, 1, 1,
0.302308, -0.3991264, 2.913502, 1, 0, 0, 1, 1,
0.3026611, -0.2398039, 2.889036, 1, 0, 0, 1, 1,
0.3040731, 2.054648, -0.5948226, 1, 0, 0, 1, 1,
0.3041993, -0.7173703, -0.144853, 0, 0, 0, 1, 1,
0.3057331, 1.311864, -0.9439327, 0, 0, 0, 1, 1,
0.3070501, -1.993322, 3.25831, 0, 0, 0, 1, 1,
0.3118608, -1.285799, 2.763786, 0, 0, 0, 1, 1,
0.314545, -0.5269104, 3.344026, 0, 0, 0, 1, 1,
0.315891, -0.3842777, 2.624155, 0, 0, 0, 1, 1,
0.3231826, -0.05315141, 1.23908, 0, 0, 0, 1, 1,
0.3268947, -1.149642, 1.466169, 1, 1, 1, 1, 1,
0.3333519, -1.064939, 1.853378, 1, 1, 1, 1, 1,
0.3384656, 0.1943425, 0.5987273, 1, 1, 1, 1, 1,
0.340745, 1.232411, 0.1855401, 1, 1, 1, 1, 1,
0.3441871, 0.7155956, 0.3201301, 1, 1, 1, 1, 1,
0.3467078, 1.177185, 1.787928, 1, 1, 1, 1, 1,
0.3484832, 0.4024675, 3.252241, 1, 1, 1, 1, 1,
0.3487062, -0.2912298, 1.454267, 1, 1, 1, 1, 1,
0.3531583, -0.4693451, 2.225501, 1, 1, 1, 1, 1,
0.3557352, -0.1851165, 2.267071, 1, 1, 1, 1, 1,
0.3558837, 1.624776, 1.75727, 1, 1, 1, 1, 1,
0.3588435, -1.155105, 4.61333, 1, 1, 1, 1, 1,
0.3596969, 0.1676816, 1.307208, 1, 1, 1, 1, 1,
0.361441, -0.7834325, 2.421744, 1, 1, 1, 1, 1,
0.3615163, -0.5040068, 2.512696, 1, 1, 1, 1, 1,
0.3624523, -0.7011356, 3.666875, 0, 0, 1, 1, 1,
0.3628222, -0.2376073, 2.458932, 1, 0, 0, 1, 1,
0.3745188, -0.4493154, 2.965587, 1, 0, 0, 1, 1,
0.3757542, -0.1127855, 1.867626, 1, 0, 0, 1, 1,
0.3780736, 0.4501872, 1.669198, 1, 0, 0, 1, 1,
0.3791068, 0.6014349, -0.3978728, 1, 0, 0, 1, 1,
0.3792218, -0.1847466, 3.057199, 0, 0, 0, 1, 1,
0.3831732, 1.797425, 0.3718224, 0, 0, 0, 1, 1,
0.3859545, -1.735181, 2.055293, 0, 0, 0, 1, 1,
0.3892126, 1.035854, 0.6666738, 0, 0, 0, 1, 1,
0.3898158, 1.37801, 0.4875788, 0, 0, 0, 1, 1,
0.3912971, 0.2669294, 2.185399, 0, 0, 0, 1, 1,
0.3921916, 0.0005657316, 1.941384, 0, 0, 0, 1, 1,
0.3952422, -0.7818608, 2.873858, 1, 1, 1, 1, 1,
0.3954593, -1.526866, 2.658926, 1, 1, 1, 1, 1,
0.3978516, -1.386205, 2.647418, 1, 1, 1, 1, 1,
0.4034532, 1.113725, -0.7659401, 1, 1, 1, 1, 1,
0.4058643, 1.859263, 1.415168, 1, 1, 1, 1, 1,
0.418294, -1.845416, 5.005731, 1, 1, 1, 1, 1,
0.4270197, -0.6519647, 1.98049, 1, 1, 1, 1, 1,
0.4273087, 0.2293435, -0.2781273, 1, 1, 1, 1, 1,
0.4313829, -0.6246012, 2.302508, 1, 1, 1, 1, 1,
0.4317503, 0.3523634, -0.5702284, 1, 1, 1, 1, 1,
0.4384621, -1.049759, 2.504353, 1, 1, 1, 1, 1,
0.4399156, -0.644336, 1.757564, 1, 1, 1, 1, 1,
0.4401249, -0.3686115, 3.876332, 1, 1, 1, 1, 1,
0.4410216, -0.5015798, 2.320576, 1, 1, 1, 1, 1,
0.445555, 0.5900798, 1.186123, 1, 1, 1, 1, 1,
0.4494165, -1.091964, 3.608012, 0, 0, 1, 1, 1,
0.4517946, -0.46739, 2.682479, 1, 0, 0, 1, 1,
0.452558, 0.8240899, 2.053381, 1, 0, 0, 1, 1,
0.4613856, -1.064214, 3.656757, 1, 0, 0, 1, 1,
0.4634503, -0.365364, 2.89412, 1, 0, 0, 1, 1,
0.4651119, 1.121267, 1.058285, 1, 0, 0, 1, 1,
0.4669555, 0.1889445, 2.647766, 0, 0, 0, 1, 1,
0.4674685, -0.2856708, 2.980479, 0, 0, 0, 1, 1,
0.4675259, 0.6944492, 0.5699055, 0, 0, 0, 1, 1,
0.4708562, -0.2036597, 3.469396, 0, 0, 0, 1, 1,
0.4715218, -0.4197149, 1.324032, 0, 0, 0, 1, 1,
0.4723639, -0.6823412, 4.846273, 0, 0, 0, 1, 1,
0.4726299, -0.9483467, 1.463203, 0, 0, 0, 1, 1,
0.4738137, 1.219697, 0.6347868, 1, 1, 1, 1, 1,
0.475461, 1.445537, -0.1809069, 1, 1, 1, 1, 1,
0.4788035, 0.4963594, 0.2761913, 1, 1, 1, 1, 1,
0.4788879, -0.5531393, 2.488093, 1, 1, 1, 1, 1,
0.479383, 0.2308705, 0.7877947, 1, 1, 1, 1, 1,
0.482296, -0.2791868, 2.197957, 1, 1, 1, 1, 1,
0.4861489, -0.9039134, 1.934504, 1, 1, 1, 1, 1,
0.49027, 1.462364, 0.3879464, 1, 1, 1, 1, 1,
0.4952987, 0.2172985, 0.9061976, 1, 1, 1, 1, 1,
0.4961858, -0.5417669, 2.615081, 1, 1, 1, 1, 1,
0.4980624, -2.301872, 1.97231, 1, 1, 1, 1, 1,
0.498573, 0.6670404, 0.5910186, 1, 1, 1, 1, 1,
0.4988034, -0.9772182, 1.552214, 1, 1, 1, 1, 1,
0.5005251, -0.0493334, 0.7702346, 1, 1, 1, 1, 1,
0.5091282, 1.370869, -0.6335725, 1, 1, 1, 1, 1,
0.5146079, 0.1371203, 1.092398, 0, 0, 1, 1, 1,
0.5179852, 0.1694182, 0.09510352, 1, 0, 0, 1, 1,
0.5187024, 0.7334469, -0.1203828, 1, 0, 0, 1, 1,
0.5220007, 1.859418, 0.6733639, 1, 0, 0, 1, 1,
0.5268459, 0.284913, 0.5829839, 1, 0, 0, 1, 1,
0.5314212, -0.7912133, 2.610534, 1, 0, 0, 1, 1,
0.5330798, 1.278946, 2.921783, 0, 0, 0, 1, 1,
0.535984, -0.8183133, 4.6111, 0, 0, 0, 1, 1,
0.5386498, 0.5578502, 0.9982012, 0, 0, 0, 1, 1,
0.5393501, 0.8774021, 0.5099002, 0, 0, 0, 1, 1,
0.5416602, 0.9157743, -0.01028698, 0, 0, 0, 1, 1,
0.547451, -0.8770298, 4.284796, 0, 0, 0, 1, 1,
0.547706, -1.687138, 3.181142, 0, 0, 0, 1, 1,
0.5477995, 1.106496, 0.1187295, 1, 1, 1, 1, 1,
0.5502681, -0.007648851, 2.733903, 1, 1, 1, 1, 1,
0.5522507, 0.04048078, 0.8810663, 1, 1, 1, 1, 1,
0.553639, 0.1482084, 2.364348, 1, 1, 1, 1, 1,
0.5543489, 0.06832861, 1.310635, 1, 1, 1, 1, 1,
0.5561183, 0.5066331, 0.8612998, 1, 1, 1, 1, 1,
0.5581022, -0.1248378, 1.523809, 1, 1, 1, 1, 1,
0.5631638, 0.6093425, 2.09842, 1, 1, 1, 1, 1,
0.5632252, -0.07583721, 2.906616, 1, 1, 1, 1, 1,
0.5654005, 0.9867372, -1.910334, 1, 1, 1, 1, 1,
0.5741588, -1.065687, 4.288445, 1, 1, 1, 1, 1,
0.586215, 0.4126743, 0.6902125, 1, 1, 1, 1, 1,
0.5862226, -1.514173, 2.923155, 1, 1, 1, 1, 1,
0.586464, -0.5289529, 1.403393, 1, 1, 1, 1, 1,
0.5884256, -0.2462354, 3.187897, 1, 1, 1, 1, 1,
0.5917069, -0.04153724, 2.604347, 0, 0, 1, 1, 1,
0.604715, 0.4506742, 1.086992, 1, 0, 0, 1, 1,
0.6064098, 0.01773719, 2.321146, 1, 0, 0, 1, 1,
0.6077108, -0.4778983, 1.143065, 1, 0, 0, 1, 1,
0.6208145, 0.3321583, -0.5771481, 1, 0, 0, 1, 1,
0.6221237, 1.403925, 1.535546, 1, 0, 0, 1, 1,
0.6273582, 0.1636312, 2.43512, 0, 0, 0, 1, 1,
0.6334686, -1.451877, 2.928028, 0, 0, 0, 1, 1,
0.6363642, -1.765996, 2.241142, 0, 0, 0, 1, 1,
0.6572538, 0.0306419, 1.828776, 0, 0, 0, 1, 1,
0.6594284, -1.466806, 3.894196, 0, 0, 0, 1, 1,
0.6606197, -1.078336, 1.877164, 0, 0, 0, 1, 1,
0.6610096, 2.327278, -0.7036315, 0, 0, 0, 1, 1,
0.6647881, -1.245445, 3.318396, 1, 1, 1, 1, 1,
0.6709816, 0.8347564, 2.887574, 1, 1, 1, 1, 1,
0.6749761, -1.091287, 1.583234, 1, 1, 1, 1, 1,
0.6789376, -0.09313817, 3.196752, 1, 1, 1, 1, 1,
0.7284818, 0.9480352, 2.528577, 1, 1, 1, 1, 1,
0.7331491, 0.2443294, -1.477092, 1, 1, 1, 1, 1,
0.7340361, 0.1985514, 1.669146, 1, 1, 1, 1, 1,
0.7440196, -0.1293619, 4.082272, 1, 1, 1, 1, 1,
0.7486895, -1.398455, 2.884062, 1, 1, 1, 1, 1,
0.7545774, 1.035677, -0.7881987, 1, 1, 1, 1, 1,
0.7633969, 0.6899542, 1.559769, 1, 1, 1, 1, 1,
0.7648811, 0.1657788, 2.400561, 1, 1, 1, 1, 1,
0.7744473, -0.3480968, 2.23798, 1, 1, 1, 1, 1,
0.7775369, -0.8093761, 2.152586, 1, 1, 1, 1, 1,
0.7783459, 0.413131, -0.2802915, 1, 1, 1, 1, 1,
0.7810087, 0.7037691, 2.47218, 0, 0, 1, 1, 1,
0.7961042, -0.2888934, 2.195621, 1, 0, 0, 1, 1,
0.7985345, 1.334877, 0.9849228, 1, 0, 0, 1, 1,
0.7998327, -1.250395, 3.125578, 1, 0, 0, 1, 1,
0.8011075, -0.1394265, 0.1639734, 1, 0, 0, 1, 1,
0.8016404, 0.349025, 1.42504, 1, 0, 0, 1, 1,
0.8024868, 1.002358, 1.766751, 0, 0, 0, 1, 1,
0.8059779, -0.543425, 1.024248, 0, 0, 0, 1, 1,
0.8068331, 0.6592799, 1.327395, 0, 0, 0, 1, 1,
0.8111185, 0.07548268, 0.3267858, 0, 0, 0, 1, 1,
0.8148444, 0.04836933, 1.744371, 0, 0, 0, 1, 1,
0.8228116, -0.3608267, 0.0531425, 0, 0, 0, 1, 1,
0.8304564, 0.08762952, 0.6307595, 0, 0, 0, 1, 1,
0.8311589, -1.1958, 3.534543, 1, 1, 1, 1, 1,
0.8342525, -0.5020471, 1.985397, 1, 1, 1, 1, 1,
0.8474233, 0.2254138, 3.273434, 1, 1, 1, 1, 1,
0.8550338, -0.5020709, 4.056176, 1, 1, 1, 1, 1,
0.8587797, 0.6878141, 0.4998492, 1, 1, 1, 1, 1,
0.8595914, -0.6480182, 1.182338, 1, 1, 1, 1, 1,
0.8607479, -0.6571491, 1.516902, 1, 1, 1, 1, 1,
0.8620447, -2.144021, 2.25431, 1, 1, 1, 1, 1,
0.8645558, 0.9809342, 1.230657, 1, 1, 1, 1, 1,
0.8661053, -0.101338, 1.346291, 1, 1, 1, 1, 1,
0.8735271, -0.9655907, -0.669376, 1, 1, 1, 1, 1,
0.8742994, -0.3978964, 1.200386, 1, 1, 1, 1, 1,
0.8780811, 0.76144, 0.861851, 1, 1, 1, 1, 1,
0.8791917, 1.626431, 0.2320104, 1, 1, 1, 1, 1,
0.8811614, 0.7116555, 1.420859, 1, 1, 1, 1, 1,
0.8827049, 0.5847584, 1.762986, 0, 0, 1, 1, 1,
0.8933502, 1.307642, -0.2790184, 1, 0, 0, 1, 1,
0.8944039, 0.8411751, 0.1990491, 1, 0, 0, 1, 1,
0.8981453, 0.1217427, 0.4309515, 1, 0, 0, 1, 1,
0.9089225, -0.08846828, 1.810149, 1, 0, 0, 1, 1,
0.9093934, 0.2575188, 1.983822, 1, 0, 0, 1, 1,
0.9152278, -0.4447145, 3.379641, 0, 0, 0, 1, 1,
0.9219775, 0.5156424, 0.9258673, 0, 0, 0, 1, 1,
0.9307028, -0.6027859, 3.044374, 0, 0, 0, 1, 1,
0.9427383, -1.013024, 1.60608, 0, 0, 0, 1, 1,
0.9501132, -0.3332976, 1.025105, 0, 0, 0, 1, 1,
0.9517641, 0.1687701, 2.65924, 0, 0, 0, 1, 1,
0.9518072, -0.816287, 3.241434, 0, 0, 0, 1, 1,
0.955813, 0.4991098, 0.2237847, 1, 1, 1, 1, 1,
0.95874, 0.1168852, 1.984041, 1, 1, 1, 1, 1,
0.960142, 0.7076696, 2.097183, 1, 1, 1, 1, 1,
0.9634413, -0.4798755, 2.094929, 1, 1, 1, 1, 1,
0.9671376, -1.474893, 2.665344, 1, 1, 1, 1, 1,
0.9748139, 0.5122693, 0.8046321, 1, 1, 1, 1, 1,
0.9902495, 0.4134599, 0.4143736, 1, 1, 1, 1, 1,
0.9912086, 1.60311, 2.087079, 1, 1, 1, 1, 1,
1.004764, -0.05118026, 1.768347, 1, 1, 1, 1, 1,
1.012384, -1.203128, 2.430524, 1, 1, 1, 1, 1,
1.014329, 0.1904698, 2.685804, 1, 1, 1, 1, 1,
1.01598, -0.5149804, 3.548898, 1, 1, 1, 1, 1,
1.016174, -0.2762414, 0.4883924, 1, 1, 1, 1, 1,
1.021327, -0.7490637, 1.900278, 1, 1, 1, 1, 1,
1.022146, 0.07441196, 0.899433, 1, 1, 1, 1, 1,
1.023545, 1.48583, -0.223656, 0, 0, 1, 1, 1,
1.02712, 1.935739, 0.484524, 1, 0, 0, 1, 1,
1.027824, 1.33758, 2.031342, 1, 0, 0, 1, 1,
1.029213, 0.2528001, 0.5507864, 1, 0, 0, 1, 1,
1.032543, 0.1411363, 2.588247, 1, 0, 0, 1, 1,
1.038047, 1.404188, -0.8186693, 1, 0, 0, 1, 1,
1.044552, -1.363523, 2.584435, 0, 0, 0, 1, 1,
1.045285, -0.7647868, 1.931078, 0, 0, 0, 1, 1,
1.045459, -0.4881899, 1.261298, 0, 0, 0, 1, 1,
1.045747, -0.1577878, 1.303086, 0, 0, 0, 1, 1,
1.05166, 0.7530468, 3.102885, 0, 0, 0, 1, 1,
1.05309, -0.3006946, 3.996547, 0, 0, 0, 1, 1,
1.059235, -0.1748471, 1.553571, 0, 0, 0, 1, 1,
1.062509, 0.7447228, 0.6586997, 1, 1, 1, 1, 1,
1.068027, -0.4040408, 3.150122, 1, 1, 1, 1, 1,
1.108751, -2.102508, 1.898902, 1, 1, 1, 1, 1,
1.110365, -0.1204251, 1.819397, 1, 1, 1, 1, 1,
1.110801, -0.6147656, 0.7834325, 1, 1, 1, 1, 1,
1.112282, -1.823647, 2.248994, 1, 1, 1, 1, 1,
1.115686, 0.9625068, 1.118594, 1, 1, 1, 1, 1,
1.121904, -0.3812284, 3.078453, 1, 1, 1, 1, 1,
1.124959, -0.6145042, 0.9810958, 1, 1, 1, 1, 1,
1.130083, -0.4119048, 3.718061, 1, 1, 1, 1, 1,
1.13433, 1.064891, -1.582857, 1, 1, 1, 1, 1,
1.13452, -0.08562876, -1.444893, 1, 1, 1, 1, 1,
1.136744, 0.1256803, 1.869842, 1, 1, 1, 1, 1,
1.154854, 2.085347, 1.074458, 1, 1, 1, 1, 1,
1.157064, -0.9790103, 1.735958, 1, 1, 1, 1, 1,
1.161113, -0.1509573, 0.1845359, 0, 0, 1, 1, 1,
1.161778, 1.652836, 0.8997102, 1, 0, 0, 1, 1,
1.172542, -0.3999815, 3.022514, 1, 0, 0, 1, 1,
1.173946, 0.1444671, 0.6121985, 1, 0, 0, 1, 1,
1.174071, -0.4796296, 0.0460007, 1, 0, 0, 1, 1,
1.17675, 0.2945794, 2.13316, 1, 0, 0, 1, 1,
1.181796, 0.9399813, 1.454388, 0, 0, 0, 1, 1,
1.196039, 0.1607417, 1.255197, 0, 0, 0, 1, 1,
1.203831, -0.5703771, 1.080174, 0, 0, 0, 1, 1,
1.204149, 0.0211695, 1.319445, 0, 0, 0, 1, 1,
1.205781, -0.2152966, 2.260334, 0, 0, 0, 1, 1,
1.20634, 0.6786507, 2.038321, 0, 0, 0, 1, 1,
1.206691, -0.1169517, 2.258065, 0, 0, 0, 1, 1,
1.207979, 0.5744182, 1.521829, 1, 1, 1, 1, 1,
1.213047, -0.4318105, 2.535619, 1, 1, 1, 1, 1,
1.214105, -0.4792231, 2.552596, 1, 1, 1, 1, 1,
1.219184, 0.001334573, 2.680347, 1, 1, 1, 1, 1,
1.225965, 0.246941, 1.984523, 1, 1, 1, 1, 1,
1.226355, 0.02402684, 1.860301, 1, 1, 1, 1, 1,
1.231807, -0.7836583, 3.516978, 1, 1, 1, 1, 1,
1.240026, -0.3366743, 2.668012, 1, 1, 1, 1, 1,
1.240504, -1.383725, 0.1194666, 1, 1, 1, 1, 1,
1.247006, 0.2693868, 2.840147, 1, 1, 1, 1, 1,
1.265989, -2.040194, 2.409996, 1, 1, 1, 1, 1,
1.272387, 0.9521749, 0.7743044, 1, 1, 1, 1, 1,
1.274625, 0.3560998, 2.792682, 1, 1, 1, 1, 1,
1.279568, 1.112807, 1.414797, 1, 1, 1, 1, 1,
1.285733, -0.5579865, 3.622316, 1, 1, 1, 1, 1,
1.287139, -0.09788819, 0.1206424, 0, 0, 1, 1, 1,
1.290863, 0.8316141, 1.633817, 1, 0, 0, 1, 1,
1.294173, -0.722514, 4.57228, 1, 0, 0, 1, 1,
1.296651, 2.07674, 0.2068553, 1, 0, 0, 1, 1,
1.29704, 0.2181916, 0.7414262, 1, 0, 0, 1, 1,
1.300464, -1.321375, 2.586066, 1, 0, 0, 1, 1,
1.300988, 0.1509823, 0.6836247, 0, 0, 0, 1, 1,
1.302983, -0.7364886, 1.727606, 0, 0, 0, 1, 1,
1.311634, 0.08081548, 2.272804, 0, 0, 0, 1, 1,
1.314172, 1.704825, 1.026301, 0, 0, 0, 1, 1,
1.316371, -1.313742, 0.6614076, 0, 0, 0, 1, 1,
1.325846, -0.7439836, 1.445449, 0, 0, 0, 1, 1,
1.326893, -0.6252374, 0.4741849, 0, 0, 0, 1, 1,
1.333774, 0.8749326, -0.5963677, 1, 1, 1, 1, 1,
1.334175, 1.313546, 2.002253, 1, 1, 1, 1, 1,
1.33972, -1.586384, 1.910825, 1, 1, 1, 1, 1,
1.340623, 0.6539336, 2.673346, 1, 1, 1, 1, 1,
1.347237, 1.197979, 1.157811, 1, 1, 1, 1, 1,
1.356836, 1.512947, -1.1841, 1, 1, 1, 1, 1,
1.365594, -0.769634, 0.5858102, 1, 1, 1, 1, 1,
1.36877, 0.653084, 0.7936342, 1, 1, 1, 1, 1,
1.370469, 1.180398, -0.716731, 1, 1, 1, 1, 1,
1.372409, 0.7466438, 2.874139, 1, 1, 1, 1, 1,
1.380545, 0.1596433, 2.722176, 1, 1, 1, 1, 1,
1.395007, 0.9898661, 0.4456429, 1, 1, 1, 1, 1,
1.395391, 0.777137, -0.2576557, 1, 1, 1, 1, 1,
1.397198, -0.1536582, 3.143101, 1, 1, 1, 1, 1,
1.406691, 0.4719032, 1.210802, 1, 1, 1, 1, 1,
1.409032, -0.4554815, 1.086731, 0, 0, 1, 1, 1,
1.412689, 0.1925448, 2.085968, 1, 0, 0, 1, 1,
1.413432, 0.237311, 1.557467, 1, 0, 0, 1, 1,
1.43538, 0.4466093, 1.343163, 1, 0, 0, 1, 1,
1.440114, -1.503291, 2.045826, 1, 0, 0, 1, 1,
1.442373, -1.33467, 2.433853, 1, 0, 0, 1, 1,
1.445244, 0.6246045, 2.162786, 0, 0, 0, 1, 1,
1.452524, -0.6491501, 1.048487, 0, 0, 0, 1, 1,
1.461812, -1.315511, 0.8716761, 0, 0, 0, 1, 1,
1.481509, -0.1261117, 1.966765, 0, 0, 0, 1, 1,
1.500247, 0.6152706, 1.735548, 0, 0, 0, 1, 1,
1.503918, -0.585936, 2.435426, 0, 0, 0, 1, 1,
1.507668, 0.9080037, 2.019043, 0, 0, 0, 1, 1,
1.507812, -0.01858395, 2.363275, 1, 1, 1, 1, 1,
1.510654, 0.5398317, 0.4789569, 1, 1, 1, 1, 1,
1.521723, 0.6459205, -0.3524526, 1, 1, 1, 1, 1,
1.523332, -1.813523, 3.044376, 1, 1, 1, 1, 1,
1.524369, 1.972856, 2.837126, 1, 1, 1, 1, 1,
1.524556, -0.5362101, 3.022657, 1, 1, 1, 1, 1,
1.545745, -1.095725, 1.212924, 1, 1, 1, 1, 1,
1.550146, -0.1567001, 2.117519, 1, 1, 1, 1, 1,
1.559422, -0.9050982, 2.218907, 1, 1, 1, 1, 1,
1.56275, -1.930419, 0.8603587, 1, 1, 1, 1, 1,
1.590474, -1.141016, 2.613363, 1, 1, 1, 1, 1,
1.599935, 1.69466, 0.8021169, 1, 1, 1, 1, 1,
1.609255, -0.2520981, 1.20456, 1, 1, 1, 1, 1,
1.612928, -0.5032038, 2.115619, 1, 1, 1, 1, 1,
1.615838, 0.5706128, 1.972667, 1, 1, 1, 1, 1,
1.634358, -1.029289, 1.762903, 0, 0, 1, 1, 1,
1.642794, 0.3487801, 2.165434, 1, 0, 0, 1, 1,
1.662621, 1.506877, 0.6165341, 1, 0, 0, 1, 1,
1.667216, 0.1207767, 0.6303433, 1, 0, 0, 1, 1,
1.682878, 0.6813458, 2.030813, 1, 0, 0, 1, 1,
1.686081, 1.401336, 2.889534, 1, 0, 0, 1, 1,
1.694107, 0.07076838, 1.56074, 0, 0, 0, 1, 1,
1.710693, -0.9382502, 1.210658, 0, 0, 0, 1, 1,
1.725888, 0.9465621, 0.8330976, 0, 0, 0, 1, 1,
1.729977, -0.9670319, 2.69438, 0, 0, 0, 1, 1,
1.744341, 0.8241595, 2.626411, 0, 0, 0, 1, 1,
1.749191, -0.6151322, 0.8360005, 0, 0, 0, 1, 1,
1.75062, -1.718106, 2.212984, 0, 0, 0, 1, 1,
1.793041, -0.1903067, 1.001302, 1, 1, 1, 1, 1,
1.811793, -0.8809372, 2.08685, 1, 1, 1, 1, 1,
1.815721, -0.2360854, 0.5675412, 1, 1, 1, 1, 1,
1.829093, -0.009288227, 4.065746, 1, 1, 1, 1, 1,
1.847794, -0.3111846, 0.4815803, 1, 1, 1, 1, 1,
1.849648, -0.7433518, 3.640275, 1, 1, 1, 1, 1,
1.867536, 1.306926, 1.231432, 1, 1, 1, 1, 1,
1.883185, -0.6237456, 2.194258, 1, 1, 1, 1, 1,
1.884328, 1.701706, -0.8195324, 1, 1, 1, 1, 1,
1.887055, -0.05297315, 1.817496, 1, 1, 1, 1, 1,
1.922231, -1.765535, 0.3890001, 1, 1, 1, 1, 1,
1.968334, -0.5285312, 1.620006, 1, 1, 1, 1, 1,
1.971383, -0.7482754, 2.605402, 1, 1, 1, 1, 1,
1.973673, -1.541048, 1.134948, 1, 1, 1, 1, 1,
2.040721, 0.6802734, 1.012466, 1, 1, 1, 1, 1,
2.067238, 0.0958355, 1.720432, 0, 0, 1, 1, 1,
2.068423, 0.5699323, 3.188458, 1, 0, 0, 1, 1,
2.070675, -1.496942, 3.633195, 1, 0, 0, 1, 1,
2.08416, 0.2739207, 0.424533, 1, 0, 0, 1, 1,
2.110789, -0.6087076, 2.549929, 1, 0, 0, 1, 1,
2.122058, -0.08463624, 2.756608, 1, 0, 0, 1, 1,
2.248526, 0.2961456, 3.753319, 0, 0, 0, 1, 1,
2.259657, 1.700325, 1.241431, 0, 0, 0, 1, 1,
2.279068, -0.3289107, 2.704828, 0, 0, 0, 1, 1,
2.322672, -0.3730667, 0.4348453, 0, 0, 0, 1, 1,
2.354798, -0.1395253, 1.187797, 0, 0, 0, 1, 1,
2.45623, 0.3796175, 2.033855, 0, 0, 0, 1, 1,
2.532688, 0.5959296, 0.6626178, 0, 0, 0, 1, 1,
2.549498, -0.3000806, 0.7808287, 1, 1, 1, 1, 1,
2.572951, 0.1763862, 1.709956, 1, 1, 1, 1, 1,
2.573671, -1.360428, 3.093037, 1, 1, 1, 1, 1,
2.807571, 0.04615444, 1.333786, 1, 1, 1, 1, 1,
2.859591, 0.2072751, 2.119571, 1, 1, 1, 1, 1,
2.901202, -1.120118, 1.409571, 1, 1, 1, 1, 1,
3.88126, -0.614235, 0.4927886, 1, 1, 1, 1, 1
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
var radius = 10.14252;
var distance = 35.62518;
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
mvMatrix.translate( -0.2634025, -0.3818792, -0.3637741 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.62518);
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
