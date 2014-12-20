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
-2.961812, -0.6497554, -3.923283, 1, 0, 0, 1,
-2.872604, 0.01711474, -0.9456847, 1, 0.007843138, 0, 1,
-2.631238, 2.217472, -1.22853, 1, 0.01176471, 0, 1,
-2.571701, 0.9973326, -2.826424, 1, 0.01960784, 0, 1,
-2.464837, -0.9666687, -2.898107, 1, 0.02352941, 0, 1,
-2.452922, -0.8713803, -1.623655, 1, 0.03137255, 0, 1,
-2.450542, 1.136169, -0.5431104, 1, 0.03529412, 0, 1,
-2.439178, -1.139033, -0.7677734, 1, 0.04313726, 0, 1,
-2.403956, 0.6427165, -2.689115, 1, 0.04705882, 0, 1,
-2.384321, -2.2724, -3.688309, 1, 0.05490196, 0, 1,
-2.36907, -0.9972574, -1.797377, 1, 0.05882353, 0, 1,
-2.368142, 1.118355, -0.9673021, 1, 0.06666667, 0, 1,
-2.356317, -0.1365005, -1.77784, 1, 0.07058824, 0, 1,
-2.325106, -0.4252181, -2.259686, 1, 0.07843138, 0, 1,
-2.287937, -0.1232414, -2.937675, 1, 0.08235294, 0, 1,
-2.163574, 0.4075518, 0.9634439, 1, 0.09019608, 0, 1,
-2.159413, 0.899372, -2.796929, 1, 0.09411765, 0, 1,
-2.156936, -0.771935, -2.862867, 1, 0.1019608, 0, 1,
-2.1472, -0.511437, -0.8685655, 1, 0.1098039, 0, 1,
-2.144469, 0.4418385, -2.512721, 1, 0.1137255, 0, 1,
-2.119245, 0.4479498, -1.280915, 1, 0.1215686, 0, 1,
-2.099225, 1.771996, 1.695991, 1, 0.1254902, 0, 1,
-2.094182, 0.2308118, -2.902904, 1, 0.1333333, 0, 1,
-2.08446, 0.7113481, -0.2570645, 1, 0.1372549, 0, 1,
-2.084099, -0.3648042, -2.643545, 1, 0.145098, 0, 1,
-2.033221, -0.552525, -2.247798, 1, 0.1490196, 0, 1,
-2.003062, -0.9331254, -1.291935, 1, 0.1568628, 0, 1,
-1.990416, 0.4262881, -0.9247166, 1, 0.1607843, 0, 1,
-1.939913, -0.1041722, -1.069887, 1, 0.1686275, 0, 1,
-1.927326, 0.8542511, -1.634794, 1, 0.172549, 0, 1,
-1.914246, -0.1312097, -2.09452, 1, 0.1803922, 0, 1,
-1.91024, -0.3909153, -2.292953, 1, 0.1843137, 0, 1,
-1.908023, -0.7733756, -1.085921, 1, 0.1921569, 0, 1,
-1.907771, -0.1887389, -3.57604, 1, 0.1960784, 0, 1,
-1.896173, -0.6008551, -1.716748, 1, 0.2039216, 0, 1,
-1.876149, -0.6028425, -0.6771546, 1, 0.2117647, 0, 1,
-1.870922, 0.5912268, -0.7492255, 1, 0.2156863, 0, 1,
-1.862941, 0.1856976, -1.552385, 1, 0.2235294, 0, 1,
-1.842948, 0.8407167, -2.202548, 1, 0.227451, 0, 1,
-1.836504, -0.05765244, -1.063072, 1, 0.2352941, 0, 1,
-1.827923, 0.6290763, -0.8941244, 1, 0.2392157, 0, 1,
-1.82741, -0.06829091, -1.621555, 1, 0.2470588, 0, 1,
-1.808955, -0.3503447, 0.2999858, 1, 0.2509804, 0, 1,
-1.781779, 1.140921, -0.5469584, 1, 0.2588235, 0, 1,
-1.779967, -0.317714, -1.236849, 1, 0.2627451, 0, 1,
-1.771986, 0.3979449, -2.801209, 1, 0.2705882, 0, 1,
-1.770306, 1.558038, -1.657018, 1, 0.2745098, 0, 1,
-1.748057, 0.1640938, -3.354827, 1, 0.282353, 0, 1,
-1.736545, 0.145294, -3.168313, 1, 0.2862745, 0, 1,
-1.728386, -0.2664095, -3.664623, 1, 0.2941177, 0, 1,
-1.727523, 1.016966, 1.244088, 1, 0.3019608, 0, 1,
-1.713211, 0.7598125, -1.538209, 1, 0.3058824, 0, 1,
-1.70612, 1.12775, -1.773946, 1, 0.3137255, 0, 1,
-1.700399, -0.3257463, -0.7347976, 1, 0.3176471, 0, 1,
-1.66807, -0.2078211, -3.608888, 1, 0.3254902, 0, 1,
-1.656665, -0.7933022, -2.066089, 1, 0.3294118, 0, 1,
-1.635803, -1.072742, -1.411836, 1, 0.3372549, 0, 1,
-1.630566, -0.478536, -1.983094, 1, 0.3411765, 0, 1,
-1.62188, -0.02080547, -2.581837, 1, 0.3490196, 0, 1,
-1.587632, -0.5748978, 0.9434861, 1, 0.3529412, 0, 1,
-1.574068, 0.526019, -2.100421, 1, 0.3607843, 0, 1,
-1.573455, -0.9159118, -1.014044, 1, 0.3647059, 0, 1,
-1.571207, -0.457138, -1.947484, 1, 0.372549, 0, 1,
-1.559027, 0.8858227, -1.017089, 1, 0.3764706, 0, 1,
-1.536812, 0.2084772, -1.082056, 1, 0.3843137, 0, 1,
-1.532523, -0.4252834, -1.261519, 1, 0.3882353, 0, 1,
-1.520898, -0.1672816, -3.811319, 1, 0.3960784, 0, 1,
-1.502121, -0.1005933, -1.16895, 1, 0.4039216, 0, 1,
-1.486691, -0.8721647, -3.053276, 1, 0.4078431, 0, 1,
-1.47325, 1.306006, -1.525483, 1, 0.4156863, 0, 1,
-1.465923, 1.996673, 0.4400951, 1, 0.4196078, 0, 1,
-1.460492, 1.471643, -1.664624, 1, 0.427451, 0, 1,
-1.454118, 1.340141, -0.5401338, 1, 0.4313726, 0, 1,
-1.45171, 0.5111588, -0.4343857, 1, 0.4392157, 0, 1,
-1.451659, 1.128667, -0.1005856, 1, 0.4431373, 0, 1,
-1.444163, -0.6648804, -1.192914, 1, 0.4509804, 0, 1,
-1.4388, 0.1075287, -2.64807, 1, 0.454902, 0, 1,
-1.434735, -0.660493, -2.684662, 1, 0.4627451, 0, 1,
-1.42935, -0.8123201, -0.4189147, 1, 0.4666667, 0, 1,
-1.402596, 0.2360902, -3.619206, 1, 0.4745098, 0, 1,
-1.401998, 0.2930078, -2.552818, 1, 0.4784314, 0, 1,
-1.397876, -0.8785869, -1.925791, 1, 0.4862745, 0, 1,
-1.395859, -0.08440634, -0.5265206, 1, 0.4901961, 0, 1,
-1.394571, -0.5084698, -0.6196787, 1, 0.4980392, 0, 1,
-1.392017, -0.7585093, -4.848784, 1, 0.5058824, 0, 1,
-1.39079, -0.8079373, -0.9071446, 1, 0.509804, 0, 1,
-1.389817, 0.1134551, -0.6551923, 1, 0.5176471, 0, 1,
-1.375697, -0.7647543, -3.267757, 1, 0.5215687, 0, 1,
-1.369403, -0.9430109, -2.878925, 1, 0.5294118, 0, 1,
-1.3658, -1.134151, -1.68977, 1, 0.5333334, 0, 1,
-1.361419, 0.01212239, -0.811936, 1, 0.5411765, 0, 1,
-1.357207, -1.265028, -0.7403252, 1, 0.5450981, 0, 1,
-1.350131, -0.1030427, -2.053455, 1, 0.5529412, 0, 1,
-1.345739, -0.6956342, -1.943538, 1, 0.5568628, 0, 1,
-1.338737, 0.07134142, -2.976115, 1, 0.5647059, 0, 1,
-1.331691, 1.295147, 0.7195197, 1, 0.5686275, 0, 1,
-1.32827, 0.4094188, -0.03627155, 1, 0.5764706, 0, 1,
-1.327361, -2.398057, -1.559216, 1, 0.5803922, 0, 1,
-1.324998, -0.4173437, -0.7975228, 1, 0.5882353, 0, 1,
-1.321775, 0.01625462, -2.523857, 1, 0.5921569, 0, 1,
-1.311446, -0.06710365, -2.427675, 1, 0.6, 0, 1,
-1.308852, 1.121432, -2.000088, 1, 0.6078432, 0, 1,
-1.304286, -1.886787, -3.618665, 1, 0.6117647, 0, 1,
-1.302635, 0.7952492, -1.293741, 1, 0.6196079, 0, 1,
-1.300695, 0.4283426, -1.721919, 1, 0.6235294, 0, 1,
-1.300235, 0.4079493, 0.3831947, 1, 0.6313726, 0, 1,
-1.299971, 0.3773555, -2.674066, 1, 0.6352941, 0, 1,
-1.292222, -1.516761, -0.684668, 1, 0.6431373, 0, 1,
-1.289926, -0.6825627, -3.064472, 1, 0.6470588, 0, 1,
-1.287134, 2.741682, 1.010054, 1, 0.654902, 0, 1,
-1.284184, -0.07097858, -2.898553, 1, 0.6588235, 0, 1,
-1.273766, 1.967758, -1.272718, 1, 0.6666667, 0, 1,
-1.257693, -0.08394951, -1.737902, 1, 0.6705883, 0, 1,
-1.256915, -1.74905, -3.253966, 1, 0.6784314, 0, 1,
-1.234413, -0.3569146, -0.8522553, 1, 0.682353, 0, 1,
-1.226354, -0.6721416, -2.222079, 1, 0.6901961, 0, 1,
-1.218866, -0.8283339, -1.964036, 1, 0.6941177, 0, 1,
-1.218625, -0.5123206, -0.8289331, 1, 0.7019608, 0, 1,
-1.211006, 0.7964995, -2.171487, 1, 0.7098039, 0, 1,
-1.204051, 1.725587, -1.424673, 1, 0.7137255, 0, 1,
-1.19977, 1.520296, -0.04547662, 1, 0.7215686, 0, 1,
-1.196877, 0.7902562, -3.671898, 1, 0.7254902, 0, 1,
-1.186286, 0.1955243, -1.279979, 1, 0.7333333, 0, 1,
-1.183494, 1.608686, -0.8991473, 1, 0.7372549, 0, 1,
-1.176113, 0.1952057, 0.04707051, 1, 0.7450981, 0, 1,
-1.171849, 0.6173449, -1.306058, 1, 0.7490196, 0, 1,
-1.169568, 1.06593, -0.5437152, 1, 0.7568628, 0, 1,
-1.169347, -1.630115, -1.111007, 1, 0.7607843, 0, 1,
-1.160088, 0.7553, -2.245112, 1, 0.7686275, 0, 1,
-1.155302, 0.5632868, -1.05565, 1, 0.772549, 0, 1,
-1.150611, -1.213937, -0.7119326, 1, 0.7803922, 0, 1,
-1.149367, 1.144373, -0.7707482, 1, 0.7843137, 0, 1,
-1.148705, -1.14954, -3.505155, 1, 0.7921569, 0, 1,
-1.139983, -0.3758578, -2.087132, 1, 0.7960784, 0, 1,
-1.138853, -0.8447669, -2.689728, 1, 0.8039216, 0, 1,
-1.131999, -0.3795205, -0.8345302, 1, 0.8117647, 0, 1,
-1.127986, -0.5053398, -3.79707, 1, 0.8156863, 0, 1,
-1.121593, -0.05535302, -1.985648, 1, 0.8235294, 0, 1,
-1.12143, -0.8773576, -2.036515, 1, 0.827451, 0, 1,
-1.118464, -0.4869044, -2.933821, 1, 0.8352941, 0, 1,
-1.118141, 1.742183, -2.065458, 1, 0.8392157, 0, 1,
-1.116137, -1.053297, -0.2785374, 1, 0.8470588, 0, 1,
-1.109852, 0.4368332, 0.675644, 1, 0.8509804, 0, 1,
-1.105618, -0.5945754, -0.5857841, 1, 0.8588235, 0, 1,
-1.100755, 0.21859, -1.160786, 1, 0.8627451, 0, 1,
-1.099853, 0.4069492, -0.7896582, 1, 0.8705882, 0, 1,
-1.094248, -0.1793248, -1.669749, 1, 0.8745098, 0, 1,
-1.09016, -0.6359524, -1.90326, 1, 0.8823529, 0, 1,
-1.086303, -0.400922, -1.304537, 1, 0.8862745, 0, 1,
-1.083886, -0.1330413, -0.3223193, 1, 0.8941177, 0, 1,
-1.079244, 0.09725877, -1.639792, 1, 0.8980392, 0, 1,
-1.078737, 0.1674284, -0.8171737, 1, 0.9058824, 0, 1,
-1.077965, -1.213647, -2.538864, 1, 0.9137255, 0, 1,
-1.064196, 0.8731192, -0.6428961, 1, 0.9176471, 0, 1,
-1.057295, -0.9196483, -3.105648, 1, 0.9254902, 0, 1,
-1.045459, 0.8424264, -0.7535546, 1, 0.9294118, 0, 1,
-1.033501, -1.041759, -2.125411, 1, 0.9372549, 0, 1,
-1.02573, 1.305304, -0.1292558, 1, 0.9411765, 0, 1,
-1.020036, -0.5297893, -2.172738, 1, 0.9490196, 0, 1,
-1.013365, -1.278627, -2.706269, 1, 0.9529412, 0, 1,
-1.012595, -0.2346911, -1.359178, 1, 0.9607843, 0, 1,
-1.011901, -1.982679, -2.959734, 1, 0.9647059, 0, 1,
-1.009853, 0.0676548, -1.912192, 1, 0.972549, 0, 1,
-1.004599, -0.2905743, -2.986549, 1, 0.9764706, 0, 1,
-1.000265, 1.789287, -2.026, 1, 0.9843137, 0, 1,
-0.9984282, 0.3673557, -3.553149, 1, 0.9882353, 0, 1,
-0.9962216, 0.3077048, -1.494248, 1, 0.9960784, 0, 1,
-0.9931519, -0.4375408, -2.451718, 0.9960784, 1, 0, 1,
-0.9892876, 0.1736177, -1.088877, 0.9921569, 1, 0, 1,
-0.9829987, -1.506281, -2.545796, 0.9843137, 1, 0, 1,
-0.9827352, 0.1378389, -1.567384, 0.9803922, 1, 0, 1,
-0.9718155, -0.4679332, -2.1835, 0.972549, 1, 0, 1,
-0.9663156, -0.5351014, -0.3952549, 0.9686275, 1, 0, 1,
-0.9587017, 1.574388, 0.3646931, 0.9607843, 1, 0, 1,
-0.9576574, -0.7153799, -0.8763645, 0.9568627, 1, 0, 1,
-0.952655, -1.484469, -1.235768, 0.9490196, 1, 0, 1,
-0.9523777, 0.8128856, -3.12839, 0.945098, 1, 0, 1,
-0.9487802, 0.4775431, -1.081656, 0.9372549, 1, 0, 1,
-0.9455272, 1.297033, -0.8676938, 0.9333333, 1, 0, 1,
-0.9431003, 2.345742, -0.5603588, 0.9254902, 1, 0, 1,
-0.9420938, -1.300159, -2.439608, 0.9215686, 1, 0, 1,
-0.9352621, -0.29038, -1.519347, 0.9137255, 1, 0, 1,
-0.9328015, 1.067406, 0.2684252, 0.9098039, 1, 0, 1,
-0.9284437, 0.07435986, -0.2605703, 0.9019608, 1, 0, 1,
-0.9259106, 0.1460921, -0.3176798, 0.8941177, 1, 0, 1,
-0.9256629, -0.6142034, -1.060418, 0.8901961, 1, 0, 1,
-0.9253991, 0.3695399, -2.40463, 0.8823529, 1, 0, 1,
-0.9235544, 1.297381, 0.3363131, 0.8784314, 1, 0, 1,
-0.9199424, 1.144414, -1.499257, 0.8705882, 1, 0, 1,
-0.914255, 1.727747, -0.8844431, 0.8666667, 1, 0, 1,
-0.9141178, -0.599811, -0.1612856, 0.8588235, 1, 0, 1,
-0.9134106, 0.8888775, -1.300799, 0.854902, 1, 0, 1,
-0.904848, 0.8121633, -1.520351, 0.8470588, 1, 0, 1,
-0.8960609, 0.1718786, -0.6574104, 0.8431373, 1, 0, 1,
-0.8954546, 0.4952827, -1.964582, 0.8352941, 1, 0, 1,
-0.8918837, 0.2316791, -1.186225, 0.8313726, 1, 0, 1,
-0.8887047, 1.382678, 0.2118869, 0.8235294, 1, 0, 1,
-0.8850812, 0.06202102, -1.639602, 0.8196079, 1, 0, 1,
-0.8836175, 0.3223492, 0.2202078, 0.8117647, 1, 0, 1,
-0.8835315, 1.190182, -1.760051, 0.8078431, 1, 0, 1,
-0.8833309, -0.1992242, -0.2440378, 0.8, 1, 0, 1,
-0.8715875, -0.03987061, -2.323506, 0.7921569, 1, 0, 1,
-0.8707867, -1.320401, -3.211922, 0.7882353, 1, 0, 1,
-0.8666709, 0.4801284, -1.265627, 0.7803922, 1, 0, 1,
-0.8638996, 1.649494, -0.6189687, 0.7764706, 1, 0, 1,
-0.8631023, -0.5508204, -3.194473, 0.7686275, 1, 0, 1,
-0.8545771, -1.333331, -2.278369, 0.7647059, 1, 0, 1,
-0.852628, -1.608371, -3.122403, 0.7568628, 1, 0, 1,
-0.849568, -0.4946921, -0.3875179, 0.7529412, 1, 0, 1,
-0.8444684, -0.5779992, -2.064763, 0.7450981, 1, 0, 1,
-0.8427892, 1.349863, 0.6706621, 0.7411765, 1, 0, 1,
-0.8388319, 0.062883, -2.446244, 0.7333333, 1, 0, 1,
-0.837629, -0.8096204, -3.425476, 0.7294118, 1, 0, 1,
-0.8314396, -1.179437, -1.722277, 0.7215686, 1, 0, 1,
-0.8290167, 0.1238389, -0.2997, 0.7176471, 1, 0, 1,
-0.8244053, 0.302547, -1.496439, 0.7098039, 1, 0, 1,
-0.8243208, 0.4679016, -0.784378, 0.7058824, 1, 0, 1,
-0.815957, -0.7693682, -2.820837, 0.6980392, 1, 0, 1,
-0.8144686, 1.091898, -1.495747, 0.6901961, 1, 0, 1,
-0.8128912, -0.1835309, -1.553558, 0.6862745, 1, 0, 1,
-0.8102845, 0.3891799, -1.048369, 0.6784314, 1, 0, 1,
-0.8101236, -0.1556728, -2.039463, 0.6745098, 1, 0, 1,
-0.8093224, -1.661908, -2.735251, 0.6666667, 1, 0, 1,
-0.7988878, -0.7890589, -2.589082, 0.6627451, 1, 0, 1,
-0.7969407, -0.7441274, -1.214, 0.654902, 1, 0, 1,
-0.7950861, -1.406244, -0.8383387, 0.6509804, 1, 0, 1,
-0.7925942, -0.2250266, -1.052889, 0.6431373, 1, 0, 1,
-0.7910854, -0.2720366, -0.2593133, 0.6392157, 1, 0, 1,
-0.7850156, -1.667364, -3.63834, 0.6313726, 1, 0, 1,
-0.7849566, 1.717471, -0.7096827, 0.627451, 1, 0, 1,
-0.7835253, -2.371475, -3.451218, 0.6196079, 1, 0, 1,
-0.7738129, 0.911231, -1.702725, 0.6156863, 1, 0, 1,
-0.7709353, 0.9801096, -1.974754, 0.6078432, 1, 0, 1,
-0.770061, -0.9290144, -2.664395, 0.6039216, 1, 0, 1,
-0.7691624, -0.6250566, -2.760448, 0.5960785, 1, 0, 1,
-0.7669827, -0.3273815, -1.082455, 0.5882353, 1, 0, 1,
-0.7668109, 1.447519, -0.8243723, 0.5843138, 1, 0, 1,
-0.7651562, 1.584498, -1.16949, 0.5764706, 1, 0, 1,
-0.7607107, -0.7056497, -3.523526, 0.572549, 1, 0, 1,
-0.7594063, -0.4329678, -2.596398, 0.5647059, 1, 0, 1,
-0.753293, -1.045534, -1.470777, 0.5607843, 1, 0, 1,
-0.7520702, -0.01180534, -1.109859, 0.5529412, 1, 0, 1,
-0.7518918, -0.07257759, -2.675175, 0.5490196, 1, 0, 1,
-0.7503123, 0.09745708, -2.474024, 0.5411765, 1, 0, 1,
-0.748102, 0.7560539, 0.5024498, 0.5372549, 1, 0, 1,
-0.7462696, -0.3621534, -2.676805, 0.5294118, 1, 0, 1,
-0.7438017, -0.4394698, -1.565812, 0.5254902, 1, 0, 1,
-0.7420665, 1.579053, 1.430272, 0.5176471, 1, 0, 1,
-0.7401904, 0.05289313, -1.971032, 0.5137255, 1, 0, 1,
-0.7271974, -0.4687797, -1.710631, 0.5058824, 1, 0, 1,
-0.7213193, 1.53638, -0.1386826, 0.5019608, 1, 0, 1,
-0.7182845, 1.321831, -2.083203, 0.4941176, 1, 0, 1,
-0.7080622, -0.7373945, -2.178901, 0.4862745, 1, 0, 1,
-0.7053258, -0.7165258, -0.7595864, 0.4823529, 1, 0, 1,
-0.7022018, 0.6673462, 0.5198226, 0.4745098, 1, 0, 1,
-0.6941728, 0.6979311, -0.432465, 0.4705882, 1, 0, 1,
-0.679383, 0.2088669, -1.680399, 0.4627451, 1, 0, 1,
-0.6792396, -0.1081022, -2.003447, 0.4588235, 1, 0, 1,
-0.6785078, 0.02338491, -2.604939, 0.4509804, 1, 0, 1,
-0.6688214, -0.5936124, -3.314777, 0.4470588, 1, 0, 1,
-0.6676937, 0.1633958, 0.7293271, 0.4392157, 1, 0, 1,
-0.6620236, -0.1366447, -4.18685, 0.4352941, 1, 0, 1,
-0.6612574, 1.090278, -0.2881204, 0.427451, 1, 0, 1,
-0.6594665, 0.4221054, 0.09335274, 0.4235294, 1, 0, 1,
-0.6587268, -0.5881995, -0.7698715, 0.4156863, 1, 0, 1,
-0.6566672, 0.8122813, 1.861235, 0.4117647, 1, 0, 1,
-0.6560991, 1.721379, -2.140776, 0.4039216, 1, 0, 1,
-0.6511071, 0.5279936, -2.349503, 0.3960784, 1, 0, 1,
-0.6509241, 1.844258, 0.7207286, 0.3921569, 1, 0, 1,
-0.650865, 0.9172356, -1.826603, 0.3843137, 1, 0, 1,
-0.6487679, 1.559382, 0.3970902, 0.3803922, 1, 0, 1,
-0.6391676, -0.07687999, -2.828381, 0.372549, 1, 0, 1,
-0.6384259, 1.351287, -0.4001064, 0.3686275, 1, 0, 1,
-0.6380599, -0.09306781, -0.6532682, 0.3607843, 1, 0, 1,
-0.6356428, 1.298466, -0.5757843, 0.3568628, 1, 0, 1,
-0.6311216, 1.263623, -0.04312282, 0.3490196, 1, 0, 1,
-0.6301895, 0.2736044, -0.7721248, 0.345098, 1, 0, 1,
-0.6282253, 1.03743, 0.9493335, 0.3372549, 1, 0, 1,
-0.6207871, -0.172211, -2.212775, 0.3333333, 1, 0, 1,
-0.6190643, -0.4940457, -2.580398, 0.3254902, 1, 0, 1,
-0.6180211, -1.162146, -2.570368, 0.3215686, 1, 0, 1,
-0.6167979, 0.4509882, 0.2297319, 0.3137255, 1, 0, 1,
-0.6074503, -0.4749048, -5.055589, 0.3098039, 1, 0, 1,
-0.6026695, 1.867046, -1.403646, 0.3019608, 1, 0, 1,
-0.6016905, -1.027762, -1.163269, 0.2941177, 1, 0, 1,
-0.5975915, 1.216403, 0.1905441, 0.2901961, 1, 0, 1,
-0.59656, -1.280776, -3.856106, 0.282353, 1, 0, 1,
-0.5933333, -0.1481883, -2.439356, 0.2784314, 1, 0, 1,
-0.591945, 0.2669297, -1.515173, 0.2705882, 1, 0, 1,
-0.5902664, 0.1636439, -2.637516, 0.2666667, 1, 0, 1,
-0.5883546, 1.159265, -0.7833054, 0.2588235, 1, 0, 1,
-0.5870568, 0.500913, -0.8430156, 0.254902, 1, 0, 1,
-0.5841945, 0.4251956, 0.188722, 0.2470588, 1, 0, 1,
-0.5805976, 0.6699436, -0.4724032, 0.2431373, 1, 0, 1,
-0.5706874, -0.1601383, -2.484261, 0.2352941, 1, 0, 1,
-0.5628145, 0.2579377, -2.251933, 0.2313726, 1, 0, 1,
-0.5625687, -0.6923777, -2.371879, 0.2235294, 1, 0, 1,
-0.553849, -0.1621319, -3.504287, 0.2196078, 1, 0, 1,
-0.5522424, -0.8873149, -3.094635, 0.2117647, 1, 0, 1,
-0.5492359, 0.3074722, -2.172745, 0.2078431, 1, 0, 1,
-0.546536, -0.5017431, -0.8499401, 0.2, 1, 0, 1,
-0.5372831, 0.4758997, -1.465355, 0.1921569, 1, 0, 1,
-0.5251213, -0.8437163, -3.61703, 0.1882353, 1, 0, 1,
-0.5249122, -1.883252, -3.595713, 0.1803922, 1, 0, 1,
-0.5239999, 0.5842672, -1.226418, 0.1764706, 1, 0, 1,
-0.5175613, -0.2152227, -2.768421, 0.1686275, 1, 0, 1,
-0.5165741, 0.7778158, 0.2949542, 0.1647059, 1, 0, 1,
-0.5135163, 0.4818746, 0.2851098, 0.1568628, 1, 0, 1,
-0.507346, -0.08844225, -1.774177, 0.1529412, 1, 0, 1,
-0.4988084, -0.3705103, -1.182536, 0.145098, 1, 0, 1,
-0.4942932, 0.8230821, -0.7318625, 0.1411765, 1, 0, 1,
-0.4911972, 0.1857899, -1.472577, 0.1333333, 1, 0, 1,
-0.4882564, 0.0318776, -0.729588, 0.1294118, 1, 0, 1,
-0.4868272, -0.3350688, -2.680349, 0.1215686, 1, 0, 1,
-0.4860924, -0.204109, -1.627927, 0.1176471, 1, 0, 1,
-0.485677, 0.9330537, -0.3668094, 0.1098039, 1, 0, 1,
-0.4827413, 0.4958587, 0.702434, 0.1058824, 1, 0, 1,
-0.4767891, 1.282721, -0.8898866, 0.09803922, 1, 0, 1,
-0.4670112, 0.2055069, -0.1918481, 0.09019608, 1, 0, 1,
-0.4642921, -1.443567, -3.701916, 0.08627451, 1, 0, 1,
-0.4638782, 0.8747926, -0.9855909, 0.07843138, 1, 0, 1,
-0.4636526, -1.369258, -2.304796, 0.07450981, 1, 0, 1,
-0.4606415, 0.5107003, 0.4101182, 0.06666667, 1, 0, 1,
-0.4561319, 2.094722, 0.2159143, 0.0627451, 1, 0, 1,
-0.455654, 0.01641659, -2.086002, 0.05490196, 1, 0, 1,
-0.4545267, -1.201585, -2.723761, 0.05098039, 1, 0, 1,
-0.448531, -0.9493635, -4.546665, 0.04313726, 1, 0, 1,
-0.4483369, 0.7463973, 0.3204582, 0.03921569, 1, 0, 1,
-0.4482355, -1.216015, -3.270177, 0.03137255, 1, 0, 1,
-0.4382205, -0.121644, -3.264233, 0.02745098, 1, 0, 1,
-0.4375791, 0.2841139, -2.05939, 0.01960784, 1, 0, 1,
-0.4372706, -1.424447, -3.872339, 0.01568628, 1, 0, 1,
-0.4340234, -1.421357, -3.130556, 0.007843138, 1, 0, 1,
-0.433426, 0.486816, 1.436357, 0.003921569, 1, 0, 1,
-0.4176093, -1.227958, -2.165348, 0, 1, 0.003921569, 1,
-0.4145994, 0.8706648, -0.6177586, 0, 1, 0.01176471, 1,
-0.4144609, 0.4012773, 1.468607, 0, 1, 0.01568628, 1,
-0.4130099, -0.3024026, -2.858019, 0, 1, 0.02352941, 1,
-0.4094661, -0.3533983, -1.152053, 0, 1, 0.02745098, 1,
-0.4089212, -0.7952532, -3.158194, 0, 1, 0.03529412, 1,
-0.4085351, -1.266109, -2.280528, 0, 1, 0.03921569, 1,
-0.4032525, 0.7596983, -0.1498487, 0, 1, 0.04705882, 1,
-0.3986042, 0.7127252, -1.353248, 0, 1, 0.05098039, 1,
-0.3974452, 0.1642803, -0.5987836, 0, 1, 0.05882353, 1,
-0.3964083, -0.2599635, -2.186912, 0, 1, 0.0627451, 1,
-0.3938021, 0.3171208, 0.7408216, 0, 1, 0.07058824, 1,
-0.3876832, 1.994043, -0.6234962, 0, 1, 0.07450981, 1,
-0.3867613, 0.776961, -1.999327, 0, 1, 0.08235294, 1,
-0.3834601, -0.280421, -2.935545, 0, 1, 0.08627451, 1,
-0.3826541, -0.6889547, -2.946242, 0, 1, 0.09411765, 1,
-0.3817483, 0.9103948, 0.0138174, 0, 1, 0.1019608, 1,
-0.3810684, 0.2045796, -0.2696188, 0, 1, 0.1058824, 1,
-0.3775928, 0.6320571, -0.8496242, 0, 1, 0.1137255, 1,
-0.3760895, -1.741402, -2.88121, 0, 1, 0.1176471, 1,
-0.3728946, 0.2382651, -0.2414041, 0, 1, 0.1254902, 1,
-0.3674238, -1.190055, -3.987329, 0, 1, 0.1294118, 1,
-0.3673541, -0.228452, -0.4352194, 0, 1, 0.1372549, 1,
-0.3606504, -0.2374771, -3.364632, 0, 1, 0.1411765, 1,
-0.3592417, -0.1804293, -2.030701, 0, 1, 0.1490196, 1,
-0.3572365, 0.4099737, 0.03239519, 0, 1, 0.1529412, 1,
-0.3540332, 0.7930859, -1.327863, 0, 1, 0.1607843, 1,
-0.3511427, 0.8855643, 0.4438949, 0, 1, 0.1647059, 1,
-0.349287, 0.4800997, -0.54964, 0, 1, 0.172549, 1,
-0.3491426, -0.8050058, -2.449796, 0, 1, 0.1764706, 1,
-0.3479913, 0.8664306, -0.8245535, 0, 1, 0.1843137, 1,
-0.3455193, 0.3156786, -0.6294815, 0, 1, 0.1882353, 1,
-0.3445952, 0.8932338, -0.5336071, 0, 1, 0.1960784, 1,
-0.3410466, 1.247017, 0.3701732, 0, 1, 0.2039216, 1,
-0.3408723, -0.3875856, -1.43401, 0, 1, 0.2078431, 1,
-0.3406015, -1.422902, -4.160715, 0, 1, 0.2156863, 1,
-0.3404322, 0.627887, -2.000222, 0, 1, 0.2196078, 1,
-0.3391883, -1.694839, -3.41216, 0, 1, 0.227451, 1,
-0.3357768, -1.097742, -1.661137, 0, 1, 0.2313726, 1,
-0.3334287, -0.2129064, -2.056453, 0, 1, 0.2392157, 1,
-0.3311091, 0.4318169, -1.734376, 0, 1, 0.2431373, 1,
-0.3291763, 0.6014843, -0.3423566, 0, 1, 0.2509804, 1,
-0.3285177, -1.146017, -1.69304, 0, 1, 0.254902, 1,
-0.3281822, 0.127715, -0.5673401, 0, 1, 0.2627451, 1,
-0.3267914, 0.502017, -1.210866, 0, 1, 0.2666667, 1,
-0.3256793, 0.1145718, -1.422358, 0, 1, 0.2745098, 1,
-0.3253708, 0.1410318, -3.894141, 0, 1, 0.2784314, 1,
-0.3236958, -0.1725917, -0.9978108, 0, 1, 0.2862745, 1,
-0.3236506, 1.863883, 0.7108358, 0, 1, 0.2901961, 1,
-0.3207896, 0.3825695, -1.925816, 0, 1, 0.2980392, 1,
-0.3175441, -0.7906757, -1.234368, 0, 1, 0.3058824, 1,
-0.3171535, -1.141615, -4.108292, 0, 1, 0.3098039, 1,
-0.3156481, 0.8416945, -0.7262161, 0, 1, 0.3176471, 1,
-0.3151198, -1.446915, -3.157686, 0, 1, 0.3215686, 1,
-0.3144549, 0.1350848, -1.388005, 0, 1, 0.3294118, 1,
-0.3143536, -0.2057893, -2.19963, 0, 1, 0.3333333, 1,
-0.312073, -0.5741978, -1.270892, 0, 1, 0.3411765, 1,
-0.3103125, -0.7260302, -4.094162, 0, 1, 0.345098, 1,
-0.3085722, -0.1625729, 0.8674416, 0, 1, 0.3529412, 1,
-0.3057021, -0.2990278, -2.401695, 0, 1, 0.3568628, 1,
-0.3046917, 0.5008305, -0.8687196, 0, 1, 0.3647059, 1,
-0.2989023, -0.1953372, -0.9665613, 0, 1, 0.3686275, 1,
-0.2954249, 0.06173117, -0.5912864, 0, 1, 0.3764706, 1,
-0.2928999, -2.214202, -4.001904, 0, 1, 0.3803922, 1,
-0.2911595, 0.8526894, 0.2002142, 0, 1, 0.3882353, 1,
-0.2901473, 1.774929, -0.9187263, 0, 1, 0.3921569, 1,
-0.2885053, 1.93552, 0.2370797, 0, 1, 0.4, 1,
-0.2848112, 1.037102, -0.2910016, 0, 1, 0.4078431, 1,
-0.2841134, -0.0396141, -1.42629, 0, 1, 0.4117647, 1,
-0.2774936, -0.5753374, -3.448775, 0, 1, 0.4196078, 1,
-0.2757237, 1.392346, -0.5344652, 0, 1, 0.4235294, 1,
-0.2752174, 0.4641549, -0.4361533, 0, 1, 0.4313726, 1,
-0.2645876, -0.5762544, -3.228282, 0, 1, 0.4352941, 1,
-0.260378, -1.069859, -1.438171, 0, 1, 0.4431373, 1,
-0.2591535, -0.6705255, -2.190464, 0, 1, 0.4470588, 1,
-0.2586512, -0.1215943, -3.389823, 0, 1, 0.454902, 1,
-0.2574272, -0.4853831, -2.878877, 0, 1, 0.4588235, 1,
-0.2548017, 0.057985, -0.941646, 0, 1, 0.4666667, 1,
-0.2533344, 0.6084912, -0.4045056, 0, 1, 0.4705882, 1,
-0.2452266, 0.7367514, 1.363598, 0, 1, 0.4784314, 1,
-0.2426098, -1.251593, -2.083678, 0, 1, 0.4823529, 1,
-0.2370568, -0.5375699, -2.264848, 0, 1, 0.4901961, 1,
-0.2367594, 0.8728051, 0.3912946, 0, 1, 0.4941176, 1,
-0.2339671, -0.5530785, -0.7925035, 0, 1, 0.5019608, 1,
-0.2209275, 0.1316452, -1.393213, 0, 1, 0.509804, 1,
-0.2159668, 1.467047, -1.242086, 0, 1, 0.5137255, 1,
-0.2128943, 0.4446991, 0.3967579, 0, 1, 0.5215687, 1,
-0.2126886, -1.678128, -2.247223, 0, 1, 0.5254902, 1,
-0.2064571, -0.1392876, -2.737236, 0, 1, 0.5333334, 1,
-0.2057379, 0.5238011, 0.8700981, 0, 1, 0.5372549, 1,
-0.200635, -1.388532, -0.4850481, 0, 1, 0.5450981, 1,
-0.1993267, -1.010958, -3.471939, 0, 1, 0.5490196, 1,
-0.1978149, -0.1868525, -2.18259, 0, 1, 0.5568628, 1,
-0.1972243, 1.066237, 1.930655, 0, 1, 0.5607843, 1,
-0.1953459, 0.5163864, -1.804893, 0, 1, 0.5686275, 1,
-0.1945077, -1.973409, -2.827259, 0, 1, 0.572549, 1,
-0.1929658, 1.763129, -0.9078732, 0, 1, 0.5803922, 1,
-0.1903381, -0.0007416374, -0.7653839, 0, 1, 0.5843138, 1,
-0.1883895, -0.01844672, -2.396279, 0, 1, 0.5921569, 1,
-0.1882014, 0.3254369, -1.613275, 0, 1, 0.5960785, 1,
-0.184399, 0.339508, 1.251545, 0, 1, 0.6039216, 1,
-0.1821591, -0.5808427, -3.106762, 0, 1, 0.6117647, 1,
-0.1775951, -2.665789, -3.6322, 0, 1, 0.6156863, 1,
-0.1751103, -0.5830751, -3.835618, 0, 1, 0.6235294, 1,
-0.1740643, -1.499818, -3.318952, 0, 1, 0.627451, 1,
-0.1714217, 1.297337, 0.2120197, 0, 1, 0.6352941, 1,
-0.1665411, -0.2189351, -4.366353, 0, 1, 0.6392157, 1,
-0.1624319, -1.409348, -2.711945, 0, 1, 0.6470588, 1,
-0.1622459, -0.3173439, -2.771217, 0, 1, 0.6509804, 1,
-0.1597154, 1.288667, -0.935909, 0, 1, 0.6588235, 1,
-0.158691, -2.067051, -3.792196, 0, 1, 0.6627451, 1,
-0.1586052, -0.2055988, -1.715838, 0, 1, 0.6705883, 1,
-0.1581187, 1.785398, -0.5974525, 0, 1, 0.6745098, 1,
-0.1569228, 0.406848, -0.998323, 0, 1, 0.682353, 1,
-0.1534808, 0.8578894, -1.182064, 0, 1, 0.6862745, 1,
-0.1513926, -0.05531844, -1.566486, 0, 1, 0.6941177, 1,
-0.1491787, -0.1385653, -2.136709, 0, 1, 0.7019608, 1,
-0.1474289, 1.403258, 0.7576698, 0, 1, 0.7058824, 1,
-0.1447906, 0.7036301, 0.5543978, 0, 1, 0.7137255, 1,
-0.1412245, -0.9825321, -3.933959, 0, 1, 0.7176471, 1,
-0.1411076, -0.2500798, -2.883491, 0, 1, 0.7254902, 1,
-0.1406781, -1.035711, -2.447801, 0, 1, 0.7294118, 1,
-0.1334869, 0.8504969, -1.82771, 0, 1, 0.7372549, 1,
-0.1328798, -0.6847187, -3.776664, 0, 1, 0.7411765, 1,
-0.132705, -0.3088288, -2.342899, 0, 1, 0.7490196, 1,
-0.1287435, 2.003022, 1.815999, 0, 1, 0.7529412, 1,
-0.1227319, -0.09403555, -1.338703, 0, 1, 0.7607843, 1,
-0.1129501, -1.798611, -1.950379, 0, 1, 0.7647059, 1,
-0.1082949, -1.303268, -4.510983, 0, 1, 0.772549, 1,
-0.1078692, 0.5460913, 1.14288, 0, 1, 0.7764706, 1,
-0.1068636, -1.422752, -3.367597, 0, 1, 0.7843137, 1,
-0.1066321, -0.06243743, -2.603338, 0, 1, 0.7882353, 1,
-0.09699767, -1.430528, -4.730468, 0, 1, 0.7960784, 1,
-0.09422645, 0.4949287, -0.2001964, 0, 1, 0.8039216, 1,
-0.09243468, -1.608819, -2.181948, 0, 1, 0.8078431, 1,
-0.09144469, -1.145682, -4.250326, 0, 1, 0.8156863, 1,
-0.08977178, 0.2224092, 0.5835919, 0, 1, 0.8196079, 1,
-0.08506624, -0.3194245, -2.127439, 0, 1, 0.827451, 1,
-0.08450551, -1.130491, -1.481317, 0, 1, 0.8313726, 1,
-0.08379053, 0.3069254, -2.180524, 0, 1, 0.8392157, 1,
-0.08333969, -1.008169, -4.194483, 0, 1, 0.8431373, 1,
-0.08013078, 1.590601, 0.3406288, 0, 1, 0.8509804, 1,
-0.07817077, -1.31024, -3.156139, 0, 1, 0.854902, 1,
-0.07733707, -0.5920803, -2.0017, 0, 1, 0.8627451, 1,
-0.07313389, -0.05338465, -2.22688, 0, 1, 0.8666667, 1,
-0.06676397, 0.1009049, 0.3873063, 0, 1, 0.8745098, 1,
-0.0650562, 1.90907, -1.593078, 0, 1, 0.8784314, 1,
-0.05443995, -1.454738, -2.91263, 0, 1, 0.8862745, 1,
-0.05350095, -0.03105844, -2.703616, 0, 1, 0.8901961, 1,
-0.05212436, 1.105629, 1.397595, 0, 1, 0.8980392, 1,
-0.05191713, -1.003697, -3.005013, 0, 1, 0.9058824, 1,
-0.05121087, 0.3727081, 0.2211501, 0, 1, 0.9098039, 1,
-0.04570065, -0.1077964, -1.172858, 0, 1, 0.9176471, 1,
-0.04178825, 1.505672, 1.795492, 0, 1, 0.9215686, 1,
-0.04150539, -0.7654227, -2.623493, 0, 1, 0.9294118, 1,
-0.04110031, -0.9675912, -4.442784, 0, 1, 0.9333333, 1,
-0.03945772, -0.9916264, -2.33915, 0, 1, 0.9411765, 1,
-0.03774361, 0.05472471, -2.328997, 0, 1, 0.945098, 1,
-0.03477691, -0.03791527, -1.640506, 0, 1, 0.9529412, 1,
-0.03198826, 1.615685, -2.233548, 0, 1, 0.9568627, 1,
-0.02787041, 2.026524, 1.311412, 0, 1, 0.9647059, 1,
-0.0271643, -0.5375867, -2.650204, 0, 1, 0.9686275, 1,
-0.02292159, 0.2144924, 0.2609794, 0, 1, 0.9764706, 1,
-0.02105562, -0.6737318, -1.467532, 0, 1, 0.9803922, 1,
-0.01948049, -0.4558241, -2.926152, 0, 1, 0.9882353, 1,
-0.01573127, 0.3258459, 0.6248663, 0, 1, 0.9921569, 1,
-0.01291576, -0.3734983, -2.83277, 0, 1, 1, 1,
-0.008523438, 1.326516, 0.5800104, 0, 0.9921569, 1, 1,
-0.007445264, -1.487663, -5.60497, 0, 0.9882353, 1, 1,
-0.006279789, 1.356999, 1.271494, 0, 0.9803922, 1, 1,
-0.003443228, 0.6054668, -0.2379414, 0, 0.9764706, 1, 1,
-0.001466212, 0.7509655, -1.770447, 0, 0.9686275, 1, 1,
-0.0004047663, 0.1361339, 2.315598, 0, 0.9647059, 1, 1,
0.002744888, -0.5691324, 2.920256, 0, 0.9568627, 1, 1,
0.007203291, 1.386128, 0.4669645, 0, 0.9529412, 1, 1,
0.00836339, -1.650215, 4.495482, 0, 0.945098, 1, 1,
0.01121875, -0.5959615, 3.065037, 0, 0.9411765, 1, 1,
0.0122603, -2.226926, 3.775203, 0, 0.9333333, 1, 1,
0.01240654, -0.7110557, 3.140174, 0, 0.9294118, 1, 1,
0.01400323, -0.2223372, 1.937636, 0, 0.9215686, 1, 1,
0.015376, 1.253339, -0.4045347, 0, 0.9176471, 1, 1,
0.01560997, -0.09710775, 4.39848, 0, 0.9098039, 1, 1,
0.02414147, 0.8813503, -1.100281, 0, 0.9058824, 1, 1,
0.02978612, -0.1568054, 3.00076, 0, 0.8980392, 1, 1,
0.03281315, -0.7519954, 4.105158, 0, 0.8901961, 1, 1,
0.03590534, 0.2269613, 1.771238, 0, 0.8862745, 1, 1,
0.03737565, 1.067607, 0.8118302, 0, 0.8784314, 1, 1,
0.04559655, -0.5865731, 3.548507, 0, 0.8745098, 1, 1,
0.04826101, 1.449468, 0.4327376, 0, 0.8666667, 1, 1,
0.06139781, 0.07776942, 0.6207821, 0, 0.8627451, 1, 1,
0.06222802, -0.7391939, 3.097543, 0, 0.854902, 1, 1,
0.06390971, -0.4096483, 3.353115, 0, 0.8509804, 1, 1,
0.06815246, 0.5723242, 0.5957126, 0, 0.8431373, 1, 1,
0.07672311, 0.2018698, 1.322716, 0, 0.8392157, 1, 1,
0.0775337, -1.868649, 2.797604, 0, 0.8313726, 1, 1,
0.08072083, -1.531511, 4.723233, 0, 0.827451, 1, 1,
0.08217706, 0.9899357, -0.8342725, 0, 0.8196079, 1, 1,
0.0834166, -0.5327414, 3.277053, 0, 0.8156863, 1, 1,
0.08540068, 0.3901308, -0.04819511, 0, 0.8078431, 1, 1,
0.0968438, 1.185368, -0.7873328, 0, 0.8039216, 1, 1,
0.09932977, 0.3298412, 0.5506083, 0, 0.7960784, 1, 1,
0.1015823, 0.5232837, 0.1949539, 0, 0.7882353, 1, 1,
0.1086179, -0.387127, 2.024516, 0, 0.7843137, 1, 1,
0.1097697, -0.9056479, 4.435813, 0, 0.7764706, 1, 1,
0.1100888, 0.05943611, 1.761773, 0, 0.772549, 1, 1,
0.1137249, 0.5490925, 0.2191177, 0, 0.7647059, 1, 1,
0.1142336, 1.542184, 0.2293788, 0, 0.7607843, 1, 1,
0.1175472, 1.977636, -1.047118, 0, 0.7529412, 1, 1,
0.1205329, 0.1357812, -0.2780087, 0, 0.7490196, 1, 1,
0.1212766, -0.6564203, 6.390653, 0, 0.7411765, 1, 1,
0.1229161, -0.4863519, 3.464334, 0, 0.7372549, 1, 1,
0.1234554, -1.795029, 2.132171, 0, 0.7294118, 1, 1,
0.1263401, -0.7379009, 2.21508, 0, 0.7254902, 1, 1,
0.1280127, -1.89663, 1.860332, 0, 0.7176471, 1, 1,
0.1295193, 0.6468864, -0.4413204, 0, 0.7137255, 1, 1,
0.1336623, -1.0509, 3.629978, 0, 0.7058824, 1, 1,
0.1336971, 1.526697, -1.259585, 0, 0.6980392, 1, 1,
0.1361496, -0.06531168, 1.811211, 0, 0.6941177, 1, 1,
0.1409406, -1.070905, 1.696478, 0, 0.6862745, 1, 1,
0.1480204, 0.2882484, 0.8155153, 0, 0.682353, 1, 1,
0.1495683, 0.5608522, -0.7505118, 0, 0.6745098, 1, 1,
0.1508723, 1.880546, 0.5505672, 0, 0.6705883, 1, 1,
0.1518388, -0.3487768, 4.190618, 0, 0.6627451, 1, 1,
0.1520035, -0.7776524, 2.350298, 0, 0.6588235, 1, 1,
0.1527106, -0.1051729, 3.148441, 0, 0.6509804, 1, 1,
0.1539517, 1.926124, 0.1903931, 0, 0.6470588, 1, 1,
0.1573478, -0.4919654, 2.061343, 0, 0.6392157, 1, 1,
0.160514, -0.132147, 3.398955, 0, 0.6352941, 1, 1,
0.1612016, -0.1565735, 1.983621, 0, 0.627451, 1, 1,
0.1624494, -0.2949637, 2.625713, 0, 0.6235294, 1, 1,
0.1627894, -0.6628749, 4.599723, 0, 0.6156863, 1, 1,
0.1649958, -1.195374, 1.605692, 0, 0.6117647, 1, 1,
0.169188, -1.842855, 2.087688, 0, 0.6039216, 1, 1,
0.1772859, -1.685512, 2.275726, 0, 0.5960785, 1, 1,
0.1782012, 1.018148, 0.8141711, 0, 0.5921569, 1, 1,
0.1832792, -0.03163397, 1.138608, 0, 0.5843138, 1, 1,
0.1906045, 0.4930328, -0.4503141, 0, 0.5803922, 1, 1,
0.1940372, -0.5919459, 3.781825, 0, 0.572549, 1, 1,
0.1969158, 0.1144771, 0.1011755, 0, 0.5686275, 1, 1,
0.199445, -0.638891, 2.693417, 0, 0.5607843, 1, 1,
0.1999879, 0.6958272, -0.8884538, 0, 0.5568628, 1, 1,
0.2083623, 0.6582785, 0.6881852, 0, 0.5490196, 1, 1,
0.2132769, -0.1228254, 0.8916126, 0, 0.5450981, 1, 1,
0.2147576, -0.1727035, 1.719732, 0, 0.5372549, 1, 1,
0.2149069, 1.000139, 2.311418, 0, 0.5333334, 1, 1,
0.2208405, -0.3597884, 1.888801, 0, 0.5254902, 1, 1,
0.2224215, -2.669542, 2.653291, 0, 0.5215687, 1, 1,
0.2234641, -0.8446814, 2.649941, 0, 0.5137255, 1, 1,
0.2235651, 0.2833153, 0.7749661, 0, 0.509804, 1, 1,
0.2256002, 0.4988941, 0.189391, 0, 0.5019608, 1, 1,
0.2262502, -0.4804973, 3.076805, 0, 0.4941176, 1, 1,
0.226454, 1.198034, 0.9010517, 0, 0.4901961, 1, 1,
0.2296937, 0.8468261, 0.9081087, 0, 0.4823529, 1, 1,
0.2297474, -1.226885, 3.262805, 0, 0.4784314, 1, 1,
0.2299518, 0.2591694, 0.7866184, 0, 0.4705882, 1, 1,
0.2303275, 0.7765294, 0.8701081, 0, 0.4666667, 1, 1,
0.2375213, -1.052954, 1.558978, 0, 0.4588235, 1, 1,
0.237709, 1.11607, -0.9071429, 0, 0.454902, 1, 1,
0.238753, -1.30158, 1.822954, 0, 0.4470588, 1, 1,
0.2388965, 0.9756667, 0.2200773, 0, 0.4431373, 1, 1,
0.2408957, -0.3984126, 3.670659, 0, 0.4352941, 1, 1,
0.2520268, 0.6324487, -0.09205005, 0, 0.4313726, 1, 1,
0.255828, 0.17138, 0.4998385, 0, 0.4235294, 1, 1,
0.2577689, 1.080788, 0.1831468, 0, 0.4196078, 1, 1,
0.2607015, 1.129757, 0.6675909, 0, 0.4117647, 1, 1,
0.2636071, -1.385204, 3.971549, 0, 0.4078431, 1, 1,
0.2644365, -0.1265711, 2.391308, 0, 0.4, 1, 1,
0.2650378, 0.1164881, 2.80787, 0, 0.3921569, 1, 1,
0.267284, 1.272617, 0.339008, 0, 0.3882353, 1, 1,
0.26847, -1.147533, 3.664565, 0, 0.3803922, 1, 1,
0.2715153, -1.823367, 3.790129, 0, 0.3764706, 1, 1,
0.2721265, -1.692576, 4.840582, 0, 0.3686275, 1, 1,
0.273384, -0.5364193, 3.788049, 0, 0.3647059, 1, 1,
0.2741068, -2.298008, 1.935635, 0, 0.3568628, 1, 1,
0.2748012, -0.1278792, 3.720953, 0, 0.3529412, 1, 1,
0.2820889, -1.213391, 1.992992, 0, 0.345098, 1, 1,
0.2853461, 1.047135, 1.289, 0, 0.3411765, 1, 1,
0.2853695, 0.4375531, -0.3595552, 0, 0.3333333, 1, 1,
0.288811, 0.8994629, 0.4700509, 0, 0.3294118, 1, 1,
0.2924313, 0.001757571, 0.4484297, 0, 0.3215686, 1, 1,
0.2943822, 0.1099226, 0.4669955, 0, 0.3176471, 1, 1,
0.2961267, 0.06071292, 1.874471, 0, 0.3098039, 1, 1,
0.3087172, -0.6955132, 3.664024, 0, 0.3058824, 1, 1,
0.3105416, 0.6460444, -0.02302852, 0, 0.2980392, 1, 1,
0.312547, 1.25902, -0.4034571, 0, 0.2901961, 1, 1,
0.3136936, -2.369109, 3.658229, 0, 0.2862745, 1, 1,
0.3138361, -0.6096482, 2.297615, 0, 0.2784314, 1, 1,
0.3169642, -1.739528, 2.149554, 0, 0.2745098, 1, 1,
0.3234812, 1.061192, -0.2138944, 0, 0.2666667, 1, 1,
0.3281765, -0.1520553, 3.055831, 0, 0.2627451, 1, 1,
0.3318143, -1.624386, 2.161601, 0, 0.254902, 1, 1,
0.3340393, -0.5971383, 3.746452, 0, 0.2509804, 1, 1,
0.3356595, -0.04568844, 1.295588, 0, 0.2431373, 1, 1,
0.3358307, 0.6614291, 0.6288242, 0, 0.2392157, 1, 1,
0.3371911, 0.3877476, 0.5491108, 0, 0.2313726, 1, 1,
0.3446634, 0.5863131, 0.6367317, 0, 0.227451, 1, 1,
0.3468404, 0.2756923, 0.5876012, 0, 0.2196078, 1, 1,
0.3482432, -0.1447961, 0.4528273, 0, 0.2156863, 1, 1,
0.3488058, -0.316414, 1.626607, 0, 0.2078431, 1, 1,
0.3510971, -0.2616507, 1.393182, 0, 0.2039216, 1, 1,
0.3520169, 0.7479304, 1.521031, 0, 0.1960784, 1, 1,
0.3539983, -0.1963196, 1.868768, 0, 0.1882353, 1, 1,
0.3548931, -0.02047058, 3.084113, 0, 0.1843137, 1, 1,
0.3565623, 1.758893, 0.4724025, 0, 0.1764706, 1, 1,
0.3590249, -0.05958081, 0.2185073, 0, 0.172549, 1, 1,
0.3687913, 1.146623, 0.3822701, 0, 0.1647059, 1, 1,
0.3714329, -1.401125, 3.202846, 0, 0.1607843, 1, 1,
0.3899264, -0.9565218, 2.057539, 0, 0.1529412, 1, 1,
0.3901923, -0.4031321, 1.66951, 0, 0.1490196, 1, 1,
0.3924385, 2.315018, 0.5409269, 0, 0.1411765, 1, 1,
0.3937408, 0.6825218, 0.7005825, 0, 0.1372549, 1, 1,
0.394306, 1.234061, 0.8034291, 0, 0.1294118, 1, 1,
0.3955928, 0.9996906, -0.2509882, 0, 0.1254902, 1, 1,
0.397859, 0.7489719, 1.281219, 0, 0.1176471, 1, 1,
0.3988503, -0.2656842, 2.44356, 0, 0.1137255, 1, 1,
0.4024945, -0.6889905, 1.705877, 0, 0.1058824, 1, 1,
0.4050892, 2.770643, -1.207233, 0, 0.09803922, 1, 1,
0.4055104, -1.628592, 3.262434, 0, 0.09411765, 1, 1,
0.4076893, -0.2790713, 1.774076, 0, 0.08627451, 1, 1,
0.4124155, -0.1312376, 2.279572, 0, 0.08235294, 1, 1,
0.413008, -0.1086127, 2.037775, 0, 0.07450981, 1, 1,
0.413609, -0.4999611, 3.429456, 0, 0.07058824, 1, 1,
0.4215419, 0.6274066, 1.247022, 0, 0.0627451, 1, 1,
0.4262008, 0.1089984, 0.5898175, 0, 0.05882353, 1, 1,
0.4297929, 0.9183769, 2.346183, 0, 0.05098039, 1, 1,
0.4332941, -1.379659, 3.935169, 0, 0.04705882, 1, 1,
0.4473632, 1.377984, -1.838599, 0, 0.03921569, 1, 1,
0.4498918, 0.0481586, 2.4133, 0, 0.03529412, 1, 1,
0.4540503, 0.3240051, 0.4412783, 0, 0.02745098, 1, 1,
0.4540682, -2.192578, 4.034646, 0, 0.02352941, 1, 1,
0.4540798, 0.1294278, 0.6775422, 0, 0.01568628, 1, 1,
0.4557502, 1.065276, 0.7264098, 0, 0.01176471, 1, 1,
0.4592521, 0.7742416, 0.5878968, 0, 0.003921569, 1, 1,
0.460847, -0.001130736, 2.134997, 0.003921569, 0, 1, 1,
0.4622183, -0.5889161, 1.947645, 0.007843138, 0, 1, 1,
0.4637589, 0.4470748, -1.324142, 0.01568628, 0, 1, 1,
0.466378, 0.4399822, 0.1451744, 0.01960784, 0, 1, 1,
0.466466, 0.7707835, 0.7199074, 0.02745098, 0, 1, 1,
0.467409, 1.393288, 1.263273, 0.03137255, 0, 1, 1,
0.4756884, 0.6814163, 1.835359, 0.03921569, 0, 1, 1,
0.4758093, 1.306158, 0.2814929, 0.04313726, 0, 1, 1,
0.4762524, -1.301385, 4.175607, 0.05098039, 0, 1, 1,
0.4768939, -0.6695591, 0.9177164, 0.05490196, 0, 1, 1,
0.480406, 0.5852364, -0.2079003, 0.0627451, 0, 1, 1,
0.4821225, -1.990679, 3.778273, 0.06666667, 0, 1, 1,
0.4840437, 1.144668, -0.2806604, 0.07450981, 0, 1, 1,
0.4884458, 0.1087105, 2.084601, 0.07843138, 0, 1, 1,
0.4886391, -0.8043086, 1.407158, 0.08627451, 0, 1, 1,
0.4922533, 0.7351314, 0.9221987, 0.09019608, 0, 1, 1,
0.49775, -2.315686, 4.209606, 0.09803922, 0, 1, 1,
0.4997764, -2.54975, 2.73843, 0.1058824, 0, 1, 1,
0.5032079, 0.8273771, 0.7215459, 0.1098039, 0, 1, 1,
0.5063833, -1.926348, 1.529729, 0.1176471, 0, 1, 1,
0.5104194, 0.2187711, 2.297384, 0.1215686, 0, 1, 1,
0.5126063, 2.785477, 1.264494, 0.1294118, 0, 1, 1,
0.5127247, 1.873761, -1.099866, 0.1333333, 0, 1, 1,
0.5134379, 0.7154872, 1.784443, 0.1411765, 0, 1, 1,
0.5152403, 1.534126, 1.235347, 0.145098, 0, 1, 1,
0.5189177, -3.041356, 4.646332, 0.1529412, 0, 1, 1,
0.5226963, 0.5206715, 1.809297, 0.1568628, 0, 1, 1,
0.5285128, 1.348347, 1.558958, 0.1647059, 0, 1, 1,
0.5294893, 0.1626803, 1.471313, 0.1686275, 0, 1, 1,
0.5299519, 0.7188997, 0.2017277, 0.1764706, 0, 1, 1,
0.5350128, 0.7061002, 0.6675553, 0.1803922, 0, 1, 1,
0.5362614, 0.5216485, 1.095541, 0.1882353, 0, 1, 1,
0.5371447, 0.7266384, -0.6374629, 0.1921569, 0, 1, 1,
0.5375739, -1.08088, 1.850218, 0.2, 0, 1, 1,
0.5398571, 0.5529906, 1.323712, 0.2078431, 0, 1, 1,
0.5409506, 0.8781351, 0.5076412, 0.2117647, 0, 1, 1,
0.5429691, 0.01233689, -0.4868135, 0.2196078, 0, 1, 1,
0.5432753, 0.8208442, 0.2286883, 0.2235294, 0, 1, 1,
0.5492678, 0.9590309, -0.3352035, 0.2313726, 0, 1, 1,
0.5536929, -0.412939, 1.359, 0.2352941, 0, 1, 1,
0.5568827, 0.1373977, 0.4867512, 0.2431373, 0, 1, 1,
0.5574405, -0.08390763, 1.282471, 0.2470588, 0, 1, 1,
0.5579923, -0.2785385, 2.44643, 0.254902, 0, 1, 1,
0.5610267, 1.523433, -0.7664778, 0.2588235, 0, 1, 1,
0.5626342, 0.2784727, 0.6239448, 0.2666667, 0, 1, 1,
0.5691475, 0.8863612, 0.8374992, 0.2705882, 0, 1, 1,
0.57791, 0.8949025, 2.747967, 0.2784314, 0, 1, 1,
0.5791727, -1.245844, 2.684863, 0.282353, 0, 1, 1,
0.5848576, 0.001996059, 0.8373771, 0.2901961, 0, 1, 1,
0.5859525, 0.9926186, 0.4744362, 0.2941177, 0, 1, 1,
0.5871021, -0.5985063, 1.589007, 0.3019608, 0, 1, 1,
0.5903719, 0.7168038, 0.03421405, 0.3098039, 0, 1, 1,
0.5927162, 0.09633191, 1.814743, 0.3137255, 0, 1, 1,
0.5938256, 0.006675072, 2.316763, 0.3215686, 0, 1, 1,
0.5939785, 0.1017786, 1.323185, 0.3254902, 0, 1, 1,
0.5973708, 0.2315561, 1.122739, 0.3333333, 0, 1, 1,
0.5978265, 1.362117, 0.2148565, 0.3372549, 0, 1, 1,
0.6014906, -0.008863312, 1.430346, 0.345098, 0, 1, 1,
0.6055763, -0.07396688, 3.598655, 0.3490196, 0, 1, 1,
0.6059957, -0.6100627, 1.581979, 0.3568628, 0, 1, 1,
0.6086342, 2.089268, 1.184956, 0.3607843, 0, 1, 1,
0.6104946, -0.6146712, 2.182111, 0.3686275, 0, 1, 1,
0.6111267, -0.3101375, 2.752096, 0.372549, 0, 1, 1,
0.6118079, -0.371876, -0.1393113, 0.3803922, 0, 1, 1,
0.6152277, -0.5223041, 0.01838157, 0.3843137, 0, 1, 1,
0.6161798, 0.8323421, -0.1832033, 0.3921569, 0, 1, 1,
0.6186356, -1.635245, 3.689014, 0.3960784, 0, 1, 1,
0.6187066, -0.7674097, 0.775051, 0.4039216, 0, 1, 1,
0.630536, -0.6438187, 2.524112, 0.4117647, 0, 1, 1,
0.6336499, -0.9594452, 3.733674, 0.4156863, 0, 1, 1,
0.6344319, -0.1876553, 3.097234, 0.4235294, 0, 1, 1,
0.6365576, -0.1291171, 2.302359, 0.427451, 0, 1, 1,
0.6400647, -0.3721968, 1.788462, 0.4352941, 0, 1, 1,
0.6414225, -2.20278, 3.244005, 0.4392157, 0, 1, 1,
0.6430904, -0.1328238, 1.400723, 0.4470588, 0, 1, 1,
0.6433165, 0.5553243, 0.3617447, 0.4509804, 0, 1, 1,
0.6468681, 0.2328931, 0.8620735, 0.4588235, 0, 1, 1,
0.6521707, 0.5437993, 0.08615181, 0.4627451, 0, 1, 1,
0.6529336, 0.2296611, 2.810633, 0.4705882, 0, 1, 1,
0.6557577, -0.2788862, 2.130703, 0.4745098, 0, 1, 1,
0.6561973, -1.290903, 1.698406, 0.4823529, 0, 1, 1,
0.6659718, -1.044519, 3.353915, 0.4862745, 0, 1, 1,
0.6687036, -1.213865, 2.948049, 0.4941176, 0, 1, 1,
0.6699365, -1.486735, 0.7520638, 0.5019608, 0, 1, 1,
0.6705547, 0.02709112, 2.362976, 0.5058824, 0, 1, 1,
0.673373, 0.4430157, 0.6292408, 0.5137255, 0, 1, 1,
0.6783031, 0.8506857, 1.939725, 0.5176471, 0, 1, 1,
0.6835122, -0.2205974, 3.191863, 0.5254902, 0, 1, 1,
0.6862733, -1.4741, 2.588618, 0.5294118, 0, 1, 1,
0.6881256, -0.6075856, 0.1083224, 0.5372549, 0, 1, 1,
0.6913218, 0.2588121, 0.8091463, 0.5411765, 0, 1, 1,
0.6931599, 0.2452818, 1.200427, 0.5490196, 0, 1, 1,
0.6938361, -0.8628746, 2.046718, 0.5529412, 0, 1, 1,
0.6944876, -1.578426, 1.740457, 0.5607843, 0, 1, 1,
0.6988061, -0.3435475, 1.012427, 0.5647059, 0, 1, 1,
0.6993031, -0.5953676, 3.104811, 0.572549, 0, 1, 1,
0.7039378, -0.298871, 1.346018, 0.5764706, 0, 1, 1,
0.7141912, 2.02446, 0.04278603, 0.5843138, 0, 1, 1,
0.7172649, -0.008611281, 0.8180034, 0.5882353, 0, 1, 1,
0.7189276, -1.535512, 2.45515, 0.5960785, 0, 1, 1,
0.7204397, 0.2596039, 1.717822, 0.6039216, 0, 1, 1,
0.723586, 1.199071, -1.182128, 0.6078432, 0, 1, 1,
0.7270394, -0.1351882, 0.9000021, 0.6156863, 0, 1, 1,
0.7283589, -0.7848779, 1.900737, 0.6196079, 0, 1, 1,
0.7330601, 1.087316, 1.202871, 0.627451, 0, 1, 1,
0.74023, 2.731274, -0.646746, 0.6313726, 0, 1, 1,
0.7438904, 0.2235678, 3.401159, 0.6392157, 0, 1, 1,
0.7466595, -0.6305478, 1.103916, 0.6431373, 0, 1, 1,
0.7618235, -1.186935, 2.880985, 0.6509804, 0, 1, 1,
0.7638944, -0.2445304, 1.752724, 0.654902, 0, 1, 1,
0.764791, 0.6139849, 0.2962131, 0.6627451, 0, 1, 1,
0.7717096, -0.3200852, 2.30184, 0.6666667, 0, 1, 1,
0.7734619, 0.3237105, 2.860069, 0.6745098, 0, 1, 1,
0.7746393, 0.477179, 0.6950742, 0.6784314, 0, 1, 1,
0.7756617, -1.447518, 2.381613, 0.6862745, 0, 1, 1,
0.7776265, -0.2757833, 0.3327423, 0.6901961, 0, 1, 1,
0.7814695, -0.7497341, 2.016447, 0.6980392, 0, 1, 1,
0.783296, 0.02000986, 3.151065, 0.7058824, 0, 1, 1,
0.7846681, 1.334779, 0.8933759, 0.7098039, 0, 1, 1,
0.7851263, 1.459379, -0.1250293, 0.7176471, 0, 1, 1,
0.7851511, 0.3011109, 0.7577908, 0.7215686, 0, 1, 1,
0.7863941, -0.2947757, 1.820927, 0.7294118, 0, 1, 1,
0.7916201, -0.02638524, 1.698639, 0.7333333, 0, 1, 1,
0.7958382, 0.7267265, 1.860898, 0.7411765, 0, 1, 1,
0.8019497, -0.01045188, 0.449656, 0.7450981, 0, 1, 1,
0.8021791, 0.116346, 1.683354, 0.7529412, 0, 1, 1,
0.8096615, -1.420054, 2.480536, 0.7568628, 0, 1, 1,
0.8180359, -0.4860282, 3.178999, 0.7647059, 0, 1, 1,
0.8211033, -0.7736056, 3.333928, 0.7686275, 0, 1, 1,
0.8263651, 1.162356, 0.5547083, 0.7764706, 0, 1, 1,
0.8341209, -2.194693, 1.998889, 0.7803922, 0, 1, 1,
0.8345211, 0.6375071, 0.8001575, 0.7882353, 0, 1, 1,
0.8365263, -0.337486, 1.222672, 0.7921569, 0, 1, 1,
0.8369353, -0.4373703, 2.817732, 0.8, 0, 1, 1,
0.8377695, 0.6171669, 2.082447, 0.8078431, 0, 1, 1,
0.8396699, -0.3709428, 1.493073, 0.8117647, 0, 1, 1,
0.8403282, 0.3686613, 2.367195, 0.8196079, 0, 1, 1,
0.8407047, 0.4062791, 1.392468, 0.8235294, 0, 1, 1,
0.8407292, 0.7957524, -0.4617131, 0.8313726, 0, 1, 1,
0.8422545, 0.3758441, -0.3815291, 0.8352941, 0, 1, 1,
0.8451424, -1.956386, 3.5807, 0.8431373, 0, 1, 1,
0.8469557, -0.9034278, 1.853653, 0.8470588, 0, 1, 1,
0.8567109, -0.4045688, 1.760714, 0.854902, 0, 1, 1,
0.8591304, -2.046785, 1.893158, 0.8588235, 0, 1, 1,
0.8614722, -2.793951, 2.647762, 0.8666667, 0, 1, 1,
0.8721892, -0.3614945, 0.584667, 0.8705882, 0, 1, 1,
0.8732952, 0.6089835, -0.4659546, 0.8784314, 0, 1, 1,
0.877115, -0.6598022, 1.964405, 0.8823529, 0, 1, 1,
0.8801816, 1.264364, 0.1865013, 0.8901961, 0, 1, 1,
0.8835325, -1.779263, 1.558389, 0.8941177, 0, 1, 1,
0.8871678, -0.2904459, 1.241737, 0.9019608, 0, 1, 1,
0.8878829, -1.847087, 1.755743, 0.9098039, 0, 1, 1,
0.8890542, 2.5243, 0.9196483, 0.9137255, 0, 1, 1,
0.8921832, -0.07448955, 1.373447, 0.9215686, 0, 1, 1,
0.8964396, -0.5399088, 0.8402815, 0.9254902, 0, 1, 1,
0.8981709, -0.5960152, 3.356544, 0.9333333, 0, 1, 1,
0.9065278, 0.6031271, 2.882319, 0.9372549, 0, 1, 1,
0.9128521, -0.08178737, 2.0378, 0.945098, 0, 1, 1,
0.9131361, 0.6251708, -1.343499, 0.9490196, 0, 1, 1,
0.9138475, -0.255534, 0.1159276, 0.9568627, 0, 1, 1,
0.9183038, 1.343548, 1.648813, 0.9607843, 0, 1, 1,
0.9221204, 2.24587, 0.9274941, 0.9686275, 0, 1, 1,
0.9223965, -0.7831847, 2.907957, 0.972549, 0, 1, 1,
0.9277202, 0.4890395, -0.1947656, 0.9803922, 0, 1, 1,
0.9355397, -0.6003664, 1.450338, 0.9843137, 0, 1, 1,
0.9372178, -0.6569732, 2.96684, 0.9921569, 0, 1, 1,
0.9384755, 0.1068649, 0.7294691, 0.9960784, 0, 1, 1,
0.9404611, 0.05058057, 1.03107, 1, 0, 0.9960784, 1,
0.9445325, -0.1933989, 1.925004, 1, 0, 0.9882353, 1,
0.9460899, 0.678782, -0.2306098, 1, 0, 0.9843137, 1,
0.9561679, -0.9173596, 3.591181, 1, 0, 0.9764706, 1,
0.9604806, 0.110822, 2.024312, 1, 0, 0.972549, 1,
0.9618818, -0.6334375, 1.835586, 1, 0, 0.9647059, 1,
0.9694012, -1.503704, 2.272097, 1, 0, 0.9607843, 1,
0.9705062, 0.7523974, 0.42595, 1, 0, 0.9529412, 1,
0.9719834, -1.248825, 3.02416, 1, 0, 0.9490196, 1,
0.982766, 0.1286562, 1.284354, 1, 0, 0.9411765, 1,
0.9971666, -0.9664224, 4.402162, 1, 0, 0.9372549, 1,
1.002654, -0.9993162, 2.040919, 1, 0, 0.9294118, 1,
1.003399, 1.932758, -0.1314904, 1, 0, 0.9254902, 1,
1.009585, -0.0204235, 2.295713, 1, 0, 0.9176471, 1,
1.018435, 0.3616996, 0.6227801, 1, 0, 0.9137255, 1,
1.018488, -1.6717, 2.001106, 1, 0, 0.9058824, 1,
1.025278, 0.239739, 0.6757073, 1, 0, 0.9019608, 1,
1.035521, -0.3746367, 3.473291, 1, 0, 0.8941177, 1,
1.051573, 0.5519903, 1.188208, 1, 0, 0.8862745, 1,
1.056571, -0.2788087, 1.585054, 1, 0, 0.8823529, 1,
1.061874, -0.1503261, 1.610809, 1, 0, 0.8745098, 1,
1.064531, 0.4235091, 0.2422317, 1, 0, 0.8705882, 1,
1.065971, -0.3035547, 0.1431065, 1, 0, 0.8627451, 1,
1.068103, 0.5559441, 0.5919386, 1, 0, 0.8588235, 1,
1.070186, -1.172296, 2.960192, 1, 0, 0.8509804, 1,
1.077825, 1.001948, 0.9705024, 1, 0, 0.8470588, 1,
1.09498, 0.5031106, 1.701926, 1, 0, 0.8392157, 1,
1.099148, -0.9508581, 1.800864, 1, 0, 0.8352941, 1,
1.103011, -1.845024, 4.219001, 1, 0, 0.827451, 1,
1.104005, 0.09641401, 2.40531, 1, 0, 0.8235294, 1,
1.105713, 0.005501283, 1.392381, 1, 0, 0.8156863, 1,
1.109468, 0.1712017, 0.01637845, 1, 0, 0.8117647, 1,
1.114351, -1.302512, 2.836111, 1, 0, 0.8039216, 1,
1.114618, 0.3473012, -0.3811634, 1, 0, 0.7960784, 1,
1.114879, 1.098614, 0.9466813, 1, 0, 0.7921569, 1,
1.117785, 0.267115, 1.460338, 1, 0, 0.7843137, 1,
1.12007, 0.5812343, 1.496848, 1, 0, 0.7803922, 1,
1.123658, -0.3856573, 1.644379, 1, 0, 0.772549, 1,
1.137664, -1.841521, 0.01556579, 1, 0, 0.7686275, 1,
1.158821, -0.8793182, 3.991817, 1, 0, 0.7607843, 1,
1.16453, -0.3326779, 1.197999, 1, 0, 0.7568628, 1,
1.175506, -0.6387796, 1.472613, 1, 0, 0.7490196, 1,
1.179284, 0.02404165, 0.04766288, 1, 0, 0.7450981, 1,
1.179826, -0.6647146, 2.925554, 1, 0, 0.7372549, 1,
1.184799, 0.8631694, 2.431695, 1, 0, 0.7333333, 1,
1.186439, 0.9139093, 2.149625, 1, 0, 0.7254902, 1,
1.19262, -0.3858179, 3.252962, 1, 0, 0.7215686, 1,
1.196568, 0.8809148, 0.2137174, 1, 0, 0.7137255, 1,
1.198222, 0.5296475, 1.154991, 1, 0, 0.7098039, 1,
1.203197, -0.892802, 3.208212, 1, 0, 0.7019608, 1,
1.214938, -1.363902, 1.560268, 1, 0, 0.6941177, 1,
1.222504, -0.4782819, 2.193551, 1, 0, 0.6901961, 1,
1.223759, 1.417761, 0.6423169, 1, 0, 0.682353, 1,
1.227725, 0.6124847, 0.4502492, 1, 0, 0.6784314, 1,
1.231965, -0.2877472, 2.285142, 1, 0, 0.6705883, 1,
1.237024, 1.802135, 1.65945, 1, 0, 0.6666667, 1,
1.242108, -0.9124931, 2.345235, 1, 0, 0.6588235, 1,
1.256597, -0.008832361, 2.114222, 1, 0, 0.654902, 1,
1.278537, 0.6834741, 1.304198, 1, 0, 0.6470588, 1,
1.279488, -0.3315699, 2.082057, 1, 0, 0.6431373, 1,
1.284275, -0.840404, 2.069831, 1, 0, 0.6352941, 1,
1.28519, -0.2600517, 1.510014, 1, 0, 0.6313726, 1,
1.285234, 0.2569227, 2.074564, 1, 0, 0.6235294, 1,
1.309284, -0.1697415, 1.610009, 1, 0, 0.6196079, 1,
1.309924, -1.140899, 1.119225, 1, 0, 0.6117647, 1,
1.313431, 0.3488499, 0.9824226, 1, 0, 0.6078432, 1,
1.31353, 0.03068372, 2.147063, 1, 0, 0.6, 1,
1.322904, 0.5861957, 0.3112057, 1, 0, 0.5921569, 1,
1.325909, 0.5920846, 1.064285, 1, 0, 0.5882353, 1,
1.328146, -0.4154252, 1.972084, 1, 0, 0.5803922, 1,
1.336795, -1.399737, 3.107914, 1, 0, 0.5764706, 1,
1.345296, -0.8469851, 2.829078, 1, 0, 0.5686275, 1,
1.358585, 0.8226339, 0.1283222, 1, 0, 0.5647059, 1,
1.360077, -0.2857388, 2.392824, 1, 0, 0.5568628, 1,
1.360386, 0.7285165, 1.300063, 1, 0, 0.5529412, 1,
1.37903, -1.003642, 2.93775, 1, 0, 0.5450981, 1,
1.394195, -1.305999, 2.697743, 1, 0, 0.5411765, 1,
1.395306, -0.1283443, 0.6725203, 1, 0, 0.5333334, 1,
1.411585, -0.8398044, 1.84305, 1, 0, 0.5294118, 1,
1.412105, -1.801782, 3.790461, 1, 0, 0.5215687, 1,
1.417524, -0.01657416, 1.962548, 1, 0, 0.5176471, 1,
1.424047, 0.2190619, 1.163265, 1, 0, 0.509804, 1,
1.430728, -0.06337342, -0.4127449, 1, 0, 0.5058824, 1,
1.44577, 0.2265329, 2.400555, 1, 0, 0.4980392, 1,
1.446119, 0.3003502, -0.5653542, 1, 0, 0.4901961, 1,
1.463801, 0.5626093, -0.3420833, 1, 0, 0.4862745, 1,
1.468375, 1.002743, 2.966696, 1, 0, 0.4784314, 1,
1.475639, -0.07614506, 1.837166, 1, 0, 0.4745098, 1,
1.47795, -0.838564, 1.506299, 1, 0, 0.4666667, 1,
1.4792, -0.1409355, 2.065427, 1, 0, 0.4627451, 1,
1.482824, -1.153949, 1.64085, 1, 0, 0.454902, 1,
1.488681, 0.4531579, -1.147478, 1, 0, 0.4509804, 1,
1.494263, 0.02603565, 0.0414947, 1, 0, 0.4431373, 1,
1.497194, -0.3163125, 2.147468, 1, 0, 0.4392157, 1,
1.516544, -0.4233122, 3.560585, 1, 0, 0.4313726, 1,
1.525343, -1.19826, 2.565645, 1, 0, 0.427451, 1,
1.531702, 0.4837564, 0.5407809, 1, 0, 0.4196078, 1,
1.538307, 1.142563, 0.8307141, 1, 0, 0.4156863, 1,
1.544061, -0.566669, 3.659707, 1, 0, 0.4078431, 1,
1.553273, 0.09252556, 1.626971, 1, 0, 0.4039216, 1,
1.580846, -0.2875314, 2.04528, 1, 0, 0.3960784, 1,
1.581162, -1.024695, 4.308583, 1, 0, 0.3882353, 1,
1.613237, -0.9570651, 0.7313744, 1, 0, 0.3843137, 1,
1.617777, -0.03841897, 2.937485, 1, 0, 0.3764706, 1,
1.624799, -0.8478745, 1.764376, 1, 0, 0.372549, 1,
1.626954, 1.268921, 1.063006, 1, 0, 0.3647059, 1,
1.639664, 1.744413, 1.944571, 1, 0, 0.3607843, 1,
1.643192, 0.08175363, 1.461415, 1, 0, 0.3529412, 1,
1.66907, -0.9620322, 1.860871, 1, 0, 0.3490196, 1,
1.671356, 1.034308, 0.7301335, 1, 0, 0.3411765, 1,
1.684792, 0.2052283, 1.85804, 1, 0, 0.3372549, 1,
1.69602, 1.073813, 3.07481, 1, 0, 0.3294118, 1,
1.698329, 0.6759695, 1.383316, 1, 0, 0.3254902, 1,
1.708779, -0.9883834, 3.015575, 1, 0, 0.3176471, 1,
1.748298, -1.908054, 1.712129, 1, 0, 0.3137255, 1,
1.749473, 0.1036476, 2.383248, 1, 0, 0.3058824, 1,
1.769839, 0.2748262, 1.097914, 1, 0, 0.2980392, 1,
1.777478, -0.1784586, 0.1550431, 1, 0, 0.2941177, 1,
1.802802, 0.4440449, 0.5307002, 1, 0, 0.2862745, 1,
1.815371, -0.6132908, 2.010891, 1, 0, 0.282353, 1,
1.835374, -0.7711768, 0.8781255, 1, 0, 0.2745098, 1,
1.851226, -0.3573788, 0.9574893, 1, 0, 0.2705882, 1,
1.853868, 1.04708, 1.046824, 1, 0, 0.2627451, 1,
1.856224, -0.4534198, 2.142398, 1, 0, 0.2588235, 1,
1.864598, 0.09257484, 1.929753, 1, 0, 0.2509804, 1,
1.876991, -0.1662651, 1.402315, 1, 0, 0.2470588, 1,
1.880763, 0.2593217, 3.133498, 1, 0, 0.2392157, 1,
1.893414, -1.783495, 3.362821, 1, 0, 0.2352941, 1,
1.901292, -0.3792202, 2.120014, 1, 0, 0.227451, 1,
1.929078, 0.6486453, 0.8465394, 1, 0, 0.2235294, 1,
1.938357, -0.09922591, 0.9227169, 1, 0, 0.2156863, 1,
1.939255, 0.3286876, -1.544555, 1, 0, 0.2117647, 1,
1.945463, 1.13838, 2.067936, 1, 0, 0.2039216, 1,
1.955586, -0.1880207, 1.419382, 1, 0, 0.1960784, 1,
1.96863, -0.007305828, 2.154081, 1, 0, 0.1921569, 1,
1.969577, -0.2139916, 2.41428, 1, 0, 0.1843137, 1,
1.98796, 1.515825, 0.9078579, 1, 0, 0.1803922, 1,
2.0002, -0.987469, 1.580192, 1, 0, 0.172549, 1,
2.013783, 1.548787, 3.331564, 1, 0, 0.1686275, 1,
2.06903, -0.9704701, 2.31539, 1, 0, 0.1607843, 1,
2.093246, 0.1668436, 3.503707, 1, 0, 0.1568628, 1,
2.107266, 0.1503286, 0.2942755, 1, 0, 0.1490196, 1,
2.109431, 0.4292758, 1.166796, 1, 0, 0.145098, 1,
2.13077, -0.4689057, 3.043833, 1, 0, 0.1372549, 1,
2.13628, 1.147815, 1.253958, 1, 0, 0.1333333, 1,
2.162673, -1.09258, 0.5694409, 1, 0, 0.1254902, 1,
2.175645, 0.9462962, 1.085819, 1, 0, 0.1215686, 1,
2.178725, -0.8407254, 1.81607, 1, 0, 0.1137255, 1,
2.192761, 0.4638274, 0.7182958, 1, 0, 0.1098039, 1,
2.249173, -0.1746258, 1.171976, 1, 0, 0.1019608, 1,
2.252435, 0.5444122, 2.010347, 1, 0, 0.09411765, 1,
2.257177, -0.6497458, 3.486567, 1, 0, 0.09019608, 1,
2.282966, 1.889012, 1.72718, 1, 0, 0.08235294, 1,
2.301443, -0.9659982, 2.533479, 1, 0, 0.07843138, 1,
2.342949, 1.115096, 0.9352369, 1, 0, 0.07058824, 1,
2.372773, 0.6848447, 2.281104, 1, 0, 0.06666667, 1,
2.418189, -1.560569, 1.865312, 1, 0, 0.05882353, 1,
2.463809, 0.2370892, -0.4599955, 1, 0, 0.05490196, 1,
2.465223, 0.6230994, 1.645193, 1, 0, 0.04705882, 1,
2.55738, -0.7450936, 0.9213735, 1, 0, 0.04313726, 1,
2.560472, 1.006135, 2.484619, 1, 0, 0.03529412, 1,
2.657596, 1.133465, 0.5783412, 1, 0, 0.03137255, 1,
2.683854, 0.5157693, -0.9474227, 1, 0, 0.02352941, 1,
2.780034, -0.3696615, 1.344009, 1, 0, 0.01960784, 1,
2.968239, -0.4163406, 0.5055079, 1, 0, 0.01176471, 1,
3.272285, 2.057841, 2.089481, 1, 0, 0.007843138, 1
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
0.1552368, -4.029004, -7.638228, 0, -0.5, 0.5, 0.5,
0.1552368, -4.029004, -7.638228, 1, -0.5, 0.5, 0.5,
0.1552368, -4.029004, -7.638228, 1, 1.5, 0.5, 0.5,
0.1552368, -4.029004, -7.638228, 0, 1.5, 0.5, 0.5
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
-4.018491, -0.1279396, -7.638228, 0, -0.5, 0.5, 0.5,
-4.018491, -0.1279396, -7.638228, 1, -0.5, 0.5, 0.5,
-4.018491, -0.1279396, -7.638228, 1, 1.5, 0.5, 0.5,
-4.018491, -0.1279396, -7.638228, 0, 1.5, 0.5, 0.5
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
-4.018491, -4.029004, 0.3928416, 0, -0.5, 0.5, 0.5,
-4.018491, -4.029004, 0.3928416, 1, -0.5, 0.5, 0.5,
-4.018491, -4.029004, 0.3928416, 1, 1.5, 0.5, 0.5,
-4.018491, -4.029004, 0.3928416, 0, 1.5, 0.5, 0.5
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
-2, -3.128759, -5.784904,
3, -3.128759, -5.784904,
-2, -3.128759, -5.784904,
-2, -3.2788, -6.093791,
-1, -3.128759, -5.784904,
-1, -3.2788, -6.093791,
0, -3.128759, -5.784904,
0, -3.2788, -6.093791,
1, -3.128759, -5.784904,
1, -3.2788, -6.093791,
2, -3.128759, -5.784904,
2, -3.2788, -6.093791,
3, -3.128759, -5.784904,
3, -3.2788, -6.093791
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
-2, -3.578882, -6.711566, 0, -0.5, 0.5, 0.5,
-2, -3.578882, -6.711566, 1, -0.5, 0.5, 0.5,
-2, -3.578882, -6.711566, 1, 1.5, 0.5, 0.5,
-2, -3.578882, -6.711566, 0, 1.5, 0.5, 0.5,
-1, -3.578882, -6.711566, 0, -0.5, 0.5, 0.5,
-1, -3.578882, -6.711566, 1, -0.5, 0.5, 0.5,
-1, -3.578882, -6.711566, 1, 1.5, 0.5, 0.5,
-1, -3.578882, -6.711566, 0, 1.5, 0.5, 0.5,
0, -3.578882, -6.711566, 0, -0.5, 0.5, 0.5,
0, -3.578882, -6.711566, 1, -0.5, 0.5, 0.5,
0, -3.578882, -6.711566, 1, 1.5, 0.5, 0.5,
0, -3.578882, -6.711566, 0, 1.5, 0.5, 0.5,
1, -3.578882, -6.711566, 0, -0.5, 0.5, 0.5,
1, -3.578882, -6.711566, 1, -0.5, 0.5, 0.5,
1, -3.578882, -6.711566, 1, 1.5, 0.5, 0.5,
1, -3.578882, -6.711566, 0, 1.5, 0.5, 0.5,
2, -3.578882, -6.711566, 0, -0.5, 0.5, 0.5,
2, -3.578882, -6.711566, 1, -0.5, 0.5, 0.5,
2, -3.578882, -6.711566, 1, 1.5, 0.5, 0.5,
2, -3.578882, -6.711566, 0, 1.5, 0.5, 0.5,
3, -3.578882, -6.711566, 0, -0.5, 0.5, 0.5,
3, -3.578882, -6.711566, 1, -0.5, 0.5, 0.5,
3, -3.578882, -6.711566, 1, 1.5, 0.5, 0.5,
3, -3.578882, -6.711566, 0, 1.5, 0.5, 0.5
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
-3.055323, -3, -5.784904,
-3.055323, 2, -5.784904,
-3.055323, -3, -5.784904,
-3.215851, -3, -6.093791,
-3.055323, -2, -5.784904,
-3.215851, -2, -6.093791,
-3.055323, -1, -5.784904,
-3.215851, -1, -6.093791,
-3.055323, 0, -5.784904,
-3.215851, 0, -6.093791,
-3.055323, 1, -5.784904,
-3.215851, 1, -6.093791,
-3.055323, 2, -5.784904,
-3.215851, 2, -6.093791
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
-3.536907, -3, -6.711566, 0, -0.5, 0.5, 0.5,
-3.536907, -3, -6.711566, 1, -0.5, 0.5, 0.5,
-3.536907, -3, -6.711566, 1, 1.5, 0.5, 0.5,
-3.536907, -3, -6.711566, 0, 1.5, 0.5, 0.5,
-3.536907, -2, -6.711566, 0, -0.5, 0.5, 0.5,
-3.536907, -2, -6.711566, 1, -0.5, 0.5, 0.5,
-3.536907, -2, -6.711566, 1, 1.5, 0.5, 0.5,
-3.536907, -2, -6.711566, 0, 1.5, 0.5, 0.5,
-3.536907, -1, -6.711566, 0, -0.5, 0.5, 0.5,
-3.536907, -1, -6.711566, 1, -0.5, 0.5, 0.5,
-3.536907, -1, -6.711566, 1, 1.5, 0.5, 0.5,
-3.536907, -1, -6.711566, 0, 1.5, 0.5, 0.5,
-3.536907, 0, -6.711566, 0, -0.5, 0.5, 0.5,
-3.536907, 0, -6.711566, 1, -0.5, 0.5, 0.5,
-3.536907, 0, -6.711566, 1, 1.5, 0.5, 0.5,
-3.536907, 0, -6.711566, 0, 1.5, 0.5, 0.5,
-3.536907, 1, -6.711566, 0, -0.5, 0.5, 0.5,
-3.536907, 1, -6.711566, 1, -0.5, 0.5, 0.5,
-3.536907, 1, -6.711566, 1, 1.5, 0.5, 0.5,
-3.536907, 1, -6.711566, 0, 1.5, 0.5, 0.5,
-3.536907, 2, -6.711566, 0, -0.5, 0.5, 0.5,
-3.536907, 2, -6.711566, 1, -0.5, 0.5, 0.5,
-3.536907, 2, -6.711566, 1, 1.5, 0.5, 0.5,
-3.536907, 2, -6.711566, 0, 1.5, 0.5, 0.5
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
-3.055323, -3.128759, -4,
-3.055323, -3.128759, 6,
-3.055323, -3.128759, -4,
-3.215851, -3.2788, -4,
-3.055323, -3.128759, -2,
-3.215851, -3.2788, -2,
-3.055323, -3.128759, 0,
-3.215851, -3.2788, 0,
-3.055323, -3.128759, 2,
-3.215851, -3.2788, 2,
-3.055323, -3.128759, 4,
-3.215851, -3.2788, 4,
-3.055323, -3.128759, 6,
-3.215851, -3.2788, 6
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
"4",
"6"
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
-3.536907, -3.578882, -4, 0, -0.5, 0.5, 0.5,
-3.536907, -3.578882, -4, 1, -0.5, 0.5, 0.5,
-3.536907, -3.578882, -4, 1, 1.5, 0.5, 0.5,
-3.536907, -3.578882, -4, 0, 1.5, 0.5, 0.5,
-3.536907, -3.578882, -2, 0, -0.5, 0.5, 0.5,
-3.536907, -3.578882, -2, 1, -0.5, 0.5, 0.5,
-3.536907, -3.578882, -2, 1, 1.5, 0.5, 0.5,
-3.536907, -3.578882, -2, 0, 1.5, 0.5, 0.5,
-3.536907, -3.578882, 0, 0, -0.5, 0.5, 0.5,
-3.536907, -3.578882, 0, 1, -0.5, 0.5, 0.5,
-3.536907, -3.578882, 0, 1, 1.5, 0.5, 0.5,
-3.536907, -3.578882, 0, 0, 1.5, 0.5, 0.5,
-3.536907, -3.578882, 2, 0, -0.5, 0.5, 0.5,
-3.536907, -3.578882, 2, 1, -0.5, 0.5, 0.5,
-3.536907, -3.578882, 2, 1, 1.5, 0.5, 0.5,
-3.536907, -3.578882, 2, 0, 1.5, 0.5, 0.5,
-3.536907, -3.578882, 4, 0, -0.5, 0.5, 0.5,
-3.536907, -3.578882, 4, 1, -0.5, 0.5, 0.5,
-3.536907, -3.578882, 4, 1, 1.5, 0.5, 0.5,
-3.536907, -3.578882, 4, 0, 1.5, 0.5, 0.5,
-3.536907, -3.578882, 6, 0, -0.5, 0.5, 0.5,
-3.536907, -3.578882, 6, 1, -0.5, 0.5, 0.5,
-3.536907, -3.578882, 6, 1, 1.5, 0.5, 0.5,
-3.536907, -3.578882, 6, 0, 1.5, 0.5, 0.5
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
-3.055323, -3.128759, -5.784904,
-3.055323, 2.87288, -5.784904,
-3.055323, -3.128759, 6.570588,
-3.055323, 2.87288, 6.570588,
-3.055323, -3.128759, -5.784904,
-3.055323, -3.128759, 6.570588,
-3.055323, 2.87288, -5.784904,
-3.055323, 2.87288, 6.570588,
-3.055323, -3.128759, -5.784904,
3.365797, -3.128759, -5.784904,
-3.055323, -3.128759, 6.570588,
3.365797, -3.128759, 6.570588,
-3.055323, 2.87288, -5.784904,
3.365797, 2.87288, -5.784904,
-3.055323, 2.87288, 6.570588,
3.365797, 2.87288, 6.570588,
3.365797, -3.128759, -5.784904,
3.365797, 2.87288, -5.784904,
3.365797, -3.128759, 6.570588,
3.365797, 2.87288, 6.570588,
3.365797, -3.128759, -5.784904,
3.365797, -3.128759, 6.570588,
3.365797, 2.87288, -5.784904,
3.365797, 2.87288, 6.570588
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
var radius = 8.096608;
var distance = 36.02272;
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
mvMatrix.translate( -0.1552368, 0.1279396, -0.3928416 );
mvMatrix.scale( 1.363346, 1.458637, 0.7085279 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.02272);
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
gl.drawArrays(gl.LINES, 0, 14);
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
gl.drawElements(gl.TRIANGLES, 36, gl.UNSIGNED_SHORT, 0);
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
sec-butylamine_2-ben<-read.table("sec-butylamine_2-ben.xyz")
```

```
## Error in read.table("sec-butylamine_2-ben.xyz"): no lines available in input
```

```r
x<-sec-butylamine_2-ben$V2
```

```
## Error in eval(expr, envir, enclos): object 'sec' not found
```

```r
y<-sec-butylamine_2-ben$V3
```

```
## Error in eval(expr, envir, enclos): object 'sec' not found
```

```r
z<-sec-butylamine_2-ben$V4
```

```
## Error in eval(expr, envir, enclos): object 'sec' not found
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
-2.961812, -0.6497554, -3.923283, 0, 0, 1, 1, 1,
-2.872604, 0.01711474, -0.9456847, 1, 0, 0, 1, 1,
-2.631238, 2.217472, -1.22853, 1, 0, 0, 1, 1,
-2.571701, 0.9973326, -2.826424, 1, 0, 0, 1, 1,
-2.464837, -0.9666687, -2.898107, 1, 0, 0, 1, 1,
-2.452922, -0.8713803, -1.623655, 1, 0, 0, 1, 1,
-2.450542, 1.136169, -0.5431104, 0, 0, 0, 1, 1,
-2.439178, -1.139033, -0.7677734, 0, 0, 0, 1, 1,
-2.403956, 0.6427165, -2.689115, 0, 0, 0, 1, 1,
-2.384321, -2.2724, -3.688309, 0, 0, 0, 1, 1,
-2.36907, -0.9972574, -1.797377, 0, 0, 0, 1, 1,
-2.368142, 1.118355, -0.9673021, 0, 0, 0, 1, 1,
-2.356317, -0.1365005, -1.77784, 0, 0, 0, 1, 1,
-2.325106, -0.4252181, -2.259686, 1, 1, 1, 1, 1,
-2.287937, -0.1232414, -2.937675, 1, 1, 1, 1, 1,
-2.163574, 0.4075518, 0.9634439, 1, 1, 1, 1, 1,
-2.159413, 0.899372, -2.796929, 1, 1, 1, 1, 1,
-2.156936, -0.771935, -2.862867, 1, 1, 1, 1, 1,
-2.1472, -0.511437, -0.8685655, 1, 1, 1, 1, 1,
-2.144469, 0.4418385, -2.512721, 1, 1, 1, 1, 1,
-2.119245, 0.4479498, -1.280915, 1, 1, 1, 1, 1,
-2.099225, 1.771996, 1.695991, 1, 1, 1, 1, 1,
-2.094182, 0.2308118, -2.902904, 1, 1, 1, 1, 1,
-2.08446, 0.7113481, -0.2570645, 1, 1, 1, 1, 1,
-2.084099, -0.3648042, -2.643545, 1, 1, 1, 1, 1,
-2.033221, -0.552525, -2.247798, 1, 1, 1, 1, 1,
-2.003062, -0.9331254, -1.291935, 1, 1, 1, 1, 1,
-1.990416, 0.4262881, -0.9247166, 1, 1, 1, 1, 1,
-1.939913, -0.1041722, -1.069887, 0, 0, 1, 1, 1,
-1.927326, 0.8542511, -1.634794, 1, 0, 0, 1, 1,
-1.914246, -0.1312097, -2.09452, 1, 0, 0, 1, 1,
-1.91024, -0.3909153, -2.292953, 1, 0, 0, 1, 1,
-1.908023, -0.7733756, -1.085921, 1, 0, 0, 1, 1,
-1.907771, -0.1887389, -3.57604, 1, 0, 0, 1, 1,
-1.896173, -0.6008551, -1.716748, 0, 0, 0, 1, 1,
-1.876149, -0.6028425, -0.6771546, 0, 0, 0, 1, 1,
-1.870922, 0.5912268, -0.7492255, 0, 0, 0, 1, 1,
-1.862941, 0.1856976, -1.552385, 0, 0, 0, 1, 1,
-1.842948, 0.8407167, -2.202548, 0, 0, 0, 1, 1,
-1.836504, -0.05765244, -1.063072, 0, 0, 0, 1, 1,
-1.827923, 0.6290763, -0.8941244, 0, 0, 0, 1, 1,
-1.82741, -0.06829091, -1.621555, 1, 1, 1, 1, 1,
-1.808955, -0.3503447, 0.2999858, 1, 1, 1, 1, 1,
-1.781779, 1.140921, -0.5469584, 1, 1, 1, 1, 1,
-1.779967, -0.317714, -1.236849, 1, 1, 1, 1, 1,
-1.771986, 0.3979449, -2.801209, 1, 1, 1, 1, 1,
-1.770306, 1.558038, -1.657018, 1, 1, 1, 1, 1,
-1.748057, 0.1640938, -3.354827, 1, 1, 1, 1, 1,
-1.736545, 0.145294, -3.168313, 1, 1, 1, 1, 1,
-1.728386, -0.2664095, -3.664623, 1, 1, 1, 1, 1,
-1.727523, 1.016966, 1.244088, 1, 1, 1, 1, 1,
-1.713211, 0.7598125, -1.538209, 1, 1, 1, 1, 1,
-1.70612, 1.12775, -1.773946, 1, 1, 1, 1, 1,
-1.700399, -0.3257463, -0.7347976, 1, 1, 1, 1, 1,
-1.66807, -0.2078211, -3.608888, 1, 1, 1, 1, 1,
-1.656665, -0.7933022, -2.066089, 1, 1, 1, 1, 1,
-1.635803, -1.072742, -1.411836, 0, 0, 1, 1, 1,
-1.630566, -0.478536, -1.983094, 1, 0, 0, 1, 1,
-1.62188, -0.02080547, -2.581837, 1, 0, 0, 1, 1,
-1.587632, -0.5748978, 0.9434861, 1, 0, 0, 1, 1,
-1.574068, 0.526019, -2.100421, 1, 0, 0, 1, 1,
-1.573455, -0.9159118, -1.014044, 1, 0, 0, 1, 1,
-1.571207, -0.457138, -1.947484, 0, 0, 0, 1, 1,
-1.559027, 0.8858227, -1.017089, 0, 0, 0, 1, 1,
-1.536812, 0.2084772, -1.082056, 0, 0, 0, 1, 1,
-1.532523, -0.4252834, -1.261519, 0, 0, 0, 1, 1,
-1.520898, -0.1672816, -3.811319, 0, 0, 0, 1, 1,
-1.502121, -0.1005933, -1.16895, 0, 0, 0, 1, 1,
-1.486691, -0.8721647, -3.053276, 0, 0, 0, 1, 1,
-1.47325, 1.306006, -1.525483, 1, 1, 1, 1, 1,
-1.465923, 1.996673, 0.4400951, 1, 1, 1, 1, 1,
-1.460492, 1.471643, -1.664624, 1, 1, 1, 1, 1,
-1.454118, 1.340141, -0.5401338, 1, 1, 1, 1, 1,
-1.45171, 0.5111588, -0.4343857, 1, 1, 1, 1, 1,
-1.451659, 1.128667, -0.1005856, 1, 1, 1, 1, 1,
-1.444163, -0.6648804, -1.192914, 1, 1, 1, 1, 1,
-1.4388, 0.1075287, -2.64807, 1, 1, 1, 1, 1,
-1.434735, -0.660493, -2.684662, 1, 1, 1, 1, 1,
-1.42935, -0.8123201, -0.4189147, 1, 1, 1, 1, 1,
-1.402596, 0.2360902, -3.619206, 1, 1, 1, 1, 1,
-1.401998, 0.2930078, -2.552818, 1, 1, 1, 1, 1,
-1.397876, -0.8785869, -1.925791, 1, 1, 1, 1, 1,
-1.395859, -0.08440634, -0.5265206, 1, 1, 1, 1, 1,
-1.394571, -0.5084698, -0.6196787, 1, 1, 1, 1, 1,
-1.392017, -0.7585093, -4.848784, 0, 0, 1, 1, 1,
-1.39079, -0.8079373, -0.9071446, 1, 0, 0, 1, 1,
-1.389817, 0.1134551, -0.6551923, 1, 0, 0, 1, 1,
-1.375697, -0.7647543, -3.267757, 1, 0, 0, 1, 1,
-1.369403, -0.9430109, -2.878925, 1, 0, 0, 1, 1,
-1.3658, -1.134151, -1.68977, 1, 0, 0, 1, 1,
-1.361419, 0.01212239, -0.811936, 0, 0, 0, 1, 1,
-1.357207, -1.265028, -0.7403252, 0, 0, 0, 1, 1,
-1.350131, -0.1030427, -2.053455, 0, 0, 0, 1, 1,
-1.345739, -0.6956342, -1.943538, 0, 0, 0, 1, 1,
-1.338737, 0.07134142, -2.976115, 0, 0, 0, 1, 1,
-1.331691, 1.295147, 0.7195197, 0, 0, 0, 1, 1,
-1.32827, 0.4094188, -0.03627155, 0, 0, 0, 1, 1,
-1.327361, -2.398057, -1.559216, 1, 1, 1, 1, 1,
-1.324998, -0.4173437, -0.7975228, 1, 1, 1, 1, 1,
-1.321775, 0.01625462, -2.523857, 1, 1, 1, 1, 1,
-1.311446, -0.06710365, -2.427675, 1, 1, 1, 1, 1,
-1.308852, 1.121432, -2.000088, 1, 1, 1, 1, 1,
-1.304286, -1.886787, -3.618665, 1, 1, 1, 1, 1,
-1.302635, 0.7952492, -1.293741, 1, 1, 1, 1, 1,
-1.300695, 0.4283426, -1.721919, 1, 1, 1, 1, 1,
-1.300235, 0.4079493, 0.3831947, 1, 1, 1, 1, 1,
-1.299971, 0.3773555, -2.674066, 1, 1, 1, 1, 1,
-1.292222, -1.516761, -0.684668, 1, 1, 1, 1, 1,
-1.289926, -0.6825627, -3.064472, 1, 1, 1, 1, 1,
-1.287134, 2.741682, 1.010054, 1, 1, 1, 1, 1,
-1.284184, -0.07097858, -2.898553, 1, 1, 1, 1, 1,
-1.273766, 1.967758, -1.272718, 1, 1, 1, 1, 1,
-1.257693, -0.08394951, -1.737902, 0, 0, 1, 1, 1,
-1.256915, -1.74905, -3.253966, 1, 0, 0, 1, 1,
-1.234413, -0.3569146, -0.8522553, 1, 0, 0, 1, 1,
-1.226354, -0.6721416, -2.222079, 1, 0, 0, 1, 1,
-1.218866, -0.8283339, -1.964036, 1, 0, 0, 1, 1,
-1.218625, -0.5123206, -0.8289331, 1, 0, 0, 1, 1,
-1.211006, 0.7964995, -2.171487, 0, 0, 0, 1, 1,
-1.204051, 1.725587, -1.424673, 0, 0, 0, 1, 1,
-1.19977, 1.520296, -0.04547662, 0, 0, 0, 1, 1,
-1.196877, 0.7902562, -3.671898, 0, 0, 0, 1, 1,
-1.186286, 0.1955243, -1.279979, 0, 0, 0, 1, 1,
-1.183494, 1.608686, -0.8991473, 0, 0, 0, 1, 1,
-1.176113, 0.1952057, 0.04707051, 0, 0, 0, 1, 1,
-1.171849, 0.6173449, -1.306058, 1, 1, 1, 1, 1,
-1.169568, 1.06593, -0.5437152, 1, 1, 1, 1, 1,
-1.169347, -1.630115, -1.111007, 1, 1, 1, 1, 1,
-1.160088, 0.7553, -2.245112, 1, 1, 1, 1, 1,
-1.155302, 0.5632868, -1.05565, 1, 1, 1, 1, 1,
-1.150611, -1.213937, -0.7119326, 1, 1, 1, 1, 1,
-1.149367, 1.144373, -0.7707482, 1, 1, 1, 1, 1,
-1.148705, -1.14954, -3.505155, 1, 1, 1, 1, 1,
-1.139983, -0.3758578, -2.087132, 1, 1, 1, 1, 1,
-1.138853, -0.8447669, -2.689728, 1, 1, 1, 1, 1,
-1.131999, -0.3795205, -0.8345302, 1, 1, 1, 1, 1,
-1.127986, -0.5053398, -3.79707, 1, 1, 1, 1, 1,
-1.121593, -0.05535302, -1.985648, 1, 1, 1, 1, 1,
-1.12143, -0.8773576, -2.036515, 1, 1, 1, 1, 1,
-1.118464, -0.4869044, -2.933821, 1, 1, 1, 1, 1,
-1.118141, 1.742183, -2.065458, 0, 0, 1, 1, 1,
-1.116137, -1.053297, -0.2785374, 1, 0, 0, 1, 1,
-1.109852, 0.4368332, 0.675644, 1, 0, 0, 1, 1,
-1.105618, -0.5945754, -0.5857841, 1, 0, 0, 1, 1,
-1.100755, 0.21859, -1.160786, 1, 0, 0, 1, 1,
-1.099853, 0.4069492, -0.7896582, 1, 0, 0, 1, 1,
-1.094248, -0.1793248, -1.669749, 0, 0, 0, 1, 1,
-1.09016, -0.6359524, -1.90326, 0, 0, 0, 1, 1,
-1.086303, -0.400922, -1.304537, 0, 0, 0, 1, 1,
-1.083886, -0.1330413, -0.3223193, 0, 0, 0, 1, 1,
-1.079244, 0.09725877, -1.639792, 0, 0, 0, 1, 1,
-1.078737, 0.1674284, -0.8171737, 0, 0, 0, 1, 1,
-1.077965, -1.213647, -2.538864, 0, 0, 0, 1, 1,
-1.064196, 0.8731192, -0.6428961, 1, 1, 1, 1, 1,
-1.057295, -0.9196483, -3.105648, 1, 1, 1, 1, 1,
-1.045459, 0.8424264, -0.7535546, 1, 1, 1, 1, 1,
-1.033501, -1.041759, -2.125411, 1, 1, 1, 1, 1,
-1.02573, 1.305304, -0.1292558, 1, 1, 1, 1, 1,
-1.020036, -0.5297893, -2.172738, 1, 1, 1, 1, 1,
-1.013365, -1.278627, -2.706269, 1, 1, 1, 1, 1,
-1.012595, -0.2346911, -1.359178, 1, 1, 1, 1, 1,
-1.011901, -1.982679, -2.959734, 1, 1, 1, 1, 1,
-1.009853, 0.0676548, -1.912192, 1, 1, 1, 1, 1,
-1.004599, -0.2905743, -2.986549, 1, 1, 1, 1, 1,
-1.000265, 1.789287, -2.026, 1, 1, 1, 1, 1,
-0.9984282, 0.3673557, -3.553149, 1, 1, 1, 1, 1,
-0.9962216, 0.3077048, -1.494248, 1, 1, 1, 1, 1,
-0.9931519, -0.4375408, -2.451718, 1, 1, 1, 1, 1,
-0.9892876, 0.1736177, -1.088877, 0, 0, 1, 1, 1,
-0.9829987, -1.506281, -2.545796, 1, 0, 0, 1, 1,
-0.9827352, 0.1378389, -1.567384, 1, 0, 0, 1, 1,
-0.9718155, -0.4679332, -2.1835, 1, 0, 0, 1, 1,
-0.9663156, -0.5351014, -0.3952549, 1, 0, 0, 1, 1,
-0.9587017, 1.574388, 0.3646931, 1, 0, 0, 1, 1,
-0.9576574, -0.7153799, -0.8763645, 0, 0, 0, 1, 1,
-0.952655, -1.484469, -1.235768, 0, 0, 0, 1, 1,
-0.9523777, 0.8128856, -3.12839, 0, 0, 0, 1, 1,
-0.9487802, 0.4775431, -1.081656, 0, 0, 0, 1, 1,
-0.9455272, 1.297033, -0.8676938, 0, 0, 0, 1, 1,
-0.9431003, 2.345742, -0.5603588, 0, 0, 0, 1, 1,
-0.9420938, -1.300159, -2.439608, 0, 0, 0, 1, 1,
-0.9352621, -0.29038, -1.519347, 1, 1, 1, 1, 1,
-0.9328015, 1.067406, 0.2684252, 1, 1, 1, 1, 1,
-0.9284437, 0.07435986, -0.2605703, 1, 1, 1, 1, 1,
-0.9259106, 0.1460921, -0.3176798, 1, 1, 1, 1, 1,
-0.9256629, -0.6142034, -1.060418, 1, 1, 1, 1, 1,
-0.9253991, 0.3695399, -2.40463, 1, 1, 1, 1, 1,
-0.9235544, 1.297381, 0.3363131, 1, 1, 1, 1, 1,
-0.9199424, 1.144414, -1.499257, 1, 1, 1, 1, 1,
-0.914255, 1.727747, -0.8844431, 1, 1, 1, 1, 1,
-0.9141178, -0.599811, -0.1612856, 1, 1, 1, 1, 1,
-0.9134106, 0.8888775, -1.300799, 1, 1, 1, 1, 1,
-0.904848, 0.8121633, -1.520351, 1, 1, 1, 1, 1,
-0.8960609, 0.1718786, -0.6574104, 1, 1, 1, 1, 1,
-0.8954546, 0.4952827, -1.964582, 1, 1, 1, 1, 1,
-0.8918837, 0.2316791, -1.186225, 1, 1, 1, 1, 1,
-0.8887047, 1.382678, 0.2118869, 0, 0, 1, 1, 1,
-0.8850812, 0.06202102, -1.639602, 1, 0, 0, 1, 1,
-0.8836175, 0.3223492, 0.2202078, 1, 0, 0, 1, 1,
-0.8835315, 1.190182, -1.760051, 1, 0, 0, 1, 1,
-0.8833309, -0.1992242, -0.2440378, 1, 0, 0, 1, 1,
-0.8715875, -0.03987061, -2.323506, 1, 0, 0, 1, 1,
-0.8707867, -1.320401, -3.211922, 0, 0, 0, 1, 1,
-0.8666709, 0.4801284, -1.265627, 0, 0, 0, 1, 1,
-0.8638996, 1.649494, -0.6189687, 0, 0, 0, 1, 1,
-0.8631023, -0.5508204, -3.194473, 0, 0, 0, 1, 1,
-0.8545771, -1.333331, -2.278369, 0, 0, 0, 1, 1,
-0.852628, -1.608371, -3.122403, 0, 0, 0, 1, 1,
-0.849568, -0.4946921, -0.3875179, 0, 0, 0, 1, 1,
-0.8444684, -0.5779992, -2.064763, 1, 1, 1, 1, 1,
-0.8427892, 1.349863, 0.6706621, 1, 1, 1, 1, 1,
-0.8388319, 0.062883, -2.446244, 1, 1, 1, 1, 1,
-0.837629, -0.8096204, -3.425476, 1, 1, 1, 1, 1,
-0.8314396, -1.179437, -1.722277, 1, 1, 1, 1, 1,
-0.8290167, 0.1238389, -0.2997, 1, 1, 1, 1, 1,
-0.8244053, 0.302547, -1.496439, 1, 1, 1, 1, 1,
-0.8243208, 0.4679016, -0.784378, 1, 1, 1, 1, 1,
-0.815957, -0.7693682, -2.820837, 1, 1, 1, 1, 1,
-0.8144686, 1.091898, -1.495747, 1, 1, 1, 1, 1,
-0.8128912, -0.1835309, -1.553558, 1, 1, 1, 1, 1,
-0.8102845, 0.3891799, -1.048369, 1, 1, 1, 1, 1,
-0.8101236, -0.1556728, -2.039463, 1, 1, 1, 1, 1,
-0.8093224, -1.661908, -2.735251, 1, 1, 1, 1, 1,
-0.7988878, -0.7890589, -2.589082, 1, 1, 1, 1, 1,
-0.7969407, -0.7441274, -1.214, 0, 0, 1, 1, 1,
-0.7950861, -1.406244, -0.8383387, 1, 0, 0, 1, 1,
-0.7925942, -0.2250266, -1.052889, 1, 0, 0, 1, 1,
-0.7910854, -0.2720366, -0.2593133, 1, 0, 0, 1, 1,
-0.7850156, -1.667364, -3.63834, 1, 0, 0, 1, 1,
-0.7849566, 1.717471, -0.7096827, 1, 0, 0, 1, 1,
-0.7835253, -2.371475, -3.451218, 0, 0, 0, 1, 1,
-0.7738129, 0.911231, -1.702725, 0, 0, 0, 1, 1,
-0.7709353, 0.9801096, -1.974754, 0, 0, 0, 1, 1,
-0.770061, -0.9290144, -2.664395, 0, 0, 0, 1, 1,
-0.7691624, -0.6250566, -2.760448, 0, 0, 0, 1, 1,
-0.7669827, -0.3273815, -1.082455, 0, 0, 0, 1, 1,
-0.7668109, 1.447519, -0.8243723, 0, 0, 0, 1, 1,
-0.7651562, 1.584498, -1.16949, 1, 1, 1, 1, 1,
-0.7607107, -0.7056497, -3.523526, 1, 1, 1, 1, 1,
-0.7594063, -0.4329678, -2.596398, 1, 1, 1, 1, 1,
-0.753293, -1.045534, -1.470777, 1, 1, 1, 1, 1,
-0.7520702, -0.01180534, -1.109859, 1, 1, 1, 1, 1,
-0.7518918, -0.07257759, -2.675175, 1, 1, 1, 1, 1,
-0.7503123, 0.09745708, -2.474024, 1, 1, 1, 1, 1,
-0.748102, 0.7560539, 0.5024498, 1, 1, 1, 1, 1,
-0.7462696, -0.3621534, -2.676805, 1, 1, 1, 1, 1,
-0.7438017, -0.4394698, -1.565812, 1, 1, 1, 1, 1,
-0.7420665, 1.579053, 1.430272, 1, 1, 1, 1, 1,
-0.7401904, 0.05289313, -1.971032, 1, 1, 1, 1, 1,
-0.7271974, -0.4687797, -1.710631, 1, 1, 1, 1, 1,
-0.7213193, 1.53638, -0.1386826, 1, 1, 1, 1, 1,
-0.7182845, 1.321831, -2.083203, 1, 1, 1, 1, 1,
-0.7080622, -0.7373945, -2.178901, 0, 0, 1, 1, 1,
-0.7053258, -0.7165258, -0.7595864, 1, 0, 0, 1, 1,
-0.7022018, 0.6673462, 0.5198226, 1, 0, 0, 1, 1,
-0.6941728, 0.6979311, -0.432465, 1, 0, 0, 1, 1,
-0.679383, 0.2088669, -1.680399, 1, 0, 0, 1, 1,
-0.6792396, -0.1081022, -2.003447, 1, 0, 0, 1, 1,
-0.6785078, 0.02338491, -2.604939, 0, 0, 0, 1, 1,
-0.6688214, -0.5936124, -3.314777, 0, 0, 0, 1, 1,
-0.6676937, 0.1633958, 0.7293271, 0, 0, 0, 1, 1,
-0.6620236, -0.1366447, -4.18685, 0, 0, 0, 1, 1,
-0.6612574, 1.090278, -0.2881204, 0, 0, 0, 1, 1,
-0.6594665, 0.4221054, 0.09335274, 0, 0, 0, 1, 1,
-0.6587268, -0.5881995, -0.7698715, 0, 0, 0, 1, 1,
-0.6566672, 0.8122813, 1.861235, 1, 1, 1, 1, 1,
-0.6560991, 1.721379, -2.140776, 1, 1, 1, 1, 1,
-0.6511071, 0.5279936, -2.349503, 1, 1, 1, 1, 1,
-0.6509241, 1.844258, 0.7207286, 1, 1, 1, 1, 1,
-0.650865, 0.9172356, -1.826603, 1, 1, 1, 1, 1,
-0.6487679, 1.559382, 0.3970902, 1, 1, 1, 1, 1,
-0.6391676, -0.07687999, -2.828381, 1, 1, 1, 1, 1,
-0.6384259, 1.351287, -0.4001064, 1, 1, 1, 1, 1,
-0.6380599, -0.09306781, -0.6532682, 1, 1, 1, 1, 1,
-0.6356428, 1.298466, -0.5757843, 1, 1, 1, 1, 1,
-0.6311216, 1.263623, -0.04312282, 1, 1, 1, 1, 1,
-0.6301895, 0.2736044, -0.7721248, 1, 1, 1, 1, 1,
-0.6282253, 1.03743, 0.9493335, 1, 1, 1, 1, 1,
-0.6207871, -0.172211, -2.212775, 1, 1, 1, 1, 1,
-0.6190643, -0.4940457, -2.580398, 1, 1, 1, 1, 1,
-0.6180211, -1.162146, -2.570368, 0, 0, 1, 1, 1,
-0.6167979, 0.4509882, 0.2297319, 1, 0, 0, 1, 1,
-0.6074503, -0.4749048, -5.055589, 1, 0, 0, 1, 1,
-0.6026695, 1.867046, -1.403646, 1, 0, 0, 1, 1,
-0.6016905, -1.027762, -1.163269, 1, 0, 0, 1, 1,
-0.5975915, 1.216403, 0.1905441, 1, 0, 0, 1, 1,
-0.59656, -1.280776, -3.856106, 0, 0, 0, 1, 1,
-0.5933333, -0.1481883, -2.439356, 0, 0, 0, 1, 1,
-0.591945, 0.2669297, -1.515173, 0, 0, 0, 1, 1,
-0.5902664, 0.1636439, -2.637516, 0, 0, 0, 1, 1,
-0.5883546, 1.159265, -0.7833054, 0, 0, 0, 1, 1,
-0.5870568, 0.500913, -0.8430156, 0, 0, 0, 1, 1,
-0.5841945, 0.4251956, 0.188722, 0, 0, 0, 1, 1,
-0.5805976, 0.6699436, -0.4724032, 1, 1, 1, 1, 1,
-0.5706874, -0.1601383, -2.484261, 1, 1, 1, 1, 1,
-0.5628145, 0.2579377, -2.251933, 1, 1, 1, 1, 1,
-0.5625687, -0.6923777, -2.371879, 1, 1, 1, 1, 1,
-0.553849, -0.1621319, -3.504287, 1, 1, 1, 1, 1,
-0.5522424, -0.8873149, -3.094635, 1, 1, 1, 1, 1,
-0.5492359, 0.3074722, -2.172745, 1, 1, 1, 1, 1,
-0.546536, -0.5017431, -0.8499401, 1, 1, 1, 1, 1,
-0.5372831, 0.4758997, -1.465355, 1, 1, 1, 1, 1,
-0.5251213, -0.8437163, -3.61703, 1, 1, 1, 1, 1,
-0.5249122, -1.883252, -3.595713, 1, 1, 1, 1, 1,
-0.5239999, 0.5842672, -1.226418, 1, 1, 1, 1, 1,
-0.5175613, -0.2152227, -2.768421, 1, 1, 1, 1, 1,
-0.5165741, 0.7778158, 0.2949542, 1, 1, 1, 1, 1,
-0.5135163, 0.4818746, 0.2851098, 1, 1, 1, 1, 1,
-0.507346, -0.08844225, -1.774177, 0, 0, 1, 1, 1,
-0.4988084, -0.3705103, -1.182536, 1, 0, 0, 1, 1,
-0.4942932, 0.8230821, -0.7318625, 1, 0, 0, 1, 1,
-0.4911972, 0.1857899, -1.472577, 1, 0, 0, 1, 1,
-0.4882564, 0.0318776, -0.729588, 1, 0, 0, 1, 1,
-0.4868272, -0.3350688, -2.680349, 1, 0, 0, 1, 1,
-0.4860924, -0.204109, -1.627927, 0, 0, 0, 1, 1,
-0.485677, 0.9330537, -0.3668094, 0, 0, 0, 1, 1,
-0.4827413, 0.4958587, 0.702434, 0, 0, 0, 1, 1,
-0.4767891, 1.282721, -0.8898866, 0, 0, 0, 1, 1,
-0.4670112, 0.2055069, -0.1918481, 0, 0, 0, 1, 1,
-0.4642921, -1.443567, -3.701916, 0, 0, 0, 1, 1,
-0.4638782, 0.8747926, -0.9855909, 0, 0, 0, 1, 1,
-0.4636526, -1.369258, -2.304796, 1, 1, 1, 1, 1,
-0.4606415, 0.5107003, 0.4101182, 1, 1, 1, 1, 1,
-0.4561319, 2.094722, 0.2159143, 1, 1, 1, 1, 1,
-0.455654, 0.01641659, -2.086002, 1, 1, 1, 1, 1,
-0.4545267, -1.201585, -2.723761, 1, 1, 1, 1, 1,
-0.448531, -0.9493635, -4.546665, 1, 1, 1, 1, 1,
-0.4483369, 0.7463973, 0.3204582, 1, 1, 1, 1, 1,
-0.4482355, -1.216015, -3.270177, 1, 1, 1, 1, 1,
-0.4382205, -0.121644, -3.264233, 1, 1, 1, 1, 1,
-0.4375791, 0.2841139, -2.05939, 1, 1, 1, 1, 1,
-0.4372706, -1.424447, -3.872339, 1, 1, 1, 1, 1,
-0.4340234, -1.421357, -3.130556, 1, 1, 1, 1, 1,
-0.433426, 0.486816, 1.436357, 1, 1, 1, 1, 1,
-0.4176093, -1.227958, -2.165348, 1, 1, 1, 1, 1,
-0.4145994, 0.8706648, -0.6177586, 1, 1, 1, 1, 1,
-0.4144609, 0.4012773, 1.468607, 0, 0, 1, 1, 1,
-0.4130099, -0.3024026, -2.858019, 1, 0, 0, 1, 1,
-0.4094661, -0.3533983, -1.152053, 1, 0, 0, 1, 1,
-0.4089212, -0.7952532, -3.158194, 1, 0, 0, 1, 1,
-0.4085351, -1.266109, -2.280528, 1, 0, 0, 1, 1,
-0.4032525, 0.7596983, -0.1498487, 1, 0, 0, 1, 1,
-0.3986042, 0.7127252, -1.353248, 0, 0, 0, 1, 1,
-0.3974452, 0.1642803, -0.5987836, 0, 0, 0, 1, 1,
-0.3964083, -0.2599635, -2.186912, 0, 0, 0, 1, 1,
-0.3938021, 0.3171208, 0.7408216, 0, 0, 0, 1, 1,
-0.3876832, 1.994043, -0.6234962, 0, 0, 0, 1, 1,
-0.3867613, 0.776961, -1.999327, 0, 0, 0, 1, 1,
-0.3834601, -0.280421, -2.935545, 0, 0, 0, 1, 1,
-0.3826541, -0.6889547, -2.946242, 1, 1, 1, 1, 1,
-0.3817483, 0.9103948, 0.0138174, 1, 1, 1, 1, 1,
-0.3810684, 0.2045796, -0.2696188, 1, 1, 1, 1, 1,
-0.3775928, 0.6320571, -0.8496242, 1, 1, 1, 1, 1,
-0.3760895, -1.741402, -2.88121, 1, 1, 1, 1, 1,
-0.3728946, 0.2382651, -0.2414041, 1, 1, 1, 1, 1,
-0.3674238, -1.190055, -3.987329, 1, 1, 1, 1, 1,
-0.3673541, -0.228452, -0.4352194, 1, 1, 1, 1, 1,
-0.3606504, -0.2374771, -3.364632, 1, 1, 1, 1, 1,
-0.3592417, -0.1804293, -2.030701, 1, 1, 1, 1, 1,
-0.3572365, 0.4099737, 0.03239519, 1, 1, 1, 1, 1,
-0.3540332, 0.7930859, -1.327863, 1, 1, 1, 1, 1,
-0.3511427, 0.8855643, 0.4438949, 1, 1, 1, 1, 1,
-0.349287, 0.4800997, -0.54964, 1, 1, 1, 1, 1,
-0.3491426, -0.8050058, -2.449796, 1, 1, 1, 1, 1,
-0.3479913, 0.8664306, -0.8245535, 0, 0, 1, 1, 1,
-0.3455193, 0.3156786, -0.6294815, 1, 0, 0, 1, 1,
-0.3445952, 0.8932338, -0.5336071, 1, 0, 0, 1, 1,
-0.3410466, 1.247017, 0.3701732, 1, 0, 0, 1, 1,
-0.3408723, -0.3875856, -1.43401, 1, 0, 0, 1, 1,
-0.3406015, -1.422902, -4.160715, 1, 0, 0, 1, 1,
-0.3404322, 0.627887, -2.000222, 0, 0, 0, 1, 1,
-0.3391883, -1.694839, -3.41216, 0, 0, 0, 1, 1,
-0.3357768, -1.097742, -1.661137, 0, 0, 0, 1, 1,
-0.3334287, -0.2129064, -2.056453, 0, 0, 0, 1, 1,
-0.3311091, 0.4318169, -1.734376, 0, 0, 0, 1, 1,
-0.3291763, 0.6014843, -0.3423566, 0, 0, 0, 1, 1,
-0.3285177, -1.146017, -1.69304, 0, 0, 0, 1, 1,
-0.3281822, 0.127715, -0.5673401, 1, 1, 1, 1, 1,
-0.3267914, 0.502017, -1.210866, 1, 1, 1, 1, 1,
-0.3256793, 0.1145718, -1.422358, 1, 1, 1, 1, 1,
-0.3253708, 0.1410318, -3.894141, 1, 1, 1, 1, 1,
-0.3236958, -0.1725917, -0.9978108, 1, 1, 1, 1, 1,
-0.3236506, 1.863883, 0.7108358, 1, 1, 1, 1, 1,
-0.3207896, 0.3825695, -1.925816, 1, 1, 1, 1, 1,
-0.3175441, -0.7906757, -1.234368, 1, 1, 1, 1, 1,
-0.3171535, -1.141615, -4.108292, 1, 1, 1, 1, 1,
-0.3156481, 0.8416945, -0.7262161, 1, 1, 1, 1, 1,
-0.3151198, -1.446915, -3.157686, 1, 1, 1, 1, 1,
-0.3144549, 0.1350848, -1.388005, 1, 1, 1, 1, 1,
-0.3143536, -0.2057893, -2.19963, 1, 1, 1, 1, 1,
-0.312073, -0.5741978, -1.270892, 1, 1, 1, 1, 1,
-0.3103125, -0.7260302, -4.094162, 1, 1, 1, 1, 1,
-0.3085722, -0.1625729, 0.8674416, 0, 0, 1, 1, 1,
-0.3057021, -0.2990278, -2.401695, 1, 0, 0, 1, 1,
-0.3046917, 0.5008305, -0.8687196, 1, 0, 0, 1, 1,
-0.2989023, -0.1953372, -0.9665613, 1, 0, 0, 1, 1,
-0.2954249, 0.06173117, -0.5912864, 1, 0, 0, 1, 1,
-0.2928999, -2.214202, -4.001904, 1, 0, 0, 1, 1,
-0.2911595, 0.8526894, 0.2002142, 0, 0, 0, 1, 1,
-0.2901473, 1.774929, -0.9187263, 0, 0, 0, 1, 1,
-0.2885053, 1.93552, 0.2370797, 0, 0, 0, 1, 1,
-0.2848112, 1.037102, -0.2910016, 0, 0, 0, 1, 1,
-0.2841134, -0.0396141, -1.42629, 0, 0, 0, 1, 1,
-0.2774936, -0.5753374, -3.448775, 0, 0, 0, 1, 1,
-0.2757237, 1.392346, -0.5344652, 0, 0, 0, 1, 1,
-0.2752174, 0.4641549, -0.4361533, 1, 1, 1, 1, 1,
-0.2645876, -0.5762544, -3.228282, 1, 1, 1, 1, 1,
-0.260378, -1.069859, -1.438171, 1, 1, 1, 1, 1,
-0.2591535, -0.6705255, -2.190464, 1, 1, 1, 1, 1,
-0.2586512, -0.1215943, -3.389823, 1, 1, 1, 1, 1,
-0.2574272, -0.4853831, -2.878877, 1, 1, 1, 1, 1,
-0.2548017, 0.057985, -0.941646, 1, 1, 1, 1, 1,
-0.2533344, 0.6084912, -0.4045056, 1, 1, 1, 1, 1,
-0.2452266, 0.7367514, 1.363598, 1, 1, 1, 1, 1,
-0.2426098, -1.251593, -2.083678, 1, 1, 1, 1, 1,
-0.2370568, -0.5375699, -2.264848, 1, 1, 1, 1, 1,
-0.2367594, 0.8728051, 0.3912946, 1, 1, 1, 1, 1,
-0.2339671, -0.5530785, -0.7925035, 1, 1, 1, 1, 1,
-0.2209275, 0.1316452, -1.393213, 1, 1, 1, 1, 1,
-0.2159668, 1.467047, -1.242086, 1, 1, 1, 1, 1,
-0.2128943, 0.4446991, 0.3967579, 0, 0, 1, 1, 1,
-0.2126886, -1.678128, -2.247223, 1, 0, 0, 1, 1,
-0.2064571, -0.1392876, -2.737236, 1, 0, 0, 1, 1,
-0.2057379, 0.5238011, 0.8700981, 1, 0, 0, 1, 1,
-0.200635, -1.388532, -0.4850481, 1, 0, 0, 1, 1,
-0.1993267, -1.010958, -3.471939, 1, 0, 0, 1, 1,
-0.1978149, -0.1868525, -2.18259, 0, 0, 0, 1, 1,
-0.1972243, 1.066237, 1.930655, 0, 0, 0, 1, 1,
-0.1953459, 0.5163864, -1.804893, 0, 0, 0, 1, 1,
-0.1945077, -1.973409, -2.827259, 0, 0, 0, 1, 1,
-0.1929658, 1.763129, -0.9078732, 0, 0, 0, 1, 1,
-0.1903381, -0.0007416374, -0.7653839, 0, 0, 0, 1, 1,
-0.1883895, -0.01844672, -2.396279, 0, 0, 0, 1, 1,
-0.1882014, 0.3254369, -1.613275, 1, 1, 1, 1, 1,
-0.184399, 0.339508, 1.251545, 1, 1, 1, 1, 1,
-0.1821591, -0.5808427, -3.106762, 1, 1, 1, 1, 1,
-0.1775951, -2.665789, -3.6322, 1, 1, 1, 1, 1,
-0.1751103, -0.5830751, -3.835618, 1, 1, 1, 1, 1,
-0.1740643, -1.499818, -3.318952, 1, 1, 1, 1, 1,
-0.1714217, 1.297337, 0.2120197, 1, 1, 1, 1, 1,
-0.1665411, -0.2189351, -4.366353, 1, 1, 1, 1, 1,
-0.1624319, -1.409348, -2.711945, 1, 1, 1, 1, 1,
-0.1622459, -0.3173439, -2.771217, 1, 1, 1, 1, 1,
-0.1597154, 1.288667, -0.935909, 1, 1, 1, 1, 1,
-0.158691, -2.067051, -3.792196, 1, 1, 1, 1, 1,
-0.1586052, -0.2055988, -1.715838, 1, 1, 1, 1, 1,
-0.1581187, 1.785398, -0.5974525, 1, 1, 1, 1, 1,
-0.1569228, 0.406848, -0.998323, 1, 1, 1, 1, 1,
-0.1534808, 0.8578894, -1.182064, 0, 0, 1, 1, 1,
-0.1513926, -0.05531844, -1.566486, 1, 0, 0, 1, 1,
-0.1491787, -0.1385653, -2.136709, 1, 0, 0, 1, 1,
-0.1474289, 1.403258, 0.7576698, 1, 0, 0, 1, 1,
-0.1447906, 0.7036301, 0.5543978, 1, 0, 0, 1, 1,
-0.1412245, -0.9825321, -3.933959, 1, 0, 0, 1, 1,
-0.1411076, -0.2500798, -2.883491, 0, 0, 0, 1, 1,
-0.1406781, -1.035711, -2.447801, 0, 0, 0, 1, 1,
-0.1334869, 0.8504969, -1.82771, 0, 0, 0, 1, 1,
-0.1328798, -0.6847187, -3.776664, 0, 0, 0, 1, 1,
-0.132705, -0.3088288, -2.342899, 0, 0, 0, 1, 1,
-0.1287435, 2.003022, 1.815999, 0, 0, 0, 1, 1,
-0.1227319, -0.09403555, -1.338703, 0, 0, 0, 1, 1,
-0.1129501, -1.798611, -1.950379, 1, 1, 1, 1, 1,
-0.1082949, -1.303268, -4.510983, 1, 1, 1, 1, 1,
-0.1078692, 0.5460913, 1.14288, 1, 1, 1, 1, 1,
-0.1068636, -1.422752, -3.367597, 1, 1, 1, 1, 1,
-0.1066321, -0.06243743, -2.603338, 1, 1, 1, 1, 1,
-0.09699767, -1.430528, -4.730468, 1, 1, 1, 1, 1,
-0.09422645, 0.4949287, -0.2001964, 1, 1, 1, 1, 1,
-0.09243468, -1.608819, -2.181948, 1, 1, 1, 1, 1,
-0.09144469, -1.145682, -4.250326, 1, 1, 1, 1, 1,
-0.08977178, 0.2224092, 0.5835919, 1, 1, 1, 1, 1,
-0.08506624, -0.3194245, -2.127439, 1, 1, 1, 1, 1,
-0.08450551, -1.130491, -1.481317, 1, 1, 1, 1, 1,
-0.08379053, 0.3069254, -2.180524, 1, 1, 1, 1, 1,
-0.08333969, -1.008169, -4.194483, 1, 1, 1, 1, 1,
-0.08013078, 1.590601, 0.3406288, 1, 1, 1, 1, 1,
-0.07817077, -1.31024, -3.156139, 0, 0, 1, 1, 1,
-0.07733707, -0.5920803, -2.0017, 1, 0, 0, 1, 1,
-0.07313389, -0.05338465, -2.22688, 1, 0, 0, 1, 1,
-0.06676397, 0.1009049, 0.3873063, 1, 0, 0, 1, 1,
-0.0650562, 1.90907, -1.593078, 1, 0, 0, 1, 1,
-0.05443995, -1.454738, -2.91263, 1, 0, 0, 1, 1,
-0.05350095, -0.03105844, -2.703616, 0, 0, 0, 1, 1,
-0.05212436, 1.105629, 1.397595, 0, 0, 0, 1, 1,
-0.05191713, -1.003697, -3.005013, 0, 0, 0, 1, 1,
-0.05121087, 0.3727081, 0.2211501, 0, 0, 0, 1, 1,
-0.04570065, -0.1077964, -1.172858, 0, 0, 0, 1, 1,
-0.04178825, 1.505672, 1.795492, 0, 0, 0, 1, 1,
-0.04150539, -0.7654227, -2.623493, 0, 0, 0, 1, 1,
-0.04110031, -0.9675912, -4.442784, 1, 1, 1, 1, 1,
-0.03945772, -0.9916264, -2.33915, 1, 1, 1, 1, 1,
-0.03774361, 0.05472471, -2.328997, 1, 1, 1, 1, 1,
-0.03477691, -0.03791527, -1.640506, 1, 1, 1, 1, 1,
-0.03198826, 1.615685, -2.233548, 1, 1, 1, 1, 1,
-0.02787041, 2.026524, 1.311412, 1, 1, 1, 1, 1,
-0.0271643, -0.5375867, -2.650204, 1, 1, 1, 1, 1,
-0.02292159, 0.2144924, 0.2609794, 1, 1, 1, 1, 1,
-0.02105562, -0.6737318, -1.467532, 1, 1, 1, 1, 1,
-0.01948049, -0.4558241, -2.926152, 1, 1, 1, 1, 1,
-0.01573127, 0.3258459, 0.6248663, 1, 1, 1, 1, 1,
-0.01291576, -0.3734983, -2.83277, 1, 1, 1, 1, 1,
-0.008523438, 1.326516, 0.5800104, 1, 1, 1, 1, 1,
-0.007445264, -1.487663, -5.60497, 1, 1, 1, 1, 1,
-0.006279789, 1.356999, 1.271494, 1, 1, 1, 1, 1,
-0.003443228, 0.6054668, -0.2379414, 0, 0, 1, 1, 1,
-0.001466212, 0.7509655, -1.770447, 1, 0, 0, 1, 1,
-0.0004047663, 0.1361339, 2.315598, 1, 0, 0, 1, 1,
0.002744888, -0.5691324, 2.920256, 1, 0, 0, 1, 1,
0.007203291, 1.386128, 0.4669645, 1, 0, 0, 1, 1,
0.00836339, -1.650215, 4.495482, 1, 0, 0, 1, 1,
0.01121875, -0.5959615, 3.065037, 0, 0, 0, 1, 1,
0.0122603, -2.226926, 3.775203, 0, 0, 0, 1, 1,
0.01240654, -0.7110557, 3.140174, 0, 0, 0, 1, 1,
0.01400323, -0.2223372, 1.937636, 0, 0, 0, 1, 1,
0.015376, 1.253339, -0.4045347, 0, 0, 0, 1, 1,
0.01560997, -0.09710775, 4.39848, 0, 0, 0, 1, 1,
0.02414147, 0.8813503, -1.100281, 0, 0, 0, 1, 1,
0.02978612, -0.1568054, 3.00076, 1, 1, 1, 1, 1,
0.03281315, -0.7519954, 4.105158, 1, 1, 1, 1, 1,
0.03590534, 0.2269613, 1.771238, 1, 1, 1, 1, 1,
0.03737565, 1.067607, 0.8118302, 1, 1, 1, 1, 1,
0.04559655, -0.5865731, 3.548507, 1, 1, 1, 1, 1,
0.04826101, 1.449468, 0.4327376, 1, 1, 1, 1, 1,
0.06139781, 0.07776942, 0.6207821, 1, 1, 1, 1, 1,
0.06222802, -0.7391939, 3.097543, 1, 1, 1, 1, 1,
0.06390971, -0.4096483, 3.353115, 1, 1, 1, 1, 1,
0.06815246, 0.5723242, 0.5957126, 1, 1, 1, 1, 1,
0.07672311, 0.2018698, 1.322716, 1, 1, 1, 1, 1,
0.0775337, -1.868649, 2.797604, 1, 1, 1, 1, 1,
0.08072083, -1.531511, 4.723233, 1, 1, 1, 1, 1,
0.08217706, 0.9899357, -0.8342725, 1, 1, 1, 1, 1,
0.0834166, -0.5327414, 3.277053, 1, 1, 1, 1, 1,
0.08540068, 0.3901308, -0.04819511, 0, 0, 1, 1, 1,
0.0968438, 1.185368, -0.7873328, 1, 0, 0, 1, 1,
0.09932977, 0.3298412, 0.5506083, 1, 0, 0, 1, 1,
0.1015823, 0.5232837, 0.1949539, 1, 0, 0, 1, 1,
0.1086179, -0.387127, 2.024516, 1, 0, 0, 1, 1,
0.1097697, -0.9056479, 4.435813, 1, 0, 0, 1, 1,
0.1100888, 0.05943611, 1.761773, 0, 0, 0, 1, 1,
0.1137249, 0.5490925, 0.2191177, 0, 0, 0, 1, 1,
0.1142336, 1.542184, 0.2293788, 0, 0, 0, 1, 1,
0.1175472, 1.977636, -1.047118, 0, 0, 0, 1, 1,
0.1205329, 0.1357812, -0.2780087, 0, 0, 0, 1, 1,
0.1212766, -0.6564203, 6.390653, 0, 0, 0, 1, 1,
0.1229161, -0.4863519, 3.464334, 0, 0, 0, 1, 1,
0.1234554, -1.795029, 2.132171, 1, 1, 1, 1, 1,
0.1263401, -0.7379009, 2.21508, 1, 1, 1, 1, 1,
0.1280127, -1.89663, 1.860332, 1, 1, 1, 1, 1,
0.1295193, 0.6468864, -0.4413204, 1, 1, 1, 1, 1,
0.1336623, -1.0509, 3.629978, 1, 1, 1, 1, 1,
0.1336971, 1.526697, -1.259585, 1, 1, 1, 1, 1,
0.1361496, -0.06531168, 1.811211, 1, 1, 1, 1, 1,
0.1409406, -1.070905, 1.696478, 1, 1, 1, 1, 1,
0.1480204, 0.2882484, 0.8155153, 1, 1, 1, 1, 1,
0.1495683, 0.5608522, -0.7505118, 1, 1, 1, 1, 1,
0.1508723, 1.880546, 0.5505672, 1, 1, 1, 1, 1,
0.1518388, -0.3487768, 4.190618, 1, 1, 1, 1, 1,
0.1520035, -0.7776524, 2.350298, 1, 1, 1, 1, 1,
0.1527106, -0.1051729, 3.148441, 1, 1, 1, 1, 1,
0.1539517, 1.926124, 0.1903931, 1, 1, 1, 1, 1,
0.1573478, -0.4919654, 2.061343, 0, 0, 1, 1, 1,
0.160514, -0.132147, 3.398955, 1, 0, 0, 1, 1,
0.1612016, -0.1565735, 1.983621, 1, 0, 0, 1, 1,
0.1624494, -0.2949637, 2.625713, 1, 0, 0, 1, 1,
0.1627894, -0.6628749, 4.599723, 1, 0, 0, 1, 1,
0.1649958, -1.195374, 1.605692, 1, 0, 0, 1, 1,
0.169188, -1.842855, 2.087688, 0, 0, 0, 1, 1,
0.1772859, -1.685512, 2.275726, 0, 0, 0, 1, 1,
0.1782012, 1.018148, 0.8141711, 0, 0, 0, 1, 1,
0.1832792, -0.03163397, 1.138608, 0, 0, 0, 1, 1,
0.1906045, 0.4930328, -0.4503141, 0, 0, 0, 1, 1,
0.1940372, -0.5919459, 3.781825, 0, 0, 0, 1, 1,
0.1969158, 0.1144771, 0.1011755, 0, 0, 0, 1, 1,
0.199445, -0.638891, 2.693417, 1, 1, 1, 1, 1,
0.1999879, 0.6958272, -0.8884538, 1, 1, 1, 1, 1,
0.2083623, 0.6582785, 0.6881852, 1, 1, 1, 1, 1,
0.2132769, -0.1228254, 0.8916126, 1, 1, 1, 1, 1,
0.2147576, -0.1727035, 1.719732, 1, 1, 1, 1, 1,
0.2149069, 1.000139, 2.311418, 1, 1, 1, 1, 1,
0.2208405, -0.3597884, 1.888801, 1, 1, 1, 1, 1,
0.2224215, -2.669542, 2.653291, 1, 1, 1, 1, 1,
0.2234641, -0.8446814, 2.649941, 1, 1, 1, 1, 1,
0.2235651, 0.2833153, 0.7749661, 1, 1, 1, 1, 1,
0.2256002, 0.4988941, 0.189391, 1, 1, 1, 1, 1,
0.2262502, -0.4804973, 3.076805, 1, 1, 1, 1, 1,
0.226454, 1.198034, 0.9010517, 1, 1, 1, 1, 1,
0.2296937, 0.8468261, 0.9081087, 1, 1, 1, 1, 1,
0.2297474, -1.226885, 3.262805, 1, 1, 1, 1, 1,
0.2299518, 0.2591694, 0.7866184, 0, 0, 1, 1, 1,
0.2303275, 0.7765294, 0.8701081, 1, 0, 0, 1, 1,
0.2375213, -1.052954, 1.558978, 1, 0, 0, 1, 1,
0.237709, 1.11607, -0.9071429, 1, 0, 0, 1, 1,
0.238753, -1.30158, 1.822954, 1, 0, 0, 1, 1,
0.2388965, 0.9756667, 0.2200773, 1, 0, 0, 1, 1,
0.2408957, -0.3984126, 3.670659, 0, 0, 0, 1, 1,
0.2520268, 0.6324487, -0.09205005, 0, 0, 0, 1, 1,
0.255828, 0.17138, 0.4998385, 0, 0, 0, 1, 1,
0.2577689, 1.080788, 0.1831468, 0, 0, 0, 1, 1,
0.2607015, 1.129757, 0.6675909, 0, 0, 0, 1, 1,
0.2636071, -1.385204, 3.971549, 0, 0, 0, 1, 1,
0.2644365, -0.1265711, 2.391308, 0, 0, 0, 1, 1,
0.2650378, 0.1164881, 2.80787, 1, 1, 1, 1, 1,
0.267284, 1.272617, 0.339008, 1, 1, 1, 1, 1,
0.26847, -1.147533, 3.664565, 1, 1, 1, 1, 1,
0.2715153, -1.823367, 3.790129, 1, 1, 1, 1, 1,
0.2721265, -1.692576, 4.840582, 1, 1, 1, 1, 1,
0.273384, -0.5364193, 3.788049, 1, 1, 1, 1, 1,
0.2741068, -2.298008, 1.935635, 1, 1, 1, 1, 1,
0.2748012, -0.1278792, 3.720953, 1, 1, 1, 1, 1,
0.2820889, -1.213391, 1.992992, 1, 1, 1, 1, 1,
0.2853461, 1.047135, 1.289, 1, 1, 1, 1, 1,
0.2853695, 0.4375531, -0.3595552, 1, 1, 1, 1, 1,
0.288811, 0.8994629, 0.4700509, 1, 1, 1, 1, 1,
0.2924313, 0.001757571, 0.4484297, 1, 1, 1, 1, 1,
0.2943822, 0.1099226, 0.4669955, 1, 1, 1, 1, 1,
0.2961267, 0.06071292, 1.874471, 1, 1, 1, 1, 1,
0.3087172, -0.6955132, 3.664024, 0, 0, 1, 1, 1,
0.3105416, 0.6460444, -0.02302852, 1, 0, 0, 1, 1,
0.312547, 1.25902, -0.4034571, 1, 0, 0, 1, 1,
0.3136936, -2.369109, 3.658229, 1, 0, 0, 1, 1,
0.3138361, -0.6096482, 2.297615, 1, 0, 0, 1, 1,
0.3169642, -1.739528, 2.149554, 1, 0, 0, 1, 1,
0.3234812, 1.061192, -0.2138944, 0, 0, 0, 1, 1,
0.3281765, -0.1520553, 3.055831, 0, 0, 0, 1, 1,
0.3318143, -1.624386, 2.161601, 0, 0, 0, 1, 1,
0.3340393, -0.5971383, 3.746452, 0, 0, 0, 1, 1,
0.3356595, -0.04568844, 1.295588, 0, 0, 0, 1, 1,
0.3358307, 0.6614291, 0.6288242, 0, 0, 0, 1, 1,
0.3371911, 0.3877476, 0.5491108, 0, 0, 0, 1, 1,
0.3446634, 0.5863131, 0.6367317, 1, 1, 1, 1, 1,
0.3468404, 0.2756923, 0.5876012, 1, 1, 1, 1, 1,
0.3482432, -0.1447961, 0.4528273, 1, 1, 1, 1, 1,
0.3488058, -0.316414, 1.626607, 1, 1, 1, 1, 1,
0.3510971, -0.2616507, 1.393182, 1, 1, 1, 1, 1,
0.3520169, 0.7479304, 1.521031, 1, 1, 1, 1, 1,
0.3539983, -0.1963196, 1.868768, 1, 1, 1, 1, 1,
0.3548931, -0.02047058, 3.084113, 1, 1, 1, 1, 1,
0.3565623, 1.758893, 0.4724025, 1, 1, 1, 1, 1,
0.3590249, -0.05958081, 0.2185073, 1, 1, 1, 1, 1,
0.3687913, 1.146623, 0.3822701, 1, 1, 1, 1, 1,
0.3714329, -1.401125, 3.202846, 1, 1, 1, 1, 1,
0.3899264, -0.9565218, 2.057539, 1, 1, 1, 1, 1,
0.3901923, -0.4031321, 1.66951, 1, 1, 1, 1, 1,
0.3924385, 2.315018, 0.5409269, 1, 1, 1, 1, 1,
0.3937408, 0.6825218, 0.7005825, 0, 0, 1, 1, 1,
0.394306, 1.234061, 0.8034291, 1, 0, 0, 1, 1,
0.3955928, 0.9996906, -0.2509882, 1, 0, 0, 1, 1,
0.397859, 0.7489719, 1.281219, 1, 0, 0, 1, 1,
0.3988503, -0.2656842, 2.44356, 1, 0, 0, 1, 1,
0.4024945, -0.6889905, 1.705877, 1, 0, 0, 1, 1,
0.4050892, 2.770643, -1.207233, 0, 0, 0, 1, 1,
0.4055104, -1.628592, 3.262434, 0, 0, 0, 1, 1,
0.4076893, -0.2790713, 1.774076, 0, 0, 0, 1, 1,
0.4124155, -0.1312376, 2.279572, 0, 0, 0, 1, 1,
0.413008, -0.1086127, 2.037775, 0, 0, 0, 1, 1,
0.413609, -0.4999611, 3.429456, 0, 0, 0, 1, 1,
0.4215419, 0.6274066, 1.247022, 0, 0, 0, 1, 1,
0.4262008, 0.1089984, 0.5898175, 1, 1, 1, 1, 1,
0.4297929, 0.9183769, 2.346183, 1, 1, 1, 1, 1,
0.4332941, -1.379659, 3.935169, 1, 1, 1, 1, 1,
0.4473632, 1.377984, -1.838599, 1, 1, 1, 1, 1,
0.4498918, 0.0481586, 2.4133, 1, 1, 1, 1, 1,
0.4540503, 0.3240051, 0.4412783, 1, 1, 1, 1, 1,
0.4540682, -2.192578, 4.034646, 1, 1, 1, 1, 1,
0.4540798, 0.1294278, 0.6775422, 1, 1, 1, 1, 1,
0.4557502, 1.065276, 0.7264098, 1, 1, 1, 1, 1,
0.4592521, 0.7742416, 0.5878968, 1, 1, 1, 1, 1,
0.460847, -0.001130736, 2.134997, 1, 1, 1, 1, 1,
0.4622183, -0.5889161, 1.947645, 1, 1, 1, 1, 1,
0.4637589, 0.4470748, -1.324142, 1, 1, 1, 1, 1,
0.466378, 0.4399822, 0.1451744, 1, 1, 1, 1, 1,
0.466466, 0.7707835, 0.7199074, 1, 1, 1, 1, 1,
0.467409, 1.393288, 1.263273, 0, 0, 1, 1, 1,
0.4756884, 0.6814163, 1.835359, 1, 0, 0, 1, 1,
0.4758093, 1.306158, 0.2814929, 1, 0, 0, 1, 1,
0.4762524, -1.301385, 4.175607, 1, 0, 0, 1, 1,
0.4768939, -0.6695591, 0.9177164, 1, 0, 0, 1, 1,
0.480406, 0.5852364, -0.2079003, 1, 0, 0, 1, 1,
0.4821225, -1.990679, 3.778273, 0, 0, 0, 1, 1,
0.4840437, 1.144668, -0.2806604, 0, 0, 0, 1, 1,
0.4884458, 0.1087105, 2.084601, 0, 0, 0, 1, 1,
0.4886391, -0.8043086, 1.407158, 0, 0, 0, 1, 1,
0.4922533, 0.7351314, 0.9221987, 0, 0, 0, 1, 1,
0.49775, -2.315686, 4.209606, 0, 0, 0, 1, 1,
0.4997764, -2.54975, 2.73843, 0, 0, 0, 1, 1,
0.5032079, 0.8273771, 0.7215459, 1, 1, 1, 1, 1,
0.5063833, -1.926348, 1.529729, 1, 1, 1, 1, 1,
0.5104194, 0.2187711, 2.297384, 1, 1, 1, 1, 1,
0.5126063, 2.785477, 1.264494, 1, 1, 1, 1, 1,
0.5127247, 1.873761, -1.099866, 1, 1, 1, 1, 1,
0.5134379, 0.7154872, 1.784443, 1, 1, 1, 1, 1,
0.5152403, 1.534126, 1.235347, 1, 1, 1, 1, 1,
0.5189177, -3.041356, 4.646332, 1, 1, 1, 1, 1,
0.5226963, 0.5206715, 1.809297, 1, 1, 1, 1, 1,
0.5285128, 1.348347, 1.558958, 1, 1, 1, 1, 1,
0.5294893, 0.1626803, 1.471313, 1, 1, 1, 1, 1,
0.5299519, 0.7188997, 0.2017277, 1, 1, 1, 1, 1,
0.5350128, 0.7061002, 0.6675553, 1, 1, 1, 1, 1,
0.5362614, 0.5216485, 1.095541, 1, 1, 1, 1, 1,
0.5371447, 0.7266384, -0.6374629, 1, 1, 1, 1, 1,
0.5375739, -1.08088, 1.850218, 0, 0, 1, 1, 1,
0.5398571, 0.5529906, 1.323712, 1, 0, 0, 1, 1,
0.5409506, 0.8781351, 0.5076412, 1, 0, 0, 1, 1,
0.5429691, 0.01233689, -0.4868135, 1, 0, 0, 1, 1,
0.5432753, 0.8208442, 0.2286883, 1, 0, 0, 1, 1,
0.5492678, 0.9590309, -0.3352035, 1, 0, 0, 1, 1,
0.5536929, -0.412939, 1.359, 0, 0, 0, 1, 1,
0.5568827, 0.1373977, 0.4867512, 0, 0, 0, 1, 1,
0.5574405, -0.08390763, 1.282471, 0, 0, 0, 1, 1,
0.5579923, -0.2785385, 2.44643, 0, 0, 0, 1, 1,
0.5610267, 1.523433, -0.7664778, 0, 0, 0, 1, 1,
0.5626342, 0.2784727, 0.6239448, 0, 0, 0, 1, 1,
0.5691475, 0.8863612, 0.8374992, 0, 0, 0, 1, 1,
0.57791, 0.8949025, 2.747967, 1, 1, 1, 1, 1,
0.5791727, -1.245844, 2.684863, 1, 1, 1, 1, 1,
0.5848576, 0.001996059, 0.8373771, 1, 1, 1, 1, 1,
0.5859525, 0.9926186, 0.4744362, 1, 1, 1, 1, 1,
0.5871021, -0.5985063, 1.589007, 1, 1, 1, 1, 1,
0.5903719, 0.7168038, 0.03421405, 1, 1, 1, 1, 1,
0.5927162, 0.09633191, 1.814743, 1, 1, 1, 1, 1,
0.5938256, 0.006675072, 2.316763, 1, 1, 1, 1, 1,
0.5939785, 0.1017786, 1.323185, 1, 1, 1, 1, 1,
0.5973708, 0.2315561, 1.122739, 1, 1, 1, 1, 1,
0.5978265, 1.362117, 0.2148565, 1, 1, 1, 1, 1,
0.6014906, -0.008863312, 1.430346, 1, 1, 1, 1, 1,
0.6055763, -0.07396688, 3.598655, 1, 1, 1, 1, 1,
0.6059957, -0.6100627, 1.581979, 1, 1, 1, 1, 1,
0.6086342, 2.089268, 1.184956, 1, 1, 1, 1, 1,
0.6104946, -0.6146712, 2.182111, 0, 0, 1, 1, 1,
0.6111267, -0.3101375, 2.752096, 1, 0, 0, 1, 1,
0.6118079, -0.371876, -0.1393113, 1, 0, 0, 1, 1,
0.6152277, -0.5223041, 0.01838157, 1, 0, 0, 1, 1,
0.6161798, 0.8323421, -0.1832033, 1, 0, 0, 1, 1,
0.6186356, -1.635245, 3.689014, 1, 0, 0, 1, 1,
0.6187066, -0.7674097, 0.775051, 0, 0, 0, 1, 1,
0.630536, -0.6438187, 2.524112, 0, 0, 0, 1, 1,
0.6336499, -0.9594452, 3.733674, 0, 0, 0, 1, 1,
0.6344319, -0.1876553, 3.097234, 0, 0, 0, 1, 1,
0.6365576, -0.1291171, 2.302359, 0, 0, 0, 1, 1,
0.6400647, -0.3721968, 1.788462, 0, 0, 0, 1, 1,
0.6414225, -2.20278, 3.244005, 0, 0, 0, 1, 1,
0.6430904, -0.1328238, 1.400723, 1, 1, 1, 1, 1,
0.6433165, 0.5553243, 0.3617447, 1, 1, 1, 1, 1,
0.6468681, 0.2328931, 0.8620735, 1, 1, 1, 1, 1,
0.6521707, 0.5437993, 0.08615181, 1, 1, 1, 1, 1,
0.6529336, 0.2296611, 2.810633, 1, 1, 1, 1, 1,
0.6557577, -0.2788862, 2.130703, 1, 1, 1, 1, 1,
0.6561973, -1.290903, 1.698406, 1, 1, 1, 1, 1,
0.6659718, -1.044519, 3.353915, 1, 1, 1, 1, 1,
0.6687036, -1.213865, 2.948049, 1, 1, 1, 1, 1,
0.6699365, -1.486735, 0.7520638, 1, 1, 1, 1, 1,
0.6705547, 0.02709112, 2.362976, 1, 1, 1, 1, 1,
0.673373, 0.4430157, 0.6292408, 1, 1, 1, 1, 1,
0.6783031, 0.8506857, 1.939725, 1, 1, 1, 1, 1,
0.6835122, -0.2205974, 3.191863, 1, 1, 1, 1, 1,
0.6862733, -1.4741, 2.588618, 1, 1, 1, 1, 1,
0.6881256, -0.6075856, 0.1083224, 0, 0, 1, 1, 1,
0.6913218, 0.2588121, 0.8091463, 1, 0, 0, 1, 1,
0.6931599, 0.2452818, 1.200427, 1, 0, 0, 1, 1,
0.6938361, -0.8628746, 2.046718, 1, 0, 0, 1, 1,
0.6944876, -1.578426, 1.740457, 1, 0, 0, 1, 1,
0.6988061, -0.3435475, 1.012427, 1, 0, 0, 1, 1,
0.6993031, -0.5953676, 3.104811, 0, 0, 0, 1, 1,
0.7039378, -0.298871, 1.346018, 0, 0, 0, 1, 1,
0.7141912, 2.02446, 0.04278603, 0, 0, 0, 1, 1,
0.7172649, -0.008611281, 0.8180034, 0, 0, 0, 1, 1,
0.7189276, -1.535512, 2.45515, 0, 0, 0, 1, 1,
0.7204397, 0.2596039, 1.717822, 0, 0, 0, 1, 1,
0.723586, 1.199071, -1.182128, 0, 0, 0, 1, 1,
0.7270394, -0.1351882, 0.9000021, 1, 1, 1, 1, 1,
0.7283589, -0.7848779, 1.900737, 1, 1, 1, 1, 1,
0.7330601, 1.087316, 1.202871, 1, 1, 1, 1, 1,
0.74023, 2.731274, -0.646746, 1, 1, 1, 1, 1,
0.7438904, 0.2235678, 3.401159, 1, 1, 1, 1, 1,
0.7466595, -0.6305478, 1.103916, 1, 1, 1, 1, 1,
0.7618235, -1.186935, 2.880985, 1, 1, 1, 1, 1,
0.7638944, -0.2445304, 1.752724, 1, 1, 1, 1, 1,
0.764791, 0.6139849, 0.2962131, 1, 1, 1, 1, 1,
0.7717096, -0.3200852, 2.30184, 1, 1, 1, 1, 1,
0.7734619, 0.3237105, 2.860069, 1, 1, 1, 1, 1,
0.7746393, 0.477179, 0.6950742, 1, 1, 1, 1, 1,
0.7756617, -1.447518, 2.381613, 1, 1, 1, 1, 1,
0.7776265, -0.2757833, 0.3327423, 1, 1, 1, 1, 1,
0.7814695, -0.7497341, 2.016447, 1, 1, 1, 1, 1,
0.783296, 0.02000986, 3.151065, 0, 0, 1, 1, 1,
0.7846681, 1.334779, 0.8933759, 1, 0, 0, 1, 1,
0.7851263, 1.459379, -0.1250293, 1, 0, 0, 1, 1,
0.7851511, 0.3011109, 0.7577908, 1, 0, 0, 1, 1,
0.7863941, -0.2947757, 1.820927, 1, 0, 0, 1, 1,
0.7916201, -0.02638524, 1.698639, 1, 0, 0, 1, 1,
0.7958382, 0.7267265, 1.860898, 0, 0, 0, 1, 1,
0.8019497, -0.01045188, 0.449656, 0, 0, 0, 1, 1,
0.8021791, 0.116346, 1.683354, 0, 0, 0, 1, 1,
0.8096615, -1.420054, 2.480536, 0, 0, 0, 1, 1,
0.8180359, -0.4860282, 3.178999, 0, 0, 0, 1, 1,
0.8211033, -0.7736056, 3.333928, 0, 0, 0, 1, 1,
0.8263651, 1.162356, 0.5547083, 0, 0, 0, 1, 1,
0.8341209, -2.194693, 1.998889, 1, 1, 1, 1, 1,
0.8345211, 0.6375071, 0.8001575, 1, 1, 1, 1, 1,
0.8365263, -0.337486, 1.222672, 1, 1, 1, 1, 1,
0.8369353, -0.4373703, 2.817732, 1, 1, 1, 1, 1,
0.8377695, 0.6171669, 2.082447, 1, 1, 1, 1, 1,
0.8396699, -0.3709428, 1.493073, 1, 1, 1, 1, 1,
0.8403282, 0.3686613, 2.367195, 1, 1, 1, 1, 1,
0.8407047, 0.4062791, 1.392468, 1, 1, 1, 1, 1,
0.8407292, 0.7957524, -0.4617131, 1, 1, 1, 1, 1,
0.8422545, 0.3758441, -0.3815291, 1, 1, 1, 1, 1,
0.8451424, -1.956386, 3.5807, 1, 1, 1, 1, 1,
0.8469557, -0.9034278, 1.853653, 1, 1, 1, 1, 1,
0.8567109, -0.4045688, 1.760714, 1, 1, 1, 1, 1,
0.8591304, -2.046785, 1.893158, 1, 1, 1, 1, 1,
0.8614722, -2.793951, 2.647762, 1, 1, 1, 1, 1,
0.8721892, -0.3614945, 0.584667, 0, 0, 1, 1, 1,
0.8732952, 0.6089835, -0.4659546, 1, 0, 0, 1, 1,
0.877115, -0.6598022, 1.964405, 1, 0, 0, 1, 1,
0.8801816, 1.264364, 0.1865013, 1, 0, 0, 1, 1,
0.8835325, -1.779263, 1.558389, 1, 0, 0, 1, 1,
0.8871678, -0.2904459, 1.241737, 1, 0, 0, 1, 1,
0.8878829, -1.847087, 1.755743, 0, 0, 0, 1, 1,
0.8890542, 2.5243, 0.9196483, 0, 0, 0, 1, 1,
0.8921832, -0.07448955, 1.373447, 0, 0, 0, 1, 1,
0.8964396, -0.5399088, 0.8402815, 0, 0, 0, 1, 1,
0.8981709, -0.5960152, 3.356544, 0, 0, 0, 1, 1,
0.9065278, 0.6031271, 2.882319, 0, 0, 0, 1, 1,
0.9128521, -0.08178737, 2.0378, 0, 0, 0, 1, 1,
0.9131361, 0.6251708, -1.343499, 1, 1, 1, 1, 1,
0.9138475, -0.255534, 0.1159276, 1, 1, 1, 1, 1,
0.9183038, 1.343548, 1.648813, 1, 1, 1, 1, 1,
0.9221204, 2.24587, 0.9274941, 1, 1, 1, 1, 1,
0.9223965, -0.7831847, 2.907957, 1, 1, 1, 1, 1,
0.9277202, 0.4890395, -0.1947656, 1, 1, 1, 1, 1,
0.9355397, -0.6003664, 1.450338, 1, 1, 1, 1, 1,
0.9372178, -0.6569732, 2.96684, 1, 1, 1, 1, 1,
0.9384755, 0.1068649, 0.7294691, 1, 1, 1, 1, 1,
0.9404611, 0.05058057, 1.03107, 1, 1, 1, 1, 1,
0.9445325, -0.1933989, 1.925004, 1, 1, 1, 1, 1,
0.9460899, 0.678782, -0.2306098, 1, 1, 1, 1, 1,
0.9561679, -0.9173596, 3.591181, 1, 1, 1, 1, 1,
0.9604806, 0.110822, 2.024312, 1, 1, 1, 1, 1,
0.9618818, -0.6334375, 1.835586, 1, 1, 1, 1, 1,
0.9694012, -1.503704, 2.272097, 0, 0, 1, 1, 1,
0.9705062, 0.7523974, 0.42595, 1, 0, 0, 1, 1,
0.9719834, -1.248825, 3.02416, 1, 0, 0, 1, 1,
0.982766, 0.1286562, 1.284354, 1, 0, 0, 1, 1,
0.9971666, -0.9664224, 4.402162, 1, 0, 0, 1, 1,
1.002654, -0.9993162, 2.040919, 1, 0, 0, 1, 1,
1.003399, 1.932758, -0.1314904, 0, 0, 0, 1, 1,
1.009585, -0.0204235, 2.295713, 0, 0, 0, 1, 1,
1.018435, 0.3616996, 0.6227801, 0, 0, 0, 1, 1,
1.018488, -1.6717, 2.001106, 0, 0, 0, 1, 1,
1.025278, 0.239739, 0.6757073, 0, 0, 0, 1, 1,
1.035521, -0.3746367, 3.473291, 0, 0, 0, 1, 1,
1.051573, 0.5519903, 1.188208, 0, 0, 0, 1, 1,
1.056571, -0.2788087, 1.585054, 1, 1, 1, 1, 1,
1.061874, -0.1503261, 1.610809, 1, 1, 1, 1, 1,
1.064531, 0.4235091, 0.2422317, 1, 1, 1, 1, 1,
1.065971, -0.3035547, 0.1431065, 1, 1, 1, 1, 1,
1.068103, 0.5559441, 0.5919386, 1, 1, 1, 1, 1,
1.070186, -1.172296, 2.960192, 1, 1, 1, 1, 1,
1.077825, 1.001948, 0.9705024, 1, 1, 1, 1, 1,
1.09498, 0.5031106, 1.701926, 1, 1, 1, 1, 1,
1.099148, -0.9508581, 1.800864, 1, 1, 1, 1, 1,
1.103011, -1.845024, 4.219001, 1, 1, 1, 1, 1,
1.104005, 0.09641401, 2.40531, 1, 1, 1, 1, 1,
1.105713, 0.005501283, 1.392381, 1, 1, 1, 1, 1,
1.109468, 0.1712017, 0.01637845, 1, 1, 1, 1, 1,
1.114351, -1.302512, 2.836111, 1, 1, 1, 1, 1,
1.114618, 0.3473012, -0.3811634, 1, 1, 1, 1, 1,
1.114879, 1.098614, 0.9466813, 0, 0, 1, 1, 1,
1.117785, 0.267115, 1.460338, 1, 0, 0, 1, 1,
1.12007, 0.5812343, 1.496848, 1, 0, 0, 1, 1,
1.123658, -0.3856573, 1.644379, 1, 0, 0, 1, 1,
1.137664, -1.841521, 0.01556579, 1, 0, 0, 1, 1,
1.158821, -0.8793182, 3.991817, 1, 0, 0, 1, 1,
1.16453, -0.3326779, 1.197999, 0, 0, 0, 1, 1,
1.175506, -0.6387796, 1.472613, 0, 0, 0, 1, 1,
1.179284, 0.02404165, 0.04766288, 0, 0, 0, 1, 1,
1.179826, -0.6647146, 2.925554, 0, 0, 0, 1, 1,
1.184799, 0.8631694, 2.431695, 0, 0, 0, 1, 1,
1.186439, 0.9139093, 2.149625, 0, 0, 0, 1, 1,
1.19262, -0.3858179, 3.252962, 0, 0, 0, 1, 1,
1.196568, 0.8809148, 0.2137174, 1, 1, 1, 1, 1,
1.198222, 0.5296475, 1.154991, 1, 1, 1, 1, 1,
1.203197, -0.892802, 3.208212, 1, 1, 1, 1, 1,
1.214938, -1.363902, 1.560268, 1, 1, 1, 1, 1,
1.222504, -0.4782819, 2.193551, 1, 1, 1, 1, 1,
1.223759, 1.417761, 0.6423169, 1, 1, 1, 1, 1,
1.227725, 0.6124847, 0.4502492, 1, 1, 1, 1, 1,
1.231965, -0.2877472, 2.285142, 1, 1, 1, 1, 1,
1.237024, 1.802135, 1.65945, 1, 1, 1, 1, 1,
1.242108, -0.9124931, 2.345235, 1, 1, 1, 1, 1,
1.256597, -0.008832361, 2.114222, 1, 1, 1, 1, 1,
1.278537, 0.6834741, 1.304198, 1, 1, 1, 1, 1,
1.279488, -0.3315699, 2.082057, 1, 1, 1, 1, 1,
1.284275, -0.840404, 2.069831, 1, 1, 1, 1, 1,
1.28519, -0.2600517, 1.510014, 1, 1, 1, 1, 1,
1.285234, 0.2569227, 2.074564, 0, 0, 1, 1, 1,
1.309284, -0.1697415, 1.610009, 1, 0, 0, 1, 1,
1.309924, -1.140899, 1.119225, 1, 0, 0, 1, 1,
1.313431, 0.3488499, 0.9824226, 1, 0, 0, 1, 1,
1.31353, 0.03068372, 2.147063, 1, 0, 0, 1, 1,
1.322904, 0.5861957, 0.3112057, 1, 0, 0, 1, 1,
1.325909, 0.5920846, 1.064285, 0, 0, 0, 1, 1,
1.328146, -0.4154252, 1.972084, 0, 0, 0, 1, 1,
1.336795, -1.399737, 3.107914, 0, 0, 0, 1, 1,
1.345296, -0.8469851, 2.829078, 0, 0, 0, 1, 1,
1.358585, 0.8226339, 0.1283222, 0, 0, 0, 1, 1,
1.360077, -0.2857388, 2.392824, 0, 0, 0, 1, 1,
1.360386, 0.7285165, 1.300063, 0, 0, 0, 1, 1,
1.37903, -1.003642, 2.93775, 1, 1, 1, 1, 1,
1.394195, -1.305999, 2.697743, 1, 1, 1, 1, 1,
1.395306, -0.1283443, 0.6725203, 1, 1, 1, 1, 1,
1.411585, -0.8398044, 1.84305, 1, 1, 1, 1, 1,
1.412105, -1.801782, 3.790461, 1, 1, 1, 1, 1,
1.417524, -0.01657416, 1.962548, 1, 1, 1, 1, 1,
1.424047, 0.2190619, 1.163265, 1, 1, 1, 1, 1,
1.430728, -0.06337342, -0.4127449, 1, 1, 1, 1, 1,
1.44577, 0.2265329, 2.400555, 1, 1, 1, 1, 1,
1.446119, 0.3003502, -0.5653542, 1, 1, 1, 1, 1,
1.463801, 0.5626093, -0.3420833, 1, 1, 1, 1, 1,
1.468375, 1.002743, 2.966696, 1, 1, 1, 1, 1,
1.475639, -0.07614506, 1.837166, 1, 1, 1, 1, 1,
1.47795, -0.838564, 1.506299, 1, 1, 1, 1, 1,
1.4792, -0.1409355, 2.065427, 1, 1, 1, 1, 1,
1.482824, -1.153949, 1.64085, 0, 0, 1, 1, 1,
1.488681, 0.4531579, -1.147478, 1, 0, 0, 1, 1,
1.494263, 0.02603565, 0.0414947, 1, 0, 0, 1, 1,
1.497194, -0.3163125, 2.147468, 1, 0, 0, 1, 1,
1.516544, -0.4233122, 3.560585, 1, 0, 0, 1, 1,
1.525343, -1.19826, 2.565645, 1, 0, 0, 1, 1,
1.531702, 0.4837564, 0.5407809, 0, 0, 0, 1, 1,
1.538307, 1.142563, 0.8307141, 0, 0, 0, 1, 1,
1.544061, -0.566669, 3.659707, 0, 0, 0, 1, 1,
1.553273, 0.09252556, 1.626971, 0, 0, 0, 1, 1,
1.580846, -0.2875314, 2.04528, 0, 0, 0, 1, 1,
1.581162, -1.024695, 4.308583, 0, 0, 0, 1, 1,
1.613237, -0.9570651, 0.7313744, 0, 0, 0, 1, 1,
1.617777, -0.03841897, 2.937485, 1, 1, 1, 1, 1,
1.624799, -0.8478745, 1.764376, 1, 1, 1, 1, 1,
1.626954, 1.268921, 1.063006, 1, 1, 1, 1, 1,
1.639664, 1.744413, 1.944571, 1, 1, 1, 1, 1,
1.643192, 0.08175363, 1.461415, 1, 1, 1, 1, 1,
1.66907, -0.9620322, 1.860871, 1, 1, 1, 1, 1,
1.671356, 1.034308, 0.7301335, 1, 1, 1, 1, 1,
1.684792, 0.2052283, 1.85804, 1, 1, 1, 1, 1,
1.69602, 1.073813, 3.07481, 1, 1, 1, 1, 1,
1.698329, 0.6759695, 1.383316, 1, 1, 1, 1, 1,
1.708779, -0.9883834, 3.015575, 1, 1, 1, 1, 1,
1.748298, -1.908054, 1.712129, 1, 1, 1, 1, 1,
1.749473, 0.1036476, 2.383248, 1, 1, 1, 1, 1,
1.769839, 0.2748262, 1.097914, 1, 1, 1, 1, 1,
1.777478, -0.1784586, 0.1550431, 1, 1, 1, 1, 1,
1.802802, 0.4440449, 0.5307002, 0, 0, 1, 1, 1,
1.815371, -0.6132908, 2.010891, 1, 0, 0, 1, 1,
1.835374, -0.7711768, 0.8781255, 1, 0, 0, 1, 1,
1.851226, -0.3573788, 0.9574893, 1, 0, 0, 1, 1,
1.853868, 1.04708, 1.046824, 1, 0, 0, 1, 1,
1.856224, -0.4534198, 2.142398, 1, 0, 0, 1, 1,
1.864598, 0.09257484, 1.929753, 0, 0, 0, 1, 1,
1.876991, -0.1662651, 1.402315, 0, 0, 0, 1, 1,
1.880763, 0.2593217, 3.133498, 0, 0, 0, 1, 1,
1.893414, -1.783495, 3.362821, 0, 0, 0, 1, 1,
1.901292, -0.3792202, 2.120014, 0, 0, 0, 1, 1,
1.929078, 0.6486453, 0.8465394, 0, 0, 0, 1, 1,
1.938357, -0.09922591, 0.9227169, 0, 0, 0, 1, 1,
1.939255, 0.3286876, -1.544555, 1, 1, 1, 1, 1,
1.945463, 1.13838, 2.067936, 1, 1, 1, 1, 1,
1.955586, -0.1880207, 1.419382, 1, 1, 1, 1, 1,
1.96863, -0.007305828, 2.154081, 1, 1, 1, 1, 1,
1.969577, -0.2139916, 2.41428, 1, 1, 1, 1, 1,
1.98796, 1.515825, 0.9078579, 1, 1, 1, 1, 1,
2.0002, -0.987469, 1.580192, 1, 1, 1, 1, 1,
2.013783, 1.548787, 3.331564, 1, 1, 1, 1, 1,
2.06903, -0.9704701, 2.31539, 1, 1, 1, 1, 1,
2.093246, 0.1668436, 3.503707, 1, 1, 1, 1, 1,
2.107266, 0.1503286, 0.2942755, 1, 1, 1, 1, 1,
2.109431, 0.4292758, 1.166796, 1, 1, 1, 1, 1,
2.13077, -0.4689057, 3.043833, 1, 1, 1, 1, 1,
2.13628, 1.147815, 1.253958, 1, 1, 1, 1, 1,
2.162673, -1.09258, 0.5694409, 1, 1, 1, 1, 1,
2.175645, 0.9462962, 1.085819, 0, 0, 1, 1, 1,
2.178725, -0.8407254, 1.81607, 1, 0, 0, 1, 1,
2.192761, 0.4638274, 0.7182958, 1, 0, 0, 1, 1,
2.249173, -0.1746258, 1.171976, 1, 0, 0, 1, 1,
2.252435, 0.5444122, 2.010347, 1, 0, 0, 1, 1,
2.257177, -0.6497458, 3.486567, 1, 0, 0, 1, 1,
2.282966, 1.889012, 1.72718, 0, 0, 0, 1, 1,
2.301443, -0.9659982, 2.533479, 0, 0, 0, 1, 1,
2.342949, 1.115096, 0.9352369, 0, 0, 0, 1, 1,
2.372773, 0.6848447, 2.281104, 0, 0, 0, 1, 1,
2.418189, -1.560569, 1.865312, 0, 0, 0, 1, 1,
2.463809, 0.2370892, -0.4599955, 0, 0, 0, 1, 1,
2.465223, 0.6230994, 1.645193, 0, 0, 0, 1, 1,
2.55738, -0.7450936, 0.9213735, 1, 1, 1, 1, 1,
2.560472, 1.006135, 2.484619, 1, 1, 1, 1, 1,
2.657596, 1.133465, 0.5783412, 1, 1, 1, 1, 1,
2.683854, 0.5157693, -0.9474227, 1, 1, 1, 1, 1,
2.780034, -0.3696615, 1.344009, 1, 1, 1, 1, 1,
2.968239, -0.4163406, 0.5055079, 1, 1, 1, 1, 1,
3.272285, 2.057841, 2.089481, 1, 1, 1, 1, 1
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
var radius = 9.914307;
var distance = 34.82358;
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
mvMatrix.translate( -0.1552368, 0.1279396, -0.3928416 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.82358);
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
