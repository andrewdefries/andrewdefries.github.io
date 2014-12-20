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
-2.878637, -0.3619073, -2.090877, 1, 0, 0, 1,
-2.659855, -1.163582, -1.254928, 1, 0.007843138, 0, 1,
-2.614735, 1.189107, -3.429428, 1, 0.01176471, 0, 1,
-2.50714, -1.437731, -1.58709, 1, 0.01960784, 0, 1,
-2.468678, -0.7388936, -1.490277, 1, 0.02352941, 0, 1,
-2.406324, 0.3935607, -3.018498, 1, 0.03137255, 0, 1,
-2.374843, -0.1365746, -0.5962386, 1, 0.03529412, 0, 1,
-2.35897, -0.8286738, -0.8466414, 1, 0.04313726, 0, 1,
-2.341515, -0.807759, -1.247943, 1, 0.04705882, 0, 1,
-2.327421, 1.279841, 0.01018458, 1, 0.05490196, 0, 1,
-2.311291, 2.708256, -1.168535, 1, 0.05882353, 0, 1,
-2.281013, 0.488301, -2.768482, 1, 0.06666667, 0, 1,
-2.267895, 1.881375, -0.2608837, 1, 0.07058824, 0, 1,
-2.240214, 0.3037128, -2.137427, 1, 0.07843138, 0, 1,
-2.238511, 1.489734, -0.9441332, 1, 0.08235294, 0, 1,
-2.232868, 0.2468092, -1.078561, 1, 0.09019608, 0, 1,
-2.223911, -0.2836589, -2.412708, 1, 0.09411765, 0, 1,
-2.217336, 1.358193, -1.299944, 1, 0.1019608, 0, 1,
-2.137265, 1.052396, -2.950913, 1, 0.1098039, 0, 1,
-2.09115, 0.5367584, -2.88221, 1, 0.1137255, 0, 1,
-2.085133, -0.8649464, -1.375732, 1, 0.1215686, 0, 1,
-2.066331, -1.379159, -1.202613, 1, 0.1254902, 0, 1,
-2.054658, -1.425766, -1.04519, 1, 0.1333333, 0, 1,
-2.006718, -0.8818711, -1.986677, 1, 0.1372549, 0, 1,
-1.992842, 1.355752, -0.378014, 1, 0.145098, 0, 1,
-1.992507, -1.092918, -2.518375, 1, 0.1490196, 0, 1,
-1.956123, -1.712563, -1.700674, 1, 0.1568628, 0, 1,
-1.905584, 0.6729648, -2.184987, 1, 0.1607843, 0, 1,
-1.890523, 0.8823432, -2.531252, 1, 0.1686275, 0, 1,
-1.877752, 0.437571, -0.8378235, 1, 0.172549, 0, 1,
-1.855881, 6.765029e-05, -2.065955, 1, 0.1803922, 0, 1,
-1.854445, 1.398407, 0.8165931, 1, 0.1843137, 0, 1,
-1.812186, -0.3827769, -2.395011, 1, 0.1921569, 0, 1,
-1.760426, -0.5910542, -1.46206, 1, 0.1960784, 0, 1,
-1.752196, -1.717081, -0.728699, 1, 0.2039216, 0, 1,
-1.75143, 0.1013373, -0.06031387, 1, 0.2117647, 0, 1,
-1.73262, 1.696807, 0.1982506, 1, 0.2156863, 0, 1,
-1.708411, -0.1461191, -0.7336431, 1, 0.2235294, 0, 1,
-1.697694, -1.150794, -0.965094, 1, 0.227451, 0, 1,
-1.672845, 0.8448535, -2.694319, 1, 0.2352941, 0, 1,
-1.661254, -0.3682033, -2.943143, 1, 0.2392157, 0, 1,
-1.655864, -0.09558082, 0.7742922, 1, 0.2470588, 0, 1,
-1.62183, -0.8279393, -2.401118, 1, 0.2509804, 0, 1,
-1.620088, 1.122698, -1.846295, 1, 0.2588235, 0, 1,
-1.605926, 0.8756315, -0.7904387, 1, 0.2627451, 0, 1,
-1.605142, -1.273558, -3.782956, 1, 0.2705882, 0, 1,
-1.601226, -0.2922981, -1.366098, 1, 0.2745098, 0, 1,
-1.596, 0.2551478, -0.965116, 1, 0.282353, 0, 1,
-1.577227, -0.9440006, -2.781693, 1, 0.2862745, 0, 1,
-1.574072, -0.5268517, -1.62839, 1, 0.2941177, 0, 1,
-1.573576, 0.4537233, -2.135863, 1, 0.3019608, 0, 1,
-1.561605, 1.709428, -1.004656, 1, 0.3058824, 0, 1,
-1.550578, 0.8837479, -0.7097586, 1, 0.3137255, 0, 1,
-1.549526, -3.214512, -1.511978, 1, 0.3176471, 0, 1,
-1.542356, 0.3205394, -3.229944, 1, 0.3254902, 0, 1,
-1.527726, -0.7844157, -2.193732, 1, 0.3294118, 0, 1,
-1.521818, 1.085466, -1.407187, 1, 0.3372549, 0, 1,
-1.517945, -0.4238458, -2.022391, 1, 0.3411765, 0, 1,
-1.511983, 0.5737438, -2.637231, 1, 0.3490196, 0, 1,
-1.486306, 0.7347859, -1.239643, 1, 0.3529412, 0, 1,
-1.466749, 0.03125386, -1.468873, 1, 0.3607843, 0, 1,
-1.459893, 2.608372, -1.076419, 1, 0.3647059, 0, 1,
-1.456769, -0.2794942, -3.555001, 1, 0.372549, 0, 1,
-1.453086, 1.524631, 0.8509924, 1, 0.3764706, 0, 1,
-1.444565, 0.2567585, -1.430486, 1, 0.3843137, 0, 1,
-1.443333, 0.9146991, -1.088927, 1, 0.3882353, 0, 1,
-1.429542, 0.292358, -0.5416805, 1, 0.3960784, 0, 1,
-1.423824, -0.5814543, -1.677902, 1, 0.4039216, 0, 1,
-1.420269, 0.7415072, 0.5317689, 1, 0.4078431, 0, 1,
-1.413764, 1.044142, -1.702976, 1, 0.4156863, 0, 1,
-1.408966, 0.6027754, -1.35809, 1, 0.4196078, 0, 1,
-1.397023, 0.02901537, -1.724653, 1, 0.427451, 0, 1,
-1.380432, 1.052237, -0.07336999, 1, 0.4313726, 0, 1,
-1.365133, 0.09174196, -0.02566307, 1, 0.4392157, 0, 1,
-1.36094, 0.5148456, -1.277568, 1, 0.4431373, 0, 1,
-1.355209, 1.819234, 0.5696865, 1, 0.4509804, 0, 1,
-1.339979, -0.5187173, -3.298973, 1, 0.454902, 0, 1,
-1.339192, -0.1005787, -0.09187226, 1, 0.4627451, 0, 1,
-1.333045, -0.9142157, -2.141024, 1, 0.4666667, 0, 1,
-1.332971, 2.276813, -0.5287488, 1, 0.4745098, 0, 1,
-1.328298, -1.14463, -3.314943, 1, 0.4784314, 0, 1,
-1.327102, -1.81498, -2.899498, 1, 0.4862745, 0, 1,
-1.313348, -1.708315, -3.364825, 1, 0.4901961, 0, 1,
-1.303318, -0.7627819, -0.5435991, 1, 0.4980392, 0, 1,
-1.286397, 0.657002, -1.40865, 1, 0.5058824, 0, 1,
-1.27799, 1.391445, -2.021895, 1, 0.509804, 0, 1,
-1.276857, 0.07105665, -2.188531, 1, 0.5176471, 0, 1,
-1.270785, 0.0885898, -2.409749, 1, 0.5215687, 0, 1,
-1.270521, -0.2897943, -2.326664, 1, 0.5294118, 0, 1,
-1.262943, 0.8187994, -1.318672, 1, 0.5333334, 0, 1,
-1.25772, 0.2349819, -1.220282, 1, 0.5411765, 0, 1,
-1.256705, -0.07981528, -2.580743, 1, 0.5450981, 0, 1,
-1.252082, 1.157655, 0.2919898, 1, 0.5529412, 0, 1,
-1.250583, 0.3921424, 0.02972171, 1, 0.5568628, 0, 1,
-1.247313, 0.3728669, -0.6831036, 1, 0.5647059, 0, 1,
-1.23473, -0.5837265, -2.920752, 1, 0.5686275, 0, 1,
-1.222897, -0.09117509, -0.6446614, 1, 0.5764706, 0, 1,
-1.221897, 1.247503, -1.140557, 1, 0.5803922, 0, 1,
-1.218823, 0.3441071, -2.015752, 1, 0.5882353, 0, 1,
-1.215909, 0.1447001, -0.7646012, 1, 0.5921569, 0, 1,
-1.214984, 0.1440097, -1.999972, 1, 0.6, 0, 1,
-1.202393, -0.7892209, -2.840326, 1, 0.6078432, 0, 1,
-1.201804, 0.5543079, -2.228492, 1, 0.6117647, 0, 1,
-1.175354, 0.4199441, -0.1556606, 1, 0.6196079, 0, 1,
-1.170216, -1.033855, 0.04053207, 1, 0.6235294, 0, 1,
-1.166976, 0.7715545, -0.1467459, 1, 0.6313726, 0, 1,
-1.16297, 0.6013222, 0.1862357, 1, 0.6352941, 0, 1,
-1.161515, -1.231706, -1.263286, 1, 0.6431373, 0, 1,
-1.158482, 0.5031769, -1.603742, 1, 0.6470588, 0, 1,
-1.155617, -1.410413, -3.312889, 1, 0.654902, 0, 1,
-1.154122, -1.49713, -1.704268, 1, 0.6588235, 0, 1,
-1.15396, 1.579834, -1.794862, 1, 0.6666667, 0, 1,
-1.151863, -0.5221247, -1.733109, 1, 0.6705883, 0, 1,
-1.151848, -0.3526683, -2.88618, 1, 0.6784314, 0, 1,
-1.147898, 0.8768648, 0.05928486, 1, 0.682353, 0, 1,
-1.140872, 0.5545111, -1.422873, 1, 0.6901961, 0, 1,
-1.13474, 1.102311, -0.4307121, 1, 0.6941177, 0, 1,
-1.134473, -0.4370242, -1.697244, 1, 0.7019608, 0, 1,
-1.132784, 1.854756, -0.7773119, 1, 0.7098039, 0, 1,
-1.132315, 0.5802033, -0.01304144, 1, 0.7137255, 0, 1,
-1.13175, 2.339788, -0.643105, 1, 0.7215686, 0, 1,
-1.129699, -0.09847218, -2.165933, 1, 0.7254902, 0, 1,
-1.128318, -0.3940488, -1.229228, 1, 0.7333333, 0, 1,
-1.119941, -0.1067283, -2.427226, 1, 0.7372549, 0, 1,
-1.119458, -0.2226312, -2.146306, 1, 0.7450981, 0, 1,
-1.114787, 0.05894543, -2.674135, 1, 0.7490196, 0, 1,
-1.112477, 1.23602, -1.000894, 1, 0.7568628, 0, 1,
-1.103078, 1.407403, 0.7499414, 1, 0.7607843, 0, 1,
-1.09924, -0.3137222, -1.823185, 1, 0.7686275, 0, 1,
-1.09865, -1.377133, -2.188706, 1, 0.772549, 0, 1,
-1.097254, -1.468911, -2.987567, 1, 0.7803922, 0, 1,
-1.094803, -1.345739, -1.338817, 1, 0.7843137, 0, 1,
-1.086962, 0.9780973, -1.857001, 1, 0.7921569, 0, 1,
-1.08483, -0.7264677, -2.40937, 1, 0.7960784, 0, 1,
-1.080365, -0.6363937, -1.672423, 1, 0.8039216, 0, 1,
-1.078847, -0.1973082, -0.6824231, 1, 0.8117647, 0, 1,
-1.07191, -0.3749867, -2.734871, 1, 0.8156863, 0, 1,
-1.067252, -0.3377943, -2.014106, 1, 0.8235294, 0, 1,
-1.067191, -1.02363, -1.876389, 1, 0.827451, 0, 1,
-1.061498, -0.2171065, -2.330525, 1, 0.8352941, 0, 1,
-1.055086, -0.5670654, -1.934974, 1, 0.8392157, 0, 1,
-1.052873, 0.2189513, -2.022685, 1, 0.8470588, 0, 1,
-1.037701, 0.03591233, -0.9281691, 1, 0.8509804, 0, 1,
-1.033989, 0.8172696, -3.194024, 1, 0.8588235, 0, 1,
-1.0329, -0.06807856, -2.516778, 1, 0.8627451, 0, 1,
-1.027509, 0.5435699, -1.255426, 1, 0.8705882, 0, 1,
-1.025471, 0.6353369, -0.4327966, 1, 0.8745098, 0, 1,
-1.023232, -0.5126228, -1.703758, 1, 0.8823529, 0, 1,
-1.014166, 0.04493432, -1.827217, 1, 0.8862745, 0, 1,
-1.013903, 0.1624184, -2.361105, 1, 0.8941177, 0, 1,
-1.009771, -0.7344754, -3.835607, 1, 0.8980392, 0, 1,
-1.006567, -1.412722, -1.536127, 1, 0.9058824, 0, 1,
-1.006179, 1.020785, -2.532754, 1, 0.9137255, 0, 1,
-1.003574, -0.3754427, -1.684948, 1, 0.9176471, 0, 1,
-0.999428, 0.4327343, -0.1655406, 1, 0.9254902, 0, 1,
-0.99603, -0.5987703, -2.423045, 1, 0.9294118, 0, 1,
-0.9754057, -0.8572485, -1.577224, 1, 0.9372549, 0, 1,
-0.9708194, -1.160063, -2.532755, 1, 0.9411765, 0, 1,
-0.9696635, 1.662126, -1.127002, 1, 0.9490196, 0, 1,
-0.9592938, 1.821878, 0.2371971, 1, 0.9529412, 0, 1,
-0.9588794, 0.4900083, -1.363782, 1, 0.9607843, 0, 1,
-0.9588202, 0.08132695, 0.3611958, 1, 0.9647059, 0, 1,
-0.9565095, 0.8424875, -2.784163, 1, 0.972549, 0, 1,
-0.9535745, 0.2568303, -0.2551443, 1, 0.9764706, 0, 1,
-0.9519894, 2.112974, -0.466859, 1, 0.9843137, 0, 1,
-0.9486611, 0.5984125, -1.546358, 1, 0.9882353, 0, 1,
-0.9458662, 1.391707, -1.371349, 1, 0.9960784, 0, 1,
-0.9376538, -0.617831, -2.051985, 0.9960784, 1, 0, 1,
-0.9296901, 0.09860861, -1.604895, 0.9921569, 1, 0, 1,
-0.9281251, 0.05607065, -2.556722, 0.9843137, 1, 0, 1,
-0.9235421, -0.4560812, -3.240528, 0.9803922, 1, 0, 1,
-0.9188032, 0.5131593, -0.2365136, 0.972549, 1, 0, 1,
-0.9166023, 2.204779, 0.6862929, 0.9686275, 1, 0, 1,
-0.9108708, -1.36581, -3.218476, 0.9607843, 1, 0, 1,
-0.9049566, 1.123525, -1.630752, 0.9568627, 1, 0, 1,
-0.9048787, 1.022054, -2.16225, 0.9490196, 1, 0, 1,
-0.9045315, 1.993164, 0.2855343, 0.945098, 1, 0, 1,
-0.9031352, -0.371147, -1.016453, 0.9372549, 1, 0, 1,
-0.9010333, -0.9241269, -3.014015, 0.9333333, 1, 0, 1,
-0.8979424, -0.9997247, -2.093734, 0.9254902, 1, 0, 1,
-0.892674, -0.527051, -2.47582, 0.9215686, 1, 0, 1,
-0.8854766, 0.4104161, -0.7063226, 0.9137255, 1, 0, 1,
-0.8849305, -0.1149111, -2.074135, 0.9098039, 1, 0, 1,
-0.8807439, -0.6533695, -5.225438, 0.9019608, 1, 0, 1,
-0.8790751, 1.459237, 1.054944, 0.8941177, 1, 0, 1,
-0.8769945, -0.05173101, -1.518832, 0.8901961, 1, 0, 1,
-0.8732823, 2.173814, 0.526081, 0.8823529, 1, 0, 1,
-0.8698515, 1.723146, -0.9107537, 0.8784314, 1, 0, 1,
-0.86709, 0.1496105, -1.315839, 0.8705882, 1, 0, 1,
-0.8666756, -0.05162021, -0.8271745, 0.8666667, 1, 0, 1,
-0.8643189, -0.7091936, -2.480588, 0.8588235, 1, 0, 1,
-0.8628657, 0.8985758, -0.7655419, 0.854902, 1, 0, 1,
-0.8479907, 1.010664, -1.012103, 0.8470588, 1, 0, 1,
-0.8396702, -0.4520985, -0.844384, 0.8431373, 1, 0, 1,
-0.8392658, -0.8894726, -2.639525, 0.8352941, 1, 0, 1,
-0.8381991, -1.518435, -2.641932, 0.8313726, 1, 0, 1,
-0.8322944, -0.2051468, -1.088332, 0.8235294, 1, 0, 1,
-0.8321689, -0.2764668, -2.403104, 0.8196079, 1, 0, 1,
-0.8271965, -1.788196, -2.390076, 0.8117647, 1, 0, 1,
-0.8249953, 0.4940694, -0.7088274, 0.8078431, 1, 0, 1,
-0.8232748, 0.4713076, -0.4063677, 0.8, 1, 0, 1,
-0.8195575, 1.064301, 0.5638084, 0.7921569, 1, 0, 1,
-0.819254, 1.089234, -3.234287, 0.7882353, 1, 0, 1,
-0.8129177, -1.580506, -3.318378, 0.7803922, 1, 0, 1,
-0.8119546, 1.636916, -0.8852728, 0.7764706, 1, 0, 1,
-0.8103135, 0.8962904, -1.061753, 0.7686275, 1, 0, 1,
-0.810143, -0.02124881, -2.117832, 0.7647059, 1, 0, 1,
-0.8084504, -0.2761252, -1.984813, 0.7568628, 1, 0, 1,
-0.8036602, -0.8596091, -3.185296, 0.7529412, 1, 0, 1,
-0.794233, -0.289324, -3.402238, 0.7450981, 1, 0, 1,
-0.7931811, -1.574261, -2.393948, 0.7411765, 1, 0, 1,
-0.7931132, 0.2052048, -0.9539927, 0.7333333, 1, 0, 1,
-0.7920337, 0.844091, -2.677701, 0.7294118, 1, 0, 1,
-0.788006, -0.96408, -2.12773, 0.7215686, 1, 0, 1,
-0.7878683, 0.5823725, -0.1556364, 0.7176471, 1, 0, 1,
-0.7865155, 1.803543, -0.8485923, 0.7098039, 1, 0, 1,
-0.7839391, 0.9889804, 0.1330868, 0.7058824, 1, 0, 1,
-0.7800629, 1.045288, 0.04483004, 0.6980392, 1, 0, 1,
-0.7798006, -1.008491, -3.016796, 0.6901961, 1, 0, 1,
-0.7706944, -0.27058, -0.1951903, 0.6862745, 1, 0, 1,
-0.7681873, 0.7101453, -1.432512, 0.6784314, 1, 0, 1,
-0.76037, -1.643806, -3.468866, 0.6745098, 1, 0, 1,
-0.7550278, 0.4831217, -2.102695, 0.6666667, 1, 0, 1,
-0.7521771, -0.5695442, -2.099499, 0.6627451, 1, 0, 1,
-0.7423159, 0.2815042, -2.640652, 0.654902, 1, 0, 1,
-0.7420047, -1.67983, -3.818418, 0.6509804, 1, 0, 1,
-0.7382155, 2.104142, 0.657213, 0.6431373, 1, 0, 1,
-0.7242925, 0.867783, -1.940124, 0.6392157, 1, 0, 1,
-0.7210038, -1.907197, -2.649544, 0.6313726, 1, 0, 1,
-0.7150407, -2.595847, -3.662536, 0.627451, 1, 0, 1,
-0.7055477, 0.3724432, -1.552758, 0.6196079, 1, 0, 1,
-0.7054442, -0.9801936, -2.353876, 0.6156863, 1, 0, 1,
-0.7047861, 0.870774, -0.4685704, 0.6078432, 1, 0, 1,
-0.6953139, -0.1436097, -2.194247, 0.6039216, 1, 0, 1,
-0.6931132, -0.04464899, -2.031816, 0.5960785, 1, 0, 1,
-0.6874099, 1.007128, -2.043649, 0.5882353, 1, 0, 1,
-0.6856507, -0.9353895, -1.350621, 0.5843138, 1, 0, 1,
-0.679969, -0.6061546, -3.04733, 0.5764706, 1, 0, 1,
-0.6789817, 2.026341, -1.090065, 0.572549, 1, 0, 1,
-0.6784793, -0.9631274, -2.195256, 0.5647059, 1, 0, 1,
-0.6758903, -1.196949, -3.789721, 0.5607843, 1, 0, 1,
-0.6728372, -1.489476, -2.76308, 0.5529412, 1, 0, 1,
-0.6683916, -1.32583, -2.709432, 0.5490196, 1, 0, 1,
-0.6675185, 0.4886713, -1.384702, 0.5411765, 1, 0, 1,
-0.6647775, 0.7932366, 0.04680805, 0.5372549, 1, 0, 1,
-0.6645625, -0.398562, -2.514632, 0.5294118, 1, 0, 1,
-0.661027, -0.2091551, -2.082185, 0.5254902, 1, 0, 1,
-0.6586158, -0.4005497, -2.862128, 0.5176471, 1, 0, 1,
-0.6583998, -0.8754175, -3.280335, 0.5137255, 1, 0, 1,
-0.6568584, -1.290151, -2.106882, 0.5058824, 1, 0, 1,
-0.6560937, -0.4043547, -1.615902, 0.5019608, 1, 0, 1,
-0.6559527, -1.415685, -3.063552, 0.4941176, 1, 0, 1,
-0.6548203, 0.08020456, 0.2789211, 0.4862745, 1, 0, 1,
-0.653012, -1.082134, -2.598845, 0.4823529, 1, 0, 1,
-0.6497533, 2.136244, -1.278527, 0.4745098, 1, 0, 1,
-0.6448068, 0.9420002, -0.1550934, 0.4705882, 1, 0, 1,
-0.6378682, -0.4112082, -0.1826796, 0.4627451, 1, 0, 1,
-0.637753, 0.4734521, -0.2801943, 0.4588235, 1, 0, 1,
-0.6361039, -0.8677812, -2.120927, 0.4509804, 1, 0, 1,
-0.6300975, 0.7388532, -0.02600705, 0.4470588, 1, 0, 1,
-0.6259184, 0.5589588, -0.8497739, 0.4392157, 1, 0, 1,
-0.6232916, -0.2846635, -4.142063, 0.4352941, 1, 0, 1,
-0.6184002, 0.3042393, -0.2443007, 0.427451, 1, 0, 1,
-0.6158503, -1.656325, -2.359871, 0.4235294, 1, 0, 1,
-0.5996135, 1.100636, -1.974674, 0.4156863, 1, 0, 1,
-0.598136, -0.8355479, -3.226684, 0.4117647, 1, 0, 1,
-0.5974652, -2.582764, -1.993644, 0.4039216, 1, 0, 1,
-0.5969186, -0.4078175, 0.1061193, 0.3960784, 1, 0, 1,
-0.5931134, -0.259027, -3.289737, 0.3921569, 1, 0, 1,
-0.592387, 0.2581172, -1.754046, 0.3843137, 1, 0, 1,
-0.5897437, -1.513518, -2.040107, 0.3803922, 1, 0, 1,
-0.5873565, -0.9563633, -3.144412, 0.372549, 1, 0, 1,
-0.5840155, -0.07428455, -2.436678, 0.3686275, 1, 0, 1,
-0.5811788, 0.449033, -2.314416, 0.3607843, 1, 0, 1,
-0.5797346, 1.336026, 0.8093349, 0.3568628, 1, 0, 1,
-0.5753583, 1.881016, -0.03002578, 0.3490196, 1, 0, 1,
-0.5715554, 1.57662, 0.3821211, 0.345098, 1, 0, 1,
-0.5710794, 1.36732, -1.190959, 0.3372549, 1, 0, 1,
-0.5692776, 0.3716969, -0.3976958, 0.3333333, 1, 0, 1,
-0.5688263, -1.068551, -2.379117, 0.3254902, 1, 0, 1,
-0.5645104, -0.288327, -1.968808, 0.3215686, 1, 0, 1,
-0.5575996, -0.06336305, -0.461261, 0.3137255, 1, 0, 1,
-0.5549386, 2.001123, -1.050005, 0.3098039, 1, 0, 1,
-0.5540456, 0.4878833, -1.767332, 0.3019608, 1, 0, 1,
-0.5539594, 1.045585, 0.3912447, 0.2941177, 1, 0, 1,
-0.5517609, -2.069872, -3.402209, 0.2901961, 1, 0, 1,
-0.5506612, 1.345926, 0.02773293, 0.282353, 1, 0, 1,
-0.5453103, 1.416461, -0.4509436, 0.2784314, 1, 0, 1,
-0.5407257, -0.01833352, -3.343427, 0.2705882, 1, 0, 1,
-0.5399222, -0.1070376, -4.215036, 0.2666667, 1, 0, 1,
-0.5327335, 0.5383512, -0.9385207, 0.2588235, 1, 0, 1,
-0.5316628, -0.06588078, -0.7598382, 0.254902, 1, 0, 1,
-0.5315766, 0.2349727, -0.8429911, 0.2470588, 1, 0, 1,
-0.5299558, -1.77003, -2.323357, 0.2431373, 1, 0, 1,
-0.52978, -0.299708, -4.179423, 0.2352941, 1, 0, 1,
-0.5294079, 1.63099, -0.8962409, 0.2313726, 1, 0, 1,
-0.5254847, -0.8524771, -2.05046, 0.2235294, 1, 0, 1,
-0.5251037, 0.9454978, -0.7357006, 0.2196078, 1, 0, 1,
-0.5156156, -0.08322421, -0.8049043, 0.2117647, 1, 0, 1,
-0.5143375, 0.04782698, -0.9369786, 0.2078431, 1, 0, 1,
-0.5131195, -0.1658749, -2.383317, 0.2, 1, 0, 1,
-0.5128134, 0.4665639, 0.501124, 0.1921569, 1, 0, 1,
-0.5113432, -0.06400477, -1.959514, 0.1882353, 1, 0, 1,
-0.5055276, -0.1099538, -2.247487, 0.1803922, 1, 0, 1,
-0.502818, 0.6278505, 0.8889589, 0.1764706, 1, 0, 1,
-0.5023041, 0.9050484, -0.2288113, 0.1686275, 1, 0, 1,
-0.5021233, -0.915962, -3.315187, 0.1647059, 1, 0, 1,
-0.4987618, 0.3685447, -0.5931576, 0.1568628, 1, 0, 1,
-0.4968728, 1.97328, 0.1713208, 0.1529412, 1, 0, 1,
-0.4962674, -1.737261, -1.724622, 0.145098, 1, 0, 1,
-0.4897892, 0.7154973, -1.632427, 0.1411765, 1, 0, 1,
-0.4870431, 0.4252745, -1.646031, 0.1333333, 1, 0, 1,
-0.4846575, 0.8453352, 0.2964205, 0.1294118, 1, 0, 1,
-0.4831018, 1.57868, -0.8269375, 0.1215686, 1, 0, 1,
-0.4805668, -0.8041308, -2.524136, 0.1176471, 1, 0, 1,
-0.4774273, 0.02065444, 0.2475906, 0.1098039, 1, 0, 1,
-0.473998, -1.202463, -2.209193, 0.1058824, 1, 0, 1,
-0.4723072, 0.6593249, -1.854257, 0.09803922, 1, 0, 1,
-0.4693451, 0.2052918, -2.461897, 0.09019608, 1, 0, 1,
-0.4660548, 0.9440122, -2.871152, 0.08627451, 1, 0, 1,
-0.4616978, 1.790673, 0.2652711, 0.07843138, 1, 0, 1,
-0.4592014, 0.6103614, 0.1520579, 0.07450981, 1, 0, 1,
-0.4585412, -1.416123, -3.099852, 0.06666667, 1, 0, 1,
-0.4574993, -0.1129442, -1.213855, 0.0627451, 1, 0, 1,
-0.4569923, -0.1373481, -1.808954, 0.05490196, 1, 0, 1,
-0.4556316, 1.663564, -2.051499, 0.05098039, 1, 0, 1,
-0.4516989, 0.7807139, -0.6016179, 0.04313726, 1, 0, 1,
-0.4496499, -1.096907, -3.645259, 0.03921569, 1, 0, 1,
-0.4476756, -1.824533, -1.588151, 0.03137255, 1, 0, 1,
-0.4474331, -0.7143001, -1.409905, 0.02745098, 1, 0, 1,
-0.4453158, 0.2459294, -0.388992, 0.01960784, 1, 0, 1,
-0.4450072, -1.676884, -3.098997, 0.01568628, 1, 0, 1,
-0.4433599, -0.876645, -2.203057, 0.007843138, 1, 0, 1,
-0.4418924, 0.2461052, -1.959289, 0.003921569, 1, 0, 1,
-0.4397608, -1.061432, -3.609676, 0, 1, 0.003921569, 1,
-0.437499, 0.1361289, -0.6047021, 0, 1, 0.01176471, 1,
-0.434166, -0.172798, -1.322208, 0, 1, 0.01568628, 1,
-0.4276081, 0.4890546, -1.142107, 0, 1, 0.02352941, 1,
-0.4235916, -1.610176, -3.513092, 0, 1, 0.02745098, 1,
-0.4228911, 0.6718495, -2.98645, 0, 1, 0.03529412, 1,
-0.4220889, -0.1027133, -0.9400761, 0, 1, 0.03921569, 1,
-0.4192604, -1.036088, 0.3303257, 0, 1, 0.04705882, 1,
-0.4180703, 0.5511916, -0.8760298, 0, 1, 0.05098039, 1,
-0.4157356, -0.06220049, -1.559187, 0, 1, 0.05882353, 1,
-0.413059, -0.002855921, -1.630551, 0, 1, 0.0627451, 1,
-0.4123571, 0.1940518, -1.52186, 0, 1, 0.07058824, 1,
-0.4121046, -0.06164182, -2.476389, 0, 1, 0.07450981, 1,
-0.4100196, -0.9339197, -3.349483, 0, 1, 0.08235294, 1,
-0.4014387, -1.57507, -3.767036, 0, 1, 0.08627451, 1,
-0.3993841, 0.6744994, 0.3900325, 0, 1, 0.09411765, 1,
-0.3986862, -0.1295486, 0.3707376, 0, 1, 0.1019608, 1,
-0.3923225, -1.626747, -2.314344, 0, 1, 0.1058824, 1,
-0.3907241, -0.3595035, -2.152346, 0, 1, 0.1137255, 1,
-0.3867181, -0.5651196, -1.604265, 0, 1, 0.1176471, 1,
-0.3831573, -0.01016051, -1.575825, 0, 1, 0.1254902, 1,
-0.3806981, 0.005456551, -0.5554061, 0, 1, 0.1294118, 1,
-0.3802954, -1.379558, -1.974344, 0, 1, 0.1372549, 1,
-0.3794435, 0.8863509, 0.9101429, 0, 1, 0.1411765, 1,
-0.3777722, 0.8176709, -0.9865155, 0, 1, 0.1490196, 1,
-0.3776953, 2.276453, 0.08062506, 0, 1, 0.1529412, 1,
-0.3766787, 0.3582796, -1.686103, 0, 1, 0.1607843, 1,
-0.3746395, -0.4920745, -3.845498, 0, 1, 0.1647059, 1,
-0.3724071, -0.9335878, -2.270346, 0, 1, 0.172549, 1,
-0.3721712, 0.07912466, -1.933399, 0, 1, 0.1764706, 1,
-0.3697173, 0.2573287, -1.410053, 0, 1, 0.1843137, 1,
-0.3620929, 1.745119, -1.100564, 0, 1, 0.1882353, 1,
-0.3597713, 0.7606944, -0.4589256, 0, 1, 0.1960784, 1,
-0.3597659, 0.03174996, -1.439438, 0, 1, 0.2039216, 1,
-0.3573392, -0.5712108, -2.359004, 0, 1, 0.2078431, 1,
-0.3543695, -0.38774, -2.733656, 0, 1, 0.2156863, 1,
-0.3443652, -0.8321922, -4.955394, 0, 1, 0.2196078, 1,
-0.3415209, 0.01740155, -1.673082, 0, 1, 0.227451, 1,
-0.3399682, -0.443919, -4.525033, 0, 1, 0.2313726, 1,
-0.334557, -0.634687, -4.661435, 0, 1, 0.2392157, 1,
-0.3339728, -0.7058347, -1.73586, 0, 1, 0.2431373, 1,
-0.3325084, 0.7563747, 0.1384644, 0, 1, 0.2509804, 1,
-0.3239911, 0.04751496, -2.857663, 0, 1, 0.254902, 1,
-0.322127, -0.7545158, -1.865915, 0, 1, 0.2627451, 1,
-0.306163, 0.8393811, -0.7544053, 0, 1, 0.2666667, 1,
-0.3042881, 0.608529, -0.5129763, 0, 1, 0.2745098, 1,
-0.3037114, 0.1555857, -1.930431, 0, 1, 0.2784314, 1,
-0.3017497, 0.1713258, -3.044599, 0, 1, 0.2862745, 1,
-0.3016539, -0.9321967, -4.527625, 0, 1, 0.2901961, 1,
-0.2941611, -0.1430206, -2.168337, 0, 1, 0.2980392, 1,
-0.2922968, 0.6655763, -0.4914424, 0, 1, 0.3058824, 1,
-0.2866969, 0.3741339, -0.6515487, 0, 1, 0.3098039, 1,
-0.2821453, -0.6780486, -3.660281, 0, 1, 0.3176471, 1,
-0.2816388, -0.3119436, -2.751586, 0, 1, 0.3215686, 1,
-0.2786053, -0.3327013, -2.316548, 0, 1, 0.3294118, 1,
-0.2755471, -0.95061, -2.673598, 0, 1, 0.3333333, 1,
-0.2728971, 0.5286219, -1.056026, 0, 1, 0.3411765, 1,
-0.268621, -1.518761, -2.589911, 0, 1, 0.345098, 1,
-0.267666, -0.1340267, -0.7585602, 0, 1, 0.3529412, 1,
-0.262006, 2.835081, 0.2329141, 0, 1, 0.3568628, 1,
-0.2618301, 0.6691892, -0.7698996, 0, 1, 0.3647059, 1,
-0.2604991, -1.685198, -3.050945, 0, 1, 0.3686275, 1,
-0.2600578, -1.243963, -2.61503, 0, 1, 0.3764706, 1,
-0.2543365, 0.3112369, -1.409981, 0, 1, 0.3803922, 1,
-0.249023, -1.748451, -2.213437, 0, 1, 0.3882353, 1,
-0.2480747, 0.182066, -1.276874, 0, 1, 0.3921569, 1,
-0.2453163, 0.528253, -0.6658195, 0, 1, 0.4, 1,
-0.2394345, 0.7896463, -0.9036503, 0, 1, 0.4078431, 1,
-0.2388808, 1.089228, 1.66449, 0, 1, 0.4117647, 1,
-0.2366087, -0.8719026, -2.118675, 0, 1, 0.4196078, 1,
-0.2344331, 0.4089936, -0.3810361, 0, 1, 0.4235294, 1,
-0.2330963, 1.054882, 0.3734619, 0, 1, 0.4313726, 1,
-0.2301943, -0.6765299, -3.918945, 0, 1, 0.4352941, 1,
-0.229721, -0.08100727, -2.461485, 0, 1, 0.4431373, 1,
-0.2267058, -0.6201736, -4.510803, 0, 1, 0.4470588, 1,
-0.2252269, -0.6633418, -3.504731, 0, 1, 0.454902, 1,
-0.2206459, -0.9348927, -4.030308, 0, 1, 0.4588235, 1,
-0.2179912, 0.8877515, -1.752508, 0, 1, 0.4666667, 1,
-0.2170238, -0.6000416, -2.138207, 0, 1, 0.4705882, 1,
-0.2153605, 0.2192617, -1.601706, 0, 1, 0.4784314, 1,
-0.2148764, 1.651694, 0.2192408, 0, 1, 0.4823529, 1,
-0.2134015, -0.06353913, -2.177474, 0, 1, 0.4901961, 1,
-0.2037064, 1.041229, -1.555196, 0, 1, 0.4941176, 1,
-0.2003515, 0.6401973, -0.3891061, 0, 1, 0.5019608, 1,
-0.2001908, 1.110534, 1.640029, 0, 1, 0.509804, 1,
-0.1987502, -1.330047, -3.904804, 0, 1, 0.5137255, 1,
-0.197565, 0.4368932, -0.6434313, 0, 1, 0.5215687, 1,
-0.195315, 1.788601, 0.1578923, 0, 1, 0.5254902, 1,
-0.1876636, -0.8412745, -1.69108, 0, 1, 0.5333334, 1,
-0.1874986, -0.9014041, -2.951279, 0, 1, 0.5372549, 1,
-0.1861925, -0.8253815, -2.806333, 0, 1, 0.5450981, 1,
-0.1854739, 1.029564, -1.159209, 0, 1, 0.5490196, 1,
-0.1818694, 0.511703, -0.08404984, 0, 1, 0.5568628, 1,
-0.1757918, 1.0316, -2.140206, 0, 1, 0.5607843, 1,
-0.173633, -0.3703538, -3.933494, 0, 1, 0.5686275, 1,
-0.1697039, -0.4183997, -3.11327, 0, 1, 0.572549, 1,
-0.167378, -0.3205325, -1.163137, 0, 1, 0.5803922, 1,
-0.1673035, 1.04797, -0.1068268, 0, 1, 0.5843138, 1,
-0.1661279, -0.8415041, -1.66214, 0, 1, 0.5921569, 1,
-0.1630788, 0.5097348, -0.8204353, 0, 1, 0.5960785, 1,
-0.162723, -0.7032156, -2.071404, 0, 1, 0.6039216, 1,
-0.1612079, 1.774162, 0.9449297, 0, 1, 0.6117647, 1,
-0.1598965, 1.200107, 0.2204959, 0, 1, 0.6156863, 1,
-0.1590147, -1.186549, -1.101597, 0, 1, 0.6235294, 1,
-0.1572923, 1.279245, 1.822539, 0, 1, 0.627451, 1,
-0.15667, 0.2215446, -1.064072, 0, 1, 0.6352941, 1,
-0.1538689, -0.9104103, -2.680903, 0, 1, 0.6392157, 1,
-0.1534917, 1.913424, -0.6913812, 0, 1, 0.6470588, 1,
-0.1483427, 0.466405, 0.5478458, 0, 1, 0.6509804, 1,
-0.1445927, 0.08266011, -1.48821, 0, 1, 0.6588235, 1,
-0.1440434, 0.6383235, 0.472985, 0, 1, 0.6627451, 1,
-0.1395993, 1.02237, -1.22995, 0, 1, 0.6705883, 1,
-0.1371315, 1.268349, -0.1727782, 0, 1, 0.6745098, 1,
-0.1313753, -2.007959, -2.004915, 0, 1, 0.682353, 1,
-0.130659, -0.5014293, -0.7467377, 0, 1, 0.6862745, 1,
-0.1292654, -0.7167776, -2.758927, 0, 1, 0.6941177, 1,
-0.1288875, 1.854074, -1.480687, 0, 1, 0.7019608, 1,
-0.1283329, -0.6259704, -2.409259, 0, 1, 0.7058824, 1,
-0.114953, -0.3264228, -2.180372, 0, 1, 0.7137255, 1,
-0.1076971, -0.5996382, -3.748239, 0, 1, 0.7176471, 1,
-0.1076231, 0.5603308, 0.01392742, 0, 1, 0.7254902, 1,
-0.1060543, 1.243718, 0.5208668, 0, 1, 0.7294118, 1,
-0.1055374, -1.111339, -3.47516, 0, 1, 0.7372549, 1,
-0.1037598, 0.5672393, -1.308145, 0, 1, 0.7411765, 1,
-0.1031861, 0.200746, 0.6731011, 0, 1, 0.7490196, 1,
-0.1030063, -2.116079, -3.573679, 0, 1, 0.7529412, 1,
-0.1013716, 0.1497527, -0.1661202, 0, 1, 0.7607843, 1,
-0.1009414, 2.191006, 0.9011318, 0, 1, 0.7647059, 1,
-0.1001303, -0.5910016, -2.580148, 0, 1, 0.772549, 1,
-0.09660994, -0.855243, -2.471863, 0, 1, 0.7764706, 1,
-0.09345941, -1.385924, -4.905949, 0, 1, 0.7843137, 1,
-0.09159225, -2.168375, -3.894681, 0, 1, 0.7882353, 1,
-0.09139963, -0.6884109, -2.742031, 0, 1, 0.7960784, 1,
-0.08182545, 0.5185219, -0.4971626, 0, 1, 0.8039216, 1,
-0.07830236, -0.2168535, -3.388281, 0, 1, 0.8078431, 1,
-0.07684173, -0.7641201, -1.141478, 0, 1, 0.8156863, 1,
-0.07578497, 1.103047, 1.566554, 0, 1, 0.8196079, 1,
-0.07484887, -0.242616, -2.163556, 0, 1, 0.827451, 1,
-0.07454491, 0.4234918, 0.2428749, 0, 1, 0.8313726, 1,
-0.07373578, 0.3218305, -1.627398, 0, 1, 0.8392157, 1,
-0.07228366, 0.7910657, -0.3796826, 0, 1, 0.8431373, 1,
-0.07008561, -0.521809, -4.865747, 0, 1, 0.8509804, 1,
-0.06419201, 1.805194, 0.3535525, 0, 1, 0.854902, 1,
-0.04756382, 1.305152, -0.5316877, 0, 1, 0.8627451, 1,
-0.04746439, -0.1160007, -2.723694, 0, 1, 0.8666667, 1,
-0.04621417, 0.6759174, -0.9480588, 0, 1, 0.8745098, 1,
-0.04456097, -0.9803679, -3.357896, 0, 1, 0.8784314, 1,
-0.04343442, -1.115059, -3.060849, 0, 1, 0.8862745, 1,
-0.04076223, 0.9560658, 0.2853423, 0, 1, 0.8901961, 1,
-0.0399767, 0.2549655, 0.02754984, 0, 1, 0.8980392, 1,
-0.0357722, -0.5227355, -2.309028, 0, 1, 0.9058824, 1,
-0.03520904, 0.8524817, -0.2940055, 0, 1, 0.9098039, 1,
-0.03334809, 0.4927541, 0.4031777, 0, 1, 0.9176471, 1,
-0.03286929, -1.213048, -2.946826, 0, 1, 0.9215686, 1,
-0.02681635, 0.8396394, -1.565319, 0, 1, 0.9294118, 1,
-0.02595781, -1.017151, -2.446314, 0, 1, 0.9333333, 1,
-0.02472056, 0.3573355, 0.1688218, 0, 1, 0.9411765, 1,
-0.02235303, 0.06848985, -1.142162, 0, 1, 0.945098, 1,
-0.01743103, -0.5508864, -2.440296, 0, 1, 0.9529412, 1,
-0.0172383, 1.241516, 0.351317, 0, 1, 0.9568627, 1,
-0.01591329, -0.05155414, -1.271152, 0, 1, 0.9647059, 1,
-0.007634959, 0.2132961, -1.681204, 0, 1, 0.9686275, 1,
-0.006501743, 1.126965, 0.3428157, 0, 1, 0.9764706, 1,
-0.005634231, 1.858649, 0.9398392, 0, 1, 0.9803922, 1,
-0.003923198, -0.3636691, -4.452141, 0, 1, 0.9882353, 1,
-0.003005603, 0.1970684, 0.9926562, 0, 1, 0.9921569, 1,
-0.0003914794, -0.2631539, -3.041964, 0, 1, 1, 1,
0.0004945628, -0.2925521, 1.950322, 0, 0.9921569, 1, 1,
0.006808684, -0.8250089, 4.113847, 0, 0.9882353, 1, 1,
0.009002325, -0.9791712, 4.390054, 0, 0.9803922, 1, 1,
0.009565886, -0.04190583, 3.402453, 0, 0.9764706, 1, 1,
0.01399114, 0.02278319, 0.3666511, 0, 0.9686275, 1, 1,
0.01631818, 0.2708798, 0.1211164, 0, 0.9647059, 1, 1,
0.02122394, -1.416784, 2.055644, 0, 0.9568627, 1, 1,
0.02202173, 2.446184, 0.890054, 0, 0.9529412, 1, 1,
0.02380397, 0.4187305, 0.4648569, 0, 0.945098, 1, 1,
0.02401061, 0.5833957, 1.100439, 0, 0.9411765, 1, 1,
0.02467798, 0.2284851, -1.192558, 0, 0.9333333, 1, 1,
0.02475738, -0.7399555, 3.718736, 0, 0.9294118, 1, 1,
0.02837801, 0.1246631, -0.04500148, 0, 0.9215686, 1, 1,
0.02874989, -0.05615202, 5.325191, 0, 0.9176471, 1, 1,
0.03058082, -0.4032896, 2.994038, 0, 0.9098039, 1, 1,
0.03381499, -0.833065, 1.505002, 0, 0.9058824, 1, 1,
0.03504637, -0.01616792, 0.8446211, 0, 0.8980392, 1, 1,
0.038612, 0.8691638, -0.19167, 0, 0.8901961, 1, 1,
0.03876059, -1.964891, 2.680432, 0, 0.8862745, 1, 1,
0.04451298, -1.035384, 4.975863, 0, 0.8784314, 1, 1,
0.04714172, -0.8281301, 5.284472, 0, 0.8745098, 1, 1,
0.05019312, -0.6444191, 4.445685, 0, 0.8666667, 1, 1,
0.05121022, 0.8776436, -0.2549764, 0, 0.8627451, 1, 1,
0.05137938, -1.612193, 3.992538, 0, 0.854902, 1, 1,
0.0515764, 0.2508726, 0.8651983, 0, 0.8509804, 1, 1,
0.05363386, 1.178726, -1.055131, 0, 0.8431373, 1, 1,
0.05467612, -0.01246765, 1.692067, 0, 0.8392157, 1, 1,
0.05711828, -1.416429, 2.81186, 0, 0.8313726, 1, 1,
0.06137292, 0.2357079, 0.8192037, 0, 0.827451, 1, 1,
0.06462093, 0.1541469, 0.125695, 0, 0.8196079, 1, 1,
0.06768738, -1.785993, 3.248784, 0, 0.8156863, 1, 1,
0.07176359, -0.6251849, 1.008148, 0, 0.8078431, 1, 1,
0.07598247, 0.7765496, 1.046121, 0, 0.8039216, 1, 1,
0.07913379, -1.933911, 3.595353, 0, 0.7960784, 1, 1,
0.08231157, 0.8073888, 1.644344, 0, 0.7882353, 1, 1,
0.08526561, -1.929811, 3.390552, 0, 0.7843137, 1, 1,
0.08719338, 0.5683872, -1.89462, 0, 0.7764706, 1, 1,
0.08766274, -0.7914374, 2.555088, 0, 0.772549, 1, 1,
0.09162394, 1.233503, 1.554558, 0, 0.7647059, 1, 1,
0.0920342, 0.6682401, 0.7003812, 0, 0.7607843, 1, 1,
0.09847771, -0.8951795, 3.389755, 0, 0.7529412, 1, 1,
0.1065036, -1.045738, 2.788979, 0, 0.7490196, 1, 1,
0.1085756, -0.6901903, 2.69496, 0, 0.7411765, 1, 1,
0.1093949, -1.253517, 2.687783, 0, 0.7372549, 1, 1,
0.1096943, 1.675954, -1.012737, 0, 0.7294118, 1, 1,
0.1103492, -0.2795026, 2.917505, 0, 0.7254902, 1, 1,
0.1154625, 2.192373, -0.1099858, 0, 0.7176471, 1, 1,
0.1176253, -0.2198408, 2.706428, 0, 0.7137255, 1, 1,
0.1198008, 0.804157, -1.225282, 0, 0.7058824, 1, 1,
0.1217489, -1.256659, 3.65525, 0, 0.6980392, 1, 1,
0.1281178, 0.07656672, 1.754721, 0, 0.6941177, 1, 1,
0.1320128, 0.8612115, -0.3341063, 0, 0.6862745, 1, 1,
0.1389405, 0.1023752, 1.170304, 0, 0.682353, 1, 1,
0.1409113, -0.2053678, 3.611674, 0, 0.6745098, 1, 1,
0.1410369, -0.1072282, 1.911764, 0, 0.6705883, 1, 1,
0.1414529, 2.369336, 1.310804, 0, 0.6627451, 1, 1,
0.1428333, 0.4671464, 1.064203, 0, 0.6588235, 1, 1,
0.1429619, -1.542359, 3.84655, 0, 0.6509804, 1, 1,
0.1473195, -2.184989, 2.407802, 0, 0.6470588, 1, 1,
0.1474897, -0.3819604, 4.383334, 0, 0.6392157, 1, 1,
0.1476907, 0.162226, 0.1106312, 0, 0.6352941, 1, 1,
0.1505406, 0.2636712, 2.134181, 0, 0.627451, 1, 1,
0.1601643, -2.341254, 3.38453, 0, 0.6235294, 1, 1,
0.1604294, -0.1075637, 2.3287, 0, 0.6156863, 1, 1,
0.1644581, -0.02608312, 1.191007, 0, 0.6117647, 1, 1,
0.1655148, 1.148716, 0.3124901, 0, 0.6039216, 1, 1,
0.1669706, -0.3221847, 2.330955, 0, 0.5960785, 1, 1,
0.1788193, -0.06419721, 1.137325, 0, 0.5921569, 1, 1,
0.1816676, 1.229692, -0.4085725, 0, 0.5843138, 1, 1,
0.1817849, -0.5712659, 1.79468, 0, 0.5803922, 1, 1,
0.1834212, -0.06655046, 3.696395, 0, 0.572549, 1, 1,
0.1866845, 0.3866779, -1.111708, 0, 0.5686275, 1, 1,
0.1886409, -1.133782, 1.774774, 0, 0.5607843, 1, 1,
0.1909001, -0.2462465, 2.689686, 0, 0.5568628, 1, 1,
0.1911588, -0.3044785, 0.5938758, 0, 0.5490196, 1, 1,
0.1917551, -1.550546, 2.498388, 0, 0.5450981, 1, 1,
0.1927584, -1.69901, 3.301771, 0, 0.5372549, 1, 1,
0.1952317, -1.817441, 3.193413, 0, 0.5333334, 1, 1,
0.2031968, -0.01430905, 1.779679, 0, 0.5254902, 1, 1,
0.2035456, 1.300803, -0.5429186, 0, 0.5215687, 1, 1,
0.2081221, 0.8163311, -0.2253989, 0, 0.5137255, 1, 1,
0.2109089, 0.8972514, 0.2713789, 0, 0.509804, 1, 1,
0.2113248, -1.625657, 3.943449, 0, 0.5019608, 1, 1,
0.2121769, -1.501603, 4.214443, 0, 0.4941176, 1, 1,
0.2165435, -0.9682364, 4.158788, 0, 0.4901961, 1, 1,
0.2207369, 0.2820622, 0.4622327, 0, 0.4823529, 1, 1,
0.2280234, -0.9837826, 4.98788, 0, 0.4784314, 1, 1,
0.2301294, 1.022653, -1.097923, 0, 0.4705882, 1, 1,
0.2329961, 0.4523156, -1.40592, 0, 0.4666667, 1, 1,
0.2371081, -1.774636, 4.231292, 0, 0.4588235, 1, 1,
0.2434081, 0.09413871, 0.511245, 0, 0.454902, 1, 1,
0.2444188, -0.9825777, 2.602361, 0, 0.4470588, 1, 1,
0.2448476, -0.6792876, 2.500002, 0, 0.4431373, 1, 1,
0.2493396, -1.071234, 4.239355, 0, 0.4352941, 1, 1,
0.2498669, -2.715697, 2.070515, 0, 0.4313726, 1, 1,
0.2562447, -0.07101744, 1.929469, 0, 0.4235294, 1, 1,
0.2602186, 1.933638, 1.967603, 0, 0.4196078, 1, 1,
0.2605618, 0.3586646, 0.5301328, 0, 0.4117647, 1, 1,
0.2650082, -1.119295, 3.843993, 0, 0.4078431, 1, 1,
0.2700697, -0.1468326, 1.807555, 0, 0.4, 1, 1,
0.2719721, 0.2142631, 1.09477, 0, 0.3921569, 1, 1,
0.2788075, -0.2728632, 4.243181, 0, 0.3882353, 1, 1,
0.2862613, -0.381992, 1.307402, 0, 0.3803922, 1, 1,
0.2895801, 0.07824322, 2.545765, 0, 0.3764706, 1, 1,
0.2918042, -0.9693884, 1.43846, 0, 0.3686275, 1, 1,
0.2946993, 0.191108, 0.5107231, 0, 0.3647059, 1, 1,
0.2948695, 0.2780044, 1.205, 0, 0.3568628, 1, 1,
0.2951692, -0.134132, 1.717144, 0, 0.3529412, 1, 1,
0.2964385, 0.9478927, -1.134826, 0, 0.345098, 1, 1,
0.2965987, -0.02010551, 1.631194, 0, 0.3411765, 1, 1,
0.2968603, 1.440162, -0.8952274, 0, 0.3333333, 1, 1,
0.2978284, -0.8735157, 2.003543, 0, 0.3294118, 1, 1,
0.3011999, -0.1159832, 4.303212, 0, 0.3215686, 1, 1,
0.3013563, 0.6728891, -0.3661313, 0, 0.3176471, 1, 1,
0.3028767, 0.672534, 2.054268, 0, 0.3098039, 1, 1,
0.3038345, 0.8604306, -0.8308837, 0, 0.3058824, 1, 1,
0.3044595, 1.508256, 0.3391533, 0, 0.2980392, 1, 1,
0.307276, 1.022083, 1.412237, 0, 0.2901961, 1, 1,
0.3094811, 1.818251, 1.545598, 0, 0.2862745, 1, 1,
0.3116479, -0.6251046, 3.732239, 0, 0.2784314, 1, 1,
0.311669, 0.001517761, 1.687865, 0, 0.2745098, 1, 1,
0.3168708, -0.09693143, 1.334049, 0, 0.2666667, 1, 1,
0.31737, 1.115193, 0.1228328, 0, 0.2627451, 1, 1,
0.3174656, 0.6784057, -1.548147, 0, 0.254902, 1, 1,
0.3197103, 1.657211, -0.5180106, 0, 0.2509804, 1, 1,
0.3235795, 1.8471, 0.0743142, 0, 0.2431373, 1, 1,
0.3265691, 0.2042756, -0.703958, 0, 0.2392157, 1, 1,
0.3271105, 1.003574, 0.3015215, 0, 0.2313726, 1, 1,
0.3319367, -0.7721284, 3.12356, 0, 0.227451, 1, 1,
0.3341678, 0.1669617, 2.929299, 0, 0.2196078, 1, 1,
0.3365911, -0.3281765, 1.968073, 0, 0.2156863, 1, 1,
0.3370891, 1.342436, -0.3493316, 0, 0.2078431, 1, 1,
0.3378595, 0.0809256, 1.299778, 0, 0.2039216, 1, 1,
0.3408858, 0.1543234, 3.134188, 0, 0.1960784, 1, 1,
0.341832, 0.8113609, -0.02280606, 0, 0.1882353, 1, 1,
0.345919, -0.3502056, 2.684567, 0, 0.1843137, 1, 1,
0.3461802, 0.8530625, 0.4184234, 0, 0.1764706, 1, 1,
0.3463024, 1.068253, -0.1175083, 0, 0.172549, 1, 1,
0.3473237, 1.126248, -0.5568133, 0, 0.1647059, 1, 1,
0.3480747, 0.8287636, -0.3293571, 0, 0.1607843, 1, 1,
0.3483889, 1.002061, 0.3900999, 0, 0.1529412, 1, 1,
0.3500473, -0.6046963, 0.9337658, 0, 0.1490196, 1, 1,
0.3517317, 1.192618, -0.7482045, 0, 0.1411765, 1, 1,
0.3560567, 1.347955, 2.276652, 0, 0.1372549, 1, 1,
0.3584977, -0.1347288, 2.191325, 0, 0.1294118, 1, 1,
0.3588329, -0.5495263, 4.494166, 0, 0.1254902, 1, 1,
0.3597958, 0.8202014, 3.745209, 0, 0.1176471, 1, 1,
0.3648942, -0.3188147, 2.323004, 0, 0.1137255, 1, 1,
0.3697617, 2.493049, 0.2922246, 0, 0.1058824, 1, 1,
0.3846855, -0.1586755, 0.0972481, 0, 0.09803922, 1, 1,
0.3856281, -0.02811616, 0.8179412, 0, 0.09411765, 1, 1,
0.3893786, -0.4237949, 1.513557, 0, 0.08627451, 1, 1,
0.3981429, 0.4937182, 0.424991, 0, 0.08235294, 1, 1,
0.398679, -0.1872571, 2.426404, 0, 0.07450981, 1, 1,
0.3996566, 0.2045446, 1.176971, 0, 0.07058824, 1, 1,
0.4022956, 1.872004, 2.489782, 0, 0.0627451, 1, 1,
0.4027731, -1.074341, 4.217471, 0, 0.05882353, 1, 1,
0.4048844, -0.09249815, 1.153986, 0, 0.05098039, 1, 1,
0.4063706, -0.5338099, 3.029162, 0, 0.04705882, 1, 1,
0.4153584, -1.104434, 4.642042, 0, 0.03921569, 1, 1,
0.4165244, -0.6202528, 2.530518, 0, 0.03529412, 1, 1,
0.4176016, -0.915581, 2.747745, 0, 0.02745098, 1, 1,
0.4226063, 0.2263279, 2.592107, 0, 0.02352941, 1, 1,
0.4306621, -0.8129322, 2.132204, 0, 0.01568628, 1, 1,
0.432068, -0.1091831, 1.162335, 0, 0.01176471, 1, 1,
0.4326333, 1.123222, -0.9987988, 0, 0.003921569, 1, 1,
0.4338233, 0.03025704, 0.6224718, 0.003921569, 0, 1, 1,
0.4339112, -1.602565, 2.845393, 0.007843138, 0, 1, 1,
0.4429868, -0.6398816, 2.077822, 0.01568628, 0, 1, 1,
0.4482259, -0.3363106, 3.02, 0.01960784, 0, 1, 1,
0.4535109, 1.332025, 2.388565, 0.02745098, 0, 1, 1,
0.4600848, 0.6758594, -1.027638, 0.03137255, 0, 1, 1,
0.4607843, -0.1694013, 2.550975, 0.03921569, 0, 1, 1,
0.461576, -0.06661938, 0.5171014, 0.04313726, 0, 1, 1,
0.4641326, -0.1112832, 1.671699, 0.05098039, 0, 1, 1,
0.4657201, -0.3409752, 2.439226, 0.05490196, 0, 1, 1,
0.4676688, -0.02971042, 1.838479, 0.0627451, 0, 1, 1,
0.4679595, 0.1091687, 0.9213668, 0.06666667, 0, 1, 1,
0.4725917, -1.094159, 1.37782, 0.07450981, 0, 1, 1,
0.4729111, -1.391621, 2.65462, 0.07843138, 0, 1, 1,
0.4750752, 0.5664557, 1.00694, 0.08627451, 0, 1, 1,
0.4758073, 0.6463667, -0.120883, 0.09019608, 0, 1, 1,
0.4786426, 1.797111, 0.1262764, 0.09803922, 0, 1, 1,
0.4794116, -1.196998, 3.176544, 0.1058824, 0, 1, 1,
0.4821224, -1.316192, 2.276474, 0.1098039, 0, 1, 1,
0.4859776, 0.019159, 1.979963, 0.1176471, 0, 1, 1,
0.4991778, 0.6288968, -0.0258717, 0.1215686, 0, 1, 1,
0.5019977, -0.8046362, 2.658301, 0.1294118, 0, 1, 1,
0.5030718, 0.4686706, 1.202307, 0.1333333, 0, 1, 1,
0.5041575, 0.1455371, 1.066778, 0.1411765, 0, 1, 1,
0.5069257, 0.9252908, 0.3718953, 0.145098, 0, 1, 1,
0.5084965, 1.722578, 0.5120512, 0.1529412, 0, 1, 1,
0.5099513, 0.5248778, -1.406504, 0.1568628, 0, 1, 1,
0.521877, 1.202296, -0.8677729, 0.1647059, 0, 1, 1,
0.5223348, 0.7847866, 0.6147417, 0.1686275, 0, 1, 1,
0.523748, 1.650199, -1.082776, 0.1764706, 0, 1, 1,
0.5269675, 0.844472, 0.3468779, 0.1803922, 0, 1, 1,
0.527103, 0.1471161, 0.5913019, 0.1882353, 0, 1, 1,
0.5298304, -0.4011594, 2.992879, 0.1921569, 0, 1, 1,
0.5354939, -1.796996, 2.49403, 0.2, 0, 1, 1,
0.5374042, -0.7643415, 2.311096, 0.2078431, 0, 1, 1,
0.54167, -0.2289645, 3.255669, 0.2117647, 0, 1, 1,
0.5462253, 1.124913, -0.6733682, 0.2196078, 0, 1, 1,
0.5473511, -0.1302633, 0.4492531, 0.2235294, 0, 1, 1,
0.5487095, -1.217706, 2.852325, 0.2313726, 0, 1, 1,
0.5493834, 0.04688981, 1.757222, 0.2352941, 0, 1, 1,
0.54949, 0.2373925, 1.6813, 0.2431373, 0, 1, 1,
0.5494956, -0.2715721, 3.774893, 0.2470588, 0, 1, 1,
0.5530568, -0.05712038, 1.947452, 0.254902, 0, 1, 1,
0.5605419, 0.4715227, 2.176041, 0.2588235, 0, 1, 1,
0.5643932, 0.3873335, 2.987295, 0.2666667, 0, 1, 1,
0.5653823, 0.05321657, 0.6054468, 0.2705882, 0, 1, 1,
0.56945, -1.237316, 2.596413, 0.2784314, 0, 1, 1,
0.5812938, 3.330153, 1.36904, 0.282353, 0, 1, 1,
0.5823282, -0.2776797, 3.605463, 0.2901961, 0, 1, 1,
0.5846173, -0.7383331, 1.741488, 0.2941177, 0, 1, 1,
0.5912272, -1.51059, 2.976364, 0.3019608, 0, 1, 1,
0.5916755, 1.406157, 1.117495, 0.3098039, 0, 1, 1,
0.5947205, 2.816694, -0.9250392, 0.3137255, 0, 1, 1,
0.5962921, -0.2080829, 3.46446, 0.3215686, 0, 1, 1,
0.5971192, -0.7196375, 1.870088, 0.3254902, 0, 1, 1,
0.5979997, 1.398994, 0.8278815, 0.3333333, 0, 1, 1,
0.6064764, 0.5163573, 2.26883, 0.3372549, 0, 1, 1,
0.6068941, -1.586054, 2.324501, 0.345098, 0, 1, 1,
0.6086672, -0.2989419, 1.669667, 0.3490196, 0, 1, 1,
0.6109155, -1.040076, 3.554729, 0.3568628, 0, 1, 1,
0.6151145, 1.082618, -0.2897023, 0.3607843, 0, 1, 1,
0.6199032, -0.02863169, 1.505671, 0.3686275, 0, 1, 1,
0.6233478, -0.8409739, 4.241301, 0.372549, 0, 1, 1,
0.6265553, 0.848711, 2.30441, 0.3803922, 0, 1, 1,
0.6277834, -1.209036, 2.540705, 0.3843137, 0, 1, 1,
0.6307384, -1.379212, 1.423273, 0.3921569, 0, 1, 1,
0.6326458, -0.77349, 1.461148, 0.3960784, 0, 1, 1,
0.6339515, -1.376261, 2.143363, 0.4039216, 0, 1, 1,
0.6363364, 0.09328175, 2.110723, 0.4117647, 0, 1, 1,
0.6434875, -0.5923384, 0.890327, 0.4156863, 0, 1, 1,
0.6435484, -2.176311, 3.174271, 0.4235294, 0, 1, 1,
0.6453962, 0.7447833, -0.9112054, 0.427451, 0, 1, 1,
0.6458395, 0.601426, 0.5381858, 0.4352941, 0, 1, 1,
0.6471839, 1.734176, 0.4565468, 0.4392157, 0, 1, 1,
0.649759, -0.8582072, 3.415144, 0.4470588, 0, 1, 1,
0.6552506, 0.1405538, 1.418193, 0.4509804, 0, 1, 1,
0.6577545, 0.7633067, 0.7663844, 0.4588235, 0, 1, 1,
0.6593994, 1.660348, 1.452863, 0.4627451, 0, 1, 1,
0.6610049, 0.4240074, 0.8583525, 0.4705882, 0, 1, 1,
0.6643614, -0.7072068, 2.799885, 0.4745098, 0, 1, 1,
0.6668836, -0.4545151, 1.977382, 0.4823529, 0, 1, 1,
0.6718889, -0.2097153, 1.135308, 0.4862745, 0, 1, 1,
0.6730655, -0.005057299, 0.7828993, 0.4941176, 0, 1, 1,
0.6734424, -0.3457745, 1.785939, 0.5019608, 0, 1, 1,
0.6763227, 0.9397371, 2.06073, 0.5058824, 0, 1, 1,
0.6764414, 0.2543563, 0.8592784, 0.5137255, 0, 1, 1,
0.6785902, 0.6322099, 1.693544, 0.5176471, 0, 1, 1,
0.68668, -0.2135349, 2.338521, 0.5254902, 0, 1, 1,
0.6882272, -0.5341036, 0.9076757, 0.5294118, 0, 1, 1,
0.6893017, -0.8147091, 2.626543, 0.5372549, 0, 1, 1,
0.6909001, -1.749103, 2.632381, 0.5411765, 0, 1, 1,
0.6965742, -1.124719, 2.522183, 0.5490196, 0, 1, 1,
0.7013152, 0.9161038, 0.03178496, 0.5529412, 0, 1, 1,
0.7022876, -1.289029, 1.921039, 0.5607843, 0, 1, 1,
0.7028638, 0.1121174, 0.1512665, 0.5647059, 0, 1, 1,
0.7077716, -0.9842061, 2.612462, 0.572549, 0, 1, 1,
0.7079541, 0.1465296, -0.5492177, 0.5764706, 0, 1, 1,
0.7101656, 0.0287829, 3.166441, 0.5843138, 0, 1, 1,
0.7120176, 0.1181845, 2.120888, 0.5882353, 0, 1, 1,
0.7366031, 0.5207961, 0.8416493, 0.5960785, 0, 1, 1,
0.7366118, 1.043902, 1.208378, 0.6039216, 0, 1, 1,
0.7373059, -1.356952, 2.611315, 0.6078432, 0, 1, 1,
0.7378083, -1.522157, 3.497722, 0.6156863, 0, 1, 1,
0.739151, -1.21487, 4.146655, 0.6196079, 0, 1, 1,
0.7391895, 1.761661, 0.6485203, 0.627451, 0, 1, 1,
0.7400233, 1.087558, 2.803183, 0.6313726, 0, 1, 1,
0.7418637, -0.2580605, 1.360702, 0.6392157, 0, 1, 1,
0.7450635, 0.4530017, 1.819086, 0.6431373, 0, 1, 1,
0.7461305, -0.206301, 2.486756, 0.6509804, 0, 1, 1,
0.7464063, -0.5831061, 3.300967, 0.654902, 0, 1, 1,
0.7504437, 0.1045724, 0.3190423, 0.6627451, 0, 1, 1,
0.7518418, 0.1090662, 1.13665, 0.6666667, 0, 1, 1,
0.7551935, -0.5483416, 3.127942, 0.6745098, 0, 1, 1,
0.7560949, 0.8805096, 0.6972262, 0.6784314, 0, 1, 1,
0.7591833, -0.1432707, 1.844734, 0.6862745, 0, 1, 1,
0.7676882, -0.0001720279, 2.827816, 0.6901961, 0, 1, 1,
0.7715076, 0.02525507, 0.8436664, 0.6980392, 0, 1, 1,
0.7721841, 1.137106, -0.1431115, 0.7058824, 0, 1, 1,
0.7790568, 0.6634413, -0.01600778, 0.7098039, 0, 1, 1,
0.7802956, 1.191435, 1.95819, 0.7176471, 0, 1, 1,
0.7846586, -1.32064, 2.808582, 0.7215686, 0, 1, 1,
0.7846916, -0.8945884, 1.093848, 0.7294118, 0, 1, 1,
0.7866759, -0.5865443, 1.458127, 0.7333333, 0, 1, 1,
0.7971236, -2.377044, 1.457555, 0.7411765, 0, 1, 1,
0.8000726, 0.3018599, 0.2672249, 0.7450981, 0, 1, 1,
0.8035489, 1.06589, 4.215407, 0.7529412, 0, 1, 1,
0.8072212, 0.8070927, -0.8657301, 0.7568628, 0, 1, 1,
0.8086751, 2.569278, 1.686936, 0.7647059, 0, 1, 1,
0.8094807, -0.561834, 1.094568, 0.7686275, 0, 1, 1,
0.8117988, 1.369831, 0.09049271, 0.7764706, 0, 1, 1,
0.814528, 0.2893992, 1.03651, 0.7803922, 0, 1, 1,
0.817359, 1.233388, 1.261101, 0.7882353, 0, 1, 1,
0.8216214, -0.1907531, 2.319534, 0.7921569, 0, 1, 1,
0.825316, -1.119739, 1.141199, 0.8, 0, 1, 1,
0.8266107, 0.6299973, -0.5458192, 0.8078431, 0, 1, 1,
0.8288081, -0.01550773, 0.6027258, 0.8117647, 0, 1, 1,
0.8319504, -1.614933, 1.641139, 0.8196079, 0, 1, 1,
0.8345639, 1.090687, 1.253995, 0.8235294, 0, 1, 1,
0.8456796, 0.776374, 1.7431, 0.8313726, 0, 1, 1,
0.8481485, 0.1082509, 1.842299, 0.8352941, 0, 1, 1,
0.8486726, -2.723472, 2.400757, 0.8431373, 0, 1, 1,
0.8507915, -2.993489, 1.013433, 0.8470588, 0, 1, 1,
0.8508126, 0.2698554, 2.729069, 0.854902, 0, 1, 1,
0.8567064, 1.169479, 0.6737725, 0.8588235, 0, 1, 1,
0.8572052, -2.646648, 1.939765, 0.8666667, 0, 1, 1,
0.8575498, -0.3389406, -0.1061629, 0.8705882, 0, 1, 1,
0.8594466, -0.7011694, 2.381385, 0.8784314, 0, 1, 1,
0.8659061, 0.4484539, 0.4056671, 0.8823529, 0, 1, 1,
0.8662218, -0.1020879, 2.355726, 0.8901961, 0, 1, 1,
0.8679234, -0.1805966, 0.427337, 0.8941177, 0, 1, 1,
0.8682751, -0.4658446, 2.594571, 0.9019608, 0, 1, 1,
0.8724421, -2.128255, 2.037818, 0.9098039, 0, 1, 1,
0.8738899, 0.8049849, 0.1550518, 0.9137255, 0, 1, 1,
0.8859918, 0.5089478, 1.83926, 0.9215686, 0, 1, 1,
0.8901613, 1.073782, 1.313245, 0.9254902, 0, 1, 1,
0.8964511, -0.02836404, 2.113439, 0.9333333, 0, 1, 1,
0.8967457, -1.440051, 2.655897, 0.9372549, 0, 1, 1,
0.9012747, 1.628859, 0.1907844, 0.945098, 0, 1, 1,
0.9045175, 0.9016551, 1.315827, 0.9490196, 0, 1, 1,
0.9052133, -0.002563406, 2.504406, 0.9568627, 0, 1, 1,
0.9063649, 0.9949387, -0.1040767, 0.9607843, 0, 1, 1,
0.9114711, 0.2376115, 1.093644, 0.9686275, 0, 1, 1,
0.9164528, -1.160897, 4.93539, 0.972549, 0, 1, 1,
0.918526, 0.8780857, 1.926942, 0.9803922, 0, 1, 1,
0.9232759, -0.9967179, 3.686004, 0.9843137, 0, 1, 1,
0.9233191, 0.9490246, 1.087692, 0.9921569, 0, 1, 1,
0.9252643, 0.6948857, 0.7962433, 0.9960784, 0, 1, 1,
0.9254858, 0.5865017, 2.35368, 1, 0, 0.9960784, 1,
0.9328846, -2.524792, 3.593802, 1, 0, 0.9882353, 1,
0.9334605, 0.2088528, 0.4849487, 1, 0, 0.9843137, 1,
0.9338444, -1.698963, 2.064699, 1, 0, 0.9764706, 1,
0.9438187, 1.826633, 0.3177296, 1, 0, 0.972549, 1,
0.9476715, 0.8751994, 1.588551, 1, 0, 0.9647059, 1,
0.9531958, -0.004265618, -0.1814895, 1, 0, 0.9607843, 1,
0.9621931, -1.018634, 3.444918, 1, 0, 0.9529412, 1,
0.969888, 1.264464, 2.00689, 1, 0, 0.9490196, 1,
0.9941799, 0.2341194, 1.110936, 1, 0, 0.9411765, 1,
0.9983626, -0.2854393, 1.581358, 1, 0, 0.9372549, 1,
0.9983916, -1.819634, 2.572332, 1, 0, 0.9294118, 1,
1.000583, -0.2183838, 0.5047596, 1, 0, 0.9254902, 1,
1.000595, 1.36766, 1.0735, 1, 0, 0.9176471, 1,
1.003384, 1.501438, 0.5189918, 1, 0, 0.9137255, 1,
1.004882, 0.1088026, 1.868599, 1, 0, 0.9058824, 1,
1.005125, 0.3606362, 0.7636737, 1, 0, 0.9019608, 1,
1.012054, -0.9829361, 3.477662, 1, 0, 0.8941177, 1,
1.013572, -0.04676544, 0.0694883, 1, 0, 0.8862745, 1,
1.013587, -1.150962, 1.649694, 1, 0, 0.8823529, 1,
1.017326, 1.43711, 0.7377687, 1, 0, 0.8745098, 1,
1.025862, -0.7449376, 3.02351, 1, 0, 0.8705882, 1,
1.04415, -0.07428125, 0.4464931, 1, 0, 0.8627451, 1,
1.044598, -0.06746764, 2.456203, 1, 0, 0.8588235, 1,
1.051089, -1.07705, 1.521738, 1, 0, 0.8509804, 1,
1.05208, 1.927433, 1.506134, 1, 0, 0.8470588, 1,
1.052554, -0.743501, 0.4488495, 1, 0, 0.8392157, 1,
1.052925, 0.06959654, 2.54746, 1, 0, 0.8352941, 1,
1.057354, 2.521003, 0.7980603, 1, 0, 0.827451, 1,
1.061836, 0.5677915, 1.319661, 1, 0, 0.8235294, 1,
1.069655, 0.1222436, 1.015983, 1, 0, 0.8156863, 1,
1.071791, 0.5212956, 2.472939, 1, 0, 0.8117647, 1,
1.076432, 1.232428, 3.148609, 1, 0, 0.8039216, 1,
1.076969, -1.60635, 1.090924, 1, 0, 0.7960784, 1,
1.078046, -0.4988329, 0.4533616, 1, 0, 0.7921569, 1,
1.078225, 0.3743567, 0.7829034, 1, 0, 0.7843137, 1,
1.086105, 1.423269, 2.360823, 1, 0, 0.7803922, 1,
1.092264, 0.09525715, 2.440667, 1, 0, 0.772549, 1,
1.106652, 0.4126001, 0.7411923, 1, 0, 0.7686275, 1,
1.118698, -0.03559364, 1.362931, 1, 0, 0.7607843, 1,
1.126123, -0.8906822, 1.833692, 1, 0, 0.7568628, 1,
1.127538, 0.3934716, 2.820662, 1, 0, 0.7490196, 1,
1.13044, 0.4423644, 2.407313, 1, 0, 0.7450981, 1,
1.136941, 0.2155329, 0.1507013, 1, 0, 0.7372549, 1,
1.138088, -0.1970184, 2.545149, 1, 0, 0.7333333, 1,
1.142332, -1.094044, 2.29824, 1, 0, 0.7254902, 1,
1.143188, -1.31051, 0.8991546, 1, 0, 0.7215686, 1,
1.149096, 0.2179136, 3.15485, 1, 0, 0.7137255, 1,
1.151175, -0.2528947, 2.627735, 1, 0, 0.7098039, 1,
1.153659, 2.457999, 0.4824083, 1, 0, 0.7019608, 1,
1.157792, 0.6721671, 2.688842, 1, 0, 0.6941177, 1,
1.173521, -1.303508, 3.666717, 1, 0, 0.6901961, 1,
1.182557, 0.5450713, 1.65372, 1, 0, 0.682353, 1,
1.183176, 0.997718, 0.3583944, 1, 0, 0.6784314, 1,
1.183303, -2.482359, 2.953334, 1, 0, 0.6705883, 1,
1.198519, -0.4300689, 0.6245254, 1, 0, 0.6666667, 1,
1.200084, -0.4958078, 0.1732966, 1, 0, 0.6588235, 1,
1.21298, 1.720116, 1.361252, 1, 0, 0.654902, 1,
1.213274, 0.3032802, 2.808469, 1, 0, 0.6470588, 1,
1.214919, -0.3834781, 1.168061, 1, 0, 0.6431373, 1,
1.216434, 1.403935, 1.136335, 1, 0, 0.6352941, 1,
1.222965, -1.324937, 2.461459, 1, 0, 0.6313726, 1,
1.227381, -0.2021673, 0.9393887, 1, 0, 0.6235294, 1,
1.228235, 0.09533258, 1.996579, 1, 0, 0.6196079, 1,
1.232807, 1.065252, 1.911687, 1, 0, 0.6117647, 1,
1.24251, -0.185062, 1.305925, 1, 0, 0.6078432, 1,
1.24502, 0.6587511, 2.17018, 1, 0, 0.6, 1,
1.246467, 0.1280427, 1.639245, 1, 0, 0.5921569, 1,
1.251748, -0.2716516, 1.594216, 1, 0, 0.5882353, 1,
1.253512, -0.1591761, 0.8006651, 1, 0, 0.5803922, 1,
1.25453, 0.8747505, 1.95455, 1, 0, 0.5764706, 1,
1.256111, 0.02492239, 1.762491, 1, 0, 0.5686275, 1,
1.269153, 0.1842286, 2.464475, 1, 0, 0.5647059, 1,
1.276431, 0.2303006, 1.779355, 1, 0, 0.5568628, 1,
1.278017, 1.152793, 1.194407, 1, 0, 0.5529412, 1,
1.296147, 0.2933763, 0.78089, 1, 0, 0.5450981, 1,
1.298963, -0.03072806, 0.3179407, 1, 0, 0.5411765, 1,
1.303829, 0.428046, 0.06710949, 1, 0, 0.5333334, 1,
1.306921, -1.873055, 3.051807, 1, 0, 0.5294118, 1,
1.308238, 0.1788994, -0.3940213, 1, 0, 0.5215687, 1,
1.316689, -0.146747, 0.7205748, 1, 0, 0.5176471, 1,
1.334739, 0.9605803, 1.32242, 1, 0, 0.509804, 1,
1.346839, -0.8106968, 1.978513, 1, 0, 0.5058824, 1,
1.355159, -0.8834575, 2.708409, 1, 0, 0.4980392, 1,
1.36203, -0.2417739, 1.053882, 1, 0, 0.4901961, 1,
1.36699, 0.41421, 1.723464, 1, 0, 0.4862745, 1,
1.369515, -0.4495938, 1.233201, 1, 0, 0.4784314, 1,
1.379744, -0.4479517, 0.07682464, 1, 0, 0.4745098, 1,
1.397995, 0.7746329, 1.384131, 1, 0, 0.4666667, 1,
1.400431, -2.261775, 3.786557, 1, 0, 0.4627451, 1,
1.409952, 0.358077, 1.180326, 1, 0, 0.454902, 1,
1.414797, -1.231549, 2.614468, 1, 0, 0.4509804, 1,
1.431476, 0.1581325, 3.239671, 1, 0, 0.4431373, 1,
1.438376, 1.358664, 0.3673396, 1, 0, 0.4392157, 1,
1.438835, -0.6072973, 1.510567, 1, 0, 0.4313726, 1,
1.4441, 0.7132349, 0.3926307, 1, 0, 0.427451, 1,
1.446253, 0.1420785, 3.355407, 1, 0, 0.4196078, 1,
1.44633, 0.4394907, 3.604655, 1, 0, 0.4156863, 1,
1.451546, -1.687414, 2.766384, 1, 0, 0.4078431, 1,
1.457834, -0.5561916, 1.649034, 1, 0, 0.4039216, 1,
1.457894, -1.286877, 1.891664, 1, 0, 0.3960784, 1,
1.463852, -0.1656365, 2.199141, 1, 0, 0.3882353, 1,
1.482241, -0.5311188, 0.2756689, 1, 0, 0.3843137, 1,
1.48714, -0.3266541, -0.1155333, 1, 0, 0.3764706, 1,
1.490824, -1.675919, 2.846195, 1, 0, 0.372549, 1,
1.492278, -0.248311, 0.1291128, 1, 0, 0.3647059, 1,
1.492976, -0.9846527, 3.328951, 1, 0, 0.3607843, 1,
1.494099, -1.043648, 1.300427, 1, 0, 0.3529412, 1,
1.504593, 1.476288, 1.308751, 1, 0, 0.3490196, 1,
1.522289, 0.06552058, 2.026278, 1, 0, 0.3411765, 1,
1.523073, -0.6553415, 3.06625, 1, 0, 0.3372549, 1,
1.530199, 0.4252988, 0.8561854, 1, 0, 0.3294118, 1,
1.531323, 1.399829, 1.536618, 1, 0, 0.3254902, 1,
1.532084, 1.038006, 0.9339262, 1, 0, 0.3176471, 1,
1.549054, -1.029593, -0.1653699, 1, 0, 0.3137255, 1,
1.558854, 0.4863001, 0.5352485, 1, 0, 0.3058824, 1,
1.560169, 0.7569227, 2.190278, 1, 0, 0.2980392, 1,
1.581063, -1.98932, 3.021289, 1, 0, 0.2941177, 1,
1.58481, 0.5965989, 1.459538, 1, 0, 0.2862745, 1,
1.584841, 0.3828679, 0.776834, 1, 0, 0.282353, 1,
1.585863, 1.009376, 1.333646, 1, 0, 0.2745098, 1,
1.59619, -1.796376, 3.480402, 1, 0, 0.2705882, 1,
1.608952, 2.897513, 0.4904834, 1, 0, 0.2627451, 1,
1.618392, -0.3028802, 1.992677, 1, 0, 0.2588235, 1,
1.651867, -1.001349, 2.679049, 1, 0, 0.2509804, 1,
1.663074, 0.6667283, 2.01156, 1, 0, 0.2470588, 1,
1.669885, -0.1415356, 0.7841287, 1, 0, 0.2392157, 1,
1.675673, -1.398352, 1.166598, 1, 0, 0.2352941, 1,
1.709847, 1.287254, 0.9479906, 1, 0, 0.227451, 1,
1.711002, 0.0543986, 2.268879, 1, 0, 0.2235294, 1,
1.724454, 2.086568, -0.4948181, 1, 0, 0.2156863, 1,
1.726354, -1.912653, 1.578259, 1, 0, 0.2117647, 1,
1.738797, 0.3053408, 1.369279, 1, 0, 0.2039216, 1,
1.74432, 1.007953, 1.324479, 1, 0, 0.1960784, 1,
1.749807, -1.575165, 2.809883, 1, 0, 0.1921569, 1,
1.751648, -0.273527, 0.6174657, 1, 0, 0.1843137, 1,
1.76669, -0.08254715, -0.140332, 1, 0, 0.1803922, 1,
1.776667, -1.31738, 1.745522, 1, 0, 0.172549, 1,
1.798015, -0.9517528, 1.100632, 1, 0, 0.1686275, 1,
1.811063, 0.9578948, -0.2212471, 1, 0, 0.1607843, 1,
1.823542, 0.3632773, 1.067281, 1, 0, 0.1568628, 1,
1.82662, -0.9042438, 2.684444, 1, 0, 0.1490196, 1,
1.846419, -0.5334944, 2.861156, 1, 0, 0.145098, 1,
1.853269, -0.81817, 1.049597, 1, 0, 0.1372549, 1,
1.920499, 1.28117, 0.8427299, 1, 0, 0.1333333, 1,
1.948255, 1.315133, 3.336048, 1, 0, 0.1254902, 1,
1.957766, 0.01662718, 1.638492, 1, 0, 0.1215686, 1,
1.996384, 0.2840502, 0.9790442, 1, 0, 0.1137255, 1,
2.069927, 0.09601227, 1.126925, 1, 0, 0.1098039, 1,
2.071592, -0.2413191, 2.357022, 1, 0, 0.1019608, 1,
2.080832, 0.9564047, 0.1641872, 1, 0, 0.09411765, 1,
2.087037, 1.843713, 2.393427, 1, 0, 0.09019608, 1,
2.087188, -0.01707116, 1.619414, 1, 0, 0.08235294, 1,
2.132348, 0.08383781, 1.369205, 1, 0, 0.07843138, 1,
2.188024, -0.7439098, 2.170514, 1, 0, 0.07058824, 1,
2.270857, -0.9113614, 3.048198, 1, 0, 0.06666667, 1,
2.294586, -2.04638, 1.879495, 1, 0, 0.05882353, 1,
2.340597, -0.4496022, 1.582361, 1, 0, 0.05490196, 1,
2.351303, 0.08975089, 1.89878, 1, 0, 0.04705882, 1,
2.363355, -0.1965766, 2.873504, 1, 0, 0.04313726, 1,
2.390417, 0.3416098, 1.124486, 1, 0, 0.03529412, 1,
2.488313, -0.6456988, 2.689063, 1, 0, 0.03137255, 1,
3.004643, -0.1360217, 0.1988438, 1, 0, 0.02352941, 1,
3.030368, -0.1970038, 1.386266, 1, 0, 0.01960784, 1,
3.229423, -1.408943, 0.8052735, 1, 0, 0.01176471, 1,
3.285765, -0.501363, 0.8442931, 1, 0, 0.007843138, 1
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
0.2035643, -4.323832, -7.013769, 0, -0.5, 0.5, 0.5,
0.2035643, -4.323832, -7.013769, 1, -0.5, 0.5, 0.5,
0.2035643, -4.323832, -7.013769, 1, 1.5, 0.5, 0.5,
0.2035643, -4.323832, -7.013769, 0, 1.5, 0.5, 0.5
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
-3.923503, 0.05782056, -7.013769, 0, -0.5, 0.5, 0.5,
-3.923503, 0.05782056, -7.013769, 1, -0.5, 0.5, 0.5,
-3.923503, 0.05782056, -7.013769, 1, 1.5, 0.5, 0.5,
-3.923503, 0.05782056, -7.013769, 0, 1.5, 0.5, 0.5
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
-3.923503, -4.323832, 0.04987693, 0, -0.5, 0.5, 0.5,
-3.923503, -4.323832, 0.04987693, 1, -0.5, 0.5, 0.5,
-3.923503, -4.323832, 0.04987693, 1, 1.5, 0.5, 0.5,
-3.923503, -4.323832, 0.04987693, 0, 1.5, 0.5, 0.5
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
-2, -3.312682, -5.383697,
3, -3.312682, -5.383697,
-2, -3.312682, -5.383697,
-2, -3.481207, -5.655376,
-1, -3.312682, -5.383697,
-1, -3.481207, -5.655376,
0, -3.312682, -5.383697,
0, -3.481207, -5.655376,
1, -3.312682, -5.383697,
1, -3.481207, -5.655376,
2, -3.312682, -5.383697,
2, -3.481207, -5.655376,
3, -3.312682, -5.383697,
3, -3.481207, -5.655376
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
-2, -3.818257, -6.198733, 0, -0.5, 0.5, 0.5,
-2, -3.818257, -6.198733, 1, -0.5, 0.5, 0.5,
-2, -3.818257, -6.198733, 1, 1.5, 0.5, 0.5,
-2, -3.818257, -6.198733, 0, 1.5, 0.5, 0.5,
-1, -3.818257, -6.198733, 0, -0.5, 0.5, 0.5,
-1, -3.818257, -6.198733, 1, -0.5, 0.5, 0.5,
-1, -3.818257, -6.198733, 1, 1.5, 0.5, 0.5,
-1, -3.818257, -6.198733, 0, 1.5, 0.5, 0.5,
0, -3.818257, -6.198733, 0, -0.5, 0.5, 0.5,
0, -3.818257, -6.198733, 1, -0.5, 0.5, 0.5,
0, -3.818257, -6.198733, 1, 1.5, 0.5, 0.5,
0, -3.818257, -6.198733, 0, 1.5, 0.5, 0.5,
1, -3.818257, -6.198733, 0, -0.5, 0.5, 0.5,
1, -3.818257, -6.198733, 1, -0.5, 0.5, 0.5,
1, -3.818257, -6.198733, 1, 1.5, 0.5, 0.5,
1, -3.818257, -6.198733, 0, 1.5, 0.5, 0.5,
2, -3.818257, -6.198733, 0, -0.5, 0.5, 0.5,
2, -3.818257, -6.198733, 1, -0.5, 0.5, 0.5,
2, -3.818257, -6.198733, 1, 1.5, 0.5, 0.5,
2, -3.818257, -6.198733, 0, 1.5, 0.5, 0.5,
3, -3.818257, -6.198733, 0, -0.5, 0.5, 0.5,
3, -3.818257, -6.198733, 1, -0.5, 0.5, 0.5,
3, -3.818257, -6.198733, 1, 1.5, 0.5, 0.5,
3, -3.818257, -6.198733, 0, 1.5, 0.5, 0.5
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
-2.971103, -3, -5.383697,
-2.971103, 3, -5.383697,
-2.971103, -3, -5.383697,
-3.129836, -3, -5.655376,
-2.971103, -2, -5.383697,
-3.129836, -2, -5.655376,
-2.971103, -1, -5.383697,
-3.129836, -1, -5.655376,
-2.971103, 0, -5.383697,
-3.129836, 0, -5.655376,
-2.971103, 1, -5.383697,
-3.129836, 1, -5.655376,
-2.971103, 2, -5.383697,
-3.129836, 2, -5.655376,
-2.971103, 3, -5.383697,
-3.129836, 3, -5.655376
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
-3.447303, -3, -6.198733, 0, -0.5, 0.5, 0.5,
-3.447303, -3, -6.198733, 1, -0.5, 0.5, 0.5,
-3.447303, -3, -6.198733, 1, 1.5, 0.5, 0.5,
-3.447303, -3, -6.198733, 0, 1.5, 0.5, 0.5,
-3.447303, -2, -6.198733, 0, -0.5, 0.5, 0.5,
-3.447303, -2, -6.198733, 1, -0.5, 0.5, 0.5,
-3.447303, -2, -6.198733, 1, 1.5, 0.5, 0.5,
-3.447303, -2, -6.198733, 0, 1.5, 0.5, 0.5,
-3.447303, -1, -6.198733, 0, -0.5, 0.5, 0.5,
-3.447303, -1, -6.198733, 1, -0.5, 0.5, 0.5,
-3.447303, -1, -6.198733, 1, 1.5, 0.5, 0.5,
-3.447303, -1, -6.198733, 0, 1.5, 0.5, 0.5,
-3.447303, 0, -6.198733, 0, -0.5, 0.5, 0.5,
-3.447303, 0, -6.198733, 1, -0.5, 0.5, 0.5,
-3.447303, 0, -6.198733, 1, 1.5, 0.5, 0.5,
-3.447303, 0, -6.198733, 0, 1.5, 0.5, 0.5,
-3.447303, 1, -6.198733, 0, -0.5, 0.5, 0.5,
-3.447303, 1, -6.198733, 1, -0.5, 0.5, 0.5,
-3.447303, 1, -6.198733, 1, 1.5, 0.5, 0.5,
-3.447303, 1, -6.198733, 0, 1.5, 0.5, 0.5,
-3.447303, 2, -6.198733, 0, -0.5, 0.5, 0.5,
-3.447303, 2, -6.198733, 1, -0.5, 0.5, 0.5,
-3.447303, 2, -6.198733, 1, 1.5, 0.5, 0.5,
-3.447303, 2, -6.198733, 0, 1.5, 0.5, 0.5,
-3.447303, 3, -6.198733, 0, -0.5, 0.5, 0.5,
-3.447303, 3, -6.198733, 1, -0.5, 0.5, 0.5,
-3.447303, 3, -6.198733, 1, 1.5, 0.5, 0.5,
-3.447303, 3, -6.198733, 0, 1.5, 0.5, 0.5
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
-2.971103, -3.312682, -4,
-2.971103, -3.312682, 4,
-2.971103, -3.312682, -4,
-3.129836, -3.481207, -4,
-2.971103, -3.312682, -2,
-3.129836, -3.481207, -2,
-2.971103, -3.312682, 0,
-3.129836, -3.481207, 0,
-2.971103, -3.312682, 2,
-3.129836, -3.481207, 2,
-2.971103, -3.312682, 4,
-3.129836, -3.481207, 4
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
-3.447303, -3.818257, -4, 0, -0.5, 0.5, 0.5,
-3.447303, -3.818257, -4, 1, -0.5, 0.5, 0.5,
-3.447303, -3.818257, -4, 1, 1.5, 0.5, 0.5,
-3.447303, -3.818257, -4, 0, 1.5, 0.5, 0.5,
-3.447303, -3.818257, -2, 0, -0.5, 0.5, 0.5,
-3.447303, -3.818257, -2, 1, -0.5, 0.5, 0.5,
-3.447303, -3.818257, -2, 1, 1.5, 0.5, 0.5,
-3.447303, -3.818257, -2, 0, 1.5, 0.5, 0.5,
-3.447303, -3.818257, 0, 0, -0.5, 0.5, 0.5,
-3.447303, -3.818257, 0, 1, -0.5, 0.5, 0.5,
-3.447303, -3.818257, 0, 1, 1.5, 0.5, 0.5,
-3.447303, -3.818257, 0, 0, 1.5, 0.5, 0.5,
-3.447303, -3.818257, 2, 0, -0.5, 0.5, 0.5,
-3.447303, -3.818257, 2, 1, -0.5, 0.5, 0.5,
-3.447303, -3.818257, 2, 1, 1.5, 0.5, 0.5,
-3.447303, -3.818257, 2, 0, 1.5, 0.5, 0.5,
-3.447303, -3.818257, 4, 0, -0.5, 0.5, 0.5,
-3.447303, -3.818257, 4, 1, -0.5, 0.5, 0.5,
-3.447303, -3.818257, 4, 1, 1.5, 0.5, 0.5,
-3.447303, -3.818257, 4, 0, 1.5, 0.5, 0.5
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
-2.971103, -3.312682, -5.383697,
-2.971103, 3.428323, -5.383697,
-2.971103, -3.312682, 5.483451,
-2.971103, 3.428323, 5.483451,
-2.971103, -3.312682, -5.383697,
-2.971103, -3.312682, 5.483451,
-2.971103, 3.428323, -5.383697,
-2.971103, 3.428323, 5.483451,
-2.971103, -3.312682, -5.383697,
3.378232, -3.312682, -5.383697,
-2.971103, -3.312682, 5.483451,
3.378232, -3.312682, 5.483451,
-2.971103, 3.428323, -5.383697,
3.378232, 3.428323, -5.383697,
-2.971103, 3.428323, 5.483451,
3.378232, 3.428323, 5.483451,
3.378232, -3.312682, -5.383697,
3.378232, 3.428323, -5.383697,
3.378232, -3.312682, 5.483451,
3.378232, 3.428323, 5.483451,
3.378232, -3.312682, -5.383697,
3.378232, -3.312682, 5.483451,
3.378232, 3.428323, -5.383697,
3.378232, 3.428323, 5.483451
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
var radius = 7.623966;
var distance = 33.91988;
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
mvMatrix.translate( -0.2035643, -0.05782056, -0.04987693 );
mvMatrix.scale( 1.298275, 1.222842, 0.7585413 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.91988);
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
pyriproxyfen<-read.table("pyriproxyfen.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-pyriproxyfen$V2
```

```
## Error in eval(expr, envir, enclos): object 'pyriproxyfen' not found
```

```r
y<-pyriproxyfen$V3
```

```
## Error in eval(expr, envir, enclos): object 'pyriproxyfen' not found
```

```r
z<-pyriproxyfen$V4
```

```
## Error in eval(expr, envir, enclos): object 'pyriproxyfen' not found
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
-2.878637, -0.3619073, -2.090877, 0, 0, 1, 1, 1,
-2.659855, -1.163582, -1.254928, 1, 0, 0, 1, 1,
-2.614735, 1.189107, -3.429428, 1, 0, 0, 1, 1,
-2.50714, -1.437731, -1.58709, 1, 0, 0, 1, 1,
-2.468678, -0.7388936, -1.490277, 1, 0, 0, 1, 1,
-2.406324, 0.3935607, -3.018498, 1, 0, 0, 1, 1,
-2.374843, -0.1365746, -0.5962386, 0, 0, 0, 1, 1,
-2.35897, -0.8286738, -0.8466414, 0, 0, 0, 1, 1,
-2.341515, -0.807759, -1.247943, 0, 0, 0, 1, 1,
-2.327421, 1.279841, 0.01018458, 0, 0, 0, 1, 1,
-2.311291, 2.708256, -1.168535, 0, 0, 0, 1, 1,
-2.281013, 0.488301, -2.768482, 0, 0, 0, 1, 1,
-2.267895, 1.881375, -0.2608837, 0, 0, 0, 1, 1,
-2.240214, 0.3037128, -2.137427, 1, 1, 1, 1, 1,
-2.238511, 1.489734, -0.9441332, 1, 1, 1, 1, 1,
-2.232868, 0.2468092, -1.078561, 1, 1, 1, 1, 1,
-2.223911, -0.2836589, -2.412708, 1, 1, 1, 1, 1,
-2.217336, 1.358193, -1.299944, 1, 1, 1, 1, 1,
-2.137265, 1.052396, -2.950913, 1, 1, 1, 1, 1,
-2.09115, 0.5367584, -2.88221, 1, 1, 1, 1, 1,
-2.085133, -0.8649464, -1.375732, 1, 1, 1, 1, 1,
-2.066331, -1.379159, -1.202613, 1, 1, 1, 1, 1,
-2.054658, -1.425766, -1.04519, 1, 1, 1, 1, 1,
-2.006718, -0.8818711, -1.986677, 1, 1, 1, 1, 1,
-1.992842, 1.355752, -0.378014, 1, 1, 1, 1, 1,
-1.992507, -1.092918, -2.518375, 1, 1, 1, 1, 1,
-1.956123, -1.712563, -1.700674, 1, 1, 1, 1, 1,
-1.905584, 0.6729648, -2.184987, 1, 1, 1, 1, 1,
-1.890523, 0.8823432, -2.531252, 0, 0, 1, 1, 1,
-1.877752, 0.437571, -0.8378235, 1, 0, 0, 1, 1,
-1.855881, 6.765029e-05, -2.065955, 1, 0, 0, 1, 1,
-1.854445, 1.398407, 0.8165931, 1, 0, 0, 1, 1,
-1.812186, -0.3827769, -2.395011, 1, 0, 0, 1, 1,
-1.760426, -0.5910542, -1.46206, 1, 0, 0, 1, 1,
-1.752196, -1.717081, -0.728699, 0, 0, 0, 1, 1,
-1.75143, 0.1013373, -0.06031387, 0, 0, 0, 1, 1,
-1.73262, 1.696807, 0.1982506, 0, 0, 0, 1, 1,
-1.708411, -0.1461191, -0.7336431, 0, 0, 0, 1, 1,
-1.697694, -1.150794, -0.965094, 0, 0, 0, 1, 1,
-1.672845, 0.8448535, -2.694319, 0, 0, 0, 1, 1,
-1.661254, -0.3682033, -2.943143, 0, 0, 0, 1, 1,
-1.655864, -0.09558082, 0.7742922, 1, 1, 1, 1, 1,
-1.62183, -0.8279393, -2.401118, 1, 1, 1, 1, 1,
-1.620088, 1.122698, -1.846295, 1, 1, 1, 1, 1,
-1.605926, 0.8756315, -0.7904387, 1, 1, 1, 1, 1,
-1.605142, -1.273558, -3.782956, 1, 1, 1, 1, 1,
-1.601226, -0.2922981, -1.366098, 1, 1, 1, 1, 1,
-1.596, 0.2551478, -0.965116, 1, 1, 1, 1, 1,
-1.577227, -0.9440006, -2.781693, 1, 1, 1, 1, 1,
-1.574072, -0.5268517, -1.62839, 1, 1, 1, 1, 1,
-1.573576, 0.4537233, -2.135863, 1, 1, 1, 1, 1,
-1.561605, 1.709428, -1.004656, 1, 1, 1, 1, 1,
-1.550578, 0.8837479, -0.7097586, 1, 1, 1, 1, 1,
-1.549526, -3.214512, -1.511978, 1, 1, 1, 1, 1,
-1.542356, 0.3205394, -3.229944, 1, 1, 1, 1, 1,
-1.527726, -0.7844157, -2.193732, 1, 1, 1, 1, 1,
-1.521818, 1.085466, -1.407187, 0, 0, 1, 1, 1,
-1.517945, -0.4238458, -2.022391, 1, 0, 0, 1, 1,
-1.511983, 0.5737438, -2.637231, 1, 0, 0, 1, 1,
-1.486306, 0.7347859, -1.239643, 1, 0, 0, 1, 1,
-1.466749, 0.03125386, -1.468873, 1, 0, 0, 1, 1,
-1.459893, 2.608372, -1.076419, 1, 0, 0, 1, 1,
-1.456769, -0.2794942, -3.555001, 0, 0, 0, 1, 1,
-1.453086, 1.524631, 0.8509924, 0, 0, 0, 1, 1,
-1.444565, 0.2567585, -1.430486, 0, 0, 0, 1, 1,
-1.443333, 0.9146991, -1.088927, 0, 0, 0, 1, 1,
-1.429542, 0.292358, -0.5416805, 0, 0, 0, 1, 1,
-1.423824, -0.5814543, -1.677902, 0, 0, 0, 1, 1,
-1.420269, 0.7415072, 0.5317689, 0, 0, 0, 1, 1,
-1.413764, 1.044142, -1.702976, 1, 1, 1, 1, 1,
-1.408966, 0.6027754, -1.35809, 1, 1, 1, 1, 1,
-1.397023, 0.02901537, -1.724653, 1, 1, 1, 1, 1,
-1.380432, 1.052237, -0.07336999, 1, 1, 1, 1, 1,
-1.365133, 0.09174196, -0.02566307, 1, 1, 1, 1, 1,
-1.36094, 0.5148456, -1.277568, 1, 1, 1, 1, 1,
-1.355209, 1.819234, 0.5696865, 1, 1, 1, 1, 1,
-1.339979, -0.5187173, -3.298973, 1, 1, 1, 1, 1,
-1.339192, -0.1005787, -0.09187226, 1, 1, 1, 1, 1,
-1.333045, -0.9142157, -2.141024, 1, 1, 1, 1, 1,
-1.332971, 2.276813, -0.5287488, 1, 1, 1, 1, 1,
-1.328298, -1.14463, -3.314943, 1, 1, 1, 1, 1,
-1.327102, -1.81498, -2.899498, 1, 1, 1, 1, 1,
-1.313348, -1.708315, -3.364825, 1, 1, 1, 1, 1,
-1.303318, -0.7627819, -0.5435991, 1, 1, 1, 1, 1,
-1.286397, 0.657002, -1.40865, 0, 0, 1, 1, 1,
-1.27799, 1.391445, -2.021895, 1, 0, 0, 1, 1,
-1.276857, 0.07105665, -2.188531, 1, 0, 0, 1, 1,
-1.270785, 0.0885898, -2.409749, 1, 0, 0, 1, 1,
-1.270521, -0.2897943, -2.326664, 1, 0, 0, 1, 1,
-1.262943, 0.8187994, -1.318672, 1, 0, 0, 1, 1,
-1.25772, 0.2349819, -1.220282, 0, 0, 0, 1, 1,
-1.256705, -0.07981528, -2.580743, 0, 0, 0, 1, 1,
-1.252082, 1.157655, 0.2919898, 0, 0, 0, 1, 1,
-1.250583, 0.3921424, 0.02972171, 0, 0, 0, 1, 1,
-1.247313, 0.3728669, -0.6831036, 0, 0, 0, 1, 1,
-1.23473, -0.5837265, -2.920752, 0, 0, 0, 1, 1,
-1.222897, -0.09117509, -0.6446614, 0, 0, 0, 1, 1,
-1.221897, 1.247503, -1.140557, 1, 1, 1, 1, 1,
-1.218823, 0.3441071, -2.015752, 1, 1, 1, 1, 1,
-1.215909, 0.1447001, -0.7646012, 1, 1, 1, 1, 1,
-1.214984, 0.1440097, -1.999972, 1, 1, 1, 1, 1,
-1.202393, -0.7892209, -2.840326, 1, 1, 1, 1, 1,
-1.201804, 0.5543079, -2.228492, 1, 1, 1, 1, 1,
-1.175354, 0.4199441, -0.1556606, 1, 1, 1, 1, 1,
-1.170216, -1.033855, 0.04053207, 1, 1, 1, 1, 1,
-1.166976, 0.7715545, -0.1467459, 1, 1, 1, 1, 1,
-1.16297, 0.6013222, 0.1862357, 1, 1, 1, 1, 1,
-1.161515, -1.231706, -1.263286, 1, 1, 1, 1, 1,
-1.158482, 0.5031769, -1.603742, 1, 1, 1, 1, 1,
-1.155617, -1.410413, -3.312889, 1, 1, 1, 1, 1,
-1.154122, -1.49713, -1.704268, 1, 1, 1, 1, 1,
-1.15396, 1.579834, -1.794862, 1, 1, 1, 1, 1,
-1.151863, -0.5221247, -1.733109, 0, 0, 1, 1, 1,
-1.151848, -0.3526683, -2.88618, 1, 0, 0, 1, 1,
-1.147898, 0.8768648, 0.05928486, 1, 0, 0, 1, 1,
-1.140872, 0.5545111, -1.422873, 1, 0, 0, 1, 1,
-1.13474, 1.102311, -0.4307121, 1, 0, 0, 1, 1,
-1.134473, -0.4370242, -1.697244, 1, 0, 0, 1, 1,
-1.132784, 1.854756, -0.7773119, 0, 0, 0, 1, 1,
-1.132315, 0.5802033, -0.01304144, 0, 0, 0, 1, 1,
-1.13175, 2.339788, -0.643105, 0, 0, 0, 1, 1,
-1.129699, -0.09847218, -2.165933, 0, 0, 0, 1, 1,
-1.128318, -0.3940488, -1.229228, 0, 0, 0, 1, 1,
-1.119941, -0.1067283, -2.427226, 0, 0, 0, 1, 1,
-1.119458, -0.2226312, -2.146306, 0, 0, 0, 1, 1,
-1.114787, 0.05894543, -2.674135, 1, 1, 1, 1, 1,
-1.112477, 1.23602, -1.000894, 1, 1, 1, 1, 1,
-1.103078, 1.407403, 0.7499414, 1, 1, 1, 1, 1,
-1.09924, -0.3137222, -1.823185, 1, 1, 1, 1, 1,
-1.09865, -1.377133, -2.188706, 1, 1, 1, 1, 1,
-1.097254, -1.468911, -2.987567, 1, 1, 1, 1, 1,
-1.094803, -1.345739, -1.338817, 1, 1, 1, 1, 1,
-1.086962, 0.9780973, -1.857001, 1, 1, 1, 1, 1,
-1.08483, -0.7264677, -2.40937, 1, 1, 1, 1, 1,
-1.080365, -0.6363937, -1.672423, 1, 1, 1, 1, 1,
-1.078847, -0.1973082, -0.6824231, 1, 1, 1, 1, 1,
-1.07191, -0.3749867, -2.734871, 1, 1, 1, 1, 1,
-1.067252, -0.3377943, -2.014106, 1, 1, 1, 1, 1,
-1.067191, -1.02363, -1.876389, 1, 1, 1, 1, 1,
-1.061498, -0.2171065, -2.330525, 1, 1, 1, 1, 1,
-1.055086, -0.5670654, -1.934974, 0, 0, 1, 1, 1,
-1.052873, 0.2189513, -2.022685, 1, 0, 0, 1, 1,
-1.037701, 0.03591233, -0.9281691, 1, 0, 0, 1, 1,
-1.033989, 0.8172696, -3.194024, 1, 0, 0, 1, 1,
-1.0329, -0.06807856, -2.516778, 1, 0, 0, 1, 1,
-1.027509, 0.5435699, -1.255426, 1, 0, 0, 1, 1,
-1.025471, 0.6353369, -0.4327966, 0, 0, 0, 1, 1,
-1.023232, -0.5126228, -1.703758, 0, 0, 0, 1, 1,
-1.014166, 0.04493432, -1.827217, 0, 0, 0, 1, 1,
-1.013903, 0.1624184, -2.361105, 0, 0, 0, 1, 1,
-1.009771, -0.7344754, -3.835607, 0, 0, 0, 1, 1,
-1.006567, -1.412722, -1.536127, 0, 0, 0, 1, 1,
-1.006179, 1.020785, -2.532754, 0, 0, 0, 1, 1,
-1.003574, -0.3754427, -1.684948, 1, 1, 1, 1, 1,
-0.999428, 0.4327343, -0.1655406, 1, 1, 1, 1, 1,
-0.99603, -0.5987703, -2.423045, 1, 1, 1, 1, 1,
-0.9754057, -0.8572485, -1.577224, 1, 1, 1, 1, 1,
-0.9708194, -1.160063, -2.532755, 1, 1, 1, 1, 1,
-0.9696635, 1.662126, -1.127002, 1, 1, 1, 1, 1,
-0.9592938, 1.821878, 0.2371971, 1, 1, 1, 1, 1,
-0.9588794, 0.4900083, -1.363782, 1, 1, 1, 1, 1,
-0.9588202, 0.08132695, 0.3611958, 1, 1, 1, 1, 1,
-0.9565095, 0.8424875, -2.784163, 1, 1, 1, 1, 1,
-0.9535745, 0.2568303, -0.2551443, 1, 1, 1, 1, 1,
-0.9519894, 2.112974, -0.466859, 1, 1, 1, 1, 1,
-0.9486611, 0.5984125, -1.546358, 1, 1, 1, 1, 1,
-0.9458662, 1.391707, -1.371349, 1, 1, 1, 1, 1,
-0.9376538, -0.617831, -2.051985, 1, 1, 1, 1, 1,
-0.9296901, 0.09860861, -1.604895, 0, 0, 1, 1, 1,
-0.9281251, 0.05607065, -2.556722, 1, 0, 0, 1, 1,
-0.9235421, -0.4560812, -3.240528, 1, 0, 0, 1, 1,
-0.9188032, 0.5131593, -0.2365136, 1, 0, 0, 1, 1,
-0.9166023, 2.204779, 0.6862929, 1, 0, 0, 1, 1,
-0.9108708, -1.36581, -3.218476, 1, 0, 0, 1, 1,
-0.9049566, 1.123525, -1.630752, 0, 0, 0, 1, 1,
-0.9048787, 1.022054, -2.16225, 0, 0, 0, 1, 1,
-0.9045315, 1.993164, 0.2855343, 0, 0, 0, 1, 1,
-0.9031352, -0.371147, -1.016453, 0, 0, 0, 1, 1,
-0.9010333, -0.9241269, -3.014015, 0, 0, 0, 1, 1,
-0.8979424, -0.9997247, -2.093734, 0, 0, 0, 1, 1,
-0.892674, -0.527051, -2.47582, 0, 0, 0, 1, 1,
-0.8854766, 0.4104161, -0.7063226, 1, 1, 1, 1, 1,
-0.8849305, -0.1149111, -2.074135, 1, 1, 1, 1, 1,
-0.8807439, -0.6533695, -5.225438, 1, 1, 1, 1, 1,
-0.8790751, 1.459237, 1.054944, 1, 1, 1, 1, 1,
-0.8769945, -0.05173101, -1.518832, 1, 1, 1, 1, 1,
-0.8732823, 2.173814, 0.526081, 1, 1, 1, 1, 1,
-0.8698515, 1.723146, -0.9107537, 1, 1, 1, 1, 1,
-0.86709, 0.1496105, -1.315839, 1, 1, 1, 1, 1,
-0.8666756, -0.05162021, -0.8271745, 1, 1, 1, 1, 1,
-0.8643189, -0.7091936, -2.480588, 1, 1, 1, 1, 1,
-0.8628657, 0.8985758, -0.7655419, 1, 1, 1, 1, 1,
-0.8479907, 1.010664, -1.012103, 1, 1, 1, 1, 1,
-0.8396702, -0.4520985, -0.844384, 1, 1, 1, 1, 1,
-0.8392658, -0.8894726, -2.639525, 1, 1, 1, 1, 1,
-0.8381991, -1.518435, -2.641932, 1, 1, 1, 1, 1,
-0.8322944, -0.2051468, -1.088332, 0, 0, 1, 1, 1,
-0.8321689, -0.2764668, -2.403104, 1, 0, 0, 1, 1,
-0.8271965, -1.788196, -2.390076, 1, 0, 0, 1, 1,
-0.8249953, 0.4940694, -0.7088274, 1, 0, 0, 1, 1,
-0.8232748, 0.4713076, -0.4063677, 1, 0, 0, 1, 1,
-0.8195575, 1.064301, 0.5638084, 1, 0, 0, 1, 1,
-0.819254, 1.089234, -3.234287, 0, 0, 0, 1, 1,
-0.8129177, -1.580506, -3.318378, 0, 0, 0, 1, 1,
-0.8119546, 1.636916, -0.8852728, 0, 0, 0, 1, 1,
-0.8103135, 0.8962904, -1.061753, 0, 0, 0, 1, 1,
-0.810143, -0.02124881, -2.117832, 0, 0, 0, 1, 1,
-0.8084504, -0.2761252, -1.984813, 0, 0, 0, 1, 1,
-0.8036602, -0.8596091, -3.185296, 0, 0, 0, 1, 1,
-0.794233, -0.289324, -3.402238, 1, 1, 1, 1, 1,
-0.7931811, -1.574261, -2.393948, 1, 1, 1, 1, 1,
-0.7931132, 0.2052048, -0.9539927, 1, 1, 1, 1, 1,
-0.7920337, 0.844091, -2.677701, 1, 1, 1, 1, 1,
-0.788006, -0.96408, -2.12773, 1, 1, 1, 1, 1,
-0.7878683, 0.5823725, -0.1556364, 1, 1, 1, 1, 1,
-0.7865155, 1.803543, -0.8485923, 1, 1, 1, 1, 1,
-0.7839391, 0.9889804, 0.1330868, 1, 1, 1, 1, 1,
-0.7800629, 1.045288, 0.04483004, 1, 1, 1, 1, 1,
-0.7798006, -1.008491, -3.016796, 1, 1, 1, 1, 1,
-0.7706944, -0.27058, -0.1951903, 1, 1, 1, 1, 1,
-0.7681873, 0.7101453, -1.432512, 1, 1, 1, 1, 1,
-0.76037, -1.643806, -3.468866, 1, 1, 1, 1, 1,
-0.7550278, 0.4831217, -2.102695, 1, 1, 1, 1, 1,
-0.7521771, -0.5695442, -2.099499, 1, 1, 1, 1, 1,
-0.7423159, 0.2815042, -2.640652, 0, 0, 1, 1, 1,
-0.7420047, -1.67983, -3.818418, 1, 0, 0, 1, 1,
-0.7382155, 2.104142, 0.657213, 1, 0, 0, 1, 1,
-0.7242925, 0.867783, -1.940124, 1, 0, 0, 1, 1,
-0.7210038, -1.907197, -2.649544, 1, 0, 0, 1, 1,
-0.7150407, -2.595847, -3.662536, 1, 0, 0, 1, 1,
-0.7055477, 0.3724432, -1.552758, 0, 0, 0, 1, 1,
-0.7054442, -0.9801936, -2.353876, 0, 0, 0, 1, 1,
-0.7047861, 0.870774, -0.4685704, 0, 0, 0, 1, 1,
-0.6953139, -0.1436097, -2.194247, 0, 0, 0, 1, 1,
-0.6931132, -0.04464899, -2.031816, 0, 0, 0, 1, 1,
-0.6874099, 1.007128, -2.043649, 0, 0, 0, 1, 1,
-0.6856507, -0.9353895, -1.350621, 0, 0, 0, 1, 1,
-0.679969, -0.6061546, -3.04733, 1, 1, 1, 1, 1,
-0.6789817, 2.026341, -1.090065, 1, 1, 1, 1, 1,
-0.6784793, -0.9631274, -2.195256, 1, 1, 1, 1, 1,
-0.6758903, -1.196949, -3.789721, 1, 1, 1, 1, 1,
-0.6728372, -1.489476, -2.76308, 1, 1, 1, 1, 1,
-0.6683916, -1.32583, -2.709432, 1, 1, 1, 1, 1,
-0.6675185, 0.4886713, -1.384702, 1, 1, 1, 1, 1,
-0.6647775, 0.7932366, 0.04680805, 1, 1, 1, 1, 1,
-0.6645625, -0.398562, -2.514632, 1, 1, 1, 1, 1,
-0.661027, -0.2091551, -2.082185, 1, 1, 1, 1, 1,
-0.6586158, -0.4005497, -2.862128, 1, 1, 1, 1, 1,
-0.6583998, -0.8754175, -3.280335, 1, 1, 1, 1, 1,
-0.6568584, -1.290151, -2.106882, 1, 1, 1, 1, 1,
-0.6560937, -0.4043547, -1.615902, 1, 1, 1, 1, 1,
-0.6559527, -1.415685, -3.063552, 1, 1, 1, 1, 1,
-0.6548203, 0.08020456, 0.2789211, 0, 0, 1, 1, 1,
-0.653012, -1.082134, -2.598845, 1, 0, 0, 1, 1,
-0.6497533, 2.136244, -1.278527, 1, 0, 0, 1, 1,
-0.6448068, 0.9420002, -0.1550934, 1, 0, 0, 1, 1,
-0.6378682, -0.4112082, -0.1826796, 1, 0, 0, 1, 1,
-0.637753, 0.4734521, -0.2801943, 1, 0, 0, 1, 1,
-0.6361039, -0.8677812, -2.120927, 0, 0, 0, 1, 1,
-0.6300975, 0.7388532, -0.02600705, 0, 0, 0, 1, 1,
-0.6259184, 0.5589588, -0.8497739, 0, 0, 0, 1, 1,
-0.6232916, -0.2846635, -4.142063, 0, 0, 0, 1, 1,
-0.6184002, 0.3042393, -0.2443007, 0, 0, 0, 1, 1,
-0.6158503, -1.656325, -2.359871, 0, 0, 0, 1, 1,
-0.5996135, 1.100636, -1.974674, 0, 0, 0, 1, 1,
-0.598136, -0.8355479, -3.226684, 1, 1, 1, 1, 1,
-0.5974652, -2.582764, -1.993644, 1, 1, 1, 1, 1,
-0.5969186, -0.4078175, 0.1061193, 1, 1, 1, 1, 1,
-0.5931134, -0.259027, -3.289737, 1, 1, 1, 1, 1,
-0.592387, 0.2581172, -1.754046, 1, 1, 1, 1, 1,
-0.5897437, -1.513518, -2.040107, 1, 1, 1, 1, 1,
-0.5873565, -0.9563633, -3.144412, 1, 1, 1, 1, 1,
-0.5840155, -0.07428455, -2.436678, 1, 1, 1, 1, 1,
-0.5811788, 0.449033, -2.314416, 1, 1, 1, 1, 1,
-0.5797346, 1.336026, 0.8093349, 1, 1, 1, 1, 1,
-0.5753583, 1.881016, -0.03002578, 1, 1, 1, 1, 1,
-0.5715554, 1.57662, 0.3821211, 1, 1, 1, 1, 1,
-0.5710794, 1.36732, -1.190959, 1, 1, 1, 1, 1,
-0.5692776, 0.3716969, -0.3976958, 1, 1, 1, 1, 1,
-0.5688263, -1.068551, -2.379117, 1, 1, 1, 1, 1,
-0.5645104, -0.288327, -1.968808, 0, 0, 1, 1, 1,
-0.5575996, -0.06336305, -0.461261, 1, 0, 0, 1, 1,
-0.5549386, 2.001123, -1.050005, 1, 0, 0, 1, 1,
-0.5540456, 0.4878833, -1.767332, 1, 0, 0, 1, 1,
-0.5539594, 1.045585, 0.3912447, 1, 0, 0, 1, 1,
-0.5517609, -2.069872, -3.402209, 1, 0, 0, 1, 1,
-0.5506612, 1.345926, 0.02773293, 0, 0, 0, 1, 1,
-0.5453103, 1.416461, -0.4509436, 0, 0, 0, 1, 1,
-0.5407257, -0.01833352, -3.343427, 0, 0, 0, 1, 1,
-0.5399222, -0.1070376, -4.215036, 0, 0, 0, 1, 1,
-0.5327335, 0.5383512, -0.9385207, 0, 0, 0, 1, 1,
-0.5316628, -0.06588078, -0.7598382, 0, 0, 0, 1, 1,
-0.5315766, 0.2349727, -0.8429911, 0, 0, 0, 1, 1,
-0.5299558, -1.77003, -2.323357, 1, 1, 1, 1, 1,
-0.52978, -0.299708, -4.179423, 1, 1, 1, 1, 1,
-0.5294079, 1.63099, -0.8962409, 1, 1, 1, 1, 1,
-0.5254847, -0.8524771, -2.05046, 1, 1, 1, 1, 1,
-0.5251037, 0.9454978, -0.7357006, 1, 1, 1, 1, 1,
-0.5156156, -0.08322421, -0.8049043, 1, 1, 1, 1, 1,
-0.5143375, 0.04782698, -0.9369786, 1, 1, 1, 1, 1,
-0.5131195, -0.1658749, -2.383317, 1, 1, 1, 1, 1,
-0.5128134, 0.4665639, 0.501124, 1, 1, 1, 1, 1,
-0.5113432, -0.06400477, -1.959514, 1, 1, 1, 1, 1,
-0.5055276, -0.1099538, -2.247487, 1, 1, 1, 1, 1,
-0.502818, 0.6278505, 0.8889589, 1, 1, 1, 1, 1,
-0.5023041, 0.9050484, -0.2288113, 1, 1, 1, 1, 1,
-0.5021233, -0.915962, -3.315187, 1, 1, 1, 1, 1,
-0.4987618, 0.3685447, -0.5931576, 1, 1, 1, 1, 1,
-0.4968728, 1.97328, 0.1713208, 0, 0, 1, 1, 1,
-0.4962674, -1.737261, -1.724622, 1, 0, 0, 1, 1,
-0.4897892, 0.7154973, -1.632427, 1, 0, 0, 1, 1,
-0.4870431, 0.4252745, -1.646031, 1, 0, 0, 1, 1,
-0.4846575, 0.8453352, 0.2964205, 1, 0, 0, 1, 1,
-0.4831018, 1.57868, -0.8269375, 1, 0, 0, 1, 1,
-0.4805668, -0.8041308, -2.524136, 0, 0, 0, 1, 1,
-0.4774273, 0.02065444, 0.2475906, 0, 0, 0, 1, 1,
-0.473998, -1.202463, -2.209193, 0, 0, 0, 1, 1,
-0.4723072, 0.6593249, -1.854257, 0, 0, 0, 1, 1,
-0.4693451, 0.2052918, -2.461897, 0, 0, 0, 1, 1,
-0.4660548, 0.9440122, -2.871152, 0, 0, 0, 1, 1,
-0.4616978, 1.790673, 0.2652711, 0, 0, 0, 1, 1,
-0.4592014, 0.6103614, 0.1520579, 1, 1, 1, 1, 1,
-0.4585412, -1.416123, -3.099852, 1, 1, 1, 1, 1,
-0.4574993, -0.1129442, -1.213855, 1, 1, 1, 1, 1,
-0.4569923, -0.1373481, -1.808954, 1, 1, 1, 1, 1,
-0.4556316, 1.663564, -2.051499, 1, 1, 1, 1, 1,
-0.4516989, 0.7807139, -0.6016179, 1, 1, 1, 1, 1,
-0.4496499, -1.096907, -3.645259, 1, 1, 1, 1, 1,
-0.4476756, -1.824533, -1.588151, 1, 1, 1, 1, 1,
-0.4474331, -0.7143001, -1.409905, 1, 1, 1, 1, 1,
-0.4453158, 0.2459294, -0.388992, 1, 1, 1, 1, 1,
-0.4450072, -1.676884, -3.098997, 1, 1, 1, 1, 1,
-0.4433599, -0.876645, -2.203057, 1, 1, 1, 1, 1,
-0.4418924, 0.2461052, -1.959289, 1, 1, 1, 1, 1,
-0.4397608, -1.061432, -3.609676, 1, 1, 1, 1, 1,
-0.437499, 0.1361289, -0.6047021, 1, 1, 1, 1, 1,
-0.434166, -0.172798, -1.322208, 0, 0, 1, 1, 1,
-0.4276081, 0.4890546, -1.142107, 1, 0, 0, 1, 1,
-0.4235916, -1.610176, -3.513092, 1, 0, 0, 1, 1,
-0.4228911, 0.6718495, -2.98645, 1, 0, 0, 1, 1,
-0.4220889, -0.1027133, -0.9400761, 1, 0, 0, 1, 1,
-0.4192604, -1.036088, 0.3303257, 1, 0, 0, 1, 1,
-0.4180703, 0.5511916, -0.8760298, 0, 0, 0, 1, 1,
-0.4157356, -0.06220049, -1.559187, 0, 0, 0, 1, 1,
-0.413059, -0.002855921, -1.630551, 0, 0, 0, 1, 1,
-0.4123571, 0.1940518, -1.52186, 0, 0, 0, 1, 1,
-0.4121046, -0.06164182, -2.476389, 0, 0, 0, 1, 1,
-0.4100196, -0.9339197, -3.349483, 0, 0, 0, 1, 1,
-0.4014387, -1.57507, -3.767036, 0, 0, 0, 1, 1,
-0.3993841, 0.6744994, 0.3900325, 1, 1, 1, 1, 1,
-0.3986862, -0.1295486, 0.3707376, 1, 1, 1, 1, 1,
-0.3923225, -1.626747, -2.314344, 1, 1, 1, 1, 1,
-0.3907241, -0.3595035, -2.152346, 1, 1, 1, 1, 1,
-0.3867181, -0.5651196, -1.604265, 1, 1, 1, 1, 1,
-0.3831573, -0.01016051, -1.575825, 1, 1, 1, 1, 1,
-0.3806981, 0.005456551, -0.5554061, 1, 1, 1, 1, 1,
-0.3802954, -1.379558, -1.974344, 1, 1, 1, 1, 1,
-0.3794435, 0.8863509, 0.9101429, 1, 1, 1, 1, 1,
-0.3777722, 0.8176709, -0.9865155, 1, 1, 1, 1, 1,
-0.3776953, 2.276453, 0.08062506, 1, 1, 1, 1, 1,
-0.3766787, 0.3582796, -1.686103, 1, 1, 1, 1, 1,
-0.3746395, -0.4920745, -3.845498, 1, 1, 1, 1, 1,
-0.3724071, -0.9335878, -2.270346, 1, 1, 1, 1, 1,
-0.3721712, 0.07912466, -1.933399, 1, 1, 1, 1, 1,
-0.3697173, 0.2573287, -1.410053, 0, 0, 1, 1, 1,
-0.3620929, 1.745119, -1.100564, 1, 0, 0, 1, 1,
-0.3597713, 0.7606944, -0.4589256, 1, 0, 0, 1, 1,
-0.3597659, 0.03174996, -1.439438, 1, 0, 0, 1, 1,
-0.3573392, -0.5712108, -2.359004, 1, 0, 0, 1, 1,
-0.3543695, -0.38774, -2.733656, 1, 0, 0, 1, 1,
-0.3443652, -0.8321922, -4.955394, 0, 0, 0, 1, 1,
-0.3415209, 0.01740155, -1.673082, 0, 0, 0, 1, 1,
-0.3399682, -0.443919, -4.525033, 0, 0, 0, 1, 1,
-0.334557, -0.634687, -4.661435, 0, 0, 0, 1, 1,
-0.3339728, -0.7058347, -1.73586, 0, 0, 0, 1, 1,
-0.3325084, 0.7563747, 0.1384644, 0, 0, 0, 1, 1,
-0.3239911, 0.04751496, -2.857663, 0, 0, 0, 1, 1,
-0.322127, -0.7545158, -1.865915, 1, 1, 1, 1, 1,
-0.306163, 0.8393811, -0.7544053, 1, 1, 1, 1, 1,
-0.3042881, 0.608529, -0.5129763, 1, 1, 1, 1, 1,
-0.3037114, 0.1555857, -1.930431, 1, 1, 1, 1, 1,
-0.3017497, 0.1713258, -3.044599, 1, 1, 1, 1, 1,
-0.3016539, -0.9321967, -4.527625, 1, 1, 1, 1, 1,
-0.2941611, -0.1430206, -2.168337, 1, 1, 1, 1, 1,
-0.2922968, 0.6655763, -0.4914424, 1, 1, 1, 1, 1,
-0.2866969, 0.3741339, -0.6515487, 1, 1, 1, 1, 1,
-0.2821453, -0.6780486, -3.660281, 1, 1, 1, 1, 1,
-0.2816388, -0.3119436, -2.751586, 1, 1, 1, 1, 1,
-0.2786053, -0.3327013, -2.316548, 1, 1, 1, 1, 1,
-0.2755471, -0.95061, -2.673598, 1, 1, 1, 1, 1,
-0.2728971, 0.5286219, -1.056026, 1, 1, 1, 1, 1,
-0.268621, -1.518761, -2.589911, 1, 1, 1, 1, 1,
-0.267666, -0.1340267, -0.7585602, 0, 0, 1, 1, 1,
-0.262006, 2.835081, 0.2329141, 1, 0, 0, 1, 1,
-0.2618301, 0.6691892, -0.7698996, 1, 0, 0, 1, 1,
-0.2604991, -1.685198, -3.050945, 1, 0, 0, 1, 1,
-0.2600578, -1.243963, -2.61503, 1, 0, 0, 1, 1,
-0.2543365, 0.3112369, -1.409981, 1, 0, 0, 1, 1,
-0.249023, -1.748451, -2.213437, 0, 0, 0, 1, 1,
-0.2480747, 0.182066, -1.276874, 0, 0, 0, 1, 1,
-0.2453163, 0.528253, -0.6658195, 0, 0, 0, 1, 1,
-0.2394345, 0.7896463, -0.9036503, 0, 0, 0, 1, 1,
-0.2388808, 1.089228, 1.66449, 0, 0, 0, 1, 1,
-0.2366087, -0.8719026, -2.118675, 0, 0, 0, 1, 1,
-0.2344331, 0.4089936, -0.3810361, 0, 0, 0, 1, 1,
-0.2330963, 1.054882, 0.3734619, 1, 1, 1, 1, 1,
-0.2301943, -0.6765299, -3.918945, 1, 1, 1, 1, 1,
-0.229721, -0.08100727, -2.461485, 1, 1, 1, 1, 1,
-0.2267058, -0.6201736, -4.510803, 1, 1, 1, 1, 1,
-0.2252269, -0.6633418, -3.504731, 1, 1, 1, 1, 1,
-0.2206459, -0.9348927, -4.030308, 1, 1, 1, 1, 1,
-0.2179912, 0.8877515, -1.752508, 1, 1, 1, 1, 1,
-0.2170238, -0.6000416, -2.138207, 1, 1, 1, 1, 1,
-0.2153605, 0.2192617, -1.601706, 1, 1, 1, 1, 1,
-0.2148764, 1.651694, 0.2192408, 1, 1, 1, 1, 1,
-0.2134015, -0.06353913, -2.177474, 1, 1, 1, 1, 1,
-0.2037064, 1.041229, -1.555196, 1, 1, 1, 1, 1,
-0.2003515, 0.6401973, -0.3891061, 1, 1, 1, 1, 1,
-0.2001908, 1.110534, 1.640029, 1, 1, 1, 1, 1,
-0.1987502, -1.330047, -3.904804, 1, 1, 1, 1, 1,
-0.197565, 0.4368932, -0.6434313, 0, 0, 1, 1, 1,
-0.195315, 1.788601, 0.1578923, 1, 0, 0, 1, 1,
-0.1876636, -0.8412745, -1.69108, 1, 0, 0, 1, 1,
-0.1874986, -0.9014041, -2.951279, 1, 0, 0, 1, 1,
-0.1861925, -0.8253815, -2.806333, 1, 0, 0, 1, 1,
-0.1854739, 1.029564, -1.159209, 1, 0, 0, 1, 1,
-0.1818694, 0.511703, -0.08404984, 0, 0, 0, 1, 1,
-0.1757918, 1.0316, -2.140206, 0, 0, 0, 1, 1,
-0.173633, -0.3703538, -3.933494, 0, 0, 0, 1, 1,
-0.1697039, -0.4183997, -3.11327, 0, 0, 0, 1, 1,
-0.167378, -0.3205325, -1.163137, 0, 0, 0, 1, 1,
-0.1673035, 1.04797, -0.1068268, 0, 0, 0, 1, 1,
-0.1661279, -0.8415041, -1.66214, 0, 0, 0, 1, 1,
-0.1630788, 0.5097348, -0.8204353, 1, 1, 1, 1, 1,
-0.162723, -0.7032156, -2.071404, 1, 1, 1, 1, 1,
-0.1612079, 1.774162, 0.9449297, 1, 1, 1, 1, 1,
-0.1598965, 1.200107, 0.2204959, 1, 1, 1, 1, 1,
-0.1590147, -1.186549, -1.101597, 1, 1, 1, 1, 1,
-0.1572923, 1.279245, 1.822539, 1, 1, 1, 1, 1,
-0.15667, 0.2215446, -1.064072, 1, 1, 1, 1, 1,
-0.1538689, -0.9104103, -2.680903, 1, 1, 1, 1, 1,
-0.1534917, 1.913424, -0.6913812, 1, 1, 1, 1, 1,
-0.1483427, 0.466405, 0.5478458, 1, 1, 1, 1, 1,
-0.1445927, 0.08266011, -1.48821, 1, 1, 1, 1, 1,
-0.1440434, 0.6383235, 0.472985, 1, 1, 1, 1, 1,
-0.1395993, 1.02237, -1.22995, 1, 1, 1, 1, 1,
-0.1371315, 1.268349, -0.1727782, 1, 1, 1, 1, 1,
-0.1313753, -2.007959, -2.004915, 1, 1, 1, 1, 1,
-0.130659, -0.5014293, -0.7467377, 0, 0, 1, 1, 1,
-0.1292654, -0.7167776, -2.758927, 1, 0, 0, 1, 1,
-0.1288875, 1.854074, -1.480687, 1, 0, 0, 1, 1,
-0.1283329, -0.6259704, -2.409259, 1, 0, 0, 1, 1,
-0.114953, -0.3264228, -2.180372, 1, 0, 0, 1, 1,
-0.1076971, -0.5996382, -3.748239, 1, 0, 0, 1, 1,
-0.1076231, 0.5603308, 0.01392742, 0, 0, 0, 1, 1,
-0.1060543, 1.243718, 0.5208668, 0, 0, 0, 1, 1,
-0.1055374, -1.111339, -3.47516, 0, 0, 0, 1, 1,
-0.1037598, 0.5672393, -1.308145, 0, 0, 0, 1, 1,
-0.1031861, 0.200746, 0.6731011, 0, 0, 0, 1, 1,
-0.1030063, -2.116079, -3.573679, 0, 0, 0, 1, 1,
-0.1013716, 0.1497527, -0.1661202, 0, 0, 0, 1, 1,
-0.1009414, 2.191006, 0.9011318, 1, 1, 1, 1, 1,
-0.1001303, -0.5910016, -2.580148, 1, 1, 1, 1, 1,
-0.09660994, -0.855243, -2.471863, 1, 1, 1, 1, 1,
-0.09345941, -1.385924, -4.905949, 1, 1, 1, 1, 1,
-0.09159225, -2.168375, -3.894681, 1, 1, 1, 1, 1,
-0.09139963, -0.6884109, -2.742031, 1, 1, 1, 1, 1,
-0.08182545, 0.5185219, -0.4971626, 1, 1, 1, 1, 1,
-0.07830236, -0.2168535, -3.388281, 1, 1, 1, 1, 1,
-0.07684173, -0.7641201, -1.141478, 1, 1, 1, 1, 1,
-0.07578497, 1.103047, 1.566554, 1, 1, 1, 1, 1,
-0.07484887, -0.242616, -2.163556, 1, 1, 1, 1, 1,
-0.07454491, 0.4234918, 0.2428749, 1, 1, 1, 1, 1,
-0.07373578, 0.3218305, -1.627398, 1, 1, 1, 1, 1,
-0.07228366, 0.7910657, -0.3796826, 1, 1, 1, 1, 1,
-0.07008561, -0.521809, -4.865747, 1, 1, 1, 1, 1,
-0.06419201, 1.805194, 0.3535525, 0, 0, 1, 1, 1,
-0.04756382, 1.305152, -0.5316877, 1, 0, 0, 1, 1,
-0.04746439, -0.1160007, -2.723694, 1, 0, 0, 1, 1,
-0.04621417, 0.6759174, -0.9480588, 1, 0, 0, 1, 1,
-0.04456097, -0.9803679, -3.357896, 1, 0, 0, 1, 1,
-0.04343442, -1.115059, -3.060849, 1, 0, 0, 1, 1,
-0.04076223, 0.9560658, 0.2853423, 0, 0, 0, 1, 1,
-0.0399767, 0.2549655, 0.02754984, 0, 0, 0, 1, 1,
-0.0357722, -0.5227355, -2.309028, 0, 0, 0, 1, 1,
-0.03520904, 0.8524817, -0.2940055, 0, 0, 0, 1, 1,
-0.03334809, 0.4927541, 0.4031777, 0, 0, 0, 1, 1,
-0.03286929, -1.213048, -2.946826, 0, 0, 0, 1, 1,
-0.02681635, 0.8396394, -1.565319, 0, 0, 0, 1, 1,
-0.02595781, -1.017151, -2.446314, 1, 1, 1, 1, 1,
-0.02472056, 0.3573355, 0.1688218, 1, 1, 1, 1, 1,
-0.02235303, 0.06848985, -1.142162, 1, 1, 1, 1, 1,
-0.01743103, -0.5508864, -2.440296, 1, 1, 1, 1, 1,
-0.0172383, 1.241516, 0.351317, 1, 1, 1, 1, 1,
-0.01591329, -0.05155414, -1.271152, 1, 1, 1, 1, 1,
-0.007634959, 0.2132961, -1.681204, 1, 1, 1, 1, 1,
-0.006501743, 1.126965, 0.3428157, 1, 1, 1, 1, 1,
-0.005634231, 1.858649, 0.9398392, 1, 1, 1, 1, 1,
-0.003923198, -0.3636691, -4.452141, 1, 1, 1, 1, 1,
-0.003005603, 0.1970684, 0.9926562, 1, 1, 1, 1, 1,
-0.0003914794, -0.2631539, -3.041964, 1, 1, 1, 1, 1,
0.0004945628, -0.2925521, 1.950322, 1, 1, 1, 1, 1,
0.006808684, -0.8250089, 4.113847, 1, 1, 1, 1, 1,
0.009002325, -0.9791712, 4.390054, 1, 1, 1, 1, 1,
0.009565886, -0.04190583, 3.402453, 0, 0, 1, 1, 1,
0.01399114, 0.02278319, 0.3666511, 1, 0, 0, 1, 1,
0.01631818, 0.2708798, 0.1211164, 1, 0, 0, 1, 1,
0.02122394, -1.416784, 2.055644, 1, 0, 0, 1, 1,
0.02202173, 2.446184, 0.890054, 1, 0, 0, 1, 1,
0.02380397, 0.4187305, 0.4648569, 1, 0, 0, 1, 1,
0.02401061, 0.5833957, 1.100439, 0, 0, 0, 1, 1,
0.02467798, 0.2284851, -1.192558, 0, 0, 0, 1, 1,
0.02475738, -0.7399555, 3.718736, 0, 0, 0, 1, 1,
0.02837801, 0.1246631, -0.04500148, 0, 0, 0, 1, 1,
0.02874989, -0.05615202, 5.325191, 0, 0, 0, 1, 1,
0.03058082, -0.4032896, 2.994038, 0, 0, 0, 1, 1,
0.03381499, -0.833065, 1.505002, 0, 0, 0, 1, 1,
0.03504637, -0.01616792, 0.8446211, 1, 1, 1, 1, 1,
0.038612, 0.8691638, -0.19167, 1, 1, 1, 1, 1,
0.03876059, -1.964891, 2.680432, 1, 1, 1, 1, 1,
0.04451298, -1.035384, 4.975863, 1, 1, 1, 1, 1,
0.04714172, -0.8281301, 5.284472, 1, 1, 1, 1, 1,
0.05019312, -0.6444191, 4.445685, 1, 1, 1, 1, 1,
0.05121022, 0.8776436, -0.2549764, 1, 1, 1, 1, 1,
0.05137938, -1.612193, 3.992538, 1, 1, 1, 1, 1,
0.0515764, 0.2508726, 0.8651983, 1, 1, 1, 1, 1,
0.05363386, 1.178726, -1.055131, 1, 1, 1, 1, 1,
0.05467612, -0.01246765, 1.692067, 1, 1, 1, 1, 1,
0.05711828, -1.416429, 2.81186, 1, 1, 1, 1, 1,
0.06137292, 0.2357079, 0.8192037, 1, 1, 1, 1, 1,
0.06462093, 0.1541469, 0.125695, 1, 1, 1, 1, 1,
0.06768738, -1.785993, 3.248784, 1, 1, 1, 1, 1,
0.07176359, -0.6251849, 1.008148, 0, 0, 1, 1, 1,
0.07598247, 0.7765496, 1.046121, 1, 0, 0, 1, 1,
0.07913379, -1.933911, 3.595353, 1, 0, 0, 1, 1,
0.08231157, 0.8073888, 1.644344, 1, 0, 0, 1, 1,
0.08526561, -1.929811, 3.390552, 1, 0, 0, 1, 1,
0.08719338, 0.5683872, -1.89462, 1, 0, 0, 1, 1,
0.08766274, -0.7914374, 2.555088, 0, 0, 0, 1, 1,
0.09162394, 1.233503, 1.554558, 0, 0, 0, 1, 1,
0.0920342, 0.6682401, 0.7003812, 0, 0, 0, 1, 1,
0.09847771, -0.8951795, 3.389755, 0, 0, 0, 1, 1,
0.1065036, -1.045738, 2.788979, 0, 0, 0, 1, 1,
0.1085756, -0.6901903, 2.69496, 0, 0, 0, 1, 1,
0.1093949, -1.253517, 2.687783, 0, 0, 0, 1, 1,
0.1096943, 1.675954, -1.012737, 1, 1, 1, 1, 1,
0.1103492, -0.2795026, 2.917505, 1, 1, 1, 1, 1,
0.1154625, 2.192373, -0.1099858, 1, 1, 1, 1, 1,
0.1176253, -0.2198408, 2.706428, 1, 1, 1, 1, 1,
0.1198008, 0.804157, -1.225282, 1, 1, 1, 1, 1,
0.1217489, -1.256659, 3.65525, 1, 1, 1, 1, 1,
0.1281178, 0.07656672, 1.754721, 1, 1, 1, 1, 1,
0.1320128, 0.8612115, -0.3341063, 1, 1, 1, 1, 1,
0.1389405, 0.1023752, 1.170304, 1, 1, 1, 1, 1,
0.1409113, -0.2053678, 3.611674, 1, 1, 1, 1, 1,
0.1410369, -0.1072282, 1.911764, 1, 1, 1, 1, 1,
0.1414529, 2.369336, 1.310804, 1, 1, 1, 1, 1,
0.1428333, 0.4671464, 1.064203, 1, 1, 1, 1, 1,
0.1429619, -1.542359, 3.84655, 1, 1, 1, 1, 1,
0.1473195, -2.184989, 2.407802, 1, 1, 1, 1, 1,
0.1474897, -0.3819604, 4.383334, 0, 0, 1, 1, 1,
0.1476907, 0.162226, 0.1106312, 1, 0, 0, 1, 1,
0.1505406, 0.2636712, 2.134181, 1, 0, 0, 1, 1,
0.1601643, -2.341254, 3.38453, 1, 0, 0, 1, 1,
0.1604294, -0.1075637, 2.3287, 1, 0, 0, 1, 1,
0.1644581, -0.02608312, 1.191007, 1, 0, 0, 1, 1,
0.1655148, 1.148716, 0.3124901, 0, 0, 0, 1, 1,
0.1669706, -0.3221847, 2.330955, 0, 0, 0, 1, 1,
0.1788193, -0.06419721, 1.137325, 0, 0, 0, 1, 1,
0.1816676, 1.229692, -0.4085725, 0, 0, 0, 1, 1,
0.1817849, -0.5712659, 1.79468, 0, 0, 0, 1, 1,
0.1834212, -0.06655046, 3.696395, 0, 0, 0, 1, 1,
0.1866845, 0.3866779, -1.111708, 0, 0, 0, 1, 1,
0.1886409, -1.133782, 1.774774, 1, 1, 1, 1, 1,
0.1909001, -0.2462465, 2.689686, 1, 1, 1, 1, 1,
0.1911588, -0.3044785, 0.5938758, 1, 1, 1, 1, 1,
0.1917551, -1.550546, 2.498388, 1, 1, 1, 1, 1,
0.1927584, -1.69901, 3.301771, 1, 1, 1, 1, 1,
0.1952317, -1.817441, 3.193413, 1, 1, 1, 1, 1,
0.2031968, -0.01430905, 1.779679, 1, 1, 1, 1, 1,
0.2035456, 1.300803, -0.5429186, 1, 1, 1, 1, 1,
0.2081221, 0.8163311, -0.2253989, 1, 1, 1, 1, 1,
0.2109089, 0.8972514, 0.2713789, 1, 1, 1, 1, 1,
0.2113248, -1.625657, 3.943449, 1, 1, 1, 1, 1,
0.2121769, -1.501603, 4.214443, 1, 1, 1, 1, 1,
0.2165435, -0.9682364, 4.158788, 1, 1, 1, 1, 1,
0.2207369, 0.2820622, 0.4622327, 1, 1, 1, 1, 1,
0.2280234, -0.9837826, 4.98788, 1, 1, 1, 1, 1,
0.2301294, 1.022653, -1.097923, 0, 0, 1, 1, 1,
0.2329961, 0.4523156, -1.40592, 1, 0, 0, 1, 1,
0.2371081, -1.774636, 4.231292, 1, 0, 0, 1, 1,
0.2434081, 0.09413871, 0.511245, 1, 0, 0, 1, 1,
0.2444188, -0.9825777, 2.602361, 1, 0, 0, 1, 1,
0.2448476, -0.6792876, 2.500002, 1, 0, 0, 1, 1,
0.2493396, -1.071234, 4.239355, 0, 0, 0, 1, 1,
0.2498669, -2.715697, 2.070515, 0, 0, 0, 1, 1,
0.2562447, -0.07101744, 1.929469, 0, 0, 0, 1, 1,
0.2602186, 1.933638, 1.967603, 0, 0, 0, 1, 1,
0.2605618, 0.3586646, 0.5301328, 0, 0, 0, 1, 1,
0.2650082, -1.119295, 3.843993, 0, 0, 0, 1, 1,
0.2700697, -0.1468326, 1.807555, 0, 0, 0, 1, 1,
0.2719721, 0.2142631, 1.09477, 1, 1, 1, 1, 1,
0.2788075, -0.2728632, 4.243181, 1, 1, 1, 1, 1,
0.2862613, -0.381992, 1.307402, 1, 1, 1, 1, 1,
0.2895801, 0.07824322, 2.545765, 1, 1, 1, 1, 1,
0.2918042, -0.9693884, 1.43846, 1, 1, 1, 1, 1,
0.2946993, 0.191108, 0.5107231, 1, 1, 1, 1, 1,
0.2948695, 0.2780044, 1.205, 1, 1, 1, 1, 1,
0.2951692, -0.134132, 1.717144, 1, 1, 1, 1, 1,
0.2964385, 0.9478927, -1.134826, 1, 1, 1, 1, 1,
0.2965987, -0.02010551, 1.631194, 1, 1, 1, 1, 1,
0.2968603, 1.440162, -0.8952274, 1, 1, 1, 1, 1,
0.2978284, -0.8735157, 2.003543, 1, 1, 1, 1, 1,
0.3011999, -0.1159832, 4.303212, 1, 1, 1, 1, 1,
0.3013563, 0.6728891, -0.3661313, 1, 1, 1, 1, 1,
0.3028767, 0.672534, 2.054268, 1, 1, 1, 1, 1,
0.3038345, 0.8604306, -0.8308837, 0, 0, 1, 1, 1,
0.3044595, 1.508256, 0.3391533, 1, 0, 0, 1, 1,
0.307276, 1.022083, 1.412237, 1, 0, 0, 1, 1,
0.3094811, 1.818251, 1.545598, 1, 0, 0, 1, 1,
0.3116479, -0.6251046, 3.732239, 1, 0, 0, 1, 1,
0.311669, 0.001517761, 1.687865, 1, 0, 0, 1, 1,
0.3168708, -0.09693143, 1.334049, 0, 0, 0, 1, 1,
0.31737, 1.115193, 0.1228328, 0, 0, 0, 1, 1,
0.3174656, 0.6784057, -1.548147, 0, 0, 0, 1, 1,
0.3197103, 1.657211, -0.5180106, 0, 0, 0, 1, 1,
0.3235795, 1.8471, 0.0743142, 0, 0, 0, 1, 1,
0.3265691, 0.2042756, -0.703958, 0, 0, 0, 1, 1,
0.3271105, 1.003574, 0.3015215, 0, 0, 0, 1, 1,
0.3319367, -0.7721284, 3.12356, 1, 1, 1, 1, 1,
0.3341678, 0.1669617, 2.929299, 1, 1, 1, 1, 1,
0.3365911, -0.3281765, 1.968073, 1, 1, 1, 1, 1,
0.3370891, 1.342436, -0.3493316, 1, 1, 1, 1, 1,
0.3378595, 0.0809256, 1.299778, 1, 1, 1, 1, 1,
0.3408858, 0.1543234, 3.134188, 1, 1, 1, 1, 1,
0.341832, 0.8113609, -0.02280606, 1, 1, 1, 1, 1,
0.345919, -0.3502056, 2.684567, 1, 1, 1, 1, 1,
0.3461802, 0.8530625, 0.4184234, 1, 1, 1, 1, 1,
0.3463024, 1.068253, -0.1175083, 1, 1, 1, 1, 1,
0.3473237, 1.126248, -0.5568133, 1, 1, 1, 1, 1,
0.3480747, 0.8287636, -0.3293571, 1, 1, 1, 1, 1,
0.3483889, 1.002061, 0.3900999, 1, 1, 1, 1, 1,
0.3500473, -0.6046963, 0.9337658, 1, 1, 1, 1, 1,
0.3517317, 1.192618, -0.7482045, 1, 1, 1, 1, 1,
0.3560567, 1.347955, 2.276652, 0, 0, 1, 1, 1,
0.3584977, -0.1347288, 2.191325, 1, 0, 0, 1, 1,
0.3588329, -0.5495263, 4.494166, 1, 0, 0, 1, 1,
0.3597958, 0.8202014, 3.745209, 1, 0, 0, 1, 1,
0.3648942, -0.3188147, 2.323004, 1, 0, 0, 1, 1,
0.3697617, 2.493049, 0.2922246, 1, 0, 0, 1, 1,
0.3846855, -0.1586755, 0.0972481, 0, 0, 0, 1, 1,
0.3856281, -0.02811616, 0.8179412, 0, 0, 0, 1, 1,
0.3893786, -0.4237949, 1.513557, 0, 0, 0, 1, 1,
0.3981429, 0.4937182, 0.424991, 0, 0, 0, 1, 1,
0.398679, -0.1872571, 2.426404, 0, 0, 0, 1, 1,
0.3996566, 0.2045446, 1.176971, 0, 0, 0, 1, 1,
0.4022956, 1.872004, 2.489782, 0, 0, 0, 1, 1,
0.4027731, -1.074341, 4.217471, 1, 1, 1, 1, 1,
0.4048844, -0.09249815, 1.153986, 1, 1, 1, 1, 1,
0.4063706, -0.5338099, 3.029162, 1, 1, 1, 1, 1,
0.4153584, -1.104434, 4.642042, 1, 1, 1, 1, 1,
0.4165244, -0.6202528, 2.530518, 1, 1, 1, 1, 1,
0.4176016, -0.915581, 2.747745, 1, 1, 1, 1, 1,
0.4226063, 0.2263279, 2.592107, 1, 1, 1, 1, 1,
0.4306621, -0.8129322, 2.132204, 1, 1, 1, 1, 1,
0.432068, -0.1091831, 1.162335, 1, 1, 1, 1, 1,
0.4326333, 1.123222, -0.9987988, 1, 1, 1, 1, 1,
0.4338233, 0.03025704, 0.6224718, 1, 1, 1, 1, 1,
0.4339112, -1.602565, 2.845393, 1, 1, 1, 1, 1,
0.4429868, -0.6398816, 2.077822, 1, 1, 1, 1, 1,
0.4482259, -0.3363106, 3.02, 1, 1, 1, 1, 1,
0.4535109, 1.332025, 2.388565, 1, 1, 1, 1, 1,
0.4600848, 0.6758594, -1.027638, 0, 0, 1, 1, 1,
0.4607843, -0.1694013, 2.550975, 1, 0, 0, 1, 1,
0.461576, -0.06661938, 0.5171014, 1, 0, 0, 1, 1,
0.4641326, -0.1112832, 1.671699, 1, 0, 0, 1, 1,
0.4657201, -0.3409752, 2.439226, 1, 0, 0, 1, 1,
0.4676688, -0.02971042, 1.838479, 1, 0, 0, 1, 1,
0.4679595, 0.1091687, 0.9213668, 0, 0, 0, 1, 1,
0.4725917, -1.094159, 1.37782, 0, 0, 0, 1, 1,
0.4729111, -1.391621, 2.65462, 0, 0, 0, 1, 1,
0.4750752, 0.5664557, 1.00694, 0, 0, 0, 1, 1,
0.4758073, 0.6463667, -0.120883, 0, 0, 0, 1, 1,
0.4786426, 1.797111, 0.1262764, 0, 0, 0, 1, 1,
0.4794116, -1.196998, 3.176544, 0, 0, 0, 1, 1,
0.4821224, -1.316192, 2.276474, 1, 1, 1, 1, 1,
0.4859776, 0.019159, 1.979963, 1, 1, 1, 1, 1,
0.4991778, 0.6288968, -0.0258717, 1, 1, 1, 1, 1,
0.5019977, -0.8046362, 2.658301, 1, 1, 1, 1, 1,
0.5030718, 0.4686706, 1.202307, 1, 1, 1, 1, 1,
0.5041575, 0.1455371, 1.066778, 1, 1, 1, 1, 1,
0.5069257, 0.9252908, 0.3718953, 1, 1, 1, 1, 1,
0.5084965, 1.722578, 0.5120512, 1, 1, 1, 1, 1,
0.5099513, 0.5248778, -1.406504, 1, 1, 1, 1, 1,
0.521877, 1.202296, -0.8677729, 1, 1, 1, 1, 1,
0.5223348, 0.7847866, 0.6147417, 1, 1, 1, 1, 1,
0.523748, 1.650199, -1.082776, 1, 1, 1, 1, 1,
0.5269675, 0.844472, 0.3468779, 1, 1, 1, 1, 1,
0.527103, 0.1471161, 0.5913019, 1, 1, 1, 1, 1,
0.5298304, -0.4011594, 2.992879, 1, 1, 1, 1, 1,
0.5354939, -1.796996, 2.49403, 0, 0, 1, 1, 1,
0.5374042, -0.7643415, 2.311096, 1, 0, 0, 1, 1,
0.54167, -0.2289645, 3.255669, 1, 0, 0, 1, 1,
0.5462253, 1.124913, -0.6733682, 1, 0, 0, 1, 1,
0.5473511, -0.1302633, 0.4492531, 1, 0, 0, 1, 1,
0.5487095, -1.217706, 2.852325, 1, 0, 0, 1, 1,
0.5493834, 0.04688981, 1.757222, 0, 0, 0, 1, 1,
0.54949, 0.2373925, 1.6813, 0, 0, 0, 1, 1,
0.5494956, -0.2715721, 3.774893, 0, 0, 0, 1, 1,
0.5530568, -0.05712038, 1.947452, 0, 0, 0, 1, 1,
0.5605419, 0.4715227, 2.176041, 0, 0, 0, 1, 1,
0.5643932, 0.3873335, 2.987295, 0, 0, 0, 1, 1,
0.5653823, 0.05321657, 0.6054468, 0, 0, 0, 1, 1,
0.56945, -1.237316, 2.596413, 1, 1, 1, 1, 1,
0.5812938, 3.330153, 1.36904, 1, 1, 1, 1, 1,
0.5823282, -0.2776797, 3.605463, 1, 1, 1, 1, 1,
0.5846173, -0.7383331, 1.741488, 1, 1, 1, 1, 1,
0.5912272, -1.51059, 2.976364, 1, 1, 1, 1, 1,
0.5916755, 1.406157, 1.117495, 1, 1, 1, 1, 1,
0.5947205, 2.816694, -0.9250392, 1, 1, 1, 1, 1,
0.5962921, -0.2080829, 3.46446, 1, 1, 1, 1, 1,
0.5971192, -0.7196375, 1.870088, 1, 1, 1, 1, 1,
0.5979997, 1.398994, 0.8278815, 1, 1, 1, 1, 1,
0.6064764, 0.5163573, 2.26883, 1, 1, 1, 1, 1,
0.6068941, -1.586054, 2.324501, 1, 1, 1, 1, 1,
0.6086672, -0.2989419, 1.669667, 1, 1, 1, 1, 1,
0.6109155, -1.040076, 3.554729, 1, 1, 1, 1, 1,
0.6151145, 1.082618, -0.2897023, 1, 1, 1, 1, 1,
0.6199032, -0.02863169, 1.505671, 0, 0, 1, 1, 1,
0.6233478, -0.8409739, 4.241301, 1, 0, 0, 1, 1,
0.6265553, 0.848711, 2.30441, 1, 0, 0, 1, 1,
0.6277834, -1.209036, 2.540705, 1, 0, 0, 1, 1,
0.6307384, -1.379212, 1.423273, 1, 0, 0, 1, 1,
0.6326458, -0.77349, 1.461148, 1, 0, 0, 1, 1,
0.6339515, -1.376261, 2.143363, 0, 0, 0, 1, 1,
0.6363364, 0.09328175, 2.110723, 0, 0, 0, 1, 1,
0.6434875, -0.5923384, 0.890327, 0, 0, 0, 1, 1,
0.6435484, -2.176311, 3.174271, 0, 0, 0, 1, 1,
0.6453962, 0.7447833, -0.9112054, 0, 0, 0, 1, 1,
0.6458395, 0.601426, 0.5381858, 0, 0, 0, 1, 1,
0.6471839, 1.734176, 0.4565468, 0, 0, 0, 1, 1,
0.649759, -0.8582072, 3.415144, 1, 1, 1, 1, 1,
0.6552506, 0.1405538, 1.418193, 1, 1, 1, 1, 1,
0.6577545, 0.7633067, 0.7663844, 1, 1, 1, 1, 1,
0.6593994, 1.660348, 1.452863, 1, 1, 1, 1, 1,
0.6610049, 0.4240074, 0.8583525, 1, 1, 1, 1, 1,
0.6643614, -0.7072068, 2.799885, 1, 1, 1, 1, 1,
0.6668836, -0.4545151, 1.977382, 1, 1, 1, 1, 1,
0.6718889, -0.2097153, 1.135308, 1, 1, 1, 1, 1,
0.6730655, -0.005057299, 0.7828993, 1, 1, 1, 1, 1,
0.6734424, -0.3457745, 1.785939, 1, 1, 1, 1, 1,
0.6763227, 0.9397371, 2.06073, 1, 1, 1, 1, 1,
0.6764414, 0.2543563, 0.8592784, 1, 1, 1, 1, 1,
0.6785902, 0.6322099, 1.693544, 1, 1, 1, 1, 1,
0.68668, -0.2135349, 2.338521, 1, 1, 1, 1, 1,
0.6882272, -0.5341036, 0.9076757, 1, 1, 1, 1, 1,
0.6893017, -0.8147091, 2.626543, 0, 0, 1, 1, 1,
0.6909001, -1.749103, 2.632381, 1, 0, 0, 1, 1,
0.6965742, -1.124719, 2.522183, 1, 0, 0, 1, 1,
0.7013152, 0.9161038, 0.03178496, 1, 0, 0, 1, 1,
0.7022876, -1.289029, 1.921039, 1, 0, 0, 1, 1,
0.7028638, 0.1121174, 0.1512665, 1, 0, 0, 1, 1,
0.7077716, -0.9842061, 2.612462, 0, 0, 0, 1, 1,
0.7079541, 0.1465296, -0.5492177, 0, 0, 0, 1, 1,
0.7101656, 0.0287829, 3.166441, 0, 0, 0, 1, 1,
0.7120176, 0.1181845, 2.120888, 0, 0, 0, 1, 1,
0.7366031, 0.5207961, 0.8416493, 0, 0, 0, 1, 1,
0.7366118, 1.043902, 1.208378, 0, 0, 0, 1, 1,
0.7373059, -1.356952, 2.611315, 0, 0, 0, 1, 1,
0.7378083, -1.522157, 3.497722, 1, 1, 1, 1, 1,
0.739151, -1.21487, 4.146655, 1, 1, 1, 1, 1,
0.7391895, 1.761661, 0.6485203, 1, 1, 1, 1, 1,
0.7400233, 1.087558, 2.803183, 1, 1, 1, 1, 1,
0.7418637, -0.2580605, 1.360702, 1, 1, 1, 1, 1,
0.7450635, 0.4530017, 1.819086, 1, 1, 1, 1, 1,
0.7461305, -0.206301, 2.486756, 1, 1, 1, 1, 1,
0.7464063, -0.5831061, 3.300967, 1, 1, 1, 1, 1,
0.7504437, 0.1045724, 0.3190423, 1, 1, 1, 1, 1,
0.7518418, 0.1090662, 1.13665, 1, 1, 1, 1, 1,
0.7551935, -0.5483416, 3.127942, 1, 1, 1, 1, 1,
0.7560949, 0.8805096, 0.6972262, 1, 1, 1, 1, 1,
0.7591833, -0.1432707, 1.844734, 1, 1, 1, 1, 1,
0.7676882, -0.0001720279, 2.827816, 1, 1, 1, 1, 1,
0.7715076, 0.02525507, 0.8436664, 1, 1, 1, 1, 1,
0.7721841, 1.137106, -0.1431115, 0, 0, 1, 1, 1,
0.7790568, 0.6634413, -0.01600778, 1, 0, 0, 1, 1,
0.7802956, 1.191435, 1.95819, 1, 0, 0, 1, 1,
0.7846586, -1.32064, 2.808582, 1, 0, 0, 1, 1,
0.7846916, -0.8945884, 1.093848, 1, 0, 0, 1, 1,
0.7866759, -0.5865443, 1.458127, 1, 0, 0, 1, 1,
0.7971236, -2.377044, 1.457555, 0, 0, 0, 1, 1,
0.8000726, 0.3018599, 0.2672249, 0, 0, 0, 1, 1,
0.8035489, 1.06589, 4.215407, 0, 0, 0, 1, 1,
0.8072212, 0.8070927, -0.8657301, 0, 0, 0, 1, 1,
0.8086751, 2.569278, 1.686936, 0, 0, 0, 1, 1,
0.8094807, -0.561834, 1.094568, 0, 0, 0, 1, 1,
0.8117988, 1.369831, 0.09049271, 0, 0, 0, 1, 1,
0.814528, 0.2893992, 1.03651, 1, 1, 1, 1, 1,
0.817359, 1.233388, 1.261101, 1, 1, 1, 1, 1,
0.8216214, -0.1907531, 2.319534, 1, 1, 1, 1, 1,
0.825316, -1.119739, 1.141199, 1, 1, 1, 1, 1,
0.8266107, 0.6299973, -0.5458192, 1, 1, 1, 1, 1,
0.8288081, -0.01550773, 0.6027258, 1, 1, 1, 1, 1,
0.8319504, -1.614933, 1.641139, 1, 1, 1, 1, 1,
0.8345639, 1.090687, 1.253995, 1, 1, 1, 1, 1,
0.8456796, 0.776374, 1.7431, 1, 1, 1, 1, 1,
0.8481485, 0.1082509, 1.842299, 1, 1, 1, 1, 1,
0.8486726, -2.723472, 2.400757, 1, 1, 1, 1, 1,
0.8507915, -2.993489, 1.013433, 1, 1, 1, 1, 1,
0.8508126, 0.2698554, 2.729069, 1, 1, 1, 1, 1,
0.8567064, 1.169479, 0.6737725, 1, 1, 1, 1, 1,
0.8572052, -2.646648, 1.939765, 1, 1, 1, 1, 1,
0.8575498, -0.3389406, -0.1061629, 0, 0, 1, 1, 1,
0.8594466, -0.7011694, 2.381385, 1, 0, 0, 1, 1,
0.8659061, 0.4484539, 0.4056671, 1, 0, 0, 1, 1,
0.8662218, -0.1020879, 2.355726, 1, 0, 0, 1, 1,
0.8679234, -0.1805966, 0.427337, 1, 0, 0, 1, 1,
0.8682751, -0.4658446, 2.594571, 1, 0, 0, 1, 1,
0.8724421, -2.128255, 2.037818, 0, 0, 0, 1, 1,
0.8738899, 0.8049849, 0.1550518, 0, 0, 0, 1, 1,
0.8859918, 0.5089478, 1.83926, 0, 0, 0, 1, 1,
0.8901613, 1.073782, 1.313245, 0, 0, 0, 1, 1,
0.8964511, -0.02836404, 2.113439, 0, 0, 0, 1, 1,
0.8967457, -1.440051, 2.655897, 0, 0, 0, 1, 1,
0.9012747, 1.628859, 0.1907844, 0, 0, 0, 1, 1,
0.9045175, 0.9016551, 1.315827, 1, 1, 1, 1, 1,
0.9052133, -0.002563406, 2.504406, 1, 1, 1, 1, 1,
0.9063649, 0.9949387, -0.1040767, 1, 1, 1, 1, 1,
0.9114711, 0.2376115, 1.093644, 1, 1, 1, 1, 1,
0.9164528, -1.160897, 4.93539, 1, 1, 1, 1, 1,
0.918526, 0.8780857, 1.926942, 1, 1, 1, 1, 1,
0.9232759, -0.9967179, 3.686004, 1, 1, 1, 1, 1,
0.9233191, 0.9490246, 1.087692, 1, 1, 1, 1, 1,
0.9252643, 0.6948857, 0.7962433, 1, 1, 1, 1, 1,
0.9254858, 0.5865017, 2.35368, 1, 1, 1, 1, 1,
0.9328846, -2.524792, 3.593802, 1, 1, 1, 1, 1,
0.9334605, 0.2088528, 0.4849487, 1, 1, 1, 1, 1,
0.9338444, -1.698963, 2.064699, 1, 1, 1, 1, 1,
0.9438187, 1.826633, 0.3177296, 1, 1, 1, 1, 1,
0.9476715, 0.8751994, 1.588551, 1, 1, 1, 1, 1,
0.9531958, -0.004265618, -0.1814895, 0, 0, 1, 1, 1,
0.9621931, -1.018634, 3.444918, 1, 0, 0, 1, 1,
0.969888, 1.264464, 2.00689, 1, 0, 0, 1, 1,
0.9941799, 0.2341194, 1.110936, 1, 0, 0, 1, 1,
0.9983626, -0.2854393, 1.581358, 1, 0, 0, 1, 1,
0.9983916, -1.819634, 2.572332, 1, 0, 0, 1, 1,
1.000583, -0.2183838, 0.5047596, 0, 0, 0, 1, 1,
1.000595, 1.36766, 1.0735, 0, 0, 0, 1, 1,
1.003384, 1.501438, 0.5189918, 0, 0, 0, 1, 1,
1.004882, 0.1088026, 1.868599, 0, 0, 0, 1, 1,
1.005125, 0.3606362, 0.7636737, 0, 0, 0, 1, 1,
1.012054, -0.9829361, 3.477662, 0, 0, 0, 1, 1,
1.013572, -0.04676544, 0.0694883, 0, 0, 0, 1, 1,
1.013587, -1.150962, 1.649694, 1, 1, 1, 1, 1,
1.017326, 1.43711, 0.7377687, 1, 1, 1, 1, 1,
1.025862, -0.7449376, 3.02351, 1, 1, 1, 1, 1,
1.04415, -0.07428125, 0.4464931, 1, 1, 1, 1, 1,
1.044598, -0.06746764, 2.456203, 1, 1, 1, 1, 1,
1.051089, -1.07705, 1.521738, 1, 1, 1, 1, 1,
1.05208, 1.927433, 1.506134, 1, 1, 1, 1, 1,
1.052554, -0.743501, 0.4488495, 1, 1, 1, 1, 1,
1.052925, 0.06959654, 2.54746, 1, 1, 1, 1, 1,
1.057354, 2.521003, 0.7980603, 1, 1, 1, 1, 1,
1.061836, 0.5677915, 1.319661, 1, 1, 1, 1, 1,
1.069655, 0.1222436, 1.015983, 1, 1, 1, 1, 1,
1.071791, 0.5212956, 2.472939, 1, 1, 1, 1, 1,
1.076432, 1.232428, 3.148609, 1, 1, 1, 1, 1,
1.076969, -1.60635, 1.090924, 1, 1, 1, 1, 1,
1.078046, -0.4988329, 0.4533616, 0, 0, 1, 1, 1,
1.078225, 0.3743567, 0.7829034, 1, 0, 0, 1, 1,
1.086105, 1.423269, 2.360823, 1, 0, 0, 1, 1,
1.092264, 0.09525715, 2.440667, 1, 0, 0, 1, 1,
1.106652, 0.4126001, 0.7411923, 1, 0, 0, 1, 1,
1.118698, -0.03559364, 1.362931, 1, 0, 0, 1, 1,
1.126123, -0.8906822, 1.833692, 0, 0, 0, 1, 1,
1.127538, 0.3934716, 2.820662, 0, 0, 0, 1, 1,
1.13044, 0.4423644, 2.407313, 0, 0, 0, 1, 1,
1.136941, 0.2155329, 0.1507013, 0, 0, 0, 1, 1,
1.138088, -0.1970184, 2.545149, 0, 0, 0, 1, 1,
1.142332, -1.094044, 2.29824, 0, 0, 0, 1, 1,
1.143188, -1.31051, 0.8991546, 0, 0, 0, 1, 1,
1.149096, 0.2179136, 3.15485, 1, 1, 1, 1, 1,
1.151175, -0.2528947, 2.627735, 1, 1, 1, 1, 1,
1.153659, 2.457999, 0.4824083, 1, 1, 1, 1, 1,
1.157792, 0.6721671, 2.688842, 1, 1, 1, 1, 1,
1.173521, -1.303508, 3.666717, 1, 1, 1, 1, 1,
1.182557, 0.5450713, 1.65372, 1, 1, 1, 1, 1,
1.183176, 0.997718, 0.3583944, 1, 1, 1, 1, 1,
1.183303, -2.482359, 2.953334, 1, 1, 1, 1, 1,
1.198519, -0.4300689, 0.6245254, 1, 1, 1, 1, 1,
1.200084, -0.4958078, 0.1732966, 1, 1, 1, 1, 1,
1.21298, 1.720116, 1.361252, 1, 1, 1, 1, 1,
1.213274, 0.3032802, 2.808469, 1, 1, 1, 1, 1,
1.214919, -0.3834781, 1.168061, 1, 1, 1, 1, 1,
1.216434, 1.403935, 1.136335, 1, 1, 1, 1, 1,
1.222965, -1.324937, 2.461459, 1, 1, 1, 1, 1,
1.227381, -0.2021673, 0.9393887, 0, 0, 1, 1, 1,
1.228235, 0.09533258, 1.996579, 1, 0, 0, 1, 1,
1.232807, 1.065252, 1.911687, 1, 0, 0, 1, 1,
1.24251, -0.185062, 1.305925, 1, 0, 0, 1, 1,
1.24502, 0.6587511, 2.17018, 1, 0, 0, 1, 1,
1.246467, 0.1280427, 1.639245, 1, 0, 0, 1, 1,
1.251748, -0.2716516, 1.594216, 0, 0, 0, 1, 1,
1.253512, -0.1591761, 0.8006651, 0, 0, 0, 1, 1,
1.25453, 0.8747505, 1.95455, 0, 0, 0, 1, 1,
1.256111, 0.02492239, 1.762491, 0, 0, 0, 1, 1,
1.269153, 0.1842286, 2.464475, 0, 0, 0, 1, 1,
1.276431, 0.2303006, 1.779355, 0, 0, 0, 1, 1,
1.278017, 1.152793, 1.194407, 0, 0, 0, 1, 1,
1.296147, 0.2933763, 0.78089, 1, 1, 1, 1, 1,
1.298963, -0.03072806, 0.3179407, 1, 1, 1, 1, 1,
1.303829, 0.428046, 0.06710949, 1, 1, 1, 1, 1,
1.306921, -1.873055, 3.051807, 1, 1, 1, 1, 1,
1.308238, 0.1788994, -0.3940213, 1, 1, 1, 1, 1,
1.316689, -0.146747, 0.7205748, 1, 1, 1, 1, 1,
1.334739, 0.9605803, 1.32242, 1, 1, 1, 1, 1,
1.346839, -0.8106968, 1.978513, 1, 1, 1, 1, 1,
1.355159, -0.8834575, 2.708409, 1, 1, 1, 1, 1,
1.36203, -0.2417739, 1.053882, 1, 1, 1, 1, 1,
1.36699, 0.41421, 1.723464, 1, 1, 1, 1, 1,
1.369515, -0.4495938, 1.233201, 1, 1, 1, 1, 1,
1.379744, -0.4479517, 0.07682464, 1, 1, 1, 1, 1,
1.397995, 0.7746329, 1.384131, 1, 1, 1, 1, 1,
1.400431, -2.261775, 3.786557, 1, 1, 1, 1, 1,
1.409952, 0.358077, 1.180326, 0, 0, 1, 1, 1,
1.414797, -1.231549, 2.614468, 1, 0, 0, 1, 1,
1.431476, 0.1581325, 3.239671, 1, 0, 0, 1, 1,
1.438376, 1.358664, 0.3673396, 1, 0, 0, 1, 1,
1.438835, -0.6072973, 1.510567, 1, 0, 0, 1, 1,
1.4441, 0.7132349, 0.3926307, 1, 0, 0, 1, 1,
1.446253, 0.1420785, 3.355407, 0, 0, 0, 1, 1,
1.44633, 0.4394907, 3.604655, 0, 0, 0, 1, 1,
1.451546, -1.687414, 2.766384, 0, 0, 0, 1, 1,
1.457834, -0.5561916, 1.649034, 0, 0, 0, 1, 1,
1.457894, -1.286877, 1.891664, 0, 0, 0, 1, 1,
1.463852, -0.1656365, 2.199141, 0, 0, 0, 1, 1,
1.482241, -0.5311188, 0.2756689, 0, 0, 0, 1, 1,
1.48714, -0.3266541, -0.1155333, 1, 1, 1, 1, 1,
1.490824, -1.675919, 2.846195, 1, 1, 1, 1, 1,
1.492278, -0.248311, 0.1291128, 1, 1, 1, 1, 1,
1.492976, -0.9846527, 3.328951, 1, 1, 1, 1, 1,
1.494099, -1.043648, 1.300427, 1, 1, 1, 1, 1,
1.504593, 1.476288, 1.308751, 1, 1, 1, 1, 1,
1.522289, 0.06552058, 2.026278, 1, 1, 1, 1, 1,
1.523073, -0.6553415, 3.06625, 1, 1, 1, 1, 1,
1.530199, 0.4252988, 0.8561854, 1, 1, 1, 1, 1,
1.531323, 1.399829, 1.536618, 1, 1, 1, 1, 1,
1.532084, 1.038006, 0.9339262, 1, 1, 1, 1, 1,
1.549054, -1.029593, -0.1653699, 1, 1, 1, 1, 1,
1.558854, 0.4863001, 0.5352485, 1, 1, 1, 1, 1,
1.560169, 0.7569227, 2.190278, 1, 1, 1, 1, 1,
1.581063, -1.98932, 3.021289, 1, 1, 1, 1, 1,
1.58481, 0.5965989, 1.459538, 0, 0, 1, 1, 1,
1.584841, 0.3828679, 0.776834, 1, 0, 0, 1, 1,
1.585863, 1.009376, 1.333646, 1, 0, 0, 1, 1,
1.59619, -1.796376, 3.480402, 1, 0, 0, 1, 1,
1.608952, 2.897513, 0.4904834, 1, 0, 0, 1, 1,
1.618392, -0.3028802, 1.992677, 1, 0, 0, 1, 1,
1.651867, -1.001349, 2.679049, 0, 0, 0, 1, 1,
1.663074, 0.6667283, 2.01156, 0, 0, 0, 1, 1,
1.669885, -0.1415356, 0.7841287, 0, 0, 0, 1, 1,
1.675673, -1.398352, 1.166598, 0, 0, 0, 1, 1,
1.709847, 1.287254, 0.9479906, 0, 0, 0, 1, 1,
1.711002, 0.0543986, 2.268879, 0, 0, 0, 1, 1,
1.724454, 2.086568, -0.4948181, 0, 0, 0, 1, 1,
1.726354, -1.912653, 1.578259, 1, 1, 1, 1, 1,
1.738797, 0.3053408, 1.369279, 1, 1, 1, 1, 1,
1.74432, 1.007953, 1.324479, 1, 1, 1, 1, 1,
1.749807, -1.575165, 2.809883, 1, 1, 1, 1, 1,
1.751648, -0.273527, 0.6174657, 1, 1, 1, 1, 1,
1.76669, -0.08254715, -0.140332, 1, 1, 1, 1, 1,
1.776667, -1.31738, 1.745522, 1, 1, 1, 1, 1,
1.798015, -0.9517528, 1.100632, 1, 1, 1, 1, 1,
1.811063, 0.9578948, -0.2212471, 1, 1, 1, 1, 1,
1.823542, 0.3632773, 1.067281, 1, 1, 1, 1, 1,
1.82662, -0.9042438, 2.684444, 1, 1, 1, 1, 1,
1.846419, -0.5334944, 2.861156, 1, 1, 1, 1, 1,
1.853269, -0.81817, 1.049597, 1, 1, 1, 1, 1,
1.920499, 1.28117, 0.8427299, 1, 1, 1, 1, 1,
1.948255, 1.315133, 3.336048, 1, 1, 1, 1, 1,
1.957766, 0.01662718, 1.638492, 0, 0, 1, 1, 1,
1.996384, 0.2840502, 0.9790442, 1, 0, 0, 1, 1,
2.069927, 0.09601227, 1.126925, 1, 0, 0, 1, 1,
2.071592, -0.2413191, 2.357022, 1, 0, 0, 1, 1,
2.080832, 0.9564047, 0.1641872, 1, 0, 0, 1, 1,
2.087037, 1.843713, 2.393427, 1, 0, 0, 1, 1,
2.087188, -0.01707116, 1.619414, 0, 0, 0, 1, 1,
2.132348, 0.08383781, 1.369205, 0, 0, 0, 1, 1,
2.188024, -0.7439098, 2.170514, 0, 0, 0, 1, 1,
2.270857, -0.9113614, 3.048198, 0, 0, 0, 1, 1,
2.294586, -2.04638, 1.879495, 0, 0, 0, 1, 1,
2.340597, -0.4496022, 1.582361, 0, 0, 0, 1, 1,
2.351303, 0.08975089, 1.89878, 0, 0, 0, 1, 1,
2.363355, -0.1965766, 2.873504, 1, 1, 1, 1, 1,
2.390417, 0.3416098, 1.124486, 1, 1, 1, 1, 1,
2.488313, -0.6456988, 2.689063, 1, 1, 1, 1, 1,
3.004643, -0.1360217, 0.1988438, 1, 1, 1, 1, 1,
3.030368, -0.1970038, 1.386266, 1, 1, 1, 1, 1,
3.229423, -1.408943, 0.8052735, 1, 1, 1, 1, 1,
3.285765, -0.501363, 0.8442931, 1, 1, 1, 1, 1
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
var radius = 9.481513;
var distance = 33.30341;
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
mvMatrix.translate( -0.2035644, -0.05782032, -0.04987693 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.30341);
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
