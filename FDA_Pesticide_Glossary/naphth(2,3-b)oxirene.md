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
-3.273993, 0.309937, 0.1477741, 1, 0, 0, 1,
-3.122235, -2.423628, -2.769843, 1, 0.007843138, 0, 1,
-2.578118, -1.062385, -1.525933, 1, 0.01176471, 0, 1,
-2.516443, -1.737206, -3.167314, 1, 0.01960784, 0, 1,
-2.492224, 0.3072141, -0.2936756, 1, 0.02352941, 0, 1,
-2.460203, -0.3785519, -0.8123171, 1, 0.03137255, 0, 1,
-2.392719, 0.7455121, -2.479688, 1, 0.03529412, 0, 1,
-2.365461, -1.729909, -2.914104, 1, 0.04313726, 0, 1,
-2.351779, 0.004881096, -2.02292, 1, 0.04705882, 0, 1,
-2.311146, 0.1364105, -1.732263, 1, 0.05490196, 0, 1,
-2.218701, -1.949023, -2.759069, 1, 0.05882353, 0, 1,
-2.21231, -0.09792461, -1.917374, 1, 0.06666667, 0, 1,
-2.160628, 0.8653039, -0.7958773, 1, 0.07058824, 0, 1,
-2.157639, -1.144096, -4.312408, 1, 0.07843138, 0, 1,
-2.061641, 0.1627462, -1.066852, 1, 0.08235294, 0, 1,
-2.060605, -1.223843, -0.00173032, 1, 0.09019608, 0, 1,
-2.023084, -1.505678, -2.34981, 1, 0.09411765, 0, 1,
-2.005959, 0.4911759, -2.54108, 1, 0.1019608, 0, 1,
-1.99256, 0.3122724, -1.633155, 1, 0.1098039, 0, 1,
-1.992319, -0.8002636, -1.322673, 1, 0.1137255, 0, 1,
-1.970682, -0.3408857, -0.703101, 1, 0.1215686, 0, 1,
-1.925575, -2.005714, -1.319146, 1, 0.1254902, 0, 1,
-1.924113, -0.1002458, -2.274134, 1, 0.1333333, 0, 1,
-1.911096, 1.010735, -1.742204, 1, 0.1372549, 0, 1,
-1.905876, -0.6534951, -1.307274, 1, 0.145098, 0, 1,
-1.891302, -0.4129927, -3.131049, 1, 0.1490196, 0, 1,
-1.843088, 0.1934836, -2.882444, 1, 0.1568628, 0, 1,
-1.818122, -0.5554929, -2.497059, 1, 0.1607843, 0, 1,
-1.792302, -0.2280425, -2.762621, 1, 0.1686275, 0, 1,
-1.776194, -1.090312, -3.805873, 1, 0.172549, 0, 1,
-1.764762, -1.27104, -1.636198, 1, 0.1803922, 0, 1,
-1.758907, 0.1034629, -1.057939, 1, 0.1843137, 0, 1,
-1.746982, 1.393099, 0.7283042, 1, 0.1921569, 0, 1,
-1.741367, 0.07398579, -1.572951, 1, 0.1960784, 0, 1,
-1.730747, 0.008667833, 1.744572, 1, 0.2039216, 0, 1,
-1.715973, 0.2988553, -2.105095, 1, 0.2117647, 0, 1,
-1.678569, 0.9053543, 0.4396294, 1, 0.2156863, 0, 1,
-1.667613, 1.089558, -0.9426497, 1, 0.2235294, 0, 1,
-1.664987, -0.3945828, -1.386274, 1, 0.227451, 0, 1,
-1.651462, 0.1230603, -1.489155, 1, 0.2352941, 0, 1,
-1.650015, -1.271837, -1.3253, 1, 0.2392157, 0, 1,
-1.645482, -0.4552972, -2.420474, 1, 0.2470588, 0, 1,
-1.630187, 0.647571, -1.668178, 1, 0.2509804, 0, 1,
-1.629488, 2.58391, -1.275774, 1, 0.2588235, 0, 1,
-1.601789, 0.278156, 0.009665654, 1, 0.2627451, 0, 1,
-1.592516, -0.6279693, -0.7105477, 1, 0.2705882, 0, 1,
-1.592071, -0.1366054, -0.9073586, 1, 0.2745098, 0, 1,
-1.579409, 0.03465499, -0.9746578, 1, 0.282353, 0, 1,
-1.572938, 0.2161126, -0.196642, 1, 0.2862745, 0, 1,
-1.564217, -0.589731, -0.08674636, 1, 0.2941177, 0, 1,
-1.559455, 0.8765956, -1.157408, 1, 0.3019608, 0, 1,
-1.545355, -0.4530914, -2.224458, 1, 0.3058824, 0, 1,
-1.536897, -0.03475586, -1.752602, 1, 0.3137255, 0, 1,
-1.528656, 1.64073, -0.6122788, 1, 0.3176471, 0, 1,
-1.528617, -1.490466, -0.5559407, 1, 0.3254902, 0, 1,
-1.524794, 0.1778742, -0.9975066, 1, 0.3294118, 0, 1,
-1.521576, -0.7379211, -1.737623, 1, 0.3372549, 0, 1,
-1.508564, -0.9946796, -2.056679, 1, 0.3411765, 0, 1,
-1.505896, 0.1231723, -3.001268, 1, 0.3490196, 0, 1,
-1.484992, -0.7093543, -3.088827, 1, 0.3529412, 0, 1,
-1.484046, -1.238484, -1.602546, 1, 0.3607843, 0, 1,
-1.470891, 1.291703, -1.769318, 1, 0.3647059, 0, 1,
-1.459004, 0.589661, -1.121968, 1, 0.372549, 0, 1,
-1.458499, 0.2055519, 0.1226041, 1, 0.3764706, 0, 1,
-1.448001, 0.05214897, -0.2343193, 1, 0.3843137, 0, 1,
-1.447911, -1.656654, -1.948089, 1, 0.3882353, 0, 1,
-1.445472, 0.06682133, -1.282969, 1, 0.3960784, 0, 1,
-1.443444, -0.5146928, -0.9065066, 1, 0.4039216, 0, 1,
-1.440131, -0.1187624, -3.090837, 1, 0.4078431, 0, 1,
-1.438516, 0.00765664, -0.6602743, 1, 0.4156863, 0, 1,
-1.437837, 0.1550568, -1.679929, 1, 0.4196078, 0, 1,
-1.436858, 0.5922344, -1.578626, 1, 0.427451, 0, 1,
-1.434604, 0.185275, -0.05863134, 1, 0.4313726, 0, 1,
-1.430106, -1.713846, -2.577985, 1, 0.4392157, 0, 1,
-1.429453, 0.2958124, -1.322924, 1, 0.4431373, 0, 1,
-1.409799, -0.3826056, -2.676798, 1, 0.4509804, 0, 1,
-1.400299, 0.4575016, -0.7954827, 1, 0.454902, 0, 1,
-1.397593, 1.479076, 0.05035172, 1, 0.4627451, 0, 1,
-1.38945, -0.4791668, -1.301013, 1, 0.4666667, 0, 1,
-1.385374, -0.6154169, -1.109656, 1, 0.4745098, 0, 1,
-1.372272, 1.107261, -2.156088, 1, 0.4784314, 0, 1,
-1.31891, -2.136984, -1.885073, 1, 0.4862745, 0, 1,
-1.316865, 0.1863335, -1.974211, 1, 0.4901961, 0, 1,
-1.301816, -0.489607, -2.343338, 1, 0.4980392, 0, 1,
-1.299486, 1.013268, -1.908968, 1, 0.5058824, 0, 1,
-1.298036, 0.7483066, 0.2984443, 1, 0.509804, 0, 1,
-1.295807, 0.03669215, -3.08675, 1, 0.5176471, 0, 1,
-1.291167, -0.3103597, -1.561943, 1, 0.5215687, 0, 1,
-1.287431, -0.535942, -3.717932, 1, 0.5294118, 0, 1,
-1.282342, 1.895731, 1.083137, 1, 0.5333334, 0, 1,
-1.277973, -1.318138, -2.066727, 1, 0.5411765, 0, 1,
-1.262301, 0.03080925, -1.673312, 1, 0.5450981, 0, 1,
-1.262274, -1.41861, -3.304693, 1, 0.5529412, 0, 1,
-1.260223, -1.039174, -2.221547, 1, 0.5568628, 0, 1,
-1.259504, -1.036742, -2.333406, 1, 0.5647059, 0, 1,
-1.257764, 1.279583, -1.387871, 1, 0.5686275, 0, 1,
-1.254287, 1.321982, -0.2961806, 1, 0.5764706, 0, 1,
-1.251254, -0.9571992, -2.489895, 1, 0.5803922, 0, 1,
-1.250574, 1.174279, -1.46095, 1, 0.5882353, 0, 1,
-1.249498, -1.817061, -2.411253, 1, 0.5921569, 0, 1,
-1.249167, 0.3983788, -1.246345, 1, 0.6, 0, 1,
-1.247033, 1.327464, 0.2948704, 1, 0.6078432, 0, 1,
-1.243877, 0.05070463, -1.538387, 1, 0.6117647, 0, 1,
-1.238215, 0.1991942, -2.035592, 1, 0.6196079, 0, 1,
-1.236424, 0.9904697, -1.724018, 1, 0.6235294, 0, 1,
-1.233142, -2.209101, -4.236345, 1, 0.6313726, 0, 1,
-1.228913, -0.4952667, -2.718544, 1, 0.6352941, 0, 1,
-1.225563, -0.3273319, -2.631994, 1, 0.6431373, 0, 1,
-1.221147, 0.6132603, 0.1461344, 1, 0.6470588, 0, 1,
-1.216231, 0.0544703, -1.095973, 1, 0.654902, 0, 1,
-1.212933, 1.850824, 0.8271536, 1, 0.6588235, 0, 1,
-1.210976, -0.3287333, -1.530548, 1, 0.6666667, 0, 1,
-1.206846, 0.03005673, -3.541078, 1, 0.6705883, 0, 1,
-1.197219, -1.513678, -3.174794, 1, 0.6784314, 0, 1,
-1.193355, 0.8913729, -2.701886, 1, 0.682353, 0, 1,
-1.193091, 0.3052047, -2.174423, 1, 0.6901961, 0, 1,
-1.18751, -0.2850495, -1.602677, 1, 0.6941177, 0, 1,
-1.185113, -1.675655, -2.17657, 1, 0.7019608, 0, 1,
-1.176646, -1.089867, -1.673242, 1, 0.7098039, 0, 1,
-1.17243, 1.560414, 0.7516499, 1, 0.7137255, 0, 1,
-1.168917, -1.545296, -3.300443, 1, 0.7215686, 0, 1,
-1.163988, -1.50036, -2.73968, 1, 0.7254902, 0, 1,
-1.161203, 0.2166638, -0.7530895, 1, 0.7333333, 0, 1,
-1.160367, -1.092506, -1.764562, 1, 0.7372549, 0, 1,
-1.158689, 0.6315021, 0.2365905, 1, 0.7450981, 0, 1,
-1.158337, -0.3679648, -0.09980603, 1, 0.7490196, 0, 1,
-1.151576, 0.6560316, -0.05833111, 1, 0.7568628, 0, 1,
-1.148776, 0.2683185, 0.2317442, 1, 0.7607843, 0, 1,
-1.147642, -0.2861216, -3.157491, 1, 0.7686275, 0, 1,
-1.147523, -2.6527, -3.523304, 1, 0.772549, 0, 1,
-1.146493, -0.6987471, -2.461233, 1, 0.7803922, 0, 1,
-1.142102, -1.284968, -3.477695, 1, 0.7843137, 0, 1,
-1.11018, 1.810282, -0.3308706, 1, 0.7921569, 0, 1,
-1.109887, 1.195441, -1.491849, 1, 0.7960784, 0, 1,
-1.105606, 0.7119191, -2.241022, 1, 0.8039216, 0, 1,
-1.100299, -0.7871618, -1.300682, 1, 0.8117647, 0, 1,
-1.098021, 1.337053, -3.474529, 1, 0.8156863, 0, 1,
-1.096142, 1.434651, -2.181728, 1, 0.8235294, 0, 1,
-1.089361, -0.3921608, -2.245232, 1, 0.827451, 0, 1,
-1.088469, 0.5605929, -0.9900766, 1, 0.8352941, 0, 1,
-1.074109, -0.03886496, -0.9742283, 1, 0.8392157, 0, 1,
-1.070378, -1.591568, -1.955732, 1, 0.8470588, 0, 1,
-1.058509, -0.5151954, -4.022008, 1, 0.8509804, 0, 1,
-1.058047, 2.504292, 1.607128, 1, 0.8588235, 0, 1,
-1.055639, -0.7239779, -2.171005, 1, 0.8627451, 0, 1,
-1.053117, -0.330792, -4.126195, 1, 0.8705882, 0, 1,
-1.051187, 1.39869, -0.7339094, 1, 0.8745098, 0, 1,
-1.045305, 0.395169, -1.917659, 1, 0.8823529, 0, 1,
-1.042445, 0.8712085, -0.5672536, 1, 0.8862745, 0, 1,
-1.032348, 1.079289, -1.884408, 1, 0.8941177, 0, 1,
-1.031359, 0.7716499, -1.998231, 1, 0.8980392, 0, 1,
-1.02771, -2.074359, -3.892002, 1, 0.9058824, 0, 1,
-1.027632, 0.5722027, -2.133313, 1, 0.9137255, 0, 1,
-1.023179, 1.67372, -0.9284633, 1, 0.9176471, 0, 1,
-1.020987, 1.228895, -1.276877, 1, 0.9254902, 0, 1,
-1.020041, -0.8578635, -1.276414, 1, 0.9294118, 0, 1,
-1.019258, -0.4200855, -1.680216, 1, 0.9372549, 0, 1,
-1.01919, -1.009684, -1.652296, 1, 0.9411765, 0, 1,
-1.01721, 0.2971577, -1.528204, 1, 0.9490196, 0, 1,
-1.012556, -2.222772, -2.049493, 1, 0.9529412, 0, 1,
-0.9911135, -0.1226284, -1.975654, 1, 0.9607843, 0, 1,
-0.9907474, -2.288883, -3.361233, 1, 0.9647059, 0, 1,
-0.9829084, -0.4612924, -1.594568, 1, 0.972549, 0, 1,
-0.9822163, -0.2524436, -1.878866, 1, 0.9764706, 0, 1,
-0.9761636, 0.7438438, -1.777405, 1, 0.9843137, 0, 1,
-0.97418, 1.33655, 0.5359555, 1, 0.9882353, 0, 1,
-0.969502, 0.004369065, -1.97193, 1, 0.9960784, 0, 1,
-0.9677357, 1.58807, -1.03751, 0.9960784, 1, 0, 1,
-0.9651195, -0.9067265, -2.619421, 0.9921569, 1, 0, 1,
-0.9641594, -0.3823412, -2.199871, 0.9843137, 1, 0, 1,
-0.9614422, -0.78454, -1.808715, 0.9803922, 1, 0, 1,
-0.9602971, 1.255718, -0.1857646, 0.972549, 1, 0, 1,
-0.9532329, -0.5243539, -1.253143, 0.9686275, 1, 0, 1,
-0.9480392, 0.02379024, -3.185879, 0.9607843, 1, 0, 1,
-0.9443517, -0.6818035, -2.244838, 0.9568627, 1, 0, 1,
-0.9410118, -0.8419564, -1.991253, 0.9490196, 1, 0, 1,
-0.9409782, -0.9925577, -3.589134, 0.945098, 1, 0, 1,
-0.9360637, 0.05678023, -0.868314, 0.9372549, 1, 0, 1,
-0.9352257, 1.731586, -0.4104426, 0.9333333, 1, 0, 1,
-0.9324312, 0.7415754, -1.14367, 0.9254902, 1, 0, 1,
-0.9314958, 1.400276, 0.706066, 0.9215686, 1, 0, 1,
-0.9314288, -0.6235448, -0.5101021, 0.9137255, 1, 0, 1,
-0.9246405, 0.6960107, -0.1036039, 0.9098039, 1, 0, 1,
-0.9129663, 0.1972617, -0.1014331, 0.9019608, 1, 0, 1,
-0.9090242, 1.474103, -1.427174, 0.8941177, 1, 0, 1,
-0.9051513, -0.2355579, -2.825257, 0.8901961, 1, 0, 1,
-0.9015688, -0.8793436, -3.342779, 0.8823529, 1, 0, 1,
-0.8978362, 0.383505, -0.7445222, 0.8784314, 1, 0, 1,
-0.8975683, -0.5237448, -2.32963, 0.8705882, 1, 0, 1,
-0.8970352, -1.162962, -2.934558, 0.8666667, 1, 0, 1,
-0.88397, -0.3968251, -2.664266, 0.8588235, 1, 0, 1,
-0.8837164, -0.2551909, -1.258548, 0.854902, 1, 0, 1,
-0.8807951, -0.3208072, -0.6907544, 0.8470588, 1, 0, 1,
-0.8750548, -0.3434381, -2.018876, 0.8431373, 1, 0, 1,
-0.8747819, -0.2151671, -2.243909, 0.8352941, 1, 0, 1,
-0.8735504, -0.1727471, -1.47626, 0.8313726, 1, 0, 1,
-0.8684292, 0.4023828, -0.6744199, 0.8235294, 1, 0, 1,
-0.8678473, -0.2841278, -1.583388, 0.8196079, 1, 0, 1,
-0.8663001, 1.077839, -0.3781693, 0.8117647, 1, 0, 1,
-0.8650991, -0.9812943, -2.438127, 0.8078431, 1, 0, 1,
-0.8640678, 1.290985, 0.4855079, 0.8, 1, 0, 1,
-0.8621583, 0.5363927, -1.002684, 0.7921569, 1, 0, 1,
-0.8610712, 1.912572, 0.2510486, 0.7882353, 1, 0, 1,
-0.8579546, -1.56595, -1.058635, 0.7803922, 1, 0, 1,
-0.8541194, -0.2924498, -0.761892, 0.7764706, 1, 0, 1,
-0.847461, 1.393088, -1.319591, 0.7686275, 1, 0, 1,
-0.84378, 0.5814549, 0.9247712, 0.7647059, 1, 0, 1,
-0.8409889, -0.2682527, -1.393856, 0.7568628, 1, 0, 1,
-0.840377, 0.9207976, 0.510273, 0.7529412, 1, 0, 1,
-0.8402442, -1.576744, -3.426217, 0.7450981, 1, 0, 1,
-0.8374165, -0.1289754, -1.794216, 0.7411765, 1, 0, 1,
-0.8297635, -0.353329, -2.573688, 0.7333333, 1, 0, 1,
-0.829196, 0.2585912, -1.686741, 0.7294118, 1, 0, 1,
-0.828992, -1.692626, -1.50128, 0.7215686, 1, 0, 1,
-0.8258677, 1.445248, 0.2517208, 0.7176471, 1, 0, 1,
-0.8245204, 1.695335, 0.3892088, 0.7098039, 1, 0, 1,
-0.8226016, 0.5169437, -1.034151, 0.7058824, 1, 0, 1,
-0.8218108, 0.06885824, -0.8846154, 0.6980392, 1, 0, 1,
-0.8140301, -1.254606, -1.892872, 0.6901961, 1, 0, 1,
-0.8134872, -0.08771083, -1.274623, 0.6862745, 1, 0, 1,
-0.8128119, -0.06986449, -2.54594, 0.6784314, 1, 0, 1,
-0.8118957, 0.1931554, -1.345419, 0.6745098, 1, 0, 1,
-0.808682, 0.02643297, -1.672755, 0.6666667, 1, 0, 1,
-0.8064343, 0.1262675, -0.1009782, 0.6627451, 1, 0, 1,
-0.8061042, -1.174277, -2.915419, 0.654902, 1, 0, 1,
-0.7998834, -0.193419, -2.086509, 0.6509804, 1, 0, 1,
-0.7996153, 0.9412582, 0.9048025, 0.6431373, 1, 0, 1,
-0.7989148, -0.4768651, -3.043935, 0.6392157, 1, 0, 1,
-0.7989064, -1.426935, -2.286778, 0.6313726, 1, 0, 1,
-0.7911354, -0.3294482, -2.326549, 0.627451, 1, 0, 1,
-0.7878761, -0.7061657, -1.185976, 0.6196079, 1, 0, 1,
-0.785354, 0.1363903, -0.6546786, 0.6156863, 1, 0, 1,
-0.7742623, -0.4737242, -3.480011, 0.6078432, 1, 0, 1,
-0.7737277, -1.299846, -4.072884, 0.6039216, 1, 0, 1,
-0.7735462, 1.611827, -0.3344851, 0.5960785, 1, 0, 1,
-0.7657968, -0.7613621, -2.007886, 0.5882353, 1, 0, 1,
-0.7518515, 0.4147353, -1.184754, 0.5843138, 1, 0, 1,
-0.7514251, -1.056466, -1.12174, 0.5764706, 1, 0, 1,
-0.7473724, -2.132438, -1.69598, 0.572549, 1, 0, 1,
-0.745936, -0.4244256, -0.9299197, 0.5647059, 1, 0, 1,
-0.742987, -1.386297, -1.788474, 0.5607843, 1, 0, 1,
-0.7422674, 1.222031, 1.323663, 0.5529412, 1, 0, 1,
-0.732165, 0.1754935, -1.536434, 0.5490196, 1, 0, 1,
-0.728544, -1.68703, -4.226999, 0.5411765, 1, 0, 1,
-0.7281303, 0.3233894, -0.9451362, 0.5372549, 1, 0, 1,
-0.7280014, -0.5237023, -3.839367, 0.5294118, 1, 0, 1,
-0.7251108, -0.400552, -1.03869, 0.5254902, 1, 0, 1,
-0.7240025, 1.334866, -1.167957, 0.5176471, 1, 0, 1,
-0.7231908, -0.436787, -1.944207, 0.5137255, 1, 0, 1,
-0.7192621, 0.558874, -0.2887402, 0.5058824, 1, 0, 1,
-0.7183137, -0.02264793, -1.273251, 0.5019608, 1, 0, 1,
-0.7180394, 1.79639, 0.1752806, 0.4941176, 1, 0, 1,
-0.7174814, 0.1216888, -0.1047652, 0.4862745, 1, 0, 1,
-0.7115872, -0.7911555, -2.398904, 0.4823529, 1, 0, 1,
-0.7104456, 1.588296, -1.279517, 0.4745098, 1, 0, 1,
-0.707204, 0.06045777, -2.179468, 0.4705882, 1, 0, 1,
-0.7063776, 0.3531823, -1.776251, 0.4627451, 1, 0, 1,
-0.7063034, 0.7012998, -0.9796725, 0.4588235, 1, 0, 1,
-0.705138, -0.3654127, -1.121339, 0.4509804, 1, 0, 1,
-0.7033033, -1.456339, -3.792106, 0.4470588, 1, 0, 1,
-0.7020345, 0.9947376, 2.199186, 0.4392157, 1, 0, 1,
-0.7012951, 0.493876, -0.04453347, 0.4352941, 1, 0, 1,
-0.6974609, 1.65098, -0.6342487, 0.427451, 1, 0, 1,
-0.6924729, -0.464216, -2.507182, 0.4235294, 1, 0, 1,
-0.6784583, 1.026428, -1.606372, 0.4156863, 1, 0, 1,
-0.6774093, 1.48965, 0.4383511, 0.4117647, 1, 0, 1,
-0.6697018, 0.8537052, -0.4330459, 0.4039216, 1, 0, 1,
-0.6654621, -1.557517, -3.319964, 0.3960784, 1, 0, 1,
-0.6631858, -0.7685143, -1.240497, 0.3921569, 1, 0, 1,
-0.663038, -1.123937, -3.127301, 0.3843137, 1, 0, 1,
-0.6604705, 0.3341015, -0.3242333, 0.3803922, 1, 0, 1,
-0.6603437, -0.1897848, -0.9816976, 0.372549, 1, 0, 1,
-0.6600064, 1.528201, 0.5081419, 0.3686275, 1, 0, 1,
-0.6559786, -0.1300871, -1.524815, 0.3607843, 1, 0, 1,
-0.6540713, -0.5158509, -2.790014, 0.3568628, 1, 0, 1,
-0.6536399, 1.034979, -1.056396, 0.3490196, 1, 0, 1,
-0.6454061, -0.6455738, -1.876548, 0.345098, 1, 0, 1,
-0.6401598, 0.7016963, -1.283938, 0.3372549, 1, 0, 1,
-0.6400951, 0.3060901, -0.01679635, 0.3333333, 1, 0, 1,
-0.6369472, -0.4008241, -3.286424, 0.3254902, 1, 0, 1,
-0.6353053, -0.2725312, -2.215943, 0.3215686, 1, 0, 1,
-0.6327419, 1.056688, 0.05115794, 0.3137255, 1, 0, 1,
-0.6323856, 0.4695024, -2.635593, 0.3098039, 1, 0, 1,
-0.6303656, 0.8930476, 0.8157298, 0.3019608, 1, 0, 1,
-0.6297365, 0.5868236, -1.460777, 0.2941177, 1, 0, 1,
-0.6257415, 1.081548, -0.5509365, 0.2901961, 1, 0, 1,
-0.6091904, -1.237733, -2.270162, 0.282353, 1, 0, 1,
-0.6079173, 0.09684755, -0.4623662, 0.2784314, 1, 0, 1,
-0.6054851, -1.877458, -1.294907, 0.2705882, 1, 0, 1,
-0.5967284, -2.037724, -1.939512, 0.2666667, 1, 0, 1,
-0.596659, 1.876961, 0.68313, 0.2588235, 1, 0, 1,
-0.5957648, 2.495334, 0.6512039, 0.254902, 1, 0, 1,
-0.5953547, 0.5060233, -1.916541, 0.2470588, 1, 0, 1,
-0.5922258, 0.2652094, -1.081605, 0.2431373, 1, 0, 1,
-0.5907427, -0.1024758, -1.464088, 0.2352941, 1, 0, 1,
-0.5831499, 1.374693, -1.537818, 0.2313726, 1, 0, 1,
-0.5828205, 0.4892572, -2.745915, 0.2235294, 1, 0, 1,
-0.5812019, 0.4596309, -1.047175, 0.2196078, 1, 0, 1,
-0.579438, -0.4643718, -2.213687, 0.2117647, 1, 0, 1,
-0.573469, 2.100852, -1.283049, 0.2078431, 1, 0, 1,
-0.5727185, -0.3465815, -3.190853, 0.2, 1, 0, 1,
-0.5716169, -0.6901419, -2.618188, 0.1921569, 1, 0, 1,
-0.5710075, 0.2049845, -2.348639, 0.1882353, 1, 0, 1,
-0.5706788, -0.2946285, -0.9911462, 0.1803922, 1, 0, 1,
-0.5702001, 0.1806607, -1.170392, 0.1764706, 1, 0, 1,
-0.5696765, -1.755977, -2.369991, 0.1686275, 1, 0, 1,
-0.5688961, -0.5647833, -4.303727, 0.1647059, 1, 0, 1,
-0.5684223, -2.997764, -2.051116, 0.1568628, 1, 0, 1,
-0.5622373, -0.1959501, -2.83204, 0.1529412, 1, 0, 1,
-0.5599347, -1.046341, -2.000364, 0.145098, 1, 0, 1,
-0.5485904, -0.8639124, -2.286961, 0.1411765, 1, 0, 1,
-0.5475718, -1.202182, -3.75976, 0.1333333, 1, 0, 1,
-0.5451763, 0.8992919, 0.4229149, 0.1294118, 1, 0, 1,
-0.5450295, -1.076294, -4.483851, 0.1215686, 1, 0, 1,
-0.5407246, -1.03188, -0.4576463, 0.1176471, 1, 0, 1,
-0.5402783, 1.12473, -2.294629, 0.1098039, 1, 0, 1,
-0.5396777, -2.017919, -3.844717, 0.1058824, 1, 0, 1,
-0.5375059, 1.092998, -0.8717436, 0.09803922, 1, 0, 1,
-0.5365996, -0.293263, -2.350919, 0.09019608, 1, 0, 1,
-0.5314878, -0.6800418, -2.926488, 0.08627451, 1, 0, 1,
-0.5207386, 1.283976, 0.5726054, 0.07843138, 1, 0, 1,
-0.5177491, 0.8462592, -2.657139, 0.07450981, 1, 0, 1,
-0.5081304, 0.8668602, -0.5378696, 0.06666667, 1, 0, 1,
-0.5037566, 0.712136, 0.3403232, 0.0627451, 1, 0, 1,
-0.5025476, -1.792094, -4.448005, 0.05490196, 1, 0, 1,
-0.5018461, 0.1750932, -3.564376, 0.05098039, 1, 0, 1,
-0.5015777, 1.035739, 0.241963, 0.04313726, 1, 0, 1,
-0.5007275, -0.7306495, -3.889769, 0.03921569, 1, 0, 1,
-0.4989676, 0.1780044, 1.553334, 0.03137255, 1, 0, 1,
-0.4986174, -0.16218, -1.496213, 0.02745098, 1, 0, 1,
-0.4978434, 1.164132, -0.4510463, 0.01960784, 1, 0, 1,
-0.49716, -0.1642712, -2.246683, 0.01568628, 1, 0, 1,
-0.4929218, 0.8531687, -1.408548, 0.007843138, 1, 0, 1,
-0.492839, 0.2350852, -1.804574, 0.003921569, 1, 0, 1,
-0.4926906, -0.3511811, -2.280079, 0, 1, 0.003921569, 1,
-0.4910376, 1.365188, -1.164385, 0, 1, 0.01176471, 1,
-0.4904883, 2.232969, -0.1615954, 0, 1, 0.01568628, 1,
-0.4869186, -0.01394597, -1.93859, 0, 1, 0.02352941, 1,
-0.481966, -1.273602, -2.488388, 0, 1, 0.02745098, 1,
-0.4800254, -0.8008136, -4.862476, 0, 1, 0.03529412, 1,
-0.4787539, 0.06856678, -0.8476635, 0, 1, 0.03921569, 1,
-0.4723931, -0.002300626, -0.4085133, 0, 1, 0.04705882, 1,
-0.4700148, 0.5611186, -0.3543873, 0, 1, 0.05098039, 1,
-0.4689033, -1.850598, -1.672463, 0, 1, 0.05882353, 1,
-0.467226, -0.9153001, -2.616466, 0, 1, 0.0627451, 1,
-0.466673, 1.059116, -0.6949989, 0, 1, 0.07058824, 1,
-0.4658495, -2.083484, -3.224571, 0, 1, 0.07450981, 1,
-0.4595062, -0.2588701, -0.4070176, 0, 1, 0.08235294, 1,
-0.4578192, 0.8450679, -0.9714419, 0, 1, 0.08627451, 1,
-0.4530433, -2.473086, -1.720764, 0, 1, 0.09411765, 1,
-0.452705, -0.3959513, -2.311754, 0, 1, 0.1019608, 1,
-0.4507075, -1.72651, -2.064864, 0, 1, 0.1058824, 1,
-0.4470306, -0.2673655, -1.26491, 0, 1, 0.1137255, 1,
-0.4468063, 1.638259, -0.7174788, 0, 1, 0.1176471, 1,
-0.4462492, 0.5698076, 0.05546974, 0, 1, 0.1254902, 1,
-0.445086, 2.557304, -0.2477535, 0, 1, 0.1294118, 1,
-0.4412372, -0.1243633, -0.9682333, 0, 1, 0.1372549, 1,
-0.4386697, 1.752719, 0.2680804, 0, 1, 0.1411765, 1,
-0.4374911, -0.1081321, -3.301387, 0, 1, 0.1490196, 1,
-0.4374891, -0.4329094, -0.5513831, 0, 1, 0.1529412, 1,
-0.4349359, 1.351812, -0.2208395, 0, 1, 0.1607843, 1,
-0.4318129, -1.890548, -2.02495, 0, 1, 0.1647059, 1,
-0.4189065, -2.217274, -3.225762, 0, 1, 0.172549, 1,
-0.412264, -0.2719014, -1.883951, 0, 1, 0.1764706, 1,
-0.4112686, -1.169108, -1.369974, 0, 1, 0.1843137, 1,
-0.4040374, 0.02930682, -0.7422401, 0, 1, 0.1882353, 1,
-0.4035435, -0.25191, -0.3156207, 0, 1, 0.1960784, 1,
-0.4028348, 1.706593, 1.581337, 0, 1, 0.2039216, 1,
-0.4010862, 1.233734, -0.2531871, 0, 1, 0.2078431, 1,
-0.4005991, -0.282549, -2.572948, 0, 1, 0.2156863, 1,
-0.4005623, 0.5166352, 0.2288125, 0, 1, 0.2196078, 1,
-0.3989553, -0.02377689, -1.971393, 0, 1, 0.227451, 1,
-0.3987445, 0.3562583, -1.74963, 0, 1, 0.2313726, 1,
-0.3962192, -0.325864, -2.158793, 0, 1, 0.2392157, 1,
-0.3935125, -1.321366, -2.811688, 0, 1, 0.2431373, 1,
-0.3924799, -1.206292, -2.989074, 0, 1, 0.2509804, 1,
-0.3840719, -0.1136022, -1.327788, 0, 1, 0.254902, 1,
-0.3823234, -1.569009, -1.535823, 0, 1, 0.2627451, 1,
-0.3820578, 1.836966, 0.2734068, 0, 1, 0.2666667, 1,
-0.3795485, -0.101569, -0.8149532, 0, 1, 0.2745098, 1,
-0.3782649, -0.846069, -3.65944, 0, 1, 0.2784314, 1,
-0.3770489, -1.052335, -2.882948, 0, 1, 0.2862745, 1,
-0.3743897, -0.6014528, -1.979176, 0, 1, 0.2901961, 1,
-0.3689605, -0.5910543, -1.48667, 0, 1, 0.2980392, 1,
-0.3655971, 0.9132062, -0.1319463, 0, 1, 0.3058824, 1,
-0.3651777, -0.1646162, -3.307057, 0, 1, 0.3098039, 1,
-0.3544928, 0.6422794, 0.9864902, 0, 1, 0.3176471, 1,
-0.3531385, 0.3083773, -0.4597546, 0, 1, 0.3215686, 1,
-0.3526123, 1.735006, -0.9934326, 0, 1, 0.3294118, 1,
-0.3512687, 1.198697, -0.1474028, 0, 1, 0.3333333, 1,
-0.3510937, -0.2809839, -2.909531, 0, 1, 0.3411765, 1,
-0.3489519, 0.4072043, -0.5787672, 0, 1, 0.345098, 1,
-0.3486997, 1.285448, 0.1304046, 0, 1, 0.3529412, 1,
-0.3464731, 0.3529127, -0.8837333, 0, 1, 0.3568628, 1,
-0.3351086, -0.8047028, -3.065823, 0, 1, 0.3647059, 1,
-0.3335513, -1.54891, -3.322091, 0, 1, 0.3686275, 1,
-0.3321015, 0.2162258, 0.303019, 0, 1, 0.3764706, 1,
-0.331264, 0.560551, -1.869802, 0, 1, 0.3803922, 1,
-0.3298345, 0.4019217, 1.298028, 0, 1, 0.3882353, 1,
-0.3266563, -1.086836, -3.35725, 0, 1, 0.3921569, 1,
-0.3224815, 1.914617, -0.1089529, 0, 1, 0.4, 1,
-0.3186162, 0.6295058, -0.6676146, 0, 1, 0.4078431, 1,
-0.3178799, 1.232731, -0.1043154, 0, 1, 0.4117647, 1,
-0.313285, 0.7592379, -0.7412073, 0, 1, 0.4196078, 1,
-0.3118483, 0.6246536, -0.997077, 0, 1, 0.4235294, 1,
-0.3113472, 0.8320464, 0.5869494, 0, 1, 0.4313726, 1,
-0.3095232, 0.2116117, -0.5300697, 0, 1, 0.4352941, 1,
-0.3091923, 0.5451006, -2.018033, 0, 1, 0.4431373, 1,
-0.3054855, 0.2097673, -1.737463, 0, 1, 0.4470588, 1,
-0.3033172, -1.786165, -2.789141, 0, 1, 0.454902, 1,
-0.3032563, 0.6672151, -0.4973157, 0, 1, 0.4588235, 1,
-0.2997417, 0.9803714, 0.9845755, 0, 1, 0.4666667, 1,
-0.294389, -1.153534, -2.828733, 0, 1, 0.4705882, 1,
-0.2929985, 1.150954, 0.7090522, 0, 1, 0.4784314, 1,
-0.2922836, 0.8541635, -0.756654, 0, 1, 0.4823529, 1,
-0.285826, -0.1805212, -3.170316, 0, 1, 0.4901961, 1,
-0.2846892, -0.9728349, -0.9186915, 0, 1, 0.4941176, 1,
-0.2799229, 0.9740061, 1.726448, 0, 1, 0.5019608, 1,
-0.2765411, -0.3527519, -2.366709, 0, 1, 0.509804, 1,
-0.2753779, 0.9451748, 0.6868705, 0, 1, 0.5137255, 1,
-0.2742977, -0.9589892, -2.269614, 0, 1, 0.5215687, 1,
-0.2724337, -0.4264898, -1.98331, 0, 1, 0.5254902, 1,
-0.2695847, -0.34383, -1.377315, 0, 1, 0.5333334, 1,
-0.267018, 0.3107584, -1.902632, 0, 1, 0.5372549, 1,
-0.2665631, -0.1723656, -1.595597, 0, 1, 0.5450981, 1,
-0.2653646, -0.419609, -1.574242, 0, 1, 0.5490196, 1,
-0.2652049, -1.323514, -4.454602, 0, 1, 0.5568628, 1,
-0.2625448, -0.4164098, -2.604294, 0, 1, 0.5607843, 1,
-0.2600671, -0.2678594, -3.17115, 0, 1, 0.5686275, 1,
-0.2582932, 0.6711364, 1.589767, 0, 1, 0.572549, 1,
-0.2578449, 0.7672974, 0.1022735, 0, 1, 0.5803922, 1,
-0.2578025, 1.518245, -1.399372, 0, 1, 0.5843138, 1,
-0.2559521, -0.9927792, -3.009938, 0, 1, 0.5921569, 1,
-0.2513418, -0.2719492, -4.032935, 0, 1, 0.5960785, 1,
-0.2498574, -0.717637, -3.204725, 0, 1, 0.6039216, 1,
-0.2485291, 1.385648, -1.983192, 0, 1, 0.6117647, 1,
-0.247834, 0.2375431, -0.3970438, 0, 1, 0.6156863, 1,
-0.2477466, 0.3700523, -2.175115, 0, 1, 0.6235294, 1,
-0.2429825, -0.1459869, -2.511119, 0, 1, 0.627451, 1,
-0.2424019, 2.448233, 0.07368925, 0, 1, 0.6352941, 1,
-0.2404511, -0.5226276, -3.551143, 0, 1, 0.6392157, 1,
-0.2393056, 0.0811028, -0.4907188, 0, 1, 0.6470588, 1,
-0.237, -0.3282291, -2.232246, 0, 1, 0.6509804, 1,
-0.2366897, -0.3428037, -2.084845, 0, 1, 0.6588235, 1,
-0.2345383, -0.5810053, -2.669936, 0, 1, 0.6627451, 1,
-0.2263382, -0.4930373, -3.094597, 0, 1, 0.6705883, 1,
-0.2237481, 0.06871472, -0.9787037, 0, 1, 0.6745098, 1,
-0.2231052, 1.186357, 1.744836, 0, 1, 0.682353, 1,
-0.2202262, 0.3986498, 0.688271, 0, 1, 0.6862745, 1,
-0.2201353, -0.4573518, -3.282488, 0, 1, 0.6941177, 1,
-0.2165011, 0.3951843, -1.841985, 0, 1, 0.7019608, 1,
-0.2109636, -1.465053, -2.771522, 0, 1, 0.7058824, 1,
-0.209047, -0.9791293, -4.888793, 0, 1, 0.7137255, 1,
-0.2085102, 0.3725585, 0.4321735, 0, 1, 0.7176471, 1,
-0.2058097, 0.7027956, -1.472587, 0, 1, 0.7254902, 1,
-0.2057435, -1.168902, -3.837701, 0, 1, 0.7294118, 1,
-0.199248, 0.8425747, 1.253084, 0, 1, 0.7372549, 1,
-0.1965969, -0.826581, -1.966012, 0, 1, 0.7411765, 1,
-0.1938407, 0.6941979, 1.525702, 0, 1, 0.7490196, 1,
-0.1898726, -0.9972515, -3.400972, 0, 1, 0.7529412, 1,
-0.1892293, -1.365968, -2.772564, 0, 1, 0.7607843, 1,
-0.1874405, -0.4923764, -0.9477637, 0, 1, 0.7647059, 1,
-0.1854061, 0.1499323, -1.014044, 0, 1, 0.772549, 1,
-0.1825642, 0.2478349, 0.2832659, 0, 1, 0.7764706, 1,
-0.1819647, -0.4366596, -4.486125, 0, 1, 0.7843137, 1,
-0.1782775, -0.1669209, -1.066697, 0, 1, 0.7882353, 1,
-0.1754073, 0.7711678, 0.6796598, 0, 1, 0.7960784, 1,
-0.1736328, 0.1278891, -1.462664, 0, 1, 0.8039216, 1,
-0.1734224, -0.7671897, -3.524018, 0, 1, 0.8078431, 1,
-0.1684287, 1.444326, 0.6489161, 0, 1, 0.8156863, 1,
-0.1676878, -0.7659473, -3.139946, 0, 1, 0.8196079, 1,
-0.1616197, -0.4031512, -2.287262, 0, 1, 0.827451, 1,
-0.1581683, 0.7280751, 0.3514483, 0, 1, 0.8313726, 1,
-0.1557856, 0.5685624, -1.394754, 0, 1, 0.8392157, 1,
-0.1496193, 1.538152, -0.2950542, 0, 1, 0.8431373, 1,
-0.1488772, 0.6704227, 0.2811942, 0, 1, 0.8509804, 1,
-0.1470607, 0.6252573, 2.152535, 0, 1, 0.854902, 1,
-0.1442448, -1.283889, -4.564861, 0, 1, 0.8627451, 1,
-0.143631, 0.3205938, -0.3555494, 0, 1, 0.8666667, 1,
-0.1407262, -0.5891459, -4.476322, 0, 1, 0.8745098, 1,
-0.1406302, -1.085321, -2.809803, 0, 1, 0.8784314, 1,
-0.1388044, 1.202906, -0.7017816, 0, 1, 0.8862745, 1,
-0.1351946, 0.7945921, 1.175049, 0, 1, 0.8901961, 1,
-0.1345476, -1.187513, -2.999929, 0, 1, 0.8980392, 1,
-0.1300837, 1.401699, -1.514275, 0, 1, 0.9058824, 1,
-0.128886, 0.8784578, -0.2751448, 0, 1, 0.9098039, 1,
-0.1258843, -0.3545485, -1.875632, 0, 1, 0.9176471, 1,
-0.1213701, 0.8774581, -1.461161, 0, 1, 0.9215686, 1,
-0.1208878, -0.2732401, -1.324857, 0, 1, 0.9294118, 1,
-0.1185299, 1.291811, -0.2151644, 0, 1, 0.9333333, 1,
-0.1163268, 1.346294, 1.448237, 0, 1, 0.9411765, 1,
-0.1146451, -1.544416, -3.24335, 0, 1, 0.945098, 1,
-0.1132689, 0.3827375, -0.217043, 0, 1, 0.9529412, 1,
-0.1130616, 0.578163, 0.4289396, 0, 1, 0.9568627, 1,
-0.109732, 0.1178406, -1.07475, 0, 1, 0.9647059, 1,
-0.1083258, -0.717527, -3.11223, 0, 1, 0.9686275, 1,
-0.1032456, -0.08199534, -1.362135, 0, 1, 0.9764706, 1,
-0.1022149, -0.9380639, -3.867965, 0, 1, 0.9803922, 1,
-0.1012195, -0.335164, -3.147918, 0, 1, 0.9882353, 1,
-0.1010813, 0.006158425, -2.43097, 0, 1, 0.9921569, 1,
-0.1004418, 1.250452, -0.3536857, 0, 1, 1, 1,
-0.09934636, 0.2664408, -0.2272869, 0, 0.9921569, 1, 1,
-0.0987255, -0.4382988, -2.40254, 0, 0.9882353, 1, 1,
-0.09600414, -2.595595, -2.935187, 0, 0.9803922, 1, 1,
-0.09531906, 2.748557, 2.095213, 0, 0.9764706, 1, 1,
-0.09391546, 0.8631893, -1.204864, 0, 0.9686275, 1, 1,
-0.09069904, -0.454304, -2.784153, 0, 0.9647059, 1, 1,
-0.08984826, 0.6954265, -0.5545688, 0, 0.9568627, 1, 1,
-0.08845017, 0.2325898, 0.1233254, 0, 0.9529412, 1, 1,
-0.08782285, -0.5440539, -3.073811, 0, 0.945098, 1, 1,
-0.0856609, -0.1197772, -3.473053, 0, 0.9411765, 1, 1,
-0.08400732, -1.133737, -3.055799, 0, 0.9333333, 1, 1,
-0.08238705, -0.3580732, -2.892127, 0, 0.9294118, 1, 1,
-0.08072586, -0.4564828, -4.245628, 0, 0.9215686, 1, 1,
-0.08058663, 0.05822616, 0.1618935, 0, 0.9176471, 1, 1,
-0.07682609, -0.653892, -1.559706, 0, 0.9098039, 1, 1,
-0.07579596, 0.08258037, -2.881487, 0, 0.9058824, 1, 1,
-0.07180852, 2.043548, 0.129482, 0, 0.8980392, 1, 1,
-0.07178872, 0.1618122, -0.0853213, 0, 0.8901961, 1, 1,
-0.07144874, 0.4226571, -1.511164, 0, 0.8862745, 1, 1,
-0.07086661, 0.9881399, 0.565599, 0, 0.8784314, 1, 1,
-0.06466019, 0.585875, -0.02832677, 0, 0.8745098, 1, 1,
-0.06231539, -0.7100371, -2.375004, 0, 0.8666667, 1, 1,
-0.05591178, 0.02670891, -2.12127, 0, 0.8627451, 1, 1,
-0.05226082, -0.3113021, -3.828739, 0, 0.854902, 1, 1,
-0.04919691, 0.6245446, -0.9119313, 0, 0.8509804, 1, 1,
-0.04884264, 1.461032, 0.5925411, 0, 0.8431373, 1, 1,
-0.04656358, 1.759587, -0.7721121, 0, 0.8392157, 1, 1,
-0.02621859, -1.269657, -3.677381, 0, 0.8313726, 1, 1,
-0.02338255, -0.350439, -3.288856, 0, 0.827451, 1, 1,
-0.02102133, -0.1184879, -1.853623, 0, 0.8196079, 1, 1,
-0.02072898, -0.1130188, -4.090481, 0, 0.8156863, 1, 1,
-0.0197877, 0.4685855, 0.4104951, 0, 0.8078431, 1, 1,
-0.009227335, 0.1266193, -1.375596, 0, 0.8039216, 1, 1,
-0.008053211, 0.2706812, 1.288749, 0, 0.7960784, 1, 1,
-0.004534267, 1.229943, 0.01883685, 0, 0.7882353, 1, 1,
-0.004081012, -0.6585456, -4.719728, 0, 0.7843137, 1, 1,
0.003896935, 0.04605903, -0.2931684, 0, 0.7764706, 1, 1,
0.004222902, 0.4990728, -2.13096, 0, 0.772549, 1, 1,
0.00635402, 0.8360589, 0.4787237, 0, 0.7647059, 1, 1,
0.007404039, -0.2529438, 2.651537, 0, 0.7607843, 1, 1,
0.008528564, -2.452032, 2.536738, 0, 0.7529412, 1, 1,
0.009727214, 1.44183, -0.814899, 0, 0.7490196, 1, 1,
0.01458831, 0.8229867, 0.5987128, 0, 0.7411765, 1, 1,
0.01815598, -0.02810314, 2.691767, 0, 0.7372549, 1, 1,
0.02356694, -0.5916362, 4.083489, 0, 0.7294118, 1, 1,
0.02492262, -0.3167586, 3.864168, 0, 0.7254902, 1, 1,
0.03233358, 0.8880441, 2.311773, 0, 0.7176471, 1, 1,
0.03644202, -0.4116459, 4.149568, 0, 0.7137255, 1, 1,
0.03954785, -0.7075673, 2.671713, 0, 0.7058824, 1, 1,
0.04220648, -1.239894, 4.822017, 0, 0.6980392, 1, 1,
0.0425609, 0.7864266, 0.3014912, 0, 0.6941177, 1, 1,
0.04291829, 1.024997, -0.1081152, 0, 0.6862745, 1, 1,
0.05005238, 0.1966288, 0.2219948, 0, 0.682353, 1, 1,
0.05344095, -1.737167, 3.082943, 0, 0.6745098, 1, 1,
0.05468989, 1.133324, -0.02631787, 0, 0.6705883, 1, 1,
0.05563955, 0.1884004, 2.211129, 0, 0.6627451, 1, 1,
0.05713828, 1.935653, 0.338388, 0, 0.6588235, 1, 1,
0.05800216, 0.6009122, 0.7016147, 0, 0.6509804, 1, 1,
0.05822783, -0.4172819, 3.689598, 0, 0.6470588, 1, 1,
0.05823984, 0.1591482, -0.3758845, 0, 0.6392157, 1, 1,
0.06072075, 0.2036062, 0.5195844, 0, 0.6352941, 1, 1,
0.06107956, -0.6092361, 3.499445, 0, 0.627451, 1, 1,
0.0626269, 0.1432707, 0.2599781, 0, 0.6235294, 1, 1,
0.06320724, -0.8721375, 2.855165, 0, 0.6156863, 1, 1,
0.07049163, 1.052959, -1.005127, 0, 0.6117647, 1, 1,
0.07162024, 0.4938106, 0.9996255, 0, 0.6039216, 1, 1,
0.07377256, -1.289679, 2.883724, 0, 0.5960785, 1, 1,
0.07653974, 1.331189, 0.1209594, 0, 0.5921569, 1, 1,
0.07986969, 0.2596558, 0.2385348, 0, 0.5843138, 1, 1,
0.08034642, 3.020341, -0.04538592, 0, 0.5803922, 1, 1,
0.08146296, -0.2998832, 3.125556, 0, 0.572549, 1, 1,
0.0894459, -0.1020074, 4.238476, 0, 0.5686275, 1, 1,
0.09162007, -0.8653857, 2.023347, 0, 0.5607843, 1, 1,
0.09202804, 0.373737, 0.1940879, 0, 0.5568628, 1, 1,
0.09993084, 0.3286685, -0.3071867, 0, 0.5490196, 1, 1,
0.1033511, -1.492132, 1.791091, 0, 0.5450981, 1, 1,
0.1045676, -0.1723021, 3.571584, 0, 0.5372549, 1, 1,
0.1075957, -0.008164437, 0.9622324, 0, 0.5333334, 1, 1,
0.1076618, -0.9970673, 4.17316, 0, 0.5254902, 1, 1,
0.1120963, 0.1370243, 0.9264, 0, 0.5215687, 1, 1,
0.112923, 1.438071, 1.466905, 0, 0.5137255, 1, 1,
0.1189884, -0.5747233, 2.68547, 0, 0.509804, 1, 1,
0.1205643, 0.1717233, 0.7454051, 0, 0.5019608, 1, 1,
0.1221342, -0.3998811, 4.001928, 0, 0.4941176, 1, 1,
0.1255084, -0.2227268, 4.031214, 0, 0.4901961, 1, 1,
0.1315727, 0.5534359, -0.6915401, 0, 0.4823529, 1, 1,
0.1353935, 0.277263, -0.01117111, 0, 0.4784314, 1, 1,
0.1373408, -0.4631863, 2.670706, 0, 0.4705882, 1, 1,
0.139087, -0.2022736, 1.307768, 0, 0.4666667, 1, 1,
0.1407778, 0.6725362, 1.249965, 0, 0.4588235, 1, 1,
0.148318, -0.8574385, 1.121692, 0, 0.454902, 1, 1,
0.1500451, 0.5216747, -0.7714009, 0, 0.4470588, 1, 1,
0.1526429, -0.7145156, 2.001313, 0, 0.4431373, 1, 1,
0.1547777, -0.2719306, 3.103173, 0, 0.4352941, 1, 1,
0.157075, 1.315006, 0.3074246, 0, 0.4313726, 1, 1,
0.1581756, -1.392887, 3.534311, 0, 0.4235294, 1, 1,
0.1602461, 0.6154564, 1.24512, 0, 0.4196078, 1, 1,
0.1638537, -0.3508394, 1.924276, 0, 0.4117647, 1, 1,
0.168023, -2.321272, 1.83817, 0, 0.4078431, 1, 1,
0.1680554, -0.728472, 2.885655, 0, 0.4, 1, 1,
0.1681692, 0.1060705, 1.21993, 0, 0.3921569, 1, 1,
0.1683575, -1.099414, 0.953316, 0, 0.3882353, 1, 1,
0.1694663, -0.337498, 2.821921, 0, 0.3803922, 1, 1,
0.177065, 1.251277, 0.8425835, 0, 0.3764706, 1, 1,
0.1779087, 0.227485, 1.844857, 0, 0.3686275, 1, 1,
0.185009, -0.5619166, 2.279672, 0, 0.3647059, 1, 1,
0.1861791, 2.097972, 1.333422, 0, 0.3568628, 1, 1,
0.1874048, -0.2481962, 1.930497, 0, 0.3529412, 1, 1,
0.1897449, 1.631632, -0.07251675, 0, 0.345098, 1, 1,
0.1920083, -0.8756988, 2.157127, 0, 0.3411765, 1, 1,
0.1927127, -0.2964625, 2.484632, 0, 0.3333333, 1, 1,
0.1931977, 0.4254009, 1.350538, 0, 0.3294118, 1, 1,
0.1938563, -2.011628, 5.181882, 0, 0.3215686, 1, 1,
0.1949676, 0.2074986, 2.754504, 0, 0.3176471, 1, 1,
0.1950478, -0.78908, 3.563848, 0, 0.3098039, 1, 1,
0.2107075, -0.03398781, 0.02556801, 0, 0.3058824, 1, 1,
0.2114958, -2.211074, 4.156056, 0, 0.2980392, 1, 1,
0.2131585, 0.4165367, -0.7287465, 0, 0.2901961, 1, 1,
0.222117, 0.791067, -0.578898, 0, 0.2862745, 1, 1,
0.2232099, 0.9045916, -0.09062362, 0, 0.2784314, 1, 1,
0.2239436, -2.758287, 2.532582, 0, 0.2745098, 1, 1,
0.2268624, -1.981255, 2.349971, 0, 0.2666667, 1, 1,
0.2279319, -2.205122, 3.298069, 0, 0.2627451, 1, 1,
0.2292128, -0.2484191, 3.30299, 0, 0.254902, 1, 1,
0.2379919, -0.5241218, 2.55605, 0, 0.2509804, 1, 1,
0.2386865, 0.1414109, 2.495013, 0, 0.2431373, 1, 1,
0.2481334, -1.149065, 3.332505, 0, 0.2392157, 1, 1,
0.2523024, 0.7197213, 0.298447, 0, 0.2313726, 1, 1,
0.2554933, -0.2273643, 2.948877, 0, 0.227451, 1, 1,
0.2595585, -1.74285, 4.949832, 0, 0.2196078, 1, 1,
0.2632411, -1.314992, 4.417345, 0, 0.2156863, 1, 1,
0.2789155, 0.1814144, 1.76667, 0, 0.2078431, 1, 1,
0.2810723, 0.8225961, 2.660359, 0, 0.2039216, 1, 1,
0.2834798, 0.846301, -0.07742201, 0, 0.1960784, 1, 1,
0.2861106, -0.6751674, 3.285153, 0, 0.1882353, 1, 1,
0.2869405, 0.1565902, 0.7942746, 0, 0.1843137, 1, 1,
0.2872478, -0.5404731, 2.522254, 0, 0.1764706, 1, 1,
0.2884434, -1.63423, 2.360802, 0, 0.172549, 1, 1,
0.2885889, 0.06493991, 1.430565, 0, 0.1647059, 1, 1,
0.2919478, 0.4359952, 0.5922024, 0, 0.1607843, 1, 1,
0.292178, 1.806322, -0.04394805, 0, 0.1529412, 1, 1,
0.2926895, 0.4098266, 0.6639202, 0, 0.1490196, 1, 1,
0.2934158, -0.5269452, 2.797955, 0, 0.1411765, 1, 1,
0.2940242, -0.9902303, 2.35044, 0, 0.1372549, 1, 1,
0.2943321, -1.176155, 2.823509, 0, 0.1294118, 1, 1,
0.2963213, -0.4367756, 4.14364, 0, 0.1254902, 1, 1,
0.2965071, -1.265787, 2.257746, 0, 0.1176471, 1, 1,
0.2968287, 0.457545, -0.8391235, 0, 0.1137255, 1, 1,
0.3089859, -1.059373, 4.47331, 0, 0.1058824, 1, 1,
0.311845, -1.856139, 2.393831, 0, 0.09803922, 1, 1,
0.3133492, -0.5560958, 0.7754637, 0, 0.09411765, 1, 1,
0.315474, 1.230132, 0.8184254, 0, 0.08627451, 1, 1,
0.3174693, -0.821645, 4.439005, 0, 0.08235294, 1, 1,
0.3189001, 0.3684858, 2.189589, 0, 0.07450981, 1, 1,
0.3208344, -0.594946, 2.838059, 0, 0.07058824, 1, 1,
0.3213535, 0.6869401, 1.068039, 0, 0.0627451, 1, 1,
0.3255592, -1.368917, 3.320378, 0, 0.05882353, 1, 1,
0.3344909, 0.2709097, 0.4913237, 0, 0.05098039, 1, 1,
0.3370717, 0.1612335, 0.3885052, 0, 0.04705882, 1, 1,
0.3413446, 0.9712859, 0.705988, 0, 0.03921569, 1, 1,
0.3440618, 0.7018424, -0.5802286, 0, 0.03529412, 1, 1,
0.3440762, 0.9128256, 1.2736, 0, 0.02745098, 1, 1,
0.3454453, 0.8410829, 1.487769, 0, 0.02352941, 1, 1,
0.3464339, -0.7902219, 1.923749, 0, 0.01568628, 1, 1,
0.3506414, 0.08507462, 0.04349068, 0, 0.01176471, 1, 1,
0.3560354, 0.6451741, 2.926525, 0, 0.003921569, 1, 1,
0.356837, 0.2149011, 1.600602, 0.003921569, 0, 1, 1,
0.3571037, 1.125602, -0.168865, 0.007843138, 0, 1, 1,
0.3624398, -0.5064724, 2.67628, 0.01568628, 0, 1, 1,
0.3638321, -0.9733898, 3.010299, 0.01960784, 0, 1, 1,
0.3645955, 0.1352199, 1.412446, 0.02745098, 0, 1, 1,
0.3667668, -0.1699805, 2.212456, 0.03137255, 0, 1, 1,
0.3770287, -0.7213602, 4.02461, 0.03921569, 0, 1, 1,
0.3842785, -1.512552, 2.582894, 0.04313726, 0, 1, 1,
0.3856347, -0.1044447, 0.3212941, 0.05098039, 0, 1, 1,
0.385814, -1.008614, 3.995392, 0.05490196, 0, 1, 1,
0.3899934, -1.358378, 5.086599, 0.0627451, 0, 1, 1,
0.390316, -0.4433638, 2.040878, 0.06666667, 0, 1, 1,
0.3908643, -1.951653, 1.805571, 0.07450981, 0, 1, 1,
0.3918325, 0.3348002, 0.1201291, 0.07843138, 0, 1, 1,
0.4008764, 1.910504, -0.03136204, 0.08627451, 0, 1, 1,
0.4024751, -0.9283569, 4.278407, 0.09019608, 0, 1, 1,
0.4027228, 0.7522273, 2.009527, 0.09803922, 0, 1, 1,
0.404152, 0.1516795, 0.518637, 0.1058824, 0, 1, 1,
0.404612, -0.4085992, 2.485846, 0.1098039, 0, 1, 1,
0.4091577, 0.04155156, 0.4338037, 0.1176471, 0, 1, 1,
0.4122923, 0.07377964, 1.43855, 0.1215686, 0, 1, 1,
0.4123317, 0.3296475, 1.939928, 0.1294118, 0, 1, 1,
0.4165296, -1.069414, 1.577051, 0.1333333, 0, 1, 1,
0.4171911, -0.7387791, 2.438073, 0.1411765, 0, 1, 1,
0.4234612, 0.7869493, 0.6342748, 0.145098, 0, 1, 1,
0.4248837, 0.5118884, -1.674992, 0.1529412, 0, 1, 1,
0.4253146, 0.2369484, 2.366296, 0.1568628, 0, 1, 1,
0.4264296, 1.105455, 0.3482577, 0.1647059, 0, 1, 1,
0.4274589, -1.002552, 1.919843, 0.1686275, 0, 1, 1,
0.4301148, 0.9305252, 0.3319551, 0.1764706, 0, 1, 1,
0.4305088, 1.04563, 0.1756617, 0.1803922, 0, 1, 1,
0.437039, -0.9278681, 1.717838, 0.1882353, 0, 1, 1,
0.4373569, 0.0887069, 1.518453, 0.1921569, 0, 1, 1,
0.4392049, -1.24616, 2.427486, 0.2, 0, 1, 1,
0.4393581, 0.3004282, 0.05972771, 0.2078431, 0, 1, 1,
0.4400255, 1.383343, 2.595753, 0.2117647, 0, 1, 1,
0.4425482, 0.8904908, 0.2133619, 0.2196078, 0, 1, 1,
0.442901, 0.7230445, 1.300359, 0.2235294, 0, 1, 1,
0.4449401, -0.9894331, 2.339229, 0.2313726, 0, 1, 1,
0.4480879, -0.7140387, 2.120646, 0.2352941, 0, 1, 1,
0.4500625, -0.4596711, 4.202965, 0.2431373, 0, 1, 1,
0.4505164, 0.8633149, 1.147703, 0.2470588, 0, 1, 1,
0.4506386, -0.682807, 1.727805, 0.254902, 0, 1, 1,
0.453869, 0.7849664, -0.1458302, 0.2588235, 0, 1, 1,
0.4544395, 0.198155, 1.112125, 0.2666667, 0, 1, 1,
0.4545533, -0.3018851, 2.76536, 0.2705882, 0, 1, 1,
0.4586625, -0.05499831, 1.539249, 0.2784314, 0, 1, 1,
0.4600847, 0.3407029, 1.268192, 0.282353, 0, 1, 1,
0.4621289, 0.7729695, 0.8976221, 0.2901961, 0, 1, 1,
0.4622278, -1.207572, 3.939337, 0.2941177, 0, 1, 1,
0.4639769, -0.4983369, 4.028653, 0.3019608, 0, 1, 1,
0.4670122, 1.713189, -0.5172923, 0.3098039, 0, 1, 1,
0.4698333, 0.2292781, 0.8880259, 0.3137255, 0, 1, 1,
0.4726464, 1.28578, 0.8577237, 0.3215686, 0, 1, 1,
0.4775701, -0.7617248, 3.215521, 0.3254902, 0, 1, 1,
0.4781135, 1.383235, -1.148718, 0.3333333, 0, 1, 1,
0.4817883, 1.226814, 1.110034, 0.3372549, 0, 1, 1,
0.4824335, -0.3928462, 1.424069, 0.345098, 0, 1, 1,
0.4834452, 0.4525332, 1.337887, 0.3490196, 0, 1, 1,
0.4848663, -0.02619014, 1.324639, 0.3568628, 0, 1, 1,
0.494352, -0.9458655, 4.748375, 0.3607843, 0, 1, 1,
0.4951876, 1.21383, 0.0669077, 0.3686275, 0, 1, 1,
0.497599, -0.6514834, 3.219032, 0.372549, 0, 1, 1,
0.5004757, -1.305337, 1.718199, 0.3803922, 0, 1, 1,
0.5008958, 1.590584, 2.090714, 0.3843137, 0, 1, 1,
0.5054616, 0.04698521, 1.496072, 0.3921569, 0, 1, 1,
0.5057949, 1.282393, 1.589851, 0.3960784, 0, 1, 1,
0.5089047, 0.05010964, 1.617231, 0.4039216, 0, 1, 1,
0.5110664, -1.368159, 3.247583, 0.4117647, 0, 1, 1,
0.5141256, -1.139532, 1.636404, 0.4156863, 0, 1, 1,
0.5152334, 0.6062078, 0.5103191, 0.4235294, 0, 1, 1,
0.5169679, 0.1790135, 2.282467, 0.427451, 0, 1, 1,
0.5239923, -1.795618, 3.375704, 0.4352941, 0, 1, 1,
0.5260777, -2.02456, 4.286795, 0.4392157, 0, 1, 1,
0.5300181, -0.5739449, 3.346665, 0.4470588, 0, 1, 1,
0.5354232, 1.022568, 0.5078556, 0.4509804, 0, 1, 1,
0.5397788, -1.033349, 1.873372, 0.4588235, 0, 1, 1,
0.5430961, -0.6733522, 3.55995, 0.4627451, 0, 1, 1,
0.5460916, 0.7763971, -0.3983481, 0.4705882, 0, 1, 1,
0.5488542, 0.3371859, 1.768123, 0.4745098, 0, 1, 1,
0.5496092, -2.086663, 2.247812, 0.4823529, 0, 1, 1,
0.5521961, 1.424477, -0.6608833, 0.4862745, 0, 1, 1,
0.5534071, 0.5223872, 1.533383, 0.4941176, 0, 1, 1,
0.5558258, 0.8591209, 1.363047, 0.5019608, 0, 1, 1,
0.5601656, -0.05273736, 1.103007, 0.5058824, 0, 1, 1,
0.5607939, 0.2288276, 2.528474, 0.5137255, 0, 1, 1,
0.5614451, -0.3427711, 1.482656, 0.5176471, 0, 1, 1,
0.5622671, 0.7951581, 1.682978, 0.5254902, 0, 1, 1,
0.5640388, -1.686388, 2.806581, 0.5294118, 0, 1, 1,
0.5645594, 0.900038, 0.3944305, 0.5372549, 0, 1, 1,
0.5664278, -0.4987947, 3.106027, 0.5411765, 0, 1, 1,
0.5672076, -0.7072453, 1.884874, 0.5490196, 0, 1, 1,
0.577447, 0.1822431, 2.14431, 0.5529412, 0, 1, 1,
0.5789323, 0.5509742, -0.6796731, 0.5607843, 0, 1, 1,
0.5848826, 0.02564601, 2.212211, 0.5647059, 0, 1, 1,
0.5894821, -1.670155, 3.423559, 0.572549, 0, 1, 1,
0.5902246, 0.7658387, 0.5968325, 0.5764706, 0, 1, 1,
0.5917783, 0.3324139, 2.272968, 0.5843138, 0, 1, 1,
0.5926004, -0.2673901, 3.086733, 0.5882353, 0, 1, 1,
0.5933952, -0.01261794, 1.015234, 0.5960785, 0, 1, 1,
0.5950339, -0.04421368, 1.185213, 0.6039216, 0, 1, 1,
0.5954437, -0.5838416, 2.062123, 0.6078432, 0, 1, 1,
0.6002121, -0.9414608, 3.571579, 0.6156863, 0, 1, 1,
0.6022833, 1.03332, -0.3495935, 0.6196079, 0, 1, 1,
0.6027108, 0.03770496, 1.967855, 0.627451, 0, 1, 1,
0.6047927, -1.606385, 4.269513, 0.6313726, 0, 1, 1,
0.6070418, -2.014196, 4.435564, 0.6392157, 0, 1, 1,
0.6073425, -1.289557, 2.916415, 0.6431373, 0, 1, 1,
0.6090641, -1.092601, 2.14757, 0.6509804, 0, 1, 1,
0.6099772, 0.1097611, 1.447197, 0.654902, 0, 1, 1,
0.6164591, -0.7505281, 1.471965, 0.6627451, 0, 1, 1,
0.6173881, 0.12118, 2.063082, 0.6666667, 0, 1, 1,
0.6239126, -1.271476, 4.694642, 0.6745098, 0, 1, 1,
0.6245593, -0.8012351, 1.035484, 0.6784314, 0, 1, 1,
0.624862, -1.398479, 1.821065, 0.6862745, 0, 1, 1,
0.6280828, -0.06780446, 2.784179, 0.6901961, 0, 1, 1,
0.640415, -1.765776, 2.951043, 0.6980392, 0, 1, 1,
0.6437261, 0.7589619, 0.3320822, 0.7058824, 0, 1, 1,
0.6450098, 0.4934493, 1.462736, 0.7098039, 0, 1, 1,
0.6456536, 0.01604693, 1.773448, 0.7176471, 0, 1, 1,
0.6463249, 0.5252487, 0.7442577, 0.7215686, 0, 1, 1,
0.6513594, -1.023023, 2.282365, 0.7294118, 0, 1, 1,
0.6538005, -1.985264, 1.756669, 0.7333333, 0, 1, 1,
0.657198, -1.305245, 3.178326, 0.7411765, 0, 1, 1,
0.6595791, 0.4042124, 2.650184, 0.7450981, 0, 1, 1,
0.6596833, 0.6164896, 0.1905873, 0.7529412, 0, 1, 1,
0.6602252, 1.6331, 0.4557615, 0.7568628, 0, 1, 1,
0.6617454, 0.3060552, 0.3384628, 0.7647059, 0, 1, 1,
0.6649786, -2.268462, 2.948373, 0.7686275, 0, 1, 1,
0.6651865, 1.564093, -0.57296, 0.7764706, 0, 1, 1,
0.6685949, -1.267349, 3.803436, 0.7803922, 0, 1, 1,
0.6700069, 0.2310726, -0.2266505, 0.7882353, 0, 1, 1,
0.671069, 1.384902, 1.003568, 0.7921569, 0, 1, 1,
0.6749275, 0.9764665, 0.5946485, 0.8, 0, 1, 1,
0.6763991, 0.4437656, 1.398179, 0.8078431, 0, 1, 1,
0.6788719, 0.4129085, 1.14386, 0.8117647, 0, 1, 1,
0.686523, 0.9204828, 1.905313, 0.8196079, 0, 1, 1,
0.6974338, -1.160817, 2.001276, 0.8235294, 0, 1, 1,
0.6989347, -0.2538977, 3.263776, 0.8313726, 0, 1, 1,
0.7047173, -0.8428104, 2.412077, 0.8352941, 0, 1, 1,
0.7084558, 0.09110653, 2.089126, 0.8431373, 0, 1, 1,
0.7092245, -0.3379285, 1.888236, 0.8470588, 0, 1, 1,
0.7113039, -1.576055, 4.038883, 0.854902, 0, 1, 1,
0.7154628, 0.6374183, 1.162841, 0.8588235, 0, 1, 1,
0.7154955, -0.895319, 3.200487, 0.8666667, 0, 1, 1,
0.7175247, -0.7924553, 4.902383, 0.8705882, 0, 1, 1,
0.726, 0.03608545, 1.321254, 0.8784314, 0, 1, 1,
0.7268818, -0.9917673, 2.669835, 0.8823529, 0, 1, 1,
0.7291458, -0.1632593, 1.543213, 0.8901961, 0, 1, 1,
0.7303768, 1.236077, 0.3686151, 0.8941177, 0, 1, 1,
0.7342312, 0.07332908, 2.111275, 0.9019608, 0, 1, 1,
0.7344477, 0.8654976, 0.3697433, 0.9098039, 0, 1, 1,
0.7346043, 0.1864564, 1.933942, 0.9137255, 0, 1, 1,
0.7369205, -0.4921084, 2.665114, 0.9215686, 0, 1, 1,
0.7387013, -0.8310667, 3.004088, 0.9254902, 0, 1, 1,
0.7460127, 0.6852944, 0.8786213, 0.9333333, 0, 1, 1,
0.7484493, -1.046772, 3.036301, 0.9372549, 0, 1, 1,
0.7527847, -0.919494, 2.73526, 0.945098, 0, 1, 1,
0.7570563, 0.8007036, 0.1731292, 0.9490196, 0, 1, 1,
0.7649119, -0.6959194, 2.24969, 0.9568627, 0, 1, 1,
0.7751408, 1.954479, 2.212423, 0.9607843, 0, 1, 1,
0.7792287, -0.594308, 3.669899, 0.9686275, 0, 1, 1,
0.7805488, -0.3247912, 3.715819, 0.972549, 0, 1, 1,
0.7814186, 1.094386, 1.36668, 0.9803922, 0, 1, 1,
0.7816408, -1.042963, 2.405575, 0.9843137, 0, 1, 1,
0.7834038, 0.6257859, 0.7741644, 0.9921569, 0, 1, 1,
0.7843887, -1.492569, 4.162053, 0.9960784, 0, 1, 1,
0.7874614, 0.1196127, 1.68286, 1, 0, 0.9960784, 1,
0.7942508, -1.39084, 1.535558, 1, 0, 0.9882353, 1,
0.7990602, 0.4289607, 1.709757, 1, 0, 0.9843137, 1,
0.8022212, -1.75, 2.690649, 1, 0, 0.9764706, 1,
0.8075188, -0.2666134, 2.334206, 1, 0, 0.972549, 1,
0.8117814, -1.579804, 2.141975, 1, 0, 0.9647059, 1,
0.8254492, -1.371435, 2.306545, 1, 0, 0.9607843, 1,
0.8259307, -0.1409454, 1.179329, 1, 0, 0.9529412, 1,
0.83446, 0.1597188, 2.525635, 1, 0, 0.9490196, 1,
0.8363328, -0.7105651, 2.029138, 1, 0, 0.9411765, 1,
0.8381572, 0.5302876, 1.586421, 1, 0, 0.9372549, 1,
0.8395298, -1.162734, 3.014646, 1, 0, 0.9294118, 1,
0.8431841, -1.371331, 2.092411, 1, 0, 0.9254902, 1,
0.8459745, 2.035859, -0.9707599, 1, 0, 0.9176471, 1,
0.8479724, -0.3798731, 2.875887, 1, 0, 0.9137255, 1,
0.8562554, 1.767313, -0.04300737, 1, 0, 0.9058824, 1,
0.857828, -0.9566109, 4.170646, 1, 0, 0.9019608, 1,
0.8679003, 0.3605781, 2.422906, 1, 0, 0.8941177, 1,
0.8699376, 0.3856594, 0.7965297, 1, 0, 0.8862745, 1,
0.8748172, -0.1585778, 3.370787, 1, 0, 0.8823529, 1,
0.8780352, 0.1158865, 2.177857, 1, 0, 0.8745098, 1,
0.8855911, -1.579049, 3.53716, 1, 0, 0.8705882, 1,
0.8872079, 1.361987, 0.88535, 1, 0, 0.8627451, 1,
0.8958049, -0.7638025, 2.24997, 1, 0, 0.8588235, 1,
0.9031072, 0.0876996, 0.7336117, 1, 0, 0.8509804, 1,
0.9053662, 2.195672, 1.945521, 1, 0, 0.8470588, 1,
0.9086027, -2.192278, 3.436948, 1, 0, 0.8392157, 1,
0.9293293, -0.3557224, 1.108937, 1, 0, 0.8352941, 1,
0.932192, 1.020186, -0.07265471, 1, 0, 0.827451, 1,
0.9331499, 0.6522174, 0.8121008, 1, 0, 0.8235294, 1,
0.9360194, 1.119124, 0.3278418, 1, 0, 0.8156863, 1,
0.9570792, 0.5130465, 0.1728602, 1, 0, 0.8117647, 1,
0.9702111, 1.850079, 2.002434, 1, 0, 0.8039216, 1,
0.9702343, -3.976394, 3.16754, 1, 0, 0.7960784, 1,
0.9724336, 0.2248921, 1.182659, 1, 0, 0.7921569, 1,
0.9737296, 0.6112, 2.769334, 1, 0, 0.7843137, 1,
0.9779121, 0.1979497, 0.8507413, 1, 0, 0.7803922, 1,
0.9793577, 0.8914, -0.01280628, 1, 0, 0.772549, 1,
0.9827607, 0.03936956, 1.025678, 1, 0, 0.7686275, 1,
0.9868015, -0.1008831, 2.404833, 1, 0, 0.7607843, 1,
1.00585, -0.04277881, 2.189763, 1, 0, 0.7568628, 1,
1.008822, 0.6279274, 1.628186, 1, 0, 0.7490196, 1,
1.02727, 0.6234624, 0.4544197, 1, 0, 0.7450981, 1,
1.037556, -0.561515, 2.711383, 1, 0, 0.7372549, 1,
1.039739, -0.7384931, 1.680934, 1, 0, 0.7333333, 1,
1.040337, -0.04624685, 1.874005, 1, 0, 0.7254902, 1,
1.042126, -0.5351841, 1.264877, 1, 0, 0.7215686, 1,
1.048661, -1.579611, 3.575124, 1, 0, 0.7137255, 1,
1.057708, 0.2312878, 2.968881, 1, 0, 0.7098039, 1,
1.063837, -0.9942272, 2.972831, 1, 0, 0.7019608, 1,
1.085875, -0.7580082, 1.148347, 1, 0, 0.6941177, 1,
1.097048, 0.3140455, 0.324382, 1, 0, 0.6901961, 1,
1.097605, -0.1689216, 2.414991, 1, 0, 0.682353, 1,
1.098699, 1.835477, -0.09169675, 1, 0, 0.6784314, 1,
1.103191, -1.307627, 0.9614427, 1, 0, 0.6705883, 1,
1.105188, -1.018242, 2.262362, 1, 0, 0.6666667, 1,
1.115805, 0.07799202, 1.214396, 1, 0, 0.6588235, 1,
1.125693, -1.199682, 2.088257, 1, 0, 0.654902, 1,
1.128037, 0.8510978, 2.395781, 1, 0, 0.6470588, 1,
1.130024, 0.0230049, 0.962078, 1, 0, 0.6431373, 1,
1.137182, -0.6147898, 2.748291, 1, 0, 0.6352941, 1,
1.14632, -1.245946, 2.32754, 1, 0, 0.6313726, 1,
1.149113, -0.02582995, 0.5320154, 1, 0, 0.6235294, 1,
1.159554, -1.466687, 2.045132, 1, 0, 0.6196079, 1,
1.163334, 0.2177655, -0.4430031, 1, 0, 0.6117647, 1,
1.170171, -0.6576113, 0.7611046, 1, 0, 0.6078432, 1,
1.174245, 0.2059493, 3.606086, 1, 0, 0.6, 1,
1.175385, -0.5995232, 0.6030818, 1, 0, 0.5921569, 1,
1.181896, 1.531072, 0.9388814, 1, 0, 0.5882353, 1,
1.181983, -0.1833047, 0.6899598, 1, 0, 0.5803922, 1,
1.19634, -0.8434047, 1.097066, 1, 0, 0.5764706, 1,
1.209936, 1.841641, -0.850005, 1, 0, 0.5686275, 1,
1.212116, -0.8810337, 2.560509, 1, 0, 0.5647059, 1,
1.214529, -0.07621282, 1.403897, 1, 0, 0.5568628, 1,
1.215384, -1.567337, 3.071526, 1, 0, 0.5529412, 1,
1.230275, -0.1221119, 3.683835, 1, 0, 0.5450981, 1,
1.24515, -0.7168611, 1.71291, 1, 0, 0.5411765, 1,
1.248475, -1.333876, 2.54452, 1, 0, 0.5333334, 1,
1.251879, -0.1148117, 1.729623, 1, 0, 0.5294118, 1,
1.257604, -0.6483448, 2.870974, 1, 0, 0.5215687, 1,
1.268381, 0.1731732, 1.041428, 1, 0, 0.5176471, 1,
1.271972, 1.476572, 1.49861, 1, 0, 0.509804, 1,
1.313819, 0.05097431, 1.618242, 1, 0, 0.5058824, 1,
1.330408, 0.05148925, 2.121876, 1, 0, 0.4980392, 1,
1.340263, 1.517027, 0.2324914, 1, 0, 0.4901961, 1,
1.340977, 0.5958656, -0.00258587, 1, 0, 0.4862745, 1,
1.344168, 1.375503, 1.745654, 1, 0, 0.4784314, 1,
1.34566, -0.1571074, -0.06339107, 1, 0, 0.4745098, 1,
1.35849, -0.7817564, -0.9522092, 1, 0, 0.4666667, 1,
1.366355, 1.157759, -1.320706, 1, 0, 0.4627451, 1,
1.369603, -0.9610406, 1.829264, 1, 0, 0.454902, 1,
1.369643, 0.6884571, 0.2346542, 1, 0, 0.4509804, 1,
1.371706, 0.2887824, 3.400164, 1, 0, 0.4431373, 1,
1.37812, 0.4650825, 1.246543, 1, 0, 0.4392157, 1,
1.378174, 0.3397179, 0.7260091, 1, 0, 0.4313726, 1,
1.378253, -0.04160982, 1.619181, 1, 0, 0.427451, 1,
1.380559, -1.132697, 0.6408534, 1, 0, 0.4196078, 1,
1.384429, -0.6042503, 2.540987, 1, 0, 0.4156863, 1,
1.386762, 0.07906674, 1.468343, 1, 0, 0.4078431, 1,
1.389449, -0.06076882, 1.078349, 1, 0, 0.4039216, 1,
1.421418, 0.3188894, 1.930779, 1, 0, 0.3960784, 1,
1.42377, 0.3420248, 1.056325, 1, 0, 0.3882353, 1,
1.434156, -0.7384134, 2.439551, 1, 0, 0.3843137, 1,
1.442356, 0.5479468, 0.9617561, 1, 0, 0.3764706, 1,
1.442719, -0.9460056, 0.1451523, 1, 0, 0.372549, 1,
1.458193, 0.05052677, 1.181524, 1, 0, 0.3647059, 1,
1.47075, 2.46745, -1.95118, 1, 0, 0.3607843, 1,
1.482786, -0.5585064, 0.8900238, 1, 0, 0.3529412, 1,
1.490502, 0.5876048, 2.050577, 1, 0, 0.3490196, 1,
1.491305, 1.516273, 1.564456, 1, 0, 0.3411765, 1,
1.499644, 0.9620376, 0.2617885, 1, 0, 0.3372549, 1,
1.502085, 1.513604, 0.2594204, 1, 0, 0.3294118, 1,
1.504925, -2.120609, 3.173999, 1, 0, 0.3254902, 1,
1.511814, 0.1142703, 1.975543, 1, 0, 0.3176471, 1,
1.517869, 0.2898808, 2.317246, 1, 0, 0.3137255, 1,
1.531971, 0.7834709, 0.5139739, 1, 0, 0.3058824, 1,
1.542153, -1.059988, 3.068211, 1, 0, 0.2980392, 1,
1.543858, 1.33333, 1.558777, 1, 0, 0.2941177, 1,
1.54566, -0.6570433, 1.669039, 1, 0, 0.2862745, 1,
1.546737, 0.4173464, 1.957563, 1, 0, 0.282353, 1,
1.548379, 0.4870596, 1.905835, 1, 0, 0.2745098, 1,
1.550532, -0.4214591, 2.907425, 1, 0, 0.2705882, 1,
1.550543, -1.394553, 1.678373, 1, 0, 0.2627451, 1,
1.55398, -2.256469, 2.343148, 1, 0, 0.2588235, 1,
1.555329, 3.194437, -1.02824, 1, 0, 0.2509804, 1,
1.564322, -0.05721518, 1.731765, 1, 0, 0.2470588, 1,
1.568568, 0.2672521, 2.625598, 1, 0, 0.2392157, 1,
1.579109, -2.23932, 3.742892, 1, 0, 0.2352941, 1,
1.582532, -0.3585372, 0.05764656, 1, 0, 0.227451, 1,
1.59066, 0.7494544, 1.055936, 1, 0, 0.2235294, 1,
1.608426, 0.1339609, 1.522439, 1, 0, 0.2156863, 1,
1.615986, -0.23563, 1.802936, 1, 0, 0.2117647, 1,
1.619678, -0.9291709, 2.063584, 1, 0, 0.2039216, 1,
1.622548, 1.466253, 1.41437, 1, 0, 0.1960784, 1,
1.63972, 0.5593533, 0.2249996, 1, 0, 0.1921569, 1,
1.654972, -0.1450921, 1.862048, 1, 0, 0.1843137, 1,
1.666543, -0.7893661, 3.243247, 1, 0, 0.1803922, 1,
1.708744, 1.459871, -0.5212288, 1, 0, 0.172549, 1,
1.736183, -0.1632575, 1.132574, 1, 0, 0.1686275, 1,
1.74013, -1.347657, 2.433538, 1, 0, 0.1607843, 1,
1.743425, 0.3692411, 3.374002, 1, 0, 0.1568628, 1,
1.748189, -0.08995897, 1.02206, 1, 0, 0.1490196, 1,
1.749657, -0.8904687, 3.0445, 1, 0, 0.145098, 1,
1.749945, -0.2209009, 0.9142812, 1, 0, 0.1372549, 1,
1.783249, -0.07704923, 2.966334, 1, 0, 0.1333333, 1,
1.802503, 0.3037673, -0.6836804, 1, 0, 0.1254902, 1,
1.816248, 0.6746504, 0.8839763, 1, 0, 0.1215686, 1,
1.847535, -0.6194332, 1.501855, 1, 0, 0.1137255, 1,
1.894489, -0.1398969, 1.376803, 1, 0, 0.1098039, 1,
1.953057, 0.6974406, -0.1877929, 1, 0, 0.1019608, 1,
1.954818, 0.8478316, 2.328921, 1, 0, 0.09411765, 1,
2.043883, 1.410207, 1.016332, 1, 0, 0.09019608, 1,
2.083586, -0.548894, -0.8738905, 1, 0, 0.08235294, 1,
2.094898, -0.3380705, 2.391367, 1, 0, 0.07843138, 1,
2.098357, 2.194786, -0.5983697, 1, 0, 0.07058824, 1,
2.174235, -2.278793, 2.567825, 1, 0, 0.06666667, 1,
2.183753, 0.8010371, 2.740266, 1, 0, 0.05882353, 1,
2.255225, -0.8301257, 2.179648, 1, 0, 0.05490196, 1,
2.368041, 0.9520128, -0.4399257, 1, 0, 0.04705882, 1,
2.406119, 0.7745883, 1.960492, 1, 0, 0.04313726, 1,
2.432142, -0.973037, 1.729189, 1, 0, 0.03529412, 1,
2.664161, -0.3540149, 1.872936, 1, 0, 0.03137255, 1,
2.743707, 1.440662, 1.39617, 1, 0, 0.02352941, 1,
2.863515, 0.5285539, 3.468395, 1, 0, 0.01960784, 1,
2.874977, -1.864547, 2.0948, 1, 0, 0.01176471, 1,
2.952264, -0.06455368, 1.226198, 1, 0, 0.007843138, 1
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
-0.1608646, -5.19185, -6.595772, 0, -0.5, 0.5, 0.5,
-0.1608646, -5.19185, -6.595772, 1, -0.5, 0.5, 0.5,
-0.1608646, -5.19185, -6.595772, 1, 1.5, 0.5, 0.5,
-0.1608646, -5.19185, -6.595772, 0, 1.5, 0.5, 0.5
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
-4.329343, -0.3909788, -6.595772, 0, -0.5, 0.5, 0.5,
-4.329343, -0.3909788, -6.595772, 1, -0.5, 0.5, 0.5,
-4.329343, -0.3909788, -6.595772, 1, 1.5, 0.5, 0.5,
-4.329343, -0.3909788, -6.595772, 0, 1.5, 0.5, 0.5
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
-4.329343, -5.19185, 0.1465447, 0, -0.5, 0.5, 0.5,
-4.329343, -5.19185, 0.1465447, 1, -0.5, 0.5, 0.5,
-4.329343, -5.19185, 0.1465447, 1, 1.5, 0.5, 0.5,
-4.329343, -5.19185, 0.1465447, 0, 1.5, 0.5, 0.5
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
-3, -4.083957, -5.039853,
2, -4.083957, -5.039853,
-3, -4.083957, -5.039853,
-3, -4.268606, -5.299172,
-2, -4.083957, -5.039853,
-2, -4.268606, -5.299172,
-1, -4.083957, -5.039853,
-1, -4.268606, -5.299172,
0, -4.083957, -5.039853,
0, -4.268606, -5.299172,
1, -4.083957, -5.039853,
1, -4.268606, -5.299172,
2, -4.083957, -5.039853,
2, -4.268606, -5.299172
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
-3, -4.637903, -5.817812, 0, -0.5, 0.5, 0.5,
-3, -4.637903, -5.817812, 1, -0.5, 0.5, 0.5,
-3, -4.637903, -5.817812, 1, 1.5, 0.5, 0.5,
-3, -4.637903, -5.817812, 0, 1.5, 0.5, 0.5,
-2, -4.637903, -5.817812, 0, -0.5, 0.5, 0.5,
-2, -4.637903, -5.817812, 1, -0.5, 0.5, 0.5,
-2, -4.637903, -5.817812, 1, 1.5, 0.5, 0.5,
-2, -4.637903, -5.817812, 0, 1.5, 0.5, 0.5,
-1, -4.637903, -5.817812, 0, -0.5, 0.5, 0.5,
-1, -4.637903, -5.817812, 1, -0.5, 0.5, 0.5,
-1, -4.637903, -5.817812, 1, 1.5, 0.5, 0.5,
-1, -4.637903, -5.817812, 0, 1.5, 0.5, 0.5,
0, -4.637903, -5.817812, 0, -0.5, 0.5, 0.5,
0, -4.637903, -5.817812, 1, -0.5, 0.5, 0.5,
0, -4.637903, -5.817812, 1, 1.5, 0.5, 0.5,
0, -4.637903, -5.817812, 0, 1.5, 0.5, 0.5,
1, -4.637903, -5.817812, 0, -0.5, 0.5, 0.5,
1, -4.637903, -5.817812, 1, -0.5, 0.5, 0.5,
1, -4.637903, -5.817812, 1, 1.5, 0.5, 0.5,
1, -4.637903, -5.817812, 0, 1.5, 0.5, 0.5,
2, -4.637903, -5.817812, 0, -0.5, 0.5, 0.5,
2, -4.637903, -5.817812, 1, -0.5, 0.5, 0.5,
2, -4.637903, -5.817812, 1, 1.5, 0.5, 0.5,
2, -4.637903, -5.817812, 0, 1.5, 0.5, 0.5
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
-3.367387, -2, -5.039853,
-3.367387, 2, -5.039853,
-3.367387, -2, -5.039853,
-3.527713, -2, -5.299172,
-3.367387, 0, -5.039853,
-3.527713, 0, -5.299172,
-3.367387, 2, -5.039853,
-3.527713, 2, -5.299172
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
-3.848365, -2, -5.817812, 0, -0.5, 0.5, 0.5,
-3.848365, -2, -5.817812, 1, -0.5, 0.5, 0.5,
-3.848365, -2, -5.817812, 1, 1.5, 0.5, 0.5,
-3.848365, -2, -5.817812, 0, 1.5, 0.5, 0.5,
-3.848365, 0, -5.817812, 0, -0.5, 0.5, 0.5,
-3.848365, 0, -5.817812, 1, -0.5, 0.5, 0.5,
-3.848365, 0, -5.817812, 1, 1.5, 0.5, 0.5,
-3.848365, 0, -5.817812, 0, 1.5, 0.5, 0.5,
-3.848365, 2, -5.817812, 0, -0.5, 0.5, 0.5,
-3.848365, 2, -5.817812, 1, -0.5, 0.5, 0.5,
-3.848365, 2, -5.817812, 1, 1.5, 0.5, 0.5,
-3.848365, 2, -5.817812, 0, 1.5, 0.5, 0.5
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
-3.367387, -4.083957, -4,
-3.367387, -4.083957, 4,
-3.367387, -4.083957, -4,
-3.527713, -4.268606, -4,
-3.367387, -4.083957, -2,
-3.527713, -4.268606, -2,
-3.367387, -4.083957, 0,
-3.527713, -4.268606, 0,
-3.367387, -4.083957, 2,
-3.527713, -4.268606, 2,
-3.367387, -4.083957, 4,
-3.527713, -4.268606, 4
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
-3.848365, -4.637903, -4, 0, -0.5, 0.5, 0.5,
-3.848365, -4.637903, -4, 1, -0.5, 0.5, 0.5,
-3.848365, -4.637903, -4, 1, 1.5, 0.5, 0.5,
-3.848365, -4.637903, -4, 0, 1.5, 0.5, 0.5,
-3.848365, -4.637903, -2, 0, -0.5, 0.5, 0.5,
-3.848365, -4.637903, -2, 1, -0.5, 0.5, 0.5,
-3.848365, -4.637903, -2, 1, 1.5, 0.5, 0.5,
-3.848365, -4.637903, -2, 0, 1.5, 0.5, 0.5,
-3.848365, -4.637903, 0, 0, -0.5, 0.5, 0.5,
-3.848365, -4.637903, 0, 1, -0.5, 0.5, 0.5,
-3.848365, -4.637903, 0, 1, 1.5, 0.5, 0.5,
-3.848365, -4.637903, 0, 0, 1.5, 0.5, 0.5,
-3.848365, -4.637903, 2, 0, -0.5, 0.5, 0.5,
-3.848365, -4.637903, 2, 1, -0.5, 0.5, 0.5,
-3.848365, -4.637903, 2, 1, 1.5, 0.5, 0.5,
-3.848365, -4.637903, 2, 0, 1.5, 0.5, 0.5,
-3.848365, -4.637903, 4, 0, -0.5, 0.5, 0.5,
-3.848365, -4.637903, 4, 1, -0.5, 0.5, 0.5,
-3.848365, -4.637903, 4, 1, 1.5, 0.5, 0.5,
-3.848365, -4.637903, 4, 0, 1.5, 0.5, 0.5
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
-3.367387, -4.083957, -5.039853,
-3.367387, 3.301999, -5.039853,
-3.367387, -4.083957, 5.332942,
-3.367387, 3.301999, 5.332942,
-3.367387, -4.083957, -5.039853,
-3.367387, -4.083957, 5.332942,
-3.367387, 3.301999, -5.039853,
-3.367387, 3.301999, 5.332942,
-3.367387, -4.083957, -5.039853,
3.045657, -4.083957, -5.039853,
-3.367387, -4.083957, 5.332942,
3.045657, -4.083957, 5.332942,
-3.367387, 3.301999, -5.039853,
3.045657, 3.301999, -5.039853,
-3.367387, 3.301999, 5.332942,
3.045657, 3.301999, 5.332942,
3.045657, -4.083957, -5.039853,
3.045657, 3.301999, -5.039853,
3.045657, -4.083957, 5.332942,
3.045657, 3.301999, 5.332942,
3.045657, -4.083957, -5.039853,
3.045657, -4.083957, 5.332942,
3.045657, 3.301999, -5.039853,
3.045657, 3.301999, 5.332942
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
var radius = 7.613191;
var distance = 33.87195;
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
mvMatrix.translate( 0.1608646, 0.3909788, -0.1465447 );
mvMatrix.scale( 1.283561, 1.114484, 0.7935693 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.87195);
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


