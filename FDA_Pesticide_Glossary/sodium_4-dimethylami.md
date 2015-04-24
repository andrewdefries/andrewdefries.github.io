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
-3.419195, -1.435375, -1.554584, 1, 0, 0, 1,
-3.414783, 1.040047, -0.7990277, 1, 0.007843138, 0, 1,
-3.387047, -0.07931854, -3.853204, 1, 0.01176471, 0, 1,
-3.353794, 0.9317464, -1.779865, 1, 0.01960784, 0, 1,
-2.82033, -1.046568, -1.790806, 1, 0.02352941, 0, 1,
-2.720203, -0.5012313, -3.839507, 1, 0.03137255, 0, 1,
-2.68163, -0.7748597, -1.918219, 1, 0.03529412, 0, 1,
-2.615175, -0.03208124, -1.719913, 1, 0.04313726, 0, 1,
-2.612755, 0.2237148, -1.006742, 1, 0.04705882, 0, 1,
-2.523026, 1.437929, 0.08097599, 1, 0.05490196, 0, 1,
-2.444208, 0.05988039, -0.9678468, 1, 0.05882353, 0, 1,
-2.388858, 1.143575, -2.124004, 1, 0.06666667, 0, 1,
-2.348875, 1.264878, 0.1585508, 1, 0.07058824, 0, 1,
-2.246124, -0.4677598, -1.088377, 1, 0.07843138, 0, 1,
-2.235547, 0.1583785, -1.588868, 1, 0.08235294, 0, 1,
-2.232818, -0.3135367, -0.9171904, 1, 0.09019608, 0, 1,
-2.223631, -0.9454067, -1.013632, 1, 0.09411765, 0, 1,
-2.203742, -1.031893, -2.40717, 1, 0.1019608, 0, 1,
-2.196875, 0.86961, -1.799562, 1, 0.1098039, 0, 1,
-2.19443, -0.5659335, -1.417419, 1, 0.1137255, 0, 1,
-2.169569, -0.7343113, -2.037206, 1, 0.1215686, 0, 1,
-2.118633, -1.588801, -2.71321, 1, 0.1254902, 0, 1,
-2.086367, 0.4943027, -0.6527709, 1, 0.1333333, 0, 1,
-2.062757, -1.198083, 0.2890939, 1, 0.1372549, 0, 1,
-2.040799, 0.8909013, -1.734838, 1, 0.145098, 0, 1,
-1.999182, 0.846203, -0.4024403, 1, 0.1490196, 0, 1,
-1.914385, 0.8687481, -1.968684, 1, 0.1568628, 0, 1,
-1.898496, 0.129172, 0.1793398, 1, 0.1607843, 0, 1,
-1.876413, 0.07318987, -1.807609, 1, 0.1686275, 0, 1,
-1.862019, 0.02968248, -2.412827, 1, 0.172549, 0, 1,
-1.850736, -0.5734927, -1.554975, 1, 0.1803922, 0, 1,
-1.833763, -0.7386737, -2.069057, 1, 0.1843137, 0, 1,
-1.833057, -0.6501092, -1.884193, 1, 0.1921569, 0, 1,
-1.824844, -0.09062972, -1.184495, 1, 0.1960784, 0, 1,
-1.818186, 2.872277, -0.8515936, 1, 0.2039216, 0, 1,
-1.807527, 0.2020751, -2.193074, 1, 0.2117647, 0, 1,
-1.795128, -0.2236806, -2.126009, 1, 0.2156863, 0, 1,
-1.781072, -0.2685454, -1.097511, 1, 0.2235294, 0, 1,
-1.781052, 0.5686113, -1.874255, 1, 0.227451, 0, 1,
-1.777426, -1.071002, -2.304451, 1, 0.2352941, 0, 1,
-1.772723, -1.717232, -2.346222, 1, 0.2392157, 0, 1,
-1.763589, 0.2434854, -1.014151, 1, 0.2470588, 0, 1,
-1.749224, 2.233201, -2.143087, 1, 0.2509804, 0, 1,
-1.735993, 0.8791464, -3.992791, 1, 0.2588235, 0, 1,
-1.724475, 1.738809, -0.8131002, 1, 0.2627451, 0, 1,
-1.724229, 0.4735662, -3.51656, 1, 0.2705882, 0, 1,
-1.688708, -0.09391438, -0.9503494, 1, 0.2745098, 0, 1,
-1.681592, -0.1888953, -1.104751, 1, 0.282353, 0, 1,
-1.676384, -0.6909897, -3.228969, 1, 0.2862745, 0, 1,
-1.668732, -0.4285614, -0.6976808, 1, 0.2941177, 0, 1,
-1.660465, -0.5487695, -3.831675, 1, 0.3019608, 0, 1,
-1.657633, -0.5126811, -1.602329, 1, 0.3058824, 0, 1,
-1.657008, 0.3881568, -1.924124, 1, 0.3137255, 0, 1,
-1.655433, 0.5421172, -0.7693964, 1, 0.3176471, 0, 1,
-1.647144, -0.5624639, -3.091589, 1, 0.3254902, 0, 1,
-1.642722, 1.144878, -1.291949, 1, 0.3294118, 0, 1,
-1.639868, 2.424965, 1.228446, 1, 0.3372549, 0, 1,
-1.636588, -2.894485, -3.402245, 1, 0.3411765, 0, 1,
-1.617553, -0.1095648, -1.924069, 1, 0.3490196, 0, 1,
-1.596497, 0.3111375, -1.358236, 1, 0.3529412, 0, 1,
-1.589266, 0.5592973, -2.133266, 1, 0.3607843, 0, 1,
-1.572581, -0.3878019, -0.6306515, 1, 0.3647059, 0, 1,
-1.571657, 0.1511152, -1.071653, 1, 0.372549, 0, 1,
-1.563608, 1.54452, -2.331547, 1, 0.3764706, 0, 1,
-1.563225, -1.081388, -2.184332, 1, 0.3843137, 0, 1,
-1.562692, 0.7393561, -0.0429479, 1, 0.3882353, 0, 1,
-1.562546, 1.788324, -0.01764592, 1, 0.3960784, 0, 1,
-1.562328, -0.3919991, -1.532039, 1, 0.4039216, 0, 1,
-1.556012, 0.03710118, -0.2232868, 1, 0.4078431, 0, 1,
-1.537438, -0.04013488, -0.1373017, 1, 0.4156863, 0, 1,
-1.507964, -1.549512, -2.041345, 1, 0.4196078, 0, 1,
-1.50242, 0.6607974, -1.752785, 1, 0.427451, 0, 1,
-1.499786, -0.3568518, -1.243872, 1, 0.4313726, 0, 1,
-1.480393, -0.7584959, -2.947672, 1, 0.4392157, 0, 1,
-1.472372, -0.3756537, -1.592636, 1, 0.4431373, 0, 1,
-1.464629, 0.2178187, -1.879762, 1, 0.4509804, 0, 1,
-1.462218, -0.6632513, -3.120908, 1, 0.454902, 0, 1,
-1.456517, 0.1836368, -0.6509051, 1, 0.4627451, 0, 1,
-1.455172, 1.384512, 0.0882661, 1, 0.4666667, 0, 1,
-1.451759, 1.554729, -2.438904, 1, 0.4745098, 0, 1,
-1.427654, 3.20446, -0.2456287, 1, 0.4784314, 0, 1,
-1.421403, -0.8758588, -1.529622, 1, 0.4862745, 0, 1,
-1.420056, -0.1227832, -2.906247, 1, 0.4901961, 0, 1,
-1.415255, -1.316956, -0.6739119, 1, 0.4980392, 0, 1,
-1.394502, -1.265619, -3.213623, 1, 0.5058824, 0, 1,
-1.38617, -0.9934509, -3.890207, 1, 0.509804, 0, 1,
-1.371058, -1.303134, -2.854598, 1, 0.5176471, 0, 1,
-1.367747, 0.9586635, 0.1080627, 1, 0.5215687, 0, 1,
-1.366566, -2.429985, -3.220925, 1, 0.5294118, 0, 1,
-1.35926, -1.105559, -1.88426, 1, 0.5333334, 0, 1,
-1.348823, 0.07933258, -0.6803482, 1, 0.5411765, 0, 1,
-1.341538, -1.538492, -2.797889, 1, 0.5450981, 0, 1,
-1.341377, -0.9814982, -3.394477, 1, 0.5529412, 0, 1,
-1.340315, 0.3107406, -1.777148, 1, 0.5568628, 0, 1,
-1.339575, 0.6797197, -0.9090845, 1, 0.5647059, 0, 1,
-1.311933, 0.3416277, -3.504478, 1, 0.5686275, 0, 1,
-1.31045, -1.712244, -2.090105, 1, 0.5764706, 0, 1,
-1.303038, -0.6614579, -1.724159, 1, 0.5803922, 0, 1,
-1.297497, 1.46577, -2.284427, 1, 0.5882353, 0, 1,
-1.29593, 0.2753012, -2.231891, 1, 0.5921569, 0, 1,
-1.282727, -1.893834, -3.017406, 1, 0.6, 0, 1,
-1.282474, -0.2916326, -1.019532, 1, 0.6078432, 0, 1,
-1.272775, 0.1251112, -0.7757068, 1, 0.6117647, 0, 1,
-1.272723, -1.308184, -3.326258, 1, 0.6196079, 0, 1,
-1.263147, -2.033905, -2.741615, 1, 0.6235294, 0, 1,
-1.256075, -0.2254455, -2.327671, 1, 0.6313726, 0, 1,
-1.251642, 0.8679857, -0.6762558, 1, 0.6352941, 0, 1,
-1.250323, -1.773466, -2.469883, 1, 0.6431373, 0, 1,
-1.246091, -0.07041355, -1.484583, 1, 0.6470588, 0, 1,
-1.245239, -0.6076403, -1.932077, 1, 0.654902, 0, 1,
-1.241963, -0.04603537, -1.837345, 1, 0.6588235, 0, 1,
-1.24136, -1.16316, -1.154931, 1, 0.6666667, 0, 1,
-1.236322, -0.7829547, -3.087545, 1, 0.6705883, 0, 1,
-1.213941, 0.8132049, -1.812073, 1, 0.6784314, 0, 1,
-1.211219, -1.263631, -1.786486, 1, 0.682353, 0, 1,
-1.208529, -0.9875844, -3.35668, 1, 0.6901961, 0, 1,
-1.207823, 0.2915306, -1.27912, 1, 0.6941177, 0, 1,
-1.206155, -0.7456397, -3.548298, 1, 0.7019608, 0, 1,
-1.204139, -0.3383681, -2.800356, 1, 0.7098039, 0, 1,
-1.200651, 0.6274531, -0.462126, 1, 0.7137255, 0, 1,
-1.197485, -0.0518611, -1.863851, 1, 0.7215686, 0, 1,
-1.186246, 1.93303, 0.1691465, 1, 0.7254902, 0, 1,
-1.182814, 0.4992839, -1.629462, 1, 0.7333333, 0, 1,
-1.181673, -1.71432, -2.925884, 1, 0.7372549, 0, 1,
-1.181292, 1.306141, 1.1753, 1, 0.7450981, 0, 1,
-1.179577, -0.9305421, -0.9500484, 1, 0.7490196, 0, 1,
-1.177053, 1.246703, -2.658902, 1, 0.7568628, 0, 1,
-1.172746, -1.192722, -2.791563, 1, 0.7607843, 0, 1,
-1.171562, 0.4108631, -0.01436102, 1, 0.7686275, 0, 1,
-1.168527, -2.685511, -2.36603, 1, 0.772549, 0, 1,
-1.16797, -0.6716561, -2.269233, 1, 0.7803922, 0, 1,
-1.166939, 0.108449, -1.437036, 1, 0.7843137, 0, 1,
-1.153056, 1.059935, 0.135332, 1, 0.7921569, 0, 1,
-1.151933, -0.6853427, -3.604841, 1, 0.7960784, 0, 1,
-1.149709, 0.1273813, -0.5110049, 1, 0.8039216, 0, 1,
-1.143222, -1.142343, -2.817939, 1, 0.8117647, 0, 1,
-1.142268, 2.557027, -0.9351109, 1, 0.8156863, 0, 1,
-1.139262, 1.185468, -1.615261, 1, 0.8235294, 0, 1,
-1.137304, 1.850658, -1.772578, 1, 0.827451, 0, 1,
-1.12917, 1.028068, -0.2096582, 1, 0.8352941, 0, 1,
-1.128677, -0.5210534, -3.156739, 1, 0.8392157, 0, 1,
-1.127124, 2.320441, 1.090962, 1, 0.8470588, 0, 1,
-1.122917, -0.6983519, -2.258881, 1, 0.8509804, 0, 1,
-1.115748, -2.169665, -2.615905, 1, 0.8588235, 0, 1,
-1.110899, 0.7470981, -0.4132442, 1, 0.8627451, 0, 1,
-1.105678, -1.918225, -1.81829, 1, 0.8705882, 0, 1,
-1.105233, -0.4610745, -1.218632, 1, 0.8745098, 0, 1,
-1.105005, -0.1203953, -1.632335, 1, 0.8823529, 0, 1,
-1.103791, 0.008897145, -1.005029, 1, 0.8862745, 0, 1,
-1.093241, 1.492519, -0.6223427, 1, 0.8941177, 0, 1,
-1.074742, 0.9732822, -0.5663632, 1, 0.8980392, 0, 1,
-1.067955, 0.495013, -1.724328, 1, 0.9058824, 0, 1,
-1.065404, 0.117289, -1.771907, 1, 0.9137255, 0, 1,
-1.065357, 0.5201914, -0.5332158, 1, 0.9176471, 0, 1,
-1.05582, -0.1430776, -0.8850854, 1, 0.9254902, 0, 1,
-1.052678, 1.455939, -1.042323, 1, 0.9294118, 0, 1,
-1.044906, -0.9618334, -2.957172, 1, 0.9372549, 0, 1,
-1.043645, 0.945143, -0.6274294, 1, 0.9411765, 0, 1,
-1.039581, -0.5114209, -2.916736, 1, 0.9490196, 0, 1,
-1.022089, -0.2919184, -3.18086, 1, 0.9529412, 0, 1,
-1.011613, 1.194338, 0.3987978, 1, 0.9607843, 0, 1,
-1.006104, -0.6699844, -1.246678, 1, 0.9647059, 0, 1,
-1.005391, 1.331692, -0.322889, 1, 0.972549, 0, 1,
-1.001664, 0.2211978, -1.146417, 1, 0.9764706, 0, 1,
-0.9982765, 0.3418512, -3.213291, 1, 0.9843137, 0, 1,
-0.9952999, 3.030603, 0.4818191, 1, 0.9882353, 0, 1,
-0.9916506, -0.9807854, -3.439773, 1, 0.9960784, 0, 1,
-0.9903378, -0.04311642, -2.351066, 0.9960784, 1, 0, 1,
-0.988299, -1.062345, -2.830753, 0.9921569, 1, 0, 1,
-0.9833871, 0.9172641, -2.366176, 0.9843137, 1, 0, 1,
-0.9752014, 1.504427, -1.243142, 0.9803922, 1, 0, 1,
-0.9723573, 0.6158882, -1.01761, 0.972549, 1, 0, 1,
-0.9677165, -0.4698329, -1.076624, 0.9686275, 1, 0, 1,
-0.9653712, 0.7855164, -1.260843, 0.9607843, 1, 0, 1,
-0.9614318, 0.2843639, -2.882024, 0.9568627, 1, 0, 1,
-0.955657, -1.931425, -3.365314, 0.9490196, 1, 0, 1,
-0.9547567, -1.028701, -1.346399, 0.945098, 1, 0, 1,
-0.9538522, 0.6574889, 0.3947752, 0.9372549, 1, 0, 1,
-0.9481546, -0.7836466, -1.535675, 0.9333333, 1, 0, 1,
-0.9470331, 0.3562089, -1.68222, 0.9254902, 1, 0, 1,
-0.94236, 0.1102956, -0.2381391, 0.9215686, 1, 0, 1,
-0.9328766, -0.7563117, -4.11025, 0.9137255, 1, 0, 1,
-0.9306926, 0.3026051, -3.476188, 0.9098039, 1, 0, 1,
-0.9278874, -1.299259, -1.686718, 0.9019608, 1, 0, 1,
-0.9264306, 0.4122172, -1.187896, 0.8941177, 1, 0, 1,
-0.9235294, -0.7718095, -1.035126, 0.8901961, 1, 0, 1,
-0.9187306, 1.706753, -2.279662, 0.8823529, 1, 0, 1,
-0.9140754, -3.358859, -2.179914, 0.8784314, 1, 0, 1,
-0.9119093, -1.305294, -2.18122, 0.8705882, 1, 0, 1,
-0.9105227, -1.218004, -1.013707, 0.8666667, 1, 0, 1,
-0.9095576, 0.9340533, -0.9029165, 0.8588235, 1, 0, 1,
-0.8959223, 1.058041, -0.1943502, 0.854902, 1, 0, 1,
-0.8861335, 0.2795454, -0.358078, 0.8470588, 1, 0, 1,
-0.8823927, 0.144749, -0.3383483, 0.8431373, 1, 0, 1,
-0.8814744, -0.1021318, -0.02873017, 0.8352941, 1, 0, 1,
-0.8777648, -0.2846377, -1.741148, 0.8313726, 1, 0, 1,
-0.8759811, -0.7028913, -2.731839, 0.8235294, 1, 0, 1,
-0.8757477, 1.396631, -0.9951534, 0.8196079, 1, 0, 1,
-0.873419, 0.3977853, -1.537156, 0.8117647, 1, 0, 1,
-0.8719308, 0.1068862, -1.536094, 0.8078431, 1, 0, 1,
-0.8707451, 0.8305988, 0.7071912, 0.8, 1, 0, 1,
-0.865707, 0.08573363, -1.200797, 0.7921569, 1, 0, 1,
-0.8630039, 1.83825, -1.459532, 0.7882353, 1, 0, 1,
-0.8620669, 0.01048091, -1.625676, 0.7803922, 1, 0, 1,
-0.8560534, 0.1765162, -0.9093561, 0.7764706, 1, 0, 1,
-0.8534243, 0.5786248, 1.080236, 0.7686275, 1, 0, 1,
-0.8519447, 0.1391037, -1.457557, 0.7647059, 1, 0, 1,
-0.8511464, 0.1929698, -0.6660024, 0.7568628, 1, 0, 1,
-0.8507886, -0.2180244, -0.4708144, 0.7529412, 1, 0, 1,
-0.849898, 0.06781218, 0.4854053, 0.7450981, 1, 0, 1,
-0.8321283, 0.6062552, -0.7758088, 0.7411765, 1, 0, 1,
-0.8310757, -1.435276, -4.529241, 0.7333333, 1, 0, 1,
-0.828249, -0.02007738, -1.658857, 0.7294118, 1, 0, 1,
-0.8254043, -0.5683426, -2.354976, 0.7215686, 1, 0, 1,
-0.8209901, -2.300644, -4.025977, 0.7176471, 1, 0, 1,
-0.8113593, 0.5334242, -1.941894, 0.7098039, 1, 0, 1,
-0.7999272, 0.9143539, 0.2085359, 0.7058824, 1, 0, 1,
-0.7945149, 0.6894403, -1.584722, 0.6980392, 1, 0, 1,
-0.787299, 1.773026, 1.200305, 0.6901961, 1, 0, 1,
-0.7844024, 0.5319768, -0.3034629, 0.6862745, 1, 0, 1,
-0.7786649, -1.378372, -2.740448, 0.6784314, 1, 0, 1,
-0.7719492, -0.628535, -2.933527, 0.6745098, 1, 0, 1,
-0.7669835, 0.9938272, -1.723526, 0.6666667, 1, 0, 1,
-0.7652478, -0.0268749, -1.998999, 0.6627451, 1, 0, 1,
-0.7619247, -0.8667319, -3.758168, 0.654902, 1, 0, 1,
-0.7590724, -0.1252296, -1.161735, 0.6509804, 1, 0, 1,
-0.7504675, -0.08086836, -1.637247, 0.6431373, 1, 0, 1,
-0.7489688, 1.234542, 0.7364385, 0.6392157, 1, 0, 1,
-0.7380342, 0.8713869, -0.8114073, 0.6313726, 1, 0, 1,
-0.7316901, -0.9073484, -4.15748, 0.627451, 1, 0, 1,
-0.7295585, -0.5586409, -1.209089, 0.6196079, 1, 0, 1,
-0.7252966, 0.4809016, 1.320665, 0.6156863, 1, 0, 1,
-0.7205581, -0.2173738, 0.02239849, 0.6078432, 1, 0, 1,
-0.7154362, -0.849498, -1.994425, 0.6039216, 1, 0, 1,
-0.7126842, -0.4867924, -1.939962, 0.5960785, 1, 0, 1,
-0.7103226, -1.830045, -2.796022, 0.5882353, 1, 0, 1,
-0.6988169, -0.02094252, -2.34322, 0.5843138, 1, 0, 1,
-0.6964831, 2.127168, 0.7464216, 0.5764706, 1, 0, 1,
-0.6865861, 0.6370199, 0.150703, 0.572549, 1, 0, 1,
-0.681602, 0.1050608, -1.272147, 0.5647059, 1, 0, 1,
-0.6814592, 0.1911394, -2.294145, 0.5607843, 1, 0, 1,
-0.6811289, -0.5925044, -2.451558, 0.5529412, 1, 0, 1,
-0.6789324, -1.127556, -3.333697, 0.5490196, 1, 0, 1,
-0.672967, -0.3065136, -2.352039, 0.5411765, 1, 0, 1,
-0.6682194, 0.7574521, -0.2608435, 0.5372549, 1, 0, 1,
-0.6598926, -0.3486809, -1.739732, 0.5294118, 1, 0, 1,
-0.6594334, -0.4047663, -1.256564, 0.5254902, 1, 0, 1,
-0.6523299, -0.7759728, -2.123219, 0.5176471, 1, 0, 1,
-0.6482213, 0.02956784, -1.533147, 0.5137255, 1, 0, 1,
-0.645336, -0.7117597, -1.229189, 0.5058824, 1, 0, 1,
-0.6440635, 0.3658886, -1.435899, 0.5019608, 1, 0, 1,
-0.6415299, 2.13134, 0.2549024, 0.4941176, 1, 0, 1,
-0.6390591, 2.257941, -0.2135417, 0.4862745, 1, 0, 1,
-0.6355242, -1.643121, -3.417088, 0.4823529, 1, 0, 1,
-0.6307248, 0.6805496, -2.168823, 0.4745098, 1, 0, 1,
-0.6293165, -1.179431, -2.803998, 0.4705882, 1, 0, 1,
-0.627229, 1.378594, -0.3307031, 0.4627451, 1, 0, 1,
-0.6224524, 2.956125, -0.2321961, 0.4588235, 1, 0, 1,
-0.6221024, 0.8349138, -1.873876, 0.4509804, 1, 0, 1,
-0.6210597, 0.8694369, -1.672552, 0.4470588, 1, 0, 1,
-0.6195028, 0.5811098, -1.150427, 0.4392157, 1, 0, 1,
-0.6186059, -1.433834, -3.798615, 0.4352941, 1, 0, 1,
-0.6118366, 0.9613103, -0.6834905, 0.427451, 1, 0, 1,
-0.6110903, 1.069129, 0.4859105, 0.4235294, 1, 0, 1,
-0.6054012, -0.8408332, -1.536779, 0.4156863, 1, 0, 1,
-0.6007261, -0.2352768, -2.112994, 0.4117647, 1, 0, 1,
-0.5980303, -0.6752949, -2.201811, 0.4039216, 1, 0, 1,
-0.5975426, 0.3567091, -1.697475, 0.3960784, 1, 0, 1,
-0.5975078, 1.004341, -1.10127, 0.3921569, 1, 0, 1,
-0.5972692, 1.450714, -0.06564844, 0.3843137, 1, 0, 1,
-0.5895442, -0.9734283, -3.599067, 0.3803922, 1, 0, 1,
-0.5889063, 1.109569, -0.7298301, 0.372549, 1, 0, 1,
-0.5885016, 0.4997687, -1.196001, 0.3686275, 1, 0, 1,
-0.5863747, -0.3433039, -1.885007, 0.3607843, 1, 0, 1,
-0.5855086, -0.05100141, -1.00769, 0.3568628, 1, 0, 1,
-0.5825506, 0.4584066, -1.027552, 0.3490196, 1, 0, 1,
-0.5822915, -1.651574, -1.683184, 0.345098, 1, 0, 1,
-0.582077, 0.2798524, -1.01017, 0.3372549, 1, 0, 1,
-0.5809367, -0.2591585, -1.914722, 0.3333333, 1, 0, 1,
-0.5778915, -1.005787, -2.507057, 0.3254902, 1, 0, 1,
-0.5731864, 0.4967963, 0.01693187, 0.3215686, 1, 0, 1,
-0.5720485, -0.1049265, -1.900931, 0.3137255, 1, 0, 1,
-0.5697337, -0.1881058, -3.413009, 0.3098039, 1, 0, 1,
-0.5693576, -1.060269, -1.825547, 0.3019608, 1, 0, 1,
-0.5679067, 1.770403, 1.805047, 0.2941177, 1, 0, 1,
-0.5650586, 0.9551645, -0.8425493, 0.2901961, 1, 0, 1,
-0.564182, 0.7344238, 0.6208094, 0.282353, 1, 0, 1,
-0.5578876, -0.2489942, -1.835499, 0.2784314, 1, 0, 1,
-0.5574191, -0.1523779, -2.678948, 0.2705882, 1, 0, 1,
-0.5533493, 0.9826127, 0.5319134, 0.2666667, 1, 0, 1,
-0.550498, -0.2491218, -1.086057, 0.2588235, 1, 0, 1,
-0.5479178, -0.5312586, -1.831398, 0.254902, 1, 0, 1,
-0.5467914, 1.488642, 0.1925458, 0.2470588, 1, 0, 1,
-0.5463628, -1.037872, -1.654327, 0.2431373, 1, 0, 1,
-0.5449218, -1.325383, -2.632006, 0.2352941, 1, 0, 1,
-0.5384118, -0.9346352, -3.700685, 0.2313726, 1, 0, 1,
-0.5375816, 0.5845387, -0.8384138, 0.2235294, 1, 0, 1,
-0.5321281, 0.1201347, -0.08197042, 0.2196078, 1, 0, 1,
-0.5296038, -0.5291562, -2.226303, 0.2117647, 1, 0, 1,
-0.5293084, -0.7229053, -4.056547, 0.2078431, 1, 0, 1,
-0.5290166, 0.990424, -0.8647115, 0.2, 1, 0, 1,
-0.5243441, 0.278371, -2.292685, 0.1921569, 1, 0, 1,
-0.5225239, 0.501835, -0.7533513, 0.1882353, 1, 0, 1,
-0.5199756, 0.7207465, -0.119729, 0.1803922, 1, 0, 1,
-0.5182703, 0.4802301, -1.337458, 0.1764706, 1, 0, 1,
-0.5178977, -1.715044, -2.512297, 0.1686275, 1, 0, 1,
-0.5178363, -1.497645, -1.972017, 0.1647059, 1, 0, 1,
-0.5169507, 1.665027, -1.657697, 0.1568628, 1, 0, 1,
-0.515398, 2.172543, 1.019362, 0.1529412, 1, 0, 1,
-0.5129595, 0.8129001, -0.9298582, 0.145098, 1, 0, 1,
-0.5090089, -1.2967, -2.639102, 0.1411765, 1, 0, 1,
-0.5057288, -1.017244, -2.986724, 0.1333333, 1, 0, 1,
-0.5051628, 0.9050454, -1.809683, 0.1294118, 1, 0, 1,
-0.5047513, 0.5541133, 1.997801, 0.1215686, 1, 0, 1,
-0.4852507, -0.2216827, -1.959029, 0.1176471, 1, 0, 1,
-0.4849468, 1.588181, -1.348073, 0.1098039, 1, 0, 1,
-0.4832036, -0.7278587, -2.700119, 0.1058824, 1, 0, 1,
-0.4812022, 0.5474476, -0.8220727, 0.09803922, 1, 0, 1,
-0.4801391, 0.7555884, 1.003213, 0.09019608, 1, 0, 1,
-0.4744456, -0.2765242, -1.413462, 0.08627451, 1, 0, 1,
-0.4738487, -0.5573895, -2.786887, 0.07843138, 1, 0, 1,
-0.4714484, 0.1410459, -1.646023, 0.07450981, 1, 0, 1,
-0.4695062, -0.4074438, -1.085667, 0.06666667, 1, 0, 1,
-0.4686946, 0.7813568, -0.147816, 0.0627451, 1, 0, 1,
-0.4630046, -0.102682, -2.723344, 0.05490196, 1, 0, 1,
-0.4620509, -0.1695397, -3.233942, 0.05098039, 1, 0, 1,
-0.4617522, -1.394213, -3.634561, 0.04313726, 1, 0, 1,
-0.4589145, -0.186921, -1.83938, 0.03921569, 1, 0, 1,
-0.4515, 0.1744469, -1.085697, 0.03137255, 1, 0, 1,
-0.4499342, 0.7681397, 0.2579141, 0.02745098, 1, 0, 1,
-0.4425106, 0.2517435, -2.422795, 0.01960784, 1, 0, 1,
-0.4373764, 1.770886, -0.2752767, 0.01568628, 1, 0, 1,
-0.432313, -0.8193403, -2.628996, 0.007843138, 1, 0, 1,
-0.4306615, 0.06770848, -1.397725, 0.003921569, 1, 0, 1,
-0.4298372, 0.1053743, -2.192227, 0, 1, 0.003921569, 1,
-0.4276828, 0.4306993, -2.177776, 0, 1, 0.01176471, 1,
-0.4198416, -0.6606904, -4.217512, 0, 1, 0.01568628, 1,
-0.4184693, -2.543728, -2.075064, 0, 1, 0.02352941, 1,
-0.418249, 1.410321, -0.2491291, 0, 1, 0.02745098, 1,
-0.412127, 0.5977851, -0.6310725, 0, 1, 0.03529412, 1,
-0.4102107, -0.8466235, -2.347888, 0, 1, 0.03921569, 1,
-0.4053471, -0.3943745, -1.404945, 0, 1, 0.04705882, 1,
-0.4040731, 0.7707219, -1.018661, 0, 1, 0.05098039, 1,
-0.401941, 0.9823107, 0.580155, 0, 1, 0.05882353, 1,
-0.4019347, 0.3578107, -1.763663, 0, 1, 0.0627451, 1,
-0.3995468, 1.121793, 1.544785, 0, 1, 0.07058824, 1,
-0.3983346, -1.778182, -3.6979, 0, 1, 0.07450981, 1,
-0.3972323, -0.9131659, -4.574713, 0, 1, 0.08235294, 1,
-0.3961673, -0.5008054, -0.8581546, 0, 1, 0.08627451, 1,
-0.3920806, -1.308821, -1.110148, 0, 1, 0.09411765, 1,
-0.3914208, 1.980654, 0.5553262, 0, 1, 0.1019608, 1,
-0.3911004, -0.2270566, -2.789505, 0, 1, 0.1058824, 1,
-0.383489, 0.4429274, 0.2152224, 0, 1, 0.1137255, 1,
-0.3792574, -0.7346481, -3.350687, 0, 1, 0.1176471, 1,
-0.3758098, -0.06336205, 0.1414287, 0, 1, 0.1254902, 1,
-0.3745631, -0.7591888, -3.489409, 0, 1, 0.1294118, 1,
-0.3686206, -0.9655318, -0.6594317, 0, 1, 0.1372549, 1,
-0.3682764, 0.634124, -1.922999, 0, 1, 0.1411765, 1,
-0.3675792, -0.1476761, -1.509369, 0, 1, 0.1490196, 1,
-0.3629541, -1.704811, -4.047294, 0, 1, 0.1529412, 1,
-0.3615006, 0.1304311, -0.02421041, 0, 1, 0.1607843, 1,
-0.3601927, 1.021256, 0.5427683, 0, 1, 0.1647059, 1,
-0.3591236, -0.08541434, -1.357542, 0, 1, 0.172549, 1,
-0.3542207, -1.163906, -4.197231, 0, 1, 0.1764706, 1,
-0.3514463, -0.123064, -3.367311, 0, 1, 0.1843137, 1,
-0.3461424, -0.5137363, -2.032161, 0, 1, 0.1882353, 1,
-0.3441091, -0.3738095, -2.468635, 0, 1, 0.1960784, 1,
-0.3439918, 1.291985, -2.229667, 0, 1, 0.2039216, 1,
-0.3421328, -0.3547348, -3.623614, 0, 1, 0.2078431, 1,
-0.339952, -1.7284, -1.988137, 0, 1, 0.2156863, 1,
-0.3371529, 0.4267536, -0.4777652, 0, 1, 0.2196078, 1,
-0.3347895, -0.05178789, -2.705197, 0, 1, 0.227451, 1,
-0.3222673, -0.4769449, -2.536381, 0, 1, 0.2313726, 1,
-0.3208622, -0.139592, -3.293963, 0, 1, 0.2392157, 1,
-0.3182106, 1.142704, -0.5072276, 0, 1, 0.2431373, 1,
-0.3138958, 1.305785, 0.4151288, 0, 1, 0.2509804, 1,
-0.3121803, 1.60116, -1.188353, 0, 1, 0.254902, 1,
-0.3102542, -0.3115196, -1.43766, 0, 1, 0.2627451, 1,
-0.3046087, -0.9274256, -1.350964, 0, 1, 0.2666667, 1,
-0.2999724, -1.014746, -2.312002, 0, 1, 0.2745098, 1,
-0.2971741, -0.7829635, -2.952616, 0, 1, 0.2784314, 1,
-0.2963509, -0.2976744, -3.267911, 0, 1, 0.2862745, 1,
-0.2962205, 0.6187974, 0.3710304, 0, 1, 0.2901961, 1,
-0.2946, -0.7865069, -3.786028, 0, 1, 0.2980392, 1,
-0.2904164, 0.4088031, -0.2400969, 0, 1, 0.3058824, 1,
-0.2892023, 1.133459, -0.1484022, 0, 1, 0.3098039, 1,
-0.285517, 1.008967, -3.632085, 0, 1, 0.3176471, 1,
-0.2817385, -0.9689247, -2.923311, 0, 1, 0.3215686, 1,
-0.2782829, -0.6978918, -4.151775, 0, 1, 0.3294118, 1,
-0.2768831, 1.816528, -0.2354393, 0, 1, 0.3333333, 1,
-0.2767665, -0.8889955, -2.178371, 0, 1, 0.3411765, 1,
-0.2738851, 1.063501, -0.5059273, 0, 1, 0.345098, 1,
-0.2700588, -1.205203, -2.725631, 0, 1, 0.3529412, 1,
-0.2658455, 0.1804649, -3.528164, 0, 1, 0.3568628, 1,
-0.2654055, 0.6896083, -2.360274, 0, 1, 0.3647059, 1,
-0.2567476, 0.04882138, -4.569061, 0, 1, 0.3686275, 1,
-0.2539513, 0.4268163, -0.1179815, 0, 1, 0.3764706, 1,
-0.2534603, 0.5514737, -0.2929667, 0, 1, 0.3803922, 1,
-0.2492867, -1.193417, -2.706267, 0, 1, 0.3882353, 1,
-0.2467645, 0.4118441, -0.4736633, 0, 1, 0.3921569, 1,
-0.2402487, 0.6332376, 0.1187855, 0, 1, 0.4, 1,
-0.238463, 0.2084046, 0.3470124, 0, 1, 0.4078431, 1,
-0.2380151, -0.3088038, -2.194403, 0, 1, 0.4117647, 1,
-0.2370656, 0.2317326, -0.6308724, 0, 1, 0.4196078, 1,
-0.2365067, 0.250012, -3.024659, 0, 1, 0.4235294, 1,
-0.235205, 0.4582019, -1.814135, 0, 1, 0.4313726, 1,
-0.2307004, -0.1906875, -3.088243, 0, 1, 0.4352941, 1,
-0.2290046, 1.289989, 0.4407115, 0, 1, 0.4431373, 1,
-0.2263012, 0.2845994, -0.7295641, 0, 1, 0.4470588, 1,
-0.2230282, -1.472492, -3.67817, 0, 1, 0.454902, 1,
-0.2149008, 0.4665411, -0.5392231, 0, 1, 0.4588235, 1,
-0.2146188, -0.3035808, -1.321668, 0, 1, 0.4666667, 1,
-0.2132766, -1.725375, -1.402808, 0, 1, 0.4705882, 1,
-0.2132362, 0.4879135, 1.040108, 0, 1, 0.4784314, 1,
-0.2122277, -2.221073, -3.497349, 0, 1, 0.4823529, 1,
-0.211512, -0.01747867, -0.7789299, 0, 1, 0.4901961, 1,
-0.2113265, 0.2705913, -0.2589148, 0, 1, 0.4941176, 1,
-0.210345, 0.8431742, 0.3810044, 0, 1, 0.5019608, 1,
-0.20698, 2.287282, -0.6590369, 0, 1, 0.509804, 1,
-0.2050499, -1.887355, -4.002991, 0, 1, 0.5137255, 1,
-0.2036264, -0.6215309, -4.417506, 0, 1, 0.5215687, 1,
-0.2000807, 0.6938951, -0.3268575, 0, 1, 0.5254902, 1,
-0.1995926, 1.573149, -0.7530749, 0, 1, 0.5333334, 1,
-0.1986361, 0.04441788, -2.129036, 0, 1, 0.5372549, 1,
-0.19826, -0.424713, -3.077646, 0, 1, 0.5450981, 1,
-0.1975134, 0.4147447, -0.8367826, 0, 1, 0.5490196, 1,
-0.1929584, 1.179782, -1.464462, 0, 1, 0.5568628, 1,
-0.1909627, 0.05708753, -1.030492, 0, 1, 0.5607843, 1,
-0.1819207, 0.4276152, -0.55753, 0, 1, 0.5686275, 1,
-0.178274, -0.5423697, -3.992542, 0, 1, 0.572549, 1,
-0.1651426, 0.750734, -0.2178629, 0, 1, 0.5803922, 1,
-0.162165, -0.1613342, -1.558309, 0, 1, 0.5843138, 1,
-0.1559376, 0.9934573, 0.3696639, 0, 1, 0.5921569, 1,
-0.1509018, 0.7224877, 0.8610899, 0, 1, 0.5960785, 1,
-0.1477164, -0.53981, -1.128839, 0, 1, 0.6039216, 1,
-0.1459977, -0.1609714, -2.419462, 0, 1, 0.6117647, 1,
-0.1427331, -0.9232933, -2.546779, 0, 1, 0.6156863, 1,
-0.140918, 0.1148277, -0.8749127, 0, 1, 0.6235294, 1,
-0.1378102, -0.8380402, -4.187407, 0, 1, 0.627451, 1,
-0.1361096, -0.4642058, -3.439023, 0, 1, 0.6352941, 1,
-0.1297001, -0.6723497, -2.611598, 0, 1, 0.6392157, 1,
-0.1273343, -0.7996311, -2.634528, 0, 1, 0.6470588, 1,
-0.1237595, 0.7384266, 1.637976, 0, 1, 0.6509804, 1,
-0.1220446, -1.036006, -2.339294, 0, 1, 0.6588235, 1,
-0.1194933, 0.1282393, -2.554236, 0, 1, 0.6627451, 1,
-0.1188011, 2.779137, 0.4746441, 0, 1, 0.6705883, 1,
-0.1176408, 1.028947, -0.04942374, 0, 1, 0.6745098, 1,
-0.1160904, -1.281368, -2.794652, 0, 1, 0.682353, 1,
-0.1045262, -0.6557162, -4.429115, 0, 1, 0.6862745, 1,
-0.1005004, -1.792095, -5.454226, 0, 1, 0.6941177, 1,
-0.09595845, 0.5433133, -0.544167, 0, 1, 0.7019608, 1,
-0.09379378, 0.06914666, -0.2321279, 0, 1, 0.7058824, 1,
-0.09284078, 0.7638851, 0.5092152, 0, 1, 0.7137255, 1,
-0.09268834, -0.1935762, -4.261325, 0, 1, 0.7176471, 1,
-0.08894967, -0.6329769, -2.156188, 0, 1, 0.7254902, 1,
-0.08714169, 0.5370215, -1.429162, 0, 1, 0.7294118, 1,
-0.08685549, 1.351203, 0.9249493, 0, 1, 0.7372549, 1,
-0.08428954, -0.03266302, -3.883398, 0, 1, 0.7411765, 1,
-0.08421891, 1.010273, -0.2863706, 0, 1, 0.7490196, 1,
-0.0827055, -1.117548, -4.336762, 0, 1, 0.7529412, 1,
-0.08118892, -2.063936, -2.337732, 0, 1, 0.7607843, 1,
-0.07890457, -1.176773, -3.751793, 0, 1, 0.7647059, 1,
-0.07836211, 0.6386933, 0.3379303, 0, 1, 0.772549, 1,
-0.07107102, 0.1750539, -0.4946789, 0, 1, 0.7764706, 1,
-0.06425095, -0.1956866, -4.187799, 0, 1, 0.7843137, 1,
-0.06325942, -0.05474402, -2.096087, 0, 1, 0.7882353, 1,
-0.06034882, -0.6533497, -3.026606, 0, 1, 0.7960784, 1,
-0.05918851, -1.274595, -4.08172, 0, 1, 0.8039216, 1,
-0.05789559, -1.741158, -3.55625, 0, 1, 0.8078431, 1,
-0.05382023, -0.2761982, -3.548392, 0, 1, 0.8156863, 1,
-0.05234937, -0.1870121, -1.898881, 0, 1, 0.8196079, 1,
-0.0419747, -1.267279, -4.040182, 0, 1, 0.827451, 1,
-0.04081567, -0.736312, -1.929049, 0, 1, 0.8313726, 1,
-0.03846111, -0.8768281, -1.377733, 0, 1, 0.8392157, 1,
-0.03175119, -0.4086213, -3.20888, 0, 1, 0.8431373, 1,
-0.02838182, -0.8776643, -2.81536, 0, 1, 0.8509804, 1,
-0.0272212, -0.2483114, -2.299127, 0, 1, 0.854902, 1,
-0.02312163, -1.061309, -3.101434, 0, 1, 0.8627451, 1,
-0.01989762, -0.177852, -3.556747, 0, 1, 0.8666667, 1,
-0.01292338, 0.418557, -0.9768866, 0, 1, 0.8745098, 1,
-0.01178657, 0.2810562, -1.052553, 0, 1, 0.8784314, 1,
-0.01108655, -0.4987612, -2.522324, 0, 1, 0.8862745, 1,
-0.002388485, 1.79444, -0.04295649, 0, 1, 0.8901961, 1,
0.0007991715, 0.4485981, -0.2739158, 0, 1, 0.8980392, 1,
0.00247405, 0.513728, 1.081614, 0, 1, 0.9058824, 1,
0.002568604, -0.8434753, 3.272371, 0, 1, 0.9098039, 1,
0.003512399, 0.3824814, 0.2040146, 0, 1, 0.9176471, 1,
0.005033082, 0.6363002, 0.09553327, 0, 1, 0.9215686, 1,
0.005495726, -0.6487198, 3.121723, 0, 1, 0.9294118, 1,
0.01026605, 2.293235, 1.131204, 0, 1, 0.9333333, 1,
0.01218818, 0.9589729, 1.187839, 0, 1, 0.9411765, 1,
0.01311025, 1.013675, -0.09705747, 0, 1, 0.945098, 1,
0.01372474, -1.519811, 2.084868, 0, 1, 0.9529412, 1,
0.01450437, -1.730456, 2.381679, 0, 1, 0.9568627, 1,
0.0179581, -0.6443694, 4.794599, 0, 1, 0.9647059, 1,
0.02040513, -0.8950464, 2.700809, 0, 1, 0.9686275, 1,
0.02177668, -0.1805547, 2.380718, 0, 1, 0.9764706, 1,
0.02200213, 0.7557269, 0.1126992, 0, 1, 0.9803922, 1,
0.02383758, -0.3831982, 3.313976, 0, 1, 0.9882353, 1,
0.02485754, 1.063711, -0.1167484, 0, 1, 0.9921569, 1,
0.02679876, 0.9154193, 0.9332614, 0, 1, 1, 1,
0.02832637, -0.5870597, 2.396739, 0, 0.9921569, 1, 1,
0.02923262, -1.402874, 3.229202, 0, 0.9882353, 1, 1,
0.03227921, 0.8776057, -0.4190221, 0, 0.9803922, 1, 1,
0.03774075, -0.5450435, 4.015179, 0, 0.9764706, 1, 1,
0.0380168, 0.7052808, -0.7064422, 0, 0.9686275, 1, 1,
0.04057119, -0.709286, 2.763489, 0, 0.9647059, 1, 1,
0.04590714, -0.9487471, 3.26057, 0, 0.9568627, 1, 1,
0.05087613, 1.267078, 1.600156, 0, 0.9529412, 1, 1,
0.05125413, 1.169405, -1.234722, 0, 0.945098, 1, 1,
0.05370005, 0.6571227, -0.3079131, 0, 0.9411765, 1, 1,
0.0559456, -0.06766384, 0.9707943, 0, 0.9333333, 1, 1,
0.06280422, -1.01085, 0.9097245, 0, 0.9294118, 1, 1,
0.06305739, -0.4211299, 2.355951, 0, 0.9215686, 1, 1,
0.06758357, 0.2897214, 0.04071986, 0, 0.9176471, 1, 1,
0.06771602, -0.7367816, 0.6990981, 0, 0.9098039, 1, 1,
0.07805226, 1.233542, -0.3060523, 0, 0.9058824, 1, 1,
0.07839301, -1.166972, 3.732718, 0, 0.8980392, 1, 1,
0.07946437, -1.247228, 3.355512, 0, 0.8901961, 1, 1,
0.07956745, -1.114656, 2.244689, 0, 0.8862745, 1, 1,
0.08002637, 0.5615708, -1.28206, 0, 0.8784314, 1, 1,
0.08197493, 1.803967, 1.268187, 0, 0.8745098, 1, 1,
0.08538475, -1.034214, 4.296561, 0, 0.8666667, 1, 1,
0.08543751, -1.134699, 1.335873, 0, 0.8627451, 1, 1,
0.08726827, -0.1810176, 3.287126, 0, 0.854902, 1, 1,
0.09524972, -0.6673585, 1.428785, 0, 0.8509804, 1, 1,
0.09618021, 0.6553245, 1.158509, 0, 0.8431373, 1, 1,
0.1018133, -0.8479364, 2.797172, 0, 0.8392157, 1, 1,
0.1050756, 2.045843, -0.008232607, 0, 0.8313726, 1, 1,
0.1051202, 0.3880008, -0.8684481, 0, 0.827451, 1, 1,
0.106497, -1.623488, 2.576176, 0, 0.8196079, 1, 1,
0.1068646, -0.02154027, 1.228484, 0, 0.8156863, 1, 1,
0.1083085, 1.74166, -0.5702123, 0, 0.8078431, 1, 1,
0.1163488, 1.238845, 1.004873, 0, 0.8039216, 1, 1,
0.1167885, 0.7130118, 2.130831, 0, 0.7960784, 1, 1,
0.1200785, -0.7484423, 2.695756, 0, 0.7882353, 1, 1,
0.1203505, -2.067174, 3.51385, 0, 0.7843137, 1, 1,
0.1241141, -1.030184, 2.528674, 0, 0.7764706, 1, 1,
0.1241958, -0.03353452, 1.250749, 0, 0.772549, 1, 1,
0.1255174, -1.244423, 2.783215, 0, 0.7647059, 1, 1,
0.1256483, 0.5037041, -0.9429416, 0, 0.7607843, 1, 1,
0.1306271, 0.7372835, -1.069393, 0, 0.7529412, 1, 1,
0.1306346, -1.713402, 4.061868, 0, 0.7490196, 1, 1,
0.134053, 0.263745, 1.272339, 0, 0.7411765, 1, 1,
0.1345334, 0.02145045, 0.6582897, 0, 0.7372549, 1, 1,
0.1388615, -0.7164571, 3.075566, 0, 0.7294118, 1, 1,
0.1389721, 0.8662473, 1.259294, 0, 0.7254902, 1, 1,
0.1427016, 0.7557561, 0.1862259, 0, 0.7176471, 1, 1,
0.1468392, -0.6219159, 2.333095, 0, 0.7137255, 1, 1,
0.1526521, -1.450504, 3.219199, 0, 0.7058824, 1, 1,
0.1528927, 0.07896417, 2.868718, 0, 0.6980392, 1, 1,
0.1623849, -0.888438, 1.526866, 0, 0.6941177, 1, 1,
0.1707067, 1.020409, 0.9813006, 0, 0.6862745, 1, 1,
0.1722875, -1.337427, 1.738752, 0, 0.682353, 1, 1,
0.1736198, 0.1470167, -0.3941392, 0, 0.6745098, 1, 1,
0.1741934, -1.258289, 2.662994, 0, 0.6705883, 1, 1,
0.1753782, -1.55824, 2.306527, 0, 0.6627451, 1, 1,
0.1757151, 1.495056, -0.8341352, 0, 0.6588235, 1, 1,
0.1770253, -0.2472245, 2.469631, 0, 0.6509804, 1, 1,
0.1778137, -0.9767557, 5.575905, 0, 0.6470588, 1, 1,
0.1787227, -1.419982, 2.705388, 0, 0.6392157, 1, 1,
0.1787538, 0.7824627, 1.29801, 0, 0.6352941, 1, 1,
0.1812426, 1.337196, -0.7998797, 0, 0.627451, 1, 1,
0.1830985, 0.361134, 1.493945, 0, 0.6235294, 1, 1,
0.183185, 0.01970775, 1.216319, 0, 0.6156863, 1, 1,
0.1853553, -0.5271245, 3.285677, 0, 0.6117647, 1, 1,
0.1857215, -1.38257, 2.150435, 0, 0.6039216, 1, 1,
0.1867033, -0.3412938, 2.959846, 0, 0.5960785, 1, 1,
0.1885301, -1.665134, 1.780178, 0, 0.5921569, 1, 1,
0.1886156, 0.2871832, 1.376712, 0, 0.5843138, 1, 1,
0.1903848, -1.392913, 3.582872, 0, 0.5803922, 1, 1,
0.1943919, 1.304055, -0.2236623, 0, 0.572549, 1, 1,
0.1944023, -0.6935461, 4.720659, 0, 0.5686275, 1, 1,
0.1980146, 2.132491, -2.0258, 0, 0.5607843, 1, 1,
0.19852, -1.567408, 4.549991, 0, 0.5568628, 1, 1,
0.1999838, -0.7863305, 2.244358, 0, 0.5490196, 1, 1,
0.2021041, -1.061443, 3.708187, 0, 0.5450981, 1, 1,
0.2036546, 0.7029783, -0.6975015, 0, 0.5372549, 1, 1,
0.204105, 1.197805, 0.4497344, 0, 0.5333334, 1, 1,
0.2092607, 0.3204968, 0.5291247, 0, 0.5254902, 1, 1,
0.2134541, -0.9782381, 1.753548, 0, 0.5215687, 1, 1,
0.2188706, -0.6121486, 2.505624, 0, 0.5137255, 1, 1,
0.2190027, -1.0425, 2.39448, 0, 0.509804, 1, 1,
0.2198375, 0.3190357, -0.3316317, 0, 0.5019608, 1, 1,
0.221811, -1.075384, 3.175479, 0, 0.4941176, 1, 1,
0.2230472, 2.191367, -1.416856, 0, 0.4901961, 1, 1,
0.2244486, 0.4825126, 0.6258638, 0, 0.4823529, 1, 1,
0.2252317, -1.035565, 2.421023, 0, 0.4784314, 1, 1,
0.2259127, -0.480998, 4.100963, 0, 0.4705882, 1, 1,
0.2271653, 1.938053, -0.1875457, 0, 0.4666667, 1, 1,
0.2276483, 0.56148, -0.7758118, 0, 0.4588235, 1, 1,
0.2392453, 0.489064, 1.176937, 0, 0.454902, 1, 1,
0.243052, 1.10587, 0.8374624, 0, 0.4470588, 1, 1,
0.2453339, 0.8103374, 1.256763, 0, 0.4431373, 1, 1,
0.2480893, -0.6954622, 1.273198, 0, 0.4352941, 1, 1,
0.2499997, -0.4781815, 4.711721, 0, 0.4313726, 1, 1,
0.2502002, -0.9511933, 3.380711, 0, 0.4235294, 1, 1,
0.2510504, -0.2373291, 2.61624, 0, 0.4196078, 1, 1,
0.2529568, -0.6144037, 3.230869, 0, 0.4117647, 1, 1,
0.2563029, -0.06360144, 1.163745, 0, 0.4078431, 1, 1,
0.2575963, 0.3517289, 0.740352, 0, 0.4, 1, 1,
0.2615173, -0.3825481, 5.014551, 0, 0.3921569, 1, 1,
0.2643824, 0.9152368, 0.3046085, 0, 0.3882353, 1, 1,
0.2695749, 1.30737, -0.7593111, 0, 0.3803922, 1, 1,
0.2730809, 0.7936217, 3.776937, 0, 0.3764706, 1, 1,
0.2732111, 0.9407084, 0.6908956, 0, 0.3686275, 1, 1,
0.2749861, 0.6094404, -0.5860153, 0, 0.3647059, 1, 1,
0.2752084, 0.7494946, -0.8448468, 0, 0.3568628, 1, 1,
0.2762988, 0.2307185, 1.264322, 0, 0.3529412, 1, 1,
0.2772369, 0.098758, -0.07458161, 0, 0.345098, 1, 1,
0.2794617, 1.672301, 1.646979, 0, 0.3411765, 1, 1,
0.2797427, -0.938525, 2.207372, 0, 0.3333333, 1, 1,
0.2825858, -0.6539401, 2.504885, 0, 0.3294118, 1, 1,
0.2831876, 0.938862, 2.165227, 0, 0.3215686, 1, 1,
0.2839195, 0.7277807, 1.046688, 0, 0.3176471, 1, 1,
0.2859696, 0.03799923, 1.344218, 0, 0.3098039, 1, 1,
0.2883207, -1.650191, 1.607212, 0, 0.3058824, 1, 1,
0.2886821, -0.8265107, 2.006776, 0, 0.2980392, 1, 1,
0.2992856, 1.15537, 0.5262002, 0, 0.2901961, 1, 1,
0.3002988, -1.484717, 2.743145, 0, 0.2862745, 1, 1,
0.304223, 0.05685676, -0.1232689, 0, 0.2784314, 1, 1,
0.3116166, -0.1211407, 3.429551, 0, 0.2745098, 1, 1,
0.3119039, 1.362155, 0.3755793, 0, 0.2666667, 1, 1,
0.313443, -1.527185, 1.448865, 0, 0.2627451, 1, 1,
0.313533, 0.9989758, -1.102213, 0, 0.254902, 1, 1,
0.3164067, 1.103203, -0.2777495, 0, 0.2509804, 1, 1,
0.3240923, 0.4307155, 2.395634, 0, 0.2431373, 1, 1,
0.3289348, 0.2155428, 0.3542639, 0, 0.2392157, 1, 1,
0.3292316, 0.07741085, 1.138538, 0, 0.2313726, 1, 1,
0.3351148, -0.6285498, 3.405335, 0, 0.227451, 1, 1,
0.3454013, -0.3437369, 2.390993, 0, 0.2196078, 1, 1,
0.3465053, 1.221298, 0.6916167, 0, 0.2156863, 1, 1,
0.3465844, -0.6992377, 3.151283, 0, 0.2078431, 1, 1,
0.3515778, -1.291562, 2.183262, 0, 0.2039216, 1, 1,
0.3527941, -0.9605644, 3.395842, 0, 0.1960784, 1, 1,
0.3553223, -0.9079796, 2.412735, 0, 0.1882353, 1, 1,
0.3579063, 1.629484, 0.5478116, 0, 0.1843137, 1, 1,
0.3644875, 1.156225, 0.04524067, 0, 0.1764706, 1, 1,
0.3653131, -0.4703468, 1.767199, 0, 0.172549, 1, 1,
0.3654168, -0.508386, 1.080227, 0, 0.1647059, 1, 1,
0.3703332, -0.8163431, 4.120832, 0, 0.1607843, 1, 1,
0.3726186, -1.496883, 2.427971, 0, 0.1529412, 1, 1,
0.3731499, 0.1211322, 3.343777, 0, 0.1490196, 1, 1,
0.3761733, 0.9885252, 0.3424943, 0, 0.1411765, 1, 1,
0.3772656, -0.2934414, 1.935417, 0, 0.1372549, 1, 1,
0.3782719, -0.1703163, 1.905151, 0, 0.1294118, 1, 1,
0.3796873, 0.7271777, -0.5173578, 0, 0.1254902, 1, 1,
0.3813244, -0.1213102, 3.213536, 0, 0.1176471, 1, 1,
0.382126, 0.8820421, 0.8328456, 0, 0.1137255, 1, 1,
0.3853037, 0.2536445, 1.829712, 0, 0.1058824, 1, 1,
0.3865213, -2.139735, 3.407375, 0, 0.09803922, 1, 1,
0.3946486, -2.162755, 4.537863, 0, 0.09411765, 1, 1,
0.3951028, -0.221794, 2.359773, 0, 0.08627451, 1, 1,
0.3954759, -0.4180768, 3.090799, 0, 0.08235294, 1, 1,
0.3963078, 0.9787627, 0.8578683, 0, 0.07450981, 1, 1,
0.3974736, -0.09819759, 0.1520906, 0, 0.07058824, 1, 1,
0.40151, 0.6114979, 1.058672, 0, 0.0627451, 1, 1,
0.403492, -0.5359215, 1.754421, 0, 0.05882353, 1, 1,
0.4043114, -0.9398878, 1.888208, 0, 0.05098039, 1, 1,
0.4043771, -0.5635462, 2.426306, 0, 0.04705882, 1, 1,
0.4056298, 0.9495524, 0.2438651, 0, 0.03921569, 1, 1,
0.4066716, 0.0211376, 0.1414362, 0, 0.03529412, 1, 1,
0.4074371, 0.6645817, 0.2270864, 0, 0.02745098, 1, 1,
0.4074749, -0.5513627, 1.69893, 0, 0.02352941, 1, 1,
0.4079925, -0.3380657, 1.079757, 0, 0.01568628, 1, 1,
0.4181509, 2.464136, -0.4702943, 0, 0.01176471, 1, 1,
0.4247799, -0.3885641, 5.450848, 0, 0.003921569, 1, 1,
0.425473, -0.4118431, 2.330191, 0.003921569, 0, 1, 1,
0.4262041, -1.460537, 2.207063, 0.007843138, 0, 1, 1,
0.4280128, 0.6663016, 1.457716, 0.01568628, 0, 1, 1,
0.4362141, -0.2412459, 3.966568, 0.01960784, 0, 1, 1,
0.4371621, 0.8316127, -0.6660745, 0.02745098, 0, 1, 1,
0.4374939, 0.01080852, 0.1891098, 0.03137255, 0, 1, 1,
0.4391092, 0.2500279, 1.67378, 0.03921569, 0, 1, 1,
0.4396904, -0.4843172, 2.323563, 0.04313726, 0, 1, 1,
0.4433825, 2.078158, -0.3525813, 0.05098039, 0, 1, 1,
0.4454773, -0.4090828, 2.831561, 0.05490196, 0, 1, 1,
0.4469297, 1.118801, -0.7145202, 0.0627451, 0, 1, 1,
0.4469545, 2.080071, 1.742515, 0.06666667, 0, 1, 1,
0.451142, 0.2820082, 1.457451, 0.07450981, 0, 1, 1,
0.4525813, 0.3855272, 1.138526, 0.07843138, 0, 1, 1,
0.4540364, 0.8308463, -0.5346741, 0.08627451, 0, 1, 1,
0.4555044, -1.462851, 3.172582, 0.09019608, 0, 1, 1,
0.4561729, 0.8727127, 2.092871, 0.09803922, 0, 1, 1,
0.4584489, 0.2617656, 1.56405, 0.1058824, 0, 1, 1,
0.459268, -1.60343, -0.2069961, 0.1098039, 0, 1, 1,
0.4691962, 1.07851, -0.8420863, 0.1176471, 0, 1, 1,
0.4750553, 0.6375419, -0.3200699, 0.1215686, 0, 1, 1,
0.4831941, 0.1705056, -0.5056555, 0.1294118, 0, 1, 1,
0.4834234, -0.1162237, -0.3976198, 0.1333333, 0, 1, 1,
0.4846928, -0.3786565, 2.255312, 0.1411765, 0, 1, 1,
0.4870463, 0.1367885, 2.62336, 0.145098, 0, 1, 1,
0.4884861, 0.3593632, 1.876052, 0.1529412, 0, 1, 1,
0.4890486, -0.5671214, 4.413887, 0.1568628, 0, 1, 1,
0.4975759, 0.4680708, -0.3271, 0.1647059, 0, 1, 1,
0.4976091, 0.5172115, 2.534597, 0.1686275, 0, 1, 1,
0.5029961, 1.946836, 0.05994499, 0.1764706, 0, 1, 1,
0.5046188, -0.4559652, 2.232166, 0.1803922, 0, 1, 1,
0.5053467, -0.3682382, 1.387809, 0.1882353, 0, 1, 1,
0.5057603, 0.8058563, -1.033937, 0.1921569, 0, 1, 1,
0.5070955, 0.2971203, -0.3783157, 0.2, 0, 1, 1,
0.5083928, 0.6323263, 0.5731105, 0.2078431, 0, 1, 1,
0.5087138, -0.7464228, 3.455238, 0.2117647, 0, 1, 1,
0.5179223, -0.3899586, 1.622972, 0.2196078, 0, 1, 1,
0.518242, -0.4658807, 3.033829, 0.2235294, 0, 1, 1,
0.5251347, -1.32549, 3.272835, 0.2313726, 0, 1, 1,
0.5260597, -0.6926587, 1.319166, 0.2352941, 0, 1, 1,
0.5260687, -0.9400385, 2.475383, 0.2431373, 0, 1, 1,
0.5272928, -0.6596773, 2.201649, 0.2470588, 0, 1, 1,
0.5295306, -0.9640434, 3.092681, 0.254902, 0, 1, 1,
0.5324494, -0.4462708, 2.004327, 0.2588235, 0, 1, 1,
0.5391228, 0.2842746, 1.368987, 0.2666667, 0, 1, 1,
0.5419692, 0.8507413, 1.994763, 0.2705882, 0, 1, 1,
0.5438093, -0.1739872, 1.538486, 0.2784314, 0, 1, 1,
0.5478849, 0.9863532, -0.775701, 0.282353, 0, 1, 1,
0.5538154, 0.255696, 1.051379, 0.2901961, 0, 1, 1,
0.5574379, 1.264518, 0.118582, 0.2941177, 0, 1, 1,
0.5584663, -0.3801544, 1.37424, 0.3019608, 0, 1, 1,
0.5683287, -0.09842753, 2.004548, 0.3098039, 0, 1, 1,
0.5699282, -1.218853, 3.626389, 0.3137255, 0, 1, 1,
0.5730309, 0.4530159, 0.4969, 0.3215686, 0, 1, 1,
0.5756022, 0.5681577, 1.988248, 0.3254902, 0, 1, 1,
0.5785686, 0.09025327, 1.763084, 0.3333333, 0, 1, 1,
0.5799058, 1.255331, -0.207938, 0.3372549, 0, 1, 1,
0.5831089, -0.6399383, 2.22226, 0.345098, 0, 1, 1,
0.5883837, 0.03881886, 0.9404974, 0.3490196, 0, 1, 1,
0.5903704, 0.1484876, 1.598944, 0.3568628, 0, 1, 1,
0.5907595, -1.874816, 2.451649, 0.3607843, 0, 1, 1,
0.5917163, -0.1751145, 0.1753009, 0.3686275, 0, 1, 1,
0.5960804, -1.474033, 1.393681, 0.372549, 0, 1, 1,
0.5981306, -0.1801993, -0.1587405, 0.3803922, 0, 1, 1,
0.6011663, -1.722509, 4.94066, 0.3843137, 0, 1, 1,
0.6022922, 0.3849102, 0.1667934, 0.3921569, 0, 1, 1,
0.6123383, 0.4796761, 1.382218, 0.3960784, 0, 1, 1,
0.6140573, -0.06907595, 1.876146, 0.4039216, 0, 1, 1,
0.6151507, 0.336723, -0.867448, 0.4117647, 0, 1, 1,
0.6158864, -2.320199, 2.56008, 0.4156863, 0, 1, 1,
0.619347, 0.3787181, 0.8703703, 0.4235294, 0, 1, 1,
0.6204746, 1.87106, -0.1845575, 0.427451, 0, 1, 1,
0.6230804, 0.3301077, -0.2276803, 0.4352941, 0, 1, 1,
0.6238461, -1.584563, 3.263391, 0.4392157, 0, 1, 1,
0.6274467, -0.4442795, 3.406338, 0.4470588, 0, 1, 1,
0.629335, 0.8595968, 0.116009, 0.4509804, 0, 1, 1,
0.6297736, -0.5627181, 2.43253, 0.4588235, 0, 1, 1,
0.6323157, -3.058627, 1.855336, 0.4627451, 0, 1, 1,
0.6357451, -0.3187956, 3.910398, 0.4705882, 0, 1, 1,
0.6417282, -0.2263885, 1.696879, 0.4745098, 0, 1, 1,
0.6485413, -0.5306413, 2.847782, 0.4823529, 0, 1, 1,
0.648718, 0.2820118, 2.600489, 0.4862745, 0, 1, 1,
0.6505747, 0.7386866, -0.7567399, 0.4941176, 0, 1, 1,
0.6506465, 0.2642355, 1.055491, 0.5019608, 0, 1, 1,
0.6523277, 0.3548672, 1.814281, 0.5058824, 0, 1, 1,
0.6529008, -0.5712547, 3.544951, 0.5137255, 0, 1, 1,
0.6556276, 0.5497215, 0.1481785, 0.5176471, 0, 1, 1,
0.6568136, -0.4052878, 2.463366, 0.5254902, 0, 1, 1,
0.6611694, -1.369613, 2.412846, 0.5294118, 0, 1, 1,
0.6633828, 0.1490505, 2.41422, 0.5372549, 0, 1, 1,
0.665791, 0.9354916, -0.0386437, 0.5411765, 0, 1, 1,
0.6734399, -0.1826943, 1.86587, 0.5490196, 0, 1, 1,
0.6801649, -0.2039772, 1.62448, 0.5529412, 0, 1, 1,
0.6830497, 0.2368952, 0.3097599, 0.5607843, 0, 1, 1,
0.6838606, -0.4831506, 3.387681, 0.5647059, 0, 1, 1,
0.6920795, -0.7903007, 0.4954785, 0.572549, 0, 1, 1,
0.697292, 0.5135397, 1.151701, 0.5764706, 0, 1, 1,
0.6993536, -0.2738902, 2.391082, 0.5843138, 0, 1, 1,
0.7008247, 0.5836872, 0.3632845, 0.5882353, 0, 1, 1,
0.7011629, 1.169471, 1.836617, 0.5960785, 0, 1, 1,
0.7030935, -2.471047, 3.250339, 0.6039216, 0, 1, 1,
0.7045826, -1.581596, 3.737292, 0.6078432, 0, 1, 1,
0.7048685, -0.1640371, 0.9310248, 0.6156863, 0, 1, 1,
0.7091922, 0.8667489, 0.8938695, 0.6196079, 0, 1, 1,
0.7135708, -0.3163458, 1.400917, 0.627451, 0, 1, 1,
0.7138557, -0.09166773, 0.4293015, 0.6313726, 0, 1, 1,
0.7149251, -0.4003837, 3.567027, 0.6392157, 0, 1, 1,
0.7150168, -0.2602851, 0.80526, 0.6431373, 0, 1, 1,
0.7180133, -1.086503, 1.415888, 0.6509804, 0, 1, 1,
0.7199773, -0.7145475, 3.452156, 0.654902, 0, 1, 1,
0.7318655, -0.3083253, 2.057356, 0.6627451, 0, 1, 1,
0.7353617, -1.174581, 4.083615, 0.6666667, 0, 1, 1,
0.7396062, -1.240533, 2.529645, 0.6745098, 0, 1, 1,
0.7401974, -0.7621002, 2.47403, 0.6784314, 0, 1, 1,
0.7456972, -0.08531184, 2.057551, 0.6862745, 0, 1, 1,
0.746226, 0.8279433, 3.105535, 0.6901961, 0, 1, 1,
0.7486465, 0.390379, 1.65486, 0.6980392, 0, 1, 1,
0.7489592, -0.3697739, 2.857571, 0.7058824, 0, 1, 1,
0.7495512, -1.366303, 2.358049, 0.7098039, 0, 1, 1,
0.7507198, 0.8852876, 0.3281403, 0.7176471, 0, 1, 1,
0.7509277, -0.7319622, 3.234058, 0.7215686, 0, 1, 1,
0.7548438, 1.099652, 0.03404148, 0.7294118, 0, 1, 1,
0.7625692, -0.1588338, 1.793741, 0.7333333, 0, 1, 1,
0.7684803, -0.8827952, 2.744101, 0.7411765, 0, 1, 1,
0.7700347, 0.7800383, -0.9975487, 0.7450981, 0, 1, 1,
0.7738764, -0.8604562, 2.782243, 0.7529412, 0, 1, 1,
0.7750893, -0.3552836, 2.928946, 0.7568628, 0, 1, 1,
0.7754594, 0.03467005, 1.238018, 0.7647059, 0, 1, 1,
0.7776051, -0.9517745, 3.149716, 0.7686275, 0, 1, 1,
0.7778186, -0.6149344, 2.311625, 0.7764706, 0, 1, 1,
0.7798502, 0.4442644, 1.775556, 0.7803922, 0, 1, 1,
0.7815475, 1.457452, 0.0146511, 0.7882353, 0, 1, 1,
0.7846851, -1.237416, 1.804437, 0.7921569, 0, 1, 1,
0.7854254, -0.5491735, 3.434724, 0.8, 0, 1, 1,
0.7908841, -0.2425519, 2.883732, 0.8078431, 0, 1, 1,
0.7922297, 0.0718659, 3.607315, 0.8117647, 0, 1, 1,
0.8020021, 0.7503993, 0.01075759, 0.8196079, 0, 1, 1,
0.8094282, -0.5922147, 3.328112, 0.8235294, 0, 1, 1,
0.8110545, -0.6807547, 2.829939, 0.8313726, 0, 1, 1,
0.8121559, 0.07627219, 0.4971805, 0.8352941, 0, 1, 1,
0.8168998, -1.027258, 1.291864, 0.8431373, 0, 1, 1,
0.8195751, 0.6055427, 2.666517, 0.8470588, 0, 1, 1,
0.8215341, -0.8552902, 3.540606, 0.854902, 0, 1, 1,
0.8215641, -1.228125, 1.848268, 0.8588235, 0, 1, 1,
0.8227286, 1.35778, 0.5444688, 0.8666667, 0, 1, 1,
0.8237798, 0.01988995, 1.423836, 0.8705882, 0, 1, 1,
0.8240722, -0.6754109, 2.33394, 0.8784314, 0, 1, 1,
0.8257064, 0.59222, 1.521109, 0.8823529, 0, 1, 1,
0.8261739, 2.007181, -0.9233454, 0.8901961, 0, 1, 1,
0.8264428, -1.077627, 3.664392, 0.8941177, 0, 1, 1,
0.826682, 0.9528688, 1.992595, 0.9019608, 0, 1, 1,
0.8298632, 1.141016, -0.9507821, 0.9098039, 0, 1, 1,
0.8352773, -0.3690924, 1.821755, 0.9137255, 0, 1, 1,
0.8437804, -1.502613, 3.86877, 0.9215686, 0, 1, 1,
0.8455977, 0.6003389, 0.4719501, 0.9254902, 0, 1, 1,
0.8465486, 0.0730523, 1.83181, 0.9333333, 0, 1, 1,
0.8610598, 1.64816, 1.533481, 0.9372549, 0, 1, 1,
0.8820214, 0.802276, -0.008701814, 0.945098, 0, 1, 1,
0.8858503, -0.1226798, 1.486385, 0.9490196, 0, 1, 1,
0.8873575, -0.5789026, 2.383634, 0.9568627, 0, 1, 1,
0.8943819, 0.9714311, 0.7364759, 0.9607843, 0, 1, 1,
0.8951007, -1.056941, 2.75055, 0.9686275, 0, 1, 1,
0.8968155, -1.22315, 1.707299, 0.972549, 0, 1, 1,
0.9124356, -0.964366, 1.777516, 0.9803922, 0, 1, 1,
0.913282, -0.424906, 3.07401, 0.9843137, 0, 1, 1,
0.9148632, 0.8277579, 1.108117, 0.9921569, 0, 1, 1,
0.9178997, 0.06608266, 1.213248, 0.9960784, 0, 1, 1,
0.9256098, 0.07471639, 0.7475126, 1, 0, 0.9960784, 1,
0.9258883, 0.06161164, 0.5173062, 1, 0, 0.9882353, 1,
0.928929, -1.455568, 3.563659, 1, 0, 0.9843137, 1,
0.9330946, 1.400481, -1.878487, 1, 0, 0.9764706, 1,
0.9467953, 0.4799389, 0.9609666, 1, 0, 0.972549, 1,
0.950737, -1.824263, 4.47259, 1, 0, 0.9647059, 1,
0.9561734, -1.321347, 0.6967801, 1, 0, 0.9607843, 1,
0.9565008, 0.9195941, -0.3812138, 1, 0, 0.9529412, 1,
0.9570705, -0.3350941, 1.125239, 1, 0, 0.9490196, 1,
0.9598373, -0.9193814, 2.669214, 1, 0, 0.9411765, 1,
0.96482, -0.3212738, 1.93529, 1, 0, 0.9372549, 1,
0.9676573, -0.9341387, -0.06899926, 1, 0, 0.9294118, 1,
0.9698042, -0.9804462, 2.187641, 1, 0, 0.9254902, 1,
0.9710523, 1.788518, 0.2839729, 1, 0, 0.9176471, 1,
0.9711582, 1.324062, 1.878113, 1, 0, 0.9137255, 1,
0.9728383, 1.569264, 1.23844, 1, 0, 0.9058824, 1,
0.9743591, 0.4055826, -0.7644804, 1, 0, 0.9019608, 1,
0.9765298, -0.09564359, 0.2724025, 1, 0, 0.8941177, 1,
0.9804052, -2.088141, 3.031191, 1, 0, 0.8862745, 1,
0.9826041, -0.03244977, 1.027488, 1, 0, 0.8823529, 1,
0.9828175, 0.718284, 1.472535, 1, 0, 0.8745098, 1,
0.9878432, 0.3363628, 1.886755, 1, 0, 0.8705882, 1,
0.9888189, 0.3025531, 0.7787716, 1, 0, 0.8627451, 1,
0.9937161, 0.8726521, 1.741234, 1, 0, 0.8588235, 1,
1.001568, 0.77082, 0.8214409, 1, 0, 0.8509804, 1,
1.002027, -0.3538125, 3.138159, 1, 0, 0.8470588, 1,
1.006545, 1.831688, 0.8111222, 1, 0, 0.8392157, 1,
1.007237, 0.8360594, 1.582195, 1, 0, 0.8352941, 1,
1.010537, -0.1909777, 2.33662, 1, 0, 0.827451, 1,
1.016223, -0.8739688, 2.590966, 1, 0, 0.8235294, 1,
1.022703, 0.591548, 0.5279933, 1, 0, 0.8156863, 1,
1.026061, -1.314258, 2.768253, 1, 0, 0.8117647, 1,
1.043308, -1.063015, 2.383092, 1, 0, 0.8039216, 1,
1.045357, 0.462207, -0.07402943, 1, 0, 0.7960784, 1,
1.046889, 1.016764, 1.752163, 1, 0, 0.7921569, 1,
1.055787, 1.465849, 0.3958324, 1, 0, 0.7843137, 1,
1.074013, 2.213389, -0.6202188, 1, 0, 0.7803922, 1,
1.08644, -0.83109, 2.446836, 1, 0, 0.772549, 1,
1.094955, 1.45292, -0.6620356, 1, 0, 0.7686275, 1,
1.101034, -1.064059, 1.034615, 1, 0, 0.7607843, 1,
1.104564, -1.131907, 5.270837, 1, 0, 0.7568628, 1,
1.106894, 0.6388938, 1.82544, 1, 0, 0.7490196, 1,
1.108752, 1.348383, 1.117787, 1, 0, 0.7450981, 1,
1.111312, 1.471966, 0.1043645, 1, 0, 0.7372549, 1,
1.1128, 0.2274888, 0.7349692, 1, 0, 0.7333333, 1,
1.121526, 0.3630261, 1.446447, 1, 0, 0.7254902, 1,
1.125395, 0.0121555, 0.854049, 1, 0, 0.7215686, 1,
1.128561, -0.1660625, -0.7405782, 1, 0, 0.7137255, 1,
1.132688, 1.291987, 1.264715, 1, 0, 0.7098039, 1,
1.13331, 1.049271, 1.922471, 1, 0, 0.7019608, 1,
1.136491, -0.06455944, 1.866981, 1, 0, 0.6941177, 1,
1.142329, 2.249129, 1.562908, 1, 0, 0.6901961, 1,
1.143672, 1.610444, 1.905444, 1, 0, 0.682353, 1,
1.15449, -0.4290423, 0.7042332, 1, 0, 0.6784314, 1,
1.156771, -0.4546787, 1.990318, 1, 0, 0.6705883, 1,
1.169711, 0.4295944, 1.450344, 1, 0, 0.6666667, 1,
1.1698, 1.172989, 0.4482064, 1, 0, 0.6588235, 1,
1.173573, 0.5353022, 1.890027, 1, 0, 0.654902, 1,
1.175708, 0.4336188, 1.537918, 1, 0, 0.6470588, 1,
1.176788, 0.5537335, 1.136322, 1, 0, 0.6431373, 1,
1.180402, 0.3467514, 0.4888237, 1, 0, 0.6352941, 1,
1.191739, -0.08026104, 1.40115, 1, 0, 0.6313726, 1,
1.196023, -1.85653, 2.50887, 1, 0, 0.6235294, 1,
1.19742, 0.2196979, 1.400087, 1, 0, 0.6196079, 1,
1.198628, -0.7819637, 2.148095, 1, 0, 0.6117647, 1,
1.2026, -0.09822537, 1.833048, 1, 0, 0.6078432, 1,
1.207563, 0.3837226, 1.722341, 1, 0, 0.6, 1,
1.217243, -0.8820671, 4.433495, 1, 0, 0.5921569, 1,
1.224595, -0.9647824, 2.780957, 1, 0, 0.5882353, 1,
1.228886, 2.374177, 2.01889, 1, 0, 0.5803922, 1,
1.230415, 0.48711, -0.06170795, 1, 0, 0.5764706, 1,
1.232058, -0.1461822, 1.289491, 1, 0, 0.5686275, 1,
1.240336, -0.7942234, 2.045904, 1, 0, 0.5647059, 1,
1.24771, -0.9755976, 0.6210713, 1, 0, 0.5568628, 1,
1.251274, -0.2727415, 2.486524, 1, 0, 0.5529412, 1,
1.274988, -0.7765755, 1.103681, 1, 0, 0.5450981, 1,
1.277791, -1.23757, 2.515395, 1, 0, 0.5411765, 1,
1.28533, 0.1188911, 2.178493, 1, 0, 0.5333334, 1,
1.298826, 0.382353, 2.561008, 1, 0, 0.5294118, 1,
1.301797, 0.3580632, 0.6291977, 1, 0, 0.5215687, 1,
1.303413, -0.4935102, 1.994729, 1, 0, 0.5176471, 1,
1.306358, -0.03463004, 3.702487, 1, 0, 0.509804, 1,
1.30916, 0.1121726, 2.229729, 1, 0, 0.5058824, 1,
1.326234, -0.5059309, 1.372957, 1, 0, 0.4980392, 1,
1.326647, -1.49838, 1.751245, 1, 0, 0.4901961, 1,
1.326751, 2.120834, 0.5871075, 1, 0, 0.4862745, 1,
1.329844, 0.3534972, 2.114757, 1, 0, 0.4784314, 1,
1.330321, 0.8797511, -1.118617, 1, 0, 0.4745098, 1,
1.340168, 0.944515, 0.352184, 1, 0, 0.4666667, 1,
1.358549, -2.7781, 4.066755, 1, 0, 0.4627451, 1,
1.366435, 0.9717696, 0.8061775, 1, 0, 0.454902, 1,
1.384337, 0.7222754, 0.6750093, 1, 0, 0.4509804, 1,
1.386411, -2.072725, 1.865973, 1, 0, 0.4431373, 1,
1.389654, -0.6999298, 1.403528, 1, 0, 0.4392157, 1,
1.40024, 0.2537905, 0.354003, 1, 0, 0.4313726, 1,
1.413403, -0.614511, 2.892317, 1, 0, 0.427451, 1,
1.420813, 1.299011, 0.5450273, 1, 0, 0.4196078, 1,
1.421415, 1.182907, 0.23166, 1, 0, 0.4156863, 1,
1.425109, 0.1697234, 1.799535, 1, 0, 0.4078431, 1,
1.428018, 0.6867896, 2.043059, 1, 0, 0.4039216, 1,
1.443015, 0.2701707, -0.4560288, 1, 0, 0.3960784, 1,
1.443441, -1.582069, 2.689079, 1, 0, 0.3882353, 1,
1.471651, -0.4882423, 1.84798, 1, 0, 0.3843137, 1,
1.474962, -2.404522, 4.012811, 1, 0, 0.3764706, 1,
1.4812, 1.245682, 0.03222488, 1, 0, 0.372549, 1,
1.491362, -0.4897465, -1.106416, 1, 0, 0.3647059, 1,
1.492574, 0.03881644, 1.74933, 1, 0, 0.3607843, 1,
1.493012, 0.1650708, 1.835533, 1, 0, 0.3529412, 1,
1.500775, 0.1719963, 1.80276, 1, 0, 0.3490196, 1,
1.509211, 0.943444, 0.7102364, 1, 0, 0.3411765, 1,
1.511103, -0.6215388, 0.9013221, 1, 0, 0.3372549, 1,
1.534724, -0.4579028, 1.218026, 1, 0, 0.3294118, 1,
1.545131, 0.6924293, 3.775831, 1, 0, 0.3254902, 1,
1.563475, 1.302997, 0.5771186, 1, 0, 0.3176471, 1,
1.563772, -0.5231081, -0.1921206, 1, 0, 0.3137255, 1,
1.564919, 0.566756, 0.6215425, 1, 0, 0.3058824, 1,
1.565102, -0.3435455, 1.943576, 1, 0, 0.2980392, 1,
1.573214, 0.0945184, 1.747891, 1, 0, 0.2941177, 1,
1.584634, 1.802833, 0.9726459, 1, 0, 0.2862745, 1,
1.592405, 0.3577698, 2.669832, 1, 0, 0.282353, 1,
1.602408, -0.2627136, 1.495174, 1, 0, 0.2745098, 1,
1.620121, -0.08835265, 3.045688, 1, 0, 0.2705882, 1,
1.624108, 1.171174, -0.780381, 1, 0, 0.2627451, 1,
1.655824, -0.2939284, 1.690206, 1, 0, 0.2588235, 1,
1.679732, -0.2163654, 0.3806697, 1, 0, 0.2509804, 1,
1.685518, 0.5118495, 1.905988, 1, 0, 0.2470588, 1,
1.702724, 1.608481, 0.1584386, 1, 0, 0.2392157, 1,
1.722159, -0.9935521, 3.722037, 1, 0, 0.2352941, 1,
1.726782, -1.67559, 2.364557, 1, 0, 0.227451, 1,
1.756784, 1.281095, 2.451249, 1, 0, 0.2235294, 1,
1.758239, -0.6829018, 2.651115, 1, 0, 0.2156863, 1,
1.759548, -0.5986347, 1.374149, 1, 0, 0.2117647, 1,
1.763799, -1.020666, 2.674812, 1, 0, 0.2039216, 1,
1.779375, 1.500304, 0.2885731, 1, 0, 0.1960784, 1,
1.806723, 0.4228507, 3.649501, 1, 0, 0.1921569, 1,
1.820031, 0.657084, 0.9224117, 1, 0, 0.1843137, 1,
1.82216, 0.7235886, 1.858944, 1, 0, 0.1803922, 1,
1.872436, -1.751258, 3.293032, 1, 0, 0.172549, 1,
1.877478, 0.1198479, 1.012802, 1, 0, 0.1686275, 1,
1.902788, 0.0847172, -0.2469105, 1, 0, 0.1607843, 1,
1.920729, -0.8116868, 3.418438, 1, 0, 0.1568628, 1,
1.930956, 0.37896, 1.532109, 1, 0, 0.1490196, 1,
1.934767, 0.2573133, 1.745185, 1, 0, 0.145098, 1,
1.948793, 1.184802, 0.9136339, 1, 0, 0.1372549, 1,
1.990778, 0.8182218, 0.8439216, 1, 0, 0.1333333, 1,
1.994913, 0.1307889, 1.748386, 1, 0, 0.1254902, 1,
2.041201, 0.5365793, 1.402987, 1, 0, 0.1215686, 1,
2.06288, 2.68884, -0.8719907, 1, 0, 0.1137255, 1,
2.113917, 0.1658832, 1.062333, 1, 0, 0.1098039, 1,
2.137037, 0.3574626, 1.3179, 1, 0, 0.1019608, 1,
2.141799, -1.60246, 2.77694, 1, 0, 0.09411765, 1,
2.186046, 0.1010295, 0.9078037, 1, 0, 0.09019608, 1,
2.260043, 0.2316115, 0.3728253, 1, 0, 0.08235294, 1,
2.299142, -1.053169, 0.8568378, 1, 0, 0.07843138, 1,
2.354011, 1.82927, 1.788888, 1, 0, 0.07058824, 1,
2.36574, 0.7049272, 0.5586427, 1, 0, 0.06666667, 1,
2.428691, 0.2236395, 2.660429, 1, 0, 0.05882353, 1,
2.445495, 1.749795, 0.9007955, 1, 0, 0.05490196, 1,
2.490772, -0.5714924, 1.93231, 1, 0, 0.04705882, 1,
2.506215, -0.7736102, 1.420632, 1, 0, 0.04313726, 1,
2.60703, -2.094375, 2.806595, 1, 0, 0.03529412, 1,
2.626502, -1.188287, 1.145169, 1, 0, 0.03137255, 1,
2.631651, -1.11118, 1.347669, 1, 0, 0.02352941, 1,
2.932317, 0.5995138, 0.7923276, 1, 0, 0.01960784, 1,
3.045511, -3.076141, 1.643221, 1, 0, 0.01176471, 1,
3.692199, 1.637193, 3.965144, 1, 0, 0.007843138, 1
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
0.1365018, -4.471342, -7.323833, 0, -0.5, 0.5, 0.5,
0.1365018, -4.471342, -7.323833, 1, -0.5, 0.5, 0.5,
0.1365018, -4.471342, -7.323833, 1, 1.5, 0.5, 0.5,
0.1365018, -4.471342, -7.323833, 0, 1.5, 0.5, 0.5
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
-4.624577, -0.07719922, -7.323833, 0, -0.5, 0.5, 0.5,
-4.624577, -0.07719922, -7.323833, 1, -0.5, 0.5, 0.5,
-4.624577, -0.07719922, -7.323833, 1, 1.5, 0.5, 0.5,
-4.624577, -0.07719922, -7.323833, 0, 1.5, 0.5, 0.5
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
-4.624577, -4.471342, 0.06083965, 0, -0.5, 0.5, 0.5,
-4.624577, -4.471342, 0.06083965, 1, -0.5, 0.5, 0.5,
-4.624577, -4.471342, 0.06083965, 1, 1.5, 0.5, 0.5,
-4.624577, -4.471342, 0.06083965, 0, 1.5, 0.5, 0.5
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
-2, -3.457309, -5.619678,
2, -3.457309, -5.619678,
-2, -3.457309, -5.619678,
-2, -3.626314, -5.903703,
0, -3.457309, -5.619678,
0, -3.626314, -5.903703,
2, -3.457309, -5.619678,
2, -3.626314, -5.903703
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
"0",
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
-2, -3.964325, -6.471755, 0, -0.5, 0.5, 0.5,
-2, -3.964325, -6.471755, 1, -0.5, 0.5, 0.5,
-2, -3.964325, -6.471755, 1, 1.5, 0.5, 0.5,
-2, -3.964325, -6.471755, 0, 1.5, 0.5, 0.5,
0, -3.964325, -6.471755, 0, -0.5, 0.5, 0.5,
0, -3.964325, -6.471755, 1, -0.5, 0.5, 0.5,
0, -3.964325, -6.471755, 1, 1.5, 0.5, 0.5,
0, -3.964325, -6.471755, 0, 1.5, 0.5, 0.5,
2, -3.964325, -6.471755, 0, -0.5, 0.5, 0.5,
2, -3.964325, -6.471755, 1, -0.5, 0.5, 0.5,
2, -3.964325, -6.471755, 1, 1.5, 0.5, 0.5,
2, -3.964325, -6.471755, 0, 1.5, 0.5, 0.5
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
-3.525866, -3, -5.619678,
-3.525866, 3, -5.619678,
-3.525866, -3, -5.619678,
-3.708984, -3, -5.903703,
-3.525866, -2, -5.619678,
-3.708984, -2, -5.903703,
-3.525866, -1, -5.619678,
-3.708984, -1, -5.903703,
-3.525866, 0, -5.619678,
-3.708984, 0, -5.903703,
-3.525866, 1, -5.619678,
-3.708984, 1, -5.903703,
-3.525866, 2, -5.619678,
-3.708984, 2, -5.903703,
-3.525866, 3, -5.619678,
-3.708984, 3, -5.903703
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
-4.075221, -3, -6.471755, 0, -0.5, 0.5, 0.5,
-4.075221, -3, -6.471755, 1, -0.5, 0.5, 0.5,
-4.075221, -3, -6.471755, 1, 1.5, 0.5, 0.5,
-4.075221, -3, -6.471755, 0, 1.5, 0.5, 0.5,
-4.075221, -2, -6.471755, 0, -0.5, 0.5, 0.5,
-4.075221, -2, -6.471755, 1, -0.5, 0.5, 0.5,
-4.075221, -2, -6.471755, 1, 1.5, 0.5, 0.5,
-4.075221, -2, -6.471755, 0, 1.5, 0.5, 0.5,
-4.075221, -1, -6.471755, 0, -0.5, 0.5, 0.5,
-4.075221, -1, -6.471755, 1, -0.5, 0.5, 0.5,
-4.075221, -1, -6.471755, 1, 1.5, 0.5, 0.5,
-4.075221, -1, -6.471755, 0, 1.5, 0.5, 0.5,
-4.075221, 0, -6.471755, 0, -0.5, 0.5, 0.5,
-4.075221, 0, -6.471755, 1, -0.5, 0.5, 0.5,
-4.075221, 0, -6.471755, 1, 1.5, 0.5, 0.5,
-4.075221, 0, -6.471755, 0, 1.5, 0.5, 0.5,
-4.075221, 1, -6.471755, 0, -0.5, 0.5, 0.5,
-4.075221, 1, -6.471755, 1, -0.5, 0.5, 0.5,
-4.075221, 1, -6.471755, 1, 1.5, 0.5, 0.5,
-4.075221, 1, -6.471755, 0, 1.5, 0.5, 0.5,
-4.075221, 2, -6.471755, 0, -0.5, 0.5, 0.5,
-4.075221, 2, -6.471755, 1, -0.5, 0.5, 0.5,
-4.075221, 2, -6.471755, 1, 1.5, 0.5, 0.5,
-4.075221, 2, -6.471755, 0, 1.5, 0.5, 0.5,
-4.075221, 3, -6.471755, 0, -0.5, 0.5, 0.5,
-4.075221, 3, -6.471755, 1, -0.5, 0.5, 0.5,
-4.075221, 3, -6.471755, 1, 1.5, 0.5, 0.5,
-4.075221, 3, -6.471755, 0, 1.5, 0.5, 0.5
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
-3.525866, -3.457309, -4,
-3.525866, -3.457309, 4,
-3.525866, -3.457309, -4,
-3.708984, -3.626314, -4,
-3.525866, -3.457309, -2,
-3.708984, -3.626314, -2,
-3.525866, -3.457309, 0,
-3.708984, -3.626314, 0,
-3.525866, -3.457309, 2,
-3.708984, -3.626314, 2,
-3.525866, -3.457309, 4,
-3.708984, -3.626314, 4
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
-4.075221, -3.964325, -4, 0, -0.5, 0.5, 0.5,
-4.075221, -3.964325, -4, 1, -0.5, 0.5, 0.5,
-4.075221, -3.964325, -4, 1, 1.5, 0.5, 0.5,
-4.075221, -3.964325, -4, 0, 1.5, 0.5, 0.5,
-4.075221, -3.964325, -2, 0, -0.5, 0.5, 0.5,
-4.075221, -3.964325, -2, 1, -0.5, 0.5, 0.5,
-4.075221, -3.964325, -2, 1, 1.5, 0.5, 0.5,
-4.075221, -3.964325, -2, 0, 1.5, 0.5, 0.5,
-4.075221, -3.964325, 0, 0, -0.5, 0.5, 0.5,
-4.075221, -3.964325, 0, 1, -0.5, 0.5, 0.5,
-4.075221, -3.964325, 0, 1, 1.5, 0.5, 0.5,
-4.075221, -3.964325, 0, 0, 1.5, 0.5, 0.5,
-4.075221, -3.964325, 2, 0, -0.5, 0.5, 0.5,
-4.075221, -3.964325, 2, 1, -0.5, 0.5, 0.5,
-4.075221, -3.964325, 2, 1, 1.5, 0.5, 0.5,
-4.075221, -3.964325, 2, 0, 1.5, 0.5, 0.5,
-4.075221, -3.964325, 4, 0, -0.5, 0.5, 0.5,
-4.075221, -3.964325, 4, 1, -0.5, 0.5, 0.5,
-4.075221, -3.964325, 4, 1, 1.5, 0.5, 0.5,
-4.075221, -3.964325, 4, 0, 1.5, 0.5, 0.5
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
-3.525866, -3.457309, -5.619678,
-3.525866, 3.30291, -5.619678,
-3.525866, -3.457309, 5.741357,
-3.525866, 3.30291, 5.741357,
-3.525866, -3.457309, -5.619678,
-3.525866, -3.457309, 5.741357,
-3.525866, 3.30291, -5.619678,
-3.525866, 3.30291, 5.741357,
-3.525866, -3.457309, -5.619678,
3.79887, -3.457309, -5.619678,
-3.525866, -3.457309, 5.741357,
3.79887, -3.457309, 5.741357,
-3.525866, 3.30291, -5.619678,
3.79887, 3.30291, -5.619678,
-3.525866, 3.30291, 5.741357,
3.79887, 3.30291, 5.741357,
3.79887, -3.457309, -5.619678,
3.79887, 3.30291, -5.619678,
3.79887, -3.457309, 5.741357,
3.79887, 3.30291, 5.741357,
3.79887, -3.457309, -5.619678,
3.79887, -3.457309, 5.741357,
3.79887, 3.30291, -5.619678,
3.79887, 3.30291, 5.741357
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
var radius = 8.070449;
var distance = 35.90634;
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
mvMatrix.translate( -0.1365018, 0.07719922, -0.06083965 );
mvMatrix.scale( 1.191296, 1.290776, 0.7680575 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.90634);
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
gl.drawArrays(gl.LINES, 0, 8);
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
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
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
sodium_4-dimethylami<-read.table("sodium_4-dimethylami.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-sodium_4-dimethylami$V2
```

```
## Error in eval(expr, envir, enclos): object 'sodium_4' not found
```

```r
y<-sodium_4-dimethylami$V3
```

```
## Error in eval(expr, envir, enclos): object 'sodium_4' not found
```

```r
z<-sodium_4-dimethylami$V4
```

```
## Error in eval(expr, envir, enclos): object 'sodium_4' not found
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
-3.419195, -1.435375, -1.554584, 0, 0, 1, 1, 1,
-3.414783, 1.040047, -0.7990277, 1, 0, 0, 1, 1,
-3.387047, -0.07931854, -3.853204, 1, 0, 0, 1, 1,
-3.353794, 0.9317464, -1.779865, 1, 0, 0, 1, 1,
-2.82033, -1.046568, -1.790806, 1, 0, 0, 1, 1,
-2.720203, -0.5012313, -3.839507, 1, 0, 0, 1, 1,
-2.68163, -0.7748597, -1.918219, 0, 0, 0, 1, 1,
-2.615175, -0.03208124, -1.719913, 0, 0, 0, 1, 1,
-2.612755, 0.2237148, -1.006742, 0, 0, 0, 1, 1,
-2.523026, 1.437929, 0.08097599, 0, 0, 0, 1, 1,
-2.444208, 0.05988039, -0.9678468, 0, 0, 0, 1, 1,
-2.388858, 1.143575, -2.124004, 0, 0, 0, 1, 1,
-2.348875, 1.264878, 0.1585508, 0, 0, 0, 1, 1,
-2.246124, -0.4677598, -1.088377, 1, 1, 1, 1, 1,
-2.235547, 0.1583785, -1.588868, 1, 1, 1, 1, 1,
-2.232818, -0.3135367, -0.9171904, 1, 1, 1, 1, 1,
-2.223631, -0.9454067, -1.013632, 1, 1, 1, 1, 1,
-2.203742, -1.031893, -2.40717, 1, 1, 1, 1, 1,
-2.196875, 0.86961, -1.799562, 1, 1, 1, 1, 1,
-2.19443, -0.5659335, -1.417419, 1, 1, 1, 1, 1,
-2.169569, -0.7343113, -2.037206, 1, 1, 1, 1, 1,
-2.118633, -1.588801, -2.71321, 1, 1, 1, 1, 1,
-2.086367, 0.4943027, -0.6527709, 1, 1, 1, 1, 1,
-2.062757, -1.198083, 0.2890939, 1, 1, 1, 1, 1,
-2.040799, 0.8909013, -1.734838, 1, 1, 1, 1, 1,
-1.999182, 0.846203, -0.4024403, 1, 1, 1, 1, 1,
-1.914385, 0.8687481, -1.968684, 1, 1, 1, 1, 1,
-1.898496, 0.129172, 0.1793398, 1, 1, 1, 1, 1,
-1.876413, 0.07318987, -1.807609, 0, 0, 1, 1, 1,
-1.862019, 0.02968248, -2.412827, 1, 0, 0, 1, 1,
-1.850736, -0.5734927, -1.554975, 1, 0, 0, 1, 1,
-1.833763, -0.7386737, -2.069057, 1, 0, 0, 1, 1,
-1.833057, -0.6501092, -1.884193, 1, 0, 0, 1, 1,
-1.824844, -0.09062972, -1.184495, 1, 0, 0, 1, 1,
-1.818186, 2.872277, -0.8515936, 0, 0, 0, 1, 1,
-1.807527, 0.2020751, -2.193074, 0, 0, 0, 1, 1,
-1.795128, -0.2236806, -2.126009, 0, 0, 0, 1, 1,
-1.781072, -0.2685454, -1.097511, 0, 0, 0, 1, 1,
-1.781052, 0.5686113, -1.874255, 0, 0, 0, 1, 1,
-1.777426, -1.071002, -2.304451, 0, 0, 0, 1, 1,
-1.772723, -1.717232, -2.346222, 0, 0, 0, 1, 1,
-1.763589, 0.2434854, -1.014151, 1, 1, 1, 1, 1,
-1.749224, 2.233201, -2.143087, 1, 1, 1, 1, 1,
-1.735993, 0.8791464, -3.992791, 1, 1, 1, 1, 1,
-1.724475, 1.738809, -0.8131002, 1, 1, 1, 1, 1,
-1.724229, 0.4735662, -3.51656, 1, 1, 1, 1, 1,
-1.688708, -0.09391438, -0.9503494, 1, 1, 1, 1, 1,
-1.681592, -0.1888953, -1.104751, 1, 1, 1, 1, 1,
-1.676384, -0.6909897, -3.228969, 1, 1, 1, 1, 1,
-1.668732, -0.4285614, -0.6976808, 1, 1, 1, 1, 1,
-1.660465, -0.5487695, -3.831675, 1, 1, 1, 1, 1,
-1.657633, -0.5126811, -1.602329, 1, 1, 1, 1, 1,
-1.657008, 0.3881568, -1.924124, 1, 1, 1, 1, 1,
-1.655433, 0.5421172, -0.7693964, 1, 1, 1, 1, 1,
-1.647144, -0.5624639, -3.091589, 1, 1, 1, 1, 1,
-1.642722, 1.144878, -1.291949, 1, 1, 1, 1, 1,
-1.639868, 2.424965, 1.228446, 0, 0, 1, 1, 1,
-1.636588, -2.894485, -3.402245, 1, 0, 0, 1, 1,
-1.617553, -0.1095648, -1.924069, 1, 0, 0, 1, 1,
-1.596497, 0.3111375, -1.358236, 1, 0, 0, 1, 1,
-1.589266, 0.5592973, -2.133266, 1, 0, 0, 1, 1,
-1.572581, -0.3878019, -0.6306515, 1, 0, 0, 1, 1,
-1.571657, 0.1511152, -1.071653, 0, 0, 0, 1, 1,
-1.563608, 1.54452, -2.331547, 0, 0, 0, 1, 1,
-1.563225, -1.081388, -2.184332, 0, 0, 0, 1, 1,
-1.562692, 0.7393561, -0.0429479, 0, 0, 0, 1, 1,
-1.562546, 1.788324, -0.01764592, 0, 0, 0, 1, 1,
-1.562328, -0.3919991, -1.532039, 0, 0, 0, 1, 1,
-1.556012, 0.03710118, -0.2232868, 0, 0, 0, 1, 1,
-1.537438, -0.04013488, -0.1373017, 1, 1, 1, 1, 1,
-1.507964, -1.549512, -2.041345, 1, 1, 1, 1, 1,
-1.50242, 0.6607974, -1.752785, 1, 1, 1, 1, 1,
-1.499786, -0.3568518, -1.243872, 1, 1, 1, 1, 1,
-1.480393, -0.7584959, -2.947672, 1, 1, 1, 1, 1,
-1.472372, -0.3756537, -1.592636, 1, 1, 1, 1, 1,
-1.464629, 0.2178187, -1.879762, 1, 1, 1, 1, 1,
-1.462218, -0.6632513, -3.120908, 1, 1, 1, 1, 1,
-1.456517, 0.1836368, -0.6509051, 1, 1, 1, 1, 1,
-1.455172, 1.384512, 0.0882661, 1, 1, 1, 1, 1,
-1.451759, 1.554729, -2.438904, 1, 1, 1, 1, 1,
-1.427654, 3.20446, -0.2456287, 1, 1, 1, 1, 1,
-1.421403, -0.8758588, -1.529622, 1, 1, 1, 1, 1,
-1.420056, -0.1227832, -2.906247, 1, 1, 1, 1, 1,
-1.415255, -1.316956, -0.6739119, 1, 1, 1, 1, 1,
-1.394502, -1.265619, -3.213623, 0, 0, 1, 1, 1,
-1.38617, -0.9934509, -3.890207, 1, 0, 0, 1, 1,
-1.371058, -1.303134, -2.854598, 1, 0, 0, 1, 1,
-1.367747, 0.9586635, 0.1080627, 1, 0, 0, 1, 1,
-1.366566, -2.429985, -3.220925, 1, 0, 0, 1, 1,
-1.35926, -1.105559, -1.88426, 1, 0, 0, 1, 1,
-1.348823, 0.07933258, -0.6803482, 0, 0, 0, 1, 1,
-1.341538, -1.538492, -2.797889, 0, 0, 0, 1, 1,
-1.341377, -0.9814982, -3.394477, 0, 0, 0, 1, 1,
-1.340315, 0.3107406, -1.777148, 0, 0, 0, 1, 1,
-1.339575, 0.6797197, -0.9090845, 0, 0, 0, 1, 1,
-1.311933, 0.3416277, -3.504478, 0, 0, 0, 1, 1,
-1.31045, -1.712244, -2.090105, 0, 0, 0, 1, 1,
-1.303038, -0.6614579, -1.724159, 1, 1, 1, 1, 1,
-1.297497, 1.46577, -2.284427, 1, 1, 1, 1, 1,
-1.29593, 0.2753012, -2.231891, 1, 1, 1, 1, 1,
-1.282727, -1.893834, -3.017406, 1, 1, 1, 1, 1,
-1.282474, -0.2916326, -1.019532, 1, 1, 1, 1, 1,
-1.272775, 0.1251112, -0.7757068, 1, 1, 1, 1, 1,
-1.272723, -1.308184, -3.326258, 1, 1, 1, 1, 1,
-1.263147, -2.033905, -2.741615, 1, 1, 1, 1, 1,
-1.256075, -0.2254455, -2.327671, 1, 1, 1, 1, 1,
-1.251642, 0.8679857, -0.6762558, 1, 1, 1, 1, 1,
-1.250323, -1.773466, -2.469883, 1, 1, 1, 1, 1,
-1.246091, -0.07041355, -1.484583, 1, 1, 1, 1, 1,
-1.245239, -0.6076403, -1.932077, 1, 1, 1, 1, 1,
-1.241963, -0.04603537, -1.837345, 1, 1, 1, 1, 1,
-1.24136, -1.16316, -1.154931, 1, 1, 1, 1, 1,
-1.236322, -0.7829547, -3.087545, 0, 0, 1, 1, 1,
-1.213941, 0.8132049, -1.812073, 1, 0, 0, 1, 1,
-1.211219, -1.263631, -1.786486, 1, 0, 0, 1, 1,
-1.208529, -0.9875844, -3.35668, 1, 0, 0, 1, 1,
-1.207823, 0.2915306, -1.27912, 1, 0, 0, 1, 1,
-1.206155, -0.7456397, -3.548298, 1, 0, 0, 1, 1,
-1.204139, -0.3383681, -2.800356, 0, 0, 0, 1, 1,
-1.200651, 0.6274531, -0.462126, 0, 0, 0, 1, 1,
-1.197485, -0.0518611, -1.863851, 0, 0, 0, 1, 1,
-1.186246, 1.93303, 0.1691465, 0, 0, 0, 1, 1,
-1.182814, 0.4992839, -1.629462, 0, 0, 0, 1, 1,
-1.181673, -1.71432, -2.925884, 0, 0, 0, 1, 1,
-1.181292, 1.306141, 1.1753, 0, 0, 0, 1, 1,
-1.179577, -0.9305421, -0.9500484, 1, 1, 1, 1, 1,
-1.177053, 1.246703, -2.658902, 1, 1, 1, 1, 1,
-1.172746, -1.192722, -2.791563, 1, 1, 1, 1, 1,
-1.171562, 0.4108631, -0.01436102, 1, 1, 1, 1, 1,
-1.168527, -2.685511, -2.36603, 1, 1, 1, 1, 1,
-1.16797, -0.6716561, -2.269233, 1, 1, 1, 1, 1,
-1.166939, 0.108449, -1.437036, 1, 1, 1, 1, 1,
-1.153056, 1.059935, 0.135332, 1, 1, 1, 1, 1,
-1.151933, -0.6853427, -3.604841, 1, 1, 1, 1, 1,
-1.149709, 0.1273813, -0.5110049, 1, 1, 1, 1, 1,
-1.143222, -1.142343, -2.817939, 1, 1, 1, 1, 1,
-1.142268, 2.557027, -0.9351109, 1, 1, 1, 1, 1,
-1.139262, 1.185468, -1.615261, 1, 1, 1, 1, 1,
-1.137304, 1.850658, -1.772578, 1, 1, 1, 1, 1,
-1.12917, 1.028068, -0.2096582, 1, 1, 1, 1, 1,
-1.128677, -0.5210534, -3.156739, 0, 0, 1, 1, 1,
-1.127124, 2.320441, 1.090962, 1, 0, 0, 1, 1,
-1.122917, -0.6983519, -2.258881, 1, 0, 0, 1, 1,
-1.115748, -2.169665, -2.615905, 1, 0, 0, 1, 1,
-1.110899, 0.7470981, -0.4132442, 1, 0, 0, 1, 1,
-1.105678, -1.918225, -1.81829, 1, 0, 0, 1, 1,
-1.105233, -0.4610745, -1.218632, 0, 0, 0, 1, 1,
-1.105005, -0.1203953, -1.632335, 0, 0, 0, 1, 1,
-1.103791, 0.008897145, -1.005029, 0, 0, 0, 1, 1,
-1.093241, 1.492519, -0.6223427, 0, 0, 0, 1, 1,
-1.074742, 0.9732822, -0.5663632, 0, 0, 0, 1, 1,
-1.067955, 0.495013, -1.724328, 0, 0, 0, 1, 1,
-1.065404, 0.117289, -1.771907, 0, 0, 0, 1, 1,
-1.065357, 0.5201914, -0.5332158, 1, 1, 1, 1, 1,
-1.05582, -0.1430776, -0.8850854, 1, 1, 1, 1, 1,
-1.052678, 1.455939, -1.042323, 1, 1, 1, 1, 1,
-1.044906, -0.9618334, -2.957172, 1, 1, 1, 1, 1,
-1.043645, 0.945143, -0.6274294, 1, 1, 1, 1, 1,
-1.039581, -0.5114209, -2.916736, 1, 1, 1, 1, 1,
-1.022089, -0.2919184, -3.18086, 1, 1, 1, 1, 1,
-1.011613, 1.194338, 0.3987978, 1, 1, 1, 1, 1,
-1.006104, -0.6699844, -1.246678, 1, 1, 1, 1, 1,
-1.005391, 1.331692, -0.322889, 1, 1, 1, 1, 1,
-1.001664, 0.2211978, -1.146417, 1, 1, 1, 1, 1,
-0.9982765, 0.3418512, -3.213291, 1, 1, 1, 1, 1,
-0.9952999, 3.030603, 0.4818191, 1, 1, 1, 1, 1,
-0.9916506, -0.9807854, -3.439773, 1, 1, 1, 1, 1,
-0.9903378, -0.04311642, -2.351066, 1, 1, 1, 1, 1,
-0.988299, -1.062345, -2.830753, 0, 0, 1, 1, 1,
-0.9833871, 0.9172641, -2.366176, 1, 0, 0, 1, 1,
-0.9752014, 1.504427, -1.243142, 1, 0, 0, 1, 1,
-0.9723573, 0.6158882, -1.01761, 1, 0, 0, 1, 1,
-0.9677165, -0.4698329, -1.076624, 1, 0, 0, 1, 1,
-0.9653712, 0.7855164, -1.260843, 1, 0, 0, 1, 1,
-0.9614318, 0.2843639, -2.882024, 0, 0, 0, 1, 1,
-0.955657, -1.931425, -3.365314, 0, 0, 0, 1, 1,
-0.9547567, -1.028701, -1.346399, 0, 0, 0, 1, 1,
-0.9538522, 0.6574889, 0.3947752, 0, 0, 0, 1, 1,
-0.9481546, -0.7836466, -1.535675, 0, 0, 0, 1, 1,
-0.9470331, 0.3562089, -1.68222, 0, 0, 0, 1, 1,
-0.94236, 0.1102956, -0.2381391, 0, 0, 0, 1, 1,
-0.9328766, -0.7563117, -4.11025, 1, 1, 1, 1, 1,
-0.9306926, 0.3026051, -3.476188, 1, 1, 1, 1, 1,
-0.9278874, -1.299259, -1.686718, 1, 1, 1, 1, 1,
-0.9264306, 0.4122172, -1.187896, 1, 1, 1, 1, 1,
-0.9235294, -0.7718095, -1.035126, 1, 1, 1, 1, 1,
-0.9187306, 1.706753, -2.279662, 1, 1, 1, 1, 1,
-0.9140754, -3.358859, -2.179914, 1, 1, 1, 1, 1,
-0.9119093, -1.305294, -2.18122, 1, 1, 1, 1, 1,
-0.9105227, -1.218004, -1.013707, 1, 1, 1, 1, 1,
-0.9095576, 0.9340533, -0.9029165, 1, 1, 1, 1, 1,
-0.8959223, 1.058041, -0.1943502, 1, 1, 1, 1, 1,
-0.8861335, 0.2795454, -0.358078, 1, 1, 1, 1, 1,
-0.8823927, 0.144749, -0.3383483, 1, 1, 1, 1, 1,
-0.8814744, -0.1021318, -0.02873017, 1, 1, 1, 1, 1,
-0.8777648, -0.2846377, -1.741148, 1, 1, 1, 1, 1,
-0.8759811, -0.7028913, -2.731839, 0, 0, 1, 1, 1,
-0.8757477, 1.396631, -0.9951534, 1, 0, 0, 1, 1,
-0.873419, 0.3977853, -1.537156, 1, 0, 0, 1, 1,
-0.8719308, 0.1068862, -1.536094, 1, 0, 0, 1, 1,
-0.8707451, 0.8305988, 0.7071912, 1, 0, 0, 1, 1,
-0.865707, 0.08573363, -1.200797, 1, 0, 0, 1, 1,
-0.8630039, 1.83825, -1.459532, 0, 0, 0, 1, 1,
-0.8620669, 0.01048091, -1.625676, 0, 0, 0, 1, 1,
-0.8560534, 0.1765162, -0.9093561, 0, 0, 0, 1, 1,
-0.8534243, 0.5786248, 1.080236, 0, 0, 0, 1, 1,
-0.8519447, 0.1391037, -1.457557, 0, 0, 0, 1, 1,
-0.8511464, 0.1929698, -0.6660024, 0, 0, 0, 1, 1,
-0.8507886, -0.2180244, -0.4708144, 0, 0, 0, 1, 1,
-0.849898, 0.06781218, 0.4854053, 1, 1, 1, 1, 1,
-0.8321283, 0.6062552, -0.7758088, 1, 1, 1, 1, 1,
-0.8310757, -1.435276, -4.529241, 1, 1, 1, 1, 1,
-0.828249, -0.02007738, -1.658857, 1, 1, 1, 1, 1,
-0.8254043, -0.5683426, -2.354976, 1, 1, 1, 1, 1,
-0.8209901, -2.300644, -4.025977, 1, 1, 1, 1, 1,
-0.8113593, 0.5334242, -1.941894, 1, 1, 1, 1, 1,
-0.7999272, 0.9143539, 0.2085359, 1, 1, 1, 1, 1,
-0.7945149, 0.6894403, -1.584722, 1, 1, 1, 1, 1,
-0.787299, 1.773026, 1.200305, 1, 1, 1, 1, 1,
-0.7844024, 0.5319768, -0.3034629, 1, 1, 1, 1, 1,
-0.7786649, -1.378372, -2.740448, 1, 1, 1, 1, 1,
-0.7719492, -0.628535, -2.933527, 1, 1, 1, 1, 1,
-0.7669835, 0.9938272, -1.723526, 1, 1, 1, 1, 1,
-0.7652478, -0.0268749, -1.998999, 1, 1, 1, 1, 1,
-0.7619247, -0.8667319, -3.758168, 0, 0, 1, 1, 1,
-0.7590724, -0.1252296, -1.161735, 1, 0, 0, 1, 1,
-0.7504675, -0.08086836, -1.637247, 1, 0, 0, 1, 1,
-0.7489688, 1.234542, 0.7364385, 1, 0, 0, 1, 1,
-0.7380342, 0.8713869, -0.8114073, 1, 0, 0, 1, 1,
-0.7316901, -0.9073484, -4.15748, 1, 0, 0, 1, 1,
-0.7295585, -0.5586409, -1.209089, 0, 0, 0, 1, 1,
-0.7252966, 0.4809016, 1.320665, 0, 0, 0, 1, 1,
-0.7205581, -0.2173738, 0.02239849, 0, 0, 0, 1, 1,
-0.7154362, -0.849498, -1.994425, 0, 0, 0, 1, 1,
-0.7126842, -0.4867924, -1.939962, 0, 0, 0, 1, 1,
-0.7103226, -1.830045, -2.796022, 0, 0, 0, 1, 1,
-0.6988169, -0.02094252, -2.34322, 0, 0, 0, 1, 1,
-0.6964831, 2.127168, 0.7464216, 1, 1, 1, 1, 1,
-0.6865861, 0.6370199, 0.150703, 1, 1, 1, 1, 1,
-0.681602, 0.1050608, -1.272147, 1, 1, 1, 1, 1,
-0.6814592, 0.1911394, -2.294145, 1, 1, 1, 1, 1,
-0.6811289, -0.5925044, -2.451558, 1, 1, 1, 1, 1,
-0.6789324, -1.127556, -3.333697, 1, 1, 1, 1, 1,
-0.672967, -0.3065136, -2.352039, 1, 1, 1, 1, 1,
-0.6682194, 0.7574521, -0.2608435, 1, 1, 1, 1, 1,
-0.6598926, -0.3486809, -1.739732, 1, 1, 1, 1, 1,
-0.6594334, -0.4047663, -1.256564, 1, 1, 1, 1, 1,
-0.6523299, -0.7759728, -2.123219, 1, 1, 1, 1, 1,
-0.6482213, 0.02956784, -1.533147, 1, 1, 1, 1, 1,
-0.645336, -0.7117597, -1.229189, 1, 1, 1, 1, 1,
-0.6440635, 0.3658886, -1.435899, 1, 1, 1, 1, 1,
-0.6415299, 2.13134, 0.2549024, 1, 1, 1, 1, 1,
-0.6390591, 2.257941, -0.2135417, 0, 0, 1, 1, 1,
-0.6355242, -1.643121, -3.417088, 1, 0, 0, 1, 1,
-0.6307248, 0.6805496, -2.168823, 1, 0, 0, 1, 1,
-0.6293165, -1.179431, -2.803998, 1, 0, 0, 1, 1,
-0.627229, 1.378594, -0.3307031, 1, 0, 0, 1, 1,
-0.6224524, 2.956125, -0.2321961, 1, 0, 0, 1, 1,
-0.6221024, 0.8349138, -1.873876, 0, 0, 0, 1, 1,
-0.6210597, 0.8694369, -1.672552, 0, 0, 0, 1, 1,
-0.6195028, 0.5811098, -1.150427, 0, 0, 0, 1, 1,
-0.6186059, -1.433834, -3.798615, 0, 0, 0, 1, 1,
-0.6118366, 0.9613103, -0.6834905, 0, 0, 0, 1, 1,
-0.6110903, 1.069129, 0.4859105, 0, 0, 0, 1, 1,
-0.6054012, -0.8408332, -1.536779, 0, 0, 0, 1, 1,
-0.6007261, -0.2352768, -2.112994, 1, 1, 1, 1, 1,
-0.5980303, -0.6752949, -2.201811, 1, 1, 1, 1, 1,
-0.5975426, 0.3567091, -1.697475, 1, 1, 1, 1, 1,
-0.5975078, 1.004341, -1.10127, 1, 1, 1, 1, 1,
-0.5972692, 1.450714, -0.06564844, 1, 1, 1, 1, 1,
-0.5895442, -0.9734283, -3.599067, 1, 1, 1, 1, 1,
-0.5889063, 1.109569, -0.7298301, 1, 1, 1, 1, 1,
-0.5885016, 0.4997687, -1.196001, 1, 1, 1, 1, 1,
-0.5863747, -0.3433039, -1.885007, 1, 1, 1, 1, 1,
-0.5855086, -0.05100141, -1.00769, 1, 1, 1, 1, 1,
-0.5825506, 0.4584066, -1.027552, 1, 1, 1, 1, 1,
-0.5822915, -1.651574, -1.683184, 1, 1, 1, 1, 1,
-0.582077, 0.2798524, -1.01017, 1, 1, 1, 1, 1,
-0.5809367, -0.2591585, -1.914722, 1, 1, 1, 1, 1,
-0.5778915, -1.005787, -2.507057, 1, 1, 1, 1, 1,
-0.5731864, 0.4967963, 0.01693187, 0, 0, 1, 1, 1,
-0.5720485, -0.1049265, -1.900931, 1, 0, 0, 1, 1,
-0.5697337, -0.1881058, -3.413009, 1, 0, 0, 1, 1,
-0.5693576, -1.060269, -1.825547, 1, 0, 0, 1, 1,
-0.5679067, 1.770403, 1.805047, 1, 0, 0, 1, 1,
-0.5650586, 0.9551645, -0.8425493, 1, 0, 0, 1, 1,
-0.564182, 0.7344238, 0.6208094, 0, 0, 0, 1, 1,
-0.5578876, -0.2489942, -1.835499, 0, 0, 0, 1, 1,
-0.5574191, -0.1523779, -2.678948, 0, 0, 0, 1, 1,
-0.5533493, 0.9826127, 0.5319134, 0, 0, 0, 1, 1,
-0.550498, -0.2491218, -1.086057, 0, 0, 0, 1, 1,
-0.5479178, -0.5312586, -1.831398, 0, 0, 0, 1, 1,
-0.5467914, 1.488642, 0.1925458, 0, 0, 0, 1, 1,
-0.5463628, -1.037872, -1.654327, 1, 1, 1, 1, 1,
-0.5449218, -1.325383, -2.632006, 1, 1, 1, 1, 1,
-0.5384118, -0.9346352, -3.700685, 1, 1, 1, 1, 1,
-0.5375816, 0.5845387, -0.8384138, 1, 1, 1, 1, 1,
-0.5321281, 0.1201347, -0.08197042, 1, 1, 1, 1, 1,
-0.5296038, -0.5291562, -2.226303, 1, 1, 1, 1, 1,
-0.5293084, -0.7229053, -4.056547, 1, 1, 1, 1, 1,
-0.5290166, 0.990424, -0.8647115, 1, 1, 1, 1, 1,
-0.5243441, 0.278371, -2.292685, 1, 1, 1, 1, 1,
-0.5225239, 0.501835, -0.7533513, 1, 1, 1, 1, 1,
-0.5199756, 0.7207465, -0.119729, 1, 1, 1, 1, 1,
-0.5182703, 0.4802301, -1.337458, 1, 1, 1, 1, 1,
-0.5178977, -1.715044, -2.512297, 1, 1, 1, 1, 1,
-0.5178363, -1.497645, -1.972017, 1, 1, 1, 1, 1,
-0.5169507, 1.665027, -1.657697, 1, 1, 1, 1, 1,
-0.515398, 2.172543, 1.019362, 0, 0, 1, 1, 1,
-0.5129595, 0.8129001, -0.9298582, 1, 0, 0, 1, 1,
-0.5090089, -1.2967, -2.639102, 1, 0, 0, 1, 1,
-0.5057288, -1.017244, -2.986724, 1, 0, 0, 1, 1,
-0.5051628, 0.9050454, -1.809683, 1, 0, 0, 1, 1,
-0.5047513, 0.5541133, 1.997801, 1, 0, 0, 1, 1,
-0.4852507, -0.2216827, -1.959029, 0, 0, 0, 1, 1,
-0.4849468, 1.588181, -1.348073, 0, 0, 0, 1, 1,
-0.4832036, -0.7278587, -2.700119, 0, 0, 0, 1, 1,
-0.4812022, 0.5474476, -0.8220727, 0, 0, 0, 1, 1,
-0.4801391, 0.7555884, 1.003213, 0, 0, 0, 1, 1,
-0.4744456, -0.2765242, -1.413462, 0, 0, 0, 1, 1,
-0.4738487, -0.5573895, -2.786887, 0, 0, 0, 1, 1,
-0.4714484, 0.1410459, -1.646023, 1, 1, 1, 1, 1,
-0.4695062, -0.4074438, -1.085667, 1, 1, 1, 1, 1,
-0.4686946, 0.7813568, -0.147816, 1, 1, 1, 1, 1,
-0.4630046, -0.102682, -2.723344, 1, 1, 1, 1, 1,
-0.4620509, -0.1695397, -3.233942, 1, 1, 1, 1, 1,
-0.4617522, -1.394213, -3.634561, 1, 1, 1, 1, 1,
-0.4589145, -0.186921, -1.83938, 1, 1, 1, 1, 1,
-0.4515, 0.1744469, -1.085697, 1, 1, 1, 1, 1,
-0.4499342, 0.7681397, 0.2579141, 1, 1, 1, 1, 1,
-0.4425106, 0.2517435, -2.422795, 1, 1, 1, 1, 1,
-0.4373764, 1.770886, -0.2752767, 1, 1, 1, 1, 1,
-0.432313, -0.8193403, -2.628996, 1, 1, 1, 1, 1,
-0.4306615, 0.06770848, -1.397725, 1, 1, 1, 1, 1,
-0.4298372, 0.1053743, -2.192227, 1, 1, 1, 1, 1,
-0.4276828, 0.4306993, -2.177776, 1, 1, 1, 1, 1,
-0.4198416, -0.6606904, -4.217512, 0, 0, 1, 1, 1,
-0.4184693, -2.543728, -2.075064, 1, 0, 0, 1, 1,
-0.418249, 1.410321, -0.2491291, 1, 0, 0, 1, 1,
-0.412127, 0.5977851, -0.6310725, 1, 0, 0, 1, 1,
-0.4102107, -0.8466235, -2.347888, 1, 0, 0, 1, 1,
-0.4053471, -0.3943745, -1.404945, 1, 0, 0, 1, 1,
-0.4040731, 0.7707219, -1.018661, 0, 0, 0, 1, 1,
-0.401941, 0.9823107, 0.580155, 0, 0, 0, 1, 1,
-0.4019347, 0.3578107, -1.763663, 0, 0, 0, 1, 1,
-0.3995468, 1.121793, 1.544785, 0, 0, 0, 1, 1,
-0.3983346, -1.778182, -3.6979, 0, 0, 0, 1, 1,
-0.3972323, -0.9131659, -4.574713, 0, 0, 0, 1, 1,
-0.3961673, -0.5008054, -0.8581546, 0, 0, 0, 1, 1,
-0.3920806, -1.308821, -1.110148, 1, 1, 1, 1, 1,
-0.3914208, 1.980654, 0.5553262, 1, 1, 1, 1, 1,
-0.3911004, -0.2270566, -2.789505, 1, 1, 1, 1, 1,
-0.383489, 0.4429274, 0.2152224, 1, 1, 1, 1, 1,
-0.3792574, -0.7346481, -3.350687, 1, 1, 1, 1, 1,
-0.3758098, -0.06336205, 0.1414287, 1, 1, 1, 1, 1,
-0.3745631, -0.7591888, -3.489409, 1, 1, 1, 1, 1,
-0.3686206, -0.9655318, -0.6594317, 1, 1, 1, 1, 1,
-0.3682764, 0.634124, -1.922999, 1, 1, 1, 1, 1,
-0.3675792, -0.1476761, -1.509369, 1, 1, 1, 1, 1,
-0.3629541, -1.704811, -4.047294, 1, 1, 1, 1, 1,
-0.3615006, 0.1304311, -0.02421041, 1, 1, 1, 1, 1,
-0.3601927, 1.021256, 0.5427683, 1, 1, 1, 1, 1,
-0.3591236, -0.08541434, -1.357542, 1, 1, 1, 1, 1,
-0.3542207, -1.163906, -4.197231, 1, 1, 1, 1, 1,
-0.3514463, -0.123064, -3.367311, 0, 0, 1, 1, 1,
-0.3461424, -0.5137363, -2.032161, 1, 0, 0, 1, 1,
-0.3441091, -0.3738095, -2.468635, 1, 0, 0, 1, 1,
-0.3439918, 1.291985, -2.229667, 1, 0, 0, 1, 1,
-0.3421328, -0.3547348, -3.623614, 1, 0, 0, 1, 1,
-0.339952, -1.7284, -1.988137, 1, 0, 0, 1, 1,
-0.3371529, 0.4267536, -0.4777652, 0, 0, 0, 1, 1,
-0.3347895, -0.05178789, -2.705197, 0, 0, 0, 1, 1,
-0.3222673, -0.4769449, -2.536381, 0, 0, 0, 1, 1,
-0.3208622, -0.139592, -3.293963, 0, 0, 0, 1, 1,
-0.3182106, 1.142704, -0.5072276, 0, 0, 0, 1, 1,
-0.3138958, 1.305785, 0.4151288, 0, 0, 0, 1, 1,
-0.3121803, 1.60116, -1.188353, 0, 0, 0, 1, 1,
-0.3102542, -0.3115196, -1.43766, 1, 1, 1, 1, 1,
-0.3046087, -0.9274256, -1.350964, 1, 1, 1, 1, 1,
-0.2999724, -1.014746, -2.312002, 1, 1, 1, 1, 1,
-0.2971741, -0.7829635, -2.952616, 1, 1, 1, 1, 1,
-0.2963509, -0.2976744, -3.267911, 1, 1, 1, 1, 1,
-0.2962205, 0.6187974, 0.3710304, 1, 1, 1, 1, 1,
-0.2946, -0.7865069, -3.786028, 1, 1, 1, 1, 1,
-0.2904164, 0.4088031, -0.2400969, 1, 1, 1, 1, 1,
-0.2892023, 1.133459, -0.1484022, 1, 1, 1, 1, 1,
-0.285517, 1.008967, -3.632085, 1, 1, 1, 1, 1,
-0.2817385, -0.9689247, -2.923311, 1, 1, 1, 1, 1,
-0.2782829, -0.6978918, -4.151775, 1, 1, 1, 1, 1,
-0.2768831, 1.816528, -0.2354393, 1, 1, 1, 1, 1,
-0.2767665, -0.8889955, -2.178371, 1, 1, 1, 1, 1,
-0.2738851, 1.063501, -0.5059273, 1, 1, 1, 1, 1,
-0.2700588, -1.205203, -2.725631, 0, 0, 1, 1, 1,
-0.2658455, 0.1804649, -3.528164, 1, 0, 0, 1, 1,
-0.2654055, 0.6896083, -2.360274, 1, 0, 0, 1, 1,
-0.2567476, 0.04882138, -4.569061, 1, 0, 0, 1, 1,
-0.2539513, 0.4268163, -0.1179815, 1, 0, 0, 1, 1,
-0.2534603, 0.5514737, -0.2929667, 1, 0, 0, 1, 1,
-0.2492867, -1.193417, -2.706267, 0, 0, 0, 1, 1,
-0.2467645, 0.4118441, -0.4736633, 0, 0, 0, 1, 1,
-0.2402487, 0.6332376, 0.1187855, 0, 0, 0, 1, 1,
-0.238463, 0.2084046, 0.3470124, 0, 0, 0, 1, 1,
-0.2380151, -0.3088038, -2.194403, 0, 0, 0, 1, 1,
-0.2370656, 0.2317326, -0.6308724, 0, 0, 0, 1, 1,
-0.2365067, 0.250012, -3.024659, 0, 0, 0, 1, 1,
-0.235205, 0.4582019, -1.814135, 1, 1, 1, 1, 1,
-0.2307004, -0.1906875, -3.088243, 1, 1, 1, 1, 1,
-0.2290046, 1.289989, 0.4407115, 1, 1, 1, 1, 1,
-0.2263012, 0.2845994, -0.7295641, 1, 1, 1, 1, 1,
-0.2230282, -1.472492, -3.67817, 1, 1, 1, 1, 1,
-0.2149008, 0.4665411, -0.5392231, 1, 1, 1, 1, 1,
-0.2146188, -0.3035808, -1.321668, 1, 1, 1, 1, 1,
-0.2132766, -1.725375, -1.402808, 1, 1, 1, 1, 1,
-0.2132362, 0.4879135, 1.040108, 1, 1, 1, 1, 1,
-0.2122277, -2.221073, -3.497349, 1, 1, 1, 1, 1,
-0.211512, -0.01747867, -0.7789299, 1, 1, 1, 1, 1,
-0.2113265, 0.2705913, -0.2589148, 1, 1, 1, 1, 1,
-0.210345, 0.8431742, 0.3810044, 1, 1, 1, 1, 1,
-0.20698, 2.287282, -0.6590369, 1, 1, 1, 1, 1,
-0.2050499, -1.887355, -4.002991, 1, 1, 1, 1, 1,
-0.2036264, -0.6215309, -4.417506, 0, 0, 1, 1, 1,
-0.2000807, 0.6938951, -0.3268575, 1, 0, 0, 1, 1,
-0.1995926, 1.573149, -0.7530749, 1, 0, 0, 1, 1,
-0.1986361, 0.04441788, -2.129036, 1, 0, 0, 1, 1,
-0.19826, -0.424713, -3.077646, 1, 0, 0, 1, 1,
-0.1975134, 0.4147447, -0.8367826, 1, 0, 0, 1, 1,
-0.1929584, 1.179782, -1.464462, 0, 0, 0, 1, 1,
-0.1909627, 0.05708753, -1.030492, 0, 0, 0, 1, 1,
-0.1819207, 0.4276152, -0.55753, 0, 0, 0, 1, 1,
-0.178274, -0.5423697, -3.992542, 0, 0, 0, 1, 1,
-0.1651426, 0.750734, -0.2178629, 0, 0, 0, 1, 1,
-0.162165, -0.1613342, -1.558309, 0, 0, 0, 1, 1,
-0.1559376, 0.9934573, 0.3696639, 0, 0, 0, 1, 1,
-0.1509018, 0.7224877, 0.8610899, 1, 1, 1, 1, 1,
-0.1477164, -0.53981, -1.128839, 1, 1, 1, 1, 1,
-0.1459977, -0.1609714, -2.419462, 1, 1, 1, 1, 1,
-0.1427331, -0.9232933, -2.546779, 1, 1, 1, 1, 1,
-0.140918, 0.1148277, -0.8749127, 1, 1, 1, 1, 1,
-0.1378102, -0.8380402, -4.187407, 1, 1, 1, 1, 1,
-0.1361096, -0.4642058, -3.439023, 1, 1, 1, 1, 1,
-0.1297001, -0.6723497, -2.611598, 1, 1, 1, 1, 1,
-0.1273343, -0.7996311, -2.634528, 1, 1, 1, 1, 1,
-0.1237595, 0.7384266, 1.637976, 1, 1, 1, 1, 1,
-0.1220446, -1.036006, -2.339294, 1, 1, 1, 1, 1,
-0.1194933, 0.1282393, -2.554236, 1, 1, 1, 1, 1,
-0.1188011, 2.779137, 0.4746441, 1, 1, 1, 1, 1,
-0.1176408, 1.028947, -0.04942374, 1, 1, 1, 1, 1,
-0.1160904, -1.281368, -2.794652, 1, 1, 1, 1, 1,
-0.1045262, -0.6557162, -4.429115, 0, 0, 1, 1, 1,
-0.1005004, -1.792095, -5.454226, 1, 0, 0, 1, 1,
-0.09595845, 0.5433133, -0.544167, 1, 0, 0, 1, 1,
-0.09379378, 0.06914666, -0.2321279, 1, 0, 0, 1, 1,
-0.09284078, 0.7638851, 0.5092152, 1, 0, 0, 1, 1,
-0.09268834, -0.1935762, -4.261325, 1, 0, 0, 1, 1,
-0.08894967, -0.6329769, -2.156188, 0, 0, 0, 1, 1,
-0.08714169, 0.5370215, -1.429162, 0, 0, 0, 1, 1,
-0.08685549, 1.351203, 0.9249493, 0, 0, 0, 1, 1,
-0.08428954, -0.03266302, -3.883398, 0, 0, 0, 1, 1,
-0.08421891, 1.010273, -0.2863706, 0, 0, 0, 1, 1,
-0.0827055, -1.117548, -4.336762, 0, 0, 0, 1, 1,
-0.08118892, -2.063936, -2.337732, 0, 0, 0, 1, 1,
-0.07890457, -1.176773, -3.751793, 1, 1, 1, 1, 1,
-0.07836211, 0.6386933, 0.3379303, 1, 1, 1, 1, 1,
-0.07107102, 0.1750539, -0.4946789, 1, 1, 1, 1, 1,
-0.06425095, -0.1956866, -4.187799, 1, 1, 1, 1, 1,
-0.06325942, -0.05474402, -2.096087, 1, 1, 1, 1, 1,
-0.06034882, -0.6533497, -3.026606, 1, 1, 1, 1, 1,
-0.05918851, -1.274595, -4.08172, 1, 1, 1, 1, 1,
-0.05789559, -1.741158, -3.55625, 1, 1, 1, 1, 1,
-0.05382023, -0.2761982, -3.548392, 1, 1, 1, 1, 1,
-0.05234937, -0.1870121, -1.898881, 1, 1, 1, 1, 1,
-0.0419747, -1.267279, -4.040182, 1, 1, 1, 1, 1,
-0.04081567, -0.736312, -1.929049, 1, 1, 1, 1, 1,
-0.03846111, -0.8768281, -1.377733, 1, 1, 1, 1, 1,
-0.03175119, -0.4086213, -3.20888, 1, 1, 1, 1, 1,
-0.02838182, -0.8776643, -2.81536, 1, 1, 1, 1, 1,
-0.0272212, -0.2483114, -2.299127, 0, 0, 1, 1, 1,
-0.02312163, -1.061309, -3.101434, 1, 0, 0, 1, 1,
-0.01989762, -0.177852, -3.556747, 1, 0, 0, 1, 1,
-0.01292338, 0.418557, -0.9768866, 1, 0, 0, 1, 1,
-0.01178657, 0.2810562, -1.052553, 1, 0, 0, 1, 1,
-0.01108655, -0.4987612, -2.522324, 1, 0, 0, 1, 1,
-0.002388485, 1.79444, -0.04295649, 0, 0, 0, 1, 1,
0.0007991715, 0.4485981, -0.2739158, 0, 0, 0, 1, 1,
0.00247405, 0.513728, 1.081614, 0, 0, 0, 1, 1,
0.002568604, -0.8434753, 3.272371, 0, 0, 0, 1, 1,
0.003512399, 0.3824814, 0.2040146, 0, 0, 0, 1, 1,
0.005033082, 0.6363002, 0.09553327, 0, 0, 0, 1, 1,
0.005495726, -0.6487198, 3.121723, 0, 0, 0, 1, 1,
0.01026605, 2.293235, 1.131204, 1, 1, 1, 1, 1,
0.01218818, 0.9589729, 1.187839, 1, 1, 1, 1, 1,
0.01311025, 1.013675, -0.09705747, 1, 1, 1, 1, 1,
0.01372474, -1.519811, 2.084868, 1, 1, 1, 1, 1,
0.01450437, -1.730456, 2.381679, 1, 1, 1, 1, 1,
0.0179581, -0.6443694, 4.794599, 1, 1, 1, 1, 1,
0.02040513, -0.8950464, 2.700809, 1, 1, 1, 1, 1,
0.02177668, -0.1805547, 2.380718, 1, 1, 1, 1, 1,
0.02200213, 0.7557269, 0.1126992, 1, 1, 1, 1, 1,
0.02383758, -0.3831982, 3.313976, 1, 1, 1, 1, 1,
0.02485754, 1.063711, -0.1167484, 1, 1, 1, 1, 1,
0.02679876, 0.9154193, 0.9332614, 1, 1, 1, 1, 1,
0.02832637, -0.5870597, 2.396739, 1, 1, 1, 1, 1,
0.02923262, -1.402874, 3.229202, 1, 1, 1, 1, 1,
0.03227921, 0.8776057, -0.4190221, 1, 1, 1, 1, 1,
0.03774075, -0.5450435, 4.015179, 0, 0, 1, 1, 1,
0.0380168, 0.7052808, -0.7064422, 1, 0, 0, 1, 1,
0.04057119, -0.709286, 2.763489, 1, 0, 0, 1, 1,
0.04590714, -0.9487471, 3.26057, 1, 0, 0, 1, 1,
0.05087613, 1.267078, 1.600156, 1, 0, 0, 1, 1,
0.05125413, 1.169405, -1.234722, 1, 0, 0, 1, 1,
0.05370005, 0.6571227, -0.3079131, 0, 0, 0, 1, 1,
0.0559456, -0.06766384, 0.9707943, 0, 0, 0, 1, 1,
0.06280422, -1.01085, 0.9097245, 0, 0, 0, 1, 1,
0.06305739, -0.4211299, 2.355951, 0, 0, 0, 1, 1,
0.06758357, 0.2897214, 0.04071986, 0, 0, 0, 1, 1,
0.06771602, -0.7367816, 0.6990981, 0, 0, 0, 1, 1,
0.07805226, 1.233542, -0.3060523, 0, 0, 0, 1, 1,
0.07839301, -1.166972, 3.732718, 1, 1, 1, 1, 1,
0.07946437, -1.247228, 3.355512, 1, 1, 1, 1, 1,
0.07956745, -1.114656, 2.244689, 1, 1, 1, 1, 1,
0.08002637, 0.5615708, -1.28206, 1, 1, 1, 1, 1,
0.08197493, 1.803967, 1.268187, 1, 1, 1, 1, 1,
0.08538475, -1.034214, 4.296561, 1, 1, 1, 1, 1,
0.08543751, -1.134699, 1.335873, 1, 1, 1, 1, 1,
0.08726827, -0.1810176, 3.287126, 1, 1, 1, 1, 1,
0.09524972, -0.6673585, 1.428785, 1, 1, 1, 1, 1,
0.09618021, 0.6553245, 1.158509, 1, 1, 1, 1, 1,
0.1018133, -0.8479364, 2.797172, 1, 1, 1, 1, 1,
0.1050756, 2.045843, -0.008232607, 1, 1, 1, 1, 1,
0.1051202, 0.3880008, -0.8684481, 1, 1, 1, 1, 1,
0.106497, -1.623488, 2.576176, 1, 1, 1, 1, 1,
0.1068646, -0.02154027, 1.228484, 1, 1, 1, 1, 1,
0.1083085, 1.74166, -0.5702123, 0, 0, 1, 1, 1,
0.1163488, 1.238845, 1.004873, 1, 0, 0, 1, 1,
0.1167885, 0.7130118, 2.130831, 1, 0, 0, 1, 1,
0.1200785, -0.7484423, 2.695756, 1, 0, 0, 1, 1,
0.1203505, -2.067174, 3.51385, 1, 0, 0, 1, 1,
0.1241141, -1.030184, 2.528674, 1, 0, 0, 1, 1,
0.1241958, -0.03353452, 1.250749, 0, 0, 0, 1, 1,
0.1255174, -1.244423, 2.783215, 0, 0, 0, 1, 1,
0.1256483, 0.5037041, -0.9429416, 0, 0, 0, 1, 1,
0.1306271, 0.7372835, -1.069393, 0, 0, 0, 1, 1,
0.1306346, -1.713402, 4.061868, 0, 0, 0, 1, 1,
0.134053, 0.263745, 1.272339, 0, 0, 0, 1, 1,
0.1345334, 0.02145045, 0.6582897, 0, 0, 0, 1, 1,
0.1388615, -0.7164571, 3.075566, 1, 1, 1, 1, 1,
0.1389721, 0.8662473, 1.259294, 1, 1, 1, 1, 1,
0.1427016, 0.7557561, 0.1862259, 1, 1, 1, 1, 1,
0.1468392, -0.6219159, 2.333095, 1, 1, 1, 1, 1,
0.1526521, -1.450504, 3.219199, 1, 1, 1, 1, 1,
0.1528927, 0.07896417, 2.868718, 1, 1, 1, 1, 1,
0.1623849, -0.888438, 1.526866, 1, 1, 1, 1, 1,
0.1707067, 1.020409, 0.9813006, 1, 1, 1, 1, 1,
0.1722875, -1.337427, 1.738752, 1, 1, 1, 1, 1,
0.1736198, 0.1470167, -0.3941392, 1, 1, 1, 1, 1,
0.1741934, -1.258289, 2.662994, 1, 1, 1, 1, 1,
0.1753782, -1.55824, 2.306527, 1, 1, 1, 1, 1,
0.1757151, 1.495056, -0.8341352, 1, 1, 1, 1, 1,
0.1770253, -0.2472245, 2.469631, 1, 1, 1, 1, 1,
0.1778137, -0.9767557, 5.575905, 1, 1, 1, 1, 1,
0.1787227, -1.419982, 2.705388, 0, 0, 1, 1, 1,
0.1787538, 0.7824627, 1.29801, 1, 0, 0, 1, 1,
0.1812426, 1.337196, -0.7998797, 1, 0, 0, 1, 1,
0.1830985, 0.361134, 1.493945, 1, 0, 0, 1, 1,
0.183185, 0.01970775, 1.216319, 1, 0, 0, 1, 1,
0.1853553, -0.5271245, 3.285677, 1, 0, 0, 1, 1,
0.1857215, -1.38257, 2.150435, 0, 0, 0, 1, 1,
0.1867033, -0.3412938, 2.959846, 0, 0, 0, 1, 1,
0.1885301, -1.665134, 1.780178, 0, 0, 0, 1, 1,
0.1886156, 0.2871832, 1.376712, 0, 0, 0, 1, 1,
0.1903848, -1.392913, 3.582872, 0, 0, 0, 1, 1,
0.1943919, 1.304055, -0.2236623, 0, 0, 0, 1, 1,
0.1944023, -0.6935461, 4.720659, 0, 0, 0, 1, 1,
0.1980146, 2.132491, -2.0258, 1, 1, 1, 1, 1,
0.19852, -1.567408, 4.549991, 1, 1, 1, 1, 1,
0.1999838, -0.7863305, 2.244358, 1, 1, 1, 1, 1,
0.2021041, -1.061443, 3.708187, 1, 1, 1, 1, 1,
0.2036546, 0.7029783, -0.6975015, 1, 1, 1, 1, 1,
0.204105, 1.197805, 0.4497344, 1, 1, 1, 1, 1,
0.2092607, 0.3204968, 0.5291247, 1, 1, 1, 1, 1,
0.2134541, -0.9782381, 1.753548, 1, 1, 1, 1, 1,
0.2188706, -0.6121486, 2.505624, 1, 1, 1, 1, 1,
0.2190027, -1.0425, 2.39448, 1, 1, 1, 1, 1,
0.2198375, 0.3190357, -0.3316317, 1, 1, 1, 1, 1,
0.221811, -1.075384, 3.175479, 1, 1, 1, 1, 1,
0.2230472, 2.191367, -1.416856, 1, 1, 1, 1, 1,
0.2244486, 0.4825126, 0.6258638, 1, 1, 1, 1, 1,
0.2252317, -1.035565, 2.421023, 1, 1, 1, 1, 1,
0.2259127, -0.480998, 4.100963, 0, 0, 1, 1, 1,
0.2271653, 1.938053, -0.1875457, 1, 0, 0, 1, 1,
0.2276483, 0.56148, -0.7758118, 1, 0, 0, 1, 1,
0.2392453, 0.489064, 1.176937, 1, 0, 0, 1, 1,
0.243052, 1.10587, 0.8374624, 1, 0, 0, 1, 1,
0.2453339, 0.8103374, 1.256763, 1, 0, 0, 1, 1,
0.2480893, -0.6954622, 1.273198, 0, 0, 0, 1, 1,
0.2499997, -0.4781815, 4.711721, 0, 0, 0, 1, 1,
0.2502002, -0.9511933, 3.380711, 0, 0, 0, 1, 1,
0.2510504, -0.2373291, 2.61624, 0, 0, 0, 1, 1,
0.2529568, -0.6144037, 3.230869, 0, 0, 0, 1, 1,
0.2563029, -0.06360144, 1.163745, 0, 0, 0, 1, 1,
0.2575963, 0.3517289, 0.740352, 0, 0, 0, 1, 1,
0.2615173, -0.3825481, 5.014551, 1, 1, 1, 1, 1,
0.2643824, 0.9152368, 0.3046085, 1, 1, 1, 1, 1,
0.2695749, 1.30737, -0.7593111, 1, 1, 1, 1, 1,
0.2730809, 0.7936217, 3.776937, 1, 1, 1, 1, 1,
0.2732111, 0.9407084, 0.6908956, 1, 1, 1, 1, 1,
0.2749861, 0.6094404, -0.5860153, 1, 1, 1, 1, 1,
0.2752084, 0.7494946, -0.8448468, 1, 1, 1, 1, 1,
0.2762988, 0.2307185, 1.264322, 1, 1, 1, 1, 1,
0.2772369, 0.098758, -0.07458161, 1, 1, 1, 1, 1,
0.2794617, 1.672301, 1.646979, 1, 1, 1, 1, 1,
0.2797427, -0.938525, 2.207372, 1, 1, 1, 1, 1,
0.2825858, -0.6539401, 2.504885, 1, 1, 1, 1, 1,
0.2831876, 0.938862, 2.165227, 1, 1, 1, 1, 1,
0.2839195, 0.7277807, 1.046688, 1, 1, 1, 1, 1,
0.2859696, 0.03799923, 1.344218, 1, 1, 1, 1, 1,
0.2883207, -1.650191, 1.607212, 0, 0, 1, 1, 1,
0.2886821, -0.8265107, 2.006776, 1, 0, 0, 1, 1,
0.2992856, 1.15537, 0.5262002, 1, 0, 0, 1, 1,
0.3002988, -1.484717, 2.743145, 1, 0, 0, 1, 1,
0.304223, 0.05685676, -0.1232689, 1, 0, 0, 1, 1,
0.3116166, -0.1211407, 3.429551, 1, 0, 0, 1, 1,
0.3119039, 1.362155, 0.3755793, 0, 0, 0, 1, 1,
0.313443, -1.527185, 1.448865, 0, 0, 0, 1, 1,
0.313533, 0.9989758, -1.102213, 0, 0, 0, 1, 1,
0.3164067, 1.103203, -0.2777495, 0, 0, 0, 1, 1,
0.3240923, 0.4307155, 2.395634, 0, 0, 0, 1, 1,
0.3289348, 0.2155428, 0.3542639, 0, 0, 0, 1, 1,
0.3292316, 0.07741085, 1.138538, 0, 0, 0, 1, 1,
0.3351148, -0.6285498, 3.405335, 1, 1, 1, 1, 1,
0.3454013, -0.3437369, 2.390993, 1, 1, 1, 1, 1,
0.3465053, 1.221298, 0.6916167, 1, 1, 1, 1, 1,
0.3465844, -0.6992377, 3.151283, 1, 1, 1, 1, 1,
0.3515778, -1.291562, 2.183262, 1, 1, 1, 1, 1,
0.3527941, -0.9605644, 3.395842, 1, 1, 1, 1, 1,
0.3553223, -0.9079796, 2.412735, 1, 1, 1, 1, 1,
0.3579063, 1.629484, 0.5478116, 1, 1, 1, 1, 1,
0.3644875, 1.156225, 0.04524067, 1, 1, 1, 1, 1,
0.3653131, -0.4703468, 1.767199, 1, 1, 1, 1, 1,
0.3654168, -0.508386, 1.080227, 1, 1, 1, 1, 1,
0.3703332, -0.8163431, 4.120832, 1, 1, 1, 1, 1,
0.3726186, -1.496883, 2.427971, 1, 1, 1, 1, 1,
0.3731499, 0.1211322, 3.343777, 1, 1, 1, 1, 1,
0.3761733, 0.9885252, 0.3424943, 1, 1, 1, 1, 1,
0.3772656, -0.2934414, 1.935417, 0, 0, 1, 1, 1,
0.3782719, -0.1703163, 1.905151, 1, 0, 0, 1, 1,
0.3796873, 0.7271777, -0.5173578, 1, 0, 0, 1, 1,
0.3813244, -0.1213102, 3.213536, 1, 0, 0, 1, 1,
0.382126, 0.8820421, 0.8328456, 1, 0, 0, 1, 1,
0.3853037, 0.2536445, 1.829712, 1, 0, 0, 1, 1,
0.3865213, -2.139735, 3.407375, 0, 0, 0, 1, 1,
0.3946486, -2.162755, 4.537863, 0, 0, 0, 1, 1,
0.3951028, -0.221794, 2.359773, 0, 0, 0, 1, 1,
0.3954759, -0.4180768, 3.090799, 0, 0, 0, 1, 1,
0.3963078, 0.9787627, 0.8578683, 0, 0, 0, 1, 1,
0.3974736, -0.09819759, 0.1520906, 0, 0, 0, 1, 1,
0.40151, 0.6114979, 1.058672, 0, 0, 0, 1, 1,
0.403492, -0.5359215, 1.754421, 1, 1, 1, 1, 1,
0.4043114, -0.9398878, 1.888208, 1, 1, 1, 1, 1,
0.4043771, -0.5635462, 2.426306, 1, 1, 1, 1, 1,
0.4056298, 0.9495524, 0.2438651, 1, 1, 1, 1, 1,
0.4066716, 0.0211376, 0.1414362, 1, 1, 1, 1, 1,
0.4074371, 0.6645817, 0.2270864, 1, 1, 1, 1, 1,
0.4074749, -0.5513627, 1.69893, 1, 1, 1, 1, 1,
0.4079925, -0.3380657, 1.079757, 1, 1, 1, 1, 1,
0.4181509, 2.464136, -0.4702943, 1, 1, 1, 1, 1,
0.4247799, -0.3885641, 5.450848, 1, 1, 1, 1, 1,
0.425473, -0.4118431, 2.330191, 1, 1, 1, 1, 1,
0.4262041, -1.460537, 2.207063, 1, 1, 1, 1, 1,
0.4280128, 0.6663016, 1.457716, 1, 1, 1, 1, 1,
0.4362141, -0.2412459, 3.966568, 1, 1, 1, 1, 1,
0.4371621, 0.8316127, -0.6660745, 1, 1, 1, 1, 1,
0.4374939, 0.01080852, 0.1891098, 0, 0, 1, 1, 1,
0.4391092, 0.2500279, 1.67378, 1, 0, 0, 1, 1,
0.4396904, -0.4843172, 2.323563, 1, 0, 0, 1, 1,
0.4433825, 2.078158, -0.3525813, 1, 0, 0, 1, 1,
0.4454773, -0.4090828, 2.831561, 1, 0, 0, 1, 1,
0.4469297, 1.118801, -0.7145202, 1, 0, 0, 1, 1,
0.4469545, 2.080071, 1.742515, 0, 0, 0, 1, 1,
0.451142, 0.2820082, 1.457451, 0, 0, 0, 1, 1,
0.4525813, 0.3855272, 1.138526, 0, 0, 0, 1, 1,
0.4540364, 0.8308463, -0.5346741, 0, 0, 0, 1, 1,
0.4555044, -1.462851, 3.172582, 0, 0, 0, 1, 1,
0.4561729, 0.8727127, 2.092871, 0, 0, 0, 1, 1,
0.4584489, 0.2617656, 1.56405, 0, 0, 0, 1, 1,
0.459268, -1.60343, -0.2069961, 1, 1, 1, 1, 1,
0.4691962, 1.07851, -0.8420863, 1, 1, 1, 1, 1,
0.4750553, 0.6375419, -0.3200699, 1, 1, 1, 1, 1,
0.4831941, 0.1705056, -0.5056555, 1, 1, 1, 1, 1,
0.4834234, -0.1162237, -0.3976198, 1, 1, 1, 1, 1,
0.4846928, -0.3786565, 2.255312, 1, 1, 1, 1, 1,
0.4870463, 0.1367885, 2.62336, 1, 1, 1, 1, 1,
0.4884861, 0.3593632, 1.876052, 1, 1, 1, 1, 1,
0.4890486, -0.5671214, 4.413887, 1, 1, 1, 1, 1,
0.4975759, 0.4680708, -0.3271, 1, 1, 1, 1, 1,
0.4976091, 0.5172115, 2.534597, 1, 1, 1, 1, 1,
0.5029961, 1.946836, 0.05994499, 1, 1, 1, 1, 1,
0.5046188, -0.4559652, 2.232166, 1, 1, 1, 1, 1,
0.5053467, -0.3682382, 1.387809, 1, 1, 1, 1, 1,
0.5057603, 0.8058563, -1.033937, 1, 1, 1, 1, 1,
0.5070955, 0.2971203, -0.3783157, 0, 0, 1, 1, 1,
0.5083928, 0.6323263, 0.5731105, 1, 0, 0, 1, 1,
0.5087138, -0.7464228, 3.455238, 1, 0, 0, 1, 1,
0.5179223, -0.3899586, 1.622972, 1, 0, 0, 1, 1,
0.518242, -0.4658807, 3.033829, 1, 0, 0, 1, 1,
0.5251347, -1.32549, 3.272835, 1, 0, 0, 1, 1,
0.5260597, -0.6926587, 1.319166, 0, 0, 0, 1, 1,
0.5260687, -0.9400385, 2.475383, 0, 0, 0, 1, 1,
0.5272928, -0.6596773, 2.201649, 0, 0, 0, 1, 1,
0.5295306, -0.9640434, 3.092681, 0, 0, 0, 1, 1,
0.5324494, -0.4462708, 2.004327, 0, 0, 0, 1, 1,
0.5391228, 0.2842746, 1.368987, 0, 0, 0, 1, 1,
0.5419692, 0.8507413, 1.994763, 0, 0, 0, 1, 1,
0.5438093, -0.1739872, 1.538486, 1, 1, 1, 1, 1,
0.5478849, 0.9863532, -0.775701, 1, 1, 1, 1, 1,
0.5538154, 0.255696, 1.051379, 1, 1, 1, 1, 1,
0.5574379, 1.264518, 0.118582, 1, 1, 1, 1, 1,
0.5584663, -0.3801544, 1.37424, 1, 1, 1, 1, 1,
0.5683287, -0.09842753, 2.004548, 1, 1, 1, 1, 1,
0.5699282, -1.218853, 3.626389, 1, 1, 1, 1, 1,
0.5730309, 0.4530159, 0.4969, 1, 1, 1, 1, 1,
0.5756022, 0.5681577, 1.988248, 1, 1, 1, 1, 1,
0.5785686, 0.09025327, 1.763084, 1, 1, 1, 1, 1,
0.5799058, 1.255331, -0.207938, 1, 1, 1, 1, 1,
0.5831089, -0.6399383, 2.22226, 1, 1, 1, 1, 1,
0.5883837, 0.03881886, 0.9404974, 1, 1, 1, 1, 1,
0.5903704, 0.1484876, 1.598944, 1, 1, 1, 1, 1,
0.5907595, -1.874816, 2.451649, 1, 1, 1, 1, 1,
0.5917163, -0.1751145, 0.1753009, 0, 0, 1, 1, 1,
0.5960804, -1.474033, 1.393681, 1, 0, 0, 1, 1,
0.5981306, -0.1801993, -0.1587405, 1, 0, 0, 1, 1,
0.6011663, -1.722509, 4.94066, 1, 0, 0, 1, 1,
0.6022922, 0.3849102, 0.1667934, 1, 0, 0, 1, 1,
0.6123383, 0.4796761, 1.382218, 1, 0, 0, 1, 1,
0.6140573, -0.06907595, 1.876146, 0, 0, 0, 1, 1,
0.6151507, 0.336723, -0.867448, 0, 0, 0, 1, 1,
0.6158864, -2.320199, 2.56008, 0, 0, 0, 1, 1,
0.619347, 0.3787181, 0.8703703, 0, 0, 0, 1, 1,
0.6204746, 1.87106, -0.1845575, 0, 0, 0, 1, 1,
0.6230804, 0.3301077, -0.2276803, 0, 0, 0, 1, 1,
0.6238461, -1.584563, 3.263391, 0, 0, 0, 1, 1,
0.6274467, -0.4442795, 3.406338, 1, 1, 1, 1, 1,
0.629335, 0.8595968, 0.116009, 1, 1, 1, 1, 1,
0.6297736, -0.5627181, 2.43253, 1, 1, 1, 1, 1,
0.6323157, -3.058627, 1.855336, 1, 1, 1, 1, 1,
0.6357451, -0.3187956, 3.910398, 1, 1, 1, 1, 1,
0.6417282, -0.2263885, 1.696879, 1, 1, 1, 1, 1,
0.6485413, -0.5306413, 2.847782, 1, 1, 1, 1, 1,
0.648718, 0.2820118, 2.600489, 1, 1, 1, 1, 1,
0.6505747, 0.7386866, -0.7567399, 1, 1, 1, 1, 1,
0.6506465, 0.2642355, 1.055491, 1, 1, 1, 1, 1,
0.6523277, 0.3548672, 1.814281, 1, 1, 1, 1, 1,
0.6529008, -0.5712547, 3.544951, 1, 1, 1, 1, 1,
0.6556276, 0.5497215, 0.1481785, 1, 1, 1, 1, 1,
0.6568136, -0.4052878, 2.463366, 1, 1, 1, 1, 1,
0.6611694, -1.369613, 2.412846, 1, 1, 1, 1, 1,
0.6633828, 0.1490505, 2.41422, 0, 0, 1, 1, 1,
0.665791, 0.9354916, -0.0386437, 1, 0, 0, 1, 1,
0.6734399, -0.1826943, 1.86587, 1, 0, 0, 1, 1,
0.6801649, -0.2039772, 1.62448, 1, 0, 0, 1, 1,
0.6830497, 0.2368952, 0.3097599, 1, 0, 0, 1, 1,
0.6838606, -0.4831506, 3.387681, 1, 0, 0, 1, 1,
0.6920795, -0.7903007, 0.4954785, 0, 0, 0, 1, 1,
0.697292, 0.5135397, 1.151701, 0, 0, 0, 1, 1,
0.6993536, -0.2738902, 2.391082, 0, 0, 0, 1, 1,
0.7008247, 0.5836872, 0.3632845, 0, 0, 0, 1, 1,
0.7011629, 1.169471, 1.836617, 0, 0, 0, 1, 1,
0.7030935, -2.471047, 3.250339, 0, 0, 0, 1, 1,
0.7045826, -1.581596, 3.737292, 0, 0, 0, 1, 1,
0.7048685, -0.1640371, 0.9310248, 1, 1, 1, 1, 1,
0.7091922, 0.8667489, 0.8938695, 1, 1, 1, 1, 1,
0.7135708, -0.3163458, 1.400917, 1, 1, 1, 1, 1,
0.7138557, -0.09166773, 0.4293015, 1, 1, 1, 1, 1,
0.7149251, -0.4003837, 3.567027, 1, 1, 1, 1, 1,
0.7150168, -0.2602851, 0.80526, 1, 1, 1, 1, 1,
0.7180133, -1.086503, 1.415888, 1, 1, 1, 1, 1,
0.7199773, -0.7145475, 3.452156, 1, 1, 1, 1, 1,
0.7318655, -0.3083253, 2.057356, 1, 1, 1, 1, 1,
0.7353617, -1.174581, 4.083615, 1, 1, 1, 1, 1,
0.7396062, -1.240533, 2.529645, 1, 1, 1, 1, 1,
0.7401974, -0.7621002, 2.47403, 1, 1, 1, 1, 1,
0.7456972, -0.08531184, 2.057551, 1, 1, 1, 1, 1,
0.746226, 0.8279433, 3.105535, 1, 1, 1, 1, 1,
0.7486465, 0.390379, 1.65486, 1, 1, 1, 1, 1,
0.7489592, -0.3697739, 2.857571, 0, 0, 1, 1, 1,
0.7495512, -1.366303, 2.358049, 1, 0, 0, 1, 1,
0.7507198, 0.8852876, 0.3281403, 1, 0, 0, 1, 1,
0.7509277, -0.7319622, 3.234058, 1, 0, 0, 1, 1,
0.7548438, 1.099652, 0.03404148, 1, 0, 0, 1, 1,
0.7625692, -0.1588338, 1.793741, 1, 0, 0, 1, 1,
0.7684803, -0.8827952, 2.744101, 0, 0, 0, 1, 1,
0.7700347, 0.7800383, -0.9975487, 0, 0, 0, 1, 1,
0.7738764, -0.8604562, 2.782243, 0, 0, 0, 1, 1,
0.7750893, -0.3552836, 2.928946, 0, 0, 0, 1, 1,
0.7754594, 0.03467005, 1.238018, 0, 0, 0, 1, 1,
0.7776051, -0.9517745, 3.149716, 0, 0, 0, 1, 1,
0.7778186, -0.6149344, 2.311625, 0, 0, 0, 1, 1,
0.7798502, 0.4442644, 1.775556, 1, 1, 1, 1, 1,
0.7815475, 1.457452, 0.0146511, 1, 1, 1, 1, 1,
0.7846851, -1.237416, 1.804437, 1, 1, 1, 1, 1,
0.7854254, -0.5491735, 3.434724, 1, 1, 1, 1, 1,
0.7908841, -0.2425519, 2.883732, 1, 1, 1, 1, 1,
0.7922297, 0.0718659, 3.607315, 1, 1, 1, 1, 1,
0.8020021, 0.7503993, 0.01075759, 1, 1, 1, 1, 1,
0.8094282, -0.5922147, 3.328112, 1, 1, 1, 1, 1,
0.8110545, -0.6807547, 2.829939, 1, 1, 1, 1, 1,
0.8121559, 0.07627219, 0.4971805, 1, 1, 1, 1, 1,
0.8168998, -1.027258, 1.291864, 1, 1, 1, 1, 1,
0.8195751, 0.6055427, 2.666517, 1, 1, 1, 1, 1,
0.8215341, -0.8552902, 3.540606, 1, 1, 1, 1, 1,
0.8215641, -1.228125, 1.848268, 1, 1, 1, 1, 1,
0.8227286, 1.35778, 0.5444688, 1, 1, 1, 1, 1,
0.8237798, 0.01988995, 1.423836, 0, 0, 1, 1, 1,
0.8240722, -0.6754109, 2.33394, 1, 0, 0, 1, 1,
0.8257064, 0.59222, 1.521109, 1, 0, 0, 1, 1,
0.8261739, 2.007181, -0.9233454, 1, 0, 0, 1, 1,
0.8264428, -1.077627, 3.664392, 1, 0, 0, 1, 1,
0.826682, 0.9528688, 1.992595, 1, 0, 0, 1, 1,
0.8298632, 1.141016, -0.9507821, 0, 0, 0, 1, 1,
0.8352773, -0.3690924, 1.821755, 0, 0, 0, 1, 1,
0.8437804, -1.502613, 3.86877, 0, 0, 0, 1, 1,
0.8455977, 0.6003389, 0.4719501, 0, 0, 0, 1, 1,
0.8465486, 0.0730523, 1.83181, 0, 0, 0, 1, 1,
0.8610598, 1.64816, 1.533481, 0, 0, 0, 1, 1,
0.8820214, 0.802276, -0.008701814, 0, 0, 0, 1, 1,
0.8858503, -0.1226798, 1.486385, 1, 1, 1, 1, 1,
0.8873575, -0.5789026, 2.383634, 1, 1, 1, 1, 1,
0.8943819, 0.9714311, 0.7364759, 1, 1, 1, 1, 1,
0.8951007, -1.056941, 2.75055, 1, 1, 1, 1, 1,
0.8968155, -1.22315, 1.707299, 1, 1, 1, 1, 1,
0.9124356, -0.964366, 1.777516, 1, 1, 1, 1, 1,
0.913282, -0.424906, 3.07401, 1, 1, 1, 1, 1,
0.9148632, 0.8277579, 1.108117, 1, 1, 1, 1, 1,
0.9178997, 0.06608266, 1.213248, 1, 1, 1, 1, 1,
0.9256098, 0.07471639, 0.7475126, 1, 1, 1, 1, 1,
0.9258883, 0.06161164, 0.5173062, 1, 1, 1, 1, 1,
0.928929, -1.455568, 3.563659, 1, 1, 1, 1, 1,
0.9330946, 1.400481, -1.878487, 1, 1, 1, 1, 1,
0.9467953, 0.4799389, 0.9609666, 1, 1, 1, 1, 1,
0.950737, -1.824263, 4.47259, 1, 1, 1, 1, 1,
0.9561734, -1.321347, 0.6967801, 0, 0, 1, 1, 1,
0.9565008, 0.9195941, -0.3812138, 1, 0, 0, 1, 1,
0.9570705, -0.3350941, 1.125239, 1, 0, 0, 1, 1,
0.9598373, -0.9193814, 2.669214, 1, 0, 0, 1, 1,
0.96482, -0.3212738, 1.93529, 1, 0, 0, 1, 1,
0.9676573, -0.9341387, -0.06899926, 1, 0, 0, 1, 1,
0.9698042, -0.9804462, 2.187641, 0, 0, 0, 1, 1,
0.9710523, 1.788518, 0.2839729, 0, 0, 0, 1, 1,
0.9711582, 1.324062, 1.878113, 0, 0, 0, 1, 1,
0.9728383, 1.569264, 1.23844, 0, 0, 0, 1, 1,
0.9743591, 0.4055826, -0.7644804, 0, 0, 0, 1, 1,
0.9765298, -0.09564359, 0.2724025, 0, 0, 0, 1, 1,
0.9804052, -2.088141, 3.031191, 0, 0, 0, 1, 1,
0.9826041, -0.03244977, 1.027488, 1, 1, 1, 1, 1,
0.9828175, 0.718284, 1.472535, 1, 1, 1, 1, 1,
0.9878432, 0.3363628, 1.886755, 1, 1, 1, 1, 1,
0.9888189, 0.3025531, 0.7787716, 1, 1, 1, 1, 1,
0.9937161, 0.8726521, 1.741234, 1, 1, 1, 1, 1,
1.001568, 0.77082, 0.8214409, 1, 1, 1, 1, 1,
1.002027, -0.3538125, 3.138159, 1, 1, 1, 1, 1,
1.006545, 1.831688, 0.8111222, 1, 1, 1, 1, 1,
1.007237, 0.8360594, 1.582195, 1, 1, 1, 1, 1,
1.010537, -0.1909777, 2.33662, 1, 1, 1, 1, 1,
1.016223, -0.8739688, 2.590966, 1, 1, 1, 1, 1,
1.022703, 0.591548, 0.5279933, 1, 1, 1, 1, 1,
1.026061, -1.314258, 2.768253, 1, 1, 1, 1, 1,
1.043308, -1.063015, 2.383092, 1, 1, 1, 1, 1,
1.045357, 0.462207, -0.07402943, 1, 1, 1, 1, 1,
1.046889, 1.016764, 1.752163, 0, 0, 1, 1, 1,
1.055787, 1.465849, 0.3958324, 1, 0, 0, 1, 1,
1.074013, 2.213389, -0.6202188, 1, 0, 0, 1, 1,
1.08644, -0.83109, 2.446836, 1, 0, 0, 1, 1,
1.094955, 1.45292, -0.6620356, 1, 0, 0, 1, 1,
1.101034, -1.064059, 1.034615, 1, 0, 0, 1, 1,
1.104564, -1.131907, 5.270837, 0, 0, 0, 1, 1,
1.106894, 0.6388938, 1.82544, 0, 0, 0, 1, 1,
1.108752, 1.348383, 1.117787, 0, 0, 0, 1, 1,
1.111312, 1.471966, 0.1043645, 0, 0, 0, 1, 1,
1.1128, 0.2274888, 0.7349692, 0, 0, 0, 1, 1,
1.121526, 0.3630261, 1.446447, 0, 0, 0, 1, 1,
1.125395, 0.0121555, 0.854049, 0, 0, 0, 1, 1,
1.128561, -0.1660625, -0.7405782, 1, 1, 1, 1, 1,
1.132688, 1.291987, 1.264715, 1, 1, 1, 1, 1,
1.13331, 1.049271, 1.922471, 1, 1, 1, 1, 1,
1.136491, -0.06455944, 1.866981, 1, 1, 1, 1, 1,
1.142329, 2.249129, 1.562908, 1, 1, 1, 1, 1,
1.143672, 1.610444, 1.905444, 1, 1, 1, 1, 1,
1.15449, -0.4290423, 0.7042332, 1, 1, 1, 1, 1,
1.156771, -0.4546787, 1.990318, 1, 1, 1, 1, 1,
1.169711, 0.4295944, 1.450344, 1, 1, 1, 1, 1,
1.1698, 1.172989, 0.4482064, 1, 1, 1, 1, 1,
1.173573, 0.5353022, 1.890027, 1, 1, 1, 1, 1,
1.175708, 0.4336188, 1.537918, 1, 1, 1, 1, 1,
1.176788, 0.5537335, 1.136322, 1, 1, 1, 1, 1,
1.180402, 0.3467514, 0.4888237, 1, 1, 1, 1, 1,
1.191739, -0.08026104, 1.40115, 1, 1, 1, 1, 1,
1.196023, -1.85653, 2.50887, 0, 0, 1, 1, 1,
1.19742, 0.2196979, 1.400087, 1, 0, 0, 1, 1,
1.198628, -0.7819637, 2.148095, 1, 0, 0, 1, 1,
1.2026, -0.09822537, 1.833048, 1, 0, 0, 1, 1,
1.207563, 0.3837226, 1.722341, 1, 0, 0, 1, 1,
1.217243, -0.8820671, 4.433495, 1, 0, 0, 1, 1,
1.224595, -0.9647824, 2.780957, 0, 0, 0, 1, 1,
1.228886, 2.374177, 2.01889, 0, 0, 0, 1, 1,
1.230415, 0.48711, -0.06170795, 0, 0, 0, 1, 1,
1.232058, -0.1461822, 1.289491, 0, 0, 0, 1, 1,
1.240336, -0.7942234, 2.045904, 0, 0, 0, 1, 1,
1.24771, -0.9755976, 0.6210713, 0, 0, 0, 1, 1,
1.251274, -0.2727415, 2.486524, 0, 0, 0, 1, 1,
1.274988, -0.7765755, 1.103681, 1, 1, 1, 1, 1,
1.277791, -1.23757, 2.515395, 1, 1, 1, 1, 1,
1.28533, 0.1188911, 2.178493, 1, 1, 1, 1, 1,
1.298826, 0.382353, 2.561008, 1, 1, 1, 1, 1,
1.301797, 0.3580632, 0.6291977, 1, 1, 1, 1, 1,
1.303413, -0.4935102, 1.994729, 1, 1, 1, 1, 1,
1.306358, -0.03463004, 3.702487, 1, 1, 1, 1, 1,
1.30916, 0.1121726, 2.229729, 1, 1, 1, 1, 1,
1.326234, -0.5059309, 1.372957, 1, 1, 1, 1, 1,
1.326647, -1.49838, 1.751245, 1, 1, 1, 1, 1,
1.326751, 2.120834, 0.5871075, 1, 1, 1, 1, 1,
1.329844, 0.3534972, 2.114757, 1, 1, 1, 1, 1,
1.330321, 0.8797511, -1.118617, 1, 1, 1, 1, 1,
1.340168, 0.944515, 0.352184, 1, 1, 1, 1, 1,
1.358549, -2.7781, 4.066755, 1, 1, 1, 1, 1,
1.366435, 0.9717696, 0.8061775, 0, 0, 1, 1, 1,
1.384337, 0.7222754, 0.6750093, 1, 0, 0, 1, 1,
1.386411, -2.072725, 1.865973, 1, 0, 0, 1, 1,
1.389654, -0.6999298, 1.403528, 1, 0, 0, 1, 1,
1.40024, 0.2537905, 0.354003, 1, 0, 0, 1, 1,
1.413403, -0.614511, 2.892317, 1, 0, 0, 1, 1,
1.420813, 1.299011, 0.5450273, 0, 0, 0, 1, 1,
1.421415, 1.182907, 0.23166, 0, 0, 0, 1, 1,
1.425109, 0.1697234, 1.799535, 0, 0, 0, 1, 1,
1.428018, 0.6867896, 2.043059, 0, 0, 0, 1, 1,
1.443015, 0.2701707, -0.4560288, 0, 0, 0, 1, 1,
1.443441, -1.582069, 2.689079, 0, 0, 0, 1, 1,
1.471651, -0.4882423, 1.84798, 0, 0, 0, 1, 1,
1.474962, -2.404522, 4.012811, 1, 1, 1, 1, 1,
1.4812, 1.245682, 0.03222488, 1, 1, 1, 1, 1,
1.491362, -0.4897465, -1.106416, 1, 1, 1, 1, 1,
1.492574, 0.03881644, 1.74933, 1, 1, 1, 1, 1,
1.493012, 0.1650708, 1.835533, 1, 1, 1, 1, 1,
1.500775, 0.1719963, 1.80276, 1, 1, 1, 1, 1,
1.509211, 0.943444, 0.7102364, 1, 1, 1, 1, 1,
1.511103, -0.6215388, 0.9013221, 1, 1, 1, 1, 1,
1.534724, -0.4579028, 1.218026, 1, 1, 1, 1, 1,
1.545131, 0.6924293, 3.775831, 1, 1, 1, 1, 1,
1.563475, 1.302997, 0.5771186, 1, 1, 1, 1, 1,
1.563772, -0.5231081, -0.1921206, 1, 1, 1, 1, 1,
1.564919, 0.566756, 0.6215425, 1, 1, 1, 1, 1,
1.565102, -0.3435455, 1.943576, 1, 1, 1, 1, 1,
1.573214, 0.0945184, 1.747891, 1, 1, 1, 1, 1,
1.584634, 1.802833, 0.9726459, 0, 0, 1, 1, 1,
1.592405, 0.3577698, 2.669832, 1, 0, 0, 1, 1,
1.602408, -0.2627136, 1.495174, 1, 0, 0, 1, 1,
1.620121, -0.08835265, 3.045688, 1, 0, 0, 1, 1,
1.624108, 1.171174, -0.780381, 1, 0, 0, 1, 1,
1.655824, -0.2939284, 1.690206, 1, 0, 0, 1, 1,
1.679732, -0.2163654, 0.3806697, 0, 0, 0, 1, 1,
1.685518, 0.5118495, 1.905988, 0, 0, 0, 1, 1,
1.702724, 1.608481, 0.1584386, 0, 0, 0, 1, 1,
1.722159, -0.9935521, 3.722037, 0, 0, 0, 1, 1,
1.726782, -1.67559, 2.364557, 0, 0, 0, 1, 1,
1.756784, 1.281095, 2.451249, 0, 0, 0, 1, 1,
1.758239, -0.6829018, 2.651115, 0, 0, 0, 1, 1,
1.759548, -0.5986347, 1.374149, 1, 1, 1, 1, 1,
1.763799, -1.020666, 2.674812, 1, 1, 1, 1, 1,
1.779375, 1.500304, 0.2885731, 1, 1, 1, 1, 1,
1.806723, 0.4228507, 3.649501, 1, 1, 1, 1, 1,
1.820031, 0.657084, 0.9224117, 1, 1, 1, 1, 1,
1.82216, 0.7235886, 1.858944, 1, 1, 1, 1, 1,
1.872436, -1.751258, 3.293032, 1, 1, 1, 1, 1,
1.877478, 0.1198479, 1.012802, 1, 1, 1, 1, 1,
1.902788, 0.0847172, -0.2469105, 1, 1, 1, 1, 1,
1.920729, -0.8116868, 3.418438, 1, 1, 1, 1, 1,
1.930956, 0.37896, 1.532109, 1, 1, 1, 1, 1,
1.934767, 0.2573133, 1.745185, 1, 1, 1, 1, 1,
1.948793, 1.184802, 0.9136339, 1, 1, 1, 1, 1,
1.990778, 0.8182218, 0.8439216, 1, 1, 1, 1, 1,
1.994913, 0.1307889, 1.748386, 1, 1, 1, 1, 1,
2.041201, 0.5365793, 1.402987, 0, 0, 1, 1, 1,
2.06288, 2.68884, -0.8719907, 1, 0, 0, 1, 1,
2.113917, 0.1658832, 1.062333, 1, 0, 0, 1, 1,
2.137037, 0.3574626, 1.3179, 1, 0, 0, 1, 1,
2.141799, -1.60246, 2.77694, 1, 0, 0, 1, 1,
2.186046, 0.1010295, 0.9078037, 1, 0, 0, 1, 1,
2.260043, 0.2316115, 0.3728253, 0, 0, 0, 1, 1,
2.299142, -1.053169, 0.8568378, 0, 0, 0, 1, 1,
2.354011, 1.82927, 1.788888, 0, 0, 0, 1, 1,
2.36574, 0.7049272, 0.5586427, 0, 0, 0, 1, 1,
2.428691, 0.2236395, 2.660429, 0, 0, 0, 1, 1,
2.445495, 1.749795, 0.9007955, 0, 0, 0, 1, 1,
2.490772, -0.5714924, 1.93231, 0, 0, 0, 1, 1,
2.506215, -0.7736102, 1.420632, 1, 1, 1, 1, 1,
2.60703, -2.094375, 2.806595, 1, 1, 1, 1, 1,
2.626502, -1.188287, 1.145169, 1, 1, 1, 1, 1,
2.631651, -1.11118, 1.347669, 1, 1, 1, 1, 1,
2.932317, 0.5995138, 0.7923276, 1, 1, 1, 1, 1,
3.045511, -3.076141, 1.643221, 1, 1, 1, 1, 1,
3.692199, 1.637193, 3.965144, 1, 1, 1, 1, 1
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
var radius = 9.932522;
var distance = 34.88756;
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
mvMatrix.translate( -0.1365018, 0.07719946, -0.06083965 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.88756);
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