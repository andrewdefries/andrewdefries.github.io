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
-3.170901, 0.1229465, -1.490744, 1, 0, 0, 1,
-2.717466, -2.066886, -4.22303, 1, 0.007843138, 0, 1,
-2.678864, -0.443866, -0.2621835, 1, 0.01176471, 0, 1,
-2.672098, 0.3400065, -2.526973, 1, 0.01960784, 0, 1,
-2.659604, -0.8295976, -4.149189, 1, 0.02352941, 0, 1,
-2.634066, -0.2270402, -2.278751, 1, 0.03137255, 0, 1,
-2.61524, 1.617786, 1.910411, 1, 0.03529412, 0, 1,
-2.610738, 0.0932817, -3.476329, 1, 0.04313726, 0, 1,
-2.604543, 0.6345724, -0.3751359, 1, 0.04705882, 0, 1,
-2.55195, -0.8465003, -1.588071, 1, 0.05490196, 0, 1,
-2.481702, 1.334188, -1.574347, 1, 0.05882353, 0, 1,
-2.419009, 1.822364, -2.407289, 1, 0.06666667, 0, 1,
-2.39056, -1.152534, -0.1353154, 1, 0.07058824, 0, 1,
-2.378366, -0.1396907, -2.790025, 1, 0.07843138, 0, 1,
-2.37695, 1.308438, -0.5116398, 1, 0.08235294, 0, 1,
-2.363406, 0.4986353, -0.09371775, 1, 0.09019608, 0, 1,
-2.357388, -0.3353327, -0.353971, 1, 0.09411765, 0, 1,
-2.356493, -0.3229986, -2.506853, 1, 0.1019608, 0, 1,
-2.345624, -1.067747, -2.429744, 1, 0.1098039, 0, 1,
-2.307038, -0.1689117, -2.778302, 1, 0.1137255, 0, 1,
-2.301386, 0.1573046, -1.491051, 1, 0.1215686, 0, 1,
-2.295108, -0.7979703, -2.337385, 1, 0.1254902, 0, 1,
-2.264134, -1.014225, -2.347203, 1, 0.1333333, 0, 1,
-2.225661, -0.0884264, -1.36148, 1, 0.1372549, 0, 1,
-2.187129, -2.212923, -3.118904, 1, 0.145098, 0, 1,
-2.181234, -0.292958, -1.869535, 1, 0.1490196, 0, 1,
-2.180055, 0.6208499, -1.18177, 1, 0.1568628, 0, 1,
-2.171989, -0.934207, -0.9594308, 1, 0.1607843, 0, 1,
-2.143721, -0.4521424, -2.456329, 1, 0.1686275, 0, 1,
-2.130721, 2.190513, -1.500669, 1, 0.172549, 0, 1,
-2.082067, 0.1303266, -0.6942804, 1, 0.1803922, 0, 1,
-2.077707, 1.564866, -1.969272, 1, 0.1843137, 0, 1,
-2.076441, -1.489766, -1.467182, 1, 0.1921569, 0, 1,
-2.041712, -2.012119, -2.966631, 1, 0.1960784, 0, 1,
-2.015547, -1.658162, -3.815722, 1, 0.2039216, 0, 1,
-2.002892, -0.7276187, -0.2590926, 1, 0.2117647, 0, 1,
-1.991524, 0.6402792, -3.055376, 1, 0.2156863, 0, 1,
-1.98035, 0.6317149, -0.6236331, 1, 0.2235294, 0, 1,
-1.92079, 1.207146, -2.527887, 1, 0.227451, 0, 1,
-1.920711, 1.107912, 0.13198, 1, 0.2352941, 0, 1,
-1.887008, 1.311203, -1.768856, 1, 0.2392157, 0, 1,
-1.877674, -1.149656, -2.70608, 1, 0.2470588, 0, 1,
-1.864392, 0.8337152, -1.821021, 1, 0.2509804, 0, 1,
-1.850916, -0.0513112, -1.349915, 1, 0.2588235, 0, 1,
-1.842456, -0.03718276, -1.047976, 1, 0.2627451, 0, 1,
-1.839338, 0.3073007, -0.3593797, 1, 0.2705882, 0, 1,
-1.834792, -0.6828541, -0.0229005, 1, 0.2745098, 0, 1,
-1.81348, 0.7408985, -2.650702, 1, 0.282353, 0, 1,
-1.794241, -0.7064793, -0.7972072, 1, 0.2862745, 0, 1,
-1.782024, 1.529448, 0.09290158, 1, 0.2941177, 0, 1,
-1.759979, -0.4888421, -0.3944019, 1, 0.3019608, 0, 1,
-1.744949, 0.2309041, -1.816037, 1, 0.3058824, 0, 1,
-1.742765, -2.23061, -2.380919, 1, 0.3137255, 0, 1,
-1.741988, 0.7194954, -1.359575, 1, 0.3176471, 0, 1,
-1.740323, 0.4485928, -0.9464916, 1, 0.3254902, 0, 1,
-1.70507, -0.9925663, -2.110713, 1, 0.3294118, 0, 1,
-1.693784, 0.6447365, -2.334364, 1, 0.3372549, 0, 1,
-1.690153, 1.180056, -1.785925, 1, 0.3411765, 0, 1,
-1.672632, -0.3524467, 0.7043165, 1, 0.3490196, 0, 1,
-1.668303, -0.8773775, -2.18158, 1, 0.3529412, 0, 1,
-1.649904, -0.4478756, -1.576872, 1, 0.3607843, 0, 1,
-1.638095, 0.1122804, -0.4161116, 1, 0.3647059, 0, 1,
-1.619314, 0.8732938, 1.078306, 1, 0.372549, 0, 1,
-1.6145, -0.6255437, -1.937257, 1, 0.3764706, 0, 1,
-1.601763, 0.3728873, 0.6565958, 1, 0.3843137, 0, 1,
-1.594272, -1.037647, -1.365348, 1, 0.3882353, 0, 1,
-1.593768, -0.1735806, -3.412051, 1, 0.3960784, 0, 1,
-1.59318, 1.546169, 0.09922491, 1, 0.4039216, 0, 1,
-1.586064, 1.328717, -0.4963204, 1, 0.4078431, 0, 1,
-1.581279, 0.8880965, -1.588045, 1, 0.4156863, 0, 1,
-1.575369, -1.088786, 0.0860898, 1, 0.4196078, 0, 1,
-1.558928, -0.7100658, -1.461032, 1, 0.427451, 0, 1,
-1.558635, -0.4813519, -4.128646, 1, 0.4313726, 0, 1,
-1.542279, 1.151282, -2.020798, 1, 0.4392157, 0, 1,
-1.535196, -0.8576282, -2.020425, 1, 0.4431373, 0, 1,
-1.529038, -1.142414, -2.28104, 1, 0.4509804, 0, 1,
-1.517829, 1.661492, -0.6296897, 1, 0.454902, 0, 1,
-1.489277, -0.4437971, -3.909022, 1, 0.4627451, 0, 1,
-1.487496, 0.03339573, -0.9962655, 1, 0.4666667, 0, 1,
-1.484962, -0.971131, -2.08096, 1, 0.4745098, 0, 1,
-1.4759, 0.9260441, -1.386081, 1, 0.4784314, 0, 1,
-1.462827, 0.8190557, -1.562345, 1, 0.4862745, 0, 1,
-1.462589, 0.2737052, -1.578374, 1, 0.4901961, 0, 1,
-1.457605, -1.10114, -2.278691, 1, 0.4980392, 0, 1,
-1.455893, -0.1840315, -3.233604, 1, 0.5058824, 0, 1,
-1.450235, -0.5421466, -1.426837, 1, 0.509804, 0, 1,
-1.436733, 0.2018989, -1.075241, 1, 0.5176471, 0, 1,
-1.434845, -1.482466, -1.513003, 1, 0.5215687, 0, 1,
-1.422998, -0.06745835, -0.9992481, 1, 0.5294118, 0, 1,
-1.390794, -1.245124, -1.601131, 1, 0.5333334, 0, 1,
-1.384397, -0.8857679, -2.47491, 1, 0.5411765, 0, 1,
-1.381542, 0.4527698, -1.785349, 1, 0.5450981, 0, 1,
-1.375694, -2.059345, -4.446586, 1, 0.5529412, 0, 1,
-1.372744, -0.6560834, -2.034105, 1, 0.5568628, 0, 1,
-1.352767, -1.852794, -2.848145, 1, 0.5647059, 0, 1,
-1.351474, 0.5371529, -0.08220046, 1, 0.5686275, 0, 1,
-1.347675, 0.05729776, -0.8964627, 1, 0.5764706, 0, 1,
-1.322376, -0.5194802, -2.479203, 1, 0.5803922, 0, 1,
-1.311158, -1.749948, -0.3449892, 1, 0.5882353, 0, 1,
-1.307432, 0.5591556, -1.21062, 1, 0.5921569, 0, 1,
-1.306949, 1.87737, -2.224159, 1, 0.6, 0, 1,
-1.289695, 1.844812, 0.9925697, 1, 0.6078432, 0, 1,
-1.283263, -2.081993, -3.634997, 1, 0.6117647, 0, 1,
-1.281285, -1.136888, -2.253401, 1, 0.6196079, 0, 1,
-1.279484, 0.8247851, -0.787493, 1, 0.6235294, 0, 1,
-1.26709, -1.124198, -1.146429, 1, 0.6313726, 0, 1,
-1.249838, -0.8234327, -1.234525, 1, 0.6352941, 0, 1,
-1.247376, 0.3781887, -2.318491, 1, 0.6431373, 0, 1,
-1.246936, 1.132338, -0.330989, 1, 0.6470588, 0, 1,
-1.238634, -0.6399454, -2.206264, 1, 0.654902, 0, 1,
-1.233559, 1.866144, -0.1308229, 1, 0.6588235, 0, 1,
-1.223645, 1.046169, -1.063163, 1, 0.6666667, 0, 1,
-1.221497, 1.308395, 0.03034287, 1, 0.6705883, 0, 1,
-1.212179, 0.5574861, -1.419164, 1, 0.6784314, 0, 1,
-1.211803, 0.4088821, -1.161671, 1, 0.682353, 0, 1,
-1.200146, 0.1752361, -2.597857, 1, 0.6901961, 0, 1,
-1.198171, -0.5377246, -2.427606, 1, 0.6941177, 0, 1,
-1.196617, -1.546604, -1.233234, 1, 0.7019608, 0, 1,
-1.195415, 0.799967, -2.215466, 1, 0.7098039, 0, 1,
-1.190214, 0.7207216, -1.045112, 1, 0.7137255, 0, 1,
-1.189665, 0.724218, -2.066043, 1, 0.7215686, 0, 1,
-1.184542, -1.952484, -2.64004, 1, 0.7254902, 0, 1,
-1.181729, -0.1465116, 0.5741954, 1, 0.7333333, 0, 1,
-1.176664, 0.1640579, -2.075526, 1, 0.7372549, 0, 1,
-1.176554, -2.126269, -1.97448, 1, 0.7450981, 0, 1,
-1.16831, -0.6496078, -1.74622, 1, 0.7490196, 0, 1,
-1.164428, -1.258353, -1.746232, 1, 0.7568628, 0, 1,
-1.162479, 1.359936, -0.8667701, 1, 0.7607843, 0, 1,
-1.161965, 1.246684, 0.1160419, 1, 0.7686275, 0, 1,
-1.159282, 1.488236, -0.4238489, 1, 0.772549, 0, 1,
-1.158596, 0.01863029, -2.28356, 1, 0.7803922, 0, 1,
-1.147939, 0.08843822, -1.279789, 1, 0.7843137, 0, 1,
-1.146735, -1.263588, -3.130016, 1, 0.7921569, 0, 1,
-1.145377, -0.1803018, -2.078362, 1, 0.7960784, 0, 1,
-1.143619, -0.07331222, -1.964531, 1, 0.8039216, 0, 1,
-1.125023, -1.365121, -4.928942, 1, 0.8117647, 0, 1,
-1.122468, 0.8215294, 0.3821107, 1, 0.8156863, 0, 1,
-1.120664, -0.5445166, -0.5713693, 1, 0.8235294, 0, 1,
-1.11157, 0.07253618, -0.1504445, 1, 0.827451, 0, 1,
-1.108446, 2.206672, -0.6785929, 1, 0.8352941, 0, 1,
-1.094467, 0.3206322, -1.417205, 1, 0.8392157, 0, 1,
-1.079492, -0.8407916, -2.559674, 1, 0.8470588, 0, 1,
-1.078005, -2.241638, -2.620576, 1, 0.8509804, 0, 1,
-1.073903, 0.6758668, -1.849161, 1, 0.8588235, 0, 1,
-1.071927, 2.255949, 0.9939525, 1, 0.8627451, 0, 1,
-1.07145, -0.8835129, -4.348399, 1, 0.8705882, 0, 1,
-1.061174, 0.4804357, 0.8219963, 1, 0.8745098, 0, 1,
-1.056922, -0.150603, -2.055093, 1, 0.8823529, 0, 1,
-1.045788, 1.134848, -1.904175, 1, 0.8862745, 0, 1,
-1.035448, -1.518442, -2.261495, 1, 0.8941177, 0, 1,
-1.035029, -0.2516007, 0.3490678, 1, 0.8980392, 0, 1,
-1.030922, -0.5213708, -2.191848, 1, 0.9058824, 0, 1,
-1.03046, -1.390773, -1.893183, 1, 0.9137255, 0, 1,
-1.030437, -0.5270482, -1.472795, 1, 0.9176471, 0, 1,
-1.029524, 0.9389309, 2.017691, 1, 0.9254902, 0, 1,
-1.024241, -0.1600669, -2.681434, 1, 0.9294118, 0, 1,
-1.012417, -0.03673036, -1.86201, 1, 0.9372549, 0, 1,
-1.006575, -0.2814044, -2.735193, 1, 0.9411765, 0, 1,
-0.9996301, 1.750749, -1.092062, 1, 0.9490196, 0, 1,
-0.9902562, -0.8246832, -2.181524, 1, 0.9529412, 0, 1,
-0.9896108, 0.4682682, -1.120699, 1, 0.9607843, 0, 1,
-0.9889007, -2.453384, -4.17785, 1, 0.9647059, 0, 1,
-0.986255, 0.7666188, 0.485717, 1, 0.972549, 0, 1,
-0.984646, 0.6511804, -2.194982, 1, 0.9764706, 0, 1,
-0.9825533, 0.1622774, -0.8202736, 1, 0.9843137, 0, 1,
-0.9767415, -0.764147, -2.500221, 1, 0.9882353, 0, 1,
-0.9752015, -0.2351633, -1.730508, 1, 0.9960784, 0, 1,
-0.9748286, 0.1300662, 1.103051, 0.9960784, 1, 0, 1,
-0.9725487, 0.1170991, -1.653523, 0.9921569, 1, 0, 1,
-0.9676721, -0.2374251, -2.118915, 0.9843137, 1, 0, 1,
-0.9603719, 1.59913, -0.579125, 0.9803922, 1, 0, 1,
-0.947428, 0.8450216, -0.7109855, 0.972549, 1, 0, 1,
-0.9447384, -0.03748376, -0.9828677, 0.9686275, 1, 0, 1,
-0.9377394, -1.003259, -4.790192, 0.9607843, 1, 0, 1,
-0.9333523, 1.163778, -0.389605, 0.9568627, 1, 0, 1,
-0.9327182, 0.6484256, -1.704427, 0.9490196, 1, 0, 1,
-0.9302858, 1.015847, -1.529678, 0.945098, 1, 0, 1,
-0.9301916, 0.234793, -1.367437, 0.9372549, 1, 0, 1,
-0.9246303, -1.692097, -3.725283, 0.9333333, 1, 0, 1,
-0.9233811, -0.7901898, -1.779675, 0.9254902, 1, 0, 1,
-0.9219204, 0.4151766, -1.366026, 0.9215686, 1, 0, 1,
-0.91878, 0.03240529, -2.406568, 0.9137255, 1, 0, 1,
-0.9129985, -0.9720075, -2.652162, 0.9098039, 1, 0, 1,
-0.9089136, 0.3327654, 0.02444762, 0.9019608, 1, 0, 1,
-0.9062047, -1.777063, -2.271873, 0.8941177, 1, 0, 1,
-0.905489, 0.9472526, -0.1366345, 0.8901961, 1, 0, 1,
-0.9025776, -1.840108, -0.5000055, 0.8823529, 1, 0, 1,
-0.8972769, -0.06804688, -0.08503094, 0.8784314, 1, 0, 1,
-0.8894368, -0.4194872, -0.1601752, 0.8705882, 1, 0, 1,
-0.8890351, -1.033661, -2.275926, 0.8666667, 1, 0, 1,
-0.8862089, -1.443526, -3.366346, 0.8588235, 1, 0, 1,
-0.8853743, 0.2357977, -1.908068, 0.854902, 1, 0, 1,
-0.8816441, 1.931169, -1.021669, 0.8470588, 1, 0, 1,
-0.8796729, -0.6146826, -1.624788, 0.8431373, 1, 0, 1,
-0.8760858, 0.8711804, -1.19834, 0.8352941, 1, 0, 1,
-0.8698447, 1.29743, -2.219304, 0.8313726, 1, 0, 1,
-0.8650235, -0.8495439, -2.662898, 0.8235294, 1, 0, 1,
-0.8540531, -2.400601, -1.448688, 0.8196079, 1, 0, 1,
-0.847941, 2.420609, 0.1093922, 0.8117647, 1, 0, 1,
-0.8442952, -0.08695035, -0.3668422, 0.8078431, 1, 0, 1,
-0.8341194, -0.02732919, 0.3466044, 0.8, 1, 0, 1,
-0.8331544, 0.2855826, -1.651243, 0.7921569, 1, 0, 1,
-0.8311864, 0.3827158, 0.1138964, 0.7882353, 1, 0, 1,
-0.8301308, -0.3440879, -1.627409, 0.7803922, 1, 0, 1,
-0.8299106, -1.306935, -2.010287, 0.7764706, 1, 0, 1,
-0.8222893, -2.511677, -3.059248, 0.7686275, 1, 0, 1,
-0.8219868, 0.1404468, -3.410059, 0.7647059, 1, 0, 1,
-0.8206856, -0.7356176, -1.791248, 0.7568628, 1, 0, 1,
-0.8150904, 2.209566, 0.6409924, 0.7529412, 1, 0, 1,
-0.8120973, 0.7083518, -0.6697386, 0.7450981, 1, 0, 1,
-0.8098961, 0.1814057, -2.425656, 0.7411765, 1, 0, 1,
-0.8082238, -1.05813, -2.519944, 0.7333333, 1, 0, 1,
-0.7918048, -0.1610886, -1.361852, 0.7294118, 1, 0, 1,
-0.786429, 0.6017709, -0.5766006, 0.7215686, 1, 0, 1,
-0.7844732, -0.2743707, -0.2086869, 0.7176471, 1, 0, 1,
-0.7814618, -0.221946, -1.896501, 0.7098039, 1, 0, 1,
-0.77813, 1.469554, -0.174487, 0.7058824, 1, 0, 1,
-0.7724941, -0.07277002, -1.909325, 0.6980392, 1, 0, 1,
-0.7707619, 0.8293903, 0.2989472, 0.6901961, 1, 0, 1,
-0.7705282, 0.3464819, -0.5205697, 0.6862745, 1, 0, 1,
-0.7700595, -0.2050775, -4.658271, 0.6784314, 1, 0, 1,
-0.7668409, 0.4049402, -0.2092183, 0.6745098, 1, 0, 1,
-0.7644743, 1.247993, -1.574225, 0.6666667, 1, 0, 1,
-0.7613319, 0.9655567, -1.395494, 0.6627451, 1, 0, 1,
-0.759185, 0.3434837, -3.290048, 0.654902, 1, 0, 1,
-0.7587414, -1.602248, -2.017427, 0.6509804, 1, 0, 1,
-0.7559959, 0.2432851, -2.3802, 0.6431373, 1, 0, 1,
-0.7527056, 0.1056888, -2.166402, 0.6392157, 1, 0, 1,
-0.7526469, -1.753081, -4.371266, 0.6313726, 1, 0, 1,
-0.7475394, 0.2519127, -0.1398236, 0.627451, 1, 0, 1,
-0.7462294, 0.2885585, -1.898065, 0.6196079, 1, 0, 1,
-0.7461907, -0.1713879, -2.513853, 0.6156863, 1, 0, 1,
-0.739898, -0.6341285, -2.577745, 0.6078432, 1, 0, 1,
-0.735831, -0.1997102, -1.469477, 0.6039216, 1, 0, 1,
-0.7294685, -0.1377889, -2.675139, 0.5960785, 1, 0, 1,
-0.7261671, 1.480498, -0.4480716, 0.5882353, 1, 0, 1,
-0.7255998, 1.873149, 0.6271667, 0.5843138, 1, 0, 1,
-0.7254481, -1.733927, -2.083203, 0.5764706, 1, 0, 1,
-0.7146776, 0.03118703, -1.707408, 0.572549, 1, 0, 1,
-0.7137311, -1.016093, -2.061579, 0.5647059, 1, 0, 1,
-0.7110127, -0.5512372, -0.4802591, 0.5607843, 1, 0, 1,
-0.7082277, -0.2486735, 0.1702888, 0.5529412, 1, 0, 1,
-0.7074621, 0.7629706, -0.3293316, 0.5490196, 1, 0, 1,
-0.7057012, -1.176049, -2.265186, 0.5411765, 1, 0, 1,
-0.7032202, 1.231276, -0.3302285, 0.5372549, 1, 0, 1,
-0.6998917, -0.1182226, -0.3417477, 0.5294118, 1, 0, 1,
-0.6987342, 0.8162665, -1.255178, 0.5254902, 1, 0, 1,
-0.6895511, -0.2581146, -2.741285, 0.5176471, 1, 0, 1,
-0.6849825, -0.3403428, -2.781656, 0.5137255, 1, 0, 1,
-0.680428, -0.332276, -0.9796701, 0.5058824, 1, 0, 1,
-0.676338, -0.1630142, -1.34186, 0.5019608, 1, 0, 1,
-0.6716865, -0.1839863, -2.316251, 0.4941176, 1, 0, 1,
-0.669603, 0.4072044, -1.788839, 0.4862745, 1, 0, 1,
-0.6586452, -0.3630853, -0.4163002, 0.4823529, 1, 0, 1,
-0.6566619, 0.03767018, -2.887862, 0.4745098, 1, 0, 1,
-0.6549256, -0.119779, -1.882776, 0.4705882, 1, 0, 1,
-0.6473641, -0.511007, -1.655488, 0.4627451, 1, 0, 1,
-0.6461231, 0.06886646, -1.22613, 0.4588235, 1, 0, 1,
-0.6454844, -2.31887, -1.850577, 0.4509804, 1, 0, 1,
-0.6451477, -2.417045, -2.787704, 0.4470588, 1, 0, 1,
-0.6383703, 0.1483376, -2.301043, 0.4392157, 1, 0, 1,
-0.6351112, -0.4690911, -1.256871, 0.4352941, 1, 0, 1,
-0.6239998, 0.4337449, -1.367993, 0.427451, 1, 0, 1,
-0.6196721, -0.5330948, -1.896973, 0.4235294, 1, 0, 1,
-0.6166525, -1.480369, -5.847247, 0.4156863, 1, 0, 1,
-0.610934, 0.8690341, 0.3143958, 0.4117647, 1, 0, 1,
-0.6092575, 0.3899651, -0.168011, 0.4039216, 1, 0, 1,
-0.6070684, -0.1396359, -1.558705, 0.3960784, 1, 0, 1,
-0.6060093, 0.4330087, -2.296998, 0.3921569, 1, 0, 1,
-0.5973246, -1.390591, -1.66161, 0.3843137, 1, 0, 1,
-0.5961489, -0.202343, -0.7571484, 0.3803922, 1, 0, 1,
-0.5888066, -1.073626, -2.764369, 0.372549, 1, 0, 1,
-0.5857706, -0.7972706, -2.022138, 0.3686275, 1, 0, 1,
-0.5841035, 1.108477, -0.7610543, 0.3607843, 1, 0, 1,
-0.5839002, 0.5445413, -0.7752725, 0.3568628, 1, 0, 1,
-0.5806752, -0.8467185, -2.061924, 0.3490196, 1, 0, 1,
-0.5678788, 0.2880079, -1.375513, 0.345098, 1, 0, 1,
-0.5659955, 1.317352, -1.472916, 0.3372549, 1, 0, 1,
-0.5653054, -0.2613979, -3.653036, 0.3333333, 1, 0, 1,
-0.5649957, -0.7855004, -3.374796, 0.3254902, 1, 0, 1,
-0.5505995, -0.621654, -0.7791304, 0.3215686, 1, 0, 1,
-0.5503274, 0.8111197, -1.85991, 0.3137255, 1, 0, 1,
-0.5452813, 0.9007419, 0.7911634, 0.3098039, 1, 0, 1,
-0.5398685, -1.112341, -2.792866, 0.3019608, 1, 0, 1,
-0.5377425, 1.028454, -0.6647441, 0.2941177, 1, 0, 1,
-0.536229, 0.9728066, -0.8693209, 0.2901961, 1, 0, 1,
-0.5325958, -0.199906, -2.225147, 0.282353, 1, 0, 1,
-0.5286506, -0.5112787, -3.012542, 0.2784314, 1, 0, 1,
-0.5258309, -0.4110697, -0.5226579, 0.2705882, 1, 0, 1,
-0.5233526, 0.7070158, -1.245755, 0.2666667, 1, 0, 1,
-0.5204058, 1.444081, 0.3402219, 0.2588235, 1, 0, 1,
-0.5199333, -0.09583637, -2.405103, 0.254902, 1, 0, 1,
-0.5156718, -0.6162272, -2.080961, 0.2470588, 1, 0, 1,
-0.5115683, -0.2575466, -1.882608, 0.2431373, 1, 0, 1,
-0.51128, -0.9368579, -1.601712, 0.2352941, 1, 0, 1,
-0.5094665, -0.3029698, -3.210068, 0.2313726, 1, 0, 1,
-0.5078558, -0.7622154, -2.715575, 0.2235294, 1, 0, 1,
-0.5063725, 0.3757847, -0.520588, 0.2196078, 1, 0, 1,
-0.5058806, 1.752751, -0.8212369, 0.2117647, 1, 0, 1,
-0.5057366, -1.748871, -4.247524, 0.2078431, 1, 0, 1,
-0.5006847, 0.7201813, -0.7617355, 0.2, 1, 0, 1,
-0.4985919, 0.1464153, -3.363033, 0.1921569, 1, 0, 1,
-0.4969689, -1.132941, -4.483687, 0.1882353, 1, 0, 1,
-0.4951448, 0.5811708, -0.7318522, 0.1803922, 1, 0, 1,
-0.4920895, 0.2983412, 0.289656, 0.1764706, 1, 0, 1,
-0.4916688, -0.4150233, -0.3628137, 0.1686275, 1, 0, 1,
-0.4909155, -0.04673935, -2.259747, 0.1647059, 1, 0, 1,
-0.4874902, -3.171638, -4.191631, 0.1568628, 1, 0, 1,
-0.4833463, -0.7804917, -2.118564, 0.1529412, 1, 0, 1,
-0.4805883, 1.197896, 0.9407598, 0.145098, 1, 0, 1,
-0.4801277, -0.4803549, -1.760554, 0.1411765, 1, 0, 1,
-0.4797998, 0.4257523, -2.306174, 0.1333333, 1, 0, 1,
-0.4760748, -0.8657656, -3.683708, 0.1294118, 1, 0, 1,
-0.470518, 0.1017178, -1.688605, 0.1215686, 1, 0, 1,
-0.4678643, -0.1753196, -2.865799, 0.1176471, 1, 0, 1,
-0.4669095, -0.7557703, -1.776259, 0.1098039, 1, 0, 1,
-0.4653771, -0.2822984, -2.824365, 0.1058824, 1, 0, 1,
-0.4633434, 1.050077, 0.1610302, 0.09803922, 1, 0, 1,
-0.4583799, 0.5122703, -0.9638801, 0.09019608, 1, 0, 1,
-0.456601, -1.042286, -4.435743, 0.08627451, 1, 0, 1,
-0.4550695, -0.5894734, -2.329339, 0.07843138, 1, 0, 1,
-0.4542442, 1.488954, -1.56982, 0.07450981, 1, 0, 1,
-0.4509814, 0.4564289, 0.649675, 0.06666667, 1, 0, 1,
-0.4459667, 0.8132214, -1.071746, 0.0627451, 1, 0, 1,
-0.4402968, 1.687418, 0.530386, 0.05490196, 1, 0, 1,
-0.435858, -0.8922611, -2.291277, 0.05098039, 1, 0, 1,
-0.4356371, -0.3615388, -3.132331, 0.04313726, 1, 0, 1,
-0.4321632, -0.193968, -1.854584, 0.03921569, 1, 0, 1,
-0.4290985, -0.06861736, -1.955828, 0.03137255, 1, 0, 1,
-0.4263567, 1.456636, 0.9157611, 0.02745098, 1, 0, 1,
-0.420568, -0.3624818, -3.431362, 0.01960784, 1, 0, 1,
-0.4191951, -0.1245726, -1.249038, 0.01568628, 1, 0, 1,
-0.4143052, -1.72929, -3.57537, 0.007843138, 1, 0, 1,
-0.4083889, 0.1358783, -2.467368, 0.003921569, 1, 0, 1,
-0.400373, 0.7670215, 0.2057282, 0, 1, 0.003921569, 1,
-0.398432, -0.1409435, -1.651062, 0, 1, 0.01176471, 1,
-0.3962638, 0.6493343, 0.3519319, 0, 1, 0.01568628, 1,
-0.3817608, 1.572322, -0.8202024, 0, 1, 0.02352941, 1,
-0.3804788, 0.8714759, -0.9981121, 0, 1, 0.02745098, 1,
-0.3778592, 0.3194864, -2.339643, 0, 1, 0.03529412, 1,
-0.3708094, 0.9844235, -0.6549864, 0, 1, 0.03921569, 1,
-0.3702736, 0.8149515, -0.09555694, 0, 1, 0.04705882, 1,
-0.3683868, 0.06547029, -2.205341, 0, 1, 0.05098039, 1,
-0.3583413, -1.171059, -4.036209, 0, 1, 0.05882353, 1,
-0.3563505, 1.46251, -0.7246918, 0, 1, 0.0627451, 1,
-0.3560263, -1.506068, -2.728867, 0, 1, 0.07058824, 1,
-0.3558629, -2.534688, -2.752605, 0, 1, 0.07450981, 1,
-0.3548169, 0.7110776, -1.167407, 0, 1, 0.08235294, 1,
-0.3521655, 0.001700538, -2.935325, 0, 1, 0.08627451, 1,
-0.3508824, -0.9036404, -3.739461, 0, 1, 0.09411765, 1,
-0.350254, 0.6683964, -1.202304, 0, 1, 0.1019608, 1,
-0.3474097, 1.663774, -0.7050797, 0, 1, 0.1058824, 1,
-0.3457177, -1.607725, -3.828648, 0, 1, 0.1137255, 1,
-0.3434613, -0.5502474, -2.738953, 0, 1, 0.1176471, 1,
-0.3406792, -0.4389148, -3.079846, 0, 1, 0.1254902, 1,
-0.3395343, 1.525141, -1.626449, 0, 1, 0.1294118, 1,
-0.3377875, -1.143331, -1.242422, 0, 1, 0.1372549, 1,
-0.3361976, -1.789164, -1.603083, 0, 1, 0.1411765, 1,
-0.3335861, 1.886427, -1.118478, 0, 1, 0.1490196, 1,
-0.3226498, 2.054541, -1.449531, 0, 1, 0.1529412, 1,
-0.3216245, 0.7955528, 0.05396945, 0, 1, 0.1607843, 1,
-0.3177682, 0.1841683, -1.124356, 0, 1, 0.1647059, 1,
-0.3165735, -0.07455972, -3.934108, 0, 1, 0.172549, 1,
-0.3165417, 0.06491692, -0.7828305, 0, 1, 0.1764706, 1,
-0.3149277, 0.1723479, -1.373576, 0, 1, 0.1843137, 1,
-0.3143925, 1.79232, 1.786667, 0, 1, 0.1882353, 1,
-0.3141062, 1.209056, -0.8143855, 0, 1, 0.1960784, 1,
-0.3029583, 0.461263, -0.7142438, 0, 1, 0.2039216, 1,
-0.2963164, 0.7743245, -2.334851, 0, 1, 0.2078431, 1,
-0.2926954, -0.564295, -3.475085, 0, 1, 0.2156863, 1,
-0.2909413, -0.5086113, -1.953565, 0, 1, 0.2196078, 1,
-0.289753, -0.9976668, -1.576756, 0, 1, 0.227451, 1,
-0.2828122, -2.418504, -2.030621, 0, 1, 0.2313726, 1,
-0.2821807, 1.667259, 0.08446709, 0, 1, 0.2392157, 1,
-0.2814882, -1.155196, -3.186212, 0, 1, 0.2431373, 1,
-0.280914, -1.663354, -1.806745, 0, 1, 0.2509804, 1,
-0.2794428, 0.9195408, -0.02419327, 0, 1, 0.254902, 1,
-0.2766702, -0.4930849, -2.287094, 0, 1, 0.2627451, 1,
-0.2742618, -0.1021334, -2.524632, 0, 1, 0.2666667, 1,
-0.2730709, -0.2848461, -3.982714, 0, 1, 0.2745098, 1,
-0.2711556, -1.077447, -2.265183, 0, 1, 0.2784314, 1,
-0.2694336, -1.379154, -1.973632, 0, 1, 0.2862745, 1,
-0.2658062, -0.4613663, -3.559656, 0, 1, 0.2901961, 1,
-0.2637683, 0.5275648, -1.292772, 0, 1, 0.2980392, 1,
-0.2605934, 0.3752627, 0.3512687, 0, 1, 0.3058824, 1,
-0.259172, -0.2437388, -3.505814, 0, 1, 0.3098039, 1,
-0.2587824, -0.2848603, -1.304367, 0, 1, 0.3176471, 1,
-0.2582349, 0.07765485, -2.145732, 0, 1, 0.3215686, 1,
-0.2554636, 0.3499369, -1.686692, 0, 1, 0.3294118, 1,
-0.2534394, 0.9939806, 0.3442254, 0, 1, 0.3333333, 1,
-0.2512098, 0.7524955, -1.323119, 0, 1, 0.3411765, 1,
-0.2499444, -2.354585, -1.092281, 0, 1, 0.345098, 1,
-0.2477913, 0.4581299, -0.9759793, 0, 1, 0.3529412, 1,
-0.2424904, 0.5513464, -0.9033297, 0, 1, 0.3568628, 1,
-0.2338222, -0.6088791, -2.816564, 0, 1, 0.3647059, 1,
-0.2320395, 0.2114596, -0.9763755, 0, 1, 0.3686275, 1,
-0.2294612, 1.396333, 0.3620376, 0, 1, 0.3764706, 1,
-0.2267561, 0.1859841, -0.3418617, 0, 1, 0.3803922, 1,
-0.2254653, 1.218938, -0.2985914, 0, 1, 0.3882353, 1,
-0.2207675, 0.2106115, -1.455293, 0, 1, 0.3921569, 1,
-0.2178925, 2.797749, 1.125362, 0, 1, 0.4, 1,
-0.2154966, -0.5964176, -2.960108, 0, 1, 0.4078431, 1,
-0.212311, 0.02560614, -4.840474, 0, 1, 0.4117647, 1,
-0.2118134, -0.9263597, -4.004445, 0, 1, 0.4196078, 1,
-0.2099582, -0.06342369, -2.457987, 0, 1, 0.4235294, 1,
-0.2063807, 1.02909, 0.6448442, 0, 1, 0.4313726, 1,
-0.2050135, -0.1194413, -1.687645, 0, 1, 0.4352941, 1,
-0.2045293, -0.2710786, -3.016407, 0, 1, 0.4431373, 1,
-0.2014551, -0.7581913, -1.865971, 0, 1, 0.4470588, 1,
-0.2013982, -0.1046758, -2.150422, 0, 1, 0.454902, 1,
-0.1964878, 0.7001495, -0.8604918, 0, 1, 0.4588235, 1,
-0.1962978, 0.6767953, -0.6619805, 0, 1, 0.4666667, 1,
-0.1872785, 1.064453, -2.068807, 0, 1, 0.4705882, 1,
-0.185413, 1.668066, -0.07660379, 0, 1, 0.4784314, 1,
-0.1842433, -1.036738, -3.456795, 0, 1, 0.4823529, 1,
-0.1828054, -0.4927454, -0.254122, 0, 1, 0.4901961, 1,
-0.1767909, -1.923818, -2.667482, 0, 1, 0.4941176, 1,
-0.1751118, -0.09224653, -1.554938, 0, 1, 0.5019608, 1,
-0.1702714, 0.4414723, -0.4761293, 0, 1, 0.509804, 1,
-0.1677734, -0.9609471, -1.229922, 0, 1, 0.5137255, 1,
-0.1648596, -0.7466602, -2.846367, 0, 1, 0.5215687, 1,
-0.1630423, -0.3845283, -3.256405, 0, 1, 0.5254902, 1,
-0.1610757, 1.52469, -0.497953, 0, 1, 0.5333334, 1,
-0.1606672, -0.3090347, -2.345514, 0, 1, 0.5372549, 1,
-0.1604925, -0.5245658, -2.485155, 0, 1, 0.5450981, 1,
-0.1604036, 1.787119, 0.03285976, 0, 1, 0.5490196, 1,
-0.1598705, 1.089919, -0.2815544, 0, 1, 0.5568628, 1,
-0.1578428, -1.072168, -3.276227, 0, 1, 0.5607843, 1,
-0.1565899, 0.08473657, 1.224976, 0, 1, 0.5686275, 1,
-0.1562136, 3.196207, -0.3187553, 0, 1, 0.572549, 1,
-0.151889, 1.527657, -0.1754281, 0, 1, 0.5803922, 1,
-0.1427477, 0.08537216, -1.650884, 0, 1, 0.5843138, 1,
-0.141968, 1.042952, -0.238732, 0, 1, 0.5921569, 1,
-0.1372709, -0.790647, -1.621966, 0, 1, 0.5960785, 1,
-0.1369441, -0.4371038, -3.070751, 0, 1, 0.6039216, 1,
-0.1323926, -1.217911, -4.076239, 0, 1, 0.6117647, 1,
-0.1313463, -0.7973974, -4.72479, 0, 1, 0.6156863, 1,
-0.1301166, -0.2429625, -1.120735, 0, 1, 0.6235294, 1,
-0.1280587, -2.416075, -3.349951, 0, 1, 0.627451, 1,
-0.1230433, -1.090944, -2.943724, 0, 1, 0.6352941, 1,
-0.1140647, -0.1207111, -3.123046, 0, 1, 0.6392157, 1,
-0.1132147, 2.214725, 0.0953269, 0, 1, 0.6470588, 1,
-0.1130648, 2.116202, -1.37986, 0, 1, 0.6509804, 1,
-0.111826, 1.065665, -0.2185137, 0, 1, 0.6588235, 1,
-0.1089189, 1.783115, -0.3163117, 0, 1, 0.6627451, 1,
-0.1071778, -0.4807377, -4.620444, 0, 1, 0.6705883, 1,
-0.1042749, 0.5350885, -0.3954971, 0, 1, 0.6745098, 1,
-0.1004485, 0.1490082, -0.5802903, 0, 1, 0.682353, 1,
-0.09838588, 1.461987, -1.374405, 0, 1, 0.6862745, 1,
-0.09430464, -0.1386128, -2.624765, 0, 1, 0.6941177, 1,
-0.09083302, -1.264594, -4.498153, 0, 1, 0.7019608, 1,
-0.08699118, -0.5576986, -3.002818, 0, 1, 0.7058824, 1,
-0.08272403, 0.4919587, -0.1721422, 0, 1, 0.7137255, 1,
-0.08143254, 0.8612819, 0.3205644, 0, 1, 0.7176471, 1,
-0.07741364, -0.1106683, -1.632634, 0, 1, 0.7254902, 1,
-0.07590931, 0.290258, -1.323892, 0, 1, 0.7294118, 1,
-0.07418887, -0.2603624, -2.219494, 0, 1, 0.7372549, 1,
-0.07233576, -0.7561979, -2.54538, 0, 1, 0.7411765, 1,
-0.07076611, -0.1462166, -3.653002, 0, 1, 0.7490196, 1,
-0.06409948, -0.05475064, -4.279386, 0, 1, 0.7529412, 1,
-0.05974423, -1.765949, -1.907812, 0, 1, 0.7607843, 1,
-0.0563681, -1.411974, -1.443294, 0, 1, 0.7647059, 1,
-0.05591678, -1.060715, -2.7604, 0, 1, 0.772549, 1,
-0.05059041, -0.3345452, -3.443624, 0, 1, 0.7764706, 1,
-0.04151208, -0.5919231, -3.844444, 0, 1, 0.7843137, 1,
-0.04127036, -1.440205, -2.522236, 0, 1, 0.7882353, 1,
-0.04039099, 0.9777123, 1.731949, 0, 1, 0.7960784, 1,
-0.03570474, -0.6761407, -4.987704, 0, 1, 0.8039216, 1,
-0.03539135, 0.6373019, 1.778306, 0, 1, 0.8078431, 1,
-0.03079136, -1.373773, -1.549655, 0, 1, 0.8156863, 1,
-0.02956609, -0.6187733, -1.759589, 0, 1, 0.8196079, 1,
-0.02769123, -0.007032868, 0.4562721, 0, 1, 0.827451, 1,
-0.02763665, 0.9916247, -0.9817454, 0, 1, 0.8313726, 1,
-0.02702213, 0.1661926, -1.487914, 0, 1, 0.8392157, 1,
-0.0263753, -0.5601877, -1.53063, 0, 1, 0.8431373, 1,
-0.02531106, 0.08663307, 1.094204, 0, 1, 0.8509804, 1,
-0.01937671, 0.4898348, 0.4971865, 0, 1, 0.854902, 1,
-0.01698948, 0.7778748, -0.5803068, 0, 1, 0.8627451, 1,
-0.01420383, -0.3946092, -3.904979, 0, 1, 0.8666667, 1,
-0.01320136, 0.9732901, 1.193478, 0, 1, 0.8745098, 1,
-0.01309468, 0.4578624, -0.7639786, 0, 1, 0.8784314, 1,
-0.0125506, 0.06890053, -0.5318804, 0, 1, 0.8862745, 1,
-0.008862031, 0.9954165, -1.020371, 0, 1, 0.8901961, 1,
-0.008377964, 1.162797, 0.7044596, 0, 1, 0.8980392, 1,
-0.006494536, 0.3668966, -1.283057, 0, 1, 0.9058824, 1,
-0.005024506, 0.1596487, 2.333365, 0, 1, 0.9098039, 1,
0.003202791, -0.00376478, 0.9974859, 0, 1, 0.9176471, 1,
0.008670158, 0.5731021, -0.9250515, 0, 1, 0.9215686, 1,
0.01581108, -1.062349, 2.503144, 0, 1, 0.9294118, 1,
0.02282357, 1.21537, 0.08223554, 0, 1, 0.9333333, 1,
0.02392258, -2.063863, 4.397268, 0, 1, 0.9411765, 1,
0.02484879, -1.428118, 3.028994, 0, 1, 0.945098, 1,
0.02612295, 0.1144348, 0.9692772, 0, 1, 0.9529412, 1,
0.0273745, 0.7463256, 1.710316, 0, 1, 0.9568627, 1,
0.02922957, -0.812993, 4.160486, 0, 1, 0.9647059, 1,
0.03009309, 1.281089, -0.6351119, 0, 1, 0.9686275, 1,
0.03121822, -1.568773, 3.655116, 0, 1, 0.9764706, 1,
0.03622943, 0.8152242, -0.7992611, 0, 1, 0.9803922, 1,
0.03726405, 0.2548873, -1.534428, 0, 1, 0.9882353, 1,
0.03948617, -0.342148, 2.649506, 0, 1, 0.9921569, 1,
0.03983221, 0.007935552, 0.4195678, 0, 1, 1, 1,
0.04493515, -0.1737908, 3.142298, 0, 0.9921569, 1, 1,
0.04875878, 1.810079, -0.9588083, 0, 0.9882353, 1, 1,
0.05342622, -1.141128, 3.309418, 0, 0.9803922, 1, 1,
0.05373288, 0.1500161, 0.526997, 0, 0.9764706, 1, 1,
0.05581945, 1.344137, -0.4007367, 0, 0.9686275, 1, 1,
0.05648063, 0.5508233, -0.3360404, 0, 0.9647059, 1, 1,
0.05808958, -1.006428, 1.578808, 0, 0.9568627, 1, 1,
0.06224331, -1.480899, 3.1091, 0, 0.9529412, 1, 1,
0.06986728, 0.851919, 0.4377698, 0, 0.945098, 1, 1,
0.07120858, 1.031607, -0.881005, 0, 0.9411765, 1, 1,
0.0730269, 0.7251079, -0.3577591, 0, 0.9333333, 1, 1,
0.07401356, 0.06270657, 0.4059676, 0, 0.9294118, 1, 1,
0.07692126, -0.7046256, 0.5037515, 0, 0.9215686, 1, 1,
0.07765864, 0.4826358, -0.03691889, 0, 0.9176471, 1, 1,
0.07947688, -0.5639518, 4.117173, 0, 0.9098039, 1, 1,
0.08036239, 0.05323804, 0.3473701, 0, 0.9058824, 1, 1,
0.08215908, 1.708963, 0.9256965, 0, 0.8980392, 1, 1,
0.08544838, -1.250318, 2.03768, 0, 0.8901961, 1, 1,
0.08587693, 0.7553104, -0.8231291, 0, 0.8862745, 1, 1,
0.08941031, -1.026752, 4.949928, 0, 0.8784314, 1, 1,
0.09190585, 0.05012614, 1.111229, 0, 0.8745098, 1, 1,
0.09239725, -1.023302, 3.572872, 0, 0.8666667, 1, 1,
0.09358542, -0.1001248, 2.446469, 0, 0.8627451, 1, 1,
0.09373403, -1.160464, 4.125898, 0, 0.854902, 1, 1,
0.0992858, 0.5394377, -1.015746, 0, 0.8509804, 1, 1,
0.0997392, -0.4991088, 2.039284, 0, 0.8431373, 1, 1,
0.1005793, 0.5590358, -0.6498585, 0, 0.8392157, 1, 1,
0.1007073, 0.583043, 0.1292508, 0, 0.8313726, 1, 1,
0.1018262, -0.698844, 3.023018, 0, 0.827451, 1, 1,
0.1043919, 0.351174, -0.8173796, 0, 0.8196079, 1, 1,
0.1059996, -1.160653, 3.801211, 0, 0.8156863, 1, 1,
0.1066332, -1.827074, 2.889702, 0, 0.8078431, 1, 1,
0.1096668, 0.6312288, -0.3266954, 0, 0.8039216, 1, 1,
0.1098158, -1.374215, 2.130124, 0, 0.7960784, 1, 1,
0.1118258, 0.7401371, 0.7868083, 0, 0.7882353, 1, 1,
0.1121607, -0.4126625, 3.128497, 0, 0.7843137, 1, 1,
0.1132745, -1.002336, 3.377454, 0, 0.7764706, 1, 1,
0.1138292, -0.3793239, 2.593147, 0, 0.772549, 1, 1,
0.1143716, 0.9288104, -0.2378823, 0, 0.7647059, 1, 1,
0.1258428, -1.998395, 1.833719, 0, 0.7607843, 1, 1,
0.128604, -0.4483928, 2.456986, 0, 0.7529412, 1, 1,
0.1309929, 1.306746, 1.683042, 0, 0.7490196, 1, 1,
0.1353522, 0.3412092, 0.7638771, 0, 0.7411765, 1, 1,
0.1399975, -0.725099, 2.925906, 0, 0.7372549, 1, 1,
0.1426737, -0.7900261, 2.481812, 0, 0.7294118, 1, 1,
0.1492767, 0.3187633, -0.7339879, 0, 0.7254902, 1, 1,
0.1496122, -0.4991874, 1.137847, 0, 0.7176471, 1, 1,
0.1520244, -0.3074827, 2.865075, 0, 0.7137255, 1, 1,
0.1534717, -0.714074, 4.685534, 0, 0.7058824, 1, 1,
0.1537703, -0.477746, 4.360174, 0, 0.6980392, 1, 1,
0.1553922, -0.5411123, 1.61116, 0, 0.6941177, 1, 1,
0.1566007, -0.0909785, 0.8437993, 0, 0.6862745, 1, 1,
0.1568477, -0.3811575, 1.481194, 0, 0.682353, 1, 1,
0.15956, 0.3998349, 0.2298734, 0, 0.6745098, 1, 1,
0.1601224, -0.02949435, 3.603636, 0, 0.6705883, 1, 1,
0.1604999, 0.7960987, 0.02045494, 0, 0.6627451, 1, 1,
0.1630751, -0.004162292, 1.490276, 0, 0.6588235, 1, 1,
0.1642619, 0.6757769, 0.3944834, 0, 0.6509804, 1, 1,
0.164582, -1.148417, 2.97848, 0, 0.6470588, 1, 1,
0.1653062, -0.7832034, 2.791826, 0, 0.6392157, 1, 1,
0.1667337, 0.5358067, -0.5771188, 0, 0.6352941, 1, 1,
0.1672457, -0.3086509, 5.255577, 0, 0.627451, 1, 1,
0.1712732, -1.496362, 2.73463, 0, 0.6235294, 1, 1,
0.1733357, 1.186379, 1.282056, 0, 0.6156863, 1, 1,
0.1740072, 0.9519968, 2.633286, 0, 0.6117647, 1, 1,
0.1750014, -0.3429604, 2.270198, 0, 0.6039216, 1, 1,
0.1750723, -0.3218077, 2.296005, 0, 0.5960785, 1, 1,
0.1790338, -1.964914, 2.468909, 0, 0.5921569, 1, 1,
0.185887, -1.531707, 2.99894, 0, 0.5843138, 1, 1,
0.1912272, 1.373932, 0.4315447, 0, 0.5803922, 1, 1,
0.1929617, -0.0922719, 2.804428, 0, 0.572549, 1, 1,
0.2005138, 0.8551404, 1.7664, 0, 0.5686275, 1, 1,
0.2011504, 0.7983882, 1.695306, 0, 0.5607843, 1, 1,
0.204517, -1.126339, 2.136927, 0, 0.5568628, 1, 1,
0.2110376, -0.463246, 1.756033, 0, 0.5490196, 1, 1,
0.211255, 0.3413525, 0.1843622, 0, 0.5450981, 1, 1,
0.2114359, -1.14965, 2.69104, 0, 0.5372549, 1, 1,
0.2131093, -0.03269821, 1.38596, 0, 0.5333334, 1, 1,
0.2180224, 0.7795628, 0.4454939, 0, 0.5254902, 1, 1,
0.2216525, -1.171077, 3.115479, 0, 0.5215687, 1, 1,
0.2227949, 0.2905889, 0.8424057, 0, 0.5137255, 1, 1,
0.2235634, -0.4405201, 1.545864, 0, 0.509804, 1, 1,
0.2260766, -0.6789582, 0.8213006, 0, 0.5019608, 1, 1,
0.2355861, -0.304238, 1.102482, 0, 0.4941176, 1, 1,
0.237539, 0.5108427, -0.543833, 0, 0.4901961, 1, 1,
0.2404719, -1.006334, 2.004806, 0, 0.4823529, 1, 1,
0.2425751, 0.2388763, 0.7856192, 0, 0.4784314, 1, 1,
0.2442448, 0.3826096, 0.6379418, 0, 0.4705882, 1, 1,
0.2467993, -0.9451627, 1.479927, 0, 0.4666667, 1, 1,
0.2480409, 1.439267, -0.5344678, 0, 0.4588235, 1, 1,
0.2500094, 1.645853, 1.35095, 0, 0.454902, 1, 1,
0.2511199, -0.7426339, 1.389391, 0, 0.4470588, 1, 1,
0.2539662, 1.023259, 0.8851533, 0, 0.4431373, 1, 1,
0.2550407, 0.9695873, -0.6757165, 0, 0.4352941, 1, 1,
0.2566834, 0.1911487, 0.5603425, 0, 0.4313726, 1, 1,
0.2571549, 0.7922532, -0.9621064, 0, 0.4235294, 1, 1,
0.2595101, 0.3084109, 1.189002, 0, 0.4196078, 1, 1,
0.2661344, 0.4361724, 1.236884, 0, 0.4117647, 1, 1,
0.2741276, 1.157694, -0.2237333, 0, 0.4078431, 1, 1,
0.2743891, -1.959748, 3.188051, 0, 0.4, 1, 1,
0.2758838, 1.00024, 0.1191198, 0, 0.3921569, 1, 1,
0.282727, -0.9531247, 3.419674, 0, 0.3882353, 1, 1,
0.2841068, -1.325141, 2.798288, 0, 0.3803922, 1, 1,
0.2867305, 0.1954256, 2.416233, 0, 0.3764706, 1, 1,
0.2892137, 1.40646, 0.8379769, 0, 0.3686275, 1, 1,
0.2897045, -0.5819264, 3.114385, 0, 0.3647059, 1, 1,
0.291032, -1.009042, 3.445966, 0, 0.3568628, 1, 1,
0.2919485, 0.1142888, 1.678108, 0, 0.3529412, 1, 1,
0.2945339, 0.8603032, 1.019964, 0, 0.345098, 1, 1,
0.2956421, -1.327121, 3.534065, 0, 0.3411765, 1, 1,
0.3010689, 0.6300222, -0.159742, 0, 0.3333333, 1, 1,
0.3053192, -0.4141464, 1.835549, 0, 0.3294118, 1, 1,
0.3057301, 1.046118, -1.734434, 0, 0.3215686, 1, 1,
0.3087769, 2.193625, 0.4929959, 0, 0.3176471, 1, 1,
0.3139078, 0.5174285, 1.42381, 0, 0.3098039, 1, 1,
0.3140105, 1.201613, 1.11253, 0, 0.3058824, 1, 1,
0.3141266, 0.3444081, 1.674521, 0, 0.2980392, 1, 1,
0.3181826, -0.524864, 2.976553, 0, 0.2901961, 1, 1,
0.3185601, -1.180897, 2.593724, 0, 0.2862745, 1, 1,
0.3200718, -0.7358531, 4.174016, 0, 0.2784314, 1, 1,
0.3226883, -0.2723106, 1.532928, 0, 0.2745098, 1, 1,
0.3284582, 1.106648, 1.437043, 0, 0.2666667, 1, 1,
0.3288243, 0.1550029, 0.1610223, 0, 0.2627451, 1, 1,
0.3299771, -0.243013, 2.908673, 0, 0.254902, 1, 1,
0.3334011, -1.530824, 1.401333, 0, 0.2509804, 1, 1,
0.3354845, -0.7924749, 3.659125, 0, 0.2431373, 1, 1,
0.3355012, -0.2628774, 0.01258032, 0, 0.2392157, 1, 1,
0.3366315, 0.624661, 0.3498115, 0, 0.2313726, 1, 1,
0.339373, -0.2049603, 1.938879, 0, 0.227451, 1, 1,
0.3400756, 0.9727079, -2.051471, 0, 0.2196078, 1, 1,
0.3429838, -1.505588, 1.395065, 0, 0.2156863, 1, 1,
0.3443692, -0.6333163, 1.525447, 0, 0.2078431, 1, 1,
0.3445412, -1.240735, 3.247485, 0, 0.2039216, 1, 1,
0.3513385, 0.02665819, 0.8225989, 0, 0.1960784, 1, 1,
0.3515059, -0.006850974, 1.245851, 0, 0.1882353, 1, 1,
0.3522819, 0.3330776, 0.7714061, 0, 0.1843137, 1, 1,
0.3523198, -0.7518445, 2.920811, 0, 0.1764706, 1, 1,
0.355463, -3.1236, 3.098507, 0, 0.172549, 1, 1,
0.3579944, 0.5803439, 1.582565, 0, 0.1647059, 1, 1,
0.3585807, -1.074314, 5.20954, 0, 0.1607843, 1, 1,
0.3600542, -0.6668314, 1.726508, 0, 0.1529412, 1, 1,
0.3626407, -0.2309925, 2.316741, 0, 0.1490196, 1, 1,
0.363888, -1.32181, 2.507038, 0, 0.1411765, 1, 1,
0.3648265, 1.788005, -0.3445326, 0, 0.1372549, 1, 1,
0.3689469, -1.607097, 1.77873, 0, 0.1294118, 1, 1,
0.3701521, -0.554037, 3.359703, 0, 0.1254902, 1, 1,
0.3759904, 0.3740664, 0.5777991, 0, 0.1176471, 1, 1,
0.3789087, 0.7182771, 2.327324, 0, 0.1137255, 1, 1,
0.3809238, -0.8073605, 5.427049, 0, 0.1058824, 1, 1,
0.3823071, -0.3336438, 2.071528, 0, 0.09803922, 1, 1,
0.384299, 1.014597, -1.762683, 0, 0.09411765, 1, 1,
0.3863627, 1.231176, 0.6850138, 0, 0.08627451, 1, 1,
0.3887103, 0.2925343, 2.246516, 0, 0.08235294, 1, 1,
0.3911576, -0.144162, 2.402513, 0, 0.07450981, 1, 1,
0.3985443, 0.6552116, -0.04877658, 0, 0.07058824, 1, 1,
0.4015633, -1.894989, 3.153871, 0, 0.0627451, 1, 1,
0.40256, -0.7335449, 1.091859, 0, 0.05882353, 1, 1,
0.4055906, 1.59218, -0.396027, 0, 0.05098039, 1, 1,
0.4065399, 0.1047081, -0.4834432, 0, 0.04705882, 1, 1,
0.4078356, -1.839877, 3.945892, 0, 0.03921569, 1, 1,
0.409013, 0.5842162, -0.04492121, 0, 0.03529412, 1, 1,
0.4102342, -1.378127, 1.850903, 0, 0.02745098, 1, 1,
0.4128091, 0.5746197, 1.177561, 0, 0.02352941, 1, 1,
0.4157018, -1.376691, 3.340459, 0, 0.01568628, 1, 1,
0.4168747, 1.380662, 0.1934002, 0, 0.01176471, 1, 1,
0.4171879, -1.723838, 3.484284, 0, 0.003921569, 1, 1,
0.4173544, 0.2483135, 1.265457, 0.003921569, 0, 1, 1,
0.4227687, -0.4350007, 2.731517, 0.007843138, 0, 1, 1,
0.4242213, 2.378718, 2.347918, 0.01568628, 0, 1, 1,
0.4264728, -0.1664367, 3.138191, 0.01960784, 0, 1, 1,
0.4295687, -1.059929, 2.632277, 0.02745098, 0, 1, 1,
0.4312505, -1.51694, 1.802951, 0.03137255, 0, 1, 1,
0.4317097, 0.250801, 1.188, 0.03921569, 0, 1, 1,
0.4331115, 1.544416, 0.8989345, 0.04313726, 0, 1, 1,
0.4339497, -0.4949738, 2.041406, 0.05098039, 0, 1, 1,
0.4383596, -1.042523, 3.934576, 0.05490196, 0, 1, 1,
0.4485336, 1.530843, 1.646708, 0.0627451, 0, 1, 1,
0.450893, -0.3609565, 1.746473, 0.06666667, 0, 1, 1,
0.4542953, 0.7785466, -0.2468818, 0.07450981, 0, 1, 1,
0.4587077, 1.499876, -0.656031, 0.07843138, 0, 1, 1,
0.467697, 0.1072803, 2.368222, 0.08627451, 0, 1, 1,
0.468653, -0.05999206, 0.685775, 0.09019608, 0, 1, 1,
0.4688881, 1.438937, 2.847987, 0.09803922, 0, 1, 1,
0.4695464, 1.201539, 0.6945489, 0.1058824, 0, 1, 1,
0.4699754, -1.785086, 2.567387, 0.1098039, 0, 1, 1,
0.4723858, -0.9010674, 2.863456, 0.1176471, 0, 1, 1,
0.4773003, 0.6358157, -0.209512, 0.1215686, 0, 1, 1,
0.4793733, -0.1773429, 0.445963, 0.1294118, 0, 1, 1,
0.4809663, 1.150268, -0.5160866, 0.1333333, 0, 1, 1,
0.4810612, -0.9693283, 1.821832, 0.1411765, 0, 1, 1,
0.4814678, 1.373274, 1.866054, 0.145098, 0, 1, 1,
0.4815434, -0.4539385, 2.00665, 0.1529412, 0, 1, 1,
0.4862109, -0.7682608, 2.111984, 0.1568628, 0, 1, 1,
0.4922074, 0.4037643, 1.178863, 0.1647059, 0, 1, 1,
0.4942143, 0.1341981, 0.647755, 0.1686275, 0, 1, 1,
0.498413, -1.083128, 4.111142, 0.1764706, 0, 1, 1,
0.5100498, -0.6061418, 0.3155783, 0.1803922, 0, 1, 1,
0.5119495, 0.1164371, 2.454038, 0.1882353, 0, 1, 1,
0.5146775, -0.6853892, 2.883422, 0.1921569, 0, 1, 1,
0.5169435, 0.5115576, 1.313098, 0.2, 0, 1, 1,
0.5179037, -1.586177, 3.836169, 0.2078431, 0, 1, 1,
0.5210142, -0.4093365, 1.614331, 0.2117647, 0, 1, 1,
0.521844, -0.7431187, 1.565088, 0.2196078, 0, 1, 1,
0.5218811, -0.8317366, 2.370426, 0.2235294, 0, 1, 1,
0.5226312, -2.217112, 3.1259, 0.2313726, 0, 1, 1,
0.5245714, -1.816493, 3.781743, 0.2352941, 0, 1, 1,
0.5250187, 0.9784872, 0.6777573, 0.2431373, 0, 1, 1,
0.5282564, -0.2557989, 3.632433, 0.2470588, 0, 1, 1,
0.5325606, 1.159822, -0.5706043, 0.254902, 0, 1, 1,
0.5368052, 0.2520669, 0.8792709, 0.2588235, 0, 1, 1,
0.5381785, 0.1303732, 1.669669, 0.2666667, 0, 1, 1,
0.538946, -0.0732568, 1.153636, 0.2705882, 0, 1, 1,
0.5416663, 0.5203577, 0.8710986, 0.2784314, 0, 1, 1,
0.5421453, 0.5114399, 2.488526, 0.282353, 0, 1, 1,
0.5441744, 1.711581, -0.07022362, 0.2901961, 0, 1, 1,
0.5451627, 0.8672326, 0.2596631, 0.2941177, 0, 1, 1,
0.5518433, 0.2385729, 2.033187, 0.3019608, 0, 1, 1,
0.5525335, -0.428821, 1.180161, 0.3098039, 0, 1, 1,
0.562821, 0.3235309, 0.2323674, 0.3137255, 0, 1, 1,
0.5630036, -2.154709, 3.00917, 0.3215686, 0, 1, 1,
0.5644699, -0.8419871, 0.2778117, 0.3254902, 0, 1, 1,
0.5653962, 0.2130549, 1.935941, 0.3333333, 0, 1, 1,
0.5722603, 0.0581802, 0.2076939, 0.3372549, 0, 1, 1,
0.5760303, -0.2125426, 1.702627, 0.345098, 0, 1, 1,
0.5769547, -1.471226, 4.959926, 0.3490196, 0, 1, 1,
0.5782635, -0.2893641, 1.991789, 0.3568628, 0, 1, 1,
0.5791634, 0.2484728, 2.500038, 0.3607843, 0, 1, 1,
0.5854324, 0.3545897, 0.01544437, 0.3686275, 0, 1, 1,
0.5893275, -1.424877, 2.488916, 0.372549, 0, 1, 1,
0.5921078, -1.177584, 2.83645, 0.3803922, 0, 1, 1,
0.5949737, -1.865562, 3.218163, 0.3843137, 0, 1, 1,
0.598032, 1.353817, 0.4511302, 0.3921569, 0, 1, 1,
0.6005406, -0.6629491, 0.8896133, 0.3960784, 0, 1, 1,
0.6023139, -0.1976979, 1.387323, 0.4039216, 0, 1, 1,
0.6037742, -1.139841, 3.616092, 0.4117647, 0, 1, 1,
0.612965, 0.6947562, 1.081865, 0.4156863, 0, 1, 1,
0.6165563, 1.081306, 0.2977462, 0.4235294, 0, 1, 1,
0.6190063, -0.5028495, 2.214769, 0.427451, 0, 1, 1,
0.6240787, 1.09514, 0.5395355, 0.4352941, 0, 1, 1,
0.6259819, 0.566522, 0.8188721, 0.4392157, 0, 1, 1,
0.6294397, 1.219543, -0.4939022, 0.4470588, 0, 1, 1,
0.6294738, 1.560212, 0.9682156, 0.4509804, 0, 1, 1,
0.6297656, -2.331496, 4.471272, 0.4588235, 0, 1, 1,
0.6300361, 0.9170447, -1.665465, 0.4627451, 0, 1, 1,
0.6339318, -0.0453836, 0.1545631, 0.4705882, 0, 1, 1,
0.6357592, -0.9187151, 3.807832, 0.4745098, 0, 1, 1,
0.6389091, 1.972413, 0.8860451, 0.4823529, 0, 1, 1,
0.6410047, -1.226504, 3.781151, 0.4862745, 0, 1, 1,
0.6435202, -0.2164915, 1.593267, 0.4941176, 0, 1, 1,
0.645426, 0.7545676, 1.971301, 0.5019608, 0, 1, 1,
0.6593146, 1.85295, -1.060992, 0.5058824, 0, 1, 1,
0.6593269, 0.5271837, 1.578974, 0.5137255, 0, 1, 1,
0.6619142, 1.479641, 1.854017, 0.5176471, 0, 1, 1,
0.6716779, 1.085667, 1.997318, 0.5254902, 0, 1, 1,
0.6733849, 2.049094, 0.4147284, 0.5294118, 0, 1, 1,
0.6763127, 0.588862, -0.3429007, 0.5372549, 0, 1, 1,
0.6768367, -2.236023, 4.839924, 0.5411765, 0, 1, 1,
0.6794238, 0.499959, 1.918929, 0.5490196, 0, 1, 1,
0.6869264, 0.2640506, 1.465637, 0.5529412, 0, 1, 1,
0.693682, 0.854976, 1.751363, 0.5607843, 0, 1, 1,
0.6940663, -1.156189, 1.986221, 0.5647059, 0, 1, 1,
0.6991529, -0.9301125, 0.8762329, 0.572549, 0, 1, 1,
0.7007706, 0.925086, 0.7476034, 0.5764706, 0, 1, 1,
0.7017026, 1.504658, 1.03791, 0.5843138, 0, 1, 1,
0.7068126, 0.2402831, 1.443973, 0.5882353, 0, 1, 1,
0.7068359, 0.1679682, 2.81211, 0.5960785, 0, 1, 1,
0.7079374, 1.00869, 0.03391352, 0.6039216, 0, 1, 1,
0.7174317, -1.108475, 3.280169, 0.6078432, 0, 1, 1,
0.7181738, 0.5865009, 1.035304, 0.6156863, 0, 1, 1,
0.7216049, 0.4266476, -1.1214, 0.6196079, 0, 1, 1,
0.7284368, -1.162485, 2.302021, 0.627451, 0, 1, 1,
0.7353332, -1.302694, 1.820925, 0.6313726, 0, 1, 1,
0.7396675, 1.018222, -1.112007, 0.6392157, 0, 1, 1,
0.7411388, 1.080621, -0.9940948, 0.6431373, 0, 1, 1,
0.7419085, -1.422587, 2.568882, 0.6509804, 0, 1, 1,
0.7424924, -1.713644, 4.322733, 0.654902, 0, 1, 1,
0.7426275, -1.364841, 3.209017, 0.6627451, 0, 1, 1,
0.7433312, 0.004349974, 1.48469, 0.6666667, 0, 1, 1,
0.7435788, 1.648719, 2.179819, 0.6745098, 0, 1, 1,
0.7438759, 1.237591, 0.5455051, 0.6784314, 0, 1, 1,
0.7489995, 0.1032816, -0.08291772, 0.6862745, 0, 1, 1,
0.7490606, -1.076395, 3.160573, 0.6901961, 0, 1, 1,
0.7505011, 0.5894816, 0.8311764, 0.6980392, 0, 1, 1,
0.7531778, -0.6199059, 3.505074, 0.7058824, 0, 1, 1,
0.7539406, -0.8431669, 3.041544, 0.7098039, 0, 1, 1,
0.7560806, 0.07634518, 2.459244, 0.7176471, 0, 1, 1,
0.7574329, 0.5757338, 1.668354, 0.7215686, 0, 1, 1,
0.7638939, 0.9381763, 0.1947428, 0.7294118, 0, 1, 1,
0.7655743, 0.3130157, 0.0009074281, 0.7333333, 0, 1, 1,
0.7695728, 0.8271589, -0.1824975, 0.7411765, 0, 1, 1,
0.7718818, 0.9239013, 1.084273, 0.7450981, 0, 1, 1,
0.7724485, -1.021503, 2.106341, 0.7529412, 0, 1, 1,
0.7769455, -7.798757e-05, 2.903177, 0.7568628, 0, 1, 1,
0.7783381, 1.15564, -0.1056923, 0.7647059, 0, 1, 1,
0.7789831, -1.147591, 2.851466, 0.7686275, 0, 1, 1,
0.7821297, -0.1603171, 2.419191, 0.7764706, 0, 1, 1,
0.7823258, 0.3158035, -0.1307152, 0.7803922, 0, 1, 1,
0.7830494, -1.96693, 2.529634, 0.7882353, 0, 1, 1,
0.7834568, 1.674823, 0.9035385, 0.7921569, 0, 1, 1,
0.7837864, 0.4995371, 2.235442, 0.8, 0, 1, 1,
0.784679, -0.6032974, 3.862122, 0.8078431, 0, 1, 1,
0.786567, 0.7087466, 2.435598, 0.8117647, 0, 1, 1,
0.7941277, -0.6315255, 1.408118, 0.8196079, 0, 1, 1,
0.8006162, -0.9042289, 2.716811, 0.8235294, 0, 1, 1,
0.8064086, -0.3238682, 0.4442304, 0.8313726, 0, 1, 1,
0.8111013, 1.216762, 1.318284, 0.8352941, 0, 1, 1,
0.8116413, -0.1977326, 2.081985, 0.8431373, 0, 1, 1,
0.8152714, -0.6502597, 1.018962, 0.8470588, 0, 1, 1,
0.8152802, 2.480604, 0.3032103, 0.854902, 0, 1, 1,
0.8233164, 2.332999, -1.129544, 0.8588235, 0, 1, 1,
0.8243155, -0.770241, 2.439504, 0.8666667, 0, 1, 1,
0.8310459, -0.3681922, 0.1744017, 0.8705882, 0, 1, 1,
0.8311635, 0.7198467, 1.170901, 0.8784314, 0, 1, 1,
0.8433123, -1.22598, 2.86811, 0.8823529, 0, 1, 1,
0.8448319, -0.09842789, 0.7617027, 0.8901961, 0, 1, 1,
0.8477779, 0.6857902, 0.8543868, 0.8941177, 0, 1, 1,
0.8479962, 1.815135, 1.177526, 0.9019608, 0, 1, 1,
0.8681908, -0.3154793, -0.0001611801, 0.9098039, 0, 1, 1,
0.8721657, -0.4018549, 2.300207, 0.9137255, 0, 1, 1,
0.8811244, 1.771716, 0.6128444, 0.9215686, 0, 1, 1,
0.8813248, -0.001340372, 2.041786, 0.9254902, 0, 1, 1,
0.8834347, 0.6567914, 2.331339, 0.9333333, 0, 1, 1,
0.8922843, 1.091786, 0.824531, 0.9372549, 0, 1, 1,
0.8989746, 2.594044, -0.3734021, 0.945098, 0, 1, 1,
0.9038627, 0.2683642, -0.1229078, 0.9490196, 0, 1, 1,
0.904878, 2.807195, -1.770267, 0.9568627, 0, 1, 1,
0.9106737, -0.03851813, 2.073831, 0.9607843, 0, 1, 1,
0.9107947, -0.3028682, 0.8492723, 0.9686275, 0, 1, 1,
0.9125839, -2.124892, 3.397908, 0.972549, 0, 1, 1,
0.9129554, -0.3644065, 1.365447, 0.9803922, 0, 1, 1,
0.922943, 1.959537, -0.06818178, 0.9843137, 0, 1, 1,
0.9346483, -0.6811035, 0.6010581, 0.9921569, 0, 1, 1,
0.9350953, -1.036448, 3.093522, 0.9960784, 0, 1, 1,
0.943596, 1.346884, 0.8400519, 1, 0, 0.9960784, 1,
0.950634, 0.3201939, -1.111705, 1, 0, 0.9882353, 1,
0.9519884, -1.085314, 1.116104, 1, 0, 0.9843137, 1,
0.9525247, -0.1258957, 1.79153, 1, 0, 0.9764706, 1,
0.9704821, -0.05133146, 2.261139, 1, 0, 0.972549, 1,
0.9722714, -1.06765, 1.369131, 1, 0, 0.9647059, 1,
0.974554, 0.5435688, -0.4179726, 1, 0, 0.9607843, 1,
0.9819696, -0.1158046, 1.229275, 1, 0, 0.9529412, 1,
0.9953367, 0.1288496, 1.944977, 1, 0, 0.9490196, 1,
0.9991075, -1.092477, 2.255323, 1, 0, 0.9411765, 1,
1.00142, -1.267839, 3.22478, 1, 0, 0.9372549, 1,
1.005356, 0.1148635, 1.204084, 1, 0, 0.9294118, 1,
1.006214, 1.071103, 1.218989, 1, 0, 0.9254902, 1,
1.011222, -1.171048, 1.62026, 1, 0, 0.9176471, 1,
1.011906, 1.121734, 0.4524323, 1, 0, 0.9137255, 1,
1.019324, -0.5880177, 0.9976984, 1, 0, 0.9058824, 1,
1.02132, -0.225866, -0.8565069, 1, 0, 0.9019608, 1,
1.026211, -0.941148, 0.6100059, 1, 0, 0.8941177, 1,
1.027955, 0.4991827, 0.06963889, 1, 0, 0.8862745, 1,
1.028762, -0.2784543, 3.262077, 1, 0, 0.8823529, 1,
1.038482, -1.028263, 4.836186, 1, 0, 0.8745098, 1,
1.042582, -1.035671, 2.218919, 1, 0, 0.8705882, 1,
1.044312, -0.8787417, 2.417777, 1, 0, 0.8627451, 1,
1.050391, -0.7781819, 2.27059, 1, 0, 0.8588235, 1,
1.051884, 1.550115, -1.360599, 1, 0, 0.8509804, 1,
1.053477, 0.8464754, 1.856039, 1, 0, 0.8470588, 1,
1.061734, -1.292884, 2.889184, 1, 0, 0.8392157, 1,
1.068766, 1.253645, 0.1627895, 1, 0, 0.8352941, 1,
1.072165, -0.5931925, 3.926865, 1, 0, 0.827451, 1,
1.077062, -0.2321992, 1.454707, 1, 0, 0.8235294, 1,
1.084004, -0.7714553, 2.681599, 1, 0, 0.8156863, 1,
1.08512, 0.295611, 1.888747, 1, 0, 0.8117647, 1,
1.085447, 1.723503, 0.1719373, 1, 0, 0.8039216, 1,
1.092747, 0.8627696, 0.4037478, 1, 0, 0.7960784, 1,
1.094409, 2.277751, -0.1733845, 1, 0, 0.7921569, 1,
1.095659, 0.849368, 0.9530932, 1, 0, 0.7843137, 1,
1.100745, -0.1406492, -0.9293478, 1, 0, 0.7803922, 1,
1.111589, -0.4790216, 0.4904034, 1, 0, 0.772549, 1,
1.11572, 0.1849878, 0.9882244, 1, 0, 0.7686275, 1,
1.129902, 0.1419171, 0.8990641, 1, 0, 0.7607843, 1,
1.133267, -1.859079, 1.862583, 1, 0, 0.7568628, 1,
1.137036, -0.3831835, 2.070834, 1, 0, 0.7490196, 1,
1.14808, 0.7302354, 0.1335278, 1, 0, 0.7450981, 1,
1.148479, -1.275436, 0.9625745, 1, 0, 0.7372549, 1,
1.149586, -1.42664, 1.169354, 1, 0, 0.7333333, 1,
1.152997, -0.2375235, 0.6161876, 1, 0, 0.7254902, 1,
1.161445, 1.45137, 0.9168192, 1, 0, 0.7215686, 1,
1.176915, -0.4992311, 2.525278, 1, 0, 0.7137255, 1,
1.180136, -1.634993, 3.74064, 1, 0, 0.7098039, 1,
1.180769, 2.350783, 0.5040809, 1, 0, 0.7019608, 1,
1.181633, 0.2959301, 3.461562, 1, 0, 0.6941177, 1,
1.187333, 0.206138, 2.218395, 1, 0, 0.6901961, 1,
1.189384, 0.5683255, 1.052572, 1, 0, 0.682353, 1,
1.198777, -2.221343, 0.8178869, 1, 0, 0.6784314, 1,
1.199974, -0.2966453, 2.905211, 1, 0, 0.6705883, 1,
1.200767, 2.206906, 1.108309, 1, 0, 0.6666667, 1,
1.20252, 0.6468138, 1.046721, 1, 0, 0.6588235, 1,
1.20552, -0.02833783, 1.898534, 1, 0, 0.654902, 1,
1.218743, 0.108634, 1.244356, 1, 0, 0.6470588, 1,
1.220934, 0.8921862, 0.1298681, 1, 0, 0.6431373, 1,
1.230783, 0.3687984, 2.01942, 1, 0, 0.6352941, 1,
1.232684, -0.4469761, 2.030884, 1, 0, 0.6313726, 1,
1.238746, 0.8255085, 1.086806, 1, 0, 0.6235294, 1,
1.243755, 0.885934, 2.399001, 1, 0, 0.6196079, 1,
1.246454, -0.396904, 0.4272016, 1, 0, 0.6117647, 1,
1.263853, -1.092635, 2.465729, 1, 0, 0.6078432, 1,
1.266016, -0.7598147, 2.437491, 1, 0, 0.6, 1,
1.269878, -0.517196, 2.405259, 1, 0, 0.5921569, 1,
1.2727, 1.19109, 1.835629, 1, 0, 0.5882353, 1,
1.276406, 1.251317, -0.8569473, 1, 0, 0.5803922, 1,
1.281802, 0.368686, -0.0255237, 1, 0, 0.5764706, 1,
1.286511, 0.4491581, 1.067537, 1, 0, 0.5686275, 1,
1.291089, 0.534825, -0.2443389, 1, 0, 0.5647059, 1,
1.297159, 0.287931, -0.09029207, 1, 0, 0.5568628, 1,
1.298012, 0.03019151, 1.618164, 1, 0, 0.5529412, 1,
1.300421, 1.160717, 0.6484958, 1, 0, 0.5450981, 1,
1.302953, -0.7565485, 2.309627, 1, 0, 0.5411765, 1,
1.328868, -0.6638776, 1.84433, 1, 0, 0.5333334, 1,
1.330732, -0.5878484, 1.608126, 1, 0, 0.5294118, 1,
1.332107, -0.101567, 2.16515, 1, 0, 0.5215687, 1,
1.339529, 0.6143534, 1.043939, 1, 0, 0.5176471, 1,
1.35103, 0.7057469, -0.2940878, 1, 0, 0.509804, 1,
1.356585, -0.6158794, 3.587404, 1, 0, 0.5058824, 1,
1.358081, -0.9413767, 2.254998, 1, 0, 0.4980392, 1,
1.385223, -0.345906, 0.5211611, 1, 0, 0.4901961, 1,
1.385436, -0.6295218, 1.352989, 1, 0, 0.4862745, 1,
1.388433, -1.452835, 2.577957, 1, 0, 0.4784314, 1,
1.404669, -0.5468096, -0.09070831, 1, 0, 0.4745098, 1,
1.411599, 1.26661, 1.423126, 1, 0, 0.4666667, 1,
1.417706, 2.878767, -0.188273, 1, 0, 0.4627451, 1,
1.426942, -0.6573715, 1.060855, 1, 0, 0.454902, 1,
1.429717, -1.553509, 2.163328, 1, 0, 0.4509804, 1,
1.43093, -1.24561, 3.010022, 1, 0, 0.4431373, 1,
1.43401, 1.30365, 1.516303, 1, 0, 0.4392157, 1,
1.443221, 2.037313, 0.5644782, 1, 0, 0.4313726, 1,
1.446046, 1.696663, 1.331667, 1, 0, 0.427451, 1,
1.448148, 0.1977389, 0.240127, 1, 0, 0.4196078, 1,
1.465752, 0.4861155, 1.554849, 1, 0, 0.4156863, 1,
1.472382, -0.6206838, 1.212937, 1, 0, 0.4078431, 1,
1.473876, -0.2121648, 1.21636, 1, 0, 0.4039216, 1,
1.47648, -0.275213, 2.603845, 1, 0, 0.3960784, 1,
1.492427, -0.5808977, 2.696438, 1, 0, 0.3882353, 1,
1.497814, -2.559614, 2.711698, 1, 0, 0.3843137, 1,
1.515175, 1.218882, 0.5600671, 1, 0, 0.3764706, 1,
1.522733, 1.059751, 1.229574, 1, 0, 0.372549, 1,
1.546278, -0.6723455, 1.820469, 1, 0, 0.3647059, 1,
1.548044, -0.5656413, 2.157122, 1, 0, 0.3607843, 1,
1.5572, 0.3782934, 1.590657, 1, 0, 0.3529412, 1,
1.557713, -1.322705, 2.940456, 1, 0, 0.3490196, 1,
1.570857, -1.374391, 1.690643, 1, 0, 0.3411765, 1,
1.57324, 0.3785389, 3.384465, 1, 0, 0.3372549, 1,
1.577993, -0.296855, 0.5191938, 1, 0, 0.3294118, 1,
1.5913, -0.4670748, 3.449879, 1, 0, 0.3254902, 1,
1.597724, 0.0678964, 2.576499, 1, 0, 0.3176471, 1,
1.601734, 1.003605, -0.7883588, 1, 0, 0.3137255, 1,
1.611777, -0.969336, 0.9298659, 1, 0, 0.3058824, 1,
1.61665, -1.220182, 3.013343, 1, 0, 0.2980392, 1,
1.617009, -0.4926038, 2.828768, 1, 0, 0.2941177, 1,
1.642745, -0.5265359, 1.479099, 1, 0, 0.2862745, 1,
1.648213, -1.348142, 3.392768, 1, 0, 0.282353, 1,
1.651816, -0.2536814, 2.745536, 1, 0, 0.2745098, 1,
1.656735, 1.591627, -1.118776, 1, 0, 0.2705882, 1,
1.658143, 0.7306115, 1.937608, 1, 0, 0.2627451, 1,
1.693973, 0.8177558, 1.400237, 1, 0, 0.2588235, 1,
1.721549, 0.6811946, 1.258979, 1, 0, 0.2509804, 1,
1.732792, 1.122402, 0.7615998, 1, 0, 0.2470588, 1,
1.74473, 2.233089, 0.4028484, 1, 0, 0.2392157, 1,
1.783455, 0.5004656, -0.3207284, 1, 0, 0.2352941, 1,
1.790952, 0.4519155, 1.010816, 1, 0, 0.227451, 1,
1.791401, -0.0232923, 1.997288, 1, 0, 0.2235294, 1,
1.792625, 0.05899755, 2.183379, 1, 0, 0.2156863, 1,
1.794695, 0.03680364, 1.242837, 1, 0, 0.2117647, 1,
1.850557, -0.2912461, -0.1450108, 1, 0, 0.2039216, 1,
1.852376, -0.2007532, 2.501884, 1, 0, 0.1960784, 1,
1.858654, -0.1188034, 1.829421, 1, 0, 0.1921569, 1,
1.874971, -0.9879367, 2.109881, 1, 0, 0.1843137, 1,
1.888399, -1.008245, 2.135767, 1, 0, 0.1803922, 1,
1.897187, -1.575855, 1.669909, 1, 0, 0.172549, 1,
1.902819, 0.4942762, 1.659351, 1, 0, 0.1686275, 1,
1.918511, -0.845162, 0.9657249, 1, 0, 0.1607843, 1,
1.935862, 0.07396196, 1.881881, 1, 0, 0.1568628, 1,
1.941988, -0.3977444, 1.974219, 1, 0, 0.1490196, 1,
1.955081, 0.4537872, 1.325149, 1, 0, 0.145098, 1,
1.961447, -0.7902266, 1.043164, 1, 0, 0.1372549, 1,
1.973911, 0.6359649, 2.308672, 1, 0, 0.1333333, 1,
1.99325, 0.1975037, 1.207913, 1, 0, 0.1254902, 1,
2.014614, 0.07369462, 0.6009791, 1, 0, 0.1215686, 1,
2.045303, 1.613655, -0.1824816, 1, 0, 0.1137255, 1,
2.065419, -0.9351413, 2.955425, 1, 0, 0.1098039, 1,
2.161635, 1.121916, 1.29748, 1, 0, 0.1019608, 1,
2.191774, 1.255762, 2.805027, 1, 0, 0.09411765, 1,
2.201291, 1.81422, -0.5530883, 1, 0, 0.09019608, 1,
2.237168, -0.2489499, 4.771102, 1, 0, 0.08235294, 1,
2.350767, 0.03514052, 2.082224, 1, 0, 0.07843138, 1,
2.383622, 0.9936178, 2.479439, 1, 0, 0.07058824, 1,
2.391265, 0.7355967, 0.09536103, 1, 0, 0.06666667, 1,
2.391384, -1.290469, 3.215119, 1, 0, 0.05882353, 1,
2.414323, -0.8021481, 2.12195, 1, 0, 0.05490196, 1,
2.42544, -0.3742769, 1.215022, 1, 0, 0.04705882, 1,
2.456785, -1.379812, 3.633186, 1, 0, 0.04313726, 1,
2.62368, 0.1597196, 1.25732, 1, 0, 0.03529412, 1,
2.683542, 0.2224106, 1.887144, 1, 0, 0.03137255, 1,
2.778068, 0.4275633, 1.694464, 1, 0, 0.02352941, 1,
2.786108, 0.3819473, 1.796119, 1, 0, 0.01960784, 1,
3.455667, 1.281124, 0.9020961, 1, 0, 0.01176471, 1,
4.584491, 0.473693, 3.012326, 1, 0, 0.007843138, 1
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
0.7067951, -4.250988, -7.75824, 0, -0.5, 0.5, 0.5,
0.7067951, -4.250988, -7.75824, 1, -0.5, 0.5, 0.5,
0.7067951, -4.250988, -7.75824, 1, 1.5, 0.5, 0.5,
0.7067951, -4.250988, -7.75824, 0, 1.5, 0.5, 0.5
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
-4.48544, 0.01228476, -7.75824, 0, -0.5, 0.5, 0.5,
-4.48544, 0.01228476, -7.75824, 1, -0.5, 0.5, 0.5,
-4.48544, 0.01228476, -7.75824, 1, 1.5, 0.5, 0.5,
-4.48544, 0.01228476, -7.75824, 0, 1.5, 0.5, 0.5
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
-4.48544, -4.250988, -0.210099, 0, -0.5, 0.5, 0.5,
-4.48544, -4.250988, -0.210099, 1, -0.5, 0.5, 0.5,
-4.48544, -4.250988, -0.210099, 1, 1.5, 0.5, 0.5,
-4.48544, -4.250988, -0.210099, 0, 1.5, 0.5, 0.5
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
-2, -3.267155, -6.016361,
4, -3.267155, -6.016361,
-2, -3.267155, -6.016361,
-2, -3.431128, -6.306674,
0, -3.267155, -6.016361,
0, -3.431128, -6.306674,
2, -3.267155, -6.016361,
2, -3.431128, -6.306674,
4, -3.267155, -6.016361,
4, -3.431128, -6.306674
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
"2",
"4"
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
-2, -3.759072, -6.8873, 0, -0.5, 0.5, 0.5,
-2, -3.759072, -6.8873, 1, -0.5, 0.5, 0.5,
-2, -3.759072, -6.8873, 1, 1.5, 0.5, 0.5,
-2, -3.759072, -6.8873, 0, 1.5, 0.5, 0.5,
0, -3.759072, -6.8873, 0, -0.5, 0.5, 0.5,
0, -3.759072, -6.8873, 1, -0.5, 0.5, 0.5,
0, -3.759072, -6.8873, 1, 1.5, 0.5, 0.5,
0, -3.759072, -6.8873, 0, 1.5, 0.5, 0.5,
2, -3.759072, -6.8873, 0, -0.5, 0.5, 0.5,
2, -3.759072, -6.8873, 1, -0.5, 0.5, 0.5,
2, -3.759072, -6.8873, 1, 1.5, 0.5, 0.5,
2, -3.759072, -6.8873, 0, 1.5, 0.5, 0.5,
4, -3.759072, -6.8873, 0, -0.5, 0.5, 0.5,
4, -3.759072, -6.8873, 1, -0.5, 0.5, 0.5,
4, -3.759072, -6.8873, 1, 1.5, 0.5, 0.5,
4, -3.759072, -6.8873, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<4; i++) 
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
12, 13, 14, 12, 14, 15
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
-3.287232, -3, -6.016361,
-3.287232, 3, -6.016361,
-3.287232, -3, -6.016361,
-3.486933, -3, -6.306674,
-3.287232, -2, -6.016361,
-3.486933, -2, -6.306674,
-3.287232, -1, -6.016361,
-3.486933, -1, -6.306674,
-3.287232, 0, -6.016361,
-3.486933, 0, -6.306674,
-3.287232, 1, -6.016361,
-3.486933, 1, -6.306674,
-3.287232, 2, -6.016361,
-3.486933, 2, -6.306674,
-3.287232, 3, -6.016361,
-3.486933, 3, -6.306674
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
-3.886336, -3, -6.8873, 0, -0.5, 0.5, 0.5,
-3.886336, -3, -6.8873, 1, -0.5, 0.5, 0.5,
-3.886336, -3, -6.8873, 1, 1.5, 0.5, 0.5,
-3.886336, -3, -6.8873, 0, 1.5, 0.5, 0.5,
-3.886336, -2, -6.8873, 0, -0.5, 0.5, 0.5,
-3.886336, -2, -6.8873, 1, -0.5, 0.5, 0.5,
-3.886336, -2, -6.8873, 1, 1.5, 0.5, 0.5,
-3.886336, -2, -6.8873, 0, 1.5, 0.5, 0.5,
-3.886336, -1, -6.8873, 0, -0.5, 0.5, 0.5,
-3.886336, -1, -6.8873, 1, -0.5, 0.5, 0.5,
-3.886336, -1, -6.8873, 1, 1.5, 0.5, 0.5,
-3.886336, -1, -6.8873, 0, 1.5, 0.5, 0.5,
-3.886336, 0, -6.8873, 0, -0.5, 0.5, 0.5,
-3.886336, 0, -6.8873, 1, -0.5, 0.5, 0.5,
-3.886336, 0, -6.8873, 1, 1.5, 0.5, 0.5,
-3.886336, 0, -6.8873, 0, 1.5, 0.5, 0.5,
-3.886336, 1, -6.8873, 0, -0.5, 0.5, 0.5,
-3.886336, 1, -6.8873, 1, -0.5, 0.5, 0.5,
-3.886336, 1, -6.8873, 1, 1.5, 0.5, 0.5,
-3.886336, 1, -6.8873, 0, 1.5, 0.5, 0.5,
-3.886336, 2, -6.8873, 0, -0.5, 0.5, 0.5,
-3.886336, 2, -6.8873, 1, -0.5, 0.5, 0.5,
-3.886336, 2, -6.8873, 1, 1.5, 0.5, 0.5,
-3.886336, 2, -6.8873, 0, 1.5, 0.5, 0.5,
-3.886336, 3, -6.8873, 0, -0.5, 0.5, 0.5,
-3.886336, 3, -6.8873, 1, -0.5, 0.5, 0.5,
-3.886336, 3, -6.8873, 1, 1.5, 0.5, 0.5,
-3.886336, 3, -6.8873, 0, 1.5, 0.5, 0.5
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
-3.287232, -3.267155, -4,
-3.287232, -3.267155, 4,
-3.287232, -3.267155, -4,
-3.486933, -3.431128, -4,
-3.287232, -3.267155, -2,
-3.486933, -3.431128, -2,
-3.287232, -3.267155, 0,
-3.486933, -3.431128, 0,
-3.287232, -3.267155, 2,
-3.486933, -3.431128, 2,
-3.287232, -3.267155, 4,
-3.486933, -3.431128, 4
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
-3.886336, -3.759072, -4, 0, -0.5, 0.5, 0.5,
-3.886336, -3.759072, -4, 1, -0.5, 0.5, 0.5,
-3.886336, -3.759072, -4, 1, 1.5, 0.5, 0.5,
-3.886336, -3.759072, -4, 0, 1.5, 0.5, 0.5,
-3.886336, -3.759072, -2, 0, -0.5, 0.5, 0.5,
-3.886336, -3.759072, -2, 1, -0.5, 0.5, 0.5,
-3.886336, -3.759072, -2, 1, 1.5, 0.5, 0.5,
-3.886336, -3.759072, -2, 0, 1.5, 0.5, 0.5,
-3.886336, -3.759072, 0, 0, -0.5, 0.5, 0.5,
-3.886336, -3.759072, 0, 1, -0.5, 0.5, 0.5,
-3.886336, -3.759072, 0, 1, 1.5, 0.5, 0.5,
-3.886336, -3.759072, 0, 0, 1.5, 0.5, 0.5,
-3.886336, -3.759072, 2, 0, -0.5, 0.5, 0.5,
-3.886336, -3.759072, 2, 1, -0.5, 0.5, 0.5,
-3.886336, -3.759072, 2, 1, 1.5, 0.5, 0.5,
-3.886336, -3.759072, 2, 0, 1.5, 0.5, 0.5,
-3.886336, -3.759072, 4, 0, -0.5, 0.5, 0.5,
-3.886336, -3.759072, 4, 1, -0.5, 0.5, 0.5,
-3.886336, -3.759072, 4, 1, 1.5, 0.5, 0.5,
-3.886336, -3.759072, 4, 0, 1.5, 0.5, 0.5
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
-3.287232, -3.267155, -6.016361,
-3.287232, 3.291725, -6.016361,
-3.287232, -3.267155, 5.596163,
-3.287232, 3.291725, 5.596163,
-3.287232, -3.267155, -6.016361,
-3.287232, -3.267155, 5.596163,
-3.287232, 3.291725, -6.016361,
-3.287232, 3.291725, 5.596163,
-3.287232, -3.267155, -6.016361,
4.700822, -3.267155, -6.016361,
-3.287232, -3.267155, 5.596163,
4.700822, -3.267155, 5.596163,
-3.287232, 3.291725, -6.016361,
4.700822, 3.291725, -6.016361,
-3.287232, 3.291725, 5.596163,
4.700822, 3.291725, 5.596163,
4.700822, -3.267155, -6.016361,
4.700822, 3.291725, -6.016361,
4.700822, -3.267155, 5.596163,
4.700822, 3.291725, 5.596163,
4.700822, -3.267155, -6.016361,
4.700822, -3.267155, 5.596163,
4.700822, 3.291725, -6.016361,
4.700822, 3.291725, 5.596163
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
var radius = 8.301271;
var distance = 36.93329;
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
mvMatrix.translate( -0.7067951, -0.01228476, 0.210099 );
mvMatrix.scale( 1.123615, 1.36845, 0.7729152 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.93329);
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
gl.drawArrays(gl.LINES, 0, 10);
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
gl.drawElements(gl.TRIANGLES, 24, gl.UNSIGNED_SHORT, 0);
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
testo<-read.table("testo.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-testo$V2
```

```
## Error in eval(expr, envir, enclos): object 'testo' not found
```

```r
y<-testo$V3
```

```
## Error in eval(expr, envir, enclos): object 'testo' not found
```

```r
z<-testo$V4
```

```
## Error in eval(expr, envir, enclos): object 'testo' not found
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
-3.170901, 0.1229465, -1.490744, 0, 0, 1, 1, 1,
-2.717466, -2.066886, -4.22303, 1, 0, 0, 1, 1,
-2.678864, -0.443866, -0.2621835, 1, 0, 0, 1, 1,
-2.672098, 0.3400065, -2.526973, 1, 0, 0, 1, 1,
-2.659604, -0.8295976, -4.149189, 1, 0, 0, 1, 1,
-2.634066, -0.2270402, -2.278751, 1, 0, 0, 1, 1,
-2.61524, 1.617786, 1.910411, 0, 0, 0, 1, 1,
-2.610738, 0.0932817, -3.476329, 0, 0, 0, 1, 1,
-2.604543, 0.6345724, -0.3751359, 0, 0, 0, 1, 1,
-2.55195, -0.8465003, -1.588071, 0, 0, 0, 1, 1,
-2.481702, 1.334188, -1.574347, 0, 0, 0, 1, 1,
-2.419009, 1.822364, -2.407289, 0, 0, 0, 1, 1,
-2.39056, -1.152534, -0.1353154, 0, 0, 0, 1, 1,
-2.378366, -0.1396907, -2.790025, 1, 1, 1, 1, 1,
-2.37695, 1.308438, -0.5116398, 1, 1, 1, 1, 1,
-2.363406, 0.4986353, -0.09371775, 1, 1, 1, 1, 1,
-2.357388, -0.3353327, -0.353971, 1, 1, 1, 1, 1,
-2.356493, -0.3229986, -2.506853, 1, 1, 1, 1, 1,
-2.345624, -1.067747, -2.429744, 1, 1, 1, 1, 1,
-2.307038, -0.1689117, -2.778302, 1, 1, 1, 1, 1,
-2.301386, 0.1573046, -1.491051, 1, 1, 1, 1, 1,
-2.295108, -0.7979703, -2.337385, 1, 1, 1, 1, 1,
-2.264134, -1.014225, -2.347203, 1, 1, 1, 1, 1,
-2.225661, -0.0884264, -1.36148, 1, 1, 1, 1, 1,
-2.187129, -2.212923, -3.118904, 1, 1, 1, 1, 1,
-2.181234, -0.292958, -1.869535, 1, 1, 1, 1, 1,
-2.180055, 0.6208499, -1.18177, 1, 1, 1, 1, 1,
-2.171989, -0.934207, -0.9594308, 1, 1, 1, 1, 1,
-2.143721, -0.4521424, -2.456329, 0, 0, 1, 1, 1,
-2.130721, 2.190513, -1.500669, 1, 0, 0, 1, 1,
-2.082067, 0.1303266, -0.6942804, 1, 0, 0, 1, 1,
-2.077707, 1.564866, -1.969272, 1, 0, 0, 1, 1,
-2.076441, -1.489766, -1.467182, 1, 0, 0, 1, 1,
-2.041712, -2.012119, -2.966631, 1, 0, 0, 1, 1,
-2.015547, -1.658162, -3.815722, 0, 0, 0, 1, 1,
-2.002892, -0.7276187, -0.2590926, 0, 0, 0, 1, 1,
-1.991524, 0.6402792, -3.055376, 0, 0, 0, 1, 1,
-1.98035, 0.6317149, -0.6236331, 0, 0, 0, 1, 1,
-1.92079, 1.207146, -2.527887, 0, 0, 0, 1, 1,
-1.920711, 1.107912, 0.13198, 0, 0, 0, 1, 1,
-1.887008, 1.311203, -1.768856, 0, 0, 0, 1, 1,
-1.877674, -1.149656, -2.70608, 1, 1, 1, 1, 1,
-1.864392, 0.8337152, -1.821021, 1, 1, 1, 1, 1,
-1.850916, -0.0513112, -1.349915, 1, 1, 1, 1, 1,
-1.842456, -0.03718276, -1.047976, 1, 1, 1, 1, 1,
-1.839338, 0.3073007, -0.3593797, 1, 1, 1, 1, 1,
-1.834792, -0.6828541, -0.0229005, 1, 1, 1, 1, 1,
-1.81348, 0.7408985, -2.650702, 1, 1, 1, 1, 1,
-1.794241, -0.7064793, -0.7972072, 1, 1, 1, 1, 1,
-1.782024, 1.529448, 0.09290158, 1, 1, 1, 1, 1,
-1.759979, -0.4888421, -0.3944019, 1, 1, 1, 1, 1,
-1.744949, 0.2309041, -1.816037, 1, 1, 1, 1, 1,
-1.742765, -2.23061, -2.380919, 1, 1, 1, 1, 1,
-1.741988, 0.7194954, -1.359575, 1, 1, 1, 1, 1,
-1.740323, 0.4485928, -0.9464916, 1, 1, 1, 1, 1,
-1.70507, -0.9925663, -2.110713, 1, 1, 1, 1, 1,
-1.693784, 0.6447365, -2.334364, 0, 0, 1, 1, 1,
-1.690153, 1.180056, -1.785925, 1, 0, 0, 1, 1,
-1.672632, -0.3524467, 0.7043165, 1, 0, 0, 1, 1,
-1.668303, -0.8773775, -2.18158, 1, 0, 0, 1, 1,
-1.649904, -0.4478756, -1.576872, 1, 0, 0, 1, 1,
-1.638095, 0.1122804, -0.4161116, 1, 0, 0, 1, 1,
-1.619314, 0.8732938, 1.078306, 0, 0, 0, 1, 1,
-1.6145, -0.6255437, -1.937257, 0, 0, 0, 1, 1,
-1.601763, 0.3728873, 0.6565958, 0, 0, 0, 1, 1,
-1.594272, -1.037647, -1.365348, 0, 0, 0, 1, 1,
-1.593768, -0.1735806, -3.412051, 0, 0, 0, 1, 1,
-1.59318, 1.546169, 0.09922491, 0, 0, 0, 1, 1,
-1.586064, 1.328717, -0.4963204, 0, 0, 0, 1, 1,
-1.581279, 0.8880965, -1.588045, 1, 1, 1, 1, 1,
-1.575369, -1.088786, 0.0860898, 1, 1, 1, 1, 1,
-1.558928, -0.7100658, -1.461032, 1, 1, 1, 1, 1,
-1.558635, -0.4813519, -4.128646, 1, 1, 1, 1, 1,
-1.542279, 1.151282, -2.020798, 1, 1, 1, 1, 1,
-1.535196, -0.8576282, -2.020425, 1, 1, 1, 1, 1,
-1.529038, -1.142414, -2.28104, 1, 1, 1, 1, 1,
-1.517829, 1.661492, -0.6296897, 1, 1, 1, 1, 1,
-1.489277, -0.4437971, -3.909022, 1, 1, 1, 1, 1,
-1.487496, 0.03339573, -0.9962655, 1, 1, 1, 1, 1,
-1.484962, -0.971131, -2.08096, 1, 1, 1, 1, 1,
-1.4759, 0.9260441, -1.386081, 1, 1, 1, 1, 1,
-1.462827, 0.8190557, -1.562345, 1, 1, 1, 1, 1,
-1.462589, 0.2737052, -1.578374, 1, 1, 1, 1, 1,
-1.457605, -1.10114, -2.278691, 1, 1, 1, 1, 1,
-1.455893, -0.1840315, -3.233604, 0, 0, 1, 1, 1,
-1.450235, -0.5421466, -1.426837, 1, 0, 0, 1, 1,
-1.436733, 0.2018989, -1.075241, 1, 0, 0, 1, 1,
-1.434845, -1.482466, -1.513003, 1, 0, 0, 1, 1,
-1.422998, -0.06745835, -0.9992481, 1, 0, 0, 1, 1,
-1.390794, -1.245124, -1.601131, 1, 0, 0, 1, 1,
-1.384397, -0.8857679, -2.47491, 0, 0, 0, 1, 1,
-1.381542, 0.4527698, -1.785349, 0, 0, 0, 1, 1,
-1.375694, -2.059345, -4.446586, 0, 0, 0, 1, 1,
-1.372744, -0.6560834, -2.034105, 0, 0, 0, 1, 1,
-1.352767, -1.852794, -2.848145, 0, 0, 0, 1, 1,
-1.351474, 0.5371529, -0.08220046, 0, 0, 0, 1, 1,
-1.347675, 0.05729776, -0.8964627, 0, 0, 0, 1, 1,
-1.322376, -0.5194802, -2.479203, 1, 1, 1, 1, 1,
-1.311158, -1.749948, -0.3449892, 1, 1, 1, 1, 1,
-1.307432, 0.5591556, -1.21062, 1, 1, 1, 1, 1,
-1.306949, 1.87737, -2.224159, 1, 1, 1, 1, 1,
-1.289695, 1.844812, 0.9925697, 1, 1, 1, 1, 1,
-1.283263, -2.081993, -3.634997, 1, 1, 1, 1, 1,
-1.281285, -1.136888, -2.253401, 1, 1, 1, 1, 1,
-1.279484, 0.8247851, -0.787493, 1, 1, 1, 1, 1,
-1.26709, -1.124198, -1.146429, 1, 1, 1, 1, 1,
-1.249838, -0.8234327, -1.234525, 1, 1, 1, 1, 1,
-1.247376, 0.3781887, -2.318491, 1, 1, 1, 1, 1,
-1.246936, 1.132338, -0.330989, 1, 1, 1, 1, 1,
-1.238634, -0.6399454, -2.206264, 1, 1, 1, 1, 1,
-1.233559, 1.866144, -0.1308229, 1, 1, 1, 1, 1,
-1.223645, 1.046169, -1.063163, 1, 1, 1, 1, 1,
-1.221497, 1.308395, 0.03034287, 0, 0, 1, 1, 1,
-1.212179, 0.5574861, -1.419164, 1, 0, 0, 1, 1,
-1.211803, 0.4088821, -1.161671, 1, 0, 0, 1, 1,
-1.200146, 0.1752361, -2.597857, 1, 0, 0, 1, 1,
-1.198171, -0.5377246, -2.427606, 1, 0, 0, 1, 1,
-1.196617, -1.546604, -1.233234, 1, 0, 0, 1, 1,
-1.195415, 0.799967, -2.215466, 0, 0, 0, 1, 1,
-1.190214, 0.7207216, -1.045112, 0, 0, 0, 1, 1,
-1.189665, 0.724218, -2.066043, 0, 0, 0, 1, 1,
-1.184542, -1.952484, -2.64004, 0, 0, 0, 1, 1,
-1.181729, -0.1465116, 0.5741954, 0, 0, 0, 1, 1,
-1.176664, 0.1640579, -2.075526, 0, 0, 0, 1, 1,
-1.176554, -2.126269, -1.97448, 0, 0, 0, 1, 1,
-1.16831, -0.6496078, -1.74622, 1, 1, 1, 1, 1,
-1.164428, -1.258353, -1.746232, 1, 1, 1, 1, 1,
-1.162479, 1.359936, -0.8667701, 1, 1, 1, 1, 1,
-1.161965, 1.246684, 0.1160419, 1, 1, 1, 1, 1,
-1.159282, 1.488236, -0.4238489, 1, 1, 1, 1, 1,
-1.158596, 0.01863029, -2.28356, 1, 1, 1, 1, 1,
-1.147939, 0.08843822, -1.279789, 1, 1, 1, 1, 1,
-1.146735, -1.263588, -3.130016, 1, 1, 1, 1, 1,
-1.145377, -0.1803018, -2.078362, 1, 1, 1, 1, 1,
-1.143619, -0.07331222, -1.964531, 1, 1, 1, 1, 1,
-1.125023, -1.365121, -4.928942, 1, 1, 1, 1, 1,
-1.122468, 0.8215294, 0.3821107, 1, 1, 1, 1, 1,
-1.120664, -0.5445166, -0.5713693, 1, 1, 1, 1, 1,
-1.11157, 0.07253618, -0.1504445, 1, 1, 1, 1, 1,
-1.108446, 2.206672, -0.6785929, 1, 1, 1, 1, 1,
-1.094467, 0.3206322, -1.417205, 0, 0, 1, 1, 1,
-1.079492, -0.8407916, -2.559674, 1, 0, 0, 1, 1,
-1.078005, -2.241638, -2.620576, 1, 0, 0, 1, 1,
-1.073903, 0.6758668, -1.849161, 1, 0, 0, 1, 1,
-1.071927, 2.255949, 0.9939525, 1, 0, 0, 1, 1,
-1.07145, -0.8835129, -4.348399, 1, 0, 0, 1, 1,
-1.061174, 0.4804357, 0.8219963, 0, 0, 0, 1, 1,
-1.056922, -0.150603, -2.055093, 0, 0, 0, 1, 1,
-1.045788, 1.134848, -1.904175, 0, 0, 0, 1, 1,
-1.035448, -1.518442, -2.261495, 0, 0, 0, 1, 1,
-1.035029, -0.2516007, 0.3490678, 0, 0, 0, 1, 1,
-1.030922, -0.5213708, -2.191848, 0, 0, 0, 1, 1,
-1.03046, -1.390773, -1.893183, 0, 0, 0, 1, 1,
-1.030437, -0.5270482, -1.472795, 1, 1, 1, 1, 1,
-1.029524, 0.9389309, 2.017691, 1, 1, 1, 1, 1,
-1.024241, -0.1600669, -2.681434, 1, 1, 1, 1, 1,
-1.012417, -0.03673036, -1.86201, 1, 1, 1, 1, 1,
-1.006575, -0.2814044, -2.735193, 1, 1, 1, 1, 1,
-0.9996301, 1.750749, -1.092062, 1, 1, 1, 1, 1,
-0.9902562, -0.8246832, -2.181524, 1, 1, 1, 1, 1,
-0.9896108, 0.4682682, -1.120699, 1, 1, 1, 1, 1,
-0.9889007, -2.453384, -4.17785, 1, 1, 1, 1, 1,
-0.986255, 0.7666188, 0.485717, 1, 1, 1, 1, 1,
-0.984646, 0.6511804, -2.194982, 1, 1, 1, 1, 1,
-0.9825533, 0.1622774, -0.8202736, 1, 1, 1, 1, 1,
-0.9767415, -0.764147, -2.500221, 1, 1, 1, 1, 1,
-0.9752015, -0.2351633, -1.730508, 1, 1, 1, 1, 1,
-0.9748286, 0.1300662, 1.103051, 1, 1, 1, 1, 1,
-0.9725487, 0.1170991, -1.653523, 0, 0, 1, 1, 1,
-0.9676721, -0.2374251, -2.118915, 1, 0, 0, 1, 1,
-0.9603719, 1.59913, -0.579125, 1, 0, 0, 1, 1,
-0.947428, 0.8450216, -0.7109855, 1, 0, 0, 1, 1,
-0.9447384, -0.03748376, -0.9828677, 1, 0, 0, 1, 1,
-0.9377394, -1.003259, -4.790192, 1, 0, 0, 1, 1,
-0.9333523, 1.163778, -0.389605, 0, 0, 0, 1, 1,
-0.9327182, 0.6484256, -1.704427, 0, 0, 0, 1, 1,
-0.9302858, 1.015847, -1.529678, 0, 0, 0, 1, 1,
-0.9301916, 0.234793, -1.367437, 0, 0, 0, 1, 1,
-0.9246303, -1.692097, -3.725283, 0, 0, 0, 1, 1,
-0.9233811, -0.7901898, -1.779675, 0, 0, 0, 1, 1,
-0.9219204, 0.4151766, -1.366026, 0, 0, 0, 1, 1,
-0.91878, 0.03240529, -2.406568, 1, 1, 1, 1, 1,
-0.9129985, -0.9720075, -2.652162, 1, 1, 1, 1, 1,
-0.9089136, 0.3327654, 0.02444762, 1, 1, 1, 1, 1,
-0.9062047, -1.777063, -2.271873, 1, 1, 1, 1, 1,
-0.905489, 0.9472526, -0.1366345, 1, 1, 1, 1, 1,
-0.9025776, -1.840108, -0.5000055, 1, 1, 1, 1, 1,
-0.8972769, -0.06804688, -0.08503094, 1, 1, 1, 1, 1,
-0.8894368, -0.4194872, -0.1601752, 1, 1, 1, 1, 1,
-0.8890351, -1.033661, -2.275926, 1, 1, 1, 1, 1,
-0.8862089, -1.443526, -3.366346, 1, 1, 1, 1, 1,
-0.8853743, 0.2357977, -1.908068, 1, 1, 1, 1, 1,
-0.8816441, 1.931169, -1.021669, 1, 1, 1, 1, 1,
-0.8796729, -0.6146826, -1.624788, 1, 1, 1, 1, 1,
-0.8760858, 0.8711804, -1.19834, 1, 1, 1, 1, 1,
-0.8698447, 1.29743, -2.219304, 1, 1, 1, 1, 1,
-0.8650235, -0.8495439, -2.662898, 0, 0, 1, 1, 1,
-0.8540531, -2.400601, -1.448688, 1, 0, 0, 1, 1,
-0.847941, 2.420609, 0.1093922, 1, 0, 0, 1, 1,
-0.8442952, -0.08695035, -0.3668422, 1, 0, 0, 1, 1,
-0.8341194, -0.02732919, 0.3466044, 1, 0, 0, 1, 1,
-0.8331544, 0.2855826, -1.651243, 1, 0, 0, 1, 1,
-0.8311864, 0.3827158, 0.1138964, 0, 0, 0, 1, 1,
-0.8301308, -0.3440879, -1.627409, 0, 0, 0, 1, 1,
-0.8299106, -1.306935, -2.010287, 0, 0, 0, 1, 1,
-0.8222893, -2.511677, -3.059248, 0, 0, 0, 1, 1,
-0.8219868, 0.1404468, -3.410059, 0, 0, 0, 1, 1,
-0.8206856, -0.7356176, -1.791248, 0, 0, 0, 1, 1,
-0.8150904, 2.209566, 0.6409924, 0, 0, 0, 1, 1,
-0.8120973, 0.7083518, -0.6697386, 1, 1, 1, 1, 1,
-0.8098961, 0.1814057, -2.425656, 1, 1, 1, 1, 1,
-0.8082238, -1.05813, -2.519944, 1, 1, 1, 1, 1,
-0.7918048, -0.1610886, -1.361852, 1, 1, 1, 1, 1,
-0.786429, 0.6017709, -0.5766006, 1, 1, 1, 1, 1,
-0.7844732, -0.2743707, -0.2086869, 1, 1, 1, 1, 1,
-0.7814618, -0.221946, -1.896501, 1, 1, 1, 1, 1,
-0.77813, 1.469554, -0.174487, 1, 1, 1, 1, 1,
-0.7724941, -0.07277002, -1.909325, 1, 1, 1, 1, 1,
-0.7707619, 0.8293903, 0.2989472, 1, 1, 1, 1, 1,
-0.7705282, 0.3464819, -0.5205697, 1, 1, 1, 1, 1,
-0.7700595, -0.2050775, -4.658271, 1, 1, 1, 1, 1,
-0.7668409, 0.4049402, -0.2092183, 1, 1, 1, 1, 1,
-0.7644743, 1.247993, -1.574225, 1, 1, 1, 1, 1,
-0.7613319, 0.9655567, -1.395494, 1, 1, 1, 1, 1,
-0.759185, 0.3434837, -3.290048, 0, 0, 1, 1, 1,
-0.7587414, -1.602248, -2.017427, 1, 0, 0, 1, 1,
-0.7559959, 0.2432851, -2.3802, 1, 0, 0, 1, 1,
-0.7527056, 0.1056888, -2.166402, 1, 0, 0, 1, 1,
-0.7526469, -1.753081, -4.371266, 1, 0, 0, 1, 1,
-0.7475394, 0.2519127, -0.1398236, 1, 0, 0, 1, 1,
-0.7462294, 0.2885585, -1.898065, 0, 0, 0, 1, 1,
-0.7461907, -0.1713879, -2.513853, 0, 0, 0, 1, 1,
-0.739898, -0.6341285, -2.577745, 0, 0, 0, 1, 1,
-0.735831, -0.1997102, -1.469477, 0, 0, 0, 1, 1,
-0.7294685, -0.1377889, -2.675139, 0, 0, 0, 1, 1,
-0.7261671, 1.480498, -0.4480716, 0, 0, 0, 1, 1,
-0.7255998, 1.873149, 0.6271667, 0, 0, 0, 1, 1,
-0.7254481, -1.733927, -2.083203, 1, 1, 1, 1, 1,
-0.7146776, 0.03118703, -1.707408, 1, 1, 1, 1, 1,
-0.7137311, -1.016093, -2.061579, 1, 1, 1, 1, 1,
-0.7110127, -0.5512372, -0.4802591, 1, 1, 1, 1, 1,
-0.7082277, -0.2486735, 0.1702888, 1, 1, 1, 1, 1,
-0.7074621, 0.7629706, -0.3293316, 1, 1, 1, 1, 1,
-0.7057012, -1.176049, -2.265186, 1, 1, 1, 1, 1,
-0.7032202, 1.231276, -0.3302285, 1, 1, 1, 1, 1,
-0.6998917, -0.1182226, -0.3417477, 1, 1, 1, 1, 1,
-0.6987342, 0.8162665, -1.255178, 1, 1, 1, 1, 1,
-0.6895511, -0.2581146, -2.741285, 1, 1, 1, 1, 1,
-0.6849825, -0.3403428, -2.781656, 1, 1, 1, 1, 1,
-0.680428, -0.332276, -0.9796701, 1, 1, 1, 1, 1,
-0.676338, -0.1630142, -1.34186, 1, 1, 1, 1, 1,
-0.6716865, -0.1839863, -2.316251, 1, 1, 1, 1, 1,
-0.669603, 0.4072044, -1.788839, 0, 0, 1, 1, 1,
-0.6586452, -0.3630853, -0.4163002, 1, 0, 0, 1, 1,
-0.6566619, 0.03767018, -2.887862, 1, 0, 0, 1, 1,
-0.6549256, -0.119779, -1.882776, 1, 0, 0, 1, 1,
-0.6473641, -0.511007, -1.655488, 1, 0, 0, 1, 1,
-0.6461231, 0.06886646, -1.22613, 1, 0, 0, 1, 1,
-0.6454844, -2.31887, -1.850577, 0, 0, 0, 1, 1,
-0.6451477, -2.417045, -2.787704, 0, 0, 0, 1, 1,
-0.6383703, 0.1483376, -2.301043, 0, 0, 0, 1, 1,
-0.6351112, -0.4690911, -1.256871, 0, 0, 0, 1, 1,
-0.6239998, 0.4337449, -1.367993, 0, 0, 0, 1, 1,
-0.6196721, -0.5330948, -1.896973, 0, 0, 0, 1, 1,
-0.6166525, -1.480369, -5.847247, 0, 0, 0, 1, 1,
-0.610934, 0.8690341, 0.3143958, 1, 1, 1, 1, 1,
-0.6092575, 0.3899651, -0.168011, 1, 1, 1, 1, 1,
-0.6070684, -0.1396359, -1.558705, 1, 1, 1, 1, 1,
-0.6060093, 0.4330087, -2.296998, 1, 1, 1, 1, 1,
-0.5973246, -1.390591, -1.66161, 1, 1, 1, 1, 1,
-0.5961489, -0.202343, -0.7571484, 1, 1, 1, 1, 1,
-0.5888066, -1.073626, -2.764369, 1, 1, 1, 1, 1,
-0.5857706, -0.7972706, -2.022138, 1, 1, 1, 1, 1,
-0.5841035, 1.108477, -0.7610543, 1, 1, 1, 1, 1,
-0.5839002, 0.5445413, -0.7752725, 1, 1, 1, 1, 1,
-0.5806752, -0.8467185, -2.061924, 1, 1, 1, 1, 1,
-0.5678788, 0.2880079, -1.375513, 1, 1, 1, 1, 1,
-0.5659955, 1.317352, -1.472916, 1, 1, 1, 1, 1,
-0.5653054, -0.2613979, -3.653036, 1, 1, 1, 1, 1,
-0.5649957, -0.7855004, -3.374796, 1, 1, 1, 1, 1,
-0.5505995, -0.621654, -0.7791304, 0, 0, 1, 1, 1,
-0.5503274, 0.8111197, -1.85991, 1, 0, 0, 1, 1,
-0.5452813, 0.9007419, 0.7911634, 1, 0, 0, 1, 1,
-0.5398685, -1.112341, -2.792866, 1, 0, 0, 1, 1,
-0.5377425, 1.028454, -0.6647441, 1, 0, 0, 1, 1,
-0.536229, 0.9728066, -0.8693209, 1, 0, 0, 1, 1,
-0.5325958, -0.199906, -2.225147, 0, 0, 0, 1, 1,
-0.5286506, -0.5112787, -3.012542, 0, 0, 0, 1, 1,
-0.5258309, -0.4110697, -0.5226579, 0, 0, 0, 1, 1,
-0.5233526, 0.7070158, -1.245755, 0, 0, 0, 1, 1,
-0.5204058, 1.444081, 0.3402219, 0, 0, 0, 1, 1,
-0.5199333, -0.09583637, -2.405103, 0, 0, 0, 1, 1,
-0.5156718, -0.6162272, -2.080961, 0, 0, 0, 1, 1,
-0.5115683, -0.2575466, -1.882608, 1, 1, 1, 1, 1,
-0.51128, -0.9368579, -1.601712, 1, 1, 1, 1, 1,
-0.5094665, -0.3029698, -3.210068, 1, 1, 1, 1, 1,
-0.5078558, -0.7622154, -2.715575, 1, 1, 1, 1, 1,
-0.5063725, 0.3757847, -0.520588, 1, 1, 1, 1, 1,
-0.5058806, 1.752751, -0.8212369, 1, 1, 1, 1, 1,
-0.5057366, -1.748871, -4.247524, 1, 1, 1, 1, 1,
-0.5006847, 0.7201813, -0.7617355, 1, 1, 1, 1, 1,
-0.4985919, 0.1464153, -3.363033, 1, 1, 1, 1, 1,
-0.4969689, -1.132941, -4.483687, 1, 1, 1, 1, 1,
-0.4951448, 0.5811708, -0.7318522, 1, 1, 1, 1, 1,
-0.4920895, 0.2983412, 0.289656, 1, 1, 1, 1, 1,
-0.4916688, -0.4150233, -0.3628137, 1, 1, 1, 1, 1,
-0.4909155, -0.04673935, -2.259747, 1, 1, 1, 1, 1,
-0.4874902, -3.171638, -4.191631, 1, 1, 1, 1, 1,
-0.4833463, -0.7804917, -2.118564, 0, 0, 1, 1, 1,
-0.4805883, 1.197896, 0.9407598, 1, 0, 0, 1, 1,
-0.4801277, -0.4803549, -1.760554, 1, 0, 0, 1, 1,
-0.4797998, 0.4257523, -2.306174, 1, 0, 0, 1, 1,
-0.4760748, -0.8657656, -3.683708, 1, 0, 0, 1, 1,
-0.470518, 0.1017178, -1.688605, 1, 0, 0, 1, 1,
-0.4678643, -0.1753196, -2.865799, 0, 0, 0, 1, 1,
-0.4669095, -0.7557703, -1.776259, 0, 0, 0, 1, 1,
-0.4653771, -0.2822984, -2.824365, 0, 0, 0, 1, 1,
-0.4633434, 1.050077, 0.1610302, 0, 0, 0, 1, 1,
-0.4583799, 0.5122703, -0.9638801, 0, 0, 0, 1, 1,
-0.456601, -1.042286, -4.435743, 0, 0, 0, 1, 1,
-0.4550695, -0.5894734, -2.329339, 0, 0, 0, 1, 1,
-0.4542442, 1.488954, -1.56982, 1, 1, 1, 1, 1,
-0.4509814, 0.4564289, 0.649675, 1, 1, 1, 1, 1,
-0.4459667, 0.8132214, -1.071746, 1, 1, 1, 1, 1,
-0.4402968, 1.687418, 0.530386, 1, 1, 1, 1, 1,
-0.435858, -0.8922611, -2.291277, 1, 1, 1, 1, 1,
-0.4356371, -0.3615388, -3.132331, 1, 1, 1, 1, 1,
-0.4321632, -0.193968, -1.854584, 1, 1, 1, 1, 1,
-0.4290985, -0.06861736, -1.955828, 1, 1, 1, 1, 1,
-0.4263567, 1.456636, 0.9157611, 1, 1, 1, 1, 1,
-0.420568, -0.3624818, -3.431362, 1, 1, 1, 1, 1,
-0.4191951, -0.1245726, -1.249038, 1, 1, 1, 1, 1,
-0.4143052, -1.72929, -3.57537, 1, 1, 1, 1, 1,
-0.4083889, 0.1358783, -2.467368, 1, 1, 1, 1, 1,
-0.400373, 0.7670215, 0.2057282, 1, 1, 1, 1, 1,
-0.398432, -0.1409435, -1.651062, 1, 1, 1, 1, 1,
-0.3962638, 0.6493343, 0.3519319, 0, 0, 1, 1, 1,
-0.3817608, 1.572322, -0.8202024, 1, 0, 0, 1, 1,
-0.3804788, 0.8714759, -0.9981121, 1, 0, 0, 1, 1,
-0.3778592, 0.3194864, -2.339643, 1, 0, 0, 1, 1,
-0.3708094, 0.9844235, -0.6549864, 1, 0, 0, 1, 1,
-0.3702736, 0.8149515, -0.09555694, 1, 0, 0, 1, 1,
-0.3683868, 0.06547029, -2.205341, 0, 0, 0, 1, 1,
-0.3583413, -1.171059, -4.036209, 0, 0, 0, 1, 1,
-0.3563505, 1.46251, -0.7246918, 0, 0, 0, 1, 1,
-0.3560263, -1.506068, -2.728867, 0, 0, 0, 1, 1,
-0.3558629, -2.534688, -2.752605, 0, 0, 0, 1, 1,
-0.3548169, 0.7110776, -1.167407, 0, 0, 0, 1, 1,
-0.3521655, 0.001700538, -2.935325, 0, 0, 0, 1, 1,
-0.3508824, -0.9036404, -3.739461, 1, 1, 1, 1, 1,
-0.350254, 0.6683964, -1.202304, 1, 1, 1, 1, 1,
-0.3474097, 1.663774, -0.7050797, 1, 1, 1, 1, 1,
-0.3457177, -1.607725, -3.828648, 1, 1, 1, 1, 1,
-0.3434613, -0.5502474, -2.738953, 1, 1, 1, 1, 1,
-0.3406792, -0.4389148, -3.079846, 1, 1, 1, 1, 1,
-0.3395343, 1.525141, -1.626449, 1, 1, 1, 1, 1,
-0.3377875, -1.143331, -1.242422, 1, 1, 1, 1, 1,
-0.3361976, -1.789164, -1.603083, 1, 1, 1, 1, 1,
-0.3335861, 1.886427, -1.118478, 1, 1, 1, 1, 1,
-0.3226498, 2.054541, -1.449531, 1, 1, 1, 1, 1,
-0.3216245, 0.7955528, 0.05396945, 1, 1, 1, 1, 1,
-0.3177682, 0.1841683, -1.124356, 1, 1, 1, 1, 1,
-0.3165735, -0.07455972, -3.934108, 1, 1, 1, 1, 1,
-0.3165417, 0.06491692, -0.7828305, 1, 1, 1, 1, 1,
-0.3149277, 0.1723479, -1.373576, 0, 0, 1, 1, 1,
-0.3143925, 1.79232, 1.786667, 1, 0, 0, 1, 1,
-0.3141062, 1.209056, -0.8143855, 1, 0, 0, 1, 1,
-0.3029583, 0.461263, -0.7142438, 1, 0, 0, 1, 1,
-0.2963164, 0.7743245, -2.334851, 1, 0, 0, 1, 1,
-0.2926954, -0.564295, -3.475085, 1, 0, 0, 1, 1,
-0.2909413, -0.5086113, -1.953565, 0, 0, 0, 1, 1,
-0.289753, -0.9976668, -1.576756, 0, 0, 0, 1, 1,
-0.2828122, -2.418504, -2.030621, 0, 0, 0, 1, 1,
-0.2821807, 1.667259, 0.08446709, 0, 0, 0, 1, 1,
-0.2814882, -1.155196, -3.186212, 0, 0, 0, 1, 1,
-0.280914, -1.663354, -1.806745, 0, 0, 0, 1, 1,
-0.2794428, 0.9195408, -0.02419327, 0, 0, 0, 1, 1,
-0.2766702, -0.4930849, -2.287094, 1, 1, 1, 1, 1,
-0.2742618, -0.1021334, -2.524632, 1, 1, 1, 1, 1,
-0.2730709, -0.2848461, -3.982714, 1, 1, 1, 1, 1,
-0.2711556, -1.077447, -2.265183, 1, 1, 1, 1, 1,
-0.2694336, -1.379154, -1.973632, 1, 1, 1, 1, 1,
-0.2658062, -0.4613663, -3.559656, 1, 1, 1, 1, 1,
-0.2637683, 0.5275648, -1.292772, 1, 1, 1, 1, 1,
-0.2605934, 0.3752627, 0.3512687, 1, 1, 1, 1, 1,
-0.259172, -0.2437388, -3.505814, 1, 1, 1, 1, 1,
-0.2587824, -0.2848603, -1.304367, 1, 1, 1, 1, 1,
-0.2582349, 0.07765485, -2.145732, 1, 1, 1, 1, 1,
-0.2554636, 0.3499369, -1.686692, 1, 1, 1, 1, 1,
-0.2534394, 0.9939806, 0.3442254, 1, 1, 1, 1, 1,
-0.2512098, 0.7524955, -1.323119, 1, 1, 1, 1, 1,
-0.2499444, -2.354585, -1.092281, 1, 1, 1, 1, 1,
-0.2477913, 0.4581299, -0.9759793, 0, 0, 1, 1, 1,
-0.2424904, 0.5513464, -0.9033297, 1, 0, 0, 1, 1,
-0.2338222, -0.6088791, -2.816564, 1, 0, 0, 1, 1,
-0.2320395, 0.2114596, -0.9763755, 1, 0, 0, 1, 1,
-0.2294612, 1.396333, 0.3620376, 1, 0, 0, 1, 1,
-0.2267561, 0.1859841, -0.3418617, 1, 0, 0, 1, 1,
-0.2254653, 1.218938, -0.2985914, 0, 0, 0, 1, 1,
-0.2207675, 0.2106115, -1.455293, 0, 0, 0, 1, 1,
-0.2178925, 2.797749, 1.125362, 0, 0, 0, 1, 1,
-0.2154966, -0.5964176, -2.960108, 0, 0, 0, 1, 1,
-0.212311, 0.02560614, -4.840474, 0, 0, 0, 1, 1,
-0.2118134, -0.9263597, -4.004445, 0, 0, 0, 1, 1,
-0.2099582, -0.06342369, -2.457987, 0, 0, 0, 1, 1,
-0.2063807, 1.02909, 0.6448442, 1, 1, 1, 1, 1,
-0.2050135, -0.1194413, -1.687645, 1, 1, 1, 1, 1,
-0.2045293, -0.2710786, -3.016407, 1, 1, 1, 1, 1,
-0.2014551, -0.7581913, -1.865971, 1, 1, 1, 1, 1,
-0.2013982, -0.1046758, -2.150422, 1, 1, 1, 1, 1,
-0.1964878, 0.7001495, -0.8604918, 1, 1, 1, 1, 1,
-0.1962978, 0.6767953, -0.6619805, 1, 1, 1, 1, 1,
-0.1872785, 1.064453, -2.068807, 1, 1, 1, 1, 1,
-0.185413, 1.668066, -0.07660379, 1, 1, 1, 1, 1,
-0.1842433, -1.036738, -3.456795, 1, 1, 1, 1, 1,
-0.1828054, -0.4927454, -0.254122, 1, 1, 1, 1, 1,
-0.1767909, -1.923818, -2.667482, 1, 1, 1, 1, 1,
-0.1751118, -0.09224653, -1.554938, 1, 1, 1, 1, 1,
-0.1702714, 0.4414723, -0.4761293, 1, 1, 1, 1, 1,
-0.1677734, -0.9609471, -1.229922, 1, 1, 1, 1, 1,
-0.1648596, -0.7466602, -2.846367, 0, 0, 1, 1, 1,
-0.1630423, -0.3845283, -3.256405, 1, 0, 0, 1, 1,
-0.1610757, 1.52469, -0.497953, 1, 0, 0, 1, 1,
-0.1606672, -0.3090347, -2.345514, 1, 0, 0, 1, 1,
-0.1604925, -0.5245658, -2.485155, 1, 0, 0, 1, 1,
-0.1604036, 1.787119, 0.03285976, 1, 0, 0, 1, 1,
-0.1598705, 1.089919, -0.2815544, 0, 0, 0, 1, 1,
-0.1578428, -1.072168, -3.276227, 0, 0, 0, 1, 1,
-0.1565899, 0.08473657, 1.224976, 0, 0, 0, 1, 1,
-0.1562136, 3.196207, -0.3187553, 0, 0, 0, 1, 1,
-0.151889, 1.527657, -0.1754281, 0, 0, 0, 1, 1,
-0.1427477, 0.08537216, -1.650884, 0, 0, 0, 1, 1,
-0.141968, 1.042952, -0.238732, 0, 0, 0, 1, 1,
-0.1372709, -0.790647, -1.621966, 1, 1, 1, 1, 1,
-0.1369441, -0.4371038, -3.070751, 1, 1, 1, 1, 1,
-0.1323926, -1.217911, -4.076239, 1, 1, 1, 1, 1,
-0.1313463, -0.7973974, -4.72479, 1, 1, 1, 1, 1,
-0.1301166, -0.2429625, -1.120735, 1, 1, 1, 1, 1,
-0.1280587, -2.416075, -3.349951, 1, 1, 1, 1, 1,
-0.1230433, -1.090944, -2.943724, 1, 1, 1, 1, 1,
-0.1140647, -0.1207111, -3.123046, 1, 1, 1, 1, 1,
-0.1132147, 2.214725, 0.0953269, 1, 1, 1, 1, 1,
-0.1130648, 2.116202, -1.37986, 1, 1, 1, 1, 1,
-0.111826, 1.065665, -0.2185137, 1, 1, 1, 1, 1,
-0.1089189, 1.783115, -0.3163117, 1, 1, 1, 1, 1,
-0.1071778, -0.4807377, -4.620444, 1, 1, 1, 1, 1,
-0.1042749, 0.5350885, -0.3954971, 1, 1, 1, 1, 1,
-0.1004485, 0.1490082, -0.5802903, 1, 1, 1, 1, 1,
-0.09838588, 1.461987, -1.374405, 0, 0, 1, 1, 1,
-0.09430464, -0.1386128, -2.624765, 1, 0, 0, 1, 1,
-0.09083302, -1.264594, -4.498153, 1, 0, 0, 1, 1,
-0.08699118, -0.5576986, -3.002818, 1, 0, 0, 1, 1,
-0.08272403, 0.4919587, -0.1721422, 1, 0, 0, 1, 1,
-0.08143254, 0.8612819, 0.3205644, 1, 0, 0, 1, 1,
-0.07741364, -0.1106683, -1.632634, 0, 0, 0, 1, 1,
-0.07590931, 0.290258, -1.323892, 0, 0, 0, 1, 1,
-0.07418887, -0.2603624, -2.219494, 0, 0, 0, 1, 1,
-0.07233576, -0.7561979, -2.54538, 0, 0, 0, 1, 1,
-0.07076611, -0.1462166, -3.653002, 0, 0, 0, 1, 1,
-0.06409948, -0.05475064, -4.279386, 0, 0, 0, 1, 1,
-0.05974423, -1.765949, -1.907812, 0, 0, 0, 1, 1,
-0.0563681, -1.411974, -1.443294, 1, 1, 1, 1, 1,
-0.05591678, -1.060715, -2.7604, 1, 1, 1, 1, 1,
-0.05059041, -0.3345452, -3.443624, 1, 1, 1, 1, 1,
-0.04151208, -0.5919231, -3.844444, 1, 1, 1, 1, 1,
-0.04127036, -1.440205, -2.522236, 1, 1, 1, 1, 1,
-0.04039099, 0.9777123, 1.731949, 1, 1, 1, 1, 1,
-0.03570474, -0.6761407, -4.987704, 1, 1, 1, 1, 1,
-0.03539135, 0.6373019, 1.778306, 1, 1, 1, 1, 1,
-0.03079136, -1.373773, -1.549655, 1, 1, 1, 1, 1,
-0.02956609, -0.6187733, -1.759589, 1, 1, 1, 1, 1,
-0.02769123, -0.007032868, 0.4562721, 1, 1, 1, 1, 1,
-0.02763665, 0.9916247, -0.9817454, 1, 1, 1, 1, 1,
-0.02702213, 0.1661926, -1.487914, 1, 1, 1, 1, 1,
-0.0263753, -0.5601877, -1.53063, 1, 1, 1, 1, 1,
-0.02531106, 0.08663307, 1.094204, 1, 1, 1, 1, 1,
-0.01937671, 0.4898348, 0.4971865, 0, 0, 1, 1, 1,
-0.01698948, 0.7778748, -0.5803068, 1, 0, 0, 1, 1,
-0.01420383, -0.3946092, -3.904979, 1, 0, 0, 1, 1,
-0.01320136, 0.9732901, 1.193478, 1, 0, 0, 1, 1,
-0.01309468, 0.4578624, -0.7639786, 1, 0, 0, 1, 1,
-0.0125506, 0.06890053, -0.5318804, 1, 0, 0, 1, 1,
-0.008862031, 0.9954165, -1.020371, 0, 0, 0, 1, 1,
-0.008377964, 1.162797, 0.7044596, 0, 0, 0, 1, 1,
-0.006494536, 0.3668966, -1.283057, 0, 0, 0, 1, 1,
-0.005024506, 0.1596487, 2.333365, 0, 0, 0, 1, 1,
0.003202791, -0.00376478, 0.9974859, 0, 0, 0, 1, 1,
0.008670158, 0.5731021, -0.9250515, 0, 0, 0, 1, 1,
0.01581108, -1.062349, 2.503144, 0, 0, 0, 1, 1,
0.02282357, 1.21537, 0.08223554, 1, 1, 1, 1, 1,
0.02392258, -2.063863, 4.397268, 1, 1, 1, 1, 1,
0.02484879, -1.428118, 3.028994, 1, 1, 1, 1, 1,
0.02612295, 0.1144348, 0.9692772, 1, 1, 1, 1, 1,
0.0273745, 0.7463256, 1.710316, 1, 1, 1, 1, 1,
0.02922957, -0.812993, 4.160486, 1, 1, 1, 1, 1,
0.03009309, 1.281089, -0.6351119, 1, 1, 1, 1, 1,
0.03121822, -1.568773, 3.655116, 1, 1, 1, 1, 1,
0.03622943, 0.8152242, -0.7992611, 1, 1, 1, 1, 1,
0.03726405, 0.2548873, -1.534428, 1, 1, 1, 1, 1,
0.03948617, -0.342148, 2.649506, 1, 1, 1, 1, 1,
0.03983221, 0.007935552, 0.4195678, 1, 1, 1, 1, 1,
0.04493515, -0.1737908, 3.142298, 1, 1, 1, 1, 1,
0.04875878, 1.810079, -0.9588083, 1, 1, 1, 1, 1,
0.05342622, -1.141128, 3.309418, 1, 1, 1, 1, 1,
0.05373288, 0.1500161, 0.526997, 0, 0, 1, 1, 1,
0.05581945, 1.344137, -0.4007367, 1, 0, 0, 1, 1,
0.05648063, 0.5508233, -0.3360404, 1, 0, 0, 1, 1,
0.05808958, -1.006428, 1.578808, 1, 0, 0, 1, 1,
0.06224331, -1.480899, 3.1091, 1, 0, 0, 1, 1,
0.06986728, 0.851919, 0.4377698, 1, 0, 0, 1, 1,
0.07120858, 1.031607, -0.881005, 0, 0, 0, 1, 1,
0.0730269, 0.7251079, -0.3577591, 0, 0, 0, 1, 1,
0.07401356, 0.06270657, 0.4059676, 0, 0, 0, 1, 1,
0.07692126, -0.7046256, 0.5037515, 0, 0, 0, 1, 1,
0.07765864, 0.4826358, -0.03691889, 0, 0, 0, 1, 1,
0.07947688, -0.5639518, 4.117173, 0, 0, 0, 1, 1,
0.08036239, 0.05323804, 0.3473701, 0, 0, 0, 1, 1,
0.08215908, 1.708963, 0.9256965, 1, 1, 1, 1, 1,
0.08544838, -1.250318, 2.03768, 1, 1, 1, 1, 1,
0.08587693, 0.7553104, -0.8231291, 1, 1, 1, 1, 1,
0.08941031, -1.026752, 4.949928, 1, 1, 1, 1, 1,
0.09190585, 0.05012614, 1.111229, 1, 1, 1, 1, 1,
0.09239725, -1.023302, 3.572872, 1, 1, 1, 1, 1,
0.09358542, -0.1001248, 2.446469, 1, 1, 1, 1, 1,
0.09373403, -1.160464, 4.125898, 1, 1, 1, 1, 1,
0.0992858, 0.5394377, -1.015746, 1, 1, 1, 1, 1,
0.0997392, -0.4991088, 2.039284, 1, 1, 1, 1, 1,
0.1005793, 0.5590358, -0.6498585, 1, 1, 1, 1, 1,
0.1007073, 0.583043, 0.1292508, 1, 1, 1, 1, 1,
0.1018262, -0.698844, 3.023018, 1, 1, 1, 1, 1,
0.1043919, 0.351174, -0.8173796, 1, 1, 1, 1, 1,
0.1059996, -1.160653, 3.801211, 1, 1, 1, 1, 1,
0.1066332, -1.827074, 2.889702, 0, 0, 1, 1, 1,
0.1096668, 0.6312288, -0.3266954, 1, 0, 0, 1, 1,
0.1098158, -1.374215, 2.130124, 1, 0, 0, 1, 1,
0.1118258, 0.7401371, 0.7868083, 1, 0, 0, 1, 1,
0.1121607, -0.4126625, 3.128497, 1, 0, 0, 1, 1,
0.1132745, -1.002336, 3.377454, 1, 0, 0, 1, 1,
0.1138292, -0.3793239, 2.593147, 0, 0, 0, 1, 1,
0.1143716, 0.9288104, -0.2378823, 0, 0, 0, 1, 1,
0.1258428, -1.998395, 1.833719, 0, 0, 0, 1, 1,
0.128604, -0.4483928, 2.456986, 0, 0, 0, 1, 1,
0.1309929, 1.306746, 1.683042, 0, 0, 0, 1, 1,
0.1353522, 0.3412092, 0.7638771, 0, 0, 0, 1, 1,
0.1399975, -0.725099, 2.925906, 0, 0, 0, 1, 1,
0.1426737, -0.7900261, 2.481812, 1, 1, 1, 1, 1,
0.1492767, 0.3187633, -0.7339879, 1, 1, 1, 1, 1,
0.1496122, -0.4991874, 1.137847, 1, 1, 1, 1, 1,
0.1520244, -0.3074827, 2.865075, 1, 1, 1, 1, 1,
0.1534717, -0.714074, 4.685534, 1, 1, 1, 1, 1,
0.1537703, -0.477746, 4.360174, 1, 1, 1, 1, 1,
0.1553922, -0.5411123, 1.61116, 1, 1, 1, 1, 1,
0.1566007, -0.0909785, 0.8437993, 1, 1, 1, 1, 1,
0.1568477, -0.3811575, 1.481194, 1, 1, 1, 1, 1,
0.15956, 0.3998349, 0.2298734, 1, 1, 1, 1, 1,
0.1601224, -0.02949435, 3.603636, 1, 1, 1, 1, 1,
0.1604999, 0.7960987, 0.02045494, 1, 1, 1, 1, 1,
0.1630751, -0.004162292, 1.490276, 1, 1, 1, 1, 1,
0.1642619, 0.6757769, 0.3944834, 1, 1, 1, 1, 1,
0.164582, -1.148417, 2.97848, 1, 1, 1, 1, 1,
0.1653062, -0.7832034, 2.791826, 0, 0, 1, 1, 1,
0.1667337, 0.5358067, -0.5771188, 1, 0, 0, 1, 1,
0.1672457, -0.3086509, 5.255577, 1, 0, 0, 1, 1,
0.1712732, -1.496362, 2.73463, 1, 0, 0, 1, 1,
0.1733357, 1.186379, 1.282056, 1, 0, 0, 1, 1,
0.1740072, 0.9519968, 2.633286, 1, 0, 0, 1, 1,
0.1750014, -0.3429604, 2.270198, 0, 0, 0, 1, 1,
0.1750723, -0.3218077, 2.296005, 0, 0, 0, 1, 1,
0.1790338, -1.964914, 2.468909, 0, 0, 0, 1, 1,
0.185887, -1.531707, 2.99894, 0, 0, 0, 1, 1,
0.1912272, 1.373932, 0.4315447, 0, 0, 0, 1, 1,
0.1929617, -0.0922719, 2.804428, 0, 0, 0, 1, 1,
0.2005138, 0.8551404, 1.7664, 0, 0, 0, 1, 1,
0.2011504, 0.7983882, 1.695306, 1, 1, 1, 1, 1,
0.204517, -1.126339, 2.136927, 1, 1, 1, 1, 1,
0.2110376, -0.463246, 1.756033, 1, 1, 1, 1, 1,
0.211255, 0.3413525, 0.1843622, 1, 1, 1, 1, 1,
0.2114359, -1.14965, 2.69104, 1, 1, 1, 1, 1,
0.2131093, -0.03269821, 1.38596, 1, 1, 1, 1, 1,
0.2180224, 0.7795628, 0.4454939, 1, 1, 1, 1, 1,
0.2216525, -1.171077, 3.115479, 1, 1, 1, 1, 1,
0.2227949, 0.2905889, 0.8424057, 1, 1, 1, 1, 1,
0.2235634, -0.4405201, 1.545864, 1, 1, 1, 1, 1,
0.2260766, -0.6789582, 0.8213006, 1, 1, 1, 1, 1,
0.2355861, -0.304238, 1.102482, 1, 1, 1, 1, 1,
0.237539, 0.5108427, -0.543833, 1, 1, 1, 1, 1,
0.2404719, -1.006334, 2.004806, 1, 1, 1, 1, 1,
0.2425751, 0.2388763, 0.7856192, 1, 1, 1, 1, 1,
0.2442448, 0.3826096, 0.6379418, 0, 0, 1, 1, 1,
0.2467993, -0.9451627, 1.479927, 1, 0, 0, 1, 1,
0.2480409, 1.439267, -0.5344678, 1, 0, 0, 1, 1,
0.2500094, 1.645853, 1.35095, 1, 0, 0, 1, 1,
0.2511199, -0.7426339, 1.389391, 1, 0, 0, 1, 1,
0.2539662, 1.023259, 0.8851533, 1, 0, 0, 1, 1,
0.2550407, 0.9695873, -0.6757165, 0, 0, 0, 1, 1,
0.2566834, 0.1911487, 0.5603425, 0, 0, 0, 1, 1,
0.2571549, 0.7922532, -0.9621064, 0, 0, 0, 1, 1,
0.2595101, 0.3084109, 1.189002, 0, 0, 0, 1, 1,
0.2661344, 0.4361724, 1.236884, 0, 0, 0, 1, 1,
0.2741276, 1.157694, -0.2237333, 0, 0, 0, 1, 1,
0.2743891, -1.959748, 3.188051, 0, 0, 0, 1, 1,
0.2758838, 1.00024, 0.1191198, 1, 1, 1, 1, 1,
0.282727, -0.9531247, 3.419674, 1, 1, 1, 1, 1,
0.2841068, -1.325141, 2.798288, 1, 1, 1, 1, 1,
0.2867305, 0.1954256, 2.416233, 1, 1, 1, 1, 1,
0.2892137, 1.40646, 0.8379769, 1, 1, 1, 1, 1,
0.2897045, -0.5819264, 3.114385, 1, 1, 1, 1, 1,
0.291032, -1.009042, 3.445966, 1, 1, 1, 1, 1,
0.2919485, 0.1142888, 1.678108, 1, 1, 1, 1, 1,
0.2945339, 0.8603032, 1.019964, 1, 1, 1, 1, 1,
0.2956421, -1.327121, 3.534065, 1, 1, 1, 1, 1,
0.3010689, 0.6300222, -0.159742, 1, 1, 1, 1, 1,
0.3053192, -0.4141464, 1.835549, 1, 1, 1, 1, 1,
0.3057301, 1.046118, -1.734434, 1, 1, 1, 1, 1,
0.3087769, 2.193625, 0.4929959, 1, 1, 1, 1, 1,
0.3139078, 0.5174285, 1.42381, 1, 1, 1, 1, 1,
0.3140105, 1.201613, 1.11253, 0, 0, 1, 1, 1,
0.3141266, 0.3444081, 1.674521, 1, 0, 0, 1, 1,
0.3181826, -0.524864, 2.976553, 1, 0, 0, 1, 1,
0.3185601, -1.180897, 2.593724, 1, 0, 0, 1, 1,
0.3200718, -0.7358531, 4.174016, 1, 0, 0, 1, 1,
0.3226883, -0.2723106, 1.532928, 1, 0, 0, 1, 1,
0.3284582, 1.106648, 1.437043, 0, 0, 0, 1, 1,
0.3288243, 0.1550029, 0.1610223, 0, 0, 0, 1, 1,
0.3299771, -0.243013, 2.908673, 0, 0, 0, 1, 1,
0.3334011, -1.530824, 1.401333, 0, 0, 0, 1, 1,
0.3354845, -0.7924749, 3.659125, 0, 0, 0, 1, 1,
0.3355012, -0.2628774, 0.01258032, 0, 0, 0, 1, 1,
0.3366315, 0.624661, 0.3498115, 0, 0, 0, 1, 1,
0.339373, -0.2049603, 1.938879, 1, 1, 1, 1, 1,
0.3400756, 0.9727079, -2.051471, 1, 1, 1, 1, 1,
0.3429838, -1.505588, 1.395065, 1, 1, 1, 1, 1,
0.3443692, -0.6333163, 1.525447, 1, 1, 1, 1, 1,
0.3445412, -1.240735, 3.247485, 1, 1, 1, 1, 1,
0.3513385, 0.02665819, 0.8225989, 1, 1, 1, 1, 1,
0.3515059, -0.006850974, 1.245851, 1, 1, 1, 1, 1,
0.3522819, 0.3330776, 0.7714061, 1, 1, 1, 1, 1,
0.3523198, -0.7518445, 2.920811, 1, 1, 1, 1, 1,
0.355463, -3.1236, 3.098507, 1, 1, 1, 1, 1,
0.3579944, 0.5803439, 1.582565, 1, 1, 1, 1, 1,
0.3585807, -1.074314, 5.20954, 1, 1, 1, 1, 1,
0.3600542, -0.6668314, 1.726508, 1, 1, 1, 1, 1,
0.3626407, -0.2309925, 2.316741, 1, 1, 1, 1, 1,
0.363888, -1.32181, 2.507038, 1, 1, 1, 1, 1,
0.3648265, 1.788005, -0.3445326, 0, 0, 1, 1, 1,
0.3689469, -1.607097, 1.77873, 1, 0, 0, 1, 1,
0.3701521, -0.554037, 3.359703, 1, 0, 0, 1, 1,
0.3759904, 0.3740664, 0.5777991, 1, 0, 0, 1, 1,
0.3789087, 0.7182771, 2.327324, 1, 0, 0, 1, 1,
0.3809238, -0.8073605, 5.427049, 1, 0, 0, 1, 1,
0.3823071, -0.3336438, 2.071528, 0, 0, 0, 1, 1,
0.384299, 1.014597, -1.762683, 0, 0, 0, 1, 1,
0.3863627, 1.231176, 0.6850138, 0, 0, 0, 1, 1,
0.3887103, 0.2925343, 2.246516, 0, 0, 0, 1, 1,
0.3911576, -0.144162, 2.402513, 0, 0, 0, 1, 1,
0.3985443, 0.6552116, -0.04877658, 0, 0, 0, 1, 1,
0.4015633, -1.894989, 3.153871, 0, 0, 0, 1, 1,
0.40256, -0.7335449, 1.091859, 1, 1, 1, 1, 1,
0.4055906, 1.59218, -0.396027, 1, 1, 1, 1, 1,
0.4065399, 0.1047081, -0.4834432, 1, 1, 1, 1, 1,
0.4078356, -1.839877, 3.945892, 1, 1, 1, 1, 1,
0.409013, 0.5842162, -0.04492121, 1, 1, 1, 1, 1,
0.4102342, -1.378127, 1.850903, 1, 1, 1, 1, 1,
0.4128091, 0.5746197, 1.177561, 1, 1, 1, 1, 1,
0.4157018, -1.376691, 3.340459, 1, 1, 1, 1, 1,
0.4168747, 1.380662, 0.1934002, 1, 1, 1, 1, 1,
0.4171879, -1.723838, 3.484284, 1, 1, 1, 1, 1,
0.4173544, 0.2483135, 1.265457, 1, 1, 1, 1, 1,
0.4227687, -0.4350007, 2.731517, 1, 1, 1, 1, 1,
0.4242213, 2.378718, 2.347918, 1, 1, 1, 1, 1,
0.4264728, -0.1664367, 3.138191, 1, 1, 1, 1, 1,
0.4295687, -1.059929, 2.632277, 1, 1, 1, 1, 1,
0.4312505, -1.51694, 1.802951, 0, 0, 1, 1, 1,
0.4317097, 0.250801, 1.188, 1, 0, 0, 1, 1,
0.4331115, 1.544416, 0.8989345, 1, 0, 0, 1, 1,
0.4339497, -0.4949738, 2.041406, 1, 0, 0, 1, 1,
0.4383596, -1.042523, 3.934576, 1, 0, 0, 1, 1,
0.4485336, 1.530843, 1.646708, 1, 0, 0, 1, 1,
0.450893, -0.3609565, 1.746473, 0, 0, 0, 1, 1,
0.4542953, 0.7785466, -0.2468818, 0, 0, 0, 1, 1,
0.4587077, 1.499876, -0.656031, 0, 0, 0, 1, 1,
0.467697, 0.1072803, 2.368222, 0, 0, 0, 1, 1,
0.468653, -0.05999206, 0.685775, 0, 0, 0, 1, 1,
0.4688881, 1.438937, 2.847987, 0, 0, 0, 1, 1,
0.4695464, 1.201539, 0.6945489, 0, 0, 0, 1, 1,
0.4699754, -1.785086, 2.567387, 1, 1, 1, 1, 1,
0.4723858, -0.9010674, 2.863456, 1, 1, 1, 1, 1,
0.4773003, 0.6358157, -0.209512, 1, 1, 1, 1, 1,
0.4793733, -0.1773429, 0.445963, 1, 1, 1, 1, 1,
0.4809663, 1.150268, -0.5160866, 1, 1, 1, 1, 1,
0.4810612, -0.9693283, 1.821832, 1, 1, 1, 1, 1,
0.4814678, 1.373274, 1.866054, 1, 1, 1, 1, 1,
0.4815434, -0.4539385, 2.00665, 1, 1, 1, 1, 1,
0.4862109, -0.7682608, 2.111984, 1, 1, 1, 1, 1,
0.4922074, 0.4037643, 1.178863, 1, 1, 1, 1, 1,
0.4942143, 0.1341981, 0.647755, 1, 1, 1, 1, 1,
0.498413, -1.083128, 4.111142, 1, 1, 1, 1, 1,
0.5100498, -0.6061418, 0.3155783, 1, 1, 1, 1, 1,
0.5119495, 0.1164371, 2.454038, 1, 1, 1, 1, 1,
0.5146775, -0.6853892, 2.883422, 1, 1, 1, 1, 1,
0.5169435, 0.5115576, 1.313098, 0, 0, 1, 1, 1,
0.5179037, -1.586177, 3.836169, 1, 0, 0, 1, 1,
0.5210142, -0.4093365, 1.614331, 1, 0, 0, 1, 1,
0.521844, -0.7431187, 1.565088, 1, 0, 0, 1, 1,
0.5218811, -0.8317366, 2.370426, 1, 0, 0, 1, 1,
0.5226312, -2.217112, 3.1259, 1, 0, 0, 1, 1,
0.5245714, -1.816493, 3.781743, 0, 0, 0, 1, 1,
0.5250187, 0.9784872, 0.6777573, 0, 0, 0, 1, 1,
0.5282564, -0.2557989, 3.632433, 0, 0, 0, 1, 1,
0.5325606, 1.159822, -0.5706043, 0, 0, 0, 1, 1,
0.5368052, 0.2520669, 0.8792709, 0, 0, 0, 1, 1,
0.5381785, 0.1303732, 1.669669, 0, 0, 0, 1, 1,
0.538946, -0.0732568, 1.153636, 0, 0, 0, 1, 1,
0.5416663, 0.5203577, 0.8710986, 1, 1, 1, 1, 1,
0.5421453, 0.5114399, 2.488526, 1, 1, 1, 1, 1,
0.5441744, 1.711581, -0.07022362, 1, 1, 1, 1, 1,
0.5451627, 0.8672326, 0.2596631, 1, 1, 1, 1, 1,
0.5518433, 0.2385729, 2.033187, 1, 1, 1, 1, 1,
0.5525335, -0.428821, 1.180161, 1, 1, 1, 1, 1,
0.562821, 0.3235309, 0.2323674, 1, 1, 1, 1, 1,
0.5630036, -2.154709, 3.00917, 1, 1, 1, 1, 1,
0.5644699, -0.8419871, 0.2778117, 1, 1, 1, 1, 1,
0.5653962, 0.2130549, 1.935941, 1, 1, 1, 1, 1,
0.5722603, 0.0581802, 0.2076939, 1, 1, 1, 1, 1,
0.5760303, -0.2125426, 1.702627, 1, 1, 1, 1, 1,
0.5769547, -1.471226, 4.959926, 1, 1, 1, 1, 1,
0.5782635, -0.2893641, 1.991789, 1, 1, 1, 1, 1,
0.5791634, 0.2484728, 2.500038, 1, 1, 1, 1, 1,
0.5854324, 0.3545897, 0.01544437, 0, 0, 1, 1, 1,
0.5893275, -1.424877, 2.488916, 1, 0, 0, 1, 1,
0.5921078, -1.177584, 2.83645, 1, 0, 0, 1, 1,
0.5949737, -1.865562, 3.218163, 1, 0, 0, 1, 1,
0.598032, 1.353817, 0.4511302, 1, 0, 0, 1, 1,
0.6005406, -0.6629491, 0.8896133, 1, 0, 0, 1, 1,
0.6023139, -0.1976979, 1.387323, 0, 0, 0, 1, 1,
0.6037742, -1.139841, 3.616092, 0, 0, 0, 1, 1,
0.612965, 0.6947562, 1.081865, 0, 0, 0, 1, 1,
0.6165563, 1.081306, 0.2977462, 0, 0, 0, 1, 1,
0.6190063, -0.5028495, 2.214769, 0, 0, 0, 1, 1,
0.6240787, 1.09514, 0.5395355, 0, 0, 0, 1, 1,
0.6259819, 0.566522, 0.8188721, 0, 0, 0, 1, 1,
0.6294397, 1.219543, -0.4939022, 1, 1, 1, 1, 1,
0.6294738, 1.560212, 0.9682156, 1, 1, 1, 1, 1,
0.6297656, -2.331496, 4.471272, 1, 1, 1, 1, 1,
0.6300361, 0.9170447, -1.665465, 1, 1, 1, 1, 1,
0.6339318, -0.0453836, 0.1545631, 1, 1, 1, 1, 1,
0.6357592, -0.9187151, 3.807832, 1, 1, 1, 1, 1,
0.6389091, 1.972413, 0.8860451, 1, 1, 1, 1, 1,
0.6410047, -1.226504, 3.781151, 1, 1, 1, 1, 1,
0.6435202, -0.2164915, 1.593267, 1, 1, 1, 1, 1,
0.645426, 0.7545676, 1.971301, 1, 1, 1, 1, 1,
0.6593146, 1.85295, -1.060992, 1, 1, 1, 1, 1,
0.6593269, 0.5271837, 1.578974, 1, 1, 1, 1, 1,
0.6619142, 1.479641, 1.854017, 1, 1, 1, 1, 1,
0.6716779, 1.085667, 1.997318, 1, 1, 1, 1, 1,
0.6733849, 2.049094, 0.4147284, 1, 1, 1, 1, 1,
0.6763127, 0.588862, -0.3429007, 0, 0, 1, 1, 1,
0.6768367, -2.236023, 4.839924, 1, 0, 0, 1, 1,
0.6794238, 0.499959, 1.918929, 1, 0, 0, 1, 1,
0.6869264, 0.2640506, 1.465637, 1, 0, 0, 1, 1,
0.693682, 0.854976, 1.751363, 1, 0, 0, 1, 1,
0.6940663, -1.156189, 1.986221, 1, 0, 0, 1, 1,
0.6991529, -0.9301125, 0.8762329, 0, 0, 0, 1, 1,
0.7007706, 0.925086, 0.7476034, 0, 0, 0, 1, 1,
0.7017026, 1.504658, 1.03791, 0, 0, 0, 1, 1,
0.7068126, 0.2402831, 1.443973, 0, 0, 0, 1, 1,
0.7068359, 0.1679682, 2.81211, 0, 0, 0, 1, 1,
0.7079374, 1.00869, 0.03391352, 0, 0, 0, 1, 1,
0.7174317, -1.108475, 3.280169, 0, 0, 0, 1, 1,
0.7181738, 0.5865009, 1.035304, 1, 1, 1, 1, 1,
0.7216049, 0.4266476, -1.1214, 1, 1, 1, 1, 1,
0.7284368, -1.162485, 2.302021, 1, 1, 1, 1, 1,
0.7353332, -1.302694, 1.820925, 1, 1, 1, 1, 1,
0.7396675, 1.018222, -1.112007, 1, 1, 1, 1, 1,
0.7411388, 1.080621, -0.9940948, 1, 1, 1, 1, 1,
0.7419085, -1.422587, 2.568882, 1, 1, 1, 1, 1,
0.7424924, -1.713644, 4.322733, 1, 1, 1, 1, 1,
0.7426275, -1.364841, 3.209017, 1, 1, 1, 1, 1,
0.7433312, 0.004349974, 1.48469, 1, 1, 1, 1, 1,
0.7435788, 1.648719, 2.179819, 1, 1, 1, 1, 1,
0.7438759, 1.237591, 0.5455051, 1, 1, 1, 1, 1,
0.7489995, 0.1032816, -0.08291772, 1, 1, 1, 1, 1,
0.7490606, -1.076395, 3.160573, 1, 1, 1, 1, 1,
0.7505011, 0.5894816, 0.8311764, 1, 1, 1, 1, 1,
0.7531778, -0.6199059, 3.505074, 0, 0, 1, 1, 1,
0.7539406, -0.8431669, 3.041544, 1, 0, 0, 1, 1,
0.7560806, 0.07634518, 2.459244, 1, 0, 0, 1, 1,
0.7574329, 0.5757338, 1.668354, 1, 0, 0, 1, 1,
0.7638939, 0.9381763, 0.1947428, 1, 0, 0, 1, 1,
0.7655743, 0.3130157, 0.0009074281, 1, 0, 0, 1, 1,
0.7695728, 0.8271589, -0.1824975, 0, 0, 0, 1, 1,
0.7718818, 0.9239013, 1.084273, 0, 0, 0, 1, 1,
0.7724485, -1.021503, 2.106341, 0, 0, 0, 1, 1,
0.7769455, -7.798757e-05, 2.903177, 0, 0, 0, 1, 1,
0.7783381, 1.15564, -0.1056923, 0, 0, 0, 1, 1,
0.7789831, -1.147591, 2.851466, 0, 0, 0, 1, 1,
0.7821297, -0.1603171, 2.419191, 0, 0, 0, 1, 1,
0.7823258, 0.3158035, -0.1307152, 1, 1, 1, 1, 1,
0.7830494, -1.96693, 2.529634, 1, 1, 1, 1, 1,
0.7834568, 1.674823, 0.9035385, 1, 1, 1, 1, 1,
0.7837864, 0.4995371, 2.235442, 1, 1, 1, 1, 1,
0.784679, -0.6032974, 3.862122, 1, 1, 1, 1, 1,
0.786567, 0.7087466, 2.435598, 1, 1, 1, 1, 1,
0.7941277, -0.6315255, 1.408118, 1, 1, 1, 1, 1,
0.8006162, -0.9042289, 2.716811, 1, 1, 1, 1, 1,
0.8064086, -0.3238682, 0.4442304, 1, 1, 1, 1, 1,
0.8111013, 1.216762, 1.318284, 1, 1, 1, 1, 1,
0.8116413, -0.1977326, 2.081985, 1, 1, 1, 1, 1,
0.8152714, -0.6502597, 1.018962, 1, 1, 1, 1, 1,
0.8152802, 2.480604, 0.3032103, 1, 1, 1, 1, 1,
0.8233164, 2.332999, -1.129544, 1, 1, 1, 1, 1,
0.8243155, -0.770241, 2.439504, 1, 1, 1, 1, 1,
0.8310459, -0.3681922, 0.1744017, 0, 0, 1, 1, 1,
0.8311635, 0.7198467, 1.170901, 1, 0, 0, 1, 1,
0.8433123, -1.22598, 2.86811, 1, 0, 0, 1, 1,
0.8448319, -0.09842789, 0.7617027, 1, 0, 0, 1, 1,
0.8477779, 0.6857902, 0.8543868, 1, 0, 0, 1, 1,
0.8479962, 1.815135, 1.177526, 1, 0, 0, 1, 1,
0.8681908, -0.3154793, -0.0001611801, 0, 0, 0, 1, 1,
0.8721657, -0.4018549, 2.300207, 0, 0, 0, 1, 1,
0.8811244, 1.771716, 0.6128444, 0, 0, 0, 1, 1,
0.8813248, -0.001340372, 2.041786, 0, 0, 0, 1, 1,
0.8834347, 0.6567914, 2.331339, 0, 0, 0, 1, 1,
0.8922843, 1.091786, 0.824531, 0, 0, 0, 1, 1,
0.8989746, 2.594044, -0.3734021, 0, 0, 0, 1, 1,
0.9038627, 0.2683642, -0.1229078, 1, 1, 1, 1, 1,
0.904878, 2.807195, -1.770267, 1, 1, 1, 1, 1,
0.9106737, -0.03851813, 2.073831, 1, 1, 1, 1, 1,
0.9107947, -0.3028682, 0.8492723, 1, 1, 1, 1, 1,
0.9125839, -2.124892, 3.397908, 1, 1, 1, 1, 1,
0.9129554, -0.3644065, 1.365447, 1, 1, 1, 1, 1,
0.922943, 1.959537, -0.06818178, 1, 1, 1, 1, 1,
0.9346483, -0.6811035, 0.6010581, 1, 1, 1, 1, 1,
0.9350953, -1.036448, 3.093522, 1, 1, 1, 1, 1,
0.943596, 1.346884, 0.8400519, 1, 1, 1, 1, 1,
0.950634, 0.3201939, -1.111705, 1, 1, 1, 1, 1,
0.9519884, -1.085314, 1.116104, 1, 1, 1, 1, 1,
0.9525247, -0.1258957, 1.79153, 1, 1, 1, 1, 1,
0.9704821, -0.05133146, 2.261139, 1, 1, 1, 1, 1,
0.9722714, -1.06765, 1.369131, 1, 1, 1, 1, 1,
0.974554, 0.5435688, -0.4179726, 0, 0, 1, 1, 1,
0.9819696, -0.1158046, 1.229275, 1, 0, 0, 1, 1,
0.9953367, 0.1288496, 1.944977, 1, 0, 0, 1, 1,
0.9991075, -1.092477, 2.255323, 1, 0, 0, 1, 1,
1.00142, -1.267839, 3.22478, 1, 0, 0, 1, 1,
1.005356, 0.1148635, 1.204084, 1, 0, 0, 1, 1,
1.006214, 1.071103, 1.218989, 0, 0, 0, 1, 1,
1.011222, -1.171048, 1.62026, 0, 0, 0, 1, 1,
1.011906, 1.121734, 0.4524323, 0, 0, 0, 1, 1,
1.019324, -0.5880177, 0.9976984, 0, 0, 0, 1, 1,
1.02132, -0.225866, -0.8565069, 0, 0, 0, 1, 1,
1.026211, -0.941148, 0.6100059, 0, 0, 0, 1, 1,
1.027955, 0.4991827, 0.06963889, 0, 0, 0, 1, 1,
1.028762, -0.2784543, 3.262077, 1, 1, 1, 1, 1,
1.038482, -1.028263, 4.836186, 1, 1, 1, 1, 1,
1.042582, -1.035671, 2.218919, 1, 1, 1, 1, 1,
1.044312, -0.8787417, 2.417777, 1, 1, 1, 1, 1,
1.050391, -0.7781819, 2.27059, 1, 1, 1, 1, 1,
1.051884, 1.550115, -1.360599, 1, 1, 1, 1, 1,
1.053477, 0.8464754, 1.856039, 1, 1, 1, 1, 1,
1.061734, -1.292884, 2.889184, 1, 1, 1, 1, 1,
1.068766, 1.253645, 0.1627895, 1, 1, 1, 1, 1,
1.072165, -0.5931925, 3.926865, 1, 1, 1, 1, 1,
1.077062, -0.2321992, 1.454707, 1, 1, 1, 1, 1,
1.084004, -0.7714553, 2.681599, 1, 1, 1, 1, 1,
1.08512, 0.295611, 1.888747, 1, 1, 1, 1, 1,
1.085447, 1.723503, 0.1719373, 1, 1, 1, 1, 1,
1.092747, 0.8627696, 0.4037478, 1, 1, 1, 1, 1,
1.094409, 2.277751, -0.1733845, 0, 0, 1, 1, 1,
1.095659, 0.849368, 0.9530932, 1, 0, 0, 1, 1,
1.100745, -0.1406492, -0.9293478, 1, 0, 0, 1, 1,
1.111589, -0.4790216, 0.4904034, 1, 0, 0, 1, 1,
1.11572, 0.1849878, 0.9882244, 1, 0, 0, 1, 1,
1.129902, 0.1419171, 0.8990641, 1, 0, 0, 1, 1,
1.133267, -1.859079, 1.862583, 0, 0, 0, 1, 1,
1.137036, -0.3831835, 2.070834, 0, 0, 0, 1, 1,
1.14808, 0.7302354, 0.1335278, 0, 0, 0, 1, 1,
1.148479, -1.275436, 0.9625745, 0, 0, 0, 1, 1,
1.149586, -1.42664, 1.169354, 0, 0, 0, 1, 1,
1.152997, -0.2375235, 0.6161876, 0, 0, 0, 1, 1,
1.161445, 1.45137, 0.9168192, 0, 0, 0, 1, 1,
1.176915, -0.4992311, 2.525278, 1, 1, 1, 1, 1,
1.180136, -1.634993, 3.74064, 1, 1, 1, 1, 1,
1.180769, 2.350783, 0.5040809, 1, 1, 1, 1, 1,
1.181633, 0.2959301, 3.461562, 1, 1, 1, 1, 1,
1.187333, 0.206138, 2.218395, 1, 1, 1, 1, 1,
1.189384, 0.5683255, 1.052572, 1, 1, 1, 1, 1,
1.198777, -2.221343, 0.8178869, 1, 1, 1, 1, 1,
1.199974, -0.2966453, 2.905211, 1, 1, 1, 1, 1,
1.200767, 2.206906, 1.108309, 1, 1, 1, 1, 1,
1.20252, 0.6468138, 1.046721, 1, 1, 1, 1, 1,
1.20552, -0.02833783, 1.898534, 1, 1, 1, 1, 1,
1.218743, 0.108634, 1.244356, 1, 1, 1, 1, 1,
1.220934, 0.8921862, 0.1298681, 1, 1, 1, 1, 1,
1.230783, 0.3687984, 2.01942, 1, 1, 1, 1, 1,
1.232684, -0.4469761, 2.030884, 1, 1, 1, 1, 1,
1.238746, 0.8255085, 1.086806, 0, 0, 1, 1, 1,
1.243755, 0.885934, 2.399001, 1, 0, 0, 1, 1,
1.246454, -0.396904, 0.4272016, 1, 0, 0, 1, 1,
1.263853, -1.092635, 2.465729, 1, 0, 0, 1, 1,
1.266016, -0.7598147, 2.437491, 1, 0, 0, 1, 1,
1.269878, -0.517196, 2.405259, 1, 0, 0, 1, 1,
1.2727, 1.19109, 1.835629, 0, 0, 0, 1, 1,
1.276406, 1.251317, -0.8569473, 0, 0, 0, 1, 1,
1.281802, 0.368686, -0.0255237, 0, 0, 0, 1, 1,
1.286511, 0.4491581, 1.067537, 0, 0, 0, 1, 1,
1.291089, 0.534825, -0.2443389, 0, 0, 0, 1, 1,
1.297159, 0.287931, -0.09029207, 0, 0, 0, 1, 1,
1.298012, 0.03019151, 1.618164, 0, 0, 0, 1, 1,
1.300421, 1.160717, 0.6484958, 1, 1, 1, 1, 1,
1.302953, -0.7565485, 2.309627, 1, 1, 1, 1, 1,
1.328868, -0.6638776, 1.84433, 1, 1, 1, 1, 1,
1.330732, -0.5878484, 1.608126, 1, 1, 1, 1, 1,
1.332107, -0.101567, 2.16515, 1, 1, 1, 1, 1,
1.339529, 0.6143534, 1.043939, 1, 1, 1, 1, 1,
1.35103, 0.7057469, -0.2940878, 1, 1, 1, 1, 1,
1.356585, -0.6158794, 3.587404, 1, 1, 1, 1, 1,
1.358081, -0.9413767, 2.254998, 1, 1, 1, 1, 1,
1.385223, -0.345906, 0.5211611, 1, 1, 1, 1, 1,
1.385436, -0.6295218, 1.352989, 1, 1, 1, 1, 1,
1.388433, -1.452835, 2.577957, 1, 1, 1, 1, 1,
1.404669, -0.5468096, -0.09070831, 1, 1, 1, 1, 1,
1.411599, 1.26661, 1.423126, 1, 1, 1, 1, 1,
1.417706, 2.878767, -0.188273, 1, 1, 1, 1, 1,
1.426942, -0.6573715, 1.060855, 0, 0, 1, 1, 1,
1.429717, -1.553509, 2.163328, 1, 0, 0, 1, 1,
1.43093, -1.24561, 3.010022, 1, 0, 0, 1, 1,
1.43401, 1.30365, 1.516303, 1, 0, 0, 1, 1,
1.443221, 2.037313, 0.5644782, 1, 0, 0, 1, 1,
1.446046, 1.696663, 1.331667, 1, 0, 0, 1, 1,
1.448148, 0.1977389, 0.240127, 0, 0, 0, 1, 1,
1.465752, 0.4861155, 1.554849, 0, 0, 0, 1, 1,
1.472382, -0.6206838, 1.212937, 0, 0, 0, 1, 1,
1.473876, -0.2121648, 1.21636, 0, 0, 0, 1, 1,
1.47648, -0.275213, 2.603845, 0, 0, 0, 1, 1,
1.492427, -0.5808977, 2.696438, 0, 0, 0, 1, 1,
1.497814, -2.559614, 2.711698, 0, 0, 0, 1, 1,
1.515175, 1.218882, 0.5600671, 1, 1, 1, 1, 1,
1.522733, 1.059751, 1.229574, 1, 1, 1, 1, 1,
1.546278, -0.6723455, 1.820469, 1, 1, 1, 1, 1,
1.548044, -0.5656413, 2.157122, 1, 1, 1, 1, 1,
1.5572, 0.3782934, 1.590657, 1, 1, 1, 1, 1,
1.557713, -1.322705, 2.940456, 1, 1, 1, 1, 1,
1.570857, -1.374391, 1.690643, 1, 1, 1, 1, 1,
1.57324, 0.3785389, 3.384465, 1, 1, 1, 1, 1,
1.577993, -0.296855, 0.5191938, 1, 1, 1, 1, 1,
1.5913, -0.4670748, 3.449879, 1, 1, 1, 1, 1,
1.597724, 0.0678964, 2.576499, 1, 1, 1, 1, 1,
1.601734, 1.003605, -0.7883588, 1, 1, 1, 1, 1,
1.611777, -0.969336, 0.9298659, 1, 1, 1, 1, 1,
1.61665, -1.220182, 3.013343, 1, 1, 1, 1, 1,
1.617009, -0.4926038, 2.828768, 1, 1, 1, 1, 1,
1.642745, -0.5265359, 1.479099, 0, 0, 1, 1, 1,
1.648213, -1.348142, 3.392768, 1, 0, 0, 1, 1,
1.651816, -0.2536814, 2.745536, 1, 0, 0, 1, 1,
1.656735, 1.591627, -1.118776, 1, 0, 0, 1, 1,
1.658143, 0.7306115, 1.937608, 1, 0, 0, 1, 1,
1.693973, 0.8177558, 1.400237, 1, 0, 0, 1, 1,
1.721549, 0.6811946, 1.258979, 0, 0, 0, 1, 1,
1.732792, 1.122402, 0.7615998, 0, 0, 0, 1, 1,
1.74473, 2.233089, 0.4028484, 0, 0, 0, 1, 1,
1.783455, 0.5004656, -0.3207284, 0, 0, 0, 1, 1,
1.790952, 0.4519155, 1.010816, 0, 0, 0, 1, 1,
1.791401, -0.0232923, 1.997288, 0, 0, 0, 1, 1,
1.792625, 0.05899755, 2.183379, 0, 0, 0, 1, 1,
1.794695, 0.03680364, 1.242837, 1, 1, 1, 1, 1,
1.850557, -0.2912461, -0.1450108, 1, 1, 1, 1, 1,
1.852376, -0.2007532, 2.501884, 1, 1, 1, 1, 1,
1.858654, -0.1188034, 1.829421, 1, 1, 1, 1, 1,
1.874971, -0.9879367, 2.109881, 1, 1, 1, 1, 1,
1.888399, -1.008245, 2.135767, 1, 1, 1, 1, 1,
1.897187, -1.575855, 1.669909, 1, 1, 1, 1, 1,
1.902819, 0.4942762, 1.659351, 1, 1, 1, 1, 1,
1.918511, -0.845162, 0.9657249, 1, 1, 1, 1, 1,
1.935862, 0.07396196, 1.881881, 1, 1, 1, 1, 1,
1.941988, -0.3977444, 1.974219, 1, 1, 1, 1, 1,
1.955081, 0.4537872, 1.325149, 1, 1, 1, 1, 1,
1.961447, -0.7902266, 1.043164, 1, 1, 1, 1, 1,
1.973911, 0.6359649, 2.308672, 1, 1, 1, 1, 1,
1.99325, 0.1975037, 1.207913, 1, 1, 1, 1, 1,
2.014614, 0.07369462, 0.6009791, 0, 0, 1, 1, 1,
2.045303, 1.613655, -0.1824816, 1, 0, 0, 1, 1,
2.065419, -0.9351413, 2.955425, 1, 0, 0, 1, 1,
2.161635, 1.121916, 1.29748, 1, 0, 0, 1, 1,
2.191774, 1.255762, 2.805027, 1, 0, 0, 1, 1,
2.201291, 1.81422, -0.5530883, 1, 0, 0, 1, 1,
2.237168, -0.2489499, 4.771102, 0, 0, 0, 1, 1,
2.350767, 0.03514052, 2.082224, 0, 0, 0, 1, 1,
2.383622, 0.9936178, 2.479439, 0, 0, 0, 1, 1,
2.391265, 0.7355967, 0.09536103, 0, 0, 0, 1, 1,
2.391384, -1.290469, 3.215119, 0, 0, 0, 1, 1,
2.414323, -0.8021481, 2.12195, 0, 0, 0, 1, 1,
2.42544, -0.3742769, 1.215022, 0, 0, 0, 1, 1,
2.456785, -1.379812, 3.633186, 1, 1, 1, 1, 1,
2.62368, 0.1597196, 1.25732, 1, 1, 1, 1, 1,
2.683542, 0.2224106, 1.887144, 1, 1, 1, 1, 1,
2.778068, 0.4275633, 1.694464, 1, 1, 1, 1, 1,
2.786108, 0.3819473, 1.796119, 1, 1, 1, 1, 1,
3.455667, 1.281124, 0.9020961, 1, 1, 1, 1, 1,
4.584491, 0.473693, 3.012326, 1, 1, 1, 1, 1
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
var radius = 10.16229;
var distance = 35.69461;
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
mvMatrix.translate( -0.706795, -0.01228476, 0.210099 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.69461);
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
