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
-3.291174, 1.019724, 0.2395312, 1, 0, 0, 1,
-2.796551, -0.3754958, -1.836041, 1, 0.007843138, 0, 1,
-2.660542, -1.307087, -1.393602, 1, 0.01176471, 0, 1,
-2.545012, 1.201232, -2.437419, 1, 0.01960784, 0, 1,
-2.527736, -0.5762317, -2.030224, 1, 0.02352941, 0, 1,
-2.41422, 0.2171472, -2.98578, 1, 0.03137255, 0, 1,
-2.398716, 0.5047007, -0.9100137, 1, 0.03529412, 0, 1,
-2.338819, 1.054785, 0.3610956, 1, 0.04313726, 0, 1,
-2.279569, 0.8713744, -1.531964, 1, 0.04705882, 0, 1,
-2.257446, 1.105479, -1.436115, 1, 0.05490196, 0, 1,
-2.235247, 1.883566, 0.06933731, 1, 0.05882353, 0, 1,
-2.203314, -1.516785, -2.479764, 1, 0.06666667, 0, 1,
-2.156446, 0.5256843, -1.934816, 1, 0.07058824, 0, 1,
-2.132649, 0.9447999, -0.08210553, 1, 0.07843138, 0, 1,
-2.060606, 1.172588, -0.5135598, 1, 0.08235294, 0, 1,
-2.016564, 0.9251449, -0.3859747, 1, 0.09019608, 0, 1,
-2.015151, 0.3442672, -1.941526, 1, 0.09411765, 0, 1,
-2.011884, 0.3971149, -1.244188, 1, 0.1019608, 0, 1,
-2.005253, 0.02210918, -0.7826973, 1, 0.1098039, 0, 1,
-1.942029, -0.1771429, -0.6491923, 1, 0.1137255, 0, 1,
-1.931198, -0.7011686, -1.492914, 1, 0.1215686, 0, 1,
-1.874798, -1.965547, -3.232667, 1, 0.1254902, 0, 1,
-1.866624, 0.5785761, -2.296147, 1, 0.1333333, 0, 1,
-1.863891, -2.109345, -1.969594, 1, 0.1372549, 0, 1,
-1.840725, -1.377462, -1.64714, 1, 0.145098, 0, 1,
-1.839474, 1.417605, -0.4970784, 1, 0.1490196, 0, 1,
-1.801751, 0.846154, -1.391286, 1, 0.1568628, 0, 1,
-1.790927, -1.167387, -3.40262, 1, 0.1607843, 0, 1,
-1.785128, 0.552353, -1.594371, 1, 0.1686275, 0, 1,
-1.771523, 0.6806115, 0.4286317, 1, 0.172549, 0, 1,
-1.767293, 0.07326921, 0.08691207, 1, 0.1803922, 0, 1,
-1.758362, -0.2817677, -3.234023, 1, 0.1843137, 0, 1,
-1.754031, -0.0399144, -2.834244, 1, 0.1921569, 0, 1,
-1.752196, 0.03729011, -0.6544487, 1, 0.1960784, 0, 1,
-1.746206, 0.861773, -1.353984, 1, 0.2039216, 0, 1,
-1.736303, 1.136038, -2.40252, 1, 0.2117647, 0, 1,
-1.719264, -0.5786092, -3.561411, 1, 0.2156863, 0, 1,
-1.711467, 0.1075036, -2.149472, 1, 0.2235294, 0, 1,
-1.708688, -0.2492734, -0.3826537, 1, 0.227451, 0, 1,
-1.699893, 0.1795703, -0.1584146, 1, 0.2352941, 0, 1,
-1.685214, -0.2118213, -1.30249, 1, 0.2392157, 0, 1,
-1.683104, 0.3043079, 0.4041399, 1, 0.2470588, 0, 1,
-1.663045, 0.5574434, -0.4451119, 1, 0.2509804, 0, 1,
-1.644572, -0.3393812, -2.348779, 1, 0.2588235, 0, 1,
-1.623357, -2.576262, -1.486014, 1, 0.2627451, 0, 1,
-1.611319, 2.162863, 0.8005959, 1, 0.2705882, 0, 1,
-1.601992, -1.43483, -2.556516, 1, 0.2745098, 0, 1,
-1.600767, 1.329664, -1.010605, 1, 0.282353, 0, 1,
-1.560154, -0.5734531, -3.047934, 1, 0.2862745, 0, 1,
-1.553805, 1.11027, -0.6107783, 1, 0.2941177, 0, 1,
-1.552391, 1.368738, -1.323301, 1, 0.3019608, 0, 1,
-1.549639, -1.534483, -3.778791, 1, 0.3058824, 0, 1,
-1.544791, 0.217594, -0.6093569, 1, 0.3137255, 0, 1,
-1.5412, 1.255831, -0.1222097, 1, 0.3176471, 0, 1,
-1.518106, 0.7310226, -2.044195, 1, 0.3254902, 0, 1,
-1.515603, -1.069207, -2.372171, 1, 0.3294118, 0, 1,
-1.503106, -0.972589, -2.48993, 1, 0.3372549, 0, 1,
-1.492995, -0.07684261, -3.197874, 1, 0.3411765, 0, 1,
-1.490556, -1.059717, -2.581064, 1, 0.3490196, 0, 1,
-1.486963, 1.377338, -1.229357, 1, 0.3529412, 0, 1,
-1.466968, 0.1188613, -2.635774, 1, 0.3607843, 0, 1,
-1.461114, -0.5369509, 0.02641014, 1, 0.3647059, 0, 1,
-1.456377, -1.745257, -0.4655067, 1, 0.372549, 0, 1,
-1.443067, 0.1491509, -2.431183, 1, 0.3764706, 0, 1,
-1.440964, -0.4482933, -2.968926, 1, 0.3843137, 0, 1,
-1.431819, -0.739215, -3.819654, 1, 0.3882353, 0, 1,
-1.418479, 1.620653, 0.6189522, 1, 0.3960784, 0, 1,
-1.411947, -0.7302423, -2.505421, 1, 0.4039216, 0, 1,
-1.400125, 0.0983147, -2.464278, 1, 0.4078431, 0, 1,
-1.397166, -1.76242, -0.8047199, 1, 0.4156863, 0, 1,
-1.396089, 2.279739, 0.5735899, 1, 0.4196078, 0, 1,
-1.39156, 0.04838662, -0.7501611, 1, 0.427451, 0, 1,
-1.389931, -0.7123641, -2.196953, 1, 0.4313726, 0, 1,
-1.379169, -0.5749059, -2.203142, 1, 0.4392157, 0, 1,
-1.378973, 0.9260362, -0.7208304, 1, 0.4431373, 0, 1,
-1.364068, -1.161885, -2.142137, 1, 0.4509804, 0, 1,
-1.351382, 0.3785458, -2.167813, 1, 0.454902, 0, 1,
-1.347927, 0.2083948, -0.6796941, 1, 0.4627451, 0, 1,
-1.34582, -1.563982, -3.748679, 1, 0.4666667, 0, 1,
-1.344331, 1.812351, -0.3155162, 1, 0.4745098, 0, 1,
-1.335059, 0.81925, -0.3887733, 1, 0.4784314, 0, 1,
-1.334245, -1.970346, -2.637098, 1, 0.4862745, 0, 1,
-1.332178, 0.3688353, -0.6789495, 1, 0.4901961, 0, 1,
-1.327786, 0.8892039, -1.635687, 1, 0.4980392, 0, 1,
-1.302411, 0.5495082, -2.47749, 1, 0.5058824, 0, 1,
-1.301872, -1.339574, -4.367788, 1, 0.509804, 0, 1,
-1.288501, -0.9915358, -2.296637, 1, 0.5176471, 0, 1,
-1.286038, -0.6345252, -1.458778, 1, 0.5215687, 0, 1,
-1.283045, -1.348817, -1.593489, 1, 0.5294118, 0, 1,
-1.280145, 1.630574, -1.420232, 1, 0.5333334, 0, 1,
-1.269965, -1.167596, -2.013409, 1, 0.5411765, 0, 1,
-1.257043, 1.956348, -1.631836, 1, 0.5450981, 0, 1,
-1.256104, -1.418772, -4.365088, 1, 0.5529412, 0, 1,
-1.248436, 2.980289, -0.2728067, 1, 0.5568628, 0, 1,
-1.241543, 1.745387, 1.455074, 1, 0.5647059, 0, 1,
-1.240506, -0.3209892, -1.516103, 1, 0.5686275, 0, 1,
-1.22928, 0.9232782, -0.3375586, 1, 0.5764706, 0, 1,
-1.226064, -1.464021, -1.703351, 1, 0.5803922, 0, 1,
-1.22159, -1.069908, -2.562246, 1, 0.5882353, 0, 1,
-1.215024, 1.234293, -1.408881, 1, 0.5921569, 0, 1,
-1.212701, 0.4913458, -0.1902675, 1, 0.6, 0, 1,
-1.210797, 1.36199, -0.9006547, 1, 0.6078432, 0, 1,
-1.208901, 0.9403823, -0.8493239, 1, 0.6117647, 0, 1,
-1.204726, 1.192075, -1.660885, 1, 0.6196079, 0, 1,
-1.203404, 0.5211021, -2.160578, 1, 0.6235294, 0, 1,
-1.195743, 1.718956, -0.8874665, 1, 0.6313726, 0, 1,
-1.179774, -1.31821, -3.432613, 1, 0.6352941, 0, 1,
-1.179603, 0.1250901, -2.003574, 1, 0.6431373, 0, 1,
-1.174736, 1.269573, -1.875379, 1, 0.6470588, 0, 1,
-1.172713, -0.6440377, -2.370523, 1, 0.654902, 0, 1,
-1.171959, -1.349802, -1.328566, 1, 0.6588235, 0, 1,
-1.168923, -2.32958, -3.314022, 1, 0.6666667, 0, 1,
-1.165511, -1.166504, -2.047732, 1, 0.6705883, 0, 1,
-1.165259, -1.899668, -1.793117, 1, 0.6784314, 0, 1,
-1.162014, 0.02461118, -1.952673, 1, 0.682353, 0, 1,
-1.161699, 1.018344, -1.471863, 1, 0.6901961, 0, 1,
-1.15721, -0.896957, -2.996122, 1, 0.6941177, 0, 1,
-1.141586, -1.728747, -1.253906, 1, 0.7019608, 0, 1,
-1.130888, 1.761239, 0.0529232, 1, 0.7098039, 0, 1,
-1.128593, 0.04518603, -3.40104, 1, 0.7137255, 0, 1,
-1.124301, 1.103884, -1.87147, 1, 0.7215686, 0, 1,
-1.119125, 0.312965, -0.8200542, 1, 0.7254902, 0, 1,
-1.118007, 1.133961, 0.3225453, 1, 0.7333333, 0, 1,
-1.114455, -0.6547906, -2.001863, 1, 0.7372549, 0, 1,
-1.110008, -0.1417583, -1.676071, 1, 0.7450981, 0, 1,
-1.106957, -2.209923, -3.811085, 1, 0.7490196, 0, 1,
-1.102743, -0.590744, -2.419173, 1, 0.7568628, 0, 1,
-1.083465, 1.075425, -1.31914, 1, 0.7607843, 0, 1,
-1.083413, -0.199737, -0.8966314, 1, 0.7686275, 0, 1,
-1.082877, -0.702397, -1.893927, 1, 0.772549, 0, 1,
-1.081685, 1.428266, -0.7783166, 1, 0.7803922, 0, 1,
-1.070395, 0.1363434, -1.675672, 1, 0.7843137, 0, 1,
-1.068424, 0.5937623, -1.607137, 1, 0.7921569, 0, 1,
-1.06408, 0.8684657, -0.4083647, 1, 0.7960784, 0, 1,
-1.063834, -0.04609984, -1.260664, 1, 0.8039216, 0, 1,
-1.062987, 1.60298, -2.914706, 1, 0.8117647, 0, 1,
-1.058374, 0.5245553, -1.298635, 1, 0.8156863, 0, 1,
-1.057583, -1.376841, -1.672742, 1, 0.8235294, 0, 1,
-1.057006, -0.9400504, -2.025306, 1, 0.827451, 0, 1,
-1.056437, 0.7285105, -1.348831, 1, 0.8352941, 0, 1,
-1.040085, 0.1880281, -0.07739279, 1, 0.8392157, 0, 1,
-1.039361, 0.9067298, -0.1088839, 1, 0.8470588, 0, 1,
-1.033931, 2.042431, -0.733233, 1, 0.8509804, 0, 1,
-1.030618, -0.4835234, -2.492138, 1, 0.8588235, 0, 1,
-1.023377, -1.674451, -3.331826, 1, 0.8627451, 0, 1,
-1.019489, 0.8875122, -0.918461, 1, 0.8705882, 0, 1,
-1.014555, 0.0880098, -1.435372, 1, 0.8745098, 0, 1,
-1.013767, -0.2297841, -0.9607536, 1, 0.8823529, 0, 1,
-1.013231, 0.07240561, -1.182338, 1, 0.8862745, 0, 1,
-1.01127, -1.462071, -0.2951965, 1, 0.8941177, 0, 1,
-1.007376, 0.4677756, 0.2779215, 1, 0.8980392, 0, 1,
-1.000277, 0.2519742, -2.793912, 1, 0.9058824, 0, 1,
-0.9997299, 0.001599818, -1.966013, 1, 0.9137255, 0, 1,
-0.9951816, -1.601596, -2.539953, 1, 0.9176471, 0, 1,
-0.9916528, 0.276366, -2.243695, 1, 0.9254902, 0, 1,
-0.9907116, -0.1128009, -1.341888, 1, 0.9294118, 0, 1,
-0.9826014, -0.7392102, -1.86014, 1, 0.9372549, 0, 1,
-0.97492, 1.525281, 0.4325807, 1, 0.9411765, 0, 1,
-0.9690663, 0.677572, 0.5280845, 1, 0.9490196, 0, 1,
-0.9616267, 0.9714428, -1.011398, 1, 0.9529412, 0, 1,
-0.9614639, -0.4724773, -1.858274, 1, 0.9607843, 0, 1,
-0.9593624, 1.460182, 0.1301256, 1, 0.9647059, 0, 1,
-0.958159, -0.07763654, -0.7920031, 1, 0.972549, 0, 1,
-0.9532304, 2.882967, -0.3250011, 1, 0.9764706, 0, 1,
-0.9502214, -1.295418, -3.301489, 1, 0.9843137, 0, 1,
-0.9476229, 1.104324, -0.9556309, 1, 0.9882353, 0, 1,
-0.9397559, -0.1447126, -0.811104, 1, 0.9960784, 0, 1,
-0.9384165, -1.025998, -2.593446, 0.9960784, 1, 0, 1,
-0.9353583, -1.721469, -2.117323, 0.9921569, 1, 0, 1,
-0.9154091, -0.1458, -1.614261, 0.9843137, 1, 0, 1,
-0.9107484, 1.926286, -0.5666692, 0.9803922, 1, 0, 1,
-0.9016606, 0.5886592, -0.4795455, 0.972549, 1, 0, 1,
-0.8967592, -0.7456871, -3.125011, 0.9686275, 1, 0, 1,
-0.8858649, -0.08652084, -3.7184, 0.9607843, 1, 0, 1,
-0.8833144, -1.266663, -1.664988, 0.9568627, 1, 0, 1,
-0.8831736, 1.478415, 0.02833846, 0.9490196, 1, 0, 1,
-0.8820841, -1.342283, -2.513596, 0.945098, 1, 0, 1,
-0.8796584, -1.594217, -2.328137, 0.9372549, 1, 0, 1,
-0.879077, 0.5327252, -0.7652633, 0.9333333, 1, 0, 1,
-0.8756518, 0.6007773, -2.3007, 0.9254902, 1, 0, 1,
-0.8732833, -0.3585369, -3.221181, 0.9215686, 1, 0, 1,
-0.8602985, -0.7870238, -1.952943, 0.9137255, 1, 0, 1,
-0.8599438, -0.849823, -1.738108, 0.9098039, 1, 0, 1,
-0.8597559, -2.741638, -2.109711, 0.9019608, 1, 0, 1,
-0.8596434, -1.501109, -3.102532, 0.8941177, 1, 0, 1,
-0.8556501, -0.1798015, -1.75493, 0.8901961, 1, 0, 1,
-0.8528562, 0.8868003, -2.535671, 0.8823529, 1, 0, 1,
-0.8513397, 0.5573484, -1.848464, 0.8784314, 1, 0, 1,
-0.8401521, -2.529464, -3.992757, 0.8705882, 1, 0, 1,
-0.8366572, -1.14356, -1.913847, 0.8666667, 1, 0, 1,
-0.827879, -1.199373, -3.816663, 0.8588235, 1, 0, 1,
-0.8256609, -0.4604929, -1.953956, 0.854902, 1, 0, 1,
-0.8216774, -2.665077, -2.475128, 0.8470588, 1, 0, 1,
-0.8204079, -0.7970172, -2.730659, 0.8431373, 1, 0, 1,
-0.815729, 1.002492, 0.9172487, 0.8352941, 1, 0, 1,
-0.8148125, 1.314322, -2.361795, 0.8313726, 1, 0, 1,
-0.8147979, -1.239699, -4.859182, 0.8235294, 1, 0, 1,
-0.8117654, -0.4198635, -1.225382, 0.8196079, 1, 0, 1,
-0.8064364, 0.5462661, 1.185909, 0.8117647, 1, 0, 1,
-0.8051769, 0.307736, 1.08739, 0.8078431, 1, 0, 1,
-0.8016559, 0.04470735, -1.779875, 0.8, 1, 0, 1,
-0.7982818, -0.6881168, -3.579733, 0.7921569, 1, 0, 1,
-0.7931134, -0.4117583, -1.400614, 0.7882353, 1, 0, 1,
-0.7929872, -0.1277424, -2.320276, 0.7803922, 1, 0, 1,
-0.7821591, -0.1603022, -1.442781, 0.7764706, 1, 0, 1,
-0.7814913, 1.225916, -1.310189, 0.7686275, 1, 0, 1,
-0.780537, 0.6385965, -0.945839, 0.7647059, 1, 0, 1,
-0.7802272, -0.3695814, -0.795208, 0.7568628, 1, 0, 1,
-0.7771413, 1.427472, -0.2257746, 0.7529412, 1, 0, 1,
-0.7767076, -0.8819478, -0.3034475, 0.7450981, 1, 0, 1,
-0.7729697, 0.1565326, -1.524612, 0.7411765, 1, 0, 1,
-0.7720829, 2.383587, -1.015326, 0.7333333, 1, 0, 1,
-0.770191, -1.687525, -3.356033, 0.7294118, 1, 0, 1,
-0.7650173, 0.5553177, -1.095938, 0.7215686, 1, 0, 1,
-0.7640761, 1.085498, 0.4150262, 0.7176471, 1, 0, 1,
-0.761839, -0.2685106, -2.363468, 0.7098039, 1, 0, 1,
-0.7610661, -0.9147069, -2.621807, 0.7058824, 1, 0, 1,
-0.7601104, 0.5502018, -0.3441775, 0.6980392, 1, 0, 1,
-0.7586696, 0.4040019, -0.715192, 0.6901961, 1, 0, 1,
-0.7570891, -0.4632025, -0.898956, 0.6862745, 1, 0, 1,
-0.749409, 0.3044601, -1.76571, 0.6784314, 1, 0, 1,
-0.7477179, -0.2788262, -1.677693, 0.6745098, 1, 0, 1,
-0.743616, -1.326634, -4.286888, 0.6666667, 1, 0, 1,
-0.7401938, -1.240036, -3.638422, 0.6627451, 1, 0, 1,
-0.7390478, -0.3042512, -1.078911, 0.654902, 1, 0, 1,
-0.7358503, -1.410562, -2.623261, 0.6509804, 1, 0, 1,
-0.7338893, 0.9766368, -0.1623046, 0.6431373, 1, 0, 1,
-0.7231371, 0.5076985, -1.559806, 0.6392157, 1, 0, 1,
-0.7228345, 0.5784672, -0.4968632, 0.6313726, 1, 0, 1,
-0.7206053, 0.6993706, -2.095185, 0.627451, 1, 0, 1,
-0.7183945, -2.245669, -3.243037, 0.6196079, 1, 0, 1,
-0.717292, 0.7467901, 1.25913, 0.6156863, 1, 0, 1,
-0.7129377, -1.382422, -3.931129, 0.6078432, 1, 0, 1,
-0.7017018, -0.9567665, -2.857704, 0.6039216, 1, 0, 1,
-0.6983955, 1.536481, 0.2168851, 0.5960785, 1, 0, 1,
-0.6975471, -0.517112, -2.205251, 0.5882353, 1, 0, 1,
-0.6969823, -0.1069249, -0.5941761, 0.5843138, 1, 0, 1,
-0.6937835, -1.657965, -1.485705, 0.5764706, 1, 0, 1,
-0.6882299, 0.4561373, -1.070131, 0.572549, 1, 0, 1,
-0.6800738, -1.058789, -2.545239, 0.5647059, 1, 0, 1,
-0.6796822, 1.375351, 1.512955, 0.5607843, 1, 0, 1,
-0.6781786, -1.28517, -2.897257, 0.5529412, 1, 0, 1,
-0.6754645, 0.5398529, -1.972577, 0.5490196, 1, 0, 1,
-0.6740543, 0.1831127, -1.278167, 0.5411765, 1, 0, 1,
-0.6732946, 0.4780688, -1.616947, 0.5372549, 1, 0, 1,
-0.6700046, 0.3473417, -0.5033464, 0.5294118, 1, 0, 1,
-0.6670356, -0.6748374, -2.351343, 0.5254902, 1, 0, 1,
-0.6663491, -0.07411175, -1.840141, 0.5176471, 1, 0, 1,
-0.6633416, 0.5460104, 0.9188421, 0.5137255, 1, 0, 1,
-0.6626555, 1.93259, -0.5829631, 0.5058824, 1, 0, 1,
-0.657997, 0.06591522, -3.448552, 0.5019608, 1, 0, 1,
-0.656058, -0.03156872, -0.7410666, 0.4941176, 1, 0, 1,
-0.6378372, -1.463571, -2.587031, 0.4862745, 1, 0, 1,
-0.6376616, 0.8224467, -2.295865, 0.4823529, 1, 0, 1,
-0.6331396, 0.244984, -1.076255, 0.4745098, 1, 0, 1,
-0.6320239, -0.6148059, -2.400671, 0.4705882, 1, 0, 1,
-0.6304781, 0.1954281, -1.785495, 0.4627451, 1, 0, 1,
-0.6243132, -0.3126981, -2.897926, 0.4588235, 1, 0, 1,
-0.6218672, 0.8979488, 1.15085, 0.4509804, 1, 0, 1,
-0.6189115, 0.02549322, -1.764077, 0.4470588, 1, 0, 1,
-0.616393, 0.05254729, -1.487737, 0.4392157, 1, 0, 1,
-0.6147959, 2.257871, -0.7021071, 0.4352941, 1, 0, 1,
-0.61308, 0.9931201, -1.051367, 0.427451, 1, 0, 1,
-0.6064764, -0.7980169, -3.54857, 0.4235294, 1, 0, 1,
-0.6038623, 0.2031866, -0.7608915, 0.4156863, 1, 0, 1,
-0.6023316, -0.1697994, -1.598144, 0.4117647, 1, 0, 1,
-0.6005172, 1.329473, 0.8468003, 0.4039216, 1, 0, 1,
-0.59878, -0.7496322, -2.164154, 0.3960784, 1, 0, 1,
-0.5894294, -0.4496466, -1.913385, 0.3921569, 1, 0, 1,
-0.5875645, -0.4022321, -1.793172, 0.3843137, 1, 0, 1,
-0.5862907, -0.6403581, -0.7817778, 0.3803922, 1, 0, 1,
-0.5846696, -0.7054473, -1.803844, 0.372549, 1, 0, 1,
-0.5834543, 0.5494113, -1.078104, 0.3686275, 1, 0, 1,
-0.5810732, -1.914303, -3.324731, 0.3607843, 1, 0, 1,
-0.5776448, -0.5994239, -2.042965, 0.3568628, 1, 0, 1,
-0.5761942, 0.8032455, 0.4420965, 0.3490196, 1, 0, 1,
-0.5680135, -1.346157, -0.7533956, 0.345098, 1, 0, 1,
-0.5672145, -0.4997391, -2.084151, 0.3372549, 1, 0, 1,
-0.5628943, 0.09492911, -1.504841, 0.3333333, 1, 0, 1,
-0.561438, -0.4178305, -4.111146, 0.3254902, 1, 0, 1,
-0.5591236, -0.8621286, -2.563651, 0.3215686, 1, 0, 1,
-0.5579373, 0.4353923, -2.546425, 0.3137255, 1, 0, 1,
-0.5578619, -1.342623, -2.814261, 0.3098039, 1, 0, 1,
-0.557499, -0.8146819, -2.490618, 0.3019608, 1, 0, 1,
-0.5551146, -1.467614, -4.486904, 0.2941177, 1, 0, 1,
-0.5503221, -0.01396377, -0.4384447, 0.2901961, 1, 0, 1,
-0.5500824, -1.647782, -2.585527, 0.282353, 1, 0, 1,
-0.5497055, -0.6974142, -1.600338, 0.2784314, 1, 0, 1,
-0.5474699, -1.547117, -4.394526, 0.2705882, 1, 0, 1,
-0.5454142, 0.1567324, -1.111542, 0.2666667, 1, 0, 1,
-0.5453815, -1.47774, -1.957254, 0.2588235, 1, 0, 1,
-0.5443239, -0.7548949, -2.831927, 0.254902, 1, 0, 1,
-0.5441133, -0.63133, -2.25478, 0.2470588, 1, 0, 1,
-0.5437058, -0.8814875, -1.904752, 0.2431373, 1, 0, 1,
-0.5436124, 0.279737, -0.5165084, 0.2352941, 1, 0, 1,
-0.5414736, -1.697211, -2.571218, 0.2313726, 1, 0, 1,
-0.540509, -0.4348937, -1.883015, 0.2235294, 1, 0, 1,
-0.5336232, 0.4556557, 0.3712464, 0.2196078, 1, 0, 1,
-0.5263425, -0.05364577, -1.94209, 0.2117647, 1, 0, 1,
-0.5218663, -0.5776632, -3.210329, 0.2078431, 1, 0, 1,
-0.5217789, -0.07999508, -2.763595, 0.2, 1, 0, 1,
-0.521759, 0.3697696, -1.109376, 0.1921569, 1, 0, 1,
-0.5200495, 0.3880709, 0.07191733, 0.1882353, 1, 0, 1,
-0.515542, -0.7980239, -2.150523, 0.1803922, 1, 0, 1,
-0.5130121, 0.4052314, 0.3230664, 0.1764706, 1, 0, 1,
-0.5081963, -1.080803, -1.573022, 0.1686275, 1, 0, 1,
-0.4981679, -0.7302706, -1.222866, 0.1647059, 1, 0, 1,
-0.495733, -1.513178, -4.308172, 0.1568628, 1, 0, 1,
-0.4955796, 0.06246743, -2.081125, 0.1529412, 1, 0, 1,
-0.4896422, -0.3314785, -1.489513, 0.145098, 1, 0, 1,
-0.4877271, -0.06928074, -1.201251, 0.1411765, 1, 0, 1,
-0.4852459, -0.1827216, -2.370947, 0.1333333, 1, 0, 1,
-0.483935, 0.6530808, -0.3498045, 0.1294118, 1, 0, 1,
-0.4838341, 0.5929119, -1.098633, 0.1215686, 1, 0, 1,
-0.483411, -1.001564, -1.967615, 0.1176471, 1, 0, 1,
-0.4804083, 0.2891385, -0.2880061, 0.1098039, 1, 0, 1,
-0.4779395, 0.8151214, 0.01957143, 0.1058824, 1, 0, 1,
-0.4775313, -2.021897, -4.045914, 0.09803922, 1, 0, 1,
-0.4748449, -0.1918397, -1.406272, 0.09019608, 1, 0, 1,
-0.4742721, 0.8095122, -1.7437, 0.08627451, 1, 0, 1,
-0.4740078, -1.397075, -4.591176, 0.07843138, 1, 0, 1,
-0.4728303, 0.4791099, -1.661875, 0.07450981, 1, 0, 1,
-0.4724484, 0.2475772, -1.167544, 0.06666667, 1, 0, 1,
-0.4710291, 1.834275, -0.9686127, 0.0627451, 1, 0, 1,
-0.4681547, 1.223964, -1.663255, 0.05490196, 1, 0, 1,
-0.465003, -0.4453017, -3.153103, 0.05098039, 1, 0, 1,
-0.4633165, 0.1362619, -0.890327, 0.04313726, 1, 0, 1,
-0.4621206, -0.5768289, -1.696769, 0.03921569, 1, 0, 1,
-0.4567796, 2.054862, -0.4476943, 0.03137255, 1, 0, 1,
-0.4511304, -0.8363897, -4.639815, 0.02745098, 1, 0, 1,
-0.4467217, -0.9566722, -4.023529, 0.01960784, 1, 0, 1,
-0.4358012, 0.4217909, 0.05697803, 0.01568628, 1, 0, 1,
-0.4344672, 0.821339, 0.2063005, 0.007843138, 1, 0, 1,
-0.4300838, 0.5922795, 1.120337, 0.003921569, 1, 0, 1,
-0.4291374, 0.3221665, -0.820406, 0, 1, 0.003921569, 1,
-0.4285793, 0.6801371, 0.8180477, 0, 1, 0.01176471, 1,
-0.4240054, -0.6271786, -2.109939, 0, 1, 0.01568628, 1,
-0.4219837, 2.05693, 2.39949, 0, 1, 0.02352941, 1,
-0.4203164, -0.1064013, -0.5775548, 0, 1, 0.02745098, 1,
-0.4110277, -0.1396456, -1.121467, 0, 1, 0.03529412, 1,
-0.4076416, 0.6208555, -0.5311335, 0, 1, 0.03921569, 1,
-0.4062144, 2.249926, 0.5938631, 0, 1, 0.04705882, 1,
-0.4036162, 1.584289, 0.1376619, 0, 1, 0.05098039, 1,
-0.4026921, -0.7687894, -3.930601, 0, 1, 0.05882353, 1,
-0.4007743, -0.7824801, -1.409012, 0, 1, 0.0627451, 1,
-0.4001369, 0.9130987, -1.81055, 0, 1, 0.07058824, 1,
-0.3975986, 0.02074342, -0.63006, 0, 1, 0.07450981, 1,
-0.3911425, -0.2131235, -2.603698, 0, 1, 0.08235294, 1,
-0.3896075, 0.8235529, -0.9235039, 0, 1, 0.08627451, 1,
-0.3895614, 1.616623, 0.04480021, 0, 1, 0.09411765, 1,
-0.3884608, -1.342583, -2.258925, 0, 1, 0.1019608, 1,
-0.3880547, 0.3670619, -0.2476784, 0, 1, 0.1058824, 1,
-0.3879369, 0.7252917, 0.4878391, 0, 1, 0.1137255, 1,
-0.3830498, 2.207458, -0.1173237, 0, 1, 0.1176471, 1,
-0.3810254, -0.6297344, -1.015987, 0, 1, 0.1254902, 1,
-0.378536, -1.494043, -2.606054, 0, 1, 0.1294118, 1,
-0.3780524, 1.479981, -0.1030838, 0, 1, 0.1372549, 1,
-0.3758682, -1.214512, -1.690084, 0, 1, 0.1411765, 1,
-0.3737134, 0.2445255, -0.4184143, 0, 1, 0.1490196, 1,
-0.3695684, 0.381101, 0.8788862, 0, 1, 0.1529412, 1,
-0.3675583, 0.157701, -2.325955, 0, 1, 0.1607843, 1,
-0.3673092, -0.06374187, -1.763773, 0, 1, 0.1647059, 1,
-0.3670453, -1.074194, -3.034495, 0, 1, 0.172549, 1,
-0.3654738, 0.4631916, -1.479606, 0, 1, 0.1764706, 1,
-0.3602867, -1.315079, -2.185985, 0, 1, 0.1843137, 1,
-0.3578305, -0.1230312, -1.890586, 0, 1, 0.1882353, 1,
-0.355941, 1.721611, 0.8555697, 0, 1, 0.1960784, 1,
-0.3555025, 0.2999871, 1.119181, 0, 1, 0.2039216, 1,
-0.3539897, 1.606364, 0.2956961, 0, 1, 0.2078431, 1,
-0.3514883, -0.5954143, -2.329835, 0, 1, 0.2156863, 1,
-0.3511304, -0.7756891, -3.59122, 0, 1, 0.2196078, 1,
-0.3443528, 0.4590811, 0.3954494, 0, 1, 0.227451, 1,
-0.3403656, 1.123449, 0.868744, 0, 1, 0.2313726, 1,
-0.3373159, -0.08268447, -2.043586, 0, 1, 0.2392157, 1,
-0.3369941, -0.617154, -3.269421, 0, 1, 0.2431373, 1,
-0.3351881, 0.8701621, 0.2685159, 0, 1, 0.2509804, 1,
-0.3330196, 0.0285633, -0.05745548, 0, 1, 0.254902, 1,
-0.3327971, 1.271937, 1.307415, 0, 1, 0.2627451, 1,
-0.329962, 0.3089009, -2.017991, 0, 1, 0.2666667, 1,
-0.3291644, -1.456756, -2.935229, 0, 1, 0.2745098, 1,
-0.3267041, 0.2709825, -0.4170186, 0, 1, 0.2784314, 1,
-0.3224184, 0.4953006, -0.5362141, 0, 1, 0.2862745, 1,
-0.3199469, 1.021118, -0.3308026, 0, 1, 0.2901961, 1,
-0.3197393, -1.13123, -0.6070978, 0, 1, 0.2980392, 1,
-0.3193543, -0.3275632, -1.293511, 0, 1, 0.3058824, 1,
-0.3181066, 0.5010411, 0.1315677, 0, 1, 0.3098039, 1,
-0.311337, -2.217091, -1.37842, 0, 1, 0.3176471, 1,
-0.309126, 1.91497, 0.3803566, 0, 1, 0.3215686, 1,
-0.3017398, 0.9928488, -0.1216898, 0, 1, 0.3294118, 1,
-0.3006731, -0.5186043, -3.528563, 0, 1, 0.3333333, 1,
-0.2993852, -1.218261, -4.464746, 0, 1, 0.3411765, 1,
-0.2965697, -0.02733057, -1.49839, 0, 1, 0.345098, 1,
-0.293221, -0.09063711, 0.03161271, 0, 1, 0.3529412, 1,
-0.2914881, -0.8280113, -2.105233, 0, 1, 0.3568628, 1,
-0.2865062, 0.4581914, 0.7319011, 0, 1, 0.3647059, 1,
-0.2815513, 1.572825, 0.1626218, 0, 1, 0.3686275, 1,
-0.2785341, -0.06913956, -1.931987, 0, 1, 0.3764706, 1,
-0.2784076, 0.8725168, -0.206584, 0, 1, 0.3803922, 1,
-0.2718913, -0.9321691, -2.599106, 0, 1, 0.3882353, 1,
-0.2715245, -1.851922, -1.91291, 0, 1, 0.3921569, 1,
-0.2660306, 1.514373, 1.983989, 0, 1, 0.4, 1,
-0.2657668, -0.5367119, -5.668316, 0, 1, 0.4078431, 1,
-0.2647916, 0.5881748, -1.422539, 0, 1, 0.4117647, 1,
-0.2619908, 1.506021, -2.105308, 0, 1, 0.4196078, 1,
-0.2580979, 0.1125829, -1.722579, 0, 1, 0.4235294, 1,
-0.2575555, -1.724492, -2.176766, 0, 1, 0.4313726, 1,
-0.2535586, -2.226051, -4.659352, 0, 1, 0.4352941, 1,
-0.2478971, 0.8440499, 0.5367172, 0, 1, 0.4431373, 1,
-0.2447617, -0.9163115, -3.008885, 0, 1, 0.4470588, 1,
-0.2434717, 0.4448679, -1.076541, 0, 1, 0.454902, 1,
-0.2434121, -1.534216, -2.218698, 0, 1, 0.4588235, 1,
-0.2427451, -1.510681, -2.233727, 0, 1, 0.4666667, 1,
-0.2417012, 0.5254944, 0.5138851, 0, 1, 0.4705882, 1,
-0.2389568, -0.53232, -2.745567, 0, 1, 0.4784314, 1,
-0.2378974, -0.354394, -1.898817, 0, 1, 0.4823529, 1,
-0.2359101, -0.1898874, -1.13777, 0, 1, 0.4901961, 1,
-0.232544, -1.659753, -3.436745, 0, 1, 0.4941176, 1,
-0.2305699, -1.337077, -2.857783, 0, 1, 0.5019608, 1,
-0.2275887, 0.1676843, -1.185833, 0, 1, 0.509804, 1,
-0.227299, 2.190588, -0.4419254, 0, 1, 0.5137255, 1,
-0.2239383, 1.034497, -0.3624624, 0, 1, 0.5215687, 1,
-0.2226462, -0.594968, -6.177113, 0, 1, 0.5254902, 1,
-0.2196182, -0.9508789, -1.826118, 0, 1, 0.5333334, 1,
-0.2184257, 0.1062699, 1.219886, 0, 1, 0.5372549, 1,
-0.2140364, 0.1344607, -1.532102, 0, 1, 0.5450981, 1,
-0.21027, 0.04876088, -1.165724, 0, 1, 0.5490196, 1,
-0.2102217, 1.120384, 1.095774, 0, 1, 0.5568628, 1,
-0.2097414, 0.5106404, -1.356982, 0, 1, 0.5607843, 1,
-0.2046822, 0.1478481, -1.351674, 0, 1, 0.5686275, 1,
-0.2036845, -0.7897573, -3.191872, 0, 1, 0.572549, 1,
-0.1964078, -0.6244354, -2.098658, 0, 1, 0.5803922, 1,
-0.1952158, 1.191821, -0.1783216, 0, 1, 0.5843138, 1,
-0.1939642, 0.06459241, 0.485573, 0, 1, 0.5921569, 1,
-0.1931493, 0.3625462, -0.4049034, 0, 1, 0.5960785, 1,
-0.1904145, 0.4073032, -1.030872, 0, 1, 0.6039216, 1,
-0.1889118, 0.3790294, -0.2261266, 0, 1, 0.6117647, 1,
-0.1819267, -0.3583756, -4.638281, 0, 1, 0.6156863, 1,
-0.1805205, 0.4868143, -0.8095728, 0, 1, 0.6235294, 1,
-0.1752007, -0.3037703, -2.912709, 0, 1, 0.627451, 1,
-0.1639618, -1.92407, -3.947443, 0, 1, 0.6352941, 1,
-0.1618372, -0.4263932, -2.754131, 0, 1, 0.6392157, 1,
-0.1596541, -0.8230714, -3.122641, 0, 1, 0.6470588, 1,
-0.1594143, -0.3933638, -1.727716, 0, 1, 0.6509804, 1,
-0.1578543, -1.559267, -3.468925, 0, 1, 0.6588235, 1,
-0.150735, -0.06580357, -0.8967596, 0, 1, 0.6627451, 1,
-0.1506327, -0.7192456, -1.090698, 0, 1, 0.6705883, 1,
-0.14624, 0.5562786, 0.9782214, 0, 1, 0.6745098, 1,
-0.1441636, 0.07259125, -0.836507, 0, 1, 0.682353, 1,
-0.1418589, 0.3155343, -0.066314, 0, 1, 0.6862745, 1,
-0.1414257, -0.8242893, -3.104238, 0, 1, 0.6941177, 1,
-0.1410956, -0.2745584, -2.829158, 0, 1, 0.7019608, 1,
-0.1389314, -1.270555, -2.182281, 0, 1, 0.7058824, 1,
-0.1381569, -0.174617, -2.514318, 0, 1, 0.7137255, 1,
-0.1357809, 0.53756, -0.6153689, 0, 1, 0.7176471, 1,
-0.1287344, 0.3672688, -1.456549, 0, 1, 0.7254902, 1,
-0.1263679, -1.294584, -4.470519, 0, 1, 0.7294118, 1,
-0.1255427, 1.144159, -0.7458456, 0, 1, 0.7372549, 1,
-0.1230203, -0.1071427, -2.983972, 0, 1, 0.7411765, 1,
-0.1220927, -0.1864874, -2.554871, 0, 1, 0.7490196, 1,
-0.1204159, -0.948679, -2.452645, 0, 1, 0.7529412, 1,
-0.1167031, -0.4959155, -1.949493, 0, 1, 0.7607843, 1,
-0.1117972, -1.443104, -3.107497, 0, 1, 0.7647059, 1,
-0.1082837, 1.561211, 0.5721343, 0, 1, 0.772549, 1,
-0.1073145, 1.270718, -0.03402279, 0, 1, 0.7764706, 1,
-0.1066161, 2.355466, 0.8970808, 0, 1, 0.7843137, 1,
-0.1058177, -0.6921991, -3.723894, 0, 1, 0.7882353, 1,
-0.1040579, 0.287918, -1.359037, 0, 1, 0.7960784, 1,
-0.1040153, 0.9046814, 0.9339623, 0, 1, 0.8039216, 1,
-0.09949766, 0.7131927, -0.9096391, 0, 1, 0.8078431, 1,
-0.0986599, 0.1996608, 0.6382155, 0, 1, 0.8156863, 1,
-0.09375083, -0.6792272, -3.903373, 0, 1, 0.8196079, 1,
-0.09365192, 1.140617, -0.2370516, 0, 1, 0.827451, 1,
-0.09212964, 0.1015379, -0.4303363, 0, 1, 0.8313726, 1,
-0.09177361, 0.06492956, 0.09225186, 0, 1, 0.8392157, 1,
-0.08643594, -0.08614729, -3.495991, 0, 1, 0.8431373, 1,
-0.08239759, -3.140792, -2.806545, 0, 1, 0.8509804, 1,
-0.07534104, -0.398717, -4.176744, 0, 1, 0.854902, 1,
-0.07443856, 0.3834795, -0.4442755, 0, 1, 0.8627451, 1,
-0.07170893, 0.6403333, -0.7960746, 0, 1, 0.8666667, 1,
-0.07123525, 1.161135, -1.67241, 0, 1, 0.8745098, 1,
-0.0708309, -0.6673312, -2.877885, 0, 1, 0.8784314, 1,
-0.07030813, 0.8682465, -0.04193791, 0, 1, 0.8862745, 1,
-0.06769654, 1.610162, 0.09440365, 0, 1, 0.8901961, 1,
-0.06418273, -1.693936, -5.153038, 0, 1, 0.8980392, 1,
-0.06254158, 1.635849, -0.6663776, 0, 1, 0.9058824, 1,
-0.06095187, 1.057205, -0.704677, 0, 1, 0.9098039, 1,
-0.05860316, 0.8648374, -0.001832726, 0, 1, 0.9176471, 1,
-0.05578288, 0.2246426, 0.2644533, 0, 1, 0.9215686, 1,
-0.05457284, 1.415049, 0.390916, 0, 1, 0.9294118, 1,
-0.05062053, 1.937199, 0.8897018, 0, 1, 0.9333333, 1,
-0.05028062, -0.2572278, -4.672988, 0, 1, 0.9411765, 1,
-0.046475, 0.6319565, 0.5455931, 0, 1, 0.945098, 1,
-0.04401301, -0.8962978, -4.651053, 0, 1, 0.9529412, 1,
-0.040673, -1.481573, -2.552261, 0, 1, 0.9568627, 1,
-0.03944214, 1.888571, 0.5808681, 0, 1, 0.9647059, 1,
-0.03829021, 0.3902138, 0.238116, 0, 1, 0.9686275, 1,
-0.03510465, 1.17834, -1.202534, 0, 1, 0.9764706, 1,
-0.03457437, 0.4194485, -0.9824355, 0, 1, 0.9803922, 1,
-0.03289568, -1.09395, -3.354003, 0, 1, 0.9882353, 1,
-0.02889741, -0.4238119, -2.824476, 0, 1, 0.9921569, 1,
-0.02868904, -0.4355128, -1.650543, 0, 1, 1, 1,
-0.02577588, 0.9320168, 0.02776773, 0, 0.9921569, 1, 1,
-0.02511489, -0.876721, -2.923446, 0, 0.9882353, 1, 1,
-0.02108801, -0.8052672, -2.468358, 0, 0.9803922, 1, 1,
-0.02023232, -0.4343123, -1.90231, 0, 0.9764706, 1, 1,
-0.01436633, -1.351825, -3.473967, 0, 0.9686275, 1, 1,
-0.01313244, 0.9883426, 0.02368295, 0, 0.9647059, 1, 1,
-0.01174811, -2.065325, -2.215998, 0, 0.9568627, 1, 1,
-0.01066597, -2.160751, -3.24776, 0, 0.9529412, 1, 1,
0.001522891, 1.604585, 1.099833, 0, 0.945098, 1, 1,
0.002843801, 1.012848, -2.020918, 0, 0.9411765, 1, 1,
0.003430287, -0.1654865, 3.086467, 0, 0.9333333, 1, 1,
0.005547221, -1.194484, 2.293619, 0, 0.9294118, 1, 1,
0.006833496, 0.6560692, 0.6116281, 0, 0.9215686, 1, 1,
0.00914318, -1.065646, 3.970237, 0, 0.9176471, 1, 1,
0.009277167, -0.8089685, 3.513609, 0, 0.9098039, 1, 1,
0.02075336, -0.4553826, 3.995183, 0, 0.9058824, 1, 1,
0.02232238, -1.16274, 3.31056, 0, 0.8980392, 1, 1,
0.02668806, -0.5109137, 4.01734, 0, 0.8901961, 1, 1,
0.02762934, -0.6675407, 2.87582, 0, 0.8862745, 1, 1,
0.02962694, 0.5309062, -0.7846153, 0, 0.8784314, 1, 1,
0.0338155, 0.7052304, 0.09977448, 0, 0.8745098, 1, 1,
0.03423366, 1.604726, -0.9297457, 0, 0.8666667, 1, 1,
0.03994692, -0.2848935, 2.440601, 0, 0.8627451, 1, 1,
0.0415721, -0.3188848, 1.830568, 0, 0.854902, 1, 1,
0.04315165, 0.02998984, 0.5624589, 0, 0.8509804, 1, 1,
0.04499725, 0.4415496, 1.196736, 0, 0.8431373, 1, 1,
0.04578248, 0.5174055, -1.698783, 0, 0.8392157, 1, 1,
0.04744079, -0.3628292, 4.870082, 0, 0.8313726, 1, 1,
0.04895314, 1.147211, 0.2702389, 0, 0.827451, 1, 1,
0.05073616, 0.2019628, 0.1410057, 0, 0.8196079, 1, 1,
0.05462898, 1.06073, 1.859889, 0, 0.8156863, 1, 1,
0.05862845, 0.08589328, 1.118124, 0, 0.8078431, 1, 1,
0.06168339, -1.45965, 3.23285, 0, 0.8039216, 1, 1,
0.06247358, 0.3944417, 1.084806, 0, 0.7960784, 1, 1,
0.06510545, -1.293125, 3.079209, 0, 0.7882353, 1, 1,
0.0666388, 1.649511, 1.15767, 0, 0.7843137, 1, 1,
0.07393044, -0.3089136, 2.076659, 0, 0.7764706, 1, 1,
0.07599258, 1.079621, 0.591873, 0, 0.772549, 1, 1,
0.07636125, -1.533398, 2.587596, 0, 0.7647059, 1, 1,
0.07702283, 0.3283026, 0.7140039, 0, 0.7607843, 1, 1,
0.07939103, 0.1932859, 1.344984, 0, 0.7529412, 1, 1,
0.08480272, 0.2002075, 1.260261, 0, 0.7490196, 1, 1,
0.08695834, 0.1526532, 1.472612, 0, 0.7411765, 1, 1,
0.08881414, 0.07383519, 1.123509, 0, 0.7372549, 1, 1,
0.09024823, 0.715111, -1.704597, 0, 0.7294118, 1, 1,
0.093, -1.62437, 3.160559, 0, 0.7254902, 1, 1,
0.09381705, 0.9750714, 1.295971, 0, 0.7176471, 1, 1,
0.09572416, -0.3995541, 2.154474, 0, 0.7137255, 1, 1,
0.1042594, -0.1347155, 2.071622, 0, 0.7058824, 1, 1,
0.1052968, 0.4201533, 1.080835, 0, 0.6980392, 1, 1,
0.1072515, 1.343407, -1.565104, 0, 0.6941177, 1, 1,
0.1079282, 0.512041, 0.4255803, 0, 0.6862745, 1, 1,
0.1099395, -0.5351699, 3.029484, 0, 0.682353, 1, 1,
0.1105608, -0.4176553, 3.617523, 0, 0.6745098, 1, 1,
0.1113251, -1.827793, 0.5760806, 0, 0.6705883, 1, 1,
0.113723, -1.056899, 1.875969, 0, 0.6627451, 1, 1,
0.1137851, 0.01767444, 0.3310765, 0, 0.6588235, 1, 1,
0.1159817, 1.377879, -1.29352, 0, 0.6509804, 1, 1,
0.1185687, 0.6096418, -0.3556457, 0, 0.6470588, 1, 1,
0.1187095, 0.287466, -1.286158, 0, 0.6392157, 1, 1,
0.1187332, -0.05182284, 0.7349764, 0, 0.6352941, 1, 1,
0.1192728, -0.2195556, 3.765573, 0, 0.627451, 1, 1,
0.1222233, 0.3443789, -0.1508131, 0, 0.6235294, 1, 1,
0.1241434, -1.43775, 1.208178, 0, 0.6156863, 1, 1,
0.1353075, -0.1524305, 1.130708, 0, 0.6117647, 1, 1,
0.135988, 2.891825, -1.073627, 0, 0.6039216, 1, 1,
0.1373205, -0.624281, 3.520807, 0, 0.5960785, 1, 1,
0.1457511, -0.7303147, 3.908511, 0, 0.5921569, 1, 1,
0.145928, -0.7006258, 3.508124, 0, 0.5843138, 1, 1,
0.148237, -0.1707015, 1.932941, 0, 0.5803922, 1, 1,
0.1486878, -1.814047, 3.527165, 0, 0.572549, 1, 1,
0.1510473, 0.9935787, -1.672098, 0, 0.5686275, 1, 1,
0.1539425, -0.9863176, 3.76282, 0, 0.5607843, 1, 1,
0.1646162, 0.07646693, 0.05664524, 0, 0.5568628, 1, 1,
0.1682606, 0.2496157, 0.6066957, 0, 0.5490196, 1, 1,
0.1705215, -0.3825815, 2.224961, 0, 0.5450981, 1, 1,
0.1724769, -0.803943, 4.308911, 0, 0.5372549, 1, 1,
0.1746661, -0.9726203, 2.851084, 0, 0.5333334, 1, 1,
0.1771191, -1.378493, 2.989862, 0, 0.5254902, 1, 1,
0.1779204, -0.8526606, 2.700985, 0, 0.5215687, 1, 1,
0.1780847, -1.138215, 2.65069, 0, 0.5137255, 1, 1,
0.1788371, 2.915992, -0.006400608, 0, 0.509804, 1, 1,
0.1817293, 0.6544706, 1.311744, 0, 0.5019608, 1, 1,
0.1834981, -1.407588, 3.541114, 0, 0.4941176, 1, 1,
0.188846, -0.6203476, 5.050586, 0, 0.4901961, 1, 1,
0.1916005, -0.4404909, 2.855887, 0, 0.4823529, 1, 1,
0.1928101, 1.218473, -0.2713425, 0, 0.4784314, 1, 1,
0.1939065, 0.9136543, -0.5343081, 0, 0.4705882, 1, 1,
0.1945264, 0.1123288, 0.6659292, 0, 0.4666667, 1, 1,
0.1967615, 0.3297775, 1.779153, 0, 0.4588235, 1, 1,
0.2002281, -0.0372886, 0.7415018, 0, 0.454902, 1, 1,
0.2055602, -0.06819812, 1.414532, 0, 0.4470588, 1, 1,
0.2073186, -2.024135, 2.61319, 0, 0.4431373, 1, 1,
0.2085533, 1.069899, 2.582722, 0, 0.4352941, 1, 1,
0.2115337, 0.3201652, 0.6954741, 0, 0.4313726, 1, 1,
0.2122838, -0.5963991, 3.990994, 0, 0.4235294, 1, 1,
0.2155648, -0.3663985, 2.463675, 0, 0.4196078, 1, 1,
0.2156868, -1.446223, 2.856233, 0, 0.4117647, 1, 1,
0.2195871, 1.133163, 0.7634772, 0, 0.4078431, 1, 1,
0.2199416, -1.483593, 3.605286, 0, 0.4, 1, 1,
0.2222519, -0.6761573, 1.943849, 0, 0.3921569, 1, 1,
0.2275154, 1.579515, -0.4756648, 0, 0.3882353, 1, 1,
0.2297372, -0.1449842, 1.66087, 0, 0.3803922, 1, 1,
0.2308752, 0.4891338, 0.6622331, 0, 0.3764706, 1, 1,
0.2340794, -1.931359, 3.974015, 0, 0.3686275, 1, 1,
0.2394699, -0.4177952, 2.885566, 0, 0.3647059, 1, 1,
0.2459706, 1.053623, 1.218745, 0, 0.3568628, 1, 1,
0.2468518, 0.4318635, 1.305986, 0, 0.3529412, 1, 1,
0.2470245, -0.212194, 1.756371, 0, 0.345098, 1, 1,
0.2484961, 0.4686262, 0.1401832, 0, 0.3411765, 1, 1,
0.2490195, -0.8507173, 2.660316, 0, 0.3333333, 1, 1,
0.2498112, 1.076214, -0.06868039, 0, 0.3294118, 1, 1,
0.2502711, -0.08857458, 2.828758, 0, 0.3215686, 1, 1,
0.2535146, -1.674572, 2.706209, 0, 0.3176471, 1, 1,
0.2604246, 1.016189, 1.041762, 0, 0.3098039, 1, 1,
0.2605282, 0.2081108, 1.467697, 0, 0.3058824, 1, 1,
0.2659119, -1.646507, 2.010034, 0, 0.2980392, 1, 1,
0.2681299, 0.8282821, -1.072939, 0, 0.2901961, 1, 1,
0.2689854, -3.908935, 2.149099, 0, 0.2862745, 1, 1,
0.2694069, -1.033016, 2.677994, 0, 0.2784314, 1, 1,
0.2781799, 1.304481, -0.09764837, 0, 0.2745098, 1, 1,
0.2829635, 1.452268, -1.532687, 0, 0.2666667, 1, 1,
0.2847791, -0.5625433, 3.157499, 0, 0.2627451, 1, 1,
0.2906586, 1.048954, -1.457763, 0, 0.254902, 1, 1,
0.291085, -0.1700322, 3.096, 0, 0.2509804, 1, 1,
0.2939455, -0.862039, 3.948636, 0, 0.2431373, 1, 1,
0.2959279, -0.983927, 2.609842, 0, 0.2392157, 1, 1,
0.3004918, -0.0481558, 2.091811, 0, 0.2313726, 1, 1,
0.3023893, 0.3252818, -1.388611, 0, 0.227451, 1, 1,
0.306567, 1.413298, -0.3204037, 0, 0.2196078, 1, 1,
0.3071651, -0.7682391, 2.919355, 0, 0.2156863, 1, 1,
0.3081552, 0.7363935, -1.767241, 0, 0.2078431, 1, 1,
0.3096356, 1.662372, 0.2242369, 0, 0.2039216, 1, 1,
0.3115243, -1.064209, 1.922602, 0, 0.1960784, 1, 1,
0.3137366, 0.5353851, 0.811206, 0, 0.1882353, 1, 1,
0.3174882, -0.1165081, 1.11551, 0, 0.1843137, 1, 1,
0.3181986, 1.34224, 0.2482081, 0, 0.1764706, 1, 1,
0.3186708, -0.8057161, 2.21799, 0, 0.172549, 1, 1,
0.3187684, -0.1583316, 3.202448, 0, 0.1647059, 1, 1,
0.3190192, 0.9385568, -0.2774271, 0, 0.1607843, 1, 1,
0.3209133, 0.9082777, -0.3129882, 0, 0.1529412, 1, 1,
0.3236364, 0.2563384, 0.1579961, 0, 0.1490196, 1, 1,
0.3294607, -1.296212, 4.852868, 0, 0.1411765, 1, 1,
0.330026, -0.2402074, 1.415502, 0, 0.1372549, 1, 1,
0.3375784, -0.9106562, 3.276944, 0, 0.1294118, 1, 1,
0.3433741, -0.4906079, 3.694687, 0, 0.1254902, 1, 1,
0.3446945, -0.5553104, 3.836022, 0, 0.1176471, 1, 1,
0.3492161, 0.2553935, 0.8865227, 0, 0.1137255, 1, 1,
0.3503892, -0.6746073, 2.676731, 0, 0.1058824, 1, 1,
0.352083, 0.3171891, 1.313184, 0, 0.09803922, 1, 1,
0.3540723, -0.2215731, 2.568066, 0, 0.09411765, 1, 1,
0.3654773, -1.127993, 0.7401684, 0, 0.08627451, 1, 1,
0.3683558, 1.680103, 0.6194909, 0, 0.08235294, 1, 1,
0.3759565, -0.1635813, 2.990754, 0, 0.07450981, 1, 1,
0.3762831, 1.416916, -0.6617615, 0, 0.07058824, 1, 1,
0.3836579, 0.5257384, -0.0133747, 0, 0.0627451, 1, 1,
0.3866288, 0.3355729, 2.071247, 0, 0.05882353, 1, 1,
0.3890292, -0.3577508, 3.540101, 0, 0.05098039, 1, 1,
0.3896149, 0.5215359, -0.3885611, 0, 0.04705882, 1, 1,
0.3957696, 1.234966, 0.9592107, 0, 0.03921569, 1, 1,
0.399764, -2.664486, 2.713175, 0, 0.03529412, 1, 1,
0.4028222, -1.733999, 3.84213, 0, 0.02745098, 1, 1,
0.4029478, -1.292683, 2.383033, 0, 0.02352941, 1, 1,
0.4044971, -0.70121, 2.61282, 0, 0.01568628, 1, 1,
0.4046964, -0.3213517, 1.637669, 0, 0.01176471, 1, 1,
0.4078847, -1.249694, 1.668188, 0, 0.003921569, 1, 1,
0.4089007, 0.9410365, 0.05718861, 0.003921569, 0, 1, 1,
0.4099151, 0.4343938, 1.76027, 0.007843138, 0, 1, 1,
0.4107684, -0.4084335, 1.333801, 0.01568628, 0, 1, 1,
0.4119704, -0.4322608, 2.323805, 0.01960784, 0, 1, 1,
0.4164036, -1.183639, 1.350556, 0.02745098, 0, 1, 1,
0.4199941, 0.2704794, 1.163184, 0.03137255, 0, 1, 1,
0.4225873, 0.3401688, 2.551245, 0.03921569, 0, 1, 1,
0.4291334, 2.04257, 1.062529, 0.04313726, 0, 1, 1,
0.4324874, 1.124483, -0.6960523, 0.05098039, 0, 1, 1,
0.4346489, -0.3945415, 2.763589, 0.05490196, 0, 1, 1,
0.4387361, 2.231412, 0.2634904, 0.0627451, 0, 1, 1,
0.4402274, 1.814246, 0.6855843, 0.06666667, 0, 1, 1,
0.4415348, -2.463026, 3.23124, 0.07450981, 0, 1, 1,
0.4505151, 0.4812214, 1.094347, 0.07843138, 0, 1, 1,
0.4525389, -0.3361478, 1.953786, 0.08627451, 0, 1, 1,
0.4556844, -1.015739, 1.326658, 0.09019608, 0, 1, 1,
0.4598959, -0.5483151, 0.8408926, 0.09803922, 0, 1, 1,
0.4601789, 0.2464119, 2.301187, 0.1058824, 0, 1, 1,
0.4728148, -0.6208968, 3.098597, 0.1098039, 0, 1, 1,
0.4748527, -1.020405, 3.600687, 0.1176471, 0, 1, 1,
0.4812735, 0.8862737, 0.5203814, 0.1215686, 0, 1, 1,
0.487818, 0.09437981, 0.5289396, 0.1294118, 0, 1, 1,
0.4886756, 0.06642359, 1.99933, 0.1333333, 0, 1, 1,
0.4902146, 0.1157754, 0.8360333, 0.1411765, 0, 1, 1,
0.4904514, 0.8117974, 1.139763, 0.145098, 0, 1, 1,
0.5022919, 0.7231314, 0.379715, 0.1529412, 0, 1, 1,
0.506088, -0.4887553, 1.027562, 0.1568628, 0, 1, 1,
0.5110287, -1.536202, 3.401518, 0.1647059, 0, 1, 1,
0.5148729, 0.9414744, 0.4864894, 0.1686275, 0, 1, 1,
0.527133, 0.9642529, 1.009324, 0.1764706, 0, 1, 1,
0.5273191, -0.2138216, 1.091195, 0.1803922, 0, 1, 1,
0.5293569, -1.441385, 2.369457, 0.1882353, 0, 1, 1,
0.5295249, -0.6246601, 2.492098, 0.1921569, 0, 1, 1,
0.5318316, -0.5960968, 2.40054, 0.2, 0, 1, 1,
0.5329372, 0.7070186, 1.819264, 0.2078431, 0, 1, 1,
0.5370036, 1.264534, 0.9253509, 0.2117647, 0, 1, 1,
0.5380475, 0.8493543, 1.342674, 0.2196078, 0, 1, 1,
0.5433944, -0.610527, 3.344758, 0.2235294, 0, 1, 1,
0.5516369, 0.2230123, 0.6355546, 0.2313726, 0, 1, 1,
0.5539392, 0.2129522, 1.036402, 0.2352941, 0, 1, 1,
0.556421, 1.341546, 0.9871449, 0.2431373, 0, 1, 1,
0.5569357, 0.6142741, 1.678606, 0.2470588, 0, 1, 1,
0.5641524, -0.003399752, 2.452724, 0.254902, 0, 1, 1,
0.566439, 0.2256163, 3.35182, 0.2588235, 0, 1, 1,
0.5678827, -0.8839655, 2.997185, 0.2666667, 0, 1, 1,
0.5708802, -0.05589926, 1.029554, 0.2705882, 0, 1, 1,
0.5736681, 0.4314084, 1.121261, 0.2784314, 0, 1, 1,
0.5747934, 1.680028, 0.4894505, 0.282353, 0, 1, 1,
0.5753791, 0.02293551, -0.173561, 0.2901961, 0, 1, 1,
0.5756669, -1.603046, 4.195735, 0.2941177, 0, 1, 1,
0.5776674, 0.1097474, 3.390018, 0.3019608, 0, 1, 1,
0.5785219, 2.0818, 0.5506283, 0.3098039, 0, 1, 1,
0.5786517, -1.713363, 3.073757, 0.3137255, 0, 1, 1,
0.5796822, -0.545612, 3.44271, 0.3215686, 0, 1, 1,
0.5814523, -0.3481363, 2.134551, 0.3254902, 0, 1, 1,
0.5898177, -0.7024274, 2.935221, 0.3333333, 0, 1, 1,
0.5915443, 0.1635836, 2.028919, 0.3372549, 0, 1, 1,
0.5948011, -0.5159912, 2.236589, 0.345098, 0, 1, 1,
0.5969309, -0.1466269, 0.3440422, 0.3490196, 0, 1, 1,
0.597181, -0.4945228, 3.637141, 0.3568628, 0, 1, 1,
0.5974191, 0.400827, 1.288887, 0.3607843, 0, 1, 1,
0.6003723, 0.7050076, 2.208518, 0.3686275, 0, 1, 1,
0.6017103, -0.1429536, 1.396528, 0.372549, 0, 1, 1,
0.6035616, -1.536524, 3.254454, 0.3803922, 0, 1, 1,
0.6036657, -2.02096, 3.852286, 0.3843137, 0, 1, 1,
0.6089688, -1.332773, 1.833681, 0.3921569, 0, 1, 1,
0.6126851, -0.4488814, 2.029282, 0.3960784, 0, 1, 1,
0.6143152, 0.57598, -1.127644, 0.4039216, 0, 1, 1,
0.6192701, -1.273221, 4.129294, 0.4117647, 0, 1, 1,
0.6358194, -1.561901, 3.998924, 0.4156863, 0, 1, 1,
0.6380051, 1.500576, 1.508025, 0.4235294, 0, 1, 1,
0.6417837, -0.240118, 1.679147, 0.427451, 0, 1, 1,
0.6418622, 0.3102357, 3.246245, 0.4352941, 0, 1, 1,
0.6435249, 2.029952, 1.40381, 0.4392157, 0, 1, 1,
0.6439109, -1.203366, 1.172245, 0.4470588, 0, 1, 1,
0.645394, -0.3794065, 4.200929, 0.4509804, 0, 1, 1,
0.6473887, -1.179776, 2.55937, 0.4588235, 0, 1, 1,
0.6502119, 0.01847614, 1.875854, 0.4627451, 0, 1, 1,
0.6547958, -0.1929533, 1.733911, 0.4705882, 0, 1, 1,
0.658978, 0.09686441, 0.3614851, 0.4745098, 0, 1, 1,
0.6611863, 1.203219, 0.828191, 0.4823529, 0, 1, 1,
0.665538, -0.5010226, 0.4328103, 0.4862745, 0, 1, 1,
0.6680383, -0.6355553, 2.504873, 0.4941176, 0, 1, 1,
0.6706237, 1.224864, -0.01514289, 0.5019608, 0, 1, 1,
0.6727101, 0.2614708, -0.03138223, 0.5058824, 0, 1, 1,
0.6751603, 0.06695105, 2.280055, 0.5137255, 0, 1, 1,
0.6873688, 1.490719, 0.3005914, 0.5176471, 0, 1, 1,
0.6877517, -1.327412, 1.849505, 0.5254902, 0, 1, 1,
0.6935852, 0.4346415, 3.378235, 0.5294118, 0, 1, 1,
0.6960503, 0.07924493, 0.6093593, 0.5372549, 0, 1, 1,
0.6962852, -0.6379237, 1.872778, 0.5411765, 0, 1, 1,
0.6964763, -0.02584685, 2.288109, 0.5490196, 0, 1, 1,
0.7003502, -0.3645818, 2.037939, 0.5529412, 0, 1, 1,
0.7018873, 1.879667, 1.985899, 0.5607843, 0, 1, 1,
0.703092, 0.08018117, 1.866623, 0.5647059, 0, 1, 1,
0.7112138, 0.01150492, 1.661756, 0.572549, 0, 1, 1,
0.7134153, 0.6912116, 1.584542, 0.5764706, 0, 1, 1,
0.7147717, -1.223928, 3.867246, 0.5843138, 0, 1, 1,
0.7168867, -0.6659279, 0.271017, 0.5882353, 0, 1, 1,
0.7318731, 1.589153, 1.530123, 0.5960785, 0, 1, 1,
0.7326422, 1.752266, 2.363424, 0.6039216, 0, 1, 1,
0.7327343, 0.4685498, 0.3170629, 0.6078432, 0, 1, 1,
0.7331136, -0.5166039, 2.848402, 0.6156863, 0, 1, 1,
0.736799, -0.9335198, 2.990112, 0.6196079, 0, 1, 1,
0.7413517, 0.8149494, 3.135395, 0.627451, 0, 1, 1,
0.7426579, 0.02504886, 2.389357, 0.6313726, 0, 1, 1,
0.7557151, -0.3652867, 2.635468, 0.6392157, 0, 1, 1,
0.7600067, -0.06611484, 1.321838, 0.6431373, 0, 1, 1,
0.7612075, -0.8996085, 3.686236, 0.6509804, 0, 1, 1,
0.7641913, 1.673247, 1.017008, 0.654902, 0, 1, 1,
0.7674049, -0.3154137, 1.433266, 0.6627451, 0, 1, 1,
0.7716725, -1.807619, 2.535895, 0.6666667, 0, 1, 1,
0.7724544, -1.074853, 2.626256, 0.6745098, 0, 1, 1,
0.7735295, 1.432232, -0.8835039, 0.6784314, 0, 1, 1,
0.7739983, 0.4530528, 1.526509, 0.6862745, 0, 1, 1,
0.7778729, 0.1192766, 1.918692, 0.6901961, 0, 1, 1,
0.7837495, 0.01712373, 3.533743, 0.6980392, 0, 1, 1,
0.7855926, -0.4038873, -0.1742041, 0.7058824, 0, 1, 1,
0.7916502, -0.06434023, 0.4476709, 0.7098039, 0, 1, 1,
0.7925736, -1.009769, 1.468295, 0.7176471, 0, 1, 1,
0.7965065, 0.773552, 0.9462384, 0.7215686, 0, 1, 1,
0.7982737, 0.7568188, -0.4260112, 0.7294118, 0, 1, 1,
0.7983198, -0.09544533, 1.672187, 0.7333333, 0, 1, 1,
0.8019428, 0.7751993, 1.067402, 0.7411765, 0, 1, 1,
0.804884, -0.8248088, 3.756586, 0.7450981, 0, 1, 1,
0.8133881, 0.5004918, 1.357689, 0.7529412, 0, 1, 1,
0.8150898, -0.8671489, 1.71423, 0.7568628, 0, 1, 1,
0.8202689, -0.9350594, 4.387813, 0.7647059, 0, 1, 1,
0.8215085, 0.9926317, 2.230778, 0.7686275, 0, 1, 1,
0.8222528, -0.9643582, 2.273852, 0.7764706, 0, 1, 1,
0.8235819, 1.982887, 2.765456, 0.7803922, 0, 1, 1,
0.8252488, 0.9434765, 2.548506, 0.7882353, 0, 1, 1,
0.8344675, 0.3941765, 1.233398, 0.7921569, 0, 1, 1,
0.8397494, 0.362082, 0.4771409, 0.8, 0, 1, 1,
0.8449943, 0.453753, -0.9450776, 0.8078431, 0, 1, 1,
0.8466204, 0.1018651, 0.4904212, 0.8117647, 0, 1, 1,
0.8534795, -1.913227, 3.627669, 0.8196079, 0, 1, 1,
0.8622365, -0.03310501, 0.533128, 0.8235294, 0, 1, 1,
0.8648949, -1.504187, 1.350348, 0.8313726, 0, 1, 1,
0.8722434, -1.135325, 4.078001, 0.8352941, 0, 1, 1,
0.8731694, 0.7125331, 0.8237118, 0.8431373, 0, 1, 1,
0.8734675, 1.2235, 0.4202884, 0.8470588, 0, 1, 1,
0.8753434, -1.917165, 1.967533, 0.854902, 0, 1, 1,
0.8792579, -1.87782, 3.056739, 0.8588235, 0, 1, 1,
0.8804326, 0.9395224, 1.927281, 0.8666667, 0, 1, 1,
0.8846245, 0.6110499, 0.7076032, 0.8705882, 0, 1, 1,
0.8906154, 0.3133323, -0.2465572, 0.8784314, 0, 1, 1,
0.9066625, -0.180287, -0.600189, 0.8823529, 0, 1, 1,
0.9116113, -0.56089, 2.918636, 0.8901961, 0, 1, 1,
0.913947, 2.047423, -0.001000787, 0.8941177, 0, 1, 1,
0.9166195, 0.1754792, 1.000988, 0.9019608, 0, 1, 1,
0.9171618, 1.036932, 1.382804, 0.9098039, 0, 1, 1,
0.9202591, 0.05870082, 0.7121241, 0.9137255, 0, 1, 1,
0.9264967, -1.231266, 5.256023, 0.9215686, 0, 1, 1,
0.9284298, -0.9033588, 1.551042, 0.9254902, 0, 1, 1,
0.9299269, -0.3144397, 3.195256, 0.9333333, 0, 1, 1,
0.9320098, 0.4608027, 1.042442, 0.9372549, 0, 1, 1,
0.9321935, -0.5920201, 0.6955856, 0.945098, 0, 1, 1,
0.9341391, -1.574378, 3.481467, 0.9490196, 0, 1, 1,
0.9343284, -0.1620306, 3.446376, 0.9568627, 0, 1, 1,
0.9362544, 0.5109383, 0.5012288, 0.9607843, 0, 1, 1,
0.9363501, 0.816792, 0.7287318, 0.9686275, 0, 1, 1,
0.9372982, -0.9716515, 1.423463, 0.972549, 0, 1, 1,
0.9381541, -0.5602606, 3.816807, 0.9803922, 0, 1, 1,
0.9431952, -0.2756601, 1.448108, 0.9843137, 0, 1, 1,
0.9458606, -0.06498501, 1.637379, 0.9921569, 0, 1, 1,
0.94702, -2.929642, 1.825747, 0.9960784, 0, 1, 1,
0.954927, -0.661282, 1.665262, 1, 0, 0.9960784, 1,
0.9593061, -1.260534, 4.829885, 1, 0, 0.9882353, 1,
0.959806, 0.3757553, 1.234045, 1, 0, 0.9843137, 1,
0.9682712, 0.2043547, 0.2155508, 1, 0, 0.9764706, 1,
0.9727795, -0.4755346, 3.355615, 1, 0, 0.972549, 1,
0.9729354, -1.568658, 3.174269, 1, 0, 0.9647059, 1,
0.9769571, 0.05299076, 0.5076867, 1, 0, 0.9607843, 1,
0.9790486, 1.189996, 0.3597268, 1, 0, 0.9529412, 1,
0.9835918, -1.635104, 2.478325, 1, 0, 0.9490196, 1,
0.9972237, -1.24206, 3.41414, 1, 0, 0.9411765, 1,
0.9975367, -0.5396829, 2.38163, 1, 0, 0.9372549, 1,
1.00301, -1.97788, 3.292577, 1, 0, 0.9294118, 1,
1.010413, 0.3215715, 1.934988, 1, 0, 0.9254902, 1,
1.019102, -1.359364, 2.845729, 1, 0, 0.9176471, 1,
1.025036, -0.1547343, 2.312427, 1, 0, 0.9137255, 1,
1.025407, -1.314683, 3.643152, 1, 0, 0.9058824, 1,
1.025912, -0.2717546, 1.761951, 1, 0, 0.9019608, 1,
1.02658, -0.1931224, 1.868817, 1, 0, 0.8941177, 1,
1.032525, -1.184316, 2.868245, 1, 0, 0.8862745, 1,
1.044904, 0.3010424, 3.482685, 1, 0, 0.8823529, 1,
1.046268, 1.378256, 1.084091, 1, 0, 0.8745098, 1,
1.055053, 1.898323, 0.847745, 1, 0, 0.8705882, 1,
1.05571, -0.3649667, 3.576164, 1, 0, 0.8627451, 1,
1.059144, -2.018698, 2.742135, 1, 0, 0.8588235, 1,
1.06707, -0.4987239, 2.983658, 1, 0, 0.8509804, 1,
1.073094, 0.01777458, 0.03323172, 1, 0, 0.8470588, 1,
1.087383, 0.7946455, -0.6946754, 1, 0, 0.8392157, 1,
1.092005, -1.317038, 2.181498, 1, 0, 0.8352941, 1,
1.093133, -0.08600677, 3.310674, 1, 0, 0.827451, 1,
1.100659, 0.2425931, 1.72604, 1, 0, 0.8235294, 1,
1.10383, -0.4081702, 2.500149, 1, 0, 0.8156863, 1,
1.104952, -0.5163082, 0.331679, 1, 0, 0.8117647, 1,
1.105772, -0.3286535, 1.285869, 1, 0, 0.8039216, 1,
1.108031, 0.5524423, 0.5064131, 1, 0, 0.7960784, 1,
1.11276, -1.396551, 3.332917, 1, 0, 0.7921569, 1,
1.114662, 0.4583308, 1.009592, 1, 0, 0.7843137, 1,
1.119186, 0.2909895, 3.425956, 1, 0, 0.7803922, 1,
1.122437, -0.2493231, 1.912539, 1, 0, 0.772549, 1,
1.125484, 0.8029854, 0.2613448, 1, 0, 0.7686275, 1,
1.125681, 0.5653073, 0.8475199, 1, 0, 0.7607843, 1,
1.128213, -0.06085666, 0.5398968, 1, 0, 0.7568628, 1,
1.129028, 0.6865792, 0.9228145, 1, 0, 0.7490196, 1,
1.135117, 1.08303, 0.9258553, 1, 0, 0.7450981, 1,
1.13564, 0.6826768, 1.399879, 1, 0, 0.7372549, 1,
1.144738, 0.01316899, 1.403169, 1, 0, 0.7333333, 1,
1.157965, 0.5922694, 2.392257, 1, 0, 0.7254902, 1,
1.158016, 1.214708, 0.4140744, 1, 0, 0.7215686, 1,
1.176023, -0.3816675, -0.230052, 1, 0, 0.7137255, 1,
1.176274, 0.2586526, 1.751897, 1, 0, 0.7098039, 1,
1.178109, -0.0547381, 0.5214341, 1, 0, 0.7019608, 1,
1.179399, 0.4307783, 2.4439, 1, 0, 0.6941177, 1,
1.1803, 0.8577845, -0.04974931, 1, 0, 0.6901961, 1,
1.203794, -1.289825, 1.573256, 1, 0, 0.682353, 1,
1.205392, -0.1021905, 1.640248, 1, 0, 0.6784314, 1,
1.210177, 0.09645697, 2.17919, 1, 0, 0.6705883, 1,
1.213115, 1.62289, 0.3871384, 1, 0, 0.6666667, 1,
1.228347, 1.932292, 2.067067, 1, 0, 0.6588235, 1,
1.229132, 0.1506697, -1.08, 1, 0, 0.654902, 1,
1.231431, -1.04465, 1.804017, 1, 0, 0.6470588, 1,
1.250215, 0.7126595, -2.088392, 1, 0, 0.6431373, 1,
1.257424, -0.3549941, 1.593606, 1, 0, 0.6352941, 1,
1.261912, -0.1410748, 3.650823, 1, 0, 0.6313726, 1,
1.28644, -0.5845761, 0.5465099, 1, 0, 0.6235294, 1,
1.289199, -0.5835091, 1.351736, 1, 0, 0.6196079, 1,
1.298473, -0.283222, 1.670013, 1, 0, 0.6117647, 1,
1.30523, -0.005588823, 2.840769, 1, 0, 0.6078432, 1,
1.30604, -1.767228, 5.297071, 1, 0, 0.6, 1,
1.306228, 2.013366, -0.06096044, 1, 0, 0.5921569, 1,
1.308247, 0.7943777, 0.7281433, 1, 0, 0.5882353, 1,
1.310763, -1.148186, 2.590616, 1, 0, 0.5803922, 1,
1.319208, -1.492494, 1.548042, 1, 0, 0.5764706, 1,
1.322422, 1.685368, 1.774999, 1, 0, 0.5686275, 1,
1.326204, -0.03512995, 1.370016, 1, 0, 0.5647059, 1,
1.329813, -1.046625, 1.770213, 1, 0, 0.5568628, 1,
1.330405, 0.5905204, 2.120956, 1, 0, 0.5529412, 1,
1.332435, 0.4179019, 1.211633, 1, 0, 0.5450981, 1,
1.332666, 0.08551953, 2.069081, 1, 0, 0.5411765, 1,
1.335865, -0.1957371, 2.555938, 1, 0, 0.5333334, 1,
1.340097, -0.4406997, 0.9696373, 1, 0, 0.5294118, 1,
1.345673, 0.2846213, 2.379626, 1, 0, 0.5215687, 1,
1.348968, 0.4265328, 1.813617, 1, 0, 0.5176471, 1,
1.367748, 0.1282532, 1.453811, 1, 0, 0.509804, 1,
1.368081, -0.9086711, 2.763769, 1, 0, 0.5058824, 1,
1.369824, -1.035345, 2.492278, 1, 0, 0.4980392, 1,
1.3736, -0.00191873, 1.890256, 1, 0, 0.4901961, 1,
1.401248, 0.07158498, 1.494515, 1, 0, 0.4862745, 1,
1.408124, -1.050271, 2.762112, 1, 0, 0.4784314, 1,
1.411041, -2.297375, 2.900095, 1, 0, 0.4745098, 1,
1.414622, 0.3892804, 0.06249219, 1, 0, 0.4666667, 1,
1.421429, -0.003298665, 2.497378, 1, 0, 0.4627451, 1,
1.437256, -0.1593797, 1.915602, 1, 0, 0.454902, 1,
1.449578, -0.6396607, 1.30265, 1, 0, 0.4509804, 1,
1.465577, -1.693126, 2.754608, 1, 0, 0.4431373, 1,
1.466086, 1.090943, 0.4067124, 1, 0, 0.4392157, 1,
1.469006, 0.4270445, 3.484957, 1, 0, 0.4313726, 1,
1.472742, 0.1969672, 1.250056, 1, 0, 0.427451, 1,
1.486699, -0.4935465, 2.529238, 1, 0, 0.4196078, 1,
1.500712, 1.659982, 0.7926762, 1, 0, 0.4156863, 1,
1.511318, -0.1155492, 1.238609, 1, 0, 0.4078431, 1,
1.513294, 0.685423, 3.222646, 1, 0, 0.4039216, 1,
1.513977, 1.815812, -0.01006119, 1, 0, 0.3960784, 1,
1.539734, -0.2150041, 3.322887, 1, 0, 0.3882353, 1,
1.548058, 2.549131, 0.8710111, 1, 0, 0.3843137, 1,
1.562198, 0.3554866, 0.1608315, 1, 0, 0.3764706, 1,
1.562747, -0.2858448, 3.488948, 1, 0, 0.372549, 1,
1.564156, 0.6207334, 0.1680374, 1, 0, 0.3647059, 1,
1.606347, -0.06885943, 1.665555, 1, 0, 0.3607843, 1,
1.628307, 0.3317593, 1.284001, 1, 0, 0.3529412, 1,
1.64255, -1.449037, 1.596526, 1, 0, 0.3490196, 1,
1.6609, 1.03432, 0.963869, 1, 0, 0.3411765, 1,
1.672556, 1.044745, 1.032135, 1, 0, 0.3372549, 1,
1.677168, 0.7926621, 1.60391, 1, 0, 0.3294118, 1,
1.709228, 0.2474248, 2.815079, 1, 0, 0.3254902, 1,
1.75282, -0.0113419, 2.810714, 1, 0, 0.3176471, 1,
1.763907, -0.006813136, 1.863295, 1, 0, 0.3137255, 1,
1.803489, 0.06409932, 2.220396, 1, 0, 0.3058824, 1,
1.808362, -1.227526, 3.549007, 1, 0, 0.2980392, 1,
1.836945, -1.33503, 1.511699, 1, 0, 0.2941177, 1,
1.843783, -0.4058273, -0.008978809, 1, 0, 0.2862745, 1,
1.854589, 0.1363848, 1.12137, 1, 0, 0.282353, 1,
1.861497, -0.3005188, 0.9838153, 1, 0, 0.2745098, 1,
1.878165, 0.4016424, 2.487121, 1, 0, 0.2705882, 1,
1.884451, 0.7059627, 1.482799, 1, 0, 0.2627451, 1,
1.910658, 0.7072042, 0.7081147, 1, 0, 0.2588235, 1,
1.910974, 0.4178292, 0.887381, 1, 0, 0.2509804, 1,
1.919906, 0.2449492, 2.541519, 1, 0, 0.2470588, 1,
1.920925, 0.9834251, 3.253147, 1, 0, 0.2392157, 1,
1.92131, 0.6063155, 0.403907, 1, 0, 0.2352941, 1,
1.948568, -0.2376812, 2.837742, 1, 0, 0.227451, 1,
1.955242, -0.3381423, 2.753644, 1, 0, 0.2235294, 1,
2.001512, -1.383819, 2.994186, 1, 0, 0.2156863, 1,
2.022357, 1.238545, 2.666523, 1, 0, 0.2117647, 1,
2.053238, 0.9725124, 0.08363312, 1, 0, 0.2039216, 1,
2.054833, -1.726175, 1.251224, 1, 0, 0.1960784, 1,
2.074588, 1.408961, 1.836241, 1, 0, 0.1921569, 1,
2.098252, 0.4016333, 1.920174, 1, 0, 0.1843137, 1,
2.100618, 0.5299732, 2.117669, 1, 0, 0.1803922, 1,
2.128379, 3.188577, 0.1353791, 1, 0, 0.172549, 1,
2.152685, -0.6828234, 1.220432, 1, 0, 0.1686275, 1,
2.172495, 2.096797, -0.537751, 1, 0, 0.1607843, 1,
2.179577, -0.1087243, 2.341514, 1, 0, 0.1568628, 1,
2.17977, 2.494509, 1.941739, 1, 0, 0.1490196, 1,
2.183239, -1.353136, 1.724351, 1, 0, 0.145098, 1,
2.198651, -0.6711187, 2.896942, 1, 0, 0.1372549, 1,
2.259139, 0.1243051, 3.893984, 1, 0, 0.1333333, 1,
2.261555, 0.4298988, -0.007053325, 1, 0, 0.1254902, 1,
2.288942, -0.8494873, 1.076847, 1, 0, 0.1215686, 1,
2.296041, 0.3062724, -0.09001672, 1, 0, 0.1137255, 1,
2.299186, -1.546324, 2.661083, 1, 0, 0.1098039, 1,
2.334642, 0.5116258, 1.678602, 1, 0, 0.1019608, 1,
2.33763, -0.1782024, 1.975042, 1, 0, 0.09411765, 1,
2.368542, 0.4079535, 2.02731, 1, 0, 0.09019608, 1,
2.368999, -0.6074959, 0.4192172, 1, 0, 0.08235294, 1,
2.393518, 0.1842526, 1.73024, 1, 0, 0.07843138, 1,
2.407162, 0.2036293, 0.6360022, 1, 0, 0.07058824, 1,
2.416473, 1.376346, -0.5420231, 1, 0, 0.06666667, 1,
2.437983, 0.4186555, 0.6012457, 1, 0, 0.05882353, 1,
2.545816, -0.02455105, 0.9209495, 1, 0, 0.05490196, 1,
2.565533, -1.007623, 0.2312057, 1, 0, 0.04705882, 1,
2.610517, -0.8306807, 2.59942, 1, 0, 0.04313726, 1,
2.639487, 0.4118665, 2.152358, 1, 0, 0.03529412, 1,
2.666516, 0.7384326, 1.956494, 1, 0, 0.03137255, 1,
2.681417, -0.6519639, 1.228159, 1, 0, 0.02352941, 1,
2.89853, 0.9073782, 1.458593, 1, 0, 0.01960784, 1,
2.996211, 0.7570449, 0.5191246, 1, 0, 0.01176471, 1,
3.44479, 0.2383128, 2.454623, 1, 0, 0.007843138, 1
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
0.07680798, -5.111963, -8.121987, 0, -0.5, 0.5, 0.5,
0.07680798, -5.111963, -8.121987, 1, -0.5, 0.5, 0.5,
0.07680798, -5.111963, -8.121987, 1, 1.5, 0.5, 0.5,
0.07680798, -5.111963, -8.121987, 0, 1.5, 0.5, 0.5
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
-4.43292, -0.3601789, -8.121987, 0, -0.5, 0.5, 0.5,
-4.43292, -0.3601789, -8.121987, 1, -0.5, 0.5, 0.5,
-4.43292, -0.3601789, -8.121987, 1, 1.5, 0.5, 0.5,
-4.43292, -0.3601789, -8.121987, 0, 1.5, 0.5, 0.5
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
-4.43292, -5.111963, -0.4400213, 0, -0.5, 0.5, 0.5,
-4.43292, -5.111963, -0.4400213, 1, -0.5, 0.5, 0.5,
-4.43292, -5.111963, -0.4400213, 1, 1.5, 0.5, 0.5,
-4.43292, -5.111963, -0.4400213, 0, 1.5, 0.5, 0.5
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
-3, -4.015398, -6.349226,
3, -4.015398, -6.349226,
-3, -4.015398, -6.349226,
-3, -4.198158, -6.644686,
-2, -4.015398, -6.349226,
-2, -4.198158, -6.644686,
-1, -4.015398, -6.349226,
-1, -4.198158, -6.644686,
0, -4.015398, -6.349226,
0, -4.198158, -6.644686,
1, -4.015398, -6.349226,
1, -4.198158, -6.644686,
2, -4.015398, -6.349226,
2, -4.198158, -6.644686,
3, -4.015398, -6.349226,
3, -4.198158, -6.644686
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
-3, -4.56368, -7.235607, 0, -0.5, 0.5, 0.5,
-3, -4.56368, -7.235607, 1, -0.5, 0.5, 0.5,
-3, -4.56368, -7.235607, 1, 1.5, 0.5, 0.5,
-3, -4.56368, -7.235607, 0, 1.5, 0.5, 0.5,
-2, -4.56368, -7.235607, 0, -0.5, 0.5, 0.5,
-2, -4.56368, -7.235607, 1, -0.5, 0.5, 0.5,
-2, -4.56368, -7.235607, 1, 1.5, 0.5, 0.5,
-2, -4.56368, -7.235607, 0, 1.5, 0.5, 0.5,
-1, -4.56368, -7.235607, 0, -0.5, 0.5, 0.5,
-1, -4.56368, -7.235607, 1, -0.5, 0.5, 0.5,
-1, -4.56368, -7.235607, 1, 1.5, 0.5, 0.5,
-1, -4.56368, -7.235607, 0, 1.5, 0.5, 0.5,
0, -4.56368, -7.235607, 0, -0.5, 0.5, 0.5,
0, -4.56368, -7.235607, 1, -0.5, 0.5, 0.5,
0, -4.56368, -7.235607, 1, 1.5, 0.5, 0.5,
0, -4.56368, -7.235607, 0, 1.5, 0.5, 0.5,
1, -4.56368, -7.235607, 0, -0.5, 0.5, 0.5,
1, -4.56368, -7.235607, 1, -0.5, 0.5, 0.5,
1, -4.56368, -7.235607, 1, 1.5, 0.5, 0.5,
1, -4.56368, -7.235607, 0, 1.5, 0.5, 0.5,
2, -4.56368, -7.235607, 0, -0.5, 0.5, 0.5,
2, -4.56368, -7.235607, 1, -0.5, 0.5, 0.5,
2, -4.56368, -7.235607, 1, 1.5, 0.5, 0.5,
2, -4.56368, -7.235607, 0, 1.5, 0.5, 0.5,
3, -4.56368, -7.235607, 0, -0.5, 0.5, 0.5,
3, -4.56368, -7.235607, 1, -0.5, 0.5, 0.5,
3, -4.56368, -7.235607, 1, 1.5, 0.5, 0.5,
3, -4.56368, -7.235607, 0, 1.5, 0.5, 0.5
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
-3.392214, -2, -6.349226,
-3.392214, 2, -6.349226,
-3.392214, -2, -6.349226,
-3.565665, -2, -6.644686,
-3.392214, 0, -6.349226,
-3.565665, 0, -6.644686,
-3.392214, 2, -6.349226,
-3.565665, 2, -6.644686
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
-3.912567, -2, -7.235607, 0, -0.5, 0.5, 0.5,
-3.912567, -2, -7.235607, 1, -0.5, 0.5, 0.5,
-3.912567, -2, -7.235607, 1, 1.5, 0.5, 0.5,
-3.912567, -2, -7.235607, 0, 1.5, 0.5, 0.5,
-3.912567, 0, -7.235607, 0, -0.5, 0.5, 0.5,
-3.912567, 0, -7.235607, 1, -0.5, 0.5, 0.5,
-3.912567, 0, -7.235607, 1, 1.5, 0.5, 0.5,
-3.912567, 0, -7.235607, 0, 1.5, 0.5, 0.5,
-3.912567, 2, -7.235607, 0, -0.5, 0.5, 0.5,
-3.912567, 2, -7.235607, 1, -0.5, 0.5, 0.5,
-3.912567, 2, -7.235607, 1, 1.5, 0.5, 0.5,
-3.912567, 2, -7.235607, 0, 1.5, 0.5, 0.5
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
-3.392214, -4.015398, -6,
-3.392214, -4.015398, 4,
-3.392214, -4.015398, -6,
-3.565665, -4.198158, -6,
-3.392214, -4.015398, -4,
-3.565665, -4.198158, -4,
-3.392214, -4.015398, -2,
-3.565665, -4.198158, -2,
-3.392214, -4.015398, 0,
-3.565665, -4.198158, 0,
-3.392214, -4.015398, 2,
-3.565665, -4.198158, 2,
-3.392214, -4.015398, 4,
-3.565665, -4.198158, 4
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
"-6",
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
-3.912567, -4.56368, -6, 0, -0.5, 0.5, 0.5,
-3.912567, -4.56368, -6, 1, -0.5, 0.5, 0.5,
-3.912567, -4.56368, -6, 1, 1.5, 0.5, 0.5,
-3.912567, -4.56368, -6, 0, 1.5, 0.5, 0.5,
-3.912567, -4.56368, -4, 0, -0.5, 0.5, 0.5,
-3.912567, -4.56368, -4, 1, -0.5, 0.5, 0.5,
-3.912567, -4.56368, -4, 1, 1.5, 0.5, 0.5,
-3.912567, -4.56368, -4, 0, 1.5, 0.5, 0.5,
-3.912567, -4.56368, -2, 0, -0.5, 0.5, 0.5,
-3.912567, -4.56368, -2, 1, -0.5, 0.5, 0.5,
-3.912567, -4.56368, -2, 1, 1.5, 0.5, 0.5,
-3.912567, -4.56368, -2, 0, 1.5, 0.5, 0.5,
-3.912567, -4.56368, 0, 0, -0.5, 0.5, 0.5,
-3.912567, -4.56368, 0, 1, -0.5, 0.5, 0.5,
-3.912567, -4.56368, 0, 1, 1.5, 0.5, 0.5,
-3.912567, -4.56368, 0, 0, 1.5, 0.5, 0.5,
-3.912567, -4.56368, 2, 0, -0.5, 0.5, 0.5,
-3.912567, -4.56368, 2, 1, -0.5, 0.5, 0.5,
-3.912567, -4.56368, 2, 1, 1.5, 0.5, 0.5,
-3.912567, -4.56368, 2, 0, 1.5, 0.5, 0.5,
-3.912567, -4.56368, 4, 0, -0.5, 0.5, 0.5,
-3.912567, -4.56368, 4, 1, -0.5, 0.5, 0.5,
-3.912567, -4.56368, 4, 1, 1.5, 0.5, 0.5,
-3.912567, -4.56368, 4, 0, 1.5, 0.5, 0.5
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
-3.392214, -4.015398, -6.349226,
-3.392214, 3.29504, -6.349226,
-3.392214, -4.015398, 5.469183,
-3.392214, 3.29504, 5.469183,
-3.392214, -4.015398, -6.349226,
-3.392214, -4.015398, 5.469183,
-3.392214, 3.29504, -6.349226,
-3.392214, 3.29504, 5.469183,
-3.392214, -4.015398, -6.349226,
3.54583, -4.015398, -6.349226,
-3.392214, -4.015398, 5.469183,
3.54583, -4.015398, 5.469183,
-3.392214, 3.29504, -6.349226,
3.54583, 3.29504, -6.349226,
-3.392214, 3.29504, 5.469183,
3.54583, 3.29504, 5.469183,
3.54583, -4.015398, -6.349226,
3.54583, 3.29504, -6.349226,
3.54583, -4.015398, 5.469183,
3.54583, 3.29504, 5.469183,
3.54583, -4.015398, -6.349226,
3.54583, -4.015398, 5.469183,
3.54583, 3.29504, -6.349226,
3.54583, 3.29504, 5.469183
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
var radius = 8.29397;
var distance = 36.90081;
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
mvMatrix.translate( -0.07680798, 0.3601789, 0.4400213 );
mvMatrix.scale( 1.292526, 1.226685, 0.7587826 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.90081);
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
isopropylammonium<-read.table("isopropylammonium.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-isopropylammonium$V2
```

```
## Error in eval(expr, envir, enclos): object 'isopropylammonium' not found
```

```r
y<-isopropylammonium$V3
```

```
## Error in eval(expr, envir, enclos): object 'isopropylammonium' not found
```

```r
z<-isopropylammonium$V4
```

```
## Error in eval(expr, envir, enclos): object 'isopropylammonium' not found
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
-3.291174, 1.019724, 0.2395312, 0, 0, 1, 1, 1,
-2.796551, -0.3754958, -1.836041, 1, 0, 0, 1, 1,
-2.660542, -1.307087, -1.393602, 1, 0, 0, 1, 1,
-2.545012, 1.201232, -2.437419, 1, 0, 0, 1, 1,
-2.527736, -0.5762317, -2.030224, 1, 0, 0, 1, 1,
-2.41422, 0.2171472, -2.98578, 1, 0, 0, 1, 1,
-2.398716, 0.5047007, -0.9100137, 0, 0, 0, 1, 1,
-2.338819, 1.054785, 0.3610956, 0, 0, 0, 1, 1,
-2.279569, 0.8713744, -1.531964, 0, 0, 0, 1, 1,
-2.257446, 1.105479, -1.436115, 0, 0, 0, 1, 1,
-2.235247, 1.883566, 0.06933731, 0, 0, 0, 1, 1,
-2.203314, -1.516785, -2.479764, 0, 0, 0, 1, 1,
-2.156446, 0.5256843, -1.934816, 0, 0, 0, 1, 1,
-2.132649, 0.9447999, -0.08210553, 1, 1, 1, 1, 1,
-2.060606, 1.172588, -0.5135598, 1, 1, 1, 1, 1,
-2.016564, 0.9251449, -0.3859747, 1, 1, 1, 1, 1,
-2.015151, 0.3442672, -1.941526, 1, 1, 1, 1, 1,
-2.011884, 0.3971149, -1.244188, 1, 1, 1, 1, 1,
-2.005253, 0.02210918, -0.7826973, 1, 1, 1, 1, 1,
-1.942029, -0.1771429, -0.6491923, 1, 1, 1, 1, 1,
-1.931198, -0.7011686, -1.492914, 1, 1, 1, 1, 1,
-1.874798, -1.965547, -3.232667, 1, 1, 1, 1, 1,
-1.866624, 0.5785761, -2.296147, 1, 1, 1, 1, 1,
-1.863891, -2.109345, -1.969594, 1, 1, 1, 1, 1,
-1.840725, -1.377462, -1.64714, 1, 1, 1, 1, 1,
-1.839474, 1.417605, -0.4970784, 1, 1, 1, 1, 1,
-1.801751, 0.846154, -1.391286, 1, 1, 1, 1, 1,
-1.790927, -1.167387, -3.40262, 1, 1, 1, 1, 1,
-1.785128, 0.552353, -1.594371, 0, 0, 1, 1, 1,
-1.771523, 0.6806115, 0.4286317, 1, 0, 0, 1, 1,
-1.767293, 0.07326921, 0.08691207, 1, 0, 0, 1, 1,
-1.758362, -0.2817677, -3.234023, 1, 0, 0, 1, 1,
-1.754031, -0.0399144, -2.834244, 1, 0, 0, 1, 1,
-1.752196, 0.03729011, -0.6544487, 1, 0, 0, 1, 1,
-1.746206, 0.861773, -1.353984, 0, 0, 0, 1, 1,
-1.736303, 1.136038, -2.40252, 0, 0, 0, 1, 1,
-1.719264, -0.5786092, -3.561411, 0, 0, 0, 1, 1,
-1.711467, 0.1075036, -2.149472, 0, 0, 0, 1, 1,
-1.708688, -0.2492734, -0.3826537, 0, 0, 0, 1, 1,
-1.699893, 0.1795703, -0.1584146, 0, 0, 0, 1, 1,
-1.685214, -0.2118213, -1.30249, 0, 0, 0, 1, 1,
-1.683104, 0.3043079, 0.4041399, 1, 1, 1, 1, 1,
-1.663045, 0.5574434, -0.4451119, 1, 1, 1, 1, 1,
-1.644572, -0.3393812, -2.348779, 1, 1, 1, 1, 1,
-1.623357, -2.576262, -1.486014, 1, 1, 1, 1, 1,
-1.611319, 2.162863, 0.8005959, 1, 1, 1, 1, 1,
-1.601992, -1.43483, -2.556516, 1, 1, 1, 1, 1,
-1.600767, 1.329664, -1.010605, 1, 1, 1, 1, 1,
-1.560154, -0.5734531, -3.047934, 1, 1, 1, 1, 1,
-1.553805, 1.11027, -0.6107783, 1, 1, 1, 1, 1,
-1.552391, 1.368738, -1.323301, 1, 1, 1, 1, 1,
-1.549639, -1.534483, -3.778791, 1, 1, 1, 1, 1,
-1.544791, 0.217594, -0.6093569, 1, 1, 1, 1, 1,
-1.5412, 1.255831, -0.1222097, 1, 1, 1, 1, 1,
-1.518106, 0.7310226, -2.044195, 1, 1, 1, 1, 1,
-1.515603, -1.069207, -2.372171, 1, 1, 1, 1, 1,
-1.503106, -0.972589, -2.48993, 0, 0, 1, 1, 1,
-1.492995, -0.07684261, -3.197874, 1, 0, 0, 1, 1,
-1.490556, -1.059717, -2.581064, 1, 0, 0, 1, 1,
-1.486963, 1.377338, -1.229357, 1, 0, 0, 1, 1,
-1.466968, 0.1188613, -2.635774, 1, 0, 0, 1, 1,
-1.461114, -0.5369509, 0.02641014, 1, 0, 0, 1, 1,
-1.456377, -1.745257, -0.4655067, 0, 0, 0, 1, 1,
-1.443067, 0.1491509, -2.431183, 0, 0, 0, 1, 1,
-1.440964, -0.4482933, -2.968926, 0, 0, 0, 1, 1,
-1.431819, -0.739215, -3.819654, 0, 0, 0, 1, 1,
-1.418479, 1.620653, 0.6189522, 0, 0, 0, 1, 1,
-1.411947, -0.7302423, -2.505421, 0, 0, 0, 1, 1,
-1.400125, 0.0983147, -2.464278, 0, 0, 0, 1, 1,
-1.397166, -1.76242, -0.8047199, 1, 1, 1, 1, 1,
-1.396089, 2.279739, 0.5735899, 1, 1, 1, 1, 1,
-1.39156, 0.04838662, -0.7501611, 1, 1, 1, 1, 1,
-1.389931, -0.7123641, -2.196953, 1, 1, 1, 1, 1,
-1.379169, -0.5749059, -2.203142, 1, 1, 1, 1, 1,
-1.378973, 0.9260362, -0.7208304, 1, 1, 1, 1, 1,
-1.364068, -1.161885, -2.142137, 1, 1, 1, 1, 1,
-1.351382, 0.3785458, -2.167813, 1, 1, 1, 1, 1,
-1.347927, 0.2083948, -0.6796941, 1, 1, 1, 1, 1,
-1.34582, -1.563982, -3.748679, 1, 1, 1, 1, 1,
-1.344331, 1.812351, -0.3155162, 1, 1, 1, 1, 1,
-1.335059, 0.81925, -0.3887733, 1, 1, 1, 1, 1,
-1.334245, -1.970346, -2.637098, 1, 1, 1, 1, 1,
-1.332178, 0.3688353, -0.6789495, 1, 1, 1, 1, 1,
-1.327786, 0.8892039, -1.635687, 1, 1, 1, 1, 1,
-1.302411, 0.5495082, -2.47749, 0, 0, 1, 1, 1,
-1.301872, -1.339574, -4.367788, 1, 0, 0, 1, 1,
-1.288501, -0.9915358, -2.296637, 1, 0, 0, 1, 1,
-1.286038, -0.6345252, -1.458778, 1, 0, 0, 1, 1,
-1.283045, -1.348817, -1.593489, 1, 0, 0, 1, 1,
-1.280145, 1.630574, -1.420232, 1, 0, 0, 1, 1,
-1.269965, -1.167596, -2.013409, 0, 0, 0, 1, 1,
-1.257043, 1.956348, -1.631836, 0, 0, 0, 1, 1,
-1.256104, -1.418772, -4.365088, 0, 0, 0, 1, 1,
-1.248436, 2.980289, -0.2728067, 0, 0, 0, 1, 1,
-1.241543, 1.745387, 1.455074, 0, 0, 0, 1, 1,
-1.240506, -0.3209892, -1.516103, 0, 0, 0, 1, 1,
-1.22928, 0.9232782, -0.3375586, 0, 0, 0, 1, 1,
-1.226064, -1.464021, -1.703351, 1, 1, 1, 1, 1,
-1.22159, -1.069908, -2.562246, 1, 1, 1, 1, 1,
-1.215024, 1.234293, -1.408881, 1, 1, 1, 1, 1,
-1.212701, 0.4913458, -0.1902675, 1, 1, 1, 1, 1,
-1.210797, 1.36199, -0.9006547, 1, 1, 1, 1, 1,
-1.208901, 0.9403823, -0.8493239, 1, 1, 1, 1, 1,
-1.204726, 1.192075, -1.660885, 1, 1, 1, 1, 1,
-1.203404, 0.5211021, -2.160578, 1, 1, 1, 1, 1,
-1.195743, 1.718956, -0.8874665, 1, 1, 1, 1, 1,
-1.179774, -1.31821, -3.432613, 1, 1, 1, 1, 1,
-1.179603, 0.1250901, -2.003574, 1, 1, 1, 1, 1,
-1.174736, 1.269573, -1.875379, 1, 1, 1, 1, 1,
-1.172713, -0.6440377, -2.370523, 1, 1, 1, 1, 1,
-1.171959, -1.349802, -1.328566, 1, 1, 1, 1, 1,
-1.168923, -2.32958, -3.314022, 1, 1, 1, 1, 1,
-1.165511, -1.166504, -2.047732, 0, 0, 1, 1, 1,
-1.165259, -1.899668, -1.793117, 1, 0, 0, 1, 1,
-1.162014, 0.02461118, -1.952673, 1, 0, 0, 1, 1,
-1.161699, 1.018344, -1.471863, 1, 0, 0, 1, 1,
-1.15721, -0.896957, -2.996122, 1, 0, 0, 1, 1,
-1.141586, -1.728747, -1.253906, 1, 0, 0, 1, 1,
-1.130888, 1.761239, 0.0529232, 0, 0, 0, 1, 1,
-1.128593, 0.04518603, -3.40104, 0, 0, 0, 1, 1,
-1.124301, 1.103884, -1.87147, 0, 0, 0, 1, 1,
-1.119125, 0.312965, -0.8200542, 0, 0, 0, 1, 1,
-1.118007, 1.133961, 0.3225453, 0, 0, 0, 1, 1,
-1.114455, -0.6547906, -2.001863, 0, 0, 0, 1, 1,
-1.110008, -0.1417583, -1.676071, 0, 0, 0, 1, 1,
-1.106957, -2.209923, -3.811085, 1, 1, 1, 1, 1,
-1.102743, -0.590744, -2.419173, 1, 1, 1, 1, 1,
-1.083465, 1.075425, -1.31914, 1, 1, 1, 1, 1,
-1.083413, -0.199737, -0.8966314, 1, 1, 1, 1, 1,
-1.082877, -0.702397, -1.893927, 1, 1, 1, 1, 1,
-1.081685, 1.428266, -0.7783166, 1, 1, 1, 1, 1,
-1.070395, 0.1363434, -1.675672, 1, 1, 1, 1, 1,
-1.068424, 0.5937623, -1.607137, 1, 1, 1, 1, 1,
-1.06408, 0.8684657, -0.4083647, 1, 1, 1, 1, 1,
-1.063834, -0.04609984, -1.260664, 1, 1, 1, 1, 1,
-1.062987, 1.60298, -2.914706, 1, 1, 1, 1, 1,
-1.058374, 0.5245553, -1.298635, 1, 1, 1, 1, 1,
-1.057583, -1.376841, -1.672742, 1, 1, 1, 1, 1,
-1.057006, -0.9400504, -2.025306, 1, 1, 1, 1, 1,
-1.056437, 0.7285105, -1.348831, 1, 1, 1, 1, 1,
-1.040085, 0.1880281, -0.07739279, 0, 0, 1, 1, 1,
-1.039361, 0.9067298, -0.1088839, 1, 0, 0, 1, 1,
-1.033931, 2.042431, -0.733233, 1, 0, 0, 1, 1,
-1.030618, -0.4835234, -2.492138, 1, 0, 0, 1, 1,
-1.023377, -1.674451, -3.331826, 1, 0, 0, 1, 1,
-1.019489, 0.8875122, -0.918461, 1, 0, 0, 1, 1,
-1.014555, 0.0880098, -1.435372, 0, 0, 0, 1, 1,
-1.013767, -0.2297841, -0.9607536, 0, 0, 0, 1, 1,
-1.013231, 0.07240561, -1.182338, 0, 0, 0, 1, 1,
-1.01127, -1.462071, -0.2951965, 0, 0, 0, 1, 1,
-1.007376, 0.4677756, 0.2779215, 0, 0, 0, 1, 1,
-1.000277, 0.2519742, -2.793912, 0, 0, 0, 1, 1,
-0.9997299, 0.001599818, -1.966013, 0, 0, 0, 1, 1,
-0.9951816, -1.601596, -2.539953, 1, 1, 1, 1, 1,
-0.9916528, 0.276366, -2.243695, 1, 1, 1, 1, 1,
-0.9907116, -0.1128009, -1.341888, 1, 1, 1, 1, 1,
-0.9826014, -0.7392102, -1.86014, 1, 1, 1, 1, 1,
-0.97492, 1.525281, 0.4325807, 1, 1, 1, 1, 1,
-0.9690663, 0.677572, 0.5280845, 1, 1, 1, 1, 1,
-0.9616267, 0.9714428, -1.011398, 1, 1, 1, 1, 1,
-0.9614639, -0.4724773, -1.858274, 1, 1, 1, 1, 1,
-0.9593624, 1.460182, 0.1301256, 1, 1, 1, 1, 1,
-0.958159, -0.07763654, -0.7920031, 1, 1, 1, 1, 1,
-0.9532304, 2.882967, -0.3250011, 1, 1, 1, 1, 1,
-0.9502214, -1.295418, -3.301489, 1, 1, 1, 1, 1,
-0.9476229, 1.104324, -0.9556309, 1, 1, 1, 1, 1,
-0.9397559, -0.1447126, -0.811104, 1, 1, 1, 1, 1,
-0.9384165, -1.025998, -2.593446, 1, 1, 1, 1, 1,
-0.9353583, -1.721469, -2.117323, 0, 0, 1, 1, 1,
-0.9154091, -0.1458, -1.614261, 1, 0, 0, 1, 1,
-0.9107484, 1.926286, -0.5666692, 1, 0, 0, 1, 1,
-0.9016606, 0.5886592, -0.4795455, 1, 0, 0, 1, 1,
-0.8967592, -0.7456871, -3.125011, 1, 0, 0, 1, 1,
-0.8858649, -0.08652084, -3.7184, 1, 0, 0, 1, 1,
-0.8833144, -1.266663, -1.664988, 0, 0, 0, 1, 1,
-0.8831736, 1.478415, 0.02833846, 0, 0, 0, 1, 1,
-0.8820841, -1.342283, -2.513596, 0, 0, 0, 1, 1,
-0.8796584, -1.594217, -2.328137, 0, 0, 0, 1, 1,
-0.879077, 0.5327252, -0.7652633, 0, 0, 0, 1, 1,
-0.8756518, 0.6007773, -2.3007, 0, 0, 0, 1, 1,
-0.8732833, -0.3585369, -3.221181, 0, 0, 0, 1, 1,
-0.8602985, -0.7870238, -1.952943, 1, 1, 1, 1, 1,
-0.8599438, -0.849823, -1.738108, 1, 1, 1, 1, 1,
-0.8597559, -2.741638, -2.109711, 1, 1, 1, 1, 1,
-0.8596434, -1.501109, -3.102532, 1, 1, 1, 1, 1,
-0.8556501, -0.1798015, -1.75493, 1, 1, 1, 1, 1,
-0.8528562, 0.8868003, -2.535671, 1, 1, 1, 1, 1,
-0.8513397, 0.5573484, -1.848464, 1, 1, 1, 1, 1,
-0.8401521, -2.529464, -3.992757, 1, 1, 1, 1, 1,
-0.8366572, -1.14356, -1.913847, 1, 1, 1, 1, 1,
-0.827879, -1.199373, -3.816663, 1, 1, 1, 1, 1,
-0.8256609, -0.4604929, -1.953956, 1, 1, 1, 1, 1,
-0.8216774, -2.665077, -2.475128, 1, 1, 1, 1, 1,
-0.8204079, -0.7970172, -2.730659, 1, 1, 1, 1, 1,
-0.815729, 1.002492, 0.9172487, 1, 1, 1, 1, 1,
-0.8148125, 1.314322, -2.361795, 1, 1, 1, 1, 1,
-0.8147979, -1.239699, -4.859182, 0, 0, 1, 1, 1,
-0.8117654, -0.4198635, -1.225382, 1, 0, 0, 1, 1,
-0.8064364, 0.5462661, 1.185909, 1, 0, 0, 1, 1,
-0.8051769, 0.307736, 1.08739, 1, 0, 0, 1, 1,
-0.8016559, 0.04470735, -1.779875, 1, 0, 0, 1, 1,
-0.7982818, -0.6881168, -3.579733, 1, 0, 0, 1, 1,
-0.7931134, -0.4117583, -1.400614, 0, 0, 0, 1, 1,
-0.7929872, -0.1277424, -2.320276, 0, 0, 0, 1, 1,
-0.7821591, -0.1603022, -1.442781, 0, 0, 0, 1, 1,
-0.7814913, 1.225916, -1.310189, 0, 0, 0, 1, 1,
-0.780537, 0.6385965, -0.945839, 0, 0, 0, 1, 1,
-0.7802272, -0.3695814, -0.795208, 0, 0, 0, 1, 1,
-0.7771413, 1.427472, -0.2257746, 0, 0, 0, 1, 1,
-0.7767076, -0.8819478, -0.3034475, 1, 1, 1, 1, 1,
-0.7729697, 0.1565326, -1.524612, 1, 1, 1, 1, 1,
-0.7720829, 2.383587, -1.015326, 1, 1, 1, 1, 1,
-0.770191, -1.687525, -3.356033, 1, 1, 1, 1, 1,
-0.7650173, 0.5553177, -1.095938, 1, 1, 1, 1, 1,
-0.7640761, 1.085498, 0.4150262, 1, 1, 1, 1, 1,
-0.761839, -0.2685106, -2.363468, 1, 1, 1, 1, 1,
-0.7610661, -0.9147069, -2.621807, 1, 1, 1, 1, 1,
-0.7601104, 0.5502018, -0.3441775, 1, 1, 1, 1, 1,
-0.7586696, 0.4040019, -0.715192, 1, 1, 1, 1, 1,
-0.7570891, -0.4632025, -0.898956, 1, 1, 1, 1, 1,
-0.749409, 0.3044601, -1.76571, 1, 1, 1, 1, 1,
-0.7477179, -0.2788262, -1.677693, 1, 1, 1, 1, 1,
-0.743616, -1.326634, -4.286888, 1, 1, 1, 1, 1,
-0.7401938, -1.240036, -3.638422, 1, 1, 1, 1, 1,
-0.7390478, -0.3042512, -1.078911, 0, 0, 1, 1, 1,
-0.7358503, -1.410562, -2.623261, 1, 0, 0, 1, 1,
-0.7338893, 0.9766368, -0.1623046, 1, 0, 0, 1, 1,
-0.7231371, 0.5076985, -1.559806, 1, 0, 0, 1, 1,
-0.7228345, 0.5784672, -0.4968632, 1, 0, 0, 1, 1,
-0.7206053, 0.6993706, -2.095185, 1, 0, 0, 1, 1,
-0.7183945, -2.245669, -3.243037, 0, 0, 0, 1, 1,
-0.717292, 0.7467901, 1.25913, 0, 0, 0, 1, 1,
-0.7129377, -1.382422, -3.931129, 0, 0, 0, 1, 1,
-0.7017018, -0.9567665, -2.857704, 0, 0, 0, 1, 1,
-0.6983955, 1.536481, 0.2168851, 0, 0, 0, 1, 1,
-0.6975471, -0.517112, -2.205251, 0, 0, 0, 1, 1,
-0.6969823, -0.1069249, -0.5941761, 0, 0, 0, 1, 1,
-0.6937835, -1.657965, -1.485705, 1, 1, 1, 1, 1,
-0.6882299, 0.4561373, -1.070131, 1, 1, 1, 1, 1,
-0.6800738, -1.058789, -2.545239, 1, 1, 1, 1, 1,
-0.6796822, 1.375351, 1.512955, 1, 1, 1, 1, 1,
-0.6781786, -1.28517, -2.897257, 1, 1, 1, 1, 1,
-0.6754645, 0.5398529, -1.972577, 1, 1, 1, 1, 1,
-0.6740543, 0.1831127, -1.278167, 1, 1, 1, 1, 1,
-0.6732946, 0.4780688, -1.616947, 1, 1, 1, 1, 1,
-0.6700046, 0.3473417, -0.5033464, 1, 1, 1, 1, 1,
-0.6670356, -0.6748374, -2.351343, 1, 1, 1, 1, 1,
-0.6663491, -0.07411175, -1.840141, 1, 1, 1, 1, 1,
-0.6633416, 0.5460104, 0.9188421, 1, 1, 1, 1, 1,
-0.6626555, 1.93259, -0.5829631, 1, 1, 1, 1, 1,
-0.657997, 0.06591522, -3.448552, 1, 1, 1, 1, 1,
-0.656058, -0.03156872, -0.7410666, 1, 1, 1, 1, 1,
-0.6378372, -1.463571, -2.587031, 0, 0, 1, 1, 1,
-0.6376616, 0.8224467, -2.295865, 1, 0, 0, 1, 1,
-0.6331396, 0.244984, -1.076255, 1, 0, 0, 1, 1,
-0.6320239, -0.6148059, -2.400671, 1, 0, 0, 1, 1,
-0.6304781, 0.1954281, -1.785495, 1, 0, 0, 1, 1,
-0.6243132, -0.3126981, -2.897926, 1, 0, 0, 1, 1,
-0.6218672, 0.8979488, 1.15085, 0, 0, 0, 1, 1,
-0.6189115, 0.02549322, -1.764077, 0, 0, 0, 1, 1,
-0.616393, 0.05254729, -1.487737, 0, 0, 0, 1, 1,
-0.6147959, 2.257871, -0.7021071, 0, 0, 0, 1, 1,
-0.61308, 0.9931201, -1.051367, 0, 0, 0, 1, 1,
-0.6064764, -0.7980169, -3.54857, 0, 0, 0, 1, 1,
-0.6038623, 0.2031866, -0.7608915, 0, 0, 0, 1, 1,
-0.6023316, -0.1697994, -1.598144, 1, 1, 1, 1, 1,
-0.6005172, 1.329473, 0.8468003, 1, 1, 1, 1, 1,
-0.59878, -0.7496322, -2.164154, 1, 1, 1, 1, 1,
-0.5894294, -0.4496466, -1.913385, 1, 1, 1, 1, 1,
-0.5875645, -0.4022321, -1.793172, 1, 1, 1, 1, 1,
-0.5862907, -0.6403581, -0.7817778, 1, 1, 1, 1, 1,
-0.5846696, -0.7054473, -1.803844, 1, 1, 1, 1, 1,
-0.5834543, 0.5494113, -1.078104, 1, 1, 1, 1, 1,
-0.5810732, -1.914303, -3.324731, 1, 1, 1, 1, 1,
-0.5776448, -0.5994239, -2.042965, 1, 1, 1, 1, 1,
-0.5761942, 0.8032455, 0.4420965, 1, 1, 1, 1, 1,
-0.5680135, -1.346157, -0.7533956, 1, 1, 1, 1, 1,
-0.5672145, -0.4997391, -2.084151, 1, 1, 1, 1, 1,
-0.5628943, 0.09492911, -1.504841, 1, 1, 1, 1, 1,
-0.561438, -0.4178305, -4.111146, 1, 1, 1, 1, 1,
-0.5591236, -0.8621286, -2.563651, 0, 0, 1, 1, 1,
-0.5579373, 0.4353923, -2.546425, 1, 0, 0, 1, 1,
-0.5578619, -1.342623, -2.814261, 1, 0, 0, 1, 1,
-0.557499, -0.8146819, -2.490618, 1, 0, 0, 1, 1,
-0.5551146, -1.467614, -4.486904, 1, 0, 0, 1, 1,
-0.5503221, -0.01396377, -0.4384447, 1, 0, 0, 1, 1,
-0.5500824, -1.647782, -2.585527, 0, 0, 0, 1, 1,
-0.5497055, -0.6974142, -1.600338, 0, 0, 0, 1, 1,
-0.5474699, -1.547117, -4.394526, 0, 0, 0, 1, 1,
-0.5454142, 0.1567324, -1.111542, 0, 0, 0, 1, 1,
-0.5453815, -1.47774, -1.957254, 0, 0, 0, 1, 1,
-0.5443239, -0.7548949, -2.831927, 0, 0, 0, 1, 1,
-0.5441133, -0.63133, -2.25478, 0, 0, 0, 1, 1,
-0.5437058, -0.8814875, -1.904752, 1, 1, 1, 1, 1,
-0.5436124, 0.279737, -0.5165084, 1, 1, 1, 1, 1,
-0.5414736, -1.697211, -2.571218, 1, 1, 1, 1, 1,
-0.540509, -0.4348937, -1.883015, 1, 1, 1, 1, 1,
-0.5336232, 0.4556557, 0.3712464, 1, 1, 1, 1, 1,
-0.5263425, -0.05364577, -1.94209, 1, 1, 1, 1, 1,
-0.5218663, -0.5776632, -3.210329, 1, 1, 1, 1, 1,
-0.5217789, -0.07999508, -2.763595, 1, 1, 1, 1, 1,
-0.521759, 0.3697696, -1.109376, 1, 1, 1, 1, 1,
-0.5200495, 0.3880709, 0.07191733, 1, 1, 1, 1, 1,
-0.515542, -0.7980239, -2.150523, 1, 1, 1, 1, 1,
-0.5130121, 0.4052314, 0.3230664, 1, 1, 1, 1, 1,
-0.5081963, -1.080803, -1.573022, 1, 1, 1, 1, 1,
-0.4981679, -0.7302706, -1.222866, 1, 1, 1, 1, 1,
-0.495733, -1.513178, -4.308172, 1, 1, 1, 1, 1,
-0.4955796, 0.06246743, -2.081125, 0, 0, 1, 1, 1,
-0.4896422, -0.3314785, -1.489513, 1, 0, 0, 1, 1,
-0.4877271, -0.06928074, -1.201251, 1, 0, 0, 1, 1,
-0.4852459, -0.1827216, -2.370947, 1, 0, 0, 1, 1,
-0.483935, 0.6530808, -0.3498045, 1, 0, 0, 1, 1,
-0.4838341, 0.5929119, -1.098633, 1, 0, 0, 1, 1,
-0.483411, -1.001564, -1.967615, 0, 0, 0, 1, 1,
-0.4804083, 0.2891385, -0.2880061, 0, 0, 0, 1, 1,
-0.4779395, 0.8151214, 0.01957143, 0, 0, 0, 1, 1,
-0.4775313, -2.021897, -4.045914, 0, 0, 0, 1, 1,
-0.4748449, -0.1918397, -1.406272, 0, 0, 0, 1, 1,
-0.4742721, 0.8095122, -1.7437, 0, 0, 0, 1, 1,
-0.4740078, -1.397075, -4.591176, 0, 0, 0, 1, 1,
-0.4728303, 0.4791099, -1.661875, 1, 1, 1, 1, 1,
-0.4724484, 0.2475772, -1.167544, 1, 1, 1, 1, 1,
-0.4710291, 1.834275, -0.9686127, 1, 1, 1, 1, 1,
-0.4681547, 1.223964, -1.663255, 1, 1, 1, 1, 1,
-0.465003, -0.4453017, -3.153103, 1, 1, 1, 1, 1,
-0.4633165, 0.1362619, -0.890327, 1, 1, 1, 1, 1,
-0.4621206, -0.5768289, -1.696769, 1, 1, 1, 1, 1,
-0.4567796, 2.054862, -0.4476943, 1, 1, 1, 1, 1,
-0.4511304, -0.8363897, -4.639815, 1, 1, 1, 1, 1,
-0.4467217, -0.9566722, -4.023529, 1, 1, 1, 1, 1,
-0.4358012, 0.4217909, 0.05697803, 1, 1, 1, 1, 1,
-0.4344672, 0.821339, 0.2063005, 1, 1, 1, 1, 1,
-0.4300838, 0.5922795, 1.120337, 1, 1, 1, 1, 1,
-0.4291374, 0.3221665, -0.820406, 1, 1, 1, 1, 1,
-0.4285793, 0.6801371, 0.8180477, 1, 1, 1, 1, 1,
-0.4240054, -0.6271786, -2.109939, 0, 0, 1, 1, 1,
-0.4219837, 2.05693, 2.39949, 1, 0, 0, 1, 1,
-0.4203164, -0.1064013, -0.5775548, 1, 0, 0, 1, 1,
-0.4110277, -0.1396456, -1.121467, 1, 0, 0, 1, 1,
-0.4076416, 0.6208555, -0.5311335, 1, 0, 0, 1, 1,
-0.4062144, 2.249926, 0.5938631, 1, 0, 0, 1, 1,
-0.4036162, 1.584289, 0.1376619, 0, 0, 0, 1, 1,
-0.4026921, -0.7687894, -3.930601, 0, 0, 0, 1, 1,
-0.4007743, -0.7824801, -1.409012, 0, 0, 0, 1, 1,
-0.4001369, 0.9130987, -1.81055, 0, 0, 0, 1, 1,
-0.3975986, 0.02074342, -0.63006, 0, 0, 0, 1, 1,
-0.3911425, -0.2131235, -2.603698, 0, 0, 0, 1, 1,
-0.3896075, 0.8235529, -0.9235039, 0, 0, 0, 1, 1,
-0.3895614, 1.616623, 0.04480021, 1, 1, 1, 1, 1,
-0.3884608, -1.342583, -2.258925, 1, 1, 1, 1, 1,
-0.3880547, 0.3670619, -0.2476784, 1, 1, 1, 1, 1,
-0.3879369, 0.7252917, 0.4878391, 1, 1, 1, 1, 1,
-0.3830498, 2.207458, -0.1173237, 1, 1, 1, 1, 1,
-0.3810254, -0.6297344, -1.015987, 1, 1, 1, 1, 1,
-0.378536, -1.494043, -2.606054, 1, 1, 1, 1, 1,
-0.3780524, 1.479981, -0.1030838, 1, 1, 1, 1, 1,
-0.3758682, -1.214512, -1.690084, 1, 1, 1, 1, 1,
-0.3737134, 0.2445255, -0.4184143, 1, 1, 1, 1, 1,
-0.3695684, 0.381101, 0.8788862, 1, 1, 1, 1, 1,
-0.3675583, 0.157701, -2.325955, 1, 1, 1, 1, 1,
-0.3673092, -0.06374187, -1.763773, 1, 1, 1, 1, 1,
-0.3670453, -1.074194, -3.034495, 1, 1, 1, 1, 1,
-0.3654738, 0.4631916, -1.479606, 1, 1, 1, 1, 1,
-0.3602867, -1.315079, -2.185985, 0, 0, 1, 1, 1,
-0.3578305, -0.1230312, -1.890586, 1, 0, 0, 1, 1,
-0.355941, 1.721611, 0.8555697, 1, 0, 0, 1, 1,
-0.3555025, 0.2999871, 1.119181, 1, 0, 0, 1, 1,
-0.3539897, 1.606364, 0.2956961, 1, 0, 0, 1, 1,
-0.3514883, -0.5954143, -2.329835, 1, 0, 0, 1, 1,
-0.3511304, -0.7756891, -3.59122, 0, 0, 0, 1, 1,
-0.3443528, 0.4590811, 0.3954494, 0, 0, 0, 1, 1,
-0.3403656, 1.123449, 0.868744, 0, 0, 0, 1, 1,
-0.3373159, -0.08268447, -2.043586, 0, 0, 0, 1, 1,
-0.3369941, -0.617154, -3.269421, 0, 0, 0, 1, 1,
-0.3351881, 0.8701621, 0.2685159, 0, 0, 0, 1, 1,
-0.3330196, 0.0285633, -0.05745548, 0, 0, 0, 1, 1,
-0.3327971, 1.271937, 1.307415, 1, 1, 1, 1, 1,
-0.329962, 0.3089009, -2.017991, 1, 1, 1, 1, 1,
-0.3291644, -1.456756, -2.935229, 1, 1, 1, 1, 1,
-0.3267041, 0.2709825, -0.4170186, 1, 1, 1, 1, 1,
-0.3224184, 0.4953006, -0.5362141, 1, 1, 1, 1, 1,
-0.3199469, 1.021118, -0.3308026, 1, 1, 1, 1, 1,
-0.3197393, -1.13123, -0.6070978, 1, 1, 1, 1, 1,
-0.3193543, -0.3275632, -1.293511, 1, 1, 1, 1, 1,
-0.3181066, 0.5010411, 0.1315677, 1, 1, 1, 1, 1,
-0.311337, -2.217091, -1.37842, 1, 1, 1, 1, 1,
-0.309126, 1.91497, 0.3803566, 1, 1, 1, 1, 1,
-0.3017398, 0.9928488, -0.1216898, 1, 1, 1, 1, 1,
-0.3006731, -0.5186043, -3.528563, 1, 1, 1, 1, 1,
-0.2993852, -1.218261, -4.464746, 1, 1, 1, 1, 1,
-0.2965697, -0.02733057, -1.49839, 1, 1, 1, 1, 1,
-0.293221, -0.09063711, 0.03161271, 0, 0, 1, 1, 1,
-0.2914881, -0.8280113, -2.105233, 1, 0, 0, 1, 1,
-0.2865062, 0.4581914, 0.7319011, 1, 0, 0, 1, 1,
-0.2815513, 1.572825, 0.1626218, 1, 0, 0, 1, 1,
-0.2785341, -0.06913956, -1.931987, 1, 0, 0, 1, 1,
-0.2784076, 0.8725168, -0.206584, 1, 0, 0, 1, 1,
-0.2718913, -0.9321691, -2.599106, 0, 0, 0, 1, 1,
-0.2715245, -1.851922, -1.91291, 0, 0, 0, 1, 1,
-0.2660306, 1.514373, 1.983989, 0, 0, 0, 1, 1,
-0.2657668, -0.5367119, -5.668316, 0, 0, 0, 1, 1,
-0.2647916, 0.5881748, -1.422539, 0, 0, 0, 1, 1,
-0.2619908, 1.506021, -2.105308, 0, 0, 0, 1, 1,
-0.2580979, 0.1125829, -1.722579, 0, 0, 0, 1, 1,
-0.2575555, -1.724492, -2.176766, 1, 1, 1, 1, 1,
-0.2535586, -2.226051, -4.659352, 1, 1, 1, 1, 1,
-0.2478971, 0.8440499, 0.5367172, 1, 1, 1, 1, 1,
-0.2447617, -0.9163115, -3.008885, 1, 1, 1, 1, 1,
-0.2434717, 0.4448679, -1.076541, 1, 1, 1, 1, 1,
-0.2434121, -1.534216, -2.218698, 1, 1, 1, 1, 1,
-0.2427451, -1.510681, -2.233727, 1, 1, 1, 1, 1,
-0.2417012, 0.5254944, 0.5138851, 1, 1, 1, 1, 1,
-0.2389568, -0.53232, -2.745567, 1, 1, 1, 1, 1,
-0.2378974, -0.354394, -1.898817, 1, 1, 1, 1, 1,
-0.2359101, -0.1898874, -1.13777, 1, 1, 1, 1, 1,
-0.232544, -1.659753, -3.436745, 1, 1, 1, 1, 1,
-0.2305699, -1.337077, -2.857783, 1, 1, 1, 1, 1,
-0.2275887, 0.1676843, -1.185833, 1, 1, 1, 1, 1,
-0.227299, 2.190588, -0.4419254, 1, 1, 1, 1, 1,
-0.2239383, 1.034497, -0.3624624, 0, 0, 1, 1, 1,
-0.2226462, -0.594968, -6.177113, 1, 0, 0, 1, 1,
-0.2196182, -0.9508789, -1.826118, 1, 0, 0, 1, 1,
-0.2184257, 0.1062699, 1.219886, 1, 0, 0, 1, 1,
-0.2140364, 0.1344607, -1.532102, 1, 0, 0, 1, 1,
-0.21027, 0.04876088, -1.165724, 1, 0, 0, 1, 1,
-0.2102217, 1.120384, 1.095774, 0, 0, 0, 1, 1,
-0.2097414, 0.5106404, -1.356982, 0, 0, 0, 1, 1,
-0.2046822, 0.1478481, -1.351674, 0, 0, 0, 1, 1,
-0.2036845, -0.7897573, -3.191872, 0, 0, 0, 1, 1,
-0.1964078, -0.6244354, -2.098658, 0, 0, 0, 1, 1,
-0.1952158, 1.191821, -0.1783216, 0, 0, 0, 1, 1,
-0.1939642, 0.06459241, 0.485573, 0, 0, 0, 1, 1,
-0.1931493, 0.3625462, -0.4049034, 1, 1, 1, 1, 1,
-0.1904145, 0.4073032, -1.030872, 1, 1, 1, 1, 1,
-0.1889118, 0.3790294, -0.2261266, 1, 1, 1, 1, 1,
-0.1819267, -0.3583756, -4.638281, 1, 1, 1, 1, 1,
-0.1805205, 0.4868143, -0.8095728, 1, 1, 1, 1, 1,
-0.1752007, -0.3037703, -2.912709, 1, 1, 1, 1, 1,
-0.1639618, -1.92407, -3.947443, 1, 1, 1, 1, 1,
-0.1618372, -0.4263932, -2.754131, 1, 1, 1, 1, 1,
-0.1596541, -0.8230714, -3.122641, 1, 1, 1, 1, 1,
-0.1594143, -0.3933638, -1.727716, 1, 1, 1, 1, 1,
-0.1578543, -1.559267, -3.468925, 1, 1, 1, 1, 1,
-0.150735, -0.06580357, -0.8967596, 1, 1, 1, 1, 1,
-0.1506327, -0.7192456, -1.090698, 1, 1, 1, 1, 1,
-0.14624, 0.5562786, 0.9782214, 1, 1, 1, 1, 1,
-0.1441636, 0.07259125, -0.836507, 1, 1, 1, 1, 1,
-0.1418589, 0.3155343, -0.066314, 0, 0, 1, 1, 1,
-0.1414257, -0.8242893, -3.104238, 1, 0, 0, 1, 1,
-0.1410956, -0.2745584, -2.829158, 1, 0, 0, 1, 1,
-0.1389314, -1.270555, -2.182281, 1, 0, 0, 1, 1,
-0.1381569, -0.174617, -2.514318, 1, 0, 0, 1, 1,
-0.1357809, 0.53756, -0.6153689, 1, 0, 0, 1, 1,
-0.1287344, 0.3672688, -1.456549, 0, 0, 0, 1, 1,
-0.1263679, -1.294584, -4.470519, 0, 0, 0, 1, 1,
-0.1255427, 1.144159, -0.7458456, 0, 0, 0, 1, 1,
-0.1230203, -0.1071427, -2.983972, 0, 0, 0, 1, 1,
-0.1220927, -0.1864874, -2.554871, 0, 0, 0, 1, 1,
-0.1204159, -0.948679, -2.452645, 0, 0, 0, 1, 1,
-0.1167031, -0.4959155, -1.949493, 0, 0, 0, 1, 1,
-0.1117972, -1.443104, -3.107497, 1, 1, 1, 1, 1,
-0.1082837, 1.561211, 0.5721343, 1, 1, 1, 1, 1,
-0.1073145, 1.270718, -0.03402279, 1, 1, 1, 1, 1,
-0.1066161, 2.355466, 0.8970808, 1, 1, 1, 1, 1,
-0.1058177, -0.6921991, -3.723894, 1, 1, 1, 1, 1,
-0.1040579, 0.287918, -1.359037, 1, 1, 1, 1, 1,
-0.1040153, 0.9046814, 0.9339623, 1, 1, 1, 1, 1,
-0.09949766, 0.7131927, -0.9096391, 1, 1, 1, 1, 1,
-0.0986599, 0.1996608, 0.6382155, 1, 1, 1, 1, 1,
-0.09375083, -0.6792272, -3.903373, 1, 1, 1, 1, 1,
-0.09365192, 1.140617, -0.2370516, 1, 1, 1, 1, 1,
-0.09212964, 0.1015379, -0.4303363, 1, 1, 1, 1, 1,
-0.09177361, 0.06492956, 0.09225186, 1, 1, 1, 1, 1,
-0.08643594, -0.08614729, -3.495991, 1, 1, 1, 1, 1,
-0.08239759, -3.140792, -2.806545, 1, 1, 1, 1, 1,
-0.07534104, -0.398717, -4.176744, 0, 0, 1, 1, 1,
-0.07443856, 0.3834795, -0.4442755, 1, 0, 0, 1, 1,
-0.07170893, 0.6403333, -0.7960746, 1, 0, 0, 1, 1,
-0.07123525, 1.161135, -1.67241, 1, 0, 0, 1, 1,
-0.0708309, -0.6673312, -2.877885, 1, 0, 0, 1, 1,
-0.07030813, 0.8682465, -0.04193791, 1, 0, 0, 1, 1,
-0.06769654, 1.610162, 0.09440365, 0, 0, 0, 1, 1,
-0.06418273, -1.693936, -5.153038, 0, 0, 0, 1, 1,
-0.06254158, 1.635849, -0.6663776, 0, 0, 0, 1, 1,
-0.06095187, 1.057205, -0.704677, 0, 0, 0, 1, 1,
-0.05860316, 0.8648374, -0.001832726, 0, 0, 0, 1, 1,
-0.05578288, 0.2246426, 0.2644533, 0, 0, 0, 1, 1,
-0.05457284, 1.415049, 0.390916, 0, 0, 0, 1, 1,
-0.05062053, 1.937199, 0.8897018, 1, 1, 1, 1, 1,
-0.05028062, -0.2572278, -4.672988, 1, 1, 1, 1, 1,
-0.046475, 0.6319565, 0.5455931, 1, 1, 1, 1, 1,
-0.04401301, -0.8962978, -4.651053, 1, 1, 1, 1, 1,
-0.040673, -1.481573, -2.552261, 1, 1, 1, 1, 1,
-0.03944214, 1.888571, 0.5808681, 1, 1, 1, 1, 1,
-0.03829021, 0.3902138, 0.238116, 1, 1, 1, 1, 1,
-0.03510465, 1.17834, -1.202534, 1, 1, 1, 1, 1,
-0.03457437, 0.4194485, -0.9824355, 1, 1, 1, 1, 1,
-0.03289568, -1.09395, -3.354003, 1, 1, 1, 1, 1,
-0.02889741, -0.4238119, -2.824476, 1, 1, 1, 1, 1,
-0.02868904, -0.4355128, -1.650543, 1, 1, 1, 1, 1,
-0.02577588, 0.9320168, 0.02776773, 1, 1, 1, 1, 1,
-0.02511489, -0.876721, -2.923446, 1, 1, 1, 1, 1,
-0.02108801, -0.8052672, -2.468358, 1, 1, 1, 1, 1,
-0.02023232, -0.4343123, -1.90231, 0, 0, 1, 1, 1,
-0.01436633, -1.351825, -3.473967, 1, 0, 0, 1, 1,
-0.01313244, 0.9883426, 0.02368295, 1, 0, 0, 1, 1,
-0.01174811, -2.065325, -2.215998, 1, 0, 0, 1, 1,
-0.01066597, -2.160751, -3.24776, 1, 0, 0, 1, 1,
0.001522891, 1.604585, 1.099833, 1, 0, 0, 1, 1,
0.002843801, 1.012848, -2.020918, 0, 0, 0, 1, 1,
0.003430287, -0.1654865, 3.086467, 0, 0, 0, 1, 1,
0.005547221, -1.194484, 2.293619, 0, 0, 0, 1, 1,
0.006833496, 0.6560692, 0.6116281, 0, 0, 0, 1, 1,
0.00914318, -1.065646, 3.970237, 0, 0, 0, 1, 1,
0.009277167, -0.8089685, 3.513609, 0, 0, 0, 1, 1,
0.02075336, -0.4553826, 3.995183, 0, 0, 0, 1, 1,
0.02232238, -1.16274, 3.31056, 1, 1, 1, 1, 1,
0.02668806, -0.5109137, 4.01734, 1, 1, 1, 1, 1,
0.02762934, -0.6675407, 2.87582, 1, 1, 1, 1, 1,
0.02962694, 0.5309062, -0.7846153, 1, 1, 1, 1, 1,
0.0338155, 0.7052304, 0.09977448, 1, 1, 1, 1, 1,
0.03423366, 1.604726, -0.9297457, 1, 1, 1, 1, 1,
0.03994692, -0.2848935, 2.440601, 1, 1, 1, 1, 1,
0.0415721, -0.3188848, 1.830568, 1, 1, 1, 1, 1,
0.04315165, 0.02998984, 0.5624589, 1, 1, 1, 1, 1,
0.04499725, 0.4415496, 1.196736, 1, 1, 1, 1, 1,
0.04578248, 0.5174055, -1.698783, 1, 1, 1, 1, 1,
0.04744079, -0.3628292, 4.870082, 1, 1, 1, 1, 1,
0.04895314, 1.147211, 0.2702389, 1, 1, 1, 1, 1,
0.05073616, 0.2019628, 0.1410057, 1, 1, 1, 1, 1,
0.05462898, 1.06073, 1.859889, 1, 1, 1, 1, 1,
0.05862845, 0.08589328, 1.118124, 0, 0, 1, 1, 1,
0.06168339, -1.45965, 3.23285, 1, 0, 0, 1, 1,
0.06247358, 0.3944417, 1.084806, 1, 0, 0, 1, 1,
0.06510545, -1.293125, 3.079209, 1, 0, 0, 1, 1,
0.0666388, 1.649511, 1.15767, 1, 0, 0, 1, 1,
0.07393044, -0.3089136, 2.076659, 1, 0, 0, 1, 1,
0.07599258, 1.079621, 0.591873, 0, 0, 0, 1, 1,
0.07636125, -1.533398, 2.587596, 0, 0, 0, 1, 1,
0.07702283, 0.3283026, 0.7140039, 0, 0, 0, 1, 1,
0.07939103, 0.1932859, 1.344984, 0, 0, 0, 1, 1,
0.08480272, 0.2002075, 1.260261, 0, 0, 0, 1, 1,
0.08695834, 0.1526532, 1.472612, 0, 0, 0, 1, 1,
0.08881414, 0.07383519, 1.123509, 0, 0, 0, 1, 1,
0.09024823, 0.715111, -1.704597, 1, 1, 1, 1, 1,
0.093, -1.62437, 3.160559, 1, 1, 1, 1, 1,
0.09381705, 0.9750714, 1.295971, 1, 1, 1, 1, 1,
0.09572416, -0.3995541, 2.154474, 1, 1, 1, 1, 1,
0.1042594, -0.1347155, 2.071622, 1, 1, 1, 1, 1,
0.1052968, 0.4201533, 1.080835, 1, 1, 1, 1, 1,
0.1072515, 1.343407, -1.565104, 1, 1, 1, 1, 1,
0.1079282, 0.512041, 0.4255803, 1, 1, 1, 1, 1,
0.1099395, -0.5351699, 3.029484, 1, 1, 1, 1, 1,
0.1105608, -0.4176553, 3.617523, 1, 1, 1, 1, 1,
0.1113251, -1.827793, 0.5760806, 1, 1, 1, 1, 1,
0.113723, -1.056899, 1.875969, 1, 1, 1, 1, 1,
0.1137851, 0.01767444, 0.3310765, 1, 1, 1, 1, 1,
0.1159817, 1.377879, -1.29352, 1, 1, 1, 1, 1,
0.1185687, 0.6096418, -0.3556457, 1, 1, 1, 1, 1,
0.1187095, 0.287466, -1.286158, 0, 0, 1, 1, 1,
0.1187332, -0.05182284, 0.7349764, 1, 0, 0, 1, 1,
0.1192728, -0.2195556, 3.765573, 1, 0, 0, 1, 1,
0.1222233, 0.3443789, -0.1508131, 1, 0, 0, 1, 1,
0.1241434, -1.43775, 1.208178, 1, 0, 0, 1, 1,
0.1353075, -0.1524305, 1.130708, 1, 0, 0, 1, 1,
0.135988, 2.891825, -1.073627, 0, 0, 0, 1, 1,
0.1373205, -0.624281, 3.520807, 0, 0, 0, 1, 1,
0.1457511, -0.7303147, 3.908511, 0, 0, 0, 1, 1,
0.145928, -0.7006258, 3.508124, 0, 0, 0, 1, 1,
0.148237, -0.1707015, 1.932941, 0, 0, 0, 1, 1,
0.1486878, -1.814047, 3.527165, 0, 0, 0, 1, 1,
0.1510473, 0.9935787, -1.672098, 0, 0, 0, 1, 1,
0.1539425, -0.9863176, 3.76282, 1, 1, 1, 1, 1,
0.1646162, 0.07646693, 0.05664524, 1, 1, 1, 1, 1,
0.1682606, 0.2496157, 0.6066957, 1, 1, 1, 1, 1,
0.1705215, -0.3825815, 2.224961, 1, 1, 1, 1, 1,
0.1724769, -0.803943, 4.308911, 1, 1, 1, 1, 1,
0.1746661, -0.9726203, 2.851084, 1, 1, 1, 1, 1,
0.1771191, -1.378493, 2.989862, 1, 1, 1, 1, 1,
0.1779204, -0.8526606, 2.700985, 1, 1, 1, 1, 1,
0.1780847, -1.138215, 2.65069, 1, 1, 1, 1, 1,
0.1788371, 2.915992, -0.006400608, 1, 1, 1, 1, 1,
0.1817293, 0.6544706, 1.311744, 1, 1, 1, 1, 1,
0.1834981, -1.407588, 3.541114, 1, 1, 1, 1, 1,
0.188846, -0.6203476, 5.050586, 1, 1, 1, 1, 1,
0.1916005, -0.4404909, 2.855887, 1, 1, 1, 1, 1,
0.1928101, 1.218473, -0.2713425, 1, 1, 1, 1, 1,
0.1939065, 0.9136543, -0.5343081, 0, 0, 1, 1, 1,
0.1945264, 0.1123288, 0.6659292, 1, 0, 0, 1, 1,
0.1967615, 0.3297775, 1.779153, 1, 0, 0, 1, 1,
0.2002281, -0.0372886, 0.7415018, 1, 0, 0, 1, 1,
0.2055602, -0.06819812, 1.414532, 1, 0, 0, 1, 1,
0.2073186, -2.024135, 2.61319, 1, 0, 0, 1, 1,
0.2085533, 1.069899, 2.582722, 0, 0, 0, 1, 1,
0.2115337, 0.3201652, 0.6954741, 0, 0, 0, 1, 1,
0.2122838, -0.5963991, 3.990994, 0, 0, 0, 1, 1,
0.2155648, -0.3663985, 2.463675, 0, 0, 0, 1, 1,
0.2156868, -1.446223, 2.856233, 0, 0, 0, 1, 1,
0.2195871, 1.133163, 0.7634772, 0, 0, 0, 1, 1,
0.2199416, -1.483593, 3.605286, 0, 0, 0, 1, 1,
0.2222519, -0.6761573, 1.943849, 1, 1, 1, 1, 1,
0.2275154, 1.579515, -0.4756648, 1, 1, 1, 1, 1,
0.2297372, -0.1449842, 1.66087, 1, 1, 1, 1, 1,
0.2308752, 0.4891338, 0.6622331, 1, 1, 1, 1, 1,
0.2340794, -1.931359, 3.974015, 1, 1, 1, 1, 1,
0.2394699, -0.4177952, 2.885566, 1, 1, 1, 1, 1,
0.2459706, 1.053623, 1.218745, 1, 1, 1, 1, 1,
0.2468518, 0.4318635, 1.305986, 1, 1, 1, 1, 1,
0.2470245, -0.212194, 1.756371, 1, 1, 1, 1, 1,
0.2484961, 0.4686262, 0.1401832, 1, 1, 1, 1, 1,
0.2490195, -0.8507173, 2.660316, 1, 1, 1, 1, 1,
0.2498112, 1.076214, -0.06868039, 1, 1, 1, 1, 1,
0.2502711, -0.08857458, 2.828758, 1, 1, 1, 1, 1,
0.2535146, -1.674572, 2.706209, 1, 1, 1, 1, 1,
0.2604246, 1.016189, 1.041762, 1, 1, 1, 1, 1,
0.2605282, 0.2081108, 1.467697, 0, 0, 1, 1, 1,
0.2659119, -1.646507, 2.010034, 1, 0, 0, 1, 1,
0.2681299, 0.8282821, -1.072939, 1, 0, 0, 1, 1,
0.2689854, -3.908935, 2.149099, 1, 0, 0, 1, 1,
0.2694069, -1.033016, 2.677994, 1, 0, 0, 1, 1,
0.2781799, 1.304481, -0.09764837, 1, 0, 0, 1, 1,
0.2829635, 1.452268, -1.532687, 0, 0, 0, 1, 1,
0.2847791, -0.5625433, 3.157499, 0, 0, 0, 1, 1,
0.2906586, 1.048954, -1.457763, 0, 0, 0, 1, 1,
0.291085, -0.1700322, 3.096, 0, 0, 0, 1, 1,
0.2939455, -0.862039, 3.948636, 0, 0, 0, 1, 1,
0.2959279, -0.983927, 2.609842, 0, 0, 0, 1, 1,
0.3004918, -0.0481558, 2.091811, 0, 0, 0, 1, 1,
0.3023893, 0.3252818, -1.388611, 1, 1, 1, 1, 1,
0.306567, 1.413298, -0.3204037, 1, 1, 1, 1, 1,
0.3071651, -0.7682391, 2.919355, 1, 1, 1, 1, 1,
0.3081552, 0.7363935, -1.767241, 1, 1, 1, 1, 1,
0.3096356, 1.662372, 0.2242369, 1, 1, 1, 1, 1,
0.3115243, -1.064209, 1.922602, 1, 1, 1, 1, 1,
0.3137366, 0.5353851, 0.811206, 1, 1, 1, 1, 1,
0.3174882, -0.1165081, 1.11551, 1, 1, 1, 1, 1,
0.3181986, 1.34224, 0.2482081, 1, 1, 1, 1, 1,
0.3186708, -0.8057161, 2.21799, 1, 1, 1, 1, 1,
0.3187684, -0.1583316, 3.202448, 1, 1, 1, 1, 1,
0.3190192, 0.9385568, -0.2774271, 1, 1, 1, 1, 1,
0.3209133, 0.9082777, -0.3129882, 1, 1, 1, 1, 1,
0.3236364, 0.2563384, 0.1579961, 1, 1, 1, 1, 1,
0.3294607, -1.296212, 4.852868, 1, 1, 1, 1, 1,
0.330026, -0.2402074, 1.415502, 0, 0, 1, 1, 1,
0.3375784, -0.9106562, 3.276944, 1, 0, 0, 1, 1,
0.3433741, -0.4906079, 3.694687, 1, 0, 0, 1, 1,
0.3446945, -0.5553104, 3.836022, 1, 0, 0, 1, 1,
0.3492161, 0.2553935, 0.8865227, 1, 0, 0, 1, 1,
0.3503892, -0.6746073, 2.676731, 1, 0, 0, 1, 1,
0.352083, 0.3171891, 1.313184, 0, 0, 0, 1, 1,
0.3540723, -0.2215731, 2.568066, 0, 0, 0, 1, 1,
0.3654773, -1.127993, 0.7401684, 0, 0, 0, 1, 1,
0.3683558, 1.680103, 0.6194909, 0, 0, 0, 1, 1,
0.3759565, -0.1635813, 2.990754, 0, 0, 0, 1, 1,
0.3762831, 1.416916, -0.6617615, 0, 0, 0, 1, 1,
0.3836579, 0.5257384, -0.0133747, 0, 0, 0, 1, 1,
0.3866288, 0.3355729, 2.071247, 1, 1, 1, 1, 1,
0.3890292, -0.3577508, 3.540101, 1, 1, 1, 1, 1,
0.3896149, 0.5215359, -0.3885611, 1, 1, 1, 1, 1,
0.3957696, 1.234966, 0.9592107, 1, 1, 1, 1, 1,
0.399764, -2.664486, 2.713175, 1, 1, 1, 1, 1,
0.4028222, -1.733999, 3.84213, 1, 1, 1, 1, 1,
0.4029478, -1.292683, 2.383033, 1, 1, 1, 1, 1,
0.4044971, -0.70121, 2.61282, 1, 1, 1, 1, 1,
0.4046964, -0.3213517, 1.637669, 1, 1, 1, 1, 1,
0.4078847, -1.249694, 1.668188, 1, 1, 1, 1, 1,
0.4089007, 0.9410365, 0.05718861, 1, 1, 1, 1, 1,
0.4099151, 0.4343938, 1.76027, 1, 1, 1, 1, 1,
0.4107684, -0.4084335, 1.333801, 1, 1, 1, 1, 1,
0.4119704, -0.4322608, 2.323805, 1, 1, 1, 1, 1,
0.4164036, -1.183639, 1.350556, 1, 1, 1, 1, 1,
0.4199941, 0.2704794, 1.163184, 0, 0, 1, 1, 1,
0.4225873, 0.3401688, 2.551245, 1, 0, 0, 1, 1,
0.4291334, 2.04257, 1.062529, 1, 0, 0, 1, 1,
0.4324874, 1.124483, -0.6960523, 1, 0, 0, 1, 1,
0.4346489, -0.3945415, 2.763589, 1, 0, 0, 1, 1,
0.4387361, 2.231412, 0.2634904, 1, 0, 0, 1, 1,
0.4402274, 1.814246, 0.6855843, 0, 0, 0, 1, 1,
0.4415348, -2.463026, 3.23124, 0, 0, 0, 1, 1,
0.4505151, 0.4812214, 1.094347, 0, 0, 0, 1, 1,
0.4525389, -0.3361478, 1.953786, 0, 0, 0, 1, 1,
0.4556844, -1.015739, 1.326658, 0, 0, 0, 1, 1,
0.4598959, -0.5483151, 0.8408926, 0, 0, 0, 1, 1,
0.4601789, 0.2464119, 2.301187, 0, 0, 0, 1, 1,
0.4728148, -0.6208968, 3.098597, 1, 1, 1, 1, 1,
0.4748527, -1.020405, 3.600687, 1, 1, 1, 1, 1,
0.4812735, 0.8862737, 0.5203814, 1, 1, 1, 1, 1,
0.487818, 0.09437981, 0.5289396, 1, 1, 1, 1, 1,
0.4886756, 0.06642359, 1.99933, 1, 1, 1, 1, 1,
0.4902146, 0.1157754, 0.8360333, 1, 1, 1, 1, 1,
0.4904514, 0.8117974, 1.139763, 1, 1, 1, 1, 1,
0.5022919, 0.7231314, 0.379715, 1, 1, 1, 1, 1,
0.506088, -0.4887553, 1.027562, 1, 1, 1, 1, 1,
0.5110287, -1.536202, 3.401518, 1, 1, 1, 1, 1,
0.5148729, 0.9414744, 0.4864894, 1, 1, 1, 1, 1,
0.527133, 0.9642529, 1.009324, 1, 1, 1, 1, 1,
0.5273191, -0.2138216, 1.091195, 1, 1, 1, 1, 1,
0.5293569, -1.441385, 2.369457, 1, 1, 1, 1, 1,
0.5295249, -0.6246601, 2.492098, 1, 1, 1, 1, 1,
0.5318316, -0.5960968, 2.40054, 0, 0, 1, 1, 1,
0.5329372, 0.7070186, 1.819264, 1, 0, 0, 1, 1,
0.5370036, 1.264534, 0.9253509, 1, 0, 0, 1, 1,
0.5380475, 0.8493543, 1.342674, 1, 0, 0, 1, 1,
0.5433944, -0.610527, 3.344758, 1, 0, 0, 1, 1,
0.5516369, 0.2230123, 0.6355546, 1, 0, 0, 1, 1,
0.5539392, 0.2129522, 1.036402, 0, 0, 0, 1, 1,
0.556421, 1.341546, 0.9871449, 0, 0, 0, 1, 1,
0.5569357, 0.6142741, 1.678606, 0, 0, 0, 1, 1,
0.5641524, -0.003399752, 2.452724, 0, 0, 0, 1, 1,
0.566439, 0.2256163, 3.35182, 0, 0, 0, 1, 1,
0.5678827, -0.8839655, 2.997185, 0, 0, 0, 1, 1,
0.5708802, -0.05589926, 1.029554, 0, 0, 0, 1, 1,
0.5736681, 0.4314084, 1.121261, 1, 1, 1, 1, 1,
0.5747934, 1.680028, 0.4894505, 1, 1, 1, 1, 1,
0.5753791, 0.02293551, -0.173561, 1, 1, 1, 1, 1,
0.5756669, -1.603046, 4.195735, 1, 1, 1, 1, 1,
0.5776674, 0.1097474, 3.390018, 1, 1, 1, 1, 1,
0.5785219, 2.0818, 0.5506283, 1, 1, 1, 1, 1,
0.5786517, -1.713363, 3.073757, 1, 1, 1, 1, 1,
0.5796822, -0.545612, 3.44271, 1, 1, 1, 1, 1,
0.5814523, -0.3481363, 2.134551, 1, 1, 1, 1, 1,
0.5898177, -0.7024274, 2.935221, 1, 1, 1, 1, 1,
0.5915443, 0.1635836, 2.028919, 1, 1, 1, 1, 1,
0.5948011, -0.5159912, 2.236589, 1, 1, 1, 1, 1,
0.5969309, -0.1466269, 0.3440422, 1, 1, 1, 1, 1,
0.597181, -0.4945228, 3.637141, 1, 1, 1, 1, 1,
0.5974191, 0.400827, 1.288887, 1, 1, 1, 1, 1,
0.6003723, 0.7050076, 2.208518, 0, 0, 1, 1, 1,
0.6017103, -0.1429536, 1.396528, 1, 0, 0, 1, 1,
0.6035616, -1.536524, 3.254454, 1, 0, 0, 1, 1,
0.6036657, -2.02096, 3.852286, 1, 0, 0, 1, 1,
0.6089688, -1.332773, 1.833681, 1, 0, 0, 1, 1,
0.6126851, -0.4488814, 2.029282, 1, 0, 0, 1, 1,
0.6143152, 0.57598, -1.127644, 0, 0, 0, 1, 1,
0.6192701, -1.273221, 4.129294, 0, 0, 0, 1, 1,
0.6358194, -1.561901, 3.998924, 0, 0, 0, 1, 1,
0.6380051, 1.500576, 1.508025, 0, 0, 0, 1, 1,
0.6417837, -0.240118, 1.679147, 0, 0, 0, 1, 1,
0.6418622, 0.3102357, 3.246245, 0, 0, 0, 1, 1,
0.6435249, 2.029952, 1.40381, 0, 0, 0, 1, 1,
0.6439109, -1.203366, 1.172245, 1, 1, 1, 1, 1,
0.645394, -0.3794065, 4.200929, 1, 1, 1, 1, 1,
0.6473887, -1.179776, 2.55937, 1, 1, 1, 1, 1,
0.6502119, 0.01847614, 1.875854, 1, 1, 1, 1, 1,
0.6547958, -0.1929533, 1.733911, 1, 1, 1, 1, 1,
0.658978, 0.09686441, 0.3614851, 1, 1, 1, 1, 1,
0.6611863, 1.203219, 0.828191, 1, 1, 1, 1, 1,
0.665538, -0.5010226, 0.4328103, 1, 1, 1, 1, 1,
0.6680383, -0.6355553, 2.504873, 1, 1, 1, 1, 1,
0.6706237, 1.224864, -0.01514289, 1, 1, 1, 1, 1,
0.6727101, 0.2614708, -0.03138223, 1, 1, 1, 1, 1,
0.6751603, 0.06695105, 2.280055, 1, 1, 1, 1, 1,
0.6873688, 1.490719, 0.3005914, 1, 1, 1, 1, 1,
0.6877517, -1.327412, 1.849505, 1, 1, 1, 1, 1,
0.6935852, 0.4346415, 3.378235, 1, 1, 1, 1, 1,
0.6960503, 0.07924493, 0.6093593, 0, 0, 1, 1, 1,
0.6962852, -0.6379237, 1.872778, 1, 0, 0, 1, 1,
0.6964763, -0.02584685, 2.288109, 1, 0, 0, 1, 1,
0.7003502, -0.3645818, 2.037939, 1, 0, 0, 1, 1,
0.7018873, 1.879667, 1.985899, 1, 0, 0, 1, 1,
0.703092, 0.08018117, 1.866623, 1, 0, 0, 1, 1,
0.7112138, 0.01150492, 1.661756, 0, 0, 0, 1, 1,
0.7134153, 0.6912116, 1.584542, 0, 0, 0, 1, 1,
0.7147717, -1.223928, 3.867246, 0, 0, 0, 1, 1,
0.7168867, -0.6659279, 0.271017, 0, 0, 0, 1, 1,
0.7318731, 1.589153, 1.530123, 0, 0, 0, 1, 1,
0.7326422, 1.752266, 2.363424, 0, 0, 0, 1, 1,
0.7327343, 0.4685498, 0.3170629, 0, 0, 0, 1, 1,
0.7331136, -0.5166039, 2.848402, 1, 1, 1, 1, 1,
0.736799, -0.9335198, 2.990112, 1, 1, 1, 1, 1,
0.7413517, 0.8149494, 3.135395, 1, 1, 1, 1, 1,
0.7426579, 0.02504886, 2.389357, 1, 1, 1, 1, 1,
0.7557151, -0.3652867, 2.635468, 1, 1, 1, 1, 1,
0.7600067, -0.06611484, 1.321838, 1, 1, 1, 1, 1,
0.7612075, -0.8996085, 3.686236, 1, 1, 1, 1, 1,
0.7641913, 1.673247, 1.017008, 1, 1, 1, 1, 1,
0.7674049, -0.3154137, 1.433266, 1, 1, 1, 1, 1,
0.7716725, -1.807619, 2.535895, 1, 1, 1, 1, 1,
0.7724544, -1.074853, 2.626256, 1, 1, 1, 1, 1,
0.7735295, 1.432232, -0.8835039, 1, 1, 1, 1, 1,
0.7739983, 0.4530528, 1.526509, 1, 1, 1, 1, 1,
0.7778729, 0.1192766, 1.918692, 1, 1, 1, 1, 1,
0.7837495, 0.01712373, 3.533743, 1, 1, 1, 1, 1,
0.7855926, -0.4038873, -0.1742041, 0, 0, 1, 1, 1,
0.7916502, -0.06434023, 0.4476709, 1, 0, 0, 1, 1,
0.7925736, -1.009769, 1.468295, 1, 0, 0, 1, 1,
0.7965065, 0.773552, 0.9462384, 1, 0, 0, 1, 1,
0.7982737, 0.7568188, -0.4260112, 1, 0, 0, 1, 1,
0.7983198, -0.09544533, 1.672187, 1, 0, 0, 1, 1,
0.8019428, 0.7751993, 1.067402, 0, 0, 0, 1, 1,
0.804884, -0.8248088, 3.756586, 0, 0, 0, 1, 1,
0.8133881, 0.5004918, 1.357689, 0, 0, 0, 1, 1,
0.8150898, -0.8671489, 1.71423, 0, 0, 0, 1, 1,
0.8202689, -0.9350594, 4.387813, 0, 0, 0, 1, 1,
0.8215085, 0.9926317, 2.230778, 0, 0, 0, 1, 1,
0.8222528, -0.9643582, 2.273852, 0, 0, 0, 1, 1,
0.8235819, 1.982887, 2.765456, 1, 1, 1, 1, 1,
0.8252488, 0.9434765, 2.548506, 1, 1, 1, 1, 1,
0.8344675, 0.3941765, 1.233398, 1, 1, 1, 1, 1,
0.8397494, 0.362082, 0.4771409, 1, 1, 1, 1, 1,
0.8449943, 0.453753, -0.9450776, 1, 1, 1, 1, 1,
0.8466204, 0.1018651, 0.4904212, 1, 1, 1, 1, 1,
0.8534795, -1.913227, 3.627669, 1, 1, 1, 1, 1,
0.8622365, -0.03310501, 0.533128, 1, 1, 1, 1, 1,
0.8648949, -1.504187, 1.350348, 1, 1, 1, 1, 1,
0.8722434, -1.135325, 4.078001, 1, 1, 1, 1, 1,
0.8731694, 0.7125331, 0.8237118, 1, 1, 1, 1, 1,
0.8734675, 1.2235, 0.4202884, 1, 1, 1, 1, 1,
0.8753434, -1.917165, 1.967533, 1, 1, 1, 1, 1,
0.8792579, -1.87782, 3.056739, 1, 1, 1, 1, 1,
0.8804326, 0.9395224, 1.927281, 1, 1, 1, 1, 1,
0.8846245, 0.6110499, 0.7076032, 0, 0, 1, 1, 1,
0.8906154, 0.3133323, -0.2465572, 1, 0, 0, 1, 1,
0.9066625, -0.180287, -0.600189, 1, 0, 0, 1, 1,
0.9116113, -0.56089, 2.918636, 1, 0, 0, 1, 1,
0.913947, 2.047423, -0.001000787, 1, 0, 0, 1, 1,
0.9166195, 0.1754792, 1.000988, 1, 0, 0, 1, 1,
0.9171618, 1.036932, 1.382804, 0, 0, 0, 1, 1,
0.9202591, 0.05870082, 0.7121241, 0, 0, 0, 1, 1,
0.9264967, -1.231266, 5.256023, 0, 0, 0, 1, 1,
0.9284298, -0.9033588, 1.551042, 0, 0, 0, 1, 1,
0.9299269, -0.3144397, 3.195256, 0, 0, 0, 1, 1,
0.9320098, 0.4608027, 1.042442, 0, 0, 0, 1, 1,
0.9321935, -0.5920201, 0.6955856, 0, 0, 0, 1, 1,
0.9341391, -1.574378, 3.481467, 1, 1, 1, 1, 1,
0.9343284, -0.1620306, 3.446376, 1, 1, 1, 1, 1,
0.9362544, 0.5109383, 0.5012288, 1, 1, 1, 1, 1,
0.9363501, 0.816792, 0.7287318, 1, 1, 1, 1, 1,
0.9372982, -0.9716515, 1.423463, 1, 1, 1, 1, 1,
0.9381541, -0.5602606, 3.816807, 1, 1, 1, 1, 1,
0.9431952, -0.2756601, 1.448108, 1, 1, 1, 1, 1,
0.9458606, -0.06498501, 1.637379, 1, 1, 1, 1, 1,
0.94702, -2.929642, 1.825747, 1, 1, 1, 1, 1,
0.954927, -0.661282, 1.665262, 1, 1, 1, 1, 1,
0.9593061, -1.260534, 4.829885, 1, 1, 1, 1, 1,
0.959806, 0.3757553, 1.234045, 1, 1, 1, 1, 1,
0.9682712, 0.2043547, 0.2155508, 1, 1, 1, 1, 1,
0.9727795, -0.4755346, 3.355615, 1, 1, 1, 1, 1,
0.9729354, -1.568658, 3.174269, 1, 1, 1, 1, 1,
0.9769571, 0.05299076, 0.5076867, 0, 0, 1, 1, 1,
0.9790486, 1.189996, 0.3597268, 1, 0, 0, 1, 1,
0.9835918, -1.635104, 2.478325, 1, 0, 0, 1, 1,
0.9972237, -1.24206, 3.41414, 1, 0, 0, 1, 1,
0.9975367, -0.5396829, 2.38163, 1, 0, 0, 1, 1,
1.00301, -1.97788, 3.292577, 1, 0, 0, 1, 1,
1.010413, 0.3215715, 1.934988, 0, 0, 0, 1, 1,
1.019102, -1.359364, 2.845729, 0, 0, 0, 1, 1,
1.025036, -0.1547343, 2.312427, 0, 0, 0, 1, 1,
1.025407, -1.314683, 3.643152, 0, 0, 0, 1, 1,
1.025912, -0.2717546, 1.761951, 0, 0, 0, 1, 1,
1.02658, -0.1931224, 1.868817, 0, 0, 0, 1, 1,
1.032525, -1.184316, 2.868245, 0, 0, 0, 1, 1,
1.044904, 0.3010424, 3.482685, 1, 1, 1, 1, 1,
1.046268, 1.378256, 1.084091, 1, 1, 1, 1, 1,
1.055053, 1.898323, 0.847745, 1, 1, 1, 1, 1,
1.05571, -0.3649667, 3.576164, 1, 1, 1, 1, 1,
1.059144, -2.018698, 2.742135, 1, 1, 1, 1, 1,
1.06707, -0.4987239, 2.983658, 1, 1, 1, 1, 1,
1.073094, 0.01777458, 0.03323172, 1, 1, 1, 1, 1,
1.087383, 0.7946455, -0.6946754, 1, 1, 1, 1, 1,
1.092005, -1.317038, 2.181498, 1, 1, 1, 1, 1,
1.093133, -0.08600677, 3.310674, 1, 1, 1, 1, 1,
1.100659, 0.2425931, 1.72604, 1, 1, 1, 1, 1,
1.10383, -0.4081702, 2.500149, 1, 1, 1, 1, 1,
1.104952, -0.5163082, 0.331679, 1, 1, 1, 1, 1,
1.105772, -0.3286535, 1.285869, 1, 1, 1, 1, 1,
1.108031, 0.5524423, 0.5064131, 1, 1, 1, 1, 1,
1.11276, -1.396551, 3.332917, 0, 0, 1, 1, 1,
1.114662, 0.4583308, 1.009592, 1, 0, 0, 1, 1,
1.119186, 0.2909895, 3.425956, 1, 0, 0, 1, 1,
1.122437, -0.2493231, 1.912539, 1, 0, 0, 1, 1,
1.125484, 0.8029854, 0.2613448, 1, 0, 0, 1, 1,
1.125681, 0.5653073, 0.8475199, 1, 0, 0, 1, 1,
1.128213, -0.06085666, 0.5398968, 0, 0, 0, 1, 1,
1.129028, 0.6865792, 0.9228145, 0, 0, 0, 1, 1,
1.135117, 1.08303, 0.9258553, 0, 0, 0, 1, 1,
1.13564, 0.6826768, 1.399879, 0, 0, 0, 1, 1,
1.144738, 0.01316899, 1.403169, 0, 0, 0, 1, 1,
1.157965, 0.5922694, 2.392257, 0, 0, 0, 1, 1,
1.158016, 1.214708, 0.4140744, 0, 0, 0, 1, 1,
1.176023, -0.3816675, -0.230052, 1, 1, 1, 1, 1,
1.176274, 0.2586526, 1.751897, 1, 1, 1, 1, 1,
1.178109, -0.0547381, 0.5214341, 1, 1, 1, 1, 1,
1.179399, 0.4307783, 2.4439, 1, 1, 1, 1, 1,
1.1803, 0.8577845, -0.04974931, 1, 1, 1, 1, 1,
1.203794, -1.289825, 1.573256, 1, 1, 1, 1, 1,
1.205392, -0.1021905, 1.640248, 1, 1, 1, 1, 1,
1.210177, 0.09645697, 2.17919, 1, 1, 1, 1, 1,
1.213115, 1.62289, 0.3871384, 1, 1, 1, 1, 1,
1.228347, 1.932292, 2.067067, 1, 1, 1, 1, 1,
1.229132, 0.1506697, -1.08, 1, 1, 1, 1, 1,
1.231431, -1.04465, 1.804017, 1, 1, 1, 1, 1,
1.250215, 0.7126595, -2.088392, 1, 1, 1, 1, 1,
1.257424, -0.3549941, 1.593606, 1, 1, 1, 1, 1,
1.261912, -0.1410748, 3.650823, 1, 1, 1, 1, 1,
1.28644, -0.5845761, 0.5465099, 0, 0, 1, 1, 1,
1.289199, -0.5835091, 1.351736, 1, 0, 0, 1, 1,
1.298473, -0.283222, 1.670013, 1, 0, 0, 1, 1,
1.30523, -0.005588823, 2.840769, 1, 0, 0, 1, 1,
1.30604, -1.767228, 5.297071, 1, 0, 0, 1, 1,
1.306228, 2.013366, -0.06096044, 1, 0, 0, 1, 1,
1.308247, 0.7943777, 0.7281433, 0, 0, 0, 1, 1,
1.310763, -1.148186, 2.590616, 0, 0, 0, 1, 1,
1.319208, -1.492494, 1.548042, 0, 0, 0, 1, 1,
1.322422, 1.685368, 1.774999, 0, 0, 0, 1, 1,
1.326204, -0.03512995, 1.370016, 0, 0, 0, 1, 1,
1.329813, -1.046625, 1.770213, 0, 0, 0, 1, 1,
1.330405, 0.5905204, 2.120956, 0, 0, 0, 1, 1,
1.332435, 0.4179019, 1.211633, 1, 1, 1, 1, 1,
1.332666, 0.08551953, 2.069081, 1, 1, 1, 1, 1,
1.335865, -0.1957371, 2.555938, 1, 1, 1, 1, 1,
1.340097, -0.4406997, 0.9696373, 1, 1, 1, 1, 1,
1.345673, 0.2846213, 2.379626, 1, 1, 1, 1, 1,
1.348968, 0.4265328, 1.813617, 1, 1, 1, 1, 1,
1.367748, 0.1282532, 1.453811, 1, 1, 1, 1, 1,
1.368081, -0.9086711, 2.763769, 1, 1, 1, 1, 1,
1.369824, -1.035345, 2.492278, 1, 1, 1, 1, 1,
1.3736, -0.00191873, 1.890256, 1, 1, 1, 1, 1,
1.401248, 0.07158498, 1.494515, 1, 1, 1, 1, 1,
1.408124, -1.050271, 2.762112, 1, 1, 1, 1, 1,
1.411041, -2.297375, 2.900095, 1, 1, 1, 1, 1,
1.414622, 0.3892804, 0.06249219, 1, 1, 1, 1, 1,
1.421429, -0.003298665, 2.497378, 1, 1, 1, 1, 1,
1.437256, -0.1593797, 1.915602, 0, 0, 1, 1, 1,
1.449578, -0.6396607, 1.30265, 1, 0, 0, 1, 1,
1.465577, -1.693126, 2.754608, 1, 0, 0, 1, 1,
1.466086, 1.090943, 0.4067124, 1, 0, 0, 1, 1,
1.469006, 0.4270445, 3.484957, 1, 0, 0, 1, 1,
1.472742, 0.1969672, 1.250056, 1, 0, 0, 1, 1,
1.486699, -0.4935465, 2.529238, 0, 0, 0, 1, 1,
1.500712, 1.659982, 0.7926762, 0, 0, 0, 1, 1,
1.511318, -0.1155492, 1.238609, 0, 0, 0, 1, 1,
1.513294, 0.685423, 3.222646, 0, 0, 0, 1, 1,
1.513977, 1.815812, -0.01006119, 0, 0, 0, 1, 1,
1.539734, -0.2150041, 3.322887, 0, 0, 0, 1, 1,
1.548058, 2.549131, 0.8710111, 0, 0, 0, 1, 1,
1.562198, 0.3554866, 0.1608315, 1, 1, 1, 1, 1,
1.562747, -0.2858448, 3.488948, 1, 1, 1, 1, 1,
1.564156, 0.6207334, 0.1680374, 1, 1, 1, 1, 1,
1.606347, -0.06885943, 1.665555, 1, 1, 1, 1, 1,
1.628307, 0.3317593, 1.284001, 1, 1, 1, 1, 1,
1.64255, -1.449037, 1.596526, 1, 1, 1, 1, 1,
1.6609, 1.03432, 0.963869, 1, 1, 1, 1, 1,
1.672556, 1.044745, 1.032135, 1, 1, 1, 1, 1,
1.677168, 0.7926621, 1.60391, 1, 1, 1, 1, 1,
1.709228, 0.2474248, 2.815079, 1, 1, 1, 1, 1,
1.75282, -0.0113419, 2.810714, 1, 1, 1, 1, 1,
1.763907, -0.006813136, 1.863295, 1, 1, 1, 1, 1,
1.803489, 0.06409932, 2.220396, 1, 1, 1, 1, 1,
1.808362, -1.227526, 3.549007, 1, 1, 1, 1, 1,
1.836945, -1.33503, 1.511699, 1, 1, 1, 1, 1,
1.843783, -0.4058273, -0.008978809, 0, 0, 1, 1, 1,
1.854589, 0.1363848, 1.12137, 1, 0, 0, 1, 1,
1.861497, -0.3005188, 0.9838153, 1, 0, 0, 1, 1,
1.878165, 0.4016424, 2.487121, 1, 0, 0, 1, 1,
1.884451, 0.7059627, 1.482799, 1, 0, 0, 1, 1,
1.910658, 0.7072042, 0.7081147, 1, 0, 0, 1, 1,
1.910974, 0.4178292, 0.887381, 0, 0, 0, 1, 1,
1.919906, 0.2449492, 2.541519, 0, 0, 0, 1, 1,
1.920925, 0.9834251, 3.253147, 0, 0, 0, 1, 1,
1.92131, 0.6063155, 0.403907, 0, 0, 0, 1, 1,
1.948568, -0.2376812, 2.837742, 0, 0, 0, 1, 1,
1.955242, -0.3381423, 2.753644, 0, 0, 0, 1, 1,
2.001512, -1.383819, 2.994186, 0, 0, 0, 1, 1,
2.022357, 1.238545, 2.666523, 1, 1, 1, 1, 1,
2.053238, 0.9725124, 0.08363312, 1, 1, 1, 1, 1,
2.054833, -1.726175, 1.251224, 1, 1, 1, 1, 1,
2.074588, 1.408961, 1.836241, 1, 1, 1, 1, 1,
2.098252, 0.4016333, 1.920174, 1, 1, 1, 1, 1,
2.100618, 0.5299732, 2.117669, 1, 1, 1, 1, 1,
2.128379, 3.188577, 0.1353791, 1, 1, 1, 1, 1,
2.152685, -0.6828234, 1.220432, 1, 1, 1, 1, 1,
2.172495, 2.096797, -0.537751, 1, 1, 1, 1, 1,
2.179577, -0.1087243, 2.341514, 1, 1, 1, 1, 1,
2.17977, 2.494509, 1.941739, 1, 1, 1, 1, 1,
2.183239, -1.353136, 1.724351, 1, 1, 1, 1, 1,
2.198651, -0.6711187, 2.896942, 1, 1, 1, 1, 1,
2.259139, 0.1243051, 3.893984, 1, 1, 1, 1, 1,
2.261555, 0.4298988, -0.007053325, 1, 1, 1, 1, 1,
2.288942, -0.8494873, 1.076847, 0, 0, 1, 1, 1,
2.296041, 0.3062724, -0.09001672, 1, 0, 0, 1, 1,
2.299186, -1.546324, 2.661083, 1, 0, 0, 1, 1,
2.334642, 0.5116258, 1.678602, 1, 0, 0, 1, 1,
2.33763, -0.1782024, 1.975042, 1, 0, 0, 1, 1,
2.368542, 0.4079535, 2.02731, 1, 0, 0, 1, 1,
2.368999, -0.6074959, 0.4192172, 0, 0, 0, 1, 1,
2.393518, 0.1842526, 1.73024, 0, 0, 0, 1, 1,
2.407162, 0.2036293, 0.6360022, 0, 0, 0, 1, 1,
2.416473, 1.376346, -0.5420231, 0, 0, 0, 1, 1,
2.437983, 0.4186555, 0.6012457, 0, 0, 0, 1, 1,
2.545816, -0.02455105, 0.9209495, 0, 0, 0, 1, 1,
2.565533, -1.007623, 0.2312057, 0, 0, 0, 1, 1,
2.610517, -0.8306807, 2.59942, 1, 1, 1, 1, 1,
2.639487, 0.4118665, 2.152358, 1, 1, 1, 1, 1,
2.666516, 0.7384326, 1.956494, 1, 1, 1, 1, 1,
2.681417, -0.6519639, 1.228159, 1, 1, 1, 1, 1,
2.89853, 0.9073782, 1.458593, 1, 1, 1, 1, 1,
2.996211, 0.7570449, 0.5191246, 1, 1, 1, 1, 1,
3.44479, 0.2383128, 2.454623, 1, 1, 1, 1, 1
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
var radius = 10.15097;
var distance = 35.65485;
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
mvMatrix.translate( -0.07680798, 0.3601789, 0.4400213 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.65485);
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
