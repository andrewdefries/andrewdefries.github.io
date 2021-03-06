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
-3.049378, 1.912137, -0.7739608, 1, 0, 0, 1,
-2.976197, 1.100532, -1.758243, 1, 0.007843138, 0, 1,
-2.913976, -1.232111, -1.308294, 1, 0.01176471, 0, 1,
-2.777446, 0.3226171, -0.9613936, 1, 0.01960784, 0, 1,
-2.711889, 0.1619184, -0.7523025, 1, 0.02352941, 0, 1,
-2.553054, 1.280416, -1.113173, 1, 0.03137255, 0, 1,
-2.54843, 0.157196, -1.409659, 1, 0.03529412, 0, 1,
-2.523054, 1.035277, -0.3793051, 1, 0.04313726, 0, 1,
-2.510665, 0.4722472, -1.110321, 1, 0.04705882, 0, 1,
-2.479517, 0.6076978, -2.689566, 1, 0.05490196, 0, 1,
-2.418596, 2.39045, -0.5011035, 1, 0.05882353, 0, 1,
-2.365689, 0.8357759, -2.337848, 1, 0.06666667, 0, 1,
-2.362422, -0.6233277, -1.551705, 1, 0.07058824, 0, 1,
-2.346949, 1.08064, -2.75682, 1, 0.07843138, 0, 1,
-2.285903, -0.6260165, -1.247875, 1, 0.08235294, 0, 1,
-2.233841, 1.112965, -1.856432, 1, 0.09019608, 0, 1,
-2.230805, -0.5732699, -1.155201, 1, 0.09411765, 0, 1,
-2.208602, 0.07043744, 0.6871349, 1, 0.1019608, 0, 1,
-2.075726, 0.668626, -0.9855028, 1, 0.1098039, 0, 1,
-2.035551, 0.1350688, -0.382568, 1, 0.1137255, 0, 1,
-2.031122, -2.026877, -4.72113, 1, 0.1215686, 0, 1,
-2.01696, -1.399693, -1.367571, 1, 0.1254902, 0, 1,
-1.998271, -1.172203, -1.470349, 1, 0.1333333, 0, 1,
-1.966565, 0.9758375, -1.372203, 1, 0.1372549, 0, 1,
-1.964163, -0.8348593, -2.6871, 1, 0.145098, 0, 1,
-1.914257, -0.3119411, -0.5694936, 1, 0.1490196, 0, 1,
-1.910177, -0.871019, -0.3383215, 1, 0.1568628, 0, 1,
-1.896104, 0.5229919, -2.510711, 1, 0.1607843, 0, 1,
-1.895473, 1.787937, -1.672233, 1, 0.1686275, 0, 1,
-1.856963, -0.8028798, -3.029988, 1, 0.172549, 0, 1,
-1.855374, 0.7549439, -0.3037298, 1, 0.1803922, 0, 1,
-1.851361, 0.4018699, -0.5974538, 1, 0.1843137, 0, 1,
-1.834248, -0.8532137, -2.316707, 1, 0.1921569, 0, 1,
-1.82996, -0.0493653, -3.1089, 1, 0.1960784, 0, 1,
-1.822553, -0.996114, -2.554845, 1, 0.2039216, 0, 1,
-1.81258, 1.195038, -0.559965, 1, 0.2117647, 0, 1,
-1.803323, -0.2261318, -1.692413, 1, 0.2156863, 0, 1,
-1.79952, 1.893645, -1.287315, 1, 0.2235294, 0, 1,
-1.783337, 0.1359514, -3.190703, 1, 0.227451, 0, 1,
-1.752578, -0.1943104, -0.8033516, 1, 0.2352941, 0, 1,
-1.695379, 0.5636225, -2.730006, 1, 0.2392157, 0, 1,
-1.691782, -1.043159, -2.489429, 1, 0.2470588, 0, 1,
-1.677462, 0.4951018, -0.8917959, 1, 0.2509804, 0, 1,
-1.675423, 1.021626, -1.544626, 1, 0.2588235, 0, 1,
-1.671584, -0.4966536, -1.417114, 1, 0.2627451, 0, 1,
-1.663551, -0.2808352, -0.3889842, 1, 0.2705882, 0, 1,
-1.660373, 0.7749615, -1.77844, 1, 0.2745098, 0, 1,
-1.649798, -0.8894188, -3.342443, 1, 0.282353, 0, 1,
-1.637848, 0.3481199, -2.358773, 1, 0.2862745, 0, 1,
-1.635043, -0.9666346, -1.703038, 1, 0.2941177, 0, 1,
-1.634748, 0.8394961, -1.335011, 1, 0.3019608, 0, 1,
-1.625696, 0.4128474, -0.4254327, 1, 0.3058824, 0, 1,
-1.624868, -0.09809019, -3.795901, 1, 0.3137255, 0, 1,
-1.596059, -1.542045, -2.362987, 1, 0.3176471, 0, 1,
-1.585645, -2.120867, -1.936333, 1, 0.3254902, 0, 1,
-1.543368, 0.6105474, -0.9723873, 1, 0.3294118, 0, 1,
-1.482425, 1.317558, -1.237167, 1, 0.3372549, 0, 1,
-1.465471, -0.9871619, -2.125577, 1, 0.3411765, 0, 1,
-1.453389, 1.984001, -1.220692, 1, 0.3490196, 0, 1,
-1.435858, 0.2455009, -1.41685, 1, 0.3529412, 0, 1,
-1.405862, 0.6964195, -1.180936, 1, 0.3607843, 0, 1,
-1.400821, -0.317225, -2.764572, 1, 0.3647059, 0, 1,
-1.373757, -1.766667, -1.307326, 1, 0.372549, 0, 1,
-1.371662, 0.3303049, 0.1580344, 1, 0.3764706, 0, 1,
-1.345276, -1.184389, -1.427483, 1, 0.3843137, 0, 1,
-1.315876, -0.7303062, -1.193009, 1, 0.3882353, 0, 1,
-1.3091, -0.8581013, -2.897486, 1, 0.3960784, 0, 1,
-1.30636, -0.1530982, -1.963053, 1, 0.4039216, 0, 1,
-1.305875, 0.983519, -0.7482389, 1, 0.4078431, 0, 1,
-1.283675, -0.3744416, -2.212203, 1, 0.4156863, 0, 1,
-1.281751, -1.177419, -1.70809, 1, 0.4196078, 0, 1,
-1.274881, 0.5696445, -1.209664, 1, 0.427451, 0, 1,
-1.270092, 1.640376, -0.7416896, 1, 0.4313726, 0, 1,
-1.268973, 0.1101137, -1.847834, 1, 0.4392157, 0, 1,
-1.268207, 0.7478521, -1.541975, 1, 0.4431373, 0, 1,
-1.264693, -1.139557, -2.548419, 1, 0.4509804, 0, 1,
-1.261749, 0.01101199, 0.7216843, 1, 0.454902, 0, 1,
-1.260812, -0.07690867, -1.241187, 1, 0.4627451, 0, 1,
-1.25446, 0.6128911, -0.6889012, 1, 0.4666667, 0, 1,
-1.254117, 1.712069, -1.341249, 1, 0.4745098, 0, 1,
-1.25176, -0.8902503, -4.677876, 1, 0.4784314, 0, 1,
-1.250519, -0.1774502, 0.0609854, 1, 0.4862745, 0, 1,
-1.248564, -1.934986, -1.257742, 1, 0.4901961, 0, 1,
-1.24223, 2.614699, -1.720089, 1, 0.4980392, 0, 1,
-1.241368, -0.8078154, -3.381674, 1, 0.5058824, 0, 1,
-1.240652, 0.2215627, 0.2241551, 1, 0.509804, 0, 1,
-1.231905, -0.5236006, -2.035529, 1, 0.5176471, 0, 1,
-1.221391, 1.413978, 0.6145876, 1, 0.5215687, 0, 1,
-1.216072, -0.4332335, -1.196696, 1, 0.5294118, 0, 1,
-1.215589, 1.142558, 0.508575, 1, 0.5333334, 0, 1,
-1.209565, 1.713209, -1.345265, 1, 0.5411765, 0, 1,
-1.208362, -0.8318508, -2.098922, 1, 0.5450981, 0, 1,
-1.204491, 0.1344169, -1.373745, 1, 0.5529412, 0, 1,
-1.201494, 1.000185, -0.3134535, 1, 0.5568628, 0, 1,
-1.195089, 1.00359, -1.696109, 1, 0.5647059, 0, 1,
-1.190839, 0.2803337, -0.7170681, 1, 0.5686275, 0, 1,
-1.184134, -0.4184628, -1.809124, 1, 0.5764706, 0, 1,
-1.183018, 0.1674749, -1.162132, 1, 0.5803922, 0, 1,
-1.163865, -0.5591141, -1.316918, 1, 0.5882353, 0, 1,
-1.156601, 2.41212, -1.287451, 1, 0.5921569, 0, 1,
-1.13953, 0.5170242, -1.271544, 1, 0.6, 0, 1,
-1.135911, -2.304759, -3.055151, 1, 0.6078432, 0, 1,
-1.127297, -0.2959546, -1.969878, 1, 0.6117647, 0, 1,
-1.125294, -1.304256, -1.342934, 1, 0.6196079, 0, 1,
-1.120196, -0.5369229, -1.83926, 1, 0.6235294, 0, 1,
-1.117476, 0.3362891, -2.934111, 1, 0.6313726, 0, 1,
-1.113299, -0.03302617, -0.2416286, 1, 0.6352941, 0, 1,
-1.104893, -1.004362, -1.206377, 1, 0.6431373, 0, 1,
-1.104002, -0.4354996, -0.6533516, 1, 0.6470588, 0, 1,
-1.103811, 0.6286306, -0.7775941, 1, 0.654902, 0, 1,
-1.100672, 0.9745923, -0.3583482, 1, 0.6588235, 0, 1,
-1.097689, 1.436087, -1.257128, 1, 0.6666667, 0, 1,
-1.096542, 0.05540469, -1.888475, 1, 0.6705883, 0, 1,
-1.091717, 0.3788107, -0.6471223, 1, 0.6784314, 0, 1,
-1.085602, 0.3239267, -1.602568, 1, 0.682353, 0, 1,
-1.083466, -0.8682321, -0.794938, 1, 0.6901961, 0, 1,
-1.081469, 0.6370195, -1.254651, 1, 0.6941177, 0, 1,
-1.075544, 1.186897, -0.9526692, 1, 0.7019608, 0, 1,
-1.069295, 0.5766847, -0.7117215, 1, 0.7098039, 0, 1,
-1.062951, 1.010111, -1.09972, 1, 0.7137255, 0, 1,
-1.048903, 0.9934676, -1.728913, 1, 0.7215686, 0, 1,
-1.045754, -0.09633911, -2.691883, 1, 0.7254902, 0, 1,
-1.044466, -1.994718, -1.374169, 1, 0.7333333, 0, 1,
-1.040991, -0.375277, -1.350273, 1, 0.7372549, 0, 1,
-1.035926, -0.06547238, -1.280142, 1, 0.7450981, 0, 1,
-1.035423, -0.8172073, -2.114393, 1, 0.7490196, 0, 1,
-1.032821, 0.237933, -0.2744722, 1, 0.7568628, 0, 1,
-1.020267, -0.1538114, -0.2113459, 1, 0.7607843, 0, 1,
-1.011346, 1.201192, -1.873459, 1, 0.7686275, 0, 1,
-1.010332, -0.7726404, -3.098645, 1, 0.772549, 0, 1,
-1.006578, -0.4352307, 2.318848, 1, 0.7803922, 0, 1,
-1.006062, 1.532125, -0.5615986, 1, 0.7843137, 0, 1,
-0.9957449, 1.839518, -0.9758164, 1, 0.7921569, 0, 1,
-0.9950894, -0.05634229, -1.561575, 1, 0.7960784, 0, 1,
-0.9925994, 1.696506, -0.2421617, 1, 0.8039216, 0, 1,
-0.9917899, -0.990873, -0.8713752, 1, 0.8117647, 0, 1,
-0.990014, -0.1896511, -1.531424, 1, 0.8156863, 0, 1,
-0.9883604, 1.809892, -0.6758489, 1, 0.8235294, 0, 1,
-0.9881061, 0.342954, -2.494675, 1, 0.827451, 0, 1,
-0.9827985, -1.203259, -0.7884605, 1, 0.8352941, 0, 1,
-0.9797063, 0.6016727, -0.4608425, 1, 0.8392157, 0, 1,
-0.9792138, 0.3548965, -2.070754, 1, 0.8470588, 0, 1,
-0.9684942, -0.7548469, -3.604174, 1, 0.8509804, 0, 1,
-0.9628698, 0.1613936, -0.1885313, 1, 0.8588235, 0, 1,
-0.9600528, -1.147856, -0.2326929, 1, 0.8627451, 0, 1,
-0.956781, -0.498217, -1.761987, 1, 0.8705882, 0, 1,
-0.9545641, 0.1812547, -0.7677914, 1, 0.8745098, 0, 1,
-0.9536176, 1.323282, 1.186692, 1, 0.8823529, 0, 1,
-0.9409549, 0.9709097, 0.4431686, 1, 0.8862745, 0, 1,
-0.9333469, -1.075005, -3.260655, 1, 0.8941177, 0, 1,
-0.92185, -0.1096183, -0.630604, 1, 0.8980392, 0, 1,
-0.91878, -0.4543712, -2.250641, 1, 0.9058824, 0, 1,
-0.9139691, 0.6621323, -0.1861321, 1, 0.9137255, 0, 1,
-0.9081451, 1.385783, -1.955655, 1, 0.9176471, 0, 1,
-0.9027655, -0.0167287, -1.414801, 1, 0.9254902, 0, 1,
-0.8924802, -0.4985576, -3.529085, 1, 0.9294118, 0, 1,
-0.8915837, -1.506782, -1.603949, 1, 0.9372549, 0, 1,
-0.8898713, 0.6817511, -0.6616111, 1, 0.9411765, 0, 1,
-0.8844872, 0.4562423, -0.1214779, 1, 0.9490196, 0, 1,
-0.8769013, 0.7773859, -1.290472, 1, 0.9529412, 0, 1,
-0.8752168, 0.3922948, -0.2613213, 1, 0.9607843, 0, 1,
-0.8715028, 1.99082, -1.743744, 1, 0.9647059, 0, 1,
-0.8710771, -2.766363, -0.9937766, 1, 0.972549, 0, 1,
-0.866921, 1.021363, -0.92111, 1, 0.9764706, 0, 1,
-0.8642164, -0.8475043, -3.017014, 1, 0.9843137, 0, 1,
-0.8615332, 2.112089, -2.116941, 1, 0.9882353, 0, 1,
-0.8518851, 1.259514, -0.3101317, 1, 0.9960784, 0, 1,
-0.8517358, 0.8791285, 0.4559076, 0.9960784, 1, 0, 1,
-0.8492211, -0.1757407, -2.159456, 0.9921569, 1, 0, 1,
-0.8409801, 0.510814, -0.1266066, 0.9843137, 1, 0, 1,
-0.8321959, -1.094263, -1.740556, 0.9803922, 1, 0, 1,
-0.8293694, 0.3176371, -0.1199323, 0.972549, 1, 0, 1,
-0.8286046, -0.9235582, -1.516899, 0.9686275, 1, 0, 1,
-0.8246216, 0.9633472, -1.358599, 0.9607843, 1, 0, 1,
-0.8168411, 0.7202374, -1.300308, 0.9568627, 1, 0, 1,
-0.8154856, 0.5290465, -0.6486053, 0.9490196, 1, 0, 1,
-0.8100038, -0.02538934, -2.797681, 0.945098, 1, 0, 1,
-0.8062373, -0.1746797, -2.763309, 0.9372549, 1, 0, 1,
-0.8056442, 1.014289, -0.9645661, 0.9333333, 1, 0, 1,
-0.8033968, -0.8902861, -1.824251, 0.9254902, 1, 0, 1,
-0.7988819, 1.368001, 0.9271119, 0.9215686, 1, 0, 1,
-0.7907023, 2.52456, -0.3961006, 0.9137255, 1, 0, 1,
-0.7891646, -0.1131008, -0.810034, 0.9098039, 1, 0, 1,
-0.783379, -1.37998, -1.709337, 0.9019608, 1, 0, 1,
-0.7795269, -0.4224309, -1.884432, 0.8941177, 1, 0, 1,
-0.7777028, -0.6830902, -2.447167, 0.8901961, 1, 0, 1,
-0.7769569, 0.4106623, -1.055668, 0.8823529, 1, 0, 1,
-0.7762, 0.6413898, -1.688195, 0.8784314, 1, 0, 1,
-0.7746515, -0.9569575, -0.5572465, 0.8705882, 1, 0, 1,
-0.7746153, 0.4245835, -2.78641, 0.8666667, 1, 0, 1,
-0.7721539, -0.2628806, -0.9772991, 0.8588235, 1, 0, 1,
-0.7719113, 0.04277686, -0.1702164, 0.854902, 1, 0, 1,
-0.7710077, 2.331994, -2.797446, 0.8470588, 1, 0, 1,
-0.7692333, 0.3816397, -2.025157, 0.8431373, 1, 0, 1,
-0.7633524, -1.330778, -2.109025, 0.8352941, 1, 0, 1,
-0.7625848, -0.05280451, -0.8324907, 0.8313726, 1, 0, 1,
-0.7617756, -1.445068, -2.320085, 0.8235294, 1, 0, 1,
-0.7605925, -1.288305, -1.411559, 0.8196079, 1, 0, 1,
-0.7547526, -1.401012, -2.647777, 0.8117647, 1, 0, 1,
-0.7501124, -0.3842725, -2.24156, 0.8078431, 1, 0, 1,
-0.7498227, -0.6474544, -2.516186, 0.8, 1, 0, 1,
-0.7485086, 0.2431858, -1.324362, 0.7921569, 1, 0, 1,
-0.7408856, -0.01995193, -2.37316, 0.7882353, 1, 0, 1,
-0.7377589, 1.249338, -1.195128, 0.7803922, 1, 0, 1,
-0.7310418, -1.50554, -1.80539, 0.7764706, 1, 0, 1,
-0.7264587, 0.9315628, -0.5910147, 0.7686275, 1, 0, 1,
-0.7263433, -0.6653203, -1.969306, 0.7647059, 1, 0, 1,
-0.7250209, -0.9630937, -2.807273, 0.7568628, 1, 0, 1,
-0.7231232, 0.3240305, -2.401448, 0.7529412, 1, 0, 1,
-0.7201563, -0.9088385, -3.171695, 0.7450981, 1, 0, 1,
-0.7173918, -0.3932891, -3.171386, 0.7411765, 1, 0, 1,
-0.7073665, -1.42619, -3.512474, 0.7333333, 1, 0, 1,
-0.7071004, -1.086273, -2.566221, 0.7294118, 1, 0, 1,
-0.7054262, 1.256549, 1.61111, 0.7215686, 1, 0, 1,
-0.700213, 0.03350181, -0.4023032, 0.7176471, 1, 0, 1,
-0.6999462, 1.103429, -0.1638054, 0.7098039, 1, 0, 1,
-0.6982349, -0.7530643, -3.3162, 0.7058824, 1, 0, 1,
-0.6970912, 1.882273, -1.563534, 0.6980392, 1, 0, 1,
-0.6941995, -0.8151428, -0.6843964, 0.6901961, 1, 0, 1,
-0.6939949, 1.235998, 1.164271, 0.6862745, 1, 0, 1,
-0.6872674, 0.8808227, 0.6467067, 0.6784314, 1, 0, 1,
-0.6836077, 0.6911429, -1.416279, 0.6745098, 1, 0, 1,
-0.6803705, 0.7063954, 0.142811, 0.6666667, 1, 0, 1,
-0.6784436, -0.04241102, -1.365516, 0.6627451, 1, 0, 1,
-0.6782913, -0.7203723, -2.080319, 0.654902, 1, 0, 1,
-0.6769472, 0.1775085, -0.9132655, 0.6509804, 1, 0, 1,
-0.6750228, 1.000204, -0.046872, 0.6431373, 1, 0, 1,
-0.6727443, 0.1253274, -0.1767299, 0.6392157, 1, 0, 1,
-0.6722122, 0.7430659, -0.4514748, 0.6313726, 1, 0, 1,
-0.6706738, -1.255258, -3.400329, 0.627451, 1, 0, 1,
-0.6660352, 0.7495058, -2.024041, 0.6196079, 1, 0, 1,
-0.6616905, -1.554271, -3.6372, 0.6156863, 1, 0, 1,
-0.6614987, -0.2785583, -1.790645, 0.6078432, 1, 0, 1,
-0.6590016, 0.1573979, -0.2482743, 0.6039216, 1, 0, 1,
-0.6583827, 0.6074473, -0.6113119, 0.5960785, 1, 0, 1,
-0.6502219, -0.2136487, -2.713494, 0.5882353, 1, 0, 1,
-0.6425616, 0.01747293, -2.750929, 0.5843138, 1, 0, 1,
-0.6417757, 0.8920696, -0.06703413, 0.5764706, 1, 0, 1,
-0.6414034, 2.362832, -1.063496, 0.572549, 1, 0, 1,
-0.639984, -0.09367757, -2.191274, 0.5647059, 1, 0, 1,
-0.6394768, 0.2163991, -1.770136, 0.5607843, 1, 0, 1,
-0.6367946, -1.388002, -3.240591, 0.5529412, 1, 0, 1,
-0.6309051, 0.004932811, -0.2281684, 0.5490196, 1, 0, 1,
-0.6293786, 0.1957762, -1.596851, 0.5411765, 1, 0, 1,
-0.6284277, 0.07803359, -2.037944, 0.5372549, 1, 0, 1,
-0.6280368, 0.7177072, -2.732413, 0.5294118, 1, 0, 1,
-0.6242837, 0.3481951, 0.0868356, 0.5254902, 1, 0, 1,
-0.6226252, -1.021614, -2.36793, 0.5176471, 1, 0, 1,
-0.6221071, -0.2005271, -2.878596, 0.5137255, 1, 0, 1,
-0.6180503, 0.1152524, -2.692781, 0.5058824, 1, 0, 1,
-0.6176077, -0.2411295, -0.005425797, 0.5019608, 1, 0, 1,
-0.6095356, 0.2596029, -2.214205, 0.4941176, 1, 0, 1,
-0.6009521, 0.3821033, -0.5101726, 0.4862745, 1, 0, 1,
-0.5942975, 0.08794104, -1.373044, 0.4823529, 1, 0, 1,
-0.5913395, -0.7236012, -2.630318, 0.4745098, 1, 0, 1,
-0.5872283, -1.125909, -3.805197, 0.4705882, 1, 0, 1,
-0.5864167, 0.8304035, -0.986058, 0.4627451, 1, 0, 1,
-0.5863844, 1.052497, -3.064655, 0.4588235, 1, 0, 1,
-0.5855733, -0.9668929, -2.364809, 0.4509804, 1, 0, 1,
-0.5852549, -1.257546, -1.599412, 0.4470588, 1, 0, 1,
-0.5828765, -0.4253204, -1.971722, 0.4392157, 1, 0, 1,
-0.5767431, -0.9374458, -2.188721, 0.4352941, 1, 0, 1,
-0.5740002, 0.1238648, -1.227893, 0.427451, 1, 0, 1,
-0.5647782, -0.4075316, -2.580251, 0.4235294, 1, 0, 1,
-0.5644194, 1.24366, 0.2639191, 0.4156863, 1, 0, 1,
-0.5587975, -0.6108417, -1.178429, 0.4117647, 1, 0, 1,
-0.5575967, -0.536804, -2.57854, 0.4039216, 1, 0, 1,
-0.5561201, -0.4197752, -3.287673, 0.3960784, 1, 0, 1,
-0.5546146, 0.4187546, -1.245739, 0.3921569, 1, 0, 1,
-0.5539427, 0.4366812, -0.6805136, 0.3843137, 1, 0, 1,
-0.552993, -0.4625211, -1.21464, 0.3803922, 1, 0, 1,
-0.5506243, -0.3838884, -1.409906, 0.372549, 1, 0, 1,
-0.5499601, 2.721554, -1.979204, 0.3686275, 1, 0, 1,
-0.5393195, -0.1400543, -2.332591, 0.3607843, 1, 0, 1,
-0.5368258, -0.7457415, -2.761082, 0.3568628, 1, 0, 1,
-0.5364076, 1.131461, -1.534241, 0.3490196, 1, 0, 1,
-0.5361488, 0.8800271, -0.2496528, 0.345098, 1, 0, 1,
-0.5336714, 2.215868, -1.497196, 0.3372549, 1, 0, 1,
-0.5317538, -0.1858551, -0.7814603, 0.3333333, 1, 0, 1,
-0.5317494, 0.6526022, -1.644371, 0.3254902, 1, 0, 1,
-0.5285828, 0.5299633, -1.392898, 0.3215686, 1, 0, 1,
-0.5241132, 0.7425717, 1.401398, 0.3137255, 1, 0, 1,
-0.5226586, -1.284462, -4.776265, 0.3098039, 1, 0, 1,
-0.5147768, 0.4099482, -1.578629, 0.3019608, 1, 0, 1,
-0.5090079, -0.9067433, -3.939864, 0.2941177, 1, 0, 1,
-0.507545, -0.5980704, -2.967083, 0.2901961, 1, 0, 1,
-0.4972551, -1.228586, -4.037387, 0.282353, 1, 0, 1,
-0.4943267, 0.0327819, -2.516616, 0.2784314, 1, 0, 1,
-0.4901443, 1.69921, -0.3220269, 0.2705882, 1, 0, 1,
-0.4895205, -0.05247016, -1.113354, 0.2666667, 1, 0, 1,
-0.4881278, -0.2471775, -1.894454, 0.2588235, 1, 0, 1,
-0.4794876, 0.650845, -0.3788492, 0.254902, 1, 0, 1,
-0.4770744, 0.8105335, 1.352783, 0.2470588, 1, 0, 1,
-0.4707765, -1.543616, -3.855186, 0.2431373, 1, 0, 1,
-0.4654888, -0.6553785, -2.587397, 0.2352941, 1, 0, 1,
-0.4641879, 0.6933516, -2.013805, 0.2313726, 1, 0, 1,
-0.4568591, -0.3207196, -3.13259, 0.2235294, 1, 0, 1,
-0.4513169, 0.4542754, -0.03216697, 0.2196078, 1, 0, 1,
-0.4506488, 1.728024, 1.658024, 0.2117647, 1, 0, 1,
-0.4413877, -1.432848, -3.120693, 0.2078431, 1, 0, 1,
-0.4406797, -1.924147, -2.403931, 0.2, 1, 0, 1,
-0.4403412, -0.4795041, -3.252617, 0.1921569, 1, 0, 1,
-0.4367009, 0.05499811, -1.380124, 0.1882353, 1, 0, 1,
-0.4346171, 1.346057, 1.858087, 0.1803922, 1, 0, 1,
-0.433, 1.797184, -1.112907, 0.1764706, 1, 0, 1,
-0.4304453, 1.287942, -0.4708037, 0.1686275, 1, 0, 1,
-0.4276742, 2.841965, 0.6528593, 0.1647059, 1, 0, 1,
-0.4232343, -1.242628, -4.629526, 0.1568628, 1, 0, 1,
-0.4226044, -1.449382, -2.242931, 0.1529412, 1, 0, 1,
-0.4214277, 0.2189907, -1.035635, 0.145098, 1, 0, 1,
-0.4176921, -0.672674, -2.401267, 0.1411765, 1, 0, 1,
-0.4166417, 0.3710914, -2.068227, 0.1333333, 1, 0, 1,
-0.416119, -1.00783, -1.83001, 0.1294118, 1, 0, 1,
-0.4151904, -0.4511681, -2.122483, 0.1215686, 1, 0, 1,
-0.4136145, 0.259453, 0.295292, 0.1176471, 1, 0, 1,
-0.4038063, -2.059374, -2.235592, 0.1098039, 1, 0, 1,
-0.4036519, -0.8326691, -3.312167, 0.1058824, 1, 0, 1,
-0.403218, -1.258326, -3.005107, 0.09803922, 1, 0, 1,
-0.4032072, -1.116653, -2.453353, 0.09019608, 1, 0, 1,
-0.3897164, 0.2128504, -0.5553349, 0.08627451, 1, 0, 1,
-0.3851677, 0.5063384, 1.150294, 0.07843138, 1, 0, 1,
-0.3829659, 2.757495, -0.8276255, 0.07450981, 1, 0, 1,
-0.3803419, 0.756436, 2.336815, 0.06666667, 1, 0, 1,
-0.3748753, 0.8230755, -0.1279066, 0.0627451, 1, 0, 1,
-0.3661827, 0.100796, 0.4798156, 0.05490196, 1, 0, 1,
-0.3643887, -0.1733675, -2.917166, 0.05098039, 1, 0, 1,
-0.3623985, -0.9005381, -1.834691, 0.04313726, 1, 0, 1,
-0.3593918, 0.2815971, -1.628406, 0.03921569, 1, 0, 1,
-0.3588232, 1.395767, -0.3760968, 0.03137255, 1, 0, 1,
-0.3586532, 0.5536822, 1.10658, 0.02745098, 1, 0, 1,
-0.3514748, 0.2590432, -0.03256068, 0.01960784, 1, 0, 1,
-0.3510796, -1.434516, -1.062652, 0.01568628, 1, 0, 1,
-0.3498383, -0.2436538, -1.009063, 0.007843138, 1, 0, 1,
-0.3428188, -0.2351509, -2.214905, 0.003921569, 1, 0, 1,
-0.3409761, 0.4289294, -0.455937, 0, 1, 0.003921569, 1,
-0.3382258, 0.06241613, -1.365155, 0, 1, 0.01176471, 1,
-0.3368643, -0.3508118, -1.722713, 0, 1, 0.01568628, 1,
-0.3365622, -0.9446898, -4.350794, 0, 1, 0.02352941, 1,
-0.3329558, -1.510212, -4.185673, 0, 1, 0.02745098, 1,
-0.330163, 1.447827, -0.3108619, 0, 1, 0.03529412, 1,
-0.329733, -0.05066143, -0.3462119, 0, 1, 0.03921569, 1,
-0.3284731, -0.1918533, -4.735274, 0, 1, 0.04705882, 1,
-0.3280286, 1.452946, 1.328953, 0, 1, 0.05098039, 1,
-0.322897, 1.317316, -0.4427691, 0, 1, 0.05882353, 1,
-0.3220288, 1.139836, 1.109373, 0, 1, 0.0627451, 1,
-0.3200152, 2.426477, 0.08870088, 0, 1, 0.07058824, 1,
-0.3197031, 1.541319, -0.070367, 0, 1, 0.07450981, 1,
-0.3193034, -0.4309216, -2.759293, 0, 1, 0.08235294, 1,
-0.3178922, -0.8310783, -4.535614, 0, 1, 0.08627451, 1,
-0.3147782, 0.3099185, -2.007221, 0, 1, 0.09411765, 1,
-0.3142356, 1.011232, 1.224919, 0, 1, 0.1019608, 1,
-0.3128525, 2.051696, 0.3781942, 0, 1, 0.1058824, 1,
-0.3085397, -0.1059903, -1.270943, 0, 1, 0.1137255, 1,
-0.3080725, 1.14237, 0.04621295, 0, 1, 0.1176471, 1,
-0.3001283, -0.2920115, -1.976095, 0, 1, 0.1254902, 1,
-0.2984589, 0.5202373, -1.204401, 0, 1, 0.1294118, 1,
-0.291299, 0.485812, -1.777907, 0, 1, 0.1372549, 1,
-0.2909934, -1.237251, -4.539779, 0, 1, 0.1411765, 1,
-0.2894388, 0.3918006, -0.1953923, 0, 1, 0.1490196, 1,
-0.2879009, 1.743686, 0.6036383, 0, 1, 0.1529412, 1,
-0.2863378, 0.1749016, -0.4974974, 0, 1, 0.1607843, 1,
-0.2855469, 1.250661, -0.9800118, 0, 1, 0.1647059, 1,
-0.2854474, 0.1366716, -1.639756, 0, 1, 0.172549, 1,
-0.2845287, -2.167182, -2.727349, 0, 1, 0.1764706, 1,
-0.2837895, 0.01762677, -2.754709, 0, 1, 0.1843137, 1,
-0.2780631, -0.4174376, -1.406534, 0, 1, 0.1882353, 1,
-0.2754983, -1.172016, -3.642022, 0, 1, 0.1960784, 1,
-0.2734541, -0.5166679, -3.701528, 0, 1, 0.2039216, 1,
-0.2722031, -0.4500886, -3.677427, 0, 1, 0.2078431, 1,
-0.2702391, -0.10393, -2.498263, 0, 1, 0.2156863, 1,
-0.2679658, 0.4834222, -0.7787756, 0, 1, 0.2196078, 1,
-0.2605134, -0.999689, -3.863019, 0, 1, 0.227451, 1,
-0.2575047, 0.2402812, -0.5846571, 0, 1, 0.2313726, 1,
-0.2541817, -0.3155727, -0.8593654, 0, 1, 0.2392157, 1,
-0.2532593, 1.071814, 0.5565929, 0, 1, 0.2431373, 1,
-0.2526161, 1.744805, -0.7521131, 0, 1, 0.2509804, 1,
-0.2502053, 1.682825, -1.147154, 0, 1, 0.254902, 1,
-0.2488117, 0.3114339, 0.2069139, 0, 1, 0.2627451, 1,
-0.2433786, 0.5920014, -1.846482, 0, 1, 0.2666667, 1,
-0.2386261, 0.8862092, 0.05574877, 0, 1, 0.2745098, 1,
-0.228619, 0.2031307, 0.9739122, 0, 1, 0.2784314, 1,
-0.2271907, -0.5117391, -1.594442, 0, 1, 0.2862745, 1,
-0.2254856, -0.2384571, -2.76934, 0, 1, 0.2901961, 1,
-0.2253819, 0.8405016, -0.7589128, 0, 1, 0.2980392, 1,
-0.2231378, -0.6371583, -3.544101, 0, 1, 0.3058824, 1,
-0.2227947, 1.106292, -0.2669609, 0, 1, 0.3098039, 1,
-0.2133313, 0.9973269, 0.8810491, 0, 1, 0.3176471, 1,
-0.2068624, -1.04181, -1.74713, 0, 1, 0.3215686, 1,
-0.2045674, -2.01984, -4.438593, 0, 1, 0.3294118, 1,
-0.2044447, 0.148231, -3.576844, 0, 1, 0.3333333, 1,
-0.1984604, -0.2212871, -2.596703, 0, 1, 0.3411765, 1,
-0.1863788, 0.2756471, -0.3301634, 0, 1, 0.345098, 1,
-0.1844351, 0.1054708, -2.197467, 0, 1, 0.3529412, 1,
-0.1783258, -0.1779075, -0.2672556, 0, 1, 0.3568628, 1,
-0.1774252, 2.017262, -1.513585, 0, 1, 0.3647059, 1,
-0.1714365, 1.193824, 0.1483988, 0, 1, 0.3686275, 1,
-0.1708261, -0.2346199, -1.325005, 0, 1, 0.3764706, 1,
-0.1707703, 0.2699497, -1.579261, 0, 1, 0.3803922, 1,
-0.1703648, -0.4261853, -1.998171, 0, 1, 0.3882353, 1,
-0.1682344, 0.5589643, 0.002079767, 0, 1, 0.3921569, 1,
-0.1678589, 0.2827424, -0.9483781, 0, 1, 0.4, 1,
-0.1617001, -0.1019507, -2.324529, 0, 1, 0.4078431, 1,
-0.1607483, 0.3150774, 1.318725, 0, 1, 0.4117647, 1,
-0.1587637, -0.06112916, -2.285109, 0, 1, 0.4196078, 1,
-0.1558822, 0.4684187, -0.4672454, 0, 1, 0.4235294, 1,
-0.1542693, 1.130982, -1.755505, 0, 1, 0.4313726, 1,
-0.1533512, -1.575887, -0.8218268, 0, 1, 0.4352941, 1,
-0.1531627, -0.07627552, -2.394192, 0, 1, 0.4431373, 1,
-0.1525043, -0.6616318, -5.394076, 0, 1, 0.4470588, 1,
-0.15081, 0.3995095, -1.496663, 0, 1, 0.454902, 1,
-0.149956, -0.426493, -2.397912, 0, 1, 0.4588235, 1,
-0.145376, 1.064293, 0.5030857, 0, 1, 0.4666667, 1,
-0.1417395, -0.5908389, -4.654031, 0, 1, 0.4705882, 1,
-0.1377606, -0.7332054, -4.838548, 0, 1, 0.4784314, 1,
-0.1367597, 0.3264922, 0.4722399, 0, 1, 0.4823529, 1,
-0.1305537, 1.002393, 0.9573205, 0, 1, 0.4901961, 1,
-0.1299644, 0.3271335, 0.07988661, 0, 1, 0.4941176, 1,
-0.1280596, 0.0664935, -2.064113, 0, 1, 0.5019608, 1,
-0.1255226, -0.4678315, -1.883659, 0, 1, 0.509804, 1,
-0.1250894, -0.1400638, -2.90239, 0, 1, 0.5137255, 1,
-0.1161096, 0.2025023, 0.1758974, 0, 1, 0.5215687, 1,
-0.1143904, -0.05725466, -4.060733, 0, 1, 0.5254902, 1,
-0.1097906, 0.5145347, -1.322337, 0, 1, 0.5333334, 1,
-0.1069917, -0.5046246, -5.252534, 0, 1, 0.5372549, 1,
-0.1059031, 0.9864889, -1.174834, 0, 1, 0.5450981, 1,
-0.1051305, 0.3235115, 1.219875, 0, 1, 0.5490196, 1,
-0.1001618, -0.06030806, -0.7321279, 0, 1, 0.5568628, 1,
-0.09592673, 0.2738695, 0.7296983, 0, 1, 0.5607843, 1,
-0.09447217, 0.0130303, -1.316763, 0, 1, 0.5686275, 1,
-0.09049302, -0.02401763, -1.133635, 0, 1, 0.572549, 1,
-0.08993454, 0.4214175, -0.3525328, 0, 1, 0.5803922, 1,
-0.08533069, 1.183806, -0.6280932, 0, 1, 0.5843138, 1,
-0.0827049, 0.3796509, 0.2693368, 0, 1, 0.5921569, 1,
-0.08214355, 0.03183679, -0.0323582, 0, 1, 0.5960785, 1,
-0.08184321, -1.828204, -4.684534, 0, 1, 0.6039216, 1,
-0.08096396, 0.09421803, -0.3095272, 0, 1, 0.6117647, 1,
-0.08013466, 0.5246197, 0.2524332, 0, 1, 0.6156863, 1,
-0.07949048, 1.978163, 0.8597977, 0, 1, 0.6235294, 1,
-0.07791544, -0.2868395, -2.216697, 0, 1, 0.627451, 1,
-0.07074185, -3.369965, -3.346086, 0, 1, 0.6352941, 1,
-0.0692602, 0.230143, 1.00349, 0, 1, 0.6392157, 1,
-0.06844809, -0.06302385, -1.712636, 0, 1, 0.6470588, 1,
-0.06642977, 0.9521981, 1.899186, 0, 1, 0.6509804, 1,
-0.06528222, -0.2276908, -3.098264, 0, 1, 0.6588235, 1,
-0.06274532, 0.1299053, -0.1934007, 0, 1, 0.6627451, 1,
-0.06262618, 0.1595721, -1.160696, 0, 1, 0.6705883, 1,
-0.05255147, -0.3542728, -1.539799, 0, 1, 0.6745098, 1,
-0.04973674, -0.6669737, -3.126553, 0, 1, 0.682353, 1,
-0.04807985, 0.5011104, 0.2858123, 0, 1, 0.6862745, 1,
-0.04762052, 0.5288175, 1.973704, 0, 1, 0.6941177, 1,
-0.04487525, -0.928776, -1.566011, 0, 1, 0.7019608, 1,
-0.04316911, -0.4754235, -5.135945, 0, 1, 0.7058824, 1,
-0.03696753, -1.262925, -3.994905, 0, 1, 0.7137255, 1,
-0.03429156, 0.1442171, 1.520549, 0, 1, 0.7176471, 1,
-0.02496946, 0.7519214, -0.4762347, 0, 1, 0.7254902, 1,
-0.02472766, -1.866664, -3.58075, 0, 1, 0.7294118, 1,
-0.02116222, 0.07610876, 0.8570716, 0, 1, 0.7372549, 1,
-0.01998964, 0.1098103, -1.937535, 0, 1, 0.7411765, 1,
-0.0169955, 2.865746, -1.505497, 0, 1, 0.7490196, 1,
-0.01341229, 0.02629208, -2.638765, 0, 1, 0.7529412, 1,
-0.01244477, -0.1573242, -3.559578, 0, 1, 0.7607843, 1,
-0.008427087, -0.2076704, -2.345802, 0, 1, 0.7647059, 1,
-0.008104436, 0.2994101, -0.1387066, 0, 1, 0.772549, 1,
-0.003724109, -1.116313, -4.218337, 0, 1, 0.7764706, 1,
-0.003239845, -1.858316, -3.433244, 0, 1, 0.7843137, 1,
-0.001359356, -0.5962899, -2.9535, 0, 1, 0.7882353, 1,
0.0006621005, 1.047551, 0.1133227, 0, 1, 0.7960784, 1,
0.004464671, 0.868906, 0.9689281, 0, 1, 0.8039216, 1,
0.005471233, -0.8069614, 4.381225, 0, 1, 0.8078431, 1,
0.0084698, 1.572625, 1.614823, 0, 1, 0.8156863, 1,
0.009193927, -0.4625311, 3.447103, 0, 1, 0.8196079, 1,
0.00940765, 1.446164, 1.134488, 0, 1, 0.827451, 1,
0.01228932, -0.08069585, 5.474351, 0, 1, 0.8313726, 1,
0.01423956, -0.05246577, 1.674767, 0, 1, 0.8392157, 1,
0.01583276, 0.5369471, -0.3960835, 0, 1, 0.8431373, 1,
0.01877129, 0.7325715, -1.744798, 0, 1, 0.8509804, 1,
0.02090744, 0.8123458, 0.397968, 0, 1, 0.854902, 1,
0.02349225, -0.7072103, 3.21226, 0, 1, 0.8627451, 1,
0.02353602, 0.1131834, 0.8580571, 0, 1, 0.8666667, 1,
0.02680062, -0.001364025, 1.592451, 0, 1, 0.8745098, 1,
0.02745736, 2.601665, -0.3449987, 0, 1, 0.8784314, 1,
0.02964216, -1.945961, 2.615891, 0, 1, 0.8862745, 1,
0.029776, -0.1938453, 3.190061, 0, 1, 0.8901961, 1,
0.02986494, -1.175503, 3.705033, 0, 1, 0.8980392, 1,
0.03396777, 3.304925, -0.3158053, 0, 1, 0.9058824, 1,
0.03532384, -0.3748274, 1.398993, 0, 1, 0.9098039, 1,
0.03734155, -1.120682, 1.534514, 0, 1, 0.9176471, 1,
0.03986974, -0.8930277, 3.633054, 0, 1, 0.9215686, 1,
0.04062828, 0.7846029, 0.3521135, 0, 1, 0.9294118, 1,
0.04265813, -0.5060135, 2.710516, 0, 1, 0.9333333, 1,
0.0434028, 1.171702, 0.4384988, 0, 1, 0.9411765, 1,
0.04720037, -1.231065, 3.293514, 0, 1, 0.945098, 1,
0.04819289, 1.586218, -0.06964813, 0, 1, 0.9529412, 1,
0.04931551, 0.6129859, 0.5769804, 0, 1, 0.9568627, 1,
0.05054799, 0.08436238, 1.246786, 0, 1, 0.9647059, 1,
0.05111384, -1.288921, 3.711417, 0, 1, 0.9686275, 1,
0.05250348, 1.261593, -0.253544, 0, 1, 0.9764706, 1,
0.0527, -0.57209, 0.8932765, 0, 1, 0.9803922, 1,
0.0537262, 1.179502, -2.182579, 0, 1, 0.9882353, 1,
0.05612496, -0.4966506, 2.080957, 0, 1, 0.9921569, 1,
0.05823015, -0.6531862, 1.85039, 0, 1, 1, 1,
0.06098788, 0.2264552, 1.089523, 0, 0.9921569, 1, 1,
0.06203909, -0.2762586, 1.697345, 0, 0.9882353, 1, 1,
0.06268512, -0.3451134, 1.434521, 0, 0.9803922, 1, 1,
0.0646248, 0.7716686, -0.1300937, 0, 0.9764706, 1, 1,
0.06667035, -0.4653537, 3.565739, 0, 0.9686275, 1, 1,
0.06817827, -1.421912, 2.390537, 0, 0.9647059, 1, 1,
0.06900652, -2.414374, 3.137404, 0, 0.9568627, 1, 1,
0.06965741, 0.1297402, -0.8797097, 0, 0.9529412, 1, 1,
0.07059026, -0.9039554, 3.09342, 0, 0.945098, 1, 1,
0.07725501, 0.5213729, 1.639518, 0, 0.9411765, 1, 1,
0.08341191, -1.790942, 3.239975, 0, 0.9333333, 1, 1,
0.08972627, -0.2399788, 3.560722, 0, 0.9294118, 1, 1,
0.09114111, -0.357368, 0.7448665, 0, 0.9215686, 1, 1,
0.09472328, 0.1999035, -3.067183, 0, 0.9176471, 1, 1,
0.09942477, -1.050852, 3.88544, 0, 0.9098039, 1, 1,
0.1017395, 0.4919798, -1.761362, 0, 0.9058824, 1, 1,
0.1017535, 0.7008545, -0.9827538, 0, 0.8980392, 1, 1,
0.105017, 0.4035928, 2.248817, 0, 0.8901961, 1, 1,
0.105601, -0.1822761, 2.253794, 0, 0.8862745, 1, 1,
0.1056217, -0.1991483, 3.525354, 0, 0.8784314, 1, 1,
0.1070472, -1.104499, 4.334198, 0, 0.8745098, 1, 1,
0.1082427, -1.374002, 3.035254, 0, 0.8666667, 1, 1,
0.111245, -0.356311, 2.449899, 0, 0.8627451, 1, 1,
0.1127521, 0.1144133, -0.5164478, 0, 0.854902, 1, 1,
0.1130415, 0.1989539, -0.5892563, 0, 0.8509804, 1, 1,
0.1140471, -1.088677, 2.516639, 0, 0.8431373, 1, 1,
0.1156896, 0.4672073, 0.1707255, 0, 0.8392157, 1, 1,
0.1263361, 0.6426654, -0.1450668, 0, 0.8313726, 1, 1,
0.1273689, 0.6287295, -0.4806379, 0, 0.827451, 1, 1,
0.1282338, 0.4204744, 0.4015841, 0, 0.8196079, 1, 1,
0.1301447, 0.1558231, -0.139149, 0, 0.8156863, 1, 1,
0.1313382, 0.7522607, 1.912879, 0, 0.8078431, 1, 1,
0.133808, -0.2654511, 2.227851, 0, 0.8039216, 1, 1,
0.1338114, 0.4548008, -0.1712543, 0, 0.7960784, 1, 1,
0.1342708, 0.1578582, 1.168294, 0, 0.7882353, 1, 1,
0.1353338, -0.0939216, 1.477863, 0, 0.7843137, 1, 1,
0.1483444, -0.6443346, 2.68416, 0, 0.7764706, 1, 1,
0.1509878, 0.4827861, 0.9191367, 0, 0.772549, 1, 1,
0.1556453, 0.9312757, 0.4916781, 0, 0.7647059, 1, 1,
0.156739, 0.00683551, 3.921488, 0, 0.7607843, 1, 1,
0.1573648, 1.025899, 0.9159061, 0, 0.7529412, 1, 1,
0.1603411, -0.2028459, 2.064599, 0, 0.7490196, 1, 1,
0.1614019, 0.8564053, 0.7987766, 0, 0.7411765, 1, 1,
0.1652202, -0.4987034, 3.715047, 0, 0.7372549, 1, 1,
0.167514, 0.6459902, 0.02372144, 0, 0.7294118, 1, 1,
0.1695812, 1.02782, 0.7942565, 0, 0.7254902, 1, 1,
0.1696516, -0.8705542, 0.684208, 0, 0.7176471, 1, 1,
0.1710779, 1.522046, 1.271939, 0, 0.7137255, 1, 1,
0.1741319, 0.2610362, 2.134666, 0, 0.7058824, 1, 1,
0.1765231, 1.009132, 1.129783, 0, 0.6980392, 1, 1,
0.1806706, -1.217581, 1.614809, 0, 0.6941177, 1, 1,
0.1839768, -2.670961, 0.9381287, 0, 0.6862745, 1, 1,
0.1874651, -0.4242255, 2.757563, 0, 0.682353, 1, 1,
0.1883315, -1.032707, 2.464557, 0, 0.6745098, 1, 1,
0.1890553, -0.4179803, 3.254444, 0, 0.6705883, 1, 1,
0.1897478, -0.4539636, 2.103365, 0, 0.6627451, 1, 1,
0.1898756, 0.1649026, 1.382413, 0, 0.6588235, 1, 1,
0.1944596, 1.793756, -0.3284758, 0, 0.6509804, 1, 1,
0.1988734, -1.085992, 2.512147, 0, 0.6470588, 1, 1,
0.1999619, 0.4430672, 0.9165045, 0, 0.6392157, 1, 1,
0.2018591, -0.04445428, -0.5833111, 0, 0.6352941, 1, 1,
0.2041027, 0.2883174, -0.2030424, 0, 0.627451, 1, 1,
0.2050928, 0.7891736, -0.619692, 0, 0.6235294, 1, 1,
0.2074852, 0.7459323, -0.2000317, 0, 0.6156863, 1, 1,
0.2108012, -0.8548262, 2.825821, 0, 0.6117647, 1, 1,
0.2130697, 0.1681352, 0.3410412, 0, 0.6039216, 1, 1,
0.2142739, 1.378113, -0.7708206, 0, 0.5960785, 1, 1,
0.2163447, -0.1318083, 3.950131, 0, 0.5921569, 1, 1,
0.2180067, -2.460447, 2.528434, 0, 0.5843138, 1, 1,
0.218369, -0.1234946, 1.351013, 0, 0.5803922, 1, 1,
0.2214412, 1.408521, 0.9756624, 0, 0.572549, 1, 1,
0.2226228, -1.650837, 2.618499, 0, 0.5686275, 1, 1,
0.2251786, -0.5318348, 1.666909, 0, 0.5607843, 1, 1,
0.2292171, 0.7154672, -0.8228, 0, 0.5568628, 1, 1,
0.2294678, 0.04502956, 0.4481366, 0, 0.5490196, 1, 1,
0.2299985, 1.229216, 1.288046, 0, 0.5450981, 1, 1,
0.2310093, -0.2383901, 2.874968, 0, 0.5372549, 1, 1,
0.2357503, -0.6993197, 4.529033, 0, 0.5333334, 1, 1,
0.2362806, -0.3164305, 2.881728, 0, 0.5254902, 1, 1,
0.2389188, 1.385699, -0.009846953, 0, 0.5215687, 1, 1,
0.2423393, 1.495465, -0.2374865, 0, 0.5137255, 1, 1,
0.242658, -0.2131753, 3.042932, 0, 0.509804, 1, 1,
0.2440985, -0.703642, 2.825424, 0, 0.5019608, 1, 1,
0.2452652, -1.355821, 0.7894345, 0, 0.4941176, 1, 1,
0.2466146, -0.09053059, 2.385761, 0, 0.4901961, 1, 1,
0.2483483, 0.2578334, -0.2980487, 0, 0.4823529, 1, 1,
0.2492509, -0.2398061, 2.888076, 0, 0.4784314, 1, 1,
0.2523839, 0.4540238, 1.017909, 0, 0.4705882, 1, 1,
0.2535941, 2.621901, 1.814891, 0, 0.4666667, 1, 1,
0.2571994, 0.1271413, -0.8271669, 0, 0.4588235, 1, 1,
0.2607957, 0.446573, -0.9652431, 0, 0.454902, 1, 1,
0.2651685, 0.1869582, 0.7977735, 0, 0.4470588, 1, 1,
0.2657362, -0.6000847, 0.7232018, 0, 0.4431373, 1, 1,
0.2695238, 0.229692, 0.0569331, 0, 0.4352941, 1, 1,
0.2696336, 1.061914, 0.5172852, 0, 0.4313726, 1, 1,
0.2737567, 1.863586, -0.5931391, 0, 0.4235294, 1, 1,
0.2743212, 0.4517409, 2.58686, 0, 0.4196078, 1, 1,
0.2780327, -0.1983604, 1.504853, 0, 0.4117647, 1, 1,
0.2782096, 0.8106003, 0.7476244, 0, 0.4078431, 1, 1,
0.2786874, -0.8634479, 3.614421, 0, 0.4, 1, 1,
0.2810573, 0.7977394, 0.2336376, 0, 0.3921569, 1, 1,
0.2813134, 0.5937528, -0.8715985, 0, 0.3882353, 1, 1,
0.2834415, -0.8085092, 3.747502, 0, 0.3803922, 1, 1,
0.2847923, 1.227661, -0.8153985, 0, 0.3764706, 1, 1,
0.2861267, -0.1499446, 3.458721, 0, 0.3686275, 1, 1,
0.2864671, 1.018765, 3.040336, 0, 0.3647059, 1, 1,
0.2904676, 0.1574192, 0.8050396, 0, 0.3568628, 1, 1,
0.2905315, -1.469227, 3.028287, 0, 0.3529412, 1, 1,
0.2930447, -0.9210301, 1.845724, 0, 0.345098, 1, 1,
0.293217, -0.9778604, 4.558394, 0, 0.3411765, 1, 1,
0.30045, -0.3567037, 1.088367, 0, 0.3333333, 1, 1,
0.30371, 0.7190476, 1.036057, 0, 0.3294118, 1, 1,
0.3048083, -0.5522717, 1.416198, 0, 0.3215686, 1, 1,
0.3054319, -0.5128195, 0.9460766, 0, 0.3176471, 1, 1,
0.3060811, 0.9677262, 0.800049, 0, 0.3098039, 1, 1,
0.3078679, 1.62665, 1.044593, 0, 0.3058824, 1, 1,
0.3119536, -0.6911851, 3.28718, 0, 0.2980392, 1, 1,
0.312001, -0.6848971, 3.643991, 0, 0.2901961, 1, 1,
0.3169393, 1.280091, -0.2863056, 0, 0.2862745, 1, 1,
0.3198361, 0.06176758, 1.220558, 0, 0.2784314, 1, 1,
0.3209379, -0.7748845, 2.119653, 0, 0.2745098, 1, 1,
0.3232281, -1.180956, 3.038203, 0, 0.2666667, 1, 1,
0.3312677, 0.3683315, 0.8267709, 0, 0.2627451, 1, 1,
0.3355577, 0.9508884, 0.3945703, 0, 0.254902, 1, 1,
0.3359916, -1.368936, 2.216805, 0, 0.2509804, 1, 1,
0.3371152, 0.7310054, 0.8135772, 0, 0.2431373, 1, 1,
0.3395114, -1.057774, 1.223617, 0, 0.2392157, 1, 1,
0.3418547, -1.59438, 2.770895, 0, 0.2313726, 1, 1,
0.3431449, 1.191641, -0.03459855, 0, 0.227451, 1, 1,
0.3496601, -1.603912, 4.300272, 0, 0.2196078, 1, 1,
0.3554397, -0.9708524, 1.374113, 0, 0.2156863, 1, 1,
0.3580997, -0.8657982, 2.721072, 0, 0.2078431, 1, 1,
0.3640596, 0.0672657, 1.205137, 0, 0.2039216, 1, 1,
0.3650019, 0.8093187, 0.4337265, 0, 0.1960784, 1, 1,
0.3664522, 0.4582043, -0.6482194, 0, 0.1882353, 1, 1,
0.366487, -0.1529289, 1.098818, 0, 0.1843137, 1, 1,
0.3668966, 0.6784254, -0.166964, 0, 0.1764706, 1, 1,
0.3674651, 2.230464, 1.146822, 0, 0.172549, 1, 1,
0.3690571, -0.3209464, 3.387403, 0, 0.1647059, 1, 1,
0.3692372, -1.145317, 1.512856, 0, 0.1607843, 1, 1,
0.3741198, 1.526883, 1.81258, 0, 0.1529412, 1, 1,
0.3779254, 1.312529, -0.4235807, 0, 0.1490196, 1, 1,
0.3835073, -0.2554295, 3.274999, 0, 0.1411765, 1, 1,
0.3868704, 1.017579, 0.04746053, 0, 0.1372549, 1, 1,
0.3875815, 0.3424214, 1.27174, 0, 0.1294118, 1, 1,
0.3930132, 0.7117763, 0.4807613, 0, 0.1254902, 1, 1,
0.4016892, 0.8103817, -0.8644643, 0, 0.1176471, 1, 1,
0.4064521, 0.02451746, 1.439171, 0, 0.1137255, 1, 1,
0.4106394, -0.2361983, 0.3488089, 0, 0.1058824, 1, 1,
0.4114758, -1.971508, 2.925131, 0, 0.09803922, 1, 1,
0.4136961, 0.5330663, -0.3877539, 0, 0.09411765, 1, 1,
0.4147941, 1.099256, 0.3787157, 0, 0.08627451, 1, 1,
0.4154941, -0.8851534, 1.974856, 0, 0.08235294, 1, 1,
0.4176849, 0.2064933, -0.3541764, 0, 0.07450981, 1, 1,
0.4185442, -0.1436754, 2.08882, 0, 0.07058824, 1, 1,
0.4251919, 0.1064681, 1.423061, 0, 0.0627451, 1, 1,
0.4254868, 0.6891447, 1.437726, 0, 0.05882353, 1, 1,
0.4278521, -0.6556495, 1.474547, 0, 0.05098039, 1, 1,
0.4288383, -0.2594892, 2.024092, 0, 0.04705882, 1, 1,
0.4348609, -1.674549, 3.660589, 0, 0.03921569, 1, 1,
0.4361753, -1.585787, 3.652986, 0, 0.03529412, 1, 1,
0.4396798, -0.1428153, 2.864333, 0, 0.02745098, 1, 1,
0.4416761, 0.9079188, 2.184103, 0, 0.02352941, 1, 1,
0.442131, -0.009627082, 2.130301, 0, 0.01568628, 1, 1,
0.4451591, -1.703191, 3.125277, 0, 0.01176471, 1, 1,
0.4451602, -1.164511, 2.340776, 0, 0.003921569, 1, 1,
0.4459377, -1.912708, 3.778885, 0.003921569, 0, 1, 1,
0.4492821, 0.2465165, 0.6737303, 0.007843138, 0, 1, 1,
0.4502512, -0.1968566, 0.5860857, 0.01568628, 0, 1, 1,
0.4516669, -0.5697539, 2.050081, 0.01960784, 0, 1, 1,
0.454935, -1.283485, 3.671197, 0.02745098, 0, 1, 1,
0.4636413, -0.7134229, 4.099806, 0.03137255, 0, 1, 1,
0.465687, 1.988986, 0.5299862, 0.03921569, 0, 1, 1,
0.4658471, 0.6763621, 1.887724, 0.04313726, 0, 1, 1,
0.4660597, -0.4324894, 2.442345, 0.05098039, 0, 1, 1,
0.4698557, -0.2003474, 2.590214, 0.05490196, 0, 1, 1,
0.4705595, 1.338737, -0.481871, 0.0627451, 0, 1, 1,
0.4706185, 0.955181, 0.6896864, 0.06666667, 0, 1, 1,
0.4726505, 0.0378461, 0.2997279, 0.07450981, 0, 1, 1,
0.4727218, 0.2302637, 1.754674, 0.07843138, 0, 1, 1,
0.4801016, 0.5202188, -0.1083774, 0.08627451, 0, 1, 1,
0.4907423, 0.951427, 0.3121091, 0.09019608, 0, 1, 1,
0.4930054, -1.044886, 2.92276, 0.09803922, 0, 1, 1,
0.493292, 0.4383804, 1.089337, 0.1058824, 0, 1, 1,
0.4969406, 0.8727213, -0.8539031, 0.1098039, 0, 1, 1,
0.4985573, 1.095758, -0.1605632, 0.1176471, 0, 1, 1,
0.5008162, -0.4311489, 1.533582, 0.1215686, 0, 1, 1,
0.5017357, -0.8121524, 3.932286, 0.1294118, 0, 1, 1,
0.5072969, 0.9017593, -0.7949477, 0.1333333, 0, 1, 1,
0.5099915, 0.5482624, 1.260253, 0.1411765, 0, 1, 1,
0.5104812, 0.2250907, 2.264257, 0.145098, 0, 1, 1,
0.5114809, -0.7406175, 2.182791, 0.1529412, 0, 1, 1,
0.5161697, 0.06340209, 2.255808, 0.1568628, 0, 1, 1,
0.5171397, 0.6489375, 0.7108525, 0.1647059, 0, 1, 1,
0.5194312, -0.12018, 3.24816, 0.1686275, 0, 1, 1,
0.5212683, 1.2703, -0.132127, 0.1764706, 0, 1, 1,
0.5217431, 0.2147369, 1.60895, 0.1803922, 0, 1, 1,
0.5241817, 0.2497264, 2.183356, 0.1882353, 0, 1, 1,
0.5284604, -1.513444, 1.976075, 0.1921569, 0, 1, 1,
0.5292306, 2.514642, 0.1857613, 0.2, 0, 1, 1,
0.5295065, 1.571313, 0.8240787, 0.2078431, 0, 1, 1,
0.5310934, 0.5839548, 0.8132941, 0.2117647, 0, 1, 1,
0.5326736, 0.07154109, 2.316509, 0.2196078, 0, 1, 1,
0.5327087, 0.8049102, 0.6441638, 0.2235294, 0, 1, 1,
0.5433663, 0.04497363, -0.02653004, 0.2313726, 0, 1, 1,
0.5438255, -0.4403374, 1.672162, 0.2352941, 0, 1, 1,
0.5459051, 0.832554, 0.8847699, 0.2431373, 0, 1, 1,
0.5506309, -1.258352, 4.740544, 0.2470588, 0, 1, 1,
0.5509237, 0.4379943, 0.7610349, 0.254902, 0, 1, 1,
0.5509323, -0.4551227, 2.480307, 0.2588235, 0, 1, 1,
0.5521724, 0.7713863, 0.5540551, 0.2666667, 0, 1, 1,
0.5540468, 0.3829314, -0.2279385, 0.2705882, 0, 1, 1,
0.5585226, 0.1886762, 0.423876, 0.2784314, 0, 1, 1,
0.5605572, -1.146318, 2.857167, 0.282353, 0, 1, 1,
0.5628184, -0.5073567, 3.943114, 0.2901961, 0, 1, 1,
0.5653474, -1.172322, 1.333509, 0.2941177, 0, 1, 1,
0.5691401, -0.5772347, 1.259037, 0.3019608, 0, 1, 1,
0.5699806, 1.764031, 1.696358, 0.3098039, 0, 1, 1,
0.5781114, -0.6327893, 1.643958, 0.3137255, 0, 1, 1,
0.5792868, 0.1733932, 0.4814148, 0.3215686, 0, 1, 1,
0.5808403, 0.1612632, -0.05723505, 0.3254902, 0, 1, 1,
0.5829569, 0.1369293, 2.930544, 0.3333333, 0, 1, 1,
0.5846335, 1.200218, -0.2412235, 0.3372549, 0, 1, 1,
0.5972739, -1.414294, 3.074321, 0.345098, 0, 1, 1,
0.599635, 0.8445929, -0.5812163, 0.3490196, 0, 1, 1,
0.6022199, 0.3530627, 0.2569588, 0.3568628, 0, 1, 1,
0.6029868, 0.2554825, 0.7600459, 0.3607843, 0, 1, 1,
0.6030093, 0.822451, 0.7758101, 0.3686275, 0, 1, 1,
0.6044841, -0.6816791, 2.215762, 0.372549, 0, 1, 1,
0.6083778, -0.5007346, 3.215307, 0.3803922, 0, 1, 1,
0.6095076, -0.6762112, 2.266352, 0.3843137, 0, 1, 1,
0.6126431, 0.3150469, 0.5637245, 0.3921569, 0, 1, 1,
0.6126925, -0.2714863, 1.897153, 0.3960784, 0, 1, 1,
0.6162632, 0.2716699, 1.403475, 0.4039216, 0, 1, 1,
0.616434, 0.3384469, -0.1717975, 0.4117647, 0, 1, 1,
0.6200508, 1.754465, 0.879554, 0.4156863, 0, 1, 1,
0.6322719, 0.03136848, 1.44002, 0.4235294, 0, 1, 1,
0.6335712, 0.441965, 1.706783, 0.427451, 0, 1, 1,
0.6350099, 1.01949, -0.5554628, 0.4352941, 0, 1, 1,
0.6351033, -0.447427, 3.254905, 0.4392157, 0, 1, 1,
0.6405421, -1.765433, 1.161555, 0.4470588, 0, 1, 1,
0.6420375, 0.4888799, 1.771005, 0.4509804, 0, 1, 1,
0.642495, -0.4735041, 3.373638, 0.4588235, 0, 1, 1,
0.6523412, 0.2102294, 1.144421, 0.4627451, 0, 1, 1,
0.6536854, -0.9344419, 3.10532, 0.4705882, 0, 1, 1,
0.6561253, 0.5606804, 0.2138647, 0.4745098, 0, 1, 1,
0.6621479, -0.5493344, 3.16051, 0.4823529, 0, 1, 1,
0.6622621, -0.83869, 3.415467, 0.4862745, 0, 1, 1,
0.6640873, -1.014407, 2.688486, 0.4941176, 0, 1, 1,
0.6651052, -1.002979, 3.381803, 0.5019608, 0, 1, 1,
0.6741883, 0.5709978, 1.020574, 0.5058824, 0, 1, 1,
0.6752689, -0.1845602, 2.287014, 0.5137255, 0, 1, 1,
0.6769341, 1.054179, 0.8789437, 0.5176471, 0, 1, 1,
0.6787078, -0.6871024, 2.4964, 0.5254902, 0, 1, 1,
0.6788788, -1.232985, 3.078101, 0.5294118, 0, 1, 1,
0.6791662, 1.55818, -0.1096714, 0.5372549, 0, 1, 1,
0.6822481, 0.7242478, 1.517143, 0.5411765, 0, 1, 1,
0.6831356, -0.6208776, 1.308932, 0.5490196, 0, 1, 1,
0.6861405, 1.61376, -1.602305, 0.5529412, 0, 1, 1,
0.6898925, -0.6049567, 2.088157, 0.5607843, 0, 1, 1,
0.696247, 2.411183, -0.5307419, 0.5647059, 0, 1, 1,
0.6963657, 0.9133336, 0.5907224, 0.572549, 0, 1, 1,
0.7009555, -0.9274679, 3.063168, 0.5764706, 0, 1, 1,
0.7133178, -0.4708309, -0.267648, 0.5843138, 0, 1, 1,
0.7156468, -0.9695989, 3.202999, 0.5882353, 0, 1, 1,
0.718044, 1.333246, 0.5704015, 0.5960785, 0, 1, 1,
0.7252194, -1.18503, 4.336137, 0.6039216, 0, 1, 1,
0.7298064, 0.3406845, -0.1817952, 0.6078432, 0, 1, 1,
0.7365673, 0.6553458, 0.07672413, 0.6156863, 0, 1, 1,
0.7546173, -1.531921, 3.18584, 0.6196079, 0, 1, 1,
0.7585194, -1.051288, 3.068137, 0.627451, 0, 1, 1,
0.7609941, -1.364744, 2.226259, 0.6313726, 0, 1, 1,
0.7629892, -1.269234, 1.36856, 0.6392157, 0, 1, 1,
0.7666023, 0.7587342, 1.644258, 0.6431373, 0, 1, 1,
0.7676876, 0.1401951, 0.9399838, 0.6509804, 0, 1, 1,
0.7749503, -0.2373395, 0.3655391, 0.654902, 0, 1, 1,
0.7798507, 1.483872, 2.477324, 0.6627451, 0, 1, 1,
0.7799698, -1.094766, 3.762763, 0.6666667, 0, 1, 1,
0.7807803, 0.7593535, 1.828416, 0.6745098, 0, 1, 1,
0.7810123, 0.2956502, -1.222549, 0.6784314, 0, 1, 1,
0.7814986, 0.352503, 3.011038, 0.6862745, 0, 1, 1,
0.7823353, 0.5226358, 2.467399, 0.6901961, 0, 1, 1,
0.7912644, -0.7066938, 0.1620175, 0.6980392, 0, 1, 1,
0.7921151, 0.01457836, 1.874007, 0.7058824, 0, 1, 1,
0.7929429, -0.6744528, 2.963469, 0.7098039, 0, 1, 1,
0.7958009, 0.4889943, 0.736144, 0.7176471, 0, 1, 1,
0.8024333, -0.23235, 2.364937, 0.7215686, 0, 1, 1,
0.8035073, 2.728554, -0.1235081, 0.7294118, 0, 1, 1,
0.8041774, 1.658382, 2.709177, 0.7333333, 0, 1, 1,
0.8062876, 0.5001171, 0.8299367, 0.7411765, 0, 1, 1,
0.8104601, 0.07795184, 1.031016, 0.7450981, 0, 1, 1,
0.81319, 0.4768875, -0.2391547, 0.7529412, 0, 1, 1,
0.815266, 0.38571, 3.453822, 0.7568628, 0, 1, 1,
0.8190849, -0.3068708, 2.039872, 0.7647059, 0, 1, 1,
0.8244861, -0.4580963, 1.889309, 0.7686275, 0, 1, 1,
0.8245267, 0.8044695, 0.9340411, 0.7764706, 0, 1, 1,
0.8280603, 1.123666, -0.3027158, 0.7803922, 0, 1, 1,
0.8289214, 0.2846949, 2.305283, 0.7882353, 0, 1, 1,
0.8300686, -1.838918, 2.752048, 0.7921569, 0, 1, 1,
0.8335945, 0.2246748, 1.488985, 0.8, 0, 1, 1,
0.8371832, 0.9865249, 2.597616, 0.8078431, 0, 1, 1,
0.8532525, -1.614802, 1.754856, 0.8117647, 0, 1, 1,
0.8551214, 1.135194, -0.9903998, 0.8196079, 0, 1, 1,
0.857309, 1.814618, 0.4950606, 0.8235294, 0, 1, 1,
0.8726383, 1.956023, -0.0663821, 0.8313726, 0, 1, 1,
0.8765299, 0.09842324, 1.13335, 0.8352941, 0, 1, 1,
0.880754, 0.9791205, 0.3777131, 0.8431373, 0, 1, 1,
0.8865317, -0.7096286, 2.727406, 0.8470588, 0, 1, 1,
0.8894733, -0.09501585, 3.54312, 0.854902, 0, 1, 1,
0.8897151, 1.097036, -0.1805691, 0.8588235, 0, 1, 1,
0.8920984, -1.326911, 0.04896528, 0.8666667, 0, 1, 1,
0.8928859, -0.0128959, 3.471933, 0.8705882, 0, 1, 1,
0.8933946, -0.3500209, 0.2883606, 0.8784314, 0, 1, 1,
0.8965042, 1.012665, 1.60054, 0.8823529, 0, 1, 1,
0.9003714, -1.345156, 3.11301, 0.8901961, 0, 1, 1,
0.9009793, -0.8742012, 2.353164, 0.8941177, 0, 1, 1,
0.9012421, 0.4391482, 1.908037, 0.9019608, 0, 1, 1,
0.9051313, -1.008618, 3.563948, 0.9098039, 0, 1, 1,
0.9061579, 0.7207388, 2.37235, 0.9137255, 0, 1, 1,
0.9069269, -0.1707315, 0.2572446, 0.9215686, 0, 1, 1,
0.9225143, 0.2026733, 1.646649, 0.9254902, 0, 1, 1,
0.9259378, 2.204873, 1.199084, 0.9333333, 0, 1, 1,
0.9259667, -0.2045917, 3.366809, 0.9372549, 0, 1, 1,
0.931551, 0.621081, -0.2444299, 0.945098, 0, 1, 1,
0.9318582, 0.2791266, 0.5540283, 0.9490196, 0, 1, 1,
0.9432421, 0.09677436, 1.760678, 0.9568627, 0, 1, 1,
0.9447501, 0.9354218, 1.347368, 0.9607843, 0, 1, 1,
0.9592282, 0.2480753, -0.02974716, 0.9686275, 0, 1, 1,
0.9618048, -0.0363776, 2.045528, 0.972549, 0, 1, 1,
0.9754, -1.100997, 1.636319, 0.9803922, 0, 1, 1,
0.9775176, 0.4669122, 1.291973, 0.9843137, 0, 1, 1,
0.9782605, 0.6066571, -0.1785977, 0.9921569, 0, 1, 1,
0.9793525, 2.596201, 0.5907829, 0.9960784, 0, 1, 1,
0.9917502, -0.6779768, 2.999158, 1, 0, 0.9960784, 1,
0.9971492, 0.5177387, -0.8701991, 1, 0, 0.9882353, 1,
1.001509, -0.1329767, 1.960308, 1, 0, 0.9843137, 1,
1.00432, 1.161203, 1.214878, 1, 0, 0.9764706, 1,
1.012943, 0.3515145, 1.252414, 1, 0, 0.972549, 1,
1.012958, 1.202294, 0.4260635, 1, 0, 0.9647059, 1,
1.013121, 0.4305691, 0.6924788, 1, 0, 0.9607843, 1,
1.025056, -1.037639, 2.580435, 1, 0, 0.9529412, 1,
1.025261, 0.8145145, -0.04597654, 1, 0, 0.9490196, 1,
1.033469, 0.6025689, 0.2335767, 1, 0, 0.9411765, 1,
1.035231, -0.1363465, 3.036778, 1, 0, 0.9372549, 1,
1.036708, -0.06431891, 0.896982, 1, 0, 0.9294118, 1,
1.038387, 2.012469, 1.22923, 1, 0, 0.9254902, 1,
1.039464, 2.267066, -0.5411251, 1, 0, 0.9176471, 1,
1.040022, 1.41106, -0.09492347, 1, 0, 0.9137255, 1,
1.043497, 1.127148, 2.339032, 1, 0, 0.9058824, 1,
1.04379, -0.6886829, 2.411835, 1, 0, 0.9019608, 1,
1.04415, -0.1676609, 0.901468, 1, 0, 0.8941177, 1,
1.054181, -0.7755439, 0.2499916, 1, 0, 0.8862745, 1,
1.059617, -0.7107354, 1.370327, 1, 0, 0.8823529, 1,
1.061533, -0.2622236, 0.8198805, 1, 0, 0.8745098, 1,
1.067407, -0.740117, 3.49617, 1, 0, 0.8705882, 1,
1.069992, 0.7692633, 0.8193262, 1, 0, 0.8627451, 1,
1.071126, -0.2521244, 3.649954, 1, 0, 0.8588235, 1,
1.076303, -0.164185, 2.066085, 1, 0, 0.8509804, 1,
1.07691, 0.4430037, 1.72582, 1, 0, 0.8470588, 1,
1.079342, -1.347944, 1.54393, 1, 0, 0.8392157, 1,
1.079889, 0.9083207, 3.694417, 1, 0, 0.8352941, 1,
1.087103, 0.973955, 0.7229373, 1, 0, 0.827451, 1,
1.087327, 0.04878161, 0.4642623, 1, 0, 0.8235294, 1,
1.089409, -0.5598931, 2.595951, 1, 0, 0.8156863, 1,
1.091168, 0.6967306, 1.53798, 1, 0, 0.8117647, 1,
1.098915, 0.7097029, 2.573589, 1, 0, 0.8039216, 1,
1.10373, -1.212342, 3.019224, 1, 0, 0.7960784, 1,
1.108464, 0.493998, -0.8705553, 1, 0, 0.7921569, 1,
1.108896, 1.010841, 1.746217, 1, 0, 0.7843137, 1,
1.11085, 1.038357, 1.807432, 1, 0, 0.7803922, 1,
1.111928, -0.7984238, 2.456471, 1, 0, 0.772549, 1,
1.116518, -0.4450902, 2.194425, 1, 0, 0.7686275, 1,
1.126007, 0.9551823, 0.4420815, 1, 0, 0.7607843, 1,
1.141234, 1.378899, -0.1932093, 1, 0, 0.7568628, 1,
1.150362, -0.1896143, 2.401504, 1, 0, 0.7490196, 1,
1.15773, 1.450954, 1.077573, 1, 0, 0.7450981, 1,
1.162884, 0.4084378, -1.45489, 1, 0, 0.7372549, 1,
1.163866, -1.585651, 3.909528, 1, 0, 0.7333333, 1,
1.168147, 1.542122, 1.832285, 1, 0, 0.7254902, 1,
1.174172, -0.01238559, 0.2971069, 1, 0, 0.7215686, 1,
1.180534, -0.9760782, 3.894538, 1, 0, 0.7137255, 1,
1.181267, -1.061907, 4.957127, 1, 0, 0.7098039, 1,
1.190773, 0.06397909, 0.6975856, 1, 0, 0.7019608, 1,
1.191553, 0.6895874, 0.294339, 1, 0, 0.6941177, 1,
1.203021, 0.3870102, 1.590886, 1, 0, 0.6901961, 1,
1.203404, 0.2072909, 1.613317, 1, 0, 0.682353, 1,
1.20612, 0.1285217, 0.4318721, 1, 0, 0.6784314, 1,
1.207756, -0.3441643, 2.27058, 1, 0, 0.6705883, 1,
1.209296, 2.238805, 0.3480741, 1, 0, 0.6666667, 1,
1.214478, -0.6062133, 1.948275, 1, 0, 0.6588235, 1,
1.219187, 0.5393068, -0.8650737, 1, 0, 0.654902, 1,
1.219463, 0.8359361, -0.6984519, 1, 0, 0.6470588, 1,
1.229798, -1.612719, 3.947276, 1, 0, 0.6431373, 1,
1.230299, 0.4123932, 0.4813767, 1, 0, 0.6352941, 1,
1.23319, 0.05643638, 3.580379, 1, 0, 0.6313726, 1,
1.241768, 0.1160415, 1.273817, 1, 0, 0.6235294, 1,
1.244687, 0.2111406, 2.14192, 1, 0, 0.6196079, 1,
1.249917, 0.9678198, 1.818394, 1, 0, 0.6117647, 1,
1.267567, -0.2133817, 1.691679, 1, 0, 0.6078432, 1,
1.27294, -0.3118753, 0.2847554, 1, 0, 0.6, 1,
1.273706, -1.232085, 2.578025, 1, 0, 0.5921569, 1,
1.274652, -0.4723461, 2.626327, 1, 0, 0.5882353, 1,
1.276087, -0.6451384, 1.361835, 1, 0, 0.5803922, 1,
1.276531, 0.5412501, 1.688733, 1, 0, 0.5764706, 1,
1.279966, 0.2226575, 0.800169, 1, 0, 0.5686275, 1,
1.288439, 1.262965, 1.568527, 1, 0, 0.5647059, 1,
1.293193, -1.527019, 1.827423, 1, 0, 0.5568628, 1,
1.294323, -0.9164684, 3.48623, 1, 0, 0.5529412, 1,
1.294631, 0.8266174, 1.264396, 1, 0, 0.5450981, 1,
1.299684, 0.2989358, 3.989448, 1, 0, 0.5411765, 1,
1.304016, 0.1308994, 0.03994675, 1, 0, 0.5333334, 1,
1.304444, -0.8050812, 3.235025, 1, 0, 0.5294118, 1,
1.30633, -1.084096, 0.8365754, 1, 0, 0.5215687, 1,
1.309593, -2.19424, 2.656893, 1, 0, 0.5176471, 1,
1.315292, 0.4036831, 2.318482, 1, 0, 0.509804, 1,
1.319322, 0.04185974, -0.3620476, 1, 0, 0.5058824, 1,
1.330551, -0.09381898, 2.150403, 1, 0, 0.4980392, 1,
1.338192, -1.094153, 2.35183, 1, 0, 0.4901961, 1,
1.339078, 0.3684878, 2.715937, 1, 0, 0.4862745, 1,
1.345696, 0.5547966, 2.432419, 1, 0, 0.4784314, 1,
1.352919, 0.786185, 2.976372, 1, 0, 0.4745098, 1,
1.367215, -0.6937727, 1.462022, 1, 0, 0.4666667, 1,
1.367343, -1.112148, 0.6648123, 1, 0, 0.4627451, 1,
1.368124, 1.440067, 0.5452399, 1, 0, 0.454902, 1,
1.371914, -0.1785181, 1.926187, 1, 0, 0.4509804, 1,
1.376059, -1.577915, 0.2990121, 1, 0, 0.4431373, 1,
1.381981, -0.7904405, 0.8700355, 1, 0, 0.4392157, 1,
1.385102, 0.6607423, 3.348737, 1, 0, 0.4313726, 1,
1.391415, -0.990218, 1.838188, 1, 0, 0.427451, 1,
1.391663, 0.08415471, 3.245741, 1, 0, 0.4196078, 1,
1.400614, 0.2340757, 2.235116, 1, 0, 0.4156863, 1,
1.401812, -0.598153, 1.879547, 1, 0, 0.4078431, 1,
1.409564, -1.385379, 3.730233, 1, 0, 0.4039216, 1,
1.411133, 2.542912, 0.2583806, 1, 0, 0.3960784, 1,
1.414621, 0.1971059, 0.8138065, 1, 0, 0.3882353, 1,
1.42054, -0.7732235, 2.478335, 1, 0, 0.3843137, 1,
1.431182, 0.4683264, 1.010143, 1, 0, 0.3764706, 1,
1.44245, -0.8644628, 2.527977, 1, 0, 0.372549, 1,
1.457531, -1.253202, 3.899479, 1, 0, 0.3647059, 1,
1.461393, -0.2186688, 3.423836, 1, 0, 0.3607843, 1,
1.472585, -0.2416593, 3.552829, 1, 0, 0.3529412, 1,
1.484642, 0.6361356, 0.8674517, 1, 0, 0.3490196, 1,
1.493785, -0.06078696, 0.7047874, 1, 0, 0.3411765, 1,
1.499782, -0.330544, 3.143892, 1, 0, 0.3372549, 1,
1.501685, -0.08148433, 1.546182, 1, 0, 0.3294118, 1,
1.510851, 1.604432, -0.3233696, 1, 0, 0.3254902, 1,
1.513184, 0.8431038, 1.854744, 1, 0, 0.3176471, 1,
1.515321, 0.04250245, 1.660022, 1, 0, 0.3137255, 1,
1.518298, -0.4276387, 2.801115, 1, 0, 0.3058824, 1,
1.540531, -1.607041, 1.255322, 1, 0, 0.2980392, 1,
1.551355, -0.9989096, 1.864095, 1, 0, 0.2941177, 1,
1.562518, -1.567868, 1.073242, 1, 0, 0.2862745, 1,
1.576114, 1.464293, 0.9615226, 1, 0, 0.282353, 1,
1.576584, 0.8655894, 0.04414253, 1, 0, 0.2745098, 1,
1.580731, -2.039144, 0.4339698, 1, 0, 0.2705882, 1,
1.59123, 0.5737707, -0.1929992, 1, 0, 0.2627451, 1,
1.597598, -1.140223, 1.867393, 1, 0, 0.2588235, 1,
1.628736, 0.1532927, 1.236819, 1, 0, 0.2509804, 1,
1.632854, -0.4865811, 1.742194, 1, 0, 0.2470588, 1,
1.654879, -0.7154545, 2.068894, 1, 0, 0.2392157, 1,
1.661079, -0.3624949, 0.9213381, 1, 0, 0.2352941, 1,
1.665218, 2.467278, 0.1197959, 1, 0, 0.227451, 1,
1.672036, 1.505456, 1.52805, 1, 0, 0.2235294, 1,
1.676789, 0.7252894, 3.197757, 1, 0, 0.2156863, 1,
1.68206, -0.8622978, 2.172109, 1, 0, 0.2117647, 1,
1.701846, -1.29193, 0.4766179, 1, 0, 0.2039216, 1,
1.774624, 0.4513734, 0.7426783, 1, 0, 0.1960784, 1,
1.791398, -0.4516743, 3.036781, 1, 0, 0.1921569, 1,
1.836693, 0.7496231, 0.07330996, 1, 0, 0.1843137, 1,
1.841259, -0.4945139, 2.618125, 1, 0, 0.1803922, 1,
1.844577, 0.7755784, 0.4923701, 1, 0, 0.172549, 1,
1.856857, 1.748267, 2.594694, 1, 0, 0.1686275, 1,
1.864671, 1.151141, 2.872116, 1, 0, 0.1607843, 1,
1.895535, -0.9439365, 0.1320005, 1, 0, 0.1568628, 1,
1.936505, 1.020905, 0.978074, 1, 0, 0.1490196, 1,
1.941912, 0.2115899, 2.133976, 1, 0, 0.145098, 1,
1.943432, -1.312703, 0.6137581, 1, 0, 0.1372549, 1,
1.946681, -0.1083555, 1.446213, 1, 0, 0.1333333, 1,
1.951542, 0.1213922, 2.79725, 1, 0, 0.1254902, 1,
1.953454, 0.3635679, 1.724829, 1, 0, 0.1215686, 1,
1.973794, 1.721546, 1.012423, 1, 0, 0.1137255, 1,
1.999626, 0.1595839, 1.369269, 1, 0, 0.1098039, 1,
2.027997, -1.043942, 3.190656, 1, 0, 0.1019608, 1,
2.063675, -0.8755538, 3.264713, 1, 0, 0.09411765, 1,
2.09209, 0.4898355, 0.1968721, 1, 0, 0.09019608, 1,
2.161129, -1.216371, 0.3534947, 1, 0, 0.08235294, 1,
2.168273, -0.9779766, 3.090824, 1, 0, 0.07843138, 1,
2.210867, -0.6313936, 3.206233, 1, 0, 0.07058824, 1,
2.221933, -0.2313755, 0.5250524, 1, 0, 0.06666667, 1,
2.249333, 0.7914881, 1.253319, 1, 0, 0.05882353, 1,
2.321736, -0.9338042, 0.8648483, 1, 0, 0.05490196, 1,
2.37895, 0.6257907, 0.6193925, 1, 0, 0.04705882, 1,
2.395804, 0.7857806, 1.059688, 1, 0, 0.04313726, 1,
2.559988, -1.566089, -0.2669832, 1, 0, 0.03529412, 1,
2.592649, 0.9118301, 0.5347065, 1, 0, 0.03137255, 1,
2.63038, -0.325661, 0.323463, 1, 0, 0.02352941, 1,
2.652373, 0.3045255, 1.451804, 1, 0, 0.01960784, 1,
2.705869, 0.009681609, 2.675965, 1, 0, 0.01176471, 1,
3.30221, 2.054546, 0.8585765, 1, 0, 0.007843138, 1
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
0.1264158, -4.501359, -7.236275, 0, -0.5, 0.5, 0.5,
0.1264158, -4.501359, -7.236275, 1, -0.5, 0.5, 0.5,
0.1264158, -4.501359, -7.236275, 1, 1.5, 0.5, 0.5,
0.1264158, -4.501359, -7.236275, 0, 1.5, 0.5, 0.5
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
-4.125973, -0.03251994, -7.236275, 0, -0.5, 0.5, 0.5,
-4.125973, -0.03251994, -7.236275, 1, -0.5, 0.5, 0.5,
-4.125973, -0.03251994, -7.236275, 1, 1.5, 0.5, 0.5,
-4.125973, -0.03251994, -7.236275, 0, 1.5, 0.5, 0.5
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
-4.125973, -4.501359, 0.04013753, 0, -0.5, 0.5, 0.5,
-4.125973, -4.501359, 0.04013753, 1, -0.5, 0.5, 0.5,
-4.125973, -4.501359, 0.04013753, 1, 1.5, 0.5, 0.5,
-4.125973, -4.501359, 0.04013753, 0, 1.5, 0.5, 0.5
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
-3, -3.470088, -5.557103,
3, -3.470088, -5.557103,
-3, -3.470088, -5.557103,
-3, -3.641967, -5.836965,
-2, -3.470088, -5.557103,
-2, -3.641967, -5.836965,
-1, -3.470088, -5.557103,
-1, -3.641967, -5.836965,
0, -3.470088, -5.557103,
0, -3.641967, -5.836965,
1, -3.470088, -5.557103,
1, -3.641967, -5.836965,
2, -3.470088, -5.557103,
2, -3.641967, -5.836965,
3, -3.470088, -5.557103,
3, -3.641967, -5.836965
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
-3, -3.985723, -6.396689, 0, -0.5, 0.5, 0.5,
-3, -3.985723, -6.396689, 1, -0.5, 0.5, 0.5,
-3, -3.985723, -6.396689, 1, 1.5, 0.5, 0.5,
-3, -3.985723, -6.396689, 0, 1.5, 0.5, 0.5,
-2, -3.985723, -6.396689, 0, -0.5, 0.5, 0.5,
-2, -3.985723, -6.396689, 1, -0.5, 0.5, 0.5,
-2, -3.985723, -6.396689, 1, 1.5, 0.5, 0.5,
-2, -3.985723, -6.396689, 0, 1.5, 0.5, 0.5,
-1, -3.985723, -6.396689, 0, -0.5, 0.5, 0.5,
-1, -3.985723, -6.396689, 1, -0.5, 0.5, 0.5,
-1, -3.985723, -6.396689, 1, 1.5, 0.5, 0.5,
-1, -3.985723, -6.396689, 0, 1.5, 0.5, 0.5,
0, -3.985723, -6.396689, 0, -0.5, 0.5, 0.5,
0, -3.985723, -6.396689, 1, -0.5, 0.5, 0.5,
0, -3.985723, -6.396689, 1, 1.5, 0.5, 0.5,
0, -3.985723, -6.396689, 0, 1.5, 0.5, 0.5,
1, -3.985723, -6.396689, 0, -0.5, 0.5, 0.5,
1, -3.985723, -6.396689, 1, -0.5, 0.5, 0.5,
1, -3.985723, -6.396689, 1, 1.5, 0.5, 0.5,
1, -3.985723, -6.396689, 0, 1.5, 0.5, 0.5,
2, -3.985723, -6.396689, 0, -0.5, 0.5, 0.5,
2, -3.985723, -6.396689, 1, -0.5, 0.5, 0.5,
2, -3.985723, -6.396689, 1, 1.5, 0.5, 0.5,
2, -3.985723, -6.396689, 0, 1.5, 0.5, 0.5,
3, -3.985723, -6.396689, 0, -0.5, 0.5, 0.5,
3, -3.985723, -6.396689, 1, -0.5, 0.5, 0.5,
3, -3.985723, -6.396689, 1, 1.5, 0.5, 0.5,
3, -3.985723, -6.396689, 0, 1.5, 0.5, 0.5
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
-3.144652, -3, -5.557103,
-3.144652, 3, -5.557103,
-3.144652, -3, -5.557103,
-3.308206, -3, -5.836965,
-3.144652, -2, -5.557103,
-3.308206, -2, -5.836965,
-3.144652, -1, -5.557103,
-3.308206, -1, -5.836965,
-3.144652, 0, -5.557103,
-3.308206, 0, -5.836965,
-3.144652, 1, -5.557103,
-3.308206, 1, -5.836965,
-3.144652, 2, -5.557103,
-3.308206, 2, -5.836965,
-3.144652, 3, -5.557103,
-3.308206, 3, -5.836965
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
-3.635312, -3, -6.396689, 0, -0.5, 0.5, 0.5,
-3.635312, -3, -6.396689, 1, -0.5, 0.5, 0.5,
-3.635312, -3, -6.396689, 1, 1.5, 0.5, 0.5,
-3.635312, -3, -6.396689, 0, 1.5, 0.5, 0.5,
-3.635312, -2, -6.396689, 0, -0.5, 0.5, 0.5,
-3.635312, -2, -6.396689, 1, -0.5, 0.5, 0.5,
-3.635312, -2, -6.396689, 1, 1.5, 0.5, 0.5,
-3.635312, -2, -6.396689, 0, 1.5, 0.5, 0.5,
-3.635312, -1, -6.396689, 0, -0.5, 0.5, 0.5,
-3.635312, -1, -6.396689, 1, -0.5, 0.5, 0.5,
-3.635312, -1, -6.396689, 1, 1.5, 0.5, 0.5,
-3.635312, -1, -6.396689, 0, 1.5, 0.5, 0.5,
-3.635312, 0, -6.396689, 0, -0.5, 0.5, 0.5,
-3.635312, 0, -6.396689, 1, -0.5, 0.5, 0.5,
-3.635312, 0, -6.396689, 1, 1.5, 0.5, 0.5,
-3.635312, 0, -6.396689, 0, 1.5, 0.5, 0.5,
-3.635312, 1, -6.396689, 0, -0.5, 0.5, 0.5,
-3.635312, 1, -6.396689, 1, -0.5, 0.5, 0.5,
-3.635312, 1, -6.396689, 1, 1.5, 0.5, 0.5,
-3.635312, 1, -6.396689, 0, 1.5, 0.5, 0.5,
-3.635312, 2, -6.396689, 0, -0.5, 0.5, 0.5,
-3.635312, 2, -6.396689, 1, -0.5, 0.5, 0.5,
-3.635312, 2, -6.396689, 1, 1.5, 0.5, 0.5,
-3.635312, 2, -6.396689, 0, 1.5, 0.5, 0.5,
-3.635312, 3, -6.396689, 0, -0.5, 0.5, 0.5,
-3.635312, 3, -6.396689, 1, -0.5, 0.5, 0.5,
-3.635312, 3, -6.396689, 1, 1.5, 0.5, 0.5,
-3.635312, 3, -6.396689, 0, 1.5, 0.5, 0.5
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
-3.144652, -3.470088, -4,
-3.144652, -3.470088, 4,
-3.144652, -3.470088, -4,
-3.308206, -3.641967, -4,
-3.144652, -3.470088, -2,
-3.308206, -3.641967, -2,
-3.144652, -3.470088, 0,
-3.308206, -3.641967, 0,
-3.144652, -3.470088, 2,
-3.308206, -3.641967, 2,
-3.144652, -3.470088, 4,
-3.308206, -3.641967, 4
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
-3.635312, -3.985723, -4, 0, -0.5, 0.5, 0.5,
-3.635312, -3.985723, -4, 1, -0.5, 0.5, 0.5,
-3.635312, -3.985723, -4, 1, 1.5, 0.5, 0.5,
-3.635312, -3.985723, -4, 0, 1.5, 0.5, 0.5,
-3.635312, -3.985723, -2, 0, -0.5, 0.5, 0.5,
-3.635312, -3.985723, -2, 1, -0.5, 0.5, 0.5,
-3.635312, -3.985723, -2, 1, 1.5, 0.5, 0.5,
-3.635312, -3.985723, -2, 0, 1.5, 0.5, 0.5,
-3.635312, -3.985723, 0, 0, -0.5, 0.5, 0.5,
-3.635312, -3.985723, 0, 1, -0.5, 0.5, 0.5,
-3.635312, -3.985723, 0, 1, 1.5, 0.5, 0.5,
-3.635312, -3.985723, 0, 0, 1.5, 0.5, 0.5,
-3.635312, -3.985723, 2, 0, -0.5, 0.5, 0.5,
-3.635312, -3.985723, 2, 1, -0.5, 0.5, 0.5,
-3.635312, -3.985723, 2, 1, 1.5, 0.5, 0.5,
-3.635312, -3.985723, 2, 0, 1.5, 0.5, 0.5,
-3.635312, -3.985723, 4, 0, -0.5, 0.5, 0.5,
-3.635312, -3.985723, 4, 1, -0.5, 0.5, 0.5,
-3.635312, -3.985723, 4, 1, 1.5, 0.5, 0.5,
-3.635312, -3.985723, 4, 0, 1.5, 0.5, 0.5
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
-3.144652, -3.470088, -5.557103,
-3.144652, 3.405048, -5.557103,
-3.144652, -3.470088, 5.637378,
-3.144652, 3.405048, 5.637378,
-3.144652, -3.470088, -5.557103,
-3.144652, -3.470088, 5.637378,
-3.144652, 3.405048, -5.557103,
-3.144652, 3.405048, 5.637378,
-3.144652, -3.470088, -5.557103,
3.397484, -3.470088, -5.557103,
-3.144652, -3.470088, 5.637378,
3.397484, -3.470088, 5.637378,
-3.144652, 3.405048, -5.557103,
3.397484, 3.405048, -5.557103,
-3.144652, 3.405048, 5.637378,
3.397484, 3.405048, 5.637378,
3.397484, -3.470088, -5.557103,
3.397484, 3.405048, -5.557103,
3.397484, -3.470088, 5.637378,
3.397484, 3.405048, 5.637378,
3.397484, -3.470088, -5.557103,
3.397484, -3.470088, 5.637378,
3.397484, 3.405048, -5.557103,
3.397484, 3.405048, 5.637378
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
var radius = 7.836671;
var distance = 34.86624;
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
mvMatrix.translate( -0.1264158, 0.03251994, -0.04013753 );
mvMatrix.scale( 1.295168, 1.232435, 0.7569054 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.86624);
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
perhydroazepine-1-th<-read.table("perhydroazepine-1-th.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-perhydroazepine-1-th$V2
```

```
## Error in eval(expr, envir, enclos): object 'perhydroazepine' not found
```

```r
y<-perhydroazepine-1-th$V3
```

```
## Error in eval(expr, envir, enclos): object 'perhydroazepine' not found
```

```r
z<-perhydroazepine-1-th$V4
```

```
## Error in eval(expr, envir, enclos): object 'perhydroazepine' not found
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
-3.049378, 1.912137, -0.7739608, 0, 0, 1, 1, 1,
-2.976197, 1.100532, -1.758243, 1, 0, 0, 1, 1,
-2.913976, -1.232111, -1.308294, 1, 0, 0, 1, 1,
-2.777446, 0.3226171, -0.9613936, 1, 0, 0, 1, 1,
-2.711889, 0.1619184, -0.7523025, 1, 0, 0, 1, 1,
-2.553054, 1.280416, -1.113173, 1, 0, 0, 1, 1,
-2.54843, 0.157196, -1.409659, 0, 0, 0, 1, 1,
-2.523054, 1.035277, -0.3793051, 0, 0, 0, 1, 1,
-2.510665, 0.4722472, -1.110321, 0, 0, 0, 1, 1,
-2.479517, 0.6076978, -2.689566, 0, 0, 0, 1, 1,
-2.418596, 2.39045, -0.5011035, 0, 0, 0, 1, 1,
-2.365689, 0.8357759, -2.337848, 0, 0, 0, 1, 1,
-2.362422, -0.6233277, -1.551705, 0, 0, 0, 1, 1,
-2.346949, 1.08064, -2.75682, 1, 1, 1, 1, 1,
-2.285903, -0.6260165, -1.247875, 1, 1, 1, 1, 1,
-2.233841, 1.112965, -1.856432, 1, 1, 1, 1, 1,
-2.230805, -0.5732699, -1.155201, 1, 1, 1, 1, 1,
-2.208602, 0.07043744, 0.6871349, 1, 1, 1, 1, 1,
-2.075726, 0.668626, -0.9855028, 1, 1, 1, 1, 1,
-2.035551, 0.1350688, -0.382568, 1, 1, 1, 1, 1,
-2.031122, -2.026877, -4.72113, 1, 1, 1, 1, 1,
-2.01696, -1.399693, -1.367571, 1, 1, 1, 1, 1,
-1.998271, -1.172203, -1.470349, 1, 1, 1, 1, 1,
-1.966565, 0.9758375, -1.372203, 1, 1, 1, 1, 1,
-1.964163, -0.8348593, -2.6871, 1, 1, 1, 1, 1,
-1.914257, -0.3119411, -0.5694936, 1, 1, 1, 1, 1,
-1.910177, -0.871019, -0.3383215, 1, 1, 1, 1, 1,
-1.896104, 0.5229919, -2.510711, 1, 1, 1, 1, 1,
-1.895473, 1.787937, -1.672233, 0, 0, 1, 1, 1,
-1.856963, -0.8028798, -3.029988, 1, 0, 0, 1, 1,
-1.855374, 0.7549439, -0.3037298, 1, 0, 0, 1, 1,
-1.851361, 0.4018699, -0.5974538, 1, 0, 0, 1, 1,
-1.834248, -0.8532137, -2.316707, 1, 0, 0, 1, 1,
-1.82996, -0.0493653, -3.1089, 1, 0, 0, 1, 1,
-1.822553, -0.996114, -2.554845, 0, 0, 0, 1, 1,
-1.81258, 1.195038, -0.559965, 0, 0, 0, 1, 1,
-1.803323, -0.2261318, -1.692413, 0, 0, 0, 1, 1,
-1.79952, 1.893645, -1.287315, 0, 0, 0, 1, 1,
-1.783337, 0.1359514, -3.190703, 0, 0, 0, 1, 1,
-1.752578, -0.1943104, -0.8033516, 0, 0, 0, 1, 1,
-1.695379, 0.5636225, -2.730006, 0, 0, 0, 1, 1,
-1.691782, -1.043159, -2.489429, 1, 1, 1, 1, 1,
-1.677462, 0.4951018, -0.8917959, 1, 1, 1, 1, 1,
-1.675423, 1.021626, -1.544626, 1, 1, 1, 1, 1,
-1.671584, -0.4966536, -1.417114, 1, 1, 1, 1, 1,
-1.663551, -0.2808352, -0.3889842, 1, 1, 1, 1, 1,
-1.660373, 0.7749615, -1.77844, 1, 1, 1, 1, 1,
-1.649798, -0.8894188, -3.342443, 1, 1, 1, 1, 1,
-1.637848, 0.3481199, -2.358773, 1, 1, 1, 1, 1,
-1.635043, -0.9666346, -1.703038, 1, 1, 1, 1, 1,
-1.634748, 0.8394961, -1.335011, 1, 1, 1, 1, 1,
-1.625696, 0.4128474, -0.4254327, 1, 1, 1, 1, 1,
-1.624868, -0.09809019, -3.795901, 1, 1, 1, 1, 1,
-1.596059, -1.542045, -2.362987, 1, 1, 1, 1, 1,
-1.585645, -2.120867, -1.936333, 1, 1, 1, 1, 1,
-1.543368, 0.6105474, -0.9723873, 1, 1, 1, 1, 1,
-1.482425, 1.317558, -1.237167, 0, 0, 1, 1, 1,
-1.465471, -0.9871619, -2.125577, 1, 0, 0, 1, 1,
-1.453389, 1.984001, -1.220692, 1, 0, 0, 1, 1,
-1.435858, 0.2455009, -1.41685, 1, 0, 0, 1, 1,
-1.405862, 0.6964195, -1.180936, 1, 0, 0, 1, 1,
-1.400821, -0.317225, -2.764572, 1, 0, 0, 1, 1,
-1.373757, -1.766667, -1.307326, 0, 0, 0, 1, 1,
-1.371662, 0.3303049, 0.1580344, 0, 0, 0, 1, 1,
-1.345276, -1.184389, -1.427483, 0, 0, 0, 1, 1,
-1.315876, -0.7303062, -1.193009, 0, 0, 0, 1, 1,
-1.3091, -0.8581013, -2.897486, 0, 0, 0, 1, 1,
-1.30636, -0.1530982, -1.963053, 0, 0, 0, 1, 1,
-1.305875, 0.983519, -0.7482389, 0, 0, 0, 1, 1,
-1.283675, -0.3744416, -2.212203, 1, 1, 1, 1, 1,
-1.281751, -1.177419, -1.70809, 1, 1, 1, 1, 1,
-1.274881, 0.5696445, -1.209664, 1, 1, 1, 1, 1,
-1.270092, 1.640376, -0.7416896, 1, 1, 1, 1, 1,
-1.268973, 0.1101137, -1.847834, 1, 1, 1, 1, 1,
-1.268207, 0.7478521, -1.541975, 1, 1, 1, 1, 1,
-1.264693, -1.139557, -2.548419, 1, 1, 1, 1, 1,
-1.261749, 0.01101199, 0.7216843, 1, 1, 1, 1, 1,
-1.260812, -0.07690867, -1.241187, 1, 1, 1, 1, 1,
-1.25446, 0.6128911, -0.6889012, 1, 1, 1, 1, 1,
-1.254117, 1.712069, -1.341249, 1, 1, 1, 1, 1,
-1.25176, -0.8902503, -4.677876, 1, 1, 1, 1, 1,
-1.250519, -0.1774502, 0.0609854, 1, 1, 1, 1, 1,
-1.248564, -1.934986, -1.257742, 1, 1, 1, 1, 1,
-1.24223, 2.614699, -1.720089, 1, 1, 1, 1, 1,
-1.241368, -0.8078154, -3.381674, 0, 0, 1, 1, 1,
-1.240652, 0.2215627, 0.2241551, 1, 0, 0, 1, 1,
-1.231905, -0.5236006, -2.035529, 1, 0, 0, 1, 1,
-1.221391, 1.413978, 0.6145876, 1, 0, 0, 1, 1,
-1.216072, -0.4332335, -1.196696, 1, 0, 0, 1, 1,
-1.215589, 1.142558, 0.508575, 1, 0, 0, 1, 1,
-1.209565, 1.713209, -1.345265, 0, 0, 0, 1, 1,
-1.208362, -0.8318508, -2.098922, 0, 0, 0, 1, 1,
-1.204491, 0.1344169, -1.373745, 0, 0, 0, 1, 1,
-1.201494, 1.000185, -0.3134535, 0, 0, 0, 1, 1,
-1.195089, 1.00359, -1.696109, 0, 0, 0, 1, 1,
-1.190839, 0.2803337, -0.7170681, 0, 0, 0, 1, 1,
-1.184134, -0.4184628, -1.809124, 0, 0, 0, 1, 1,
-1.183018, 0.1674749, -1.162132, 1, 1, 1, 1, 1,
-1.163865, -0.5591141, -1.316918, 1, 1, 1, 1, 1,
-1.156601, 2.41212, -1.287451, 1, 1, 1, 1, 1,
-1.13953, 0.5170242, -1.271544, 1, 1, 1, 1, 1,
-1.135911, -2.304759, -3.055151, 1, 1, 1, 1, 1,
-1.127297, -0.2959546, -1.969878, 1, 1, 1, 1, 1,
-1.125294, -1.304256, -1.342934, 1, 1, 1, 1, 1,
-1.120196, -0.5369229, -1.83926, 1, 1, 1, 1, 1,
-1.117476, 0.3362891, -2.934111, 1, 1, 1, 1, 1,
-1.113299, -0.03302617, -0.2416286, 1, 1, 1, 1, 1,
-1.104893, -1.004362, -1.206377, 1, 1, 1, 1, 1,
-1.104002, -0.4354996, -0.6533516, 1, 1, 1, 1, 1,
-1.103811, 0.6286306, -0.7775941, 1, 1, 1, 1, 1,
-1.100672, 0.9745923, -0.3583482, 1, 1, 1, 1, 1,
-1.097689, 1.436087, -1.257128, 1, 1, 1, 1, 1,
-1.096542, 0.05540469, -1.888475, 0, 0, 1, 1, 1,
-1.091717, 0.3788107, -0.6471223, 1, 0, 0, 1, 1,
-1.085602, 0.3239267, -1.602568, 1, 0, 0, 1, 1,
-1.083466, -0.8682321, -0.794938, 1, 0, 0, 1, 1,
-1.081469, 0.6370195, -1.254651, 1, 0, 0, 1, 1,
-1.075544, 1.186897, -0.9526692, 1, 0, 0, 1, 1,
-1.069295, 0.5766847, -0.7117215, 0, 0, 0, 1, 1,
-1.062951, 1.010111, -1.09972, 0, 0, 0, 1, 1,
-1.048903, 0.9934676, -1.728913, 0, 0, 0, 1, 1,
-1.045754, -0.09633911, -2.691883, 0, 0, 0, 1, 1,
-1.044466, -1.994718, -1.374169, 0, 0, 0, 1, 1,
-1.040991, -0.375277, -1.350273, 0, 0, 0, 1, 1,
-1.035926, -0.06547238, -1.280142, 0, 0, 0, 1, 1,
-1.035423, -0.8172073, -2.114393, 1, 1, 1, 1, 1,
-1.032821, 0.237933, -0.2744722, 1, 1, 1, 1, 1,
-1.020267, -0.1538114, -0.2113459, 1, 1, 1, 1, 1,
-1.011346, 1.201192, -1.873459, 1, 1, 1, 1, 1,
-1.010332, -0.7726404, -3.098645, 1, 1, 1, 1, 1,
-1.006578, -0.4352307, 2.318848, 1, 1, 1, 1, 1,
-1.006062, 1.532125, -0.5615986, 1, 1, 1, 1, 1,
-0.9957449, 1.839518, -0.9758164, 1, 1, 1, 1, 1,
-0.9950894, -0.05634229, -1.561575, 1, 1, 1, 1, 1,
-0.9925994, 1.696506, -0.2421617, 1, 1, 1, 1, 1,
-0.9917899, -0.990873, -0.8713752, 1, 1, 1, 1, 1,
-0.990014, -0.1896511, -1.531424, 1, 1, 1, 1, 1,
-0.9883604, 1.809892, -0.6758489, 1, 1, 1, 1, 1,
-0.9881061, 0.342954, -2.494675, 1, 1, 1, 1, 1,
-0.9827985, -1.203259, -0.7884605, 1, 1, 1, 1, 1,
-0.9797063, 0.6016727, -0.4608425, 0, 0, 1, 1, 1,
-0.9792138, 0.3548965, -2.070754, 1, 0, 0, 1, 1,
-0.9684942, -0.7548469, -3.604174, 1, 0, 0, 1, 1,
-0.9628698, 0.1613936, -0.1885313, 1, 0, 0, 1, 1,
-0.9600528, -1.147856, -0.2326929, 1, 0, 0, 1, 1,
-0.956781, -0.498217, -1.761987, 1, 0, 0, 1, 1,
-0.9545641, 0.1812547, -0.7677914, 0, 0, 0, 1, 1,
-0.9536176, 1.323282, 1.186692, 0, 0, 0, 1, 1,
-0.9409549, 0.9709097, 0.4431686, 0, 0, 0, 1, 1,
-0.9333469, -1.075005, -3.260655, 0, 0, 0, 1, 1,
-0.92185, -0.1096183, -0.630604, 0, 0, 0, 1, 1,
-0.91878, -0.4543712, -2.250641, 0, 0, 0, 1, 1,
-0.9139691, 0.6621323, -0.1861321, 0, 0, 0, 1, 1,
-0.9081451, 1.385783, -1.955655, 1, 1, 1, 1, 1,
-0.9027655, -0.0167287, -1.414801, 1, 1, 1, 1, 1,
-0.8924802, -0.4985576, -3.529085, 1, 1, 1, 1, 1,
-0.8915837, -1.506782, -1.603949, 1, 1, 1, 1, 1,
-0.8898713, 0.6817511, -0.6616111, 1, 1, 1, 1, 1,
-0.8844872, 0.4562423, -0.1214779, 1, 1, 1, 1, 1,
-0.8769013, 0.7773859, -1.290472, 1, 1, 1, 1, 1,
-0.8752168, 0.3922948, -0.2613213, 1, 1, 1, 1, 1,
-0.8715028, 1.99082, -1.743744, 1, 1, 1, 1, 1,
-0.8710771, -2.766363, -0.9937766, 1, 1, 1, 1, 1,
-0.866921, 1.021363, -0.92111, 1, 1, 1, 1, 1,
-0.8642164, -0.8475043, -3.017014, 1, 1, 1, 1, 1,
-0.8615332, 2.112089, -2.116941, 1, 1, 1, 1, 1,
-0.8518851, 1.259514, -0.3101317, 1, 1, 1, 1, 1,
-0.8517358, 0.8791285, 0.4559076, 1, 1, 1, 1, 1,
-0.8492211, -0.1757407, -2.159456, 0, 0, 1, 1, 1,
-0.8409801, 0.510814, -0.1266066, 1, 0, 0, 1, 1,
-0.8321959, -1.094263, -1.740556, 1, 0, 0, 1, 1,
-0.8293694, 0.3176371, -0.1199323, 1, 0, 0, 1, 1,
-0.8286046, -0.9235582, -1.516899, 1, 0, 0, 1, 1,
-0.8246216, 0.9633472, -1.358599, 1, 0, 0, 1, 1,
-0.8168411, 0.7202374, -1.300308, 0, 0, 0, 1, 1,
-0.8154856, 0.5290465, -0.6486053, 0, 0, 0, 1, 1,
-0.8100038, -0.02538934, -2.797681, 0, 0, 0, 1, 1,
-0.8062373, -0.1746797, -2.763309, 0, 0, 0, 1, 1,
-0.8056442, 1.014289, -0.9645661, 0, 0, 0, 1, 1,
-0.8033968, -0.8902861, -1.824251, 0, 0, 0, 1, 1,
-0.7988819, 1.368001, 0.9271119, 0, 0, 0, 1, 1,
-0.7907023, 2.52456, -0.3961006, 1, 1, 1, 1, 1,
-0.7891646, -0.1131008, -0.810034, 1, 1, 1, 1, 1,
-0.783379, -1.37998, -1.709337, 1, 1, 1, 1, 1,
-0.7795269, -0.4224309, -1.884432, 1, 1, 1, 1, 1,
-0.7777028, -0.6830902, -2.447167, 1, 1, 1, 1, 1,
-0.7769569, 0.4106623, -1.055668, 1, 1, 1, 1, 1,
-0.7762, 0.6413898, -1.688195, 1, 1, 1, 1, 1,
-0.7746515, -0.9569575, -0.5572465, 1, 1, 1, 1, 1,
-0.7746153, 0.4245835, -2.78641, 1, 1, 1, 1, 1,
-0.7721539, -0.2628806, -0.9772991, 1, 1, 1, 1, 1,
-0.7719113, 0.04277686, -0.1702164, 1, 1, 1, 1, 1,
-0.7710077, 2.331994, -2.797446, 1, 1, 1, 1, 1,
-0.7692333, 0.3816397, -2.025157, 1, 1, 1, 1, 1,
-0.7633524, -1.330778, -2.109025, 1, 1, 1, 1, 1,
-0.7625848, -0.05280451, -0.8324907, 1, 1, 1, 1, 1,
-0.7617756, -1.445068, -2.320085, 0, 0, 1, 1, 1,
-0.7605925, -1.288305, -1.411559, 1, 0, 0, 1, 1,
-0.7547526, -1.401012, -2.647777, 1, 0, 0, 1, 1,
-0.7501124, -0.3842725, -2.24156, 1, 0, 0, 1, 1,
-0.7498227, -0.6474544, -2.516186, 1, 0, 0, 1, 1,
-0.7485086, 0.2431858, -1.324362, 1, 0, 0, 1, 1,
-0.7408856, -0.01995193, -2.37316, 0, 0, 0, 1, 1,
-0.7377589, 1.249338, -1.195128, 0, 0, 0, 1, 1,
-0.7310418, -1.50554, -1.80539, 0, 0, 0, 1, 1,
-0.7264587, 0.9315628, -0.5910147, 0, 0, 0, 1, 1,
-0.7263433, -0.6653203, -1.969306, 0, 0, 0, 1, 1,
-0.7250209, -0.9630937, -2.807273, 0, 0, 0, 1, 1,
-0.7231232, 0.3240305, -2.401448, 0, 0, 0, 1, 1,
-0.7201563, -0.9088385, -3.171695, 1, 1, 1, 1, 1,
-0.7173918, -0.3932891, -3.171386, 1, 1, 1, 1, 1,
-0.7073665, -1.42619, -3.512474, 1, 1, 1, 1, 1,
-0.7071004, -1.086273, -2.566221, 1, 1, 1, 1, 1,
-0.7054262, 1.256549, 1.61111, 1, 1, 1, 1, 1,
-0.700213, 0.03350181, -0.4023032, 1, 1, 1, 1, 1,
-0.6999462, 1.103429, -0.1638054, 1, 1, 1, 1, 1,
-0.6982349, -0.7530643, -3.3162, 1, 1, 1, 1, 1,
-0.6970912, 1.882273, -1.563534, 1, 1, 1, 1, 1,
-0.6941995, -0.8151428, -0.6843964, 1, 1, 1, 1, 1,
-0.6939949, 1.235998, 1.164271, 1, 1, 1, 1, 1,
-0.6872674, 0.8808227, 0.6467067, 1, 1, 1, 1, 1,
-0.6836077, 0.6911429, -1.416279, 1, 1, 1, 1, 1,
-0.6803705, 0.7063954, 0.142811, 1, 1, 1, 1, 1,
-0.6784436, -0.04241102, -1.365516, 1, 1, 1, 1, 1,
-0.6782913, -0.7203723, -2.080319, 0, 0, 1, 1, 1,
-0.6769472, 0.1775085, -0.9132655, 1, 0, 0, 1, 1,
-0.6750228, 1.000204, -0.046872, 1, 0, 0, 1, 1,
-0.6727443, 0.1253274, -0.1767299, 1, 0, 0, 1, 1,
-0.6722122, 0.7430659, -0.4514748, 1, 0, 0, 1, 1,
-0.6706738, -1.255258, -3.400329, 1, 0, 0, 1, 1,
-0.6660352, 0.7495058, -2.024041, 0, 0, 0, 1, 1,
-0.6616905, -1.554271, -3.6372, 0, 0, 0, 1, 1,
-0.6614987, -0.2785583, -1.790645, 0, 0, 0, 1, 1,
-0.6590016, 0.1573979, -0.2482743, 0, 0, 0, 1, 1,
-0.6583827, 0.6074473, -0.6113119, 0, 0, 0, 1, 1,
-0.6502219, -0.2136487, -2.713494, 0, 0, 0, 1, 1,
-0.6425616, 0.01747293, -2.750929, 0, 0, 0, 1, 1,
-0.6417757, 0.8920696, -0.06703413, 1, 1, 1, 1, 1,
-0.6414034, 2.362832, -1.063496, 1, 1, 1, 1, 1,
-0.639984, -0.09367757, -2.191274, 1, 1, 1, 1, 1,
-0.6394768, 0.2163991, -1.770136, 1, 1, 1, 1, 1,
-0.6367946, -1.388002, -3.240591, 1, 1, 1, 1, 1,
-0.6309051, 0.004932811, -0.2281684, 1, 1, 1, 1, 1,
-0.6293786, 0.1957762, -1.596851, 1, 1, 1, 1, 1,
-0.6284277, 0.07803359, -2.037944, 1, 1, 1, 1, 1,
-0.6280368, 0.7177072, -2.732413, 1, 1, 1, 1, 1,
-0.6242837, 0.3481951, 0.0868356, 1, 1, 1, 1, 1,
-0.6226252, -1.021614, -2.36793, 1, 1, 1, 1, 1,
-0.6221071, -0.2005271, -2.878596, 1, 1, 1, 1, 1,
-0.6180503, 0.1152524, -2.692781, 1, 1, 1, 1, 1,
-0.6176077, -0.2411295, -0.005425797, 1, 1, 1, 1, 1,
-0.6095356, 0.2596029, -2.214205, 1, 1, 1, 1, 1,
-0.6009521, 0.3821033, -0.5101726, 0, 0, 1, 1, 1,
-0.5942975, 0.08794104, -1.373044, 1, 0, 0, 1, 1,
-0.5913395, -0.7236012, -2.630318, 1, 0, 0, 1, 1,
-0.5872283, -1.125909, -3.805197, 1, 0, 0, 1, 1,
-0.5864167, 0.8304035, -0.986058, 1, 0, 0, 1, 1,
-0.5863844, 1.052497, -3.064655, 1, 0, 0, 1, 1,
-0.5855733, -0.9668929, -2.364809, 0, 0, 0, 1, 1,
-0.5852549, -1.257546, -1.599412, 0, 0, 0, 1, 1,
-0.5828765, -0.4253204, -1.971722, 0, 0, 0, 1, 1,
-0.5767431, -0.9374458, -2.188721, 0, 0, 0, 1, 1,
-0.5740002, 0.1238648, -1.227893, 0, 0, 0, 1, 1,
-0.5647782, -0.4075316, -2.580251, 0, 0, 0, 1, 1,
-0.5644194, 1.24366, 0.2639191, 0, 0, 0, 1, 1,
-0.5587975, -0.6108417, -1.178429, 1, 1, 1, 1, 1,
-0.5575967, -0.536804, -2.57854, 1, 1, 1, 1, 1,
-0.5561201, -0.4197752, -3.287673, 1, 1, 1, 1, 1,
-0.5546146, 0.4187546, -1.245739, 1, 1, 1, 1, 1,
-0.5539427, 0.4366812, -0.6805136, 1, 1, 1, 1, 1,
-0.552993, -0.4625211, -1.21464, 1, 1, 1, 1, 1,
-0.5506243, -0.3838884, -1.409906, 1, 1, 1, 1, 1,
-0.5499601, 2.721554, -1.979204, 1, 1, 1, 1, 1,
-0.5393195, -0.1400543, -2.332591, 1, 1, 1, 1, 1,
-0.5368258, -0.7457415, -2.761082, 1, 1, 1, 1, 1,
-0.5364076, 1.131461, -1.534241, 1, 1, 1, 1, 1,
-0.5361488, 0.8800271, -0.2496528, 1, 1, 1, 1, 1,
-0.5336714, 2.215868, -1.497196, 1, 1, 1, 1, 1,
-0.5317538, -0.1858551, -0.7814603, 1, 1, 1, 1, 1,
-0.5317494, 0.6526022, -1.644371, 1, 1, 1, 1, 1,
-0.5285828, 0.5299633, -1.392898, 0, 0, 1, 1, 1,
-0.5241132, 0.7425717, 1.401398, 1, 0, 0, 1, 1,
-0.5226586, -1.284462, -4.776265, 1, 0, 0, 1, 1,
-0.5147768, 0.4099482, -1.578629, 1, 0, 0, 1, 1,
-0.5090079, -0.9067433, -3.939864, 1, 0, 0, 1, 1,
-0.507545, -0.5980704, -2.967083, 1, 0, 0, 1, 1,
-0.4972551, -1.228586, -4.037387, 0, 0, 0, 1, 1,
-0.4943267, 0.0327819, -2.516616, 0, 0, 0, 1, 1,
-0.4901443, 1.69921, -0.3220269, 0, 0, 0, 1, 1,
-0.4895205, -0.05247016, -1.113354, 0, 0, 0, 1, 1,
-0.4881278, -0.2471775, -1.894454, 0, 0, 0, 1, 1,
-0.4794876, 0.650845, -0.3788492, 0, 0, 0, 1, 1,
-0.4770744, 0.8105335, 1.352783, 0, 0, 0, 1, 1,
-0.4707765, -1.543616, -3.855186, 1, 1, 1, 1, 1,
-0.4654888, -0.6553785, -2.587397, 1, 1, 1, 1, 1,
-0.4641879, 0.6933516, -2.013805, 1, 1, 1, 1, 1,
-0.4568591, -0.3207196, -3.13259, 1, 1, 1, 1, 1,
-0.4513169, 0.4542754, -0.03216697, 1, 1, 1, 1, 1,
-0.4506488, 1.728024, 1.658024, 1, 1, 1, 1, 1,
-0.4413877, -1.432848, -3.120693, 1, 1, 1, 1, 1,
-0.4406797, -1.924147, -2.403931, 1, 1, 1, 1, 1,
-0.4403412, -0.4795041, -3.252617, 1, 1, 1, 1, 1,
-0.4367009, 0.05499811, -1.380124, 1, 1, 1, 1, 1,
-0.4346171, 1.346057, 1.858087, 1, 1, 1, 1, 1,
-0.433, 1.797184, -1.112907, 1, 1, 1, 1, 1,
-0.4304453, 1.287942, -0.4708037, 1, 1, 1, 1, 1,
-0.4276742, 2.841965, 0.6528593, 1, 1, 1, 1, 1,
-0.4232343, -1.242628, -4.629526, 1, 1, 1, 1, 1,
-0.4226044, -1.449382, -2.242931, 0, 0, 1, 1, 1,
-0.4214277, 0.2189907, -1.035635, 1, 0, 0, 1, 1,
-0.4176921, -0.672674, -2.401267, 1, 0, 0, 1, 1,
-0.4166417, 0.3710914, -2.068227, 1, 0, 0, 1, 1,
-0.416119, -1.00783, -1.83001, 1, 0, 0, 1, 1,
-0.4151904, -0.4511681, -2.122483, 1, 0, 0, 1, 1,
-0.4136145, 0.259453, 0.295292, 0, 0, 0, 1, 1,
-0.4038063, -2.059374, -2.235592, 0, 0, 0, 1, 1,
-0.4036519, -0.8326691, -3.312167, 0, 0, 0, 1, 1,
-0.403218, -1.258326, -3.005107, 0, 0, 0, 1, 1,
-0.4032072, -1.116653, -2.453353, 0, 0, 0, 1, 1,
-0.3897164, 0.2128504, -0.5553349, 0, 0, 0, 1, 1,
-0.3851677, 0.5063384, 1.150294, 0, 0, 0, 1, 1,
-0.3829659, 2.757495, -0.8276255, 1, 1, 1, 1, 1,
-0.3803419, 0.756436, 2.336815, 1, 1, 1, 1, 1,
-0.3748753, 0.8230755, -0.1279066, 1, 1, 1, 1, 1,
-0.3661827, 0.100796, 0.4798156, 1, 1, 1, 1, 1,
-0.3643887, -0.1733675, -2.917166, 1, 1, 1, 1, 1,
-0.3623985, -0.9005381, -1.834691, 1, 1, 1, 1, 1,
-0.3593918, 0.2815971, -1.628406, 1, 1, 1, 1, 1,
-0.3588232, 1.395767, -0.3760968, 1, 1, 1, 1, 1,
-0.3586532, 0.5536822, 1.10658, 1, 1, 1, 1, 1,
-0.3514748, 0.2590432, -0.03256068, 1, 1, 1, 1, 1,
-0.3510796, -1.434516, -1.062652, 1, 1, 1, 1, 1,
-0.3498383, -0.2436538, -1.009063, 1, 1, 1, 1, 1,
-0.3428188, -0.2351509, -2.214905, 1, 1, 1, 1, 1,
-0.3409761, 0.4289294, -0.455937, 1, 1, 1, 1, 1,
-0.3382258, 0.06241613, -1.365155, 1, 1, 1, 1, 1,
-0.3368643, -0.3508118, -1.722713, 0, 0, 1, 1, 1,
-0.3365622, -0.9446898, -4.350794, 1, 0, 0, 1, 1,
-0.3329558, -1.510212, -4.185673, 1, 0, 0, 1, 1,
-0.330163, 1.447827, -0.3108619, 1, 0, 0, 1, 1,
-0.329733, -0.05066143, -0.3462119, 1, 0, 0, 1, 1,
-0.3284731, -0.1918533, -4.735274, 1, 0, 0, 1, 1,
-0.3280286, 1.452946, 1.328953, 0, 0, 0, 1, 1,
-0.322897, 1.317316, -0.4427691, 0, 0, 0, 1, 1,
-0.3220288, 1.139836, 1.109373, 0, 0, 0, 1, 1,
-0.3200152, 2.426477, 0.08870088, 0, 0, 0, 1, 1,
-0.3197031, 1.541319, -0.070367, 0, 0, 0, 1, 1,
-0.3193034, -0.4309216, -2.759293, 0, 0, 0, 1, 1,
-0.3178922, -0.8310783, -4.535614, 0, 0, 0, 1, 1,
-0.3147782, 0.3099185, -2.007221, 1, 1, 1, 1, 1,
-0.3142356, 1.011232, 1.224919, 1, 1, 1, 1, 1,
-0.3128525, 2.051696, 0.3781942, 1, 1, 1, 1, 1,
-0.3085397, -0.1059903, -1.270943, 1, 1, 1, 1, 1,
-0.3080725, 1.14237, 0.04621295, 1, 1, 1, 1, 1,
-0.3001283, -0.2920115, -1.976095, 1, 1, 1, 1, 1,
-0.2984589, 0.5202373, -1.204401, 1, 1, 1, 1, 1,
-0.291299, 0.485812, -1.777907, 1, 1, 1, 1, 1,
-0.2909934, -1.237251, -4.539779, 1, 1, 1, 1, 1,
-0.2894388, 0.3918006, -0.1953923, 1, 1, 1, 1, 1,
-0.2879009, 1.743686, 0.6036383, 1, 1, 1, 1, 1,
-0.2863378, 0.1749016, -0.4974974, 1, 1, 1, 1, 1,
-0.2855469, 1.250661, -0.9800118, 1, 1, 1, 1, 1,
-0.2854474, 0.1366716, -1.639756, 1, 1, 1, 1, 1,
-0.2845287, -2.167182, -2.727349, 1, 1, 1, 1, 1,
-0.2837895, 0.01762677, -2.754709, 0, 0, 1, 1, 1,
-0.2780631, -0.4174376, -1.406534, 1, 0, 0, 1, 1,
-0.2754983, -1.172016, -3.642022, 1, 0, 0, 1, 1,
-0.2734541, -0.5166679, -3.701528, 1, 0, 0, 1, 1,
-0.2722031, -0.4500886, -3.677427, 1, 0, 0, 1, 1,
-0.2702391, -0.10393, -2.498263, 1, 0, 0, 1, 1,
-0.2679658, 0.4834222, -0.7787756, 0, 0, 0, 1, 1,
-0.2605134, -0.999689, -3.863019, 0, 0, 0, 1, 1,
-0.2575047, 0.2402812, -0.5846571, 0, 0, 0, 1, 1,
-0.2541817, -0.3155727, -0.8593654, 0, 0, 0, 1, 1,
-0.2532593, 1.071814, 0.5565929, 0, 0, 0, 1, 1,
-0.2526161, 1.744805, -0.7521131, 0, 0, 0, 1, 1,
-0.2502053, 1.682825, -1.147154, 0, 0, 0, 1, 1,
-0.2488117, 0.3114339, 0.2069139, 1, 1, 1, 1, 1,
-0.2433786, 0.5920014, -1.846482, 1, 1, 1, 1, 1,
-0.2386261, 0.8862092, 0.05574877, 1, 1, 1, 1, 1,
-0.228619, 0.2031307, 0.9739122, 1, 1, 1, 1, 1,
-0.2271907, -0.5117391, -1.594442, 1, 1, 1, 1, 1,
-0.2254856, -0.2384571, -2.76934, 1, 1, 1, 1, 1,
-0.2253819, 0.8405016, -0.7589128, 1, 1, 1, 1, 1,
-0.2231378, -0.6371583, -3.544101, 1, 1, 1, 1, 1,
-0.2227947, 1.106292, -0.2669609, 1, 1, 1, 1, 1,
-0.2133313, 0.9973269, 0.8810491, 1, 1, 1, 1, 1,
-0.2068624, -1.04181, -1.74713, 1, 1, 1, 1, 1,
-0.2045674, -2.01984, -4.438593, 1, 1, 1, 1, 1,
-0.2044447, 0.148231, -3.576844, 1, 1, 1, 1, 1,
-0.1984604, -0.2212871, -2.596703, 1, 1, 1, 1, 1,
-0.1863788, 0.2756471, -0.3301634, 1, 1, 1, 1, 1,
-0.1844351, 0.1054708, -2.197467, 0, 0, 1, 1, 1,
-0.1783258, -0.1779075, -0.2672556, 1, 0, 0, 1, 1,
-0.1774252, 2.017262, -1.513585, 1, 0, 0, 1, 1,
-0.1714365, 1.193824, 0.1483988, 1, 0, 0, 1, 1,
-0.1708261, -0.2346199, -1.325005, 1, 0, 0, 1, 1,
-0.1707703, 0.2699497, -1.579261, 1, 0, 0, 1, 1,
-0.1703648, -0.4261853, -1.998171, 0, 0, 0, 1, 1,
-0.1682344, 0.5589643, 0.002079767, 0, 0, 0, 1, 1,
-0.1678589, 0.2827424, -0.9483781, 0, 0, 0, 1, 1,
-0.1617001, -0.1019507, -2.324529, 0, 0, 0, 1, 1,
-0.1607483, 0.3150774, 1.318725, 0, 0, 0, 1, 1,
-0.1587637, -0.06112916, -2.285109, 0, 0, 0, 1, 1,
-0.1558822, 0.4684187, -0.4672454, 0, 0, 0, 1, 1,
-0.1542693, 1.130982, -1.755505, 1, 1, 1, 1, 1,
-0.1533512, -1.575887, -0.8218268, 1, 1, 1, 1, 1,
-0.1531627, -0.07627552, -2.394192, 1, 1, 1, 1, 1,
-0.1525043, -0.6616318, -5.394076, 1, 1, 1, 1, 1,
-0.15081, 0.3995095, -1.496663, 1, 1, 1, 1, 1,
-0.149956, -0.426493, -2.397912, 1, 1, 1, 1, 1,
-0.145376, 1.064293, 0.5030857, 1, 1, 1, 1, 1,
-0.1417395, -0.5908389, -4.654031, 1, 1, 1, 1, 1,
-0.1377606, -0.7332054, -4.838548, 1, 1, 1, 1, 1,
-0.1367597, 0.3264922, 0.4722399, 1, 1, 1, 1, 1,
-0.1305537, 1.002393, 0.9573205, 1, 1, 1, 1, 1,
-0.1299644, 0.3271335, 0.07988661, 1, 1, 1, 1, 1,
-0.1280596, 0.0664935, -2.064113, 1, 1, 1, 1, 1,
-0.1255226, -0.4678315, -1.883659, 1, 1, 1, 1, 1,
-0.1250894, -0.1400638, -2.90239, 1, 1, 1, 1, 1,
-0.1161096, 0.2025023, 0.1758974, 0, 0, 1, 1, 1,
-0.1143904, -0.05725466, -4.060733, 1, 0, 0, 1, 1,
-0.1097906, 0.5145347, -1.322337, 1, 0, 0, 1, 1,
-0.1069917, -0.5046246, -5.252534, 1, 0, 0, 1, 1,
-0.1059031, 0.9864889, -1.174834, 1, 0, 0, 1, 1,
-0.1051305, 0.3235115, 1.219875, 1, 0, 0, 1, 1,
-0.1001618, -0.06030806, -0.7321279, 0, 0, 0, 1, 1,
-0.09592673, 0.2738695, 0.7296983, 0, 0, 0, 1, 1,
-0.09447217, 0.0130303, -1.316763, 0, 0, 0, 1, 1,
-0.09049302, -0.02401763, -1.133635, 0, 0, 0, 1, 1,
-0.08993454, 0.4214175, -0.3525328, 0, 0, 0, 1, 1,
-0.08533069, 1.183806, -0.6280932, 0, 0, 0, 1, 1,
-0.0827049, 0.3796509, 0.2693368, 0, 0, 0, 1, 1,
-0.08214355, 0.03183679, -0.0323582, 1, 1, 1, 1, 1,
-0.08184321, -1.828204, -4.684534, 1, 1, 1, 1, 1,
-0.08096396, 0.09421803, -0.3095272, 1, 1, 1, 1, 1,
-0.08013466, 0.5246197, 0.2524332, 1, 1, 1, 1, 1,
-0.07949048, 1.978163, 0.8597977, 1, 1, 1, 1, 1,
-0.07791544, -0.2868395, -2.216697, 1, 1, 1, 1, 1,
-0.07074185, -3.369965, -3.346086, 1, 1, 1, 1, 1,
-0.0692602, 0.230143, 1.00349, 1, 1, 1, 1, 1,
-0.06844809, -0.06302385, -1.712636, 1, 1, 1, 1, 1,
-0.06642977, 0.9521981, 1.899186, 1, 1, 1, 1, 1,
-0.06528222, -0.2276908, -3.098264, 1, 1, 1, 1, 1,
-0.06274532, 0.1299053, -0.1934007, 1, 1, 1, 1, 1,
-0.06262618, 0.1595721, -1.160696, 1, 1, 1, 1, 1,
-0.05255147, -0.3542728, -1.539799, 1, 1, 1, 1, 1,
-0.04973674, -0.6669737, -3.126553, 1, 1, 1, 1, 1,
-0.04807985, 0.5011104, 0.2858123, 0, 0, 1, 1, 1,
-0.04762052, 0.5288175, 1.973704, 1, 0, 0, 1, 1,
-0.04487525, -0.928776, -1.566011, 1, 0, 0, 1, 1,
-0.04316911, -0.4754235, -5.135945, 1, 0, 0, 1, 1,
-0.03696753, -1.262925, -3.994905, 1, 0, 0, 1, 1,
-0.03429156, 0.1442171, 1.520549, 1, 0, 0, 1, 1,
-0.02496946, 0.7519214, -0.4762347, 0, 0, 0, 1, 1,
-0.02472766, -1.866664, -3.58075, 0, 0, 0, 1, 1,
-0.02116222, 0.07610876, 0.8570716, 0, 0, 0, 1, 1,
-0.01998964, 0.1098103, -1.937535, 0, 0, 0, 1, 1,
-0.0169955, 2.865746, -1.505497, 0, 0, 0, 1, 1,
-0.01341229, 0.02629208, -2.638765, 0, 0, 0, 1, 1,
-0.01244477, -0.1573242, -3.559578, 0, 0, 0, 1, 1,
-0.008427087, -0.2076704, -2.345802, 1, 1, 1, 1, 1,
-0.008104436, 0.2994101, -0.1387066, 1, 1, 1, 1, 1,
-0.003724109, -1.116313, -4.218337, 1, 1, 1, 1, 1,
-0.003239845, -1.858316, -3.433244, 1, 1, 1, 1, 1,
-0.001359356, -0.5962899, -2.9535, 1, 1, 1, 1, 1,
0.0006621005, 1.047551, 0.1133227, 1, 1, 1, 1, 1,
0.004464671, 0.868906, 0.9689281, 1, 1, 1, 1, 1,
0.005471233, -0.8069614, 4.381225, 1, 1, 1, 1, 1,
0.0084698, 1.572625, 1.614823, 1, 1, 1, 1, 1,
0.009193927, -0.4625311, 3.447103, 1, 1, 1, 1, 1,
0.00940765, 1.446164, 1.134488, 1, 1, 1, 1, 1,
0.01228932, -0.08069585, 5.474351, 1, 1, 1, 1, 1,
0.01423956, -0.05246577, 1.674767, 1, 1, 1, 1, 1,
0.01583276, 0.5369471, -0.3960835, 1, 1, 1, 1, 1,
0.01877129, 0.7325715, -1.744798, 1, 1, 1, 1, 1,
0.02090744, 0.8123458, 0.397968, 0, 0, 1, 1, 1,
0.02349225, -0.7072103, 3.21226, 1, 0, 0, 1, 1,
0.02353602, 0.1131834, 0.8580571, 1, 0, 0, 1, 1,
0.02680062, -0.001364025, 1.592451, 1, 0, 0, 1, 1,
0.02745736, 2.601665, -0.3449987, 1, 0, 0, 1, 1,
0.02964216, -1.945961, 2.615891, 1, 0, 0, 1, 1,
0.029776, -0.1938453, 3.190061, 0, 0, 0, 1, 1,
0.02986494, -1.175503, 3.705033, 0, 0, 0, 1, 1,
0.03396777, 3.304925, -0.3158053, 0, 0, 0, 1, 1,
0.03532384, -0.3748274, 1.398993, 0, 0, 0, 1, 1,
0.03734155, -1.120682, 1.534514, 0, 0, 0, 1, 1,
0.03986974, -0.8930277, 3.633054, 0, 0, 0, 1, 1,
0.04062828, 0.7846029, 0.3521135, 0, 0, 0, 1, 1,
0.04265813, -0.5060135, 2.710516, 1, 1, 1, 1, 1,
0.0434028, 1.171702, 0.4384988, 1, 1, 1, 1, 1,
0.04720037, -1.231065, 3.293514, 1, 1, 1, 1, 1,
0.04819289, 1.586218, -0.06964813, 1, 1, 1, 1, 1,
0.04931551, 0.6129859, 0.5769804, 1, 1, 1, 1, 1,
0.05054799, 0.08436238, 1.246786, 1, 1, 1, 1, 1,
0.05111384, -1.288921, 3.711417, 1, 1, 1, 1, 1,
0.05250348, 1.261593, -0.253544, 1, 1, 1, 1, 1,
0.0527, -0.57209, 0.8932765, 1, 1, 1, 1, 1,
0.0537262, 1.179502, -2.182579, 1, 1, 1, 1, 1,
0.05612496, -0.4966506, 2.080957, 1, 1, 1, 1, 1,
0.05823015, -0.6531862, 1.85039, 1, 1, 1, 1, 1,
0.06098788, 0.2264552, 1.089523, 1, 1, 1, 1, 1,
0.06203909, -0.2762586, 1.697345, 1, 1, 1, 1, 1,
0.06268512, -0.3451134, 1.434521, 1, 1, 1, 1, 1,
0.0646248, 0.7716686, -0.1300937, 0, 0, 1, 1, 1,
0.06667035, -0.4653537, 3.565739, 1, 0, 0, 1, 1,
0.06817827, -1.421912, 2.390537, 1, 0, 0, 1, 1,
0.06900652, -2.414374, 3.137404, 1, 0, 0, 1, 1,
0.06965741, 0.1297402, -0.8797097, 1, 0, 0, 1, 1,
0.07059026, -0.9039554, 3.09342, 1, 0, 0, 1, 1,
0.07725501, 0.5213729, 1.639518, 0, 0, 0, 1, 1,
0.08341191, -1.790942, 3.239975, 0, 0, 0, 1, 1,
0.08972627, -0.2399788, 3.560722, 0, 0, 0, 1, 1,
0.09114111, -0.357368, 0.7448665, 0, 0, 0, 1, 1,
0.09472328, 0.1999035, -3.067183, 0, 0, 0, 1, 1,
0.09942477, -1.050852, 3.88544, 0, 0, 0, 1, 1,
0.1017395, 0.4919798, -1.761362, 0, 0, 0, 1, 1,
0.1017535, 0.7008545, -0.9827538, 1, 1, 1, 1, 1,
0.105017, 0.4035928, 2.248817, 1, 1, 1, 1, 1,
0.105601, -0.1822761, 2.253794, 1, 1, 1, 1, 1,
0.1056217, -0.1991483, 3.525354, 1, 1, 1, 1, 1,
0.1070472, -1.104499, 4.334198, 1, 1, 1, 1, 1,
0.1082427, -1.374002, 3.035254, 1, 1, 1, 1, 1,
0.111245, -0.356311, 2.449899, 1, 1, 1, 1, 1,
0.1127521, 0.1144133, -0.5164478, 1, 1, 1, 1, 1,
0.1130415, 0.1989539, -0.5892563, 1, 1, 1, 1, 1,
0.1140471, -1.088677, 2.516639, 1, 1, 1, 1, 1,
0.1156896, 0.4672073, 0.1707255, 1, 1, 1, 1, 1,
0.1263361, 0.6426654, -0.1450668, 1, 1, 1, 1, 1,
0.1273689, 0.6287295, -0.4806379, 1, 1, 1, 1, 1,
0.1282338, 0.4204744, 0.4015841, 1, 1, 1, 1, 1,
0.1301447, 0.1558231, -0.139149, 1, 1, 1, 1, 1,
0.1313382, 0.7522607, 1.912879, 0, 0, 1, 1, 1,
0.133808, -0.2654511, 2.227851, 1, 0, 0, 1, 1,
0.1338114, 0.4548008, -0.1712543, 1, 0, 0, 1, 1,
0.1342708, 0.1578582, 1.168294, 1, 0, 0, 1, 1,
0.1353338, -0.0939216, 1.477863, 1, 0, 0, 1, 1,
0.1483444, -0.6443346, 2.68416, 1, 0, 0, 1, 1,
0.1509878, 0.4827861, 0.9191367, 0, 0, 0, 1, 1,
0.1556453, 0.9312757, 0.4916781, 0, 0, 0, 1, 1,
0.156739, 0.00683551, 3.921488, 0, 0, 0, 1, 1,
0.1573648, 1.025899, 0.9159061, 0, 0, 0, 1, 1,
0.1603411, -0.2028459, 2.064599, 0, 0, 0, 1, 1,
0.1614019, 0.8564053, 0.7987766, 0, 0, 0, 1, 1,
0.1652202, -0.4987034, 3.715047, 0, 0, 0, 1, 1,
0.167514, 0.6459902, 0.02372144, 1, 1, 1, 1, 1,
0.1695812, 1.02782, 0.7942565, 1, 1, 1, 1, 1,
0.1696516, -0.8705542, 0.684208, 1, 1, 1, 1, 1,
0.1710779, 1.522046, 1.271939, 1, 1, 1, 1, 1,
0.1741319, 0.2610362, 2.134666, 1, 1, 1, 1, 1,
0.1765231, 1.009132, 1.129783, 1, 1, 1, 1, 1,
0.1806706, -1.217581, 1.614809, 1, 1, 1, 1, 1,
0.1839768, -2.670961, 0.9381287, 1, 1, 1, 1, 1,
0.1874651, -0.4242255, 2.757563, 1, 1, 1, 1, 1,
0.1883315, -1.032707, 2.464557, 1, 1, 1, 1, 1,
0.1890553, -0.4179803, 3.254444, 1, 1, 1, 1, 1,
0.1897478, -0.4539636, 2.103365, 1, 1, 1, 1, 1,
0.1898756, 0.1649026, 1.382413, 1, 1, 1, 1, 1,
0.1944596, 1.793756, -0.3284758, 1, 1, 1, 1, 1,
0.1988734, -1.085992, 2.512147, 1, 1, 1, 1, 1,
0.1999619, 0.4430672, 0.9165045, 0, 0, 1, 1, 1,
0.2018591, -0.04445428, -0.5833111, 1, 0, 0, 1, 1,
0.2041027, 0.2883174, -0.2030424, 1, 0, 0, 1, 1,
0.2050928, 0.7891736, -0.619692, 1, 0, 0, 1, 1,
0.2074852, 0.7459323, -0.2000317, 1, 0, 0, 1, 1,
0.2108012, -0.8548262, 2.825821, 1, 0, 0, 1, 1,
0.2130697, 0.1681352, 0.3410412, 0, 0, 0, 1, 1,
0.2142739, 1.378113, -0.7708206, 0, 0, 0, 1, 1,
0.2163447, -0.1318083, 3.950131, 0, 0, 0, 1, 1,
0.2180067, -2.460447, 2.528434, 0, 0, 0, 1, 1,
0.218369, -0.1234946, 1.351013, 0, 0, 0, 1, 1,
0.2214412, 1.408521, 0.9756624, 0, 0, 0, 1, 1,
0.2226228, -1.650837, 2.618499, 0, 0, 0, 1, 1,
0.2251786, -0.5318348, 1.666909, 1, 1, 1, 1, 1,
0.2292171, 0.7154672, -0.8228, 1, 1, 1, 1, 1,
0.2294678, 0.04502956, 0.4481366, 1, 1, 1, 1, 1,
0.2299985, 1.229216, 1.288046, 1, 1, 1, 1, 1,
0.2310093, -0.2383901, 2.874968, 1, 1, 1, 1, 1,
0.2357503, -0.6993197, 4.529033, 1, 1, 1, 1, 1,
0.2362806, -0.3164305, 2.881728, 1, 1, 1, 1, 1,
0.2389188, 1.385699, -0.009846953, 1, 1, 1, 1, 1,
0.2423393, 1.495465, -0.2374865, 1, 1, 1, 1, 1,
0.242658, -0.2131753, 3.042932, 1, 1, 1, 1, 1,
0.2440985, -0.703642, 2.825424, 1, 1, 1, 1, 1,
0.2452652, -1.355821, 0.7894345, 1, 1, 1, 1, 1,
0.2466146, -0.09053059, 2.385761, 1, 1, 1, 1, 1,
0.2483483, 0.2578334, -0.2980487, 1, 1, 1, 1, 1,
0.2492509, -0.2398061, 2.888076, 1, 1, 1, 1, 1,
0.2523839, 0.4540238, 1.017909, 0, 0, 1, 1, 1,
0.2535941, 2.621901, 1.814891, 1, 0, 0, 1, 1,
0.2571994, 0.1271413, -0.8271669, 1, 0, 0, 1, 1,
0.2607957, 0.446573, -0.9652431, 1, 0, 0, 1, 1,
0.2651685, 0.1869582, 0.7977735, 1, 0, 0, 1, 1,
0.2657362, -0.6000847, 0.7232018, 1, 0, 0, 1, 1,
0.2695238, 0.229692, 0.0569331, 0, 0, 0, 1, 1,
0.2696336, 1.061914, 0.5172852, 0, 0, 0, 1, 1,
0.2737567, 1.863586, -0.5931391, 0, 0, 0, 1, 1,
0.2743212, 0.4517409, 2.58686, 0, 0, 0, 1, 1,
0.2780327, -0.1983604, 1.504853, 0, 0, 0, 1, 1,
0.2782096, 0.8106003, 0.7476244, 0, 0, 0, 1, 1,
0.2786874, -0.8634479, 3.614421, 0, 0, 0, 1, 1,
0.2810573, 0.7977394, 0.2336376, 1, 1, 1, 1, 1,
0.2813134, 0.5937528, -0.8715985, 1, 1, 1, 1, 1,
0.2834415, -0.8085092, 3.747502, 1, 1, 1, 1, 1,
0.2847923, 1.227661, -0.8153985, 1, 1, 1, 1, 1,
0.2861267, -0.1499446, 3.458721, 1, 1, 1, 1, 1,
0.2864671, 1.018765, 3.040336, 1, 1, 1, 1, 1,
0.2904676, 0.1574192, 0.8050396, 1, 1, 1, 1, 1,
0.2905315, -1.469227, 3.028287, 1, 1, 1, 1, 1,
0.2930447, -0.9210301, 1.845724, 1, 1, 1, 1, 1,
0.293217, -0.9778604, 4.558394, 1, 1, 1, 1, 1,
0.30045, -0.3567037, 1.088367, 1, 1, 1, 1, 1,
0.30371, 0.7190476, 1.036057, 1, 1, 1, 1, 1,
0.3048083, -0.5522717, 1.416198, 1, 1, 1, 1, 1,
0.3054319, -0.5128195, 0.9460766, 1, 1, 1, 1, 1,
0.3060811, 0.9677262, 0.800049, 1, 1, 1, 1, 1,
0.3078679, 1.62665, 1.044593, 0, 0, 1, 1, 1,
0.3119536, -0.6911851, 3.28718, 1, 0, 0, 1, 1,
0.312001, -0.6848971, 3.643991, 1, 0, 0, 1, 1,
0.3169393, 1.280091, -0.2863056, 1, 0, 0, 1, 1,
0.3198361, 0.06176758, 1.220558, 1, 0, 0, 1, 1,
0.3209379, -0.7748845, 2.119653, 1, 0, 0, 1, 1,
0.3232281, -1.180956, 3.038203, 0, 0, 0, 1, 1,
0.3312677, 0.3683315, 0.8267709, 0, 0, 0, 1, 1,
0.3355577, 0.9508884, 0.3945703, 0, 0, 0, 1, 1,
0.3359916, -1.368936, 2.216805, 0, 0, 0, 1, 1,
0.3371152, 0.7310054, 0.8135772, 0, 0, 0, 1, 1,
0.3395114, -1.057774, 1.223617, 0, 0, 0, 1, 1,
0.3418547, -1.59438, 2.770895, 0, 0, 0, 1, 1,
0.3431449, 1.191641, -0.03459855, 1, 1, 1, 1, 1,
0.3496601, -1.603912, 4.300272, 1, 1, 1, 1, 1,
0.3554397, -0.9708524, 1.374113, 1, 1, 1, 1, 1,
0.3580997, -0.8657982, 2.721072, 1, 1, 1, 1, 1,
0.3640596, 0.0672657, 1.205137, 1, 1, 1, 1, 1,
0.3650019, 0.8093187, 0.4337265, 1, 1, 1, 1, 1,
0.3664522, 0.4582043, -0.6482194, 1, 1, 1, 1, 1,
0.366487, -0.1529289, 1.098818, 1, 1, 1, 1, 1,
0.3668966, 0.6784254, -0.166964, 1, 1, 1, 1, 1,
0.3674651, 2.230464, 1.146822, 1, 1, 1, 1, 1,
0.3690571, -0.3209464, 3.387403, 1, 1, 1, 1, 1,
0.3692372, -1.145317, 1.512856, 1, 1, 1, 1, 1,
0.3741198, 1.526883, 1.81258, 1, 1, 1, 1, 1,
0.3779254, 1.312529, -0.4235807, 1, 1, 1, 1, 1,
0.3835073, -0.2554295, 3.274999, 1, 1, 1, 1, 1,
0.3868704, 1.017579, 0.04746053, 0, 0, 1, 1, 1,
0.3875815, 0.3424214, 1.27174, 1, 0, 0, 1, 1,
0.3930132, 0.7117763, 0.4807613, 1, 0, 0, 1, 1,
0.4016892, 0.8103817, -0.8644643, 1, 0, 0, 1, 1,
0.4064521, 0.02451746, 1.439171, 1, 0, 0, 1, 1,
0.4106394, -0.2361983, 0.3488089, 1, 0, 0, 1, 1,
0.4114758, -1.971508, 2.925131, 0, 0, 0, 1, 1,
0.4136961, 0.5330663, -0.3877539, 0, 0, 0, 1, 1,
0.4147941, 1.099256, 0.3787157, 0, 0, 0, 1, 1,
0.4154941, -0.8851534, 1.974856, 0, 0, 0, 1, 1,
0.4176849, 0.2064933, -0.3541764, 0, 0, 0, 1, 1,
0.4185442, -0.1436754, 2.08882, 0, 0, 0, 1, 1,
0.4251919, 0.1064681, 1.423061, 0, 0, 0, 1, 1,
0.4254868, 0.6891447, 1.437726, 1, 1, 1, 1, 1,
0.4278521, -0.6556495, 1.474547, 1, 1, 1, 1, 1,
0.4288383, -0.2594892, 2.024092, 1, 1, 1, 1, 1,
0.4348609, -1.674549, 3.660589, 1, 1, 1, 1, 1,
0.4361753, -1.585787, 3.652986, 1, 1, 1, 1, 1,
0.4396798, -0.1428153, 2.864333, 1, 1, 1, 1, 1,
0.4416761, 0.9079188, 2.184103, 1, 1, 1, 1, 1,
0.442131, -0.009627082, 2.130301, 1, 1, 1, 1, 1,
0.4451591, -1.703191, 3.125277, 1, 1, 1, 1, 1,
0.4451602, -1.164511, 2.340776, 1, 1, 1, 1, 1,
0.4459377, -1.912708, 3.778885, 1, 1, 1, 1, 1,
0.4492821, 0.2465165, 0.6737303, 1, 1, 1, 1, 1,
0.4502512, -0.1968566, 0.5860857, 1, 1, 1, 1, 1,
0.4516669, -0.5697539, 2.050081, 1, 1, 1, 1, 1,
0.454935, -1.283485, 3.671197, 1, 1, 1, 1, 1,
0.4636413, -0.7134229, 4.099806, 0, 0, 1, 1, 1,
0.465687, 1.988986, 0.5299862, 1, 0, 0, 1, 1,
0.4658471, 0.6763621, 1.887724, 1, 0, 0, 1, 1,
0.4660597, -0.4324894, 2.442345, 1, 0, 0, 1, 1,
0.4698557, -0.2003474, 2.590214, 1, 0, 0, 1, 1,
0.4705595, 1.338737, -0.481871, 1, 0, 0, 1, 1,
0.4706185, 0.955181, 0.6896864, 0, 0, 0, 1, 1,
0.4726505, 0.0378461, 0.2997279, 0, 0, 0, 1, 1,
0.4727218, 0.2302637, 1.754674, 0, 0, 0, 1, 1,
0.4801016, 0.5202188, -0.1083774, 0, 0, 0, 1, 1,
0.4907423, 0.951427, 0.3121091, 0, 0, 0, 1, 1,
0.4930054, -1.044886, 2.92276, 0, 0, 0, 1, 1,
0.493292, 0.4383804, 1.089337, 0, 0, 0, 1, 1,
0.4969406, 0.8727213, -0.8539031, 1, 1, 1, 1, 1,
0.4985573, 1.095758, -0.1605632, 1, 1, 1, 1, 1,
0.5008162, -0.4311489, 1.533582, 1, 1, 1, 1, 1,
0.5017357, -0.8121524, 3.932286, 1, 1, 1, 1, 1,
0.5072969, 0.9017593, -0.7949477, 1, 1, 1, 1, 1,
0.5099915, 0.5482624, 1.260253, 1, 1, 1, 1, 1,
0.5104812, 0.2250907, 2.264257, 1, 1, 1, 1, 1,
0.5114809, -0.7406175, 2.182791, 1, 1, 1, 1, 1,
0.5161697, 0.06340209, 2.255808, 1, 1, 1, 1, 1,
0.5171397, 0.6489375, 0.7108525, 1, 1, 1, 1, 1,
0.5194312, -0.12018, 3.24816, 1, 1, 1, 1, 1,
0.5212683, 1.2703, -0.132127, 1, 1, 1, 1, 1,
0.5217431, 0.2147369, 1.60895, 1, 1, 1, 1, 1,
0.5241817, 0.2497264, 2.183356, 1, 1, 1, 1, 1,
0.5284604, -1.513444, 1.976075, 1, 1, 1, 1, 1,
0.5292306, 2.514642, 0.1857613, 0, 0, 1, 1, 1,
0.5295065, 1.571313, 0.8240787, 1, 0, 0, 1, 1,
0.5310934, 0.5839548, 0.8132941, 1, 0, 0, 1, 1,
0.5326736, 0.07154109, 2.316509, 1, 0, 0, 1, 1,
0.5327087, 0.8049102, 0.6441638, 1, 0, 0, 1, 1,
0.5433663, 0.04497363, -0.02653004, 1, 0, 0, 1, 1,
0.5438255, -0.4403374, 1.672162, 0, 0, 0, 1, 1,
0.5459051, 0.832554, 0.8847699, 0, 0, 0, 1, 1,
0.5506309, -1.258352, 4.740544, 0, 0, 0, 1, 1,
0.5509237, 0.4379943, 0.7610349, 0, 0, 0, 1, 1,
0.5509323, -0.4551227, 2.480307, 0, 0, 0, 1, 1,
0.5521724, 0.7713863, 0.5540551, 0, 0, 0, 1, 1,
0.5540468, 0.3829314, -0.2279385, 0, 0, 0, 1, 1,
0.5585226, 0.1886762, 0.423876, 1, 1, 1, 1, 1,
0.5605572, -1.146318, 2.857167, 1, 1, 1, 1, 1,
0.5628184, -0.5073567, 3.943114, 1, 1, 1, 1, 1,
0.5653474, -1.172322, 1.333509, 1, 1, 1, 1, 1,
0.5691401, -0.5772347, 1.259037, 1, 1, 1, 1, 1,
0.5699806, 1.764031, 1.696358, 1, 1, 1, 1, 1,
0.5781114, -0.6327893, 1.643958, 1, 1, 1, 1, 1,
0.5792868, 0.1733932, 0.4814148, 1, 1, 1, 1, 1,
0.5808403, 0.1612632, -0.05723505, 1, 1, 1, 1, 1,
0.5829569, 0.1369293, 2.930544, 1, 1, 1, 1, 1,
0.5846335, 1.200218, -0.2412235, 1, 1, 1, 1, 1,
0.5972739, -1.414294, 3.074321, 1, 1, 1, 1, 1,
0.599635, 0.8445929, -0.5812163, 1, 1, 1, 1, 1,
0.6022199, 0.3530627, 0.2569588, 1, 1, 1, 1, 1,
0.6029868, 0.2554825, 0.7600459, 1, 1, 1, 1, 1,
0.6030093, 0.822451, 0.7758101, 0, 0, 1, 1, 1,
0.6044841, -0.6816791, 2.215762, 1, 0, 0, 1, 1,
0.6083778, -0.5007346, 3.215307, 1, 0, 0, 1, 1,
0.6095076, -0.6762112, 2.266352, 1, 0, 0, 1, 1,
0.6126431, 0.3150469, 0.5637245, 1, 0, 0, 1, 1,
0.6126925, -0.2714863, 1.897153, 1, 0, 0, 1, 1,
0.6162632, 0.2716699, 1.403475, 0, 0, 0, 1, 1,
0.616434, 0.3384469, -0.1717975, 0, 0, 0, 1, 1,
0.6200508, 1.754465, 0.879554, 0, 0, 0, 1, 1,
0.6322719, 0.03136848, 1.44002, 0, 0, 0, 1, 1,
0.6335712, 0.441965, 1.706783, 0, 0, 0, 1, 1,
0.6350099, 1.01949, -0.5554628, 0, 0, 0, 1, 1,
0.6351033, -0.447427, 3.254905, 0, 0, 0, 1, 1,
0.6405421, -1.765433, 1.161555, 1, 1, 1, 1, 1,
0.6420375, 0.4888799, 1.771005, 1, 1, 1, 1, 1,
0.642495, -0.4735041, 3.373638, 1, 1, 1, 1, 1,
0.6523412, 0.2102294, 1.144421, 1, 1, 1, 1, 1,
0.6536854, -0.9344419, 3.10532, 1, 1, 1, 1, 1,
0.6561253, 0.5606804, 0.2138647, 1, 1, 1, 1, 1,
0.6621479, -0.5493344, 3.16051, 1, 1, 1, 1, 1,
0.6622621, -0.83869, 3.415467, 1, 1, 1, 1, 1,
0.6640873, -1.014407, 2.688486, 1, 1, 1, 1, 1,
0.6651052, -1.002979, 3.381803, 1, 1, 1, 1, 1,
0.6741883, 0.5709978, 1.020574, 1, 1, 1, 1, 1,
0.6752689, -0.1845602, 2.287014, 1, 1, 1, 1, 1,
0.6769341, 1.054179, 0.8789437, 1, 1, 1, 1, 1,
0.6787078, -0.6871024, 2.4964, 1, 1, 1, 1, 1,
0.6788788, -1.232985, 3.078101, 1, 1, 1, 1, 1,
0.6791662, 1.55818, -0.1096714, 0, 0, 1, 1, 1,
0.6822481, 0.7242478, 1.517143, 1, 0, 0, 1, 1,
0.6831356, -0.6208776, 1.308932, 1, 0, 0, 1, 1,
0.6861405, 1.61376, -1.602305, 1, 0, 0, 1, 1,
0.6898925, -0.6049567, 2.088157, 1, 0, 0, 1, 1,
0.696247, 2.411183, -0.5307419, 1, 0, 0, 1, 1,
0.6963657, 0.9133336, 0.5907224, 0, 0, 0, 1, 1,
0.7009555, -0.9274679, 3.063168, 0, 0, 0, 1, 1,
0.7133178, -0.4708309, -0.267648, 0, 0, 0, 1, 1,
0.7156468, -0.9695989, 3.202999, 0, 0, 0, 1, 1,
0.718044, 1.333246, 0.5704015, 0, 0, 0, 1, 1,
0.7252194, -1.18503, 4.336137, 0, 0, 0, 1, 1,
0.7298064, 0.3406845, -0.1817952, 0, 0, 0, 1, 1,
0.7365673, 0.6553458, 0.07672413, 1, 1, 1, 1, 1,
0.7546173, -1.531921, 3.18584, 1, 1, 1, 1, 1,
0.7585194, -1.051288, 3.068137, 1, 1, 1, 1, 1,
0.7609941, -1.364744, 2.226259, 1, 1, 1, 1, 1,
0.7629892, -1.269234, 1.36856, 1, 1, 1, 1, 1,
0.7666023, 0.7587342, 1.644258, 1, 1, 1, 1, 1,
0.7676876, 0.1401951, 0.9399838, 1, 1, 1, 1, 1,
0.7749503, -0.2373395, 0.3655391, 1, 1, 1, 1, 1,
0.7798507, 1.483872, 2.477324, 1, 1, 1, 1, 1,
0.7799698, -1.094766, 3.762763, 1, 1, 1, 1, 1,
0.7807803, 0.7593535, 1.828416, 1, 1, 1, 1, 1,
0.7810123, 0.2956502, -1.222549, 1, 1, 1, 1, 1,
0.7814986, 0.352503, 3.011038, 1, 1, 1, 1, 1,
0.7823353, 0.5226358, 2.467399, 1, 1, 1, 1, 1,
0.7912644, -0.7066938, 0.1620175, 1, 1, 1, 1, 1,
0.7921151, 0.01457836, 1.874007, 0, 0, 1, 1, 1,
0.7929429, -0.6744528, 2.963469, 1, 0, 0, 1, 1,
0.7958009, 0.4889943, 0.736144, 1, 0, 0, 1, 1,
0.8024333, -0.23235, 2.364937, 1, 0, 0, 1, 1,
0.8035073, 2.728554, -0.1235081, 1, 0, 0, 1, 1,
0.8041774, 1.658382, 2.709177, 1, 0, 0, 1, 1,
0.8062876, 0.5001171, 0.8299367, 0, 0, 0, 1, 1,
0.8104601, 0.07795184, 1.031016, 0, 0, 0, 1, 1,
0.81319, 0.4768875, -0.2391547, 0, 0, 0, 1, 1,
0.815266, 0.38571, 3.453822, 0, 0, 0, 1, 1,
0.8190849, -0.3068708, 2.039872, 0, 0, 0, 1, 1,
0.8244861, -0.4580963, 1.889309, 0, 0, 0, 1, 1,
0.8245267, 0.8044695, 0.9340411, 0, 0, 0, 1, 1,
0.8280603, 1.123666, -0.3027158, 1, 1, 1, 1, 1,
0.8289214, 0.2846949, 2.305283, 1, 1, 1, 1, 1,
0.8300686, -1.838918, 2.752048, 1, 1, 1, 1, 1,
0.8335945, 0.2246748, 1.488985, 1, 1, 1, 1, 1,
0.8371832, 0.9865249, 2.597616, 1, 1, 1, 1, 1,
0.8532525, -1.614802, 1.754856, 1, 1, 1, 1, 1,
0.8551214, 1.135194, -0.9903998, 1, 1, 1, 1, 1,
0.857309, 1.814618, 0.4950606, 1, 1, 1, 1, 1,
0.8726383, 1.956023, -0.0663821, 1, 1, 1, 1, 1,
0.8765299, 0.09842324, 1.13335, 1, 1, 1, 1, 1,
0.880754, 0.9791205, 0.3777131, 1, 1, 1, 1, 1,
0.8865317, -0.7096286, 2.727406, 1, 1, 1, 1, 1,
0.8894733, -0.09501585, 3.54312, 1, 1, 1, 1, 1,
0.8897151, 1.097036, -0.1805691, 1, 1, 1, 1, 1,
0.8920984, -1.326911, 0.04896528, 1, 1, 1, 1, 1,
0.8928859, -0.0128959, 3.471933, 0, 0, 1, 1, 1,
0.8933946, -0.3500209, 0.2883606, 1, 0, 0, 1, 1,
0.8965042, 1.012665, 1.60054, 1, 0, 0, 1, 1,
0.9003714, -1.345156, 3.11301, 1, 0, 0, 1, 1,
0.9009793, -0.8742012, 2.353164, 1, 0, 0, 1, 1,
0.9012421, 0.4391482, 1.908037, 1, 0, 0, 1, 1,
0.9051313, -1.008618, 3.563948, 0, 0, 0, 1, 1,
0.9061579, 0.7207388, 2.37235, 0, 0, 0, 1, 1,
0.9069269, -0.1707315, 0.2572446, 0, 0, 0, 1, 1,
0.9225143, 0.2026733, 1.646649, 0, 0, 0, 1, 1,
0.9259378, 2.204873, 1.199084, 0, 0, 0, 1, 1,
0.9259667, -0.2045917, 3.366809, 0, 0, 0, 1, 1,
0.931551, 0.621081, -0.2444299, 0, 0, 0, 1, 1,
0.9318582, 0.2791266, 0.5540283, 1, 1, 1, 1, 1,
0.9432421, 0.09677436, 1.760678, 1, 1, 1, 1, 1,
0.9447501, 0.9354218, 1.347368, 1, 1, 1, 1, 1,
0.9592282, 0.2480753, -0.02974716, 1, 1, 1, 1, 1,
0.9618048, -0.0363776, 2.045528, 1, 1, 1, 1, 1,
0.9754, -1.100997, 1.636319, 1, 1, 1, 1, 1,
0.9775176, 0.4669122, 1.291973, 1, 1, 1, 1, 1,
0.9782605, 0.6066571, -0.1785977, 1, 1, 1, 1, 1,
0.9793525, 2.596201, 0.5907829, 1, 1, 1, 1, 1,
0.9917502, -0.6779768, 2.999158, 1, 1, 1, 1, 1,
0.9971492, 0.5177387, -0.8701991, 1, 1, 1, 1, 1,
1.001509, -0.1329767, 1.960308, 1, 1, 1, 1, 1,
1.00432, 1.161203, 1.214878, 1, 1, 1, 1, 1,
1.012943, 0.3515145, 1.252414, 1, 1, 1, 1, 1,
1.012958, 1.202294, 0.4260635, 1, 1, 1, 1, 1,
1.013121, 0.4305691, 0.6924788, 0, 0, 1, 1, 1,
1.025056, -1.037639, 2.580435, 1, 0, 0, 1, 1,
1.025261, 0.8145145, -0.04597654, 1, 0, 0, 1, 1,
1.033469, 0.6025689, 0.2335767, 1, 0, 0, 1, 1,
1.035231, -0.1363465, 3.036778, 1, 0, 0, 1, 1,
1.036708, -0.06431891, 0.896982, 1, 0, 0, 1, 1,
1.038387, 2.012469, 1.22923, 0, 0, 0, 1, 1,
1.039464, 2.267066, -0.5411251, 0, 0, 0, 1, 1,
1.040022, 1.41106, -0.09492347, 0, 0, 0, 1, 1,
1.043497, 1.127148, 2.339032, 0, 0, 0, 1, 1,
1.04379, -0.6886829, 2.411835, 0, 0, 0, 1, 1,
1.04415, -0.1676609, 0.901468, 0, 0, 0, 1, 1,
1.054181, -0.7755439, 0.2499916, 0, 0, 0, 1, 1,
1.059617, -0.7107354, 1.370327, 1, 1, 1, 1, 1,
1.061533, -0.2622236, 0.8198805, 1, 1, 1, 1, 1,
1.067407, -0.740117, 3.49617, 1, 1, 1, 1, 1,
1.069992, 0.7692633, 0.8193262, 1, 1, 1, 1, 1,
1.071126, -0.2521244, 3.649954, 1, 1, 1, 1, 1,
1.076303, -0.164185, 2.066085, 1, 1, 1, 1, 1,
1.07691, 0.4430037, 1.72582, 1, 1, 1, 1, 1,
1.079342, -1.347944, 1.54393, 1, 1, 1, 1, 1,
1.079889, 0.9083207, 3.694417, 1, 1, 1, 1, 1,
1.087103, 0.973955, 0.7229373, 1, 1, 1, 1, 1,
1.087327, 0.04878161, 0.4642623, 1, 1, 1, 1, 1,
1.089409, -0.5598931, 2.595951, 1, 1, 1, 1, 1,
1.091168, 0.6967306, 1.53798, 1, 1, 1, 1, 1,
1.098915, 0.7097029, 2.573589, 1, 1, 1, 1, 1,
1.10373, -1.212342, 3.019224, 1, 1, 1, 1, 1,
1.108464, 0.493998, -0.8705553, 0, 0, 1, 1, 1,
1.108896, 1.010841, 1.746217, 1, 0, 0, 1, 1,
1.11085, 1.038357, 1.807432, 1, 0, 0, 1, 1,
1.111928, -0.7984238, 2.456471, 1, 0, 0, 1, 1,
1.116518, -0.4450902, 2.194425, 1, 0, 0, 1, 1,
1.126007, 0.9551823, 0.4420815, 1, 0, 0, 1, 1,
1.141234, 1.378899, -0.1932093, 0, 0, 0, 1, 1,
1.150362, -0.1896143, 2.401504, 0, 0, 0, 1, 1,
1.15773, 1.450954, 1.077573, 0, 0, 0, 1, 1,
1.162884, 0.4084378, -1.45489, 0, 0, 0, 1, 1,
1.163866, -1.585651, 3.909528, 0, 0, 0, 1, 1,
1.168147, 1.542122, 1.832285, 0, 0, 0, 1, 1,
1.174172, -0.01238559, 0.2971069, 0, 0, 0, 1, 1,
1.180534, -0.9760782, 3.894538, 1, 1, 1, 1, 1,
1.181267, -1.061907, 4.957127, 1, 1, 1, 1, 1,
1.190773, 0.06397909, 0.6975856, 1, 1, 1, 1, 1,
1.191553, 0.6895874, 0.294339, 1, 1, 1, 1, 1,
1.203021, 0.3870102, 1.590886, 1, 1, 1, 1, 1,
1.203404, 0.2072909, 1.613317, 1, 1, 1, 1, 1,
1.20612, 0.1285217, 0.4318721, 1, 1, 1, 1, 1,
1.207756, -0.3441643, 2.27058, 1, 1, 1, 1, 1,
1.209296, 2.238805, 0.3480741, 1, 1, 1, 1, 1,
1.214478, -0.6062133, 1.948275, 1, 1, 1, 1, 1,
1.219187, 0.5393068, -0.8650737, 1, 1, 1, 1, 1,
1.219463, 0.8359361, -0.6984519, 1, 1, 1, 1, 1,
1.229798, -1.612719, 3.947276, 1, 1, 1, 1, 1,
1.230299, 0.4123932, 0.4813767, 1, 1, 1, 1, 1,
1.23319, 0.05643638, 3.580379, 1, 1, 1, 1, 1,
1.241768, 0.1160415, 1.273817, 0, 0, 1, 1, 1,
1.244687, 0.2111406, 2.14192, 1, 0, 0, 1, 1,
1.249917, 0.9678198, 1.818394, 1, 0, 0, 1, 1,
1.267567, -0.2133817, 1.691679, 1, 0, 0, 1, 1,
1.27294, -0.3118753, 0.2847554, 1, 0, 0, 1, 1,
1.273706, -1.232085, 2.578025, 1, 0, 0, 1, 1,
1.274652, -0.4723461, 2.626327, 0, 0, 0, 1, 1,
1.276087, -0.6451384, 1.361835, 0, 0, 0, 1, 1,
1.276531, 0.5412501, 1.688733, 0, 0, 0, 1, 1,
1.279966, 0.2226575, 0.800169, 0, 0, 0, 1, 1,
1.288439, 1.262965, 1.568527, 0, 0, 0, 1, 1,
1.293193, -1.527019, 1.827423, 0, 0, 0, 1, 1,
1.294323, -0.9164684, 3.48623, 0, 0, 0, 1, 1,
1.294631, 0.8266174, 1.264396, 1, 1, 1, 1, 1,
1.299684, 0.2989358, 3.989448, 1, 1, 1, 1, 1,
1.304016, 0.1308994, 0.03994675, 1, 1, 1, 1, 1,
1.304444, -0.8050812, 3.235025, 1, 1, 1, 1, 1,
1.30633, -1.084096, 0.8365754, 1, 1, 1, 1, 1,
1.309593, -2.19424, 2.656893, 1, 1, 1, 1, 1,
1.315292, 0.4036831, 2.318482, 1, 1, 1, 1, 1,
1.319322, 0.04185974, -0.3620476, 1, 1, 1, 1, 1,
1.330551, -0.09381898, 2.150403, 1, 1, 1, 1, 1,
1.338192, -1.094153, 2.35183, 1, 1, 1, 1, 1,
1.339078, 0.3684878, 2.715937, 1, 1, 1, 1, 1,
1.345696, 0.5547966, 2.432419, 1, 1, 1, 1, 1,
1.352919, 0.786185, 2.976372, 1, 1, 1, 1, 1,
1.367215, -0.6937727, 1.462022, 1, 1, 1, 1, 1,
1.367343, -1.112148, 0.6648123, 1, 1, 1, 1, 1,
1.368124, 1.440067, 0.5452399, 0, 0, 1, 1, 1,
1.371914, -0.1785181, 1.926187, 1, 0, 0, 1, 1,
1.376059, -1.577915, 0.2990121, 1, 0, 0, 1, 1,
1.381981, -0.7904405, 0.8700355, 1, 0, 0, 1, 1,
1.385102, 0.6607423, 3.348737, 1, 0, 0, 1, 1,
1.391415, -0.990218, 1.838188, 1, 0, 0, 1, 1,
1.391663, 0.08415471, 3.245741, 0, 0, 0, 1, 1,
1.400614, 0.2340757, 2.235116, 0, 0, 0, 1, 1,
1.401812, -0.598153, 1.879547, 0, 0, 0, 1, 1,
1.409564, -1.385379, 3.730233, 0, 0, 0, 1, 1,
1.411133, 2.542912, 0.2583806, 0, 0, 0, 1, 1,
1.414621, 0.1971059, 0.8138065, 0, 0, 0, 1, 1,
1.42054, -0.7732235, 2.478335, 0, 0, 0, 1, 1,
1.431182, 0.4683264, 1.010143, 1, 1, 1, 1, 1,
1.44245, -0.8644628, 2.527977, 1, 1, 1, 1, 1,
1.457531, -1.253202, 3.899479, 1, 1, 1, 1, 1,
1.461393, -0.2186688, 3.423836, 1, 1, 1, 1, 1,
1.472585, -0.2416593, 3.552829, 1, 1, 1, 1, 1,
1.484642, 0.6361356, 0.8674517, 1, 1, 1, 1, 1,
1.493785, -0.06078696, 0.7047874, 1, 1, 1, 1, 1,
1.499782, -0.330544, 3.143892, 1, 1, 1, 1, 1,
1.501685, -0.08148433, 1.546182, 1, 1, 1, 1, 1,
1.510851, 1.604432, -0.3233696, 1, 1, 1, 1, 1,
1.513184, 0.8431038, 1.854744, 1, 1, 1, 1, 1,
1.515321, 0.04250245, 1.660022, 1, 1, 1, 1, 1,
1.518298, -0.4276387, 2.801115, 1, 1, 1, 1, 1,
1.540531, -1.607041, 1.255322, 1, 1, 1, 1, 1,
1.551355, -0.9989096, 1.864095, 1, 1, 1, 1, 1,
1.562518, -1.567868, 1.073242, 0, 0, 1, 1, 1,
1.576114, 1.464293, 0.9615226, 1, 0, 0, 1, 1,
1.576584, 0.8655894, 0.04414253, 1, 0, 0, 1, 1,
1.580731, -2.039144, 0.4339698, 1, 0, 0, 1, 1,
1.59123, 0.5737707, -0.1929992, 1, 0, 0, 1, 1,
1.597598, -1.140223, 1.867393, 1, 0, 0, 1, 1,
1.628736, 0.1532927, 1.236819, 0, 0, 0, 1, 1,
1.632854, -0.4865811, 1.742194, 0, 0, 0, 1, 1,
1.654879, -0.7154545, 2.068894, 0, 0, 0, 1, 1,
1.661079, -0.3624949, 0.9213381, 0, 0, 0, 1, 1,
1.665218, 2.467278, 0.1197959, 0, 0, 0, 1, 1,
1.672036, 1.505456, 1.52805, 0, 0, 0, 1, 1,
1.676789, 0.7252894, 3.197757, 0, 0, 0, 1, 1,
1.68206, -0.8622978, 2.172109, 1, 1, 1, 1, 1,
1.701846, -1.29193, 0.4766179, 1, 1, 1, 1, 1,
1.774624, 0.4513734, 0.7426783, 1, 1, 1, 1, 1,
1.791398, -0.4516743, 3.036781, 1, 1, 1, 1, 1,
1.836693, 0.7496231, 0.07330996, 1, 1, 1, 1, 1,
1.841259, -0.4945139, 2.618125, 1, 1, 1, 1, 1,
1.844577, 0.7755784, 0.4923701, 1, 1, 1, 1, 1,
1.856857, 1.748267, 2.594694, 1, 1, 1, 1, 1,
1.864671, 1.151141, 2.872116, 1, 1, 1, 1, 1,
1.895535, -0.9439365, 0.1320005, 1, 1, 1, 1, 1,
1.936505, 1.020905, 0.978074, 1, 1, 1, 1, 1,
1.941912, 0.2115899, 2.133976, 1, 1, 1, 1, 1,
1.943432, -1.312703, 0.6137581, 1, 1, 1, 1, 1,
1.946681, -0.1083555, 1.446213, 1, 1, 1, 1, 1,
1.951542, 0.1213922, 2.79725, 1, 1, 1, 1, 1,
1.953454, 0.3635679, 1.724829, 0, 0, 1, 1, 1,
1.973794, 1.721546, 1.012423, 1, 0, 0, 1, 1,
1.999626, 0.1595839, 1.369269, 1, 0, 0, 1, 1,
2.027997, -1.043942, 3.190656, 1, 0, 0, 1, 1,
2.063675, -0.8755538, 3.264713, 1, 0, 0, 1, 1,
2.09209, 0.4898355, 0.1968721, 1, 0, 0, 1, 1,
2.161129, -1.216371, 0.3534947, 0, 0, 0, 1, 1,
2.168273, -0.9779766, 3.090824, 0, 0, 0, 1, 1,
2.210867, -0.6313936, 3.206233, 0, 0, 0, 1, 1,
2.221933, -0.2313755, 0.5250524, 0, 0, 0, 1, 1,
2.249333, 0.7914881, 1.253319, 0, 0, 0, 1, 1,
2.321736, -0.9338042, 0.8648483, 0, 0, 0, 1, 1,
2.37895, 0.6257907, 0.6193925, 0, 0, 0, 1, 1,
2.395804, 0.7857806, 1.059688, 1, 1, 1, 1, 1,
2.559988, -1.566089, -0.2669832, 1, 1, 1, 1, 1,
2.592649, 0.9118301, 0.5347065, 1, 1, 1, 1, 1,
2.63038, -0.325661, 0.323463, 1, 1, 1, 1, 1,
2.652373, 0.3045255, 1.451804, 1, 1, 1, 1, 1,
2.705869, 0.009681609, 2.675965, 1, 1, 1, 1, 1,
3.30221, 2.054546, 0.8585765, 1, 1, 1, 1, 1
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
var radius = 9.693103;
var distance = 34.04661;
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
mvMatrix.translate( -0.1264157, 0.03251982, -0.04013753 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.04661);
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
