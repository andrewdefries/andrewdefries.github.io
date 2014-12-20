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
-2.794402, 0.5406358, -0.3921627, 1, 0, 0, 1,
-2.723755, 0.04988436, 1.101408, 1, 0.007843138, 0, 1,
-2.721005, -0.1223109, -1.301629, 1, 0.01176471, 0, 1,
-2.697426, -0.2308415, -1.962622, 1, 0.01960784, 0, 1,
-2.614917, 0.6262022, -0.1289334, 1, 0.02352941, 0, 1,
-2.56706, 1.037088, 1.132366, 1, 0.03137255, 0, 1,
-2.488845, 1.178607, -0.01889484, 1, 0.03529412, 0, 1,
-2.463913, -0.5704961, -4.054951, 1, 0.04313726, 0, 1,
-2.384044, -0.968221, -0.7716756, 1, 0.04705882, 0, 1,
-2.331659, 0.4573458, -1.636729, 1, 0.05490196, 0, 1,
-2.203161, 0.3773787, -1.309839, 1, 0.05882353, 0, 1,
-2.198232, -0.7723725, -2.429546, 1, 0.06666667, 0, 1,
-2.175574, 0.4790004, -0.8635469, 1, 0.07058824, 0, 1,
-2.162014, -1.066337, -1.307303, 1, 0.07843138, 0, 1,
-2.143708, -0.3186472, -3.973964, 1, 0.08235294, 0, 1,
-2.139586, -0.7661005, -1.702092, 1, 0.09019608, 0, 1,
-2.127529, -0.1331616, -0.4227634, 1, 0.09411765, 0, 1,
-2.118295, -1.977165, -0.4495327, 1, 0.1019608, 0, 1,
-2.09891, 1.519969, -0.5777742, 1, 0.1098039, 0, 1,
-2.082033, -1.470239, -2.664183, 1, 0.1137255, 0, 1,
-2.060817, -0.400423, -1.766868, 1, 0.1215686, 0, 1,
-2.026821, -0.7358682, -2.599583, 1, 0.1254902, 0, 1,
-1.999607, -0.4483968, -4.126781, 1, 0.1333333, 0, 1,
-1.981761, 0.3883471, 0.1738115, 1, 0.1372549, 0, 1,
-1.979984, 0.6352866, -1.303924, 1, 0.145098, 0, 1,
-1.975166, 0.5967504, -0.7279212, 1, 0.1490196, 0, 1,
-1.945856, 0.04526118, -1.481847, 1, 0.1568628, 0, 1,
-1.93613, -0.9545593, -2.235739, 1, 0.1607843, 0, 1,
-1.927349, 0.5078977, -1.613988, 1, 0.1686275, 0, 1,
-1.907691, -0.1103839, -2.09355, 1, 0.172549, 0, 1,
-1.900359, -0.475329, -1.568228, 1, 0.1803922, 0, 1,
-1.883248, 1.079221, -0.1627115, 1, 0.1843137, 0, 1,
-1.872606, -1.009847, -2.928767, 1, 0.1921569, 0, 1,
-1.867195, -1.203307, -2.226286, 1, 0.1960784, 0, 1,
-1.809925, -0.8061393, -2.805149, 1, 0.2039216, 0, 1,
-1.783757, -0.3232496, -0.6501698, 1, 0.2117647, 0, 1,
-1.78009, 1.88806, -2.812683, 1, 0.2156863, 0, 1,
-1.777974, -1.142527, -2.584934, 1, 0.2235294, 0, 1,
-1.774646, -1.474921, -2.104947, 1, 0.227451, 0, 1,
-1.765182, 1.174285, -2.301528, 1, 0.2352941, 0, 1,
-1.734274, -0.4204589, -1.364435, 1, 0.2392157, 0, 1,
-1.734053, 0.4781669, -3.485351, 1, 0.2470588, 0, 1,
-1.710192, 1.825632, -2.697869, 1, 0.2509804, 0, 1,
-1.706547, 0.3299743, -2.101648, 1, 0.2588235, 0, 1,
-1.705264, 0.9035119, -0.5579349, 1, 0.2627451, 0, 1,
-1.702157, 1.124971, 0.1567993, 1, 0.2705882, 0, 1,
-1.692491, -1.160553, -2.45388, 1, 0.2745098, 0, 1,
-1.674452, -1.042138, -2.134844, 1, 0.282353, 0, 1,
-1.657322, -0.3113636, -1.345581, 1, 0.2862745, 0, 1,
-1.650307, 0.3281041, -1.50233, 1, 0.2941177, 0, 1,
-1.630306, 0.8103782, -0.8975073, 1, 0.3019608, 0, 1,
-1.610858, -0.4727901, -2.80281, 1, 0.3058824, 0, 1,
-1.604456, -0.5853162, -1.315554, 1, 0.3137255, 0, 1,
-1.597188, 0.6481664, -2.325035, 1, 0.3176471, 0, 1,
-1.592248, 0.003004564, -1.451381, 1, 0.3254902, 0, 1,
-1.572394, -0.700241, -1.791059, 1, 0.3294118, 0, 1,
-1.566338, -1.081987, -1.679539, 1, 0.3372549, 0, 1,
-1.56331, -0.6239295, -1.084679, 1, 0.3411765, 0, 1,
-1.561654, 1.907702, 1.064488, 1, 0.3490196, 0, 1,
-1.558577, -0.6466141, -2.545699, 1, 0.3529412, 0, 1,
-1.544973, 1.95283, -1.961613, 1, 0.3607843, 0, 1,
-1.542778, 1.285343, 0.2646571, 1, 0.3647059, 0, 1,
-1.54126, -1.555908, -3.830889, 1, 0.372549, 0, 1,
-1.534098, 0.7225831, 0.6396236, 1, 0.3764706, 0, 1,
-1.531652, -0.2472627, -3.787522, 1, 0.3843137, 0, 1,
-1.505291, 0.8123537, -2.915746, 1, 0.3882353, 0, 1,
-1.492421, 0.5509851, -0.784157, 1, 0.3960784, 0, 1,
-1.480209, -0.6298566, -2.601492, 1, 0.4039216, 0, 1,
-1.479737, 0.4001811, -0.7160596, 1, 0.4078431, 0, 1,
-1.476902, 0.7852171, 1.049809, 1, 0.4156863, 0, 1,
-1.476686, -0.3936997, -3.116032, 1, 0.4196078, 0, 1,
-1.476176, 0.7871757, -0.165083, 1, 0.427451, 0, 1,
-1.461755, -0.6344001, -1.698406, 1, 0.4313726, 0, 1,
-1.454964, -0.7158688, -1.128995, 1, 0.4392157, 0, 1,
-1.453154, 1.202988, -1.482457, 1, 0.4431373, 0, 1,
-1.450897, 0.4330394, 0.5272857, 1, 0.4509804, 0, 1,
-1.446864, -2.264237, -3.862189, 1, 0.454902, 0, 1,
-1.436316, 1.396563, -0.08100594, 1, 0.4627451, 0, 1,
-1.424035, 0.7861291, 0.8724886, 1, 0.4666667, 0, 1,
-1.407382, -1.799651, -4.366581, 1, 0.4745098, 0, 1,
-1.396185, 0.3054103, -0.7935289, 1, 0.4784314, 0, 1,
-1.389367, -0.3541608, -1.078136, 1, 0.4862745, 0, 1,
-1.385952, -0.1889632, -1.833863, 1, 0.4901961, 0, 1,
-1.378869, -0.3249047, -1.911461, 1, 0.4980392, 0, 1,
-1.374877, -1.758584, -3.675506, 1, 0.5058824, 0, 1,
-1.373733, -0.9837828, -0.8968726, 1, 0.509804, 0, 1,
-1.371152, 0.4278208, -2.261947, 1, 0.5176471, 0, 1,
-1.361444, -0.6830454, -3.660421, 1, 0.5215687, 0, 1,
-1.3359, -0.4419563, -0.9911014, 1, 0.5294118, 0, 1,
-1.333767, -0.2452887, -1.673015, 1, 0.5333334, 0, 1,
-1.323151, -0.7134182, -2.228883, 1, 0.5411765, 0, 1,
-1.315224, 1.484529, -1.413512, 1, 0.5450981, 0, 1,
-1.310541, 1.23868, -0.5215005, 1, 0.5529412, 0, 1,
-1.309993, -0.03563211, -1.754371, 1, 0.5568628, 0, 1,
-1.309657, 0.1349248, -2.223178, 1, 0.5647059, 0, 1,
-1.307081, 1.00617, -0.305767, 1, 0.5686275, 0, 1,
-1.306276, 0.6966841, 0.3333127, 1, 0.5764706, 0, 1,
-1.304349, -2.162607, -1.943637, 1, 0.5803922, 0, 1,
-1.304258, 1.098001, -1.109686, 1, 0.5882353, 0, 1,
-1.294555, -1.120458, -1.878196, 1, 0.5921569, 0, 1,
-1.287565, -0.09802825, -1.652653, 1, 0.6, 0, 1,
-1.286976, -0.5842482, -2.388253, 1, 0.6078432, 0, 1,
-1.283161, -0.6553212, -2.365282, 1, 0.6117647, 0, 1,
-1.282582, -0.963666, -3.839059, 1, 0.6196079, 0, 1,
-1.282478, -1.392286, -2.190129, 1, 0.6235294, 0, 1,
-1.279333, -0.2221501, -2.209206, 1, 0.6313726, 0, 1,
-1.245637, 2.095047, -1.278214, 1, 0.6352941, 0, 1,
-1.239281, -0.4991214, -2.481956, 1, 0.6431373, 0, 1,
-1.227089, 0.7576713, 0.05231185, 1, 0.6470588, 0, 1,
-1.226585, -0.1479881, -3.123317, 1, 0.654902, 0, 1,
-1.223841, -0.3600582, 0.4783206, 1, 0.6588235, 0, 1,
-1.219673, 0.1556406, -3.190724, 1, 0.6666667, 0, 1,
-1.217014, -1.31656, -3.613352, 1, 0.6705883, 0, 1,
-1.205825, 0.5891597, -3.021542, 1, 0.6784314, 0, 1,
-1.198739, 0.6811137, 0.9190574, 1, 0.682353, 0, 1,
-1.194643, -0.3916395, -1.563297, 1, 0.6901961, 0, 1,
-1.1943, 0.496135, -1.414082, 1, 0.6941177, 0, 1,
-1.180827, 0.6138217, -1.747515, 1, 0.7019608, 0, 1,
-1.167199, 0.02336306, -2.190909, 1, 0.7098039, 0, 1,
-1.156736, -0.03661602, -1.537284, 1, 0.7137255, 0, 1,
-1.154043, 0.9369972, -2.287405, 1, 0.7215686, 0, 1,
-1.149233, 0.05766353, -0.7159786, 1, 0.7254902, 0, 1,
-1.146953, 0.5328021, -1.708064, 1, 0.7333333, 0, 1,
-1.143097, 0.05475096, -1.519688, 1, 0.7372549, 0, 1,
-1.141605, 0.3290811, -2.623824, 1, 0.7450981, 0, 1,
-1.140911, -0.07260627, -0.389199, 1, 0.7490196, 0, 1,
-1.139133, 0.8630543, 0.1854801, 1, 0.7568628, 0, 1,
-1.137864, 0.634321, -1.024538, 1, 0.7607843, 0, 1,
-1.130383, 3.022424, -0.285995, 1, 0.7686275, 0, 1,
-1.129583, 0.6681227, -2.322724, 1, 0.772549, 0, 1,
-1.120809, -0.08509007, -0.1858513, 1, 0.7803922, 0, 1,
-1.118995, 1.320928, -1.523551, 1, 0.7843137, 0, 1,
-1.111783, 0.05415942, -0.1948783, 1, 0.7921569, 0, 1,
-1.111052, -1.561339, -2.648469, 1, 0.7960784, 0, 1,
-1.101218, -0.1191003, -1.321541, 1, 0.8039216, 0, 1,
-1.098584, -0.773389, -2.879679, 1, 0.8117647, 0, 1,
-1.098278, 2.081917, 0.4534138, 1, 0.8156863, 0, 1,
-1.091637, -0.1417832, -2.090411, 1, 0.8235294, 0, 1,
-1.082841, 0.7979905, -1.405915, 1, 0.827451, 0, 1,
-1.078548, 0.7870036, 0.4138881, 1, 0.8352941, 0, 1,
-1.070445, 0.3570786, -2.221597, 1, 0.8392157, 0, 1,
-1.061342, -0.04273673, -3.080147, 1, 0.8470588, 0, 1,
-1.060844, 0.5888197, 0.9042889, 1, 0.8509804, 0, 1,
-1.055874, 0.5726519, 0.3585403, 1, 0.8588235, 0, 1,
-1.055283, -2.916115, -1.678651, 1, 0.8627451, 0, 1,
-1.055045, 1.495571, -1.263202, 1, 0.8705882, 0, 1,
-1.05467, -1.197035, -1.349087, 1, 0.8745098, 0, 1,
-1.049041, -0.4471755, -0.9292375, 1, 0.8823529, 0, 1,
-1.046721, 0.6948703, -1.897553, 1, 0.8862745, 0, 1,
-1.046422, 1.326046, -0.467518, 1, 0.8941177, 0, 1,
-1.045641, 1.054824, -0.4800966, 1, 0.8980392, 0, 1,
-1.045592, 1.653039, -0.3302078, 1, 0.9058824, 0, 1,
-1.029127, -0.6678071, -2.975591, 1, 0.9137255, 0, 1,
-1.02353, -1.426817, -3.246945, 1, 0.9176471, 0, 1,
-1.02006, 0.1967194, -1.994693, 1, 0.9254902, 0, 1,
-1.017704, 1.917177, -0.1694149, 1, 0.9294118, 0, 1,
-1.014847, -0.3076465, -1.414015, 1, 0.9372549, 0, 1,
-1.014509, -0.8790534, -1.85635, 1, 0.9411765, 0, 1,
-1.014119, -0.4333936, -3.362649, 1, 0.9490196, 0, 1,
-1.007084, -0.2577675, -1.605566, 1, 0.9529412, 0, 1,
-1.002886, 1.271141, -3.838507, 1, 0.9607843, 0, 1,
-0.9988286, 0.8934742, -1.827101, 1, 0.9647059, 0, 1,
-0.9978539, 0.2583333, -1.517141, 1, 0.972549, 0, 1,
-0.9967486, -1.037628, -2.910715, 1, 0.9764706, 0, 1,
-0.9966313, -1.237862, -0.8238201, 1, 0.9843137, 0, 1,
-0.9941044, 0.2870573, 0.2884584, 1, 0.9882353, 0, 1,
-0.9936919, 0.8611728, -1.545586, 1, 0.9960784, 0, 1,
-0.9853269, 1.634014, -2.041346, 0.9960784, 1, 0, 1,
-0.9802057, 1.668364, -0.8733755, 0.9921569, 1, 0, 1,
-0.9748016, -1.306785, -0.2367066, 0.9843137, 1, 0, 1,
-0.9735071, -0.06840569, -3.08463, 0.9803922, 1, 0, 1,
-0.9693847, -0.4858809, -3.357216, 0.972549, 1, 0, 1,
-0.9661384, 0.3741024, -1.050206, 0.9686275, 1, 0, 1,
-0.9659713, -1.486996, -2.798341, 0.9607843, 1, 0, 1,
-0.9632929, 0.5663077, -0.3375175, 0.9568627, 1, 0, 1,
-0.9616269, 0.1432313, -0.4950055, 0.9490196, 1, 0, 1,
-0.9555411, -0.5098628, -2.293057, 0.945098, 1, 0, 1,
-0.9504458, -1.280394, -1.946881, 0.9372549, 1, 0, 1,
-0.9492323, 0.5147498, -0.7563105, 0.9333333, 1, 0, 1,
-0.938161, -2.208816, -2.700744, 0.9254902, 1, 0, 1,
-0.9377992, -0.02519439, -1.53059, 0.9215686, 1, 0, 1,
-0.9337587, 1.392426, 0.01335888, 0.9137255, 1, 0, 1,
-0.928624, -0.2801858, -2.645102, 0.9098039, 1, 0, 1,
-0.9219651, -0.8296799, -1.901878, 0.9019608, 1, 0, 1,
-0.9219093, 1.772135, -1.253847, 0.8941177, 1, 0, 1,
-0.9085175, 0.2291534, -1.918247, 0.8901961, 1, 0, 1,
-0.9080821, -0.6009374, -2.262614, 0.8823529, 1, 0, 1,
-0.8946459, 0.221021, -3.281549, 0.8784314, 1, 0, 1,
-0.894576, 0.2849019, -1.94134, 0.8705882, 1, 0, 1,
-0.8854634, -0.6203026, -2.141601, 0.8666667, 1, 0, 1,
-0.882991, 1.240196, 1.221678, 0.8588235, 1, 0, 1,
-0.8599725, 0.03739381, -2.014881, 0.854902, 1, 0, 1,
-0.8531755, 0.3955771, 0.6588164, 0.8470588, 1, 0, 1,
-0.8489093, 1.278996, -0.1541044, 0.8431373, 1, 0, 1,
-0.8486247, -0.725755, -1.660861, 0.8352941, 1, 0, 1,
-0.8476635, 0.837743, -1.534718, 0.8313726, 1, 0, 1,
-0.8399363, -0.9707752, -3.022364, 0.8235294, 1, 0, 1,
-0.8370284, -2.045809, -2.756316, 0.8196079, 1, 0, 1,
-0.8301209, -0.8081976, -2.702647, 0.8117647, 1, 0, 1,
-0.8265496, 0.5315914, -0.9607996, 0.8078431, 1, 0, 1,
-0.8208, -0.8482638, -1.797153, 0.8, 1, 0, 1,
-0.801474, 1.589121, -1.000226, 0.7921569, 1, 0, 1,
-0.7956854, 0.7593855, -1.05999, 0.7882353, 1, 0, 1,
-0.7947942, 0.799885, -0.8276822, 0.7803922, 1, 0, 1,
-0.7923828, 2.720932, -2.093356, 0.7764706, 1, 0, 1,
-0.7895751, 0.05095418, -1.709963, 0.7686275, 1, 0, 1,
-0.7860947, -0.1812822, -1.541523, 0.7647059, 1, 0, 1,
-0.7832925, 0.6830179, -0.9759575, 0.7568628, 1, 0, 1,
-0.7791389, -0.3470145, -0.3911229, 0.7529412, 1, 0, 1,
-0.777371, -1.100083, -2.884537, 0.7450981, 1, 0, 1,
-0.7754025, 0.09895422, -1.140447, 0.7411765, 1, 0, 1,
-0.7729787, 0.2089506, -0.3998266, 0.7333333, 1, 0, 1,
-0.772114, 1.151249, 1.173807, 0.7294118, 1, 0, 1,
-0.7643303, -0.6110653, -2.192914, 0.7215686, 1, 0, 1,
-0.7593813, -0.02621231, -0.9660105, 0.7176471, 1, 0, 1,
-0.7592064, -0.1514277, -2.142954, 0.7098039, 1, 0, 1,
-0.7580875, 0.8351216, -2.972521, 0.7058824, 1, 0, 1,
-0.7543613, -2.153353, -1.680673, 0.6980392, 1, 0, 1,
-0.7538741, -0.3736001, -1.38402, 0.6901961, 1, 0, 1,
-0.7479612, -0.6839616, -2.606679, 0.6862745, 1, 0, 1,
-0.7442193, -0.0513421, -1.6081, 0.6784314, 1, 0, 1,
-0.7425194, 0.2131842, -1.574741, 0.6745098, 1, 0, 1,
-0.7404072, -0.1726615, -1.378045, 0.6666667, 1, 0, 1,
-0.7387698, 0.5393226, -1.82855, 0.6627451, 1, 0, 1,
-0.7336177, -1.217447, -1.726939, 0.654902, 1, 0, 1,
-0.7326112, -1.679206, -3.922829, 0.6509804, 1, 0, 1,
-0.7308788, 0.381979, -0.08980708, 0.6431373, 1, 0, 1,
-0.7255346, -0.4156461, -1.383551, 0.6392157, 1, 0, 1,
-0.7206182, 0.7414025, -0.9237602, 0.6313726, 1, 0, 1,
-0.7174959, -1.944188, -3.042444, 0.627451, 1, 0, 1,
-0.7125713, 0.7430291, -0.1999614, 0.6196079, 1, 0, 1,
-0.7098135, -0.8951883, -1.889612, 0.6156863, 1, 0, 1,
-0.7083872, -0.5560942, -1.618744, 0.6078432, 1, 0, 1,
-0.7070207, -0.9081206, -3.109312, 0.6039216, 1, 0, 1,
-0.6953097, -1.158895, -1.248089, 0.5960785, 1, 0, 1,
-0.6937951, 1.121402, -3.103676, 0.5882353, 1, 0, 1,
-0.6917898, 0.3241643, -0.4280682, 0.5843138, 1, 0, 1,
-0.6912864, -0.02004404, -0.1898953, 0.5764706, 1, 0, 1,
-0.6820998, 0.3219109, -1.385103, 0.572549, 1, 0, 1,
-0.6812053, 0.8457295, -0.371801, 0.5647059, 1, 0, 1,
-0.6768228, 0.6091961, 0.5442164, 0.5607843, 1, 0, 1,
-0.6749133, 0.217593, -2.889574, 0.5529412, 1, 0, 1,
-0.6742005, 0.5043909, -0.1620368, 0.5490196, 1, 0, 1,
-0.6728188, -0.5075269, -0.8641916, 0.5411765, 1, 0, 1,
-0.6698658, -0.09170319, 0.1061234, 0.5372549, 1, 0, 1,
-0.6665813, 0.2751614, -0.2176107, 0.5294118, 1, 0, 1,
-0.6655231, -0.3776295, -2.583664, 0.5254902, 1, 0, 1,
-0.6648337, -0.09493841, -0.9433832, 0.5176471, 1, 0, 1,
-0.6644757, -0.1586017, -0.8408829, 0.5137255, 1, 0, 1,
-0.6624173, 1.019626, 0.1562245, 0.5058824, 1, 0, 1,
-0.6611195, -0.8001646, -1.757237, 0.5019608, 1, 0, 1,
-0.6598929, 0.9250946, 0.6711298, 0.4941176, 1, 0, 1,
-0.6588163, -2.172614, -1.859045, 0.4862745, 1, 0, 1,
-0.6567019, -0.1683406, -2.197105, 0.4823529, 1, 0, 1,
-0.6493049, 0.1959215, 0.604726, 0.4745098, 1, 0, 1,
-0.6489393, -0.8320308, -2.854853, 0.4705882, 1, 0, 1,
-0.6481215, -0.3114925, -0.6451191, 0.4627451, 1, 0, 1,
-0.6451329, -0.2785761, -2.830035, 0.4588235, 1, 0, 1,
-0.6411094, -0.5924882, -2.873587, 0.4509804, 1, 0, 1,
-0.6327837, 1.516991, 0.1996386, 0.4470588, 1, 0, 1,
-0.6319729, -1.29983, -2.635743, 0.4392157, 1, 0, 1,
-0.6318042, -0.1595672, -2.275128, 0.4352941, 1, 0, 1,
-0.6275485, 1.736768, -1.469464, 0.427451, 1, 0, 1,
-0.6269189, -0.350723, -2.949096, 0.4235294, 1, 0, 1,
-0.626476, -0.9030626, -1.664755, 0.4156863, 1, 0, 1,
-0.6216309, 1.310366, -0.4536276, 0.4117647, 1, 0, 1,
-0.6208211, -0.2844554, -1.76413, 0.4039216, 1, 0, 1,
-0.6204416, -0.218619, -3.152903, 0.3960784, 1, 0, 1,
-0.6181703, 1.213925, -0.9188229, 0.3921569, 1, 0, 1,
-0.6075742, -1.686597, -1.947784, 0.3843137, 1, 0, 1,
-0.606703, 0.1664277, -0.7054098, 0.3803922, 1, 0, 1,
-0.6066921, 0.1894375, -1.203914, 0.372549, 1, 0, 1,
-0.6065962, 0.04729822, -2.344156, 0.3686275, 1, 0, 1,
-0.5914149, 1.01275, -0.9061764, 0.3607843, 1, 0, 1,
-0.5868294, 1.139516, 1.401877, 0.3568628, 1, 0, 1,
-0.5866255, -0.637973, -1.680829, 0.3490196, 1, 0, 1,
-0.5832064, 0.5202653, -0.9079574, 0.345098, 1, 0, 1,
-0.5800483, -1.243425, -2.3094, 0.3372549, 1, 0, 1,
-0.5741683, 0.002998573, -2.703508, 0.3333333, 1, 0, 1,
-0.5717683, -1.11438, -3.020868, 0.3254902, 1, 0, 1,
-0.5705351, -0.2871812, -3.767782, 0.3215686, 1, 0, 1,
-0.5691657, 1.114129, -1.714241, 0.3137255, 1, 0, 1,
-0.5681962, -0.7522054, -3.291385, 0.3098039, 1, 0, 1,
-0.5654395, 0.004603984, 0.1008109, 0.3019608, 1, 0, 1,
-0.5648469, -2.945296, -3.767292, 0.2941177, 1, 0, 1,
-0.5618259, 0.6730995, -0.1240239, 0.2901961, 1, 0, 1,
-0.5532611, -1.173584, -2.936498, 0.282353, 1, 0, 1,
-0.5494488, -0.7137748, -2.520867, 0.2784314, 1, 0, 1,
-0.548749, -0.2200752, -0.6542317, 0.2705882, 1, 0, 1,
-0.5472472, -1.792135, -2.914315, 0.2666667, 1, 0, 1,
-0.5470928, 0.3644868, -0.2359699, 0.2588235, 1, 0, 1,
-0.546925, 0.1427289, -2.326946, 0.254902, 1, 0, 1,
-0.5413743, -0.9830009, -2.875722, 0.2470588, 1, 0, 1,
-0.5397046, -1.335709, -3.141841, 0.2431373, 1, 0, 1,
-0.5381167, -1.213022, -3.034308, 0.2352941, 1, 0, 1,
-0.5360084, 0.6615214, -2.403802, 0.2313726, 1, 0, 1,
-0.5355057, 0.6220459, -1.531137, 0.2235294, 1, 0, 1,
-0.5352092, 1.255381, 0.0211396, 0.2196078, 1, 0, 1,
-0.5347888, 0.8157426, -1.280707, 0.2117647, 1, 0, 1,
-0.533896, -0.4817928, -1.698239, 0.2078431, 1, 0, 1,
-0.5307239, -1.099101, -4.490427, 0.2, 1, 0, 1,
-0.5263698, 0.6199089, 0.01470444, 0.1921569, 1, 0, 1,
-0.5249217, -0.3443914, -0.8815581, 0.1882353, 1, 0, 1,
-0.5242261, -0.1769051, -3.596363, 0.1803922, 1, 0, 1,
-0.5241607, -0.5179957, -0.9802358, 0.1764706, 1, 0, 1,
-0.5227, -0.6925231, -3.509668, 0.1686275, 1, 0, 1,
-0.5115118, -0.01691771, -1.461011, 0.1647059, 1, 0, 1,
-0.5101948, 0.8620958, -0.6335149, 0.1568628, 1, 0, 1,
-0.5065641, 0.5197657, -1.349127, 0.1529412, 1, 0, 1,
-0.503438, -0.5733377, -1.925465, 0.145098, 1, 0, 1,
-0.498105, 0.4932081, -1.715621, 0.1411765, 1, 0, 1,
-0.4964864, -0.4458368, -4.656008, 0.1333333, 1, 0, 1,
-0.4957846, 0.820577, -0.3225686, 0.1294118, 1, 0, 1,
-0.4823747, -1.092726, -4.796209, 0.1215686, 1, 0, 1,
-0.4806461, 1.038243, -0.4931502, 0.1176471, 1, 0, 1,
-0.4751885, 0.01386553, -0.5414654, 0.1098039, 1, 0, 1,
-0.4750949, -0.1000841, -0.9675027, 0.1058824, 1, 0, 1,
-0.4748923, -0.5571802, -2.970714, 0.09803922, 1, 0, 1,
-0.4737297, 0.2619709, -1.303196, 0.09019608, 1, 0, 1,
-0.4729505, -1.269793, -2.785897, 0.08627451, 1, 0, 1,
-0.4717375, -1.350529, -2.247873, 0.07843138, 1, 0, 1,
-0.466394, -0.08220767, -1.887724, 0.07450981, 1, 0, 1,
-0.4643422, -0.07768552, -1.374454, 0.06666667, 1, 0, 1,
-0.4621462, -1.569446, -4.101859, 0.0627451, 1, 0, 1,
-0.4614958, -0.6719219, -2.822013, 0.05490196, 1, 0, 1,
-0.4579417, -1.190618, -3.219166, 0.05098039, 1, 0, 1,
-0.4541974, 0.7889374, 0.4263908, 0.04313726, 1, 0, 1,
-0.454043, -1.053095, -3.229042, 0.03921569, 1, 0, 1,
-0.4536788, 0.801957, 1.249866, 0.03137255, 1, 0, 1,
-0.4479137, 1.260473, -0.3953178, 0.02745098, 1, 0, 1,
-0.444486, 0.9764962, 0.8920972, 0.01960784, 1, 0, 1,
-0.4439282, -0.2079186, -2.436022, 0.01568628, 1, 0, 1,
-0.4417345, 0.4665818, -0.2442526, 0.007843138, 1, 0, 1,
-0.4415554, 0.05858063, 0.249821, 0.003921569, 1, 0, 1,
-0.4415325, 0.2580419, 0.3379247, 0, 1, 0.003921569, 1,
-0.4382764, 0.2135185, -0.3087318, 0, 1, 0.01176471, 1,
-0.4353364, -1.380773, -1.738945, 0, 1, 0.01568628, 1,
-0.4328857, -1.004733, -1.321569, 0, 1, 0.02352941, 1,
-0.4317421, -0.831187, -1.213378, 0, 1, 0.02745098, 1,
-0.4309298, 0.6954069, -1.587051, 0, 1, 0.03529412, 1,
-0.4259546, -0.7035089, -3.647627, 0, 1, 0.03921569, 1,
-0.4249703, -2.069943, -2.940628, 0, 1, 0.04705882, 1,
-0.4171302, 0.3843696, -1.389348, 0, 1, 0.05098039, 1,
-0.4108973, -1.816566, -3.335186, 0, 1, 0.05882353, 1,
-0.4039841, 1.096616, 0.4842795, 0, 1, 0.0627451, 1,
-0.4025708, 0.8689952, -1.364749, 0, 1, 0.07058824, 1,
-0.3979256, 0.1187011, -0.6521844, 0, 1, 0.07450981, 1,
-0.3960577, -1.049732, -3.312236, 0, 1, 0.08235294, 1,
-0.3941981, 0.1154097, -2.607015, 0, 1, 0.08627451, 1,
-0.3931459, 0.206994, -1.984145, 0, 1, 0.09411765, 1,
-0.3880028, -1.452051, -1.717168, 0, 1, 0.1019608, 1,
-0.3869926, -0.3666143, -1.537925, 0, 1, 0.1058824, 1,
-0.3842851, 0.3850315, -1.919903, 0, 1, 0.1137255, 1,
-0.3825958, -1.524924, -2.047282, 0, 1, 0.1176471, 1,
-0.3810864, 1.618284, 1.622495, 0, 1, 0.1254902, 1,
-0.3798189, 0.8032757, 0.8907545, 0, 1, 0.1294118, 1,
-0.3786966, -1.019765, -2.164999, 0, 1, 0.1372549, 1,
-0.3734245, -0.1571761, -2.831501, 0, 1, 0.1411765, 1,
-0.3704779, -0.3443818, -2.759697, 0, 1, 0.1490196, 1,
-0.3681644, -0.267807, -2.722193, 0, 1, 0.1529412, 1,
-0.3639781, 1.480001, -0.5699382, 0, 1, 0.1607843, 1,
-0.3619624, -0.4610917, -2.449054, 0, 1, 0.1647059, 1,
-0.3608836, 0.3544842, -3.120314, 0, 1, 0.172549, 1,
-0.3607711, -0.1299151, -3.180245, 0, 1, 0.1764706, 1,
-0.359016, -0.2664047, -1.463294, 0, 1, 0.1843137, 1,
-0.354774, 0.07432666, -3.143465, 0, 1, 0.1882353, 1,
-0.354746, 1.11669, 0.1978846, 0, 1, 0.1960784, 1,
-0.3486871, -0.2368106, -1.544934, 0, 1, 0.2039216, 1,
-0.3454731, -0.2183559, -2.671171, 0, 1, 0.2078431, 1,
-0.3408569, -1.186105, -4.970211, 0, 1, 0.2156863, 1,
-0.3402836, -0.8636779, -2.809, 0, 1, 0.2196078, 1,
-0.3402356, 0.670345, 1.478447, 0, 1, 0.227451, 1,
-0.3372509, 0.9750782, -0.986027, 0, 1, 0.2313726, 1,
-0.3371348, 0.33032, 0.3037044, 0, 1, 0.2392157, 1,
-0.3322238, 1.783385, -0.02596095, 0, 1, 0.2431373, 1,
-0.3303451, 0.3073969, 0.612779, 0, 1, 0.2509804, 1,
-0.3232376, 0.9075187, -0.5114065, 0, 1, 0.254902, 1,
-0.3212657, -0.8634003, -2.612852, 0, 1, 0.2627451, 1,
-0.3204668, -1.046988, -4.718752, 0, 1, 0.2666667, 1,
-0.3195371, 0.4536364, -0.04582409, 0, 1, 0.2745098, 1,
-0.3159747, 1.241887, -0.1556511, 0, 1, 0.2784314, 1,
-0.30653, -2.327371, -2.89028, 0, 1, 0.2862745, 1,
-0.3050729, -1.879032, -2.332458, 0, 1, 0.2901961, 1,
-0.3003981, -2.362008, -2.214358, 0, 1, 0.2980392, 1,
-0.2998795, -0.1014739, -1.708443, 0, 1, 0.3058824, 1,
-0.2995664, 1.178229, -0.4545516, 0, 1, 0.3098039, 1,
-0.2986867, 1.708509, -0.4209371, 0, 1, 0.3176471, 1,
-0.2942767, -0.4046555, -2.228917, 0, 1, 0.3215686, 1,
-0.2849489, 1.425706, -2.001771, 0, 1, 0.3294118, 1,
-0.2835065, -1.107994, -4.160558, 0, 1, 0.3333333, 1,
-0.2833552, 0.5223727, -2.012621, 0, 1, 0.3411765, 1,
-0.2833042, -0.7352633, -1.489901, 0, 1, 0.345098, 1,
-0.2819773, -0.899047, -4.661418, 0, 1, 0.3529412, 1,
-0.2780654, -0.3204322, -1.88241, 0, 1, 0.3568628, 1,
-0.2772178, 1.502463, 1.412816, 0, 1, 0.3647059, 1,
-0.2769721, 1.548864, -0.5451453, 0, 1, 0.3686275, 1,
-0.2748158, -0.1784836, -2.710815, 0, 1, 0.3764706, 1,
-0.2743186, 1.130877, 0.4059989, 0, 1, 0.3803922, 1,
-0.2739998, -0.01324566, -0.890736, 0, 1, 0.3882353, 1,
-0.2714902, -0.7482316, -5.064564, 0, 1, 0.3921569, 1,
-0.2624714, -0.2788745, -1.26909, 0, 1, 0.4, 1,
-0.2580591, -0.8821594, -2.977794, 0, 1, 0.4078431, 1,
-0.2513492, 0.1614603, -0.8216882, 0, 1, 0.4117647, 1,
-0.2480032, 1.415255, -0.7571167, 0, 1, 0.4196078, 1,
-0.2434584, -1.862872, -2.611968, 0, 1, 0.4235294, 1,
-0.243048, -0.01986914, -1.304543, 0, 1, 0.4313726, 1,
-0.2384232, 0.9237647, 0.06612024, 0, 1, 0.4352941, 1,
-0.2375496, 1.376795, -0.6870089, 0, 1, 0.4431373, 1,
-0.2358802, -0.6838217, -3.304717, 0, 1, 0.4470588, 1,
-0.2358187, -0.440133, -2.974751, 0, 1, 0.454902, 1,
-0.2336869, 0.1814808, -2.060046, 0, 1, 0.4588235, 1,
-0.2327158, -0.2674583, -2.20967, 0, 1, 0.4666667, 1,
-0.2308535, 1.069245, -0.6595641, 0, 1, 0.4705882, 1,
-0.2295425, -0.7975316, -4.167332, 0, 1, 0.4784314, 1,
-0.22492, 0.02753007, -1.607147, 0, 1, 0.4823529, 1,
-0.2246368, -0.2300588, -2.996373, 0, 1, 0.4901961, 1,
-0.2149075, -1.732618, -2.845631, 0, 1, 0.4941176, 1,
-0.2089508, 1.615651, -1.700809, 0, 1, 0.5019608, 1,
-0.2058159, -2.105844, -2.053005, 0, 1, 0.509804, 1,
-0.2056211, 0.4439165, 0.5074463, 0, 1, 0.5137255, 1,
-0.2011639, 0.8264409, -1.906444, 0, 1, 0.5215687, 1,
-0.1990855, 1.574337, -1.718469, 0, 1, 0.5254902, 1,
-0.1978866, 0.5656857, -1.546465, 0, 1, 0.5333334, 1,
-0.1946914, 0.2230682, -1.625791, 0, 1, 0.5372549, 1,
-0.1919019, -0.8906307, -2.742757, 0, 1, 0.5450981, 1,
-0.1917594, 0.6955082, 0.145231, 0, 1, 0.5490196, 1,
-0.1909113, -1.092589, -1.099274, 0, 1, 0.5568628, 1,
-0.1902312, 0.2378714, 0.3131545, 0, 1, 0.5607843, 1,
-0.1870774, -0.05966648, -1.912002, 0, 1, 0.5686275, 1,
-0.1833005, 0.7908986, 0.4129341, 0, 1, 0.572549, 1,
-0.1796741, 0.5218054, -1.560052, 0, 1, 0.5803922, 1,
-0.178573, 1.430761, 0.3607853, 0, 1, 0.5843138, 1,
-0.1764603, -1.364197, -2.084605, 0, 1, 0.5921569, 1,
-0.1744726, -0.4371055, -1.287658, 0, 1, 0.5960785, 1,
-0.1726724, -0.3765608, -1.341381, 0, 1, 0.6039216, 1,
-0.1701273, -1.908472, -4.079743, 0, 1, 0.6117647, 1,
-0.1699787, 1.28356, 1.997076, 0, 1, 0.6156863, 1,
-0.1690581, 0.3803863, 0.2931319, 0, 1, 0.6235294, 1,
-0.1681566, 0.5300682, -1.029218, 0, 1, 0.627451, 1,
-0.1678482, 0.2593426, -1.230946, 0, 1, 0.6352941, 1,
-0.1475423, -0.2205055, -2.493615, 0, 1, 0.6392157, 1,
-0.1401744, 0.6223527, -0.3635476, 0, 1, 0.6470588, 1,
-0.1372708, 0.2665557, 0.3073676, 0, 1, 0.6509804, 1,
-0.1371342, -1.039753, -3.30194, 0, 1, 0.6588235, 1,
-0.1369666, 0.3347303, -1.168301, 0, 1, 0.6627451, 1,
-0.1333163, 0.5372023, 2.283634, 0, 1, 0.6705883, 1,
-0.1333038, 0.515225, -1.39739, 0, 1, 0.6745098, 1,
-0.129157, 1.35263, -1.378504, 0, 1, 0.682353, 1,
-0.1258839, 0.1038827, -0.9123358, 0, 1, 0.6862745, 1,
-0.1247443, -0.7394265, -3.465966, 0, 1, 0.6941177, 1,
-0.1219373, -0.8006875, -2.528968, 0, 1, 0.7019608, 1,
-0.1212877, 1.560484, 0.3221069, 0, 1, 0.7058824, 1,
-0.1107614, 0.9673203, -0.1945484, 0, 1, 0.7137255, 1,
-0.1071417, -0.3313703, -2.286817, 0, 1, 0.7176471, 1,
-0.1053864, -0.2813451, -2.406566, 0, 1, 0.7254902, 1,
-0.1039767, 1.800693, 0.4323241, 0, 1, 0.7294118, 1,
-0.100723, 0.7383837, -1.54995, 0, 1, 0.7372549, 1,
-0.09945574, 0.1698928, -0.265752, 0, 1, 0.7411765, 1,
-0.09518418, -1.360952, -1.502611, 0, 1, 0.7490196, 1,
-0.08878332, -0.009205303, -1.040166, 0, 1, 0.7529412, 1,
-0.08785729, 0.3395577, -1.507133, 0, 1, 0.7607843, 1,
-0.08265008, 1.650983, 0.7163503, 0, 1, 0.7647059, 1,
-0.07301219, 0.7754856, 1.277281, 0, 1, 0.772549, 1,
-0.07246582, -0.2789207, -3.418609, 0, 1, 0.7764706, 1,
-0.07125667, 0.4262148, 0.9325538, 0, 1, 0.7843137, 1,
-0.07014726, -0.3398692, -3.199766, 0, 1, 0.7882353, 1,
-0.06929483, -0.671477, -3.21471, 0, 1, 0.7960784, 1,
-0.06630633, 0.5658563, 0.0189577, 0, 1, 0.8039216, 1,
-0.06147426, -0.5896747, -2.533729, 0, 1, 0.8078431, 1,
-0.05705921, 1.550295, 0.4340529, 0, 1, 0.8156863, 1,
-0.05558064, 2.072726, -0.488582, 0, 1, 0.8196079, 1,
-0.0513377, 1.040186, -1.645287, 0, 1, 0.827451, 1,
-0.04951838, 1.009805, 1.313644, 0, 1, 0.8313726, 1,
-0.04934896, -2.554608, -2.628165, 0, 1, 0.8392157, 1,
-0.04869774, 1.701295, -0.6996185, 0, 1, 0.8431373, 1,
-0.04594044, -0.7685181, -3.588581, 0, 1, 0.8509804, 1,
-0.04471663, -3.464866, -5.006262, 0, 1, 0.854902, 1,
-0.04007591, 0.2553146, -1.617274, 0, 1, 0.8627451, 1,
-0.03611895, 1.12815, -2.022189, 0, 1, 0.8666667, 1,
-0.03515204, -0.7488942, -3.038765, 0, 1, 0.8745098, 1,
-0.03312717, -0.4410936, -2.439373, 0, 1, 0.8784314, 1,
-0.03212684, 0.6947395, -0.461132, 0, 1, 0.8862745, 1,
-0.03154444, -0.2659937, -3.407085, 0, 1, 0.8901961, 1,
-0.03128758, 0.9017296, -1.44089, 0, 1, 0.8980392, 1,
-0.03090789, -0.7873918, -3.480695, 0, 1, 0.9058824, 1,
-0.02793116, -1.305445, -3.653107, 0, 1, 0.9098039, 1,
-0.02532301, 0.09320291, -0.2212182, 0, 1, 0.9176471, 1,
-0.02126069, 0.402459, 0.3371288, 0, 1, 0.9215686, 1,
-0.01987844, 0.417815, 2.323159, 0, 1, 0.9294118, 1,
-0.01985929, -0.1265042, -2.538469, 0, 1, 0.9333333, 1,
-0.0178421, -0.328534, -0.9167303, 0, 1, 0.9411765, 1,
-0.01022012, -1.640775, -2.917096, 0, 1, 0.945098, 1,
-0.008426412, 0.07175834, 0.289377, 0, 1, 0.9529412, 1,
-0.007285489, -1.501456, -4.146163, 0, 1, 0.9568627, 1,
0.0003472968, -1.544024, 1.855789, 0, 1, 0.9647059, 1,
0.0006601444, -0.8771412, 2.628788, 0, 1, 0.9686275, 1,
0.0006607851, -0.337076, 3.592535, 0, 1, 0.9764706, 1,
0.004470293, 0.2831409, 0.8998467, 0, 1, 0.9803922, 1,
0.007446904, 1.660181, -0.1203122, 0, 1, 0.9882353, 1,
0.008476589, 2.512288, 0.4151428, 0, 1, 0.9921569, 1,
0.009301497, 0.1199659, 0.8103496, 0, 1, 1, 1,
0.01139535, -0.8878715, 5.505229, 0, 0.9921569, 1, 1,
0.0117414, -0.4151669, 3.961374, 0, 0.9882353, 1, 1,
0.01359054, 0.5836024, -0.5430426, 0, 0.9803922, 1, 1,
0.02312422, 0.3578871, 1.812304, 0, 0.9764706, 1, 1,
0.023747, -0.7465122, 4.01496, 0, 0.9686275, 1, 1,
0.02719873, 0.2472538, -1.736383, 0, 0.9647059, 1, 1,
0.03911017, -0.19008, 2.413215, 0, 0.9568627, 1, 1,
0.03956106, -0.05341163, 1.24792, 0, 0.9529412, 1, 1,
0.04254726, -0.5014911, 0.5405495, 0, 0.945098, 1, 1,
0.05426072, -1.068067, 1.836169, 0, 0.9411765, 1, 1,
0.057404, -1.278748, 2.745411, 0, 0.9333333, 1, 1,
0.05920114, 2.095271, 1.095908, 0, 0.9294118, 1, 1,
0.06873465, 0.753106, 0.3818743, 0, 0.9215686, 1, 1,
0.06953439, -0.01260807, 2.16569, 0, 0.9176471, 1, 1,
0.07448575, -0.7295665, 3.583409, 0, 0.9098039, 1, 1,
0.0809384, 0.007766526, 0.854687, 0, 0.9058824, 1, 1,
0.08096176, -2.086734, 2.584996, 0, 0.8980392, 1, 1,
0.08172562, 1.501204, 2.198915, 0, 0.8901961, 1, 1,
0.08303806, 0.289547, -1.29819, 0, 0.8862745, 1, 1,
0.08354338, 0.2285455, 1.403066, 0, 0.8784314, 1, 1,
0.0849935, -1.139296, 3.438175, 0, 0.8745098, 1, 1,
0.08586835, 1.322574, -0.7422643, 0, 0.8666667, 1, 1,
0.0878547, 0.6422403, -0.3401908, 0, 0.8627451, 1, 1,
0.08837486, 0.9149571, 3.49817, 0, 0.854902, 1, 1,
0.0890874, -0.529274, 2.093495, 0, 0.8509804, 1, 1,
0.09042665, -2.012023, 2.76483, 0, 0.8431373, 1, 1,
0.09512942, 0.3318325, -0.2807559, 0, 0.8392157, 1, 1,
0.09673741, -1.210296, 3.25892, 0, 0.8313726, 1, 1,
0.09908139, 0.07635368, 1.475397, 0, 0.827451, 1, 1,
0.1052716, 2.131271, -0.8801273, 0, 0.8196079, 1, 1,
0.109598, 1.23058, 0.9293495, 0, 0.8156863, 1, 1,
0.1106231, 0.1273282, 0.928921, 0, 0.8078431, 1, 1,
0.1122594, -0.5822344, 3.047251, 0, 0.8039216, 1, 1,
0.1180161, -0.7429247, 2.799406, 0, 0.7960784, 1, 1,
0.1226265, -0.3299665, 2.821805, 0, 0.7882353, 1, 1,
0.1243, 0.2382306, -0.7782049, 0, 0.7843137, 1, 1,
0.1256161, -0.5465257, 4.106746, 0, 0.7764706, 1, 1,
0.1367472, -0.3082558, 4.286955, 0, 0.772549, 1, 1,
0.1370039, 3.319293, 0.4197432, 0, 0.7647059, 1, 1,
0.1372588, 1.248936, -1.318078, 0, 0.7607843, 1, 1,
0.1385553, 1.162183, -0.5373036, 0, 0.7529412, 1, 1,
0.1388741, -0.2001671, 2.104679, 0, 0.7490196, 1, 1,
0.1430613, -0.09155645, 2.189654, 0, 0.7411765, 1, 1,
0.1456559, -0.4958411, 4.041308, 0, 0.7372549, 1, 1,
0.1538569, -0.4338684, 4.362568, 0, 0.7294118, 1, 1,
0.1557897, -0.1835704, 1.902719, 0, 0.7254902, 1, 1,
0.1565241, 0.01133402, 1.388994, 0, 0.7176471, 1, 1,
0.1575475, -1.050776, 2.312837, 0, 0.7137255, 1, 1,
0.1620661, -0.6989571, 1.619394, 0, 0.7058824, 1, 1,
0.1640159, 0.03799991, 0.9662695, 0, 0.6980392, 1, 1,
0.1643488, -1.013486, 2.822152, 0, 0.6941177, 1, 1,
0.1680971, -1.746184, 0.7768834, 0, 0.6862745, 1, 1,
0.1682192, 0.5835652, 0.6502094, 0, 0.682353, 1, 1,
0.1713816, -1.621948, 0.3664297, 0, 0.6745098, 1, 1,
0.1786483, 1.130448, 0.07668144, 0, 0.6705883, 1, 1,
0.181703, -0.596704, 1.226957, 0, 0.6627451, 1, 1,
0.18527, -0.4860654, 1.872773, 0, 0.6588235, 1, 1,
0.1923327, 0.2330017, 1.5939, 0, 0.6509804, 1, 1,
0.1955634, -0.3204464, 2.220932, 0, 0.6470588, 1, 1,
0.1991386, -1.559877, 2.725057, 0, 0.6392157, 1, 1,
0.1993188, 0.2296211, 1.322885, 0, 0.6352941, 1, 1,
0.2013671, -1.979544, 2.865659, 0, 0.627451, 1, 1,
0.2033567, -0.8714239, 2.849447, 0, 0.6235294, 1, 1,
0.2044118, -0.2357566, 2.325769, 0, 0.6156863, 1, 1,
0.2069123, -1.478402, 3.188987, 0, 0.6117647, 1, 1,
0.2069427, -0.3301842, 1.724341, 0, 0.6039216, 1, 1,
0.2142553, 0.3527078, -0.9173357, 0, 0.5960785, 1, 1,
0.2167053, 1.392912, 1.091741, 0, 0.5921569, 1, 1,
0.2190278, -2.398439, 3.312444, 0, 0.5843138, 1, 1,
0.221837, 0.2740306, 0.4794983, 0, 0.5803922, 1, 1,
0.2248461, -0.1676043, 1.94826, 0, 0.572549, 1, 1,
0.2257036, -0.1484865, 0.4680619, 0, 0.5686275, 1, 1,
0.2323711, 0.06465366, 1.269692, 0, 0.5607843, 1, 1,
0.2343003, 1.144274, 0.1090442, 0, 0.5568628, 1, 1,
0.2348184, 0.8981472, 1.005838, 0, 0.5490196, 1, 1,
0.2423787, -1.617894, 3.341694, 0, 0.5450981, 1, 1,
0.2444277, -0.316943, 2.107343, 0, 0.5372549, 1, 1,
0.2461078, -0.3833796, 2.655355, 0, 0.5333334, 1, 1,
0.2467197, 0.8244069, -0.9231412, 0, 0.5254902, 1, 1,
0.2495635, 0.8033842, -0.2880113, 0, 0.5215687, 1, 1,
0.2504267, 1.112041, 0.353168, 0, 0.5137255, 1, 1,
0.2513546, 2.081064, 1.419506, 0, 0.509804, 1, 1,
0.2515548, 1.14888, -0.8977153, 0, 0.5019608, 1, 1,
0.2575009, 1.09922, 1.327665, 0, 0.4941176, 1, 1,
0.2577879, -0.897746, 3.605474, 0, 0.4901961, 1, 1,
0.2583953, 0.6162354, 2.23991, 0, 0.4823529, 1, 1,
0.2603883, 0.2933517, 2.400227, 0, 0.4784314, 1, 1,
0.2605632, 0.5779546, -0.7063565, 0, 0.4705882, 1, 1,
0.2616273, -0.08474245, 2.210866, 0, 0.4666667, 1, 1,
0.2623438, -0.133576, 1.329641, 0, 0.4588235, 1, 1,
0.262637, -0.2813346, 3.510475, 0, 0.454902, 1, 1,
0.2637759, -0.2759753, 4.486967, 0, 0.4470588, 1, 1,
0.2642806, -1.487888, 1.656445, 0, 0.4431373, 1, 1,
0.2661608, 0.1608876, 1.663157, 0, 0.4352941, 1, 1,
0.267267, -0.4741117, 2.418721, 0, 0.4313726, 1, 1,
0.2750883, 0.5815899, 0.3643826, 0, 0.4235294, 1, 1,
0.2790191, 0.9145254, 0.371616, 0, 0.4196078, 1, 1,
0.2808687, 0.3853884, -1.577744, 0, 0.4117647, 1, 1,
0.2832814, 0.7674253, 0.8221463, 0, 0.4078431, 1, 1,
0.2841171, -0.6742252, 2.610988, 0, 0.4, 1, 1,
0.2875395, -0.9281592, 2.98301, 0, 0.3921569, 1, 1,
0.2879933, 1.05226, 1.316399, 0, 0.3882353, 1, 1,
0.2883963, -0.3325158, 3.32626, 0, 0.3803922, 1, 1,
0.2949294, -0.7973839, 1.868067, 0, 0.3764706, 1, 1,
0.2996123, -0.704484, 4.7317, 0, 0.3686275, 1, 1,
0.3011326, 0.4911929, -0.1051227, 0, 0.3647059, 1, 1,
0.3014902, -0.6879854, 3.737712, 0, 0.3568628, 1, 1,
0.3042164, -1.44449, 2.864009, 0, 0.3529412, 1, 1,
0.3060295, 0.2769826, 0.3347926, 0, 0.345098, 1, 1,
0.3143944, 0.082689, 0.7077648, 0, 0.3411765, 1, 1,
0.3144007, 1.230389, -1.337739, 0, 0.3333333, 1, 1,
0.3146496, 1.008753, 1.072729, 0, 0.3294118, 1, 1,
0.3150876, -1.807326, 2.735213, 0, 0.3215686, 1, 1,
0.3318985, -1.213412, 4.728899, 0, 0.3176471, 1, 1,
0.3333723, 0.4090065, -1.253471, 0, 0.3098039, 1, 1,
0.3383693, 0.4757218, 0.4158525, 0, 0.3058824, 1, 1,
0.3447736, 0.6261753, -1.606008, 0, 0.2980392, 1, 1,
0.355642, -0.3322401, 1.896249, 0, 0.2901961, 1, 1,
0.3567537, -0.17555, 2.881375, 0, 0.2862745, 1, 1,
0.3568324, 2.367891, 0.4985838, 0, 0.2784314, 1, 1,
0.360004, 1.522584, -0.5128953, 0, 0.2745098, 1, 1,
0.3603216, 0.07958923, 0.9105662, 0, 0.2666667, 1, 1,
0.3621146, -0.1133275, 2.855036, 0, 0.2627451, 1, 1,
0.3642923, -0.8846392, 2.021901, 0, 0.254902, 1, 1,
0.3647878, 1.643829, 1.165554, 0, 0.2509804, 1, 1,
0.3657046, 0.05157855, 3.134344, 0, 0.2431373, 1, 1,
0.3673615, 1.466822, 0.5363909, 0, 0.2392157, 1, 1,
0.3725436, 1.275386, 0.5487789, 0, 0.2313726, 1, 1,
0.3735848, 0.03770547, 2.618828, 0, 0.227451, 1, 1,
0.3737304, -1.744114, 3.745647, 0, 0.2196078, 1, 1,
0.3750217, 0.4310595, 1.096548, 0, 0.2156863, 1, 1,
0.3790241, 0.2702418, 0.6016811, 0, 0.2078431, 1, 1,
0.3849896, -0.8894839, 3.498464, 0, 0.2039216, 1, 1,
0.3869681, 0.0005546622, 1.806555, 0, 0.1960784, 1, 1,
0.3886375, -1.442477, 0.6490239, 0, 0.1882353, 1, 1,
0.3943693, 0.06985722, 1.613536, 0, 0.1843137, 1, 1,
0.3957498, -0.9225025, 3.594737, 0, 0.1764706, 1, 1,
0.398442, 1.878499, 0.3986576, 0, 0.172549, 1, 1,
0.3989947, -0.4667849, 3.772613, 0, 0.1647059, 1, 1,
0.4061577, -1.905022, 3.191315, 0, 0.1607843, 1, 1,
0.406466, -0.04638664, 1.445016, 0, 0.1529412, 1, 1,
0.4105817, -1.259264, 3.410543, 0, 0.1490196, 1, 1,
0.4106106, 0.4725801, -0.1414791, 0, 0.1411765, 1, 1,
0.4145658, -0.864215, 3.778654, 0, 0.1372549, 1, 1,
0.4156252, -2.851845, 3.455596, 0, 0.1294118, 1, 1,
0.4157892, 1.243451, -1.524267, 0, 0.1254902, 1, 1,
0.4173904, -1.510899, 2.437274, 0, 0.1176471, 1, 1,
0.4201021, 0.296609, 0.8332852, 0, 0.1137255, 1, 1,
0.4231058, 1.231588, -0.07054694, 0, 0.1058824, 1, 1,
0.4245887, -0.9100451, 2.360057, 0, 0.09803922, 1, 1,
0.4261404, -0.3949378, 1.713473, 0, 0.09411765, 1, 1,
0.4299588, 0.07144009, 1.424099, 0, 0.08627451, 1, 1,
0.434175, 0.2062351, 2.012407, 0, 0.08235294, 1, 1,
0.4344864, -0.02005941, 2.808111, 0, 0.07450981, 1, 1,
0.4386933, -0.8612255, 3.561555, 0, 0.07058824, 1, 1,
0.4387231, 1.71725, 1.416919, 0, 0.0627451, 1, 1,
0.4398765, 0.9726612, 1.625494, 0, 0.05882353, 1, 1,
0.4402115, 0.6272181, -0.5520094, 0, 0.05098039, 1, 1,
0.440795, -1.04257, 2.680354, 0, 0.04705882, 1, 1,
0.441589, 1.018012, 0.5485123, 0, 0.03921569, 1, 1,
0.4418071, -0.4877585, 2.961, 0, 0.03529412, 1, 1,
0.4430205, 1.524504, 0.2143269, 0, 0.02745098, 1, 1,
0.4456393, 0.4591441, 1.944576, 0, 0.02352941, 1, 1,
0.4506881, 0.4263088, 1.81651, 0, 0.01568628, 1, 1,
0.4507843, 0.8109463, 1.814933, 0, 0.01176471, 1, 1,
0.4544237, 0.3324771, -0.5552341, 0, 0.003921569, 1, 1,
0.4591749, -1.893682, 2.515667, 0.003921569, 0, 1, 1,
0.4597035, 1.156885, 0.9402236, 0.007843138, 0, 1, 1,
0.4636149, -1.379326, 2.54968, 0.01568628, 0, 1, 1,
0.4637886, 1.838296, -0.92444, 0.01960784, 0, 1, 1,
0.4678782, -0.1525916, 2.510212, 0.02745098, 0, 1, 1,
0.4733531, 0.9259564, 2.028254, 0.03137255, 0, 1, 1,
0.4737219, -0.4275877, 2.079669, 0.03921569, 0, 1, 1,
0.4744617, 1.307459, -0.9057616, 0.04313726, 0, 1, 1,
0.4776061, -0.5799468, 1.048895, 0.05098039, 0, 1, 1,
0.4801553, 0.6264829, 0.2662056, 0.05490196, 0, 1, 1,
0.4856077, 0.45998, 1.377948, 0.0627451, 0, 1, 1,
0.4884407, -0.08076203, 1.948429, 0.06666667, 0, 1, 1,
0.4899818, 0.1851909, 0.5434111, 0.07450981, 0, 1, 1,
0.491065, -0.582531, 2.287748, 0.07843138, 0, 1, 1,
0.4960251, 0.4186135, 0.7361145, 0.08627451, 0, 1, 1,
0.4966627, -0.6118845, 2.143411, 0.09019608, 0, 1, 1,
0.4993737, 1.895426, 1.872425, 0.09803922, 0, 1, 1,
0.5020135, 0.2090051, -0.1660316, 0.1058824, 0, 1, 1,
0.5022979, 0.2069298, 2.126639, 0.1098039, 0, 1, 1,
0.5133312, -0.2004894, 3.340342, 0.1176471, 0, 1, 1,
0.5140429, 0.9836027, -1.065824, 0.1215686, 0, 1, 1,
0.515939, -0.6440778, 1.370602, 0.1294118, 0, 1, 1,
0.5202114, -1.297704, 2.969608, 0.1333333, 0, 1, 1,
0.520721, 0.6467879, -0.2827802, 0.1411765, 0, 1, 1,
0.5209198, 1.549281, -0.1098081, 0.145098, 0, 1, 1,
0.5253121, 1.562777, 1.233804, 0.1529412, 0, 1, 1,
0.5282488, -0.9027631, 3.816681, 0.1568628, 0, 1, 1,
0.531252, 1.038951, 0.1412725, 0.1647059, 0, 1, 1,
0.5445691, -0.1415341, 1.146688, 0.1686275, 0, 1, 1,
0.5450237, 0.2131165, 1.574011, 0.1764706, 0, 1, 1,
0.5452262, 1.738272, -0.2429799, 0.1803922, 0, 1, 1,
0.5496402, 0.4897634, 1.517562, 0.1882353, 0, 1, 1,
0.5542163, -0.4132418, 2.232392, 0.1921569, 0, 1, 1,
0.5543606, -1.782234, 2.508683, 0.2, 0, 1, 1,
0.5607005, -0.2678159, 2.544959, 0.2078431, 0, 1, 1,
0.5611774, 0.3424173, -0.8832939, 0.2117647, 0, 1, 1,
0.5679953, -0.6060717, 1.208625, 0.2196078, 0, 1, 1,
0.5719456, -0.7037435, 2.940866, 0.2235294, 0, 1, 1,
0.5760767, -0.4714912, 1.932789, 0.2313726, 0, 1, 1,
0.5765224, 1.643228, -1.09612, 0.2352941, 0, 1, 1,
0.5811312, -0.7194612, 2.972407, 0.2431373, 0, 1, 1,
0.5828066, -0.4966017, 2.269298, 0.2470588, 0, 1, 1,
0.5828823, 0.7915214, 2.292163, 0.254902, 0, 1, 1,
0.5848101, 0.172587, -0.2708872, 0.2588235, 0, 1, 1,
0.5850524, -0.226078, 0.8208538, 0.2666667, 0, 1, 1,
0.5860215, -0.9170036, 2.307752, 0.2705882, 0, 1, 1,
0.5871666, -0.2927789, 1.908244, 0.2784314, 0, 1, 1,
0.5891173, 0.6196425, 0.7552106, 0.282353, 0, 1, 1,
0.5902153, -0.1034466, 0.5747188, 0.2901961, 0, 1, 1,
0.5957422, 0.3080675, 0.1005693, 0.2941177, 0, 1, 1,
0.5966699, -0.9497598, 2.924294, 0.3019608, 0, 1, 1,
0.5983647, 0.5853042, -0.2848151, 0.3098039, 0, 1, 1,
0.5985427, -1.075791, 4.163892, 0.3137255, 0, 1, 1,
0.5993733, 0.1813736, 0.4844607, 0.3215686, 0, 1, 1,
0.5997655, 0.9683738, 1.283943, 0.3254902, 0, 1, 1,
0.6035165, 0.3065294, 1.400195, 0.3333333, 0, 1, 1,
0.6052186, 1.058881, 0.8520623, 0.3372549, 0, 1, 1,
0.6073278, -1.496508, 4.407048, 0.345098, 0, 1, 1,
0.6127782, 1.616986, 2.60992, 0.3490196, 0, 1, 1,
0.6139162, 1.25897, -1.988362, 0.3568628, 0, 1, 1,
0.6168557, 1.666187, 1.647062, 0.3607843, 0, 1, 1,
0.6192897, 2.377025, -1.23096, 0.3686275, 0, 1, 1,
0.6242995, -0.141659, 0.9060777, 0.372549, 0, 1, 1,
0.6246093, 0.3858605, 2.014215, 0.3803922, 0, 1, 1,
0.626363, 0.8706538, 0.7369226, 0.3843137, 0, 1, 1,
0.6312072, 0.4176202, 1.983784, 0.3921569, 0, 1, 1,
0.6377872, 0.3680523, 1.451771, 0.3960784, 0, 1, 1,
0.6423965, -2.039532, 2.103842, 0.4039216, 0, 1, 1,
0.6429102, 0.2514549, 1.078792, 0.4117647, 0, 1, 1,
0.642931, 0.6234423, 1.104819, 0.4156863, 0, 1, 1,
0.6487824, 0.9610207, 1.212505, 0.4235294, 0, 1, 1,
0.6490855, 1.152784, 1.232428, 0.427451, 0, 1, 1,
0.6583619, -2.563606, 2.422583, 0.4352941, 0, 1, 1,
0.6632087, 0.7735546, 0.8318694, 0.4392157, 0, 1, 1,
0.6638004, 0.2139572, 0.5048527, 0.4470588, 0, 1, 1,
0.6788444, 0.678929, 2.777703, 0.4509804, 0, 1, 1,
0.678874, 1.768836, 0.978192, 0.4588235, 0, 1, 1,
0.6812727, 1.028964, 1.811912, 0.4627451, 0, 1, 1,
0.6816849, -1.362904, 3.125655, 0.4705882, 0, 1, 1,
0.6825186, -0.7223031, 2.424642, 0.4745098, 0, 1, 1,
0.6827617, 0.2245599, 2.048411, 0.4823529, 0, 1, 1,
0.682831, -2.942827, 4.07478, 0.4862745, 0, 1, 1,
0.6836099, -0.244699, 1.854779, 0.4941176, 0, 1, 1,
0.6842823, -0.3300567, 1.982888, 0.5019608, 0, 1, 1,
0.6844784, 2.492339, 0.3576967, 0.5058824, 0, 1, 1,
0.6846463, 0.4970492, 1.481047, 0.5137255, 0, 1, 1,
0.6862555, -1.627703, 1.968497, 0.5176471, 0, 1, 1,
0.6868448, 0.5347703, 1.57905, 0.5254902, 0, 1, 1,
0.6876326, 0.8336233, -0.3127315, 0.5294118, 0, 1, 1,
0.6952851, -0.7997189, 3.116319, 0.5372549, 0, 1, 1,
0.6955534, -1.633786, 2.607014, 0.5411765, 0, 1, 1,
0.7045269, -1.999892, 2.12247, 0.5490196, 0, 1, 1,
0.7123611, 0.8170255, 1.155242, 0.5529412, 0, 1, 1,
0.716353, 0.3489226, 0.01327334, 0.5607843, 0, 1, 1,
0.7166409, 1.006558, 0.7215364, 0.5647059, 0, 1, 1,
0.7173154, -0.9614811, 1.461606, 0.572549, 0, 1, 1,
0.7185845, -2.522725, 2.978681, 0.5764706, 0, 1, 1,
0.7214278, -0.2487485, 1.488499, 0.5843138, 0, 1, 1,
0.7264008, -1.40154, 3.326308, 0.5882353, 0, 1, 1,
0.7286715, 1.259709, 0.5608637, 0.5960785, 0, 1, 1,
0.7307315, -1.290347, 3.197434, 0.6039216, 0, 1, 1,
0.7366971, -0.2517579, 1.487384, 0.6078432, 0, 1, 1,
0.737915, -1.133475, 4.502428, 0.6156863, 0, 1, 1,
0.7459458, 1.611268, -0.4778556, 0.6196079, 0, 1, 1,
0.7505848, 0.3773561, 0.3249128, 0.627451, 0, 1, 1,
0.7523381, 0.236831, 0.8812742, 0.6313726, 0, 1, 1,
0.7526166, -0.753492, 3.281478, 0.6392157, 0, 1, 1,
0.7535424, 0.8004968, 0.1699894, 0.6431373, 0, 1, 1,
0.758991, 1.920731, 0.8157641, 0.6509804, 0, 1, 1,
0.7593866, 0.7271431, 2.097402, 0.654902, 0, 1, 1,
0.7594357, 0.6034984, 0.3023526, 0.6627451, 0, 1, 1,
0.7636203, -1.197916, 3.275112, 0.6666667, 0, 1, 1,
0.7650097, -0.2692294, 4.239074, 0.6745098, 0, 1, 1,
0.7666456, -0.3931929, 0.4042576, 0.6784314, 0, 1, 1,
0.7668929, 0.06683521, 0.6091856, 0.6862745, 0, 1, 1,
0.7708377, -1.20349, 3.110539, 0.6901961, 0, 1, 1,
0.7784849, -1.746326, 2.395512, 0.6980392, 0, 1, 1,
0.7853853, -1.561984, 3.081428, 0.7058824, 0, 1, 1,
0.7862595, 0.9695601, 1.348915, 0.7098039, 0, 1, 1,
0.7913456, 1.477465, 0.792726, 0.7176471, 0, 1, 1,
0.7930604, -0.9881315, 2.42578, 0.7215686, 0, 1, 1,
0.798121, 0.5414668, 1.202577, 0.7294118, 0, 1, 1,
0.7988676, 1.411581, 1.927937, 0.7333333, 0, 1, 1,
0.8037101, 0.1000701, 0.5357934, 0.7411765, 0, 1, 1,
0.8117933, -0.04046793, 1.430401, 0.7450981, 0, 1, 1,
0.81327, 0.6971713, 2.209982, 0.7529412, 0, 1, 1,
0.8133897, 1.365636, 0.7909008, 0.7568628, 0, 1, 1,
0.8141482, -0.6782741, 3.230759, 0.7647059, 0, 1, 1,
0.8185263, -0.3295067, 1.737319, 0.7686275, 0, 1, 1,
0.8187557, -0.6804925, 3.812414, 0.7764706, 0, 1, 1,
0.820703, 1.75713, 0.2874937, 0.7803922, 0, 1, 1,
0.8236358, 0.4661778, 0.3590829, 0.7882353, 0, 1, 1,
0.8249555, 1.387895, 0.9135427, 0.7921569, 0, 1, 1,
0.8266671, -0.3441879, 1.274359, 0.8, 0, 1, 1,
0.827906, 0.2796361, 0.05498344, 0.8078431, 0, 1, 1,
0.8292437, -0.4287449, 2.981398, 0.8117647, 0, 1, 1,
0.8350372, -1.576343, 0.2429157, 0.8196079, 0, 1, 1,
0.8379288, 2.025711, -0.8312883, 0.8235294, 0, 1, 1,
0.844129, 0.7380469, 2.513435, 0.8313726, 0, 1, 1,
0.8464379, 2.647314, 1.811683, 0.8352941, 0, 1, 1,
0.8469678, -1.589619, 4.441807, 0.8431373, 0, 1, 1,
0.8528007, 0.6115603, 0.9579198, 0.8470588, 0, 1, 1,
0.8593732, 1.034626, -0.3818642, 0.854902, 0, 1, 1,
0.8638287, -1.145973, 2.308936, 0.8588235, 0, 1, 1,
0.8642907, -0.8541849, 1.112182, 0.8666667, 0, 1, 1,
0.8683668, -0.2515266, 2.077276, 0.8705882, 0, 1, 1,
0.8704134, 0.6995082, 1.9481, 0.8784314, 0, 1, 1,
0.8705805, -1.321168, 2.703994, 0.8823529, 0, 1, 1,
0.8829376, -0.2120035, 1.499725, 0.8901961, 0, 1, 1,
0.8956041, -0.3738489, 2.800778, 0.8941177, 0, 1, 1,
0.8961934, 0.09986696, 3.086391, 0.9019608, 0, 1, 1,
0.8968742, 0.8743274, -0.1836559, 0.9098039, 0, 1, 1,
0.9004096, 1.263332, 1.305623, 0.9137255, 0, 1, 1,
0.9024919, -0.8474075, 1.456887, 0.9215686, 0, 1, 1,
0.9026989, 0.4679595, 0.3467254, 0.9254902, 0, 1, 1,
0.9093189, -0.2621075, 0.4164597, 0.9333333, 0, 1, 1,
0.9094657, -0.2600624, 3.883697, 0.9372549, 0, 1, 1,
0.9135597, 0.1884344, 2.392216, 0.945098, 0, 1, 1,
0.9136258, -0.02584989, 0.6403515, 0.9490196, 0, 1, 1,
0.9166088, -0.09566087, 2.842293, 0.9568627, 0, 1, 1,
0.9208016, 0.9052377, 0.6374975, 0.9607843, 0, 1, 1,
0.9271987, 0.08203168, 1.547915, 0.9686275, 0, 1, 1,
0.9295897, -1.174589, 3.899385, 0.972549, 0, 1, 1,
0.9326845, 0.3478661, 0.4549822, 0.9803922, 0, 1, 1,
0.9456884, 0.3680233, 1.604578, 0.9843137, 0, 1, 1,
0.9516622, 0.1017791, 0.8459001, 0.9921569, 0, 1, 1,
0.9561125, -0.3831002, 3.853592, 0.9960784, 0, 1, 1,
0.9582838, -1.414481, 3.609216, 1, 0, 0.9960784, 1,
0.9625481, -0.2032015, 2.735101, 1, 0, 0.9882353, 1,
0.967016, -0.4426621, 2.350016, 1, 0, 0.9843137, 1,
0.9681849, -0.1370903, 0.7965477, 1, 0, 0.9764706, 1,
0.9713497, 1.771339, 1.061911, 1, 0, 0.972549, 1,
0.9720325, 0.09173445, 2.651469, 1, 0, 0.9647059, 1,
0.9729905, 0.1890704, -0.07911638, 1, 0, 0.9607843, 1,
0.9730151, -0.3045146, 0.3011523, 1, 0, 0.9529412, 1,
0.9747231, -1.82443, 2.806427, 1, 0, 0.9490196, 1,
0.9789768, -0.107123, 0.7347612, 1, 0, 0.9411765, 1,
0.9860457, -0.6232674, 0.841168, 1, 0, 0.9372549, 1,
0.9928338, -0.3615478, 2.989722, 1, 0, 0.9294118, 1,
0.9940404, -0.1036146, 1.553345, 1, 0, 0.9254902, 1,
0.9960557, -0.161169, -0.9595374, 1, 0, 0.9176471, 1,
1.005198, 1.258573, 0.01748375, 1, 0, 0.9137255, 1,
1.006416, -0.1804591, 0.03638822, 1, 0, 0.9058824, 1,
1.008283, 0.7180774, -0.694322, 1, 0, 0.9019608, 1,
1.008378, 2.743407, -0.3567267, 1, 0, 0.8941177, 1,
1.009056, 0.3590274, 1.252198, 1, 0, 0.8862745, 1,
1.011277, -1.368088, 1.772609, 1, 0, 0.8823529, 1,
1.01518, -0.8081964, 3.479385, 1, 0, 0.8745098, 1,
1.024881, -0.1691153, 1.348058, 1, 0, 0.8705882, 1,
1.033918, -0.2775455, 1.265676, 1, 0, 0.8627451, 1,
1.041063, -0.267961, 2.691689, 1, 0, 0.8588235, 1,
1.046343, -1.792729, 2.090213, 1, 0, 0.8509804, 1,
1.05059, 0.01874259, 1.54511, 1, 0, 0.8470588, 1,
1.052928, 0.658375, 2.548959, 1, 0, 0.8392157, 1,
1.053443, 0.7630632, -1.321473, 1, 0, 0.8352941, 1,
1.072422, 1.548209, -0.1884542, 1, 0, 0.827451, 1,
1.073239, 0.3234242, 1.803153, 1, 0, 0.8235294, 1,
1.079012, -0.3317186, 0.4908503, 1, 0, 0.8156863, 1,
1.079077, 0.9210355, 1.358933, 1, 0, 0.8117647, 1,
1.09503, 1.951645, 0.607038, 1, 0, 0.8039216, 1,
1.096582, 0.1981674, 1.26044, 1, 0, 0.7960784, 1,
1.098859, -0.2425576, 1.889511, 1, 0, 0.7921569, 1,
1.100206, 0.877793, 2.744316, 1, 0, 0.7843137, 1,
1.102664, -1.044661, 3.721641, 1, 0, 0.7803922, 1,
1.106207, 0.3503428, 1.860949, 1, 0, 0.772549, 1,
1.106969, 0.2098971, 1.812948, 1, 0, 0.7686275, 1,
1.110673, 1.737661, 0.7067021, 1, 0, 0.7607843, 1,
1.113165, 1.348204, 0.7593169, 1, 0, 0.7568628, 1,
1.122241, -0.5550597, 0.9067069, 1, 0, 0.7490196, 1,
1.12255, -0.2432414, 1.30505, 1, 0, 0.7450981, 1,
1.131395, 0.0455282, 0.7118649, 1, 0, 0.7372549, 1,
1.134876, -2.130938, 3.438421, 1, 0, 0.7333333, 1,
1.137466, 0.4768091, 2.040549, 1, 0, 0.7254902, 1,
1.150198, 1.178124, 1.833742, 1, 0, 0.7215686, 1,
1.151368, 0.584206, 2.494343, 1, 0, 0.7137255, 1,
1.155704, 0.3662618, 0.0001716521, 1, 0, 0.7098039, 1,
1.158012, -0.4259541, 1.585397, 1, 0, 0.7019608, 1,
1.158229, 0.8935758, 0.01946809, 1, 0, 0.6941177, 1,
1.159046, -1.979075, 2.089113, 1, 0, 0.6901961, 1,
1.159411, -0.2150185, 2.681136, 1, 0, 0.682353, 1,
1.167, -0.5985847, 2.18161, 1, 0, 0.6784314, 1,
1.16827, -0.1177632, 0.9414019, 1, 0, 0.6705883, 1,
1.173368, 0.1306745, 0.3685288, 1, 0, 0.6666667, 1,
1.17872, 1.067782, 1.277666, 1, 0, 0.6588235, 1,
1.186205, 2.264604, 1.41023, 1, 0, 0.654902, 1,
1.18759, 0.8561791, 1.51866, 1, 0, 0.6470588, 1,
1.188265, -0.2316617, 0.4446435, 1, 0, 0.6431373, 1,
1.190898, 1.940341, 0.1420874, 1, 0, 0.6352941, 1,
1.197413, -0.919988, 2.001839, 1, 0, 0.6313726, 1,
1.206019, 0.04258297, 2.790725, 1, 0, 0.6235294, 1,
1.210884, -0.1603834, 0.6866816, 1, 0, 0.6196079, 1,
1.218953, -0.8818271, 1.467593, 1, 0, 0.6117647, 1,
1.221109, 0.5757191, 2.630566, 1, 0, 0.6078432, 1,
1.225692, 0.640632, 1.389547, 1, 0, 0.6, 1,
1.236519, 0.09557154, 1.634955, 1, 0, 0.5921569, 1,
1.236533, 0.6163845, 1.945294, 1, 0, 0.5882353, 1,
1.236987, -1.830491, 1.698431, 1, 0, 0.5803922, 1,
1.245301, -0.7826944, 0.9308004, 1, 0, 0.5764706, 1,
1.248484, -0.3020445, 0.4805985, 1, 0, 0.5686275, 1,
1.256678, 0.08562049, 1.93913, 1, 0, 0.5647059, 1,
1.264055, -1.59599, -0.1960862, 1, 0, 0.5568628, 1,
1.268985, 1.498415, 1.991791, 1, 0, 0.5529412, 1,
1.281775, 1.363853, 0.7964296, 1, 0, 0.5450981, 1,
1.284545, 0.2677555, 1.361969, 1, 0, 0.5411765, 1,
1.31068, 1.083135, 1.026197, 1, 0, 0.5333334, 1,
1.315401, -1.782285, 2.09025, 1, 0, 0.5294118, 1,
1.31701, -1.126069, 2.28074, 1, 0, 0.5215687, 1,
1.323108, 0.8823481, 2.613734, 1, 0, 0.5176471, 1,
1.323291, -1.458559, 3.672117, 1, 0, 0.509804, 1,
1.330022, 0.2630218, 1.682801, 1, 0, 0.5058824, 1,
1.339538, -0.5578047, 2.794434, 1, 0, 0.4980392, 1,
1.343686, 0.3986335, 0.4468936, 1, 0, 0.4901961, 1,
1.354096, -0.1303762, 2.676076, 1, 0, 0.4862745, 1,
1.357345, 0.8215329, 1.624877, 1, 0, 0.4784314, 1,
1.359262, 0.1179038, 2.98294, 1, 0, 0.4745098, 1,
1.365309, 0.86759, -0.09481592, 1, 0, 0.4666667, 1,
1.367532, 1.259899, 0.1564872, 1, 0, 0.4627451, 1,
1.370807, 1.312253, 1.140775, 1, 0, 0.454902, 1,
1.376481, -0.2202817, 1.830388, 1, 0, 0.4509804, 1,
1.388463, -1.434596, 3.681855, 1, 0, 0.4431373, 1,
1.389282, -0.1016559, 0.5401702, 1, 0, 0.4392157, 1,
1.396005, -1.668105, 2.789775, 1, 0, 0.4313726, 1,
1.410704, 0.4982241, 0.3527976, 1, 0, 0.427451, 1,
1.431419, 0.8331038, 2.027503, 1, 0, 0.4196078, 1,
1.436927, 2.737485, -0.2881109, 1, 0, 0.4156863, 1,
1.44585, 0.234551, 1.427809, 1, 0, 0.4078431, 1,
1.455655, 0.9890032, -0.2423798, 1, 0, 0.4039216, 1,
1.459281, -2.53321, 3.30476, 1, 0, 0.3960784, 1,
1.459394, -1.631707, 1.663854, 1, 0, 0.3882353, 1,
1.460361, 0.5293614, 1.766449, 1, 0, 0.3843137, 1,
1.461611, -0.6184419, 2.870495, 1, 0, 0.3764706, 1,
1.463163, -1.108124, 3.417699, 1, 0, 0.372549, 1,
1.473189, -1.82128, 3.187209, 1, 0, 0.3647059, 1,
1.480532, 1.070927, 0.1824524, 1, 0, 0.3607843, 1,
1.494713, -0.6125817, 1.482828, 1, 0, 0.3529412, 1,
1.527058, -0.04978053, 0.8842282, 1, 0, 0.3490196, 1,
1.528801, 2.542604, 0.6126724, 1, 0, 0.3411765, 1,
1.540401, -1.167829, 1.140936, 1, 0, 0.3372549, 1,
1.540979, 0.9624868, 1.360869, 1, 0, 0.3294118, 1,
1.543075, 0.3701194, 1.724575, 1, 0, 0.3254902, 1,
1.548948, -1.002794, 3.13901, 1, 0, 0.3176471, 1,
1.555992, 0.31546, 3.346023, 1, 0, 0.3137255, 1,
1.565193, -1.315336, 3.151066, 1, 0, 0.3058824, 1,
1.568264, 0.7825212, 1.310694, 1, 0, 0.2980392, 1,
1.5697, -0.2153829, 0.453146, 1, 0, 0.2941177, 1,
1.575658, 0.1184637, 2.108595, 1, 0, 0.2862745, 1,
1.579363, 1.462892, 1.687012, 1, 0, 0.282353, 1,
1.584849, -1.569123, 3.014518, 1, 0, 0.2745098, 1,
1.595181, 0.2327529, 1.050736, 1, 0, 0.2705882, 1,
1.600798, 0.4416944, 1.149849, 1, 0, 0.2627451, 1,
1.607012, -0.8586293, 2.448971, 1, 0, 0.2588235, 1,
1.625504, 0.1587228, 2.218623, 1, 0, 0.2509804, 1,
1.64829, 1.284815, 1.444287, 1, 0, 0.2470588, 1,
1.667727, 1.45698, -0.4724956, 1, 0, 0.2392157, 1,
1.669126, 0.2462629, 0.3192202, 1, 0, 0.2352941, 1,
1.669216, 0.06942885, 1.068387, 1, 0, 0.227451, 1,
1.672631, -0.4829758, 3.360007, 1, 0, 0.2235294, 1,
1.67732, 1.031833, 0.5882709, 1, 0, 0.2156863, 1,
1.687542, -0.1754168, 0.819114, 1, 0, 0.2117647, 1,
1.690577, 1.665755, 0.1760019, 1, 0, 0.2039216, 1,
1.715279, -0.9397256, 3.458708, 1, 0, 0.1960784, 1,
1.777231, -0.4490501, 2.127096, 1, 0, 0.1921569, 1,
1.777922, 1.141655, -0.4957734, 1, 0, 0.1843137, 1,
1.795834, -0.4038288, 2.048136, 1, 0, 0.1803922, 1,
1.816166, -3.106218, 1.393162, 1, 0, 0.172549, 1,
1.829503, -0.01248473, 1.143373, 1, 0, 0.1686275, 1,
1.830274, -0.7676864, 1.343895, 1, 0, 0.1607843, 1,
1.842314, 0.754576, 1.725034, 1, 0, 0.1568628, 1,
1.844136, -1.360872, 0.5995621, 1, 0, 0.1490196, 1,
1.867018, 2.313216, 0.06439649, 1, 0, 0.145098, 1,
1.880232, -0.77754, 1.904615, 1, 0, 0.1372549, 1,
1.905372, 0.1656811, 1.661803, 1, 0, 0.1333333, 1,
1.94741, 0.6948578, 0.3077862, 1, 0, 0.1254902, 1,
1.979045, -0.5562569, 1.445027, 1, 0, 0.1215686, 1,
1.987289, 1.003861, 1.926632, 1, 0, 0.1137255, 1,
1.988535, -0.5655131, 4.201268, 1, 0, 0.1098039, 1,
2.079193, 2.562799, -0.08676218, 1, 0, 0.1019608, 1,
2.09753, 0.708893, 1.458705, 1, 0, 0.09411765, 1,
2.100824, -0.1173865, 2.073272, 1, 0, 0.09019608, 1,
2.145963, 0.8868193, 2.007117, 1, 0, 0.08235294, 1,
2.16805, 0.3314869, 0.6921535, 1, 0, 0.07843138, 1,
2.173458, -0.7980008, 1.473782, 1, 0, 0.07058824, 1,
2.207491, 3.008716, -0.3696408, 1, 0, 0.06666667, 1,
2.290927, -0.125142, 1.846333, 1, 0, 0.05882353, 1,
2.324994, 1.362529, -1.321246, 1, 0, 0.05490196, 1,
2.349247, -0.1377664, 3.594973, 1, 0, 0.04705882, 1,
2.434488, -0.7258285, 2.167429, 1, 0, 0.04313726, 1,
2.488968, 0.9849769, 1.137999, 1, 0, 0.03529412, 1,
2.595733, -0.5751243, 2.428042, 1, 0, 0.03137255, 1,
2.651869, 0.6305851, 1.249832, 1, 0, 0.02352941, 1,
2.85155, 0.507701, 1.678286, 1, 0, 0.01960784, 1,
2.929544, 0.7055754, 2.229427, 1, 0, 0.01176471, 1,
3.177133, -0.2908768, -0.07752141, 1, 0, 0.007843138, 1
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
0.1913655, -4.614781, -6.856144, 0, -0.5, 0.5, 0.5,
0.1913655, -4.614781, -6.856144, 1, -0.5, 0.5, 0.5,
0.1913655, -4.614781, -6.856144, 1, 1.5, 0.5, 0.5,
0.1913655, -4.614781, -6.856144, 0, 1.5, 0.5, 0.5
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
-3.806578, -0.07278657, -6.856144, 0, -0.5, 0.5, 0.5,
-3.806578, -0.07278657, -6.856144, 1, -0.5, 0.5, 0.5,
-3.806578, -0.07278657, -6.856144, 1, 1.5, 0.5, 0.5,
-3.806578, -0.07278657, -6.856144, 0, 1.5, 0.5, 0.5
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
-3.806578, -4.614781, 0.2203326, 0, -0.5, 0.5, 0.5,
-3.806578, -4.614781, 0.2203326, 1, -0.5, 0.5, 0.5,
-3.806578, -4.614781, 0.2203326, 1, 1.5, 0.5, 0.5,
-3.806578, -4.614781, 0.2203326, 0, 1.5, 0.5, 0.5
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
-2, -3.566628, -5.223111,
3, -3.566628, -5.223111,
-2, -3.566628, -5.223111,
-2, -3.741321, -5.495283,
-1, -3.566628, -5.223111,
-1, -3.741321, -5.495283,
0, -3.566628, -5.223111,
0, -3.741321, -5.495283,
1, -3.566628, -5.223111,
1, -3.741321, -5.495283,
2, -3.566628, -5.223111,
2, -3.741321, -5.495283,
3, -3.566628, -5.223111,
3, -3.741321, -5.495283
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
-2, -4.090705, -6.039628, 0, -0.5, 0.5, 0.5,
-2, -4.090705, -6.039628, 1, -0.5, 0.5, 0.5,
-2, -4.090705, -6.039628, 1, 1.5, 0.5, 0.5,
-2, -4.090705, -6.039628, 0, 1.5, 0.5, 0.5,
-1, -4.090705, -6.039628, 0, -0.5, 0.5, 0.5,
-1, -4.090705, -6.039628, 1, -0.5, 0.5, 0.5,
-1, -4.090705, -6.039628, 1, 1.5, 0.5, 0.5,
-1, -4.090705, -6.039628, 0, 1.5, 0.5, 0.5,
0, -4.090705, -6.039628, 0, -0.5, 0.5, 0.5,
0, -4.090705, -6.039628, 1, -0.5, 0.5, 0.5,
0, -4.090705, -6.039628, 1, 1.5, 0.5, 0.5,
0, -4.090705, -6.039628, 0, 1.5, 0.5, 0.5,
1, -4.090705, -6.039628, 0, -0.5, 0.5, 0.5,
1, -4.090705, -6.039628, 1, -0.5, 0.5, 0.5,
1, -4.090705, -6.039628, 1, 1.5, 0.5, 0.5,
1, -4.090705, -6.039628, 0, 1.5, 0.5, 0.5,
2, -4.090705, -6.039628, 0, -0.5, 0.5, 0.5,
2, -4.090705, -6.039628, 1, -0.5, 0.5, 0.5,
2, -4.090705, -6.039628, 1, 1.5, 0.5, 0.5,
2, -4.090705, -6.039628, 0, 1.5, 0.5, 0.5,
3, -4.090705, -6.039628, 0, -0.5, 0.5, 0.5,
3, -4.090705, -6.039628, 1, -0.5, 0.5, 0.5,
3, -4.090705, -6.039628, 1, 1.5, 0.5, 0.5,
3, -4.090705, -6.039628, 0, 1.5, 0.5, 0.5
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
-2.883976, -3, -5.223111,
-2.883976, 3, -5.223111,
-2.883976, -3, -5.223111,
-3.037742, -3, -5.495283,
-2.883976, -2, -5.223111,
-3.037742, -2, -5.495283,
-2.883976, -1, -5.223111,
-3.037742, -1, -5.495283,
-2.883976, 0, -5.223111,
-3.037742, 0, -5.495283,
-2.883976, 1, -5.223111,
-3.037742, 1, -5.495283,
-2.883976, 2, -5.223111,
-3.037742, 2, -5.495283,
-2.883976, 3, -5.223111,
-3.037742, 3, -5.495283
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
-3.345277, -3, -6.039628, 0, -0.5, 0.5, 0.5,
-3.345277, -3, -6.039628, 1, -0.5, 0.5, 0.5,
-3.345277, -3, -6.039628, 1, 1.5, 0.5, 0.5,
-3.345277, -3, -6.039628, 0, 1.5, 0.5, 0.5,
-3.345277, -2, -6.039628, 0, -0.5, 0.5, 0.5,
-3.345277, -2, -6.039628, 1, -0.5, 0.5, 0.5,
-3.345277, -2, -6.039628, 1, 1.5, 0.5, 0.5,
-3.345277, -2, -6.039628, 0, 1.5, 0.5, 0.5,
-3.345277, -1, -6.039628, 0, -0.5, 0.5, 0.5,
-3.345277, -1, -6.039628, 1, -0.5, 0.5, 0.5,
-3.345277, -1, -6.039628, 1, 1.5, 0.5, 0.5,
-3.345277, -1, -6.039628, 0, 1.5, 0.5, 0.5,
-3.345277, 0, -6.039628, 0, -0.5, 0.5, 0.5,
-3.345277, 0, -6.039628, 1, -0.5, 0.5, 0.5,
-3.345277, 0, -6.039628, 1, 1.5, 0.5, 0.5,
-3.345277, 0, -6.039628, 0, 1.5, 0.5, 0.5,
-3.345277, 1, -6.039628, 0, -0.5, 0.5, 0.5,
-3.345277, 1, -6.039628, 1, -0.5, 0.5, 0.5,
-3.345277, 1, -6.039628, 1, 1.5, 0.5, 0.5,
-3.345277, 1, -6.039628, 0, 1.5, 0.5, 0.5,
-3.345277, 2, -6.039628, 0, -0.5, 0.5, 0.5,
-3.345277, 2, -6.039628, 1, -0.5, 0.5, 0.5,
-3.345277, 2, -6.039628, 1, 1.5, 0.5, 0.5,
-3.345277, 2, -6.039628, 0, 1.5, 0.5, 0.5,
-3.345277, 3, -6.039628, 0, -0.5, 0.5, 0.5,
-3.345277, 3, -6.039628, 1, -0.5, 0.5, 0.5,
-3.345277, 3, -6.039628, 1, 1.5, 0.5, 0.5,
-3.345277, 3, -6.039628, 0, 1.5, 0.5, 0.5
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
-2.883976, -3.566628, -4,
-2.883976, -3.566628, 4,
-2.883976, -3.566628, -4,
-3.037742, -3.741321, -4,
-2.883976, -3.566628, -2,
-3.037742, -3.741321, -2,
-2.883976, -3.566628, 0,
-3.037742, -3.741321, 0,
-2.883976, -3.566628, 2,
-3.037742, -3.741321, 2,
-2.883976, -3.566628, 4,
-3.037742, -3.741321, 4
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
-3.345277, -4.090705, -4, 0, -0.5, 0.5, 0.5,
-3.345277, -4.090705, -4, 1, -0.5, 0.5, 0.5,
-3.345277, -4.090705, -4, 1, 1.5, 0.5, 0.5,
-3.345277, -4.090705, -4, 0, 1.5, 0.5, 0.5,
-3.345277, -4.090705, -2, 0, -0.5, 0.5, 0.5,
-3.345277, -4.090705, -2, 1, -0.5, 0.5, 0.5,
-3.345277, -4.090705, -2, 1, 1.5, 0.5, 0.5,
-3.345277, -4.090705, -2, 0, 1.5, 0.5, 0.5,
-3.345277, -4.090705, 0, 0, -0.5, 0.5, 0.5,
-3.345277, -4.090705, 0, 1, -0.5, 0.5, 0.5,
-3.345277, -4.090705, 0, 1, 1.5, 0.5, 0.5,
-3.345277, -4.090705, 0, 0, 1.5, 0.5, 0.5,
-3.345277, -4.090705, 2, 0, -0.5, 0.5, 0.5,
-3.345277, -4.090705, 2, 1, -0.5, 0.5, 0.5,
-3.345277, -4.090705, 2, 1, 1.5, 0.5, 0.5,
-3.345277, -4.090705, 2, 0, 1.5, 0.5, 0.5,
-3.345277, -4.090705, 4, 0, -0.5, 0.5, 0.5,
-3.345277, -4.090705, 4, 1, -0.5, 0.5, 0.5,
-3.345277, -4.090705, 4, 1, 1.5, 0.5, 0.5,
-3.345277, -4.090705, 4, 0, 1.5, 0.5, 0.5
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
-2.883976, -3.566628, -5.223111,
-2.883976, 3.421055, -5.223111,
-2.883976, -3.566628, 5.663776,
-2.883976, 3.421055, 5.663776,
-2.883976, -3.566628, -5.223111,
-2.883976, -3.566628, 5.663776,
-2.883976, 3.421055, -5.223111,
-2.883976, 3.421055, 5.663776,
-2.883976, -3.566628, -5.223111,
3.266706, -3.566628, -5.223111,
-2.883976, -3.566628, 5.663776,
3.266706, -3.566628, 5.663776,
-2.883976, 3.421055, -5.223111,
3.266706, 3.421055, -5.223111,
-2.883976, 3.421055, 5.663776,
3.266706, 3.421055, 5.663776,
3.266706, -3.566628, -5.223111,
3.266706, 3.421055, -5.223111,
3.266706, -3.566628, 5.663776,
3.266706, 3.421055, 5.663776,
3.266706, -3.566628, -5.223111,
3.266706, -3.566628, 5.663776,
3.266706, 3.421055, -5.223111,
3.266706, 3.421055, 5.663776
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
var radius = 7.648849;
var distance = 34.03059;
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
mvMatrix.translate( -0.1913655, 0.07278657, -0.2203326 );
mvMatrix.scale( 1.34458, 1.183523, 0.7596372 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.03059);
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
profluralin<-read.table("profluralin.xyz")
```

```
## Error in read.table("profluralin.xyz"): no lines available in input
```

```r
x<-profluralin$V2
```

```
## Error in eval(expr, envir, enclos): object 'profluralin' not found
```

```r
y<-profluralin$V3
```

```
## Error in eval(expr, envir, enclos): object 'profluralin' not found
```

```r
z<-profluralin$V4
```

```
## Error in eval(expr, envir, enclos): object 'profluralin' not found
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
-2.794402, 0.5406358, -0.3921627, 0, 0, 1, 1, 1,
-2.723755, 0.04988436, 1.101408, 1, 0, 0, 1, 1,
-2.721005, -0.1223109, -1.301629, 1, 0, 0, 1, 1,
-2.697426, -0.2308415, -1.962622, 1, 0, 0, 1, 1,
-2.614917, 0.6262022, -0.1289334, 1, 0, 0, 1, 1,
-2.56706, 1.037088, 1.132366, 1, 0, 0, 1, 1,
-2.488845, 1.178607, -0.01889484, 0, 0, 0, 1, 1,
-2.463913, -0.5704961, -4.054951, 0, 0, 0, 1, 1,
-2.384044, -0.968221, -0.7716756, 0, 0, 0, 1, 1,
-2.331659, 0.4573458, -1.636729, 0, 0, 0, 1, 1,
-2.203161, 0.3773787, -1.309839, 0, 0, 0, 1, 1,
-2.198232, -0.7723725, -2.429546, 0, 0, 0, 1, 1,
-2.175574, 0.4790004, -0.8635469, 0, 0, 0, 1, 1,
-2.162014, -1.066337, -1.307303, 1, 1, 1, 1, 1,
-2.143708, -0.3186472, -3.973964, 1, 1, 1, 1, 1,
-2.139586, -0.7661005, -1.702092, 1, 1, 1, 1, 1,
-2.127529, -0.1331616, -0.4227634, 1, 1, 1, 1, 1,
-2.118295, -1.977165, -0.4495327, 1, 1, 1, 1, 1,
-2.09891, 1.519969, -0.5777742, 1, 1, 1, 1, 1,
-2.082033, -1.470239, -2.664183, 1, 1, 1, 1, 1,
-2.060817, -0.400423, -1.766868, 1, 1, 1, 1, 1,
-2.026821, -0.7358682, -2.599583, 1, 1, 1, 1, 1,
-1.999607, -0.4483968, -4.126781, 1, 1, 1, 1, 1,
-1.981761, 0.3883471, 0.1738115, 1, 1, 1, 1, 1,
-1.979984, 0.6352866, -1.303924, 1, 1, 1, 1, 1,
-1.975166, 0.5967504, -0.7279212, 1, 1, 1, 1, 1,
-1.945856, 0.04526118, -1.481847, 1, 1, 1, 1, 1,
-1.93613, -0.9545593, -2.235739, 1, 1, 1, 1, 1,
-1.927349, 0.5078977, -1.613988, 0, 0, 1, 1, 1,
-1.907691, -0.1103839, -2.09355, 1, 0, 0, 1, 1,
-1.900359, -0.475329, -1.568228, 1, 0, 0, 1, 1,
-1.883248, 1.079221, -0.1627115, 1, 0, 0, 1, 1,
-1.872606, -1.009847, -2.928767, 1, 0, 0, 1, 1,
-1.867195, -1.203307, -2.226286, 1, 0, 0, 1, 1,
-1.809925, -0.8061393, -2.805149, 0, 0, 0, 1, 1,
-1.783757, -0.3232496, -0.6501698, 0, 0, 0, 1, 1,
-1.78009, 1.88806, -2.812683, 0, 0, 0, 1, 1,
-1.777974, -1.142527, -2.584934, 0, 0, 0, 1, 1,
-1.774646, -1.474921, -2.104947, 0, 0, 0, 1, 1,
-1.765182, 1.174285, -2.301528, 0, 0, 0, 1, 1,
-1.734274, -0.4204589, -1.364435, 0, 0, 0, 1, 1,
-1.734053, 0.4781669, -3.485351, 1, 1, 1, 1, 1,
-1.710192, 1.825632, -2.697869, 1, 1, 1, 1, 1,
-1.706547, 0.3299743, -2.101648, 1, 1, 1, 1, 1,
-1.705264, 0.9035119, -0.5579349, 1, 1, 1, 1, 1,
-1.702157, 1.124971, 0.1567993, 1, 1, 1, 1, 1,
-1.692491, -1.160553, -2.45388, 1, 1, 1, 1, 1,
-1.674452, -1.042138, -2.134844, 1, 1, 1, 1, 1,
-1.657322, -0.3113636, -1.345581, 1, 1, 1, 1, 1,
-1.650307, 0.3281041, -1.50233, 1, 1, 1, 1, 1,
-1.630306, 0.8103782, -0.8975073, 1, 1, 1, 1, 1,
-1.610858, -0.4727901, -2.80281, 1, 1, 1, 1, 1,
-1.604456, -0.5853162, -1.315554, 1, 1, 1, 1, 1,
-1.597188, 0.6481664, -2.325035, 1, 1, 1, 1, 1,
-1.592248, 0.003004564, -1.451381, 1, 1, 1, 1, 1,
-1.572394, -0.700241, -1.791059, 1, 1, 1, 1, 1,
-1.566338, -1.081987, -1.679539, 0, 0, 1, 1, 1,
-1.56331, -0.6239295, -1.084679, 1, 0, 0, 1, 1,
-1.561654, 1.907702, 1.064488, 1, 0, 0, 1, 1,
-1.558577, -0.6466141, -2.545699, 1, 0, 0, 1, 1,
-1.544973, 1.95283, -1.961613, 1, 0, 0, 1, 1,
-1.542778, 1.285343, 0.2646571, 1, 0, 0, 1, 1,
-1.54126, -1.555908, -3.830889, 0, 0, 0, 1, 1,
-1.534098, 0.7225831, 0.6396236, 0, 0, 0, 1, 1,
-1.531652, -0.2472627, -3.787522, 0, 0, 0, 1, 1,
-1.505291, 0.8123537, -2.915746, 0, 0, 0, 1, 1,
-1.492421, 0.5509851, -0.784157, 0, 0, 0, 1, 1,
-1.480209, -0.6298566, -2.601492, 0, 0, 0, 1, 1,
-1.479737, 0.4001811, -0.7160596, 0, 0, 0, 1, 1,
-1.476902, 0.7852171, 1.049809, 1, 1, 1, 1, 1,
-1.476686, -0.3936997, -3.116032, 1, 1, 1, 1, 1,
-1.476176, 0.7871757, -0.165083, 1, 1, 1, 1, 1,
-1.461755, -0.6344001, -1.698406, 1, 1, 1, 1, 1,
-1.454964, -0.7158688, -1.128995, 1, 1, 1, 1, 1,
-1.453154, 1.202988, -1.482457, 1, 1, 1, 1, 1,
-1.450897, 0.4330394, 0.5272857, 1, 1, 1, 1, 1,
-1.446864, -2.264237, -3.862189, 1, 1, 1, 1, 1,
-1.436316, 1.396563, -0.08100594, 1, 1, 1, 1, 1,
-1.424035, 0.7861291, 0.8724886, 1, 1, 1, 1, 1,
-1.407382, -1.799651, -4.366581, 1, 1, 1, 1, 1,
-1.396185, 0.3054103, -0.7935289, 1, 1, 1, 1, 1,
-1.389367, -0.3541608, -1.078136, 1, 1, 1, 1, 1,
-1.385952, -0.1889632, -1.833863, 1, 1, 1, 1, 1,
-1.378869, -0.3249047, -1.911461, 1, 1, 1, 1, 1,
-1.374877, -1.758584, -3.675506, 0, 0, 1, 1, 1,
-1.373733, -0.9837828, -0.8968726, 1, 0, 0, 1, 1,
-1.371152, 0.4278208, -2.261947, 1, 0, 0, 1, 1,
-1.361444, -0.6830454, -3.660421, 1, 0, 0, 1, 1,
-1.3359, -0.4419563, -0.9911014, 1, 0, 0, 1, 1,
-1.333767, -0.2452887, -1.673015, 1, 0, 0, 1, 1,
-1.323151, -0.7134182, -2.228883, 0, 0, 0, 1, 1,
-1.315224, 1.484529, -1.413512, 0, 0, 0, 1, 1,
-1.310541, 1.23868, -0.5215005, 0, 0, 0, 1, 1,
-1.309993, -0.03563211, -1.754371, 0, 0, 0, 1, 1,
-1.309657, 0.1349248, -2.223178, 0, 0, 0, 1, 1,
-1.307081, 1.00617, -0.305767, 0, 0, 0, 1, 1,
-1.306276, 0.6966841, 0.3333127, 0, 0, 0, 1, 1,
-1.304349, -2.162607, -1.943637, 1, 1, 1, 1, 1,
-1.304258, 1.098001, -1.109686, 1, 1, 1, 1, 1,
-1.294555, -1.120458, -1.878196, 1, 1, 1, 1, 1,
-1.287565, -0.09802825, -1.652653, 1, 1, 1, 1, 1,
-1.286976, -0.5842482, -2.388253, 1, 1, 1, 1, 1,
-1.283161, -0.6553212, -2.365282, 1, 1, 1, 1, 1,
-1.282582, -0.963666, -3.839059, 1, 1, 1, 1, 1,
-1.282478, -1.392286, -2.190129, 1, 1, 1, 1, 1,
-1.279333, -0.2221501, -2.209206, 1, 1, 1, 1, 1,
-1.245637, 2.095047, -1.278214, 1, 1, 1, 1, 1,
-1.239281, -0.4991214, -2.481956, 1, 1, 1, 1, 1,
-1.227089, 0.7576713, 0.05231185, 1, 1, 1, 1, 1,
-1.226585, -0.1479881, -3.123317, 1, 1, 1, 1, 1,
-1.223841, -0.3600582, 0.4783206, 1, 1, 1, 1, 1,
-1.219673, 0.1556406, -3.190724, 1, 1, 1, 1, 1,
-1.217014, -1.31656, -3.613352, 0, 0, 1, 1, 1,
-1.205825, 0.5891597, -3.021542, 1, 0, 0, 1, 1,
-1.198739, 0.6811137, 0.9190574, 1, 0, 0, 1, 1,
-1.194643, -0.3916395, -1.563297, 1, 0, 0, 1, 1,
-1.1943, 0.496135, -1.414082, 1, 0, 0, 1, 1,
-1.180827, 0.6138217, -1.747515, 1, 0, 0, 1, 1,
-1.167199, 0.02336306, -2.190909, 0, 0, 0, 1, 1,
-1.156736, -0.03661602, -1.537284, 0, 0, 0, 1, 1,
-1.154043, 0.9369972, -2.287405, 0, 0, 0, 1, 1,
-1.149233, 0.05766353, -0.7159786, 0, 0, 0, 1, 1,
-1.146953, 0.5328021, -1.708064, 0, 0, 0, 1, 1,
-1.143097, 0.05475096, -1.519688, 0, 0, 0, 1, 1,
-1.141605, 0.3290811, -2.623824, 0, 0, 0, 1, 1,
-1.140911, -0.07260627, -0.389199, 1, 1, 1, 1, 1,
-1.139133, 0.8630543, 0.1854801, 1, 1, 1, 1, 1,
-1.137864, 0.634321, -1.024538, 1, 1, 1, 1, 1,
-1.130383, 3.022424, -0.285995, 1, 1, 1, 1, 1,
-1.129583, 0.6681227, -2.322724, 1, 1, 1, 1, 1,
-1.120809, -0.08509007, -0.1858513, 1, 1, 1, 1, 1,
-1.118995, 1.320928, -1.523551, 1, 1, 1, 1, 1,
-1.111783, 0.05415942, -0.1948783, 1, 1, 1, 1, 1,
-1.111052, -1.561339, -2.648469, 1, 1, 1, 1, 1,
-1.101218, -0.1191003, -1.321541, 1, 1, 1, 1, 1,
-1.098584, -0.773389, -2.879679, 1, 1, 1, 1, 1,
-1.098278, 2.081917, 0.4534138, 1, 1, 1, 1, 1,
-1.091637, -0.1417832, -2.090411, 1, 1, 1, 1, 1,
-1.082841, 0.7979905, -1.405915, 1, 1, 1, 1, 1,
-1.078548, 0.7870036, 0.4138881, 1, 1, 1, 1, 1,
-1.070445, 0.3570786, -2.221597, 0, 0, 1, 1, 1,
-1.061342, -0.04273673, -3.080147, 1, 0, 0, 1, 1,
-1.060844, 0.5888197, 0.9042889, 1, 0, 0, 1, 1,
-1.055874, 0.5726519, 0.3585403, 1, 0, 0, 1, 1,
-1.055283, -2.916115, -1.678651, 1, 0, 0, 1, 1,
-1.055045, 1.495571, -1.263202, 1, 0, 0, 1, 1,
-1.05467, -1.197035, -1.349087, 0, 0, 0, 1, 1,
-1.049041, -0.4471755, -0.9292375, 0, 0, 0, 1, 1,
-1.046721, 0.6948703, -1.897553, 0, 0, 0, 1, 1,
-1.046422, 1.326046, -0.467518, 0, 0, 0, 1, 1,
-1.045641, 1.054824, -0.4800966, 0, 0, 0, 1, 1,
-1.045592, 1.653039, -0.3302078, 0, 0, 0, 1, 1,
-1.029127, -0.6678071, -2.975591, 0, 0, 0, 1, 1,
-1.02353, -1.426817, -3.246945, 1, 1, 1, 1, 1,
-1.02006, 0.1967194, -1.994693, 1, 1, 1, 1, 1,
-1.017704, 1.917177, -0.1694149, 1, 1, 1, 1, 1,
-1.014847, -0.3076465, -1.414015, 1, 1, 1, 1, 1,
-1.014509, -0.8790534, -1.85635, 1, 1, 1, 1, 1,
-1.014119, -0.4333936, -3.362649, 1, 1, 1, 1, 1,
-1.007084, -0.2577675, -1.605566, 1, 1, 1, 1, 1,
-1.002886, 1.271141, -3.838507, 1, 1, 1, 1, 1,
-0.9988286, 0.8934742, -1.827101, 1, 1, 1, 1, 1,
-0.9978539, 0.2583333, -1.517141, 1, 1, 1, 1, 1,
-0.9967486, -1.037628, -2.910715, 1, 1, 1, 1, 1,
-0.9966313, -1.237862, -0.8238201, 1, 1, 1, 1, 1,
-0.9941044, 0.2870573, 0.2884584, 1, 1, 1, 1, 1,
-0.9936919, 0.8611728, -1.545586, 1, 1, 1, 1, 1,
-0.9853269, 1.634014, -2.041346, 1, 1, 1, 1, 1,
-0.9802057, 1.668364, -0.8733755, 0, 0, 1, 1, 1,
-0.9748016, -1.306785, -0.2367066, 1, 0, 0, 1, 1,
-0.9735071, -0.06840569, -3.08463, 1, 0, 0, 1, 1,
-0.9693847, -0.4858809, -3.357216, 1, 0, 0, 1, 1,
-0.9661384, 0.3741024, -1.050206, 1, 0, 0, 1, 1,
-0.9659713, -1.486996, -2.798341, 1, 0, 0, 1, 1,
-0.9632929, 0.5663077, -0.3375175, 0, 0, 0, 1, 1,
-0.9616269, 0.1432313, -0.4950055, 0, 0, 0, 1, 1,
-0.9555411, -0.5098628, -2.293057, 0, 0, 0, 1, 1,
-0.9504458, -1.280394, -1.946881, 0, 0, 0, 1, 1,
-0.9492323, 0.5147498, -0.7563105, 0, 0, 0, 1, 1,
-0.938161, -2.208816, -2.700744, 0, 0, 0, 1, 1,
-0.9377992, -0.02519439, -1.53059, 0, 0, 0, 1, 1,
-0.9337587, 1.392426, 0.01335888, 1, 1, 1, 1, 1,
-0.928624, -0.2801858, -2.645102, 1, 1, 1, 1, 1,
-0.9219651, -0.8296799, -1.901878, 1, 1, 1, 1, 1,
-0.9219093, 1.772135, -1.253847, 1, 1, 1, 1, 1,
-0.9085175, 0.2291534, -1.918247, 1, 1, 1, 1, 1,
-0.9080821, -0.6009374, -2.262614, 1, 1, 1, 1, 1,
-0.8946459, 0.221021, -3.281549, 1, 1, 1, 1, 1,
-0.894576, 0.2849019, -1.94134, 1, 1, 1, 1, 1,
-0.8854634, -0.6203026, -2.141601, 1, 1, 1, 1, 1,
-0.882991, 1.240196, 1.221678, 1, 1, 1, 1, 1,
-0.8599725, 0.03739381, -2.014881, 1, 1, 1, 1, 1,
-0.8531755, 0.3955771, 0.6588164, 1, 1, 1, 1, 1,
-0.8489093, 1.278996, -0.1541044, 1, 1, 1, 1, 1,
-0.8486247, -0.725755, -1.660861, 1, 1, 1, 1, 1,
-0.8476635, 0.837743, -1.534718, 1, 1, 1, 1, 1,
-0.8399363, -0.9707752, -3.022364, 0, 0, 1, 1, 1,
-0.8370284, -2.045809, -2.756316, 1, 0, 0, 1, 1,
-0.8301209, -0.8081976, -2.702647, 1, 0, 0, 1, 1,
-0.8265496, 0.5315914, -0.9607996, 1, 0, 0, 1, 1,
-0.8208, -0.8482638, -1.797153, 1, 0, 0, 1, 1,
-0.801474, 1.589121, -1.000226, 1, 0, 0, 1, 1,
-0.7956854, 0.7593855, -1.05999, 0, 0, 0, 1, 1,
-0.7947942, 0.799885, -0.8276822, 0, 0, 0, 1, 1,
-0.7923828, 2.720932, -2.093356, 0, 0, 0, 1, 1,
-0.7895751, 0.05095418, -1.709963, 0, 0, 0, 1, 1,
-0.7860947, -0.1812822, -1.541523, 0, 0, 0, 1, 1,
-0.7832925, 0.6830179, -0.9759575, 0, 0, 0, 1, 1,
-0.7791389, -0.3470145, -0.3911229, 0, 0, 0, 1, 1,
-0.777371, -1.100083, -2.884537, 1, 1, 1, 1, 1,
-0.7754025, 0.09895422, -1.140447, 1, 1, 1, 1, 1,
-0.7729787, 0.2089506, -0.3998266, 1, 1, 1, 1, 1,
-0.772114, 1.151249, 1.173807, 1, 1, 1, 1, 1,
-0.7643303, -0.6110653, -2.192914, 1, 1, 1, 1, 1,
-0.7593813, -0.02621231, -0.9660105, 1, 1, 1, 1, 1,
-0.7592064, -0.1514277, -2.142954, 1, 1, 1, 1, 1,
-0.7580875, 0.8351216, -2.972521, 1, 1, 1, 1, 1,
-0.7543613, -2.153353, -1.680673, 1, 1, 1, 1, 1,
-0.7538741, -0.3736001, -1.38402, 1, 1, 1, 1, 1,
-0.7479612, -0.6839616, -2.606679, 1, 1, 1, 1, 1,
-0.7442193, -0.0513421, -1.6081, 1, 1, 1, 1, 1,
-0.7425194, 0.2131842, -1.574741, 1, 1, 1, 1, 1,
-0.7404072, -0.1726615, -1.378045, 1, 1, 1, 1, 1,
-0.7387698, 0.5393226, -1.82855, 1, 1, 1, 1, 1,
-0.7336177, -1.217447, -1.726939, 0, 0, 1, 1, 1,
-0.7326112, -1.679206, -3.922829, 1, 0, 0, 1, 1,
-0.7308788, 0.381979, -0.08980708, 1, 0, 0, 1, 1,
-0.7255346, -0.4156461, -1.383551, 1, 0, 0, 1, 1,
-0.7206182, 0.7414025, -0.9237602, 1, 0, 0, 1, 1,
-0.7174959, -1.944188, -3.042444, 1, 0, 0, 1, 1,
-0.7125713, 0.7430291, -0.1999614, 0, 0, 0, 1, 1,
-0.7098135, -0.8951883, -1.889612, 0, 0, 0, 1, 1,
-0.7083872, -0.5560942, -1.618744, 0, 0, 0, 1, 1,
-0.7070207, -0.9081206, -3.109312, 0, 0, 0, 1, 1,
-0.6953097, -1.158895, -1.248089, 0, 0, 0, 1, 1,
-0.6937951, 1.121402, -3.103676, 0, 0, 0, 1, 1,
-0.6917898, 0.3241643, -0.4280682, 0, 0, 0, 1, 1,
-0.6912864, -0.02004404, -0.1898953, 1, 1, 1, 1, 1,
-0.6820998, 0.3219109, -1.385103, 1, 1, 1, 1, 1,
-0.6812053, 0.8457295, -0.371801, 1, 1, 1, 1, 1,
-0.6768228, 0.6091961, 0.5442164, 1, 1, 1, 1, 1,
-0.6749133, 0.217593, -2.889574, 1, 1, 1, 1, 1,
-0.6742005, 0.5043909, -0.1620368, 1, 1, 1, 1, 1,
-0.6728188, -0.5075269, -0.8641916, 1, 1, 1, 1, 1,
-0.6698658, -0.09170319, 0.1061234, 1, 1, 1, 1, 1,
-0.6665813, 0.2751614, -0.2176107, 1, 1, 1, 1, 1,
-0.6655231, -0.3776295, -2.583664, 1, 1, 1, 1, 1,
-0.6648337, -0.09493841, -0.9433832, 1, 1, 1, 1, 1,
-0.6644757, -0.1586017, -0.8408829, 1, 1, 1, 1, 1,
-0.6624173, 1.019626, 0.1562245, 1, 1, 1, 1, 1,
-0.6611195, -0.8001646, -1.757237, 1, 1, 1, 1, 1,
-0.6598929, 0.9250946, 0.6711298, 1, 1, 1, 1, 1,
-0.6588163, -2.172614, -1.859045, 0, 0, 1, 1, 1,
-0.6567019, -0.1683406, -2.197105, 1, 0, 0, 1, 1,
-0.6493049, 0.1959215, 0.604726, 1, 0, 0, 1, 1,
-0.6489393, -0.8320308, -2.854853, 1, 0, 0, 1, 1,
-0.6481215, -0.3114925, -0.6451191, 1, 0, 0, 1, 1,
-0.6451329, -0.2785761, -2.830035, 1, 0, 0, 1, 1,
-0.6411094, -0.5924882, -2.873587, 0, 0, 0, 1, 1,
-0.6327837, 1.516991, 0.1996386, 0, 0, 0, 1, 1,
-0.6319729, -1.29983, -2.635743, 0, 0, 0, 1, 1,
-0.6318042, -0.1595672, -2.275128, 0, 0, 0, 1, 1,
-0.6275485, 1.736768, -1.469464, 0, 0, 0, 1, 1,
-0.6269189, -0.350723, -2.949096, 0, 0, 0, 1, 1,
-0.626476, -0.9030626, -1.664755, 0, 0, 0, 1, 1,
-0.6216309, 1.310366, -0.4536276, 1, 1, 1, 1, 1,
-0.6208211, -0.2844554, -1.76413, 1, 1, 1, 1, 1,
-0.6204416, -0.218619, -3.152903, 1, 1, 1, 1, 1,
-0.6181703, 1.213925, -0.9188229, 1, 1, 1, 1, 1,
-0.6075742, -1.686597, -1.947784, 1, 1, 1, 1, 1,
-0.606703, 0.1664277, -0.7054098, 1, 1, 1, 1, 1,
-0.6066921, 0.1894375, -1.203914, 1, 1, 1, 1, 1,
-0.6065962, 0.04729822, -2.344156, 1, 1, 1, 1, 1,
-0.5914149, 1.01275, -0.9061764, 1, 1, 1, 1, 1,
-0.5868294, 1.139516, 1.401877, 1, 1, 1, 1, 1,
-0.5866255, -0.637973, -1.680829, 1, 1, 1, 1, 1,
-0.5832064, 0.5202653, -0.9079574, 1, 1, 1, 1, 1,
-0.5800483, -1.243425, -2.3094, 1, 1, 1, 1, 1,
-0.5741683, 0.002998573, -2.703508, 1, 1, 1, 1, 1,
-0.5717683, -1.11438, -3.020868, 1, 1, 1, 1, 1,
-0.5705351, -0.2871812, -3.767782, 0, 0, 1, 1, 1,
-0.5691657, 1.114129, -1.714241, 1, 0, 0, 1, 1,
-0.5681962, -0.7522054, -3.291385, 1, 0, 0, 1, 1,
-0.5654395, 0.004603984, 0.1008109, 1, 0, 0, 1, 1,
-0.5648469, -2.945296, -3.767292, 1, 0, 0, 1, 1,
-0.5618259, 0.6730995, -0.1240239, 1, 0, 0, 1, 1,
-0.5532611, -1.173584, -2.936498, 0, 0, 0, 1, 1,
-0.5494488, -0.7137748, -2.520867, 0, 0, 0, 1, 1,
-0.548749, -0.2200752, -0.6542317, 0, 0, 0, 1, 1,
-0.5472472, -1.792135, -2.914315, 0, 0, 0, 1, 1,
-0.5470928, 0.3644868, -0.2359699, 0, 0, 0, 1, 1,
-0.546925, 0.1427289, -2.326946, 0, 0, 0, 1, 1,
-0.5413743, -0.9830009, -2.875722, 0, 0, 0, 1, 1,
-0.5397046, -1.335709, -3.141841, 1, 1, 1, 1, 1,
-0.5381167, -1.213022, -3.034308, 1, 1, 1, 1, 1,
-0.5360084, 0.6615214, -2.403802, 1, 1, 1, 1, 1,
-0.5355057, 0.6220459, -1.531137, 1, 1, 1, 1, 1,
-0.5352092, 1.255381, 0.0211396, 1, 1, 1, 1, 1,
-0.5347888, 0.8157426, -1.280707, 1, 1, 1, 1, 1,
-0.533896, -0.4817928, -1.698239, 1, 1, 1, 1, 1,
-0.5307239, -1.099101, -4.490427, 1, 1, 1, 1, 1,
-0.5263698, 0.6199089, 0.01470444, 1, 1, 1, 1, 1,
-0.5249217, -0.3443914, -0.8815581, 1, 1, 1, 1, 1,
-0.5242261, -0.1769051, -3.596363, 1, 1, 1, 1, 1,
-0.5241607, -0.5179957, -0.9802358, 1, 1, 1, 1, 1,
-0.5227, -0.6925231, -3.509668, 1, 1, 1, 1, 1,
-0.5115118, -0.01691771, -1.461011, 1, 1, 1, 1, 1,
-0.5101948, 0.8620958, -0.6335149, 1, 1, 1, 1, 1,
-0.5065641, 0.5197657, -1.349127, 0, 0, 1, 1, 1,
-0.503438, -0.5733377, -1.925465, 1, 0, 0, 1, 1,
-0.498105, 0.4932081, -1.715621, 1, 0, 0, 1, 1,
-0.4964864, -0.4458368, -4.656008, 1, 0, 0, 1, 1,
-0.4957846, 0.820577, -0.3225686, 1, 0, 0, 1, 1,
-0.4823747, -1.092726, -4.796209, 1, 0, 0, 1, 1,
-0.4806461, 1.038243, -0.4931502, 0, 0, 0, 1, 1,
-0.4751885, 0.01386553, -0.5414654, 0, 0, 0, 1, 1,
-0.4750949, -0.1000841, -0.9675027, 0, 0, 0, 1, 1,
-0.4748923, -0.5571802, -2.970714, 0, 0, 0, 1, 1,
-0.4737297, 0.2619709, -1.303196, 0, 0, 0, 1, 1,
-0.4729505, -1.269793, -2.785897, 0, 0, 0, 1, 1,
-0.4717375, -1.350529, -2.247873, 0, 0, 0, 1, 1,
-0.466394, -0.08220767, -1.887724, 1, 1, 1, 1, 1,
-0.4643422, -0.07768552, -1.374454, 1, 1, 1, 1, 1,
-0.4621462, -1.569446, -4.101859, 1, 1, 1, 1, 1,
-0.4614958, -0.6719219, -2.822013, 1, 1, 1, 1, 1,
-0.4579417, -1.190618, -3.219166, 1, 1, 1, 1, 1,
-0.4541974, 0.7889374, 0.4263908, 1, 1, 1, 1, 1,
-0.454043, -1.053095, -3.229042, 1, 1, 1, 1, 1,
-0.4536788, 0.801957, 1.249866, 1, 1, 1, 1, 1,
-0.4479137, 1.260473, -0.3953178, 1, 1, 1, 1, 1,
-0.444486, 0.9764962, 0.8920972, 1, 1, 1, 1, 1,
-0.4439282, -0.2079186, -2.436022, 1, 1, 1, 1, 1,
-0.4417345, 0.4665818, -0.2442526, 1, 1, 1, 1, 1,
-0.4415554, 0.05858063, 0.249821, 1, 1, 1, 1, 1,
-0.4415325, 0.2580419, 0.3379247, 1, 1, 1, 1, 1,
-0.4382764, 0.2135185, -0.3087318, 1, 1, 1, 1, 1,
-0.4353364, -1.380773, -1.738945, 0, 0, 1, 1, 1,
-0.4328857, -1.004733, -1.321569, 1, 0, 0, 1, 1,
-0.4317421, -0.831187, -1.213378, 1, 0, 0, 1, 1,
-0.4309298, 0.6954069, -1.587051, 1, 0, 0, 1, 1,
-0.4259546, -0.7035089, -3.647627, 1, 0, 0, 1, 1,
-0.4249703, -2.069943, -2.940628, 1, 0, 0, 1, 1,
-0.4171302, 0.3843696, -1.389348, 0, 0, 0, 1, 1,
-0.4108973, -1.816566, -3.335186, 0, 0, 0, 1, 1,
-0.4039841, 1.096616, 0.4842795, 0, 0, 0, 1, 1,
-0.4025708, 0.8689952, -1.364749, 0, 0, 0, 1, 1,
-0.3979256, 0.1187011, -0.6521844, 0, 0, 0, 1, 1,
-0.3960577, -1.049732, -3.312236, 0, 0, 0, 1, 1,
-0.3941981, 0.1154097, -2.607015, 0, 0, 0, 1, 1,
-0.3931459, 0.206994, -1.984145, 1, 1, 1, 1, 1,
-0.3880028, -1.452051, -1.717168, 1, 1, 1, 1, 1,
-0.3869926, -0.3666143, -1.537925, 1, 1, 1, 1, 1,
-0.3842851, 0.3850315, -1.919903, 1, 1, 1, 1, 1,
-0.3825958, -1.524924, -2.047282, 1, 1, 1, 1, 1,
-0.3810864, 1.618284, 1.622495, 1, 1, 1, 1, 1,
-0.3798189, 0.8032757, 0.8907545, 1, 1, 1, 1, 1,
-0.3786966, -1.019765, -2.164999, 1, 1, 1, 1, 1,
-0.3734245, -0.1571761, -2.831501, 1, 1, 1, 1, 1,
-0.3704779, -0.3443818, -2.759697, 1, 1, 1, 1, 1,
-0.3681644, -0.267807, -2.722193, 1, 1, 1, 1, 1,
-0.3639781, 1.480001, -0.5699382, 1, 1, 1, 1, 1,
-0.3619624, -0.4610917, -2.449054, 1, 1, 1, 1, 1,
-0.3608836, 0.3544842, -3.120314, 1, 1, 1, 1, 1,
-0.3607711, -0.1299151, -3.180245, 1, 1, 1, 1, 1,
-0.359016, -0.2664047, -1.463294, 0, 0, 1, 1, 1,
-0.354774, 0.07432666, -3.143465, 1, 0, 0, 1, 1,
-0.354746, 1.11669, 0.1978846, 1, 0, 0, 1, 1,
-0.3486871, -0.2368106, -1.544934, 1, 0, 0, 1, 1,
-0.3454731, -0.2183559, -2.671171, 1, 0, 0, 1, 1,
-0.3408569, -1.186105, -4.970211, 1, 0, 0, 1, 1,
-0.3402836, -0.8636779, -2.809, 0, 0, 0, 1, 1,
-0.3402356, 0.670345, 1.478447, 0, 0, 0, 1, 1,
-0.3372509, 0.9750782, -0.986027, 0, 0, 0, 1, 1,
-0.3371348, 0.33032, 0.3037044, 0, 0, 0, 1, 1,
-0.3322238, 1.783385, -0.02596095, 0, 0, 0, 1, 1,
-0.3303451, 0.3073969, 0.612779, 0, 0, 0, 1, 1,
-0.3232376, 0.9075187, -0.5114065, 0, 0, 0, 1, 1,
-0.3212657, -0.8634003, -2.612852, 1, 1, 1, 1, 1,
-0.3204668, -1.046988, -4.718752, 1, 1, 1, 1, 1,
-0.3195371, 0.4536364, -0.04582409, 1, 1, 1, 1, 1,
-0.3159747, 1.241887, -0.1556511, 1, 1, 1, 1, 1,
-0.30653, -2.327371, -2.89028, 1, 1, 1, 1, 1,
-0.3050729, -1.879032, -2.332458, 1, 1, 1, 1, 1,
-0.3003981, -2.362008, -2.214358, 1, 1, 1, 1, 1,
-0.2998795, -0.1014739, -1.708443, 1, 1, 1, 1, 1,
-0.2995664, 1.178229, -0.4545516, 1, 1, 1, 1, 1,
-0.2986867, 1.708509, -0.4209371, 1, 1, 1, 1, 1,
-0.2942767, -0.4046555, -2.228917, 1, 1, 1, 1, 1,
-0.2849489, 1.425706, -2.001771, 1, 1, 1, 1, 1,
-0.2835065, -1.107994, -4.160558, 1, 1, 1, 1, 1,
-0.2833552, 0.5223727, -2.012621, 1, 1, 1, 1, 1,
-0.2833042, -0.7352633, -1.489901, 1, 1, 1, 1, 1,
-0.2819773, -0.899047, -4.661418, 0, 0, 1, 1, 1,
-0.2780654, -0.3204322, -1.88241, 1, 0, 0, 1, 1,
-0.2772178, 1.502463, 1.412816, 1, 0, 0, 1, 1,
-0.2769721, 1.548864, -0.5451453, 1, 0, 0, 1, 1,
-0.2748158, -0.1784836, -2.710815, 1, 0, 0, 1, 1,
-0.2743186, 1.130877, 0.4059989, 1, 0, 0, 1, 1,
-0.2739998, -0.01324566, -0.890736, 0, 0, 0, 1, 1,
-0.2714902, -0.7482316, -5.064564, 0, 0, 0, 1, 1,
-0.2624714, -0.2788745, -1.26909, 0, 0, 0, 1, 1,
-0.2580591, -0.8821594, -2.977794, 0, 0, 0, 1, 1,
-0.2513492, 0.1614603, -0.8216882, 0, 0, 0, 1, 1,
-0.2480032, 1.415255, -0.7571167, 0, 0, 0, 1, 1,
-0.2434584, -1.862872, -2.611968, 0, 0, 0, 1, 1,
-0.243048, -0.01986914, -1.304543, 1, 1, 1, 1, 1,
-0.2384232, 0.9237647, 0.06612024, 1, 1, 1, 1, 1,
-0.2375496, 1.376795, -0.6870089, 1, 1, 1, 1, 1,
-0.2358802, -0.6838217, -3.304717, 1, 1, 1, 1, 1,
-0.2358187, -0.440133, -2.974751, 1, 1, 1, 1, 1,
-0.2336869, 0.1814808, -2.060046, 1, 1, 1, 1, 1,
-0.2327158, -0.2674583, -2.20967, 1, 1, 1, 1, 1,
-0.2308535, 1.069245, -0.6595641, 1, 1, 1, 1, 1,
-0.2295425, -0.7975316, -4.167332, 1, 1, 1, 1, 1,
-0.22492, 0.02753007, -1.607147, 1, 1, 1, 1, 1,
-0.2246368, -0.2300588, -2.996373, 1, 1, 1, 1, 1,
-0.2149075, -1.732618, -2.845631, 1, 1, 1, 1, 1,
-0.2089508, 1.615651, -1.700809, 1, 1, 1, 1, 1,
-0.2058159, -2.105844, -2.053005, 1, 1, 1, 1, 1,
-0.2056211, 0.4439165, 0.5074463, 1, 1, 1, 1, 1,
-0.2011639, 0.8264409, -1.906444, 0, 0, 1, 1, 1,
-0.1990855, 1.574337, -1.718469, 1, 0, 0, 1, 1,
-0.1978866, 0.5656857, -1.546465, 1, 0, 0, 1, 1,
-0.1946914, 0.2230682, -1.625791, 1, 0, 0, 1, 1,
-0.1919019, -0.8906307, -2.742757, 1, 0, 0, 1, 1,
-0.1917594, 0.6955082, 0.145231, 1, 0, 0, 1, 1,
-0.1909113, -1.092589, -1.099274, 0, 0, 0, 1, 1,
-0.1902312, 0.2378714, 0.3131545, 0, 0, 0, 1, 1,
-0.1870774, -0.05966648, -1.912002, 0, 0, 0, 1, 1,
-0.1833005, 0.7908986, 0.4129341, 0, 0, 0, 1, 1,
-0.1796741, 0.5218054, -1.560052, 0, 0, 0, 1, 1,
-0.178573, 1.430761, 0.3607853, 0, 0, 0, 1, 1,
-0.1764603, -1.364197, -2.084605, 0, 0, 0, 1, 1,
-0.1744726, -0.4371055, -1.287658, 1, 1, 1, 1, 1,
-0.1726724, -0.3765608, -1.341381, 1, 1, 1, 1, 1,
-0.1701273, -1.908472, -4.079743, 1, 1, 1, 1, 1,
-0.1699787, 1.28356, 1.997076, 1, 1, 1, 1, 1,
-0.1690581, 0.3803863, 0.2931319, 1, 1, 1, 1, 1,
-0.1681566, 0.5300682, -1.029218, 1, 1, 1, 1, 1,
-0.1678482, 0.2593426, -1.230946, 1, 1, 1, 1, 1,
-0.1475423, -0.2205055, -2.493615, 1, 1, 1, 1, 1,
-0.1401744, 0.6223527, -0.3635476, 1, 1, 1, 1, 1,
-0.1372708, 0.2665557, 0.3073676, 1, 1, 1, 1, 1,
-0.1371342, -1.039753, -3.30194, 1, 1, 1, 1, 1,
-0.1369666, 0.3347303, -1.168301, 1, 1, 1, 1, 1,
-0.1333163, 0.5372023, 2.283634, 1, 1, 1, 1, 1,
-0.1333038, 0.515225, -1.39739, 1, 1, 1, 1, 1,
-0.129157, 1.35263, -1.378504, 1, 1, 1, 1, 1,
-0.1258839, 0.1038827, -0.9123358, 0, 0, 1, 1, 1,
-0.1247443, -0.7394265, -3.465966, 1, 0, 0, 1, 1,
-0.1219373, -0.8006875, -2.528968, 1, 0, 0, 1, 1,
-0.1212877, 1.560484, 0.3221069, 1, 0, 0, 1, 1,
-0.1107614, 0.9673203, -0.1945484, 1, 0, 0, 1, 1,
-0.1071417, -0.3313703, -2.286817, 1, 0, 0, 1, 1,
-0.1053864, -0.2813451, -2.406566, 0, 0, 0, 1, 1,
-0.1039767, 1.800693, 0.4323241, 0, 0, 0, 1, 1,
-0.100723, 0.7383837, -1.54995, 0, 0, 0, 1, 1,
-0.09945574, 0.1698928, -0.265752, 0, 0, 0, 1, 1,
-0.09518418, -1.360952, -1.502611, 0, 0, 0, 1, 1,
-0.08878332, -0.009205303, -1.040166, 0, 0, 0, 1, 1,
-0.08785729, 0.3395577, -1.507133, 0, 0, 0, 1, 1,
-0.08265008, 1.650983, 0.7163503, 1, 1, 1, 1, 1,
-0.07301219, 0.7754856, 1.277281, 1, 1, 1, 1, 1,
-0.07246582, -0.2789207, -3.418609, 1, 1, 1, 1, 1,
-0.07125667, 0.4262148, 0.9325538, 1, 1, 1, 1, 1,
-0.07014726, -0.3398692, -3.199766, 1, 1, 1, 1, 1,
-0.06929483, -0.671477, -3.21471, 1, 1, 1, 1, 1,
-0.06630633, 0.5658563, 0.0189577, 1, 1, 1, 1, 1,
-0.06147426, -0.5896747, -2.533729, 1, 1, 1, 1, 1,
-0.05705921, 1.550295, 0.4340529, 1, 1, 1, 1, 1,
-0.05558064, 2.072726, -0.488582, 1, 1, 1, 1, 1,
-0.0513377, 1.040186, -1.645287, 1, 1, 1, 1, 1,
-0.04951838, 1.009805, 1.313644, 1, 1, 1, 1, 1,
-0.04934896, -2.554608, -2.628165, 1, 1, 1, 1, 1,
-0.04869774, 1.701295, -0.6996185, 1, 1, 1, 1, 1,
-0.04594044, -0.7685181, -3.588581, 1, 1, 1, 1, 1,
-0.04471663, -3.464866, -5.006262, 0, 0, 1, 1, 1,
-0.04007591, 0.2553146, -1.617274, 1, 0, 0, 1, 1,
-0.03611895, 1.12815, -2.022189, 1, 0, 0, 1, 1,
-0.03515204, -0.7488942, -3.038765, 1, 0, 0, 1, 1,
-0.03312717, -0.4410936, -2.439373, 1, 0, 0, 1, 1,
-0.03212684, 0.6947395, -0.461132, 1, 0, 0, 1, 1,
-0.03154444, -0.2659937, -3.407085, 0, 0, 0, 1, 1,
-0.03128758, 0.9017296, -1.44089, 0, 0, 0, 1, 1,
-0.03090789, -0.7873918, -3.480695, 0, 0, 0, 1, 1,
-0.02793116, -1.305445, -3.653107, 0, 0, 0, 1, 1,
-0.02532301, 0.09320291, -0.2212182, 0, 0, 0, 1, 1,
-0.02126069, 0.402459, 0.3371288, 0, 0, 0, 1, 1,
-0.01987844, 0.417815, 2.323159, 0, 0, 0, 1, 1,
-0.01985929, -0.1265042, -2.538469, 1, 1, 1, 1, 1,
-0.0178421, -0.328534, -0.9167303, 1, 1, 1, 1, 1,
-0.01022012, -1.640775, -2.917096, 1, 1, 1, 1, 1,
-0.008426412, 0.07175834, 0.289377, 1, 1, 1, 1, 1,
-0.007285489, -1.501456, -4.146163, 1, 1, 1, 1, 1,
0.0003472968, -1.544024, 1.855789, 1, 1, 1, 1, 1,
0.0006601444, -0.8771412, 2.628788, 1, 1, 1, 1, 1,
0.0006607851, -0.337076, 3.592535, 1, 1, 1, 1, 1,
0.004470293, 0.2831409, 0.8998467, 1, 1, 1, 1, 1,
0.007446904, 1.660181, -0.1203122, 1, 1, 1, 1, 1,
0.008476589, 2.512288, 0.4151428, 1, 1, 1, 1, 1,
0.009301497, 0.1199659, 0.8103496, 1, 1, 1, 1, 1,
0.01139535, -0.8878715, 5.505229, 1, 1, 1, 1, 1,
0.0117414, -0.4151669, 3.961374, 1, 1, 1, 1, 1,
0.01359054, 0.5836024, -0.5430426, 1, 1, 1, 1, 1,
0.02312422, 0.3578871, 1.812304, 0, 0, 1, 1, 1,
0.023747, -0.7465122, 4.01496, 1, 0, 0, 1, 1,
0.02719873, 0.2472538, -1.736383, 1, 0, 0, 1, 1,
0.03911017, -0.19008, 2.413215, 1, 0, 0, 1, 1,
0.03956106, -0.05341163, 1.24792, 1, 0, 0, 1, 1,
0.04254726, -0.5014911, 0.5405495, 1, 0, 0, 1, 1,
0.05426072, -1.068067, 1.836169, 0, 0, 0, 1, 1,
0.057404, -1.278748, 2.745411, 0, 0, 0, 1, 1,
0.05920114, 2.095271, 1.095908, 0, 0, 0, 1, 1,
0.06873465, 0.753106, 0.3818743, 0, 0, 0, 1, 1,
0.06953439, -0.01260807, 2.16569, 0, 0, 0, 1, 1,
0.07448575, -0.7295665, 3.583409, 0, 0, 0, 1, 1,
0.0809384, 0.007766526, 0.854687, 0, 0, 0, 1, 1,
0.08096176, -2.086734, 2.584996, 1, 1, 1, 1, 1,
0.08172562, 1.501204, 2.198915, 1, 1, 1, 1, 1,
0.08303806, 0.289547, -1.29819, 1, 1, 1, 1, 1,
0.08354338, 0.2285455, 1.403066, 1, 1, 1, 1, 1,
0.0849935, -1.139296, 3.438175, 1, 1, 1, 1, 1,
0.08586835, 1.322574, -0.7422643, 1, 1, 1, 1, 1,
0.0878547, 0.6422403, -0.3401908, 1, 1, 1, 1, 1,
0.08837486, 0.9149571, 3.49817, 1, 1, 1, 1, 1,
0.0890874, -0.529274, 2.093495, 1, 1, 1, 1, 1,
0.09042665, -2.012023, 2.76483, 1, 1, 1, 1, 1,
0.09512942, 0.3318325, -0.2807559, 1, 1, 1, 1, 1,
0.09673741, -1.210296, 3.25892, 1, 1, 1, 1, 1,
0.09908139, 0.07635368, 1.475397, 1, 1, 1, 1, 1,
0.1052716, 2.131271, -0.8801273, 1, 1, 1, 1, 1,
0.109598, 1.23058, 0.9293495, 1, 1, 1, 1, 1,
0.1106231, 0.1273282, 0.928921, 0, 0, 1, 1, 1,
0.1122594, -0.5822344, 3.047251, 1, 0, 0, 1, 1,
0.1180161, -0.7429247, 2.799406, 1, 0, 0, 1, 1,
0.1226265, -0.3299665, 2.821805, 1, 0, 0, 1, 1,
0.1243, 0.2382306, -0.7782049, 1, 0, 0, 1, 1,
0.1256161, -0.5465257, 4.106746, 1, 0, 0, 1, 1,
0.1367472, -0.3082558, 4.286955, 0, 0, 0, 1, 1,
0.1370039, 3.319293, 0.4197432, 0, 0, 0, 1, 1,
0.1372588, 1.248936, -1.318078, 0, 0, 0, 1, 1,
0.1385553, 1.162183, -0.5373036, 0, 0, 0, 1, 1,
0.1388741, -0.2001671, 2.104679, 0, 0, 0, 1, 1,
0.1430613, -0.09155645, 2.189654, 0, 0, 0, 1, 1,
0.1456559, -0.4958411, 4.041308, 0, 0, 0, 1, 1,
0.1538569, -0.4338684, 4.362568, 1, 1, 1, 1, 1,
0.1557897, -0.1835704, 1.902719, 1, 1, 1, 1, 1,
0.1565241, 0.01133402, 1.388994, 1, 1, 1, 1, 1,
0.1575475, -1.050776, 2.312837, 1, 1, 1, 1, 1,
0.1620661, -0.6989571, 1.619394, 1, 1, 1, 1, 1,
0.1640159, 0.03799991, 0.9662695, 1, 1, 1, 1, 1,
0.1643488, -1.013486, 2.822152, 1, 1, 1, 1, 1,
0.1680971, -1.746184, 0.7768834, 1, 1, 1, 1, 1,
0.1682192, 0.5835652, 0.6502094, 1, 1, 1, 1, 1,
0.1713816, -1.621948, 0.3664297, 1, 1, 1, 1, 1,
0.1786483, 1.130448, 0.07668144, 1, 1, 1, 1, 1,
0.181703, -0.596704, 1.226957, 1, 1, 1, 1, 1,
0.18527, -0.4860654, 1.872773, 1, 1, 1, 1, 1,
0.1923327, 0.2330017, 1.5939, 1, 1, 1, 1, 1,
0.1955634, -0.3204464, 2.220932, 1, 1, 1, 1, 1,
0.1991386, -1.559877, 2.725057, 0, 0, 1, 1, 1,
0.1993188, 0.2296211, 1.322885, 1, 0, 0, 1, 1,
0.2013671, -1.979544, 2.865659, 1, 0, 0, 1, 1,
0.2033567, -0.8714239, 2.849447, 1, 0, 0, 1, 1,
0.2044118, -0.2357566, 2.325769, 1, 0, 0, 1, 1,
0.2069123, -1.478402, 3.188987, 1, 0, 0, 1, 1,
0.2069427, -0.3301842, 1.724341, 0, 0, 0, 1, 1,
0.2142553, 0.3527078, -0.9173357, 0, 0, 0, 1, 1,
0.2167053, 1.392912, 1.091741, 0, 0, 0, 1, 1,
0.2190278, -2.398439, 3.312444, 0, 0, 0, 1, 1,
0.221837, 0.2740306, 0.4794983, 0, 0, 0, 1, 1,
0.2248461, -0.1676043, 1.94826, 0, 0, 0, 1, 1,
0.2257036, -0.1484865, 0.4680619, 0, 0, 0, 1, 1,
0.2323711, 0.06465366, 1.269692, 1, 1, 1, 1, 1,
0.2343003, 1.144274, 0.1090442, 1, 1, 1, 1, 1,
0.2348184, 0.8981472, 1.005838, 1, 1, 1, 1, 1,
0.2423787, -1.617894, 3.341694, 1, 1, 1, 1, 1,
0.2444277, -0.316943, 2.107343, 1, 1, 1, 1, 1,
0.2461078, -0.3833796, 2.655355, 1, 1, 1, 1, 1,
0.2467197, 0.8244069, -0.9231412, 1, 1, 1, 1, 1,
0.2495635, 0.8033842, -0.2880113, 1, 1, 1, 1, 1,
0.2504267, 1.112041, 0.353168, 1, 1, 1, 1, 1,
0.2513546, 2.081064, 1.419506, 1, 1, 1, 1, 1,
0.2515548, 1.14888, -0.8977153, 1, 1, 1, 1, 1,
0.2575009, 1.09922, 1.327665, 1, 1, 1, 1, 1,
0.2577879, -0.897746, 3.605474, 1, 1, 1, 1, 1,
0.2583953, 0.6162354, 2.23991, 1, 1, 1, 1, 1,
0.2603883, 0.2933517, 2.400227, 1, 1, 1, 1, 1,
0.2605632, 0.5779546, -0.7063565, 0, 0, 1, 1, 1,
0.2616273, -0.08474245, 2.210866, 1, 0, 0, 1, 1,
0.2623438, -0.133576, 1.329641, 1, 0, 0, 1, 1,
0.262637, -0.2813346, 3.510475, 1, 0, 0, 1, 1,
0.2637759, -0.2759753, 4.486967, 1, 0, 0, 1, 1,
0.2642806, -1.487888, 1.656445, 1, 0, 0, 1, 1,
0.2661608, 0.1608876, 1.663157, 0, 0, 0, 1, 1,
0.267267, -0.4741117, 2.418721, 0, 0, 0, 1, 1,
0.2750883, 0.5815899, 0.3643826, 0, 0, 0, 1, 1,
0.2790191, 0.9145254, 0.371616, 0, 0, 0, 1, 1,
0.2808687, 0.3853884, -1.577744, 0, 0, 0, 1, 1,
0.2832814, 0.7674253, 0.8221463, 0, 0, 0, 1, 1,
0.2841171, -0.6742252, 2.610988, 0, 0, 0, 1, 1,
0.2875395, -0.9281592, 2.98301, 1, 1, 1, 1, 1,
0.2879933, 1.05226, 1.316399, 1, 1, 1, 1, 1,
0.2883963, -0.3325158, 3.32626, 1, 1, 1, 1, 1,
0.2949294, -0.7973839, 1.868067, 1, 1, 1, 1, 1,
0.2996123, -0.704484, 4.7317, 1, 1, 1, 1, 1,
0.3011326, 0.4911929, -0.1051227, 1, 1, 1, 1, 1,
0.3014902, -0.6879854, 3.737712, 1, 1, 1, 1, 1,
0.3042164, -1.44449, 2.864009, 1, 1, 1, 1, 1,
0.3060295, 0.2769826, 0.3347926, 1, 1, 1, 1, 1,
0.3143944, 0.082689, 0.7077648, 1, 1, 1, 1, 1,
0.3144007, 1.230389, -1.337739, 1, 1, 1, 1, 1,
0.3146496, 1.008753, 1.072729, 1, 1, 1, 1, 1,
0.3150876, -1.807326, 2.735213, 1, 1, 1, 1, 1,
0.3318985, -1.213412, 4.728899, 1, 1, 1, 1, 1,
0.3333723, 0.4090065, -1.253471, 1, 1, 1, 1, 1,
0.3383693, 0.4757218, 0.4158525, 0, 0, 1, 1, 1,
0.3447736, 0.6261753, -1.606008, 1, 0, 0, 1, 1,
0.355642, -0.3322401, 1.896249, 1, 0, 0, 1, 1,
0.3567537, -0.17555, 2.881375, 1, 0, 0, 1, 1,
0.3568324, 2.367891, 0.4985838, 1, 0, 0, 1, 1,
0.360004, 1.522584, -0.5128953, 1, 0, 0, 1, 1,
0.3603216, 0.07958923, 0.9105662, 0, 0, 0, 1, 1,
0.3621146, -0.1133275, 2.855036, 0, 0, 0, 1, 1,
0.3642923, -0.8846392, 2.021901, 0, 0, 0, 1, 1,
0.3647878, 1.643829, 1.165554, 0, 0, 0, 1, 1,
0.3657046, 0.05157855, 3.134344, 0, 0, 0, 1, 1,
0.3673615, 1.466822, 0.5363909, 0, 0, 0, 1, 1,
0.3725436, 1.275386, 0.5487789, 0, 0, 0, 1, 1,
0.3735848, 0.03770547, 2.618828, 1, 1, 1, 1, 1,
0.3737304, -1.744114, 3.745647, 1, 1, 1, 1, 1,
0.3750217, 0.4310595, 1.096548, 1, 1, 1, 1, 1,
0.3790241, 0.2702418, 0.6016811, 1, 1, 1, 1, 1,
0.3849896, -0.8894839, 3.498464, 1, 1, 1, 1, 1,
0.3869681, 0.0005546622, 1.806555, 1, 1, 1, 1, 1,
0.3886375, -1.442477, 0.6490239, 1, 1, 1, 1, 1,
0.3943693, 0.06985722, 1.613536, 1, 1, 1, 1, 1,
0.3957498, -0.9225025, 3.594737, 1, 1, 1, 1, 1,
0.398442, 1.878499, 0.3986576, 1, 1, 1, 1, 1,
0.3989947, -0.4667849, 3.772613, 1, 1, 1, 1, 1,
0.4061577, -1.905022, 3.191315, 1, 1, 1, 1, 1,
0.406466, -0.04638664, 1.445016, 1, 1, 1, 1, 1,
0.4105817, -1.259264, 3.410543, 1, 1, 1, 1, 1,
0.4106106, 0.4725801, -0.1414791, 1, 1, 1, 1, 1,
0.4145658, -0.864215, 3.778654, 0, 0, 1, 1, 1,
0.4156252, -2.851845, 3.455596, 1, 0, 0, 1, 1,
0.4157892, 1.243451, -1.524267, 1, 0, 0, 1, 1,
0.4173904, -1.510899, 2.437274, 1, 0, 0, 1, 1,
0.4201021, 0.296609, 0.8332852, 1, 0, 0, 1, 1,
0.4231058, 1.231588, -0.07054694, 1, 0, 0, 1, 1,
0.4245887, -0.9100451, 2.360057, 0, 0, 0, 1, 1,
0.4261404, -0.3949378, 1.713473, 0, 0, 0, 1, 1,
0.4299588, 0.07144009, 1.424099, 0, 0, 0, 1, 1,
0.434175, 0.2062351, 2.012407, 0, 0, 0, 1, 1,
0.4344864, -0.02005941, 2.808111, 0, 0, 0, 1, 1,
0.4386933, -0.8612255, 3.561555, 0, 0, 0, 1, 1,
0.4387231, 1.71725, 1.416919, 0, 0, 0, 1, 1,
0.4398765, 0.9726612, 1.625494, 1, 1, 1, 1, 1,
0.4402115, 0.6272181, -0.5520094, 1, 1, 1, 1, 1,
0.440795, -1.04257, 2.680354, 1, 1, 1, 1, 1,
0.441589, 1.018012, 0.5485123, 1, 1, 1, 1, 1,
0.4418071, -0.4877585, 2.961, 1, 1, 1, 1, 1,
0.4430205, 1.524504, 0.2143269, 1, 1, 1, 1, 1,
0.4456393, 0.4591441, 1.944576, 1, 1, 1, 1, 1,
0.4506881, 0.4263088, 1.81651, 1, 1, 1, 1, 1,
0.4507843, 0.8109463, 1.814933, 1, 1, 1, 1, 1,
0.4544237, 0.3324771, -0.5552341, 1, 1, 1, 1, 1,
0.4591749, -1.893682, 2.515667, 1, 1, 1, 1, 1,
0.4597035, 1.156885, 0.9402236, 1, 1, 1, 1, 1,
0.4636149, -1.379326, 2.54968, 1, 1, 1, 1, 1,
0.4637886, 1.838296, -0.92444, 1, 1, 1, 1, 1,
0.4678782, -0.1525916, 2.510212, 1, 1, 1, 1, 1,
0.4733531, 0.9259564, 2.028254, 0, 0, 1, 1, 1,
0.4737219, -0.4275877, 2.079669, 1, 0, 0, 1, 1,
0.4744617, 1.307459, -0.9057616, 1, 0, 0, 1, 1,
0.4776061, -0.5799468, 1.048895, 1, 0, 0, 1, 1,
0.4801553, 0.6264829, 0.2662056, 1, 0, 0, 1, 1,
0.4856077, 0.45998, 1.377948, 1, 0, 0, 1, 1,
0.4884407, -0.08076203, 1.948429, 0, 0, 0, 1, 1,
0.4899818, 0.1851909, 0.5434111, 0, 0, 0, 1, 1,
0.491065, -0.582531, 2.287748, 0, 0, 0, 1, 1,
0.4960251, 0.4186135, 0.7361145, 0, 0, 0, 1, 1,
0.4966627, -0.6118845, 2.143411, 0, 0, 0, 1, 1,
0.4993737, 1.895426, 1.872425, 0, 0, 0, 1, 1,
0.5020135, 0.2090051, -0.1660316, 0, 0, 0, 1, 1,
0.5022979, 0.2069298, 2.126639, 1, 1, 1, 1, 1,
0.5133312, -0.2004894, 3.340342, 1, 1, 1, 1, 1,
0.5140429, 0.9836027, -1.065824, 1, 1, 1, 1, 1,
0.515939, -0.6440778, 1.370602, 1, 1, 1, 1, 1,
0.5202114, -1.297704, 2.969608, 1, 1, 1, 1, 1,
0.520721, 0.6467879, -0.2827802, 1, 1, 1, 1, 1,
0.5209198, 1.549281, -0.1098081, 1, 1, 1, 1, 1,
0.5253121, 1.562777, 1.233804, 1, 1, 1, 1, 1,
0.5282488, -0.9027631, 3.816681, 1, 1, 1, 1, 1,
0.531252, 1.038951, 0.1412725, 1, 1, 1, 1, 1,
0.5445691, -0.1415341, 1.146688, 1, 1, 1, 1, 1,
0.5450237, 0.2131165, 1.574011, 1, 1, 1, 1, 1,
0.5452262, 1.738272, -0.2429799, 1, 1, 1, 1, 1,
0.5496402, 0.4897634, 1.517562, 1, 1, 1, 1, 1,
0.5542163, -0.4132418, 2.232392, 1, 1, 1, 1, 1,
0.5543606, -1.782234, 2.508683, 0, 0, 1, 1, 1,
0.5607005, -0.2678159, 2.544959, 1, 0, 0, 1, 1,
0.5611774, 0.3424173, -0.8832939, 1, 0, 0, 1, 1,
0.5679953, -0.6060717, 1.208625, 1, 0, 0, 1, 1,
0.5719456, -0.7037435, 2.940866, 1, 0, 0, 1, 1,
0.5760767, -0.4714912, 1.932789, 1, 0, 0, 1, 1,
0.5765224, 1.643228, -1.09612, 0, 0, 0, 1, 1,
0.5811312, -0.7194612, 2.972407, 0, 0, 0, 1, 1,
0.5828066, -0.4966017, 2.269298, 0, 0, 0, 1, 1,
0.5828823, 0.7915214, 2.292163, 0, 0, 0, 1, 1,
0.5848101, 0.172587, -0.2708872, 0, 0, 0, 1, 1,
0.5850524, -0.226078, 0.8208538, 0, 0, 0, 1, 1,
0.5860215, -0.9170036, 2.307752, 0, 0, 0, 1, 1,
0.5871666, -0.2927789, 1.908244, 1, 1, 1, 1, 1,
0.5891173, 0.6196425, 0.7552106, 1, 1, 1, 1, 1,
0.5902153, -0.1034466, 0.5747188, 1, 1, 1, 1, 1,
0.5957422, 0.3080675, 0.1005693, 1, 1, 1, 1, 1,
0.5966699, -0.9497598, 2.924294, 1, 1, 1, 1, 1,
0.5983647, 0.5853042, -0.2848151, 1, 1, 1, 1, 1,
0.5985427, -1.075791, 4.163892, 1, 1, 1, 1, 1,
0.5993733, 0.1813736, 0.4844607, 1, 1, 1, 1, 1,
0.5997655, 0.9683738, 1.283943, 1, 1, 1, 1, 1,
0.6035165, 0.3065294, 1.400195, 1, 1, 1, 1, 1,
0.6052186, 1.058881, 0.8520623, 1, 1, 1, 1, 1,
0.6073278, -1.496508, 4.407048, 1, 1, 1, 1, 1,
0.6127782, 1.616986, 2.60992, 1, 1, 1, 1, 1,
0.6139162, 1.25897, -1.988362, 1, 1, 1, 1, 1,
0.6168557, 1.666187, 1.647062, 1, 1, 1, 1, 1,
0.6192897, 2.377025, -1.23096, 0, 0, 1, 1, 1,
0.6242995, -0.141659, 0.9060777, 1, 0, 0, 1, 1,
0.6246093, 0.3858605, 2.014215, 1, 0, 0, 1, 1,
0.626363, 0.8706538, 0.7369226, 1, 0, 0, 1, 1,
0.6312072, 0.4176202, 1.983784, 1, 0, 0, 1, 1,
0.6377872, 0.3680523, 1.451771, 1, 0, 0, 1, 1,
0.6423965, -2.039532, 2.103842, 0, 0, 0, 1, 1,
0.6429102, 0.2514549, 1.078792, 0, 0, 0, 1, 1,
0.642931, 0.6234423, 1.104819, 0, 0, 0, 1, 1,
0.6487824, 0.9610207, 1.212505, 0, 0, 0, 1, 1,
0.6490855, 1.152784, 1.232428, 0, 0, 0, 1, 1,
0.6583619, -2.563606, 2.422583, 0, 0, 0, 1, 1,
0.6632087, 0.7735546, 0.8318694, 0, 0, 0, 1, 1,
0.6638004, 0.2139572, 0.5048527, 1, 1, 1, 1, 1,
0.6788444, 0.678929, 2.777703, 1, 1, 1, 1, 1,
0.678874, 1.768836, 0.978192, 1, 1, 1, 1, 1,
0.6812727, 1.028964, 1.811912, 1, 1, 1, 1, 1,
0.6816849, -1.362904, 3.125655, 1, 1, 1, 1, 1,
0.6825186, -0.7223031, 2.424642, 1, 1, 1, 1, 1,
0.6827617, 0.2245599, 2.048411, 1, 1, 1, 1, 1,
0.682831, -2.942827, 4.07478, 1, 1, 1, 1, 1,
0.6836099, -0.244699, 1.854779, 1, 1, 1, 1, 1,
0.6842823, -0.3300567, 1.982888, 1, 1, 1, 1, 1,
0.6844784, 2.492339, 0.3576967, 1, 1, 1, 1, 1,
0.6846463, 0.4970492, 1.481047, 1, 1, 1, 1, 1,
0.6862555, -1.627703, 1.968497, 1, 1, 1, 1, 1,
0.6868448, 0.5347703, 1.57905, 1, 1, 1, 1, 1,
0.6876326, 0.8336233, -0.3127315, 1, 1, 1, 1, 1,
0.6952851, -0.7997189, 3.116319, 0, 0, 1, 1, 1,
0.6955534, -1.633786, 2.607014, 1, 0, 0, 1, 1,
0.7045269, -1.999892, 2.12247, 1, 0, 0, 1, 1,
0.7123611, 0.8170255, 1.155242, 1, 0, 0, 1, 1,
0.716353, 0.3489226, 0.01327334, 1, 0, 0, 1, 1,
0.7166409, 1.006558, 0.7215364, 1, 0, 0, 1, 1,
0.7173154, -0.9614811, 1.461606, 0, 0, 0, 1, 1,
0.7185845, -2.522725, 2.978681, 0, 0, 0, 1, 1,
0.7214278, -0.2487485, 1.488499, 0, 0, 0, 1, 1,
0.7264008, -1.40154, 3.326308, 0, 0, 0, 1, 1,
0.7286715, 1.259709, 0.5608637, 0, 0, 0, 1, 1,
0.7307315, -1.290347, 3.197434, 0, 0, 0, 1, 1,
0.7366971, -0.2517579, 1.487384, 0, 0, 0, 1, 1,
0.737915, -1.133475, 4.502428, 1, 1, 1, 1, 1,
0.7459458, 1.611268, -0.4778556, 1, 1, 1, 1, 1,
0.7505848, 0.3773561, 0.3249128, 1, 1, 1, 1, 1,
0.7523381, 0.236831, 0.8812742, 1, 1, 1, 1, 1,
0.7526166, -0.753492, 3.281478, 1, 1, 1, 1, 1,
0.7535424, 0.8004968, 0.1699894, 1, 1, 1, 1, 1,
0.758991, 1.920731, 0.8157641, 1, 1, 1, 1, 1,
0.7593866, 0.7271431, 2.097402, 1, 1, 1, 1, 1,
0.7594357, 0.6034984, 0.3023526, 1, 1, 1, 1, 1,
0.7636203, -1.197916, 3.275112, 1, 1, 1, 1, 1,
0.7650097, -0.2692294, 4.239074, 1, 1, 1, 1, 1,
0.7666456, -0.3931929, 0.4042576, 1, 1, 1, 1, 1,
0.7668929, 0.06683521, 0.6091856, 1, 1, 1, 1, 1,
0.7708377, -1.20349, 3.110539, 1, 1, 1, 1, 1,
0.7784849, -1.746326, 2.395512, 1, 1, 1, 1, 1,
0.7853853, -1.561984, 3.081428, 0, 0, 1, 1, 1,
0.7862595, 0.9695601, 1.348915, 1, 0, 0, 1, 1,
0.7913456, 1.477465, 0.792726, 1, 0, 0, 1, 1,
0.7930604, -0.9881315, 2.42578, 1, 0, 0, 1, 1,
0.798121, 0.5414668, 1.202577, 1, 0, 0, 1, 1,
0.7988676, 1.411581, 1.927937, 1, 0, 0, 1, 1,
0.8037101, 0.1000701, 0.5357934, 0, 0, 0, 1, 1,
0.8117933, -0.04046793, 1.430401, 0, 0, 0, 1, 1,
0.81327, 0.6971713, 2.209982, 0, 0, 0, 1, 1,
0.8133897, 1.365636, 0.7909008, 0, 0, 0, 1, 1,
0.8141482, -0.6782741, 3.230759, 0, 0, 0, 1, 1,
0.8185263, -0.3295067, 1.737319, 0, 0, 0, 1, 1,
0.8187557, -0.6804925, 3.812414, 0, 0, 0, 1, 1,
0.820703, 1.75713, 0.2874937, 1, 1, 1, 1, 1,
0.8236358, 0.4661778, 0.3590829, 1, 1, 1, 1, 1,
0.8249555, 1.387895, 0.9135427, 1, 1, 1, 1, 1,
0.8266671, -0.3441879, 1.274359, 1, 1, 1, 1, 1,
0.827906, 0.2796361, 0.05498344, 1, 1, 1, 1, 1,
0.8292437, -0.4287449, 2.981398, 1, 1, 1, 1, 1,
0.8350372, -1.576343, 0.2429157, 1, 1, 1, 1, 1,
0.8379288, 2.025711, -0.8312883, 1, 1, 1, 1, 1,
0.844129, 0.7380469, 2.513435, 1, 1, 1, 1, 1,
0.8464379, 2.647314, 1.811683, 1, 1, 1, 1, 1,
0.8469678, -1.589619, 4.441807, 1, 1, 1, 1, 1,
0.8528007, 0.6115603, 0.9579198, 1, 1, 1, 1, 1,
0.8593732, 1.034626, -0.3818642, 1, 1, 1, 1, 1,
0.8638287, -1.145973, 2.308936, 1, 1, 1, 1, 1,
0.8642907, -0.8541849, 1.112182, 1, 1, 1, 1, 1,
0.8683668, -0.2515266, 2.077276, 0, 0, 1, 1, 1,
0.8704134, 0.6995082, 1.9481, 1, 0, 0, 1, 1,
0.8705805, -1.321168, 2.703994, 1, 0, 0, 1, 1,
0.8829376, -0.2120035, 1.499725, 1, 0, 0, 1, 1,
0.8956041, -0.3738489, 2.800778, 1, 0, 0, 1, 1,
0.8961934, 0.09986696, 3.086391, 1, 0, 0, 1, 1,
0.8968742, 0.8743274, -0.1836559, 0, 0, 0, 1, 1,
0.9004096, 1.263332, 1.305623, 0, 0, 0, 1, 1,
0.9024919, -0.8474075, 1.456887, 0, 0, 0, 1, 1,
0.9026989, 0.4679595, 0.3467254, 0, 0, 0, 1, 1,
0.9093189, -0.2621075, 0.4164597, 0, 0, 0, 1, 1,
0.9094657, -0.2600624, 3.883697, 0, 0, 0, 1, 1,
0.9135597, 0.1884344, 2.392216, 0, 0, 0, 1, 1,
0.9136258, -0.02584989, 0.6403515, 1, 1, 1, 1, 1,
0.9166088, -0.09566087, 2.842293, 1, 1, 1, 1, 1,
0.9208016, 0.9052377, 0.6374975, 1, 1, 1, 1, 1,
0.9271987, 0.08203168, 1.547915, 1, 1, 1, 1, 1,
0.9295897, -1.174589, 3.899385, 1, 1, 1, 1, 1,
0.9326845, 0.3478661, 0.4549822, 1, 1, 1, 1, 1,
0.9456884, 0.3680233, 1.604578, 1, 1, 1, 1, 1,
0.9516622, 0.1017791, 0.8459001, 1, 1, 1, 1, 1,
0.9561125, -0.3831002, 3.853592, 1, 1, 1, 1, 1,
0.9582838, -1.414481, 3.609216, 1, 1, 1, 1, 1,
0.9625481, -0.2032015, 2.735101, 1, 1, 1, 1, 1,
0.967016, -0.4426621, 2.350016, 1, 1, 1, 1, 1,
0.9681849, -0.1370903, 0.7965477, 1, 1, 1, 1, 1,
0.9713497, 1.771339, 1.061911, 1, 1, 1, 1, 1,
0.9720325, 0.09173445, 2.651469, 1, 1, 1, 1, 1,
0.9729905, 0.1890704, -0.07911638, 0, 0, 1, 1, 1,
0.9730151, -0.3045146, 0.3011523, 1, 0, 0, 1, 1,
0.9747231, -1.82443, 2.806427, 1, 0, 0, 1, 1,
0.9789768, -0.107123, 0.7347612, 1, 0, 0, 1, 1,
0.9860457, -0.6232674, 0.841168, 1, 0, 0, 1, 1,
0.9928338, -0.3615478, 2.989722, 1, 0, 0, 1, 1,
0.9940404, -0.1036146, 1.553345, 0, 0, 0, 1, 1,
0.9960557, -0.161169, -0.9595374, 0, 0, 0, 1, 1,
1.005198, 1.258573, 0.01748375, 0, 0, 0, 1, 1,
1.006416, -0.1804591, 0.03638822, 0, 0, 0, 1, 1,
1.008283, 0.7180774, -0.694322, 0, 0, 0, 1, 1,
1.008378, 2.743407, -0.3567267, 0, 0, 0, 1, 1,
1.009056, 0.3590274, 1.252198, 0, 0, 0, 1, 1,
1.011277, -1.368088, 1.772609, 1, 1, 1, 1, 1,
1.01518, -0.8081964, 3.479385, 1, 1, 1, 1, 1,
1.024881, -0.1691153, 1.348058, 1, 1, 1, 1, 1,
1.033918, -0.2775455, 1.265676, 1, 1, 1, 1, 1,
1.041063, -0.267961, 2.691689, 1, 1, 1, 1, 1,
1.046343, -1.792729, 2.090213, 1, 1, 1, 1, 1,
1.05059, 0.01874259, 1.54511, 1, 1, 1, 1, 1,
1.052928, 0.658375, 2.548959, 1, 1, 1, 1, 1,
1.053443, 0.7630632, -1.321473, 1, 1, 1, 1, 1,
1.072422, 1.548209, -0.1884542, 1, 1, 1, 1, 1,
1.073239, 0.3234242, 1.803153, 1, 1, 1, 1, 1,
1.079012, -0.3317186, 0.4908503, 1, 1, 1, 1, 1,
1.079077, 0.9210355, 1.358933, 1, 1, 1, 1, 1,
1.09503, 1.951645, 0.607038, 1, 1, 1, 1, 1,
1.096582, 0.1981674, 1.26044, 1, 1, 1, 1, 1,
1.098859, -0.2425576, 1.889511, 0, 0, 1, 1, 1,
1.100206, 0.877793, 2.744316, 1, 0, 0, 1, 1,
1.102664, -1.044661, 3.721641, 1, 0, 0, 1, 1,
1.106207, 0.3503428, 1.860949, 1, 0, 0, 1, 1,
1.106969, 0.2098971, 1.812948, 1, 0, 0, 1, 1,
1.110673, 1.737661, 0.7067021, 1, 0, 0, 1, 1,
1.113165, 1.348204, 0.7593169, 0, 0, 0, 1, 1,
1.122241, -0.5550597, 0.9067069, 0, 0, 0, 1, 1,
1.12255, -0.2432414, 1.30505, 0, 0, 0, 1, 1,
1.131395, 0.0455282, 0.7118649, 0, 0, 0, 1, 1,
1.134876, -2.130938, 3.438421, 0, 0, 0, 1, 1,
1.137466, 0.4768091, 2.040549, 0, 0, 0, 1, 1,
1.150198, 1.178124, 1.833742, 0, 0, 0, 1, 1,
1.151368, 0.584206, 2.494343, 1, 1, 1, 1, 1,
1.155704, 0.3662618, 0.0001716521, 1, 1, 1, 1, 1,
1.158012, -0.4259541, 1.585397, 1, 1, 1, 1, 1,
1.158229, 0.8935758, 0.01946809, 1, 1, 1, 1, 1,
1.159046, -1.979075, 2.089113, 1, 1, 1, 1, 1,
1.159411, -0.2150185, 2.681136, 1, 1, 1, 1, 1,
1.167, -0.5985847, 2.18161, 1, 1, 1, 1, 1,
1.16827, -0.1177632, 0.9414019, 1, 1, 1, 1, 1,
1.173368, 0.1306745, 0.3685288, 1, 1, 1, 1, 1,
1.17872, 1.067782, 1.277666, 1, 1, 1, 1, 1,
1.186205, 2.264604, 1.41023, 1, 1, 1, 1, 1,
1.18759, 0.8561791, 1.51866, 1, 1, 1, 1, 1,
1.188265, -0.2316617, 0.4446435, 1, 1, 1, 1, 1,
1.190898, 1.940341, 0.1420874, 1, 1, 1, 1, 1,
1.197413, -0.919988, 2.001839, 1, 1, 1, 1, 1,
1.206019, 0.04258297, 2.790725, 0, 0, 1, 1, 1,
1.210884, -0.1603834, 0.6866816, 1, 0, 0, 1, 1,
1.218953, -0.8818271, 1.467593, 1, 0, 0, 1, 1,
1.221109, 0.5757191, 2.630566, 1, 0, 0, 1, 1,
1.225692, 0.640632, 1.389547, 1, 0, 0, 1, 1,
1.236519, 0.09557154, 1.634955, 1, 0, 0, 1, 1,
1.236533, 0.6163845, 1.945294, 0, 0, 0, 1, 1,
1.236987, -1.830491, 1.698431, 0, 0, 0, 1, 1,
1.245301, -0.7826944, 0.9308004, 0, 0, 0, 1, 1,
1.248484, -0.3020445, 0.4805985, 0, 0, 0, 1, 1,
1.256678, 0.08562049, 1.93913, 0, 0, 0, 1, 1,
1.264055, -1.59599, -0.1960862, 0, 0, 0, 1, 1,
1.268985, 1.498415, 1.991791, 0, 0, 0, 1, 1,
1.281775, 1.363853, 0.7964296, 1, 1, 1, 1, 1,
1.284545, 0.2677555, 1.361969, 1, 1, 1, 1, 1,
1.31068, 1.083135, 1.026197, 1, 1, 1, 1, 1,
1.315401, -1.782285, 2.09025, 1, 1, 1, 1, 1,
1.31701, -1.126069, 2.28074, 1, 1, 1, 1, 1,
1.323108, 0.8823481, 2.613734, 1, 1, 1, 1, 1,
1.323291, -1.458559, 3.672117, 1, 1, 1, 1, 1,
1.330022, 0.2630218, 1.682801, 1, 1, 1, 1, 1,
1.339538, -0.5578047, 2.794434, 1, 1, 1, 1, 1,
1.343686, 0.3986335, 0.4468936, 1, 1, 1, 1, 1,
1.354096, -0.1303762, 2.676076, 1, 1, 1, 1, 1,
1.357345, 0.8215329, 1.624877, 1, 1, 1, 1, 1,
1.359262, 0.1179038, 2.98294, 1, 1, 1, 1, 1,
1.365309, 0.86759, -0.09481592, 1, 1, 1, 1, 1,
1.367532, 1.259899, 0.1564872, 1, 1, 1, 1, 1,
1.370807, 1.312253, 1.140775, 0, 0, 1, 1, 1,
1.376481, -0.2202817, 1.830388, 1, 0, 0, 1, 1,
1.388463, -1.434596, 3.681855, 1, 0, 0, 1, 1,
1.389282, -0.1016559, 0.5401702, 1, 0, 0, 1, 1,
1.396005, -1.668105, 2.789775, 1, 0, 0, 1, 1,
1.410704, 0.4982241, 0.3527976, 1, 0, 0, 1, 1,
1.431419, 0.8331038, 2.027503, 0, 0, 0, 1, 1,
1.436927, 2.737485, -0.2881109, 0, 0, 0, 1, 1,
1.44585, 0.234551, 1.427809, 0, 0, 0, 1, 1,
1.455655, 0.9890032, -0.2423798, 0, 0, 0, 1, 1,
1.459281, -2.53321, 3.30476, 0, 0, 0, 1, 1,
1.459394, -1.631707, 1.663854, 0, 0, 0, 1, 1,
1.460361, 0.5293614, 1.766449, 0, 0, 0, 1, 1,
1.461611, -0.6184419, 2.870495, 1, 1, 1, 1, 1,
1.463163, -1.108124, 3.417699, 1, 1, 1, 1, 1,
1.473189, -1.82128, 3.187209, 1, 1, 1, 1, 1,
1.480532, 1.070927, 0.1824524, 1, 1, 1, 1, 1,
1.494713, -0.6125817, 1.482828, 1, 1, 1, 1, 1,
1.527058, -0.04978053, 0.8842282, 1, 1, 1, 1, 1,
1.528801, 2.542604, 0.6126724, 1, 1, 1, 1, 1,
1.540401, -1.167829, 1.140936, 1, 1, 1, 1, 1,
1.540979, 0.9624868, 1.360869, 1, 1, 1, 1, 1,
1.543075, 0.3701194, 1.724575, 1, 1, 1, 1, 1,
1.548948, -1.002794, 3.13901, 1, 1, 1, 1, 1,
1.555992, 0.31546, 3.346023, 1, 1, 1, 1, 1,
1.565193, -1.315336, 3.151066, 1, 1, 1, 1, 1,
1.568264, 0.7825212, 1.310694, 1, 1, 1, 1, 1,
1.5697, -0.2153829, 0.453146, 1, 1, 1, 1, 1,
1.575658, 0.1184637, 2.108595, 0, 0, 1, 1, 1,
1.579363, 1.462892, 1.687012, 1, 0, 0, 1, 1,
1.584849, -1.569123, 3.014518, 1, 0, 0, 1, 1,
1.595181, 0.2327529, 1.050736, 1, 0, 0, 1, 1,
1.600798, 0.4416944, 1.149849, 1, 0, 0, 1, 1,
1.607012, -0.8586293, 2.448971, 1, 0, 0, 1, 1,
1.625504, 0.1587228, 2.218623, 0, 0, 0, 1, 1,
1.64829, 1.284815, 1.444287, 0, 0, 0, 1, 1,
1.667727, 1.45698, -0.4724956, 0, 0, 0, 1, 1,
1.669126, 0.2462629, 0.3192202, 0, 0, 0, 1, 1,
1.669216, 0.06942885, 1.068387, 0, 0, 0, 1, 1,
1.672631, -0.4829758, 3.360007, 0, 0, 0, 1, 1,
1.67732, 1.031833, 0.5882709, 0, 0, 0, 1, 1,
1.687542, -0.1754168, 0.819114, 1, 1, 1, 1, 1,
1.690577, 1.665755, 0.1760019, 1, 1, 1, 1, 1,
1.715279, -0.9397256, 3.458708, 1, 1, 1, 1, 1,
1.777231, -0.4490501, 2.127096, 1, 1, 1, 1, 1,
1.777922, 1.141655, -0.4957734, 1, 1, 1, 1, 1,
1.795834, -0.4038288, 2.048136, 1, 1, 1, 1, 1,
1.816166, -3.106218, 1.393162, 1, 1, 1, 1, 1,
1.829503, -0.01248473, 1.143373, 1, 1, 1, 1, 1,
1.830274, -0.7676864, 1.343895, 1, 1, 1, 1, 1,
1.842314, 0.754576, 1.725034, 1, 1, 1, 1, 1,
1.844136, -1.360872, 0.5995621, 1, 1, 1, 1, 1,
1.867018, 2.313216, 0.06439649, 1, 1, 1, 1, 1,
1.880232, -0.77754, 1.904615, 1, 1, 1, 1, 1,
1.905372, 0.1656811, 1.661803, 1, 1, 1, 1, 1,
1.94741, 0.6948578, 0.3077862, 1, 1, 1, 1, 1,
1.979045, -0.5562569, 1.445027, 0, 0, 1, 1, 1,
1.987289, 1.003861, 1.926632, 1, 0, 0, 1, 1,
1.988535, -0.5655131, 4.201268, 1, 0, 0, 1, 1,
2.079193, 2.562799, -0.08676218, 1, 0, 0, 1, 1,
2.09753, 0.708893, 1.458705, 1, 0, 0, 1, 1,
2.100824, -0.1173865, 2.073272, 1, 0, 0, 1, 1,
2.145963, 0.8868193, 2.007117, 0, 0, 0, 1, 1,
2.16805, 0.3314869, 0.6921535, 0, 0, 0, 1, 1,
2.173458, -0.7980008, 1.473782, 0, 0, 0, 1, 1,
2.207491, 3.008716, -0.3696408, 0, 0, 0, 1, 1,
2.290927, -0.125142, 1.846333, 0, 0, 0, 1, 1,
2.324994, 1.362529, -1.321246, 0, 0, 0, 1, 1,
2.349247, -0.1377664, 3.594973, 0, 0, 0, 1, 1,
2.434488, -0.7258285, 2.167429, 1, 1, 1, 1, 1,
2.488968, 0.9849769, 1.137999, 1, 1, 1, 1, 1,
2.595733, -0.5751243, 2.428042, 1, 1, 1, 1, 1,
2.651869, 0.6305851, 1.249832, 1, 1, 1, 1, 1,
2.85155, 0.507701, 1.678286, 1, 1, 1, 1, 1,
2.929544, 0.7055754, 2.229427, 1, 1, 1, 1, 1,
3.177133, -0.2908768, -0.07752141, 1, 1, 1, 1, 1
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
var radius = 9.505721;
var distance = 33.38844;
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
mvMatrix.translate( -0.1913656, 0.07278657, -0.2203326 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.38844);
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
