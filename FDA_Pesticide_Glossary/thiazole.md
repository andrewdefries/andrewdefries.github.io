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
-2.852158, -0.8944687, -2.126225, 1, 0, 0, 1,
-2.70946, 0.07879768, -1.399447, 1, 0.007843138, 0, 1,
-2.581809, 0.4130112, -3.119865, 1, 0.01176471, 0, 1,
-2.535805, -2.290765, -3.160215, 1, 0.01960784, 0, 1,
-2.497698, -0.3840876, -2.951766, 1, 0.02352941, 0, 1,
-2.441953, -1.684557, -2.153721, 1, 0.03137255, 0, 1,
-2.395291, -0.9437875, -2.56061, 1, 0.03529412, 0, 1,
-2.365542, -0.5698848, -3.707605, 1, 0.04313726, 0, 1,
-2.293265, -1.563948, -1.693997, 1, 0.04705882, 0, 1,
-2.292688, 0.008053185, -2.282288, 1, 0.05490196, 0, 1,
-2.272757, 0.8982512, 0.1165532, 1, 0.05882353, 0, 1,
-2.226294, -0.9151759, -2.057356, 1, 0.06666667, 0, 1,
-2.209527, -0.5985407, -0.2803686, 1, 0.07058824, 0, 1,
-2.187782, -0.09616236, -0.3648215, 1, 0.07843138, 0, 1,
-2.125736, -0.5808254, -1.499936, 1, 0.08235294, 0, 1,
-2.105978, -1.217062, -1.809851, 1, 0.09019608, 0, 1,
-2.077885, -0.1050505, -0.122424, 1, 0.09411765, 0, 1,
-2.066649, -1.878394, -2.619138, 1, 0.1019608, 0, 1,
-2.047497, -0.8369952, -3.33777, 1, 0.1098039, 0, 1,
-2.038603, -1.714308, -2.854833, 1, 0.1137255, 0, 1,
-2.027786, -0.04521043, -1.486163, 1, 0.1215686, 0, 1,
-2.024441, 0.03325359, -1.17482, 1, 0.1254902, 0, 1,
-2.023017, -1.858075, -3.433499, 1, 0.1333333, 0, 1,
-2.022628, -1.297567, -2.319636, 1, 0.1372549, 0, 1,
-2.012184, 0.2114433, -1.02905, 1, 0.145098, 0, 1,
-1.997425, -0.3676759, -2.008556, 1, 0.1490196, 0, 1,
-1.976558, -0.007692151, -3.481426, 1, 0.1568628, 0, 1,
-1.95264, -0.2267572, -1.200173, 1, 0.1607843, 0, 1,
-1.943187, 0.2254426, -0.6016417, 1, 0.1686275, 0, 1,
-1.942269, 1.236242, -0.4425973, 1, 0.172549, 0, 1,
-1.919065, 0.3477358, -2.093763, 1, 0.1803922, 0, 1,
-1.916934, -0.7750368, -1.871648, 1, 0.1843137, 0, 1,
-1.91423, 0.2473427, -1.333653, 1, 0.1921569, 0, 1,
-1.856587, 1.609541, 0.4527236, 1, 0.1960784, 0, 1,
-1.856531, -0.5169798, -0.823611, 1, 0.2039216, 0, 1,
-1.827769, 1.46167, -1.037286, 1, 0.2117647, 0, 1,
-1.82332, -0.2568673, 0.003725522, 1, 0.2156863, 0, 1,
-1.811693, -0.005217742, -3.05662, 1, 0.2235294, 0, 1,
-1.802423, 0.2469008, -0.4662329, 1, 0.227451, 0, 1,
-1.802272, -0.7074991, -2.927727, 1, 0.2352941, 0, 1,
-1.789488, -0.8568884, -1.699462, 1, 0.2392157, 0, 1,
-1.773638, -0.2010498, -0.7773091, 1, 0.2470588, 0, 1,
-1.757378, -0.3633132, -2.301993, 1, 0.2509804, 0, 1,
-1.750362, -0.7956498, -2.152753, 1, 0.2588235, 0, 1,
-1.734175, 0.1461388, -1.634988, 1, 0.2627451, 0, 1,
-1.717944, 0.8016219, -0.167529, 1, 0.2705882, 0, 1,
-1.71728, 0.2920357, -2.314961, 1, 0.2745098, 0, 1,
-1.702149, 2.086539, 0.1923876, 1, 0.282353, 0, 1,
-1.696126, 0.3144218, -1.082453, 1, 0.2862745, 0, 1,
-1.695716, -0.5790884, -1.432, 1, 0.2941177, 0, 1,
-1.679823, 0.1421971, -3.220174, 1, 0.3019608, 0, 1,
-1.664993, -1.075252, -3.143614, 1, 0.3058824, 0, 1,
-1.657635, 0.6289064, -2.091805, 1, 0.3137255, 0, 1,
-1.651417, -0.340544, -1.728104, 1, 0.3176471, 0, 1,
-1.616887, -0.9545226, -1.600289, 1, 0.3254902, 0, 1,
-1.610162, 0.301641, -0.8649242, 1, 0.3294118, 0, 1,
-1.590639, 0.9584268, -1.872149, 1, 0.3372549, 0, 1,
-1.579697, 0.9888507, -1.049311, 1, 0.3411765, 0, 1,
-1.575889, -0.8166044, -0.2528723, 1, 0.3490196, 0, 1,
-1.568033, 0.7791621, -0.8188791, 1, 0.3529412, 0, 1,
-1.561685, -0.6212378, -2.841389, 1, 0.3607843, 0, 1,
-1.549899, 0.3744539, -0.4072053, 1, 0.3647059, 0, 1,
-1.548753, -1.737216, -1.892416, 1, 0.372549, 0, 1,
-1.534321, -0.1885199, -1.410865, 1, 0.3764706, 0, 1,
-1.521953, 3.657746, 0.7747068, 1, 0.3843137, 0, 1,
-1.504101, 0.4050894, 0.512632, 1, 0.3882353, 0, 1,
-1.500133, -0.1768196, -1.33188, 1, 0.3960784, 0, 1,
-1.496128, 1.350429, -0.8067341, 1, 0.4039216, 0, 1,
-1.489673, 0.4033174, -0.7872077, 1, 0.4078431, 0, 1,
-1.479638, -1.347055, -2.155315, 1, 0.4156863, 0, 1,
-1.46748, -0.4262926, -1.165342, 1, 0.4196078, 0, 1,
-1.46699, -0.3420738, -1.024424, 1, 0.427451, 0, 1,
-1.466508, -0.1297306, -1.915803, 1, 0.4313726, 0, 1,
-1.462787, -0.4619943, -1.506775, 1, 0.4392157, 0, 1,
-1.458184, 0.9870545, -0.313188, 1, 0.4431373, 0, 1,
-1.451623, -0.1397699, -2.482205, 1, 0.4509804, 0, 1,
-1.447052, 0.4401301, -1.748605, 1, 0.454902, 0, 1,
-1.44673, 0.1461913, -1.862769, 1, 0.4627451, 0, 1,
-1.441853, -1.974441, -1.207938, 1, 0.4666667, 0, 1,
-1.435991, -0.04427171, -1.119008, 1, 0.4745098, 0, 1,
-1.434764, -0.5391706, -1.561545, 1, 0.4784314, 0, 1,
-1.434668, -1.487536, -2.195743, 1, 0.4862745, 0, 1,
-1.429492, -0.4391483, -2.101043, 1, 0.4901961, 0, 1,
-1.398362, -0.478019, -1.456988, 1, 0.4980392, 0, 1,
-1.392106, -1.321618, -2.195627, 1, 0.5058824, 0, 1,
-1.391314, 1.668818, 1.557092, 1, 0.509804, 0, 1,
-1.388075, 0.4462554, -0.5101923, 1, 0.5176471, 0, 1,
-1.380498, 0.3983906, -1.210891, 1, 0.5215687, 0, 1,
-1.38041, -0.2476372, -1.092462, 1, 0.5294118, 0, 1,
-1.366079, 0.6207866, -0.949514, 1, 0.5333334, 0, 1,
-1.361117, -0.8225638, -1.148222, 1, 0.5411765, 0, 1,
-1.354841, 0.5428321, -3.049036, 1, 0.5450981, 0, 1,
-1.353174, 1.754364, -1.087308, 1, 0.5529412, 0, 1,
-1.351729, 0.2421294, -3.2897, 1, 0.5568628, 0, 1,
-1.330545, -1.513174, -2.806683, 1, 0.5647059, 0, 1,
-1.327622, -0.8570592, -1.232527, 1, 0.5686275, 0, 1,
-1.321702, 0.6044562, -2.030482, 1, 0.5764706, 0, 1,
-1.316853, 1.733834, 0.787349, 1, 0.5803922, 0, 1,
-1.309647, 0.1885796, -2.851096, 1, 0.5882353, 0, 1,
-1.296549, 0.1938906, -2.632002, 1, 0.5921569, 0, 1,
-1.278831, -0.6983797, -3.491015, 1, 0.6, 0, 1,
-1.271714, 1.070617, -2.588996, 1, 0.6078432, 0, 1,
-1.266799, 0.2901213, -2.117522, 1, 0.6117647, 0, 1,
-1.26646, -0.01006718, -1.895657, 1, 0.6196079, 0, 1,
-1.253407, 0.4648568, -2.796331, 1, 0.6235294, 0, 1,
-1.251449, -1.763854, -3.981552, 1, 0.6313726, 0, 1,
-1.248297, 0.2531094, 0.2950239, 1, 0.6352941, 0, 1,
-1.246838, 0.1309882, -0.9597434, 1, 0.6431373, 0, 1,
-1.241725, -0.635848, -1.59175, 1, 0.6470588, 0, 1,
-1.230052, 0.4153183, -0.3728815, 1, 0.654902, 0, 1,
-1.226026, -1.045482, -1.090525, 1, 0.6588235, 0, 1,
-1.218599, -0.2513894, -1.8728, 1, 0.6666667, 0, 1,
-1.216494, -1.360492, -1.899441, 1, 0.6705883, 0, 1,
-1.19825, 1.545035, 0.1791007, 1, 0.6784314, 0, 1,
-1.196932, -0.01804568, -0.2878349, 1, 0.682353, 0, 1,
-1.196886, 0.8134746, -1.105511, 1, 0.6901961, 0, 1,
-1.194793, 0.221059, -1.710806, 1, 0.6941177, 0, 1,
-1.194146, -0.7993155, -0.5960771, 1, 0.7019608, 0, 1,
-1.181598, -0.1521411, -1.645001, 1, 0.7098039, 0, 1,
-1.169413, 0.863202, 0.3193359, 1, 0.7137255, 0, 1,
-1.168245, 0.5234067, -1.591105, 1, 0.7215686, 0, 1,
-1.164532, 0.7029502, -0.8638617, 1, 0.7254902, 0, 1,
-1.153806, -0.9147865, -0.718444, 1, 0.7333333, 0, 1,
-1.150389, 0.4828375, -1.891623, 1, 0.7372549, 0, 1,
-1.147311, -0.6444777, -4.471275, 1, 0.7450981, 0, 1,
-1.145598, -1.428575, -1.558067, 1, 0.7490196, 0, 1,
-1.144148, 1.3387, -0.3464915, 1, 0.7568628, 0, 1,
-1.143492, 1.049639, -0.1417463, 1, 0.7607843, 0, 1,
-1.139049, -0.3461497, -1.570093, 1, 0.7686275, 0, 1,
-1.135418, 0.1247401, -2.184036, 1, 0.772549, 0, 1,
-1.133952, -1.613315, -2.472409, 1, 0.7803922, 0, 1,
-1.130915, 0.8592436, -1.507532, 1, 0.7843137, 0, 1,
-1.125769, 0.7502977, -2.563162, 1, 0.7921569, 0, 1,
-1.11321, 1.604922, -0.3206068, 1, 0.7960784, 0, 1,
-1.111045, 0.6977178, 0.3950237, 1, 0.8039216, 0, 1,
-1.108035, 0.8948976, -2.176645, 1, 0.8117647, 0, 1,
-1.100386, 0.4217055, -1.678784, 1, 0.8156863, 0, 1,
-1.09838, 1.096158, -0.7874345, 1, 0.8235294, 0, 1,
-1.096053, -0.8960043, -2.752404, 1, 0.827451, 0, 1,
-1.093619, 1.047422, -0.8792875, 1, 0.8352941, 0, 1,
-1.092713, -0.5662053, -1.647532, 1, 0.8392157, 0, 1,
-1.089377, 1.130087, -0.7173688, 1, 0.8470588, 0, 1,
-1.088339, -0.6546281, -2.79754, 1, 0.8509804, 0, 1,
-1.085542, -0.4278752, -3.60603, 1, 0.8588235, 0, 1,
-1.082941, 0.4204239, -0.2949039, 1, 0.8627451, 0, 1,
-1.075998, -1.19269, -1.959213, 1, 0.8705882, 0, 1,
-1.075181, -0.823314, -4.565213, 1, 0.8745098, 0, 1,
-1.073839, 0.9884349, -1.268697, 1, 0.8823529, 0, 1,
-1.072395, 1.186881, 0.2279386, 1, 0.8862745, 0, 1,
-1.072363, 0.4991121, -2.116376, 1, 0.8941177, 0, 1,
-1.061055, -0.06414808, -1.2776, 1, 0.8980392, 0, 1,
-1.060184, 0.8663442, -0.8858271, 1, 0.9058824, 0, 1,
-1.058978, 0.2000358, -2.387942, 1, 0.9137255, 0, 1,
-1.05378, -0.4611201, -2.266761, 1, 0.9176471, 0, 1,
-1.044467, -1.314764, -2.641755, 1, 0.9254902, 0, 1,
-1.028852, 0.8576213, -0.8820658, 1, 0.9294118, 0, 1,
-1.028013, 0.158662, -3.035979, 1, 0.9372549, 0, 1,
-1.027398, 0.5118068, -1.080199, 1, 0.9411765, 0, 1,
-1.022737, -2.045145, -1.665366, 1, 0.9490196, 0, 1,
-1.018541, 0.8654541, 0.1517387, 1, 0.9529412, 0, 1,
-1.016826, 0.5573392, -0.591731, 1, 0.9607843, 0, 1,
-1.016659, -1.345883, -4.587396, 1, 0.9647059, 0, 1,
-1.015206, 0.694065, -1.484564, 1, 0.972549, 0, 1,
-1.012251, 0.1538863, -2.190938, 1, 0.9764706, 0, 1,
-1.012015, 2.03072, -1.272556, 1, 0.9843137, 0, 1,
-1.004158, -0.2632417, -1.877448, 1, 0.9882353, 0, 1,
-1.00266, -0.4191087, -0.8026571, 1, 0.9960784, 0, 1,
-1.001152, 1.792978, 0.9587903, 0.9960784, 1, 0, 1,
-0.9727859, 1.57521, 0.1137884, 0.9921569, 1, 0, 1,
-0.9721023, -1.223301, -1.4903, 0.9843137, 1, 0, 1,
-0.9675273, 0.4957587, -1.646047, 0.9803922, 1, 0, 1,
-0.9614183, 1.085708, -3.587728, 0.972549, 1, 0, 1,
-0.9602582, 0.02804562, -2.7131, 0.9686275, 1, 0, 1,
-0.960138, -0.1829829, -0.931948, 0.9607843, 1, 0, 1,
-0.9572194, -0.7535366, -3.163901, 0.9568627, 1, 0, 1,
-0.951865, 0.5408363, -3.755, 0.9490196, 1, 0, 1,
-0.940068, 0.8566222, -0.9744629, 0.945098, 1, 0, 1,
-0.9356204, 0.6244327, -0.8523555, 0.9372549, 1, 0, 1,
-0.9302626, -1.907924, -0.6372668, 0.9333333, 1, 0, 1,
-0.9264302, -0.1822587, 0.04452358, 0.9254902, 1, 0, 1,
-0.923843, -0.2652791, -0.6650373, 0.9215686, 1, 0, 1,
-0.9153112, 1.260949, -0.04826807, 0.9137255, 1, 0, 1,
-0.912787, -0.8337343, -1.390627, 0.9098039, 1, 0, 1,
-0.9031822, 0.1653546, -1.445706, 0.9019608, 1, 0, 1,
-0.900345, -0.7241433, -3.422723, 0.8941177, 1, 0, 1,
-0.8998035, -0.5489815, -3.063291, 0.8901961, 1, 0, 1,
-0.8915998, 0.7288908, -0.2262511, 0.8823529, 1, 0, 1,
-0.8867746, -1.096534, -0.5799267, 0.8784314, 1, 0, 1,
-0.8823069, -0.7570835, -2.900918, 0.8705882, 1, 0, 1,
-0.8813569, -1.354074, -4.008038, 0.8666667, 1, 0, 1,
-0.8776305, 2.013484, -1.634783, 0.8588235, 1, 0, 1,
-0.8736451, 0.05297178, -1.411448, 0.854902, 1, 0, 1,
-0.8715556, -0.8399079, -1.857668, 0.8470588, 1, 0, 1,
-0.8601213, 0.5846074, 1.952819, 0.8431373, 1, 0, 1,
-0.8554976, -0.2927164, -2.811946, 0.8352941, 1, 0, 1,
-0.8552672, -0.4776182, -2.355658, 0.8313726, 1, 0, 1,
-0.851207, -0.5401238, -1.986908, 0.8235294, 1, 0, 1,
-0.8499166, 0.1449093, -1.196749, 0.8196079, 1, 0, 1,
-0.8469586, 1.056323, -0.6116776, 0.8117647, 1, 0, 1,
-0.8371354, 1.346004, -1.632526, 0.8078431, 1, 0, 1,
-0.8294349, -0.4781451, -1.905572, 0.8, 1, 0, 1,
-0.8224267, -0.5175278, -3.020141, 0.7921569, 1, 0, 1,
-0.8189382, 0.135935, -1.39423, 0.7882353, 1, 0, 1,
-0.8179941, 1.835971, -1.997488, 0.7803922, 1, 0, 1,
-0.8165081, -0.7518736, -3.94634, 0.7764706, 1, 0, 1,
-0.8059258, 0.1781106, -1.664006, 0.7686275, 1, 0, 1,
-0.8048652, 0.01617976, -2.605618, 0.7647059, 1, 0, 1,
-0.7962179, 0.04631515, -2.272851, 0.7568628, 1, 0, 1,
-0.7833006, 0.4409262, -1.900939, 0.7529412, 1, 0, 1,
-0.7829538, 1.599838, -0.8046134, 0.7450981, 1, 0, 1,
-0.7724176, 1.214936, 0.5059773, 0.7411765, 1, 0, 1,
-0.7700463, -0.2494421, -1.436661, 0.7333333, 1, 0, 1,
-0.7637536, -0.06261531, -0.7468039, 0.7294118, 1, 0, 1,
-0.7617052, 0.07152766, -2.277471, 0.7215686, 1, 0, 1,
-0.7532368, 0.156896, -1.60482, 0.7176471, 1, 0, 1,
-0.7526386, 0.2849313, 0.3690155, 0.7098039, 1, 0, 1,
-0.7518296, -0.4577989, 0.3859401, 0.7058824, 1, 0, 1,
-0.7502756, -0.4058269, -1.988606, 0.6980392, 1, 0, 1,
-0.7500722, 0.7593597, -0.08322004, 0.6901961, 1, 0, 1,
-0.7464595, -1.23458, -3.141874, 0.6862745, 1, 0, 1,
-0.7452236, 1.405869, 0.2594772, 0.6784314, 1, 0, 1,
-0.7438184, -0.7211914, -3.536937, 0.6745098, 1, 0, 1,
-0.739548, 0.6330574, -0.6104156, 0.6666667, 1, 0, 1,
-0.7384578, -0.6206611, -3.420617, 0.6627451, 1, 0, 1,
-0.7373002, -0.2985096, -1.490752, 0.654902, 1, 0, 1,
-0.7361634, -0.9498411, -3.081169, 0.6509804, 1, 0, 1,
-0.735222, -1.15436, -3.068036, 0.6431373, 1, 0, 1,
-0.7203109, 0.6986005, -0.1829414, 0.6392157, 1, 0, 1,
-0.7171744, -0.1489761, -1.426862, 0.6313726, 1, 0, 1,
-0.7170551, 0.5215549, -0.8844169, 0.627451, 1, 0, 1,
-0.7141817, 0.0502369, -2.18229, 0.6196079, 1, 0, 1,
-0.7134452, 1.45038, -1.846618, 0.6156863, 1, 0, 1,
-0.7096866, 1.780213, 0.3083437, 0.6078432, 1, 0, 1,
-0.7037847, -0.003556831, -1.335847, 0.6039216, 1, 0, 1,
-0.6970429, -0.474133, -2.426858, 0.5960785, 1, 0, 1,
-0.6886057, 0.06567778, -2.30263, 0.5882353, 1, 0, 1,
-0.6852054, -0.8647869, -2.430919, 0.5843138, 1, 0, 1,
-0.6828268, 0.3372726, -0.797629, 0.5764706, 1, 0, 1,
-0.6817426, 0.08683192, 0.6090013, 0.572549, 1, 0, 1,
-0.6816674, -0.3473086, -2.349444, 0.5647059, 1, 0, 1,
-0.6812432, 1.094478, -0.2917657, 0.5607843, 1, 0, 1,
-0.6651382, 0.5938692, -0.01897863, 0.5529412, 1, 0, 1,
-0.6637205, -0.4706551, -2.823169, 0.5490196, 1, 0, 1,
-0.662191, -2.50195, -3.128319, 0.5411765, 1, 0, 1,
-0.6620324, 0.9810158, -0.6861369, 0.5372549, 1, 0, 1,
-0.6593657, -0.536747, 0.1934427, 0.5294118, 1, 0, 1,
-0.6566175, -0.4854203, -2.655202, 0.5254902, 1, 0, 1,
-0.6544836, -1.071716, -1.94844, 0.5176471, 1, 0, 1,
-0.6523277, 1.220696, -0.1861476, 0.5137255, 1, 0, 1,
-0.6459523, -0.6591996, -2.645129, 0.5058824, 1, 0, 1,
-0.6423061, 0.8981549, -1.815054, 0.5019608, 1, 0, 1,
-0.6382202, -0.3099654, -3.374622, 0.4941176, 1, 0, 1,
-0.6349066, -2.370559, -2.298182, 0.4862745, 1, 0, 1,
-0.6330026, 0.9913785, -1.247928, 0.4823529, 1, 0, 1,
-0.6313601, 1.338682, -2.105374, 0.4745098, 1, 0, 1,
-0.6292543, 0.1728907, -1.276959, 0.4705882, 1, 0, 1,
-0.6223018, 1.653334, -2.256647, 0.4627451, 1, 0, 1,
-0.6204612, 0.9810014, -2.277299, 0.4588235, 1, 0, 1,
-0.6201346, -0.2744019, 0.4530086, 0.4509804, 1, 0, 1,
-0.6146724, 0.6144334, -1.17977, 0.4470588, 1, 0, 1,
-0.6097664, 1.064982, -0.4963424, 0.4392157, 1, 0, 1,
-0.6012215, -1.229295, -3.4349, 0.4352941, 1, 0, 1,
-0.5983917, 0.009870498, -1.861322, 0.427451, 1, 0, 1,
-0.5964835, -0.2351764, -0.8821797, 0.4235294, 1, 0, 1,
-0.5949625, -0.2312399, -0.5592407, 0.4156863, 1, 0, 1,
-0.59462, 0.6018097, -0.2633471, 0.4117647, 1, 0, 1,
-0.5941931, 0.7236556, -1.064959, 0.4039216, 1, 0, 1,
-0.5877783, 1.407961, -2.039586, 0.3960784, 1, 0, 1,
-0.5851156, 0.9370969, -0.5204418, 0.3921569, 1, 0, 1,
-0.5783899, 1.340489, 2.078779, 0.3843137, 1, 0, 1,
-0.5767758, 0.9678798, -0.8164203, 0.3803922, 1, 0, 1,
-0.5738972, 0.6018767, -1.264441, 0.372549, 1, 0, 1,
-0.5737911, -0.7112883, -1.281256, 0.3686275, 1, 0, 1,
-0.5725927, 1.45667, -1.178323, 0.3607843, 1, 0, 1,
-0.5711842, -0.9625997, -3.879643, 0.3568628, 1, 0, 1,
-0.5656136, -0.1706509, -1.882608, 0.3490196, 1, 0, 1,
-0.5628896, 0.1513678, -1.515886, 0.345098, 1, 0, 1,
-0.5624052, 0.0955589, -3.023731, 0.3372549, 1, 0, 1,
-0.5595898, -0.5334351, -2.360309, 0.3333333, 1, 0, 1,
-0.5587977, 0.04360882, -2.483686, 0.3254902, 1, 0, 1,
-0.5554904, -0.9162383, -3.376893, 0.3215686, 1, 0, 1,
-0.5507374, -0.3280869, -2.295576, 0.3137255, 1, 0, 1,
-0.5352398, -0.2058059, -3.032651, 0.3098039, 1, 0, 1,
-0.5329593, 0.5260739, -1.712815, 0.3019608, 1, 0, 1,
-0.5327426, -0.3455668, -2.362696, 0.2941177, 1, 0, 1,
-0.5297772, 0.8321658, 0.2044597, 0.2901961, 1, 0, 1,
-0.5297567, -1.049608, -2.684138, 0.282353, 1, 0, 1,
-0.5259594, 0.6857773, 0.8290641, 0.2784314, 1, 0, 1,
-0.5254316, 0.02066901, -1.072559, 0.2705882, 1, 0, 1,
-0.523924, 0.7096514, -1.254268, 0.2666667, 1, 0, 1,
-0.5191942, 0.2713853, -0.9570656, 0.2588235, 1, 0, 1,
-0.5159862, 0.6925857, -3.142173, 0.254902, 1, 0, 1,
-0.5137652, -1.319953, -1.647168, 0.2470588, 1, 0, 1,
-0.5097222, 0.581391, -0.7933784, 0.2431373, 1, 0, 1,
-0.5093675, 0.4715339, -1.197147, 0.2352941, 1, 0, 1,
-0.5086904, 1.226725, -1.10518, 0.2313726, 1, 0, 1,
-0.506698, 1.410595, -1.86732, 0.2235294, 1, 0, 1,
-0.5039678, -0.8234696, -1.729493, 0.2196078, 1, 0, 1,
-0.4994025, 0.8402308, 1.031071, 0.2117647, 1, 0, 1,
-0.4983304, 0.1503115, 0.08656467, 0.2078431, 1, 0, 1,
-0.4966795, 0.8605113, 0.8594378, 0.2, 1, 0, 1,
-0.4897644, 1.20092, -1.320168, 0.1921569, 1, 0, 1,
-0.4895436, -1.220872, -3.627177, 0.1882353, 1, 0, 1,
-0.4836326, -0.5021063, -2.466533, 0.1803922, 1, 0, 1,
-0.4834857, -0.1863447, -1.359861, 0.1764706, 1, 0, 1,
-0.478321, -1.424673, -3.974621, 0.1686275, 1, 0, 1,
-0.4779726, -0.8542879, -2.045858, 0.1647059, 1, 0, 1,
-0.477295, -0.82796, -2.778101, 0.1568628, 1, 0, 1,
-0.4712029, -0.488645, -1.107102, 0.1529412, 1, 0, 1,
-0.470752, 0.4470299, 1.210878, 0.145098, 1, 0, 1,
-0.4706076, -1.085132, -1.961993, 0.1411765, 1, 0, 1,
-0.4689704, 1.665324, 1.04167, 0.1333333, 1, 0, 1,
-0.4621376, -0.2385947, -2.328871, 0.1294118, 1, 0, 1,
-0.4620332, 1.439551, -2.125587, 0.1215686, 1, 0, 1,
-0.4600094, -1.841325, -1.0957, 0.1176471, 1, 0, 1,
-0.4552893, -0.7439055, -2.836134, 0.1098039, 1, 0, 1,
-0.4547208, 1.088803, -1.183455, 0.1058824, 1, 0, 1,
-0.4527446, 0.1628558, -1.800109, 0.09803922, 1, 0, 1,
-0.4459428, -0.2823251, -4.293637, 0.09019608, 1, 0, 1,
-0.4445106, 0.5966736, 0.7069449, 0.08627451, 1, 0, 1,
-0.4431782, 0.2102767, -1.299256, 0.07843138, 1, 0, 1,
-0.4417245, 0.173169, -3.876195, 0.07450981, 1, 0, 1,
-0.4417044, -0.5966682, -2.998639, 0.06666667, 1, 0, 1,
-0.4413421, 1.195658, 0.6710749, 0.0627451, 1, 0, 1,
-0.4398925, -1.066141, -2.95375, 0.05490196, 1, 0, 1,
-0.4394138, 0.7387937, -0.8616375, 0.05098039, 1, 0, 1,
-0.4369704, 0.893216, -0.3165876, 0.04313726, 1, 0, 1,
-0.4314255, 0.7922645, 0.2299216, 0.03921569, 1, 0, 1,
-0.4307174, -1.382735, -3.719322, 0.03137255, 1, 0, 1,
-0.4183905, -0.05722449, -3.276976, 0.02745098, 1, 0, 1,
-0.4166531, -2.035464, -3.001046, 0.01960784, 1, 0, 1,
-0.4141973, -1.964959, -2.910403, 0.01568628, 1, 0, 1,
-0.4093031, -0.1124159, -1.374634, 0.007843138, 1, 0, 1,
-0.4078711, 0.5385054, -0.8355021, 0.003921569, 1, 0, 1,
-0.4062248, 0.4661619, -0.7864721, 0, 1, 0.003921569, 1,
-0.4045142, 1.475225, 1.231421, 0, 1, 0.01176471, 1,
-0.4024731, 0.02330255, -1.581519, 0, 1, 0.01568628, 1,
-0.401395, 0.9241351, 0.063182, 0, 1, 0.02352941, 1,
-0.4013495, 0.1075206, -1.01529, 0, 1, 0.02745098, 1,
-0.3934767, -0.8249493, -2.559366, 0, 1, 0.03529412, 1,
-0.3919095, -0.3440335, -1.991943, 0, 1, 0.03921569, 1,
-0.3897161, 1.054843, -0.3280474, 0, 1, 0.04705882, 1,
-0.3893101, -0.380426, -2.339706, 0, 1, 0.05098039, 1,
-0.3796592, -0.3607092, -1.746117, 0, 1, 0.05882353, 1,
-0.3774199, -2.032731, -3.102819, 0, 1, 0.0627451, 1,
-0.3760265, -0.3376885, -1.607867, 0, 1, 0.07058824, 1,
-0.3738227, -1.532693, -3.111297, 0, 1, 0.07450981, 1,
-0.3716718, -1.075851, -1.374545, 0, 1, 0.08235294, 1,
-0.371447, -0.56267, -2.720538, 0, 1, 0.08627451, 1,
-0.3685329, 0.3143235, -1.791148, 0, 1, 0.09411765, 1,
-0.3673598, -2.087686, -3.774815, 0, 1, 0.1019608, 1,
-0.3671497, 1.12889, -0.3089307, 0, 1, 0.1058824, 1,
-0.3653826, -1.627039, -1.927993, 0, 1, 0.1137255, 1,
-0.3626951, -0.3779961, -1.675332, 0, 1, 0.1176471, 1,
-0.360967, 0.9633955, -1.152543, 0, 1, 0.1254902, 1,
-0.3609569, -0.8498172, -2.343833, 0, 1, 0.1294118, 1,
-0.3563304, 2.105997, -0.6045071, 0, 1, 0.1372549, 1,
-0.3557879, 0.5478514, -0.4623142, 0, 1, 0.1411765, 1,
-0.3508676, -1.624385, -3.636297, 0, 1, 0.1490196, 1,
-0.3482631, -1.483855, -4.270223, 0, 1, 0.1529412, 1,
-0.3459965, 1.15937, -0.9262555, 0, 1, 0.1607843, 1,
-0.3448424, 1.267556, -1.254034, 0, 1, 0.1647059, 1,
-0.3442793, -1.691506, -2.784366, 0, 1, 0.172549, 1,
-0.3431928, -0.9929234, 0.3791349, 0, 1, 0.1764706, 1,
-0.3419282, 1.038166, -0.2450379, 0, 1, 0.1843137, 1,
-0.3387447, -0.1519893, -2.481356, 0, 1, 0.1882353, 1,
-0.3272402, -1.059451, -4.040283, 0, 1, 0.1960784, 1,
-0.3257972, -0.4835606, -2.365201, 0, 1, 0.2039216, 1,
-0.3251817, 0.918132, 0.3905939, 0, 1, 0.2078431, 1,
-0.3197615, -0.2998013, 0.06230459, 0, 1, 0.2156863, 1,
-0.3182314, -1.578304, -2.76571, 0, 1, 0.2196078, 1,
-0.3158168, 1.279542, -0.9133287, 0, 1, 0.227451, 1,
-0.3137698, 1.346805, 0.7154554, 0, 1, 0.2313726, 1,
-0.3122865, -0.05479036, -0.9087567, 0, 1, 0.2392157, 1,
-0.2996534, 0.472968, -1.092893, 0, 1, 0.2431373, 1,
-0.2976124, -1.213074, -2.378038, 0, 1, 0.2509804, 1,
-0.2964198, 0.4310688, 0.5568988, 0, 1, 0.254902, 1,
-0.2935066, -0.720527, -3.131038, 0, 1, 0.2627451, 1,
-0.2886699, 0.502502, -1.423328, 0, 1, 0.2666667, 1,
-0.2883592, -0.01280001, -2.551758, 0, 1, 0.2745098, 1,
-0.2870382, 0.3095381, -1.373178, 0, 1, 0.2784314, 1,
-0.2842149, 1.422335, -0.9673111, 0, 1, 0.2862745, 1,
-0.2825611, -0.6269063, -1.54504, 0, 1, 0.2901961, 1,
-0.2825234, -0.3889821, -3.554218, 0, 1, 0.2980392, 1,
-0.2694744, 0.3843097, -0.309843, 0, 1, 0.3058824, 1,
-0.2682843, -0.1349806, -1.084886, 0, 1, 0.3098039, 1,
-0.2524952, 0.6542242, -1.148844, 0, 1, 0.3176471, 1,
-0.2523741, 0.3930407, -1.291082, 0, 1, 0.3215686, 1,
-0.2515139, -0.9694977, -3.595037, 0, 1, 0.3294118, 1,
-0.2509799, -1.337524, -3.143698, 0, 1, 0.3333333, 1,
-0.2487478, -1.434953, -2.350872, 0, 1, 0.3411765, 1,
-0.2484921, 1.133183, -0.9505558, 0, 1, 0.345098, 1,
-0.246758, -0.1831393, -1.643471, 0, 1, 0.3529412, 1,
-0.2466591, 1.598062, -1.58465, 0, 1, 0.3568628, 1,
-0.2413505, 0.2721735, -2.109921, 0, 1, 0.3647059, 1,
-0.2379844, -2.941603, -3.458817, 0, 1, 0.3686275, 1,
-0.2345452, -0.02008799, -2.482876, 0, 1, 0.3764706, 1,
-0.233694, -0.638509, -2.670245, 0, 1, 0.3803922, 1,
-0.2333382, 0.5860805, 1.018401, 0, 1, 0.3882353, 1,
-0.2324109, -1.360489, -1.78763, 0, 1, 0.3921569, 1,
-0.230215, -0.5419146, -3.633696, 0, 1, 0.4, 1,
-0.2244172, 2.514956, -1.547712, 0, 1, 0.4078431, 1,
-0.2226692, -0.000116236, -3.140761, 0, 1, 0.4117647, 1,
-0.2224716, -1.229909, -3.532786, 0, 1, 0.4196078, 1,
-0.2220116, 0.8187856, -0.586748, 0, 1, 0.4235294, 1,
-0.221253, -0.5584798, -2.684992, 0, 1, 0.4313726, 1,
-0.2187304, 1.507296, 0.4779819, 0, 1, 0.4352941, 1,
-0.2158381, -0.04206628, -2.056327, 0, 1, 0.4431373, 1,
-0.2115489, -0.3032385, -1.745813, 0, 1, 0.4470588, 1,
-0.2103033, 1.530624, -0.8993264, 0, 1, 0.454902, 1,
-0.2065133, 2.05372, 0.9920352, 0, 1, 0.4588235, 1,
-0.2014255, -1.944126, -3.376337, 0, 1, 0.4666667, 1,
-0.19999, -0.3635055, -3.97729, 0, 1, 0.4705882, 1,
-0.1969396, -1.798237, -2.665925, 0, 1, 0.4784314, 1,
-0.1956978, 1.189257, 0.08793249, 0, 1, 0.4823529, 1,
-0.1916896, 0.249964, 1.505543, 0, 1, 0.4901961, 1,
-0.1880053, 0.7186818, -1.46865, 0, 1, 0.4941176, 1,
-0.1819893, -1.443904, -4.738514, 0, 1, 0.5019608, 1,
-0.1785437, -1.090798, -4.203678, 0, 1, 0.509804, 1,
-0.1763331, 1.43377, -0.7231078, 0, 1, 0.5137255, 1,
-0.1757422, 0.5460163, -0.08104347, 0, 1, 0.5215687, 1,
-0.1748918, -0.4327347, -2.854405, 0, 1, 0.5254902, 1,
-0.1741632, 0.4206923, -0.1354664, 0, 1, 0.5333334, 1,
-0.174101, -0.2099791, -2.069523, 0, 1, 0.5372549, 1,
-0.1719939, 1.320022, 1.457952, 0, 1, 0.5450981, 1,
-0.1663488, -1.522306, -4.361377, 0, 1, 0.5490196, 1,
-0.1657144, -0.8396198, -2.810346, 0, 1, 0.5568628, 1,
-0.1650192, 0.3332509, 0.1416703, 0, 1, 0.5607843, 1,
-0.1618526, 0.3653117, -1.754521, 0, 1, 0.5686275, 1,
-0.1602108, 1.170424, 0.7788379, 0, 1, 0.572549, 1,
-0.1594523, -0.5541793, -3.781491, 0, 1, 0.5803922, 1,
-0.1557755, -0.06872404, -1.324184, 0, 1, 0.5843138, 1,
-0.1554438, -0.1419049, -1.997378, 0, 1, 0.5921569, 1,
-0.1528961, -0.3376328, -1.946688, 0, 1, 0.5960785, 1,
-0.1519871, -1.22226, -3.163164, 0, 1, 0.6039216, 1,
-0.1493693, 1.885725, -0.03539184, 0, 1, 0.6117647, 1,
-0.1484753, 0.1409002, -0.08225721, 0, 1, 0.6156863, 1,
-0.1482394, -0.4617686, -2.291379, 0, 1, 0.6235294, 1,
-0.1473998, -1.673778, -2.439979, 0, 1, 0.627451, 1,
-0.1462457, -0.2480746, -2.46327, 0, 1, 0.6352941, 1,
-0.1452146, -0.06948998, -2.292162, 0, 1, 0.6392157, 1,
-0.1448721, -1.190836, -2.702969, 0, 1, 0.6470588, 1,
-0.139546, -0.3053417, -2.558285, 0, 1, 0.6509804, 1,
-0.1316435, 0.5574871, -1.415982, 0, 1, 0.6588235, 1,
-0.1311846, 2.064264, -0.2348491, 0, 1, 0.6627451, 1,
-0.1262807, 1.022002, -2.261275, 0, 1, 0.6705883, 1,
-0.1249847, 1.992954, 1.023186, 0, 1, 0.6745098, 1,
-0.1246542, 0.6072775, 0.4290147, 0, 1, 0.682353, 1,
-0.1179097, -1.723808, -2.423491, 0, 1, 0.6862745, 1,
-0.1176014, 1.052835, -0.8112482, 0, 1, 0.6941177, 1,
-0.1069472, 1.50624, -0.423365, 0, 1, 0.7019608, 1,
-0.1041235, 1.439368, -1.083085, 0, 1, 0.7058824, 1,
-0.1037085, 0.5971429, 1.458025, 0, 1, 0.7137255, 1,
-0.1031827, -0.1111913, -1.288894, 0, 1, 0.7176471, 1,
-0.09958266, 0.03866345, 0.5051883, 0, 1, 0.7254902, 1,
-0.09947716, 1.893096, 0.4273843, 0, 1, 0.7294118, 1,
-0.09744187, -1.21492, -3.407159, 0, 1, 0.7372549, 1,
-0.09294334, -0.3925327, -3.709617, 0, 1, 0.7411765, 1,
-0.08996725, 1.747403, 2.808497, 0, 1, 0.7490196, 1,
-0.08204679, -1.104029, -3.329083, 0, 1, 0.7529412, 1,
-0.08156856, 1.077268, 0.04495243, 0, 1, 0.7607843, 1,
-0.08123004, -0.4367411, -1.815705, 0, 1, 0.7647059, 1,
-0.07991293, -1.323161, -3.474003, 0, 1, 0.772549, 1,
-0.07964341, -0.1566722, -1.353328, 0, 1, 0.7764706, 1,
-0.07221581, 1.341845, -0.5411034, 0, 1, 0.7843137, 1,
-0.06609052, 0.4381527, 0.06360848, 0, 1, 0.7882353, 1,
-0.06579491, -0.2661921, -4.188646, 0, 1, 0.7960784, 1,
-0.06469071, -1.397014, -2.329983, 0, 1, 0.8039216, 1,
-0.06172505, -1.105221, -3.631182, 0, 1, 0.8078431, 1,
-0.05996367, 0.6021994, -2.094475, 0, 1, 0.8156863, 1,
-0.05944467, 0.2450693, -0.078406, 0, 1, 0.8196079, 1,
-0.0593273, -0.001090091, -1.729008, 0, 1, 0.827451, 1,
-0.05600061, -0.8258037, -1.913873, 0, 1, 0.8313726, 1,
-0.05536045, -1.241572, -2.849229, 0, 1, 0.8392157, 1,
-0.05379127, 0.1825818, -1.300927, 0, 1, 0.8431373, 1,
-0.05127051, 0.6092167, 0.1892251, 0, 1, 0.8509804, 1,
-0.04938604, 1.544842, 0.3282665, 0, 1, 0.854902, 1,
-0.04785573, -1.782163, -4.341839, 0, 1, 0.8627451, 1,
-0.04779528, 0.1893864, 1.345592, 0, 1, 0.8666667, 1,
-0.04575221, 1.06002, 0.9820064, 0, 1, 0.8745098, 1,
-0.04495899, 1.310288, -0.05654868, 0, 1, 0.8784314, 1,
-0.04454273, -1.50758, -1.383443, 0, 1, 0.8862745, 1,
-0.04397532, 0.5481637, 0.438322, 0, 1, 0.8901961, 1,
-0.0394789, -0.9072045, -0.7793883, 0, 1, 0.8980392, 1,
-0.03856206, 1.564735, -1.088344, 0, 1, 0.9058824, 1,
-0.03399749, 1.762112, 1.309643, 0, 1, 0.9098039, 1,
-0.03270498, 0.002737059, -1.972161, 0, 1, 0.9176471, 1,
-0.0278372, 1.063175, -0.001291423, 0, 1, 0.9215686, 1,
-0.02716295, -1.511036, -2.760146, 0, 1, 0.9294118, 1,
-0.02591348, -0.121635, -0.7846617, 0, 1, 0.9333333, 1,
-0.0251602, 0.06284747, 1.021114, 0, 1, 0.9411765, 1,
-0.01823066, 0.4845312, -0.3585426, 0, 1, 0.945098, 1,
-0.017759, -0.6220856, -1.546133, 0, 1, 0.9529412, 1,
-0.01718882, 0.2296465, 0.6370232, 0, 1, 0.9568627, 1,
-0.01520441, 0.2619501, -0.2347542, 0, 1, 0.9647059, 1,
-0.01495906, -0.9202987, -4.168861, 0, 1, 0.9686275, 1,
-0.01414815, 1.027474, -2.006214, 0, 1, 0.9764706, 1,
-0.009749994, -0.6125097, -2.819157, 0, 1, 0.9803922, 1,
-0.009440477, -0.4711355, -1.745661, 0, 1, 0.9882353, 1,
-0.005071394, 0.4602521, -0.3508394, 0, 1, 0.9921569, 1,
-0.003894733, 1.334926, 0.4481824, 0, 1, 1, 1,
-0.001183875, 0.5525711, -0.63799, 0, 0.9921569, 1, 1,
-0.0008458694, 0.9980711, -0.03275425, 0, 0.9882353, 1, 1,
0.001326548, -2.076392, 2.367552, 0, 0.9803922, 1, 1,
0.001346351, -1.086586, 2.648618, 0, 0.9764706, 1, 1,
0.003490713, 2.113631, -1.319091, 0, 0.9686275, 1, 1,
0.0110569, 1.114792, -0.2266701, 0, 0.9647059, 1, 1,
0.01219316, 2.090212, 2.708438, 0, 0.9568627, 1, 1,
0.01388106, -0.3978972, 2.051037, 0, 0.9529412, 1, 1,
0.01525511, 0.990777, -0.7434756, 0, 0.945098, 1, 1,
0.01578886, -0.7433553, 2.470367, 0, 0.9411765, 1, 1,
0.01812911, -0.7011182, 1.51815, 0, 0.9333333, 1, 1,
0.01882979, -0.9569957, 2.909521, 0, 0.9294118, 1, 1,
0.02504072, -0.8632002, 2.349237, 0, 0.9215686, 1, 1,
0.0268368, 2.661773, -0.2645756, 0, 0.9176471, 1, 1,
0.03246523, 0.7332163, -0.6214963, 0, 0.9098039, 1, 1,
0.03249529, -1.696042, 2.932482, 0, 0.9058824, 1, 1,
0.03567383, 1.256186, 0.4785542, 0, 0.8980392, 1, 1,
0.03756122, 0.7499965, 1.24279, 0, 0.8901961, 1, 1,
0.0377999, 1.024355, 0.5242358, 0, 0.8862745, 1, 1,
0.03804236, 1.193113, 0.6635318, 0, 0.8784314, 1, 1,
0.04330295, -0.2001173, 3.613428, 0, 0.8745098, 1, 1,
0.0460669, 0.8216347, -0.6542148, 0, 0.8666667, 1, 1,
0.04721841, 0.1379903, -1.497877, 0, 0.8627451, 1, 1,
0.05044694, 0.582351, 0.5335929, 0, 0.854902, 1, 1,
0.05261129, 0.2430164, -0.223294, 0, 0.8509804, 1, 1,
0.05294858, 1.194054, 1.621261, 0, 0.8431373, 1, 1,
0.05782387, -0.2557021, 3.685354, 0, 0.8392157, 1, 1,
0.06224138, 0.2090647, 0.08332089, 0, 0.8313726, 1, 1,
0.0641128, 1.202429, -0.8546284, 0, 0.827451, 1, 1,
0.06469999, -0.6495284, 0.7668238, 0, 0.8196079, 1, 1,
0.06938922, -0.1168993, 2.605053, 0, 0.8156863, 1, 1,
0.06941803, -1.186435, 1.450152, 0, 0.8078431, 1, 1,
0.07564614, 1.275787, -0.295755, 0, 0.8039216, 1, 1,
0.07717372, -1.372408, 1.450869, 0, 0.7960784, 1, 1,
0.07723077, -0.8988908, 2.603923, 0, 0.7882353, 1, 1,
0.07735334, 0.5979516, -1.26754, 0, 0.7843137, 1, 1,
0.07812652, 0.5506899, -1.852146, 0, 0.7764706, 1, 1,
0.07862689, -1.141984, 6.138312, 0, 0.772549, 1, 1,
0.07931191, 0.8353667, 1.699558, 0, 0.7647059, 1, 1,
0.07948878, 1.228609, 0.6733168, 0, 0.7607843, 1, 1,
0.07987312, 1.190729, 0.01392592, 0, 0.7529412, 1, 1,
0.08086269, 2.174325, 0.5235797, 0, 0.7490196, 1, 1,
0.09324872, 1.051914, -2.02191, 0, 0.7411765, 1, 1,
0.09370343, -0.3993897, 2.478832, 0, 0.7372549, 1, 1,
0.09464557, 1.005873, 0.8297306, 0, 0.7294118, 1, 1,
0.09698205, -0.3377062, 3.946671, 0, 0.7254902, 1, 1,
0.09718949, 0.8943258, -0.5374305, 0, 0.7176471, 1, 1,
0.09790163, -0.3751997, 1.747996, 0, 0.7137255, 1, 1,
0.1004699, 0.2323651, 2.55956, 0, 0.7058824, 1, 1,
0.1011935, -0.4424623, 3.385336, 0, 0.6980392, 1, 1,
0.1014316, 0.3970617, 0.4523607, 0, 0.6941177, 1, 1,
0.1031289, -0.4797907, 2.366376, 0, 0.6862745, 1, 1,
0.1160985, -1.087022, 3.551723, 0, 0.682353, 1, 1,
0.1178487, -0.9765322, 2.108632, 0, 0.6745098, 1, 1,
0.1191569, -0.4360329, 3.131883, 0, 0.6705883, 1, 1,
0.1192593, 2.1112, -0.5203721, 0, 0.6627451, 1, 1,
0.1232841, 0.1400394, 2.780684, 0, 0.6588235, 1, 1,
0.1234947, 1.064152, -1.378145, 0, 0.6509804, 1, 1,
0.1241208, -0.363495, 2.199975, 0, 0.6470588, 1, 1,
0.1248514, -0.4704435, 1.77668, 0, 0.6392157, 1, 1,
0.1249656, -0.3499122, 2.880089, 0, 0.6352941, 1, 1,
0.1304602, -1.007337, 3.401245, 0, 0.627451, 1, 1,
0.1337237, 0.8996247, -0.6805581, 0, 0.6235294, 1, 1,
0.1341998, 1.265707, -0.7131072, 0, 0.6156863, 1, 1,
0.1344678, 1.828947, 0.28015, 0, 0.6117647, 1, 1,
0.1363609, -0.3381302, 3.300239, 0, 0.6039216, 1, 1,
0.1370373, -2.073563, 3.295429, 0, 0.5960785, 1, 1,
0.1452629, -0.6349751, 3.139918, 0, 0.5921569, 1, 1,
0.1454635, 0.03060074, 2.57216, 0, 0.5843138, 1, 1,
0.1474545, -0.04989734, 3.89941, 0, 0.5803922, 1, 1,
0.1508149, 0.3829477, 0.4454762, 0, 0.572549, 1, 1,
0.1513094, 0.6596195, -0.5139837, 0, 0.5686275, 1, 1,
0.1525339, -0.56396, 2.858887, 0, 0.5607843, 1, 1,
0.1528825, -0.9306746, 2.33249, 0, 0.5568628, 1, 1,
0.1572727, -0.9288766, 1.833801, 0, 0.5490196, 1, 1,
0.1624884, 2.017528, -1.089602, 0, 0.5450981, 1, 1,
0.1635458, -1.604204, 4.397639, 0, 0.5372549, 1, 1,
0.1683307, -0.07486884, 1.624321, 0, 0.5333334, 1, 1,
0.1686902, -0.226204, 4.36621, 0, 0.5254902, 1, 1,
0.1775742, -3.061776, 3.792456, 0, 0.5215687, 1, 1,
0.1780297, -0.3998184, 2.410272, 0, 0.5137255, 1, 1,
0.1826688, -1.667356, 2.477572, 0, 0.509804, 1, 1,
0.1845721, 0.4042677, -0.281621, 0, 0.5019608, 1, 1,
0.1849187, -1.913861, 2.363741, 0, 0.4941176, 1, 1,
0.1864809, -1.010711, 2.193733, 0, 0.4901961, 1, 1,
0.1911566, -0.4989723, 3.084268, 0, 0.4823529, 1, 1,
0.1919509, -1.23017, 2.776297, 0, 0.4784314, 1, 1,
0.1955558, 1.871554, 1.016874, 0, 0.4705882, 1, 1,
0.2013543, 1.715757, 0.3179607, 0, 0.4666667, 1, 1,
0.2018081, 0.04251214, 2.450342, 0, 0.4588235, 1, 1,
0.2123034, -0.471192, 1.223369, 0, 0.454902, 1, 1,
0.216755, 1.421025, -0.06322432, 0, 0.4470588, 1, 1,
0.2168162, -0.3706652, 3.955029, 0, 0.4431373, 1, 1,
0.218509, 1.828811, -0.2753425, 0, 0.4352941, 1, 1,
0.2201875, -0.9061333, 2.297355, 0, 0.4313726, 1, 1,
0.2241826, 0.4996428, -1.27294, 0, 0.4235294, 1, 1,
0.2262928, -0.7264067, 2.412639, 0, 0.4196078, 1, 1,
0.2284023, -1.920875, 3.440681, 0, 0.4117647, 1, 1,
0.2335317, -0.9060608, 2.392281, 0, 0.4078431, 1, 1,
0.23354, -0.6069288, 3.472948, 0, 0.4, 1, 1,
0.2386096, -0.2789496, 2.526491, 0, 0.3921569, 1, 1,
0.2410101, -0.5046476, 1.627969, 0, 0.3882353, 1, 1,
0.2422805, 0.487833, 0.3310945, 0, 0.3803922, 1, 1,
0.2425777, 0.895982, 0.8385043, 0, 0.3764706, 1, 1,
0.25848, 0.2310705, 0.319289, 0, 0.3686275, 1, 1,
0.2596255, 0.3357521, 1.118335, 0, 0.3647059, 1, 1,
0.2620642, -0.983368, 4.876332, 0, 0.3568628, 1, 1,
0.2627333, -0.7872673, 4.269127, 0, 0.3529412, 1, 1,
0.2664892, -1.069321, 4.043329, 0, 0.345098, 1, 1,
0.2698237, -0.3797623, 1.939277, 0, 0.3411765, 1, 1,
0.2705779, 0.7607775, 0.5145717, 0, 0.3333333, 1, 1,
0.2788515, -0.2718888, 3.941636, 0, 0.3294118, 1, 1,
0.2810176, 1.009874, 0.1004247, 0, 0.3215686, 1, 1,
0.2923716, 0.6429166, 0.3267421, 0, 0.3176471, 1, 1,
0.2932121, -0.4422821, 2.154387, 0, 0.3098039, 1, 1,
0.2950367, 1.754447, -0.7842406, 0, 0.3058824, 1, 1,
0.3031086, -0.206572, 2.456812, 0, 0.2980392, 1, 1,
0.3076555, -0.8086028, 2.661078, 0, 0.2901961, 1, 1,
0.3093345, 1.660709, 1.171564, 0, 0.2862745, 1, 1,
0.310333, 0.9908874, 0.5587545, 0, 0.2784314, 1, 1,
0.3104591, 1.668722, 1.897037, 0, 0.2745098, 1, 1,
0.3112878, 0.7838583, 0.4882807, 0, 0.2666667, 1, 1,
0.3122364, -0.6961314, 3.549228, 0, 0.2627451, 1, 1,
0.3147209, -0.9951319, 2.131663, 0, 0.254902, 1, 1,
0.3180932, -1.612267, 3.728157, 0, 0.2509804, 1, 1,
0.3207508, -0.4172168, 3.432631, 0, 0.2431373, 1, 1,
0.3216483, -1.450666, 2.439527, 0, 0.2392157, 1, 1,
0.3264469, 0.8097718, -0.31781, 0, 0.2313726, 1, 1,
0.332066, 1.054651, 0.4857951, 0, 0.227451, 1, 1,
0.3347601, 0.3462533, 2.23251, 0, 0.2196078, 1, 1,
0.3355926, 1.089054, -1.392982, 0, 0.2156863, 1, 1,
0.3358738, 0.8238668, -1.07924, 0, 0.2078431, 1, 1,
0.3379114, 3.400735, 1.324036, 0, 0.2039216, 1, 1,
0.3381431, -1.027284, 2.569042, 0, 0.1960784, 1, 1,
0.3386963, 2.524245, -0.8487648, 0, 0.1882353, 1, 1,
0.3429638, 2.264021, 1.675733, 0, 0.1843137, 1, 1,
0.349098, 0.6236036, 1.231116, 0, 0.1764706, 1, 1,
0.3577259, 0.7455953, 0.2469552, 0, 0.172549, 1, 1,
0.3667628, 0.7876382, 0.610265, 0, 0.1647059, 1, 1,
0.3671297, -0.5800983, 2.754763, 0, 0.1607843, 1, 1,
0.3756312, -0.2177515, 2.987718, 0, 0.1529412, 1, 1,
0.3769625, -0.2243798, 1.003111, 0, 0.1490196, 1, 1,
0.3770213, 0.4054207, -0.6068819, 0, 0.1411765, 1, 1,
0.3817674, -0.2083617, 2.98326, 0, 0.1372549, 1, 1,
0.3827197, 1.067374, -0.1528763, 0, 0.1294118, 1, 1,
0.3871419, 0.4396822, 1.493286, 0, 0.1254902, 1, 1,
0.3891202, 0.7462399, 0.4907092, 0, 0.1176471, 1, 1,
0.390918, 0.0004083575, 0.4753106, 0, 0.1137255, 1, 1,
0.3920706, -1.075757, 3.733271, 0, 0.1058824, 1, 1,
0.3923621, 0.1893995, 0.6332013, 0, 0.09803922, 1, 1,
0.3926063, -0.2722637, -0.4496921, 0, 0.09411765, 1, 1,
0.3989346, 0.4007009, 0.340461, 0, 0.08627451, 1, 1,
0.399179, -0.8233168, 4.012552, 0, 0.08235294, 1, 1,
0.4002377, -0.9404516, 2.976945, 0, 0.07450981, 1, 1,
0.406147, 0.13191, 0.3474053, 0, 0.07058824, 1, 1,
0.4074045, -0.8745381, 2.321023, 0, 0.0627451, 1, 1,
0.4085787, -2.35834, 3.142142, 0, 0.05882353, 1, 1,
0.412587, 1.452068, 0.3640682, 0, 0.05098039, 1, 1,
0.4154551, 1.269002, 1.282506, 0, 0.04705882, 1, 1,
0.4167948, -0.5561434, 2.515076, 0, 0.03921569, 1, 1,
0.419173, -1.137882, 3.761679, 0, 0.03529412, 1, 1,
0.4216006, -0.5395647, 1.886616, 0, 0.02745098, 1, 1,
0.4224384, 0.4028451, 1.52427, 0, 0.02352941, 1, 1,
0.4232274, -1.036779, 4.471413, 0, 0.01568628, 1, 1,
0.4238668, 1.499806, -1.090748, 0, 0.01176471, 1, 1,
0.4245068, -1.299634, 3.738531, 0, 0.003921569, 1, 1,
0.4248259, 0.1282283, 2.532939, 0.003921569, 0, 1, 1,
0.425362, 0.3126373, 1.378076, 0.007843138, 0, 1, 1,
0.4331989, -0.3759422, 2.710553, 0.01568628, 0, 1, 1,
0.4345602, 0.03798237, 0.8479947, 0.01960784, 0, 1, 1,
0.4346438, -0.2178625, 3.222158, 0.02745098, 0, 1, 1,
0.4349621, 0.5365142, 0.3842768, 0.03137255, 0, 1, 1,
0.4368008, 0.005248589, 1.885306, 0.03921569, 0, 1, 1,
0.4380698, 0.1261201, 0.7092668, 0.04313726, 0, 1, 1,
0.4385543, 0.0863637, 0.07674305, 0.05098039, 0, 1, 1,
0.4390821, -0.211076, 2.956471, 0.05490196, 0, 1, 1,
0.4422513, -0.2653361, 2.571803, 0.0627451, 0, 1, 1,
0.443057, 0.8137181, 1.23485, 0.06666667, 0, 1, 1,
0.444144, 0.4375231, 2.793496, 0.07450981, 0, 1, 1,
0.4474571, 0.8548989, 0.8348635, 0.07843138, 0, 1, 1,
0.4487636, 1.130801, -1.015772, 0.08627451, 0, 1, 1,
0.4520727, -2.154886, 2.76722, 0.09019608, 0, 1, 1,
0.4604216, 1.361705, 1.431632, 0.09803922, 0, 1, 1,
0.4671179, 0.9004139, -0.02783871, 0.1058824, 0, 1, 1,
0.4757857, 0.1115501, 1.18783, 0.1098039, 0, 1, 1,
0.4812963, 0.1920085, 1.34936, 0.1176471, 0, 1, 1,
0.4841739, -1.575008, 4.270864, 0.1215686, 0, 1, 1,
0.4876186, 0.0376845, 0.2117469, 0.1294118, 0, 1, 1,
0.487849, -0.8486883, 3.879048, 0.1333333, 0, 1, 1,
0.492583, -2.177567, 3.03497, 0.1411765, 0, 1, 1,
0.4931304, -2.049778, 2.665524, 0.145098, 0, 1, 1,
0.5049118, 3.215655, -0.1044382, 0.1529412, 0, 1, 1,
0.5062655, -1.406267, 4.528907, 0.1568628, 0, 1, 1,
0.5079399, -0.7541276, 2.827681, 0.1647059, 0, 1, 1,
0.5121874, 0.01259947, 1.679217, 0.1686275, 0, 1, 1,
0.5145294, 0.4167297, 2.122031, 0.1764706, 0, 1, 1,
0.514837, 0.7063408, 1.264684, 0.1803922, 0, 1, 1,
0.5193853, 0.7279072, 1.537574, 0.1882353, 0, 1, 1,
0.5204253, 0.2314622, 1.421812, 0.1921569, 0, 1, 1,
0.5294257, -1.270005, 4.415401, 0.2, 0, 1, 1,
0.5320493, 0.1864559, 2.036472, 0.2078431, 0, 1, 1,
0.543943, 0.5091238, 0.666553, 0.2117647, 0, 1, 1,
0.5484522, -0.5559263, 3.318873, 0.2196078, 0, 1, 1,
0.5509184, 0.5293014, -0.6879614, 0.2235294, 0, 1, 1,
0.552235, -0.4076211, 1.991359, 0.2313726, 0, 1, 1,
0.5537607, 0.3238072, 3.206981, 0.2352941, 0, 1, 1,
0.554902, 0.8316019, 0.4953119, 0.2431373, 0, 1, 1,
0.5561987, 0.2150105, 0.1708468, 0.2470588, 0, 1, 1,
0.5563442, 0.1084961, 1.651657, 0.254902, 0, 1, 1,
0.5590155, -0.1148464, 2.408793, 0.2588235, 0, 1, 1,
0.5623097, -2.030683, 2.5413, 0.2666667, 0, 1, 1,
0.5643749, 0.659324, 0.7995426, 0.2705882, 0, 1, 1,
0.5669259, -0.2487102, 1.916138, 0.2784314, 0, 1, 1,
0.5690359, -0.3883464, 2.537649, 0.282353, 0, 1, 1,
0.5728209, 1.271139, 1.706295, 0.2901961, 0, 1, 1,
0.5737061, -1.512011, 4.203716, 0.2941177, 0, 1, 1,
0.5757214, -1.186853, 4.119312, 0.3019608, 0, 1, 1,
0.5792142, 0.2206056, 1.74706, 0.3098039, 0, 1, 1,
0.583328, -0.2085603, 1.591712, 0.3137255, 0, 1, 1,
0.585613, -1.633898, 4.63586, 0.3215686, 0, 1, 1,
0.5875126, 0.9938396, 2.715662, 0.3254902, 0, 1, 1,
0.5876914, 1.751965, -1.094775, 0.3333333, 0, 1, 1,
0.5901984, 1.142085, -0.3255959, 0.3372549, 0, 1, 1,
0.5948947, 1.434062, -0.8609078, 0.345098, 0, 1, 1,
0.5978773, 0.2230812, 1.378715, 0.3490196, 0, 1, 1,
0.6076503, 0.6137238, -0.4781058, 0.3568628, 0, 1, 1,
0.608232, 0.3888543, 1.333412, 0.3607843, 0, 1, 1,
0.6116821, -0.9369154, 1.729506, 0.3686275, 0, 1, 1,
0.6169264, -0.353852, 0.5650718, 0.372549, 0, 1, 1,
0.6179506, -1.549897, 2.074305, 0.3803922, 0, 1, 1,
0.6202786, -0.1022558, 0.2992631, 0.3843137, 0, 1, 1,
0.6204596, -0.1932672, 1.047828, 0.3921569, 0, 1, 1,
0.6238719, -0.9581786, 0.8572184, 0.3960784, 0, 1, 1,
0.6266773, -1.548206, 2.730272, 0.4039216, 0, 1, 1,
0.6274119, -0.8435048, 1.835216, 0.4117647, 0, 1, 1,
0.631947, -1.99178, 1.915462, 0.4156863, 0, 1, 1,
0.6421754, 1.953081, 0.3513429, 0.4235294, 0, 1, 1,
0.6428377, 1.301073, 1.128805, 0.427451, 0, 1, 1,
0.6452251, 0.7152186, 0.5599606, 0.4352941, 0, 1, 1,
0.6509887, 1.388981, 0.1371246, 0.4392157, 0, 1, 1,
0.6513694, 0.1615905, 0.115682, 0.4470588, 0, 1, 1,
0.6546668, -1.248356, 2.949775, 0.4509804, 0, 1, 1,
0.6566532, 1.210064, 0.973071, 0.4588235, 0, 1, 1,
0.6623006, 0.8450447, 0.7100959, 0.4627451, 0, 1, 1,
0.667532, -0.03216235, 1.670008, 0.4705882, 0, 1, 1,
0.6692018, 3.01025, 0.8769172, 0.4745098, 0, 1, 1,
0.6704234, -0.5543641, -0.06690346, 0.4823529, 0, 1, 1,
0.6718273, 0.9378645, 0.1818693, 0.4862745, 0, 1, 1,
0.6741541, -0.6431499, 2.232134, 0.4941176, 0, 1, 1,
0.6766681, 0.8605163, 2.017351, 0.5019608, 0, 1, 1,
0.6794378, -1.395078, 2.355172, 0.5058824, 0, 1, 1,
0.6901855, 1.217209, -0.3064574, 0.5137255, 0, 1, 1,
0.6918713, -1.541568, 2.543337, 0.5176471, 0, 1, 1,
0.6921517, -0.03945805, 0.8842422, 0.5254902, 0, 1, 1,
0.6942262, 0.8141713, 2.256339, 0.5294118, 0, 1, 1,
0.6948164, -2.66095, 2.08203, 0.5372549, 0, 1, 1,
0.6962727, -2.082776, 2.666399, 0.5411765, 0, 1, 1,
0.6998937, 0.2637717, 0.6444391, 0.5490196, 0, 1, 1,
0.7011847, 0.1294888, 2.66958, 0.5529412, 0, 1, 1,
0.7028903, -0.8529449, 1.626809, 0.5607843, 0, 1, 1,
0.7057359, -0.4077447, 4.015827, 0.5647059, 0, 1, 1,
0.7073547, -0.3697235, 1.172543, 0.572549, 0, 1, 1,
0.7094986, 0.6993297, -0.08482579, 0.5764706, 0, 1, 1,
0.7160001, 1.04901, -1.006829, 0.5843138, 0, 1, 1,
0.7165452, 0.756162, 0.8557634, 0.5882353, 0, 1, 1,
0.7218418, -0.7879742, 2.627013, 0.5960785, 0, 1, 1,
0.7258157, -2.644287, 3.110726, 0.6039216, 0, 1, 1,
0.7259082, -0.1537145, 0.6224462, 0.6078432, 0, 1, 1,
0.7279063, -0.8956743, 2.888293, 0.6156863, 0, 1, 1,
0.7279493, 0.7111853, -0.707662, 0.6196079, 0, 1, 1,
0.7297356, 1.579456, 0.7634609, 0.627451, 0, 1, 1,
0.7321342, 0.8418596, 0.192256, 0.6313726, 0, 1, 1,
0.7328997, -0.7249695, 0.4307018, 0.6392157, 0, 1, 1,
0.7353512, 0.7800353, 0.7771385, 0.6431373, 0, 1, 1,
0.7384649, -0.3301145, 3.013968, 0.6509804, 0, 1, 1,
0.7386047, 0.4584866, 2.174538, 0.654902, 0, 1, 1,
0.7462527, 0.05859726, 1.4211, 0.6627451, 0, 1, 1,
0.7479736, -1.210181, 2.106956, 0.6666667, 0, 1, 1,
0.7493697, -0.69116, 0.6903524, 0.6745098, 0, 1, 1,
0.7559156, 0.9666463, -0.2692312, 0.6784314, 0, 1, 1,
0.7585871, 0.3655154, 1.672552, 0.6862745, 0, 1, 1,
0.7600222, -1.297661, 3.57245, 0.6901961, 0, 1, 1,
0.7650776, 0.2585763, 2.453867, 0.6980392, 0, 1, 1,
0.7652779, -0.2804666, 3.663093, 0.7058824, 0, 1, 1,
0.7720396, -0.3437777, 2.310811, 0.7098039, 0, 1, 1,
0.7731344, -0.07682198, 2.337417, 0.7176471, 0, 1, 1,
0.7778172, -0.7566056, 2.947986, 0.7215686, 0, 1, 1,
0.783958, 1.453318, 0.7436808, 0.7294118, 0, 1, 1,
0.7852159, 0.4077182, 0.2475083, 0.7333333, 0, 1, 1,
0.7879477, 0.2509871, 1.935812, 0.7411765, 0, 1, 1,
0.7900293, 0.7967936, 1.326353, 0.7450981, 0, 1, 1,
0.7949294, -0.8339751, 1.295964, 0.7529412, 0, 1, 1,
0.7953717, -0.3689967, 2.055821, 0.7568628, 0, 1, 1,
0.8009969, -1.533437, 1.312504, 0.7647059, 0, 1, 1,
0.8018959, -0.02206835, 1.015901, 0.7686275, 0, 1, 1,
0.806221, 0.05154034, 0.8487324, 0.7764706, 0, 1, 1,
0.8068739, -0.4341804, 3.285957, 0.7803922, 0, 1, 1,
0.8080859, 0.4792962, 1.668923, 0.7882353, 0, 1, 1,
0.8081059, 1.971856, -0.6375753, 0.7921569, 0, 1, 1,
0.8147599, -2.75952, 3.60532, 0.8, 0, 1, 1,
0.8159224, 1.355317, 0.7068874, 0.8078431, 0, 1, 1,
0.81957, 0.6781409, 1.004859, 0.8117647, 0, 1, 1,
0.8264382, -1.812767, 2.188972, 0.8196079, 0, 1, 1,
0.830253, -2.248339, 1.52242, 0.8235294, 0, 1, 1,
0.8309333, -1.339305, 2.083744, 0.8313726, 0, 1, 1,
0.8327256, -0.9430284, 0.6386968, 0.8352941, 0, 1, 1,
0.8375917, 0.2615264, -0.6748319, 0.8431373, 0, 1, 1,
0.8393975, -0.04205007, 1.333265, 0.8470588, 0, 1, 1,
0.8521631, -0.669169, 1.68213, 0.854902, 0, 1, 1,
0.8563625, 0.5776331, 1.905701, 0.8588235, 0, 1, 1,
0.8575575, 1.535658, 0.2641786, 0.8666667, 0, 1, 1,
0.8577996, -0.3193502, 0.3073109, 0.8705882, 0, 1, 1,
0.8653779, 1.632077, 1.669164, 0.8784314, 0, 1, 1,
0.867101, 1.055698, -0.4473945, 0.8823529, 0, 1, 1,
0.8673529, -0.4680715, 0.4901673, 0.8901961, 0, 1, 1,
0.8711501, -0.6301317, 2.977248, 0.8941177, 0, 1, 1,
0.8714207, 0.4351242, 0.8263307, 0.9019608, 0, 1, 1,
0.8759473, -0.1554492, 2.573647, 0.9098039, 0, 1, 1,
0.8768609, 1.735736, 0.5848057, 0.9137255, 0, 1, 1,
0.8802143, -0.6509175, 4.38968, 0.9215686, 0, 1, 1,
0.8852109, 0.6551229, 0.973466, 0.9254902, 0, 1, 1,
0.8871479, -0.1289404, 2.196649, 0.9333333, 0, 1, 1,
0.8972092, 0.3207514, 1.80031, 0.9372549, 0, 1, 1,
0.9066634, 0.6007158, 1.625562, 0.945098, 0, 1, 1,
0.9100536, 0.5100949, 1.205387, 0.9490196, 0, 1, 1,
0.911054, -1.014204, 3.292084, 0.9568627, 0, 1, 1,
0.9128025, 1.117189, -0.4785893, 0.9607843, 0, 1, 1,
0.9175387, 0.9414758, 0.8678198, 0.9686275, 0, 1, 1,
0.9247336, 0.7873664, 3.30841, 0.972549, 0, 1, 1,
0.9269669, -0.7213277, 2.786212, 0.9803922, 0, 1, 1,
0.9271775, -0.6524162, 2.197535, 0.9843137, 0, 1, 1,
0.9341812, -0.5838006, 0.3903916, 0.9921569, 0, 1, 1,
0.9381, -1.743555, 1.862862, 0.9960784, 0, 1, 1,
0.9399688, -0.4860041, 1.128206, 1, 0, 0.9960784, 1,
0.9476621, 2.155861, 0.2321326, 1, 0, 0.9882353, 1,
0.9512964, -0.5642425, 3.355429, 1, 0, 0.9843137, 1,
0.957885, -0.5769746, 0.7114116, 1, 0, 0.9764706, 1,
0.9599676, -1.516886, 2.12068, 1, 0, 0.972549, 1,
0.9605182, 0.5472054, 1.482121, 1, 0, 0.9647059, 1,
0.969795, 1.809066, 2.072158, 1, 0, 0.9607843, 1,
0.9713756, -0.5971152, 2.610299, 1, 0, 0.9529412, 1,
0.9739993, -0.9739723, 4.528374, 1, 0, 0.9490196, 1,
0.9743902, 0.8827623, 2.760854, 1, 0, 0.9411765, 1,
0.9781436, 0.2849845, 1.395877, 1, 0, 0.9372549, 1,
0.9783553, -0.6332144, 1.015777, 1, 0, 0.9294118, 1,
0.9843032, -0.7953278, -0.03408309, 1, 0, 0.9254902, 1,
0.9863632, -0.179688, 1.011397, 1, 0, 0.9176471, 1,
0.9868924, 0.4609821, 3.0154, 1, 0, 0.9137255, 1,
0.9909919, -0.7388067, 2.820773, 1, 0, 0.9058824, 1,
0.9949505, -1.540656, 2.550633, 1, 0, 0.9019608, 1,
0.998637, 1.844134, 1.671764, 1, 0, 0.8941177, 1,
0.9992779, 0.1113652, 1.990963, 1, 0, 0.8862745, 1,
1.007523, 0.7693832, 2.616083, 1, 0, 0.8823529, 1,
1.009426, -0.9121825, 0.9139525, 1, 0, 0.8745098, 1,
1.010461, 1.612255, 0.1228726, 1, 0, 0.8705882, 1,
1.010705, -0.1575468, 2.556516, 1, 0, 0.8627451, 1,
1.010934, 0.2071546, -1.363429, 1, 0, 0.8588235, 1,
1.019361, -0.1476436, 2.433883, 1, 0, 0.8509804, 1,
1.021981, 1.551067, 0.003774928, 1, 0, 0.8470588, 1,
1.023292, -0.8061334, 2.215889, 1, 0, 0.8392157, 1,
1.033784, -0.5760995, 3.446213, 1, 0, 0.8352941, 1,
1.034493, -1.599111, 2.989652, 1, 0, 0.827451, 1,
1.036715, 0.06750038, 0.7903833, 1, 0, 0.8235294, 1,
1.044671, 0.1443811, 0.4282591, 1, 0, 0.8156863, 1,
1.054992, 0.2351659, 0.5498265, 1, 0, 0.8117647, 1,
1.064081, 0.3463611, 2.171712, 1, 0, 0.8039216, 1,
1.064821, -0.00776621, 0.8478237, 1, 0, 0.7960784, 1,
1.07609, 0.312565, 0.6494815, 1, 0, 0.7921569, 1,
1.083332, 0.3692551, 0.8092694, 1, 0, 0.7843137, 1,
1.088418, -0.1209749, 0.2863943, 1, 0, 0.7803922, 1,
1.092023, 2.196479, 1.286058, 1, 0, 0.772549, 1,
1.09332, 0.2562785, 4.066802, 1, 0, 0.7686275, 1,
1.097666, 0.6982685, 1.124505, 1, 0, 0.7607843, 1,
1.099735, -0.2227007, 0.8218077, 1, 0, 0.7568628, 1,
1.102104, 1.602852, 0.381726, 1, 0, 0.7490196, 1,
1.103923, 1.48551, 0.5580855, 1, 0, 0.7450981, 1,
1.104978, -0.5266889, 3.312505, 1, 0, 0.7372549, 1,
1.117322, 0.07024328, 1.277476, 1, 0, 0.7333333, 1,
1.140183, 1.103853, 3.248149, 1, 0, 0.7254902, 1,
1.145915, -0.9098243, 3.397051, 1, 0, 0.7215686, 1,
1.16055, 1.296402, 0.2624812, 1, 0, 0.7137255, 1,
1.161233, 0.4903006, -0.6099126, 1, 0, 0.7098039, 1,
1.163103, -0.8602556, 1.719568, 1, 0, 0.7019608, 1,
1.164079, 0.6381993, 1.373589, 1, 0, 0.6941177, 1,
1.179433, 0.1718049, 0.4649102, 1, 0, 0.6901961, 1,
1.179952, -0.6435153, 0.4658661, 1, 0, 0.682353, 1,
1.204482, 0.2190477, 1.57849, 1, 0, 0.6784314, 1,
1.213223, -1.519614, 0.4727511, 1, 0, 0.6705883, 1,
1.22138, 1.583936, 1.077401, 1, 0, 0.6666667, 1,
1.22645, -0.3956565, 2.728406, 1, 0, 0.6588235, 1,
1.230374, -0.4890248, 2.669271, 1, 0, 0.654902, 1,
1.235244, -1.404103, 4.677103, 1, 0, 0.6470588, 1,
1.236528, 1.11564, 0.1166698, 1, 0, 0.6431373, 1,
1.23808, 0.1883804, 1.501227, 1, 0, 0.6352941, 1,
1.241994, 1.874291, 1.021845, 1, 0, 0.6313726, 1,
1.244812, 1.197952, 2.164249, 1, 0, 0.6235294, 1,
1.248611, -0.4251207, 2.49575, 1, 0, 0.6196079, 1,
1.251455, -1.240452, 2.82446, 1, 0, 0.6117647, 1,
1.251617, 0.3815302, 1.27123, 1, 0, 0.6078432, 1,
1.254087, -1.368599, 1.952586, 1, 0, 0.6, 1,
1.263348, -0.1234483, 2.09674, 1, 0, 0.5921569, 1,
1.266069, 0.8519803, 1.3615, 1, 0, 0.5882353, 1,
1.272201, -0.7081109, 2.926709, 1, 0, 0.5803922, 1,
1.2798, 0.1881804, 2.549393, 1, 0, 0.5764706, 1,
1.290264, -1.055221, 1.938927, 1, 0, 0.5686275, 1,
1.294914, -2.033323, 3.839197, 1, 0, 0.5647059, 1,
1.300334, -0.3541766, 0.487537, 1, 0, 0.5568628, 1,
1.304444, -0.481633, 1.238951, 1, 0, 0.5529412, 1,
1.307005, 1.994797, 0.8529676, 1, 0, 0.5450981, 1,
1.336295, -0.8354356, 3.578431, 1, 0, 0.5411765, 1,
1.339136, 1.661655, 1.831993, 1, 0, 0.5333334, 1,
1.340968, 1.816888, 0.258961, 1, 0, 0.5294118, 1,
1.359467, -0.3125178, 2.018337, 1, 0, 0.5215687, 1,
1.363779, 0.1030855, 1.935814, 1, 0, 0.5176471, 1,
1.36519, -1.272328, 3.436046, 1, 0, 0.509804, 1,
1.394229, 0.5507396, 1.840641, 1, 0, 0.5058824, 1,
1.399242, -0.4506617, 0.3543641, 1, 0, 0.4980392, 1,
1.404369, 0.4290946, 1.830883, 1, 0, 0.4901961, 1,
1.406138, 0.6930072, 0.8650373, 1, 0, 0.4862745, 1,
1.409371, 1.171865, 1.830692, 1, 0, 0.4784314, 1,
1.410428, -0.8029018, -0.01146886, 1, 0, 0.4745098, 1,
1.421039, 1.672311, 0.6239062, 1, 0, 0.4666667, 1,
1.421771, 1.657526, 0.6550567, 1, 0, 0.4627451, 1,
1.423831, -0.7246086, 1.288307, 1, 0, 0.454902, 1,
1.424615, -0.1419073, 0.365235, 1, 0, 0.4509804, 1,
1.475468, -1.72494, 1.950227, 1, 0, 0.4431373, 1,
1.479601, -0.5973017, 3.244807, 1, 0, 0.4392157, 1,
1.483513, 1.083085, 1.086197, 1, 0, 0.4313726, 1,
1.498972, 0.3358072, -0.4403852, 1, 0, 0.427451, 1,
1.5142, 0.4206733, 2.11131, 1, 0, 0.4196078, 1,
1.517914, 1.571684, 2.474841, 1, 0, 0.4156863, 1,
1.522295, 0.9802889, 0.9225554, 1, 0, 0.4078431, 1,
1.528247, -0.005613096, 1.853386, 1, 0, 0.4039216, 1,
1.546102, -1.345669, 3.011234, 1, 0, 0.3960784, 1,
1.551633, -0.8990453, 3.14748, 1, 0, 0.3882353, 1,
1.55217, -1.072825, 0.7060829, 1, 0, 0.3843137, 1,
1.566698, -0.5040901, 0.6903917, 1, 0, 0.3764706, 1,
1.568492, 1.345063, 3.024188, 1, 0, 0.372549, 1,
1.568905, -0.2254893, 0.7013292, 1, 0, 0.3647059, 1,
1.596392, -1.035295, 1.704731, 1, 0, 0.3607843, 1,
1.59841, -0.3494106, -1.155562, 1, 0, 0.3529412, 1,
1.602601, 2.045282, 0.5690879, 1, 0, 0.3490196, 1,
1.605153, -1.404881, 1.806905, 1, 0, 0.3411765, 1,
1.609478, -0.6740952, 2.109176, 1, 0, 0.3372549, 1,
1.610474, 1.231227, 0.6105096, 1, 0, 0.3294118, 1,
1.612222, -0.9542038, 0.1331185, 1, 0, 0.3254902, 1,
1.613823, -1.379923, 3.30264, 1, 0, 0.3176471, 1,
1.616609, -0.33967, 1.636181, 1, 0, 0.3137255, 1,
1.622811, -0.3409401, 1.505233, 1, 0, 0.3058824, 1,
1.623616, 0.2389656, 1.38296, 1, 0, 0.2980392, 1,
1.635482, 1.568348, -0.2376787, 1, 0, 0.2941177, 1,
1.652126, -1.233333, 3.85573, 1, 0, 0.2862745, 1,
1.654346, 0.2750557, 2.956279, 1, 0, 0.282353, 1,
1.654872, -0.5798494, 0.001113831, 1, 0, 0.2745098, 1,
1.663738, -0.4935656, 2.063167, 1, 0, 0.2705882, 1,
1.66839, -0.7274104, 1.001712, 1, 0, 0.2627451, 1,
1.678977, -0.5959665, 1.372362, 1, 0, 0.2588235, 1,
1.689304, 1.417575, 3.122545, 1, 0, 0.2509804, 1,
1.70193, 0.7193732, 1.342686, 1, 0, 0.2470588, 1,
1.70369, 2.889093, 1.113754, 1, 0, 0.2392157, 1,
1.730653, -0.0994227, 1.41159, 1, 0, 0.2352941, 1,
1.743862, -1.656929, 2.911273, 1, 0, 0.227451, 1,
1.800908, -0.6770871, 0.4973479, 1, 0, 0.2235294, 1,
1.807015, -0.7380739, 0.1815269, 1, 0, 0.2156863, 1,
1.83533, -0.0457218, -0.01346627, 1, 0, 0.2117647, 1,
1.839846, -0.1347739, 1.874511, 1, 0, 0.2039216, 1,
1.841845, 1.213961, 1.124077, 1, 0, 0.1960784, 1,
1.86912, -0.7979537, 1.169889, 1, 0, 0.1921569, 1,
1.887471, 1.292931, 0.04120248, 1, 0, 0.1843137, 1,
1.895614, 0.8887407, 0.8621998, 1, 0, 0.1803922, 1,
1.915101, 2.144248, -0.325132, 1, 0, 0.172549, 1,
1.938006, -0.01390647, 0.9115002, 1, 0, 0.1686275, 1,
1.938555, -0.08008309, 1.718536, 1, 0, 0.1607843, 1,
1.958178, 0.3796409, 2.400569, 1, 0, 0.1568628, 1,
1.988068, -0.1435782, 3.307638, 1, 0, 0.1490196, 1,
2.00551, -1.421496, 2.295119, 1, 0, 0.145098, 1,
2.024376, 0.9535525, -1.334568, 1, 0, 0.1372549, 1,
2.038397, -0.05275034, 4.037658, 1, 0, 0.1333333, 1,
2.099062, 0.3262176, 1.610895, 1, 0, 0.1254902, 1,
2.119529, 0.3406247, 1.773437, 1, 0, 0.1215686, 1,
2.125376, 2.100969, -0.3468851, 1, 0, 0.1137255, 1,
2.14249, -0.02175512, 0.09821294, 1, 0, 0.1098039, 1,
2.161122, 1.01546, 1.068959, 1, 0, 0.1019608, 1,
2.211427, 0.9346813, 1.794834, 1, 0, 0.09411765, 1,
2.233014, -0.7451023, 2.001282, 1, 0, 0.09019608, 1,
2.26557, -0.987076, 2.634969, 1, 0, 0.08235294, 1,
2.356779, -1.728459, 2.864917, 1, 0, 0.07843138, 1,
2.378907, -0.03460304, 2.092492, 1, 0, 0.07058824, 1,
2.401318, 1.982703, -0.08250385, 1, 0, 0.06666667, 1,
2.513979, -0.156864, -0.472811, 1, 0, 0.05882353, 1,
2.558433, -1.663506, 1.647176, 1, 0, 0.05490196, 1,
2.622422, 1.67647, 2.481838, 1, 0, 0.04705882, 1,
2.642041, -0.3630099, 2.069715, 1, 0, 0.04313726, 1,
2.651143, 0.6402632, 1.359108, 1, 0, 0.03529412, 1,
2.692341, -0.7090601, 2.917034, 1, 0, 0.03137255, 1,
2.713585, -0.562188, 0.6401616, 1, 0, 0.02352941, 1,
2.845426, 0.3006158, 2.113001, 1, 0, 0.01960784, 1,
3.138704, -0.5032373, 1.649728, 1, 0, 0.01176471, 1,
3.323291, -0.1667988, 1.402102, 1, 0, 0.007843138, 1
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
0.2355666, -4.200735, -6.582137, 0, -0.5, 0.5, 0.5,
0.2355666, -4.200735, -6.582137, 1, -0.5, 0.5, 0.5,
0.2355666, -4.200735, -6.582137, 1, 1.5, 0.5, 0.5,
0.2355666, -4.200735, -6.582137, 0, 1.5, 0.5, 0.5
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
-3.898896, 0.2979851, -6.582137, 0, -0.5, 0.5, 0.5,
-3.898896, 0.2979851, -6.582137, 1, -0.5, 0.5, 0.5,
-3.898896, 0.2979851, -6.582137, 1, 1.5, 0.5, 0.5,
-3.898896, 0.2979851, -6.582137, 0, 1.5, 0.5, 0.5
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
-3.898896, -4.200735, 0.699899, 0, -0.5, 0.5, 0.5,
-3.898896, -4.200735, 0.699899, 1, -0.5, 0.5, 0.5,
-3.898896, -4.200735, 0.699899, 1, 1.5, 0.5, 0.5,
-3.898896, -4.200735, 0.699899, 0, 1.5, 0.5, 0.5
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
-2, -3.162569, -4.901667,
3, -3.162569, -4.901667,
-2, -3.162569, -4.901667,
-2, -3.335596, -5.181745,
-1, -3.162569, -4.901667,
-1, -3.335596, -5.181745,
0, -3.162569, -4.901667,
0, -3.335596, -5.181745,
1, -3.162569, -4.901667,
1, -3.335596, -5.181745,
2, -3.162569, -4.901667,
2, -3.335596, -5.181745,
3, -3.162569, -4.901667,
3, -3.335596, -5.181745
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
-2, -3.681652, -5.741902, 0, -0.5, 0.5, 0.5,
-2, -3.681652, -5.741902, 1, -0.5, 0.5, 0.5,
-2, -3.681652, -5.741902, 1, 1.5, 0.5, 0.5,
-2, -3.681652, -5.741902, 0, 1.5, 0.5, 0.5,
-1, -3.681652, -5.741902, 0, -0.5, 0.5, 0.5,
-1, -3.681652, -5.741902, 1, -0.5, 0.5, 0.5,
-1, -3.681652, -5.741902, 1, 1.5, 0.5, 0.5,
-1, -3.681652, -5.741902, 0, 1.5, 0.5, 0.5,
0, -3.681652, -5.741902, 0, -0.5, 0.5, 0.5,
0, -3.681652, -5.741902, 1, -0.5, 0.5, 0.5,
0, -3.681652, -5.741902, 1, 1.5, 0.5, 0.5,
0, -3.681652, -5.741902, 0, 1.5, 0.5, 0.5,
1, -3.681652, -5.741902, 0, -0.5, 0.5, 0.5,
1, -3.681652, -5.741902, 1, -0.5, 0.5, 0.5,
1, -3.681652, -5.741902, 1, 1.5, 0.5, 0.5,
1, -3.681652, -5.741902, 0, 1.5, 0.5, 0.5,
2, -3.681652, -5.741902, 0, -0.5, 0.5, 0.5,
2, -3.681652, -5.741902, 1, -0.5, 0.5, 0.5,
2, -3.681652, -5.741902, 1, 1.5, 0.5, 0.5,
2, -3.681652, -5.741902, 0, 1.5, 0.5, 0.5,
3, -3.681652, -5.741902, 0, -0.5, 0.5, 0.5,
3, -3.681652, -5.741902, 1, -0.5, 0.5, 0.5,
3, -3.681652, -5.741902, 1, 1.5, 0.5, 0.5,
3, -3.681652, -5.741902, 0, 1.5, 0.5, 0.5
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
-2.944789, -3, -4.901667,
-2.944789, 3, -4.901667,
-2.944789, -3, -4.901667,
-3.103807, -3, -5.181745,
-2.944789, -2, -4.901667,
-3.103807, -2, -5.181745,
-2.944789, -1, -4.901667,
-3.103807, -1, -5.181745,
-2.944789, 0, -4.901667,
-3.103807, 0, -5.181745,
-2.944789, 1, -4.901667,
-3.103807, 1, -5.181745,
-2.944789, 2, -4.901667,
-3.103807, 2, -5.181745,
-2.944789, 3, -4.901667,
-3.103807, 3, -5.181745
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
-3.421843, -3, -5.741902, 0, -0.5, 0.5, 0.5,
-3.421843, -3, -5.741902, 1, -0.5, 0.5, 0.5,
-3.421843, -3, -5.741902, 1, 1.5, 0.5, 0.5,
-3.421843, -3, -5.741902, 0, 1.5, 0.5, 0.5,
-3.421843, -2, -5.741902, 0, -0.5, 0.5, 0.5,
-3.421843, -2, -5.741902, 1, -0.5, 0.5, 0.5,
-3.421843, -2, -5.741902, 1, 1.5, 0.5, 0.5,
-3.421843, -2, -5.741902, 0, 1.5, 0.5, 0.5,
-3.421843, -1, -5.741902, 0, -0.5, 0.5, 0.5,
-3.421843, -1, -5.741902, 1, -0.5, 0.5, 0.5,
-3.421843, -1, -5.741902, 1, 1.5, 0.5, 0.5,
-3.421843, -1, -5.741902, 0, 1.5, 0.5, 0.5,
-3.421843, 0, -5.741902, 0, -0.5, 0.5, 0.5,
-3.421843, 0, -5.741902, 1, -0.5, 0.5, 0.5,
-3.421843, 0, -5.741902, 1, 1.5, 0.5, 0.5,
-3.421843, 0, -5.741902, 0, 1.5, 0.5, 0.5,
-3.421843, 1, -5.741902, 0, -0.5, 0.5, 0.5,
-3.421843, 1, -5.741902, 1, -0.5, 0.5, 0.5,
-3.421843, 1, -5.741902, 1, 1.5, 0.5, 0.5,
-3.421843, 1, -5.741902, 0, 1.5, 0.5, 0.5,
-3.421843, 2, -5.741902, 0, -0.5, 0.5, 0.5,
-3.421843, 2, -5.741902, 1, -0.5, 0.5, 0.5,
-3.421843, 2, -5.741902, 1, 1.5, 0.5, 0.5,
-3.421843, 2, -5.741902, 0, 1.5, 0.5, 0.5,
-3.421843, 3, -5.741902, 0, -0.5, 0.5, 0.5,
-3.421843, 3, -5.741902, 1, -0.5, 0.5, 0.5,
-3.421843, 3, -5.741902, 1, 1.5, 0.5, 0.5,
-3.421843, 3, -5.741902, 0, 1.5, 0.5, 0.5
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
-2.944789, -3.162569, -4,
-2.944789, -3.162569, 6,
-2.944789, -3.162569, -4,
-3.103807, -3.335596, -4,
-2.944789, -3.162569, -2,
-3.103807, -3.335596, -2,
-2.944789, -3.162569, 0,
-3.103807, -3.335596, 0,
-2.944789, -3.162569, 2,
-3.103807, -3.335596, 2,
-2.944789, -3.162569, 4,
-3.103807, -3.335596, 4,
-2.944789, -3.162569, 6,
-3.103807, -3.335596, 6
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
-3.421843, -3.681652, -4, 0, -0.5, 0.5, 0.5,
-3.421843, -3.681652, -4, 1, -0.5, 0.5, 0.5,
-3.421843, -3.681652, -4, 1, 1.5, 0.5, 0.5,
-3.421843, -3.681652, -4, 0, 1.5, 0.5, 0.5,
-3.421843, -3.681652, -2, 0, -0.5, 0.5, 0.5,
-3.421843, -3.681652, -2, 1, -0.5, 0.5, 0.5,
-3.421843, -3.681652, -2, 1, 1.5, 0.5, 0.5,
-3.421843, -3.681652, -2, 0, 1.5, 0.5, 0.5,
-3.421843, -3.681652, 0, 0, -0.5, 0.5, 0.5,
-3.421843, -3.681652, 0, 1, -0.5, 0.5, 0.5,
-3.421843, -3.681652, 0, 1, 1.5, 0.5, 0.5,
-3.421843, -3.681652, 0, 0, 1.5, 0.5, 0.5,
-3.421843, -3.681652, 2, 0, -0.5, 0.5, 0.5,
-3.421843, -3.681652, 2, 1, -0.5, 0.5, 0.5,
-3.421843, -3.681652, 2, 1, 1.5, 0.5, 0.5,
-3.421843, -3.681652, 2, 0, 1.5, 0.5, 0.5,
-3.421843, -3.681652, 4, 0, -0.5, 0.5, 0.5,
-3.421843, -3.681652, 4, 1, -0.5, 0.5, 0.5,
-3.421843, -3.681652, 4, 1, 1.5, 0.5, 0.5,
-3.421843, -3.681652, 4, 0, 1.5, 0.5, 0.5,
-3.421843, -3.681652, 6, 0, -0.5, 0.5, 0.5,
-3.421843, -3.681652, 6, 1, -0.5, 0.5, 0.5,
-3.421843, -3.681652, 6, 1, 1.5, 0.5, 0.5,
-3.421843, -3.681652, 6, 0, 1.5, 0.5, 0.5
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
-2.944789, -3.162569, -4.901667,
-2.944789, 3.758539, -4.901667,
-2.944789, -3.162569, 6.301465,
-2.944789, 3.758539, 6.301465,
-2.944789, -3.162569, -4.901667,
-2.944789, -3.162569, 6.301465,
-2.944789, 3.758539, -4.901667,
-2.944789, 3.758539, 6.301465,
-2.944789, -3.162569, -4.901667,
3.415923, -3.162569, -4.901667,
-2.944789, -3.162569, 6.301465,
3.415923, -3.162569, 6.301465,
-2.944789, 3.758539, -4.901667,
3.415923, 3.758539, -4.901667,
-2.944789, 3.758539, 6.301465,
3.415923, 3.758539, 6.301465,
3.415923, -3.162569, -4.901667,
3.415923, 3.758539, -4.901667,
3.415923, -3.162569, 6.301465,
3.415923, 3.758539, 6.301465,
3.415923, -3.162569, -4.901667,
3.415923, -3.162569, 6.301465,
3.415923, 3.758539, -4.901667,
3.415923, 3.758539, 6.301465
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
var radius = 7.809099;
var distance = 34.74356;
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
mvMatrix.translate( -0.2355666, -0.2979851, -0.699899 );
mvMatrix.scale( 1.327422, 1.219942, 0.7536599 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.74356);
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
thiazole<-read.table("thiazole.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-thiazole$V2
```

```
## Error in eval(expr, envir, enclos): object 'thiazole' not found
```

```r
y<-thiazole$V3
```

```
## Error in eval(expr, envir, enclos): object 'thiazole' not found
```

```r
z<-thiazole$V4
```

```
## Error in eval(expr, envir, enclos): object 'thiazole' not found
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
-2.852158, -0.8944687, -2.126225, 0, 0, 1, 1, 1,
-2.70946, 0.07879768, -1.399447, 1, 0, 0, 1, 1,
-2.581809, 0.4130112, -3.119865, 1, 0, 0, 1, 1,
-2.535805, -2.290765, -3.160215, 1, 0, 0, 1, 1,
-2.497698, -0.3840876, -2.951766, 1, 0, 0, 1, 1,
-2.441953, -1.684557, -2.153721, 1, 0, 0, 1, 1,
-2.395291, -0.9437875, -2.56061, 0, 0, 0, 1, 1,
-2.365542, -0.5698848, -3.707605, 0, 0, 0, 1, 1,
-2.293265, -1.563948, -1.693997, 0, 0, 0, 1, 1,
-2.292688, 0.008053185, -2.282288, 0, 0, 0, 1, 1,
-2.272757, 0.8982512, 0.1165532, 0, 0, 0, 1, 1,
-2.226294, -0.9151759, -2.057356, 0, 0, 0, 1, 1,
-2.209527, -0.5985407, -0.2803686, 0, 0, 0, 1, 1,
-2.187782, -0.09616236, -0.3648215, 1, 1, 1, 1, 1,
-2.125736, -0.5808254, -1.499936, 1, 1, 1, 1, 1,
-2.105978, -1.217062, -1.809851, 1, 1, 1, 1, 1,
-2.077885, -0.1050505, -0.122424, 1, 1, 1, 1, 1,
-2.066649, -1.878394, -2.619138, 1, 1, 1, 1, 1,
-2.047497, -0.8369952, -3.33777, 1, 1, 1, 1, 1,
-2.038603, -1.714308, -2.854833, 1, 1, 1, 1, 1,
-2.027786, -0.04521043, -1.486163, 1, 1, 1, 1, 1,
-2.024441, 0.03325359, -1.17482, 1, 1, 1, 1, 1,
-2.023017, -1.858075, -3.433499, 1, 1, 1, 1, 1,
-2.022628, -1.297567, -2.319636, 1, 1, 1, 1, 1,
-2.012184, 0.2114433, -1.02905, 1, 1, 1, 1, 1,
-1.997425, -0.3676759, -2.008556, 1, 1, 1, 1, 1,
-1.976558, -0.007692151, -3.481426, 1, 1, 1, 1, 1,
-1.95264, -0.2267572, -1.200173, 1, 1, 1, 1, 1,
-1.943187, 0.2254426, -0.6016417, 0, 0, 1, 1, 1,
-1.942269, 1.236242, -0.4425973, 1, 0, 0, 1, 1,
-1.919065, 0.3477358, -2.093763, 1, 0, 0, 1, 1,
-1.916934, -0.7750368, -1.871648, 1, 0, 0, 1, 1,
-1.91423, 0.2473427, -1.333653, 1, 0, 0, 1, 1,
-1.856587, 1.609541, 0.4527236, 1, 0, 0, 1, 1,
-1.856531, -0.5169798, -0.823611, 0, 0, 0, 1, 1,
-1.827769, 1.46167, -1.037286, 0, 0, 0, 1, 1,
-1.82332, -0.2568673, 0.003725522, 0, 0, 0, 1, 1,
-1.811693, -0.005217742, -3.05662, 0, 0, 0, 1, 1,
-1.802423, 0.2469008, -0.4662329, 0, 0, 0, 1, 1,
-1.802272, -0.7074991, -2.927727, 0, 0, 0, 1, 1,
-1.789488, -0.8568884, -1.699462, 0, 0, 0, 1, 1,
-1.773638, -0.2010498, -0.7773091, 1, 1, 1, 1, 1,
-1.757378, -0.3633132, -2.301993, 1, 1, 1, 1, 1,
-1.750362, -0.7956498, -2.152753, 1, 1, 1, 1, 1,
-1.734175, 0.1461388, -1.634988, 1, 1, 1, 1, 1,
-1.717944, 0.8016219, -0.167529, 1, 1, 1, 1, 1,
-1.71728, 0.2920357, -2.314961, 1, 1, 1, 1, 1,
-1.702149, 2.086539, 0.1923876, 1, 1, 1, 1, 1,
-1.696126, 0.3144218, -1.082453, 1, 1, 1, 1, 1,
-1.695716, -0.5790884, -1.432, 1, 1, 1, 1, 1,
-1.679823, 0.1421971, -3.220174, 1, 1, 1, 1, 1,
-1.664993, -1.075252, -3.143614, 1, 1, 1, 1, 1,
-1.657635, 0.6289064, -2.091805, 1, 1, 1, 1, 1,
-1.651417, -0.340544, -1.728104, 1, 1, 1, 1, 1,
-1.616887, -0.9545226, -1.600289, 1, 1, 1, 1, 1,
-1.610162, 0.301641, -0.8649242, 1, 1, 1, 1, 1,
-1.590639, 0.9584268, -1.872149, 0, 0, 1, 1, 1,
-1.579697, 0.9888507, -1.049311, 1, 0, 0, 1, 1,
-1.575889, -0.8166044, -0.2528723, 1, 0, 0, 1, 1,
-1.568033, 0.7791621, -0.8188791, 1, 0, 0, 1, 1,
-1.561685, -0.6212378, -2.841389, 1, 0, 0, 1, 1,
-1.549899, 0.3744539, -0.4072053, 1, 0, 0, 1, 1,
-1.548753, -1.737216, -1.892416, 0, 0, 0, 1, 1,
-1.534321, -0.1885199, -1.410865, 0, 0, 0, 1, 1,
-1.521953, 3.657746, 0.7747068, 0, 0, 0, 1, 1,
-1.504101, 0.4050894, 0.512632, 0, 0, 0, 1, 1,
-1.500133, -0.1768196, -1.33188, 0, 0, 0, 1, 1,
-1.496128, 1.350429, -0.8067341, 0, 0, 0, 1, 1,
-1.489673, 0.4033174, -0.7872077, 0, 0, 0, 1, 1,
-1.479638, -1.347055, -2.155315, 1, 1, 1, 1, 1,
-1.46748, -0.4262926, -1.165342, 1, 1, 1, 1, 1,
-1.46699, -0.3420738, -1.024424, 1, 1, 1, 1, 1,
-1.466508, -0.1297306, -1.915803, 1, 1, 1, 1, 1,
-1.462787, -0.4619943, -1.506775, 1, 1, 1, 1, 1,
-1.458184, 0.9870545, -0.313188, 1, 1, 1, 1, 1,
-1.451623, -0.1397699, -2.482205, 1, 1, 1, 1, 1,
-1.447052, 0.4401301, -1.748605, 1, 1, 1, 1, 1,
-1.44673, 0.1461913, -1.862769, 1, 1, 1, 1, 1,
-1.441853, -1.974441, -1.207938, 1, 1, 1, 1, 1,
-1.435991, -0.04427171, -1.119008, 1, 1, 1, 1, 1,
-1.434764, -0.5391706, -1.561545, 1, 1, 1, 1, 1,
-1.434668, -1.487536, -2.195743, 1, 1, 1, 1, 1,
-1.429492, -0.4391483, -2.101043, 1, 1, 1, 1, 1,
-1.398362, -0.478019, -1.456988, 1, 1, 1, 1, 1,
-1.392106, -1.321618, -2.195627, 0, 0, 1, 1, 1,
-1.391314, 1.668818, 1.557092, 1, 0, 0, 1, 1,
-1.388075, 0.4462554, -0.5101923, 1, 0, 0, 1, 1,
-1.380498, 0.3983906, -1.210891, 1, 0, 0, 1, 1,
-1.38041, -0.2476372, -1.092462, 1, 0, 0, 1, 1,
-1.366079, 0.6207866, -0.949514, 1, 0, 0, 1, 1,
-1.361117, -0.8225638, -1.148222, 0, 0, 0, 1, 1,
-1.354841, 0.5428321, -3.049036, 0, 0, 0, 1, 1,
-1.353174, 1.754364, -1.087308, 0, 0, 0, 1, 1,
-1.351729, 0.2421294, -3.2897, 0, 0, 0, 1, 1,
-1.330545, -1.513174, -2.806683, 0, 0, 0, 1, 1,
-1.327622, -0.8570592, -1.232527, 0, 0, 0, 1, 1,
-1.321702, 0.6044562, -2.030482, 0, 0, 0, 1, 1,
-1.316853, 1.733834, 0.787349, 1, 1, 1, 1, 1,
-1.309647, 0.1885796, -2.851096, 1, 1, 1, 1, 1,
-1.296549, 0.1938906, -2.632002, 1, 1, 1, 1, 1,
-1.278831, -0.6983797, -3.491015, 1, 1, 1, 1, 1,
-1.271714, 1.070617, -2.588996, 1, 1, 1, 1, 1,
-1.266799, 0.2901213, -2.117522, 1, 1, 1, 1, 1,
-1.26646, -0.01006718, -1.895657, 1, 1, 1, 1, 1,
-1.253407, 0.4648568, -2.796331, 1, 1, 1, 1, 1,
-1.251449, -1.763854, -3.981552, 1, 1, 1, 1, 1,
-1.248297, 0.2531094, 0.2950239, 1, 1, 1, 1, 1,
-1.246838, 0.1309882, -0.9597434, 1, 1, 1, 1, 1,
-1.241725, -0.635848, -1.59175, 1, 1, 1, 1, 1,
-1.230052, 0.4153183, -0.3728815, 1, 1, 1, 1, 1,
-1.226026, -1.045482, -1.090525, 1, 1, 1, 1, 1,
-1.218599, -0.2513894, -1.8728, 1, 1, 1, 1, 1,
-1.216494, -1.360492, -1.899441, 0, 0, 1, 1, 1,
-1.19825, 1.545035, 0.1791007, 1, 0, 0, 1, 1,
-1.196932, -0.01804568, -0.2878349, 1, 0, 0, 1, 1,
-1.196886, 0.8134746, -1.105511, 1, 0, 0, 1, 1,
-1.194793, 0.221059, -1.710806, 1, 0, 0, 1, 1,
-1.194146, -0.7993155, -0.5960771, 1, 0, 0, 1, 1,
-1.181598, -0.1521411, -1.645001, 0, 0, 0, 1, 1,
-1.169413, 0.863202, 0.3193359, 0, 0, 0, 1, 1,
-1.168245, 0.5234067, -1.591105, 0, 0, 0, 1, 1,
-1.164532, 0.7029502, -0.8638617, 0, 0, 0, 1, 1,
-1.153806, -0.9147865, -0.718444, 0, 0, 0, 1, 1,
-1.150389, 0.4828375, -1.891623, 0, 0, 0, 1, 1,
-1.147311, -0.6444777, -4.471275, 0, 0, 0, 1, 1,
-1.145598, -1.428575, -1.558067, 1, 1, 1, 1, 1,
-1.144148, 1.3387, -0.3464915, 1, 1, 1, 1, 1,
-1.143492, 1.049639, -0.1417463, 1, 1, 1, 1, 1,
-1.139049, -0.3461497, -1.570093, 1, 1, 1, 1, 1,
-1.135418, 0.1247401, -2.184036, 1, 1, 1, 1, 1,
-1.133952, -1.613315, -2.472409, 1, 1, 1, 1, 1,
-1.130915, 0.8592436, -1.507532, 1, 1, 1, 1, 1,
-1.125769, 0.7502977, -2.563162, 1, 1, 1, 1, 1,
-1.11321, 1.604922, -0.3206068, 1, 1, 1, 1, 1,
-1.111045, 0.6977178, 0.3950237, 1, 1, 1, 1, 1,
-1.108035, 0.8948976, -2.176645, 1, 1, 1, 1, 1,
-1.100386, 0.4217055, -1.678784, 1, 1, 1, 1, 1,
-1.09838, 1.096158, -0.7874345, 1, 1, 1, 1, 1,
-1.096053, -0.8960043, -2.752404, 1, 1, 1, 1, 1,
-1.093619, 1.047422, -0.8792875, 1, 1, 1, 1, 1,
-1.092713, -0.5662053, -1.647532, 0, 0, 1, 1, 1,
-1.089377, 1.130087, -0.7173688, 1, 0, 0, 1, 1,
-1.088339, -0.6546281, -2.79754, 1, 0, 0, 1, 1,
-1.085542, -0.4278752, -3.60603, 1, 0, 0, 1, 1,
-1.082941, 0.4204239, -0.2949039, 1, 0, 0, 1, 1,
-1.075998, -1.19269, -1.959213, 1, 0, 0, 1, 1,
-1.075181, -0.823314, -4.565213, 0, 0, 0, 1, 1,
-1.073839, 0.9884349, -1.268697, 0, 0, 0, 1, 1,
-1.072395, 1.186881, 0.2279386, 0, 0, 0, 1, 1,
-1.072363, 0.4991121, -2.116376, 0, 0, 0, 1, 1,
-1.061055, -0.06414808, -1.2776, 0, 0, 0, 1, 1,
-1.060184, 0.8663442, -0.8858271, 0, 0, 0, 1, 1,
-1.058978, 0.2000358, -2.387942, 0, 0, 0, 1, 1,
-1.05378, -0.4611201, -2.266761, 1, 1, 1, 1, 1,
-1.044467, -1.314764, -2.641755, 1, 1, 1, 1, 1,
-1.028852, 0.8576213, -0.8820658, 1, 1, 1, 1, 1,
-1.028013, 0.158662, -3.035979, 1, 1, 1, 1, 1,
-1.027398, 0.5118068, -1.080199, 1, 1, 1, 1, 1,
-1.022737, -2.045145, -1.665366, 1, 1, 1, 1, 1,
-1.018541, 0.8654541, 0.1517387, 1, 1, 1, 1, 1,
-1.016826, 0.5573392, -0.591731, 1, 1, 1, 1, 1,
-1.016659, -1.345883, -4.587396, 1, 1, 1, 1, 1,
-1.015206, 0.694065, -1.484564, 1, 1, 1, 1, 1,
-1.012251, 0.1538863, -2.190938, 1, 1, 1, 1, 1,
-1.012015, 2.03072, -1.272556, 1, 1, 1, 1, 1,
-1.004158, -0.2632417, -1.877448, 1, 1, 1, 1, 1,
-1.00266, -0.4191087, -0.8026571, 1, 1, 1, 1, 1,
-1.001152, 1.792978, 0.9587903, 1, 1, 1, 1, 1,
-0.9727859, 1.57521, 0.1137884, 0, 0, 1, 1, 1,
-0.9721023, -1.223301, -1.4903, 1, 0, 0, 1, 1,
-0.9675273, 0.4957587, -1.646047, 1, 0, 0, 1, 1,
-0.9614183, 1.085708, -3.587728, 1, 0, 0, 1, 1,
-0.9602582, 0.02804562, -2.7131, 1, 0, 0, 1, 1,
-0.960138, -0.1829829, -0.931948, 1, 0, 0, 1, 1,
-0.9572194, -0.7535366, -3.163901, 0, 0, 0, 1, 1,
-0.951865, 0.5408363, -3.755, 0, 0, 0, 1, 1,
-0.940068, 0.8566222, -0.9744629, 0, 0, 0, 1, 1,
-0.9356204, 0.6244327, -0.8523555, 0, 0, 0, 1, 1,
-0.9302626, -1.907924, -0.6372668, 0, 0, 0, 1, 1,
-0.9264302, -0.1822587, 0.04452358, 0, 0, 0, 1, 1,
-0.923843, -0.2652791, -0.6650373, 0, 0, 0, 1, 1,
-0.9153112, 1.260949, -0.04826807, 1, 1, 1, 1, 1,
-0.912787, -0.8337343, -1.390627, 1, 1, 1, 1, 1,
-0.9031822, 0.1653546, -1.445706, 1, 1, 1, 1, 1,
-0.900345, -0.7241433, -3.422723, 1, 1, 1, 1, 1,
-0.8998035, -0.5489815, -3.063291, 1, 1, 1, 1, 1,
-0.8915998, 0.7288908, -0.2262511, 1, 1, 1, 1, 1,
-0.8867746, -1.096534, -0.5799267, 1, 1, 1, 1, 1,
-0.8823069, -0.7570835, -2.900918, 1, 1, 1, 1, 1,
-0.8813569, -1.354074, -4.008038, 1, 1, 1, 1, 1,
-0.8776305, 2.013484, -1.634783, 1, 1, 1, 1, 1,
-0.8736451, 0.05297178, -1.411448, 1, 1, 1, 1, 1,
-0.8715556, -0.8399079, -1.857668, 1, 1, 1, 1, 1,
-0.8601213, 0.5846074, 1.952819, 1, 1, 1, 1, 1,
-0.8554976, -0.2927164, -2.811946, 1, 1, 1, 1, 1,
-0.8552672, -0.4776182, -2.355658, 1, 1, 1, 1, 1,
-0.851207, -0.5401238, -1.986908, 0, 0, 1, 1, 1,
-0.8499166, 0.1449093, -1.196749, 1, 0, 0, 1, 1,
-0.8469586, 1.056323, -0.6116776, 1, 0, 0, 1, 1,
-0.8371354, 1.346004, -1.632526, 1, 0, 0, 1, 1,
-0.8294349, -0.4781451, -1.905572, 1, 0, 0, 1, 1,
-0.8224267, -0.5175278, -3.020141, 1, 0, 0, 1, 1,
-0.8189382, 0.135935, -1.39423, 0, 0, 0, 1, 1,
-0.8179941, 1.835971, -1.997488, 0, 0, 0, 1, 1,
-0.8165081, -0.7518736, -3.94634, 0, 0, 0, 1, 1,
-0.8059258, 0.1781106, -1.664006, 0, 0, 0, 1, 1,
-0.8048652, 0.01617976, -2.605618, 0, 0, 0, 1, 1,
-0.7962179, 0.04631515, -2.272851, 0, 0, 0, 1, 1,
-0.7833006, 0.4409262, -1.900939, 0, 0, 0, 1, 1,
-0.7829538, 1.599838, -0.8046134, 1, 1, 1, 1, 1,
-0.7724176, 1.214936, 0.5059773, 1, 1, 1, 1, 1,
-0.7700463, -0.2494421, -1.436661, 1, 1, 1, 1, 1,
-0.7637536, -0.06261531, -0.7468039, 1, 1, 1, 1, 1,
-0.7617052, 0.07152766, -2.277471, 1, 1, 1, 1, 1,
-0.7532368, 0.156896, -1.60482, 1, 1, 1, 1, 1,
-0.7526386, 0.2849313, 0.3690155, 1, 1, 1, 1, 1,
-0.7518296, -0.4577989, 0.3859401, 1, 1, 1, 1, 1,
-0.7502756, -0.4058269, -1.988606, 1, 1, 1, 1, 1,
-0.7500722, 0.7593597, -0.08322004, 1, 1, 1, 1, 1,
-0.7464595, -1.23458, -3.141874, 1, 1, 1, 1, 1,
-0.7452236, 1.405869, 0.2594772, 1, 1, 1, 1, 1,
-0.7438184, -0.7211914, -3.536937, 1, 1, 1, 1, 1,
-0.739548, 0.6330574, -0.6104156, 1, 1, 1, 1, 1,
-0.7384578, -0.6206611, -3.420617, 1, 1, 1, 1, 1,
-0.7373002, -0.2985096, -1.490752, 0, 0, 1, 1, 1,
-0.7361634, -0.9498411, -3.081169, 1, 0, 0, 1, 1,
-0.735222, -1.15436, -3.068036, 1, 0, 0, 1, 1,
-0.7203109, 0.6986005, -0.1829414, 1, 0, 0, 1, 1,
-0.7171744, -0.1489761, -1.426862, 1, 0, 0, 1, 1,
-0.7170551, 0.5215549, -0.8844169, 1, 0, 0, 1, 1,
-0.7141817, 0.0502369, -2.18229, 0, 0, 0, 1, 1,
-0.7134452, 1.45038, -1.846618, 0, 0, 0, 1, 1,
-0.7096866, 1.780213, 0.3083437, 0, 0, 0, 1, 1,
-0.7037847, -0.003556831, -1.335847, 0, 0, 0, 1, 1,
-0.6970429, -0.474133, -2.426858, 0, 0, 0, 1, 1,
-0.6886057, 0.06567778, -2.30263, 0, 0, 0, 1, 1,
-0.6852054, -0.8647869, -2.430919, 0, 0, 0, 1, 1,
-0.6828268, 0.3372726, -0.797629, 1, 1, 1, 1, 1,
-0.6817426, 0.08683192, 0.6090013, 1, 1, 1, 1, 1,
-0.6816674, -0.3473086, -2.349444, 1, 1, 1, 1, 1,
-0.6812432, 1.094478, -0.2917657, 1, 1, 1, 1, 1,
-0.6651382, 0.5938692, -0.01897863, 1, 1, 1, 1, 1,
-0.6637205, -0.4706551, -2.823169, 1, 1, 1, 1, 1,
-0.662191, -2.50195, -3.128319, 1, 1, 1, 1, 1,
-0.6620324, 0.9810158, -0.6861369, 1, 1, 1, 1, 1,
-0.6593657, -0.536747, 0.1934427, 1, 1, 1, 1, 1,
-0.6566175, -0.4854203, -2.655202, 1, 1, 1, 1, 1,
-0.6544836, -1.071716, -1.94844, 1, 1, 1, 1, 1,
-0.6523277, 1.220696, -0.1861476, 1, 1, 1, 1, 1,
-0.6459523, -0.6591996, -2.645129, 1, 1, 1, 1, 1,
-0.6423061, 0.8981549, -1.815054, 1, 1, 1, 1, 1,
-0.6382202, -0.3099654, -3.374622, 1, 1, 1, 1, 1,
-0.6349066, -2.370559, -2.298182, 0, 0, 1, 1, 1,
-0.6330026, 0.9913785, -1.247928, 1, 0, 0, 1, 1,
-0.6313601, 1.338682, -2.105374, 1, 0, 0, 1, 1,
-0.6292543, 0.1728907, -1.276959, 1, 0, 0, 1, 1,
-0.6223018, 1.653334, -2.256647, 1, 0, 0, 1, 1,
-0.6204612, 0.9810014, -2.277299, 1, 0, 0, 1, 1,
-0.6201346, -0.2744019, 0.4530086, 0, 0, 0, 1, 1,
-0.6146724, 0.6144334, -1.17977, 0, 0, 0, 1, 1,
-0.6097664, 1.064982, -0.4963424, 0, 0, 0, 1, 1,
-0.6012215, -1.229295, -3.4349, 0, 0, 0, 1, 1,
-0.5983917, 0.009870498, -1.861322, 0, 0, 0, 1, 1,
-0.5964835, -0.2351764, -0.8821797, 0, 0, 0, 1, 1,
-0.5949625, -0.2312399, -0.5592407, 0, 0, 0, 1, 1,
-0.59462, 0.6018097, -0.2633471, 1, 1, 1, 1, 1,
-0.5941931, 0.7236556, -1.064959, 1, 1, 1, 1, 1,
-0.5877783, 1.407961, -2.039586, 1, 1, 1, 1, 1,
-0.5851156, 0.9370969, -0.5204418, 1, 1, 1, 1, 1,
-0.5783899, 1.340489, 2.078779, 1, 1, 1, 1, 1,
-0.5767758, 0.9678798, -0.8164203, 1, 1, 1, 1, 1,
-0.5738972, 0.6018767, -1.264441, 1, 1, 1, 1, 1,
-0.5737911, -0.7112883, -1.281256, 1, 1, 1, 1, 1,
-0.5725927, 1.45667, -1.178323, 1, 1, 1, 1, 1,
-0.5711842, -0.9625997, -3.879643, 1, 1, 1, 1, 1,
-0.5656136, -0.1706509, -1.882608, 1, 1, 1, 1, 1,
-0.5628896, 0.1513678, -1.515886, 1, 1, 1, 1, 1,
-0.5624052, 0.0955589, -3.023731, 1, 1, 1, 1, 1,
-0.5595898, -0.5334351, -2.360309, 1, 1, 1, 1, 1,
-0.5587977, 0.04360882, -2.483686, 1, 1, 1, 1, 1,
-0.5554904, -0.9162383, -3.376893, 0, 0, 1, 1, 1,
-0.5507374, -0.3280869, -2.295576, 1, 0, 0, 1, 1,
-0.5352398, -0.2058059, -3.032651, 1, 0, 0, 1, 1,
-0.5329593, 0.5260739, -1.712815, 1, 0, 0, 1, 1,
-0.5327426, -0.3455668, -2.362696, 1, 0, 0, 1, 1,
-0.5297772, 0.8321658, 0.2044597, 1, 0, 0, 1, 1,
-0.5297567, -1.049608, -2.684138, 0, 0, 0, 1, 1,
-0.5259594, 0.6857773, 0.8290641, 0, 0, 0, 1, 1,
-0.5254316, 0.02066901, -1.072559, 0, 0, 0, 1, 1,
-0.523924, 0.7096514, -1.254268, 0, 0, 0, 1, 1,
-0.5191942, 0.2713853, -0.9570656, 0, 0, 0, 1, 1,
-0.5159862, 0.6925857, -3.142173, 0, 0, 0, 1, 1,
-0.5137652, -1.319953, -1.647168, 0, 0, 0, 1, 1,
-0.5097222, 0.581391, -0.7933784, 1, 1, 1, 1, 1,
-0.5093675, 0.4715339, -1.197147, 1, 1, 1, 1, 1,
-0.5086904, 1.226725, -1.10518, 1, 1, 1, 1, 1,
-0.506698, 1.410595, -1.86732, 1, 1, 1, 1, 1,
-0.5039678, -0.8234696, -1.729493, 1, 1, 1, 1, 1,
-0.4994025, 0.8402308, 1.031071, 1, 1, 1, 1, 1,
-0.4983304, 0.1503115, 0.08656467, 1, 1, 1, 1, 1,
-0.4966795, 0.8605113, 0.8594378, 1, 1, 1, 1, 1,
-0.4897644, 1.20092, -1.320168, 1, 1, 1, 1, 1,
-0.4895436, -1.220872, -3.627177, 1, 1, 1, 1, 1,
-0.4836326, -0.5021063, -2.466533, 1, 1, 1, 1, 1,
-0.4834857, -0.1863447, -1.359861, 1, 1, 1, 1, 1,
-0.478321, -1.424673, -3.974621, 1, 1, 1, 1, 1,
-0.4779726, -0.8542879, -2.045858, 1, 1, 1, 1, 1,
-0.477295, -0.82796, -2.778101, 1, 1, 1, 1, 1,
-0.4712029, -0.488645, -1.107102, 0, 0, 1, 1, 1,
-0.470752, 0.4470299, 1.210878, 1, 0, 0, 1, 1,
-0.4706076, -1.085132, -1.961993, 1, 0, 0, 1, 1,
-0.4689704, 1.665324, 1.04167, 1, 0, 0, 1, 1,
-0.4621376, -0.2385947, -2.328871, 1, 0, 0, 1, 1,
-0.4620332, 1.439551, -2.125587, 1, 0, 0, 1, 1,
-0.4600094, -1.841325, -1.0957, 0, 0, 0, 1, 1,
-0.4552893, -0.7439055, -2.836134, 0, 0, 0, 1, 1,
-0.4547208, 1.088803, -1.183455, 0, 0, 0, 1, 1,
-0.4527446, 0.1628558, -1.800109, 0, 0, 0, 1, 1,
-0.4459428, -0.2823251, -4.293637, 0, 0, 0, 1, 1,
-0.4445106, 0.5966736, 0.7069449, 0, 0, 0, 1, 1,
-0.4431782, 0.2102767, -1.299256, 0, 0, 0, 1, 1,
-0.4417245, 0.173169, -3.876195, 1, 1, 1, 1, 1,
-0.4417044, -0.5966682, -2.998639, 1, 1, 1, 1, 1,
-0.4413421, 1.195658, 0.6710749, 1, 1, 1, 1, 1,
-0.4398925, -1.066141, -2.95375, 1, 1, 1, 1, 1,
-0.4394138, 0.7387937, -0.8616375, 1, 1, 1, 1, 1,
-0.4369704, 0.893216, -0.3165876, 1, 1, 1, 1, 1,
-0.4314255, 0.7922645, 0.2299216, 1, 1, 1, 1, 1,
-0.4307174, -1.382735, -3.719322, 1, 1, 1, 1, 1,
-0.4183905, -0.05722449, -3.276976, 1, 1, 1, 1, 1,
-0.4166531, -2.035464, -3.001046, 1, 1, 1, 1, 1,
-0.4141973, -1.964959, -2.910403, 1, 1, 1, 1, 1,
-0.4093031, -0.1124159, -1.374634, 1, 1, 1, 1, 1,
-0.4078711, 0.5385054, -0.8355021, 1, 1, 1, 1, 1,
-0.4062248, 0.4661619, -0.7864721, 1, 1, 1, 1, 1,
-0.4045142, 1.475225, 1.231421, 1, 1, 1, 1, 1,
-0.4024731, 0.02330255, -1.581519, 0, 0, 1, 1, 1,
-0.401395, 0.9241351, 0.063182, 1, 0, 0, 1, 1,
-0.4013495, 0.1075206, -1.01529, 1, 0, 0, 1, 1,
-0.3934767, -0.8249493, -2.559366, 1, 0, 0, 1, 1,
-0.3919095, -0.3440335, -1.991943, 1, 0, 0, 1, 1,
-0.3897161, 1.054843, -0.3280474, 1, 0, 0, 1, 1,
-0.3893101, -0.380426, -2.339706, 0, 0, 0, 1, 1,
-0.3796592, -0.3607092, -1.746117, 0, 0, 0, 1, 1,
-0.3774199, -2.032731, -3.102819, 0, 0, 0, 1, 1,
-0.3760265, -0.3376885, -1.607867, 0, 0, 0, 1, 1,
-0.3738227, -1.532693, -3.111297, 0, 0, 0, 1, 1,
-0.3716718, -1.075851, -1.374545, 0, 0, 0, 1, 1,
-0.371447, -0.56267, -2.720538, 0, 0, 0, 1, 1,
-0.3685329, 0.3143235, -1.791148, 1, 1, 1, 1, 1,
-0.3673598, -2.087686, -3.774815, 1, 1, 1, 1, 1,
-0.3671497, 1.12889, -0.3089307, 1, 1, 1, 1, 1,
-0.3653826, -1.627039, -1.927993, 1, 1, 1, 1, 1,
-0.3626951, -0.3779961, -1.675332, 1, 1, 1, 1, 1,
-0.360967, 0.9633955, -1.152543, 1, 1, 1, 1, 1,
-0.3609569, -0.8498172, -2.343833, 1, 1, 1, 1, 1,
-0.3563304, 2.105997, -0.6045071, 1, 1, 1, 1, 1,
-0.3557879, 0.5478514, -0.4623142, 1, 1, 1, 1, 1,
-0.3508676, -1.624385, -3.636297, 1, 1, 1, 1, 1,
-0.3482631, -1.483855, -4.270223, 1, 1, 1, 1, 1,
-0.3459965, 1.15937, -0.9262555, 1, 1, 1, 1, 1,
-0.3448424, 1.267556, -1.254034, 1, 1, 1, 1, 1,
-0.3442793, -1.691506, -2.784366, 1, 1, 1, 1, 1,
-0.3431928, -0.9929234, 0.3791349, 1, 1, 1, 1, 1,
-0.3419282, 1.038166, -0.2450379, 0, 0, 1, 1, 1,
-0.3387447, -0.1519893, -2.481356, 1, 0, 0, 1, 1,
-0.3272402, -1.059451, -4.040283, 1, 0, 0, 1, 1,
-0.3257972, -0.4835606, -2.365201, 1, 0, 0, 1, 1,
-0.3251817, 0.918132, 0.3905939, 1, 0, 0, 1, 1,
-0.3197615, -0.2998013, 0.06230459, 1, 0, 0, 1, 1,
-0.3182314, -1.578304, -2.76571, 0, 0, 0, 1, 1,
-0.3158168, 1.279542, -0.9133287, 0, 0, 0, 1, 1,
-0.3137698, 1.346805, 0.7154554, 0, 0, 0, 1, 1,
-0.3122865, -0.05479036, -0.9087567, 0, 0, 0, 1, 1,
-0.2996534, 0.472968, -1.092893, 0, 0, 0, 1, 1,
-0.2976124, -1.213074, -2.378038, 0, 0, 0, 1, 1,
-0.2964198, 0.4310688, 0.5568988, 0, 0, 0, 1, 1,
-0.2935066, -0.720527, -3.131038, 1, 1, 1, 1, 1,
-0.2886699, 0.502502, -1.423328, 1, 1, 1, 1, 1,
-0.2883592, -0.01280001, -2.551758, 1, 1, 1, 1, 1,
-0.2870382, 0.3095381, -1.373178, 1, 1, 1, 1, 1,
-0.2842149, 1.422335, -0.9673111, 1, 1, 1, 1, 1,
-0.2825611, -0.6269063, -1.54504, 1, 1, 1, 1, 1,
-0.2825234, -0.3889821, -3.554218, 1, 1, 1, 1, 1,
-0.2694744, 0.3843097, -0.309843, 1, 1, 1, 1, 1,
-0.2682843, -0.1349806, -1.084886, 1, 1, 1, 1, 1,
-0.2524952, 0.6542242, -1.148844, 1, 1, 1, 1, 1,
-0.2523741, 0.3930407, -1.291082, 1, 1, 1, 1, 1,
-0.2515139, -0.9694977, -3.595037, 1, 1, 1, 1, 1,
-0.2509799, -1.337524, -3.143698, 1, 1, 1, 1, 1,
-0.2487478, -1.434953, -2.350872, 1, 1, 1, 1, 1,
-0.2484921, 1.133183, -0.9505558, 1, 1, 1, 1, 1,
-0.246758, -0.1831393, -1.643471, 0, 0, 1, 1, 1,
-0.2466591, 1.598062, -1.58465, 1, 0, 0, 1, 1,
-0.2413505, 0.2721735, -2.109921, 1, 0, 0, 1, 1,
-0.2379844, -2.941603, -3.458817, 1, 0, 0, 1, 1,
-0.2345452, -0.02008799, -2.482876, 1, 0, 0, 1, 1,
-0.233694, -0.638509, -2.670245, 1, 0, 0, 1, 1,
-0.2333382, 0.5860805, 1.018401, 0, 0, 0, 1, 1,
-0.2324109, -1.360489, -1.78763, 0, 0, 0, 1, 1,
-0.230215, -0.5419146, -3.633696, 0, 0, 0, 1, 1,
-0.2244172, 2.514956, -1.547712, 0, 0, 0, 1, 1,
-0.2226692, -0.000116236, -3.140761, 0, 0, 0, 1, 1,
-0.2224716, -1.229909, -3.532786, 0, 0, 0, 1, 1,
-0.2220116, 0.8187856, -0.586748, 0, 0, 0, 1, 1,
-0.221253, -0.5584798, -2.684992, 1, 1, 1, 1, 1,
-0.2187304, 1.507296, 0.4779819, 1, 1, 1, 1, 1,
-0.2158381, -0.04206628, -2.056327, 1, 1, 1, 1, 1,
-0.2115489, -0.3032385, -1.745813, 1, 1, 1, 1, 1,
-0.2103033, 1.530624, -0.8993264, 1, 1, 1, 1, 1,
-0.2065133, 2.05372, 0.9920352, 1, 1, 1, 1, 1,
-0.2014255, -1.944126, -3.376337, 1, 1, 1, 1, 1,
-0.19999, -0.3635055, -3.97729, 1, 1, 1, 1, 1,
-0.1969396, -1.798237, -2.665925, 1, 1, 1, 1, 1,
-0.1956978, 1.189257, 0.08793249, 1, 1, 1, 1, 1,
-0.1916896, 0.249964, 1.505543, 1, 1, 1, 1, 1,
-0.1880053, 0.7186818, -1.46865, 1, 1, 1, 1, 1,
-0.1819893, -1.443904, -4.738514, 1, 1, 1, 1, 1,
-0.1785437, -1.090798, -4.203678, 1, 1, 1, 1, 1,
-0.1763331, 1.43377, -0.7231078, 1, 1, 1, 1, 1,
-0.1757422, 0.5460163, -0.08104347, 0, 0, 1, 1, 1,
-0.1748918, -0.4327347, -2.854405, 1, 0, 0, 1, 1,
-0.1741632, 0.4206923, -0.1354664, 1, 0, 0, 1, 1,
-0.174101, -0.2099791, -2.069523, 1, 0, 0, 1, 1,
-0.1719939, 1.320022, 1.457952, 1, 0, 0, 1, 1,
-0.1663488, -1.522306, -4.361377, 1, 0, 0, 1, 1,
-0.1657144, -0.8396198, -2.810346, 0, 0, 0, 1, 1,
-0.1650192, 0.3332509, 0.1416703, 0, 0, 0, 1, 1,
-0.1618526, 0.3653117, -1.754521, 0, 0, 0, 1, 1,
-0.1602108, 1.170424, 0.7788379, 0, 0, 0, 1, 1,
-0.1594523, -0.5541793, -3.781491, 0, 0, 0, 1, 1,
-0.1557755, -0.06872404, -1.324184, 0, 0, 0, 1, 1,
-0.1554438, -0.1419049, -1.997378, 0, 0, 0, 1, 1,
-0.1528961, -0.3376328, -1.946688, 1, 1, 1, 1, 1,
-0.1519871, -1.22226, -3.163164, 1, 1, 1, 1, 1,
-0.1493693, 1.885725, -0.03539184, 1, 1, 1, 1, 1,
-0.1484753, 0.1409002, -0.08225721, 1, 1, 1, 1, 1,
-0.1482394, -0.4617686, -2.291379, 1, 1, 1, 1, 1,
-0.1473998, -1.673778, -2.439979, 1, 1, 1, 1, 1,
-0.1462457, -0.2480746, -2.46327, 1, 1, 1, 1, 1,
-0.1452146, -0.06948998, -2.292162, 1, 1, 1, 1, 1,
-0.1448721, -1.190836, -2.702969, 1, 1, 1, 1, 1,
-0.139546, -0.3053417, -2.558285, 1, 1, 1, 1, 1,
-0.1316435, 0.5574871, -1.415982, 1, 1, 1, 1, 1,
-0.1311846, 2.064264, -0.2348491, 1, 1, 1, 1, 1,
-0.1262807, 1.022002, -2.261275, 1, 1, 1, 1, 1,
-0.1249847, 1.992954, 1.023186, 1, 1, 1, 1, 1,
-0.1246542, 0.6072775, 0.4290147, 1, 1, 1, 1, 1,
-0.1179097, -1.723808, -2.423491, 0, 0, 1, 1, 1,
-0.1176014, 1.052835, -0.8112482, 1, 0, 0, 1, 1,
-0.1069472, 1.50624, -0.423365, 1, 0, 0, 1, 1,
-0.1041235, 1.439368, -1.083085, 1, 0, 0, 1, 1,
-0.1037085, 0.5971429, 1.458025, 1, 0, 0, 1, 1,
-0.1031827, -0.1111913, -1.288894, 1, 0, 0, 1, 1,
-0.09958266, 0.03866345, 0.5051883, 0, 0, 0, 1, 1,
-0.09947716, 1.893096, 0.4273843, 0, 0, 0, 1, 1,
-0.09744187, -1.21492, -3.407159, 0, 0, 0, 1, 1,
-0.09294334, -0.3925327, -3.709617, 0, 0, 0, 1, 1,
-0.08996725, 1.747403, 2.808497, 0, 0, 0, 1, 1,
-0.08204679, -1.104029, -3.329083, 0, 0, 0, 1, 1,
-0.08156856, 1.077268, 0.04495243, 0, 0, 0, 1, 1,
-0.08123004, -0.4367411, -1.815705, 1, 1, 1, 1, 1,
-0.07991293, -1.323161, -3.474003, 1, 1, 1, 1, 1,
-0.07964341, -0.1566722, -1.353328, 1, 1, 1, 1, 1,
-0.07221581, 1.341845, -0.5411034, 1, 1, 1, 1, 1,
-0.06609052, 0.4381527, 0.06360848, 1, 1, 1, 1, 1,
-0.06579491, -0.2661921, -4.188646, 1, 1, 1, 1, 1,
-0.06469071, -1.397014, -2.329983, 1, 1, 1, 1, 1,
-0.06172505, -1.105221, -3.631182, 1, 1, 1, 1, 1,
-0.05996367, 0.6021994, -2.094475, 1, 1, 1, 1, 1,
-0.05944467, 0.2450693, -0.078406, 1, 1, 1, 1, 1,
-0.0593273, -0.001090091, -1.729008, 1, 1, 1, 1, 1,
-0.05600061, -0.8258037, -1.913873, 1, 1, 1, 1, 1,
-0.05536045, -1.241572, -2.849229, 1, 1, 1, 1, 1,
-0.05379127, 0.1825818, -1.300927, 1, 1, 1, 1, 1,
-0.05127051, 0.6092167, 0.1892251, 1, 1, 1, 1, 1,
-0.04938604, 1.544842, 0.3282665, 0, 0, 1, 1, 1,
-0.04785573, -1.782163, -4.341839, 1, 0, 0, 1, 1,
-0.04779528, 0.1893864, 1.345592, 1, 0, 0, 1, 1,
-0.04575221, 1.06002, 0.9820064, 1, 0, 0, 1, 1,
-0.04495899, 1.310288, -0.05654868, 1, 0, 0, 1, 1,
-0.04454273, -1.50758, -1.383443, 1, 0, 0, 1, 1,
-0.04397532, 0.5481637, 0.438322, 0, 0, 0, 1, 1,
-0.0394789, -0.9072045, -0.7793883, 0, 0, 0, 1, 1,
-0.03856206, 1.564735, -1.088344, 0, 0, 0, 1, 1,
-0.03399749, 1.762112, 1.309643, 0, 0, 0, 1, 1,
-0.03270498, 0.002737059, -1.972161, 0, 0, 0, 1, 1,
-0.0278372, 1.063175, -0.001291423, 0, 0, 0, 1, 1,
-0.02716295, -1.511036, -2.760146, 0, 0, 0, 1, 1,
-0.02591348, -0.121635, -0.7846617, 1, 1, 1, 1, 1,
-0.0251602, 0.06284747, 1.021114, 1, 1, 1, 1, 1,
-0.01823066, 0.4845312, -0.3585426, 1, 1, 1, 1, 1,
-0.017759, -0.6220856, -1.546133, 1, 1, 1, 1, 1,
-0.01718882, 0.2296465, 0.6370232, 1, 1, 1, 1, 1,
-0.01520441, 0.2619501, -0.2347542, 1, 1, 1, 1, 1,
-0.01495906, -0.9202987, -4.168861, 1, 1, 1, 1, 1,
-0.01414815, 1.027474, -2.006214, 1, 1, 1, 1, 1,
-0.009749994, -0.6125097, -2.819157, 1, 1, 1, 1, 1,
-0.009440477, -0.4711355, -1.745661, 1, 1, 1, 1, 1,
-0.005071394, 0.4602521, -0.3508394, 1, 1, 1, 1, 1,
-0.003894733, 1.334926, 0.4481824, 1, 1, 1, 1, 1,
-0.001183875, 0.5525711, -0.63799, 1, 1, 1, 1, 1,
-0.0008458694, 0.9980711, -0.03275425, 1, 1, 1, 1, 1,
0.001326548, -2.076392, 2.367552, 1, 1, 1, 1, 1,
0.001346351, -1.086586, 2.648618, 0, 0, 1, 1, 1,
0.003490713, 2.113631, -1.319091, 1, 0, 0, 1, 1,
0.0110569, 1.114792, -0.2266701, 1, 0, 0, 1, 1,
0.01219316, 2.090212, 2.708438, 1, 0, 0, 1, 1,
0.01388106, -0.3978972, 2.051037, 1, 0, 0, 1, 1,
0.01525511, 0.990777, -0.7434756, 1, 0, 0, 1, 1,
0.01578886, -0.7433553, 2.470367, 0, 0, 0, 1, 1,
0.01812911, -0.7011182, 1.51815, 0, 0, 0, 1, 1,
0.01882979, -0.9569957, 2.909521, 0, 0, 0, 1, 1,
0.02504072, -0.8632002, 2.349237, 0, 0, 0, 1, 1,
0.0268368, 2.661773, -0.2645756, 0, 0, 0, 1, 1,
0.03246523, 0.7332163, -0.6214963, 0, 0, 0, 1, 1,
0.03249529, -1.696042, 2.932482, 0, 0, 0, 1, 1,
0.03567383, 1.256186, 0.4785542, 1, 1, 1, 1, 1,
0.03756122, 0.7499965, 1.24279, 1, 1, 1, 1, 1,
0.0377999, 1.024355, 0.5242358, 1, 1, 1, 1, 1,
0.03804236, 1.193113, 0.6635318, 1, 1, 1, 1, 1,
0.04330295, -0.2001173, 3.613428, 1, 1, 1, 1, 1,
0.0460669, 0.8216347, -0.6542148, 1, 1, 1, 1, 1,
0.04721841, 0.1379903, -1.497877, 1, 1, 1, 1, 1,
0.05044694, 0.582351, 0.5335929, 1, 1, 1, 1, 1,
0.05261129, 0.2430164, -0.223294, 1, 1, 1, 1, 1,
0.05294858, 1.194054, 1.621261, 1, 1, 1, 1, 1,
0.05782387, -0.2557021, 3.685354, 1, 1, 1, 1, 1,
0.06224138, 0.2090647, 0.08332089, 1, 1, 1, 1, 1,
0.0641128, 1.202429, -0.8546284, 1, 1, 1, 1, 1,
0.06469999, -0.6495284, 0.7668238, 1, 1, 1, 1, 1,
0.06938922, -0.1168993, 2.605053, 1, 1, 1, 1, 1,
0.06941803, -1.186435, 1.450152, 0, 0, 1, 1, 1,
0.07564614, 1.275787, -0.295755, 1, 0, 0, 1, 1,
0.07717372, -1.372408, 1.450869, 1, 0, 0, 1, 1,
0.07723077, -0.8988908, 2.603923, 1, 0, 0, 1, 1,
0.07735334, 0.5979516, -1.26754, 1, 0, 0, 1, 1,
0.07812652, 0.5506899, -1.852146, 1, 0, 0, 1, 1,
0.07862689, -1.141984, 6.138312, 0, 0, 0, 1, 1,
0.07931191, 0.8353667, 1.699558, 0, 0, 0, 1, 1,
0.07948878, 1.228609, 0.6733168, 0, 0, 0, 1, 1,
0.07987312, 1.190729, 0.01392592, 0, 0, 0, 1, 1,
0.08086269, 2.174325, 0.5235797, 0, 0, 0, 1, 1,
0.09324872, 1.051914, -2.02191, 0, 0, 0, 1, 1,
0.09370343, -0.3993897, 2.478832, 0, 0, 0, 1, 1,
0.09464557, 1.005873, 0.8297306, 1, 1, 1, 1, 1,
0.09698205, -0.3377062, 3.946671, 1, 1, 1, 1, 1,
0.09718949, 0.8943258, -0.5374305, 1, 1, 1, 1, 1,
0.09790163, -0.3751997, 1.747996, 1, 1, 1, 1, 1,
0.1004699, 0.2323651, 2.55956, 1, 1, 1, 1, 1,
0.1011935, -0.4424623, 3.385336, 1, 1, 1, 1, 1,
0.1014316, 0.3970617, 0.4523607, 1, 1, 1, 1, 1,
0.1031289, -0.4797907, 2.366376, 1, 1, 1, 1, 1,
0.1160985, -1.087022, 3.551723, 1, 1, 1, 1, 1,
0.1178487, -0.9765322, 2.108632, 1, 1, 1, 1, 1,
0.1191569, -0.4360329, 3.131883, 1, 1, 1, 1, 1,
0.1192593, 2.1112, -0.5203721, 1, 1, 1, 1, 1,
0.1232841, 0.1400394, 2.780684, 1, 1, 1, 1, 1,
0.1234947, 1.064152, -1.378145, 1, 1, 1, 1, 1,
0.1241208, -0.363495, 2.199975, 1, 1, 1, 1, 1,
0.1248514, -0.4704435, 1.77668, 0, 0, 1, 1, 1,
0.1249656, -0.3499122, 2.880089, 1, 0, 0, 1, 1,
0.1304602, -1.007337, 3.401245, 1, 0, 0, 1, 1,
0.1337237, 0.8996247, -0.6805581, 1, 0, 0, 1, 1,
0.1341998, 1.265707, -0.7131072, 1, 0, 0, 1, 1,
0.1344678, 1.828947, 0.28015, 1, 0, 0, 1, 1,
0.1363609, -0.3381302, 3.300239, 0, 0, 0, 1, 1,
0.1370373, -2.073563, 3.295429, 0, 0, 0, 1, 1,
0.1452629, -0.6349751, 3.139918, 0, 0, 0, 1, 1,
0.1454635, 0.03060074, 2.57216, 0, 0, 0, 1, 1,
0.1474545, -0.04989734, 3.89941, 0, 0, 0, 1, 1,
0.1508149, 0.3829477, 0.4454762, 0, 0, 0, 1, 1,
0.1513094, 0.6596195, -0.5139837, 0, 0, 0, 1, 1,
0.1525339, -0.56396, 2.858887, 1, 1, 1, 1, 1,
0.1528825, -0.9306746, 2.33249, 1, 1, 1, 1, 1,
0.1572727, -0.9288766, 1.833801, 1, 1, 1, 1, 1,
0.1624884, 2.017528, -1.089602, 1, 1, 1, 1, 1,
0.1635458, -1.604204, 4.397639, 1, 1, 1, 1, 1,
0.1683307, -0.07486884, 1.624321, 1, 1, 1, 1, 1,
0.1686902, -0.226204, 4.36621, 1, 1, 1, 1, 1,
0.1775742, -3.061776, 3.792456, 1, 1, 1, 1, 1,
0.1780297, -0.3998184, 2.410272, 1, 1, 1, 1, 1,
0.1826688, -1.667356, 2.477572, 1, 1, 1, 1, 1,
0.1845721, 0.4042677, -0.281621, 1, 1, 1, 1, 1,
0.1849187, -1.913861, 2.363741, 1, 1, 1, 1, 1,
0.1864809, -1.010711, 2.193733, 1, 1, 1, 1, 1,
0.1911566, -0.4989723, 3.084268, 1, 1, 1, 1, 1,
0.1919509, -1.23017, 2.776297, 1, 1, 1, 1, 1,
0.1955558, 1.871554, 1.016874, 0, 0, 1, 1, 1,
0.2013543, 1.715757, 0.3179607, 1, 0, 0, 1, 1,
0.2018081, 0.04251214, 2.450342, 1, 0, 0, 1, 1,
0.2123034, -0.471192, 1.223369, 1, 0, 0, 1, 1,
0.216755, 1.421025, -0.06322432, 1, 0, 0, 1, 1,
0.2168162, -0.3706652, 3.955029, 1, 0, 0, 1, 1,
0.218509, 1.828811, -0.2753425, 0, 0, 0, 1, 1,
0.2201875, -0.9061333, 2.297355, 0, 0, 0, 1, 1,
0.2241826, 0.4996428, -1.27294, 0, 0, 0, 1, 1,
0.2262928, -0.7264067, 2.412639, 0, 0, 0, 1, 1,
0.2284023, -1.920875, 3.440681, 0, 0, 0, 1, 1,
0.2335317, -0.9060608, 2.392281, 0, 0, 0, 1, 1,
0.23354, -0.6069288, 3.472948, 0, 0, 0, 1, 1,
0.2386096, -0.2789496, 2.526491, 1, 1, 1, 1, 1,
0.2410101, -0.5046476, 1.627969, 1, 1, 1, 1, 1,
0.2422805, 0.487833, 0.3310945, 1, 1, 1, 1, 1,
0.2425777, 0.895982, 0.8385043, 1, 1, 1, 1, 1,
0.25848, 0.2310705, 0.319289, 1, 1, 1, 1, 1,
0.2596255, 0.3357521, 1.118335, 1, 1, 1, 1, 1,
0.2620642, -0.983368, 4.876332, 1, 1, 1, 1, 1,
0.2627333, -0.7872673, 4.269127, 1, 1, 1, 1, 1,
0.2664892, -1.069321, 4.043329, 1, 1, 1, 1, 1,
0.2698237, -0.3797623, 1.939277, 1, 1, 1, 1, 1,
0.2705779, 0.7607775, 0.5145717, 1, 1, 1, 1, 1,
0.2788515, -0.2718888, 3.941636, 1, 1, 1, 1, 1,
0.2810176, 1.009874, 0.1004247, 1, 1, 1, 1, 1,
0.2923716, 0.6429166, 0.3267421, 1, 1, 1, 1, 1,
0.2932121, -0.4422821, 2.154387, 1, 1, 1, 1, 1,
0.2950367, 1.754447, -0.7842406, 0, 0, 1, 1, 1,
0.3031086, -0.206572, 2.456812, 1, 0, 0, 1, 1,
0.3076555, -0.8086028, 2.661078, 1, 0, 0, 1, 1,
0.3093345, 1.660709, 1.171564, 1, 0, 0, 1, 1,
0.310333, 0.9908874, 0.5587545, 1, 0, 0, 1, 1,
0.3104591, 1.668722, 1.897037, 1, 0, 0, 1, 1,
0.3112878, 0.7838583, 0.4882807, 0, 0, 0, 1, 1,
0.3122364, -0.6961314, 3.549228, 0, 0, 0, 1, 1,
0.3147209, -0.9951319, 2.131663, 0, 0, 0, 1, 1,
0.3180932, -1.612267, 3.728157, 0, 0, 0, 1, 1,
0.3207508, -0.4172168, 3.432631, 0, 0, 0, 1, 1,
0.3216483, -1.450666, 2.439527, 0, 0, 0, 1, 1,
0.3264469, 0.8097718, -0.31781, 0, 0, 0, 1, 1,
0.332066, 1.054651, 0.4857951, 1, 1, 1, 1, 1,
0.3347601, 0.3462533, 2.23251, 1, 1, 1, 1, 1,
0.3355926, 1.089054, -1.392982, 1, 1, 1, 1, 1,
0.3358738, 0.8238668, -1.07924, 1, 1, 1, 1, 1,
0.3379114, 3.400735, 1.324036, 1, 1, 1, 1, 1,
0.3381431, -1.027284, 2.569042, 1, 1, 1, 1, 1,
0.3386963, 2.524245, -0.8487648, 1, 1, 1, 1, 1,
0.3429638, 2.264021, 1.675733, 1, 1, 1, 1, 1,
0.349098, 0.6236036, 1.231116, 1, 1, 1, 1, 1,
0.3577259, 0.7455953, 0.2469552, 1, 1, 1, 1, 1,
0.3667628, 0.7876382, 0.610265, 1, 1, 1, 1, 1,
0.3671297, -0.5800983, 2.754763, 1, 1, 1, 1, 1,
0.3756312, -0.2177515, 2.987718, 1, 1, 1, 1, 1,
0.3769625, -0.2243798, 1.003111, 1, 1, 1, 1, 1,
0.3770213, 0.4054207, -0.6068819, 1, 1, 1, 1, 1,
0.3817674, -0.2083617, 2.98326, 0, 0, 1, 1, 1,
0.3827197, 1.067374, -0.1528763, 1, 0, 0, 1, 1,
0.3871419, 0.4396822, 1.493286, 1, 0, 0, 1, 1,
0.3891202, 0.7462399, 0.4907092, 1, 0, 0, 1, 1,
0.390918, 0.0004083575, 0.4753106, 1, 0, 0, 1, 1,
0.3920706, -1.075757, 3.733271, 1, 0, 0, 1, 1,
0.3923621, 0.1893995, 0.6332013, 0, 0, 0, 1, 1,
0.3926063, -0.2722637, -0.4496921, 0, 0, 0, 1, 1,
0.3989346, 0.4007009, 0.340461, 0, 0, 0, 1, 1,
0.399179, -0.8233168, 4.012552, 0, 0, 0, 1, 1,
0.4002377, -0.9404516, 2.976945, 0, 0, 0, 1, 1,
0.406147, 0.13191, 0.3474053, 0, 0, 0, 1, 1,
0.4074045, -0.8745381, 2.321023, 0, 0, 0, 1, 1,
0.4085787, -2.35834, 3.142142, 1, 1, 1, 1, 1,
0.412587, 1.452068, 0.3640682, 1, 1, 1, 1, 1,
0.4154551, 1.269002, 1.282506, 1, 1, 1, 1, 1,
0.4167948, -0.5561434, 2.515076, 1, 1, 1, 1, 1,
0.419173, -1.137882, 3.761679, 1, 1, 1, 1, 1,
0.4216006, -0.5395647, 1.886616, 1, 1, 1, 1, 1,
0.4224384, 0.4028451, 1.52427, 1, 1, 1, 1, 1,
0.4232274, -1.036779, 4.471413, 1, 1, 1, 1, 1,
0.4238668, 1.499806, -1.090748, 1, 1, 1, 1, 1,
0.4245068, -1.299634, 3.738531, 1, 1, 1, 1, 1,
0.4248259, 0.1282283, 2.532939, 1, 1, 1, 1, 1,
0.425362, 0.3126373, 1.378076, 1, 1, 1, 1, 1,
0.4331989, -0.3759422, 2.710553, 1, 1, 1, 1, 1,
0.4345602, 0.03798237, 0.8479947, 1, 1, 1, 1, 1,
0.4346438, -0.2178625, 3.222158, 1, 1, 1, 1, 1,
0.4349621, 0.5365142, 0.3842768, 0, 0, 1, 1, 1,
0.4368008, 0.005248589, 1.885306, 1, 0, 0, 1, 1,
0.4380698, 0.1261201, 0.7092668, 1, 0, 0, 1, 1,
0.4385543, 0.0863637, 0.07674305, 1, 0, 0, 1, 1,
0.4390821, -0.211076, 2.956471, 1, 0, 0, 1, 1,
0.4422513, -0.2653361, 2.571803, 1, 0, 0, 1, 1,
0.443057, 0.8137181, 1.23485, 0, 0, 0, 1, 1,
0.444144, 0.4375231, 2.793496, 0, 0, 0, 1, 1,
0.4474571, 0.8548989, 0.8348635, 0, 0, 0, 1, 1,
0.4487636, 1.130801, -1.015772, 0, 0, 0, 1, 1,
0.4520727, -2.154886, 2.76722, 0, 0, 0, 1, 1,
0.4604216, 1.361705, 1.431632, 0, 0, 0, 1, 1,
0.4671179, 0.9004139, -0.02783871, 0, 0, 0, 1, 1,
0.4757857, 0.1115501, 1.18783, 1, 1, 1, 1, 1,
0.4812963, 0.1920085, 1.34936, 1, 1, 1, 1, 1,
0.4841739, -1.575008, 4.270864, 1, 1, 1, 1, 1,
0.4876186, 0.0376845, 0.2117469, 1, 1, 1, 1, 1,
0.487849, -0.8486883, 3.879048, 1, 1, 1, 1, 1,
0.492583, -2.177567, 3.03497, 1, 1, 1, 1, 1,
0.4931304, -2.049778, 2.665524, 1, 1, 1, 1, 1,
0.5049118, 3.215655, -0.1044382, 1, 1, 1, 1, 1,
0.5062655, -1.406267, 4.528907, 1, 1, 1, 1, 1,
0.5079399, -0.7541276, 2.827681, 1, 1, 1, 1, 1,
0.5121874, 0.01259947, 1.679217, 1, 1, 1, 1, 1,
0.5145294, 0.4167297, 2.122031, 1, 1, 1, 1, 1,
0.514837, 0.7063408, 1.264684, 1, 1, 1, 1, 1,
0.5193853, 0.7279072, 1.537574, 1, 1, 1, 1, 1,
0.5204253, 0.2314622, 1.421812, 1, 1, 1, 1, 1,
0.5294257, -1.270005, 4.415401, 0, 0, 1, 1, 1,
0.5320493, 0.1864559, 2.036472, 1, 0, 0, 1, 1,
0.543943, 0.5091238, 0.666553, 1, 0, 0, 1, 1,
0.5484522, -0.5559263, 3.318873, 1, 0, 0, 1, 1,
0.5509184, 0.5293014, -0.6879614, 1, 0, 0, 1, 1,
0.552235, -0.4076211, 1.991359, 1, 0, 0, 1, 1,
0.5537607, 0.3238072, 3.206981, 0, 0, 0, 1, 1,
0.554902, 0.8316019, 0.4953119, 0, 0, 0, 1, 1,
0.5561987, 0.2150105, 0.1708468, 0, 0, 0, 1, 1,
0.5563442, 0.1084961, 1.651657, 0, 0, 0, 1, 1,
0.5590155, -0.1148464, 2.408793, 0, 0, 0, 1, 1,
0.5623097, -2.030683, 2.5413, 0, 0, 0, 1, 1,
0.5643749, 0.659324, 0.7995426, 0, 0, 0, 1, 1,
0.5669259, -0.2487102, 1.916138, 1, 1, 1, 1, 1,
0.5690359, -0.3883464, 2.537649, 1, 1, 1, 1, 1,
0.5728209, 1.271139, 1.706295, 1, 1, 1, 1, 1,
0.5737061, -1.512011, 4.203716, 1, 1, 1, 1, 1,
0.5757214, -1.186853, 4.119312, 1, 1, 1, 1, 1,
0.5792142, 0.2206056, 1.74706, 1, 1, 1, 1, 1,
0.583328, -0.2085603, 1.591712, 1, 1, 1, 1, 1,
0.585613, -1.633898, 4.63586, 1, 1, 1, 1, 1,
0.5875126, 0.9938396, 2.715662, 1, 1, 1, 1, 1,
0.5876914, 1.751965, -1.094775, 1, 1, 1, 1, 1,
0.5901984, 1.142085, -0.3255959, 1, 1, 1, 1, 1,
0.5948947, 1.434062, -0.8609078, 1, 1, 1, 1, 1,
0.5978773, 0.2230812, 1.378715, 1, 1, 1, 1, 1,
0.6076503, 0.6137238, -0.4781058, 1, 1, 1, 1, 1,
0.608232, 0.3888543, 1.333412, 1, 1, 1, 1, 1,
0.6116821, -0.9369154, 1.729506, 0, 0, 1, 1, 1,
0.6169264, -0.353852, 0.5650718, 1, 0, 0, 1, 1,
0.6179506, -1.549897, 2.074305, 1, 0, 0, 1, 1,
0.6202786, -0.1022558, 0.2992631, 1, 0, 0, 1, 1,
0.6204596, -0.1932672, 1.047828, 1, 0, 0, 1, 1,
0.6238719, -0.9581786, 0.8572184, 1, 0, 0, 1, 1,
0.6266773, -1.548206, 2.730272, 0, 0, 0, 1, 1,
0.6274119, -0.8435048, 1.835216, 0, 0, 0, 1, 1,
0.631947, -1.99178, 1.915462, 0, 0, 0, 1, 1,
0.6421754, 1.953081, 0.3513429, 0, 0, 0, 1, 1,
0.6428377, 1.301073, 1.128805, 0, 0, 0, 1, 1,
0.6452251, 0.7152186, 0.5599606, 0, 0, 0, 1, 1,
0.6509887, 1.388981, 0.1371246, 0, 0, 0, 1, 1,
0.6513694, 0.1615905, 0.115682, 1, 1, 1, 1, 1,
0.6546668, -1.248356, 2.949775, 1, 1, 1, 1, 1,
0.6566532, 1.210064, 0.973071, 1, 1, 1, 1, 1,
0.6623006, 0.8450447, 0.7100959, 1, 1, 1, 1, 1,
0.667532, -0.03216235, 1.670008, 1, 1, 1, 1, 1,
0.6692018, 3.01025, 0.8769172, 1, 1, 1, 1, 1,
0.6704234, -0.5543641, -0.06690346, 1, 1, 1, 1, 1,
0.6718273, 0.9378645, 0.1818693, 1, 1, 1, 1, 1,
0.6741541, -0.6431499, 2.232134, 1, 1, 1, 1, 1,
0.6766681, 0.8605163, 2.017351, 1, 1, 1, 1, 1,
0.6794378, -1.395078, 2.355172, 1, 1, 1, 1, 1,
0.6901855, 1.217209, -0.3064574, 1, 1, 1, 1, 1,
0.6918713, -1.541568, 2.543337, 1, 1, 1, 1, 1,
0.6921517, -0.03945805, 0.8842422, 1, 1, 1, 1, 1,
0.6942262, 0.8141713, 2.256339, 1, 1, 1, 1, 1,
0.6948164, -2.66095, 2.08203, 0, 0, 1, 1, 1,
0.6962727, -2.082776, 2.666399, 1, 0, 0, 1, 1,
0.6998937, 0.2637717, 0.6444391, 1, 0, 0, 1, 1,
0.7011847, 0.1294888, 2.66958, 1, 0, 0, 1, 1,
0.7028903, -0.8529449, 1.626809, 1, 0, 0, 1, 1,
0.7057359, -0.4077447, 4.015827, 1, 0, 0, 1, 1,
0.7073547, -0.3697235, 1.172543, 0, 0, 0, 1, 1,
0.7094986, 0.6993297, -0.08482579, 0, 0, 0, 1, 1,
0.7160001, 1.04901, -1.006829, 0, 0, 0, 1, 1,
0.7165452, 0.756162, 0.8557634, 0, 0, 0, 1, 1,
0.7218418, -0.7879742, 2.627013, 0, 0, 0, 1, 1,
0.7258157, -2.644287, 3.110726, 0, 0, 0, 1, 1,
0.7259082, -0.1537145, 0.6224462, 0, 0, 0, 1, 1,
0.7279063, -0.8956743, 2.888293, 1, 1, 1, 1, 1,
0.7279493, 0.7111853, -0.707662, 1, 1, 1, 1, 1,
0.7297356, 1.579456, 0.7634609, 1, 1, 1, 1, 1,
0.7321342, 0.8418596, 0.192256, 1, 1, 1, 1, 1,
0.7328997, -0.7249695, 0.4307018, 1, 1, 1, 1, 1,
0.7353512, 0.7800353, 0.7771385, 1, 1, 1, 1, 1,
0.7384649, -0.3301145, 3.013968, 1, 1, 1, 1, 1,
0.7386047, 0.4584866, 2.174538, 1, 1, 1, 1, 1,
0.7462527, 0.05859726, 1.4211, 1, 1, 1, 1, 1,
0.7479736, -1.210181, 2.106956, 1, 1, 1, 1, 1,
0.7493697, -0.69116, 0.6903524, 1, 1, 1, 1, 1,
0.7559156, 0.9666463, -0.2692312, 1, 1, 1, 1, 1,
0.7585871, 0.3655154, 1.672552, 1, 1, 1, 1, 1,
0.7600222, -1.297661, 3.57245, 1, 1, 1, 1, 1,
0.7650776, 0.2585763, 2.453867, 1, 1, 1, 1, 1,
0.7652779, -0.2804666, 3.663093, 0, 0, 1, 1, 1,
0.7720396, -0.3437777, 2.310811, 1, 0, 0, 1, 1,
0.7731344, -0.07682198, 2.337417, 1, 0, 0, 1, 1,
0.7778172, -0.7566056, 2.947986, 1, 0, 0, 1, 1,
0.783958, 1.453318, 0.7436808, 1, 0, 0, 1, 1,
0.7852159, 0.4077182, 0.2475083, 1, 0, 0, 1, 1,
0.7879477, 0.2509871, 1.935812, 0, 0, 0, 1, 1,
0.7900293, 0.7967936, 1.326353, 0, 0, 0, 1, 1,
0.7949294, -0.8339751, 1.295964, 0, 0, 0, 1, 1,
0.7953717, -0.3689967, 2.055821, 0, 0, 0, 1, 1,
0.8009969, -1.533437, 1.312504, 0, 0, 0, 1, 1,
0.8018959, -0.02206835, 1.015901, 0, 0, 0, 1, 1,
0.806221, 0.05154034, 0.8487324, 0, 0, 0, 1, 1,
0.8068739, -0.4341804, 3.285957, 1, 1, 1, 1, 1,
0.8080859, 0.4792962, 1.668923, 1, 1, 1, 1, 1,
0.8081059, 1.971856, -0.6375753, 1, 1, 1, 1, 1,
0.8147599, -2.75952, 3.60532, 1, 1, 1, 1, 1,
0.8159224, 1.355317, 0.7068874, 1, 1, 1, 1, 1,
0.81957, 0.6781409, 1.004859, 1, 1, 1, 1, 1,
0.8264382, -1.812767, 2.188972, 1, 1, 1, 1, 1,
0.830253, -2.248339, 1.52242, 1, 1, 1, 1, 1,
0.8309333, -1.339305, 2.083744, 1, 1, 1, 1, 1,
0.8327256, -0.9430284, 0.6386968, 1, 1, 1, 1, 1,
0.8375917, 0.2615264, -0.6748319, 1, 1, 1, 1, 1,
0.8393975, -0.04205007, 1.333265, 1, 1, 1, 1, 1,
0.8521631, -0.669169, 1.68213, 1, 1, 1, 1, 1,
0.8563625, 0.5776331, 1.905701, 1, 1, 1, 1, 1,
0.8575575, 1.535658, 0.2641786, 1, 1, 1, 1, 1,
0.8577996, -0.3193502, 0.3073109, 0, 0, 1, 1, 1,
0.8653779, 1.632077, 1.669164, 1, 0, 0, 1, 1,
0.867101, 1.055698, -0.4473945, 1, 0, 0, 1, 1,
0.8673529, -0.4680715, 0.4901673, 1, 0, 0, 1, 1,
0.8711501, -0.6301317, 2.977248, 1, 0, 0, 1, 1,
0.8714207, 0.4351242, 0.8263307, 1, 0, 0, 1, 1,
0.8759473, -0.1554492, 2.573647, 0, 0, 0, 1, 1,
0.8768609, 1.735736, 0.5848057, 0, 0, 0, 1, 1,
0.8802143, -0.6509175, 4.38968, 0, 0, 0, 1, 1,
0.8852109, 0.6551229, 0.973466, 0, 0, 0, 1, 1,
0.8871479, -0.1289404, 2.196649, 0, 0, 0, 1, 1,
0.8972092, 0.3207514, 1.80031, 0, 0, 0, 1, 1,
0.9066634, 0.6007158, 1.625562, 0, 0, 0, 1, 1,
0.9100536, 0.5100949, 1.205387, 1, 1, 1, 1, 1,
0.911054, -1.014204, 3.292084, 1, 1, 1, 1, 1,
0.9128025, 1.117189, -0.4785893, 1, 1, 1, 1, 1,
0.9175387, 0.9414758, 0.8678198, 1, 1, 1, 1, 1,
0.9247336, 0.7873664, 3.30841, 1, 1, 1, 1, 1,
0.9269669, -0.7213277, 2.786212, 1, 1, 1, 1, 1,
0.9271775, -0.6524162, 2.197535, 1, 1, 1, 1, 1,
0.9341812, -0.5838006, 0.3903916, 1, 1, 1, 1, 1,
0.9381, -1.743555, 1.862862, 1, 1, 1, 1, 1,
0.9399688, -0.4860041, 1.128206, 1, 1, 1, 1, 1,
0.9476621, 2.155861, 0.2321326, 1, 1, 1, 1, 1,
0.9512964, -0.5642425, 3.355429, 1, 1, 1, 1, 1,
0.957885, -0.5769746, 0.7114116, 1, 1, 1, 1, 1,
0.9599676, -1.516886, 2.12068, 1, 1, 1, 1, 1,
0.9605182, 0.5472054, 1.482121, 1, 1, 1, 1, 1,
0.969795, 1.809066, 2.072158, 0, 0, 1, 1, 1,
0.9713756, -0.5971152, 2.610299, 1, 0, 0, 1, 1,
0.9739993, -0.9739723, 4.528374, 1, 0, 0, 1, 1,
0.9743902, 0.8827623, 2.760854, 1, 0, 0, 1, 1,
0.9781436, 0.2849845, 1.395877, 1, 0, 0, 1, 1,
0.9783553, -0.6332144, 1.015777, 1, 0, 0, 1, 1,
0.9843032, -0.7953278, -0.03408309, 0, 0, 0, 1, 1,
0.9863632, -0.179688, 1.011397, 0, 0, 0, 1, 1,
0.9868924, 0.4609821, 3.0154, 0, 0, 0, 1, 1,
0.9909919, -0.7388067, 2.820773, 0, 0, 0, 1, 1,
0.9949505, -1.540656, 2.550633, 0, 0, 0, 1, 1,
0.998637, 1.844134, 1.671764, 0, 0, 0, 1, 1,
0.9992779, 0.1113652, 1.990963, 0, 0, 0, 1, 1,
1.007523, 0.7693832, 2.616083, 1, 1, 1, 1, 1,
1.009426, -0.9121825, 0.9139525, 1, 1, 1, 1, 1,
1.010461, 1.612255, 0.1228726, 1, 1, 1, 1, 1,
1.010705, -0.1575468, 2.556516, 1, 1, 1, 1, 1,
1.010934, 0.2071546, -1.363429, 1, 1, 1, 1, 1,
1.019361, -0.1476436, 2.433883, 1, 1, 1, 1, 1,
1.021981, 1.551067, 0.003774928, 1, 1, 1, 1, 1,
1.023292, -0.8061334, 2.215889, 1, 1, 1, 1, 1,
1.033784, -0.5760995, 3.446213, 1, 1, 1, 1, 1,
1.034493, -1.599111, 2.989652, 1, 1, 1, 1, 1,
1.036715, 0.06750038, 0.7903833, 1, 1, 1, 1, 1,
1.044671, 0.1443811, 0.4282591, 1, 1, 1, 1, 1,
1.054992, 0.2351659, 0.5498265, 1, 1, 1, 1, 1,
1.064081, 0.3463611, 2.171712, 1, 1, 1, 1, 1,
1.064821, -0.00776621, 0.8478237, 1, 1, 1, 1, 1,
1.07609, 0.312565, 0.6494815, 0, 0, 1, 1, 1,
1.083332, 0.3692551, 0.8092694, 1, 0, 0, 1, 1,
1.088418, -0.1209749, 0.2863943, 1, 0, 0, 1, 1,
1.092023, 2.196479, 1.286058, 1, 0, 0, 1, 1,
1.09332, 0.2562785, 4.066802, 1, 0, 0, 1, 1,
1.097666, 0.6982685, 1.124505, 1, 0, 0, 1, 1,
1.099735, -0.2227007, 0.8218077, 0, 0, 0, 1, 1,
1.102104, 1.602852, 0.381726, 0, 0, 0, 1, 1,
1.103923, 1.48551, 0.5580855, 0, 0, 0, 1, 1,
1.104978, -0.5266889, 3.312505, 0, 0, 0, 1, 1,
1.117322, 0.07024328, 1.277476, 0, 0, 0, 1, 1,
1.140183, 1.103853, 3.248149, 0, 0, 0, 1, 1,
1.145915, -0.9098243, 3.397051, 0, 0, 0, 1, 1,
1.16055, 1.296402, 0.2624812, 1, 1, 1, 1, 1,
1.161233, 0.4903006, -0.6099126, 1, 1, 1, 1, 1,
1.163103, -0.8602556, 1.719568, 1, 1, 1, 1, 1,
1.164079, 0.6381993, 1.373589, 1, 1, 1, 1, 1,
1.179433, 0.1718049, 0.4649102, 1, 1, 1, 1, 1,
1.179952, -0.6435153, 0.4658661, 1, 1, 1, 1, 1,
1.204482, 0.2190477, 1.57849, 1, 1, 1, 1, 1,
1.213223, -1.519614, 0.4727511, 1, 1, 1, 1, 1,
1.22138, 1.583936, 1.077401, 1, 1, 1, 1, 1,
1.22645, -0.3956565, 2.728406, 1, 1, 1, 1, 1,
1.230374, -0.4890248, 2.669271, 1, 1, 1, 1, 1,
1.235244, -1.404103, 4.677103, 1, 1, 1, 1, 1,
1.236528, 1.11564, 0.1166698, 1, 1, 1, 1, 1,
1.23808, 0.1883804, 1.501227, 1, 1, 1, 1, 1,
1.241994, 1.874291, 1.021845, 1, 1, 1, 1, 1,
1.244812, 1.197952, 2.164249, 0, 0, 1, 1, 1,
1.248611, -0.4251207, 2.49575, 1, 0, 0, 1, 1,
1.251455, -1.240452, 2.82446, 1, 0, 0, 1, 1,
1.251617, 0.3815302, 1.27123, 1, 0, 0, 1, 1,
1.254087, -1.368599, 1.952586, 1, 0, 0, 1, 1,
1.263348, -0.1234483, 2.09674, 1, 0, 0, 1, 1,
1.266069, 0.8519803, 1.3615, 0, 0, 0, 1, 1,
1.272201, -0.7081109, 2.926709, 0, 0, 0, 1, 1,
1.2798, 0.1881804, 2.549393, 0, 0, 0, 1, 1,
1.290264, -1.055221, 1.938927, 0, 0, 0, 1, 1,
1.294914, -2.033323, 3.839197, 0, 0, 0, 1, 1,
1.300334, -0.3541766, 0.487537, 0, 0, 0, 1, 1,
1.304444, -0.481633, 1.238951, 0, 0, 0, 1, 1,
1.307005, 1.994797, 0.8529676, 1, 1, 1, 1, 1,
1.336295, -0.8354356, 3.578431, 1, 1, 1, 1, 1,
1.339136, 1.661655, 1.831993, 1, 1, 1, 1, 1,
1.340968, 1.816888, 0.258961, 1, 1, 1, 1, 1,
1.359467, -0.3125178, 2.018337, 1, 1, 1, 1, 1,
1.363779, 0.1030855, 1.935814, 1, 1, 1, 1, 1,
1.36519, -1.272328, 3.436046, 1, 1, 1, 1, 1,
1.394229, 0.5507396, 1.840641, 1, 1, 1, 1, 1,
1.399242, -0.4506617, 0.3543641, 1, 1, 1, 1, 1,
1.404369, 0.4290946, 1.830883, 1, 1, 1, 1, 1,
1.406138, 0.6930072, 0.8650373, 1, 1, 1, 1, 1,
1.409371, 1.171865, 1.830692, 1, 1, 1, 1, 1,
1.410428, -0.8029018, -0.01146886, 1, 1, 1, 1, 1,
1.421039, 1.672311, 0.6239062, 1, 1, 1, 1, 1,
1.421771, 1.657526, 0.6550567, 1, 1, 1, 1, 1,
1.423831, -0.7246086, 1.288307, 0, 0, 1, 1, 1,
1.424615, -0.1419073, 0.365235, 1, 0, 0, 1, 1,
1.475468, -1.72494, 1.950227, 1, 0, 0, 1, 1,
1.479601, -0.5973017, 3.244807, 1, 0, 0, 1, 1,
1.483513, 1.083085, 1.086197, 1, 0, 0, 1, 1,
1.498972, 0.3358072, -0.4403852, 1, 0, 0, 1, 1,
1.5142, 0.4206733, 2.11131, 0, 0, 0, 1, 1,
1.517914, 1.571684, 2.474841, 0, 0, 0, 1, 1,
1.522295, 0.9802889, 0.9225554, 0, 0, 0, 1, 1,
1.528247, -0.005613096, 1.853386, 0, 0, 0, 1, 1,
1.546102, -1.345669, 3.011234, 0, 0, 0, 1, 1,
1.551633, -0.8990453, 3.14748, 0, 0, 0, 1, 1,
1.55217, -1.072825, 0.7060829, 0, 0, 0, 1, 1,
1.566698, -0.5040901, 0.6903917, 1, 1, 1, 1, 1,
1.568492, 1.345063, 3.024188, 1, 1, 1, 1, 1,
1.568905, -0.2254893, 0.7013292, 1, 1, 1, 1, 1,
1.596392, -1.035295, 1.704731, 1, 1, 1, 1, 1,
1.59841, -0.3494106, -1.155562, 1, 1, 1, 1, 1,
1.602601, 2.045282, 0.5690879, 1, 1, 1, 1, 1,
1.605153, -1.404881, 1.806905, 1, 1, 1, 1, 1,
1.609478, -0.6740952, 2.109176, 1, 1, 1, 1, 1,
1.610474, 1.231227, 0.6105096, 1, 1, 1, 1, 1,
1.612222, -0.9542038, 0.1331185, 1, 1, 1, 1, 1,
1.613823, -1.379923, 3.30264, 1, 1, 1, 1, 1,
1.616609, -0.33967, 1.636181, 1, 1, 1, 1, 1,
1.622811, -0.3409401, 1.505233, 1, 1, 1, 1, 1,
1.623616, 0.2389656, 1.38296, 1, 1, 1, 1, 1,
1.635482, 1.568348, -0.2376787, 1, 1, 1, 1, 1,
1.652126, -1.233333, 3.85573, 0, 0, 1, 1, 1,
1.654346, 0.2750557, 2.956279, 1, 0, 0, 1, 1,
1.654872, -0.5798494, 0.001113831, 1, 0, 0, 1, 1,
1.663738, -0.4935656, 2.063167, 1, 0, 0, 1, 1,
1.66839, -0.7274104, 1.001712, 1, 0, 0, 1, 1,
1.678977, -0.5959665, 1.372362, 1, 0, 0, 1, 1,
1.689304, 1.417575, 3.122545, 0, 0, 0, 1, 1,
1.70193, 0.7193732, 1.342686, 0, 0, 0, 1, 1,
1.70369, 2.889093, 1.113754, 0, 0, 0, 1, 1,
1.730653, -0.0994227, 1.41159, 0, 0, 0, 1, 1,
1.743862, -1.656929, 2.911273, 0, 0, 0, 1, 1,
1.800908, -0.6770871, 0.4973479, 0, 0, 0, 1, 1,
1.807015, -0.7380739, 0.1815269, 0, 0, 0, 1, 1,
1.83533, -0.0457218, -0.01346627, 1, 1, 1, 1, 1,
1.839846, -0.1347739, 1.874511, 1, 1, 1, 1, 1,
1.841845, 1.213961, 1.124077, 1, 1, 1, 1, 1,
1.86912, -0.7979537, 1.169889, 1, 1, 1, 1, 1,
1.887471, 1.292931, 0.04120248, 1, 1, 1, 1, 1,
1.895614, 0.8887407, 0.8621998, 1, 1, 1, 1, 1,
1.915101, 2.144248, -0.325132, 1, 1, 1, 1, 1,
1.938006, -0.01390647, 0.9115002, 1, 1, 1, 1, 1,
1.938555, -0.08008309, 1.718536, 1, 1, 1, 1, 1,
1.958178, 0.3796409, 2.400569, 1, 1, 1, 1, 1,
1.988068, -0.1435782, 3.307638, 1, 1, 1, 1, 1,
2.00551, -1.421496, 2.295119, 1, 1, 1, 1, 1,
2.024376, 0.9535525, -1.334568, 1, 1, 1, 1, 1,
2.038397, -0.05275034, 4.037658, 1, 1, 1, 1, 1,
2.099062, 0.3262176, 1.610895, 1, 1, 1, 1, 1,
2.119529, 0.3406247, 1.773437, 0, 0, 1, 1, 1,
2.125376, 2.100969, -0.3468851, 1, 0, 0, 1, 1,
2.14249, -0.02175512, 0.09821294, 1, 0, 0, 1, 1,
2.161122, 1.01546, 1.068959, 1, 0, 0, 1, 1,
2.211427, 0.9346813, 1.794834, 1, 0, 0, 1, 1,
2.233014, -0.7451023, 2.001282, 1, 0, 0, 1, 1,
2.26557, -0.987076, 2.634969, 0, 0, 0, 1, 1,
2.356779, -1.728459, 2.864917, 0, 0, 0, 1, 1,
2.378907, -0.03460304, 2.092492, 0, 0, 0, 1, 1,
2.401318, 1.982703, -0.08250385, 0, 0, 0, 1, 1,
2.513979, -0.156864, -0.472811, 0, 0, 0, 1, 1,
2.558433, -1.663506, 1.647176, 0, 0, 0, 1, 1,
2.622422, 1.67647, 2.481838, 0, 0, 0, 1, 1,
2.642041, -0.3630099, 2.069715, 1, 1, 1, 1, 1,
2.651143, 0.6402632, 1.359108, 1, 1, 1, 1, 1,
2.692341, -0.7090601, 2.917034, 1, 1, 1, 1, 1,
2.713585, -0.562188, 0.6401616, 1, 1, 1, 1, 1,
2.845426, 0.3006158, 2.113001, 1, 1, 1, 1, 1,
3.138704, -0.5032373, 1.649728, 1, 1, 1, 1, 1,
3.323291, -0.1667988, 1.402102, 1, 1, 1, 1, 1
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
var radius = 9.663121;
var distance = 33.9413;
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
mvMatrix.translate( -0.2355666, -0.2979851, -0.699899 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.9413);
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
