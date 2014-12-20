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
-3.272098, 0.3702884, -1.05562, 1, 0, 0, 1,
-3.097179, -1.179703, -1.693773, 1, 0.007843138, 0, 1,
-2.752806, 1.384547, -0.06102905, 1, 0.01176471, 0, 1,
-2.734585, 2.295968, -3.394712, 1, 0.01960784, 0, 1,
-2.488458, 0.4409018, -1.043446, 1, 0.02352941, 0, 1,
-2.477954, -3.076254, -3.412037, 1, 0.03137255, 0, 1,
-2.445082, -0.09885509, -4.003987, 1, 0.03529412, 0, 1,
-2.432197, -0.2975811, -0.6941054, 1, 0.04313726, 0, 1,
-2.430669, -0.2795943, -1.340047, 1, 0.04705882, 0, 1,
-2.407626, 1.075412, -0.4292636, 1, 0.05490196, 0, 1,
-2.387893, -0.3273616, -2.115417, 1, 0.05882353, 0, 1,
-2.370979, -0.6695092, -3.00001, 1, 0.06666667, 0, 1,
-2.203195, -0.3145975, -1.384895, 1, 0.07058824, 0, 1,
-2.174617, -0.6034153, 0.08828156, 1, 0.07843138, 0, 1,
-2.161905, 0.215821, -2.133932, 1, 0.08235294, 0, 1,
-2.059837, 1.184787, -1.704692, 1, 0.09019608, 0, 1,
-2.055628, -1.272146, -1.808958, 1, 0.09411765, 0, 1,
-2.054474, 0.3013346, -2.072101, 1, 0.1019608, 0, 1,
-1.989622, 2.245353, -1.685086, 1, 0.1098039, 0, 1,
-1.975744, 1.491697, -2.835497, 1, 0.1137255, 0, 1,
-1.972399, -2.344101, -2.987635, 1, 0.1215686, 0, 1,
-1.943205, -0.3468246, -1.22541, 1, 0.1254902, 0, 1,
-1.93551, -0.6583908, -1.393759, 1, 0.1333333, 0, 1,
-1.93103, -0.173438, -1.051625, 1, 0.1372549, 0, 1,
-1.901836, -2.290741, -3.884283, 1, 0.145098, 0, 1,
-1.852929, 0.02777078, -0.9295113, 1, 0.1490196, 0, 1,
-1.848765, -0.5519999, -0.553843, 1, 0.1568628, 0, 1,
-1.824112, 1.790792, -2.271091, 1, 0.1607843, 0, 1,
-1.811935, 1.599801, -2.100894, 1, 0.1686275, 0, 1,
-1.81103, -1.72354, -2.440248, 1, 0.172549, 0, 1,
-1.807643, 0.4021652, -1.907629, 1, 0.1803922, 0, 1,
-1.804567, -2.666346, -2.117944, 1, 0.1843137, 0, 1,
-1.79205, 2.571153, -0.2181501, 1, 0.1921569, 0, 1,
-1.775824, 0.09819759, -2.953658, 1, 0.1960784, 0, 1,
-1.766396, -0.609201, -3.057364, 1, 0.2039216, 0, 1,
-1.754141, -0.8216311, -2.311886, 1, 0.2117647, 0, 1,
-1.753345, -0.6700079, -0.3362958, 1, 0.2156863, 0, 1,
-1.709104, 0.2692889, -2.380495, 1, 0.2235294, 0, 1,
-1.699946, 0.5328288, -1.951025, 1, 0.227451, 0, 1,
-1.690586, 1.048557, -1.414648, 1, 0.2352941, 0, 1,
-1.688083, 1.281988, -2.366618, 1, 0.2392157, 0, 1,
-1.686389, 0.295529, -2.493745, 1, 0.2470588, 0, 1,
-1.682899, 0.06675422, -2.043186, 1, 0.2509804, 0, 1,
-1.678697, -0.6136575, -3.029377, 1, 0.2588235, 0, 1,
-1.660717, 1.911137, 0.08054595, 1, 0.2627451, 0, 1,
-1.66065, 2.210074, -1.558001, 1, 0.2705882, 0, 1,
-1.645678, -0.6083736, -0.9642704, 1, 0.2745098, 0, 1,
-1.644314, 1.450044, -1.871699, 1, 0.282353, 0, 1,
-1.631907, -0.9168866, -2.691481, 1, 0.2862745, 0, 1,
-1.624166, 1.381242, -1.979715, 1, 0.2941177, 0, 1,
-1.621906, 0.9881677, 0.224617, 1, 0.3019608, 0, 1,
-1.612552, -0.5982452, -0.5672515, 1, 0.3058824, 0, 1,
-1.610885, -0.4980457, -1.098533, 1, 0.3137255, 0, 1,
-1.604103, 0.8292915, -0.8314886, 1, 0.3176471, 0, 1,
-1.595129, 1.216373, -1.466175, 1, 0.3254902, 0, 1,
-1.593948, 2.35474, -1.362869, 1, 0.3294118, 0, 1,
-1.581057, 0.1550287, -0.9953656, 1, 0.3372549, 0, 1,
-1.575703, -0.3983845, -2.240194, 1, 0.3411765, 0, 1,
-1.572232, -0.6456442, -1.032775, 1, 0.3490196, 0, 1,
-1.557639, 0.4857989, -2.019525, 1, 0.3529412, 0, 1,
-1.535224, -2.099517, -4.162277, 1, 0.3607843, 0, 1,
-1.530138, 0.02994223, -1.611524, 1, 0.3647059, 0, 1,
-1.528895, 0.3117614, -2.782845, 1, 0.372549, 0, 1,
-1.522641, 0.06566013, -1.548508, 1, 0.3764706, 0, 1,
-1.518329, 0.3567063, -2.591757, 1, 0.3843137, 0, 1,
-1.493161, -0.4216499, -0.444652, 1, 0.3882353, 0, 1,
-1.492556, 0.3976447, -2.098896, 1, 0.3960784, 0, 1,
-1.483239, -1.476226, -1.509534, 1, 0.4039216, 0, 1,
-1.47882, -1.713575, -3.128441, 1, 0.4078431, 0, 1,
-1.475004, 0.2657311, -2.420306, 1, 0.4156863, 0, 1,
-1.469188, -0.1124465, -2.809691, 1, 0.4196078, 0, 1,
-1.467455, 0.4150527, -0.367577, 1, 0.427451, 0, 1,
-1.459269, -0.8534739, -1.563354, 1, 0.4313726, 0, 1,
-1.442585, -1.726257, -4.38635, 1, 0.4392157, 0, 1,
-1.429945, 0.3884743, -1.192956, 1, 0.4431373, 0, 1,
-1.40722, -0.1711849, -3.257517, 1, 0.4509804, 0, 1,
-1.397663, -2.21353, -2.888464, 1, 0.454902, 0, 1,
-1.38767, -1.082447, -3.510767, 1, 0.4627451, 0, 1,
-1.383, 1.576349, 0.8827006, 1, 0.4666667, 0, 1,
-1.382795, 0.4749856, -0.8156292, 1, 0.4745098, 0, 1,
-1.379456, -0.7845135, -2.291763, 1, 0.4784314, 0, 1,
-1.374417, -0.1886008, -3.366513, 1, 0.4862745, 0, 1,
-1.364977, -1.488808, -3.343905, 1, 0.4901961, 0, 1,
-1.350576, -1.86415, -3.620279, 1, 0.4980392, 0, 1,
-1.349429, -2.11989, -2.677089, 1, 0.5058824, 0, 1,
-1.346828, -0.7034892, -1.664396, 1, 0.509804, 0, 1,
-1.340107, -0.9083132, -2.3088, 1, 0.5176471, 0, 1,
-1.33102, -2.562059, -1.677435, 1, 0.5215687, 0, 1,
-1.318833, -2.031834, -2.162104, 1, 0.5294118, 0, 1,
-1.306652, -0.446779, -0.1460028, 1, 0.5333334, 0, 1,
-1.305984, -0.2516913, -0.6532244, 1, 0.5411765, 0, 1,
-1.294533, -1.186476, -2.249149, 1, 0.5450981, 0, 1,
-1.29384, 0.08837073, -1.74349, 1, 0.5529412, 0, 1,
-1.292051, -0.7644235, -1.81539, 1, 0.5568628, 0, 1,
-1.289925, -1.079401, -0.9188651, 1, 0.5647059, 0, 1,
-1.279183, 2.122835, -0.8479217, 1, 0.5686275, 0, 1,
-1.274391, 1.5012, -0.7777639, 1, 0.5764706, 0, 1,
-1.271517, -0.555037, -2.051314, 1, 0.5803922, 0, 1,
-1.268238, 0.04085452, -0.5813267, 1, 0.5882353, 0, 1,
-1.26431, -0.4917177, -2.317557, 1, 0.5921569, 0, 1,
-1.258186, 1.983704, -0.9735361, 1, 0.6, 0, 1,
-1.249034, -0.3436503, -1.129962, 1, 0.6078432, 0, 1,
-1.243711, -0.2262042, -2.100092, 1, 0.6117647, 0, 1,
-1.237221, -0.4611952, -1.630487, 1, 0.6196079, 0, 1,
-1.231645, -1.609879, -2.583595, 1, 0.6235294, 0, 1,
-1.230021, 0.1198624, 1.122953, 1, 0.6313726, 0, 1,
-1.229764, 0.52708, -0.07170285, 1, 0.6352941, 0, 1,
-1.223207, -0.9227258, -2.442977, 1, 0.6431373, 0, 1,
-1.214774, 0.2461846, -1.280645, 1, 0.6470588, 0, 1,
-1.211572, 0.2194172, -2.451498, 1, 0.654902, 0, 1,
-1.206066, -1.068465, -1.054977, 1, 0.6588235, 0, 1,
-1.203499, -0.3080128, -2.416134, 1, 0.6666667, 0, 1,
-1.202477, 1.85561, -1.973196, 1, 0.6705883, 0, 1,
-1.200981, -0.2833083, 0.02128354, 1, 0.6784314, 0, 1,
-1.199206, 0.4602547, -0.1840293, 1, 0.682353, 0, 1,
-1.180723, 2.161364, -0.156223, 1, 0.6901961, 0, 1,
-1.174333, 0.2547714, -4.845269, 1, 0.6941177, 0, 1,
-1.170097, 0.6982803, -0.7240157, 1, 0.7019608, 0, 1,
-1.162488, -1.235903, -3.170989, 1, 0.7098039, 0, 1,
-1.160622, -0.07336956, -1.879111, 1, 0.7137255, 0, 1,
-1.158913, 0.4978254, -1.502695, 1, 0.7215686, 0, 1,
-1.146277, 1.736269, -0.8518683, 1, 0.7254902, 0, 1,
-1.142353, -0.5394966, -2.563098, 1, 0.7333333, 0, 1,
-1.138187, 0.9256138, 0.3063646, 1, 0.7372549, 0, 1,
-1.133485, -1.546179, -2.342895, 1, 0.7450981, 0, 1,
-1.131812, -0.4313504, -3.814858, 1, 0.7490196, 0, 1,
-1.11352, -1.231346, -3.466714, 1, 0.7568628, 0, 1,
-1.109599, 0.3420202, -1.14956, 1, 0.7607843, 0, 1,
-1.106265, 0.77382, -0.7674165, 1, 0.7686275, 0, 1,
-1.105378, -0.8802524, -3.194645, 1, 0.772549, 0, 1,
-1.105241, -0.1956397, -2.76804, 1, 0.7803922, 0, 1,
-1.102085, 0.184518, -1.48281, 1, 0.7843137, 0, 1,
-1.101508, -0.1606357, -0.5854182, 1, 0.7921569, 0, 1,
-1.093902, -0.2635216, -3.431514, 1, 0.7960784, 0, 1,
-1.092815, -0.01815386, -0.2054307, 1, 0.8039216, 0, 1,
-1.087937, -1.334872, -1.505649, 1, 0.8117647, 0, 1,
-1.087768, -1.070484, -2.352103, 1, 0.8156863, 0, 1,
-1.083087, 0.9798124, -1.518323, 1, 0.8235294, 0, 1,
-1.081299, -0.5491434, -3.324395, 1, 0.827451, 0, 1,
-1.075187, -0.2292438, -1.673948, 1, 0.8352941, 0, 1,
-1.062969, -1.632487, -3.825917, 1, 0.8392157, 0, 1,
-1.062286, 0.1381572, -2.884423, 1, 0.8470588, 0, 1,
-1.05453, 0.8143184, -0.2031584, 1, 0.8509804, 0, 1,
-1.05296, 0.52805, 0.6609207, 1, 0.8588235, 0, 1,
-1.05275, 0.1514212, -1.427787, 1, 0.8627451, 0, 1,
-1.050445, 0.4922967, 0.5429216, 1, 0.8705882, 0, 1,
-1.043113, 2.034775, -2.226607, 1, 0.8745098, 0, 1,
-1.039427, -1.34329, -1.488724, 1, 0.8823529, 0, 1,
-1.038413, 0.5392902, -1.605588, 1, 0.8862745, 0, 1,
-1.034407, -0.5961376, -2.2474, 1, 0.8941177, 0, 1,
-1.033068, -2.391366, -2.840079, 1, 0.8980392, 0, 1,
-1.03239, 0.5488765, -0.8110406, 1, 0.9058824, 0, 1,
-1.03104, -1.219676, -2.571796, 1, 0.9137255, 0, 1,
-1.025088, -0.40958, -1.492803, 1, 0.9176471, 0, 1,
-1.024531, 1.195285, -1.189579, 1, 0.9254902, 0, 1,
-1.020354, 0.5693466, -1.610626, 1, 0.9294118, 0, 1,
-1.018328, -1.251184, -4.112227, 1, 0.9372549, 0, 1,
-1.01505, 0.1074057, -2.109501, 1, 0.9411765, 0, 1,
-0.9980817, 0.4674102, -1.109001, 1, 0.9490196, 0, 1,
-0.9868373, 0.8288838, -2.113529, 1, 0.9529412, 0, 1,
-0.9785166, 0.8577296, 0.7363961, 1, 0.9607843, 0, 1,
-0.9668338, 0.4350734, -2.558316, 1, 0.9647059, 0, 1,
-0.965682, 0.1233312, -2.309071, 1, 0.972549, 0, 1,
-0.9573686, 0.375112, -1.64215, 1, 0.9764706, 0, 1,
-0.9326711, 1.160098, -2.613722, 1, 0.9843137, 0, 1,
-0.9316126, -0.7783903, -2.821963, 1, 0.9882353, 0, 1,
-0.9273909, -1.306351, -0.9344776, 1, 0.9960784, 0, 1,
-0.9259358, 0.8245106, 1.895667, 0.9960784, 1, 0, 1,
-0.9183101, -1.3922, -2.263141, 0.9921569, 1, 0, 1,
-0.9150673, -0.968272, -2.30754, 0.9843137, 1, 0, 1,
-0.9123805, 0.1621028, -0.2570537, 0.9803922, 1, 0, 1,
-0.9063869, 1.056211, -1.455699, 0.972549, 1, 0, 1,
-0.904144, -0.4484506, -3.169516, 0.9686275, 1, 0, 1,
-0.9004972, 1.541485, -0.5072415, 0.9607843, 1, 0, 1,
-0.8983149, -0.5711524, -2.334766, 0.9568627, 1, 0, 1,
-0.8974121, 1.113706, -2.615349, 0.9490196, 1, 0, 1,
-0.8950876, -0.7696094, -2.328957, 0.945098, 1, 0, 1,
-0.8943669, 0.345815, -0.4847133, 0.9372549, 1, 0, 1,
-0.890538, -1.560123, -2.410422, 0.9333333, 1, 0, 1,
-0.8886126, 0.8766187, -0.3629929, 0.9254902, 1, 0, 1,
-0.8811691, -0.4650138, -2.187111, 0.9215686, 1, 0, 1,
-0.8785731, 0.859167, 0.6760748, 0.9137255, 1, 0, 1,
-0.8772013, 0.785219, -1.059793, 0.9098039, 1, 0, 1,
-0.8699933, 0.1063068, -1.943263, 0.9019608, 1, 0, 1,
-0.8699759, 0.5446471, -1.402008, 0.8941177, 1, 0, 1,
-0.8696634, 0.7321332, -0.8908013, 0.8901961, 1, 0, 1,
-0.8693478, -0.9815492, -2.669498, 0.8823529, 1, 0, 1,
-0.869069, 0.1920486, -1.300266, 0.8784314, 1, 0, 1,
-0.8678797, 0.2075066, -1.011665, 0.8705882, 1, 0, 1,
-0.8664333, -0.6516125, -1.074657, 0.8666667, 1, 0, 1,
-0.8645585, 0.04939624, -0.7132818, 0.8588235, 1, 0, 1,
-0.8527991, 1.517855, -0.2517106, 0.854902, 1, 0, 1,
-0.8503119, -0.3538913, -3.051181, 0.8470588, 1, 0, 1,
-0.8498343, -2.208232, -2.6039, 0.8431373, 1, 0, 1,
-0.8474385, -0.662147, -1.038283, 0.8352941, 1, 0, 1,
-0.8431352, 1.53973, 0.3796054, 0.8313726, 1, 0, 1,
-0.8401835, -0.17169, -2.212409, 0.8235294, 1, 0, 1,
-0.8387124, -1.897359, -2.65189, 0.8196079, 1, 0, 1,
-0.8327438, -0.6623407, -2.354239, 0.8117647, 1, 0, 1,
-0.8309932, 0.3552371, -2.76284, 0.8078431, 1, 0, 1,
-0.829195, -0.7817135, -0.3711759, 0.8, 1, 0, 1,
-0.8274654, -0.8775248, -1.409369, 0.7921569, 1, 0, 1,
-0.8244353, 1.01939, 0.2284653, 0.7882353, 1, 0, 1,
-0.8222868, 1.303955, 0.6528569, 0.7803922, 1, 0, 1,
-0.822244, 0.6081647, -3.19345, 0.7764706, 1, 0, 1,
-0.8184277, 0.7929844, -0.5003181, 0.7686275, 1, 0, 1,
-0.8156958, -1.791471, -0.7847795, 0.7647059, 1, 0, 1,
-0.8147659, -0.4895072, -1.919587, 0.7568628, 1, 0, 1,
-0.8125945, -1.529805, -3.394211, 0.7529412, 1, 0, 1,
-0.8114645, -0.688887, -1.805553, 0.7450981, 1, 0, 1,
-0.8081197, 0.2389972, -0.2481122, 0.7411765, 1, 0, 1,
-0.8079531, 0.5638441, -2.320894, 0.7333333, 1, 0, 1,
-0.8053519, 2.183828, -1.360734, 0.7294118, 1, 0, 1,
-0.8022992, -0.87491, -2.907966, 0.7215686, 1, 0, 1,
-0.8020014, 1.336443, -0.8303108, 0.7176471, 1, 0, 1,
-0.8007178, -0.1361846, -2.367168, 0.7098039, 1, 0, 1,
-0.8000036, -0.2552348, -1.798304, 0.7058824, 1, 0, 1,
-0.7990387, 0.2675344, -0.7424013, 0.6980392, 1, 0, 1,
-0.7989905, 1.205188, 0.3404802, 0.6901961, 1, 0, 1,
-0.7963967, 0.3257678, -2.720488, 0.6862745, 1, 0, 1,
-0.7930518, 0.9690046, -1.189699, 0.6784314, 1, 0, 1,
-0.7930275, 1.903294, -1.216833, 0.6745098, 1, 0, 1,
-0.7900938, 0.4440273, -0.4878545, 0.6666667, 1, 0, 1,
-0.7900236, -0.0009609947, -1.112086, 0.6627451, 1, 0, 1,
-0.7858443, 0.6289446, 0.05225752, 0.654902, 1, 0, 1,
-0.7820616, 0.179747, 0.1003113, 0.6509804, 1, 0, 1,
-0.7716321, -0.5280091, -0.9038121, 0.6431373, 1, 0, 1,
-0.7709174, 0.540234, -1.114186, 0.6392157, 1, 0, 1,
-0.7640604, 0.2515999, 0.5731338, 0.6313726, 1, 0, 1,
-0.7562622, -0.5472223, -1.579976, 0.627451, 1, 0, 1,
-0.7552798, 0.1252074, -0.9780588, 0.6196079, 1, 0, 1,
-0.7514221, 0.7474089, -0.4142954, 0.6156863, 1, 0, 1,
-0.7514132, 1.241512, -1.230116, 0.6078432, 1, 0, 1,
-0.7367403, -0.3269225, -1.758975, 0.6039216, 1, 0, 1,
-0.7316119, 0.6974139, 1.052708, 0.5960785, 1, 0, 1,
-0.7302856, 0.02712001, -0.5516586, 0.5882353, 1, 0, 1,
-0.7266054, -2.297055, -1.887134, 0.5843138, 1, 0, 1,
-0.7249202, -0.8381376, -0.6972817, 0.5764706, 1, 0, 1,
-0.7167865, 1.11761, -2.208258, 0.572549, 1, 0, 1,
-0.7139412, 0.1465025, -2.355411, 0.5647059, 1, 0, 1,
-0.7129639, 0.4970017, -0.9368566, 0.5607843, 1, 0, 1,
-0.7093937, -1.235034, -2.230917, 0.5529412, 1, 0, 1,
-0.7043591, 0.9127102, -0.4975391, 0.5490196, 1, 0, 1,
-0.6997778, -0.1985234, -1.796516, 0.5411765, 1, 0, 1,
-0.6940897, 1.658407, -0.03788846, 0.5372549, 1, 0, 1,
-0.6912802, 1.089159, -1.673765, 0.5294118, 1, 0, 1,
-0.6895734, -0.6960229, -2.576124, 0.5254902, 1, 0, 1,
-0.6862566, -1.606721, -1.129693, 0.5176471, 1, 0, 1,
-0.6849167, -1.601112, -3.409199, 0.5137255, 1, 0, 1,
-0.6823186, -0.9907097, -2.148437, 0.5058824, 1, 0, 1,
-0.6798864, -1.138335, -2.659723, 0.5019608, 1, 0, 1,
-0.6765136, -1.30145, -3.672708, 0.4941176, 1, 0, 1,
-0.6732048, -1.33481, -3.003136, 0.4862745, 1, 0, 1,
-0.6680561, 1.586053, -1.68183, 0.4823529, 1, 0, 1,
-0.6600937, 0.6685202, -0.5358791, 0.4745098, 1, 0, 1,
-0.6523014, 0.9781577, 0.3962993, 0.4705882, 1, 0, 1,
-0.6457067, -0.6624851, -2.919114, 0.4627451, 1, 0, 1,
-0.642799, 1.806118, 0.52288, 0.4588235, 1, 0, 1,
-0.6419318, 0.2485045, -2.024334, 0.4509804, 1, 0, 1,
-0.6402685, 1.01071, -0.4520406, 0.4470588, 1, 0, 1,
-0.6395475, 0.5087175, -1.850878, 0.4392157, 1, 0, 1,
-0.6393185, 0.767451, -0.5655432, 0.4352941, 1, 0, 1,
-0.6385971, 0.56233, -1.753528, 0.427451, 1, 0, 1,
-0.6372274, -1.763744, -1.324568, 0.4235294, 1, 0, 1,
-0.6356062, -0.485524, -1.918935, 0.4156863, 1, 0, 1,
-0.6305647, -1.486145, -3.335727, 0.4117647, 1, 0, 1,
-0.6298967, -0.08116695, -0.9760379, 0.4039216, 1, 0, 1,
-0.6273655, 0.2324765, -0.06466672, 0.3960784, 1, 0, 1,
-0.6246367, 1.04915, 0.07091162, 0.3921569, 1, 0, 1,
-0.6241733, -0.9454584, -1.70828, 0.3843137, 1, 0, 1,
-0.6222763, -0.01173764, -2.194008, 0.3803922, 1, 0, 1,
-0.6210672, -1.203677, -2.586841, 0.372549, 1, 0, 1,
-0.618311, 0.5074106, -1.053014, 0.3686275, 1, 0, 1,
-0.614694, -0.9602735, -2.535793, 0.3607843, 1, 0, 1,
-0.6144888, -0.1290942, -2.995546, 0.3568628, 1, 0, 1,
-0.6050627, -0.583833, -3.658771, 0.3490196, 1, 0, 1,
-0.6039925, -1.246816, -2.002914, 0.345098, 1, 0, 1,
-0.6017185, -0.6704366, -3.223162, 0.3372549, 1, 0, 1,
-0.600166, 0.589789, -0.815181, 0.3333333, 1, 0, 1,
-0.5990117, 0.69682, -1.29906, 0.3254902, 1, 0, 1,
-0.5946829, 0.2045893, -1.060127, 0.3215686, 1, 0, 1,
-0.5926042, -0.4292969, -2.110435, 0.3137255, 1, 0, 1,
-0.5869969, 0.8371307, -0.8090186, 0.3098039, 1, 0, 1,
-0.5801791, -1.339673, -2.17528, 0.3019608, 1, 0, 1,
-0.5784945, -0.2161737, -1.808691, 0.2941177, 1, 0, 1,
-0.578043, 0.7715529, -1.12095, 0.2901961, 1, 0, 1,
-0.5770805, 1.750892, -1.408288, 0.282353, 1, 0, 1,
-0.5732622, 1.786716, -0.4374169, 0.2784314, 1, 0, 1,
-0.5709015, -0.2943662, -1.503124, 0.2705882, 1, 0, 1,
-0.5682845, -0.4661168, -2.058415, 0.2666667, 1, 0, 1,
-0.5609856, -1.264075, -4.603078, 0.2588235, 1, 0, 1,
-0.5579609, 1.000975, -0.918672, 0.254902, 1, 0, 1,
-0.5552146, -1.218421, -2.835259, 0.2470588, 1, 0, 1,
-0.5548627, 0.6032544, -2.028491, 0.2431373, 1, 0, 1,
-0.5503508, -0.07709148, -0.8863722, 0.2352941, 1, 0, 1,
-0.548928, 1.867233, -0.5050228, 0.2313726, 1, 0, 1,
-0.5416507, 0.1502603, 0.2263189, 0.2235294, 1, 0, 1,
-0.5408802, -0.1183977, -3.861002, 0.2196078, 1, 0, 1,
-0.5373634, -0.05284041, -1.085768, 0.2117647, 1, 0, 1,
-0.5342947, -0.6982521, -1.920633, 0.2078431, 1, 0, 1,
-0.5319727, 1.120666, 0.2202975, 0.2, 1, 0, 1,
-0.5276145, -2.746144, -3.012419, 0.1921569, 1, 0, 1,
-0.5253806, 0.1065031, -3.600756, 0.1882353, 1, 0, 1,
-0.5189511, 0.1483305, 0.7553558, 0.1803922, 1, 0, 1,
-0.5186394, -0.2427538, -0.3982242, 0.1764706, 1, 0, 1,
-0.5138032, -0.3710255, -2.498119, 0.1686275, 1, 0, 1,
-0.4986843, -2.323945, -2.440293, 0.1647059, 1, 0, 1,
-0.4892346, -0.6384526, -2.812546, 0.1568628, 1, 0, 1,
-0.4862177, 0.895418, -0.4214031, 0.1529412, 1, 0, 1,
-0.4845459, -0.7170388, -3.291553, 0.145098, 1, 0, 1,
-0.4827376, 0.7123182, -1.825276, 0.1411765, 1, 0, 1,
-0.4785791, 1.142467, -1.318851, 0.1333333, 1, 0, 1,
-0.4765924, 0.03354318, -1.141104, 0.1294118, 1, 0, 1,
-0.4755164, 1.7802, -0.3142669, 0.1215686, 1, 0, 1,
-0.4746019, 0.3581833, -0.9533018, 0.1176471, 1, 0, 1,
-0.4743209, -0.6055925, -2.878428, 0.1098039, 1, 0, 1,
-0.4641728, 0.4179007, -0.9577146, 0.1058824, 1, 0, 1,
-0.4628949, -0.2711249, -1.31484, 0.09803922, 1, 0, 1,
-0.4610448, 1.139824, -0.213918, 0.09019608, 1, 0, 1,
-0.4579005, -1.329749, -4.01626, 0.08627451, 1, 0, 1,
-0.4533488, 1.17702, -0.3326378, 0.07843138, 1, 0, 1,
-0.4528038, -0.3749301, -2.624844, 0.07450981, 1, 0, 1,
-0.4466204, -0.9256452, -4.580276, 0.06666667, 1, 0, 1,
-0.446399, 0.3375922, -0.6109981, 0.0627451, 1, 0, 1,
-0.442281, -1.903136, -4.799778, 0.05490196, 1, 0, 1,
-0.4415776, -0.4105068, -1.971872, 0.05098039, 1, 0, 1,
-0.4407164, -0.7056888, -2.22852, 0.04313726, 1, 0, 1,
-0.4400989, 0.3569386, -0.7769178, 0.03921569, 1, 0, 1,
-0.4386526, -0.2192703, -2.355651, 0.03137255, 1, 0, 1,
-0.4385141, -1.276474, -4.295347, 0.02745098, 1, 0, 1,
-0.4368363, -0.3085371, -3.093412, 0.01960784, 1, 0, 1,
-0.4354204, -1.488968, -1.52027, 0.01568628, 1, 0, 1,
-0.4336419, 1.401049, -0.4951423, 0.007843138, 1, 0, 1,
-0.4295187, 1.423181, -0.426379, 0.003921569, 1, 0, 1,
-0.4294038, 0.4144409, -1.327002, 0, 1, 0.003921569, 1,
-0.4283864, 1.024151, 0.400116, 0, 1, 0.01176471, 1,
-0.4252645, -0.7538275, -3.367779, 0, 1, 0.01568628, 1,
-0.421846, -2.072874, -1.834153, 0, 1, 0.02352941, 1,
-0.4216822, -0.1258551, -2.107961, 0, 1, 0.02745098, 1,
-0.4200034, -1.285614, -1.481567, 0, 1, 0.03529412, 1,
-0.4171721, 1.676078, -1.095816, 0, 1, 0.03921569, 1,
-0.416274, -0.8342166, -3.464983, 0, 1, 0.04705882, 1,
-0.4132384, 1.474624, -1.676417, 0, 1, 0.05098039, 1,
-0.4103255, 0.6149793, -0.5718191, 0, 1, 0.05882353, 1,
-0.4081972, -0.4257426, -1.396074, 0, 1, 0.0627451, 1,
-0.4055167, 1.76239, -0.7238771, 0, 1, 0.07058824, 1,
-0.4046955, 0.8287895, -0.3198875, 0, 1, 0.07450981, 1,
-0.4044113, -0.09624638, -1.535801, 0, 1, 0.08235294, 1,
-0.4036568, -0.6406082, -3.279359, 0, 1, 0.08627451, 1,
-0.4009234, -1.332763, -2.160991, 0, 1, 0.09411765, 1,
-0.4001391, -1.128935, -3.108163, 0, 1, 0.1019608, 1,
-0.3989379, -0.4586334, 0.8050994, 0, 1, 0.1058824, 1,
-0.3963712, 1.618415, -2.042557, 0, 1, 0.1137255, 1,
-0.3901176, -2.679495, -1.502789, 0, 1, 0.1176471, 1,
-0.3864284, 2.077223, -0.5180674, 0, 1, 0.1254902, 1,
-0.3793218, 0.9319041, -1.302738, 0, 1, 0.1294118, 1,
-0.3776509, 1.140974, 0.6068707, 0, 1, 0.1372549, 1,
-0.3773673, 0.2924248, 0.4187443, 0, 1, 0.1411765, 1,
-0.3767075, 1.201296, 0.424153, 0, 1, 0.1490196, 1,
-0.3749602, -0.4079558, -1.377979, 0, 1, 0.1529412, 1,
-0.3737561, 0.625936, 0.04523126, 0, 1, 0.1607843, 1,
-0.3721586, -0.00911878, 0.06060479, 0, 1, 0.1647059, 1,
-0.3598977, 1.178672, 0.5256009, 0, 1, 0.172549, 1,
-0.3559735, -1.540043, -3.119374, 0, 1, 0.1764706, 1,
-0.3517666, 0.0931642, 0.02528619, 0, 1, 0.1843137, 1,
-0.3504183, -0.3306436, -2.777868, 0, 1, 0.1882353, 1,
-0.3489876, 1.702287, -0.02685921, 0, 1, 0.1960784, 1,
-0.3424631, 0.5295946, -0.180142, 0, 1, 0.2039216, 1,
-0.3418277, 0.5993306, 0.6706761, 0, 1, 0.2078431, 1,
-0.341767, -2.063169, -3.113638, 0, 1, 0.2156863, 1,
-0.3363824, 0.2197639, -1.581572, 0, 1, 0.2196078, 1,
-0.3344581, -1.31863, -1.415387, 0, 1, 0.227451, 1,
-0.3322187, -0.02438443, -0.3345369, 0, 1, 0.2313726, 1,
-0.3309607, 1.221861, -0.2266901, 0, 1, 0.2392157, 1,
-0.3305376, 0.6205133, 0.5962378, 0, 1, 0.2431373, 1,
-0.3183462, 0.1272883, -2.587971, 0, 1, 0.2509804, 1,
-0.3152401, 0.1038514, -2.177385, 0, 1, 0.254902, 1,
-0.3105728, -0.4920511, -3.888691, 0, 1, 0.2627451, 1,
-0.3011436, -0.6085552, -3.464598, 0, 1, 0.2666667, 1,
-0.2997183, -0.08662228, -2.457846, 0, 1, 0.2745098, 1,
-0.2976968, -0.8243895, -4.017627, 0, 1, 0.2784314, 1,
-0.2905418, 0.597716, -1.022349, 0, 1, 0.2862745, 1,
-0.2905234, -0.3011107, -2.452272, 0, 1, 0.2901961, 1,
-0.2886323, -1.040694, -1.322543, 0, 1, 0.2980392, 1,
-0.2876462, -0.9418007, -2.026754, 0, 1, 0.3058824, 1,
-0.2860259, -0.8242626, -2.239543, 0, 1, 0.3098039, 1,
-0.2846604, -0.3383116, -2.668908, 0, 1, 0.3176471, 1,
-0.2842562, 1.554575, 0.09585136, 0, 1, 0.3215686, 1,
-0.2836728, 1.832445, 1.092306, 0, 1, 0.3294118, 1,
-0.2821489, -0.1903525, -2.781751, 0, 1, 0.3333333, 1,
-0.2771156, 0.3506622, -0.3029813, 0, 1, 0.3411765, 1,
-0.2721494, -0.4049087, -3.189985, 0, 1, 0.345098, 1,
-0.2717055, 1.42625, -0.3648973, 0, 1, 0.3529412, 1,
-0.2683316, -0.7277163, -1.768981, 0, 1, 0.3568628, 1,
-0.2671226, 1.777597, 0.9930465, 0, 1, 0.3647059, 1,
-0.2654745, 1.208499, -1.548884, 0, 1, 0.3686275, 1,
-0.2587637, -0.7021781, -2.771578, 0, 1, 0.3764706, 1,
-0.2554769, 1.783569, 0.3476356, 0, 1, 0.3803922, 1,
-0.2516454, -0.264679, -2.104295, 0, 1, 0.3882353, 1,
-0.2503311, 0.4728991, -1.429291, 0, 1, 0.3921569, 1,
-0.2473325, 0.3169222, -0.03466631, 0, 1, 0.4, 1,
-0.24637, 0.5882496, 0.1414543, 0, 1, 0.4078431, 1,
-0.2461861, -0.4674253, -1.511665, 0, 1, 0.4117647, 1,
-0.243483, 1.565078, -1.003319, 0, 1, 0.4196078, 1,
-0.2394179, 0.3542448, 1.747738, 0, 1, 0.4235294, 1,
-0.2379941, 0.9413353, 0.701396, 0, 1, 0.4313726, 1,
-0.232553, -0.1940487, -1.815955, 0, 1, 0.4352941, 1,
-0.2321582, -0.9019543, -2.634667, 0, 1, 0.4431373, 1,
-0.2297985, -0.4816887, -2.391465, 0, 1, 0.4470588, 1,
-0.2288998, 0.6892523, -0.5489768, 0, 1, 0.454902, 1,
-0.2273579, -0.2488934, -2.520384, 0, 1, 0.4588235, 1,
-0.2266753, -1.489082, -2.999256, 0, 1, 0.4666667, 1,
-0.2227626, -0.2936864, -3.468302, 0, 1, 0.4705882, 1,
-0.222331, -1.707434, -3.937602, 0, 1, 0.4784314, 1,
-0.2221597, 0.0004092069, -2.599238, 0, 1, 0.4823529, 1,
-0.2210399, 0.8743478, -0.4513494, 0, 1, 0.4901961, 1,
-0.2195477, 1.862703, -0.5563623, 0, 1, 0.4941176, 1,
-0.2159125, 0.2053735, -0.347474, 0, 1, 0.5019608, 1,
-0.2144026, 0.9890909, -0.1256028, 0, 1, 0.509804, 1,
-0.2134899, -0.0784163, -1.733501, 0, 1, 0.5137255, 1,
-0.213486, -0.3142884, -2.736812, 0, 1, 0.5215687, 1,
-0.2079353, -1.446276, -3.003088, 0, 1, 0.5254902, 1,
-0.2078407, 2.527232, 1.11167, 0, 1, 0.5333334, 1,
-0.2066923, 1.858657, 1.228127, 0, 1, 0.5372549, 1,
-0.2060626, 0.5686629, 0.7794498, 0, 1, 0.5450981, 1,
-0.2040469, -0.4249514, -4.980255, 0, 1, 0.5490196, 1,
-0.2002527, -1.189439, -1.527082, 0, 1, 0.5568628, 1,
-0.1942746, -0.06112937, -1.376932, 0, 1, 0.5607843, 1,
-0.189229, -0.6594038, -4.31542, 0, 1, 0.5686275, 1,
-0.1875574, -1.583503, -3.506636, 0, 1, 0.572549, 1,
-0.1854883, 0.930755, 0.1318154, 0, 1, 0.5803922, 1,
-0.1844744, 0.4464489, -0.4690938, 0, 1, 0.5843138, 1,
-0.1828989, -0.4550246, -4.646977, 0, 1, 0.5921569, 1,
-0.1821305, 2.832353, -1.014864, 0, 1, 0.5960785, 1,
-0.1789551, 1.482011, -2.559963, 0, 1, 0.6039216, 1,
-0.1760033, 0.6454418, -1.431196, 0, 1, 0.6117647, 1,
-0.1734965, 0.8029601, -1.046121, 0, 1, 0.6156863, 1,
-0.1732851, 0.4906969, -1.826742, 0, 1, 0.6235294, 1,
-0.1730131, 0.6393831, -0.03752856, 0, 1, 0.627451, 1,
-0.1710273, -0.5413232, -4.139637, 0, 1, 0.6352941, 1,
-0.1706526, -0.2989149, -4.305824, 0, 1, 0.6392157, 1,
-0.1699382, -0.7628042, -2.486201, 0, 1, 0.6470588, 1,
-0.1676394, 0.04708453, -1.123437, 0, 1, 0.6509804, 1,
-0.166947, -1.234806, -3.900064, 0, 1, 0.6588235, 1,
-0.1654758, -0.6834642, -2.731242, 0, 1, 0.6627451, 1,
-0.1653242, 0.4698799, -1.670908, 0, 1, 0.6705883, 1,
-0.165242, 2.154234, -0.5505927, 0, 1, 0.6745098, 1,
-0.1642751, -0.9786329, -3.313045, 0, 1, 0.682353, 1,
-0.164136, 1.054317, 1.216162, 0, 1, 0.6862745, 1,
-0.163933, -2.595782, -2.615664, 0, 1, 0.6941177, 1,
-0.1611225, -0.3824604, -2.937058, 0, 1, 0.7019608, 1,
-0.1558326, -0.6525867, -2.600803, 0, 1, 0.7058824, 1,
-0.1503814, 0.7407637, 0.2058061, 0, 1, 0.7137255, 1,
-0.1480186, -0.3364219, -2.834049, 0, 1, 0.7176471, 1,
-0.1434719, 0.0526871, -1.322393, 0, 1, 0.7254902, 1,
-0.1371906, 1.467706, 0.315799, 0, 1, 0.7294118, 1,
-0.1336237, -0.7515832, -2.450395, 0, 1, 0.7372549, 1,
-0.1312485, -1.922725, -2.691119, 0, 1, 0.7411765, 1,
-0.126966, 0.7138044, 1.155639, 0, 1, 0.7490196, 1,
-0.1250035, 1.691485, 0.7314607, 0, 1, 0.7529412, 1,
-0.1235724, -0.4000832, -0.8523953, 0, 1, 0.7607843, 1,
-0.1227873, 2.060472, 0.1572067, 0, 1, 0.7647059, 1,
-0.1226256, -0.299991, -1.683497, 0, 1, 0.772549, 1,
-0.1216705, 0.9371812, -2.160769, 0, 1, 0.7764706, 1,
-0.1214421, 1.694276, -1.346514, 0, 1, 0.7843137, 1,
-0.1194562, 0.522504, -0.6972552, 0, 1, 0.7882353, 1,
-0.1177736, 0.6749191, -2.220824, 0, 1, 0.7960784, 1,
-0.1166446, 0.03327248, -0.1186966, 0, 1, 0.8039216, 1,
-0.1114787, 0.9079744, 1.170397, 0, 1, 0.8078431, 1,
-0.1076177, 0.7660832, 0.8266746, 0, 1, 0.8156863, 1,
-0.1073855, 0.1376428, -0.362904, 0, 1, 0.8196079, 1,
-0.1055747, -0.6230128, -3.470604, 0, 1, 0.827451, 1,
-0.1054162, -1.018305, -4.000155, 0, 1, 0.8313726, 1,
-0.104385, -1.69822, -3.521534, 0, 1, 0.8392157, 1,
-0.1000737, 2.173389, -0.8487256, 0, 1, 0.8431373, 1,
-0.09967411, 1.344705, -0.9111008, 0, 1, 0.8509804, 1,
-0.09614539, -0.7027631, -2.937466, 0, 1, 0.854902, 1,
-0.09403768, 1.153794, 0.3145694, 0, 1, 0.8627451, 1,
-0.09272461, 0.2075558, 0.2357967, 0, 1, 0.8666667, 1,
-0.0851797, 0.7432234, -0.3586637, 0, 1, 0.8745098, 1,
-0.08414948, 2.355099, 0.9915193, 0, 1, 0.8784314, 1,
-0.08357166, -1.168182, -4.750644, 0, 1, 0.8862745, 1,
-0.07543278, -0.1412996, -1.792688, 0, 1, 0.8901961, 1,
-0.07106449, -1.077628, -2.202387, 0, 1, 0.8980392, 1,
-0.0669675, 0.03271687, 0.3537025, 0, 1, 0.9058824, 1,
-0.06269046, -0.9667687, -2.846527, 0, 1, 0.9098039, 1,
-0.06116195, 0.7686646, -0.6512921, 0, 1, 0.9176471, 1,
-0.05877065, 0.2405708, 1.10442, 0, 1, 0.9215686, 1,
-0.05845441, -0.1116293, -2.790613, 0, 1, 0.9294118, 1,
-0.0522552, -0.6074931, -2.628963, 0, 1, 0.9333333, 1,
-0.05221919, 1.559502, 0.3356335, 0, 1, 0.9411765, 1,
-0.05011318, 0.2871214, -0.08404463, 0, 1, 0.945098, 1,
-0.0498559, 0.1648448, 0.422496, 0, 1, 0.9529412, 1,
-0.04480317, 0.4322668, -1.898668, 0, 1, 0.9568627, 1,
-0.04033831, -1.152791, -1.803805, 0, 1, 0.9647059, 1,
-0.03305526, -1.208149, -1.199718, 0, 1, 0.9686275, 1,
-0.0307354, -1.248891, -4.06525, 0, 1, 0.9764706, 1,
-0.02945217, 0.6634246, -0.8534707, 0, 1, 0.9803922, 1,
-0.02057009, 1.327957, 0.2907426, 0, 1, 0.9882353, 1,
-0.01585162, 3.239326, -1.654262, 0, 1, 0.9921569, 1,
-0.0154224, 0.3829726, -0.2142943, 0, 1, 1, 1,
-0.01517953, -0.7317181, -4.386813, 0, 0.9921569, 1, 1,
-0.01474867, -0.2127118, -2.835965, 0, 0.9882353, 1, 1,
-0.01443579, -0.8351808, -2.579515, 0, 0.9803922, 1, 1,
-0.01385507, 1.259963, -0.3649178, 0, 0.9764706, 1, 1,
-0.008795959, -1.423057, -5.112162, 0, 0.9686275, 1, 1,
-0.007607668, -0.09543773, -3.312337, 0, 0.9647059, 1, 1,
-0.006153973, 0.4820461, -0.4717852, 0, 0.9568627, 1, 1,
-0.005605898, -2.486696, -3.430247, 0, 0.9529412, 1, 1,
-0.005122953, 0.7828789, -1.414371, 0, 0.945098, 1, 1,
-0.001586741, -0.3960868, -3.559835, 0, 0.9411765, 1, 1,
-0.0004746485, 1.280521, 1.276871, 0, 0.9333333, 1, 1,
0.001626228, 0.6736929, 1.766468, 0, 0.9294118, 1, 1,
0.004300738, 0.6615993, -1.210389, 0, 0.9215686, 1, 1,
0.004774236, -0.513557, 5.535696, 0, 0.9176471, 1, 1,
0.007459952, 0.5380364, -1.834643, 0, 0.9098039, 1, 1,
0.0163782, -0.202044, 4.227388, 0, 0.9058824, 1, 1,
0.02298818, -0.7217236, 1.808601, 0, 0.8980392, 1, 1,
0.02380338, -1.850925, 4.185407, 0, 0.8901961, 1, 1,
0.02643455, 1.991515, -0.2279979, 0, 0.8862745, 1, 1,
0.02702328, 0.7621472, -0.1336502, 0, 0.8784314, 1, 1,
0.03851722, -0.5061244, 0.9702537, 0, 0.8745098, 1, 1,
0.04045609, -0.1900325, 0.5667924, 0, 0.8666667, 1, 1,
0.04286096, -1.304206, 2.843787, 0, 0.8627451, 1, 1,
0.04729378, -1.358961, 2.606889, 0, 0.854902, 1, 1,
0.0489755, 0.910153, 1.076827, 0, 0.8509804, 1, 1,
0.05183924, -1.142979, 3.411281, 0, 0.8431373, 1, 1,
0.05198159, 1.675151, 0.2023667, 0, 0.8392157, 1, 1,
0.0525715, -1.597875, 4.205165, 0, 0.8313726, 1, 1,
0.05316681, -0.7153391, 3.298029, 0, 0.827451, 1, 1,
0.05852792, -0.2948413, 3.495887, 0, 0.8196079, 1, 1,
0.05870418, 1.243733, 0.7093444, 0, 0.8156863, 1, 1,
0.06558181, 0.1059422, -1.540828, 0, 0.8078431, 1, 1,
0.06867589, 0.6040221, 0.4832994, 0, 0.8039216, 1, 1,
0.07709444, -0.591512, 3.291253, 0, 0.7960784, 1, 1,
0.07797895, -0.06588026, 2.945239, 0, 0.7882353, 1, 1,
0.07995752, -0.2641634, 2.666758, 0, 0.7843137, 1, 1,
0.08344478, -0.3775785, 2.681157, 0, 0.7764706, 1, 1,
0.085119, -1.079689, 3.335382, 0, 0.772549, 1, 1,
0.08567322, -0.7568002, 3.445772, 0, 0.7647059, 1, 1,
0.09053588, -0.1136197, 1.157379, 0, 0.7607843, 1, 1,
0.1072413, -0.4954327, 3.166112, 0, 0.7529412, 1, 1,
0.1090388, 0.5635799, 1.298653, 0, 0.7490196, 1, 1,
0.1145353, -0.0318239, 2.775158, 0, 0.7411765, 1, 1,
0.1163298, 0.8433809, 0.1270103, 0, 0.7372549, 1, 1,
0.1185791, 0.6882914, 1.126687, 0, 0.7294118, 1, 1,
0.1185814, 0.876315, 1.204576, 0, 0.7254902, 1, 1,
0.1222578, 1.333374, 1.621262, 0, 0.7176471, 1, 1,
0.1238634, -1.756891, 2.654323, 0, 0.7137255, 1, 1,
0.1256214, 0.3983445, 0.3139901, 0, 0.7058824, 1, 1,
0.1278087, 1.443203, -1.573297, 0, 0.6980392, 1, 1,
0.1282417, -0.1143603, 0.7933054, 0, 0.6941177, 1, 1,
0.1318142, -1.157206, 2.46343, 0, 0.6862745, 1, 1,
0.1330414, -1.333437, 0.8200435, 0, 0.682353, 1, 1,
0.1376302, -1.196135, 4.549111, 0, 0.6745098, 1, 1,
0.1378255, 0.3803894, 0.4558038, 0, 0.6705883, 1, 1,
0.1381809, 0.5996666, 0.3706294, 0, 0.6627451, 1, 1,
0.1432275, 1.189003, 0.5330917, 0, 0.6588235, 1, 1,
0.1449594, 0.146782, -1.381066, 0, 0.6509804, 1, 1,
0.1458811, -0.1597552, 3.088084, 0, 0.6470588, 1, 1,
0.1460618, -0.09136536, 0.621278, 0, 0.6392157, 1, 1,
0.1476246, 0.1572884, 0.5641083, 0, 0.6352941, 1, 1,
0.156924, -0.3925395, 1.997552, 0, 0.627451, 1, 1,
0.1590376, -1.445909, 2.878659, 0, 0.6235294, 1, 1,
0.1598372, 0.4087761, -0.05461807, 0, 0.6156863, 1, 1,
0.1627803, -2.518682, 2.401178, 0, 0.6117647, 1, 1,
0.1638685, 0.9226796, -0.3847488, 0, 0.6039216, 1, 1,
0.1644521, 1.647587, 1.844683, 0, 0.5960785, 1, 1,
0.164622, -0.9267521, 1.010304, 0, 0.5921569, 1, 1,
0.1690056, 0.6018078, -0.7695462, 0, 0.5843138, 1, 1,
0.1696569, 0.3159367, -0.8231685, 0, 0.5803922, 1, 1,
0.1715981, 1.382377, 0.6792727, 0, 0.572549, 1, 1,
0.1782567, -0.2076785, 5.586044, 0, 0.5686275, 1, 1,
0.1837947, -0.6036167, 4.133439, 0, 0.5607843, 1, 1,
0.1867323, -0.4145122, 2.683301, 0, 0.5568628, 1, 1,
0.1907651, 1.223391, -0.4597565, 0, 0.5490196, 1, 1,
0.1946625, 2.643198, 0.4806641, 0, 0.5450981, 1, 1,
0.1955784, 1.265034, -0.4382023, 0, 0.5372549, 1, 1,
0.1978257, -1.639475, 2.96591, 0, 0.5333334, 1, 1,
0.2028619, 0.5371663, 1.24879, 0, 0.5254902, 1, 1,
0.2045961, 0.6748957, 1.024973, 0, 0.5215687, 1, 1,
0.2058887, -0.5998276, 4.307639, 0, 0.5137255, 1, 1,
0.2061035, 1.960184, -1.546593, 0, 0.509804, 1, 1,
0.2072053, 0.4738217, 0.5205584, 0, 0.5019608, 1, 1,
0.2104681, -0.7393808, 4.322356, 0, 0.4941176, 1, 1,
0.2135668, 0.2348917, -0.1680996, 0, 0.4901961, 1, 1,
0.2171499, 0.5685464, -0.4165401, 0, 0.4823529, 1, 1,
0.2232419, -0.0178814, 1.774637, 0, 0.4784314, 1, 1,
0.2251136, -0.09879228, 3.690974, 0, 0.4705882, 1, 1,
0.2269194, 0.2972369, 0.6792189, 0, 0.4666667, 1, 1,
0.2315558, -1.882194, 2.094146, 0, 0.4588235, 1, 1,
0.2319601, 0.3263925, 0.3924358, 0, 0.454902, 1, 1,
0.2328544, 0.5198846, 0.04904938, 0, 0.4470588, 1, 1,
0.2343277, -0.5289534, 2.792057, 0, 0.4431373, 1, 1,
0.2390339, 1.285782, 0.2096692, 0, 0.4352941, 1, 1,
0.2399141, -0.8718333, 3.402734, 0, 0.4313726, 1, 1,
0.2410335, -0.7730205, 1.845695, 0, 0.4235294, 1, 1,
0.2421014, -0.4577101, 0.7678972, 0, 0.4196078, 1, 1,
0.2440006, 0.3419364, 0.1495956, 0, 0.4117647, 1, 1,
0.2473183, 0.460243, 1.018627, 0, 0.4078431, 1, 1,
0.2484203, -1.711624, 3.835669, 0, 0.4, 1, 1,
0.24853, 2.03451, 0.2831822, 0, 0.3921569, 1, 1,
0.2489304, -0.2542107, 1.049383, 0, 0.3882353, 1, 1,
0.2498819, 0.8837177, 1.499125, 0, 0.3803922, 1, 1,
0.2544074, 0.4326804, 0.2086563, 0, 0.3764706, 1, 1,
0.2547357, -0.5696893, 1.568118, 0, 0.3686275, 1, 1,
0.2551311, -0.6163061, 2.085976, 0, 0.3647059, 1, 1,
0.2552988, 1.459053, -0.3604244, 0, 0.3568628, 1, 1,
0.2665457, 0.3440939, 0.7959171, 0, 0.3529412, 1, 1,
0.2741575, -1.117761, 4.263409, 0, 0.345098, 1, 1,
0.2906311, 0.4529452, 1.30099, 0, 0.3411765, 1, 1,
0.2921756, 0.5833102, -0.276064, 0, 0.3333333, 1, 1,
0.2932202, -1.063565, 1.681129, 0, 0.3294118, 1, 1,
0.2994526, -0.7131879, 3.904275, 0, 0.3215686, 1, 1,
0.2996357, 1.641833, 0.8258006, 0, 0.3176471, 1, 1,
0.3058912, 1.657258, -0.2237065, 0, 0.3098039, 1, 1,
0.3088236, -1.014657, 2.494361, 0, 0.3058824, 1, 1,
0.3091663, -1.182515, 2.881286, 0, 0.2980392, 1, 1,
0.3100709, 0.4091097, 0.77377, 0, 0.2901961, 1, 1,
0.3113937, 1.53498, -0.08266529, 0, 0.2862745, 1, 1,
0.313666, 0.05612072, 0.9387403, 0, 0.2784314, 1, 1,
0.3143866, -1.005195, 1.723696, 0, 0.2745098, 1, 1,
0.3187437, 0.4144399, 1.416313, 0, 0.2666667, 1, 1,
0.3198324, 2.275621, -0.09660793, 0, 0.2627451, 1, 1,
0.3228165, 0.308768, 0.66381, 0, 0.254902, 1, 1,
0.3235045, -2.169134, 3.260818, 0, 0.2509804, 1, 1,
0.3235766, 0.1186677, 0.9782928, 0, 0.2431373, 1, 1,
0.325597, -0.7435273, 2.383725, 0, 0.2392157, 1, 1,
0.328307, -1.184072, 2.906304, 0, 0.2313726, 1, 1,
0.3293252, -2.218247, 3.552417, 0, 0.227451, 1, 1,
0.3311161, 2.370023, 0.2987953, 0, 0.2196078, 1, 1,
0.3346632, 0.1364118, 1.919926, 0, 0.2156863, 1, 1,
0.3360066, -0.3068118, 2.719051, 0, 0.2078431, 1, 1,
0.336316, 1.330945, 0.9835985, 0, 0.2039216, 1, 1,
0.3365844, 1.869028, 0.773582, 0, 0.1960784, 1, 1,
0.3372277, 0.9998296, 1.265342, 0, 0.1882353, 1, 1,
0.3429953, 0.7830709, -0.8444822, 0, 0.1843137, 1, 1,
0.343362, 1.661102, -1.453823, 0, 0.1764706, 1, 1,
0.3443474, -0.6388111, 2.508655, 0, 0.172549, 1, 1,
0.3449659, 1.253944, -1.212331, 0, 0.1647059, 1, 1,
0.3470719, -0.6196571, 2.78253, 0, 0.1607843, 1, 1,
0.3476714, -0.786891, 2.369952, 0, 0.1529412, 1, 1,
0.3479294, 0.382034, 0.8957849, 0, 0.1490196, 1, 1,
0.3518398, -1.162137, 2.533147, 0, 0.1411765, 1, 1,
0.3530802, 1.699353, 0.6363053, 0, 0.1372549, 1, 1,
0.3561014, -0.4293128, 2.228844, 0, 0.1294118, 1, 1,
0.3568378, 0.8869777, -0.1032979, 0, 0.1254902, 1, 1,
0.3580385, -0.1824681, 2.445026, 0, 0.1176471, 1, 1,
0.3671191, 0.445623, -0.4305915, 0, 0.1137255, 1, 1,
0.3716643, 0.4089664, 1.104585, 0, 0.1058824, 1, 1,
0.3803003, 1.87868, -0.8229382, 0, 0.09803922, 1, 1,
0.3858643, 0.09303295, 2.623534, 0, 0.09411765, 1, 1,
0.3867881, 0.3862329, 1.019859, 0, 0.08627451, 1, 1,
0.3869832, 1.203986, 1.047307, 0, 0.08235294, 1, 1,
0.3870407, 1.503957, 0.05659368, 0, 0.07450981, 1, 1,
0.3889075, 0.8580986, 0.2709107, 0, 0.07058824, 1, 1,
0.3912094, -2.396699, 3.058974, 0, 0.0627451, 1, 1,
0.3914754, 1.73252, -1.09201, 0, 0.05882353, 1, 1,
0.3926505, -3.225526, 2.690237, 0, 0.05098039, 1, 1,
0.3948965, 0.3754167, 1.354679, 0, 0.04705882, 1, 1,
0.3963245, -1.327976, 2.642004, 0, 0.03921569, 1, 1,
0.3995609, -1.584053, 4.246778, 0, 0.03529412, 1, 1,
0.4011844, -1.235752, 1.075772, 0, 0.02745098, 1, 1,
0.4048633, 0.369243, 3.047588, 0, 0.02352941, 1, 1,
0.4057924, -1.032552, 4.589352, 0, 0.01568628, 1, 1,
0.4108716, -1.576604, 1.732578, 0, 0.01176471, 1, 1,
0.4116224, -0.2793844, 3.315399, 0, 0.003921569, 1, 1,
0.4141718, -1.678684, 2.312572, 0.003921569, 0, 1, 1,
0.415541, -0.5183931, 1.286446, 0.007843138, 0, 1, 1,
0.416478, -0.1001192, 0.4962751, 0.01568628, 0, 1, 1,
0.4257667, -0.7590373, 1.940833, 0.01960784, 0, 1, 1,
0.4259973, 1.110058, 1.007017, 0.02745098, 0, 1, 1,
0.4271126, 0.6828597, 1.495519, 0.03137255, 0, 1, 1,
0.4286212, 1.500458, -0.9924303, 0.03921569, 0, 1, 1,
0.4297642, 0.5351319, -0.06286547, 0.04313726, 0, 1, 1,
0.4348671, 0.4160296, 1.141082, 0.05098039, 0, 1, 1,
0.4384734, 0.7757189, 0.5445051, 0.05490196, 0, 1, 1,
0.4445937, -0.2094843, 3.475026, 0.0627451, 0, 1, 1,
0.4487465, -0.05746706, 3.847857, 0.06666667, 0, 1, 1,
0.4492396, 0.3720333, 1.876811, 0.07450981, 0, 1, 1,
0.4532915, 0.7112721, 0.7566891, 0.07843138, 0, 1, 1,
0.4547395, 0.4138433, 1.451302, 0.08627451, 0, 1, 1,
0.457868, 0.2662411, 0.545579, 0.09019608, 0, 1, 1,
0.4661697, 0.6417038, 1.327573, 0.09803922, 0, 1, 1,
0.4724443, -0.7593605, 1.941623, 0.1058824, 0, 1, 1,
0.4784228, -0.318413, 3.423547, 0.1098039, 0, 1, 1,
0.4822985, 0.5739263, -0.7781423, 0.1176471, 0, 1, 1,
0.484039, 0.6640811, 1.525387, 0.1215686, 0, 1, 1,
0.4887919, -1.174567, 1.188351, 0.1294118, 0, 1, 1,
0.4894063, 1.124052, 0.74981, 0.1333333, 0, 1, 1,
0.4902647, -0.6534071, 3.158135, 0.1411765, 0, 1, 1,
0.4978142, -0.5300401, 2.304485, 0.145098, 0, 1, 1,
0.5013283, -0.1473875, 2.307082, 0.1529412, 0, 1, 1,
0.5027258, 1.77173, 0.9439037, 0.1568628, 0, 1, 1,
0.5040579, 0.1843596, -0.06334172, 0.1647059, 0, 1, 1,
0.5059154, 0.6774585, 1.648761, 0.1686275, 0, 1, 1,
0.5076504, -0.09353344, 2.275783, 0.1764706, 0, 1, 1,
0.5096735, -0.5109721, 3.094403, 0.1803922, 0, 1, 1,
0.5133576, 0.06962967, 0.2551818, 0.1882353, 0, 1, 1,
0.5191886, -0.392738, 1.281067, 0.1921569, 0, 1, 1,
0.5200652, 0.4808874, -0.2956153, 0.2, 0, 1, 1,
0.5220307, -0.2514122, 2.731072, 0.2078431, 0, 1, 1,
0.5269094, -0.8154339, 2.970703, 0.2117647, 0, 1, 1,
0.5373532, 0.8221166, 0.7527944, 0.2196078, 0, 1, 1,
0.542112, 0.8979305, 0.599897, 0.2235294, 0, 1, 1,
0.5449219, -1.792236, 4.037563, 0.2313726, 0, 1, 1,
0.5498633, 0.7782003, 0.5984545, 0.2352941, 0, 1, 1,
0.5505408, -0.7612224, 3.603828, 0.2431373, 0, 1, 1,
0.5573846, -0.0833849, 1.17575, 0.2470588, 0, 1, 1,
0.559174, 1.423393, 0.08900096, 0.254902, 0, 1, 1,
0.5596606, 0.864029, 1.772998, 0.2588235, 0, 1, 1,
0.5597273, 1.048346, 0.9718235, 0.2666667, 0, 1, 1,
0.5663725, -0.3204268, 2.739722, 0.2705882, 0, 1, 1,
0.5716259, 0.3992088, 2.36705, 0.2784314, 0, 1, 1,
0.5770374, 1.830118, 1.536157, 0.282353, 0, 1, 1,
0.5771934, -0.3795891, 2.427113, 0.2901961, 0, 1, 1,
0.5833773, 0.4595033, 0.3127348, 0.2941177, 0, 1, 1,
0.5885053, 0.3570852, 2.047208, 0.3019608, 0, 1, 1,
0.589047, -0.8161039, 3.223542, 0.3098039, 0, 1, 1,
0.5899507, -0.4810662, 2.493119, 0.3137255, 0, 1, 1,
0.5907307, -0.7984725, 3.288891, 0.3215686, 0, 1, 1,
0.5914894, 0.8352594, 2.88836, 0.3254902, 0, 1, 1,
0.5922465, -2.183954, 4.430017, 0.3333333, 0, 1, 1,
0.5939381, -2.832183, 3.070476, 0.3372549, 0, 1, 1,
0.5945569, 0.4818312, 0.1711362, 0.345098, 0, 1, 1,
0.5955358, -0.3654613, -0.5047834, 0.3490196, 0, 1, 1,
0.5958875, 0.217428, -0.7505212, 0.3568628, 0, 1, 1,
0.5966672, 1.521146, 0.8843259, 0.3607843, 0, 1, 1,
0.5978743, -1.239424, 3.072527, 0.3686275, 0, 1, 1,
0.6055315, 0.01657051, 0.7015438, 0.372549, 0, 1, 1,
0.6101045, -1.025122, 2.367107, 0.3803922, 0, 1, 1,
0.6119106, 1.013433, -0.4789206, 0.3843137, 0, 1, 1,
0.6170965, 0.0987841, 1.146967, 0.3921569, 0, 1, 1,
0.6194464, 0.2615448, 0.5993389, 0.3960784, 0, 1, 1,
0.6196404, 0.6586292, 0.08305406, 0.4039216, 0, 1, 1,
0.6209403, 1.578007, 0.4594545, 0.4117647, 0, 1, 1,
0.625683, -0.407591, 0.6406788, 0.4156863, 0, 1, 1,
0.627027, -0.9346143, 3.199266, 0.4235294, 0, 1, 1,
0.6312832, -0.3398228, 1.772136, 0.427451, 0, 1, 1,
0.6325306, 0.7335723, 0.8776808, 0.4352941, 0, 1, 1,
0.6375285, -0.5872225, 3.049, 0.4392157, 0, 1, 1,
0.6413704, 0.5329636, 0.3379813, 0.4470588, 0, 1, 1,
0.6425454, 0.8206049, 0.9709917, 0.4509804, 0, 1, 1,
0.6514667, -0.4070725, 0.8173483, 0.4588235, 0, 1, 1,
0.6522618, -0.5687614, 3.088032, 0.4627451, 0, 1, 1,
0.6534423, 1.068603, 0.447982, 0.4705882, 0, 1, 1,
0.6539493, -1.021083, 4.229721, 0.4745098, 0, 1, 1,
0.654807, -0.4885331, 2.07565, 0.4823529, 0, 1, 1,
0.6608769, 0.4970176, 2.528491, 0.4862745, 0, 1, 1,
0.6631752, 2.051862, 1.769172, 0.4941176, 0, 1, 1,
0.6733373, 0.4063703, 0.7758023, 0.5019608, 0, 1, 1,
0.6740231, -1.164949, 1.947462, 0.5058824, 0, 1, 1,
0.6754806, 0.9191674, 1.215549, 0.5137255, 0, 1, 1,
0.6766987, -0.1193946, 3.221103, 0.5176471, 0, 1, 1,
0.6768638, 0.2630495, 0.389367, 0.5254902, 0, 1, 1,
0.6787252, 0.706476, 1.581632, 0.5294118, 0, 1, 1,
0.6807959, -0.6893158, 1.004379, 0.5372549, 0, 1, 1,
0.6945911, 0.3068883, 0.2377676, 0.5411765, 0, 1, 1,
0.7004052, -1.200277, 2.656553, 0.5490196, 0, 1, 1,
0.7017954, 0.3096142, 1.653282, 0.5529412, 0, 1, 1,
0.7066883, 1.435686, -0.744377, 0.5607843, 0, 1, 1,
0.7086834, 0.5706662, -0.8131263, 0.5647059, 0, 1, 1,
0.7093549, -0.5766549, 0.9239293, 0.572549, 0, 1, 1,
0.7099256, 1.302434, 0.7437928, 0.5764706, 0, 1, 1,
0.7125055, 0.1320056, 0.3970662, 0.5843138, 0, 1, 1,
0.7142343, 0.9436772, -0.1079333, 0.5882353, 0, 1, 1,
0.7162046, -0.7740726, 3.550254, 0.5960785, 0, 1, 1,
0.7173735, 0.1713255, 1.094981, 0.6039216, 0, 1, 1,
0.7235316, 1.782075, 0.07093125, 0.6078432, 0, 1, 1,
0.7249037, 1.311855, -1.000329, 0.6156863, 0, 1, 1,
0.7249384, -1.665081, 2.014541, 0.6196079, 0, 1, 1,
0.7289857, -2.190515, 1.633433, 0.627451, 0, 1, 1,
0.7314215, 0.8225, -0.3476539, 0.6313726, 0, 1, 1,
0.7321074, 0.01345801, -0.2683267, 0.6392157, 0, 1, 1,
0.7353339, 0.5237499, 1.634267, 0.6431373, 0, 1, 1,
0.737066, -0.9003949, 2.200409, 0.6509804, 0, 1, 1,
0.741552, -0.02015368, 2.998532, 0.654902, 0, 1, 1,
0.7434544, 0.7230316, 0.4389717, 0.6627451, 0, 1, 1,
0.7437799, -0.6454409, 1.232772, 0.6666667, 0, 1, 1,
0.7455204, 0.749788, -0.2195394, 0.6745098, 0, 1, 1,
0.7504238, -0.4727949, 3.644393, 0.6784314, 0, 1, 1,
0.7522404, -0.2433283, 1.244829, 0.6862745, 0, 1, 1,
0.7525163, 0.07750066, 2.132176, 0.6901961, 0, 1, 1,
0.755386, 0.3548316, 2.193149, 0.6980392, 0, 1, 1,
0.7624812, 1.936271, -2.218042, 0.7058824, 0, 1, 1,
0.7632126, -0.2739819, 1.785025, 0.7098039, 0, 1, 1,
0.7667323, -1.461518, 3.793053, 0.7176471, 0, 1, 1,
0.7671397, 1.26176, 3.13145, 0.7215686, 0, 1, 1,
0.7704289, -0.4292415, 1.617591, 0.7294118, 0, 1, 1,
0.7735361, -0.06593423, -0.5135101, 0.7333333, 0, 1, 1,
0.7747484, 0.009574944, 2.175919, 0.7411765, 0, 1, 1,
0.7748564, -2.856166, 3.406118, 0.7450981, 0, 1, 1,
0.781527, -0.710142, 3.367378, 0.7529412, 0, 1, 1,
0.7877423, 1.457635, -0.08130073, 0.7568628, 0, 1, 1,
0.8164106, -1.719203, 1.7669, 0.7647059, 0, 1, 1,
0.8172399, -0.06265278, 1.894126, 0.7686275, 0, 1, 1,
0.8182793, 1.609732, 0.5040425, 0.7764706, 0, 1, 1,
0.8271151, 2.647317, -0.7405813, 0.7803922, 0, 1, 1,
0.8285931, 0.733507, 1.959396, 0.7882353, 0, 1, 1,
0.8327968, -1.44629, 2.234775, 0.7921569, 0, 1, 1,
0.8360522, -1.627525, 4.210965, 0.8, 0, 1, 1,
0.8370019, -0.6687639, 0.4354606, 0.8078431, 0, 1, 1,
0.8379622, -0.1759183, 2.037646, 0.8117647, 0, 1, 1,
0.8398368, -0.9571412, 3.311933, 0.8196079, 0, 1, 1,
0.8428898, 2.069084, 0.6305078, 0.8235294, 0, 1, 1,
0.8444567, 1.752994, 0.5145439, 0.8313726, 0, 1, 1,
0.8470508, 0.6672473, 0.8505141, 0.8352941, 0, 1, 1,
0.8477953, -0.9296414, 0.294625, 0.8431373, 0, 1, 1,
0.8478622, -0.5806203, 2.295895, 0.8470588, 0, 1, 1,
0.8483732, 0.1006988, 2.04306, 0.854902, 0, 1, 1,
0.8523419, 1.438866, 0.6626306, 0.8588235, 0, 1, 1,
0.8548178, 0.238361, 2.684735, 0.8666667, 0, 1, 1,
0.8591715, 0.9761325, 1.348974, 0.8705882, 0, 1, 1,
0.8663434, -0.4995059, 2.768237, 0.8784314, 0, 1, 1,
0.8719735, 0.394917, 2.931997, 0.8823529, 0, 1, 1,
0.8770027, 2.29383, 0.5914309, 0.8901961, 0, 1, 1,
0.8800835, -1.02051, 2.20349, 0.8941177, 0, 1, 1,
0.8840353, 0.07598529, 2.345265, 0.9019608, 0, 1, 1,
0.8852465, 0.6172683, 1.000557, 0.9098039, 0, 1, 1,
0.8983897, -0.9715152, 2.953258, 0.9137255, 0, 1, 1,
0.8989821, -0.1991474, 1.911075, 0.9215686, 0, 1, 1,
0.9013289, -0.1490266, 2.243924, 0.9254902, 0, 1, 1,
0.9062631, 0.9065766, -0.04130184, 0.9333333, 0, 1, 1,
0.9086723, 0.713942, 0.1559022, 0.9372549, 0, 1, 1,
0.9111328, -1.222505, 3.360321, 0.945098, 0, 1, 1,
0.9144216, -1.279123, 2.313922, 0.9490196, 0, 1, 1,
0.9152079, -0.9300279, 3.211249, 0.9568627, 0, 1, 1,
0.9194435, -0.001290939, 3.233246, 0.9607843, 0, 1, 1,
0.9243655, -1.307895, 1.326062, 0.9686275, 0, 1, 1,
0.9326569, -0.2423478, 2.935835, 0.972549, 0, 1, 1,
0.9347407, -1.193479, 3.028764, 0.9803922, 0, 1, 1,
0.9350997, 2.125035, -0.1629968, 0.9843137, 0, 1, 1,
0.9435912, -0.7019118, 2.855945, 0.9921569, 0, 1, 1,
0.9445471, -1.058696, 3.26431, 0.9960784, 0, 1, 1,
0.9554472, 0.638383, 1.149212, 1, 0, 0.9960784, 1,
0.9574792, 0.6760766, 0.4167429, 1, 0, 0.9882353, 1,
0.9666154, -0.3027356, 1.402566, 1, 0, 0.9843137, 1,
0.9674084, 0.212811, 1.516951, 1, 0, 0.9764706, 1,
0.969766, 1.063072, 1.371623, 1, 0, 0.972549, 1,
0.9880664, -1.366468, 2.274175, 1, 0, 0.9647059, 1,
0.989658, 0.4400165, 1.456077, 1, 0, 0.9607843, 1,
0.9940813, 0.159106, 0.2072278, 1, 0, 0.9529412, 1,
1.009234, 2.182304, 0.761123, 1, 0, 0.9490196, 1,
1.009445, -1.445616, 2.910284, 1, 0, 0.9411765, 1,
1.009836, -1.188811, 2.978208, 1, 0, 0.9372549, 1,
1.013149, 0.9978527, 1.342478, 1, 0, 0.9294118, 1,
1.021984, -0.02553612, -0.006827509, 1, 0, 0.9254902, 1,
1.025928, -0.3013057, 2.72603, 1, 0, 0.9176471, 1,
1.030989, 1.118666, 0.07920705, 1, 0, 0.9137255, 1,
1.035147, 0.3494614, 1.127071, 1, 0, 0.9058824, 1,
1.038262, -2.660368, 3.612541, 1, 0, 0.9019608, 1,
1.044687, -0.1158862, 1.71436, 1, 0, 0.8941177, 1,
1.049985, 1.308271, 0.2838891, 1, 0, 0.8862745, 1,
1.050635, -0.3919804, 1.812806, 1, 0, 0.8823529, 1,
1.050803, -0.5271394, 1.211294, 1, 0, 0.8745098, 1,
1.063407, -0.857684, 2.254558, 1, 0, 0.8705882, 1,
1.066754, -0.1859936, 2.613742, 1, 0, 0.8627451, 1,
1.068087, -1.420793, 1.625284, 1, 0, 0.8588235, 1,
1.072055, 1.389104, 0.648506, 1, 0, 0.8509804, 1,
1.073761, 1.2003, 0.3390968, 1, 0, 0.8470588, 1,
1.073895, -1.179618, 2.673398, 1, 0, 0.8392157, 1,
1.075463, 0.5767214, 1.123552, 1, 0, 0.8352941, 1,
1.077859, 0.5528281, 1.519644, 1, 0, 0.827451, 1,
1.079196, 0.4208525, 1.737069, 1, 0, 0.8235294, 1,
1.080843, -1.012221, 0.8085898, 1, 0, 0.8156863, 1,
1.082072, 0.04073422, 2.018872, 1, 0, 0.8117647, 1,
1.094291, -2.254388, 2.497715, 1, 0, 0.8039216, 1,
1.094411, -0.3793132, 2.22577, 1, 0, 0.7960784, 1,
1.096555, -0.2587829, 1.876331, 1, 0, 0.7921569, 1,
1.117841, -0.6239312, 2.617069, 1, 0, 0.7843137, 1,
1.126411, 0.146768, 2.470366, 1, 0, 0.7803922, 1,
1.129227, -0.829127, 4.896348, 1, 0, 0.772549, 1,
1.133252, -0.9147554, 2.430122, 1, 0, 0.7686275, 1,
1.136276, 0.1351524, 0.8837454, 1, 0, 0.7607843, 1,
1.139247, 0.6694868, 1.453247, 1, 0, 0.7568628, 1,
1.145323, 1.054167, 0.6604518, 1, 0, 0.7490196, 1,
1.147615, 1.144615, 0.5068204, 1, 0, 0.7450981, 1,
1.148543, -1.128568, 4.74716, 1, 0, 0.7372549, 1,
1.151917, -0.111171, 2.738152, 1, 0, 0.7333333, 1,
1.169538, -1.456916, 3.302288, 1, 0, 0.7254902, 1,
1.176687, 0.9209195, -0.0006001469, 1, 0, 0.7215686, 1,
1.179899, -0.6324779, 1.260314, 1, 0, 0.7137255, 1,
1.183404, 0.924422, 1.130088, 1, 0, 0.7098039, 1,
1.18508, 0.5547716, 1.777422, 1, 0, 0.7019608, 1,
1.18879, -2.241376, 3.133604, 1, 0, 0.6941177, 1,
1.190373, -0.4479041, 3.203601, 1, 0, 0.6901961, 1,
1.19725, 0.7083058, 1.092781, 1, 0, 0.682353, 1,
1.197343, -0.1618305, 2.267807, 1, 0, 0.6784314, 1,
1.201094, 0.5293618, 0.3637784, 1, 0, 0.6705883, 1,
1.201494, -0.08849061, 3.142387, 1, 0, 0.6666667, 1,
1.21131, -0.8023067, 1.515622, 1, 0, 0.6588235, 1,
1.218787, 0.9005255, 2.502516, 1, 0, 0.654902, 1,
1.221626, -0.1566113, 3.113784, 1, 0, 0.6470588, 1,
1.225032, -1.279544, 3.403131, 1, 0, 0.6431373, 1,
1.227763, -0.1792841, 1.849553, 1, 0, 0.6352941, 1,
1.231993, -0.08135848, 2.606, 1, 0, 0.6313726, 1,
1.232723, 1.727689, 0.1448073, 1, 0, 0.6235294, 1,
1.234084, 0.1903857, 1.522346, 1, 0, 0.6196079, 1,
1.239359, 1.030395, 2.019731, 1, 0, 0.6117647, 1,
1.242346, 0.342154, 1.961593, 1, 0, 0.6078432, 1,
1.24783, 0.527477, -0.6942642, 1, 0, 0.6, 1,
1.248119, -0.9935156, 3.197293, 1, 0, 0.5921569, 1,
1.253325, -0.8515363, 2.395599, 1, 0, 0.5882353, 1,
1.261533, -0.9617692, 1.780862, 1, 0, 0.5803922, 1,
1.265674, 0.2880292, -0.8661105, 1, 0, 0.5764706, 1,
1.265702, 1.277561, 0.8149706, 1, 0, 0.5686275, 1,
1.269989, 1.551235, 0.1721086, 1, 0, 0.5647059, 1,
1.276488, 0.1320657, 0.3964949, 1, 0, 0.5568628, 1,
1.278883, 0.8508714, 0.7186291, 1, 0, 0.5529412, 1,
1.284571, 1.009828, -0.7891181, 1, 0, 0.5450981, 1,
1.286161, 0.6889716, 0.04362292, 1, 0, 0.5411765, 1,
1.28904, 0.8527129, 1.580479, 1, 0, 0.5333334, 1,
1.294926, 0.8999671, 1.747827, 1, 0, 0.5294118, 1,
1.302424, -0.3218106, 0.908938, 1, 0, 0.5215687, 1,
1.303889, 1.412022, 1.214192, 1, 0, 0.5176471, 1,
1.30607, 1.341481, 1.010576, 1, 0, 0.509804, 1,
1.307342, -0.8717593, 2.076371, 1, 0, 0.5058824, 1,
1.307589, 1.619753, -0.2324892, 1, 0, 0.4980392, 1,
1.316383, -1.334243, 1.607938, 1, 0, 0.4901961, 1,
1.31747, 0.8200606, 2.202277, 1, 0, 0.4862745, 1,
1.332094, 0.361602, 1.320381, 1, 0, 0.4784314, 1,
1.338013, 0.9943124, 0.9971811, 1, 0, 0.4745098, 1,
1.340619, 1.031831, 2.059521, 1, 0, 0.4666667, 1,
1.342742, 1.504416, -0.06983799, 1, 0, 0.4627451, 1,
1.348755, 1.959043, 1.028783, 1, 0, 0.454902, 1,
1.35201, -0.7695262, 1.973604, 1, 0, 0.4509804, 1,
1.355047, 0.4777735, 0.7310577, 1, 0, 0.4431373, 1,
1.368468, 0.3892069, -0.03540822, 1, 0, 0.4392157, 1,
1.369793, -0.8376704, 1.248746, 1, 0, 0.4313726, 1,
1.393647, 0.638406, 0.07749034, 1, 0, 0.427451, 1,
1.398931, -0.5995594, 0.7423328, 1, 0, 0.4196078, 1,
1.401115, 0.2341484, 0.02020159, 1, 0, 0.4156863, 1,
1.402444, 0.3889067, 0.8307859, 1, 0, 0.4078431, 1,
1.405525, 0.9970997, 1.532808, 1, 0, 0.4039216, 1,
1.409138, -0.7305001, 3.488265, 1, 0, 0.3960784, 1,
1.413996, -0.08825535, 1.841309, 1, 0, 0.3882353, 1,
1.416066, -0.001977169, 2.114063, 1, 0, 0.3843137, 1,
1.419196, -0.732825, 2.446002, 1, 0, 0.3764706, 1,
1.433514, -0.9090528, 2.156001, 1, 0, 0.372549, 1,
1.434608, -0.3586485, 1.492616, 1, 0, 0.3647059, 1,
1.445117, -1.066483, 2.803416, 1, 0, 0.3607843, 1,
1.451358, -0.2496399, 1.096208, 1, 0, 0.3529412, 1,
1.459163, -0.848727, 0.5636736, 1, 0, 0.3490196, 1,
1.459746, -1.807849, 2.660352, 1, 0, 0.3411765, 1,
1.469014, -0.9655148, 2.943608, 1, 0, 0.3372549, 1,
1.473479, 1.594652, 0.8096368, 1, 0, 0.3294118, 1,
1.47627, -0.3080709, 3.002259, 1, 0, 0.3254902, 1,
1.480115, 0.5687244, 0.1609601, 1, 0, 0.3176471, 1,
1.483463, -2.249644, 2.082445, 1, 0, 0.3137255, 1,
1.498357, -1.034635, 2.223392, 1, 0, 0.3058824, 1,
1.500423, 1.883662, -0.05613294, 1, 0, 0.2980392, 1,
1.508593, 1.456843, 0.33224, 1, 0, 0.2941177, 1,
1.530594, 0.6408016, 0.9772093, 1, 0, 0.2862745, 1,
1.53662, -0.5744514, 2.572372, 1, 0, 0.282353, 1,
1.536985, -0.7455634, 2.972081, 1, 0, 0.2745098, 1,
1.550112, 0.1933793, 1.376163, 1, 0, 0.2705882, 1,
1.554083, -0.2861434, 1.932013, 1, 0, 0.2627451, 1,
1.556364, -0.1446434, 1.294765, 1, 0, 0.2588235, 1,
1.565087, 1.610108, 2.361056, 1, 0, 0.2509804, 1,
1.572044, -0.3819971, 1.860801, 1, 0, 0.2470588, 1,
1.585695, 0.3310985, 1.73073, 1, 0, 0.2392157, 1,
1.587067, -0.2562055, 1.449526, 1, 0, 0.2352941, 1,
1.610484, -0.6086636, 2.019921, 1, 0, 0.227451, 1,
1.612866, -0.09301034, 2.229264, 1, 0, 0.2235294, 1,
1.638298, -0.2200983, 2.207379, 1, 0, 0.2156863, 1,
1.647931, 1.012291, 0.9521227, 1, 0, 0.2117647, 1,
1.662368, 0.5704851, 1.338251, 1, 0, 0.2039216, 1,
1.679356, -0.8875794, 3.509613, 1, 0, 0.1960784, 1,
1.683133, 0.2916842, 1.718248, 1, 0, 0.1921569, 1,
1.700735, 0.4402153, 2.418938, 1, 0, 0.1843137, 1,
1.735125, 0.4674032, 1.013152, 1, 0, 0.1803922, 1,
1.738141, 0.5134472, 0.8848708, 1, 0, 0.172549, 1,
1.739844, 0.4814878, 3.497303, 1, 0, 0.1686275, 1,
1.741138, -0.2175164, 3.528984, 1, 0, 0.1607843, 1,
1.756027, -0.5782397, -0.7363234, 1, 0, 0.1568628, 1,
1.758668, 0.1309031, 0.1212295, 1, 0, 0.1490196, 1,
1.771108, 0.8459437, 1.328741, 1, 0, 0.145098, 1,
1.774033, -0.5440202, 0.5426192, 1, 0, 0.1372549, 1,
1.815157, 0.8146257, 0.8656412, 1, 0, 0.1333333, 1,
1.820839, -0.0827655, 1.916856, 1, 0, 0.1254902, 1,
1.866809, 2.355174, 0.1403526, 1, 0, 0.1215686, 1,
1.88741, -1.506177, 2.14612, 1, 0, 0.1137255, 1,
1.894852, -0.6218286, 2.23262, 1, 0, 0.1098039, 1,
1.905182, 0.410078, 1.945983, 1, 0, 0.1019608, 1,
1.942851, 0.2265857, 0.476898, 1, 0, 0.09411765, 1,
1.957961, -1.156542, 2.896686, 1, 0, 0.09019608, 1,
1.973003, 1.602613, 1.211414, 1, 0, 0.08235294, 1,
2.016744, 0.6846812, 0.5446056, 1, 0, 0.07843138, 1,
2.029712, 0.4790075, 0.5424869, 1, 0, 0.07058824, 1,
2.062219, 0.5849606, 1.780063, 1, 0, 0.06666667, 1,
2.140516, -1.059248, 2.369617, 1, 0, 0.05882353, 1,
2.286551, 1.372573, 1.049331, 1, 0, 0.05490196, 1,
2.332722, -0.4485003, 2.665474, 1, 0, 0.04705882, 1,
2.389631, -0.3991513, 2.81377, 1, 0, 0.04313726, 1,
2.43332, 1.491811, 1.327556, 1, 0, 0.03529412, 1,
2.632039, -2.088939, 2.44589, 1, 0, 0.03137255, 1,
2.644024, 0.2912101, 1.542915, 1, 0, 0.02352941, 1,
2.905977, -0.8180907, 3.026067, 1, 0, 0.01960784, 1,
2.977499, -1.316479, -2.032625, 1, 0, 0.01176471, 1,
3.150309, -0.6548338, 1.490294, 1, 0, 0.007843138, 1
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
-0.06089449, -4.321319, -6.925508, 0, -0.5, 0.5, 0.5,
-0.06089449, -4.321319, -6.925508, 1, -0.5, 0.5, 0.5,
-0.06089449, -4.321319, -6.925508, 1, 1.5, 0.5, 0.5,
-0.06089449, -4.321319, -6.925508, 0, 1.5, 0.5, 0.5
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
-4.360696, 0.006900191, -6.925508, 0, -0.5, 0.5, 0.5,
-4.360696, 0.006900191, -6.925508, 1, -0.5, 0.5, 0.5,
-4.360696, 0.006900191, -6.925508, 1, 1.5, 0.5, 0.5,
-4.360696, 0.006900191, -6.925508, 0, 1.5, 0.5, 0.5
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
-4.360696, -4.321319, 0.2369411, 0, -0.5, 0.5, 0.5,
-4.360696, -4.321319, 0.2369411, 1, -0.5, 0.5, 0.5,
-4.360696, -4.321319, 0.2369411, 1, 1.5, 0.5, 0.5,
-4.360696, -4.321319, 0.2369411, 0, 1.5, 0.5, 0.5
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
-3, -3.322499, -5.272635,
3, -3.322499, -5.272635,
-3, -3.322499, -5.272635,
-3, -3.488969, -5.548113,
-2, -3.322499, -5.272635,
-2, -3.488969, -5.548113,
-1, -3.322499, -5.272635,
-1, -3.488969, -5.548113,
0, -3.322499, -5.272635,
0, -3.488969, -5.548113,
1, -3.322499, -5.272635,
1, -3.488969, -5.548113,
2, -3.322499, -5.272635,
2, -3.488969, -5.548113,
3, -3.322499, -5.272635,
3, -3.488969, -5.548113
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
-3, -3.821909, -6.099071, 0, -0.5, 0.5, 0.5,
-3, -3.821909, -6.099071, 1, -0.5, 0.5, 0.5,
-3, -3.821909, -6.099071, 1, 1.5, 0.5, 0.5,
-3, -3.821909, -6.099071, 0, 1.5, 0.5, 0.5,
-2, -3.821909, -6.099071, 0, -0.5, 0.5, 0.5,
-2, -3.821909, -6.099071, 1, -0.5, 0.5, 0.5,
-2, -3.821909, -6.099071, 1, 1.5, 0.5, 0.5,
-2, -3.821909, -6.099071, 0, 1.5, 0.5, 0.5,
-1, -3.821909, -6.099071, 0, -0.5, 0.5, 0.5,
-1, -3.821909, -6.099071, 1, -0.5, 0.5, 0.5,
-1, -3.821909, -6.099071, 1, 1.5, 0.5, 0.5,
-1, -3.821909, -6.099071, 0, 1.5, 0.5, 0.5,
0, -3.821909, -6.099071, 0, -0.5, 0.5, 0.5,
0, -3.821909, -6.099071, 1, -0.5, 0.5, 0.5,
0, -3.821909, -6.099071, 1, 1.5, 0.5, 0.5,
0, -3.821909, -6.099071, 0, 1.5, 0.5, 0.5,
1, -3.821909, -6.099071, 0, -0.5, 0.5, 0.5,
1, -3.821909, -6.099071, 1, -0.5, 0.5, 0.5,
1, -3.821909, -6.099071, 1, 1.5, 0.5, 0.5,
1, -3.821909, -6.099071, 0, 1.5, 0.5, 0.5,
2, -3.821909, -6.099071, 0, -0.5, 0.5, 0.5,
2, -3.821909, -6.099071, 1, -0.5, 0.5, 0.5,
2, -3.821909, -6.099071, 1, 1.5, 0.5, 0.5,
2, -3.821909, -6.099071, 0, 1.5, 0.5, 0.5,
3, -3.821909, -6.099071, 0, -0.5, 0.5, 0.5,
3, -3.821909, -6.099071, 1, -0.5, 0.5, 0.5,
3, -3.821909, -6.099071, 1, 1.5, 0.5, 0.5,
3, -3.821909, -6.099071, 0, 1.5, 0.5, 0.5
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
-3.368434, -3, -5.272635,
-3.368434, 3, -5.272635,
-3.368434, -3, -5.272635,
-3.533811, -3, -5.548113,
-3.368434, -2, -5.272635,
-3.533811, -2, -5.548113,
-3.368434, -1, -5.272635,
-3.533811, -1, -5.548113,
-3.368434, 0, -5.272635,
-3.533811, 0, -5.548113,
-3.368434, 1, -5.272635,
-3.533811, 1, -5.548113,
-3.368434, 2, -5.272635,
-3.533811, 2, -5.548113,
-3.368434, 3, -5.272635,
-3.533811, 3, -5.548113
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
-3.864565, -3, -6.099071, 0, -0.5, 0.5, 0.5,
-3.864565, -3, -6.099071, 1, -0.5, 0.5, 0.5,
-3.864565, -3, -6.099071, 1, 1.5, 0.5, 0.5,
-3.864565, -3, -6.099071, 0, 1.5, 0.5, 0.5,
-3.864565, -2, -6.099071, 0, -0.5, 0.5, 0.5,
-3.864565, -2, -6.099071, 1, -0.5, 0.5, 0.5,
-3.864565, -2, -6.099071, 1, 1.5, 0.5, 0.5,
-3.864565, -2, -6.099071, 0, 1.5, 0.5, 0.5,
-3.864565, -1, -6.099071, 0, -0.5, 0.5, 0.5,
-3.864565, -1, -6.099071, 1, -0.5, 0.5, 0.5,
-3.864565, -1, -6.099071, 1, 1.5, 0.5, 0.5,
-3.864565, -1, -6.099071, 0, 1.5, 0.5, 0.5,
-3.864565, 0, -6.099071, 0, -0.5, 0.5, 0.5,
-3.864565, 0, -6.099071, 1, -0.5, 0.5, 0.5,
-3.864565, 0, -6.099071, 1, 1.5, 0.5, 0.5,
-3.864565, 0, -6.099071, 0, 1.5, 0.5, 0.5,
-3.864565, 1, -6.099071, 0, -0.5, 0.5, 0.5,
-3.864565, 1, -6.099071, 1, -0.5, 0.5, 0.5,
-3.864565, 1, -6.099071, 1, 1.5, 0.5, 0.5,
-3.864565, 1, -6.099071, 0, 1.5, 0.5, 0.5,
-3.864565, 2, -6.099071, 0, -0.5, 0.5, 0.5,
-3.864565, 2, -6.099071, 1, -0.5, 0.5, 0.5,
-3.864565, 2, -6.099071, 1, 1.5, 0.5, 0.5,
-3.864565, 2, -6.099071, 0, 1.5, 0.5, 0.5,
-3.864565, 3, -6.099071, 0, -0.5, 0.5, 0.5,
-3.864565, 3, -6.099071, 1, -0.5, 0.5, 0.5,
-3.864565, 3, -6.099071, 1, 1.5, 0.5, 0.5,
-3.864565, 3, -6.099071, 0, 1.5, 0.5, 0.5
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
-3.368434, -3.322499, -4,
-3.368434, -3.322499, 4,
-3.368434, -3.322499, -4,
-3.533811, -3.488969, -4,
-3.368434, -3.322499, -2,
-3.533811, -3.488969, -2,
-3.368434, -3.322499, 0,
-3.533811, -3.488969, 0,
-3.368434, -3.322499, 2,
-3.533811, -3.488969, 2,
-3.368434, -3.322499, 4,
-3.533811, -3.488969, 4
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
-3.864565, -3.821909, -4, 0, -0.5, 0.5, 0.5,
-3.864565, -3.821909, -4, 1, -0.5, 0.5, 0.5,
-3.864565, -3.821909, -4, 1, 1.5, 0.5, 0.5,
-3.864565, -3.821909, -4, 0, 1.5, 0.5, 0.5,
-3.864565, -3.821909, -2, 0, -0.5, 0.5, 0.5,
-3.864565, -3.821909, -2, 1, -0.5, 0.5, 0.5,
-3.864565, -3.821909, -2, 1, 1.5, 0.5, 0.5,
-3.864565, -3.821909, -2, 0, 1.5, 0.5, 0.5,
-3.864565, -3.821909, 0, 0, -0.5, 0.5, 0.5,
-3.864565, -3.821909, 0, 1, -0.5, 0.5, 0.5,
-3.864565, -3.821909, 0, 1, 1.5, 0.5, 0.5,
-3.864565, -3.821909, 0, 0, 1.5, 0.5, 0.5,
-3.864565, -3.821909, 2, 0, -0.5, 0.5, 0.5,
-3.864565, -3.821909, 2, 1, -0.5, 0.5, 0.5,
-3.864565, -3.821909, 2, 1, 1.5, 0.5, 0.5,
-3.864565, -3.821909, 2, 0, 1.5, 0.5, 0.5,
-3.864565, -3.821909, 4, 0, -0.5, 0.5, 0.5,
-3.864565, -3.821909, 4, 1, -0.5, 0.5, 0.5,
-3.864565, -3.821909, 4, 1, 1.5, 0.5, 0.5,
-3.864565, -3.821909, 4, 0, 1.5, 0.5, 0.5
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
-3.368434, -3.322499, -5.272635,
-3.368434, 3.336299, -5.272635,
-3.368434, -3.322499, 5.746517,
-3.368434, 3.336299, 5.746517,
-3.368434, -3.322499, -5.272635,
-3.368434, -3.322499, 5.746517,
-3.368434, 3.336299, -5.272635,
-3.368434, 3.336299, 5.746517,
-3.368434, -3.322499, -5.272635,
3.246645, -3.322499, -5.272635,
-3.368434, -3.322499, 5.746517,
3.246645, -3.322499, 5.746517,
-3.368434, 3.336299, -5.272635,
3.246645, 3.336299, -5.272635,
-3.368434, 3.336299, 5.746517,
3.246645, 3.336299, 5.746517,
3.246645, -3.322499, -5.272635,
3.246645, 3.336299, -5.272635,
3.246645, -3.322499, 5.746517,
3.246645, 3.336299, 5.746517,
3.246645, -3.322499, -5.272635,
3.246645, -3.322499, 5.746517,
3.246645, 3.336299, -5.272635,
3.246645, 3.336299, 5.746517
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
var radius = 7.729276;
var distance = 34.38842;
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
mvMatrix.translate( 0.06089449, -0.006900191, -0.2369411 );
mvMatrix.scale( 1.263332, 1.255038, 0.7584109 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.38842);
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
oxolinic_acid_5-ethy<-read.table("oxolinic_acid_5-ethy.xyz")
```

```
## Error in read.table("oxolinic_acid_5-ethy.xyz"): no lines available in input
```

```r
x<-oxolinic_acid_5-ethy$V2
```

```
## Error in eval(expr, envir, enclos): object 'oxolinic_acid_5' not found
```

```r
y<-oxolinic_acid_5-ethy$V3
```

```
## Error in eval(expr, envir, enclos): object 'oxolinic_acid_5' not found
```

```r
z<-oxolinic_acid_5-ethy$V4
```

```
## Error in eval(expr, envir, enclos): object 'oxolinic_acid_5' not found
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
-3.272098, 0.3702884, -1.05562, 0, 0, 1, 1, 1,
-3.097179, -1.179703, -1.693773, 1, 0, 0, 1, 1,
-2.752806, 1.384547, -0.06102905, 1, 0, 0, 1, 1,
-2.734585, 2.295968, -3.394712, 1, 0, 0, 1, 1,
-2.488458, 0.4409018, -1.043446, 1, 0, 0, 1, 1,
-2.477954, -3.076254, -3.412037, 1, 0, 0, 1, 1,
-2.445082, -0.09885509, -4.003987, 0, 0, 0, 1, 1,
-2.432197, -0.2975811, -0.6941054, 0, 0, 0, 1, 1,
-2.430669, -0.2795943, -1.340047, 0, 0, 0, 1, 1,
-2.407626, 1.075412, -0.4292636, 0, 0, 0, 1, 1,
-2.387893, -0.3273616, -2.115417, 0, 0, 0, 1, 1,
-2.370979, -0.6695092, -3.00001, 0, 0, 0, 1, 1,
-2.203195, -0.3145975, -1.384895, 0, 0, 0, 1, 1,
-2.174617, -0.6034153, 0.08828156, 1, 1, 1, 1, 1,
-2.161905, 0.215821, -2.133932, 1, 1, 1, 1, 1,
-2.059837, 1.184787, -1.704692, 1, 1, 1, 1, 1,
-2.055628, -1.272146, -1.808958, 1, 1, 1, 1, 1,
-2.054474, 0.3013346, -2.072101, 1, 1, 1, 1, 1,
-1.989622, 2.245353, -1.685086, 1, 1, 1, 1, 1,
-1.975744, 1.491697, -2.835497, 1, 1, 1, 1, 1,
-1.972399, -2.344101, -2.987635, 1, 1, 1, 1, 1,
-1.943205, -0.3468246, -1.22541, 1, 1, 1, 1, 1,
-1.93551, -0.6583908, -1.393759, 1, 1, 1, 1, 1,
-1.93103, -0.173438, -1.051625, 1, 1, 1, 1, 1,
-1.901836, -2.290741, -3.884283, 1, 1, 1, 1, 1,
-1.852929, 0.02777078, -0.9295113, 1, 1, 1, 1, 1,
-1.848765, -0.5519999, -0.553843, 1, 1, 1, 1, 1,
-1.824112, 1.790792, -2.271091, 1, 1, 1, 1, 1,
-1.811935, 1.599801, -2.100894, 0, 0, 1, 1, 1,
-1.81103, -1.72354, -2.440248, 1, 0, 0, 1, 1,
-1.807643, 0.4021652, -1.907629, 1, 0, 0, 1, 1,
-1.804567, -2.666346, -2.117944, 1, 0, 0, 1, 1,
-1.79205, 2.571153, -0.2181501, 1, 0, 0, 1, 1,
-1.775824, 0.09819759, -2.953658, 1, 0, 0, 1, 1,
-1.766396, -0.609201, -3.057364, 0, 0, 0, 1, 1,
-1.754141, -0.8216311, -2.311886, 0, 0, 0, 1, 1,
-1.753345, -0.6700079, -0.3362958, 0, 0, 0, 1, 1,
-1.709104, 0.2692889, -2.380495, 0, 0, 0, 1, 1,
-1.699946, 0.5328288, -1.951025, 0, 0, 0, 1, 1,
-1.690586, 1.048557, -1.414648, 0, 0, 0, 1, 1,
-1.688083, 1.281988, -2.366618, 0, 0, 0, 1, 1,
-1.686389, 0.295529, -2.493745, 1, 1, 1, 1, 1,
-1.682899, 0.06675422, -2.043186, 1, 1, 1, 1, 1,
-1.678697, -0.6136575, -3.029377, 1, 1, 1, 1, 1,
-1.660717, 1.911137, 0.08054595, 1, 1, 1, 1, 1,
-1.66065, 2.210074, -1.558001, 1, 1, 1, 1, 1,
-1.645678, -0.6083736, -0.9642704, 1, 1, 1, 1, 1,
-1.644314, 1.450044, -1.871699, 1, 1, 1, 1, 1,
-1.631907, -0.9168866, -2.691481, 1, 1, 1, 1, 1,
-1.624166, 1.381242, -1.979715, 1, 1, 1, 1, 1,
-1.621906, 0.9881677, 0.224617, 1, 1, 1, 1, 1,
-1.612552, -0.5982452, -0.5672515, 1, 1, 1, 1, 1,
-1.610885, -0.4980457, -1.098533, 1, 1, 1, 1, 1,
-1.604103, 0.8292915, -0.8314886, 1, 1, 1, 1, 1,
-1.595129, 1.216373, -1.466175, 1, 1, 1, 1, 1,
-1.593948, 2.35474, -1.362869, 1, 1, 1, 1, 1,
-1.581057, 0.1550287, -0.9953656, 0, 0, 1, 1, 1,
-1.575703, -0.3983845, -2.240194, 1, 0, 0, 1, 1,
-1.572232, -0.6456442, -1.032775, 1, 0, 0, 1, 1,
-1.557639, 0.4857989, -2.019525, 1, 0, 0, 1, 1,
-1.535224, -2.099517, -4.162277, 1, 0, 0, 1, 1,
-1.530138, 0.02994223, -1.611524, 1, 0, 0, 1, 1,
-1.528895, 0.3117614, -2.782845, 0, 0, 0, 1, 1,
-1.522641, 0.06566013, -1.548508, 0, 0, 0, 1, 1,
-1.518329, 0.3567063, -2.591757, 0, 0, 0, 1, 1,
-1.493161, -0.4216499, -0.444652, 0, 0, 0, 1, 1,
-1.492556, 0.3976447, -2.098896, 0, 0, 0, 1, 1,
-1.483239, -1.476226, -1.509534, 0, 0, 0, 1, 1,
-1.47882, -1.713575, -3.128441, 0, 0, 0, 1, 1,
-1.475004, 0.2657311, -2.420306, 1, 1, 1, 1, 1,
-1.469188, -0.1124465, -2.809691, 1, 1, 1, 1, 1,
-1.467455, 0.4150527, -0.367577, 1, 1, 1, 1, 1,
-1.459269, -0.8534739, -1.563354, 1, 1, 1, 1, 1,
-1.442585, -1.726257, -4.38635, 1, 1, 1, 1, 1,
-1.429945, 0.3884743, -1.192956, 1, 1, 1, 1, 1,
-1.40722, -0.1711849, -3.257517, 1, 1, 1, 1, 1,
-1.397663, -2.21353, -2.888464, 1, 1, 1, 1, 1,
-1.38767, -1.082447, -3.510767, 1, 1, 1, 1, 1,
-1.383, 1.576349, 0.8827006, 1, 1, 1, 1, 1,
-1.382795, 0.4749856, -0.8156292, 1, 1, 1, 1, 1,
-1.379456, -0.7845135, -2.291763, 1, 1, 1, 1, 1,
-1.374417, -0.1886008, -3.366513, 1, 1, 1, 1, 1,
-1.364977, -1.488808, -3.343905, 1, 1, 1, 1, 1,
-1.350576, -1.86415, -3.620279, 1, 1, 1, 1, 1,
-1.349429, -2.11989, -2.677089, 0, 0, 1, 1, 1,
-1.346828, -0.7034892, -1.664396, 1, 0, 0, 1, 1,
-1.340107, -0.9083132, -2.3088, 1, 0, 0, 1, 1,
-1.33102, -2.562059, -1.677435, 1, 0, 0, 1, 1,
-1.318833, -2.031834, -2.162104, 1, 0, 0, 1, 1,
-1.306652, -0.446779, -0.1460028, 1, 0, 0, 1, 1,
-1.305984, -0.2516913, -0.6532244, 0, 0, 0, 1, 1,
-1.294533, -1.186476, -2.249149, 0, 0, 0, 1, 1,
-1.29384, 0.08837073, -1.74349, 0, 0, 0, 1, 1,
-1.292051, -0.7644235, -1.81539, 0, 0, 0, 1, 1,
-1.289925, -1.079401, -0.9188651, 0, 0, 0, 1, 1,
-1.279183, 2.122835, -0.8479217, 0, 0, 0, 1, 1,
-1.274391, 1.5012, -0.7777639, 0, 0, 0, 1, 1,
-1.271517, -0.555037, -2.051314, 1, 1, 1, 1, 1,
-1.268238, 0.04085452, -0.5813267, 1, 1, 1, 1, 1,
-1.26431, -0.4917177, -2.317557, 1, 1, 1, 1, 1,
-1.258186, 1.983704, -0.9735361, 1, 1, 1, 1, 1,
-1.249034, -0.3436503, -1.129962, 1, 1, 1, 1, 1,
-1.243711, -0.2262042, -2.100092, 1, 1, 1, 1, 1,
-1.237221, -0.4611952, -1.630487, 1, 1, 1, 1, 1,
-1.231645, -1.609879, -2.583595, 1, 1, 1, 1, 1,
-1.230021, 0.1198624, 1.122953, 1, 1, 1, 1, 1,
-1.229764, 0.52708, -0.07170285, 1, 1, 1, 1, 1,
-1.223207, -0.9227258, -2.442977, 1, 1, 1, 1, 1,
-1.214774, 0.2461846, -1.280645, 1, 1, 1, 1, 1,
-1.211572, 0.2194172, -2.451498, 1, 1, 1, 1, 1,
-1.206066, -1.068465, -1.054977, 1, 1, 1, 1, 1,
-1.203499, -0.3080128, -2.416134, 1, 1, 1, 1, 1,
-1.202477, 1.85561, -1.973196, 0, 0, 1, 1, 1,
-1.200981, -0.2833083, 0.02128354, 1, 0, 0, 1, 1,
-1.199206, 0.4602547, -0.1840293, 1, 0, 0, 1, 1,
-1.180723, 2.161364, -0.156223, 1, 0, 0, 1, 1,
-1.174333, 0.2547714, -4.845269, 1, 0, 0, 1, 1,
-1.170097, 0.6982803, -0.7240157, 1, 0, 0, 1, 1,
-1.162488, -1.235903, -3.170989, 0, 0, 0, 1, 1,
-1.160622, -0.07336956, -1.879111, 0, 0, 0, 1, 1,
-1.158913, 0.4978254, -1.502695, 0, 0, 0, 1, 1,
-1.146277, 1.736269, -0.8518683, 0, 0, 0, 1, 1,
-1.142353, -0.5394966, -2.563098, 0, 0, 0, 1, 1,
-1.138187, 0.9256138, 0.3063646, 0, 0, 0, 1, 1,
-1.133485, -1.546179, -2.342895, 0, 0, 0, 1, 1,
-1.131812, -0.4313504, -3.814858, 1, 1, 1, 1, 1,
-1.11352, -1.231346, -3.466714, 1, 1, 1, 1, 1,
-1.109599, 0.3420202, -1.14956, 1, 1, 1, 1, 1,
-1.106265, 0.77382, -0.7674165, 1, 1, 1, 1, 1,
-1.105378, -0.8802524, -3.194645, 1, 1, 1, 1, 1,
-1.105241, -0.1956397, -2.76804, 1, 1, 1, 1, 1,
-1.102085, 0.184518, -1.48281, 1, 1, 1, 1, 1,
-1.101508, -0.1606357, -0.5854182, 1, 1, 1, 1, 1,
-1.093902, -0.2635216, -3.431514, 1, 1, 1, 1, 1,
-1.092815, -0.01815386, -0.2054307, 1, 1, 1, 1, 1,
-1.087937, -1.334872, -1.505649, 1, 1, 1, 1, 1,
-1.087768, -1.070484, -2.352103, 1, 1, 1, 1, 1,
-1.083087, 0.9798124, -1.518323, 1, 1, 1, 1, 1,
-1.081299, -0.5491434, -3.324395, 1, 1, 1, 1, 1,
-1.075187, -0.2292438, -1.673948, 1, 1, 1, 1, 1,
-1.062969, -1.632487, -3.825917, 0, 0, 1, 1, 1,
-1.062286, 0.1381572, -2.884423, 1, 0, 0, 1, 1,
-1.05453, 0.8143184, -0.2031584, 1, 0, 0, 1, 1,
-1.05296, 0.52805, 0.6609207, 1, 0, 0, 1, 1,
-1.05275, 0.1514212, -1.427787, 1, 0, 0, 1, 1,
-1.050445, 0.4922967, 0.5429216, 1, 0, 0, 1, 1,
-1.043113, 2.034775, -2.226607, 0, 0, 0, 1, 1,
-1.039427, -1.34329, -1.488724, 0, 0, 0, 1, 1,
-1.038413, 0.5392902, -1.605588, 0, 0, 0, 1, 1,
-1.034407, -0.5961376, -2.2474, 0, 0, 0, 1, 1,
-1.033068, -2.391366, -2.840079, 0, 0, 0, 1, 1,
-1.03239, 0.5488765, -0.8110406, 0, 0, 0, 1, 1,
-1.03104, -1.219676, -2.571796, 0, 0, 0, 1, 1,
-1.025088, -0.40958, -1.492803, 1, 1, 1, 1, 1,
-1.024531, 1.195285, -1.189579, 1, 1, 1, 1, 1,
-1.020354, 0.5693466, -1.610626, 1, 1, 1, 1, 1,
-1.018328, -1.251184, -4.112227, 1, 1, 1, 1, 1,
-1.01505, 0.1074057, -2.109501, 1, 1, 1, 1, 1,
-0.9980817, 0.4674102, -1.109001, 1, 1, 1, 1, 1,
-0.9868373, 0.8288838, -2.113529, 1, 1, 1, 1, 1,
-0.9785166, 0.8577296, 0.7363961, 1, 1, 1, 1, 1,
-0.9668338, 0.4350734, -2.558316, 1, 1, 1, 1, 1,
-0.965682, 0.1233312, -2.309071, 1, 1, 1, 1, 1,
-0.9573686, 0.375112, -1.64215, 1, 1, 1, 1, 1,
-0.9326711, 1.160098, -2.613722, 1, 1, 1, 1, 1,
-0.9316126, -0.7783903, -2.821963, 1, 1, 1, 1, 1,
-0.9273909, -1.306351, -0.9344776, 1, 1, 1, 1, 1,
-0.9259358, 0.8245106, 1.895667, 1, 1, 1, 1, 1,
-0.9183101, -1.3922, -2.263141, 0, 0, 1, 1, 1,
-0.9150673, -0.968272, -2.30754, 1, 0, 0, 1, 1,
-0.9123805, 0.1621028, -0.2570537, 1, 0, 0, 1, 1,
-0.9063869, 1.056211, -1.455699, 1, 0, 0, 1, 1,
-0.904144, -0.4484506, -3.169516, 1, 0, 0, 1, 1,
-0.9004972, 1.541485, -0.5072415, 1, 0, 0, 1, 1,
-0.8983149, -0.5711524, -2.334766, 0, 0, 0, 1, 1,
-0.8974121, 1.113706, -2.615349, 0, 0, 0, 1, 1,
-0.8950876, -0.7696094, -2.328957, 0, 0, 0, 1, 1,
-0.8943669, 0.345815, -0.4847133, 0, 0, 0, 1, 1,
-0.890538, -1.560123, -2.410422, 0, 0, 0, 1, 1,
-0.8886126, 0.8766187, -0.3629929, 0, 0, 0, 1, 1,
-0.8811691, -0.4650138, -2.187111, 0, 0, 0, 1, 1,
-0.8785731, 0.859167, 0.6760748, 1, 1, 1, 1, 1,
-0.8772013, 0.785219, -1.059793, 1, 1, 1, 1, 1,
-0.8699933, 0.1063068, -1.943263, 1, 1, 1, 1, 1,
-0.8699759, 0.5446471, -1.402008, 1, 1, 1, 1, 1,
-0.8696634, 0.7321332, -0.8908013, 1, 1, 1, 1, 1,
-0.8693478, -0.9815492, -2.669498, 1, 1, 1, 1, 1,
-0.869069, 0.1920486, -1.300266, 1, 1, 1, 1, 1,
-0.8678797, 0.2075066, -1.011665, 1, 1, 1, 1, 1,
-0.8664333, -0.6516125, -1.074657, 1, 1, 1, 1, 1,
-0.8645585, 0.04939624, -0.7132818, 1, 1, 1, 1, 1,
-0.8527991, 1.517855, -0.2517106, 1, 1, 1, 1, 1,
-0.8503119, -0.3538913, -3.051181, 1, 1, 1, 1, 1,
-0.8498343, -2.208232, -2.6039, 1, 1, 1, 1, 1,
-0.8474385, -0.662147, -1.038283, 1, 1, 1, 1, 1,
-0.8431352, 1.53973, 0.3796054, 1, 1, 1, 1, 1,
-0.8401835, -0.17169, -2.212409, 0, 0, 1, 1, 1,
-0.8387124, -1.897359, -2.65189, 1, 0, 0, 1, 1,
-0.8327438, -0.6623407, -2.354239, 1, 0, 0, 1, 1,
-0.8309932, 0.3552371, -2.76284, 1, 0, 0, 1, 1,
-0.829195, -0.7817135, -0.3711759, 1, 0, 0, 1, 1,
-0.8274654, -0.8775248, -1.409369, 1, 0, 0, 1, 1,
-0.8244353, 1.01939, 0.2284653, 0, 0, 0, 1, 1,
-0.8222868, 1.303955, 0.6528569, 0, 0, 0, 1, 1,
-0.822244, 0.6081647, -3.19345, 0, 0, 0, 1, 1,
-0.8184277, 0.7929844, -0.5003181, 0, 0, 0, 1, 1,
-0.8156958, -1.791471, -0.7847795, 0, 0, 0, 1, 1,
-0.8147659, -0.4895072, -1.919587, 0, 0, 0, 1, 1,
-0.8125945, -1.529805, -3.394211, 0, 0, 0, 1, 1,
-0.8114645, -0.688887, -1.805553, 1, 1, 1, 1, 1,
-0.8081197, 0.2389972, -0.2481122, 1, 1, 1, 1, 1,
-0.8079531, 0.5638441, -2.320894, 1, 1, 1, 1, 1,
-0.8053519, 2.183828, -1.360734, 1, 1, 1, 1, 1,
-0.8022992, -0.87491, -2.907966, 1, 1, 1, 1, 1,
-0.8020014, 1.336443, -0.8303108, 1, 1, 1, 1, 1,
-0.8007178, -0.1361846, -2.367168, 1, 1, 1, 1, 1,
-0.8000036, -0.2552348, -1.798304, 1, 1, 1, 1, 1,
-0.7990387, 0.2675344, -0.7424013, 1, 1, 1, 1, 1,
-0.7989905, 1.205188, 0.3404802, 1, 1, 1, 1, 1,
-0.7963967, 0.3257678, -2.720488, 1, 1, 1, 1, 1,
-0.7930518, 0.9690046, -1.189699, 1, 1, 1, 1, 1,
-0.7930275, 1.903294, -1.216833, 1, 1, 1, 1, 1,
-0.7900938, 0.4440273, -0.4878545, 1, 1, 1, 1, 1,
-0.7900236, -0.0009609947, -1.112086, 1, 1, 1, 1, 1,
-0.7858443, 0.6289446, 0.05225752, 0, 0, 1, 1, 1,
-0.7820616, 0.179747, 0.1003113, 1, 0, 0, 1, 1,
-0.7716321, -0.5280091, -0.9038121, 1, 0, 0, 1, 1,
-0.7709174, 0.540234, -1.114186, 1, 0, 0, 1, 1,
-0.7640604, 0.2515999, 0.5731338, 1, 0, 0, 1, 1,
-0.7562622, -0.5472223, -1.579976, 1, 0, 0, 1, 1,
-0.7552798, 0.1252074, -0.9780588, 0, 0, 0, 1, 1,
-0.7514221, 0.7474089, -0.4142954, 0, 0, 0, 1, 1,
-0.7514132, 1.241512, -1.230116, 0, 0, 0, 1, 1,
-0.7367403, -0.3269225, -1.758975, 0, 0, 0, 1, 1,
-0.7316119, 0.6974139, 1.052708, 0, 0, 0, 1, 1,
-0.7302856, 0.02712001, -0.5516586, 0, 0, 0, 1, 1,
-0.7266054, -2.297055, -1.887134, 0, 0, 0, 1, 1,
-0.7249202, -0.8381376, -0.6972817, 1, 1, 1, 1, 1,
-0.7167865, 1.11761, -2.208258, 1, 1, 1, 1, 1,
-0.7139412, 0.1465025, -2.355411, 1, 1, 1, 1, 1,
-0.7129639, 0.4970017, -0.9368566, 1, 1, 1, 1, 1,
-0.7093937, -1.235034, -2.230917, 1, 1, 1, 1, 1,
-0.7043591, 0.9127102, -0.4975391, 1, 1, 1, 1, 1,
-0.6997778, -0.1985234, -1.796516, 1, 1, 1, 1, 1,
-0.6940897, 1.658407, -0.03788846, 1, 1, 1, 1, 1,
-0.6912802, 1.089159, -1.673765, 1, 1, 1, 1, 1,
-0.6895734, -0.6960229, -2.576124, 1, 1, 1, 1, 1,
-0.6862566, -1.606721, -1.129693, 1, 1, 1, 1, 1,
-0.6849167, -1.601112, -3.409199, 1, 1, 1, 1, 1,
-0.6823186, -0.9907097, -2.148437, 1, 1, 1, 1, 1,
-0.6798864, -1.138335, -2.659723, 1, 1, 1, 1, 1,
-0.6765136, -1.30145, -3.672708, 1, 1, 1, 1, 1,
-0.6732048, -1.33481, -3.003136, 0, 0, 1, 1, 1,
-0.6680561, 1.586053, -1.68183, 1, 0, 0, 1, 1,
-0.6600937, 0.6685202, -0.5358791, 1, 0, 0, 1, 1,
-0.6523014, 0.9781577, 0.3962993, 1, 0, 0, 1, 1,
-0.6457067, -0.6624851, -2.919114, 1, 0, 0, 1, 1,
-0.642799, 1.806118, 0.52288, 1, 0, 0, 1, 1,
-0.6419318, 0.2485045, -2.024334, 0, 0, 0, 1, 1,
-0.6402685, 1.01071, -0.4520406, 0, 0, 0, 1, 1,
-0.6395475, 0.5087175, -1.850878, 0, 0, 0, 1, 1,
-0.6393185, 0.767451, -0.5655432, 0, 0, 0, 1, 1,
-0.6385971, 0.56233, -1.753528, 0, 0, 0, 1, 1,
-0.6372274, -1.763744, -1.324568, 0, 0, 0, 1, 1,
-0.6356062, -0.485524, -1.918935, 0, 0, 0, 1, 1,
-0.6305647, -1.486145, -3.335727, 1, 1, 1, 1, 1,
-0.6298967, -0.08116695, -0.9760379, 1, 1, 1, 1, 1,
-0.6273655, 0.2324765, -0.06466672, 1, 1, 1, 1, 1,
-0.6246367, 1.04915, 0.07091162, 1, 1, 1, 1, 1,
-0.6241733, -0.9454584, -1.70828, 1, 1, 1, 1, 1,
-0.6222763, -0.01173764, -2.194008, 1, 1, 1, 1, 1,
-0.6210672, -1.203677, -2.586841, 1, 1, 1, 1, 1,
-0.618311, 0.5074106, -1.053014, 1, 1, 1, 1, 1,
-0.614694, -0.9602735, -2.535793, 1, 1, 1, 1, 1,
-0.6144888, -0.1290942, -2.995546, 1, 1, 1, 1, 1,
-0.6050627, -0.583833, -3.658771, 1, 1, 1, 1, 1,
-0.6039925, -1.246816, -2.002914, 1, 1, 1, 1, 1,
-0.6017185, -0.6704366, -3.223162, 1, 1, 1, 1, 1,
-0.600166, 0.589789, -0.815181, 1, 1, 1, 1, 1,
-0.5990117, 0.69682, -1.29906, 1, 1, 1, 1, 1,
-0.5946829, 0.2045893, -1.060127, 0, 0, 1, 1, 1,
-0.5926042, -0.4292969, -2.110435, 1, 0, 0, 1, 1,
-0.5869969, 0.8371307, -0.8090186, 1, 0, 0, 1, 1,
-0.5801791, -1.339673, -2.17528, 1, 0, 0, 1, 1,
-0.5784945, -0.2161737, -1.808691, 1, 0, 0, 1, 1,
-0.578043, 0.7715529, -1.12095, 1, 0, 0, 1, 1,
-0.5770805, 1.750892, -1.408288, 0, 0, 0, 1, 1,
-0.5732622, 1.786716, -0.4374169, 0, 0, 0, 1, 1,
-0.5709015, -0.2943662, -1.503124, 0, 0, 0, 1, 1,
-0.5682845, -0.4661168, -2.058415, 0, 0, 0, 1, 1,
-0.5609856, -1.264075, -4.603078, 0, 0, 0, 1, 1,
-0.5579609, 1.000975, -0.918672, 0, 0, 0, 1, 1,
-0.5552146, -1.218421, -2.835259, 0, 0, 0, 1, 1,
-0.5548627, 0.6032544, -2.028491, 1, 1, 1, 1, 1,
-0.5503508, -0.07709148, -0.8863722, 1, 1, 1, 1, 1,
-0.548928, 1.867233, -0.5050228, 1, 1, 1, 1, 1,
-0.5416507, 0.1502603, 0.2263189, 1, 1, 1, 1, 1,
-0.5408802, -0.1183977, -3.861002, 1, 1, 1, 1, 1,
-0.5373634, -0.05284041, -1.085768, 1, 1, 1, 1, 1,
-0.5342947, -0.6982521, -1.920633, 1, 1, 1, 1, 1,
-0.5319727, 1.120666, 0.2202975, 1, 1, 1, 1, 1,
-0.5276145, -2.746144, -3.012419, 1, 1, 1, 1, 1,
-0.5253806, 0.1065031, -3.600756, 1, 1, 1, 1, 1,
-0.5189511, 0.1483305, 0.7553558, 1, 1, 1, 1, 1,
-0.5186394, -0.2427538, -0.3982242, 1, 1, 1, 1, 1,
-0.5138032, -0.3710255, -2.498119, 1, 1, 1, 1, 1,
-0.4986843, -2.323945, -2.440293, 1, 1, 1, 1, 1,
-0.4892346, -0.6384526, -2.812546, 1, 1, 1, 1, 1,
-0.4862177, 0.895418, -0.4214031, 0, 0, 1, 1, 1,
-0.4845459, -0.7170388, -3.291553, 1, 0, 0, 1, 1,
-0.4827376, 0.7123182, -1.825276, 1, 0, 0, 1, 1,
-0.4785791, 1.142467, -1.318851, 1, 0, 0, 1, 1,
-0.4765924, 0.03354318, -1.141104, 1, 0, 0, 1, 1,
-0.4755164, 1.7802, -0.3142669, 1, 0, 0, 1, 1,
-0.4746019, 0.3581833, -0.9533018, 0, 0, 0, 1, 1,
-0.4743209, -0.6055925, -2.878428, 0, 0, 0, 1, 1,
-0.4641728, 0.4179007, -0.9577146, 0, 0, 0, 1, 1,
-0.4628949, -0.2711249, -1.31484, 0, 0, 0, 1, 1,
-0.4610448, 1.139824, -0.213918, 0, 0, 0, 1, 1,
-0.4579005, -1.329749, -4.01626, 0, 0, 0, 1, 1,
-0.4533488, 1.17702, -0.3326378, 0, 0, 0, 1, 1,
-0.4528038, -0.3749301, -2.624844, 1, 1, 1, 1, 1,
-0.4466204, -0.9256452, -4.580276, 1, 1, 1, 1, 1,
-0.446399, 0.3375922, -0.6109981, 1, 1, 1, 1, 1,
-0.442281, -1.903136, -4.799778, 1, 1, 1, 1, 1,
-0.4415776, -0.4105068, -1.971872, 1, 1, 1, 1, 1,
-0.4407164, -0.7056888, -2.22852, 1, 1, 1, 1, 1,
-0.4400989, 0.3569386, -0.7769178, 1, 1, 1, 1, 1,
-0.4386526, -0.2192703, -2.355651, 1, 1, 1, 1, 1,
-0.4385141, -1.276474, -4.295347, 1, 1, 1, 1, 1,
-0.4368363, -0.3085371, -3.093412, 1, 1, 1, 1, 1,
-0.4354204, -1.488968, -1.52027, 1, 1, 1, 1, 1,
-0.4336419, 1.401049, -0.4951423, 1, 1, 1, 1, 1,
-0.4295187, 1.423181, -0.426379, 1, 1, 1, 1, 1,
-0.4294038, 0.4144409, -1.327002, 1, 1, 1, 1, 1,
-0.4283864, 1.024151, 0.400116, 1, 1, 1, 1, 1,
-0.4252645, -0.7538275, -3.367779, 0, 0, 1, 1, 1,
-0.421846, -2.072874, -1.834153, 1, 0, 0, 1, 1,
-0.4216822, -0.1258551, -2.107961, 1, 0, 0, 1, 1,
-0.4200034, -1.285614, -1.481567, 1, 0, 0, 1, 1,
-0.4171721, 1.676078, -1.095816, 1, 0, 0, 1, 1,
-0.416274, -0.8342166, -3.464983, 1, 0, 0, 1, 1,
-0.4132384, 1.474624, -1.676417, 0, 0, 0, 1, 1,
-0.4103255, 0.6149793, -0.5718191, 0, 0, 0, 1, 1,
-0.4081972, -0.4257426, -1.396074, 0, 0, 0, 1, 1,
-0.4055167, 1.76239, -0.7238771, 0, 0, 0, 1, 1,
-0.4046955, 0.8287895, -0.3198875, 0, 0, 0, 1, 1,
-0.4044113, -0.09624638, -1.535801, 0, 0, 0, 1, 1,
-0.4036568, -0.6406082, -3.279359, 0, 0, 0, 1, 1,
-0.4009234, -1.332763, -2.160991, 1, 1, 1, 1, 1,
-0.4001391, -1.128935, -3.108163, 1, 1, 1, 1, 1,
-0.3989379, -0.4586334, 0.8050994, 1, 1, 1, 1, 1,
-0.3963712, 1.618415, -2.042557, 1, 1, 1, 1, 1,
-0.3901176, -2.679495, -1.502789, 1, 1, 1, 1, 1,
-0.3864284, 2.077223, -0.5180674, 1, 1, 1, 1, 1,
-0.3793218, 0.9319041, -1.302738, 1, 1, 1, 1, 1,
-0.3776509, 1.140974, 0.6068707, 1, 1, 1, 1, 1,
-0.3773673, 0.2924248, 0.4187443, 1, 1, 1, 1, 1,
-0.3767075, 1.201296, 0.424153, 1, 1, 1, 1, 1,
-0.3749602, -0.4079558, -1.377979, 1, 1, 1, 1, 1,
-0.3737561, 0.625936, 0.04523126, 1, 1, 1, 1, 1,
-0.3721586, -0.00911878, 0.06060479, 1, 1, 1, 1, 1,
-0.3598977, 1.178672, 0.5256009, 1, 1, 1, 1, 1,
-0.3559735, -1.540043, -3.119374, 1, 1, 1, 1, 1,
-0.3517666, 0.0931642, 0.02528619, 0, 0, 1, 1, 1,
-0.3504183, -0.3306436, -2.777868, 1, 0, 0, 1, 1,
-0.3489876, 1.702287, -0.02685921, 1, 0, 0, 1, 1,
-0.3424631, 0.5295946, -0.180142, 1, 0, 0, 1, 1,
-0.3418277, 0.5993306, 0.6706761, 1, 0, 0, 1, 1,
-0.341767, -2.063169, -3.113638, 1, 0, 0, 1, 1,
-0.3363824, 0.2197639, -1.581572, 0, 0, 0, 1, 1,
-0.3344581, -1.31863, -1.415387, 0, 0, 0, 1, 1,
-0.3322187, -0.02438443, -0.3345369, 0, 0, 0, 1, 1,
-0.3309607, 1.221861, -0.2266901, 0, 0, 0, 1, 1,
-0.3305376, 0.6205133, 0.5962378, 0, 0, 0, 1, 1,
-0.3183462, 0.1272883, -2.587971, 0, 0, 0, 1, 1,
-0.3152401, 0.1038514, -2.177385, 0, 0, 0, 1, 1,
-0.3105728, -0.4920511, -3.888691, 1, 1, 1, 1, 1,
-0.3011436, -0.6085552, -3.464598, 1, 1, 1, 1, 1,
-0.2997183, -0.08662228, -2.457846, 1, 1, 1, 1, 1,
-0.2976968, -0.8243895, -4.017627, 1, 1, 1, 1, 1,
-0.2905418, 0.597716, -1.022349, 1, 1, 1, 1, 1,
-0.2905234, -0.3011107, -2.452272, 1, 1, 1, 1, 1,
-0.2886323, -1.040694, -1.322543, 1, 1, 1, 1, 1,
-0.2876462, -0.9418007, -2.026754, 1, 1, 1, 1, 1,
-0.2860259, -0.8242626, -2.239543, 1, 1, 1, 1, 1,
-0.2846604, -0.3383116, -2.668908, 1, 1, 1, 1, 1,
-0.2842562, 1.554575, 0.09585136, 1, 1, 1, 1, 1,
-0.2836728, 1.832445, 1.092306, 1, 1, 1, 1, 1,
-0.2821489, -0.1903525, -2.781751, 1, 1, 1, 1, 1,
-0.2771156, 0.3506622, -0.3029813, 1, 1, 1, 1, 1,
-0.2721494, -0.4049087, -3.189985, 1, 1, 1, 1, 1,
-0.2717055, 1.42625, -0.3648973, 0, 0, 1, 1, 1,
-0.2683316, -0.7277163, -1.768981, 1, 0, 0, 1, 1,
-0.2671226, 1.777597, 0.9930465, 1, 0, 0, 1, 1,
-0.2654745, 1.208499, -1.548884, 1, 0, 0, 1, 1,
-0.2587637, -0.7021781, -2.771578, 1, 0, 0, 1, 1,
-0.2554769, 1.783569, 0.3476356, 1, 0, 0, 1, 1,
-0.2516454, -0.264679, -2.104295, 0, 0, 0, 1, 1,
-0.2503311, 0.4728991, -1.429291, 0, 0, 0, 1, 1,
-0.2473325, 0.3169222, -0.03466631, 0, 0, 0, 1, 1,
-0.24637, 0.5882496, 0.1414543, 0, 0, 0, 1, 1,
-0.2461861, -0.4674253, -1.511665, 0, 0, 0, 1, 1,
-0.243483, 1.565078, -1.003319, 0, 0, 0, 1, 1,
-0.2394179, 0.3542448, 1.747738, 0, 0, 0, 1, 1,
-0.2379941, 0.9413353, 0.701396, 1, 1, 1, 1, 1,
-0.232553, -0.1940487, -1.815955, 1, 1, 1, 1, 1,
-0.2321582, -0.9019543, -2.634667, 1, 1, 1, 1, 1,
-0.2297985, -0.4816887, -2.391465, 1, 1, 1, 1, 1,
-0.2288998, 0.6892523, -0.5489768, 1, 1, 1, 1, 1,
-0.2273579, -0.2488934, -2.520384, 1, 1, 1, 1, 1,
-0.2266753, -1.489082, -2.999256, 1, 1, 1, 1, 1,
-0.2227626, -0.2936864, -3.468302, 1, 1, 1, 1, 1,
-0.222331, -1.707434, -3.937602, 1, 1, 1, 1, 1,
-0.2221597, 0.0004092069, -2.599238, 1, 1, 1, 1, 1,
-0.2210399, 0.8743478, -0.4513494, 1, 1, 1, 1, 1,
-0.2195477, 1.862703, -0.5563623, 1, 1, 1, 1, 1,
-0.2159125, 0.2053735, -0.347474, 1, 1, 1, 1, 1,
-0.2144026, 0.9890909, -0.1256028, 1, 1, 1, 1, 1,
-0.2134899, -0.0784163, -1.733501, 1, 1, 1, 1, 1,
-0.213486, -0.3142884, -2.736812, 0, 0, 1, 1, 1,
-0.2079353, -1.446276, -3.003088, 1, 0, 0, 1, 1,
-0.2078407, 2.527232, 1.11167, 1, 0, 0, 1, 1,
-0.2066923, 1.858657, 1.228127, 1, 0, 0, 1, 1,
-0.2060626, 0.5686629, 0.7794498, 1, 0, 0, 1, 1,
-0.2040469, -0.4249514, -4.980255, 1, 0, 0, 1, 1,
-0.2002527, -1.189439, -1.527082, 0, 0, 0, 1, 1,
-0.1942746, -0.06112937, -1.376932, 0, 0, 0, 1, 1,
-0.189229, -0.6594038, -4.31542, 0, 0, 0, 1, 1,
-0.1875574, -1.583503, -3.506636, 0, 0, 0, 1, 1,
-0.1854883, 0.930755, 0.1318154, 0, 0, 0, 1, 1,
-0.1844744, 0.4464489, -0.4690938, 0, 0, 0, 1, 1,
-0.1828989, -0.4550246, -4.646977, 0, 0, 0, 1, 1,
-0.1821305, 2.832353, -1.014864, 1, 1, 1, 1, 1,
-0.1789551, 1.482011, -2.559963, 1, 1, 1, 1, 1,
-0.1760033, 0.6454418, -1.431196, 1, 1, 1, 1, 1,
-0.1734965, 0.8029601, -1.046121, 1, 1, 1, 1, 1,
-0.1732851, 0.4906969, -1.826742, 1, 1, 1, 1, 1,
-0.1730131, 0.6393831, -0.03752856, 1, 1, 1, 1, 1,
-0.1710273, -0.5413232, -4.139637, 1, 1, 1, 1, 1,
-0.1706526, -0.2989149, -4.305824, 1, 1, 1, 1, 1,
-0.1699382, -0.7628042, -2.486201, 1, 1, 1, 1, 1,
-0.1676394, 0.04708453, -1.123437, 1, 1, 1, 1, 1,
-0.166947, -1.234806, -3.900064, 1, 1, 1, 1, 1,
-0.1654758, -0.6834642, -2.731242, 1, 1, 1, 1, 1,
-0.1653242, 0.4698799, -1.670908, 1, 1, 1, 1, 1,
-0.165242, 2.154234, -0.5505927, 1, 1, 1, 1, 1,
-0.1642751, -0.9786329, -3.313045, 1, 1, 1, 1, 1,
-0.164136, 1.054317, 1.216162, 0, 0, 1, 1, 1,
-0.163933, -2.595782, -2.615664, 1, 0, 0, 1, 1,
-0.1611225, -0.3824604, -2.937058, 1, 0, 0, 1, 1,
-0.1558326, -0.6525867, -2.600803, 1, 0, 0, 1, 1,
-0.1503814, 0.7407637, 0.2058061, 1, 0, 0, 1, 1,
-0.1480186, -0.3364219, -2.834049, 1, 0, 0, 1, 1,
-0.1434719, 0.0526871, -1.322393, 0, 0, 0, 1, 1,
-0.1371906, 1.467706, 0.315799, 0, 0, 0, 1, 1,
-0.1336237, -0.7515832, -2.450395, 0, 0, 0, 1, 1,
-0.1312485, -1.922725, -2.691119, 0, 0, 0, 1, 1,
-0.126966, 0.7138044, 1.155639, 0, 0, 0, 1, 1,
-0.1250035, 1.691485, 0.7314607, 0, 0, 0, 1, 1,
-0.1235724, -0.4000832, -0.8523953, 0, 0, 0, 1, 1,
-0.1227873, 2.060472, 0.1572067, 1, 1, 1, 1, 1,
-0.1226256, -0.299991, -1.683497, 1, 1, 1, 1, 1,
-0.1216705, 0.9371812, -2.160769, 1, 1, 1, 1, 1,
-0.1214421, 1.694276, -1.346514, 1, 1, 1, 1, 1,
-0.1194562, 0.522504, -0.6972552, 1, 1, 1, 1, 1,
-0.1177736, 0.6749191, -2.220824, 1, 1, 1, 1, 1,
-0.1166446, 0.03327248, -0.1186966, 1, 1, 1, 1, 1,
-0.1114787, 0.9079744, 1.170397, 1, 1, 1, 1, 1,
-0.1076177, 0.7660832, 0.8266746, 1, 1, 1, 1, 1,
-0.1073855, 0.1376428, -0.362904, 1, 1, 1, 1, 1,
-0.1055747, -0.6230128, -3.470604, 1, 1, 1, 1, 1,
-0.1054162, -1.018305, -4.000155, 1, 1, 1, 1, 1,
-0.104385, -1.69822, -3.521534, 1, 1, 1, 1, 1,
-0.1000737, 2.173389, -0.8487256, 1, 1, 1, 1, 1,
-0.09967411, 1.344705, -0.9111008, 1, 1, 1, 1, 1,
-0.09614539, -0.7027631, -2.937466, 0, 0, 1, 1, 1,
-0.09403768, 1.153794, 0.3145694, 1, 0, 0, 1, 1,
-0.09272461, 0.2075558, 0.2357967, 1, 0, 0, 1, 1,
-0.0851797, 0.7432234, -0.3586637, 1, 0, 0, 1, 1,
-0.08414948, 2.355099, 0.9915193, 1, 0, 0, 1, 1,
-0.08357166, -1.168182, -4.750644, 1, 0, 0, 1, 1,
-0.07543278, -0.1412996, -1.792688, 0, 0, 0, 1, 1,
-0.07106449, -1.077628, -2.202387, 0, 0, 0, 1, 1,
-0.0669675, 0.03271687, 0.3537025, 0, 0, 0, 1, 1,
-0.06269046, -0.9667687, -2.846527, 0, 0, 0, 1, 1,
-0.06116195, 0.7686646, -0.6512921, 0, 0, 0, 1, 1,
-0.05877065, 0.2405708, 1.10442, 0, 0, 0, 1, 1,
-0.05845441, -0.1116293, -2.790613, 0, 0, 0, 1, 1,
-0.0522552, -0.6074931, -2.628963, 1, 1, 1, 1, 1,
-0.05221919, 1.559502, 0.3356335, 1, 1, 1, 1, 1,
-0.05011318, 0.2871214, -0.08404463, 1, 1, 1, 1, 1,
-0.0498559, 0.1648448, 0.422496, 1, 1, 1, 1, 1,
-0.04480317, 0.4322668, -1.898668, 1, 1, 1, 1, 1,
-0.04033831, -1.152791, -1.803805, 1, 1, 1, 1, 1,
-0.03305526, -1.208149, -1.199718, 1, 1, 1, 1, 1,
-0.0307354, -1.248891, -4.06525, 1, 1, 1, 1, 1,
-0.02945217, 0.6634246, -0.8534707, 1, 1, 1, 1, 1,
-0.02057009, 1.327957, 0.2907426, 1, 1, 1, 1, 1,
-0.01585162, 3.239326, -1.654262, 1, 1, 1, 1, 1,
-0.0154224, 0.3829726, -0.2142943, 1, 1, 1, 1, 1,
-0.01517953, -0.7317181, -4.386813, 1, 1, 1, 1, 1,
-0.01474867, -0.2127118, -2.835965, 1, 1, 1, 1, 1,
-0.01443579, -0.8351808, -2.579515, 1, 1, 1, 1, 1,
-0.01385507, 1.259963, -0.3649178, 0, 0, 1, 1, 1,
-0.008795959, -1.423057, -5.112162, 1, 0, 0, 1, 1,
-0.007607668, -0.09543773, -3.312337, 1, 0, 0, 1, 1,
-0.006153973, 0.4820461, -0.4717852, 1, 0, 0, 1, 1,
-0.005605898, -2.486696, -3.430247, 1, 0, 0, 1, 1,
-0.005122953, 0.7828789, -1.414371, 1, 0, 0, 1, 1,
-0.001586741, -0.3960868, -3.559835, 0, 0, 0, 1, 1,
-0.0004746485, 1.280521, 1.276871, 0, 0, 0, 1, 1,
0.001626228, 0.6736929, 1.766468, 0, 0, 0, 1, 1,
0.004300738, 0.6615993, -1.210389, 0, 0, 0, 1, 1,
0.004774236, -0.513557, 5.535696, 0, 0, 0, 1, 1,
0.007459952, 0.5380364, -1.834643, 0, 0, 0, 1, 1,
0.0163782, -0.202044, 4.227388, 0, 0, 0, 1, 1,
0.02298818, -0.7217236, 1.808601, 1, 1, 1, 1, 1,
0.02380338, -1.850925, 4.185407, 1, 1, 1, 1, 1,
0.02643455, 1.991515, -0.2279979, 1, 1, 1, 1, 1,
0.02702328, 0.7621472, -0.1336502, 1, 1, 1, 1, 1,
0.03851722, -0.5061244, 0.9702537, 1, 1, 1, 1, 1,
0.04045609, -0.1900325, 0.5667924, 1, 1, 1, 1, 1,
0.04286096, -1.304206, 2.843787, 1, 1, 1, 1, 1,
0.04729378, -1.358961, 2.606889, 1, 1, 1, 1, 1,
0.0489755, 0.910153, 1.076827, 1, 1, 1, 1, 1,
0.05183924, -1.142979, 3.411281, 1, 1, 1, 1, 1,
0.05198159, 1.675151, 0.2023667, 1, 1, 1, 1, 1,
0.0525715, -1.597875, 4.205165, 1, 1, 1, 1, 1,
0.05316681, -0.7153391, 3.298029, 1, 1, 1, 1, 1,
0.05852792, -0.2948413, 3.495887, 1, 1, 1, 1, 1,
0.05870418, 1.243733, 0.7093444, 1, 1, 1, 1, 1,
0.06558181, 0.1059422, -1.540828, 0, 0, 1, 1, 1,
0.06867589, 0.6040221, 0.4832994, 1, 0, 0, 1, 1,
0.07709444, -0.591512, 3.291253, 1, 0, 0, 1, 1,
0.07797895, -0.06588026, 2.945239, 1, 0, 0, 1, 1,
0.07995752, -0.2641634, 2.666758, 1, 0, 0, 1, 1,
0.08344478, -0.3775785, 2.681157, 1, 0, 0, 1, 1,
0.085119, -1.079689, 3.335382, 0, 0, 0, 1, 1,
0.08567322, -0.7568002, 3.445772, 0, 0, 0, 1, 1,
0.09053588, -0.1136197, 1.157379, 0, 0, 0, 1, 1,
0.1072413, -0.4954327, 3.166112, 0, 0, 0, 1, 1,
0.1090388, 0.5635799, 1.298653, 0, 0, 0, 1, 1,
0.1145353, -0.0318239, 2.775158, 0, 0, 0, 1, 1,
0.1163298, 0.8433809, 0.1270103, 0, 0, 0, 1, 1,
0.1185791, 0.6882914, 1.126687, 1, 1, 1, 1, 1,
0.1185814, 0.876315, 1.204576, 1, 1, 1, 1, 1,
0.1222578, 1.333374, 1.621262, 1, 1, 1, 1, 1,
0.1238634, -1.756891, 2.654323, 1, 1, 1, 1, 1,
0.1256214, 0.3983445, 0.3139901, 1, 1, 1, 1, 1,
0.1278087, 1.443203, -1.573297, 1, 1, 1, 1, 1,
0.1282417, -0.1143603, 0.7933054, 1, 1, 1, 1, 1,
0.1318142, -1.157206, 2.46343, 1, 1, 1, 1, 1,
0.1330414, -1.333437, 0.8200435, 1, 1, 1, 1, 1,
0.1376302, -1.196135, 4.549111, 1, 1, 1, 1, 1,
0.1378255, 0.3803894, 0.4558038, 1, 1, 1, 1, 1,
0.1381809, 0.5996666, 0.3706294, 1, 1, 1, 1, 1,
0.1432275, 1.189003, 0.5330917, 1, 1, 1, 1, 1,
0.1449594, 0.146782, -1.381066, 1, 1, 1, 1, 1,
0.1458811, -0.1597552, 3.088084, 1, 1, 1, 1, 1,
0.1460618, -0.09136536, 0.621278, 0, 0, 1, 1, 1,
0.1476246, 0.1572884, 0.5641083, 1, 0, 0, 1, 1,
0.156924, -0.3925395, 1.997552, 1, 0, 0, 1, 1,
0.1590376, -1.445909, 2.878659, 1, 0, 0, 1, 1,
0.1598372, 0.4087761, -0.05461807, 1, 0, 0, 1, 1,
0.1627803, -2.518682, 2.401178, 1, 0, 0, 1, 1,
0.1638685, 0.9226796, -0.3847488, 0, 0, 0, 1, 1,
0.1644521, 1.647587, 1.844683, 0, 0, 0, 1, 1,
0.164622, -0.9267521, 1.010304, 0, 0, 0, 1, 1,
0.1690056, 0.6018078, -0.7695462, 0, 0, 0, 1, 1,
0.1696569, 0.3159367, -0.8231685, 0, 0, 0, 1, 1,
0.1715981, 1.382377, 0.6792727, 0, 0, 0, 1, 1,
0.1782567, -0.2076785, 5.586044, 0, 0, 0, 1, 1,
0.1837947, -0.6036167, 4.133439, 1, 1, 1, 1, 1,
0.1867323, -0.4145122, 2.683301, 1, 1, 1, 1, 1,
0.1907651, 1.223391, -0.4597565, 1, 1, 1, 1, 1,
0.1946625, 2.643198, 0.4806641, 1, 1, 1, 1, 1,
0.1955784, 1.265034, -0.4382023, 1, 1, 1, 1, 1,
0.1978257, -1.639475, 2.96591, 1, 1, 1, 1, 1,
0.2028619, 0.5371663, 1.24879, 1, 1, 1, 1, 1,
0.2045961, 0.6748957, 1.024973, 1, 1, 1, 1, 1,
0.2058887, -0.5998276, 4.307639, 1, 1, 1, 1, 1,
0.2061035, 1.960184, -1.546593, 1, 1, 1, 1, 1,
0.2072053, 0.4738217, 0.5205584, 1, 1, 1, 1, 1,
0.2104681, -0.7393808, 4.322356, 1, 1, 1, 1, 1,
0.2135668, 0.2348917, -0.1680996, 1, 1, 1, 1, 1,
0.2171499, 0.5685464, -0.4165401, 1, 1, 1, 1, 1,
0.2232419, -0.0178814, 1.774637, 1, 1, 1, 1, 1,
0.2251136, -0.09879228, 3.690974, 0, 0, 1, 1, 1,
0.2269194, 0.2972369, 0.6792189, 1, 0, 0, 1, 1,
0.2315558, -1.882194, 2.094146, 1, 0, 0, 1, 1,
0.2319601, 0.3263925, 0.3924358, 1, 0, 0, 1, 1,
0.2328544, 0.5198846, 0.04904938, 1, 0, 0, 1, 1,
0.2343277, -0.5289534, 2.792057, 1, 0, 0, 1, 1,
0.2390339, 1.285782, 0.2096692, 0, 0, 0, 1, 1,
0.2399141, -0.8718333, 3.402734, 0, 0, 0, 1, 1,
0.2410335, -0.7730205, 1.845695, 0, 0, 0, 1, 1,
0.2421014, -0.4577101, 0.7678972, 0, 0, 0, 1, 1,
0.2440006, 0.3419364, 0.1495956, 0, 0, 0, 1, 1,
0.2473183, 0.460243, 1.018627, 0, 0, 0, 1, 1,
0.2484203, -1.711624, 3.835669, 0, 0, 0, 1, 1,
0.24853, 2.03451, 0.2831822, 1, 1, 1, 1, 1,
0.2489304, -0.2542107, 1.049383, 1, 1, 1, 1, 1,
0.2498819, 0.8837177, 1.499125, 1, 1, 1, 1, 1,
0.2544074, 0.4326804, 0.2086563, 1, 1, 1, 1, 1,
0.2547357, -0.5696893, 1.568118, 1, 1, 1, 1, 1,
0.2551311, -0.6163061, 2.085976, 1, 1, 1, 1, 1,
0.2552988, 1.459053, -0.3604244, 1, 1, 1, 1, 1,
0.2665457, 0.3440939, 0.7959171, 1, 1, 1, 1, 1,
0.2741575, -1.117761, 4.263409, 1, 1, 1, 1, 1,
0.2906311, 0.4529452, 1.30099, 1, 1, 1, 1, 1,
0.2921756, 0.5833102, -0.276064, 1, 1, 1, 1, 1,
0.2932202, -1.063565, 1.681129, 1, 1, 1, 1, 1,
0.2994526, -0.7131879, 3.904275, 1, 1, 1, 1, 1,
0.2996357, 1.641833, 0.8258006, 1, 1, 1, 1, 1,
0.3058912, 1.657258, -0.2237065, 1, 1, 1, 1, 1,
0.3088236, -1.014657, 2.494361, 0, 0, 1, 1, 1,
0.3091663, -1.182515, 2.881286, 1, 0, 0, 1, 1,
0.3100709, 0.4091097, 0.77377, 1, 0, 0, 1, 1,
0.3113937, 1.53498, -0.08266529, 1, 0, 0, 1, 1,
0.313666, 0.05612072, 0.9387403, 1, 0, 0, 1, 1,
0.3143866, -1.005195, 1.723696, 1, 0, 0, 1, 1,
0.3187437, 0.4144399, 1.416313, 0, 0, 0, 1, 1,
0.3198324, 2.275621, -0.09660793, 0, 0, 0, 1, 1,
0.3228165, 0.308768, 0.66381, 0, 0, 0, 1, 1,
0.3235045, -2.169134, 3.260818, 0, 0, 0, 1, 1,
0.3235766, 0.1186677, 0.9782928, 0, 0, 0, 1, 1,
0.325597, -0.7435273, 2.383725, 0, 0, 0, 1, 1,
0.328307, -1.184072, 2.906304, 0, 0, 0, 1, 1,
0.3293252, -2.218247, 3.552417, 1, 1, 1, 1, 1,
0.3311161, 2.370023, 0.2987953, 1, 1, 1, 1, 1,
0.3346632, 0.1364118, 1.919926, 1, 1, 1, 1, 1,
0.3360066, -0.3068118, 2.719051, 1, 1, 1, 1, 1,
0.336316, 1.330945, 0.9835985, 1, 1, 1, 1, 1,
0.3365844, 1.869028, 0.773582, 1, 1, 1, 1, 1,
0.3372277, 0.9998296, 1.265342, 1, 1, 1, 1, 1,
0.3429953, 0.7830709, -0.8444822, 1, 1, 1, 1, 1,
0.343362, 1.661102, -1.453823, 1, 1, 1, 1, 1,
0.3443474, -0.6388111, 2.508655, 1, 1, 1, 1, 1,
0.3449659, 1.253944, -1.212331, 1, 1, 1, 1, 1,
0.3470719, -0.6196571, 2.78253, 1, 1, 1, 1, 1,
0.3476714, -0.786891, 2.369952, 1, 1, 1, 1, 1,
0.3479294, 0.382034, 0.8957849, 1, 1, 1, 1, 1,
0.3518398, -1.162137, 2.533147, 1, 1, 1, 1, 1,
0.3530802, 1.699353, 0.6363053, 0, 0, 1, 1, 1,
0.3561014, -0.4293128, 2.228844, 1, 0, 0, 1, 1,
0.3568378, 0.8869777, -0.1032979, 1, 0, 0, 1, 1,
0.3580385, -0.1824681, 2.445026, 1, 0, 0, 1, 1,
0.3671191, 0.445623, -0.4305915, 1, 0, 0, 1, 1,
0.3716643, 0.4089664, 1.104585, 1, 0, 0, 1, 1,
0.3803003, 1.87868, -0.8229382, 0, 0, 0, 1, 1,
0.3858643, 0.09303295, 2.623534, 0, 0, 0, 1, 1,
0.3867881, 0.3862329, 1.019859, 0, 0, 0, 1, 1,
0.3869832, 1.203986, 1.047307, 0, 0, 0, 1, 1,
0.3870407, 1.503957, 0.05659368, 0, 0, 0, 1, 1,
0.3889075, 0.8580986, 0.2709107, 0, 0, 0, 1, 1,
0.3912094, -2.396699, 3.058974, 0, 0, 0, 1, 1,
0.3914754, 1.73252, -1.09201, 1, 1, 1, 1, 1,
0.3926505, -3.225526, 2.690237, 1, 1, 1, 1, 1,
0.3948965, 0.3754167, 1.354679, 1, 1, 1, 1, 1,
0.3963245, -1.327976, 2.642004, 1, 1, 1, 1, 1,
0.3995609, -1.584053, 4.246778, 1, 1, 1, 1, 1,
0.4011844, -1.235752, 1.075772, 1, 1, 1, 1, 1,
0.4048633, 0.369243, 3.047588, 1, 1, 1, 1, 1,
0.4057924, -1.032552, 4.589352, 1, 1, 1, 1, 1,
0.4108716, -1.576604, 1.732578, 1, 1, 1, 1, 1,
0.4116224, -0.2793844, 3.315399, 1, 1, 1, 1, 1,
0.4141718, -1.678684, 2.312572, 1, 1, 1, 1, 1,
0.415541, -0.5183931, 1.286446, 1, 1, 1, 1, 1,
0.416478, -0.1001192, 0.4962751, 1, 1, 1, 1, 1,
0.4257667, -0.7590373, 1.940833, 1, 1, 1, 1, 1,
0.4259973, 1.110058, 1.007017, 1, 1, 1, 1, 1,
0.4271126, 0.6828597, 1.495519, 0, 0, 1, 1, 1,
0.4286212, 1.500458, -0.9924303, 1, 0, 0, 1, 1,
0.4297642, 0.5351319, -0.06286547, 1, 0, 0, 1, 1,
0.4348671, 0.4160296, 1.141082, 1, 0, 0, 1, 1,
0.4384734, 0.7757189, 0.5445051, 1, 0, 0, 1, 1,
0.4445937, -0.2094843, 3.475026, 1, 0, 0, 1, 1,
0.4487465, -0.05746706, 3.847857, 0, 0, 0, 1, 1,
0.4492396, 0.3720333, 1.876811, 0, 0, 0, 1, 1,
0.4532915, 0.7112721, 0.7566891, 0, 0, 0, 1, 1,
0.4547395, 0.4138433, 1.451302, 0, 0, 0, 1, 1,
0.457868, 0.2662411, 0.545579, 0, 0, 0, 1, 1,
0.4661697, 0.6417038, 1.327573, 0, 0, 0, 1, 1,
0.4724443, -0.7593605, 1.941623, 0, 0, 0, 1, 1,
0.4784228, -0.318413, 3.423547, 1, 1, 1, 1, 1,
0.4822985, 0.5739263, -0.7781423, 1, 1, 1, 1, 1,
0.484039, 0.6640811, 1.525387, 1, 1, 1, 1, 1,
0.4887919, -1.174567, 1.188351, 1, 1, 1, 1, 1,
0.4894063, 1.124052, 0.74981, 1, 1, 1, 1, 1,
0.4902647, -0.6534071, 3.158135, 1, 1, 1, 1, 1,
0.4978142, -0.5300401, 2.304485, 1, 1, 1, 1, 1,
0.5013283, -0.1473875, 2.307082, 1, 1, 1, 1, 1,
0.5027258, 1.77173, 0.9439037, 1, 1, 1, 1, 1,
0.5040579, 0.1843596, -0.06334172, 1, 1, 1, 1, 1,
0.5059154, 0.6774585, 1.648761, 1, 1, 1, 1, 1,
0.5076504, -0.09353344, 2.275783, 1, 1, 1, 1, 1,
0.5096735, -0.5109721, 3.094403, 1, 1, 1, 1, 1,
0.5133576, 0.06962967, 0.2551818, 1, 1, 1, 1, 1,
0.5191886, -0.392738, 1.281067, 1, 1, 1, 1, 1,
0.5200652, 0.4808874, -0.2956153, 0, 0, 1, 1, 1,
0.5220307, -0.2514122, 2.731072, 1, 0, 0, 1, 1,
0.5269094, -0.8154339, 2.970703, 1, 0, 0, 1, 1,
0.5373532, 0.8221166, 0.7527944, 1, 0, 0, 1, 1,
0.542112, 0.8979305, 0.599897, 1, 0, 0, 1, 1,
0.5449219, -1.792236, 4.037563, 1, 0, 0, 1, 1,
0.5498633, 0.7782003, 0.5984545, 0, 0, 0, 1, 1,
0.5505408, -0.7612224, 3.603828, 0, 0, 0, 1, 1,
0.5573846, -0.0833849, 1.17575, 0, 0, 0, 1, 1,
0.559174, 1.423393, 0.08900096, 0, 0, 0, 1, 1,
0.5596606, 0.864029, 1.772998, 0, 0, 0, 1, 1,
0.5597273, 1.048346, 0.9718235, 0, 0, 0, 1, 1,
0.5663725, -0.3204268, 2.739722, 0, 0, 0, 1, 1,
0.5716259, 0.3992088, 2.36705, 1, 1, 1, 1, 1,
0.5770374, 1.830118, 1.536157, 1, 1, 1, 1, 1,
0.5771934, -0.3795891, 2.427113, 1, 1, 1, 1, 1,
0.5833773, 0.4595033, 0.3127348, 1, 1, 1, 1, 1,
0.5885053, 0.3570852, 2.047208, 1, 1, 1, 1, 1,
0.589047, -0.8161039, 3.223542, 1, 1, 1, 1, 1,
0.5899507, -0.4810662, 2.493119, 1, 1, 1, 1, 1,
0.5907307, -0.7984725, 3.288891, 1, 1, 1, 1, 1,
0.5914894, 0.8352594, 2.88836, 1, 1, 1, 1, 1,
0.5922465, -2.183954, 4.430017, 1, 1, 1, 1, 1,
0.5939381, -2.832183, 3.070476, 1, 1, 1, 1, 1,
0.5945569, 0.4818312, 0.1711362, 1, 1, 1, 1, 1,
0.5955358, -0.3654613, -0.5047834, 1, 1, 1, 1, 1,
0.5958875, 0.217428, -0.7505212, 1, 1, 1, 1, 1,
0.5966672, 1.521146, 0.8843259, 1, 1, 1, 1, 1,
0.5978743, -1.239424, 3.072527, 0, 0, 1, 1, 1,
0.6055315, 0.01657051, 0.7015438, 1, 0, 0, 1, 1,
0.6101045, -1.025122, 2.367107, 1, 0, 0, 1, 1,
0.6119106, 1.013433, -0.4789206, 1, 0, 0, 1, 1,
0.6170965, 0.0987841, 1.146967, 1, 0, 0, 1, 1,
0.6194464, 0.2615448, 0.5993389, 1, 0, 0, 1, 1,
0.6196404, 0.6586292, 0.08305406, 0, 0, 0, 1, 1,
0.6209403, 1.578007, 0.4594545, 0, 0, 0, 1, 1,
0.625683, -0.407591, 0.6406788, 0, 0, 0, 1, 1,
0.627027, -0.9346143, 3.199266, 0, 0, 0, 1, 1,
0.6312832, -0.3398228, 1.772136, 0, 0, 0, 1, 1,
0.6325306, 0.7335723, 0.8776808, 0, 0, 0, 1, 1,
0.6375285, -0.5872225, 3.049, 0, 0, 0, 1, 1,
0.6413704, 0.5329636, 0.3379813, 1, 1, 1, 1, 1,
0.6425454, 0.8206049, 0.9709917, 1, 1, 1, 1, 1,
0.6514667, -0.4070725, 0.8173483, 1, 1, 1, 1, 1,
0.6522618, -0.5687614, 3.088032, 1, 1, 1, 1, 1,
0.6534423, 1.068603, 0.447982, 1, 1, 1, 1, 1,
0.6539493, -1.021083, 4.229721, 1, 1, 1, 1, 1,
0.654807, -0.4885331, 2.07565, 1, 1, 1, 1, 1,
0.6608769, 0.4970176, 2.528491, 1, 1, 1, 1, 1,
0.6631752, 2.051862, 1.769172, 1, 1, 1, 1, 1,
0.6733373, 0.4063703, 0.7758023, 1, 1, 1, 1, 1,
0.6740231, -1.164949, 1.947462, 1, 1, 1, 1, 1,
0.6754806, 0.9191674, 1.215549, 1, 1, 1, 1, 1,
0.6766987, -0.1193946, 3.221103, 1, 1, 1, 1, 1,
0.6768638, 0.2630495, 0.389367, 1, 1, 1, 1, 1,
0.6787252, 0.706476, 1.581632, 1, 1, 1, 1, 1,
0.6807959, -0.6893158, 1.004379, 0, 0, 1, 1, 1,
0.6945911, 0.3068883, 0.2377676, 1, 0, 0, 1, 1,
0.7004052, -1.200277, 2.656553, 1, 0, 0, 1, 1,
0.7017954, 0.3096142, 1.653282, 1, 0, 0, 1, 1,
0.7066883, 1.435686, -0.744377, 1, 0, 0, 1, 1,
0.7086834, 0.5706662, -0.8131263, 1, 0, 0, 1, 1,
0.7093549, -0.5766549, 0.9239293, 0, 0, 0, 1, 1,
0.7099256, 1.302434, 0.7437928, 0, 0, 0, 1, 1,
0.7125055, 0.1320056, 0.3970662, 0, 0, 0, 1, 1,
0.7142343, 0.9436772, -0.1079333, 0, 0, 0, 1, 1,
0.7162046, -0.7740726, 3.550254, 0, 0, 0, 1, 1,
0.7173735, 0.1713255, 1.094981, 0, 0, 0, 1, 1,
0.7235316, 1.782075, 0.07093125, 0, 0, 0, 1, 1,
0.7249037, 1.311855, -1.000329, 1, 1, 1, 1, 1,
0.7249384, -1.665081, 2.014541, 1, 1, 1, 1, 1,
0.7289857, -2.190515, 1.633433, 1, 1, 1, 1, 1,
0.7314215, 0.8225, -0.3476539, 1, 1, 1, 1, 1,
0.7321074, 0.01345801, -0.2683267, 1, 1, 1, 1, 1,
0.7353339, 0.5237499, 1.634267, 1, 1, 1, 1, 1,
0.737066, -0.9003949, 2.200409, 1, 1, 1, 1, 1,
0.741552, -0.02015368, 2.998532, 1, 1, 1, 1, 1,
0.7434544, 0.7230316, 0.4389717, 1, 1, 1, 1, 1,
0.7437799, -0.6454409, 1.232772, 1, 1, 1, 1, 1,
0.7455204, 0.749788, -0.2195394, 1, 1, 1, 1, 1,
0.7504238, -0.4727949, 3.644393, 1, 1, 1, 1, 1,
0.7522404, -0.2433283, 1.244829, 1, 1, 1, 1, 1,
0.7525163, 0.07750066, 2.132176, 1, 1, 1, 1, 1,
0.755386, 0.3548316, 2.193149, 1, 1, 1, 1, 1,
0.7624812, 1.936271, -2.218042, 0, 0, 1, 1, 1,
0.7632126, -0.2739819, 1.785025, 1, 0, 0, 1, 1,
0.7667323, -1.461518, 3.793053, 1, 0, 0, 1, 1,
0.7671397, 1.26176, 3.13145, 1, 0, 0, 1, 1,
0.7704289, -0.4292415, 1.617591, 1, 0, 0, 1, 1,
0.7735361, -0.06593423, -0.5135101, 1, 0, 0, 1, 1,
0.7747484, 0.009574944, 2.175919, 0, 0, 0, 1, 1,
0.7748564, -2.856166, 3.406118, 0, 0, 0, 1, 1,
0.781527, -0.710142, 3.367378, 0, 0, 0, 1, 1,
0.7877423, 1.457635, -0.08130073, 0, 0, 0, 1, 1,
0.8164106, -1.719203, 1.7669, 0, 0, 0, 1, 1,
0.8172399, -0.06265278, 1.894126, 0, 0, 0, 1, 1,
0.8182793, 1.609732, 0.5040425, 0, 0, 0, 1, 1,
0.8271151, 2.647317, -0.7405813, 1, 1, 1, 1, 1,
0.8285931, 0.733507, 1.959396, 1, 1, 1, 1, 1,
0.8327968, -1.44629, 2.234775, 1, 1, 1, 1, 1,
0.8360522, -1.627525, 4.210965, 1, 1, 1, 1, 1,
0.8370019, -0.6687639, 0.4354606, 1, 1, 1, 1, 1,
0.8379622, -0.1759183, 2.037646, 1, 1, 1, 1, 1,
0.8398368, -0.9571412, 3.311933, 1, 1, 1, 1, 1,
0.8428898, 2.069084, 0.6305078, 1, 1, 1, 1, 1,
0.8444567, 1.752994, 0.5145439, 1, 1, 1, 1, 1,
0.8470508, 0.6672473, 0.8505141, 1, 1, 1, 1, 1,
0.8477953, -0.9296414, 0.294625, 1, 1, 1, 1, 1,
0.8478622, -0.5806203, 2.295895, 1, 1, 1, 1, 1,
0.8483732, 0.1006988, 2.04306, 1, 1, 1, 1, 1,
0.8523419, 1.438866, 0.6626306, 1, 1, 1, 1, 1,
0.8548178, 0.238361, 2.684735, 1, 1, 1, 1, 1,
0.8591715, 0.9761325, 1.348974, 0, 0, 1, 1, 1,
0.8663434, -0.4995059, 2.768237, 1, 0, 0, 1, 1,
0.8719735, 0.394917, 2.931997, 1, 0, 0, 1, 1,
0.8770027, 2.29383, 0.5914309, 1, 0, 0, 1, 1,
0.8800835, -1.02051, 2.20349, 1, 0, 0, 1, 1,
0.8840353, 0.07598529, 2.345265, 1, 0, 0, 1, 1,
0.8852465, 0.6172683, 1.000557, 0, 0, 0, 1, 1,
0.8983897, -0.9715152, 2.953258, 0, 0, 0, 1, 1,
0.8989821, -0.1991474, 1.911075, 0, 0, 0, 1, 1,
0.9013289, -0.1490266, 2.243924, 0, 0, 0, 1, 1,
0.9062631, 0.9065766, -0.04130184, 0, 0, 0, 1, 1,
0.9086723, 0.713942, 0.1559022, 0, 0, 0, 1, 1,
0.9111328, -1.222505, 3.360321, 0, 0, 0, 1, 1,
0.9144216, -1.279123, 2.313922, 1, 1, 1, 1, 1,
0.9152079, -0.9300279, 3.211249, 1, 1, 1, 1, 1,
0.9194435, -0.001290939, 3.233246, 1, 1, 1, 1, 1,
0.9243655, -1.307895, 1.326062, 1, 1, 1, 1, 1,
0.9326569, -0.2423478, 2.935835, 1, 1, 1, 1, 1,
0.9347407, -1.193479, 3.028764, 1, 1, 1, 1, 1,
0.9350997, 2.125035, -0.1629968, 1, 1, 1, 1, 1,
0.9435912, -0.7019118, 2.855945, 1, 1, 1, 1, 1,
0.9445471, -1.058696, 3.26431, 1, 1, 1, 1, 1,
0.9554472, 0.638383, 1.149212, 1, 1, 1, 1, 1,
0.9574792, 0.6760766, 0.4167429, 1, 1, 1, 1, 1,
0.9666154, -0.3027356, 1.402566, 1, 1, 1, 1, 1,
0.9674084, 0.212811, 1.516951, 1, 1, 1, 1, 1,
0.969766, 1.063072, 1.371623, 1, 1, 1, 1, 1,
0.9880664, -1.366468, 2.274175, 1, 1, 1, 1, 1,
0.989658, 0.4400165, 1.456077, 0, 0, 1, 1, 1,
0.9940813, 0.159106, 0.2072278, 1, 0, 0, 1, 1,
1.009234, 2.182304, 0.761123, 1, 0, 0, 1, 1,
1.009445, -1.445616, 2.910284, 1, 0, 0, 1, 1,
1.009836, -1.188811, 2.978208, 1, 0, 0, 1, 1,
1.013149, 0.9978527, 1.342478, 1, 0, 0, 1, 1,
1.021984, -0.02553612, -0.006827509, 0, 0, 0, 1, 1,
1.025928, -0.3013057, 2.72603, 0, 0, 0, 1, 1,
1.030989, 1.118666, 0.07920705, 0, 0, 0, 1, 1,
1.035147, 0.3494614, 1.127071, 0, 0, 0, 1, 1,
1.038262, -2.660368, 3.612541, 0, 0, 0, 1, 1,
1.044687, -0.1158862, 1.71436, 0, 0, 0, 1, 1,
1.049985, 1.308271, 0.2838891, 0, 0, 0, 1, 1,
1.050635, -0.3919804, 1.812806, 1, 1, 1, 1, 1,
1.050803, -0.5271394, 1.211294, 1, 1, 1, 1, 1,
1.063407, -0.857684, 2.254558, 1, 1, 1, 1, 1,
1.066754, -0.1859936, 2.613742, 1, 1, 1, 1, 1,
1.068087, -1.420793, 1.625284, 1, 1, 1, 1, 1,
1.072055, 1.389104, 0.648506, 1, 1, 1, 1, 1,
1.073761, 1.2003, 0.3390968, 1, 1, 1, 1, 1,
1.073895, -1.179618, 2.673398, 1, 1, 1, 1, 1,
1.075463, 0.5767214, 1.123552, 1, 1, 1, 1, 1,
1.077859, 0.5528281, 1.519644, 1, 1, 1, 1, 1,
1.079196, 0.4208525, 1.737069, 1, 1, 1, 1, 1,
1.080843, -1.012221, 0.8085898, 1, 1, 1, 1, 1,
1.082072, 0.04073422, 2.018872, 1, 1, 1, 1, 1,
1.094291, -2.254388, 2.497715, 1, 1, 1, 1, 1,
1.094411, -0.3793132, 2.22577, 1, 1, 1, 1, 1,
1.096555, -0.2587829, 1.876331, 0, 0, 1, 1, 1,
1.117841, -0.6239312, 2.617069, 1, 0, 0, 1, 1,
1.126411, 0.146768, 2.470366, 1, 0, 0, 1, 1,
1.129227, -0.829127, 4.896348, 1, 0, 0, 1, 1,
1.133252, -0.9147554, 2.430122, 1, 0, 0, 1, 1,
1.136276, 0.1351524, 0.8837454, 1, 0, 0, 1, 1,
1.139247, 0.6694868, 1.453247, 0, 0, 0, 1, 1,
1.145323, 1.054167, 0.6604518, 0, 0, 0, 1, 1,
1.147615, 1.144615, 0.5068204, 0, 0, 0, 1, 1,
1.148543, -1.128568, 4.74716, 0, 0, 0, 1, 1,
1.151917, -0.111171, 2.738152, 0, 0, 0, 1, 1,
1.169538, -1.456916, 3.302288, 0, 0, 0, 1, 1,
1.176687, 0.9209195, -0.0006001469, 0, 0, 0, 1, 1,
1.179899, -0.6324779, 1.260314, 1, 1, 1, 1, 1,
1.183404, 0.924422, 1.130088, 1, 1, 1, 1, 1,
1.18508, 0.5547716, 1.777422, 1, 1, 1, 1, 1,
1.18879, -2.241376, 3.133604, 1, 1, 1, 1, 1,
1.190373, -0.4479041, 3.203601, 1, 1, 1, 1, 1,
1.19725, 0.7083058, 1.092781, 1, 1, 1, 1, 1,
1.197343, -0.1618305, 2.267807, 1, 1, 1, 1, 1,
1.201094, 0.5293618, 0.3637784, 1, 1, 1, 1, 1,
1.201494, -0.08849061, 3.142387, 1, 1, 1, 1, 1,
1.21131, -0.8023067, 1.515622, 1, 1, 1, 1, 1,
1.218787, 0.9005255, 2.502516, 1, 1, 1, 1, 1,
1.221626, -0.1566113, 3.113784, 1, 1, 1, 1, 1,
1.225032, -1.279544, 3.403131, 1, 1, 1, 1, 1,
1.227763, -0.1792841, 1.849553, 1, 1, 1, 1, 1,
1.231993, -0.08135848, 2.606, 1, 1, 1, 1, 1,
1.232723, 1.727689, 0.1448073, 0, 0, 1, 1, 1,
1.234084, 0.1903857, 1.522346, 1, 0, 0, 1, 1,
1.239359, 1.030395, 2.019731, 1, 0, 0, 1, 1,
1.242346, 0.342154, 1.961593, 1, 0, 0, 1, 1,
1.24783, 0.527477, -0.6942642, 1, 0, 0, 1, 1,
1.248119, -0.9935156, 3.197293, 1, 0, 0, 1, 1,
1.253325, -0.8515363, 2.395599, 0, 0, 0, 1, 1,
1.261533, -0.9617692, 1.780862, 0, 0, 0, 1, 1,
1.265674, 0.2880292, -0.8661105, 0, 0, 0, 1, 1,
1.265702, 1.277561, 0.8149706, 0, 0, 0, 1, 1,
1.269989, 1.551235, 0.1721086, 0, 0, 0, 1, 1,
1.276488, 0.1320657, 0.3964949, 0, 0, 0, 1, 1,
1.278883, 0.8508714, 0.7186291, 0, 0, 0, 1, 1,
1.284571, 1.009828, -0.7891181, 1, 1, 1, 1, 1,
1.286161, 0.6889716, 0.04362292, 1, 1, 1, 1, 1,
1.28904, 0.8527129, 1.580479, 1, 1, 1, 1, 1,
1.294926, 0.8999671, 1.747827, 1, 1, 1, 1, 1,
1.302424, -0.3218106, 0.908938, 1, 1, 1, 1, 1,
1.303889, 1.412022, 1.214192, 1, 1, 1, 1, 1,
1.30607, 1.341481, 1.010576, 1, 1, 1, 1, 1,
1.307342, -0.8717593, 2.076371, 1, 1, 1, 1, 1,
1.307589, 1.619753, -0.2324892, 1, 1, 1, 1, 1,
1.316383, -1.334243, 1.607938, 1, 1, 1, 1, 1,
1.31747, 0.8200606, 2.202277, 1, 1, 1, 1, 1,
1.332094, 0.361602, 1.320381, 1, 1, 1, 1, 1,
1.338013, 0.9943124, 0.9971811, 1, 1, 1, 1, 1,
1.340619, 1.031831, 2.059521, 1, 1, 1, 1, 1,
1.342742, 1.504416, -0.06983799, 1, 1, 1, 1, 1,
1.348755, 1.959043, 1.028783, 0, 0, 1, 1, 1,
1.35201, -0.7695262, 1.973604, 1, 0, 0, 1, 1,
1.355047, 0.4777735, 0.7310577, 1, 0, 0, 1, 1,
1.368468, 0.3892069, -0.03540822, 1, 0, 0, 1, 1,
1.369793, -0.8376704, 1.248746, 1, 0, 0, 1, 1,
1.393647, 0.638406, 0.07749034, 1, 0, 0, 1, 1,
1.398931, -0.5995594, 0.7423328, 0, 0, 0, 1, 1,
1.401115, 0.2341484, 0.02020159, 0, 0, 0, 1, 1,
1.402444, 0.3889067, 0.8307859, 0, 0, 0, 1, 1,
1.405525, 0.9970997, 1.532808, 0, 0, 0, 1, 1,
1.409138, -0.7305001, 3.488265, 0, 0, 0, 1, 1,
1.413996, -0.08825535, 1.841309, 0, 0, 0, 1, 1,
1.416066, -0.001977169, 2.114063, 0, 0, 0, 1, 1,
1.419196, -0.732825, 2.446002, 1, 1, 1, 1, 1,
1.433514, -0.9090528, 2.156001, 1, 1, 1, 1, 1,
1.434608, -0.3586485, 1.492616, 1, 1, 1, 1, 1,
1.445117, -1.066483, 2.803416, 1, 1, 1, 1, 1,
1.451358, -0.2496399, 1.096208, 1, 1, 1, 1, 1,
1.459163, -0.848727, 0.5636736, 1, 1, 1, 1, 1,
1.459746, -1.807849, 2.660352, 1, 1, 1, 1, 1,
1.469014, -0.9655148, 2.943608, 1, 1, 1, 1, 1,
1.473479, 1.594652, 0.8096368, 1, 1, 1, 1, 1,
1.47627, -0.3080709, 3.002259, 1, 1, 1, 1, 1,
1.480115, 0.5687244, 0.1609601, 1, 1, 1, 1, 1,
1.483463, -2.249644, 2.082445, 1, 1, 1, 1, 1,
1.498357, -1.034635, 2.223392, 1, 1, 1, 1, 1,
1.500423, 1.883662, -0.05613294, 1, 1, 1, 1, 1,
1.508593, 1.456843, 0.33224, 1, 1, 1, 1, 1,
1.530594, 0.6408016, 0.9772093, 0, 0, 1, 1, 1,
1.53662, -0.5744514, 2.572372, 1, 0, 0, 1, 1,
1.536985, -0.7455634, 2.972081, 1, 0, 0, 1, 1,
1.550112, 0.1933793, 1.376163, 1, 0, 0, 1, 1,
1.554083, -0.2861434, 1.932013, 1, 0, 0, 1, 1,
1.556364, -0.1446434, 1.294765, 1, 0, 0, 1, 1,
1.565087, 1.610108, 2.361056, 0, 0, 0, 1, 1,
1.572044, -0.3819971, 1.860801, 0, 0, 0, 1, 1,
1.585695, 0.3310985, 1.73073, 0, 0, 0, 1, 1,
1.587067, -0.2562055, 1.449526, 0, 0, 0, 1, 1,
1.610484, -0.6086636, 2.019921, 0, 0, 0, 1, 1,
1.612866, -0.09301034, 2.229264, 0, 0, 0, 1, 1,
1.638298, -0.2200983, 2.207379, 0, 0, 0, 1, 1,
1.647931, 1.012291, 0.9521227, 1, 1, 1, 1, 1,
1.662368, 0.5704851, 1.338251, 1, 1, 1, 1, 1,
1.679356, -0.8875794, 3.509613, 1, 1, 1, 1, 1,
1.683133, 0.2916842, 1.718248, 1, 1, 1, 1, 1,
1.700735, 0.4402153, 2.418938, 1, 1, 1, 1, 1,
1.735125, 0.4674032, 1.013152, 1, 1, 1, 1, 1,
1.738141, 0.5134472, 0.8848708, 1, 1, 1, 1, 1,
1.739844, 0.4814878, 3.497303, 1, 1, 1, 1, 1,
1.741138, -0.2175164, 3.528984, 1, 1, 1, 1, 1,
1.756027, -0.5782397, -0.7363234, 1, 1, 1, 1, 1,
1.758668, 0.1309031, 0.1212295, 1, 1, 1, 1, 1,
1.771108, 0.8459437, 1.328741, 1, 1, 1, 1, 1,
1.774033, -0.5440202, 0.5426192, 1, 1, 1, 1, 1,
1.815157, 0.8146257, 0.8656412, 1, 1, 1, 1, 1,
1.820839, -0.0827655, 1.916856, 1, 1, 1, 1, 1,
1.866809, 2.355174, 0.1403526, 0, 0, 1, 1, 1,
1.88741, -1.506177, 2.14612, 1, 0, 0, 1, 1,
1.894852, -0.6218286, 2.23262, 1, 0, 0, 1, 1,
1.905182, 0.410078, 1.945983, 1, 0, 0, 1, 1,
1.942851, 0.2265857, 0.476898, 1, 0, 0, 1, 1,
1.957961, -1.156542, 2.896686, 1, 0, 0, 1, 1,
1.973003, 1.602613, 1.211414, 0, 0, 0, 1, 1,
2.016744, 0.6846812, 0.5446056, 0, 0, 0, 1, 1,
2.029712, 0.4790075, 0.5424869, 0, 0, 0, 1, 1,
2.062219, 0.5849606, 1.780063, 0, 0, 0, 1, 1,
2.140516, -1.059248, 2.369617, 0, 0, 0, 1, 1,
2.286551, 1.372573, 1.049331, 0, 0, 0, 1, 1,
2.332722, -0.4485003, 2.665474, 0, 0, 0, 1, 1,
2.389631, -0.3991513, 2.81377, 1, 1, 1, 1, 1,
2.43332, 1.491811, 1.327556, 1, 1, 1, 1, 1,
2.632039, -2.088939, 2.44589, 1, 1, 1, 1, 1,
2.644024, 0.2912101, 1.542915, 1, 1, 1, 1, 1,
2.905977, -0.8180907, 3.026067, 1, 1, 1, 1, 1,
2.977499, -1.316479, -2.032625, 1, 1, 1, 1, 1,
3.150309, -0.6548338, 1.490294, 1, 1, 1, 1, 1
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
var radius = 9.586976;
var distance = 33.67385;
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
mvMatrix.translate( 0.06089449, -0.006900311, -0.2369411 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.67385);
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
