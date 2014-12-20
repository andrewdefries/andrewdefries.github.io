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
-3.009485, 0.71437, -2.612953, 1, 0, 0, 1,
-2.74462, -0.3462372, -0.6209517, 1, 0.007843138, 0, 1,
-2.563404, -0.5988276, -0.226432, 1, 0.01176471, 0, 1,
-2.561226, -1.290589, 0.8107591, 1, 0.01960784, 0, 1,
-2.479097, -0.2101731, -2.809156, 1, 0.02352941, 0, 1,
-2.445856, -0.09891644, -0.7933295, 1, 0.03137255, 0, 1,
-2.348287, -1.786489, -2.401566, 1, 0.03529412, 0, 1,
-2.346983, 0.5252023, -3.80889, 1, 0.04313726, 0, 1,
-2.336661, -1.832905, -0.7141809, 1, 0.04705882, 0, 1,
-2.323383, 0.7454828, -2.333655, 1, 0.05490196, 0, 1,
-2.188152, 1.801723, -1.207092, 1, 0.05882353, 0, 1,
-2.17899, 0.5347849, -2.680537, 1, 0.06666667, 0, 1,
-2.172033, 1.405749, -0.05485774, 1, 0.07058824, 0, 1,
-2.156808, -1.134735, -3.496661, 1, 0.07843138, 0, 1,
-2.138638, -1.371733, -3.381837, 1, 0.08235294, 0, 1,
-2.087835, 1.37467, -1.975947, 1, 0.09019608, 0, 1,
-2.08704, -0.1772102, -1.956229, 1, 0.09411765, 0, 1,
-2.073951, 0.009326275, -1.901933, 1, 0.1019608, 0, 1,
-2.070391, -1.17776, -2.139359, 1, 0.1098039, 0, 1,
-2.044765, 0.5449441, -1.908275, 1, 0.1137255, 0, 1,
-2.039797, -0.5300357, -2.238284, 1, 0.1215686, 0, 1,
-2.036409, -1.178414, -1.682504, 1, 0.1254902, 0, 1,
-2.026955, -1.09843, -0.7996337, 1, 0.1333333, 0, 1,
-2.023782, 0.6024665, -0.5152262, 1, 0.1372549, 0, 1,
-2.017308, -0.23682, -0.3093368, 1, 0.145098, 0, 1,
-2.007758, -1.142727, -1.31962, 1, 0.1490196, 0, 1,
-2.000323, -0.0646244, -1.767066, 1, 0.1568628, 0, 1,
-1.999898, 1.287975, -0.4185144, 1, 0.1607843, 0, 1,
-1.957984, 0.8510774, -0.9366661, 1, 0.1686275, 0, 1,
-1.957862, -0.4462964, -0.5609395, 1, 0.172549, 0, 1,
-1.956628, -0.06534492, 1.459784, 1, 0.1803922, 0, 1,
-1.919097, 0.6340439, -0.9646263, 1, 0.1843137, 0, 1,
-1.90964, 0.8280754, -2.643527, 1, 0.1921569, 0, 1,
-1.906039, -0.5153238, -2.539716, 1, 0.1960784, 0, 1,
-1.887964, 0.4622378, -0.6766419, 1, 0.2039216, 0, 1,
-1.879456, 0.4983389, -1.113572, 1, 0.2117647, 0, 1,
-1.879134, 0.7639306, -1.582444, 1, 0.2156863, 0, 1,
-1.850885, 0.3849818, -1.414213, 1, 0.2235294, 0, 1,
-1.850715, 1.217437, 0.1685574, 1, 0.227451, 0, 1,
-1.8385, -1.965004, -2.970752, 1, 0.2352941, 0, 1,
-1.824862, -0.2604741, -0.607288, 1, 0.2392157, 0, 1,
-1.799722, 0.6540383, -0.945997, 1, 0.2470588, 0, 1,
-1.796421, 0.720978, -2.907571, 1, 0.2509804, 0, 1,
-1.7866, 1.323341, 1.149828, 1, 0.2588235, 0, 1,
-1.785935, -3.380853, -3.167526, 1, 0.2627451, 0, 1,
-1.776041, 0.6580556, 0.06146891, 1, 0.2705882, 0, 1,
-1.762227, 1.015651, -0.7788476, 1, 0.2745098, 0, 1,
-1.760803, 1.134689, -1.458979, 1, 0.282353, 0, 1,
-1.760069, 0.2001049, -1.067191, 1, 0.2862745, 0, 1,
-1.759439, 0.7644452, -0.9044124, 1, 0.2941177, 0, 1,
-1.741312, -0.9925256, -2.050674, 1, 0.3019608, 0, 1,
-1.722193, 1.725039, -1.686312, 1, 0.3058824, 0, 1,
-1.698148, -1.132718, -2.055375, 1, 0.3137255, 0, 1,
-1.661965, -0.4093873, -2.062754, 1, 0.3176471, 0, 1,
-1.655715, 1.726705, -1.554171, 1, 0.3254902, 0, 1,
-1.597755, -0.6661604, -1.204693, 1, 0.3294118, 0, 1,
-1.590074, 1.117348, -1.382881, 1, 0.3372549, 0, 1,
-1.589235, -0.6117114, -2.537272, 1, 0.3411765, 0, 1,
-1.588992, -0.7866831, -1.556447, 1, 0.3490196, 0, 1,
-1.588075, -1.276327, -3.189881, 1, 0.3529412, 0, 1,
-1.585002, 0.2440241, -1.034733, 1, 0.3607843, 0, 1,
-1.549736, -0.5409318, -2.704076, 1, 0.3647059, 0, 1,
-1.547552, 0.8968006, -1.921527, 1, 0.372549, 0, 1,
-1.540763, -1.563823, -1.490229, 1, 0.3764706, 0, 1,
-1.539863, 1.45013, -0.7228275, 1, 0.3843137, 0, 1,
-1.539329, 1.351459, 0.3419, 1, 0.3882353, 0, 1,
-1.538595, 1.090542, -0.2042975, 1, 0.3960784, 0, 1,
-1.529545, 1.322154, -0.3190283, 1, 0.4039216, 0, 1,
-1.516634, -2.097907, -4.278744, 1, 0.4078431, 0, 1,
-1.503211, 0.4687482, -0.8389598, 1, 0.4156863, 0, 1,
-1.472201, -0.3656135, -1.34817, 1, 0.4196078, 0, 1,
-1.466644, -0.0108703, -1.598252, 1, 0.427451, 0, 1,
-1.457655, -1.634019, -1.635356, 1, 0.4313726, 0, 1,
-1.453203, 1.886666, -1.44902, 1, 0.4392157, 0, 1,
-1.450309, -1.077348, -3.814826, 1, 0.4431373, 0, 1,
-1.445154, 0.4975115, -2.181543, 1, 0.4509804, 0, 1,
-1.436798, 0.5161499, -0.0213142, 1, 0.454902, 0, 1,
-1.435381, -0.870409, -2.712079, 1, 0.4627451, 0, 1,
-1.422825, 0.7972502, -0.7310411, 1, 0.4666667, 0, 1,
-1.42144, -0.2147001, -1.312998, 1, 0.4745098, 0, 1,
-1.421437, -3.072332, -4.641475, 1, 0.4784314, 0, 1,
-1.420104, -0.1968399, -3.1481, 1, 0.4862745, 0, 1,
-1.398983, -0.1010034, -0.516713, 1, 0.4901961, 0, 1,
-1.393343, 0.1202661, -1.838861, 1, 0.4980392, 0, 1,
-1.381244, 1.029218, -0.6113832, 1, 0.5058824, 0, 1,
-1.353122, -0.4896163, -1.008591, 1, 0.509804, 0, 1,
-1.35213, 1.074475, -0.3841549, 1, 0.5176471, 0, 1,
-1.350245, 0.7752458, -1.999345, 1, 0.5215687, 0, 1,
-1.349459, -1.415788, -3.621301, 1, 0.5294118, 0, 1,
-1.347499, 0.7236153, -1.914868, 1, 0.5333334, 0, 1,
-1.346474, -0.9431094, -2.740027, 1, 0.5411765, 0, 1,
-1.336953, -0.1178397, 0.6355764, 1, 0.5450981, 0, 1,
-1.33145, 0.3107378, -2.203264, 1, 0.5529412, 0, 1,
-1.329322, -0.4666998, -0.7978861, 1, 0.5568628, 0, 1,
-1.321276, 1.549291, -0.1544043, 1, 0.5647059, 0, 1,
-1.320221, 0.4108329, -1.29646, 1, 0.5686275, 0, 1,
-1.313308, -0.450723, -0.6197729, 1, 0.5764706, 0, 1,
-1.307691, 1.824167, -1.397939, 1, 0.5803922, 0, 1,
-1.299304, -0.7250233, -2.381003, 1, 0.5882353, 0, 1,
-1.295968, 0.1392866, -0.5293629, 1, 0.5921569, 0, 1,
-1.284353, -0.2480769, -1.752098, 1, 0.6, 0, 1,
-1.280632, -0.5276364, -1.427655, 1, 0.6078432, 0, 1,
-1.28037, -0.1185478, -0.5695079, 1, 0.6117647, 0, 1,
-1.272956, 0.5764102, -0.7712303, 1, 0.6196079, 0, 1,
-1.261602, -1.401598, -3.091297, 1, 0.6235294, 0, 1,
-1.244283, 0.6000111, -1.587563, 1, 0.6313726, 0, 1,
-1.241119, 1.602323, -1.831295, 1, 0.6352941, 0, 1,
-1.239993, 0.8549708, -0.328537, 1, 0.6431373, 0, 1,
-1.238308, 1.912868, -1.25807, 1, 0.6470588, 0, 1,
-1.233494, 0.06836978, -1.590059, 1, 0.654902, 0, 1,
-1.225851, -0.2067378, -2.020517, 1, 0.6588235, 0, 1,
-1.212014, -3.555633, -1.012592, 1, 0.6666667, 0, 1,
-1.204322, 0.2619709, 0.6471767, 1, 0.6705883, 0, 1,
-1.204028, 0.09899966, -2.292418, 1, 0.6784314, 0, 1,
-1.201195, -1.810345, -0.2436225, 1, 0.682353, 0, 1,
-1.198712, 2.252644, -0.2673514, 1, 0.6901961, 0, 1,
-1.190835, -1.299603, -1.941078, 1, 0.6941177, 0, 1,
-1.177419, -0.1755123, 0.6729639, 1, 0.7019608, 0, 1,
-1.159909, -2.049637, -2.107127, 1, 0.7098039, 0, 1,
-1.150554, -0.2230357, -2.20271, 1, 0.7137255, 0, 1,
-1.147375, 1.004431, -0.8303557, 1, 0.7215686, 0, 1,
-1.146552, -0.4809876, -4.57216, 1, 0.7254902, 0, 1,
-1.141854, -0.3768592, -1.795264, 1, 0.7333333, 0, 1,
-1.141702, 0.5242558, -0.9377704, 1, 0.7372549, 0, 1,
-1.141337, 1.640377, 0.3351882, 1, 0.7450981, 0, 1,
-1.140936, -0.2390779, -1.6433, 1, 0.7490196, 0, 1,
-1.138953, 0.8469626, -1.222418, 1, 0.7568628, 0, 1,
-1.129158, -0.5872812, -1.308952, 1, 0.7607843, 0, 1,
-1.129064, 1.128879, -1.959395, 1, 0.7686275, 0, 1,
-1.128285, 2.350712, 1.903654, 1, 0.772549, 0, 1,
-1.126376, -0.2519635, -1.799029, 1, 0.7803922, 0, 1,
-1.124684, -1.923125, -1.645927, 1, 0.7843137, 0, 1,
-1.121023, -0.5883136, -2.356301, 1, 0.7921569, 0, 1,
-1.119219, -0.3988576, -1.551346, 1, 0.7960784, 0, 1,
-1.115343, 2.082162, 1.720165, 1, 0.8039216, 0, 1,
-1.109469, -0.2591011, -2.910489, 1, 0.8117647, 0, 1,
-1.106766, 0.5677158, -3.467426, 1, 0.8156863, 0, 1,
-1.106156, 0.5345886, -1.081874, 1, 0.8235294, 0, 1,
-1.105468, 0.538266, 1.183826, 1, 0.827451, 0, 1,
-1.103053, -0.1080179, -0.6384879, 1, 0.8352941, 0, 1,
-1.099269, 0.8827306, -1.884544, 1, 0.8392157, 0, 1,
-1.092199, 1.819946, 0.3095138, 1, 0.8470588, 0, 1,
-1.091212, 0.2957239, -1.586203, 1, 0.8509804, 0, 1,
-1.084536, 0.350837, -1.432123, 1, 0.8588235, 0, 1,
-1.080032, -0.5251176, -2.317402, 1, 0.8627451, 0, 1,
-1.079953, 0.7372911, -0.3943771, 1, 0.8705882, 0, 1,
-1.073877, -0.1229961, -2.578425, 1, 0.8745098, 0, 1,
-1.072531, -0.2230301, -1.862537, 1, 0.8823529, 0, 1,
-1.065202, -0.2992671, -2.981872, 1, 0.8862745, 0, 1,
-1.062007, 0.1183247, -2.007997, 1, 0.8941177, 0, 1,
-1.060108, 0.3773414, -0.04848994, 1, 0.8980392, 0, 1,
-1.057991, 0.3897977, -0.5925272, 1, 0.9058824, 0, 1,
-1.049003, -0.4158154, -3.836606, 1, 0.9137255, 0, 1,
-1.047972, 0.1077962, -1.279529, 1, 0.9176471, 0, 1,
-1.047803, -1.812017, -3.312792, 1, 0.9254902, 0, 1,
-1.044883, 1.060992, -0.7778805, 1, 0.9294118, 0, 1,
-1.043443, -0.976081, -2.27922, 1, 0.9372549, 0, 1,
-1.035065, -0.9269698, -1.294842, 1, 0.9411765, 0, 1,
-1.033856, -0.4312873, -2.043335, 1, 0.9490196, 0, 1,
-1.029541, 0.3621891, -0.322936, 1, 0.9529412, 0, 1,
-1.024165, -1.097711, -2.182022, 1, 0.9607843, 0, 1,
-1.017987, -1.207614, -1.186535, 1, 0.9647059, 0, 1,
-1.017674, 0.8542253, -1.16103, 1, 0.972549, 0, 1,
-1.013652, 0.1044186, -1.479791, 1, 0.9764706, 0, 1,
-1.010851, -0.3649751, -2.281854, 1, 0.9843137, 0, 1,
-1.009466, 0.1795998, -0.121476, 1, 0.9882353, 0, 1,
-1.004928, 0.4360249, -1.714567, 1, 0.9960784, 0, 1,
-0.9968604, 0.6142243, -1.889661, 0.9960784, 1, 0, 1,
-0.9964675, 0.9707236, -0.6748302, 0.9921569, 1, 0, 1,
-0.9921012, 0.676267, -1.492322, 0.9843137, 1, 0, 1,
-0.9900001, 1.106771, -1.421998, 0.9803922, 1, 0, 1,
-0.989947, 0.03722696, -1.651697, 0.972549, 1, 0, 1,
-0.9749007, -1.271587, -2.618287, 0.9686275, 1, 0, 1,
-0.9735472, -0.5588557, -0.9630584, 0.9607843, 1, 0, 1,
-0.9710391, 1.070965, -0.5107414, 0.9568627, 1, 0, 1,
-0.9659302, 0.4622014, -1.697374, 0.9490196, 1, 0, 1,
-0.9437187, 1.201888, -1.233261, 0.945098, 1, 0, 1,
-0.9340504, 1.207867, 0.366152, 0.9372549, 1, 0, 1,
-0.9326363, 1.087257, -1.563596, 0.9333333, 1, 0, 1,
-0.9193406, 0.1537429, -1.003176, 0.9254902, 1, 0, 1,
-0.9058986, -2.345129, -4.475204, 0.9215686, 1, 0, 1,
-0.9054772, -0.5041221, 0.2333818, 0.9137255, 1, 0, 1,
-0.8994692, 0.5975528, -0.1008505, 0.9098039, 1, 0, 1,
-0.8993978, 0.8922695, -1.041404, 0.9019608, 1, 0, 1,
-0.8936179, 0.00852995, -2.237303, 0.8941177, 1, 0, 1,
-0.8885761, 0.1818472, -1.821252, 0.8901961, 1, 0, 1,
-0.8876656, -2.181147, -2.401847, 0.8823529, 1, 0, 1,
-0.8871499, -2.012199, -3.999839, 0.8784314, 1, 0, 1,
-0.8860716, 0.4802112, -0.4122082, 0.8705882, 1, 0, 1,
-0.8828813, -1.304486, 0.007786933, 0.8666667, 1, 0, 1,
-0.8802767, 0.9565347, -0.9374488, 0.8588235, 1, 0, 1,
-0.877669, 1.198195, -2.275092, 0.854902, 1, 0, 1,
-0.8623006, -1.200815, -3.045073, 0.8470588, 1, 0, 1,
-0.8615781, -0.8149534, -2.704422, 0.8431373, 1, 0, 1,
-0.849273, 0.00776662, -1.945365, 0.8352941, 1, 0, 1,
-0.8464142, 0.8486838, -1.951224, 0.8313726, 1, 0, 1,
-0.8427576, -0.6267729, -0.1448545, 0.8235294, 1, 0, 1,
-0.8368705, 1.73615, -0.9976506, 0.8196079, 1, 0, 1,
-0.8278887, -1.052701, -1.853828, 0.8117647, 1, 0, 1,
-0.8201791, -0.9523768, -1.963216, 0.8078431, 1, 0, 1,
-0.8144823, -0.5754582, -2.88422, 0.8, 1, 0, 1,
-0.8134418, 0.4500625, -1.354463, 0.7921569, 1, 0, 1,
-0.8041878, -0.7631535, -0.854787, 0.7882353, 1, 0, 1,
-0.8029515, -0.0602507, -0.005641578, 0.7803922, 1, 0, 1,
-0.8019844, 0.9526135, -0.2986647, 0.7764706, 1, 0, 1,
-0.799987, -1.029818, -3.498675, 0.7686275, 1, 0, 1,
-0.793736, 0.7853797, -1.708433, 0.7647059, 1, 0, 1,
-0.7906501, -1.537488, -2.205115, 0.7568628, 1, 0, 1,
-0.7874665, -0.4527307, -3.527401, 0.7529412, 1, 0, 1,
-0.7874587, 0.1200282, -1.737046, 0.7450981, 1, 0, 1,
-0.7868145, -0.6950366, -1.294549, 0.7411765, 1, 0, 1,
-0.7800031, 0.6344578, -0.9574485, 0.7333333, 1, 0, 1,
-0.7774897, 1.159076, -2.37115, 0.7294118, 1, 0, 1,
-0.7749044, 0.494966, -0.6485494, 0.7215686, 1, 0, 1,
-0.7724548, 1.339113, -1.609653, 0.7176471, 1, 0, 1,
-0.7684221, 0.7212854, 1.217472, 0.7098039, 1, 0, 1,
-0.7662271, 0.2346014, -0.8527759, 0.7058824, 1, 0, 1,
-0.762664, 0.8223732, 0.1903257, 0.6980392, 1, 0, 1,
-0.7616125, 0.1663515, -1.044228, 0.6901961, 1, 0, 1,
-0.7587699, -0.8709801, -2.161773, 0.6862745, 1, 0, 1,
-0.7394564, -0.4268046, -2.083488, 0.6784314, 1, 0, 1,
-0.7383605, 0.3536013, -0.9967849, 0.6745098, 1, 0, 1,
-0.7381551, 0.03909089, -0.9056252, 0.6666667, 1, 0, 1,
-0.7347744, -1.441592, -1.209436, 0.6627451, 1, 0, 1,
-0.727297, -0.4616283, -3.008427, 0.654902, 1, 0, 1,
-0.7269548, -0.8441563, -1.509179, 0.6509804, 1, 0, 1,
-0.724848, -0.5994607, -3.30584, 0.6431373, 1, 0, 1,
-0.7198761, -0.9491253, -3.050031, 0.6392157, 1, 0, 1,
-0.7178681, -0.8228061, -2.549967, 0.6313726, 1, 0, 1,
-0.7139586, -1.682177, -2.25263, 0.627451, 1, 0, 1,
-0.7108037, 0.3483506, -1.093412, 0.6196079, 1, 0, 1,
-0.710501, 1.008841, -1.776483, 0.6156863, 1, 0, 1,
-0.7097995, 2.909855, 1.19371, 0.6078432, 1, 0, 1,
-0.7083642, 0.5226357, -0.1861049, 0.6039216, 1, 0, 1,
-0.7078151, 1.058054, 0.3735228, 0.5960785, 1, 0, 1,
-0.7068112, -0.5547448, -1.898535, 0.5882353, 1, 0, 1,
-0.7067953, -2.086262, -3.325493, 0.5843138, 1, 0, 1,
-0.7017175, -0.04389055, -1.023851, 0.5764706, 1, 0, 1,
-0.7010047, 0.986661, -0.02439765, 0.572549, 1, 0, 1,
-0.6985403, 1.84171, 1.420831, 0.5647059, 1, 0, 1,
-0.692413, -1.71738, -2.014688, 0.5607843, 1, 0, 1,
-0.6790347, 0.01056478, -0.9858944, 0.5529412, 1, 0, 1,
-0.6778117, 0.3885238, -1.500272, 0.5490196, 1, 0, 1,
-0.6754159, -0.07948493, -1.458874, 0.5411765, 1, 0, 1,
-0.6752438, 0.3757734, -1.392096, 0.5372549, 1, 0, 1,
-0.6731643, 1.510376, 0.006596533, 0.5294118, 1, 0, 1,
-0.6709501, 0.4185006, -2.417717, 0.5254902, 1, 0, 1,
-0.6679295, 0.05663702, -1.307042, 0.5176471, 1, 0, 1,
-0.6656139, -1.28663, -1.557174, 0.5137255, 1, 0, 1,
-0.663483, 1.013996, -1.333403, 0.5058824, 1, 0, 1,
-0.6582131, -1.557572, -2.302166, 0.5019608, 1, 0, 1,
-0.6507732, -0.03619881, -1.271205, 0.4941176, 1, 0, 1,
-0.6487237, -0.006545336, 0.06580353, 0.4862745, 1, 0, 1,
-0.6481329, -0.08865926, -2.346562, 0.4823529, 1, 0, 1,
-0.6472501, -0.04105077, -1.420438, 0.4745098, 1, 0, 1,
-0.6437231, -0.821845, -3.430213, 0.4705882, 1, 0, 1,
-0.6409045, -0.3875873, -2.529703, 0.4627451, 1, 0, 1,
-0.6399096, -2.07132, -4.252993, 0.4588235, 1, 0, 1,
-0.6396393, -0.242239, -2.05119, 0.4509804, 1, 0, 1,
-0.6359938, -1.65051, -1.591159, 0.4470588, 1, 0, 1,
-0.6328538, 1.273591, -0.7920798, 0.4392157, 1, 0, 1,
-0.6323339, -1.803918, -3.808572, 0.4352941, 1, 0, 1,
-0.6285052, 0.1526642, -0.3993477, 0.427451, 1, 0, 1,
-0.6264544, 0.7906039, 0.5699067, 0.4235294, 1, 0, 1,
-0.6217114, -0.7576028, -1.941527, 0.4156863, 1, 0, 1,
-0.6186759, 0.365316, -2.11534, 0.4117647, 1, 0, 1,
-0.6176717, 0.9309195, -0.6261979, 0.4039216, 1, 0, 1,
-0.6161, -0.04453809, 0.01750642, 0.3960784, 1, 0, 1,
-0.6005862, 0.5384884, -1.251309, 0.3921569, 1, 0, 1,
-0.6002996, -0.05060647, -2.187754, 0.3843137, 1, 0, 1,
-0.5999855, 0.3400644, -1.098041, 0.3803922, 1, 0, 1,
-0.5992683, 0.5183695, -2.633368, 0.372549, 1, 0, 1,
-0.5962783, -1.000329, -3.49974, 0.3686275, 1, 0, 1,
-0.5931089, 1.272646, -1.686701, 0.3607843, 1, 0, 1,
-0.5904802, -0.5677865, -2.740741, 0.3568628, 1, 0, 1,
-0.587593, 0.7583608, -1.085457, 0.3490196, 1, 0, 1,
-0.5869536, -0.4920464, -3.387656, 0.345098, 1, 0, 1,
-0.5816529, -1.458306, -2.860334, 0.3372549, 1, 0, 1,
-0.5790879, 0.2548919, -2.403665, 0.3333333, 1, 0, 1,
-0.5725849, 0.1988868, -1.060292, 0.3254902, 1, 0, 1,
-0.5708905, -1.69325, -4.046706, 0.3215686, 1, 0, 1,
-0.5690479, -0.05166917, -2.281555, 0.3137255, 1, 0, 1,
-0.5635085, 1.214826, 0.8941967, 0.3098039, 1, 0, 1,
-0.559969, 1.38837, 1.089898, 0.3019608, 1, 0, 1,
-0.54784, 0.1786492, -2.07311, 0.2941177, 1, 0, 1,
-0.5460322, -1.227757, -2.167662, 0.2901961, 1, 0, 1,
-0.5368675, 0.6636653, -0.9644411, 0.282353, 1, 0, 1,
-0.5368132, -0.2452447, -1.144451, 0.2784314, 1, 0, 1,
-0.5306529, 0.6749701, 0.3211671, 0.2705882, 1, 0, 1,
-0.5281811, -0.7941025, -1.278106, 0.2666667, 1, 0, 1,
-0.5168155, 0.9759423, 0.1745201, 0.2588235, 1, 0, 1,
-0.5153027, 1.480039, 0.2218932, 0.254902, 1, 0, 1,
-0.5109703, -1.946412, -2.790439, 0.2470588, 1, 0, 1,
-0.5107563, -1.312772, -2.685828, 0.2431373, 1, 0, 1,
-0.5055942, 0.6889536, 1.849616, 0.2352941, 1, 0, 1,
-0.5037836, 0.5446597, -1.394691, 0.2313726, 1, 0, 1,
-0.5028648, 0.4780113, -0.659731, 0.2235294, 1, 0, 1,
-0.5005066, 0.4507627, -2.347961, 0.2196078, 1, 0, 1,
-0.499202, -0.03935371, -2.358074, 0.2117647, 1, 0, 1,
-0.4961824, -1.377902, -3.756742, 0.2078431, 1, 0, 1,
-0.495424, -0.1433482, -1.334894, 0.2, 1, 0, 1,
-0.494791, 0.1547231, -3.914271, 0.1921569, 1, 0, 1,
-0.4941569, -0.8791763, -3.311654, 0.1882353, 1, 0, 1,
-0.4931726, -0.4542042, -4.348393, 0.1803922, 1, 0, 1,
-0.4908459, -0.4990948, -2.145444, 0.1764706, 1, 0, 1,
-0.4876041, -0.6285102, -1.051355, 0.1686275, 1, 0, 1,
-0.4843615, -0.07427276, -0.8748984, 0.1647059, 1, 0, 1,
-0.4833798, -0.04642893, -1.659007, 0.1568628, 1, 0, 1,
-0.4792421, 1.426284, 1.056001, 0.1529412, 1, 0, 1,
-0.4769378, 1.492938, -0.8285313, 0.145098, 1, 0, 1,
-0.474933, 0.2619164, -0.8893041, 0.1411765, 1, 0, 1,
-0.4662168, 2.056959, -1.228083, 0.1333333, 1, 0, 1,
-0.4661418, 1.248591, -0.03872706, 0.1294118, 1, 0, 1,
-0.4629417, -0.2657126, -3.453401, 0.1215686, 1, 0, 1,
-0.4613446, 2.307431, 1.289495, 0.1176471, 1, 0, 1,
-0.4521041, 1.430308, 0.5601701, 0.1098039, 1, 0, 1,
-0.4518203, 0.6560766, 0.6162472, 0.1058824, 1, 0, 1,
-0.4476859, -0.08659996, -1.259462, 0.09803922, 1, 0, 1,
-0.4475036, 0.1815457, -1.49303, 0.09019608, 1, 0, 1,
-0.4460532, 0.00477958, -4.195818, 0.08627451, 1, 0, 1,
-0.4457995, 0.6312463, -1.965427, 0.07843138, 1, 0, 1,
-0.445544, 0.4317088, -2.078173, 0.07450981, 1, 0, 1,
-0.4384753, -0.9955456, -2.694398, 0.06666667, 1, 0, 1,
-0.4381053, -1.51605, -4.166635, 0.0627451, 1, 0, 1,
-0.4355843, 1.908621, 0.851949, 0.05490196, 1, 0, 1,
-0.4336115, -0.3801129, -1.056927, 0.05098039, 1, 0, 1,
-0.4329976, -0.8690041, -1.531178, 0.04313726, 1, 0, 1,
-0.4288536, -0.4396075, -2.654645, 0.03921569, 1, 0, 1,
-0.4263011, 0.1462661, -0.6887169, 0.03137255, 1, 0, 1,
-0.4182065, -0.3898708, -1.735211, 0.02745098, 1, 0, 1,
-0.4116248, -1.77037, -2.234182, 0.01960784, 1, 0, 1,
-0.410373, -0.566546, -2.443288, 0.01568628, 1, 0, 1,
-0.4087861, 1.433523, 1.092666, 0.007843138, 1, 0, 1,
-0.4037815, 0.376305, 0.62335, 0.003921569, 1, 0, 1,
-0.4021163, 2.332818, 0.1019565, 0, 1, 0.003921569, 1,
-0.3989721, 0.4725802, -1.554929, 0, 1, 0.01176471, 1,
-0.3974352, -0.5493985, -3.487916, 0, 1, 0.01568628, 1,
-0.3934505, 0.6408529, 0.02174681, 0, 1, 0.02352941, 1,
-0.3925575, 1.298684, -0.007395243, 0, 1, 0.02745098, 1,
-0.3924271, 1.268069, -2.132715, 0, 1, 0.03529412, 1,
-0.3922177, -1.463176, -2.957289, 0, 1, 0.03921569, 1,
-0.390585, -1.052262, -1.471318, 0, 1, 0.04705882, 1,
-0.3825766, -0.9313232, -3.363075, 0, 1, 0.05098039, 1,
-0.3714251, 0.1308142, -1.209932, 0, 1, 0.05882353, 1,
-0.3611099, 0.7239677, -1.112878, 0, 1, 0.0627451, 1,
-0.3609476, -0.943193, -3.286748, 0, 1, 0.07058824, 1,
-0.3589273, -0.2239037, -2.229482, 0, 1, 0.07450981, 1,
-0.357483, -0.3873294, -2.737763, 0, 1, 0.08235294, 1,
-0.3536687, 0.8758569, -0.8939886, 0, 1, 0.08627451, 1,
-0.3531388, 0.9663068, -0.2285278, 0, 1, 0.09411765, 1,
-0.3511121, 0.9514471, 0.1638952, 0, 1, 0.1019608, 1,
-0.3456541, 1.024682, 0.1361399, 0, 1, 0.1058824, 1,
-0.3400038, -0.1144232, -0.9837285, 0, 1, 0.1137255, 1,
-0.3389675, -1.049249, -2.261209, 0, 1, 0.1176471, 1,
-0.3388963, -0.1763583, -0.9936138, 0, 1, 0.1254902, 1,
-0.3378507, 1.436039, -0.6483032, 0, 1, 0.1294118, 1,
-0.3369788, -1.016991, -0.7910796, 0, 1, 0.1372549, 1,
-0.3325723, -0.4067001, -4.050603, 0, 1, 0.1411765, 1,
-0.3296133, 0.542635, -1.272948, 0, 1, 0.1490196, 1,
-0.3216938, 1.067778, 0.9780864, 0, 1, 0.1529412, 1,
-0.3196652, -0.5198087, -3.647409, 0, 1, 0.1607843, 1,
-0.3186683, -0.1608534, -1.055283, 0, 1, 0.1647059, 1,
-0.3171754, -1.29274, -3.392473, 0, 1, 0.172549, 1,
-0.3165531, 0.3779693, -2.333853, 0, 1, 0.1764706, 1,
-0.3158325, 0.5112072, -0.1548425, 0, 1, 0.1843137, 1,
-0.3149464, -0.41659, -3.529525, 0, 1, 0.1882353, 1,
-0.3140595, 0.8589086, -1.649781, 0, 1, 0.1960784, 1,
-0.3046619, -0.2010244, -2.025377, 0, 1, 0.2039216, 1,
-0.2997181, 0.01778023, 0.1181751, 0, 1, 0.2078431, 1,
-0.2988592, -0.2370598, -2.311095, 0, 1, 0.2156863, 1,
-0.2988397, -0.9503401, -1.450413, 0, 1, 0.2196078, 1,
-0.2951959, -0.7804562, -0.5099137, 0, 1, 0.227451, 1,
-0.2916303, -0.8219021, -3.334506, 0, 1, 0.2313726, 1,
-0.2903817, -0.5876735, -2.178565, 0, 1, 0.2392157, 1,
-0.2875733, -2.994859, -2.893521, 0, 1, 0.2431373, 1,
-0.2863222, -0.6199911, -1.565942, 0, 1, 0.2509804, 1,
-0.2815611, 1.436569, 0.1604032, 0, 1, 0.254902, 1,
-0.2755291, -0.7508675, -2.293317, 0, 1, 0.2627451, 1,
-0.2749416, -0.9073598, -1.854211, 0, 1, 0.2666667, 1,
-0.2742911, 0.3359219, -0.2580132, 0, 1, 0.2745098, 1,
-0.2731226, -0.7883402, -2.127407, 0, 1, 0.2784314, 1,
-0.27112, -0.6856139, -3.157931, 0, 1, 0.2862745, 1,
-0.270822, 1.526546, -2.596922, 0, 1, 0.2901961, 1,
-0.2682574, 0.4883887, -1.359749, 0, 1, 0.2980392, 1,
-0.2641183, -1.12463, -0.9884132, 0, 1, 0.3058824, 1,
-0.2639509, 0.910975, -1.270335, 0, 1, 0.3098039, 1,
-0.2638235, -1.334787, -3.178406, 0, 1, 0.3176471, 1,
-0.2631973, -1.04261, -1.687875, 0, 1, 0.3215686, 1,
-0.2617478, 0.5162467, -3.084304, 0, 1, 0.3294118, 1,
-0.2598684, 0.1548797, -1.991986, 0, 1, 0.3333333, 1,
-0.256613, 1.874432, 0.07332601, 0, 1, 0.3411765, 1,
-0.2533001, -0.3096056, -1.359853, 0, 1, 0.345098, 1,
-0.2507751, 1.347337, -1.209973, 0, 1, 0.3529412, 1,
-0.2449776, 1.126594, 0.2650757, 0, 1, 0.3568628, 1,
-0.2444893, -0.8443407, -3.055322, 0, 1, 0.3647059, 1,
-0.2427935, -0.7068048, -2.943952, 0, 1, 0.3686275, 1,
-0.2389633, -0.4877338, -2.452597, 0, 1, 0.3764706, 1,
-0.2372785, -2.101858, -2.222857, 0, 1, 0.3803922, 1,
-0.233677, -1.067516, -2.944882, 0, 1, 0.3882353, 1,
-0.2309058, 0.6582031, 0.06386475, 0, 1, 0.3921569, 1,
-0.230558, -0.5394528, -1.890401, 0, 1, 0.4, 1,
-0.2268026, -0.4885846, -2.241758, 0, 1, 0.4078431, 1,
-0.2253228, 0.2712654, -0.1670128, 0, 1, 0.4117647, 1,
-0.2231062, 1.123803, 0.5528558, 0, 1, 0.4196078, 1,
-0.2174822, 0.5888774, -0.3773868, 0, 1, 0.4235294, 1,
-0.2166997, -1.088961, -1.304388, 0, 1, 0.4313726, 1,
-0.2164017, -1.705051, -2.886907, 0, 1, 0.4352941, 1,
-0.2153703, 2.195957, -0.1907818, 0, 1, 0.4431373, 1,
-0.2119738, -0.1853331, -1.90803, 0, 1, 0.4470588, 1,
-0.2089271, -1.505938, -2.600612, 0, 1, 0.454902, 1,
-0.2059358, 1.336458, -0.3676775, 0, 1, 0.4588235, 1,
-0.2057278, -0.8608302, -2.735501, 0, 1, 0.4666667, 1,
-0.2049638, 0.8284792, 0.4515965, 0, 1, 0.4705882, 1,
-0.2046411, -0.1736614, -2.959219, 0, 1, 0.4784314, 1,
-0.2028809, 0.08790131, -1.717107, 0, 1, 0.4823529, 1,
-0.2011723, -0.4513907, -1.1204, 0, 1, 0.4901961, 1,
-0.198517, 0.3074332, 0.2306699, 0, 1, 0.4941176, 1,
-0.1962056, 0.9881605, -0.4860755, 0, 1, 0.5019608, 1,
-0.1949024, -0.8735768, -3.160823, 0, 1, 0.509804, 1,
-0.1948017, 0.8781394, -2.408522, 0, 1, 0.5137255, 1,
-0.1917479, -1.340055, -2.826694, 0, 1, 0.5215687, 1,
-0.1888396, -0.2978534, -1.390345, 0, 1, 0.5254902, 1,
-0.1882589, -1.045135, -2.375978, 0, 1, 0.5333334, 1,
-0.1867611, 1.009479, -0.3868167, 0, 1, 0.5372549, 1,
-0.1833859, 0.5215173, 1.098637, 0, 1, 0.5450981, 1,
-0.1753822, 1.036318, 1.169472, 0, 1, 0.5490196, 1,
-0.1740226, 1.321924, -0.5697379, 0, 1, 0.5568628, 1,
-0.172668, 1.342448, 0.4568242, 0, 1, 0.5607843, 1,
-0.1715892, -0.6460192, -3.093254, 0, 1, 0.5686275, 1,
-0.1659972, 1.466082, -0.8463169, 0, 1, 0.572549, 1,
-0.1639869, -0.5934856, -3.97904, 0, 1, 0.5803922, 1,
-0.1639257, 0.925127, 0.7569524, 0, 1, 0.5843138, 1,
-0.1535913, 1.601806, -0.3364795, 0, 1, 0.5921569, 1,
-0.151121, 0.2195536, 0.7702854, 0, 1, 0.5960785, 1,
-0.1491499, -1.801709, -2.413584, 0, 1, 0.6039216, 1,
-0.1484151, 1.150498, 0.6996176, 0, 1, 0.6117647, 1,
-0.142528, -1.017605, -2.228318, 0, 1, 0.6156863, 1,
-0.139217, -1.788719, -3.86841, 0, 1, 0.6235294, 1,
-0.1350527, -0.3046909, -4.208338, 0, 1, 0.627451, 1,
-0.1288716, 0.9465675, -0.9364925, 0, 1, 0.6352941, 1,
-0.1287653, -0.03587253, -0.6470259, 0, 1, 0.6392157, 1,
-0.1267691, 0.886526, 0.01743347, 0, 1, 0.6470588, 1,
-0.1190654, 0.5364538, -0.2700804, 0, 1, 0.6509804, 1,
-0.1098269, 0.4154868, -0.2927477, 0, 1, 0.6588235, 1,
-0.1090947, 1.08438, 0.8386855, 0, 1, 0.6627451, 1,
-0.1081773, -2.051513, -2.811238, 0, 1, 0.6705883, 1,
-0.1073299, 0.814527, 0.3277818, 0, 1, 0.6745098, 1,
-0.1041676, -0.129006, -1.765577, 0, 1, 0.682353, 1,
-0.102011, -1.649935, -3.264453, 0, 1, 0.6862745, 1,
-0.09932475, 0.1885472, -1.678417, 0, 1, 0.6941177, 1,
-0.09807324, -1.421456, -2.211347, 0, 1, 0.7019608, 1,
-0.09534529, -1.172956, -2.736326, 0, 1, 0.7058824, 1,
-0.09407714, 0.2226214, -1.714344, 0, 1, 0.7137255, 1,
-0.09112553, -0.4674914, -3.289181, 0, 1, 0.7176471, 1,
-0.09042063, -2.421776, -2.875393, 0, 1, 0.7254902, 1,
-0.08961826, -0.8767318, -2.834534, 0, 1, 0.7294118, 1,
-0.08777523, 1.147857, 0.7180682, 0, 1, 0.7372549, 1,
-0.08648351, -1.3552, -2.112765, 0, 1, 0.7411765, 1,
-0.08448187, -1.508443, -3.695896, 0, 1, 0.7490196, 1,
-0.0837383, 1.085517, -1.495633, 0, 1, 0.7529412, 1,
-0.08024348, 0.3309369, -0.06103051, 0, 1, 0.7607843, 1,
-0.07908297, -0.8643029, -2.309255, 0, 1, 0.7647059, 1,
-0.07602891, 1.147776, -1.840466, 0, 1, 0.772549, 1,
-0.0754388, -0.02337054, -2.470378, 0, 1, 0.7764706, 1,
-0.07454981, -1.415388, -3.341017, 0, 1, 0.7843137, 1,
-0.06688929, 0.8415771, 0.9216579, 0, 1, 0.7882353, 1,
-0.06448485, 1.472172, -0.1264507, 0, 1, 0.7960784, 1,
-0.06322207, 0.5492638, 0.4098756, 0, 1, 0.8039216, 1,
-0.06318784, -0.8233179, -2.279453, 0, 1, 0.8078431, 1,
-0.06064159, -0.01361859, -1.266274, 0, 1, 0.8156863, 1,
-0.05871739, -1.928079, -3.312402, 0, 1, 0.8196079, 1,
-0.05237008, -0.3241221, -3.543801, 0, 1, 0.827451, 1,
-0.05215378, -1.053995, -2.537526, 0, 1, 0.8313726, 1,
-0.05116072, -1.226552, -1.334909, 0, 1, 0.8392157, 1,
-0.05099742, -0.5228608, -1.761035, 0, 1, 0.8431373, 1,
-0.05023487, 1.195581, -1.078043, 0, 1, 0.8509804, 1,
-0.0496334, 0.7744012, 0.3851142, 0, 1, 0.854902, 1,
-0.04686401, -0.9616589, -2.296837, 0, 1, 0.8627451, 1,
-0.04678982, -1.054296, -3.743632, 0, 1, 0.8666667, 1,
-0.0467279, 0.6184496, 0.1251712, 0, 1, 0.8745098, 1,
-0.04663999, 0.523859, -1.701642, 0, 1, 0.8784314, 1,
-0.0464448, -0.1126074, -3.386422, 0, 1, 0.8862745, 1,
-0.04532364, -0.2558927, -3.769312, 0, 1, 0.8901961, 1,
-0.04455768, -1.72837, -3.475166, 0, 1, 0.8980392, 1,
-0.04152846, -0.08042165, -4.329049, 0, 1, 0.9058824, 1,
-0.03815468, -1.744671, -3.45858, 0, 1, 0.9098039, 1,
-0.03708888, 0.07663558, -1.374879, 0, 1, 0.9176471, 1,
-0.03435576, 0.5606846, 1.00035, 0, 1, 0.9215686, 1,
-0.02762889, -1.078094, -5.005862, 0, 1, 0.9294118, 1,
-0.02640637, -0.5071374, -3.346553, 0, 1, 0.9333333, 1,
-0.02370482, 1.323124, -0.4769008, 0, 1, 0.9411765, 1,
-0.02210293, -0.05916949, -3.154616, 0, 1, 0.945098, 1,
-0.02100949, 0.9422861, -0.1586555, 0, 1, 0.9529412, 1,
-0.005554516, 2.956107, -3.001905, 0, 1, 0.9568627, 1,
-0.004928567, -0.574667, -2.32999, 0, 1, 0.9647059, 1,
-0.003656229, 1.809823, -1.303135, 0, 1, 0.9686275, 1,
-0.001416648, 0.8861671, 0.3903426, 0, 1, 0.9764706, 1,
-0.0009211266, -0.1108623, -3.541701, 0, 1, 0.9803922, 1,
-0.0006772523, 1.201524, -0.71883, 0, 1, 0.9882353, 1,
0.007852052, -1.392044, 3.601531, 0, 1, 0.9921569, 1,
0.009732273, 0.3498957, 0.3635736, 0, 1, 1, 1,
0.01199317, 0.9818235, -0.5332615, 0, 0.9921569, 1, 1,
0.01277706, -0.6616225, 3.922073, 0, 0.9882353, 1, 1,
0.01342178, -0.02920532, 1.6312, 0, 0.9803922, 1, 1,
0.01592855, -1.435529, 3.076957, 0, 0.9764706, 1, 1,
0.01698885, 0.6470793, 0.5878239, 0, 0.9686275, 1, 1,
0.01736001, 0.7851141, 0.8845912, 0, 0.9647059, 1, 1,
0.01816598, -0.2621195, 4.776123, 0, 0.9568627, 1, 1,
0.02067407, -0.794568, 4.083272, 0, 0.9529412, 1, 1,
0.02101369, 0.8873463, 0.4804153, 0, 0.945098, 1, 1,
0.02325014, -0.2410027, 3.979121, 0, 0.9411765, 1, 1,
0.02707295, -0.6476859, 3.199039, 0, 0.9333333, 1, 1,
0.02918183, -0.4900488, 2.262491, 0, 0.9294118, 1, 1,
0.03470615, -0.4784747, 3.936301, 0, 0.9215686, 1, 1,
0.03603706, -0.6508316, 2.754595, 0, 0.9176471, 1, 1,
0.03842738, 1.021403, 0.05494408, 0, 0.9098039, 1, 1,
0.03979618, 0.08149033, -0.04754749, 0, 0.9058824, 1, 1,
0.04592628, 0.1334877, 1.180219, 0, 0.8980392, 1, 1,
0.04641739, -0.4094832, 1.789044, 0, 0.8901961, 1, 1,
0.04938867, -1.960365, 2.248282, 0, 0.8862745, 1, 1,
0.05044301, -0.2403703, 2.508947, 0, 0.8784314, 1, 1,
0.05474899, -0.3167985, 2.756895, 0, 0.8745098, 1, 1,
0.05575801, 0.4548334, 0.001180965, 0, 0.8666667, 1, 1,
0.06013089, -1.736526, 4.210415, 0, 0.8627451, 1, 1,
0.06506196, -0.9663757, 3.462204, 0, 0.854902, 1, 1,
0.06594513, 1.70281, -0.4714691, 0, 0.8509804, 1, 1,
0.06722064, -0.5562109, 3.445793, 0, 0.8431373, 1, 1,
0.07118382, -0.5661629, 1.907465, 0, 0.8392157, 1, 1,
0.07494947, 0.005527003, 0.1379857, 0, 0.8313726, 1, 1,
0.07979157, -2.0726, 2.896671, 0, 0.827451, 1, 1,
0.07991046, -0.5810936, 4.233151, 0, 0.8196079, 1, 1,
0.08336999, 1.225521, 1.130967, 0, 0.8156863, 1, 1,
0.08492392, -0.05562428, 1.834086, 0, 0.8078431, 1, 1,
0.08649339, -1.231826, 3.517276, 0, 0.8039216, 1, 1,
0.08707941, 0.0008968441, 3.645062, 0, 0.7960784, 1, 1,
0.08892783, -0.8182806, 1.784528, 0, 0.7882353, 1, 1,
0.08908055, -0.7577975, 3.285994, 0, 0.7843137, 1, 1,
0.09019127, -1.263759, 3.598853, 0, 0.7764706, 1, 1,
0.1022994, -1.033835, 2.47322, 0, 0.772549, 1, 1,
0.1023747, 2.594484, -0.3347527, 0, 0.7647059, 1, 1,
0.1067408, -2.176926, 1.776344, 0, 0.7607843, 1, 1,
0.1105972, 1.953905, -0.9002962, 0, 0.7529412, 1, 1,
0.1170141, -0.2702516, 2.697317, 0, 0.7490196, 1, 1,
0.124465, -0.320053, 4.966393, 0, 0.7411765, 1, 1,
0.1257641, -2.639087, 4.221982, 0, 0.7372549, 1, 1,
0.1266159, -0.7745809, 3.877357, 0, 0.7294118, 1, 1,
0.1331097, 1.622731, -0.2653966, 0, 0.7254902, 1, 1,
0.1337305, -0.7273661, 3.776984, 0, 0.7176471, 1, 1,
0.1373261, -0.4516307, 1.554072, 0, 0.7137255, 1, 1,
0.1374326, -0.5422469, 3.877329, 0, 0.7058824, 1, 1,
0.1376914, 0.6609713, 1.542964, 0, 0.6980392, 1, 1,
0.1437116, -0.1153979, 1.255371, 0, 0.6941177, 1, 1,
0.1453025, -0.9140862, 3.926093, 0, 0.6862745, 1, 1,
0.1468614, -1.199216, 2.91193, 0, 0.682353, 1, 1,
0.1481127, 1.361849, -0.108215, 0, 0.6745098, 1, 1,
0.1491055, -1.004025, 2.291762, 0, 0.6705883, 1, 1,
0.1494997, -0.7907471, 4.40348, 0, 0.6627451, 1, 1,
0.1504553, -1.846006, 2.662973, 0, 0.6588235, 1, 1,
0.150678, -0.5211751, 2.639196, 0, 0.6509804, 1, 1,
0.1516106, -1.210906, 4.064294, 0, 0.6470588, 1, 1,
0.152378, -2.847599, 3.683374, 0, 0.6392157, 1, 1,
0.1535659, 0.8601642, 1.499245, 0, 0.6352941, 1, 1,
0.1555316, 0.7701267, -1.197105, 0, 0.627451, 1, 1,
0.1566021, -0.9628021, 4.155912, 0, 0.6235294, 1, 1,
0.1579646, 1.559522, -0.7447338, 0, 0.6156863, 1, 1,
0.1581684, -0.686019, 3.603216, 0, 0.6117647, 1, 1,
0.1587653, -0.5852938, 1.858425, 0, 0.6039216, 1, 1,
0.1592728, 0.803271, 0.8021645, 0, 0.5960785, 1, 1,
0.1617019, -0.5570658, 4.556013, 0, 0.5921569, 1, 1,
0.1623218, -1.833197, -0.2689462, 0, 0.5843138, 1, 1,
0.1630818, -0.9005624, 2.243419, 0, 0.5803922, 1, 1,
0.1666413, -1.354888, 3.458638, 0, 0.572549, 1, 1,
0.1742686, -0.6297958, 1.267957, 0, 0.5686275, 1, 1,
0.1750396, 0.4816718, 1.185838, 0, 0.5607843, 1, 1,
0.1808574, -0.8489605, 3.802504, 0, 0.5568628, 1, 1,
0.1830765, -1.65927, 5.360882, 0, 0.5490196, 1, 1,
0.1839905, -2.135162, 1.435484, 0, 0.5450981, 1, 1,
0.1847722, -0.3121629, 2.967936, 0, 0.5372549, 1, 1,
0.1864156, 0.318745, -0.55007, 0, 0.5333334, 1, 1,
0.1938017, -0.7201856, 1.847833, 0, 0.5254902, 1, 1,
0.1965192, 1.73271, -0.5327873, 0, 0.5215687, 1, 1,
0.198643, 0.1118909, 0.176848, 0, 0.5137255, 1, 1,
0.2046993, -0.7995488, 0.1170788, 0, 0.509804, 1, 1,
0.2155652, 1.945991, 1.000197, 0, 0.5019608, 1, 1,
0.22176, 0.9124263, -0.3102933, 0, 0.4941176, 1, 1,
0.2228809, 0.8419578, 1.707931, 0, 0.4901961, 1, 1,
0.2245651, 0.1660931, 2.088975, 0, 0.4823529, 1, 1,
0.2278963, 0.5900624, 1.247359, 0, 0.4784314, 1, 1,
0.2308284, 0.2533051, 2.52403, 0, 0.4705882, 1, 1,
0.2312186, -1.125286, 3.127762, 0, 0.4666667, 1, 1,
0.235055, 0.09642614, 2.194334, 0, 0.4588235, 1, 1,
0.2449051, 0.2248635, 1.22174, 0, 0.454902, 1, 1,
0.2488034, -0.6804149, 1.46423, 0, 0.4470588, 1, 1,
0.2509353, 0.2374092, 1.1104, 0, 0.4431373, 1, 1,
0.2524218, 1.127348, 0.6808574, 0, 0.4352941, 1, 1,
0.2575428, 1.291128, -0.795957, 0, 0.4313726, 1, 1,
0.2588772, -0.8157176, -0.1230871, 0, 0.4235294, 1, 1,
0.2617832, -0.3552087, 4.093335, 0, 0.4196078, 1, 1,
0.2645716, 1.32648, -0.4670494, 0, 0.4117647, 1, 1,
0.2699567, -1.967932, 3.216624, 0, 0.4078431, 1, 1,
0.2732376, 0.5718066, 1.093863, 0, 0.4, 1, 1,
0.2766767, 0.366437, -0.4558253, 0, 0.3921569, 1, 1,
0.2779899, 0.3790514, -0.6210679, 0, 0.3882353, 1, 1,
0.2827898, -0.02988314, 2.496167, 0, 0.3803922, 1, 1,
0.2848561, -0.4596054, 3.751759, 0, 0.3764706, 1, 1,
0.2880302, -1.65727, 2.035009, 0, 0.3686275, 1, 1,
0.2917533, 0.9434683, -1.881654, 0, 0.3647059, 1, 1,
0.2921936, -1.184598, 4.338688, 0, 0.3568628, 1, 1,
0.2971447, -1.706198, 4.513018, 0, 0.3529412, 1, 1,
0.2983971, 1.459946, 0.04013921, 0, 0.345098, 1, 1,
0.3007033, -0.1059351, 2.760888, 0, 0.3411765, 1, 1,
0.3102177, -0.6720098, 2.219308, 0, 0.3333333, 1, 1,
0.3269092, 0.5707296, 0.2789174, 0, 0.3294118, 1, 1,
0.3287261, -1.898928, 3.693459, 0, 0.3215686, 1, 1,
0.3318295, -2.791008, 2.903158, 0, 0.3176471, 1, 1,
0.3324847, 0.703002, 0.7497038, 0, 0.3098039, 1, 1,
0.3332116, -0.2927348, 2.720963, 0, 0.3058824, 1, 1,
0.3356527, -0.2355238, 2.584075, 0, 0.2980392, 1, 1,
0.3398396, 0.8759416, 1.222432, 0, 0.2901961, 1, 1,
0.3416314, 0.6036429, -0.2375965, 0, 0.2862745, 1, 1,
0.345387, 0.1092941, 1.940966, 0, 0.2784314, 1, 1,
0.3474071, -0.6020426, 1.415291, 0, 0.2745098, 1, 1,
0.3482007, 0.5297044, 1.586758, 0, 0.2666667, 1, 1,
0.3488339, 1.760736, 0.05519046, 0, 0.2627451, 1, 1,
0.3537453, -0.3840309, 2.005138, 0, 0.254902, 1, 1,
0.355848, 0.6129153, 1.487926, 0, 0.2509804, 1, 1,
0.3575444, -0.3950207, 2.902588, 0, 0.2431373, 1, 1,
0.3581541, 1.731054, 1.666262, 0, 0.2392157, 1, 1,
0.3585076, 0.01424247, 0.3104087, 0, 0.2313726, 1, 1,
0.3597215, -0.2300264, 2.222821, 0, 0.227451, 1, 1,
0.3624958, -0.9598668, 2.249535, 0, 0.2196078, 1, 1,
0.3710959, -0.6241167, 3.584137, 0, 0.2156863, 1, 1,
0.3715278, 0.400601, 1.327959, 0, 0.2078431, 1, 1,
0.3731765, 1.437545, -0.3243665, 0, 0.2039216, 1, 1,
0.3737887, 0.8145894, 0.3930983, 0, 0.1960784, 1, 1,
0.3814406, -0.4814007, 3.435735, 0, 0.1882353, 1, 1,
0.3820549, -0.2904479, 2.83774, 0, 0.1843137, 1, 1,
0.383012, -1.280163, 1.786509, 0, 0.1764706, 1, 1,
0.3831193, -0.4676061, 3.188617, 0, 0.172549, 1, 1,
0.38322, -0.5092514, 4.907639, 0, 0.1647059, 1, 1,
0.3848052, -0.5043888, 3.343711, 0, 0.1607843, 1, 1,
0.3873267, 2.174963, 0.3238448, 0, 0.1529412, 1, 1,
0.387815, -0.9214281, 3.502117, 0, 0.1490196, 1, 1,
0.4065361, -0.07584108, 3.00748, 0, 0.1411765, 1, 1,
0.4149195, 0.6682045, 0.652742, 0, 0.1372549, 1, 1,
0.4168613, 1.117126, 1.889449, 0, 0.1294118, 1, 1,
0.4190114, 2.259394, -0.1014041, 0, 0.1254902, 1, 1,
0.4235187, 0.9147632, 0.1211331, 0, 0.1176471, 1, 1,
0.4270118, 1.330477, 0.9430465, 0, 0.1137255, 1, 1,
0.4306093, 0.8224266, 0.9601133, 0, 0.1058824, 1, 1,
0.4407051, 0.9243439, -0.2174029, 0, 0.09803922, 1, 1,
0.4424627, -1.256115, 2.882441, 0, 0.09411765, 1, 1,
0.4439772, 1.150366, -0.3793017, 0, 0.08627451, 1, 1,
0.4455875, 1.455031, -0.141022, 0, 0.08235294, 1, 1,
0.4495125, -0.150839, 2.077209, 0, 0.07450981, 1, 1,
0.4512135, 0.7867797, 1.110942, 0, 0.07058824, 1, 1,
0.4517103, 0.2988684, -0.25713, 0, 0.0627451, 1, 1,
0.4540508, 0.6459081, 0.2391391, 0, 0.05882353, 1, 1,
0.45701, 0.8944772, 0.3461045, 0, 0.05098039, 1, 1,
0.4585141, 2.346799, 0.9552833, 0, 0.04705882, 1, 1,
0.4587541, 0.8061844, 0.9143452, 0, 0.03921569, 1, 1,
0.4597826, 0.367281, -0.1325114, 0, 0.03529412, 1, 1,
0.4619319, 0.178985, -0.224901, 0, 0.02745098, 1, 1,
0.4634345, -0.5584075, 2.785172, 0, 0.02352941, 1, 1,
0.4639489, 1.287265, 1.063257, 0, 0.01568628, 1, 1,
0.4651774, 0.4709963, 0.2481701, 0, 0.01176471, 1, 1,
0.4690636, 0.9512665, 0.6823612, 0, 0.003921569, 1, 1,
0.4725815, 0.4194493, 0.1205154, 0.003921569, 0, 1, 1,
0.4737118, -1.064903, 3.500767, 0.007843138, 0, 1, 1,
0.4763889, -0.002564217, 2.923514, 0.01568628, 0, 1, 1,
0.4775963, 1.085591, 1.061067, 0.01960784, 0, 1, 1,
0.4796535, -0.9657726, 2.893347, 0.02745098, 0, 1, 1,
0.484726, -1.579698, 1.044037, 0.03137255, 0, 1, 1,
0.488011, -0.9466168, 1.920653, 0.03921569, 0, 1, 1,
0.4938835, -0.8724661, 1.008907, 0.04313726, 0, 1, 1,
0.4955093, 0.6287162, -1.366506, 0.05098039, 0, 1, 1,
0.4996324, -1.838012, 3.383503, 0.05490196, 0, 1, 1,
0.5040841, -1.061347, 2.393295, 0.0627451, 0, 1, 1,
0.5045994, 1.643527, 0.09171099, 0.06666667, 0, 1, 1,
0.5066345, 0.1761853, 2.886975, 0.07450981, 0, 1, 1,
0.5069528, -1.435411, 3.217977, 0.07843138, 0, 1, 1,
0.5080878, -0.05288095, 1.10894, 0.08627451, 0, 1, 1,
0.5082233, -1.245642, 2.253113, 0.09019608, 0, 1, 1,
0.5110737, 0.8708117, -0.2252174, 0.09803922, 0, 1, 1,
0.5193736, 0.1526158, 0.6646425, 0.1058824, 0, 1, 1,
0.5201628, -0.6717594, 1.9164, 0.1098039, 0, 1, 1,
0.5219302, 1.672141, -1.306075, 0.1176471, 0, 1, 1,
0.5222662, 0.02875599, 2.406112, 0.1215686, 0, 1, 1,
0.5245929, 1.287673, -0.4251987, 0.1294118, 0, 1, 1,
0.5247618, 0.7141057, 0.2638084, 0.1333333, 0, 1, 1,
0.5258774, -0.2368556, 2.118271, 0.1411765, 0, 1, 1,
0.5273502, -0.930683, 1.576971, 0.145098, 0, 1, 1,
0.5289299, -0.1532444, 0.5171993, 0.1529412, 0, 1, 1,
0.5327123, -0.9150282, 3.126913, 0.1568628, 0, 1, 1,
0.5346069, -0.946107, 1.063103, 0.1647059, 0, 1, 1,
0.5371796, -0.7571406, 4.028264, 0.1686275, 0, 1, 1,
0.5382039, -0.8750626, 2.92911, 0.1764706, 0, 1, 1,
0.5393052, 0.7680764, 0.7517036, 0.1803922, 0, 1, 1,
0.5414277, -2.121104, 4.396205, 0.1882353, 0, 1, 1,
0.5430936, -0.5334379, 0.2664875, 0.1921569, 0, 1, 1,
0.5455792, -0.7618985, 4.042639, 0.2, 0, 1, 1,
0.546941, 0.935327, 0.9134971, 0.2078431, 0, 1, 1,
0.5510788, -0.9306008, 1.596994, 0.2117647, 0, 1, 1,
0.5581462, 1.809213, 0.7697243, 0.2196078, 0, 1, 1,
0.5583215, -0.05633104, 1.207731, 0.2235294, 0, 1, 1,
0.5591925, -0.04206155, 1.851726, 0.2313726, 0, 1, 1,
0.5630829, 2.139901, -0.01711013, 0.2352941, 0, 1, 1,
0.5660601, -0.4337947, 3.113969, 0.2431373, 0, 1, 1,
0.5669296, 0.9261906, 0.5534006, 0.2470588, 0, 1, 1,
0.5728011, 0.09418218, 1.29952, 0.254902, 0, 1, 1,
0.5754598, -1.811178, 3.575928, 0.2588235, 0, 1, 1,
0.581005, 0.7025141, 0.2998059, 0.2666667, 0, 1, 1,
0.5818154, -1.278809, 3.258635, 0.2705882, 0, 1, 1,
0.5824226, -1.124344, 4.340066, 0.2784314, 0, 1, 1,
0.587164, -0.6537554, 1.786315, 0.282353, 0, 1, 1,
0.5914363, -2.41843, 2.91491, 0.2901961, 0, 1, 1,
0.5934423, -0.07754739, 1.047686, 0.2941177, 0, 1, 1,
0.5952521, -0.002276527, 0.4290804, 0.3019608, 0, 1, 1,
0.5959237, 0.4281805, -0.4307288, 0.3098039, 0, 1, 1,
0.5975399, -0.09562804, 0.009926435, 0.3137255, 0, 1, 1,
0.6164265, -0.7865725, 1.373264, 0.3215686, 0, 1, 1,
0.6176177, 1.65299, -0.4329527, 0.3254902, 0, 1, 1,
0.620419, -0.2304247, 4.993032, 0.3333333, 0, 1, 1,
0.6212022, -0.0866869, 2.230767, 0.3372549, 0, 1, 1,
0.6273043, 1.574376, -1.39984, 0.345098, 0, 1, 1,
0.6394109, 0.1986626, 1.860082, 0.3490196, 0, 1, 1,
0.641835, 0.4071158, -0.02883099, 0.3568628, 0, 1, 1,
0.645005, 0.4181525, -0.4169042, 0.3607843, 0, 1, 1,
0.6454668, 1.60733, 0.05690145, 0.3686275, 0, 1, 1,
0.651915, 1.855076, -0.8713871, 0.372549, 0, 1, 1,
0.6529126, -0.1718749, 0.07840157, 0.3803922, 0, 1, 1,
0.664457, -0.6932267, 3.415502, 0.3843137, 0, 1, 1,
0.6720169, -2.150372, 1.567533, 0.3921569, 0, 1, 1,
0.6731723, 0.1934738, 2.983967, 0.3960784, 0, 1, 1,
0.6779904, -0.4430782, 1.021844, 0.4039216, 0, 1, 1,
0.678266, 0.5184225, -0.4138897, 0.4117647, 0, 1, 1,
0.68265, 2.641901, 1.046517, 0.4156863, 0, 1, 1,
0.68589, -0.3857635, 3.935659, 0.4235294, 0, 1, 1,
0.68659, 1.138501, 2.033233, 0.427451, 0, 1, 1,
0.6956165, -0.1965543, 2.489295, 0.4352941, 0, 1, 1,
0.697166, 1.511185, -0.3751194, 0.4392157, 0, 1, 1,
0.6976123, -0.2580205, 1.841245, 0.4470588, 0, 1, 1,
0.7030959, 1.111455, 0.4499815, 0.4509804, 0, 1, 1,
0.7112014, -1.476464, 2.073034, 0.4588235, 0, 1, 1,
0.7130121, -0.3760917, 2.027913, 0.4627451, 0, 1, 1,
0.713033, -0.9541844, 1.82276, 0.4705882, 0, 1, 1,
0.7139436, 0.6355634, 0.921738, 0.4745098, 0, 1, 1,
0.7180207, 0.876411, 0.03084698, 0.4823529, 0, 1, 1,
0.7268992, -0.3139337, 0.6589565, 0.4862745, 0, 1, 1,
0.7293553, 0.3258775, 0.7222744, 0.4941176, 0, 1, 1,
0.733436, -0.01693949, 2.285752, 0.5019608, 0, 1, 1,
0.7341663, -0.5580581, 2.028277, 0.5058824, 0, 1, 1,
0.7365751, 1.318598, 1.459465, 0.5137255, 0, 1, 1,
0.7426805, 1.028894, 0.7038968, 0.5176471, 0, 1, 1,
0.7483444, 0.363348, -0.9601528, 0.5254902, 0, 1, 1,
0.7506729, 0.8710459, 1.915401, 0.5294118, 0, 1, 1,
0.7583627, 1.513216, -0.06422054, 0.5372549, 0, 1, 1,
0.7585506, -1.40778, 0.9431002, 0.5411765, 0, 1, 1,
0.7646192, 1.029263, -0.04232452, 0.5490196, 0, 1, 1,
0.7694007, 0.433036, 0.5318118, 0.5529412, 0, 1, 1,
0.7739699, 0.1210434, 1.128288, 0.5607843, 0, 1, 1,
0.7740642, 0.4854967, 0.4024722, 0.5647059, 0, 1, 1,
0.7778097, -1.411793, 4.678808, 0.572549, 0, 1, 1,
0.7781419, -0.1817201, 1.834934, 0.5764706, 0, 1, 1,
0.7853373, -0.2968038, 1.497425, 0.5843138, 0, 1, 1,
0.7858884, -0.6097344, 2.15357, 0.5882353, 0, 1, 1,
0.789484, -1.368345, 3.451838, 0.5960785, 0, 1, 1,
0.7908635, -1.469322, 2.127282, 0.6039216, 0, 1, 1,
0.7916371, -0.8516585, 2.505558, 0.6078432, 0, 1, 1,
0.7978521, -1.455074, 3.46418, 0.6156863, 0, 1, 1,
0.8004823, 0.01574898, 1.987926, 0.6196079, 0, 1, 1,
0.800625, 1.042117, -0.8478773, 0.627451, 0, 1, 1,
0.8015059, 0.2117777, -0.02434411, 0.6313726, 0, 1, 1,
0.8029426, -0.8492828, 2.311005, 0.6392157, 0, 1, 1,
0.8092463, 0.7841612, 1.275966, 0.6431373, 0, 1, 1,
0.8097113, 1.019211, -0.08063225, 0.6509804, 0, 1, 1,
0.8150263, -1.490181, 3.032802, 0.654902, 0, 1, 1,
0.8165003, 0.2229046, 1.247167, 0.6627451, 0, 1, 1,
0.823208, 1.497086, 1.6816, 0.6666667, 0, 1, 1,
0.8320789, 0.1139692, 0.7086282, 0.6745098, 0, 1, 1,
0.8446819, 0.8466396, 1.58528, 0.6784314, 0, 1, 1,
0.8456169, -0.04309876, 0.5711423, 0.6862745, 0, 1, 1,
0.8521242, -0.9809148, 2.080778, 0.6901961, 0, 1, 1,
0.8554218, -0.0728938, 1.140742, 0.6980392, 0, 1, 1,
0.8559915, -0.5026085, 2.739899, 0.7058824, 0, 1, 1,
0.856115, 0.1559793, 0.9507664, 0.7098039, 0, 1, 1,
0.8564139, -0.8227006, 2.466713, 0.7176471, 0, 1, 1,
0.8578563, -1.178079, 0.5664975, 0.7215686, 0, 1, 1,
0.8616525, -0.6139521, 1.575514, 0.7294118, 0, 1, 1,
0.8658872, -1.484747, 1.026266, 0.7333333, 0, 1, 1,
0.8743014, -0.5718961, 1.753353, 0.7411765, 0, 1, 1,
0.8744426, 1.131487, 0.6803198, 0.7450981, 0, 1, 1,
0.8759995, -0.4718023, 0.8716102, 0.7529412, 0, 1, 1,
0.8798106, 1.297384, 1.322128, 0.7568628, 0, 1, 1,
0.8819337, 0.7007148, 1.569843, 0.7647059, 0, 1, 1,
0.8825909, -0.3000206, 1.649664, 0.7686275, 0, 1, 1,
0.8848326, 1.215884, -0.3541188, 0.7764706, 0, 1, 1,
0.8885375, -0.4433786, 3.202655, 0.7803922, 0, 1, 1,
0.8908824, -2.276914, 1.905082, 0.7882353, 0, 1, 1,
0.8931424, 0.1370365, 0.4489195, 0.7921569, 0, 1, 1,
0.8939161, -1.118551, 2.01181, 0.8, 0, 1, 1,
0.8947583, 0.5419025, 1.402814, 0.8078431, 0, 1, 1,
0.9009265, 1.228904, -0.02700574, 0.8117647, 0, 1, 1,
0.9027882, -1.878893, 2.175279, 0.8196079, 0, 1, 1,
0.9029641, 0.7362443, 0.3645279, 0.8235294, 0, 1, 1,
0.9072922, 0.1488325, 2.374616, 0.8313726, 0, 1, 1,
0.9108999, -0.5721253, 1.895662, 0.8352941, 0, 1, 1,
0.9129056, -0.6173235, 3.720564, 0.8431373, 0, 1, 1,
0.9201367, 0.1769776, 0.890312, 0.8470588, 0, 1, 1,
0.9231198, 0.9206955, 0.2460953, 0.854902, 0, 1, 1,
0.9265023, 0.9176549, -0.006509541, 0.8588235, 0, 1, 1,
0.9271485, -0.7699774, 3.750764, 0.8666667, 0, 1, 1,
0.9275492, 0.02839659, 3.29312, 0.8705882, 0, 1, 1,
0.9282709, 0.8163646, 0.08742229, 0.8784314, 0, 1, 1,
0.9301012, 0.3849231, 3.778642, 0.8823529, 0, 1, 1,
0.9324129, -0.8059081, 1.676529, 0.8901961, 0, 1, 1,
0.9469505, -0.6709937, 2.41584, 0.8941177, 0, 1, 1,
0.9504267, 1.224878, 0.2078854, 0.9019608, 0, 1, 1,
0.9560002, 0.3145882, 1.318737, 0.9098039, 0, 1, 1,
0.9583057, 1.31108, 3.054599, 0.9137255, 0, 1, 1,
0.9671873, 1.404396, -1.297736, 0.9215686, 0, 1, 1,
0.9777424, 0.4109276, 2.562866, 0.9254902, 0, 1, 1,
0.9824954, 0.3803855, -0.8679715, 0.9333333, 0, 1, 1,
0.9902678, 1.541937, 0.3888718, 0.9372549, 0, 1, 1,
0.990317, -0.8522991, 0.6297764, 0.945098, 0, 1, 1,
0.9916877, 0.5033697, 1.015644, 0.9490196, 0, 1, 1,
0.9931304, -0.2487559, 1.721795, 0.9568627, 0, 1, 1,
0.9966878, 0.4066285, 0.8757588, 0.9607843, 0, 1, 1,
0.9995247, 1.000322, 0.2733429, 0.9686275, 0, 1, 1,
1.000387, -0.5506735, 3.634866, 0.972549, 0, 1, 1,
1.005784, -0.5935083, 1.286342, 0.9803922, 0, 1, 1,
1.016187, -0.6778954, 2.511482, 0.9843137, 0, 1, 1,
1.023355, -1.019638, 0.1495098, 0.9921569, 0, 1, 1,
1.027474, 0.5144919, 1.633823, 0.9960784, 0, 1, 1,
1.029817, 0.4534082, 3.037084, 1, 0, 0.9960784, 1,
1.030708, 0.411548, 1.537036, 1, 0, 0.9882353, 1,
1.032892, -0.4208852, 1.525979, 1, 0, 0.9843137, 1,
1.038589, 0.4918438, 2.650877, 1, 0, 0.9764706, 1,
1.042713, -1.689319, 1.28696, 1, 0, 0.972549, 1,
1.047873, 0.6142281, 2.253333, 1, 0, 0.9647059, 1,
1.054273, -0.1954257, 0.001939328, 1, 0, 0.9607843, 1,
1.06019, 1.051252, 1.292352, 1, 0, 0.9529412, 1,
1.065678, -0.07967266, 2.762446, 1, 0, 0.9490196, 1,
1.085157, 0.1872536, 1.925686, 1, 0, 0.9411765, 1,
1.08877, -0.6601743, 1.394071, 1, 0, 0.9372549, 1,
1.089297, 1.340629, 0.4679534, 1, 0, 0.9294118, 1,
1.095612, -0.3721862, 2.477921, 1, 0, 0.9254902, 1,
1.09572, 0.4029091, 2.040554, 1, 0, 0.9176471, 1,
1.095858, -0.6149014, 3.159683, 1, 0, 0.9137255, 1,
1.09925, 0.600982, 0.9482798, 1, 0, 0.9058824, 1,
1.101596, -1.6729, 3.228232, 1, 0, 0.9019608, 1,
1.109308, -0.4537509, 2.216738, 1, 0, 0.8941177, 1,
1.10934, 0.4511855, 0.8789936, 1, 0, 0.8862745, 1,
1.11687, -1.358803, 3.328312, 1, 0, 0.8823529, 1,
1.121138, -0.4403248, 1.282817, 1, 0, 0.8745098, 1,
1.121587, -0.5735291, 1.384021, 1, 0, 0.8705882, 1,
1.124331, 0.03983686, 0.4539137, 1, 0, 0.8627451, 1,
1.12701, -0.4793035, -0.1686163, 1, 0, 0.8588235, 1,
1.12792, 0.6812218, -0.8159532, 1, 0, 0.8509804, 1,
1.129774, -0.522978, 1.30949, 1, 0, 0.8470588, 1,
1.135566, 0.8016255, 2.938828, 1, 0, 0.8392157, 1,
1.139569, -0.08062519, 0.7881256, 1, 0, 0.8352941, 1,
1.14121, -1.354964, 0.05987502, 1, 0, 0.827451, 1,
1.147817, 1.035632, 1.97942, 1, 0, 0.8235294, 1,
1.153167, -0.6805395, 0.628906, 1, 0, 0.8156863, 1,
1.158287, -0.465625, 1.659761, 1, 0, 0.8117647, 1,
1.162512, -0.8797957, 2.831315, 1, 0, 0.8039216, 1,
1.166239, 0.7420961, 0.8664003, 1, 0, 0.7960784, 1,
1.16764, 0.4810511, 2.36966, 1, 0, 0.7921569, 1,
1.180647, -1.543182, 2.245192, 1, 0, 0.7843137, 1,
1.180856, -0.5078664, 2.17704, 1, 0, 0.7803922, 1,
1.181114, -0.2362025, 0.5550894, 1, 0, 0.772549, 1,
1.185776, -1.343816, 3.857977, 1, 0, 0.7686275, 1,
1.190357, 1.18446, 0.1732121, 1, 0, 0.7607843, 1,
1.191277, 0.2180395, 2.944367, 1, 0, 0.7568628, 1,
1.199862, 0.6813917, 1.051466, 1, 0, 0.7490196, 1,
1.199992, -0.4667123, 1.968405, 1, 0, 0.7450981, 1,
1.200379, 1.392276, 0.05512871, 1, 0, 0.7372549, 1,
1.216166, 0.2485382, 1.258721, 1, 0, 0.7333333, 1,
1.229314, -1.077147, 1.211401, 1, 0, 0.7254902, 1,
1.229716, -1.488105, 2.867221, 1, 0, 0.7215686, 1,
1.238656, 0.2642142, 1.04579, 1, 0, 0.7137255, 1,
1.243015, 0.6758825, 0.7860045, 1, 0, 0.7098039, 1,
1.250818, -0.02304485, 1.490077, 1, 0, 0.7019608, 1,
1.254151, 0.987655, 1.439545, 1, 0, 0.6941177, 1,
1.257149, 0.2200751, 1.847968, 1, 0, 0.6901961, 1,
1.266127, -1.182727, 2.905995, 1, 0, 0.682353, 1,
1.26673, -2.179583, 3.975617, 1, 0, 0.6784314, 1,
1.274819, -0.7802883, 1.578112, 1, 0, 0.6705883, 1,
1.283667, -0.02338623, 2.439727, 1, 0, 0.6666667, 1,
1.283874, -0.08080748, 3.444366, 1, 0, 0.6588235, 1,
1.284621, -0.3727725, 2.117899, 1, 0, 0.654902, 1,
1.293137, 1.309803, -0.03201404, 1, 0, 0.6470588, 1,
1.294009, 0.7051839, 0.4730075, 1, 0, 0.6431373, 1,
1.296334, 0.745079, 1.183114, 1, 0, 0.6352941, 1,
1.296976, 0.1836006, 1.687862, 1, 0, 0.6313726, 1,
1.299982, 0.81019, 1.225695, 1, 0, 0.6235294, 1,
1.300441, -0.008771633, 1.289945, 1, 0, 0.6196079, 1,
1.305235, -1.654265, 1.883071, 1, 0, 0.6117647, 1,
1.305745, -1.099561, 2.522292, 1, 0, 0.6078432, 1,
1.306836, -1.395542, 0.1091959, 1, 0, 0.6, 1,
1.308348, -0.5696004, 1.560004, 1, 0, 0.5921569, 1,
1.315502, 1.468795, 1.681996, 1, 0, 0.5882353, 1,
1.331012, -0.5368888, 0.4845918, 1, 0, 0.5803922, 1,
1.34303, 0.2856004, 1.697469, 1, 0, 0.5764706, 1,
1.353481, -0.6309599, 2.026187, 1, 0, 0.5686275, 1,
1.369817, -0.2869102, 1.908428, 1, 0, 0.5647059, 1,
1.383321, 0.0647028, 0.5261567, 1, 0, 0.5568628, 1,
1.383688, 0.7230629, 0.969313, 1, 0, 0.5529412, 1,
1.394385, -0.9397802, 0.5750327, 1, 0, 0.5450981, 1,
1.396968, 1.841362, -0.7183412, 1, 0, 0.5411765, 1,
1.399417, 2.054761, -0.1836487, 1, 0, 0.5333334, 1,
1.404485, 0.362071, 1.616695, 1, 0, 0.5294118, 1,
1.451616, 0.694862, 0.1296196, 1, 0, 0.5215687, 1,
1.45457, -0.2374785, 1.571246, 1, 0, 0.5176471, 1,
1.45469, -0.2339613, 1.064343, 1, 0, 0.509804, 1,
1.455585, -0.1887721, 2.120267, 1, 0, 0.5058824, 1,
1.456484, 0.3897689, -0.2077625, 1, 0, 0.4980392, 1,
1.456779, -0.4608323, 2.274271, 1, 0, 0.4901961, 1,
1.473876, -0.2883707, 2.391392, 1, 0, 0.4862745, 1,
1.479721, -1.258572, 2.759905, 1, 0, 0.4784314, 1,
1.480429, -0.6558887, 2.559576, 1, 0, 0.4745098, 1,
1.480515, -0.4693311, 0.570229, 1, 0, 0.4666667, 1,
1.49048, 1.403141, -0.1106982, 1, 0, 0.4627451, 1,
1.493478, 0.539034, 1.584812, 1, 0, 0.454902, 1,
1.513301, 0.4381697, 1.873538, 1, 0, 0.4509804, 1,
1.51502, 0.2814021, 3.526146, 1, 0, 0.4431373, 1,
1.52054, -0.299286, 0.204391, 1, 0, 0.4392157, 1,
1.526531, 1.496825, 2.181865, 1, 0, 0.4313726, 1,
1.533118, -1.030754, 2.498851, 1, 0, 0.427451, 1,
1.536292, 1.211847, 1.554312, 1, 0, 0.4196078, 1,
1.537272, 2.306912, 0.4882745, 1, 0, 0.4156863, 1,
1.553842, 0.7747129, -1.107309, 1, 0, 0.4078431, 1,
1.55481, -0.1813423, 1.444578, 1, 0, 0.4039216, 1,
1.57038, 1.644556, -0.4482355, 1, 0, 0.3960784, 1,
1.572392, 0.1891808, 1.635012, 1, 0, 0.3882353, 1,
1.5754, 1.154226, 0.9737613, 1, 0, 0.3843137, 1,
1.580406, 0.4482026, 1.033595, 1, 0, 0.3764706, 1,
1.583694, -0.9936274, 2.090933, 1, 0, 0.372549, 1,
1.587433, -0.5983086, 1.428672, 1, 0, 0.3647059, 1,
1.591503, -1.646318, 3.00683, 1, 0, 0.3607843, 1,
1.604793, -1.208616, 0.1943579, 1, 0, 0.3529412, 1,
1.610492, -0.6847777, 2.323726, 1, 0, 0.3490196, 1,
1.621451, -0.5743062, 1.017801, 1, 0, 0.3411765, 1,
1.62506, -1.623996, 1.240688, 1, 0, 0.3372549, 1,
1.639347, -0.1532549, 2.141627, 1, 0, 0.3294118, 1,
1.639684, -0.8103547, -0.385334, 1, 0, 0.3254902, 1,
1.676142, 1.620273, 1.620331, 1, 0, 0.3176471, 1,
1.682103, -0.2773356, 3.997449, 1, 0, 0.3137255, 1,
1.685741, 0.2136992, 1.468015, 1, 0, 0.3058824, 1,
1.716917, -0.2954258, 1.003002, 1, 0, 0.2980392, 1,
1.724307, 1.196506, 1.866745, 1, 0, 0.2941177, 1,
1.72627, -1.235522, 2.579608, 1, 0, 0.2862745, 1,
1.729143, -0.726849, 4.584082, 1, 0, 0.282353, 1,
1.77355, -1.355836, 1.46241, 1, 0, 0.2745098, 1,
1.795967, -0.7193708, 2.381457, 1, 0, 0.2705882, 1,
1.806153, 1.598002, 1.64845, 1, 0, 0.2627451, 1,
1.809907, -0.1726868, 2.886853, 1, 0, 0.2588235, 1,
1.831039, -0.4482042, 4.173558, 1, 0, 0.2509804, 1,
1.841008, -0.58867, 2.203614, 1, 0, 0.2470588, 1,
1.84766, 0.5697784, -0.8843626, 1, 0, 0.2392157, 1,
1.861365, 0.7881439, 3.352964, 1, 0, 0.2352941, 1,
1.864903, -0.4968276, 1.943884, 1, 0, 0.227451, 1,
1.911628, -0.7797296, -1.68261, 1, 0, 0.2235294, 1,
1.924189, -0.8773994, 0.7814777, 1, 0, 0.2156863, 1,
1.931854, 0.8295047, 1.037992, 1, 0, 0.2117647, 1,
1.934862, 0.6193234, 0.8314459, 1, 0, 0.2039216, 1,
1.952113, -2.056613, 4.947598, 1, 0, 0.1960784, 1,
2.022618, -1.115224, 1.209005, 1, 0, 0.1921569, 1,
2.023335, 1.35321, 0.6878061, 1, 0, 0.1843137, 1,
2.053485, -0.08519895, 2.525105, 1, 0, 0.1803922, 1,
2.069298, -0.3145578, 2.395631, 1, 0, 0.172549, 1,
2.071266, -0.7099803, 2.393261, 1, 0, 0.1686275, 1,
2.077765, -0.3008124, 1.63429, 1, 0, 0.1607843, 1,
2.091711, 0.7271567, 3.611867, 1, 0, 0.1568628, 1,
2.094693, -0.5827681, 2.615604, 1, 0, 0.1490196, 1,
2.109276, -0.538269, 3.320518, 1, 0, 0.145098, 1,
2.137228, -1.259758, 2.571283, 1, 0, 0.1372549, 1,
2.153465, 1.900661, 0.9714791, 1, 0, 0.1333333, 1,
2.17544, -0.5802917, 3.042007, 1, 0, 0.1254902, 1,
2.18349, -0.3299414, 1.004448, 1, 0, 0.1215686, 1,
2.208955, -0.8607947, 2.187849, 1, 0, 0.1137255, 1,
2.216308, 0.174491, 1.898089, 1, 0, 0.1098039, 1,
2.236893, 0.2263255, 2.423237, 1, 0, 0.1019608, 1,
2.283453, -0.9872751, 1.390592, 1, 0, 0.09411765, 1,
2.304408, -0.1633864, -0.7325531, 1, 0, 0.09019608, 1,
2.318431, -0.1964101, 0.8108616, 1, 0, 0.08235294, 1,
2.381577, 2.267392, 2.29461, 1, 0, 0.07843138, 1,
2.450819, 0.8850124, 1.532914, 1, 0, 0.07058824, 1,
2.460452, -0.3059484, 1.760925, 1, 0, 0.06666667, 1,
2.473117, -0.03954068, 0.7266971, 1, 0, 0.05882353, 1,
2.496853, 0.6009558, 1.362952, 1, 0, 0.05490196, 1,
2.519913, 0.9104286, 1.232677, 1, 0, 0.04705882, 1,
2.654319, 1.176024, 0.3364304, 1, 0, 0.04313726, 1,
2.726106, -0.7016353, 4.783913, 1, 0, 0.03529412, 1,
2.752613, -0.9302405, 1.406846, 1, 0, 0.03137255, 1,
2.787663, -0.5565203, 2.405399, 1, 0, 0.02352941, 1,
2.997782, 1.470394, 2.544652, 1, 0, 0.01960784, 1,
3.033785, 0.8008689, 1.202682, 1, 0, 0.01176471, 1,
3.049499, -0.7717396, 2.956433, 1, 0, 0.007843138, 1
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
0.02000666, -4.659373, -6.763025, 0, -0.5, 0.5, 0.5,
0.02000666, -4.659373, -6.763025, 1, -0.5, 0.5, 0.5,
0.02000666, -4.659373, -6.763025, 1, 1.5, 0.5, 0.5,
0.02000666, -4.659373, -6.763025, 0, 1.5, 0.5, 0.5
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
-4.036483, -0.2997628, -6.763025, 0, -0.5, 0.5, 0.5,
-4.036483, -0.2997628, -6.763025, 1, -0.5, 0.5, 0.5,
-4.036483, -0.2997628, -6.763025, 1, 1.5, 0.5, 0.5,
-4.036483, -0.2997628, -6.763025, 0, 1.5, 0.5, 0.5
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
-4.036483, -4.659373, 0.17751, 0, -0.5, 0.5, 0.5,
-4.036483, -4.659373, 0.17751, 1, -0.5, 0.5, 0.5,
-4.036483, -4.659373, 0.17751, 1, 1.5, 0.5, 0.5,
-4.036483, -4.659373, 0.17751, 0, 1.5, 0.5, 0.5
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
-3, -3.653309, -5.161364,
3, -3.653309, -5.161364,
-3, -3.653309, -5.161364,
-3, -3.820986, -5.428307,
-2, -3.653309, -5.161364,
-2, -3.820986, -5.428307,
-1, -3.653309, -5.161364,
-1, -3.820986, -5.428307,
0, -3.653309, -5.161364,
0, -3.820986, -5.428307,
1, -3.653309, -5.161364,
1, -3.820986, -5.428307,
2, -3.653309, -5.161364,
2, -3.820986, -5.428307,
3, -3.653309, -5.161364,
3, -3.820986, -5.428307
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
-3, -4.156341, -5.962194, 0, -0.5, 0.5, 0.5,
-3, -4.156341, -5.962194, 1, -0.5, 0.5, 0.5,
-3, -4.156341, -5.962194, 1, 1.5, 0.5, 0.5,
-3, -4.156341, -5.962194, 0, 1.5, 0.5, 0.5,
-2, -4.156341, -5.962194, 0, -0.5, 0.5, 0.5,
-2, -4.156341, -5.962194, 1, -0.5, 0.5, 0.5,
-2, -4.156341, -5.962194, 1, 1.5, 0.5, 0.5,
-2, -4.156341, -5.962194, 0, 1.5, 0.5, 0.5,
-1, -4.156341, -5.962194, 0, -0.5, 0.5, 0.5,
-1, -4.156341, -5.962194, 1, -0.5, 0.5, 0.5,
-1, -4.156341, -5.962194, 1, 1.5, 0.5, 0.5,
-1, -4.156341, -5.962194, 0, 1.5, 0.5, 0.5,
0, -4.156341, -5.962194, 0, -0.5, 0.5, 0.5,
0, -4.156341, -5.962194, 1, -0.5, 0.5, 0.5,
0, -4.156341, -5.962194, 1, 1.5, 0.5, 0.5,
0, -4.156341, -5.962194, 0, 1.5, 0.5, 0.5,
1, -4.156341, -5.962194, 0, -0.5, 0.5, 0.5,
1, -4.156341, -5.962194, 1, -0.5, 0.5, 0.5,
1, -4.156341, -5.962194, 1, 1.5, 0.5, 0.5,
1, -4.156341, -5.962194, 0, 1.5, 0.5, 0.5,
2, -4.156341, -5.962194, 0, -0.5, 0.5, 0.5,
2, -4.156341, -5.962194, 1, -0.5, 0.5, 0.5,
2, -4.156341, -5.962194, 1, 1.5, 0.5, 0.5,
2, -4.156341, -5.962194, 0, 1.5, 0.5, 0.5,
3, -4.156341, -5.962194, 0, -0.5, 0.5, 0.5,
3, -4.156341, -5.962194, 1, -0.5, 0.5, 0.5,
3, -4.156341, -5.962194, 1, 1.5, 0.5, 0.5,
3, -4.156341, -5.962194, 0, 1.5, 0.5, 0.5
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
-3.10037, -3, -5.161364,
-3.10037, 2, -5.161364,
-3.10037, -3, -5.161364,
-3.256389, -3, -5.428307,
-3.10037, -2, -5.161364,
-3.256389, -2, -5.428307,
-3.10037, -1, -5.161364,
-3.256389, -1, -5.428307,
-3.10037, 0, -5.161364,
-3.256389, 0, -5.428307,
-3.10037, 1, -5.161364,
-3.256389, 1, -5.428307,
-3.10037, 2, -5.161364,
-3.256389, 2, -5.428307
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
-3.568427, -3, -5.962194, 0, -0.5, 0.5, 0.5,
-3.568427, -3, -5.962194, 1, -0.5, 0.5, 0.5,
-3.568427, -3, -5.962194, 1, 1.5, 0.5, 0.5,
-3.568427, -3, -5.962194, 0, 1.5, 0.5, 0.5,
-3.568427, -2, -5.962194, 0, -0.5, 0.5, 0.5,
-3.568427, -2, -5.962194, 1, -0.5, 0.5, 0.5,
-3.568427, -2, -5.962194, 1, 1.5, 0.5, 0.5,
-3.568427, -2, -5.962194, 0, 1.5, 0.5, 0.5,
-3.568427, -1, -5.962194, 0, -0.5, 0.5, 0.5,
-3.568427, -1, -5.962194, 1, -0.5, 0.5, 0.5,
-3.568427, -1, -5.962194, 1, 1.5, 0.5, 0.5,
-3.568427, -1, -5.962194, 0, 1.5, 0.5, 0.5,
-3.568427, 0, -5.962194, 0, -0.5, 0.5, 0.5,
-3.568427, 0, -5.962194, 1, -0.5, 0.5, 0.5,
-3.568427, 0, -5.962194, 1, 1.5, 0.5, 0.5,
-3.568427, 0, -5.962194, 0, 1.5, 0.5, 0.5,
-3.568427, 1, -5.962194, 0, -0.5, 0.5, 0.5,
-3.568427, 1, -5.962194, 1, -0.5, 0.5, 0.5,
-3.568427, 1, -5.962194, 1, 1.5, 0.5, 0.5,
-3.568427, 1, -5.962194, 0, 1.5, 0.5, 0.5,
-3.568427, 2, -5.962194, 0, -0.5, 0.5, 0.5,
-3.568427, 2, -5.962194, 1, -0.5, 0.5, 0.5,
-3.568427, 2, -5.962194, 1, 1.5, 0.5, 0.5,
-3.568427, 2, -5.962194, 0, 1.5, 0.5, 0.5
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
-3.10037, -3.653309, -4,
-3.10037, -3.653309, 4,
-3.10037, -3.653309, -4,
-3.256389, -3.820986, -4,
-3.10037, -3.653309, -2,
-3.256389, -3.820986, -2,
-3.10037, -3.653309, 0,
-3.256389, -3.820986, 0,
-3.10037, -3.653309, 2,
-3.256389, -3.820986, 2,
-3.10037, -3.653309, 4,
-3.256389, -3.820986, 4
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
-3.568427, -4.156341, -4, 0, -0.5, 0.5, 0.5,
-3.568427, -4.156341, -4, 1, -0.5, 0.5, 0.5,
-3.568427, -4.156341, -4, 1, 1.5, 0.5, 0.5,
-3.568427, -4.156341, -4, 0, 1.5, 0.5, 0.5,
-3.568427, -4.156341, -2, 0, -0.5, 0.5, 0.5,
-3.568427, -4.156341, -2, 1, -0.5, 0.5, 0.5,
-3.568427, -4.156341, -2, 1, 1.5, 0.5, 0.5,
-3.568427, -4.156341, -2, 0, 1.5, 0.5, 0.5,
-3.568427, -4.156341, 0, 0, -0.5, 0.5, 0.5,
-3.568427, -4.156341, 0, 1, -0.5, 0.5, 0.5,
-3.568427, -4.156341, 0, 1, 1.5, 0.5, 0.5,
-3.568427, -4.156341, 0, 0, 1.5, 0.5, 0.5,
-3.568427, -4.156341, 2, 0, -0.5, 0.5, 0.5,
-3.568427, -4.156341, 2, 1, -0.5, 0.5, 0.5,
-3.568427, -4.156341, 2, 1, 1.5, 0.5, 0.5,
-3.568427, -4.156341, 2, 0, 1.5, 0.5, 0.5,
-3.568427, -4.156341, 4, 0, -0.5, 0.5, 0.5,
-3.568427, -4.156341, 4, 1, -0.5, 0.5, 0.5,
-3.568427, -4.156341, 4, 1, 1.5, 0.5, 0.5,
-3.568427, -4.156341, 4, 0, 1.5, 0.5, 0.5
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
-3.10037, -3.653309, -5.161364,
-3.10037, 3.053783, -5.161364,
-3.10037, -3.653309, 5.516384,
-3.10037, 3.053783, 5.516384,
-3.10037, -3.653309, -5.161364,
-3.10037, -3.653309, 5.516384,
-3.10037, 3.053783, -5.161364,
-3.10037, 3.053783, 5.516384,
-3.10037, -3.653309, -5.161364,
3.140383, -3.653309, -5.161364,
-3.10037, -3.653309, 5.516384,
3.140383, -3.653309, 5.516384,
-3.10037, 3.053783, -5.161364,
3.140383, 3.053783, -5.161364,
-3.10037, 3.053783, 5.516384,
3.140383, 3.053783, 5.516384,
3.140383, -3.653309, -5.161364,
3.140383, 3.053783, -5.161364,
3.140383, -3.653309, 5.516384,
3.140383, 3.053783, 5.516384,
3.140383, -3.653309, -5.161364,
3.140383, -3.653309, 5.516384,
3.140383, 3.053783, -5.161364,
3.140383, 3.053783, 5.516384
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
var radius = 7.512755;
var distance = 33.4251;
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
mvMatrix.translate( -0.02000666, 0.2997628, -0.17751 );
mvMatrix.scale( 1.301596, 1.211097, 0.7607352 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.4251);
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


