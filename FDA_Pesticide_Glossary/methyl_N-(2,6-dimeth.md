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
-3.249476, -1.782705, -2.399447, 1, 0, 0, 1,
-2.793853, 1.244836, -0.360536, 1, 0.007843138, 0, 1,
-2.456747, -0.2393209, -1.209302, 1, 0.01176471, 0, 1,
-2.401108, 0.1033923, -1.748855, 1, 0.01960784, 0, 1,
-2.361509, 0.06422079, -3.637196, 1, 0.02352941, 0, 1,
-2.360008, 0.6047373, -1.062264, 1, 0.03137255, 0, 1,
-2.277183, 0.09568848, -0.9785114, 1, 0.03529412, 0, 1,
-2.253093, 1.215943, -1.655809, 1, 0.04313726, 0, 1,
-2.243624, 1.021675, -1.601404, 1, 0.04705882, 0, 1,
-2.243293, 0.3749112, -1.34358, 1, 0.05490196, 0, 1,
-2.237704, 0.3412838, 0.5353208, 1, 0.05882353, 0, 1,
-2.226703, 0.4337251, -2.246132, 1, 0.06666667, 0, 1,
-2.164069, -0.4415988, -3.011737, 1, 0.07058824, 0, 1,
-2.163666, -0.1964856, -2.587899, 1, 0.07843138, 0, 1,
-2.141104, -2.181203, -1.593685, 1, 0.08235294, 0, 1,
-2.104112, 1.512906, -1.816741, 1, 0.09019608, 0, 1,
-2.102209, 0.7073267, -1.544971, 1, 0.09411765, 0, 1,
-2.088171, 0.8429932, -0.8740729, 1, 0.1019608, 0, 1,
-2.085691, 0.2930487, -0.3728625, 1, 0.1098039, 0, 1,
-2.071428, 1.304406, -1.996884, 1, 0.1137255, 0, 1,
-2.05384, -0.2538164, -0.6520159, 1, 0.1215686, 0, 1,
-2.010252, 0.3041729, -2.030118, 1, 0.1254902, 0, 1,
-2.002756, -0.4681497, -2.418684, 1, 0.1333333, 0, 1,
-1.998178, -0.6309772, 0.02199448, 1, 0.1372549, 0, 1,
-1.979824, 0.9374774, -3.013324, 1, 0.145098, 0, 1,
-1.977812, 0.2675372, -1.032891, 1, 0.1490196, 0, 1,
-1.948287, 0.8880205, -0.9791337, 1, 0.1568628, 0, 1,
-1.920876, 0.4620542, -2.890764, 1, 0.1607843, 0, 1,
-1.86629, 0.8337282, -0.6250161, 1, 0.1686275, 0, 1,
-1.859384, -0.1181746, -1.439525, 1, 0.172549, 0, 1,
-1.798371, -0.6367638, -2.812594, 1, 0.1803922, 0, 1,
-1.794677, 0.4804688, -0.9188203, 1, 0.1843137, 0, 1,
-1.78954, 0.1135799, -1.388319, 1, 0.1921569, 0, 1,
-1.773519, 0.9674674, 0.1198963, 1, 0.1960784, 0, 1,
-1.770128, 0.4499358, -2.84135, 1, 0.2039216, 0, 1,
-1.766289, -1.019755, -1.978506, 1, 0.2117647, 0, 1,
-1.764437, 0.08583539, -1.192604, 1, 0.2156863, 0, 1,
-1.744781, 0.4973175, -1.986786, 1, 0.2235294, 0, 1,
-1.740319, 0.1937057, -1.298772, 1, 0.227451, 0, 1,
-1.738145, 0.3611782, -1.657294, 1, 0.2352941, 0, 1,
-1.733472, 0.4066883, 0.1664865, 1, 0.2392157, 0, 1,
-1.731139, 1.037848, -1.207621, 1, 0.2470588, 0, 1,
-1.725675, -1.34946, -3.087023, 1, 0.2509804, 0, 1,
-1.702481, 0.8858804, -0.8344082, 1, 0.2588235, 0, 1,
-1.699594, -0.01196999, -0.2346607, 1, 0.2627451, 0, 1,
-1.69647, 0.03243795, -1.29767, 1, 0.2705882, 0, 1,
-1.685244, -0.7476935, -3.83017, 1, 0.2745098, 0, 1,
-1.670738, -0.1029071, -0.6567229, 1, 0.282353, 0, 1,
-1.662586, 0.4301457, -1.986614, 1, 0.2862745, 0, 1,
-1.660406, -0.3416954, -0.9326809, 1, 0.2941177, 0, 1,
-1.657288, 0.2756431, -1.652407, 1, 0.3019608, 0, 1,
-1.650759, 0.00678672, -1.959539, 1, 0.3058824, 0, 1,
-1.645606, -0.9672319, -2.455744, 1, 0.3137255, 0, 1,
-1.631994, -0.5172763, -1.225697, 1, 0.3176471, 0, 1,
-1.621575, 1.645957, -1.112575, 1, 0.3254902, 0, 1,
-1.616605, -0.6677086, -1.708578, 1, 0.3294118, 0, 1,
-1.590044, 1.549576, -1.346118, 1, 0.3372549, 0, 1,
-1.585179, 0.6796948, -0.8513795, 1, 0.3411765, 0, 1,
-1.573175, 2.538342, -0.8259866, 1, 0.3490196, 0, 1,
-1.549504, 1.838188, -0.5455475, 1, 0.3529412, 0, 1,
-1.542393, -0.7053628, -2.698359, 1, 0.3607843, 0, 1,
-1.536527, 0.05559943, -1.832343, 1, 0.3647059, 0, 1,
-1.5356, -0.5518691, -2.398227, 1, 0.372549, 0, 1,
-1.525903, -0.8350384, -2.153049, 1, 0.3764706, 0, 1,
-1.521827, -0.1752736, -1.132874, 1, 0.3843137, 0, 1,
-1.512728, -0.5064968, -3.977122, 1, 0.3882353, 0, 1,
-1.497463, -0.2240515, -1.588549, 1, 0.3960784, 0, 1,
-1.492342, -0.05706693, -1.751618, 1, 0.4039216, 0, 1,
-1.479091, 1.927812, -1.723064, 1, 0.4078431, 0, 1,
-1.477183, 0.7493713, -0.09736493, 1, 0.4156863, 0, 1,
-1.459523, 0.5006003, -0.6216748, 1, 0.4196078, 0, 1,
-1.442285, -2.27765, -0.8247495, 1, 0.427451, 0, 1,
-1.442253, -0.5629572, -2.500979, 1, 0.4313726, 0, 1,
-1.43582, -0.7842848, -1.208871, 1, 0.4392157, 0, 1,
-1.420029, -0.7414637, -1.350749, 1, 0.4431373, 0, 1,
-1.412044, 0.2207054, -1.112547, 1, 0.4509804, 0, 1,
-1.376235, -0.07821579, -2.171293, 1, 0.454902, 0, 1,
-1.37577, 0.1042432, -1.476282, 1, 0.4627451, 0, 1,
-1.364437, -0.9469272, -3.899762, 1, 0.4666667, 0, 1,
-1.36081, 0.4996086, -0.9205422, 1, 0.4745098, 0, 1,
-1.35869, -0.1056229, -2.661395, 1, 0.4784314, 0, 1,
-1.357423, 0.547693, -0.920255, 1, 0.4862745, 0, 1,
-1.353665, 0.3529306, -0.9540904, 1, 0.4901961, 0, 1,
-1.348242, -0.8058034, -2.128742, 1, 0.4980392, 0, 1,
-1.347689, 0.3858277, -0.7249744, 1, 0.5058824, 0, 1,
-1.335555, 1.516528, -1.241149, 1, 0.509804, 0, 1,
-1.324646, 2.332856, 1.16438, 1, 0.5176471, 0, 1,
-1.316878, -1.378374, -3.754794, 1, 0.5215687, 0, 1,
-1.31114, 1.009928, -1.251573, 1, 0.5294118, 0, 1,
-1.307459, 0.2087513, -2.46436, 1, 0.5333334, 0, 1,
-1.297092, 0.7166386, 0.5062245, 1, 0.5411765, 0, 1,
-1.296316, -0.8749272, -2.10245, 1, 0.5450981, 0, 1,
-1.293559, 0.1917106, -0.8633846, 1, 0.5529412, 0, 1,
-1.289884, 0.6434512, -0.2011109, 1, 0.5568628, 0, 1,
-1.282301, -0.06867436, -1.939961, 1, 0.5647059, 0, 1,
-1.278641, -0.2688458, 0.1005387, 1, 0.5686275, 0, 1,
-1.278082, -1.365565, -3.356456, 1, 0.5764706, 0, 1,
-1.270903, -2.030404, -3.557075, 1, 0.5803922, 0, 1,
-1.262204, 0.1636919, -1.825316, 1, 0.5882353, 0, 1,
-1.245822, -0.433196, -3.773996, 1, 0.5921569, 0, 1,
-1.235376, -0.8238728, -1.596212, 1, 0.6, 0, 1,
-1.220254, 0.2520715, -1.228613, 1, 0.6078432, 0, 1,
-1.220248, -0.3515804, -2.496616, 1, 0.6117647, 0, 1,
-1.213481, -0.6101223, -1.980247, 1, 0.6196079, 0, 1,
-1.207351, -0.722205, -2.335579, 1, 0.6235294, 0, 1,
-1.198402, -1.380525, -1.190982, 1, 0.6313726, 0, 1,
-1.196542, -0.01036301, -3.928716, 1, 0.6352941, 0, 1,
-1.195802, 0.1724871, -1.746685, 1, 0.6431373, 0, 1,
-1.190702, 2.110797, -0.004118063, 1, 0.6470588, 0, 1,
-1.188861, 0.7703583, -1.029211, 1, 0.654902, 0, 1,
-1.186752, 0.2113989, 0.6687903, 1, 0.6588235, 0, 1,
-1.185574, -1.380482, -2.477019, 1, 0.6666667, 0, 1,
-1.180572, -2.112009, -1.997132, 1, 0.6705883, 0, 1,
-1.176077, -0.6069466, -0.5724858, 1, 0.6784314, 0, 1,
-1.174469, 1.568859, -1.133679, 1, 0.682353, 0, 1,
-1.172464, -1.316093, -0.9493256, 1, 0.6901961, 0, 1,
-1.167793, -0.1651528, -1.05808, 1, 0.6941177, 0, 1,
-1.166735, 0.8721221, -0.5040452, 1, 0.7019608, 0, 1,
-1.161647, -0.07871267, -1.282445, 1, 0.7098039, 0, 1,
-1.159029, 0.5132174, -2.021002, 1, 0.7137255, 0, 1,
-1.150288, -1.38004, -1.265952, 1, 0.7215686, 0, 1,
-1.149152, 0.2537309, -1.102566, 1, 0.7254902, 0, 1,
-1.148627, 0.7024009, -1.603315, 1, 0.7333333, 0, 1,
-1.14215, -2.558537, -4.54769, 1, 0.7372549, 0, 1,
-1.142112, 1.036687, 0.1265438, 1, 0.7450981, 0, 1,
-1.139693, 1.280616, 0.1803872, 1, 0.7490196, 0, 1,
-1.13877, -1.12803, -4.027919, 1, 0.7568628, 0, 1,
-1.135653, -0.07284433, -1.737428, 1, 0.7607843, 0, 1,
-1.133166, 0.1807121, -2.002548, 1, 0.7686275, 0, 1,
-1.129631, 1.767225, 0.9529017, 1, 0.772549, 0, 1,
-1.129349, -1.412423, -2.331979, 1, 0.7803922, 0, 1,
-1.12869, -1.615724, -3.682332, 1, 0.7843137, 0, 1,
-1.127122, 0.5886386, -2.804515, 1, 0.7921569, 0, 1,
-1.126113, -0.9369602, -2.234657, 1, 0.7960784, 0, 1,
-1.125095, 0.9563746, -2.026801, 1, 0.8039216, 0, 1,
-1.122631, 0.6267709, -1.84094, 1, 0.8117647, 0, 1,
-1.120332, -1.232114, -2.453807, 1, 0.8156863, 0, 1,
-1.106083, -1.067842, -2.692231, 1, 0.8235294, 0, 1,
-1.105774, -0.1468861, -1.778454, 1, 0.827451, 0, 1,
-1.105371, -0.4257, -1.163788, 1, 0.8352941, 0, 1,
-1.102253, -1.646102, -4.075428, 1, 0.8392157, 0, 1,
-1.09376, 0.416069, -2.355831, 1, 0.8470588, 0, 1,
-1.093173, 0.5782534, -3.434139, 1, 0.8509804, 0, 1,
-1.090262, -1.275783, -1.749836, 1, 0.8588235, 0, 1,
-1.084453, -0.4465393, -2.375054, 1, 0.8627451, 0, 1,
-1.081007, 0.02215325, -0.3232943, 1, 0.8705882, 0, 1,
-1.079617, -1.848957, -2.738038, 1, 0.8745098, 0, 1,
-1.075496, 0.5217465, -0.1060769, 1, 0.8823529, 0, 1,
-1.07321, -1.371413, -2.320886, 1, 0.8862745, 0, 1,
-1.070482, 1.964472, -0.4147266, 1, 0.8941177, 0, 1,
-1.069487, -0.3480172, -3.682181, 1, 0.8980392, 0, 1,
-1.059582, 1.469638, -0.7581313, 1, 0.9058824, 0, 1,
-1.05849, -1.814579, -2.188686, 1, 0.9137255, 0, 1,
-1.055748, -0.5075465, -2.27641, 1, 0.9176471, 0, 1,
-1.050904, 0.05063032, -1.067364, 1, 0.9254902, 0, 1,
-1.043681, 0.7787516, -1.607093, 1, 0.9294118, 0, 1,
-1.042927, -0.5289564, -3.140751, 1, 0.9372549, 0, 1,
-1.042386, 0.893907, -0.1250155, 1, 0.9411765, 0, 1,
-1.039619, 0.800329, -2.217244, 1, 0.9490196, 0, 1,
-1.036281, 0.1829005, -3.725558, 1, 0.9529412, 0, 1,
-1.033349, 1.221374, -1.940613, 1, 0.9607843, 0, 1,
-1.024162, -1.19383, -2.751985, 1, 0.9647059, 0, 1,
-1.017734, -0.1070061, -2.227951, 1, 0.972549, 0, 1,
-1.011084, 1.271009, 0.3080084, 1, 0.9764706, 0, 1,
-1.008701, 1.167164, -0.596991, 1, 0.9843137, 0, 1,
-1.006416, -0.845381, -0.2554351, 1, 0.9882353, 0, 1,
-1.006045, -1.305385, -4.248998, 1, 0.9960784, 0, 1,
-1.005167, 0.5377995, -1.271742, 0.9960784, 1, 0, 1,
-0.9987198, -0.3853195, -2.0855, 0.9921569, 1, 0, 1,
-0.9982399, -0.3762921, -1.334933, 0.9843137, 1, 0, 1,
-0.9970487, 1.96119, 1.233345, 0.9803922, 1, 0, 1,
-0.9928679, -0.2094542, -2.373664, 0.972549, 1, 0, 1,
-0.9849416, -1.298104, -3.436565, 0.9686275, 1, 0, 1,
-0.9847506, 0.3240842, 1.375338, 0.9607843, 1, 0, 1,
-0.9799476, 2.211271, -1.521667, 0.9568627, 1, 0, 1,
-0.9686633, 0.3351791, 0.03567744, 0.9490196, 1, 0, 1,
-0.9673252, 1.421262, -0.9116942, 0.945098, 1, 0, 1,
-0.9672447, 0.2873215, -2.115419, 0.9372549, 1, 0, 1,
-0.9595357, 1.498748, 1.511041, 0.9333333, 1, 0, 1,
-0.9557598, 0.6156674, -2.278504, 0.9254902, 1, 0, 1,
-0.9458551, -0.8095133, -3.796974, 0.9215686, 1, 0, 1,
-0.9438171, 0.6822754, -0.8609394, 0.9137255, 1, 0, 1,
-0.9435372, 0.1540631, -1.196372, 0.9098039, 1, 0, 1,
-0.9428599, 0.3801024, -0.9783138, 0.9019608, 1, 0, 1,
-0.9420668, -0.07951696, -1.224058, 0.8941177, 1, 0, 1,
-0.9394642, 0.3866833, -1.956113, 0.8901961, 1, 0, 1,
-0.9254944, -1.240106, -1.948106, 0.8823529, 1, 0, 1,
-0.9171523, 0.382015, -0.6817163, 0.8784314, 1, 0, 1,
-0.913763, 1.240373, -0.5304605, 0.8705882, 1, 0, 1,
-0.9081093, -0.4993023, -1.204293, 0.8666667, 1, 0, 1,
-0.9076153, 0.8646659, -1.393594, 0.8588235, 1, 0, 1,
-0.9067582, -0.7680507, -2.812684, 0.854902, 1, 0, 1,
-0.9055201, -0.6776768, -1.956291, 0.8470588, 1, 0, 1,
-0.8972357, -0.8150924, -2.067009, 0.8431373, 1, 0, 1,
-0.8919116, 0.8260539, -0.9021668, 0.8352941, 1, 0, 1,
-0.8845808, 0.4705614, -1.324468, 0.8313726, 1, 0, 1,
-0.8832073, 0.8619303, 0.03051303, 0.8235294, 1, 0, 1,
-0.8803002, 0.7549006, -0.6092547, 0.8196079, 1, 0, 1,
-0.8754455, -0.07541453, -1.972795, 0.8117647, 1, 0, 1,
-0.8752965, -1.822602, -1.027635, 0.8078431, 1, 0, 1,
-0.87318, -0.1105369, -2.142765, 0.8, 1, 0, 1,
-0.8675915, -0.3786786, -3.03595, 0.7921569, 1, 0, 1,
-0.8671116, 0.3455354, 0.0484334, 0.7882353, 1, 0, 1,
-0.8565277, -0.03024813, -2.496524, 0.7803922, 1, 0, 1,
-0.849038, -0.8658829, -5.37973, 0.7764706, 1, 0, 1,
-0.8438484, 1.730508, -0.7792119, 0.7686275, 1, 0, 1,
-0.8429013, -0.0197371, -0.6575391, 0.7647059, 1, 0, 1,
-0.8405452, 0.7106228, -0.4361459, 0.7568628, 1, 0, 1,
-0.8378351, -1.37844, -2.296662, 0.7529412, 1, 0, 1,
-0.8346192, 0.2750292, -2.386232, 0.7450981, 1, 0, 1,
-0.8321939, 0.2291117, -0.4970686, 0.7411765, 1, 0, 1,
-0.8263025, 1.129599, -0.2131259, 0.7333333, 1, 0, 1,
-0.8248336, -1.258778, -1.061854, 0.7294118, 1, 0, 1,
-0.8235875, 1.972512, -0.031826, 0.7215686, 1, 0, 1,
-0.8229322, 0.08096295, -0.9191452, 0.7176471, 1, 0, 1,
-0.8194559, 1.60175, -0.9315535, 0.7098039, 1, 0, 1,
-0.8193729, -0.3317747, -3.02596, 0.7058824, 1, 0, 1,
-0.8183822, 0.1659007, -2.947921, 0.6980392, 1, 0, 1,
-0.8165212, -0.3374928, -2.828566, 0.6901961, 1, 0, 1,
-0.8162057, -1.372883, -2.473876, 0.6862745, 1, 0, 1,
-0.8143555, 0.9232428, -0.09046383, 0.6784314, 1, 0, 1,
-0.814307, 1.794204, -0.5390435, 0.6745098, 1, 0, 1,
-0.813435, -1.034923, -1.926755, 0.6666667, 1, 0, 1,
-0.8132905, -0.4364496, -2.755795, 0.6627451, 1, 0, 1,
-0.8094621, -0.6519517, -3.452993, 0.654902, 1, 0, 1,
-0.8074403, -1.29782, -3.304506, 0.6509804, 1, 0, 1,
-0.8047195, 0.01172944, -1.402598, 0.6431373, 1, 0, 1,
-0.8039038, 0.9014814, -2.239807, 0.6392157, 1, 0, 1,
-0.7928207, 0.8029307, -2.411104, 0.6313726, 1, 0, 1,
-0.7907549, -0.1223064, -1.769636, 0.627451, 1, 0, 1,
-0.7894643, -0.0495582, -0.5830413, 0.6196079, 1, 0, 1,
-0.777926, 0.06570966, -2.600722, 0.6156863, 1, 0, 1,
-0.7732531, -0.4423915, -1.878694, 0.6078432, 1, 0, 1,
-0.7730727, -0.1918719, -1.60458, 0.6039216, 1, 0, 1,
-0.7701892, -0.1719934, -1.377456, 0.5960785, 1, 0, 1,
-0.7631113, 0.9520003, 0.9368188, 0.5882353, 1, 0, 1,
-0.7606229, 0.09316856, 1.113507, 0.5843138, 1, 0, 1,
-0.7592877, 0.3586343, -0.9434214, 0.5764706, 1, 0, 1,
-0.7586102, 0.17147, -1.966406, 0.572549, 1, 0, 1,
-0.7572713, 0.8781719, -1.690168, 0.5647059, 1, 0, 1,
-0.7552831, 0.6453388, -1.499566, 0.5607843, 1, 0, 1,
-0.7532223, -0.01131628, -1.174972, 0.5529412, 1, 0, 1,
-0.7520065, -1.37935, -2.032889, 0.5490196, 1, 0, 1,
-0.7403079, -1.019855, -2.22861, 0.5411765, 1, 0, 1,
-0.736033, 1.944521, -1.752452, 0.5372549, 1, 0, 1,
-0.7357567, 0.08958653, -2.253237, 0.5294118, 1, 0, 1,
-0.7272153, -0.9025795, -1.34931, 0.5254902, 1, 0, 1,
-0.7225573, 0.8232813, -0.07211906, 0.5176471, 1, 0, 1,
-0.7203267, -1.018262, -1.343406, 0.5137255, 1, 0, 1,
-0.7187066, -0.1829549, -3.347915, 0.5058824, 1, 0, 1,
-0.7169492, 0.3873521, -0.391259, 0.5019608, 1, 0, 1,
-0.7162638, -1.728986, -3.144013, 0.4941176, 1, 0, 1,
-0.7157431, -0.8115402, -2.677684, 0.4862745, 1, 0, 1,
-0.7150367, -1.091477, -1.685764, 0.4823529, 1, 0, 1,
-0.705686, -1.12404, -4.685562, 0.4745098, 1, 0, 1,
-0.7024419, -0.4104221, -0.5315487, 0.4705882, 1, 0, 1,
-0.7016301, -0.2662195, -2.812307, 0.4627451, 1, 0, 1,
-0.701594, 0.04415569, -1.056248, 0.4588235, 1, 0, 1,
-0.6970595, -1.546964, -2.763387, 0.4509804, 1, 0, 1,
-0.6966029, -2.116641, -3.194432, 0.4470588, 1, 0, 1,
-0.6909493, 1.669404, 1.41538, 0.4392157, 1, 0, 1,
-0.6897396, 0.04958211, -1.982099, 0.4352941, 1, 0, 1,
-0.6896321, 0.8012277, -0.262468, 0.427451, 1, 0, 1,
-0.688525, -0.64096, -2.649249, 0.4235294, 1, 0, 1,
-0.6868326, 0.1175623, -2.598191, 0.4156863, 1, 0, 1,
-0.6867013, 1.963909, -0.9333839, 0.4117647, 1, 0, 1,
-0.6814009, -0.2103655, -2.393559, 0.4039216, 1, 0, 1,
-0.6792155, -1.211494, -1.866205, 0.3960784, 1, 0, 1,
-0.6711448, -1.290936, -0.4067488, 0.3921569, 1, 0, 1,
-0.671118, 0.7134132, -0.3624206, 0.3843137, 1, 0, 1,
-0.6687168, 2.06987, -0.3645238, 0.3803922, 1, 0, 1,
-0.6644446, 0.4818042, -1.985405, 0.372549, 1, 0, 1,
-0.6632469, 0.2642395, -1.908078, 0.3686275, 1, 0, 1,
-0.6613644, -0.3810494, -3.094833, 0.3607843, 1, 0, 1,
-0.6576735, -0.5229646, -1.381728, 0.3568628, 1, 0, 1,
-0.6539661, -1.826786, -1.65825, 0.3490196, 1, 0, 1,
-0.6532709, -1.622319, -3.158663, 0.345098, 1, 0, 1,
-0.6465196, 0.3396499, -0.1915237, 0.3372549, 1, 0, 1,
-0.6437433, 0.6159156, -0.3985859, 0.3333333, 1, 0, 1,
-0.6401829, -0.0960771, -2.407757, 0.3254902, 1, 0, 1,
-0.6356937, -0.3187023, -2.415042, 0.3215686, 1, 0, 1,
-0.6342086, -0.1555187, -4.004234, 0.3137255, 1, 0, 1,
-0.6337677, -0.8005489, -1.593162, 0.3098039, 1, 0, 1,
-0.6332489, 2.050377, -0.5986687, 0.3019608, 1, 0, 1,
-0.631767, -0.4528261, -1.231598, 0.2941177, 1, 0, 1,
-0.6296396, -0.5769952, -2.064781, 0.2901961, 1, 0, 1,
-0.6192861, 0.9921316, -0.41198, 0.282353, 1, 0, 1,
-0.6151063, -1.033578, -2.510117, 0.2784314, 1, 0, 1,
-0.6092191, -0.1032256, -2.332407, 0.2705882, 1, 0, 1,
-0.6078942, -0.2793413, -2.875301, 0.2666667, 1, 0, 1,
-0.6052998, -0.7002895, -3.060802, 0.2588235, 1, 0, 1,
-0.5914634, -0.06916948, -2.700515, 0.254902, 1, 0, 1,
-0.5806411, 0.3796692, -2.138328, 0.2470588, 1, 0, 1,
-0.5798116, 0.1543126, -0.8964807, 0.2431373, 1, 0, 1,
-0.5758131, 0.01910391, -0.8004149, 0.2352941, 1, 0, 1,
-0.575781, -0.529952, -0.368354, 0.2313726, 1, 0, 1,
-0.5665852, 0.0855069, -2.081513, 0.2235294, 1, 0, 1,
-0.5625392, -0.652299, -2.177634, 0.2196078, 1, 0, 1,
-0.5614549, -0.2142873, -1.772669, 0.2117647, 1, 0, 1,
-0.5592946, -0.8316913, -2.213799, 0.2078431, 1, 0, 1,
-0.5588984, 2.592952, -0.746214, 0.2, 1, 0, 1,
-0.5588787, 0.4958169, -1.95858, 0.1921569, 1, 0, 1,
-0.5558448, -0.6359993, -2.86097, 0.1882353, 1, 0, 1,
-0.5532622, -1.399861, -2.03378, 0.1803922, 1, 0, 1,
-0.5508142, 0.8482569, 0.4227715, 0.1764706, 1, 0, 1,
-0.549586, -1.536475, -2.249026, 0.1686275, 1, 0, 1,
-0.5447934, 0.4599018, -1.323113, 0.1647059, 1, 0, 1,
-0.5429556, -1.072242, -2.373283, 0.1568628, 1, 0, 1,
-0.5421658, 0.05809614, -2.285586, 0.1529412, 1, 0, 1,
-0.5330247, -0.322218, -0.4998987, 0.145098, 1, 0, 1,
-0.5323931, -0.7407533, -3.259751, 0.1411765, 1, 0, 1,
-0.5316109, 0.5513538, 0.07735953, 0.1333333, 1, 0, 1,
-0.5311731, 0.9002278, -1.678492, 0.1294118, 1, 0, 1,
-0.5245081, 0.2263893, -1.91792, 0.1215686, 1, 0, 1,
-0.5211726, -0.3154936, -1.571021, 0.1176471, 1, 0, 1,
-0.5162615, 1.692655, 0.7478555, 0.1098039, 1, 0, 1,
-0.5051794, -2.042661, -3.044104, 0.1058824, 1, 0, 1,
-0.5031998, 0.8225292, -2.003826, 0.09803922, 1, 0, 1,
-0.4987468, 0.1046362, -2.084658, 0.09019608, 1, 0, 1,
-0.4944534, 0.05585841, -0.4091775, 0.08627451, 1, 0, 1,
-0.4887396, -0.5537949, -1.767609, 0.07843138, 1, 0, 1,
-0.4856469, -0.7350273, -3.359563, 0.07450981, 1, 0, 1,
-0.4845487, -0.6796252, -3.821223, 0.06666667, 1, 0, 1,
-0.478292, -0.4219497, -1.511165, 0.0627451, 1, 0, 1,
-0.4775664, 1.68008, -1.352809, 0.05490196, 1, 0, 1,
-0.4740048, -0.001001601, -1.655473, 0.05098039, 1, 0, 1,
-0.4719317, -0.3172931, -2.040224, 0.04313726, 1, 0, 1,
-0.4670444, 2.098796, -1.487385, 0.03921569, 1, 0, 1,
-0.4657095, 1.284374, 0.3951551, 0.03137255, 1, 0, 1,
-0.4606888, -1.49217, -2.784262, 0.02745098, 1, 0, 1,
-0.4593294, 0.9621682, 0.199837, 0.01960784, 1, 0, 1,
-0.4573295, 0.6095698, -3.235844, 0.01568628, 1, 0, 1,
-0.4570552, 0.3547343, 0.9996517, 0.007843138, 1, 0, 1,
-0.4516995, 0.9338591, -1.050418, 0.003921569, 1, 0, 1,
-0.4501528, 0.7673631, -0.7303659, 0, 1, 0.003921569, 1,
-0.4499813, 0.0760754, -2.477645, 0, 1, 0.01176471, 1,
-0.4477148, -1.083171, -4.274542, 0, 1, 0.01568628, 1,
-0.447637, -1.17399, -2.967532, 0, 1, 0.02352941, 1,
-0.446006, -1.083115, -3.314611, 0, 1, 0.02745098, 1,
-0.4431383, -1.629201, -3.896685, 0, 1, 0.03529412, 1,
-0.4396139, 0.934185, 0.3793768, 0, 1, 0.03921569, 1,
-0.4356965, -0.5272956, -2.623177, 0, 1, 0.04705882, 1,
-0.4328387, -0.3248479, -1.225944, 0, 1, 0.05098039, 1,
-0.4274274, -0.3003734, -2.249677, 0, 1, 0.05882353, 1,
-0.4267259, 0.4822401, 0.2559898, 0, 1, 0.0627451, 1,
-0.4263957, -1.368786, -2.695143, 0, 1, 0.07058824, 1,
-0.4178629, 0.7434922, -0.171132, 0, 1, 0.07450981, 1,
-0.4129149, 0.4950352, -1.206219, 0, 1, 0.08235294, 1,
-0.4059784, 1.104864, 1.276869, 0, 1, 0.08627451, 1,
-0.400171, 1.01384, -1.225467, 0, 1, 0.09411765, 1,
-0.3977057, -0.534802, -1.802627, 0, 1, 0.1019608, 1,
-0.3973415, -0.09286967, -1.712836, 0, 1, 0.1058824, 1,
-0.3973166, -0.5535517, -4.594, 0, 1, 0.1137255, 1,
-0.3956118, 1.039412, -0.7917032, 0, 1, 0.1176471, 1,
-0.3955115, -0.4621172, -3.081713, 0, 1, 0.1254902, 1,
-0.3935525, -0.5898519, -3.447793, 0, 1, 0.1294118, 1,
-0.3919426, -0.2647853, -2.234428, 0, 1, 0.1372549, 1,
-0.3789172, -0.5962975, -1.718788, 0, 1, 0.1411765, 1,
-0.3785492, -0.3235705, -2.264634, 0, 1, 0.1490196, 1,
-0.3778293, -0.6477877, -2.646021, 0, 1, 0.1529412, 1,
-0.3775239, 0.03780003, -0.1652762, 0, 1, 0.1607843, 1,
-0.3642915, -0.8827926, -5.421344, 0, 1, 0.1647059, 1,
-0.3640215, 0.9150596, -0.5374498, 0, 1, 0.172549, 1,
-0.3636647, -1.11757, -3.112346, 0, 1, 0.1764706, 1,
-0.356743, 1.333666, -2.018411, 0, 1, 0.1843137, 1,
-0.3550431, 0.7722958, 0.480739, 0, 1, 0.1882353, 1,
-0.3546835, 0.5263925, -1.494796, 0, 1, 0.1960784, 1,
-0.3503531, 0.3452968, -1.68127, 0, 1, 0.2039216, 1,
-0.3502768, -2.275866, -5.104906, 0, 1, 0.2078431, 1,
-0.3435255, -0.9089099, -4.487762, 0, 1, 0.2156863, 1,
-0.341932, 1.081964, 1.487763, 0, 1, 0.2196078, 1,
-0.3406367, -0.1941337, -1.998262, 0, 1, 0.227451, 1,
-0.3404331, -0.002025968, -2.974584, 0, 1, 0.2313726, 1,
-0.3348727, -0.5574511, -2.583942, 0, 1, 0.2392157, 1,
-0.3343131, -0.06723597, -0.7433639, 0, 1, 0.2431373, 1,
-0.3335145, -0.1700006, -2.465825, 0, 1, 0.2509804, 1,
-0.3333706, 0.2050381, -0.3205878, 0, 1, 0.254902, 1,
-0.3323902, -0.5482301, -2.500559, 0, 1, 0.2627451, 1,
-0.3307626, 0.3346651, -0.8790864, 0, 1, 0.2666667, 1,
-0.3300966, 0.9227121, -2.705629, 0, 1, 0.2745098, 1,
-0.3232836, -0.7954235, -4.814613, 0, 1, 0.2784314, 1,
-0.3218793, 0.2785515, -1.876891, 0, 1, 0.2862745, 1,
-0.3164707, -0.9336233, -2.519167, 0, 1, 0.2901961, 1,
-0.3151003, 1.068436, 1.106889, 0, 1, 0.2980392, 1,
-0.3104199, -1.291973, -1.268057, 0, 1, 0.3058824, 1,
-0.3095562, 0.5495159, 1.140514, 0, 1, 0.3098039, 1,
-0.3045879, -1.032254, -2.799289, 0, 1, 0.3176471, 1,
-0.3033725, -0.4037343, -2.935605, 0, 1, 0.3215686, 1,
-0.3023545, -2.519596, -2.908711, 0, 1, 0.3294118, 1,
-0.301281, 0.984125, -2.261901, 0, 1, 0.3333333, 1,
-0.2941681, 0.3564838, -3.188674, 0, 1, 0.3411765, 1,
-0.2933068, 1.668715, 1.235696, 0, 1, 0.345098, 1,
-0.292573, 0.3842279, 0.7066157, 0, 1, 0.3529412, 1,
-0.2917083, 0.4558405, -1.959981, 0, 1, 0.3568628, 1,
-0.2908289, 0.6661111, -0.05480905, 0, 1, 0.3647059, 1,
-0.2842046, 0.1622105, -1.099765, 0, 1, 0.3686275, 1,
-0.2799028, 0.4093455, -0.6001195, 0, 1, 0.3764706, 1,
-0.2781777, -0.09122263, -0.4601652, 0, 1, 0.3803922, 1,
-0.2779387, 0.05240566, -1.578258, 0, 1, 0.3882353, 1,
-0.2730207, 0.6160151, -0.9022822, 0, 1, 0.3921569, 1,
-0.264554, -0.4271934, -2.557984, 0, 1, 0.4, 1,
-0.2640662, 0.1135428, -1.889525, 0, 1, 0.4078431, 1,
-0.2628434, -1.929629, -1.439976, 0, 1, 0.4117647, 1,
-0.257774, -0.5896005, -3.630344, 0, 1, 0.4196078, 1,
-0.2449974, -0.6015933, -2.6405, 0, 1, 0.4235294, 1,
-0.2409871, -0.1568831, -2.748512, 0, 1, 0.4313726, 1,
-0.2388819, -1.090695, -4.140162, 0, 1, 0.4352941, 1,
-0.2381438, 0.813333, 0.05014895, 0, 1, 0.4431373, 1,
-0.2314785, 1.482693, -1.502725, 0, 1, 0.4470588, 1,
-0.2255352, 1.273766, 0.2410815, 0, 1, 0.454902, 1,
-0.2131444, -0.9367947, -4.055241, 0, 1, 0.4588235, 1,
-0.2120595, 0.392813, -0.5350163, 0, 1, 0.4666667, 1,
-0.2108294, 1.40324, -1.667592, 0, 1, 0.4705882, 1,
-0.2080805, -0.833687, -3.872954, 0, 1, 0.4784314, 1,
-0.2076042, 0.4087535, -1.616862, 0, 1, 0.4823529, 1,
-0.2028588, -1.952339, -2.832992, 0, 1, 0.4901961, 1,
-0.1946184, -1.143098, -2.272482, 0, 1, 0.4941176, 1,
-0.1915698, 0.1183383, -0.1671338, 0, 1, 0.5019608, 1,
-0.19102, 1.497583, -1.974289, 0, 1, 0.509804, 1,
-0.1901908, 0.2247834, -1.000105, 0, 1, 0.5137255, 1,
-0.1882337, -0.7198061, -2.930195, 0, 1, 0.5215687, 1,
-0.1854021, -0.05631498, -2.224609, 0, 1, 0.5254902, 1,
-0.1782856, 1.567313, -0.5464127, 0, 1, 0.5333334, 1,
-0.174243, 1.324698, -0.003946031, 0, 1, 0.5372549, 1,
-0.1718962, -1.557406, -4.126119, 0, 1, 0.5450981, 1,
-0.1707689, -0.6681862, -3.416177, 0, 1, 0.5490196, 1,
-0.1698409, -0.7751893, -3.451156, 0, 1, 0.5568628, 1,
-0.1677046, 0.6590177, 0.4597336, 0, 1, 0.5607843, 1,
-0.1665232, 0.3747767, -0.8706728, 0, 1, 0.5686275, 1,
-0.1614115, 1.872018, -1.6652, 0, 1, 0.572549, 1,
-0.1608973, 0.400373, -0.4458347, 0, 1, 0.5803922, 1,
-0.1598536, 0.3944711, -1.911561, 0, 1, 0.5843138, 1,
-0.1588857, -1.174729, -1.691499, 0, 1, 0.5921569, 1,
-0.1551442, -1.293039, -3.461327, 0, 1, 0.5960785, 1,
-0.1536876, 0.5725517, 0.8330432, 0, 1, 0.6039216, 1,
-0.1507251, 0.1922152, 0.6284856, 0, 1, 0.6117647, 1,
-0.1494152, -0.2820826, -3.241822, 0, 1, 0.6156863, 1,
-0.1492522, -0.4925551, -3.120575, 0, 1, 0.6235294, 1,
-0.1486246, 1.052784, 1.087518, 0, 1, 0.627451, 1,
-0.1472171, -0.141071, -2.81999, 0, 1, 0.6352941, 1,
-0.1427081, -0.6725922, -2.089001, 0, 1, 0.6392157, 1,
-0.1426289, -0.3006059, -2.51661, 0, 1, 0.6470588, 1,
-0.1354233, -0.4035219, -3.885286, 0, 1, 0.6509804, 1,
-0.1346822, 0.7239467, 0.8289927, 0, 1, 0.6588235, 1,
-0.1345462, -1.163994, -3.847069, 0, 1, 0.6627451, 1,
-0.1319554, 1.464106, -0.1831111, 0, 1, 0.6705883, 1,
-0.1318152, -1.101519, -2.243884, 0, 1, 0.6745098, 1,
-0.1317158, -2.407479, -1.60032, 0, 1, 0.682353, 1,
-0.1259721, 0.357511, -0.7321719, 0, 1, 0.6862745, 1,
-0.1255611, 1.729259, 0.8749368, 0, 1, 0.6941177, 1,
-0.1250764, -0.6795407, -2.205936, 0, 1, 0.7019608, 1,
-0.1222363, -0.4327584, -1.515771, 0, 1, 0.7058824, 1,
-0.1201308, 1.807119, -1.128951, 0, 1, 0.7137255, 1,
-0.1165724, 0.3397991, -1.237456, 0, 1, 0.7176471, 1,
-0.1153797, -0.3170862, -3.237067, 0, 1, 0.7254902, 1,
-0.1103614, 0.4156757, -1.129791, 0, 1, 0.7294118, 1,
-0.1080536, -1.244263, -4.396587, 0, 1, 0.7372549, 1,
-0.1046656, -0.1923249, -1.880957, 0, 1, 0.7411765, 1,
-0.1028689, 1.149929, -0.4300823, 0, 1, 0.7490196, 1,
-0.1021307, -0.1620215, -3.213754, 0, 1, 0.7529412, 1,
-0.09903944, 0.4268975, 2.451355, 0, 1, 0.7607843, 1,
-0.09538396, -1.970733, -3.914691, 0, 1, 0.7647059, 1,
-0.09303138, 0.7281724, 0.06992181, 0, 1, 0.772549, 1,
-0.09302822, 0.8049466, -0.5764297, 0, 1, 0.7764706, 1,
-0.09286307, -1.122776, -3.099219, 0, 1, 0.7843137, 1,
-0.0921066, -0.2339962, -0.9975561, 0, 1, 0.7882353, 1,
-0.08622523, -0.7723173, -3.196267, 0, 1, 0.7960784, 1,
-0.07996024, -1.942984, -2.622769, 0, 1, 0.8039216, 1,
-0.07856903, 0.6294529, -0.6187261, 0, 1, 0.8078431, 1,
-0.07227597, -0.8892509, -4.846773, 0, 1, 0.8156863, 1,
-0.06697288, -1.313246, -0.2959438, 0, 1, 0.8196079, 1,
-0.05074563, -1.14596, -3.553556, 0, 1, 0.827451, 1,
-0.04961478, 1.768185, 1.283836, 0, 1, 0.8313726, 1,
-0.04430353, -0.74528, -3.096911, 0, 1, 0.8392157, 1,
-0.0431035, -0.2737757, -2.585218, 0, 1, 0.8431373, 1,
-0.03981004, 1.411478, 1.586228, 0, 1, 0.8509804, 1,
-0.03886173, 1.532324, -0.2624059, 0, 1, 0.854902, 1,
-0.03854324, -2.012656, -3.268704, 0, 1, 0.8627451, 1,
-0.03848905, -0.5661736, -3.36032, 0, 1, 0.8666667, 1,
-0.03838316, 0.316122, -0.3657762, 0, 1, 0.8745098, 1,
-0.03815123, 1.364352, -0.3326746, 0, 1, 0.8784314, 1,
-0.03651622, -0.4452854, -2.724718, 0, 1, 0.8862745, 1,
-0.03618591, -0.0354009, -3.059679, 0, 1, 0.8901961, 1,
-0.03296337, 0.3057831, -1.207501, 0, 1, 0.8980392, 1,
-0.0315777, -2.019572, -4.563882, 0, 1, 0.9058824, 1,
-0.02913549, -1.585036, -2.041856, 0, 1, 0.9098039, 1,
-0.02878307, -0.3330365, -2.388908, 0, 1, 0.9176471, 1,
-0.018713, -0.5781189, -4.074408, 0, 1, 0.9215686, 1,
-0.01864156, 0.5821886, -1.006379, 0, 1, 0.9294118, 1,
-0.01507799, 0.6233195, 0.8532429, 0, 1, 0.9333333, 1,
-0.01353155, -0.05791624, -2.141955, 0, 1, 0.9411765, 1,
-0.008309841, 0.8799329, -1.696777, 0, 1, 0.945098, 1,
-0.005441395, 1.335943, -1.550287, 0, 1, 0.9529412, 1,
-0.00538586, -0.06168391, -2.128639, 0, 1, 0.9568627, 1,
-0.004565295, 0.1848072, 0.1452163, 0, 1, 0.9647059, 1,
-0.001111806, 0.05942269, 0.6419447, 0, 1, 0.9686275, 1,
-0.0007229995, 0.7654069, -1.356246, 0, 1, 0.9764706, 1,
0.001107352, 0.9764427, -0.4841675, 0, 1, 0.9803922, 1,
0.002865002, -0.6297567, 3.26737, 0, 1, 0.9882353, 1,
0.003765021, 0.7663838, -0.3441128, 0, 1, 0.9921569, 1,
0.01738804, 0.7226737, 0.1572172, 0, 1, 1, 1,
0.01871908, -0.5326927, 4.176626, 0, 0.9921569, 1, 1,
0.01964402, 0.163258, 0.01448721, 0, 0.9882353, 1, 1,
0.02100145, -0.8507173, 2.375365, 0, 0.9803922, 1, 1,
0.02457849, -0.2232466, 2.077668, 0, 0.9764706, 1, 1,
0.02483992, 0.8187612, 1.298499, 0, 0.9686275, 1, 1,
0.02673659, 2.261443, 1.164679, 0, 0.9647059, 1, 1,
0.03049811, 0.3859591, 0.05245548, 0, 0.9568627, 1, 1,
0.03504505, -1.550212, 2.632373, 0, 0.9529412, 1, 1,
0.03699728, -1.49516, 4.184436, 0, 0.945098, 1, 1,
0.03908809, -1.151018, 2.681138, 0, 0.9411765, 1, 1,
0.04228984, -0.5888513, 2.902581, 0, 0.9333333, 1, 1,
0.0434697, 1.200588, -0.006062865, 0, 0.9294118, 1, 1,
0.04669042, 1.337646, -0.2851105, 0, 0.9215686, 1, 1,
0.04701676, 0.2534734, -0.7108403, 0, 0.9176471, 1, 1,
0.04980966, -1.508444, 3.145496, 0, 0.9098039, 1, 1,
0.05411076, 0.917295, 2.237988, 0, 0.9058824, 1, 1,
0.05456889, 0.1127674, 1.755383, 0, 0.8980392, 1, 1,
0.06027975, 0.1963389, 0.06340683, 0, 0.8901961, 1, 1,
0.06516661, -1.273222, 3.901653, 0, 0.8862745, 1, 1,
0.06555147, 0.06760351, 0.6047607, 0, 0.8784314, 1, 1,
0.06685516, -0.4750933, 2.516923, 0, 0.8745098, 1, 1,
0.0697682, 0.6254039, 2.316955, 0, 0.8666667, 1, 1,
0.07229234, -1.182188, 3.447035, 0, 0.8627451, 1, 1,
0.07257923, 0.4912928, -1.218228, 0, 0.854902, 1, 1,
0.07663801, -0.2727838, 2.081191, 0, 0.8509804, 1, 1,
0.0780002, -0.4535996, 1.843516, 0, 0.8431373, 1, 1,
0.07956973, 2.823421, -1.294066, 0, 0.8392157, 1, 1,
0.07985094, 0.7989287, -0.4017405, 0, 0.8313726, 1, 1,
0.08050621, 0.4585276, -1.07668, 0, 0.827451, 1, 1,
0.08311778, 1.097101, 0.001294458, 0, 0.8196079, 1, 1,
0.08730411, 0.661602, 1.226194, 0, 0.8156863, 1, 1,
0.0887588, 1.131278, -1.661457, 0, 0.8078431, 1, 1,
0.08938459, -1.419442, 2.761335, 0, 0.8039216, 1, 1,
0.09442277, 0.4986224, 0.5751978, 0, 0.7960784, 1, 1,
0.09715866, 0.1827146, 2.761842, 0, 0.7882353, 1, 1,
0.1001449, -0.1518623, 4.37573, 0, 0.7843137, 1, 1,
0.1007921, -0.7361943, 2.653825, 0, 0.7764706, 1, 1,
0.109665, -1.555678, 2.029052, 0, 0.772549, 1, 1,
0.1123961, -2.11071, 3.184042, 0, 0.7647059, 1, 1,
0.1136545, 0.244266, -0.8960311, 0, 0.7607843, 1, 1,
0.1152972, -2.618388, 2.580399, 0, 0.7529412, 1, 1,
0.1185434, 1.201175, 0.8622696, 0, 0.7490196, 1, 1,
0.1217403, -0.3654472, 2.331643, 0, 0.7411765, 1, 1,
0.1250262, 1.041513, 0.8223845, 0, 0.7372549, 1, 1,
0.1253995, -1.633519, 2.207507, 0, 0.7294118, 1, 1,
0.1318068, 1.546846, 0.2939573, 0, 0.7254902, 1, 1,
0.1336893, -0.3974555, 3.237167, 0, 0.7176471, 1, 1,
0.134222, 0.3014371, 0.0297736, 0, 0.7137255, 1, 1,
0.1351654, 0.7432165, 1.122826, 0, 0.7058824, 1, 1,
0.1368047, -0.4613623, 2.719802, 0, 0.6980392, 1, 1,
0.138335, -0.4287263, 2.232343, 0, 0.6941177, 1, 1,
0.1387278, 1.570734, 0.9536309, 0, 0.6862745, 1, 1,
0.1401168, 2.544116, -1.805917, 0, 0.682353, 1, 1,
0.1456908, -0.5946162, 2.739629, 0, 0.6745098, 1, 1,
0.1484419, -1.118134, 2.476501, 0, 0.6705883, 1, 1,
0.1490374, -0.6693847, 3.927038, 0, 0.6627451, 1, 1,
0.149136, -0.001037115, 1.392799, 0, 0.6588235, 1, 1,
0.150066, -2.642933, 2.514995, 0, 0.6509804, 1, 1,
0.1502011, -0.08277809, 1.436862, 0, 0.6470588, 1, 1,
0.156087, -0.8076869, 1.360107, 0, 0.6392157, 1, 1,
0.1563558, 0.3638186, -0.3398096, 0, 0.6352941, 1, 1,
0.1571073, -0.1043225, 4.336908, 0, 0.627451, 1, 1,
0.1594992, 0.7393319, -0.740348, 0, 0.6235294, 1, 1,
0.1639316, 0.7432475, 0.5779463, 0, 0.6156863, 1, 1,
0.167583, 0.4358832, 0.3638994, 0, 0.6117647, 1, 1,
0.168901, 2.056489, 1.442486, 0, 0.6039216, 1, 1,
0.1689319, 0.6639755, 0.4944977, 0, 0.5960785, 1, 1,
0.1711116, -1.144217, 4.279202, 0, 0.5921569, 1, 1,
0.1711253, -1.196662, 3.155061, 0, 0.5843138, 1, 1,
0.1711811, 0.7930614, 1.350105, 0, 0.5803922, 1, 1,
0.1723481, 0.02876921, 0.7703396, 0, 0.572549, 1, 1,
0.1732116, -1.173331, 3.222871, 0, 0.5686275, 1, 1,
0.1760697, -0.3318911, 4.499043, 0, 0.5607843, 1, 1,
0.1771668, 0.04463931, 0.9260245, 0, 0.5568628, 1, 1,
0.183779, 0.3333277, -0.635729, 0, 0.5490196, 1, 1,
0.1842774, -1.350381, 2.142773, 0, 0.5450981, 1, 1,
0.1862376, 0.8220202, -0.108682, 0, 0.5372549, 1, 1,
0.1915666, 0.5197157, 0.3439568, 0, 0.5333334, 1, 1,
0.1941127, -0.1454528, 1.926163, 0, 0.5254902, 1, 1,
0.1957006, 0.7663716, 0.2198789, 0, 0.5215687, 1, 1,
0.1970683, -0.5856243, 2.13098, 0, 0.5137255, 1, 1,
0.1989699, -1.139392, 3.852977, 0, 0.509804, 1, 1,
0.2002453, -0.4178465, 1.616092, 0, 0.5019608, 1, 1,
0.2041918, 0.4222686, 1.245755, 0, 0.4941176, 1, 1,
0.2045429, -0.6818748, 4.401413, 0, 0.4901961, 1, 1,
0.2152631, -1.430339, 3.75632, 0, 0.4823529, 1, 1,
0.2217465, -1.53159, 2.064306, 0, 0.4784314, 1, 1,
0.225366, -0.3782888, 0.3093507, 0, 0.4705882, 1, 1,
0.2261858, -0.4615002, 3.059999, 0, 0.4666667, 1, 1,
0.2261947, 0.7473084, -0.5700227, 0, 0.4588235, 1, 1,
0.2265092, -0.7002883, 4.818681, 0, 0.454902, 1, 1,
0.227383, 1.108024, 0.1653705, 0, 0.4470588, 1, 1,
0.2276589, 0.6531647, -0.527849, 0, 0.4431373, 1, 1,
0.2309977, -0.7551547, 2.544386, 0, 0.4352941, 1, 1,
0.2310707, -0.630129, 2.717207, 0, 0.4313726, 1, 1,
0.2339941, -0.3873441, 1.774853, 0, 0.4235294, 1, 1,
0.238926, 0.9944915, -0.09029285, 0, 0.4196078, 1, 1,
0.2389692, -0.346837, 3.437924, 0, 0.4117647, 1, 1,
0.2391231, 1.084377, -0.4014309, 0, 0.4078431, 1, 1,
0.2415048, 0.01505984, 2.80477, 0, 0.4, 1, 1,
0.2423966, -0.1776095, 2.414558, 0, 0.3921569, 1, 1,
0.2519687, 1.266689, 0.7283498, 0, 0.3882353, 1, 1,
0.2568012, -2.422634, 3.437107, 0, 0.3803922, 1, 1,
0.2568046, 0.5256422, -1.155502, 0, 0.3764706, 1, 1,
0.2575246, -0.1124282, 3.436576, 0, 0.3686275, 1, 1,
0.2655908, -0.4753435, 2.916846, 0, 0.3647059, 1, 1,
0.2701827, -0.09257753, 0.9189145, 0, 0.3568628, 1, 1,
0.2707742, 1.334662, -0.7543185, 0, 0.3529412, 1, 1,
0.2802591, 0.1622135, 1.205738, 0, 0.345098, 1, 1,
0.2815171, 0.7910268, -1.820168, 0, 0.3411765, 1, 1,
0.2817262, -1.132654, 3.607546, 0, 0.3333333, 1, 1,
0.2855935, 0.7993531, -0.58527, 0, 0.3294118, 1, 1,
0.2856227, 0.6523201, 1.401229, 0, 0.3215686, 1, 1,
0.2868895, 0.5474921, 0.06097287, 0, 0.3176471, 1, 1,
0.2892074, -0.3572221, 2.72044, 0, 0.3098039, 1, 1,
0.292522, -0.3175856, 3.028586, 0, 0.3058824, 1, 1,
0.2959679, 0.842423, 1.644415, 0, 0.2980392, 1, 1,
0.2978753, -0.007487534, 2.54882, 0, 0.2901961, 1, 1,
0.302828, 1.36685, 0.3776164, 0, 0.2862745, 1, 1,
0.3055755, -0.3266605, 1.453168, 0, 0.2784314, 1, 1,
0.3056101, -0.5954181, 2.05419, 0, 0.2745098, 1, 1,
0.3072939, -1.814734, 2.282939, 0, 0.2666667, 1, 1,
0.3094024, 0.562576, -0.7176449, 0, 0.2627451, 1, 1,
0.3134379, -0.04411083, 1.652469, 0, 0.254902, 1, 1,
0.3138216, -0.5561938, 1.714087, 0, 0.2509804, 1, 1,
0.313914, 0.3298285, -0.3268944, 0, 0.2431373, 1, 1,
0.3145096, 0.6437069, -0.4538719, 0, 0.2392157, 1, 1,
0.3217397, 0.2268117, 0.9769298, 0, 0.2313726, 1, 1,
0.3240047, 0.5741561, 1.541758, 0, 0.227451, 1, 1,
0.326424, -0.4586106, 3.440852, 0, 0.2196078, 1, 1,
0.3326054, -0.57412, 3.312332, 0, 0.2156863, 1, 1,
0.3350191, 0.7513527, 0.9332794, 0, 0.2078431, 1, 1,
0.3363181, -0.006839156, 3.088995, 0, 0.2039216, 1, 1,
0.3424627, -0.2244002, 2.471037, 0, 0.1960784, 1, 1,
0.3441282, -0.01497691, 2.581759, 0, 0.1882353, 1, 1,
0.3464275, -0.08466138, 0.1659309, 0, 0.1843137, 1, 1,
0.3500448, 0.03494063, 1.069545, 0, 0.1764706, 1, 1,
0.3506634, 1.6964, 1.044187, 0, 0.172549, 1, 1,
0.3509584, 0.001340767, 1.352025, 0, 0.1647059, 1, 1,
0.3517234, 1.624035, -0.8444955, 0, 0.1607843, 1, 1,
0.3540986, -1.633564, 1.815368, 0, 0.1529412, 1, 1,
0.3569281, 1.234427, -0.4331379, 0, 0.1490196, 1, 1,
0.3582458, -0.7798501, 2.70404, 0, 0.1411765, 1, 1,
0.3588952, -1.148163, 2.950846, 0, 0.1372549, 1, 1,
0.3631841, 0.1272929, 0.8005519, 0, 0.1294118, 1, 1,
0.3653523, 0.589079, 1.112536, 0, 0.1254902, 1, 1,
0.3654569, 1.218109, 0.1803689, 0, 0.1176471, 1, 1,
0.3671834, 0.9795366, -0.2997758, 0, 0.1137255, 1, 1,
0.3679425, -1.658411, 3.591776, 0, 0.1058824, 1, 1,
0.3698379, -0.3654331, 1.526028, 0, 0.09803922, 1, 1,
0.3720063, -0.6613996, 1.978887, 0, 0.09411765, 1, 1,
0.3732195, 0.1843672, 2.200741, 0, 0.08627451, 1, 1,
0.3793301, 0.6573622, -0.6106297, 0, 0.08235294, 1, 1,
0.385227, -1.449645, 1.821294, 0, 0.07450981, 1, 1,
0.3888931, 0.1762469, 1.64828, 0, 0.07058824, 1, 1,
0.3890423, 0.8677515, 1.350152, 0, 0.0627451, 1, 1,
0.3895923, -0.5959002, 1.744507, 0, 0.05882353, 1, 1,
0.3913047, -0.1610173, 2.688323, 0, 0.05098039, 1, 1,
0.3927194, -1.27369, 2.661988, 0, 0.04705882, 1, 1,
0.4009429, -1.267122, 3.637411, 0, 0.03921569, 1, 1,
0.4041306, -1.458443, 2.753306, 0, 0.03529412, 1, 1,
0.405252, -0.9614078, 3.037334, 0, 0.02745098, 1, 1,
0.4177449, 1.52937, -0.6027052, 0, 0.02352941, 1, 1,
0.4202001, 0.3111161, 0.9387758, 0, 0.01568628, 1, 1,
0.4225444, -0.2496547, 1.317953, 0, 0.01176471, 1, 1,
0.4248999, 0.6661444, 2.23297, 0, 0.003921569, 1, 1,
0.4252128, -0.5342014, 2.22964, 0.003921569, 0, 1, 1,
0.4288453, 0.4625397, -0.1650398, 0.007843138, 0, 1, 1,
0.4342704, 0.4659211, -0.4528686, 0.01568628, 0, 1, 1,
0.4344738, 0.2459, 0.1989393, 0.01960784, 0, 1, 1,
0.4345405, -3.088474, 3.328844, 0.02745098, 0, 1, 1,
0.4380551, 0.6384221, 0.8463746, 0.03137255, 0, 1, 1,
0.4391184, 0.2594293, 1.290197, 0.03921569, 0, 1, 1,
0.4527417, 0.4759376, 1.741082, 0.04313726, 0, 1, 1,
0.459508, -0.6270977, 1.597464, 0.05098039, 0, 1, 1,
0.4595299, 1.013404, 1.607322, 0.05490196, 0, 1, 1,
0.4649957, -1.288344, 3.85908, 0.0627451, 0, 1, 1,
0.4651307, 1.287928, -1.372499, 0.06666667, 0, 1, 1,
0.4660391, -0.05760941, 0.5612798, 0.07450981, 0, 1, 1,
0.4677462, 0.1737853, 1.384359, 0.07843138, 0, 1, 1,
0.4684362, 0.8053632, 1.388863, 0.08627451, 0, 1, 1,
0.4721931, -1.031665, 1.576363, 0.09019608, 0, 1, 1,
0.4814906, -1.795058, 3.523655, 0.09803922, 0, 1, 1,
0.4821715, 0.7946407, 0.7046421, 0.1058824, 0, 1, 1,
0.4859317, 0.162349, 0.5264046, 0.1098039, 0, 1, 1,
0.4896168, 0.726819, 0.2877884, 0.1176471, 0, 1, 1,
0.4908386, -0.6482741, 4.846664, 0.1215686, 0, 1, 1,
0.4978194, 1.078237, -0.3086464, 0.1294118, 0, 1, 1,
0.5003725, -0.07540219, 2.090634, 0.1333333, 0, 1, 1,
0.5033934, 0.2349603, 0.7651511, 0.1411765, 0, 1, 1,
0.5035251, 0.1099311, 1.225967, 0.145098, 0, 1, 1,
0.5040856, 0.6380165, -0.558619, 0.1529412, 0, 1, 1,
0.5076734, 1.034092, 0.8611479, 0.1568628, 0, 1, 1,
0.51087, 0.1639443, 1.700485, 0.1647059, 0, 1, 1,
0.5112193, -0.5615471, 2.224549, 0.1686275, 0, 1, 1,
0.5113664, -0.131377, 2.881794, 0.1764706, 0, 1, 1,
0.5147991, -0.1883636, 1.554801, 0.1803922, 0, 1, 1,
0.5164504, 0.578527, 0.8443871, 0.1882353, 0, 1, 1,
0.5170159, -0.1595654, 0.6198287, 0.1921569, 0, 1, 1,
0.5193356, 0.3796877, 0.5555307, 0.2, 0, 1, 1,
0.5207242, 1.4226, -0.07341179, 0.2078431, 0, 1, 1,
0.5230976, -1.204209, 2.477469, 0.2117647, 0, 1, 1,
0.5269659, 0.7853297, 0.658699, 0.2196078, 0, 1, 1,
0.5273603, -0.8803746, 3.199197, 0.2235294, 0, 1, 1,
0.5274324, -0.1733231, 1.26153, 0.2313726, 0, 1, 1,
0.5280464, -1.977264, 2.684553, 0.2352941, 0, 1, 1,
0.5294051, 0.7087343, 0.4492994, 0.2431373, 0, 1, 1,
0.5306414, -1.316256, 4.196968, 0.2470588, 0, 1, 1,
0.5345471, 0.7930214, 0.3593909, 0.254902, 0, 1, 1,
0.536338, 0.5666785, 0.0576996, 0.2588235, 0, 1, 1,
0.5366139, 0.7252223, 0.4408312, 0.2666667, 0, 1, 1,
0.5386191, -0.01769141, -0.6173924, 0.2705882, 0, 1, 1,
0.5403317, 0.09653141, 0.4480673, 0.2784314, 0, 1, 1,
0.5466942, 0.8699722, 0.68169, 0.282353, 0, 1, 1,
0.5485191, -0.6775612, 2.320613, 0.2901961, 0, 1, 1,
0.5490555, 0.3816098, 1.819751, 0.2941177, 0, 1, 1,
0.551983, 0.08726058, 1.540908, 0.3019608, 0, 1, 1,
0.5525163, -1.260009, 2.688268, 0.3098039, 0, 1, 1,
0.5531098, -2.01727, 4.606055, 0.3137255, 0, 1, 1,
0.5580902, -0.2137017, 2.037894, 0.3215686, 0, 1, 1,
0.5590771, 0.7703282, 1.092734, 0.3254902, 0, 1, 1,
0.5621302, -0.8307022, 2.151993, 0.3333333, 0, 1, 1,
0.5668439, 0.02429399, 1.452995, 0.3372549, 0, 1, 1,
0.5735972, 0.5935876, 1.243365, 0.345098, 0, 1, 1,
0.577, 0.151152, -0.1591544, 0.3490196, 0, 1, 1,
0.5787477, 0.007967803, 1.33229, 0.3568628, 0, 1, 1,
0.5809458, 1.546224, 1.122798, 0.3607843, 0, 1, 1,
0.5876139, 0.6469749, 0.7739591, 0.3686275, 0, 1, 1,
0.5895498, -0.8549016, 0.807242, 0.372549, 0, 1, 1,
0.5898679, -0.1913022, 2.478495, 0.3803922, 0, 1, 1,
0.5915858, -0.3554765, 3.065096, 0.3843137, 0, 1, 1,
0.5923967, -1.044105, 2.759659, 0.3921569, 0, 1, 1,
0.5942212, 2.619326, -1.076517, 0.3960784, 0, 1, 1,
0.6007367, -0.4264881, 1.675191, 0.4039216, 0, 1, 1,
0.6033078, 0.4139377, -0.717044, 0.4117647, 0, 1, 1,
0.6084931, -0.532689, 1.72051, 0.4156863, 0, 1, 1,
0.6096634, 0.282899, 2.141322, 0.4235294, 0, 1, 1,
0.6153425, -0.04794679, -0.5327157, 0.427451, 0, 1, 1,
0.6153525, -1.396506, 3.623296, 0.4352941, 0, 1, 1,
0.6168024, 0.04669909, 1.783287, 0.4392157, 0, 1, 1,
0.6199659, 0.246469, 1.87808, 0.4470588, 0, 1, 1,
0.624421, -0.2889405, 0.5848348, 0.4509804, 0, 1, 1,
0.6248023, 0.479004, 1.160478, 0.4588235, 0, 1, 1,
0.6292585, -0.4074944, 2.6457, 0.4627451, 0, 1, 1,
0.6325836, 1.194707, 2.409527, 0.4705882, 0, 1, 1,
0.6329888, -1.724887, 2.657338, 0.4745098, 0, 1, 1,
0.6331508, 0.5979134, 1.055805, 0.4823529, 0, 1, 1,
0.637854, 0.1444605, 1.420179, 0.4862745, 0, 1, 1,
0.6391512, 1.367634, 0.3371799, 0.4941176, 0, 1, 1,
0.6392801, -0.1426676, 0.4524311, 0.5019608, 0, 1, 1,
0.6489617, 0.3673552, 0.8473509, 0.5058824, 0, 1, 1,
0.6509324, 1.238296, 2.171433, 0.5137255, 0, 1, 1,
0.6518261, -0.7386869, 2.145577, 0.5176471, 0, 1, 1,
0.6564068, -0.6029809, 1.297534, 0.5254902, 0, 1, 1,
0.6607655, 0.4337343, 2.049933, 0.5294118, 0, 1, 1,
0.6628077, -0.73822, 2.370893, 0.5372549, 0, 1, 1,
0.6631088, -0.2580764, 1.907736, 0.5411765, 0, 1, 1,
0.6696063, -1.198088, 2.261537, 0.5490196, 0, 1, 1,
0.6712602, 0.9744748, 1.140438, 0.5529412, 0, 1, 1,
0.6748752, 1.514493, 0.1090144, 0.5607843, 0, 1, 1,
0.6766378, -0.9421756, 3.262387, 0.5647059, 0, 1, 1,
0.6779342, 1.646889, 2.388846, 0.572549, 0, 1, 1,
0.6787194, 0.894566, 2.193059, 0.5764706, 0, 1, 1,
0.6804312, 1.949009, -0.4084141, 0.5843138, 0, 1, 1,
0.6837223, -0.3207371, 1.086831, 0.5882353, 0, 1, 1,
0.6944405, 1.408095, 1.417552, 0.5960785, 0, 1, 1,
0.6954124, -0.2849526, 2.385632, 0.6039216, 0, 1, 1,
0.6969889, -0.1334052, 1.821977, 0.6078432, 0, 1, 1,
0.7018844, -0.1513174, 2.205931, 0.6156863, 0, 1, 1,
0.7022215, 0.2415169, 1.085958, 0.6196079, 0, 1, 1,
0.7050424, 0.07070103, 0.2786041, 0.627451, 0, 1, 1,
0.7056138, 0.1256286, 0.9080001, 0.6313726, 0, 1, 1,
0.7072296, 0.03226159, 1.897634, 0.6392157, 0, 1, 1,
0.7082931, 0.3128435, -0.2262437, 0.6431373, 0, 1, 1,
0.7115141, 0.7504834, 1.185291, 0.6509804, 0, 1, 1,
0.7146893, -1.266375, 3.615669, 0.654902, 0, 1, 1,
0.7213386, 0.1826057, 0.05898071, 0.6627451, 0, 1, 1,
0.7218, -0.8314551, 2.035928, 0.6666667, 0, 1, 1,
0.7226034, 1.83495, -0.9522963, 0.6745098, 0, 1, 1,
0.7230051, -0.4830793, 1.640842, 0.6784314, 0, 1, 1,
0.7235537, 2.369021, 1.530305, 0.6862745, 0, 1, 1,
0.7278746, 1.027407, 1.79713, 0.6901961, 0, 1, 1,
0.7299, 0.03505412, 2.738414, 0.6980392, 0, 1, 1,
0.7326987, 1.467718, 0.1574394, 0.7058824, 0, 1, 1,
0.7343863, 1.10299, 0.7520334, 0.7098039, 0, 1, 1,
0.7488196, -0.3976241, 3.103573, 0.7176471, 0, 1, 1,
0.749643, -1.360749, 1.831411, 0.7215686, 0, 1, 1,
0.751273, 1.053649, 2.168699, 0.7294118, 0, 1, 1,
0.7514576, 0.1540872, 0.1871107, 0.7333333, 0, 1, 1,
0.7518753, -1.242301, 1.975663, 0.7411765, 0, 1, 1,
0.7522046, -0.4147868, 2.91565, 0.7450981, 0, 1, 1,
0.7536411, 0.5727073, -0.6180154, 0.7529412, 0, 1, 1,
0.7544529, 0.2285535, 0.9522567, 0.7568628, 0, 1, 1,
0.754574, 0.8249031, 0.7882428, 0.7647059, 0, 1, 1,
0.7555684, 2.241135, -0.1457517, 0.7686275, 0, 1, 1,
0.7715852, 0.08110388, 1.260323, 0.7764706, 0, 1, 1,
0.7879741, 0.6489512, 0.6267385, 0.7803922, 0, 1, 1,
0.7892904, -0.07033435, 1.775488, 0.7882353, 0, 1, 1,
0.7919574, 0.2468606, 1.990061, 0.7921569, 0, 1, 1,
0.793409, -0.02098862, 1.949387, 0.8, 0, 1, 1,
0.793714, 0.6673876, 0.5498723, 0.8078431, 0, 1, 1,
0.797621, -3.130896, 1.559214, 0.8117647, 0, 1, 1,
0.7999324, 0.1145557, 0.7118643, 0.8196079, 0, 1, 1,
0.8004863, 0.8920762, 0.6804169, 0.8235294, 0, 1, 1,
0.8011097, -0.4599292, 2.096671, 0.8313726, 0, 1, 1,
0.8017012, -0.476321, 4.117238, 0.8352941, 0, 1, 1,
0.802335, 1.268182, -0.1122053, 0.8431373, 0, 1, 1,
0.8049437, -0.5016757, 1.76731, 0.8470588, 0, 1, 1,
0.8145477, -1.294978, 3.492008, 0.854902, 0, 1, 1,
0.8187025, -0.6784506, 1.868174, 0.8588235, 0, 1, 1,
0.8212218, -0.2580325, 2.269021, 0.8666667, 0, 1, 1,
0.8231829, -1.378848, 4.361284, 0.8705882, 0, 1, 1,
0.8317994, -0.5607093, 2.25495, 0.8784314, 0, 1, 1,
0.8398101, -1.172881, 2.741235, 0.8823529, 0, 1, 1,
0.8449894, 1.301184, 1.905362, 0.8901961, 0, 1, 1,
0.8492351, -0.3706279, 0.4675814, 0.8941177, 0, 1, 1,
0.8492622, -0.3393258, 1.744571, 0.9019608, 0, 1, 1,
0.8560053, 1.347732, 1.122488, 0.9098039, 0, 1, 1,
0.8574767, -1.905736, 3.063889, 0.9137255, 0, 1, 1,
0.8603553, -0.6913548, 4.257701, 0.9215686, 0, 1, 1,
0.8604221, 0.4130174, 0.9063674, 0.9254902, 0, 1, 1,
0.8630829, -0.3332408, 1.904946, 0.9333333, 0, 1, 1,
0.8657033, -0.7429075, 1.913184, 0.9372549, 0, 1, 1,
0.8672069, -0.2061954, 1.391932, 0.945098, 0, 1, 1,
0.8710848, 2.395306, 0.4392017, 0.9490196, 0, 1, 1,
0.872568, -0.8507174, 3.978978, 0.9568627, 0, 1, 1,
0.8750813, -0.298526, 0.9411238, 0.9607843, 0, 1, 1,
0.875594, -0.8055874, 2.859816, 0.9686275, 0, 1, 1,
0.8821358, 0.05692691, 1.039358, 0.972549, 0, 1, 1,
0.8836355, 0.2994055, 0.1256335, 0.9803922, 0, 1, 1,
0.8891335, 0.6215073, 2.458967, 0.9843137, 0, 1, 1,
0.8913372, -0.06259847, 2.407283, 0.9921569, 0, 1, 1,
0.8946189, 0.9426023, -0.7612836, 0.9960784, 0, 1, 1,
0.8980643, 0.3813014, -0.2139328, 1, 0, 0.9960784, 1,
0.912052, 1.433034, 1.125356, 1, 0, 0.9882353, 1,
0.9130135, 0.3789894, 0.7943319, 1, 0, 0.9843137, 1,
0.916922, 0.8200634, 0.856632, 1, 0, 0.9764706, 1,
0.9170046, 0.6211789, 2.280718, 1, 0, 0.972549, 1,
0.9179536, -0.473425, 1.815, 1, 0, 0.9647059, 1,
0.9200678, 0.4411907, 0.9010743, 1, 0, 0.9607843, 1,
0.9289376, 0.5103595, -1.159135, 1, 0, 0.9529412, 1,
0.9318913, 1.617424, -0.4944769, 1, 0, 0.9490196, 1,
0.9324195, 0.3545024, 1.471542, 1, 0, 0.9411765, 1,
0.9370688, 0.8357371, 2.657067, 1, 0, 0.9372549, 1,
0.9407659, 1.171234, 0.3835353, 1, 0, 0.9294118, 1,
0.9428942, -1.565405, 1.839038, 1, 0, 0.9254902, 1,
0.9454355, 0.7879882, 1.359568, 1, 0, 0.9176471, 1,
0.9462453, -0.06459948, 0.6937065, 1, 0, 0.9137255, 1,
0.9552733, 0.1353727, 0.5855139, 1, 0, 0.9058824, 1,
0.9586335, -0.2855849, 3.111408, 1, 0, 0.9019608, 1,
0.9606926, -1.272756, 2.844955, 1, 0, 0.8941177, 1,
0.9711226, -0.572836, 1.893852, 1, 0, 0.8862745, 1,
0.9767047, -0.3785958, 0.5688739, 1, 0, 0.8823529, 1,
0.982553, -0.7407944, 1.422384, 1, 0, 0.8745098, 1,
0.9842916, -0.03534326, 3.141502, 1, 0, 0.8705882, 1,
0.9852324, -2.153204, 2.746104, 1, 0, 0.8627451, 1,
0.9945624, 2.019106, 2.047084, 1, 0, 0.8588235, 1,
1.000979, 1.34282, 1.264991, 1, 0, 0.8509804, 1,
1.002626, 0.6131083, 1.6309, 1, 0, 0.8470588, 1,
1.002882, 1.091902, 1.402047, 1, 0, 0.8392157, 1,
1.006406, 0.7725, 2.211284, 1, 0, 0.8352941, 1,
1.009691, 2.041391, 0.5257478, 1, 0, 0.827451, 1,
1.016487, -1.27683, 2.386601, 1, 0, 0.8235294, 1,
1.017956, 0.01627885, 1.257213, 1, 0, 0.8156863, 1,
1.023187, 0.8615761, 1.296137, 1, 0, 0.8117647, 1,
1.033005, 1.877273, 2.52252, 1, 0, 0.8039216, 1,
1.038535, -0.04135758, 0.4952461, 1, 0, 0.7960784, 1,
1.053588, 0.8264775, 1.375419, 1, 0, 0.7921569, 1,
1.055747, 0.6344408, 0.5872366, 1, 0, 0.7843137, 1,
1.056486, 0.01663027, 1.567487, 1, 0, 0.7803922, 1,
1.057436, 2.14115, 0.7041796, 1, 0, 0.772549, 1,
1.059466, -0.9032498, 0.3379748, 1, 0, 0.7686275, 1,
1.061623, -1.31206, 3.004497, 1, 0, 0.7607843, 1,
1.068264, 1.723194, 1.899112, 1, 0, 0.7568628, 1,
1.068588, -0.5323634, 1.285929, 1, 0, 0.7490196, 1,
1.069759, 1.236674, 2.181172, 1, 0, 0.7450981, 1,
1.073399, -0.4766607, 1.700426, 1, 0, 0.7372549, 1,
1.079449, -0.9789412, 1.169165, 1, 0, 0.7333333, 1,
1.079985, -0.1041532, 1.032448, 1, 0, 0.7254902, 1,
1.095235, -0.3158168, 0.8910036, 1, 0, 0.7215686, 1,
1.095673, 1.09522, 0.2026823, 1, 0, 0.7137255, 1,
1.097509, -0.6796176, 2.554108, 1, 0, 0.7098039, 1,
1.106437, 2.329728, 0.1293434, 1, 0, 0.7019608, 1,
1.112793, 0.2443417, 1.054572, 1, 0, 0.6941177, 1,
1.115562, -1.879285, 2.895708, 1, 0, 0.6901961, 1,
1.120397, -0.3190925, 1.715522, 1, 0, 0.682353, 1,
1.129217, -0.7643691, 2.743153, 1, 0, 0.6784314, 1,
1.132614, 0.2487342, 1.463063, 1, 0, 0.6705883, 1,
1.139886, 0.6839242, 0.9927061, 1, 0, 0.6666667, 1,
1.148921, 0.03681197, 2.192347, 1, 0, 0.6588235, 1,
1.150489, 0.9460348, 2.108894, 1, 0, 0.654902, 1,
1.154773, -0.2445349, 2.903438, 1, 0, 0.6470588, 1,
1.161819, 0.2280284, 1.076545, 1, 0, 0.6431373, 1,
1.162673, 0.694777, 0.4932891, 1, 0, 0.6352941, 1,
1.186852, 2.071451, -0.108325, 1, 0, 0.6313726, 1,
1.1965, 1.204038, 0.8205425, 1, 0, 0.6235294, 1,
1.203042, 0.9394097, 1.814558, 1, 0, 0.6196079, 1,
1.204556, 0.937593, 1.786407, 1, 0, 0.6117647, 1,
1.20483, 1.224294, 1.368436, 1, 0, 0.6078432, 1,
1.206872, -0.2153055, 1.694396, 1, 0, 0.6, 1,
1.218594, -1.429295, 2.221068, 1, 0, 0.5921569, 1,
1.227177, -0.9691966, 2.19174, 1, 0, 0.5882353, 1,
1.237563, -1.085894, 2.271628, 1, 0, 0.5803922, 1,
1.245001, 0.3640894, 0.4971117, 1, 0, 0.5764706, 1,
1.261354, -0.855613, 1.285294, 1, 0, 0.5686275, 1,
1.265824, -0.5286291, 3.205161, 1, 0, 0.5647059, 1,
1.271156, -0.1811944, -0.8803064, 1, 0, 0.5568628, 1,
1.275376, -1.195937, 2.578255, 1, 0, 0.5529412, 1,
1.285486, 0.7840233, 1.882944, 1, 0, 0.5450981, 1,
1.291521, 0.2851328, 0.2050985, 1, 0, 0.5411765, 1,
1.297759, -1.078241, 2.580235, 1, 0, 0.5333334, 1,
1.29816, -0.7787817, 2.396686, 1, 0, 0.5294118, 1,
1.298411, -0.3365108, 1.114542, 1, 0, 0.5215687, 1,
1.31215, 0.2092856, 3.81751, 1, 0, 0.5176471, 1,
1.328402, 2.280861, 0.451931, 1, 0, 0.509804, 1,
1.32888, -0.8639518, 4.585016, 1, 0, 0.5058824, 1,
1.329226, 0.5959105, 2.078224, 1, 0, 0.4980392, 1,
1.330078, 0.5582241, 1.274153, 1, 0, 0.4901961, 1,
1.339794, -0.07946014, 2.777145, 1, 0, 0.4862745, 1,
1.3517, 0.3216156, 0.3308557, 1, 0, 0.4784314, 1,
1.369948, 0.703722, 2.176767, 1, 0, 0.4745098, 1,
1.374421, 0.07641926, 1.496077, 1, 0, 0.4666667, 1,
1.376618, -0.3829904, 1.242798, 1, 0, 0.4627451, 1,
1.383156, 2.129357, 1.243603, 1, 0, 0.454902, 1,
1.384795, -0.7564481, 1.47945, 1, 0, 0.4509804, 1,
1.387339, -0.6881582, 3.227338, 1, 0, 0.4431373, 1,
1.400308, -0.5122325, 2.588158, 1, 0, 0.4392157, 1,
1.407905, 0.1476501, 0.580671, 1, 0, 0.4313726, 1,
1.411096, 1.460144, 1.729286, 1, 0, 0.427451, 1,
1.430145, 0.5915221, 1.568214, 1, 0, 0.4196078, 1,
1.437408, -0.936562, 2.773761, 1, 0, 0.4156863, 1,
1.456349, -0.5374024, 2.662045, 1, 0, 0.4078431, 1,
1.470979, -0.6249463, 2.720653, 1, 0, 0.4039216, 1,
1.473682, 0.09352408, 2.667606, 1, 0, 0.3960784, 1,
1.479439, 0.1433417, 1.295186, 1, 0, 0.3882353, 1,
1.482769, -1.812226, 5.358207, 1, 0, 0.3843137, 1,
1.492753, -0.4237734, 4.156906, 1, 0, 0.3764706, 1,
1.494846, 0.8733315, 0.7182497, 1, 0, 0.372549, 1,
1.495194, 0.5842436, 1.101514, 1, 0, 0.3647059, 1,
1.498853, 0.2493796, 1.352194, 1, 0, 0.3607843, 1,
1.510892, -0.8312433, 1.45705, 1, 0, 0.3529412, 1,
1.516476, 1.540895, 2.843705, 1, 0, 0.3490196, 1,
1.518356, 0.1640065, 0.2801055, 1, 0, 0.3411765, 1,
1.542404, 0.6963461, 1.761795, 1, 0, 0.3372549, 1,
1.580313, -1.232244, 1.719453, 1, 0, 0.3294118, 1,
1.58305, 0.1920201, 1.267999, 1, 0, 0.3254902, 1,
1.59577, -2.420617, 2.36166, 1, 0, 0.3176471, 1,
1.601051, 0.1220069, 1.286462, 1, 0, 0.3137255, 1,
1.614507, -0.7198116, 2.196553, 1, 0, 0.3058824, 1,
1.62202, -0.3868052, 1.561985, 1, 0, 0.2980392, 1,
1.622738, -0.02521034, 1.461042, 1, 0, 0.2941177, 1,
1.635396, 2.318871, -1.657618, 1, 0, 0.2862745, 1,
1.657739, -1.176787, 3.010274, 1, 0, 0.282353, 1,
1.679577, 0.3992891, 2.484446, 1, 0, 0.2745098, 1,
1.69212, -1.438637, 2.368428, 1, 0, 0.2705882, 1,
1.706685, -0.01891264, -0.1268898, 1, 0, 0.2627451, 1,
1.735243, 0.6809626, 1.831286, 1, 0, 0.2588235, 1,
1.735478, -1.723939, 2.855127, 1, 0, 0.2509804, 1,
1.751828, 0.6141835, 1.991759, 1, 0, 0.2470588, 1,
1.770088, 0.6823618, -0.8477421, 1, 0, 0.2392157, 1,
1.786385, 0.1075224, 0.9711615, 1, 0, 0.2352941, 1,
1.790302, 1.883137, 1.367145, 1, 0, 0.227451, 1,
1.793493, -0.4243974, 1.531159, 1, 0, 0.2235294, 1,
1.802849, 1.478675, 1.730983, 1, 0, 0.2156863, 1,
1.811514, 1.279385, 2.835308, 1, 0, 0.2117647, 1,
1.824161, -0.6955471, 0.5159526, 1, 0, 0.2039216, 1,
1.842623, 0.2524688, 1.278018, 1, 0, 0.1960784, 1,
1.881106, -0.9691946, 1.898069, 1, 0, 0.1921569, 1,
1.897636, 0.7332615, 3.394, 1, 0, 0.1843137, 1,
1.91422, 0.1645121, 0.8453659, 1, 0, 0.1803922, 1,
1.919855, -0.8868384, 0.8989639, 1, 0, 0.172549, 1,
1.979714, 0.6618372, 0.6284437, 1, 0, 0.1686275, 1,
1.987007, 0.1711058, 0.486441, 1, 0, 0.1607843, 1,
1.989614, -0.01303125, 2.281505, 1, 0, 0.1568628, 1,
1.995171, 0.3450183, -0.5805448, 1, 0, 0.1490196, 1,
1.995298, 0.9953622, 1.720545, 1, 0, 0.145098, 1,
1.996571, 0.6323117, -0.7224395, 1, 0, 0.1372549, 1,
2.00685, 0.7563983, 0.9117253, 1, 0, 0.1333333, 1,
2.029927, -1.176566, 2.695775, 1, 0, 0.1254902, 1,
2.060644, 0.4002636, 3.257695, 1, 0, 0.1215686, 1,
2.087861, 1.834978, 1.438285, 1, 0, 0.1137255, 1,
2.116121, 0.443147, -0.1282711, 1, 0, 0.1098039, 1,
2.179212, -0.04840088, 3.452005, 1, 0, 0.1019608, 1,
2.200334, 0.7418252, 2.171394, 1, 0, 0.09411765, 1,
2.311476, 0.9014663, 2.445436, 1, 0, 0.09019608, 1,
2.318892, -0.4783865, 1.403583, 1, 0, 0.08235294, 1,
2.375073, -0.4659518, 1.801217, 1, 0, 0.07843138, 1,
2.409474, -0.983226, 1.664895, 1, 0, 0.07058824, 1,
2.431246, 1.10978, 1.734597, 1, 0, 0.06666667, 1,
2.438189, -0.5702701, 1.323898, 1, 0, 0.05882353, 1,
2.491656, 1.183661, 0.07864214, 1, 0, 0.05490196, 1,
2.543257, -0.001565377, 3.199493, 1, 0, 0.04705882, 1,
2.577138, 0.5301142, 1.815554, 1, 0, 0.04313726, 1,
2.588846, -0.03398094, 2.68697, 1, 0, 0.03529412, 1,
2.627063, 0.8802393, 2.10153, 1, 0, 0.03137255, 1,
2.687836, -1.221806, 1.707755, 1, 0, 0.02352941, 1,
2.696861, -0.2221354, 2.031503, 1, 0, 0.01960784, 1,
2.916526, -0.8245373, 2.681773, 1, 0, 0.01176471, 1,
3.348786, -1.477241, 2.384444, 1, 0, 0.007843138, 1
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
0.04965484, -4.140153, -7.248478, 0, -0.5, 0.5, 0.5,
0.04965484, -4.140153, -7.248478, 1, -0.5, 0.5, 0.5,
0.04965484, -4.140153, -7.248478, 1, 1.5, 0.5, 0.5,
0.04965484, -4.140153, -7.248478, 0, 1.5, 0.5, 0.5
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
-4.367882, -0.1537378, -7.248478, 0, -0.5, 0.5, 0.5,
-4.367882, -0.1537378, -7.248478, 1, -0.5, 0.5, 0.5,
-4.367882, -0.1537378, -7.248478, 1, 1.5, 0.5, 0.5,
-4.367882, -0.1537378, -7.248478, 0, 1.5, 0.5, 0.5
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
-4.367882, -4.140153, -0.03156877, 0, -0.5, 0.5, 0.5,
-4.367882, -4.140153, -0.03156877, 1, -0.5, 0.5, 0.5,
-4.367882, -4.140153, -0.03156877, 1, 1.5, 0.5, 0.5,
-4.367882, -4.140153, -0.03156877, 0, 1.5, 0.5, 0.5
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
-3, -3.220211, -5.583037,
3, -3.220211, -5.583037,
-3, -3.220211, -5.583037,
-3, -3.373535, -5.860611,
-2, -3.220211, -5.583037,
-2, -3.373535, -5.860611,
-1, -3.220211, -5.583037,
-1, -3.373535, -5.860611,
0, -3.220211, -5.583037,
0, -3.373535, -5.860611,
1, -3.220211, -5.583037,
1, -3.373535, -5.860611,
2, -3.220211, -5.583037,
2, -3.373535, -5.860611,
3, -3.220211, -5.583037,
3, -3.373535, -5.860611
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
-3, -3.680182, -6.415758, 0, -0.5, 0.5, 0.5,
-3, -3.680182, -6.415758, 1, -0.5, 0.5, 0.5,
-3, -3.680182, -6.415758, 1, 1.5, 0.5, 0.5,
-3, -3.680182, -6.415758, 0, 1.5, 0.5, 0.5,
-2, -3.680182, -6.415758, 0, -0.5, 0.5, 0.5,
-2, -3.680182, -6.415758, 1, -0.5, 0.5, 0.5,
-2, -3.680182, -6.415758, 1, 1.5, 0.5, 0.5,
-2, -3.680182, -6.415758, 0, 1.5, 0.5, 0.5,
-1, -3.680182, -6.415758, 0, -0.5, 0.5, 0.5,
-1, -3.680182, -6.415758, 1, -0.5, 0.5, 0.5,
-1, -3.680182, -6.415758, 1, 1.5, 0.5, 0.5,
-1, -3.680182, -6.415758, 0, 1.5, 0.5, 0.5,
0, -3.680182, -6.415758, 0, -0.5, 0.5, 0.5,
0, -3.680182, -6.415758, 1, -0.5, 0.5, 0.5,
0, -3.680182, -6.415758, 1, 1.5, 0.5, 0.5,
0, -3.680182, -6.415758, 0, 1.5, 0.5, 0.5,
1, -3.680182, -6.415758, 0, -0.5, 0.5, 0.5,
1, -3.680182, -6.415758, 1, -0.5, 0.5, 0.5,
1, -3.680182, -6.415758, 1, 1.5, 0.5, 0.5,
1, -3.680182, -6.415758, 0, 1.5, 0.5, 0.5,
2, -3.680182, -6.415758, 0, -0.5, 0.5, 0.5,
2, -3.680182, -6.415758, 1, -0.5, 0.5, 0.5,
2, -3.680182, -6.415758, 1, 1.5, 0.5, 0.5,
2, -3.680182, -6.415758, 0, 1.5, 0.5, 0.5,
3, -3.680182, -6.415758, 0, -0.5, 0.5, 0.5,
3, -3.680182, -6.415758, 1, -0.5, 0.5, 0.5,
3, -3.680182, -6.415758, 1, 1.5, 0.5, 0.5,
3, -3.680182, -6.415758, 0, 1.5, 0.5, 0.5
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
-3.34845, -3, -5.583037,
-3.34845, 2, -5.583037,
-3.34845, -3, -5.583037,
-3.518356, -3, -5.860611,
-3.34845, -2, -5.583037,
-3.518356, -2, -5.860611,
-3.34845, -1, -5.583037,
-3.518356, -1, -5.860611,
-3.34845, 0, -5.583037,
-3.518356, 0, -5.860611,
-3.34845, 1, -5.583037,
-3.518356, 1, -5.860611,
-3.34845, 2, -5.583037,
-3.518356, 2, -5.860611
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
-3.858166, -3, -6.415758, 0, -0.5, 0.5, 0.5,
-3.858166, -3, -6.415758, 1, -0.5, 0.5, 0.5,
-3.858166, -3, -6.415758, 1, 1.5, 0.5, 0.5,
-3.858166, -3, -6.415758, 0, 1.5, 0.5, 0.5,
-3.858166, -2, -6.415758, 0, -0.5, 0.5, 0.5,
-3.858166, -2, -6.415758, 1, -0.5, 0.5, 0.5,
-3.858166, -2, -6.415758, 1, 1.5, 0.5, 0.5,
-3.858166, -2, -6.415758, 0, 1.5, 0.5, 0.5,
-3.858166, -1, -6.415758, 0, -0.5, 0.5, 0.5,
-3.858166, -1, -6.415758, 1, -0.5, 0.5, 0.5,
-3.858166, -1, -6.415758, 1, 1.5, 0.5, 0.5,
-3.858166, -1, -6.415758, 0, 1.5, 0.5, 0.5,
-3.858166, 0, -6.415758, 0, -0.5, 0.5, 0.5,
-3.858166, 0, -6.415758, 1, -0.5, 0.5, 0.5,
-3.858166, 0, -6.415758, 1, 1.5, 0.5, 0.5,
-3.858166, 0, -6.415758, 0, 1.5, 0.5, 0.5,
-3.858166, 1, -6.415758, 0, -0.5, 0.5, 0.5,
-3.858166, 1, -6.415758, 1, -0.5, 0.5, 0.5,
-3.858166, 1, -6.415758, 1, 1.5, 0.5, 0.5,
-3.858166, 1, -6.415758, 0, 1.5, 0.5, 0.5,
-3.858166, 2, -6.415758, 0, -0.5, 0.5, 0.5,
-3.858166, 2, -6.415758, 1, -0.5, 0.5, 0.5,
-3.858166, 2, -6.415758, 1, 1.5, 0.5, 0.5,
-3.858166, 2, -6.415758, 0, 1.5, 0.5, 0.5
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
-3.34845, -3.220211, -4,
-3.34845, -3.220211, 4,
-3.34845, -3.220211, -4,
-3.518356, -3.373535, -4,
-3.34845, -3.220211, -2,
-3.518356, -3.373535, -2,
-3.34845, -3.220211, 0,
-3.518356, -3.373535, 0,
-3.34845, -3.220211, 2,
-3.518356, -3.373535, 2,
-3.34845, -3.220211, 4,
-3.518356, -3.373535, 4
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
-3.858166, -3.680182, -4, 0, -0.5, 0.5, 0.5,
-3.858166, -3.680182, -4, 1, -0.5, 0.5, 0.5,
-3.858166, -3.680182, -4, 1, 1.5, 0.5, 0.5,
-3.858166, -3.680182, -4, 0, 1.5, 0.5, 0.5,
-3.858166, -3.680182, -2, 0, -0.5, 0.5, 0.5,
-3.858166, -3.680182, -2, 1, -0.5, 0.5, 0.5,
-3.858166, -3.680182, -2, 1, 1.5, 0.5, 0.5,
-3.858166, -3.680182, -2, 0, 1.5, 0.5, 0.5,
-3.858166, -3.680182, 0, 0, -0.5, 0.5, 0.5,
-3.858166, -3.680182, 0, 1, -0.5, 0.5, 0.5,
-3.858166, -3.680182, 0, 1, 1.5, 0.5, 0.5,
-3.858166, -3.680182, 0, 0, 1.5, 0.5, 0.5,
-3.858166, -3.680182, 2, 0, -0.5, 0.5, 0.5,
-3.858166, -3.680182, 2, 1, -0.5, 0.5, 0.5,
-3.858166, -3.680182, 2, 1, 1.5, 0.5, 0.5,
-3.858166, -3.680182, 2, 0, 1.5, 0.5, 0.5,
-3.858166, -3.680182, 4, 0, -0.5, 0.5, 0.5,
-3.858166, -3.680182, 4, 1, -0.5, 0.5, 0.5,
-3.858166, -3.680182, 4, 1, 1.5, 0.5, 0.5,
-3.858166, -3.680182, 4, 0, 1.5, 0.5, 0.5
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
-3.34845, -3.220211, -5.583037,
-3.34845, 2.912735, -5.583037,
-3.34845, -3.220211, 5.5199,
-3.34845, 2.912735, 5.5199,
-3.34845, -3.220211, -5.583037,
-3.34845, -3.220211, 5.5199,
-3.34845, 2.912735, -5.583037,
-3.34845, 2.912735, 5.5199,
-3.34845, -3.220211, -5.583037,
3.44776, -3.220211, -5.583037,
-3.34845, -3.220211, 5.5199,
3.44776, -3.220211, 5.5199,
-3.34845, 2.912735, -5.583037,
3.44776, 2.912735, -5.583037,
-3.34845, 2.912735, 5.5199,
3.44776, 2.912735, 5.5199,
3.44776, -3.220211, -5.583037,
3.44776, 2.912735, -5.583037,
3.44776, -3.220211, 5.5199,
3.44776, 2.912735, 5.5199,
3.44776, -3.220211, -5.583037,
3.44776, -3.220211, 5.5199,
3.44776, 2.912735, -5.583037,
3.44776, 2.912735, 5.5199
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
var radius = 7.684067;
var distance = 34.18728;
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
mvMatrix.translate( -0.04965484, 0.1537378, 0.03156877 );
mvMatrix.scale( 1.22247, 1.354677, 0.7482852 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.18728);
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


