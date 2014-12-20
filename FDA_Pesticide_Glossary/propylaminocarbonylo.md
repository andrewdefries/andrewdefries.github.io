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
-3.594468, -0.3401298, -2.82969, 1, 0, 0, 1,
-3.055777, 1.547874, -0.9873369, 1, 0.007843138, 0, 1,
-2.85036, 0.4506206, -2.459213, 1, 0.01176471, 0, 1,
-2.845128, -0.2336654, -0.9727691, 1, 0.01960784, 0, 1,
-2.630718, 0.4332513, -1.534505, 1, 0.02352941, 0, 1,
-2.584118, 0.7877236, -1.579976, 1, 0.03137255, 0, 1,
-2.575847, -1.181345, -1.792993, 1, 0.03529412, 0, 1,
-2.523465, 2.010623, -2.67435, 1, 0.04313726, 0, 1,
-2.485415, 0.922398, -1.366511, 1, 0.04705882, 0, 1,
-2.386436, -1.180151, -0.781392, 1, 0.05490196, 0, 1,
-2.303553, -0.3280528, -1.57423, 1, 0.05882353, 0, 1,
-2.295606, -1.025633, -3.031295, 1, 0.06666667, 0, 1,
-2.2836, 1.780024, -0.8622116, 1, 0.07058824, 0, 1,
-2.250081, 0.03183458, 0.2448622, 1, 0.07843138, 0, 1,
-2.241325, -0.6984872, -2.997488, 1, 0.08235294, 0, 1,
-2.223468, 1.365221, -1.341528, 1, 0.09019608, 0, 1,
-2.185475, -0.03021398, -1.091867, 1, 0.09411765, 0, 1,
-2.153396, 1.161014, -1.517949, 1, 0.1019608, 0, 1,
-2.14366, -1.932579, -3.159046, 1, 0.1098039, 0, 1,
-2.138346, -1.493877, -2.002492, 1, 0.1137255, 0, 1,
-2.065317, -0.3161477, -1.476624, 1, 0.1215686, 0, 1,
-2.06526, -1.2799, -3.340255, 1, 0.1254902, 0, 1,
-2.040173, -1.53399, -0.7032036, 1, 0.1333333, 0, 1,
-2.038303, -0.6922215, -3.049716, 1, 0.1372549, 0, 1,
-2.009288, 0.6218645, -1.533447, 1, 0.145098, 0, 1,
-2.008968, 0.119883, -1.345984, 1, 0.1490196, 0, 1,
-1.975325, -0.4359478, -0.3492466, 1, 0.1568628, 0, 1,
-1.975233, -0.08770395, 0.6250903, 1, 0.1607843, 0, 1,
-1.965428, -1.961135, -2.067041, 1, 0.1686275, 0, 1,
-1.956305, 1.446403, -1.709165, 1, 0.172549, 0, 1,
-1.919215, 2.744444, -1.241767, 1, 0.1803922, 0, 1,
-1.896739, -0.806259, -1.775534, 1, 0.1843137, 0, 1,
-1.870127, -0.2567136, -1.629704, 1, 0.1921569, 0, 1,
-1.830058, 0.7710387, -1.971825, 1, 0.1960784, 0, 1,
-1.815871, 1.30824, -2.403707, 1, 0.2039216, 0, 1,
-1.810733, -0.3131692, -2.266177, 1, 0.2117647, 0, 1,
-1.789076, 0.1579798, -0.6136418, 1, 0.2156863, 0, 1,
-1.78543, -0.2198928, -2.398457, 1, 0.2235294, 0, 1,
-1.773298, 0.2769562, -0.3960862, 1, 0.227451, 0, 1,
-1.763958, 0.8922938, -2.068079, 1, 0.2352941, 0, 1,
-1.759481, -1.82325, -2.091139, 1, 0.2392157, 0, 1,
-1.753229, 0.1295317, -2.510956, 1, 0.2470588, 0, 1,
-1.703796, 0.5297408, -1.295532, 1, 0.2509804, 0, 1,
-1.692253, -1.826387, -2.476986, 1, 0.2588235, 0, 1,
-1.674018, 0.3020456, -1.414679, 1, 0.2627451, 0, 1,
-1.653361, 0.520186, -0.8928418, 1, 0.2705882, 0, 1,
-1.652596, -1.755986, -2.199905, 1, 0.2745098, 0, 1,
-1.646477, -0.7701862, -0.726086, 1, 0.282353, 0, 1,
-1.625763, 0.2695388, -1.057356, 1, 0.2862745, 0, 1,
-1.5535, -0.5268152, -1.003704, 1, 0.2941177, 0, 1,
-1.524307, -1.55377, -1.327132, 1, 0.3019608, 0, 1,
-1.522691, -1.057235, -4.395736, 1, 0.3058824, 0, 1,
-1.514105, 0.1848178, -2.39384, 1, 0.3137255, 0, 1,
-1.506553, 0.608917, -1.940603, 1, 0.3176471, 0, 1,
-1.498945, -0.111486, -1.242906, 1, 0.3254902, 0, 1,
-1.494507, -1.524335, -1.011898, 1, 0.3294118, 0, 1,
-1.490155, -1.384689, -1.356458, 1, 0.3372549, 0, 1,
-1.489667, -1.83494, -3.026295, 1, 0.3411765, 0, 1,
-1.487636, -0.947167, -0.5918687, 1, 0.3490196, 0, 1,
-1.4725, 0.641331, -1.580009, 1, 0.3529412, 0, 1,
-1.458972, -0.2937964, -0.9123588, 1, 0.3607843, 0, 1,
-1.450089, 0.05526783, -2.277921, 1, 0.3647059, 0, 1,
-1.445826, 0.2218211, -1.231887, 1, 0.372549, 0, 1,
-1.437711, 0.754398, -1.004224, 1, 0.3764706, 0, 1,
-1.429211, -0.4978961, -0.9317085, 1, 0.3843137, 0, 1,
-1.421285, -0.05295416, -2.885013, 1, 0.3882353, 0, 1,
-1.416473, 0.1219528, -1.25983, 1, 0.3960784, 0, 1,
-1.409854, -0.6677862, -2.642213, 1, 0.4039216, 0, 1,
-1.408365, -0.2734128, -2.781465, 1, 0.4078431, 0, 1,
-1.408063, 0.4274098, -0.08811313, 1, 0.4156863, 0, 1,
-1.406946, -0.4047447, -2.783749, 1, 0.4196078, 0, 1,
-1.399536, 0.3984223, -0.6245762, 1, 0.427451, 0, 1,
-1.38865, -0.2686339, -1.820149, 1, 0.4313726, 0, 1,
-1.375347, 0.3847685, -1.873905, 1, 0.4392157, 0, 1,
-1.360745, 0.4937502, -2.462126, 1, 0.4431373, 0, 1,
-1.360684, -0.0089336, -2.824109, 1, 0.4509804, 0, 1,
-1.350223, -0.5278884, -3.403953, 1, 0.454902, 0, 1,
-1.336307, 1.857458, -1.33695, 1, 0.4627451, 0, 1,
-1.328114, 0.3300843, -1.587756, 1, 0.4666667, 0, 1,
-1.325429, -0.7937872, -3.525529, 1, 0.4745098, 0, 1,
-1.319294, -0.9852065, -2.198987, 1, 0.4784314, 0, 1,
-1.318734, -2.219728, -3.814906, 1, 0.4862745, 0, 1,
-1.310838, -0.8259345, -1.599703, 1, 0.4901961, 0, 1,
-1.310589, -0.05453753, 0.5679005, 1, 0.4980392, 0, 1,
-1.304607, -0.8542172, -0.073457, 1, 0.5058824, 0, 1,
-1.303402, 0.5643012, -1.287011, 1, 0.509804, 0, 1,
-1.302233, 1.618504, -0.8884314, 1, 0.5176471, 0, 1,
-1.29589, -0.6280037, -3.415948, 1, 0.5215687, 0, 1,
-1.294213, 1.269365, -0.2933241, 1, 0.5294118, 0, 1,
-1.280648, 0.8674927, -3.173143, 1, 0.5333334, 0, 1,
-1.278672, 0.5190002, -2.404141, 1, 0.5411765, 0, 1,
-1.273076, -0.2009091, 0.7388678, 1, 0.5450981, 0, 1,
-1.258397, -2.741208, -3.765909, 1, 0.5529412, 0, 1,
-1.246958, -0.09885745, -0.4423702, 1, 0.5568628, 0, 1,
-1.243042, 1.143516, -1.366726, 1, 0.5647059, 0, 1,
-1.239218, -0.4291372, -1.70762, 1, 0.5686275, 0, 1,
-1.236762, 0.6659617, -1.42489, 1, 0.5764706, 0, 1,
-1.236067, -1.783293, -1.879916, 1, 0.5803922, 0, 1,
-1.23336, -0.470606, -1.008058, 1, 0.5882353, 0, 1,
-1.225395, -0.8670723, -1.302534, 1, 0.5921569, 0, 1,
-1.215635, 0.02313131, -2.143889, 1, 0.6, 0, 1,
-1.20613, 1.642542, -1.154636, 1, 0.6078432, 0, 1,
-1.205374, 0.3670142, 0.2006576, 1, 0.6117647, 0, 1,
-1.1996, -0.9279391, -1.956776, 1, 0.6196079, 0, 1,
-1.190473, 1.446732, 0.06509905, 1, 0.6235294, 0, 1,
-1.177762, 1.549524, -0.2676722, 1, 0.6313726, 0, 1,
-1.177629, 0.7636966, -2.479025, 1, 0.6352941, 0, 1,
-1.168798, -1.161124, -0.6536075, 1, 0.6431373, 0, 1,
-1.16739, -0.574544, -0.8810247, 1, 0.6470588, 0, 1,
-1.167074, 0.1045872, -0.02281289, 1, 0.654902, 0, 1,
-1.162828, -0.3598651, -0.8968989, 1, 0.6588235, 0, 1,
-1.144348, 0.3360806, -1.836117, 1, 0.6666667, 0, 1,
-1.140019, -2.237735, -3.34076, 1, 0.6705883, 0, 1,
-1.123842, 1.243458, -0.8931236, 1, 0.6784314, 0, 1,
-1.121727, 0.07672316, -1.311539, 1, 0.682353, 0, 1,
-1.121217, 1.141855, -0.2858024, 1, 0.6901961, 0, 1,
-1.119133, 0.5380133, -1.173349, 1, 0.6941177, 0, 1,
-1.111288, -1.037891, -1.791531, 1, 0.7019608, 0, 1,
-1.106248, -0.759832, -1.085648, 1, 0.7098039, 0, 1,
-1.097578, 0.7086585, 0.1774627, 1, 0.7137255, 0, 1,
-1.097116, 0.5409464, -0.1252144, 1, 0.7215686, 0, 1,
-1.094117, -0.5644731, -1.89371, 1, 0.7254902, 0, 1,
-1.088603, -0.9230328, -2.326948, 1, 0.7333333, 0, 1,
-1.087567, -1.068197, -3.928621, 1, 0.7372549, 0, 1,
-1.086868, 1.214419, -1.999334, 1, 0.7450981, 0, 1,
-1.081912, 2.702148, -0.5149459, 1, 0.7490196, 0, 1,
-1.067994, 1.499617, -0.6582361, 1, 0.7568628, 0, 1,
-1.067238, 0.1803029, -2.298228, 1, 0.7607843, 0, 1,
-1.066284, 1.809629, 1.037777, 1, 0.7686275, 0, 1,
-1.060226, 0.346516, -3.070461, 1, 0.772549, 0, 1,
-1.058777, -1.607303, -3.663465, 1, 0.7803922, 0, 1,
-1.058643, 0.6370868, -1.626778, 1, 0.7843137, 0, 1,
-1.053513, -1.842718, -4.188743, 1, 0.7921569, 0, 1,
-1.048559, 2.691133, -2.067767, 1, 0.7960784, 0, 1,
-1.046827, 1.730332, -0.1572893, 1, 0.8039216, 0, 1,
-1.04537, 0.148863, -2.171591, 1, 0.8117647, 0, 1,
-1.04021, 0.1055085, -2.844649, 1, 0.8156863, 0, 1,
-1.037769, -0.2856102, -0.4300097, 1, 0.8235294, 0, 1,
-1.037307, -1.126534, -2.510503, 1, 0.827451, 0, 1,
-1.03596, 2.293959, -0.6575657, 1, 0.8352941, 0, 1,
-1.034602, 2.338133, -0.4742807, 1, 0.8392157, 0, 1,
-1.033491, 1.356967, -0.02730626, 1, 0.8470588, 0, 1,
-1.026178, 1.191635, 1.094915, 1, 0.8509804, 0, 1,
-1.003675, -0.7981383, -2.893391, 1, 0.8588235, 0, 1,
-0.998542, -0.5051718, -0.9068306, 1, 0.8627451, 0, 1,
-0.9980616, 0.3793422, -1.618827, 1, 0.8705882, 0, 1,
-0.9973722, 0.4912231, -2.238729, 1, 0.8745098, 0, 1,
-0.9912271, 0.1314251, -3.20306, 1, 0.8823529, 0, 1,
-0.9904653, -0.5529559, -1.907136, 1, 0.8862745, 0, 1,
-0.9887588, -2.756987, -1.753769, 1, 0.8941177, 0, 1,
-0.9818928, 0.2463984, -0.7891428, 1, 0.8980392, 0, 1,
-0.9767637, -0.8200477, -1.729131, 1, 0.9058824, 0, 1,
-0.9607062, 0.378393, -1.563786, 1, 0.9137255, 0, 1,
-0.9531539, -0.4032282, -1.963734, 1, 0.9176471, 0, 1,
-0.9473503, -1.186854, -2.726091, 1, 0.9254902, 0, 1,
-0.9456448, -1.719887, -3.320897, 1, 0.9294118, 0, 1,
-0.9413596, -0.3758988, -1.440015, 1, 0.9372549, 0, 1,
-0.9395831, 0.0879842, -1.878692, 1, 0.9411765, 0, 1,
-0.9371403, 1.657521, 0.2437874, 1, 0.9490196, 0, 1,
-0.9370726, -0.839048, -1.139122, 1, 0.9529412, 0, 1,
-0.9303642, 0.3868429, 1.147569, 1, 0.9607843, 0, 1,
-0.9203712, 0.7546455, -1.073031, 1, 0.9647059, 0, 1,
-0.909777, 2.037759, -0.2405327, 1, 0.972549, 0, 1,
-0.9062296, 1.425524, 0.5476193, 1, 0.9764706, 0, 1,
-0.9025542, -0.5930378, -2.524784, 1, 0.9843137, 0, 1,
-0.9013097, 0.05311158, -0.2632226, 1, 0.9882353, 0, 1,
-0.9010144, -0.6728497, -1.309394, 1, 0.9960784, 0, 1,
-0.8977007, -1.961724, -2.0023, 0.9960784, 1, 0, 1,
-0.8961126, -0.7850457, -2.435299, 0.9921569, 1, 0, 1,
-0.8960986, 0.4916246, -1.024065, 0.9843137, 1, 0, 1,
-0.8870533, 0.0071056, -0.05650505, 0.9803922, 1, 0, 1,
-0.8829585, 0.9463107, -0.5882562, 0.972549, 1, 0, 1,
-0.8810012, 1.192568, -0.9166026, 0.9686275, 1, 0, 1,
-0.8786673, -0.9089566, -1.69988, 0.9607843, 1, 0, 1,
-0.8785395, 0.1071637, -2.322509, 0.9568627, 1, 0, 1,
-0.8686274, -0.13497, -1.362871, 0.9490196, 1, 0, 1,
-0.8674315, -1.622343, -3.285269, 0.945098, 1, 0, 1,
-0.8656334, -0.3605939, -3.195585, 0.9372549, 1, 0, 1,
-0.8643653, -0.07738619, -2.676766, 0.9333333, 1, 0, 1,
-0.8601092, 0.641298, -0.2327346, 0.9254902, 1, 0, 1,
-0.8598377, 1.557316, -2.12794, 0.9215686, 1, 0, 1,
-0.8598212, 1.001236, 1.267766, 0.9137255, 1, 0, 1,
-0.8552716, 0.3366436, -0.6348312, 0.9098039, 1, 0, 1,
-0.8543975, 1.278335, -1.656104, 0.9019608, 1, 0, 1,
-0.8534324, -0.5733133, -3.662852, 0.8941177, 1, 0, 1,
-0.8515229, 1.522175, -2.625028, 0.8901961, 1, 0, 1,
-0.848502, 1.503077, -0.05936894, 0.8823529, 1, 0, 1,
-0.8468093, 0.9283355, -1.443887, 0.8784314, 1, 0, 1,
-0.843738, -1.357272, -3.121406, 0.8705882, 1, 0, 1,
-0.8414924, -0.4538856, -1.185053, 0.8666667, 1, 0, 1,
-0.835494, 1.477315, 1.257962, 0.8588235, 1, 0, 1,
-0.8347089, -0.9488254, -3.17331, 0.854902, 1, 0, 1,
-0.8322557, 0.6066673, -1.934402, 0.8470588, 1, 0, 1,
-0.8303244, -0.9173208, -2.901024, 0.8431373, 1, 0, 1,
-0.8216089, 1.0401, 1.651151, 0.8352941, 1, 0, 1,
-0.8188355, 0.6491195, -1.232621, 0.8313726, 1, 0, 1,
-0.8186924, -0.6771209, -4.27165, 0.8235294, 1, 0, 1,
-0.8036352, 0.02503837, -1.520169, 0.8196079, 1, 0, 1,
-0.8026149, 0.6516147, -1.019181, 0.8117647, 1, 0, 1,
-0.8024616, 0.7775676, -0.5885792, 0.8078431, 1, 0, 1,
-0.7938836, -0.1943786, -1.542359, 0.8, 1, 0, 1,
-0.7925881, -0.4443138, -1.646697, 0.7921569, 1, 0, 1,
-0.7841076, -1.697536, -1.925107, 0.7882353, 1, 0, 1,
-0.7809543, -0.429074, -2.374395, 0.7803922, 1, 0, 1,
-0.773579, -0.6375543, -4.098064, 0.7764706, 1, 0, 1,
-0.7697573, -0.4314559, 0.2615358, 0.7686275, 1, 0, 1,
-0.7650946, 0.3256943, -1.119696, 0.7647059, 1, 0, 1,
-0.7613084, -0.9902324, -2.624568, 0.7568628, 1, 0, 1,
-0.7576945, 1.223491, -2.340275, 0.7529412, 1, 0, 1,
-0.757582, 0.408455, -1.502652, 0.7450981, 1, 0, 1,
-0.7556441, -0.2445436, -2.92298, 0.7411765, 1, 0, 1,
-0.7478436, 0.7663046, -0.4597216, 0.7333333, 1, 0, 1,
-0.7449085, -0.6611522, -3.267115, 0.7294118, 1, 0, 1,
-0.7443518, -0.9411271, -1.232153, 0.7215686, 1, 0, 1,
-0.7422191, 0.3665063, -1.872287, 0.7176471, 1, 0, 1,
-0.7320113, 0.4361383, -0.2695473, 0.7098039, 1, 0, 1,
-0.725017, 0.1346491, -2.80254, 0.7058824, 1, 0, 1,
-0.7244998, -0.1023837, -1.40851, 0.6980392, 1, 0, 1,
-0.7234516, 0.4932554, -1.088282, 0.6901961, 1, 0, 1,
-0.7227416, 0.9343982, -0.677046, 0.6862745, 1, 0, 1,
-0.7208958, -1.112292, -1.698256, 0.6784314, 1, 0, 1,
-0.7166312, -0.3909531, -0.9697503, 0.6745098, 1, 0, 1,
-0.7126018, -1.01537, -2.93117, 0.6666667, 1, 0, 1,
-0.7122873, 0.3960963, -2.974618, 0.6627451, 1, 0, 1,
-0.7110926, 0.2086984, -0.9746224, 0.654902, 1, 0, 1,
-0.710859, 0.9638346, -0.7546954, 0.6509804, 1, 0, 1,
-0.7031779, 0.4055495, -0.9642556, 0.6431373, 1, 0, 1,
-0.699295, 1.615218, -1.458708, 0.6392157, 1, 0, 1,
-0.6976702, -0.1940203, -2.255697, 0.6313726, 1, 0, 1,
-0.6935273, 0.8795154, 0.05428638, 0.627451, 1, 0, 1,
-0.6908816, 0.4336977, 1.401466, 0.6196079, 1, 0, 1,
-0.6850318, 1.509777, -1.408662, 0.6156863, 1, 0, 1,
-0.6769456, 0.4314318, -0.4729063, 0.6078432, 1, 0, 1,
-0.6759771, 1.146465, -1.088392, 0.6039216, 1, 0, 1,
-0.672308, 1.05128, -0.5399704, 0.5960785, 1, 0, 1,
-0.6701197, 0.09467181, -1.987236, 0.5882353, 1, 0, 1,
-0.6673543, 0.6863403, -0.2295438, 0.5843138, 1, 0, 1,
-0.6631962, -0.1916193, -0.0282037, 0.5764706, 1, 0, 1,
-0.663073, 0.3653638, -1.377158, 0.572549, 1, 0, 1,
-0.6601475, -0.1463683, -0.05173716, 0.5647059, 1, 0, 1,
-0.65405, -1.05228, -2.021932, 0.5607843, 1, 0, 1,
-0.651767, -2.426713, -1.743651, 0.5529412, 1, 0, 1,
-0.6501307, -0.01576492, -0.7935137, 0.5490196, 1, 0, 1,
-0.6495058, 0.5810471, -0.07111184, 0.5411765, 1, 0, 1,
-0.6476093, 0.1951761, -2.736115, 0.5372549, 1, 0, 1,
-0.6455851, -1.739521, -2.576505, 0.5294118, 1, 0, 1,
-0.6451136, 1.240695, 0.6730976, 0.5254902, 1, 0, 1,
-0.6432739, -1.15791, -1.983646, 0.5176471, 1, 0, 1,
-0.642472, 1.540082, -1.788228, 0.5137255, 1, 0, 1,
-0.6393449, 0.7110636, 0.2133972, 0.5058824, 1, 0, 1,
-0.6387095, 1.486682, -0.081448, 0.5019608, 1, 0, 1,
-0.6374599, 1.348884, 0.121562, 0.4941176, 1, 0, 1,
-0.6353468, 0.2693338, -0.7185464, 0.4862745, 1, 0, 1,
-0.634301, -0.2680149, -0.97434, 0.4823529, 1, 0, 1,
-0.6274051, 0.06386893, -3.069076, 0.4745098, 1, 0, 1,
-0.6257686, -0.1314703, -2.920616, 0.4705882, 1, 0, 1,
-0.6257267, -1.294864, -1.576664, 0.4627451, 1, 0, 1,
-0.623885, -0.05429912, -2.091242, 0.4588235, 1, 0, 1,
-0.6238797, 1.231238, 1.19197, 0.4509804, 1, 0, 1,
-0.6227771, -0.1883187, -0.9436083, 0.4470588, 1, 0, 1,
-0.6221214, 1.285553, -0.1124089, 0.4392157, 1, 0, 1,
-0.6212364, 0.4562826, 1.458285, 0.4352941, 1, 0, 1,
-0.6105414, 0.6366622, -2.51011, 0.427451, 1, 0, 1,
-0.6060849, 2.369152, -1.364099, 0.4235294, 1, 0, 1,
-0.5982937, 1.169204, 0.3078705, 0.4156863, 1, 0, 1,
-0.5969994, 1.038732, -1.346106, 0.4117647, 1, 0, 1,
-0.5943058, 0.2388048, -0.8730081, 0.4039216, 1, 0, 1,
-0.5941007, -2.265998, -1.98684, 0.3960784, 1, 0, 1,
-0.5869143, -1.200918, -2.021043, 0.3921569, 1, 0, 1,
-0.5837878, 0.2923544, -0.4097292, 0.3843137, 1, 0, 1,
-0.5832474, -0.6601851, -3.376099, 0.3803922, 1, 0, 1,
-0.5828087, 0.8579568, -1.085719, 0.372549, 1, 0, 1,
-0.5741773, -0.4243237, -2.481905, 0.3686275, 1, 0, 1,
-0.5736696, -0.8902531, -2.049634, 0.3607843, 1, 0, 1,
-0.5718217, 1.23213, -0.09779918, 0.3568628, 1, 0, 1,
-0.5706914, 1.379424, -1.89742, 0.3490196, 1, 0, 1,
-0.5690154, -1.149469, -3.358095, 0.345098, 1, 0, 1,
-0.5689882, 1.93128, -1.4752, 0.3372549, 1, 0, 1,
-0.5656192, -0.8675034, -3.961762, 0.3333333, 1, 0, 1,
-0.5656149, -1.346022, -2.643683, 0.3254902, 1, 0, 1,
-0.5590369, -1.056263, -2.872847, 0.3215686, 1, 0, 1,
-0.5511109, 1.391585, 0.2141901, 0.3137255, 1, 0, 1,
-0.5475073, 0.1799936, -0.6805711, 0.3098039, 1, 0, 1,
-0.546046, 0.4501332, -1.010719, 0.3019608, 1, 0, 1,
-0.5443746, 1.462457, -0.1081129, 0.2941177, 1, 0, 1,
-0.5417622, -1.092175, -1.05978, 0.2901961, 1, 0, 1,
-0.5413786, 0.4149042, -1.013335, 0.282353, 1, 0, 1,
-0.5383546, 2.27811, -1.549015, 0.2784314, 1, 0, 1,
-0.5358534, -0.6357887, -3.394921, 0.2705882, 1, 0, 1,
-0.5354432, -0.8303868, -3.265994, 0.2666667, 1, 0, 1,
-0.5351116, 0.4114963, -0.1223134, 0.2588235, 1, 0, 1,
-0.5329327, -1.316528, -3.006907, 0.254902, 1, 0, 1,
-0.5300652, 1.059327, -2.329791, 0.2470588, 1, 0, 1,
-0.5288885, 1.100735, -0.1139341, 0.2431373, 1, 0, 1,
-0.5266167, -0.738645, -2.900709, 0.2352941, 1, 0, 1,
-0.5229183, 0.2054044, -0.415804, 0.2313726, 1, 0, 1,
-0.5167406, -0.8609602, -3.068527, 0.2235294, 1, 0, 1,
-0.5166778, -0.1197271, -3.07034, 0.2196078, 1, 0, 1,
-0.5160664, -1.697593, -2.782424, 0.2117647, 1, 0, 1,
-0.5147121, -1.163358, -1.946385, 0.2078431, 1, 0, 1,
-0.5143963, -0.6710104, -1.436588, 0.2, 1, 0, 1,
-0.5134411, 0.01846197, 0.7453696, 0.1921569, 1, 0, 1,
-0.5119517, 0.8920707, -0.8746238, 0.1882353, 1, 0, 1,
-0.5070464, -1.381099, -1.552224, 0.1803922, 1, 0, 1,
-0.5034189, -0.5385342, -4.402443, 0.1764706, 1, 0, 1,
-0.5007483, -0.1273753, -0.5012323, 0.1686275, 1, 0, 1,
-0.4991195, -0.3688927, -2.82496, 0.1647059, 1, 0, 1,
-0.4975889, 1.155427, -0.6818998, 0.1568628, 1, 0, 1,
-0.4961066, -1.204866, -1.674063, 0.1529412, 1, 0, 1,
-0.494734, -0.5752672, -2.862154, 0.145098, 1, 0, 1,
-0.4938892, 0.3399018, -1.41094, 0.1411765, 1, 0, 1,
-0.4909593, 0.1934899, -0.4056558, 0.1333333, 1, 0, 1,
-0.4887164, -1.191716, -3.886837, 0.1294118, 1, 0, 1,
-0.4885599, 3.067641, -2.725601, 0.1215686, 1, 0, 1,
-0.482823, 0.113603, -1.642024, 0.1176471, 1, 0, 1,
-0.4823807, -0.09570602, -0.4118787, 0.1098039, 1, 0, 1,
-0.481279, 0.5030408, 0.9043735, 0.1058824, 1, 0, 1,
-0.4810616, -0.8121908, -1.826639, 0.09803922, 1, 0, 1,
-0.4792614, 0.173949, 0.7506453, 0.09019608, 1, 0, 1,
-0.479095, 1.278397, 0.2215259, 0.08627451, 1, 0, 1,
-0.4788672, 2.13066, -1.432384, 0.07843138, 1, 0, 1,
-0.4765133, -0.1859054, -0.8836617, 0.07450981, 1, 0, 1,
-0.4753258, 0.6896252, -0.8140393, 0.06666667, 1, 0, 1,
-0.4750913, -0.08850021, -2.142984, 0.0627451, 1, 0, 1,
-0.4728782, 0.7827104, -0.06573262, 0.05490196, 1, 0, 1,
-0.4657151, -0.6795245, -1.762003, 0.05098039, 1, 0, 1,
-0.4637782, -1.818371, -3.701355, 0.04313726, 1, 0, 1,
-0.4634747, -1.06734, -1.988682, 0.03921569, 1, 0, 1,
-0.4628456, -0.4602331, -3.333761, 0.03137255, 1, 0, 1,
-0.4546488, -0.4198148, -3.291434, 0.02745098, 1, 0, 1,
-0.4544785, -0.5908504, -3.28471, 0.01960784, 1, 0, 1,
-0.443208, -1.359168, -1.085865, 0.01568628, 1, 0, 1,
-0.440689, 1.004211, -0.9654266, 0.007843138, 1, 0, 1,
-0.4393145, -1.29953, -2.641596, 0.003921569, 1, 0, 1,
-0.4261787, 0.3973395, -1.812855, 0, 1, 0.003921569, 1,
-0.4236343, -0.4438834, -1.788962, 0, 1, 0.01176471, 1,
-0.4193053, -0.9456891, -3.339038, 0, 1, 0.01568628, 1,
-0.4176419, 0.8536664, 0.0915105, 0, 1, 0.02352941, 1,
-0.4145813, 0.1277559, -1.987855, 0, 1, 0.02745098, 1,
-0.4131206, -1.298476, -3.246256, 0, 1, 0.03529412, 1,
-0.4105741, 0.5868256, 0.1527044, 0, 1, 0.03921569, 1,
-0.4095525, -0.4134873, -2.312136, 0, 1, 0.04705882, 1,
-0.4093838, -0.2033697, -2.86277, 0, 1, 0.05098039, 1,
-0.4083401, -2.091637, -3.853839, 0, 1, 0.05882353, 1,
-0.4025106, -0.001676629, -1.125928, 0, 1, 0.0627451, 1,
-0.400824, 0.2931127, -2.374552, 0, 1, 0.07058824, 1,
-0.3965326, 0.2637919, 0.4628007, 0, 1, 0.07450981, 1,
-0.3957892, 0.2877906, -0.6283237, 0, 1, 0.08235294, 1,
-0.3870712, 1.537076, 0.2719888, 0, 1, 0.08627451, 1,
-0.3836465, 0.1003276, -0.6672845, 0, 1, 0.09411765, 1,
-0.3822995, -1.78307, -1.770374, 0, 1, 0.1019608, 1,
-0.3809246, 0.8488164, -1.201519, 0, 1, 0.1058824, 1,
-0.3734123, -1.202417, -1.300503, 0, 1, 0.1137255, 1,
-0.3693533, -0.6035496, -2.173838, 0, 1, 0.1176471, 1,
-0.3665092, -0.370404, -3.085175, 0, 1, 0.1254902, 1,
-0.3616135, -0.9467565, -3.848078, 0, 1, 0.1294118, 1,
-0.3598897, -1.707085, -2.064775, 0, 1, 0.1372549, 1,
-0.3586823, 1.827582, -2.150397, 0, 1, 0.1411765, 1,
-0.3555227, -0.9366213, -1.883991, 0, 1, 0.1490196, 1,
-0.3451664, -1.949154, -3.571225, 0, 1, 0.1529412, 1,
-0.3429862, -1.272688, -2.026247, 0, 1, 0.1607843, 1,
-0.3415901, 0.3255429, -2.539695, 0, 1, 0.1647059, 1,
-0.3392043, 0.4143252, 1.129375, 0, 1, 0.172549, 1,
-0.3391876, 0.6444279, 0.5048756, 0, 1, 0.1764706, 1,
-0.3377047, 0.4589019, 1.060922, 0, 1, 0.1843137, 1,
-0.3340679, -0.5975595, -2.617332, 0, 1, 0.1882353, 1,
-0.3337662, 0.3982781, -0.2125723, 0, 1, 0.1960784, 1,
-0.3314702, 1.150105, -0.929343, 0, 1, 0.2039216, 1,
-0.3272888, -0.5974893, -0.9807289, 0, 1, 0.2078431, 1,
-0.3266451, -0.6705518, -1.733827, 0, 1, 0.2156863, 1,
-0.3245399, -1.918208, -3.840426, 0, 1, 0.2196078, 1,
-0.3199534, 0.5692838, 0.03971794, 0, 1, 0.227451, 1,
-0.3185464, -0.2987947, -4.164757, 0, 1, 0.2313726, 1,
-0.3148237, -0.05146156, -1.374029, 0, 1, 0.2392157, 1,
-0.314527, -0.3684988, -2.341034, 0, 1, 0.2431373, 1,
-0.3080554, 0.1554767, -1.16196, 0, 1, 0.2509804, 1,
-0.3067654, -0.430981, -1.085976, 0, 1, 0.254902, 1,
-0.3008624, 0.3055258, -0.2162655, 0, 1, 0.2627451, 1,
-0.2926004, 0.191151, -1.540452, 0, 1, 0.2666667, 1,
-0.2923566, -0.9185317, -3.348659, 0, 1, 0.2745098, 1,
-0.2898697, 0.3919115, -0.4870218, 0, 1, 0.2784314, 1,
-0.2897442, -0.7350582, -0.9925479, 0, 1, 0.2862745, 1,
-0.2892547, 0.1598971, -1.578414, 0, 1, 0.2901961, 1,
-0.2889983, 1.659186, 0.7238218, 0, 1, 0.2980392, 1,
-0.2889893, 0.6328914, -1.09573, 0, 1, 0.3058824, 1,
-0.2776915, 0.4365658, -0.3513885, 0, 1, 0.3098039, 1,
-0.2772506, -1.529015, -0.8549742, 0, 1, 0.3176471, 1,
-0.2771542, 0.317887, -0.1936517, 0, 1, 0.3215686, 1,
-0.2769344, 1.236477, -0.7461125, 0, 1, 0.3294118, 1,
-0.2743162, 0.614432, 1.345356, 0, 1, 0.3333333, 1,
-0.2715125, -0.03578011, -0.8479343, 0, 1, 0.3411765, 1,
-0.2710728, 0.8084749, -1.677206, 0, 1, 0.345098, 1,
-0.2682568, -1.906432, -4.695325, 0, 1, 0.3529412, 1,
-0.2641872, 0.2251274, 0.3495992, 0, 1, 0.3568628, 1,
-0.2598288, -0.3498437, -3.318918, 0, 1, 0.3647059, 1,
-0.2559718, 0.6874319, -1.9223, 0, 1, 0.3686275, 1,
-0.254059, 2.378829, 0.4104011, 0, 1, 0.3764706, 1,
-0.2532526, -1.073844, -3.117754, 0, 1, 0.3803922, 1,
-0.2531492, -0.3959508, -1.973999, 0, 1, 0.3882353, 1,
-0.2526261, 0.6928973, -0.2337683, 0, 1, 0.3921569, 1,
-0.250196, 2.196285, 0.02416368, 0, 1, 0.4, 1,
-0.244886, 0.7459337, 0.8062513, 0, 1, 0.4078431, 1,
-0.2406779, 0.7393001, -0.6499577, 0, 1, 0.4117647, 1,
-0.2389835, -1.410004, -2.09197, 0, 1, 0.4196078, 1,
-0.2344085, -0.6556477, -1.504831, 0, 1, 0.4235294, 1,
-0.2337926, -0.5881457, -2.423946, 0, 1, 0.4313726, 1,
-0.230518, 1.350642, -0.7575613, 0, 1, 0.4352941, 1,
-0.2304841, -0.3029459, -1.862445, 0, 1, 0.4431373, 1,
-0.229654, 2.107951, 0.1138734, 0, 1, 0.4470588, 1,
-0.2282963, -0.5261482, -3.746098, 0, 1, 0.454902, 1,
-0.226495, -0.08217303, -1.117979, 0, 1, 0.4588235, 1,
-0.225243, 0.2792601, -0.6338531, 0, 1, 0.4666667, 1,
-0.2250168, 0.6077571, 0.3894367, 0, 1, 0.4705882, 1,
-0.2242637, -0.03129154, -3.1265, 0, 1, 0.4784314, 1,
-0.2139211, 0.1201176, 0.04961435, 0, 1, 0.4823529, 1,
-0.20495, -0.9862937, -1.121258, 0, 1, 0.4901961, 1,
-0.1982559, -0.1700781, -2.231635, 0, 1, 0.4941176, 1,
-0.1975516, -0.0969905, -3.12041, 0, 1, 0.5019608, 1,
-0.188335, 1.183903, -2.045438, 0, 1, 0.509804, 1,
-0.1859562, 1.503267, -0.6434708, 0, 1, 0.5137255, 1,
-0.184628, 0.2508651, -0.2201672, 0, 1, 0.5215687, 1,
-0.1805927, 1.171895, -1.404177, 0, 1, 0.5254902, 1,
-0.1777068, -0.7513953, -3.06857, 0, 1, 0.5333334, 1,
-0.1761434, -0.1879316, -2.94262, 0, 1, 0.5372549, 1,
-0.1690187, 0.9078749, -0.5061708, 0, 1, 0.5450981, 1,
-0.1676321, 0.8480534, 0.7283748, 0, 1, 0.5490196, 1,
-0.1659012, 0.02525978, -1.060034, 0, 1, 0.5568628, 1,
-0.1653129, -0.3831152, -2.802966, 0, 1, 0.5607843, 1,
-0.1600943, -1.710009, -3.058101, 0, 1, 0.5686275, 1,
-0.1590242, -1.208893, -1.63747, 0, 1, 0.572549, 1,
-0.1545962, -0.07724677, -2.632155, 0, 1, 0.5803922, 1,
-0.1529846, 0.5252464, -0.7500684, 0, 1, 0.5843138, 1,
-0.1467682, 0.803969, -0.09714311, 0, 1, 0.5921569, 1,
-0.1408262, -0.4005634, -3.834, 0, 1, 0.5960785, 1,
-0.1367027, -1.313495, -3.838592, 0, 1, 0.6039216, 1,
-0.1359296, -1.275289, -1.973757, 0, 1, 0.6117647, 1,
-0.1350155, 1.062725, -1.10544, 0, 1, 0.6156863, 1,
-0.1340343, -2.26899, -4.278667, 0, 1, 0.6235294, 1,
-0.1322344, -0.1272014, -3.279607, 0, 1, 0.627451, 1,
-0.1310695, -1.668429, -4.921865, 0, 1, 0.6352941, 1,
-0.1295967, -1.460048, -3.795205, 0, 1, 0.6392157, 1,
-0.1276755, -0.3905956, -3.188657, 0, 1, 0.6470588, 1,
-0.1244108, -0.8913347, -1.675415, 0, 1, 0.6509804, 1,
-0.1233197, -0.6850662, -2.870418, 0, 1, 0.6588235, 1,
-0.1200452, -1.573392, -2.670421, 0, 1, 0.6627451, 1,
-0.1189309, -1.172284, -1.202169, 0, 1, 0.6705883, 1,
-0.1170163, 0.96662, 0.3687328, 0, 1, 0.6745098, 1,
-0.1167322, -1.474174, -2.217402, 0, 1, 0.682353, 1,
-0.1159864, -1.307954, -2.958216, 0, 1, 0.6862745, 1,
-0.114429, -0.9073656, -3.242862, 0, 1, 0.6941177, 1,
-0.1104332, 1.429785, -0.7183108, 0, 1, 0.7019608, 1,
-0.109498, 0.04950738, -0.1463248, 0, 1, 0.7058824, 1,
-0.1063618, 1.475726, -0.4032612, 0, 1, 0.7137255, 1,
-0.1031989, -0.293937, -2.486405, 0, 1, 0.7176471, 1,
-0.1017406, -0.2593949, -4.401933, 0, 1, 0.7254902, 1,
-0.1008253, -0.04442288, -1.848328, 0, 1, 0.7294118, 1,
-0.09717547, -1.381417, -0.344775, 0, 1, 0.7372549, 1,
-0.096335, 0.7020765, 0.5831861, 0, 1, 0.7411765, 1,
-0.09581438, 1.178074, 1.071118, 0, 1, 0.7490196, 1,
-0.09448465, -0.4966031, -2.773072, 0, 1, 0.7529412, 1,
-0.09143348, -1.142798, -2.642457, 0, 1, 0.7607843, 1,
-0.08016998, 0.1236863, -1.162732, 0, 1, 0.7647059, 1,
-0.0758752, -2.035169, -2.814443, 0, 1, 0.772549, 1,
-0.07133546, -0.08120461, -2.499809, 0, 1, 0.7764706, 1,
-0.07089999, -0.7586205, -2.151144, 0, 1, 0.7843137, 1,
-0.0649705, -1.719817, -2.328825, 0, 1, 0.7882353, 1,
-0.064312, -1.867682, -3.681212, 0, 1, 0.7960784, 1,
-0.06352319, 0.3879521, 1.201808, 0, 1, 0.8039216, 1,
-0.06129549, 1.438189, -0.4525197, 0, 1, 0.8078431, 1,
-0.05967661, 1.010177, -0.3729527, 0, 1, 0.8156863, 1,
-0.05876646, 0.1214699, 0.5372493, 0, 1, 0.8196079, 1,
-0.05865647, -0.6488313, -4.864515, 0, 1, 0.827451, 1,
-0.05583565, 0.5118776, 0.3192651, 0, 1, 0.8313726, 1,
-0.05531782, -1.703257, -3.222911, 0, 1, 0.8392157, 1,
-0.05379032, -0.2920792, -2.924355, 0, 1, 0.8431373, 1,
-0.04828769, -1.138831, -3.66438, 0, 1, 0.8509804, 1,
-0.04826311, -0.5116412, -1.992501, 0, 1, 0.854902, 1,
-0.04432489, 2.029236, -0.2391096, 0, 1, 0.8627451, 1,
-0.04378444, -0.5199034, -3.098399, 0, 1, 0.8666667, 1,
-0.04084382, -0.7088157, -4.467532, 0, 1, 0.8745098, 1,
-0.04070466, 0.002866479, -1.11303, 0, 1, 0.8784314, 1,
-0.03558603, 0.9428685, -0.6435617, 0, 1, 0.8862745, 1,
-0.03437742, 0.8259392, -0.5497259, 0, 1, 0.8901961, 1,
-0.02625343, 1.123514, -1.310246, 0, 1, 0.8980392, 1,
-0.02440832, -0.4839942, -3.99083, 0, 1, 0.9058824, 1,
-0.01736059, 0.4421825, -1.292458, 0, 1, 0.9098039, 1,
-0.01654574, 0.5141106, -1.173969, 0, 1, 0.9176471, 1,
-0.01637713, -1.345242, -1.778011, 0, 1, 0.9215686, 1,
-0.0163332, -1.423476, -4.406773, 0, 1, 0.9294118, 1,
-0.0144234, -0.7454562, -4.659406, 0, 1, 0.9333333, 1,
-0.009744699, -0.1177577, -2.910257, 0, 1, 0.9411765, 1,
-0.007584174, 1.937298, 0.1746809, 0, 1, 0.945098, 1,
-0.005616617, 0.2034558, 2.466985, 0, 1, 0.9529412, 1,
-0.0006795427, -0.7523935, -4.40379, 0, 1, 0.9568627, 1,
0.002122615, -1.302315, 2.540465, 0, 1, 0.9647059, 1,
0.003922571, -0.4679833, 2.817888, 0, 1, 0.9686275, 1,
0.005335837, -0.7739257, 4.555299, 0, 1, 0.9764706, 1,
0.009041206, 0.4352127, -0.4669437, 0, 1, 0.9803922, 1,
0.01223559, -0.1037662, 3.556341, 0, 1, 0.9882353, 1,
0.01327859, 1.296926, -1.650016, 0, 1, 0.9921569, 1,
0.01431172, 0.5890835, -1.229884, 0, 1, 1, 1,
0.01670998, -2.763962, 4.106232, 0, 0.9921569, 1, 1,
0.01820443, -0.9820447, 4.463057, 0, 0.9882353, 1, 1,
0.01973663, 0.6317608, 2.029901, 0, 0.9803922, 1, 1,
0.02166571, -0.310436, 3.521338, 0, 0.9764706, 1, 1,
0.02309733, 0.785144, -2.583092, 0, 0.9686275, 1, 1,
0.02415292, 0.7781851, 0.5711535, 0, 0.9647059, 1, 1,
0.02572187, -0.08890644, 3.861041, 0, 0.9568627, 1, 1,
0.03061515, -0.3751358, 2.380063, 0, 0.9529412, 1, 1,
0.03129239, 0.644682, -0.669873, 0, 0.945098, 1, 1,
0.03358952, 1.202896, 1.090598, 0, 0.9411765, 1, 1,
0.03516965, 2.1521, -0.8464235, 0, 0.9333333, 1, 1,
0.03899219, 0.9288397, 0.7939695, 0, 0.9294118, 1, 1,
0.04331441, -0.4384792, 1.933467, 0, 0.9215686, 1, 1,
0.04481429, 0.4620437, 1.132731, 0, 0.9176471, 1, 1,
0.04594965, -0.3672521, 2.778082, 0, 0.9098039, 1, 1,
0.05112788, 0.4666293, -0.1398306, 0, 0.9058824, 1, 1,
0.05893001, 0.07709684, -2.609278, 0, 0.8980392, 1, 1,
0.06193998, 2.422888, -0.1900646, 0, 0.8901961, 1, 1,
0.0621368, 1.227832, 1.045396, 0, 0.8862745, 1, 1,
0.06284081, 1.054392, -1.131923, 0, 0.8784314, 1, 1,
0.063074, -0.7859033, 3.982165, 0, 0.8745098, 1, 1,
0.06577405, -1.02998, 4.473748, 0, 0.8666667, 1, 1,
0.06922047, -0.00411536, 1.196855, 0, 0.8627451, 1, 1,
0.07759535, -0.7562352, 1.810232, 0, 0.854902, 1, 1,
0.07825201, 0.2180561, -0.4626444, 0, 0.8509804, 1, 1,
0.078702, -0.985515, 2.768876, 0, 0.8431373, 1, 1,
0.0829981, 0.3862875, 0.524486, 0, 0.8392157, 1, 1,
0.08846656, 0.6486499, -0.6126056, 0, 0.8313726, 1, 1,
0.09113876, 0.8873791, -0.4652857, 0, 0.827451, 1, 1,
0.09292389, -1.480496, 2.548082, 0, 0.8196079, 1, 1,
0.09489942, -0.2876021, 3.186492, 0, 0.8156863, 1, 1,
0.09613251, -0.3873367, 1.334224, 0, 0.8078431, 1, 1,
0.0973561, 0.558716, -0.06445477, 0, 0.8039216, 1, 1,
0.09928798, -0.4774405, 1.381943, 0, 0.7960784, 1, 1,
0.1021192, 0.1841478, -0.01424159, 0, 0.7882353, 1, 1,
0.1091898, -0.6627987, 4.11219, 0, 0.7843137, 1, 1,
0.1100369, -0.683202, 1.576371, 0, 0.7764706, 1, 1,
0.115333, -0.4076063, 2.134601, 0, 0.772549, 1, 1,
0.1155707, 0.4560788, -0.3913288, 0, 0.7647059, 1, 1,
0.1197058, 0.1736655, 1.120903, 0, 0.7607843, 1, 1,
0.1199959, -0.09444059, 2.216481, 0, 0.7529412, 1, 1,
0.1204698, 0.9800431, -0.493499, 0, 0.7490196, 1, 1,
0.1233265, 0.2462257, -0.6654338, 0, 0.7411765, 1, 1,
0.1254423, -0.04566289, 0.2833463, 0, 0.7372549, 1, 1,
0.1321995, -0.7874966, 2.565918, 0, 0.7294118, 1, 1,
0.1328543, 1.071928, -0.8711307, 0, 0.7254902, 1, 1,
0.1447976, -1.434234, 3.3453, 0, 0.7176471, 1, 1,
0.1483085, -0.01010295, 1.743421, 0, 0.7137255, 1, 1,
0.148472, -0.3825211, 2.925771, 0, 0.7058824, 1, 1,
0.1488736, -0.9767166, 1.927859, 0, 0.6980392, 1, 1,
0.1509335, 0.5011786, 0.2540817, 0, 0.6941177, 1, 1,
0.1536677, -1.576352, 3.217608, 0, 0.6862745, 1, 1,
0.1592571, 0.5963268, -1.162217, 0, 0.682353, 1, 1,
0.1622782, -0.05179474, 1.04126, 0, 0.6745098, 1, 1,
0.1631294, -0.4699315, 1.964934, 0, 0.6705883, 1, 1,
0.1634536, -2.36683, 3.735693, 0, 0.6627451, 1, 1,
0.1635309, 1.125143, -0.2082728, 0, 0.6588235, 1, 1,
0.1641053, 0.5204555, 1.308233, 0, 0.6509804, 1, 1,
0.1669548, 0.2819182, 0.05078097, 0, 0.6470588, 1, 1,
0.1690366, 1.381356, 0.1945259, 0, 0.6392157, 1, 1,
0.1721399, -1.420656, 2.551606, 0, 0.6352941, 1, 1,
0.1772587, 0.1280918, -0.3432376, 0, 0.627451, 1, 1,
0.1989566, -1.884441, 4.009689, 0, 0.6235294, 1, 1,
0.2009122, 0.6462038, 0.7441463, 0, 0.6156863, 1, 1,
0.2020431, 0.1791712, 0.5596935, 0, 0.6117647, 1, 1,
0.2021446, -0.7839425, 2.671032, 0, 0.6039216, 1, 1,
0.2021704, 0.2392538, -0.1927111, 0, 0.5960785, 1, 1,
0.2035067, 1.409972, 0.7596787, 0, 0.5921569, 1, 1,
0.2036642, -0.4720662, 2.17877, 0, 0.5843138, 1, 1,
0.2062235, -0.08132242, 3.939383, 0, 0.5803922, 1, 1,
0.2075198, -1.923309, 3.966213, 0, 0.572549, 1, 1,
0.211048, -1.408886, 1.817545, 0, 0.5686275, 1, 1,
0.2137672, -0.0599244, 2.736415, 0, 0.5607843, 1, 1,
0.2151087, 0.9173015, 0.7969232, 0, 0.5568628, 1, 1,
0.2159109, -0.9003713, 3.012707, 0, 0.5490196, 1, 1,
0.2161938, -1.568679, 2.994573, 0, 0.5450981, 1, 1,
0.2172072, 1.863779, -0.04994369, 0, 0.5372549, 1, 1,
0.2180994, -0.5136884, 3.391053, 0, 0.5333334, 1, 1,
0.2215856, -0.6527705, 2.597865, 0, 0.5254902, 1, 1,
0.2257849, 1.045751, -0.2647122, 0, 0.5215687, 1, 1,
0.2274299, 0.6748942, 0.3890511, 0, 0.5137255, 1, 1,
0.2296873, 0.3133315, -0.3726696, 0, 0.509804, 1, 1,
0.2333953, 0.4659426, 0.436516, 0, 0.5019608, 1, 1,
0.2353883, -0.5812801, 2.778344, 0, 0.4941176, 1, 1,
0.2374061, 0.4775802, 1.328537, 0, 0.4901961, 1, 1,
0.2391492, -1.915797, 4.113003, 0, 0.4823529, 1, 1,
0.240791, 0.01269474, 1.985343, 0, 0.4784314, 1, 1,
0.2453243, 0.8476113, 0.3401493, 0, 0.4705882, 1, 1,
0.246056, -1.027581, 2.85515, 0, 0.4666667, 1, 1,
0.2479132, 0.4106745, -0.454206, 0, 0.4588235, 1, 1,
0.2559803, 0.4866133, 1.037834, 0, 0.454902, 1, 1,
0.2582544, -0.8605346, 2.318805, 0, 0.4470588, 1, 1,
0.2593778, 0.1333769, -0.1488733, 0, 0.4431373, 1, 1,
0.2620648, -0.436972, 0.7332581, 0, 0.4352941, 1, 1,
0.2626958, 1.901951, 0.6189905, 0, 0.4313726, 1, 1,
0.264015, -0.3925563, 1.828584, 0, 0.4235294, 1, 1,
0.2693356, -0.5752708, 2.535176, 0, 0.4196078, 1, 1,
0.269775, 0.8646355, 0.8241644, 0, 0.4117647, 1, 1,
0.2698913, 0.3819685, 0.4560211, 0, 0.4078431, 1, 1,
0.2709309, -0.4122299, 2.900454, 0, 0.4, 1, 1,
0.2754516, 0.6282122, 0.3628325, 0, 0.3921569, 1, 1,
0.2759127, -1.144297, 3.556063, 0, 0.3882353, 1, 1,
0.2764684, 0.5923541, 1.003253, 0, 0.3803922, 1, 1,
0.2821141, -1.476713, 2.158926, 0, 0.3764706, 1, 1,
0.2899222, -0.8348386, 3.907536, 0, 0.3686275, 1, 1,
0.2905764, -0.3733031, 1.921761, 0, 0.3647059, 1, 1,
0.2992636, -0.9729633, 3.419629, 0, 0.3568628, 1, 1,
0.3009304, 1.198081, 0.5094861, 0, 0.3529412, 1, 1,
0.3111023, 1.119762, 0.7502549, 0, 0.345098, 1, 1,
0.3146216, 1.009888, 0.2933391, 0, 0.3411765, 1, 1,
0.3174622, 0.783219, 1.678016, 0, 0.3333333, 1, 1,
0.3187822, 0.8749353, -0.6924931, 0, 0.3294118, 1, 1,
0.3286751, 1.590103, 1.585815, 0, 0.3215686, 1, 1,
0.3318297, 0.3919665, -0.2426139, 0, 0.3176471, 1, 1,
0.3354035, -0.843379, 1.900455, 0, 0.3098039, 1, 1,
0.3380909, -1.479943, 3.393259, 0, 0.3058824, 1, 1,
0.3382797, 0.4864646, -0.02388931, 0, 0.2980392, 1, 1,
0.3403527, 0.07828365, 2.052681, 0, 0.2901961, 1, 1,
0.3420618, 0.3600282, 0.8634608, 0, 0.2862745, 1, 1,
0.3422903, -0.01573668, 1.394932, 0, 0.2784314, 1, 1,
0.3429907, 1.683543, -0.276452, 0, 0.2745098, 1, 1,
0.3438706, -0.6090376, 2.606412, 0, 0.2666667, 1, 1,
0.3468485, 1.148505, -0.8260027, 0, 0.2627451, 1, 1,
0.3471926, -2.265007, 2.356949, 0, 0.254902, 1, 1,
0.3477763, -0.9440908, 2.444071, 0, 0.2509804, 1, 1,
0.3486053, 1.644314, -1.009713, 0, 0.2431373, 1, 1,
0.3488631, -1.220325, 2.929622, 0, 0.2392157, 1, 1,
0.3500496, -0.3332526, 3.124234, 0, 0.2313726, 1, 1,
0.3507892, 0.3156216, 2.039353, 0, 0.227451, 1, 1,
0.3507951, -0.04396352, 2.22001, 0, 0.2196078, 1, 1,
0.3522532, 0.2799875, -0.09861442, 0, 0.2156863, 1, 1,
0.355058, -1.098211, 2.240106, 0, 0.2078431, 1, 1,
0.3636073, -0.543672, 3.00985, 0, 0.2039216, 1, 1,
0.3673656, 0.3652579, 0.1164727, 0, 0.1960784, 1, 1,
0.3699759, 0.5029194, 1.792808, 0, 0.1882353, 1, 1,
0.3710936, -1.229438, 4.727242, 0, 0.1843137, 1, 1,
0.371374, -1.19692, 2.557767, 0, 0.1764706, 1, 1,
0.3723732, -1.92851, 1.731747, 0, 0.172549, 1, 1,
0.3728926, -1.765897, 2.903066, 0, 0.1647059, 1, 1,
0.3770654, -0.1923351, 2.285667, 0, 0.1607843, 1, 1,
0.3798704, -0.7120147, 3.581648, 0, 0.1529412, 1, 1,
0.3861342, 1.167859, 0.1643836, 0, 0.1490196, 1, 1,
0.387165, -0.7595048, 2.408217, 0, 0.1411765, 1, 1,
0.3904049, -0.8481842, 2.683758, 0, 0.1372549, 1, 1,
0.3914447, 0.524926, 0.9035616, 0, 0.1294118, 1, 1,
0.3920849, 0.08534081, 1.966929, 0, 0.1254902, 1, 1,
0.3953435, 0.7047667, 0.3764746, 0, 0.1176471, 1, 1,
0.4006874, -0.3600784, 1.224255, 0, 0.1137255, 1, 1,
0.4042751, -0.09075677, 0.1393646, 0, 0.1058824, 1, 1,
0.4042891, -0.1653364, 1.499308, 0, 0.09803922, 1, 1,
0.4056368, -0.9302347, 2.381992, 0, 0.09411765, 1, 1,
0.407174, 0.3449989, 1.450695, 0, 0.08627451, 1, 1,
0.4082459, -1.045223, 3.491573, 0, 0.08235294, 1, 1,
0.4114334, 0.5480178, 0.1031116, 0, 0.07450981, 1, 1,
0.413456, -0.5919269, 2.42302, 0, 0.07058824, 1, 1,
0.4186951, 0.4196881, 0.8982541, 0, 0.0627451, 1, 1,
0.4201148, 0.5429923, -0.6436129, 0, 0.05882353, 1, 1,
0.42276, -1.339036, 3.983374, 0, 0.05098039, 1, 1,
0.4233087, -0.6863629, 1.500146, 0, 0.04705882, 1, 1,
0.4366084, 0.3881472, 0.846001, 0, 0.03921569, 1, 1,
0.4369261, 0.1815189, 0.5379204, 0, 0.03529412, 1, 1,
0.439158, 0.7986335, 2.303408, 0, 0.02745098, 1, 1,
0.4426656, -0.1282492, -0.3150651, 0, 0.02352941, 1, 1,
0.4434949, 0.8663086, -1.917523, 0, 0.01568628, 1, 1,
0.4452557, 0.06573863, 1.164548, 0, 0.01176471, 1, 1,
0.4499409, -1.332334, 3.737822, 0, 0.003921569, 1, 1,
0.4501325, -0.8800501, 3.396294, 0.003921569, 0, 1, 1,
0.4540284, -1.14424, 2.583391, 0.007843138, 0, 1, 1,
0.4585514, -0.6017426, 2.527075, 0.01568628, 0, 1, 1,
0.4662401, -0.6791552, 2.39332, 0.01960784, 0, 1, 1,
0.468984, -0.6134914, 3.548946, 0.02745098, 0, 1, 1,
0.4693689, -0.6946174, 2.57464, 0.03137255, 0, 1, 1,
0.4741724, -1.542707, 2.539273, 0.03921569, 0, 1, 1,
0.4788119, -0.4665064, 3.056, 0.04313726, 0, 1, 1,
0.4805343, 1.54884, -0.6972741, 0.05098039, 0, 1, 1,
0.4817955, -0.4898271, 2.681458, 0.05490196, 0, 1, 1,
0.4833556, 0.4509955, 2.113053, 0.0627451, 0, 1, 1,
0.4875479, 1.534692, 0.1668377, 0.06666667, 0, 1, 1,
0.4926452, -1.249646, 2.681495, 0.07450981, 0, 1, 1,
0.4932837, -1.249566, 2.839006, 0.07843138, 0, 1, 1,
0.4942847, -0.6955628, 1.850217, 0.08627451, 0, 1, 1,
0.500459, 0.5879353, -0.1265122, 0.09019608, 0, 1, 1,
0.5012007, -0.3928931, 1.723299, 0.09803922, 0, 1, 1,
0.5012718, 0.2220892, 0.7361532, 0.1058824, 0, 1, 1,
0.5028614, 0.8918934, 0.9737686, 0.1098039, 0, 1, 1,
0.5041793, -0.3454139, 1.268437, 0.1176471, 0, 1, 1,
0.5065281, 0.2760015, 2.19145, 0.1215686, 0, 1, 1,
0.508836, -0.8082696, 4.086125, 0.1294118, 0, 1, 1,
0.5130557, -0.2523468, 3.83937, 0.1333333, 0, 1, 1,
0.5149384, -1.978884, 3.417291, 0.1411765, 0, 1, 1,
0.5158259, 0.5116946, -0.8401162, 0.145098, 0, 1, 1,
0.515915, -0.2766301, 2.021731, 0.1529412, 0, 1, 1,
0.517011, 2.258339, 0.3616875, 0.1568628, 0, 1, 1,
0.5213283, 0.02526768, 1.640043, 0.1647059, 0, 1, 1,
0.5248545, 0.2087662, 2.067099, 0.1686275, 0, 1, 1,
0.5269083, 0.6424063, 1.258615, 0.1764706, 0, 1, 1,
0.5292383, -0.1610807, 2.170457, 0.1803922, 0, 1, 1,
0.5354431, -1.686076, 3.003338, 0.1882353, 0, 1, 1,
0.5365681, 0.2880187, -0.2988004, 0.1921569, 0, 1, 1,
0.5369583, -0.9176075, 2.361866, 0.2, 0, 1, 1,
0.5385019, 0.8809038, 0.1212516, 0.2078431, 0, 1, 1,
0.5447911, 1.078995, -0.5392045, 0.2117647, 0, 1, 1,
0.5542509, 0.4575489, 1.297543, 0.2196078, 0, 1, 1,
0.5548303, 0.6379306, 1.346365, 0.2235294, 0, 1, 1,
0.5568503, 1.124888, 2.110405, 0.2313726, 0, 1, 1,
0.5580451, -0.7083796, 3.057582, 0.2352941, 0, 1, 1,
0.5595647, 1.415315, -0.2435185, 0.2431373, 0, 1, 1,
0.5624341, 0.1087671, 3.284361, 0.2470588, 0, 1, 1,
0.5638064, 0.4884414, 1.174187, 0.254902, 0, 1, 1,
0.5645449, -1.633873, 4.029543, 0.2588235, 0, 1, 1,
0.5662096, -0.9732922, 4.073242, 0.2666667, 0, 1, 1,
0.5664189, -0.4095798, 4.59602, 0.2705882, 0, 1, 1,
0.5682767, -0.7609733, 3.477318, 0.2784314, 0, 1, 1,
0.5693063, 0.304408, 3.355308, 0.282353, 0, 1, 1,
0.5733394, -1.024213, 2.052172, 0.2901961, 0, 1, 1,
0.5743459, -0.1503954, 1.464009, 0.2941177, 0, 1, 1,
0.5751667, -1.831146, 3.5011, 0.3019608, 0, 1, 1,
0.5755821, 0.5260628, 0.4204427, 0.3098039, 0, 1, 1,
0.576955, -0.2168556, 1.189845, 0.3137255, 0, 1, 1,
0.5784655, 1.292606, 0.8732038, 0.3215686, 0, 1, 1,
0.5819113, 1.695991, -1.011186, 0.3254902, 0, 1, 1,
0.5828849, -0.4198721, 1.576207, 0.3333333, 0, 1, 1,
0.5842627, -0.7493939, 0.1137623, 0.3372549, 0, 1, 1,
0.587436, 0.2756662, 1.434392, 0.345098, 0, 1, 1,
0.5881358, 0.5957459, 1.32344, 0.3490196, 0, 1, 1,
0.5890911, -0.9187846, 3.2799, 0.3568628, 0, 1, 1,
0.5891381, -0.5390009, 4.370981, 0.3607843, 0, 1, 1,
0.5918389, -0.2212327, 1.843362, 0.3686275, 0, 1, 1,
0.6033586, -0.110201, 3.612139, 0.372549, 0, 1, 1,
0.6058418, 1.506188, 2.451637, 0.3803922, 0, 1, 1,
0.608064, 0.2146719, 2.338805, 0.3843137, 0, 1, 1,
0.6130422, -2.227785, 3.303998, 0.3921569, 0, 1, 1,
0.6138575, 2.10703, -0.9375187, 0.3960784, 0, 1, 1,
0.620681, -1.183088, 3.641932, 0.4039216, 0, 1, 1,
0.6230788, 1.034575, 0.4700751, 0.4117647, 0, 1, 1,
0.624237, -0.02213448, 1.141884, 0.4156863, 0, 1, 1,
0.6316462, -0.1863721, 1.493974, 0.4235294, 0, 1, 1,
0.6334683, -0.4098755, 0.5973554, 0.427451, 0, 1, 1,
0.6386979, 2.06241, 1.23162, 0.4352941, 0, 1, 1,
0.640815, 1.658523, 0.6846327, 0.4392157, 0, 1, 1,
0.6564091, -0.3865366, 1.54762, 0.4470588, 0, 1, 1,
0.6595338, 0.01731824, 2.318327, 0.4509804, 0, 1, 1,
0.6648912, -2.401437, 3.605267, 0.4588235, 0, 1, 1,
0.6678079, 2.085787, 0.2974359, 0.4627451, 0, 1, 1,
0.6728725, -0.5059164, 3.583726, 0.4705882, 0, 1, 1,
0.6817144, 1.508039, 1.047949, 0.4745098, 0, 1, 1,
0.6890382, 0.8095277, 0.4081531, 0.4823529, 0, 1, 1,
0.6922352, -0.5614116, 3.513165, 0.4862745, 0, 1, 1,
0.692932, -0.9202117, 1.864504, 0.4941176, 0, 1, 1,
0.6953065, -1.58885, 1.976588, 0.5019608, 0, 1, 1,
0.6964149, 1.130541, 0.06148855, 0.5058824, 0, 1, 1,
0.6983781, -2.32777, 2.113383, 0.5137255, 0, 1, 1,
0.7018073, 1.801138, 0.4740734, 0.5176471, 0, 1, 1,
0.7088094, -2.863216, 2.436177, 0.5254902, 0, 1, 1,
0.7139807, -2.122252, 3.888503, 0.5294118, 0, 1, 1,
0.7258222, -1.363849, 2.136914, 0.5372549, 0, 1, 1,
0.7302569, 1.418852, 0.8428876, 0.5411765, 0, 1, 1,
0.7307091, -0.5828347, 1.359414, 0.5490196, 0, 1, 1,
0.7366535, -0.1965183, 4.180363, 0.5529412, 0, 1, 1,
0.7466451, 1.804288, 1.082591, 0.5607843, 0, 1, 1,
0.7616619, -0.9719292, 1.700148, 0.5647059, 0, 1, 1,
0.7662402, 0.7167971, 2.692588, 0.572549, 0, 1, 1,
0.7683391, 0.8321272, 0.6981758, 0.5764706, 0, 1, 1,
0.772204, -1.361958, 3.251696, 0.5843138, 0, 1, 1,
0.7723837, 0.744109, 1.587853, 0.5882353, 0, 1, 1,
0.7884592, -1.516501, 3.737079, 0.5960785, 0, 1, 1,
0.7913163, -0.6376343, 2.589066, 0.6039216, 0, 1, 1,
0.7931831, 0.3371341, -0.3439339, 0.6078432, 0, 1, 1,
0.7939129, -0.4241875, 1.501858, 0.6156863, 0, 1, 1,
0.7948037, -0.1641776, 2.655246, 0.6196079, 0, 1, 1,
0.804603, -1.013929, 1.439999, 0.627451, 0, 1, 1,
0.8057082, 0.7442405, -2.071008, 0.6313726, 0, 1, 1,
0.812701, -0.03619657, -0.4207444, 0.6392157, 0, 1, 1,
0.8129329, 0.5179194, -0.1083049, 0.6431373, 0, 1, 1,
0.8151861, 0.4506727, -0.2490495, 0.6509804, 0, 1, 1,
0.8189375, 1.112709, 1.096994, 0.654902, 0, 1, 1,
0.8199129, 0.8251456, 0.8572702, 0.6627451, 0, 1, 1,
0.8285922, 0.09853341, 2.774223, 0.6666667, 0, 1, 1,
0.8408667, -0.1567595, 1.763985, 0.6745098, 0, 1, 1,
0.8419943, 2.412723, 0.5279185, 0.6784314, 0, 1, 1,
0.8432875, 0.0230845, 0.9358151, 0.6862745, 0, 1, 1,
0.84718, 0.8931728, 0.7816365, 0.6901961, 0, 1, 1,
0.8511795, 0.724106, -0.671531, 0.6980392, 0, 1, 1,
0.8559647, -1.336595, 3.547519, 0.7058824, 0, 1, 1,
0.8563417, 0.02471391, 0.81098, 0.7098039, 0, 1, 1,
0.8569509, -2.966166, 2.712777, 0.7176471, 0, 1, 1,
0.8593827, 0.4531178, 1.59112, 0.7215686, 0, 1, 1,
0.860845, -0.6513085, 1.968414, 0.7294118, 0, 1, 1,
0.8622798, -1.864914, 1.865447, 0.7333333, 0, 1, 1,
0.8695372, -0.3883862, 2.645587, 0.7411765, 0, 1, 1,
0.8796121, -0.7246492, 3.007577, 0.7450981, 0, 1, 1,
0.882214, -0.6273835, 1.314142, 0.7529412, 0, 1, 1,
0.884399, -0.9062509, 1.524346, 0.7568628, 0, 1, 1,
0.8912325, -1.925728, 3.389697, 0.7647059, 0, 1, 1,
0.8921803, -1.127222, 4.217075, 0.7686275, 0, 1, 1,
0.8983663, 0.9753827, 0.02603578, 0.7764706, 0, 1, 1,
0.9008657, -0.4686736, 1.326235, 0.7803922, 0, 1, 1,
0.9019677, -0.8366269, 2.924044, 0.7882353, 0, 1, 1,
0.909292, -0.2525144, 2.153536, 0.7921569, 0, 1, 1,
0.9116653, 0.2092576, 2.819576, 0.8, 0, 1, 1,
0.9121314, 1.082926, 0.01491594, 0.8078431, 0, 1, 1,
0.916039, -1.404951, 4.567668, 0.8117647, 0, 1, 1,
0.9233321, 1.622139, 0.9651536, 0.8196079, 0, 1, 1,
0.9235809, 1.009841, 0.9621736, 0.8235294, 0, 1, 1,
0.9272023, 0.7906252, 0.4944408, 0.8313726, 0, 1, 1,
0.9282639, 0.7190508, 2.092714, 0.8352941, 0, 1, 1,
0.9338208, 2.067043, 0.9637265, 0.8431373, 0, 1, 1,
0.9387497, 0.9183784, 2.806957, 0.8470588, 0, 1, 1,
0.9460859, -2.443642, 0.903807, 0.854902, 0, 1, 1,
0.9462742, 0.4173214, 1.73698, 0.8588235, 0, 1, 1,
0.9529855, -0.5375248, 1.850183, 0.8666667, 0, 1, 1,
0.9621483, -0.5567867, 1.200687, 0.8705882, 0, 1, 1,
0.9764231, -1.581084, 2.057331, 0.8784314, 0, 1, 1,
0.9840997, -1.308725, 2.95349, 0.8823529, 0, 1, 1,
0.9921029, 0.3296475, 0.5752634, 0.8901961, 0, 1, 1,
0.9956787, -1.161488, 1.087247, 0.8941177, 0, 1, 1,
0.9976083, 1.229104, 0.1595255, 0.9019608, 0, 1, 1,
0.9983585, 0.1040728, 0.7111378, 0.9098039, 0, 1, 1,
1.000239, -0.9302999, 3.473631, 0.9137255, 0, 1, 1,
1.00751, 0.3890916, 1.866482, 0.9215686, 0, 1, 1,
1.011454, -0.04613223, 1.261936, 0.9254902, 0, 1, 1,
1.015333, -0.2678537, 3.113133, 0.9333333, 0, 1, 1,
1.019734, -0.3433646, 2.489808, 0.9372549, 0, 1, 1,
1.021582, 1.571725, -0.4419599, 0.945098, 0, 1, 1,
1.028783, -1.239308, 1.488492, 0.9490196, 0, 1, 1,
1.031485, 1.256055, 0.9361478, 0.9568627, 0, 1, 1,
1.032951, 1.414231, -0.2760896, 0.9607843, 0, 1, 1,
1.035604, -0.1671361, 1.694181, 0.9686275, 0, 1, 1,
1.039899, -0.3280324, 1.500144, 0.972549, 0, 1, 1,
1.042809, 1.140377, 2.778315, 0.9803922, 0, 1, 1,
1.051108, -0.7052172, 3.615517, 0.9843137, 0, 1, 1,
1.053227, 0.06799079, 1.673044, 0.9921569, 0, 1, 1,
1.059182, -1.062393, 2.865944, 0.9960784, 0, 1, 1,
1.068067, -0.3171072, 1.923684, 1, 0, 0.9960784, 1,
1.069637, 1.382786, 1.401522, 1, 0, 0.9882353, 1,
1.073966, -1.626243, 3.139964, 1, 0, 0.9843137, 1,
1.074949, -0.1600872, 1.323053, 1, 0, 0.9764706, 1,
1.077655, 0.5380237, 0.6438459, 1, 0, 0.972549, 1,
1.081159, 0.8606751, 1.157457, 1, 0, 0.9647059, 1,
1.084749, -0.4883583, -0.2462771, 1, 0, 0.9607843, 1,
1.085515, -0.9141861, 2.622687, 1, 0, 0.9529412, 1,
1.086142, 0.4148887, 0.04098959, 1, 0, 0.9490196, 1,
1.087154, -0.1244074, 3.111291, 1, 0, 0.9411765, 1,
1.090822, -0.1905236, 0.9011826, 1, 0, 0.9372549, 1,
1.100781, -1.594163, 3.436692, 1, 0, 0.9294118, 1,
1.101719, 1.056988, 0.4114143, 1, 0, 0.9254902, 1,
1.125093, -0.4469101, 2.231845, 1, 0, 0.9176471, 1,
1.127162, -0.1995147, 1.109255, 1, 0, 0.9137255, 1,
1.130735, 1.377856, 0.9516701, 1, 0, 0.9058824, 1,
1.135401, 1.375132, 2.385237, 1, 0, 0.9019608, 1,
1.142954, -1.906165, 2.38449, 1, 0, 0.8941177, 1,
1.153476, 1.773142, 0.02164134, 1, 0, 0.8862745, 1,
1.155025, -1.288533, 1.944333, 1, 0, 0.8823529, 1,
1.158498, -0.613448, 1.169296, 1, 0, 0.8745098, 1,
1.172307, -0.008007085, 3.059913, 1, 0, 0.8705882, 1,
1.173678, -0.07652032, 1.285169, 1, 0, 0.8627451, 1,
1.182733, -0.1331888, 1.041628, 1, 0, 0.8588235, 1,
1.192344, -2.06336, 2.538626, 1, 0, 0.8509804, 1,
1.198254, -0.115416, 1.272878, 1, 0, 0.8470588, 1,
1.199692, -2.448467, 3.244238, 1, 0, 0.8392157, 1,
1.200665, -0.3217947, 3.037138, 1, 0, 0.8352941, 1,
1.203895, 0.8573571, 1.477798, 1, 0, 0.827451, 1,
1.21563, -1.074503, 4.318167, 1, 0, 0.8235294, 1,
1.221655, 0.4044516, 2.562408, 1, 0, 0.8156863, 1,
1.228219, 0.6642478, 2.276224, 1, 0, 0.8117647, 1,
1.234899, -0.2480871, 1.792073, 1, 0, 0.8039216, 1,
1.23677, -1.437388, 2.638734, 1, 0, 0.7960784, 1,
1.24631, 0.1922611, 0.3996552, 1, 0, 0.7921569, 1,
1.246852, -1.244373, 1.540986, 1, 0, 0.7843137, 1,
1.267093, -1.86011, 1.760296, 1, 0, 0.7803922, 1,
1.267737, -2.116365, 2.857067, 1, 0, 0.772549, 1,
1.26792, 1.005027, 1.405697, 1, 0, 0.7686275, 1,
1.270832, 0.8624016, -0.4493458, 1, 0, 0.7607843, 1,
1.27089, -0.67071, 2.501765, 1, 0, 0.7568628, 1,
1.273585, 0.2195653, 2.189902, 1, 0, 0.7490196, 1,
1.278777, 0.3775893, 0.1367344, 1, 0, 0.7450981, 1,
1.281107, -1.928112, 4.01409, 1, 0, 0.7372549, 1,
1.282359, -0.9525022, 2.939099, 1, 0, 0.7333333, 1,
1.288451, -0.3147726, 1.574077, 1, 0, 0.7254902, 1,
1.293709, -0.9715329, 2.61264, 1, 0, 0.7215686, 1,
1.299414, 0.2907148, 2.251997, 1, 0, 0.7137255, 1,
1.318337, -1.300401, 1.762002, 1, 0, 0.7098039, 1,
1.320352, 1.866461, 1.657237, 1, 0, 0.7019608, 1,
1.323844, 0.3107855, 2.61984, 1, 0, 0.6941177, 1,
1.335133, 0.1110576, -0.1738067, 1, 0, 0.6901961, 1,
1.343594, -1.656608, 3.332851, 1, 0, 0.682353, 1,
1.345008, -1.162013, 1.686734, 1, 0, 0.6784314, 1,
1.362987, -0.0307975, 3.40748, 1, 0, 0.6705883, 1,
1.36374, -0.1019066, 2.16724, 1, 0, 0.6666667, 1,
1.365073, 1.492473, 1.651123, 1, 0, 0.6588235, 1,
1.368564, 0.3296822, -0.01033671, 1, 0, 0.654902, 1,
1.368965, -0.3198595, 3.265676, 1, 0, 0.6470588, 1,
1.368997, 0.902496, 0.7683346, 1, 0, 0.6431373, 1,
1.370716, 0.7933964, 1.445644, 1, 0, 0.6352941, 1,
1.372969, 0.7034695, -0.005805354, 1, 0, 0.6313726, 1,
1.378254, 0.03289422, 1.639813, 1, 0, 0.6235294, 1,
1.379306, -0.4632227, 0.6218913, 1, 0, 0.6196079, 1,
1.380345, 0.814766, 1.678338, 1, 0, 0.6117647, 1,
1.38052, -0.03124286, -0.6006837, 1, 0, 0.6078432, 1,
1.382295, 0.8378632, 2.269952, 1, 0, 0.6, 1,
1.38477, -1.450223, 1.741099, 1, 0, 0.5921569, 1,
1.387923, 1.796978, 1.315063, 1, 0, 0.5882353, 1,
1.390132, -0.4635087, 2.498639, 1, 0, 0.5803922, 1,
1.39496, -0.31057, 1.722913, 1, 0, 0.5764706, 1,
1.397815, -0.7840561, 2.343257, 1, 0, 0.5686275, 1,
1.411745, 0.2315697, 0.7285963, 1, 0, 0.5647059, 1,
1.41596, -1.004971, 2.426765, 1, 0, 0.5568628, 1,
1.420546, 1.175045, 0.5897438, 1, 0, 0.5529412, 1,
1.429695, 1.160354, 0.1699268, 1, 0, 0.5450981, 1,
1.437642, 0.272329, 0.6702155, 1, 0, 0.5411765, 1,
1.456981, -0.02267989, 0.3621283, 1, 0, 0.5333334, 1,
1.460059, 0.5567299, 0.9900784, 1, 0, 0.5294118, 1,
1.462767, 0.3909671, 1.730832, 1, 0, 0.5215687, 1,
1.465235, 0.2049482, 1.741985, 1, 0, 0.5176471, 1,
1.470702, 0.1069374, 0.6405503, 1, 0, 0.509804, 1,
1.471157, -0.02079065, 1.100006, 1, 0, 0.5058824, 1,
1.477407, -0.07396924, 2.975353, 1, 0, 0.4980392, 1,
1.490776, -0.1866977, 0.7323394, 1, 0, 0.4901961, 1,
1.49126, 0.744274, 1.799176, 1, 0, 0.4862745, 1,
1.517928, -0.9181496, 1.950166, 1, 0, 0.4784314, 1,
1.522907, 0.9523762, 2.824202, 1, 0, 0.4745098, 1,
1.529829, 0.07043347, 0.7106562, 1, 0, 0.4666667, 1,
1.546456, 0.2297848, 1.595341, 1, 0, 0.4627451, 1,
1.571491, 0.6587931, 2.398122, 1, 0, 0.454902, 1,
1.575345, 1.567262, 0.6774298, 1, 0, 0.4509804, 1,
1.575439, -0.7066725, 0.6885786, 1, 0, 0.4431373, 1,
1.578969, -0.2344661, 3.292568, 1, 0, 0.4392157, 1,
1.589468, 1.10024, 1.949053, 1, 0, 0.4313726, 1,
1.595415, 0.7220784, 1.508927, 1, 0, 0.427451, 1,
1.610891, 0.9779974, 1.478887, 1, 0, 0.4196078, 1,
1.615119, 2.202023, -0.711843, 1, 0, 0.4156863, 1,
1.618932, 0.7527568, 0.9348773, 1, 0, 0.4078431, 1,
1.628292, 2.115096, 0.2771171, 1, 0, 0.4039216, 1,
1.648202, 1.27746, 3.208593, 1, 0, 0.3960784, 1,
1.654204, 0.90234, 0.9296719, 1, 0, 0.3882353, 1,
1.661042, 1.733237, -0.8087438, 1, 0, 0.3843137, 1,
1.661178, 1.139846, 1.384298, 1, 0, 0.3764706, 1,
1.663785, -0.533918, 2.48708, 1, 0, 0.372549, 1,
1.666332, 0.6366762, -0.2633382, 1, 0, 0.3647059, 1,
1.667866, -1.486764, 3.652999, 1, 0, 0.3607843, 1,
1.676693, 0.4369738, 1.717823, 1, 0, 0.3529412, 1,
1.680799, 0.146745, 3.713408, 1, 0, 0.3490196, 1,
1.709319, 0.6683396, 0.4902447, 1, 0, 0.3411765, 1,
1.713278, -1.474588, 2.808802, 1, 0, 0.3372549, 1,
1.721942, 0.8359031, -0.2030109, 1, 0, 0.3294118, 1,
1.730771, -0.5649327, 2.483354, 1, 0, 0.3254902, 1,
1.746651, -0.2457328, 0.6505309, 1, 0, 0.3176471, 1,
1.748947, -1.942056, 2.888638, 1, 0, 0.3137255, 1,
1.758735, 2.344492, 0.846098, 1, 0, 0.3058824, 1,
1.762571, 0.1054977, 1.602905, 1, 0, 0.2980392, 1,
1.785349, -0.1278748, 1.104053, 1, 0, 0.2941177, 1,
1.789889, 1.258491, 0.8060256, 1, 0, 0.2862745, 1,
1.813789, 2.104313, 2.117621, 1, 0, 0.282353, 1,
1.82496, 0.5145304, 1.418748, 1, 0, 0.2745098, 1,
1.835604, -0.6244512, 0.4450788, 1, 0, 0.2705882, 1,
1.847006, 0.2954499, 1.164425, 1, 0, 0.2627451, 1,
1.85297, 1.247529, 2.233678, 1, 0, 0.2588235, 1,
1.858812, -2.124351, 1.121825, 1, 0, 0.2509804, 1,
1.867313, 0.2784714, 0.1308977, 1, 0, 0.2470588, 1,
1.86883, 0.6142954, 2.677352, 1, 0, 0.2392157, 1,
1.886096, -0.5103974, 3.076334, 1, 0, 0.2352941, 1,
1.889438, 0.9588978, 0.7521062, 1, 0, 0.227451, 1,
1.894775, 1.382336, 1.66152, 1, 0, 0.2235294, 1,
1.910181, 1.09885, -0.5121475, 1, 0, 0.2156863, 1,
1.928558, -0.0499756, -0.3735575, 1, 0, 0.2117647, 1,
1.932444, -1.410809, 1.789007, 1, 0, 0.2039216, 1,
1.959139, 0.8071687, 1.632116, 1, 0, 0.1960784, 1,
1.972337, -0.1996705, 2.181815, 1, 0, 0.1921569, 1,
1.980994, 1.614762, -0.1022151, 1, 0, 0.1843137, 1,
1.997716, -0.403887, 3.857814, 1, 0, 0.1803922, 1,
2.008244, 1.340639, 0.7980322, 1, 0, 0.172549, 1,
2.016159, -0.9129167, 0.827388, 1, 0, 0.1686275, 1,
2.027022, 0.1351836, -0.1581438, 1, 0, 0.1607843, 1,
2.065466, -0.01500525, 2.953486, 1, 0, 0.1568628, 1,
2.082737, 0.6850783, -1.497206, 1, 0, 0.1490196, 1,
2.098755, 0.5951701, 0.8967646, 1, 0, 0.145098, 1,
2.130433, -1.276432, 1.235245, 1, 0, 0.1372549, 1,
2.142042, 0.2524608, 0.878695, 1, 0, 0.1333333, 1,
2.179221, 0.6110519, 0.3811121, 1, 0, 0.1254902, 1,
2.217494, 1.113105, 0.1348262, 1, 0, 0.1215686, 1,
2.251532, 0.8223164, 0.8075144, 1, 0, 0.1137255, 1,
2.251781, -0.3845189, 0.9549372, 1, 0, 0.1098039, 1,
2.252295, 0.4291782, 1.533437, 1, 0, 0.1019608, 1,
2.337656, -0.4244969, 0.3573267, 1, 0, 0.09411765, 1,
2.348894, -0.3259455, 0.2273297, 1, 0, 0.09019608, 1,
2.369526, 1.155417, 2.395422, 1, 0, 0.08235294, 1,
2.369546, 0.9813998, 0.8090401, 1, 0, 0.07843138, 1,
2.385672, -0.2377379, 3.359684, 1, 0, 0.07058824, 1,
2.447711, -1.134816, 2.569514, 1, 0, 0.06666667, 1,
2.472039, -0.398615, 2.494748, 1, 0, 0.05882353, 1,
2.545784, 0.6141461, 0.436482, 1, 0, 0.05490196, 1,
2.561803, 0.0842067, 1.043877, 1, 0, 0.04705882, 1,
2.619868, 0.3372002, 2.835907, 1, 0, 0.04313726, 1,
2.650672, 0.6324844, 2.017252, 1, 0, 0.03529412, 1,
2.689523, -0.1514178, 2.13661, 1, 0, 0.03137255, 1,
2.717534, -1.676106, 2.127774, 1, 0, 0.02352941, 1,
2.883443, -0.1340266, 2.164179, 1, 0, 0.01960784, 1,
3.084906, -1.464841, 2.564961, 1, 0, 0.01176471, 1,
3.33331, 1.794324, 0.7490599, 1, 0, 0.007843138, 1
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
-0.1305791, -3.988897, -6.557388, 0, -0.5, 0.5, 0.5,
-0.1305791, -3.988897, -6.557388, 1, -0.5, 0.5, 0.5,
-0.1305791, -3.988897, -6.557388, 1, 1.5, 0.5, 0.5,
-0.1305791, -3.988897, -6.557388, 0, 1.5, 0.5, 0.5
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
-4.768726, 0.0507375, -6.557388, 0, -0.5, 0.5, 0.5,
-4.768726, 0.0507375, -6.557388, 1, -0.5, 0.5, 0.5,
-4.768726, 0.0507375, -6.557388, 1, 1.5, 0.5, 0.5,
-4.768726, 0.0507375, -6.557388, 0, 1.5, 0.5, 0.5
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
-4.768726, -3.988897, -0.09731126, 0, -0.5, 0.5, 0.5,
-4.768726, -3.988897, -0.09731126, 1, -0.5, 0.5, 0.5,
-4.768726, -3.988897, -0.09731126, 1, 1.5, 0.5, 0.5,
-4.768726, -3.988897, -0.09731126, 0, 1.5, 0.5, 0.5
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
-3, -3.056673, -5.066601,
3, -3.056673, -5.066601,
-3, -3.056673, -5.066601,
-3, -3.212044, -5.315065,
-2, -3.056673, -5.066601,
-2, -3.212044, -5.315065,
-1, -3.056673, -5.066601,
-1, -3.212044, -5.315065,
0, -3.056673, -5.066601,
0, -3.212044, -5.315065,
1, -3.056673, -5.066601,
1, -3.212044, -5.315065,
2, -3.056673, -5.066601,
2, -3.212044, -5.315065,
3, -3.056673, -5.066601,
3, -3.212044, -5.315065
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
-3, -3.522785, -5.811995, 0, -0.5, 0.5, 0.5,
-3, -3.522785, -5.811995, 1, -0.5, 0.5, 0.5,
-3, -3.522785, -5.811995, 1, 1.5, 0.5, 0.5,
-3, -3.522785, -5.811995, 0, 1.5, 0.5, 0.5,
-2, -3.522785, -5.811995, 0, -0.5, 0.5, 0.5,
-2, -3.522785, -5.811995, 1, -0.5, 0.5, 0.5,
-2, -3.522785, -5.811995, 1, 1.5, 0.5, 0.5,
-2, -3.522785, -5.811995, 0, 1.5, 0.5, 0.5,
-1, -3.522785, -5.811995, 0, -0.5, 0.5, 0.5,
-1, -3.522785, -5.811995, 1, -0.5, 0.5, 0.5,
-1, -3.522785, -5.811995, 1, 1.5, 0.5, 0.5,
-1, -3.522785, -5.811995, 0, 1.5, 0.5, 0.5,
0, -3.522785, -5.811995, 0, -0.5, 0.5, 0.5,
0, -3.522785, -5.811995, 1, -0.5, 0.5, 0.5,
0, -3.522785, -5.811995, 1, 1.5, 0.5, 0.5,
0, -3.522785, -5.811995, 0, 1.5, 0.5, 0.5,
1, -3.522785, -5.811995, 0, -0.5, 0.5, 0.5,
1, -3.522785, -5.811995, 1, -0.5, 0.5, 0.5,
1, -3.522785, -5.811995, 1, 1.5, 0.5, 0.5,
1, -3.522785, -5.811995, 0, 1.5, 0.5, 0.5,
2, -3.522785, -5.811995, 0, -0.5, 0.5, 0.5,
2, -3.522785, -5.811995, 1, -0.5, 0.5, 0.5,
2, -3.522785, -5.811995, 1, 1.5, 0.5, 0.5,
2, -3.522785, -5.811995, 0, 1.5, 0.5, 0.5,
3, -3.522785, -5.811995, 0, -0.5, 0.5, 0.5,
3, -3.522785, -5.811995, 1, -0.5, 0.5, 0.5,
3, -3.522785, -5.811995, 1, 1.5, 0.5, 0.5,
3, -3.522785, -5.811995, 0, 1.5, 0.5, 0.5
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
-3.698385, -2, -5.066601,
-3.698385, 3, -5.066601,
-3.698385, -2, -5.066601,
-3.876775, -2, -5.315065,
-3.698385, -1, -5.066601,
-3.876775, -1, -5.315065,
-3.698385, 0, -5.066601,
-3.876775, 0, -5.315065,
-3.698385, 1, -5.066601,
-3.876775, 1, -5.315065,
-3.698385, 2, -5.066601,
-3.876775, 2, -5.315065,
-3.698385, 3, -5.066601,
-3.876775, 3, -5.315065
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
-4.233555, -2, -5.811995, 0, -0.5, 0.5, 0.5,
-4.233555, -2, -5.811995, 1, -0.5, 0.5, 0.5,
-4.233555, -2, -5.811995, 1, 1.5, 0.5, 0.5,
-4.233555, -2, -5.811995, 0, 1.5, 0.5, 0.5,
-4.233555, -1, -5.811995, 0, -0.5, 0.5, 0.5,
-4.233555, -1, -5.811995, 1, -0.5, 0.5, 0.5,
-4.233555, -1, -5.811995, 1, 1.5, 0.5, 0.5,
-4.233555, -1, -5.811995, 0, 1.5, 0.5, 0.5,
-4.233555, 0, -5.811995, 0, -0.5, 0.5, 0.5,
-4.233555, 0, -5.811995, 1, -0.5, 0.5, 0.5,
-4.233555, 0, -5.811995, 1, 1.5, 0.5, 0.5,
-4.233555, 0, -5.811995, 0, 1.5, 0.5, 0.5,
-4.233555, 1, -5.811995, 0, -0.5, 0.5, 0.5,
-4.233555, 1, -5.811995, 1, -0.5, 0.5, 0.5,
-4.233555, 1, -5.811995, 1, 1.5, 0.5, 0.5,
-4.233555, 1, -5.811995, 0, 1.5, 0.5, 0.5,
-4.233555, 2, -5.811995, 0, -0.5, 0.5, 0.5,
-4.233555, 2, -5.811995, 1, -0.5, 0.5, 0.5,
-4.233555, 2, -5.811995, 1, 1.5, 0.5, 0.5,
-4.233555, 2, -5.811995, 0, 1.5, 0.5, 0.5,
-4.233555, 3, -5.811995, 0, -0.5, 0.5, 0.5,
-4.233555, 3, -5.811995, 1, -0.5, 0.5, 0.5,
-4.233555, 3, -5.811995, 1, 1.5, 0.5, 0.5,
-4.233555, 3, -5.811995, 0, 1.5, 0.5, 0.5
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
-3.698385, -3.056673, -4,
-3.698385, -3.056673, 4,
-3.698385, -3.056673, -4,
-3.876775, -3.212044, -4,
-3.698385, -3.056673, -2,
-3.876775, -3.212044, -2,
-3.698385, -3.056673, 0,
-3.876775, -3.212044, 0,
-3.698385, -3.056673, 2,
-3.876775, -3.212044, 2,
-3.698385, -3.056673, 4,
-3.876775, -3.212044, 4
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
-4.233555, -3.522785, -4, 0, -0.5, 0.5, 0.5,
-4.233555, -3.522785, -4, 1, -0.5, 0.5, 0.5,
-4.233555, -3.522785, -4, 1, 1.5, 0.5, 0.5,
-4.233555, -3.522785, -4, 0, 1.5, 0.5, 0.5,
-4.233555, -3.522785, -2, 0, -0.5, 0.5, 0.5,
-4.233555, -3.522785, -2, 1, -0.5, 0.5, 0.5,
-4.233555, -3.522785, -2, 1, 1.5, 0.5, 0.5,
-4.233555, -3.522785, -2, 0, 1.5, 0.5, 0.5,
-4.233555, -3.522785, 0, 0, -0.5, 0.5, 0.5,
-4.233555, -3.522785, 0, 1, -0.5, 0.5, 0.5,
-4.233555, -3.522785, 0, 1, 1.5, 0.5, 0.5,
-4.233555, -3.522785, 0, 0, 1.5, 0.5, 0.5,
-4.233555, -3.522785, 2, 0, -0.5, 0.5, 0.5,
-4.233555, -3.522785, 2, 1, -0.5, 0.5, 0.5,
-4.233555, -3.522785, 2, 1, 1.5, 0.5, 0.5,
-4.233555, -3.522785, 2, 0, 1.5, 0.5, 0.5,
-4.233555, -3.522785, 4, 0, -0.5, 0.5, 0.5,
-4.233555, -3.522785, 4, 1, -0.5, 0.5, 0.5,
-4.233555, -3.522785, 4, 1, 1.5, 0.5, 0.5,
-4.233555, -3.522785, 4, 0, 1.5, 0.5, 0.5
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
-3.698385, -3.056673, -5.066601,
-3.698385, 3.158148, -5.066601,
-3.698385, -3.056673, 4.871979,
-3.698385, 3.158148, 4.871979,
-3.698385, -3.056673, -5.066601,
-3.698385, -3.056673, 4.871979,
-3.698385, 3.158148, -5.066601,
-3.698385, 3.158148, 4.871979,
-3.698385, -3.056673, -5.066601,
3.437226, -3.056673, -5.066601,
-3.698385, -3.056673, 4.871979,
3.437226, -3.056673, 4.871979,
-3.698385, 3.158148, -5.066601,
3.437226, 3.158148, -5.066601,
-3.698385, 3.158148, 4.871979,
3.437226, 3.158148, 4.871979,
3.437226, -3.056673, -5.066601,
3.437226, 3.158148, -5.066601,
3.437226, -3.056673, 4.871979,
3.437226, 3.158148, 4.871979,
3.437226, -3.056673, -5.066601,
3.437226, -3.056673, 4.871979,
3.437226, 3.158148, -5.066601,
3.437226, 3.158148, 4.871979
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
var radius = 7.32773;
var distance = 32.6019;
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
mvMatrix.translate( 0.1305791, -0.0507375, 0.09731126 );
mvMatrix.scale( 1.11033, 1.274837, 0.7971848 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -32.6019);
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
propylaminocarbonylo<-read.table("propylaminocarbonylo.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-propylaminocarbonylo$V2
```

```
## Error in eval(expr, envir, enclos): object 'propylaminocarbonylo' not found
```

```r
y<-propylaminocarbonylo$V3
```

```
## Error in eval(expr, envir, enclos): object 'propylaminocarbonylo' not found
```

```r
z<-propylaminocarbonylo$V4
```

```
## Error in eval(expr, envir, enclos): object 'propylaminocarbonylo' not found
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
-3.594468, -0.3401298, -2.82969, 0, 0, 1, 1, 1,
-3.055777, 1.547874, -0.9873369, 1, 0, 0, 1, 1,
-2.85036, 0.4506206, -2.459213, 1, 0, 0, 1, 1,
-2.845128, -0.2336654, -0.9727691, 1, 0, 0, 1, 1,
-2.630718, 0.4332513, -1.534505, 1, 0, 0, 1, 1,
-2.584118, 0.7877236, -1.579976, 1, 0, 0, 1, 1,
-2.575847, -1.181345, -1.792993, 0, 0, 0, 1, 1,
-2.523465, 2.010623, -2.67435, 0, 0, 0, 1, 1,
-2.485415, 0.922398, -1.366511, 0, 0, 0, 1, 1,
-2.386436, -1.180151, -0.781392, 0, 0, 0, 1, 1,
-2.303553, -0.3280528, -1.57423, 0, 0, 0, 1, 1,
-2.295606, -1.025633, -3.031295, 0, 0, 0, 1, 1,
-2.2836, 1.780024, -0.8622116, 0, 0, 0, 1, 1,
-2.250081, 0.03183458, 0.2448622, 1, 1, 1, 1, 1,
-2.241325, -0.6984872, -2.997488, 1, 1, 1, 1, 1,
-2.223468, 1.365221, -1.341528, 1, 1, 1, 1, 1,
-2.185475, -0.03021398, -1.091867, 1, 1, 1, 1, 1,
-2.153396, 1.161014, -1.517949, 1, 1, 1, 1, 1,
-2.14366, -1.932579, -3.159046, 1, 1, 1, 1, 1,
-2.138346, -1.493877, -2.002492, 1, 1, 1, 1, 1,
-2.065317, -0.3161477, -1.476624, 1, 1, 1, 1, 1,
-2.06526, -1.2799, -3.340255, 1, 1, 1, 1, 1,
-2.040173, -1.53399, -0.7032036, 1, 1, 1, 1, 1,
-2.038303, -0.6922215, -3.049716, 1, 1, 1, 1, 1,
-2.009288, 0.6218645, -1.533447, 1, 1, 1, 1, 1,
-2.008968, 0.119883, -1.345984, 1, 1, 1, 1, 1,
-1.975325, -0.4359478, -0.3492466, 1, 1, 1, 1, 1,
-1.975233, -0.08770395, 0.6250903, 1, 1, 1, 1, 1,
-1.965428, -1.961135, -2.067041, 0, 0, 1, 1, 1,
-1.956305, 1.446403, -1.709165, 1, 0, 0, 1, 1,
-1.919215, 2.744444, -1.241767, 1, 0, 0, 1, 1,
-1.896739, -0.806259, -1.775534, 1, 0, 0, 1, 1,
-1.870127, -0.2567136, -1.629704, 1, 0, 0, 1, 1,
-1.830058, 0.7710387, -1.971825, 1, 0, 0, 1, 1,
-1.815871, 1.30824, -2.403707, 0, 0, 0, 1, 1,
-1.810733, -0.3131692, -2.266177, 0, 0, 0, 1, 1,
-1.789076, 0.1579798, -0.6136418, 0, 0, 0, 1, 1,
-1.78543, -0.2198928, -2.398457, 0, 0, 0, 1, 1,
-1.773298, 0.2769562, -0.3960862, 0, 0, 0, 1, 1,
-1.763958, 0.8922938, -2.068079, 0, 0, 0, 1, 1,
-1.759481, -1.82325, -2.091139, 0, 0, 0, 1, 1,
-1.753229, 0.1295317, -2.510956, 1, 1, 1, 1, 1,
-1.703796, 0.5297408, -1.295532, 1, 1, 1, 1, 1,
-1.692253, -1.826387, -2.476986, 1, 1, 1, 1, 1,
-1.674018, 0.3020456, -1.414679, 1, 1, 1, 1, 1,
-1.653361, 0.520186, -0.8928418, 1, 1, 1, 1, 1,
-1.652596, -1.755986, -2.199905, 1, 1, 1, 1, 1,
-1.646477, -0.7701862, -0.726086, 1, 1, 1, 1, 1,
-1.625763, 0.2695388, -1.057356, 1, 1, 1, 1, 1,
-1.5535, -0.5268152, -1.003704, 1, 1, 1, 1, 1,
-1.524307, -1.55377, -1.327132, 1, 1, 1, 1, 1,
-1.522691, -1.057235, -4.395736, 1, 1, 1, 1, 1,
-1.514105, 0.1848178, -2.39384, 1, 1, 1, 1, 1,
-1.506553, 0.608917, -1.940603, 1, 1, 1, 1, 1,
-1.498945, -0.111486, -1.242906, 1, 1, 1, 1, 1,
-1.494507, -1.524335, -1.011898, 1, 1, 1, 1, 1,
-1.490155, -1.384689, -1.356458, 0, 0, 1, 1, 1,
-1.489667, -1.83494, -3.026295, 1, 0, 0, 1, 1,
-1.487636, -0.947167, -0.5918687, 1, 0, 0, 1, 1,
-1.4725, 0.641331, -1.580009, 1, 0, 0, 1, 1,
-1.458972, -0.2937964, -0.9123588, 1, 0, 0, 1, 1,
-1.450089, 0.05526783, -2.277921, 1, 0, 0, 1, 1,
-1.445826, 0.2218211, -1.231887, 0, 0, 0, 1, 1,
-1.437711, 0.754398, -1.004224, 0, 0, 0, 1, 1,
-1.429211, -0.4978961, -0.9317085, 0, 0, 0, 1, 1,
-1.421285, -0.05295416, -2.885013, 0, 0, 0, 1, 1,
-1.416473, 0.1219528, -1.25983, 0, 0, 0, 1, 1,
-1.409854, -0.6677862, -2.642213, 0, 0, 0, 1, 1,
-1.408365, -0.2734128, -2.781465, 0, 0, 0, 1, 1,
-1.408063, 0.4274098, -0.08811313, 1, 1, 1, 1, 1,
-1.406946, -0.4047447, -2.783749, 1, 1, 1, 1, 1,
-1.399536, 0.3984223, -0.6245762, 1, 1, 1, 1, 1,
-1.38865, -0.2686339, -1.820149, 1, 1, 1, 1, 1,
-1.375347, 0.3847685, -1.873905, 1, 1, 1, 1, 1,
-1.360745, 0.4937502, -2.462126, 1, 1, 1, 1, 1,
-1.360684, -0.0089336, -2.824109, 1, 1, 1, 1, 1,
-1.350223, -0.5278884, -3.403953, 1, 1, 1, 1, 1,
-1.336307, 1.857458, -1.33695, 1, 1, 1, 1, 1,
-1.328114, 0.3300843, -1.587756, 1, 1, 1, 1, 1,
-1.325429, -0.7937872, -3.525529, 1, 1, 1, 1, 1,
-1.319294, -0.9852065, -2.198987, 1, 1, 1, 1, 1,
-1.318734, -2.219728, -3.814906, 1, 1, 1, 1, 1,
-1.310838, -0.8259345, -1.599703, 1, 1, 1, 1, 1,
-1.310589, -0.05453753, 0.5679005, 1, 1, 1, 1, 1,
-1.304607, -0.8542172, -0.073457, 0, 0, 1, 1, 1,
-1.303402, 0.5643012, -1.287011, 1, 0, 0, 1, 1,
-1.302233, 1.618504, -0.8884314, 1, 0, 0, 1, 1,
-1.29589, -0.6280037, -3.415948, 1, 0, 0, 1, 1,
-1.294213, 1.269365, -0.2933241, 1, 0, 0, 1, 1,
-1.280648, 0.8674927, -3.173143, 1, 0, 0, 1, 1,
-1.278672, 0.5190002, -2.404141, 0, 0, 0, 1, 1,
-1.273076, -0.2009091, 0.7388678, 0, 0, 0, 1, 1,
-1.258397, -2.741208, -3.765909, 0, 0, 0, 1, 1,
-1.246958, -0.09885745, -0.4423702, 0, 0, 0, 1, 1,
-1.243042, 1.143516, -1.366726, 0, 0, 0, 1, 1,
-1.239218, -0.4291372, -1.70762, 0, 0, 0, 1, 1,
-1.236762, 0.6659617, -1.42489, 0, 0, 0, 1, 1,
-1.236067, -1.783293, -1.879916, 1, 1, 1, 1, 1,
-1.23336, -0.470606, -1.008058, 1, 1, 1, 1, 1,
-1.225395, -0.8670723, -1.302534, 1, 1, 1, 1, 1,
-1.215635, 0.02313131, -2.143889, 1, 1, 1, 1, 1,
-1.20613, 1.642542, -1.154636, 1, 1, 1, 1, 1,
-1.205374, 0.3670142, 0.2006576, 1, 1, 1, 1, 1,
-1.1996, -0.9279391, -1.956776, 1, 1, 1, 1, 1,
-1.190473, 1.446732, 0.06509905, 1, 1, 1, 1, 1,
-1.177762, 1.549524, -0.2676722, 1, 1, 1, 1, 1,
-1.177629, 0.7636966, -2.479025, 1, 1, 1, 1, 1,
-1.168798, -1.161124, -0.6536075, 1, 1, 1, 1, 1,
-1.16739, -0.574544, -0.8810247, 1, 1, 1, 1, 1,
-1.167074, 0.1045872, -0.02281289, 1, 1, 1, 1, 1,
-1.162828, -0.3598651, -0.8968989, 1, 1, 1, 1, 1,
-1.144348, 0.3360806, -1.836117, 1, 1, 1, 1, 1,
-1.140019, -2.237735, -3.34076, 0, 0, 1, 1, 1,
-1.123842, 1.243458, -0.8931236, 1, 0, 0, 1, 1,
-1.121727, 0.07672316, -1.311539, 1, 0, 0, 1, 1,
-1.121217, 1.141855, -0.2858024, 1, 0, 0, 1, 1,
-1.119133, 0.5380133, -1.173349, 1, 0, 0, 1, 1,
-1.111288, -1.037891, -1.791531, 1, 0, 0, 1, 1,
-1.106248, -0.759832, -1.085648, 0, 0, 0, 1, 1,
-1.097578, 0.7086585, 0.1774627, 0, 0, 0, 1, 1,
-1.097116, 0.5409464, -0.1252144, 0, 0, 0, 1, 1,
-1.094117, -0.5644731, -1.89371, 0, 0, 0, 1, 1,
-1.088603, -0.9230328, -2.326948, 0, 0, 0, 1, 1,
-1.087567, -1.068197, -3.928621, 0, 0, 0, 1, 1,
-1.086868, 1.214419, -1.999334, 0, 0, 0, 1, 1,
-1.081912, 2.702148, -0.5149459, 1, 1, 1, 1, 1,
-1.067994, 1.499617, -0.6582361, 1, 1, 1, 1, 1,
-1.067238, 0.1803029, -2.298228, 1, 1, 1, 1, 1,
-1.066284, 1.809629, 1.037777, 1, 1, 1, 1, 1,
-1.060226, 0.346516, -3.070461, 1, 1, 1, 1, 1,
-1.058777, -1.607303, -3.663465, 1, 1, 1, 1, 1,
-1.058643, 0.6370868, -1.626778, 1, 1, 1, 1, 1,
-1.053513, -1.842718, -4.188743, 1, 1, 1, 1, 1,
-1.048559, 2.691133, -2.067767, 1, 1, 1, 1, 1,
-1.046827, 1.730332, -0.1572893, 1, 1, 1, 1, 1,
-1.04537, 0.148863, -2.171591, 1, 1, 1, 1, 1,
-1.04021, 0.1055085, -2.844649, 1, 1, 1, 1, 1,
-1.037769, -0.2856102, -0.4300097, 1, 1, 1, 1, 1,
-1.037307, -1.126534, -2.510503, 1, 1, 1, 1, 1,
-1.03596, 2.293959, -0.6575657, 1, 1, 1, 1, 1,
-1.034602, 2.338133, -0.4742807, 0, 0, 1, 1, 1,
-1.033491, 1.356967, -0.02730626, 1, 0, 0, 1, 1,
-1.026178, 1.191635, 1.094915, 1, 0, 0, 1, 1,
-1.003675, -0.7981383, -2.893391, 1, 0, 0, 1, 1,
-0.998542, -0.5051718, -0.9068306, 1, 0, 0, 1, 1,
-0.9980616, 0.3793422, -1.618827, 1, 0, 0, 1, 1,
-0.9973722, 0.4912231, -2.238729, 0, 0, 0, 1, 1,
-0.9912271, 0.1314251, -3.20306, 0, 0, 0, 1, 1,
-0.9904653, -0.5529559, -1.907136, 0, 0, 0, 1, 1,
-0.9887588, -2.756987, -1.753769, 0, 0, 0, 1, 1,
-0.9818928, 0.2463984, -0.7891428, 0, 0, 0, 1, 1,
-0.9767637, -0.8200477, -1.729131, 0, 0, 0, 1, 1,
-0.9607062, 0.378393, -1.563786, 0, 0, 0, 1, 1,
-0.9531539, -0.4032282, -1.963734, 1, 1, 1, 1, 1,
-0.9473503, -1.186854, -2.726091, 1, 1, 1, 1, 1,
-0.9456448, -1.719887, -3.320897, 1, 1, 1, 1, 1,
-0.9413596, -0.3758988, -1.440015, 1, 1, 1, 1, 1,
-0.9395831, 0.0879842, -1.878692, 1, 1, 1, 1, 1,
-0.9371403, 1.657521, 0.2437874, 1, 1, 1, 1, 1,
-0.9370726, -0.839048, -1.139122, 1, 1, 1, 1, 1,
-0.9303642, 0.3868429, 1.147569, 1, 1, 1, 1, 1,
-0.9203712, 0.7546455, -1.073031, 1, 1, 1, 1, 1,
-0.909777, 2.037759, -0.2405327, 1, 1, 1, 1, 1,
-0.9062296, 1.425524, 0.5476193, 1, 1, 1, 1, 1,
-0.9025542, -0.5930378, -2.524784, 1, 1, 1, 1, 1,
-0.9013097, 0.05311158, -0.2632226, 1, 1, 1, 1, 1,
-0.9010144, -0.6728497, -1.309394, 1, 1, 1, 1, 1,
-0.8977007, -1.961724, -2.0023, 1, 1, 1, 1, 1,
-0.8961126, -0.7850457, -2.435299, 0, 0, 1, 1, 1,
-0.8960986, 0.4916246, -1.024065, 1, 0, 0, 1, 1,
-0.8870533, 0.0071056, -0.05650505, 1, 0, 0, 1, 1,
-0.8829585, 0.9463107, -0.5882562, 1, 0, 0, 1, 1,
-0.8810012, 1.192568, -0.9166026, 1, 0, 0, 1, 1,
-0.8786673, -0.9089566, -1.69988, 1, 0, 0, 1, 1,
-0.8785395, 0.1071637, -2.322509, 0, 0, 0, 1, 1,
-0.8686274, -0.13497, -1.362871, 0, 0, 0, 1, 1,
-0.8674315, -1.622343, -3.285269, 0, 0, 0, 1, 1,
-0.8656334, -0.3605939, -3.195585, 0, 0, 0, 1, 1,
-0.8643653, -0.07738619, -2.676766, 0, 0, 0, 1, 1,
-0.8601092, 0.641298, -0.2327346, 0, 0, 0, 1, 1,
-0.8598377, 1.557316, -2.12794, 0, 0, 0, 1, 1,
-0.8598212, 1.001236, 1.267766, 1, 1, 1, 1, 1,
-0.8552716, 0.3366436, -0.6348312, 1, 1, 1, 1, 1,
-0.8543975, 1.278335, -1.656104, 1, 1, 1, 1, 1,
-0.8534324, -0.5733133, -3.662852, 1, 1, 1, 1, 1,
-0.8515229, 1.522175, -2.625028, 1, 1, 1, 1, 1,
-0.848502, 1.503077, -0.05936894, 1, 1, 1, 1, 1,
-0.8468093, 0.9283355, -1.443887, 1, 1, 1, 1, 1,
-0.843738, -1.357272, -3.121406, 1, 1, 1, 1, 1,
-0.8414924, -0.4538856, -1.185053, 1, 1, 1, 1, 1,
-0.835494, 1.477315, 1.257962, 1, 1, 1, 1, 1,
-0.8347089, -0.9488254, -3.17331, 1, 1, 1, 1, 1,
-0.8322557, 0.6066673, -1.934402, 1, 1, 1, 1, 1,
-0.8303244, -0.9173208, -2.901024, 1, 1, 1, 1, 1,
-0.8216089, 1.0401, 1.651151, 1, 1, 1, 1, 1,
-0.8188355, 0.6491195, -1.232621, 1, 1, 1, 1, 1,
-0.8186924, -0.6771209, -4.27165, 0, 0, 1, 1, 1,
-0.8036352, 0.02503837, -1.520169, 1, 0, 0, 1, 1,
-0.8026149, 0.6516147, -1.019181, 1, 0, 0, 1, 1,
-0.8024616, 0.7775676, -0.5885792, 1, 0, 0, 1, 1,
-0.7938836, -0.1943786, -1.542359, 1, 0, 0, 1, 1,
-0.7925881, -0.4443138, -1.646697, 1, 0, 0, 1, 1,
-0.7841076, -1.697536, -1.925107, 0, 0, 0, 1, 1,
-0.7809543, -0.429074, -2.374395, 0, 0, 0, 1, 1,
-0.773579, -0.6375543, -4.098064, 0, 0, 0, 1, 1,
-0.7697573, -0.4314559, 0.2615358, 0, 0, 0, 1, 1,
-0.7650946, 0.3256943, -1.119696, 0, 0, 0, 1, 1,
-0.7613084, -0.9902324, -2.624568, 0, 0, 0, 1, 1,
-0.7576945, 1.223491, -2.340275, 0, 0, 0, 1, 1,
-0.757582, 0.408455, -1.502652, 1, 1, 1, 1, 1,
-0.7556441, -0.2445436, -2.92298, 1, 1, 1, 1, 1,
-0.7478436, 0.7663046, -0.4597216, 1, 1, 1, 1, 1,
-0.7449085, -0.6611522, -3.267115, 1, 1, 1, 1, 1,
-0.7443518, -0.9411271, -1.232153, 1, 1, 1, 1, 1,
-0.7422191, 0.3665063, -1.872287, 1, 1, 1, 1, 1,
-0.7320113, 0.4361383, -0.2695473, 1, 1, 1, 1, 1,
-0.725017, 0.1346491, -2.80254, 1, 1, 1, 1, 1,
-0.7244998, -0.1023837, -1.40851, 1, 1, 1, 1, 1,
-0.7234516, 0.4932554, -1.088282, 1, 1, 1, 1, 1,
-0.7227416, 0.9343982, -0.677046, 1, 1, 1, 1, 1,
-0.7208958, -1.112292, -1.698256, 1, 1, 1, 1, 1,
-0.7166312, -0.3909531, -0.9697503, 1, 1, 1, 1, 1,
-0.7126018, -1.01537, -2.93117, 1, 1, 1, 1, 1,
-0.7122873, 0.3960963, -2.974618, 1, 1, 1, 1, 1,
-0.7110926, 0.2086984, -0.9746224, 0, 0, 1, 1, 1,
-0.710859, 0.9638346, -0.7546954, 1, 0, 0, 1, 1,
-0.7031779, 0.4055495, -0.9642556, 1, 0, 0, 1, 1,
-0.699295, 1.615218, -1.458708, 1, 0, 0, 1, 1,
-0.6976702, -0.1940203, -2.255697, 1, 0, 0, 1, 1,
-0.6935273, 0.8795154, 0.05428638, 1, 0, 0, 1, 1,
-0.6908816, 0.4336977, 1.401466, 0, 0, 0, 1, 1,
-0.6850318, 1.509777, -1.408662, 0, 0, 0, 1, 1,
-0.6769456, 0.4314318, -0.4729063, 0, 0, 0, 1, 1,
-0.6759771, 1.146465, -1.088392, 0, 0, 0, 1, 1,
-0.672308, 1.05128, -0.5399704, 0, 0, 0, 1, 1,
-0.6701197, 0.09467181, -1.987236, 0, 0, 0, 1, 1,
-0.6673543, 0.6863403, -0.2295438, 0, 0, 0, 1, 1,
-0.6631962, -0.1916193, -0.0282037, 1, 1, 1, 1, 1,
-0.663073, 0.3653638, -1.377158, 1, 1, 1, 1, 1,
-0.6601475, -0.1463683, -0.05173716, 1, 1, 1, 1, 1,
-0.65405, -1.05228, -2.021932, 1, 1, 1, 1, 1,
-0.651767, -2.426713, -1.743651, 1, 1, 1, 1, 1,
-0.6501307, -0.01576492, -0.7935137, 1, 1, 1, 1, 1,
-0.6495058, 0.5810471, -0.07111184, 1, 1, 1, 1, 1,
-0.6476093, 0.1951761, -2.736115, 1, 1, 1, 1, 1,
-0.6455851, -1.739521, -2.576505, 1, 1, 1, 1, 1,
-0.6451136, 1.240695, 0.6730976, 1, 1, 1, 1, 1,
-0.6432739, -1.15791, -1.983646, 1, 1, 1, 1, 1,
-0.642472, 1.540082, -1.788228, 1, 1, 1, 1, 1,
-0.6393449, 0.7110636, 0.2133972, 1, 1, 1, 1, 1,
-0.6387095, 1.486682, -0.081448, 1, 1, 1, 1, 1,
-0.6374599, 1.348884, 0.121562, 1, 1, 1, 1, 1,
-0.6353468, 0.2693338, -0.7185464, 0, 0, 1, 1, 1,
-0.634301, -0.2680149, -0.97434, 1, 0, 0, 1, 1,
-0.6274051, 0.06386893, -3.069076, 1, 0, 0, 1, 1,
-0.6257686, -0.1314703, -2.920616, 1, 0, 0, 1, 1,
-0.6257267, -1.294864, -1.576664, 1, 0, 0, 1, 1,
-0.623885, -0.05429912, -2.091242, 1, 0, 0, 1, 1,
-0.6238797, 1.231238, 1.19197, 0, 0, 0, 1, 1,
-0.6227771, -0.1883187, -0.9436083, 0, 0, 0, 1, 1,
-0.6221214, 1.285553, -0.1124089, 0, 0, 0, 1, 1,
-0.6212364, 0.4562826, 1.458285, 0, 0, 0, 1, 1,
-0.6105414, 0.6366622, -2.51011, 0, 0, 0, 1, 1,
-0.6060849, 2.369152, -1.364099, 0, 0, 0, 1, 1,
-0.5982937, 1.169204, 0.3078705, 0, 0, 0, 1, 1,
-0.5969994, 1.038732, -1.346106, 1, 1, 1, 1, 1,
-0.5943058, 0.2388048, -0.8730081, 1, 1, 1, 1, 1,
-0.5941007, -2.265998, -1.98684, 1, 1, 1, 1, 1,
-0.5869143, -1.200918, -2.021043, 1, 1, 1, 1, 1,
-0.5837878, 0.2923544, -0.4097292, 1, 1, 1, 1, 1,
-0.5832474, -0.6601851, -3.376099, 1, 1, 1, 1, 1,
-0.5828087, 0.8579568, -1.085719, 1, 1, 1, 1, 1,
-0.5741773, -0.4243237, -2.481905, 1, 1, 1, 1, 1,
-0.5736696, -0.8902531, -2.049634, 1, 1, 1, 1, 1,
-0.5718217, 1.23213, -0.09779918, 1, 1, 1, 1, 1,
-0.5706914, 1.379424, -1.89742, 1, 1, 1, 1, 1,
-0.5690154, -1.149469, -3.358095, 1, 1, 1, 1, 1,
-0.5689882, 1.93128, -1.4752, 1, 1, 1, 1, 1,
-0.5656192, -0.8675034, -3.961762, 1, 1, 1, 1, 1,
-0.5656149, -1.346022, -2.643683, 1, 1, 1, 1, 1,
-0.5590369, -1.056263, -2.872847, 0, 0, 1, 1, 1,
-0.5511109, 1.391585, 0.2141901, 1, 0, 0, 1, 1,
-0.5475073, 0.1799936, -0.6805711, 1, 0, 0, 1, 1,
-0.546046, 0.4501332, -1.010719, 1, 0, 0, 1, 1,
-0.5443746, 1.462457, -0.1081129, 1, 0, 0, 1, 1,
-0.5417622, -1.092175, -1.05978, 1, 0, 0, 1, 1,
-0.5413786, 0.4149042, -1.013335, 0, 0, 0, 1, 1,
-0.5383546, 2.27811, -1.549015, 0, 0, 0, 1, 1,
-0.5358534, -0.6357887, -3.394921, 0, 0, 0, 1, 1,
-0.5354432, -0.8303868, -3.265994, 0, 0, 0, 1, 1,
-0.5351116, 0.4114963, -0.1223134, 0, 0, 0, 1, 1,
-0.5329327, -1.316528, -3.006907, 0, 0, 0, 1, 1,
-0.5300652, 1.059327, -2.329791, 0, 0, 0, 1, 1,
-0.5288885, 1.100735, -0.1139341, 1, 1, 1, 1, 1,
-0.5266167, -0.738645, -2.900709, 1, 1, 1, 1, 1,
-0.5229183, 0.2054044, -0.415804, 1, 1, 1, 1, 1,
-0.5167406, -0.8609602, -3.068527, 1, 1, 1, 1, 1,
-0.5166778, -0.1197271, -3.07034, 1, 1, 1, 1, 1,
-0.5160664, -1.697593, -2.782424, 1, 1, 1, 1, 1,
-0.5147121, -1.163358, -1.946385, 1, 1, 1, 1, 1,
-0.5143963, -0.6710104, -1.436588, 1, 1, 1, 1, 1,
-0.5134411, 0.01846197, 0.7453696, 1, 1, 1, 1, 1,
-0.5119517, 0.8920707, -0.8746238, 1, 1, 1, 1, 1,
-0.5070464, -1.381099, -1.552224, 1, 1, 1, 1, 1,
-0.5034189, -0.5385342, -4.402443, 1, 1, 1, 1, 1,
-0.5007483, -0.1273753, -0.5012323, 1, 1, 1, 1, 1,
-0.4991195, -0.3688927, -2.82496, 1, 1, 1, 1, 1,
-0.4975889, 1.155427, -0.6818998, 1, 1, 1, 1, 1,
-0.4961066, -1.204866, -1.674063, 0, 0, 1, 1, 1,
-0.494734, -0.5752672, -2.862154, 1, 0, 0, 1, 1,
-0.4938892, 0.3399018, -1.41094, 1, 0, 0, 1, 1,
-0.4909593, 0.1934899, -0.4056558, 1, 0, 0, 1, 1,
-0.4887164, -1.191716, -3.886837, 1, 0, 0, 1, 1,
-0.4885599, 3.067641, -2.725601, 1, 0, 0, 1, 1,
-0.482823, 0.113603, -1.642024, 0, 0, 0, 1, 1,
-0.4823807, -0.09570602, -0.4118787, 0, 0, 0, 1, 1,
-0.481279, 0.5030408, 0.9043735, 0, 0, 0, 1, 1,
-0.4810616, -0.8121908, -1.826639, 0, 0, 0, 1, 1,
-0.4792614, 0.173949, 0.7506453, 0, 0, 0, 1, 1,
-0.479095, 1.278397, 0.2215259, 0, 0, 0, 1, 1,
-0.4788672, 2.13066, -1.432384, 0, 0, 0, 1, 1,
-0.4765133, -0.1859054, -0.8836617, 1, 1, 1, 1, 1,
-0.4753258, 0.6896252, -0.8140393, 1, 1, 1, 1, 1,
-0.4750913, -0.08850021, -2.142984, 1, 1, 1, 1, 1,
-0.4728782, 0.7827104, -0.06573262, 1, 1, 1, 1, 1,
-0.4657151, -0.6795245, -1.762003, 1, 1, 1, 1, 1,
-0.4637782, -1.818371, -3.701355, 1, 1, 1, 1, 1,
-0.4634747, -1.06734, -1.988682, 1, 1, 1, 1, 1,
-0.4628456, -0.4602331, -3.333761, 1, 1, 1, 1, 1,
-0.4546488, -0.4198148, -3.291434, 1, 1, 1, 1, 1,
-0.4544785, -0.5908504, -3.28471, 1, 1, 1, 1, 1,
-0.443208, -1.359168, -1.085865, 1, 1, 1, 1, 1,
-0.440689, 1.004211, -0.9654266, 1, 1, 1, 1, 1,
-0.4393145, -1.29953, -2.641596, 1, 1, 1, 1, 1,
-0.4261787, 0.3973395, -1.812855, 1, 1, 1, 1, 1,
-0.4236343, -0.4438834, -1.788962, 1, 1, 1, 1, 1,
-0.4193053, -0.9456891, -3.339038, 0, 0, 1, 1, 1,
-0.4176419, 0.8536664, 0.0915105, 1, 0, 0, 1, 1,
-0.4145813, 0.1277559, -1.987855, 1, 0, 0, 1, 1,
-0.4131206, -1.298476, -3.246256, 1, 0, 0, 1, 1,
-0.4105741, 0.5868256, 0.1527044, 1, 0, 0, 1, 1,
-0.4095525, -0.4134873, -2.312136, 1, 0, 0, 1, 1,
-0.4093838, -0.2033697, -2.86277, 0, 0, 0, 1, 1,
-0.4083401, -2.091637, -3.853839, 0, 0, 0, 1, 1,
-0.4025106, -0.001676629, -1.125928, 0, 0, 0, 1, 1,
-0.400824, 0.2931127, -2.374552, 0, 0, 0, 1, 1,
-0.3965326, 0.2637919, 0.4628007, 0, 0, 0, 1, 1,
-0.3957892, 0.2877906, -0.6283237, 0, 0, 0, 1, 1,
-0.3870712, 1.537076, 0.2719888, 0, 0, 0, 1, 1,
-0.3836465, 0.1003276, -0.6672845, 1, 1, 1, 1, 1,
-0.3822995, -1.78307, -1.770374, 1, 1, 1, 1, 1,
-0.3809246, 0.8488164, -1.201519, 1, 1, 1, 1, 1,
-0.3734123, -1.202417, -1.300503, 1, 1, 1, 1, 1,
-0.3693533, -0.6035496, -2.173838, 1, 1, 1, 1, 1,
-0.3665092, -0.370404, -3.085175, 1, 1, 1, 1, 1,
-0.3616135, -0.9467565, -3.848078, 1, 1, 1, 1, 1,
-0.3598897, -1.707085, -2.064775, 1, 1, 1, 1, 1,
-0.3586823, 1.827582, -2.150397, 1, 1, 1, 1, 1,
-0.3555227, -0.9366213, -1.883991, 1, 1, 1, 1, 1,
-0.3451664, -1.949154, -3.571225, 1, 1, 1, 1, 1,
-0.3429862, -1.272688, -2.026247, 1, 1, 1, 1, 1,
-0.3415901, 0.3255429, -2.539695, 1, 1, 1, 1, 1,
-0.3392043, 0.4143252, 1.129375, 1, 1, 1, 1, 1,
-0.3391876, 0.6444279, 0.5048756, 1, 1, 1, 1, 1,
-0.3377047, 0.4589019, 1.060922, 0, 0, 1, 1, 1,
-0.3340679, -0.5975595, -2.617332, 1, 0, 0, 1, 1,
-0.3337662, 0.3982781, -0.2125723, 1, 0, 0, 1, 1,
-0.3314702, 1.150105, -0.929343, 1, 0, 0, 1, 1,
-0.3272888, -0.5974893, -0.9807289, 1, 0, 0, 1, 1,
-0.3266451, -0.6705518, -1.733827, 1, 0, 0, 1, 1,
-0.3245399, -1.918208, -3.840426, 0, 0, 0, 1, 1,
-0.3199534, 0.5692838, 0.03971794, 0, 0, 0, 1, 1,
-0.3185464, -0.2987947, -4.164757, 0, 0, 0, 1, 1,
-0.3148237, -0.05146156, -1.374029, 0, 0, 0, 1, 1,
-0.314527, -0.3684988, -2.341034, 0, 0, 0, 1, 1,
-0.3080554, 0.1554767, -1.16196, 0, 0, 0, 1, 1,
-0.3067654, -0.430981, -1.085976, 0, 0, 0, 1, 1,
-0.3008624, 0.3055258, -0.2162655, 1, 1, 1, 1, 1,
-0.2926004, 0.191151, -1.540452, 1, 1, 1, 1, 1,
-0.2923566, -0.9185317, -3.348659, 1, 1, 1, 1, 1,
-0.2898697, 0.3919115, -0.4870218, 1, 1, 1, 1, 1,
-0.2897442, -0.7350582, -0.9925479, 1, 1, 1, 1, 1,
-0.2892547, 0.1598971, -1.578414, 1, 1, 1, 1, 1,
-0.2889983, 1.659186, 0.7238218, 1, 1, 1, 1, 1,
-0.2889893, 0.6328914, -1.09573, 1, 1, 1, 1, 1,
-0.2776915, 0.4365658, -0.3513885, 1, 1, 1, 1, 1,
-0.2772506, -1.529015, -0.8549742, 1, 1, 1, 1, 1,
-0.2771542, 0.317887, -0.1936517, 1, 1, 1, 1, 1,
-0.2769344, 1.236477, -0.7461125, 1, 1, 1, 1, 1,
-0.2743162, 0.614432, 1.345356, 1, 1, 1, 1, 1,
-0.2715125, -0.03578011, -0.8479343, 1, 1, 1, 1, 1,
-0.2710728, 0.8084749, -1.677206, 1, 1, 1, 1, 1,
-0.2682568, -1.906432, -4.695325, 0, 0, 1, 1, 1,
-0.2641872, 0.2251274, 0.3495992, 1, 0, 0, 1, 1,
-0.2598288, -0.3498437, -3.318918, 1, 0, 0, 1, 1,
-0.2559718, 0.6874319, -1.9223, 1, 0, 0, 1, 1,
-0.254059, 2.378829, 0.4104011, 1, 0, 0, 1, 1,
-0.2532526, -1.073844, -3.117754, 1, 0, 0, 1, 1,
-0.2531492, -0.3959508, -1.973999, 0, 0, 0, 1, 1,
-0.2526261, 0.6928973, -0.2337683, 0, 0, 0, 1, 1,
-0.250196, 2.196285, 0.02416368, 0, 0, 0, 1, 1,
-0.244886, 0.7459337, 0.8062513, 0, 0, 0, 1, 1,
-0.2406779, 0.7393001, -0.6499577, 0, 0, 0, 1, 1,
-0.2389835, -1.410004, -2.09197, 0, 0, 0, 1, 1,
-0.2344085, -0.6556477, -1.504831, 0, 0, 0, 1, 1,
-0.2337926, -0.5881457, -2.423946, 1, 1, 1, 1, 1,
-0.230518, 1.350642, -0.7575613, 1, 1, 1, 1, 1,
-0.2304841, -0.3029459, -1.862445, 1, 1, 1, 1, 1,
-0.229654, 2.107951, 0.1138734, 1, 1, 1, 1, 1,
-0.2282963, -0.5261482, -3.746098, 1, 1, 1, 1, 1,
-0.226495, -0.08217303, -1.117979, 1, 1, 1, 1, 1,
-0.225243, 0.2792601, -0.6338531, 1, 1, 1, 1, 1,
-0.2250168, 0.6077571, 0.3894367, 1, 1, 1, 1, 1,
-0.2242637, -0.03129154, -3.1265, 1, 1, 1, 1, 1,
-0.2139211, 0.1201176, 0.04961435, 1, 1, 1, 1, 1,
-0.20495, -0.9862937, -1.121258, 1, 1, 1, 1, 1,
-0.1982559, -0.1700781, -2.231635, 1, 1, 1, 1, 1,
-0.1975516, -0.0969905, -3.12041, 1, 1, 1, 1, 1,
-0.188335, 1.183903, -2.045438, 1, 1, 1, 1, 1,
-0.1859562, 1.503267, -0.6434708, 1, 1, 1, 1, 1,
-0.184628, 0.2508651, -0.2201672, 0, 0, 1, 1, 1,
-0.1805927, 1.171895, -1.404177, 1, 0, 0, 1, 1,
-0.1777068, -0.7513953, -3.06857, 1, 0, 0, 1, 1,
-0.1761434, -0.1879316, -2.94262, 1, 0, 0, 1, 1,
-0.1690187, 0.9078749, -0.5061708, 1, 0, 0, 1, 1,
-0.1676321, 0.8480534, 0.7283748, 1, 0, 0, 1, 1,
-0.1659012, 0.02525978, -1.060034, 0, 0, 0, 1, 1,
-0.1653129, -0.3831152, -2.802966, 0, 0, 0, 1, 1,
-0.1600943, -1.710009, -3.058101, 0, 0, 0, 1, 1,
-0.1590242, -1.208893, -1.63747, 0, 0, 0, 1, 1,
-0.1545962, -0.07724677, -2.632155, 0, 0, 0, 1, 1,
-0.1529846, 0.5252464, -0.7500684, 0, 0, 0, 1, 1,
-0.1467682, 0.803969, -0.09714311, 0, 0, 0, 1, 1,
-0.1408262, -0.4005634, -3.834, 1, 1, 1, 1, 1,
-0.1367027, -1.313495, -3.838592, 1, 1, 1, 1, 1,
-0.1359296, -1.275289, -1.973757, 1, 1, 1, 1, 1,
-0.1350155, 1.062725, -1.10544, 1, 1, 1, 1, 1,
-0.1340343, -2.26899, -4.278667, 1, 1, 1, 1, 1,
-0.1322344, -0.1272014, -3.279607, 1, 1, 1, 1, 1,
-0.1310695, -1.668429, -4.921865, 1, 1, 1, 1, 1,
-0.1295967, -1.460048, -3.795205, 1, 1, 1, 1, 1,
-0.1276755, -0.3905956, -3.188657, 1, 1, 1, 1, 1,
-0.1244108, -0.8913347, -1.675415, 1, 1, 1, 1, 1,
-0.1233197, -0.6850662, -2.870418, 1, 1, 1, 1, 1,
-0.1200452, -1.573392, -2.670421, 1, 1, 1, 1, 1,
-0.1189309, -1.172284, -1.202169, 1, 1, 1, 1, 1,
-0.1170163, 0.96662, 0.3687328, 1, 1, 1, 1, 1,
-0.1167322, -1.474174, -2.217402, 1, 1, 1, 1, 1,
-0.1159864, -1.307954, -2.958216, 0, 0, 1, 1, 1,
-0.114429, -0.9073656, -3.242862, 1, 0, 0, 1, 1,
-0.1104332, 1.429785, -0.7183108, 1, 0, 0, 1, 1,
-0.109498, 0.04950738, -0.1463248, 1, 0, 0, 1, 1,
-0.1063618, 1.475726, -0.4032612, 1, 0, 0, 1, 1,
-0.1031989, -0.293937, -2.486405, 1, 0, 0, 1, 1,
-0.1017406, -0.2593949, -4.401933, 0, 0, 0, 1, 1,
-0.1008253, -0.04442288, -1.848328, 0, 0, 0, 1, 1,
-0.09717547, -1.381417, -0.344775, 0, 0, 0, 1, 1,
-0.096335, 0.7020765, 0.5831861, 0, 0, 0, 1, 1,
-0.09581438, 1.178074, 1.071118, 0, 0, 0, 1, 1,
-0.09448465, -0.4966031, -2.773072, 0, 0, 0, 1, 1,
-0.09143348, -1.142798, -2.642457, 0, 0, 0, 1, 1,
-0.08016998, 0.1236863, -1.162732, 1, 1, 1, 1, 1,
-0.0758752, -2.035169, -2.814443, 1, 1, 1, 1, 1,
-0.07133546, -0.08120461, -2.499809, 1, 1, 1, 1, 1,
-0.07089999, -0.7586205, -2.151144, 1, 1, 1, 1, 1,
-0.0649705, -1.719817, -2.328825, 1, 1, 1, 1, 1,
-0.064312, -1.867682, -3.681212, 1, 1, 1, 1, 1,
-0.06352319, 0.3879521, 1.201808, 1, 1, 1, 1, 1,
-0.06129549, 1.438189, -0.4525197, 1, 1, 1, 1, 1,
-0.05967661, 1.010177, -0.3729527, 1, 1, 1, 1, 1,
-0.05876646, 0.1214699, 0.5372493, 1, 1, 1, 1, 1,
-0.05865647, -0.6488313, -4.864515, 1, 1, 1, 1, 1,
-0.05583565, 0.5118776, 0.3192651, 1, 1, 1, 1, 1,
-0.05531782, -1.703257, -3.222911, 1, 1, 1, 1, 1,
-0.05379032, -0.2920792, -2.924355, 1, 1, 1, 1, 1,
-0.04828769, -1.138831, -3.66438, 1, 1, 1, 1, 1,
-0.04826311, -0.5116412, -1.992501, 0, 0, 1, 1, 1,
-0.04432489, 2.029236, -0.2391096, 1, 0, 0, 1, 1,
-0.04378444, -0.5199034, -3.098399, 1, 0, 0, 1, 1,
-0.04084382, -0.7088157, -4.467532, 1, 0, 0, 1, 1,
-0.04070466, 0.002866479, -1.11303, 1, 0, 0, 1, 1,
-0.03558603, 0.9428685, -0.6435617, 1, 0, 0, 1, 1,
-0.03437742, 0.8259392, -0.5497259, 0, 0, 0, 1, 1,
-0.02625343, 1.123514, -1.310246, 0, 0, 0, 1, 1,
-0.02440832, -0.4839942, -3.99083, 0, 0, 0, 1, 1,
-0.01736059, 0.4421825, -1.292458, 0, 0, 0, 1, 1,
-0.01654574, 0.5141106, -1.173969, 0, 0, 0, 1, 1,
-0.01637713, -1.345242, -1.778011, 0, 0, 0, 1, 1,
-0.0163332, -1.423476, -4.406773, 0, 0, 0, 1, 1,
-0.0144234, -0.7454562, -4.659406, 1, 1, 1, 1, 1,
-0.009744699, -0.1177577, -2.910257, 1, 1, 1, 1, 1,
-0.007584174, 1.937298, 0.1746809, 1, 1, 1, 1, 1,
-0.005616617, 0.2034558, 2.466985, 1, 1, 1, 1, 1,
-0.0006795427, -0.7523935, -4.40379, 1, 1, 1, 1, 1,
0.002122615, -1.302315, 2.540465, 1, 1, 1, 1, 1,
0.003922571, -0.4679833, 2.817888, 1, 1, 1, 1, 1,
0.005335837, -0.7739257, 4.555299, 1, 1, 1, 1, 1,
0.009041206, 0.4352127, -0.4669437, 1, 1, 1, 1, 1,
0.01223559, -0.1037662, 3.556341, 1, 1, 1, 1, 1,
0.01327859, 1.296926, -1.650016, 1, 1, 1, 1, 1,
0.01431172, 0.5890835, -1.229884, 1, 1, 1, 1, 1,
0.01670998, -2.763962, 4.106232, 1, 1, 1, 1, 1,
0.01820443, -0.9820447, 4.463057, 1, 1, 1, 1, 1,
0.01973663, 0.6317608, 2.029901, 1, 1, 1, 1, 1,
0.02166571, -0.310436, 3.521338, 0, 0, 1, 1, 1,
0.02309733, 0.785144, -2.583092, 1, 0, 0, 1, 1,
0.02415292, 0.7781851, 0.5711535, 1, 0, 0, 1, 1,
0.02572187, -0.08890644, 3.861041, 1, 0, 0, 1, 1,
0.03061515, -0.3751358, 2.380063, 1, 0, 0, 1, 1,
0.03129239, 0.644682, -0.669873, 1, 0, 0, 1, 1,
0.03358952, 1.202896, 1.090598, 0, 0, 0, 1, 1,
0.03516965, 2.1521, -0.8464235, 0, 0, 0, 1, 1,
0.03899219, 0.9288397, 0.7939695, 0, 0, 0, 1, 1,
0.04331441, -0.4384792, 1.933467, 0, 0, 0, 1, 1,
0.04481429, 0.4620437, 1.132731, 0, 0, 0, 1, 1,
0.04594965, -0.3672521, 2.778082, 0, 0, 0, 1, 1,
0.05112788, 0.4666293, -0.1398306, 0, 0, 0, 1, 1,
0.05893001, 0.07709684, -2.609278, 1, 1, 1, 1, 1,
0.06193998, 2.422888, -0.1900646, 1, 1, 1, 1, 1,
0.0621368, 1.227832, 1.045396, 1, 1, 1, 1, 1,
0.06284081, 1.054392, -1.131923, 1, 1, 1, 1, 1,
0.063074, -0.7859033, 3.982165, 1, 1, 1, 1, 1,
0.06577405, -1.02998, 4.473748, 1, 1, 1, 1, 1,
0.06922047, -0.00411536, 1.196855, 1, 1, 1, 1, 1,
0.07759535, -0.7562352, 1.810232, 1, 1, 1, 1, 1,
0.07825201, 0.2180561, -0.4626444, 1, 1, 1, 1, 1,
0.078702, -0.985515, 2.768876, 1, 1, 1, 1, 1,
0.0829981, 0.3862875, 0.524486, 1, 1, 1, 1, 1,
0.08846656, 0.6486499, -0.6126056, 1, 1, 1, 1, 1,
0.09113876, 0.8873791, -0.4652857, 1, 1, 1, 1, 1,
0.09292389, -1.480496, 2.548082, 1, 1, 1, 1, 1,
0.09489942, -0.2876021, 3.186492, 1, 1, 1, 1, 1,
0.09613251, -0.3873367, 1.334224, 0, 0, 1, 1, 1,
0.0973561, 0.558716, -0.06445477, 1, 0, 0, 1, 1,
0.09928798, -0.4774405, 1.381943, 1, 0, 0, 1, 1,
0.1021192, 0.1841478, -0.01424159, 1, 0, 0, 1, 1,
0.1091898, -0.6627987, 4.11219, 1, 0, 0, 1, 1,
0.1100369, -0.683202, 1.576371, 1, 0, 0, 1, 1,
0.115333, -0.4076063, 2.134601, 0, 0, 0, 1, 1,
0.1155707, 0.4560788, -0.3913288, 0, 0, 0, 1, 1,
0.1197058, 0.1736655, 1.120903, 0, 0, 0, 1, 1,
0.1199959, -0.09444059, 2.216481, 0, 0, 0, 1, 1,
0.1204698, 0.9800431, -0.493499, 0, 0, 0, 1, 1,
0.1233265, 0.2462257, -0.6654338, 0, 0, 0, 1, 1,
0.1254423, -0.04566289, 0.2833463, 0, 0, 0, 1, 1,
0.1321995, -0.7874966, 2.565918, 1, 1, 1, 1, 1,
0.1328543, 1.071928, -0.8711307, 1, 1, 1, 1, 1,
0.1447976, -1.434234, 3.3453, 1, 1, 1, 1, 1,
0.1483085, -0.01010295, 1.743421, 1, 1, 1, 1, 1,
0.148472, -0.3825211, 2.925771, 1, 1, 1, 1, 1,
0.1488736, -0.9767166, 1.927859, 1, 1, 1, 1, 1,
0.1509335, 0.5011786, 0.2540817, 1, 1, 1, 1, 1,
0.1536677, -1.576352, 3.217608, 1, 1, 1, 1, 1,
0.1592571, 0.5963268, -1.162217, 1, 1, 1, 1, 1,
0.1622782, -0.05179474, 1.04126, 1, 1, 1, 1, 1,
0.1631294, -0.4699315, 1.964934, 1, 1, 1, 1, 1,
0.1634536, -2.36683, 3.735693, 1, 1, 1, 1, 1,
0.1635309, 1.125143, -0.2082728, 1, 1, 1, 1, 1,
0.1641053, 0.5204555, 1.308233, 1, 1, 1, 1, 1,
0.1669548, 0.2819182, 0.05078097, 1, 1, 1, 1, 1,
0.1690366, 1.381356, 0.1945259, 0, 0, 1, 1, 1,
0.1721399, -1.420656, 2.551606, 1, 0, 0, 1, 1,
0.1772587, 0.1280918, -0.3432376, 1, 0, 0, 1, 1,
0.1989566, -1.884441, 4.009689, 1, 0, 0, 1, 1,
0.2009122, 0.6462038, 0.7441463, 1, 0, 0, 1, 1,
0.2020431, 0.1791712, 0.5596935, 1, 0, 0, 1, 1,
0.2021446, -0.7839425, 2.671032, 0, 0, 0, 1, 1,
0.2021704, 0.2392538, -0.1927111, 0, 0, 0, 1, 1,
0.2035067, 1.409972, 0.7596787, 0, 0, 0, 1, 1,
0.2036642, -0.4720662, 2.17877, 0, 0, 0, 1, 1,
0.2062235, -0.08132242, 3.939383, 0, 0, 0, 1, 1,
0.2075198, -1.923309, 3.966213, 0, 0, 0, 1, 1,
0.211048, -1.408886, 1.817545, 0, 0, 0, 1, 1,
0.2137672, -0.0599244, 2.736415, 1, 1, 1, 1, 1,
0.2151087, 0.9173015, 0.7969232, 1, 1, 1, 1, 1,
0.2159109, -0.9003713, 3.012707, 1, 1, 1, 1, 1,
0.2161938, -1.568679, 2.994573, 1, 1, 1, 1, 1,
0.2172072, 1.863779, -0.04994369, 1, 1, 1, 1, 1,
0.2180994, -0.5136884, 3.391053, 1, 1, 1, 1, 1,
0.2215856, -0.6527705, 2.597865, 1, 1, 1, 1, 1,
0.2257849, 1.045751, -0.2647122, 1, 1, 1, 1, 1,
0.2274299, 0.6748942, 0.3890511, 1, 1, 1, 1, 1,
0.2296873, 0.3133315, -0.3726696, 1, 1, 1, 1, 1,
0.2333953, 0.4659426, 0.436516, 1, 1, 1, 1, 1,
0.2353883, -0.5812801, 2.778344, 1, 1, 1, 1, 1,
0.2374061, 0.4775802, 1.328537, 1, 1, 1, 1, 1,
0.2391492, -1.915797, 4.113003, 1, 1, 1, 1, 1,
0.240791, 0.01269474, 1.985343, 1, 1, 1, 1, 1,
0.2453243, 0.8476113, 0.3401493, 0, 0, 1, 1, 1,
0.246056, -1.027581, 2.85515, 1, 0, 0, 1, 1,
0.2479132, 0.4106745, -0.454206, 1, 0, 0, 1, 1,
0.2559803, 0.4866133, 1.037834, 1, 0, 0, 1, 1,
0.2582544, -0.8605346, 2.318805, 1, 0, 0, 1, 1,
0.2593778, 0.1333769, -0.1488733, 1, 0, 0, 1, 1,
0.2620648, -0.436972, 0.7332581, 0, 0, 0, 1, 1,
0.2626958, 1.901951, 0.6189905, 0, 0, 0, 1, 1,
0.264015, -0.3925563, 1.828584, 0, 0, 0, 1, 1,
0.2693356, -0.5752708, 2.535176, 0, 0, 0, 1, 1,
0.269775, 0.8646355, 0.8241644, 0, 0, 0, 1, 1,
0.2698913, 0.3819685, 0.4560211, 0, 0, 0, 1, 1,
0.2709309, -0.4122299, 2.900454, 0, 0, 0, 1, 1,
0.2754516, 0.6282122, 0.3628325, 1, 1, 1, 1, 1,
0.2759127, -1.144297, 3.556063, 1, 1, 1, 1, 1,
0.2764684, 0.5923541, 1.003253, 1, 1, 1, 1, 1,
0.2821141, -1.476713, 2.158926, 1, 1, 1, 1, 1,
0.2899222, -0.8348386, 3.907536, 1, 1, 1, 1, 1,
0.2905764, -0.3733031, 1.921761, 1, 1, 1, 1, 1,
0.2992636, -0.9729633, 3.419629, 1, 1, 1, 1, 1,
0.3009304, 1.198081, 0.5094861, 1, 1, 1, 1, 1,
0.3111023, 1.119762, 0.7502549, 1, 1, 1, 1, 1,
0.3146216, 1.009888, 0.2933391, 1, 1, 1, 1, 1,
0.3174622, 0.783219, 1.678016, 1, 1, 1, 1, 1,
0.3187822, 0.8749353, -0.6924931, 1, 1, 1, 1, 1,
0.3286751, 1.590103, 1.585815, 1, 1, 1, 1, 1,
0.3318297, 0.3919665, -0.2426139, 1, 1, 1, 1, 1,
0.3354035, -0.843379, 1.900455, 1, 1, 1, 1, 1,
0.3380909, -1.479943, 3.393259, 0, 0, 1, 1, 1,
0.3382797, 0.4864646, -0.02388931, 1, 0, 0, 1, 1,
0.3403527, 0.07828365, 2.052681, 1, 0, 0, 1, 1,
0.3420618, 0.3600282, 0.8634608, 1, 0, 0, 1, 1,
0.3422903, -0.01573668, 1.394932, 1, 0, 0, 1, 1,
0.3429907, 1.683543, -0.276452, 1, 0, 0, 1, 1,
0.3438706, -0.6090376, 2.606412, 0, 0, 0, 1, 1,
0.3468485, 1.148505, -0.8260027, 0, 0, 0, 1, 1,
0.3471926, -2.265007, 2.356949, 0, 0, 0, 1, 1,
0.3477763, -0.9440908, 2.444071, 0, 0, 0, 1, 1,
0.3486053, 1.644314, -1.009713, 0, 0, 0, 1, 1,
0.3488631, -1.220325, 2.929622, 0, 0, 0, 1, 1,
0.3500496, -0.3332526, 3.124234, 0, 0, 0, 1, 1,
0.3507892, 0.3156216, 2.039353, 1, 1, 1, 1, 1,
0.3507951, -0.04396352, 2.22001, 1, 1, 1, 1, 1,
0.3522532, 0.2799875, -0.09861442, 1, 1, 1, 1, 1,
0.355058, -1.098211, 2.240106, 1, 1, 1, 1, 1,
0.3636073, -0.543672, 3.00985, 1, 1, 1, 1, 1,
0.3673656, 0.3652579, 0.1164727, 1, 1, 1, 1, 1,
0.3699759, 0.5029194, 1.792808, 1, 1, 1, 1, 1,
0.3710936, -1.229438, 4.727242, 1, 1, 1, 1, 1,
0.371374, -1.19692, 2.557767, 1, 1, 1, 1, 1,
0.3723732, -1.92851, 1.731747, 1, 1, 1, 1, 1,
0.3728926, -1.765897, 2.903066, 1, 1, 1, 1, 1,
0.3770654, -0.1923351, 2.285667, 1, 1, 1, 1, 1,
0.3798704, -0.7120147, 3.581648, 1, 1, 1, 1, 1,
0.3861342, 1.167859, 0.1643836, 1, 1, 1, 1, 1,
0.387165, -0.7595048, 2.408217, 1, 1, 1, 1, 1,
0.3904049, -0.8481842, 2.683758, 0, 0, 1, 1, 1,
0.3914447, 0.524926, 0.9035616, 1, 0, 0, 1, 1,
0.3920849, 0.08534081, 1.966929, 1, 0, 0, 1, 1,
0.3953435, 0.7047667, 0.3764746, 1, 0, 0, 1, 1,
0.4006874, -0.3600784, 1.224255, 1, 0, 0, 1, 1,
0.4042751, -0.09075677, 0.1393646, 1, 0, 0, 1, 1,
0.4042891, -0.1653364, 1.499308, 0, 0, 0, 1, 1,
0.4056368, -0.9302347, 2.381992, 0, 0, 0, 1, 1,
0.407174, 0.3449989, 1.450695, 0, 0, 0, 1, 1,
0.4082459, -1.045223, 3.491573, 0, 0, 0, 1, 1,
0.4114334, 0.5480178, 0.1031116, 0, 0, 0, 1, 1,
0.413456, -0.5919269, 2.42302, 0, 0, 0, 1, 1,
0.4186951, 0.4196881, 0.8982541, 0, 0, 0, 1, 1,
0.4201148, 0.5429923, -0.6436129, 1, 1, 1, 1, 1,
0.42276, -1.339036, 3.983374, 1, 1, 1, 1, 1,
0.4233087, -0.6863629, 1.500146, 1, 1, 1, 1, 1,
0.4366084, 0.3881472, 0.846001, 1, 1, 1, 1, 1,
0.4369261, 0.1815189, 0.5379204, 1, 1, 1, 1, 1,
0.439158, 0.7986335, 2.303408, 1, 1, 1, 1, 1,
0.4426656, -0.1282492, -0.3150651, 1, 1, 1, 1, 1,
0.4434949, 0.8663086, -1.917523, 1, 1, 1, 1, 1,
0.4452557, 0.06573863, 1.164548, 1, 1, 1, 1, 1,
0.4499409, -1.332334, 3.737822, 1, 1, 1, 1, 1,
0.4501325, -0.8800501, 3.396294, 1, 1, 1, 1, 1,
0.4540284, -1.14424, 2.583391, 1, 1, 1, 1, 1,
0.4585514, -0.6017426, 2.527075, 1, 1, 1, 1, 1,
0.4662401, -0.6791552, 2.39332, 1, 1, 1, 1, 1,
0.468984, -0.6134914, 3.548946, 1, 1, 1, 1, 1,
0.4693689, -0.6946174, 2.57464, 0, 0, 1, 1, 1,
0.4741724, -1.542707, 2.539273, 1, 0, 0, 1, 1,
0.4788119, -0.4665064, 3.056, 1, 0, 0, 1, 1,
0.4805343, 1.54884, -0.6972741, 1, 0, 0, 1, 1,
0.4817955, -0.4898271, 2.681458, 1, 0, 0, 1, 1,
0.4833556, 0.4509955, 2.113053, 1, 0, 0, 1, 1,
0.4875479, 1.534692, 0.1668377, 0, 0, 0, 1, 1,
0.4926452, -1.249646, 2.681495, 0, 0, 0, 1, 1,
0.4932837, -1.249566, 2.839006, 0, 0, 0, 1, 1,
0.4942847, -0.6955628, 1.850217, 0, 0, 0, 1, 1,
0.500459, 0.5879353, -0.1265122, 0, 0, 0, 1, 1,
0.5012007, -0.3928931, 1.723299, 0, 0, 0, 1, 1,
0.5012718, 0.2220892, 0.7361532, 0, 0, 0, 1, 1,
0.5028614, 0.8918934, 0.9737686, 1, 1, 1, 1, 1,
0.5041793, -0.3454139, 1.268437, 1, 1, 1, 1, 1,
0.5065281, 0.2760015, 2.19145, 1, 1, 1, 1, 1,
0.508836, -0.8082696, 4.086125, 1, 1, 1, 1, 1,
0.5130557, -0.2523468, 3.83937, 1, 1, 1, 1, 1,
0.5149384, -1.978884, 3.417291, 1, 1, 1, 1, 1,
0.5158259, 0.5116946, -0.8401162, 1, 1, 1, 1, 1,
0.515915, -0.2766301, 2.021731, 1, 1, 1, 1, 1,
0.517011, 2.258339, 0.3616875, 1, 1, 1, 1, 1,
0.5213283, 0.02526768, 1.640043, 1, 1, 1, 1, 1,
0.5248545, 0.2087662, 2.067099, 1, 1, 1, 1, 1,
0.5269083, 0.6424063, 1.258615, 1, 1, 1, 1, 1,
0.5292383, -0.1610807, 2.170457, 1, 1, 1, 1, 1,
0.5354431, -1.686076, 3.003338, 1, 1, 1, 1, 1,
0.5365681, 0.2880187, -0.2988004, 1, 1, 1, 1, 1,
0.5369583, -0.9176075, 2.361866, 0, 0, 1, 1, 1,
0.5385019, 0.8809038, 0.1212516, 1, 0, 0, 1, 1,
0.5447911, 1.078995, -0.5392045, 1, 0, 0, 1, 1,
0.5542509, 0.4575489, 1.297543, 1, 0, 0, 1, 1,
0.5548303, 0.6379306, 1.346365, 1, 0, 0, 1, 1,
0.5568503, 1.124888, 2.110405, 1, 0, 0, 1, 1,
0.5580451, -0.7083796, 3.057582, 0, 0, 0, 1, 1,
0.5595647, 1.415315, -0.2435185, 0, 0, 0, 1, 1,
0.5624341, 0.1087671, 3.284361, 0, 0, 0, 1, 1,
0.5638064, 0.4884414, 1.174187, 0, 0, 0, 1, 1,
0.5645449, -1.633873, 4.029543, 0, 0, 0, 1, 1,
0.5662096, -0.9732922, 4.073242, 0, 0, 0, 1, 1,
0.5664189, -0.4095798, 4.59602, 0, 0, 0, 1, 1,
0.5682767, -0.7609733, 3.477318, 1, 1, 1, 1, 1,
0.5693063, 0.304408, 3.355308, 1, 1, 1, 1, 1,
0.5733394, -1.024213, 2.052172, 1, 1, 1, 1, 1,
0.5743459, -0.1503954, 1.464009, 1, 1, 1, 1, 1,
0.5751667, -1.831146, 3.5011, 1, 1, 1, 1, 1,
0.5755821, 0.5260628, 0.4204427, 1, 1, 1, 1, 1,
0.576955, -0.2168556, 1.189845, 1, 1, 1, 1, 1,
0.5784655, 1.292606, 0.8732038, 1, 1, 1, 1, 1,
0.5819113, 1.695991, -1.011186, 1, 1, 1, 1, 1,
0.5828849, -0.4198721, 1.576207, 1, 1, 1, 1, 1,
0.5842627, -0.7493939, 0.1137623, 1, 1, 1, 1, 1,
0.587436, 0.2756662, 1.434392, 1, 1, 1, 1, 1,
0.5881358, 0.5957459, 1.32344, 1, 1, 1, 1, 1,
0.5890911, -0.9187846, 3.2799, 1, 1, 1, 1, 1,
0.5891381, -0.5390009, 4.370981, 1, 1, 1, 1, 1,
0.5918389, -0.2212327, 1.843362, 0, 0, 1, 1, 1,
0.6033586, -0.110201, 3.612139, 1, 0, 0, 1, 1,
0.6058418, 1.506188, 2.451637, 1, 0, 0, 1, 1,
0.608064, 0.2146719, 2.338805, 1, 0, 0, 1, 1,
0.6130422, -2.227785, 3.303998, 1, 0, 0, 1, 1,
0.6138575, 2.10703, -0.9375187, 1, 0, 0, 1, 1,
0.620681, -1.183088, 3.641932, 0, 0, 0, 1, 1,
0.6230788, 1.034575, 0.4700751, 0, 0, 0, 1, 1,
0.624237, -0.02213448, 1.141884, 0, 0, 0, 1, 1,
0.6316462, -0.1863721, 1.493974, 0, 0, 0, 1, 1,
0.6334683, -0.4098755, 0.5973554, 0, 0, 0, 1, 1,
0.6386979, 2.06241, 1.23162, 0, 0, 0, 1, 1,
0.640815, 1.658523, 0.6846327, 0, 0, 0, 1, 1,
0.6564091, -0.3865366, 1.54762, 1, 1, 1, 1, 1,
0.6595338, 0.01731824, 2.318327, 1, 1, 1, 1, 1,
0.6648912, -2.401437, 3.605267, 1, 1, 1, 1, 1,
0.6678079, 2.085787, 0.2974359, 1, 1, 1, 1, 1,
0.6728725, -0.5059164, 3.583726, 1, 1, 1, 1, 1,
0.6817144, 1.508039, 1.047949, 1, 1, 1, 1, 1,
0.6890382, 0.8095277, 0.4081531, 1, 1, 1, 1, 1,
0.6922352, -0.5614116, 3.513165, 1, 1, 1, 1, 1,
0.692932, -0.9202117, 1.864504, 1, 1, 1, 1, 1,
0.6953065, -1.58885, 1.976588, 1, 1, 1, 1, 1,
0.6964149, 1.130541, 0.06148855, 1, 1, 1, 1, 1,
0.6983781, -2.32777, 2.113383, 1, 1, 1, 1, 1,
0.7018073, 1.801138, 0.4740734, 1, 1, 1, 1, 1,
0.7088094, -2.863216, 2.436177, 1, 1, 1, 1, 1,
0.7139807, -2.122252, 3.888503, 1, 1, 1, 1, 1,
0.7258222, -1.363849, 2.136914, 0, 0, 1, 1, 1,
0.7302569, 1.418852, 0.8428876, 1, 0, 0, 1, 1,
0.7307091, -0.5828347, 1.359414, 1, 0, 0, 1, 1,
0.7366535, -0.1965183, 4.180363, 1, 0, 0, 1, 1,
0.7466451, 1.804288, 1.082591, 1, 0, 0, 1, 1,
0.7616619, -0.9719292, 1.700148, 1, 0, 0, 1, 1,
0.7662402, 0.7167971, 2.692588, 0, 0, 0, 1, 1,
0.7683391, 0.8321272, 0.6981758, 0, 0, 0, 1, 1,
0.772204, -1.361958, 3.251696, 0, 0, 0, 1, 1,
0.7723837, 0.744109, 1.587853, 0, 0, 0, 1, 1,
0.7884592, -1.516501, 3.737079, 0, 0, 0, 1, 1,
0.7913163, -0.6376343, 2.589066, 0, 0, 0, 1, 1,
0.7931831, 0.3371341, -0.3439339, 0, 0, 0, 1, 1,
0.7939129, -0.4241875, 1.501858, 1, 1, 1, 1, 1,
0.7948037, -0.1641776, 2.655246, 1, 1, 1, 1, 1,
0.804603, -1.013929, 1.439999, 1, 1, 1, 1, 1,
0.8057082, 0.7442405, -2.071008, 1, 1, 1, 1, 1,
0.812701, -0.03619657, -0.4207444, 1, 1, 1, 1, 1,
0.8129329, 0.5179194, -0.1083049, 1, 1, 1, 1, 1,
0.8151861, 0.4506727, -0.2490495, 1, 1, 1, 1, 1,
0.8189375, 1.112709, 1.096994, 1, 1, 1, 1, 1,
0.8199129, 0.8251456, 0.8572702, 1, 1, 1, 1, 1,
0.8285922, 0.09853341, 2.774223, 1, 1, 1, 1, 1,
0.8408667, -0.1567595, 1.763985, 1, 1, 1, 1, 1,
0.8419943, 2.412723, 0.5279185, 1, 1, 1, 1, 1,
0.8432875, 0.0230845, 0.9358151, 1, 1, 1, 1, 1,
0.84718, 0.8931728, 0.7816365, 1, 1, 1, 1, 1,
0.8511795, 0.724106, -0.671531, 1, 1, 1, 1, 1,
0.8559647, -1.336595, 3.547519, 0, 0, 1, 1, 1,
0.8563417, 0.02471391, 0.81098, 1, 0, 0, 1, 1,
0.8569509, -2.966166, 2.712777, 1, 0, 0, 1, 1,
0.8593827, 0.4531178, 1.59112, 1, 0, 0, 1, 1,
0.860845, -0.6513085, 1.968414, 1, 0, 0, 1, 1,
0.8622798, -1.864914, 1.865447, 1, 0, 0, 1, 1,
0.8695372, -0.3883862, 2.645587, 0, 0, 0, 1, 1,
0.8796121, -0.7246492, 3.007577, 0, 0, 0, 1, 1,
0.882214, -0.6273835, 1.314142, 0, 0, 0, 1, 1,
0.884399, -0.9062509, 1.524346, 0, 0, 0, 1, 1,
0.8912325, -1.925728, 3.389697, 0, 0, 0, 1, 1,
0.8921803, -1.127222, 4.217075, 0, 0, 0, 1, 1,
0.8983663, 0.9753827, 0.02603578, 0, 0, 0, 1, 1,
0.9008657, -0.4686736, 1.326235, 1, 1, 1, 1, 1,
0.9019677, -0.8366269, 2.924044, 1, 1, 1, 1, 1,
0.909292, -0.2525144, 2.153536, 1, 1, 1, 1, 1,
0.9116653, 0.2092576, 2.819576, 1, 1, 1, 1, 1,
0.9121314, 1.082926, 0.01491594, 1, 1, 1, 1, 1,
0.916039, -1.404951, 4.567668, 1, 1, 1, 1, 1,
0.9233321, 1.622139, 0.9651536, 1, 1, 1, 1, 1,
0.9235809, 1.009841, 0.9621736, 1, 1, 1, 1, 1,
0.9272023, 0.7906252, 0.4944408, 1, 1, 1, 1, 1,
0.9282639, 0.7190508, 2.092714, 1, 1, 1, 1, 1,
0.9338208, 2.067043, 0.9637265, 1, 1, 1, 1, 1,
0.9387497, 0.9183784, 2.806957, 1, 1, 1, 1, 1,
0.9460859, -2.443642, 0.903807, 1, 1, 1, 1, 1,
0.9462742, 0.4173214, 1.73698, 1, 1, 1, 1, 1,
0.9529855, -0.5375248, 1.850183, 1, 1, 1, 1, 1,
0.9621483, -0.5567867, 1.200687, 0, 0, 1, 1, 1,
0.9764231, -1.581084, 2.057331, 1, 0, 0, 1, 1,
0.9840997, -1.308725, 2.95349, 1, 0, 0, 1, 1,
0.9921029, 0.3296475, 0.5752634, 1, 0, 0, 1, 1,
0.9956787, -1.161488, 1.087247, 1, 0, 0, 1, 1,
0.9976083, 1.229104, 0.1595255, 1, 0, 0, 1, 1,
0.9983585, 0.1040728, 0.7111378, 0, 0, 0, 1, 1,
1.000239, -0.9302999, 3.473631, 0, 0, 0, 1, 1,
1.00751, 0.3890916, 1.866482, 0, 0, 0, 1, 1,
1.011454, -0.04613223, 1.261936, 0, 0, 0, 1, 1,
1.015333, -0.2678537, 3.113133, 0, 0, 0, 1, 1,
1.019734, -0.3433646, 2.489808, 0, 0, 0, 1, 1,
1.021582, 1.571725, -0.4419599, 0, 0, 0, 1, 1,
1.028783, -1.239308, 1.488492, 1, 1, 1, 1, 1,
1.031485, 1.256055, 0.9361478, 1, 1, 1, 1, 1,
1.032951, 1.414231, -0.2760896, 1, 1, 1, 1, 1,
1.035604, -0.1671361, 1.694181, 1, 1, 1, 1, 1,
1.039899, -0.3280324, 1.500144, 1, 1, 1, 1, 1,
1.042809, 1.140377, 2.778315, 1, 1, 1, 1, 1,
1.051108, -0.7052172, 3.615517, 1, 1, 1, 1, 1,
1.053227, 0.06799079, 1.673044, 1, 1, 1, 1, 1,
1.059182, -1.062393, 2.865944, 1, 1, 1, 1, 1,
1.068067, -0.3171072, 1.923684, 1, 1, 1, 1, 1,
1.069637, 1.382786, 1.401522, 1, 1, 1, 1, 1,
1.073966, -1.626243, 3.139964, 1, 1, 1, 1, 1,
1.074949, -0.1600872, 1.323053, 1, 1, 1, 1, 1,
1.077655, 0.5380237, 0.6438459, 1, 1, 1, 1, 1,
1.081159, 0.8606751, 1.157457, 1, 1, 1, 1, 1,
1.084749, -0.4883583, -0.2462771, 0, 0, 1, 1, 1,
1.085515, -0.9141861, 2.622687, 1, 0, 0, 1, 1,
1.086142, 0.4148887, 0.04098959, 1, 0, 0, 1, 1,
1.087154, -0.1244074, 3.111291, 1, 0, 0, 1, 1,
1.090822, -0.1905236, 0.9011826, 1, 0, 0, 1, 1,
1.100781, -1.594163, 3.436692, 1, 0, 0, 1, 1,
1.101719, 1.056988, 0.4114143, 0, 0, 0, 1, 1,
1.125093, -0.4469101, 2.231845, 0, 0, 0, 1, 1,
1.127162, -0.1995147, 1.109255, 0, 0, 0, 1, 1,
1.130735, 1.377856, 0.9516701, 0, 0, 0, 1, 1,
1.135401, 1.375132, 2.385237, 0, 0, 0, 1, 1,
1.142954, -1.906165, 2.38449, 0, 0, 0, 1, 1,
1.153476, 1.773142, 0.02164134, 0, 0, 0, 1, 1,
1.155025, -1.288533, 1.944333, 1, 1, 1, 1, 1,
1.158498, -0.613448, 1.169296, 1, 1, 1, 1, 1,
1.172307, -0.008007085, 3.059913, 1, 1, 1, 1, 1,
1.173678, -0.07652032, 1.285169, 1, 1, 1, 1, 1,
1.182733, -0.1331888, 1.041628, 1, 1, 1, 1, 1,
1.192344, -2.06336, 2.538626, 1, 1, 1, 1, 1,
1.198254, -0.115416, 1.272878, 1, 1, 1, 1, 1,
1.199692, -2.448467, 3.244238, 1, 1, 1, 1, 1,
1.200665, -0.3217947, 3.037138, 1, 1, 1, 1, 1,
1.203895, 0.8573571, 1.477798, 1, 1, 1, 1, 1,
1.21563, -1.074503, 4.318167, 1, 1, 1, 1, 1,
1.221655, 0.4044516, 2.562408, 1, 1, 1, 1, 1,
1.228219, 0.6642478, 2.276224, 1, 1, 1, 1, 1,
1.234899, -0.2480871, 1.792073, 1, 1, 1, 1, 1,
1.23677, -1.437388, 2.638734, 1, 1, 1, 1, 1,
1.24631, 0.1922611, 0.3996552, 0, 0, 1, 1, 1,
1.246852, -1.244373, 1.540986, 1, 0, 0, 1, 1,
1.267093, -1.86011, 1.760296, 1, 0, 0, 1, 1,
1.267737, -2.116365, 2.857067, 1, 0, 0, 1, 1,
1.26792, 1.005027, 1.405697, 1, 0, 0, 1, 1,
1.270832, 0.8624016, -0.4493458, 1, 0, 0, 1, 1,
1.27089, -0.67071, 2.501765, 0, 0, 0, 1, 1,
1.273585, 0.2195653, 2.189902, 0, 0, 0, 1, 1,
1.278777, 0.3775893, 0.1367344, 0, 0, 0, 1, 1,
1.281107, -1.928112, 4.01409, 0, 0, 0, 1, 1,
1.282359, -0.9525022, 2.939099, 0, 0, 0, 1, 1,
1.288451, -0.3147726, 1.574077, 0, 0, 0, 1, 1,
1.293709, -0.9715329, 2.61264, 0, 0, 0, 1, 1,
1.299414, 0.2907148, 2.251997, 1, 1, 1, 1, 1,
1.318337, -1.300401, 1.762002, 1, 1, 1, 1, 1,
1.320352, 1.866461, 1.657237, 1, 1, 1, 1, 1,
1.323844, 0.3107855, 2.61984, 1, 1, 1, 1, 1,
1.335133, 0.1110576, -0.1738067, 1, 1, 1, 1, 1,
1.343594, -1.656608, 3.332851, 1, 1, 1, 1, 1,
1.345008, -1.162013, 1.686734, 1, 1, 1, 1, 1,
1.362987, -0.0307975, 3.40748, 1, 1, 1, 1, 1,
1.36374, -0.1019066, 2.16724, 1, 1, 1, 1, 1,
1.365073, 1.492473, 1.651123, 1, 1, 1, 1, 1,
1.368564, 0.3296822, -0.01033671, 1, 1, 1, 1, 1,
1.368965, -0.3198595, 3.265676, 1, 1, 1, 1, 1,
1.368997, 0.902496, 0.7683346, 1, 1, 1, 1, 1,
1.370716, 0.7933964, 1.445644, 1, 1, 1, 1, 1,
1.372969, 0.7034695, -0.005805354, 1, 1, 1, 1, 1,
1.378254, 0.03289422, 1.639813, 0, 0, 1, 1, 1,
1.379306, -0.4632227, 0.6218913, 1, 0, 0, 1, 1,
1.380345, 0.814766, 1.678338, 1, 0, 0, 1, 1,
1.38052, -0.03124286, -0.6006837, 1, 0, 0, 1, 1,
1.382295, 0.8378632, 2.269952, 1, 0, 0, 1, 1,
1.38477, -1.450223, 1.741099, 1, 0, 0, 1, 1,
1.387923, 1.796978, 1.315063, 0, 0, 0, 1, 1,
1.390132, -0.4635087, 2.498639, 0, 0, 0, 1, 1,
1.39496, -0.31057, 1.722913, 0, 0, 0, 1, 1,
1.397815, -0.7840561, 2.343257, 0, 0, 0, 1, 1,
1.411745, 0.2315697, 0.7285963, 0, 0, 0, 1, 1,
1.41596, -1.004971, 2.426765, 0, 0, 0, 1, 1,
1.420546, 1.175045, 0.5897438, 0, 0, 0, 1, 1,
1.429695, 1.160354, 0.1699268, 1, 1, 1, 1, 1,
1.437642, 0.272329, 0.6702155, 1, 1, 1, 1, 1,
1.456981, -0.02267989, 0.3621283, 1, 1, 1, 1, 1,
1.460059, 0.5567299, 0.9900784, 1, 1, 1, 1, 1,
1.462767, 0.3909671, 1.730832, 1, 1, 1, 1, 1,
1.465235, 0.2049482, 1.741985, 1, 1, 1, 1, 1,
1.470702, 0.1069374, 0.6405503, 1, 1, 1, 1, 1,
1.471157, -0.02079065, 1.100006, 1, 1, 1, 1, 1,
1.477407, -0.07396924, 2.975353, 1, 1, 1, 1, 1,
1.490776, -0.1866977, 0.7323394, 1, 1, 1, 1, 1,
1.49126, 0.744274, 1.799176, 1, 1, 1, 1, 1,
1.517928, -0.9181496, 1.950166, 1, 1, 1, 1, 1,
1.522907, 0.9523762, 2.824202, 1, 1, 1, 1, 1,
1.529829, 0.07043347, 0.7106562, 1, 1, 1, 1, 1,
1.546456, 0.2297848, 1.595341, 1, 1, 1, 1, 1,
1.571491, 0.6587931, 2.398122, 0, 0, 1, 1, 1,
1.575345, 1.567262, 0.6774298, 1, 0, 0, 1, 1,
1.575439, -0.7066725, 0.6885786, 1, 0, 0, 1, 1,
1.578969, -0.2344661, 3.292568, 1, 0, 0, 1, 1,
1.589468, 1.10024, 1.949053, 1, 0, 0, 1, 1,
1.595415, 0.7220784, 1.508927, 1, 0, 0, 1, 1,
1.610891, 0.9779974, 1.478887, 0, 0, 0, 1, 1,
1.615119, 2.202023, -0.711843, 0, 0, 0, 1, 1,
1.618932, 0.7527568, 0.9348773, 0, 0, 0, 1, 1,
1.628292, 2.115096, 0.2771171, 0, 0, 0, 1, 1,
1.648202, 1.27746, 3.208593, 0, 0, 0, 1, 1,
1.654204, 0.90234, 0.9296719, 0, 0, 0, 1, 1,
1.661042, 1.733237, -0.8087438, 0, 0, 0, 1, 1,
1.661178, 1.139846, 1.384298, 1, 1, 1, 1, 1,
1.663785, -0.533918, 2.48708, 1, 1, 1, 1, 1,
1.666332, 0.6366762, -0.2633382, 1, 1, 1, 1, 1,
1.667866, -1.486764, 3.652999, 1, 1, 1, 1, 1,
1.676693, 0.4369738, 1.717823, 1, 1, 1, 1, 1,
1.680799, 0.146745, 3.713408, 1, 1, 1, 1, 1,
1.709319, 0.6683396, 0.4902447, 1, 1, 1, 1, 1,
1.713278, -1.474588, 2.808802, 1, 1, 1, 1, 1,
1.721942, 0.8359031, -0.2030109, 1, 1, 1, 1, 1,
1.730771, -0.5649327, 2.483354, 1, 1, 1, 1, 1,
1.746651, -0.2457328, 0.6505309, 1, 1, 1, 1, 1,
1.748947, -1.942056, 2.888638, 1, 1, 1, 1, 1,
1.758735, 2.344492, 0.846098, 1, 1, 1, 1, 1,
1.762571, 0.1054977, 1.602905, 1, 1, 1, 1, 1,
1.785349, -0.1278748, 1.104053, 1, 1, 1, 1, 1,
1.789889, 1.258491, 0.8060256, 0, 0, 1, 1, 1,
1.813789, 2.104313, 2.117621, 1, 0, 0, 1, 1,
1.82496, 0.5145304, 1.418748, 1, 0, 0, 1, 1,
1.835604, -0.6244512, 0.4450788, 1, 0, 0, 1, 1,
1.847006, 0.2954499, 1.164425, 1, 0, 0, 1, 1,
1.85297, 1.247529, 2.233678, 1, 0, 0, 1, 1,
1.858812, -2.124351, 1.121825, 0, 0, 0, 1, 1,
1.867313, 0.2784714, 0.1308977, 0, 0, 0, 1, 1,
1.86883, 0.6142954, 2.677352, 0, 0, 0, 1, 1,
1.886096, -0.5103974, 3.076334, 0, 0, 0, 1, 1,
1.889438, 0.9588978, 0.7521062, 0, 0, 0, 1, 1,
1.894775, 1.382336, 1.66152, 0, 0, 0, 1, 1,
1.910181, 1.09885, -0.5121475, 0, 0, 0, 1, 1,
1.928558, -0.0499756, -0.3735575, 1, 1, 1, 1, 1,
1.932444, -1.410809, 1.789007, 1, 1, 1, 1, 1,
1.959139, 0.8071687, 1.632116, 1, 1, 1, 1, 1,
1.972337, -0.1996705, 2.181815, 1, 1, 1, 1, 1,
1.980994, 1.614762, -0.1022151, 1, 1, 1, 1, 1,
1.997716, -0.403887, 3.857814, 1, 1, 1, 1, 1,
2.008244, 1.340639, 0.7980322, 1, 1, 1, 1, 1,
2.016159, -0.9129167, 0.827388, 1, 1, 1, 1, 1,
2.027022, 0.1351836, -0.1581438, 1, 1, 1, 1, 1,
2.065466, -0.01500525, 2.953486, 1, 1, 1, 1, 1,
2.082737, 0.6850783, -1.497206, 1, 1, 1, 1, 1,
2.098755, 0.5951701, 0.8967646, 1, 1, 1, 1, 1,
2.130433, -1.276432, 1.235245, 1, 1, 1, 1, 1,
2.142042, 0.2524608, 0.878695, 1, 1, 1, 1, 1,
2.179221, 0.6110519, 0.3811121, 1, 1, 1, 1, 1,
2.217494, 1.113105, 0.1348262, 0, 0, 1, 1, 1,
2.251532, 0.8223164, 0.8075144, 1, 0, 0, 1, 1,
2.251781, -0.3845189, 0.9549372, 1, 0, 0, 1, 1,
2.252295, 0.4291782, 1.533437, 1, 0, 0, 1, 1,
2.337656, -0.4244969, 0.3573267, 1, 0, 0, 1, 1,
2.348894, -0.3259455, 0.2273297, 1, 0, 0, 1, 1,
2.369526, 1.155417, 2.395422, 0, 0, 0, 1, 1,
2.369546, 0.9813998, 0.8090401, 0, 0, 0, 1, 1,
2.385672, -0.2377379, 3.359684, 0, 0, 0, 1, 1,
2.447711, -1.134816, 2.569514, 0, 0, 0, 1, 1,
2.472039, -0.398615, 2.494748, 0, 0, 0, 1, 1,
2.545784, 0.6141461, 0.436482, 0, 0, 0, 1, 1,
2.561803, 0.0842067, 1.043877, 0, 0, 0, 1, 1,
2.619868, 0.3372002, 2.835907, 1, 1, 1, 1, 1,
2.650672, 0.6324844, 2.017252, 1, 1, 1, 1, 1,
2.689523, -0.1514178, 2.13661, 1, 1, 1, 1, 1,
2.717534, -1.676106, 2.127774, 1, 1, 1, 1, 1,
2.883443, -0.1340266, 2.164179, 1, 1, 1, 1, 1,
3.084906, -1.464841, 2.564961, 1, 1, 1, 1, 1,
3.33331, 1.794324, 0.7490599, 1, 1, 1, 1, 1
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
var radius = 9.202421;
var distance = 32.32312;
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
mvMatrix.translate( 0.1305792, -0.0507375, 0.09731126 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.32312);
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