```r
open3d()
```

```
## glX 
##   2
```

```r
norflurazon<-read.table("norflurazon.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-norflurazon$V2
```

```
## Error in eval(expr, envir, enclos): object 'norflurazon' not found
```

```r
y<-norflurazon$V3
```

```
## Error in eval(expr, envir, enclos): object 'norflurazon' not found
```

```r
z<-norflurazon$V4
```

```
## Error in eval(expr, envir, enclos): object 'norflurazon' not found
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
-3.009485, 0.71437, -2.612953, 0, 0, 1, 1, 1,
-2.74462, -0.3462372, -0.6209517, 1, 0, 0, 1, 1,
-2.563404, -0.5988276, -0.226432, 1, 0, 0, 1, 1,
-2.561226, -1.290589, 0.8107591, 1, 0, 0, 1, 1,
-2.479097, -0.2101731, -2.809156, 1, 0, 0, 1, 1,
-2.445856, -0.09891644, -0.7933295, 1, 0, 0, 1, 1,
-2.348287, -1.786489, -2.401566, 0, 0, 0, 1, 1,
-2.346983, 0.5252023, -3.80889, 0, 0, 0, 1, 1,
-2.336661, -1.832905, -0.7141809, 0, 0, 0, 1, 1,
-2.323383, 0.7454828, -2.333655, 0, 0, 0, 1, 1,
-2.188152, 1.801723, -1.207092, 0, 0, 0, 1, 1,
-2.17899, 0.5347849, -2.680537, 0, 0, 0, 1, 1,
-2.172033, 1.405749, -0.05485774, 0, 0, 0, 1, 1,
-2.156808, -1.134735, -3.496661, 1, 1, 1, 1, 1,
-2.138638, -1.371733, -3.381837, 1, 1, 1, 1, 1,
-2.087835, 1.37467, -1.975947, 1, 1, 1, 1, 1,
-2.08704, -0.1772102, -1.956229, 1, 1, 1, 1, 1,
-2.073951, 0.009326275, -1.901933, 1, 1, 1, 1, 1,
-2.070391, -1.17776, -2.139359, 1, 1, 1, 1, 1,
-2.044765, 0.5449441, -1.908275, 1, 1, 1, 1, 1,
-2.039797, -0.5300357, -2.238284, 1, 1, 1, 1, 1,
-2.036409, -1.178414, -1.682504, 1, 1, 1, 1, 1,
-2.026955, -1.09843, -0.7996337, 1, 1, 1, 1, 1,
-2.023782, 0.6024665, -0.5152262, 1, 1, 1, 1, 1,
-2.017308, -0.23682, -0.3093368, 1, 1, 1, 1, 1,
-2.007758, -1.142727, -1.31962, 1, 1, 1, 1, 1,
-2.000323, -0.0646244, -1.767066, 1, 1, 1, 1, 1,
-1.999898, 1.287975, -0.4185144, 1, 1, 1, 1, 1,
-1.957984, 0.8510774, -0.9366661, 0, 0, 1, 1, 1,
-1.957862, -0.4462964, -0.5609395, 1, 0, 0, 1, 1,
-1.956628, -0.06534492, 1.459784, 1, 0, 0, 1, 1,
-1.919097, 0.6340439, -0.9646263, 1, 0, 0, 1, 1,
-1.90964, 0.8280754, -2.643527, 1, 0, 0, 1, 1,
-1.906039, -0.5153238, -2.539716, 1, 0, 0, 1, 1,
-1.887964, 0.4622378, -0.6766419, 0, 0, 0, 1, 1,
-1.879456, 0.4983389, -1.113572, 0, 0, 0, 1, 1,
-1.879134, 0.7639306, -1.582444, 0, 0, 0, 1, 1,
-1.850885, 0.3849818, -1.414213, 0, 0, 0, 1, 1,
-1.850715, 1.217437, 0.1685574, 0, 0, 0, 1, 1,
-1.8385, -1.965004, -2.970752, 0, 0, 0, 1, 1,
-1.824862, -0.2604741, -0.607288, 0, 0, 0, 1, 1,
-1.799722, 0.6540383, -0.945997, 1, 1, 1, 1, 1,
-1.796421, 0.720978, -2.907571, 1, 1, 1, 1, 1,
-1.7866, 1.323341, 1.149828, 1, 1, 1, 1, 1,
-1.785935, -3.380853, -3.167526, 1, 1, 1, 1, 1,
-1.776041, 0.6580556, 0.06146891, 1, 1, 1, 1, 1,
-1.762227, 1.015651, -0.7788476, 1, 1, 1, 1, 1,
-1.760803, 1.134689, -1.458979, 1, 1, 1, 1, 1,
-1.760069, 0.2001049, -1.067191, 1, 1, 1, 1, 1,
-1.759439, 0.7644452, -0.9044124, 1, 1, 1, 1, 1,
-1.741312, -0.9925256, -2.050674, 1, 1, 1, 1, 1,
-1.722193, 1.725039, -1.686312, 1, 1, 1, 1, 1,
-1.698148, -1.132718, -2.055375, 1, 1, 1, 1, 1,
-1.661965, -0.4093873, -2.062754, 1, 1, 1, 1, 1,
-1.655715, 1.726705, -1.554171, 1, 1, 1, 1, 1,
-1.597755, -0.6661604, -1.204693, 1, 1, 1, 1, 1,
-1.590074, 1.117348, -1.382881, 0, 0, 1, 1, 1,
-1.589235, -0.6117114, -2.537272, 1, 0, 0, 1, 1,
-1.588992, -0.7866831, -1.556447, 1, 0, 0, 1, 1,
-1.588075, -1.276327, -3.189881, 1, 0, 0, 1, 1,
-1.585002, 0.2440241, -1.034733, 1, 0, 0, 1, 1,
-1.549736, -0.5409318, -2.704076, 1, 0, 0, 1, 1,
-1.547552, 0.8968006, -1.921527, 0, 0, 0, 1, 1,
-1.540763, -1.563823, -1.490229, 0, 0, 0, 1, 1,
-1.539863, 1.45013, -0.7228275, 0, 0, 0, 1, 1,
-1.539329, 1.351459, 0.3419, 0, 0, 0, 1, 1,
-1.538595, 1.090542, -0.2042975, 0, 0, 0, 1, 1,
-1.529545, 1.322154, -0.3190283, 0, 0, 0, 1, 1,
-1.516634, -2.097907, -4.278744, 0, 0, 0, 1, 1,
-1.503211, 0.4687482, -0.8389598, 1, 1, 1, 1, 1,
-1.472201, -0.3656135, -1.34817, 1, 1, 1, 1, 1,
-1.466644, -0.0108703, -1.598252, 1, 1, 1, 1, 1,
-1.457655, -1.634019, -1.635356, 1, 1, 1, 1, 1,
-1.453203, 1.886666, -1.44902, 1, 1, 1, 1, 1,
-1.450309, -1.077348, -3.814826, 1, 1, 1, 1, 1,
-1.445154, 0.4975115, -2.181543, 1, 1, 1, 1, 1,
-1.436798, 0.5161499, -0.0213142, 1, 1, 1, 1, 1,
-1.435381, -0.870409, -2.712079, 1, 1, 1, 1, 1,
-1.422825, 0.7972502, -0.7310411, 1, 1, 1, 1, 1,
-1.42144, -0.2147001, -1.312998, 1, 1, 1, 1, 1,
-1.421437, -3.072332, -4.641475, 1, 1, 1, 1, 1,
-1.420104, -0.1968399, -3.1481, 1, 1, 1, 1, 1,
-1.398983, -0.1010034, -0.516713, 1, 1, 1, 1, 1,
-1.393343, 0.1202661, -1.838861, 1, 1, 1, 1, 1,
-1.381244, 1.029218, -0.6113832, 0, 0, 1, 1, 1,
-1.353122, -0.4896163, -1.008591, 1, 0, 0, 1, 1,
-1.35213, 1.074475, -0.3841549, 1, 0, 0, 1, 1,
-1.350245, 0.7752458, -1.999345, 1, 0, 0, 1, 1,
-1.349459, -1.415788, -3.621301, 1, 0, 0, 1, 1,
-1.347499, 0.7236153, -1.914868, 1, 0, 0, 1, 1,
-1.346474, -0.9431094, -2.740027, 0, 0, 0, 1, 1,
-1.336953, -0.1178397, 0.6355764, 0, 0, 0, 1, 1,
-1.33145, 0.3107378, -2.203264, 0, 0, 0, 1, 1,
-1.329322, -0.4666998, -0.7978861, 0, 0, 0, 1, 1,
-1.321276, 1.549291, -0.1544043, 0, 0, 0, 1, 1,
-1.320221, 0.4108329, -1.29646, 0, 0, 0, 1, 1,
-1.313308, -0.450723, -0.6197729, 0, 0, 0, 1, 1,
-1.307691, 1.824167, -1.397939, 1, 1, 1, 1, 1,
-1.299304, -0.7250233, -2.381003, 1, 1, 1, 1, 1,
-1.295968, 0.1392866, -0.5293629, 1, 1, 1, 1, 1,
-1.284353, -0.2480769, -1.752098, 1, 1, 1, 1, 1,
-1.280632, -0.5276364, -1.427655, 1, 1, 1, 1, 1,
-1.28037, -0.1185478, -0.5695079, 1, 1, 1, 1, 1,
-1.272956, 0.5764102, -0.7712303, 1, 1, 1, 1, 1,
-1.261602, -1.401598, -3.091297, 1, 1, 1, 1, 1,
-1.244283, 0.6000111, -1.587563, 1, 1, 1, 1, 1,
-1.241119, 1.602323, -1.831295, 1, 1, 1, 1, 1,
-1.239993, 0.8549708, -0.328537, 1, 1, 1, 1, 1,
-1.238308, 1.912868, -1.25807, 1, 1, 1, 1, 1,
-1.233494, 0.06836978, -1.590059, 1, 1, 1, 1, 1,
-1.225851, -0.2067378, -2.020517, 1, 1, 1, 1, 1,
-1.212014, -3.555633, -1.012592, 1, 1, 1, 1, 1,
-1.204322, 0.2619709, 0.6471767, 0, 0, 1, 1, 1,
-1.204028, 0.09899966, -2.292418, 1, 0, 0, 1, 1,
-1.201195, -1.810345, -0.2436225, 1, 0, 0, 1, 1,
-1.198712, 2.252644, -0.2673514, 1, 0, 0, 1, 1,
-1.190835, -1.299603, -1.941078, 1, 0, 0, 1, 1,
-1.177419, -0.1755123, 0.6729639, 1, 0, 0, 1, 1,
-1.159909, -2.049637, -2.107127, 0, 0, 0, 1, 1,
-1.150554, -0.2230357, -2.20271, 0, 0, 0, 1, 1,
-1.147375, 1.004431, -0.8303557, 0, 0, 0, 1, 1,
-1.146552, -0.4809876, -4.57216, 0, 0, 0, 1, 1,
-1.141854, -0.3768592, -1.795264, 0, 0, 0, 1, 1,
-1.141702, 0.5242558, -0.9377704, 0, 0, 0, 1, 1,
-1.141337, 1.640377, 0.3351882, 0, 0, 0, 1, 1,
-1.140936, -0.2390779, -1.6433, 1, 1, 1, 1, 1,
-1.138953, 0.8469626, -1.222418, 1, 1, 1, 1, 1,
-1.129158, -0.5872812, -1.308952, 1, 1, 1, 1, 1,
-1.129064, 1.128879, -1.959395, 1, 1, 1, 1, 1,
-1.128285, 2.350712, 1.903654, 1, 1, 1, 1, 1,
-1.126376, -0.2519635, -1.799029, 1, 1, 1, 1, 1,
-1.124684, -1.923125, -1.645927, 1, 1, 1, 1, 1,
-1.121023, -0.5883136, -2.356301, 1, 1, 1, 1, 1,
-1.119219, -0.3988576, -1.551346, 1, 1, 1, 1, 1,
-1.115343, 2.082162, 1.720165, 1, 1, 1, 1, 1,
-1.109469, -0.2591011, -2.910489, 1, 1, 1, 1, 1,
-1.106766, 0.5677158, -3.467426, 1, 1, 1, 1, 1,
-1.106156, 0.5345886, -1.081874, 1, 1, 1, 1, 1,
-1.105468, 0.538266, 1.183826, 1, 1, 1, 1, 1,
-1.103053, -0.1080179, -0.6384879, 1, 1, 1, 1, 1,
-1.099269, 0.8827306, -1.884544, 0, 0, 1, 1, 1,
-1.092199, 1.819946, 0.3095138, 1, 0, 0, 1, 1,
-1.091212, 0.2957239, -1.586203, 1, 0, 0, 1, 1,
-1.084536, 0.350837, -1.432123, 1, 0, 0, 1, 1,
-1.080032, -0.5251176, -2.317402, 1, 0, 0, 1, 1,
-1.079953, 0.7372911, -0.3943771, 1, 0, 0, 1, 1,
-1.073877, -0.1229961, -2.578425, 0, 0, 0, 1, 1,
-1.072531, -0.2230301, -1.862537, 0, 0, 0, 1, 1,
-1.065202, -0.2992671, -2.981872, 0, 0, 0, 1, 1,
-1.062007, 0.1183247, -2.007997, 0, 0, 0, 1, 1,
-1.060108, 0.3773414, -0.04848994, 0, 0, 0, 1, 1,
-1.057991, 0.3897977, -0.5925272, 0, 0, 0, 1, 1,
-1.049003, -0.4158154, -3.836606, 0, 0, 0, 1, 1,
-1.047972, 0.1077962, -1.279529, 1, 1, 1, 1, 1,
-1.047803, -1.812017, -3.312792, 1, 1, 1, 1, 1,
-1.044883, 1.060992, -0.7778805, 1, 1, 1, 1, 1,
-1.043443, -0.976081, -2.27922, 1, 1, 1, 1, 1,
-1.035065, -0.9269698, -1.294842, 1, 1, 1, 1, 1,
-1.033856, -0.4312873, -2.043335, 1, 1, 1, 1, 1,
-1.029541, 0.3621891, -0.322936, 1, 1, 1, 1, 1,
-1.024165, -1.097711, -2.182022, 1, 1, 1, 1, 1,
-1.017987, -1.207614, -1.186535, 1, 1, 1, 1, 1,
-1.017674, 0.8542253, -1.16103, 1, 1, 1, 1, 1,
-1.013652, 0.1044186, -1.479791, 1, 1, 1, 1, 1,
-1.010851, -0.3649751, -2.281854, 1, 1, 1, 1, 1,
-1.009466, 0.1795998, -0.121476, 1, 1, 1, 1, 1,
-1.004928, 0.4360249, -1.714567, 1, 1, 1, 1, 1,
-0.9968604, 0.6142243, -1.889661, 1, 1, 1, 1, 1,
-0.9964675, 0.9707236, -0.6748302, 0, 0, 1, 1, 1,
-0.9921012, 0.676267, -1.492322, 1, 0, 0, 1, 1,
-0.9900001, 1.106771, -1.421998, 1, 0, 0, 1, 1,
-0.989947, 0.03722696, -1.651697, 1, 0, 0, 1, 1,
-0.9749007, -1.271587, -2.618287, 1, 0, 0, 1, 1,
-0.9735472, -0.5588557, -0.9630584, 1, 0, 0, 1, 1,
-0.9710391, 1.070965, -0.5107414, 0, 0, 0, 1, 1,
-0.9659302, 0.4622014, -1.697374, 0, 0, 0, 1, 1,
-0.9437187, 1.201888, -1.233261, 0, 0, 0, 1, 1,
-0.9340504, 1.207867, 0.366152, 0, 0, 0, 1, 1,
-0.9326363, 1.087257, -1.563596, 0, 0, 0, 1, 1,
-0.9193406, 0.1537429, -1.003176, 0, 0, 0, 1, 1,
-0.9058986, -2.345129, -4.475204, 0, 0, 0, 1, 1,
-0.9054772, -0.5041221, 0.2333818, 1, 1, 1, 1, 1,
-0.8994692, 0.5975528, -0.1008505, 1, 1, 1, 1, 1,
-0.8993978, 0.8922695, -1.041404, 1, 1, 1, 1, 1,
-0.8936179, 0.00852995, -2.237303, 1, 1, 1, 1, 1,
-0.8885761, 0.1818472, -1.821252, 1, 1, 1, 1, 1,
-0.8876656, -2.181147, -2.401847, 1, 1, 1, 1, 1,
-0.8871499, -2.012199, -3.999839, 1, 1, 1, 1, 1,
-0.8860716, 0.4802112, -0.4122082, 1, 1, 1, 1, 1,
-0.8828813, -1.304486, 0.007786933, 1, 1, 1, 1, 1,
-0.8802767, 0.9565347, -0.9374488, 1, 1, 1, 1, 1,
-0.877669, 1.198195, -2.275092, 1, 1, 1, 1, 1,
-0.8623006, -1.200815, -3.045073, 1, 1, 1, 1, 1,
-0.8615781, -0.8149534, -2.704422, 1, 1, 1, 1, 1,
-0.849273, 0.00776662, -1.945365, 1, 1, 1, 1, 1,
-0.8464142, 0.8486838, -1.951224, 1, 1, 1, 1, 1,
-0.8427576, -0.6267729, -0.1448545, 0, 0, 1, 1, 1,
-0.8368705, 1.73615, -0.9976506, 1, 0, 0, 1, 1,
-0.8278887, -1.052701, -1.853828, 1, 0, 0, 1, 1,
-0.8201791, -0.9523768, -1.963216, 1, 0, 0, 1, 1,
-0.8144823, -0.5754582, -2.88422, 1, 0, 0, 1, 1,
-0.8134418, 0.4500625, -1.354463, 1, 0, 0, 1, 1,
-0.8041878, -0.7631535, -0.854787, 0, 0, 0, 1, 1,
-0.8029515, -0.0602507, -0.005641578, 0, 0, 0, 1, 1,
-0.8019844, 0.9526135, -0.2986647, 0, 0, 0, 1, 1,
-0.799987, -1.029818, -3.498675, 0, 0, 0, 1, 1,
-0.793736, 0.7853797, -1.708433, 0, 0, 0, 1, 1,
-0.7906501, -1.537488, -2.205115, 0, 0, 0, 1, 1,
-0.7874665, -0.4527307, -3.527401, 0, 0, 0, 1, 1,
-0.7874587, 0.1200282, -1.737046, 1, 1, 1, 1, 1,
-0.7868145, -0.6950366, -1.294549, 1, 1, 1, 1, 1,
-0.7800031, 0.6344578, -0.9574485, 1, 1, 1, 1, 1,
-0.7774897, 1.159076, -2.37115, 1, 1, 1, 1, 1,
-0.7749044, 0.494966, -0.6485494, 1, 1, 1, 1, 1,
-0.7724548, 1.339113, -1.609653, 1, 1, 1, 1, 1,
-0.7684221, 0.7212854, 1.217472, 1, 1, 1, 1, 1,
-0.7662271, 0.2346014, -0.8527759, 1, 1, 1, 1, 1,
-0.762664, 0.8223732, 0.1903257, 1, 1, 1, 1, 1,
-0.7616125, 0.1663515, -1.044228, 1, 1, 1, 1, 1,
-0.7587699, -0.8709801, -2.161773, 1, 1, 1, 1, 1,
-0.7394564, -0.4268046, -2.083488, 1, 1, 1, 1, 1,
-0.7383605, 0.3536013, -0.9967849, 1, 1, 1, 1, 1,
-0.7381551, 0.03909089, -0.9056252, 1, 1, 1, 1, 1,
-0.7347744, -1.441592, -1.209436, 1, 1, 1, 1, 1,
-0.727297, -0.4616283, -3.008427, 0, 0, 1, 1, 1,
-0.7269548, -0.8441563, -1.509179, 1, 0, 0, 1, 1,
-0.724848, -0.5994607, -3.30584, 1, 0, 0, 1, 1,
-0.7198761, -0.9491253, -3.050031, 1, 0, 0, 1, 1,
-0.7178681, -0.8228061, -2.549967, 1, 0, 0, 1, 1,
-0.7139586, -1.682177, -2.25263, 1, 0, 0, 1, 1,
-0.7108037, 0.3483506, -1.093412, 0, 0, 0, 1, 1,
-0.710501, 1.008841, -1.776483, 0, 0, 0, 1, 1,
-0.7097995, 2.909855, 1.19371, 0, 0, 0, 1, 1,
-0.7083642, 0.5226357, -0.1861049, 0, 0, 0, 1, 1,
-0.7078151, 1.058054, 0.3735228, 0, 0, 0, 1, 1,
-0.7068112, -0.5547448, -1.898535, 0, 0, 0, 1, 1,
-0.7067953, -2.086262, -3.325493, 0, 0, 0, 1, 1,
-0.7017175, -0.04389055, -1.023851, 1, 1, 1, 1, 1,
-0.7010047, 0.986661, -0.02439765, 1, 1, 1, 1, 1,
-0.6985403, 1.84171, 1.420831, 1, 1, 1, 1, 1,
-0.692413, -1.71738, -2.014688, 1, 1, 1, 1, 1,
-0.6790347, 0.01056478, -0.9858944, 1, 1, 1, 1, 1,
-0.6778117, 0.3885238, -1.500272, 1, 1, 1, 1, 1,
-0.6754159, -0.07948493, -1.458874, 1, 1, 1, 1, 1,
-0.6752438, 0.3757734, -1.392096, 1, 1, 1, 1, 1,
-0.6731643, 1.510376, 0.006596533, 1, 1, 1, 1, 1,
-0.6709501, 0.4185006, -2.417717, 1, 1, 1, 1, 1,
-0.6679295, 0.05663702, -1.307042, 1, 1, 1, 1, 1,
-0.6656139, -1.28663, -1.557174, 1, 1, 1, 1, 1,
-0.663483, 1.013996, -1.333403, 1, 1, 1, 1, 1,
-0.6582131, -1.557572, -2.302166, 1, 1, 1, 1, 1,
-0.6507732, -0.03619881, -1.271205, 1, 1, 1, 1, 1,
-0.6487237, -0.006545336, 0.06580353, 0, 0, 1, 1, 1,
-0.6481329, -0.08865926, -2.346562, 1, 0, 0, 1, 1,
-0.6472501, -0.04105077, -1.420438, 1, 0, 0, 1, 1,
-0.6437231, -0.821845, -3.430213, 1, 0, 0, 1, 1,
-0.6409045, -0.3875873, -2.529703, 1, 0, 0, 1, 1,
-0.6399096, -2.07132, -4.252993, 1, 0, 0, 1, 1,
-0.6396393, -0.242239, -2.05119, 0, 0, 0, 1, 1,
-0.6359938, -1.65051, -1.591159, 0, 0, 0, 1, 1,
-0.6328538, 1.273591, -0.7920798, 0, 0, 0, 1, 1,
-0.6323339, -1.803918, -3.808572, 0, 0, 0, 1, 1,
-0.6285052, 0.1526642, -0.3993477, 0, 0, 0, 1, 1,
-0.6264544, 0.7906039, 0.5699067, 0, 0, 0, 1, 1,
-0.6217114, -0.7576028, -1.941527, 0, 0, 0, 1, 1,
-0.6186759, 0.365316, -2.11534, 1, 1, 1, 1, 1,
-0.6176717, 0.9309195, -0.6261979, 1, 1, 1, 1, 1,
-0.6161, -0.04453809, 0.01750642, 1, 1, 1, 1, 1,
-0.6005862, 0.5384884, -1.251309, 1, 1, 1, 1, 1,
-0.6002996, -0.05060647, -2.187754, 1, 1, 1, 1, 1,
-0.5999855, 0.3400644, -1.098041, 1, 1, 1, 1, 1,
-0.5992683, 0.5183695, -2.633368, 1, 1, 1, 1, 1,
-0.5962783, -1.000329, -3.49974, 1, 1, 1, 1, 1,
-0.5931089, 1.272646, -1.686701, 1, 1, 1, 1, 1,
-0.5904802, -0.5677865, -2.740741, 1, 1, 1, 1, 1,
-0.587593, 0.7583608, -1.085457, 1, 1, 1, 1, 1,
-0.5869536, -0.4920464, -3.387656, 1, 1, 1, 1, 1,
-0.5816529, -1.458306, -2.860334, 1, 1, 1, 1, 1,
-0.5790879, 0.2548919, -2.403665, 1, 1, 1, 1, 1,
-0.5725849, 0.1988868, -1.060292, 1, 1, 1, 1, 1,
-0.5708905, -1.69325, -4.046706, 0, 0, 1, 1, 1,
-0.5690479, -0.05166917, -2.281555, 1, 0, 0, 1, 1,
-0.5635085, 1.214826, 0.8941967, 1, 0, 0, 1, 1,
-0.559969, 1.38837, 1.089898, 1, 0, 0, 1, 1,
-0.54784, 0.1786492, -2.07311, 1, 0, 0, 1, 1,
-0.5460322, -1.227757, -2.167662, 1, 0, 0, 1, 1,
-0.5368675, 0.6636653, -0.9644411, 0, 0, 0, 1, 1,
-0.5368132, -0.2452447, -1.144451, 0, 0, 0, 1, 1,
-0.5306529, 0.6749701, 0.3211671, 0, 0, 0, 1, 1,
-0.5281811, -0.7941025, -1.278106, 0, 0, 0, 1, 1,
-0.5168155, 0.9759423, 0.1745201, 0, 0, 0, 1, 1,
-0.5153027, 1.480039, 0.2218932, 0, 0, 0, 1, 1,
-0.5109703, -1.946412, -2.790439, 0, 0, 0, 1, 1,
-0.5107563, -1.312772, -2.685828, 1, 1, 1, 1, 1,
-0.5055942, 0.6889536, 1.849616, 1, 1, 1, 1, 1,
-0.5037836, 0.5446597, -1.394691, 1, 1, 1, 1, 1,
-0.5028648, 0.4780113, -0.659731, 1, 1, 1, 1, 1,
-0.5005066, 0.4507627, -2.347961, 1, 1, 1, 1, 1,
-0.499202, -0.03935371, -2.358074, 1, 1, 1, 1, 1,
-0.4961824, -1.377902, -3.756742, 1, 1, 1, 1, 1,
-0.495424, -0.1433482, -1.334894, 1, 1, 1, 1, 1,
-0.494791, 0.1547231, -3.914271, 1, 1, 1, 1, 1,
-0.4941569, -0.8791763, -3.311654, 1, 1, 1, 1, 1,
-0.4931726, -0.4542042, -4.348393, 1, 1, 1, 1, 1,
-0.4908459, -0.4990948, -2.145444, 1, 1, 1, 1, 1,
-0.4876041, -0.6285102, -1.051355, 1, 1, 1, 1, 1,
-0.4843615, -0.07427276, -0.8748984, 1, 1, 1, 1, 1,
-0.4833798, -0.04642893, -1.659007, 1, 1, 1, 1, 1,
-0.4792421, 1.426284, 1.056001, 0, 0, 1, 1, 1,
-0.4769378, 1.492938, -0.8285313, 1, 0, 0, 1, 1,
-0.474933, 0.2619164, -0.8893041, 1, 0, 0, 1, 1,
-0.4662168, 2.056959, -1.228083, 1, 0, 0, 1, 1,
-0.4661418, 1.248591, -0.03872706, 1, 0, 0, 1, 1,
-0.4629417, -0.2657126, -3.453401, 1, 0, 0, 1, 1,
-0.4613446, 2.307431, 1.289495, 0, 0, 0, 1, 1,
-0.4521041, 1.430308, 0.5601701, 0, 0, 0, 1, 1,
-0.4518203, 0.6560766, 0.6162472, 0, 0, 0, 1, 1,
-0.4476859, -0.08659996, -1.259462, 0, 0, 0, 1, 1,
-0.4475036, 0.1815457, -1.49303, 0, 0, 0, 1, 1,
-0.4460532, 0.00477958, -4.195818, 0, 0, 0, 1, 1,
-0.4457995, 0.6312463, -1.965427, 0, 0, 0, 1, 1,
-0.445544, 0.4317088, -2.078173, 1, 1, 1, 1, 1,
-0.4384753, -0.9955456, -2.694398, 1, 1, 1, 1, 1,
-0.4381053, -1.51605, -4.166635, 1, 1, 1, 1, 1,
-0.4355843, 1.908621, 0.851949, 1, 1, 1, 1, 1,
-0.4336115, -0.3801129, -1.056927, 1, 1, 1, 1, 1,
-0.4329976, -0.8690041, -1.531178, 1, 1, 1, 1, 1,
-0.4288536, -0.4396075, -2.654645, 1, 1, 1, 1, 1,
-0.4263011, 0.1462661, -0.6887169, 1, 1, 1, 1, 1,
-0.4182065, -0.3898708, -1.735211, 1, 1, 1, 1, 1,
-0.4116248, -1.77037, -2.234182, 1, 1, 1, 1, 1,
-0.410373, -0.566546, -2.443288, 1, 1, 1, 1, 1,
-0.4087861, 1.433523, 1.092666, 1, 1, 1, 1, 1,
-0.4037815, 0.376305, 0.62335, 1, 1, 1, 1, 1,
-0.4021163, 2.332818, 0.1019565, 1, 1, 1, 1, 1,
-0.3989721, 0.4725802, -1.554929, 1, 1, 1, 1, 1,
-0.3974352, -0.5493985, -3.487916, 0, 0, 1, 1, 1,
-0.3934505, 0.6408529, 0.02174681, 1, 0, 0, 1, 1,
-0.3925575, 1.298684, -0.007395243, 1, 0, 0, 1, 1,
-0.3924271, 1.268069, -2.132715, 1, 0, 0, 1, 1,
-0.3922177, -1.463176, -2.957289, 1, 0, 0, 1, 1,
-0.390585, -1.052262, -1.471318, 1, 0, 0, 1, 1,
-0.3825766, -0.9313232, -3.363075, 0, 0, 0, 1, 1,
-0.3714251, 0.1308142, -1.209932, 0, 0, 0, 1, 1,
-0.3611099, 0.7239677, -1.112878, 0, 0, 0, 1, 1,
-0.3609476, -0.943193, -3.286748, 0, 0, 0, 1, 1,
-0.3589273, -0.2239037, -2.229482, 0, 0, 0, 1, 1,
-0.357483, -0.3873294, -2.737763, 0, 0, 0, 1, 1,
-0.3536687, 0.8758569, -0.8939886, 0, 0, 0, 1, 1,
-0.3531388, 0.9663068, -0.2285278, 1, 1, 1, 1, 1,
-0.3511121, 0.9514471, 0.1638952, 1, 1, 1, 1, 1,
-0.3456541, 1.024682, 0.1361399, 1, 1, 1, 1, 1,
-0.3400038, -0.1144232, -0.9837285, 1, 1, 1, 1, 1,
-0.3389675, -1.049249, -2.261209, 1, 1, 1, 1, 1,
-0.3388963, -0.1763583, -0.9936138, 1, 1, 1, 1, 1,
-0.3378507, 1.436039, -0.6483032, 1, 1, 1, 1, 1,
-0.3369788, -1.016991, -0.7910796, 1, 1, 1, 1, 1,
-0.3325723, -0.4067001, -4.050603, 1, 1, 1, 1, 1,
-0.3296133, 0.542635, -1.272948, 1, 1, 1, 1, 1,
-0.3216938, 1.067778, 0.9780864, 1, 1, 1, 1, 1,
-0.3196652, -0.5198087, -3.647409, 1, 1, 1, 1, 1,
-0.3186683, -0.1608534, -1.055283, 1, 1, 1, 1, 1,
-0.3171754, -1.29274, -3.392473, 1, 1, 1, 1, 1,
-0.3165531, 0.3779693, -2.333853, 1, 1, 1, 1, 1,
-0.3158325, 0.5112072, -0.1548425, 0, 0, 1, 1, 1,
-0.3149464, -0.41659, -3.529525, 1, 0, 0, 1, 1,
-0.3140595, 0.8589086, -1.649781, 1, 0, 0, 1, 1,
-0.3046619, -0.2010244, -2.025377, 1, 0, 0, 1, 1,
-0.2997181, 0.01778023, 0.1181751, 1, 0, 0, 1, 1,
-0.2988592, -0.2370598, -2.311095, 1, 0, 0, 1, 1,
-0.2988397, -0.9503401, -1.450413, 0, 0, 0, 1, 1,
-0.2951959, -0.7804562, -0.5099137, 0, 0, 0, 1, 1,
-0.2916303, -0.8219021, -3.334506, 0, 0, 0, 1, 1,
-0.2903817, -0.5876735, -2.178565, 0, 0, 0, 1, 1,
-0.2875733, -2.994859, -2.893521, 0, 0, 0, 1, 1,
-0.2863222, -0.6199911, -1.565942, 0, 0, 0, 1, 1,
-0.2815611, 1.436569, 0.1604032, 0, 0, 0, 1, 1,
-0.2755291, -0.7508675, -2.293317, 1, 1, 1, 1, 1,
-0.2749416, -0.9073598, -1.854211, 1, 1, 1, 1, 1,
-0.2742911, 0.3359219, -0.2580132, 1, 1, 1, 1, 1,
-0.2731226, -0.7883402, -2.127407, 1, 1, 1, 1, 1,
-0.27112, -0.6856139, -3.157931, 1, 1, 1, 1, 1,
-0.270822, 1.526546, -2.596922, 1, 1, 1, 1, 1,
-0.2682574, 0.4883887, -1.359749, 1, 1, 1, 1, 1,
-0.2641183, -1.12463, -0.9884132, 1, 1, 1, 1, 1,
-0.2639509, 0.910975, -1.270335, 1, 1, 1, 1, 1,
-0.2638235, -1.334787, -3.178406, 1, 1, 1, 1, 1,
-0.2631973, -1.04261, -1.687875, 1, 1, 1, 1, 1,
-0.2617478, 0.5162467, -3.084304, 1, 1, 1, 1, 1,
-0.2598684, 0.1548797, -1.991986, 1, 1, 1, 1, 1,
-0.256613, 1.874432, 0.07332601, 1, 1, 1, 1, 1,
-0.2533001, -0.3096056, -1.359853, 1, 1, 1, 1, 1,
-0.2507751, 1.347337, -1.209973, 0, 0, 1, 1, 1,
-0.2449776, 1.126594, 0.2650757, 1, 0, 0, 1, 1,
-0.2444893, -0.8443407, -3.055322, 1, 0, 0, 1, 1,
-0.2427935, -0.7068048, -2.943952, 1, 0, 0, 1, 1,
-0.2389633, -0.4877338, -2.452597, 1, 0, 0, 1, 1,
-0.2372785, -2.101858, -2.222857, 1, 0, 0, 1, 1,
-0.233677, -1.067516, -2.944882, 0, 0, 0, 1, 1,
-0.2309058, 0.6582031, 0.06386475, 0, 0, 0, 1, 1,
-0.230558, -0.5394528, -1.890401, 0, 0, 0, 1, 1,
-0.2268026, -0.4885846, -2.241758, 0, 0, 0, 1, 1,
-0.2253228, 0.2712654, -0.1670128, 0, 0, 0, 1, 1,
-0.2231062, 1.123803, 0.5528558, 0, 0, 0, 1, 1,
-0.2174822, 0.5888774, -0.3773868, 0, 0, 0, 1, 1,
-0.2166997, -1.088961, -1.304388, 1, 1, 1, 1, 1,
-0.2164017, -1.705051, -2.886907, 1, 1, 1, 1, 1,
-0.2153703, 2.195957, -0.1907818, 1, 1, 1, 1, 1,
-0.2119738, -0.1853331, -1.90803, 1, 1, 1, 1, 1,
-0.2089271, -1.505938, -2.600612, 1, 1, 1, 1, 1,
-0.2059358, 1.336458, -0.3676775, 1, 1, 1, 1, 1,
-0.2057278, -0.8608302, -2.735501, 1, 1, 1, 1, 1,
-0.2049638, 0.8284792, 0.4515965, 1, 1, 1, 1, 1,
-0.2046411, -0.1736614, -2.959219, 1, 1, 1, 1, 1,
-0.2028809, 0.08790131, -1.717107, 1, 1, 1, 1, 1,
-0.2011723, -0.4513907, -1.1204, 1, 1, 1, 1, 1,
-0.198517, 0.3074332, 0.2306699, 1, 1, 1, 1, 1,
-0.1962056, 0.9881605, -0.4860755, 1, 1, 1, 1, 1,
-0.1949024, -0.8735768, -3.160823, 1, 1, 1, 1, 1,
-0.1948017, 0.8781394, -2.408522, 1, 1, 1, 1, 1,
-0.1917479, -1.340055, -2.826694, 0, 0, 1, 1, 1,
-0.1888396, -0.2978534, -1.390345, 1, 0, 0, 1, 1,
-0.1882589, -1.045135, -2.375978, 1, 0, 0, 1, 1,
-0.1867611, 1.009479, -0.3868167, 1, 0, 0, 1, 1,
-0.1833859, 0.5215173, 1.098637, 1, 0, 0, 1, 1,
-0.1753822, 1.036318, 1.169472, 1, 0, 0, 1, 1,
-0.1740226, 1.321924, -0.5697379, 0, 0, 0, 1, 1,
-0.172668, 1.342448, 0.4568242, 0, 0, 0, 1, 1,
-0.1715892, -0.6460192, -3.093254, 0, 0, 0, 1, 1,
-0.1659972, 1.466082, -0.8463169, 0, 0, 0, 1, 1,
-0.1639869, -0.5934856, -3.97904, 0, 0, 0, 1, 1,
-0.1639257, 0.925127, 0.7569524, 0, 0, 0, 1, 1,
-0.1535913, 1.601806, -0.3364795, 0, 0, 0, 1, 1,
-0.151121, 0.2195536, 0.7702854, 1, 1, 1, 1, 1,
-0.1491499, -1.801709, -2.413584, 1, 1, 1, 1, 1,
-0.1484151, 1.150498, 0.6996176, 1, 1, 1, 1, 1,
-0.142528, -1.017605, -2.228318, 1, 1, 1, 1, 1,
-0.139217, -1.788719, -3.86841, 1, 1, 1, 1, 1,
-0.1350527, -0.3046909, -4.208338, 1, 1, 1, 1, 1,
-0.1288716, 0.9465675, -0.9364925, 1, 1, 1, 1, 1,
-0.1287653, -0.03587253, -0.6470259, 1, 1, 1, 1, 1,
-0.1267691, 0.886526, 0.01743347, 1, 1, 1, 1, 1,
-0.1190654, 0.5364538, -0.2700804, 1, 1, 1, 1, 1,
-0.1098269, 0.4154868, -0.2927477, 1, 1, 1, 1, 1,
-0.1090947, 1.08438, 0.8386855, 1, 1, 1, 1, 1,
-0.1081773, -2.051513, -2.811238, 1, 1, 1, 1, 1,
-0.1073299, 0.814527, 0.3277818, 1, 1, 1, 1, 1,
-0.1041676, -0.129006, -1.765577, 1, 1, 1, 1, 1,
-0.102011, -1.649935, -3.264453, 0, 0, 1, 1, 1,
-0.09932475, 0.1885472, -1.678417, 1, 0, 0, 1, 1,
-0.09807324, -1.421456, -2.211347, 1, 0, 0, 1, 1,
-0.09534529, -1.172956, -2.736326, 1, 0, 0, 1, 1,
-0.09407714, 0.2226214, -1.714344, 1, 0, 0, 1, 1,
-0.09112553, -0.4674914, -3.289181, 1, 0, 0, 1, 1,
-0.09042063, -2.421776, -2.875393, 0, 0, 0, 1, 1,
-0.08961826, -0.8767318, -2.834534, 0, 0, 0, 1, 1,
-0.08777523, 1.147857, 0.7180682, 0, 0, 0, 1, 1,
-0.08648351, -1.3552, -2.112765, 0, 0, 0, 1, 1,
-0.08448187, -1.508443, -3.695896, 0, 0, 0, 1, 1,
-0.0837383, 1.085517, -1.495633, 0, 0, 0, 1, 1,
-0.08024348, 0.3309369, -0.06103051, 0, 0, 0, 1, 1,
-0.07908297, -0.8643029, -2.309255, 1, 1, 1, 1, 1,
-0.07602891, 1.147776, -1.840466, 1, 1, 1, 1, 1,
-0.0754388, -0.02337054, -2.470378, 1, 1, 1, 1, 1,
-0.07454981, -1.415388, -3.341017, 1, 1, 1, 1, 1,
-0.06688929, 0.8415771, 0.9216579, 1, 1, 1, 1, 1,
-0.06448485, 1.472172, -0.1264507, 1, 1, 1, 1, 1,
-0.06322207, 0.5492638, 0.4098756, 1, 1, 1, 1, 1,
-0.06318784, -0.8233179, -2.279453, 1, 1, 1, 1, 1,
-0.06064159, -0.01361859, -1.266274, 1, 1, 1, 1, 1,
-0.05871739, -1.928079, -3.312402, 1, 1, 1, 1, 1,
-0.05237008, -0.3241221, -3.543801, 1, 1, 1, 1, 1,
-0.05215378, -1.053995, -2.537526, 1, 1, 1, 1, 1,
-0.05116072, -1.226552, -1.334909, 1, 1, 1, 1, 1,
-0.05099742, -0.5228608, -1.761035, 1, 1, 1, 1, 1,
-0.05023487, 1.195581, -1.078043, 1, 1, 1, 1, 1,
-0.0496334, 0.7744012, 0.3851142, 0, 0, 1, 1, 1,
-0.04686401, -0.9616589, -2.296837, 1, 0, 0, 1, 1,
-0.04678982, -1.054296, -3.743632, 1, 0, 0, 1, 1,
-0.0467279, 0.6184496, 0.1251712, 1, 0, 0, 1, 1,
-0.04663999, 0.523859, -1.701642, 1, 0, 0, 1, 1,
-0.0464448, -0.1126074, -3.386422, 1, 0, 0, 1, 1,
-0.04532364, -0.2558927, -3.769312, 0, 0, 0, 1, 1,
-0.04455768, -1.72837, -3.475166, 0, 0, 0, 1, 1,
-0.04152846, -0.08042165, -4.329049, 0, 0, 0, 1, 1,
-0.03815468, -1.744671, -3.45858, 0, 0, 0, 1, 1,
-0.03708888, 0.07663558, -1.374879, 0, 0, 0, 1, 1,
-0.03435576, 0.5606846, 1.00035, 0, 0, 0, 1, 1,
-0.02762889, -1.078094, -5.005862, 0, 0, 0, 1, 1,
-0.02640637, -0.5071374, -3.346553, 1, 1, 1, 1, 1,
-0.02370482, 1.323124, -0.4769008, 1, 1, 1, 1, 1,
-0.02210293, -0.05916949, -3.154616, 1, 1, 1, 1, 1,
-0.02100949, 0.9422861, -0.1586555, 1, 1, 1, 1, 1,
-0.005554516, 2.956107, -3.001905, 1, 1, 1, 1, 1,
-0.004928567, -0.574667, -2.32999, 1, 1, 1, 1, 1,
-0.003656229, 1.809823, -1.303135, 1, 1, 1, 1, 1,
-0.001416648, 0.8861671, 0.3903426, 1, 1, 1, 1, 1,
-0.0009211266, -0.1108623, -3.541701, 1, 1, 1, 1, 1,
-0.0006772523, 1.201524, -0.71883, 1, 1, 1, 1, 1,
0.007852052, -1.392044, 3.601531, 1, 1, 1, 1, 1,
0.009732273, 0.3498957, 0.3635736, 1, 1, 1, 1, 1,
0.01199317, 0.9818235, -0.5332615, 1, 1, 1, 1, 1,
0.01277706, -0.6616225, 3.922073, 1, 1, 1, 1, 1,
0.01342178, -0.02920532, 1.6312, 1, 1, 1, 1, 1,
0.01592855, -1.435529, 3.076957, 0, 0, 1, 1, 1,
0.01698885, 0.6470793, 0.5878239, 1, 0, 0, 1, 1,
0.01736001, 0.7851141, 0.8845912, 1, 0, 0, 1, 1,
0.01816598, -0.2621195, 4.776123, 1, 0, 0, 1, 1,
0.02067407, -0.794568, 4.083272, 1, 0, 0, 1, 1,
0.02101369, 0.8873463, 0.4804153, 1, 0, 0, 1, 1,
0.02325014, -0.2410027, 3.979121, 0, 0, 0, 1, 1,
0.02707295, -0.6476859, 3.199039, 0, 0, 0, 1, 1,
0.02918183, -0.4900488, 2.262491, 0, 0, 0, 1, 1,
0.03470615, -0.4784747, 3.936301, 0, 0, 0, 1, 1,
0.03603706, -0.6508316, 2.754595, 0, 0, 0, 1, 1,
0.03842738, 1.021403, 0.05494408, 0, 0, 0, 1, 1,
0.03979618, 0.08149033, -0.04754749, 0, 0, 0, 1, 1,
0.04592628, 0.1334877, 1.180219, 1, 1, 1, 1, 1,
0.04641739, -0.4094832, 1.789044, 1, 1, 1, 1, 1,
0.04938867, -1.960365, 2.248282, 1, 1, 1, 1, 1,
0.05044301, -0.2403703, 2.508947, 1, 1, 1, 1, 1,
0.05474899, -0.3167985, 2.756895, 1, 1, 1, 1, 1,
0.05575801, 0.4548334, 0.001180965, 1, 1, 1, 1, 1,
0.06013089, -1.736526, 4.210415, 1, 1, 1, 1, 1,
0.06506196, -0.9663757, 3.462204, 1, 1, 1, 1, 1,
0.06594513, 1.70281, -0.4714691, 1, 1, 1, 1, 1,
0.06722064, -0.5562109, 3.445793, 1, 1, 1, 1, 1,
0.07118382, -0.5661629, 1.907465, 1, 1, 1, 1, 1,
0.07494947, 0.005527003, 0.1379857, 1, 1, 1, 1, 1,
0.07979157, -2.0726, 2.896671, 1, 1, 1, 1, 1,
0.07991046, -0.5810936, 4.233151, 1, 1, 1, 1, 1,
0.08336999, 1.225521, 1.130967, 1, 1, 1, 1, 1,
0.08492392, -0.05562428, 1.834086, 0, 0, 1, 1, 1,
0.08649339, -1.231826, 3.517276, 1, 0, 0, 1, 1,
0.08707941, 0.0008968441, 3.645062, 1, 0, 0, 1, 1,
0.08892783, -0.8182806, 1.784528, 1, 0, 0, 1, 1,
0.08908055, -0.7577975, 3.285994, 1, 0, 0, 1, 1,
0.09019127, -1.263759, 3.598853, 1, 0, 0, 1, 1,
0.1022994, -1.033835, 2.47322, 0, 0, 0, 1, 1,
0.1023747, 2.594484, -0.3347527, 0, 0, 0, 1, 1,
0.1067408, -2.176926, 1.776344, 0, 0, 0, 1, 1,
0.1105972, 1.953905, -0.9002962, 0, 0, 0, 1, 1,
0.1170141, -0.2702516, 2.697317, 0, 0, 0, 1, 1,
0.124465, -0.320053, 4.966393, 0, 0, 0, 1, 1,
0.1257641, -2.639087, 4.221982, 0, 0, 0, 1, 1,
0.1266159, -0.7745809, 3.877357, 1, 1, 1, 1, 1,
0.1331097, 1.622731, -0.2653966, 1, 1, 1, 1, 1,
0.1337305, -0.7273661, 3.776984, 1, 1, 1, 1, 1,
0.1373261, -0.4516307, 1.554072, 1, 1, 1, 1, 1,
0.1374326, -0.5422469, 3.877329, 1, 1, 1, 1, 1,
0.1376914, 0.6609713, 1.542964, 1, 1, 1, 1, 1,
0.1437116, -0.1153979, 1.255371, 1, 1, 1, 1, 1,
0.1453025, -0.9140862, 3.926093, 1, 1, 1, 1, 1,
0.1468614, -1.199216, 2.91193, 1, 1, 1, 1, 1,
0.1481127, 1.361849, -0.108215, 1, 1, 1, 1, 1,
0.1491055, -1.004025, 2.291762, 1, 1, 1, 1, 1,
0.1494997, -0.7907471, 4.40348, 1, 1, 1, 1, 1,
0.1504553, -1.846006, 2.662973, 1, 1, 1, 1, 1,
0.150678, -0.5211751, 2.639196, 1, 1, 1, 1, 1,
0.1516106, -1.210906, 4.064294, 1, 1, 1, 1, 1,
0.152378, -2.847599, 3.683374, 0, 0, 1, 1, 1,
0.1535659, 0.8601642, 1.499245, 1, 0, 0, 1, 1,
0.1555316, 0.7701267, -1.197105, 1, 0, 0, 1, 1,
0.1566021, -0.9628021, 4.155912, 1, 0, 0, 1, 1,
0.1579646, 1.559522, -0.7447338, 1, 0, 0, 1, 1,
0.1581684, -0.686019, 3.603216, 1, 0, 0, 1, 1,
0.1587653, -0.5852938, 1.858425, 0, 0, 0, 1, 1,
0.1592728, 0.803271, 0.8021645, 0, 0, 0, 1, 1,
0.1617019, -0.5570658, 4.556013, 0, 0, 0, 1, 1,
0.1623218, -1.833197, -0.2689462, 0, 0, 0, 1, 1,
0.1630818, -0.9005624, 2.243419, 0, 0, 0, 1, 1,
0.1666413, -1.354888, 3.458638, 0, 0, 0, 1, 1,
0.1742686, -0.6297958, 1.267957, 0, 0, 0, 1, 1,
0.1750396, 0.4816718, 1.185838, 1, 1, 1, 1, 1,
0.1808574, -0.8489605, 3.802504, 1, 1, 1, 1, 1,
0.1830765, -1.65927, 5.360882, 1, 1, 1, 1, 1,
0.1839905, -2.135162, 1.435484, 1, 1, 1, 1, 1,
0.1847722, -0.3121629, 2.967936, 1, 1, 1, 1, 1,
0.1864156, 0.318745, -0.55007, 1, 1, 1, 1, 1,
0.1938017, -0.7201856, 1.847833, 1, 1, 1, 1, 1,
0.1965192, 1.73271, -0.5327873, 1, 1, 1, 1, 1,
0.198643, 0.1118909, 0.176848, 1, 1, 1, 1, 1,
0.2046993, -0.7995488, 0.1170788, 1, 1, 1, 1, 1,
0.2155652, 1.945991, 1.000197, 1, 1, 1, 1, 1,
0.22176, 0.9124263, -0.3102933, 1, 1, 1, 1, 1,
0.2228809, 0.8419578, 1.707931, 1, 1, 1, 1, 1,
0.2245651, 0.1660931, 2.088975, 1, 1, 1, 1, 1,
0.2278963, 0.5900624, 1.247359, 1, 1, 1, 1, 1,
0.2308284, 0.2533051, 2.52403, 0, 0, 1, 1, 1,
0.2312186, -1.125286, 3.127762, 1, 0, 0, 1, 1,
0.235055, 0.09642614, 2.194334, 1, 0, 0, 1, 1,
0.2449051, 0.2248635, 1.22174, 1, 0, 0, 1, 1,
0.2488034, -0.6804149, 1.46423, 1, 0, 0, 1, 1,
0.2509353, 0.2374092, 1.1104, 1, 0, 0, 1, 1,
0.2524218, 1.127348, 0.6808574, 0, 0, 0, 1, 1,
0.2575428, 1.291128, -0.795957, 0, 0, 0, 1, 1,
0.2588772, -0.8157176, -0.1230871, 0, 0, 0, 1, 1,
0.2617832, -0.3552087, 4.093335, 0, 0, 0, 1, 1,
0.2645716, 1.32648, -0.4670494, 0, 0, 0, 1, 1,
0.2699567, -1.967932, 3.216624, 0, 0, 0, 1, 1,
0.2732376, 0.5718066, 1.093863, 0, 0, 0, 1, 1,
0.2766767, 0.366437, -0.4558253, 1, 1, 1, 1, 1,
0.2779899, 0.3790514, -0.6210679, 1, 1, 1, 1, 1,
0.2827898, -0.02988314, 2.496167, 1, 1, 1, 1, 1,
0.2848561, -0.4596054, 3.751759, 1, 1, 1, 1, 1,
0.2880302, -1.65727, 2.035009, 1, 1, 1, 1, 1,
0.2917533, 0.9434683, -1.881654, 1, 1, 1, 1, 1,
0.2921936, -1.184598, 4.338688, 1, 1, 1, 1, 1,
0.2971447, -1.706198, 4.513018, 1, 1, 1, 1, 1,
0.2983971, 1.459946, 0.04013921, 1, 1, 1, 1, 1,
0.3007033, -0.1059351, 2.760888, 1, 1, 1, 1, 1,
0.3102177, -0.6720098, 2.219308, 1, 1, 1, 1, 1,
0.3269092, 0.5707296, 0.2789174, 1, 1, 1, 1, 1,
0.3287261, -1.898928, 3.693459, 1, 1, 1, 1, 1,
0.3318295, -2.791008, 2.903158, 1, 1, 1, 1, 1,
0.3324847, 0.703002, 0.7497038, 1, 1, 1, 1, 1,
0.3332116, -0.2927348, 2.720963, 0, 0, 1, 1, 1,
0.3356527, -0.2355238, 2.584075, 1, 0, 0, 1, 1,
0.3398396, 0.8759416, 1.222432, 1, 0, 0, 1, 1,
0.3416314, 0.6036429, -0.2375965, 1, 0, 0, 1, 1,
0.345387, 0.1092941, 1.940966, 1, 0, 0, 1, 1,
0.3474071, -0.6020426, 1.415291, 1, 0, 0, 1, 1,
0.3482007, 0.5297044, 1.586758, 0, 0, 0, 1, 1,
0.3488339, 1.760736, 0.05519046, 0, 0, 0, 1, 1,
0.3537453, -0.3840309, 2.005138, 0, 0, 0, 1, 1,
0.355848, 0.6129153, 1.487926, 0, 0, 0, 1, 1,
0.3575444, -0.3950207, 2.902588, 0, 0, 0, 1, 1,
0.3581541, 1.731054, 1.666262, 0, 0, 0, 1, 1,
0.3585076, 0.01424247, 0.3104087, 0, 0, 0, 1, 1,
0.3597215, -0.2300264, 2.222821, 1, 1, 1, 1, 1,
0.3624958, -0.9598668, 2.249535, 1, 1, 1, 1, 1,
0.3710959, -0.6241167, 3.584137, 1, 1, 1, 1, 1,
0.3715278, 0.400601, 1.327959, 1, 1, 1, 1, 1,
0.3731765, 1.437545, -0.3243665, 1, 1, 1, 1, 1,
0.3737887, 0.8145894, 0.3930983, 1, 1, 1, 1, 1,
0.3814406, -0.4814007, 3.435735, 1, 1, 1, 1, 1,
0.3820549, -0.2904479, 2.83774, 1, 1, 1, 1, 1,
0.383012, -1.280163, 1.786509, 1, 1, 1, 1, 1,
0.3831193, -0.4676061, 3.188617, 1, 1, 1, 1, 1,
0.38322, -0.5092514, 4.907639, 1, 1, 1, 1, 1,
0.3848052, -0.5043888, 3.343711, 1, 1, 1, 1, 1,
0.3873267, 2.174963, 0.3238448, 1, 1, 1, 1, 1,
0.387815, -0.9214281, 3.502117, 1, 1, 1, 1, 1,
0.4065361, -0.07584108, 3.00748, 1, 1, 1, 1, 1,
0.4149195, 0.6682045, 0.652742, 0, 0, 1, 1, 1,
0.4168613, 1.117126, 1.889449, 1, 0, 0, 1, 1,
0.4190114, 2.259394, -0.1014041, 1, 0, 0, 1, 1,
0.4235187, 0.9147632, 0.1211331, 1, 0, 0, 1, 1,
0.4270118, 1.330477, 0.9430465, 1, 0, 0, 1, 1,
0.4306093, 0.8224266, 0.9601133, 1, 0, 0, 1, 1,
0.4407051, 0.9243439, -0.2174029, 0, 0, 0, 1, 1,
0.4424627, -1.256115, 2.882441, 0, 0, 0, 1, 1,
0.4439772, 1.150366, -0.3793017, 0, 0, 0, 1, 1,
0.4455875, 1.455031, -0.141022, 0, 0, 0, 1, 1,
0.4495125, -0.150839, 2.077209, 0, 0, 0, 1, 1,
0.4512135, 0.7867797, 1.110942, 0, 0, 0, 1, 1,
0.4517103, 0.2988684, -0.25713, 0, 0, 0, 1, 1,
0.4540508, 0.6459081, 0.2391391, 1, 1, 1, 1, 1,
0.45701, 0.8944772, 0.3461045, 1, 1, 1, 1, 1,
0.4585141, 2.346799, 0.9552833, 1, 1, 1, 1, 1,
0.4587541, 0.8061844, 0.9143452, 1, 1, 1, 1, 1,
0.4597826, 0.367281, -0.1325114, 1, 1, 1, 1, 1,
0.4619319, 0.178985, -0.224901, 1, 1, 1, 1, 1,
0.4634345, -0.5584075, 2.785172, 1, 1, 1, 1, 1,
0.4639489, 1.287265, 1.063257, 1, 1, 1, 1, 1,
0.4651774, 0.4709963, 0.2481701, 1, 1, 1, 1, 1,
0.4690636, 0.9512665, 0.6823612, 1, 1, 1, 1, 1,
0.4725815, 0.4194493, 0.1205154, 1, 1, 1, 1, 1,
0.4737118, -1.064903, 3.500767, 1, 1, 1, 1, 1,
0.4763889, -0.002564217, 2.923514, 1, 1, 1, 1, 1,
0.4775963, 1.085591, 1.061067, 1, 1, 1, 1, 1,
0.4796535, -0.9657726, 2.893347, 1, 1, 1, 1, 1,
0.484726, -1.579698, 1.044037, 0, 0, 1, 1, 1,
0.488011, -0.9466168, 1.920653, 1, 0, 0, 1, 1,
0.4938835, -0.8724661, 1.008907, 1, 0, 0, 1, 1,
0.4955093, 0.6287162, -1.366506, 1, 0, 0, 1, 1,
0.4996324, -1.838012, 3.383503, 1, 0, 0, 1, 1,
0.5040841, -1.061347, 2.393295, 1, 0, 0, 1, 1,
0.5045994, 1.643527, 0.09171099, 0, 0, 0, 1, 1,
0.5066345, 0.1761853, 2.886975, 0, 0, 0, 1, 1,
0.5069528, -1.435411, 3.217977, 0, 0, 0, 1, 1,
0.5080878, -0.05288095, 1.10894, 0, 0, 0, 1, 1,
0.5082233, -1.245642, 2.253113, 0, 0, 0, 1, 1,
0.5110737, 0.8708117, -0.2252174, 0, 0, 0, 1, 1,
0.5193736, 0.1526158, 0.6646425, 0, 0, 0, 1, 1,
0.5201628, -0.6717594, 1.9164, 1, 1, 1, 1, 1,
0.5219302, 1.672141, -1.306075, 1, 1, 1, 1, 1,
0.5222662, 0.02875599, 2.406112, 1, 1, 1, 1, 1,
0.5245929, 1.287673, -0.4251987, 1, 1, 1, 1, 1,
0.5247618, 0.7141057, 0.2638084, 1, 1, 1, 1, 1,
0.5258774, -0.2368556, 2.118271, 1, 1, 1, 1, 1,
0.5273502, -0.930683, 1.576971, 1, 1, 1, 1, 1,
0.5289299, -0.1532444, 0.5171993, 1, 1, 1, 1, 1,
0.5327123, -0.9150282, 3.126913, 1, 1, 1, 1, 1,
0.5346069, -0.946107, 1.063103, 1, 1, 1, 1, 1,
0.5371796, -0.7571406, 4.028264, 1, 1, 1, 1, 1,
0.5382039, -0.8750626, 2.92911, 1, 1, 1, 1, 1,
0.5393052, 0.7680764, 0.7517036, 1, 1, 1, 1, 1,
0.5414277, -2.121104, 4.396205, 1, 1, 1, 1, 1,
0.5430936, -0.5334379, 0.2664875, 1, 1, 1, 1, 1,
0.5455792, -0.7618985, 4.042639, 0, 0, 1, 1, 1,
0.546941, 0.935327, 0.9134971, 1, 0, 0, 1, 1,
0.5510788, -0.9306008, 1.596994, 1, 0, 0, 1, 1,
0.5581462, 1.809213, 0.7697243, 1, 0, 0, 1, 1,
0.5583215, -0.05633104, 1.207731, 1, 0, 0, 1, 1,
0.5591925, -0.04206155, 1.851726, 1, 0, 0, 1, 1,
0.5630829, 2.139901, -0.01711013, 0, 0, 0, 1, 1,
0.5660601, -0.4337947, 3.113969, 0, 0, 0, 1, 1,
0.5669296, 0.9261906, 0.5534006, 0, 0, 0, 1, 1,
0.5728011, 0.09418218, 1.29952, 0, 0, 0, 1, 1,
0.5754598, -1.811178, 3.575928, 0, 0, 0, 1, 1,
0.581005, 0.7025141, 0.2998059, 0, 0, 0, 1, 1,
0.5818154, -1.278809, 3.258635, 0, 0, 0, 1, 1,
0.5824226, -1.124344, 4.340066, 1, 1, 1, 1, 1,
0.587164, -0.6537554, 1.786315, 1, 1, 1, 1, 1,
0.5914363, -2.41843, 2.91491, 1, 1, 1, 1, 1,
0.5934423, -0.07754739, 1.047686, 1, 1, 1, 1, 1,
0.5952521, -0.002276527, 0.4290804, 1, 1, 1, 1, 1,
0.5959237, 0.4281805, -0.4307288, 1, 1, 1, 1, 1,
0.5975399, -0.09562804, 0.009926435, 1, 1, 1, 1, 1,
0.6164265, -0.7865725, 1.373264, 1, 1, 1, 1, 1,
0.6176177, 1.65299, -0.4329527, 1, 1, 1, 1, 1,
0.620419, -0.2304247, 4.993032, 1, 1, 1, 1, 1,
0.6212022, -0.0866869, 2.230767, 1, 1, 1, 1, 1,
0.6273043, 1.574376, -1.39984, 1, 1, 1, 1, 1,
0.6394109, 0.1986626, 1.860082, 1, 1, 1, 1, 1,
0.641835, 0.4071158, -0.02883099, 1, 1, 1, 1, 1,
0.645005, 0.4181525, -0.4169042, 1, 1, 1, 1, 1,
0.6454668, 1.60733, 0.05690145, 0, 0, 1, 1, 1,
0.651915, 1.855076, -0.8713871, 1, 0, 0, 1, 1,
0.6529126, -0.1718749, 0.07840157, 1, 0, 0, 1, 1,
0.664457, -0.6932267, 3.415502, 1, 0, 0, 1, 1,
0.6720169, -2.150372, 1.567533, 1, 0, 0, 1, 1,
0.6731723, 0.1934738, 2.983967, 1, 0, 0, 1, 1,
0.6779904, -0.4430782, 1.021844, 0, 0, 0, 1, 1,
0.678266, 0.5184225, -0.4138897, 0, 0, 0, 1, 1,
0.68265, 2.641901, 1.046517, 0, 0, 0, 1, 1,
0.68589, -0.3857635, 3.935659, 0, 0, 0, 1, 1,
0.68659, 1.138501, 2.033233, 0, 0, 0, 1, 1,
0.6956165, -0.1965543, 2.489295, 0, 0, 0, 1, 1,
0.697166, 1.511185, -0.3751194, 0, 0, 0, 1, 1,
0.6976123, -0.2580205, 1.841245, 1, 1, 1, 1, 1,
0.7030959, 1.111455, 0.4499815, 1, 1, 1, 1, 1,
0.7112014, -1.476464, 2.073034, 1, 1, 1, 1, 1,
0.7130121, -0.3760917, 2.027913, 1, 1, 1, 1, 1,
0.713033, -0.9541844, 1.82276, 1, 1, 1, 1, 1,
0.7139436, 0.6355634, 0.921738, 1, 1, 1, 1, 1,
0.7180207, 0.876411, 0.03084698, 1, 1, 1, 1, 1,
0.7268992, -0.3139337, 0.6589565, 1, 1, 1, 1, 1,
0.7293553, 0.3258775, 0.7222744, 1, 1, 1, 1, 1,
0.733436, -0.01693949, 2.285752, 1, 1, 1, 1, 1,
0.7341663, -0.5580581, 2.028277, 1, 1, 1, 1, 1,
0.7365751, 1.318598, 1.459465, 1, 1, 1, 1, 1,
0.7426805, 1.028894, 0.7038968, 1, 1, 1, 1, 1,
0.7483444, 0.363348, -0.9601528, 1, 1, 1, 1, 1,
0.7506729, 0.8710459, 1.915401, 1, 1, 1, 1, 1,
0.7583627, 1.513216, -0.06422054, 0, 0, 1, 1, 1,
0.7585506, -1.40778, 0.9431002, 1, 0, 0, 1, 1,
0.7646192, 1.029263, -0.04232452, 1, 0, 0, 1, 1,
0.7694007, 0.433036, 0.5318118, 1, 0, 0, 1, 1,
0.7739699, 0.1210434, 1.128288, 1, 0, 0, 1, 1,
0.7740642, 0.4854967, 0.4024722, 1, 0, 0, 1, 1,
0.7778097, -1.411793, 4.678808, 0, 0, 0, 1, 1,
0.7781419, -0.1817201, 1.834934, 0, 0, 0, 1, 1,
0.7853373, -0.2968038, 1.497425, 0, 0, 0, 1, 1,
0.7858884, -0.6097344, 2.15357, 0, 0, 0, 1, 1,
0.789484, -1.368345, 3.451838, 0, 0, 0, 1, 1,
0.7908635, -1.469322, 2.127282, 0, 0, 0, 1, 1,
0.7916371, -0.8516585, 2.505558, 0, 0, 0, 1, 1,
0.7978521, -1.455074, 3.46418, 1, 1, 1, 1, 1,
0.8004823, 0.01574898, 1.987926, 1, 1, 1, 1, 1,
0.800625, 1.042117, -0.8478773, 1, 1, 1, 1, 1,
0.8015059, 0.2117777, -0.02434411, 1, 1, 1, 1, 1,
0.8029426, -0.8492828, 2.311005, 1, 1, 1, 1, 1,
0.8092463, 0.7841612, 1.275966, 1, 1, 1, 1, 1,
0.8097113, 1.019211, -0.08063225, 1, 1, 1, 1, 1,
0.8150263, -1.490181, 3.032802, 1, 1, 1, 1, 1,
0.8165003, 0.2229046, 1.247167, 1, 1, 1, 1, 1,
0.823208, 1.497086, 1.6816, 1, 1, 1, 1, 1,
0.8320789, 0.1139692, 0.7086282, 1, 1, 1, 1, 1,
0.8446819, 0.8466396, 1.58528, 1, 1, 1, 1, 1,
0.8456169, -0.04309876, 0.5711423, 1, 1, 1, 1, 1,
0.8521242, -0.9809148, 2.080778, 1, 1, 1, 1, 1,
0.8554218, -0.0728938, 1.140742, 1, 1, 1, 1, 1,
0.8559915, -0.5026085, 2.739899, 0, 0, 1, 1, 1,
0.856115, 0.1559793, 0.9507664, 1, 0, 0, 1, 1,
0.8564139, -0.8227006, 2.466713, 1, 0, 0, 1, 1,
0.8578563, -1.178079, 0.5664975, 1, 0, 0, 1, 1,
0.8616525, -0.6139521, 1.575514, 1, 0, 0, 1, 1,
0.8658872, -1.484747, 1.026266, 1, 0, 0, 1, 1,
0.8743014, -0.5718961, 1.753353, 0, 0, 0, 1, 1,
0.8744426, 1.131487, 0.6803198, 0, 0, 0, 1, 1,
0.8759995, -0.4718023, 0.8716102, 0, 0, 0, 1, 1,
0.8798106, 1.297384, 1.322128, 0, 0, 0, 1, 1,
0.8819337, 0.7007148, 1.569843, 0, 0, 0, 1, 1,
0.8825909, -0.3000206, 1.649664, 0, 0, 0, 1, 1,
0.8848326, 1.215884, -0.3541188, 0, 0, 0, 1, 1,
0.8885375, -0.4433786, 3.202655, 1, 1, 1, 1, 1,
0.8908824, -2.276914, 1.905082, 1, 1, 1, 1, 1,
0.8931424, 0.1370365, 0.4489195, 1, 1, 1, 1, 1,
0.8939161, -1.118551, 2.01181, 1, 1, 1, 1, 1,
0.8947583, 0.5419025, 1.402814, 1, 1, 1, 1, 1,
0.9009265, 1.228904, -0.02700574, 1, 1, 1, 1, 1,
0.9027882, -1.878893, 2.175279, 1, 1, 1, 1, 1,
0.9029641, 0.7362443, 0.3645279, 1, 1, 1, 1, 1,
0.9072922, 0.1488325, 2.374616, 1, 1, 1, 1, 1,
0.9108999, -0.5721253, 1.895662, 1, 1, 1, 1, 1,
0.9129056, -0.6173235, 3.720564, 1, 1, 1, 1, 1,
0.9201367, 0.1769776, 0.890312, 1, 1, 1, 1, 1,
0.9231198, 0.9206955, 0.2460953, 1, 1, 1, 1, 1,
0.9265023, 0.9176549, -0.006509541, 1, 1, 1, 1, 1,
0.9271485, -0.7699774, 3.750764, 1, 1, 1, 1, 1,
0.9275492, 0.02839659, 3.29312, 0, 0, 1, 1, 1,
0.9282709, 0.8163646, 0.08742229, 1, 0, 0, 1, 1,
0.9301012, 0.3849231, 3.778642, 1, 0, 0, 1, 1,
0.9324129, -0.8059081, 1.676529, 1, 0, 0, 1, 1,
0.9469505, -0.6709937, 2.41584, 1, 0, 0, 1, 1,
0.9504267, 1.224878, 0.2078854, 1, 0, 0, 1, 1,
0.9560002, 0.3145882, 1.318737, 0, 0, 0, 1, 1,
0.9583057, 1.31108, 3.054599, 0, 0, 0, 1, 1,
0.9671873, 1.404396, -1.297736, 0, 0, 0, 1, 1,
0.9777424, 0.4109276, 2.562866, 0, 0, 0, 1, 1,
0.9824954, 0.3803855, -0.8679715, 0, 0, 0, 1, 1,
0.9902678, 1.541937, 0.3888718, 0, 0, 0, 1, 1,
0.990317, -0.8522991, 0.6297764, 0, 0, 0, 1, 1,
0.9916877, 0.5033697, 1.015644, 1, 1, 1, 1, 1,
0.9931304, -0.2487559, 1.721795, 1, 1, 1, 1, 1,
0.9966878, 0.4066285, 0.8757588, 1, 1, 1, 1, 1,
0.9995247, 1.000322, 0.2733429, 1, 1, 1, 1, 1,
1.000387, -0.5506735, 3.634866, 1, 1, 1, 1, 1,
1.005784, -0.5935083, 1.286342, 1, 1, 1, 1, 1,
1.016187, -0.6778954, 2.511482, 1, 1, 1, 1, 1,
1.023355, -1.019638, 0.1495098, 1, 1, 1, 1, 1,
1.027474, 0.5144919, 1.633823, 1, 1, 1, 1, 1,
1.029817, 0.4534082, 3.037084, 1, 1, 1, 1, 1,
1.030708, 0.411548, 1.537036, 1, 1, 1, 1, 1,
1.032892, -0.4208852, 1.525979, 1, 1, 1, 1, 1,
1.038589, 0.4918438, 2.650877, 1, 1, 1, 1, 1,
1.042713, -1.689319, 1.28696, 1, 1, 1, 1, 1,
1.047873, 0.6142281, 2.253333, 1, 1, 1, 1, 1,
1.054273, -0.1954257, 0.001939328, 0, 0, 1, 1, 1,
1.06019, 1.051252, 1.292352, 1, 0, 0, 1, 1,
1.065678, -0.07967266, 2.762446, 1, 0, 0, 1, 1,
1.085157, 0.1872536, 1.925686, 1, 0, 0, 1, 1,
1.08877, -0.6601743, 1.394071, 1, 0, 0, 1, 1,
1.089297, 1.340629, 0.4679534, 1, 0, 0, 1, 1,
1.095612, -0.3721862, 2.477921, 0, 0, 0, 1, 1,
1.09572, 0.4029091, 2.040554, 0, 0, 0, 1, 1,
1.095858, -0.6149014, 3.159683, 0, 0, 0, 1, 1,
1.09925, 0.600982, 0.9482798, 0, 0, 0, 1, 1,
1.101596, -1.6729, 3.228232, 0, 0, 0, 1, 1,
1.109308, -0.4537509, 2.216738, 0, 0, 0, 1, 1,
1.10934, 0.4511855, 0.8789936, 0, 0, 0, 1, 1,
1.11687, -1.358803, 3.328312, 1, 1, 1, 1, 1,
1.121138, -0.4403248, 1.282817, 1, 1, 1, 1, 1,
1.121587, -0.5735291, 1.384021, 1, 1, 1, 1, 1,
1.124331, 0.03983686, 0.4539137, 1, 1, 1, 1, 1,
1.12701, -0.4793035, -0.1686163, 1, 1, 1, 1, 1,
1.12792, 0.6812218, -0.8159532, 1, 1, 1, 1, 1,
1.129774, -0.522978, 1.30949, 1, 1, 1, 1, 1,
1.135566, 0.8016255, 2.938828, 1, 1, 1, 1, 1,
1.139569, -0.08062519, 0.7881256, 1, 1, 1, 1, 1,
1.14121, -1.354964, 0.05987502, 1, 1, 1, 1, 1,
1.147817, 1.035632, 1.97942, 1, 1, 1, 1, 1,
1.153167, -0.6805395, 0.628906, 1, 1, 1, 1, 1,
1.158287, -0.465625, 1.659761, 1, 1, 1, 1, 1,
1.162512, -0.8797957, 2.831315, 1, 1, 1, 1, 1,
1.166239, 0.7420961, 0.8664003, 1, 1, 1, 1, 1,
1.16764, 0.4810511, 2.36966, 0, 0, 1, 1, 1,
1.180647, -1.543182, 2.245192, 1, 0, 0, 1, 1,
1.180856, -0.5078664, 2.17704, 1, 0, 0, 1, 1,
1.181114, -0.2362025, 0.5550894, 1, 0, 0, 1, 1,
1.185776, -1.343816, 3.857977, 1, 0, 0, 1, 1,
1.190357, 1.18446, 0.1732121, 1, 0, 0, 1, 1,
1.191277, 0.2180395, 2.944367, 0, 0, 0, 1, 1,
1.199862, 0.6813917, 1.051466, 0, 0, 0, 1, 1,
1.199992, -0.4667123, 1.968405, 0, 0, 0, 1, 1,
1.200379, 1.392276, 0.05512871, 0, 0, 0, 1, 1,
1.216166, 0.2485382, 1.258721, 0, 0, 0, 1, 1,
1.229314, -1.077147, 1.211401, 0, 0, 0, 1, 1,
1.229716, -1.488105, 2.867221, 0, 0, 0, 1, 1,
1.238656, 0.2642142, 1.04579, 1, 1, 1, 1, 1,
1.243015, 0.6758825, 0.7860045, 1, 1, 1, 1, 1,
1.250818, -0.02304485, 1.490077, 1, 1, 1, 1, 1,
1.254151, 0.987655, 1.439545, 1, 1, 1, 1, 1,
1.257149, 0.2200751, 1.847968, 1, 1, 1, 1, 1,
1.266127, -1.182727, 2.905995, 1, 1, 1, 1, 1,
1.26673, -2.179583, 3.975617, 1, 1, 1, 1, 1,
1.274819, -0.7802883, 1.578112, 1, 1, 1, 1, 1,
1.283667, -0.02338623, 2.439727, 1, 1, 1, 1, 1,
1.283874, -0.08080748, 3.444366, 1, 1, 1, 1, 1,
1.284621, -0.3727725, 2.117899, 1, 1, 1, 1, 1,
1.293137, 1.309803, -0.03201404, 1, 1, 1, 1, 1,
1.294009, 0.7051839, 0.4730075, 1, 1, 1, 1, 1,
1.296334, 0.745079, 1.183114, 1, 1, 1, 1, 1,
1.296976, 0.1836006, 1.687862, 1, 1, 1, 1, 1,
1.299982, 0.81019, 1.225695, 0, 0, 1, 1, 1,
1.300441, -0.008771633, 1.289945, 1, 0, 0, 1, 1,
1.305235, -1.654265, 1.883071, 1, 0, 0, 1, 1,
1.305745, -1.099561, 2.522292, 1, 0, 0, 1, 1,
1.306836, -1.395542, 0.1091959, 1, 0, 0, 1, 1,
1.308348, -0.5696004, 1.560004, 1, 0, 0, 1, 1,
1.315502, 1.468795, 1.681996, 0, 0, 0, 1, 1,
1.331012, -0.5368888, 0.4845918, 0, 0, 0, 1, 1,
1.34303, 0.2856004, 1.697469, 0, 0, 0, 1, 1,
1.353481, -0.6309599, 2.026187, 0, 0, 0, 1, 1,
1.369817, -0.2869102, 1.908428, 0, 0, 0, 1, 1,
1.383321, 0.0647028, 0.5261567, 0, 0, 0, 1, 1,
1.383688, 0.7230629, 0.969313, 0, 0, 0, 1, 1,
1.394385, -0.9397802, 0.5750327, 1, 1, 1, 1, 1,
1.396968, 1.841362, -0.7183412, 1, 1, 1, 1, 1,
1.399417, 2.054761, -0.1836487, 1, 1, 1, 1, 1,
1.404485, 0.362071, 1.616695, 1, 1, 1, 1, 1,
1.451616, 0.694862, 0.1296196, 1, 1, 1, 1, 1,
1.45457, -0.2374785, 1.571246, 1, 1, 1, 1, 1,
1.45469, -0.2339613, 1.064343, 1, 1, 1, 1, 1,
1.455585, -0.1887721, 2.120267, 1, 1, 1, 1, 1,
1.456484, 0.3897689, -0.2077625, 1, 1, 1, 1, 1,
1.456779, -0.4608323, 2.274271, 1, 1, 1, 1, 1,
1.473876, -0.2883707, 2.391392, 1, 1, 1, 1, 1,
1.479721, -1.258572, 2.759905, 1, 1, 1, 1, 1,
1.480429, -0.6558887, 2.559576, 1, 1, 1, 1, 1,
1.480515, -0.4693311, 0.570229, 1, 1, 1, 1, 1,
1.49048, 1.403141, -0.1106982, 1, 1, 1, 1, 1,
1.493478, 0.539034, 1.584812, 0, 0, 1, 1, 1,
1.513301, 0.4381697, 1.873538, 1, 0, 0, 1, 1,
1.51502, 0.2814021, 3.526146, 1, 0, 0, 1, 1,
1.52054, -0.299286, 0.204391, 1, 0, 0, 1, 1,
1.526531, 1.496825, 2.181865, 1, 0, 0, 1, 1,
1.533118, -1.030754, 2.498851, 1, 0, 0, 1, 1,
1.536292, 1.211847, 1.554312, 0, 0, 0, 1, 1,
1.537272, 2.306912, 0.4882745, 0, 0, 0, 1, 1,
1.553842, 0.7747129, -1.107309, 0, 0, 0, 1, 1,
1.55481, -0.1813423, 1.444578, 0, 0, 0, 1, 1,
1.57038, 1.644556, -0.4482355, 0, 0, 0, 1, 1,
1.572392, 0.1891808, 1.635012, 0, 0, 0, 1, 1,
1.5754, 1.154226, 0.9737613, 0, 0, 0, 1, 1,
1.580406, 0.4482026, 1.033595, 1, 1, 1, 1, 1,
1.583694, -0.9936274, 2.090933, 1, 1, 1, 1, 1,
1.587433, -0.5983086, 1.428672, 1, 1, 1, 1, 1,
1.591503, -1.646318, 3.00683, 1, 1, 1, 1, 1,
1.604793, -1.208616, 0.1943579, 1, 1, 1, 1, 1,
1.610492, -0.6847777, 2.323726, 1, 1, 1, 1, 1,
1.621451, -0.5743062, 1.017801, 1, 1, 1, 1, 1,
1.62506, -1.623996, 1.240688, 1, 1, 1, 1, 1,
1.639347, -0.1532549, 2.141627, 1, 1, 1, 1, 1,
1.639684, -0.8103547, -0.385334, 1, 1, 1, 1, 1,
1.676142, 1.620273, 1.620331, 1, 1, 1, 1, 1,
1.682103, -0.2773356, 3.997449, 1, 1, 1, 1, 1,
1.685741, 0.2136992, 1.468015, 1, 1, 1, 1, 1,
1.716917, -0.2954258, 1.003002, 1, 1, 1, 1, 1,
1.724307, 1.196506, 1.866745, 1, 1, 1, 1, 1,
1.72627, -1.235522, 2.579608, 0, 0, 1, 1, 1,
1.729143, -0.726849, 4.584082, 1, 0, 0, 1, 1,
1.77355, -1.355836, 1.46241, 1, 0, 0, 1, 1,
1.795967, -0.7193708, 2.381457, 1, 0, 0, 1, 1,
1.806153, 1.598002, 1.64845, 1, 0, 0, 1, 1,
1.809907, -0.1726868, 2.886853, 1, 0, 0, 1, 1,
1.831039, -0.4482042, 4.173558, 0, 0, 0, 1, 1,
1.841008, -0.58867, 2.203614, 0, 0, 0, 1, 1,
1.84766, 0.5697784, -0.8843626, 0, 0, 0, 1, 1,
1.861365, 0.7881439, 3.352964, 0, 0, 0, 1, 1,
1.864903, -0.4968276, 1.943884, 0, 0, 0, 1, 1,
1.911628, -0.7797296, -1.68261, 0, 0, 0, 1, 1,
1.924189, -0.8773994, 0.7814777, 0, 0, 0, 1, 1,
1.931854, 0.8295047, 1.037992, 1, 1, 1, 1, 1,
1.934862, 0.6193234, 0.8314459, 1, 1, 1, 1, 1,
1.952113, -2.056613, 4.947598, 1, 1, 1, 1, 1,
2.022618, -1.115224, 1.209005, 1, 1, 1, 1, 1,
2.023335, 1.35321, 0.6878061, 1, 1, 1, 1, 1,
2.053485, -0.08519895, 2.525105, 1, 1, 1, 1, 1,
2.069298, -0.3145578, 2.395631, 1, 1, 1, 1, 1,
2.071266, -0.7099803, 2.393261, 1, 1, 1, 1, 1,
2.077765, -0.3008124, 1.63429, 1, 1, 1, 1, 1,
2.091711, 0.7271567, 3.611867, 1, 1, 1, 1, 1,
2.094693, -0.5827681, 2.615604, 1, 1, 1, 1, 1,
2.109276, -0.538269, 3.320518, 1, 1, 1, 1, 1,
2.137228, -1.259758, 2.571283, 1, 1, 1, 1, 1,
2.153465, 1.900661, 0.9714791, 1, 1, 1, 1, 1,
2.17544, -0.5802917, 3.042007, 1, 1, 1, 1, 1,
2.18349, -0.3299414, 1.004448, 0, 0, 1, 1, 1,
2.208955, -0.8607947, 2.187849, 1, 0, 0, 1, 1,
2.216308, 0.174491, 1.898089, 1, 0, 0, 1, 1,
2.236893, 0.2263255, 2.423237, 1, 0, 0, 1, 1,
2.283453, -0.9872751, 1.390592, 1, 0, 0, 1, 1,
2.304408, -0.1633864, -0.7325531, 1, 0, 0, 1, 1,
2.318431, -0.1964101, 0.8108616, 0, 0, 0, 1, 1,
2.381577, 2.267392, 2.29461, 0, 0, 0, 1, 1,
2.450819, 0.8850124, 1.532914, 0, 0, 0, 1, 1,
2.460452, -0.3059484, 1.760925, 0, 0, 0, 1, 1,
2.473117, -0.03954068, 0.7266971, 0, 0, 0, 1, 1,
2.496853, 0.6009558, 1.362952, 0, 0, 0, 1, 1,
2.519913, 0.9104286, 1.232677, 0, 0, 0, 1, 1,
2.654319, 1.176024, 0.3364304, 1, 1, 1, 1, 1,
2.726106, -0.7016353, 4.783913, 1, 1, 1, 1, 1,
2.752613, -0.9302405, 1.406846, 1, 1, 1, 1, 1,
2.787663, -0.5565203, 2.405399, 1, 1, 1, 1, 1,
2.997782, 1.470394, 2.544652, 1, 1, 1, 1, 1,
3.033785, 0.8008689, 1.202682, 1, 1, 1, 1, 1,
3.049499, -0.7717396, 2.956433, 1, 1, 1, 1, 1
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
var radius = 9.371543;
var distance = 32.91715;
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
mvMatrix.translate( -0.02000666, 0.2997627, -0.17751 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.91715);
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
