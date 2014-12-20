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
-3.408594, 0.2405074, -2.03647, 1, 0, 0, 1,
-3.040176, 0.1982963, -0.8983857, 1, 0.007843138, 0, 1,
-2.968307, -0.7516295, -0.9206069, 1, 0.01176471, 0, 1,
-2.879162, -0.9115017, 0.3007513, 1, 0.01960784, 0, 1,
-2.783425, 0.4653186, 1.64325, 1, 0.02352941, 0, 1,
-2.646456, -0.01126815, -2.289076, 1, 0.03137255, 0, 1,
-2.375069, 0.9250832, -1.244272, 1, 0.03529412, 0, 1,
-2.320652, 0.8114883, -0.8271276, 1, 0.04313726, 0, 1,
-2.264586, 0.04807867, -2.383381, 1, 0.04705882, 0, 1,
-2.263648, -0.5722241, -1.756819, 1, 0.05490196, 0, 1,
-2.229694, 0.7710916, -3.239705, 1, 0.05882353, 0, 1,
-2.193276, 0.9159185, -3.31756, 1, 0.06666667, 0, 1,
-2.191767, -0.7030975, -1.341913, 1, 0.07058824, 0, 1,
-2.158921, 0.8790356, -0.5171862, 1, 0.07843138, 0, 1,
-2.140481, 0.345813, -2.050989, 1, 0.08235294, 0, 1,
-2.12857, 0.3436534, -2.336292, 1, 0.09019608, 0, 1,
-2.105923, 1.090666, -0.6391186, 1, 0.09411765, 0, 1,
-2.091164, -0.6270798, -0.8756722, 1, 0.1019608, 0, 1,
-2.073923, 1.473017, -1.239842, 1, 0.1098039, 0, 1,
-2.050729, 0.1139871, -1.368874, 1, 0.1137255, 0, 1,
-2.037633, -0.6426105, -0.6710581, 1, 0.1215686, 0, 1,
-2.009317, -1.000831, -2.426048, 1, 0.1254902, 0, 1,
-1.937782, 0.1039098, -2.449985, 1, 0.1333333, 0, 1,
-1.934092, 0.8536084, -2.009075, 1, 0.1372549, 0, 1,
-1.932765, -1.233434, -3.419438, 1, 0.145098, 0, 1,
-1.923821, 1.024449, -1.146397, 1, 0.1490196, 0, 1,
-1.90584, -0.7708809, -0.58714, 1, 0.1568628, 0, 1,
-1.896276, -0.2401839, -1.695799, 1, 0.1607843, 0, 1,
-1.860366, -0.9484593, -3.237308, 1, 0.1686275, 0, 1,
-1.855476, -0.6694418, 0.2511697, 1, 0.172549, 0, 1,
-1.845878, -2.298185, -1.526003, 1, 0.1803922, 0, 1,
-1.840982, -1.174195, -1.712556, 1, 0.1843137, 0, 1,
-1.835079, -0.8188032, -0.03032269, 1, 0.1921569, 0, 1,
-1.799883, 1.493732, -2.249251, 1, 0.1960784, 0, 1,
-1.795346, 0.8734117, -0.7080857, 1, 0.2039216, 0, 1,
-1.794459, 0.7526414, -1.396988, 1, 0.2117647, 0, 1,
-1.783467, -0.1716914, -2.191535, 1, 0.2156863, 0, 1,
-1.772388, -0.3171931, -4.418785, 1, 0.2235294, 0, 1,
-1.763932, 1.093012, -0.9080699, 1, 0.227451, 0, 1,
-1.757987, 0.08274396, -0.2953382, 1, 0.2352941, 0, 1,
-1.748923, 1.837412, 1.189314, 1, 0.2392157, 0, 1,
-1.73562, -1.230886, -1.476895, 1, 0.2470588, 0, 1,
-1.721169, -0.4851522, -1.988374, 1, 0.2509804, 0, 1,
-1.703888, -0.01957238, -2.209676, 1, 0.2588235, 0, 1,
-1.70055, -0.9642131, -1.205885, 1, 0.2627451, 0, 1,
-1.699966, -1.306571, -2.941388, 1, 0.2705882, 0, 1,
-1.696024, 2.162389, -1.789536, 1, 0.2745098, 0, 1,
-1.687285, -0.1810839, -0.6231169, 1, 0.282353, 0, 1,
-1.686082, -0.7500804, -1.575636, 1, 0.2862745, 0, 1,
-1.674895, -0.8656676, -0.7160932, 1, 0.2941177, 0, 1,
-1.667971, -0.8975741, -3.466437, 1, 0.3019608, 0, 1,
-1.66459, 0.01271337, -1.479602, 1, 0.3058824, 0, 1,
-1.655691, 0.5128673, -1.520534, 1, 0.3137255, 0, 1,
-1.650823, 0.09359913, -1.483312, 1, 0.3176471, 0, 1,
-1.650433, -0.1136004, -1.350783, 1, 0.3254902, 0, 1,
-1.642615, 0.4708022, -1.053979, 1, 0.3294118, 0, 1,
-1.637124, -0.9560975, -2.10459, 1, 0.3372549, 0, 1,
-1.636121, -1.234633, -1.872105, 1, 0.3411765, 0, 1,
-1.63355, 0.2352895, -3.065542, 1, 0.3490196, 0, 1,
-1.62611, 1.556384, 0.515058, 1, 0.3529412, 0, 1,
-1.625924, 0.7537018, -1.318401, 1, 0.3607843, 0, 1,
-1.612699, -1.037844, -2.833081, 1, 0.3647059, 0, 1,
-1.610236, -0.7712817, -0.4198708, 1, 0.372549, 0, 1,
-1.609743, 1.257329, -0.5463029, 1, 0.3764706, 0, 1,
-1.609357, -0.2188843, -2.581577, 1, 0.3843137, 0, 1,
-1.606988, 0.4758455, -1.644565, 1, 0.3882353, 0, 1,
-1.600018, 0.9802614, -1.362509, 1, 0.3960784, 0, 1,
-1.587889, -0.40719, -0.7802477, 1, 0.4039216, 0, 1,
-1.559269, -0.1170141, -2.169178, 1, 0.4078431, 0, 1,
-1.557851, -1.690155, -3.441786, 1, 0.4156863, 0, 1,
-1.555852, 0.7379932, -3.747011, 1, 0.4196078, 0, 1,
-1.540147, -0.3286867, -0.05623326, 1, 0.427451, 0, 1,
-1.537902, -0.6588513, -0.3789288, 1, 0.4313726, 0, 1,
-1.528541, 0.9228121, -1.129951, 1, 0.4392157, 0, 1,
-1.491391, 0.9155696, -1.209177, 1, 0.4431373, 0, 1,
-1.472616, -1.020712, 0.4791821, 1, 0.4509804, 0, 1,
-1.463146, 0.3785596, -0.8599284, 1, 0.454902, 0, 1,
-1.460604, 0.726668, -0.112018, 1, 0.4627451, 0, 1,
-1.449864, -0.2925935, -1.318787, 1, 0.4666667, 0, 1,
-1.438287, -0.08555321, -1.893025, 1, 0.4745098, 0, 1,
-1.434495, -1.262129, -2.573408, 1, 0.4784314, 0, 1,
-1.429204, -0.3834309, -2.831778, 1, 0.4862745, 0, 1,
-1.416927, 0.9039958, -2.399952, 1, 0.4901961, 0, 1,
-1.392256, -0.2867618, 0.2075348, 1, 0.4980392, 0, 1,
-1.388323, 1.790956, -1.222849, 1, 0.5058824, 0, 1,
-1.383258, 0.345403, -0.4771089, 1, 0.509804, 0, 1,
-1.376478, 1.358265, -0.5551656, 1, 0.5176471, 0, 1,
-1.375824, 0.2424035, -1.924483, 1, 0.5215687, 0, 1,
-1.370807, -0.1957802, -0.8129319, 1, 0.5294118, 0, 1,
-1.370451, -0.8247826, -2.122029, 1, 0.5333334, 0, 1,
-1.362522, -0.2624723, -1.05986, 1, 0.5411765, 0, 1,
-1.347453, -1.679929, -1.864593, 1, 0.5450981, 0, 1,
-1.344861, -0.3185877, -2.097203, 1, 0.5529412, 0, 1,
-1.344812, -1.208468, -2.593173, 1, 0.5568628, 0, 1,
-1.336064, -0.1576809, -0.3754903, 1, 0.5647059, 0, 1,
-1.32649, 1.079585, -1.709063, 1, 0.5686275, 0, 1,
-1.322153, -1.46977, -2.548661, 1, 0.5764706, 0, 1,
-1.298439, -0.2319504, -0.4597581, 1, 0.5803922, 0, 1,
-1.292096, -0.4516095, 0.613085, 1, 0.5882353, 0, 1,
-1.286561, -0.07975674, 0.9965488, 1, 0.5921569, 0, 1,
-1.286486, -0.7521328, -1.617717, 1, 0.6, 0, 1,
-1.284971, -1.072604, -2.610639, 1, 0.6078432, 0, 1,
-1.280082, -0.9138915, -3.287253, 1, 0.6117647, 0, 1,
-1.27582, 0.1221959, -2.339594, 1, 0.6196079, 0, 1,
-1.271291, 1.691971, 1.132788, 1, 0.6235294, 0, 1,
-1.270804, -0.9608398, -1.327789, 1, 0.6313726, 0, 1,
-1.252749, 0.07428195, -2.078099, 1, 0.6352941, 0, 1,
-1.252626, 1.015657, 0.07822003, 1, 0.6431373, 0, 1,
-1.248412, 0.5182096, -1.008582, 1, 0.6470588, 0, 1,
-1.247424, 2.495748, -1.459772, 1, 0.654902, 0, 1,
-1.231194, 0.5204339, -1.443139, 1, 0.6588235, 0, 1,
-1.226585, 0.07918882, -1.763404, 1, 0.6666667, 0, 1,
-1.216553, -0.2240921, -3.580215, 1, 0.6705883, 0, 1,
-1.210488, -1.138168, -2.208332, 1, 0.6784314, 0, 1,
-1.197098, -0.3031612, -0.659979, 1, 0.682353, 0, 1,
-1.192734, 0.009125316, -0.8269143, 1, 0.6901961, 0, 1,
-1.19082, -0.5738887, -2.554728, 1, 0.6941177, 0, 1,
-1.189137, -0.200296, -1.493937, 1, 0.7019608, 0, 1,
-1.174975, 0.4781271, -0.4397341, 1, 0.7098039, 0, 1,
-1.170903, -1.020835, -2.715564, 1, 0.7137255, 0, 1,
-1.16218, 0.3058699, -1.223172, 1, 0.7215686, 0, 1,
-1.158387, -0.3992606, -1.245077, 1, 0.7254902, 0, 1,
-1.155709, -1.189769, -1.596954, 1, 0.7333333, 0, 1,
-1.155157, -1.041386, -1.403933, 1, 0.7372549, 0, 1,
-1.152174, -1.348999, -3.358672, 1, 0.7450981, 0, 1,
-1.134922, 0.2903041, -0.6400605, 1, 0.7490196, 0, 1,
-1.133682, -0.2370259, -1.887015, 1, 0.7568628, 0, 1,
-1.125952, -0.6372931, -2.813142, 1, 0.7607843, 0, 1,
-1.120387, -0.5180055, -2.203421, 1, 0.7686275, 0, 1,
-1.117327, -0.07496502, -2.051554, 1, 0.772549, 0, 1,
-1.116051, -1.905767, -1.283149, 1, 0.7803922, 0, 1,
-1.114504, -0.7833548, -1.977883, 1, 0.7843137, 0, 1,
-1.110312, -0.2473242, -4.045128, 1, 0.7921569, 0, 1,
-1.105636, 0.6535309, -0.8107746, 1, 0.7960784, 0, 1,
-1.104156, 1.432952, -0.150092, 1, 0.8039216, 0, 1,
-1.103743, -2.222211, -1.327166, 1, 0.8117647, 0, 1,
-1.096524, 0.4899786, -2.048146, 1, 0.8156863, 0, 1,
-1.088799, -1.563196, -2.338016, 1, 0.8235294, 0, 1,
-1.08592, -1.843159, -0.9002006, 1, 0.827451, 0, 1,
-1.084315, 0.9237752, 0.6990188, 1, 0.8352941, 0, 1,
-1.0688, 0.07632215, -0.9108657, 1, 0.8392157, 0, 1,
-1.065449, 1.22906, -1.525406, 1, 0.8470588, 0, 1,
-1.055309, 0.6139295, -0.5473864, 1, 0.8509804, 0, 1,
-1.045428, -0.3432533, -3.418697, 1, 0.8588235, 0, 1,
-1.043985, -0.7507477, -1.238181, 1, 0.8627451, 0, 1,
-1.043951, 0.8098007, -1.02941, 1, 0.8705882, 0, 1,
-1.041398, -0.899853, -3.824811, 1, 0.8745098, 0, 1,
-1.039032, 0.4371733, -1.560192, 1, 0.8823529, 0, 1,
-1.037835, 0.4945196, -0.4099552, 1, 0.8862745, 0, 1,
-1.035946, 0.2689518, -0.1302519, 1, 0.8941177, 0, 1,
-1.029108, -0.5914133, -3.210509, 1, 0.8980392, 0, 1,
-1.019034, 0.935493, -2.173039, 1, 0.9058824, 0, 1,
-1.01633, 2.00316, -1.169433, 1, 0.9137255, 0, 1,
-1.009469, -0.09394113, -1.466841, 1, 0.9176471, 0, 1,
-1.006712, -0.1689321, 0.2871844, 1, 0.9254902, 0, 1,
-1.005148, 0.6329672, 0.6463398, 1, 0.9294118, 0, 1,
-1.00386, 0.7838975, -2.086611, 1, 0.9372549, 0, 1,
-0.9993308, 0.1816171, -3.440935, 1, 0.9411765, 0, 1,
-0.9984772, 0.4477696, -0.3370141, 1, 0.9490196, 0, 1,
-0.9982998, -0.878199, -1.599037, 1, 0.9529412, 0, 1,
-0.9934882, -0.5880731, -2.353648, 1, 0.9607843, 0, 1,
-0.9857969, -1.092797, -2.611653, 1, 0.9647059, 0, 1,
-0.9822974, 0.9118313, 0.8311926, 1, 0.972549, 0, 1,
-0.975629, -0.005598757, -0.6475699, 1, 0.9764706, 0, 1,
-0.9735822, -0.9612762, -2.226332, 1, 0.9843137, 0, 1,
-0.9728211, -0.4992221, -0.4335344, 1, 0.9882353, 0, 1,
-0.9721569, -0.2577335, -1.534498, 1, 0.9960784, 0, 1,
-0.9697769, -0.1796098, -2.356046, 0.9960784, 1, 0, 1,
-0.9690767, 0.1492798, -1.567802, 0.9921569, 1, 0, 1,
-0.9683388, -0.5514765, -2.186878, 0.9843137, 1, 0, 1,
-0.9671453, -0.920209, -1.215431, 0.9803922, 1, 0, 1,
-0.9652428, 1.700434, 0.2556036, 0.972549, 1, 0, 1,
-0.9626577, -0.9854285, -2.876073, 0.9686275, 1, 0, 1,
-0.9626433, 0.01568241, -0.5313165, 0.9607843, 1, 0, 1,
-0.9625811, -0.1564969, -3.463613, 0.9568627, 1, 0, 1,
-0.9601465, -0.8306917, -0.9549688, 0.9490196, 1, 0, 1,
-0.9582934, 1.081936, -0.04130554, 0.945098, 1, 0, 1,
-0.9554836, 0.6738924, 0.1913928, 0.9372549, 1, 0, 1,
-0.9550104, -1.273936, -3.729391, 0.9333333, 1, 0, 1,
-0.9425262, -0.2002323, -0.6624869, 0.9254902, 1, 0, 1,
-0.9280847, 0.01916796, -1.562896, 0.9215686, 1, 0, 1,
-0.9256114, 1.12857, -0.6345969, 0.9137255, 1, 0, 1,
-0.9244545, -0.7441865, -2.444338, 0.9098039, 1, 0, 1,
-0.9231632, -0.4432583, -3.343958, 0.9019608, 1, 0, 1,
-0.9222642, 0.4068569, -2.540212, 0.8941177, 1, 0, 1,
-0.9188604, -0.7006466, -2.358799, 0.8901961, 1, 0, 1,
-0.9163839, 1.509199, -0.8119195, 0.8823529, 1, 0, 1,
-0.9023451, -1.45503, -3.147551, 0.8784314, 1, 0, 1,
-0.9022726, 0.8493598, -0.2361942, 0.8705882, 1, 0, 1,
-0.8965554, -1.958203, -2.61141, 0.8666667, 1, 0, 1,
-0.8890405, -0.4621523, -2.021004, 0.8588235, 1, 0, 1,
-0.8884576, -0.9435704, -2.401263, 0.854902, 1, 0, 1,
-0.8825923, 1.593214, 0.5435882, 0.8470588, 1, 0, 1,
-0.8825028, 0.187048, -3.730376, 0.8431373, 1, 0, 1,
-0.8793392, 0.5218238, -2.873788, 0.8352941, 1, 0, 1,
-0.8665899, -0.03039731, -0.2981634, 0.8313726, 1, 0, 1,
-0.8611259, 0.129174, -1.228324, 0.8235294, 1, 0, 1,
-0.8595076, -1.389261, -2.793815, 0.8196079, 1, 0, 1,
-0.8574676, -0.07982655, -3.477053, 0.8117647, 1, 0, 1,
-0.8485516, 2.449809, -0.05955011, 0.8078431, 1, 0, 1,
-0.847209, -0.8813055, -1.938414, 0.8, 1, 0, 1,
-0.8449001, -0.03853271, -1.556604, 0.7921569, 1, 0, 1,
-0.8420913, -1.349316, -2.52427, 0.7882353, 1, 0, 1,
-0.8413192, 0.1269881, -2.605506, 0.7803922, 1, 0, 1,
-0.8393124, 0.9097475, 0.3347436, 0.7764706, 1, 0, 1,
-0.8384475, 0.3999372, -1.334345, 0.7686275, 1, 0, 1,
-0.8330244, 0.3135683, 0.9101032, 0.7647059, 1, 0, 1,
-0.8288978, 0.7333256, -1.105652, 0.7568628, 1, 0, 1,
-0.8278415, -0.06484282, -1.283966, 0.7529412, 1, 0, 1,
-0.8255242, 0.8862545, -0.5939606, 0.7450981, 1, 0, 1,
-0.8245443, -0.1446397, -2.28732, 0.7411765, 1, 0, 1,
-0.8208055, 0.7442645, -0.2860149, 0.7333333, 1, 0, 1,
-0.8185951, 0.9268885, 0.1680126, 0.7294118, 1, 0, 1,
-0.8145546, 0.2308254, -2.506907, 0.7215686, 1, 0, 1,
-0.8121065, 0.5369518, -2.035568, 0.7176471, 1, 0, 1,
-0.8086807, 2.037355, -0.4173921, 0.7098039, 1, 0, 1,
-0.8043167, 1.636616, 1.0561, 0.7058824, 1, 0, 1,
-0.8008838, -0.8318573, -3.207824, 0.6980392, 1, 0, 1,
-0.8001261, -1.388065, -1.910427, 0.6901961, 1, 0, 1,
-0.7976686, 1.066891, -1.272563, 0.6862745, 1, 0, 1,
-0.7974821, -1.778359, -2.669242, 0.6784314, 1, 0, 1,
-0.7960963, -1.805601, -3.402062, 0.6745098, 1, 0, 1,
-0.795041, 1.453983, -0.04644549, 0.6666667, 1, 0, 1,
-0.7936185, -2.386403, -3.232461, 0.6627451, 1, 0, 1,
-0.7916852, 2.336278, 0.2131385, 0.654902, 1, 0, 1,
-0.7801547, 0.1393163, -1.416459, 0.6509804, 1, 0, 1,
-0.7794598, -1.302788, -3.557427, 0.6431373, 1, 0, 1,
-0.7785951, 0.6607202, -1.358292, 0.6392157, 1, 0, 1,
-0.7764953, -0.9484395, -1.822514, 0.6313726, 1, 0, 1,
-0.7728618, -2.018538, -5.04029, 0.627451, 1, 0, 1,
-0.7698777, -0.8457187, -2.929776, 0.6196079, 1, 0, 1,
-0.7689908, -2.17036, -4.569541, 0.6156863, 1, 0, 1,
-0.7660904, -1.548211, -1.52066, 0.6078432, 1, 0, 1,
-0.7649407, 0.2722333, -2.039995, 0.6039216, 1, 0, 1,
-0.7624614, -1.475748, -0.06346659, 0.5960785, 1, 0, 1,
-0.7624493, -1.307606, -0.839668, 0.5882353, 1, 0, 1,
-0.7621812, -1.389015, -2.741628, 0.5843138, 1, 0, 1,
-0.7600119, -0.4308672, -1.058389, 0.5764706, 1, 0, 1,
-0.7566009, -0.4118826, -3.767812, 0.572549, 1, 0, 1,
-0.7511102, 1.493363, 0.08750832, 0.5647059, 1, 0, 1,
-0.7483185, -0.1740794, -1.992439, 0.5607843, 1, 0, 1,
-0.7466223, -1.773225, -2.737833, 0.5529412, 1, 0, 1,
-0.7404345, 0.02436115, -2.254027, 0.5490196, 1, 0, 1,
-0.73747, 2.166582, -0.1669414, 0.5411765, 1, 0, 1,
-0.7331758, 1.539021, 0.485301, 0.5372549, 1, 0, 1,
-0.7320061, 0.8284522, -0.5139521, 0.5294118, 1, 0, 1,
-0.7296089, -0.4578164, -2.163692, 0.5254902, 1, 0, 1,
-0.7270815, 0.6530657, -0.7974734, 0.5176471, 1, 0, 1,
-0.7156471, 0.1622131, -0.3662035, 0.5137255, 1, 0, 1,
-0.7146676, -1.453486, -1.798484, 0.5058824, 1, 0, 1,
-0.7102033, -0.2230768, -0.7551053, 0.5019608, 1, 0, 1,
-0.7085056, -0.8544755, -1.07487, 0.4941176, 1, 0, 1,
-0.7065263, -2.044231, -1.738982, 0.4862745, 1, 0, 1,
-0.7018577, -1.089206, -2.94804, 0.4823529, 1, 0, 1,
-0.7004653, 0.8239387, 0.4924988, 0.4745098, 1, 0, 1,
-0.6899342, 0.09233355, -1.64721, 0.4705882, 1, 0, 1,
-0.6719167, -0.6771879, -1.170723, 0.4627451, 1, 0, 1,
-0.6631413, 0.018805, -2.145169, 0.4588235, 1, 0, 1,
-0.6603572, 0.07040171, -2.095095, 0.4509804, 1, 0, 1,
-0.6415899, -0.6300199, -0.290105, 0.4470588, 1, 0, 1,
-0.638347, 1.280445, 0.4217947, 0.4392157, 1, 0, 1,
-0.6334975, -1.365823, -3.322028, 0.4352941, 1, 0, 1,
-0.6284049, 0.5737604, -2.241001, 0.427451, 1, 0, 1,
-0.6281964, 0.3729493, -1.072298, 0.4235294, 1, 0, 1,
-0.6223338, 2.030821, -1.85152, 0.4156863, 1, 0, 1,
-0.6212764, -1.210534, -4.005815, 0.4117647, 1, 0, 1,
-0.6143481, -0.2629085, -0.7141115, 0.4039216, 1, 0, 1,
-0.6123146, -0.1705187, -1.864004, 0.3960784, 1, 0, 1,
-0.6108766, 0.7551176, -0.9343051, 0.3921569, 1, 0, 1,
-0.6096531, 1.747629, 0.09091812, 0.3843137, 1, 0, 1,
-0.6081778, 0.2376934, -1.246372, 0.3803922, 1, 0, 1,
-0.6070052, -0.7676097, -1.937423, 0.372549, 1, 0, 1,
-0.6061376, 0.3692814, -1.640126, 0.3686275, 1, 0, 1,
-0.597261, -1.651268, -2.5558, 0.3607843, 1, 0, 1,
-0.597254, 0.9571245, -0.4437958, 0.3568628, 1, 0, 1,
-0.5966501, 1.635728, 0.8769816, 0.3490196, 1, 0, 1,
-0.5946652, -0.1084986, -0.1528566, 0.345098, 1, 0, 1,
-0.5919905, 0.7234998, -0.5521251, 0.3372549, 1, 0, 1,
-0.584942, 0.009092312, -1.714162, 0.3333333, 1, 0, 1,
-0.5829359, 0.9536797, -1.645221, 0.3254902, 1, 0, 1,
-0.5781237, 0.8556728, -0.7267804, 0.3215686, 1, 0, 1,
-0.5773159, 0.6433585, -1.248351, 0.3137255, 1, 0, 1,
-0.5712298, 1.939589, 0.09004892, 0.3098039, 1, 0, 1,
-0.5659477, -0.4970491, -2.564281, 0.3019608, 1, 0, 1,
-0.562571, 0.4442441, -0.3351359, 0.2941177, 1, 0, 1,
-0.5614817, 0.5317503, -0.1508458, 0.2901961, 1, 0, 1,
-0.561326, 0.8889945, 0.2800377, 0.282353, 1, 0, 1,
-0.5589573, -0.02617225, -2.593563, 0.2784314, 1, 0, 1,
-0.54913, -0.05353534, -1.582925, 0.2705882, 1, 0, 1,
-0.5489174, -0.2777718, -1.62506, 0.2666667, 1, 0, 1,
-0.5383261, -0.1499228, -2.875092, 0.2588235, 1, 0, 1,
-0.5376211, -0.5569032, -2.14781, 0.254902, 1, 0, 1,
-0.5343325, -1.027049, -4.480277, 0.2470588, 1, 0, 1,
-0.5336226, -0.9825232, -3.517269, 0.2431373, 1, 0, 1,
-0.5333533, 0.6755875, -1.36343, 0.2352941, 1, 0, 1,
-0.5286649, 0.0698055, -1.023597, 0.2313726, 1, 0, 1,
-0.5281175, -0.1049299, -2.252571, 0.2235294, 1, 0, 1,
-0.5256526, 0.4682059, 0.4166737, 0.2196078, 1, 0, 1,
-0.5229287, 0.4648182, -1.395383, 0.2117647, 1, 0, 1,
-0.5214889, 0.4857818, -2.236292, 0.2078431, 1, 0, 1,
-0.5163358, 1.594579, -0.2201539, 0.2, 1, 0, 1,
-0.516087, -1.573005, -4.045924, 0.1921569, 1, 0, 1,
-0.5149971, 1.355296, -0.5467586, 0.1882353, 1, 0, 1,
-0.5144541, -0.2207252, -2.925364, 0.1803922, 1, 0, 1,
-0.5112287, -0.5060306, -0.292938, 0.1764706, 1, 0, 1,
-0.4910195, 0.6618003, -0.537733, 0.1686275, 1, 0, 1,
-0.4885452, -0.8789093, -1.985488, 0.1647059, 1, 0, 1,
-0.4872272, -1.228918, -3.586188, 0.1568628, 1, 0, 1,
-0.4870052, 1.138403, -0.6863108, 0.1529412, 1, 0, 1,
-0.4833611, -0.4454471, -2.081526, 0.145098, 1, 0, 1,
-0.4825628, -0.9407589, -3.378314, 0.1411765, 1, 0, 1,
-0.4703727, 0.08681653, -0.3300823, 0.1333333, 1, 0, 1,
-0.4685473, -0.3898044, -1.219494, 0.1294118, 1, 0, 1,
-0.4684043, 0.359553, 0.1034629, 0.1215686, 1, 0, 1,
-0.467355, -0.4897084, -1.264171, 0.1176471, 1, 0, 1,
-0.467063, 1.762331, -1.28224, 0.1098039, 1, 0, 1,
-0.4660797, -1.131901, -0.43767, 0.1058824, 1, 0, 1,
-0.4647596, 0.03212058, -2.143588, 0.09803922, 1, 0, 1,
-0.4572578, -0.8423266, -2.533663, 0.09019608, 1, 0, 1,
-0.4545574, -0.07829405, -0.3461643, 0.08627451, 1, 0, 1,
-0.4544241, -0.2801147, -1.771206, 0.07843138, 1, 0, 1,
-0.4541482, 1.06892, -0.03984652, 0.07450981, 1, 0, 1,
-0.4516832, 0.904094, 0.2309476, 0.06666667, 1, 0, 1,
-0.4504916, 0.2602684, -1.828457, 0.0627451, 1, 0, 1,
-0.4488617, 1.211347, -2.848273, 0.05490196, 1, 0, 1,
-0.4421393, -0.2137655, -1.471867, 0.05098039, 1, 0, 1,
-0.4401368, 0.9084829, 1.1986, 0.04313726, 1, 0, 1,
-0.4305897, -1.703407, -2.235893, 0.03921569, 1, 0, 1,
-0.4268105, -0.4581732, -3.139855, 0.03137255, 1, 0, 1,
-0.4265397, 1.257055, -0.1240517, 0.02745098, 1, 0, 1,
-0.423564, 1.523477, -0.7960617, 0.01960784, 1, 0, 1,
-0.4228696, -0.708201, -0.6112215, 0.01568628, 1, 0, 1,
-0.4228554, 0.8828219, 0.6108198, 0.007843138, 1, 0, 1,
-0.4225631, -0.77366, -3.156094, 0.003921569, 1, 0, 1,
-0.4168499, -0.2571631, -4.239482, 0, 1, 0.003921569, 1,
-0.4165644, -0.978089, -1.432395, 0, 1, 0.01176471, 1,
-0.411187, -0.5987803, -2.383082, 0, 1, 0.01568628, 1,
-0.4052521, 1.737401, -0.6766694, 0, 1, 0.02352941, 1,
-0.4044866, 0.3897121, -0.5266873, 0, 1, 0.02745098, 1,
-0.3985461, 0.815144, -2.52176, 0, 1, 0.03529412, 1,
-0.3983964, 0.4027019, -2.175914, 0, 1, 0.03921569, 1,
-0.3939242, 1.19901, 0.9469073, 0, 1, 0.04705882, 1,
-0.3927381, 1.585468, -1.901252, 0, 1, 0.05098039, 1,
-0.3920662, 1.596889, 0.1464991, 0, 1, 0.05882353, 1,
-0.3906882, -0.5049088, -1.851147, 0, 1, 0.0627451, 1,
-0.3825519, 1.679566, -0.5349312, 0, 1, 0.07058824, 1,
-0.3814036, 1.417352, -1.652484, 0, 1, 0.07450981, 1,
-0.3760859, -0.4455987, -3.624211, 0, 1, 0.08235294, 1,
-0.3740901, 1.601703, 0.6461454, 0, 1, 0.08627451, 1,
-0.3681996, -0.657814, -4.063391, 0, 1, 0.09411765, 1,
-0.3662646, -0.2841758, -1.830311, 0, 1, 0.1019608, 1,
-0.3633368, -0.4585237, -3.118919, 0, 1, 0.1058824, 1,
-0.3618361, -0.1033255, -0.0002476079, 0, 1, 0.1137255, 1,
-0.3597718, 0.775236, -0.8413987, 0, 1, 0.1176471, 1,
-0.3594409, -0.8739204, -3.542546, 0, 1, 0.1254902, 1,
-0.3570202, -0.9860993, -1.900631, 0, 1, 0.1294118, 1,
-0.348745, -1.44101, -2.418307, 0, 1, 0.1372549, 1,
-0.33694, 1.302717, -0.2209821, 0, 1, 0.1411765, 1,
-0.3353588, 0.4092651, 0.04735998, 0, 1, 0.1490196, 1,
-0.3326752, 1.458206, 0.03042818, 0, 1, 0.1529412, 1,
-0.3259268, 0.05973056, -3.935457, 0, 1, 0.1607843, 1,
-0.3254789, -1.112733, -3.569724, 0, 1, 0.1647059, 1,
-0.3229592, 0.7981169, -0.5326802, 0, 1, 0.172549, 1,
-0.3224655, 0.8688967, -0.4978522, 0, 1, 0.1764706, 1,
-0.3204939, -0.7407384, -3.380065, 0, 1, 0.1843137, 1,
-0.3190086, -0.3179106, -1.459633, 0, 1, 0.1882353, 1,
-0.3171309, -1.015694, -2.710129, 0, 1, 0.1960784, 1,
-0.3014044, -0.212777, -1.309902, 0, 1, 0.2039216, 1,
-0.3001075, 1.588789, -0.5447391, 0, 1, 0.2078431, 1,
-0.299268, 0.01269774, -0.1833678, 0, 1, 0.2156863, 1,
-0.2931994, -0.2727092, -2.394929, 0, 1, 0.2196078, 1,
-0.2904864, -0.7285387, -4.968106, 0, 1, 0.227451, 1,
-0.2876925, 0.6659208, -1.516903, 0, 1, 0.2313726, 1,
-0.2830782, 0.6471346, -0.1171048, 0, 1, 0.2392157, 1,
-0.2828053, -3.403988, -3.499417, 0, 1, 0.2431373, 1,
-0.2822348, -0.7797428, -2.749283, 0, 1, 0.2509804, 1,
-0.2765774, -0.09491806, -3.023059, 0, 1, 0.254902, 1,
-0.2764956, 0.3875796, -2.62937, 0, 1, 0.2627451, 1,
-0.2652014, -1.031639, -1.695102, 0, 1, 0.2666667, 1,
-0.2642987, 0.08830789, -2.494975, 0, 1, 0.2745098, 1,
-0.2636402, 0.06573953, -1.68303, 0, 1, 0.2784314, 1,
-0.2611824, -0.230545, -4.190042, 0, 1, 0.2862745, 1,
-0.2611056, -0.9799185, -3.094818, 0, 1, 0.2901961, 1,
-0.2559819, 0.9862379, -0.8541155, 0, 1, 0.2980392, 1,
-0.2536649, -1.067792, -1.61818, 0, 1, 0.3058824, 1,
-0.2525197, 1.314807, -0.7313566, 0, 1, 0.3098039, 1,
-0.2523154, -1.832317, -3.216236, 0, 1, 0.3176471, 1,
-0.2468538, -0.453512, -2.867801, 0, 1, 0.3215686, 1,
-0.2467984, 0.6893846, 0.845551, 0, 1, 0.3294118, 1,
-0.2452825, 0.2446065, -0.1015299, 0, 1, 0.3333333, 1,
-0.2452158, 0.4383092, 0.9853271, 0, 1, 0.3411765, 1,
-0.24386, 0.5445476, 0.3087684, 0, 1, 0.345098, 1,
-0.2429849, 0.4716524, 0.3922655, 0, 1, 0.3529412, 1,
-0.2275242, 1.778074, -0.1289381, 0, 1, 0.3568628, 1,
-0.2264697, 0.07731357, -0.2138514, 0, 1, 0.3647059, 1,
-0.2254086, -0.02317192, -2.590541, 0, 1, 0.3686275, 1,
-0.224941, 0.7111815, 0.221933, 0, 1, 0.3764706, 1,
-0.2223279, -2.015208, -3.353701, 0, 1, 0.3803922, 1,
-0.2085303, -0.5163007, -2.99545, 0, 1, 0.3882353, 1,
-0.2082334, 1.560354, 0.3126521, 0, 1, 0.3921569, 1,
-0.2082286, -0.1805042, -2.8198, 0, 1, 0.4, 1,
-0.207115, 0.2854086, -0.8838422, 0, 1, 0.4078431, 1,
-0.2014092, -0.3382686, -2.127838, 0, 1, 0.4117647, 1,
-0.1990776, 1.061663, 1.186123, 0, 1, 0.4196078, 1,
-0.1985237, -0.9011596, -2.972047, 0, 1, 0.4235294, 1,
-0.1966338, -1.213996, -3.183443, 0, 1, 0.4313726, 1,
-0.1934621, 0.3961179, -0.5142478, 0, 1, 0.4352941, 1,
-0.1914855, -0.9487324, -1.73563, 0, 1, 0.4431373, 1,
-0.1850065, 0.06079428, -2.974139, 0, 1, 0.4470588, 1,
-0.1832876, 1.071605, 0.1311564, 0, 1, 0.454902, 1,
-0.1811335, 0.3385752, 0.3710862, 0, 1, 0.4588235, 1,
-0.1806288, -0.02890975, -0.9459038, 0, 1, 0.4666667, 1,
-0.1792154, -0.03899403, 0.06978637, 0, 1, 0.4705882, 1,
-0.1790945, 0.9308642, 0.1170493, 0, 1, 0.4784314, 1,
-0.1757665, 0.5652782, -0.1082961, 0, 1, 0.4823529, 1,
-0.1746193, 1.73128, 0.7841653, 0, 1, 0.4901961, 1,
-0.1736207, -1.145058, -1.957561, 0, 1, 0.4941176, 1,
-0.1723534, -0.5692951, -3.926976, 0, 1, 0.5019608, 1,
-0.1722588, 0.9047978, -0.8438352, 0, 1, 0.509804, 1,
-0.171493, -0.005814064, -1.578665, 0, 1, 0.5137255, 1,
-0.1680831, 0.3124425, -0.006194492, 0, 1, 0.5215687, 1,
-0.1661057, 1.637024, -1.062885, 0, 1, 0.5254902, 1,
-0.1657645, 0.164973, -0.4957233, 0, 1, 0.5333334, 1,
-0.1594987, 0.9970852, 1.079321, 0, 1, 0.5372549, 1,
-0.1581209, 0.9410514, 1.214486, 0, 1, 0.5450981, 1,
-0.157572, 1.430493, 2.0064, 0, 1, 0.5490196, 1,
-0.1538192, -2.527867, -1.513779, 0, 1, 0.5568628, 1,
-0.1447945, 2.144565, 0.739155, 0, 1, 0.5607843, 1,
-0.1443573, 0.2090208, -0.7696927, 0, 1, 0.5686275, 1,
-0.1435921, 2.050611, -0.2714587, 0, 1, 0.572549, 1,
-0.1350586, -0.09547541, -0.1893045, 0, 1, 0.5803922, 1,
-0.1329143, 1.229591, -0.3405923, 0, 1, 0.5843138, 1,
-0.1327732, -0.6282834, -2.906553, 0, 1, 0.5921569, 1,
-0.1326486, -0.6382219, -3.64173, 0, 1, 0.5960785, 1,
-0.130889, -0.6109298, -3.057392, 0, 1, 0.6039216, 1,
-0.1273798, -0.4252662, -3.664713, 0, 1, 0.6117647, 1,
-0.1246143, -0.02447025, -0.1733185, 0, 1, 0.6156863, 1,
-0.1210106, -0.643009, -5.741322, 0, 1, 0.6235294, 1,
-0.1203947, 0.03001056, -1.691026, 0, 1, 0.627451, 1,
-0.1199334, -0.5762223, -5.209677, 0, 1, 0.6352941, 1,
-0.1165058, 0.1826418, -1.304334, 0, 1, 0.6392157, 1,
-0.1136768, -0.2866839, -4.504597, 0, 1, 0.6470588, 1,
-0.1134401, 0.7955704, -0.156197, 0, 1, 0.6509804, 1,
-0.1113293, 0.8111776, -0.280942, 0, 1, 0.6588235, 1,
-0.1076807, -0.6857048, -1.28694, 0, 1, 0.6627451, 1,
-0.1050154, -0.1115439, -3.947204, 0, 1, 0.6705883, 1,
-0.1030083, 0.4141725, -0.6254044, 0, 1, 0.6745098, 1,
-0.1023831, 0.2730651, 1.385573, 0, 1, 0.682353, 1,
-0.1012511, 0.3573724, -0.2343668, 0, 1, 0.6862745, 1,
-0.1008438, -0.1234557, -4.400885, 0, 1, 0.6941177, 1,
-0.1004378, -0.2602892, -2.454917, 0, 1, 0.7019608, 1,
-0.09949359, -0.1839748, -1.865067, 0, 1, 0.7058824, 1,
-0.09944122, -1.273597, -5.530429, 0, 1, 0.7137255, 1,
-0.09903568, 0.8439463, -0.509383, 0, 1, 0.7176471, 1,
-0.09639816, 1.475271, -2.278734, 0, 1, 0.7254902, 1,
-0.09387975, -0.8146302, -3.551404, 0, 1, 0.7294118, 1,
-0.0925115, -0.0129217, -2.54248, 0, 1, 0.7372549, 1,
-0.09229695, -0.6733378, -1.650641, 0, 1, 0.7411765, 1,
-0.0922787, -1.068315, -3.003597, 0, 1, 0.7490196, 1,
-0.08911345, 0.9653056, -0.41773, 0, 1, 0.7529412, 1,
-0.0851845, -0.9265636, -3.042835, 0, 1, 0.7607843, 1,
-0.08009581, 0.8096535, 0.02432457, 0, 1, 0.7647059, 1,
-0.07786036, -0.09609169, -1.510896, 0, 1, 0.772549, 1,
-0.07714181, 0.313642, 0.01435836, 0, 1, 0.7764706, 1,
-0.07633412, -0.3603459, -2.780867, 0, 1, 0.7843137, 1,
-0.07465883, 0.3852835, -0.7355266, 0, 1, 0.7882353, 1,
-0.07432026, -1.939264, -3.388827, 0, 1, 0.7960784, 1,
-0.0702305, -0.6392896, -3.612086, 0, 1, 0.8039216, 1,
-0.05637546, 0.0360621, -1.620458, 0, 1, 0.8078431, 1,
-0.05562377, 0.9157531, -0.2104525, 0, 1, 0.8156863, 1,
-0.05464942, 0.9916869, 1.776507, 0, 1, 0.8196079, 1,
-0.05429198, 0.0230971, 0.06250811, 0, 1, 0.827451, 1,
-0.05428163, -0.08887025, -2.773306, 0, 1, 0.8313726, 1,
-0.05330026, -0.08076665, -3.027487, 0, 1, 0.8392157, 1,
-0.05091501, 1.195291, -1.215734, 0, 1, 0.8431373, 1,
-0.04929332, -0.3102378, -2.281891, 0, 1, 0.8509804, 1,
-0.04621679, 1.064362, -0.1989542, 0, 1, 0.854902, 1,
-0.04620562, -0.2181161, -4.072501, 0, 1, 0.8627451, 1,
-0.03950031, 1.570459, 1.136392, 0, 1, 0.8666667, 1,
-0.03816389, 1.32135, -1.907198, 0, 1, 0.8745098, 1,
-0.03730059, -0.2393609, -3.334516, 0, 1, 0.8784314, 1,
-0.03354816, -0.2719995, -4.000391, 0, 1, 0.8862745, 1,
-0.03266756, 0.8427348, -1.335897, 0, 1, 0.8901961, 1,
-0.03209757, -1.061637, -2.499969, 0, 1, 0.8980392, 1,
-0.03205014, 0.1751576, -0.8913037, 0, 1, 0.9058824, 1,
-0.03126534, 1.933444, 1.422438, 0, 1, 0.9098039, 1,
-0.03122765, 0.1692291, -0.225841, 0, 1, 0.9176471, 1,
-0.02792282, 0.02309556, -0.2021836, 0, 1, 0.9215686, 1,
-0.02625693, -0.6161143, -2.957058, 0, 1, 0.9294118, 1,
-0.02536879, 0.4356884, -1.068669, 0, 1, 0.9333333, 1,
-0.0248225, -0.6171981, -3.221097, 0, 1, 0.9411765, 1,
-0.02313785, 0.7220989, 0.5550088, 0, 1, 0.945098, 1,
-0.01814519, -1.215506, -2.238043, 0, 1, 0.9529412, 1,
-0.01726753, 0.08208451, 0.1147176, 0, 1, 0.9568627, 1,
-0.01724685, 0.2163899, 0.03999244, 0, 1, 0.9647059, 1,
-0.01348932, -0.6433309, -1.789081, 0, 1, 0.9686275, 1,
-0.01161995, 2.404803, 0.6627663, 0, 1, 0.9764706, 1,
-0.009695241, 1.130075, 0.8605092, 0, 1, 0.9803922, 1,
-0.005131695, 0.3087729, 0.4050334, 0, 1, 0.9882353, 1,
-0.002676367, -0.4695998, -3.00509, 0, 1, 0.9921569, 1,
-0.0009062554, 0.1601482, 0.3867511, 0, 1, 1, 1,
-0.0006426973, 0.069318, -0.2082021, 0, 0.9921569, 1, 1,
0.002614262, 0.359768, 1.305928, 0, 0.9882353, 1, 1,
0.003121064, -0.4232898, 3.280387, 0, 0.9803922, 1, 1,
0.003661146, 1.052755, -1.17472, 0, 0.9764706, 1, 1,
0.003960306, -1.430782, 3.201169, 0, 0.9686275, 1, 1,
0.01562408, -1.860194, 2.563682, 0, 0.9647059, 1, 1,
0.01613747, -1.827992, 3.016957, 0, 0.9568627, 1, 1,
0.01763828, -1.557039, 2.036412, 0, 0.9529412, 1, 1,
0.01806976, -0.1247867, 1.988181, 0, 0.945098, 1, 1,
0.01852511, 0.5166448, 0.6821896, 0, 0.9411765, 1, 1,
0.02212153, -0.5053965, 3.10146, 0, 0.9333333, 1, 1,
0.02220534, 0.2349862, 0.542945, 0, 0.9294118, 1, 1,
0.02289953, -1.318506, 3.469363, 0, 0.9215686, 1, 1,
0.02547948, -1.880065, 3.585777, 0, 0.9176471, 1, 1,
0.0291349, 0.6382966, 0.1419312, 0, 0.9098039, 1, 1,
0.03244599, 1.024786, 1.143207, 0, 0.9058824, 1, 1,
0.03388982, 1.241899, 0.8818345, 0, 0.8980392, 1, 1,
0.03526418, -0.114497, 3.06955, 0, 0.8901961, 1, 1,
0.03592893, -0.914519, 3.248028, 0, 0.8862745, 1, 1,
0.03905077, -1.03495, 3.82572, 0, 0.8784314, 1, 1,
0.04005094, -0.534559, 2.952639, 0, 0.8745098, 1, 1,
0.04008094, -2.051817, 3.792273, 0, 0.8666667, 1, 1,
0.0405866, 0.904402, 0.04185642, 0, 0.8627451, 1, 1,
0.04452731, 1.403112, 0.7443065, 0, 0.854902, 1, 1,
0.0520115, -1.675466, 4.714274, 0, 0.8509804, 1, 1,
0.05354824, -0.3814372, 2.442276, 0, 0.8431373, 1, 1,
0.05736877, 0.5937105, 2.413422, 0, 0.8392157, 1, 1,
0.05888789, -0.4232214, 2.971478, 0, 0.8313726, 1, 1,
0.08057681, -0.8155458, 4.167817, 0, 0.827451, 1, 1,
0.08067095, 1.532246, 0.9393214, 0, 0.8196079, 1, 1,
0.0845475, 1.823664, 1.157761, 0, 0.8156863, 1, 1,
0.08865196, -0.6896389, 4.028976, 0, 0.8078431, 1, 1,
0.08894106, -1.197487, 1.360821, 0, 0.8039216, 1, 1,
0.09042505, 0.8797309, 0.5041209, 0, 0.7960784, 1, 1,
0.09130065, 0.8351344, -0.1109847, 0, 0.7882353, 1, 1,
0.1001761, 2.429269, 1.355808, 0, 0.7843137, 1, 1,
0.1011479, -0.9148624, 2.880419, 0, 0.7764706, 1, 1,
0.1035787, 0.1206503, 1.864974, 0, 0.772549, 1, 1,
0.1066183, 0.5493257, 0.06154154, 0, 0.7647059, 1, 1,
0.1097858, 0.02109413, -1.069569, 0, 0.7607843, 1, 1,
0.1117261, 0.9307131, 0.2613806, 0, 0.7529412, 1, 1,
0.1129985, 0.2590281, -0.6957887, 0, 0.7490196, 1, 1,
0.1199905, 0.9005704, 0.03079347, 0, 0.7411765, 1, 1,
0.1200414, 0.8387359, 0.7848287, 0, 0.7372549, 1, 1,
0.1261515, -3.067751, 2.813774, 0, 0.7294118, 1, 1,
0.1273484, 0.08800947, 1.115185, 0, 0.7254902, 1, 1,
0.1279105, -0.8231532, 3.584094, 0, 0.7176471, 1, 1,
0.135147, 0.2229008, 1.198245, 0, 0.7137255, 1, 1,
0.1405771, 0.1452785, 1.770622, 0, 0.7058824, 1, 1,
0.1427841, 0.5582375, -0.1984302, 0, 0.6980392, 1, 1,
0.1566679, -0.8338881, 1.066161, 0, 0.6941177, 1, 1,
0.1617835, -1.056589, 3.355588, 0, 0.6862745, 1, 1,
0.1630476, 0.7933679, -0.8563514, 0, 0.682353, 1, 1,
0.165181, 0.2011368, -0.4646032, 0, 0.6745098, 1, 1,
0.1658435, 0.8002131, -0.8047136, 0, 0.6705883, 1, 1,
0.1679701, -0.151895, 3.746419, 0, 0.6627451, 1, 1,
0.1725324, 0.1174404, 2.232037, 0, 0.6588235, 1, 1,
0.1795694, 0.5394549, 1.214886, 0, 0.6509804, 1, 1,
0.180107, 0.3573292, -0.5912157, 0, 0.6470588, 1, 1,
0.1801449, 0.05403701, 2.192905, 0, 0.6392157, 1, 1,
0.1908592, 0.591583, -0.8989006, 0, 0.6352941, 1, 1,
0.2010444, -0.6771952, 2.094995, 0, 0.627451, 1, 1,
0.2018591, -0.1120964, 1.840743, 0, 0.6235294, 1, 1,
0.2031966, -1.14449, 2.671571, 0, 0.6156863, 1, 1,
0.2042287, 2.477834, 0.2640269, 0, 0.6117647, 1, 1,
0.2048552, -0.908612, 2.701891, 0, 0.6039216, 1, 1,
0.2230488, -0.765714, 3.993071, 0, 0.5960785, 1, 1,
0.2261145, 0.8568175, 0.6930073, 0, 0.5921569, 1, 1,
0.2281564, 1.473292, -1.430859, 0, 0.5843138, 1, 1,
0.2297594, 0.4084843, 0.2216043, 0, 0.5803922, 1, 1,
0.2317445, -2.133912, 2.231528, 0, 0.572549, 1, 1,
0.2332785, 0.3789582, 0.8920574, 0, 0.5686275, 1, 1,
0.2378896, 1.195508, -1.076137, 0, 0.5607843, 1, 1,
0.2424674, 2.549412, 0.3082685, 0, 0.5568628, 1, 1,
0.2440095, -1.131762, 3.473043, 0, 0.5490196, 1, 1,
0.2447479, -1.750488, 3.124008, 0, 0.5450981, 1, 1,
0.2448369, -2.233554, 1.881372, 0, 0.5372549, 1, 1,
0.2468413, 0.2057455, 0.9991615, 0, 0.5333334, 1, 1,
0.2487699, 0.1753351, 1.530032, 0, 0.5254902, 1, 1,
0.2500918, 1.206984, 0.2240916, 0, 0.5215687, 1, 1,
0.2529192, 0.8646094, 0.07045641, 0, 0.5137255, 1, 1,
0.2529792, 1.558811, -0.8586205, 0, 0.509804, 1, 1,
0.2557378, 2.261043, -0.9953871, 0, 0.5019608, 1, 1,
0.2596521, 0.8967982, -0.9422226, 0, 0.4941176, 1, 1,
0.2632963, 0.2562709, 1.456283, 0, 0.4901961, 1, 1,
0.2691098, -1.189907, 1.572034, 0, 0.4823529, 1, 1,
0.2732274, -0.8292632, 4.180331, 0, 0.4784314, 1, 1,
0.2756502, -0.3377357, 2.074851, 0, 0.4705882, 1, 1,
0.2783715, -0.5976627, 2.148888, 0, 0.4666667, 1, 1,
0.2791383, -0.3232137, 2.29528, 0, 0.4588235, 1, 1,
0.2832178, -0.148648, 2.126301, 0, 0.454902, 1, 1,
0.2836305, -0.06670311, 1.710205, 0, 0.4470588, 1, 1,
0.285714, -0.1363208, 1.711681, 0, 0.4431373, 1, 1,
0.2882437, 0.9415733, 0.5379078, 0, 0.4352941, 1, 1,
0.2894692, -0.9083081, 3.273274, 0, 0.4313726, 1, 1,
0.2914345, -1.159746, 1.205272, 0, 0.4235294, 1, 1,
0.2936302, 1.196761, -0.1973837, 0, 0.4196078, 1, 1,
0.2955251, 1.785703, 1.547789, 0, 0.4117647, 1, 1,
0.2965111, -0.3754148, 3.4429, 0, 0.4078431, 1, 1,
0.2965745, 0.801719, 1.767705, 0, 0.4, 1, 1,
0.2966058, 0.177529, 0.4871122, 0, 0.3921569, 1, 1,
0.3034227, 0.9432648, 1.506919, 0, 0.3882353, 1, 1,
0.3045822, 1.506891, -0.251039, 0, 0.3803922, 1, 1,
0.3054956, -1.224533, 2.696051, 0, 0.3764706, 1, 1,
0.3062514, 1.180141, -1.447212, 0, 0.3686275, 1, 1,
0.3078184, 0.8930339, 1.078902, 0, 0.3647059, 1, 1,
0.3142402, 0.2571946, 0.9540963, 0, 0.3568628, 1, 1,
0.3165152, 0.2383818, 1.049885, 0, 0.3529412, 1, 1,
0.3185326, -0.170504, 0.07987748, 0, 0.345098, 1, 1,
0.3203452, 1.61025, -1.017019, 0, 0.3411765, 1, 1,
0.3232796, -0.02157973, 2.589122, 0, 0.3333333, 1, 1,
0.3236735, -0.57085, 2.45566, 0, 0.3294118, 1, 1,
0.3241458, -0.7544231, 3.70557, 0, 0.3215686, 1, 1,
0.3242224, -0.5421472, 4.175304, 0, 0.3176471, 1, 1,
0.3265241, 0.4603133, -0.3817779, 0, 0.3098039, 1, 1,
0.3283208, -1.295969, 3.31904, 0, 0.3058824, 1, 1,
0.3316006, 0.06607562, 1.616308, 0, 0.2980392, 1, 1,
0.3355874, 0.2213207, 0.5874383, 0, 0.2901961, 1, 1,
0.3376796, 0.0396302, 0.2434477, 0, 0.2862745, 1, 1,
0.3412791, -0.7189502, 2.956697, 0, 0.2784314, 1, 1,
0.3441758, -1.746556, 2.27916, 0, 0.2745098, 1, 1,
0.3459897, -0.05260265, 2.053581, 0, 0.2666667, 1, 1,
0.3462867, 0.8431829, -0.7578097, 0, 0.2627451, 1, 1,
0.3464313, 1.878492, -0.1193019, 0, 0.254902, 1, 1,
0.3604994, 1.155638, 1.409055, 0, 0.2509804, 1, 1,
0.364216, 0.6912218, 1.309958, 0, 0.2431373, 1, 1,
0.3682421, 1.189823, 0.3398527, 0, 0.2392157, 1, 1,
0.374976, -1.137893, 2.977247, 0, 0.2313726, 1, 1,
0.3781452, 1.472278, -0.8504439, 0, 0.227451, 1, 1,
0.3822732, 0.8634006, 0.4652939, 0, 0.2196078, 1, 1,
0.3854532, 0.3505571, -0.5735274, 0, 0.2156863, 1, 1,
0.3859872, 0.3518554, -0.8076669, 0, 0.2078431, 1, 1,
0.3890558, -0.9133893, 1.121213, 0, 0.2039216, 1, 1,
0.3890755, 0.08537056, 0.9043375, 0, 0.1960784, 1, 1,
0.3894174, -2.437536, 4.41961, 0, 0.1882353, 1, 1,
0.3904373, 0.4713529, 0.8836757, 0, 0.1843137, 1, 1,
0.3929726, 1.288928, 0.5074223, 0, 0.1764706, 1, 1,
0.393433, 0.5410646, 1.886414, 0, 0.172549, 1, 1,
0.3974704, -0.756521, 1.623475, 0, 0.1647059, 1, 1,
0.3977453, -0.003117248, 1.475127, 0, 0.1607843, 1, 1,
0.4011708, 1.015067, -0.3029577, 0, 0.1529412, 1, 1,
0.401219, 0.536108, -0.4910838, 0, 0.1490196, 1, 1,
0.4117939, -0.6996173, 3.47664, 0, 0.1411765, 1, 1,
0.4120525, 0.3937388, 0.4021687, 0, 0.1372549, 1, 1,
0.4137782, 0.5298855, -0.09843492, 0, 0.1294118, 1, 1,
0.4214016, 0.2870533, 0.8210786, 0, 0.1254902, 1, 1,
0.4214886, -1.157124, 3.077105, 0, 0.1176471, 1, 1,
0.4223529, 0.4361177, -1.067922, 0, 0.1137255, 1, 1,
0.422387, 0.8056792, -0.3523527, 0, 0.1058824, 1, 1,
0.4295798, 1.666949, -0.09147752, 0, 0.09803922, 1, 1,
0.4298739, 0.2905138, -0.001411405, 0, 0.09411765, 1, 1,
0.4318037, -0.1408039, 2.968539, 0, 0.08627451, 1, 1,
0.4337273, -0.3713954, 1.547583, 0, 0.08235294, 1, 1,
0.4346218, 1.168552, -0.5589669, 0, 0.07450981, 1, 1,
0.4352126, -1.121297, 2.67204, 0, 0.07058824, 1, 1,
0.4368214, 0.3676118, 0.7090451, 0, 0.0627451, 1, 1,
0.4456945, 2.699435, 1.026795, 0, 0.05882353, 1, 1,
0.4486908, -2.22168, 2.107274, 0, 0.05098039, 1, 1,
0.4498642, 1.678418, 1.261037, 0, 0.04705882, 1, 1,
0.454284, 2.128842, -0.6244441, 0, 0.03921569, 1, 1,
0.4591738, 2.001714, -0.1318554, 0, 0.03529412, 1, 1,
0.4593074, -0.5442602, 4.117946, 0, 0.02745098, 1, 1,
0.4621508, 0.001414508, 1.791653, 0, 0.02352941, 1, 1,
0.4662876, 0.3469032, 0.237635, 0, 0.01568628, 1, 1,
0.4701092, -0.9326615, 2.53938, 0, 0.01176471, 1, 1,
0.4770113, 0.0964802, 0.07440752, 0, 0.003921569, 1, 1,
0.4833915, -2.180738, 3.099212, 0.003921569, 0, 1, 1,
0.4842219, 0.2413792, 1.298995, 0.007843138, 0, 1, 1,
0.4884854, 0.9189293, 1.612207, 0.01568628, 0, 1, 1,
0.4892377, -1.405704, 2.396644, 0.01960784, 0, 1, 1,
0.4916287, -0.1550488, 2.076266, 0.02745098, 0, 1, 1,
0.4920726, 0.1529108, 0.5716786, 0.03137255, 0, 1, 1,
0.4945052, 0.316497, 2.056964, 0.03921569, 0, 1, 1,
0.4945538, -1.674391, 2.590631, 0.04313726, 0, 1, 1,
0.4954388, 1.46512, -0.4301735, 0.05098039, 0, 1, 1,
0.4982046, 0.4012301, 0.2246831, 0.05490196, 0, 1, 1,
0.5087394, 0.4568221, 0.7206899, 0.0627451, 0, 1, 1,
0.5178856, 2.375552, 0.05076684, 0.06666667, 0, 1, 1,
0.5195272, 0.253649, 2.050865, 0.07450981, 0, 1, 1,
0.5227116, -0.7940485, 0.8507313, 0.07843138, 0, 1, 1,
0.5234743, -1.288676, 2.483126, 0.08627451, 0, 1, 1,
0.5237928, 1.067181, 1.999515, 0.09019608, 0, 1, 1,
0.5250453, 0.8219953, 0.8243154, 0.09803922, 0, 1, 1,
0.5283856, 0.3603093, 1.441309, 0.1058824, 0, 1, 1,
0.531349, -2.398023, 3.542375, 0.1098039, 0, 1, 1,
0.5315212, -0.5366966, 2.449456, 0.1176471, 0, 1, 1,
0.5334371, 1.531601, -0.4571779, 0.1215686, 0, 1, 1,
0.5340335, -0.7814584, 3.102272, 0.1294118, 0, 1, 1,
0.5414905, 0.7805609, 0.8591702, 0.1333333, 0, 1, 1,
0.5447831, -0.7641714, 0.4286328, 0.1411765, 0, 1, 1,
0.5459812, -1.886486, 1.147671, 0.145098, 0, 1, 1,
0.5485075, 0.8791184, 0.1225274, 0.1529412, 0, 1, 1,
0.5528734, 1.839351, 1.520773, 0.1568628, 0, 1, 1,
0.5558516, -0.3121341, 3.598127, 0.1647059, 0, 1, 1,
0.5602066, -0.573712, 3.901827, 0.1686275, 0, 1, 1,
0.564656, 1.211525, 0.6974438, 0.1764706, 0, 1, 1,
0.5695847, 0.5077975, -0.4567386, 0.1803922, 0, 1, 1,
0.5714218, -0.3475129, 1.765309, 0.1882353, 0, 1, 1,
0.572366, -0.837696, 4.964, 0.1921569, 0, 1, 1,
0.5793505, -1.00658, 2.782078, 0.2, 0, 1, 1,
0.5799999, -0.2267223, 1.00847, 0.2078431, 0, 1, 1,
0.5819511, -0.6418264, 1.163953, 0.2117647, 0, 1, 1,
0.5825096, -1.332398, 1.984366, 0.2196078, 0, 1, 1,
0.5833154, 0.7564909, 1.415413, 0.2235294, 0, 1, 1,
0.5847032, -0.6205911, 2.248195, 0.2313726, 0, 1, 1,
0.5868095, 0.4607362, 2.807644, 0.2352941, 0, 1, 1,
0.5906264, -1.43539, 2.363156, 0.2431373, 0, 1, 1,
0.591772, 1.385209, 1.506047, 0.2470588, 0, 1, 1,
0.5972254, -0.3156966, 2.310787, 0.254902, 0, 1, 1,
0.599445, -1.253903, 1.341279, 0.2588235, 0, 1, 1,
0.6007556, 1.501097, 0.8297924, 0.2666667, 0, 1, 1,
0.6019853, 0.7644081, 1.095596, 0.2705882, 0, 1, 1,
0.601996, 1.107831, 0.8886519, 0.2784314, 0, 1, 1,
0.6066285, -0.3361247, 1.58511, 0.282353, 0, 1, 1,
0.615228, -1.417317, 4.001928, 0.2901961, 0, 1, 1,
0.6187711, 0.06068823, 0.7749816, 0.2941177, 0, 1, 1,
0.6200264, 1.079394, 0.7676895, 0.3019608, 0, 1, 1,
0.6270498, 0.9413916, 0.6566814, 0.3098039, 0, 1, 1,
0.6270856, -1.62882, 3.587414, 0.3137255, 0, 1, 1,
0.6302952, -1.144334, 3.192019, 0.3215686, 0, 1, 1,
0.632773, -1.149867, 2.357064, 0.3254902, 0, 1, 1,
0.6392943, -1.470775, 2.121692, 0.3333333, 0, 1, 1,
0.645208, -0.3869881, 1.552654, 0.3372549, 0, 1, 1,
0.6469519, -0.1624152, 2.436843, 0.345098, 0, 1, 1,
0.6470673, 0.75423, 1.074303, 0.3490196, 0, 1, 1,
0.6491941, -0.31768, 1.323585, 0.3568628, 0, 1, 1,
0.6508511, -0.7035621, 2.967011, 0.3607843, 0, 1, 1,
0.6527325, -0.5087284, 4.082236, 0.3686275, 0, 1, 1,
0.656803, -1.168865, 2.417526, 0.372549, 0, 1, 1,
0.6583112, 1.642428, 0.7589336, 0.3803922, 0, 1, 1,
0.6598529, 0.4080263, 1.283493, 0.3843137, 0, 1, 1,
0.6653858, 0.2981149, 0.884999, 0.3921569, 0, 1, 1,
0.6719291, 0.9682408, 1.669026, 0.3960784, 0, 1, 1,
0.6736848, -1.626554, 5.080909, 0.4039216, 0, 1, 1,
0.6777791, -1.913067, 2.57815, 0.4117647, 0, 1, 1,
0.6790497, -0.2017332, 0.9885443, 0.4156863, 0, 1, 1,
0.6811393, -0.3756053, 2.387098, 0.4235294, 0, 1, 1,
0.6822134, 1.034384, 2.178852, 0.427451, 0, 1, 1,
0.692089, -1.44117, 2.496704, 0.4352941, 0, 1, 1,
0.6946331, -0.6679327, 1.397228, 0.4392157, 0, 1, 1,
0.698291, 0.1298987, 3.595792, 0.4470588, 0, 1, 1,
0.6994596, -1.881097, 3.702862, 0.4509804, 0, 1, 1,
0.7005761, -0.5033324, 2.801253, 0.4588235, 0, 1, 1,
0.7014944, -0.4795508, 1.41387, 0.4627451, 0, 1, 1,
0.7038448, -0.5885456, 3.376737, 0.4705882, 0, 1, 1,
0.7063073, -0.6006741, 1.228167, 0.4745098, 0, 1, 1,
0.7108107, -0.9851627, 2.282108, 0.4823529, 0, 1, 1,
0.7132285, -0.1233137, 2.68021, 0.4862745, 0, 1, 1,
0.7132788, -0.5755357, 3.690967, 0.4941176, 0, 1, 1,
0.716808, 1.391142, 0.7816334, 0.5019608, 0, 1, 1,
0.7193276, -1.099292, 3.812848, 0.5058824, 0, 1, 1,
0.7223217, 0.1261995, 2.36553, 0.5137255, 0, 1, 1,
0.7347751, -0.2251439, 3.466444, 0.5176471, 0, 1, 1,
0.7421685, -0.394329, 2.881325, 0.5254902, 0, 1, 1,
0.7437333, 2.044096, -0.4707644, 0.5294118, 0, 1, 1,
0.7441896, -0.5468057, 1.626941, 0.5372549, 0, 1, 1,
0.7452926, -0.2019382, 1.590185, 0.5411765, 0, 1, 1,
0.7518087, -0.1250079, 1.789562, 0.5490196, 0, 1, 1,
0.7530208, -0.2633097, 2.525972, 0.5529412, 0, 1, 1,
0.7548829, -0.4216809, 2.808586, 0.5607843, 0, 1, 1,
0.7565066, -1.430314, 5.108339, 0.5647059, 0, 1, 1,
0.7703021, -0.6500733, 2.097276, 0.572549, 0, 1, 1,
0.7717643, -0.05551861, 2.691791, 0.5764706, 0, 1, 1,
0.7725751, -0.3388986, 2.299089, 0.5843138, 0, 1, 1,
0.7778569, 2.129474, 1.240619, 0.5882353, 0, 1, 1,
0.7788359, 1.505302, 2.248376, 0.5960785, 0, 1, 1,
0.7842224, 1.203849, 0.4152612, 0.6039216, 0, 1, 1,
0.7877328, -1.710012, 2.272351, 0.6078432, 0, 1, 1,
0.7903919, -0.6932576, 1.735041, 0.6156863, 0, 1, 1,
0.7957801, -0.5939718, 3.388839, 0.6196079, 0, 1, 1,
0.7974037, 0.9386593, 3.15459, 0.627451, 0, 1, 1,
0.7975423, -0.341151, 1.251961, 0.6313726, 0, 1, 1,
0.7975962, -0.6994824, 3.911663, 0.6392157, 0, 1, 1,
0.7993385, -1.887645, 3.145071, 0.6431373, 0, 1, 1,
0.8043577, -0.310846, 2.084469, 0.6509804, 0, 1, 1,
0.8060786, 0.5208927, 0.651916, 0.654902, 0, 1, 1,
0.8064274, -0.5896837, 0.6942677, 0.6627451, 0, 1, 1,
0.807065, 0.3236488, 1.700363, 0.6666667, 0, 1, 1,
0.8128521, -0.03664359, 1.2045, 0.6745098, 0, 1, 1,
0.8246814, 0.6130576, 0.358741, 0.6784314, 0, 1, 1,
0.8258092, 0.4674751, 2.080348, 0.6862745, 0, 1, 1,
0.829773, 0.3083411, 1.341918, 0.6901961, 0, 1, 1,
0.8310974, -0.2712336, 1.175176, 0.6980392, 0, 1, 1,
0.8338023, -1.190634, 2.585013, 0.7058824, 0, 1, 1,
0.8362691, 0.8511485, 0.1226362, 0.7098039, 0, 1, 1,
0.8414759, -0.1612116, 2.01395, 0.7176471, 0, 1, 1,
0.8446895, 1.206337, -0.2950924, 0.7215686, 0, 1, 1,
0.8447735, -0.006416841, 0.9612212, 0.7294118, 0, 1, 1,
0.8455335, 0.6967121, 2.504686, 0.7333333, 0, 1, 1,
0.8461757, 1.739105, -0.3098737, 0.7411765, 0, 1, 1,
0.8553985, 0.4813535, 1.028325, 0.7450981, 0, 1, 1,
0.8594049, 0.595658, 0.874282, 0.7529412, 0, 1, 1,
0.8603715, 0.8613412, -0.2002335, 0.7568628, 0, 1, 1,
0.8646595, 1.512707, 1.692923, 0.7647059, 0, 1, 1,
0.8660837, 0.2848249, 3.078452, 0.7686275, 0, 1, 1,
0.8667626, -0.6743086, 1.762668, 0.7764706, 0, 1, 1,
0.8695107, -1.796477, 1.494714, 0.7803922, 0, 1, 1,
0.8723691, -0.2787929, 3.35702, 0.7882353, 0, 1, 1,
0.8745986, -0.8647016, 0.907441, 0.7921569, 0, 1, 1,
0.8761449, 0.003683817, 1.931675, 0.8, 0, 1, 1,
0.8765333, -0.3380601, 2.913125, 0.8078431, 0, 1, 1,
0.8819644, 0.5676872, 3.040206, 0.8117647, 0, 1, 1,
0.890332, 0.5652219, 1.619473, 0.8196079, 0, 1, 1,
0.8909296, -1.381115, 3.209262, 0.8235294, 0, 1, 1,
0.8924695, 0.5780947, 2.202805, 0.8313726, 0, 1, 1,
0.9028457, -0.8698028, 3.077472, 0.8352941, 0, 1, 1,
0.9070379, 1.234076, -0.2979722, 0.8431373, 0, 1, 1,
0.913657, 0.863315, 0.7161489, 0.8470588, 0, 1, 1,
0.91528, 0.3509569, 0.06817503, 0.854902, 0, 1, 1,
0.9167963, -0.33293, 1.813845, 0.8588235, 0, 1, 1,
0.9225063, 0.2839389, 0.6403968, 0.8666667, 0, 1, 1,
0.9225542, 0.145211, 1.340887, 0.8705882, 0, 1, 1,
0.9243352, 0.4138357, 2.046679, 0.8784314, 0, 1, 1,
0.9287456, -0.8703123, 0.4877294, 0.8823529, 0, 1, 1,
0.9299452, 0.9341785, 0.2257785, 0.8901961, 0, 1, 1,
0.9336522, -1.017166, 1.520938, 0.8941177, 0, 1, 1,
0.9483666, -0.3017755, 2.095411, 0.9019608, 0, 1, 1,
0.9495896, -0.6185081, 1.292085, 0.9098039, 0, 1, 1,
0.9646776, 1.703897, 0.3767862, 0.9137255, 0, 1, 1,
0.9661506, -1.69512, 1.594984, 0.9215686, 0, 1, 1,
0.9695776, -0.3231913, 3.084488, 0.9254902, 0, 1, 1,
0.9752759, -0.3267045, 2.617867, 0.9333333, 0, 1, 1,
0.9847766, 0.1685249, 2.264256, 0.9372549, 0, 1, 1,
0.9912101, 1.439081, 0.3525118, 0.945098, 0, 1, 1,
1.005831, 0.5533769, 1.863502, 0.9490196, 0, 1, 1,
1.010337, -1.704195, 2.550683, 0.9568627, 0, 1, 1,
1.015437, 1.612421, -0.4620902, 0.9607843, 0, 1, 1,
1.016131, 2.620716, -0.575033, 0.9686275, 0, 1, 1,
1.019466, 0.3358301, 2.7046, 0.972549, 0, 1, 1,
1.030545, 0.4691412, 1.356401, 0.9803922, 0, 1, 1,
1.034689, -1.315875, 1.777637, 0.9843137, 0, 1, 1,
1.037978, -0.8283672, 2.05237, 0.9921569, 0, 1, 1,
1.038191, -0.01907431, 2.977787, 0.9960784, 0, 1, 1,
1.038976, -0.8540813, 2.349657, 1, 0, 0.9960784, 1,
1.043647, -3.085107, 1.301126, 1, 0, 0.9882353, 1,
1.046814, -1.141665, 1.210585, 1, 0, 0.9843137, 1,
1.049566, 2.007969, 0.7485924, 1, 0, 0.9764706, 1,
1.051185, -2.083866, 3.45379, 1, 0, 0.972549, 1,
1.052057, 0.6368206, 1.545162, 1, 0, 0.9647059, 1,
1.052129, 0.3347222, 1.879342, 1, 0, 0.9607843, 1,
1.05521, -0.6741421, 1.086117, 1, 0, 0.9529412, 1,
1.056699, 0.4697253, 2.439698, 1, 0, 0.9490196, 1,
1.058044, 1.440132, 0.6288583, 1, 0, 0.9411765, 1,
1.058973, 0.6177682, -0.2692416, 1, 0, 0.9372549, 1,
1.059199, -0.8747069, 3.07219, 1, 0, 0.9294118, 1,
1.059353, 0.4378434, 1.107349, 1, 0, 0.9254902, 1,
1.077326, 1.082747, -0.8214343, 1, 0, 0.9176471, 1,
1.078451, 1.085467, 1.5236, 1, 0, 0.9137255, 1,
1.079195, -1.216585, 1.509398, 1, 0, 0.9058824, 1,
1.079397, 0.6605128, 0.5387549, 1, 0, 0.9019608, 1,
1.081253, -1.026249, 3.13217, 1, 0, 0.8941177, 1,
1.090284, 0.8041406, -0.3710184, 1, 0, 0.8862745, 1,
1.091489, 1.272738, 2.538696, 1, 0, 0.8823529, 1,
1.092419, 0.3746624, 0.3915914, 1, 0, 0.8745098, 1,
1.092651, -0.8115057, 2.639454, 1, 0, 0.8705882, 1,
1.098526, -1.256457, 1.399916, 1, 0, 0.8627451, 1,
1.099486, -0.4747324, 2.154901, 1, 0, 0.8588235, 1,
1.102101, 0.4346541, -0.4560426, 1, 0, 0.8509804, 1,
1.102569, -1.341968, 2.367793, 1, 0, 0.8470588, 1,
1.108021, 1.651816, 1.36695, 1, 0, 0.8392157, 1,
1.109777, 0.539288, -0.1656775, 1, 0, 0.8352941, 1,
1.11748, -0.7369487, 3.838689, 1, 0, 0.827451, 1,
1.118604, -0.9827468, 2.466417, 1, 0, 0.8235294, 1,
1.123139, -0.5460635, 1.359321, 1, 0, 0.8156863, 1,
1.127114, -1.103686, 3.443425, 1, 0, 0.8117647, 1,
1.129924, 0.4060255, 0.006268336, 1, 0, 0.8039216, 1,
1.133557, -1.406374, 2.098401, 1, 0, 0.7960784, 1,
1.133829, 0.2056685, 0.4979865, 1, 0, 0.7921569, 1,
1.142112, -0.1097447, 1.701717, 1, 0, 0.7843137, 1,
1.147612, 0.125368, 1.995839, 1, 0, 0.7803922, 1,
1.159346, 0.7194308, -0.4502001, 1, 0, 0.772549, 1,
1.163169, 1.314034, 1.802305, 1, 0, 0.7686275, 1,
1.165741, -0.9685999, 3.341974, 1, 0, 0.7607843, 1,
1.167262, -0.3344809, 2.448124, 1, 0, 0.7568628, 1,
1.17074, 0.1253588, 0.4337261, 1, 0, 0.7490196, 1,
1.17694, 0.7167238, 0.7463946, 1, 0, 0.7450981, 1,
1.18082, -1.413337, 3.206829, 1, 0, 0.7372549, 1,
1.184925, -0.2908618, 1.04869, 1, 0, 0.7333333, 1,
1.188155, -0.1629712, 0.5044476, 1, 0, 0.7254902, 1,
1.195718, -1.884257, 3.902494, 1, 0, 0.7215686, 1,
1.196769, -0.7321054, 2.805292, 1, 0, 0.7137255, 1,
1.200024, 0.342393, 1.994259, 1, 0, 0.7098039, 1,
1.213137, -1.769287, 2.839267, 1, 0, 0.7019608, 1,
1.221314, -0.563366, 2.194318, 1, 0, 0.6941177, 1,
1.22931, -0.06550166, 2.501732, 1, 0, 0.6901961, 1,
1.237524, 0.3601196, 1.019012, 1, 0, 0.682353, 1,
1.238358, 0.3730711, -1.042279, 1, 0, 0.6784314, 1,
1.245428, 0.7736537, 1.390577, 1, 0, 0.6705883, 1,
1.245855, -0.669714, 3.80223, 1, 0, 0.6666667, 1,
1.249028, -0.6896325, 1.910846, 1, 0, 0.6588235, 1,
1.249144, 0.432193, 1.720117, 1, 0, 0.654902, 1,
1.252227, 1.644282, 2.186958, 1, 0, 0.6470588, 1,
1.252869, 1.273139, -0.7998266, 1, 0, 0.6431373, 1,
1.259238, -0.1408461, 2.129865, 1, 0, 0.6352941, 1,
1.259685, -0.24563, 3.418097, 1, 0, 0.6313726, 1,
1.26021, -0.5946634, 3.724176, 1, 0, 0.6235294, 1,
1.260744, -0.6985739, 0.1720108, 1, 0, 0.6196079, 1,
1.269289, 1.293221, 1.069119, 1, 0, 0.6117647, 1,
1.276708, -0.5032882, 2.58174, 1, 0, 0.6078432, 1,
1.277659, 0.7463235, 0.2030115, 1, 0, 0.6, 1,
1.277916, 0.8117142, 1.009995, 1, 0, 0.5921569, 1,
1.280783, -1.550698, 2.999382, 1, 0, 0.5882353, 1,
1.287825, 1.144635, 1.500729, 1, 0, 0.5803922, 1,
1.298759, 2.251304, 1.910817, 1, 0, 0.5764706, 1,
1.305889, -0.3130396, 2.26897, 1, 0, 0.5686275, 1,
1.306631, 0.579195, 0.7620015, 1, 0, 0.5647059, 1,
1.31046, 1.136505, 0.4594941, 1, 0, 0.5568628, 1,
1.312136, 0.6977276, 0.9401743, 1, 0, 0.5529412, 1,
1.32348, -0.004812954, 1.340859, 1, 0, 0.5450981, 1,
1.328893, -0.8244931, 3.301738, 1, 0, 0.5411765, 1,
1.336774, -0.5557059, 1.283873, 1, 0, 0.5333334, 1,
1.354774, -0.2569458, 1.703754, 1, 0, 0.5294118, 1,
1.361494, 1.558333, -0.1784989, 1, 0, 0.5215687, 1,
1.36447, -0.4794802, 2.327705, 1, 0, 0.5176471, 1,
1.36644, 1.836992, 1.55399, 1, 0, 0.509804, 1,
1.368555, 0.47091, 0.7195965, 1, 0, 0.5058824, 1,
1.374281, 1.25244, 0.1436669, 1, 0, 0.4980392, 1,
1.375626, 1.044055, 0.6898271, 1, 0, 0.4901961, 1,
1.387307, -0.4017445, 2.057545, 1, 0, 0.4862745, 1,
1.392252, -0.4084923, 1.744621, 1, 0, 0.4784314, 1,
1.393498, -0.3876665, 2.422827, 1, 0, 0.4745098, 1,
1.396468, -0.4027474, 2.477358, 1, 0, 0.4666667, 1,
1.412696, -0.569251, 1.199124, 1, 0, 0.4627451, 1,
1.416952, 0.6913972, -0.4479156, 1, 0, 0.454902, 1,
1.419495, 0.6536975, -0.1814747, 1, 0, 0.4509804, 1,
1.421407, 0.09287897, 2.189885, 1, 0, 0.4431373, 1,
1.426202, 1.458907, 1.868005, 1, 0, 0.4392157, 1,
1.427855, -0.2581416, 1.164545, 1, 0, 0.4313726, 1,
1.441003, -0.3530171, 3.337472, 1, 0, 0.427451, 1,
1.448025, -0.6374542, 2.295807, 1, 0, 0.4196078, 1,
1.454858, 0.985215, 0.7873711, 1, 0, 0.4156863, 1,
1.459317, -1.269359, 1.594022, 1, 0, 0.4078431, 1,
1.482038, 1.157393, 1.737392, 1, 0, 0.4039216, 1,
1.495023, -0.3248881, 3.194381, 1, 0, 0.3960784, 1,
1.504808, -0.8645276, 2.880409, 1, 0, 0.3882353, 1,
1.508558, 1.219409, 1.362057, 1, 0, 0.3843137, 1,
1.508689, -0.4248922, 0.3556031, 1, 0, 0.3764706, 1,
1.537186, 0.6156029, 1.242106, 1, 0, 0.372549, 1,
1.544423, 0.6053063, 0.8255742, 1, 0, 0.3647059, 1,
1.563269, 2.655771, 0.01790155, 1, 0, 0.3607843, 1,
1.576917, 0.5581702, 1.835482, 1, 0, 0.3529412, 1,
1.576957, 0.4094962, 0.761383, 1, 0, 0.3490196, 1,
1.584545, -0.6652347, 0.8639668, 1, 0, 0.3411765, 1,
1.593451, 0.6980389, 1.382718, 1, 0, 0.3372549, 1,
1.606376, -0.1837597, 1.076933, 1, 0, 0.3294118, 1,
1.606729, 0.6978611, 0.9317485, 1, 0, 0.3254902, 1,
1.626207, 0.7373419, 0.4472872, 1, 0, 0.3176471, 1,
1.629754, 0.3744589, 0.7961704, 1, 0, 0.3137255, 1,
1.632932, 0.7286857, 0.9951006, 1, 0, 0.3058824, 1,
1.640519, -1.393973, 2.574076, 1, 0, 0.2980392, 1,
1.678224, 1.950137, -1.180664, 1, 0, 0.2941177, 1,
1.68014, -1.627974, 3.184924, 1, 0, 0.2862745, 1,
1.689318, 0.4336609, 1.623201, 1, 0, 0.282353, 1,
1.693252, 1.610983, 0.8257087, 1, 0, 0.2745098, 1,
1.697291, 0.2584455, 1.322078, 1, 0, 0.2705882, 1,
1.697373, 0.2952415, 1.459997, 1, 0, 0.2627451, 1,
1.702478, -0.6784024, 1.137248, 1, 0, 0.2588235, 1,
1.702883, 0.6496899, 2.376376, 1, 0, 0.2509804, 1,
1.708297, -0.1144989, 2.50104, 1, 0, 0.2470588, 1,
1.721645, 0.038959, 1.798252, 1, 0, 0.2392157, 1,
1.74425, 0.5223195, 0.6377733, 1, 0, 0.2352941, 1,
1.749478, -0.07492782, 0.5071856, 1, 0, 0.227451, 1,
1.773669, -0.6155822, 2.744556, 1, 0, 0.2235294, 1,
1.792621, 0.4325013, 0.3884998, 1, 0, 0.2156863, 1,
1.809335, -0.5669065, 3.116819, 1, 0, 0.2117647, 1,
1.817504, -1.582967, 3.048306, 1, 0, 0.2039216, 1,
1.821164, -1.281055, 1.91102, 1, 0, 0.1960784, 1,
1.847852, -0.9673693, 3.253014, 1, 0, 0.1921569, 1,
1.863319, 0.9579561, 2.789119, 1, 0, 0.1843137, 1,
1.869476, 0.9463529, 0.9291143, 1, 0, 0.1803922, 1,
1.872601, -1.347732, 4.32735, 1, 0, 0.172549, 1,
1.915486, 1.415488, 1.850036, 1, 0, 0.1686275, 1,
1.921582, -1.970716, 4.672655, 1, 0, 0.1607843, 1,
1.93026, 0.9179558, 0.7695539, 1, 0, 0.1568628, 1,
1.942357, -1.209355, 1.348267, 1, 0, 0.1490196, 1,
1.943422, 1.086369, -0.01582722, 1, 0, 0.145098, 1,
1.963187, 0.7936897, -0.8637837, 1, 0, 0.1372549, 1,
1.987517, 2.992872, -0.6917531, 1, 0, 0.1333333, 1,
2.016935, -1.579986, 2.700142, 1, 0, 0.1254902, 1,
2.021689, -0.5661159, 1.095116, 1, 0, 0.1215686, 1,
2.086196, 1.60354, -0.05257989, 1, 0, 0.1137255, 1,
2.094673, 0.4638405, 0.9038485, 1, 0, 0.1098039, 1,
2.144325, 0.5437249, 2.298354, 1, 0, 0.1019608, 1,
2.166512, 0.8233011, 2.433021, 1, 0, 0.09411765, 1,
2.1766, -0.3881484, 1.792542, 1, 0, 0.09019608, 1,
2.184428, -1.040511, 1.79317, 1, 0, 0.08235294, 1,
2.184638, 0.989023, 1.190179, 1, 0, 0.07843138, 1,
2.28399, 1.159791, 0.9967676, 1, 0, 0.07058824, 1,
2.284744, 1.482557, -0.008186948, 1, 0, 0.06666667, 1,
2.301237, -2.305851, 0.6660186, 1, 0, 0.05882353, 1,
2.330509, -1.172029, 2.567289, 1, 0, 0.05490196, 1,
2.445148, 0.09022106, 2.059501, 1, 0, 0.04705882, 1,
2.449736, 1.010914, 0.07630122, 1, 0, 0.04313726, 1,
2.47636, 1.025586, 1.317177, 1, 0, 0.03529412, 1,
2.558047, -0.922748, 0.8293353, 1, 0, 0.03137255, 1,
2.771606, 0.4156537, 0.1979626, 1, 0, 0.02352941, 1,
2.791998, -1.294364, -1.064544, 1, 0, 0.01960784, 1,
2.80419, 0.2482193, 0.3359478, 1, 0, 0.01176471, 1,
2.825703, 1.056207, 0.1286397, 1, 0, 0.007843138, 1
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
-0.2914455, -4.488256, -7.580339, 0, -0.5, 0.5, 0.5,
-0.2914455, -4.488256, -7.580339, 1, -0.5, 0.5, 0.5,
-0.2914455, -4.488256, -7.580339, 1, 1.5, 0.5, 0.5,
-0.2914455, -4.488256, -7.580339, 0, 1.5, 0.5, 0.5
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
-4.465308, -0.2055582, -7.580339, 0, -0.5, 0.5, 0.5,
-4.465308, -0.2055582, -7.580339, 1, -0.5, 0.5, 0.5,
-4.465308, -0.2055582, -7.580339, 1, 1.5, 0.5, 0.5,
-4.465308, -0.2055582, -7.580339, 0, 1.5, 0.5, 0.5
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
-4.465308, -4.488256, -0.3164914, 0, -0.5, 0.5, 0.5,
-4.465308, -4.488256, -0.3164914, 1, -0.5, 0.5, 0.5,
-4.465308, -4.488256, -0.3164914, 1, 1.5, 0.5, 0.5,
-4.465308, -4.488256, -0.3164914, 0, 1.5, 0.5, 0.5
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
-3, -3.499941, -5.904067,
2, -3.499941, -5.904067,
-3, -3.499941, -5.904067,
-3, -3.66466, -6.183445,
-2, -3.499941, -5.904067,
-2, -3.66466, -6.183445,
-1, -3.499941, -5.904067,
-1, -3.66466, -6.183445,
0, -3.499941, -5.904067,
0, -3.66466, -6.183445,
1, -3.499941, -5.904067,
1, -3.66466, -6.183445,
2, -3.499941, -5.904067,
2, -3.66466, -6.183445
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
-3, -3.994098, -6.742203, 0, -0.5, 0.5, 0.5,
-3, -3.994098, -6.742203, 1, -0.5, 0.5, 0.5,
-3, -3.994098, -6.742203, 1, 1.5, 0.5, 0.5,
-3, -3.994098, -6.742203, 0, 1.5, 0.5, 0.5,
-2, -3.994098, -6.742203, 0, -0.5, 0.5, 0.5,
-2, -3.994098, -6.742203, 1, -0.5, 0.5, 0.5,
-2, -3.994098, -6.742203, 1, 1.5, 0.5, 0.5,
-2, -3.994098, -6.742203, 0, 1.5, 0.5, 0.5,
-1, -3.994098, -6.742203, 0, -0.5, 0.5, 0.5,
-1, -3.994098, -6.742203, 1, -0.5, 0.5, 0.5,
-1, -3.994098, -6.742203, 1, 1.5, 0.5, 0.5,
-1, -3.994098, -6.742203, 0, 1.5, 0.5, 0.5,
0, -3.994098, -6.742203, 0, -0.5, 0.5, 0.5,
0, -3.994098, -6.742203, 1, -0.5, 0.5, 0.5,
0, -3.994098, -6.742203, 1, 1.5, 0.5, 0.5,
0, -3.994098, -6.742203, 0, 1.5, 0.5, 0.5,
1, -3.994098, -6.742203, 0, -0.5, 0.5, 0.5,
1, -3.994098, -6.742203, 1, -0.5, 0.5, 0.5,
1, -3.994098, -6.742203, 1, 1.5, 0.5, 0.5,
1, -3.994098, -6.742203, 0, 1.5, 0.5, 0.5,
2, -3.994098, -6.742203, 0, -0.5, 0.5, 0.5,
2, -3.994098, -6.742203, 1, -0.5, 0.5, 0.5,
2, -3.994098, -6.742203, 1, 1.5, 0.5, 0.5,
2, -3.994098, -6.742203, 0, 1.5, 0.5, 0.5
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
-3.502109, -3, -5.904067,
-3.502109, 2, -5.904067,
-3.502109, -3, -5.904067,
-3.662642, -3, -6.183445,
-3.502109, -2, -5.904067,
-3.662642, -2, -6.183445,
-3.502109, -1, -5.904067,
-3.662642, -1, -6.183445,
-3.502109, 0, -5.904067,
-3.662642, 0, -6.183445,
-3.502109, 1, -5.904067,
-3.662642, 1, -6.183445,
-3.502109, 2, -5.904067,
-3.662642, 2, -6.183445
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
-3.983708, -3, -6.742203, 0, -0.5, 0.5, 0.5,
-3.983708, -3, -6.742203, 1, -0.5, 0.5, 0.5,
-3.983708, -3, -6.742203, 1, 1.5, 0.5, 0.5,
-3.983708, -3, -6.742203, 0, 1.5, 0.5, 0.5,
-3.983708, -2, -6.742203, 0, -0.5, 0.5, 0.5,
-3.983708, -2, -6.742203, 1, -0.5, 0.5, 0.5,
-3.983708, -2, -6.742203, 1, 1.5, 0.5, 0.5,
-3.983708, -2, -6.742203, 0, 1.5, 0.5, 0.5,
-3.983708, -1, -6.742203, 0, -0.5, 0.5, 0.5,
-3.983708, -1, -6.742203, 1, -0.5, 0.5, 0.5,
-3.983708, -1, -6.742203, 1, 1.5, 0.5, 0.5,
-3.983708, -1, -6.742203, 0, 1.5, 0.5, 0.5,
-3.983708, 0, -6.742203, 0, -0.5, 0.5, 0.5,
-3.983708, 0, -6.742203, 1, -0.5, 0.5, 0.5,
-3.983708, 0, -6.742203, 1, 1.5, 0.5, 0.5,
-3.983708, 0, -6.742203, 0, 1.5, 0.5, 0.5,
-3.983708, 1, -6.742203, 0, -0.5, 0.5, 0.5,
-3.983708, 1, -6.742203, 1, -0.5, 0.5, 0.5,
-3.983708, 1, -6.742203, 1, 1.5, 0.5, 0.5,
-3.983708, 1, -6.742203, 0, 1.5, 0.5, 0.5,
-3.983708, 2, -6.742203, 0, -0.5, 0.5, 0.5,
-3.983708, 2, -6.742203, 1, -0.5, 0.5, 0.5,
-3.983708, 2, -6.742203, 1, 1.5, 0.5, 0.5,
-3.983708, 2, -6.742203, 0, 1.5, 0.5, 0.5
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
-3.502109, -3.499941, -4,
-3.502109, -3.499941, 4,
-3.502109, -3.499941, -4,
-3.662642, -3.66466, -4,
-3.502109, -3.499941, -2,
-3.662642, -3.66466, -2,
-3.502109, -3.499941, 0,
-3.662642, -3.66466, 0,
-3.502109, -3.499941, 2,
-3.662642, -3.66466, 2,
-3.502109, -3.499941, 4,
-3.662642, -3.66466, 4
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
-3.983708, -3.994098, -4, 0, -0.5, 0.5, 0.5,
-3.983708, -3.994098, -4, 1, -0.5, 0.5, 0.5,
-3.983708, -3.994098, -4, 1, 1.5, 0.5, 0.5,
-3.983708, -3.994098, -4, 0, 1.5, 0.5, 0.5,
-3.983708, -3.994098, -2, 0, -0.5, 0.5, 0.5,
-3.983708, -3.994098, -2, 1, -0.5, 0.5, 0.5,
-3.983708, -3.994098, -2, 1, 1.5, 0.5, 0.5,
-3.983708, -3.994098, -2, 0, 1.5, 0.5, 0.5,
-3.983708, -3.994098, 0, 0, -0.5, 0.5, 0.5,
-3.983708, -3.994098, 0, 1, -0.5, 0.5, 0.5,
-3.983708, -3.994098, 0, 1, 1.5, 0.5, 0.5,
-3.983708, -3.994098, 0, 0, 1.5, 0.5, 0.5,
-3.983708, -3.994098, 2, 0, -0.5, 0.5, 0.5,
-3.983708, -3.994098, 2, 1, -0.5, 0.5, 0.5,
-3.983708, -3.994098, 2, 1, 1.5, 0.5, 0.5,
-3.983708, -3.994098, 2, 0, 1.5, 0.5, 0.5,
-3.983708, -3.994098, 4, 0, -0.5, 0.5, 0.5,
-3.983708, -3.994098, 4, 1, -0.5, 0.5, 0.5,
-3.983708, -3.994098, 4, 1, 1.5, 0.5, 0.5,
-3.983708, -3.994098, 4, 0, 1.5, 0.5, 0.5
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
-3.502109, -3.499941, -5.904067,
-3.502109, 3.088825, -5.904067,
-3.502109, -3.499941, 5.271084,
-3.502109, 3.088825, 5.271084,
-3.502109, -3.499941, -5.904067,
-3.502109, -3.499941, 5.271084,
-3.502109, 3.088825, -5.904067,
-3.502109, 3.088825, 5.271084,
-3.502109, -3.499941, -5.904067,
2.919218, -3.499941, -5.904067,
-3.502109, -3.499941, 5.271084,
2.919218, -3.499941, 5.271084,
-3.502109, 3.088825, -5.904067,
2.919218, 3.088825, -5.904067,
-3.502109, 3.088825, 5.271084,
2.919218, 3.088825, 5.271084,
2.919218, -3.499941, -5.904067,
2.919218, 3.088825, -5.904067,
2.919218, -3.499941, 5.271084,
2.919218, 3.088825, 5.271084,
2.919218, -3.499941, -5.904067,
2.919218, -3.499941, 5.271084,
2.919218, 3.088825, -5.904067,
2.919218, 3.088825, 5.271084
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
var radius = 7.729436;
var distance = 34.38913;
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
mvMatrix.translate( 0.2914455, 0.2055582, 0.3164914 );
mvMatrix.scale( 1.301478, 1.268404, 0.7478394 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.38913);
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
pyrazoxyfen<-read.table("pyrazoxyfen.xyz")
```

```
## Error in read.table("pyrazoxyfen.xyz"): no lines available in input
```

```r
x<-pyrazoxyfen$V2
```

```
## Error in eval(expr, envir, enclos): object 'pyrazoxyfen' not found
```

```r
y<-pyrazoxyfen$V3
```

```
## Error in eval(expr, envir, enclos): object 'pyrazoxyfen' not found
```

```r
z<-pyrazoxyfen$V4
```

```
## Error in eval(expr, envir, enclos): object 'pyrazoxyfen' not found
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
-3.408594, 0.2405074, -2.03647, 0, 0, 1, 1, 1,
-3.040176, 0.1982963, -0.8983857, 1, 0, 0, 1, 1,
-2.968307, -0.7516295, -0.9206069, 1, 0, 0, 1, 1,
-2.879162, -0.9115017, 0.3007513, 1, 0, 0, 1, 1,
-2.783425, 0.4653186, 1.64325, 1, 0, 0, 1, 1,
-2.646456, -0.01126815, -2.289076, 1, 0, 0, 1, 1,
-2.375069, 0.9250832, -1.244272, 0, 0, 0, 1, 1,
-2.320652, 0.8114883, -0.8271276, 0, 0, 0, 1, 1,
-2.264586, 0.04807867, -2.383381, 0, 0, 0, 1, 1,
-2.263648, -0.5722241, -1.756819, 0, 0, 0, 1, 1,
-2.229694, 0.7710916, -3.239705, 0, 0, 0, 1, 1,
-2.193276, 0.9159185, -3.31756, 0, 0, 0, 1, 1,
-2.191767, -0.7030975, -1.341913, 0, 0, 0, 1, 1,
-2.158921, 0.8790356, -0.5171862, 1, 1, 1, 1, 1,
-2.140481, 0.345813, -2.050989, 1, 1, 1, 1, 1,
-2.12857, 0.3436534, -2.336292, 1, 1, 1, 1, 1,
-2.105923, 1.090666, -0.6391186, 1, 1, 1, 1, 1,
-2.091164, -0.6270798, -0.8756722, 1, 1, 1, 1, 1,
-2.073923, 1.473017, -1.239842, 1, 1, 1, 1, 1,
-2.050729, 0.1139871, -1.368874, 1, 1, 1, 1, 1,
-2.037633, -0.6426105, -0.6710581, 1, 1, 1, 1, 1,
-2.009317, -1.000831, -2.426048, 1, 1, 1, 1, 1,
-1.937782, 0.1039098, -2.449985, 1, 1, 1, 1, 1,
-1.934092, 0.8536084, -2.009075, 1, 1, 1, 1, 1,
-1.932765, -1.233434, -3.419438, 1, 1, 1, 1, 1,
-1.923821, 1.024449, -1.146397, 1, 1, 1, 1, 1,
-1.90584, -0.7708809, -0.58714, 1, 1, 1, 1, 1,
-1.896276, -0.2401839, -1.695799, 1, 1, 1, 1, 1,
-1.860366, -0.9484593, -3.237308, 0, 0, 1, 1, 1,
-1.855476, -0.6694418, 0.2511697, 1, 0, 0, 1, 1,
-1.845878, -2.298185, -1.526003, 1, 0, 0, 1, 1,
-1.840982, -1.174195, -1.712556, 1, 0, 0, 1, 1,
-1.835079, -0.8188032, -0.03032269, 1, 0, 0, 1, 1,
-1.799883, 1.493732, -2.249251, 1, 0, 0, 1, 1,
-1.795346, 0.8734117, -0.7080857, 0, 0, 0, 1, 1,
-1.794459, 0.7526414, -1.396988, 0, 0, 0, 1, 1,
-1.783467, -0.1716914, -2.191535, 0, 0, 0, 1, 1,
-1.772388, -0.3171931, -4.418785, 0, 0, 0, 1, 1,
-1.763932, 1.093012, -0.9080699, 0, 0, 0, 1, 1,
-1.757987, 0.08274396, -0.2953382, 0, 0, 0, 1, 1,
-1.748923, 1.837412, 1.189314, 0, 0, 0, 1, 1,
-1.73562, -1.230886, -1.476895, 1, 1, 1, 1, 1,
-1.721169, -0.4851522, -1.988374, 1, 1, 1, 1, 1,
-1.703888, -0.01957238, -2.209676, 1, 1, 1, 1, 1,
-1.70055, -0.9642131, -1.205885, 1, 1, 1, 1, 1,
-1.699966, -1.306571, -2.941388, 1, 1, 1, 1, 1,
-1.696024, 2.162389, -1.789536, 1, 1, 1, 1, 1,
-1.687285, -0.1810839, -0.6231169, 1, 1, 1, 1, 1,
-1.686082, -0.7500804, -1.575636, 1, 1, 1, 1, 1,
-1.674895, -0.8656676, -0.7160932, 1, 1, 1, 1, 1,
-1.667971, -0.8975741, -3.466437, 1, 1, 1, 1, 1,
-1.66459, 0.01271337, -1.479602, 1, 1, 1, 1, 1,
-1.655691, 0.5128673, -1.520534, 1, 1, 1, 1, 1,
-1.650823, 0.09359913, -1.483312, 1, 1, 1, 1, 1,
-1.650433, -0.1136004, -1.350783, 1, 1, 1, 1, 1,
-1.642615, 0.4708022, -1.053979, 1, 1, 1, 1, 1,
-1.637124, -0.9560975, -2.10459, 0, 0, 1, 1, 1,
-1.636121, -1.234633, -1.872105, 1, 0, 0, 1, 1,
-1.63355, 0.2352895, -3.065542, 1, 0, 0, 1, 1,
-1.62611, 1.556384, 0.515058, 1, 0, 0, 1, 1,
-1.625924, 0.7537018, -1.318401, 1, 0, 0, 1, 1,
-1.612699, -1.037844, -2.833081, 1, 0, 0, 1, 1,
-1.610236, -0.7712817, -0.4198708, 0, 0, 0, 1, 1,
-1.609743, 1.257329, -0.5463029, 0, 0, 0, 1, 1,
-1.609357, -0.2188843, -2.581577, 0, 0, 0, 1, 1,
-1.606988, 0.4758455, -1.644565, 0, 0, 0, 1, 1,
-1.600018, 0.9802614, -1.362509, 0, 0, 0, 1, 1,
-1.587889, -0.40719, -0.7802477, 0, 0, 0, 1, 1,
-1.559269, -0.1170141, -2.169178, 0, 0, 0, 1, 1,
-1.557851, -1.690155, -3.441786, 1, 1, 1, 1, 1,
-1.555852, 0.7379932, -3.747011, 1, 1, 1, 1, 1,
-1.540147, -0.3286867, -0.05623326, 1, 1, 1, 1, 1,
-1.537902, -0.6588513, -0.3789288, 1, 1, 1, 1, 1,
-1.528541, 0.9228121, -1.129951, 1, 1, 1, 1, 1,
-1.491391, 0.9155696, -1.209177, 1, 1, 1, 1, 1,
-1.472616, -1.020712, 0.4791821, 1, 1, 1, 1, 1,
-1.463146, 0.3785596, -0.8599284, 1, 1, 1, 1, 1,
-1.460604, 0.726668, -0.112018, 1, 1, 1, 1, 1,
-1.449864, -0.2925935, -1.318787, 1, 1, 1, 1, 1,
-1.438287, -0.08555321, -1.893025, 1, 1, 1, 1, 1,
-1.434495, -1.262129, -2.573408, 1, 1, 1, 1, 1,
-1.429204, -0.3834309, -2.831778, 1, 1, 1, 1, 1,
-1.416927, 0.9039958, -2.399952, 1, 1, 1, 1, 1,
-1.392256, -0.2867618, 0.2075348, 1, 1, 1, 1, 1,
-1.388323, 1.790956, -1.222849, 0, 0, 1, 1, 1,
-1.383258, 0.345403, -0.4771089, 1, 0, 0, 1, 1,
-1.376478, 1.358265, -0.5551656, 1, 0, 0, 1, 1,
-1.375824, 0.2424035, -1.924483, 1, 0, 0, 1, 1,
-1.370807, -0.1957802, -0.8129319, 1, 0, 0, 1, 1,
-1.370451, -0.8247826, -2.122029, 1, 0, 0, 1, 1,
-1.362522, -0.2624723, -1.05986, 0, 0, 0, 1, 1,
-1.347453, -1.679929, -1.864593, 0, 0, 0, 1, 1,
-1.344861, -0.3185877, -2.097203, 0, 0, 0, 1, 1,
-1.344812, -1.208468, -2.593173, 0, 0, 0, 1, 1,
-1.336064, -0.1576809, -0.3754903, 0, 0, 0, 1, 1,
-1.32649, 1.079585, -1.709063, 0, 0, 0, 1, 1,
-1.322153, -1.46977, -2.548661, 0, 0, 0, 1, 1,
-1.298439, -0.2319504, -0.4597581, 1, 1, 1, 1, 1,
-1.292096, -0.4516095, 0.613085, 1, 1, 1, 1, 1,
-1.286561, -0.07975674, 0.9965488, 1, 1, 1, 1, 1,
-1.286486, -0.7521328, -1.617717, 1, 1, 1, 1, 1,
-1.284971, -1.072604, -2.610639, 1, 1, 1, 1, 1,
-1.280082, -0.9138915, -3.287253, 1, 1, 1, 1, 1,
-1.27582, 0.1221959, -2.339594, 1, 1, 1, 1, 1,
-1.271291, 1.691971, 1.132788, 1, 1, 1, 1, 1,
-1.270804, -0.9608398, -1.327789, 1, 1, 1, 1, 1,
-1.252749, 0.07428195, -2.078099, 1, 1, 1, 1, 1,
-1.252626, 1.015657, 0.07822003, 1, 1, 1, 1, 1,
-1.248412, 0.5182096, -1.008582, 1, 1, 1, 1, 1,
-1.247424, 2.495748, -1.459772, 1, 1, 1, 1, 1,
-1.231194, 0.5204339, -1.443139, 1, 1, 1, 1, 1,
-1.226585, 0.07918882, -1.763404, 1, 1, 1, 1, 1,
-1.216553, -0.2240921, -3.580215, 0, 0, 1, 1, 1,
-1.210488, -1.138168, -2.208332, 1, 0, 0, 1, 1,
-1.197098, -0.3031612, -0.659979, 1, 0, 0, 1, 1,
-1.192734, 0.009125316, -0.8269143, 1, 0, 0, 1, 1,
-1.19082, -0.5738887, -2.554728, 1, 0, 0, 1, 1,
-1.189137, -0.200296, -1.493937, 1, 0, 0, 1, 1,
-1.174975, 0.4781271, -0.4397341, 0, 0, 0, 1, 1,
-1.170903, -1.020835, -2.715564, 0, 0, 0, 1, 1,
-1.16218, 0.3058699, -1.223172, 0, 0, 0, 1, 1,
-1.158387, -0.3992606, -1.245077, 0, 0, 0, 1, 1,
-1.155709, -1.189769, -1.596954, 0, 0, 0, 1, 1,
-1.155157, -1.041386, -1.403933, 0, 0, 0, 1, 1,
-1.152174, -1.348999, -3.358672, 0, 0, 0, 1, 1,
-1.134922, 0.2903041, -0.6400605, 1, 1, 1, 1, 1,
-1.133682, -0.2370259, -1.887015, 1, 1, 1, 1, 1,
-1.125952, -0.6372931, -2.813142, 1, 1, 1, 1, 1,
-1.120387, -0.5180055, -2.203421, 1, 1, 1, 1, 1,
-1.117327, -0.07496502, -2.051554, 1, 1, 1, 1, 1,
-1.116051, -1.905767, -1.283149, 1, 1, 1, 1, 1,
-1.114504, -0.7833548, -1.977883, 1, 1, 1, 1, 1,
-1.110312, -0.2473242, -4.045128, 1, 1, 1, 1, 1,
-1.105636, 0.6535309, -0.8107746, 1, 1, 1, 1, 1,
-1.104156, 1.432952, -0.150092, 1, 1, 1, 1, 1,
-1.103743, -2.222211, -1.327166, 1, 1, 1, 1, 1,
-1.096524, 0.4899786, -2.048146, 1, 1, 1, 1, 1,
-1.088799, -1.563196, -2.338016, 1, 1, 1, 1, 1,
-1.08592, -1.843159, -0.9002006, 1, 1, 1, 1, 1,
-1.084315, 0.9237752, 0.6990188, 1, 1, 1, 1, 1,
-1.0688, 0.07632215, -0.9108657, 0, 0, 1, 1, 1,
-1.065449, 1.22906, -1.525406, 1, 0, 0, 1, 1,
-1.055309, 0.6139295, -0.5473864, 1, 0, 0, 1, 1,
-1.045428, -0.3432533, -3.418697, 1, 0, 0, 1, 1,
-1.043985, -0.7507477, -1.238181, 1, 0, 0, 1, 1,
-1.043951, 0.8098007, -1.02941, 1, 0, 0, 1, 1,
-1.041398, -0.899853, -3.824811, 0, 0, 0, 1, 1,
-1.039032, 0.4371733, -1.560192, 0, 0, 0, 1, 1,
-1.037835, 0.4945196, -0.4099552, 0, 0, 0, 1, 1,
-1.035946, 0.2689518, -0.1302519, 0, 0, 0, 1, 1,
-1.029108, -0.5914133, -3.210509, 0, 0, 0, 1, 1,
-1.019034, 0.935493, -2.173039, 0, 0, 0, 1, 1,
-1.01633, 2.00316, -1.169433, 0, 0, 0, 1, 1,
-1.009469, -0.09394113, -1.466841, 1, 1, 1, 1, 1,
-1.006712, -0.1689321, 0.2871844, 1, 1, 1, 1, 1,
-1.005148, 0.6329672, 0.6463398, 1, 1, 1, 1, 1,
-1.00386, 0.7838975, -2.086611, 1, 1, 1, 1, 1,
-0.9993308, 0.1816171, -3.440935, 1, 1, 1, 1, 1,
-0.9984772, 0.4477696, -0.3370141, 1, 1, 1, 1, 1,
-0.9982998, -0.878199, -1.599037, 1, 1, 1, 1, 1,
-0.9934882, -0.5880731, -2.353648, 1, 1, 1, 1, 1,
-0.9857969, -1.092797, -2.611653, 1, 1, 1, 1, 1,
-0.9822974, 0.9118313, 0.8311926, 1, 1, 1, 1, 1,
-0.975629, -0.005598757, -0.6475699, 1, 1, 1, 1, 1,
-0.9735822, -0.9612762, -2.226332, 1, 1, 1, 1, 1,
-0.9728211, -0.4992221, -0.4335344, 1, 1, 1, 1, 1,
-0.9721569, -0.2577335, -1.534498, 1, 1, 1, 1, 1,
-0.9697769, -0.1796098, -2.356046, 1, 1, 1, 1, 1,
-0.9690767, 0.1492798, -1.567802, 0, 0, 1, 1, 1,
-0.9683388, -0.5514765, -2.186878, 1, 0, 0, 1, 1,
-0.9671453, -0.920209, -1.215431, 1, 0, 0, 1, 1,
-0.9652428, 1.700434, 0.2556036, 1, 0, 0, 1, 1,
-0.9626577, -0.9854285, -2.876073, 1, 0, 0, 1, 1,
-0.9626433, 0.01568241, -0.5313165, 1, 0, 0, 1, 1,
-0.9625811, -0.1564969, -3.463613, 0, 0, 0, 1, 1,
-0.9601465, -0.8306917, -0.9549688, 0, 0, 0, 1, 1,
-0.9582934, 1.081936, -0.04130554, 0, 0, 0, 1, 1,
-0.9554836, 0.6738924, 0.1913928, 0, 0, 0, 1, 1,
-0.9550104, -1.273936, -3.729391, 0, 0, 0, 1, 1,
-0.9425262, -0.2002323, -0.6624869, 0, 0, 0, 1, 1,
-0.9280847, 0.01916796, -1.562896, 0, 0, 0, 1, 1,
-0.9256114, 1.12857, -0.6345969, 1, 1, 1, 1, 1,
-0.9244545, -0.7441865, -2.444338, 1, 1, 1, 1, 1,
-0.9231632, -0.4432583, -3.343958, 1, 1, 1, 1, 1,
-0.9222642, 0.4068569, -2.540212, 1, 1, 1, 1, 1,
-0.9188604, -0.7006466, -2.358799, 1, 1, 1, 1, 1,
-0.9163839, 1.509199, -0.8119195, 1, 1, 1, 1, 1,
-0.9023451, -1.45503, -3.147551, 1, 1, 1, 1, 1,
-0.9022726, 0.8493598, -0.2361942, 1, 1, 1, 1, 1,
-0.8965554, -1.958203, -2.61141, 1, 1, 1, 1, 1,
-0.8890405, -0.4621523, -2.021004, 1, 1, 1, 1, 1,
-0.8884576, -0.9435704, -2.401263, 1, 1, 1, 1, 1,
-0.8825923, 1.593214, 0.5435882, 1, 1, 1, 1, 1,
-0.8825028, 0.187048, -3.730376, 1, 1, 1, 1, 1,
-0.8793392, 0.5218238, -2.873788, 1, 1, 1, 1, 1,
-0.8665899, -0.03039731, -0.2981634, 1, 1, 1, 1, 1,
-0.8611259, 0.129174, -1.228324, 0, 0, 1, 1, 1,
-0.8595076, -1.389261, -2.793815, 1, 0, 0, 1, 1,
-0.8574676, -0.07982655, -3.477053, 1, 0, 0, 1, 1,
-0.8485516, 2.449809, -0.05955011, 1, 0, 0, 1, 1,
-0.847209, -0.8813055, -1.938414, 1, 0, 0, 1, 1,
-0.8449001, -0.03853271, -1.556604, 1, 0, 0, 1, 1,
-0.8420913, -1.349316, -2.52427, 0, 0, 0, 1, 1,
-0.8413192, 0.1269881, -2.605506, 0, 0, 0, 1, 1,
-0.8393124, 0.9097475, 0.3347436, 0, 0, 0, 1, 1,
-0.8384475, 0.3999372, -1.334345, 0, 0, 0, 1, 1,
-0.8330244, 0.3135683, 0.9101032, 0, 0, 0, 1, 1,
-0.8288978, 0.7333256, -1.105652, 0, 0, 0, 1, 1,
-0.8278415, -0.06484282, -1.283966, 0, 0, 0, 1, 1,
-0.8255242, 0.8862545, -0.5939606, 1, 1, 1, 1, 1,
-0.8245443, -0.1446397, -2.28732, 1, 1, 1, 1, 1,
-0.8208055, 0.7442645, -0.2860149, 1, 1, 1, 1, 1,
-0.8185951, 0.9268885, 0.1680126, 1, 1, 1, 1, 1,
-0.8145546, 0.2308254, -2.506907, 1, 1, 1, 1, 1,
-0.8121065, 0.5369518, -2.035568, 1, 1, 1, 1, 1,
-0.8086807, 2.037355, -0.4173921, 1, 1, 1, 1, 1,
-0.8043167, 1.636616, 1.0561, 1, 1, 1, 1, 1,
-0.8008838, -0.8318573, -3.207824, 1, 1, 1, 1, 1,
-0.8001261, -1.388065, -1.910427, 1, 1, 1, 1, 1,
-0.7976686, 1.066891, -1.272563, 1, 1, 1, 1, 1,
-0.7974821, -1.778359, -2.669242, 1, 1, 1, 1, 1,
-0.7960963, -1.805601, -3.402062, 1, 1, 1, 1, 1,
-0.795041, 1.453983, -0.04644549, 1, 1, 1, 1, 1,
-0.7936185, -2.386403, -3.232461, 1, 1, 1, 1, 1,
-0.7916852, 2.336278, 0.2131385, 0, 0, 1, 1, 1,
-0.7801547, 0.1393163, -1.416459, 1, 0, 0, 1, 1,
-0.7794598, -1.302788, -3.557427, 1, 0, 0, 1, 1,
-0.7785951, 0.6607202, -1.358292, 1, 0, 0, 1, 1,
-0.7764953, -0.9484395, -1.822514, 1, 0, 0, 1, 1,
-0.7728618, -2.018538, -5.04029, 1, 0, 0, 1, 1,
-0.7698777, -0.8457187, -2.929776, 0, 0, 0, 1, 1,
-0.7689908, -2.17036, -4.569541, 0, 0, 0, 1, 1,
-0.7660904, -1.548211, -1.52066, 0, 0, 0, 1, 1,
-0.7649407, 0.2722333, -2.039995, 0, 0, 0, 1, 1,
-0.7624614, -1.475748, -0.06346659, 0, 0, 0, 1, 1,
-0.7624493, -1.307606, -0.839668, 0, 0, 0, 1, 1,
-0.7621812, -1.389015, -2.741628, 0, 0, 0, 1, 1,
-0.7600119, -0.4308672, -1.058389, 1, 1, 1, 1, 1,
-0.7566009, -0.4118826, -3.767812, 1, 1, 1, 1, 1,
-0.7511102, 1.493363, 0.08750832, 1, 1, 1, 1, 1,
-0.7483185, -0.1740794, -1.992439, 1, 1, 1, 1, 1,
-0.7466223, -1.773225, -2.737833, 1, 1, 1, 1, 1,
-0.7404345, 0.02436115, -2.254027, 1, 1, 1, 1, 1,
-0.73747, 2.166582, -0.1669414, 1, 1, 1, 1, 1,
-0.7331758, 1.539021, 0.485301, 1, 1, 1, 1, 1,
-0.7320061, 0.8284522, -0.5139521, 1, 1, 1, 1, 1,
-0.7296089, -0.4578164, -2.163692, 1, 1, 1, 1, 1,
-0.7270815, 0.6530657, -0.7974734, 1, 1, 1, 1, 1,
-0.7156471, 0.1622131, -0.3662035, 1, 1, 1, 1, 1,
-0.7146676, -1.453486, -1.798484, 1, 1, 1, 1, 1,
-0.7102033, -0.2230768, -0.7551053, 1, 1, 1, 1, 1,
-0.7085056, -0.8544755, -1.07487, 1, 1, 1, 1, 1,
-0.7065263, -2.044231, -1.738982, 0, 0, 1, 1, 1,
-0.7018577, -1.089206, -2.94804, 1, 0, 0, 1, 1,
-0.7004653, 0.8239387, 0.4924988, 1, 0, 0, 1, 1,
-0.6899342, 0.09233355, -1.64721, 1, 0, 0, 1, 1,
-0.6719167, -0.6771879, -1.170723, 1, 0, 0, 1, 1,
-0.6631413, 0.018805, -2.145169, 1, 0, 0, 1, 1,
-0.6603572, 0.07040171, -2.095095, 0, 0, 0, 1, 1,
-0.6415899, -0.6300199, -0.290105, 0, 0, 0, 1, 1,
-0.638347, 1.280445, 0.4217947, 0, 0, 0, 1, 1,
-0.6334975, -1.365823, -3.322028, 0, 0, 0, 1, 1,
-0.6284049, 0.5737604, -2.241001, 0, 0, 0, 1, 1,
-0.6281964, 0.3729493, -1.072298, 0, 0, 0, 1, 1,
-0.6223338, 2.030821, -1.85152, 0, 0, 0, 1, 1,
-0.6212764, -1.210534, -4.005815, 1, 1, 1, 1, 1,
-0.6143481, -0.2629085, -0.7141115, 1, 1, 1, 1, 1,
-0.6123146, -0.1705187, -1.864004, 1, 1, 1, 1, 1,
-0.6108766, 0.7551176, -0.9343051, 1, 1, 1, 1, 1,
-0.6096531, 1.747629, 0.09091812, 1, 1, 1, 1, 1,
-0.6081778, 0.2376934, -1.246372, 1, 1, 1, 1, 1,
-0.6070052, -0.7676097, -1.937423, 1, 1, 1, 1, 1,
-0.6061376, 0.3692814, -1.640126, 1, 1, 1, 1, 1,
-0.597261, -1.651268, -2.5558, 1, 1, 1, 1, 1,
-0.597254, 0.9571245, -0.4437958, 1, 1, 1, 1, 1,
-0.5966501, 1.635728, 0.8769816, 1, 1, 1, 1, 1,
-0.5946652, -0.1084986, -0.1528566, 1, 1, 1, 1, 1,
-0.5919905, 0.7234998, -0.5521251, 1, 1, 1, 1, 1,
-0.584942, 0.009092312, -1.714162, 1, 1, 1, 1, 1,
-0.5829359, 0.9536797, -1.645221, 1, 1, 1, 1, 1,
-0.5781237, 0.8556728, -0.7267804, 0, 0, 1, 1, 1,
-0.5773159, 0.6433585, -1.248351, 1, 0, 0, 1, 1,
-0.5712298, 1.939589, 0.09004892, 1, 0, 0, 1, 1,
-0.5659477, -0.4970491, -2.564281, 1, 0, 0, 1, 1,
-0.562571, 0.4442441, -0.3351359, 1, 0, 0, 1, 1,
-0.5614817, 0.5317503, -0.1508458, 1, 0, 0, 1, 1,
-0.561326, 0.8889945, 0.2800377, 0, 0, 0, 1, 1,
-0.5589573, -0.02617225, -2.593563, 0, 0, 0, 1, 1,
-0.54913, -0.05353534, -1.582925, 0, 0, 0, 1, 1,
-0.5489174, -0.2777718, -1.62506, 0, 0, 0, 1, 1,
-0.5383261, -0.1499228, -2.875092, 0, 0, 0, 1, 1,
-0.5376211, -0.5569032, -2.14781, 0, 0, 0, 1, 1,
-0.5343325, -1.027049, -4.480277, 0, 0, 0, 1, 1,
-0.5336226, -0.9825232, -3.517269, 1, 1, 1, 1, 1,
-0.5333533, 0.6755875, -1.36343, 1, 1, 1, 1, 1,
-0.5286649, 0.0698055, -1.023597, 1, 1, 1, 1, 1,
-0.5281175, -0.1049299, -2.252571, 1, 1, 1, 1, 1,
-0.5256526, 0.4682059, 0.4166737, 1, 1, 1, 1, 1,
-0.5229287, 0.4648182, -1.395383, 1, 1, 1, 1, 1,
-0.5214889, 0.4857818, -2.236292, 1, 1, 1, 1, 1,
-0.5163358, 1.594579, -0.2201539, 1, 1, 1, 1, 1,
-0.516087, -1.573005, -4.045924, 1, 1, 1, 1, 1,
-0.5149971, 1.355296, -0.5467586, 1, 1, 1, 1, 1,
-0.5144541, -0.2207252, -2.925364, 1, 1, 1, 1, 1,
-0.5112287, -0.5060306, -0.292938, 1, 1, 1, 1, 1,
-0.4910195, 0.6618003, -0.537733, 1, 1, 1, 1, 1,
-0.4885452, -0.8789093, -1.985488, 1, 1, 1, 1, 1,
-0.4872272, -1.228918, -3.586188, 1, 1, 1, 1, 1,
-0.4870052, 1.138403, -0.6863108, 0, 0, 1, 1, 1,
-0.4833611, -0.4454471, -2.081526, 1, 0, 0, 1, 1,
-0.4825628, -0.9407589, -3.378314, 1, 0, 0, 1, 1,
-0.4703727, 0.08681653, -0.3300823, 1, 0, 0, 1, 1,
-0.4685473, -0.3898044, -1.219494, 1, 0, 0, 1, 1,
-0.4684043, 0.359553, 0.1034629, 1, 0, 0, 1, 1,
-0.467355, -0.4897084, -1.264171, 0, 0, 0, 1, 1,
-0.467063, 1.762331, -1.28224, 0, 0, 0, 1, 1,
-0.4660797, -1.131901, -0.43767, 0, 0, 0, 1, 1,
-0.4647596, 0.03212058, -2.143588, 0, 0, 0, 1, 1,
-0.4572578, -0.8423266, -2.533663, 0, 0, 0, 1, 1,
-0.4545574, -0.07829405, -0.3461643, 0, 0, 0, 1, 1,
-0.4544241, -0.2801147, -1.771206, 0, 0, 0, 1, 1,
-0.4541482, 1.06892, -0.03984652, 1, 1, 1, 1, 1,
-0.4516832, 0.904094, 0.2309476, 1, 1, 1, 1, 1,
-0.4504916, 0.2602684, -1.828457, 1, 1, 1, 1, 1,
-0.4488617, 1.211347, -2.848273, 1, 1, 1, 1, 1,
-0.4421393, -0.2137655, -1.471867, 1, 1, 1, 1, 1,
-0.4401368, 0.9084829, 1.1986, 1, 1, 1, 1, 1,
-0.4305897, -1.703407, -2.235893, 1, 1, 1, 1, 1,
-0.4268105, -0.4581732, -3.139855, 1, 1, 1, 1, 1,
-0.4265397, 1.257055, -0.1240517, 1, 1, 1, 1, 1,
-0.423564, 1.523477, -0.7960617, 1, 1, 1, 1, 1,
-0.4228696, -0.708201, -0.6112215, 1, 1, 1, 1, 1,
-0.4228554, 0.8828219, 0.6108198, 1, 1, 1, 1, 1,
-0.4225631, -0.77366, -3.156094, 1, 1, 1, 1, 1,
-0.4168499, -0.2571631, -4.239482, 1, 1, 1, 1, 1,
-0.4165644, -0.978089, -1.432395, 1, 1, 1, 1, 1,
-0.411187, -0.5987803, -2.383082, 0, 0, 1, 1, 1,
-0.4052521, 1.737401, -0.6766694, 1, 0, 0, 1, 1,
-0.4044866, 0.3897121, -0.5266873, 1, 0, 0, 1, 1,
-0.3985461, 0.815144, -2.52176, 1, 0, 0, 1, 1,
-0.3983964, 0.4027019, -2.175914, 1, 0, 0, 1, 1,
-0.3939242, 1.19901, 0.9469073, 1, 0, 0, 1, 1,
-0.3927381, 1.585468, -1.901252, 0, 0, 0, 1, 1,
-0.3920662, 1.596889, 0.1464991, 0, 0, 0, 1, 1,
-0.3906882, -0.5049088, -1.851147, 0, 0, 0, 1, 1,
-0.3825519, 1.679566, -0.5349312, 0, 0, 0, 1, 1,
-0.3814036, 1.417352, -1.652484, 0, 0, 0, 1, 1,
-0.3760859, -0.4455987, -3.624211, 0, 0, 0, 1, 1,
-0.3740901, 1.601703, 0.6461454, 0, 0, 0, 1, 1,
-0.3681996, -0.657814, -4.063391, 1, 1, 1, 1, 1,
-0.3662646, -0.2841758, -1.830311, 1, 1, 1, 1, 1,
-0.3633368, -0.4585237, -3.118919, 1, 1, 1, 1, 1,
-0.3618361, -0.1033255, -0.0002476079, 1, 1, 1, 1, 1,
-0.3597718, 0.775236, -0.8413987, 1, 1, 1, 1, 1,
-0.3594409, -0.8739204, -3.542546, 1, 1, 1, 1, 1,
-0.3570202, -0.9860993, -1.900631, 1, 1, 1, 1, 1,
-0.348745, -1.44101, -2.418307, 1, 1, 1, 1, 1,
-0.33694, 1.302717, -0.2209821, 1, 1, 1, 1, 1,
-0.3353588, 0.4092651, 0.04735998, 1, 1, 1, 1, 1,
-0.3326752, 1.458206, 0.03042818, 1, 1, 1, 1, 1,
-0.3259268, 0.05973056, -3.935457, 1, 1, 1, 1, 1,
-0.3254789, -1.112733, -3.569724, 1, 1, 1, 1, 1,
-0.3229592, 0.7981169, -0.5326802, 1, 1, 1, 1, 1,
-0.3224655, 0.8688967, -0.4978522, 1, 1, 1, 1, 1,
-0.3204939, -0.7407384, -3.380065, 0, 0, 1, 1, 1,
-0.3190086, -0.3179106, -1.459633, 1, 0, 0, 1, 1,
-0.3171309, -1.015694, -2.710129, 1, 0, 0, 1, 1,
-0.3014044, -0.212777, -1.309902, 1, 0, 0, 1, 1,
-0.3001075, 1.588789, -0.5447391, 1, 0, 0, 1, 1,
-0.299268, 0.01269774, -0.1833678, 1, 0, 0, 1, 1,
-0.2931994, -0.2727092, -2.394929, 0, 0, 0, 1, 1,
-0.2904864, -0.7285387, -4.968106, 0, 0, 0, 1, 1,
-0.2876925, 0.6659208, -1.516903, 0, 0, 0, 1, 1,
-0.2830782, 0.6471346, -0.1171048, 0, 0, 0, 1, 1,
-0.2828053, -3.403988, -3.499417, 0, 0, 0, 1, 1,
-0.2822348, -0.7797428, -2.749283, 0, 0, 0, 1, 1,
-0.2765774, -0.09491806, -3.023059, 0, 0, 0, 1, 1,
-0.2764956, 0.3875796, -2.62937, 1, 1, 1, 1, 1,
-0.2652014, -1.031639, -1.695102, 1, 1, 1, 1, 1,
-0.2642987, 0.08830789, -2.494975, 1, 1, 1, 1, 1,
-0.2636402, 0.06573953, -1.68303, 1, 1, 1, 1, 1,
-0.2611824, -0.230545, -4.190042, 1, 1, 1, 1, 1,
-0.2611056, -0.9799185, -3.094818, 1, 1, 1, 1, 1,
-0.2559819, 0.9862379, -0.8541155, 1, 1, 1, 1, 1,
-0.2536649, -1.067792, -1.61818, 1, 1, 1, 1, 1,
-0.2525197, 1.314807, -0.7313566, 1, 1, 1, 1, 1,
-0.2523154, -1.832317, -3.216236, 1, 1, 1, 1, 1,
-0.2468538, -0.453512, -2.867801, 1, 1, 1, 1, 1,
-0.2467984, 0.6893846, 0.845551, 1, 1, 1, 1, 1,
-0.2452825, 0.2446065, -0.1015299, 1, 1, 1, 1, 1,
-0.2452158, 0.4383092, 0.9853271, 1, 1, 1, 1, 1,
-0.24386, 0.5445476, 0.3087684, 1, 1, 1, 1, 1,
-0.2429849, 0.4716524, 0.3922655, 0, 0, 1, 1, 1,
-0.2275242, 1.778074, -0.1289381, 1, 0, 0, 1, 1,
-0.2264697, 0.07731357, -0.2138514, 1, 0, 0, 1, 1,
-0.2254086, -0.02317192, -2.590541, 1, 0, 0, 1, 1,
-0.224941, 0.7111815, 0.221933, 1, 0, 0, 1, 1,
-0.2223279, -2.015208, -3.353701, 1, 0, 0, 1, 1,
-0.2085303, -0.5163007, -2.99545, 0, 0, 0, 1, 1,
-0.2082334, 1.560354, 0.3126521, 0, 0, 0, 1, 1,
-0.2082286, -0.1805042, -2.8198, 0, 0, 0, 1, 1,
-0.207115, 0.2854086, -0.8838422, 0, 0, 0, 1, 1,
-0.2014092, -0.3382686, -2.127838, 0, 0, 0, 1, 1,
-0.1990776, 1.061663, 1.186123, 0, 0, 0, 1, 1,
-0.1985237, -0.9011596, -2.972047, 0, 0, 0, 1, 1,
-0.1966338, -1.213996, -3.183443, 1, 1, 1, 1, 1,
-0.1934621, 0.3961179, -0.5142478, 1, 1, 1, 1, 1,
-0.1914855, -0.9487324, -1.73563, 1, 1, 1, 1, 1,
-0.1850065, 0.06079428, -2.974139, 1, 1, 1, 1, 1,
-0.1832876, 1.071605, 0.1311564, 1, 1, 1, 1, 1,
-0.1811335, 0.3385752, 0.3710862, 1, 1, 1, 1, 1,
-0.1806288, -0.02890975, -0.9459038, 1, 1, 1, 1, 1,
-0.1792154, -0.03899403, 0.06978637, 1, 1, 1, 1, 1,
-0.1790945, 0.9308642, 0.1170493, 1, 1, 1, 1, 1,
-0.1757665, 0.5652782, -0.1082961, 1, 1, 1, 1, 1,
-0.1746193, 1.73128, 0.7841653, 1, 1, 1, 1, 1,
-0.1736207, -1.145058, -1.957561, 1, 1, 1, 1, 1,
-0.1723534, -0.5692951, -3.926976, 1, 1, 1, 1, 1,
-0.1722588, 0.9047978, -0.8438352, 1, 1, 1, 1, 1,
-0.171493, -0.005814064, -1.578665, 1, 1, 1, 1, 1,
-0.1680831, 0.3124425, -0.006194492, 0, 0, 1, 1, 1,
-0.1661057, 1.637024, -1.062885, 1, 0, 0, 1, 1,
-0.1657645, 0.164973, -0.4957233, 1, 0, 0, 1, 1,
-0.1594987, 0.9970852, 1.079321, 1, 0, 0, 1, 1,
-0.1581209, 0.9410514, 1.214486, 1, 0, 0, 1, 1,
-0.157572, 1.430493, 2.0064, 1, 0, 0, 1, 1,
-0.1538192, -2.527867, -1.513779, 0, 0, 0, 1, 1,
-0.1447945, 2.144565, 0.739155, 0, 0, 0, 1, 1,
-0.1443573, 0.2090208, -0.7696927, 0, 0, 0, 1, 1,
-0.1435921, 2.050611, -0.2714587, 0, 0, 0, 1, 1,
-0.1350586, -0.09547541, -0.1893045, 0, 0, 0, 1, 1,
-0.1329143, 1.229591, -0.3405923, 0, 0, 0, 1, 1,
-0.1327732, -0.6282834, -2.906553, 0, 0, 0, 1, 1,
-0.1326486, -0.6382219, -3.64173, 1, 1, 1, 1, 1,
-0.130889, -0.6109298, -3.057392, 1, 1, 1, 1, 1,
-0.1273798, -0.4252662, -3.664713, 1, 1, 1, 1, 1,
-0.1246143, -0.02447025, -0.1733185, 1, 1, 1, 1, 1,
-0.1210106, -0.643009, -5.741322, 1, 1, 1, 1, 1,
-0.1203947, 0.03001056, -1.691026, 1, 1, 1, 1, 1,
-0.1199334, -0.5762223, -5.209677, 1, 1, 1, 1, 1,
-0.1165058, 0.1826418, -1.304334, 1, 1, 1, 1, 1,
-0.1136768, -0.2866839, -4.504597, 1, 1, 1, 1, 1,
-0.1134401, 0.7955704, -0.156197, 1, 1, 1, 1, 1,
-0.1113293, 0.8111776, -0.280942, 1, 1, 1, 1, 1,
-0.1076807, -0.6857048, -1.28694, 1, 1, 1, 1, 1,
-0.1050154, -0.1115439, -3.947204, 1, 1, 1, 1, 1,
-0.1030083, 0.4141725, -0.6254044, 1, 1, 1, 1, 1,
-0.1023831, 0.2730651, 1.385573, 1, 1, 1, 1, 1,
-0.1012511, 0.3573724, -0.2343668, 0, 0, 1, 1, 1,
-0.1008438, -0.1234557, -4.400885, 1, 0, 0, 1, 1,
-0.1004378, -0.2602892, -2.454917, 1, 0, 0, 1, 1,
-0.09949359, -0.1839748, -1.865067, 1, 0, 0, 1, 1,
-0.09944122, -1.273597, -5.530429, 1, 0, 0, 1, 1,
-0.09903568, 0.8439463, -0.509383, 1, 0, 0, 1, 1,
-0.09639816, 1.475271, -2.278734, 0, 0, 0, 1, 1,
-0.09387975, -0.8146302, -3.551404, 0, 0, 0, 1, 1,
-0.0925115, -0.0129217, -2.54248, 0, 0, 0, 1, 1,
-0.09229695, -0.6733378, -1.650641, 0, 0, 0, 1, 1,
-0.0922787, -1.068315, -3.003597, 0, 0, 0, 1, 1,
-0.08911345, 0.9653056, -0.41773, 0, 0, 0, 1, 1,
-0.0851845, -0.9265636, -3.042835, 0, 0, 0, 1, 1,
-0.08009581, 0.8096535, 0.02432457, 1, 1, 1, 1, 1,
-0.07786036, -0.09609169, -1.510896, 1, 1, 1, 1, 1,
-0.07714181, 0.313642, 0.01435836, 1, 1, 1, 1, 1,
-0.07633412, -0.3603459, -2.780867, 1, 1, 1, 1, 1,
-0.07465883, 0.3852835, -0.7355266, 1, 1, 1, 1, 1,
-0.07432026, -1.939264, -3.388827, 1, 1, 1, 1, 1,
-0.0702305, -0.6392896, -3.612086, 1, 1, 1, 1, 1,
-0.05637546, 0.0360621, -1.620458, 1, 1, 1, 1, 1,
-0.05562377, 0.9157531, -0.2104525, 1, 1, 1, 1, 1,
-0.05464942, 0.9916869, 1.776507, 1, 1, 1, 1, 1,
-0.05429198, 0.0230971, 0.06250811, 1, 1, 1, 1, 1,
-0.05428163, -0.08887025, -2.773306, 1, 1, 1, 1, 1,
-0.05330026, -0.08076665, -3.027487, 1, 1, 1, 1, 1,
-0.05091501, 1.195291, -1.215734, 1, 1, 1, 1, 1,
-0.04929332, -0.3102378, -2.281891, 1, 1, 1, 1, 1,
-0.04621679, 1.064362, -0.1989542, 0, 0, 1, 1, 1,
-0.04620562, -0.2181161, -4.072501, 1, 0, 0, 1, 1,
-0.03950031, 1.570459, 1.136392, 1, 0, 0, 1, 1,
-0.03816389, 1.32135, -1.907198, 1, 0, 0, 1, 1,
-0.03730059, -0.2393609, -3.334516, 1, 0, 0, 1, 1,
-0.03354816, -0.2719995, -4.000391, 1, 0, 0, 1, 1,
-0.03266756, 0.8427348, -1.335897, 0, 0, 0, 1, 1,
-0.03209757, -1.061637, -2.499969, 0, 0, 0, 1, 1,
-0.03205014, 0.1751576, -0.8913037, 0, 0, 0, 1, 1,
-0.03126534, 1.933444, 1.422438, 0, 0, 0, 1, 1,
-0.03122765, 0.1692291, -0.225841, 0, 0, 0, 1, 1,
-0.02792282, 0.02309556, -0.2021836, 0, 0, 0, 1, 1,
-0.02625693, -0.6161143, -2.957058, 0, 0, 0, 1, 1,
-0.02536879, 0.4356884, -1.068669, 1, 1, 1, 1, 1,
-0.0248225, -0.6171981, -3.221097, 1, 1, 1, 1, 1,
-0.02313785, 0.7220989, 0.5550088, 1, 1, 1, 1, 1,
-0.01814519, -1.215506, -2.238043, 1, 1, 1, 1, 1,
-0.01726753, 0.08208451, 0.1147176, 1, 1, 1, 1, 1,
-0.01724685, 0.2163899, 0.03999244, 1, 1, 1, 1, 1,
-0.01348932, -0.6433309, -1.789081, 1, 1, 1, 1, 1,
-0.01161995, 2.404803, 0.6627663, 1, 1, 1, 1, 1,
-0.009695241, 1.130075, 0.8605092, 1, 1, 1, 1, 1,
-0.005131695, 0.3087729, 0.4050334, 1, 1, 1, 1, 1,
-0.002676367, -0.4695998, -3.00509, 1, 1, 1, 1, 1,
-0.0009062554, 0.1601482, 0.3867511, 1, 1, 1, 1, 1,
-0.0006426973, 0.069318, -0.2082021, 1, 1, 1, 1, 1,
0.002614262, 0.359768, 1.305928, 1, 1, 1, 1, 1,
0.003121064, -0.4232898, 3.280387, 1, 1, 1, 1, 1,
0.003661146, 1.052755, -1.17472, 0, 0, 1, 1, 1,
0.003960306, -1.430782, 3.201169, 1, 0, 0, 1, 1,
0.01562408, -1.860194, 2.563682, 1, 0, 0, 1, 1,
0.01613747, -1.827992, 3.016957, 1, 0, 0, 1, 1,
0.01763828, -1.557039, 2.036412, 1, 0, 0, 1, 1,
0.01806976, -0.1247867, 1.988181, 1, 0, 0, 1, 1,
0.01852511, 0.5166448, 0.6821896, 0, 0, 0, 1, 1,
0.02212153, -0.5053965, 3.10146, 0, 0, 0, 1, 1,
0.02220534, 0.2349862, 0.542945, 0, 0, 0, 1, 1,
0.02289953, -1.318506, 3.469363, 0, 0, 0, 1, 1,
0.02547948, -1.880065, 3.585777, 0, 0, 0, 1, 1,
0.0291349, 0.6382966, 0.1419312, 0, 0, 0, 1, 1,
0.03244599, 1.024786, 1.143207, 0, 0, 0, 1, 1,
0.03388982, 1.241899, 0.8818345, 1, 1, 1, 1, 1,
0.03526418, -0.114497, 3.06955, 1, 1, 1, 1, 1,
0.03592893, -0.914519, 3.248028, 1, 1, 1, 1, 1,
0.03905077, -1.03495, 3.82572, 1, 1, 1, 1, 1,
0.04005094, -0.534559, 2.952639, 1, 1, 1, 1, 1,
0.04008094, -2.051817, 3.792273, 1, 1, 1, 1, 1,
0.0405866, 0.904402, 0.04185642, 1, 1, 1, 1, 1,
0.04452731, 1.403112, 0.7443065, 1, 1, 1, 1, 1,
0.0520115, -1.675466, 4.714274, 1, 1, 1, 1, 1,
0.05354824, -0.3814372, 2.442276, 1, 1, 1, 1, 1,
0.05736877, 0.5937105, 2.413422, 1, 1, 1, 1, 1,
0.05888789, -0.4232214, 2.971478, 1, 1, 1, 1, 1,
0.08057681, -0.8155458, 4.167817, 1, 1, 1, 1, 1,
0.08067095, 1.532246, 0.9393214, 1, 1, 1, 1, 1,
0.0845475, 1.823664, 1.157761, 1, 1, 1, 1, 1,
0.08865196, -0.6896389, 4.028976, 0, 0, 1, 1, 1,
0.08894106, -1.197487, 1.360821, 1, 0, 0, 1, 1,
0.09042505, 0.8797309, 0.5041209, 1, 0, 0, 1, 1,
0.09130065, 0.8351344, -0.1109847, 1, 0, 0, 1, 1,
0.1001761, 2.429269, 1.355808, 1, 0, 0, 1, 1,
0.1011479, -0.9148624, 2.880419, 1, 0, 0, 1, 1,
0.1035787, 0.1206503, 1.864974, 0, 0, 0, 1, 1,
0.1066183, 0.5493257, 0.06154154, 0, 0, 0, 1, 1,
0.1097858, 0.02109413, -1.069569, 0, 0, 0, 1, 1,
0.1117261, 0.9307131, 0.2613806, 0, 0, 0, 1, 1,
0.1129985, 0.2590281, -0.6957887, 0, 0, 0, 1, 1,
0.1199905, 0.9005704, 0.03079347, 0, 0, 0, 1, 1,
0.1200414, 0.8387359, 0.7848287, 0, 0, 0, 1, 1,
0.1261515, -3.067751, 2.813774, 1, 1, 1, 1, 1,
0.1273484, 0.08800947, 1.115185, 1, 1, 1, 1, 1,
0.1279105, -0.8231532, 3.584094, 1, 1, 1, 1, 1,
0.135147, 0.2229008, 1.198245, 1, 1, 1, 1, 1,
0.1405771, 0.1452785, 1.770622, 1, 1, 1, 1, 1,
0.1427841, 0.5582375, -0.1984302, 1, 1, 1, 1, 1,
0.1566679, -0.8338881, 1.066161, 1, 1, 1, 1, 1,
0.1617835, -1.056589, 3.355588, 1, 1, 1, 1, 1,
0.1630476, 0.7933679, -0.8563514, 1, 1, 1, 1, 1,
0.165181, 0.2011368, -0.4646032, 1, 1, 1, 1, 1,
0.1658435, 0.8002131, -0.8047136, 1, 1, 1, 1, 1,
0.1679701, -0.151895, 3.746419, 1, 1, 1, 1, 1,
0.1725324, 0.1174404, 2.232037, 1, 1, 1, 1, 1,
0.1795694, 0.5394549, 1.214886, 1, 1, 1, 1, 1,
0.180107, 0.3573292, -0.5912157, 1, 1, 1, 1, 1,
0.1801449, 0.05403701, 2.192905, 0, 0, 1, 1, 1,
0.1908592, 0.591583, -0.8989006, 1, 0, 0, 1, 1,
0.2010444, -0.6771952, 2.094995, 1, 0, 0, 1, 1,
0.2018591, -0.1120964, 1.840743, 1, 0, 0, 1, 1,
0.2031966, -1.14449, 2.671571, 1, 0, 0, 1, 1,
0.2042287, 2.477834, 0.2640269, 1, 0, 0, 1, 1,
0.2048552, -0.908612, 2.701891, 0, 0, 0, 1, 1,
0.2230488, -0.765714, 3.993071, 0, 0, 0, 1, 1,
0.2261145, 0.8568175, 0.6930073, 0, 0, 0, 1, 1,
0.2281564, 1.473292, -1.430859, 0, 0, 0, 1, 1,
0.2297594, 0.4084843, 0.2216043, 0, 0, 0, 1, 1,
0.2317445, -2.133912, 2.231528, 0, 0, 0, 1, 1,
0.2332785, 0.3789582, 0.8920574, 0, 0, 0, 1, 1,
0.2378896, 1.195508, -1.076137, 1, 1, 1, 1, 1,
0.2424674, 2.549412, 0.3082685, 1, 1, 1, 1, 1,
0.2440095, -1.131762, 3.473043, 1, 1, 1, 1, 1,
0.2447479, -1.750488, 3.124008, 1, 1, 1, 1, 1,
0.2448369, -2.233554, 1.881372, 1, 1, 1, 1, 1,
0.2468413, 0.2057455, 0.9991615, 1, 1, 1, 1, 1,
0.2487699, 0.1753351, 1.530032, 1, 1, 1, 1, 1,
0.2500918, 1.206984, 0.2240916, 1, 1, 1, 1, 1,
0.2529192, 0.8646094, 0.07045641, 1, 1, 1, 1, 1,
0.2529792, 1.558811, -0.8586205, 1, 1, 1, 1, 1,
0.2557378, 2.261043, -0.9953871, 1, 1, 1, 1, 1,
0.2596521, 0.8967982, -0.9422226, 1, 1, 1, 1, 1,
0.2632963, 0.2562709, 1.456283, 1, 1, 1, 1, 1,
0.2691098, -1.189907, 1.572034, 1, 1, 1, 1, 1,
0.2732274, -0.8292632, 4.180331, 1, 1, 1, 1, 1,
0.2756502, -0.3377357, 2.074851, 0, 0, 1, 1, 1,
0.2783715, -0.5976627, 2.148888, 1, 0, 0, 1, 1,
0.2791383, -0.3232137, 2.29528, 1, 0, 0, 1, 1,
0.2832178, -0.148648, 2.126301, 1, 0, 0, 1, 1,
0.2836305, -0.06670311, 1.710205, 1, 0, 0, 1, 1,
0.285714, -0.1363208, 1.711681, 1, 0, 0, 1, 1,
0.2882437, 0.9415733, 0.5379078, 0, 0, 0, 1, 1,
0.2894692, -0.9083081, 3.273274, 0, 0, 0, 1, 1,
0.2914345, -1.159746, 1.205272, 0, 0, 0, 1, 1,
0.2936302, 1.196761, -0.1973837, 0, 0, 0, 1, 1,
0.2955251, 1.785703, 1.547789, 0, 0, 0, 1, 1,
0.2965111, -0.3754148, 3.4429, 0, 0, 0, 1, 1,
0.2965745, 0.801719, 1.767705, 0, 0, 0, 1, 1,
0.2966058, 0.177529, 0.4871122, 1, 1, 1, 1, 1,
0.3034227, 0.9432648, 1.506919, 1, 1, 1, 1, 1,
0.3045822, 1.506891, -0.251039, 1, 1, 1, 1, 1,
0.3054956, -1.224533, 2.696051, 1, 1, 1, 1, 1,
0.3062514, 1.180141, -1.447212, 1, 1, 1, 1, 1,
0.3078184, 0.8930339, 1.078902, 1, 1, 1, 1, 1,
0.3142402, 0.2571946, 0.9540963, 1, 1, 1, 1, 1,
0.3165152, 0.2383818, 1.049885, 1, 1, 1, 1, 1,
0.3185326, -0.170504, 0.07987748, 1, 1, 1, 1, 1,
0.3203452, 1.61025, -1.017019, 1, 1, 1, 1, 1,
0.3232796, -0.02157973, 2.589122, 1, 1, 1, 1, 1,
0.3236735, -0.57085, 2.45566, 1, 1, 1, 1, 1,
0.3241458, -0.7544231, 3.70557, 1, 1, 1, 1, 1,
0.3242224, -0.5421472, 4.175304, 1, 1, 1, 1, 1,
0.3265241, 0.4603133, -0.3817779, 1, 1, 1, 1, 1,
0.3283208, -1.295969, 3.31904, 0, 0, 1, 1, 1,
0.3316006, 0.06607562, 1.616308, 1, 0, 0, 1, 1,
0.3355874, 0.2213207, 0.5874383, 1, 0, 0, 1, 1,
0.3376796, 0.0396302, 0.2434477, 1, 0, 0, 1, 1,
0.3412791, -0.7189502, 2.956697, 1, 0, 0, 1, 1,
0.3441758, -1.746556, 2.27916, 1, 0, 0, 1, 1,
0.3459897, -0.05260265, 2.053581, 0, 0, 0, 1, 1,
0.3462867, 0.8431829, -0.7578097, 0, 0, 0, 1, 1,
0.3464313, 1.878492, -0.1193019, 0, 0, 0, 1, 1,
0.3604994, 1.155638, 1.409055, 0, 0, 0, 1, 1,
0.364216, 0.6912218, 1.309958, 0, 0, 0, 1, 1,
0.3682421, 1.189823, 0.3398527, 0, 0, 0, 1, 1,
0.374976, -1.137893, 2.977247, 0, 0, 0, 1, 1,
0.3781452, 1.472278, -0.8504439, 1, 1, 1, 1, 1,
0.3822732, 0.8634006, 0.4652939, 1, 1, 1, 1, 1,
0.3854532, 0.3505571, -0.5735274, 1, 1, 1, 1, 1,
0.3859872, 0.3518554, -0.8076669, 1, 1, 1, 1, 1,
0.3890558, -0.9133893, 1.121213, 1, 1, 1, 1, 1,
0.3890755, 0.08537056, 0.9043375, 1, 1, 1, 1, 1,
0.3894174, -2.437536, 4.41961, 1, 1, 1, 1, 1,
0.3904373, 0.4713529, 0.8836757, 1, 1, 1, 1, 1,
0.3929726, 1.288928, 0.5074223, 1, 1, 1, 1, 1,
0.393433, 0.5410646, 1.886414, 1, 1, 1, 1, 1,
0.3974704, -0.756521, 1.623475, 1, 1, 1, 1, 1,
0.3977453, -0.003117248, 1.475127, 1, 1, 1, 1, 1,
0.4011708, 1.015067, -0.3029577, 1, 1, 1, 1, 1,
0.401219, 0.536108, -0.4910838, 1, 1, 1, 1, 1,
0.4117939, -0.6996173, 3.47664, 1, 1, 1, 1, 1,
0.4120525, 0.3937388, 0.4021687, 0, 0, 1, 1, 1,
0.4137782, 0.5298855, -0.09843492, 1, 0, 0, 1, 1,
0.4214016, 0.2870533, 0.8210786, 1, 0, 0, 1, 1,
0.4214886, -1.157124, 3.077105, 1, 0, 0, 1, 1,
0.4223529, 0.4361177, -1.067922, 1, 0, 0, 1, 1,
0.422387, 0.8056792, -0.3523527, 1, 0, 0, 1, 1,
0.4295798, 1.666949, -0.09147752, 0, 0, 0, 1, 1,
0.4298739, 0.2905138, -0.001411405, 0, 0, 0, 1, 1,
0.4318037, -0.1408039, 2.968539, 0, 0, 0, 1, 1,
0.4337273, -0.3713954, 1.547583, 0, 0, 0, 1, 1,
0.4346218, 1.168552, -0.5589669, 0, 0, 0, 1, 1,
0.4352126, -1.121297, 2.67204, 0, 0, 0, 1, 1,
0.4368214, 0.3676118, 0.7090451, 0, 0, 0, 1, 1,
0.4456945, 2.699435, 1.026795, 1, 1, 1, 1, 1,
0.4486908, -2.22168, 2.107274, 1, 1, 1, 1, 1,
0.4498642, 1.678418, 1.261037, 1, 1, 1, 1, 1,
0.454284, 2.128842, -0.6244441, 1, 1, 1, 1, 1,
0.4591738, 2.001714, -0.1318554, 1, 1, 1, 1, 1,
0.4593074, -0.5442602, 4.117946, 1, 1, 1, 1, 1,
0.4621508, 0.001414508, 1.791653, 1, 1, 1, 1, 1,
0.4662876, 0.3469032, 0.237635, 1, 1, 1, 1, 1,
0.4701092, -0.9326615, 2.53938, 1, 1, 1, 1, 1,
0.4770113, 0.0964802, 0.07440752, 1, 1, 1, 1, 1,
0.4833915, -2.180738, 3.099212, 1, 1, 1, 1, 1,
0.4842219, 0.2413792, 1.298995, 1, 1, 1, 1, 1,
0.4884854, 0.9189293, 1.612207, 1, 1, 1, 1, 1,
0.4892377, -1.405704, 2.396644, 1, 1, 1, 1, 1,
0.4916287, -0.1550488, 2.076266, 1, 1, 1, 1, 1,
0.4920726, 0.1529108, 0.5716786, 0, 0, 1, 1, 1,
0.4945052, 0.316497, 2.056964, 1, 0, 0, 1, 1,
0.4945538, -1.674391, 2.590631, 1, 0, 0, 1, 1,
0.4954388, 1.46512, -0.4301735, 1, 0, 0, 1, 1,
0.4982046, 0.4012301, 0.2246831, 1, 0, 0, 1, 1,
0.5087394, 0.4568221, 0.7206899, 1, 0, 0, 1, 1,
0.5178856, 2.375552, 0.05076684, 0, 0, 0, 1, 1,
0.5195272, 0.253649, 2.050865, 0, 0, 0, 1, 1,
0.5227116, -0.7940485, 0.8507313, 0, 0, 0, 1, 1,
0.5234743, -1.288676, 2.483126, 0, 0, 0, 1, 1,
0.5237928, 1.067181, 1.999515, 0, 0, 0, 1, 1,
0.5250453, 0.8219953, 0.8243154, 0, 0, 0, 1, 1,
0.5283856, 0.3603093, 1.441309, 0, 0, 0, 1, 1,
0.531349, -2.398023, 3.542375, 1, 1, 1, 1, 1,
0.5315212, -0.5366966, 2.449456, 1, 1, 1, 1, 1,
0.5334371, 1.531601, -0.4571779, 1, 1, 1, 1, 1,
0.5340335, -0.7814584, 3.102272, 1, 1, 1, 1, 1,
0.5414905, 0.7805609, 0.8591702, 1, 1, 1, 1, 1,
0.5447831, -0.7641714, 0.4286328, 1, 1, 1, 1, 1,
0.5459812, -1.886486, 1.147671, 1, 1, 1, 1, 1,
0.5485075, 0.8791184, 0.1225274, 1, 1, 1, 1, 1,
0.5528734, 1.839351, 1.520773, 1, 1, 1, 1, 1,
0.5558516, -0.3121341, 3.598127, 1, 1, 1, 1, 1,
0.5602066, -0.573712, 3.901827, 1, 1, 1, 1, 1,
0.564656, 1.211525, 0.6974438, 1, 1, 1, 1, 1,
0.5695847, 0.5077975, -0.4567386, 1, 1, 1, 1, 1,
0.5714218, -0.3475129, 1.765309, 1, 1, 1, 1, 1,
0.572366, -0.837696, 4.964, 1, 1, 1, 1, 1,
0.5793505, -1.00658, 2.782078, 0, 0, 1, 1, 1,
0.5799999, -0.2267223, 1.00847, 1, 0, 0, 1, 1,
0.5819511, -0.6418264, 1.163953, 1, 0, 0, 1, 1,
0.5825096, -1.332398, 1.984366, 1, 0, 0, 1, 1,
0.5833154, 0.7564909, 1.415413, 1, 0, 0, 1, 1,
0.5847032, -0.6205911, 2.248195, 1, 0, 0, 1, 1,
0.5868095, 0.4607362, 2.807644, 0, 0, 0, 1, 1,
0.5906264, -1.43539, 2.363156, 0, 0, 0, 1, 1,
0.591772, 1.385209, 1.506047, 0, 0, 0, 1, 1,
0.5972254, -0.3156966, 2.310787, 0, 0, 0, 1, 1,
0.599445, -1.253903, 1.341279, 0, 0, 0, 1, 1,
0.6007556, 1.501097, 0.8297924, 0, 0, 0, 1, 1,
0.6019853, 0.7644081, 1.095596, 0, 0, 0, 1, 1,
0.601996, 1.107831, 0.8886519, 1, 1, 1, 1, 1,
0.6066285, -0.3361247, 1.58511, 1, 1, 1, 1, 1,
0.615228, -1.417317, 4.001928, 1, 1, 1, 1, 1,
0.6187711, 0.06068823, 0.7749816, 1, 1, 1, 1, 1,
0.6200264, 1.079394, 0.7676895, 1, 1, 1, 1, 1,
0.6270498, 0.9413916, 0.6566814, 1, 1, 1, 1, 1,
0.6270856, -1.62882, 3.587414, 1, 1, 1, 1, 1,
0.6302952, -1.144334, 3.192019, 1, 1, 1, 1, 1,
0.632773, -1.149867, 2.357064, 1, 1, 1, 1, 1,
0.6392943, -1.470775, 2.121692, 1, 1, 1, 1, 1,
0.645208, -0.3869881, 1.552654, 1, 1, 1, 1, 1,
0.6469519, -0.1624152, 2.436843, 1, 1, 1, 1, 1,
0.6470673, 0.75423, 1.074303, 1, 1, 1, 1, 1,
0.6491941, -0.31768, 1.323585, 1, 1, 1, 1, 1,
0.6508511, -0.7035621, 2.967011, 1, 1, 1, 1, 1,
0.6527325, -0.5087284, 4.082236, 0, 0, 1, 1, 1,
0.656803, -1.168865, 2.417526, 1, 0, 0, 1, 1,
0.6583112, 1.642428, 0.7589336, 1, 0, 0, 1, 1,
0.6598529, 0.4080263, 1.283493, 1, 0, 0, 1, 1,
0.6653858, 0.2981149, 0.884999, 1, 0, 0, 1, 1,
0.6719291, 0.9682408, 1.669026, 1, 0, 0, 1, 1,
0.6736848, -1.626554, 5.080909, 0, 0, 0, 1, 1,
0.6777791, -1.913067, 2.57815, 0, 0, 0, 1, 1,
0.6790497, -0.2017332, 0.9885443, 0, 0, 0, 1, 1,
0.6811393, -0.3756053, 2.387098, 0, 0, 0, 1, 1,
0.6822134, 1.034384, 2.178852, 0, 0, 0, 1, 1,
0.692089, -1.44117, 2.496704, 0, 0, 0, 1, 1,
0.6946331, -0.6679327, 1.397228, 0, 0, 0, 1, 1,
0.698291, 0.1298987, 3.595792, 1, 1, 1, 1, 1,
0.6994596, -1.881097, 3.702862, 1, 1, 1, 1, 1,
0.7005761, -0.5033324, 2.801253, 1, 1, 1, 1, 1,
0.7014944, -0.4795508, 1.41387, 1, 1, 1, 1, 1,
0.7038448, -0.5885456, 3.376737, 1, 1, 1, 1, 1,
0.7063073, -0.6006741, 1.228167, 1, 1, 1, 1, 1,
0.7108107, -0.9851627, 2.282108, 1, 1, 1, 1, 1,
0.7132285, -0.1233137, 2.68021, 1, 1, 1, 1, 1,
0.7132788, -0.5755357, 3.690967, 1, 1, 1, 1, 1,
0.716808, 1.391142, 0.7816334, 1, 1, 1, 1, 1,
0.7193276, -1.099292, 3.812848, 1, 1, 1, 1, 1,
0.7223217, 0.1261995, 2.36553, 1, 1, 1, 1, 1,
0.7347751, -0.2251439, 3.466444, 1, 1, 1, 1, 1,
0.7421685, -0.394329, 2.881325, 1, 1, 1, 1, 1,
0.7437333, 2.044096, -0.4707644, 1, 1, 1, 1, 1,
0.7441896, -0.5468057, 1.626941, 0, 0, 1, 1, 1,
0.7452926, -0.2019382, 1.590185, 1, 0, 0, 1, 1,
0.7518087, -0.1250079, 1.789562, 1, 0, 0, 1, 1,
0.7530208, -0.2633097, 2.525972, 1, 0, 0, 1, 1,
0.7548829, -0.4216809, 2.808586, 1, 0, 0, 1, 1,
0.7565066, -1.430314, 5.108339, 1, 0, 0, 1, 1,
0.7703021, -0.6500733, 2.097276, 0, 0, 0, 1, 1,
0.7717643, -0.05551861, 2.691791, 0, 0, 0, 1, 1,
0.7725751, -0.3388986, 2.299089, 0, 0, 0, 1, 1,
0.7778569, 2.129474, 1.240619, 0, 0, 0, 1, 1,
0.7788359, 1.505302, 2.248376, 0, 0, 0, 1, 1,
0.7842224, 1.203849, 0.4152612, 0, 0, 0, 1, 1,
0.7877328, -1.710012, 2.272351, 0, 0, 0, 1, 1,
0.7903919, -0.6932576, 1.735041, 1, 1, 1, 1, 1,
0.7957801, -0.5939718, 3.388839, 1, 1, 1, 1, 1,
0.7974037, 0.9386593, 3.15459, 1, 1, 1, 1, 1,
0.7975423, -0.341151, 1.251961, 1, 1, 1, 1, 1,
0.7975962, -0.6994824, 3.911663, 1, 1, 1, 1, 1,
0.7993385, -1.887645, 3.145071, 1, 1, 1, 1, 1,
0.8043577, -0.310846, 2.084469, 1, 1, 1, 1, 1,
0.8060786, 0.5208927, 0.651916, 1, 1, 1, 1, 1,
0.8064274, -0.5896837, 0.6942677, 1, 1, 1, 1, 1,
0.807065, 0.3236488, 1.700363, 1, 1, 1, 1, 1,
0.8128521, -0.03664359, 1.2045, 1, 1, 1, 1, 1,
0.8246814, 0.6130576, 0.358741, 1, 1, 1, 1, 1,
0.8258092, 0.4674751, 2.080348, 1, 1, 1, 1, 1,
0.829773, 0.3083411, 1.341918, 1, 1, 1, 1, 1,
0.8310974, -0.2712336, 1.175176, 1, 1, 1, 1, 1,
0.8338023, -1.190634, 2.585013, 0, 0, 1, 1, 1,
0.8362691, 0.8511485, 0.1226362, 1, 0, 0, 1, 1,
0.8414759, -0.1612116, 2.01395, 1, 0, 0, 1, 1,
0.8446895, 1.206337, -0.2950924, 1, 0, 0, 1, 1,
0.8447735, -0.006416841, 0.9612212, 1, 0, 0, 1, 1,
0.8455335, 0.6967121, 2.504686, 1, 0, 0, 1, 1,
0.8461757, 1.739105, -0.3098737, 0, 0, 0, 1, 1,
0.8553985, 0.4813535, 1.028325, 0, 0, 0, 1, 1,
0.8594049, 0.595658, 0.874282, 0, 0, 0, 1, 1,
0.8603715, 0.8613412, -0.2002335, 0, 0, 0, 1, 1,
0.8646595, 1.512707, 1.692923, 0, 0, 0, 1, 1,
0.8660837, 0.2848249, 3.078452, 0, 0, 0, 1, 1,
0.8667626, -0.6743086, 1.762668, 0, 0, 0, 1, 1,
0.8695107, -1.796477, 1.494714, 1, 1, 1, 1, 1,
0.8723691, -0.2787929, 3.35702, 1, 1, 1, 1, 1,
0.8745986, -0.8647016, 0.907441, 1, 1, 1, 1, 1,
0.8761449, 0.003683817, 1.931675, 1, 1, 1, 1, 1,
0.8765333, -0.3380601, 2.913125, 1, 1, 1, 1, 1,
0.8819644, 0.5676872, 3.040206, 1, 1, 1, 1, 1,
0.890332, 0.5652219, 1.619473, 1, 1, 1, 1, 1,
0.8909296, -1.381115, 3.209262, 1, 1, 1, 1, 1,
0.8924695, 0.5780947, 2.202805, 1, 1, 1, 1, 1,
0.9028457, -0.8698028, 3.077472, 1, 1, 1, 1, 1,
0.9070379, 1.234076, -0.2979722, 1, 1, 1, 1, 1,
0.913657, 0.863315, 0.7161489, 1, 1, 1, 1, 1,
0.91528, 0.3509569, 0.06817503, 1, 1, 1, 1, 1,
0.9167963, -0.33293, 1.813845, 1, 1, 1, 1, 1,
0.9225063, 0.2839389, 0.6403968, 1, 1, 1, 1, 1,
0.9225542, 0.145211, 1.340887, 0, 0, 1, 1, 1,
0.9243352, 0.4138357, 2.046679, 1, 0, 0, 1, 1,
0.9287456, -0.8703123, 0.4877294, 1, 0, 0, 1, 1,
0.9299452, 0.9341785, 0.2257785, 1, 0, 0, 1, 1,
0.9336522, -1.017166, 1.520938, 1, 0, 0, 1, 1,
0.9483666, -0.3017755, 2.095411, 1, 0, 0, 1, 1,
0.9495896, -0.6185081, 1.292085, 0, 0, 0, 1, 1,
0.9646776, 1.703897, 0.3767862, 0, 0, 0, 1, 1,
0.9661506, -1.69512, 1.594984, 0, 0, 0, 1, 1,
0.9695776, -0.3231913, 3.084488, 0, 0, 0, 1, 1,
0.9752759, -0.3267045, 2.617867, 0, 0, 0, 1, 1,
0.9847766, 0.1685249, 2.264256, 0, 0, 0, 1, 1,
0.9912101, 1.439081, 0.3525118, 0, 0, 0, 1, 1,
1.005831, 0.5533769, 1.863502, 1, 1, 1, 1, 1,
1.010337, -1.704195, 2.550683, 1, 1, 1, 1, 1,
1.015437, 1.612421, -0.4620902, 1, 1, 1, 1, 1,
1.016131, 2.620716, -0.575033, 1, 1, 1, 1, 1,
1.019466, 0.3358301, 2.7046, 1, 1, 1, 1, 1,
1.030545, 0.4691412, 1.356401, 1, 1, 1, 1, 1,
1.034689, -1.315875, 1.777637, 1, 1, 1, 1, 1,
1.037978, -0.8283672, 2.05237, 1, 1, 1, 1, 1,
1.038191, -0.01907431, 2.977787, 1, 1, 1, 1, 1,
1.038976, -0.8540813, 2.349657, 1, 1, 1, 1, 1,
1.043647, -3.085107, 1.301126, 1, 1, 1, 1, 1,
1.046814, -1.141665, 1.210585, 1, 1, 1, 1, 1,
1.049566, 2.007969, 0.7485924, 1, 1, 1, 1, 1,
1.051185, -2.083866, 3.45379, 1, 1, 1, 1, 1,
1.052057, 0.6368206, 1.545162, 1, 1, 1, 1, 1,
1.052129, 0.3347222, 1.879342, 0, 0, 1, 1, 1,
1.05521, -0.6741421, 1.086117, 1, 0, 0, 1, 1,
1.056699, 0.4697253, 2.439698, 1, 0, 0, 1, 1,
1.058044, 1.440132, 0.6288583, 1, 0, 0, 1, 1,
1.058973, 0.6177682, -0.2692416, 1, 0, 0, 1, 1,
1.059199, -0.8747069, 3.07219, 1, 0, 0, 1, 1,
1.059353, 0.4378434, 1.107349, 0, 0, 0, 1, 1,
1.077326, 1.082747, -0.8214343, 0, 0, 0, 1, 1,
1.078451, 1.085467, 1.5236, 0, 0, 0, 1, 1,
1.079195, -1.216585, 1.509398, 0, 0, 0, 1, 1,
1.079397, 0.6605128, 0.5387549, 0, 0, 0, 1, 1,
1.081253, -1.026249, 3.13217, 0, 0, 0, 1, 1,
1.090284, 0.8041406, -0.3710184, 0, 0, 0, 1, 1,
1.091489, 1.272738, 2.538696, 1, 1, 1, 1, 1,
1.092419, 0.3746624, 0.3915914, 1, 1, 1, 1, 1,
1.092651, -0.8115057, 2.639454, 1, 1, 1, 1, 1,
1.098526, -1.256457, 1.399916, 1, 1, 1, 1, 1,
1.099486, -0.4747324, 2.154901, 1, 1, 1, 1, 1,
1.102101, 0.4346541, -0.4560426, 1, 1, 1, 1, 1,
1.102569, -1.341968, 2.367793, 1, 1, 1, 1, 1,
1.108021, 1.651816, 1.36695, 1, 1, 1, 1, 1,
1.109777, 0.539288, -0.1656775, 1, 1, 1, 1, 1,
1.11748, -0.7369487, 3.838689, 1, 1, 1, 1, 1,
1.118604, -0.9827468, 2.466417, 1, 1, 1, 1, 1,
1.123139, -0.5460635, 1.359321, 1, 1, 1, 1, 1,
1.127114, -1.103686, 3.443425, 1, 1, 1, 1, 1,
1.129924, 0.4060255, 0.006268336, 1, 1, 1, 1, 1,
1.133557, -1.406374, 2.098401, 1, 1, 1, 1, 1,
1.133829, 0.2056685, 0.4979865, 0, 0, 1, 1, 1,
1.142112, -0.1097447, 1.701717, 1, 0, 0, 1, 1,
1.147612, 0.125368, 1.995839, 1, 0, 0, 1, 1,
1.159346, 0.7194308, -0.4502001, 1, 0, 0, 1, 1,
1.163169, 1.314034, 1.802305, 1, 0, 0, 1, 1,
1.165741, -0.9685999, 3.341974, 1, 0, 0, 1, 1,
1.167262, -0.3344809, 2.448124, 0, 0, 0, 1, 1,
1.17074, 0.1253588, 0.4337261, 0, 0, 0, 1, 1,
1.17694, 0.7167238, 0.7463946, 0, 0, 0, 1, 1,
1.18082, -1.413337, 3.206829, 0, 0, 0, 1, 1,
1.184925, -0.2908618, 1.04869, 0, 0, 0, 1, 1,
1.188155, -0.1629712, 0.5044476, 0, 0, 0, 1, 1,
1.195718, -1.884257, 3.902494, 0, 0, 0, 1, 1,
1.196769, -0.7321054, 2.805292, 1, 1, 1, 1, 1,
1.200024, 0.342393, 1.994259, 1, 1, 1, 1, 1,
1.213137, -1.769287, 2.839267, 1, 1, 1, 1, 1,
1.221314, -0.563366, 2.194318, 1, 1, 1, 1, 1,
1.22931, -0.06550166, 2.501732, 1, 1, 1, 1, 1,
1.237524, 0.3601196, 1.019012, 1, 1, 1, 1, 1,
1.238358, 0.3730711, -1.042279, 1, 1, 1, 1, 1,
1.245428, 0.7736537, 1.390577, 1, 1, 1, 1, 1,
1.245855, -0.669714, 3.80223, 1, 1, 1, 1, 1,
1.249028, -0.6896325, 1.910846, 1, 1, 1, 1, 1,
1.249144, 0.432193, 1.720117, 1, 1, 1, 1, 1,
1.252227, 1.644282, 2.186958, 1, 1, 1, 1, 1,
1.252869, 1.273139, -0.7998266, 1, 1, 1, 1, 1,
1.259238, -0.1408461, 2.129865, 1, 1, 1, 1, 1,
1.259685, -0.24563, 3.418097, 1, 1, 1, 1, 1,
1.26021, -0.5946634, 3.724176, 0, 0, 1, 1, 1,
1.260744, -0.6985739, 0.1720108, 1, 0, 0, 1, 1,
1.269289, 1.293221, 1.069119, 1, 0, 0, 1, 1,
1.276708, -0.5032882, 2.58174, 1, 0, 0, 1, 1,
1.277659, 0.7463235, 0.2030115, 1, 0, 0, 1, 1,
1.277916, 0.8117142, 1.009995, 1, 0, 0, 1, 1,
1.280783, -1.550698, 2.999382, 0, 0, 0, 1, 1,
1.287825, 1.144635, 1.500729, 0, 0, 0, 1, 1,
1.298759, 2.251304, 1.910817, 0, 0, 0, 1, 1,
1.305889, -0.3130396, 2.26897, 0, 0, 0, 1, 1,
1.306631, 0.579195, 0.7620015, 0, 0, 0, 1, 1,
1.31046, 1.136505, 0.4594941, 0, 0, 0, 1, 1,
1.312136, 0.6977276, 0.9401743, 0, 0, 0, 1, 1,
1.32348, -0.004812954, 1.340859, 1, 1, 1, 1, 1,
1.328893, -0.8244931, 3.301738, 1, 1, 1, 1, 1,
1.336774, -0.5557059, 1.283873, 1, 1, 1, 1, 1,
1.354774, -0.2569458, 1.703754, 1, 1, 1, 1, 1,
1.361494, 1.558333, -0.1784989, 1, 1, 1, 1, 1,
1.36447, -0.4794802, 2.327705, 1, 1, 1, 1, 1,
1.36644, 1.836992, 1.55399, 1, 1, 1, 1, 1,
1.368555, 0.47091, 0.7195965, 1, 1, 1, 1, 1,
1.374281, 1.25244, 0.1436669, 1, 1, 1, 1, 1,
1.375626, 1.044055, 0.6898271, 1, 1, 1, 1, 1,
1.387307, -0.4017445, 2.057545, 1, 1, 1, 1, 1,
1.392252, -0.4084923, 1.744621, 1, 1, 1, 1, 1,
1.393498, -0.3876665, 2.422827, 1, 1, 1, 1, 1,
1.396468, -0.4027474, 2.477358, 1, 1, 1, 1, 1,
1.412696, -0.569251, 1.199124, 1, 1, 1, 1, 1,
1.416952, 0.6913972, -0.4479156, 0, 0, 1, 1, 1,
1.419495, 0.6536975, -0.1814747, 1, 0, 0, 1, 1,
1.421407, 0.09287897, 2.189885, 1, 0, 0, 1, 1,
1.426202, 1.458907, 1.868005, 1, 0, 0, 1, 1,
1.427855, -0.2581416, 1.164545, 1, 0, 0, 1, 1,
1.441003, -0.3530171, 3.337472, 1, 0, 0, 1, 1,
1.448025, -0.6374542, 2.295807, 0, 0, 0, 1, 1,
1.454858, 0.985215, 0.7873711, 0, 0, 0, 1, 1,
1.459317, -1.269359, 1.594022, 0, 0, 0, 1, 1,
1.482038, 1.157393, 1.737392, 0, 0, 0, 1, 1,
1.495023, -0.3248881, 3.194381, 0, 0, 0, 1, 1,
1.504808, -0.8645276, 2.880409, 0, 0, 0, 1, 1,
1.508558, 1.219409, 1.362057, 0, 0, 0, 1, 1,
1.508689, -0.4248922, 0.3556031, 1, 1, 1, 1, 1,
1.537186, 0.6156029, 1.242106, 1, 1, 1, 1, 1,
1.544423, 0.6053063, 0.8255742, 1, 1, 1, 1, 1,
1.563269, 2.655771, 0.01790155, 1, 1, 1, 1, 1,
1.576917, 0.5581702, 1.835482, 1, 1, 1, 1, 1,
1.576957, 0.4094962, 0.761383, 1, 1, 1, 1, 1,
1.584545, -0.6652347, 0.8639668, 1, 1, 1, 1, 1,
1.593451, 0.6980389, 1.382718, 1, 1, 1, 1, 1,
1.606376, -0.1837597, 1.076933, 1, 1, 1, 1, 1,
1.606729, 0.6978611, 0.9317485, 1, 1, 1, 1, 1,
1.626207, 0.7373419, 0.4472872, 1, 1, 1, 1, 1,
1.629754, 0.3744589, 0.7961704, 1, 1, 1, 1, 1,
1.632932, 0.7286857, 0.9951006, 1, 1, 1, 1, 1,
1.640519, -1.393973, 2.574076, 1, 1, 1, 1, 1,
1.678224, 1.950137, -1.180664, 1, 1, 1, 1, 1,
1.68014, -1.627974, 3.184924, 0, 0, 1, 1, 1,
1.689318, 0.4336609, 1.623201, 1, 0, 0, 1, 1,
1.693252, 1.610983, 0.8257087, 1, 0, 0, 1, 1,
1.697291, 0.2584455, 1.322078, 1, 0, 0, 1, 1,
1.697373, 0.2952415, 1.459997, 1, 0, 0, 1, 1,
1.702478, -0.6784024, 1.137248, 1, 0, 0, 1, 1,
1.702883, 0.6496899, 2.376376, 0, 0, 0, 1, 1,
1.708297, -0.1144989, 2.50104, 0, 0, 0, 1, 1,
1.721645, 0.038959, 1.798252, 0, 0, 0, 1, 1,
1.74425, 0.5223195, 0.6377733, 0, 0, 0, 1, 1,
1.749478, -0.07492782, 0.5071856, 0, 0, 0, 1, 1,
1.773669, -0.6155822, 2.744556, 0, 0, 0, 1, 1,
1.792621, 0.4325013, 0.3884998, 0, 0, 0, 1, 1,
1.809335, -0.5669065, 3.116819, 1, 1, 1, 1, 1,
1.817504, -1.582967, 3.048306, 1, 1, 1, 1, 1,
1.821164, -1.281055, 1.91102, 1, 1, 1, 1, 1,
1.847852, -0.9673693, 3.253014, 1, 1, 1, 1, 1,
1.863319, 0.9579561, 2.789119, 1, 1, 1, 1, 1,
1.869476, 0.9463529, 0.9291143, 1, 1, 1, 1, 1,
1.872601, -1.347732, 4.32735, 1, 1, 1, 1, 1,
1.915486, 1.415488, 1.850036, 1, 1, 1, 1, 1,
1.921582, -1.970716, 4.672655, 1, 1, 1, 1, 1,
1.93026, 0.9179558, 0.7695539, 1, 1, 1, 1, 1,
1.942357, -1.209355, 1.348267, 1, 1, 1, 1, 1,
1.943422, 1.086369, -0.01582722, 1, 1, 1, 1, 1,
1.963187, 0.7936897, -0.8637837, 1, 1, 1, 1, 1,
1.987517, 2.992872, -0.6917531, 1, 1, 1, 1, 1,
2.016935, -1.579986, 2.700142, 1, 1, 1, 1, 1,
2.021689, -0.5661159, 1.095116, 0, 0, 1, 1, 1,
2.086196, 1.60354, -0.05257989, 1, 0, 0, 1, 1,
2.094673, 0.4638405, 0.9038485, 1, 0, 0, 1, 1,
2.144325, 0.5437249, 2.298354, 1, 0, 0, 1, 1,
2.166512, 0.8233011, 2.433021, 1, 0, 0, 1, 1,
2.1766, -0.3881484, 1.792542, 1, 0, 0, 1, 1,
2.184428, -1.040511, 1.79317, 0, 0, 0, 1, 1,
2.184638, 0.989023, 1.190179, 0, 0, 0, 1, 1,
2.28399, 1.159791, 0.9967676, 0, 0, 0, 1, 1,
2.284744, 1.482557, -0.008186948, 0, 0, 0, 1, 1,
2.301237, -2.305851, 0.6660186, 0, 0, 0, 1, 1,
2.330509, -1.172029, 2.567289, 0, 0, 0, 1, 1,
2.445148, 0.09022106, 2.059501, 0, 0, 0, 1, 1,
2.449736, 1.010914, 0.07630122, 1, 1, 1, 1, 1,
2.47636, 1.025586, 1.317177, 1, 1, 1, 1, 1,
2.558047, -0.922748, 0.8293353, 1, 1, 1, 1, 1,
2.771606, 0.4156537, 0.1979626, 1, 1, 1, 1, 1,
2.791998, -1.294364, -1.064544, 1, 1, 1, 1, 1,
2.80419, 0.2482193, 0.3359478, 1, 1, 1, 1, 1,
2.825703, 1.056207, 0.1286397, 1, 1, 1, 1, 1
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
var radius = 9.580499;
var distance = 33.6511;
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
mvMatrix.translate( 0.2914455, 0.2055581, 0.3164914 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.6511);
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
