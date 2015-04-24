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
-3.578129, -0.1092393, -0.9761984, 1, 0, 0, 1,
-3.082191, 0.04662735, -2.315067, 1, 0.007843138, 0, 1,
-2.849588, 1.611921, -0.2266751, 1, 0.01176471, 0, 1,
-2.718081, -0.4819223, -1.600326, 1, 0.01960784, 0, 1,
-2.604521, 1.229387, -2.081477, 1, 0.02352941, 0, 1,
-2.538177, -0.2789199, -0.4200951, 1, 0.03137255, 0, 1,
-2.533065, 0.04192165, -3.920116, 1, 0.03529412, 0, 1,
-2.479771, -0.1393487, -1.615774, 1, 0.04313726, 0, 1,
-2.45182, -1.029432, -2.91109, 1, 0.04705882, 0, 1,
-2.405193, 0.5528619, -1.429366, 1, 0.05490196, 0, 1,
-2.228786, -0.9610872, -2.324934, 1, 0.05882353, 0, 1,
-2.206, -1.553098, -2.575277, 1, 0.06666667, 0, 1,
-2.177212, 0.3691634, -0.3636784, 1, 0.07058824, 0, 1,
-2.155367, 1.139478, -0.9127656, 1, 0.07843138, 0, 1,
-2.118644, 0.4753948, -0.7769109, 1, 0.08235294, 0, 1,
-2.112067, -0.07489881, -2.347997, 1, 0.09019608, 0, 1,
-2.095644, -0.3988957, -1.21069, 1, 0.09411765, 0, 1,
-2.079958, 0.1783979, 0.005466773, 1, 0.1019608, 0, 1,
-2.059536, 0.5993824, 0.7762769, 1, 0.1098039, 0, 1,
-2.042137, 0.732371, -2.606206, 1, 0.1137255, 0, 1,
-2.009467, 0.910194, -0.3784317, 1, 0.1215686, 0, 1,
-1.97334, 2.353596, -0.5075206, 1, 0.1254902, 0, 1,
-1.972407, -0.8872607, -2.098872, 1, 0.1333333, 0, 1,
-1.9655, 0.4596902, -2.324814, 1, 0.1372549, 0, 1,
-1.956776, 1.3869, -1.718765, 1, 0.145098, 0, 1,
-1.937937, 0.02406198, -1.075564, 1, 0.1490196, 0, 1,
-1.935777, -1.407004, -2.41486, 1, 0.1568628, 0, 1,
-1.933792, -0.1216914, -2.454597, 1, 0.1607843, 0, 1,
-1.933561, -0.5192503, -2.226253, 1, 0.1686275, 0, 1,
-1.930509, 0.6325337, -1.625674, 1, 0.172549, 0, 1,
-1.926741, 0.008961345, -0.9945865, 1, 0.1803922, 0, 1,
-1.91852, -2.150884, -2.529871, 1, 0.1843137, 0, 1,
-1.892867, 1.084082, 0.06270396, 1, 0.1921569, 0, 1,
-1.887747, 0.367931, -2.869431, 1, 0.1960784, 0, 1,
-1.870778, -0.2654981, -4.019618, 1, 0.2039216, 0, 1,
-1.866917, 0.6425131, -0.1398505, 1, 0.2117647, 0, 1,
-1.858996, 0.7442979, -1.280638, 1, 0.2156863, 0, 1,
-1.857238, -1.477059, -1.970563, 1, 0.2235294, 0, 1,
-1.854581, -0.3090627, -1.994678, 1, 0.227451, 0, 1,
-1.827059, -0.6738719, -2.308969, 1, 0.2352941, 0, 1,
-1.825545, -0.9722138, -0.2991754, 1, 0.2392157, 0, 1,
-1.818044, -1.774613, -2.466243, 1, 0.2470588, 0, 1,
-1.815262, 0.2980204, -1.662361, 1, 0.2509804, 0, 1,
-1.793187, -0.4487403, -0.7498878, 1, 0.2588235, 0, 1,
-1.782547, 0.9850873, -1.593956, 1, 0.2627451, 0, 1,
-1.765814, 0.4243822, -0.03182917, 1, 0.2705882, 0, 1,
-1.722856, -2.72071, -2.914339, 1, 0.2745098, 0, 1,
-1.722291, -0.333845, -1.723479, 1, 0.282353, 0, 1,
-1.718784, 1.602863, -0.2089585, 1, 0.2862745, 0, 1,
-1.713685, 0.3923426, -1.459812, 1, 0.2941177, 0, 1,
-1.69711, 1.109115, -0.4618383, 1, 0.3019608, 0, 1,
-1.683831, 0.4928739, 0.4140039, 1, 0.3058824, 0, 1,
-1.656781, -0.9648757, -2.588801, 1, 0.3137255, 0, 1,
-1.656388, -0.9923108, 0.1158575, 1, 0.3176471, 0, 1,
-1.607897, 0.659077, -0.9434316, 1, 0.3254902, 0, 1,
-1.604653, 0.06093534, -4.092204, 1, 0.3294118, 0, 1,
-1.600531, 0.7794744, -1.519831, 1, 0.3372549, 0, 1,
-1.599769, 0.01268881, -2.126978, 1, 0.3411765, 0, 1,
-1.59667, 0.9223179, 1.429984, 1, 0.3490196, 0, 1,
-1.59341, 0.5185181, -0.4976898, 1, 0.3529412, 0, 1,
-1.577858, 2.450887, -0.5841032, 1, 0.3607843, 0, 1,
-1.577252, 0.3639991, -1.559532, 1, 0.3647059, 0, 1,
-1.57503, -0.08214304, -2.185648, 1, 0.372549, 0, 1,
-1.575013, 0.2393854, -1.507027, 1, 0.3764706, 0, 1,
-1.57089, 1.33298, -1.427176, 1, 0.3843137, 0, 1,
-1.559492, 0.5744756, -1.772658, 1, 0.3882353, 0, 1,
-1.551411, 1.289908, -1.137023, 1, 0.3960784, 0, 1,
-1.521653, -0.4076588, -1.688944, 1, 0.4039216, 0, 1,
-1.515409, 0.9162483, -1.050527, 1, 0.4078431, 0, 1,
-1.511188, -0.006458258, -0.04021344, 1, 0.4156863, 0, 1,
-1.48861, 1.07978, -0.08515323, 1, 0.4196078, 0, 1,
-1.483456, -0.4498028, -1.966756, 1, 0.427451, 0, 1,
-1.482957, -0.8092564, -1.347987, 1, 0.4313726, 0, 1,
-1.482333, 0.1667022, -3.579688, 1, 0.4392157, 0, 1,
-1.476653, -2.250183, -3.561315, 1, 0.4431373, 0, 1,
-1.463936, 1.131118, -0.4630242, 1, 0.4509804, 0, 1,
-1.452647, 0.4690125, 0.2240794, 1, 0.454902, 0, 1,
-1.45053, 0.3267891, -1.551363, 1, 0.4627451, 0, 1,
-1.44329, 0.2750975, -0.2970123, 1, 0.4666667, 0, 1,
-1.429089, -0.2924875, -0.3687924, 1, 0.4745098, 0, 1,
-1.427743, -0.06857421, -2.191565, 1, 0.4784314, 0, 1,
-1.424371, -0.6793038, -1.819937, 1, 0.4862745, 0, 1,
-1.420633, 0.08866148, -2.122839, 1, 0.4901961, 0, 1,
-1.419808, -0.09208003, -3.375068, 1, 0.4980392, 0, 1,
-1.418115, -0.3284416, -2.036996, 1, 0.5058824, 0, 1,
-1.41446, 0.9725871, -1.053126, 1, 0.509804, 0, 1,
-1.411837, 0.6743755, -2.009007, 1, 0.5176471, 0, 1,
-1.408781, -0.6094049, -2.53224, 1, 0.5215687, 0, 1,
-1.402501, 1.614135, -0.8881865, 1, 0.5294118, 0, 1,
-1.39246, -0.4201721, -1.933776, 1, 0.5333334, 0, 1,
-1.384456, -1.441651, -2.553295, 1, 0.5411765, 0, 1,
-1.370061, 0.3240949, -2.60063, 1, 0.5450981, 0, 1,
-1.368648, 0.5650744, 0.404393, 1, 0.5529412, 0, 1,
-1.356794, 2.37938, -0.6815684, 1, 0.5568628, 0, 1,
-1.34309, -0.008075435, -0.4552403, 1, 0.5647059, 0, 1,
-1.342869, 1.03194, -0.9253433, 1, 0.5686275, 0, 1,
-1.333732, -0.4374552, -1.977934, 1, 0.5764706, 0, 1,
-1.32566, -0.2447506, -1.713867, 1, 0.5803922, 0, 1,
-1.323674, 0.001301317, -2.282457, 1, 0.5882353, 0, 1,
-1.314004, 0.3876378, -1.979774, 1, 0.5921569, 0, 1,
-1.313246, -1.265936, -2.359587, 1, 0.6, 0, 1,
-1.311369, -0.9449475, -3.910213, 1, 0.6078432, 0, 1,
-1.308236, 0.1192214, -2.314356, 1, 0.6117647, 0, 1,
-1.300034, 0.7260339, -1.333459, 1, 0.6196079, 0, 1,
-1.297903, -0.4578715, -2.234397, 1, 0.6235294, 0, 1,
-1.295342, 0.5306154, 1.177941, 1, 0.6313726, 0, 1,
-1.295168, -1.346101, -2.504372, 1, 0.6352941, 0, 1,
-1.29421, 0.7096201, -1.262568, 1, 0.6431373, 0, 1,
-1.289137, 1.115611, -1.542136, 1, 0.6470588, 0, 1,
-1.283887, 1.629024, -0.2412576, 1, 0.654902, 0, 1,
-1.27652, 0.7242105, -1.386962, 1, 0.6588235, 0, 1,
-1.26888, -0.7589346, -0.9140618, 1, 0.6666667, 0, 1,
-1.263966, -0.05475735, -2.116248, 1, 0.6705883, 0, 1,
-1.249534, 0.4421622, -1.412017, 1, 0.6784314, 0, 1,
-1.246326, -0.2204036, -2.725237, 1, 0.682353, 0, 1,
-1.243841, 1.169532, -0.7143355, 1, 0.6901961, 0, 1,
-1.236854, -0.6077745, -1.228046, 1, 0.6941177, 0, 1,
-1.227052, -1.171745, -1.599138, 1, 0.7019608, 0, 1,
-1.215141, -0.5502211, -3.622411, 1, 0.7098039, 0, 1,
-1.214912, -0.5929849, -1.223051, 1, 0.7137255, 0, 1,
-1.213419, -1.070744, -0.09701367, 1, 0.7215686, 0, 1,
-1.212788, -0.5239021, -2.05745, 1, 0.7254902, 0, 1,
-1.211902, -0.8736566, -2.909571, 1, 0.7333333, 0, 1,
-1.200969, -1.495386, -1.929561, 1, 0.7372549, 0, 1,
-1.196872, -0.7177079, -2.746328, 1, 0.7450981, 0, 1,
-1.193533, -0.7195951, -1.94432, 1, 0.7490196, 0, 1,
-1.186742, 0.9607221, -0.7002321, 1, 0.7568628, 0, 1,
-1.181887, -1.911543, -3.468868, 1, 0.7607843, 0, 1,
-1.177715, -1.776152, -1.579525, 1, 0.7686275, 0, 1,
-1.176577, 1.352823, -1.644819, 1, 0.772549, 0, 1,
-1.174503, 0.2287462, -0.3749985, 1, 0.7803922, 0, 1,
-1.173586, 0.366053, -2.223893, 1, 0.7843137, 0, 1,
-1.169235, 0.6075097, -0.0255056, 1, 0.7921569, 0, 1,
-1.160556, -0.2255387, -0.9867408, 1, 0.7960784, 0, 1,
-1.150157, -1.146571, -2.659853, 1, 0.8039216, 0, 1,
-1.147165, -0.9797243, -3.541243, 1, 0.8117647, 0, 1,
-1.14435, 0.1077877, -1.890101, 1, 0.8156863, 0, 1,
-1.139071, -0.174488, -2.171005, 1, 0.8235294, 0, 1,
-1.135827, -0.101864, -1.270167, 1, 0.827451, 0, 1,
-1.133886, -0.5450847, -2.022686, 1, 0.8352941, 0, 1,
-1.129268, 1.103401, -1.52678, 1, 0.8392157, 0, 1,
-1.121727, -0.8964461, -3.054618, 1, 0.8470588, 0, 1,
-1.116008, -0.5659216, -1.310744, 1, 0.8509804, 0, 1,
-1.114568, 0.366098, -1.354827, 1, 0.8588235, 0, 1,
-1.107764, 0.2398727, 0.3297822, 1, 0.8627451, 0, 1,
-1.103753, -0.3913094, -3.272067, 1, 0.8705882, 0, 1,
-1.092646, -1.012055, -2.897369, 1, 0.8745098, 0, 1,
-1.085624, 0.5017842, 0.3437372, 1, 0.8823529, 0, 1,
-1.08438, -0.9702429, -3.254468, 1, 0.8862745, 0, 1,
-1.076866, 1.92347, -0.6006517, 1, 0.8941177, 0, 1,
-1.075637, 1.664549, -1.188808, 1, 0.8980392, 0, 1,
-1.075248, 0.4143541, -0.9273025, 1, 0.9058824, 0, 1,
-1.073188, 2.17091, 0.3288503, 1, 0.9137255, 0, 1,
-1.06915, 1.723806, -2.010335, 1, 0.9176471, 0, 1,
-1.065678, -0.04406646, -3.976365, 1, 0.9254902, 0, 1,
-1.062238, -0.07676198, -0.64792, 1, 0.9294118, 0, 1,
-1.060496, -0.4751592, -1.379952, 1, 0.9372549, 0, 1,
-1.059413, -0.7463011, -2.173131, 1, 0.9411765, 0, 1,
-1.059157, 0.9464496, -2.083801, 1, 0.9490196, 0, 1,
-1.053468, -2.646755, -3.51477, 1, 0.9529412, 0, 1,
-1.049613, -1.073894, -2.174745, 1, 0.9607843, 0, 1,
-1.044964, -1.390423, -3.142718, 1, 0.9647059, 0, 1,
-1.043515, 0.2517841, -1.485131, 1, 0.972549, 0, 1,
-1.026298, 0.149191, -1.835362, 1, 0.9764706, 0, 1,
-1.022362, 1.151637, 0.05007689, 1, 0.9843137, 0, 1,
-1.019431, 0.7658689, -0.6692332, 1, 0.9882353, 0, 1,
-1.012319, 0.9891979, 0.15669, 1, 0.9960784, 0, 1,
-1.003675, 0.6586856, -1.127605, 0.9960784, 1, 0, 1,
-1.001851, -0.9597183, -1.307561, 0.9921569, 1, 0, 1,
-1.001489, -1.552718, -1.795425, 0.9843137, 1, 0, 1,
-1.001264, -1.69968, -4.69697, 0.9803922, 1, 0, 1,
-0.9989493, 2.155701, 0.4465444, 0.972549, 1, 0, 1,
-0.997082, -0.4556342, -3.571809, 0.9686275, 1, 0, 1,
-0.9909005, -0.2527161, -3.046968, 0.9607843, 1, 0, 1,
-0.9856357, 0.9262782, 1.088609, 0.9568627, 1, 0, 1,
-0.9855979, 0.8321461, -0.1419775, 0.9490196, 1, 0, 1,
-0.9839596, -0.358549, -1.809969, 0.945098, 1, 0, 1,
-0.9836113, -0.1215986, -1.158877, 0.9372549, 1, 0, 1,
-0.9833996, -0.9845823, -3.000394, 0.9333333, 1, 0, 1,
-0.9823862, 0.2574767, -2.495357, 0.9254902, 1, 0, 1,
-0.9799153, -1.505096, -0.291012, 0.9215686, 1, 0, 1,
-0.9771307, -0.2417835, -1.986431, 0.9137255, 1, 0, 1,
-0.9738263, -0.8478943, -1.326992, 0.9098039, 1, 0, 1,
-0.9652236, 0.1763187, -2.054998, 0.9019608, 1, 0, 1,
-0.959844, 1.031076, -1.579915, 0.8941177, 1, 0, 1,
-0.9590862, -1.447905, -0.3471162, 0.8901961, 1, 0, 1,
-0.9548244, 1.979529, -2.674637, 0.8823529, 1, 0, 1,
-0.9361895, -0.4350394, -2.376968, 0.8784314, 1, 0, 1,
-0.9359801, -0.8616184, -3.747938, 0.8705882, 1, 0, 1,
-0.929248, 0.8051549, -0.9126629, 0.8666667, 1, 0, 1,
-0.9284981, -0.1424824, -0.3380058, 0.8588235, 1, 0, 1,
-0.9245303, 1.400086, -1.74033, 0.854902, 1, 0, 1,
-0.920061, -2.117349, -3.636998, 0.8470588, 1, 0, 1,
-0.9191923, -0.1351008, -1.590371, 0.8431373, 1, 0, 1,
-0.9177935, -1.536624, -1.979625, 0.8352941, 1, 0, 1,
-0.9171454, 0.6542888, -0.4345608, 0.8313726, 1, 0, 1,
-0.9157351, 0.2232053, -1.247193, 0.8235294, 1, 0, 1,
-0.900099, 0.1568259, -2.674275, 0.8196079, 1, 0, 1,
-0.8969908, 1.053901, 0.1572182, 0.8117647, 1, 0, 1,
-0.8946128, 2.098233, -0.3449655, 0.8078431, 1, 0, 1,
-0.8856912, 0.4207686, -2.686007, 0.8, 1, 0, 1,
-0.8806683, -1.491514, -2.155453, 0.7921569, 1, 0, 1,
-0.8801663, -1.411984, -2.521966, 0.7882353, 1, 0, 1,
-0.8791097, 0.2798304, -0.07266847, 0.7803922, 1, 0, 1,
-0.8705108, 0.5840434, -2.638586, 0.7764706, 1, 0, 1,
-0.8574373, 0.7474247, -0.6993361, 0.7686275, 1, 0, 1,
-0.8515879, 1.084646, -0.553818, 0.7647059, 1, 0, 1,
-0.8497707, -0.8547117, -3.812635, 0.7568628, 1, 0, 1,
-0.8425488, -0.4939056, -2.498806, 0.7529412, 1, 0, 1,
-0.8351591, 0.6372172, -1.462727, 0.7450981, 1, 0, 1,
-0.8315757, 0.9276547, -0.1529979, 0.7411765, 1, 0, 1,
-0.831079, -0.9892113, -1.407713, 0.7333333, 1, 0, 1,
-0.8303453, -0.2538823, -2.4676, 0.7294118, 1, 0, 1,
-0.8302166, 0.1592564, -0.8793349, 0.7215686, 1, 0, 1,
-0.8301366, 0.2691619, -0.9748611, 0.7176471, 1, 0, 1,
-0.8292978, 1.389004, -1.408383, 0.7098039, 1, 0, 1,
-0.8275002, -0.7361555, -2.161419, 0.7058824, 1, 0, 1,
-0.8254091, -1.517108, -2.711033, 0.6980392, 1, 0, 1,
-0.8224698, -0.2252746, 0.118931, 0.6901961, 1, 0, 1,
-0.8166127, -0.1759446, -0.872502, 0.6862745, 1, 0, 1,
-0.8152505, 1.377942, 0.3271347, 0.6784314, 1, 0, 1,
-0.8068238, 0.1882536, -0.8765175, 0.6745098, 1, 0, 1,
-0.806232, -1.24939, -2.489932, 0.6666667, 1, 0, 1,
-0.8046083, 0.93209, 0.3905067, 0.6627451, 1, 0, 1,
-0.8042752, -0.9810482, -3.010417, 0.654902, 1, 0, 1,
-0.7980477, -0.04626212, -0.1782403, 0.6509804, 1, 0, 1,
-0.7964613, -1.455018, -1.807802, 0.6431373, 1, 0, 1,
-0.796043, -0.2361312, -1.796959, 0.6392157, 1, 0, 1,
-0.7958258, 2.255519, -0.5470421, 0.6313726, 1, 0, 1,
-0.7953932, 1.184575, -1.205823, 0.627451, 1, 0, 1,
-0.7906183, 1.173028, -2.69361, 0.6196079, 1, 0, 1,
-0.7899585, -0.6598629, -0.9192237, 0.6156863, 1, 0, 1,
-0.7882833, 1.664255, -0.4622931, 0.6078432, 1, 0, 1,
-0.7852408, -0.1945341, -3.184823, 0.6039216, 1, 0, 1,
-0.7798805, -0.8190728, -2.59795, 0.5960785, 1, 0, 1,
-0.7787471, -0.9449423, -2.924778, 0.5882353, 1, 0, 1,
-0.7690808, -0.0226741, -2.950268, 0.5843138, 1, 0, 1,
-0.768018, -0.7676252, -0.5231283, 0.5764706, 1, 0, 1,
-0.766707, -1.084655, -1.834193, 0.572549, 1, 0, 1,
-0.765502, 3.1539, -1.301428, 0.5647059, 1, 0, 1,
-0.7610837, -0.4829275, -1.638797, 0.5607843, 1, 0, 1,
-0.7601353, 0.2099889, -1.391521, 0.5529412, 1, 0, 1,
-0.7573966, 0.5052824, -1.058683, 0.5490196, 1, 0, 1,
-0.7573614, -0.6488335, -2.225329, 0.5411765, 1, 0, 1,
-0.7544825, -0.08708456, -3.319496, 0.5372549, 1, 0, 1,
-0.7512158, -0.743575, -2.827328, 0.5294118, 1, 0, 1,
-0.7485791, -1.869159, -3.083891, 0.5254902, 1, 0, 1,
-0.7447851, 1.107882, -0.3440478, 0.5176471, 1, 0, 1,
-0.7432123, -1.635479, -3.464622, 0.5137255, 1, 0, 1,
-0.7430066, 0.1358262, -0.5174533, 0.5058824, 1, 0, 1,
-0.7419655, -1.204348, -3.464647, 0.5019608, 1, 0, 1,
-0.7367203, 1.107555, -0.4726069, 0.4941176, 1, 0, 1,
-0.7257222, -0.3532716, -1.407971, 0.4862745, 1, 0, 1,
-0.7243996, -0.4348369, -4.329195, 0.4823529, 1, 0, 1,
-0.7185114, -0.8510124, -3.701666, 0.4745098, 1, 0, 1,
-0.7173918, 1.108946, -0.03868186, 0.4705882, 1, 0, 1,
-0.7163253, 1.690568, -1.334158, 0.4627451, 1, 0, 1,
-0.7126604, -0.8431219, -2.730253, 0.4588235, 1, 0, 1,
-0.7093124, -0.1944566, -3.151591, 0.4509804, 1, 0, 1,
-0.7086907, -0.1229359, -0.4350187, 0.4470588, 1, 0, 1,
-0.7061132, -1.183114, -2.810928, 0.4392157, 1, 0, 1,
-0.7004117, -0.4820028, -4.619335, 0.4352941, 1, 0, 1,
-0.6983849, -1.163095, -2.345643, 0.427451, 1, 0, 1,
-0.6937078, -0.8623111, -1.529847, 0.4235294, 1, 0, 1,
-0.688009, 0.004858355, -2.834806, 0.4156863, 1, 0, 1,
-0.6779734, -0.7133328, -2.628109, 0.4117647, 1, 0, 1,
-0.6776925, 1.73041, -0.1089843, 0.4039216, 1, 0, 1,
-0.675158, -0.8020723, -2.788883, 0.3960784, 1, 0, 1,
-0.6738325, -0.588376, -2.525803, 0.3921569, 1, 0, 1,
-0.6693565, 1.738588, 0.536397, 0.3843137, 1, 0, 1,
-0.6649795, 0.8479879, -0.5722216, 0.3803922, 1, 0, 1,
-0.6645086, -1.319925, -1.575933, 0.372549, 1, 0, 1,
-0.6591876, -0.5260572, -2.018476, 0.3686275, 1, 0, 1,
-0.6578138, -1.016254, -1.690035, 0.3607843, 1, 0, 1,
-0.6568625, 1.115672, -2.904195, 0.3568628, 1, 0, 1,
-0.6559632, 0.05729083, -1.156235, 0.3490196, 1, 0, 1,
-0.6472939, -1.884723, -2.069733, 0.345098, 1, 0, 1,
-0.6469319, -0.7783979, -3.130414, 0.3372549, 1, 0, 1,
-0.6447298, -0.6058046, -4.068953, 0.3333333, 1, 0, 1,
-0.6418614, -0.01110656, -3.135305, 0.3254902, 1, 0, 1,
-0.6411915, 3.203388, -0.6108844, 0.3215686, 1, 0, 1,
-0.6401043, -0.6870358, -1.672164, 0.3137255, 1, 0, 1,
-0.625969, -1.520205, -5.030681, 0.3098039, 1, 0, 1,
-0.6252494, -0.7682813, -2.312941, 0.3019608, 1, 0, 1,
-0.6202673, 0.5417662, -2.047727, 0.2941177, 1, 0, 1,
-0.6182783, -1.051787, -2.473688, 0.2901961, 1, 0, 1,
-0.610804, -0.9733676, -2.778172, 0.282353, 1, 0, 1,
-0.6096229, -1.005603, -2.945253, 0.2784314, 1, 0, 1,
-0.6078024, -0.1436279, -1.061435, 0.2705882, 1, 0, 1,
-0.6056966, -0.6657232, -2.184433, 0.2666667, 1, 0, 1,
-0.6028764, 0.2762844, -0.4298247, 0.2588235, 1, 0, 1,
-0.6023504, -0.4780472, -2.655093, 0.254902, 1, 0, 1,
-0.5952327, 0.2392804, -0.8213473, 0.2470588, 1, 0, 1,
-0.5907247, -0.2409169, -4.57134, 0.2431373, 1, 0, 1,
-0.5774912, 0.8181261, -0.9974407, 0.2352941, 1, 0, 1,
-0.5739316, -0.9435062, -0.3740467, 0.2313726, 1, 0, 1,
-0.5734022, 0.1869173, 0.09050091, 0.2235294, 1, 0, 1,
-0.5705885, -0.4908179, -2.377112, 0.2196078, 1, 0, 1,
-0.569886, -1.467008, -3.399723, 0.2117647, 1, 0, 1,
-0.5599967, 0.8586107, -0.04703925, 0.2078431, 1, 0, 1,
-0.5551224, -0.2186318, -1.637171, 0.2, 1, 0, 1,
-0.5437026, 0.4439662, -3.037013, 0.1921569, 1, 0, 1,
-0.538191, 0.08564805, -0.7298719, 0.1882353, 1, 0, 1,
-0.5353341, 0.05523332, -1.911474, 0.1803922, 1, 0, 1,
-0.5333002, 0.4396777, -1.871412, 0.1764706, 1, 0, 1,
-0.5320353, -0.4749874, -0.999306, 0.1686275, 1, 0, 1,
-0.5314007, -0.2849468, -1.698316, 0.1647059, 1, 0, 1,
-0.529722, 0.3842598, -0.9464086, 0.1568628, 1, 0, 1,
-0.5297214, -0.2879694, -3.407716, 0.1529412, 1, 0, 1,
-0.5281813, -0.05097418, -0.50732, 0.145098, 1, 0, 1,
-0.5232607, 0.9937838, 0.8266907, 0.1411765, 1, 0, 1,
-0.5211765, 0.1773529, -1.528152, 0.1333333, 1, 0, 1,
-0.5167407, 0.006152354, 0.151414, 0.1294118, 1, 0, 1,
-0.516619, 0.7886238, -0.8950341, 0.1215686, 1, 0, 1,
-0.515167, 0.5110644, -1.642057, 0.1176471, 1, 0, 1,
-0.5126773, -0.4133181, -1.404681, 0.1098039, 1, 0, 1,
-0.5084745, -1.102499, -1.203145, 0.1058824, 1, 0, 1,
-0.507629, -0.1675226, -1.530153, 0.09803922, 1, 0, 1,
-0.5066656, -0.2490477, -1.529989, 0.09019608, 1, 0, 1,
-0.506202, 0.2167341, -1.568018, 0.08627451, 1, 0, 1,
-0.5046818, 1.351213, -1.526493, 0.07843138, 1, 0, 1,
-0.5013531, 0.3410125, -2.131257, 0.07450981, 1, 0, 1,
-0.4961645, -1.143793, -2.474403, 0.06666667, 1, 0, 1,
-0.4954723, 0.01798204, -2.461184, 0.0627451, 1, 0, 1,
-0.4937723, -0.2614596, -0.9299183, 0.05490196, 1, 0, 1,
-0.4912701, -0.6378541, -2.90091, 0.05098039, 1, 0, 1,
-0.4905621, 1.486331, 1.464926, 0.04313726, 1, 0, 1,
-0.487088, -0.4444299, -0.6198567, 0.03921569, 1, 0, 1,
-0.4867789, 1.627362, -0.01430914, 0.03137255, 1, 0, 1,
-0.4813516, 0.8787368, -2.063814, 0.02745098, 1, 0, 1,
-0.4715084, -0.1357978, -2.414062, 0.01960784, 1, 0, 1,
-0.4681216, -0.6096979, -2.645916, 0.01568628, 1, 0, 1,
-0.4667454, 1.215466, -0.05151624, 0.007843138, 1, 0, 1,
-0.4602197, -0.7156242, -0.2635995, 0.003921569, 1, 0, 1,
-0.4542682, -0.002459277, -2.763087, 0, 1, 0.003921569, 1,
-0.4524764, 1.042724, -1.273803, 0, 1, 0.01176471, 1,
-0.4513787, -0.0275392, -1.56552, 0, 1, 0.01568628, 1,
-0.4482316, 1.144903, 0.3535783, 0, 1, 0.02352941, 1,
-0.4452246, 0.4562524, 0.485383, 0, 1, 0.02745098, 1,
-0.4443392, 0.6605161, -0.3723944, 0, 1, 0.03529412, 1,
-0.4399544, -1.272012, -4.569111, 0, 1, 0.03921569, 1,
-0.4382983, -1.066223, -4.228281, 0, 1, 0.04705882, 1,
-0.4329267, 1.331746, -0.2255621, 0, 1, 0.05098039, 1,
-0.4268322, -0.3098973, -2.422448, 0, 1, 0.05882353, 1,
-0.4264126, 0.2299365, -3.077787, 0, 1, 0.0627451, 1,
-0.424823, -0.4995168, -3.937608, 0, 1, 0.07058824, 1,
-0.4242789, -0.4441595, -1.106053, 0, 1, 0.07450981, 1,
-0.4175699, 0.4191389, -1.568998, 0, 1, 0.08235294, 1,
-0.4174852, 0.2088992, -2.14086, 0, 1, 0.08627451, 1,
-0.4173854, -1.413697, -4.506878, 0, 1, 0.09411765, 1,
-0.4153744, 0.1718175, -1.843501, 0, 1, 0.1019608, 1,
-0.4127603, -0.4367937, -0.9778637, 0, 1, 0.1058824, 1,
-0.412112, 0.243194, -0.6917575, 0, 1, 0.1137255, 1,
-0.4095488, -0.9093761, -1.332983, 0, 1, 0.1176471, 1,
-0.4034212, 0.3372367, -2.148544, 0, 1, 0.1254902, 1,
-0.3978429, -0.6434219, -2.128733, 0, 1, 0.1294118, 1,
-0.3965718, -2.040494, -2.763692, 0, 1, 0.1372549, 1,
-0.3961795, 2.000475, -0.4131308, 0, 1, 0.1411765, 1,
-0.3952537, 1.085643, -0.8764228, 0, 1, 0.1490196, 1,
-0.3941919, -0.9084798, -3.21275, 0, 1, 0.1529412, 1,
-0.3925114, -0.8017853, -3.432168, 0, 1, 0.1607843, 1,
-0.3893646, -0.2211302, -1.512696, 0, 1, 0.1647059, 1,
-0.3881826, 1.470896, -1.001212, 0, 1, 0.172549, 1,
-0.3878274, -0.5862724, -1.9528, 0, 1, 0.1764706, 1,
-0.3856834, 0.5236619, 0.1450795, 0, 1, 0.1843137, 1,
-0.3840262, 0.4828124, -1.035815, 0, 1, 0.1882353, 1,
-0.3821299, 0.545728, 0.479365, 0, 1, 0.1960784, 1,
-0.3789768, 0.05400856, -1.664512, 0, 1, 0.2039216, 1,
-0.3786087, -1.538742, -3.199293, 0, 1, 0.2078431, 1,
-0.3784922, 1.265914, 0.2400637, 0, 1, 0.2156863, 1,
-0.3761308, -0.8387792, -1.133737, 0, 1, 0.2196078, 1,
-0.3756655, -1.413086, -4.502638, 0, 1, 0.227451, 1,
-0.375036, -1.102039, -4.006841, 0, 1, 0.2313726, 1,
-0.3730747, -0.1403702, -2.504038, 0, 1, 0.2392157, 1,
-0.3729555, 0.4019693, -0.8821223, 0, 1, 0.2431373, 1,
-0.3660743, -1.894561, -1.858868, 0, 1, 0.2509804, 1,
-0.3642169, -1.065128, -3.440244, 0, 1, 0.254902, 1,
-0.3602844, -0.9493107, -2.93117, 0, 1, 0.2627451, 1,
-0.3601896, 1.347507, -0.2525714, 0, 1, 0.2666667, 1,
-0.3598672, 1.054452, 0.1750011, 0, 1, 0.2745098, 1,
-0.356728, 0.4386082, -1.440787, 0, 1, 0.2784314, 1,
-0.3555396, 0.8157727, 1.157219, 0, 1, 0.2862745, 1,
-0.3461902, -0.8693323, -1.708771, 0, 1, 0.2901961, 1,
-0.3447273, 1.981337, -1.105397, 0, 1, 0.2980392, 1,
-0.3433809, -1.440173, -3.210001, 0, 1, 0.3058824, 1,
-0.3400788, 0.1018526, -0.63414, 0, 1, 0.3098039, 1,
-0.3372661, -0.2591449, -1.094923, 0, 1, 0.3176471, 1,
-0.3337226, 0.4456705, -1.040233, 0, 1, 0.3215686, 1,
-0.3280583, -0.5007274, -3.808176, 0, 1, 0.3294118, 1,
-0.3280375, -1.35305, -3.952284, 0, 1, 0.3333333, 1,
-0.3264539, 0.3128256, -1.378621, 0, 1, 0.3411765, 1,
-0.3255835, 0.907683, 0.05538294, 0, 1, 0.345098, 1,
-0.3234925, -0.1504515, -1.788057, 0, 1, 0.3529412, 1,
-0.3216673, 1.099739, 0.1847045, 0, 1, 0.3568628, 1,
-0.3161247, 0.9479048, -0.6117402, 0, 1, 0.3647059, 1,
-0.3154662, 0.2184012, 0.1929215, 0, 1, 0.3686275, 1,
-0.3152598, -0.4247811, -2.944129, 0, 1, 0.3764706, 1,
-0.3137944, 0.354163, 0.5234647, 0, 1, 0.3803922, 1,
-0.3133585, 0.9977415, -0.6796269, 0, 1, 0.3882353, 1,
-0.3133312, -1.164706, -2.309931, 0, 1, 0.3921569, 1,
-0.3130384, -1.277952, -2.16035, 0, 1, 0.4, 1,
-0.3044071, -0.6464638, -2.199865, 0, 1, 0.4078431, 1,
-0.3027957, -0.9180493, -4.377629, 0, 1, 0.4117647, 1,
-0.301431, -2.135264, -2.080243, 0, 1, 0.4196078, 1,
-0.3002273, 2.062221, 0.7253431, 0, 1, 0.4235294, 1,
-0.2967456, -0.6613224, -3.313775, 0, 1, 0.4313726, 1,
-0.2930007, -0.8156406, -3.020245, 0, 1, 0.4352941, 1,
-0.2896577, 0.4547322, -0.6343887, 0, 1, 0.4431373, 1,
-0.2887383, 0.5943328, -1.740285, 0, 1, 0.4470588, 1,
-0.2832997, -0.09124027, -1.061727, 0, 1, 0.454902, 1,
-0.2828172, -1.798231, -1.827226, 0, 1, 0.4588235, 1,
-0.2772126, 1.277141, -0.7292103, 0, 1, 0.4666667, 1,
-0.275947, 1.443562, -1.729063, 0, 1, 0.4705882, 1,
-0.2649693, -0.1924344, -0.1691652, 0, 1, 0.4784314, 1,
-0.2647272, -1.450731, -2.112577, 0, 1, 0.4823529, 1,
-0.2616698, -0.7201861, -4.62463, 0, 1, 0.4901961, 1,
-0.2612109, 1.389419, -0.8621525, 0, 1, 0.4941176, 1,
-0.2572157, 1.975713, -0.1447617, 0, 1, 0.5019608, 1,
-0.2563201, -1.003289, -3.249866, 0, 1, 0.509804, 1,
-0.2547047, -1.351905, -2.849555, 0, 1, 0.5137255, 1,
-0.2541054, 0.2273206, -1.672711, 0, 1, 0.5215687, 1,
-0.2506377, 0.1578359, -0.825462, 0, 1, 0.5254902, 1,
-0.2502456, 0.5585579, 1.630491, 0, 1, 0.5333334, 1,
-0.2490373, 0.8829514, 0.5548593, 0, 1, 0.5372549, 1,
-0.2454436, 1.623408, 0.3762814, 0, 1, 0.5450981, 1,
-0.2439789, -2.261605, -3.196066, 0, 1, 0.5490196, 1,
-0.2424232, 0.83324, 1.05514, 0, 1, 0.5568628, 1,
-0.2382722, 1.316904, -0.7005133, 0, 1, 0.5607843, 1,
-0.2369959, -0.2404598, -1.804696, 0, 1, 0.5686275, 1,
-0.2358443, 1.54251, -0.7612379, 0, 1, 0.572549, 1,
-0.2325274, 0.3609681, 0.3680972, 0, 1, 0.5803922, 1,
-0.223406, -1.33024, -2.814044, 0, 1, 0.5843138, 1,
-0.2219711, -3.130841, -3.417402, 0, 1, 0.5921569, 1,
-0.2161564, 1.519574, -1.162467, 0, 1, 0.5960785, 1,
-0.2143598, 0.9366612, -0.008057648, 0, 1, 0.6039216, 1,
-0.2108008, 1.102221, 0.9293984, 0, 1, 0.6117647, 1,
-0.2075336, -0.3812147, -3.302094, 0, 1, 0.6156863, 1,
-0.203995, 0.7498125, 0.3460314, 0, 1, 0.6235294, 1,
-0.2038104, 1.100763, 0.1674682, 0, 1, 0.627451, 1,
-0.1976343, 1.354571, -0.147229, 0, 1, 0.6352941, 1,
-0.1966131, 1.920569, -0.8117939, 0, 1, 0.6392157, 1,
-0.1913105, -1.143238, -3.012979, 0, 1, 0.6470588, 1,
-0.1879353, 0.579634, -1.123387, 0, 1, 0.6509804, 1,
-0.1875517, -1.390496, -3.504236, 0, 1, 0.6588235, 1,
-0.1868533, 0.06206812, -2.608346, 0, 1, 0.6627451, 1,
-0.1792478, 0.03304778, -2.743066, 0, 1, 0.6705883, 1,
-0.1791541, -0.2710704, -2.886084, 0, 1, 0.6745098, 1,
-0.1760642, -1.114435, -4.388964, 0, 1, 0.682353, 1,
-0.1753676, 0.5750813, -0.3666597, 0, 1, 0.6862745, 1,
-0.1744645, 0.7436947, -1.017494, 0, 1, 0.6941177, 1,
-0.1715752, -1.474418, -4.868083, 0, 1, 0.7019608, 1,
-0.1683356, 0.5166303, 0.179409, 0, 1, 0.7058824, 1,
-0.168021, -0.7233011, -1.299285, 0, 1, 0.7137255, 1,
-0.1633284, -0.4133515, -3.383527, 0, 1, 0.7176471, 1,
-0.1620031, -1.668165, -3.269114, 0, 1, 0.7254902, 1,
-0.1587865, -0.9739236, -3.116536, 0, 1, 0.7294118, 1,
-0.1574769, 1.185868, -1.642875, 0, 1, 0.7372549, 1,
-0.1542573, -1.702356, -3.007453, 0, 1, 0.7411765, 1,
-0.1523335, -0.5024726, -2.290872, 0, 1, 0.7490196, 1,
-0.1514501, 1.549846, -0.3840939, 0, 1, 0.7529412, 1,
-0.1467288, 0.1274067, -1.989097, 0, 1, 0.7607843, 1,
-0.1440442, -1.766575, -1.270656, 0, 1, 0.7647059, 1,
-0.1374262, -0.9845518, -1.597888, 0, 1, 0.772549, 1,
-0.1364871, -0.6033297, -3.01647, 0, 1, 0.7764706, 1,
-0.1280474, 0.1385897, -0.9883031, 0, 1, 0.7843137, 1,
-0.1261634, 1.187597, -2.564542, 0, 1, 0.7882353, 1,
-0.1256467, 1.355383, 0.2727227, 0, 1, 0.7960784, 1,
-0.1146045, -2.158712, -4.553084, 0, 1, 0.8039216, 1,
-0.113958, 0.3477002, -1.472795, 0, 1, 0.8078431, 1,
-0.1121083, -0.9152164, -2.575974, 0, 1, 0.8156863, 1,
-0.1099716, 0.3957636, -0.3399537, 0, 1, 0.8196079, 1,
-0.1088862, -0.199833, -4.157071, 0, 1, 0.827451, 1,
-0.1084926, -1.034744, -4.421169, 0, 1, 0.8313726, 1,
-0.1077489, 0.8319215, -0.4441454, 0, 1, 0.8392157, 1,
-0.1072963, -0.04953555, -1.44489, 0, 1, 0.8431373, 1,
-0.1018184, -1.213281, -3.775748, 0, 1, 0.8509804, 1,
-0.09868804, 1.675524, -0.3435053, 0, 1, 0.854902, 1,
-0.09142105, 0.6200511, 0.8870829, 0, 1, 0.8627451, 1,
-0.08608277, 0.03401183, -1.021703, 0, 1, 0.8666667, 1,
-0.08356014, 0.5942032, 1.12087, 0, 1, 0.8745098, 1,
-0.07976158, -0.2528476, -2.938264, 0, 1, 0.8784314, 1,
-0.07948055, -1.003769, -3.011652, 0, 1, 0.8862745, 1,
-0.0774461, -0.4700274, -4.978124, 0, 1, 0.8901961, 1,
-0.07601701, 1.525806, 0.4085116, 0, 1, 0.8980392, 1,
-0.07447992, 0.3154231, -1.291423, 0, 1, 0.9058824, 1,
-0.0709598, -0.09900604, -2.798455, 0, 1, 0.9098039, 1,
-0.06525849, -0.2660156, -2.285462, 0, 1, 0.9176471, 1,
-0.06514622, 1.048753, 0.825686, 0, 1, 0.9215686, 1,
-0.06133118, -0.9349827, -1.997014, 0, 1, 0.9294118, 1,
-0.05595831, -0.2832595, -3.859402, 0, 1, 0.9333333, 1,
-0.05222553, 0.6840242, 0.4250555, 0, 1, 0.9411765, 1,
-0.05198448, -0.5365799, -4.880069, 0, 1, 0.945098, 1,
-0.04968044, 0.1842582, -0.5478504, 0, 1, 0.9529412, 1,
-0.04877043, 0.6754546, -0.144736, 0, 1, 0.9568627, 1,
-0.04659669, 0.4135391, -0.5232083, 0, 1, 0.9647059, 1,
-0.04646698, -0.3794002, -4.324231, 0, 1, 0.9686275, 1,
-0.04524556, -0.8713952, -2.782015, 0, 1, 0.9764706, 1,
-0.04346255, -1.370585, -3.84079, 0, 1, 0.9803922, 1,
-0.0418918, -1.09552, -4.790365, 0, 1, 0.9882353, 1,
-0.04079036, 0.623165, 0.5249251, 0, 1, 0.9921569, 1,
-0.03366208, 0.2188351, 0.07173599, 0, 1, 1, 1,
-0.03351137, -0.6793763, -3.102927, 0, 0.9921569, 1, 1,
-0.0295188, 1.100846, 0.2791941, 0, 0.9882353, 1, 1,
-0.02939811, -1.643562, -2.005962, 0, 0.9803922, 1, 1,
-0.0278534, -0.7834598, -3.01047, 0, 0.9764706, 1, 1,
-0.02765063, -1.101146, -2.968491, 0, 0.9686275, 1, 1,
-0.0273279, 0.4062342, -1.167083, 0, 0.9647059, 1, 1,
-0.02566233, 0.8581276, -0.8511031, 0, 0.9568627, 1, 1,
-0.02552427, -1.210982, -3.591398, 0, 0.9529412, 1, 1,
-0.02418424, 0.01352678, -1.009002, 0, 0.945098, 1, 1,
-0.02317293, 0.7515541, 0.127416, 0, 0.9411765, 1, 1,
-0.01788696, 0.7949941, -1.155763, 0, 0.9333333, 1, 1,
-0.01593326, -1.324446, -2.794861, 0, 0.9294118, 1, 1,
-0.009262674, -1.705962, -3.517518, 0, 0.9215686, 1, 1,
-0.001792817, 0.9569443, 0.5011058, 0, 0.9176471, 1, 1,
-0.001237087, 0.3898272, 0.6865079, 0, 0.9098039, 1, 1,
-0.001153956, 1.108858, 1.650097, 0, 0.9058824, 1, 1,
-0.0007249176, -0.7337767, -3.91213, 0, 0.8980392, 1, 1,
0.005996414, -0.785463, 3.230285, 0, 0.8901961, 1, 1,
0.006906423, 0.8757712, 0.6814376, 0, 0.8862745, 1, 1,
0.0101066, -2.250779, 5.053727, 0, 0.8784314, 1, 1,
0.01236012, 0.8771886, -0.1118402, 0, 0.8745098, 1, 1,
0.01362034, 0.06112565, 0.9081367, 0, 0.8666667, 1, 1,
0.02058655, -0.5642652, 3.072576, 0, 0.8627451, 1, 1,
0.02401733, 0.1714575, -0.4676332, 0, 0.854902, 1, 1,
0.02469593, 0.7505114, -0.8551813, 0, 0.8509804, 1, 1,
0.02892974, -0.3007288, 2.337713, 0, 0.8431373, 1, 1,
0.03131194, -0.03733421, 2.314473, 0, 0.8392157, 1, 1,
0.03335779, 0.02916094, 1.65025, 0, 0.8313726, 1, 1,
0.04116271, 0.2134708, -0.003230671, 0, 0.827451, 1, 1,
0.04212885, -0.309597, 2.306746, 0, 0.8196079, 1, 1,
0.04715689, -0.8148302, 4.788495, 0, 0.8156863, 1, 1,
0.04771909, 1.212257, 1.419675, 0, 0.8078431, 1, 1,
0.0481376, -0.03420792, 2.005265, 0, 0.8039216, 1, 1,
0.0488623, 0.4286621, 1.233654, 0, 0.7960784, 1, 1,
0.05397828, 1.462706, 0.1265176, 0, 0.7882353, 1, 1,
0.05452835, -1.353303, 1.555148, 0, 0.7843137, 1, 1,
0.05459226, -1.012128, 4.048468, 0, 0.7764706, 1, 1,
0.05946193, -0.4376911, 2.084966, 0, 0.772549, 1, 1,
0.06654549, 0.5732516, -0.6529396, 0, 0.7647059, 1, 1,
0.07002485, 2.308354, 0.4812483, 0, 0.7607843, 1, 1,
0.07051186, 0.3012427, -0.0942664, 0, 0.7529412, 1, 1,
0.07488814, 0.392516, 1.473189, 0, 0.7490196, 1, 1,
0.0750929, -0.4112249, 2.799628, 0, 0.7411765, 1, 1,
0.07783531, 0.1031532, 0.9202992, 0, 0.7372549, 1, 1,
0.08406952, 0.3379008, 0.3202033, 0, 0.7294118, 1, 1,
0.08430967, -1.777511, 2.703531, 0, 0.7254902, 1, 1,
0.08743954, -2.307657, 3.280574, 0, 0.7176471, 1, 1,
0.09098974, -0.1419834, 4.803945, 0, 0.7137255, 1, 1,
0.0925377, 0.5209094, 0.3808929, 0, 0.7058824, 1, 1,
0.095613, 0.2112958, -0.2339258, 0, 0.6980392, 1, 1,
0.09715599, 1.235175, -0.37601, 0, 0.6941177, 1, 1,
0.09863437, 0.1981229, -1.273036, 0, 0.6862745, 1, 1,
0.1024801, 0.4052038, -0.08479705, 0, 0.682353, 1, 1,
0.1028393, -0.000880292, 2.231704, 0, 0.6745098, 1, 1,
0.1039256, 1.938883, 0.8287157, 0, 0.6705883, 1, 1,
0.1063585, 0.9215745, 0.1894673, 0, 0.6627451, 1, 1,
0.1087447, 1.354197, -0.09135218, 0, 0.6588235, 1, 1,
0.1123994, 1.574359, 0.5941212, 0, 0.6509804, 1, 1,
0.1139333, -1.127119, 2.484973, 0, 0.6470588, 1, 1,
0.1161868, 0.4074842, -0.4418636, 0, 0.6392157, 1, 1,
0.116458, -0.01889388, 1.756858, 0, 0.6352941, 1, 1,
0.1222397, -1.38065, 3.012815, 0, 0.627451, 1, 1,
0.125311, -0.03038983, 1.601008, 0, 0.6235294, 1, 1,
0.1263455, 0.231064, 2.235582, 0, 0.6156863, 1, 1,
0.1292467, -0.401877, 3.36337, 0, 0.6117647, 1, 1,
0.1303856, 0.1819018, -0.04090107, 0, 0.6039216, 1, 1,
0.1327359, -0.3177375, 0.8543555, 0, 0.5960785, 1, 1,
0.1359758, -0.3712282, 4.259058, 0, 0.5921569, 1, 1,
0.1373183, -0.5070057, 2.418015, 0, 0.5843138, 1, 1,
0.137653, -0.4277589, 2.942312, 0, 0.5803922, 1, 1,
0.1394551, -0.4970381, 2.997036, 0, 0.572549, 1, 1,
0.1401273, 0.8170315, 1.120593, 0, 0.5686275, 1, 1,
0.1445556, 1.649956, -1.659562, 0, 0.5607843, 1, 1,
0.1448594, -0.03057363, 3.368207, 0, 0.5568628, 1, 1,
0.1466224, -0.4624786, 2.332858, 0, 0.5490196, 1, 1,
0.1513483, -1.831421, 3.967971, 0, 0.5450981, 1, 1,
0.151992, -1.955205, 4.124201, 0, 0.5372549, 1, 1,
0.1527369, 0.1227251, -0.4784101, 0, 0.5333334, 1, 1,
0.1529439, -0.9021156, 3.268038, 0, 0.5254902, 1, 1,
0.1547089, 0.9885371, 0.2403332, 0, 0.5215687, 1, 1,
0.158545, 0.1771056, 0.7495875, 0, 0.5137255, 1, 1,
0.1585585, -0.4963445, 1.723353, 0, 0.509804, 1, 1,
0.1661353, -1.769939, 4.33864, 0, 0.5019608, 1, 1,
0.1685182, -0.7063741, 3.156542, 0, 0.4941176, 1, 1,
0.1690615, -0.6707291, 2.801366, 0, 0.4901961, 1, 1,
0.1723235, -0.3113158, 4.422547, 0, 0.4823529, 1, 1,
0.1774787, 1.068552, -1.032378, 0, 0.4784314, 1, 1,
0.1843528, -0.07503755, 1.97342, 0, 0.4705882, 1, 1,
0.1893787, 0.4375928, 2.044635, 0, 0.4666667, 1, 1,
0.1898722, 2.3512, 0.005563422, 0, 0.4588235, 1, 1,
0.1938136, -0.3059861, 3.483383, 0, 0.454902, 1, 1,
0.1942764, 0.1571591, 1.495676, 0, 0.4470588, 1, 1,
0.1981297, -0.1560429, 0.3903958, 0, 0.4431373, 1, 1,
0.1995035, -1.395986, 2.325925, 0, 0.4352941, 1, 1,
0.2019593, 0.4070888, 2.228646, 0, 0.4313726, 1, 1,
0.2125664, 1.107024, 1.100909, 0, 0.4235294, 1, 1,
0.2182138, 0.6606113, -2.123406, 0, 0.4196078, 1, 1,
0.2221693, 0.1169289, 1.6538, 0, 0.4117647, 1, 1,
0.2242585, 0.4681547, 0.4305384, 0, 0.4078431, 1, 1,
0.2330113, -0.5146844, 2.388904, 0, 0.4, 1, 1,
0.238869, -0.6773191, 3.667951, 0, 0.3921569, 1, 1,
0.2404243, -0.5594475, 2.922881, 0, 0.3882353, 1, 1,
0.2418443, -1.416444, 1.984698, 0, 0.3803922, 1, 1,
0.2427081, 1.046077, 1.42171, 0, 0.3764706, 1, 1,
0.2505568, -0.5841773, 2.532634, 0, 0.3686275, 1, 1,
0.2508663, -0.3478948, 1.062946, 0, 0.3647059, 1, 1,
0.2527651, -1.074838, 2.422222, 0, 0.3568628, 1, 1,
0.2569197, -1.058648, 3.017504, 0, 0.3529412, 1, 1,
0.2574186, 0.2798305, 0.09488852, 0, 0.345098, 1, 1,
0.2591641, -2.061014, 2.111959, 0, 0.3411765, 1, 1,
0.2641202, -0.6635203, 1.501284, 0, 0.3333333, 1, 1,
0.2668873, 0.7526875, 0.2822271, 0, 0.3294118, 1, 1,
0.2677587, 0.09634583, 1.243916, 0, 0.3215686, 1, 1,
0.2757833, -1.665117, 4.969695, 0, 0.3176471, 1, 1,
0.2777898, 1.768236, -0.1902855, 0, 0.3098039, 1, 1,
0.2789004, -0.4431759, 2.092879, 0, 0.3058824, 1, 1,
0.2843876, 0.360112, -1.223655, 0, 0.2980392, 1, 1,
0.2858047, -0.7239885, 4.050314, 0, 0.2901961, 1, 1,
0.2863646, -0.1059293, 0.006305693, 0, 0.2862745, 1, 1,
0.2880376, 2.080789, 1.127802, 0, 0.2784314, 1, 1,
0.2886466, 0.7909629, 1.762852, 0, 0.2745098, 1, 1,
0.2899916, -0.04726917, 1.522997, 0, 0.2666667, 1, 1,
0.2906343, -2.381168, 3.621257, 0, 0.2627451, 1, 1,
0.2927438, 0.3225586, 1.16791, 0, 0.254902, 1, 1,
0.293423, 1.447378, 0.3492244, 0, 0.2509804, 1, 1,
0.2953878, -0.3931342, 1.166489, 0, 0.2431373, 1, 1,
0.2958736, 0.2011746, 0.3633453, 0, 0.2392157, 1, 1,
0.2961169, 1.007739, 0.7082266, 0, 0.2313726, 1, 1,
0.2990918, 1.385783, -0.1659638, 0, 0.227451, 1, 1,
0.2991246, -0.1235189, 0.9994271, 0, 0.2196078, 1, 1,
0.3004048, -0.3429821, 3.031469, 0, 0.2156863, 1, 1,
0.301089, 1.123701, 0.01226901, 0, 0.2078431, 1, 1,
0.3017539, 1.055514, -0.3834792, 0, 0.2039216, 1, 1,
0.3027768, 0.4688691, 0.02332462, 0, 0.1960784, 1, 1,
0.304093, -0.6781307, 1.97312, 0, 0.1882353, 1, 1,
0.3093609, 1.275452, 0.09531941, 0, 0.1843137, 1, 1,
0.3120674, 0.0132298, 2.706944, 0, 0.1764706, 1, 1,
0.3167717, 0.07407724, 2.225237, 0, 0.172549, 1, 1,
0.3218231, 0.6573123, 0.9887803, 0, 0.1647059, 1, 1,
0.322172, -2.150468, 2.342043, 0, 0.1607843, 1, 1,
0.3222718, -0.3817969, 1.120854, 0, 0.1529412, 1, 1,
0.3225322, 0.9606879, -0.5096217, 0, 0.1490196, 1, 1,
0.3227816, -0.5572716, 3.436274, 0, 0.1411765, 1, 1,
0.3243564, -1.508543, 1.967628, 0, 0.1372549, 1, 1,
0.3326198, 1.302095, 0.7246687, 0, 0.1294118, 1, 1,
0.3371429, 0.07129236, 1.662977, 0, 0.1254902, 1, 1,
0.3405968, 0.1365353, 0.1543187, 0, 0.1176471, 1, 1,
0.341507, 0.3143672, 0.4794437, 0, 0.1137255, 1, 1,
0.3425555, -1.213301, 2.164736, 0, 0.1058824, 1, 1,
0.3433947, 0.4519094, 1.152306, 0, 0.09803922, 1, 1,
0.3440557, -0.6771761, 3.325302, 0, 0.09411765, 1, 1,
0.3442875, -0.6684243, 1.966895, 0, 0.08627451, 1, 1,
0.3451063, 0.6464305, 0.4811168, 0, 0.08235294, 1, 1,
0.3460306, -1.034791, 1.85767, 0, 0.07450981, 1, 1,
0.3470451, -0.4961676, 1.185989, 0, 0.07058824, 1, 1,
0.3474107, -0.4838803, 2.786016, 0, 0.0627451, 1, 1,
0.3511552, 0.08767597, 0.4615207, 0, 0.05882353, 1, 1,
0.3512023, -0.03809225, -0.7564698, 0, 0.05098039, 1, 1,
0.3534074, 1.317451, -0.3789702, 0, 0.04705882, 1, 1,
0.3549251, 0.3023123, 1.613302, 0, 0.03921569, 1, 1,
0.3560475, -0.8247036, 2.763856, 0, 0.03529412, 1, 1,
0.3561753, -0.4295678, 2.127271, 0, 0.02745098, 1, 1,
0.3595783, 0.3663786, -0.02773336, 0, 0.02352941, 1, 1,
0.360955, -0.00330249, 1.594697, 0, 0.01568628, 1, 1,
0.3633893, -1.63514, 3.204017, 0, 0.01176471, 1, 1,
0.3676782, 0.5758345, 0.7585446, 0, 0.003921569, 1, 1,
0.3687382, 0.1627289, 1.419442, 0.003921569, 0, 1, 1,
0.3695801, -1.201648, 1.122581, 0.007843138, 0, 1, 1,
0.3700385, 0.855122, 1.980142, 0.01568628, 0, 1, 1,
0.3703177, -2.613597, 3.578261, 0.01960784, 0, 1, 1,
0.3838663, 0.7199537, 0.8205988, 0.02745098, 0, 1, 1,
0.3875533, -0.7411129, 1.312665, 0.03137255, 0, 1, 1,
0.3907008, 1.413407, 0.4758587, 0.03921569, 0, 1, 1,
0.3914333, 0.3687684, 1.812908, 0.04313726, 0, 1, 1,
0.3923268, -0.5629065, 3.619938, 0.05098039, 0, 1, 1,
0.3959041, -0.7359012, 0.8176713, 0.05490196, 0, 1, 1,
0.3979081, 0.01280388, 2.455462, 0.0627451, 0, 1, 1,
0.4016381, -0.6646584, 2.801468, 0.06666667, 0, 1, 1,
0.4038056, -0.1101268, 1.966344, 0.07450981, 0, 1, 1,
0.4046607, -0.09735652, 2.628371, 0.07843138, 0, 1, 1,
0.4059381, -0.3620076, 1.506738, 0.08627451, 0, 1, 1,
0.4082761, -0.9746025, 3.607428, 0.09019608, 0, 1, 1,
0.4096866, 0.8594206, -0.349452, 0.09803922, 0, 1, 1,
0.4104659, -0.4605921, 2.851496, 0.1058824, 0, 1, 1,
0.4105928, 1.181907, 0.606346, 0.1098039, 0, 1, 1,
0.4165548, 0.1622377, 2.076991, 0.1176471, 0, 1, 1,
0.4193974, 0.5630904, 1.261571, 0.1215686, 0, 1, 1,
0.4198675, 1.03601, 0.1158803, 0.1294118, 0, 1, 1,
0.4240028, -1.249838, 3.207774, 0.1333333, 0, 1, 1,
0.4242168, -1.457803, 1.366411, 0.1411765, 0, 1, 1,
0.4269252, -1.124095, 3.864395, 0.145098, 0, 1, 1,
0.4319558, -1.432381, 3.335038, 0.1529412, 0, 1, 1,
0.4352936, -1.198894, 3.11906, 0.1568628, 0, 1, 1,
0.4355291, -0.8959802, 3.513306, 0.1647059, 0, 1, 1,
0.4363309, 0.2029627, 0.258039, 0.1686275, 0, 1, 1,
0.4400065, 0.6002803, 0.796286, 0.1764706, 0, 1, 1,
0.4405166, 0.7930151, 0.9386948, 0.1803922, 0, 1, 1,
0.4425555, -0.36698, 2.280914, 0.1882353, 0, 1, 1,
0.4457703, -0.5587097, 3.032221, 0.1921569, 0, 1, 1,
0.447309, 0.2714691, 0.4214157, 0.2, 0, 1, 1,
0.4521226, 0.5476382, -0.6161148, 0.2078431, 0, 1, 1,
0.4552772, -1.393357, 4.626157, 0.2117647, 0, 1, 1,
0.4566224, -1.555947, 1.634763, 0.2196078, 0, 1, 1,
0.4633785, -0.4672606, 2.326093, 0.2235294, 0, 1, 1,
0.4658165, -0.2164929, 1.20308, 0.2313726, 0, 1, 1,
0.469635, -0.8688448, 1.434524, 0.2352941, 0, 1, 1,
0.4707459, -0.6926617, 1.74171, 0.2431373, 0, 1, 1,
0.470834, -0.1890605, 1.19425, 0.2470588, 0, 1, 1,
0.4758927, -0.333139, 0.1401616, 0.254902, 0, 1, 1,
0.4789433, -1.693327, 1.993741, 0.2588235, 0, 1, 1,
0.4827716, 2.035292, -0.6188168, 0.2666667, 0, 1, 1,
0.4852335, 0.05902493, -0.1961711, 0.2705882, 0, 1, 1,
0.495674, 0.2495791, 0.6834019, 0.2784314, 0, 1, 1,
0.4963914, -0.1426088, 3.170116, 0.282353, 0, 1, 1,
0.5056306, -0.494793, 2.346051, 0.2901961, 0, 1, 1,
0.507804, -0.7348102, 4.063362, 0.2941177, 0, 1, 1,
0.5114994, 1.263583, 0.02400232, 0.3019608, 0, 1, 1,
0.5139723, -0.7057639, 2.76312, 0.3098039, 0, 1, 1,
0.5169954, 0.2917747, 1.717688, 0.3137255, 0, 1, 1,
0.5216742, -0.5680234, -0.295041, 0.3215686, 0, 1, 1,
0.5221664, 0.4838829, 0.5837018, 0.3254902, 0, 1, 1,
0.522167, -1.653416, 2.811242, 0.3333333, 0, 1, 1,
0.5222691, -0.2309112, 2.29395, 0.3372549, 0, 1, 1,
0.5252646, 0.1027542, 2.727663, 0.345098, 0, 1, 1,
0.537707, 0.510323, 1.060385, 0.3490196, 0, 1, 1,
0.5398231, 0.2102792, 0.07620717, 0.3568628, 0, 1, 1,
0.5424232, 1.041026, 0.06984237, 0.3607843, 0, 1, 1,
0.5469831, 1.726528, -1.627968, 0.3686275, 0, 1, 1,
0.5494152, 0.0005905368, 1.443645, 0.372549, 0, 1, 1,
0.5511677, 1.642653, -0.8430573, 0.3803922, 0, 1, 1,
0.5562709, 0.1425428, 0.8216224, 0.3843137, 0, 1, 1,
0.5573453, 0.5121731, 0.4514183, 0.3921569, 0, 1, 1,
0.559913, 2.175392, 1.532755, 0.3960784, 0, 1, 1,
0.5622082, 2.845951, 2.141374, 0.4039216, 0, 1, 1,
0.5654837, 0.247165, 1.328798, 0.4117647, 0, 1, 1,
0.5688682, -0.03892531, 1.112852, 0.4156863, 0, 1, 1,
0.569905, 0.5407249, -0.2784487, 0.4235294, 0, 1, 1,
0.5714119, 0.3996681, -0.0001140643, 0.427451, 0, 1, 1,
0.5725772, -0.6640363, 5.00914, 0.4352941, 0, 1, 1,
0.573128, -1.208652, 4.395156, 0.4392157, 0, 1, 1,
0.5820388, -0.4207194, 2.414341, 0.4470588, 0, 1, 1,
0.5837505, 0.02780104, 0.8805515, 0.4509804, 0, 1, 1,
0.5847864, 0.9566635, 1.67262, 0.4588235, 0, 1, 1,
0.5855889, -0.4995023, 2.090058, 0.4627451, 0, 1, 1,
0.5887328, 0.1923467, 1.61757, 0.4705882, 0, 1, 1,
0.5956913, 0.9449531, 1.797928, 0.4745098, 0, 1, 1,
0.5958678, -0.2622384, 2.355866, 0.4823529, 0, 1, 1,
0.5980834, -3.685107, 3.007946, 0.4862745, 0, 1, 1,
0.6019593, -2.167384, 2.923505, 0.4941176, 0, 1, 1,
0.606087, -0.0621848, 2.275068, 0.5019608, 0, 1, 1,
0.6074929, 0.07931533, 3.012055, 0.5058824, 0, 1, 1,
0.608726, 1.154924, 3.020954, 0.5137255, 0, 1, 1,
0.6101872, 1.196059, 0.8407808, 0.5176471, 0, 1, 1,
0.6104717, 0.1794253, -0.1586917, 0.5254902, 0, 1, 1,
0.6109552, 0.3961937, 0.4138099, 0.5294118, 0, 1, 1,
0.6349668, 0.4577691, 0.8685241, 0.5372549, 0, 1, 1,
0.637181, 0.5444095, 0.5843696, 0.5411765, 0, 1, 1,
0.6504941, -0.1877529, 1.461784, 0.5490196, 0, 1, 1,
0.6531176, -2.745531, 4.003549, 0.5529412, 0, 1, 1,
0.6534036, -0.1811592, 3.561338, 0.5607843, 0, 1, 1,
0.65448, -0.7382431, 1.868181, 0.5647059, 0, 1, 1,
0.6659493, 0.1691377, 1.696619, 0.572549, 0, 1, 1,
0.6668569, 0.295413, 0.7164302, 0.5764706, 0, 1, 1,
0.6685421, -1.138287, 3.37333, 0.5843138, 0, 1, 1,
0.6709474, -0.7474591, 1.875963, 0.5882353, 0, 1, 1,
0.6713507, 0.1547389, 0.2168457, 0.5960785, 0, 1, 1,
0.6727555, -0.5279789, 3.166045, 0.6039216, 0, 1, 1,
0.6730945, -0.1129725, 1.984037, 0.6078432, 0, 1, 1,
0.6737828, 0.5781144, 1.751294, 0.6156863, 0, 1, 1,
0.6738191, -0.7340018, 1.723495, 0.6196079, 0, 1, 1,
0.6741324, -0.7910343, 3.73468, 0.627451, 0, 1, 1,
0.6865147, 1.960534, 2.103731, 0.6313726, 0, 1, 1,
0.6883417, -0.5579264, 3.587167, 0.6392157, 0, 1, 1,
0.6892838, 2.48738, 0.3652137, 0.6431373, 0, 1, 1,
0.6903136, 0.8327725, -0.5231035, 0.6509804, 0, 1, 1,
0.690345, -0.02690315, -1.185922, 0.654902, 0, 1, 1,
0.6933071, -0.1278489, 2.731581, 0.6627451, 0, 1, 1,
0.6935838, 0.2118181, 1.742453, 0.6666667, 0, 1, 1,
0.6976404, -1.102346, 0.4988737, 0.6745098, 0, 1, 1,
0.6978569, -1.160542, 0.4899455, 0.6784314, 0, 1, 1,
0.7017301, 2.037578, 2.079392, 0.6862745, 0, 1, 1,
0.7045396, -0.8271642, 1.398379, 0.6901961, 0, 1, 1,
0.7075228, -0.002606161, 1.226585, 0.6980392, 0, 1, 1,
0.7119026, -1.94567, 3.504784, 0.7058824, 0, 1, 1,
0.7133439, -1.193283, 2.926254, 0.7098039, 0, 1, 1,
0.7148458, 0.05104361, 0.356067, 0.7176471, 0, 1, 1,
0.7175729, 0.8514842, 0.8530787, 0.7215686, 0, 1, 1,
0.7177973, -1.995943, 3.699165, 0.7294118, 0, 1, 1,
0.7189452, 0.792909, 0.8697358, 0.7333333, 0, 1, 1,
0.7197542, 0.5524443, 1.390452, 0.7411765, 0, 1, 1,
0.7378468, 0.3678447, 0.1631131, 0.7450981, 0, 1, 1,
0.7388433, -1.157459, 2.540597, 0.7529412, 0, 1, 1,
0.7390735, -0.2649963, 0.486488, 0.7568628, 0, 1, 1,
0.7456556, -0.9741392, 2.19263, 0.7647059, 0, 1, 1,
0.7466872, -0.6271216, 2.831616, 0.7686275, 0, 1, 1,
0.7547743, 0.120611, 0.9656271, 0.7764706, 0, 1, 1,
0.7576736, -0.632752, 1.789324, 0.7803922, 0, 1, 1,
0.7585628, -1.161416, 3.038057, 0.7882353, 0, 1, 1,
0.7626203, 0.2986749, 0.9237199, 0.7921569, 0, 1, 1,
0.7627304, 0.0842813, 1.385249, 0.8, 0, 1, 1,
0.7680777, -0.2505859, 1.117227, 0.8078431, 0, 1, 1,
0.7697846, 0.03586289, 1.249632, 0.8117647, 0, 1, 1,
0.776069, 0.8931761, 1.150362, 0.8196079, 0, 1, 1,
0.781891, -0.1323966, 2.400073, 0.8235294, 0, 1, 1,
0.7820677, -0.0772275, 1.625908, 0.8313726, 0, 1, 1,
0.785781, 0.5026513, 0.1618742, 0.8352941, 0, 1, 1,
0.7886607, -0.02572347, 3.530341, 0.8431373, 0, 1, 1,
0.7888756, 0.05510088, 1.44471, 0.8470588, 0, 1, 1,
0.7891802, -0.890688, 0.9039307, 0.854902, 0, 1, 1,
0.7939495, -1.725237, 1.831135, 0.8588235, 0, 1, 1,
0.797587, 0.01252692, 2.741185, 0.8666667, 0, 1, 1,
0.7990919, -1.214441, 2.462085, 0.8705882, 0, 1, 1,
0.807394, 0.9683709, 0.6162059, 0.8784314, 0, 1, 1,
0.8147037, 0.3546562, 1.225647, 0.8823529, 0, 1, 1,
0.8211351, 0.8792481, -0.5770116, 0.8901961, 0, 1, 1,
0.8223354, -0.4257889, -0.7924355, 0.8941177, 0, 1, 1,
0.8239143, 0.03228282, 2.378045, 0.9019608, 0, 1, 1,
0.8326018, -0.5320284, 3.324038, 0.9098039, 0, 1, 1,
0.8331064, -1.606543, 1.649463, 0.9137255, 0, 1, 1,
0.835165, -0.6244993, 1.270549, 0.9215686, 0, 1, 1,
0.8376898, 0.345246, -0.08728471, 0.9254902, 0, 1, 1,
0.848307, -1.418897, 2.805057, 0.9333333, 0, 1, 1,
0.8507876, 0.7875095, 1.22968, 0.9372549, 0, 1, 1,
0.8597049, 0.1997883, 2.029582, 0.945098, 0, 1, 1,
0.866583, -0.7418213, 3.575238, 0.9490196, 0, 1, 1,
0.8703444, 0.3143468, 1.862531, 0.9568627, 0, 1, 1,
0.8716627, 0.3228631, 1.954564, 0.9607843, 0, 1, 1,
0.874834, -0.6928951, 2.981413, 0.9686275, 0, 1, 1,
0.8758351, -0.1199543, 1.920571, 0.972549, 0, 1, 1,
0.882643, -0.8900995, 3.838676, 0.9803922, 0, 1, 1,
0.8858618, -1.37277, 0.7527025, 0.9843137, 0, 1, 1,
0.888452, -0.5151725, -0.521338, 0.9921569, 0, 1, 1,
0.889552, -1.360092, 2.088372, 0.9960784, 0, 1, 1,
0.8908828, 0.2041789, 0.3928382, 1, 0, 0.9960784, 1,
0.9011828, -0.4001983, 2.281439, 1, 0, 0.9882353, 1,
0.9041142, 0.4597068, 0.6113563, 1, 0, 0.9843137, 1,
0.9041175, -1.793937, 4.029604, 1, 0, 0.9764706, 1,
0.9211957, -0.0365463, 1.956403, 1, 0, 0.972549, 1,
0.92184, 0.9095252, -0.5331568, 1, 0, 0.9647059, 1,
0.9346418, 1.47281, -0.7538028, 1, 0, 0.9607843, 1,
0.934897, 1.046531, -0.2849945, 1, 0, 0.9529412, 1,
0.9359696, 0.7260364, 0.3967527, 1, 0, 0.9490196, 1,
0.9395063, -1.318184, 4.166031, 1, 0, 0.9411765, 1,
0.9402098, 0.1375613, 4.076179, 1, 0, 0.9372549, 1,
0.9405943, 0.3124583, 0.02423993, 1, 0, 0.9294118, 1,
0.9429284, 0.6846433, 2.219342, 1, 0, 0.9254902, 1,
0.9439943, 2.271353, 0.7084655, 1, 0, 0.9176471, 1,
0.946982, -0.366627, 0.06118695, 1, 0, 0.9137255, 1,
0.9580258, -1.229511, 0.9980715, 1, 0, 0.9058824, 1,
0.9790963, -0.3408286, 1.878931, 1, 0, 0.9019608, 1,
0.9811883, -1.66967, 4.258434, 1, 0, 0.8941177, 1,
0.9839982, 0.8430692, 1.120335, 1, 0, 0.8862745, 1,
0.986043, -1.114207, 1.589985, 1, 0, 0.8823529, 1,
0.9987952, 0.8794561, -0.6811069, 1, 0, 0.8745098, 1,
1.004472, 0.466357, 1.292085, 1, 0, 0.8705882, 1,
1.008588, -3.26849, 2.976926, 1, 0, 0.8627451, 1,
1.018221, -0.231968, 1.136531, 1, 0, 0.8588235, 1,
1.026857, -1.262016, 2.11124, 1, 0, 0.8509804, 1,
1.028625, 2.038348, -0.01968577, 1, 0, 0.8470588, 1,
1.030886, -0.1828926, 1.50116, 1, 0, 0.8392157, 1,
1.034878, -1.194968, 1.366717, 1, 0, 0.8352941, 1,
1.035889, -2.285325, 4.300472, 1, 0, 0.827451, 1,
1.038426, 1.077672, -0.895919, 1, 0, 0.8235294, 1,
1.050044, -1.317207, 1.058546, 1, 0, 0.8156863, 1,
1.057843, -0.1140803, 3.436443, 1, 0, 0.8117647, 1,
1.060178, -0.2839591, 1.991543, 1, 0, 0.8039216, 1,
1.061236, -1.69965, 3.366755, 1, 0, 0.7960784, 1,
1.065099, 1.301893, 0.1830137, 1, 0, 0.7921569, 1,
1.082293, 1.09058, 2.402556, 1, 0, 0.7843137, 1,
1.083934, 2.182649, 0.08712898, 1, 0, 0.7803922, 1,
1.085784, -0.7729077, 2.59776, 1, 0, 0.772549, 1,
1.097819, -0.859884, 2.278612, 1, 0, 0.7686275, 1,
1.098856, 3.054993, -0.3267737, 1, 0, 0.7607843, 1,
1.09959, 0.7821454, 1.355089, 1, 0, 0.7568628, 1,
1.106725, -1.346259, 2.23444, 1, 0, 0.7490196, 1,
1.112804, 0.4348011, 1.777029, 1, 0, 0.7450981, 1,
1.120756, 0.1041727, 2.183424, 1, 0, 0.7372549, 1,
1.136664, 0.4523374, 1.248834, 1, 0, 0.7333333, 1,
1.152657, 1.108206, -0.1833416, 1, 0, 0.7254902, 1,
1.152854, -2.106654, 4.00983, 1, 0, 0.7215686, 1,
1.1642, 0.7169949, 1.35873, 1, 0, 0.7137255, 1,
1.16579, -0.3377122, 0.7671311, 1, 0, 0.7098039, 1,
1.172898, -0.1891045, 2.075867, 1, 0, 0.7019608, 1,
1.177698, -1.023802, 0.8503575, 1, 0, 0.6941177, 1,
1.179708, -1.140065, 2.378711, 1, 0, 0.6901961, 1,
1.195147, 0.8831989, 0.6326326, 1, 0, 0.682353, 1,
1.199376, -0.4480088, 1.86146, 1, 0, 0.6784314, 1,
1.203254, 0.2792253, 1.874092, 1, 0, 0.6705883, 1,
1.20424, -1.053334, 2.742995, 1, 0, 0.6666667, 1,
1.208105, -1.012021, 2.280313, 1, 0, 0.6588235, 1,
1.208806, -0.4279236, 3.265165, 1, 0, 0.654902, 1,
1.218526, -1.199287, 3.171422, 1, 0, 0.6470588, 1,
1.22761, -0.8395126, 1.539638, 1, 0, 0.6431373, 1,
1.229609, 0.4721208, 1.623935, 1, 0, 0.6352941, 1,
1.23294, 1.169151, 2.304549, 1, 0, 0.6313726, 1,
1.24303, -0.2428869, 0.4897851, 1, 0, 0.6235294, 1,
1.245052, -0.1111428, 1.88059, 1, 0, 0.6196079, 1,
1.25524, -0.4407803, 2.195565, 1, 0, 0.6117647, 1,
1.266558, 1.209936, 0.959067, 1, 0, 0.6078432, 1,
1.27497, -2.036302, 1.180717, 1, 0, 0.6, 1,
1.276495, 0.524619, 1.9484, 1, 0, 0.5921569, 1,
1.281382, -0.06278466, 2.71375, 1, 0, 0.5882353, 1,
1.284293, 0.4714689, -0.3066882, 1, 0, 0.5803922, 1,
1.286204, 0.2690648, 2.863348, 1, 0, 0.5764706, 1,
1.287703, -0.3799649, 1.169253, 1, 0, 0.5686275, 1,
1.29555, 0.6506611, 0.1666359, 1, 0, 0.5647059, 1,
1.299612, 0.2347634, -0.1435793, 1, 0, 0.5568628, 1,
1.304259, -0.8551776, 2.290954, 1, 0, 0.5529412, 1,
1.304466, -1.452664, 2.129843, 1, 0, 0.5450981, 1,
1.312087, -0.7965091, 1.767608, 1, 0, 0.5411765, 1,
1.321031, -1.199413, 1.572265, 1, 0, 0.5333334, 1,
1.325247, -0.3190021, 2.087117, 1, 0, 0.5294118, 1,
1.333362, -1.063157, 1.799124, 1, 0, 0.5215687, 1,
1.338334, -1.060354, 2.118314, 1, 0, 0.5176471, 1,
1.349978, -1.22797, 2.20619, 1, 0, 0.509804, 1,
1.350104, -0.9361942, 1.650218, 1, 0, 0.5058824, 1,
1.362301, -0.5934071, 0.9357626, 1, 0, 0.4980392, 1,
1.368044, 0.8905679, 0.03379984, 1, 0, 0.4901961, 1,
1.368046, 0.6415128, -1.183072, 1, 0, 0.4862745, 1,
1.372302, 0.2833307, 2.876513, 1, 0, 0.4784314, 1,
1.373276, -0.7710243, 1.822311, 1, 0, 0.4745098, 1,
1.377325, -1.247697, 2.666611, 1, 0, 0.4666667, 1,
1.394169, 0.6223572, -0.6748735, 1, 0, 0.4627451, 1,
1.398307, -2.497444, 2.632072, 1, 0, 0.454902, 1,
1.398432, -0.3630008, 3.018636, 1, 0, 0.4509804, 1,
1.412432, 1.770916, 0.6539484, 1, 0, 0.4431373, 1,
1.415612, -0.6155567, 1.677406, 1, 0, 0.4392157, 1,
1.417196, 0.393412, 0.3134614, 1, 0, 0.4313726, 1,
1.420918, 0.4769137, 0.3934021, 1, 0, 0.427451, 1,
1.441209, -1.249747, 3.222671, 1, 0, 0.4196078, 1,
1.447863, -2.516856, 2.209201, 1, 0, 0.4156863, 1,
1.449144, -0.4271855, 2.554962, 1, 0, 0.4078431, 1,
1.451863, 1.696402, 0.3393655, 1, 0, 0.4039216, 1,
1.452471, 1.385265, 2.00817, 1, 0, 0.3960784, 1,
1.471398, 0.9972096, 0.5711945, 1, 0, 0.3882353, 1,
1.47601, 1.115141, 1.435945, 1, 0, 0.3843137, 1,
1.489719, 0.2638923, 0.3449057, 1, 0, 0.3764706, 1,
1.489789, 0.4981674, 1.00411, 1, 0, 0.372549, 1,
1.508958, -0.7126806, 2.8667, 1, 0, 0.3647059, 1,
1.515453, 0.9560006, 1.557261, 1, 0, 0.3607843, 1,
1.519808, -0.6076274, 3.18842, 1, 0, 0.3529412, 1,
1.523102, 0.7860575, 0.8812287, 1, 0, 0.3490196, 1,
1.531392, 0.5671564, 3.456143, 1, 0, 0.3411765, 1,
1.538185, 0.81476, 0.08958505, 1, 0, 0.3372549, 1,
1.561841, -0.3731091, 1.22473, 1, 0, 0.3294118, 1,
1.56762, -1.248157, 3.449604, 1, 0, 0.3254902, 1,
1.569342, -0.9671448, 1.498985, 1, 0, 0.3176471, 1,
1.586564, 1.42116, -0.3387251, 1, 0, 0.3137255, 1,
1.596021, -0.2330057, 2.05172, 1, 0, 0.3058824, 1,
1.608829, 0.6804348, 0.5307919, 1, 0, 0.2980392, 1,
1.61001, 1.442961, 0.05272837, 1, 0, 0.2941177, 1,
1.627174, 1.001676, 1.216819, 1, 0, 0.2862745, 1,
1.635313, -0.2523097, 2.411886, 1, 0, 0.282353, 1,
1.667258, -0.7025622, 2.332736, 1, 0, 0.2745098, 1,
1.678017, 0.7047412, 2.055835, 1, 0, 0.2705882, 1,
1.683887, -0.2627896, 1.452694, 1, 0, 0.2627451, 1,
1.697116, -0.503895, 1.082724, 1, 0, 0.2588235, 1,
1.697673, -0.006067311, 2.55245, 1, 0, 0.2509804, 1,
1.737825, 0.06636079, 2.879242, 1, 0, 0.2470588, 1,
1.741521, -0.6361246, 2.462785, 1, 0, 0.2392157, 1,
1.741854, 2.001985, 0.7200366, 1, 0, 0.2352941, 1,
1.745162, 0.910828, 0.5473939, 1, 0, 0.227451, 1,
1.75888, -0.8644608, 0.322093, 1, 0, 0.2235294, 1,
1.769917, -1.710724, 4.398347, 1, 0, 0.2156863, 1,
1.779504, -0.2020892, 3.686769, 1, 0, 0.2117647, 1,
1.784378, 1.13548, 0.4627351, 1, 0, 0.2039216, 1,
1.800609, -0.2575257, 0.624568, 1, 0, 0.1960784, 1,
1.829997, 1.072997, -0.4895783, 1, 0, 0.1921569, 1,
1.831035, -0.867887, 1.332431, 1, 0, 0.1843137, 1,
1.857423, -0.2652478, 1.095217, 1, 0, 0.1803922, 1,
1.859498, -0.8360284, 1.315164, 1, 0, 0.172549, 1,
1.866383, -0.4188969, 2.820362, 1, 0, 0.1686275, 1,
1.876009, -1.16319, 0.04613907, 1, 0, 0.1607843, 1,
1.889035, 0.8213434, 0.4243956, 1, 0, 0.1568628, 1,
1.899697, 1.533387, 1.078442, 1, 0, 0.1490196, 1,
1.902007, -1.099249, 4.169927, 1, 0, 0.145098, 1,
1.917433, 1.927414, 0.2921227, 1, 0, 0.1372549, 1,
1.9248, -0.1789961, 1.476469, 1, 0, 0.1333333, 1,
1.927545, -1.367406, 2.506318, 1, 0, 0.1254902, 1,
1.934913, 0.9906399, 1.276379, 1, 0, 0.1215686, 1,
1.94225, 1.4535, 0.1014418, 1, 0, 0.1137255, 1,
1.95696, 0.2960562, 1.024624, 1, 0, 0.1098039, 1,
1.974881, 0.5647934, 1.185228, 1, 0, 0.1019608, 1,
1.982187, -0.2483596, 2.217814, 1, 0, 0.09411765, 1,
2.109591, -0.5834082, 2.057028, 1, 0, 0.09019608, 1,
2.120576, -0.3550174, 2.104881, 1, 0, 0.08235294, 1,
2.127935, 0.1440092, 0.9420775, 1, 0, 0.07843138, 1,
2.131666, -1.397698, 3.564485, 1, 0, 0.07058824, 1,
2.266903, -0.3867647, 2.17224, 1, 0, 0.06666667, 1,
2.270064, 0.1948921, -0.5450008, 1, 0, 0.05882353, 1,
2.301409, 0.1884299, 1.829738, 1, 0, 0.05490196, 1,
2.319172, -1.445961, 2.93963, 1, 0, 0.04705882, 1,
2.389033, 0.2857032, 1.991456, 1, 0, 0.04313726, 1,
2.390426, -1.228101, 0.1319576, 1, 0, 0.03529412, 1,
2.447843, 0.0518141, 1.251941, 1, 0, 0.03137255, 1,
2.50081, -0.8052015, 2.299937, 1, 0, 0.02352941, 1,
2.513846, 0.7042221, 1.562484, 1, 0, 0.01960784, 1,
2.787358, -1.804079, 1.923768, 1, 0, 0.01176471, 1,
3.174982, 0.5864447, 1.285061, 1, 0, 0.007843138, 1
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
-0.2015733, -4.852707, -6.739988, 0, -0.5, 0.5, 0.5,
-0.2015733, -4.852707, -6.739988, 1, -0.5, 0.5, 0.5,
-0.2015733, -4.852707, -6.739988, 1, 1.5, 0.5, 0.5,
-0.2015733, -4.852707, -6.739988, 0, 1.5, 0.5, 0.5
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
-4.722781, -0.2408592, -6.739988, 0, -0.5, 0.5, 0.5,
-4.722781, -0.2408592, -6.739988, 1, -0.5, 0.5, 0.5,
-4.722781, -0.2408592, -6.739988, 1, 1.5, 0.5, 0.5,
-4.722781, -0.2408592, -6.739988, 0, 1.5, 0.5, 0.5
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
-4.722781, -4.852707, 0.01152325, 0, -0.5, 0.5, 0.5,
-4.722781, -4.852707, 0.01152325, 1, -0.5, 0.5, 0.5,
-4.722781, -4.852707, 0.01152325, 1, 1.5, 0.5, 0.5,
-4.722781, -4.852707, 0.01152325, 0, 1.5, 0.5, 0.5
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
-3, -3.788434, -5.181947,
3, -3.788434, -5.181947,
-3, -3.788434, -5.181947,
-3, -3.965813, -5.44162,
-2, -3.788434, -5.181947,
-2, -3.965813, -5.44162,
-1, -3.788434, -5.181947,
-1, -3.965813, -5.44162,
0, -3.788434, -5.181947,
0, -3.965813, -5.44162,
1, -3.788434, -5.181947,
1, -3.965813, -5.44162,
2, -3.788434, -5.181947,
2, -3.965813, -5.44162,
3, -3.788434, -5.181947,
3, -3.965813, -5.44162
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
-3, -4.32057, -5.960967, 0, -0.5, 0.5, 0.5,
-3, -4.32057, -5.960967, 1, -0.5, 0.5, 0.5,
-3, -4.32057, -5.960967, 1, 1.5, 0.5, 0.5,
-3, -4.32057, -5.960967, 0, 1.5, 0.5, 0.5,
-2, -4.32057, -5.960967, 0, -0.5, 0.5, 0.5,
-2, -4.32057, -5.960967, 1, -0.5, 0.5, 0.5,
-2, -4.32057, -5.960967, 1, 1.5, 0.5, 0.5,
-2, -4.32057, -5.960967, 0, 1.5, 0.5, 0.5,
-1, -4.32057, -5.960967, 0, -0.5, 0.5, 0.5,
-1, -4.32057, -5.960967, 1, -0.5, 0.5, 0.5,
-1, -4.32057, -5.960967, 1, 1.5, 0.5, 0.5,
-1, -4.32057, -5.960967, 0, 1.5, 0.5, 0.5,
0, -4.32057, -5.960967, 0, -0.5, 0.5, 0.5,
0, -4.32057, -5.960967, 1, -0.5, 0.5, 0.5,
0, -4.32057, -5.960967, 1, 1.5, 0.5, 0.5,
0, -4.32057, -5.960967, 0, 1.5, 0.5, 0.5,
1, -4.32057, -5.960967, 0, -0.5, 0.5, 0.5,
1, -4.32057, -5.960967, 1, -0.5, 0.5, 0.5,
1, -4.32057, -5.960967, 1, 1.5, 0.5, 0.5,
1, -4.32057, -5.960967, 0, 1.5, 0.5, 0.5,
2, -4.32057, -5.960967, 0, -0.5, 0.5, 0.5,
2, -4.32057, -5.960967, 1, -0.5, 0.5, 0.5,
2, -4.32057, -5.960967, 1, 1.5, 0.5, 0.5,
2, -4.32057, -5.960967, 0, 1.5, 0.5, 0.5,
3, -4.32057, -5.960967, 0, -0.5, 0.5, 0.5,
3, -4.32057, -5.960967, 1, -0.5, 0.5, 0.5,
3, -4.32057, -5.960967, 1, 1.5, 0.5, 0.5,
3, -4.32057, -5.960967, 0, 1.5, 0.5, 0.5
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
-3.679425, -3, -5.181947,
-3.679425, 3, -5.181947,
-3.679425, -3, -5.181947,
-3.853318, -3, -5.44162,
-3.679425, -2, -5.181947,
-3.853318, -2, -5.44162,
-3.679425, -1, -5.181947,
-3.853318, -1, -5.44162,
-3.679425, 0, -5.181947,
-3.853318, 0, -5.44162,
-3.679425, 1, -5.181947,
-3.853318, 1, -5.44162,
-3.679425, 2, -5.181947,
-3.853318, 2, -5.44162,
-3.679425, 3, -5.181947,
-3.853318, 3, -5.44162
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
-4.201103, -3, -5.960967, 0, -0.5, 0.5, 0.5,
-4.201103, -3, -5.960967, 1, -0.5, 0.5, 0.5,
-4.201103, -3, -5.960967, 1, 1.5, 0.5, 0.5,
-4.201103, -3, -5.960967, 0, 1.5, 0.5, 0.5,
-4.201103, -2, -5.960967, 0, -0.5, 0.5, 0.5,
-4.201103, -2, -5.960967, 1, -0.5, 0.5, 0.5,
-4.201103, -2, -5.960967, 1, 1.5, 0.5, 0.5,
-4.201103, -2, -5.960967, 0, 1.5, 0.5, 0.5,
-4.201103, -1, -5.960967, 0, -0.5, 0.5, 0.5,
-4.201103, -1, -5.960967, 1, -0.5, 0.5, 0.5,
-4.201103, -1, -5.960967, 1, 1.5, 0.5, 0.5,
-4.201103, -1, -5.960967, 0, 1.5, 0.5, 0.5,
-4.201103, 0, -5.960967, 0, -0.5, 0.5, 0.5,
-4.201103, 0, -5.960967, 1, -0.5, 0.5, 0.5,
-4.201103, 0, -5.960967, 1, 1.5, 0.5, 0.5,
-4.201103, 0, -5.960967, 0, 1.5, 0.5, 0.5,
-4.201103, 1, -5.960967, 0, -0.5, 0.5, 0.5,
-4.201103, 1, -5.960967, 1, -0.5, 0.5, 0.5,
-4.201103, 1, -5.960967, 1, 1.5, 0.5, 0.5,
-4.201103, 1, -5.960967, 0, 1.5, 0.5, 0.5,
-4.201103, 2, -5.960967, 0, -0.5, 0.5, 0.5,
-4.201103, 2, -5.960967, 1, -0.5, 0.5, 0.5,
-4.201103, 2, -5.960967, 1, 1.5, 0.5, 0.5,
-4.201103, 2, -5.960967, 0, 1.5, 0.5, 0.5,
-4.201103, 3, -5.960967, 0, -0.5, 0.5, 0.5,
-4.201103, 3, -5.960967, 1, -0.5, 0.5, 0.5,
-4.201103, 3, -5.960967, 1, 1.5, 0.5, 0.5,
-4.201103, 3, -5.960967, 0, 1.5, 0.5, 0.5
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
-3.679425, -3.788434, -4,
-3.679425, -3.788434, 4,
-3.679425, -3.788434, -4,
-3.853318, -3.965813, -4,
-3.679425, -3.788434, -2,
-3.853318, -3.965813, -2,
-3.679425, -3.788434, 0,
-3.853318, -3.965813, 0,
-3.679425, -3.788434, 2,
-3.853318, -3.965813, 2,
-3.679425, -3.788434, 4,
-3.853318, -3.965813, 4
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
-4.201103, -4.32057, -4, 0, -0.5, 0.5, 0.5,
-4.201103, -4.32057, -4, 1, -0.5, 0.5, 0.5,
-4.201103, -4.32057, -4, 1, 1.5, 0.5, 0.5,
-4.201103, -4.32057, -4, 0, 1.5, 0.5, 0.5,
-4.201103, -4.32057, -2, 0, -0.5, 0.5, 0.5,
-4.201103, -4.32057, -2, 1, -0.5, 0.5, 0.5,
-4.201103, -4.32057, -2, 1, 1.5, 0.5, 0.5,
-4.201103, -4.32057, -2, 0, 1.5, 0.5, 0.5,
-4.201103, -4.32057, 0, 0, -0.5, 0.5, 0.5,
-4.201103, -4.32057, 0, 1, -0.5, 0.5, 0.5,
-4.201103, -4.32057, 0, 1, 1.5, 0.5, 0.5,
-4.201103, -4.32057, 0, 0, 1.5, 0.5, 0.5,
-4.201103, -4.32057, 2, 0, -0.5, 0.5, 0.5,
-4.201103, -4.32057, 2, 1, -0.5, 0.5, 0.5,
-4.201103, -4.32057, 2, 1, 1.5, 0.5, 0.5,
-4.201103, -4.32057, 2, 0, 1.5, 0.5, 0.5,
-4.201103, -4.32057, 4, 0, -0.5, 0.5, 0.5,
-4.201103, -4.32057, 4, 1, -0.5, 0.5, 0.5,
-4.201103, -4.32057, 4, 1, 1.5, 0.5, 0.5,
-4.201103, -4.32057, 4, 0, 1.5, 0.5, 0.5
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
-3.679425, -3.788434, -5.181947,
-3.679425, 3.306716, -5.181947,
-3.679425, -3.788434, 5.204993,
-3.679425, 3.306716, 5.204993,
-3.679425, -3.788434, -5.181947,
-3.679425, -3.788434, 5.204993,
-3.679425, 3.306716, -5.181947,
-3.679425, 3.306716, 5.204993,
-3.679425, -3.788434, -5.181947,
3.276279, -3.788434, -5.181947,
-3.679425, -3.788434, 5.204993,
3.276279, -3.788434, 5.204993,
-3.679425, 3.306716, -5.181947,
3.276279, 3.306716, -5.181947,
-3.679425, 3.306716, 5.204993,
3.276279, 3.306716, 5.204993,
3.276279, -3.788434, -5.181947,
3.276279, 3.306716, -5.181947,
3.276279, -3.788434, 5.204993,
3.276279, 3.306716, 5.204993,
3.276279, -3.788434, -5.181947,
3.276279, -3.788434, 5.204993,
3.276279, 3.306716, -5.181947,
3.276279, 3.306716, 5.204993
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
var radius = 7.67543;
var distance = 34.14886;
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
mvMatrix.translate( 0.2015733, 0.2408592, -0.01152325 );
mvMatrix.scale( 1.193096, 1.169648, 0.7989673 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.14886);
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
metobenzuron<-read.table("metobenzuron.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-metobenzuron$V2
```

```
## Error in eval(expr, envir, enclos): object 'metobenzuron' not found
```

```r
y<-metobenzuron$V3
```

```
## Error in eval(expr, envir, enclos): object 'metobenzuron' not found
```

```r
z<-metobenzuron$V4
```

```
## Error in eval(expr, envir, enclos): object 'metobenzuron' not found
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
-3.578129, -0.1092393, -0.9761984, 0, 0, 1, 1, 1,
-3.082191, 0.04662735, -2.315067, 1, 0, 0, 1, 1,
-2.849588, 1.611921, -0.2266751, 1, 0, 0, 1, 1,
-2.718081, -0.4819223, -1.600326, 1, 0, 0, 1, 1,
-2.604521, 1.229387, -2.081477, 1, 0, 0, 1, 1,
-2.538177, -0.2789199, -0.4200951, 1, 0, 0, 1, 1,
-2.533065, 0.04192165, -3.920116, 0, 0, 0, 1, 1,
-2.479771, -0.1393487, -1.615774, 0, 0, 0, 1, 1,
-2.45182, -1.029432, -2.91109, 0, 0, 0, 1, 1,
-2.405193, 0.5528619, -1.429366, 0, 0, 0, 1, 1,
-2.228786, -0.9610872, -2.324934, 0, 0, 0, 1, 1,
-2.206, -1.553098, -2.575277, 0, 0, 0, 1, 1,
-2.177212, 0.3691634, -0.3636784, 0, 0, 0, 1, 1,
-2.155367, 1.139478, -0.9127656, 1, 1, 1, 1, 1,
-2.118644, 0.4753948, -0.7769109, 1, 1, 1, 1, 1,
-2.112067, -0.07489881, -2.347997, 1, 1, 1, 1, 1,
-2.095644, -0.3988957, -1.21069, 1, 1, 1, 1, 1,
-2.079958, 0.1783979, 0.005466773, 1, 1, 1, 1, 1,
-2.059536, 0.5993824, 0.7762769, 1, 1, 1, 1, 1,
-2.042137, 0.732371, -2.606206, 1, 1, 1, 1, 1,
-2.009467, 0.910194, -0.3784317, 1, 1, 1, 1, 1,
-1.97334, 2.353596, -0.5075206, 1, 1, 1, 1, 1,
-1.972407, -0.8872607, -2.098872, 1, 1, 1, 1, 1,
-1.9655, 0.4596902, -2.324814, 1, 1, 1, 1, 1,
-1.956776, 1.3869, -1.718765, 1, 1, 1, 1, 1,
-1.937937, 0.02406198, -1.075564, 1, 1, 1, 1, 1,
-1.935777, -1.407004, -2.41486, 1, 1, 1, 1, 1,
-1.933792, -0.1216914, -2.454597, 1, 1, 1, 1, 1,
-1.933561, -0.5192503, -2.226253, 0, 0, 1, 1, 1,
-1.930509, 0.6325337, -1.625674, 1, 0, 0, 1, 1,
-1.926741, 0.008961345, -0.9945865, 1, 0, 0, 1, 1,
-1.91852, -2.150884, -2.529871, 1, 0, 0, 1, 1,
-1.892867, 1.084082, 0.06270396, 1, 0, 0, 1, 1,
-1.887747, 0.367931, -2.869431, 1, 0, 0, 1, 1,
-1.870778, -0.2654981, -4.019618, 0, 0, 0, 1, 1,
-1.866917, 0.6425131, -0.1398505, 0, 0, 0, 1, 1,
-1.858996, 0.7442979, -1.280638, 0, 0, 0, 1, 1,
-1.857238, -1.477059, -1.970563, 0, 0, 0, 1, 1,
-1.854581, -0.3090627, -1.994678, 0, 0, 0, 1, 1,
-1.827059, -0.6738719, -2.308969, 0, 0, 0, 1, 1,
-1.825545, -0.9722138, -0.2991754, 0, 0, 0, 1, 1,
-1.818044, -1.774613, -2.466243, 1, 1, 1, 1, 1,
-1.815262, 0.2980204, -1.662361, 1, 1, 1, 1, 1,
-1.793187, -0.4487403, -0.7498878, 1, 1, 1, 1, 1,
-1.782547, 0.9850873, -1.593956, 1, 1, 1, 1, 1,
-1.765814, 0.4243822, -0.03182917, 1, 1, 1, 1, 1,
-1.722856, -2.72071, -2.914339, 1, 1, 1, 1, 1,
-1.722291, -0.333845, -1.723479, 1, 1, 1, 1, 1,
-1.718784, 1.602863, -0.2089585, 1, 1, 1, 1, 1,
-1.713685, 0.3923426, -1.459812, 1, 1, 1, 1, 1,
-1.69711, 1.109115, -0.4618383, 1, 1, 1, 1, 1,
-1.683831, 0.4928739, 0.4140039, 1, 1, 1, 1, 1,
-1.656781, -0.9648757, -2.588801, 1, 1, 1, 1, 1,
-1.656388, -0.9923108, 0.1158575, 1, 1, 1, 1, 1,
-1.607897, 0.659077, -0.9434316, 1, 1, 1, 1, 1,
-1.604653, 0.06093534, -4.092204, 1, 1, 1, 1, 1,
-1.600531, 0.7794744, -1.519831, 0, 0, 1, 1, 1,
-1.599769, 0.01268881, -2.126978, 1, 0, 0, 1, 1,
-1.59667, 0.9223179, 1.429984, 1, 0, 0, 1, 1,
-1.59341, 0.5185181, -0.4976898, 1, 0, 0, 1, 1,
-1.577858, 2.450887, -0.5841032, 1, 0, 0, 1, 1,
-1.577252, 0.3639991, -1.559532, 1, 0, 0, 1, 1,
-1.57503, -0.08214304, -2.185648, 0, 0, 0, 1, 1,
-1.575013, 0.2393854, -1.507027, 0, 0, 0, 1, 1,
-1.57089, 1.33298, -1.427176, 0, 0, 0, 1, 1,
-1.559492, 0.5744756, -1.772658, 0, 0, 0, 1, 1,
-1.551411, 1.289908, -1.137023, 0, 0, 0, 1, 1,
-1.521653, -0.4076588, -1.688944, 0, 0, 0, 1, 1,
-1.515409, 0.9162483, -1.050527, 0, 0, 0, 1, 1,
-1.511188, -0.006458258, -0.04021344, 1, 1, 1, 1, 1,
-1.48861, 1.07978, -0.08515323, 1, 1, 1, 1, 1,
-1.483456, -0.4498028, -1.966756, 1, 1, 1, 1, 1,
-1.482957, -0.8092564, -1.347987, 1, 1, 1, 1, 1,
-1.482333, 0.1667022, -3.579688, 1, 1, 1, 1, 1,
-1.476653, -2.250183, -3.561315, 1, 1, 1, 1, 1,
-1.463936, 1.131118, -0.4630242, 1, 1, 1, 1, 1,
-1.452647, 0.4690125, 0.2240794, 1, 1, 1, 1, 1,
-1.45053, 0.3267891, -1.551363, 1, 1, 1, 1, 1,
-1.44329, 0.2750975, -0.2970123, 1, 1, 1, 1, 1,
-1.429089, -0.2924875, -0.3687924, 1, 1, 1, 1, 1,
-1.427743, -0.06857421, -2.191565, 1, 1, 1, 1, 1,
-1.424371, -0.6793038, -1.819937, 1, 1, 1, 1, 1,
-1.420633, 0.08866148, -2.122839, 1, 1, 1, 1, 1,
-1.419808, -0.09208003, -3.375068, 1, 1, 1, 1, 1,
-1.418115, -0.3284416, -2.036996, 0, 0, 1, 1, 1,
-1.41446, 0.9725871, -1.053126, 1, 0, 0, 1, 1,
-1.411837, 0.6743755, -2.009007, 1, 0, 0, 1, 1,
-1.408781, -0.6094049, -2.53224, 1, 0, 0, 1, 1,
-1.402501, 1.614135, -0.8881865, 1, 0, 0, 1, 1,
-1.39246, -0.4201721, -1.933776, 1, 0, 0, 1, 1,
-1.384456, -1.441651, -2.553295, 0, 0, 0, 1, 1,
-1.370061, 0.3240949, -2.60063, 0, 0, 0, 1, 1,
-1.368648, 0.5650744, 0.404393, 0, 0, 0, 1, 1,
-1.356794, 2.37938, -0.6815684, 0, 0, 0, 1, 1,
-1.34309, -0.008075435, -0.4552403, 0, 0, 0, 1, 1,
-1.342869, 1.03194, -0.9253433, 0, 0, 0, 1, 1,
-1.333732, -0.4374552, -1.977934, 0, 0, 0, 1, 1,
-1.32566, -0.2447506, -1.713867, 1, 1, 1, 1, 1,
-1.323674, 0.001301317, -2.282457, 1, 1, 1, 1, 1,
-1.314004, 0.3876378, -1.979774, 1, 1, 1, 1, 1,
-1.313246, -1.265936, -2.359587, 1, 1, 1, 1, 1,
-1.311369, -0.9449475, -3.910213, 1, 1, 1, 1, 1,
-1.308236, 0.1192214, -2.314356, 1, 1, 1, 1, 1,
-1.300034, 0.7260339, -1.333459, 1, 1, 1, 1, 1,
-1.297903, -0.4578715, -2.234397, 1, 1, 1, 1, 1,
-1.295342, 0.5306154, 1.177941, 1, 1, 1, 1, 1,
-1.295168, -1.346101, -2.504372, 1, 1, 1, 1, 1,
-1.29421, 0.7096201, -1.262568, 1, 1, 1, 1, 1,
-1.289137, 1.115611, -1.542136, 1, 1, 1, 1, 1,
-1.283887, 1.629024, -0.2412576, 1, 1, 1, 1, 1,
-1.27652, 0.7242105, -1.386962, 1, 1, 1, 1, 1,
-1.26888, -0.7589346, -0.9140618, 1, 1, 1, 1, 1,
-1.263966, -0.05475735, -2.116248, 0, 0, 1, 1, 1,
-1.249534, 0.4421622, -1.412017, 1, 0, 0, 1, 1,
-1.246326, -0.2204036, -2.725237, 1, 0, 0, 1, 1,
-1.243841, 1.169532, -0.7143355, 1, 0, 0, 1, 1,
-1.236854, -0.6077745, -1.228046, 1, 0, 0, 1, 1,
-1.227052, -1.171745, -1.599138, 1, 0, 0, 1, 1,
-1.215141, -0.5502211, -3.622411, 0, 0, 0, 1, 1,
-1.214912, -0.5929849, -1.223051, 0, 0, 0, 1, 1,
-1.213419, -1.070744, -0.09701367, 0, 0, 0, 1, 1,
-1.212788, -0.5239021, -2.05745, 0, 0, 0, 1, 1,
-1.211902, -0.8736566, -2.909571, 0, 0, 0, 1, 1,
-1.200969, -1.495386, -1.929561, 0, 0, 0, 1, 1,
-1.196872, -0.7177079, -2.746328, 0, 0, 0, 1, 1,
-1.193533, -0.7195951, -1.94432, 1, 1, 1, 1, 1,
-1.186742, 0.9607221, -0.7002321, 1, 1, 1, 1, 1,
-1.181887, -1.911543, -3.468868, 1, 1, 1, 1, 1,
-1.177715, -1.776152, -1.579525, 1, 1, 1, 1, 1,
-1.176577, 1.352823, -1.644819, 1, 1, 1, 1, 1,
-1.174503, 0.2287462, -0.3749985, 1, 1, 1, 1, 1,
-1.173586, 0.366053, -2.223893, 1, 1, 1, 1, 1,
-1.169235, 0.6075097, -0.0255056, 1, 1, 1, 1, 1,
-1.160556, -0.2255387, -0.9867408, 1, 1, 1, 1, 1,
-1.150157, -1.146571, -2.659853, 1, 1, 1, 1, 1,
-1.147165, -0.9797243, -3.541243, 1, 1, 1, 1, 1,
-1.14435, 0.1077877, -1.890101, 1, 1, 1, 1, 1,
-1.139071, -0.174488, -2.171005, 1, 1, 1, 1, 1,
-1.135827, -0.101864, -1.270167, 1, 1, 1, 1, 1,
-1.133886, -0.5450847, -2.022686, 1, 1, 1, 1, 1,
-1.129268, 1.103401, -1.52678, 0, 0, 1, 1, 1,
-1.121727, -0.8964461, -3.054618, 1, 0, 0, 1, 1,
-1.116008, -0.5659216, -1.310744, 1, 0, 0, 1, 1,
-1.114568, 0.366098, -1.354827, 1, 0, 0, 1, 1,
-1.107764, 0.2398727, 0.3297822, 1, 0, 0, 1, 1,
-1.103753, -0.3913094, -3.272067, 1, 0, 0, 1, 1,
-1.092646, -1.012055, -2.897369, 0, 0, 0, 1, 1,
-1.085624, 0.5017842, 0.3437372, 0, 0, 0, 1, 1,
-1.08438, -0.9702429, -3.254468, 0, 0, 0, 1, 1,
-1.076866, 1.92347, -0.6006517, 0, 0, 0, 1, 1,
-1.075637, 1.664549, -1.188808, 0, 0, 0, 1, 1,
-1.075248, 0.4143541, -0.9273025, 0, 0, 0, 1, 1,
-1.073188, 2.17091, 0.3288503, 0, 0, 0, 1, 1,
-1.06915, 1.723806, -2.010335, 1, 1, 1, 1, 1,
-1.065678, -0.04406646, -3.976365, 1, 1, 1, 1, 1,
-1.062238, -0.07676198, -0.64792, 1, 1, 1, 1, 1,
-1.060496, -0.4751592, -1.379952, 1, 1, 1, 1, 1,
-1.059413, -0.7463011, -2.173131, 1, 1, 1, 1, 1,
-1.059157, 0.9464496, -2.083801, 1, 1, 1, 1, 1,
-1.053468, -2.646755, -3.51477, 1, 1, 1, 1, 1,
-1.049613, -1.073894, -2.174745, 1, 1, 1, 1, 1,
-1.044964, -1.390423, -3.142718, 1, 1, 1, 1, 1,
-1.043515, 0.2517841, -1.485131, 1, 1, 1, 1, 1,
-1.026298, 0.149191, -1.835362, 1, 1, 1, 1, 1,
-1.022362, 1.151637, 0.05007689, 1, 1, 1, 1, 1,
-1.019431, 0.7658689, -0.6692332, 1, 1, 1, 1, 1,
-1.012319, 0.9891979, 0.15669, 1, 1, 1, 1, 1,
-1.003675, 0.6586856, -1.127605, 1, 1, 1, 1, 1,
-1.001851, -0.9597183, -1.307561, 0, 0, 1, 1, 1,
-1.001489, -1.552718, -1.795425, 1, 0, 0, 1, 1,
-1.001264, -1.69968, -4.69697, 1, 0, 0, 1, 1,
-0.9989493, 2.155701, 0.4465444, 1, 0, 0, 1, 1,
-0.997082, -0.4556342, -3.571809, 1, 0, 0, 1, 1,
-0.9909005, -0.2527161, -3.046968, 1, 0, 0, 1, 1,
-0.9856357, 0.9262782, 1.088609, 0, 0, 0, 1, 1,
-0.9855979, 0.8321461, -0.1419775, 0, 0, 0, 1, 1,
-0.9839596, -0.358549, -1.809969, 0, 0, 0, 1, 1,
-0.9836113, -0.1215986, -1.158877, 0, 0, 0, 1, 1,
-0.9833996, -0.9845823, -3.000394, 0, 0, 0, 1, 1,
-0.9823862, 0.2574767, -2.495357, 0, 0, 0, 1, 1,
-0.9799153, -1.505096, -0.291012, 0, 0, 0, 1, 1,
-0.9771307, -0.2417835, -1.986431, 1, 1, 1, 1, 1,
-0.9738263, -0.8478943, -1.326992, 1, 1, 1, 1, 1,
-0.9652236, 0.1763187, -2.054998, 1, 1, 1, 1, 1,
-0.959844, 1.031076, -1.579915, 1, 1, 1, 1, 1,
-0.9590862, -1.447905, -0.3471162, 1, 1, 1, 1, 1,
-0.9548244, 1.979529, -2.674637, 1, 1, 1, 1, 1,
-0.9361895, -0.4350394, -2.376968, 1, 1, 1, 1, 1,
-0.9359801, -0.8616184, -3.747938, 1, 1, 1, 1, 1,
-0.929248, 0.8051549, -0.9126629, 1, 1, 1, 1, 1,
-0.9284981, -0.1424824, -0.3380058, 1, 1, 1, 1, 1,
-0.9245303, 1.400086, -1.74033, 1, 1, 1, 1, 1,
-0.920061, -2.117349, -3.636998, 1, 1, 1, 1, 1,
-0.9191923, -0.1351008, -1.590371, 1, 1, 1, 1, 1,
-0.9177935, -1.536624, -1.979625, 1, 1, 1, 1, 1,
-0.9171454, 0.6542888, -0.4345608, 1, 1, 1, 1, 1,
-0.9157351, 0.2232053, -1.247193, 0, 0, 1, 1, 1,
-0.900099, 0.1568259, -2.674275, 1, 0, 0, 1, 1,
-0.8969908, 1.053901, 0.1572182, 1, 0, 0, 1, 1,
-0.8946128, 2.098233, -0.3449655, 1, 0, 0, 1, 1,
-0.8856912, 0.4207686, -2.686007, 1, 0, 0, 1, 1,
-0.8806683, -1.491514, -2.155453, 1, 0, 0, 1, 1,
-0.8801663, -1.411984, -2.521966, 0, 0, 0, 1, 1,
-0.8791097, 0.2798304, -0.07266847, 0, 0, 0, 1, 1,
-0.8705108, 0.5840434, -2.638586, 0, 0, 0, 1, 1,
-0.8574373, 0.7474247, -0.6993361, 0, 0, 0, 1, 1,
-0.8515879, 1.084646, -0.553818, 0, 0, 0, 1, 1,
-0.8497707, -0.8547117, -3.812635, 0, 0, 0, 1, 1,
-0.8425488, -0.4939056, -2.498806, 0, 0, 0, 1, 1,
-0.8351591, 0.6372172, -1.462727, 1, 1, 1, 1, 1,
-0.8315757, 0.9276547, -0.1529979, 1, 1, 1, 1, 1,
-0.831079, -0.9892113, -1.407713, 1, 1, 1, 1, 1,
-0.8303453, -0.2538823, -2.4676, 1, 1, 1, 1, 1,
-0.8302166, 0.1592564, -0.8793349, 1, 1, 1, 1, 1,
-0.8301366, 0.2691619, -0.9748611, 1, 1, 1, 1, 1,
-0.8292978, 1.389004, -1.408383, 1, 1, 1, 1, 1,
-0.8275002, -0.7361555, -2.161419, 1, 1, 1, 1, 1,
-0.8254091, -1.517108, -2.711033, 1, 1, 1, 1, 1,
-0.8224698, -0.2252746, 0.118931, 1, 1, 1, 1, 1,
-0.8166127, -0.1759446, -0.872502, 1, 1, 1, 1, 1,
-0.8152505, 1.377942, 0.3271347, 1, 1, 1, 1, 1,
-0.8068238, 0.1882536, -0.8765175, 1, 1, 1, 1, 1,
-0.806232, -1.24939, -2.489932, 1, 1, 1, 1, 1,
-0.8046083, 0.93209, 0.3905067, 1, 1, 1, 1, 1,
-0.8042752, -0.9810482, -3.010417, 0, 0, 1, 1, 1,
-0.7980477, -0.04626212, -0.1782403, 1, 0, 0, 1, 1,
-0.7964613, -1.455018, -1.807802, 1, 0, 0, 1, 1,
-0.796043, -0.2361312, -1.796959, 1, 0, 0, 1, 1,
-0.7958258, 2.255519, -0.5470421, 1, 0, 0, 1, 1,
-0.7953932, 1.184575, -1.205823, 1, 0, 0, 1, 1,
-0.7906183, 1.173028, -2.69361, 0, 0, 0, 1, 1,
-0.7899585, -0.6598629, -0.9192237, 0, 0, 0, 1, 1,
-0.7882833, 1.664255, -0.4622931, 0, 0, 0, 1, 1,
-0.7852408, -0.1945341, -3.184823, 0, 0, 0, 1, 1,
-0.7798805, -0.8190728, -2.59795, 0, 0, 0, 1, 1,
-0.7787471, -0.9449423, -2.924778, 0, 0, 0, 1, 1,
-0.7690808, -0.0226741, -2.950268, 0, 0, 0, 1, 1,
-0.768018, -0.7676252, -0.5231283, 1, 1, 1, 1, 1,
-0.766707, -1.084655, -1.834193, 1, 1, 1, 1, 1,
-0.765502, 3.1539, -1.301428, 1, 1, 1, 1, 1,
-0.7610837, -0.4829275, -1.638797, 1, 1, 1, 1, 1,
-0.7601353, 0.2099889, -1.391521, 1, 1, 1, 1, 1,
-0.7573966, 0.5052824, -1.058683, 1, 1, 1, 1, 1,
-0.7573614, -0.6488335, -2.225329, 1, 1, 1, 1, 1,
-0.7544825, -0.08708456, -3.319496, 1, 1, 1, 1, 1,
-0.7512158, -0.743575, -2.827328, 1, 1, 1, 1, 1,
-0.7485791, -1.869159, -3.083891, 1, 1, 1, 1, 1,
-0.7447851, 1.107882, -0.3440478, 1, 1, 1, 1, 1,
-0.7432123, -1.635479, -3.464622, 1, 1, 1, 1, 1,
-0.7430066, 0.1358262, -0.5174533, 1, 1, 1, 1, 1,
-0.7419655, -1.204348, -3.464647, 1, 1, 1, 1, 1,
-0.7367203, 1.107555, -0.4726069, 1, 1, 1, 1, 1,
-0.7257222, -0.3532716, -1.407971, 0, 0, 1, 1, 1,
-0.7243996, -0.4348369, -4.329195, 1, 0, 0, 1, 1,
-0.7185114, -0.8510124, -3.701666, 1, 0, 0, 1, 1,
-0.7173918, 1.108946, -0.03868186, 1, 0, 0, 1, 1,
-0.7163253, 1.690568, -1.334158, 1, 0, 0, 1, 1,
-0.7126604, -0.8431219, -2.730253, 1, 0, 0, 1, 1,
-0.7093124, -0.1944566, -3.151591, 0, 0, 0, 1, 1,
-0.7086907, -0.1229359, -0.4350187, 0, 0, 0, 1, 1,
-0.7061132, -1.183114, -2.810928, 0, 0, 0, 1, 1,
-0.7004117, -0.4820028, -4.619335, 0, 0, 0, 1, 1,
-0.6983849, -1.163095, -2.345643, 0, 0, 0, 1, 1,
-0.6937078, -0.8623111, -1.529847, 0, 0, 0, 1, 1,
-0.688009, 0.004858355, -2.834806, 0, 0, 0, 1, 1,
-0.6779734, -0.7133328, -2.628109, 1, 1, 1, 1, 1,
-0.6776925, 1.73041, -0.1089843, 1, 1, 1, 1, 1,
-0.675158, -0.8020723, -2.788883, 1, 1, 1, 1, 1,
-0.6738325, -0.588376, -2.525803, 1, 1, 1, 1, 1,
-0.6693565, 1.738588, 0.536397, 1, 1, 1, 1, 1,
-0.6649795, 0.8479879, -0.5722216, 1, 1, 1, 1, 1,
-0.6645086, -1.319925, -1.575933, 1, 1, 1, 1, 1,
-0.6591876, -0.5260572, -2.018476, 1, 1, 1, 1, 1,
-0.6578138, -1.016254, -1.690035, 1, 1, 1, 1, 1,
-0.6568625, 1.115672, -2.904195, 1, 1, 1, 1, 1,
-0.6559632, 0.05729083, -1.156235, 1, 1, 1, 1, 1,
-0.6472939, -1.884723, -2.069733, 1, 1, 1, 1, 1,
-0.6469319, -0.7783979, -3.130414, 1, 1, 1, 1, 1,
-0.6447298, -0.6058046, -4.068953, 1, 1, 1, 1, 1,
-0.6418614, -0.01110656, -3.135305, 1, 1, 1, 1, 1,
-0.6411915, 3.203388, -0.6108844, 0, 0, 1, 1, 1,
-0.6401043, -0.6870358, -1.672164, 1, 0, 0, 1, 1,
-0.625969, -1.520205, -5.030681, 1, 0, 0, 1, 1,
-0.6252494, -0.7682813, -2.312941, 1, 0, 0, 1, 1,
-0.6202673, 0.5417662, -2.047727, 1, 0, 0, 1, 1,
-0.6182783, -1.051787, -2.473688, 1, 0, 0, 1, 1,
-0.610804, -0.9733676, -2.778172, 0, 0, 0, 1, 1,
-0.6096229, -1.005603, -2.945253, 0, 0, 0, 1, 1,
-0.6078024, -0.1436279, -1.061435, 0, 0, 0, 1, 1,
-0.6056966, -0.6657232, -2.184433, 0, 0, 0, 1, 1,
-0.6028764, 0.2762844, -0.4298247, 0, 0, 0, 1, 1,
-0.6023504, -0.4780472, -2.655093, 0, 0, 0, 1, 1,
-0.5952327, 0.2392804, -0.8213473, 0, 0, 0, 1, 1,
-0.5907247, -0.2409169, -4.57134, 1, 1, 1, 1, 1,
-0.5774912, 0.8181261, -0.9974407, 1, 1, 1, 1, 1,
-0.5739316, -0.9435062, -0.3740467, 1, 1, 1, 1, 1,
-0.5734022, 0.1869173, 0.09050091, 1, 1, 1, 1, 1,
-0.5705885, -0.4908179, -2.377112, 1, 1, 1, 1, 1,
-0.569886, -1.467008, -3.399723, 1, 1, 1, 1, 1,
-0.5599967, 0.8586107, -0.04703925, 1, 1, 1, 1, 1,
-0.5551224, -0.2186318, -1.637171, 1, 1, 1, 1, 1,
-0.5437026, 0.4439662, -3.037013, 1, 1, 1, 1, 1,
-0.538191, 0.08564805, -0.7298719, 1, 1, 1, 1, 1,
-0.5353341, 0.05523332, -1.911474, 1, 1, 1, 1, 1,
-0.5333002, 0.4396777, -1.871412, 1, 1, 1, 1, 1,
-0.5320353, -0.4749874, -0.999306, 1, 1, 1, 1, 1,
-0.5314007, -0.2849468, -1.698316, 1, 1, 1, 1, 1,
-0.529722, 0.3842598, -0.9464086, 1, 1, 1, 1, 1,
-0.5297214, -0.2879694, -3.407716, 0, 0, 1, 1, 1,
-0.5281813, -0.05097418, -0.50732, 1, 0, 0, 1, 1,
-0.5232607, 0.9937838, 0.8266907, 1, 0, 0, 1, 1,
-0.5211765, 0.1773529, -1.528152, 1, 0, 0, 1, 1,
-0.5167407, 0.006152354, 0.151414, 1, 0, 0, 1, 1,
-0.516619, 0.7886238, -0.8950341, 1, 0, 0, 1, 1,
-0.515167, 0.5110644, -1.642057, 0, 0, 0, 1, 1,
-0.5126773, -0.4133181, -1.404681, 0, 0, 0, 1, 1,
-0.5084745, -1.102499, -1.203145, 0, 0, 0, 1, 1,
-0.507629, -0.1675226, -1.530153, 0, 0, 0, 1, 1,
-0.5066656, -0.2490477, -1.529989, 0, 0, 0, 1, 1,
-0.506202, 0.2167341, -1.568018, 0, 0, 0, 1, 1,
-0.5046818, 1.351213, -1.526493, 0, 0, 0, 1, 1,
-0.5013531, 0.3410125, -2.131257, 1, 1, 1, 1, 1,
-0.4961645, -1.143793, -2.474403, 1, 1, 1, 1, 1,
-0.4954723, 0.01798204, -2.461184, 1, 1, 1, 1, 1,
-0.4937723, -0.2614596, -0.9299183, 1, 1, 1, 1, 1,
-0.4912701, -0.6378541, -2.90091, 1, 1, 1, 1, 1,
-0.4905621, 1.486331, 1.464926, 1, 1, 1, 1, 1,
-0.487088, -0.4444299, -0.6198567, 1, 1, 1, 1, 1,
-0.4867789, 1.627362, -0.01430914, 1, 1, 1, 1, 1,
-0.4813516, 0.8787368, -2.063814, 1, 1, 1, 1, 1,
-0.4715084, -0.1357978, -2.414062, 1, 1, 1, 1, 1,
-0.4681216, -0.6096979, -2.645916, 1, 1, 1, 1, 1,
-0.4667454, 1.215466, -0.05151624, 1, 1, 1, 1, 1,
-0.4602197, -0.7156242, -0.2635995, 1, 1, 1, 1, 1,
-0.4542682, -0.002459277, -2.763087, 1, 1, 1, 1, 1,
-0.4524764, 1.042724, -1.273803, 1, 1, 1, 1, 1,
-0.4513787, -0.0275392, -1.56552, 0, 0, 1, 1, 1,
-0.4482316, 1.144903, 0.3535783, 1, 0, 0, 1, 1,
-0.4452246, 0.4562524, 0.485383, 1, 0, 0, 1, 1,
-0.4443392, 0.6605161, -0.3723944, 1, 0, 0, 1, 1,
-0.4399544, -1.272012, -4.569111, 1, 0, 0, 1, 1,
-0.4382983, -1.066223, -4.228281, 1, 0, 0, 1, 1,
-0.4329267, 1.331746, -0.2255621, 0, 0, 0, 1, 1,
-0.4268322, -0.3098973, -2.422448, 0, 0, 0, 1, 1,
-0.4264126, 0.2299365, -3.077787, 0, 0, 0, 1, 1,
-0.424823, -0.4995168, -3.937608, 0, 0, 0, 1, 1,
-0.4242789, -0.4441595, -1.106053, 0, 0, 0, 1, 1,
-0.4175699, 0.4191389, -1.568998, 0, 0, 0, 1, 1,
-0.4174852, 0.2088992, -2.14086, 0, 0, 0, 1, 1,
-0.4173854, -1.413697, -4.506878, 1, 1, 1, 1, 1,
-0.4153744, 0.1718175, -1.843501, 1, 1, 1, 1, 1,
-0.4127603, -0.4367937, -0.9778637, 1, 1, 1, 1, 1,
-0.412112, 0.243194, -0.6917575, 1, 1, 1, 1, 1,
-0.4095488, -0.9093761, -1.332983, 1, 1, 1, 1, 1,
-0.4034212, 0.3372367, -2.148544, 1, 1, 1, 1, 1,
-0.3978429, -0.6434219, -2.128733, 1, 1, 1, 1, 1,
-0.3965718, -2.040494, -2.763692, 1, 1, 1, 1, 1,
-0.3961795, 2.000475, -0.4131308, 1, 1, 1, 1, 1,
-0.3952537, 1.085643, -0.8764228, 1, 1, 1, 1, 1,
-0.3941919, -0.9084798, -3.21275, 1, 1, 1, 1, 1,
-0.3925114, -0.8017853, -3.432168, 1, 1, 1, 1, 1,
-0.3893646, -0.2211302, -1.512696, 1, 1, 1, 1, 1,
-0.3881826, 1.470896, -1.001212, 1, 1, 1, 1, 1,
-0.3878274, -0.5862724, -1.9528, 1, 1, 1, 1, 1,
-0.3856834, 0.5236619, 0.1450795, 0, 0, 1, 1, 1,
-0.3840262, 0.4828124, -1.035815, 1, 0, 0, 1, 1,
-0.3821299, 0.545728, 0.479365, 1, 0, 0, 1, 1,
-0.3789768, 0.05400856, -1.664512, 1, 0, 0, 1, 1,
-0.3786087, -1.538742, -3.199293, 1, 0, 0, 1, 1,
-0.3784922, 1.265914, 0.2400637, 1, 0, 0, 1, 1,
-0.3761308, -0.8387792, -1.133737, 0, 0, 0, 1, 1,
-0.3756655, -1.413086, -4.502638, 0, 0, 0, 1, 1,
-0.375036, -1.102039, -4.006841, 0, 0, 0, 1, 1,
-0.3730747, -0.1403702, -2.504038, 0, 0, 0, 1, 1,
-0.3729555, 0.4019693, -0.8821223, 0, 0, 0, 1, 1,
-0.3660743, -1.894561, -1.858868, 0, 0, 0, 1, 1,
-0.3642169, -1.065128, -3.440244, 0, 0, 0, 1, 1,
-0.3602844, -0.9493107, -2.93117, 1, 1, 1, 1, 1,
-0.3601896, 1.347507, -0.2525714, 1, 1, 1, 1, 1,
-0.3598672, 1.054452, 0.1750011, 1, 1, 1, 1, 1,
-0.356728, 0.4386082, -1.440787, 1, 1, 1, 1, 1,
-0.3555396, 0.8157727, 1.157219, 1, 1, 1, 1, 1,
-0.3461902, -0.8693323, -1.708771, 1, 1, 1, 1, 1,
-0.3447273, 1.981337, -1.105397, 1, 1, 1, 1, 1,
-0.3433809, -1.440173, -3.210001, 1, 1, 1, 1, 1,
-0.3400788, 0.1018526, -0.63414, 1, 1, 1, 1, 1,
-0.3372661, -0.2591449, -1.094923, 1, 1, 1, 1, 1,
-0.3337226, 0.4456705, -1.040233, 1, 1, 1, 1, 1,
-0.3280583, -0.5007274, -3.808176, 1, 1, 1, 1, 1,
-0.3280375, -1.35305, -3.952284, 1, 1, 1, 1, 1,
-0.3264539, 0.3128256, -1.378621, 1, 1, 1, 1, 1,
-0.3255835, 0.907683, 0.05538294, 1, 1, 1, 1, 1,
-0.3234925, -0.1504515, -1.788057, 0, 0, 1, 1, 1,
-0.3216673, 1.099739, 0.1847045, 1, 0, 0, 1, 1,
-0.3161247, 0.9479048, -0.6117402, 1, 0, 0, 1, 1,
-0.3154662, 0.2184012, 0.1929215, 1, 0, 0, 1, 1,
-0.3152598, -0.4247811, -2.944129, 1, 0, 0, 1, 1,
-0.3137944, 0.354163, 0.5234647, 1, 0, 0, 1, 1,
-0.3133585, 0.9977415, -0.6796269, 0, 0, 0, 1, 1,
-0.3133312, -1.164706, -2.309931, 0, 0, 0, 1, 1,
-0.3130384, -1.277952, -2.16035, 0, 0, 0, 1, 1,
-0.3044071, -0.6464638, -2.199865, 0, 0, 0, 1, 1,
-0.3027957, -0.9180493, -4.377629, 0, 0, 0, 1, 1,
-0.301431, -2.135264, -2.080243, 0, 0, 0, 1, 1,
-0.3002273, 2.062221, 0.7253431, 0, 0, 0, 1, 1,
-0.2967456, -0.6613224, -3.313775, 1, 1, 1, 1, 1,
-0.2930007, -0.8156406, -3.020245, 1, 1, 1, 1, 1,
-0.2896577, 0.4547322, -0.6343887, 1, 1, 1, 1, 1,
-0.2887383, 0.5943328, -1.740285, 1, 1, 1, 1, 1,
-0.2832997, -0.09124027, -1.061727, 1, 1, 1, 1, 1,
-0.2828172, -1.798231, -1.827226, 1, 1, 1, 1, 1,
-0.2772126, 1.277141, -0.7292103, 1, 1, 1, 1, 1,
-0.275947, 1.443562, -1.729063, 1, 1, 1, 1, 1,
-0.2649693, -0.1924344, -0.1691652, 1, 1, 1, 1, 1,
-0.2647272, -1.450731, -2.112577, 1, 1, 1, 1, 1,
-0.2616698, -0.7201861, -4.62463, 1, 1, 1, 1, 1,
-0.2612109, 1.389419, -0.8621525, 1, 1, 1, 1, 1,
-0.2572157, 1.975713, -0.1447617, 1, 1, 1, 1, 1,
-0.2563201, -1.003289, -3.249866, 1, 1, 1, 1, 1,
-0.2547047, -1.351905, -2.849555, 1, 1, 1, 1, 1,
-0.2541054, 0.2273206, -1.672711, 0, 0, 1, 1, 1,
-0.2506377, 0.1578359, -0.825462, 1, 0, 0, 1, 1,
-0.2502456, 0.5585579, 1.630491, 1, 0, 0, 1, 1,
-0.2490373, 0.8829514, 0.5548593, 1, 0, 0, 1, 1,
-0.2454436, 1.623408, 0.3762814, 1, 0, 0, 1, 1,
-0.2439789, -2.261605, -3.196066, 1, 0, 0, 1, 1,
-0.2424232, 0.83324, 1.05514, 0, 0, 0, 1, 1,
-0.2382722, 1.316904, -0.7005133, 0, 0, 0, 1, 1,
-0.2369959, -0.2404598, -1.804696, 0, 0, 0, 1, 1,
-0.2358443, 1.54251, -0.7612379, 0, 0, 0, 1, 1,
-0.2325274, 0.3609681, 0.3680972, 0, 0, 0, 1, 1,
-0.223406, -1.33024, -2.814044, 0, 0, 0, 1, 1,
-0.2219711, -3.130841, -3.417402, 0, 0, 0, 1, 1,
-0.2161564, 1.519574, -1.162467, 1, 1, 1, 1, 1,
-0.2143598, 0.9366612, -0.008057648, 1, 1, 1, 1, 1,
-0.2108008, 1.102221, 0.9293984, 1, 1, 1, 1, 1,
-0.2075336, -0.3812147, -3.302094, 1, 1, 1, 1, 1,
-0.203995, 0.7498125, 0.3460314, 1, 1, 1, 1, 1,
-0.2038104, 1.100763, 0.1674682, 1, 1, 1, 1, 1,
-0.1976343, 1.354571, -0.147229, 1, 1, 1, 1, 1,
-0.1966131, 1.920569, -0.8117939, 1, 1, 1, 1, 1,
-0.1913105, -1.143238, -3.012979, 1, 1, 1, 1, 1,
-0.1879353, 0.579634, -1.123387, 1, 1, 1, 1, 1,
-0.1875517, -1.390496, -3.504236, 1, 1, 1, 1, 1,
-0.1868533, 0.06206812, -2.608346, 1, 1, 1, 1, 1,
-0.1792478, 0.03304778, -2.743066, 1, 1, 1, 1, 1,
-0.1791541, -0.2710704, -2.886084, 1, 1, 1, 1, 1,
-0.1760642, -1.114435, -4.388964, 1, 1, 1, 1, 1,
-0.1753676, 0.5750813, -0.3666597, 0, 0, 1, 1, 1,
-0.1744645, 0.7436947, -1.017494, 1, 0, 0, 1, 1,
-0.1715752, -1.474418, -4.868083, 1, 0, 0, 1, 1,
-0.1683356, 0.5166303, 0.179409, 1, 0, 0, 1, 1,
-0.168021, -0.7233011, -1.299285, 1, 0, 0, 1, 1,
-0.1633284, -0.4133515, -3.383527, 1, 0, 0, 1, 1,
-0.1620031, -1.668165, -3.269114, 0, 0, 0, 1, 1,
-0.1587865, -0.9739236, -3.116536, 0, 0, 0, 1, 1,
-0.1574769, 1.185868, -1.642875, 0, 0, 0, 1, 1,
-0.1542573, -1.702356, -3.007453, 0, 0, 0, 1, 1,
-0.1523335, -0.5024726, -2.290872, 0, 0, 0, 1, 1,
-0.1514501, 1.549846, -0.3840939, 0, 0, 0, 1, 1,
-0.1467288, 0.1274067, -1.989097, 0, 0, 0, 1, 1,
-0.1440442, -1.766575, -1.270656, 1, 1, 1, 1, 1,
-0.1374262, -0.9845518, -1.597888, 1, 1, 1, 1, 1,
-0.1364871, -0.6033297, -3.01647, 1, 1, 1, 1, 1,
-0.1280474, 0.1385897, -0.9883031, 1, 1, 1, 1, 1,
-0.1261634, 1.187597, -2.564542, 1, 1, 1, 1, 1,
-0.1256467, 1.355383, 0.2727227, 1, 1, 1, 1, 1,
-0.1146045, -2.158712, -4.553084, 1, 1, 1, 1, 1,
-0.113958, 0.3477002, -1.472795, 1, 1, 1, 1, 1,
-0.1121083, -0.9152164, -2.575974, 1, 1, 1, 1, 1,
-0.1099716, 0.3957636, -0.3399537, 1, 1, 1, 1, 1,
-0.1088862, -0.199833, -4.157071, 1, 1, 1, 1, 1,
-0.1084926, -1.034744, -4.421169, 1, 1, 1, 1, 1,
-0.1077489, 0.8319215, -0.4441454, 1, 1, 1, 1, 1,
-0.1072963, -0.04953555, -1.44489, 1, 1, 1, 1, 1,
-0.1018184, -1.213281, -3.775748, 1, 1, 1, 1, 1,
-0.09868804, 1.675524, -0.3435053, 0, 0, 1, 1, 1,
-0.09142105, 0.6200511, 0.8870829, 1, 0, 0, 1, 1,
-0.08608277, 0.03401183, -1.021703, 1, 0, 0, 1, 1,
-0.08356014, 0.5942032, 1.12087, 1, 0, 0, 1, 1,
-0.07976158, -0.2528476, -2.938264, 1, 0, 0, 1, 1,
-0.07948055, -1.003769, -3.011652, 1, 0, 0, 1, 1,
-0.0774461, -0.4700274, -4.978124, 0, 0, 0, 1, 1,
-0.07601701, 1.525806, 0.4085116, 0, 0, 0, 1, 1,
-0.07447992, 0.3154231, -1.291423, 0, 0, 0, 1, 1,
-0.0709598, -0.09900604, -2.798455, 0, 0, 0, 1, 1,
-0.06525849, -0.2660156, -2.285462, 0, 0, 0, 1, 1,
-0.06514622, 1.048753, 0.825686, 0, 0, 0, 1, 1,
-0.06133118, -0.9349827, -1.997014, 0, 0, 0, 1, 1,
-0.05595831, -0.2832595, -3.859402, 1, 1, 1, 1, 1,
-0.05222553, 0.6840242, 0.4250555, 1, 1, 1, 1, 1,
-0.05198448, -0.5365799, -4.880069, 1, 1, 1, 1, 1,
-0.04968044, 0.1842582, -0.5478504, 1, 1, 1, 1, 1,
-0.04877043, 0.6754546, -0.144736, 1, 1, 1, 1, 1,
-0.04659669, 0.4135391, -0.5232083, 1, 1, 1, 1, 1,
-0.04646698, -0.3794002, -4.324231, 1, 1, 1, 1, 1,
-0.04524556, -0.8713952, -2.782015, 1, 1, 1, 1, 1,
-0.04346255, -1.370585, -3.84079, 1, 1, 1, 1, 1,
-0.0418918, -1.09552, -4.790365, 1, 1, 1, 1, 1,
-0.04079036, 0.623165, 0.5249251, 1, 1, 1, 1, 1,
-0.03366208, 0.2188351, 0.07173599, 1, 1, 1, 1, 1,
-0.03351137, -0.6793763, -3.102927, 1, 1, 1, 1, 1,
-0.0295188, 1.100846, 0.2791941, 1, 1, 1, 1, 1,
-0.02939811, -1.643562, -2.005962, 1, 1, 1, 1, 1,
-0.0278534, -0.7834598, -3.01047, 0, 0, 1, 1, 1,
-0.02765063, -1.101146, -2.968491, 1, 0, 0, 1, 1,
-0.0273279, 0.4062342, -1.167083, 1, 0, 0, 1, 1,
-0.02566233, 0.8581276, -0.8511031, 1, 0, 0, 1, 1,
-0.02552427, -1.210982, -3.591398, 1, 0, 0, 1, 1,
-0.02418424, 0.01352678, -1.009002, 1, 0, 0, 1, 1,
-0.02317293, 0.7515541, 0.127416, 0, 0, 0, 1, 1,
-0.01788696, 0.7949941, -1.155763, 0, 0, 0, 1, 1,
-0.01593326, -1.324446, -2.794861, 0, 0, 0, 1, 1,
-0.009262674, -1.705962, -3.517518, 0, 0, 0, 1, 1,
-0.001792817, 0.9569443, 0.5011058, 0, 0, 0, 1, 1,
-0.001237087, 0.3898272, 0.6865079, 0, 0, 0, 1, 1,
-0.001153956, 1.108858, 1.650097, 0, 0, 0, 1, 1,
-0.0007249176, -0.7337767, -3.91213, 1, 1, 1, 1, 1,
0.005996414, -0.785463, 3.230285, 1, 1, 1, 1, 1,
0.006906423, 0.8757712, 0.6814376, 1, 1, 1, 1, 1,
0.0101066, -2.250779, 5.053727, 1, 1, 1, 1, 1,
0.01236012, 0.8771886, -0.1118402, 1, 1, 1, 1, 1,
0.01362034, 0.06112565, 0.9081367, 1, 1, 1, 1, 1,
0.02058655, -0.5642652, 3.072576, 1, 1, 1, 1, 1,
0.02401733, 0.1714575, -0.4676332, 1, 1, 1, 1, 1,
0.02469593, 0.7505114, -0.8551813, 1, 1, 1, 1, 1,
0.02892974, -0.3007288, 2.337713, 1, 1, 1, 1, 1,
0.03131194, -0.03733421, 2.314473, 1, 1, 1, 1, 1,
0.03335779, 0.02916094, 1.65025, 1, 1, 1, 1, 1,
0.04116271, 0.2134708, -0.003230671, 1, 1, 1, 1, 1,
0.04212885, -0.309597, 2.306746, 1, 1, 1, 1, 1,
0.04715689, -0.8148302, 4.788495, 1, 1, 1, 1, 1,
0.04771909, 1.212257, 1.419675, 0, 0, 1, 1, 1,
0.0481376, -0.03420792, 2.005265, 1, 0, 0, 1, 1,
0.0488623, 0.4286621, 1.233654, 1, 0, 0, 1, 1,
0.05397828, 1.462706, 0.1265176, 1, 0, 0, 1, 1,
0.05452835, -1.353303, 1.555148, 1, 0, 0, 1, 1,
0.05459226, -1.012128, 4.048468, 1, 0, 0, 1, 1,
0.05946193, -0.4376911, 2.084966, 0, 0, 0, 1, 1,
0.06654549, 0.5732516, -0.6529396, 0, 0, 0, 1, 1,
0.07002485, 2.308354, 0.4812483, 0, 0, 0, 1, 1,
0.07051186, 0.3012427, -0.0942664, 0, 0, 0, 1, 1,
0.07488814, 0.392516, 1.473189, 0, 0, 0, 1, 1,
0.0750929, -0.4112249, 2.799628, 0, 0, 0, 1, 1,
0.07783531, 0.1031532, 0.9202992, 0, 0, 0, 1, 1,
0.08406952, 0.3379008, 0.3202033, 1, 1, 1, 1, 1,
0.08430967, -1.777511, 2.703531, 1, 1, 1, 1, 1,
0.08743954, -2.307657, 3.280574, 1, 1, 1, 1, 1,
0.09098974, -0.1419834, 4.803945, 1, 1, 1, 1, 1,
0.0925377, 0.5209094, 0.3808929, 1, 1, 1, 1, 1,
0.095613, 0.2112958, -0.2339258, 1, 1, 1, 1, 1,
0.09715599, 1.235175, -0.37601, 1, 1, 1, 1, 1,
0.09863437, 0.1981229, -1.273036, 1, 1, 1, 1, 1,
0.1024801, 0.4052038, -0.08479705, 1, 1, 1, 1, 1,
0.1028393, -0.000880292, 2.231704, 1, 1, 1, 1, 1,
0.1039256, 1.938883, 0.8287157, 1, 1, 1, 1, 1,
0.1063585, 0.9215745, 0.1894673, 1, 1, 1, 1, 1,
0.1087447, 1.354197, -0.09135218, 1, 1, 1, 1, 1,
0.1123994, 1.574359, 0.5941212, 1, 1, 1, 1, 1,
0.1139333, -1.127119, 2.484973, 1, 1, 1, 1, 1,
0.1161868, 0.4074842, -0.4418636, 0, 0, 1, 1, 1,
0.116458, -0.01889388, 1.756858, 1, 0, 0, 1, 1,
0.1222397, -1.38065, 3.012815, 1, 0, 0, 1, 1,
0.125311, -0.03038983, 1.601008, 1, 0, 0, 1, 1,
0.1263455, 0.231064, 2.235582, 1, 0, 0, 1, 1,
0.1292467, -0.401877, 3.36337, 1, 0, 0, 1, 1,
0.1303856, 0.1819018, -0.04090107, 0, 0, 0, 1, 1,
0.1327359, -0.3177375, 0.8543555, 0, 0, 0, 1, 1,
0.1359758, -0.3712282, 4.259058, 0, 0, 0, 1, 1,
0.1373183, -0.5070057, 2.418015, 0, 0, 0, 1, 1,
0.137653, -0.4277589, 2.942312, 0, 0, 0, 1, 1,
0.1394551, -0.4970381, 2.997036, 0, 0, 0, 1, 1,
0.1401273, 0.8170315, 1.120593, 0, 0, 0, 1, 1,
0.1445556, 1.649956, -1.659562, 1, 1, 1, 1, 1,
0.1448594, -0.03057363, 3.368207, 1, 1, 1, 1, 1,
0.1466224, -0.4624786, 2.332858, 1, 1, 1, 1, 1,
0.1513483, -1.831421, 3.967971, 1, 1, 1, 1, 1,
0.151992, -1.955205, 4.124201, 1, 1, 1, 1, 1,
0.1527369, 0.1227251, -0.4784101, 1, 1, 1, 1, 1,
0.1529439, -0.9021156, 3.268038, 1, 1, 1, 1, 1,
0.1547089, 0.9885371, 0.2403332, 1, 1, 1, 1, 1,
0.158545, 0.1771056, 0.7495875, 1, 1, 1, 1, 1,
0.1585585, -0.4963445, 1.723353, 1, 1, 1, 1, 1,
0.1661353, -1.769939, 4.33864, 1, 1, 1, 1, 1,
0.1685182, -0.7063741, 3.156542, 1, 1, 1, 1, 1,
0.1690615, -0.6707291, 2.801366, 1, 1, 1, 1, 1,
0.1723235, -0.3113158, 4.422547, 1, 1, 1, 1, 1,
0.1774787, 1.068552, -1.032378, 1, 1, 1, 1, 1,
0.1843528, -0.07503755, 1.97342, 0, 0, 1, 1, 1,
0.1893787, 0.4375928, 2.044635, 1, 0, 0, 1, 1,
0.1898722, 2.3512, 0.005563422, 1, 0, 0, 1, 1,
0.1938136, -0.3059861, 3.483383, 1, 0, 0, 1, 1,
0.1942764, 0.1571591, 1.495676, 1, 0, 0, 1, 1,
0.1981297, -0.1560429, 0.3903958, 1, 0, 0, 1, 1,
0.1995035, -1.395986, 2.325925, 0, 0, 0, 1, 1,
0.2019593, 0.4070888, 2.228646, 0, 0, 0, 1, 1,
0.2125664, 1.107024, 1.100909, 0, 0, 0, 1, 1,
0.2182138, 0.6606113, -2.123406, 0, 0, 0, 1, 1,
0.2221693, 0.1169289, 1.6538, 0, 0, 0, 1, 1,
0.2242585, 0.4681547, 0.4305384, 0, 0, 0, 1, 1,
0.2330113, -0.5146844, 2.388904, 0, 0, 0, 1, 1,
0.238869, -0.6773191, 3.667951, 1, 1, 1, 1, 1,
0.2404243, -0.5594475, 2.922881, 1, 1, 1, 1, 1,
0.2418443, -1.416444, 1.984698, 1, 1, 1, 1, 1,
0.2427081, 1.046077, 1.42171, 1, 1, 1, 1, 1,
0.2505568, -0.5841773, 2.532634, 1, 1, 1, 1, 1,
0.2508663, -0.3478948, 1.062946, 1, 1, 1, 1, 1,
0.2527651, -1.074838, 2.422222, 1, 1, 1, 1, 1,
0.2569197, -1.058648, 3.017504, 1, 1, 1, 1, 1,
0.2574186, 0.2798305, 0.09488852, 1, 1, 1, 1, 1,
0.2591641, -2.061014, 2.111959, 1, 1, 1, 1, 1,
0.2641202, -0.6635203, 1.501284, 1, 1, 1, 1, 1,
0.2668873, 0.7526875, 0.2822271, 1, 1, 1, 1, 1,
0.2677587, 0.09634583, 1.243916, 1, 1, 1, 1, 1,
0.2757833, -1.665117, 4.969695, 1, 1, 1, 1, 1,
0.2777898, 1.768236, -0.1902855, 1, 1, 1, 1, 1,
0.2789004, -0.4431759, 2.092879, 0, 0, 1, 1, 1,
0.2843876, 0.360112, -1.223655, 1, 0, 0, 1, 1,
0.2858047, -0.7239885, 4.050314, 1, 0, 0, 1, 1,
0.2863646, -0.1059293, 0.006305693, 1, 0, 0, 1, 1,
0.2880376, 2.080789, 1.127802, 1, 0, 0, 1, 1,
0.2886466, 0.7909629, 1.762852, 1, 0, 0, 1, 1,
0.2899916, -0.04726917, 1.522997, 0, 0, 0, 1, 1,
0.2906343, -2.381168, 3.621257, 0, 0, 0, 1, 1,
0.2927438, 0.3225586, 1.16791, 0, 0, 0, 1, 1,
0.293423, 1.447378, 0.3492244, 0, 0, 0, 1, 1,
0.2953878, -0.3931342, 1.166489, 0, 0, 0, 1, 1,
0.2958736, 0.2011746, 0.3633453, 0, 0, 0, 1, 1,
0.2961169, 1.007739, 0.7082266, 0, 0, 0, 1, 1,
0.2990918, 1.385783, -0.1659638, 1, 1, 1, 1, 1,
0.2991246, -0.1235189, 0.9994271, 1, 1, 1, 1, 1,
0.3004048, -0.3429821, 3.031469, 1, 1, 1, 1, 1,
0.301089, 1.123701, 0.01226901, 1, 1, 1, 1, 1,
0.3017539, 1.055514, -0.3834792, 1, 1, 1, 1, 1,
0.3027768, 0.4688691, 0.02332462, 1, 1, 1, 1, 1,
0.304093, -0.6781307, 1.97312, 1, 1, 1, 1, 1,
0.3093609, 1.275452, 0.09531941, 1, 1, 1, 1, 1,
0.3120674, 0.0132298, 2.706944, 1, 1, 1, 1, 1,
0.3167717, 0.07407724, 2.225237, 1, 1, 1, 1, 1,
0.3218231, 0.6573123, 0.9887803, 1, 1, 1, 1, 1,
0.322172, -2.150468, 2.342043, 1, 1, 1, 1, 1,
0.3222718, -0.3817969, 1.120854, 1, 1, 1, 1, 1,
0.3225322, 0.9606879, -0.5096217, 1, 1, 1, 1, 1,
0.3227816, -0.5572716, 3.436274, 1, 1, 1, 1, 1,
0.3243564, -1.508543, 1.967628, 0, 0, 1, 1, 1,
0.3326198, 1.302095, 0.7246687, 1, 0, 0, 1, 1,
0.3371429, 0.07129236, 1.662977, 1, 0, 0, 1, 1,
0.3405968, 0.1365353, 0.1543187, 1, 0, 0, 1, 1,
0.341507, 0.3143672, 0.4794437, 1, 0, 0, 1, 1,
0.3425555, -1.213301, 2.164736, 1, 0, 0, 1, 1,
0.3433947, 0.4519094, 1.152306, 0, 0, 0, 1, 1,
0.3440557, -0.6771761, 3.325302, 0, 0, 0, 1, 1,
0.3442875, -0.6684243, 1.966895, 0, 0, 0, 1, 1,
0.3451063, 0.6464305, 0.4811168, 0, 0, 0, 1, 1,
0.3460306, -1.034791, 1.85767, 0, 0, 0, 1, 1,
0.3470451, -0.4961676, 1.185989, 0, 0, 0, 1, 1,
0.3474107, -0.4838803, 2.786016, 0, 0, 0, 1, 1,
0.3511552, 0.08767597, 0.4615207, 1, 1, 1, 1, 1,
0.3512023, -0.03809225, -0.7564698, 1, 1, 1, 1, 1,
0.3534074, 1.317451, -0.3789702, 1, 1, 1, 1, 1,
0.3549251, 0.3023123, 1.613302, 1, 1, 1, 1, 1,
0.3560475, -0.8247036, 2.763856, 1, 1, 1, 1, 1,
0.3561753, -0.4295678, 2.127271, 1, 1, 1, 1, 1,
0.3595783, 0.3663786, -0.02773336, 1, 1, 1, 1, 1,
0.360955, -0.00330249, 1.594697, 1, 1, 1, 1, 1,
0.3633893, -1.63514, 3.204017, 1, 1, 1, 1, 1,
0.3676782, 0.5758345, 0.7585446, 1, 1, 1, 1, 1,
0.3687382, 0.1627289, 1.419442, 1, 1, 1, 1, 1,
0.3695801, -1.201648, 1.122581, 1, 1, 1, 1, 1,
0.3700385, 0.855122, 1.980142, 1, 1, 1, 1, 1,
0.3703177, -2.613597, 3.578261, 1, 1, 1, 1, 1,
0.3838663, 0.7199537, 0.8205988, 1, 1, 1, 1, 1,
0.3875533, -0.7411129, 1.312665, 0, 0, 1, 1, 1,
0.3907008, 1.413407, 0.4758587, 1, 0, 0, 1, 1,
0.3914333, 0.3687684, 1.812908, 1, 0, 0, 1, 1,
0.3923268, -0.5629065, 3.619938, 1, 0, 0, 1, 1,
0.3959041, -0.7359012, 0.8176713, 1, 0, 0, 1, 1,
0.3979081, 0.01280388, 2.455462, 1, 0, 0, 1, 1,
0.4016381, -0.6646584, 2.801468, 0, 0, 0, 1, 1,
0.4038056, -0.1101268, 1.966344, 0, 0, 0, 1, 1,
0.4046607, -0.09735652, 2.628371, 0, 0, 0, 1, 1,
0.4059381, -0.3620076, 1.506738, 0, 0, 0, 1, 1,
0.4082761, -0.9746025, 3.607428, 0, 0, 0, 1, 1,
0.4096866, 0.8594206, -0.349452, 0, 0, 0, 1, 1,
0.4104659, -0.4605921, 2.851496, 0, 0, 0, 1, 1,
0.4105928, 1.181907, 0.606346, 1, 1, 1, 1, 1,
0.4165548, 0.1622377, 2.076991, 1, 1, 1, 1, 1,
0.4193974, 0.5630904, 1.261571, 1, 1, 1, 1, 1,
0.4198675, 1.03601, 0.1158803, 1, 1, 1, 1, 1,
0.4240028, -1.249838, 3.207774, 1, 1, 1, 1, 1,
0.4242168, -1.457803, 1.366411, 1, 1, 1, 1, 1,
0.4269252, -1.124095, 3.864395, 1, 1, 1, 1, 1,
0.4319558, -1.432381, 3.335038, 1, 1, 1, 1, 1,
0.4352936, -1.198894, 3.11906, 1, 1, 1, 1, 1,
0.4355291, -0.8959802, 3.513306, 1, 1, 1, 1, 1,
0.4363309, 0.2029627, 0.258039, 1, 1, 1, 1, 1,
0.4400065, 0.6002803, 0.796286, 1, 1, 1, 1, 1,
0.4405166, 0.7930151, 0.9386948, 1, 1, 1, 1, 1,
0.4425555, -0.36698, 2.280914, 1, 1, 1, 1, 1,
0.4457703, -0.5587097, 3.032221, 1, 1, 1, 1, 1,
0.447309, 0.2714691, 0.4214157, 0, 0, 1, 1, 1,
0.4521226, 0.5476382, -0.6161148, 1, 0, 0, 1, 1,
0.4552772, -1.393357, 4.626157, 1, 0, 0, 1, 1,
0.4566224, -1.555947, 1.634763, 1, 0, 0, 1, 1,
0.4633785, -0.4672606, 2.326093, 1, 0, 0, 1, 1,
0.4658165, -0.2164929, 1.20308, 1, 0, 0, 1, 1,
0.469635, -0.8688448, 1.434524, 0, 0, 0, 1, 1,
0.4707459, -0.6926617, 1.74171, 0, 0, 0, 1, 1,
0.470834, -0.1890605, 1.19425, 0, 0, 0, 1, 1,
0.4758927, -0.333139, 0.1401616, 0, 0, 0, 1, 1,
0.4789433, -1.693327, 1.993741, 0, 0, 0, 1, 1,
0.4827716, 2.035292, -0.6188168, 0, 0, 0, 1, 1,
0.4852335, 0.05902493, -0.1961711, 0, 0, 0, 1, 1,
0.495674, 0.2495791, 0.6834019, 1, 1, 1, 1, 1,
0.4963914, -0.1426088, 3.170116, 1, 1, 1, 1, 1,
0.5056306, -0.494793, 2.346051, 1, 1, 1, 1, 1,
0.507804, -0.7348102, 4.063362, 1, 1, 1, 1, 1,
0.5114994, 1.263583, 0.02400232, 1, 1, 1, 1, 1,
0.5139723, -0.7057639, 2.76312, 1, 1, 1, 1, 1,
0.5169954, 0.2917747, 1.717688, 1, 1, 1, 1, 1,
0.5216742, -0.5680234, -0.295041, 1, 1, 1, 1, 1,
0.5221664, 0.4838829, 0.5837018, 1, 1, 1, 1, 1,
0.522167, -1.653416, 2.811242, 1, 1, 1, 1, 1,
0.5222691, -0.2309112, 2.29395, 1, 1, 1, 1, 1,
0.5252646, 0.1027542, 2.727663, 1, 1, 1, 1, 1,
0.537707, 0.510323, 1.060385, 1, 1, 1, 1, 1,
0.5398231, 0.2102792, 0.07620717, 1, 1, 1, 1, 1,
0.5424232, 1.041026, 0.06984237, 1, 1, 1, 1, 1,
0.5469831, 1.726528, -1.627968, 0, 0, 1, 1, 1,
0.5494152, 0.0005905368, 1.443645, 1, 0, 0, 1, 1,
0.5511677, 1.642653, -0.8430573, 1, 0, 0, 1, 1,
0.5562709, 0.1425428, 0.8216224, 1, 0, 0, 1, 1,
0.5573453, 0.5121731, 0.4514183, 1, 0, 0, 1, 1,
0.559913, 2.175392, 1.532755, 1, 0, 0, 1, 1,
0.5622082, 2.845951, 2.141374, 0, 0, 0, 1, 1,
0.5654837, 0.247165, 1.328798, 0, 0, 0, 1, 1,
0.5688682, -0.03892531, 1.112852, 0, 0, 0, 1, 1,
0.569905, 0.5407249, -0.2784487, 0, 0, 0, 1, 1,
0.5714119, 0.3996681, -0.0001140643, 0, 0, 0, 1, 1,
0.5725772, -0.6640363, 5.00914, 0, 0, 0, 1, 1,
0.573128, -1.208652, 4.395156, 0, 0, 0, 1, 1,
0.5820388, -0.4207194, 2.414341, 1, 1, 1, 1, 1,
0.5837505, 0.02780104, 0.8805515, 1, 1, 1, 1, 1,
0.5847864, 0.9566635, 1.67262, 1, 1, 1, 1, 1,
0.5855889, -0.4995023, 2.090058, 1, 1, 1, 1, 1,
0.5887328, 0.1923467, 1.61757, 1, 1, 1, 1, 1,
0.5956913, 0.9449531, 1.797928, 1, 1, 1, 1, 1,
0.5958678, -0.2622384, 2.355866, 1, 1, 1, 1, 1,
0.5980834, -3.685107, 3.007946, 1, 1, 1, 1, 1,
0.6019593, -2.167384, 2.923505, 1, 1, 1, 1, 1,
0.606087, -0.0621848, 2.275068, 1, 1, 1, 1, 1,
0.6074929, 0.07931533, 3.012055, 1, 1, 1, 1, 1,
0.608726, 1.154924, 3.020954, 1, 1, 1, 1, 1,
0.6101872, 1.196059, 0.8407808, 1, 1, 1, 1, 1,
0.6104717, 0.1794253, -0.1586917, 1, 1, 1, 1, 1,
0.6109552, 0.3961937, 0.4138099, 1, 1, 1, 1, 1,
0.6349668, 0.4577691, 0.8685241, 0, 0, 1, 1, 1,
0.637181, 0.5444095, 0.5843696, 1, 0, 0, 1, 1,
0.6504941, -0.1877529, 1.461784, 1, 0, 0, 1, 1,
0.6531176, -2.745531, 4.003549, 1, 0, 0, 1, 1,
0.6534036, -0.1811592, 3.561338, 1, 0, 0, 1, 1,
0.65448, -0.7382431, 1.868181, 1, 0, 0, 1, 1,
0.6659493, 0.1691377, 1.696619, 0, 0, 0, 1, 1,
0.6668569, 0.295413, 0.7164302, 0, 0, 0, 1, 1,
0.6685421, -1.138287, 3.37333, 0, 0, 0, 1, 1,
0.6709474, -0.7474591, 1.875963, 0, 0, 0, 1, 1,
0.6713507, 0.1547389, 0.2168457, 0, 0, 0, 1, 1,
0.6727555, -0.5279789, 3.166045, 0, 0, 0, 1, 1,
0.6730945, -0.1129725, 1.984037, 0, 0, 0, 1, 1,
0.6737828, 0.5781144, 1.751294, 1, 1, 1, 1, 1,
0.6738191, -0.7340018, 1.723495, 1, 1, 1, 1, 1,
0.6741324, -0.7910343, 3.73468, 1, 1, 1, 1, 1,
0.6865147, 1.960534, 2.103731, 1, 1, 1, 1, 1,
0.6883417, -0.5579264, 3.587167, 1, 1, 1, 1, 1,
0.6892838, 2.48738, 0.3652137, 1, 1, 1, 1, 1,
0.6903136, 0.8327725, -0.5231035, 1, 1, 1, 1, 1,
0.690345, -0.02690315, -1.185922, 1, 1, 1, 1, 1,
0.6933071, -0.1278489, 2.731581, 1, 1, 1, 1, 1,
0.6935838, 0.2118181, 1.742453, 1, 1, 1, 1, 1,
0.6976404, -1.102346, 0.4988737, 1, 1, 1, 1, 1,
0.6978569, -1.160542, 0.4899455, 1, 1, 1, 1, 1,
0.7017301, 2.037578, 2.079392, 1, 1, 1, 1, 1,
0.7045396, -0.8271642, 1.398379, 1, 1, 1, 1, 1,
0.7075228, -0.002606161, 1.226585, 1, 1, 1, 1, 1,
0.7119026, -1.94567, 3.504784, 0, 0, 1, 1, 1,
0.7133439, -1.193283, 2.926254, 1, 0, 0, 1, 1,
0.7148458, 0.05104361, 0.356067, 1, 0, 0, 1, 1,
0.7175729, 0.8514842, 0.8530787, 1, 0, 0, 1, 1,
0.7177973, -1.995943, 3.699165, 1, 0, 0, 1, 1,
0.7189452, 0.792909, 0.8697358, 1, 0, 0, 1, 1,
0.7197542, 0.5524443, 1.390452, 0, 0, 0, 1, 1,
0.7378468, 0.3678447, 0.1631131, 0, 0, 0, 1, 1,
0.7388433, -1.157459, 2.540597, 0, 0, 0, 1, 1,
0.7390735, -0.2649963, 0.486488, 0, 0, 0, 1, 1,
0.7456556, -0.9741392, 2.19263, 0, 0, 0, 1, 1,
0.7466872, -0.6271216, 2.831616, 0, 0, 0, 1, 1,
0.7547743, 0.120611, 0.9656271, 0, 0, 0, 1, 1,
0.7576736, -0.632752, 1.789324, 1, 1, 1, 1, 1,
0.7585628, -1.161416, 3.038057, 1, 1, 1, 1, 1,
0.7626203, 0.2986749, 0.9237199, 1, 1, 1, 1, 1,
0.7627304, 0.0842813, 1.385249, 1, 1, 1, 1, 1,
0.7680777, -0.2505859, 1.117227, 1, 1, 1, 1, 1,
0.7697846, 0.03586289, 1.249632, 1, 1, 1, 1, 1,
0.776069, 0.8931761, 1.150362, 1, 1, 1, 1, 1,
0.781891, -0.1323966, 2.400073, 1, 1, 1, 1, 1,
0.7820677, -0.0772275, 1.625908, 1, 1, 1, 1, 1,
0.785781, 0.5026513, 0.1618742, 1, 1, 1, 1, 1,
0.7886607, -0.02572347, 3.530341, 1, 1, 1, 1, 1,
0.7888756, 0.05510088, 1.44471, 1, 1, 1, 1, 1,
0.7891802, -0.890688, 0.9039307, 1, 1, 1, 1, 1,
0.7939495, -1.725237, 1.831135, 1, 1, 1, 1, 1,
0.797587, 0.01252692, 2.741185, 1, 1, 1, 1, 1,
0.7990919, -1.214441, 2.462085, 0, 0, 1, 1, 1,
0.807394, 0.9683709, 0.6162059, 1, 0, 0, 1, 1,
0.8147037, 0.3546562, 1.225647, 1, 0, 0, 1, 1,
0.8211351, 0.8792481, -0.5770116, 1, 0, 0, 1, 1,
0.8223354, -0.4257889, -0.7924355, 1, 0, 0, 1, 1,
0.8239143, 0.03228282, 2.378045, 1, 0, 0, 1, 1,
0.8326018, -0.5320284, 3.324038, 0, 0, 0, 1, 1,
0.8331064, -1.606543, 1.649463, 0, 0, 0, 1, 1,
0.835165, -0.6244993, 1.270549, 0, 0, 0, 1, 1,
0.8376898, 0.345246, -0.08728471, 0, 0, 0, 1, 1,
0.848307, -1.418897, 2.805057, 0, 0, 0, 1, 1,
0.8507876, 0.7875095, 1.22968, 0, 0, 0, 1, 1,
0.8597049, 0.1997883, 2.029582, 0, 0, 0, 1, 1,
0.866583, -0.7418213, 3.575238, 1, 1, 1, 1, 1,
0.8703444, 0.3143468, 1.862531, 1, 1, 1, 1, 1,
0.8716627, 0.3228631, 1.954564, 1, 1, 1, 1, 1,
0.874834, -0.6928951, 2.981413, 1, 1, 1, 1, 1,
0.8758351, -0.1199543, 1.920571, 1, 1, 1, 1, 1,
0.882643, -0.8900995, 3.838676, 1, 1, 1, 1, 1,
0.8858618, -1.37277, 0.7527025, 1, 1, 1, 1, 1,
0.888452, -0.5151725, -0.521338, 1, 1, 1, 1, 1,
0.889552, -1.360092, 2.088372, 1, 1, 1, 1, 1,
0.8908828, 0.2041789, 0.3928382, 1, 1, 1, 1, 1,
0.9011828, -0.4001983, 2.281439, 1, 1, 1, 1, 1,
0.9041142, 0.4597068, 0.6113563, 1, 1, 1, 1, 1,
0.9041175, -1.793937, 4.029604, 1, 1, 1, 1, 1,
0.9211957, -0.0365463, 1.956403, 1, 1, 1, 1, 1,
0.92184, 0.9095252, -0.5331568, 1, 1, 1, 1, 1,
0.9346418, 1.47281, -0.7538028, 0, 0, 1, 1, 1,
0.934897, 1.046531, -0.2849945, 1, 0, 0, 1, 1,
0.9359696, 0.7260364, 0.3967527, 1, 0, 0, 1, 1,
0.9395063, -1.318184, 4.166031, 1, 0, 0, 1, 1,
0.9402098, 0.1375613, 4.076179, 1, 0, 0, 1, 1,
0.9405943, 0.3124583, 0.02423993, 1, 0, 0, 1, 1,
0.9429284, 0.6846433, 2.219342, 0, 0, 0, 1, 1,
0.9439943, 2.271353, 0.7084655, 0, 0, 0, 1, 1,
0.946982, -0.366627, 0.06118695, 0, 0, 0, 1, 1,
0.9580258, -1.229511, 0.9980715, 0, 0, 0, 1, 1,
0.9790963, -0.3408286, 1.878931, 0, 0, 0, 1, 1,
0.9811883, -1.66967, 4.258434, 0, 0, 0, 1, 1,
0.9839982, 0.8430692, 1.120335, 0, 0, 0, 1, 1,
0.986043, -1.114207, 1.589985, 1, 1, 1, 1, 1,
0.9987952, 0.8794561, -0.6811069, 1, 1, 1, 1, 1,
1.004472, 0.466357, 1.292085, 1, 1, 1, 1, 1,
1.008588, -3.26849, 2.976926, 1, 1, 1, 1, 1,
1.018221, -0.231968, 1.136531, 1, 1, 1, 1, 1,
1.026857, -1.262016, 2.11124, 1, 1, 1, 1, 1,
1.028625, 2.038348, -0.01968577, 1, 1, 1, 1, 1,
1.030886, -0.1828926, 1.50116, 1, 1, 1, 1, 1,
1.034878, -1.194968, 1.366717, 1, 1, 1, 1, 1,
1.035889, -2.285325, 4.300472, 1, 1, 1, 1, 1,
1.038426, 1.077672, -0.895919, 1, 1, 1, 1, 1,
1.050044, -1.317207, 1.058546, 1, 1, 1, 1, 1,
1.057843, -0.1140803, 3.436443, 1, 1, 1, 1, 1,
1.060178, -0.2839591, 1.991543, 1, 1, 1, 1, 1,
1.061236, -1.69965, 3.366755, 1, 1, 1, 1, 1,
1.065099, 1.301893, 0.1830137, 0, 0, 1, 1, 1,
1.082293, 1.09058, 2.402556, 1, 0, 0, 1, 1,
1.083934, 2.182649, 0.08712898, 1, 0, 0, 1, 1,
1.085784, -0.7729077, 2.59776, 1, 0, 0, 1, 1,
1.097819, -0.859884, 2.278612, 1, 0, 0, 1, 1,
1.098856, 3.054993, -0.3267737, 1, 0, 0, 1, 1,
1.09959, 0.7821454, 1.355089, 0, 0, 0, 1, 1,
1.106725, -1.346259, 2.23444, 0, 0, 0, 1, 1,
1.112804, 0.4348011, 1.777029, 0, 0, 0, 1, 1,
1.120756, 0.1041727, 2.183424, 0, 0, 0, 1, 1,
1.136664, 0.4523374, 1.248834, 0, 0, 0, 1, 1,
1.152657, 1.108206, -0.1833416, 0, 0, 0, 1, 1,
1.152854, -2.106654, 4.00983, 0, 0, 0, 1, 1,
1.1642, 0.7169949, 1.35873, 1, 1, 1, 1, 1,
1.16579, -0.3377122, 0.7671311, 1, 1, 1, 1, 1,
1.172898, -0.1891045, 2.075867, 1, 1, 1, 1, 1,
1.177698, -1.023802, 0.8503575, 1, 1, 1, 1, 1,
1.179708, -1.140065, 2.378711, 1, 1, 1, 1, 1,
1.195147, 0.8831989, 0.6326326, 1, 1, 1, 1, 1,
1.199376, -0.4480088, 1.86146, 1, 1, 1, 1, 1,
1.203254, 0.2792253, 1.874092, 1, 1, 1, 1, 1,
1.20424, -1.053334, 2.742995, 1, 1, 1, 1, 1,
1.208105, -1.012021, 2.280313, 1, 1, 1, 1, 1,
1.208806, -0.4279236, 3.265165, 1, 1, 1, 1, 1,
1.218526, -1.199287, 3.171422, 1, 1, 1, 1, 1,
1.22761, -0.8395126, 1.539638, 1, 1, 1, 1, 1,
1.229609, 0.4721208, 1.623935, 1, 1, 1, 1, 1,
1.23294, 1.169151, 2.304549, 1, 1, 1, 1, 1,
1.24303, -0.2428869, 0.4897851, 0, 0, 1, 1, 1,
1.245052, -0.1111428, 1.88059, 1, 0, 0, 1, 1,
1.25524, -0.4407803, 2.195565, 1, 0, 0, 1, 1,
1.266558, 1.209936, 0.959067, 1, 0, 0, 1, 1,
1.27497, -2.036302, 1.180717, 1, 0, 0, 1, 1,
1.276495, 0.524619, 1.9484, 1, 0, 0, 1, 1,
1.281382, -0.06278466, 2.71375, 0, 0, 0, 1, 1,
1.284293, 0.4714689, -0.3066882, 0, 0, 0, 1, 1,
1.286204, 0.2690648, 2.863348, 0, 0, 0, 1, 1,
1.287703, -0.3799649, 1.169253, 0, 0, 0, 1, 1,
1.29555, 0.6506611, 0.1666359, 0, 0, 0, 1, 1,
1.299612, 0.2347634, -0.1435793, 0, 0, 0, 1, 1,
1.304259, -0.8551776, 2.290954, 0, 0, 0, 1, 1,
1.304466, -1.452664, 2.129843, 1, 1, 1, 1, 1,
1.312087, -0.7965091, 1.767608, 1, 1, 1, 1, 1,
1.321031, -1.199413, 1.572265, 1, 1, 1, 1, 1,
1.325247, -0.3190021, 2.087117, 1, 1, 1, 1, 1,
1.333362, -1.063157, 1.799124, 1, 1, 1, 1, 1,
1.338334, -1.060354, 2.118314, 1, 1, 1, 1, 1,
1.349978, -1.22797, 2.20619, 1, 1, 1, 1, 1,
1.350104, -0.9361942, 1.650218, 1, 1, 1, 1, 1,
1.362301, -0.5934071, 0.9357626, 1, 1, 1, 1, 1,
1.368044, 0.8905679, 0.03379984, 1, 1, 1, 1, 1,
1.368046, 0.6415128, -1.183072, 1, 1, 1, 1, 1,
1.372302, 0.2833307, 2.876513, 1, 1, 1, 1, 1,
1.373276, -0.7710243, 1.822311, 1, 1, 1, 1, 1,
1.377325, -1.247697, 2.666611, 1, 1, 1, 1, 1,
1.394169, 0.6223572, -0.6748735, 1, 1, 1, 1, 1,
1.398307, -2.497444, 2.632072, 0, 0, 1, 1, 1,
1.398432, -0.3630008, 3.018636, 1, 0, 0, 1, 1,
1.412432, 1.770916, 0.6539484, 1, 0, 0, 1, 1,
1.415612, -0.6155567, 1.677406, 1, 0, 0, 1, 1,
1.417196, 0.393412, 0.3134614, 1, 0, 0, 1, 1,
1.420918, 0.4769137, 0.3934021, 1, 0, 0, 1, 1,
1.441209, -1.249747, 3.222671, 0, 0, 0, 1, 1,
1.447863, -2.516856, 2.209201, 0, 0, 0, 1, 1,
1.449144, -0.4271855, 2.554962, 0, 0, 0, 1, 1,
1.451863, 1.696402, 0.3393655, 0, 0, 0, 1, 1,
1.452471, 1.385265, 2.00817, 0, 0, 0, 1, 1,
1.471398, 0.9972096, 0.5711945, 0, 0, 0, 1, 1,
1.47601, 1.115141, 1.435945, 0, 0, 0, 1, 1,
1.489719, 0.2638923, 0.3449057, 1, 1, 1, 1, 1,
1.489789, 0.4981674, 1.00411, 1, 1, 1, 1, 1,
1.508958, -0.7126806, 2.8667, 1, 1, 1, 1, 1,
1.515453, 0.9560006, 1.557261, 1, 1, 1, 1, 1,
1.519808, -0.6076274, 3.18842, 1, 1, 1, 1, 1,
1.523102, 0.7860575, 0.8812287, 1, 1, 1, 1, 1,
1.531392, 0.5671564, 3.456143, 1, 1, 1, 1, 1,
1.538185, 0.81476, 0.08958505, 1, 1, 1, 1, 1,
1.561841, -0.3731091, 1.22473, 1, 1, 1, 1, 1,
1.56762, -1.248157, 3.449604, 1, 1, 1, 1, 1,
1.569342, -0.9671448, 1.498985, 1, 1, 1, 1, 1,
1.586564, 1.42116, -0.3387251, 1, 1, 1, 1, 1,
1.596021, -0.2330057, 2.05172, 1, 1, 1, 1, 1,
1.608829, 0.6804348, 0.5307919, 1, 1, 1, 1, 1,
1.61001, 1.442961, 0.05272837, 1, 1, 1, 1, 1,
1.627174, 1.001676, 1.216819, 0, 0, 1, 1, 1,
1.635313, -0.2523097, 2.411886, 1, 0, 0, 1, 1,
1.667258, -0.7025622, 2.332736, 1, 0, 0, 1, 1,
1.678017, 0.7047412, 2.055835, 1, 0, 0, 1, 1,
1.683887, -0.2627896, 1.452694, 1, 0, 0, 1, 1,
1.697116, -0.503895, 1.082724, 1, 0, 0, 1, 1,
1.697673, -0.006067311, 2.55245, 0, 0, 0, 1, 1,
1.737825, 0.06636079, 2.879242, 0, 0, 0, 1, 1,
1.741521, -0.6361246, 2.462785, 0, 0, 0, 1, 1,
1.741854, 2.001985, 0.7200366, 0, 0, 0, 1, 1,
1.745162, 0.910828, 0.5473939, 0, 0, 0, 1, 1,
1.75888, -0.8644608, 0.322093, 0, 0, 0, 1, 1,
1.769917, -1.710724, 4.398347, 0, 0, 0, 1, 1,
1.779504, -0.2020892, 3.686769, 1, 1, 1, 1, 1,
1.784378, 1.13548, 0.4627351, 1, 1, 1, 1, 1,
1.800609, -0.2575257, 0.624568, 1, 1, 1, 1, 1,
1.829997, 1.072997, -0.4895783, 1, 1, 1, 1, 1,
1.831035, -0.867887, 1.332431, 1, 1, 1, 1, 1,
1.857423, -0.2652478, 1.095217, 1, 1, 1, 1, 1,
1.859498, -0.8360284, 1.315164, 1, 1, 1, 1, 1,
1.866383, -0.4188969, 2.820362, 1, 1, 1, 1, 1,
1.876009, -1.16319, 0.04613907, 1, 1, 1, 1, 1,
1.889035, 0.8213434, 0.4243956, 1, 1, 1, 1, 1,
1.899697, 1.533387, 1.078442, 1, 1, 1, 1, 1,
1.902007, -1.099249, 4.169927, 1, 1, 1, 1, 1,
1.917433, 1.927414, 0.2921227, 1, 1, 1, 1, 1,
1.9248, -0.1789961, 1.476469, 1, 1, 1, 1, 1,
1.927545, -1.367406, 2.506318, 1, 1, 1, 1, 1,
1.934913, 0.9906399, 1.276379, 0, 0, 1, 1, 1,
1.94225, 1.4535, 0.1014418, 1, 0, 0, 1, 1,
1.95696, 0.2960562, 1.024624, 1, 0, 0, 1, 1,
1.974881, 0.5647934, 1.185228, 1, 0, 0, 1, 1,
1.982187, -0.2483596, 2.217814, 1, 0, 0, 1, 1,
2.109591, -0.5834082, 2.057028, 1, 0, 0, 1, 1,
2.120576, -0.3550174, 2.104881, 0, 0, 0, 1, 1,
2.127935, 0.1440092, 0.9420775, 0, 0, 0, 1, 1,
2.131666, -1.397698, 3.564485, 0, 0, 0, 1, 1,
2.266903, -0.3867647, 2.17224, 0, 0, 0, 1, 1,
2.270064, 0.1948921, -0.5450008, 0, 0, 0, 1, 1,
2.301409, 0.1884299, 1.829738, 0, 0, 0, 1, 1,
2.319172, -1.445961, 2.93963, 0, 0, 0, 1, 1,
2.389033, 0.2857032, 1.991456, 1, 1, 1, 1, 1,
2.390426, -1.228101, 0.1319576, 1, 1, 1, 1, 1,
2.447843, 0.0518141, 1.251941, 1, 1, 1, 1, 1,
2.50081, -0.8052015, 2.299937, 1, 1, 1, 1, 1,
2.513846, 0.7042221, 1.562484, 1, 1, 1, 1, 1,
2.787358, -1.804079, 1.923768, 1, 1, 1, 1, 1,
3.174982, 0.5864447, 1.285061, 1, 1, 1, 1, 1
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
var radius = 9.552523;
var distance = 33.55283;
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
mvMatrix.translate( 0.2015734, 0.2408593, -0.01152325 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.55283);
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