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
-3.562854, -0.4737151, -0.3304424, 1, 0, 0, 1,
-3.390118, -0.09219212, -0.7567111, 1, 0.007843138, 0, 1,
-3.257355, 0.1831263, -2.603818, 1, 0.01176471, 0, 1,
-3.249435, -0.1395215, -1.329027, 1, 0.01960784, 0, 1,
-2.793377, 1.419753, -1.525598, 1, 0.02352941, 0, 1,
-2.717954, -0.6726108, -2.127786, 1, 0.03137255, 0, 1,
-2.652984, 0.8106945, -1.311341, 1, 0.03529412, 0, 1,
-2.504876, -0.02561407, 0.03814044, 1, 0.04313726, 0, 1,
-2.422749, -0.1090266, 2.476305, 1, 0.04705882, 0, 1,
-2.399827, 1.081178, -0.08205342, 1, 0.05490196, 0, 1,
-2.357105, 0.8360163, -1.942568, 1, 0.05882353, 0, 1,
-2.311914, -0.5637389, -1.421971, 1, 0.06666667, 0, 1,
-2.28434, -0.3952771, -0.9025289, 1, 0.07058824, 0, 1,
-2.272183, 0.8162184, -2.523149, 1, 0.07843138, 0, 1,
-2.199732, -0.619307, -1.988673, 1, 0.08235294, 0, 1,
-2.166409, -2.06376, -1.292482, 1, 0.09019608, 0, 1,
-2.165309, -1.77746, -3.316949, 1, 0.09411765, 0, 1,
-2.152708, 1.824011, -1.151824, 1, 0.1019608, 0, 1,
-2.107716, 1.809771, -1.519104, 1, 0.1098039, 0, 1,
-2.101959, -0.1376828, -1.265402, 1, 0.1137255, 0, 1,
-2.081323, 1.075624, -0.9735333, 1, 0.1215686, 0, 1,
-2.064531, -0.09794375, -1.726229, 1, 0.1254902, 0, 1,
-2.010204, 1.207005, -0.1102266, 1, 0.1333333, 0, 1,
-1.982089, -1.203748, -1.316157, 1, 0.1372549, 0, 1,
-1.981786, -1.160247, -1.243515, 1, 0.145098, 0, 1,
-1.976105, -0.2838273, -0.6722204, 1, 0.1490196, 0, 1,
-1.963617, -1.260951, -2.546928, 1, 0.1568628, 0, 1,
-1.949543, -2.113118, -1.628686, 1, 0.1607843, 0, 1,
-1.93156, 1.028408, -2.44336, 1, 0.1686275, 0, 1,
-1.923854, 0.3656606, -0.3824869, 1, 0.172549, 0, 1,
-1.917589, -1.110301, -1.205803, 1, 0.1803922, 0, 1,
-1.891151, -0.6613871, -3.173793, 1, 0.1843137, 0, 1,
-1.8812, 0.393506, -2.745775, 1, 0.1921569, 0, 1,
-1.880405, -0.05272842, -1.035531, 1, 0.1960784, 0, 1,
-1.871794, 1.23642, -1.397298, 1, 0.2039216, 0, 1,
-1.870661, 0.9000798, -2.137918, 1, 0.2117647, 0, 1,
-1.858196, -0.5828723, -1.800141, 1, 0.2156863, 0, 1,
-1.842257, -0.7462349, -2.824254, 1, 0.2235294, 0, 1,
-1.841079, 1.114412, -1.257483, 1, 0.227451, 0, 1,
-1.831732, -1.787663, -0.7367472, 1, 0.2352941, 0, 1,
-1.818902, 1.278909, -0.1029157, 1, 0.2392157, 0, 1,
-1.792726, -0.3129034, -1.665634, 1, 0.2470588, 0, 1,
-1.76621, 0.6229752, -1.33405, 1, 0.2509804, 0, 1,
-1.728674, 0.7308319, 0.03887716, 1, 0.2588235, 0, 1,
-1.710981, 0.03987255, -1.625739, 1, 0.2627451, 0, 1,
-1.69605, 0.5106091, -1.719548, 1, 0.2705882, 0, 1,
-1.685549, -0.8832399, -1.547197, 1, 0.2745098, 0, 1,
-1.675755, -0.1763112, 0.3450164, 1, 0.282353, 0, 1,
-1.671668, -0.4119142, -0.1442109, 1, 0.2862745, 0, 1,
-1.66323, -1.200093, -0.1171669, 1, 0.2941177, 0, 1,
-1.659312, 0.188556, -1.260536, 1, 0.3019608, 0, 1,
-1.649587, 1.098114, -0.4557, 1, 0.3058824, 0, 1,
-1.646225, -0.9519222, -0.7153351, 1, 0.3137255, 0, 1,
-1.643505, 0.241388, -0.939336, 1, 0.3176471, 0, 1,
-1.632166, 1.620447, -0.2204205, 1, 0.3254902, 0, 1,
-1.63065, -0.6474268, -1.789147, 1, 0.3294118, 0, 1,
-1.627181, -0.7190567, -2.108236, 1, 0.3372549, 0, 1,
-1.625153, 1.028761, -1.775069, 1, 0.3411765, 0, 1,
-1.621496, 0.2049355, -0.7166076, 1, 0.3490196, 0, 1,
-1.618016, 1.489599, -2.113205, 1, 0.3529412, 0, 1,
-1.590271, 0.1509613, -2.309445, 1, 0.3607843, 0, 1,
-1.580038, -0.1517302, -1.751854, 1, 0.3647059, 0, 1,
-1.572939, -0.3109501, -0.6375845, 1, 0.372549, 0, 1,
-1.571041, 0.0455006, -3.43612, 1, 0.3764706, 0, 1,
-1.541766, 1.091579, -1.174935, 1, 0.3843137, 0, 1,
-1.5106, -0.3207543, -2.126988, 1, 0.3882353, 0, 1,
-1.501562, -0.00869999, -0.7982609, 1, 0.3960784, 0, 1,
-1.498824, 0.7731518, -0.6197593, 1, 0.4039216, 0, 1,
-1.491648, 0.1074471, -3.743639, 1, 0.4078431, 0, 1,
-1.481823, -0.06019586, -2.88036, 1, 0.4156863, 0, 1,
-1.475159, -0.4435608, -1.988278, 1, 0.4196078, 0, 1,
-1.464577, 0.3066177, -2.140227, 1, 0.427451, 0, 1,
-1.45119, 1.58562, -1.254764, 1, 0.4313726, 0, 1,
-1.447353, -0.1419723, -2.035407, 1, 0.4392157, 0, 1,
-1.443618, -0.5160204, -2.316562, 1, 0.4431373, 0, 1,
-1.440612, -1.707921, -2.869544, 1, 0.4509804, 0, 1,
-1.436946, -0.7804457, -1.78711, 1, 0.454902, 0, 1,
-1.434911, -1.4447, -2.833231, 1, 0.4627451, 0, 1,
-1.433661, 0.2289525, -2.687624, 1, 0.4666667, 0, 1,
-1.422068, -0.6015142, -2.762249, 1, 0.4745098, 0, 1,
-1.420792, 0.4834981, -2.044231, 1, 0.4784314, 0, 1,
-1.419299, -0.002618098, -3.584678, 1, 0.4862745, 0, 1,
-1.416047, -0.6363984, -0.9750603, 1, 0.4901961, 0, 1,
-1.411134, 0.5722946, 0.09817607, 1, 0.4980392, 0, 1,
-1.399398, -1.048823, -1.509676, 1, 0.5058824, 0, 1,
-1.396929, 0.2671707, -0.5170293, 1, 0.509804, 0, 1,
-1.396611, -0.1867167, -0.3642875, 1, 0.5176471, 0, 1,
-1.39598, 0.6503776, -1.870741, 1, 0.5215687, 0, 1,
-1.385511, -0.2280181, -3.543447, 1, 0.5294118, 0, 1,
-1.383126, 0.8564914, -2.723291, 1, 0.5333334, 0, 1,
-1.382391, -0.1815162, -2.102894, 1, 0.5411765, 0, 1,
-1.36847, 0.9780337, 0.5157617, 1, 0.5450981, 0, 1,
-1.357008, -1.63952, -2.423221, 1, 0.5529412, 0, 1,
-1.354084, -0.4860224, -3.649327, 1, 0.5568628, 0, 1,
-1.347706, 0.2502043, -2.674036, 1, 0.5647059, 0, 1,
-1.347704, -0.1757367, -2.237908, 1, 0.5686275, 0, 1,
-1.347519, 1.451411, -0.8266529, 1, 0.5764706, 0, 1,
-1.344032, 0.1083318, -0.9533951, 1, 0.5803922, 0, 1,
-1.342416, -1.528672, -1.864146, 1, 0.5882353, 0, 1,
-1.325342, 0.9014778, -0.4865682, 1, 0.5921569, 0, 1,
-1.319853, -1.989223, -2.271428, 1, 0.6, 0, 1,
-1.308935, 0.07047256, -0.6350476, 1, 0.6078432, 0, 1,
-1.304682, 3.37238, -1.143097, 1, 0.6117647, 0, 1,
-1.298963, -1.953252, -1.958267, 1, 0.6196079, 0, 1,
-1.297395, -0.5839708, -0.999316, 1, 0.6235294, 0, 1,
-1.292362, -0.2603331, -1.403781, 1, 0.6313726, 0, 1,
-1.291226, 1.545899, 0.2382137, 1, 0.6352941, 0, 1,
-1.282816, -0.3788652, -2.480758, 1, 0.6431373, 0, 1,
-1.27898, -2.698765, -4.351303, 1, 0.6470588, 0, 1,
-1.277043, -0.9072827, -2.352963, 1, 0.654902, 0, 1,
-1.272853, 0.1758725, -1.669633, 1, 0.6588235, 0, 1,
-1.256195, 0.4020494, 0.07590719, 1, 0.6666667, 0, 1,
-1.251719, 0.4442267, -3.282116, 1, 0.6705883, 0, 1,
-1.251073, 2.194294, -0.9888149, 1, 0.6784314, 0, 1,
-1.250939, -0.9216006, 0.2085608, 1, 0.682353, 0, 1,
-1.250744, 0.3129222, -1.326419, 1, 0.6901961, 0, 1,
-1.250103, 0.3216045, -1.749111, 1, 0.6941177, 0, 1,
-1.24951, 1.014803, -2.596762, 1, 0.7019608, 0, 1,
-1.247623, 0.04531163, -2.241076, 1, 0.7098039, 0, 1,
-1.235325, -1.510149, -0.7007814, 1, 0.7137255, 0, 1,
-1.234532, -0.2509768, -0.06581084, 1, 0.7215686, 0, 1,
-1.22549, 0.7418552, -1.303153, 1, 0.7254902, 0, 1,
-1.225301, 0.7840622, -0.6236703, 1, 0.7333333, 0, 1,
-1.222847, 0.9213577, -1.813994, 1, 0.7372549, 0, 1,
-1.221341, 0.3101943, -0.1193258, 1, 0.7450981, 0, 1,
-1.211735, -1.169929, -2.282813, 1, 0.7490196, 0, 1,
-1.208923, 1.225732, -1.349699, 1, 0.7568628, 0, 1,
-1.207931, 0.2561579, -2.220789, 1, 0.7607843, 0, 1,
-1.191621, -0.02271738, -1.651906, 1, 0.7686275, 0, 1,
-1.184712, -0.2996233, -0.9683797, 1, 0.772549, 0, 1,
-1.182979, 1.073078, -1.256326, 1, 0.7803922, 0, 1,
-1.157286, 1.631376, -1.507895, 1, 0.7843137, 0, 1,
-1.156772, 1.440125, 2.90558, 1, 0.7921569, 0, 1,
-1.153869, -0.02469857, -1.529058, 1, 0.7960784, 0, 1,
-1.145577, -0.3549922, -2.437646, 1, 0.8039216, 0, 1,
-1.140219, 1.072748, -1.389612, 1, 0.8117647, 0, 1,
-1.130326, -0.7213333, -0.3486935, 1, 0.8156863, 0, 1,
-1.126891, -0.01859425, -1.631385, 1, 0.8235294, 0, 1,
-1.126763, 0.02703278, -2.888107, 1, 0.827451, 0, 1,
-1.124083, -0.4166639, -1.819711, 1, 0.8352941, 0, 1,
-1.12344, -1.601381, -1.256148, 1, 0.8392157, 0, 1,
-1.122292, -1.000723, -3.823025, 1, 0.8470588, 0, 1,
-1.119099, -0.06148656, -0.5611833, 1, 0.8509804, 0, 1,
-1.11677, -0.4879094, -3.467974, 1, 0.8588235, 0, 1,
-1.112789, 0.2557775, -1.6838, 1, 0.8627451, 0, 1,
-1.110281, -0.4402361, -2.23752, 1, 0.8705882, 0, 1,
-1.10955, 0.8011626, -0.3912033, 1, 0.8745098, 0, 1,
-1.102201, -0.6485504, -2.558278, 1, 0.8823529, 0, 1,
-1.101905, 0.3372335, -0.7839923, 1, 0.8862745, 0, 1,
-1.096997, -1.397424, -3.070858, 1, 0.8941177, 0, 1,
-1.080026, 1.222194, -1.336148, 1, 0.8980392, 0, 1,
-1.078241, -0.146469, -1.210721, 1, 0.9058824, 0, 1,
-1.075513, 0.3111153, -1.375116, 1, 0.9137255, 0, 1,
-1.072552, -0.2477451, -0.9689234, 1, 0.9176471, 0, 1,
-1.06948, 0.2169491, 0.3095162, 1, 0.9254902, 0, 1,
-1.066615, -0.46138, -0.2687675, 1, 0.9294118, 0, 1,
-1.064522, -0.2797325, -0.7701688, 1, 0.9372549, 0, 1,
-1.064435, -0.3640695, -2.790677, 1, 0.9411765, 0, 1,
-1.063104, 0.7755946, -1.310341, 1, 0.9490196, 0, 1,
-1.062953, -0.3220697, -0.09556439, 1, 0.9529412, 0, 1,
-1.062306, -0.2150837, -0.7157767, 1, 0.9607843, 0, 1,
-1.061529, 1.159482, -0.1551816, 1, 0.9647059, 0, 1,
-1.061416, -0.4190184, -1.811723, 1, 0.972549, 0, 1,
-1.059141, 1.762883, -1.629718, 1, 0.9764706, 0, 1,
-1.056287, -1.464804, -2.971433, 1, 0.9843137, 0, 1,
-1.046052, 0.7188579, -1.255069, 1, 0.9882353, 0, 1,
-1.045305, 0.5608603, -0.4875303, 1, 0.9960784, 0, 1,
-1.016709, -0.4411063, -2.743946, 0.9960784, 1, 0, 1,
-1.015878, 1.715907, 0.2524929, 0.9921569, 1, 0, 1,
-1.010744, -0.4435589, -2.269414, 0.9843137, 1, 0, 1,
-1.002762, -1.836814, -4.128697, 0.9803922, 1, 0, 1,
-1.002246, 0.6011436, 0.1692938, 0.972549, 1, 0, 1,
-1.001004, -0.1470758, -3.229272, 0.9686275, 1, 0, 1,
-0.9975117, 0.06553441, -0.1963244, 0.9607843, 1, 0, 1,
-0.9941165, 0.9368649, -2.065273, 0.9568627, 1, 0, 1,
-0.9911463, 1.660895, -0.4325145, 0.9490196, 1, 0, 1,
-0.9875041, -0.5796475, -2.436838, 0.945098, 1, 0, 1,
-0.9852299, -0.8708009, -4.482271, 0.9372549, 1, 0, 1,
-0.9819934, -0.755864, -0.736525, 0.9333333, 1, 0, 1,
-0.9802023, 0.04674662, -0.7391695, 0.9254902, 1, 0, 1,
-0.9760953, 0.6904091, 1.598116, 0.9215686, 1, 0, 1,
-0.9733, -0.9293771, -1.688135, 0.9137255, 1, 0, 1,
-0.9727283, -0.1250224, -1.871022, 0.9098039, 1, 0, 1,
-0.9632353, 1.644962, -0.3481874, 0.9019608, 1, 0, 1,
-0.961874, 1.082774, -1.112754, 0.8941177, 1, 0, 1,
-0.9524773, -0.5484415, -0.4170527, 0.8901961, 1, 0, 1,
-0.9494659, -0.9803643, -3.954677, 0.8823529, 1, 0, 1,
-0.9480675, 0.2251052, -0.972616, 0.8784314, 1, 0, 1,
-0.945718, 0.3744928, -0.6473512, 0.8705882, 1, 0, 1,
-0.9443875, 2.091664, 0.08462354, 0.8666667, 1, 0, 1,
-0.9366448, -0.190968, -1.702991, 0.8588235, 1, 0, 1,
-0.929194, -0.2014133, -2.60235, 0.854902, 1, 0, 1,
-0.9214746, -0.2434105, -2.008993, 0.8470588, 1, 0, 1,
-0.9210494, -2.408727, -2.942945, 0.8431373, 1, 0, 1,
-0.9208353, 2.544381, 0.6747881, 0.8352941, 1, 0, 1,
-0.9167142, 1.803829, -2.484083, 0.8313726, 1, 0, 1,
-0.9159656, -2.668292, -5.166618, 0.8235294, 1, 0, 1,
-0.9092292, -1.272141, -2.914567, 0.8196079, 1, 0, 1,
-0.9040769, 0.6763687, -1.099793, 0.8117647, 1, 0, 1,
-0.8921334, 0.672346, -1.781551, 0.8078431, 1, 0, 1,
-0.8919828, 1.233873, -1.010268, 0.8, 1, 0, 1,
-0.8897621, -0.9640391, -1.639354, 0.7921569, 1, 0, 1,
-0.8878325, -1.038662, -3.078695, 0.7882353, 1, 0, 1,
-0.8866051, 2.058458, -1.009475, 0.7803922, 1, 0, 1,
-0.8813472, 0.9192482, -0.01308589, 0.7764706, 1, 0, 1,
-0.8808173, 0.8781595, 0.0556309, 0.7686275, 1, 0, 1,
-0.8799637, -0.3394744, -1.940123, 0.7647059, 1, 0, 1,
-0.8729905, -1.209395, -1.486132, 0.7568628, 1, 0, 1,
-0.8717728, 0.03318053, -1.568438, 0.7529412, 1, 0, 1,
-0.8659571, 0.5541356, -1.420971, 0.7450981, 1, 0, 1,
-0.8655904, -0.2862794, 0.4940632, 0.7411765, 1, 0, 1,
-0.8568773, 0.6308906, -0.1751844, 0.7333333, 1, 0, 1,
-0.8516343, 0.3119963, -1.62598, 0.7294118, 1, 0, 1,
-0.8452293, -0.6225926, -1.831847, 0.7215686, 1, 0, 1,
-0.8408844, -0.1133108, -1.048195, 0.7176471, 1, 0, 1,
-0.8367392, 0.4877902, -1.66515, 0.7098039, 1, 0, 1,
-0.8358336, 2.913988, 0.4417076, 0.7058824, 1, 0, 1,
-0.8337702, -0.504222, -1.843231, 0.6980392, 1, 0, 1,
-0.8302758, 0.3092344, -0.7355826, 0.6901961, 1, 0, 1,
-0.8282434, 1.022973, -0.7911276, 0.6862745, 1, 0, 1,
-0.827346, -2.344725, -2.275006, 0.6784314, 1, 0, 1,
-0.8266964, 0.3891955, -1.799438, 0.6745098, 1, 0, 1,
-0.8205016, -0.7758833, -3.803428, 0.6666667, 1, 0, 1,
-0.8195832, 0.6423991, -1.22648, 0.6627451, 1, 0, 1,
-0.8149924, -0.3502784, -3.672644, 0.654902, 1, 0, 1,
-0.8043113, -0.8589652, -2.977473, 0.6509804, 1, 0, 1,
-0.8042338, -1.119944, -1.442256, 0.6431373, 1, 0, 1,
-0.8022073, 0.06729735, -1.16632, 0.6392157, 1, 0, 1,
-0.7950963, 0.9455352, -0.2990593, 0.6313726, 1, 0, 1,
-0.7950338, -1.019554, -1.352377, 0.627451, 1, 0, 1,
-0.7819464, 1.184213, 0.3760752, 0.6196079, 1, 0, 1,
-0.7815958, 0.1138942, -2.583773, 0.6156863, 1, 0, 1,
-0.7797784, 1.504301, -0.7202675, 0.6078432, 1, 0, 1,
-0.7709896, 0.6191129, -2.75268, 0.6039216, 1, 0, 1,
-0.7683854, -0.3360409, -3.000917, 0.5960785, 1, 0, 1,
-0.7680454, -0.7833417, -1.272621, 0.5882353, 1, 0, 1,
-0.7679271, 0.1094766, -1.835712, 0.5843138, 1, 0, 1,
-0.7665009, 0.569101, -2.085756, 0.5764706, 1, 0, 1,
-0.7657369, 0.933284, -0.759725, 0.572549, 1, 0, 1,
-0.7648736, -2.868559, -3.541824, 0.5647059, 1, 0, 1,
-0.7645104, 0.9993544, -0.594104, 0.5607843, 1, 0, 1,
-0.7633882, 0.420572, -3.120064, 0.5529412, 1, 0, 1,
-0.7618814, -0.05267607, -1.138205, 0.5490196, 1, 0, 1,
-0.7585204, -2.286076, -2.282071, 0.5411765, 1, 0, 1,
-0.7568721, -0.3304991, -1.723602, 0.5372549, 1, 0, 1,
-0.7566708, -1.550586, -2.928426, 0.5294118, 1, 0, 1,
-0.7564169, -1.593515, -2.61544, 0.5254902, 1, 0, 1,
-0.7554352, 0.5571268, -0.006221814, 0.5176471, 1, 0, 1,
-0.7546343, 1.776429, -0.2531347, 0.5137255, 1, 0, 1,
-0.7506135, 0.2302108, -1.592984, 0.5058824, 1, 0, 1,
-0.7429467, -0.5901282, -1.933927, 0.5019608, 1, 0, 1,
-0.7414126, 0.54561, -0.5938233, 0.4941176, 1, 0, 1,
-0.7401575, 0.142569, -1.09844, 0.4862745, 1, 0, 1,
-0.7372158, 1.256864, 0.4399965, 0.4823529, 1, 0, 1,
-0.7354844, -0.2722452, -1.706555, 0.4745098, 1, 0, 1,
-0.7351961, 0.9366365, 0.06513926, 0.4705882, 1, 0, 1,
-0.7326403, 1.004478, 1.163204, 0.4627451, 1, 0, 1,
-0.7290583, -0.4784261, -3.388941, 0.4588235, 1, 0, 1,
-0.7262853, -1.083841, -3.478817, 0.4509804, 1, 0, 1,
-0.7234569, -1.344819, -2.097501, 0.4470588, 1, 0, 1,
-0.7231338, 0.6794662, -0.1984042, 0.4392157, 1, 0, 1,
-0.7227749, 0.6045721, -1.401862, 0.4352941, 1, 0, 1,
-0.7179243, 0.5436923, 0.5522282, 0.427451, 1, 0, 1,
-0.715686, 0.2202978, -0.4612378, 0.4235294, 1, 0, 1,
-0.7125481, 0.02890902, 0.2781499, 0.4156863, 1, 0, 1,
-0.7061395, 0.2038478, 1.488091, 0.4117647, 1, 0, 1,
-0.6908029, 0.8082268, -1.27314, 0.4039216, 1, 0, 1,
-0.6813357, -0.759932, -2.051172, 0.3960784, 1, 0, 1,
-0.6726286, -0.7647421, -3.400481, 0.3921569, 1, 0, 1,
-0.6702937, 1.30854, 0.2833171, 0.3843137, 1, 0, 1,
-0.6685222, -0.5213734, -3.580704, 0.3803922, 1, 0, 1,
-0.6638675, 0.4132729, -1.271959, 0.372549, 1, 0, 1,
-0.6623197, -0.9212039, -2.815817, 0.3686275, 1, 0, 1,
-0.6605589, -0.3770862, -1.026019, 0.3607843, 1, 0, 1,
-0.6584175, -0.000403507, -0.8210949, 0.3568628, 1, 0, 1,
-0.6577096, -1.631466, -4.889434, 0.3490196, 1, 0, 1,
-0.6574785, -0.5410522, -2.46549, 0.345098, 1, 0, 1,
-0.6574745, -0.9162674, -2.173545, 0.3372549, 1, 0, 1,
-0.6566643, 0.5211421, -1.74237, 0.3333333, 1, 0, 1,
-0.6566427, -2.219156, -1.812927, 0.3254902, 1, 0, 1,
-0.6518902, 0.3687206, -1.12694, 0.3215686, 1, 0, 1,
-0.6439379, 0.2370952, -2.326163, 0.3137255, 1, 0, 1,
-0.6430773, -0.01836229, -2.224721, 0.3098039, 1, 0, 1,
-0.639523, 3.279454, 0.008459307, 0.3019608, 1, 0, 1,
-0.6257411, 0.2790585, -0.08853251, 0.2941177, 1, 0, 1,
-0.6255905, -0.2839619, -0.9211156, 0.2901961, 1, 0, 1,
-0.6215732, 0.783491, -0.6121232, 0.282353, 1, 0, 1,
-0.6209377, 0.1256721, -0.640579, 0.2784314, 1, 0, 1,
-0.6204723, 0.05826508, -2.272762, 0.2705882, 1, 0, 1,
-0.6187, 0.7290556, -0.03854621, 0.2666667, 1, 0, 1,
-0.6112067, -0.6282594, -3.619369, 0.2588235, 1, 0, 1,
-0.5993546, 1.209859, -2.411412, 0.254902, 1, 0, 1,
-0.5980327, -1.218494, -1.956888, 0.2470588, 1, 0, 1,
-0.5966311, -1.798529, -2.173488, 0.2431373, 1, 0, 1,
-0.5931333, -1.647281, -2.966441, 0.2352941, 1, 0, 1,
-0.5875245, -0.6798384, -2.091214, 0.2313726, 1, 0, 1,
-0.5849172, -1.16616, -3.067656, 0.2235294, 1, 0, 1,
-0.5817477, 0.4151846, -0.0216165, 0.2196078, 1, 0, 1,
-0.5811763, -0.4941541, -3.43316, 0.2117647, 1, 0, 1,
-0.5765617, 0.4177841, -0.3721829, 0.2078431, 1, 0, 1,
-0.5759668, -0.8957586, -1.853565, 0.2, 1, 0, 1,
-0.5710098, -0.7272092, -2.757523, 0.1921569, 1, 0, 1,
-0.5700103, 0.9924188, 1.710613, 0.1882353, 1, 0, 1,
-0.5688463, 0.01547065, -2.195838, 0.1803922, 1, 0, 1,
-0.5653811, 0.2270654, -1.121079, 0.1764706, 1, 0, 1,
-0.5620776, -0.03677173, -1.667211, 0.1686275, 1, 0, 1,
-0.5607337, -0.7115958, -3.054039, 0.1647059, 1, 0, 1,
-0.5603881, 0.9672307, -0.4885988, 0.1568628, 1, 0, 1,
-0.5559443, -0.8124548, -2.369978, 0.1529412, 1, 0, 1,
-0.5546833, 1.429036, -0.9841293, 0.145098, 1, 0, 1,
-0.5528663, 1.107092, -1.945872, 0.1411765, 1, 0, 1,
-0.5453048, -0.5448501, -2.624705, 0.1333333, 1, 0, 1,
-0.5427155, -1.639714, -1.822834, 0.1294118, 1, 0, 1,
-0.5424215, 0.9057853, 1.115696, 0.1215686, 1, 0, 1,
-0.5379344, -0.002927504, -1.26755, 0.1176471, 1, 0, 1,
-0.5366794, -0.2990335, -1.492641, 0.1098039, 1, 0, 1,
-0.5336396, -0.9121528, -3.228392, 0.1058824, 1, 0, 1,
-0.5272121, -0.9020191, -1.553612, 0.09803922, 1, 0, 1,
-0.5229797, -1.06474, -1.249231, 0.09019608, 1, 0, 1,
-0.5157759, 0.1552708, -1.93045, 0.08627451, 1, 0, 1,
-0.5150076, -0.3260228, -1.439711, 0.07843138, 1, 0, 1,
-0.5140111, -0.7144306, -1.750661, 0.07450981, 1, 0, 1,
-0.5128634, -0.9489591, -3.884909, 0.06666667, 1, 0, 1,
-0.5120956, -1.862293, -3.735359, 0.0627451, 1, 0, 1,
-0.5103627, 0.7547236, -0.1999123, 0.05490196, 1, 0, 1,
-0.5090423, -0.6679516, -1.562771, 0.05098039, 1, 0, 1,
-0.5083607, 0.9070712, -0.2771424, 0.04313726, 1, 0, 1,
-0.507408, -0.8807654, -3.356086, 0.03921569, 1, 0, 1,
-0.4985063, 0.5849237, -3.233219, 0.03137255, 1, 0, 1,
-0.4927122, 0.1768304, -1.305067, 0.02745098, 1, 0, 1,
-0.4904735, -0.07148601, 0.05682506, 0.01960784, 1, 0, 1,
-0.489823, -1.298102, -2.485958, 0.01568628, 1, 0, 1,
-0.4881104, -0.5852063, -1.694634, 0.007843138, 1, 0, 1,
-0.4842085, 0.9684956, -0.6901591, 0.003921569, 1, 0, 1,
-0.4840866, -0.2668587, -1.417357, 0, 1, 0.003921569, 1,
-0.4813076, 1.488723, -2.241042, 0, 1, 0.01176471, 1,
-0.4802325, 0.2673401, 0.03190392, 0, 1, 0.01568628, 1,
-0.4799754, -1.187719, -2.618387, 0, 1, 0.02352941, 1,
-0.4762021, -0.8877859, -3.457078, 0, 1, 0.02745098, 1,
-0.4761555, 0.5808435, -0.6904538, 0, 1, 0.03529412, 1,
-0.4726787, -0.2547886, -1.897343, 0, 1, 0.03921569, 1,
-0.4726013, -0.9752561, -4.374043, 0, 1, 0.04705882, 1,
-0.4724768, 0.8619578, -0.7696373, 0, 1, 0.05098039, 1,
-0.4655366, -0.0332323, 0.8797665, 0, 1, 0.05882353, 1,
-0.4636938, 0.9382268, -0.6099092, 0, 1, 0.0627451, 1,
-0.4635869, -1.611069, -3.294578, 0, 1, 0.07058824, 1,
-0.4612136, 1.546068, -1.124334, 0, 1, 0.07450981, 1,
-0.4550712, -0.5998993, -1.121015, 0, 1, 0.08235294, 1,
-0.4481597, 0.4328777, 0.8804318, 0, 1, 0.08627451, 1,
-0.443745, 0.5999903, 0.3569287, 0, 1, 0.09411765, 1,
-0.4431289, 0.4241405, -1.64753, 0, 1, 0.1019608, 1,
-0.4404742, 0.4594533, -2.10056, 0, 1, 0.1058824, 1,
-0.437421, 1.468692, -0.2043452, 0, 1, 0.1137255, 1,
-0.4329991, 1.270296, -0.9117524, 0, 1, 0.1176471, 1,
-0.4325311, 0.4845131, -2.620777, 0, 1, 0.1254902, 1,
-0.4309368, -0.6335117, -2.341106, 0, 1, 0.1294118, 1,
-0.425123, 0.3188091, 1.156154, 0, 1, 0.1372549, 1,
-0.4224586, -0.4334357, -2.242747, 0, 1, 0.1411765, 1,
-0.4211054, 1.24584, -0.8505429, 0, 1, 0.1490196, 1,
-0.4195417, 0.9487348, 0.1821501, 0, 1, 0.1529412, 1,
-0.4147193, -0.7607042, -3.050308, 0, 1, 0.1607843, 1,
-0.4109268, 0.5253388, -2.409078, 0, 1, 0.1647059, 1,
-0.4004531, -0.5846754, -2.860927, 0, 1, 0.172549, 1,
-0.3981681, 0.5655822, 0.07403117, 0, 1, 0.1764706, 1,
-0.3954875, 0.5677544, -0.8725489, 0, 1, 0.1843137, 1,
-0.3892267, 1.060952, 0.4471369, 0, 1, 0.1882353, 1,
-0.3779831, 0.0400024, -1.135843, 0, 1, 0.1960784, 1,
-0.3755207, 0.3627943, 0.5742899, 0, 1, 0.2039216, 1,
-0.3744358, 0.9406637, -0.09967672, 0, 1, 0.2078431, 1,
-0.3734099, 1.235824, -0.8044813, 0, 1, 0.2156863, 1,
-0.3721308, -1.042522, -1.670555, 0, 1, 0.2196078, 1,
-0.3697823, -1.30142, -1.898263, 0, 1, 0.227451, 1,
-0.3596018, 1.626722, 0.8824758, 0, 1, 0.2313726, 1,
-0.3591381, -0.5677239, -0.5880122, 0, 1, 0.2392157, 1,
-0.3578481, 0.2723726, -2.62535, 0, 1, 0.2431373, 1,
-0.3566414, 2.452001, -0.8910894, 0, 1, 0.2509804, 1,
-0.3564144, -0.2419977, -3.303457, 0, 1, 0.254902, 1,
-0.351215, -0.3984378, -1.933546, 0, 1, 0.2627451, 1,
-0.3494875, 0.1711094, -2.031431, 0, 1, 0.2666667, 1,
-0.3471686, -0.1885817, -3.088057, 0, 1, 0.2745098, 1,
-0.3454183, -0.4480135, -1.812356, 0, 1, 0.2784314, 1,
-0.3421481, -0.6473245, -2.156525, 0, 1, 0.2862745, 1,
-0.3410949, 2.183953, -0.245045, 0, 1, 0.2901961, 1,
-0.3390332, 1.28609, -1.311961, 0, 1, 0.2980392, 1,
-0.3380642, -0.4376038, -2.853594, 0, 1, 0.3058824, 1,
-0.3324345, -0.2169137, -2.207354, 0, 1, 0.3098039, 1,
-0.3306654, 0.6715161, -1.95019, 0, 1, 0.3176471, 1,
-0.3299421, -0.2948765, -4.188466, 0, 1, 0.3215686, 1,
-0.3299176, -0.4863997, -1.613297, 0, 1, 0.3294118, 1,
-0.3289039, 0.8728989, -1.492999, 0, 1, 0.3333333, 1,
-0.3267961, 1.680291, -0.9190937, 0, 1, 0.3411765, 1,
-0.3228954, 0.7870871, -1.639244, 0, 1, 0.345098, 1,
-0.3192787, -0.9347678, -3.562595, 0, 1, 0.3529412, 1,
-0.3174416, -0.5776797, -0.4719127, 0, 1, 0.3568628, 1,
-0.3132949, -0.5108326, -1.376853, 0, 1, 0.3647059, 1,
-0.3112732, 0.9624698, -1.060851, 0, 1, 0.3686275, 1,
-0.304166, 0.6017292, -0.5102896, 0, 1, 0.3764706, 1,
-0.3016555, 0.6510772, -1.075677, 0, 1, 0.3803922, 1,
-0.2967969, -0.1177415, -2.277458, 0, 1, 0.3882353, 1,
-0.2943988, -0.1356604, -1.178557, 0, 1, 0.3921569, 1,
-0.2921132, -2.088886, -6.173774, 0, 1, 0.4, 1,
-0.2907532, 0.1577301, 0.1860926, 0, 1, 0.4078431, 1,
-0.2804144, 1.264639, -0.709011, 0, 1, 0.4117647, 1,
-0.273919, 0.479841, 0.3712096, 0, 1, 0.4196078, 1,
-0.268348, 0.06517716, -3.540694, 0, 1, 0.4235294, 1,
-0.2669335, 0.2986411, 0.3065436, 0, 1, 0.4313726, 1,
-0.2655841, 2.50388, 0.1686613, 0, 1, 0.4352941, 1,
-0.2622655, -0.6173644, -3.450531, 0, 1, 0.4431373, 1,
-0.2609953, 0.2902794, 0.8662319, 0, 1, 0.4470588, 1,
-0.260584, 0.04829048, 0.89389, 0, 1, 0.454902, 1,
-0.2590045, 1.509766, 0.807267, 0, 1, 0.4588235, 1,
-0.2573525, -0.7676229, -2.62131, 0, 1, 0.4666667, 1,
-0.2569312, 0.610112, 1.717604, 0, 1, 0.4705882, 1,
-0.2560368, -1.070947, -3.132153, 0, 1, 0.4784314, 1,
-0.2462687, 0.6391479, -0.4447252, 0, 1, 0.4823529, 1,
-0.2389449, -0.004577407, 0.01073752, 0, 1, 0.4901961, 1,
-0.2362364, -0.1999321, 0.1422714, 0, 1, 0.4941176, 1,
-0.235892, -0.9956403, -4.926398, 0, 1, 0.5019608, 1,
-0.2299, 0.8465158, -0.9275781, 0, 1, 0.509804, 1,
-0.2289415, 1.164071, -0.1132721, 0, 1, 0.5137255, 1,
-0.2247599, -0.2828528, -0.5849444, 0, 1, 0.5215687, 1,
-0.2245823, -0.7465738, -2.809231, 0, 1, 0.5254902, 1,
-0.2224609, 0.4682506, -1.685971, 0, 1, 0.5333334, 1,
-0.218633, -0.8220366, -5.486874, 0, 1, 0.5372549, 1,
-0.217869, 0.3680685, -0.6955553, 0, 1, 0.5450981, 1,
-0.2173757, -0.3770198, -3.090961, 0, 1, 0.5490196, 1,
-0.2122371, -0.8671275, -1.647686, 0, 1, 0.5568628, 1,
-0.2112191, -0.2248933, -0.9828621, 0, 1, 0.5607843, 1,
-0.2094387, 0.3422236, -2.696588, 0, 1, 0.5686275, 1,
-0.2005746, -0.4550415, -0.9871503, 0, 1, 0.572549, 1,
-0.2000043, 0.2849759, 1.134742, 0, 1, 0.5803922, 1,
-0.198352, 1.157957, -0.05728516, 0, 1, 0.5843138, 1,
-0.1964229, 0.07495249, -1.849745, 0, 1, 0.5921569, 1,
-0.1955833, 0.1834142, -1.251257, 0, 1, 0.5960785, 1,
-0.1940537, 1.652035, -0.3133291, 0, 1, 0.6039216, 1,
-0.1935489, 1.620863, -1.148606, 0, 1, 0.6117647, 1,
-0.1919636, 0.5917278, 0.01049439, 0, 1, 0.6156863, 1,
-0.1906793, 0.3560896, 0.1358192, 0, 1, 0.6235294, 1,
-0.1889485, 0.2241433, 0.05941267, 0, 1, 0.627451, 1,
-0.1865886, 0.5251165, -0.02049798, 0, 1, 0.6352941, 1,
-0.1804323, -0.8068884, -2.844236, 0, 1, 0.6392157, 1,
-0.1792194, -0.5927473, -2.679351, 0, 1, 0.6470588, 1,
-0.1785312, 0.8855426, 1.249988, 0, 1, 0.6509804, 1,
-0.1781953, -0.8229853, -0.9120021, 0, 1, 0.6588235, 1,
-0.1778222, 0.6577354, 0.755727, 0, 1, 0.6627451, 1,
-0.1760603, 0.2148658, -2.480532, 0, 1, 0.6705883, 1,
-0.1759811, -0.6447947, -2.25126, 0, 1, 0.6745098, 1,
-0.1716893, -0.08514629, -3.438505, 0, 1, 0.682353, 1,
-0.1704114, 0.3987737, -0.5176003, 0, 1, 0.6862745, 1,
-0.16913, 0.5933427, -0.9036235, 0, 1, 0.6941177, 1,
-0.1654873, -0.4292072, -2.331016, 0, 1, 0.7019608, 1,
-0.1652579, -0.1843736, -2.675365, 0, 1, 0.7058824, 1,
-0.1625911, 0.5349252, 0.4131505, 0, 1, 0.7137255, 1,
-0.1602442, 0.3467818, -0.3142149, 0, 1, 0.7176471, 1,
-0.1594427, 0.9749526, 0.2181176, 0, 1, 0.7254902, 1,
-0.1555365, 1.07476, -0.7334099, 0, 1, 0.7294118, 1,
-0.1537197, -0.8908161, -3.279065, 0, 1, 0.7372549, 1,
-0.1520162, 0.9764161, 1.657887, 0, 1, 0.7411765, 1,
-0.1518168, -0.5521433, -1.575648, 0, 1, 0.7490196, 1,
-0.1507667, 0.5060692, 0.70609, 0, 1, 0.7529412, 1,
-0.1481807, 0.2426002, -1.042663, 0, 1, 0.7607843, 1,
-0.1463371, -0.001329167, -1.851119, 0, 1, 0.7647059, 1,
-0.144891, -1.697528, -3.553191, 0, 1, 0.772549, 1,
-0.1440972, -1.808338, -2.891007, 0, 1, 0.7764706, 1,
-0.1434965, -1.342143, -2.299237, 0, 1, 0.7843137, 1,
-0.1415552, -0.5598227, -4.126378, 0, 1, 0.7882353, 1,
-0.1278269, -0.4053189, -2.876148, 0, 1, 0.7960784, 1,
-0.1222902, -0.339443, -4.806307, 0, 1, 0.8039216, 1,
-0.1193578, -0.103897, -1.730322, 0, 1, 0.8078431, 1,
-0.1181285, 0.01408412, -2.797246, 0, 1, 0.8156863, 1,
-0.1157091, 1.560951, -1.305915, 0, 1, 0.8196079, 1,
-0.114933, -0.1974456, -2.193138, 0, 1, 0.827451, 1,
-0.1133945, -0.3960239, -2.739267, 0, 1, 0.8313726, 1,
-0.1124829, 0.6197335, -2.222056, 0, 1, 0.8392157, 1,
-0.1101247, -1.767375, -4.916751, 0, 1, 0.8431373, 1,
-0.1079147, -0.02227733, -1.190834, 0, 1, 0.8509804, 1,
-0.10573, 0.7544445, -0.4820359, 0, 1, 0.854902, 1,
-0.1042503, -0.3447614, -1.010686, 0, 1, 0.8627451, 1,
-0.1036039, 0.542195, -1.992895, 0, 1, 0.8666667, 1,
-0.1020977, 1.19494, -0.3502506, 0, 1, 0.8745098, 1,
-0.1016525, 0.9228318, 0.1627493, 0, 1, 0.8784314, 1,
-0.1010695, -1.209365, -4.470366, 0, 1, 0.8862745, 1,
-0.09974983, 1.052352, -0.4706789, 0, 1, 0.8901961, 1,
-0.09790398, -3.137051, -4.018779, 0, 1, 0.8980392, 1,
-0.09658118, -0.3069822, -3.089858, 0, 1, 0.9058824, 1,
-0.09607834, 1.508368, -0.3881944, 0, 1, 0.9098039, 1,
-0.09165701, 0.2609222, -0.3483096, 0, 1, 0.9176471, 1,
-0.0903279, 0.8183815, -2.773069, 0, 1, 0.9215686, 1,
-0.09009742, -1.114932, -3.391557, 0, 1, 0.9294118, 1,
-0.08519372, -0.1996416, -3.611343, 0, 1, 0.9333333, 1,
-0.08205987, -0.4047503, -2.991833, 0, 1, 0.9411765, 1,
-0.07802947, 0.6244253, -0.5904196, 0, 1, 0.945098, 1,
-0.07636444, -0.1499799, -1.131337, 0, 1, 0.9529412, 1,
-0.07457232, 0.8845142, 1.080281, 0, 1, 0.9568627, 1,
-0.07309799, -0.607842, -4.156244, 0, 1, 0.9647059, 1,
-0.06933373, -0.3450042, -2.458427, 0, 1, 0.9686275, 1,
-0.06546521, -0.3322432, -4.130999, 0, 1, 0.9764706, 1,
-0.06086081, -0.7823333, -2.549933, 0, 1, 0.9803922, 1,
-0.06077819, 1.616994, -0.8300551, 0, 1, 0.9882353, 1,
-0.05733048, 0.08444368, -1.76603, 0, 1, 0.9921569, 1,
-0.05650307, -0.2263057, -2.777848, 0, 1, 1, 1,
-0.05552302, 1.019491, 1.057062, 0, 0.9921569, 1, 1,
-0.05381026, -1.967034, -2.034169, 0, 0.9882353, 1, 1,
-0.04647643, 0.3704515, -0.1469359, 0, 0.9803922, 1, 1,
-0.04532374, 1.546759, -0.7333668, 0, 0.9764706, 1, 1,
-0.04275391, -0.2510029, -2.86509, 0, 0.9686275, 1, 1,
-0.04052059, -0.4948759, -1.9073, 0, 0.9647059, 1, 1,
-0.03962988, -0.3438113, -2.215704, 0, 0.9568627, 1, 1,
-0.03514853, -0.4731249, -0.7049224, 0, 0.9529412, 1, 1,
-0.03471223, 0.2948754, 0.392953, 0, 0.945098, 1, 1,
-0.03166448, -0.2394143, -2.379065, 0, 0.9411765, 1, 1,
-0.03123225, 1.52156, -0.8820398, 0, 0.9333333, 1, 1,
-0.02490447, 0.08856462, 0.00396635, 0, 0.9294118, 1, 1,
-0.02469275, -1.619995, -1.657578, 0, 0.9215686, 1, 1,
-0.01833382, 0.04173537, 0.3309292, 0, 0.9176471, 1, 1,
-0.01695171, -0.7977143, -2.968969, 0, 0.9098039, 1, 1,
-0.01334696, 0.009706863, -0.1827889, 0, 0.9058824, 1, 1,
-0.01259853, 0.9126082, 0.8106025, 0, 0.8980392, 1, 1,
-0.01070791, -0.1296357, -1.243229, 0, 0.8901961, 1, 1,
-0.009382684, -0.7226818, -4.511443, 0, 0.8862745, 1, 1,
-0.009061554, -1.309611, -3.383522, 0, 0.8784314, 1, 1,
7.032729e-05, -0.3755845, 4.724476, 0, 0.8745098, 1, 1,
0.002023877, 0.3735645, -0.6063876, 0, 0.8666667, 1, 1,
0.002197297, -1.14261, 3.075482, 0, 0.8627451, 1, 1,
0.005635702, 0.2886794, -0.304119, 0, 0.854902, 1, 1,
0.009037417, 1.268207, 0.9253422, 0, 0.8509804, 1, 1,
0.009782963, 0.2935747, 0.1774526, 0, 0.8431373, 1, 1,
0.01071294, 1.50392, -0.4846574, 0, 0.8392157, 1, 1,
0.01431157, 1.220785, -0.1785197, 0, 0.8313726, 1, 1,
0.01971006, 1.214916, 0.9265153, 0, 0.827451, 1, 1,
0.02178826, -0.4284715, 5.507886, 0, 0.8196079, 1, 1,
0.02289564, 0.4078125, -0.7759588, 0, 0.8156863, 1, 1,
0.02849055, 0.6443823, 0.8217514, 0, 0.8078431, 1, 1,
0.03204841, 0.3964183, -1.688422, 0, 0.8039216, 1, 1,
0.03306947, 0.6093689, 0.7452754, 0, 0.7960784, 1, 1,
0.03355862, -1.449151, 4.191435, 0, 0.7882353, 1, 1,
0.03520693, -0.9074989, 2.454592, 0, 0.7843137, 1, 1,
0.03747172, 0.06166843, -1.848879, 0, 0.7764706, 1, 1,
0.03881074, -0.7624735, 3.93986, 0, 0.772549, 1, 1,
0.04340405, 0.3510544, -0.1335973, 0, 0.7647059, 1, 1,
0.05076809, 1.61374, 1.529456, 0, 0.7607843, 1, 1,
0.05499338, -1.742842, 1.282493, 0, 0.7529412, 1, 1,
0.05585134, 0.05402961, -0.2199408, 0, 0.7490196, 1, 1,
0.0579405, 1.161358, 1.104499, 0, 0.7411765, 1, 1,
0.05837474, -1.403689, 3.360169, 0, 0.7372549, 1, 1,
0.06310621, 1.029896, 0.708218, 0, 0.7294118, 1, 1,
0.06653, -1.400318, 3.113619, 0, 0.7254902, 1, 1,
0.06886521, 0.7395828, -0.5369674, 0, 0.7176471, 1, 1,
0.06944574, -1.14765, 1.539144, 0, 0.7137255, 1, 1,
0.07080623, -0.03311139, 2.728173, 0, 0.7058824, 1, 1,
0.07698875, 0.3258111, 0.1780937, 0, 0.6980392, 1, 1,
0.07824308, -0.1881077, 3.477453, 0, 0.6941177, 1, 1,
0.08905458, -0.7908841, 3.130807, 0, 0.6862745, 1, 1,
0.09016811, -1.017746, 2.072491, 0, 0.682353, 1, 1,
0.09976639, 0.06928912, -0.1462695, 0, 0.6745098, 1, 1,
0.1017774, 2.609747, 0.2624788, 0, 0.6705883, 1, 1,
0.1034363, 0.09887017, 1.015063, 0, 0.6627451, 1, 1,
0.1048368, -2.306323, 5.072986, 0, 0.6588235, 1, 1,
0.1068765, 1.037494, 0.401451, 0, 0.6509804, 1, 1,
0.1110795, -0.7695543, 2.375993, 0, 0.6470588, 1, 1,
0.1193886, 0.8988252, 0.05447749, 0, 0.6392157, 1, 1,
0.1223589, -0.6271513, 1.530184, 0, 0.6352941, 1, 1,
0.1241202, 0.3202761, -0.9519244, 0, 0.627451, 1, 1,
0.1294091, -1.594185, 2.241562, 0, 0.6235294, 1, 1,
0.1294499, -0.02613474, 1.905086, 0, 0.6156863, 1, 1,
0.132109, -0.4939472, 3.139278, 0, 0.6117647, 1, 1,
0.1337847, 0.2899242, -1.590298, 0, 0.6039216, 1, 1,
0.1360699, 1.432228, 0.4720787, 0, 0.5960785, 1, 1,
0.1371049, 0.1981657, 1.29192, 0, 0.5921569, 1, 1,
0.1381653, 0.293311, 0.4243608, 0, 0.5843138, 1, 1,
0.1410323, 1.432852, 0.660841, 0, 0.5803922, 1, 1,
0.1435956, -1.171454, 4.448523, 0, 0.572549, 1, 1,
0.1483757, -1.27883, 2.952917, 0, 0.5686275, 1, 1,
0.1519702, -0.4488195, 2.870939, 0, 0.5607843, 1, 1,
0.1590544, 1.134125, 0.4674364, 0, 0.5568628, 1, 1,
0.1600294, -1.405341, 0.5599229, 0, 0.5490196, 1, 1,
0.1605759, 0.5254217, 1.479794, 0, 0.5450981, 1, 1,
0.1632994, 0.221271, 0.296208, 0, 0.5372549, 1, 1,
0.1644989, 1.258394, -0.9793038, 0, 0.5333334, 1, 1,
0.1659001, -0.2378606, 2.843068, 0, 0.5254902, 1, 1,
0.1671956, 0.3304336, 0.352793, 0, 0.5215687, 1, 1,
0.1690457, -1.59483, 2.988112, 0, 0.5137255, 1, 1,
0.1714027, -0.07186291, 1.812905, 0, 0.509804, 1, 1,
0.1746945, -0.9199861, 4.998934, 0, 0.5019608, 1, 1,
0.1748676, -0.9132991, 3.669043, 0, 0.4941176, 1, 1,
0.1788223, 0.4271144, 1.033953, 0, 0.4901961, 1, 1,
0.1812863, -1.527696, 3.264726, 0, 0.4823529, 1, 1,
0.1814247, -0.9380824, 2.285461, 0, 0.4784314, 1, 1,
0.1829389, 0.008074122, 2.551345, 0, 0.4705882, 1, 1,
0.1853082, -0.430345, 1.62187, 0, 0.4666667, 1, 1,
0.1862231, -0.9445966, 2.857744, 0, 0.4588235, 1, 1,
0.1899445, -2.009185, 2.423867, 0, 0.454902, 1, 1,
0.190674, -0.7476545, 3.728027, 0, 0.4470588, 1, 1,
0.1914826, 0.06798169, 1.712147, 0, 0.4431373, 1, 1,
0.192013, -0.6681164, 3.054114, 0, 0.4352941, 1, 1,
0.1949531, -1.060219, 2.483927, 0, 0.4313726, 1, 1,
0.197639, 0.8613937, 1.192507, 0, 0.4235294, 1, 1,
0.1998526, -1.814653, 2.403972, 0, 0.4196078, 1, 1,
0.2018374, -0.4532022, 2.97496, 0, 0.4117647, 1, 1,
0.2025211, 0.5011595, -0.9402862, 0, 0.4078431, 1, 1,
0.2034473, 0.752364, 0.7192699, 0, 0.4, 1, 1,
0.2056955, 0.21199, 1.122519, 0, 0.3921569, 1, 1,
0.2057815, -0.8231212, 3.77205, 0, 0.3882353, 1, 1,
0.2059261, -0.1745354, 2.51117, 0, 0.3803922, 1, 1,
0.2081892, 0.9521016, 1.464445, 0, 0.3764706, 1, 1,
0.210735, -0.8990378, 4.945571, 0, 0.3686275, 1, 1,
0.2151006, 0.3642791, -0.1954484, 0, 0.3647059, 1, 1,
0.2175682, -0.4196593, 2.036882, 0, 0.3568628, 1, 1,
0.2189538, 1.241836, 0.564585, 0, 0.3529412, 1, 1,
0.2193256, 0.9625249, 1.494385, 0, 0.345098, 1, 1,
0.225803, 0.7987199, -0.8746622, 0, 0.3411765, 1, 1,
0.226484, -1.16313, 2.941686, 0, 0.3333333, 1, 1,
0.2288621, -0.2356776, 1.79491, 0, 0.3294118, 1, 1,
0.229585, -1.311168, 2.992877, 0, 0.3215686, 1, 1,
0.2307395, 0.1665824, 0.9904388, 0, 0.3176471, 1, 1,
0.2323131, 0.147473, 1.256558, 0, 0.3098039, 1, 1,
0.232579, -0.6527858, 1.258963, 0, 0.3058824, 1, 1,
0.237028, 0.6553102, -1.218125, 0, 0.2980392, 1, 1,
0.2475252, -1.499976, 5.24506, 0, 0.2901961, 1, 1,
0.2495393, -0.1781413, 3.448541, 0, 0.2862745, 1, 1,
0.2532908, 1.543495, 0.9454528, 0, 0.2784314, 1, 1,
0.2599545, -0.03957587, 0.6454747, 0, 0.2745098, 1, 1,
0.2628353, 1.390924, 1.493067, 0, 0.2666667, 1, 1,
0.2630607, -1.639653, 2.293357, 0, 0.2627451, 1, 1,
0.2647285, 0.221713, 1.341868, 0, 0.254902, 1, 1,
0.2671092, -0.8285602, 2.157982, 0, 0.2509804, 1, 1,
0.2680467, -1.250208, 3.980926, 0, 0.2431373, 1, 1,
0.2726048, -0.2112849, 1.505868, 0, 0.2392157, 1, 1,
0.2743341, -0.7219349, 2.409338, 0, 0.2313726, 1, 1,
0.2746743, 0.07038899, 1.10306, 0, 0.227451, 1, 1,
0.282194, 0.530256, 0.8947611, 0, 0.2196078, 1, 1,
0.2861886, 1.183849, -0.8821368, 0, 0.2156863, 1, 1,
0.2869682, 1.231297, -0.1553211, 0, 0.2078431, 1, 1,
0.2897814, -1.1664, 3.635752, 0, 0.2039216, 1, 1,
0.2903425, -1.047548, 3.328637, 0, 0.1960784, 1, 1,
0.2915712, -1.210532, 1.817286, 0, 0.1882353, 1, 1,
0.2924273, 0.7188792, 1.269318, 0, 0.1843137, 1, 1,
0.2955768, 0.744305, -0.692363, 0, 0.1764706, 1, 1,
0.2955812, 0.2476093, 1.783955, 0, 0.172549, 1, 1,
0.2976178, -0.04476003, 2.42863, 0, 0.1647059, 1, 1,
0.300955, -0.0439394, 2.852157, 0, 0.1607843, 1, 1,
0.3029764, 1.226733, -0.2021487, 0, 0.1529412, 1, 1,
0.3036736, -0.07035196, 2.217498, 0, 0.1490196, 1, 1,
0.3081264, -1.04486, 1.414233, 0, 0.1411765, 1, 1,
0.3081919, 1.078697, 1.519969, 0, 0.1372549, 1, 1,
0.3109117, -0.677628, 4.129831, 0, 0.1294118, 1, 1,
0.3136181, 0.3098, -0.01067472, 0, 0.1254902, 1, 1,
0.3138855, 0.8360472, 1.567302, 0, 0.1176471, 1, 1,
0.3152603, -0.4471662, 2.89503, 0, 0.1137255, 1, 1,
0.3153494, 0.6071028, -0.03411407, 0, 0.1058824, 1, 1,
0.3204907, 1.376513, 0.7129364, 0, 0.09803922, 1, 1,
0.3237595, -1.443683, 2.965277, 0, 0.09411765, 1, 1,
0.3308343, -0.7014986, 4.811233, 0, 0.08627451, 1, 1,
0.331739, -0.0106349, 2.089598, 0, 0.08235294, 1, 1,
0.3339136, -0.1546189, 2.532068, 0, 0.07450981, 1, 1,
0.3380018, -0.8799211, 3.364846, 0, 0.07058824, 1, 1,
0.3384809, -0.7488326, 3.474739, 0, 0.0627451, 1, 1,
0.3387555, 0.625193, 0.2280808, 0, 0.05882353, 1, 1,
0.3434386, -1.021478, 1.478435, 0, 0.05098039, 1, 1,
0.3450032, -0.690645, 1.407366, 0, 0.04705882, 1, 1,
0.3479788, -1.16186, 3.953264, 0, 0.03921569, 1, 1,
0.3481819, -0.8268518, 0.2761109, 0, 0.03529412, 1, 1,
0.3511986, -1.038379, 4.881374, 0, 0.02745098, 1, 1,
0.3628164, 1.098276, 0.422881, 0, 0.02352941, 1, 1,
0.3633666, 0.4233079, -1.107008, 0, 0.01568628, 1, 1,
0.3703879, 0.1935676, -0.2453724, 0, 0.01176471, 1, 1,
0.3761386, 0.9435179, 1.591534, 0, 0.003921569, 1, 1,
0.377881, -0.05875627, 2.422714, 0.003921569, 0, 1, 1,
0.3818347, -1.858196, 1.551949, 0.007843138, 0, 1, 1,
0.3877641, 0.5058689, 0.9632323, 0.01568628, 0, 1, 1,
0.3934312, 0.8260587, 1.297434, 0.01960784, 0, 1, 1,
0.3962252, 1.583222, -0.4099241, 0.02745098, 0, 1, 1,
0.3969952, -0.976881, 2.53235, 0.03137255, 0, 1, 1,
0.3975879, 0.3431352, 0.6662109, 0.03921569, 0, 1, 1,
0.39798, 0.1629927, 1.350238, 0.04313726, 0, 1, 1,
0.3987188, -0.1232924, 1.08708, 0.05098039, 0, 1, 1,
0.399009, -0.5508918, 0.8351817, 0.05490196, 0, 1, 1,
0.4021095, 0.1559309, 0.1287303, 0.0627451, 0, 1, 1,
0.4078319, -1.2806, 4.362342, 0.06666667, 0, 1, 1,
0.4090038, -1.373879, 0.8757775, 0.07450981, 0, 1, 1,
0.4096613, -0.9621477, 4.304589, 0.07843138, 0, 1, 1,
0.4118286, 0.282922, -0.518892, 0.08627451, 0, 1, 1,
0.4164709, 0.5922195, 0.9085717, 0.09019608, 0, 1, 1,
0.4196921, -0.2417437, 1.961707, 0.09803922, 0, 1, 1,
0.4197786, 0.3546121, 2.239142, 0.1058824, 0, 1, 1,
0.4199851, 0.2168099, 2.131602, 0.1098039, 0, 1, 1,
0.4352832, 0.7172639, -1.163818, 0.1176471, 0, 1, 1,
0.4379713, -0.9292279, 2.800848, 0.1215686, 0, 1, 1,
0.4404422, 1.375535, 2.177256, 0.1294118, 0, 1, 1,
0.443102, -0.007073138, 2.972346, 0.1333333, 0, 1, 1,
0.4450392, -1.435241, 3.294499, 0.1411765, 0, 1, 1,
0.4485579, 1.220864, 0.1311782, 0.145098, 0, 1, 1,
0.4488871, 0.101633, 0.3046057, 0.1529412, 0, 1, 1,
0.4499263, -0.6939899, 0.1747177, 0.1568628, 0, 1, 1,
0.4513013, -0.1698065, 1.64348, 0.1647059, 0, 1, 1,
0.4531665, 0.6175341, 2.584336, 0.1686275, 0, 1, 1,
0.4548107, -0.7570292, 3.171005, 0.1764706, 0, 1, 1,
0.4641449, 0.6670195, -1.322811, 0.1803922, 0, 1, 1,
0.4674472, 0.2363741, 1.469195, 0.1882353, 0, 1, 1,
0.4716369, -0.2005495, 3.206352, 0.1921569, 0, 1, 1,
0.4819081, 0.9204311, 2.276379, 0.2, 0, 1, 1,
0.4828299, 1.596511, 1.036095, 0.2078431, 0, 1, 1,
0.4829897, -0.7893693, 3.438526, 0.2117647, 0, 1, 1,
0.4854872, -0.4689737, 0.7103599, 0.2196078, 0, 1, 1,
0.4929058, -1.385251, 3.291665, 0.2235294, 0, 1, 1,
0.4986449, -1.204221, 4.505497, 0.2313726, 0, 1, 1,
0.5028346, -1.477508, 2.566515, 0.2352941, 0, 1, 1,
0.503832, -0.1562331, 2.106446, 0.2431373, 0, 1, 1,
0.5061026, 1.410903, 1.095876, 0.2470588, 0, 1, 1,
0.5064263, 2.412283, 0.5380986, 0.254902, 0, 1, 1,
0.5065901, -1.137814, 2.092719, 0.2588235, 0, 1, 1,
0.5244926, 0.04229173, 2.938491, 0.2666667, 0, 1, 1,
0.5268808, -1.178154, 4.048182, 0.2705882, 0, 1, 1,
0.5332827, -0.9370955, 2.239724, 0.2784314, 0, 1, 1,
0.5361331, 0.4033159, 1.738667, 0.282353, 0, 1, 1,
0.5374989, -0.2000018, 0.5267684, 0.2901961, 0, 1, 1,
0.5407705, -0.3256913, 2.765001, 0.2941177, 0, 1, 1,
0.541034, -0.4206693, 1.812284, 0.3019608, 0, 1, 1,
0.5435814, 1.579098, -0.8930089, 0.3098039, 0, 1, 1,
0.545417, -1.090186, 4.070734, 0.3137255, 0, 1, 1,
0.547602, 0.4447976, 2.732926, 0.3215686, 0, 1, 1,
0.5579463, 0.2611113, 0.5398701, 0.3254902, 0, 1, 1,
0.5597574, -1.457554, 3.413961, 0.3333333, 0, 1, 1,
0.5598699, 0.2353554, -0.323826, 0.3372549, 0, 1, 1,
0.5607519, -0.9591413, 2.024898, 0.345098, 0, 1, 1,
0.5656901, 0.5100254, 1.439846, 0.3490196, 0, 1, 1,
0.5669247, 0.0616651, 0.9521086, 0.3568628, 0, 1, 1,
0.5676023, 0.5634593, -0.3779399, 0.3607843, 0, 1, 1,
0.5694268, 0.6263813, -0.4071537, 0.3686275, 0, 1, 1,
0.5712935, 0.03181449, 3.28198, 0.372549, 0, 1, 1,
0.5714273, -1.129653, 3.384155, 0.3803922, 0, 1, 1,
0.5720478, -0.4231317, 2.111152, 0.3843137, 0, 1, 1,
0.5732529, -0.4660269, 2.744914, 0.3921569, 0, 1, 1,
0.574783, 1.598457, 0.3672631, 0.3960784, 0, 1, 1,
0.5779591, 2.399914, -1.986204, 0.4039216, 0, 1, 1,
0.582342, 0.5051666, 0.4110112, 0.4117647, 0, 1, 1,
0.5834858, 1.194362, 0.6491125, 0.4156863, 0, 1, 1,
0.5848389, 0.7115272, 3.72647, 0.4235294, 0, 1, 1,
0.5853963, 0.1899659, 2.857354, 0.427451, 0, 1, 1,
0.5881956, 1.506808, -0.284266, 0.4352941, 0, 1, 1,
0.5901717, -0.1288661, 3.636529, 0.4392157, 0, 1, 1,
0.5916171, 1.571946, 2.362243, 0.4470588, 0, 1, 1,
0.5924413, 1.313176, 0.8118906, 0.4509804, 0, 1, 1,
0.592772, -0.2953291, 0.5569777, 0.4588235, 0, 1, 1,
0.6013725, 0.3427773, 0.9118977, 0.4627451, 0, 1, 1,
0.601408, 0.1334246, 1.576246, 0.4705882, 0, 1, 1,
0.6047002, 0.4279358, 0.5021059, 0.4745098, 0, 1, 1,
0.612143, 1.353827, -1.595729, 0.4823529, 0, 1, 1,
0.6171645, 0.4202308, 0.232741, 0.4862745, 0, 1, 1,
0.6180575, 0.8838325, 1.595461, 0.4941176, 0, 1, 1,
0.6216533, -0.4047295, 3.011953, 0.5019608, 0, 1, 1,
0.6238856, 1.8913, -0.09363838, 0.5058824, 0, 1, 1,
0.6250361, -0.3740575, 0.9441253, 0.5137255, 0, 1, 1,
0.63001, 0.7542899, 0.1573285, 0.5176471, 0, 1, 1,
0.6356584, -0.6511384, 3.698495, 0.5254902, 0, 1, 1,
0.6365582, 0.6839439, 1.593125, 0.5294118, 0, 1, 1,
0.6427929, -0.6770827, 0.0233941, 0.5372549, 0, 1, 1,
0.6459508, -0.7589688, 3.289403, 0.5411765, 0, 1, 1,
0.6471364, 0.3582594, 1.305741, 0.5490196, 0, 1, 1,
0.6551251, 0.5238194, 0.8927767, 0.5529412, 0, 1, 1,
0.6604742, -1.019755, 3.298654, 0.5607843, 0, 1, 1,
0.6641566, 1.18527, 0.02976349, 0.5647059, 0, 1, 1,
0.6655806, 0.4316541, 0.06937128, 0.572549, 0, 1, 1,
0.6661554, -0.06051815, 2.630931, 0.5764706, 0, 1, 1,
0.6668257, -0.6990051, 1.996729, 0.5843138, 0, 1, 1,
0.6701258, -0.5933971, 2.102904, 0.5882353, 0, 1, 1,
0.6720594, -0.389293, 2.360977, 0.5960785, 0, 1, 1,
0.6873144, -1.595642, 0.8379986, 0.6039216, 0, 1, 1,
0.6979866, 0.7148137, -0.1735197, 0.6078432, 0, 1, 1,
0.6994429, 0.5977817, 1.939862, 0.6156863, 0, 1, 1,
0.7039885, -3.457904, 2.230739, 0.6196079, 0, 1, 1,
0.7098004, -1.203313, 2.787078, 0.627451, 0, 1, 1,
0.7107709, -0.322642, 1.140988, 0.6313726, 0, 1, 1,
0.7133716, 1.635974, 0.734952, 0.6392157, 0, 1, 1,
0.7188072, 0.3222128, 1.110876, 0.6431373, 0, 1, 1,
0.7232776, -2.939797, 1.027047, 0.6509804, 0, 1, 1,
0.7233037, 0.2303045, 0.8555664, 0.654902, 0, 1, 1,
0.7236176, -0.387216, -0.3218448, 0.6627451, 0, 1, 1,
0.7238687, 0.5727, 2.880729, 0.6666667, 0, 1, 1,
0.7286162, 0.3964215, 0.7566091, 0.6745098, 0, 1, 1,
0.7298335, -0.4488441, 4.389737, 0.6784314, 0, 1, 1,
0.7303578, 0.5660813, 0.7690456, 0.6862745, 0, 1, 1,
0.7319357, -0.4870393, 1.972397, 0.6901961, 0, 1, 1,
0.7334045, -0.07798576, 2.213506, 0.6980392, 0, 1, 1,
0.740406, -1.090153, 2.068088, 0.7058824, 0, 1, 1,
0.7407095, 0.1404323, 1.692588, 0.7098039, 0, 1, 1,
0.7428492, -1.558932, 3.84697, 0.7176471, 0, 1, 1,
0.7428806, -1.516566, 0.6758178, 0.7215686, 0, 1, 1,
0.7553876, -1.103637, 0.7353666, 0.7294118, 0, 1, 1,
0.7557394, 0.1708436, 0.6055791, 0.7333333, 0, 1, 1,
0.7589127, -0.9843355, 4.146072, 0.7411765, 0, 1, 1,
0.7619563, -1.631539, 1.886047, 0.7450981, 0, 1, 1,
0.7704098, -0.2091006, 0.8550051, 0.7529412, 0, 1, 1,
0.7776397, -2.313256, 2.477859, 0.7568628, 0, 1, 1,
0.7799422, -0.7389129, 1.586063, 0.7647059, 0, 1, 1,
0.7812923, -0.06619371, 1.681795, 0.7686275, 0, 1, 1,
0.7858979, -0.7034451, 0.8845858, 0.7764706, 0, 1, 1,
0.7871451, 0.4331641, 2.088039, 0.7803922, 0, 1, 1,
0.790437, 1.616154, 0.4051147, 0.7882353, 0, 1, 1,
0.7921508, 0.5963243, 0.6101155, 0.7921569, 0, 1, 1,
0.7936743, 0.5488241, 1.947016, 0.8, 0, 1, 1,
0.7971028, 0.7262269, -0.8272239, 0.8078431, 0, 1, 1,
0.7982437, 0.4877258, -1.021373, 0.8117647, 0, 1, 1,
0.8016756, -0.5622301, 1.0771, 0.8196079, 0, 1, 1,
0.8068444, -1.047956, 1.963771, 0.8235294, 0, 1, 1,
0.8086532, 0.5624754, 0.6745185, 0.8313726, 0, 1, 1,
0.8252926, -0.8750387, 1.172734, 0.8352941, 0, 1, 1,
0.825861, 0.4787451, 2.239059, 0.8431373, 0, 1, 1,
0.8265314, -0.06952284, 0.80817, 0.8470588, 0, 1, 1,
0.8267363, -1.200204, 0.8539183, 0.854902, 0, 1, 1,
0.8278549, -0.08591598, 2.030469, 0.8588235, 0, 1, 1,
0.8322701, -0.4196972, 2.431822, 0.8666667, 0, 1, 1,
0.8491507, 0.09576484, 0.3150691, 0.8705882, 0, 1, 1,
0.8494835, 0.7172484, 0.08971142, 0.8784314, 0, 1, 1,
0.8602592, 1.354056, 1.076581, 0.8823529, 0, 1, 1,
0.8674197, 0.005358201, -0.4291809, 0.8901961, 0, 1, 1,
0.8681908, 0.2500259, 0.6904984, 0.8941177, 0, 1, 1,
0.8702794, -0.3449458, 1.554742, 0.9019608, 0, 1, 1,
0.8743405, -0.09531998, 1.211904, 0.9098039, 0, 1, 1,
0.8753999, 0.00170557, 3.966238, 0.9137255, 0, 1, 1,
0.8756504, -0.3677768, 1.054124, 0.9215686, 0, 1, 1,
0.8759559, 0.6739724, 1.388893, 0.9254902, 0, 1, 1,
0.8819332, -2.011381, 2.925349, 0.9333333, 0, 1, 1,
0.8884029, 0.5232663, 1.160835, 0.9372549, 0, 1, 1,
0.8888453, -1.147342, 0.3935077, 0.945098, 0, 1, 1,
0.8892323, 0.3442304, 2.135853, 0.9490196, 0, 1, 1,
0.8948376, -0.07231337, 1.552102, 0.9568627, 0, 1, 1,
0.8997286, 2.259469, -0.6305053, 0.9607843, 0, 1, 1,
0.9026759, -0.7898532, 1.187559, 0.9686275, 0, 1, 1,
0.90934, -0.5691923, 2.105734, 0.972549, 0, 1, 1,
0.9113607, 0.2005389, 0.3106034, 0.9803922, 0, 1, 1,
0.9126958, 1.180794, 2.396248, 0.9843137, 0, 1, 1,
0.9194763, 1.238244, -0.1872907, 0.9921569, 0, 1, 1,
0.9256457, -1.250541, 3.581558, 0.9960784, 0, 1, 1,
0.9258255, 0.3321872, 1.748194, 1, 0, 0.9960784, 1,
0.926672, -0.977348, 2.145065, 1, 0, 0.9882353, 1,
0.9296194, -0.8402379, 3.627392, 1, 0, 0.9843137, 1,
0.9347719, -1.619917, 1.664048, 1, 0, 0.9764706, 1,
0.9403442, 1.08858, 1.034115, 1, 0, 0.972549, 1,
0.9414551, 0.7105434, 0.4080533, 1, 0, 0.9647059, 1,
0.9478492, 1.192921, 0.005317733, 1, 0, 0.9607843, 1,
0.949632, -0.6301603, 0.9743845, 1, 0, 0.9529412, 1,
0.9534478, -0.8187299, 1.229589, 1, 0, 0.9490196, 1,
0.9547594, 0.1064459, -0.7602753, 1, 0, 0.9411765, 1,
0.9562764, 1.057254, 1.15938, 1, 0, 0.9372549, 1,
0.9576947, 0.1374085, 1.509667, 1, 0, 0.9294118, 1,
0.9626215, -0.08170802, 1.216479, 1, 0, 0.9254902, 1,
0.9761997, -0.7567549, 0.9314982, 1, 0, 0.9176471, 1,
0.9817071, -1.174208, 3.874803, 1, 0, 0.9137255, 1,
0.9839332, 0.1592231, 0.8901889, 1, 0, 0.9058824, 1,
1.006082, -0.3989135, 1.983536, 1, 0, 0.9019608, 1,
1.006291, -0.255272, -0.006119468, 1, 0, 0.8941177, 1,
1.006548, 1.675923, 1.775218, 1, 0, 0.8862745, 1,
1.008769, -0.6212492, 2.37691, 1, 0, 0.8823529, 1,
1.015017, 0.7014078, 0.9637614, 1, 0, 0.8745098, 1,
1.028908, -0.325932, 1.708491, 1, 0, 0.8705882, 1,
1.029395, 0.00724436, 1.858126, 1, 0, 0.8627451, 1,
1.034521, 0.2879815, 0.04096626, 1, 0, 0.8588235, 1,
1.03731, -0.02469004, 2.519506, 1, 0, 0.8509804, 1,
1.040053, 0.502043, 1.475219, 1, 0, 0.8470588, 1,
1.043281, -0.7673351, 2.046203, 1, 0, 0.8392157, 1,
1.047101, 0.4169805, 1.111531, 1, 0, 0.8352941, 1,
1.049923, 0.1357466, 0.9474191, 1, 0, 0.827451, 1,
1.050767, -0.9376106, 3.196327, 1, 0, 0.8235294, 1,
1.052136, -0.1843541, 0.101976, 1, 0, 0.8156863, 1,
1.055072, 1.510091, -0.04270838, 1, 0, 0.8117647, 1,
1.063248, 0.7318351, 1.271994, 1, 0, 0.8039216, 1,
1.068717, -0.3622349, 2.726727, 1, 0, 0.7960784, 1,
1.080506, 0.1881741, 0.2679501, 1, 0, 0.7921569, 1,
1.08194, -0.3185787, 1.146575, 1, 0, 0.7843137, 1,
1.085131, -1.415565, 2.032305, 1, 0, 0.7803922, 1,
1.08834, -1.389365, 3.11638, 1, 0, 0.772549, 1,
1.109303, -0.2873478, 0.4635899, 1, 0, 0.7686275, 1,
1.109931, 0.3050149, 2.318801, 1, 0, 0.7607843, 1,
1.120323, -0.3590035, 3.188244, 1, 0, 0.7568628, 1,
1.12085, -0.8129702, 3.101701, 1, 0, 0.7490196, 1,
1.121567, 0.1149365, 1.072278, 1, 0, 0.7450981, 1,
1.130405, 1.677545, -0.1930193, 1, 0, 0.7372549, 1,
1.139258, 1.498974, 0.4259586, 1, 0, 0.7333333, 1,
1.141548, -1.93467, 1.40078, 1, 0, 0.7254902, 1,
1.147923, 0.8501055, 2.21854, 1, 0, 0.7215686, 1,
1.153986, -0.7799318, 1.04749, 1, 0, 0.7137255, 1,
1.155586, 0.2271396, 2.138584, 1, 0, 0.7098039, 1,
1.156696, -0.0963681, 0.127821, 1, 0, 0.7019608, 1,
1.157261, 0.6710282, 2.222214, 1, 0, 0.6941177, 1,
1.159223, -0.1670645, 1.089363, 1, 0, 0.6901961, 1,
1.160861, -1.83189, 3.98722, 1, 0, 0.682353, 1,
1.163406, -0.1965815, 1.379011, 1, 0, 0.6784314, 1,
1.168713, 1.518345, 0.2630083, 1, 0, 0.6705883, 1,
1.170247, -1.883718, 2.330809, 1, 0, 0.6666667, 1,
1.170253, 0.4445574, 0.7850195, 1, 0, 0.6588235, 1,
1.176517, 0.2041992, 0.2692598, 1, 0, 0.654902, 1,
1.179177, 0.6133419, 2.542221, 1, 0, 0.6470588, 1,
1.18207, -0.2109446, 2.751334, 1, 0, 0.6431373, 1,
1.183546, 1.43387, -1.498576, 1, 0, 0.6352941, 1,
1.190211, -0.1551122, 0.9421275, 1, 0, 0.6313726, 1,
1.194369, -1.004798, 3.884856, 1, 0, 0.6235294, 1,
1.201599, 0.7231343, 0.8050848, 1, 0, 0.6196079, 1,
1.212304, -0.6610631, 1.060653, 1, 0, 0.6117647, 1,
1.213828, 0.06049022, 2.731324, 1, 0, 0.6078432, 1,
1.216212, -0.6077064, 3.549641, 1, 0, 0.6, 1,
1.220092, -0.4205657, 2.255227, 1, 0, 0.5921569, 1,
1.224938, 0.6192968, 2.020832, 1, 0, 0.5882353, 1,
1.232308, -0.4505952, 1.261155, 1, 0, 0.5803922, 1,
1.233926, 0.09798635, 1.052927, 1, 0, 0.5764706, 1,
1.235054, -1.959875, 3.516663, 1, 0, 0.5686275, 1,
1.235358, 1.849299, 0.09980845, 1, 0, 0.5647059, 1,
1.236941, -0.7516394, 2.086774, 1, 0, 0.5568628, 1,
1.240316, -0.5504448, 0.6472831, 1, 0, 0.5529412, 1,
1.242098, -0.6216822, 3.750436, 1, 0, 0.5450981, 1,
1.246564, -0.9073343, 0.4156778, 1, 0, 0.5411765, 1,
1.269366, -0.5513201, 2.773221, 1, 0, 0.5333334, 1,
1.284222, 0.005857631, 3.049429, 1, 0, 0.5294118, 1,
1.287125, -0.4957054, 1.286661, 1, 0, 0.5215687, 1,
1.288435, 0.7204228, 2.295777, 1, 0, 0.5176471, 1,
1.290427, 0.3551996, 0.8414042, 1, 0, 0.509804, 1,
1.292468, -1.183242, 3.149352, 1, 0, 0.5058824, 1,
1.302052, -0.2453294, 0.1985129, 1, 0, 0.4980392, 1,
1.311664, -0.5491973, 2.162625, 1, 0, 0.4901961, 1,
1.313099, 0.63651, 3.134715, 1, 0, 0.4862745, 1,
1.313524, -0.3619567, 0.8469693, 1, 0, 0.4784314, 1,
1.313687, 0.0004348372, 1.904148, 1, 0, 0.4745098, 1,
1.314343, 1.252323, 1.470492, 1, 0, 0.4666667, 1,
1.322575, 0.2794475, 1.211162, 1, 0, 0.4627451, 1,
1.325071, -0.3434323, 2.524385, 1, 0, 0.454902, 1,
1.330582, 2.411473, -0.458693, 1, 0, 0.4509804, 1,
1.351531, -0.4227562, 2.968388, 1, 0, 0.4431373, 1,
1.361787, 1.158553, 1.498986, 1, 0, 0.4392157, 1,
1.370561, 0.05916701, 0.9148753, 1, 0, 0.4313726, 1,
1.381884, 1.439433, 0.5511396, 1, 0, 0.427451, 1,
1.383558, 0.946786, 2.023393, 1, 0, 0.4196078, 1,
1.385166, 2.700972, 0.6585925, 1, 0, 0.4156863, 1,
1.387672, 1.280148, -0.7723151, 1, 0, 0.4078431, 1,
1.39211, 1.43169, 1.123987, 1, 0, 0.4039216, 1,
1.408948, 1.429188, 0.1680978, 1, 0, 0.3960784, 1,
1.410751, 1.697008, 2.178674, 1, 0, 0.3882353, 1,
1.428372, -1.638135, 2.654641, 1, 0, 0.3843137, 1,
1.44484, 0.4104945, 0.7585365, 1, 0, 0.3764706, 1,
1.44616, -0.1115928, 1.354521, 1, 0, 0.372549, 1,
1.446195, 1.804706, 1.512121, 1, 0, 0.3647059, 1,
1.458146, -0.1174682, 0.8946368, 1, 0, 0.3607843, 1,
1.465162, -0.5117149, 3.357043, 1, 0, 0.3529412, 1,
1.48293, -0.307992, 2.124596, 1, 0, 0.3490196, 1,
1.484545, 0.244671, 3.616364, 1, 0, 0.3411765, 1,
1.490435, -0.42636, 2.179713, 1, 0, 0.3372549, 1,
1.492506, -1.279593, 2.810945, 1, 0, 0.3294118, 1,
1.494841, 0.5198036, 2.278485, 1, 0, 0.3254902, 1,
1.512257, 0.2481274, 1.293725, 1, 0, 0.3176471, 1,
1.522191, 0.3628717, 3.122198, 1, 0, 0.3137255, 1,
1.545124, 0.2338246, 1.40589, 1, 0, 0.3058824, 1,
1.546316, 0.8217772, -0.5598528, 1, 0, 0.2980392, 1,
1.563263, 0.2386995, 1.419444, 1, 0, 0.2941177, 1,
1.563567, 2.701969, 0.3246536, 1, 0, 0.2862745, 1,
1.579338, -0.5375157, 3.717366, 1, 0, 0.282353, 1,
1.581917, -1.289973, 1.277897, 1, 0, 0.2745098, 1,
1.595031, 0.1170186, 1.760871, 1, 0, 0.2705882, 1,
1.600341, -0.8715119, 0.5929548, 1, 0, 0.2627451, 1,
1.61089, -1.021268, 2.558425, 1, 0, 0.2588235, 1,
1.618014, -0.790428, 1.53333, 1, 0, 0.2509804, 1,
1.621437, -1.612385, 3.057213, 1, 0, 0.2470588, 1,
1.627211, -0.9687926, 2.578296, 1, 0, 0.2392157, 1,
1.636982, -0.6319624, 3.776643, 1, 0, 0.2352941, 1,
1.637656, 1.199571, 0.342545, 1, 0, 0.227451, 1,
1.653693, -0.413357, 2.311855, 1, 0, 0.2235294, 1,
1.661298, -0.1603775, 1.879287, 1, 0, 0.2156863, 1,
1.670023, 1.37121, 1.164739, 1, 0, 0.2117647, 1,
1.683597, -0.989369, 2.03573, 1, 0, 0.2039216, 1,
1.694199, -1.768089, 2.626475, 1, 0, 0.1960784, 1,
1.698857, -1.55175, 4.229198, 1, 0, 0.1921569, 1,
1.720187, -0.3336591, 2.527043, 1, 0, 0.1843137, 1,
1.733803, -0.867183, 2.596274, 1, 0, 0.1803922, 1,
1.749905, 1.712832, 1.115734, 1, 0, 0.172549, 1,
1.764642, -0.2997031, -0.09198049, 1, 0, 0.1686275, 1,
1.775317, 0.7488632, 1.285708, 1, 0, 0.1607843, 1,
1.795655, 0.4697182, 2.829402, 1, 0, 0.1568628, 1,
1.802843, 1.642687, 0.5042213, 1, 0, 0.1490196, 1,
1.837068, -1.374458, 2.317394, 1, 0, 0.145098, 1,
1.884252, -0.3767582, 2.519357, 1, 0, 0.1372549, 1,
1.88574, -2.322344, 2.568536, 1, 0, 0.1333333, 1,
1.902717, 0.4799474, -0.206186, 1, 0, 0.1254902, 1,
1.9074, 1.27226, -0.303485, 1, 0, 0.1215686, 1,
1.972261, 0.3114444, 2.622862, 1, 0, 0.1137255, 1,
1.98662, -0.4328067, 0.2398869, 1, 0, 0.1098039, 1,
2.001838, -0.1813297, 3.164846, 1, 0, 0.1019608, 1,
2.020004, 0.4807697, 1.52685, 1, 0, 0.09411765, 1,
2.029482, -0.7254611, 2.824028, 1, 0, 0.09019608, 1,
2.032655, -0.4741169, 0.003648931, 1, 0, 0.08235294, 1,
2.048131, -0.9330913, 2.337861, 1, 0, 0.07843138, 1,
2.115716, -0.3529009, 0.2653826, 1, 0, 0.07058824, 1,
2.161438, 0.9381944, 0.5287002, 1, 0, 0.06666667, 1,
2.249191, -0.2485709, 1.575538, 1, 0, 0.05882353, 1,
2.302867, 1.42159, 0.4609381, 1, 0, 0.05490196, 1,
2.408831, 0.3884571, 0.752082, 1, 0, 0.04705882, 1,
2.433085, -0.6339299, 0.5677851, 1, 0, 0.04313726, 1,
2.469677, 0.2650228, -0.8832352, 1, 0, 0.03529412, 1,
2.715455, 0.01226009, 2.256748, 1, 0, 0.03137255, 1,
2.780136, -2.31097, 1.28559, 1, 0, 0.02352941, 1,
2.825332, -0.7054484, -0.4867235, 1, 0, 0.01960784, 1,
2.957024, -0.7046452, 1.337345, 1, 0, 0.01176471, 1,
3.479548, -1.220861, 3.300392, 1, 0, 0.007843138, 1
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
-0.04165292, -4.615637, -8.153815, 0, -0.5, 0.5, 0.5,
-0.04165292, -4.615637, -8.153815, 1, -0.5, 0.5, 0.5,
-0.04165292, -4.615637, -8.153815, 1, 1.5, 0.5, 0.5,
-0.04165292, -4.615637, -8.153815, 0, 1.5, 0.5, 0.5
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
-4.756541, -0.04276192, -8.153815, 0, -0.5, 0.5, 0.5,
-4.756541, -0.04276192, -8.153815, 1, -0.5, 0.5, 0.5,
-4.756541, -0.04276192, -8.153815, 1, 1.5, 0.5, 0.5,
-4.756541, -0.04276192, -8.153815, 0, 1.5, 0.5, 0.5
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
-4.756541, -4.615637, -0.3329439, 0, -0.5, 0.5, 0.5,
-4.756541, -4.615637, -0.3329439, 1, -0.5, 0.5, 0.5,
-4.756541, -4.615637, -0.3329439, 1, 1.5, 0.5, 0.5,
-4.756541, -4.615637, -0.3329439, 0, 1.5, 0.5, 0.5
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
-2, -3.560358, -6.348999,
2, -3.560358, -6.348999,
-2, -3.560358, -6.348999,
-2, -3.736238, -6.649802,
0, -3.560358, -6.348999,
0, -3.736238, -6.649802,
2, -3.560358, -6.348999,
2, -3.736238, -6.649802
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
-2, -4.087997, -7.251408, 0, -0.5, 0.5, 0.5,
-2, -4.087997, -7.251408, 1, -0.5, 0.5, 0.5,
-2, -4.087997, -7.251408, 1, 1.5, 0.5, 0.5,
-2, -4.087997, -7.251408, 0, 1.5, 0.5, 0.5,
0, -4.087997, -7.251408, 0, -0.5, 0.5, 0.5,
0, -4.087997, -7.251408, 1, -0.5, 0.5, 0.5,
0, -4.087997, -7.251408, 1, 1.5, 0.5, 0.5,
0, -4.087997, -7.251408, 0, 1.5, 0.5, 0.5,
2, -4.087997, -7.251408, 0, -0.5, 0.5, 0.5,
2, -4.087997, -7.251408, 1, -0.5, 0.5, 0.5,
2, -4.087997, -7.251408, 1, 1.5, 0.5, 0.5,
2, -4.087997, -7.251408, 0, 1.5, 0.5, 0.5
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
-3.66849, -3, -6.348999,
-3.66849, 3, -6.348999,
-3.66849, -3, -6.348999,
-3.849832, -3, -6.649802,
-3.66849, -2, -6.348999,
-3.849832, -2, -6.649802,
-3.66849, -1, -6.348999,
-3.849832, -1, -6.649802,
-3.66849, 0, -6.348999,
-3.849832, 0, -6.649802,
-3.66849, 1, -6.348999,
-3.849832, 1, -6.649802,
-3.66849, 2, -6.348999,
-3.849832, 2, -6.649802,
-3.66849, 3, -6.348999,
-3.849832, 3, -6.649802
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
-4.212516, -3, -7.251408, 0, -0.5, 0.5, 0.5,
-4.212516, -3, -7.251408, 1, -0.5, 0.5, 0.5,
-4.212516, -3, -7.251408, 1, 1.5, 0.5, 0.5,
-4.212516, -3, -7.251408, 0, 1.5, 0.5, 0.5,
-4.212516, -2, -7.251408, 0, -0.5, 0.5, 0.5,
-4.212516, -2, -7.251408, 1, -0.5, 0.5, 0.5,
-4.212516, -2, -7.251408, 1, 1.5, 0.5, 0.5,
-4.212516, -2, -7.251408, 0, 1.5, 0.5, 0.5,
-4.212516, -1, -7.251408, 0, -0.5, 0.5, 0.5,
-4.212516, -1, -7.251408, 1, -0.5, 0.5, 0.5,
-4.212516, -1, -7.251408, 1, 1.5, 0.5, 0.5,
-4.212516, -1, -7.251408, 0, 1.5, 0.5, 0.5,
-4.212516, 0, -7.251408, 0, -0.5, 0.5, 0.5,
-4.212516, 0, -7.251408, 1, -0.5, 0.5, 0.5,
-4.212516, 0, -7.251408, 1, 1.5, 0.5, 0.5,
-4.212516, 0, -7.251408, 0, 1.5, 0.5, 0.5,
-4.212516, 1, -7.251408, 0, -0.5, 0.5, 0.5,
-4.212516, 1, -7.251408, 1, -0.5, 0.5, 0.5,
-4.212516, 1, -7.251408, 1, 1.5, 0.5, 0.5,
-4.212516, 1, -7.251408, 0, 1.5, 0.5, 0.5,
-4.212516, 2, -7.251408, 0, -0.5, 0.5, 0.5,
-4.212516, 2, -7.251408, 1, -0.5, 0.5, 0.5,
-4.212516, 2, -7.251408, 1, 1.5, 0.5, 0.5,
-4.212516, 2, -7.251408, 0, 1.5, 0.5, 0.5,
-4.212516, 3, -7.251408, 0, -0.5, 0.5, 0.5,
-4.212516, 3, -7.251408, 1, -0.5, 0.5, 0.5,
-4.212516, 3, -7.251408, 1, 1.5, 0.5, 0.5,
-4.212516, 3, -7.251408, 0, 1.5, 0.5, 0.5
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
-3.66849, -3.560358, -6,
-3.66849, -3.560358, 4,
-3.66849, -3.560358, -6,
-3.849832, -3.736238, -6,
-3.66849, -3.560358, -4,
-3.849832, -3.736238, -4,
-3.66849, -3.560358, -2,
-3.849832, -3.736238, -2,
-3.66849, -3.560358, 0,
-3.849832, -3.736238, 0,
-3.66849, -3.560358, 2,
-3.849832, -3.736238, 2,
-3.66849, -3.560358, 4,
-3.849832, -3.736238, 4
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
-4.212516, -4.087997, -6, 0, -0.5, 0.5, 0.5,
-4.212516, -4.087997, -6, 1, -0.5, 0.5, 0.5,
-4.212516, -4.087997, -6, 1, 1.5, 0.5, 0.5,
-4.212516, -4.087997, -6, 0, 1.5, 0.5, 0.5,
-4.212516, -4.087997, -4, 0, -0.5, 0.5, 0.5,
-4.212516, -4.087997, -4, 1, -0.5, 0.5, 0.5,
-4.212516, -4.087997, -4, 1, 1.5, 0.5, 0.5,
-4.212516, -4.087997, -4, 0, 1.5, 0.5, 0.5,
-4.212516, -4.087997, -2, 0, -0.5, 0.5, 0.5,
-4.212516, -4.087997, -2, 1, -0.5, 0.5, 0.5,
-4.212516, -4.087997, -2, 1, 1.5, 0.5, 0.5,
-4.212516, -4.087997, -2, 0, 1.5, 0.5, 0.5,
-4.212516, -4.087997, 0, 0, -0.5, 0.5, 0.5,
-4.212516, -4.087997, 0, 1, -0.5, 0.5, 0.5,
-4.212516, -4.087997, 0, 1, 1.5, 0.5, 0.5,
-4.212516, -4.087997, 0, 0, 1.5, 0.5, 0.5,
-4.212516, -4.087997, 2, 0, -0.5, 0.5, 0.5,
-4.212516, -4.087997, 2, 1, -0.5, 0.5, 0.5,
-4.212516, -4.087997, 2, 1, 1.5, 0.5, 0.5,
-4.212516, -4.087997, 2, 0, 1.5, 0.5, 0.5,
-4.212516, -4.087997, 4, 0, -0.5, 0.5, 0.5,
-4.212516, -4.087997, 4, 1, -0.5, 0.5, 0.5,
-4.212516, -4.087997, 4, 1, 1.5, 0.5, 0.5,
-4.212516, -4.087997, 4, 0, 1.5, 0.5, 0.5
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
-3.66849, -3.560358, -6.348999,
-3.66849, 3.474834, -6.348999,
-3.66849, -3.560358, 5.683111,
-3.66849, 3.474834, 5.683111,
-3.66849, -3.560358, -6.348999,
-3.66849, -3.560358, 5.683111,
-3.66849, 3.474834, -6.348999,
-3.66849, 3.474834, 5.683111,
-3.66849, -3.560358, -6.348999,
3.585184, -3.560358, -6.348999,
-3.66849, -3.560358, 5.683111,
3.585184, -3.560358, 5.683111,
-3.66849, 3.474834, -6.348999,
3.585184, 3.474834, -6.348999,
-3.66849, 3.474834, 5.683111,
3.585184, 3.474834, 5.683111,
3.585184, -3.560358, -6.348999,
3.585184, 3.474834, -6.348999,
3.585184, -3.560358, 5.683111,
3.585184, 3.474834, 5.683111,
3.585184, -3.560358, -6.348999,
3.585184, -3.560358, 5.683111,
3.585184, 3.474834, -6.348999,
3.585184, 3.474834, 5.683111
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
var radius = 8.390149;
var distance = 37.32872;
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
mvMatrix.translate( 0.04165292, 0.04276192, 0.3329439 );
mvMatrix.scale( 1.25062, 1.289459, 0.7539486 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -37.32872);
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
metazachlor<-read.table("metazachlor.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-metazachlor$V2
```

```
## Error in eval(expr, envir, enclos): object 'metazachlor' not found
```

```r
y<-metazachlor$V3
```

```
## Error in eval(expr, envir, enclos): object 'metazachlor' not found
```

```r
z<-metazachlor$V4
```

```
## Error in eval(expr, envir, enclos): object 'metazachlor' not found
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
-3.562854, -0.4737151, -0.3304424, 0, 0, 1, 1, 1,
-3.390118, -0.09219212, -0.7567111, 1, 0, 0, 1, 1,
-3.257355, 0.1831263, -2.603818, 1, 0, 0, 1, 1,
-3.249435, -0.1395215, -1.329027, 1, 0, 0, 1, 1,
-2.793377, 1.419753, -1.525598, 1, 0, 0, 1, 1,
-2.717954, -0.6726108, -2.127786, 1, 0, 0, 1, 1,
-2.652984, 0.8106945, -1.311341, 0, 0, 0, 1, 1,
-2.504876, -0.02561407, 0.03814044, 0, 0, 0, 1, 1,
-2.422749, -0.1090266, 2.476305, 0, 0, 0, 1, 1,
-2.399827, 1.081178, -0.08205342, 0, 0, 0, 1, 1,
-2.357105, 0.8360163, -1.942568, 0, 0, 0, 1, 1,
-2.311914, -0.5637389, -1.421971, 0, 0, 0, 1, 1,
-2.28434, -0.3952771, -0.9025289, 0, 0, 0, 1, 1,
-2.272183, 0.8162184, -2.523149, 1, 1, 1, 1, 1,
-2.199732, -0.619307, -1.988673, 1, 1, 1, 1, 1,
-2.166409, -2.06376, -1.292482, 1, 1, 1, 1, 1,
-2.165309, -1.77746, -3.316949, 1, 1, 1, 1, 1,
-2.152708, 1.824011, -1.151824, 1, 1, 1, 1, 1,
-2.107716, 1.809771, -1.519104, 1, 1, 1, 1, 1,
-2.101959, -0.1376828, -1.265402, 1, 1, 1, 1, 1,
-2.081323, 1.075624, -0.9735333, 1, 1, 1, 1, 1,
-2.064531, -0.09794375, -1.726229, 1, 1, 1, 1, 1,
-2.010204, 1.207005, -0.1102266, 1, 1, 1, 1, 1,
-1.982089, -1.203748, -1.316157, 1, 1, 1, 1, 1,
-1.981786, -1.160247, -1.243515, 1, 1, 1, 1, 1,
-1.976105, -0.2838273, -0.6722204, 1, 1, 1, 1, 1,
-1.963617, -1.260951, -2.546928, 1, 1, 1, 1, 1,
-1.949543, -2.113118, -1.628686, 1, 1, 1, 1, 1,
-1.93156, 1.028408, -2.44336, 0, 0, 1, 1, 1,
-1.923854, 0.3656606, -0.3824869, 1, 0, 0, 1, 1,
-1.917589, -1.110301, -1.205803, 1, 0, 0, 1, 1,
-1.891151, -0.6613871, -3.173793, 1, 0, 0, 1, 1,
-1.8812, 0.393506, -2.745775, 1, 0, 0, 1, 1,
-1.880405, -0.05272842, -1.035531, 1, 0, 0, 1, 1,
-1.871794, 1.23642, -1.397298, 0, 0, 0, 1, 1,
-1.870661, 0.9000798, -2.137918, 0, 0, 0, 1, 1,
-1.858196, -0.5828723, -1.800141, 0, 0, 0, 1, 1,
-1.842257, -0.7462349, -2.824254, 0, 0, 0, 1, 1,
-1.841079, 1.114412, -1.257483, 0, 0, 0, 1, 1,
-1.831732, -1.787663, -0.7367472, 0, 0, 0, 1, 1,
-1.818902, 1.278909, -0.1029157, 0, 0, 0, 1, 1,
-1.792726, -0.3129034, -1.665634, 1, 1, 1, 1, 1,
-1.76621, 0.6229752, -1.33405, 1, 1, 1, 1, 1,
-1.728674, 0.7308319, 0.03887716, 1, 1, 1, 1, 1,
-1.710981, 0.03987255, -1.625739, 1, 1, 1, 1, 1,
-1.69605, 0.5106091, -1.719548, 1, 1, 1, 1, 1,
-1.685549, -0.8832399, -1.547197, 1, 1, 1, 1, 1,
-1.675755, -0.1763112, 0.3450164, 1, 1, 1, 1, 1,
-1.671668, -0.4119142, -0.1442109, 1, 1, 1, 1, 1,
-1.66323, -1.200093, -0.1171669, 1, 1, 1, 1, 1,
-1.659312, 0.188556, -1.260536, 1, 1, 1, 1, 1,
-1.649587, 1.098114, -0.4557, 1, 1, 1, 1, 1,
-1.646225, -0.9519222, -0.7153351, 1, 1, 1, 1, 1,
-1.643505, 0.241388, -0.939336, 1, 1, 1, 1, 1,
-1.632166, 1.620447, -0.2204205, 1, 1, 1, 1, 1,
-1.63065, -0.6474268, -1.789147, 1, 1, 1, 1, 1,
-1.627181, -0.7190567, -2.108236, 0, 0, 1, 1, 1,
-1.625153, 1.028761, -1.775069, 1, 0, 0, 1, 1,
-1.621496, 0.2049355, -0.7166076, 1, 0, 0, 1, 1,
-1.618016, 1.489599, -2.113205, 1, 0, 0, 1, 1,
-1.590271, 0.1509613, -2.309445, 1, 0, 0, 1, 1,
-1.580038, -0.1517302, -1.751854, 1, 0, 0, 1, 1,
-1.572939, -0.3109501, -0.6375845, 0, 0, 0, 1, 1,
-1.571041, 0.0455006, -3.43612, 0, 0, 0, 1, 1,
-1.541766, 1.091579, -1.174935, 0, 0, 0, 1, 1,
-1.5106, -0.3207543, -2.126988, 0, 0, 0, 1, 1,
-1.501562, -0.00869999, -0.7982609, 0, 0, 0, 1, 1,
-1.498824, 0.7731518, -0.6197593, 0, 0, 0, 1, 1,
-1.491648, 0.1074471, -3.743639, 0, 0, 0, 1, 1,
-1.481823, -0.06019586, -2.88036, 1, 1, 1, 1, 1,
-1.475159, -0.4435608, -1.988278, 1, 1, 1, 1, 1,
-1.464577, 0.3066177, -2.140227, 1, 1, 1, 1, 1,
-1.45119, 1.58562, -1.254764, 1, 1, 1, 1, 1,
-1.447353, -0.1419723, -2.035407, 1, 1, 1, 1, 1,
-1.443618, -0.5160204, -2.316562, 1, 1, 1, 1, 1,
-1.440612, -1.707921, -2.869544, 1, 1, 1, 1, 1,
-1.436946, -0.7804457, -1.78711, 1, 1, 1, 1, 1,
-1.434911, -1.4447, -2.833231, 1, 1, 1, 1, 1,
-1.433661, 0.2289525, -2.687624, 1, 1, 1, 1, 1,
-1.422068, -0.6015142, -2.762249, 1, 1, 1, 1, 1,
-1.420792, 0.4834981, -2.044231, 1, 1, 1, 1, 1,
-1.419299, -0.002618098, -3.584678, 1, 1, 1, 1, 1,
-1.416047, -0.6363984, -0.9750603, 1, 1, 1, 1, 1,
-1.411134, 0.5722946, 0.09817607, 1, 1, 1, 1, 1,
-1.399398, -1.048823, -1.509676, 0, 0, 1, 1, 1,
-1.396929, 0.2671707, -0.5170293, 1, 0, 0, 1, 1,
-1.396611, -0.1867167, -0.3642875, 1, 0, 0, 1, 1,
-1.39598, 0.6503776, -1.870741, 1, 0, 0, 1, 1,
-1.385511, -0.2280181, -3.543447, 1, 0, 0, 1, 1,
-1.383126, 0.8564914, -2.723291, 1, 0, 0, 1, 1,
-1.382391, -0.1815162, -2.102894, 0, 0, 0, 1, 1,
-1.36847, 0.9780337, 0.5157617, 0, 0, 0, 1, 1,
-1.357008, -1.63952, -2.423221, 0, 0, 0, 1, 1,
-1.354084, -0.4860224, -3.649327, 0, 0, 0, 1, 1,
-1.347706, 0.2502043, -2.674036, 0, 0, 0, 1, 1,
-1.347704, -0.1757367, -2.237908, 0, 0, 0, 1, 1,
-1.347519, 1.451411, -0.8266529, 0, 0, 0, 1, 1,
-1.344032, 0.1083318, -0.9533951, 1, 1, 1, 1, 1,
-1.342416, -1.528672, -1.864146, 1, 1, 1, 1, 1,
-1.325342, 0.9014778, -0.4865682, 1, 1, 1, 1, 1,
-1.319853, -1.989223, -2.271428, 1, 1, 1, 1, 1,
-1.308935, 0.07047256, -0.6350476, 1, 1, 1, 1, 1,
-1.304682, 3.37238, -1.143097, 1, 1, 1, 1, 1,
-1.298963, -1.953252, -1.958267, 1, 1, 1, 1, 1,
-1.297395, -0.5839708, -0.999316, 1, 1, 1, 1, 1,
-1.292362, -0.2603331, -1.403781, 1, 1, 1, 1, 1,
-1.291226, 1.545899, 0.2382137, 1, 1, 1, 1, 1,
-1.282816, -0.3788652, -2.480758, 1, 1, 1, 1, 1,
-1.27898, -2.698765, -4.351303, 1, 1, 1, 1, 1,
-1.277043, -0.9072827, -2.352963, 1, 1, 1, 1, 1,
-1.272853, 0.1758725, -1.669633, 1, 1, 1, 1, 1,
-1.256195, 0.4020494, 0.07590719, 1, 1, 1, 1, 1,
-1.251719, 0.4442267, -3.282116, 0, 0, 1, 1, 1,
-1.251073, 2.194294, -0.9888149, 1, 0, 0, 1, 1,
-1.250939, -0.9216006, 0.2085608, 1, 0, 0, 1, 1,
-1.250744, 0.3129222, -1.326419, 1, 0, 0, 1, 1,
-1.250103, 0.3216045, -1.749111, 1, 0, 0, 1, 1,
-1.24951, 1.014803, -2.596762, 1, 0, 0, 1, 1,
-1.247623, 0.04531163, -2.241076, 0, 0, 0, 1, 1,
-1.235325, -1.510149, -0.7007814, 0, 0, 0, 1, 1,
-1.234532, -0.2509768, -0.06581084, 0, 0, 0, 1, 1,
-1.22549, 0.7418552, -1.303153, 0, 0, 0, 1, 1,
-1.225301, 0.7840622, -0.6236703, 0, 0, 0, 1, 1,
-1.222847, 0.9213577, -1.813994, 0, 0, 0, 1, 1,
-1.221341, 0.3101943, -0.1193258, 0, 0, 0, 1, 1,
-1.211735, -1.169929, -2.282813, 1, 1, 1, 1, 1,
-1.208923, 1.225732, -1.349699, 1, 1, 1, 1, 1,
-1.207931, 0.2561579, -2.220789, 1, 1, 1, 1, 1,
-1.191621, -0.02271738, -1.651906, 1, 1, 1, 1, 1,
-1.184712, -0.2996233, -0.9683797, 1, 1, 1, 1, 1,
-1.182979, 1.073078, -1.256326, 1, 1, 1, 1, 1,
-1.157286, 1.631376, -1.507895, 1, 1, 1, 1, 1,
-1.156772, 1.440125, 2.90558, 1, 1, 1, 1, 1,
-1.153869, -0.02469857, -1.529058, 1, 1, 1, 1, 1,
-1.145577, -0.3549922, -2.437646, 1, 1, 1, 1, 1,
-1.140219, 1.072748, -1.389612, 1, 1, 1, 1, 1,
-1.130326, -0.7213333, -0.3486935, 1, 1, 1, 1, 1,
-1.126891, -0.01859425, -1.631385, 1, 1, 1, 1, 1,
-1.126763, 0.02703278, -2.888107, 1, 1, 1, 1, 1,
-1.124083, -0.4166639, -1.819711, 1, 1, 1, 1, 1,
-1.12344, -1.601381, -1.256148, 0, 0, 1, 1, 1,
-1.122292, -1.000723, -3.823025, 1, 0, 0, 1, 1,
-1.119099, -0.06148656, -0.5611833, 1, 0, 0, 1, 1,
-1.11677, -0.4879094, -3.467974, 1, 0, 0, 1, 1,
-1.112789, 0.2557775, -1.6838, 1, 0, 0, 1, 1,
-1.110281, -0.4402361, -2.23752, 1, 0, 0, 1, 1,
-1.10955, 0.8011626, -0.3912033, 0, 0, 0, 1, 1,
-1.102201, -0.6485504, -2.558278, 0, 0, 0, 1, 1,
-1.101905, 0.3372335, -0.7839923, 0, 0, 0, 1, 1,
-1.096997, -1.397424, -3.070858, 0, 0, 0, 1, 1,
-1.080026, 1.222194, -1.336148, 0, 0, 0, 1, 1,
-1.078241, -0.146469, -1.210721, 0, 0, 0, 1, 1,
-1.075513, 0.3111153, -1.375116, 0, 0, 0, 1, 1,
-1.072552, -0.2477451, -0.9689234, 1, 1, 1, 1, 1,
-1.06948, 0.2169491, 0.3095162, 1, 1, 1, 1, 1,
-1.066615, -0.46138, -0.2687675, 1, 1, 1, 1, 1,
-1.064522, -0.2797325, -0.7701688, 1, 1, 1, 1, 1,
-1.064435, -0.3640695, -2.790677, 1, 1, 1, 1, 1,
-1.063104, 0.7755946, -1.310341, 1, 1, 1, 1, 1,
-1.062953, -0.3220697, -0.09556439, 1, 1, 1, 1, 1,
-1.062306, -0.2150837, -0.7157767, 1, 1, 1, 1, 1,
-1.061529, 1.159482, -0.1551816, 1, 1, 1, 1, 1,
-1.061416, -0.4190184, -1.811723, 1, 1, 1, 1, 1,
-1.059141, 1.762883, -1.629718, 1, 1, 1, 1, 1,
-1.056287, -1.464804, -2.971433, 1, 1, 1, 1, 1,
-1.046052, 0.7188579, -1.255069, 1, 1, 1, 1, 1,
-1.045305, 0.5608603, -0.4875303, 1, 1, 1, 1, 1,
-1.016709, -0.4411063, -2.743946, 1, 1, 1, 1, 1,
-1.015878, 1.715907, 0.2524929, 0, 0, 1, 1, 1,
-1.010744, -0.4435589, -2.269414, 1, 0, 0, 1, 1,
-1.002762, -1.836814, -4.128697, 1, 0, 0, 1, 1,
-1.002246, 0.6011436, 0.1692938, 1, 0, 0, 1, 1,
-1.001004, -0.1470758, -3.229272, 1, 0, 0, 1, 1,
-0.9975117, 0.06553441, -0.1963244, 1, 0, 0, 1, 1,
-0.9941165, 0.9368649, -2.065273, 0, 0, 0, 1, 1,
-0.9911463, 1.660895, -0.4325145, 0, 0, 0, 1, 1,
-0.9875041, -0.5796475, -2.436838, 0, 0, 0, 1, 1,
-0.9852299, -0.8708009, -4.482271, 0, 0, 0, 1, 1,
-0.9819934, -0.755864, -0.736525, 0, 0, 0, 1, 1,
-0.9802023, 0.04674662, -0.7391695, 0, 0, 0, 1, 1,
-0.9760953, 0.6904091, 1.598116, 0, 0, 0, 1, 1,
-0.9733, -0.9293771, -1.688135, 1, 1, 1, 1, 1,
-0.9727283, -0.1250224, -1.871022, 1, 1, 1, 1, 1,
-0.9632353, 1.644962, -0.3481874, 1, 1, 1, 1, 1,
-0.961874, 1.082774, -1.112754, 1, 1, 1, 1, 1,
-0.9524773, -0.5484415, -0.4170527, 1, 1, 1, 1, 1,
-0.9494659, -0.9803643, -3.954677, 1, 1, 1, 1, 1,
-0.9480675, 0.2251052, -0.972616, 1, 1, 1, 1, 1,
-0.945718, 0.3744928, -0.6473512, 1, 1, 1, 1, 1,
-0.9443875, 2.091664, 0.08462354, 1, 1, 1, 1, 1,
-0.9366448, -0.190968, -1.702991, 1, 1, 1, 1, 1,
-0.929194, -0.2014133, -2.60235, 1, 1, 1, 1, 1,
-0.9214746, -0.2434105, -2.008993, 1, 1, 1, 1, 1,
-0.9210494, -2.408727, -2.942945, 1, 1, 1, 1, 1,
-0.9208353, 2.544381, 0.6747881, 1, 1, 1, 1, 1,
-0.9167142, 1.803829, -2.484083, 1, 1, 1, 1, 1,
-0.9159656, -2.668292, -5.166618, 0, 0, 1, 1, 1,
-0.9092292, -1.272141, -2.914567, 1, 0, 0, 1, 1,
-0.9040769, 0.6763687, -1.099793, 1, 0, 0, 1, 1,
-0.8921334, 0.672346, -1.781551, 1, 0, 0, 1, 1,
-0.8919828, 1.233873, -1.010268, 1, 0, 0, 1, 1,
-0.8897621, -0.9640391, -1.639354, 1, 0, 0, 1, 1,
-0.8878325, -1.038662, -3.078695, 0, 0, 0, 1, 1,
-0.8866051, 2.058458, -1.009475, 0, 0, 0, 1, 1,
-0.8813472, 0.9192482, -0.01308589, 0, 0, 0, 1, 1,
-0.8808173, 0.8781595, 0.0556309, 0, 0, 0, 1, 1,
-0.8799637, -0.3394744, -1.940123, 0, 0, 0, 1, 1,
-0.8729905, -1.209395, -1.486132, 0, 0, 0, 1, 1,
-0.8717728, 0.03318053, -1.568438, 0, 0, 0, 1, 1,
-0.8659571, 0.5541356, -1.420971, 1, 1, 1, 1, 1,
-0.8655904, -0.2862794, 0.4940632, 1, 1, 1, 1, 1,
-0.8568773, 0.6308906, -0.1751844, 1, 1, 1, 1, 1,
-0.8516343, 0.3119963, -1.62598, 1, 1, 1, 1, 1,
-0.8452293, -0.6225926, -1.831847, 1, 1, 1, 1, 1,
-0.8408844, -0.1133108, -1.048195, 1, 1, 1, 1, 1,
-0.8367392, 0.4877902, -1.66515, 1, 1, 1, 1, 1,
-0.8358336, 2.913988, 0.4417076, 1, 1, 1, 1, 1,
-0.8337702, -0.504222, -1.843231, 1, 1, 1, 1, 1,
-0.8302758, 0.3092344, -0.7355826, 1, 1, 1, 1, 1,
-0.8282434, 1.022973, -0.7911276, 1, 1, 1, 1, 1,
-0.827346, -2.344725, -2.275006, 1, 1, 1, 1, 1,
-0.8266964, 0.3891955, -1.799438, 1, 1, 1, 1, 1,
-0.8205016, -0.7758833, -3.803428, 1, 1, 1, 1, 1,
-0.8195832, 0.6423991, -1.22648, 1, 1, 1, 1, 1,
-0.8149924, -0.3502784, -3.672644, 0, 0, 1, 1, 1,
-0.8043113, -0.8589652, -2.977473, 1, 0, 0, 1, 1,
-0.8042338, -1.119944, -1.442256, 1, 0, 0, 1, 1,
-0.8022073, 0.06729735, -1.16632, 1, 0, 0, 1, 1,
-0.7950963, 0.9455352, -0.2990593, 1, 0, 0, 1, 1,
-0.7950338, -1.019554, -1.352377, 1, 0, 0, 1, 1,
-0.7819464, 1.184213, 0.3760752, 0, 0, 0, 1, 1,
-0.7815958, 0.1138942, -2.583773, 0, 0, 0, 1, 1,
-0.7797784, 1.504301, -0.7202675, 0, 0, 0, 1, 1,
-0.7709896, 0.6191129, -2.75268, 0, 0, 0, 1, 1,
-0.7683854, -0.3360409, -3.000917, 0, 0, 0, 1, 1,
-0.7680454, -0.7833417, -1.272621, 0, 0, 0, 1, 1,
-0.7679271, 0.1094766, -1.835712, 0, 0, 0, 1, 1,
-0.7665009, 0.569101, -2.085756, 1, 1, 1, 1, 1,
-0.7657369, 0.933284, -0.759725, 1, 1, 1, 1, 1,
-0.7648736, -2.868559, -3.541824, 1, 1, 1, 1, 1,
-0.7645104, 0.9993544, -0.594104, 1, 1, 1, 1, 1,
-0.7633882, 0.420572, -3.120064, 1, 1, 1, 1, 1,
-0.7618814, -0.05267607, -1.138205, 1, 1, 1, 1, 1,
-0.7585204, -2.286076, -2.282071, 1, 1, 1, 1, 1,
-0.7568721, -0.3304991, -1.723602, 1, 1, 1, 1, 1,
-0.7566708, -1.550586, -2.928426, 1, 1, 1, 1, 1,
-0.7564169, -1.593515, -2.61544, 1, 1, 1, 1, 1,
-0.7554352, 0.5571268, -0.006221814, 1, 1, 1, 1, 1,
-0.7546343, 1.776429, -0.2531347, 1, 1, 1, 1, 1,
-0.7506135, 0.2302108, -1.592984, 1, 1, 1, 1, 1,
-0.7429467, -0.5901282, -1.933927, 1, 1, 1, 1, 1,
-0.7414126, 0.54561, -0.5938233, 1, 1, 1, 1, 1,
-0.7401575, 0.142569, -1.09844, 0, 0, 1, 1, 1,
-0.7372158, 1.256864, 0.4399965, 1, 0, 0, 1, 1,
-0.7354844, -0.2722452, -1.706555, 1, 0, 0, 1, 1,
-0.7351961, 0.9366365, 0.06513926, 1, 0, 0, 1, 1,
-0.7326403, 1.004478, 1.163204, 1, 0, 0, 1, 1,
-0.7290583, -0.4784261, -3.388941, 1, 0, 0, 1, 1,
-0.7262853, -1.083841, -3.478817, 0, 0, 0, 1, 1,
-0.7234569, -1.344819, -2.097501, 0, 0, 0, 1, 1,
-0.7231338, 0.6794662, -0.1984042, 0, 0, 0, 1, 1,
-0.7227749, 0.6045721, -1.401862, 0, 0, 0, 1, 1,
-0.7179243, 0.5436923, 0.5522282, 0, 0, 0, 1, 1,
-0.715686, 0.2202978, -0.4612378, 0, 0, 0, 1, 1,
-0.7125481, 0.02890902, 0.2781499, 0, 0, 0, 1, 1,
-0.7061395, 0.2038478, 1.488091, 1, 1, 1, 1, 1,
-0.6908029, 0.8082268, -1.27314, 1, 1, 1, 1, 1,
-0.6813357, -0.759932, -2.051172, 1, 1, 1, 1, 1,
-0.6726286, -0.7647421, -3.400481, 1, 1, 1, 1, 1,
-0.6702937, 1.30854, 0.2833171, 1, 1, 1, 1, 1,
-0.6685222, -0.5213734, -3.580704, 1, 1, 1, 1, 1,
-0.6638675, 0.4132729, -1.271959, 1, 1, 1, 1, 1,
-0.6623197, -0.9212039, -2.815817, 1, 1, 1, 1, 1,
-0.6605589, -0.3770862, -1.026019, 1, 1, 1, 1, 1,
-0.6584175, -0.000403507, -0.8210949, 1, 1, 1, 1, 1,
-0.6577096, -1.631466, -4.889434, 1, 1, 1, 1, 1,
-0.6574785, -0.5410522, -2.46549, 1, 1, 1, 1, 1,
-0.6574745, -0.9162674, -2.173545, 1, 1, 1, 1, 1,
-0.6566643, 0.5211421, -1.74237, 1, 1, 1, 1, 1,
-0.6566427, -2.219156, -1.812927, 1, 1, 1, 1, 1,
-0.6518902, 0.3687206, -1.12694, 0, 0, 1, 1, 1,
-0.6439379, 0.2370952, -2.326163, 1, 0, 0, 1, 1,
-0.6430773, -0.01836229, -2.224721, 1, 0, 0, 1, 1,
-0.639523, 3.279454, 0.008459307, 1, 0, 0, 1, 1,
-0.6257411, 0.2790585, -0.08853251, 1, 0, 0, 1, 1,
-0.6255905, -0.2839619, -0.9211156, 1, 0, 0, 1, 1,
-0.6215732, 0.783491, -0.6121232, 0, 0, 0, 1, 1,
-0.6209377, 0.1256721, -0.640579, 0, 0, 0, 1, 1,
-0.6204723, 0.05826508, -2.272762, 0, 0, 0, 1, 1,
-0.6187, 0.7290556, -0.03854621, 0, 0, 0, 1, 1,
-0.6112067, -0.6282594, -3.619369, 0, 0, 0, 1, 1,
-0.5993546, 1.209859, -2.411412, 0, 0, 0, 1, 1,
-0.5980327, -1.218494, -1.956888, 0, 0, 0, 1, 1,
-0.5966311, -1.798529, -2.173488, 1, 1, 1, 1, 1,
-0.5931333, -1.647281, -2.966441, 1, 1, 1, 1, 1,
-0.5875245, -0.6798384, -2.091214, 1, 1, 1, 1, 1,
-0.5849172, -1.16616, -3.067656, 1, 1, 1, 1, 1,
-0.5817477, 0.4151846, -0.0216165, 1, 1, 1, 1, 1,
-0.5811763, -0.4941541, -3.43316, 1, 1, 1, 1, 1,
-0.5765617, 0.4177841, -0.3721829, 1, 1, 1, 1, 1,
-0.5759668, -0.8957586, -1.853565, 1, 1, 1, 1, 1,
-0.5710098, -0.7272092, -2.757523, 1, 1, 1, 1, 1,
-0.5700103, 0.9924188, 1.710613, 1, 1, 1, 1, 1,
-0.5688463, 0.01547065, -2.195838, 1, 1, 1, 1, 1,
-0.5653811, 0.2270654, -1.121079, 1, 1, 1, 1, 1,
-0.5620776, -0.03677173, -1.667211, 1, 1, 1, 1, 1,
-0.5607337, -0.7115958, -3.054039, 1, 1, 1, 1, 1,
-0.5603881, 0.9672307, -0.4885988, 1, 1, 1, 1, 1,
-0.5559443, -0.8124548, -2.369978, 0, 0, 1, 1, 1,
-0.5546833, 1.429036, -0.9841293, 1, 0, 0, 1, 1,
-0.5528663, 1.107092, -1.945872, 1, 0, 0, 1, 1,
-0.5453048, -0.5448501, -2.624705, 1, 0, 0, 1, 1,
-0.5427155, -1.639714, -1.822834, 1, 0, 0, 1, 1,
-0.5424215, 0.9057853, 1.115696, 1, 0, 0, 1, 1,
-0.5379344, -0.002927504, -1.26755, 0, 0, 0, 1, 1,
-0.5366794, -0.2990335, -1.492641, 0, 0, 0, 1, 1,
-0.5336396, -0.9121528, -3.228392, 0, 0, 0, 1, 1,
-0.5272121, -0.9020191, -1.553612, 0, 0, 0, 1, 1,
-0.5229797, -1.06474, -1.249231, 0, 0, 0, 1, 1,
-0.5157759, 0.1552708, -1.93045, 0, 0, 0, 1, 1,
-0.5150076, -0.3260228, -1.439711, 0, 0, 0, 1, 1,
-0.5140111, -0.7144306, -1.750661, 1, 1, 1, 1, 1,
-0.5128634, -0.9489591, -3.884909, 1, 1, 1, 1, 1,
-0.5120956, -1.862293, -3.735359, 1, 1, 1, 1, 1,
-0.5103627, 0.7547236, -0.1999123, 1, 1, 1, 1, 1,
-0.5090423, -0.6679516, -1.562771, 1, 1, 1, 1, 1,
-0.5083607, 0.9070712, -0.2771424, 1, 1, 1, 1, 1,
-0.507408, -0.8807654, -3.356086, 1, 1, 1, 1, 1,
-0.4985063, 0.5849237, -3.233219, 1, 1, 1, 1, 1,
-0.4927122, 0.1768304, -1.305067, 1, 1, 1, 1, 1,
-0.4904735, -0.07148601, 0.05682506, 1, 1, 1, 1, 1,
-0.489823, -1.298102, -2.485958, 1, 1, 1, 1, 1,
-0.4881104, -0.5852063, -1.694634, 1, 1, 1, 1, 1,
-0.4842085, 0.9684956, -0.6901591, 1, 1, 1, 1, 1,
-0.4840866, -0.2668587, -1.417357, 1, 1, 1, 1, 1,
-0.4813076, 1.488723, -2.241042, 1, 1, 1, 1, 1,
-0.4802325, 0.2673401, 0.03190392, 0, 0, 1, 1, 1,
-0.4799754, -1.187719, -2.618387, 1, 0, 0, 1, 1,
-0.4762021, -0.8877859, -3.457078, 1, 0, 0, 1, 1,
-0.4761555, 0.5808435, -0.6904538, 1, 0, 0, 1, 1,
-0.4726787, -0.2547886, -1.897343, 1, 0, 0, 1, 1,
-0.4726013, -0.9752561, -4.374043, 1, 0, 0, 1, 1,
-0.4724768, 0.8619578, -0.7696373, 0, 0, 0, 1, 1,
-0.4655366, -0.0332323, 0.8797665, 0, 0, 0, 1, 1,
-0.4636938, 0.9382268, -0.6099092, 0, 0, 0, 1, 1,
-0.4635869, -1.611069, -3.294578, 0, 0, 0, 1, 1,
-0.4612136, 1.546068, -1.124334, 0, 0, 0, 1, 1,
-0.4550712, -0.5998993, -1.121015, 0, 0, 0, 1, 1,
-0.4481597, 0.4328777, 0.8804318, 0, 0, 0, 1, 1,
-0.443745, 0.5999903, 0.3569287, 1, 1, 1, 1, 1,
-0.4431289, 0.4241405, -1.64753, 1, 1, 1, 1, 1,
-0.4404742, 0.4594533, -2.10056, 1, 1, 1, 1, 1,
-0.437421, 1.468692, -0.2043452, 1, 1, 1, 1, 1,
-0.4329991, 1.270296, -0.9117524, 1, 1, 1, 1, 1,
-0.4325311, 0.4845131, -2.620777, 1, 1, 1, 1, 1,
-0.4309368, -0.6335117, -2.341106, 1, 1, 1, 1, 1,
-0.425123, 0.3188091, 1.156154, 1, 1, 1, 1, 1,
-0.4224586, -0.4334357, -2.242747, 1, 1, 1, 1, 1,
-0.4211054, 1.24584, -0.8505429, 1, 1, 1, 1, 1,
-0.4195417, 0.9487348, 0.1821501, 1, 1, 1, 1, 1,
-0.4147193, -0.7607042, -3.050308, 1, 1, 1, 1, 1,
-0.4109268, 0.5253388, -2.409078, 1, 1, 1, 1, 1,
-0.4004531, -0.5846754, -2.860927, 1, 1, 1, 1, 1,
-0.3981681, 0.5655822, 0.07403117, 1, 1, 1, 1, 1,
-0.3954875, 0.5677544, -0.8725489, 0, 0, 1, 1, 1,
-0.3892267, 1.060952, 0.4471369, 1, 0, 0, 1, 1,
-0.3779831, 0.0400024, -1.135843, 1, 0, 0, 1, 1,
-0.3755207, 0.3627943, 0.5742899, 1, 0, 0, 1, 1,
-0.3744358, 0.9406637, -0.09967672, 1, 0, 0, 1, 1,
-0.3734099, 1.235824, -0.8044813, 1, 0, 0, 1, 1,
-0.3721308, -1.042522, -1.670555, 0, 0, 0, 1, 1,
-0.3697823, -1.30142, -1.898263, 0, 0, 0, 1, 1,
-0.3596018, 1.626722, 0.8824758, 0, 0, 0, 1, 1,
-0.3591381, -0.5677239, -0.5880122, 0, 0, 0, 1, 1,
-0.3578481, 0.2723726, -2.62535, 0, 0, 0, 1, 1,
-0.3566414, 2.452001, -0.8910894, 0, 0, 0, 1, 1,
-0.3564144, -0.2419977, -3.303457, 0, 0, 0, 1, 1,
-0.351215, -0.3984378, -1.933546, 1, 1, 1, 1, 1,
-0.3494875, 0.1711094, -2.031431, 1, 1, 1, 1, 1,
-0.3471686, -0.1885817, -3.088057, 1, 1, 1, 1, 1,
-0.3454183, -0.4480135, -1.812356, 1, 1, 1, 1, 1,
-0.3421481, -0.6473245, -2.156525, 1, 1, 1, 1, 1,
-0.3410949, 2.183953, -0.245045, 1, 1, 1, 1, 1,
-0.3390332, 1.28609, -1.311961, 1, 1, 1, 1, 1,
-0.3380642, -0.4376038, -2.853594, 1, 1, 1, 1, 1,
-0.3324345, -0.2169137, -2.207354, 1, 1, 1, 1, 1,
-0.3306654, 0.6715161, -1.95019, 1, 1, 1, 1, 1,
-0.3299421, -0.2948765, -4.188466, 1, 1, 1, 1, 1,
-0.3299176, -0.4863997, -1.613297, 1, 1, 1, 1, 1,
-0.3289039, 0.8728989, -1.492999, 1, 1, 1, 1, 1,
-0.3267961, 1.680291, -0.9190937, 1, 1, 1, 1, 1,
-0.3228954, 0.7870871, -1.639244, 1, 1, 1, 1, 1,
-0.3192787, -0.9347678, -3.562595, 0, 0, 1, 1, 1,
-0.3174416, -0.5776797, -0.4719127, 1, 0, 0, 1, 1,
-0.3132949, -0.5108326, -1.376853, 1, 0, 0, 1, 1,
-0.3112732, 0.9624698, -1.060851, 1, 0, 0, 1, 1,
-0.304166, 0.6017292, -0.5102896, 1, 0, 0, 1, 1,
-0.3016555, 0.6510772, -1.075677, 1, 0, 0, 1, 1,
-0.2967969, -0.1177415, -2.277458, 0, 0, 0, 1, 1,
-0.2943988, -0.1356604, -1.178557, 0, 0, 0, 1, 1,
-0.2921132, -2.088886, -6.173774, 0, 0, 0, 1, 1,
-0.2907532, 0.1577301, 0.1860926, 0, 0, 0, 1, 1,
-0.2804144, 1.264639, -0.709011, 0, 0, 0, 1, 1,
-0.273919, 0.479841, 0.3712096, 0, 0, 0, 1, 1,
-0.268348, 0.06517716, -3.540694, 0, 0, 0, 1, 1,
-0.2669335, 0.2986411, 0.3065436, 1, 1, 1, 1, 1,
-0.2655841, 2.50388, 0.1686613, 1, 1, 1, 1, 1,
-0.2622655, -0.6173644, -3.450531, 1, 1, 1, 1, 1,
-0.2609953, 0.2902794, 0.8662319, 1, 1, 1, 1, 1,
-0.260584, 0.04829048, 0.89389, 1, 1, 1, 1, 1,
-0.2590045, 1.509766, 0.807267, 1, 1, 1, 1, 1,
-0.2573525, -0.7676229, -2.62131, 1, 1, 1, 1, 1,
-0.2569312, 0.610112, 1.717604, 1, 1, 1, 1, 1,
-0.2560368, -1.070947, -3.132153, 1, 1, 1, 1, 1,
-0.2462687, 0.6391479, -0.4447252, 1, 1, 1, 1, 1,
-0.2389449, -0.004577407, 0.01073752, 1, 1, 1, 1, 1,
-0.2362364, -0.1999321, 0.1422714, 1, 1, 1, 1, 1,
-0.235892, -0.9956403, -4.926398, 1, 1, 1, 1, 1,
-0.2299, 0.8465158, -0.9275781, 1, 1, 1, 1, 1,
-0.2289415, 1.164071, -0.1132721, 1, 1, 1, 1, 1,
-0.2247599, -0.2828528, -0.5849444, 0, 0, 1, 1, 1,
-0.2245823, -0.7465738, -2.809231, 1, 0, 0, 1, 1,
-0.2224609, 0.4682506, -1.685971, 1, 0, 0, 1, 1,
-0.218633, -0.8220366, -5.486874, 1, 0, 0, 1, 1,
-0.217869, 0.3680685, -0.6955553, 1, 0, 0, 1, 1,
-0.2173757, -0.3770198, -3.090961, 1, 0, 0, 1, 1,
-0.2122371, -0.8671275, -1.647686, 0, 0, 0, 1, 1,
-0.2112191, -0.2248933, -0.9828621, 0, 0, 0, 1, 1,
-0.2094387, 0.3422236, -2.696588, 0, 0, 0, 1, 1,
-0.2005746, -0.4550415, -0.9871503, 0, 0, 0, 1, 1,
-0.2000043, 0.2849759, 1.134742, 0, 0, 0, 1, 1,
-0.198352, 1.157957, -0.05728516, 0, 0, 0, 1, 1,
-0.1964229, 0.07495249, -1.849745, 0, 0, 0, 1, 1,
-0.1955833, 0.1834142, -1.251257, 1, 1, 1, 1, 1,
-0.1940537, 1.652035, -0.3133291, 1, 1, 1, 1, 1,
-0.1935489, 1.620863, -1.148606, 1, 1, 1, 1, 1,
-0.1919636, 0.5917278, 0.01049439, 1, 1, 1, 1, 1,
-0.1906793, 0.3560896, 0.1358192, 1, 1, 1, 1, 1,
-0.1889485, 0.2241433, 0.05941267, 1, 1, 1, 1, 1,
-0.1865886, 0.5251165, -0.02049798, 1, 1, 1, 1, 1,
-0.1804323, -0.8068884, -2.844236, 1, 1, 1, 1, 1,
-0.1792194, -0.5927473, -2.679351, 1, 1, 1, 1, 1,
-0.1785312, 0.8855426, 1.249988, 1, 1, 1, 1, 1,
-0.1781953, -0.8229853, -0.9120021, 1, 1, 1, 1, 1,
-0.1778222, 0.6577354, 0.755727, 1, 1, 1, 1, 1,
-0.1760603, 0.2148658, -2.480532, 1, 1, 1, 1, 1,
-0.1759811, -0.6447947, -2.25126, 1, 1, 1, 1, 1,
-0.1716893, -0.08514629, -3.438505, 1, 1, 1, 1, 1,
-0.1704114, 0.3987737, -0.5176003, 0, 0, 1, 1, 1,
-0.16913, 0.5933427, -0.9036235, 1, 0, 0, 1, 1,
-0.1654873, -0.4292072, -2.331016, 1, 0, 0, 1, 1,
-0.1652579, -0.1843736, -2.675365, 1, 0, 0, 1, 1,
-0.1625911, 0.5349252, 0.4131505, 1, 0, 0, 1, 1,
-0.1602442, 0.3467818, -0.3142149, 1, 0, 0, 1, 1,
-0.1594427, 0.9749526, 0.2181176, 0, 0, 0, 1, 1,
-0.1555365, 1.07476, -0.7334099, 0, 0, 0, 1, 1,
-0.1537197, -0.8908161, -3.279065, 0, 0, 0, 1, 1,
-0.1520162, 0.9764161, 1.657887, 0, 0, 0, 1, 1,
-0.1518168, -0.5521433, -1.575648, 0, 0, 0, 1, 1,
-0.1507667, 0.5060692, 0.70609, 0, 0, 0, 1, 1,
-0.1481807, 0.2426002, -1.042663, 0, 0, 0, 1, 1,
-0.1463371, -0.001329167, -1.851119, 1, 1, 1, 1, 1,
-0.144891, -1.697528, -3.553191, 1, 1, 1, 1, 1,
-0.1440972, -1.808338, -2.891007, 1, 1, 1, 1, 1,
-0.1434965, -1.342143, -2.299237, 1, 1, 1, 1, 1,
-0.1415552, -0.5598227, -4.126378, 1, 1, 1, 1, 1,
-0.1278269, -0.4053189, -2.876148, 1, 1, 1, 1, 1,
-0.1222902, -0.339443, -4.806307, 1, 1, 1, 1, 1,
-0.1193578, -0.103897, -1.730322, 1, 1, 1, 1, 1,
-0.1181285, 0.01408412, -2.797246, 1, 1, 1, 1, 1,
-0.1157091, 1.560951, -1.305915, 1, 1, 1, 1, 1,
-0.114933, -0.1974456, -2.193138, 1, 1, 1, 1, 1,
-0.1133945, -0.3960239, -2.739267, 1, 1, 1, 1, 1,
-0.1124829, 0.6197335, -2.222056, 1, 1, 1, 1, 1,
-0.1101247, -1.767375, -4.916751, 1, 1, 1, 1, 1,
-0.1079147, -0.02227733, -1.190834, 1, 1, 1, 1, 1,
-0.10573, 0.7544445, -0.4820359, 0, 0, 1, 1, 1,
-0.1042503, -0.3447614, -1.010686, 1, 0, 0, 1, 1,
-0.1036039, 0.542195, -1.992895, 1, 0, 0, 1, 1,
-0.1020977, 1.19494, -0.3502506, 1, 0, 0, 1, 1,
-0.1016525, 0.9228318, 0.1627493, 1, 0, 0, 1, 1,
-0.1010695, -1.209365, -4.470366, 1, 0, 0, 1, 1,
-0.09974983, 1.052352, -0.4706789, 0, 0, 0, 1, 1,
-0.09790398, -3.137051, -4.018779, 0, 0, 0, 1, 1,
-0.09658118, -0.3069822, -3.089858, 0, 0, 0, 1, 1,
-0.09607834, 1.508368, -0.3881944, 0, 0, 0, 1, 1,
-0.09165701, 0.2609222, -0.3483096, 0, 0, 0, 1, 1,
-0.0903279, 0.8183815, -2.773069, 0, 0, 0, 1, 1,
-0.09009742, -1.114932, -3.391557, 0, 0, 0, 1, 1,
-0.08519372, -0.1996416, -3.611343, 1, 1, 1, 1, 1,
-0.08205987, -0.4047503, -2.991833, 1, 1, 1, 1, 1,
-0.07802947, 0.6244253, -0.5904196, 1, 1, 1, 1, 1,
-0.07636444, -0.1499799, -1.131337, 1, 1, 1, 1, 1,
-0.07457232, 0.8845142, 1.080281, 1, 1, 1, 1, 1,
-0.07309799, -0.607842, -4.156244, 1, 1, 1, 1, 1,
-0.06933373, -0.3450042, -2.458427, 1, 1, 1, 1, 1,
-0.06546521, -0.3322432, -4.130999, 1, 1, 1, 1, 1,
-0.06086081, -0.7823333, -2.549933, 1, 1, 1, 1, 1,
-0.06077819, 1.616994, -0.8300551, 1, 1, 1, 1, 1,
-0.05733048, 0.08444368, -1.76603, 1, 1, 1, 1, 1,
-0.05650307, -0.2263057, -2.777848, 1, 1, 1, 1, 1,
-0.05552302, 1.019491, 1.057062, 1, 1, 1, 1, 1,
-0.05381026, -1.967034, -2.034169, 1, 1, 1, 1, 1,
-0.04647643, 0.3704515, -0.1469359, 1, 1, 1, 1, 1,
-0.04532374, 1.546759, -0.7333668, 0, 0, 1, 1, 1,
-0.04275391, -0.2510029, -2.86509, 1, 0, 0, 1, 1,
-0.04052059, -0.4948759, -1.9073, 1, 0, 0, 1, 1,
-0.03962988, -0.3438113, -2.215704, 1, 0, 0, 1, 1,
-0.03514853, -0.4731249, -0.7049224, 1, 0, 0, 1, 1,
-0.03471223, 0.2948754, 0.392953, 1, 0, 0, 1, 1,
-0.03166448, -0.2394143, -2.379065, 0, 0, 0, 1, 1,
-0.03123225, 1.52156, -0.8820398, 0, 0, 0, 1, 1,
-0.02490447, 0.08856462, 0.00396635, 0, 0, 0, 1, 1,
-0.02469275, -1.619995, -1.657578, 0, 0, 0, 1, 1,
-0.01833382, 0.04173537, 0.3309292, 0, 0, 0, 1, 1,
-0.01695171, -0.7977143, -2.968969, 0, 0, 0, 1, 1,
-0.01334696, 0.009706863, -0.1827889, 0, 0, 0, 1, 1,
-0.01259853, 0.9126082, 0.8106025, 1, 1, 1, 1, 1,
-0.01070791, -0.1296357, -1.243229, 1, 1, 1, 1, 1,
-0.009382684, -0.7226818, -4.511443, 1, 1, 1, 1, 1,
-0.009061554, -1.309611, -3.383522, 1, 1, 1, 1, 1,
7.032729e-05, -0.3755845, 4.724476, 1, 1, 1, 1, 1,
0.002023877, 0.3735645, -0.6063876, 1, 1, 1, 1, 1,
0.002197297, -1.14261, 3.075482, 1, 1, 1, 1, 1,
0.005635702, 0.2886794, -0.304119, 1, 1, 1, 1, 1,
0.009037417, 1.268207, 0.9253422, 1, 1, 1, 1, 1,
0.009782963, 0.2935747, 0.1774526, 1, 1, 1, 1, 1,
0.01071294, 1.50392, -0.4846574, 1, 1, 1, 1, 1,
0.01431157, 1.220785, -0.1785197, 1, 1, 1, 1, 1,
0.01971006, 1.214916, 0.9265153, 1, 1, 1, 1, 1,
0.02178826, -0.4284715, 5.507886, 1, 1, 1, 1, 1,
0.02289564, 0.4078125, -0.7759588, 1, 1, 1, 1, 1,
0.02849055, 0.6443823, 0.8217514, 0, 0, 1, 1, 1,
0.03204841, 0.3964183, -1.688422, 1, 0, 0, 1, 1,
0.03306947, 0.6093689, 0.7452754, 1, 0, 0, 1, 1,
0.03355862, -1.449151, 4.191435, 1, 0, 0, 1, 1,
0.03520693, -0.9074989, 2.454592, 1, 0, 0, 1, 1,
0.03747172, 0.06166843, -1.848879, 1, 0, 0, 1, 1,
0.03881074, -0.7624735, 3.93986, 0, 0, 0, 1, 1,
0.04340405, 0.3510544, -0.1335973, 0, 0, 0, 1, 1,
0.05076809, 1.61374, 1.529456, 0, 0, 0, 1, 1,
0.05499338, -1.742842, 1.282493, 0, 0, 0, 1, 1,
0.05585134, 0.05402961, -0.2199408, 0, 0, 0, 1, 1,
0.0579405, 1.161358, 1.104499, 0, 0, 0, 1, 1,
0.05837474, -1.403689, 3.360169, 0, 0, 0, 1, 1,
0.06310621, 1.029896, 0.708218, 1, 1, 1, 1, 1,
0.06653, -1.400318, 3.113619, 1, 1, 1, 1, 1,
0.06886521, 0.7395828, -0.5369674, 1, 1, 1, 1, 1,
0.06944574, -1.14765, 1.539144, 1, 1, 1, 1, 1,
0.07080623, -0.03311139, 2.728173, 1, 1, 1, 1, 1,
0.07698875, 0.3258111, 0.1780937, 1, 1, 1, 1, 1,
0.07824308, -0.1881077, 3.477453, 1, 1, 1, 1, 1,
0.08905458, -0.7908841, 3.130807, 1, 1, 1, 1, 1,
0.09016811, -1.017746, 2.072491, 1, 1, 1, 1, 1,
0.09976639, 0.06928912, -0.1462695, 1, 1, 1, 1, 1,
0.1017774, 2.609747, 0.2624788, 1, 1, 1, 1, 1,
0.1034363, 0.09887017, 1.015063, 1, 1, 1, 1, 1,
0.1048368, -2.306323, 5.072986, 1, 1, 1, 1, 1,
0.1068765, 1.037494, 0.401451, 1, 1, 1, 1, 1,
0.1110795, -0.7695543, 2.375993, 1, 1, 1, 1, 1,
0.1193886, 0.8988252, 0.05447749, 0, 0, 1, 1, 1,
0.1223589, -0.6271513, 1.530184, 1, 0, 0, 1, 1,
0.1241202, 0.3202761, -0.9519244, 1, 0, 0, 1, 1,
0.1294091, -1.594185, 2.241562, 1, 0, 0, 1, 1,
0.1294499, -0.02613474, 1.905086, 1, 0, 0, 1, 1,
0.132109, -0.4939472, 3.139278, 1, 0, 0, 1, 1,
0.1337847, 0.2899242, -1.590298, 0, 0, 0, 1, 1,
0.1360699, 1.432228, 0.4720787, 0, 0, 0, 1, 1,
0.1371049, 0.1981657, 1.29192, 0, 0, 0, 1, 1,
0.1381653, 0.293311, 0.4243608, 0, 0, 0, 1, 1,
0.1410323, 1.432852, 0.660841, 0, 0, 0, 1, 1,
0.1435956, -1.171454, 4.448523, 0, 0, 0, 1, 1,
0.1483757, -1.27883, 2.952917, 0, 0, 0, 1, 1,
0.1519702, -0.4488195, 2.870939, 1, 1, 1, 1, 1,
0.1590544, 1.134125, 0.4674364, 1, 1, 1, 1, 1,
0.1600294, -1.405341, 0.5599229, 1, 1, 1, 1, 1,
0.1605759, 0.5254217, 1.479794, 1, 1, 1, 1, 1,
0.1632994, 0.221271, 0.296208, 1, 1, 1, 1, 1,
0.1644989, 1.258394, -0.9793038, 1, 1, 1, 1, 1,
0.1659001, -0.2378606, 2.843068, 1, 1, 1, 1, 1,
0.1671956, 0.3304336, 0.352793, 1, 1, 1, 1, 1,
0.1690457, -1.59483, 2.988112, 1, 1, 1, 1, 1,
0.1714027, -0.07186291, 1.812905, 1, 1, 1, 1, 1,
0.1746945, -0.9199861, 4.998934, 1, 1, 1, 1, 1,
0.1748676, -0.9132991, 3.669043, 1, 1, 1, 1, 1,
0.1788223, 0.4271144, 1.033953, 1, 1, 1, 1, 1,
0.1812863, -1.527696, 3.264726, 1, 1, 1, 1, 1,
0.1814247, -0.9380824, 2.285461, 1, 1, 1, 1, 1,
0.1829389, 0.008074122, 2.551345, 0, 0, 1, 1, 1,
0.1853082, -0.430345, 1.62187, 1, 0, 0, 1, 1,
0.1862231, -0.9445966, 2.857744, 1, 0, 0, 1, 1,
0.1899445, -2.009185, 2.423867, 1, 0, 0, 1, 1,
0.190674, -0.7476545, 3.728027, 1, 0, 0, 1, 1,
0.1914826, 0.06798169, 1.712147, 1, 0, 0, 1, 1,
0.192013, -0.6681164, 3.054114, 0, 0, 0, 1, 1,
0.1949531, -1.060219, 2.483927, 0, 0, 0, 1, 1,
0.197639, 0.8613937, 1.192507, 0, 0, 0, 1, 1,
0.1998526, -1.814653, 2.403972, 0, 0, 0, 1, 1,
0.2018374, -0.4532022, 2.97496, 0, 0, 0, 1, 1,
0.2025211, 0.5011595, -0.9402862, 0, 0, 0, 1, 1,
0.2034473, 0.752364, 0.7192699, 0, 0, 0, 1, 1,
0.2056955, 0.21199, 1.122519, 1, 1, 1, 1, 1,
0.2057815, -0.8231212, 3.77205, 1, 1, 1, 1, 1,
0.2059261, -0.1745354, 2.51117, 1, 1, 1, 1, 1,
0.2081892, 0.9521016, 1.464445, 1, 1, 1, 1, 1,
0.210735, -0.8990378, 4.945571, 1, 1, 1, 1, 1,
0.2151006, 0.3642791, -0.1954484, 1, 1, 1, 1, 1,
0.2175682, -0.4196593, 2.036882, 1, 1, 1, 1, 1,
0.2189538, 1.241836, 0.564585, 1, 1, 1, 1, 1,
0.2193256, 0.9625249, 1.494385, 1, 1, 1, 1, 1,
0.225803, 0.7987199, -0.8746622, 1, 1, 1, 1, 1,
0.226484, -1.16313, 2.941686, 1, 1, 1, 1, 1,
0.2288621, -0.2356776, 1.79491, 1, 1, 1, 1, 1,
0.229585, -1.311168, 2.992877, 1, 1, 1, 1, 1,
0.2307395, 0.1665824, 0.9904388, 1, 1, 1, 1, 1,
0.2323131, 0.147473, 1.256558, 1, 1, 1, 1, 1,
0.232579, -0.6527858, 1.258963, 0, 0, 1, 1, 1,
0.237028, 0.6553102, -1.218125, 1, 0, 0, 1, 1,
0.2475252, -1.499976, 5.24506, 1, 0, 0, 1, 1,
0.2495393, -0.1781413, 3.448541, 1, 0, 0, 1, 1,
0.2532908, 1.543495, 0.9454528, 1, 0, 0, 1, 1,
0.2599545, -0.03957587, 0.6454747, 1, 0, 0, 1, 1,
0.2628353, 1.390924, 1.493067, 0, 0, 0, 1, 1,
0.2630607, -1.639653, 2.293357, 0, 0, 0, 1, 1,
0.2647285, 0.221713, 1.341868, 0, 0, 0, 1, 1,
0.2671092, -0.8285602, 2.157982, 0, 0, 0, 1, 1,
0.2680467, -1.250208, 3.980926, 0, 0, 0, 1, 1,
0.2726048, -0.2112849, 1.505868, 0, 0, 0, 1, 1,
0.2743341, -0.7219349, 2.409338, 0, 0, 0, 1, 1,
0.2746743, 0.07038899, 1.10306, 1, 1, 1, 1, 1,
0.282194, 0.530256, 0.8947611, 1, 1, 1, 1, 1,
0.2861886, 1.183849, -0.8821368, 1, 1, 1, 1, 1,
0.2869682, 1.231297, -0.1553211, 1, 1, 1, 1, 1,
0.2897814, -1.1664, 3.635752, 1, 1, 1, 1, 1,
0.2903425, -1.047548, 3.328637, 1, 1, 1, 1, 1,
0.2915712, -1.210532, 1.817286, 1, 1, 1, 1, 1,
0.2924273, 0.7188792, 1.269318, 1, 1, 1, 1, 1,
0.2955768, 0.744305, -0.692363, 1, 1, 1, 1, 1,
0.2955812, 0.2476093, 1.783955, 1, 1, 1, 1, 1,
0.2976178, -0.04476003, 2.42863, 1, 1, 1, 1, 1,
0.300955, -0.0439394, 2.852157, 1, 1, 1, 1, 1,
0.3029764, 1.226733, -0.2021487, 1, 1, 1, 1, 1,
0.3036736, -0.07035196, 2.217498, 1, 1, 1, 1, 1,
0.3081264, -1.04486, 1.414233, 1, 1, 1, 1, 1,
0.3081919, 1.078697, 1.519969, 0, 0, 1, 1, 1,
0.3109117, -0.677628, 4.129831, 1, 0, 0, 1, 1,
0.3136181, 0.3098, -0.01067472, 1, 0, 0, 1, 1,
0.3138855, 0.8360472, 1.567302, 1, 0, 0, 1, 1,
0.3152603, -0.4471662, 2.89503, 1, 0, 0, 1, 1,
0.3153494, 0.6071028, -0.03411407, 1, 0, 0, 1, 1,
0.3204907, 1.376513, 0.7129364, 0, 0, 0, 1, 1,
0.3237595, -1.443683, 2.965277, 0, 0, 0, 1, 1,
0.3308343, -0.7014986, 4.811233, 0, 0, 0, 1, 1,
0.331739, -0.0106349, 2.089598, 0, 0, 0, 1, 1,
0.3339136, -0.1546189, 2.532068, 0, 0, 0, 1, 1,
0.3380018, -0.8799211, 3.364846, 0, 0, 0, 1, 1,
0.3384809, -0.7488326, 3.474739, 0, 0, 0, 1, 1,
0.3387555, 0.625193, 0.2280808, 1, 1, 1, 1, 1,
0.3434386, -1.021478, 1.478435, 1, 1, 1, 1, 1,
0.3450032, -0.690645, 1.407366, 1, 1, 1, 1, 1,
0.3479788, -1.16186, 3.953264, 1, 1, 1, 1, 1,
0.3481819, -0.8268518, 0.2761109, 1, 1, 1, 1, 1,
0.3511986, -1.038379, 4.881374, 1, 1, 1, 1, 1,
0.3628164, 1.098276, 0.422881, 1, 1, 1, 1, 1,
0.3633666, 0.4233079, -1.107008, 1, 1, 1, 1, 1,
0.3703879, 0.1935676, -0.2453724, 1, 1, 1, 1, 1,
0.3761386, 0.9435179, 1.591534, 1, 1, 1, 1, 1,
0.377881, -0.05875627, 2.422714, 1, 1, 1, 1, 1,
0.3818347, -1.858196, 1.551949, 1, 1, 1, 1, 1,
0.3877641, 0.5058689, 0.9632323, 1, 1, 1, 1, 1,
0.3934312, 0.8260587, 1.297434, 1, 1, 1, 1, 1,
0.3962252, 1.583222, -0.4099241, 1, 1, 1, 1, 1,
0.3969952, -0.976881, 2.53235, 0, 0, 1, 1, 1,
0.3975879, 0.3431352, 0.6662109, 1, 0, 0, 1, 1,
0.39798, 0.1629927, 1.350238, 1, 0, 0, 1, 1,
0.3987188, -0.1232924, 1.08708, 1, 0, 0, 1, 1,
0.399009, -0.5508918, 0.8351817, 1, 0, 0, 1, 1,
0.4021095, 0.1559309, 0.1287303, 1, 0, 0, 1, 1,
0.4078319, -1.2806, 4.362342, 0, 0, 0, 1, 1,
0.4090038, -1.373879, 0.8757775, 0, 0, 0, 1, 1,
0.4096613, -0.9621477, 4.304589, 0, 0, 0, 1, 1,
0.4118286, 0.282922, -0.518892, 0, 0, 0, 1, 1,
0.4164709, 0.5922195, 0.9085717, 0, 0, 0, 1, 1,
0.4196921, -0.2417437, 1.961707, 0, 0, 0, 1, 1,
0.4197786, 0.3546121, 2.239142, 0, 0, 0, 1, 1,
0.4199851, 0.2168099, 2.131602, 1, 1, 1, 1, 1,
0.4352832, 0.7172639, -1.163818, 1, 1, 1, 1, 1,
0.4379713, -0.9292279, 2.800848, 1, 1, 1, 1, 1,
0.4404422, 1.375535, 2.177256, 1, 1, 1, 1, 1,
0.443102, -0.007073138, 2.972346, 1, 1, 1, 1, 1,
0.4450392, -1.435241, 3.294499, 1, 1, 1, 1, 1,
0.4485579, 1.220864, 0.1311782, 1, 1, 1, 1, 1,
0.4488871, 0.101633, 0.3046057, 1, 1, 1, 1, 1,
0.4499263, -0.6939899, 0.1747177, 1, 1, 1, 1, 1,
0.4513013, -0.1698065, 1.64348, 1, 1, 1, 1, 1,
0.4531665, 0.6175341, 2.584336, 1, 1, 1, 1, 1,
0.4548107, -0.7570292, 3.171005, 1, 1, 1, 1, 1,
0.4641449, 0.6670195, -1.322811, 1, 1, 1, 1, 1,
0.4674472, 0.2363741, 1.469195, 1, 1, 1, 1, 1,
0.4716369, -0.2005495, 3.206352, 1, 1, 1, 1, 1,
0.4819081, 0.9204311, 2.276379, 0, 0, 1, 1, 1,
0.4828299, 1.596511, 1.036095, 1, 0, 0, 1, 1,
0.4829897, -0.7893693, 3.438526, 1, 0, 0, 1, 1,
0.4854872, -0.4689737, 0.7103599, 1, 0, 0, 1, 1,
0.4929058, -1.385251, 3.291665, 1, 0, 0, 1, 1,
0.4986449, -1.204221, 4.505497, 1, 0, 0, 1, 1,
0.5028346, -1.477508, 2.566515, 0, 0, 0, 1, 1,
0.503832, -0.1562331, 2.106446, 0, 0, 0, 1, 1,
0.5061026, 1.410903, 1.095876, 0, 0, 0, 1, 1,
0.5064263, 2.412283, 0.5380986, 0, 0, 0, 1, 1,
0.5065901, -1.137814, 2.092719, 0, 0, 0, 1, 1,
0.5244926, 0.04229173, 2.938491, 0, 0, 0, 1, 1,
0.5268808, -1.178154, 4.048182, 0, 0, 0, 1, 1,
0.5332827, -0.9370955, 2.239724, 1, 1, 1, 1, 1,
0.5361331, 0.4033159, 1.738667, 1, 1, 1, 1, 1,
0.5374989, -0.2000018, 0.5267684, 1, 1, 1, 1, 1,
0.5407705, -0.3256913, 2.765001, 1, 1, 1, 1, 1,
0.541034, -0.4206693, 1.812284, 1, 1, 1, 1, 1,
0.5435814, 1.579098, -0.8930089, 1, 1, 1, 1, 1,
0.545417, -1.090186, 4.070734, 1, 1, 1, 1, 1,
0.547602, 0.4447976, 2.732926, 1, 1, 1, 1, 1,
0.5579463, 0.2611113, 0.5398701, 1, 1, 1, 1, 1,
0.5597574, -1.457554, 3.413961, 1, 1, 1, 1, 1,
0.5598699, 0.2353554, -0.323826, 1, 1, 1, 1, 1,
0.5607519, -0.9591413, 2.024898, 1, 1, 1, 1, 1,
0.5656901, 0.5100254, 1.439846, 1, 1, 1, 1, 1,
0.5669247, 0.0616651, 0.9521086, 1, 1, 1, 1, 1,
0.5676023, 0.5634593, -0.3779399, 1, 1, 1, 1, 1,
0.5694268, 0.6263813, -0.4071537, 0, 0, 1, 1, 1,
0.5712935, 0.03181449, 3.28198, 1, 0, 0, 1, 1,
0.5714273, -1.129653, 3.384155, 1, 0, 0, 1, 1,
0.5720478, -0.4231317, 2.111152, 1, 0, 0, 1, 1,
0.5732529, -0.4660269, 2.744914, 1, 0, 0, 1, 1,
0.574783, 1.598457, 0.3672631, 1, 0, 0, 1, 1,
0.5779591, 2.399914, -1.986204, 0, 0, 0, 1, 1,
0.582342, 0.5051666, 0.4110112, 0, 0, 0, 1, 1,
0.5834858, 1.194362, 0.6491125, 0, 0, 0, 1, 1,
0.5848389, 0.7115272, 3.72647, 0, 0, 0, 1, 1,
0.5853963, 0.1899659, 2.857354, 0, 0, 0, 1, 1,
0.5881956, 1.506808, -0.284266, 0, 0, 0, 1, 1,
0.5901717, -0.1288661, 3.636529, 0, 0, 0, 1, 1,
0.5916171, 1.571946, 2.362243, 1, 1, 1, 1, 1,
0.5924413, 1.313176, 0.8118906, 1, 1, 1, 1, 1,
0.592772, -0.2953291, 0.5569777, 1, 1, 1, 1, 1,
0.6013725, 0.3427773, 0.9118977, 1, 1, 1, 1, 1,
0.601408, 0.1334246, 1.576246, 1, 1, 1, 1, 1,
0.6047002, 0.4279358, 0.5021059, 1, 1, 1, 1, 1,
0.612143, 1.353827, -1.595729, 1, 1, 1, 1, 1,
0.6171645, 0.4202308, 0.232741, 1, 1, 1, 1, 1,
0.6180575, 0.8838325, 1.595461, 1, 1, 1, 1, 1,
0.6216533, -0.4047295, 3.011953, 1, 1, 1, 1, 1,
0.6238856, 1.8913, -0.09363838, 1, 1, 1, 1, 1,
0.6250361, -0.3740575, 0.9441253, 1, 1, 1, 1, 1,
0.63001, 0.7542899, 0.1573285, 1, 1, 1, 1, 1,
0.6356584, -0.6511384, 3.698495, 1, 1, 1, 1, 1,
0.6365582, 0.6839439, 1.593125, 1, 1, 1, 1, 1,
0.6427929, -0.6770827, 0.0233941, 0, 0, 1, 1, 1,
0.6459508, -0.7589688, 3.289403, 1, 0, 0, 1, 1,
0.6471364, 0.3582594, 1.305741, 1, 0, 0, 1, 1,
0.6551251, 0.5238194, 0.8927767, 1, 0, 0, 1, 1,
0.6604742, -1.019755, 3.298654, 1, 0, 0, 1, 1,
0.6641566, 1.18527, 0.02976349, 1, 0, 0, 1, 1,
0.6655806, 0.4316541, 0.06937128, 0, 0, 0, 1, 1,
0.6661554, -0.06051815, 2.630931, 0, 0, 0, 1, 1,
0.6668257, -0.6990051, 1.996729, 0, 0, 0, 1, 1,
0.6701258, -0.5933971, 2.102904, 0, 0, 0, 1, 1,
0.6720594, -0.389293, 2.360977, 0, 0, 0, 1, 1,
0.6873144, -1.595642, 0.8379986, 0, 0, 0, 1, 1,
0.6979866, 0.7148137, -0.1735197, 0, 0, 0, 1, 1,
0.6994429, 0.5977817, 1.939862, 1, 1, 1, 1, 1,
0.7039885, -3.457904, 2.230739, 1, 1, 1, 1, 1,
0.7098004, -1.203313, 2.787078, 1, 1, 1, 1, 1,
0.7107709, -0.322642, 1.140988, 1, 1, 1, 1, 1,
0.7133716, 1.635974, 0.734952, 1, 1, 1, 1, 1,
0.7188072, 0.3222128, 1.110876, 1, 1, 1, 1, 1,
0.7232776, -2.939797, 1.027047, 1, 1, 1, 1, 1,
0.7233037, 0.2303045, 0.8555664, 1, 1, 1, 1, 1,
0.7236176, -0.387216, -0.3218448, 1, 1, 1, 1, 1,
0.7238687, 0.5727, 2.880729, 1, 1, 1, 1, 1,
0.7286162, 0.3964215, 0.7566091, 1, 1, 1, 1, 1,
0.7298335, -0.4488441, 4.389737, 1, 1, 1, 1, 1,
0.7303578, 0.5660813, 0.7690456, 1, 1, 1, 1, 1,
0.7319357, -0.4870393, 1.972397, 1, 1, 1, 1, 1,
0.7334045, -0.07798576, 2.213506, 1, 1, 1, 1, 1,
0.740406, -1.090153, 2.068088, 0, 0, 1, 1, 1,
0.7407095, 0.1404323, 1.692588, 1, 0, 0, 1, 1,
0.7428492, -1.558932, 3.84697, 1, 0, 0, 1, 1,
0.7428806, -1.516566, 0.6758178, 1, 0, 0, 1, 1,
0.7553876, -1.103637, 0.7353666, 1, 0, 0, 1, 1,
0.7557394, 0.1708436, 0.6055791, 1, 0, 0, 1, 1,
0.7589127, -0.9843355, 4.146072, 0, 0, 0, 1, 1,
0.7619563, -1.631539, 1.886047, 0, 0, 0, 1, 1,
0.7704098, -0.2091006, 0.8550051, 0, 0, 0, 1, 1,
0.7776397, -2.313256, 2.477859, 0, 0, 0, 1, 1,
0.7799422, -0.7389129, 1.586063, 0, 0, 0, 1, 1,
0.7812923, -0.06619371, 1.681795, 0, 0, 0, 1, 1,
0.7858979, -0.7034451, 0.8845858, 0, 0, 0, 1, 1,
0.7871451, 0.4331641, 2.088039, 1, 1, 1, 1, 1,
0.790437, 1.616154, 0.4051147, 1, 1, 1, 1, 1,
0.7921508, 0.5963243, 0.6101155, 1, 1, 1, 1, 1,
0.7936743, 0.5488241, 1.947016, 1, 1, 1, 1, 1,
0.7971028, 0.7262269, -0.8272239, 1, 1, 1, 1, 1,
0.7982437, 0.4877258, -1.021373, 1, 1, 1, 1, 1,
0.8016756, -0.5622301, 1.0771, 1, 1, 1, 1, 1,
0.8068444, -1.047956, 1.963771, 1, 1, 1, 1, 1,
0.8086532, 0.5624754, 0.6745185, 1, 1, 1, 1, 1,
0.8252926, -0.8750387, 1.172734, 1, 1, 1, 1, 1,
0.825861, 0.4787451, 2.239059, 1, 1, 1, 1, 1,
0.8265314, -0.06952284, 0.80817, 1, 1, 1, 1, 1,
0.8267363, -1.200204, 0.8539183, 1, 1, 1, 1, 1,
0.8278549, -0.08591598, 2.030469, 1, 1, 1, 1, 1,
0.8322701, -0.4196972, 2.431822, 1, 1, 1, 1, 1,
0.8491507, 0.09576484, 0.3150691, 0, 0, 1, 1, 1,
0.8494835, 0.7172484, 0.08971142, 1, 0, 0, 1, 1,
0.8602592, 1.354056, 1.076581, 1, 0, 0, 1, 1,
0.8674197, 0.005358201, -0.4291809, 1, 0, 0, 1, 1,
0.8681908, 0.2500259, 0.6904984, 1, 0, 0, 1, 1,
0.8702794, -0.3449458, 1.554742, 1, 0, 0, 1, 1,
0.8743405, -0.09531998, 1.211904, 0, 0, 0, 1, 1,
0.8753999, 0.00170557, 3.966238, 0, 0, 0, 1, 1,
0.8756504, -0.3677768, 1.054124, 0, 0, 0, 1, 1,
0.8759559, 0.6739724, 1.388893, 0, 0, 0, 1, 1,
0.8819332, -2.011381, 2.925349, 0, 0, 0, 1, 1,
0.8884029, 0.5232663, 1.160835, 0, 0, 0, 1, 1,
0.8888453, -1.147342, 0.3935077, 0, 0, 0, 1, 1,
0.8892323, 0.3442304, 2.135853, 1, 1, 1, 1, 1,
0.8948376, -0.07231337, 1.552102, 1, 1, 1, 1, 1,
0.8997286, 2.259469, -0.6305053, 1, 1, 1, 1, 1,
0.9026759, -0.7898532, 1.187559, 1, 1, 1, 1, 1,
0.90934, -0.5691923, 2.105734, 1, 1, 1, 1, 1,
0.9113607, 0.2005389, 0.3106034, 1, 1, 1, 1, 1,
0.9126958, 1.180794, 2.396248, 1, 1, 1, 1, 1,
0.9194763, 1.238244, -0.1872907, 1, 1, 1, 1, 1,
0.9256457, -1.250541, 3.581558, 1, 1, 1, 1, 1,
0.9258255, 0.3321872, 1.748194, 1, 1, 1, 1, 1,
0.926672, -0.977348, 2.145065, 1, 1, 1, 1, 1,
0.9296194, -0.8402379, 3.627392, 1, 1, 1, 1, 1,
0.9347719, -1.619917, 1.664048, 1, 1, 1, 1, 1,
0.9403442, 1.08858, 1.034115, 1, 1, 1, 1, 1,
0.9414551, 0.7105434, 0.4080533, 1, 1, 1, 1, 1,
0.9478492, 1.192921, 0.005317733, 0, 0, 1, 1, 1,
0.949632, -0.6301603, 0.9743845, 1, 0, 0, 1, 1,
0.9534478, -0.8187299, 1.229589, 1, 0, 0, 1, 1,
0.9547594, 0.1064459, -0.7602753, 1, 0, 0, 1, 1,
0.9562764, 1.057254, 1.15938, 1, 0, 0, 1, 1,
0.9576947, 0.1374085, 1.509667, 1, 0, 0, 1, 1,
0.9626215, -0.08170802, 1.216479, 0, 0, 0, 1, 1,
0.9761997, -0.7567549, 0.9314982, 0, 0, 0, 1, 1,
0.9817071, -1.174208, 3.874803, 0, 0, 0, 1, 1,
0.9839332, 0.1592231, 0.8901889, 0, 0, 0, 1, 1,
1.006082, -0.3989135, 1.983536, 0, 0, 0, 1, 1,
1.006291, -0.255272, -0.006119468, 0, 0, 0, 1, 1,
1.006548, 1.675923, 1.775218, 0, 0, 0, 1, 1,
1.008769, -0.6212492, 2.37691, 1, 1, 1, 1, 1,
1.015017, 0.7014078, 0.9637614, 1, 1, 1, 1, 1,
1.028908, -0.325932, 1.708491, 1, 1, 1, 1, 1,
1.029395, 0.00724436, 1.858126, 1, 1, 1, 1, 1,
1.034521, 0.2879815, 0.04096626, 1, 1, 1, 1, 1,
1.03731, -0.02469004, 2.519506, 1, 1, 1, 1, 1,
1.040053, 0.502043, 1.475219, 1, 1, 1, 1, 1,
1.043281, -0.7673351, 2.046203, 1, 1, 1, 1, 1,
1.047101, 0.4169805, 1.111531, 1, 1, 1, 1, 1,
1.049923, 0.1357466, 0.9474191, 1, 1, 1, 1, 1,
1.050767, -0.9376106, 3.196327, 1, 1, 1, 1, 1,
1.052136, -0.1843541, 0.101976, 1, 1, 1, 1, 1,
1.055072, 1.510091, -0.04270838, 1, 1, 1, 1, 1,
1.063248, 0.7318351, 1.271994, 1, 1, 1, 1, 1,
1.068717, -0.3622349, 2.726727, 1, 1, 1, 1, 1,
1.080506, 0.1881741, 0.2679501, 0, 0, 1, 1, 1,
1.08194, -0.3185787, 1.146575, 1, 0, 0, 1, 1,
1.085131, -1.415565, 2.032305, 1, 0, 0, 1, 1,
1.08834, -1.389365, 3.11638, 1, 0, 0, 1, 1,
1.109303, -0.2873478, 0.4635899, 1, 0, 0, 1, 1,
1.109931, 0.3050149, 2.318801, 1, 0, 0, 1, 1,
1.120323, -0.3590035, 3.188244, 0, 0, 0, 1, 1,
1.12085, -0.8129702, 3.101701, 0, 0, 0, 1, 1,
1.121567, 0.1149365, 1.072278, 0, 0, 0, 1, 1,
1.130405, 1.677545, -0.1930193, 0, 0, 0, 1, 1,
1.139258, 1.498974, 0.4259586, 0, 0, 0, 1, 1,
1.141548, -1.93467, 1.40078, 0, 0, 0, 1, 1,
1.147923, 0.8501055, 2.21854, 0, 0, 0, 1, 1,
1.153986, -0.7799318, 1.04749, 1, 1, 1, 1, 1,
1.155586, 0.2271396, 2.138584, 1, 1, 1, 1, 1,
1.156696, -0.0963681, 0.127821, 1, 1, 1, 1, 1,
1.157261, 0.6710282, 2.222214, 1, 1, 1, 1, 1,
1.159223, -0.1670645, 1.089363, 1, 1, 1, 1, 1,
1.160861, -1.83189, 3.98722, 1, 1, 1, 1, 1,
1.163406, -0.1965815, 1.379011, 1, 1, 1, 1, 1,
1.168713, 1.518345, 0.2630083, 1, 1, 1, 1, 1,
1.170247, -1.883718, 2.330809, 1, 1, 1, 1, 1,
1.170253, 0.4445574, 0.7850195, 1, 1, 1, 1, 1,
1.176517, 0.2041992, 0.2692598, 1, 1, 1, 1, 1,
1.179177, 0.6133419, 2.542221, 1, 1, 1, 1, 1,
1.18207, -0.2109446, 2.751334, 1, 1, 1, 1, 1,
1.183546, 1.43387, -1.498576, 1, 1, 1, 1, 1,
1.190211, -0.1551122, 0.9421275, 1, 1, 1, 1, 1,
1.194369, -1.004798, 3.884856, 0, 0, 1, 1, 1,
1.201599, 0.7231343, 0.8050848, 1, 0, 0, 1, 1,
1.212304, -0.6610631, 1.060653, 1, 0, 0, 1, 1,
1.213828, 0.06049022, 2.731324, 1, 0, 0, 1, 1,
1.216212, -0.6077064, 3.549641, 1, 0, 0, 1, 1,
1.220092, -0.4205657, 2.255227, 1, 0, 0, 1, 1,
1.224938, 0.6192968, 2.020832, 0, 0, 0, 1, 1,
1.232308, -0.4505952, 1.261155, 0, 0, 0, 1, 1,
1.233926, 0.09798635, 1.052927, 0, 0, 0, 1, 1,
1.235054, -1.959875, 3.516663, 0, 0, 0, 1, 1,
1.235358, 1.849299, 0.09980845, 0, 0, 0, 1, 1,
1.236941, -0.7516394, 2.086774, 0, 0, 0, 1, 1,
1.240316, -0.5504448, 0.6472831, 0, 0, 0, 1, 1,
1.242098, -0.6216822, 3.750436, 1, 1, 1, 1, 1,
1.246564, -0.9073343, 0.4156778, 1, 1, 1, 1, 1,
1.269366, -0.5513201, 2.773221, 1, 1, 1, 1, 1,
1.284222, 0.005857631, 3.049429, 1, 1, 1, 1, 1,
1.287125, -0.4957054, 1.286661, 1, 1, 1, 1, 1,
1.288435, 0.7204228, 2.295777, 1, 1, 1, 1, 1,
1.290427, 0.3551996, 0.8414042, 1, 1, 1, 1, 1,
1.292468, -1.183242, 3.149352, 1, 1, 1, 1, 1,
1.302052, -0.2453294, 0.1985129, 1, 1, 1, 1, 1,
1.311664, -0.5491973, 2.162625, 1, 1, 1, 1, 1,
1.313099, 0.63651, 3.134715, 1, 1, 1, 1, 1,
1.313524, -0.3619567, 0.8469693, 1, 1, 1, 1, 1,
1.313687, 0.0004348372, 1.904148, 1, 1, 1, 1, 1,
1.314343, 1.252323, 1.470492, 1, 1, 1, 1, 1,
1.322575, 0.2794475, 1.211162, 1, 1, 1, 1, 1,
1.325071, -0.3434323, 2.524385, 0, 0, 1, 1, 1,
1.330582, 2.411473, -0.458693, 1, 0, 0, 1, 1,
1.351531, -0.4227562, 2.968388, 1, 0, 0, 1, 1,
1.361787, 1.158553, 1.498986, 1, 0, 0, 1, 1,
1.370561, 0.05916701, 0.9148753, 1, 0, 0, 1, 1,
1.381884, 1.439433, 0.5511396, 1, 0, 0, 1, 1,
1.383558, 0.946786, 2.023393, 0, 0, 0, 1, 1,
1.385166, 2.700972, 0.6585925, 0, 0, 0, 1, 1,
1.387672, 1.280148, -0.7723151, 0, 0, 0, 1, 1,
1.39211, 1.43169, 1.123987, 0, 0, 0, 1, 1,
1.408948, 1.429188, 0.1680978, 0, 0, 0, 1, 1,
1.410751, 1.697008, 2.178674, 0, 0, 0, 1, 1,
1.428372, -1.638135, 2.654641, 0, 0, 0, 1, 1,
1.44484, 0.4104945, 0.7585365, 1, 1, 1, 1, 1,
1.44616, -0.1115928, 1.354521, 1, 1, 1, 1, 1,
1.446195, 1.804706, 1.512121, 1, 1, 1, 1, 1,
1.458146, -0.1174682, 0.8946368, 1, 1, 1, 1, 1,
1.465162, -0.5117149, 3.357043, 1, 1, 1, 1, 1,
1.48293, -0.307992, 2.124596, 1, 1, 1, 1, 1,
1.484545, 0.244671, 3.616364, 1, 1, 1, 1, 1,
1.490435, -0.42636, 2.179713, 1, 1, 1, 1, 1,
1.492506, -1.279593, 2.810945, 1, 1, 1, 1, 1,
1.494841, 0.5198036, 2.278485, 1, 1, 1, 1, 1,
1.512257, 0.2481274, 1.293725, 1, 1, 1, 1, 1,
1.522191, 0.3628717, 3.122198, 1, 1, 1, 1, 1,
1.545124, 0.2338246, 1.40589, 1, 1, 1, 1, 1,
1.546316, 0.8217772, -0.5598528, 1, 1, 1, 1, 1,
1.563263, 0.2386995, 1.419444, 1, 1, 1, 1, 1,
1.563567, 2.701969, 0.3246536, 0, 0, 1, 1, 1,
1.579338, -0.5375157, 3.717366, 1, 0, 0, 1, 1,
1.581917, -1.289973, 1.277897, 1, 0, 0, 1, 1,
1.595031, 0.1170186, 1.760871, 1, 0, 0, 1, 1,
1.600341, -0.8715119, 0.5929548, 1, 0, 0, 1, 1,
1.61089, -1.021268, 2.558425, 1, 0, 0, 1, 1,
1.618014, -0.790428, 1.53333, 0, 0, 0, 1, 1,
1.621437, -1.612385, 3.057213, 0, 0, 0, 1, 1,
1.627211, -0.9687926, 2.578296, 0, 0, 0, 1, 1,
1.636982, -0.6319624, 3.776643, 0, 0, 0, 1, 1,
1.637656, 1.199571, 0.342545, 0, 0, 0, 1, 1,
1.653693, -0.413357, 2.311855, 0, 0, 0, 1, 1,
1.661298, -0.1603775, 1.879287, 0, 0, 0, 1, 1,
1.670023, 1.37121, 1.164739, 1, 1, 1, 1, 1,
1.683597, -0.989369, 2.03573, 1, 1, 1, 1, 1,
1.694199, -1.768089, 2.626475, 1, 1, 1, 1, 1,
1.698857, -1.55175, 4.229198, 1, 1, 1, 1, 1,
1.720187, -0.3336591, 2.527043, 1, 1, 1, 1, 1,
1.733803, -0.867183, 2.596274, 1, 1, 1, 1, 1,
1.749905, 1.712832, 1.115734, 1, 1, 1, 1, 1,
1.764642, -0.2997031, -0.09198049, 1, 1, 1, 1, 1,
1.775317, 0.7488632, 1.285708, 1, 1, 1, 1, 1,
1.795655, 0.4697182, 2.829402, 1, 1, 1, 1, 1,
1.802843, 1.642687, 0.5042213, 1, 1, 1, 1, 1,
1.837068, -1.374458, 2.317394, 1, 1, 1, 1, 1,
1.884252, -0.3767582, 2.519357, 1, 1, 1, 1, 1,
1.88574, -2.322344, 2.568536, 1, 1, 1, 1, 1,
1.902717, 0.4799474, -0.206186, 1, 1, 1, 1, 1,
1.9074, 1.27226, -0.303485, 0, 0, 1, 1, 1,
1.972261, 0.3114444, 2.622862, 1, 0, 0, 1, 1,
1.98662, -0.4328067, 0.2398869, 1, 0, 0, 1, 1,
2.001838, -0.1813297, 3.164846, 1, 0, 0, 1, 1,
2.020004, 0.4807697, 1.52685, 1, 0, 0, 1, 1,
2.029482, -0.7254611, 2.824028, 1, 0, 0, 1, 1,
2.032655, -0.4741169, 0.003648931, 0, 0, 0, 1, 1,
2.048131, -0.9330913, 2.337861, 0, 0, 0, 1, 1,
2.115716, -0.3529009, 0.2653826, 0, 0, 0, 1, 1,
2.161438, 0.9381944, 0.5287002, 0, 0, 0, 1, 1,
2.249191, -0.2485709, 1.575538, 0, 0, 0, 1, 1,
2.302867, 1.42159, 0.4609381, 0, 0, 0, 1, 1,
2.408831, 0.3884571, 0.752082, 0, 0, 0, 1, 1,
2.433085, -0.6339299, 0.5677851, 1, 1, 1, 1, 1,
2.469677, 0.2650228, -0.8832352, 1, 1, 1, 1, 1,
2.715455, 0.01226009, 2.256748, 1, 1, 1, 1, 1,
2.780136, -2.31097, 1.28559, 1, 1, 1, 1, 1,
2.825332, -0.7054484, -0.4867235, 1, 1, 1, 1, 1,
2.957024, -0.7046452, 1.337345, 1, 1, 1, 1, 1,
3.479548, -1.220861, 3.300392, 1, 1, 1, 1, 1
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
var radius = 10.24428;
var distance = 35.98261;
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
mvMatrix.translate( 0.04165268, 0.04276204, 0.3329439 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.98261);
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
