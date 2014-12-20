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
-3.181375, -0.5173402, -1.182798, 1, 0, 0, 1,
-2.72513, 1.450615, -0.8207241, 1, 0.007843138, 0, 1,
-2.67371, -0.6548713, -2.308802, 1, 0.01176471, 0, 1,
-2.631328, -0.4586368, -1.340946, 1, 0.01960784, 0, 1,
-2.613622, 1.843063, -1.448967, 1, 0.02352941, 0, 1,
-2.58674, 0.9427769, 0.1656225, 1, 0.03137255, 0, 1,
-2.581764, 0.915243, -1.15146, 1, 0.03529412, 0, 1,
-2.577469, 1.117438, -1.02125, 1, 0.04313726, 0, 1,
-2.558922, -0.4953064, -0.2969394, 1, 0.04705882, 0, 1,
-2.514939, -0.8785253, -0.135947, 1, 0.05490196, 0, 1,
-2.511104, 2.215857, 0.02428445, 1, 0.05882353, 0, 1,
-2.424699, 0.9936424, -0.5200606, 1, 0.06666667, 0, 1,
-2.396123, 0.4409662, -2.393721, 1, 0.07058824, 0, 1,
-2.395402, 0.1495406, -2.395281, 1, 0.07843138, 0, 1,
-2.316825, 2.037808, -2.092077, 1, 0.08235294, 0, 1,
-2.312109, 0.8876616, -1.409214, 1, 0.09019608, 0, 1,
-2.280534, 0.9126351, 0.316316, 1, 0.09411765, 0, 1,
-2.240577, 2.627799, -0.9104338, 1, 0.1019608, 0, 1,
-2.230798, -1.235329, -1.346202, 1, 0.1098039, 0, 1,
-2.228574, 0.7407666, -1.319553, 1, 0.1137255, 0, 1,
-2.214616, 1.19183, -1.635967, 1, 0.1215686, 0, 1,
-2.207198, -0.8637268, -1.443225, 1, 0.1254902, 0, 1,
-2.20205, 0.05836728, -1.248788, 1, 0.1333333, 0, 1,
-2.113663, -0.9968001, -2.440644, 1, 0.1372549, 0, 1,
-2.072683, -0.792651, -1.575414, 1, 0.145098, 0, 1,
-2.064215, -1.064771, -1.131336, 1, 0.1490196, 0, 1,
-2.056235, -0.008514364, -0.5402125, 1, 0.1568628, 0, 1,
-2.033316, 1.069693, -0.9755317, 1, 0.1607843, 0, 1,
-1.922014, 1.225388, -0.4616353, 1, 0.1686275, 0, 1,
-1.911286, -0.1702476, -2.54416, 1, 0.172549, 0, 1,
-1.868506, 1.019163, -2.963372, 1, 0.1803922, 0, 1,
-1.865356, -0.19136, -1.777115, 1, 0.1843137, 0, 1,
-1.8567, 1.841052, -1.278338, 1, 0.1921569, 0, 1,
-1.856293, 0.3237207, 0.8003165, 1, 0.1960784, 0, 1,
-1.856041, 0.1059724, -1.252624, 1, 0.2039216, 0, 1,
-1.84822, 1.098433, -1.099591, 1, 0.2117647, 0, 1,
-1.842934, 0.3894989, -0.9416266, 1, 0.2156863, 0, 1,
-1.832294, 0.7254928, -1.786374, 1, 0.2235294, 0, 1,
-1.79607, -0.1926149, -3.568382, 1, 0.227451, 0, 1,
-1.78725, -1.013005, -1.931787, 1, 0.2352941, 0, 1,
-1.780119, -1.116332, -2.884976, 1, 0.2392157, 0, 1,
-1.760533, -0.2230123, -2.309344, 1, 0.2470588, 0, 1,
-1.753779, 0.2775051, 0.07692529, 1, 0.2509804, 0, 1,
-1.748555, 1.849168, -2.94213, 1, 0.2588235, 0, 1,
-1.737916, -0.5244644, -1.555272, 1, 0.2627451, 0, 1,
-1.733537, 1.903352, -0.9389427, 1, 0.2705882, 0, 1,
-1.730293, -2.527557, -4.458877, 1, 0.2745098, 0, 1,
-1.728956, 0.4207999, -1.023038, 1, 0.282353, 0, 1,
-1.723132, 0.2914094, -3.134732, 1, 0.2862745, 0, 1,
-1.71858, -1.111939, -0.391497, 1, 0.2941177, 0, 1,
-1.7023, 0.6685456, -0.7044691, 1, 0.3019608, 0, 1,
-1.675719, -0.3281818, -1.096859, 1, 0.3058824, 0, 1,
-1.674171, 0.3604544, 0.2554356, 1, 0.3137255, 0, 1,
-1.667511, 1.517152, -3.44575, 1, 0.3176471, 0, 1,
-1.665562, 0.257972, -2.884986, 1, 0.3254902, 0, 1,
-1.65688, -0.4200475, -1.364449, 1, 0.3294118, 0, 1,
-1.630347, -0.03622106, -1.059357, 1, 0.3372549, 0, 1,
-1.610396, -1.392932, -1.203398, 1, 0.3411765, 0, 1,
-1.608775, 0.1356655, -1.465922, 1, 0.3490196, 0, 1,
-1.591749, 1.206835, -0.8985934, 1, 0.3529412, 0, 1,
-1.576536, 0.2943762, -1.619467, 1, 0.3607843, 0, 1,
-1.570245, 0.693113, -1.805164, 1, 0.3647059, 0, 1,
-1.564793, 0.1386179, -1.443948, 1, 0.372549, 0, 1,
-1.561086, 0.8918053, -1.348228, 1, 0.3764706, 0, 1,
-1.550186, 0.2114386, -1.979738, 1, 0.3843137, 0, 1,
-1.537889, 0.2936787, -2.376847, 1, 0.3882353, 0, 1,
-1.536179, 1.57517, -0.9164761, 1, 0.3960784, 0, 1,
-1.532486, 0.825313, -2.342706, 1, 0.4039216, 0, 1,
-1.52147, 0.7948456, -0.2518871, 1, 0.4078431, 0, 1,
-1.518463, -1.042901, -2.834704, 1, 0.4156863, 0, 1,
-1.517319, -0.1459718, -0.4409226, 1, 0.4196078, 0, 1,
-1.50754, 1.319162, -3.089024, 1, 0.427451, 0, 1,
-1.499798, 0.908758, -1.381405, 1, 0.4313726, 0, 1,
-1.498983, 0.9008344, -0.02981447, 1, 0.4392157, 0, 1,
-1.484889, 0.460208, -1.399541, 1, 0.4431373, 0, 1,
-1.481283, 0.1688237, -0.2122368, 1, 0.4509804, 0, 1,
-1.480628, 0.5610172, -0.2487633, 1, 0.454902, 0, 1,
-1.470797, 0.2663253, -2.621165, 1, 0.4627451, 0, 1,
-1.461742, -0.4602975, -2.424554, 1, 0.4666667, 0, 1,
-1.458021, 0.2093753, -1.551123, 1, 0.4745098, 0, 1,
-1.457418, -0.7262979, -3.252908, 1, 0.4784314, 0, 1,
-1.44458, 1.384776, -1.107596, 1, 0.4862745, 0, 1,
-1.436376, 0.3420935, -0.3104369, 1, 0.4901961, 0, 1,
-1.429889, -1.62481, -3.177483, 1, 0.4980392, 0, 1,
-1.426679, -1.212132, -3.313379, 1, 0.5058824, 0, 1,
-1.423044, -0.5192944, -1.472896, 1, 0.509804, 0, 1,
-1.407054, -0.5270156, -1.961811, 1, 0.5176471, 0, 1,
-1.404176, -2.148798, -3.955097, 1, 0.5215687, 0, 1,
-1.394374, -1.06937, -4.835816, 1, 0.5294118, 0, 1,
-1.39401, -0.1762034, -4.439929, 1, 0.5333334, 0, 1,
-1.386551, 0.7166845, -0.06765856, 1, 0.5411765, 0, 1,
-1.37943, 0.4473214, 1.309372, 1, 0.5450981, 0, 1,
-1.37912, -0.8521187, -3.173302, 1, 0.5529412, 0, 1,
-1.367432, -1.320378, -2.346688, 1, 0.5568628, 0, 1,
-1.361109, 0.8934063, -1.450897, 1, 0.5647059, 0, 1,
-1.347652, 0.1946929, -1.333118, 1, 0.5686275, 0, 1,
-1.330414, -1.326321, -4.626753, 1, 0.5764706, 0, 1,
-1.327993, -0.2641919, -0.591027, 1, 0.5803922, 0, 1,
-1.3268, -1.104444, -3.860636, 1, 0.5882353, 0, 1,
-1.315684, -0.607868, -0.7928994, 1, 0.5921569, 0, 1,
-1.311738, 0.9847316, -1.107858, 1, 0.6, 0, 1,
-1.295683, -0.7584174, -1.546488, 1, 0.6078432, 0, 1,
-1.295296, 0.2793575, -0.0646387, 1, 0.6117647, 0, 1,
-1.294799, -0.1570235, -1.993394, 1, 0.6196079, 0, 1,
-1.28476, -0.02839094, -1.702973, 1, 0.6235294, 0, 1,
-1.274817, -0.3546808, 0.1588667, 1, 0.6313726, 0, 1,
-1.271203, 0.5569587, -1.447595, 1, 0.6352941, 0, 1,
-1.2635, -2.298114, -1.883347, 1, 0.6431373, 0, 1,
-1.260114, -0.02593643, -0.4703966, 1, 0.6470588, 0, 1,
-1.255315, -0.8447664, -3.66714, 1, 0.654902, 0, 1,
-1.25065, 1.841152, -0.1599117, 1, 0.6588235, 0, 1,
-1.24929, 1.54547, -2.204942, 1, 0.6666667, 0, 1,
-1.248587, -0.08335928, 0.4647607, 1, 0.6705883, 0, 1,
-1.237754, 0.936956, 1.630013, 1, 0.6784314, 0, 1,
-1.222593, 0.01098867, -0.1776721, 1, 0.682353, 0, 1,
-1.221846, -0.8592649, -2.533178, 1, 0.6901961, 0, 1,
-1.209852, -0.1654512, -0.759711, 1, 0.6941177, 0, 1,
-1.203829, 0.6395724, -1.245847, 1, 0.7019608, 0, 1,
-1.201591, -0.6019362, -2.644573, 1, 0.7098039, 0, 1,
-1.199793, -0.1203484, -0.163152, 1, 0.7137255, 0, 1,
-1.197246, 0.433481, -0.8746866, 1, 0.7215686, 0, 1,
-1.194943, 1.647612, 1.532761, 1, 0.7254902, 0, 1,
-1.189471, -0.3972544, -2.959107, 1, 0.7333333, 0, 1,
-1.181613, -1.13679, -1.9829, 1, 0.7372549, 0, 1,
-1.175962, -0.5413042, -2.686701, 1, 0.7450981, 0, 1,
-1.164446, 0.3276519, 0.2685095, 1, 0.7490196, 0, 1,
-1.154092, -1.371673, -1.793255, 1, 0.7568628, 0, 1,
-1.151374, 1.986794, -1.304958, 1, 0.7607843, 0, 1,
-1.149513, -0.5729514, -3.053292, 1, 0.7686275, 0, 1,
-1.144802, -1.185515, -2.427264, 1, 0.772549, 0, 1,
-1.13486, 0.2774054, -0.5350478, 1, 0.7803922, 0, 1,
-1.131933, -0.04677032, -1.99241, 1, 0.7843137, 0, 1,
-1.122194, -0.2750047, -2.842261, 1, 0.7921569, 0, 1,
-1.117287, -0.2004413, -0.01938686, 1, 0.7960784, 0, 1,
-1.115953, 0.6185758, -1.758392, 1, 0.8039216, 0, 1,
-1.110993, -0.4278106, -2.129073, 1, 0.8117647, 0, 1,
-1.10928, 0.8583032, 0.5122936, 1, 0.8156863, 0, 1,
-1.108894, 1.587931, -0.1543207, 1, 0.8235294, 0, 1,
-1.095285, -2.858869, -3.090318, 1, 0.827451, 0, 1,
-1.091295, -0.924322, -2.064794, 1, 0.8352941, 0, 1,
-1.090155, -1.805583, -3.442691, 1, 0.8392157, 0, 1,
-1.082035, -0.1206267, -2.295583, 1, 0.8470588, 0, 1,
-1.076124, -0.6279262, -2.444621, 1, 0.8509804, 0, 1,
-1.075901, -0.5300654, -3.834639, 1, 0.8588235, 0, 1,
-1.073127, -0.8371442, -1.129338, 1, 0.8627451, 0, 1,
-1.0689, 0.5506589, -2.356074, 1, 0.8705882, 0, 1,
-1.065977, -0.6658444, -3.384366, 1, 0.8745098, 0, 1,
-1.061152, 0.4848669, 0.7709139, 1, 0.8823529, 0, 1,
-1.052301, -0.143182, -0.1839606, 1, 0.8862745, 0, 1,
-1.048307, 0.2555622, -2.391724, 1, 0.8941177, 0, 1,
-1.047914, 0.6762608, -1.462622, 1, 0.8980392, 0, 1,
-1.03845, 0.2090654, -0.3735238, 1, 0.9058824, 0, 1,
-1.035297, -0.2764548, -2.218598, 1, 0.9137255, 0, 1,
-1.022478, 0.4790618, -1.194041, 1, 0.9176471, 0, 1,
-1.01719, 0.7476749, -1.801801, 1, 0.9254902, 0, 1,
-1.01409, 0.5374955, -2.47346, 1, 0.9294118, 0, 1,
-1.011456, 2.466251, 1.696673, 1, 0.9372549, 0, 1,
-1.0112, 0.066316, -3.075138, 1, 0.9411765, 0, 1,
-1.004111, -0.9365996, -2.411718, 1, 0.9490196, 0, 1,
-0.9908976, -0.7309688, -1.618438, 1, 0.9529412, 0, 1,
-0.9843225, 1.435105, -0.266042, 1, 0.9607843, 0, 1,
-0.9833068, -0.002080108, -1.322594, 1, 0.9647059, 0, 1,
-0.9727212, -1.431401, -2.811903, 1, 0.972549, 0, 1,
-0.9725064, 0.8281167, -1.40824, 1, 0.9764706, 0, 1,
-0.9720548, -0.1312766, -1.823263, 1, 0.9843137, 0, 1,
-0.9720235, -0.2787202, -2.402963, 1, 0.9882353, 0, 1,
-0.9666688, -0.7884536, -2.527617, 1, 0.9960784, 0, 1,
-0.9634153, 0.6997541, 1.364647, 0.9960784, 1, 0, 1,
-0.9579426, 0.7837008, -1.657368, 0.9921569, 1, 0, 1,
-0.9426857, -0.3010488, -1.753526, 0.9843137, 1, 0, 1,
-0.9400477, -0.1047392, -1.808556, 0.9803922, 1, 0, 1,
-0.935337, 0.7079845, -0.07001561, 0.972549, 1, 0, 1,
-0.9352774, 1.224114, -0.3184649, 0.9686275, 1, 0, 1,
-0.932256, -1.351988, -3.237324, 0.9607843, 1, 0, 1,
-0.9177473, 0.9247819, -1.670925, 0.9568627, 1, 0, 1,
-0.9150395, 0.2527998, -2.810551, 0.9490196, 1, 0, 1,
-0.9114153, 1.860334, -1.360765, 0.945098, 1, 0, 1,
-0.9078171, -0.2943833, -1.607351, 0.9372549, 1, 0, 1,
-0.906706, -0.2310676, -1.468622, 0.9333333, 1, 0, 1,
-0.9044938, -1.195078, -0.9425277, 0.9254902, 1, 0, 1,
-0.899139, -0.0952785, -2.471291, 0.9215686, 1, 0, 1,
-0.8958238, -1.253692, -4.288728, 0.9137255, 1, 0, 1,
-0.8929249, -0.2249323, -1.975686, 0.9098039, 1, 0, 1,
-0.8925294, -2.242489, -4.28982, 0.9019608, 1, 0, 1,
-0.8898908, -1.37198, -2.499224, 0.8941177, 1, 0, 1,
-0.8862264, -0.428833, 1.101041, 0.8901961, 1, 0, 1,
-0.886129, -1.316461, -3.734958, 0.8823529, 1, 0, 1,
-0.8847445, 1.641274, 0.1182395, 0.8784314, 1, 0, 1,
-0.8826262, 0.8095455, -0.5726612, 0.8705882, 1, 0, 1,
-0.8781611, 0.6511974, -0.02779419, 0.8666667, 1, 0, 1,
-0.8603875, -0.4207374, -2.720881, 0.8588235, 1, 0, 1,
-0.855853, 0.04239296, -2.15241, 0.854902, 1, 0, 1,
-0.8460245, 0.3759216, -0.5543193, 0.8470588, 1, 0, 1,
-0.8413901, -0.1747945, -1.560495, 0.8431373, 1, 0, 1,
-0.8322681, 1.372589, 0.7274066, 0.8352941, 1, 0, 1,
-0.8308524, 2.191557, 0.2924696, 0.8313726, 1, 0, 1,
-0.8198817, 1.208632, -0.4447123, 0.8235294, 1, 0, 1,
-0.8191708, -0.6952381, -1.475715, 0.8196079, 1, 0, 1,
-0.8183234, 0.8867308, 0.1665177, 0.8117647, 1, 0, 1,
-0.8164019, -0.6088622, -2.702537, 0.8078431, 1, 0, 1,
-0.8156512, -0.3965804, -0.9860114, 0.8, 1, 0, 1,
-0.8094246, -2.054348, -0.3434718, 0.7921569, 1, 0, 1,
-0.8052647, -0.878011, -2.89869, 0.7882353, 1, 0, 1,
-0.8045989, 0.8100428, 1.375064, 0.7803922, 1, 0, 1,
-0.8027406, -1.251619, -3.04979, 0.7764706, 1, 0, 1,
-0.8013015, 0.1737155, -0.9428276, 0.7686275, 1, 0, 1,
-0.8007805, 1.895277, -0.8580961, 0.7647059, 1, 0, 1,
-0.7994736, 0.4096208, -0.8110985, 0.7568628, 1, 0, 1,
-0.7985284, -0.7913384, -2.631626, 0.7529412, 1, 0, 1,
-0.7896249, -0.5573184, -3.037915, 0.7450981, 1, 0, 1,
-0.7879571, 0.1263176, -2.109552, 0.7411765, 1, 0, 1,
-0.7765777, 0.03319337, -1.563959, 0.7333333, 1, 0, 1,
-0.7765501, -0.5732316, -2.285538, 0.7294118, 1, 0, 1,
-0.7711248, 1.189232, -1.981182, 0.7215686, 1, 0, 1,
-0.770474, 0.7104119, -1.203095, 0.7176471, 1, 0, 1,
-0.7670603, -2.045797, -3.145947, 0.7098039, 1, 0, 1,
-0.7603476, 0.0005824862, -0.735167, 0.7058824, 1, 0, 1,
-0.7563509, -0.6364853, -2.59736, 0.6980392, 1, 0, 1,
-0.756133, 0.368619, 0.2554566, 0.6901961, 1, 0, 1,
-0.750755, 0.3868737, -0.6510906, 0.6862745, 1, 0, 1,
-0.7430933, -0.1540472, -2.851321, 0.6784314, 1, 0, 1,
-0.7370358, 0.8273662, 1.093017, 0.6745098, 1, 0, 1,
-0.7362159, 1.514891, -1.155152, 0.6666667, 1, 0, 1,
-0.7359331, 0.002453164, -1.450806, 0.6627451, 1, 0, 1,
-0.7266608, -1.516999, -2.642359, 0.654902, 1, 0, 1,
-0.7211482, 0.6724949, -1.23952, 0.6509804, 1, 0, 1,
-0.7178593, 1.605332, -0.8227952, 0.6431373, 1, 0, 1,
-0.7098268, 0.5806623, -2.051381, 0.6392157, 1, 0, 1,
-0.7073377, -0.6508024, -2.671317, 0.6313726, 1, 0, 1,
-0.7023192, -1.254596, -1.313587, 0.627451, 1, 0, 1,
-0.7009251, -0.924525, -3.410669, 0.6196079, 1, 0, 1,
-0.7005613, -0.06391421, -1.235425, 0.6156863, 1, 0, 1,
-0.6988873, -0.8714747, -2.976354, 0.6078432, 1, 0, 1,
-0.6915053, -0.7734973, -3.87909, 0.6039216, 1, 0, 1,
-0.6864084, 0.1813662, -3.279073, 0.5960785, 1, 0, 1,
-0.6791438, 1.296207, -2.004874, 0.5882353, 1, 0, 1,
-0.678943, -0.668555, -1.981491, 0.5843138, 1, 0, 1,
-0.6705976, -0.5575434, -1.320231, 0.5764706, 1, 0, 1,
-0.6697133, 0.06039017, -2.228416, 0.572549, 1, 0, 1,
-0.666927, -0.9031503, -2.205587, 0.5647059, 1, 0, 1,
-0.6615769, 0.2184764, -0.4198339, 0.5607843, 1, 0, 1,
-0.6553727, -0.4994285, -2.19694, 0.5529412, 1, 0, 1,
-0.653678, -0.5953986, -1.815579, 0.5490196, 1, 0, 1,
-0.651575, 1.022205, 0.2628382, 0.5411765, 1, 0, 1,
-0.6513804, 0.5570006, -0.8262249, 0.5372549, 1, 0, 1,
-0.6488977, 1.588651, 0.7524205, 0.5294118, 1, 0, 1,
-0.6476214, 0.2324528, -1.55261, 0.5254902, 1, 0, 1,
-0.6463299, -0.2031085, -2.282672, 0.5176471, 1, 0, 1,
-0.6454389, -1.735388, -2.368513, 0.5137255, 1, 0, 1,
-0.6452394, -0.4300407, -1.592848, 0.5058824, 1, 0, 1,
-0.6422949, -1.096433, -3.052442, 0.5019608, 1, 0, 1,
-0.6412351, -0.06560695, -2.404186, 0.4941176, 1, 0, 1,
-0.6373196, -0.2243723, -2.130225, 0.4862745, 1, 0, 1,
-0.6363535, -0.6408436, -2.999734, 0.4823529, 1, 0, 1,
-0.6357232, -1.751455, -3.367803, 0.4745098, 1, 0, 1,
-0.6346276, 0.8884902, 0.9143004, 0.4705882, 1, 0, 1,
-0.6332321, 1.538172, -0.9980938, 0.4627451, 1, 0, 1,
-0.6238793, -0.4717299, -1.645223, 0.4588235, 1, 0, 1,
-0.6181136, -0.2952492, -3.377087, 0.4509804, 1, 0, 1,
-0.6155539, 0.06794323, -0.9644446, 0.4470588, 1, 0, 1,
-0.6142122, 1.724977, 1.288639, 0.4392157, 1, 0, 1,
-0.6059715, -0.3656624, -2.384643, 0.4352941, 1, 0, 1,
-0.6049886, -0.2214388, -1.814792, 0.427451, 1, 0, 1,
-0.6000699, -0.5556013, -2.137975, 0.4235294, 1, 0, 1,
-0.5932318, 3.155396, -0.8354163, 0.4156863, 1, 0, 1,
-0.5844825, -0.09372722, -3.757706, 0.4117647, 1, 0, 1,
-0.5833147, 1.38611, -1.269032, 0.4039216, 1, 0, 1,
-0.579774, -1.271922, -3.551166, 0.3960784, 1, 0, 1,
-0.5790974, -0.2600187, -2.141372, 0.3921569, 1, 0, 1,
-0.5783469, -1.813246, -2.713377, 0.3843137, 1, 0, 1,
-0.5780268, 0.6492351, -1.397676, 0.3803922, 1, 0, 1,
-0.57736, -0.102367, -2.811555, 0.372549, 1, 0, 1,
-0.576753, 0.5967139, -0.8402736, 0.3686275, 1, 0, 1,
-0.5762197, -2.122774, -1.266412, 0.3607843, 1, 0, 1,
-0.5686542, -0.7448539, -2.445522, 0.3568628, 1, 0, 1,
-0.5682201, -0.007448319, -1.341089, 0.3490196, 1, 0, 1,
-0.5665658, -0.9452291, -3.00003, 0.345098, 1, 0, 1,
-0.5629458, 1.320022, -1.329329, 0.3372549, 1, 0, 1,
-0.5545124, 0.7612343, -2.202608, 0.3333333, 1, 0, 1,
-0.5522982, -0.7154345, -0.979057, 0.3254902, 1, 0, 1,
-0.5517691, -0.04066762, -1.81837, 0.3215686, 1, 0, 1,
-0.5507198, -0.1140913, -1.654522, 0.3137255, 1, 0, 1,
-0.5495833, -0.1444431, -2.946778, 0.3098039, 1, 0, 1,
-0.5453307, -1.397232, -1.684665, 0.3019608, 1, 0, 1,
-0.5447586, 0.8423277, -2.113818, 0.2941177, 1, 0, 1,
-0.5387379, -0.7183204, -1.748401, 0.2901961, 1, 0, 1,
-0.5364558, 1.007504, -0.7760546, 0.282353, 1, 0, 1,
-0.5345438, -0.2151807, -1.652401, 0.2784314, 1, 0, 1,
-0.5342116, -1.187863, -3.791475, 0.2705882, 1, 0, 1,
-0.529913, -0.8067426, -3.630121, 0.2666667, 1, 0, 1,
-0.5247677, -0.2146298, -2.874546, 0.2588235, 1, 0, 1,
-0.516556, 1.355882, 2.028222, 0.254902, 1, 0, 1,
-0.513827, -0.7932964, -3.687428, 0.2470588, 1, 0, 1,
-0.5136552, -0.2198847, -1.090504, 0.2431373, 1, 0, 1,
-0.5097559, 0.4896105, -0.8542439, 0.2352941, 1, 0, 1,
-0.509221, 0.4615359, -0.8013409, 0.2313726, 1, 0, 1,
-0.5079775, -1.683892, -2.664649, 0.2235294, 1, 0, 1,
-0.5069944, 0.03294482, -0.1631404, 0.2196078, 1, 0, 1,
-0.5034427, 0.9007835, 0.706849, 0.2117647, 1, 0, 1,
-0.4966404, -1.484843, -2.838879, 0.2078431, 1, 0, 1,
-0.4866185, 1.231065, 0.06016861, 0.2, 1, 0, 1,
-0.4864538, 0.9769303, -2.468456, 0.1921569, 1, 0, 1,
-0.4861901, 0.3459682, -2.108763, 0.1882353, 1, 0, 1,
-0.4847945, 1.858472, 1.269966, 0.1803922, 1, 0, 1,
-0.4840267, 1.631229, 0.20285, 0.1764706, 1, 0, 1,
-0.4813445, 0.4119608, 0.6280752, 0.1686275, 1, 0, 1,
-0.4757039, -1.266476, -2.717943, 0.1647059, 1, 0, 1,
-0.473552, -1.01362, -3.109046, 0.1568628, 1, 0, 1,
-0.4727316, 0.8824317, -0.8903281, 0.1529412, 1, 0, 1,
-0.4635735, 0.5810078, -1.249868, 0.145098, 1, 0, 1,
-0.4632159, -0.009455044, -1.023906, 0.1411765, 1, 0, 1,
-0.4630279, -0.482041, -3.631139, 0.1333333, 1, 0, 1,
-0.4566337, -0.4372949, -3.246594, 0.1294118, 1, 0, 1,
-0.4538845, -0.4827769, -2.668901, 0.1215686, 1, 0, 1,
-0.4480197, -0.4842813, -2.000313, 0.1176471, 1, 0, 1,
-0.4480081, -2.022178, -4.092719, 0.1098039, 1, 0, 1,
-0.4459105, -1.474142, -1.929113, 0.1058824, 1, 0, 1,
-0.4436988, 2.519975, 1.124976, 0.09803922, 1, 0, 1,
-0.4363639, 0.1284769, -1.562083, 0.09019608, 1, 0, 1,
-0.4351579, 0.07160359, -1.136436, 0.08627451, 1, 0, 1,
-0.4333554, -1.268432, -4.288408, 0.07843138, 1, 0, 1,
-0.4331785, -1.44174, -4.432808, 0.07450981, 1, 0, 1,
-0.4329506, 0.2559313, -0.07187969, 0.06666667, 1, 0, 1,
-0.4302901, -0.4667272, -2.889847, 0.0627451, 1, 0, 1,
-0.4294281, 0.5414326, -0.5949761, 0.05490196, 1, 0, 1,
-0.4245662, 0.6569715, -0.803131, 0.05098039, 1, 0, 1,
-0.4206817, 0.6524832, -1.409897, 0.04313726, 1, 0, 1,
-0.4185159, -0.5610037, -2.970052, 0.03921569, 1, 0, 1,
-0.4149677, 1.902178, -0.8324986, 0.03137255, 1, 0, 1,
-0.413711, 0.6662917, -2.198512, 0.02745098, 1, 0, 1,
-0.4101873, -0.06275038, -2.069171, 0.01960784, 1, 0, 1,
-0.4074493, -1.546614, -4.176042, 0.01568628, 1, 0, 1,
-0.4068048, -0.3817786, -1.115103, 0.007843138, 1, 0, 1,
-0.4048011, 1.923187, -0.6181443, 0.003921569, 1, 0, 1,
-0.4003465, 0.180575, -2.244418, 0, 1, 0.003921569, 1,
-0.3996164, -0.05619993, -2.723344, 0, 1, 0.01176471, 1,
-0.3958745, 1.605901, -0.4943713, 0, 1, 0.01568628, 1,
-0.3934446, -0.1538368, -4.467707, 0, 1, 0.02352941, 1,
-0.3919414, -0.926205, -5.298636, 0, 1, 0.02745098, 1,
-0.390264, -0.1498005, -2.410918, 0, 1, 0.03529412, 1,
-0.3902453, -0.3535666, -0.7008162, 0, 1, 0.03921569, 1,
-0.3863078, -0.212056, -0.8296172, 0, 1, 0.04705882, 1,
-0.386151, -1.52488, -1.365348, 0, 1, 0.05098039, 1,
-0.382933, 1.23149, -1.569095, 0, 1, 0.05882353, 1,
-0.3815358, 1.247523, -0.6937701, 0, 1, 0.0627451, 1,
-0.37248, -2.414879, -3.795496, 0, 1, 0.07058824, 1,
-0.3707419, -1.158492, -2.851048, 0, 1, 0.07450981, 1,
-0.3598906, -1.433718, -3.666122, 0, 1, 0.08235294, 1,
-0.3594315, -0.2983133, -2.131126, 0, 1, 0.08627451, 1,
-0.355527, 0.4178924, -1.00184, 0, 1, 0.09411765, 1,
-0.3553908, -0.3229437, -3.525853, 0, 1, 0.1019608, 1,
-0.3516077, -0.5105986, -2.756033, 0, 1, 0.1058824, 1,
-0.3505843, 1.295993, 0.01174679, 0, 1, 0.1137255, 1,
-0.350332, -1.707259, -2.856832, 0, 1, 0.1176471, 1,
-0.3472224, 0.8024657, -0.4566842, 0, 1, 0.1254902, 1,
-0.3465749, 0.5137744, -0.1919824, 0, 1, 0.1294118, 1,
-0.34115, 1.148332, -1.020889, 0, 1, 0.1372549, 1,
-0.3396115, 0.2978376, -1.464097, 0, 1, 0.1411765, 1,
-0.337844, -1.87181, -2.401743, 0, 1, 0.1490196, 1,
-0.3350969, -0.09900481, -0.6101578, 0, 1, 0.1529412, 1,
-0.3343318, -0.03244291, -0.9496861, 0, 1, 0.1607843, 1,
-0.3331343, 1.736973, 0.06672399, 0, 1, 0.1647059, 1,
-0.3329485, 0.1726893, -0.6316965, 0, 1, 0.172549, 1,
-0.3317258, -1.3374, -0.5840214, 0, 1, 0.1764706, 1,
-0.3270228, -1.543895, -0.371749, 0, 1, 0.1843137, 1,
-0.3255803, 0.4082473, -1.49323, 0, 1, 0.1882353, 1,
-0.3226368, 1.782209, -0.3579047, 0, 1, 0.1960784, 1,
-0.3218867, -0.6387056, -3.576843, 0, 1, 0.2039216, 1,
-0.3201461, -2.326464, -1.977925, 0, 1, 0.2078431, 1,
-0.3119413, 1.954263, -1.362379, 0, 1, 0.2156863, 1,
-0.308043, -0.3809108, -1.612626, 0, 1, 0.2196078, 1,
-0.3071149, 0.5182126, -1.685547, 0, 1, 0.227451, 1,
-0.2989249, -0.4161471, -2.227518, 0, 1, 0.2313726, 1,
-0.2966619, 0.7859904, -1.854375, 0, 1, 0.2392157, 1,
-0.2934089, 0.06899779, -2.488154, 0, 1, 0.2431373, 1,
-0.2899931, 0.6138574, -0.705228, 0, 1, 0.2509804, 1,
-0.2882819, -0.6129367, -3.182455, 0, 1, 0.254902, 1,
-0.2861573, -0.8797522, -3.519605, 0, 1, 0.2627451, 1,
-0.2809665, -0.2439077, -1.534119, 0, 1, 0.2666667, 1,
-0.2802725, 0.7150652, -1.492952, 0, 1, 0.2745098, 1,
-0.2785696, -0.04431494, -1.655877, 0, 1, 0.2784314, 1,
-0.2739148, -0.2934509, -3.110464, 0, 1, 0.2862745, 1,
-0.27339, -0.7528376, -3.655849, 0, 1, 0.2901961, 1,
-0.2724813, 0.2822847, -1.673977, 0, 1, 0.2980392, 1,
-0.27217, -1.83927, -2.186501, 0, 1, 0.3058824, 1,
-0.2704483, 0.655297, -2.174881, 0, 1, 0.3098039, 1,
-0.2648193, 0.03432464, -1.352283, 0, 1, 0.3176471, 1,
-0.2648042, 1.130333, 0.2534787, 0, 1, 0.3215686, 1,
-0.26005, 0.05871403, 0.6010918, 0, 1, 0.3294118, 1,
-0.2586086, -0.5969495, -2.565303, 0, 1, 0.3333333, 1,
-0.2533786, -0.3498426, -3.017779, 0, 1, 0.3411765, 1,
-0.2520549, 0.8962257, -0.2453169, 0, 1, 0.345098, 1,
-0.2512386, -0.7063382, -0.8338452, 0, 1, 0.3529412, 1,
-0.2476082, -1.657297, -3.323037, 0, 1, 0.3568628, 1,
-0.2461249, 0.1272158, -3.102728, 0, 1, 0.3647059, 1,
-0.2414579, 1.153031, -0.6752825, 0, 1, 0.3686275, 1,
-0.2395374, -0.8325928, -2.237437, 0, 1, 0.3764706, 1,
-0.2358014, -0.3788353, -5.169356, 0, 1, 0.3803922, 1,
-0.2315438, 0.9687054, -0.8272719, 0, 1, 0.3882353, 1,
-0.2297683, 1.402513, 0.09482016, 0, 1, 0.3921569, 1,
-0.2262549, 1.171314, 0.7630087, 0, 1, 0.4, 1,
-0.2244164, 0.61448, 0.9195756, 0, 1, 0.4078431, 1,
-0.2235695, -0.09392864, -1.918784, 0, 1, 0.4117647, 1,
-0.2214612, -0.6973983, -2.221561, 0, 1, 0.4196078, 1,
-0.2167452, -0.4658363, 0.07804542, 0, 1, 0.4235294, 1,
-0.2164227, -0.5159412, -2.675465, 0, 1, 0.4313726, 1,
-0.216379, 1.02806, -2.102458, 0, 1, 0.4352941, 1,
-0.2107868, -0.4817151, -2.821611, 0, 1, 0.4431373, 1,
-0.2105467, -1.417062, -3.860346, 0, 1, 0.4470588, 1,
-0.2099685, 0.2012577, 0.2027861, 0, 1, 0.454902, 1,
-0.2096455, 0.2836264, 3.074836, 0, 1, 0.4588235, 1,
-0.2093105, 0.7390236, -0.9271281, 0, 1, 0.4666667, 1,
-0.2069876, -0.4952625, -3.220397, 0, 1, 0.4705882, 1,
-0.2068915, 0.4831802, -0.5415723, 0, 1, 0.4784314, 1,
-0.2062347, 1.731293, 0.2002705, 0, 1, 0.4823529, 1,
-0.2056167, -1.284956, -3.172647, 0, 1, 0.4901961, 1,
-0.2048839, -0.7960061, -2.837387, 0, 1, 0.4941176, 1,
-0.204046, -0.1951783, -0.3172415, 0, 1, 0.5019608, 1,
-0.2039519, -0.5160233, -2.951619, 0, 1, 0.509804, 1,
-0.2008825, -0.01473581, -2.123642, 0, 1, 0.5137255, 1,
-0.197225, 0.3857091, -2.424414, 0, 1, 0.5215687, 1,
-0.1943099, -0.825411, -2.935932, 0, 1, 0.5254902, 1,
-0.193215, -0.6228015, -3.810401, 0, 1, 0.5333334, 1,
-0.1926904, 1.361177, 0.02588262, 0, 1, 0.5372549, 1,
-0.1918941, 0.5499647, -0.7684762, 0, 1, 0.5450981, 1,
-0.1917281, 0.4011764, 0.01829797, 0, 1, 0.5490196, 1,
-0.1907643, -0.1684125, -3.167938, 0, 1, 0.5568628, 1,
-0.1876925, -0.7741494, -3.892514, 0, 1, 0.5607843, 1,
-0.1869169, 0.5709918, -2.105908, 0, 1, 0.5686275, 1,
-0.1858496, 1.882894, -0.2299944, 0, 1, 0.572549, 1,
-0.1837322, -0.8385546, -3.058165, 0, 1, 0.5803922, 1,
-0.1797391, -1.472686, -3.159197, 0, 1, 0.5843138, 1,
-0.1788651, -0.3262435, -2.507748, 0, 1, 0.5921569, 1,
-0.1778278, -1.304678, -2.963379, 0, 1, 0.5960785, 1,
-0.1699835, 0.2050862, -0.04224028, 0, 1, 0.6039216, 1,
-0.1635827, -0.3892323, -1.287514, 0, 1, 0.6117647, 1,
-0.1635761, -0.7341238, -2.451416, 0, 1, 0.6156863, 1,
-0.1623829, -0.07198306, -1.709486, 0, 1, 0.6235294, 1,
-0.1590501, 0.8081235, 0.4368205, 0, 1, 0.627451, 1,
-0.1586306, 0.917042, -0.5474818, 0, 1, 0.6352941, 1,
-0.1563421, -0.341535, -2.94709, 0, 1, 0.6392157, 1,
-0.1549928, 0.4431139, -0.325098, 0, 1, 0.6470588, 1,
-0.1527793, 1.102959, -0.7268209, 0, 1, 0.6509804, 1,
-0.1519403, 0.4305102, 0.4050537, 0, 1, 0.6588235, 1,
-0.1507726, -0.4502863, -2.21525, 0, 1, 0.6627451, 1,
-0.1457985, -0.01360961, -1.006837, 0, 1, 0.6705883, 1,
-0.1447907, -0.3532335, -2.435453, 0, 1, 0.6745098, 1,
-0.1446501, -0.375935, -2.246652, 0, 1, 0.682353, 1,
-0.1445764, 0.8897822, -0.5084355, 0, 1, 0.6862745, 1,
-0.1440275, 0.07161608, 0.006825464, 0, 1, 0.6941177, 1,
-0.1425763, -0.1334244, -2.27424, 0, 1, 0.7019608, 1,
-0.1392414, 0.7602159, -1.176968, 0, 1, 0.7058824, 1,
-0.1353283, 1.111399, -1.539905, 0, 1, 0.7137255, 1,
-0.1342421, 0.6538346, -1.499525, 0, 1, 0.7176471, 1,
-0.1323684, -0.1355934, -0.8055019, 0, 1, 0.7254902, 1,
-0.131948, 0.6822525, -0.1990846, 0, 1, 0.7294118, 1,
-0.1317068, -0.8963071, -3.775257, 0, 1, 0.7372549, 1,
-0.1314586, -0.552398, -1.471515, 0, 1, 0.7411765, 1,
-0.1305444, 0.7629004, 0.4403529, 0, 1, 0.7490196, 1,
-0.1282746, 1.861649, -1.103456, 0, 1, 0.7529412, 1,
-0.1273843, 0.07651417, -2.663298, 0, 1, 0.7607843, 1,
-0.1158011, 0.372415, -0.5836305, 0, 1, 0.7647059, 1,
-0.1135296, -0.1250683, -1.648897, 0, 1, 0.772549, 1,
-0.1123585, -1.13771, -3.80934, 0, 1, 0.7764706, 1,
-0.1054842, 0.7155336, -1.795208, 0, 1, 0.7843137, 1,
-0.09366167, -1.768265, -2.552292, 0, 1, 0.7882353, 1,
-0.09142546, 0.04892338, 0.8025867, 0, 1, 0.7960784, 1,
-0.08729437, 0.2157028, 0.9597592, 0, 1, 0.8039216, 1,
-0.08644937, 0.312415, -0.1756707, 0, 1, 0.8078431, 1,
-0.08264963, -1.250266, -2.919602, 0, 1, 0.8156863, 1,
-0.08201162, -0.4314707, -2.308826, 0, 1, 0.8196079, 1,
-0.07970297, -0.3463683, -2.880113, 0, 1, 0.827451, 1,
-0.0671729, -1.390568, -3.142904, 0, 1, 0.8313726, 1,
-0.06557072, 1.981292, 0.6862434, 0, 1, 0.8392157, 1,
-0.06534948, 0.3982737, -0.7465128, 0, 1, 0.8431373, 1,
-0.06055805, -0.60437, -3.235492, 0, 1, 0.8509804, 1,
-0.05999713, -0.6325775, -3.093912, 0, 1, 0.854902, 1,
-0.05980023, -0.5842965, -2.733557, 0, 1, 0.8627451, 1,
-0.05845881, -1.341432, -1.58558, 0, 1, 0.8666667, 1,
-0.05824207, -1.791542, -2.115752, 0, 1, 0.8745098, 1,
-0.0511768, -0.9068812, -5.985754, 0, 1, 0.8784314, 1,
-0.05076493, 0.4546883, -0.3669118, 0, 1, 0.8862745, 1,
-0.05043992, 0.1048597, -0.5315711, 0, 1, 0.8901961, 1,
-0.04988321, 1.390645, -0.3641966, 0, 1, 0.8980392, 1,
-0.04914711, -0.8501593, -3.594671, 0, 1, 0.9058824, 1,
-0.04832383, -1.591517, -4.64483, 0, 1, 0.9098039, 1,
-0.0476921, -1.589831, -3.554667, 0, 1, 0.9176471, 1,
-0.04601022, -0.4377241, -2.830963, 0, 1, 0.9215686, 1,
-0.03993046, 0.6865038, 0.4020301, 0, 1, 0.9294118, 1,
-0.03905119, -0.7276164, -2.573056, 0, 1, 0.9333333, 1,
-0.03277507, 0.5719761, -2.401276, 0, 1, 0.9411765, 1,
-0.03254119, -0.7264689, -3.000844, 0, 1, 0.945098, 1,
-0.03073421, 0.4758466, 0.548456, 0, 1, 0.9529412, 1,
-0.02691173, -1.467013, -3.020946, 0, 1, 0.9568627, 1,
-0.02128708, -2.029635, -1.712265, 0, 1, 0.9647059, 1,
-0.0191365, -0.09782273, -4.012903, 0, 1, 0.9686275, 1,
-0.01737304, -0.1570256, -3.152249, 0, 1, 0.9764706, 1,
-0.01263324, -0.6434465, -4.193969, 0, 1, 0.9803922, 1,
-0.01210565, 0.7331204, -0.6748424, 0, 1, 0.9882353, 1,
-0.009588851, 0.2616745, -1.357269, 0, 1, 0.9921569, 1,
-0.007952666, -1.096027, -4.578778, 0, 1, 1, 1,
-0.005289545, -3.022044, -1.959559, 0, 0.9921569, 1, 1,
4.545429e-05, -0.5173385, 2.08105, 0, 0.9882353, 1, 1,
0.0004393349, 1.292349, -1.201162, 0, 0.9803922, 1, 1,
0.01065894, 0.03039573, -0.6327937, 0, 0.9764706, 1, 1,
0.01194215, -1.895829, 1.731308, 0, 0.9686275, 1, 1,
0.01209674, 1.488785, 0.1146494, 0, 0.9647059, 1, 1,
0.01618038, 0.3072196, -0.6373811, 0, 0.9568627, 1, 1,
0.01733455, 0.4782184, -0.4094166, 0, 0.9529412, 1, 1,
0.02292612, -2.153286, 4.376437, 0, 0.945098, 1, 1,
0.04377522, 0.03902543, 1.57921, 0, 0.9411765, 1, 1,
0.04412277, 1.521488, 0.5520703, 0, 0.9333333, 1, 1,
0.04920314, -0.7364913, 4.236929, 0, 0.9294118, 1, 1,
0.05255914, 0.1671841, 1.136291, 0, 0.9215686, 1, 1,
0.05336564, -1.045722, 2.884184, 0, 0.9176471, 1, 1,
0.05459638, -0.4937503, 2.611647, 0, 0.9098039, 1, 1,
0.05711031, 0.9545508, 0.6190757, 0, 0.9058824, 1, 1,
0.05758998, -1.373811, 3.27528, 0, 0.8980392, 1, 1,
0.05801478, 1.212566, 0.06352434, 0, 0.8901961, 1, 1,
0.05813877, -2.189172, 3.023623, 0, 0.8862745, 1, 1,
0.05882841, -1.420939, 3.891923, 0, 0.8784314, 1, 1,
0.05902631, -0.1545303, 3.092328, 0, 0.8745098, 1, 1,
0.0597114, -1.892852, 3.401372, 0, 0.8666667, 1, 1,
0.06422818, 1.063318, -0.5345417, 0, 0.8627451, 1, 1,
0.06424626, -0.6348811, 2.813659, 0, 0.854902, 1, 1,
0.07022551, 0.9733153, -1.420856, 0, 0.8509804, 1, 1,
0.07183579, 2.475611, 0.3721225, 0, 0.8431373, 1, 1,
0.07232631, 0.07182136, 0.3047629, 0, 0.8392157, 1, 1,
0.07276358, 0.5546895, 1.63793, 0, 0.8313726, 1, 1,
0.07376669, 1.41298, 0.8623727, 0, 0.827451, 1, 1,
0.07588576, -1.211312, 4.441012, 0, 0.8196079, 1, 1,
0.0763035, 0.1698618, 0.5792033, 0, 0.8156863, 1, 1,
0.08187583, 0.3645939, 0.4239093, 0, 0.8078431, 1, 1,
0.08197734, 0.2007851, 0.0948547, 0, 0.8039216, 1, 1,
0.08324188, -1.300533, 3.298647, 0, 0.7960784, 1, 1,
0.08574761, 0.6047185, 0.4561025, 0, 0.7882353, 1, 1,
0.09052431, -0.8239928, 5.0122, 0, 0.7843137, 1, 1,
0.09994332, -0.4461498, 3.411395, 0, 0.7764706, 1, 1,
0.1000379, -1.503724, 2.339018, 0, 0.772549, 1, 1,
0.1015393, -0.8011692, 1.903743, 0, 0.7647059, 1, 1,
0.1108845, -0.1823958, 2.909297, 0, 0.7607843, 1, 1,
0.1122611, 1.329046, 0.905274, 0, 0.7529412, 1, 1,
0.1126924, 0.4224656, -0.8023629, 0, 0.7490196, 1, 1,
0.1166827, -0.9231562, 4.540037, 0, 0.7411765, 1, 1,
0.1168999, 0.1798036, 0.5281974, 0, 0.7372549, 1, 1,
0.1212769, 1.616207, -0.9255231, 0, 0.7294118, 1, 1,
0.1285824, 0.2069256, -0.6952136, 0, 0.7254902, 1, 1,
0.1289092, -1.43283, 3.693726, 0, 0.7176471, 1, 1,
0.1290416, -1.20995, 1.834222, 0, 0.7137255, 1, 1,
0.1302159, -0.1291885, 2.829847, 0, 0.7058824, 1, 1,
0.1318683, 1.02018, -0.288351, 0, 0.6980392, 1, 1,
0.1331022, -0.06914117, 2.830408, 0, 0.6941177, 1, 1,
0.1354352, -0.5551322, 4.788452, 0, 0.6862745, 1, 1,
0.1381721, -0.4187877, 1.791967, 0, 0.682353, 1, 1,
0.141919, 1.259989, 2.042918, 0, 0.6745098, 1, 1,
0.1430925, -0.05634703, 0.5256554, 0, 0.6705883, 1, 1,
0.1440877, 0.3353193, 0.05381705, 0, 0.6627451, 1, 1,
0.1449184, 0.2617349, 1.408263, 0, 0.6588235, 1, 1,
0.1472006, 0.9577179, 1.393673, 0, 0.6509804, 1, 1,
0.1487127, 0.2471632, -0.5074627, 0, 0.6470588, 1, 1,
0.1529943, 0.2299315, 0.9911633, 0, 0.6392157, 1, 1,
0.1532581, -0.9788055, 3.470378, 0, 0.6352941, 1, 1,
0.1562422, -1.907198, 3.6915, 0, 0.627451, 1, 1,
0.1600111, 0.6069322, 1.032008, 0, 0.6235294, 1, 1,
0.1607715, -1.140348, 1.969941, 0, 0.6156863, 1, 1,
0.1611771, -1.084913, 2.995898, 0, 0.6117647, 1, 1,
0.1658072, 0.2315248, 0.3046604, 0, 0.6039216, 1, 1,
0.168936, 0.873077, 1.794606, 0, 0.5960785, 1, 1,
0.1714953, -0.891592, 2.813425, 0, 0.5921569, 1, 1,
0.1767923, 0.213642, -1.124797, 0, 0.5843138, 1, 1,
0.1772293, -0.3198069, 2.800751, 0, 0.5803922, 1, 1,
0.1813537, -0.5004157, 4.452828, 0, 0.572549, 1, 1,
0.1821786, -0.5800346, 2.784378, 0, 0.5686275, 1, 1,
0.1825809, -1.065941, 3.6817, 0, 0.5607843, 1, 1,
0.1870758, 0.1699523, 0.2431752, 0, 0.5568628, 1, 1,
0.1876671, -0.199923, 2.153995, 0, 0.5490196, 1, 1,
0.1902872, -0.3513833, 2.565491, 0, 0.5450981, 1, 1,
0.1907693, 0.9906021, 0.8975517, 0, 0.5372549, 1, 1,
0.2009361, -0.08636715, 2.699862, 0, 0.5333334, 1, 1,
0.2026029, -1.071147, 4.42487, 0, 0.5254902, 1, 1,
0.2031499, 0.9148181, 0.09651162, 0, 0.5215687, 1, 1,
0.2050749, -1.855959, 1.228805, 0, 0.5137255, 1, 1,
0.2081833, -1.695634, 2.18854, 0, 0.509804, 1, 1,
0.2083019, 0.6402006, -1.3246, 0, 0.5019608, 1, 1,
0.2118571, 1.461939, -0.2439976, 0, 0.4941176, 1, 1,
0.2121701, -2.022376, 3.891025, 0, 0.4901961, 1, 1,
0.2131243, 1.489151, -0.9750855, 0, 0.4823529, 1, 1,
0.2148066, -0.8724986, 3.639304, 0, 0.4784314, 1, 1,
0.2169495, -0.7620528, 1.882, 0, 0.4705882, 1, 1,
0.2215543, -0.04026097, 2.354423, 0, 0.4666667, 1, 1,
0.2218119, 1.372997, 0.6165903, 0, 0.4588235, 1, 1,
0.2230629, -1.44179, 3.079981, 0, 0.454902, 1, 1,
0.2243776, -0.5917257, 3.257087, 0, 0.4470588, 1, 1,
0.2252571, -1.535635, 4.689116, 0, 0.4431373, 1, 1,
0.2254003, 1.487198, -1.720156, 0, 0.4352941, 1, 1,
0.2271801, -1.632691, 2.851803, 0, 0.4313726, 1, 1,
0.2349878, 2.084828, -0.5015815, 0, 0.4235294, 1, 1,
0.2352539, 1.295109, -0.2883611, 0, 0.4196078, 1, 1,
0.2374758, 1.161241, -0.1822427, 0, 0.4117647, 1, 1,
0.2389345, 0.6734154, -1.695926, 0, 0.4078431, 1, 1,
0.2393188, 0.2701512, 1.273932, 0, 0.4, 1, 1,
0.2424996, 2.589453, 1.297868, 0, 0.3921569, 1, 1,
0.2456618, 0.1917003, 0.8779741, 0, 0.3882353, 1, 1,
0.2500138, 1.658512, -0.1718573, 0, 0.3803922, 1, 1,
0.2544996, -0.1558734, 2.09271, 0, 0.3764706, 1, 1,
0.2577834, -0.4478522, 2.166019, 0, 0.3686275, 1, 1,
0.2616017, -2.202427, 4.647158, 0, 0.3647059, 1, 1,
0.2654221, -0.6168892, 1.568973, 0, 0.3568628, 1, 1,
0.2681236, 0.752199, 1.094189, 0, 0.3529412, 1, 1,
0.2765381, -0.9478603, 3.077629, 0, 0.345098, 1, 1,
0.2783284, -1.230999, 2.670969, 0, 0.3411765, 1, 1,
0.2809124, 1.773674, -0.003409484, 0, 0.3333333, 1, 1,
0.2809412, 0.9371303, 1.033316, 0, 0.3294118, 1, 1,
0.2843416, -0.8481617, 2.758548, 0, 0.3215686, 1, 1,
0.2854938, -1.12972, 3.35435, 0, 0.3176471, 1, 1,
0.2884311, 0.9797727, 1.78499, 0, 0.3098039, 1, 1,
0.289791, -1.333756, 4.683746, 0, 0.3058824, 1, 1,
0.292989, 0.247787, 0.1173009, 0, 0.2980392, 1, 1,
0.2944458, -0.8428195, 2.722286, 0, 0.2901961, 1, 1,
0.2965544, -0.7055478, 2.837491, 0, 0.2862745, 1, 1,
0.2997892, 0.7098317, -0.08704055, 0, 0.2784314, 1, 1,
0.300679, -0.2023434, 1.18258, 0, 0.2745098, 1, 1,
0.3031903, -0.1253008, 1.967376, 0, 0.2666667, 1, 1,
0.3044711, 1.378956, 1.464395, 0, 0.2627451, 1, 1,
0.3059172, 0.4742973, -1.482714, 0, 0.254902, 1, 1,
0.307307, 0.19216, 2.534408, 0, 0.2509804, 1, 1,
0.3079711, 2.036006, -0.7882248, 0, 0.2431373, 1, 1,
0.3088492, -1.095154, 1.44504, 0, 0.2392157, 1, 1,
0.3128197, 0.9483718, 1.906994, 0, 0.2313726, 1, 1,
0.3128491, -0.1152731, 0.8608376, 0, 0.227451, 1, 1,
0.3132736, -0.8208091, 3.634682, 0, 0.2196078, 1, 1,
0.3156136, 0.848637, -0.8450378, 0, 0.2156863, 1, 1,
0.3166505, 0.5992073, 1.234176, 0, 0.2078431, 1, 1,
0.3211288, -0.8802109, 3.594326, 0, 0.2039216, 1, 1,
0.3217051, 0.2302336, -0.5231496, 0, 0.1960784, 1, 1,
0.3271129, -0.8085407, 0.7050152, 0, 0.1882353, 1, 1,
0.3339725, 1.443369, 0.944264, 0, 0.1843137, 1, 1,
0.3372185, -0.6414634, 3.341798, 0, 0.1764706, 1, 1,
0.3381919, 1.059201, 1.14157, 0, 0.172549, 1, 1,
0.3388487, -1.138574, 4.276947, 0, 0.1647059, 1, 1,
0.3418131, 0.03906855, 1.952576, 0, 0.1607843, 1, 1,
0.3473321, -0.09981743, 1.3639, 0, 0.1529412, 1, 1,
0.3479482, 2.369625, 0.2726224, 0, 0.1490196, 1, 1,
0.3489476, -1.354477, 0.9808256, 0, 0.1411765, 1, 1,
0.3491782, -1.673956, 3.55692, 0, 0.1372549, 1, 1,
0.3523248, -1.475072, 4.98906, 0, 0.1294118, 1, 1,
0.352646, 1.946491, 1.154897, 0, 0.1254902, 1, 1,
0.3586628, -1.411383, 4.075949, 0, 0.1176471, 1, 1,
0.3594602, 1.006537, 0.9780898, 0, 0.1137255, 1, 1,
0.3595468, -0.8766797, 1.669873, 0, 0.1058824, 1, 1,
0.3617212, -0.4413276, 5.710453, 0, 0.09803922, 1, 1,
0.363478, -0.3026036, 2.072191, 0, 0.09411765, 1, 1,
0.3662693, 0.2054061, 3.028278, 0, 0.08627451, 1, 1,
0.3665644, -0.9790181, 2.320622, 0, 0.08235294, 1, 1,
0.3667274, -0.3192579, 2.047241, 0, 0.07450981, 1, 1,
0.3705797, -1.922182, 4.721954, 0, 0.07058824, 1, 1,
0.3767413, -1.120248, 2.698313, 0, 0.0627451, 1, 1,
0.3842472, -1.349496, 4.225807, 0, 0.05882353, 1, 1,
0.3874123, -0.4772845, 1.980816, 0, 0.05098039, 1, 1,
0.3887705, -0.09065048, 3.12168, 0, 0.04705882, 1, 1,
0.3921138, -0.2673108, 1.348698, 0, 0.03921569, 1, 1,
0.3926261, -0.009424975, 2.179033, 0, 0.03529412, 1, 1,
0.3948765, 1.013048, 0.1000594, 0, 0.02745098, 1, 1,
0.3986405, -0.9123957, 1.338316, 0, 0.02352941, 1, 1,
0.4006993, -0.5088699, 2.22757, 0, 0.01568628, 1, 1,
0.4036716, 0.08196296, 2.868943, 0, 0.01176471, 1, 1,
0.405815, 1.269068, 0.9483547, 0, 0.003921569, 1, 1,
0.4078322, 0.3048914, 0.3921424, 0.003921569, 0, 1, 1,
0.4325209, -0.2449622, 1.995263, 0.007843138, 0, 1, 1,
0.4331188, -0.7478725, 1.351995, 0.01568628, 0, 1, 1,
0.4339252, 0.1222226, 1.604328, 0.01960784, 0, 1, 1,
0.4355683, 1.027874, -0.0222997, 0.02745098, 0, 1, 1,
0.4407289, -0.8469802, 2.01554, 0.03137255, 0, 1, 1,
0.4421485, 0.2261017, 0.5704572, 0.03921569, 0, 1, 1,
0.4449233, 1.410407, 0.4291847, 0.04313726, 0, 1, 1,
0.4462088, 0.855275, -0.5226683, 0.05098039, 0, 1, 1,
0.44647, -2.563097, 2.37974, 0.05490196, 0, 1, 1,
0.4483338, -0.6361087, 3.146398, 0.0627451, 0, 1, 1,
0.4612524, -1.746146, 3.627234, 0.06666667, 0, 1, 1,
0.4621759, 0.05057544, 1.101523, 0.07450981, 0, 1, 1,
0.4678518, -0.2896274, 2.936957, 0.07843138, 0, 1, 1,
0.4696815, 0.083892, 1.16273, 0.08627451, 0, 1, 1,
0.4703402, -0.9217895, 1.111398, 0.09019608, 0, 1, 1,
0.4706545, -1.390793, 1.796439, 0.09803922, 0, 1, 1,
0.4708286, 0.9824422, 1.050249, 0.1058824, 0, 1, 1,
0.4723698, -0.9612644, 1.282958, 0.1098039, 0, 1, 1,
0.4728273, -0.1780569, 3.641513, 0.1176471, 0, 1, 1,
0.4731944, 0.7523247, 1.503177, 0.1215686, 0, 1, 1,
0.4806516, -1.502663, 1.44043, 0.1294118, 0, 1, 1,
0.4838626, 0.04987099, -0.3666315, 0.1333333, 0, 1, 1,
0.4843769, 0.9073725, 0.565035, 0.1411765, 0, 1, 1,
0.4847323, 2.2783, 0.163885, 0.145098, 0, 1, 1,
0.4893645, -0.1277403, 2.189359, 0.1529412, 0, 1, 1,
0.4904655, -1.555572, 2.925986, 0.1568628, 0, 1, 1,
0.4908294, 0.7138453, -0.9580093, 0.1647059, 0, 1, 1,
0.4951685, -0.2816705, 1.032776, 0.1686275, 0, 1, 1,
0.4967188, -1.582565, 2.348041, 0.1764706, 0, 1, 1,
0.5038822, -0.1744417, 3.008616, 0.1803922, 0, 1, 1,
0.5079359, 0.3837883, 1.113649, 0.1882353, 0, 1, 1,
0.5091383, 0.7726184, 0.3805253, 0.1921569, 0, 1, 1,
0.510183, 1.272025, 0.0780763, 0.2, 0, 1, 1,
0.5104738, -2.311512, 0.3282829, 0.2078431, 0, 1, 1,
0.5131392, 0.8348036, 0.4390623, 0.2117647, 0, 1, 1,
0.5172035, 0.3371411, 1.42423, 0.2196078, 0, 1, 1,
0.5204185, -0.3859219, 1.60061, 0.2235294, 0, 1, 1,
0.5222468, 1.622497, 1.134004, 0.2313726, 0, 1, 1,
0.5224948, 1.593927, -0.1319842, 0.2352941, 0, 1, 1,
0.5227423, -0.7819895, 0.7606809, 0.2431373, 0, 1, 1,
0.5257595, -0.0721567, 1.776878, 0.2470588, 0, 1, 1,
0.526147, -1.620326, 3.522058, 0.254902, 0, 1, 1,
0.5318844, 0.1001724, 0.5093837, 0.2588235, 0, 1, 1,
0.5343685, 0.1545171, 0.3521916, 0.2666667, 0, 1, 1,
0.5363901, -0.335451, 1.129088, 0.2705882, 0, 1, 1,
0.5367039, 0.9132388, -0.08948269, 0.2784314, 0, 1, 1,
0.5370005, -0.2883609, 0.6002058, 0.282353, 0, 1, 1,
0.5412231, -1.113014, 1.682611, 0.2901961, 0, 1, 1,
0.5480034, 1.118777, 1.310134, 0.2941177, 0, 1, 1,
0.5490525, 1.883876, 1.102269, 0.3019608, 0, 1, 1,
0.5557195, 1.066313, -0.5673103, 0.3098039, 0, 1, 1,
0.5557529, 0.5070726, 1.543903, 0.3137255, 0, 1, 1,
0.5567789, -2.386571, 3.323567, 0.3215686, 0, 1, 1,
0.5584866, -0.9011455, 0.7140597, 0.3254902, 0, 1, 1,
0.5639774, 0.5198031, 0.6753083, 0.3333333, 0, 1, 1,
0.5650448, 0.2349268, 1.742166, 0.3372549, 0, 1, 1,
0.5661857, -0.5514724, 3.959039, 0.345098, 0, 1, 1,
0.5674623, -1.668196, 4.322988, 0.3490196, 0, 1, 1,
0.5683833, 0.5960363, -0.1027318, 0.3568628, 0, 1, 1,
0.5709273, 0.8580838, 0.6543058, 0.3607843, 0, 1, 1,
0.5885168, -0.2107306, 1.910185, 0.3686275, 0, 1, 1,
0.5901742, -0.9114755, 0.6629426, 0.372549, 0, 1, 1,
0.5976217, -2.216467, 2.416589, 0.3803922, 0, 1, 1,
0.5999234, 0.6407743, 0.3724167, 0.3843137, 0, 1, 1,
0.6010547, 0.2142938, 0.4390167, 0.3921569, 0, 1, 1,
0.6021392, -1.642971, 3.362045, 0.3960784, 0, 1, 1,
0.6036419, 0.6348413, -0.1948636, 0.4039216, 0, 1, 1,
0.6054417, -1.115021, 2.576179, 0.4117647, 0, 1, 1,
0.6077714, 0.02723237, 3.059976, 0.4156863, 0, 1, 1,
0.6081455, -0.141832, 4.588806, 0.4235294, 0, 1, 1,
0.6196032, 1.736777, -0.897652, 0.427451, 0, 1, 1,
0.6201869, -0.4262723, 1.594282, 0.4352941, 0, 1, 1,
0.6219124, 0.355148, 0.6428667, 0.4392157, 0, 1, 1,
0.6221644, -0.8729419, 3.542105, 0.4470588, 0, 1, 1,
0.6316004, -1.875422, 3.505364, 0.4509804, 0, 1, 1,
0.6396957, 0.07839672, 0.2915493, 0.4588235, 0, 1, 1,
0.641172, 0.831483, 1.151774, 0.4627451, 0, 1, 1,
0.6416159, -0.6874973, 1.555561, 0.4705882, 0, 1, 1,
0.6441297, 0.274194, 0.7589186, 0.4745098, 0, 1, 1,
0.6459134, -1.457819, 4.148389, 0.4823529, 0, 1, 1,
0.6489087, -1.953857, 3.221635, 0.4862745, 0, 1, 1,
0.6509587, 0.5956275, 2.118124, 0.4941176, 0, 1, 1,
0.6527126, 1.092903, -0.01569684, 0.5019608, 0, 1, 1,
0.6548951, -0.1101116, 0.2025114, 0.5058824, 0, 1, 1,
0.6573198, -0.1388263, 1.243824, 0.5137255, 0, 1, 1,
0.6616639, -0.6173435, 2.564248, 0.5176471, 0, 1, 1,
0.6632727, 0.3318705, 1.624972, 0.5254902, 0, 1, 1,
0.6639479, 0.3736186, 1.928944, 0.5294118, 0, 1, 1,
0.6728778, -1.474228, 1.738592, 0.5372549, 0, 1, 1,
0.6739458, -1.605912, 3.56855, 0.5411765, 0, 1, 1,
0.6745043, 0.3121858, -0.2587582, 0.5490196, 0, 1, 1,
0.6767857, -0.7379014, 1.589939, 0.5529412, 0, 1, 1,
0.6772633, -0.1826283, 0.2294987, 0.5607843, 0, 1, 1,
0.6858194, 0.3376038, 1.318614, 0.5647059, 0, 1, 1,
0.6873899, -0.05821668, 1.018284, 0.572549, 0, 1, 1,
0.6888809, 0.9091188, -1.115347, 0.5764706, 0, 1, 1,
0.6909765, 1.073852, -0.4069777, 0.5843138, 0, 1, 1,
0.6933631, -0.1904255, 0.9178276, 0.5882353, 0, 1, 1,
0.6968355, 0.3182254, 0.5836037, 0.5960785, 0, 1, 1,
0.699342, 0.5598662, -0.9175532, 0.6039216, 0, 1, 1,
0.7062954, -1.402286, 1.419711, 0.6078432, 0, 1, 1,
0.7080762, -0.02161496, 3.874093, 0.6156863, 0, 1, 1,
0.7108184, -0.3708541, 2.009827, 0.6196079, 0, 1, 1,
0.7138274, 0.8224433, 1.280838, 0.627451, 0, 1, 1,
0.7192414, -0.1029778, 3.799725, 0.6313726, 0, 1, 1,
0.7225647, 0.2935913, 0.9923438, 0.6392157, 0, 1, 1,
0.7235187, -0.5730855, 1.48027, 0.6431373, 0, 1, 1,
0.7247115, 0.3809384, 1.949089, 0.6509804, 0, 1, 1,
0.726084, 0.4151944, 1.002958, 0.654902, 0, 1, 1,
0.7267254, 1.289611, 1.292686, 0.6627451, 0, 1, 1,
0.7335811, -0.9929494, 2.419209, 0.6666667, 0, 1, 1,
0.7360126, 0.4564889, -0.2857391, 0.6745098, 0, 1, 1,
0.7363053, 0.5790356, 0.7238846, 0.6784314, 0, 1, 1,
0.7390001, 0.4778712, 0.4163395, 0.6862745, 0, 1, 1,
0.7395204, -0.7095309, 2.043194, 0.6901961, 0, 1, 1,
0.7532024, -0.5933974, 2.45317, 0.6980392, 0, 1, 1,
0.7537352, 0.228646, 3.522051, 0.7058824, 0, 1, 1,
0.7558187, -0.7835464, 2.251083, 0.7098039, 0, 1, 1,
0.7595729, -0.414102, 3.457404, 0.7176471, 0, 1, 1,
0.7602887, -0.1515324, 2.599623, 0.7215686, 0, 1, 1,
0.7604817, 1.601007, 1.684576, 0.7294118, 0, 1, 1,
0.7627776, -0.1434853, 0.856846, 0.7333333, 0, 1, 1,
0.7651829, 0.5956043, 2.356817, 0.7411765, 0, 1, 1,
0.766103, 0.7828405, 0.8155779, 0.7450981, 0, 1, 1,
0.7676601, 0.2951379, -0.7833669, 0.7529412, 0, 1, 1,
0.7691032, -0.4778999, 2.01002, 0.7568628, 0, 1, 1,
0.7707224, 2.120009, -0.7246155, 0.7647059, 0, 1, 1,
0.7713288, -0.8699649, 3.086716, 0.7686275, 0, 1, 1,
0.7728233, 1.016068, -1.995976, 0.7764706, 0, 1, 1,
0.7855634, -1.311721, 2.398679, 0.7803922, 0, 1, 1,
0.7858543, -0.547693, 2.718312, 0.7882353, 0, 1, 1,
0.7861425, -0.5603955, 2.043909, 0.7921569, 0, 1, 1,
0.7879446, 0.5092245, 0.4456536, 0.8, 0, 1, 1,
0.7983519, -0.8133692, 1.919018, 0.8078431, 0, 1, 1,
0.8041363, -0.09400811, 1.431933, 0.8117647, 0, 1, 1,
0.8046032, 0.5038301, 1.215038, 0.8196079, 0, 1, 1,
0.817526, -0.7197789, 1.696629, 0.8235294, 0, 1, 1,
0.8180171, -0.5779706, 1.945753, 0.8313726, 0, 1, 1,
0.8234352, -1.180939, 2.677682, 0.8352941, 0, 1, 1,
0.8237787, -0.7990936, 3.264356, 0.8431373, 0, 1, 1,
0.8333203, 1.182506, 1.095208, 0.8470588, 0, 1, 1,
0.849043, -0.1645891, 2.45613, 0.854902, 0, 1, 1,
0.854832, 1.45471, -1.085809, 0.8588235, 0, 1, 1,
0.8574041, 1.055603, 1.337847, 0.8666667, 0, 1, 1,
0.8583255, 0.4198522, 1.554636, 0.8705882, 0, 1, 1,
0.8593767, -0.7546064, -0.0138449, 0.8784314, 0, 1, 1,
0.8622401, -0.006623511, 2.518337, 0.8823529, 0, 1, 1,
0.8630181, -1.04599, 2.022449, 0.8901961, 0, 1, 1,
0.8783215, 0.6253932, -0.146999, 0.8941177, 0, 1, 1,
0.881151, -0.9057831, 3.33503, 0.9019608, 0, 1, 1,
0.8821044, -2.11498, 3.23608, 0.9098039, 0, 1, 1,
0.8845347, -0.6130741, 2.873854, 0.9137255, 0, 1, 1,
0.8848522, -1.283442, 3.934904, 0.9215686, 0, 1, 1,
0.8916985, 0.1470181, 0.7194732, 0.9254902, 0, 1, 1,
0.8971936, -0.1569292, 1.144422, 0.9333333, 0, 1, 1,
0.8985699, -0.9790833, 1.712017, 0.9372549, 0, 1, 1,
0.9029124, 1.013906, 1.072828, 0.945098, 0, 1, 1,
0.9041033, -0.6812737, 2.167332, 0.9490196, 0, 1, 1,
0.920666, -1.054127, 2.179431, 0.9568627, 0, 1, 1,
0.9207807, -0.4524066, 2.001111, 0.9607843, 0, 1, 1,
0.921032, 1.106577, 1.590217, 0.9686275, 0, 1, 1,
0.921565, 0.6600263, 0.6688725, 0.972549, 0, 1, 1,
0.9235263, -1.338872, 3.534253, 0.9803922, 0, 1, 1,
0.9250982, 1.392031, 0.2674789, 0.9843137, 0, 1, 1,
0.925678, 2.210162, 0.1545586, 0.9921569, 0, 1, 1,
0.9260111, -1.135452, 2.22202, 0.9960784, 0, 1, 1,
0.9316252, 0.3789715, 1.237628, 1, 0, 0.9960784, 1,
0.9360954, -1.214733, 2.636896, 1, 0, 0.9882353, 1,
0.9408082, -0.8963757, 3.005967, 1, 0, 0.9843137, 1,
0.9412434, -0.9430513, 2.113784, 1, 0, 0.9764706, 1,
0.9469073, 0.1236076, -0.6360046, 1, 0, 0.972549, 1,
0.9523052, -2.475928, 2.095549, 1, 0, 0.9647059, 1,
0.9579245, 0.5146962, 0.7765033, 1, 0, 0.9607843, 1,
0.9594107, -0.008816901, 0.5732515, 1, 0, 0.9529412, 1,
0.9616877, 0.8198168, 0.5348165, 1, 0, 0.9490196, 1,
0.9631914, -0.2861165, 1.059157, 1, 0, 0.9411765, 1,
0.9706813, -0.5008821, 1.553731, 1, 0, 0.9372549, 1,
0.9806539, 0.8442185, 0.9646564, 1, 0, 0.9294118, 1,
0.9818244, 0.650762, 0.9780899, 1, 0, 0.9254902, 1,
0.9877661, -0.3413507, 1.880464, 1, 0, 0.9176471, 1,
0.9931888, 0.4657575, 0.3196293, 1, 0, 0.9137255, 1,
0.9945377, -1.352487, 3.00459, 1, 0, 0.9058824, 1,
0.9971246, 1.728251, 1.359824, 1, 0, 0.9019608, 1,
1.003363, 1.499468, -0.6653028, 1, 0, 0.8941177, 1,
1.019515, -0.2212608, 1.49947, 1, 0, 0.8862745, 1,
1.025668, 0.5000061, 1.822891, 1, 0, 0.8823529, 1,
1.029482, -0.8361589, 4.044935, 1, 0, 0.8745098, 1,
1.030194, 0.4422267, 1.3377, 1, 0, 0.8705882, 1,
1.033422, -0.7385025, 1.563217, 1, 0, 0.8627451, 1,
1.041696, -0.4387144, 1.178379, 1, 0, 0.8588235, 1,
1.045169, -0.02714552, 0.63854, 1, 0, 0.8509804, 1,
1.059449, -0.5451893, 1.620368, 1, 0, 0.8470588, 1,
1.069942, 0.1130567, 1.892483, 1, 0, 0.8392157, 1,
1.078296, -0.3772547, 1.708337, 1, 0, 0.8352941, 1,
1.080413, 2.101753, 0.4107518, 1, 0, 0.827451, 1,
1.087869, -1.502054, 4.069599, 1, 0, 0.8235294, 1,
1.093633, -0.1241042, 2.519432, 1, 0, 0.8156863, 1,
1.094445, 2.282314, -0.3799155, 1, 0, 0.8117647, 1,
1.095853, 0.7867258, 0.7615117, 1, 0, 0.8039216, 1,
1.097342, 0.3332039, 2.36522, 1, 0, 0.7960784, 1,
1.103971, 0.6634977, 2.264743, 1, 0, 0.7921569, 1,
1.120839, -0.5510817, 3.817116, 1, 0, 0.7843137, 1,
1.124416, 0.364505, 1.109309, 1, 0, 0.7803922, 1,
1.131425, -0.7517702, 2.544646, 1, 0, 0.772549, 1,
1.143753, 2.142678, -0.4500796, 1, 0, 0.7686275, 1,
1.149537, -0.4165506, 2.279449, 1, 0, 0.7607843, 1,
1.153125, 0.08431828, 1.968607, 1, 0, 0.7568628, 1,
1.153601, -1.586886, 0.5716482, 1, 0, 0.7490196, 1,
1.154012, -0.2667338, 3.342278, 1, 0, 0.7450981, 1,
1.155761, 0.004789555, 1.450467, 1, 0, 0.7372549, 1,
1.165698, -0.7284157, 3.217086, 1, 0, 0.7333333, 1,
1.176331, 0.2347036, 0.5571544, 1, 0, 0.7254902, 1,
1.178018, 0.4548401, 2.107572, 1, 0, 0.7215686, 1,
1.178715, 0.1696568, 1.599689, 1, 0, 0.7137255, 1,
1.182955, -0.2578647, 1.243021, 1, 0, 0.7098039, 1,
1.194728, 1.00615, 1.406547, 1, 0, 0.7019608, 1,
1.195061, 0.1112064, 3.459041, 1, 0, 0.6941177, 1,
1.199694, 0.9120677, 2.169117, 1, 0, 0.6901961, 1,
1.204512, -0.8060645, 2.476857, 1, 0, 0.682353, 1,
1.205499, -0.5148292, 2.149913, 1, 0, 0.6784314, 1,
1.205781, -0.2350953, 1.422133, 1, 0, 0.6705883, 1,
1.211062, 0.1299592, 2.997651, 1, 0, 0.6666667, 1,
1.217229, -0.771171, 3.359994, 1, 0, 0.6588235, 1,
1.218171, 1.590192, 0.8220059, 1, 0, 0.654902, 1,
1.221266, 0.321743, 3.037834, 1, 0, 0.6470588, 1,
1.226511, 0.5127023, 2.249634, 1, 0, 0.6431373, 1,
1.228653, -1.015425, 2.866027, 1, 0, 0.6352941, 1,
1.235291, 2.213706, 0.2520264, 1, 0, 0.6313726, 1,
1.236759, -0.7383851, 2.604583, 1, 0, 0.6235294, 1,
1.242859, 1.467867, -0.453638, 1, 0, 0.6196079, 1,
1.247316, 1.247838, -0.4168633, 1, 0, 0.6117647, 1,
1.252652, -1.323645, 1.251469, 1, 0, 0.6078432, 1,
1.276912, 0.175886, 0.8227497, 1, 0, 0.6, 1,
1.277789, -2.040251, 0.5398303, 1, 0, 0.5921569, 1,
1.279275, 0.8722287, 1.392683, 1, 0, 0.5882353, 1,
1.289202, 1.17066, -0.6680868, 1, 0, 0.5803922, 1,
1.306183, 0.2435652, 1.842724, 1, 0, 0.5764706, 1,
1.306375, -2.535347, 3.01622, 1, 0, 0.5686275, 1,
1.307821, -0.6301796, 2.812579, 1, 0, 0.5647059, 1,
1.310984, 0.1021256, 1.661473, 1, 0, 0.5568628, 1,
1.315187, 1.858621, 0.2236667, 1, 0, 0.5529412, 1,
1.320576, -0.0009116454, 0.8764209, 1, 0, 0.5450981, 1,
1.332306, -0.8953728, 2.535585, 1, 0, 0.5411765, 1,
1.338319, 0.7313953, 1.176406, 1, 0, 0.5333334, 1,
1.345579, 0.391851, 0.8436757, 1, 0, 0.5294118, 1,
1.350897, -0.004984727, 1.241042, 1, 0, 0.5215687, 1,
1.357355, 2.008485, 1.170537, 1, 0, 0.5176471, 1,
1.383877, 0.2452713, -0.1405696, 1, 0, 0.509804, 1,
1.401893, 0.8548201, 2.177168, 1, 0, 0.5058824, 1,
1.422933, 0.9014295, 1.582601, 1, 0, 0.4980392, 1,
1.42491, 1.178994, 0.8058672, 1, 0, 0.4901961, 1,
1.435203, -0.6369398, 1.151411, 1, 0, 0.4862745, 1,
1.435786, 1.824616, 1.300218, 1, 0, 0.4784314, 1,
1.43752, 0.2325138, 1.076712, 1, 0, 0.4745098, 1,
1.452424, -1.86393, 2.680483, 1, 0, 0.4666667, 1,
1.459287, 0.2382678, 1.784269, 1, 0, 0.4627451, 1,
1.459327, -1.291811, 1.776094, 1, 0, 0.454902, 1,
1.463245, -2.222076, 2.712334, 1, 0, 0.4509804, 1,
1.465204, 0.2670964, 1.785489, 1, 0, 0.4431373, 1,
1.476849, 1.279271, 2.748048, 1, 0, 0.4392157, 1,
1.484718, -1.303137, 2.522342, 1, 0, 0.4313726, 1,
1.499127, 0.9050548, 1.342766, 1, 0, 0.427451, 1,
1.500732, 1.300679, -0.179864, 1, 0, 0.4196078, 1,
1.525143, 0.573128, 0.2149272, 1, 0, 0.4156863, 1,
1.527907, 0.5933506, 0.7659501, 1, 0, 0.4078431, 1,
1.555042, -0.8558157, 1.586107, 1, 0, 0.4039216, 1,
1.561609, 0.4606084, 2.26673, 1, 0, 0.3960784, 1,
1.567663, 0.6412096, 3.001647, 1, 0, 0.3882353, 1,
1.581633, 0.3017436, 0.8456596, 1, 0, 0.3843137, 1,
1.588016, -0.5252972, 2.688261, 1, 0, 0.3764706, 1,
1.593835, -0.3292521, 2.279901, 1, 0, 0.372549, 1,
1.596592, 1.957838, 1.41671, 1, 0, 0.3647059, 1,
1.604327, 0.8638716, 2.00862, 1, 0, 0.3607843, 1,
1.611476, 1.041496, 0.7696216, 1, 0, 0.3529412, 1,
1.625125, -0.9572755, 1.764774, 1, 0, 0.3490196, 1,
1.631608, -1.627487, 2.372676, 1, 0, 0.3411765, 1,
1.636597, 0.6067785, 1.745646, 1, 0, 0.3372549, 1,
1.638254, 0.2662143, 1.043205, 1, 0, 0.3294118, 1,
1.653817, 0.492109, 1.153521, 1, 0, 0.3254902, 1,
1.667865, -1.659512, 2.453929, 1, 0, 0.3176471, 1,
1.699826, 0.5579537, 1.755246, 1, 0, 0.3137255, 1,
1.708504, -0.8799288, 1.388235, 1, 0, 0.3058824, 1,
1.720119, -0.3777386, 1.476176, 1, 0, 0.2980392, 1,
1.725879, -0.4421402, 0.5990959, 1, 0, 0.2941177, 1,
1.747041, -1.221573, 3.571948, 1, 0, 0.2862745, 1,
1.759748, 0.9085803, 2.749853, 1, 0, 0.282353, 1,
1.774022, -0.4378158, 0.6880087, 1, 0, 0.2745098, 1,
1.786182, 0.249105, 2.898151, 1, 0, 0.2705882, 1,
1.792006, 0.5259942, 1.966696, 1, 0, 0.2627451, 1,
1.812109, 0.1333832, 0.6373136, 1, 0, 0.2588235, 1,
1.815383, 1.171393, -1.428827, 1, 0, 0.2509804, 1,
1.818423, -0.01127044, 0.6110674, 1, 0, 0.2470588, 1,
1.822568, 0.5301093, 1.793932, 1, 0, 0.2392157, 1,
1.838595, 1.731126, 1.73655, 1, 0, 0.2352941, 1,
1.846355, -1.193967, 1.449873, 1, 0, 0.227451, 1,
1.862396, 0.3684539, 1.399944, 1, 0, 0.2235294, 1,
1.873703, -0.7155957, 0.05838386, 1, 0, 0.2156863, 1,
1.907261, 0.5545353, 2.330127, 1, 0, 0.2117647, 1,
1.914803, 1.381728, 3.571641, 1, 0, 0.2039216, 1,
1.943102, 1.412128, 0.79212, 1, 0, 0.1960784, 1,
1.955523, -0.8467795, 1.069231, 1, 0, 0.1921569, 1,
1.957452, -0.9544878, 1.102391, 1, 0, 0.1843137, 1,
1.963116, 0.3063942, 0.6826887, 1, 0, 0.1803922, 1,
1.979478, -0.07452992, 1.967797, 1, 0, 0.172549, 1,
2.030484, -0.6372989, 1.625984, 1, 0, 0.1686275, 1,
2.034138, -0.2603432, 2.143577, 1, 0, 0.1607843, 1,
2.077239, -0.5168983, 1.532851, 1, 0, 0.1568628, 1,
2.086263, 0.7406194, 0.8970721, 1, 0, 0.1490196, 1,
2.094716, -0.7593123, 0.7122311, 1, 0, 0.145098, 1,
2.114947, 1.021422, 1.123723, 1, 0, 0.1372549, 1,
2.115831, 2.225296, -0.02697977, 1, 0, 0.1333333, 1,
2.142935, 0.1681403, 1.490168, 1, 0, 0.1254902, 1,
2.158447, 0.01668049, 0.4655872, 1, 0, 0.1215686, 1,
2.165961, 0.8637972, 1.061906, 1, 0, 0.1137255, 1,
2.231043, 0.2932205, 2.045984, 1, 0, 0.1098039, 1,
2.301881, 0.1075341, 2.14126, 1, 0, 0.1019608, 1,
2.329443, 1.351662, 1.490171, 1, 0, 0.09411765, 1,
2.337893, 1.76785, -0.4835058, 1, 0, 0.09019608, 1,
2.351562, -0.7875679, 2.007185, 1, 0, 0.08235294, 1,
2.351636, -0.3986377, 1.885905, 1, 0, 0.07843138, 1,
2.359786, -0.7375335, 3.120461, 1, 0, 0.07058824, 1,
2.364411, -1.969495, 1.729039, 1, 0, 0.06666667, 1,
2.369662, 0.7146055, 1.683309, 1, 0, 0.05882353, 1,
2.382126, 0.7564178, 2.182575, 1, 0, 0.05490196, 1,
2.428817, 0.2001395, 0.714926, 1, 0, 0.04705882, 1,
2.438886, -1.427377, 0.8371092, 1, 0, 0.04313726, 1,
2.641296, -1.066057, 2.976775, 1, 0, 0.03529412, 1,
2.769705, -0.7631, 2.225413, 1, 0, 0.03137255, 1,
2.816363, 0.2764999, 1.871029, 1, 0, 0.02352941, 1,
2.960767, -0.5451725, 1.470082, 1, 0, 0.01960784, 1,
2.964355, -0.3171384, -0.3174017, 1, 0, 0.01176471, 1,
3.090809, -0.5491447, -0.2972121, 1, 0, 0.007843138, 1
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
-0.04528308, -4.06912, -7.968262, 0, -0.5, 0.5, 0.5,
-0.04528308, -4.06912, -7.968262, 1, -0.5, 0.5, 0.5,
-0.04528308, -4.06912, -7.968262, 1, 1.5, 0.5, 0.5,
-0.04528308, -4.06912, -7.968262, 0, 1.5, 0.5, 0.5
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
-4.244511, 0.06667602, -7.968262, 0, -0.5, 0.5, 0.5,
-4.244511, 0.06667602, -7.968262, 1, -0.5, 0.5, 0.5,
-4.244511, 0.06667602, -7.968262, 1, 1.5, 0.5, 0.5,
-4.244511, 0.06667602, -7.968262, 0, 1.5, 0.5, 0.5
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
-4.244511, -4.06912, -0.137651, 0, -0.5, 0.5, 0.5,
-4.244511, -4.06912, -0.137651, 1, -0.5, 0.5, 0.5,
-4.244511, -4.06912, -0.137651, 1, 1.5, 0.5, 0.5,
-4.244511, -4.06912, -0.137651, 0, 1.5, 0.5, 0.5
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
-3, -3.114706, -6.161198,
3, -3.114706, -6.161198,
-3, -3.114706, -6.161198,
-3, -3.273775, -6.462375,
-2, -3.114706, -6.161198,
-2, -3.273775, -6.462375,
-1, -3.114706, -6.161198,
-1, -3.273775, -6.462375,
0, -3.114706, -6.161198,
0, -3.273775, -6.462375,
1, -3.114706, -6.161198,
1, -3.273775, -6.462375,
2, -3.114706, -6.161198,
2, -3.273775, -6.462375,
3, -3.114706, -6.161198,
3, -3.273775, -6.462375
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
-3, -3.591913, -7.06473, 0, -0.5, 0.5, 0.5,
-3, -3.591913, -7.06473, 1, -0.5, 0.5, 0.5,
-3, -3.591913, -7.06473, 1, 1.5, 0.5, 0.5,
-3, -3.591913, -7.06473, 0, 1.5, 0.5, 0.5,
-2, -3.591913, -7.06473, 0, -0.5, 0.5, 0.5,
-2, -3.591913, -7.06473, 1, -0.5, 0.5, 0.5,
-2, -3.591913, -7.06473, 1, 1.5, 0.5, 0.5,
-2, -3.591913, -7.06473, 0, 1.5, 0.5, 0.5,
-1, -3.591913, -7.06473, 0, -0.5, 0.5, 0.5,
-1, -3.591913, -7.06473, 1, -0.5, 0.5, 0.5,
-1, -3.591913, -7.06473, 1, 1.5, 0.5, 0.5,
-1, -3.591913, -7.06473, 0, 1.5, 0.5, 0.5,
0, -3.591913, -7.06473, 0, -0.5, 0.5, 0.5,
0, -3.591913, -7.06473, 1, -0.5, 0.5, 0.5,
0, -3.591913, -7.06473, 1, 1.5, 0.5, 0.5,
0, -3.591913, -7.06473, 0, 1.5, 0.5, 0.5,
1, -3.591913, -7.06473, 0, -0.5, 0.5, 0.5,
1, -3.591913, -7.06473, 1, -0.5, 0.5, 0.5,
1, -3.591913, -7.06473, 1, 1.5, 0.5, 0.5,
1, -3.591913, -7.06473, 0, 1.5, 0.5, 0.5,
2, -3.591913, -7.06473, 0, -0.5, 0.5, 0.5,
2, -3.591913, -7.06473, 1, -0.5, 0.5, 0.5,
2, -3.591913, -7.06473, 1, 1.5, 0.5, 0.5,
2, -3.591913, -7.06473, 0, 1.5, 0.5, 0.5,
3, -3.591913, -7.06473, 0, -0.5, 0.5, 0.5,
3, -3.591913, -7.06473, 1, -0.5, 0.5, 0.5,
3, -3.591913, -7.06473, 1, 1.5, 0.5, 0.5,
3, -3.591913, -7.06473, 0, 1.5, 0.5, 0.5
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
-3.275458, -3, -6.161198,
-3.275458, 3, -6.161198,
-3.275458, -3, -6.161198,
-3.436967, -3, -6.462375,
-3.275458, -2, -6.161198,
-3.436967, -2, -6.462375,
-3.275458, -1, -6.161198,
-3.436967, -1, -6.462375,
-3.275458, 0, -6.161198,
-3.436967, 0, -6.462375,
-3.275458, 1, -6.161198,
-3.436967, 1, -6.462375,
-3.275458, 2, -6.161198,
-3.436967, 2, -6.462375,
-3.275458, 3, -6.161198,
-3.436967, 3, -6.462375
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
-3.759984, -3, -7.06473, 0, -0.5, 0.5, 0.5,
-3.759984, -3, -7.06473, 1, -0.5, 0.5, 0.5,
-3.759984, -3, -7.06473, 1, 1.5, 0.5, 0.5,
-3.759984, -3, -7.06473, 0, 1.5, 0.5, 0.5,
-3.759984, -2, -7.06473, 0, -0.5, 0.5, 0.5,
-3.759984, -2, -7.06473, 1, -0.5, 0.5, 0.5,
-3.759984, -2, -7.06473, 1, 1.5, 0.5, 0.5,
-3.759984, -2, -7.06473, 0, 1.5, 0.5, 0.5,
-3.759984, -1, -7.06473, 0, -0.5, 0.5, 0.5,
-3.759984, -1, -7.06473, 1, -0.5, 0.5, 0.5,
-3.759984, -1, -7.06473, 1, 1.5, 0.5, 0.5,
-3.759984, -1, -7.06473, 0, 1.5, 0.5, 0.5,
-3.759984, 0, -7.06473, 0, -0.5, 0.5, 0.5,
-3.759984, 0, -7.06473, 1, -0.5, 0.5, 0.5,
-3.759984, 0, -7.06473, 1, 1.5, 0.5, 0.5,
-3.759984, 0, -7.06473, 0, 1.5, 0.5, 0.5,
-3.759984, 1, -7.06473, 0, -0.5, 0.5, 0.5,
-3.759984, 1, -7.06473, 1, -0.5, 0.5, 0.5,
-3.759984, 1, -7.06473, 1, 1.5, 0.5, 0.5,
-3.759984, 1, -7.06473, 0, 1.5, 0.5, 0.5,
-3.759984, 2, -7.06473, 0, -0.5, 0.5, 0.5,
-3.759984, 2, -7.06473, 1, -0.5, 0.5, 0.5,
-3.759984, 2, -7.06473, 1, 1.5, 0.5, 0.5,
-3.759984, 2, -7.06473, 0, 1.5, 0.5, 0.5,
-3.759984, 3, -7.06473, 0, -0.5, 0.5, 0.5,
-3.759984, 3, -7.06473, 1, -0.5, 0.5, 0.5,
-3.759984, 3, -7.06473, 1, 1.5, 0.5, 0.5,
-3.759984, 3, -7.06473, 0, 1.5, 0.5, 0.5
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
-3.275458, -3.114706, -4,
-3.275458, -3.114706, 4,
-3.275458, -3.114706, -4,
-3.436967, -3.273775, -4,
-3.275458, -3.114706, -2,
-3.436967, -3.273775, -2,
-3.275458, -3.114706, 0,
-3.436967, -3.273775, 0,
-3.275458, -3.114706, 2,
-3.436967, -3.273775, 2,
-3.275458, -3.114706, 4,
-3.436967, -3.273775, 4
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
-3.759984, -3.591913, -4, 0, -0.5, 0.5, 0.5,
-3.759984, -3.591913, -4, 1, -0.5, 0.5, 0.5,
-3.759984, -3.591913, -4, 1, 1.5, 0.5, 0.5,
-3.759984, -3.591913, -4, 0, 1.5, 0.5, 0.5,
-3.759984, -3.591913, -2, 0, -0.5, 0.5, 0.5,
-3.759984, -3.591913, -2, 1, -0.5, 0.5, 0.5,
-3.759984, -3.591913, -2, 1, 1.5, 0.5, 0.5,
-3.759984, -3.591913, -2, 0, 1.5, 0.5, 0.5,
-3.759984, -3.591913, 0, 0, -0.5, 0.5, 0.5,
-3.759984, -3.591913, 0, 1, -0.5, 0.5, 0.5,
-3.759984, -3.591913, 0, 1, 1.5, 0.5, 0.5,
-3.759984, -3.591913, 0, 0, 1.5, 0.5, 0.5,
-3.759984, -3.591913, 2, 0, -0.5, 0.5, 0.5,
-3.759984, -3.591913, 2, 1, -0.5, 0.5, 0.5,
-3.759984, -3.591913, 2, 1, 1.5, 0.5, 0.5,
-3.759984, -3.591913, 2, 0, 1.5, 0.5, 0.5,
-3.759984, -3.591913, 4, 0, -0.5, 0.5, 0.5,
-3.759984, -3.591913, 4, 1, -0.5, 0.5, 0.5,
-3.759984, -3.591913, 4, 1, 1.5, 0.5, 0.5,
-3.759984, -3.591913, 4, 0, 1.5, 0.5, 0.5
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
-3.275458, -3.114706, -6.161198,
-3.275458, 3.248058, -6.161198,
-3.275458, -3.114706, 5.885896,
-3.275458, 3.248058, 5.885896,
-3.275458, -3.114706, -6.161198,
-3.275458, -3.114706, 5.885896,
-3.275458, 3.248058, -6.161198,
-3.275458, 3.248058, 5.885896,
-3.275458, -3.114706, -6.161198,
3.184892, -3.114706, -6.161198,
-3.275458, -3.114706, 5.885896,
3.184892, -3.114706, 5.885896,
-3.275458, 3.248058, -6.161198,
3.184892, 3.248058, -6.161198,
-3.275458, 3.248058, 5.885896,
3.184892, 3.248058, 5.885896,
3.184892, -3.114706, -6.161198,
3.184892, 3.248058, -6.161198,
3.184892, -3.114706, 5.885896,
3.184892, 3.248058, 5.885896,
3.184892, -3.114706, -6.161198,
3.184892, -3.114706, 5.885896,
3.184892, 3.248058, -6.161198,
3.184892, 3.248058, 5.885896
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
var radius = 8.051487;
var distance = 35.82198;
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
mvMatrix.translate( 0.04528308, -0.06667602, 0.137651 );
mvMatrix.scale( 1.347516, 1.368183, 0.7226163 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.82198);
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
phosphorothioate<-read.table("phosphorothioate.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-phosphorothioate$V2
```

```
## Error in eval(expr, envir, enclos): object 'phosphorothioate' not found
```

```r
y<-phosphorothioate$V3
```

```
## Error in eval(expr, envir, enclos): object 'phosphorothioate' not found
```

```r
z<-phosphorothioate$V4
```

```
## Error in eval(expr, envir, enclos): object 'phosphorothioate' not found
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
-3.181375, -0.5173402, -1.182798, 0, 0, 1, 1, 1,
-2.72513, 1.450615, -0.8207241, 1, 0, 0, 1, 1,
-2.67371, -0.6548713, -2.308802, 1, 0, 0, 1, 1,
-2.631328, -0.4586368, -1.340946, 1, 0, 0, 1, 1,
-2.613622, 1.843063, -1.448967, 1, 0, 0, 1, 1,
-2.58674, 0.9427769, 0.1656225, 1, 0, 0, 1, 1,
-2.581764, 0.915243, -1.15146, 0, 0, 0, 1, 1,
-2.577469, 1.117438, -1.02125, 0, 0, 0, 1, 1,
-2.558922, -0.4953064, -0.2969394, 0, 0, 0, 1, 1,
-2.514939, -0.8785253, -0.135947, 0, 0, 0, 1, 1,
-2.511104, 2.215857, 0.02428445, 0, 0, 0, 1, 1,
-2.424699, 0.9936424, -0.5200606, 0, 0, 0, 1, 1,
-2.396123, 0.4409662, -2.393721, 0, 0, 0, 1, 1,
-2.395402, 0.1495406, -2.395281, 1, 1, 1, 1, 1,
-2.316825, 2.037808, -2.092077, 1, 1, 1, 1, 1,
-2.312109, 0.8876616, -1.409214, 1, 1, 1, 1, 1,
-2.280534, 0.9126351, 0.316316, 1, 1, 1, 1, 1,
-2.240577, 2.627799, -0.9104338, 1, 1, 1, 1, 1,
-2.230798, -1.235329, -1.346202, 1, 1, 1, 1, 1,
-2.228574, 0.7407666, -1.319553, 1, 1, 1, 1, 1,
-2.214616, 1.19183, -1.635967, 1, 1, 1, 1, 1,
-2.207198, -0.8637268, -1.443225, 1, 1, 1, 1, 1,
-2.20205, 0.05836728, -1.248788, 1, 1, 1, 1, 1,
-2.113663, -0.9968001, -2.440644, 1, 1, 1, 1, 1,
-2.072683, -0.792651, -1.575414, 1, 1, 1, 1, 1,
-2.064215, -1.064771, -1.131336, 1, 1, 1, 1, 1,
-2.056235, -0.008514364, -0.5402125, 1, 1, 1, 1, 1,
-2.033316, 1.069693, -0.9755317, 1, 1, 1, 1, 1,
-1.922014, 1.225388, -0.4616353, 0, 0, 1, 1, 1,
-1.911286, -0.1702476, -2.54416, 1, 0, 0, 1, 1,
-1.868506, 1.019163, -2.963372, 1, 0, 0, 1, 1,
-1.865356, -0.19136, -1.777115, 1, 0, 0, 1, 1,
-1.8567, 1.841052, -1.278338, 1, 0, 0, 1, 1,
-1.856293, 0.3237207, 0.8003165, 1, 0, 0, 1, 1,
-1.856041, 0.1059724, -1.252624, 0, 0, 0, 1, 1,
-1.84822, 1.098433, -1.099591, 0, 0, 0, 1, 1,
-1.842934, 0.3894989, -0.9416266, 0, 0, 0, 1, 1,
-1.832294, 0.7254928, -1.786374, 0, 0, 0, 1, 1,
-1.79607, -0.1926149, -3.568382, 0, 0, 0, 1, 1,
-1.78725, -1.013005, -1.931787, 0, 0, 0, 1, 1,
-1.780119, -1.116332, -2.884976, 0, 0, 0, 1, 1,
-1.760533, -0.2230123, -2.309344, 1, 1, 1, 1, 1,
-1.753779, 0.2775051, 0.07692529, 1, 1, 1, 1, 1,
-1.748555, 1.849168, -2.94213, 1, 1, 1, 1, 1,
-1.737916, -0.5244644, -1.555272, 1, 1, 1, 1, 1,
-1.733537, 1.903352, -0.9389427, 1, 1, 1, 1, 1,
-1.730293, -2.527557, -4.458877, 1, 1, 1, 1, 1,
-1.728956, 0.4207999, -1.023038, 1, 1, 1, 1, 1,
-1.723132, 0.2914094, -3.134732, 1, 1, 1, 1, 1,
-1.71858, -1.111939, -0.391497, 1, 1, 1, 1, 1,
-1.7023, 0.6685456, -0.7044691, 1, 1, 1, 1, 1,
-1.675719, -0.3281818, -1.096859, 1, 1, 1, 1, 1,
-1.674171, 0.3604544, 0.2554356, 1, 1, 1, 1, 1,
-1.667511, 1.517152, -3.44575, 1, 1, 1, 1, 1,
-1.665562, 0.257972, -2.884986, 1, 1, 1, 1, 1,
-1.65688, -0.4200475, -1.364449, 1, 1, 1, 1, 1,
-1.630347, -0.03622106, -1.059357, 0, 0, 1, 1, 1,
-1.610396, -1.392932, -1.203398, 1, 0, 0, 1, 1,
-1.608775, 0.1356655, -1.465922, 1, 0, 0, 1, 1,
-1.591749, 1.206835, -0.8985934, 1, 0, 0, 1, 1,
-1.576536, 0.2943762, -1.619467, 1, 0, 0, 1, 1,
-1.570245, 0.693113, -1.805164, 1, 0, 0, 1, 1,
-1.564793, 0.1386179, -1.443948, 0, 0, 0, 1, 1,
-1.561086, 0.8918053, -1.348228, 0, 0, 0, 1, 1,
-1.550186, 0.2114386, -1.979738, 0, 0, 0, 1, 1,
-1.537889, 0.2936787, -2.376847, 0, 0, 0, 1, 1,
-1.536179, 1.57517, -0.9164761, 0, 0, 0, 1, 1,
-1.532486, 0.825313, -2.342706, 0, 0, 0, 1, 1,
-1.52147, 0.7948456, -0.2518871, 0, 0, 0, 1, 1,
-1.518463, -1.042901, -2.834704, 1, 1, 1, 1, 1,
-1.517319, -0.1459718, -0.4409226, 1, 1, 1, 1, 1,
-1.50754, 1.319162, -3.089024, 1, 1, 1, 1, 1,
-1.499798, 0.908758, -1.381405, 1, 1, 1, 1, 1,
-1.498983, 0.9008344, -0.02981447, 1, 1, 1, 1, 1,
-1.484889, 0.460208, -1.399541, 1, 1, 1, 1, 1,
-1.481283, 0.1688237, -0.2122368, 1, 1, 1, 1, 1,
-1.480628, 0.5610172, -0.2487633, 1, 1, 1, 1, 1,
-1.470797, 0.2663253, -2.621165, 1, 1, 1, 1, 1,
-1.461742, -0.4602975, -2.424554, 1, 1, 1, 1, 1,
-1.458021, 0.2093753, -1.551123, 1, 1, 1, 1, 1,
-1.457418, -0.7262979, -3.252908, 1, 1, 1, 1, 1,
-1.44458, 1.384776, -1.107596, 1, 1, 1, 1, 1,
-1.436376, 0.3420935, -0.3104369, 1, 1, 1, 1, 1,
-1.429889, -1.62481, -3.177483, 1, 1, 1, 1, 1,
-1.426679, -1.212132, -3.313379, 0, 0, 1, 1, 1,
-1.423044, -0.5192944, -1.472896, 1, 0, 0, 1, 1,
-1.407054, -0.5270156, -1.961811, 1, 0, 0, 1, 1,
-1.404176, -2.148798, -3.955097, 1, 0, 0, 1, 1,
-1.394374, -1.06937, -4.835816, 1, 0, 0, 1, 1,
-1.39401, -0.1762034, -4.439929, 1, 0, 0, 1, 1,
-1.386551, 0.7166845, -0.06765856, 0, 0, 0, 1, 1,
-1.37943, 0.4473214, 1.309372, 0, 0, 0, 1, 1,
-1.37912, -0.8521187, -3.173302, 0, 0, 0, 1, 1,
-1.367432, -1.320378, -2.346688, 0, 0, 0, 1, 1,
-1.361109, 0.8934063, -1.450897, 0, 0, 0, 1, 1,
-1.347652, 0.1946929, -1.333118, 0, 0, 0, 1, 1,
-1.330414, -1.326321, -4.626753, 0, 0, 0, 1, 1,
-1.327993, -0.2641919, -0.591027, 1, 1, 1, 1, 1,
-1.3268, -1.104444, -3.860636, 1, 1, 1, 1, 1,
-1.315684, -0.607868, -0.7928994, 1, 1, 1, 1, 1,
-1.311738, 0.9847316, -1.107858, 1, 1, 1, 1, 1,
-1.295683, -0.7584174, -1.546488, 1, 1, 1, 1, 1,
-1.295296, 0.2793575, -0.0646387, 1, 1, 1, 1, 1,
-1.294799, -0.1570235, -1.993394, 1, 1, 1, 1, 1,
-1.28476, -0.02839094, -1.702973, 1, 1, 1, 1, 1,
-1.274817, -0.3546808, 0.1588667, 1, 1, 1, 1, 1,
-1.271203, 0.5569587, -1.447595, 1, 1, 1, 1, 1,
-1.2635, -2.298114, -1.883347, 1, 1, 1, 1, 1,
-1.260114, -0.02593643, -0.4703966, 1, 1, 1, 1, 1,
-1.255315, -0.8447664, -3.66714, 1, 1, 1, 1, 1,
-1.25065, 1.841152, -0.1599117, 1, 1, 1, 1, 1,
-1.24929, 1.54547, -2.204942, 1, 1, 1, 1, 1,
-1.248587, -0.08335928, 0.4647607, 0, 0, 1, 1, 1,
-1.237754, 0.936956, 1.630013, 1, 0, 0, 1, 1,
-1.222593, 0.01098867, -0.1776721, 1, 0, 0, 1, 1,
-1.221846, -0.8592649, -2.533178, 1, 0, 0, 1, 1,
-1.209852, -0.1654512, -0.759711, 1, 0, 0, 1, 1,
-1.203829, 0.6395724, -1.245847, 1, 0, 0, 1, 1,
-1.201591, -0.6019362, -2.644573, 0, 0, 0, 1, 1,
-1.199793, -0.1203484, -0.163152, 0, 0, 0, 1, 1,
-1.197246, 0.433481, -0.8746866, 0, 0, 0, 1, 1,
-1.194943, 1.647612, 1.532761, 0, 0, 0, 1, 1,
-1.189471, -0.3972544, -2.959107, 0, 0, 0, 1, 1,
-1.181613, -1.13679, -1.9829, 0, 0, 0, 1, 1,
-1.175962, -0.5413042, -2.686701, 0, 0, 0, 1, 1,
-1.164446, 0.3276519, 0.2685095, 1, 1, 1, 1, 1,
-1.154092, -1.371673, -1.793255, 1, 1, 1, 1, 1,
-1.151374, 1.986794, -1.304958, 1, 1, 1, 1, 1,
-1.149513, -0.5729514, -3.053292, 1, 1, 1, 1, 1,
-1.144802, -1.185515, -2.427264, 1, 1, 1, 1, 1,
-1.13486, 0.2774054, -0.5350478, 1, 1, 1, 1, 1,
-1.131933, -0.04677032, -1.99241, 1, 1, 1, 1, 1,
-1.122194, -0.2750047, -2.842261, 1, 1, 1, 1, 1,
-1.117287, -0.2004413, -0.01938686, 1, 1, 1, 1, 1,
-1.115953, 0.6185758, -1.758392, 1, 1, 1, 1, 1,
-1.110993, -0.4278106, -2.129073, 1, 1, 1, 1, 1,
-1.10928, 0.8583032, 0.5122936, 1, 1, 1, 1, 1,
-1.108894, 1.587931, -0.1543207, 1, 1, 1, 1, 1,
-1.095285, -2.858869, -3.090318, 1, 1, 1, 1, 1,
-1.091295, -0.924322, -2.064794, 1, 1, 1, 1, 1,
-1.090155, -1.805583, -3.442691, 0, 0, 1, 1, 1,
-1.082035, -0.1206267, -2.295583, 1, 0, 0, 1, 1,
-1.076124, -0.6279262, -2.444621, 1, 0, 0, 1, 1,
-1.075901, -0.5300654, -3.834639, 1, 0, 0, 1, 1,
-1.073127, -0.8371442, -1.129338, 1, 0, 0, 1, 1,
-1.0689, 0.5506589, -2.356074, 1, 0, 0, 1, 1,
-1.065977, -0.6658444, -3.384366, 0, 0, 0, 1, 1,
-1.061152, 0.4848669, 0.7709139, 0, 0, 0, 1, 1,
-1.052301, -0.143182, -0.1839606, 0, 0, 0, 1, 1,
-1.048307, 0.2555622, -2.391724, 0, 0, 0, 1, 1,
-1.047914, 0.6762608, -1.462622, 0, 0, 0, 1, 1,
-1.03845, 0.2090654, -0.3735238, 0, 0, 0, 1, 1,
-1.035297, -0.2764548, -2.218598, 0, 0, 0, 1, 1,
-1.022478, 0.4790618, -1.194041, 1, 1, 1, 1, 1,
-1.01719, 0.7476749, -1.801801, 1, 1, 1, 1, 1,
-1.01409, 0.5374955, -2.47346, 1, 1, 1, 1, 1,
-1.011456, 2.466251, 1.696673, 1, 1, 1, 1, 1,
-1.0112, 0.066316, -3.075138, 1, 1, 1, 1, 1,
-1.004111, -0.9365996, -2.411718, 1, 1, 1, 1, 1,
-0.9908976, -0.7309688, -1.618438, 1, 1, 1, 1, 1,
-0.9843225, 1.435105, -0.266042, 1, 1, 1, 1, 1,
-0.9833068, -0.002080108, -1.322594, 1, 1, 1, 1, 1,
-0.9727212, -1.431401, -2.811903, 1, 1, 1, 1, 1,
-0.9725064, 0.8281167, -1.40824, 1, 1, 1, 1, 1,
-0.9720548, -0.1312766, -1.823263, 1, 1, 1, 1, 1,
-0.9720235, -0.2787202, -2.402963, 1, 1, 1, 1, 1,
-0.9666688, -0.7884536, -2.527617, 1, 1, 1, 1, 1,
-0.9634153, 0.6997541, 1.364647, 1, 1, 1, 1, 1,
-0.9579426, 0.7837008, -1.657368, 0, 0, 1, 1, 1,
-0.9426857, -0.3010488, -1.753526, 1, 0, 0, 1, 1,
-0.9400477, -0.1047392, -1.808556, 1, 0, 0, 1, 1,
-0.935337, 0.7079845, -0.07001561, 1, 0, 0, 1, 1,
-0.9352774, 1.224114, -0.3184649, 1, 0, 0, 1, 1,
-0.932256, -1.351988, -3.237324, 1, 0, 0, 1, 1,
-0.9177473, 0.9247819, -1.670925, 0, 0, 0, 1, 1,
-0.9150395, 0.2527998, -2.810551, 0, 0, 0, 1, 1,
-0.9114153, 1.860334, -1.360765, 0, 0, 0, 1, 1,
-0.9078171, -0.2943833, -1.607351, 0, 0, 0, 1, 1,
-0.906706, -0.2310676, -1.468622, 0, 0, 0, 1, 1,
-0.9044938, -1.195078, -0.9425277, 0, 0, 0, 1, 1,
-0.899139, -0.0952785, -2.471291, 0, 0, 0, 1, 1,
-0.8958238, -1.253692, -4.288728, 1, 1, 1, 1, 1,
-0.8929249, -0.2249323, -1.975686, 1, 1, 1, 1, 1,
-0.8925294, -2.242489, -4.28982, 1, 1, 1, 1, 1,
-0.8898908, -1.37198, -2.499224, 1, 1, 1, 1, 1,
-0.8862264, -0.428833, 1.101041, 1, 1, 1, 1, 1,
-0.886129, -1.316461, -3.734958, 1, 1, 1, 1, 1,
-0.8847445, 1.641274, 0.1182395, 1, 1, 1, 1, 1,
-0.8826262, 0.8095455, -0.5726612, 1, 1, 1, 1, 1,
-0.8781611, 0.6511974, -0.02779419, 1, 1, 1, 1, 1,
-0.8603875, -0.4207374, -2.720881, 1, 1, 1, 1, 1,
-0.855853, 0.04239296, -2.15241, 1, 1, 1, 1, 1,
-0.8460245, 0.3759216, -0.5543193, 1, 1, 1, 1, 1,
-0.8413901, -0.1747945, -1.560495, 1, 1, 1, 1, 1,
-0.8322681, 1.372589, 0.7274066, 1, 1, 1, 1, 1,
-0.8308524, 2.191557, 0.2924696, 1, 1, 1, 1, 1,
-0.8198817, 1.208632, -0.4447123, 0, 0, 1, 1, 1,
-0.8191708, -0.6952381, -1.475715, 1, 0, 0, 1, 1,
-0.8183234, 0.8867308, 0.1665177, 1, 0, 0, 1, 1,
-0.8164019, -0.6088622, -2.702537, 1, 0, 0, 1, 1,
-0.8156512, -0.3965804, -0.9860114, 1, 0, 0, 1, 1,
-0.8094246, -2.054348, -0.3434718, 1, 0, 0, 1, 1,
-0.8052647, -0.878011, -2.89869, 0, 0, 0, 1, 1,
-0.8045989, 0.8100428, 1.375064, 0, 0, 0, 1, 1,
-0.8027406, -1.251619, -3.04979, 0, 0, 0, 1, 1,
-0.8013015, 0.1737155, -0.9428276, 0, 0, 0, 1, 1,
-0.8007805, 1.895277, -0.8580961, 0, 0, 0, 1, 1,
-0.7994736, 0.4096208, -0.8110985, 0, 0, 0, 1, 1,
-0.7985284, -0.7913384, -2.631626, 0, 0, 0, 1, 1,
-0.7896249, -0.5573184, -3.037915, 1, 1, 1, 1, 1,
-0.7879571, 0.1263176, -2.109552, 1, 1, 1, 1, 1,
-0.7765777, 0.03319337, -1.563959, 1, 1, 1, 1, 1,
-0.7765501, -0.5732316, -2.285538, 1, 1, 1, 1, 1,
-0.7711248, 1.189232, -1.981182, 1, 1, 1, 1, 1,
-0.770474, 0.7104119, -1.203095, 1, 1, 1, 1, 1,
-0.7670603, -2.045797, -3.145947, 1, 1, 1, 1, 1,
-0.7603476, 0.0005824862, -0.735167, 1, 1, 1, 1, 1,
-0.7563509, -0.6364853, -2.59736, 1, 1, 1, 1, 1,
-0.756133, 0.368619, 0.2554566, 1, 1, 1, 1, 1,
-0.750755, 0.3868737, -0.6510906, 1, 1, 1, 1, 1,
-0.7430933, -0.1540472, -2.851321, 1, 1, 1, 1, 1,
-0.7370358, 0.8273662, 1.093017, 1, 1, 1, 1, 1,
-0.7362159, 1.514891, -1.155152, 1, 1, 1, 1, 1,
-0.7359331, 0.002453164, -1.450806, 1, 1, 1, 1, 1,
-0.7266608, -1.516999, -2.642359, 0, 0, 1, 1, 1,
-0.7211482, 0.6724949, -1.23952, 1, 0, 0, 1, 1,
-0.7178593, 1.605332, -0.8227952, 1, 0, 0, 1, 1,
-0.7098268, 0.5806623, -2.051381, 1, 0, 0, 1, 1,
-0.7073377, -0.6508024, -2.671317, 1, 0, 0, 1, 1,
-0.7023192, -1.254596, -1.313587, 1, 0, 0, 1, 1,
-0.7009251, -0.924525, -3.410669, 0, 0, 0, 1, 1,
-0.7005613, -0.06391421, -1.235425, 0, 0, 0, 1, 1,
-0.6988873, -0.8714747, -2.976354, 0, 0, 0, 1, 1,
-0.6915053, -0.7734973, -3.87909, 0, 0, 0, 1, 1,
-0.6864084, 0.1813662, -3.279073, 0, 0, 0, 1, 1,
-0.6791438, 1.296207, -2.004874, 0, 0, 0, 1, 1,
-0.678943, -0.668555, -1.981491, 0, 0, 0, 1, 1,
-0.6705976, -0.5575434, -1.320231, 1, 1, 1, 1, 1,
-0.6697133, 0.06039017, -2.228416, 1, 1, 1, 1, 1,
-0.666927, -0.9031503, -2.205587, 1, 1, 1, 1, 1,
-0.6615769, 0.2184764, -0.4198339, 1, 1, 1, 1, 1,
-0.6553727, -0.4994285, -2.19694, 1, 1, 1, 1, 1,
-0.653678, -0.5953986, -1.815579, 1, 1, 1, 1, 1,
-0.651575, 1.022205, 0.2628382, 1, 1, 1, 1, 1,
-0.6513804, 0.5570006, -0.8262249, 1, 1, 1, 1, 1,
-0.6488977, 1.588651, 0.7524205, 1, 1, 1, 1, 1,
-0.6476214, 0.2324528, -1.55261, 1, 1, 1, 1, 1,
-0.6463299, -0.2031085, -2.282672, 1, 1, 1, 1, 1,
-0.6454389, -1.735388, -2.368513, 1, 1, 1, 1, 1,
-0.6452394, -0.4300407, -1.592848, 1, 1, 1, 1, 1,
-0.6422949, -1.096433, -3.052442, 1, 1, 1, 1, 1,
-0.6412351, -0.06560695, -2.404186, 1, 1, 1, 1, 1,
-0.6373196, -0.2243723, -2.130225, 0, 0, 1, 1, 1,
-0.6363535, -0.6408436, -2.999734, 1, 0, 0, 1, 1,
-0.6357232, -1.751455, -3.367803, 1, 0, 0, 1, 1,
-0.6346276, 0.8884902, 0.9143004, 1, 0, 0, 1, 1,
-0.6332321, 1.538172, -0.9980938, 1, 0, 0, 1, 1,
-0.6238793, -0.4717299, -1.645223, 1, 0, 0, 1, 1,
-0.6181136, -0.2952492, -3.377087, 0, 0, 0, 1, 1,
-0.6155539, 0.06794323, -0.9644446, 0, 0, 0, 1, 1,
-0.6142122, 1.724977, 1.288639, 0, 0, 0, 1, 1,
-0.6059715, -0.3656624, -2.384643, 0, 0, 0, 1, 1,
-0.6049886, -0.2214388, -1.814792, 0, 0, 0, 1, 1,
-0.6000699, -0.5556013, -2.137975, 0, 0, 0, 1, 1,
-0.5932318, 3.155396, -0.8354163, 0, 0, 0, 1, 1,
-0.5844825, -0.09372722, -3.757706, 1, 1, 1, 1, 1,
-0.5833147, 1.38611, -1.269032, 1, 1, 1, 1, 1,
-0.579774, -1.271922, -3.551166, 1, 1, 1, 1, 1,
-0.5790974, -0.2600187, -2.141372, 1, 1, 1, 1, 1,
-0.5783469, -1.813246, -2.713377, 1, 1, 1, 1, 1,
-0.5780268, 0.6492351, -1.397676, 1, 1, 1, 1, 1,
-0.57736, -0.102367, -2.811555, 1, 1, 1, 1, 1,
-0.576753, 0.5967139, -0.8402736, 1, 1, 1, 1, 1,
-0.5762197, -2.122774, -1.266412, 1, 1, 1, 1, 1,
-0.5686542, -0.7448539, -2.445522, 1, 1, 1, 1, 1,
-0.5682201, -0.007448319, -1.341089, 1, 1, 1, 1, 1,
-0.5665658, -0.9452291, -3.00003, 1, 1, 1, 1, 1,
-0.5629458, 1.320022, -1.329329, 1, 1, 1, 1, 1,
-0.5545124, 0.7612343, -2.202608, 1, 1, 1, 1, 1,
-0.5522982, -0.7154345, -0.979057, 1, 1, 1, 1, 1,
-0.5517691, -0.04066762, -1.81837, 0, 0, 1, 1, 1,
-0.5507198, -0.1140913, -1.654522, 1, 0, 0, 1, 1,
-0.5495833, -0.1444431, -2.946778, 1, 0, 0, 1, 1,
-0.5453307, -1.397232, -1.684665, 1, 0, 0, 1, 1,
-0.5447586, 0.8423277, -2.113818, 1, 0, 0, 1, 1,
-0.5387379, -0.7183204, -1.748401, 1, 0, 0, 1, 1,
-0.5364558, 1.007504, -0.7760546, 0, 0, 0, 1, 1,
-0.5345438, -0.2151807, -1.652401, 0, 0, 0, 1, 1,
-0.5342116, -1.187863, -3.791475, 0, 0, 0, 1, 1,
-0.529913, -0.8067426, -3.630121, 0, 0, 0, 1, 1,
-0.5247677, -0.2146298, -2.874546, 0, 0, 0, 1, 1,
-0.516556, 1.355882, 2.028222, 0, 0, 0, 1, 1,
-0.513827, -0.7932964, -3.687428, 0, 0, 0, 1, 1,
-0.5136552, -0.2198847, -1.090504, 1, 1, 1, 1, 1,
-0.5097559, 0.4896105, -0.8542439, 1, 1, 1, 1, 1,
-0.509221, 0.4615359, -0.8013409, 1, 1, 1, 1, 1,
-0.5079775, -1.683892, -2.664649, 1, 1, 1, 1, 1,
-0.5069944, 0.03294482, -0.1631404, 1, 1, 1, 1, 1,
-0.5034427, 0.9007835, 0.706849, 1, 1, 1, 1, 1,
-0.4966404, -1.484843, -2.838879, 1, 1, 1, 1, 1,
-0.4866185, 1.231065, 0.06016861, 1, 1, 1, 1, 1,
-0.4864538, 0.9769303, -2.468456, 1, 1, 1, 1, 1,
-0.4861901, 0.3459682, -2.108763, 1, 1, 1, 1, 1,
-0.4847945, 1.858472, 1.269966, 1, 1, 1, 1, 1,
-0.4840267, 1.631229, 0.20285, 1, 1, 1, 1, 1,
-0.4813445, 0.4119608, 0.6280752, 1, 1, 1, 1, 1,
-0.4757039, -1.266476, -2.717943, 1, 1, 1, 1, 1,
-0.473552, -1.01362, -3.109046, 1, 1, 1, 1, 1,
-0.4727316, 0.8824317, -0.8903281, 0, 0, 1, 1, 1,
-0.4635735, 0.5810078, -1.249868, 1, 0, 0, 1, 1,
-0.4632159, -0.009455044, -1.023906, 1, 0, 0, 1, 1,
-0.4630279, -0.482041, -3.631139, 1, 0, 0, 1, 1,
-0.4566337, -0.4372949, -3.246594, 1, 0, 0, 1, 1,
-0.4538845, -0.4827769, -2.668901, 1, 0, 0, 1, 1,
-0.4480197, -0.4842813, -2.000313, 0, 0, 0, 1, 1,
-0.4480081, -2.022178, -4.092719, 0, 0, 0, 1, 1,
-0.4459105, -1.474142, -1.929113, 0, 0, 0, 1, 1,
-0.4436988, 2.519975, 1.124976, 0, 0, 0, 1, 1,
-0.4363639, 0.1284769, -1.562083, 0, 0, 0, 1, 1,
-0.4351579, 0.07160359, -1.136436, 0, 0, 0, 1, 1,
-0.4333554, -1.268432, -4.288408, 0, 0, 0, 1, 1,
-0.4331785, -1.44174, -4.432808, 1, 1, 1, 1, 1,
-0.4329506, 0.2559313, -0.07187969, 1, 1, 1, 1, 1,
-0.4302901, -0.4667272, -2.889847, 1, 1, 1, 1, 1,
-0.4294281, 0.5414326, -0.5949761, 1, 1, 1, 1, 1,
-0.4245662, 0.6569715, -0.803131, 1, 1, 1, 1, 1,
-0.4206817, 0.6524832, -1.409897, 1, 1, 1, 1, 1,
-0.4185159, -0.5610037, -2.970052, 1, 1, 1, 1, 1,
-0.4149677, 1.902178, -0.8324986, 1, 1, 1, 1, 1,
-0.413711, 0.6662917, -2.198512, 1, 1, 1, 1, 1,
-0.4101873, -0.06275038, -2.069171, 1, 1, 1, 1, 1,
-0.4074493, -1.546614, -4.176042, 1, 1, 1, 1, 1,
-0.4068048, -0.3817786, -1.115103, 1, 1, 1, 1, 1,
-0.4048011, 1.923187, -0.6181443, 1, 1, 1, 1, 1,
-0.4003465, 0.180575, -2.244418, 1, 1, 1, 1, 1,
-0.3996164, -0.05619993, -2.723344, 1, 1, 1, 1, 1,
-0.3958745, 1.605901, -0.4943713, 0, 0, 1, 1, 1,
-0.3934446, -0.1538368, -4.467707, 1, 0, 0, 1, 1,
-0.3919414, -0.926205, -5.298636, 1, 0, 0, 1, 1,
-0.390264, -0.1498005, -2.410918, 1, 0, 0, 1, 1,
-0.3902453, -0.3535666, -0.7008162, 1, 0, 0, 1, 1,
-0.3863078, -0.212056, -0.8296172, 1, 0, 0, 1, 1,
-0.386151, -1.52488, -1.365348, 0, 0, 0, 1, 1,
-0.382933, 1.23149, -1.569095, 0, 0, 0, 1, 1,
-0.3815358, 1.247523, -0.6937701, 0, 0, 0, 1, 1,
-0.37248, -2.414879, -3.795496, 0, 0, 0, 1, 1,
-0.3707419, -1.158492, -2.851048, 0, 0, 0, 1, 1,
-0.3598906, -1.433718, -3.666122, 0, 0, 0, 1, 1,
-0.3594315, -0.2983133, -2.131126, 0, 0, 0, 1, 1,
-0.355527, 0.4178924, -1.00184, 1, 1, 1, 1, 1,
-0.3553908, -0.3229437, -3.525853, 1, 1, 1, 1, 1,
-0.3516077, -0.5105986, -2.756033, 1, 1, 1, 1, 1,
-0.3505843, 1.295993, 0.01174679, 1, 1, 1, 1, 1,
-0.350332, -1.707259, -2.856832, 1, 1, 1, 1, 1,
-0.3472224, 0.8024657, -0.4566842, 1, 1, 1, 1, 1,
-0.3465749, 0.5137744, -0.1919824, 1, 1, 1, 1, 1,
-0.34115, 1.148332, -1.020889, 1, 1, 1, 1, 1,
-0.3396115, 0.2978376, -1.464097, 1, 1, 1, 1, 1,
-0.337844, -1.87181, -2.401743, 1, 1, 1, 1, 1,
-0.3350969, -0.09900481, -0.6101578, 1, 1, 1, 1, 1,
-0.3343318, -0.03244291, -0.9496861, 1, 1, 1, 1, 1,
-0.3331343, 1.736973, 0.06672399, 1, 1, 1, 1, 1,
-0.3329485, 0.1726893, -0.6316965, 1, 1, 1, 1, 1,
-0.3317258, -1.3374, -0.5840214, 1, 1, 1, 1, 1,
-0.3270228, -1.543895, -0.371749, 0, 0, 1, 1, 1,
-0.3255803, 0.4082473, -1.49323, 1, 0, 0, 1, 1,
-0.3226368, 1.782209, -0.3579047, 1, 0, 0, 1, 1,
-0.3218867, -0.6387056, -3.576843, 1, 0, 0, 1, 1,
-0.3201461, -2.326464, -1.977925, 1, 0, 0, 1, 1,
-0.3119413, 1.954263, -1.362379, 1, 0, 0, 1, 1,
-0.308043, -0.3809108, -1.612626, 0, 0, 0, 1, 1,
-0.3071149, 0.5182126, -1.685547, 0, 0, 0, 1, 1,
-0.2989249, -0.4161471, -2.227518, 0, 0, 0, 1, 1,
-0.2966619, 0.7859904, -1.854375, 0, 0, 0, 1, 1,
-0.2934089, 0.06899779, -2.488154, 0, 0, 0, 1, 1,
-0.2899931, 0.6138574, -0.705228, 0, 0, 0, 1, 1,
-0.2882819, -0.6129367, -3.182455, 0, 0, 0, 1, 1,
-0.2861573, -0.8797522, -3.519605, 1, 1, 1, 1, 1,
-0.2809665, -0.2439077, -1.534119, 1, 1, 1, 1, 1,
-0.2802725, 0.7150652, -1.492952, 1, 1, 1, 1, 1,
-0.2785696, -0.04431494, -1.655877, 1, 1, 1, 1, 1,
-0.2739148, -0.2934509, -3.110464, 1, 1, 1, 1, 1,
-0.27339, -0.7528376, -3.655849, 1, 1, 1, 1, 1,
-0.2724813, 0.2822847, -1.673977, 1, 1, 1, 1, 1,
-0.27217, -1.83927, -2.186501, 1, 1, 1, 1, 1,
-0.2704483, 0.655297, -2.174881, 1, 1, 1, 1, 1,
-0.2648193, 0.03432464, -1.352283, 1, 1, 1, 1, 1,
-0.2648042, 1.130333, 0.2534787, 1, 1, 1, 1, 1,
-0.26005, 0.05871403, 0.6010918, 1, 1, 1, 1, 1,
-0.2586086, -0.5969495, -2.565303, 1, 1, 1, 1, 1,
-0.2533786, -0.3498426, -3.017779, 1, 1, 1, 1, 1,
-0.2520549, 0.8962257, -0.2453169, 1, 1, 1, 1, 1,
-0.2512386, -0.7063382, -0.8338452, 0, 0, 1, 1, 1,
-0.2476082, -1.657297, -3.323037, 1, 0, 0, 1, 1,
-0.2461249, 0.1272158, -3.102728, 1, 0, 0, 1, 1,
-0.2414579, 1.153031, -0.6752825, 1, 0, 0, 1, 1,
-0.2395374, -0.8325928, -2.237437, 1, 0, 0, 1, 1,
-0.2358014, -0.3788353, -5.169356, 1, 0, 0, 1, 1,
-0.2315438, 0.9687054, -0.8272719, 0, 0, 0, 1, 1,
-0.2297683, 1.402513, 0.09482016, 0, 0, 0, 1, 1,
-0.2262549, 1.171314, 0.7630087, 0, 0, 0, 1, 1,
-0.2244164, 0.61448, 0.9195756, 0, 0, 0, 1, 1,
-0.2235695, -0.09392864, -1.918784, 0, 0, 0, 1, 1,
-0.2214612, -0.6973983, -2.221561, 0, 0, 0, 1, 1,
-0.2167452, -0.4658363, 0.07804542, 0, 0, 0, 1, 1,
-0.2164227, -0.5159412, -2.675465, 1, 1, 1, 1, 1,
-0.216379, 1.02806, -2.102458, 1, 1, 1, 1, 1,
-0.2107868, -0.4817151, -2.821611, 1, 1, 1, 1, 1,
-0.2105467, -1.417062, -3.860346, 1, 1, 1, 1, 1,
-0.2099685, 0.2012577, 0.2027861, 1, 1, 1, 1, 1,
-0.2096455, 0.2836264, 3.074836, 1, 1, 1, 1, 1,
-0.2093105, 0.7390236, -0.9271281, 1, 1, 1, 1, 1,
-0.2069876, -0.4952625, -3.220397, 1, 1, 1, 1, 1,
-0.2068915, 0.4831802, -0.5415723, 1, 1, 1, 1, 1,
-0.2062347, 1.731293, 0.2002705, 1, 1, 1, 1, 1,
-0.2056167, -1.284956, -3.172647, 1, 1, 1, 1, 1,
-0.2048839, -0.7960061, -2.837387, 1, 1, 1, 1, 1,
-0.204046, -0.1951783, -0.3172415, 1, 1, 1, 1, 1,
-0.2039519, -0.5160233, -2.951619, 1, 1, 1, 1, 1,
-0.2008825, -0.01473581, -2.123642, 1, 1, 1, 1, 1,
-0.197225, 0.3857091, -2.424414, 0, 0, 1, 1, 1,
-0.1943099, -0.825411, -2.935932, 1, 0, 0, 1, 1,
-0.193215, -0.6228015, -3.810401, 1, 0, 0, 1, 1,
-0.1926904, 1.361177, 0.02588262, 1, 0, 0, 1, 1,
-0.1918941, 0.5499647, -0.7684762, 1, 0, 0, 1, 1,
-0.1917281, 0.4011764, 0.01829797, 1, 0, 0, 1, 1,
-0.1907643, -0.1684125, -3.167938, 0, 0, 0, 1, 1,
-0.1876925, -0.7741494, -3.892514, 0, 0, 0, 1, 1,
-0.1869169, 0.5709918, -2.105908, 0, 0, 0, 1, 1,
-0.1858496, 1.882894, -0.2299944, 0, 0, 0, 1, 1,
-0.1837322, -0.8385546, -3.058165, 0, 0, 0, 1, 1,
-0.1797391, -1.472686, -3.159197, 0, 0, 0, 1, 1,
-0.1788651, -0.3262435, -2.507748, 0, 0, 0, 1, 1,
-0.1778278, -1.304678, -2.963379, 1, 1, 1, 1, 1,
-0.1699835, 0.2050862, -0.04224028, 1, 1, 1, 1, 1,
-0.1635827, -0.3892323, -1.287514, 1, 1, 1, 1, 1,
-0.1635761, -0.7341238, -2.451416, 1, 1, 1, 1, 1,
-0.1623829, -0.07198306, -1.709486, 1, 1, 1, 1, 1,
-0.1590501, 0.8081235, 0.4368205, 1, 1, 1, 1, 1,
-0.1586306, 0.917042, -0.5474818, 1, 1, 1, 1, 1,
-0.1563421, -0.341535, -2.94709, 1, 1, 1, 1, 1,
-0.1549928, 0.4431139, -0.325098, 1, 1, 1, 1, 1,
-0.1527793, 1.102959, -0.7268209, 1, 1, 1, 1, 1,
-0.1519403, 0.4305102, 0.4050537, 1, 1, 1, 1, 1,
-0.1507726, -0.4502863, -2.21525, 1, 1, 1, 1, 1,
-0.1457985, -0.01360961, -1.006837, 1, 1, 1, 1, 1,
-0.1447907, -0.3532335, -2.435453, 1, 1, 1, 1, 1,
-0.1446501, -0.375935, -2.246652, 1, 1, 1, 1, 1,
-0.1445764, 0.8897822, -0.5084355, 0, 0, 1, 1, 1,
-0.1440275, 0.07161608, 0.006825464, 1, 0, 0, 1, 1,
-0.1425763, -0.1334244, -2.27424, 1, 0, 0, 1, 1,
-0.1392414, 0.7602159, -1.176968, 1, 0, 0, 1, 1,
-0.1353283, 1.111399, -1.539905, 1, 0, 0, 1, 1,
-0.1342421, 0.6538346, -1.499525, 1, 0, 0, 1, 1,
-0.1323684, -0.1355934, -0.8055019, 0, 0, 0, 1, 1,
-0.131948, 0.6822525, -0.1990846, 0, 0, 0, 1, 1,
-0.1317068, -0.8963071, -3.775257, 0, 0, 0, 1, 1,
-0.1314586, -0.552398, -1.471515, 0, 0, 0, 1, 1,
-0.1305444, 0.7629004, 0.4403529, 0, 0, 0, 1, 1,
-0.1282746, 1.861649, -1.103456, 0, 0, 0, 1, 1,
-0.1273843, 0.07651417, -2.663298, 0, 0, 0, 1, 1,
-0.1158011, 0.372415, -0.5836305, 1, 1, 1, 1, 1,
-0.1135296, -0.1250683, -1.648897, 1, 1, 1, 1, 1,
-0.1123585, -1.13771, -3.80934, 1, 1, 1, 1, 1,
-0.1054842, 0.7155336, -1.795208, 1, 1, 1, 1, 1,
-0.09366167, -1.768265, -2.552292, 1, 1, 1, 1, 1,
-0.09142546, 0.04892338, 0.8025867, 1, 1, 1, 1, 1,
-0.08729437, 0.2157028, 0.9597592, 1, 1, 1, 1, 1,
-0.08644937, 0.312415, -0.1756707, 1, 1, 1, 1, 1,
-0.08264963, -1.250266, -2.919602, 1, 1, 1, 1, 1,
-0.08201162, -0.4314707, -2.308826, 1, 1, 1, 1, 1,
-0.07970297, -0.3463683, -2.880113, 1, 1, 1, 1, 1,
-0.0671729, -1.390568, -3.142904, 1, 1, 1, 1, 1,
-0.06557072, 1.981292, 0.6862434, 1, 1, 1, 1, 1,
-0.06534948, 0.3982737, -0.7465128, 1, 1, 1, 1, 1,
-0.06055805, -0.60437, -3.235492, 1, 1, 1, 1, 1,
-0.05999713, -0.6325775, -3.093912, 0, 0, 1, 1, 1,
-0.05980023, -0.5842965, -2.733557, 1, 0, 0, 1, 1,
-0.05845881, -1.341432, -1.58558, 1, 0, 0, 1, 1,
-0.05824207, -1.791542, -2.115752, 1, 0, 0, 1, 1,
-0.0511768, -0.9068812, -5.985754, 1, 0, 0, 1, 1,
-0.05076493, 0.4546883, -0.3669118, 1, 0, 0, 1, 1,
-0.05043992, 0.1048597, -0.5315711, 0, 0, 0, 1, 1,
-0.04988321, 1.390645, -0.3641966, 0, 0, 0, 1, 1,
-0.04914711, -0.8501593, -3.594671, 0, 0, 0, 1, 1,
-0.04832383, -1.591517, -4.64483, 0, 0, 0, 1, 1,
-0.0476921, -1.589831, -3.554667, 0, 0, 0, 1, 1,
-0.04601022, -0.4377241, -2.830963, 0, 0, 0, 1, 1,
-0.03993046, 0.6865038, 0.4020301, 0, 0, 0, 1, 1,
-0.03905119, -0.7276164, -2.573056, 1, 1, 1, 1, 1,
-0.03277507, 0.5719761, -2.401276, 1, 1, 1, 1, 1,
-0.03254119, -0.7264689, -3.000844, 1, 1, 1, 1, 1,
-0.03073421, 0.4758466, 0.548456, 1, 1, 1, 1, 1,
-0.02691173, -1.467013, -3.020946, 1, 1, 1, 1, 1,
-0.02128708, -2.029635, -1.712265, 1, 1, 1, 1, 1,
-0.0191365, -0.09782273, -4.012903, 1, 1, 1, 1, 1,
-0.01737304, -0.1570256, -3.152249, 1, 1, 1, 1, 1,
-0.01263324, -0.6434465, -4.193969, 1, 1, 1, 1, 1,
-0.01210565, 0.7331204, -0.6748424, 1, 1, 1, 1, 1,
-0.009588851, 0.2616745, -1.357269, 1, 1, 1, 1, 1,
-0.007952666, -1.096027, -4.578778, 1, 1, 1, 1, 1,
-0.005289545, -3.022044, -1.959559, 1, 1, 1, 1, 1,
4.545429e-05, -0.5173385, 2.08105, 1, 1, 1, 1, 1,
0.0004393349, 1.292349, -1.201162, 1, 1, 1, 1, 1,
0.01065894, 0.03039573, -0.6327937, 0, 0, 1, 1, 1,
0.01194215, -1.895829, 1.731308, 1, 0, 0, 1, 1,
0.01209674, 1.488785, 0.1146494, 1, 0, 0, 1, 1,
0.01618038, 0.3072196, -0.6373811, 1, 0, 0, 1, 1,
0.01733455, 0.4782184, -0.4094166, 1, 0, 0, 1, 1,
0.02292612, -2.153286, 4.376437, 1, 0, 0, 1, 1,
0.04377522, 0.03902543, 1.57921, 0, 0, 0, 1, 1,
0.04412277, 1.521488, 0.5520703, 0, 0, 0, 1, 1,
0.04920314, -0.7364913, 4.236929, 0, 0, 0, 1, 1,
0.05255914, 0.1671841, 1.136291, 0, 0, 0, 1, 1,
0.05336564, -1.045722, 2.884184, 0, 0, 0, 1, 1,
0.05459638, -0.4937503, 2.611647, 0, 0, 0, 1, 1,
0.05711031, 0.9545508, 0.6190757, 0, 0, 0, 1, 1,
0.05758998, -1.373811, 3.27528, 1, 1, 1, 1, 1,
0.05801478, 1.212566, 0.06352434, 1, 1, 1, 1, 1,
0.05813877, -2.189172, 3.023623, 1, 1, 1, 1, 1,
0.05882841, -1.420939, 3.891923, 1, 1, 1, 1, 1,
0.05902631, -0.1545303, 3.092328, 1, 1, 1, 1, 1,
0.0597114, -1.892852, 3.401372, 1, 1, 1, 1, 1,
0.06422818, 1.063318, -0.5345417, 1, 1, 1, 1, 1,
0.06424626, -0.6348811, 2.813659, 1, 1, 1, 1, 1,
0.07022551, 0.9733153, -1.420856, 1, 1, 1, 1, 1,
0.07183579, 2.475611, 0.3721225, 1, 1, 1, 1, 1,
0.07232631, 0.07182136, 0.3047629, 1, 1, 1, 1, 1,
0.07276358, 0.5546895, 1.63793, 1, 1, 1, 1, 1,
0.07376669, 1.41298, 0.8623727, 1, 1, 1, 1, 1,
0.07588576, -1.211312, 4.441012, 1, 1, 1, 1, 1,
0.0763035, 0.1698618, 0.5792033, 1, 1, 1, 1, 1,
0.08187583, 0.3645939, 0.4239093, 0, 0, 1, 1, 1,
0.08197734, 0.2007851, 0.0948547, 1, 0, 0, 1, 1,
0.08324188, -1.300533, 3.298647, 1, 0, 0, 1, 1,
0.08574761, 0.6047185, 0.4561025, 1, 0, 0, 1, 1,
0.09052431, -0.8239928, 5.0122, 1, 0, 0, 1, 1,
0.09994332, -0.4461498, 3.411395, 1, 0, 0, 1, 1,
0.1000379, -1.503724, 2.339018, 0, 0, 0, 1, 1,
0.1015393, -0.8011692, 1.903743, 0, 0, 0, 1, 1,
0.1108845, -0.1823958, 2.909297, 0, 0, 0, 1, 1,
0.1122611, 1.329046, 0.905274, 0, 0, 0, 1, 1,
0.1126924, 0.4224656, -0.8023629, 0, 0, 0, 1, 1,
0.1166827, -0.9231562, 4.540037, 0, 0, 0, 1, 1,
0.1168999, 0.1798036, 0.5281974, 0, 0, 0, 1, 1,
0.1212769, 1.616207, -0.9255231, 1, 1, 1, 1, 1,
0.1285824, 0.2069256, -0.6952136, 1, 1, 1, 1, 1,
0.1289092, -1.43283, 3.693726, 1, 1, 1, 1, 1,
0.1290416, -1.20995, 1.834222, 1, 1, 1, 1, 1,
0.1302159, -0.1291885, 2.829847, 1, 1, 1, 1, 1,
0.1318683, 1.02018, -0.288351, 1, 1, 1, 1, 1,
0.1331022, -0.06914117, 2.830408, 1, 1, 1, 1, 1,
0.1354352, -0.5551322, 4.788452, 1, 1, 1, 1, 1,
0.1381721, -0.4187877, 1.791967, 1, 1, 1, 1, 1,
0.141919, 1.259989, 2.042918, 1, 1, 1, 1, 1,
0.1430925, -0.05634703, 0.5256554, 1, 1, 1, 1, 1,
0.1440877, 0.3353193, 0.05381705, 1, 1, 1, 1, 1,
0.1449184, 0.2617349, 1.408263, 1, 1, 1, 1, 1,
0.1472006, 0.9577179, 1.393673, 1, 1, 1, 1, 1,
0.1487127, 0.2471632, -0.5074627, 1, 1, 1, 1, 1,
0.1529943, 0.2299315, 0.9911633, 0, 0, 1, 1, 1,
0.1532581, -0.9788055, 3.470378, 1, 0, 0, 1, 1,
0.1562422, -1.907198, 3.6915, 1, 0, 0, 1, 1,
0.1600111, 0.6069322, 1.032008, 1, 0, 0, 1, 1,
0.1607715, -1.140348, 1.969941, 1, 0, 0, 1, 1,
0.1611771, -1.084913, 2.995898, 1, 0, 0, 1, 1,
0.1658072, 0.2315248, 0.3046604, 0, 0, 0, 1, 1,
0.168936, 0.873077, 1.794606, 0, 0, 0, 1, 1,
0.1714953, -0.891592, 2.813425, 0, 0, 0, 1, 1,
0.1767923, 0.213642, -1.124797, 0, 0, 0, 1, 1,
0.1772293, -0.3198069, 2.800751, 0, 0, 0, 1, 1,
0.1813537, -0.5004157, 4.452828, 0, 0, 0, 1, 1,
0.1821786, -0.5800346, 2.784378, 0, 0, 0, 1, 1,
0.1825809, -1.065941, 3.6817, 1, 1, 1, 1, 1,
0.1870758, 0.1699523, 0.2431752, 1, 1, 1, 1, 1,
0.1876671, -0.199923, 2.153995, 1, 1, 1, 1, 1,
0.1902872, -0.3513833, 2.565491, 1, 1, 1, 1, 1,
0.1907693, 0.9906021, 0.8975517, 1, 1, 1, 1, 1,
0.2009361, -0.08636715, 2.699862, 1, 1, 1, 1, 1,
0.2026029, -1.071147, 4.42487, 1, 1, 1, 1, 1,
0.2031499, 0.9148181, 0.09651162, 1, 1, 1, 1, 1,
0.2050749, -1.855959, 1.228805, 1, 1, 1, 1, 1,
0.2081833, -1.695634, 2.18854, 1, 1, 1, 1, 1,
0.2083019, 0.6402006, -1.3246, 1, 1, 1, 1, 1,
0.2118571, 1.461939, -0.2439976, 1, 1, 1, 1, 1,
0.2121701, -2.022376, 3.891025, 1, 1, 1, 1, 1,
0.2131243, 1.489151, -0.9750855, 1, 1, 1, 1, 1,
0.2148066, -0.8724986, 3.639304, 1, 1, 1, 1, 1,
0.2169495, -0.7620528, 1.882, 0, 0, 1, 1, 1,
0.2215543, -0.04026097, 2.354423, 1, 0, 0, 1, 1,
0.2218119, 1.372997, 0.6165903, 1, 0, 0, 1, 1,
0.2230629, -1.44179, 3.079981, 1, 0, 0, 1, 1,
0.2243776, -0.5917257, 3.257087, 1, 0, 0, 1, 1,
0.2252571, -1.535635, 4.689116, 1, 0, 0, 1, 1,
0.2254003, 1.487198, -1.720156, 0, 0, 0, 1, 1,
0.2271801, -1.632691, 2.851803, 0, 0, 0, 1, 1,
0.2349878, 2.084828, -0.5015815, 0, 0, 0, 1, 1,
0.2352539, 1.295109, -0.2883611, 0, 0, 0, 1, 1,
0.2374758, 1.161241, -0.1822427, 0, 0, 0, 1, 1,
0.2389345, 0.6734154, -1.695926, 0, 0, 0, 1, 1,
0.2393188, 0.2701512, 1.273932, 0, 0, 0, 1, 1,
0.2424996, 2.589453, 1.297868, 1, 1, 1, 1, 1,
0.2456618, 0.1917003, 0.8779741, 1, 1, 1, 1, 1,
0.2500138, 1.658512, -0.1718573, 1, 1, 1, 1, 1,
0.2544996, -0.1558734, 2.09271, 1, 1, 1, 1, 1,
0.2577834, -0.4478522, 2.166019, 1, 1, 1, 1, 1,
0.2616017, -2.202427, 4.647158, 1, 1, 1, 1, 1,
0.2654221, -0.6168892, 1.568973, 1, 1, 1, 1, 1,
0.2681236, 0.752199, 1.094189, 1, 1, 1, 1, 1,
0.2765381, -0.9478603, 3.077629, 1, 1, 1, 1, 1,
0.2783284, -1.230999, 2.670969, 1, 1, 1, 1, 1,
0.2809124, 1.773674, -0.003409484, 1, 1, 1, 1, 1,
0.2809412, 0.9371303, 1.033316, 1, 1, 1, 1, 1,
0.2843416, -0.8481617, 2.758548, 1, 1, 1, 1, 1,
0.2854938, -1.12972, 3.35435, 1, 1, 1, 1, 1,
0.2884311, 0.9797727, 1.78499, 1, 1, 1, 1, 1,
0.289791, -1.333756, 4.683746, 0, 0, 1, 1, 1,
0.292989, 0.247787, 0.1173009, 1, 0, 0, 1, 1,
0.2944458, -0.8428195, 2.722286, 1, 0, 0, 1, 1,
0.2965544, -0.7055478, 2.837491, 1, 0, 0, 1, 1,
0.2997892, 0.7098317, -0.08704055, 1, 0, 0, 1, 1,
0.300679, -0.2023434, 1.18258, 1, 0, 0, 1, 1,
0.3031903, -0.1253008, 1.967376, 0, 0, 0, 1, 1,
0.3044711, 1.378956, 1.464395, 0, 0, 0, 1, 1,
0.3059172, 0.4742973, -1.482714, 0, 0, 0, 1, 1,
0.307307, 0.19216, 2.534408, 0, 0, 0, 1, 1,
0.3079711, 2.036006, -0.7882248, 0, 0, 0, 1, 1,
0.3088492, -1.095154, 1.44504, 0, 0, 0, 1, 1,
0.3128197, 0.9483718, 1.906994, 0, 0, 0, 1, 1,
0.3128491, -0.1152731, 0.8608376, 1, 1, 1, 1, 1,
0.3132736, -0.8208091, 3.634682, 1, 1, 1, 1, 1,
0.3156136, 0.848637, -0.8450378, 1, 1, 1, 1, 1,
0.3166505, 0.5992073, 1.234176, 1, 1, 1, 1, 1,
0.3211288, -0.8802109, 3.594326, 1, 1, 1, 1, 1,
0.3217051, 0.2302336, -0.5231496, 1, 1, 1, 1, 1,
0.3271129, -0.8085407, 0.7050152, 1, 1, 1, 1, 1,
0.3339725, 1.443369, 0.944264, 1, 1, 1, 1, 1,
0.3372185, -0.6414634, 3.341798, 1, 1, 1, 1, 1,
0.3381919, 1.059201, 1.14157, 1, 1, 1, 1, 1,
0.3388487, -1.138574, 4.276947, 1, 1, 1, 1, 1,
0.3418131, 0.03906855, 1.952576, 1, 1, 1, 1, 1,
0.3473321, -0.09981743, 1.3639, 1, 1, 1, 1, 1,
0.3479482, 2.369625, 0.2726224, 1, 1, 1, 1, 1,
0.3489476, -1.354477, 0.9808256, 1, 1, 1, 1, 1,
0.3491782, -1.673956, 3.55692, 0, 0, 1, 1, 1,
0.3523248, -1.475072, 4.98906, 1, 0, 0, 1, 1,
0.352646, 1.946491, 1.154897, 1, 0, 0, 1, 1,
0.3586628, -1.411383, 4.075949, 1, 0, 0, 1, 1,
0.3594602, 1.006537, 0.9780898, 1, 0, 0, 1, 1,
0.3595468, -0.8766797, 1.669873, 1, 0, 0, 1, 1,
0.3617212, -0.4413276, 5.710453, 0, 0, 0, 1, 1,
0.363478, -0.3026036, 2.072191, 0, 0, 0, 1, 1,
0.3662693, 0.2054061, 3.028278, 0, 0, 0, 1, 1,
0.3665644, -0.9790181, 2.320622, 0, 0, 0, 1, 1,
0.3667274, -0.3192579, 2.047241, 0, 0, 0, 1, 1,
0.3705797, -1.922182, 4.721954, 0, 0, 0, 1, 1,
0.3767413, -1.120248, 2.698313, 0, 0, 0, 1, 1,
0.3842472, -1.349496, 4.225807, 1, 1, 1, 1, 1,
0.3874123, -0.4772845, 1.980816, 1, 1, 1, 1, 1,
0.3887705, -0.09065048, 3.12168, 1, 1, 1, 1, 1,
0.3921138, -0.2673108, 1.348698, 1, 1, 1, 1, 1,
0.3926261, -0.009424975, 2.179033, 1, 1, 1, 1, 1,
0.3948765, 1.013048, 0.1000594, 1, 1, 1, 1, 1,
0.3986405, -0.9123957, 1.338316, 1, 1, 1, 1, 1,
0.4006993, -0.5088699, 2.22757, 1, 1, 1, 1, 1,
0.4036716, 0.08196296, 2.868943, 1, 1, 1, 1, 1,
0.405815, 1.269068, 0.9483547, 1, 1, 1, 1, 1,
0.4078322, 0.3048914, 0.3921424, 1, 1, 1, 1, 1,
0.4325209, -0.2449622, 1.995263, 1, 1, 1, 1, 1,
0.4331188, -0.7478725, 1.351995, 1, 1, 1, 1, 1,
0.4339252, 0.1222226, 1.604328, 1, 1, 1, 1, 1,
0.4355683, 1.027874, -0.0222997, 1, 1, 1, 1, 1,
0.4407289, -0.8469802, 2.01554, 0, 0, 1, 1, 1,
0.4421485, 0.2261017, 0.5704572, 1, 0, 0, 1, 1,
0.4449233, 1.410407, 0.4291847, 1, 0, 0, 1, 1,
0.4462088, 0.855275, -0.5226683, 1, 0, 0, 1, 1,
0.44647, -2.563097, 2.37974, 1, 0, 0, 1, 1,
0.4483338, -0.6361087, 3.146398, 1, 0, 0, 1, 1,
0.4612524, -1.746146, 3.627234, 0, 0, 0, 1, 1,
0.4621759, 0.05057544, 1.101523, 0, 0, 0, 1, 1,
0.4678518, -0.2896274, 2.936957, 0, 0, 0, 1, 1,
0.4696815, 0.083892, 1.16273, 0, 0, 0, 1, 1,
0.4703402, -0.9217895, 1.111398, 0, 0, 0, 1, 1,
0.4706545, -1.390793, 1.796439, 0, 0, 0, 1, 1,
0.4708286, 0.9824422, 1.050249, 0, 0, 0, 1, 1,
0.4723698, -0.9612644, 1.282958, 1, 1, 1, 1, 1,
0.4728273, -0.1780569, 3.641513, 1, 1, 1, 1, 1,
0.4731944, 0.7523247, 1.503177, 1, 1, 1, 1, 1,
0.4806516, -1.502663, 1.44043, 1, 1, 1, 1, 1,
0.4838626, 0.04987099, -0.3666315, 1, 1, 1, 1, 1,
0.4843769, 0.9073725, 0.565035, 1, 1, 1, 1, 1,
0.4847323, 2.2783, 0.163885, 1, 1, 1, 1, 1,
0.4893645, -0.1277403, 2.189359, 1, 1, 1, 1, 1,
0.4904655, -1.555572, 2.925986, 1, 1, 1, 1, 1,
0.4908294, 0.7138453, -0.9580093, 1, 1, 1, 1, 1,
0.4951685, -0.2816705, 1.032776, 1, 1, 1, 1, 1,
0.4967188, -1.582565, 2.348041, 1, 1, 1, 1, 1,
0.5038822, -0.1744417, 3.008616, 1, 1, 1, 1, 1,
0.5079359, 0.3837883, 1.113649, 1, 1, 1, 1, 1,
0.5091383, 0.7726184, 0.3805253, 1, 1, 1, 1, 1,
0.510183, 1.272025, 0.0780763, 0, 0, 1, 1, 1,
0.5104738, -2.311512, 0.3282829, 1, 0, 0, 1, 1,
0.5131392, 0.8348036, 0.4390623, 1, 0, 0, 1, 1,
0.5172035, 0.3371411, 1.42423, 1, 0, 0, 1, 1,
0.5204185, -0.3859219, 1.60061, 1, 0, 0, 1, 1,
0.5222468, 1.622497, 1.134004, 1, 0, 0, 1, 1,
0.5224948, 1.593927, -0.1319842, 0, 0, 0, 1, 1,
0.5227423, -0.7819895, 0.7606809, 0, 0, 0, 1, 1,
0.5257595, -0.0721567, 1.776878, 0, 0, 0, 1, 1,
0.526147, -1.620326, 3.522058, 0, 0, 0, 1, 1,
0.5318844, 0.1001724, 0.5093837, 0, 0, 0, 1, 1,
0.5343685, 0.1545171, 0.3521916, 0, 0, 0, 1, 1,
0.5363901, -0.335451, 1.129088, 0, 0, 0, 1, 1,
0.5367039, 0.9132388, -0.08948269, 1, 1, 1, 1, 1,
0.5370005, -0.2883609, 0.6002058, 1, 1, 1, 1, 1,
0.5412231, -1.113014, 1.682611, 1, 1, 1, 1, 1,
0.5480034, 1.118777, 1.310134, 1, 1, 1, 1, 1,
0.5490525, 1.883876, 1.102269, 1, 1, 1, 1, 1,
0.5557195, 1.066313, -0.5673103, 1, 1, 1, 1, 1,
0.5557529, 0.5070726, 1.543903, 1, 1, 1, 1, 1,
0.5567789, -2.386571, 3.323567, 1, 1, 1, 1, 1,
0.5584866, -0.9011455, 0.7140597, 1, 1, 1, 1, 1,
0.5639774, 0.5198031, 0.6753083, 1, 1, 1, 1, 1,
0.5650448, 0.2349268, 1.742166, 1, 1, 1, 1, 1,
0.5661857, -0.5514724, 3.959039, 1, 1, 1, 1, 1,
0.5674623, -1.668196, 4.322988, 1, 1, 1, 1, 1,
0.5683833, 0.5960363, -0.1027318, 1, 1, 1, 1, 1,
0.5709273, 0.8580838, 0.6543058, 1, 1, 1, 1, 1,
0.5885168, -0.2107306, 1.910185, 0, 0, 1, 1, 1,
0.5901742, -0.9114755, 0.6629426, 1, 0, 0, 1, 1,
0.5976217, -2.216467, 2.416589, 1, 0, 0, 1, 1,
0.5999234, 0.6407743, 0.3724167, 1, 0, 0, 1, 1,
0.6010547, 0.2142938, 0.4390167, 1, 0, 0, 1, 1,
0.6021392, -1.642971, 3.362045, 1, 0, 0, 1, 1,
0.6036419, 0.6348413, -0.1948636, 0, 0, 0, 1, 1,
0.6054417, -1.115021, 2.576179, 0, 0, 0, 1, 1,
0.6077714, 0.02723237, 3.059976, 0, 0, 0, 1, 1,
0.6081455, -0.141832, 4.588806, 0, 0, 0, 1, 1,
0.6196032, 1.736777, -0.897652, 0, 0, 0, 1, 1,
0.6201869, -0.4262723, 1.594282, 0, 0, 0, 1, 1,
0.6219124, 0.355148, 0.6428667, 0, 0, 0, 1, 1,
0.6221644, -0.8729419, 3.542105, 1, 1, 1, 1, 1,
0.6316004, -1.875422, 3.505364, 1, 1, 1, 1, 1,
0.6396957, 0.07839672, 0.2915493, 1, 1, 1, 1, 1,
0.641172, 0.831483, 1.151774, 1, 1, 1, 1, 1,
0.6416159, -0.6874973, 1.555561, 1, 1, 1, 1, 1,
0.6441297, 0.274194, 0.7589186, 1, 1, 1, 1, 1,
0.6459134, -1.457819, 4.148389, 1, 1, 1, 1, 1,
0.6489087, -1.953857, 3.221635, 1, 1, 1, 1, 1,
0.6509587, 0.5956275, 2.118124, 1, 1, 1, 1, 1,
0.6527126, 1.092903, -0.01569684, 1, 1, 1, 1, 1,
0.6548951, -0.1101116, 0.2025114, 1, 1, 1, 1, 1,
0.6573198, -0.1388263, 1.243824, 1, 1, 1, 1, 1,
0.6616639, -0.6173435, 2.564248, 1, 1, 1, 1, 1,
0.6632727, 0.3318705, 1.624972, 1, 1, 1, 1, 1,
0.6639479, 0.3736186, 1.928944, 1, 1, 1, 1, 1,
0.6728778, -1.474228, 1.738592, 0, 0, 1, 1, 1,
0.6739458, -1.605912, 3.56855, 1, 0, 0, 1, 1,
0.6745043, 0.3121858, -0.2587582, 1, 0, 0, 1, 1,
0.6767857, -0.7379014, 1.589939, 1, 0, 0, 1, 1,
0.6772633, -0.1826283, 0.2294987, 1, 0, 0, 1, 1,
0.6858194, 0.3376038, 1.318614, 1, 0, 0, 1, 1,
0.6873899, -0.05821668, 1.018284, 0, 0, 0, 1, 1,
0.6888809, 0.9091188, -1.115347, 0, 0, 0, 1, 1,
0.6909765, 1.073852, -0.4069777, 0, 0, 0, 1, 1,
0.6933631, -0.1904255, 0.9178276, 0, 0, 0, 1, 1,
0.6968355, 0.3182254, 0.5836037, 0, 0, 0, 1, 1,
0.699342, 0.5598662, -0.9175532, 0, 0, 0, 1, 1,
0.7062954, -1.402286, 1.419711, 0, 0, 0, 1, 1,
0.7080762, -0.02161496, 3.874093, 1, 1, 1, 1, 1,
0.7108184, -0.3708541, 2.009827, 1, 1, 1, 1, 1,
0.7138274, 0.8224433, 1.280838, 1, 1, 1, 1, 1,
0.7192414, -0.1029778, 3.799725, 1, 1, 1, 1, 1,
0.7225647, 0.2935913, 0.9923438, 1, 1, 1, 1, 1,
0.7235187, -0.5730855, 1.48027, 1, 1, 1, 1, 1,
0.7247115, 0.3809384, 1.949089, 1, 1, 1, 1, 1,
0.726084, 0.4151944, 1.002958, 1, 1, 1, 1, 1,
0.7267254, 1.289611, 1.292686, 1, 1, 1, 1, 1,
0.7335811, -0.9929494, 2.419209, 1, 1, 1, 1, 1,
0.7360126, 0.4564889, -0.2857391, 1, 1, 1, 1, 1,
0.7363053, 0.5790356, 0.7238846, 1, 1, 1, 1, 1,
0.7390001, 0.4778712, 0.4163395, 1, 1, 1, 1, 1,
0.7395204, -0.7095309, 2.043194, 1, 1, 1, 1, 1,
0.7532024, -0.5933974, 2.45317, 1, 1, 1, 1, 1,
0.7537352, 0.228646, 3.522051, 0, 0, 1, 1, 1,
0.7558187, -0.7835464, 2.251083, 1, 0, 0, 1, 1,
0.7595729, -0.414102, 3.457404, 1, 0, 0, 1, 1,
0.7602887, -0.1515324, 2.599623, 1, 0, 0, 1, 1,
0.7604817, 1.601007, 1.684576, 1, 0, 0, 1, 1,
0.7627776, -0.1434853, 0.856846, 1, 0, 0, 1, 1,
0.7651829, 0.5956043, 2.356817, 0, 0, 0, 1, 1,
0.766103, 0.7828405, 0.8155779, 0, 0, 0, 1, 1,
0.7676601, 0.2951379, -0.7833669, 0, 0, 0, 1, 1,
0.7691032, -0.4778999, 2.01002, 0, 0, 0, 1, 1,
0.7707224, 2.120009, -0.7246155, 0, 0, 0, 1, 1,
0.7713288, -0.8699649, 3.086716, 0, 0, 0, 1, 1,
0.7728233, 1.016068, -1.995976, 0, 0, 0, 1, 1,
0.7855634, -1.311721, 2.398679, 1, 1, 1, 1, 1,
0.7858543, -0.547693, 2.718312, 1, 1, 1, 1, 1,
0.7861425, -0.5603955, 2.043909, 1, 1, 1, 1, 1,
0.7879446, 0.5092245, 0.4456536, 1, 1, 1, 1, 1,
0.7983519, -0.8133692, 1.919018, 1, 1, 1, 1, 1,
0.8041363, -0.09400811, 1.431933, 1, 1, 1, 1, 1,
0.8046032, 0.5038301, 1.215038, 1, 1, 1, 1, 1,
0.817526, -0.7197789, 1.696629, 1, 1, 1, 1, 1,
0.8180171, -0.5779706, 1.945753, 1, 1, 1, 1, 1,
0.8234352, -1.180939, 2.677682, 1, 1, 1, 1, 1,
0.8237787, -0.7990936, 3.264356, 1, 1, 1, 1, 1,
0.8333203, 1.182506, 1.095208, 1, 1, 1, 1, 1,
0.849043, -0.1645891, 2.45613, 1, 1, 1, 1, 1,
0.854832, 1.45471, -1.085809, 1, 1, 1, 1, 1,
0.8574041, 1.055603, 1.337847, 1, 1, 1, 1, 1,
0.8583255, 0.4198522, 1.554636, 0, 0, 1, 1, 1,
0.8593767, -0.7546064, -0.0138449, 1, 0, 0, 1, 1,
0.8622401, -0.006623511, 2.518337, 1, 0, 0, 1, 1,
0.8630181, -1.04599, 2.022449, 1, 0, 0, 1, 1,
0.8783215, 0.6253932, -0.146999, 1, 0, 0, 1, 1,
0.881151, -0.9057831, 3.33503, 1, 0, 0, 1, 1,
0.8821044, -2.11498, 3.23608, 0, 0, 0, 1, 1,
0.8845347, -0.6130741, 2.873854, 0, 0, 0, 1, 1,
0.8848522, -1.283442, 3.934904, 0, 0, 0, 1, 1,
0.8916985, 0.1470181, 0.7194732, 0, 0, 0, 1, 1,
0.8971936, -0.1569292, 1.144422, 0, 0, 0, 1, 1,
0.8985699, -0.9790833, 1.712017, 0, 0, 0, 1, 1,
0.9029124, 1.013906, 1.072828, 0, 0, 0, 1, 1,
0.9041033, -0.6812737, 2.167332, 1, 1, 1, 1, 1,
0.920666, -1.054127, 2.179431, 1, 1, 1, 1, 1,
0.9207807, -0.4524066, 2.001111, 1, 1, 1, 1, 1,
0.921032, 1.106577, 1.590217, 1, 1, 1, 1, 1,
0.921565, 0.6600263, 0.6688725, 1, 1, 1, 1, 1,
0.9235263, -1.338872, 3.534253, 1, 1, 1, 1, 1,
0.9250982, 1.392031, 0.2674789, 1, 1, 1, 1, 1,
0.925678, 2.210162, 0.1545586, 1, 1, 1, 1, 1,
0.9260111, -1.135452, 2.22202, 1, 1, 1, 1, 1,
0.9316252, 0.3789715, 1.237628, 1, 1, 1, 1, 1,
0.9360954, -1.214733, 2.636896, 1, 1, 1, 1, 1,
0.9408082, -0.8963757, 3.005967, 1, 1, 1, 1, 1,
0.9412434, -0.9430513, 2.113784, 1, 1, 1, 1, 1,
0.9469073, 0.1236076, -0.6360046, 1, 1, 1, 1, 1,
0.9523052, -2.475928, 2.095549, 1, 1, 1, 1, 1,
0.9579245, 0.5146962, 0.7765033, 0, 0, 1, 1, 1,
0.9594107, -0.008816901, 0.5732515, 1, 0, 0, 1, 1,
0.9616877, 0.8198168, 0.5348165, 1, 0, 0, 1, 1,
0.9631914, -0.2861165, 1.059157, 1, 0, 0, 1, 1,
0.9706813, -0.5008821, 1.553731, 1, 0, 0, 1, 1,
0.9806539, 0.8442185, 0.9646564, 1, 0, 0, 1, 1,
0.9818244, 0.650762, 0.9780899, 0, 0, 0, 1, 1,
0.9877661, -0.3413507, 1.880464, 0, 0, 0, 1, 1,
0.9931888, 0.4657575, 0.3196293, 0, 0, 0, 1, 1,
0.9945377, -1.352487, 3.00459, 0, 0, 0, 1, 1,
0.9971246, 1.728251, 1.359824, 0, 0, 0, 1, 1,
1.003363, 1.499468, -0.6653028, 0, 0, 0, 1, 1,
1.019515, -0.2212608, 1.49947, 0, 0, 0, 1, 1,
1.025668, 0.5000061, 1.822891, 1, 1, 1, 1, 1,
1.029482, -0.8361589, 4.044935, 1, 1, 1, 1, 1,
1.030194, 0.4422267, 1.3377, 1, 1, 1, 1, 1,
1.033422, -0.7385025, 1.563217, 1, 1, 1, 1, 1,
1.041696, -0.4387144, 1.178379, 1, 1, 1, 1, 1,
1.045169, -0.02714552, 0.63854, 1, 1, 1, 1, 1,
1.059449, -0.5451893, 1.620368, 1, 1, 1, 1, 1,
1.069942, 0.1130567, 1.892483, 1, 1, 1, 1, 1,
1.078296, -0.3772547, 1.708337, 1, 1, 1, 1, 1,
1.080413, 2.101753, 0.4107518, 1, 1, 1, 1, 1,
1.087869, -1.502054, 4.069599, 1, 1, 1, 1, 1,
1.093633, -0.1241042, 2.519432, 1, 1, 1, 1, 1,
1.094445, 2.282314, -0.3799155, 1, 1, 1, 1, 1,
1.095853, 0.7867258, 0.7615117, 1, 1, 1, 1, 1,
1.097342, 0.3332039, 2.36522, 1, 1, 1, 1, 1,
1.103971, 0.6634977, 2.264743, 0, 0, 1, 1, 1,
1.120839, -0.5510817, 3.817116, 1, 0, 0, 1, 1,
1.124416, 0.364505, 1.109309, 1, 0, 0, 1, 1,
1.131425, -0.7517702, 2.544646, 1, 0, 0, 1, 1,
1.143753, 2.142678, -0.4500796, 1, 0, 0, 1, 1,
1.149537, -0.4165506, 2.279449, 1, 0, 0, 1, 1,
1.153125, 0.08431828, 1.968607, 0, 0, 0, 1, 1,
1.153601, -1.586886, 0.5716482, 0, 0, 0, 1, 1,
1.154012, -0.2667338, 3.342278, 0, 0, 0, 1, 1,
1.155761, 0.004789555, 1.450467, 0, 0, 0, 1, 1,
1.165698, -0.7284157, 3.217086, 0, 0, 0, 1, 1,
1.176331, 0.2347036, 0.5571544, 0, 0, 0, 1, 1,
1.178018, 0.4548401, 2.107572, 0, 0, 0, 1, 1,
1.178715, 0.1696568, 1.599689, 1, 1, 1, 1, 1,
1.182955, -0.2578647, 1.243021, 1, 1, 1, 1, 1,
1.194728, 1.00615, 1.406547, 1, 1, 1, 1, 1,
1.195061, 0.1112064, 3.459041, 1, 1, 1, 1, 1,
1.199694, 0.9120677, 2.169117, 1, 1, 1, 1, 1,
1.204512, -0.8060645, 2.476857, 1, 1, 1, 1, 1,
1.205499, -0.5148292, 2.149913, 1, 1, 1, 1, 1,
1.205781, -0.2350953, 1.422133, 1, 1, 1, 1, 1,
1.211062, 0.1299592, 2.997651, 1, 1, 1, 1, 1,
1.217229, -0.771171, 3.359994, 1, 1, 1, 1, 1,
1.218171, 1.590192, 0.8220059, 1, 1, 1, 1, 1,
1.221266, 0.321743, 3.037834, 1, 1, 1, 1, 1,
1.226511, 0.5127023, 2.249634, 1, 1, 1, 1, 1,
1.228653, -1.015425, 2.866027, 1, 1, 1, 1, 1,
1.235291, 2.213706, 0.2520264, 1, 1, 1, 1, 1,
1.236759, -0.7383851, 2.604583, 0, 0, 1, 1, 1,
1.242859, 1.467867, -0.453638, 1, 0, 0, 1, 1,
1.247316, 1.247838, -0.4168633, 1, 0, 0, 1, 1,
1.252652, -1.323645, 1.251469, 1, 0, 0, 1, 1,
1.276912, 0.175886, 0.8227497, 1, 0, 0, 1, 1,
1.277789, -2.040251, 0.5398303, 1, 0, 0, 1, 1,
1.279275, 0.8722287, 1.392683, 0, 0, 0, 1, 1,
1.289202, 1.17066, -0.6680868, 0, 0, 0, 1, 1,
1.306183, 0.2435652, 1.842724, 0, 0, 0, 1, 1,
1.306375, -2.535347, 3.01622, 0, 0, 0, 1, 1,
1.307821, -0.6301796, 2.812579, 0, 0, 0, 1, 1,
1.310984, 0.1021256, 1.661473, 0, 0, 0, 1, 1,
1.315187, 1.858621, 0.2236667, 0, 0, 0, 1, 1,
1.320576, -0.0009116454, 0.8764209, 1, 1, 1, 1, 1,
1.332306, -0.8953728, 2.535585, 1, 1, 1, 1, 1,
1.338319, 0.7313953, 1.176406, 1, 1, 1, 1, 1,
1.345579, 0.391851, 0.8436757, 1, 1, 1, 1, 1,
1.350897, -0.004984727, 1.241042, 1, 1, 1, 1, 1,
1.357355, 2.008485, 1.170537, 1, 1, 1, 1, 1,
1.383877, 0.2452713, -0.1405696, 1, 1, 1, 1, 1,
1.401893, 0.8548201, 2.177168, 1, 1, 1, 1, 1,
1.422933, 0.9014295, 1.582601, 1, 1, 1, 1, 1,
1.42491, 1.178994, 0.8058672, 1, 1, 1, 1, 1,
1.435203, -0.6369398, 1.151411, 1, 1, 1, 1, 1,
1.435786, 1.824616, 1.300218, 1, 1, 1, 1, 1,
1.43752, 0.2325138, 1.076712, 1, 1, 1, 1, 1,
1.452424, -1.86393, 2.680483, 1, 1, 1, 1, 1,
1.459287, 0.2382678, 1.784269, 1, 1, 1, 1, 1,
1.459327, -1.291811, 1.776094, 0, 0, 1, 1, 1,
1.463245, -2.222076, 2.712334, 1, 0, 0, 1, 1,
1.465204, 0.2670964, 1.785489, 1, 0, 0, 1, 1,
1.476849, 1.279271, 2.748048, 1, 0, 0, 1, 1,
1.484718, -1.303137, 2.522342, 1, 0, 0, 1, 1,
1.499127, 0.9050548, 1.342766, 1, 0, 0, 1, 1,
1.500732, 1.300679, -0.179864, 0, 0, 0, 1, 1,
1.525143, 0.573128, 0.2149272, 0, 0, 0, 1, 1,
1.527907, 0.5933506, 0.7659501, 0, 0, 0, 1, 1,
1.555042, -0.8558157, 1.586107, 0, 0, 0, 1, 1,
1.561609, 0.4606084, 2.26673, 0, 0, 0, 1, 1,
1.567663, 0.6412096, 3.001647, 0, 0, 0, 1, 1,
1.581633, 0.3017436, 0.8456596, 0, 0, 0, 1, 1,
1.588016, -0.5252972, 2.688261, 1, 1, 1, 1, 1,
1.593835, -0.3292521, 2.279901, 1, 1, 1, 1, 1,
1.596592, 1.957838, 1.41671, 1, 1, 1, 1, 1,
1.604327, 0.8638716, 2.00862, 1, 1, 1, 1, 1,
1.611476, 1.041496, 0.7696216, 1, 1, 1, 1, 1,
1.625125, -0.9572755, 1.764774, 1, 1, 1, 1, 1,
1.631608, -1.627487, 2.372676, 1, 1, 1, 1, 1,
1.636597, 0.6067785, 1.745646, 1, 1, 1, 1, 1,
1.638254, 0.2662143, 1.043205, 1, 1, 1, 1, 1,
1.653817, 0.492109, 1.153521, 1, 1, 1, 1, 1,
1.667865, -1.659512, 2.453929, 1, 1, 1, 1, 1,
1.699826, 0.5579537, 1.755246, 1, 1, 1, 1, 1,
1.708504, -0.8799288, 1.388235, 1, 1, 1, 1, 1,
1.720119, -0.3777386, 1.476176, 1, 1, 1, 1, 1,
1.725879, -0.4421402, 0.5990959, 1, 1, 1, 1, 1,
1.747041, -1.221573, 3.571948, 0, 0, 1, 1, 1,
1.759748, 0.9085803, 2.749853, 1, 0, 0, 1, 1,
1.774022, -0.4378158, 0.6880087, 1, 0, 0, 1, 1,
1.786182, 0.249105, 2.898151, 1, 0, 0, 1, 1,
1.792006, 0.5259942, 1.966696, 1, 0, 0, 1, 1,
1.812109, 0.1333832, 0.6373136, 1, 0, 0, 1, 1,
1.815383, 1.171393, -1.428827, 0, 0, 0, 1, 1,
1.818423, -0.01127044, 0.6110674, 0, 0, 0, 1, 1,
1.822568, 0.5301093, 1.793932, 0, 0, 0, 1, 1,
1.838595, 1.731126, 1.73655, 0, 0, 0, 1, 1,
1.846355, -1.193967, 1.449873, 0, 0, 0, 1, 1,
1.862396, 0.3684539, 1.399944, 0, 0, 0, 1, 1,
1.873703, -0.7155957, 0.05838386, 0, 0, 0, 1, 1,
1.907261, 0.5545353, 2.330127, 1, 1, 1, 1, 1,
1.914803, 1.381728, 3.571641, 1, 1, 1, 1, 1,
1.943102, 1.412128, 0.79212, 1, 1, 1, 1, 1,
1.955523, -0.8467795, 1.069231, 1, 1, 1, 1, 1,
1.957452, -0.9544878, 1.102391, 1, 1, 1, 1, 1,
1.963116, 0.3063942, 0.6826887, 1, 1, 1, 1, 1,
1.979478, -0.07452992, 1.967797, 1, 1, 1, 1, 1,
2.030484, -0.6372989, 1.625984, 1, 1, 1, 1, 1,
2.034138, -0.2603432, 2.143577, 1, 1, 1, 1, 1,
2.077239, -0.5168983, 1.532851, 1, 1, 1, 1, 1,
2.086263, 0.7406194, 0.8970721, 1, 1, 1, 1, 1,
2.094716, -0.7593123, 0.7122311, 1, 1, 1, 1, 1,
2.114947, 1.021422, 1.123723, 1, 1, 1, 1, 1,
2.115831, 2.225296, -0.02697977, 1, 1, 1, 1, 1,
2.142935, 0.1681403, 1.490168, 1, 1, 1, 1, 1,
2.158447, 0.01668049, 0.4655872, 0, 0, 1, 1, 1,
2.165961, 0.8637972, 1.061906, 1, 0, 0, 1, 1,
2.231043, 0.2932205, 2.045984, 1, 0, 0, 1, 1,
2.301881, 0.1075341, 2.14126, 1, 0, 0, 1, 1,
2.329443, 1.351662, 1.490171, 1, 0, 0, 1, 1,
2.337893, 1.76785, -0.4835058, 1, 0, 0, 1, 1,
2.351562, -0.7875679, 2.007185, 0, 0, 0, 1, 1,
2.351636, -0.3986377, 1.885905, 0, 0, 0, 1, 1,
2.359786, -0.7375335, 3.120461, 0, 0, 0, 1, 1,
2.364411, -1.969495, 1.729039, 0, 0, 0, 1, 1,
2.369662, 0.7146055, 1.683309, 0, 0, 0, 1, 1,
2.382126, 0.7564178, 2.182575, 0, 0, 0, 1, 1,
2.428817, 0.2001395, 0.714926, 0, 0, 0, 1, 1,
2.438886, -1.427377, 0.8371092, 1, 1, 1, 1, 1,
2.641296, -1.066057, 2.976775, 1, 1, 1, 1, 1,
2.769705, -0.7631, 2.225413, 1, 1, 1, 1, 1,
2.816363, 0.2764999, 1.871029, 1, 1, 1, 1, 1,
2.960767, -0.5451725, 1.470082, 1, 1, 1, 1, 1,
2.964355, -0.3171384, -0.3174017, 1, 1, 1, 1, 1,
3.090809, -0.5491447, -0.2972121, 1, 1, 1, 1, 1
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
var radius = 9.882961;
var distance = 34.71348;
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
mvMatrix.translate( 0.04528332, -0.06667614, 0.137651 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.71348);
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
