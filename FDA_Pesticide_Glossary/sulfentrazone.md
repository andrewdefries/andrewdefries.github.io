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
-3.031289, 0.9504947, -1.752149, 1, 0, 0, 1,
-2.887479, -0.8836847, -2.254869, 1, 0.007843138, 0, 1,
-2.830613, -0.8294361, -2.484931, 1, 0.01176471, 0, 1,
-2.827824, 0.8057806, -0.8887255, 1, 0.01960784, 0, 1,
-2.655641, -0.06768549, -2.166869, 1, 0.02352941, 0, 1,
-2.44211, -0.7994294, -1.29366, 1, 0.03137255, 0, 1,
-2.339147, -1.817663, -2.358507, 1, 0.03529412, 0, 1,
-2.330643, -1.334618, -2.863513, 1, 0.04313726, 0, 1,
-2.326751, -0.151627, -0.7396079, 1, 0.04705882, 0, 1,
-2.312909, 2.15279, -2.190478, 1, 0.05490196, 0, 1,
-2.279721, -0.6965986, 0.3602301, 1, 0.05882353, 0, 1,
-2.226245, 1.469793, -0.07031518, 1, 0.06666667, 0, 1,
-2.203959, 0.2340922, -1.796263, 1, 0.07058824, 0, 1,
-2.163023, 0.1212858, 0.1234995, 1, 0.07843138, 0, 1,
-2.159698, -1.510864, -1.728952, 1, 0.08235294, 0, 1,
-2.156681, -0.755763, -2.528677, 1, 0.09019608, 0, 1,
-2.154349, 0.8769268, -0.5596433, 1, 0.09411765, 0, 1,
-2.085134, 3.234673, -0.6660799, 1, 0.1019608, 0, 1,
-2.069436, -0.1320901, -1.502061, 1, 0.1098039, 0, 1,
-2.045978, 0.09936941, -2.901908, 1, 0.1137255, 0, 1,
-2.032706, -0.4951909, -2.506194, 1, 0.1215686, 0, 1,
-2.023421, -0.1831511, -1.534854, 1, 0.1254902, 0, 1,
-1.986139, -0.7395346, -1.095286, 1, 0.1333333, 0, 1,
-1.971025, -0.3769987, -2.324534, 1, 0.1372549, 0, 1,
-1.97075, 0.04216903, -2.345689, 1, 0.145098, 0, 1,
-1.963194, 1.062234, -0.1711218, 1, 0.1490196, 0, 1,
-1.956687, 1.889914, 0.8680792, 1, 0.1568628, 0, 1,
-1.950935, 1.17726, -1.760979, 1, 0.1607843, 0, 1,
-1.939995, -0.3863044, -3.643108, 1, 0.1686275, 0, 1,
-1.939199, -0.9825242, -1.708654, 1, 0.172549, 0, 1,
-1.902002, -0.09128868, -0.1964467, 1, 0.1803922, 0, 1,
-1.890882, -0.8113155, -1.016724, 1, 0.1843137, 0, 1,
-1.883806, -1.419495, -2.126567, 1, 0.1921569, 0, 1,
-1.879559, -2.122654, -4.520383, 1, 0.1960784, 0, 1,
-1.87766, -0.7180033, -2.657331, 1, 0.2039216, 0, 1,
-1.876183, 0.8559119, -1.074783, 1, 0.2117647, 0, 1,
-1.871547, 0.008188074, -1.100161, 1, 0.2156863, 0, 1,
-1.854754, 0.8383043, -0.3874556, 1, 0.2235294, 0, 1,
-1.842149, 1.075827, -1.215012, 1, 0.227451, 0, 1,
-1.838394, 0.9192339, 0.600847, 1, 0.2352941, 0, 1,
-1.828514, -0.8106697, -0.6040095, 1, 0.2392157, 0, 1,
-1.822405, 0.8555475, -2.725012, 1, 0.2470588, 0, 1,
-1.808133, -0.5860282, -2.434743, 1, 0.2509804, 0, 1,
-1.778845, 0.9425829, -1.894817, 1, 0.2588235, 0, 1,
-1.765131, 1.261212, -2.439147, 1, 0.2627451, 0, 1,
-1.732732, 1.539032, -3.487996, 1, 0.2705882, 0, 1,
-1.710662, 0.2008424, -0.9063765, 1, 0.2745098, 0, 1,
-1.699294, -1.148122, -2.396306, 1, 0.282353, 0, 1,
-1.696208, -1.381515, -1.520311, 1, 0.2862745, 0, 1,
-1.696203, -0.9529411, -1.490667, 1, 0.2941177, 0, 1,
-1.658351, -2.357432, -4.81417, 1, 0.3019608, 0, 1,
-1.645875, 2.063341, -1.533395, 1, 0.3058824, 0, 1,
-1.642077, -1.170211, -2.93263, 1, 0.3137255, 0, 1,
-1.632258, 0.8648539, -0.8252379, 1, 0.3176471, 0, 1,
-1.630757, 0.5165226, -0.3858164, 1, 0.3254902, 0, 1,
-1.611221, -0.2505396, -1.765179, 1, 0.3294118, 0, 1,
-1.608136, -0.791786, -1.872098, 1, 0.3372549, 0, 1,
-1.605552, 1.314924, -0.1614875, 1, 0.3411765, 0, 1,
-1.595742, -0.6088154, -1.41354, 1, 0.3490196, 0, 1,
-1.585886, -2.141016, -3.878022, 1, 0.3529412, 0, 1,
-1.584497, -0.2252885, -2.479737, 1, 0.3607843, 0, 1,
-1.571886, -1.581887, -1.58595, 1, 0.3647059, 0, 1,
-1.571486, -1.123402, -3.805374, 1, 0.372549, 0, 1,
-1.571126, -0.5165858, -2.365166, 1, 0.3764706, 0, 1,
-1.565853, 0.3633585, -0.5663936, 1, 0.3843137, 0, 1,
-1.557916, -0.7416365, -1.947343, 1, 0.3882353, 0, 1,
-1.551404, -0.3745727, -0.9776597, 1, 0.3960784, 0, 1,
-1.519058, 0.9485123, -1.291543, 1, 0.4039216, 0, 1,
-1.507508, 1.164226, -1.163203, 1, 0.4078431, 0, 1,
-1.498798, 1.116053, -0.9650351, 1, 0.4156863, 0, 1,
-1.49716, -0.0915669, -1.456648, 1, 0.4196078, 0, 1,
-1.496073, -0.2545411, -2.524608, 1, 0.427451, 0, 1,
-1.491086, 0.2751138, -1.080801, 1, 0.4313726, 0, 1,
-1.484643, -0.1483842, -2.656033, 1, 0.4392157, 0, 1,
-1.484632, 1.29523, -0.9947491, 1, 0.4431373, 0, 1,
-1.46314, -1.390928, -2.330863, 1, 0.4509804, 0, 1,
-1.460298, 0.2185602, -1.266378, 1, 0.454902, 0, 1,
-1.459562, 0.5506009, -1.470481, 1, 0.4627451, 0, 1,
-1.445841, 1.518779, 1.297389, 1, 0.4666667, 0, 1,
-1.445432, -0.3196877, -1.282785, 1, 0.4745098, 0, 1,
-1.443554, -2.160486, -2.773439, 1, 0.4784314, 0, 1,
-1.429734, -0.1198373, -1.648421, 1, 0.4862745, 0, 1,
-1.418175, 0.1418095, -0.8154396, 1, 0.4901961, 0, 1,
-1.407634, 1.394212, -0.7152966, 1, 0.4980392, 0, 1,
-1.399146, -0.7434856, -0.5935699, 1, 0.5058824, 0, 1,
-1.39729, -0.3639351, -1.488993, 1, 0.509804, 0, 1,
-1.384275, -1.20064, -3.873266, 1, 0.5176471, 0, 1,
-1.378432, -0.9425742, 0.445945, 1, 0.5215687, 0, 1,
-1.356364, -2.154253, -4.520651, 1, 0.5294118, 0, 1,
-1.35145, 0.5196935, -2.110656, 1, 0.5333334, 0, 1,
-1.348658, -0.1440383, -0.8568292, 1, 0.5411765, 0, 1,
-1.335725, -0.6669039, -1.881457, 1, 0.5450981, 0, 1,
-1.33428, -0.6599427, -3.457056, 1, 0.5529412, 0, 1,
-1.333817, 0.5414193, 1.33898, 1, 0.5568628, 0, 1,
-1.327056, -1.189911, -2.117902, 1, 0.5647059, 0, 1,
-1.322028, 1.104724, -3.302216, 1, 0.5686275, 0, 1,
-1.31087, 0.2658908, -0.5231291, 1, 0.5764706, 0, 1,
-1.307322, -1.42404, -2.565743, 1, 0.5803922, 0, 1,
-1.301968, -1.790789, -3.072939, 1, 0.5882353, 0, 1,
-1.293158, -1.912775, -1.326339, 1, 0.5921569, 0, 1,
-1.292395, 1.52239, 0.09753218, 1, 0.6, 0, 1,
-1.289481, 1.270439, -1.804347, 1, 0.6078432, 0, 1,
-1.288447, -0.9561424, -2.624915, 1, 0.6117647, 0, 1,
-1.286371, -0.8288282, -3.27185, 1, 0.6196079, 0, 1,
-1.283276, 0.05798341, -1.029002, 1, 0.6235294, 0, 1,
-1.278638, 1.070158, -2.01355, 1, 0.6313726, 0, 1,
-1.276667, 0.1758329, -2.595536, 1, 0.6352941, 0, 1,
-1.275497, 1.954839, -1.020825, 1, 0.6431373, 0, 1,
-1.274894, 1.325332, -0.671205, 1, 0.6470588, 0, 1,
-1.274632, -0.2032568, -2.36039, 1, 0.654902, 0, 1,
-1.274472, -0.2290038, -3.483584, 1, 0.6588235, 0, 1,
-1.271959, -0.6610869, -1.877787, 1, 0.6666667, 0, 1,
-1.258446, 0.1408303, -0.8364359, 1, 0.6705883, 0, 1,
-1.256564, 1.888296, -0.2980289, 1, 0.6784314, 0, 1,
-1.248939, 0.2767358, -1.450809, 1, 0.682353, 0, 1,
-1.234177, -0.1784621, -1.580995, 1, 0.6901961, 0, 1,
-1.22071, -0.4910711, -1.055723, 1, 0.6941177, 0, 1,
-1.217022, -1.750099, -3.588871, 1, 0.7019608, 0, 1,
-1.213896, 0.3634905, -1.436005, 1, 0.7098039, 0, 1,
-1.209036, -1.523098, -2.305591, 1, 0.7137255, 0, 1,
-1.209031, -0.7754189, -1.00983, 1, 0.7215686, 0, 1,
-1.207495, 0.05554782, -2.804594, 1, 0.7254902, 0, 1,
-1.206873, -0.171778, -3.029222, 1, 0.7333333, 0, 1,
-1.200781, -0.4135326, -1.472878, 1, 0.7372549, 0, 1,
-1.200366, -1.576488, -2.013025, 1, 0.7450981, 0, 1,
-1.191623, 1.046432, -0.7182882, 1, 0.7490196, 0, 1,
-1.182282, 0.3563008, -0.8142587, 1, 0.7568628, 0, 1,
-1.180957, -1.255482, -3.671041, 1, 0.7607843, 0, 1,
-1.179507, 1.130549, -0.8647474, 1, 0.7686275, 0, 1,
-1.173564, -0.6546953, -0.5300599, 1, 0.772549, 0, 1,
-1.172078, -1.020999, -1.159021, 1, 0.7803922, 0, 1,
-1.158577, 1.064094, -1.285545, 1, 0.7843137, 0, 1,
-1.14629, -0.3854349, -0.2803119, 1, 0.7921569, 0, 1,
-1.137625, 1.042012, -0.2746397, 1, 0.7960784, 0, 1,
-1.133057, -0.1668633, -1.610702, 1, 0.8039216, 0, 1,
-1.130914, 0.8486637, -0.9500393, 1, 0.8117647, 0, 1,
-1.123501, -0.1157465, -1.02646, 1, 0.8156863, 0, 1,
-1.121724, -0.6055674, -2.369955, 1, 0.8235294, 0, 1,
-1.121393, 0.3939021, -1.600402, 1, 0.827451, 0, 1,
-1.117473, -2.139383, -2.176152, 1, 0.8352941, 0, 1,
-1.116166, 1.527999, 0.2316547, 1, 0.8392157, 0, 1,
-1.111186, -1.57475, -1.838627, 1, 0.8470588, 0, 1,
-1.1092, -0.1857196, -2.210728, 1, 0.8509804, 0, 1,
-1.106388, -0.6112613, -2.272235, 1, 0.8588235, 0, 1,
-1.097903, 0.1844297, -1.186985, 1, 0.8627451, 0, 1,
-1.097887, -0.5268899, -1.900939, 1, 0.8705882, 0, 1,
-1.095633, -1.301074, -3.219602, 1, 0.8745098, 0, 1,
-1.094848, 0.6935846, -0.8050635, 1, 0.8823529, 0, 1,
-1.08564, 0.1964968, -1.487666, 1, 0.8862745, 0, 1,
-1.084018, 0.5401896, -2.36113, 1, 0.8941177, 0, 1,
-1.082222, -1.273056, -1.695296, 1, 0.8980392, 0, 1,
-1.08048, -0.5987583, -2.48566, 1, 0.9058824, 0, 1,
-1.070557, -1.071372, -2.84065, 1, 0.9137255, 0, 1,
-1.066154, 2.462376, 0.3148243, 1, 0.9176471, 0, 1,
-1.052489, 0.2001761, -0.7580236, 1, 0.9254902, 0, 1,
-1.044996, 0.965734, 0.2502352, 1, 0.9294118, 0, 1,
-1.041656, 1.545096, -1.144959, 1, 0.9372549, 0, 1,
-1.041023, -0.03849621, -1.582387, 1, 0.9411765, 0, 1,
-1.039794, -0.1114383, -0.9119789, 1, 0.9490196, 0, 1,
-1.033943, -0.3798763, -2.08033, 1, 0.9529412, 0, 1,
-1.030941, 0.0002745069, -1.272967, 1, 0.9607843, 0, 1,
-1.029746, 0.5693626, -1.044452, 1, 0.9647059, 0, 1,
-1.022298, 0.992324, -0.6753563, 1, 0.972549, 0, 1,
-1.021414, -0.6784508, -2.093728, 1, 0.9764706, 0, 1,
-1.01299, 0.6846765, -1.608728, 1, 0.9843137, 0, 1,
-1.008576, -0.8157763, -1.038098, 1, 0.9882353, 0, 1,
-1.007667, 0.01355263, -3.482288, 1, 0.9960784, 0, 1,
-1.005674, 1.236994, -0.8860508, 0.9960784, 1, 0, 1,
-1.004642, -0.3030993, -4.163255, 0.9921569, 1, 0, 1,
-0.9962931, -1.550383, -2.924971, 0.9843137, 1, 0, 1,
-0.9865365, 1.628341, 0.6663644, 0.9803922, 1, 0, 1,
-0.9787929, 1.009424, -1.614661, 0.972549, 1, 0, 1,
-0.9748406, -0.3728826, -1.111169, 0.9686275, 1, 0, 1,
-0.9721574, -0.2759423, -4.08539, 0.9607843, 1, 0, 1,
-0.9692007, -0.9407115, -1.850863, 0.9568627, 1, 0, 1,
-0.96735, -0.3769727, -3.710468, 0.9490196, 1, 0, 1,
-0.9614946, -0.291775, -0.9327103, 0.945098, 1, 0, 1,
-0.9598976, 0.6868672, -0.9312768, 0.9372549, 1, 0, 1,
-0.9593061, 0.6138572, -1.106554, 0.9333333, 1, 0, 1,
-0.9580835, 0.5269086, -2.744489, 0.9254902, 1, 0, 1,
-0.9392602, 0.5474601, -1.463334, 0.9215686, 1, 0, 1,
-0.9351237, -0.6552104, -3.082322, 0.9137255, 1, 0, 1,
-0.9301533, -0.7207632, -2.451015, 0.9098039, 1, 0, 1,
-0.9282988, 0.7684044, 0.5156864, 0.9019608, 1, 0, 1,
-0.9277714, -0.5639005, -0.5397304, 0.8941177, 1, 0, 1,
-0.9258443, -1.707095, -3.271829, 0.8901961, 1, 0, 1,
-0.9252996, 1.313906, -3.350902, 0.8823529, 1, 0, 1,
-0.9204596, 0.1885987, -2.313897, 0.8784314, 1, 0, 1,
-0.9197694, -1.017588, -3.415856, 0.8705882, 1, 0, 1,
-0.9188684, -0.2575757, -2.973154, 0.8666667, 1, 0, 1,
-0.9175469, 1.173599, 0.1948353, 0.8588235, 1, 0, 1,
-0.9162993, -0.4651466, -1.380543, 0.854902, 1, 0, 1,
-0.9151294, 0.160666, -2.138875, 0.8470588, 1, 0, 1,
-0.9091887, -0.9819456, -2.574131, 0.8431373, 1, 0, 1,
-0.9073431, 0.01902566, -1.037505, 0.8352941, 1, 0, 1,
-0.906805, 0.3121474, 1.1237, 0.8313726, 1, 0, 1,
-0.9061621, -1.120776, -1.945938, 0.8235294, 1, 0, 1,
-0.9055748, -0.4527795, -0.8657618, 0.8196079, 1, 0, 1,
-0.9051532, 0.129306, -1.628554, 0.8117647, 1, 0, 1,
-0.8950781, -0.3595372, -3.971514, 0.8078431, 1, 0, 1,
-0.8948611, 1.997721, -0.6801826, 0.8, 1, 0, 1,
-0.8945591, -0.4175076, -3.192296, 0.7921569, 1, 0, 1,
-0.8941804, 0.8072668, 0.9863496, 0.7882353, 1, 0, 1,
-0.8925182, 1.862968, -1.038081, 0.7803922, 1, 0, 1,
-0.8894029, 0.657363, -0.8647442, 0.7764706, 1, 0, 1,
-0.8864713, -1.255808, -0.6324375, 0.7686275, 1, 0, 1,
-0.8706803, -1.194883, -3.171726, 0.7647059, 1, 0, 1,
-0.8705094, -1.134145, -4.154526, 0.7568628, 1, 0, 1,
-0.8619471, 0.4548971, -3.056237, 0.7529412, 1, 0, 1,
-0.860551, 1.155645, -1.2019, 0.7450981, 1, 0, 1,
-0.8592129, 2.155348, 0.1837406, 0.7411765, 1, 0, 1,
-0.8589604, 0.778931, -1.903622, 0.7333333, 1, 0, 1,
-0.8544138, -0.5718484, -3.749561, 0.7294118, 1, 0, 1,
-0.8507881, 0.1362862, -1.251918, 0.7215686, 1, 0, 1,
-0.8474181, -1.574974, -3.180241, 0.7176471, 1, 0, 1,
-0.8413025, 0.3679223, -0.6728078, 0.7098039, 1, 0, 1,
-0.8386101, 1.427906, -0.002086904, 0.7058824, 1, 0, 1,
-0.8360425, 0.7183967, -0.9976761, 0.6980392, 1, 0, 1,
-0.8341799, -0.5742418, -2.966039, 0.6901961, 1, 0, 1,
-0.8302099, -1.888956, -0.9563613, 0.6862745, 1, 0, 1,
-0.8225653, -0.4697541, -1.14406, 0.6784314, 1, 0, 1,
-0.8204083, 1.192981, -2.624293, 0.6745098, 1, 0, 1,
-0.8185531, -0.6900655, -1.409844, 0.6666667, 1, 0, 1,
-0.8184967, 0.03375776, 0.02802701, 0.6627451, 1, 0, 1,
-0.8155444, 1.686026, -2.593529, 0.654902, 1, 0, 1,
-0.8136534, 1.515776, -0.6128561, 0.6509804, 1, 0, 1,
-0.8114584, -0.4481495, -2.367452, 0.6431373, 1, 0, 1,
-0.8042752, -0.05673847, -2.888551, 0.6392157, 1, 0, 1,
-0.8022411, -1.184953, -2.958625, 0.6313726, 1, 0, 1,
-0.8018014, 0.5188038, -2.098327, 0.627451, 1, 0, 1,
-0.8017683, 0.1436153, -2.512569, 0.6196079, 1, 0, 1,
-0.7993061, 0.6176966, -0.7274409, 0.6156863, 1, 0, 1,
-0.794533, 0.6937019, -1.026848, 0.6078432, 1, 0, 1,
-0.7941477, -0.376319, -3.47725, 0.6039216, 1, 0, 1,
-0.7934228, -0.7351457, -4.623385, 0.5960785, 1, 0, 1,
-0.7921191, -0.8616004, -3.012449, 0.5882353, 1, 0, 1,
-0.7913943, -1.000899, -2.857163, 0.5843138, 1, 0, 1,
-0.7876387, -0.09357307, -1.276946, 0.5764706, 1, 0, 1,
-0.7793561, 0.4875226, -0.567661, 0.572549, 1, 0, 1,
-0.7750776, -1.180288, -3.129202, 0.5647059, 1, 0, 1,
-0.7696285, 0.3113738, -1.189768, 0.5607843, 1, 0, 1,
-0.766902, -0.8224083, -1.657036, 0.5529412, 1, 0, 1,
-0.7641907, -0.2583287, -2.29455, 0.5490196, 1, 0, 1,
-0.7550372, 0.1920343, -2.18405, 0.5411765, 1, 0, 1,
-0.7530547, 0.8528445, -0.5682902, 0.5372549, 1, 0, 1,
-0.7517488, -0.1096391, -2.013116, 0.5294118, 1, 0, 1,
-0.7497917, 0.5665686, -0.656965, 0.5254902, 1, 0, 1,
-0.7491549, 0.06285146, -1.424308, 0.5176471, 1, 0, 1,
-0.7456146, 0.1172492, -1.558058, 0.5137255, 1, 0, 1,
-0.7444472, 0.2254576, -2.840638, 0.5058824, 1, 0, 1,
-0.7400696, -0.5258422, -2.061791, 0.5019608, 1, 0, 1,
-0.731715, 0.02967609, -2.219418, 0.4941176, 1, 0, 1,
-0.7251863, 0.180979, -1.148584, 0.4862745, 1, 0, 1,
-0.724107, 0.1632149, -1.779878, 0.4823529, 1, 0, 1,
-0.720263, 0.3401245, -0.8651257, 0.4745098, 1, 0, 1,
-0.7150919, 0.3701511, -2.763312, 0.4705882, 1, 0, 1,
-0.7103379, -0.6355074, -2.560378, 0.4627451, 1, 0, 1,
-0.7022167, -0.3458363, -2.21384, 0.4588235, 1, 0, 1,
-0.6886958, 0.7697949, -1.987951, 0.4509804, 1, 0, 1,
-0.6874317, 0.384132, -1.105259, 0.4470588, 1, 0, 1,
-0.6872354, 0.2234429, -0.5357674, 0.4392157, 1, 0, 1,
-0.6864916, 0.6030191, -1.480076, 0.4352941, 1, 0, 1,
-0.6855662, -0.262042, -3.181851, 0.427451, 1, 0, 1,
-0.6840503, -0.5160929, -2.503222, 0.4235294, 1, 0, 1,
-0.6838931, 0.02153439, -1.053571, 0.4156863, 1, 0, 1,
-0.6833175, 0.8577119, -2.42641, 0.4117647, 1, 0, 1,
-0.6793678, 0.8940089, -1.123679, 0.4039216, 1, 0, 1,
-0.6760286, -0.2008088, -2.276616, 0.3960784, 1, 0, 1,
-0.6744707, -0.7528973, -3.420243, 0.3921569, 1, 0, 1,
-0.6666585, -0.6290428, -1.154431, 0.3843137, 1, 0, 1,
-0.66515, 0.1432542, -2.873737, 0.3803922, 1, 0, 1,
-0.655602, 0.1319624, -0.9871296, 0.372549, 1, 0, 1,
-0.6495367, -0.2894331, -2.197193, 0.3686275, 1, 0, 1,
-0.6487933, -0.5213855, -1.84093, 0.3607843, 1, 0, 1,
-0.6484854, -2.471995, -3.65394, 0.3568628, 1, 0, 1,
-0.6431175, -1.209358, -1.514352, 0.3490196, 1, 0, 1,
-0.6427453, 0.8314393, -1.569849, 0.345098, 1, 0, 1,
-0.6367738, -1.510495, -2.517607, 0.3372549, 1, 0, 1,
-0.6358926, -0.348581, -2.238637, 0.3333333, 1, 0, 1,
-0.6349291, 0.5984231, 0.01082532, 0.3254902, 1, 0, 1,
-0.6275542, 0.2531015, -1.8802, 0.3215686, 1, 0, 1,
-0.6230614, 0.7372234, -0.3731366, 0.3137255, 1, 0, 1,
-0.6221251, 0.07098845, 0.340133, 0.3098039, 1, 0, 1,
-0.6219624, 0.3147684, -2.193091, 0.3019608, 1, 0, 1,
-0.618863, 0.601353, -0.8514665, 0.2941177, 1, 0, 1,
-0.6184985, 0.01116618, 0.640124, 0.2901961, 1, 0, 1,
-0.6105819, 0.7989781, -0.9517955, 0.282353, 1, 0, 1,
-0.6097599, -0.2097757, -2.518391, 0.2784314, 1, 0, 1,
-0.6072869, -0.3635223, -0.5067936, 0.2705882, 1, 0, 1,
-0.6013299, 1.456503, 0.9763725, 0.2666667, 1, 0, 1,
-0.6012986, -1.179003, -4.42774, 0.2588235, 1, 0, 1,
-0.6004758, 2.153329, 1.610637, 0.254902, 1, 0, 1,
-0.5968439, -0.7677829, -3.516125, 0.2470588, 1, 0, 1,
-0.5919651, 2.17361, -0.07209145, 0.2431373, 1, 0, 1,
-0.5790029, 1.63984, 0.4411141, 0.2352941, 1, 0, 1,
-0.5748571, -1.78146, -2.038691, 0.2313726, 1, 0, 1,
-0.5734792, -0.9668658, -2.924355, 0.2235294, 1, 0, 1,
-0.5730851, -0.2020972, -2.187258, 0.2196078, 1, 0, 1,
-0.5672631, -0.08903649, -2.106259, 0.2117647, 1, 0, 1,
-0.5672103, -0.08169299, -1.048108, 0.2078431, 1, 0, 1,
-0.5670342, 2.109622, 0.9853212, 0.2, 1, 0, 1,
-0.5667545, 0.3507656, -1.194848, 0.1921569, 1, 0, 1,
-0.5600597, 0.1081725, 0.1003468, 0.1882353, 1, 0, 1,
-0.5495715, 0.786794, -1.10994, 0.1803922, 1, 0, 1,
-0.5477397, 0.561219, -2.230413, 0.1764706, 1, 0, 1,
-0.5477044, -0.3657162, -2.705276, 0.1686275, 1, 0, 1,
-0.5459881, -1.602416, -3.40163, 0.1647059, 1, 0, 1,
-0.5456918, -0.02616399, -1.162713, 0.1568628, 1, 0, 1,
-0.545176, -0.476766, -3.272069, 0.1529412, 1, 0, 1,
-0.5401987, -0.4842562, -3.155576, 0.145098, 1, 0, 1,
-0.5393644, -1.512438, -2.302641, 0.1411765, 1, 0, 1,
-0.5369154, 0.9535198, -0.02451251, 0.1333333, 1, 0, 1,
-0.5349808, -0.01023952, -0.3270341, 0.1294118, 1, 0, 1,
-0.530642, -0.9411055, -3.464637, 0.1215686, 1, 0, 1,
-0.5305982, -0.3415573, -0.5289015, 0.1176471, 1, 0, 1,
-0.5272351, 1.202454, -1.168, 0.1098039, 1, 0, 1,
-0.527229, 0.2623832, -2.334681, 0.1058824, 1, 0, 1,
-0.5257118, -0.7886686, -1.786124, 0.09803922, 1, 0, 1,
-0.5247591, -0.2047336, -2.341758, 0.09019608, 1, 0, 1,
-0.5230589, -0.5584973, -1.300073, 0.08627451, 1, 0, 1,
-0.5218815, 1.71409, -1.493054, 0.07843138, 1, 0, 1,
-0.5200268, 0.7821627, -0.4910785, 0.07450981, 1, 0, 1,
-0.5197002, -0.2350106, -1.451405, 0.06666667, 1, 0, 1,
-0.5185579, 0.1387019, -2.068482, 0.0627451, 1, 0, 1,
-0.5138012, 0.3299077, 0.5056226, 0.05490196, 1, 0, 1,
-0.5126632, -0.610997, -2.874425, 0.05098039, 1, 0, 1,
-0.5098903, 1.085671, -1.492743, 0.04313726, 1, 0, 1,
-0.5098219, 0.2837669, -0.525215, 0.03921569, 1, 0, 1,
-0.5087507, -1.276849, -2.843832, 0.03137255, 1, 0, 1,
-0.504379, -0.5367055, -3.125787, 0.02745098, 1, 0, 1,
-0.5013396, 0.2826455, -0.5797352, 0.01960784, 1, 0, 1,
-0.4949401, -1.086166, -2.779154, 0.01568628, 1, 0, 1,
-0.4929768, -0.5339708, -2.38592, 0.007843138, 1, 0, 1,
-0.4925261, 0.8444582, -1.637425, 0.003921569, 1, 0, 1,
-0.4910465, 0.3663945, -0.1406497, 0, 1, 0.003921569, 1,
-0.4903262, -0.01306843, -0.8925718, 0, 1, 0.01176471, 1,
-0.489042, 0.5865399, -2.055946, 0, 1, 0.01568628, 1,
-0.4880286, 1.144735, 0.01723132, 0, 1, 0.02352941, 1,
-0.4871558, -0.1524742, -3.005794, 0, 1, 0.02745098, 1,
-0.483463, 1.942963, -0.8709521, 0, 1, 0.03529412, 1,
-0.4829162, 1.214265, 0.9434108, 0, 1, 0.03921569, 1,
-0.479239, 2.918338, 0.6803033, 0, 1, 0.04705882, 1,
-0.4762971, -0.5363294, -3.02703, 0, 1, 0.05098039, 1,
-0.4744666, 1.209507, 0.862432, 0, 1, 0.05882353, 1,
-0.4726542, -0.5721464, -1.907099, 0, 1, 0.0627451, 1,
-0.4708904, 1.05798, -1.03215, 0, 1, 0.07058824, 1,
-0.4656705, 0.9136885, -0.6809111, 0, 1, 0.07450981, 1,
-0.4590901, 0.3321268, -0.7893602, 0, 1, 0.08235294, 1,
-0.4575227, 0.6359146, -0.3336667, 0, 1, 0.08627451, 1,
-0.4574103, 2.13072, -1.528088, 0, 1, 0.09411765, 1,
-0.456688, -1.137636, -1.969986, 0, 1, 0.1019608, 1,
-0.4545463, 0.763755, -0.874611, 0, 1, 0.1058824, 1,
-0.4517862, -1.097291, -3.688174, 0, 1, 0.1137255, 1,
-0.4481865, 1.317171, -0.2055879, 0, 1, 0.1176471, 1,
-0.4481233, 0.7103744, 0.8237903, 0, 1, 0.1254902, 1,
-0.4459508, -1.162663, -4.086456, 0, 1, 0.1294118, 1,
-0.441359, 0.237882, -3.224381, 0, 1, 0.1372549, 1,
-0.4384035, -0.3720112, -2.775366, 0, 1, 0.1411765, 1,
-0.4377466, 0.4380042, -1.196141, 0, 1, 0.1490196, 1,
-0.4371464, -0.428024, -2.644797, 0, 1, 0.1529412, 1,
-0.4333948, -0.3010526, -2.028022, 0, 1, 0.1607843, 1,
-0.4315007, -1.92718, -4.190608, 0, 1, 0.1647059, 1,
-0.4295786, -0.4394989, -1.837246, 0, 1, 0.172549, 1,
-0.4213687, 0.7465456, -0.4649852, 0, 1, 0.1764706, 1,
-0.4211343, 1.262664, -1.385968, 0, 1, 0.1843137, 1,
-0.4204403, -0.9576949, -3.798173, 0, 1, 0.1882353, 1,
-0.417765, -0.2529756, -1.695706, 0, 1, 0.1960784, 1,
-0.4167613, -1.404885, -3.229692, 0, 1, 0.2039216, 1,
-0.4153561, 0.4978434, -0.3851535, 0, 1, 0.2078431, 1,
-0.4150184, -0.09695453, -2.130274, 0, 1, 0.2156863, 1,
-0.4089351, -1.066305, -3.666863, 0, 1, 0.2196078, 1,
-0.4085099, 0.2972293, -1.863028, 0, 1, 0.227451, 1,
-0.4084658, -0.012663, -1.527362, 0, 1, 0.2313726, 1,
-0.4063857, -0.6394131, -4.768322, 0, 1, 0.2392157, 1,
-0.4044284, -1.101024, -4.032089, 0, 1, 0.2431373, 1,
-0.4010713, 1.67119, -0.325856, 0, 1, 0.2509804, 1,
-0.4002437, -0.2167293, -3.438492, 0, 1, 0.254902, 1,
-0.3914396, 1.040547, -2.199209, 0, 1, 0.2627451, 1,
-0.3786968, 1.586228, -0.9552302, 0, 1, 0.2666667, 1,
-0.3768218, 1.301758, 0.6089706, 0, 1, 0.2745098, 1,
-0.37636, -0.3098457, -0.9320081, 0, 1, 0.2784314, 1,
-0.3728425, 0.9016461, -2.701916, 0, 1, 0.2862745, 1,
-0.3723072, -0.1663309, -1.337596, 0, 1, 0.2901961, 1,
-0.3718869, -1.099567, -2.596891, 0, 1, 0.2980392, 1,
-0.3697678, 1.648509, 0.9616255, 0, 1, 0.3058824, 1,
-0.3673444, -0.2840431, -2.968334, 0, 1, 0.3098039, 1,
-0.3667287, 1.166835, -1.074044, 0, 1, 0.3176471, 1,
-0.3650155, 0.5816848, -1.274885, 0, 1, 0.3215686, 1,
-0.3632723, 0.0287215, -0.6005389, 0, 1, 0.3294118, 1,
-0.3622448, -1.730037, -3.524675, 0, 1, 0.3333333, 1,
-0.3608359, -0.1920882, -2.391302, 0, 1, 0.3411765, 1,
-0.3557336, 0.3746946, -0.7854257, 0, 1, 0.345098, 1,
-0.3519289, -0.1227245, -1.323363, 0, 1, 0.3529412, 1,
-0.3513195, 0.6546224, -0.2525962, 0, 1, 0.3568628, 1,
-0.3505953, -0.841402, -0.6432164, 0, 1, 0.3647059, 1,
-0.3466079, 1.304809, -0.3668922, 0, 1, 0.3686275, 1,
-0.3457887, -0.04317125, 0.3310586, 0, 1, 0.3764706, 1,
-0.3425373, -0.6078203, -1.658537, 0, 1, 0.3803922, 1,
-0.3368796, -0.4674657, -3.580048, 0, 1, 0.3882353, 1,
-0.3318311, 0.2780725, -1.248587, 0, 1, 0.3921569, 1,
-0.3316244, -0.5631142, -1.272756, 0, 1, 0.4, 1,
-0.3290284, -0.5233437, -1.099594, 0, 1, 0.4078431, 1,
-0.3227688, 0.3753305, 0.1558194, 0, 1, 0.4117647, 1,
-0.3220804, 0.5312201, -0.1235516, 0, 1, 0.4196078, 1,
-0.3177599, 1.968583, 1.286648, 0, 1, 0.4235294, 1,
-0.3171237, 0.3531118, -1.835273, 0, 1, 0.4313726, 1,
-0.3150183, -0.9404124, -2.936746, 0, 1, 0.4352941, 1,
-0.3093822, -0.6168958, -4.708891, 0, 1, 0.4431373, 1,
-0.2987075, 0.1851654, -2.155196, 0, 1, 0.4470588, 1,
-0.2977372, -1.426891, -2.589308, 0, 1, 0.454902, 1,
-0.2952467, -1.437632, -4.243791, 0, 1, 0.4588235, 1,
-0.2903833, -2.351982, -2.618762, 0, 1, 0.4666667, 1,
-0.2891032, -0.8842818, -0.7207345, 0, 1, 0.4705882, 1,
-0.2884367, 0.7074299, -0.5238307, 0, 1, 0.4784314, 1,
-0.288342, 2.293402, -0.8384011, 0, 1, 0.4823529, 1,
-0.2880281, -0.4494736, -2.296212, 0, 1, 0.4901961, 1,
-0.2850488, 1.150745, -0.2017751, 0, 1, 0.4941176, 1,
-0.2808458, 0.554517, 1.598466, 0, 1, 0.5019608, 1,
-0.2777731, 0.1169874, -2.1506, 0, 1, 0.509804, 1,
-0.2727375, -0.1138335, -2.379267, 0, 1, 0.5137255, 1,
-0.2681863, 0.4571039, -0.6747674, 0, 1, 0.5215687, 1,
-0.2609775, 0.05921645, 0.2422716, 0, 1, 0.5254902, 1,
-0.25581, -0.3131073, -3.615978, 0, 1, 0.5333334, 1,
-0.254281, -0.07911838, -3.542649, 0, 1, 0.5372549, 1,
-0.2510032, 0.1867564, 0.5339967, 0, 1, 0.5450981, 1,
-0.2499316, 1.317355, 0.2707751, 0, 1, 0.5490196, 1,
-0.2447953, 0.9591449, 0.5132654, 0, 1, 0.5568628, 1,
-0.2438305, 1.213404, 0.639299, 0, 1, 0.5607843, 1,
-0.2389168, 0.110723, -0.1799991, 0, 1, 0.5686275, 1,
-0.2337666, -0.1250841, -1.38137, 0, 1, 0.572549, 1,
-0.2283233, -1.562671, -0.6415897, 0, 1, 0.5803922, 1,
-0.22419, 0.6040417, 0.5901774, 0, 1, 0.5843138, 1,
-0.2235238, 0.4259631, 0.1856742, 0, 1, 0.5921569, 1,
-0.2231542, -0.001747984, -0.3961669, 0, 1, 0.5960785, 1,
-0.2225644, 1.274701, -2.343801, 0, 1, 0.6039216, 1,
-0.2219032, 1.65714, -2.149967, 0, 1, 0.6117647, 1,
-0.2207703, 0.2373261, 0.1082155, 0, 1, 0.6156863, 1,
-0.2162743, 1.048002, 0.8789749, 0, 1, 0.6235294, 1,
-0.2147989, -0.4243048, -3.755469, 0, 1, 0.627451, 1,
-0.2132408, -0.1175749, -1.956566, 0, 1, 0.6352941, 1,
-0.2088086, -2.390147, -3.236592, 0, 1, 0.6392157, 1,
-0.2084473, -0.2853642, -3.471701, 0, 1, 0.6470588, 1,
-0.2064291, -1.28151, -3.842395, 0, 1, 0.6509804, 1,
-0.2054005, 0.4836113, -1.782927, 0, 1, 0.6588235, 1,
-0.2018621, -0.2886103, -2.45648, 0, 1, 0.6627451, 1,
-0.1994887, 1.03579, -0.0950242, 0, 1, 0.6705883, 1,
-0.1985913, 0.9213471, -0.8929527, 0, 1, 0.6745098, 1,
-0.1980575, 0.6993096, 0.1992692, 0, 1, 0.682353, 1,
-0.1974304, 0.04817609, -0.7635562, 0, 1, 0.6862745, 1,
-0.1967487, 0.3892643, -1.120482, 0, 1, 0.6941177, 1,
-0.1945961, 1.498482, 0.7922238, 0, 1, 0.7019608, 1,
-0.1927598, -0.1023069, -0.3931307, 0, 1, 0.7058824, 1,
-0.1915581, -0.8448304, -5.107359, 0, 1, 0.7137255, 1,
-0.1821166, -0.4011717, -2.718342, 0, 1, 0.7176471, 1,
-0.1815094, -2.167557, -3.862315, 0, 1, 0.7254902, 1,
-0.172252, 0.9295285, -1.476914, 0, 1, 0.7294118, 1,
-0.1711559, -0.04581114, -1.925841, 0, 1, 0.7372549, 1,
-0.1680227, -0.07517938, -1.934088, 0, 1, 0.7411765, 1,
-0.1647079, -1.704579, -2.877574, 0, 1, 0.7490196, 1,
-0.1619565, -1.178986, -4.013822, 0, 1, 0.7529412, 1,
-0.1573354, 1.168235, 1.04309, 0, 1, 0.7607843, 1,
-0.1524452, -0.1139939, -2.640549, 0, 1, 0.7647059, 1,
-0.1491654, -0.1181884, -2.719764, 0, 1, 0.772549, 1,
-0.1463219, -0.1502967, -1.62175, 0, 1, 0.7764706, 1,
-0.1459232, 0.5125345, 0.5567449, 0, 1, 0.7843137, 1,
-0.1456247, -0.2002997, -2.566977, 0, 1, 0.7882353, 1,
-0.1412615, -0.01622282, -2.420819, 0, 1, 0.7960784, 1,
-0.1340724, 2.462321, -0.9151769, 0, 1, 0.8039216, 1,
-0.1316843, -0.6548154, -0.752416, 0, 1, 0.8078431, 1,
-0.1315843, 0.6828321, -1.283758, 0, 1, 0.8156863, 1,
-0.1232884, -2.228073, -3.695878, 0, 1, 0.8196079, 1,
-0.1228988, 2.67289, -0.0614317, 0, 1, 0.827451, 1,
-0.1207966, 0.392307, -1.002191, 0, 1, 0.8313726, 1,
-0.11877, 0.1386719, -1.139021, 0, 1, 0.8392157, 1,
-0.1179994, -0.2840322, -3.589052, 0, 1, 0.8431373, 1,
-0.1175444, 0.5244893, 2.092519, 0, 1, 0.8509804, 1,
-0.1164771, 0.1399084, -0.4679806, 0, 1, 0.854902, 1,
-0.1152767, -0.3249324, -0.7607148, 0, 1, 0.8627451, 1,
-0.1138493, -0.3480093, -2.069114, 0, 1, 0.8666667, 1,
-0.113663, -0.8527929, -2.775356, 0, 1, 0.8745098, 1,
-0.1125334, -0.8517691, -3.22543, 0, 1, 0.8784314, 1,
-0.1103213, 0.4652452, -2.541204, 0, 1, 0.8862745, 1,
-0.1096333, -0.6745275, -1.783414, 0, 1, 0.8901961, 1,
-0.1095727, -0.9581235, -1.644239, 0, 1, 0.8980392, 1,
-0.1039646, 0.8874393, -1.570175, 0, 1, 0.9058824, 1,
-0.1029073, 0.4445523, -3.016987, 0, 1, 0.9098039, 1,
-0.09772528, 0.2001018, -0.8510333, 0, 1, 0.9176471, 1,
-0.09629683, 0.2704219, -1.523294, 0, 1, 0.9215686, 1,
-0.08914088, -0.3889384, -3.639145, 0, 1, 0.9294118, 1,
-0.08715923, 0.7791019, -0.2259169, 0, 1, 0.9333333, 1,
-0.08107289, 0.8353724, 0.2148839, 0, 1, 0.9411765, 1,
-0.08075175, 1.108512, 1.480032, 0, 1, 0.945098, 1,
-0.08011479, -0.8058535, -4.584637, 0, 1, 0.9529412, 1,
-0.07695081, 0.3495281, -0.4737541, 0, 1, 0.9568627, 1,
-0.07004976, 0.6384895, 0.7627329, 0, 1, 0.9647059, 1,
-0.06768357, 0.3649388, 0.4027835, 0, 1, 0.9686275, 1,
-0.06747361, 0.6859599, -1.197453, 0, 1, 0.9764706, 1,
-0.0536004, 0.7537402, -1.384677, 0, 1, 0.9803922, 1,
-0.05033661, -0.5610545, -4.819711, 0, 1, 0.9882353, 1,
-0.05000247, 0.0383073, -0.7323865, 0, 1, 0.9921569, 1,
-0.04838086, 1.512773, -2.237347, 0, 1, 1, 1,
-0.04359962, 0.4016148, -0.8032368, 0, 0.9921569, 1, 1,
-0.04140526, -0.7009789, -0.2722256, 0, 0.9882353, 1, 1,
-0.04042685, -0.3680276, -3.864421, 0, 0.9803922, 1, 1,
-0.03655384, -0.184618, -3.479993, 0, 0.9764706, 1, 1,
-0.0324243, 0.6410733, 0.4985327, 0, 0.9686275, 1, 1,
-0.02992203, -0.5826113, -3.569144, 0, 0.9647059, 1, 1,
-0.02606236, 0.1877403, -0.7995814, 0, 0.9568627, 1, 1,
-0.02478422, 0.255793, 0.545363, 0, 0.9529412, 1, 1,
-0.02409327, 0.01633782, -1.153563, 0, 0.945098, 1, 1,
-0.02088655, -0.09672783, -3.213323, 0, 0.9411765, 1, 1,
-0.01133421, 0.9919931, -0.1961085, 0, 0.9333333, 1, 1,
-0.01001033, -1.861486, -3.152379, 0, 0.9294118, 1, 1,
-0.008020901, 1.956223, -1.78037, 0, 0.9215686, 1, 1,
-0.006848246, -0.6104798, -2.62276, 0, 0.9176471, 1, 1,
-0.006274555, 1.170758, 2.023548, 0, 0.9098039, 1, 1,
-0.003686098, 1.721545, 0.7852872, 0, 0.9058824, 1, 1,
-0.0007080168, 0.2288033, -1.502066, 0, 0.8980392, 1, 1,
0.0009134986, -0.4828579, 3.966535, 0, 0.8901961, 1, 1,
0.001152525, -0.713816, 3.911916, 0, 0.8862745, 1, 1,
0.003973695, -0.1464821, 2.900106, 0, 0.8784314, 1, 1,
0.007971076, -0.6667346, 4.687997, 0, 0.8745098, 1, 1,
0.008369066, -0.9674756, 3.598097, 0, 0.8666667, 1, 1,
0.008634861, 0.08269982, -1.06943, 0, 0.8627451, 1, 1,
0.01136417, -0.4144751, 3.258631, 0, 0.854902, 1, 1,
0.01385059, -0.9273025, 2.264914, 0, 0.8509804, 1, 1,
0.01815732, 0.3939, -0.4650761, 0, 0.8431373, 1, 1,
0.0185552, 0.3674811, -0.5476553, 0, 0.8392157, 1, 1,
0.0266399, 0.8094336, 0.1928467, 0, 0.8313726, 1, 1,
0.02665322, 1.266588, -0.8592371, 0, 0.827451, 1, 1,
0.03146885, -0.4757546, 1.625837, 0, 0.8196079, 1, 1,
0.0316861, 1.514871, -1.711111, 0, 0.8156863, 1, 1,
0.03740054, -0.1223775, 2.422318, 0, 0.8078431, 1, 1,
0.04226571, -0.5505612, 2.657241, 0, 0.8039216, 1, 1,
0.05308826, -1.56629, 3.094539, 0, 0.7960784, 1, 1,
0.05341344, -0.4692962, 3.559493, 0, 0.7882353, 1, 1,
0.0570174, -0.2317009, 2.55258, 0, 0.7843137, 1, 1,
0.06208502, -0.1843485, 4.112035, 0, 0.7764706, 1, 1,
0.06243879, -0.6627064, 2.939223, 0, 0.772549, 1, 1,
0.06463251, -0.8570917, 2.596783, 0, 0.7647059, 1, 1,
0.06896374, 1.112178, -0.8201009, 0, 0.7607843, 1, 1,
0.0719353, 0.629062, 0.757922, 0, 0.7529412, 1, 1,
0.07585812, 2.664454, 0.4708007, 0, 0.7490196, 1, 1,
0.07901634, -1.54415, 3.114745, 0, 0.7411765, 1, 1,
0.08019608, -0.6443241, 3.243171, 0, 0.7372549, 1, 1,
0.0813154, 1.347033, -0.00526318, 0, 0.7294118, 1, 1,
0.08361449, 0.2342095, -1.850971, 0, 0.7254902, 1, 1,
0.08427343, -0.1714562, 4.033763, 0, 0.7176471, 1, 1,
0.08758555, 1.459358, 0.9640747, 0, 0.7137255, 1, 1,
0.08782998, 1.332582, 0.7679595, 0, 0.7058824, 1, 1,
0.08811752, -0.8795344, 2.403247, 0, 0.6980392, 1, 1,
0.08901482, -0.4279766, 4.164522, 0, 0.6941177, 1, 1,
0.09155134, 0.3759198, 0.4413033, 0, 0.6862745, 1, 1,
0.09175072, 0.9332832, 0.4358789, 0, 0.682353, 1, 1,
0.0922707, -0.2275226, 3.539876, 0, 0.6745098, 1, 1,
0.0959987, 1.441747, 0.2983029, 0, 0.6705883, 1, 1,
0.09831802, 1.62553, -0.8226675, 0, 0.6627451, 1, 1,
0.09905559, -0.7211763, 2.28073, 0, 0.6588235, 1, 1,
0.1015766, 1.871042, -0.2472637, 0, 0.6509804, 1, 1,
0.1029266, 1.267502, -0.5477555, 0, 0.6470588, 1, 1,
0.1039795, 0.35134, 0.3918267, 0, 0.6392157, 1, 1,
0.104343, -0.5952309, 1.634799, 0, 0.6352941, 1, 1,
0.117346, 1.848022, -1.309046, 0, 0.627451, 1, 1,
0.1196741, 0.6471364, -0.2139557, 0, 0.6235294, 1, 1,
0.120633, 0.08784188, 2.067167, 0, 0.6156863, 1, 1,
0.1211763, -0.4336571, 3.764693, 0, 0.6117647, 1, 1,
0.1231142, 1.26325, 0.3220404, 0, 0.6039216, 1, 1,
0.1247345, -1.23566, 3.717164, 0, 0.5960785, 1, 1,
0.1253707, -1.094399, 2.273335, 0, 0.5921569, 1, 1,
0.1275655, -1.386592, 2.87063, 0, 0.5843138, 1, 1,
0.1278295, 0.4268908, 0.6711961, 0, 0.5803922, 1, 1,
0.137866, -0.5122588, 3.679125, 0, 0.572549, 1, 1,
0.1452734, 1.19634, 1.924349, 0, 0.5686275, 1, 1,
0.1550561, -0.07208223, 1.691032, 0, 0.5607843, 1, 1,
0.1552968, -0.6151031, 1.28899, 0, 0.5568628, 1, 1,
0.156382, -0.8888938, 3.817955, 0, 0.5490196, 1, 1,
0.1635483, -0.9838735, 3.745459, 0, 0.5450981, 1, 1,
0.16639, 0.6945828, -0.7249654, 0, 0.5372549, 1, 1,
0.1668611, -0.9000406, 3.240474, 0, 0.5333334, 1, 1,
0.1702892, 0.3450457, -1.058041, 0, 0.5254902, 1, 1,
0.171, 0.1329539, 0.4805854, 0, 0.5215687, 1, 1,
0.1781517, -1.186827, 3.579312, 0, 0.5137255, 1, 1,
0.182035, -0.3258801, 0.4986371, 0, 0.509804, 1, 1,
0.1828592, -1.173465, 2.239762, 0, 0.5019608, 1, 1,
0.1880286, -0.399394, 3.124205, 0, 0.4941176, 1, 1,
0.1881552, -0.9316052, 2.951041, 0, 0.4901961, 1, 1,
0.1933988, -0.6760556, 2.99699, 0, 0.4823529, 1, 1,
0.1953926, 1.368041, -1.042743, 0, 0.4784314, 1, 1,
0.1954123, 0.8399144, 0.2585913, 0, 0.4705882, 1, 1,
0.1955463, 0.602128, -1.347557, 0, 0.4666667, 1, 1,
0.2051878, 1.291337, 0.5211802, 0, 0.4588235, 1, 1,
0.2073836, -1.14128, 2.625635, 0, 0.454902, 1, 1,
0.2088331, 0.5012251, 0.7645569, 0, 0.4470588, 1, 1,
0.2131112, 0.3129191, -0.9685627, 0, 0.4431373, 1, 1,
0.215627, 0.4423299, 1.59319, 0, 0.4352941, 1, 1,
0.220873, 0.08809309, 1.901758, 0, 0.4313726, 1, 1,
0.2210934, -0.5999361, 3.434352, 0, 0.4235294, 1, 1,
0.2223966, 0.2750994, -0.03235522, 0, 0.4196078, 1, 1,
0.2252223, -2.725824, 4.486547, 0, 0.4117647, 1, 1,
0.226436, 1.520062, -0.4710648, 0, 0.4078431, 1, 1,
0.2275626, 0.1930116, 1.556237, 0, 0.4, 1, 1,
0.2276649, -0.08773076, 0.5766625, 0, 0.3921569, 1, 1,
0.2276968, -1.774105, 3.146337, 0, 0.3882353, 1, 1,
0.2300735, -0.007445155, 1.115936, 0, 0.3803922, 1, 1,
0.2311396, 0.8203491, 1.996357, 0, 0.3764706, 1, 1,
0.2338131, 0.7153109, -1.392667, 0, 0.3686275, 1, 1,
0.2373244, -0.01836709, 1.165463, 0, 0.3647059, 1, 1,
0.2382037, 1.109909, 0.06289043, 0, 0.3568628, 1, 1,
0.2392171, -0.2134761, 1.960175, 0, 0.3529412, 1, 1,
0.240053, -0.4615619, 3.407566, 0, 0.345098, 1, 1,
0.2409471, -0.144694, 1.63097, 0, 0.3411765, 1, 1,
0.2421727, 0.2057512, 0.7204406, 0, 0.3333333, 1, 1,
0.2432718, 1.472931, -0.2018403, 0, 0.3294118, 1, 1,
0.245605, -0.6955495, 1.561791, 0, 0.3215686, 1, 1,
0.2462922, -1.348705, 1.542467, 0, 0.3176471, 1, 1,
0.2486632, 0.535453, -1.539477, 0, 0.3098039, 1, 1,
0.2575331, -0.6693056, 2.921812, 0, 0.3058824, 1, 1,
0.2595778, -0.2285776, 2.788617, 0, 0.2980392, 1, 1,
0.2640629, 0.257923, 1.515609, 0, 0.2901961, 1, 1,
0.264837, -1.281562, 0.6838639, 0, 0.2862745, 1, 1,
0.2694048, -1.099933, 2.155842, 0, 0.2784314, 1, 1,
0.2752968, 0.03453283, 1.930823, 0, 0.2745098, 1, 1,
0.275868, -2.176899, 0.6123176, 0, 0.2666667, 1, 1,
0.277171, -1.471731, 2.175112, 0, 0.2627451, 1, 1,
0.2776269, -1.866093, 1.685344, 0, 0.254902, 1, 1,
0.2797577, 1.105619, 0.2271408, 0, 0.2509804, 1, 1,
0.2808604, -0.3223782, 2.227551, 0, 0.2431373, 1, 1,
0.2839707, -0.1038618, 0.6023393, 0, 0.2392157, 1, 1,
0.2859535, 1.013914, 1.316863, 0, 0.2313726, 1, 1,
0.2884714, -2.122938, 2.278659, 0, 0.227451, 1, 1,
0.2964372, 0.8577909, -0.2899003, 0, 0.2196078, 1, 1,
0.2994616, 0.8921736, 0.1654677, 0, 0.2156863, 1, 1,
0.2997784, -0.0792123, 1.82635, 0, 0.2078431, 1, 1,
0.3029671, 1.200139, 0.244687, 0, 0.2039216, 1, 1,
0.3051063, 0.09941378, 2.207259, 0, 0.1960784, 1, 1,
0.3066394, -2.373916, 3.169727, 0, 0.1882353, 1, 1,
0.3086151, 0.01766709, 1.940558, 0, 0.1843137, 1, 1,
0.3108481, 1.520963, 1.180899, 0, 0.1764706, 1, 1,
0.313889, 1.871067, -0.5144538, 0, 0.172549, 1, 1,
0.3141666, 1.45229, -0.08043284, 0, 0.1647059, 1, 1,
0.3167768, -2.760268, 2.518727, 0, 0.1607843, 1, 1,
0.319162, 0.09197124, 0.170038, 0, 0.1529412, 1, 1,
0.3197704, 1.266309, 0.8917831, 0, 0.1490196, 1, 1,
0.3337506, 0.3869052, 2.27602, 0, 0.1411765, 1, 1,
0.337144, 0.6559974, 0.2042907, 0, 0.1372549, 1, 1,
0.3393088, 0.4256273, 0.3088867, 0, 0.1294118, 1, 1,
0.3405585, -1.542412, 4.049495, 0, 0.1254902, 1, 1,
0.3409985, 1.4728, -0.9597017, 0, 0.1176471, 1, 1,
0.3417237, -0.5633832, 2.986791, 0, 0.1137255, 1, 1,
0.3420719, -0.5472284, 0.3177872, 0, 0.1058824, 1, 1,
0.3426528, 0.2487243, 0.2497144, 0, 0.09803922, 1, 1,
0.3430161, -2.025114, 3.610171, 0, 0.09411765, 1, 1,
0.3491542, 0.3268532, 0.896583, 0, 0.08627451, 1, 1,
0.3500273, -1.760309, 3.044429, 0, 0.08235294, 1, 1,
0.3511271, 1.968562, -0.8542959, 0, 0.07450981, 1, 1,
0.3593971, -1.286495, 3.174811, 0, 0.07058824, 1, 1,
0.3625753, -0.898252, 1.773969, 0, 0.0627451, 1, 1,
0.3636174, 0.3677219, -1.406839, 0, 0.05882353, 1, 1,
0.3670185, -0.6714298, 1.947725, 0, 0.05098039, 1, 1,
0.3670655, -0.6092988, 2.291423, 0, 0.04705882, 1, 1,
0.3728561, -0.372045, 3.330028, 0, 0.03921569, 1, 1,
0.3754272, -0.346637, 4.134806, 0, 0.03529412, 1, 1,
0.3784077, 0.8544288, -0.2076834, 0, 0.02745098, 1, 1,
0.3816474, 0.4449046, 1.685286, 0, 0.02352941, 1, 1,
0.3838725, 0.8993856, -0.8845827, 0, 0.01568628, 1, 1,
0.3839118, 0.637412, 0.51541, 0, 0.01176471, 1, 1,
0.3845505, -0.1496199, 0.9950448, 0, 0.003921569, 1, 1,
0.3857763, 1.802122, 1.168938, 0.003921569, 0, 1, 1,
0.3871197, -0.9985976, 1.014719, 0.007843138, 0, 1, 1,
0.3876953, 1.691131, -0.08165161, 0.01568628, 0, 1, 1,
0.3947692, 0.06889197, 2.82692, 0.01960784, 0, 1, 1,
0.4089964, -0.3065313, 3.161124, 0.02745098, 0, 1, 1,
0.4102133, -0.005231355, 1.796892, 0.03137255, 0, 1, 1,
0.4119777, -0.5981991, 2.407463, 0.03921569, 0, 1, 1,
0.4147145, -0.361131, 1.806947, 0.04313726, 0, 1, 1,
0.4148584, -0.3841138, 2.944318, 0.05098039, 0, 1, 1,
0.4162704, -0.4111188, 2.960647, 0.05490196, 0, 1, 1,
0.418357, 1.139326, 1.307964, 0.0627451, 0, 1, 1,
0.4244279, 0.115155, 1.142149, 0.06666667, 0, 1, 1,
0.432263, 0.6855507, -0.3321246, 0.07450981, 0, 1, 1,
0.4330193, 0.797174, 0.735513, 0.07843138, 0, 1, 1,
0.4356513, 0.7081338, -0.8986377, 0.08627451, 0, 1, 1,
0.4378963, 0.2104638, -0.2047046, 0.09019608, 0, 1, 1,
0.438632, -0.9579346, 3.345718, 0.09803922, 0, 1, 1,
0.4438746, -1.048561, 1.72871, 0.1058824, 0, 1, 1,
0.4450146, -0.7044322, 2.757882, 0.1098039, 0, 1, 1,
0.4499345, 1.511371, -1.762758, 0.1176471, 0, 1, 1,
0.456894, 0.3871379, -1.034591, 0.1215686, 0, 1, 1,
0.4571353, -1.181721, 1.519707, 0.1294118, 0, 1, 1,
0.458029, 0.3731904, 1.966343, 0.1333333, 0, 1, 1,
0.4597397, -1.109134, 3.067576, 0.1411765, 0, 1, 1,
0.4622995, 1.478471, -0.2817654, 0.145098, 0, 1, 1,
0.4663129, 0.9976038, -1.111981, 0.1529412, 0, 1, 1,
0.4664623, 2.10025, -0.06072759, 0.1568628, 0, 1, 1,
0.4683925, 0.1331684, 2.161144, 0.1647059, 0, 1, 1,
0.470573, -0.5061504, 2.147114, 0.1686275, 0, 1, 1,
0.4712874, 0.5402263, 0.5334092, 0.1764706, 0, 1, 1,
0.4714978, -0.08484475, 2.792129, 0.1803922, 0, 1, 1,
0.4763043, 1.473586, 0.4306376, 0.1882353, 0, 1, 1,
0.4820473, -1.844623, 2.226597, 0.1921569, 0, 1, 1,
0.4826633, -3.323364, 1.737067, 0.2, 0, 1, 1,
0.4851041, 0.3730922, 1.19663, 0.2078431, 0, 1, 1,
0.4864415, -0.5670571, 3.62912, 0.2117647, 0, 1, 1,
0.4890921, -0.3187508, 2.254074, 0.2196078, 0, 1, 1,
0.4902897, 0.1714977, 1.479028, 0.2235294, 0, 1, 1,
0.4927584, 0.6030281, 0.7343407, 0.2313726, 0, 1, 1,
0.4929658, -0.5796479, 1.846771, 0.2352941, 0, 1, 1,
0.4963612, -1.423752, 3.140943, 0.2431373, 0, 1, 1,
0.5016468, -1.130548, 3.506046, 0.2470588, 0, 1, 1,
0.501845, 2.178693, -1.26453, 0.254902, 0, 1, 1,
0.5018874, 0.1739624, 2.217553, 0.2588235, 0, 1, 1,
0.5045078, 1.490749, -0.7281772, 0.2666667, 0, 1, 1,
0.5053424, -1.970678, 2.964047, 0.2705882, 0, 1, 1,
0.5085279, -1.035522, 2.244047, 0.2784314, 0, 1, 1,
0.5090675, -0.06608188, -0.6429135, 0.282353, 0, 1, 1,
0.5117658, 1.18668, 0.09092, 0.2901961, 0, 1, 1,
0.5117669, -1.411848, 2.566477, 0.2941177, 0, 1, 1,
0.512061, 1.251393, 1.019734, 0.3019608, 0, 1, 1,
0.5192252, -0.8830669, 4.8644, 0.3098039, 0, 1, 1,
0.5268503, 1.320556, 0.5571462, 0.3137255, 0, 1, 1,
0.5285679, -0.2217636, 0.6565524, 0.3215686, 0, 1, 1,
0.529286, -0.1965519, 2.665984, 0.3254902, 0, 1, 1,
0.5353794, 0.1253713, 1.389555, 0.3333333, 0, 1, 1,
0.5389026, 1.209108, 0.6925451, 0.3372549, 0, 1, 1,
0.5429851, 0.5025659, -0.248732, 0.345098, 0, 1, 1,
0.5460608, -0.8103501, 2.05107, 0.3490196, 0, 1, 1,
0.550441, -0.4347236, 2.10266, 0.3568628, 0, 1, 1,
0.5546104, 0.7328248, -0.9618602, 0.3607843, 0, 1, 1,
0.5559171, -0.6460867, 2.503272, 0.3686275, 0, 1, 1,
0.5593129, -0.40296, 4.068718, 0.372549, 0, 1, 1,
0.5596362, 0.7818943, -1.002471, 0.3803922, 0, 1, 1,
0.5715975, -1.115274, 3.123578, 0.3843137, 0, 1, 1,
0.574524, 0.4149243, 1.668876, 0.3921569, 0, 1, 1,
0.5754008, -0.2408524, 0.9553329, 0.3960784, 0, 1, 1,
0.5759592, -0.7199653, 2.713826, 0.4039216, 0, 1, 1,
0.5763752, 0.6020654, 0.8391246, 0.4117647, 0, 1, 1,
0.5830165, -0.4752427, 1.190852, 0.4156863, 0, 1, 1,
0.5923725, -0.5693551, 1.316948, 0.4235294, 0, 1, 1,
0.5943702, -0.1256831, 3.497449, 0.427451, 0, 1, 1,
0.5978082, -0.489682, 1.692086, 0.4352941, 0, 1, 1,
0.5995321, 1.480963, 0.2836604, 0.4392157, 0, 1, 1,
0.6072887, -0.4057856, 1.322524, 0.4470588, 0, 1, 1,
0.610042, -0.08753674, 2.935417, 0.4509804, 0, 1, 1,
0.6144809, -0.223916, 2.822063, 0.4588235, 0, 1, 1,
0.6192909, 0.397317, 0.2429685, 0.4627451, 0, 1, 1,
0.621941, 1.305364, -0.3563215, 0.4705882, 0, 1, 1,
0.6229357, 0.3052444, 0.4134866, 0.4745098, 0, 1, 1,
0.6234574, -0.2183164, 1.792814, 0.4823529, 0, 1, 1,
0.6246005, -0.2928281, 3.032139, 0.4862745, 0, 1, 1,
0.6246538, -1.030417, 2.68279, 0.4941176, 0, 1, 1,
0.6350751, 1.56956, 0.990512, 0.5019608, 0, 1, 1,
0.6378338, 0.399201, 1.293113, 0.5058824, 0, 1, 1,
0.6411288, 1.327187, 0.7051001, 0.5137255, 0, 1, 1,
0.6445878, -0.9704006, 3.267607, 0.5176471, 0, 1, 1,
0.6447415, 0.8625387, 0.08361633, 0.5254902, 0, 1, 1,
0.6453587, -0.1811811, 4.244037, 0.5294118, 0, 1, 1,
0.6474235, -0.9164897, 1.596331, 0.5372549, 0, 1, 1,
0.647649, -0.09250145, 1.136509, 0.5411765, 0, 1, 1,
0.6523528, -0.6879556, 2.192755, 0.5490196, 0, 1, 1,
0.6589072, -0.7369722, 0.9130373, 0.5529412, 0, 1, 1,
0.6593236, -0.9865044, 4.006997, 0.5607843, 0, 1, 1,
0.6637826, 0.5889479, 0.1384637, 0.5647059, 0, 1, 1,
0.6693391, -0.5677972, 3.617154, 0.572549, 0, 1, 1,
0.6741773, -0.9761443, 1.362664, 0.5764706, 0, 1, 1,
0.6774144, -0.9873261, 3.846831, 0.5843138, 0, 1, 1,
0.6802459, 0.9321762, 1.117818, 0.5882353, 0, 1, 1,
0.6839321, -1.141869, 2.534584, 0.5960785, 0, 1, 1,
0.6880073, -0.5088554, 0.6998941, 0.6039216, 0, 1, 1,
0.6902409, -0.2962877, 1.027082, 0.6078432, 0, 1, 1,
0.6927941, -0.3263526, 2.585663, 0.6156863, 0, 1, 1,
0.6988099, -0.4602942, 0.8190716, 0.6196079, 0, 1, 1,
0.7103621, -0.6083992, 3.158745, 0.627451, 0, 1, 1,
0.7122846, 0.05836446, 2.232718, 0.6313726, 0, 1, 1,
0.7164866, -1.339611, 0.3969165, 0.6392157, 0, 1, 1,
0.716794, -1.162345, 2.887253, 0.6431373, 0, 1, 1,
0.718072, 1.008644, -0.3378369, 0.6509804, 0, 1, 1,
0.7184106, 1.197928, 1.107791, 0.654902, 0, 1, 1,
0.7210568, -1.478999, 2.677892, 0.6627451, 0, 1, 1,
0.7267116, -0.3222108, 3.310615, 0.6666667, 0, 1, 1,
0.7320858, 0.4359052, 3.043933, 0.6745098, 0, 1, 1,
0.7356902, 0.0003420655, 2.297623, 0.6784314, 0, 1, 1,
0.7405942, -0.7756076, 1.739554, 0.6862745, 0, 1, 1,
0.743676, -0.6592566, 2.375201, 0.6901961, 0, 1, 1,
0.7484593, 0.3425165, 0.8475721, 0.6980392, 0, 1, 1,
0.7503523, 0.0066964, 1.723783, 0.7058824, 0, 1, 1,
0.7527131, -0.06108434, 0.9632976, 0.7098039, 0, 1, 1,
0.7550617, 0.6562321, 0.2819281, 0.7176471, 0, 1, 1,
0.7555725, -0.7346017, 2.486606, 0.7215686, 0, 1, 1,
0.757258, -0.5268386, 1.478877, 0.7294118, 0, 1, 1,
0.7591797, 0.08498001, 1.558736, 0.7333333, 0, 1, 1,
0.766967, 1.155528, 0.1357658, 0.7411765, 0, 1, 1,
0.7672759, -0.3020732, 1.894679, 0.7450981, 0, 1, 1,
0.7734243, -0.3630699, 3.239122, 0.7529412, 0, 1, 1,
0.7745224, 0.6301498, 0.8465667, 0.7568628, 0, 1, 1,
0.7748263, 0.5096666, 0.7107922, 0.7647059, 0, 1, 1,
0.7810729, -0.4746155, 3.676612, 0.7686275, 0, 1, 1,
0.7815874, -0.6184671, 1.310867, 0.7764706, 0, 1, 1,
0.7826257, 0.860149, 0.2535259, 0.7803922, 0, 1, 1,
0.7857549, 0.5772022, 1.162786, 0.7882353, 0, 1, 1,
0.7867707, -0.5979773, 1.354825, 0.7921569, 0, 1, 1,
0.7887785, 0.4896605, 1.638787, 0.8, 0, 1, 1,
0.7895078, -0.1966505, 0.8406658, 0.8078431, 0, 1, 1,
0.7926667, -2.453605, 3.389275, 0.8117647, 0, 1, 1,
0.8002837, -1.404582, 3.083694, 0.8196079, 0, 1, 1,
0.800792, -1.366474, 2.471744, 0.8235294, 0, 1, 1,
0.8044561, 0.9163398, 1.454439, 0.8313726, 0, 1, 1,
0.8059018, 0.7344949, -0.3466263, 0.8352941, 0, 1, 1,
0.8107905, 0.1279226, -0.5299642, 0.8431373, 0, 1, 1,
0.8170993, -0.9457417, 3.28439, 0.8470588, 0, 1, 1,
0.8214042, -1.228461, 1.036007, 0.854902, 0, 1, 1,
0.8238207, -1.02304, 3.022525, 0.8588235, 0, 1, 1,
0.8256358, 1.253995, 1.315108, 0.8666667, 0, 1, 1,
0.8270431, -1.860237, 4.339884, 0.8705882, 0, 1, 1,
0.8322006, -0.6046178, 2.998019, 0.8784314, 0, 1, 1,
0.8341052, -1.624888, 3.72998, 0.8823529, 0, 1, 1,
0.839256, -0.5894542, 1.742416, 0.8901961, 0, 1, 1,
0.8404415, -0.7628437, 1.270101, 0.8941177, 0, 1, 1,
0.8502425, -0.01829836, 1.054308, 0.9019608, 0, 1, 1,
0.8528712, 1.00563, 1.875556, 0.9098039, 0, 1, 1,
0.8599802, 1.60257, -1.097708, 0.9137255, 0, 1, 1,
0.8659691, -0.8092574, 3.283121, 0.9215686, 0, 1, 1,
0.8668734, -1.137503, 1.398088, 0.9254902, 0, 1, 1,
0.8701832, -0.6586928, 1.950396, 0.9333333, 0, 1, 1,
0.8782861, 1.556156, 0.3003927, 0.9372549, 0, 1, 1,
0.8806266, 0.4885546, 0.06171543, 0.945098, 0, 1, 1,
0.8857238, 0.8187863, -1.210778, 0.9490196, 0, 1, 1,
0.888789, -1.728221, 4.366968, 0.9568627, 0, 1, 1,
0.8929503, -2.205227, 1.45198, 0.9607843, 0, 1, 1,
0.8941628, 1.063724, 1.025134, 0.9686275, 0, 1, 1,
0.8946375, -2.042219, 3.069474, 0.972549, 0, 1, 1,
0.8992434, -0.002046342, 1.64703, 0.9803922, 0, 1, 1,
0.909879, -0.06661925, 2.834426, 0.9843137, 0, 1, 1,
0.9193771, 1.023256, 1.791214, 0.9921569, 0, 1, 1,
0.9231918, -0.2932679, 1.963802, 0.9960784, 0, 1, 1,
0.9342639, -0.9701968, 2.714311, 1, 0, 0.9960784, 1,
0.9348139, -0.2848084, 4.000588, 1, 0, 0.9882353, 1,
0.9395815, 0.8784346, 0.9366851, 1, 0, 0.9843137, 1,
0.9430123, 0.5042052, 0.5198849, 1, 0, 0.9764706, 1,
0.9552249, -0.437899, 1.89342, 1, 0, 0.972549, 1,
0.9622248, 2.723814, 0.6175054, 1, 0, 0.9647059, 1,
0.9657313, -2.440995, 1.359585, 1, 0, 0.9607843, 1,
0.971025, 0.06073399, 1.224562, 1, 0, 0.9529412, 1,
0.9734706, -0.8530917, 1.660312, 1, 0, 0.9490196, 1,
0.9751536, 0.009928503, 2.551816, 1, 0, 0.9411765, 1,
0.976435, 0.9353362, 2.317487, 1, 0, 0.9372549, 1,
0.9780682, 0.4381273, 1.21839, 1, 0, 0.9294118, 1,
0.9804225, -0.5664051, 0.9613687, 1, 0, 0.9254902, 1,
0.9807639, 1.153421, 2.158748, 1, 0, 0.9176471, 1,
0.9840478, -1.171713, 3.778077, 1, 0, 0.9137255, 1,
0.9881159, -0.7455009, 2.537398, 1, 0, 0.9058824, 1,
0.989986, -1.41792, 4.207355, 1, 0, 0.9019608, 1,
0.9931683, 1.241987, -0.3482085, 1, 0, 0.8941177, 1,
0.9975684, -0.4969809, 2.98974, 1, 0, 0.8862745, 1,
1.004709, 0.1354741, 1.322127, 1, 0, 0.8823529, 1,
1.006733, 0.4992429, 1.189414, 1, 0, 0.8745098, 1,
1.009188, -0.04302512, 2.106644, 1, 0, 0.8705882, 1,
1.011163, -1.664298, 3.052606, 1, 0, 0.8627451, 1,
1.015382, 0.4682529, 1.411144, 1, 0, 0.8588235, 1,
1.017251, 0.8898175, 0.79372, 1, 0, 0.8509804, 1,
1.019226, 0.5081711, 1.863553, 1, 0, 0.8470588, 1,
1.019252, -0.2398987, 2.593536, 1, 0, 0.8392157, 1,
1.021293, 1.085516, 1.701426, 1, 0, 0.8352941, 1,
1.021566, 0.6314136, 1.199206, 1, 0, 0.827451, 1,
1.02591, 0.2276391, 2.079365, 1, 0, 0.8235294, 1,
1.032565, 0.1109533, 2.956218, 1, 0, 0.8156863, 1,
1.039513, 0.6418179, 1.258195, 1, 0, 0.8117647, 1,
1.041304, -0.2935121, 1.396562, 1, 0, 0.8039216, 1,
1.049308, -0.5599315, 0.5091146, 1, 0, 0.7960784, 1,
1.061468, 0.3830374, 3.47324, 1, 0, 0.7921569, 1,
1.065795, -0.2051563, 1.551852, 1, 0, 0.7843137, 1,
1.07047, -1.115139, 2.176576, 1, 0, 0.7803922, 1,
1.070959, 0.6569915, 1.111155, 1, 0, 0.772549, 1,
1.075273, -0.1296632, 2.100479, 1, 0, 0.7686275, 1,
1.078047, -1.686119, 1.836132, 1, 0, 0.7607843, 1,
1.080118, -2.151834, 4.271665, 1, 0, 0.7568628, 1,
1.086038, -0.8248775, 2.217408, 1, 0, 0.7490196, 1,
1.091042, -2.018989, 3.636003, 1, 0, 0.7450981, 1,
1.095316, 0.5844074, 2.01689, 1, 0, 0.7372549, 1,
1.098826, 0.7277992, 1.129389, 1, 0, 0.7333333, 1,
1.104443, 1.08402, -0.5284752, 1, 0, 0.7254902, 1,
1.105829, -1.297056, 3.340454, 1, 0, 0.7215686, 1,
1.107769, 0.8758938, 1.119829, 1, 0, 0.7137255, 1,
1.115174, 1.074522, 0.04764212, 1, 0, 0.7098039, 1,
1.126143, -1.147112, 2.177791, 1, 0, 0.7019608, 1,
1.129608, 1.349932, 1.3408, 1, 0, 0.6941177, 1,
1.133942, -0.1321567, 1.865664, 1, 0, 0.6901961, 1,
1.156101, -0.8872992, 3.022518, 1, 0, 0.682353, 1,
1.160083, 1.031736, 1.517592, 1, 0, 0.6784314, 1,
1.167349, 1.037263, -0.4431566, 1, 0, 0.6705883, 1,
1.178557, -0.0004174236, 2.003788, 1, 0, 0.6666667, 1,
1.182754, 0.8843165, 0.7989442, 1, 0, 0.6588235, 1,
1.187786, 0.0702412, 1.272314, 1, 0, 0.654902, 1,
1.214013, -0.274918, 1.985944, 1, 0, 0.6470588, 1,
1.218006, 0.2409395, 0.748482, 1, 0, 0.6431373, 1,
1.218217, 0.9658082, 1.98672, 1, 0, 0.6352941, 1,
1.224856, 0.2958444, 0.5284576, 1, 0, 0.6313726, 1,
1.233347, -0.7361216, 4.924106, 1, 0, 0.6235294, 1,
1.233445, 1.413839, 0.2049194, 1, 0, 0.6196079, 1,
1.235929, 0.9006432, 0.9708584, 1, 0, 0.6117647, 1,
1.256998, -0.3909796, 3.129676, 1, 0, 0.6078432, 1,
1.274867, 0.4263622, 2.053791, 1, 0, 0.6, 1,
1.27669, -1.354761, 2.634966, 1, 0, 0.5921569, 1,
1.282521, -0.2777303, 1.946123, 1, 0, 0.5882353, 1,
1.285504, 1.466, 1.047557, 1, 0, 0.5803922, 1,
1.28789, 0.2182571, 0.3411377, 1, 0, 0.5764706, 1,
1.29691, -0.07626755, 0.7774004, 1, 0, 0.5686275, 1,
1.298977, 1.717452, 1.068935, 1, 0, 0.5647059, 1,
1.313184, -0.1949813, 0.9828507, 1, 0, 0.5568628, 1,
1.331753, -0.6323017, 1.282704, 1, 0, 0.5529412, 1,
1.341441, -1.327841, 3.3733, 1, 0, 0.5450981, 1,
1.34425, 0.1016762, 0.6421549, 1, 0, 0.5411765, 1,
1.35028, -1.533623, 2.382734, 1, 0, 0.5333334, 1,
1.352562, -0.4201118, 1.98023, 1, 0, 0.5294118, 1,
1.355342, 0.3637663, 0.31599, 1, 0, 0.5215687, 1,
1.356669, 0.5238842, 1.921977, 1, 0, 0.5176471, 1,
1.361661, 1.611976, -0.2230919, 1, 0, 0.509804, 1,
1.368389, 1.135207, 1.799365, 1, 0, 0.5058824, 1,
1.377713, -0.3920997, 1.380402, 1, 0, 0.4980392, 1,
1.379847, 1.342779, -0.1122992, 1, 0, 0.4901961, 1,
1.380423, 0.3398078, 1.884166, 1, 0, 0.4862745, 1,
1.385409, 2.458297, -0.2731302, 1, 0, 0.4784314, 1,
1.385857, -2.177404, 2.03851, 1, 0, 0.4745098, 1,
1.407961, 0.2573106, 2.125418, 1, 0, 0.4666667, 1,
1.409837, 0.6825057, 0.7990436, 1, 0, 0.4627451, 1,
1.412477, -0.7073188, 1.932205, 1, 0, 0.454902, 1,
1.4309, -0.1035953, 2.290067, 1, 0, 0.4509804, 1,
1.440299, -1.552166, 1.691329, 1, 0, 0.4431373, 1,
1.449274, -0.7166029, 2.222455, 1, 0, 0.4392157, 1,
1.452229, 0.2793651, 1.717913, 1, 0, 0.4313726, 1,
1.453951, 0.4294675, 1.516662, 1, 0, 0.427451, 1,
1.464282, 1.426024, -0.120027, 1, 0, 0.4196078, 1,
1.481809, -0.1665404, 0.8291098, 1, 0, 0.4156863, 1,
1.488314, 0.9713905, 0.8359383, 1, 0, 0.4078431, 1,
1.498207, 1.357632, 2.503132, 1, 0, 0.4039216, 1,
1.502088, 0.6555773, 1.182805, 1, 0, 0.3960784, 1,
1.519521, 0.8103664, 1.436174, 1, 0, 0.3882353, 1,
1.526888, 0.2020099, 1.111988, 1, 0, 0.3843137, 1,
1.530673, 0.5817594, 1.298879, 1, 0, 0.3764706, 1,
1.532158, -0.1291995, 3.53545, 1, 0, 0.372549, 1,
1.544543, 1.045991, 0.6913541, 1, 0, 0.3647059, 1,
1.545373, -0.4681689, 2.321323, 1, 0, 0.3607843, 1,
1.55745, 0.1888433, 1.87129, 1, 0, 0.3529412, 1,
1.564988, 0.8021588, -1.219839, 1, 0, 0.3490196, 1,
1.570317, 1.079176, 1.184922, 1, 0, 0.3411765, 1,
1.57295, -0.8690048, 0.4917398, 1, 0, 0.3372549, 1,
1.577808, 0.5064729, 1.599827, 1, 0, 0.3294118, 1,
1.579114, -1.529945, 1.515998, 1, 0, 0.3254902, 1,
1.582547, -0.3736402, 1.079075, 1, 0, 0.3176471, 1,
1.594836, 0.2549513, 0.8683419, 1, 0, 0.3137255, 1,
1.606313, 0.03654204, -0.01992262, 1, 0, 0.3058824, 1,
1.616316, -1.234818, 2.602918, 1, 0, 0.2980392, 1,
1.636783, -0.4118045, 2.099257, 1, 0, 0.2941177, 1,
1.651781, -0.8466436, 2.374362, 1, 0, 0.2862745, 1,
1.678281, 1.224275, 1.008337, 1, 0, 0.282353, 1,
1.679964, -1.436311, 1.521385, 1, 0, 0.2745098, 1,
1.686212, -0.8996617, 2.438854, 1, 0, 0.2705882, 1,
1.693901, -0.2596449, 1.416561, 1, 0, 0.2627451, 1,
1.70449, -0.2480073, 2.609871, 1, 0, 0.2588235, 1,
1.708234, 0.1731668, 2.521224, 1, 0, 0.2509804, 1,
1.710193, -0.5672233, 1.130457, 1, 0, 0.2470588, 1,
1.710605, 0.1860137, 1.197109, 1, 0, 0.2392157, 1,
1.727677, -0.5470911, 1.87427, 1, 0, 0.2352941, 1,
1.746246, -0.4966024, 2.775207, 1, 0, 0.227451, 1,
1.775431, -0.09872779, 3.038848, 1, 0, 0.2235294, 1,
1.821676, -0.8712483, 2.475244, 1, 0, 0.2156863, 1,
1.828745, -1.730912, 3.868571, 1, 0, 0.2117647, 1,
1.841253, 0.3382081, 2.545679, 1, 0, 0.2039216, 1,
1.865459, -1.286288, 3.117489, 1, 0, 0.1960784, 1,
1.870271, -1.126451, 3.163713, 1, 0, 0.1921569, 1,
1.874091, 0.1595685, 0.6597005, 1, 0, 0.1843137, 1,
1.896702, -1.766777, 2.473746, 1, 0, 0.1803922, 1,
1.918028, 0.6115733, 1.596775, 1, 0, 0.172549, 1,
1.923167, 1.301193, 1.877962, 1, 0, 0.1686275, 1,
1.928267, -1.613436, 1.633798, 1, 0, 0.1607843, 1,
1.929381, -0.466999, 2.152943, 1, 0, 0.1568628, 1,
1.968961, -1.088542, 1.674411, 1, 0, 0.1490196, 1,
2.022616, 0.753072, 1.453286, 1, 0, 0.145098, 1,
2.030602, 1.528161, 2.230061, 1, 0, 0.1372549, 1,
2.037652, 0.4686157, 0.4414916, 1, 0, 0.1333333, 1,
2.051075, -0.446578, 1.694213, 1, 0, 0.1254902, 1,
2.078238, 0.7075779, 1.120304, 1, 0, 0.1215686, 1,
2.08105, -0.3394585, 0.3837868, 1, 0, 0.1137255, 1,
2.08857, -0.01269368, 0.1289729, 1, 0, 0.1098039, 1,
2.097484, -0.4221758, 1.534636, 1, 0, 0.1019608, 1,
2.106337, 1.415202, 0.9522762, 1, 0, 0.09411765, 1,
2.109185, 2.560296, 0.5426959, 1, 0, 0.09019608, 1,
2.171437, 0.3222204, -0.03841786, 1, 0, 0.08235294, 1,
2.270077, 0.6057116, 1.505292, 1, 0, 0.07843138, 1,
2.28258, 0.71293, 0.2040427, 1, 0, 0.07058824, 1,
2.312827, 0.8207604, 1.502127, 1, 0, 0.06666667, 1,
2.324378, 2.176783, 1.081544, 1, 0, 0.05882353, 1,
2.354292, 0.1837455, 0.3477721, 1, 0, 0.05490196, 1,
2.378432, 0.3561708, 0.2734758, 1, 0, 0.04705882, 1,
2.464505, -1.28387, 0.8210944, 1, 0, 0.04313726, 1,
2.718634, -0.2556856, 1.860839, 1, 0, 0.03529412, 1,
2.868818, -1.386562, 2.464108, 1, 0, 0.03137255, 1,
2.939296, -0.9296404, 4.237555, 1, 0, 0.02352941, 1,
2.974356, -0.7344456, 1.889863, 1, 0, 0.01960784, 1,
3.002613, -0.8598162, 1.079993, 1, 0, 0.01176471, 1,
3.088694, -0.5069582, 1.020523, 1, 0, 0.007843138, 1
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
0.02870214, -4.434951, -6.807693, 0, -0.5, 0.5, 0.5,
0.02870214, -4.434951, -6.807693, 1, -0.5, 0.5, 0.5,
0.02870214, -4.434951, -6.807693, 1, 1.5, 0.5, 0.5,
0.02870214, -4.434951, -6.807693, 0, 1.5, 0.5, 0.5
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
-4.068626, -0.04434562, -6.807693, 0, -0.5, 0.5, 0.5,
-4.068626, -0.04434562, -6.807693, 1, -0.5, 0.5, 0.5,
-4.068626, -0.04434562, -6.807693, 1, 1.5, 0.5, 0.5,
-4.068626, -0.04434562, -6.807693, 0, 1.5, 0.5, 0.5
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
-4.068626, -4.434951, -0.09162688, 0, -0.5, 0.5, 0.5,
-4.068626, -4.434951, -0.09162688, 1, -0.5, 0.5, 0.5,
-4.068626, -4.434951, -0.09162688, 1, 1.5, 0.5, 0.5,
-4.068626, -4.434951, -0.09162688, 0, 1.5, 0.5, 0.5
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
-3, -3.421735, -5.257832,
3, -3.421735, -5.257832,
-3, -3.421735, -5.257832,
-3, -3.590604, -5.516141,
-2, -3.421735, -5.257832,
-2, -3.590604, -5.516141,
-1, -3.421735, -5.257832,
-1, -3.590604, -5.516141,
0, -3.421735, -5.257832,
0, -3.590604, -5.516141,
1, -3.421735, -5.257832,
1, -3.590604, -5.516141,
2, -3.421735, -5.257832,
2, -3.590604, -5.516141,
3, -3.421735, -5.257832,
3, -3.590604, -5.516141
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
-3, -3.928343, -6.032762, 0, -0.5, 0.5, 0.5,
-3, -3.928343, -6.032762, 1, -0.5, 0.5, 0.5,
-3, -3.928343, -6.032762, 1, 1.5, 0.5, 0.5,
-3, -3.928343, -6.032762, 0, 1.5, 0.5, 0.5,
-2, -3.928343, -6.032762, 0, -0.5, 0.5, 0.5,
-2, -3.928343, -6.032762, 1, -0.5, 0.5, 0.5,
-2, -3.928343, -6.032762, 1, 1.5, 0.5, 0.5,
-2, -3.928343, -6.032762, 0, 1.5, 0.5, 0.5,
-1, -3.928343, -6.032762, 0, -0.5, 0.5, 0.5,
-1, -3.928343, -6.032762, 1, -0.5, 0.5, 0.5,
-1, -3.928343, -6.032762, 1, 1.5, 0.5, 0.5,
-1, -3.928343, -6.032762, 0, 1.5, 0.5, 0.5,
0, -3.928343, -6.032762, 0, -0.5, 0.5, 0.5,
0, -3.928343, -6.032762, 1, -0.5, 0.5, 0.5,
0, -3.928343, -6.032762, 1, 1.5, 0.5, 0.5,
0, -3.928343, -6.032762, 0, 1.5, 0.5, 0.5,
1, -3.928343, -6.032762, 0, -0.5, 0.5, 0.5,
1, -3.928343, -6.032762, 1, -0.5, 0.5, 0.5,
1, -3.928343, -6.032762, 1, 1.5, 0.5, 0.5,
1, -3.928343, -6.032762, 0, 1.5, 0.5, 0.5,
2, -3.928343, -6.032762, 0, -0.5, 0.5, 0.5,
2, -3.928343, -6.032762, 1, -0.5, 0.5, 0.5,
2, -3.928343, -6.032762, 1, 1.5, 0.5, 0.5,
2, -3.928343, -6.032762, 0, 1.5, 0.5, 0.5,
3, -3.928343, -6.032762, 0, -0.5, 0.5, 0.5,
3, -3.928343, -6.032762, 1, -0.5, 0.5, 0.5,
3, -3.928343, -6.032762, 1, 1.5, 0.5, 0.5,
3, -3.928343, -6.032762, 0, 1.5, 0.5, 0.5
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
-3.123089, -3, -5.257832,
-3.123089, 3, -5.257832,
-3.123089, -3, -5.257832,
-3.280679, -3, -5.516141,
-3.123089, -2, -5.257832,
-3.280679, -2, -5.516141,
-3.123089, -1, -5.257832,
-3.280679, -1, -5.516141,
-3.123089, 0, -5.257832,
-3.280679, 0, -5.516141,
-3.123089, 1, -5.257832,
-3.280679, 1, -5.516141,
-3.123089, 2, -5.257832,
-3.280679, 2, -5.516141,
-3.123089, 3, -5.257832,
-3.280679, 3, -5.516141
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
-3.595858, -3, -6.032762, 0, -0.5, 0.5, 0.5,
-3.595858, -3, -6.032762, 1, -0.5, 0.5, 0.5,
-3.595858, -3, -6.032762, 1, 1.5, 0.5, 0.5,
-3.595858, -3, -6.032762, 0, 1.5, 0.5, 0.5,
-3.595858, -2, -6.032762, 0, -0.5, 0.5, 0.5,
-3.595858, -2, -6.032762, 1, -0.5, 0.5, 0.5,
-3.595858, -2, -6.032762, 1, 1.5, 0.5, 0.5,
-3.595858, -2, -6.032762, 0, 1.5, 0.5, 0.5,
-3.595858, -1, -6.032762, 0, -0.5, 0.5, 0.5,
-3.595858, -1, -6.032762, 1, -0.5, 0.5, 0.5,
-3.595858, -1, -6.032762, 1, 1.5, 0.5, 0.5,
-3.595858, -1, -6.032762, 0, 1.5, 0.5, 0.5,
-3.595858, 0, -6.032762, 0, -0.5, 0.5, 0.5,
-3.595858, 0, -6.032762, 1, -0.5, 0.5, 0.5,
-3.595858, 0, -6.032762, 1, 1.5, 0.5, 0.5,
-3.595858, 0, -6.032762, 0, 1.5, 0.5, 0.5,
-3.595858, 1, -6.032762, 0, -0.5, 0.5, 0.5,
-3.595858, 1, -6.032762, 1, -0.5, 0.5, 0.5,
-3.595858, 1, -6.032762, 1, 1.5, 0.5, 0.5,
-3.595858, 1, -6.032762, 0, 1.5, 0.5, 0.5,
-3.595858, 2, -6.032762, 0, -0.5, 0.5, 0.5,
-3.595858, 2, -6.032762, 1, -0.5, 0.5, 0.5,
-3.595858, 2, -6.032762, 1, 1.5, 0.5, 0.5,
-3.595858, 2, -6.032762, 0, 1.5, 0.5, 0.5,
-3.595858, 3, -6.032762, 0, -0.5, 0.5, 0.5,
-3.595858, 3, -6.032762, 1, -0.5, 0.5, 0.5,
-3.595858, 3, -6.032762, 1, 1.5, 0.5, 0.5,
-3.595858, 3, -6.032762, 0, 1.5, 0.5, 0.5
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
-3.123089, -3.421735, -4,
-3.123089, -3.421735, 4,
-3.123089, -3.421735, -4,
-3.280679, -3.590604, -4,
-3.123089, -3.421735, -2,
-3.280679, -3.590604, -2,
-3.123089, -3.421735, 0,
-3.280679, -3.590604, 0,
-3.123089, -3.421735, 2,
-3.280679, -3.590604, 2,
-3.123089, -3.421735, 4,
-3.280679, -3.590604, 4
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
-3.595858, -3.928343, -4, 0, -0.5, 0.5, 0.5,
-3.595858, -3.928343, -4, 1, -0.5, 0.5, 0.5,
-3.595858, -3.928343, -4, 1, 1.5, 0.5, 0.5,
-3.595858, -3.928343, -4, 0, 1.5, 0.5, 0.5,
-3.595858, -3.928343, -2, 0, -0.5, 0.5, 0.5,
-3.595858, -3.928343, -2, 1, -0.5, 0.5, 0.5,
-3.595858, -3.928343, -2, 1, 1.5, 0.5, 0.5,
-3.595858, -3.928343, -2, 0, 1.5, 0.5, 0.5,
-3.595858, -3.928343, 0, 0, -0.5, 0.5, 0.5,
-3.595858, -3.928343, 0, 1, -0.5, 0.5, 0.5,
-3.595858, -3.928343, 0, 1, 1.5, 0.5, 0.5,
-3.595858, -3.928343, 0, 0, 1.5, 0.5, 0.5,
-3.595858, -3.928343, 2, 0, -0.5, 0.5, 0.5,
-3.595858, -3.928343, 2, 1, -0.5, 0.5, 0.5,
-3.595858, -3.928343, 2, 1, 1.5, 0.5, 0.5,
-3.595858, -3.928343, 2, 0, 1.5, 0.5, 0.5,
-3.595858, -3.928343, 4, 0, -0.5, 0.5, 0.5,
-3.595858, -3.928343, 4, 1, -0.5, 0.5, 0.5,
-3.595858, -3.928343, 4, 1, 1.5, 0.5, 0.5,
-3.595858, -3.928343, 4, 0, 1.5, 0.5, 0.5
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
-3.123089, -3.421735, -5.257832,
-3.123089, 3.333043, -5.257832,
-3.123089, -3.421735, 5.074578,
-3.123089, 3.333043, 5.074578,
-3.123089, -3.421735, -5.257832,
-3.123089, -3.421735, 5.074578,
-3.123089, 3.333043, -5.257832,
-3.123089, 3.333043, 5.074578,
-3.123089, -3.421735, -5.257832,
3.180493, -3.421735, -5.257832,
-3.123089, -3.421735, 5.074578,
3.180493, -3.421735, 5.074578,
-3.123089, 3.333043, -5.257832,
3.180493, 3.333043, -5.257832,
-3.123089, 3.333043, 5.074578,
3.180493, 3.333043, 5.074578,
3.180493, -3.421735, -5.257832,
3.180493, 3.333043, -5.257832,
3.180493, -3.421735, 5.074578,
3.180493, 3.333043, 5.074578,
3.180493, -3.421735, -5.257832,
3.180493, -3.421735, 5.074578,
3.180493, 3.333043, -5.257832,
3.180493, 3.333043, 5.074578
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
var radius = 7.40138;
var distance = 32.92958;
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
mvMatrix.translate( -0.02870214, 0.04434562, 0.09162688 );
mvMatrix.scale( 1.269519, 1.18472, 0.7745064 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -32.92958);
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
sulfentrazone<-read.table("sulfentrazone.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-sulfentrazone$V2
```

```
## Error in eval(expr, envir, enclos): object 'sulfentrazone' not found
```

```r
y<-sulfentrazone$V3
```

```
## Error in eval(expr, envir, enclos): object 'sulfentrazone' not found
```

```r
z<-sulfentrazone$V4
```

```
## Error in eval(expr, envir, enclos): object 'sulfentrazone' not found
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
-3.031289, 0.9504947, -1.752149, 0, 0, 1, 1, 1,
-2.887479, -0.8836847, -2.254869, 1, 0, 0, 1, 1,
-2.830613, -0.8294361, -2.484931, 1, 0, 0, 1, 1,
-2.827824, 0.8057806, -0.8887255, 1, 0, 0, 1, 1,
-2.655641, -0.06768549, -2.166869, 1, 0, 0, 1, 1,
-2.44211, -0.7994294, -1.29366, 1, 0, 0, 1, 1,
-2.339147, -1.817663, -2.358507, 0, 0, 0, 1, 1,
-2.330643, -1.334618, -2.863513, 0, 0, 0, 1, 1,
-2.326751, -0.151627, -0.7396079, 0, 0, 0, 1, 1,
-2.312909, 2.15279, -2.190478, 0, 0, 0, 1, 1,
-2.279721, -0.6965986, 0.3602301, 0, 0, 0, 1, 1,
-2.226245, 1.469793, -0.07031518, 0, 0, 0, 1, 1,
-2.203959, 0.2340922, -1.796263, 0, 0, 0, 1, 1,
-2.163023, 0.1212858, 0.1234995, 1, 1, 1, 1, 1,
-2.159698, -1.510864, -1.728952, 1, 1, 1, 1, 1,
-2.156681, -0.755763, -2.528677, 1, 1, 1, 1, 1,
-2.154349, 0.8769268, -0.5596433, 1, 1, 1, 1, 1,
-2.085134, 3.234673, -0.6660799, 1, 1, 1, 1, 1,
-2.069436, -0.1320901, -1.502061, 1, 1, 1, 1, 1,
-2.045978, 0.09936941, -2.901908, 1, 1, 1, 1, 1,
-2.032706, -0.4951909, -2.506194, 1, 1, 1, 1, 1,
-2.023421, -0.1831511, -1.534854, 1, 1, 1, 1, 1,
-1.986139, -0.7395346, -1.095286, 1, 1, 1, 1, 1,
-1.971025, -0.3769987, -2.324534, 1, 1, 1, 1, 1,
-1.97075, 0.04216903, -2.345689, 1, 1, 1, 1, 1,
-1.963194, 1.062234, -0.1711218, 1, 1, 1, 1, 1,
-1.956687, 1.889914, 0.8680792, 1, 1, 1, 1, 1,
-1.950935, 1.17726, -1.760979, 1, 1, 1, 1, 1,
-1.939995, -0.3863044, -3.643108, 0, 0, 1, 1, 1,
-1.939199, -0.9825242, -1.708654, 1, 0, 0, 1, 1,
-1.902002, -0.09128868, -0.1964467, 1, 0, 0, 1, 1,
-1.890882, -0.8113155, -1.016724, 1, 0, 0, 1, 1,
-1.883806, -1.419495, -2.126567, 1, 0, 0, 1, 1,
-1.879559, -2.122654, -4.520383, 1, 0, 0, 1, 1,
-1.87766, -0.7180033, -2.657331, 0, 0, 0, 1, 1,
-1.876183, 0.8559119, -1.074783, 0, 0, 0, 1, 1,
-1.871547, 0.008188074, -1.100161, 0, 0, 0, 1, 1,
-1.854754, 0.8383043, -0.3874556, 0, 0, 0, 1, 1,
-1.842149, 1.075827, -1.215012, 0, 0, 0, 1, 1,
-1.838394, 0.9192339, 0.600847, 0, 0, 0, 1, 1,
-1.828514, -0.8106697, -0.6040095, 0, 0, 0, 1, 1,
-1.822405, 0.8555475, -2.725012, 1, 1, 1, 1, 1,
-1.808133, -0.5860282, -2.434743, 1, 1, 1, 1, 1,
-1.778845, 0.9425829, -1.894817, 1, 1, 1, 1, 1,
-1.765131, 1.261212, -2.439147, 1, 1, 1, 1, 1,
-1.732732, 1.539032, -3.487996, 1, 1, 1, 1, 1,
-1.710662, 0.2008424, -0.9063765, 1, 1, 1, 1, 1,
-1.699294, -1.148122, -2.396306, 1, 1, 1, 1, 1,
-1.696208, -1.381515, -1.520311, 1, 1, 1, 1, 1,
-1.696203, -0.9529411, -1.490667, 1, 1, 1, 1, 1,
-1.658351, -2.357432, -4.81417, 1, 1, 1, 1, 1,
-1.645875, 2.063341, -1.533395, 1, 1, 1, 1, 1,
-1.642077, -1.170211, -2.93263, 1, 1, 1, 1, 1,
-1.632258, 0.8648539, -0.8252379, 1, 1, 1, 1, 1,
-1.630757, 0.5165226, -0.3858164, 1, 1, 1, 1, 1,
-1.611221, -0.2505396, -1.765179, 1, 1, 1, 1, 1,
-1.608136, -0.791786, -1.872098, 0, 0, 1, 1, 1,
-1.605552, 1.314924, -0.1614875, 1, 0, 0, 1, 1,
-1.595742, -0.6088154, -1.41354, 1, 0, 0, 1, 1,
-1.585886, -2.141016, -3.878022, 1, 0, 0, 1, 1,
-1.584497, -0.2252885, -2.479737, 1, 0, 0, 1, 1,
-1.571886, -1.581887, -1.58595, 1, 0, 0, 1, 1,
-1.571486, -1.123402, -3.805374, 0, 0, 0, 1, 1,
-1.571126, -0.5165858, -2.365166, 0, 0, 0, 1, 1,
-1.565853, 0.3633585, -0.5663936, 0, 0, 0, 1, 1,
-1.557916, -0.7416365, -1.947343, 0, 0, 0, 1, 1,
-1.551404, -0.3745727, -0.9776597, 0, 0, 0, 1, 1,
-1.519058, 0.9485123, -1.291543, 0, 0, 0, 1, 1,
-1.507508, 1.164226, -1.163203, 0, 0, 0, 1, 1,
-1.498798, 1.116053, -0.9650351, 1, 1, 1, 1, 1,
-1.49716, -0.0915669, -1.456648, 1, 1, 1, 1, 1,
-1.496073, -0.2545411, -2.524608, 1, 1, 1, 1, 1,
-1.491086, 0.2751138, -1.080801, 1, 1, 1, 1, 1,
-1.484643, -0.1483842, -2.656033, 1, 1, 1, 1, 1,
-1.484632, 1.29523, -0.9947491, 1, 1, 1, 1, 1,
-1.46314, -1.390928, -2.330863, 1, 1, 1, 1, 1,
-1.460298, 0.2185602, -1.266378, 1, 1, 1, 1, 1,
-1.459562, 0.5506009, -1.470481, 1, 1, 1, 1, 1,
-1.445841, 1.518779, 1.297389, 1, 1, 1, 1, 1,
-1.445432, -0.3196877, -1.282785, 1, 1, 1, 1, 1,
-1.443554, -2.160486, -2.773439, 1, 1, 1, 1, 1,
-1.429734, -0.1198373, -1.648421, 1, 1, 1, 1, 1,
-1.418175, 0.1418095, -0.8154396, 1, 1, 1, 1, 1,
-1.407634, 1.394212, -0.7152966, 1, 1, 1, 1, 1,
-1.399146, -0.7434856, -0.5935699, 0, 0, 1, 1, 1,
-1.39729, -0.3639351, -1.488993, 1, 0, 0, 1, 1,
-1.384275, -1.20064, -3.873266, 1, 0, 0, 1, 1,
-1.378432, -0.9425742, 0.445945, 1, 0, 0, 1, 1,
-1.356364, -2.154253, -4.520651, 1, 0, 0, 1, 1,
-1.35145, 0.5196935, -2.110656, 1, 0, 0, 1, 1,
-1.348658, -0.1440383, -0.8568292, 0, 0, 0, 1, 1,
-1.335725, -0.6669039, -1.881457, 0, 0, 0, 1, 1,
-1.33428, -0.6599427, -3.457056, 0, 0, 0, 1, 1,
-1.333817, 0.5414193, 1.33898, 0, 0, 0, 1, 1,
-1.327056, -1.189911, -2.117902, 0, 0, 0, 1, 1,
-1.322028, 1.104724, -3.302216, 0, 0, 0, 1, 1,
-1.31087, 0.2658908, -0.5231291, 0, 0, 0, 1, 1,
-1.307322, -1.42404, -2.565743, 1, 1, 1, 1, 1,
-1.301968, -1.790789, -3.072939, 1, 1, 1, 1, 1,
-1.293158, -1.912775, -1.326339, 1, 1, 1, 1, 1,
-1.292395, 1.52239, 0.09753218, 1, 1, 1, 1, 1,
-1.289481, 1.270439, -1.804347, 1, 1, 1, 1, 1,
-1.288447, -0.9561424, -2.624915, 1, 1, 1, 1, 1,
-1.286371, -0.8288282, -3.27185, 1, 1, 1, 1, 1,
-1.283276, 0.05798341, -1.029002, 1, 1, 1, 1, 1,
-1.278638, 1.070158, -2.01355, 1, 1, 1, 1, 1,
-1.276667, 0.1758329, -2.595536, 1, 1, 1, 1, 1,
-1.275497, 1.954839, -1.020825, 1, 1, 1, 1, 1,
-1.274894, 1.325332, -0.671205, 1, 1, 1, 1, 1,
-1.274632, -0.2032568, -2.36039, 1, 1, 1, 1, 1,
-1.274472, -0.2290038, -3.483584, 1, 1, 1, 1, 1,
-1.271959, -0.6610869, -1.877787, 1, 1, 1, 1, 1,
-1.258446, 0.1408303, -0.8364359, 0, 0, 1, 1, 1,
-1.256564, 1.888296, -0.2980289, 1, 0, 0, 1, 1,
-1.248939, 0.2767358, -1.450809, 1, 0, 0, 1, 1,
-1.234177, -0.1784621, -1.580995, 1, 0, 0, 1, 1,
-1.22071, -0.4910711, -1.055723, 1, 0, 0, 1, 1,
-1.217022, -1.750099, -3.588871, 1, 0, 0, 1, 1,
-1.213896, 0.3634905, -1.436005, 0, 0, 0, 1, 1,
-1.209036, -1.523098, -2.305591, 0, 0, 0, 1, 1,
-1.209031, -0.7754189, -1.00983, 0, 0, 0, 1, 1,
-1.207495, 0.05554782, -2.804594, 0, 0, 0, 1, 1,
-1.206873, -0.171778, -3.029222, 0, 0, 0, 1, 1,
-1.200781, -0.4135326, -1.472878, 0, 0, 0, 1, 1,
-1.200366, -1.576488, -2.013025, 0, 0, 0, 1, 1,
-1.191623, 1.046432, -0.7182882, 1, 1, 1, 1, 1,
-1.182282, 0.3563008, -0.8142587, 1, 1, 1, 1, 1,
-1.180957, -1.255482, -3.671041, 1, 1, 1, 1, 1,
-1.179507, 1.130549, -0.8647474, 1, 1, 1, 1, 1,
-1.173564, -0.6546953, -0.5300599, 1, 1, 1, 1, 1,
-1.172078, -1.020999, -1.159021, 1, 1, 1, 1, 1,
-1.158577, 1.064094, -1.285545, 1, 1, 1, 1, 1,
-1.14629, -0.3854349, -0.2803119, 1, 1, 1, 1, 1,
-1.137625, 1.042012, -0.2746397, 1, 1, 1, 1, 1,
-1.133057, -0.1668633, -1.610702, 1, 1, 1, 1, 1,
-1.130914, 0.8486637, -0.9500393, 1, 1, 1, 1, 1,
-1.123501, -0.1157465, -1.02646, 1, 1, 1, 1, 1,
-1.121724, -0.6055674, -2.369955, 1, 1, 1, 1, 1,
-1.121393, 0.3939021, -1.600402, 1, 1, 1, 1, 1,
-1.117473, -2.139383, -2.176152, 1, 1, 1, 1, 1,
-1.116166, 1.527999, 0.2316547, 0, 0, 1, 1, 1,
-1.111186, -1.57475, -1.838627, 1, 0, 0, 1, 1,
-1.1092, -0.1857196, -2.210728, 1, 0, 0, 1, 1,
-1.106388, -0.6112613, -2.272235, 1, 0, 0, 1, 1,
-1.097903, 0.1844297, -1.186985, 1, 0, 0, 1, 1,
-1.097887, -0.5268899, -1.900939, 1, 0, 0, 1, 1,
-1.095633, -1.301074, -3.219602, 0, 0, 0, 1, 1,
-1.094848, 0.6935846, -0.8050635, 0, 0, 0, 1, 1,
-1.08564, 0.1964968, -1.487666, 0, 0, 0, 1, 1,
-1.084018, 0.5401896, -2.36113, 0, 0, 0, 1, 1,
-1.082222, -1.273056, -1.695296, 0, 0, 0, 1, 1,
-1.08048, -0.5987583, -2.48566, 0, 0, 0, 1, 1,
-1.070557, -1.071372, -2.84065, 0, 0, 0, 1, 1,
-1.066154, 2.462376, 0.3148243, 1, 1, 1, 1, 1,
-1.052489, 0.2001761, -0.7580236, 1, 1, 1, 1, 1,
-1.044996, 0.965734, 0.2502352, 1, 1, 1, 1, 1,
-1.041656, 1.545096, -1.144959, 1, 1, 1, 1, 1,
-1.041023, -0.03849621, -1.582387, 1, 1, 1, 1, 1,
-1.039794, -0.1114383, -0.9119789, 1, 1, 1, 1, 1,
-1.033943, -0.3798763, -2.08033, 1, 1, 1, 1, 1,
-1.030941, 0.0002745069, -1.272967, 1, 1, 1, 1, 1,
-1.029746, 0.5693626, -1.044452, 1, 1, 1, 1, 1,
-1.022298, 0.992324, -0.6753563, 1, 1, 1, 1, 1,
-1.021414, -0.6784508, -2.093728, 1, 1, 1, 1, 1,
-1.01299, 0.6846765, -1.608728, 1, 1, 1, 1, 1,
-1.008576, -0.8157763, -1.038098, 1, 1, 1, 1, 1,
-1.007667, 0.01355263, -3.482288, 1, 1, 1, 1, 1,
-1.005674, 1.236994, -0.8860508, 1, 1, 1, 1, 1,
-1.004642, -0.3030993, -4.163255, 0, 0, 1, 1, 1,
-0.9962931, -1.550383, -2.924971, 1, 0, 0, 1, 1,
-0.9865365, 1.628341, 0.6663644, 1, 0, 0, 1, 1,
-0.9787929, 1.009424, -1.614661, 1, 0, 0, 1, 1,
-0.9748406, -0.3728826, -1.111169, 1, 0, 0, 1, 1,
-0.9721574, -0.2759423, -4.08539, 1, 0, 0, 1, 1,
-0.9692007, -0.9407115, -1.850863, 0, 0, 0, 1, 1,
-0.96735, -0.3769727, -3.710468, 0, 0, 0, 1, 1,
-0.9614946, -0.291775, -0.9327103, 0, 0, 0, 1, 1,
-0.9598976, 0.6868672, -0.9312768, 0, 0, 0, 1, 1,
-0.9593061, 0.6138572, -1.106554, 0, 0, 0, 1, 1,
-0.9580835, 0.5269086, -2.744489, 0, 0, 0, 1, 1,
-0.9392602, 0.5474601, -1.463334, 0, 0, 0, 1, 1,
-0.9351237, -0.6552104, -3.082322, 1, 1, 1, 1, 1,
-0.9301533, -0.7207632, -2.451015, 1, 1, 1, 1, 1,
-0.9282988, 0.7684044, 0.5156864, 1, 1, 1, 1, 1,
-0.9277714, -0.5639005, -0.5397304, 1, 1, 1, 1, 1,
-0.9258443, -1.707095, -3.271829, 1, 1, 1, 1, 1,
-0.9252996, 1.313906, -3.350902, 1, 1, 1, 1, 1,
-0.9204596, 0.1885987, -2.313897, 1, 1, 1, 1, 1,
-0.9197694, -1.017588, -3.415856, 1, 1, 1, 1, 1,
-0.9188684, -0.2575757, -2.973154, 1, 1, 1, 1, 1,
-0.9175469, 1.173599, 0.1948353, 1, 1, 1, 1, 1,
-0.9162993, -0.4651466, -1.380543, 1, 1, 1, 1, 1,
-0.9151294, 0.160666, -2.138875, 1, 1, 1, 1, 1,
-0.9091887, -0.9819456, -2.574131, 1, 1, 1, 1, 1,
-0.9073431, 0.01902566, -1.037505, 1, 1, 1, 1, 1,
-0.906805, 0.3121474, 1.1237, 1, 1, 1, 1, 1,
-0.9061621, -1.120776, -1.945938, 0, 0, 1, 1, 1,
-0.9055748, -0.4527795, -0.8657618, 1, 0, 0, 1, 1,
-0.9051532, 0.129306, -1.628554, 1, 0, 0, 1, 1,
-0.8950781, -0.3595372, -3.971514, 1, 0, 0, 1, 1,
-0.8948611, 1.997721, -0.6801826, 1, 0, 0, 1, 1,
-0.8945591, -0.4175076, -3.192296, 1, 0, 0, 1, 1,
-0.8941804, 0.8072668, 0.9863496, 0, 0, 0, 1, 1,
-0.8925182, 1.862968, -1.038081, 0, 0, 0, 1, 1,
-0.8894029, 0.657363, -0.8647442, 0, 0, 0, 1, 1,
-0.8864713, -1.255808, -0.6324375, 0, 0, 0, 1, 1,
-0.8706803, -1.194883, -3.171726, 0, 0, 0, 1, 1,
-0.8705094, -1.134145, -4.154526, 0, 0, 0, 1, 1,
-0.8619471, 0.4548971, -3.056237, 0, 0, 0, 1, 1,
-0.860551, 1.155645, -1.2019, 1, 1, 1, 1, 1,
-0.8592129, 2.155348, 0.1837406, 1, 1, 1, 1, 1,
-0.8589604, 0.778931, -1.903622, 1, 1, 1, 1, 1,
-0.8544138, -0.5718484, -3.749561, 1, 1, 1, 1, 1,
-0.8507881, 0.1362862, -1.251918, 1, 1, 1, 1, 1,
-0.8474181, -1.574974, -3.180241, 1, 1, 1, 1, 1,
-0.8413025, 0.3679223, -0.6728078, 1, 1, 1, 1, 1,
-0.8386101, 1.427906, -0.002086904, 1, 1, 1, 1, 1,
-0.8360425, 0.7183967, -0.9976761, 1, 1, 1, 1, 1,
-0.8341799, -0.5742418, -2.966039, 1, 1, 1, 1, 1,
-0.8302099, -1.888956, -0.9563613, 1, 1, 1, 1, 1,
-0.8225653, -0.4697541, -1.14406, 1, 1, 1, 1, 1,
-0.8204083, 1.192981, -2.624293, 1, 1, 1, 1, 1,
-0.8185531, -0.6900655, -1.409844, 1, 1, 1, 1, 1,
-0.8184967, 0.03375776, 0.02802701, 1, 1, 1, 1, 1,
-0.8155444, 1.686026, -2.593529, 0, 0, 1, 1, 1,
-0.8136534, 1.515776, -0.6128561, 1, 0, 0, 1, 1,
-0.8114584, -0.4481495, -2.367452, 1, 0, 0, 1, 1,
-0.8042752, -0.05673847, -2.888551, 1, 0, 0, 1, 1,
-0.8022411, -1.184953, -2.958625, 1, 0, 0, 1, 1,
-0.8018014, 0.5188038, -2.098327, 1, 0, 0, 1, 1,
-0.8017683, 0.1436153, -2.512569, 0, 0, 0, 1, 1,
-0.7993061, 0.6176966, -0.7274409, 0, 0, 0, 1, 1,
-0.794533, 0.6937019, -1.026848, 0, 0, 0, 1, 1,
-0.7941477, -0.376319, -3.47725, 0, 0, 0, 1, 1,
-0.7934228, -0.7351457, -4.623385, 0, 0, 0, 1, 1,
-0.7921191, -0.8616004, -3.012449, 0, 0, 0, 1, 1,
-0.7913943, -1.000899, -2.857163, 0, 0, 0, 1, 1,
-0.7876387, -0.09357307, -1.276946, 1, 1, 1, 1, 1,
-0.7793561, 0.4875226, -0.567661, 1, 1, 1, 1, 1,
-0.7750776, -1.180288, -3.129202, 1, 1, 1, 1, 1,
-0.7696285, 0.3113738, -1.189768, 1, 1, 1, 1, 1,
-0.766902, -0.8224083, -1.657036, 1, 1, 1, 1, 1,
-0.7641907, -0.2583287, -2.29455, 1, 1, 1, 1, 1,
-0.7550372, 0.1920343, -2.18405, 1, 1, 1, 1, 1,
-0.7530547, 0.8528445, -0.5682902, 1, 1, 1, 1, 1,
-0.7517488, -0.1096391, -2.013116, 1, 1, 1, 1, 1,
-0.7497917, 0.5665686, -0.656965, 1, 1, 1, 1, 1,
-0.7491549, 0.06285146, -1.424308, 1, 1, 1, 1, 1,
-0.7456146, 0.1172492, -1.558058, 1, 1, 1, 1, 1,
-0.7444472, 0.2254576, -2.840638, 1, 1, 1, 1, 1,
-0.7400696, -0.5258422, -2.061791, 1, 1, 1, 1, 1,
-0.731715, 0.02967609, -2.219418, 1, 1, 1, 1, 1,
-0.7251863, 0.180979, -1.148584, 0, 0, 1, 1, 1,
-0.724107, 0.1632149, -1.779878, 1, 0, 0, 1, 1,
-0.720263, 0.3401245, -0.8651257, 1, 0, 0, 1, 1,
-0.7150919, 0.3701511, -2.763312, 1, 0, 0, 1, 1,
-0.7103379, -0.6355074, -2.560378, 1, 0, 0, 1, 1,
-0.7022167, -0.3458363, -2.21384, 1, 0, 0, 1, 1,
-0.6886958, 0.7697949, -1.987951, 0, 0, 0, 1, 1,
-0.6874317, 0.384132, -1.105259, 0, 0, 0, 1, 1,
-0.6872354, 0.2234429, -0.5357674, 0, 0, 0, 1, 1,
-0.6864916, 0.6030191, -1.480076, 0, 0, 0, 1, 1,
-0.6855662, -0.262042, -3.181851, 0, 0, 0, 1, 1,
-0.6840503, -0.5160929, -2.503222, 0, 0, 0, 1, 1,
-0.6838931, 0.02153439, -1.053571, 0, 0, 0, 1, 1,
-0.6833175, 0.8577119, -2.42641, 1, 1, 1, 1, 1,
-0.6793678, 0.8940089, -1.123679, 1, 1, 1, 1, 1,
-0.6760286, -0.2008088, -2.276616, 1, 1, 1, 1, 1,
-0.6744707, -0.7528973, -3.420243, 1, 1, 1, 1, 1,
-0.6666585, -0.6290428, -1.154431, 1, 1, 1, 1, 1,
-0.66515, 0.1432542, -2.873737, 1, 1, 1, 1, 1,
-0.655602, 0.1319624, -0.9871296, 1, 1, 1, 1, 1,
-0.6495367, -0.2894331, -2.197193, 1, 1, 1, 1, 1,
-0.6487933, -0.5213855, -1.84093, 1, 1, 1, 1, 1,
-0.6484854, -2.471995, -3.65394, 1, 1, 1, 1, 1,
-0.6431175, -1.209358, -1.514352, 1, 1, 1, 1, 1,
-0.6427453, 0.8314393, -1.569849, 1, 1, 1, 1, 1,
-0.6367738, -1.510495, -2.517607, 1, 1, 1, 1, 1,
-0.6358926, -0.348581, -2.238637, 1, 1, 1, 1, 1,
-0.6349291, 0.5984231, 0.01082532, 1, 1, 1, 1, 1,
-0.6275542, 0.2531015, -1.8802, 0, 0, 1, 1, 1,
-0.6230614, 0.7372234, -0.3731366, 1, 0, 0, 1, 1,
-0.6221251, 0.07098845, 0.340133, 1, 0, 0, 1, 1,
-0.6219624, 0.3147684, -2.193091, 1, 0, 0, 1, 1,
-0.618863, 0.601353, -0.8514665, 1, 0, 0, 1, 1,
-0.6184985, 0.01116618, 0.640124, 1, 0, 0, 1, 1,
-0.6105819, 0.7989781, -0.9517955, 0, 0, 0, 1, 1,
-0.6097599, -0.2097757, -2.518391, 0, 0, 0, 1, 1,
-0.6072869, -0.3635223, -0.5067936, 0, 0, 0, 1, 1,
-0.6013299, 1.456503, 0.9763725, 0, 0, 0, 1, 1,
-0.6012986, -1.179003, -4.42774, 0, 0, 0, 1, 1,
-0.6004758, 2.153329, 1.610637, 0, 0, 0, 1, 1,
-0.5968439, -0.7677829, -3.516125, 0, 0, 0, 1, 1,
-0.5919651, 2.17361, -0.07209145, 1, 1, 1, 1, 1,
-0.5790029, 1.63984, 0.4411141, 1, 1, 1, 1, 1,
-0.5748571, -1.78146, -2.038691, 1, 1, 1, 1, 1,
-0.5734792, -0.9668658, -2.924355, 1, 1, 1, 1, 1,
-0.5730851, -0.2020972, -2.187258, 1, 1, 1, 1, 1,
-0.5672631, -0.08903649, -2.106259, 1, 1, 1, 1, 1,
-0.5672103, -0.08169299, -1.048108, 1, 1, 1, 1, 1,
-0.5670342, 2.109622, 0.9853212, 1, 1, 1, 1, 1,
-0.5667545, 0.3507656, -1.194848, 1, 1, 1, 1, 1,
-0.5600597, 0.1081725, 0.1003468, 1, 1, 1, 1, 1,
-0.5495715, 0.786794, -1.10994, 1, 1, 1, 1, 1,
-0.5477397, 0.561219, -2.230413, 1, 1, 1, 1, 1,
-0.5477044, -0.3657162, -2.705276, 1, 1, 1, 1, 1,
-0.5459881, -1.602416, -3.40163, 1, 1, 1, 1, 1,
-0.5456918, -0.02616399, -1.162713, 1, 1, 1, 1, 1,
-0.545176, -0.476766, -3.272069, 0, 0, 1, 1, 1,
-0.5401987, -0.4842562, -3.155576, 1, 0, 0, 1, 1,
-0.5393644, -1.512438, -2.302641, 1, 0, 0, 1, 1,
-0.5369154, 0.9535198, -0.02451251, 1, 0, 0, 1, 1,
-0.5349808, -0.01023952, -0.3270341, 1, 0, 0, 1, 1,
-0.530642, -0.9411055, -3.464637, 1, 0, 0, 1, 1,
-0.5305982, -0.3415573, -0.5289015, 0, 0, 0, 1, 1,
-0.5272351, 1.202454, -1.168, 0, 0, 0, 1, 1,
-0.527229, 0.2623832, -2.334681, 0, 0, 0, 1, 1,
-0.5257118, -0.7886686, -1.786124, 0, 0, 0, 1, 1,
-0.5247591, -0.2047336, -2.341758, 0, 0, 0, 1, 1,
-0.5230589, -0.5584973, -1.300073, 0, 0, 0, 1, 1,
-0.5218815, 1.71409, -1.493054, 0, 0, 0, 1, 1,
-0.5200268, 0.7821627, -0.4910785, 1, 1, 1, 1, 1,
-0.5197002, -0.2350106, -1.451405, 1, 1, 1, 1, 1,
-0.5185579, 0.1387019, -2.068482, 1, 1, 1, 1, 1,
-0.5138012, 0.3299077, 0.5056226, 1, 1, 1, 1, 1,
-0.5126632, -0.610997, -2.874425, 1, 1, 1, 1, 1,
-0.5098903, 1.085671, -1.492743, 1, 1, 1, 1, 1,
-0.5098219, 0.2837669, -0.525215, 1, 1, 1, 1, 1,
-0.5087507, -1.276849, -2.843832, 1, 1, 1, 1, 1,
-0.504379, -0.5367055, -3.125787, 1, 1, 1, 1, 1,
-0.5013396, 0.2826455, -0.5797352, 1, 1, 1, 1, 1,
-0.4949401, -1.086166, -2.779154, 1, 1, 1, 1, 1,
-0.4929768, -0.5339708, -2.38592, 1, 1, 1, 1, 1,
-0.4925261, 0.8444582, -1.637425, 1, 1, 1, 1, 1,
-0.4910465, 0.3663945, -0.1406497, 1, 1, 1, 1, 1,
-0.4903262, -0.01306843, -0.8925718, 1, 1, 1, 1, 1,
-0.489042, 0.5865399, -2.055946, 0, 0, 1, 1, 1,
-0.4880286, 1.144735, 0.01723132, 1, 0, 0, 1, 1,
-0.4871558, -0.1524742, -3.005794, 1, 0, 0, 1, 1,
-0.483463, 1.942963, -0.8709521, 1, 0, 0, 1, 1,
-0.4829162, 1.214265, 0.9434108, 1, 0, 0, 1, 1,
-0.479239, 2.918338, 0.6803033, 1, 0, 0, 1, 1,
-0.4762971, -0.5363294, -3.02703, 0, 0, 0, 1, 1,
-0.4744666, 1.209507, 0.862432, 0, 0, 0, 1, 1,
-0.4726542, -0.5721464, -1.907099, 0, 0, 0, 1, 1,
-0.4708904, 1.05798, -1.03215, 0, 0, 0, 1, 1,
-0.4656705, 0.9136885, -0.6809111, 0, 0, 0, 1, 1,
-0.4590901, 0.3321268, -0.7893602, 0, 0, 0, 1, 1,
-0.4575227, 0.6359146, -0.3336667, 0, 0, 0, 1, 1,
-0.4574103, 2.13072, -1.528088, 1, 1, 1, 1, 1,
-0.456688, -1.137636, -1.969986, 1, 1, 1, 1, 1,
-0.4545463, 0.763755, -0.874611, 1, 1, 1, 1, 1,
-0.4517862, -1.097291, -3.688174, 1, 1, 1, 1, 1,
-0.4481865, 1.317171, -0.2055879, 1, 1, 1, 1, 1,
-0.4481233, 0.7103744, 0.8237903, 1, 1, 1, 1, 1,
-0.4459508, -1.162663, -4.086456, 1, 1, 1, 1, 1,
-0.441359, 0.237882, -3.224381, 1, 1, 1, 1, 1,
-0.4384035, -0.3720112, -2.775366, 1, 1, 1, 1, 1,
-0.4377466, 0.4380042, -1.196141, 1, 1, 1, 1, 1,
-0.4371464, -0.428024, -2.644797, 1, 1, 1, 1, 1,
-0.4333948, -0.3010526, -2.028022, 1, 1, 1, 1, 1,
-0.4315007, -1.92718, -4.190608, 1, 1, 1, 1, 1,
-0.4295786, -0.4394989, -1.837246, 1, 1, 1, 1, 1,
-0.4213687, 0.7465456, -0.4649852, 1, 1, 1, 1, 1,
-0.4211343, 1.262664, -1.385968, 0, 0, 1, 1, 1,
-0.4204403, -0.9576949, -3.798173, 1, 0, 0, 1, 1,
-0.417765, -0.2529756, -1.695706, 1, 0, 0, 1, 1,
-0.4167613, -1.404885, -3.229692, 1, 0, 0, 1, 1,
-0.4153561, 0.4978434, -0.3851535, 1, 0, 0, 1, 1,
-0.4150184, -0.09695453, -2.130274, 1, 0, 0, 1, 1,
-0.4089351, -1.066305, -3.666863, 0, 0, 0, 1, 1,
-0.4085099, 0.2972293, -1.863028, 0, 0, 0, 1, 1,
-0.4084658, -0.012663, -1.527362, 0, 0, 0, 1, 1,
-0.4063857, -0.6394131, -4.768322, 0, 0, 0, 1, 1,
-0.4044284, -1.101024, -4.032089, 0, 0, 0, 1, 1,
-0.4010713, 1.67119, -0.325856, 0, 0, 0, 1, 1,
-0.4002437, -0.2167293, -3.438492, 0, 0, 0, 1, 1,
-0.3914396, 1.040547, -2.199209, 1, 1, 1, 1, 1,
-0.3786968, 1.586228, -0.9552302, 1, 1, 1, 1, 1,
-0.3768218, 1.301758, 0.6089706, 1, 1, 1, 1, 1,
-0.37636, -0.3098457, -0.9320081, 1, 1, 1, 1, 1,
-0.3728425, 0.9016461, -2.701916, 1, 1, 1, 1, 1,
-0.3723072, -0.1663309, -1.337596, 1, 1, 1, 1, 1,
-0.3718869, -1.099567, -2.596891, 1, 1, 1, 1, 1,
-0.3697678, 1.648509, 0.9616255, 1, 1, 1, 1, 1,
-0.3673444, -0.2840431, -2.968334, 1, 1, 1, 1, 1,
-0.3667287, 1.166835, -1.074044, 1, 1, 1, 1, 1,
-0.3650155, 0.5816848, -1.274885, 1, 1, 1, 1, 1,
-0.3632723, 0.0287215, -0.6005389, 1, 1, 1, 1, 1,
-0.3622448, -1.730037, -3.524675, 1, 1, 1, 1, 1,
-0.3608359, -0.1920882, -2.391302, 1, 1, 1, 1, 1,
-0.3557336, 0.3746946, -0.7854257, 1, 1, 1, 1, 1,
-0.3519289, -0.1227245, -1.323363, 0, 0, 1, 1, 1,
-0.3513195, 0.6546224, -0.2525962, 1, 0, 0, 1, 1,
-0.3505953, -0.841402, -0.6432164, 1, 0, 0, 1, 1,
-0.3466079, 1.304809, -0.3668922, 1, 0, 0, 1, 1,
-0.3457887, -0.04317125, 0.3310586, 1, 0, 0, 1, 1,
-0.3425373, -0.6078203, -1.658537, 1, 0, 0, 1, 1,
-0.3368796, -0.4674657, -3.580048, 0, 0, 0, 1, 1,
-0.3318311, 0.2780725, -1.248587, 0, 0, 0, 1, 1,
-0.3316244, -0.5631142, -1.272756, 0, 0, 0, 1, 1,
-0.3290284, -0.5233437, -1.099594, 0, 0, 0, 1, 1,
-0.3227688, 0.3753305, 0.1558194, 0, 0, 0, 1, 1,
-0.3220804, 0.5312201, -0.1235516, 0, 0, 0, 1, 1,
-0.3177599, 1.968583, 1.286648, 0, 0, 0, 1, 1,
-0.3171237, 0.3531118, -1.835273, 1, 1, 1, 1, 1,
-0.3150183, -0.9404124, -2.936746, 1, 1, 1, 1, 1,
-0.3093822, -0.6168958, -4.708891, 1, 1, 1, 1, 1,
-0.2987075, 0.1851654, -2.155196, 1, 1, 1, 1, 1,
-0.2977372, -1.426891, -2.589308, 1, 1, 1, 1, 1,
-0.2952467, -1.437632, -4.243791, 1, 1, 1, 1, 1,
-0.2903833, -2.351982, -2.618762, 1, 1, 1, 1, 1,
-0.2891032, -0.8842818, -0.7207345, 1, 1, 1, 1, 1,
-0.2884367, 0.7074299, -0.5238307, 1, 1, 1, 1, 1,
-0.288342, 2.293402, -0.8384011, 1, 1, 1, 1, 1,
-0.2880281, -0.4494736, -2.296212, 1, 1, 1, 1, 1,
-0.2850488, 1.150745, -0.2017751, 1, 1, 1, 1, 1,
-0.2808458, 0.554517, 1.598466, 1, 1, 1, 1, 1,
-0.2777731, 0.1169874, -2.1506, 1, 1, 1, 1, 1,
-0.2727375, -0.1138335, -2.379267, 1, 1, 1, 1, 1,
-0.2681863, 0.4571039, -0.6747674, 0, 0, 1, 1, 1,
-0.2609775, 0.05921645, 0.2422716, 1, 0, 0, 1, 1,
-0.25581, -0.3131073, -3.615978, 1, 0, 0, 1, 1,
-0.254281, -0.07911838, -3.542649, 1, 0, 0, 1, 1,
-0.2510032, 0.1867564, 0.5339967, 1, 0, 0, 1, 1,
-0.2499316, 1.317355, 0.2707751, 1, 0, 0, 1, 1,
-0.2447953, 0.9591449, 0.5132654, 0, 0, 0, 1, 1,
-0.2438305, 1.213404, 0.639299, 0, 0, 0, 1, 1,
-0.2389168, 0.110723, -0.1799991, 0, 0, 0, 1, 1,
-0.2337666, -0.1250841, -1.38137, 0, 0, 0, 1, 1,
-0.2283233, -1.562671, -0.6415897, 0, 0, 0, 1, 1,
-0.22419, 0.6040417, 0.5901774, 0, 0, 0, 1, 1,
-0.2235238, 0.4259631, 0.1856742, 0, 0, 0, 1, 1,
-0.2231542, -0.001747984, -0.3961669, 1, 1, 1, 1, 1,
-0.2225644, 1.274701, -2.343801, 1, 1, 1, 1, 1,
-0.2219032, 1.65714, -2.149967, 1, 1, 1, 1, 1,
-0.2207703, 0.2373261, 0.1082155, 1, 1, 1, 1, 1,
-0.2162743, 1.048002, 0.8789749, 1, 1, 1, 1, 1,
-0.2147989, -0.4243048, -3.755469, 1, 1, 1, 1, 1,
-0.2132408, -0.1175749, -1.956566, 1, 1, 1, 1, 1,
-0.2088086, -2.390147, -3.236592, 1, 1, 1, 1, 1,
-0.2084473, -0.2853642, -3.471701, 1, 1, 1, 1, 1,
-0.2064291, -1.28151, -3.842395, 1, 1, 1, 1, 1,
-0.2054005, 0.4836113, -1.782927, 1, 1, 1, 1, 1,
-0.2018621, -0.2886103, -2.45648, 1, 1, 1, 1, 1,
-0.1994887, 1.03579, -0.0950242, 1, 1, 1, 1, 1,
-0.1985913, 0.9213471, -0.8929527, 1, 1, 1, 1, 1,
-0.1980575, 0.6993096, 0.1992692, 1, 1, 1, 1, 1,
-0.1974304, 0.04817609, -0.7635562, 0, 0, 1, 1, 1,
-0.1967487, 0.3892643, -1.120482, 1, 0, 0, 1, 1,
-0.1945961, 1.498482, 0.7922238, 1, 0, 0, 1, 1,
-0.1927598, -0.1023069, -0.3931307, 1, 0, 0, 1, 1,
-0.1915581, -0.8448304, -5.107359, 1, 0, 0, 1, 1,
-0.1821166, -0.4011717, -2.718342, 1, 0, 0, 1, 1,
-0.1815094, -2.167557, -3.862315, 0, 0, 0, 1, 1,
-0.172252, 0.9295285, -1.476914, 0, 0, 0, 1, 1,
-0.1711559, -0.04581114, -1.925841, 0, 0, 0, 1, 1,
-0.1680227, -0.07517938, -1.934088, 0, 0, 0, 1, 1,
-0.1647079, -1.704579, -2.877574, 0, 0, 0, 1, 1,
-0.1619565, -1.178986, -4.013822, 0, 0, 0, 1, 1,
-0.1573354, 1.168235, 1.04309, 0, 0, 0, 1, 1,
-0.1524452, -0.1139939, -2.640549, 1, 1, 1, 1, 1,
-0.1491654, -0.1181884, -2.719764, 1, 1, 1, 1, 1,
-0.1463219, -0.1502967, -1.62175, 1, 1, 1, 1, 1,
-0.1459232, 0.5125345, 0.5567449, 1, 1, 1, 1, 1,
-0.1456247, -0.2002997, -2.566977, 1, 1, 1, 1, 1,
-0.1412615, -0.01622282, -2.420819, 1, 1, 1, 1, 1,
-0.1340724, 2.462321, -0.9151769, 1, 1, 1, 1, 1,
-0.1316843, -0.6548154, -0.752416, 1, 1, 1, 1, 1,
-0.1315843, 0.6828321, -1.283758, 1, 1, 1, 1, 1,
-0.1232884, -2.228073, -3.695878, 1, 1, 1, 1, 1,
-0.1228988, 2.67289, -0.0614317, 1, 1, 1, 1, 1,
-0.1207966, 0.392307, -1.002191, 1, 1, 1, 1, 1,
-0.11877, 0.1386719, -1.139021, 1, 1, 1, 1, 1,
-0.1179994, -0.2840322, -3.589052, 1, 1, 1, 1, 1,
-0.1175444, 0.5244893, 2.092519, 1, 1, 1, 1, 1,
-0.1164771, 0.1399084, -0.4679806, 0, 0, 1, 1, 1,
-0.1152767, -0.3249324, -0.7607148, 1, 0, 0, 1, 1,
-0.1138493, -0.3480093, -2.069114, 1, 0, 0, 1, 1,
-0.113663, -0.8527929, -2.775356, 1, 0, 0, 1, 1,
-0.1125334, -0.8517691, -3.22543, 1, 0, 0, 1, 1,
-0.1103213, 0.4652452, -2.541204, 1, 0, 0, 1, 1,
-0.1096333, -0.6745275, -1.783414, 0, 0, 0, 1, 1,
-0.1095727, -0.9581235, -1.644239, 0, 0, 0, 1, 1,
-0.1039646, 0.8874393, -1.570175, 0, 0, 0, 1, 1,
-0.1029073, 0.4445523, -3.016987, 0, 0, 0, 1, 1,
-0.09772528, 0.2001018, -0.8510333, 0, 0, 0, 1, 1,
-0.09629683, 0.2704219, -1.523294, 0, 0, 0, 1, 1,
-0.08914088, -0.3889384, -3.639145, 0, 0, 0, 1, 1,
-0.08715923, 0.7791019, -0.2259169, 1, 1, 1, 1, 1,
-0.08107289, 0.8353724, 0.2148839, 1, 1, 1, 1, 1,
-0.08075175, 1.108512, 1.480032, 1, 1, 1, 1, 1,
-0.08011479, -0.8058535, -4.584637, 1, 1, 1, 1, 1,
-0.07695081, 0.3495281, -0.4737541, 1, 1, 1, 1, 1,
-0.07004976, 0.6384895, 0.7627329, 1, 1, 1, 1, 1,
-0.06768357, 0.3649388, 0.4027835, 1, 1, 1, 1, 1,
-0.06747361, 0.6859599, -1.197453, 1, 1, 1, 1, 1,
-0.0536004, 0.7537402, -1.384677, 1, 1, 1, 1, 1,
-0.05033661, -0.5610545, -4.819711, 1, 1, 1, 1, 1,
-0.05000247, 0.0383073, -0.7323865, 1, 1, 1, 1, 1,
-0.04838086, 1.512773, -2.237347, 1, 1, 1, 1, 1,
-0.04359962, 0.4016148, -0.8032368, 1, 1, 1, 1, 1,
-0.04140526, -0.7009789, -0.2722256, 1, 1, 1, 1, 1,
-0.04042685, -0.3680276, -3.864421, 1, 1, 1, 1, 1,
-0.03655384, -0.184618, -3.479993, 0, 0, 1, 1, 1,
-0.0324243, 0.6410733, 0.4985327, 1, 0, 0, 1, 1,
-0.02992203, -0.5826113, -3.569144, 1, 0, 0, 1, 1,
-0.02606236, 0.1877403, -0.7995814, 1, 0, 0, 1, 1,
-0.02478422, 0.255793, 0.545363, 1, 0, 0, 1, 1,
-0.02409327, 0.01633782, -1.153563, 1, 0, 0, 1, 1,
-0.02088655, -0.09672783, -3.213323, 0, 0, 0, 1, 1,
-0.01133421, 0.9919931, -0.1961085, 0, 0, 0, 1, 1,
-0.01001033, -1.861486, -3.152379, 0, 0, 0, 1, 1,
-0.008020901, 1.956223, -1.78037, 0, 0, 0, 1, 1,
-0.006848246, -0.6104798, -2.62276, 0, 0, 0, 1, 1,
-0.006274555, 1.170758, 2.023548, 0, 0, 0, 1, 1,
-0.003686098, 1.721545, 0.7852872, 0, 0, 0, 1, 1,
-0.0007080168, 0.2288033, -1.502066, 1, 1, 1, 1, 1,
0.0009134986, -0.4828579, 3.966535, 1, 1, 1, 1, 1,
0.001152525, -0.713816, 3.911916, 1, 1, 1, 1, 1,
0.003973695, -0.1464821, 2.900106, 1, 1, 1, 1, 1,
0.007971076, -0.6667346, 4.687997, 1, 1, 1, 1, 1,
0.008369066, -0.9674756, 3.598097, 1, 1, 1, 1, 1,
0.008634861, 0.08269982, -1.06943, 1, 1, 1, 1, 1,
0.01136417, -0.4144751, 3.258631, 1, 1, 1, 1, 1,
0.01385059, -0.9273025, 2.264914, 1, 1, 1, 1, 1,
0.01815732, 0.3939, -0.4650761, 1, 1, 1, 1, 1,
0.0185552, 0.3674811, -0.5476553, 1, 1, 1, 1, 1,
0.0266399, 0.8094336, 0.1928467, 1, 1, 1, 1, 1,
0.02665322, 1.266588, -0.8592371, 1, 1, 1, 1, 1,
0.03146885, -0.4757546, 1.625837, 1, 1, 1, 1, 1,
0.0316861, 1.514871, -1.711111, 1, 1, 1, 1, 1,
0.03740054, -0.1223775, 2.422318, 0, 0, 1, 1, 1,
0.04226571, -0.5505612, 2.657241, 1, 0, 0, 1, 1,
0.05308826, -1.56629, 3.094539, 1, 0, 0, 1, 1,
0.05341344, -0.4692962, 3.559493, 1, 0, 0, 1, 1,
0.0570174, -0.2317009, 2.55258, 1, 0, 0, 1, 1,
0.06208502, -0.1843485, 4.112035, 1, 0, 0, 1, 1,
0.06243879, -0.6627064, 2.939223, 0, 0, 0, 1, 1,
0.06463251, -0.8570917, 2.596783, 0, 0, 0, 1, 1,
0.06896374, 1.112178, -0.8201009, 0, 0, 0, 1, 1,
0.0719353, 0.629062, 0.757922, 0, 0, 0, 1, 1,
0.07585812, 2.664454, 0.4708007, 0, 0, 0, 1, 1,
0.07901634, -1.54415, 3.114745, 0, 0, 0, 1, 1,
0.08019608, -0.6443241, 3.243171, 0, 0, 0, 1, 1,
0.0813154, 1.347033, -0.00526318, 1, 1, 1, 1, 1,
0.08361449, 0.2342095, -1.850971, 1, 1, 1, 1, 1,
0.08427343, -0.1714562, 4.033763, 1, 1, 1, 1, 1,
0.08758555, 1.459358, 0.9640747, 1, 1, 1, 1, 1,
0.08782998, 1.332582, 0.7679595, 1, 1, 1, 1, 1,
0.08811752, -0.8795344, 2.403247, 1, 1, 1, 1, 1,
0.08901482, -0.4279766, 4.164522, 1, 1, 1, 1, 1,
0.09155134, 0.3759198, 0.4413033, 1, 1, 1, 1, 1,
0.09175072, 0.9332832, 0.4358789, 1, 1, 1, 1, 1,
0.0922707, -0.2275226, 3.539876, 1, 1, 1, 1, 1,
0.0959987, 1.441747, 0.2983029, 1, 1, 1, 1, 1,
0.09831802, 1.62553, -0.8226675, 1, 1, 1, 1, 1,
0.09905559, -0.7211763, 2.28073, 1, 1, 1, 1, 1,
0.1015766, 1.871042, -0.2472637, 1, 1, 1, 1, 1,
0.1029266, 1.267502, -0.5477555, 1, 1, 1, 1, 1,
0.1039795, 0.35134, 0.3918267, 0, 0, 1, 1, 1,
0.104343, -0.5952309, 1.634799, 1, 0, 0, 1, 1,
0.117346, 1.848022, -1.309046, 1, 0, 0, 1, 1,
0.1196741, 0.6471364, -0.2139557, 1, 0, 0, 1, 1,
0.120633, 0.08784188, 2.067167, 1, 0, 0, 1, 1,
0.1211763, -0.4336571, 3.764693, 1, 0, 0, 1, 1,
0.1231142, 1.26325, 0.3220404, 0, 0, 0, 1, 1,
0.1247345, -1.23566, 3.717164, 0, 0, 0, 1, 1,
0.1253707, -1.094399, 2.273335, 0, 0, 0, 1, 1,
0.1275655, -1.386592, 2.87063, 0, 0, 0, 1, 1,
0.1278295, 0.4268908, 0.6711961, 0, 0, 0, 1, 1,
0.137866, -0.5122588, 3.679125, 0, 0, 0, 1, 1,
0.1452734, 1.19634, 1.924349, 0, 0, 0, 1, 1,
0.1550561, -0.07208223, 1.691032, 1, 1, 1, 1, 1,
0.1552968, -0.6151031, 1.28899, 1, 1, 1, 1, 1,
0.156382, -0.8888938, 3.817955, 1, 1, 1, 1, 1,
0.1635483, -0.9838735, 3.745459, 1, 1, 1, 1, 1,
0.16639, 0.6945828, -0.7249654, 1, 1, 1, 1, 1,
0.1668611, -0.9000406, 3.240474, 1, 1, 1, 1, 1,
0.1702892, 0.3450457, -1.058041, 1, 1, 1, 1, 1,
0.171, 0.1329539, 0.4805854, 1, 1, 1, 1, 1,
0.1781517, -1.186827, 3.579312, 1, 1, 1, 1, 1,
0.182035, -0.3258801, 0.4986371, 1, 1, 1, 1, 1,
0.1828592, -1.173465, 2.239762, 1, 1, 1, 1, 1,
0.1880286, -0.399394, 3.124205, 1, 1, 1, 1, 1,
0.1881552, -0.9316052, 2.951041, 1, 1, 1, 1, 1,
0.1933988, -0.6760556, 2.99699, 1, 1, 1, 1, 1,
0.1953926, 1.368041, -1.042743, 1, 1, 1, 1, 1,
0.1954123, 0.8399144, 0.2585913, 0, 0, 1, 1, 1,
0.1955463, 0.602128, -1.347557, 1, 0, 0, 1, 1,
0.2051878, 1.291337, 0.5211802, 1, 0, 0, 1, 1,
0.2073836, -1.14128, 2.625635, 1, 0, 0, 1, 1,
0.2088331, 0.5012251, 0.7645569, 1, 0, 0, 1, 1,
0.2131112, 0.3129191, -0.9685627, 1, 0, 0, 1, 1,
0.215627, 0.4423299, 1.59319, 0, 0, 0, 1, 1,
0.220873, 0.08809309, 1.901758, 0, 0, 0, 1, 1,
0.2210934, -0.5999361, 3.434352, 0, 0, 0, 1, 1,
0.2223966, 0.2750994, -0.03235522, 0, 0, 0, 1, 1,
0.2252223, -2.725824, 4.486547, 0, 0, 0, 1, 1,
0.226436, 1.520062, -0.4710648, 0, 0, 0, 1, 1,
0.2275626, 0.1930116, 1.556237, 0, 0, 0, 1, 1,
0.2276649, -0.08773076, 0.5766625, 1, 1, 1, 1, 1,
0.2276968, -1.774105, 3.146337, 1, 1, 1, 1, 1,
0.2300735, -0.007445155, 1.115936, 1, 1, 1, 1, 1,
0.2311396, 0.8203491, 1.996357, 1, 1, 1, 1, 1,
0.2338131, 0.7153109, -1.392667, 1, 1, 1, 1, 1,
0.2373244, -0.01836709, 1.165463, 1, 1, 1, 1, 1,
0.2382037, 1.109909, 0.06289043, 1, 1, 1, 1, 1,
0.2392171, -0.2134761, 1.960175, 1, 1, 1, 1, 1,
0.240053, -0.4615619, 3.407566, 1, 1, 1, 1, 1,
0.2409471, -0.144694, 1.63097, 1, 1, 1, 1, 1,
0.2421727, 0.2057512, 0.7204406, 1, 1, 1, 1, 1,
0.2432718, 1.472931, -0.2018403, 1, 1, 1, 1, 1,
0.245605, -0.6955495, 1.561791, 1, 1, 1, 1, 1,
0.2462922, -1.348705, 1.542467, 1, 1, 1, 1, 1,
0.2486632, 0.535453, -1.539477, 1, 1, 1, 1, 1,
0.2575331, -0.6693056, 2.921812, 0, 0, 1, 1, 1,
0.2595778, -0.2285776, 2.788617, 1, 0, 0, 1, 1,
0.2640629, 0.257923, 1.515609, 1, 0, 0, 1, 1,
0.264837, -1.281562, 0.6838639, 1, 0, 0, 1, 1,
0.2694048, -1.099933, 2.155842, 1, 0, 0, 1, 1,
0.2752968, 0.03453283, 1.930823, 1, 0, 0, 1, 1,
0.275868, -2.176899, 0.6123176, 0, 0, 0, 1, 1,
0.277171, -1.471731, 2.175112, 0, 0, 0, 1, 1,
0.2776269, -1.866093, 1.685344, 0, 0, 0, 1, 1,
0.2797577, 1.105619, 0.2271408, 0, 0, 0, 1, 1,
0.2808604, -0.3223782, 2.227551, 0, 0, 0, 1, 1,
0.2839707, -0.1038618, 0.6023393, 0, 0, 0, 1, 1,
0.2859535, 1.013914, 1.316863, 0, 0, 0, 1, 1,
0.2884714, -2.122938, 2.278659, 1, 1, 1, 1, 1,
0.2964372, 0.8577909, -0.2899003, 1, 1, 1, 1, 1,
0.2994616, 0.8921736, 0.1654677, 1, 1, 1, 1, 1,
0.2997784, -0.0792123, 1.82635, 1, 1, 1, 1, 1,
0.3029671, 1.200139, 0.244687, 1, 1, 1, 1, 1,
0.3051063, 0.09941378, 2.207259, 1, 1, 1, 1, 1,
0.3066394, -2.373916, 3.169727, 1, 1, 1, 1, 1,
0.3086151, 0.01766709, 1.940558, 1, 1, 1, 1, 1,
0.3108481, 1.520963, 1.180899, 1, 1, 1, 1, 1,
0.313889, 1.871067, -0.5144538, 1, 1, 1, 1, 1,
0.3141666, 1.45229, -0.08043284, 1, 1, 1, 1, 1,
0.3167768, -2.760268, 2.518727, 1, 1, 1, 1, 1,
0.319162, 0.09197124, 0.170038, 1, 1, 1, 1, 1,
0.3197704, 1.266309, 0.8917831, 1, 1, 1, 1, 1,
0.3337506, 0.3869052, 2.27602, 1, 1, 1, 1, 1,
0.337144, 0.6559974, 0.2042907, 0, 0, 1, 1, 1,
0.3393088, 0.4256273, 0.3088867, 1, 0, 0, 1, 1,
0.3405585, -1.542412, 4.049495, 1, 0, 0, 1, 1,
0.3409985, 1.4728, -0.9597017, 1, 0, 0, 1, 1,
0.3417237, -0.5633832, 2.986791, 1, 0, 0, 1, 1,
0.3420719, -0.5472284, 0.3177872, 1, 0, 0, 1, 1,
0.3426528, 0.2487243, 0.2497144, 0, 0, 0, 1, 1,
0.3430161, -2.025114, 3.610171, 0, 0, 0, 1, 1,
0.3491542, 0.3268532, 0.896583, 0, 0, 0, 1, 1,
0.3500273, -1.760309, 3.044429, 0, 0, 0, 1, 1,
0.3511271, 1.968562, -0.8542959, 0, 0, 0, 1, 1,
0.3593971, -1.286495, 3.174811, 0, 0, 0, 1, 1,
0.3625753, -0.898252, 1.773969, 0, 0, 0, 1, 1,
0.3636174, 0.3677219, -1.406839, 1, 1, 1, 1, 1,
0.3670185, -0.6714298, 1.947725, 1, 1, 1, 1, 1,
0.3670655, -0.6092988, 2.291423, 1, 1, 1, 1, 1,
0.3728561, -0.372045, 3.330028, 1, 1, 1, 1, 1,
0.3754272, -0.346637, 4.134806, 1, 1, 1, 1, 1,
0.3784077, 0.8544288, -0.2076834, 1, 1, 1, 1, 1,
0.3816474, 0.4449046, 1.685286, 1, 1, 1, 1, 1,
0.3838725, 0.8993856, -0.8845827, 1, 1, 1, 1, 1,
0.3839118, 0.637412, 0.51541, 1, 1, 1, 1, 1,
0.3845505, -0.1496199, 0.9950448, 1, 1, 1, 1, 1,
0.3857763, 1.802122, 1.168938, 1, 1, 1, 1, 1,
0.3871197, -0.9985976, 1.014719, 1, 1, 1, 1, 1,
0.3876953, 1.691131, -0.08165161, 1, 1, 1, 1, 1,
0.3947692, 0.06889197, 2.82692, 1, 1, 1, 1, 1,
0.4089964, -0.3065313, 3.161124, 1, 1, 1, 1, 1,
0.4102133, -0.005231355, 1.796892, 0, 0, 1, 1, 1,
0.4119777, -0.5981991, 2.407463, 1, 0, 0, 1, 1,
0.4147145, -0.361131, 1.806947, 1, 0, 0, 1, 1,
0.4148584, -0.3841138, 2.944318, 1, 0, 0, 1, 1,
0.4162704, -0.4111188, 2.960647, 1, 0, 0, 1, 1,
0.418357, 1.139326, 1.307964, 1, 0, 0, 1, 1,
0.4244279, 0.115155, 1.142149, 0, 0, 0, 1, 1,
0.432263, 0.6855507, -0.3321246, 0, 0, 0, 1, 1,
0.4330193, 0.797174, 0.735513, 0, 0, 0, 1, 1,
0.4356513, 0.7081338, -0.8986377, 0, 0, 0, 1, 1,
0.4378963, 0.2104638, -0.2047046, 0, 0, 0, 1, 1,
0.438632, -0.9579346, 3.345718, 0, 0, 0, 1, 1,
0.4438746, -1.048561, 1.72871, 0, 0, 0, 1, 1,
0.4450146, -0.7044322, 2.757882, 1, 1, 1, 1, 1,
0.4499345, 1.511371, -1.762758, 1, 1, 1, 1, 1,
0.456894, 0.3871379, -1.034591, 1, 1, 1, 1, 1,
0.4571353, -1.181721, 1.519707, 1, 1, 1, 1, 1,
0.458029, 0.3731904, 1.966343, 1, 1, 1, 1, 1,
0.4597397, -1.109134, 3.067576, 1, 1, 1, 1, 1,
0.4622995, 1.478471, -0.2817654, 1, 1, 1, 1, 1,
0.4663129, 0.9976038, -1.111981, 1, 1, 1, 1, 1,
0.4664623, 2.10025, -0.06072759, 1, 1, 1, 1, 1,
0.4683925, 0.1331684, 2.161144, 1, 1, 1, 1, 1,
0.470573, -0.5061504, 2.147114, 1, 1, 1, 1, 1,
0.4712874, 0.5402263, 0.5334092, 1, 1, 1, 1, 1,
0.4714978, -0.08484475, 2.792129, 1, 1, 1, 1, 1,
0.4763043, 1.473586, 0.4306376, 1, 1, 1, 1, 1,
0.4820473, -1.844623, 2.226597, 1, 1, 1, 1, 1,
0.4826633, -3.323364, 1.737067, 0, 0, 1, 1, 1,
0.4851041, 0.3730922, 1.19663, 1, 0, 0, 1, 1,
0.4864415, -0.5670571, 3.62912, 1, 0, 0, 1, 1,
0.4890921, -0.3187508, 2.254074, 1, 0, 0, 1, 1,
0.4902897, 0.1714977, 1.479028, 1, 0, 0, 1, 1,
0.4927584, 0.6030281, 0.7343407, 1, 0, 0, 1, 1,
0.4929658, -0.5796479, 1.846771, 0, 0, 0, 1, 1,
0.4963612, -1.423752, 3.140943, 0, 0, 0, 1, 1,
0.5016468, -1.130548, 3.506046, 0, 0, 0, 1, 1,
0.501845, 2.178693, -1.26453, 0, 0, 0, 1, 1,
0.5018874, 0.1739624, 2.217553, 0, 0, 0, 1, 1,
0.5045078, 1.490749, -0.7281772, 0, 0, 0, 1, 1,
0.5053424, -1.970678, 2.964047, 0, 0, 0, 1, 1,
0.5085279, -1.035522, 2.244047, 1, 1, 1, 1, 1,
0.5090675, -0.06608188, -0.6429135, 1, 1, 1, 1, 1,
0.5117658, 1.18668, 0.09092, 1, 1, 1, 1, 1,
0.5117669, -1.411848, 2.566477, 1, 1, 1, 1, 1,
0.512061, 1.251393, 1.019734, 1, 1, 1, 1, 1,
0.5192252, -0.8830669, 4.8644, 1, 1, 1, 1, 1,
0.5268503, 1.320556, 0.5571462, 1, 1, 1, 1, 1,
0.5285679, -0.2217636, 0.6565524, 1, 1, 1, 1, 1,
0.529286, -0.1965519, 2.665984, 1, 1, 1, 1, 1,
0.5353794, 0.1253713, 1.389555, 1, 1, 1, 1, 1,
0.5389026, 1.209108, 0.6925451, 1, 1, 1, 1, 1,
0.5429851, 0.5025659, -0.248732, 1, 1, 1, 1, 1,
0.5460608, -0.8103501, 2.05107, 1, 1, 1, 1, 1,
0.550441, -0.4347236, 2.10266, 1, 1, 1, 1, 1,
0.5546104, 0.7328248, -0.9618602, 1, 1, 1, 1, 1,
0.5559171, -0.6460867, 2.503272, 0, 0, 1, 1, 1,
0.5593129, -0.40296, 4.068718, 1, 0, 0, 1, 1,
0.5596362, 0.7818943, -1.002471, 1, 0, 0, 1, 1,
0.5715975, -1.115274, 3.123578, 1, 0, 0, 1, 1,
0.574524, 0.4149243, 1.668876, 1, 0, 0, 1, 1,
0.5754008, -0.2408524, 0.9553329, 1, 0, 0, 1, 1,
0.5759592, -0.7199653, 2.713826, 0, 0, 0, 1, 1,
0.5763752, 0.6020654, 0.8391246, 0, 0, 0, 1, 1,
0.5830165, -0.4752427, 1.190852, 0, 0, 0, 1, 1,
0.5923725, -0.5693551, 1.316948, 0, 0, 0, 1, 1,
0.5943702, -0.1256831, 3.497449, 0, 0, 0, 1, 1,
0.5978082, -0.489682, 1.692086, 0, 0, 0, 1, 1,
0.5995321, 1.480963, 0.2836604, 0, 0, 0, 1, 1,
0.6072887, -0.4057856, 1.322524, 1, 1, 1, 1, 1,
0.610042, -0.08753674, 2.935417, 1, 1, 1, 1, 1,
0.6144809, -0.223916, 2.822063, 1, 1, 1, 1, 1,
0.6192909, 0.397317, 0.2429685, 1, 1, 1, 1, 1,
0.621941, 1.305364, -0.3563215, 1, 1, 1, 1, 1,
0.6229357, 0.3052444, 0.4134866, 1, 1, 1, 1, 1,
0.6234574, -0.2183164, 1.792814, 1, 1, 1, 1, 1,
0.6246005, -0.2928281, 3.032139, 1, 1, 1, 1, 1,
0.6246538, -1.030417, 2.68279, 1, 1, 1, 1, 1,
0.6350751, 1.56956, 0.990512, 1, 1, 1, 1, 1,
0.6378338, 0.399201, 1.293113, 1, 1, 1, 1, 1,
0.6411288, 1.327187, 0.7051001, 1, 1, 1, 1, 1,
0.6445878, -0.9704006, 3.267607, 1, 1, 1, 1, 1,
0.6447415, 0.8625387, 0.08361633, 1, 1, 1, 1, 1,
0.6453587, -0.1811811, 4.244037, 1, 1, 1, 1, 1,
0.6474235, -0.9164897, 1.596331, 0, 0, 1, 1, 1,
0.647649, -0.09250145, 1.136509, 1, 0, 0, 1, 1,
0.6523528, -0.6879556, 2.192755, 1, 0, 0, 1, 1,
0.6589072, -0.7369722, 0.9130373, 1, 0, 0, 1, 1,
0.6593236, -0.9865044, 4.006997, 1, 0, 0, 1, 1,
0.6637826, 0.5889479, 0.1384637, 1, 0, 0, 1, 1,
0.6693391, -0.5677972, 3.617154, 0, 0, 0, 1, 1,
0.6741773, -0.9761443, 1.362664, 0, 0, 0, 1, 1,
0.6774144, -0.9873261, 3.846831, 0, 0, 0, 1, 1,
0.6802459, 0.9321762, 1.117818, 0, 0, 0, 1, 1,
0.6839321, -1.141869, 2.534584, 0, 0, 0, 1, 1,
0.6880073, -0.5088554, 0.6998941, 0, 0, 0, 1, 1,
0.6902409, -0.2962877, 1.027082, 0, 0, 0, 1, 1,
0.6927941, -0.3263526, 2.585663, 1, 1, 1, 1, 1,
0.6988099, -0.4602942, 0.8190716, 1, 1, 1, 1, 1,
0.7103621, -0.6083992, 3.158745, 1, 1, 1, 1, 1,
0.7122846, 0.05836446, 2.232718, 1, 1, 1, 1, 1,
0.7164866, -1.339611, 0.3969165, 1, 1, 1, 1, 1,
0.716794, -1.162345, 2.887253, 1, 1, 1, 1, 1,
0.718072, 1.008644, -0.3378369, 1, 1, 1, 1, 1,
0.7184106, 1.197928, 1.107791, 1, 1, 1, 1, 1,
0.7210568, -1.478999, 2.677892, 1, 1, 1, 1, 1,
0.7267116, -0.3222108, 3.310615, 1, 1, 1, 1, 1,
0.7320858, 0.4359052, 3.043933, 1, 1, 1, 1, 1,
0.7356902, 0.0003420655, 2.297623, 1, 1, 1, 1, 1,
0.7405942, -0.7756076, 1.739554, 1, 1, 1, 1, 1,
0.743676, -0.6592566, 2.375201, 1, 1, 1, 1, 1,
0.7484593, 0.3425165, 0.8475721, 1, 1, 1, 1, 1,
0.7503523, 0.0066964, 1.723783, 0, 0, 1, 1, 1,
0.7527131, -0.06108434, 0.9632976, 1, 0, 0, 1, 1,
0.7550617, 0.6562321, 0.2819281, 1, 0, 0, 1, 1,
0.7555725, -0.7346017, 2.486606, 1, 0, 0, 1, 1,
0.757258, -0.5268386, 1.478877, 1, 0, 0, 1, 1,
0.7591797, 0.08498001, 1.558736, 1, 0, 0, 1, 1,
0.766967, 1.155528, 0.1357658, 0, 0, 0, 1, 1,
0.7672759, -0.3020732, 1.894679, 0, 0, 0, 1, 1,
0.7734243, -0.3630699, 3.239122, 0, 0, 0, 1, 1,
0.7745224, 0.6301498, 0.8465667, 0, 0, 0, 1, 1,
0.7748263, 0.5096666, 0.7107922, 0, 0, 0, 1, 1,
0.7810729, -0.4746155, 3.676612, 0, 0, 0, 1, 1,
0.7815874, -0.6184671, 1.310867, 0, 0, 0, 1, 1,
0.7826257, 0.860149, 0.2535259, 1, 1, 1, 1, 1,
0.7857549, 0.5772022, 1.162786, 1, 1, 1, 1, 1,
0.7867707, -0.5979773, 1.354825, 1, 1, 1, 1, 1,
0.7887785, 0.4896605, 1.638787, 1, 1, 1, 1, 1,
0.7895078, -0.1966505, 0.8406658, 1, 1, 1, 1, 1,
0.7926667, -2.453605, 3.389275, 1, 1, 1, 1, 1,
0.8002837, -1.404582, 3.083694, 1, 1, 1, 1, 1,
0.800792, -1.366474, 2.471744, 1, 1, 1, 1, 1,
0.8044561, 0.9163398, 1.454439, 1, 1, 1, 1, 1,
0.8059018, 0.7344949, -0.3466263, 1, 1, 1, 1, 1,
0.8107905, 0.1279226, -0.5299642, 1, 1, 1, 1, 1,
0.8170993, -0.9457417, 3.28439, 1, 1, 1, 1, 1,
0.8214042, -1.228461, 1.036007, 1, 1, 1, 1, 1,
0.8238207, -1.02304, 3.022525, 1, 1, 1, 1, 1,
0.8256358, 1.253995, 1.315108, 1, 1, 1, 1, 1,
0.8270431, -1.860237, 4.339884, 0, 0, 1, 1, 1,
0.8322006, -0.6046178, 2.998019, 1, 0, 0, 1, 1,
0.8341052, -1.624888, 3.72998, 1, 0, 0, 1, 1,
0.839256, -0.5894542, 1.742416, 1, 0, 0, 1, 1,
0.8404415, -0.7628437, 1.270101, 1, 0, 0, 1, 1,
0.8502425, -0.01829836, 1.054308, 1, 0, 0, 1, 1,
0.8528712, 1.00563, 1.875556, 0, 0, 0, 1, 1,
0.8599802, 1.60257, -1.097708, 0, 0, 0, 1, 1,
0.8659691, -0.8092574, 3.283121, 0, 0, 0, 1, 1,
0.8668734, -1.137503, 1.398088, 0, 0, 0, 1, 1,
0.8701832, -0.6586928, 1.950396, 0, 0, 0, 1, 1,
0.8782861, 1.556156, 0.3003927, 0, 0, 0, 1, 1,
0.8806266, 0.4885546, 0.06171543, 0, 0, 0, 1, 1,
0.8857238, 0.8187863, -1.210778, 1, 1, 1, 1, 1,
0.888789, -1.728221, 4.366968, 1, 1, 1, 1, 1,
0.8929503, -2.205227, 1.45198, 1, 1, 1, 1, 1,
0.8941628, 1.063724, 1.025134, 1, 1, 1, 1, 1,
0.8946375, -2.042219, 3.069474, 1, 1, 1, 1, 1,
0.8992434, -0.002046342, 1.64703, 1, 1, 1, 1, 1,
0.909879, -0.06661925, 2.834426, 1, 1, 1, 1, 1,
0.9193771, 1.023256, 1.791214, 1, 1, 1, 1, 1,
0.9231918, -0.2932679, 1.963802, 1, 1, 1, 1, 1,
0.9342639, -0.9701968, 2.714311, 1, 1, 1, 1, 1,
0.9348139, -0.2848084, 4.000588, 1, 1, 1, 1, 1,
0.9395815, 0.8784346, 0.9366851, 1, 1, 1, 1, 1,
0.9430123, 0.5042052, 0.5198849, 1, 1, 1, 1, 1,
0.9552249, -0.437899, 1.89342, 1, 1, 1, 1, 1,
0.9622248, 2.723814, 0.6175054, 1, 1, 1, 1, 1,
0.9657313, -2.440995, 1.359585, 0, 0, 1, 1, 1,
0.971025, 0.06073399, 1.224562, 1, 0, 0, 1, 1,
0.9734706, -0.8530917, 1.660312, 1, 0, 0, 1, 1,
0.9751536, 0.009928503, 2.551816, 1, 0, 0, 1, 1,
0.976435, 0.9353362, 2.317487, 1, 0, 0, 1, 1,
0.9780682, 0.4381273, 1.21839, 1, 0, 0, 1, 1,
0.9804225, -0.5664051, 0.9613687, 0, 0, 0, 1, 1,
0.9807639, 1.153421, 2.158748, 0, 0, 0, 1, 1,
0.9840478, -1.171713, 3.778077, 0, 0, 0, 1, 1,
0.9881159, -0.7455009, 2.537398, 0, 0, 0, 1, 1,
0.989986, -1.41792, 4.207355, 0, 0, 0, 1, 1,
0.9931683, 1.241987, -0.3482085, 0, 0, 0, 1, 1,
0.9975684, -0.4969809, 2.98974, 0, 0, 0, 1, 1,
1.004709, 0.1354741, 1.322127, 1, 1, 1, 1, 1,
1.006733, 0.4992429, 1.189414, 1, 1, 1, 1, 1,
1.009188, -0.04302512, 2.106644, 1, 1, 1, 1, 1,
1.011163, -1.664298, 3.052606, 1, 1, 1, 1, 1,
1.015382, 0.4682529, 1.411144, 1, 1, 1, 1, 1,
1.017251, 0.8898175, 0.79372, 1, 1, 1, 1, 1,
1.019226, 0.5081711, 1.863553, 1, 1, 1, 1, 1,
1.019252, -0.2398987, 2.593536, 1, 1, 1, 1, 1,
1.021293, 1.085516, 1.701426, 1, 1, 1, 1, 1,
1.021566, 0.6314136, 1.199206, 1, 1, 1, 1, 1,
1.02591, 0.2276391, 2.079365, 1, 1, 1, 1, 1,
1.032565, 0.1109533, 2.956218, 1, 1, 1, 1, 1,
1.039513, 0.6418179, 1.258195, 1, 1, 1, 1, 1,
1.041304, -0.2935121, 1.396562, 1, 1, 1, 1, 1,
1.049308, -0.5599315, 0.5091146, 1, 1, 1, 1, 1,
1.061468, 0.3830374, 3.47324, 0, 0, 1, 1, 1,
1.065795, -0.2051563, 1.551852, 1, 0, 0, 1, 1,
1.07047, -1.115139, 2.176576, 1, 0, 0, 1, 1,
1.070959, 0.6569915, 1.111155, 1, 0, 0, 1, 1,
1.075273, -0.1296632, 2.100479, 1, 0, 0, 1, 1,
1.078047, -1.686119, 1.836132, 1, 0, 0, 1, 1,
1.080118, -2.151834, 4.271665, 0, 0, 0, 1, 1,
1.086038, -0.8248775, 2.217408, 0, 0, 0, 1, 1,
1.091042, -2.018989, 3.636003, 0, 0, 0, 1, 1,
1.095316, 0.5844074, 2.01689, 0, 0, 0, 1, 1,
1.098826, 0.7277992, 1.129389, 0, 0, 0, 1, 1,
1.104443, 1.08402, -0.5284752, 0, 0, 0, 1, 1,
1.105829, -1.297056, 3.340454, 0, 0, 0, 1, 1,
1.107769, 0.8758938, 1.119829, 1, 1, 1, 1, 1,
1.115174, 1.074522, 0.04764212, 1, 1, 1, 1, 1,
1.126143, -1.147112, 2.177791, 1, 1, 1, 1, 1,
1.129608, 1.349932, 1.3408, 1, 1, 1, 1, 1,
1.133942, -0.1321567, 1.865664, 1, 1, 1, 1, 1,
1.156101, -0.8872992, 3.022518, 1, 1, 1, 1, 1,
1.160083, 1.031736, 1.517592, 1, 1, 1, 1, 1,
1.167349, 1.037263, -0.4431566, 1, 1, 1, 1, 1,
1.178557, -0.0004174236, 2.003788, 1, 1, 1, 1, 1,
1.182754, 0.8843165, 0.7989442, 1, 1, 1, 1, 1,
1.187786, 0.0702412, 1.272314, 1, 1, 1, 1, 1,
1.214013, -0.274918, 1.985944, 1, 1, 1, 1, 1,
1.218006, 0.2409395, 0.748482, 1, 1, 1, 1, 1,
1.218217, 0.9658082, 1.98672, 1, 1, 1, 1, 1,
1.224856, 0.2958444, 0.5284576, 1, 1, 1, 1, 1,
1.233347, -0.7361216, 4.924106, 0, 0, 1, 1, 1,
1.233445, 1.413839, 0.2049194, 1, 0, 0, 1, 1,
1.235929, 0.9006432, 0.9708584, 1, 0, 0, 1, 1,
1.256998, -0.3909796, 3.129676, 1, 0, 0, 1, 1,
1.274867, 0.4263622, 2.053791, 1, 0, 0, 1, 1,
1.27669, -1.354761, 2.634966, 1, 0, 0, 1, 1,
1.282521, -0.2777303, 1.946123, 0, 0, 0, 1, 1,
1.285504, 1.466, 1.047557, 0, 0, 0, 1, 1,
1.28789, 0.2182571, 0.3411377, 0, 0, 0, 1, 1,
1.29691, -0.07626755, 0.7774004, 0, 0, 0, 1, 1,
1.298977, 1.717452, 1.068935, 0, 0, 0, 1, 1,
1.313184, -0.1949813, 0.9828507, 0, 0, 0, 1, 1,
1.331753, -0.6323017, 1.282704, 0, 0, 0, 1, 1,
1.341441, -1.327841, 3.3733, 1, 1, 1, 1, 1,
1.34425, 0.1016762, 0.6421549, 1, 1, 1, 1, 1,
1.35028, -1.533623, 2.382734, 1, 1, 1, 1, 1,
1.352562, -0.4201118, 1.98023, 1, 1, 1, 1, 1,
1.355342, 0.3637663, 0.31599, 1, 1, 1, 1, 1,
1.356669, 0.5238842, 1.921977, 1, 1, 1, 1, 1,
1.361661, 1.611976, -0.2230919, 1, 1, 1, 1, 1,
1.368389, 1.135207, 1.799365, 1, 1, 1, 1, 1,
1.377713, -0.3920997, 1.380402, 1, 1, 1, 1, 1,
1.379847, 1.342779, -0.1122992, 1, 1, 1, 1, 1,
1.380423, 0.3398078, 1.884166, 1, 1, 1, 1, 1,
1.385409, 2.458297, -0.2731302, 1, 1, 1, 1, 1,
1.385857, -2.177404, 2.03851, 1, 1, 1, 1, 1,
1.407961, 0.2573106, 2.125418, 1, 1, 1, 1, 1,
1.409837, 0.6825057, 0.7990436, 1, 1, 1, 1, 1,
1.412477, -0.7073188, 1.932205, 0, 0, 1, 1, 1,
1.4309, -0.1035953, 2.290067, 1, 0, 0, 1, 1,
1.440299, -1.552166, 1.691329, 1, 0, 0, 1, 1,
1.449274, -0.7166029, 2.222455, 1, 0, 0, 1, 1,
1.452229, 0.2793651, 1.717913, 1, 0, 0, 1, 1,
1.453951, 0.4294675, 1.516662, 1, 0, 0, 1, 1,
1.464282, 1.426024, -0.120027, 0, 0, 0, 1, 1,
1.481809, -0.1665404, 0.8291098, 0, 0, 0, 1, 1,
1.488314, 0.9713905, 0.8359383, 0, 0, 0, 1, 1,
1.498207, 1.357632, 2.503132, 0, 0, 0, 1, 1,
1.502088, 0.6555773, 1.182805, 0, 0, 0, 1, 1,
1.519521, 0.8103664, 1.436174, 0, 0, 0, 1, 1,
1.526888, 0.2020099, 1.111988, 0, 0, 0, 1, 1,
1.530673, 0.5817594, 1.298879, 1, 1, 1, 1, 1,
1.532158, -0.1291995, 3.53545, 1, 1, 1, 1, 1,
1.544543, 1.045991, 0.6913541, 1, 1, 1, 1, 1,
1.545373, -0.4681689, 2.321323, 1, 1, 1, 1, 1,
1.55745, 0.1888433, 1.87129, 1, 1, 1, 1, 1,
1.564988, 0.8021588, -1.219839, 1, 1, 1, 1, 1,
1.570317, 1.079176, 1.184922, 1, 1, 1, 1, 1,
1.57295, -0.8690048, 0.4917398, 1, 1, 1, 1, 1,
1.577808, 0.5064729, 1.599827, 1, 1, 1, 1, 1,
1.579114, -1.529945, 1.515998, 1, 1, 1, 1, 1,
1.582547, -0.3736402, 1.079075, 1, 1, 1, 1, 1,
1.594836, 0.2549513, 0.8683419, 1, 1, 1, 1, 1,
1.606313, 0.03654204, -0.01992262, 1, 1, 1, 1, 1,
1.616316, -1.234818, 2.602918, 1, 1, 1, 1, 1,
1.636783, -0.4118045, 2.099257, 1, 1, 1, 1, 1,
1.651781, -0.8466436, 2.374362, 0, 0, 1, 1, 1,
1.678281, 1.224275, 1.008337, 1, 0, 0, 1, 1,
1.679964, -1.436311, 1.521385, 1, 0, 0, 1, 1,
1.686212, -0.8996617, 2.438854, 1, 0, 0, 1, 1,
1.693901, -0.2596449, 1.416561, 1, 0, 0, 1, 1,
1.70449, -0.2480073, 2.609871, 1, 0, 0, 1, 1,
1.708234, 0.1731668, 2.521224, 0, 0, 0, 1, 1,
1.710193, -0.5672233, 1.130457, 0, 0, 0, 1, 1,
1.710605, 0.1860137, 1.197109, 0, 0, 0, 1, 1,
1.727677, -0.5470911, 1.87427, 0, 0, 0, 1, 1,
1.746246, -0.4966024, 2.775207, 0, 0, 0, 1, 1,
1.775431, -0.09872779, 3.038848, 0, 0, 0, 1, 1,
1.821676, -0.8712483, 2.475244, 0, 0, 0, 1, 1,
1.828745, -1.730912, 3.868571, 1, 1, 1, 1, 1,
1.841253, 0.3382081, 2.545679, 1, 1, 1, 1, 1,
1.865459, -1.286288, 3.117489, 1, 1, 1, 1, 1,
1.870271, -1.126451, 3.163713, 1, 1, 1, 1, 1,
1.874091, 0.1595685, 0.6597005, 1, 1, 1, 1, 1,
1.896702, -1.766777, 2.473746, 1, 1, 1, 1, 1,
1.918028, 0.6115733, 1.596775, 1, 1, 1, 1, 1,
1.923167, 1.301193, 1.877962, 1, 1, 1, 1, 1,
1.928267, -1.613436, 1.633798, 1, 1, 1, 1, 1,
1.929381, -0.466999, 2.152943, 1, 1, 1, 1, 1,
1.968961, -1.088542, 1.674411, 1, 1, 1, 1, 1,
2.022616, 0.753072, 1.453286, 1, 1, 1, 1, 1,
2.030602, 1.528161, 2.230061, 1, 1, 1, 1, 1,
2.037652, 0.4686157, 0.4414916, 1, 1, 1, 1, 1,
2.051075, -0.446578, 1.694213, 1, 1, 1, 1, 1,
2.078238, 0.7075779, 1.120304, 0, 0, 1, 1, 1,
2.08105, -0.3394585, 0.3837868, 1, 0, 0, 1, 1,
2.08857, -0.01269368, 0.1289729, 1, 0, 0, 1, 1,
2.097484, -0.4221758, 1.534636, 1, 0, 0, 1, 1,
2.106337, 1.415202, 0.9522762, 1, 0, 0, 1, 1,
2.109185, 2.560296, 0.5426959, 1, 0, 0, 1, 1,
2.171437, 0.3222204, -0.03841786, 0, 0, 0, 1, 1,
2.270077, 0.6057116, 1.505292, 0, 0, 0, 1, 1,
2.28258, 0.71293, 0.2040427, 0, 0, 0, 1, 1,
2.312827, 0.8207604, 1.502127, 0, 0, 0, 1, 1,
2.324378, 2.176783, 1.081544, 0, 0, 0, 1, 1,
2.354292, 0.1837455, 0.3477721, 0, 0, 0, 1, 1,
2.378432, 0.3561708, 0.2734758, 0, 0, 0, 1, 1,
2.464505, -1.28387, 0.8210944, 1, 1, 1, 1, 1,
2.718634, -0.2556856, 1.860839, 1, 1, 1, 1, 1,
2.868818, -1.386562, 2.464108, 1, 1, 1, 1, 1,
2.939296, -0.9296404, 4.237555, 1, 1, 1, 1, 1,
2.974356, -0.7344456, 1.889863, 1, 1, 1, 1, 1,
3.002613, -0.8598162, 1.079993, 1, 1, 1, 1, 1,
3.088694, -0.5069582, 1.020523, 1, 1, 1, 1, 1
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
var radius = 9.267627;
var distance = 32.55215;
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
mvMatrix.translate( -0.02870226, 0.04434586, 0.09162688 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.55215);
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
