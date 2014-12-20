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
-2.785735, 0.4819774, -1.389972, 1, 0, 0, 1,
-2.737268, 0.093522, -2.815199, 1, 0.007843138, 0, 1,
-2.609252, 0.07374429, -1.98241, 1, 0.01176471, 0, 1,
-2.598881, -0.06917185, -2.93478, 1, 0.01960784, 0, 1,
-2.354033, -1.514563, -3.400748, 1, 0.02352941, 0, 1,
-2.30604, 0.9689355, -0.9705213, 1, 0.03137255, 0, 1,
-2.293695, 1.889917, 0.5028768, 1, 0.03529412, 0, 1,
-2.256323, -0.9897807, -2.591449, 1, 0.04313726, 0, 1,
-2.230888, 0.6339979, -3.56037, 1, 0.04705882, 0, 1,
-2.218718, -0.9050379, -3.637057, 1, 0.05490196, 0, 1,
-2.209767, -1.458821, -0.9861937, 1, 0.05882353, 0, 1,
-2.208992, 0.2405424, -1.21524, 1, 0.06666667, 0, 1,
-2.171998, -1.443503, -1.841378, 1, 0.07058824, 0, 1,
-2.146918, 1.238202, -0.729436, 1, 0.07843138, 0, 1,
-2.115847, 0.3465339, -0.08239055, 1, 0.08235294, 0, 1,
-2.113096, 0.1766548, -1.535504, 1, 0.09019608, 0, 1,
-2.100597, -1.11211, -1.718105, 1, 0.09411765, 0, 1,
-2.091005, -0.5983546, -2.073418, 1, 0.1019608, 0, 1,
-2.05274, -0.5546041, -1.50403, 1, 0.1098039, 0, 1,
-2.022788, 1.980692, -0.9319093, 1, 0.1137255, 0, 1,
-2.015066, 1.617474, -1.134814, 1, 0.1215686, 0, 1,
-2.014025, -1.042548, -2.295561, 1, 0.1254902, 0, 1,
-2.0031, -0.7916474, -1.006655, 1, 0.1333333, 0, 1,
-1.989736, 0.769144, 0.3368023, 1, 0.1372549, 0, 1,
-1.962592, -0.93266, -3.088583, 1, 0.145098, 0, 1,
-1.957695, 0.8784744, -1.207329, 1, 0.1490196, 0, 1,
-1.951029, -1.069294, -2.913832, 1, 0.1568628, 0, 1,
-1.940354, -0.0946267, -1.159025, 1, 0.1607843, 0, 1,
-1.938109, 0.09459612, -2.224665, 1, 0.1686275, 0, 1,
-1.933419, -2.028729, -2.139123, 1, 0.172549, 0, 1,
-1.928105, -0.5006739, -2.399025, 1, 0.1803922, 0, 1,
-1.875077, -0.8122389, -2.624652, 1, 0.1843137, 0, 1,
-1.863782, -0.2849173, -2.417532, 1, 0.1921569, 0, 1,
-1.856752, -0.3982692, -2.776261, 1, 0.1960784, 0, 1,
-1.833759, 0.01905295, -3.087969, 1, 0.2039216, 0, 1,
-1.827299, 1.005395, -0.02644143, 1, 0.2117647, 0, 1,
-1.800478, -1.500611, 0.1920605, 1, 0.2156863, 0, 1,
-1.772214, -2.248223, -3.247851, 1, 0.2235294, 0, 1,
-1.759996, -0.9742359, -2.728928, 1, 0.227451, 0, 1,
-1.758994, 1.527166, -0.8821238, 1, 0.2352941, 0, 1,
-1.754278, 0.4242516, -1.806675, 1, 0.2392157, 0, 1,
-1.750584, 0.831448, 1.223745, 1, 0.2470588, 0, 1,
-1.747591, 0.8528898, -1.339414, 1, 0.2509804, 0, 1,
-1.700201, -0.0265112, -3.274112, 1, 0.2588235, 0, 1,
-1.675143, 0.7131251, 0.09466545, 1, 0.2627451, 0, 1,
-1.673901, 1.797078, -1.150802, 1, 0.2705882, 0, 1,
-1.671712, -0.959562, -2.158715, 1, 0.2745098, 0, 1,
-1.667627, 0.5167905, -1.135917, 1, 0.282353, 0, 1,
-1.660309, 0.5952187, -0.5530285, 1, 0.2862745, 0, 1,
-1.644781, 0.1849603, -0.6517071, 1, 0.2941177, 0, 1,
-1.640845, -0.2356072, -2.50938, 1, 0.3019608, 0, 1,
-1.633358, 0.2321338, -1.764363, 1, 0.3058824, 0, 1,
-1.629065, 0.7838256, -1.373294, 1, 0.3137255, 0, 1,
-1.62272, -0.5355355, -2.125808, 1, 0.3176471, 0, 1,
-1.622452, -1.493566, -0.8312688, 1, 0.3254902, 0, 1,
-1.61056, -0.130597, -1.398199, 1, 0.3294118, 0, 1,
-1.60845, 1.328562, 0.9653647, 1, 0.3372549, 0, 1,
-1.60515, 1.412941, -0.4702039, 1, 0.3411765, 0, 1,
-1.591448, -1.138601, -2.726388, 1, 0.3490196, 0, 1,
-1.582284, 0.5282691, -0.0192532, 1, 0.3529412, 0, 1,
-1.567408, 1.303198, 0.1614038, 1, 0.3607843, 0, 1,
-1.559703, 1.479756, 0.1022169, 1, 0.3647059, 0, 1,
-1.546924, -0.6759098, -1.558146, 1, 0.372549, 0, 1,
-1.543893, 0.01472378, -1.293135, 1, 0.3764706, 0, 1,
-1.53609, -2.281906, -4.626596, 1, 0.3843137, 0, 1,
-1.527519, 1.082388, -2.542278, 1, 0.3882353, 0, 1,
-1.518722, 1.596313, 0.6809086, 1, 0.3960784, 0, 1,
-1.499951, -0.4211171, -1.374169, 1, 0.4039216, 0, 1,
-1.495529, 0.9175768, -2.38993, 1, 0.4078431, 0, 1,
-1.485419, 0.6477826, -1.267945, 1, 0.4156863, 0, 1,
-1.481396, 0.6238316, -1.280995, 1, 0.4196078, 0, 1,
-1.471263, 0.07807759, -2.955752, 1, 0.427451, 0, 1,
-1.462606, -0.3371436, -1.454746, 1, 0.4313726, 0, 1,
-1.461117, 0.3956153, -1.083074, 1, 0.4392157, 0, 1,
-1.459739, 0.3940804, -1.651894, 1, 0.4431373, 0, 1,
-1.451152, 1.761826, -1.146817, 1, 0.4509804, 0, 1,
-1.450904, -1.245952, -2.769469, 1, 0.454902, 0, 1,
-1.447218, 0.3349311, -0.5957804, 1, 0.4627451, 0, 1,
-1.442712, -1.389566, -0.6369792, 1, 0.4666667, 0, 1,
-1.43892, -1.159582, -3.534273, 1, 0.4745098, 0, 1,
-1.432998, -1.526023, -2.156368, 1, 0.4784314, 0, 1,
-1.43118, 1.182376, 0.04715603, 1, 0.4862745, 0, 1,
-1.43053, 0.4850366, -0.7425418, 1, 0.4901961, 0, 1,
-1.420792, -0.840807, -2.95654, 1, 0.4980392, 0, 1,
-1.413955, -0.5922282, -2.620278, 1, 0.5058824, 0, 1,
-1.406409, 2.023859, -0.5399942, 1, 0.509804, 0, 1,
-1.375706, 1.602443, 0.3398496, 1, 0.5176471, 0, 1,
-1.375446, -0.2636896, -1.912286, 1, 0.5215687, 0, 1,
-1.371439, 1.266903, -0.8335332, 1, 0.5294118, 0, 1,
-1.360558, -0.6876606, -3.31838, 1, 0.5333334, 0, 1,
-1.360187, 0.6539096, 1.255832, 1, 0.5411765, 0, 1,
-1.353755, -0.1909629, -1.531576, 1, 0.5450981, 0, 1,
-1.336284, -0.1691008, -1.445846, 1, 0.5529412, 0, 1,
-1.33382, 1.576444, 0.04652033, 1, 0.5568628, 0, 1,
-1.333527, -0.4175191, -3.719033, 1, 0.5647059, 0, 1,
-1.326344, 0.3637799, -1.108645, 1, 0.5686275, 0, 1,
-1.324278, 0.9321438, -2.526314, 1, 0.5764706, 0, 1,
-1.3183, -1.607927, 0.1793046, 1, 0.5803922, 0, 1,
-1.317488, 0.1239237, -1.578914, 1, 0.5882353, 0, 1,
-1.313442, -0.7118707, 0.0546789, 1, 0.5921569, 0, 1,
-1.312592, 0.2371321, -2.540786, 1, 0.6, 0, 1,
-1.311007, 0.2213497, -1.340355, 1, 0.6078432, 0, 1,
-1.310101, 0.679135, -2.056283, 1, 0.6117647, 0, 1,
-1.30832, -0.8262895, -1.789873, 1, 0.6196079, 0, 1,
-1.308173, -1.560289, -1.429316, 1, 0.6235294, 0, 1,
-1.29526, -1.038994, -0.3602827, 1, 0.6313726, 0, 1,
-1.291936, -0.1712696, 0.347554, 1, 0.6352941, 0, 1,
-1.290741, 0.08670859, -1.298525, 1, 0.6431373, 0, 1,
-1.285973, -0.2965304, -1.800737, 1, 0.6470588, 0, 1,
-1.27696, 0.4711632, -2.138484, 1, 0.654902, 0, 1,
-1.27269, -1.024425, -3.281629, 1, 0.6588235, 0, 1,
-1.272463, 0.292523, 0.2147869, 1, 0.6666667, 0, 1,
-1.272293, -0.9088128, -2.737191, 1, 0.6705883, 0, 1,
-1.241917, -1.60575, -2.34264, 1, 0.6784314, 0, 1,
-1.239333, 1.363854, 0.1380829, 1, 0.682353, 0, 1,
-1.238393, 0.3919893, -0.7095352, 1, 0.6901961, 0, 1,
-1.237105, -2.048047, -2.005648, 1, 0.6941177, 0, 1,
-1.233879, -0.3022707, 0.09830037, 1, 0.7019608, 0, 1,
-1.2327, 0.7566134, -1.758582, 1, 0.7098039, 0, 1,
-1.229348, -0.326974, -1.267396, 1, 0.7137255, 0, 1,
-1.225294, -0.9154737, -0.9929183, 1, 0.7215686, 0, 1,
-1.209743, -0.9964803, -2.615998, 1, 0.7254902, 0, 1,
-1.208706, -0.07316996, -1.962384, 1, 0.7333333, 0, 1,
-1.206779, 0.138666, 0.2445703, 1, 0.7372549, 0, 1,
-1.191311, 1.065136, -1.147643, 1, 0.7450981, 0, 1,
-1.182701, 1.044944, 0.9156433, 1, 0.7490196, 0, 1,
-1.180118, 0.8315121, -0.4261301, 1, 0.7568628, 0, 1,
-1.177469, -0.2057099, -3.390891, 1, 0.7607843, 0, 1,
-1.171704, 0.1961181, -1.587578, 1, 0.7686275, 0, 1,
-1.164741, 0.8500733, -1.38718, 1, 0.772549, 0, 1,
-1.163335, 1.425638, -1.149471, 1, 0.7803922, 0, 1,
-1.154785, -0.1216458, -1.519015, 1, 0.7843137, 0, 1,
-1.150054, -2.211705, -5.400584, 1, 0.7921569, 0, 1,
-1.147455, 0.07194211, -0.05700743, 1, 0.7960784, 0, 1,
-1.131527, 1.191142, -0.3751278, 1, 0.8039216, 0, 1,
-1.127042, -1.311578, -4.791045, 1, 0.8117647, 0, 1,
-1.123938, 0.3126712, -0.2663477, 1, 0.8156863, 0, 1,
-1.119314, 0.8429134, -0.4336876, 1, 0.8235294, 0, 1,
-1.118928, -1.340273, -1.5937, 1, 0.827451, 0, 1,
-1.115036, 1.493349, -1.90442, 1, 0.8352941, 0, 1,
-1.112552, 0.1705181, -0.7683327, 1, 0.8392157, 0, 1,
-1.103491, -0.169468, -3.003051, 1, 0.8470588, 0, 1,
-1.082825, -0.06002606, -0.7443138, 1, 0.8509804, 0, 1,
-1.07948, 1.216955, -0.7070839, 1, 0.8588235, 0, 1,
-1.079316, 0.5606108, -2.572814, 1, 0.8627451, 0, 1,
-1.075446, 1.19268, -1.592275, 1, 0.8705882, 0, 1,
-1.072332, -0.931548, -1.195361, 1, 0.8745098, 0, 1,
-1.070502, -0.6449593, -1.369529, 1, 0.8823529, 0, 1,
-1.069104, 0.1217556, -1.006801, 1, 0.8862745, 0, 1,
-1.064382, 0.2498022, -3.587635, 1, 0.8941177, 0, 1,
-1.060374, -1.824259, -2.643719, 1, 0.8980392, 0, 1,
-1.058737, 0.3645373, -1.908839, 1, 0.9058824, 0, 1,
-1.046746, -1.693248, -0.4590447, 1, 0.9137255, 0, 1,
-1.040514, 0.236999, -1.651981, 1, 0.9176471, 0, 1,
-1.025854, -0.6712493, -1.403935, 1, 0.9254902, 0, 1,
-1.014089, -0.08927645, -3.389716, 1, 0.9294118, 0, 1,
-1.009294, -0.7249438, -2.820915, 1, 0.9372549, 0, 1,
-1.005471, -0.747089, -0.5389751, 1, 0.9411765, 0, 1,
-0.9988712, -0.68865, -0.5871214, 1, 0.9490196, 0, 1,
-0.9950494, 0.6627167, -2.123368, 1, 0.9529412, 0, 1,
-0.9867705, -0.09213901, -2.225604, 1, 0.9607843, 0, 1,
-0.9810355, -0.3221082, -0.4523023, 1, 0.9647059, 0, 1,
-0.9804699, 0.09138316, -2.698076, 1, 0.972549, 0, 1,
-0.9802017, -1.183553, -1.855649, 1, 0.9764706, 0, 1,
-0.9738667, -0.1799729, -2.993131, 1, 0.9843137, 0, 1,
-0.9671703, -0.2564508, -3.018564, 1, 0.9882353, 0, 1,
-0.9670401, -0.6594526, -3.465159, 1, 0.9960784, 0, 1,
-0.9640443, 0.9171123, 0.5387952, 0.9960784, 1, 0, 1,
-0.9572929, 0.07929891, -1.657892, 0.9921569, 1, 0, 1,
-0.9559952, -1.387491, -0.35006, 0.9843137, 1, 0, 1,
-0.9541376, -0.6211653, -1.444367, 0.9803922, 1, 0, 1,
-0.9533019, 1.563417, -0.4777901, 0.972549, 1, 0, 1,
-0.9510488, 0.5003419, -0.3314863, 0.9686275, 1, 0, 1,
-0.9447703, -0.1821384, -2.876699, 0.9607843, 1, 0, 1,
-0.9439351, -0.03802958, -0.8977953, 0.9568627, 1, 0, 1,
-0.9360698, -1.641969, -2.005277, 0.9490196, 1, 0, 1,
-0.9327813, 0.1320421, -1.356233, 0.945098, 1, 0, 1,
-0.9314457, 0.3334189, -1.739969, 0.9372549, 1, 0, 1,
-0.9281208, 0.2384642, -1.485832, 0.9333333, 1, 0, 1,
-0.9247519, 0.2599832, -2.517057, 0.9254902, 1, 0, 1,
-0.9247143, -0.08622887, -0.634542, 0.9215686, 1, 0, 1,
-0.9179071, -0.7424923, -3.424521, 0.9137255, 1, 0, 1,
-0.9083897, -0.1561841, -3.111604, 0.9098039, 1, 0, 1,
-0.9074501, 0.2163843, -0.8286965, 0.9019608, 1, 0, 1,
-0.9038553, -0.1916705, 0.1962052, 0.8941177, 1, 0, 1,
-0.8981948, 0.5718274, -1.01461, 0.8901961, 1, 0, 1,
-0.8958908, -0.4029731, -1.496757, 0.8823529, 1, 0, 1,
-0.8887352, 0.5159219, 0.1916664, 0.8784314, 1, 0, 1,
-0.8887006, 0.4052401, -0.9307628, 0.8705882, 1, 0, 1,
-0.8878567, -0.3009721, -2.962096, 0.8666667, 1, 0, 1,
-0.8824372, -0.3637182, -1.308315, 0.8588235, 1, 0, 1,
-0.8791431, 0.01174406, -1.326617, 0.854902, 1, 0, 1,
-0.8786376, -0.7872768, -2.887262, 0.8470588, 1, 0, 1,
-0.8779451, -0.7572048, -3.198945, 0.8431373, 1, 0, 1,
-0.8756971, 0.8102358, -0.4826276, 0.8352941, 1, 0, 1,
-0.8702171, 1.491495, -1.024575, 0.8313726, 1, 0, 1,
-0.8699137, -0.1807473, -1.669222, 0.8235294, 1, 0, 1,
-0.866982, 0.9109556, -1.459208, 0.8196079, 1, 0, 1,
-0.8650864, -0.3408126, -3.103904, 0.8117647, 1, 0, 1,
-0.8628061, -1.550019, -1.533812, 0.8078431, 1, 0, 1,
-0.8600852, -0.2977888, -3.372955, 0.8, 1, 0, 1,
-0.8543605, -1.052059, -1.754687, 0.7921569, 1, 0, 1,
-0.8504304, 0.6957998, -2.131341, 0.7882353, 1, 0, 1,
-0.8494273, 0.6916758, -0.4165787, 0.7803922, 1, 0, 1,
-0.8472833, 0.5307666, -1.495554, 0.7764706, 1, 0, 1,
-0.8451044, -0.8623687, -3.854793, 0.7686275, 1, 0, 1,
-0.8445717, -0.4046823, -2.742919, 0.7647059, 1, 0, 1,
-0.8406373, 0.3224949, -0.08370418, 0.7568628, 1, 0, 1,
-0.8394238, -0.372303, -1.811884, 0.7529412, 1, 0, 1,
-0.8307416, -0.03162054, -0.3218587, 0.7450981, 1, 0, 1,
-0.829762, 2.231365, 0.5536267, 0.7411765, 1, 0, 1,
-0.829056, 1.995591, -2.272265, 0.7333333, 1, 0, 1,
-0.8216334, -0.6413946, -2.697692, 0.7294118, 1, 0, 1,
-0.8177118, 0.007635653, -3.16512, 0.7215686, 1, 0, 1,
-0.8132599, -0.03305849, -0.3919725, 0.7176471, 1, 0, 1,
-0.8085186, 1.124091, -0.7334535, 0.7098039, 1, 0, 1,
-0.8018808, -0.4129691, -1.905436, 0.7058824, 1, 0, 1,
-0.799986, -1.949407, -1.255495, 0.6980392, 1, 0, 1,
-0.7970716, 1.64897, -1.127024, 0.6901961, 1, 0, 1,
-0.7970489, 0.3793274, -1.149751, 0.6862745, 1, 0, 1,
-0.7964454, -0.4231499, -3.468771, 0.6784314, 1, 0, 1,
-0.7866582, 0.7904643, -0.8426348, 0.6745098, 1, 0, 1,
-0.7764977, 0.6826787, 0.0007520457, 0.6666667, 1, 0, 1,
-0.7744054, 0.5152903, -2.142787, 0.6627451, 1, 0, 1,
-0.7736465, -0.6727678, -1.530445, 0.654902, 1, 0, 1,
-0.768923, -1.453499, -2.766222, 0.6509804, 1, 0, 1,
-0.764569, -0.5172637, -3.096934, 0.6431373, 1, 0, 1,
-0.7612909, 0.3024188, -0.5209123, 0.6392157, 1, 0, 1,
-0.760832, 1.160016, -1.281872, 0.6313726, 1, 0, 1,
-0.7590263, -0.8067194, -3.785357, 0.627451, 1, 0, 1,
-0.7577547, 1.145158, -1.273383, 0.6196079, 1, 0, 1,
-0.7574175, 1.060375, -0.9569061, 0.6156863, 1, 0, 1,
-0.7550599, -0.4686796, -1.402339, 0.6078432, 1, 0, 1,
-0.7481996, 0.4353201, -1.795221, 0.6039216, 1, 0, 1,
-0.7440349, 1.89327, 0.6625053, 0.5960785, 1, 0, 1,
-0.7420968, 0.5711518, -2.502086, 0.5882353, 1, 0, 1,
-0.7381077, 1.253751, -0.9720538, 0.5843138, 1, 0, 1,
-0.7354779, 0.08866408, -2.513718, 0.5764706, 1, 0, 1,
-0.7329968, 2.438662, 0.8427079, 0.572549, 1, 0, 1,
-0.7327322, -0.4412527, -3.456734, 0.5647059, 1, 0, 1,
-0.7319528, 0.8981469, 0.05270288, 0.5607843, 1, 0, 1,
-0.7294624, -1.622458, -2.941976, 0.5529412, 1, 0, 1,
-0.7272503, -0.08414979, -0.8199258, 0.5490196, 1, 0, 1,
-0.7268221, -0.6513445, -3.390755, 0.5411765, 1, 0, 1,
-0.7210202, -1.070158, -1.47379, 0.5372549, 1, 0, 1,
-0.7206312, -0.8802402, -2.991121, 0.5294118, 1, 0, 1,
-0.7181091, 0.06196404, -1.579308, 0.5254902, 1, 0, 1,
-0.7123345, -0.1233395, -0.8673338, 0.5176471, 1, 0, 1,
-0.7121454, 0.3116493, -0.7451094, 0.5137255, 1, 0, 1,
-0.7115541, 0.4442117, -0.5924854, 0.5058824, 1, 0, 1,
-0.6923382, 1.189619, -0.7828425, 0.5019608, 1, 0, 1,
-0.6922578, -0.5454334, -0.1769976, 0.4941176, 1, 0, 1,
-0.6907222, -0.6048715, -2.399431, 0.4862745, 1, 0, 1,
-0.6870887, 0.004875179, -1.669206, 0.4823529, 1, 0, 1,
-0.6866615, 0.6697025, 0.3763497, 0.4745098, 1, 0, 1,
-0.6859509, 0.765351, 0.09496997, 0.4705882, 1, 0, 1,
-0.6848773, -0.01959568, -3.155449, 0.4627451, 1, 0, 1,
-0.6832189, -0.2737322, -2.68841, 0.4588235, 1, 0, 1,
-0.6823827, -1.379558, -3.234928, 0.4509804, 1, 0, 1,
-0.6784794, 0.9353337, -2.745375, 0.4470588, 1, 0, 1,
-0.6763402, -0.5393727, -0.7753397, 0.4392157, 1, 0, 1,
-0.6651832, 1.428008, 0.4214199, 0.4352941, 1, 0, 1,
-0.6641737, -1.660618, -2.890469, 0.427451, 1, 0, 1,
-0.6626412, -0.08299078, -2.082473, 0.4235294, 1, 0, 1,
-0.6570687, -2.770512, -3.543309, 0.4156863, 1, 0, 1,
-0.6549143, 0.312419, -2.933884, 0.4117647, 1, 0, 1,
-0.6539541, -1.845443, -2.142004, 0.4039216, 1, 0, 1,
-0.6507642, 1.722926, -0.8187013, 0.3960784, 1, 0, 1,
-0.6492054, 0.2324003, -1.465268, 0.3921569, 1, 0, 1,
-0.6473464, -1.018891, -0.7294348, 0.3843137, 1, 0, 1,
-0.6385983, -0.7778255, -2.883043, 0.3803922, 1, 0, 1,
-0.6367992, -1.206565, -1.52189, 0.372549, 1, 0, 1,
-0.6351757, -0.110672, -0.5738164, 0.3686275, 1, 0, 1,
-0.6274277, 0.334211, -2.137335, 0.3607843, 1, 0, 1,
-0.6265095, 1.213299, -1.019911, 0.3568628, 1, 0, 1,
-0.6242751, -1.403763, -2.673909, 0.3490196, 1, 0, 1,
-0.6241505, -0.4889089, -2.003438, 0.345098, 1, 0, 1,
-0.6222169, 0.07599596, -1.596542, 0.3372549, 1, 0, 1,
-0.6208851, -2.157672, -1.184665, 0.3333333, 1, 0, 1,
-0.6146747, 0.1739426, 0.5725728, 0.3254902, 1, 0, 1,
-0.6107884, -0.5487638, -1.816761, 0.3215686, 1, 0, 1,
-0.5980769, 0.646396, 0.3874777, 0.3137255, 1, 0, 1,
-0.5926854, -0.6203334, -3.401997, 0.3098039, 1, 0, 1,
-0.582963, 0.1346804, -1.743201, 0.3019608, 1, 0, 1,
-0.5825174, -2.015253, -3.21926, 0.2941177, 1, 0, 1,
-0.5813518, -1.397138, -2.113718, 0.2901961, 1, 0, 1,
-0.5771646, 0.6311631, -0.9820587, 0.282353, 1, 0, 1,
-0.5760464, -0.7043004, -1.025813, 0.2784314, 1, 0, 1,
-0.5746918, -0.3248809, -3.312757, 0.2705882, 1, 0, 1,
-0.5680498, 0.2305635, -0.838334, 0.2666667, 1, 0, 1,
-0.5668896, -1.42385, -0.6488891, 0.2588235, 1, 0, 1,
-0.5654269, -1.688951, -3.594306, 0.254902, 1, 0, 1,
-0.5650004, -1.84918, -4.887248, 0.2470588, 1, 0, 1,
-0.5621443, -1.27119, -2.045759, 0.2431373, 1, 0, 1,
-0.5582411, -1.226983, -2.873368, 0.2352941, 1, 0, 1,
-0.557625, -2.938612, -1.976716, 0.2313726, 1, 0, 1,
-0.5571437, 0.07528432, -1.680811, 0.2235294, 1, 0, 1,
-0.5559046, 0.1869623, -0.2784203, 0.2196078, 1, 0, 1,
-0.5530479, -0.2170945, -1.718586, 0.2117647, 1, 0, 1,
-0.5487953, 1.543283, -3.045278, 0.2078431, 1, 0, 1,
-0.5444445, 0.2879178, -0.1312981, 0.2, 1, 0, 1,
-0.536903, 0.9579853, -1.015202, 0.1921569, 1, 0, 1,
-0.5345857, -1.441579, -3.622848, 0.1882353, 1, 0, 1,
-0.5313526, -0.2290626, -4.090445, 0.1803922, 1, 0, 1,
-0.527693, -0.7817516, -1.586274, 0.1764706, 1, 0, 1,
-0.5275016, -1.016122, -2.59005, 0.1686275, 1, 0, 1,
-0.5272222, -0.4477017, -3.273614, 0.1647059, 1, 0, 1,
-0.5262367, 1.243115, -0.9726515, 0.1568628, 1, 0, 1,
-0.5260004, -1.200021, -2.513272, 0.1529412, 1, 0, 1,
-0.5178479, -0.1108188, -1.986287, 0.145098, 1, 0, 1,
-0.5138036, -1.416, -2.645091, 0.1411765, 1, 0, 1,
-0.5133002, -1.126303, -1.306912, 0.1333333, 1, 0, 1,
-0.5116019, 1.302322, -1.045621, 0.1294118, 1, 0, 1,
-0.5090416, -0.1968239, -1.714557, 0.1215686, 1, 0, 1,
-0.5075696, -0.9393445, -3.478519, 0.1176471, 1, 0, 1,
-0.5067044, 2.453282, -0.4710692, 0.1098039, 1, 0, 1,
-0.5023572, -1.611846, -1.860065, 0.1058824, 1, 0, 1,
-0.5014558, -0.5896634, -1.467749, 0.09803922, 1, 0, 1,
-0.4859031, 1.19718, 1.408198, 0.09019608, 1, 0, 1,
-0.4852486, -1.708555, -2.456372, 0.08627451, 1, 0, 1,
-0.484154, 0.1405369, -1.750618, 0.07843138, 1, 0, 1,
-0.4839057, 0.05051772, -2.133457, 0.07450981, 1, 0, 1,
-0.481911, -0.3813338, -1.475829, 0.06666667, 1, 0, 1,
-0.4808691, -0.3059918, -1.741022, 0.0627451, 1, 0, 1,
-0.4798976, -1.146783, -2.681617, 0.05490196, 1, 0, 1,
-0.4792458, -2.134091, -2.102181, 0.05098039, 1, 0, 1,
-0.4774375, -0.1453277, -0.9819627, 0.04313726, 1, 0, 1,
-0.4760969, 0.3636576, -1.276444, 0.03921569, 1, 0, 1,
-0.4726627, 1.491782, -0.8816311, 0.03137255, 1, 0, 1,
-0.4699385, 0.4973989, -1.578207, 0.02745098, 1, 0, 1,
-0.4625084, -0.9045836, -2.638906, 0.01960784, 1, 0, 1,
-0.4624248, -0.4578301, -1.660571, 0.01568628, 1, 0, 1,
-0.4455849, -0.5707114, -3.674006, 0.007843138, 1, 0, 1,
-0.4444385, 1.153984, 0.1686599, 0.003921569, 1, 0, 1,
-0.4364795, 0.165314, 0.286056, 0, 1, 0.003921569, 1,
-0.4329398, -1.246186, -3.755227, 0, 1, 0.01176471, 1,
-0.4325987, -1.129959, -3.000572, 0, 1, 0.01568628, 1,
-0.4320678, 1.260178, -0.1178153, 0, 1, 0.02352941, 1,
-0.4281103, -1.298492, -2.894497, 0, 1, 0.02745098, 1,
-0.4261617, 0.2197385, -1.129479, 0, 1, 0.03529412, 1,
-0.42424, 0.830663, -0.6456621, 0, 1, 0.03921569, 1,
-0.4229911, 0.2425344, -1.777735, 0, 1, 0.04705882, 1,
-0.4201851, -1.357473, -2.832353, 0, 1, 0.05098039, 1,
-0.416941, 0.3310887, -2.644111, 0, 1, 0.05882353, 1,
-0.4157705, -0.2228752, -2.014889, 0, 1, 0.0627451, 1,
-0.4130805, 0.6678823, 1.288011, 0, 1, 0.07058824, 1,
-0.4129818, -0.6524934, -2.300158, 0, 1, 0.07450981, 1,
-0.4071673, 0.2352985, -1.538325, 0, 1, 0.08235294, 1,
-0.40351, -0.8642676, -3.835565, 0, 1, 0.08627451, 1,
-0.4022802, 0.9383369, -1.339504, 0, 1, 0.09411765, 1,
-0.4021991, -0.5628207, -1.216518, 0, 1, 0.1019608, 1,
-0.3958176, 1.808843, -0.4113833, 0, 1, 0.1058824, 1,
-0.3912475, 0.8020499, 1.397323, 0, 1, 0.1137255, 1,
-0.3881863, -1.079099, -2.806714, 0, 1, 0.1176471, 1,
-0.386652, 0.8499929, 0.1613822, 0, 1, 0.1254902, 1,
-0.3862864, -0.4048342, -3.531011, 0, 1, 0.1294118, 1,
-0.3857007, -0.3202118, -0.2138164, 0, 1, 0.1372549, 1,
-0.379862, -0.1520938, -0.926245, 0, 1, 0.1411765, 1,
-0.3768802, 1.116497, -0.6389779, 0, 1, 0.1490196, 1,
-0.3735254, -1.072321, -3.551669, 0, 1, 0.1529412, 1,
-0.3707531, 0.1627189, -1.441839, 0, 1, 0.1607843, 1,
-0.3622176, 1.12895, -1.840809, 0, 1, 0.1647059, 1,
-0.3620163, -0.4399006, -1.452463, 0, 1, 0.172549, 1,
-0.3609867, 0.9830384, -0.8237154, 0, 1, 0.1764706, 1,
-0.3582858, 0.1349823, -1.755775, 0, 1, 0.1843137, 1,
-0.3565373, -0.3765559, -1.16936, 0, 1, 0.1882353, 1,
-0.3564118, 0.9926816, 1.219524, 0, 1, 0.1960784, 1,
-0.3561136, 1.665782, -0.2365823, 0, 1, 0.2039216, 1,
-0.35577, -0.3864188, -1.226089, 0, 1, 0.2078431, 1,
-0.3539802, 0.5725394, -0.03818361, 0, 1, 0.2156863, 1,
-0.3530946, 1.224097, 0.2120427, 0, 1, 0.2196078, 1,
-0.3451824, 0.08162701, -0.9198238, 0, 1, 0.227451, 1,
-0.3444824, -0.6959403, -1.687686, 0, 1, 0.2313726, 1,
-0.3402782, -1.057539, -3.692028, 0, 1, 0.2392157, 1,
-0.3399602, 0.678945, -0.2785983, 0, 1, 0.2431373, 1,
-0.335942, -0.04609682, -2.526932, 0, 1, 0.2509804, 1,
-0.332904, -1.042776, -4.127119, 0, 1, 0.254902, 1,
-0.3259018, 1.085657, -1.166534, 0, 1, 0.2627451, 1,
-0.3244444, -0.5526943, -4.067038, 0, 1, 0.2666667, 1,
-0.3241087, -1.73185, -4.340894, 0, 1, 0.2745098, 1,
-0.3221692, -0.7461867, -3.805475, 0, 1, 0.2784314, 1,
-0.3204208, -1.71329, -3.912212, 0, 1, 0.2862745, 1,
-0.3202924, 0.7908617, -1.34099, 0, 1, 0.2901961, 1,
-0.3191781, 0.8007294, -1.328762, 0, 1, 0.2980392, 1,
-0.318729, -0.8739806, -1.907901, 0, 1, 0.3058824, 1,
-0.3177972, -0.3189978, -1.815267, 0, 1, 0.3098039, 1,
-0.2982843, -0.7939637, -3.84284, 0, 1, 0.3176471, 1,
-0.2969467, -0.3799343, -2.975401, 0, 1, 0.3215686, 1,
-0.2947181, -0.1661453, -3.68835, 0, 1, 0.3294118, 1,
-0.2914962, -1.759413, -2.946568, 0, 1, 0.3333333, 1,
-0.2911073, -0.06129459, -0.7697671, 0, 1, 0.3411765, 1,
-0.2882836, -0.9921154, -2.602491, 0, 1, 0.345098, 1,
-0.2867905, -0.69047, -1.399986, 0, 1, 0.3529412, 1,
-0.2831021, 0.7746781, 1.430015, 0, 1, 0.3568628, 1,
-0.2826984, 1.131434, 1.880643, 0, 1, 0.3647059, 1,
-0.280672, -0.284985, -0.8902031, 0, 1, 0.3686275, 1,
-0.2791784, 0.2858825, -2.145764, 0, 1, 0.3764706, 1,
-0.2774984, 0.03107731, -1.128781, 0, 1, 0.3803922, 1,
-0.2729752, -0.8679801, -3.087313, 0, 1, 0.3882353, 1,
-0.2715611, 1.464296, -1.652712, 0, 1, 0.3921569, 1,
-0.2675602, -0.09728834, -1.84476, 0, 1, 0.4, 1,
-0.2633067, -0.2410547, -2.423323, 0, 1, 0.4078431, 1,
-0.2511341, 0.4805664, -2.308052, 0, 1, 0.4117647, 1,
-0.2371258, -0.575142, -3.886339, 0, 1, 0.4196078, 1,
-0.2359728, -1.599876, -3.211736, 0, 1, 0.4235294, 1,
-0.2305619, 0.2609383, -0.05964218, 0, 1, 0.4313726, 1,
-0.2273327, 1.561386, -1.662607, 0, 1, 0.4352941, 1,
-0.2250978, 0.2482777, -2.674383, 0, 1, 0.4431373, 1,
-0.2242814, 0.1237748, 0.6413609, 0, 1, 0.4470588, 1,
-0.2222828, 1.065832, -2.502336, 0, 1, 0.454902, 1,
-0.2208462, 1.160667, -0.9568611, 0, 1, 0.4588235, 1,
-0.2200496, 0.7451504, 0.1504131, 0, 1, 0.4666667, 1,
-0.2160041, 0.08872153, 0.1997535, 0, 1, 0.4705882, 1,
-0.2154157, 1.680098, 0.5248588, 0, 1, 0.4784314, 1,
-0.2144914, -0.7846669, -3.793324, 0, 1, 0.4823529, 1,
-0.2139006, 3.627412, -2.266476, 0, 1, 0.4901961, 1,
-0.2110655, -1.284011, -4.037394, 0, 1, 0.4941176, 1,
-0.2105507, 0.05395512, -1.660323, 0, 1, 0.5019608, 1,
-0.2085275, 0.3739275, -1.336854, 0, 1, 0.509804, 1,
-0.2076388, 0.4193715, 0.7673566, 0, 1, 0.5137255, 1,
-0.2061457, -0.9894344, -3.969161, 0, 1, 0.5215687, 1,
-0.2055684, 0.1654808, -0.5879095, 0, 1, 0.5254902, 1,
-0.2033139, 1.431844, -1.100476, 0, 1, 0.5333334, 1,
-0.1996983, 0.3894767, -0.539888, 0, 1, 0.5372549, 1,
-0.1987159, -1.456111, -3.483756, 0, 1, 0.5450981, 1,
-0.1961025, 0.2574187, -0.8581355, 0, 1, 0.5490196, 1,
-0.1945498, -0.2866706, -0.9217722, 0, 1, 0.5568628, 1,
-0.1939269, 0.8998209, -1.270565, 0, 1, 0.5607843, 1,
-0.1925872, 0.1925659, -2.087932, 0, 1, 0.5686275, 1,
-0.191778, -0.5234538, -2.248958, 0, 1, 0.572549, 1,
-0.1883572, -0.6398149, -2.561047, 0, 1, 0.5803922, 1,
-0.183223, 1.500386, -0.2623534, 0, 1, 0.5843138, 1,
-0.1829792, 1.26645, -0.005054989, 0, 1, 0.5921569, 1,
-0.174451, 0.2362887, 0.5668324, 0, 1, 0.5960785, 1,
-0.1623474, -1.571282, -3.792306, 0, 1, 0.6039216, 1,
-0.1610629, 0.2037585, 0.5400081, 0, 1, 0.6117647, 1,
-0.1607275, -0.349961, -3.490066, 0, 1, 0.6156863, 1,
-0.1596585, -2.563227, -0.7221283, 0, 1, 0.6235294, 1,
-0.158061, 0.1099734, -1.990344, 0, 1, 0.627451, 1,
-0.1562139, -0.02201525, -0.509113, 0, 1, 0.6352941, 1,
-0.1547796, 1.57402, 1.266272, 0, 1, 0.6392157, 1,
-0.1547511, 0.74742, 1.50045, 0, 1, 0.6470588, 1,
-0.1526932, -0.4164406, -2.600278, 0, 1, 0.6509804, 1,
-0.1515749, 1.065088, 0.8194436, 0, 1, 0.6588235, 1,
-0.1474367, -0.6732666, -1.448569, 0, 1, 0.6627451, 1,
-0.1462184, -1.683601, -3.39454, 0, 1, 0.6705883, 1,
-0.1461619, -0.0178857, -0.698083, 0, 1, 0.6745098, 1,
-0.146001, -0.9303865, -4.282306, 0, 1, 0.682353, 1,
-0.145814, -0.4893272, -2.37015, 0, 1, 0.6862745, 1,
-0.1443448, -0.4874129, -1.841491, 0, 1, 0.6941177, 1,
-0.1427405, -0.03105025, -2.844223, 0, 1, 0.7019608, 1,
-0.1408682, -0.5071921, -2.008003, 0, 1, 0.7058824, 1,
-0.1407326, -0.7950566, -3.015766, 0, 1, 0.7137255, 1,
-0.1383113, 1.072849, 0.7700552, 0, 1, 0.7176471, 1,
-0.1376078, -0.6614324, -4.122513, 0, 1, 0.7254902, 1,
-0.1364901, -1.527776, -4.489439, 0, 1, 0.7294118, 1,
-0.1351371, 0.02746808, 0.2558102, 0, 1, 0.7372549, 1,
-0.1333679, 0.8076214, 1.056003, 0, 1, 0.7411765, 1,
-0.1318096, 0.01534076, -2.498867, 0, 1, 0.7490196, 1,
-0.1287168, 0.4934038, -0.5145361, 0, 1, 0.7529412, 1,
-0.1281937, -0.7238588, -2.531471, 0, 1, 0.7607843, 1,
-0.1185693, 0.2519287, -0.7679175, 0, 1, 0.7647059, 1,
-0.113295, 0.8169352, -0.938851, 0, 1, 0.772549, 1,
-0.1132788, 0.7138246, -1.781408, 0, 1, 0.7764706, 1,
-0.113178, -0.3128038, -1.606712, 0, 1, 0.7843137, 1,
-0.1117937, 0.9919951, 0.2743293, 0, 1, 0.7882353, 1,
-0.1072079, 0.2074675, 0.8381714, 0, 1, 0.7960784, 1,
-0.1068147, -2.151604, -1.726304, 0, 1, 0.8039216, 1,
-0.104988, -1.623034, -3.867505, 0, 1, 0.8078431, 1,
-0.1028944, -0.5308274, -3.843443, 0, 1, 0.8156863, 1,
-0.1028314, 0.203541, -1.724316, 0, 1, 0.8196079, 1,
-0.09695636, -0.4358777, -4.147817, 0, 1, 0.827451, 1,
-0.09600572, -1.511569, -2.741755, 0, 1, 0.8313726, 1,
-0.09466556, -0.3702552, -1.108558, 0, 1, 0.8392157, 1,
-0.08875643, -0.7454529, -2.716399, 0, 1, 0.8431373, 1,
-0.08575457, -0.370906, -2.959104, 0, 1, 0.8509804, 1,
-0.08492041, -1.548204, -4.681943, 0, 1, 0.854902, 1,
-0.08421026, -0.5543112, -3.364125, 0, 1, 0.8627451, 1,
-0.08179601, -0.08846794, -0.9373932, 0, 1, 0.8666667, 1,
-0.0799183, 0.3116065, -0.5514567, 0, 1, 0.8745098, 1,
-0.07896538, 0.4836054, -0.2827692, 0, 1, 0.8784314, 1,
-0.07816116, -1.134167, -2.967511, 0, 1, 0.8862745, 1,
-0.07384741, 0.2453979, -2.30298, 0, 1, 0.8901961, 1,
-0.07171538, -0.3820008, -3.077568, 0, 1, 0.8980392, 1,
-0.06983963, -2.029474, -2.272387, 0, 1, 0.9058824, 1,
-0.06349144, 0.6699229, 0.9358823, 0, 1, 0.9098039, 1,
-0.0554909, -0.1015769, -1.623316, 0, 1, 0.9176471, 1,
-0.05497754, 0.06805786, -1.510638, 0, 1, 0.9215686, 1,
-0.05154314, 0.9455303, 0.3164853, 0, 1, 0.9294118, 1,
-0.05040548, 0.1689898, 0.1264066, 0, 1, 0.9333333, 1,
-0.04873866, 0.9547427, 0.8027485, 0, 1, 0.9411765, 1,
-0.04839024, 0.8459737, -0.6816448, 0, 1, 0.945098, 1,
-0.04704086, -0.8900573, -3.567327, 0, 1, 0.9529412, 1,
-0.04329344, -0.4698314, -3.635784, 0, 1, 0.9568627, 1,
-0.04160321, 0.5778791, 1.234299, 0, 1, 0.9647059, 1,
-0.04081434, -0.4624837, -2.88267, 0, 1, 0.9686275, 1,
-0.04012462, 0.344848, 1.280578, 0, 1, 0.9764706, 1,
-0.03767303, 0.6178308, 0.3092169, 0, 1, 0.9803922, 1,
-0.03761121, -1.858856, -3.146386, 0, 1, 0.9882353, 1,
-0.03517394, 1.591821, 0.9402274, 0, 1, 0.9921569, 1,
-0.03048571, 2.090263, -0.6068205, 0, 1, 1, 1,
-0.0267596, 0.802539, 1.261067, 0, 0.9921569, 1, 1,
-0.02433127, 0.9554489, -0.3756667, 0, 0.9882353, 1, 1,
-0.01968706, -0.04293354, -0.7629721, 0, 0.9803922, 1, 1,
-0.01839508, 0.1535454, -1.043074, 0, 0.9764706, 1, 1,
-0.01703708, -0.4397635, -2.301441, 0, 0.9686275, 1, 1,
-0.01476089, 1.168096, -0.4256207, 0, 0.9647059, 1, 1,
-0.01369121, 1.358276, 0.8774259, 0, 0.9568627, 1, 1,
-0.01262478, 0.4892726, -0.2766261, 0, 0.9529412, 1, 1,
-0.01231476, 0.4526739, -0.3827926, 0, 0.945098, 1, 1,
-0.007743798, -1.482851, -4.887831, 0, 0.9411765, 1, 1,
-0.007589751, -1.697977, -4.279465, 0, 0.9333333, 1, 1,
-0.007350998, 0.5319371, 2.032829, 0, 0.9294118, 1, 1,
-0.001314076, -0.3708536, -3.529251, 0, 0.9215686, 1, 1,
0.00763091, -0.6641976, 2.073995, 0, 0.9176471, 1, 1,
0.008959313, -0.4926887, 4.729457, 0, 0.9098039, 1, 1,
0.01673048, 0.92572, 1.104028, 0, 0.9058824, 1, 1,
0.01712319, 0.6636462, 0.02607397, 0, 0.8980392, 1, 1,
0.0218944, -0.4130824, 2.86914, 0, 0.8901961, 1, 1,
0.02723753, -0.194062, 1.551205, 0, 0.8862745, 1, 1,
0.03054162, -0.5601735, 3.307205, 0, 0.8784314, 1, 1,
0.03072836, -1.064539, 4.681201, 0, 0.8745098, 1, 1,
0.03371479, 0.8785495, -0.4162733, 0, 0.8666667, 1, 1,
0.03375679, -0.6757436, 4.208145, 0, 0.8627451, 1, 1,
0.03396186, 0.8979427, 0.7022438, 0, 0.854902, 1, 1,
0.03425442, 0.2957239, 0.9589843, 0, 0.8509804, 1, 1,
0.04136631, 0.9260086, 0.2851325, 0, 0.8431373, 1, 1,
0.04308387, 1.508782, 0.9982845, 0, 0.8392157, 1, 1,
0.04426967, 1.255712, 1.14932, 0, 0.8313726, 1, 1,
0.04694648, 1.037917, 0.1633011, 0, 0.827451, 1, 1,
0.04863605, 0.3654632, 0.5966022, 0, 0.8196079, 1, 1,
0.05454851, -2.603961, 2.6575, 0, 0.8156863, 1, 1,
0.05901792, 1.070886, 0.1167284, 0, 0.8078431, 1, 1,
0.06062028, -1.783808, 3.213647, 0, 0.8039216, 1, 1,
0.0608911, -0.8491511, 3.257091, 0, 0.7960784, 1, 1,
0.06577016, 1.463463, -0.4920193, 0, 0.7882353, 1, 1,
0.06818266, -0.1845347, 2.800145, 0, 0.7843137, 1, 1,
0.06951121, -0.5371327, 3.917747, 0, 0.7764706, 1, 1,
0.07064274, 1.330962, -2.138241, 0, 0.772549, 1, 1,
0.07472765, 0.3842908, 1.555519, 0, 0.7647059, 1, 1,
0.07539506, 1.497748, -0.2981969, 0, 0.7607843, 1, 1,
0.07702448, 1.01223, -0.03112757, 0, 0.7529412, 1, 1,
0.07799228, 1.183406, -0.1609385, 0, 0.7490196, 1, 1,
0.08119822, 0.812027, 2.333838, 0, 0.7411765, 1, 1,
0.08476142, -0.5991107, 4.282451, 0, 0.7372549, 1, 1,
0.08966729, 1.549948, -2.055164, 0, 0.7294118, 1, 1,
0.0970989, -1.037404, 1.797707, 0, 0.7254902, 1, 1,
0.09781364, 1.020729, -0.6044822, 0, 0.7176471, 1, 1,
0.1000946, 0.5038628, -1.37306, 0, 0.7137255, 1, 1,
0.1045714, -0.6730819, 3.088286, 0, 0.7058824, 1, 1,
0.1046742, -1.953376, 1.723382, 0, 0.6980392, 1, 1,
0.1053736, 1.821704, 2.73885, 0, 0.6941177, 1, 1,
0.1087336, -1.257743, 5.274825, 0, 0.6862745, 1, 1,
0.1169091, 0.8221755, 0.4730259, 0, 0.682353, 1, 1,
0.1205863, 0.403495, 1.085519, 0, 0.6745098, 1, 1,
0.1255966, 1.14648, -2.035126, 0, 0.6705883, 1, 1,
0.1257042, -1.060581, 3.527345, 0, 0.6627451, 1, 1,
0.1257937, -0.6114045, 4.510673, 0, 0.6588235, 1, 1,
0.130583, 0.6616054, 2.118737, 0, 0.6509804, 1, 1,
0.132122, -1.342215, 3.894197, 0, 0.6470588, 1, 1,
0.1323157, -0.3679871, 2.589237, 0, 0.6392157, 1, 1,
0.1362411, 0.7331224, 0.9027312, 0, 0.6352941, 1, 1,
0.1379542, 1.004089, -0.9847335, 0, 0.627451, 1, 1,
0.1395494, 0.02463508, 0.04933232, 0, 0.6235294, 1, 1,
0.1567694, -0.8658624, 1.334076, 0, 0.6156863, 1, 1,
0.1570479, -0.07259177, 1.78454, 0, 0.6117647, 1, 1,
0.1570844, 0.5226434, 0.1360983, 0, 0.6039216, 1, 1,
0.1659696, -0.3070243, 2.320036, 0, 0.5960785, 1, 1,
0.1753306, -0.5234924, 3.605576, 0, 0.5921569, 1, 1,
0.1753419, -0.1212687, 2.862172, 0, 0.5843138, 1, 1,
0.1794126, 1.198948, -0.5227502, 0, 0.5803922, 1, 1,
0.1819864, -0.1238279, 0.5081177, 0, 0.572549, 1, 1,
0.1842382, 0.5361024, -1.30241, 0, 0.5686275, 1, 1,
0.1856036, -0.1494198, 2.727954, 0, 0.5607843, 1, 1,
0.1896202, -0.1319821, 2.936596, 0, 0.5568628, 1, 1,
0.1932874, 0.2725801, -0.118551, 0, 0.5490196, 1, 1,
0.195996, 0.4829896, 1.559389, 0, 0.5450981, 1, 1,
0.198869, -0.08748396, 2.364051, 0, 0.5372549, 1, 1,
0.1988975, -0.9312999, 2.924444, 0, 0.5333334, 1, 1,
0.2039912, -0.8331053, 0.9155009, 0, 0.5254902, 1, 1,
0.2046222, 0.8473538, 0.1026957, 0, 0.5215687, 1, 1,
0.212638, 1.042608, -0.8161236, 0, 0.5137255, 1, 1,
0.2128869, 0.177938, 2.314386, 0, 0.509804, 1, 1,
0.2148627, -0.09670867, 3.972136, 0, 0.5019608, 1, 1,
0.2162395, 0.4869364, 0.3543676, 0, 0.4941176, 1, 1,
0.221658, -1.690442, 2.769423, 0, 0.4901961, 1, 1,
0.2276571, 0.006604416, 2.298633, 0, 0.4823529, 1, 1,
0.2277437, -1.600137, 3.936571, 0, 0.4784314, 1, 1,
0.2298205, 0.2535649, 1.780347, 0, 0.4705882, 1, 1,
0.2336643, 0.956673, 1.263615, 0, 0.4666667, 1, 1,
0.2355053, -0.8058944, 3.021688, 0, 0.4588235, 1, 1,
0.2358497, 1.021117, 1.183573, 0, 0.454902, 1, 1,
0.2416769, 0.01309385, 0.833406, 0, 0.4470588, 1, 1,
0.2430407, 0.7725478, 1.07969, 0, 0.4431373, 1, 1,
0.2436188, 0.3807606, 1.534219, 0, 0.4352941, 1, 1,
0.244377, 0.2164409, 1.544802, 0, 0.4313726, 1, 1,
0.2451906, -1.198081, 1.499243, 0, 0.4235294, 1, 1,
0.2461026, 0.08513996, -0.205814, 0, 0.4196078, 1, 1,
0.2485513, -0.3345972, 0.9172961, 0, 0.4117647, 1, 1,
0.2508939, 0.2496543, -0.163212, 0, 0.4078431, 1, 1,
0.2513283, 0.2535927, -0.4482724, 0, 0.4, 1, 1,
0.2520653, 0.2822269, 1.739416, 0, 0.3921569, 1, 1,
0.2595231, 1.649783, 0.2496041, 0, 0.3882353, 1, 1,
0.259524, -0.8567508, 3.756509, 0, 0.3803922, 1, 1,
0.2621554, -0.6105286, 3.947832, 0, 0.3764706, 1, 1,
0.2630014, -1.420323, 3.998654, 0, 0.3686275, 1, 1,
0.2696283, -0.4938405, 2.650069, 0, 0.3647059, 1, 1,
0.2802102, 0.7030753, -0.08836912, 0, 0.3568628, 1, 1,
0.2822663, -0.6429985, 1.995903, 0, 0.3529412, 1, 1,
0.2827698, -1.067929, 4.071751, 0, 0.345098, 1, 1,
0.2829325, -0.2878032, 0.980038, 0, 0.3411765, 1, 1,
0.2861592, 0.2979055, 2.073543, 0, 0.3333333, 1, 1,
0.2872793, -2.313647, 4.191034, 0, 0.3294118, 1, 1,
0.2947663, 0.1961891, 0.1609063, 0, 0.3215686, 1, 1,
0.2960856, 0.4244741, -0.2447098, 0, 0.3176471, 1, 1,
0.3016236, -0.6986433, 2.082661, 0, 0.3098039, 1, 1,
0.3020807, -1.231922, 2.807085, 0, 0.3058824, 1, 1,
0.3109302, -0.325269, 2.849937, 0, 0.2980392, 1, 1,
0.3138043, 1.464441, -1.036664, 0, 0.2901961, 1, 1,
0.3149306, 1.583128, -0.08724512, 0, 0.2862745, 1, 1,
0.3218943, 1.63733, 2.067568, 0, 0.2784314, 1, 1,
0.322109, 0.2430211, 1.052955, 0, 0.2745098, 1, 1,
0.3264716, -0.9186612, 3.947611, 0, 0.2666667, 1, 1,
0.3266062, -0.188584, 3.404613, 0, 0.2627451, 1, 1,
0.3281251, -0.8489329, 3.510844, 0, 0.254902, 1, 1,
0.340752, -0.05240821, 2.198657, 0, 0.2509804, 1, 1,
0.3413209, 0.2483921, 1.58954, 0, 0.2431373, 1, 1,
0.3435062, 1.100649, 0.06196761, 0, 0.2392157, 1, 1,
0.3443539, 0.3978886, 1.814485, 0, 0.2313726, 1, 1,
0.3444914, 0.1690224, 1.776462, 0, 0.227451, 1, 1,
0.3461069, -0.6350836, 3.305853, 0, 0.2196078, 1, 1,
0.347311, -0.5721726, 3.914703, 0, 0.2156863, 1, 1,
0.3475132, -0.1428587, 2.752727, 0, 0.2078431, 1, 1,
0.3528823, -0.7350907, 3.049903, 0, 0.2039216, 1, 1,
0.353197, -2.264363, 2.431265, 0, 0.1960784, 1, 1,
0.3536751, 0.5647789, -0.5041873, 0, 0.1882353, 1, 1,
0.354651, 0.1659528, 1.887214, 0, 0.1843137, 1, 1,
0.3559149, -1.871986, 2.577044, 0, 0.1764706, 1, 1,
0.3568982, -1.316599, 3.624079, 0, 0.172549, 1, 1,
0.3589367, 0.1357516, 2.848969, 0, 0.1647059, 1, 1,
0.3614272, -1.122913, 1.646554, 0, 0.1607843, 1, 1,
0.3633484, -1.332198, 2.044364, 0, 0.1529412, 1, 1,
0.364832, 1.808423, 0.2752116, 0, 0.1490196, 1, 1,
0.3668286, 0.2265961, 2.162182, 0, 0.1411765, 1, 1,
0.3707149, -1.133949, 4.01546, 0, 0.1372549, 1, 1,
0.3716365, 0.9605626, 0.8961716, 0, 0.1294118, 1, 1,
0.372841, -0.9509264, 1.323518, 0, 0.1254902, 1, 1,
0.3729413, 0.121147, 3.270195, 0, 0.1176471, 1, 1,
0.3749078, 1.770744, -0.2997751, 0, 0.1137255, 1, 1,
0.3776208, 0.7392958, 0.4106807, 0, 0.1058824, 1, 1,
0.3786567, 0.03658736, 1.386602, 0, 0.09803922, 1, 1,
0.381131, 0.9733403, -0.4362959, 0, 0.09411765, 1, 1,
0.3897195, -0.8255797, 2.763074, 0, 0.08627451, 1, 1,
0.3898683, -1.742134, 2.406084, 0, 0.08235294, 1, 1,
0.3970982, 0.7789904, 0.1872188, 0, 0.07450981, 1, 1,
0.4079987, 0.9500778, -1.290895, 0, 0.07058824, 1, 1,
0.4089709, 0.7577759, 0.3300356, 0, 0.0627451, 1, 1,
0.4112685, -1.302565, 3.443808, 0, 0.05882353, 1, 1,
0.4142076, -0.1416111, 3.127884, 0, 0.05098039, 1, 1,
0.4170809, -1.1093, 3.187392, 0, 0.04705882, 1, 1,
0.4190937, -0.6496022, 3.627641, 0, 0.03921569, 1, 1,
0.4205796, 0.1491573, 0.02485113, 0, 0.03529412, 1, 1,
0.4226562, -1.7605, 1.833216, 0, 0.02745098, 1, 1,
0.4236812, -1.74283, 2.757155, 0, 0.02352941, 1, 1,
0.4250726, -0.4738949, 2.235337, 0, 0.01568628, 1, 1,
0.4282185, 1.810988, -0.1763164, 0, 0.01176471, 1, 1,
0.4294861, 1.65346, 1.159948, 0, 0.003921569, 1, 1,
0.4306167, -0.08506255, 1.297706, 0.003921569, 0, 1, 1,
0.4308759, -0.6100122, 3.247797, 0.007843138, 0, 1, 1,
0.4322648, -0.3950663, 1.947635, 0.01568628, 0, 1, 1,
0.432487, -0.6616032, 2.288813, 0.01960784, 0, 1, 1,
0.4330466, -1.544056, 4.456378, 0.02745098, 0, 1, 1,
0.4340394, -0.5718434, 1.787601, 0.03137255, 0, 1, 1,
0.4347391, 0.339341, -0.2083929, 0.03921569, 0, 1, 1,
0.4387091, -0.05565454, 0.5616232, 0.04313726, 0, 1, 1,
0.4387776, 1.116627, 0.2552936, 0.05098039, 0, 1, 1,
0.4438182, -0.8410841, 4.454113, 0.05490196, 0, 1, 1,
0.4470705, -0.2758806, 0.4877035, 0.0627451, 0, 1, 1,
0.447847, 0.8416734, 0.9869578, 0.06666667, 0, 1, 1,
0.4493692, -1.273529, 0.6671405, 0.07450981, 0, 1, 1,
0.4537655, -0.5980543, 1.608798, 0.07843138, 0, 1, 1,
0.4561516, 1.691903, 0.1601698, 0.08627451, 0, 1, 1,
0.4569943, 1.606696, 0.4298792, 0.09019608, 0, 1, 1,
0.4591959, -1.800861, 2.942754, 0.09803922, 0, 1, 1,
0.4624742, -0.6161299, 3.483907, 0.1058824, 0, 1, 1,
0.4651534, -0.06295383, 1.059834, 0.1098039, 0, 1, 1,
0.4678761, -1.927097, 4.854848, 0.1176471, 0, 1, 1,
0.4706967, 0.7287772, 0.2421928, 0.1215686, 0, 1, 1,
0.4707921, 0.7472912, -0.9738093, 0.1294118, 0, 1, 1,
0.4737862, -0.7408614, 3.785911, 0.1333333, 0, 1, 1,
0.4743552, -1.210401, 4.02128, 0.1411765, 0, 1, 1,
0.476225, 0.5745353, -0.48334, 0.145098, 0, 1, 1,
0.4787159, -1.052219, 2.313745, 0.1529412, 0, 1, 1,
0.4792602, -0.1141026, 2.471504, 0.1568628, 0, 1, 1,
0.480909, -1.165351, 2.415835, 0.1647059, 0, 1, 1,
0.4865018, -0.965856, 1.973569, 0.1686275, 0, 1, 1,
0.488519, -1.33379, 3.496076, 0.1764706, 0, 1, 1,
0.4885793, 0.1351547, 2.240473, 0.1803922, 0, 1, 1,
0.4929966, 1.008428, 0.4419686, 0.1882353, 0, 1, 1,
0.4966972, 0.1667109, 2.344662, 0.1921569, 0, 1, 1,
0.497143, -0.4960867, 2.054212, 0.2, 0, 1, 1,
0.5080974, -0.3734337, 1.532748, 0.2078431, 0, 1, 1,
0.5168216, -0.6195304, 3.655107, 0.2117647, 0, 1, 1,
0.5171904, 0.08131707, 3.733687, 0.2196078, 0, 1, 1,
0.5196655, 0.5817516, 0.0583798, 0.2235294, 0, 1, 1,
0.5240753, 0.06167264, 2.020686, 0.2313726, 0, 1, 1,
0.5258237, -0.3011051, 1.875266, 0.2352941, 0, 1, 1,
0.5271348, 0.02404228, 1.529256, 0.2431373, 0, 1, 1,
0.5279136, 1.494685, -0.101085, 0.2470588, 0, 1, 1,
0.5284442, 1.228779, -0.7910588, 0.254902, 0, 1, 1,
0.529277, -0.5097219, 1.210995, 0.2588235, 0, 1, 1,
0.5371102, -0.5148732, 3.074461, 0.2666667, 0, 1, 1,
0.5457267, 0.7536431, 1.511679, 0.2705882, 0, 1, 1,
0.5549244, 1.406002, 0.6226248, 0.2784314, 0, 1, 1,
0.556541, 1.170681, 1.19158, 0.282353, 0, 1, 1,
0.5618277, 0.7448911, 1.33174, 0.2901961, 0, 1, 1,
0.5622771, -1.009863, 2.946824, 0.2941177, 0, 1, 1,
0.5625035, 0.1684941, 2.284844, 0.3019608, 0, 1, 1,
0.5627252, -0.9993214, 2.677921, 0.3098039, 0, 1, 1,
0.5682256, -0.4416861, 2.220196, 0.3137255, 0, 1, 1,
0.5775097, -0.6278415, 2.588526, 0.3215686, 0, 1, 1,
0.582355, -0.1713118, -0.155646, 0.3254902, 0, 1, 1,
0.5863537, -1.486084, 3.474484, 0.3333333, 0, 1, 1,
0.5876302, -0.521356, 1.484307, 0.3372549, 0, 1, 1,
0.5974001, 0.3941466, 1.295061, 0.345098, 0, 1, 1,
0.6022161, 1.528799, -0.208851, 0.3490196, 0, 1, 1,
0.6024507, 0.2493706, -0.3150211, 0.3568628, 0, 1, 1,
0.6118929, -0.2582729, 2.357452, 0.3607843, 0, 1, 1,
0.6175881, -0.2401892, 0.8421564, 0.3686275, 0, 1, 1,
0.618037, -1.204631, 1.102132, 0.372549, 0, 1, 1,
0.6180469, 1.200146, 1.114147, 0.3803922, 0, 1, 1,
0.6190536, 0.4511609, 0.07396817, 0.3843137, 0, 1, 1,
0.6221757, -1.517095, 3.09536, 0.3921569, 0, 1, 1,
0.6253985, -0.9442034, 3.434144, 0.3960784, 0, 1, 1,
0.6261137, 1.83942, 0.3423411, 0.4039216, 0, 1, 1,
0.6336226, 0.7065673, -0.9301763, 0.4117647, 0, 1, 1,
0.6343307, 0.4272987, 0.2245463, 0.4156863, 0, 1, 1,
0.635562, -0.6834575, 2.617133, 0.4235294, 0, 1, 1,
0.6358439, -1.351718, 2.716448, 0.427451, 0, 1, 1,
0.6431382, -0.2730722, 2.341779, 0.4352941, 0, 1, 1,
0.6442353, 2.634563, 0.4816831, 0.4392157, 0, 1, 1,
0.6485652, 0.860616, 0.2632485, 0.4470588, 0, 1, 1,
0.6515445, 0.9178368, 1.279616, 0.4509804, 0, 1, 1,
0.6614271, -0.614986, 4.531131, 0.4588235, 0, 1, 1,
0.6633291, 1.485919, -0.7207051, 0.4627451, 0, 1, 1,
0.6673474, -1.49531, 1.648598, 0.4705882, 0, 1, 1,
0.6680966, -0.1654946, 3.745444, 0.4745098, 0, 1, 1,
0.6738405, -0.1695204, 2.115734, 0.4823529, 0, 1, 1,
0.674898, 0.26674, 1.76318, 0.4862745, 0, 1, 1,
0.6768638, 1.348544, 1.728105, 0.4941176, 0, 1, 1,
0.6776366, 0.167796, 4.170899, 0.5019608, 0, 1, 1,
0.6789933, -1.75387, 2.168643, 0.5058824, 0, 1, 1,
0.6792681, -0.3038617, 0.8071718, 0.5137255, 0, 1, 1,
0.6858182, 0.4411004, 1.659407, 0.5176471, 0, 1, 1,
0.6905312, -1.032612, 2.912142, 0.5254902, 0, 1, 1,
0.6910099, 0.6073804, 2.386326, 0.5294118, 0, 1, 1,
0.6949139, -0.4555531, 2.425645, 0.5372549, 0, 1, 1,
0.6951237, 1.054595, 1.069563, 0.5411765, 0, 1, 1,
0.6967884, 0.7425164, 2.463949, 0.5490196, 0, 1, 1,
0.6976137, 0.2749295, 2.006282, 0.5529412, 0, 1, 1,
0.6979244, 0.04773634, 2.376715, 0.5607843, 0, 1, 1,
0.7080802, 0.8044817, 1.195688, 0.5647059, 0, 1, 1,
0.7184277, -0.3919329, 2.785602, 0.572549, 0, 1, 1,
0.7216579, 1.223758, 2.292851, 0.5764706, 0, 1, 1,
0.7229857, -0.2545109, 2.182407, 0.5843138, 0, 1, 1,
0.7310013, 1.112744, -1.680734, 0.5882353, 0, 1, 1,
0.7311793, 1.069785, 1.097756, 0.5960785, 0, 1, 1,
0.7312779, 0.3714401, 0.8133488, 0.6039216, 0, 1, 1,
0.7343103, 0.1534676, 2.009807, 0.6078432, 0, 1, 1,
0.7344753, 0.006445543, 2.666264, 0.6156863, 0, 1, 1,
0.7388587, 0.03771632, 2.061812, 0.6196079, 0, 1, 1,
0.7405585, 0.5951188, 1.669981, 0.627451, 0, 1, 1,
0.7462834, -0.6849699, 0.7073968, 0.6313726, 0, 1, 1,
0.7467242, -0.38478, 2.525741, 0.6392157, 0, 1, 1,
0.749607, 1.623612, 0.6325005, 0.6431373, 0, 1, 1,
0.7553869, 0.2846822, 0.3452906, 0.6509804, 0, 1, 1,
0.7576158, 1.600984, -1.265921, 0.654902, 0, 1, 1,
0.7603446, -0.6577674, 2.537429, 0.6627451, 0, 1, 1,
0.7610568, -0.1947334, 1.355721, 0.6666667, 0, 1, 1,
0.761185, -0.08800092, 2.453033, 0.6745098, 0, 1, 1,
0.7616504, -1.494539, 1.796976, 0.6784314, 0, 1, 1,
0.7667047, 0.5531589, 0.5225509, 0.6862745, 0, 1, 1,
0.7712905, -0.2071337, 2.326241, 0.6901961, 0, 1, 1,
0.7714591, 0.122187, -0.9061808, 0.6980392, 0, 1, 1,
0.7757304, -1.715954, 1.568147, 0.7058824, 0, 1, 1,
0.7767973, -1.089825, 2.293279, 0.7098039, 0, 1, 1,
0.7788653, -0.03663012, 1.016132, 0.7176471, 0, 1, 1,
0.7807525, -0.7007858, 1.606037, 0.7215686, 0, 1, 1,
0.7843236, 1.188911, 0.7248317, 0.7294118, 0, 1, 1,
0.788317, 0.4258035, 0.8429231, 0.7333333, 0, 1, 1,
0.7901136, -1.01935, 1.902579, 0.7411765, 0, 1, 1,
0.7956835, 1.168609, 2.453593, 0.7450981, 0, 1, 1,
0.7987565, -0.0941059, 2.425483, 0.7529412, 0, 1, 1,
0.8013229, 0.6587361, -0.1574907, 0.7568628, 0, 1, 1,
0.8106378, 0.6880034, 1.152939, 0.7647059, 0, 1, 1,
0.8111678, 0.5420253, -0.3814642, 0.7686275, 0, 1, 1,
0.821696, 0.6442359, 0.7637784, 0.7764706, 0, 1, 1,
0.8222502, 0.05666789, 1.620498, 0.7803922, 0, 1, 1,
0.8244018, -1.693204, 1.431971, 0.7882353, 0, 1, 1,
0.842236, 0.007337361, 1.497969, 0.7921569, 0, 1, 1,
0.8452815, 0.472306, 3.059675, 0.8, 0, 1, 1,
0.8464687, 0.2185438, 1.210503, 0.8078431, 0, 1, 1,
0.8506188, 0.09903751, 3.198518, 0.8117647, 0, 1, 1,
0.8636275, -0.1816136, 1.767144, 0.8196079, 0, 1, 1,
0.8718218, 0.5404967, 2.668193, 0.8235294, 0, 1, 1,
0.8788109, 0.05771181, 1.169145, 0.8313726, 0, 1, 1,
0.8800941, -0.9402525, 1.867639, 0.8352941, 0, 1, 1,
0.8811371, 0.1843966, 1.281421, 0.8431373, 0, 1, 1,
0.8832081, -1.342934, 1.660709, 0.8470588, 0, 1, 1,
0.8836551, 0.5026037, 1.17587, 0.854902, 0, 1, 1,
0.8860208, -0.5956382, 1.697938, 0.8588235, 0, 1, 1,
0.8920842, -1.066803, 1.017006, 0.8666667, 0, 1, 1,
0.8924629, -0.7651461, 2.23092, 0.8705882, 0, 1, 1,
0.8989369, 1.138472, 1.977646, 0.8784314, 0, 1, 1,
0.9113845, 0.3391581, 1.071921, 0.8823529, 0, 1, 1,
0.9284409, 0.796639, 0.2999157, 0.8901961, 0, 1, 1,
0.931465, 0.8782189, 0.8436248, 0.8941177, 0, 1, 1,
0.9334589, 0.9354469, 1.631913, 0.9019608, 0, 1, 1,
0.942324, -0.3829055, 5.041, 0.9098039, 0, 1, 1,
0.9489834, 0.779732, 0.4593402, 0.9137255, 0, 1, 1,
0.9547869, 0.1241012, 0.9563874, 0.9215686, 0, 1, 1,
0.9569216, -1.565601, 2.883313, 0.9254902, 0, 1, 1,
0.9572233, 0.9571546, -0.01966783, 0.9333333, 0, 1, 1,
0.965315, -0.731213, 2.730094, 0.9372549, 0, 1, 1,
0.9664739, 1.021807, 0.01801739, 0.945098, 0, 1, 1,
0.9700602, -1.042199, 1.969981, 0.9490196, 0, 1, 1,
0.9722838, 0.7026557, 0.1400465, 0.9568627, 0, 1, 1,
0.9742428, 1.778027, 1.060056, 0.9607843, 0, 1, 1,
0.9762592, 0.1035114, 0.6718838, 0.9686275, 0, 1, 1,
0.9813626, 0.7838833, 1.159082, 0.972549, 0, 1, 1,
0.9893192, 1.708714, 0.1833697, 0.9803922, 0, 1, 1,
0.9895176, -2.44165, 1.636733, 0.9843137, 0, 1, 1,
0.9916393, 0.985157, 1.695512, 0.9921569, 0, 1, 1,
0.9954948, 0.1313296, 1.530742, 0.9960784, 0, 1, 1,
1.005317, 0.250298, 1.873198, 1, 0, 0.9960784, 1,
1.010916, -1.564692, 2.773495, 1, 0, 0.9882353, 1,
1.012773, -0.09063401, 0.3517227, 1, 0, 0.9843137, 1,
1.017087, 0.3022389, 1.0763, 1, 0, 0.9764706, 1,
1.038437, 0.4338291, 1.023092, 1, 0, 0.972549, 1,
1.038695, 0.3604888, 0.2565978, 1, 0, 0.9647059, 1,
1.038942, -0.01022781, 0.7350024, 1, 0, 0.9607843, 1,
1.039139, -0.8170373, 0.03189372, 1, 0, 0.9529412, 1,
1.048782, 0.6649791, -1.490876, 1, 0, 0.9490196, 1,
1.050506, 0.1067086, 2.509792, 1, 0, 0.9411765, 1,
1.061357, 0.1185814, 1.746992, 1, 0, 0.9372549, 1,
1.096556, 0.8854228, 0.05716975, 1, 0, 0.9294118, 1,
1.098041, -0.3157772, 0.6488907, 1, 0, 0.9254902, 1,
1.099847, 1.525663, 0.1840975, 1, 0, 0.9176471, 1,
1.10487, 0.2647412, 2.191231, 1, 0, 0.9137255, 1,
1.104876, 0.8159885, 1.760367, 1, 0, 0.9058824, 1,
1.104984, 0.7151408, 1.473356, 1, 0, 0.9019608, 1,
1.107761, -0.1440306, -0.3151673, 1, 0, 0.8941177, 1,
1.108623, 1.145558, 0.9507664, 1, 0, 0.8862745, 1,
1.109752, 0.8775339, 2.519458, 1, 0, 0.8823529, 1,
1.11121, -1.225992, 2.350142, 1, 0, 0.8745098, 1,
1.113134, 1.061091, 1.152952, 1, 0, 0.8705882, 1,
1.124715, -0.885964, 2.325144, 1, 0, 0.8627451, 1,
1.128557, 0.5814581, 2.290214, 1, 0, 0.8588235, 1,
1.129345, -1.039509, 2.044175, 1, 0, 0.8509804, 1,
1.129705, -0.2647767, 1.177803, 1, 0, 0.8470588, 1,
1.130633, -0.1055348, 3.614663, 1, 0, 0.8392157, 1,
1.145643, -0.5796174, 3.739347, 1, 0, 0.8352941, 1,
1.150141, 0.5323755, 1.027486, 1, 0, 0.827451, 1,
1.152031, 0.5943647, 1.91262, 1, 0, 0.8235294, 1,
1.159803, -1.069462, 2.265046, 1, 0, 0.8156863, 1,
1.160656, -0.07935975, 0.514498, 1, 0, 0.8117647, 1,
1.163945, 0.6124504, 0.4152718, 1, 0, 0.8039216, 1,
1.176688, 1.094249, 2.083303, 1, 0, 0.7960784, 1,
1.178627, -1.280378, 1.431613, 1, 0, 0.7921569, 1,
1.178848, 0.4186032, 2.971777, 1, 0, 0.7843137, 1,
1.178927, 0.992727, -0.1717038, 1, 0, 0.7803922, 1,
1.191875, -1.302726, 1.745398, 1, 0, 0.772549, 1,
1.193042, -1.066692, 2.536981, 1, 0, 0.7686275, 1,
1.195516, 1.269175, -0.07380675, 1, 0, 0.7607843, 1,
1.195663, 1.332311, -0.02687296, 1, 0, 0.7568628, 1,
1.202941, -0.3138084, 1.600437, 1, 0, 0.7490196, 1,
1.206703, -0.2088472, 0.740612, 1, 0, 0.7450981, 1,
1.206982, -2.003772, 2.745852, 1, 0, 0.7372549, 1,
1.209578, 0.03302656, 1.8084, 1, 0, 0.7333333, 1,
1.210278, 0.8508272, -0.01658782, 1, 0, 0.7254902, 1,
1.214376, -0.5406049, 1.281444, 1, 0, 0.7215686, 1,
1.216598, -0.6937388, 1.565881, 1, 0, 0.7137255, 1,
1.21717, 0.1529467, 1.673314, 1, 0, 0.7098039, 1,
1.221392, 1.473632, 1.617148, 1, 0, 0.7019608, 1,
1.222296, 0.8773175, -1.462841, 1, 0, 0.6941177, 1,
1.227126, 1.853732, 1.23793, 1, 0, 0.6901961, 1,
1.232026, -1.165071, 3.36539, 1, 0, 0.682353, 1,
1.234592, 0.5293762, -0.03581492, 1, 0, 0.6784314, 1,
1.246977, 1.104338, 0.7369823, 1, 0, 0.6705883, 1,
1.249735, -0.5090847, 1.445345, 1, 0, 0.6666667, 1,
1.250703, -1.229865, 2.846867, 1, 0, 0.6588235, 1,
1.256926, -0.7467775, 4.153274, 1, 0, 0.654902, 1,
1.257526, -1.318443, 1.494054, 1, 0, 0.6470588, 1,
1.271067, -0.7288141, 4.17337, 1, 0, 0.6431373, 1,
1.28519, -1.527481, 4.123557, 1, 0, 0.6352941, 1,
1.292995, -2.643178, 1.355175, 1, 0, 0.6313726, 1,
1.302666, -0.3724168, 2.233222, 1, 0, 0.6235294, 1,
1.320397, -0.3782715, 1.569866, 1, 0, 0.6196079, 1,
1.344955, -0.3961421, 2.429229, 1, 0, 0.6117647, 1,
1.345121, -1.981671, 3.456312, 1, 0, 0.6078432, 1,
1.356536, 1.88882, 0.3131956, 1, 0, 0.6, 1,
1.36173, -0.4812512, 1.484215, 1, 0, 0.5921569, 1,
1.361761, -0.6182466, 1.146009, 1, 0, 0.5882353, 1,
1.368046, -1.277217, 2.547716, 1, 0, 0.5803922, 1,
1.368459, 0.6654644, 2.192308, 1, 0, 0.5764706, 1,
1.369425, -0.8261319, 1.789581, 1, 0, 0.5686275, 1,
1.375495, 1.103993, 2.512158, 1, 0, 0.5647059, 1,
1.384564, 0.6492766, 1.669414, 1, 0, 0.5568628, 1,
1.388265, 0.07123839, 1.664065, 1, 0, 0.5529412, 1,
1.393815, 0.2308389, -0.02800419, 1, 0, 0.5450981, 1,
1.39581, -0.7154648, 1.290754, 1, 0, 0.5411765, 1,
1.400618, -0.7729678, 3.980167, 1, 0, 0.5333334, 1,
1.414957, 0.1885196, 3.215834, 1, 0, 0.5294118, 1,
1.416192, 0.1324595, 1.784876, 1, 0, 0.5215687, 1,
1.420315, -0.3011262, 1.057938, 1, 0, 0.5176471, 1,
1.428438, -0.3513167, 2.091879, 1, 0, 0.509804, 1,
1.434862, -0.1406607, 2.207049, 1, 0, 0.5058824, 1,
1.437554, -1.614847, 3.909227, 1, 0, 0.4980392, 1,
1.439306, -1.216003, 2.968479, 1, 0, 0.4901961, 1,
1.44623, 2.07776, 0.297202, 1, 0, 0.4862745, 1,
1.455848, 0.3220568, 0.1101806, 1, 0, 0.4784314, 1,
1.470433, 0.4263897, 0.4213689, 1, 0, 0.4745098, 1,
1.473925, 0.107434, 1.285771, 1, 0, 0.4666667, 1,
1.473939, 0.4023292, 1.971054, 1, 0, 0.4627451, 1,
1.474117, -0.3219704, -0.02471299, 1, 0, 0.454902, 1,
1.47452, -0.8511475, 2.245592, 1, 0, 0.4509804, 1,
1.510053, -1.434002, 2.642848, 1, 0, 0.4431373, 1,
1.535431, 1.435128, 1.59781, 1, 0, 0.4392157, 1,
1.544618, 0.007063761, 2.297992, 1, 0, 0.4313726, 1,
1.550757, -0.9339624, 2.377399, 1, 0, 0.427451, 1,
1.554225, 0.6211142, 1.69283, 1, 0, 0.4196078, 1,
1.558904, -0.001716597, 2.012829, 1, 0, 0.4156863, 1,
1.567574, -0.5499217, 3.113271, 1, 0, 0.4078431, 1,
1.568519, 0.3942007, 0.5518243, 1, 0, 0.4039216, 1,
1.569298, 0.457185, 0.8846722, 1, 0, 0.3960784, 1,
1.571075, -0.7435793, 2.667459, 1, 0, 0.3882353, 1,
1.572938, -0.4460573, 3.907667, 1, 0, 0.3843137, 1,
1.575931, 0.7495838, 3.006661, 1, 0, 0.3764706, 1,
1.580707, -0.06260549, 2.816077, 1, 0, 0.372549, 1,
1.582538, -0.2285304, 1.897686, 1, 0, 0.3647059, 1,
1.596867, -0.8465657, 1.706794, 1, 0, 0.3607843, 1,
1.601328, -0.3678911, 2.230619, 1, 0, 0.3529412, 1,
1.634242, 0.3717627, 2.658084, 1, 0, 0.3490196, 1,
1.637045, -0.5796117, 0.9699498, 1, 0, 0.3411765, 1,
1.638081, -1.11485, 1.432869, 1, 0, 0.3372549, 1,
1.63905, 0.7765133, -0.281551, 1, 0, 0.3294118, 1,
1.648685, -0.2975838, 2.299476, 1, 0, 0.3254902, 1,
1.65264, 0.4580778, 0.9942513, 1, 0, 0.3176471, 1,
1.660939, 0.6061925, 1.675042, 1, 0, 0.3137255, 1,
1.66262, 2.604958, 1.088095, 1, 0, 0.3058824, 1,
1.685031, -0.1340105, 0.1426052, 1, 0, 0.2980392, 1,
1.685988, 0.01475034, 1.203491, 1, 0, 0.2941177, 1,
1.696202, -0.2668292, 2.613273, 1, 0, 0.2862745, 1,
1.700955, -1.52646, 4.750577, 1, 0, 0.282353, 1,
1.714372, -0.533648, 1.207038, 1, 0, 0.2745098, 1,
1.720882, 0.4305017, 0.362568, 1, 0, 0.2705882, 1,
1.72675, -1.726048, 1.578029, 1, 0, 0.2627451, 1,
1.730246, 0.06516664, -1.002674, 1, 0, 0.2588235, 1,
1.752526, 0.4396999, 2.394249, 1, 0, 0.2509804, 1,
1.763918, -0.07836407, 2.595687, 1, 0, 0.2470588, 1,
1.778294, -0.3812656, 1.085556, 1, 0, 0.2392157, 1,
1.779686, -0.3507976, 1.035956, 1, 0, 0.2352941, 1,
1.811975, 0.1932237, 2.143513, 1, 0, 0.227451, 1,
1.817414, 0.4246878, 1.277322, 1, 0, 0.2235294, 1,
1.819459, -0.5912368, 2.647889, 1, 0, 0.2156863, 1,
1.826634, 0.2474175, 2.224959, 1, 0, 0.2117647, 1,
1.843168, 0.2557856, 1.738203, 1, 0, 0.2039216, 1,
1.859758, 0.6167899, 1.264615, 1, 0, 0.1960784, 1,
1.885485, -0.3355086, 3.708618, 1, 0, 0.1921569, 1,
1.890431, 0.09562741, 3.013946, 1, 0, 0.1843137, 1,
1.907733, 0.09525566, 1.582075, 1, 0, 0.1803922, 1,
1.908357, -0.3882239, 1.36876, 1, 0, 0.172549, 1,
1.927227, -1.205169, 2.129831, 1, 0, 0.1686275, 1,
1.93802, -1.219386, 1.810648, 1, 0, 0.1607843, 1,
1.957275, -0.811255, 4.223251, 1, 0, 0.1568628, 1,
1.96231, -0.8699116, 2.569979, 1, 0, 0.1490196, 1,
1.982496, -1.298837, 0.5519726, 1, 0, 0.145098, 1,
1.983281, -0.7777746, 2.437714, 1, 0, 0.1372549, 1,
2.045853, -1.226311, 0.7268584, 1, 0, 0.1333333, 1,
2.059071, 0.5162042, -0.406224, 1, 0, 0.1254902, 1,
2.074173, -1.838545, 3.443628, 1, 0, 0.1215686, 1,
2.083221, 0.5419861, 0.02015678, 1, 0, 0.1137255, 1,
2.114264, 1.264664, 1.032315, 1, 0, 0.1098039, 1,
2.135957, -0.8816132, 2.130458, 1, 0, 0.1019608, 1,
2.17523, -1.11179, 1.054652, 1, 0, 0.09411765, 1,
2.217525, 0.9411211, 1.381278, 1, 0, 0.09019608, 1,
2.250823, -0.4070481, 1.026772, 1, 0, 0.08235294, 1,
2.274007, 0.02281768, 1.892926, 1, 0, 0.07843138, 1,
2.284683, 0.7490612, 1.380357, 1, 0, 0.07058824, 1,
2.3254, 1.282267, 1.098547, 1, 0, 0.06666667, 1,
2.342595, -1.420294, 1.627079, 1, 0, 0.05882353, 1,
2.364013, -0.7471847, 2.82269, 1, 0, 0.05490196, 1,
2.405429, -0.05720344, 1.406583, 1, 0, 0.04705882, 1,
2.43642, -1.215199, 0.8634966, 1, 0, 0.04313726, 1,
2.450857, -0.8240321, 2.967106, 1, 0, 0.03529412, 1,
2.459569, 0.2727279, 1.909047, 1, 0, 0.03137255, 1,
2.500826, -0.1993843, 0.8678209, 1, 0, 0.02352941, 1,
2.727177, -1.245237, 1.610026, 1, 0, 0.01960784, 1,
2.775595, -1.527885, 1.366621, 1, 0, 0.01176471, 1,
2.792461, 0.6647533, 2.57534, 1, 0, 0.007843138, 1
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
0.003363252, -4.051554, -7.210066, 0, -0.5, 0.5, 0.5,
0.003363252, -4.051554, -7.210066, 1, -0.5, 0.5, 0.5,
0.003363252, -4.051554, -7.210066, 1, 1.5, 0.5, 0.5,
0.003363252, -4.051554, -7.210066, 0, 1.5, 0.5, 0.5
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
-3.731239, 0.3443997, -7.210066, 0, -0.5, 0.5, 0.5,
-3.731239, 0.3443997, -7.210066, 1, -0.5, 0.5, 0.5,
-3.731239, 0.3443997, -7.210066, 1, 1.5, 0.5, 0.5,
-3.731239, 0.3443997, -7.210066, 0, 1.5, 0.5, 0.5
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
-3.731239, -4.051554, -0.0628798, 0, -0.5, 0.5, 0.5,
-3.731239, -4.051554, -0.0628798, 1, -0.5, 0.5, 0.5,
-3.731239, -4.051554, -0.0628798, 1, 1.5, 0.5, 0.5,
-3.731239, -4.051554, -0.0628798, 0, 1.5, 0.5, 0.5
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
-2, -3.037103, -5.560715,
2, -3.037103, -5.560715,
-2, -3.037103, -5.560715,
-2, -3.206178, -5.835607,
-1, -3.037103, -5.560715,
-1, -3.206178, -5.835607,
0, -3.037103, -5.560715,
0, -3.206178, -5.835607,
1, -3.037103, -5.560715,
1, -3.206178, -5.835607,
2, -3.037103, -5.560715,
2, -3.206178, -5.835607
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
-2, -3.544328, -6.385391, 0, -0.5, 0.5, 0.5,
-2, -3.544328, -6.385391, 1, -0.5, 0.5, 0.5,
-2, -3.544328, -6.385391, 1, 1.5, 0.5, 0.5,
-2, -3.544328, -6.385391, 0, 1.5, 0.5, 0.5,
-1, -3.544328, -6.385391, 0, -0.5, 0.5, 0.5,
-1, -3.544328, -6.385391, 1, -0.5, 0.5, 0.5,
-1, -3.544328, -6.385391, 1, 1.5, 0.5, 0.5,
-1, -3.544328, -6.385391, 0, 1.5, 0.5, 0.5,
0, -3.544328, -6.385391, 0, -0.5, 0.5, 0.5,
0, -3.544328, -6.385391, 1, -0.5, 0.5, 0.5,
0, -3.544328, -6.385391, 1, 1.5, 0.5, 0.5,
0, -3.544328, -6.385391, 0, 1.5, 0.5, 0.5,
1, -3.544328, -6.385391, 0, -0.5, 0.5, 0.5,
1, -3.544328, -6.385391, 1, -0.5, 0.5, 0.5,
1, -3.544328, -6.385391, 1, 1.5, 0.5, 0.5,
1, -3.544328, -6.385391, 0, 1.5, 0.5, 0.5,
2, -3.544328, -6.385391, 0, -0.5, 0.5, 0.5,
2, -3.544328, -6.385391, 1, -0.5, 0.5, 0.5,
2, -3.544328, -6.385391, 1, 1.5, 0.5, 0.5,
2, -3.544328, -6.385391, 0, 1.5, 0.5, 0.5
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
-2.869408, -2, -5.560715,
-2.869408, 3, -5.560715,
-2.869408, -2, -5.560715,
-3.013046, -2, -5.835607,
-2.869408, -1, -5.560715,
-3.013046, -1, -5.835607,
-2.869408, 0, -5.560715,
-3.013046, 0, -5.835607,
-2.869408, 1, -5.560715,
-3.013046, 1, -5.835607,
-2.869408, 2, -5.560715,
-3.013046, 2, -5.835607,
-2.869408, 3, -5.560715,
-3.013046, 3, -5.835607
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
-3.300323, -2, -6.385391, 0, -0.5, 0.5, 0.5,
-3.300323, -2, -6.385391, 1, -0.5, 0.5, 0.5,
-3.300323, -2, -6.385391, 1, 1.5, 0.5, 0.5,
-3.300323, -2, -6.385391, 0, 1.5, 0.5, 0.5,
-3.300323, -1, -6.385391, 0, -0.5, 0.5, 0.5,
-3.300323, -1, -6.385391, 1, -0.5, 0.5, 0.5,
-3.300323, -1, -6.385391, 1, 1.5, 0.5, 0.5,
-3.300323, -1, -6.385391, 0, 1.5, 0.5, 0.5,
-3.300323, 0, -6.385391, 0, -0.5, 0.5, 0.5,
-3.300323, 0, -6.385391, 1, -0.5, 0.5, 0.5,
-3.300323, 0, -6.385391, 1, 1.5, 0.5, 0.5,
-3.300323, 0, -6.385391, 0, 1.5, 0.5, 0.5,
-3.300323, 1, -6.385391, 0, -0.5, 0.5, 0.5,
-3.300323, 1, -6.385391, 1, -0.5, 0.5, 0.5,
-3.300323, 1, -6.385391, 1, 1.5, 0.5, 0.5,
-3.300323, 1, -6.385391, 0, 1.5, 0.5, 0.5,
-3.300323, 2, -6.385391, 0, -0.5, 0.5, 0.5,
-3.300323, 2, -6.385391, 1, -0.5, 0.5, 0.5,
-3.300323, 2, -6.385391, 1, 1.5, 0.5, 0.5,
-3.300323, 2, -6.385391, 0, 1.5, 0.5, 0.5,
-3.300323, 3, -6.385391, 0, -0.5, 0.5, 0.5,
-3.300323, 3, -6.385391, 1, -0.5, 0.5, 0.5,
-3.300323, 3, -6.385391, 1, 1.5, 0.5, 0.5,
-3.300323, 3, -6.385391, 0, 1.5, 0.5, 0.5
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
-2.869408, -3.037103, -4,
-2.869408, -3.037103, 4,
-2.869408, -3.037103, -4,
-3.013046, -3.206178, -4,
-2.869408, -3.037103, -2,
-3.013046, -3.206178, -2,
-2.869408, -3.037103, 0,
-3.013046, -3.206178, 0,
-2.869408, -3.037103, 2,
-3.013046, -3.206178, 2,
-2.869408, -3.037103, 4,
-3.013046, -3.206178, 4
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
-3.300323, -3.544328, -4, 0, -0.5, 0.5, 0.5,
-3.300323, -3.544328, -4, 1, -0.5, 0.5, 0.5,
-3.300323, -3.544328, -4, 1, 1.5, 0.5, 0.5,
-3.300323, -3.544328, -4, 0, 1.5, 0.5, 0.5,
-3.300323, -3.544328, -2, 0, -0.5, 0.5, 0.5,
-3.300323, -3.544328, -2, 1, -0.5, 0.5, 0.5,
-3.300323, -3.544328, -2, 1, 1.5, 0.5, 0.5,
-3.300323, -3.544328, -2, 0, 1.5, 0.5, 0.5,
-3.300323, -3.544328, 0, 0, -0.5, 0.5, 0.5,
-3.300323, -3.544328, 0, 1, -0.5, 0.5, 0.5,
-3.300323, -3.544328, 0, 1, 1.5, 0.5, 0.5,
-3.300323, -3.544328, 0, 0, 1.5, 0.5, 0.5,
-3.300323, -3.544328, 2, 0, -0.5, 0.5, 0.5,
-3.300323, -3.544328, 2, 1, -0.5, 0.5, 0.5,
-3.300323, -3.544328, 2, 1, 1.5, 0.5, 0.5,
-3.300323, -3.544328, 2, 0, 1.5, 0.5, 0.5,
-3.300323, -3.544328, 4, 0, -0.5, 0.5, 0.5,
-3.300323, -3.544328, 4, 1, -0.5, 0.5, 0.5,
-3.300323, -3.544328, 4, 1, 1.5, 0.5, 0.5,
-3.300323, -3.544328, 4, 0, 1.5, 0.5, 0.5
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
-2.869408, -3.037103, -5.560715,
-2.869408, 3.725902, -5.560715,
-2.869408, -3.037103, 5.434956,
-2.869408, 3.725902, 5.434956,
-2.869408, -3.037103, -5.560715,
-2.869408, -3.037103, 5.434956,
-2.869408, 3.725902, -5.560715,
-2.869408, 3.725902, 5.434956,
-2.869408, -3.037103, -5.560715,
2.876134, -3.037103, -5.560715,
-2.869408, -3.037103, 5.434956,
2.876134, -3.037103, 5.434956,
-2.869408, 3.725902, -5.560715,
2.876134, 3.725902, -5.560715,
-2.869408, 3.725902, 5.434956,
2.876134, 3.725902, 5.434956,
2.876134, -3.037103, -5.560715,
2.876134, 3.725902, -5.560715,
2.876134, -3.037103, 5.434956,
2.876134, 3.725902, 5.434956,
2.876134, -3.037103, -5.560715,
2.876134, -3.037103, 5.434956,
2.876134, 3.725902, -5.560715,
2.876134, 3.725902, 5.434956
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
var radius = 7.545096;
var distance = 33.56898;
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
mvMatrix.translate( -0.003363252, -0.3443997, 0.0628798 );
mvMatrix.scale( 1.419867, 1.206255, 0.7419198 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.56898);
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
gl.drawArrays(gl.LINES, 0, 12);
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
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
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
logran<-read.table("logran.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-logran$V2
```

```
## Error in eval(expr, envir, enclos): object 'logran' not found
```

```r
y<-logran$V3
```

```
## Error in eval(expr, envir, enclos): object 'logran' not found
```

```r
z<-logran$V4
```

```
## Error in eval(expr, envir, enclos): object 'logran' not found
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
-2.785735, 0.4819774, -1.389972, 0, 0, 1, 1, 1,
-2.737268, 0.093522, -2.815199, 1, 0, 0, 1, 1,
-2.609252, 0.07374429, -1.98241, 1, 0, 0, 1, 1,
-2.598881, -0.06917185, -2.93478, 1, 0, 0, 1, 1,
-2.354033, -1.514563, -3.400748, 1, 0, 0, 1, 1,
-2.30604, 0.9689355, -0.9705213, 1, 0, 0, 1, 1,
-2.293695, 1.889917, 0.5028768, 0, 0, 0, 1, 1,
-2.256323, -0.9897807, -2.591449, 0, 0, 0, 1, 1,
-2.230888, 0.6339979, -3.56037, 0, 0, 0, 1, 1,
-2.218718, -0.9050379, -3.637057, 0, 0, 0, 1, 1,
-2.209767, -1.458821, -0.9861937, 0, 0, 0, 1, 1,
-2.208992, 0.2405424, -1.21524, 0, 0, 0, 1, 1,
-2.171998, -1.443503, -1.841378, 0, 0, 0, 1, 1,
-2.146918, 1.238202, -0.729436, 1, 1, 1, 1, 1,
-2.115847, 0.3465339, -0.08239055, 1, 1, 1, 1, 1,
-2.113096, 0.1766548, -1.535504, 1, 1, 1, 1, 1,
-2.100597, -1.11211, -1.718105, 1, 1, 1, 1, 1,
-2.091005, -0.5983546, -2.073418, 1, 1, 1, 1, 1,
-2.05274, -0.5546041, -1.50403, 1, 1, 1, 1, 1,
-2.022788, 1.980692, -0.9319093, 1, 1, 1, 1, 1,
-2.015066, 1.617474, -1.134814, 1, 1, 1, 1, 1,
-2.014025, -1.042548, -2.295561, 1, 1, 1, 1, 1,
-2.0031, -0.7916474, -1.006655, 1, 1, 1, 1, 1,
-1.989736, 0.769144, 0.3368023, 1, 1, 1, 1, 1,
-1.962592, -0.93266, -3.088583, 1, 1, 1, 1, 1,
-1.957695, 0.8784744, -1.207329, 1, 1, 1, 1, 1,
-1.951029, -1.069294, -2.913832, 1, 1, 1, 1, 1,
-1.940354, -0.0946267, -1.159025, 1, 1, 1, 1, 1,
-1.938109, 0.09459612, -2.224665, 0, 0, 1, 1, 1,
-1.933419, -2.028729, -2.139123, 1, 0, 0, 1, 1,
-1.928105, -0.5006739, -2.399025, 1, 0, 0, 1, 1,
-1.875077, -0.8122389, -2.624652, 1, 0, 0, 1, 1,
-1.863782, -0.2849173, -2.417532, 1, 0, 0, 1, 1,
-1.856752, -0.3982692, -2.776261, 1, 0, 0, 1, 1,
-1.833759, 0.01905295, -3.087969, 0, 0, 0, 1, 1,
-1.827299, 1.005395, -0.02644143, 0, 0, 0, 1, 1,
-1.800478, -1.500611, 0.1920605, 0, 0, 0, 1, 1,
-1.772214, -2.248223, -3.247851, 0, 0, 0, 1, 1,
-1.759996, -0.9742359, -2.728928, 0, 0, 0, 1, 1,
-1.758994, 1.527166, -0.8821238, 0, 0, 0, 1, 1,
-1.754278, 0.4242516, -1.806675, 0, 0, 0, 1, 1,
-1.750584, 0.831448, 1.223745, 1, 1, 1, 1, 1,
-1.747591, 0.8528898, -1.339414, 1, 1, 1, 1, 1,
-1.700201, -0.0265112, -3.274112, 1, 1, 1, 1, 1,
-1.675143, 0.7131251, 0.09466545, 1, 1, 1, 1, 1,
-1.673901, 1.797078, -1.150802, 1, 1, 1, 1, 1,
-1.671712, -0.959562, -2.158715, 1, 1, 1, 1, 1,
-1.667627, 0.5167905, -1.135917, 1, 1, 1, 1, 1,
-1.660309, 0.5952187, -0.5530285, 1, 1, 1, 1, 1,
-1.644781, 0.1849603, -0.6517071, 1, 1, 1, 1, 1,
-1.640845, -0.2356072, -2.50938, 1, 1, 1, 1, 1,
-1.633358, 0.2321338, -1.764363, 1, 1, 1, 1, 1,
-1.629065, 0.7838256, -1.373294, 1, 1, 1, 1, 1,
-1.62272, -0.5355355, -2.125808, 1, 1, 1, 1, 1,
-1.622452, -1.493566, -0.8312688, 1, 1, 1, 1, 1,
-1.61056, -0.130597, -1.398199, 1, 1, 1, 1, 1,
-1.60845, 1.328562, 0.9653647, 0, 0, 1, 1, 1,
-1.60515, 1.412941, -0.4702039, 1, 0, 0, 1, 1,
-1.591448, -1.138601, -2.726388, 1, 0, 0, 1, 1,
-1.582284, 0.5282691, -0.0192532, 1, 0, 0, 1, 1,
-1.567408, 1.303198, 0.1614038, 1, 0, 0, 1, 1,
-1.559703, 1.479756, 0.1022169, 1, 0, 0, 1, 1,
-1.546924, -0.6759098, -1.558146, 0, 0, 0, 1, 1,
-1.543893, 0.01472378, -1.293135, 0, 0, 0, 1, 1,
-1.53609, -2.281906, -4.626596, 0, 0, 0, 1, 1,
-1.527519, 1.082388, -2.542278, 0, 0, 0, 1, 1,
-1.518722, 1.596313, 0.6809086, 0, 0, 0, 1, 1,
-1.499951, -0.4211171, -1.374169, 0, 0, 0, 1, 1,
-1.495529, 0.9175768, -2.38993, 0, 0, 0, 1, 1,
-1.485419, 0.6477826, -1.267945, 1, 1, 1, 1, 1,
-1.481396, 0.6238316, -1.280995, 1, 1, 1, 1, 1,
-1.471263, 0.07807759, -2.955752, 1, 1, 1, 1, 1,
-1.462606, -0.3371436, -1.454746, 1, 1, 1, 1, 1,
-1.461117, 0.3956153, -1.083074, 1, 1, 1, 1, 1,
-1.459739, 0.3940804, -1.651894, 1, 1, 1, 1, 1,
-1.451152, 1.761826, -1.146817, 1, 1, 1, 1, 1,
-1.450904, -1.245952, -2.769469, 1, 1, 1, 1, 1,
-1.447218, 0.3349311, -0.5957804, 1, 1, 1, 1, 1,
-1.442712, -1.389566, -0.6369792, 1, 1, 1, 1, 1,
-1.43892, -1.159582, -3.534273, 1, 1, 1, 1, 1,
-1.432998, -1.526023, -2.156368, 1, 1, 1, 1, 1,
-1.43118, 1.182376, 0.04715603, 1, 1, 1, 1, 1,
-1.43053, 0.4850366, -0.7425418, 1, 1, 1, 1, 1,
-1.420792, -0.840807, -2.95654, 1, 1, 1, 1, 1,
-1.413955, -0.5922282, -2.620278, 0, 0, 1, 1, 1,
-1.406409, 2.023859, -0.5399942, 1, 0, 0, 1, 1,
-1.375706, 1.602443, 0.3398496, 1, 0, 0, 1, 1,
-1.375446, -0.2636896, -1.912286, 1, 0, 0, 1, 1,
-1.371439, 1.266903, -0.8335332, 1, 0, 0, 1, 1,
-1.360558, -0.6876606, -3.31838, 1, 0, 0, 1, 1,
-1.360187, 0.6539096, 1.255832, 0, 0, 0, 1, 1,
-1.353755, -0.1909629, -1.531576, 0, 0, 0, 1, 1,
-1.336284, -0.1691008, -1.445846, 0, 0, 0, 1, 1,
-1.33382, 1.576444, 0.04652033, 0, 0, 0, 1, 1,
-1.333527, -0.4175191, -3.719033, 0, 0, 0, 1, 1,
-1.326344, 0.3637799, -1.108645, 0, 0, 0, 1, 1,
-1.324278, 0.9321438, -2.526314, 0, 0, 0, 1, 1,
-1.3183, -1.607927, 0.1793046, 1, 1, 1, 1, 1,
-1.317488, 0.1239237, -1.578914, 1, 1, 1, 1, 1,
-1.313442, -0.7118707, 0.0546789, 1, 1, 1, 1, 1,
-1.312592, 0.2371321, -2.540786, 1, 1, 1, 1, 1,
-1.311007, 0.2213497, -1.340355, 1, 1, 1, 1, 1,
-1.310101, 0.679135, -2.056283, 1, 1, 1, 1, 1,
-1.30832, -0.8262895, -1.789873, 1, 1, 1, 1, 1,
-1.308173, -1.560289, -1.429316, 1, 1, 1, 1, 1,
-1.29526, -1.038994, -0.3602827, 1, 1, 1, 1, 1,
-1.291936, -0.1712696, 0.347554, 1, 1, 1, 1, 1,
-1.290741, 0.08670859, -1.298525, 1, 1, 1, 1, 1,
-1.285973, -0.2965304, -1.800737, 1, 1, 1, 1, 1,
-1.27696, 0.4711632, -2.138484, 1, 1, 1, 1, 1,
-1.27269, -1.024425, -3.281629, 1, 1, 1, 1, 1,
-1.272463, 0.292523, 0.2147869, 1, 1, 1, 1, 1,
-1.272293, -0.9088128, -2.737191, 0, 0, 1, 1, 1,
-1.241917, -1.60575, -2.34264, 1, 0, 0, 1, 1,
-1.239333, 1.363854, 0.1380829, 1, 0, 0, 1, 1,
-1.238393, 0.3919893, -0.7095352, 1, 0, 0, 1, 1,
-1.237105, -2.048047, -2.005648, 1, 0, 0, 1, 1,
-1.233879, -0.3022707, 0.09830037, 1, 0, 0, 1, 1,
-1.2327, 0.7566134, -1.758582, 0, 0, 0, 1, 1,
-1.229348, -0.326974, -1.267396, 0, 0, 0, 1, 1,
-1.225294, -0.9154737, -0.9929183, 0, 0, 0, 1, 1,
-1.209743, -0.9964803, -2.615998, 0, 0, 0, 1, 1,
-1.208706, -0.07316996, -1.962384, 0, 0, 0, 1, 1,
-1.206779, 0.138666, 0.2445703, 0, 0, 0, 1, 1,
-1.191311, 1.065136, -1.147643, 0, 0, 0, 1, 1,
-1.182701, 1.044944, 0.9156433, 1, 1, 1, 1, 1,
-1.180118, 0.8315121, -0.4261301, 1, 1, 1, 1, 1,
-1.177469, -0.2057099, -3.390891, 1, 1, 1, 1, 1,
-1.171704, 0.1961181, -1.587578, 1, 1, 1, 1, 1,
-1.164741, 0.8500733, -1.38718, 1, 1, 1, 1, 1,
-1.163335, 1.425638, -1.149471, 1, 1, 1, 1, 1,
-1.154785, -0.1216458, -1.519015, 1, 1, 1, 1, 1,
-1.150054, -2.211705, -5.400584, 1, 1, 1, 1, 1,
-1.147455, 0.07194211, -0.05700743, 1, 1, 1, 1, 1,
-1.131527, 1.191142, -0.3751278, 1, 1, 1, 1, 1,
-1.127042, -1.311578, -4.791045, 1, 1, 1, 1, 1,
-1.123938, 0.3126712, -0.2663477, 1, 1, 1, 1, 1,
-1.119314, 0.8429134, -0.4336876, 1, 1, 1, 1, 1,
-1.118928, -1.340273, -1.5937, 1, 1, 1, 1, 1,
-1.115036, 1.493349, -1.90442, 1, 1, 1, 1, 1,
-1.112552, 0.1705181, -0.7683327, 0, 0, 1, 1, 1,
-1.103491, -0.169468, -3.003051, 1, 0, 0, 1, 1,
-1.082825, -0.06002606, -0.7443138, 1, 0, 0, 1, 1,
-1.07948, 1.216955, -0.7070839, 1, 0, 0, 1, 1,
-1.079316, 0.5606108, -2.572814, 1, 0, 0, 1, 1,
-1.075446, 1.19268, -1.592275, 1, 0, 0, 1, 1,
-1.072332, -0.931548, -1.195361, 0, 0, 0, 1, 1,
-1.070502, -0.6449593, -1.369529, 0, 0, 0, 1, 1,
-1.069104, 0.1217556, -1.006801, 0, 0, 0, 1, 1,
-1.064382, 0.2498022, -3.587635, 0, 0, 0, 1, 1,
-1.060374, -1.824259, -2.643719, 0, 0, 0, 1, 1,
-1.058737, 0.3645373, -1.908839, 0, 0, 0, 1, 1,
-1.046746, -1.693248, -0.4590447, 0, 0, 0, 1, 1,
-1.040514, 0.236999, -1.651981, 1, 1, 1, 1, 1,
-1.025854, -0.6712493, -1.403935, 1, 1, 1, 1, 1,
-1.014089, -0.08927645, -3.389716, 1, 1, 1, 1, 1,
-1.009294, -0.7249438, -2.820915, 1, 1, 1, 1, 1,
-1.005471, -0.747089, -0.5389751, 1, 1, 1, 1, 1,
-0.9988712, -0.68865, -0.5871214, 1, 1, 1, 1, 1,
-0.9950494, 0.6627167, -2.123368, 1, 1, 1, 1, 1,
-0.9867705, -0.09213901, -2.225604, 1, 1, 1, 1, 1,
-0.9810355, -0.3221082, -0.4523023, 1, 1, 1, 1, 1,
-0.9804699, 0.09138316, -2.698076, 1, 1, 1, 1, 1,
-0.9802017, -1.183553, -1.855649, 1, 1, 1, 1, 1,
-0.9738667, -0.1799729, -2.993131, 1, 1, 1, 1, 1,
-0.9671703, -0.2564508, -3.018564, 1, 1, 1, 1, 1,
-0.9670401, -0.6594526, -3.465159, 1, 1, 1, 1, 1,
-0.9640443, 0.9171123, 0.5387952, 1, 1, 1, 1, 1,
-0.9572929, 0.07929891, -1.657892, 0, 0, 1, 1, 1,
-0.9559952, -1.387491, -0.35006, 1, 0, 0, 1, 1,
-0.9541376, -0.6211653, -1.444367, 1, 0, 0, 1, 1,
-0.9533019, 1.563417, -0.4777901, 1, 0, 0, 1, 1,
-0.9510488, 0.5003419, -0.3314863, 1, 0, 0, 1, 1,
-0.9447703, -0.1821384, -2.876699, 1, 0, 0, 1, 1,
-0.9439351, -0.03802958, -0.8977953, 0, 0, 0, 1, 1,
-0.9360698, -1.641969, -2.005277, 0, 0, 0, 1, 1,
-0.9327813, 0.1320421, -1.356233, 0, 0, 0, 1, 1,
-0.9314457, 0.3334189, -1.739969, 0, 0, 0, 1, 1,
-0.9281208, 0.2384642, -1.485832, 0, 0, 0, 1, 1,
-0.9247519, 0.2599832, -2.517057, 0, 0, 0, 1, 1,
-0.9247143, -0.08622887, -0.634542, 0, 0, 0, 1, 1,
-0.9179071, -0.7424923, -3.424521, 1, 1, 1, 1, 1,
-0.9083897, -0.1561841, -3.111604, 1, 1, 1, 1, 1,
-0.9074501, 0.2163843, -0.8286965, 1, 1, 1, 1, 1,
-0.9038553, -0.1916705, 0.1962052, 1, 1, 1, 1, 1,
-0.8981948, 0.5718274, -1.01461, 1, 1, 1, 1, 1,
-0.8958908, -0.4029731, -1.496757, 1, 1, 1, 1, 1,
-0.8887352, 0.5159219, 0.1916664, 1, 1, 1, 1, 1,
-0.8887006, 0.4052401, -0.9307628, 1, 1, 1, 1, 1,
-0.8878567, -0.3009721, -2.962096, 1, 1, 1, 1, 1,
-0.8824372, -0.3637182, -1.308315, 1, 1, 1, 1, 1,
-0.8791431, 0.01174406, -1.326617, 1, 1, 1, 1, 1,
-0.8786376, -0.7872768, -2.887262, 1, 1, 1, 1, 1,
-0.8779451, -0.7572048, -3.198945, 1, 1, 1, 1, 1,
-0.8756971, 0.8102358, -0.4826276, 1, 1, 1, 1, 1,
-0.8702171, 1.491495, -1.024575, 1, 1, 1, 1, 1,
-0.8699137, -0.1807473, -1.669222, 0, 0, 1, 1, 1,
-0.866982, 0.9109556, -1.459208, 1, 0, 0, 1, 1,
-0.8650864, -0.3408126, -3.103904, 1, 0, 0, 1, 1,
-0.8628061, -1.550019, -1.533812, 1, 0, 0, 1, 1,
-0.8600852, -0.2977888, -3.372955, 1, 0, 0, 1, 1,
-0.8543605, -1.052059, -1.754687, 1, 0, 0, 1, 1,
-0.8504304, 0.6957998, -2.131341, 0, 0, 0, 1, 1,
-0.8494273, 0.6916758, -0.4165787, 0, 0, 0, 1, 1,
-0.8472833, 0.5307666, -1.495554, 0, 0, 0, 1, 1,
-0.8451044, -0.8623687, -3.854793, 0, 0, 0, 1, 1,
-0.8445717, -0.4046823, -2.742919, 0, 0, 0, 1, 1,
-0.8406373, 0.3224949, -0.08370418, 0, 0, 0, 1, 1,
-0.8394238, -0.372303, -1.811884, 0, 0, 0, 1, 1,
-0.8307416, -0.03162054, -0.3218587, 1, 1, 1, 1, 1,
-0.829762, 2.231365, 0.5536267, 1, 1, 1, 1, 1,
-0.829056, 1.995591, -2.272265, 1, 1, 1, 1, 1,
-0.8216334, -0.6413946, -2.697692, 1, 1, 1, 1, 1,
-0.8177118, 0.007635653, -3.16512, 1, 1, 1, 1, 1,
-0.8132599, -0.03305849, -0.3919725, 1, 1, 1, 1, 1,
-0.8085186, 1.124091, -0.7334535, 1, 1, 1, 1, 1,
-0.8018808, -0.4129691, -1.905436, 1, 1, 1, 1, 1,
-0.799986, -1.949407, -1.255495, 1, 1, 1, 1, 1,
-0.7970716, 1.64897, -1.127024, 1, 1, 1, 1, 1,
-0.7970489, 0.3793274, -1.149751, 1, 1, 1, 1, 1,
-0.7964454, -0.4231499, -3.468771, 1, 1, 1, 1, 1,
-0.7866582, 0.7904643, -0.8426348, 1, 1, 1, 1, 1,
-0.7764977, 0.6826787, 0.0007520457, 1, 1, 1, 1, 1,
-0.7744054, 0.5152903, -2.142787, 1, 1, 1, 1, 1,
-0.7736465, -0.6727678, -1.530445, 0, 0, 1, 1, 1,
-0.768923, -1.453499, -2.766222, 1, 0, 0, 1, 1,
-0.764569, -0.5172637, -3.096934, 1, 0, 0, 1, 1,
-0.7612909, 0.3024188, -0.5209123, 1, 0, 0, 1, 1,
-0.760832, 1.160016, -1.281872, 1, 0, 0, 1, 1,
-0.7590263, -0.8067194, -3.785357, 1, 0, 0, 1, 1,
-0.7577547, 1.145158, -1.273383, 0, 0, 0, 1, 1,
-0.7574175, 1.060375, -0.9569061, 0, 0, 0, 1, 1,
-0.7550599, -0.4686796, -1.402339, 0, 0, 0, 1, 1,
-0.7481996, 0.4353201, -1.795221, 0, 0, 0, 1, 1,
-0.7440349, 1.89327, 0.6625053, 0, 0, 0, 1, 1,
-0.7420968, 0.5711518, -2.502086, 0, 0, 0, 1, 1,
-0.7381077, 1.253751, -0.9720538, 0, 0, 0, 1, 1,
-0.7354779, 0.08866408, -2.513718, 1, 1, 1, 1, 1,
-0.7329968, 2.438662, 0.8427079, 1, 1, 1, 1, 1,
-0.7327322, -0.4412527, -3.456734, 1, 1, 1, 1, 1,
-0.7319528, 0.8981469, 0.05270288, 1, 1, 1, 1, 1,
-0.7294624, -1.622458, -2.941976, 1, 1, 1, 1, 1,
-0.7272503, -0.08414979, -0.8199258, 1, 1, 1, 1, 1,
-0.7268221, -0.6513445, -3.390755, 1, 1, 1, 1, 1,
-0.7210202, -1.070158, -1.47379, 1, 1, 1, 1, 1,
-0.7206312, -0.8802402, -2.991121, 1, 1, 1, 1, 1,
-0.7181091, 0.06196404, -1.579308, 1, 1, 1, 1, 1,
-0.7123345, -0.1233395, -0.8673338, 1, 1, 1, 1, 1,
-0.7121454, 0.3116493, -0.7451094, 1, 1, 1, 1, 1,
-0.7115541, 0.4442117, -0.5924854, 1, 1, 1, 1, 1,
-0.6923382, 1.189619, -0.7828425, 1, 1, 1, 1, 1,
-0.6922578, -0.5454334, -0.1769976, 1, 1, 1, 1, 1,
-0.6907222, -0.6048715, -2.399431, 0, 0, 1, 1, 1,
-0.6870887, 0.004875179, -1.669206, 1, 0, 0, 1, 1,
-0.6866615, 0.6697025, 0.3763497, 1, 0, 0, 1, 1,
-0.6859509, 0.765351, 0.09496997, 1, 0, 0, 1, 1,
-0.6848773, -0.01959568, -3.155449, 1, 0, 0, 1, 1,
-0.6832189, -0.2737322, -2.68841, 1, 0, 0, 1, 1,
-0.6823827, -1.379558, -3.234928, 0, 0, 0, 1, 1,
-0.6784794, 0.9353337, -2.745375, 0, 0, 0, 1, 1,
-0.6763402, -0.5393727, -0.7753397, 0, 0, 0, 1, 1,
-0.6651832, 1.428008, 0.4214199, 0, 0, 0, 1, 1,
-0.6641737, -1.660618, -2.890469, 0, 0, 0, 1, 1,
-0.6626412, -0.08299078, -2.082473, 0, 0, 0, 1, 1,
-0.6570687, -2.770512, -3.543309, 0, 0, 0, 1, 1,
-0.6549143, 0.312419, -2.933884, 1, 1, 1, 1, 1,
-0.6539541, -1.845443, -2.142004, 1, 1, 1, 1, 1,
-0.6507642, 1.722926, -0.8187013, 1, 1, 1, 1, 1,
-0.6492054, 0.2324003, -1.465268, 1, 1, 1, 1, 1,
-0.6473464, -1.018891, -0.7294348, 1, 1, 1, 1, 1,
-0.6385983, -0.7778255, -2.883043, 1, 1, 1, 1, 1,
-0.6367992, -1.206565, -1.52189, 1, 1, 1, 1, 1,
-0.6351757, -0.110672, -0.5738164, 1, 1, 1, 1, 1,
-0.6274277, 0.334211, -2.137335, 1, 1, 1, 1, 1,
-0.6265095, 1.213299, -1.019911, 1, 1, 1, 1, 1,
-0.6242751, -1.403763, -2.673909, 1, 1, 1, 1, 1,
-0.6241505, -0.4889089, -2.003438, 1, 1, 1, 1, 1,
-0.6222169, 0.07599596, -1.596542, 1, 1, 1, 1, 1,
-0.6208851, -2.157672, -1.184665, 1, 1, 1, 1, 1,
-0.6146747, 0.1739426, 0.5725728, 1, 1, 1, 1, 1,
-0.6107884, -0.5487638, -1.816761, 0, 0, 1, 1, 1,
-0.5980769, 0.646396, 0.3874777, 1, 0, 0, 1, 1,
-0.5926854, -0.6203334, -3.401997, 1, 0, 0, 1, 1,
-0.582963, 0.1346804, -1.743201, 1, 0, 0, 1, 1,
-0.5825174, -2.015253, -3.21926, 1, 0, 0, 1, 1,
-0.5813518, -1.397138, -2.113718, 1, 0, 0, 1, 1,
-0.5771646, 0.6311631, -0.9820587, 0, 0, 0, 1, 1,
-0.5760464, -0.7043004, -1.025813, 0, 0, 0, 1, 1,
-0.5746918, -0.3248809, -3.312757, 0, 0, 0, 1, 1,
-0.5680498, 0.2305635, -0.838334, 0, 0, 0, 1, 1,
-0.5668896, -1.42385, -0.6488891, 0, 0, 0, 1, 1,
-0.5654269, -1.688951, -3.594306, 0, 0, 0, 1, 1,
-0.5650004, -1.84918, -4.887248, 0, 0, 0, 1, 1,
-0.5621443, -1.27119, -2.045759, 1, 1, 1, 1, 1,
-0.5582411, -1.226983, -2.873368, 1, 1, 1, 1, 1,
-0.557625, -2.938612, -1.976716, 1, 1, 1, 1, 1,
-0.5571437, 0.07528432, -1.680811, 1, 1, 1, 1, 1,
-0.5559046, 0.1869623, -0.2784203, 1, 1, 1, 1, 1,
-0.5530479, -0.2170945, -1.718586, 1, 1, 1, 1, 1,
-0.5487953, 1.543283, -3.045278, 1, 1, 1, 1, 1,
-0.5444445, 0.2879178, -0.1312981, 1, 1, 1, 1, 1,
-0.536903, 0.9579853, -1.015202, 1, 1, 1, 1, 1,
-0.5345857, -1.441579, -3.622848, 1, 1, 1, 1, 1,
-0.5313526, -0.2290626, -4.090445, 1, 1, 1, 1, 1,
-0.527693, -0.7817516, -1.586274, 1, 1, 1, 1, 1,
-0.5275016, -1.016122, -2.59005, 1, 1, 1, 1, 1,
-0.5272222, -0.4477017, -3.273614, 1, 1, 1, 1, 1,
-0.5262367, 1.243115, -0.9726515, 1, 1, 1, 1, 1,
-0.5260004, -1.200021, -2.513272, 0, 0, 1, 1, 1,
-0.5178479, -0.1108188, -1.986287, 1, 0, 0, 1, 1,
-0.5138036, -1.416, -2.645091, 1, 0, 0, 1, 1,
-0.5133002, -1.126303, -1.306912, 1, 0, 0, 1, 1,
-0.5116019, 1.302322, -1.045621, 1, 0, 0, 1, 1,
-0.5090416, -0.1968239, -1.714557, 1, 0, 0, 1, 1,
-0.5075696, -0.9393445, -3.478519, 0, 0, 0, 1, 1,
-0.5067044, 2.453282, -0.4710692, 0, 0, 0, 1, 1,
-0.5023572, -1.611846, -1.860065, 0, 0, 0, 1, 1,
-0.5014558, -0.5896634, -1.467749, 0, 0, 0, 1, 1,
-0.4859031, 1.19718, 1.408198, 0, 0, 0, 1, 1,
-0.4852486, -1.708555, -2.456372, 0, 0, 0, 1, 1,
-0.484154, 0.1405369, -1.750618, 0, 0, 0, 1, 1,
-0.4839057, 0.05051772, -2.133457, 1, 1, 1, 1, 1,
-0.481911, -0.3813338, -1.475829, 1, 1, 1, 1, 1,
-0.4808691, -0.3059918, -1.741022, 1, 1, 1, 1, 1,
-0.4798976, -1.146783, -2.681617, 1, 1, 1, 1, 1,
-0.4792458, -2.134091, -2.102181, 1, 1, 1, 1, 1,
-0.4774375, -0.1453277, -0.9819627, 1, 1, 1, 1, 1,
-0.4760969, 0.3636576, -1.276444, 1, 1, 1, 1, 1,
-0.4726627, 1.491782, -0.8816311, 1, 1, 1, 1, 1,
-0.4699385, 0.4973989, -1.578207, 1, 1, 1, 1, 1,
-0.4625084, -0.9045836, -2.638906, 1, 1, 1, 1, 1,
-0.4624248, -0.4578301, -1.660571, 1, 1, 1, 1, 1,
-0.4455849, -0.5707114, -3.674006, 1, 1, 1, 1, 1,
-0.4444385, 1.153984, 0.1686599, 1, 1, 1, 1, 1,
-0.4364795, 0.165314, 0.286056, 1, 1, 1, 1, 1,
-0.4329398, -1.246186, -3.755227, 1, 1, 1, 1, 1,
-0.4325987, -1.129959, -3.000572, 0, 0, 1, 1, 1,
-0.4320678, 1.260178, -0.1178153, 1, 0, 0, 1, 1,
-0.4281103, -1.298492, -2.894497, 1, 0, 0, 1, 1,
-0.4261617, 0.2197385, -1.129479, 1, 0, 0, 1, 1,
-0.42424, 0.830663, -0.6456621, 1, 0, 0, 1, 1,
-0.4229911, 0.2425344, -1.777735, 1, 0, 0, 1, 1,
-0.4201851, -1.357473, -2.832353, 0, 0, 0, 1, 1,
-0.416941, 0.3310887, -2.644111, 0, 0, 0, 1, 1,
-0.4157705, -0.2228752, -2.014889, 0, 0, 0, 1, 1,
-0.4130805, 0.6678823, 1.288011, 0, 0, 0, 1, 1,
-0.4129818, -0.6524934, -2.300158, 0, 0, 0, 1, 1,
-0.4071673, 0.2352985, -1.538325, 0, 0, 0, 1, 1,
-0.40351, -0.8642676, -3.835565, 0, 0, 0, 1, 1,
-0.4022802, 0.9383369, -1.339504, 1, 1, 1, 1, 1,
-0.4021991, -0.5628207, -1.216518, 1, 1, 1, 1, 1,
-0.3958176, 1.808843, -0.4113833, 1, 1, 1, 1, 1,
-0.3912475, 0.8020499, 1.397323, 1, 1, 1, 1, 1,
-0.3881863, -1.079099, -2.806714, 1, 1, 1, 1, 1,
-0.386652, 0.8499929, 0.1613822, 1, 1, 1, 1, 1,
-0.3862864, -0.4048342, -3.531011, 1, 1, 1, 1, 1,
-0.3857007, -0.3202118, -0.2138164, 1, 1, 1, 1, 1,
-0.379862, -0.1520938, -0.926245, 1, 1, 1, 1, 1,
-0.3768802, 1.116497, -0.6389779, 1, 1, 1, 1, 1,
-0.3735254, -1.072321, -3.551669, 1, 1, 1, 1, 1,
-0.3707531, 0.1627189, -1.441839, 1, 1, 1, 1, 1,
-0.3622176, 1.12895, -1.840809, 1, 1, 1, 1, 1,
-0.3620163, -0.4399006, -1.452463, 1, 1, 1, 1, 1,
-0.3609867, 0.9830384, -0.8237154, 1, 1, 1, 1, 1,
-0.3582858, 0.1349823, -1.755775, 0, 0, 1, 1, 1,
-0.3565373, -0.3765559, -1.16936, 1, 0, 0, 1, 1,
-0.3564118, 0.9926816, 1.219524, 1, 0, 0, 1, 1,
-0.3561136, 1.665782, -0.2365823, 1, 0, 0, 1, 1,
-0.35577, -0.3864188, -1.226089, 1, 0, 0, 1, 1,
-0.3539802, 0.5725394, -0.03818361, 1, 0, 0, 1, 1,
-0.3530946, 1.224097, 0.2120427, 0, 0, 0, 1, 1,
-0.3451824, 0.08162701, -0.9198238, 0, 0, 0, 1, 1,
-0.3444824, -0.6959403, -1.687686, 0, 0, 0, 1, 1,
-0.3402782, -1.057539, -3.692028, 0, 0, 0, 1, 1,
-0.3399602, 0.678945, -0.2785983, 0, 0, 0, 1, 1,
-0.335942, -0.04609682, -2.526932, 0, 0, 0, 1, 1,
-0.332904, -1.042776, -4.127119, 0, 0, 0, 1, 1,
-0.3259018, 1.085657, -1.166534, 1, 1, 1, 1, 1,
-0.3244444, -0.5526943, -4.067038, 1, 1, 1, 1, 1,
-0.3241087, -1.73185, -4.340894, 1, 1, 1, 1, 1,
-0.3221692, -0.7461867, -3.805475, 1, 1, 1, 1, 1,
-0.3204208, -1.71329, -3.912212, 1, 1, 1, 1, 1,
-0.3202924, 0.7908617, -1.34099, 1, 1, 1, 1, 1,
-0.3191781, 0.8007294, -1.328762, 1, 1, 1, 1, 1,
-0.318729, -0.8739806, -1.907901, 1, 1, 1, 1, 1,
-0.3177972, -0.3189978, -1.815267, 1, 1, 1, 1, 1,
-0.2982843, -0.7939637, -3.84284, 1, 1, 1, 1, 1,
-0.2969467, -0.3799343, -2.975401, 1, 1, 1, 1, 1,
-0.2947181, -0.1661453, -3.68835, 1, 1, 1, 1, 1,
-0.2914962, -1.759413, -2.946568, 1, 1, 1, 1, 1,
-0.2911073, -0.06129459, -0.7697671, 1, 1, 1, 1, 1,
-0.2882836, -0.9921154, -2.602491, 1, 1, 1, 1, 1,
-0.2867905, -0.69047, -1.399986, 0, 0, 1, 1, 1,
-0.2831021, 0.7746781, 1.430015, 1, 0, 0, 1, 1,
-0.2826984, 1.131434, 1.880643, 1, 0, 0, 1, 1,
-0.280672, -0.284985, -0.8902031, 1, 0, 0, 1, 1,
-0.2791784, 0.2858825, -2.145764, 1, 0, 0, 1, 1,
-0.2774984, 0.03107731, -1.128781, 1, 0, 0, 1, 1,
-0.2729752, -0.8679801, -3.087313, 0, 0, 0, 1, 1,
-0.2715611, 1.464296, -1.652712, 0, 0, 0, 1, 1,
-0.2675602, -0.09728834, -1.84476, 0, 0, 0, 1, 1,
-0.2633067, -0.2410547, -2.423323, 0, 0, 0, 1, 1,
-0.2511341, 0.4805664, -2.308052, 0, 0, 0, 1, 1,
-0.2371258, -0.575142, -3.886339, 0, 0, 0, 1, 1,
-0.2359728, -1.599876, -3.211736, 0, 0, 0, 1, 1,
-0.2305619, 0.2609383, -0.05964218, 1, 1, 1, 1, 1,
-0.2273327, 1.561386, -1.662607, 1, 1, 1, 1, 1,
-0.2250978, 0.2482777, -2.674383, 1, 1, 1, 1, 1,
-0.2242814, 0.1237748, 0.6413609, 1, 1, 1, 1, 1,
-0.2222828, 1.065832, -2.502336, 1, 1, 1, 1, 1,
-0.2208462, 1.160667, -0.9568611, 1, 1, 1, 1, 1,
-0.2200496, 0.7451504, 0.1504131, 1, 1, 1, 1, 1,
-0.2160041, 0.08872153, 0.1997535, 1, 1, 1, 1, 1,
-0.2154157, 1.680098, 0.5248588, 1, 1, 1, 1, 1,
-0.2144914, -0.7846669, -3.793324, 1, 1, 1, 1, 1,
-0.2139006, 3.627412, -2.266476, 1, 1, 1, 1, 1,
-0.2110655, -1.284011, -4.037394, 1, 1, 1, 1, 1,
-0.2105507, 0.05395512, -1.660323, 1, 1, 1, 1, 1,
-0.2085275, 0.3739275, -1.336854, 1, 1, 1, 1, 1,
-0.2076388, 0.4193715, 0.7673566, 1, 1, 1, 1, 1,
-0.2061457, -0.9894344, -3.969161, 0, 0, 1, 1, 1,
-0.2055684, 0.1654808, -0.5879095, 1, 0, 0, 1, 1,
-0.2033139, 1.431844, -1.100476, 1, 0, 0, 1, 1,
-0.1996983, 0.3894767, -0.539888, 1, 0, 0, 1, 1,
-0.1987159, -1.456111, -3.483756, 1, 0, 0, 1, 1,
-0.1961025, 0.2574187, -0.8581355, 1, 0, 0, 1, 1,
-0.1945498, -0.2866706, -0.9217722, 0, 0, 0, 1, 1,
-0.1939269, 0.8998209, -1.270565, 0, 0, 0, 1, 1,
-0.1925872, 0.1925659, -2.087932, 0, 0, 0, 1, 1,
-0.191778, -0.5234538, -2.248958, 0, 0, 0, 1, 1,
-0.1883572, -0.6398149, -2.561047, 0, 0, 0, 1, 1,
-0.183223, 1.500386, -0.2623534, 0, 0, 0, 1, 1,
-0.1829792, 1.26645, -0.005054989, 0, 0, 0, 1, 1,
-0.174451, 0.2362887, 0.5668324, 1, 1, 1, 1, 1,
-0.1623474, -1.571282, -3.792306, 1, 1, 1, 1, 1,
-0.1610629, 0.2037585, 0.5400081, 1, 1, 1, 1, 1,
-0.1607275, -0.349961, -3.490066, 1, 1, 1, 1, 1,
-0.1596585, -2.563227, -0.7221283, 1, 1, 1, 1, 1,
-0.158061, 0.1099734, -1.990344, 1, 1, 1, 1, 1,
-0.1562139, -0.02201525, -0.509113, 1, 1, 1, 1, 1,
-0.1547796, 1.57402, 1.266272, 1, 1, 1, 1, 1,
-0.1547511, 0.74742, 1.50045, 1, 1, 1, 1, 1,
-0.1526932, -0.4164406, -2.600278, 1, 1, 1, 1, 1,
-0.1515749, 1.065088, 0.8194436, 1, 1, 1, 1, 1,
-0.1474367, -0.6732666, -1.448569, 1, 1, 1, 1, 1,
-0.1462184, -1.683601, -3.39454, 1, 1, 1, 1, 1,
-0.1461619, -0.0178857, -0.698083, 1, 1, 1, 1, 1,
-0.146001, -0.9303865, -4.282306, 1, 1, 1, 1, 1,
-0.145814, -0.4893272, -2.37015, 0, 0, 1, 1, 1,
-0.1443448, -0.4874129, -1.841491, 1, 0, 0, 1, 1,
-0.1427405, -0.03105025, -2.844223, 1, 0, 0, 1, 1,
-0.1408682, -0.5071921, -2.008003, 1, 0, 0, 1, 1,
-0.1407326, -0.7950566, -3.015766, 1, 0, 0, 1, 1,
-0.1383113, 1.072849, 0.7700552, 1, 0, 0, 1, 1,
-0.1376078, -0.6614324, -4.122513, 0, 0, 0, 1, 1,
-0.1364901, -1.527776, -4.489439, 0, 0, 0, 1, 1,
-0.1351371, 0.02746808, 0.2558102, 0, 0, 0, 1, 1,
-0.1333679, 0.8076214, 1.056003, 0, 0, 0, 1, 1,
-0.1318096, 0.01534076, -2.498867, 0, 0, 0, 1, 1,
-0.1287168, 0.4934038, -0.5145361, 0, 0, 0, 1, 1,
-0.1281937, -0.7238588, -2.531471, 0, 0, 0, 1, 1,
-0.1185693, 0.2519287, -0.7679175, 1, 1, 1, 1, 1,
-0.113295, 0.8169352, -0.938851, 1, 1, 1, 1, 1,
-0.1132788, 0.7138246, -1.781408, 1, 1, 1, 1, 1,
-0.113178, -0.3128038, -1.606712, 1, 1, 1, 1, 1,
-0.1117937, 0.9919951, 0.2743293, 1, 1, 1, 1, 1,
-0.1072079, 0.2074675, 0.8381714, 1, 1, 1, 1, 1,
-0.1068147, -2.151604, -1.726304, 1, 1, 1, 1, 1,
-0.104988, -1.623034, -3.867505, 1, 1, 1, 1, 1,
-0.1028944, -0.5308274, -3.843443, 1, 1, 1, 1, 1,
-0.1028314, 0.203541, -1.724316, 1, 1, 1, 1, 1,
-0.09695636, -0.4358777, -4.147817, 1, 1, 1, 1, 1,
-0.09600572, -1.511569, -2.741755, 1, 1, 1, 1, 1,
-0.09466556, -0.3702552, -1.108558, 1, 1, 1, 1, 1,
-0.08875643, -0.7454529, -2.716399, 1, 1, 1, 1, 1,
-0.08575457, -0.370906, -2.959104, 1, 1, 1, 1, 1,
-0.08492041, -1.548204, -4.681943, 0, 0, 1, 1, 1,
-0.08421026, -0.5543112, -3.364125, 1, 0, 0, 1, 1,
-0.08179601, -0.08846794, -0.9373932, 1, 0, 0, 1, 1,
-0.0799183, 0.3116065, -0.5514567, 1, 0, 0, 1, 1,
-0.07896538, 0.4836054, -0.2827692, 1, 0, 0, 1, 1,
-0.07816116, -1.134167, -2.967511, 1, 0, 0, 1, 1,
-0.07384741, 0.2453979, -2.30298, 0, 0, 0, 1, 1,
-0.07171538, -0.3820008, -3.077568, 0, 0, 0, 1, 1,
-0.06983963, -2.029474, -2.272387, 0, 0, 0, 1, 1,
-0.06349144, 0.6699229, 0.9358823, 0, 0, 0, 1, 1,
-0.0554909, -0.1015769, -1.623316, 0, 0, 0, 1, 1,
-0.05497754, 0.06805786, -1.510638, 0, 0, 0, 1, 1,
-0.05154314, 0.9455303, 0.3164853, 0, 0, 0, 1, 1,
-0.05040548, 0.1689898, 0.1264066, 1, 1, 1, 1, 1,
-0.04873866, 0.9547427, 0.8027485, 1, 1, 1, 1, 1,
-0.04839024, 0.8459737, -0.6816448, 1, 1, 1, 1, 1,
-0.04704086, -0.8900573, -3.567327, 1, 1, 1, 1, 1,
-0.04329344, -0.4698314, -3.635784, 1, 1, 1, 1, 1,
-0.04160321, 0.5778791, 1.234299, 1, 1, 1, 1, 1,
-0.04081434, -0.4624837, -2.88267, 1, 1, 1, 1, 1,
-0.04012462, 0.344848, 1.280578, 1, 1, 1, 1, 1,
-0.03767303, 0.6178308, 0.3092169, 1, 1, 1, 1, 1,
-0.03761121, -1.858856, -3.146386, 1, 1, 1, 1, 1,
-0.03517394, 1.591821, 0.9402274, 1, 1, 1, 1, 1,
-0.03048571, 2.090263, -0.6068205, 1, 1, 1, 1, 1,
-0.0267596, 0.802539, 1.261067, 1, 1, 1, 1, 1,
-0.02433127, 0.9554489, -0.3756667, 1, 1, 1, 1, 1,
-0.01968706, -0.04293354, -0.7629721, 1, 1, 1, 1, 1,
-0.01839508, 0.1535454, -1.043074, 0, 0, 1, 1, 1,
-0.01703708, -0.4397635, -2.301441, 1, 0, 0, 1, 1,
-0.01476089, 1.168096, -0.4256207, 1, 0, 0, 1, 1,
-0.01369121, 1.358276, 0.8774259, 1, 0, 0, 1, 1,
-0.01262478, 0.4892726, -0.2766261, 1, 0, 0, 1, 1,
-0.01231476, 0.4526739, -0.3827926, 1, 0, 0, 1, 1,
-0.007743798, -1.482851, -4.887831, 0, 0, 0, 1, 1,
-0.007589751, -1.697977, -4.279465, 0, 0, 0, 1, 1,
-0.007350998, 0.5319371, 2.032829, 0, 0, 0, 1, 1,
-0.001314076, -0.3708536, -3.529251, 0, 0, 0, 1, 1,
0.00763091, -0.6641976, 2.073995, 0, 0, 0, 1, 1,
0.008959313, -0.4926887, 4.729457, 0, 0, 0, 1, 1,
0.01673048, 0.92572, 1.104028, 0, 0, 0, 1, 1,
0.01712319, 0.6636462, 0.02607397, 1, 1, 1, 1, 1,
0.0218944, -0.4130824, 2.86914, 1, 1, 1, 1, 1,
0.02723753, -0.194062, 1.551205, 1, 1, 1, 1, 1,
0.03054162, -0.5601735, 3.307205, 1, 1, 1, 1, 1,
0.03072836, -1.064539, 4.681201, 1, 1, 1, 1, 1,
0.03371479, 0.8785495, -0.4162733, 1, 1, 1, 1, 1,
0.03375679, -0.6757436, 4.208145, 1, 1, 1, 1, 1,
0.03396186, 0.8979427, 0.7022438, 1, 1, 1, 1, 1,
0.03425442, 0.2957239, 0.9589843, 1, 1, 1, 1, 1,
0.04136631, 0.9260086, 0.2851325, 1, 1, 1, 1, 1,
0.04308387, 1.508782, 0.9982845, 1, 1, 1, 1, 1,
0.04426967, 1.255712, 1.14932, 1, 1, 1, 1, 1,
0.04694648, 1.037917, 0.1633011, 1, 1, 1, 1, 1,
0.04863605, 0.3654632, 0.5966022, 1, 1, 1, 1, 1,
0.05454851, -2.603961, 2.6575, 1, 1, 1, 1, 1,
0.05901792, 1.070886, 0.1167284, 0, 0, 1, 1, 1,
0.06062028, -1.783808, 3.213647, 1, 0, 0, 1, 1,
0.0608911, -0.8491511, 3.257091, 1, 0, 0, 1, 1,
0.06577016, 1.463463, -0.4920193, 1, 0, 0, 1, 1,
0.06818266, -0.1845347, 2.800145, 1, 0, 0, 1, 1,
0.06951121, -0.5371327, 3.917747, 1, 0, 0, 1, 1,
0.07064274, 1.330962, -2.138241, 0, 0, 0, 1, 1,
0.07472765, 0.3842908, 1.555519, 0, 0, 0, 1, 1,
0.07539506, 1.497748, -0.2981969, 0, 0, 0, 1, 1,
0.07702448, 1.01223, -0.03112757, 0, 0, 0, 1, 1,
0.07799228, 1.183406, -0.1609385, 0, 0, 0, 1, 1,
0.08119822, 0.812027, 2.333838, 0, 0, 0, 1, 1,
0.08476142, -0.5991107, 4.282451, 0, 0, 0, 1, 1,
0.08966729, 1.549948, -2.055164, 1, 1, 1, 1, 1,
0.0970989, -1.037404, 1.797707, 1, 1, 1, 1, 1,
0.09781364, 1.020729, -0.6044822, 1, 1, 1, 1, 1,
0.1000946, 0.5038628, -1.37306, 1, 1, 1, 1, 1,
0.1045714, -0.6730819, 3.088286, 1, 1, 1, 1, 1,
0.1046742, -1.953376, 1.723382, 1, 1, 1, 1, 1,
0.1053736, 1.821704, 2.73885, 1, 1, 1, 1, 1,
0.1087336, -1.257743, 5.274825, 1, 1, 1, 1, 1,
0.1169091, 0.8221755, 0.4730259, 1, 1, 1, 1, 1,
0.1205863, 0.403495, 1.085519, 1, 1, 1, 1, 1,
0.1255966, 1.14648, -2.035126, 1, 1, 1, 1, 1,
0.1257042, -1.060581, 3.527345, 1, 1, 1, 1, 1,
0.1257937, -0.6114045, 4.510673, 1, 1, 1, 1, 1,
0.130583, 0.6616054, 2.118737, 1, 1, 1, 1, 1,
0.132122, -1.342215, 3.894197, 1, 1, 1, 1, 1,
0.1323157, -0.3679871, 2.589237, 0, 0, 1, 1, 1,
0.1362411, 0.7331224, 0.9027312, 1, 0, 0, 1, 1,
0.1379542, 1.004089, -0.9847335, 1, 0, 0, 1, 1,
0.1395494, 0.02463508, 0.04933232, 1, 0, 0, 1, 1,
0.1567694, -0.8658624, 1.334076, 1, 0, 0, 1, 1,
0.1570479, -0.07259177, 1.78454, 1, 0, 0, 1, 1,
0.1570844, 0.5226434, 0.1360983, 0, 0, 0, 1, 1,
0.1659696, -0.3070243, 2.320036, 0, 0, 0, 1, 1,
0.1753306, -0.5234924, 3.605576, 0, 0, 0, 1, 1,
0.1753419, -0.1212687, 2.862172, 0, 0, 0, 1, 1,
0.1794126, 1.198948, -0.5227502, 0, 0, 0, 1, 1,
0.1819864, -0.1238279, 0.5081177, 0, 0, 0, 1, 1,
0.1842382, 0.5361024, -1.30241, 0, 0, 0, 1, 1,
0.1856036, -0.1494198, 2.727954, 1, 1, 1, 1, 1,
0.1896202, -0.1319821, 2.936596, 1, 1, 1, 1, 1,
0.1932874, 0.2725801, -0.118551, 1, 1, 1, 1, 1,
0.195996, 0.4829896, 1.559389, 1, 1, 1, 1, 1,
0.198869, -0.08748396, 2.364051, 1, 1, 1, 1, 1,
0.1988975, -0.9312999, 2.924444, 1, 1, 1, 1, 1,
0.2039912, -0.8331053, 0.9155009, 1, 1, 1, 1, 1,
0.2046222, 0.8473538, 0.1026957, 1, 1, 1, 1, 1,
0.212638, 1.042608, -0.8161236, 1, 1, 1, 1, 1,
0.2128869, 0.177938, 2.314386, 1, 1, 1, 1, 1,
0.2148627, -0.09670867, 3.972136, 1, 1, 1, 1, 1,
0.2162395, 0.4869364, 0.3543676, 1, 1, 1, 1, 1,
0.221658, -1.690442, 2.769423, 1, 1, 1, 1, 1,
0.2276571, 0.006604416, 2.298633, 1, 1, 1, 1, 1,
0.2277437, -1.600137, 3.936571, 1, 1, 1, 1, 1,
0.2298205, 0.2535649, 1.780347, 0, 0, 1, 1, 1,
0.2336643, 0.956673, 1.263615, 1, 0, 0, 1, 1,
0.2355053, -0.8058944, 3.021688, 1, 0, 0, 1, 1,
0.2358497, 1.021117, 1.183573, 1, 0, 0, 1, 1,
0.2416769, 0.01309385, 0.833406, 1, 0, 0, 1, 1,
0.2430407, 0.7725478, 1.07969, 1, 0, 0, 1, 1,
0.2436188, 0.3807606, 1.534219, 0, 0, 0, 1, 1,
0.244377, 0.2164409, 1.544802, 0, 0, 0, 1, 1,
0.2451906, -1.198081, 1.499243, 0, 0, 0, 1, 1,
0.2461026, 0.08513996, -0.205814, 0, 0, 0, 1, 1,
0.2485513, -0.3345972, 0.9172961, 0, 0, 0, 1, 1,
0.2508939, 0.2496543, -0.163212, 0, 0, 0, 1, 1,
0.2513283, 0.2535927, -0.4482724, 0, 0, 0, 1, 1,
0.2520653, 0.2822269, 1.739416, 1, 1, 1, 1, 1,
0.2595231, 1.649783, 0.2496041, 1, 1, 1, 1, 1,
0.259524, -0.8567508, 3.756509, 1, 1, 1, 1, 1,
0.2621554, -0.6105286, 3.947832, 1, 1, 1, 1, 1,
0.2630014, -1.420323, 3.998654, 1, 1, 1, 1, 1,
0.2696283, -0.4938405, 2.650069, 1, 1, 1, 1, 1,
0.2802102, 0.7030753, -0.08836912, 1, 1, 1, 1, 1,
0.2822663, -0.6429985, 1.995903, 1, 1, 1, 1, 1,
0.2827698, -1.067929, 4.071751, 1, 1, 1, 1, 1,
0.2829325, -0.2878032, 0.980038, 1, 1, 1, 1, 1,
0.2861592, 0.2979055, 2.073543, 1, 1, 1, 1, 1,
0.2872793, -2.313647, 4.191034, 1, 1, 1, 1, 1,
0.2947663, 0.1961891, 0.1609063, 1, 1, 1, 1, 1,
0.2960856, 0.4244741, -0.2447098, 1, 1, 1, 1, 1,
0.3016236, -0.6986433, 2.082661, 1, 1, 1, 1, 1,
0.3020807, -1.231922, 2.807085, 0, 0, 1, 1, 1,
0.3109302, -0.325269, 2.849937, 1, 0, 0, 1, 1,
0.3138043, 1.464441, -1.036664, 1, 0, 0, 1, 1,
0.3149306, 1.583128, -0.08724512, 1, 0, 0, 1, 1,
0.3218943, 1.63733, 2.067568, 1, 0, 0, 1, 1,
0.322109, 0.2430211, 1.052955, 1, 0, 0, 1, 1,
0.3264716, -0.9186612, 3.947611, 0, 0, 0, 1, 1,
0.3266062, -0.188584, 3.404613, 0, 0, 0, 1, 1,
0.3281251, -0.8489329, 3.510844, 0, 0, 0, 1, 1,
0.340752, -0.05240821, 2.198657, 0, 0, 0, 1, 1,
0.3413209, 0.2483921, 1.58954, 0, 0, 0, 1, 1,
0.3435062, 1.100649, 0.06196761, 0, 0, 0, 1, 1,
0.3443539, 0.3978886, 1.814485, 0, 0, 0, 1, 1,
0.3444914, 0.1690224, 1.776462, 1, 1, 1, 1, 1,
0.3461069, -0.6350836, 3.305853, 1, 1, 1, 1, 1,
0.347311, -0.5721726, 3.914703, 1, 1, 1, 1, 1,
0.3475132, -0.1428587, 2.752727, 1, 1, 1, 1, 1,
0.3528823, -0.7350907, 3.049903, 1, 1, 1, 1, 1,
0.353197, -2.264363, 2.431265, 1, 1, 1, 1, 1,
0.3536751, 0.5647789, -0.5041873, 1, 1, 1, 1, 1,
0.354651, 0.1659528, 1.887214, 1, 1, 1, 1, 1,
0.3559149, -1.871986, 2.577044, 1, 1, 1, 1, 1,
0.3568982, -1.316599, 3.624079, 1, 1, 1, 1, 1,
0.3589367, 0.1357516, 2.848969, 1, 1, 1, 1, 1,
0.3614272, -1.122913, 1.646554, 1, 1, 1, 1, 1,
0.3633484, -1.332198, 2.044364, 1, 1, 1, 1, 1,
0.364832, 1.808423, 0.2752116, 1, 1, 1, 1, 1,
0.3668286, 0.2265961, 2.162182, 1, 1, 1, 1, 1,
0.3707149, -1.133949, 4.01546, 0, 0, 1, 1, 1,
0.3716365, 0.9605626, 0.8961716, 1, 0, 0, 1, 1,
0.372841, -0.9509264, 1.323518, 1, 0, 0, 1, 1,
0.3729413, 0.121147, 3.270195, 1, 0, 0, 1, 1,
0.3749078, 1.770744, -0.2997751, 1, 0, 0, 1, 1,
0.3776208, 0.7392958, 0.4106807, 1, 0, 0, 1, 1,
0.3786567, 0.03658736, 1.386602, 0, 0, 0, 1, 1,
0.381131, 0.9733403, -0.4362959, 0, 0, 0, 1, 1,
0.3897195, -0.8255797, 2.763074, 0, 0, 0, 1, 1,
0.3898683, -1.742134, 2.406084, 0, 0, 0, 1, 1,
0.3970982, 0.7789904, 0.1872188, 0, 0, 0, 1, 1,
0.4079987, 0.9500778, -1.290895, 0, 0, 0, 1, 1,
0.4089709, 0.7577759, 0.3300356, 0, 0, 0, 1, 1,
0.4112685, -1.302565, 3.443808, 1, 1, 1, 1, 1,
0.4142076, -0.1416111, 3.127884, 1, 1, 1, 1, 1,
0.4170809, -1.1093, 3.187392, 1, 1, 1, 1, 1,
0.4190937, -0.6496022, 3.627641, 1, 1, 1, 1, 1,
0.4205796, 0.1491573, 0.02485113, 1, 1, 1, 1, 1,
0.4226562, -1.7605, 1.833216, 1, 1, 1, 1, 1,
0.4236812, -1.74283, 2.757155, 1, 1, 1, 1, 1,
0.4250726, -0.4738949, 2.235337, 1, 1, 1, 1, 1,
0.4282185, 1.810988, -0.1763164, 1, 1, 1, 1, 1,
0.4294861, 1.65346, 1.159948, 1, 1, 1, 1, 1,
0.4306167, -0.08506255, 1.297706, 1, 1, 1, 1, 1,
0.4308759, -0.6100122, 3.247797, 1, 1, 1, 1, 1,
0.4322648, -0.3950663, 1.947635, 1, 1, 1, 1, 1,
0.432487, -0.6616032, 2.288813, 1, 1, 1, 1, 1,
0.4330466, -1.544056, 4.456378, 1, 1, 1, 1, 1,
0.4340394, -0.5718434, 1.787601, 0, 0, 1, 1, 1,
0.4347391, 0.339341, -0.2083929, 1, 0, 0, 1, 1,
0.4387091, -0.05565454, 0.5616232, 1, 0, 0, 1, 1,
0.4387776, 1.116627, 0.2552936, 1, 0, 0, 1, 1,
0.4438182, -0.8410841, 4.454113, 1, 0, 0, 1, 1,
0.4470705, -0.2758806, 0.4877035, 1, 0, 0, 1, 1,
0.447847, 0.8416734, 0.9869578, 0, 0, 0, 1, 1,
0.4493692, -1.273529, 0.6671405, 0, 0, 0, 1, 1,
0.4537655, -0.5980543, 1.608798, 0, 0, 0, 1, 1,
0.4561516, 1.691903, 0.1601698, 0, 0, 0, 1, 1,
0.4569943, 1.606696, 0.4298792, 0, 0, 0, 1, 1,
0.4591959, -1.800861, 2.942754, 0, 0, 0, 1, 1,
0.4624742, -0.6161299, 3.483907, 0, 0, 0, 1, 1,
0.4651534, -0.06295383, 1.059834, 1, 1, 1, 1, 1,
0.4678761, -1.927097, 4.854848, 1, 1, 1, 1, 1,
0.4706967, 0.7287772, 0.2421928, 1, 1, 1, 1, 1,
0.4707921, 0.7472912, -0.9738093, 1, 1, 1, 1, 1,
0.4737862, -0.7408614, 3.785911, 1, 1, 1, 1, 1,
0.4743552, -1.210401, 4.02128, 1, 1, 1, 1, 1,
0.476225, 0.5745353, -0.48334, 1, 1, 1, 1, 1,
0.4787159, -1.052219, 2.313745, 1, 1, 1, 1, 1,
0.4792602, -0.1141026, 2.471504, 1, 1, 1, 1, 1,
0.480909, -1.165351, 2.415835, 1, 1, 1, 1, 1,
0.4865018, -0.965856, 1.973569, 1, 1, 1, 1, 1,
0.488519, -1.33379, 3.496076, 1, 1, 1, 1, 1,
0.4885793, 0.1351547, 2.240473, 1, 1, 1, 1, 1,
0.4929966, 1.008428, 0.4419686, 1, 1, 1, 1, 1,
0.4966972, 0.1667109, 2.344662, 1, 1, 1, 1, 1,
0.497143, -0.4960867, 2.054212, 0, 0, 1, 1, 1,
0.5080974, -0.3734337, 1.532748, 1, 0, 0, 1, 1,
0.5168216, -0.6195304, 3.655107, 1, 0, 0, 1, 1,
0.5171904, 0.08131707, 3.733687, 1, 0, 0, 1, 1,
0.5196655, 0.5817516, 0.0583798, 1, 0, 0, 1, 1,
0.5240753, 0.06167264, 2.020686, 1, 0, 0, 1, 1,
0.5258237, -0.3011051, 1.875266, 0, 0, 0, 1, 1,
0.5271348, 0.02404228, 1.529256, 0, 0, 0, 1, 1,
0.5279136, 1.494685, -0.101085, 0, 0, 0, 1, 1,
0.5284442, 1.228779, -0.7910588, 0, 0, 0, 1, 1,
0.529277, -0.5097219, 1.210995, 0, 0, 0, 1, 1,
0.5371102, -0.5148732, 3.074461, 0, 0, 0, 1, 1,
0.5457267, 0.7536431, 1.511679, 0, 0, 0, 1, 1,
0.5549244, 1.406002, 0.6226248, 1, 1, 1, 1, 1,
0.556541, 1.170681, 1.19158, 1, 1, 1, 1, 1,
0.5618277, 0.7448911, 1.33174, 1, 1, 1, 1, 1,
0.5622771, -1.009863, 2.946824, 1, 1, 1, 1, 1,
0.5625035, 0.1684941, 2.284844, 1, 1, 1, 1, 1,
0.5627252, -0.9993214, 2.677921, 1, 1, 1, 1, 1,
0.5682256, -0.4416861, 2.220196, 1, 1, 1, 1, 1,
0.5775097, -0.6278415, 2.588526, 1, 1, 1, 1, 1,
0.582355, -0.1713118, -0.155646, 1, 1, 1, 1, 1,
0.5863537, -1.486084, 3.474484, 1, 1, 1, 1, 1,
0.5876302, -0.521356, 1.484307, 1, 1, 1, 1, 1,
0.5974001, 0.3941466, 1.295061, 1, 1, 1, 1, 1,
0.6022161, 1.528799, -0.208851, 1, 1, 1, 1, 1,
0.6024507, 0.2493706, -0.3150211, 1, 1, 1, 1, 1,
0.6118929, -0.2582729, 2.357452, 1, 1, 1, 1, 1,
0.6175881, -0.2401892, 0.8421564, 0, 0, 1, 1, 1,
0.618037, -1.204631, 1.102132, 1, 0, 0, 1, 1,
0.6180469, 1.200146, 1.114147, 1, 0, 0, 1, 1,
0.6190536, 0.4511609, 0.07396817, 1, 0, 0, 1, 1,
0.6221757, -1.517095, 3.09536, 1, 0, 0, 1, 1,
0.6253985, -0.9442034, 3.434144, 1, 0, 0, 1, 1,
0.6261137, 1.83942, 0.3423411, 0, 0, 0, 1, 1,
0.6336226, 0.7065673, -0.9301763, 0, 0, 0, 1, 1,
0.6343307, 0.4272987, 0.2245463, 0, 0, 0, 1, 1,
0.635562, -0.6834575, 2.617133, 0, 0, 0, 1, 1,
0.6358439, -1.351718, 2.716448, 0, 0, 0, 1, 1,
0.6431382, -0.2730722, 2.341779, 0, 0, 0, 1, 1,
0.6442353, 2.634563, 0.4816831, 0, 0, 0, 1, 1,
0.6485652, 0.860616, 0.2632485, 1, 1, 1, 1, 1,
0.6515445, 0.9178368, 1.279616, 1, 1, 1, 1, 1,
0.6614271, -0.614986, 4.531131, 1, 1, 1, 1, 1,
0.6633291, 1.485919, -0.7207051, 1, 1, 1, 1, 1,
0.6673474, -1.49531, 1.648598, 1, 1, 1, 1, 1,
0.6680966, -0.1654946, 3.745444, 1, 1, 1, 1, 1,
0.6738405, -0.1695204, 2.115734, 1, 1, 1, 1, 1,
0.674898, 0.26674, 1.76318, 1, 1, 1, 1, 1,
0.6768638, 1.348544, 1.728105, 1, 1, 1, 1, 1,
0.6776366, 0.167796, 4.170899, 1, 1, 1, 1, 1,
0.6789933, -1.75387, 2.168643, 1, 1, 1, 1, 1,
0.6792681, -0.3038617, 0.8071718, 1, 1, 1, 1, 1,
0.6858182, 0.4411004, 1.659407, 1, 1, 1, 1, 1,
0.6905312, -1.032612, 2.912142, 1, 1, 1, 1, 1,
0.6910099, 0.6073804, 2.386326, 1, 1, 1, 1, 1,
0.6949139, -0.4555531, 2.425645, 0, 0, 1, 1, 1,
0.6951237, 1.054595, 1.069563, 1, 0, 0, 1, 1,
0.6967884, 0.7425164, 2.463949, 1, 0, 0, 1, 1,
0.6976137, 0.2749295, 2.006282, 1, 0, 0, 1, 1,
0.6979244, 0.04773634, 2.376715, 1, 0, 0, 1, 1,
0.7080802, 0.8044817, 1.195688, 1, 0, 0, 1, 1,
0.7184277, -0.3919329, 2.785602, 0, 0, 0, 1, 1,
0.7216579, 1.223758, 2.292851, 0, 0, 0, 1, 1,
0.7229857, -0.2545109, 2.182407, 0, 0, 0, 1, 1,
0.7310013, 1.112744, -1.680734, 0, 0, 0, 1, 1,
0.7311793, 1.069785, 1.097756, 0, 0, 0, 1, 1,
0.7312779, 0.3714401, 0.8133488, 0, 0, 0, 1, 1,
0.7343103, 0.1534676, 2.009807, 0, 0, 0, 1, 1,
0.7344753, 0.006445543, 2.666264, 1, 1, 1, 1, 1,
0.7388587, 0.03771632, 2.061812, 1, 1, 1, 1, 1,
0.7405585, 0.5951188, 1.669981, 1, 1, 1, 1, 1,
0.7462834, -0.6849699, 0.7073968, 1, 1, 1, 1, 1,
0.7467242, -0.38478, 2.525741, 1, 1, 1, 1, 1,
0.749607, 1.623612, 0.6325005, 1, 1, 1, 1, 1,
0.7553869, 0.2846822, 0.3452906, 1, 1, 1, 1, 1,
0.7576158, 1.600984, -1.265921, 1, 1, 1, 1, 1,
0.7603446, -0.6577674, 2.537429, 1, 1, 1, 1, 1,
0.7610568, -0.1947334, 1.355721, 1, 1, 1, 1, 1,
0.761185, -0.08800092, 2.453033, 1, 1, 1, 1, 1,
0.7616504, -1.494539, 1.796976, 1, 1, 1, 1, 1,
0.7667047, 0.5531589, 0.5225509, 1, 1, 1, 1, 1,
0.7712905, -0.2071337, 2.326241, 1, 1, 1, 1, 1,
0.7714591, 0.122187, -0.9061808, 1, 1, 1, 1, 1,
0.7757304, -1.715954, 1.568147, 0, 0, 1, 1, 1,
0.7767973, -1.089825, 2.293279, 1, 0, 0, 1, 1,
0.7788653, -0.03663012, 1.016132, 1, 0, 0, 1, 1,
0.7807525, -0.7007858, 1.606037, 1, 0, 0, 1, 1,
0.7843236, 1.188911, 0.7248317, 1, 0, 0, 1, 1,
0.788317, 0.4258035, 0.8429231, 1, 0, 0, 1, 1,
0.7901136, -1.01935, 1.902579, 0, 0, 0, 1, 1,
0.7956835, 1.168609, 2.453593, 0, 0, 0, 1, 1,
0.7987565, -0.0941059, 2.425483, 0, 0, 0, 1, 1,
0.8013229, 0.6587361, -0.1574907, 0, 0, 0, 1, 1,
0.8106378, 0.6880034, 1.152939, 0, 0, 0, 1, 1,
0.8111678, 0.5420253, -0.3814642, 0, 0, 0, 1, 1,
0.821696, 0.6442359, 0.7637784, 0, 0, 0, 1, 1,
0.8222502, 0.05666789, 1.620498, 1, 1, 1, 1, 1,
0.8244018, -1.693204, 1.431971, 1, 1, 1, 1, 1,
0.842236, 0.007337361, 1.497969, 1, 1, 1, 1, 1,
0.8452815, 0.472306, 3.059675, 1, 1, 1, 1, 1,
0.8464687, 0.2185438, 1.210503, 1, 1, 1, 1, 1,
0.8506188, 0.09903751, 3.198518, 1, 1, 1, 1, 1,
0.8636275, -0.1816136, 1.767144, 1, 1, 1, 1, 1,
0.8718218, 0.5404967, 2.668193, 1, 1, 1, 1, 1,
0.8788109, 0.05771181, 1.169145, 1, 1, 1, 1, 1,
0.8800941, -0.9402525, 1.867639, 1, 1, 1, 1, 1,
0.8811371, 0.1843966, 1.281421, 1, 1, 1, 1, 1,
0.8832081, -1.342934, 1.660709, 1, 1, 1, 1, 1,
0.8836551, 0.5026037, 1.17587, 1, 1, 1, 1, 1,
0.8860208, -0.5956382, 1.697938, 1, 1, 1, 1, 1,
0.8920842, -1.066803, 1.017006, 1, 1, 1, 1, 1,
0.8924629, -0.7651461, 2.23092, 0, 0, 1, 1, 1,
0.8989369, 1.138472, 1.977646, 1, 0, 0, 1, 1,
0.9113845, 0.3391581, 1.071921, 1, 0, 0, 1, 1,
0.9284409, 0.796639, 0.2999157, 1, 0, 0, 1, 1,
0.931465, 0.8782189, 0.8436248, 1, 0, 0, 1, 1,
0.9334589, 0.9354469, 1.631913, 1, 0, 0, 1, 1,
0.942324, -0.3829055, 5.041, 0, 0, 0, 1, 1,
0.9489834, 0.779732, 0.4593402, 0, 0, 0, 1, 1,
0.9547869, 0.1241012, 0.9563874, 0, 0, 0, 1, 1,
0.9569216, -1.565601, 2.883313, 0, 0, 0, 1, 1,
0.9572233, 0.9571546, -0.01966783, 0, 0, 0, 1, 1,
0.965315, -0.731213, 2.730094, 0, 0, 0, 1, 1,
0.9664739, 1.021807, 0.01801739, 0, 0, 0, 1, 1,
0.9700602, -1.042199, 1.969981, 1, 1, 1, 1, 1,
0.9722838, 0.7026557, 0.1400465, 1, 1, 1, 1, 1,
0.9742428, 1.778027, 1.060056, 1, 1, 1, 1, 1,
0.9762592, 0.1035114, 0.6718838, 1, 1, 1, 1, 1,
0.9813626, 0.7838833, 1.159082, 1, 1, 1, 1, 1,
0.9893192, 1.708714, 0.1833697, 1, 1, 1, 1, 1,
0.9895176, -2.44165, 1.636733, 1, 1, 1, 1, 1,
0.9916393, 0.985157, 1.695512, 1, 1, 1, 1, 1,
0.9954948, 0.1313296, 1.530742, 1, 1, 1, 1, 1,
1.005317, 0.250298, 1.873198, 1, 1, 1, 1, 1,
1.010916, -1.564692, 2.773495, 1, 1, 1, 1, 1,
1.012773, -0.09063401, 0.3517227, 1, 1, 1, 1, 1,
1.017087, 0.3022389, 1.0763, 1, 1, 1, 1, 1,
1.038437, 0.4338291, 1.023092, 1, 1, 1, 1, 1,
1.038695, 0.3604888, 0.2565978, 1, 1, 1, 1, 1,
1.038942, -0.01022781, 0.7350024, 0, 0, 1, 1, 1,
1.039139, -0.8170373, 0.03189372, 1, 0, 0, 1, 1,
1.048782, 0.6649791, -1.490876, 1, 0, 0, 1, 1,
1.050506, 0.1067086, 2.509792, 1, 0, 0, 1, 1,
1.061357, 0.1185814, 1.746992, 1, 0, 0, 1, 1,
1.096556, 0.8854228, 0.05716975, 1, 0, 0, 1, 1,
1.098041, -0.3157772, 0.6488907, 0, 0, 0, 1, 1,
1.099847, 1.525663, 0.1840975, 0, 0, 0, 1, 1,
1.10487, 0.2647412, 2.191231, 0, 0, 0, 1, 1,
1.104876, 0.8159885, 1.760367, 0, 0, 0, 1, 1,
1.104984, 0.7151408, 1.473356, 0, 0, 0, 1, 1,
1.107761, -0.1440306, -0.3151673, 0, 0, 0, 1, 1,
1.108623, 1.145558, 0.9507664, 0, 0, 0, 1, 1,
1.109752, 0.8775339, 2.519458, 1, 1, 1, 1, 1,
1.11121, -1.225992, 2.350142, 1, 1, 1, 1, 1,
1.113134, 1.061091, 1.152952, 1, 1, 1, 1, 1,
1.124715, -0.885964, 2.325144, 1, 1, 1, 1, 1,
1.128557, 0.5814581, 2.290214, 1, 1, 1, 1, 1,
1.129345, -1.039509, 2.044175, 1, 1, 1, 1, 1,
1.129705, -0.2647767, 1.177803, 1, 1, 1, 1, 1,
1.130633, -0.1055348, 3.614663, 1, 1, 1, 1, 1,
1.145643, -0.5796174, 3.739347, 1, 1, 1, 1, 1,
1.150141, 0.5323755, 1.027486, 1, 1, 1, 1, 1,
1.152031, 0.5943647, 1.91262, 1, 1, 1, 1, 1,
1.159803, -1.069462, 2.265046, 1, 1, 1, 1, 1,
1.160656, -0.07935975, 0.514498, 1, 1, 1, 1, 1,
1.163945, 0.6124504, 0.4152718, 1, 1, 1, 1, 1,
1.176688, 1.094249, 2.083303, 1, 1, 1, 1, 1,
1.178627, -1.280378, 1.431613, 0, 0, 1, 1, 1,
1.178848, 0.4186032, 2.971777, 1, 0, 0, 1, 1,
1.178927, 0.992727, -0.1717038, 1, 0, 0, 1, 1,
1.191875, -1.302726, 1.745398, 1, 0, 0, 1, 1,
1.193042, -1.066692, 2.536981, 1, 0, 0, 1, 1,
1.195516, 1.269175, -0.07380675, 1, 0, 0, 1, 1,
1.195663, 1.332311, -0.02687296, 0, 0, 0, 1, 1,
1.202941, -0.3138084, 1.600437, 0, 0, 0, 1, 1,
1.206703, -0.2088472, 0.740612, 0, 0, 0, 1, 1,
1.206982, -2.003772, 2.745852, 0, 0, 0, 1, 1,
1.209578, 0.03302656, 1.8084, 0, 0, 0, 1, 1,
1.210278, 0.8508272, -0.01658782, 0, 0, 0, 1, 1,
1.214376, -0.5406049, 1.281444, 0, 0, 0, 1, 1,
1.216598, -0.6937388, 1.565881, 1, 1, 1, 1, 1,
1.21717, 0.1529467, 1.673314, 1, 1, 1, 1, 1,
1.221392, 1.473632, 1.617148, 1, 1, 1, 1, 1,
1.222296, 0.8773175, -1.462841, 1, 1, 1, 1, 1,
1.227126, 1.853732, 1.23793, 1, 1, 1, 1, 1,
1.232026, -1.165071, 3.36539, 1, 1, 1, 1, 1,
1.234592, 0.5293762, -0.03581492, 1, 1, 1, 1, 1,
1.246977, 1.104338, 0.7369823, 1, 1, 1, 1, 1,
1.249735, -0.5090847, 1.445345, 1, 1, 1, 1, 1,
1.250703, -1.229865, 2.846867, 1, 1, 1, 1, 1,
1.256926, -0.7467775, 4.153274, 1, 1, 1, 1, 1,
1.257526, -1.318443, 1.494054, 1, 1, 1, 1, 1,
1.271067, -0.7288141, 4.17337, 1, 1, 1, 1, 1,
1.28519, -1.527481, 4.123557, 1, 1, 1, 1, 1,
1.292995, -2.643178, 1.355175, 1, 1, 1, 1, 1,
1.302666, -0.3724168, 2.233222, 0, 0, 1, 1, 1,
1.320397, -0.3782715, 1.569866, 1, 0, 0, 1, 1,
1.344955, -0.3961421, 2.429229, 1, 0, 0, 1, 1,
1.345121, -1.981671, 3.456312, 1, 0, 0, 1, 1,
1.356536, 1.88882, 0.3131956, 1, 0, 0, 1, 1,
1.36173, -0.4812512, 1.484215, 1, 0, 0, 1, 1,
1.361761, -0.6182466, 1.146009, 0, 0, 0, 1, 1,
1.368046, -1.277217, 2.547716, 0, 0, 0, 1, 1,
1.368459, 0.6654644, 2.192308, 0, 0, 0, 1, 1,
1.369425, -0.8261319, 1.789581, 0, 0, 0, 1, 1,
1.375495, 1.103993, 2.512158, 0, 0, 0, 1, 1,
1.384564, 0.6492766, 1.669414, 0, 0, 0, 1, 1,
1.388265, 0.07123839, 1.664065, 0, 0, 0, 1, 1,
1.393815, 0.2308389, -0.02800419, 1, 1, 1, 1, 1,
1.39581, -0.7154648, 1.290754, 1, 1, 1, 1, 1,
1.400618, -0.7729678, 3.980167, 1, 1, 1, 1, 1,
1.414957, 0.1885196, 3.215834, 1, 1, 1, 1, 1,
1.416192, 0.1324595, 1.784876, 1, 1, 1, 1, 1,
1.420315, -0.3011262, 1.057938, 1, 1, 1, 1, 1,
1.428438, -0.3513167, 2.091879, 1, 1, 1, 1, 1,
1.434862, -0.1406607, 2.207049, 1, 1, 1, 1, 1,
1.437554, -1.614847, 3.909227, 1, 1, 1, 1, 1,
1.439306, -1.216003, 2.968479, 1, 1, 1, 1, 1,
1.44623, 2.07776, 0.297202, 1, 1, 1, 1, 1,
1.455848, 0.3220568, 0.1101806, 1, 1, 1, 1, 1,
1.470433, 0.4263897, 0.4213689, 1, 1, 1, 1, 1,
1.473925, 0.107434, 1.285771, 1, 1, 1, 1, 1,
1.473939, 0.4023292, 1.971054, 1, 1, 1, 1, 1,
1.474117, -0.3219704, -0.02471299, 0, 0, 1, 1, 1,
1.47452, -0.8511475, 2.245592, 1, 0, 0, 1, 1,
1.510053, -1.434002, 2.642848, 1, 0, 0, 1, 1,
1.535431, 1.435128, 1.59781, 1, 0, 0, 1, 1,
1.544618, 0.007063761, 2.297992, 1, 0, 0, 1, 1,
1.550757, -0.9339624, 2.377399, 1, 0, 0, 1, 1,
1.554225, 0.6211142, 1.69283, 0, 0, 0, 1, 1,
1.558904, -0.001716597, 2.012829, 0, 0, 0, 1, 1,
1.567574, -0.5499217, 3.113271, 0, 0, 0, 1, 1,
1.568519, 0.3942007, 0.5518243, 0, 0, 0, 1, 1,
1.569298, 0.457185, 0.8846722, 0, 0, 0, 1, 1,
1.571075, -0.7435793, 2.667459, 0, 0, 0, 1, 1,
1.572938, -0.4460573, 3.907667, 0, 0, 0, 1, 1,
1.575931, 0.7495838, 3.006661, 1, 1, 1, 1, 1,
1.580707, -0.06260549, 2.816077, 1, 1, 1, 1, 1,
1.582538, -0.2285304, 1.897686, 1, 1, 1, 1, 1,
1.596867, -0.8465657, 1.706794, 1, 1, 1, 1, 1,
1.601328, -0.3678911, 2.230619, 1, 1, 1, 1, 1,
1.634242, 0.3717627, 2.658084, 1, 1, 1, 1, 1,
1.637045, -0.5796117, 0.9699498, 1, 1, 1, 1, 1,
1.638081, -1.11485, 1.432869, 1, 1, 1, 1, 1,
1.63905, 0.7765133, -0.281551, 1, 1, 1, 1, 1,
1.648685, -0.2975838, 2.299476, 1, 1, 1, 1, 1,
1.65264, 0.4580778, 0.9942513, 1, 1, 1, 1, 1,
1.660939, 0.6061925, 1.675042, 1, 1, 1, 1, 1,
1.66262, 2.604958, 1.088095, 1, 1, 1, 1, 1,
1.685031, -0.1340105, 0.1426052, 1, 1, 1, 1, 1,
1.685988, 0.01475034, 1.203491, 1, 1, 1, 1, 1,
1.696202, -0.2668292, 2.613273, 0, 0, 1, 1, 1,
1.700955, -1.52646, 4.750577, 1, 0, 0, 1, 1,
1.714372, -0.533648, 1.207038, 1, 0, 0, 1, 1,
1.720882, 0.4305017, 0.362568, 1, 0, 0, 1, 1,
1.72675, -1.726048, 1.578029, 1, 0, 0, 1, 1,
1.730246, 0.06516664, -1.002674, 1, 0, 0, 1, 1,
1.752526, 0.4396999, 2.394249, 0, 0, 0, 1, 1,
1.763918, -0.07836407, 2.595687, 0, 0, 0, 1, 1,
1.778294, -0.3812656, 1.085556, 0, 0, 0, 1, 1,
1.779686, -0.3507976, 1.035956, 0, 0, 0, 1, 1,
1.811975, 0.1932237, 2.143513, 0, 0, 0, 1, 1,
1.817414, 0.4246878, 1.277322, 0, 0, 0, 1, 1,
1.819459, -0.5912368, 2.647889, 0, 0, 0, 1, 1,
1.826634, 0.2474175, 2.224959, 1, 1, 1, 1, 1,
1.843168, 0.2557856, 1.738203, 1, 1, 1, 1, 1,
1.859758, 0.6167899, 1.264615, 1, 1, 1, 1, 1,
1.885485, -0.3355086, 3.708618, 1, 1, 1, 1, 1,
1.890431, 0.09562741, 3.013946, 1, 1, 1, 1, 1,
1.907733, 0.09525566, 1.582075, 1, 1, 1, 1, 1,
1.908357, -0.3882239, 1.36876, 1, 1, 1, 1, 1,
1.927227, -1.205169, 2.129831, 1, 1, 1, 1, 1,
1.93802, -1.219386, 1.810648, 1, 1, 1, 1, 1,
1.957275, -0.811255, 4.223251, 1, 1, 1, 1, 1,
1.96231, -0.8699116, 2.569979, 1, 1, 1, 1, 1,
1.982496, -1.298837, 0.5519726, 1, 1, 1, 1, 1,
1.983281, -0.7777746, 2.437714, 1, 1, 1, 1, 1,
2.045853, -1.226311, 0.7268584, 1, 1, 1, 1, 1,
2.059071, 0.5162042, -0.406224, 1, 1, 1, 1, 1,
2.074173, -1.838545, 3.443628, 0, 0, 1, 1, 1,
2.083221, 0.5419861, 0.02015678, 1, 0, 0, 1, 1,
2.114264, 1.264664, 1.032315, 1, 0, 0, 1, 1,
2.135957, -0.8816132, 2.130458, 1, 0, 0, 1, 1,
2.17523, -1.11179, 1.054652, 1, 0, 0, 1, 1,
2.217525, 0.9411211, 1.381278, 1, 0, 0, 1, 1,
2.250823, -0.4070481, 1.026772, 0, 0, 0, 1, 1,
2.274007, 0.02281768, 1.892926, 0, 0, 0, 1, 1,
2.284683, 0.7490612, 1.380357, 0, 0, 0, 1, 1,
2.3254, 1.282267, 1.098547, 0, 0, 0, 1, 1,
2.342595, -1.420294, 1.627079, 0, 0, 0, 1, 1,
2.364013, -0.7471847, 2.82269, 0, 0, 0, 1, 1,
2.405429, -0.05720344, 1.406583, 0, 0, 0, 1, 1,
2.43642, -1.215199, 0.8634966, 1, 1, 1, 1, 1,
2.450857, -0.8240321, 2.967106, 1, 1, 1, 1, 1,
2.459569, 0.2727279, 1.909047, 1, 1, 1, 1, 1,
2.500826, -0.1993843, 0.8678209, 1, 1, 1, 1, 1,
2.727177, -1.245237, 1.610026, 1, 1, 1, 1, 1,
2.775595, -1.527885, 1.366621, 1, 1, 1, 1, 1,
2.792461, 0.6647533, 2.57534, 1, 1, 1, 1, 1
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
var radius = 9.3899;
var distance = 32.98162;
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
mvMatrix.translate( -0.003363252, -0.3443997, 0.0628798 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.98162);
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
