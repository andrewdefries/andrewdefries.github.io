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
-3.428355, 0.1898286, -1.720609, 1, 0, 0, 1,
-2.872024, 0.5977908, -0.2306429, 1, 0.007843138, 0, 1,
-2.692054, -1.225604, -1.660935, 1, 0.01176471, 0, 1,
-2.625304, 0.3554091, -0.1769236, 1, 0.01960784, 0, 1,
-2.480747, 1.35807, 1.082533, 1, 0.02352941, 0, 1,
-2.44276, 0.1304328, -1.397214, 1, 0.03137255, 0, 1,
-2.298072, 0.1596406, -1.770007, 1, 0.03529412, 0, 1,
-2.252229, -1.05658, -3.129553, 1, 0.04313726, 0, 1,
-2.208318, -1.153555, -3.196156, 1, 0.04705882, 0, 1,
-2.204397, -0.5072588, -2.354822, 1, 0.05490196, 0, 1,
-2.128436, 0.1732304, -2.166671, 1, 0.05882353, 0, 1,
-2.124, 0.7071031, -1.455744, 1, 0.06666667, 0, 1,
-2.088076, 1.888134, -0.281905, 1, 0.07058824, 0, 1,
-2.063655, -1.764399, -2.796769, 1, 0.07843138, 0, 1,
-2.032165, -1.883377, -2.968659, 1, 0.08235294, 0, 1,
-2.015381, -0.6653877, -2.691646, 1, 0.09019608, 0, 1,
-2.00421, 0.6348513, 0.9733198, 1, 0.09411765, 0, 1,
-2.001168, -0.4442971, -1.220519, 1, 0.1019608, 0, 1,
-1.958405, 0.1516072, -1.936805, 1, 0.1098039, 0, 1,
-1.93208, 1.912026, -1.160837, 1, 0.1137255, 0, 1,
-1.922821, -0.5303086, -0.8703243, 1, 0.1215686, 0, 1,
-1.913216, 0.216271, -2.445483, 1, 0.1254902, 0, 1,
-1.904891, 0.04007861, -2.307042, 1, 0.1333333, 0, 1,
-1.90023, 1.109572, -1.047783, 1, 0.1372549, 0, 1,
-1.899481, -1.13863, -2.884652, 1, 0.145098, 0, 1,
-1.895217, -1.137667, -1.444643, 1, 0.1490196, 0, 1,
-1.890193, -0.816605, -1.207491, 1, 0.1568628, 0, 1,
-1.871299, 0.9138653, -0.1142503, 1, 0.1607843, 0, 1,
-1.865482, -0.6646349, -0.08114418, 1, 0.1686275, 0, 1,
-1.860438, -1.122753, -3.447034, 1, 0.172549, 0, 1,
-1.818391, 0.4715447, -0.9196976, 1, 0.1803922, 0, 1,
-1.769641, -0.1280892, -2.020899, 1, 0.1843137, 0, 1,
-1.754339, -0.3116753, -1.430818, 1, 0.1921569, 0, 1,
-1.745351, -0.9049937, -2.544081, 1, 0.1960784, 0, 1,
-1.743808, -1.873394, -2.450031, 1, 0.2039216, 0, 1,
-1.731911, 1.410118, -0.9250108, 1, 0.2117647, 0, 1,
-1.697675, -0.1835673, -0.1005789, 1, 0.2156863, 0, 1,
-1.685386, 0.7942599, -0.9989229, 1, 0.2235294, 0, 1,
-1.674233, 0.6397095, -0.8035648, 1, 0.227451, 0, 1,
-1.666238, 0.1398516, -1.441467, 1, 0.2352941, 0, 1,
-1.657135, -0.3647576, -0.9925207, 1, 0.2392157, 0, 1,
-1.640429, -1.875554, -1.861993, 1, 0.2470588, 0, 1,
-1.640076, 1.08183, -0.007154452, 1, 0.2509804, 0, 1,
-1.640002, 1.134266, -1.295233, 1, 0.2588235, 0, 1,
-1.608782, 0.9857143, -0.935648, 1, 0.2627451, 0, 1,
-1.606128, 0.3760262, -2.192196, 1, 0.2705882, 0, 1,
-1.603678, -0.5847055, -1.69089, 1, 0.2745098, 0, 1,
-1.595391, 0.5966693, -1.778357, 1, 0.282353, 0, 1,
-1.594282, 0.5032454, -2.155108, 1, 0.2862745, 0, 1,
-1.587434, 2.215211, -2.326543, 1, 0.2941177, 0, 1,
-1.585261, -0.2862358, -2.048792, 1, 0.3019608, 0, 1,
-1.549915, 0.6756514, -0.04389198, 1, 0.3058824, 0, 1,
-1.549621, -1.092279, -2.619769, 1, 0.3137255, 0, 1,
-1.52706, 0.4149856, -1.823205, 1, 0.3176471, 0, 1,
-1.524206, 0.2008016, -1.525115, 1, 0.3254902, 0, 1,
-1.521956, 0.6460683, -1.489395, 1, 0.3294118, 0, 1,
-1.512137, 0.3051485, -1.52929, 1, 0.3372549, 0, 1,
-1.509104, -1.373415, -1.624247, 1, 0.3411765, 0, 1,
-1.506716, -1.831326, -1.989612, 1, 0.3490196, 0, 1,
-1.505499, 0.9002371, -0.5032132, 1, 0.3529412, 0, 1,
-1.504989, -0.707359, -2.456415, 1, 0.3607843, 0, 1,
-1.496805, -0.5389755, -1.17734, 1, 0.3647059, 0, 1,
-1.492723, -1.133169, -3.755553, 1, 0.372549, 0, 1,
-1.492704, 1.67714, -0.9747093, 1, 0.3764706, 0, 1,
-1.489724, 1.08353, -1.607024, 1, 0.3843137, 0, 1,
-1.484612, -0.8828961, -3.508904, 1, 0.3882353, 0, 1,
-1.482737, 0.5553539, -1.790168, 1, 0.3960784, 0, 1,
-1.472517, -0.1609166, -2.231369, 1, 0.4039216, 0, 1,
-1.472226, 1.648386, -2.269252, 1, 0.4078431, 0, 1,
-1.466475, -0.2045117, -2.066589, 1, 0.4156863, 0, 1,
-1.457149, 0.4681553, -1.836856, 1, 0.4196078, 0, 1,
-1.442271, 1.517687, 1.308051, 1, 0.427451, 0, 1,
-1.437463, 0.5979436, -0.5462584, 1, 0.4313726, 0, 1,
-1.432118, 1.03547, 0.3148213, 1, 0.4392157, 0, 1,
-1.428376, -1.548477, -2.363777, 1, 0.4431373, 0, 1,
-1.422149, -1.916403, -2.882262, 1, 0.4509804, 0, 1,
-1.421664, -0.9203134, -0.7273034, 1, 0.454902, 0, 1,
-1.421621, 1.304332, 0.03672954, 1, 0.4627451, 0, 1,
-1.420777, 0.6588309, -1.072602, 1, 0.4666667, 0, 1,
-1.41668, 0.8889455, -1.435064, 1, 0.4745098, 0, 1,
-1.411079, -1.069594, -3.361835, 1, 0.4784314, 0, 1,
-1.410192, 1.197073, -0.06559651, 1, 0.4862745, 0, 1,
-1.390586, 1.273117, 0.702364, 1, 0.4901961, 0, 1,
-1.386705, 1.03385, -0.9258765, 1, 0.4980392, 0, 1,
-1.38052, -0.7057067, -3.446605, 1, 0.5058824, 0, 1,
-1.374103, -0.8139623, -2.663513, 1, 0.509804, 0, 1,
-1.372125, 0.2911956, -0.5253434, 1, 0.5176471, 0, 1,
-1.367384, -0.9664141, -2.059252, 1, 0.5215687, 0, 1,
-1.363768, -0.4283382, -2.174673, 1, 0.5294118, 0, 1,
-1.361086, -1.426178, -1.708157, 1, 0.5333334, 0, 1,
-1.360992, -0.01304865, -1.16931, 1, 0.5411765, 0, 1,
-1.355802, -0.5144044, -2.982331, 1, 0.5450981, 0, 1,
-1.35312, -1.441604, -1.594827, 1, 0.5529412, 0, 1,
-1.349723, 0.4821796, -1.463019, 1, 0.5568628, 0, 1,
-1.336942, -0.6179781, -2.2917, 1, 0.5647059, 0, 1,
-1.33579, 0.7873897, -1.842183, 1, 0.5686275, 0, 1,
-1.328597, 0.787475, 0.5966495, 1, 0.5764706, 0, 1,
-1.324419, 1.14733, -0.08555849, 1, 0.5803922, 0, 1,
-1.319064, -0.5136194, -1.627612, 1, 0.5882353, 0, 1,
-1.313174, -0.6797062, -3.053572, 1, 0.5921569, 0, 1,
-1.304117, -1.562455, -2.241204, 1, 0.6, 0, 1,
-1.298867, 1.534105, -0.5269286, 1, 0.6078432, 0, 1,
-1.297377, 0.6823085, -1.715934, 1, 0.6117647, 0, 1,
-1.291828, -0.6110525, -1.688515, 1, 0.6196079, 0, 1,
-1.288873, -0.3987451, -1.027669, 1, 0.6235294, 0, 1,
-1.281159, 0.2728707, -2.193946, 1, 0.6313726, 0, 1,
-1.277068, -0.6665052, -3.901073, 1, 0.6352941, 0, 1,
-1.272969, 0.4148068, -2.4478, 1, 0.6431373, 0, 1,
-1.270068, 1.697905, -2.701314, 1, 0.6470588, 0, 1,
-1.267347, -0.5895329, -3.181476, 1, 0.654902, 0, 1,
-1.263814, 1.6398, -0.8256714, 1, 0.6588235, 0, 1,
-1.25694, -0.9817322, -1.487583, 1, 0.6666667, 0, 1,
-1.252257, 0.08119221, -0.3086774, 1, 0.6705883, 0, 1,
-1.244882, 0.2557861, 0.561263, 1, 0.6784314, 0, 1,
-1.227069, 0.004109612, -2.790171, 1, 0.682353, 0, 1,
-1.225225, 0.6421189, -0.2252236, 1, 0.6901961, 0, 1,
-1.218657, 1.282644, -0.5830771, 1, 0.6941177, 0, 1,
-1.218125, -1.385729, -2.143584, 1, 0.7019608, 0, 1,
-1.202386, -1.73475, -3.111423, 1, 0.7098039, 0, 1,
-1.199163, -0.1998323, -2.833912, 1, 0.7137255, 0, 1,
-1.18263, -1.363197, -2.853258, 1, 0.7215686, 0, 1,
-1.181759, 0.3457102, -2.392025, 1, 0.7254902, 0, 1,
-1.17185, -1.282385, -0.9918118, 1, 0.7333333, 0, 1,
-1.168945, -0.09520911, -2.487757, 1, 0.7372549, 0, 1,
-1.160596, -0.5135643, -1.885641, 1, 0.7450981, 0, 1,
-1.157308, 1.204951, -1.783185, 1, 0.7490196, 0, 1,
-1.150247, -0.1572035, -3.422302, 1, 0.7568628, 0, 1,
-1.146936, -1.102139, -1.515601, 1, 0.7607843, 0, 1,
-1.142991, -3.232417, -3.205408, 1, 0.7686275, 0, 1,
-1.136995, -0.3416854, -2.933882, 1, 0.772549, 0, 1,
-1.134406, -0.6135474, -2.881242, 1, 0.7803922, 0, 1,
-1.13145, -0.5519281, -2.361641, 1, 0.7843137, 0, 1,
-1.125382, 0.2236811, -2.12434, 1, 0.7921569, 0, 1,
-1.122942, 0.1291309, -1.53395, 1, 0.7960784, 0, 1,
-1.122904, 1.781537, -0.6271259, 1, 0.8039216, 0, 1,
-1.11237, -1.088726, -2.884885, 1, 0.8117647, 0, 1,
-1.109573, 0.2293111, -0.9028355, 1, 0.8156863, 0, 1,
-1.107128, 0.706769, 0.028242, 1, 0.8235294, 0, 1,
-1.101965, 0.3115086, 0.1594638, 1, 0.827451, 0, 1,
-1.100148, 1.139609, -0.5780174, 1, 0.8352941, 0, 1,
-1.09606, 0.4936842, -1.575249, 1, 0.8392157, 0, 1,
-1.082444, -0.5909126, -2.240974, 1, 0.8470588, 0, 1,
-1.075967, -0.6068563, -2.836668, 1, 0.8509804, 0, 1,
-1.075783, 1.610187, -1.235588, 1, 0.8588235, 0, 1,
-1.070047, -1.117976, -3.364974, 1, 0.8627451, 0, 1,
-1.069656, -0.4285572, -1.414752, 1, 0.8705882, 0, 1,
-1.068048, 2.517141, 0.3419803, 1, 0.8745098, 0, 1,
-1.067786, -0.4900941, -3.295301, 1, 0.8823529, 0, 1,
-1.058823, 0.129522, -2.496989, 1, 0.8862745, 0, 1,
-1.057758, 0.02555071, -1.580726, 1, 0.8941177, 0, 1,
-1.047115, -1.379369, -2.618884, 1, 0.8980392, 0, 1,
-1.041668, -0.9753048, -2.515553, 1, 0.9058824, 0, 1,
-1.039637, -1.204717, -2.411446, 1, 0.9137255, 0, 1,
-1.037291, -1.071024, -3.253392, 1, 0.9176471, 0, 1,
-1.029466, 0.6269062, -3.496175, 1, 0.9254902, 0, 1,
-1.02362, 0.1694379, -0.3514383, 1, 0.9294118, 0, 1,
-1.023476, -1.504389, -4.337819, 1, 0.9372549, 0, 1,
-1.021642, 1.815812, -1.325872, 1, 0.9411765, 0, 1,
-1.021281, -0.2700422, -1.519942, 1, 0.9490196, 0, 1,
-1.015714, 0.04494841, -2.6487, 1, 0.9529412, 0, 1,
-1.001344, 0.8451649, -1.538559, 1, 0.9607843, 0, 1,
-1.000876, -1.146014, -1.703551, 1, 0.9647059, 0, 1,
-0.997641, -0.2134103, -2.746519, 1, 0.972549, 0, 1,
-0.9933711, -0.9633446, -2.558225, 1, 0.9764706, 0, 1,
-0.9915205, -1.844865, -2.707094, 1, 0.9843137, 0, 1,
-0.9779294, 1.225535, -0.4727187, 1, 0.9882353, 0, 1,
-0.9776643, 0.2140528, -0.9867744, 1, 0.9960784, 0, 1,
-0.9745044, 0.07972573, -1.298152, 0.9960784, 1, 0, 1,
-0.9683083, 0.9306267, -0.4636883, 0.9921569, 1, 0, 1,
-0.9680629, -0.4858235, -3.598591, 0.9843137, 1, 0, 1,
-0.9680514, -0.3327857, -3.17013, 0.9803922, 1, 0, 1,
-0.9586757, -0.7469292, -2.703571, 0.972549, 1, 0, 1,
-0.9572858, -0.2554793, -1.811888, 0.9686275, 1, 0, 1,
-0.9546317, 0.8325244, -1.532628, 0.9607843, 1, 0, 1,
-0.9533609, 1.786099, -2.004096, 0.9568627, 1, 0, 1,
-0.9418023, -0.8135475, -0.7332585, 0.9490196, 1, 0, 1,
-0.9349185, 1.573465, -0.1339909, 0.945098, 1, 0, 1,
-0.9220999, -1.200934, -4.99913, 0.9372549, 1, 0, 1,
-0.918227, -0.6601403, -2.479893, 0.9333333, 1, 0, 1,
-0.9173506, -0.3202452, -2.213471, 0.9254902, 1, 0, 1,
-0.9152572, -0.5844243, -1.48287, 0.9215686, 1, 0, 1,
-0.9056098, 0.6226575, -1.784533, 0.9137255, 1, 0, 1,
-0.9044637, -0.129304, -2.168293, 0.9098039, 1, 0, 1,
-0.9041776, -0.9829644, -3.127095, 0.9019608, 1, 0, 1,
-0.9005243, -0.02807328, -1.323239, 0.8941177, 1, 0, 1,
-0.891331, -0.673964, -2.691703, 0.8901961, 1, 0, 1,
-0.88004, -1.189801, -1.622743, 0.8823529, 1, 0, 1,
-0.8738455, 0.3206401, -0.4764309, 0.8784314, 1, 0, 1,
-0.8727421, 0.2748326, -1.475487, 0.8705882, 1, 0, 1,
-0.868943, -0.4546739, -1.450419, 0.8666667, 1, 0, 1,
-0.866188, 0.1492196, -0.6292691, 0.8588235, 1, 0, 1,
-0.8644406, 1.972249, 1.166425, 0.854902, 1, 0, 1,
-0.8590476, 0.6709734, -1.338966, 0.8470588, 1, 0, 1,
-0.8553287, 0.7963569, -0.5721834, 0.8431373, 1, 0, 1,
-0.8552586, 0.7102918, -0.6536986, 0.8352941, 1, 0, 1,
-0.8476329, -0.3779405, -0.8241445, 0.8313726, 1, 0, 1,
-0.8444011, 0.8419253, -1.35145, 0.8235294, 1, 0, 1,
-0.8443382, 0.53118, -2.329122, 0.8196079, 1, 0, 1,
-0.8414935, 0.09565464, -0.4248101, 0.8117647, 1, 0, 1,
-0.8360295, 0.06180583, -1.198763, 0.8078431, 1, 0, 1,
-0.826647, -0.8430972, -1.969742, 0.8, 1, 0, 1,
-0.8163127, -0.3108527, -3.519459, 0.7921569, 1, 0, 1,
-0.8132059, 0.01241248, -2.079056, 0.7882353, 1, 0, 1,
-0.8074533, 1.724777, -0.4628879, 0.7803922, 1, 0, 1,
-0.8073927, 0.6166627, -0.4497104, 0.7764706, 1, 0, 1,
-0.8068119, 1.816369, -0.3051614, 0.7686275, 1, 0, 1,
-0.7975765, -2.161832, -2.099478, 0.7647059, 1, 0, 1,
-0.7970808, 0.6202757, -0.00171976, 0.7568628, 1, 0, 1,
-0.7892628, -0.9866831, -3.244193, 0.7529412, 1, 0, 1,
-0.7891783, -0.1394182, -1.670503, 0.7450981, 1, 0, 1,
-0.7874643, -0.1464422, -3.145865, 0.7411765, 1, 0, 1,
-0.7838126, -0.6269334, -1.398881, 0.7333333, 1, 0, 1,
-0.778664, -0.0946677, -1.467525, 0.7294118, 1, 0, 1,
-0.7767568, -1.419785, -4.69621, 0.7215686, 1, 0, 1,
-0.7763989, -0.3471637, -1.500774, 0.7176471, 1, 0, 1,
-0.7759565, 0.1626431, -1.088949, 0.7098039, 1, 0, 1,
-0.770653, -0.213478, -2.279492, 0.7058824, 1, 0, 1,
-0.7649397, -1.205476, -2.58161, 0.6980392, 1, 0, 1,
-0.7452106, 0.7028397, -1.898032, 0.6901961, 1, 0, 1,
-0.7438492, -0.192474, -2.673001, 0.6862745, 1, 0, 1,
-0.7428164, 0.7364725, -1.187621, 0.6784314, 1, 0, 1,
-0.7379993, 0.7253494, -0.8378574, 0.6745098, 1, 0, 1,
-0.7316676, 1.55473, -0.9645283, 0.6666667, 1, 0, 1,
-0.7181499, 0.1158206, -1.326645, 0.6627451, 1, 0, 1,
-0.7175562, 1.950143, -0.3995703, 0.654902, 1, 0, 1,
-0.7174327, 0.9736216, -0.46743, 0.6509804, 1, 0, 1,
-0.7172559, -0.6955626, -1.356902, 0.6431373, 1, 0, 1,
-0.7089692, 1.366041, -1.69478, 0.6392157, 1, 0, 1,
-0.70661, 2.112787, -2.913388, 0.6313726, 1, 0, 1,
-0.7065437, 1.401656, -0.8331548, 0.627451, 1, 0, 1,
-0.7060778, -0.5347013, -2.618289, 0.6196079, 1, 0, 1,
-0.7042448, -2.08258, -3.085276, 0.6156863, 1, 0, 1,
-0.7041185, -0.4932792, -1.127366, 0.6078432, 1, 0, 1,
-0.7007793, -0.553932, -2.217422, 0.6039216, 1, 0, 1,
-0.6994409, -0.02847582, -0.85782, 0.5960785, 1, 0, 1,
-0.6928507, 0.1788639, 1.106225, 0.5882353, 1, 0, 1,
-0.6903912, 1.961147, 0.3441631, 0.5843138, 1, 0, 1,
-0.6893535, 0.06825951, -3.232084, 0.5764706, 1, 0, 1,
-0.6840149, -0.4728727, -2.770788, 0.572549, 1, 0, 1,
-0.680985, 0.04126842, -1.846265, 0.5647059, 1, 0, 1,
-0.6798564, -1.362781, -2.922072, 0.5607843, 1, 0, 1,
-0.672133, -0.3672628, -1.262923, 0.5529412, 1, 0, 1,
-0.6526701, -0.9649503, -4.332788, 0.5490196, 1, 0, 1,
-0.6519232, -1.940689, -2.670973, 0.5411765, 1, 0, 1,
-0.6472529, -0.7549677, -2.000493, 0.5372549, 1, 0, 1,
-0.6423839, 0.2626527, -2.74856, 0.5294118, 1, 0, 1,
-0.6371906, -1.292694, -2.377218, 0.5254902, 1, 0, 1,
-0.6352267, -0.271699, -1.401528, 0.5176471, 1, 0, 1,
-0.6350209, -0.7330176, -1.258971, 0.5137255, 1, 0, 1,
-0.6302804, 0.5457606, -1.196896, 0.5058824, 1, 0, 1,
-0.629459, 0.4730632, 1.028904, 0.5019608, 1, 0, 1,
-0.6260294, 0.1327058, -1.839797, 0.4941176, 1, 0, 1,
-0.6205491, 2.060957, -0.4212982, 0.4862745, 1, 0, 1,
-0.620253, 0.5499614, 1.83542, 0.4823529, 1, 0, 1,
-0.61543, -0.2703044, -2.729625, 0.4745098, 1, 0, 1,
-0.6153631, -0.3629829, -0.2122396, 0.4705882, 1, 0, 1,
-0.6142573, -0.9227767, -2.802049, 0.4627451, 1, 0, 1,
-0.6103123, 0.9854921, -0.08677198, 0.4588235, 1, 0, 1,
-0.6091998, 0.4195186, -0.6513246, 0.4509804, 1, 0, 1,
-0.6089409, -0.08148856, -1.411839, 0.4470588, 1, 0, 1,
-0.6008167, -0.1155024, -1.537579, 0.4392157, 1, 0, 1,
-0.5975834, 1.090831, 0.05584495, 0.4352941, 1, 0, 1,
-0.5974963, 0.6847023, -0.8825626, 0.427451, 1, 0, 1,
-0.5965604, -1.018207, -2.077127, 0.4235294, 1, 0, 1,
-0.5892959, -0.8216199, -2.138791, 0.4156863, 1, 0, 1,
-0.5891665, 2.200929, -0.1912006, 0.4117647, 1, 0, 1,
-0.5855851, -0.1679976, -1.529251, 0.4039216, 1, 0, 1,
-0.5851806, 1.715799, -0.7413352, 0.3960784, 1, 0, 1,
-0.5849517, -1.396749, -2.893829, 0.3921569, 1, 0, 1,
-0.5826208, -0.8726156, -1.852285, 0.3843137, 1, 0, 1,
-0.5812066, -1.10268, -4.612619, 0.3803922, 1, 0, 1,
-0.5803463, 1.535206, -0.1434931, 0.372549, 1, 0, 1,
-0.5759858, 0.4938375, -0.823812, 0.3686275, 1, 0, 1,
-0.5686223, 0.2152369, -2.812396, 0.3607843, 1, 0, 1,
-0.5644219, 1.603066, 0.4673569, 0.3568628, 1, 0, 1,
-0.5609882, -1.455445, -3.390698, 0.3490196, 1, 0, 1,
-0.560782, 0.5631363, -1.31631, 0.345098, 1, 0, 1,
-0.5592303, 0.9265456, -1.803917, 0.3372549, 1, 0, 1,
-0.5581626, -0.01111307, -1.697787, 0.3333333, 1, 0, 1,
-0.5558628, 0.1470332, -1.864965, 0.3254902, 1, 0, 1,
-0.5555708, 0.973226, -1.770722, 0.3215686, 1, 0, 1,
-0.5553085, 1.179381, -0.3216024, 0.3137255, 1, 0, 1,
-0.553377, 0.3098711, 0.3570017, 0.3098039, 1, 0, 1,
-0.5522127, -0.2329211, -2.583754, 0.3019608, 1, 0, 1,
-0.5503603, 1.514773, -0.3329845, 0.2941177, 1, 0, 1,
-0.5441059, -0.8890413, -2.710101, 0.2901961, 1, 0, 1,
-0.5424793, -1.321432, -1.358303, 0.282353, 1, 0, 1,
-0.5416273, 0.7420605, 0.827356, 0.2784314, 1, 0, 1,
-0.541353, -1.348306, -1.817882, 0.2705882, 1, 0, 1,
-0.5396601, 1.439474, -1.6735, 0.2666667, 1, 0, 1,
-0.5359315, -0.9102238, -3.421144, 0.2588235, 1, 0, 1,
-0.5311544, -0.2066633, -2.056405, 0.254902, 1, 0, 1,
-0.5243597, -1.049213, -4.934995, 0.2470588, 1, 0, 1,
-0.5224336, -0.3149011, -2.835621, 0.2431373, 1, 0, 1,
-0.5128595, -1.786863, -3.509378, 0.2352941, 1, 0, 1,
-0.5095676, 0.570527, 0.03896842, 0.2313726, 1, 0, 1,
-0.5088252, 1.543614, 0.6171756, 0.2235294, 1, 0, 1,
-0.5080622, 0.1783918, -2.341535, 0.2196078, 1, 0, 1,
-0.5074604, -0.18821, -0.453656, 0.2117647, 1, 0, 1,
-0.5061425, -1.348677, -1.286558, 0.2078431, 1, 0, 1,
-0.5061058, 0.8719432, -0.1062019, 0.2, 1, 0, 1,
-0.5035481, 0.8746576, 0.9309332, 0.1921569, 1, 0, 1,
-0.4957154, 0.9970244, -0.1272737, 0.1882353, 1, 0, 1,
-0.4868298, 0.9292532, -1.500826, 0.1803922, 1, 0, 1,
-0.473045, -1.524285, -3.727123, 0.1764706, 1, 0, 1,
-0.4725556, 0.6674834, -2.758897, 0.1686275, 1, 0, 1,
-0.4719187, -0.2984505, -4.049156, 0.1647059, 1, 0, 1,
-0.4701527, 0.3740134, -0.3751864, 0.1568628, 1, 0, 1,
-0.4679754, -1.408274, -4.46651, 0.1529412, 1, 0, 1,
-0.4677415, 1.329456, 0.7683159, 0.145098, 1, 0, 1,
-0.4645611, -0.1037413, -1.609995, 0.1411765, 1, 0, 1,
-0.4610561, -0.368821, -2.868432, 0.1333333, 1, 0, 1,
-0.4606743, 0.9508848, 2.291826, 0.1294118, 1, 0, 1,
-0.4538922, -1.700454, -3.106638, 0.1215686, 1, 0, 1,
-0.4457031, 0.875583, -1.691803, 0.1176471, 1, 0, 1,
-0.4436159, -0.1481853, -2.582536, 0.1098039, 1, 0, 1,
-0.441025, -0.141499, -0.9252241, 0.1058824, 1, 0, 1,
-0.4403239, -0.6714257, -0.8976958, 0.09803922, 1, 0, 1,
-0.4391443, 0.9889591, 0.05633444, 0.09019608, 1, 0, 1,
-0.4300702, -1.615063, -2.877048, 0.08627451, 1, 0, 1,
-0.4294504, -0.8844448, -2.500381, 0.07843138, 1, 0, 1,
-0.4271806, 0.5545422, -0.7166318, 0.07450981, 1, 0, 1,
-0.4245987, 1.59132, -1.446693, 0.06666667, 1, 0, 1,
-0.4214396, 2.053153, -0.5689693, 0.0627451, 1, 0, 1,
-0.4211887, 0.8065335, -1.051543, 0.05490196, 1, 0, 1,
-0.4209877, -0.622395, -2.791994, 0.05098039, 1, 0, 1,
-0.4208249, -0.2368332, -1.755374, 0.04313726, 1, 0, 1,
-0.4175953, 0.01645561, -3.630526, 0.03921569, 1, 0, 1,
-0.414037, 0.5434964, 0.6826176, 0.03137255, 1, 0, 1,
-0.4134878, -1.018928, -1.937646, 0.02745098, 1, 0, 1,
-0.4134651, 1.277166, -2.760328, 0.01960784, 1, 0, 1,
-0.4134156, -1.063541, -2.850955, 0.01568628, 1, 0, 1,
-0.412796, 1.42121, 0.1612408, 0.007843138, 1, 0, 1,
-0.4064194, 1.884285, 0.2786498, 0.003921569, 1, 0, 1,
-0.4062438, 1.371824, 0.2861293, 0, 1, 0.003921569, 1,
-0.4052574, -0.4824048, -2.284942, 0, 1, 0.01176471, 1,
-0.402479, 1.191794, -2.511863, 0, 1, 0.01568628, 1,
-0.3924707, -0.9850767, -4.190842, 0, 1, 0.02352941, 1,
-0.3895301, 0.4900931, -1.891804, 0, 1, 0.02745098, 1,
-0.3863955, 1.706408, 0.05653559, 0, 1, 0.03529412, 1,
-0.3787145, -0.6985144, -2.352358, 0, 1, 0.03921569, 1,
-0.3785836, 0.3514957, -3.436228, 0, 1, 0.04705882, 1,
-0.3769469, 0.1112352, -1.351467, 0, 1, 0.05098039, 1,
-0.3702062, -1.361035, -2.467819, 0, 1, 0.05882353, 1,
-0.3625311, 1.193287, -1.155531, 0, 1, 0.0627451, 1,
-0.362447, 1.26828, -0.3552034, 0, 1, 0.07058824, 1,
-0.3624367, -1.638543, -2.035303, 0, 1, 0.07450981, 1,
-0.3617147, -0.2061071, -2.986747, 0, 1, 0.08235294, 1,
-0.3614437, 0.6590259, -2.172675, 0, 1, 0.08627451, 1,
-0.3586672, -1.210797, -1.212329, 0, 1, 0.09411765, 1,
-0.3557236, 0.8764443, -0.5308097, 0, 1, 0.1019608, 1,
-0.354225, -3.034308, -3.863034, 0, 1, 0.1058824, 1,
-0.3534372, -0.2022782, -2.012732, 0, 1, 0.1137255, 1,
-0.3454672, -0.6451914, -3.131841, 0, 1, 0.1176471, 1,
-0.3454566, -2.039914, -1.385496, 0, 1, 0.1254902, 1,
-0.3434926, 0.0596723, -1.57409, 0, 1, 0.1294118, 1,
-0.3433177, -0.7387933, -2.167558, 0, 1, 0.1372549, 1,
-0.3335129, -1.408647, -2.526957, 0, 1, 0.1411765, 1,
-0.3332232, 0.8386666, -0.4681522, 0, 1, 0.1490196, 1,
-0.3324098, 1.277495, 1.161829, 0, 1, 0.1529412, 1,
-0.3299107, -0.8657091, -4.225841, 0, 1, 0.1607843, 1,
-0.3270012, -0.7482767, -3.106252, 0, 1, 0.1647059, 1,
-0.3269907, -0.3970038, -3.131917, 0, 1, 0.172549, 1,
-0.3258526, -0.119646, -2.559737, 0, 1, 0.1764706, 1,
-0.3235994, 0.1335718, -1.334532, 0, 1, 0.1843137, 1,
-0.3212813, 0.5434965, 0.0006190917, 0, 1, 0.1882353, 1,
-0.3179881, -0.1630021, -3.33587, 0, 1, 0.1960784, 1,
-0.3175678, 0.01333147, -0.8617845, 0, 1, 0.2039216, 1,
-0.3164242, 0.9523724, -0.1340911, 0, 1, 0.2078431, 1,
-0.3115466, -2.654753, -2.625366, 0, 1, 0.2156863, 1,
-0.3098812, 0.1588512, -2.049044, 0, 1, 0.2196078, 1,
-0.3056169, 0.3773539, -1.112804, 0, 1, 0.227451, 1,
-0.3032958, 1.868756, 1.128493, 0, 1, 0.2313726, 1,
-0.3018593, -1.02197, -2.875052, 0, 1, 0.2392157, 1,
-0.2990747, 0.5749816, -0.8024065, 0, 1, 0.2431373, 1,
-0.2962648, -0.5679162, -2.968808, 0, 1, 0.2509804, 1,
-0.2879374, 1.496606, -0.2346617, 0, 1, 0.254902, 1,
-0.285522, 1.56848, -0.5280399, 0, 1, 0.2627451, 1,
-0.2843133, -1.382365, -5.205871, 0, 1, 0.2666667, 1,
-0.2816605, -1.344689, -3.419184, 0, 1, 0.2745098, 1,
-0.2806942, 0.1204007, -1.312673, 0, 1, 0.2784314, 1,
-0.2803859, 0.5392165, -1.703993, 0, 1, 0.2862745, 1,
-0.2775634, -0.8467461, -3.19034, 0, 1, 0.2901961, 1,
-0.274803, 1.642359, -1.023432, 0, 1, 0.2980392, 1,
-0.2651497, -0.7241061, -4.351502, 0, 1, 0.3058824, 1,
-0.264163, 1.029937, -0.9519579, 0, 1, 0.3098039, 1,
-0.2534046, 0.2998325, 0.5842789, 0, 1, 0.3176471, 1,
-0.2483865, -0.08071411, -0.571435, 0, 1, 0.3215686, 1,
-0.230864, 0.2258169, -1.564762, 0, 1, 0.3294118, 1,
-0.2297252, 0.1226473, 0.3319099, 0, 1, 0.3333333, 1,
-0.2289192, -1.299675, -4.118837, 0, 1, 0.3411765, 1,
-0.2281316, 1.155712, -0.07036778, 0, 1, 0.345098, 1,
-0.2244447, -1.072486, -2.96752, 0, 1, 0.3529412, 1,
-0.2239829, 0.2162132, -0.9769764, 0, 1, 0.3568628, 1,
-0.2212028, 2.68963, -2.130536, 0, 1, 0.3647059, 1,
-0.2205462, 1.673291, 0.3047369, 0, 1, 0.3686275, 1,
-0.2190085, 0.1339746, -1.371764, 0, 1, 0.3764706, 1,
-0.2150282, -0.5813352, -3.461848, 0, 1, 0.3803922, 1,
-0.2131909, 2.351878, 1.222759, 0, 1, 0.3882353, 1,
-0.2095088, 1.371203, 0.5840614, 0, 1, 0.3921569, 1,
-0.2086021, 0.5391257, -0.9817728, 0, 1, 0.4, 1,
-0.2078944, -1.161329, -2.845461, 0, 1, 0.4078431, 1,
-0.2042023, -2.288906, -1.589603, 0, 1, 0.4117647, 1,
-0.2023862, -0.6548496, -4.073476, 0, 1, 0.4196078, 1,
-0.1978791, -0.571575, -3.330316, 0, 1, 0.4235294, 1,
-0.1962205, -1.594472, -3.315421, 0, 1, 0.4313726, 1,
-0.1951612, -0.7031692, -1.950499, 0, 1, 0.4352941, 1,
-0.1950619, -1.237943, -3.665962, 0, 1, 0.4431373, 1,
-0.195054, 0.1772604, -0.9569175, 0, 1, 0.4470588, 1,
-0.1946359, -0.2196523, -2.043512, 0, 1, 0.454902, 1,
-0.1931222, -0.605139, -3.744379, 0, 1, 0.4588235, 1,
-0.1924943, 2.032246, 0.1103788, 0, 1, 0.4666667, 1,
-0.1911804, 0.8178162, -1.043486, 0, 1, 0.4705882, 1,
-0.1877597, -1.291445, -1.647463, 0, 1, 0.4784314, 1,
-0.1864308, -0.5628827, -3.396895, 0, 1, 0.4823529, 1,
-0.1832909, 0.4501679, 0.109939, 0, 1, 0.4901961, 1,
-0.1830272, 1.049297, 0.193171, 0, 1, 0.4941176, 1,
-0.1814531, -0.2979827, -2.438653, 0, 1, 0.5019608, 1,
-0.1801385, -1.37028, -4.612069, 0, 1, 0.509804, 1,
-0.1748586, 0.3272043, -1.454083, 0, 1, 0.5137255, 1,
-0.1736318, 0.3925105, -1.646498, 0, 1, 0.5215687, 1,
-0.1705732, -0.4848247, -1.39689, 0, 1, 0.5254902, 1,
-0.1639215, 0.5316325, 0.2558605, 0, 1, 0.5333334, 1,
-0.1601271, -1.792813, -3.395897, 0, 1, 0.5372549, 1,
-0.1591782, -1.890966, -3.3558, 0, 1, 0.5450981, 1,
-0.1587597, -0.9415107, -3.678976, 0, 1, 0.5490196, 1,
-0.1586591, 1.906113, -1.194332, 0, 1, 0.5568628, 1,
-0.1583719, 0.2541618, -0.3133757, 0, 1, 0.5607843, 1,
-0.1565798, 0.7250664, -0.6468074, 0, 1, 0.5686275, 1,
-0.1505249, 0.4792432, -1.750221, 0, 1, 0.572549, 1,
-0.150457, 0.6212677, 0.3123466, 0, 1, 0.5803922, 1,
-0.149004, 0.232346, -1.047091, 0, 1, 0.5843138, 1,
-0.1481085, 0.8661847, -1.595838, 0, 1, 0.5921569, 1,
-0.1476553, -1.607606, -3.885863, 0, 1, 0.5960785, 1,
-0.1471273, -0.3194498, -2.42053, 0, 1, 0.6039216, 1,
-0.1446237, 0.02810161, -0.5697459, 0, 1, 0.6117647, 1,
-0.1418678, -0.06991788, -0.03762863, 0, 1, 0.6156863, 1,
-0.1402254, 0.9874922, 1.769198, 0, 1, 0.6235294, 1,
-0.1388582, 0.1790257, 0.89367, 0, 1, 0.627451, 1,
-0.1376777, 1.008387, -0.7464685, 0, 1, 0.6352941, 1,
-0.1361702, 0.04451942, -2.707754, 0, 1, 0.6392157, 1,
-0.1350293, 2.008567, -0.06503706, 0, 1, 0.6470588, 1,
-0.1324231, 1.149085, -0.007847207, 0, 1, 0.6509804, 1,
-0.1322103, 0.2080873, -0.8647726, 0, 1, 0.6588235, 1,
-0.1245813, 0.544151, -1.886657, 0, 1, 0.6627451, 1,
-0.11801, 0.001894911, -2.046064, 0, 1, 0.6705883, 1,
-0.1138321, -0.6016732, -2.388639, 0, 1, 0.6745098, 1,
-0.1128539, -2.164216, -4.95251, 0, 1, 0.682353, 1,
-0.1102345, 0.2642245, -1.435963, 0, 1, 0.6862745, 1,
-0.106676, 0.4362109, -1.767095, 0, 1, 0.6941177, 1,
-0.1004057, -0.4828581, -5.004777, 0, 1, 0.7019608, 1,
-0.09832745, 1.544775, -0.1922654, 0, 1, 0.7058824, 1,
-0.0982163, -1.072081, -1.43051, 0, 1, 0.7137255, 1,
-0.09507864, -0.9322968, -3.172271, 0, 1, 0.7176471, 1,
-0.09468868, 1.121, 1.210431, 0, 1, 0.7254902, 1,
-0.09391733, 0.9079266, 1.393505, 0, 1, 0.7294118, 1,
-0.08749215, 1.38173, -0.2903394, 0, 1, 0.7372549, 1,
-0.08199307, 2.748894, -2.517762, 0, 1, 0.7411765, 1,
-0.08038673, -0.7270413, -1.633994, 0, 1, 0.7490196, 1,
-0.07866612, -2.135194, -2.70693, 0, 1, 0.7529412, 1,
-0.07849653, 1.167827, -0.6302115, 0, 1, 0.7607843, 1,
-0.07519769, 0.5060151, -0.9382779, 0, 1, 0.7647059, 1,
-0.07444697, -0.9225809, -4.113589, 0, 1, 0.772549, 1,
-0.07259665, -0.01545079, -2.671125, 0, 1, 0.7764706, 1,
-0.0704458, -0.9991111, -1.714292, 0, 1, 0.7843137, 1,
-0.07017785, 2.519298, 1.932725, 0, 1, 0.7882353, 1,
-0.06939337, -1.045092, -2.903709, 0, 1, 0.7960784, 1,
-0.06634892, -1.397035, -1.765837, 0, 1, 0.8039216, 1,
-0.06620649, 0.09542405, -0.8203109, 0, 1, 0.8078431, 1,
-0.06414084, 0.359539, -0.2468839, 0, 1, 0.8156863, 1,
-0.06359479, -1.665915, -1.617465, 0, 1, 0.8196079, 1,
-0.06323139, 1.152597, 0.8630664, 0, 1, 0.827451, 1,
-0.06237002, -0.436793, -3.836688, 0, 1, 0.8313726, 1,
-0.06055119, 0.06316172, -2.156108, 0, 1, 0.8392157, 1,
-0.05859791, -1.152915, -2.501826, 0, 1, 0.8431373, 1,
-0.0564084, -0.8823404, -4.487493, 0, 1, 0.8509804, 1,
-0.05331162, -1.015921, -2.75218, 0, 1, 0.854902, 1,
-0.05014465, -0.5887073, -2.45748, 0, 1, 0.8627451, 1,
-0.04992654, 0.3891052, 0.4368677, 0, 1, 0.8666667, 1,
-0.04753712, 0.1323622, -0.702472, 0, 1, 0.8745098, 1,
-0.04658042, -0.1083642, -1.838645, 0, 1, 0.8784314, 1,
-0.04593115, 1.040994, -1.05191, 0, 1, 0.8862745, 1,
-0.04556416, -0.01178348, -1.362439, 0, 1, 0.8901961, 1,
-0.04194704, 0.9917859, -0.7565247, 0, 1, 0.8980392, 1,
-0.04161501, -0.5930291, -1.086437, 0, 1, 0.9058824, 1,
-0.03730252, -0.8130671, -3.895882, 0, 1, 0.9098039, 1,
-0.03719424, -1.532539, -2.118064, 0, 1, 0.9176471, 1,
-0.03475666, -0.06517709, -2.250029, 0, 1, 0.9215686, 1,
-0.03292601, 1.836267, 0.05561427, 0, 1, 0.9294118, 1,
-0.03056144, -1.057701, -3.630147, 0, 1, 0.9333333, 1,
-0.03048794, 0.1389765, 0.9982395, 0, 1, 0.9411765, 1,
-0.0293715, 1.798104, -1.47993, 0, 1, 0.945098, 1,
-0.02560094, 0.6882663, 0.8055956, 0, 1, 0.9529412, 1,
-0.02484158, -0.2671813, -3.381658, 0, 1, 0.9568627, 1,
-0.02064467, -0.5421823, -2.743688, 0, 1, 0.9647059, 1,
-0.0113728, -0.4663014, -2.937882, 0, 1, 0.9686275, 1,
-0.01131658, 0.113012, -0.2527831, 0, 1, 0.9764706, 1,
-0.0107546, 0.1828286, 0.6570382, 0, 1, 0.9803922, 1,
-0.007587694, 2.131282, -0.7986853, 0, 1, 0.9882353, 1,
-0.006269538, 1.068499, -0.4163065, 0, 1, 0.9921569, 1,
-0.00560782, 1.532224, -0.5432048, 0, 1, 1, 1,
-0.004498184, 0.5219683, -0.7905346, 0, 0.9921569, 1, 1,
0.0001137792, 0.02448504, -1.091328, 0, 0.9882353, 1, 1,
0.008848648, 0.8183097, 0.2584639, 0, 0.9803922, 1, 1,
0.01277628, 0.3975048, -0.8505014, 0, 0.9764706, 1, 1,
0.01501507, -0.4813256, 3.051689, 0, 0.9686275, 1, 1,
0.02039326, 0.3337673, 0.2789416, 0, 0.9647059, 1, 1,
0.02142514, -1.736375, 5.41772, 0, 0.9568627, 1, 1,
0.0241784, -0.2737983, 2.849238, 0, 0.9529412, 1, 1,
0.02642801, -0.0291045, 1.631911, 0, 0.945098, 1, 1,
0.02686612, -0.1460599, 1.574444, 0, 0.9411765, 1, 1,
0.02687801, -1.567592, 2.768378, 0, 0.9333333, 1, 1,
0.02894014, -1.253768, 1.806054, 0, 0.9294118, 1, 1,
0.03262803, 1.263113, -0.6538932, 0, 0.9215686, 1, 1,
0.03349785, 0.8915529, 1.155627, 0, 0.9176471, 1, 1,
0.03440648, -1.396699, 4.160374, 0, 0.9098039, 1, 1,
0.03444134, -1.086509, 2.910733, 0, 0.9058824, 1, 1,
0.03756968, -0.5089703, 2.973368, 0, 0.8980392, 1, 1,
0.05026547, 0.0178241, 0.9492984, 0, 0.8901961, 1, 1,
0.05199587, -1.90037, 4.030585, 0, 0.8862745, 1, 1,
0.05323689, -0.3235814, 3.89049, 0, 0.8784314, 1, 1,
0.05360742, 0.4147823, 0.7781824, 0, 0.8745098, 1, 1,
0.05521596, 0.2924059, -0.4536938, 0, 0.8666667, 1, 1,
0.05793935, -0.9995955, 4.242268, 0, 0.8627451, 1, 1,
0.05860534, -2.507819, 2.419436, 0, 0.854902, 1, 1,
0.05994797, -0.8134826, 2.320218, 0, 0.8509804, 1, 1,
0.06206972, 0.2878776, 1.662075, 0, 0.8431373, 1, 1,
0.06585737, -2.435102, 2.917947, 0, 0.8392157, 1, 1,
0.06607467, 1.206606, 1.539133, 0, 0.8313726, 1, 1,
0.06937981, 0.7259056, -0.333445, 0, 0.827451, 1, 1,
0.06991658, -0.992624, 1.400014, 0, 0.8196079, 1, 1,
0.07440019, 0.3840239, -0.8036271, 0, 0.8156863, 1, 1,
0.08042565, 0.1135667, 0.9954695, 0, 0.8078431, 1, 1,
0.08094247, -1.253425, 3.002489, 0, 0.8039216, 1, 1,
0.0815361, -0.8420749, 4.394943, 0, 0.7960784, 1, 1,
0.08717512, 1.740804, -1.449302, 0, 0.7882353, 1, 1,
0.09671645, 1.138469, -0.4968726, 0, 0.7843137, 1, 1,
0.09796629, -2.031693, 3.797225, 0, 0.7764706, 1, 1,
0.10015, 1.121372, -1.617502, 0, 0.772549, 1, 1,
0.1013662, -0.9012412, 3.643325, 0, 0.7647059, 1, 1,
0.1020272, 1.461201, -0.46632, 0, 0.7607843, 1, 1,
0.1040257, -0.8370561, 2.294587, 0, 0.7529412, 1, 1,
0.1052153, 0.2838186, -0.383929, 0, 0.7490196, 1, 1,
0.1073213, -0.8640209, 2.903883, 0, 0.7411765, 1, 1,
0.1087347, 2.581017, 0.9257396, 0, 0.7372549, 1, 1,
0.1089778, 0.4057225, 1.76693, 0, 0.7294118, 1, 1,
0.111144, 0.7494528, -0.04887743, 0, 0.7254902, 1, 1,
0.1137353, -1.158354, 3.299497, 0, 0.7176471, 1, 1,
0.1163039, 0.8494988, -0.6058769, 0, 0.7137255, 1, 1,
0.1164936, -0.6897735, 3.624504, 0, 0.7058824, 1, 1,
0.117878, -0.2824749, 2.312829, 0, 0.6980392, 1, 1,
0.119239, 0.2862363, 0.7325897, 0, 0.6941177, 1, 1,
0.1215483, 0.3705114, -1.341532, 0, 0.6862745, 1, 1,
0.1222988, 1.914219, -0.1712065, 0, 0.682353, 1, 1,
0.1310908, 1.399949, 0.6837937, 0, 0.6745098, 1, 1,
0.1337209, 0.1713174, 1.607103, 0, 0.6705883, 1, 1,
0.1385145, 0.688996, -0.2540556, 0, 0.6627451, 1, 1,
0.1401971, 0.09582695, 0.4218082, 0, 0.6588235, 1, 1,
0.1459975, -0.2549765, 2.250968, 0, 0.6509804, 1, 1,
0.150145, -0.5742894, 2.990185, 0, 0.6470588, 1, 1,
0.1503398, -2.461258, 2.964021, 0, 0.6392157, 1, 1,
0.1512486, -0.5966931, 4.214927, 0, 0.6352941, 1, 1,
0.1545637, 0.670009, 0.6712657, 0, 0.627451, 1, 1,
0.1560272, 0.2534188, 0.5126303, 0, 0.6235294, 1, 1,
0.1560549, 1.753892, 0.4407794, 0, 0.6156863, 1, 1,
0.1582349, 1.519327, 0.2570066, 0, 0.6117647, 1, 1,
0.1607234, -1.937953, 2.402854, 0, 0.6039216, 1, 1,
0.1627817, 1.305792, -0.1972798, 0, 0.5960785, 1, 1,
0.1631801, -0.02713313, 0.6215793, 0, 0.5921569, 1, 1,
0.1663301, 0.5091431, -1.313867, 0, 0.5843138, 1, 1,
0.172068, -1.297459, 3.301345, 0, 0.5803922, 1, 1,
0.1766926, -2.222338, 3.077816, 0, 0.572549, 1, 1,
0.1798749, 0.2862887, -0.4896504, 0, 0.5686275, 1, 1,
0.1802351, -0.3855027, 1.528849, 0, 0.5607843, 1, 1,
0.1819631, 0.9115528, 0.81323, 0, 0.5568628, 1, 1,
0.1878166, -1.624205, 1.390723, 0, 0.5490196, 1, 1,
0.1909094, 0.194788, -0.2959675, 0, 0.5450981, 1, 1,
0.1919248, 0.4314575, -0.5754725, 0, 0.5372549, 1, 1,
0.1919455, 0.6743855, -0.8395464, 0, 0.5333334, 1, 1,
0.1939172, 0.2208278, 0.255623, 0, 0.5254902, 1, 1,
0.1956289, -0.692046, 2.256016, 0, 0.5215687, 1, 1,
0.2017564, 1.669368, 0.6091169, 0, 0.5137255, 1, 1,
0.2044147, -0.871039, 1.872655, 0, 0.509804, 1, 1,
0.2073392, 0.9077118, 1.212394, 0, 0.5019608, 1, 1,
0.2102159, -0.6725736, 3.697238, 0, 0.4941176, 1, 1,
0.2111357, -2.406735, 1.536703, 0, 0.4901961, 1, 1,
0.2115913, -1.824124, 1.755859, 0, 0.4823529, 1, 1,
0.2206971, -1.826397, 2.9347, 0, 0.4784314, 1, 1,
0.2227818, -0.09919517, 2.186943, 0, 0.4705882, 1, 1,
0.2229294, 0.771386, -0.1549648, 0, 0.4666667, 1, 1,
0.2242229, -0.3653731, 3.071322, 0, 0.4588235, 1, 1,
0.226777, 2.134764, 0.2001965, 0, 0.454902, 1, 1,
0.2298996, 0.2563013, 1.776549, 0, 0.4470588, 1, 1,
0.2334003, 0.6751522, 1.81217, 0, 0.4431373, 1, 1,
0.2417977, 1.769027, 1.567122, 0, 0.4352941, 1, 1,
0.2442818, 0.1576165, -0.02980161, 0, 0.4313726, 1, 1,
0.2454715, 0.694136, 0.6532025, 0, 0.4235294, 1, 1,
0.251543, 1.176973, 0.002513731, 0, 0.4196078, 1, 1,
0.2546252, 0.6687101, 0.2544227, 0, 0.4117647, 1, 1,
0.2588911, -1.240243, 4.122755, 0, 0.4078431, 1, 1,
0.2621467, -1.211573, 4.094896, 0, 0.4, 1, 1,
0.264259, -1.353927, 3.255464, 0, 0.3921569, 1, 1,
0.2683567, 0.1921803, 1.56235, 0, 0.3882353, 1, 1,
0.2710191, 1.270249, -1.429529, 0, 0.3803922, 1, 1,
0.2747371, 1.674531, -1.415272, 0, 0.3764706, 1, 1,
0.2816136, -0.5806494, 2.254853, 0, 0.3686275, 1, 1,
0.2853231, 1.500654, -0.1017753, 0, 0.3647059, 1, 1,
0.2861489, 0.5963667, -0.3123806, 0, 0.3568628, 1, 1,
0.2862246, -1.922693, 3.320164, 0, 0.3529412, 1, 1,
0.2879151, 0.9536534, 1.320861, 0, 0.345098, 1, 1,
0.2902069, -1.566428, 1.872796, 0, 0.3411765, 1, 1,
0.2922275, 1.446044, 1.548938, 0, 0.3333333, 1, 1,
0.2931131, -0.358422, 2.303756, 0, 0.3294118, 1, 1,
0.2941058, -1.162957, 1.259586, 0, 0.3215686, 1, 1,
0.2944819, -2.144595, 3.190355, 0, 0.3176471, 1, 1,
0.2945499, -1.434561, 2.817087, 0, 0.3098039, 1, 1,
0.2951519, -0.6213167, 3.254978, 0, 0.3058824, 1, 1,
0.2952091, -1.613332, 3.610605, 0, 0.2980392, 1, 1,
0.2989989, -0.06903779, 4.313123, 0, 0.2901961, 1, 1,
0.3108859, 1.443892, 1.466648, 0, 0.2862745, 1, 1,
0.3116148, -2.207954, 4.15407, 0, 0.2784314, 1, 1,
0.3159029, 1.70504, 1.544802, 0, 0.2745098, 1, 1,
0.3188294, -0.2369983, 3.275322, 0, 0.2666667, 1, 1,
0.3224538, -1.720627, 4.012723, 0, 0.2627451, 1, 1,
0.3247464, -0.06555351, 2.75271, 0, 0.254902, 1, 1,
0.328909, 0.1650363, 1.884024, 0, 0.2509804, 1, 1,
0.3306594, -2.122444, 3.223559, 0, 0.2431373, 1, 1,
0.3353208, -0.927442, 2.865207, 0, 0.2392157, 1, 1,
0.3368108, -0.1654009, 1.095598, 0, 0.2313726, 1, 1,
0.3385573, -0.358203, 3.571483, 0, 0.227451, 1, 1,
0.3427187, 0.0416344, 0.6386206, 0, 0.2196078, 1, 1,
0.3440785, -0.7643102, 3.712607, 0, 0.2156863, 1, 1,
0.3516866, -0.7920175, 3.789865, 0, 0.2078431, 1, 1,
0.3543498, -0.3267328, 3.544552, 0, 0.2039216, 1, 1,
0.3586266, 0.0152245, 1.415136, 0, 0.1960784, 1, 1,
0.3592685, -0.4143932, 0.4716073, 0, 0.1882353, 1, 1,
0.3635882, 0.5087146, 0.5322427, 0, 0.1843137, 1, 1,
0.3683488, -0.8128412, 3.409391, 0, 0.1764706, 1, 1,
0.3712566, 1.633069, -0.8456762, 0, 0.172549, 1, 1,
0.3772044, 1.510966, 0.2911954, 0, 0.1647059, 1, 1,
0.3851406, 0.0007311854, 1.572373, 0, 0.1607843, 1, 1,
0.3877009, -0.4766526, 2.078436, 0, 0.1529412, 1, 1,
0.3881294, -0.9233131, 1.921295, 0, 0.1490196, 1, 1,
0.3974532, 1.19271, -0.8042889, 0, 0.1411765, 1, 1,
0.4003255, -0.8320469, 3.267933, 0, 0.1372549, 1, 1,
0.4025353, 1.731939, -0.2722755, 0, 0.1294118, 1, 1,
0.4028082, 0.6072944, -0.1309918, 0, 0.1254902, 1, 1,
0.4055351, 1.634516, -0.3329543, 0, 0.1176471, 1, 1,
0.4076809, 1.889376, 0.5578551, 0, 0.1137255, 1, 1,
0.4081827, 0.2622752, -0.4414916, 0, 0.1058824, 1, 1,
0.4094933, -0.4944478, 1.954999, 0, 0.09803922, 1, 1,
0.4111582, 0.319239, 1.525888, 0, 0.09411765, 1, 1,
0.411248, 1.414841, -1.614125, 0, 0.08627451, 1, 1,
0.4119301, -0.5706393, 2.214658, 0, 0.08235294, 1, 1,
0.41225, -0.2570346, 1.950188, 0, 0.07450981, 1, 1,
0.4154226, -1.173302, 3.197349, 0, 0.07058824, 1, 1,
0.4209116, 1.616374, -0.173397, 0, 0.0627451, 1, 1,
0.4289885, -0.1320333, 3.379658, 0, 0.05882353, 1, 1,
0.4363778, -1.720574, 3.526667, 0, 0.05098039, 1, 1,
0.438094, 0.3181877, 3.007911, 0, 0.04705882, 1, 1,
0.4395472, -0.6197768, 1.435687, 0, 0.03921569, 1, 1,
0.4414056, 0.08078943, 3.212858, 0, 0.03529412, 1, 1,
0.4426053, -0.4795173, 1.632801, 0, 0.02745098, 1, 1,
0.4435824, 0.4163989, -0.02401609, 0, 0.02352941, 1, 1,
0.4464127, 0.1804722, 1.267592, 0, 0.01568628, 1, 1,
0.4494745, 0.7990839, 0.283252, 0, 0.01176471, 1, 1,
0.4509121, 2.052877, 1.935289, 0, 0.003921569, 1, 1,
0.4519364, 1.098555, 1.028547, 0.003921569, 0, 1, 1,
0.4558232, 1.236022, -0.08046483, 0.007843138, 0, 1, 1,
0.4592475, -0.6143396, 3.178705, 0.01568628, 0, 1, 1,
0.4674814, 1.538271, -0.7330065, 0.01960784, 0, 1, 1,
0.4677338, -0.4249082, 2.839889, 0.02745098, 0, 1, 1,
0.4717154, -1.781043, 3.399226, 0.03137255, 0, 1, 1,
0.4720061, 0.5448022, 1.111065, 0.03921569, 0, 1, 1,
0.4758855, -0.6313808, 1.948463, 0.04313726, 0, 1, 1,
0.4779498, 0.6618086, -0.2083629, 0.05098039, 0, 1, 1,
0.4798285, 1.682395, -0.2002659, 0.05490196, 0, 1, 1,
0.4810264, -0.05882281, 1.230108, 0.0627451, 0, 1, 1,
0.4811077, 0.7895424, 0.6326174, 0.06666667, 0, 1, 1,
0.4820553, 0.3395002, 1.716491, 0.07450981, 0, 1, 1,
0.485, 0.7059289, 0.04108794, 0.07843138, 0, 1, 1,
0.4866471, 0.1217973, 0.905023, 0.08627451, 0, 1, 1,
0.486969, -0.849168, 3.471739, 0.09019608, 0, 1, 1,
0.4899933, -1.137344, 2.193245, 0.09803922, 0, 1, 1,
0.4908933, -0.443586, 1.282095, 0.1058824, 0, 1, 1,
0.4962169, 0.5138928, -0.6063621, 0.1098039, 0, 1, 1,
0.5085528, -1.539374, 2.373734, 0.1176471, 0, 1, 1,
0.508553, -0.2859884, 2.006411, 0.1215686, 0, 1, 1,
0.5100149, 0.1537825, 1.99776, 0.1294118, 0, 1, 1,
0.5105709, -0.331453, 2.995388, 0.1333333, 0, 1, 1,
0.5116889, -0.9564416, 3.802951, 0.1411765, 0, 1, 1,
0.5123687, -2.538562, 2.168673, 0.145098, 0, 1, 1,
0.5142131, 0.9950803, 1.189591, 0.1529412, 0, 1, 1,
0.5154218, 2.678693, 1.052838, 0.1568628, 0, 1, 1,
0.5215219, -0.483903, 2.256814, 0.1647059, 0, 1, 1,
0.5272642, -1.005206, 3.318379, 0.1686275, 0, 1, 1,
0.5285906, 2.832582, -0.5459064, 0.1764706, 0, 1, 1,
0.529889, 0.7983447, 0.9147481, 0.1803922, 0, 1, 1,
0.5358928, -0.9771264, 2.101411, 0.1882353, 0, 1, 1,
0.5383499, 0.9872068, 1.09795, 0.1921569, 0, 1, 1,
0.5423037, 0.3117223, 2.28652, 0.2, 0, 1, 1,
0.542427, -1.402653, 3.302439, 0.2078431, 0, 1, 1,
0.542821, 1.297072, 1.257905, 0.2117647, 0, 1, 1,
0.5439432, 0.4969522, 1.332449, 0.2196078, 0, 1, 1,
0.5443388, -0.2516392, 2.361958, 0.2235294, 0, 1, 1,
0.5446772, 0.09601781, 0.8485045, 0.2313726, 0, 1, 1,
0.5547162, -0.8757964, 2.909941, 0.2352941, 0, 1, 1,
0.5547812, 1.927208, -0.2025656, 0.2431373, 0, 1, 1,
0.5614751, 0.2157945, 0.2558029, 0.2470588, 0, 1, 1,
0.5659191, 0.9309157, 0.7012275, 0.254902, 0, 1, 1,
0.5687243, -0.01723372, 1.032082, 0.2588235, 0, 1, 1,
0.5770593, 0.2989476, 0.6904057, 0.2666667, 0, 1, 1,
0.5809097, 0.3944946, 2.760344, 0.2705882, 0, 1, 1,
0.5819438, -1.847842, 3.778451, 0.2784314, 0, 1, 1,
0.5828288, 0.591951, 1.029722, 0.282353, 0, 1, 1,
0.5836305, 1.490382, -0.01866686, 0.2901961, 0, 1, 1,
0.586285, -0.7372549, 3.458212, 0.2941177, 0, 1, 1,
0.5869672, 2.133427, 0.7184469, 0.3019608, 0, 1, 1,
0.5890509, 0.1248646, 1.98801, 0.3098039, 0, 1, 1,
0.5891536, -0.3138403, 2.238765, 0.3137255, 0, 1, 1,
0.59457, 0.0576291, 3.3367, 0.3215686, 0, 1, 1,
0.5977471, 0.003737954, 0.5482532, 0.3254902, 0, 1, 1,
0.599264, 1.035415, -0.7660134, 0.3333333, 0, 1, 1,
0.5995832, -0.6044504, 3.434565, 0.3372549, 0, 1, 1,
0.5997354, -0.5292093, 2.123224, 0.345098, 0, 1, 1,
0.610385, 0.1268885, 0.2175687, 0.3490196, 0, 1, 1,
0.6113842, -1.773355, 2.297086, 0.3568628, 0, 1, 1,
0.612876, 0.4034359, -0.1193491, 0.3607843, 0, 1, 1,
0.6151813, -0.8205675, 1.978453, 0.3686275, 0, 1, 1,
0.6172298, -0.1637501, 0.2611709, 0.372549, 0, 1, 1,
0.6222568, -0.9791443, 3.839581, 0.3803922, 0, 1, 1,
0.6249741, 1.266849, 0.7100027, 0.3843137, 0, 1, 1,
0.6253053, -0.92873, 3.10052, 0.3921569, 0, 1, 1,
0.63278, -0.5490825, 3.06844, 0.3960784, 0, 1, 1,
0.6358832, -0.1848007, 1.621697, 0.4039216, 0, 1, 1,
0.636806, 1.735399, 1.399075, 0.4117647, 0, 1, 1,
0.6371057, -0.2858728, 1.529875, 0.4156863, 0, 1, 1,
0.6391916, -0.385321, 0.5130315, 0.4235294, 0, 1, 1,
0.6456596, 0.03743903, 1.559155, 0.427451, 0, 1, 1,
0.6505218, 0.7069506, -1.137503, 0.4352941, 0, 1, 1,
0.651426, 1.121398, 1.211754, 0.4392157, 0, 1, 1,
0.6559101, -0.5180124, 2.070084, 0.4470588, 0, 1, 1,
0.6566609, -0.9996076, 1.971682, 0.4509804, 0, 1, 1,
0.6590616, 0.4318586, 0.7791199, 0.4588235, 0, 1, 1,
0.6599456, -0.3801807, 1.104897, 0.4627451, 0, 1, 1,
0.6652346, -1.632591, 1.467173, 0.4705882, 0, 1, 1,
0.6699072, -0.209613, 1.828179, 0.4745098, 0, 1, 1,
0.6721258, 2.894116, -0.4672997, 0.4823529, 0, 1, 1,
0.6743735, 0.8648212, 1.138913, 0.4862745, 0, 1, 1,
0.6760595, -0.0265286, -0.05744938, 0.4941176, 0, 1, 1,
0.6774092, 1.078798, 0.3881466, 0.5019608, 0, 1, 1,
0.6816452, -0.1212536, -0.6299527, 0.5058824, 0, 1, 1,
0.6829268, 1.208041, 0.6794653, 0.5137255, 0, 1, 1,
0.6837627, -1.078615, 2.921536, 0.5176471, 0, 1, 1,
0.684202, 0.05656008, 2.140084, 0.5254902, 0, 1, 1,
0.687203, 0.3467031, 0.3504629, 0.5294118, 0, 1, 1,
0.6899902, -0.6817626, 2.891865, 0.5372549, 0, 1, 1,
0.6927779, 0.7781923, 1.816703, 0.5411765, 0, 1, 1,
0.6939905, 0.7403975, -0.1627542, 0.5490196, 0, 1, 1,
0.6944872, -1.42622, 2.865888, 0.5529412, 0, 1, 1,
0.69663, -1.183512, 0.987947, 0.5607843, 0, 1, 1,
0.7077783, -1.575552, 3.216202, 0.5647059, 0, 1, 1,
0.7159616, -0.4732479, 2.205965, 0.572549, 0, 1, 1,
0.7166093, 0.6087815, 0.7468711, 0.5764706, 0, 1, 1,
0.7191475, -0.8299545, 3.957031, 0.5843138, 0, 1, 1,
0.7232257, 0.8402311, 0.1470596, 0.5882353, 0, 1, 1,
0.7262968, 0.5518484, -0.2048329, 0.5960785, 0, 1, 1,
0.7263535, -0.09130296, 3.897391, 0.6039216, 0, 1, 1,
0.7275618, 0.3167673, 2.898056, 0.6078432, 0, 1, 1,
0.7303426, 0.3390602, -1.00255, 0.6156863, 0, 1, 1,
0.7332249, -0.3780072, 2.427507, 0.6196079, 0, 1, 1,
0.7359419, 0.9842932, 0.9234157, 0.627451, 0, 1, 1,
0.736834, 1.12894, -0.05014526, 0.6313726, 0, 1, 1,
0.7449813, -0.4879071, 1.781356, 0.6392157, 0, 1, 1,
0.745363, -2.131186, 2.47649, 0.6431373, 0, 1, 1,
0.7479954, 0.918909, 0.9802034, 0.6509804, 0, 1, 1,
0.7493104, -0.298942, 1.701176, 0.654902, 0, 1, 1,
0.7495246, -0.2958678, 1.273595, 0.6627451, 0, 1, 1,
0.7533541, -0.4261867, 3.886946, 0.6666667, 0, 1, 1,
0.7555403, 0.2157935, 1.349329, 0.6745098, 0, 1, 1,
0.7571172, -1.304762, 3.322143, 0.6784314, 0, 1, 1,
0.7575376, 1.493111, -1.442606, 0.6862745, 0, 1, 1,
0.7719802, -0.1748465, 1.766484, 0.6901961, 0, 1, 1,
0.7744334, -1.601926, 2.87549, 0.6980392, 0, 1, 1,
0.7762694, 1.187474, 0.7375708, 0.7058824, 0, 1, 1,
0.7804866, -0.6435763, 2.883737, 0.7098039, 0, 1, 1,
0.7809532, 2.365776, -1.112142, 0.7176471, 0, 1, 1,
0.7824711, -1.133698, 3.632529, 0.7215686, 0, 1, 1,
0.7873121, -1.91346, 3.352882, 0.7294118, 0, 1, 1,
0.7882675, -0.1132819, 2.208769, 0.7333333, 0, 1, 1,
0.7889925, -0.7774243, 2.656752, 0.7411765, 0, 1, 1,
0.7895086, -0.4066745, 2.69023, 0.7450981, 0, 1, 1,
0.789952, 0.6248831, 0.7240293, 0.7529412, 0, 1, 1,
0.8001284, 1.548957, -0.2484757, 0.7568628, 0, 1, 1,
0.8046879, -0.02965636, 0.2446674, 0.7647059, 0, 1, 1,
0.8060619, -0.4005319, 2.180666, 0.7686275, 0, 1, 1,
0.8104504, -0.1021741, 1.683189, 0.7764706, 0, 1, 1,
0.8167289, -1.140182, 3.288216, 0.7803922, 0, 1, 1,
0.8169948, 0.5682849, 1.369097, 0.7882353, 0, 1, 1,
0.8296833, -1.13873, 3.094672, 0.7921569, 0, 1, 1,
0.8342181, -0.2635414, 1.491555, 0.8, 0, 1, 1,
0.8419229, -0.2835317, 0.6912057, 0.8078431, 0, 1, 1,
0.8457166, -0.2026172, 1.799336, 0.8117647, 0, 1, 1,
0.8466108, -1.769207, 1.877047, 0.8196079, 0, 1, 1,
0.8540979, 1.134238, 1.205531, 0.8235294, 0, 1, 1,
0.8565993, -1.93135, 2.349537, 0.8313726, 0, 1, 1,
0.8635622, 0.786383, 0.3395341, 0.8352941, 0, 1, 1,
0.8647347, 1.531913, 1.811106, 0.8431373, 0, 1, 1,
0.8674167, -0.4754338, 3.388665, 0.8470588, 0, 1, 1,
0.8676545, 0.5554729, 1.390873, 0.854902, 0, 1, 1,
0.8820121, -0.7065972, 2.734442, 0.8588235, 0, 1, 1,
0.883159, -0.7075741, 2.033593, 0.8666667, 0, 1, 1,
0.8835558, -1.16475, 3.648997, 0.8705882, 0, 1, 1,
0.8870063, -1.125925, 3.18376, 0.8784314, 0, 1, 1,
0.8961452, -0.4153848, 3.595408, 0.8823529, 0, 1, 1,
0.9001039, 0.1178373, 2.186134, 0.8901961, 0, 1, 1,
0.9031718, 1.772019, 0.6129479, 0.8941177, 0, 1, 1,
0.9051567, -1.227535, 3.037381, 0.9019608, 0, 1, 1,
0.9062999, 1.814969, 1.235542, 0.9098039, 0, 1, 1,
0.9102658, -0.5615404, 1.508854, 0.9137255, 0, 1, 1,
0.9148096, -0.3010148, 1.561707, 0.9215686, 0, 1, 1,
0.9210707, 0.01505938, -0.6115072, 0.9254902, 0, 1, 1,
0.9243241, 1.340619, 1.137285, 0.9333333, 0, 1, 1,
0.9248429, -0.1746997, 1.115727, 0.9372549, 0, 1, 1,
0.9259145, 0.1104964, 1.859874, 0.945098, 0, 1, 1,
0.9279462, 1.865185, 0.4607097, 0.9490196, 0, 1, 1,
0.9330055, 0.1740282, 3.135815, 0.9568627, 0, 1, 1,
0.943476, 0.4110752, 1.057374, 0.9607843, 0, 1, 1,
0.9480879, 0.006717183, 2.356563, 0.9686275, 0, 1, 1,
0.9518538, 0.13096, 1.523692, 0.972549, 0, 1, 1,
0.9521935, -0.4797392, 1.308763, 0.9803922, 0, 1, 1,
0.9553091, 1.065576, -0.3983177, 0.9843137, 0, 1, 1,
0.9680201, 1.117625, 0.06138213, 0.9921569, 0, 1, 1,
0.9743878, -1.219828, 2.119536, 0.9960784, 0, 1, 1,
0.9744954, 0.4010204, 2.249367, 1, 0, 0.9960784, 1,
0.9796979, 0.9023653, 0.8654077, 1, 0, 0.9882353, 1,
0.9809464, 0.1794179, 2.086555, 1, 0, 0.9843137, 1,
0.9830777, 1.159595, 0.557829, 1, 0, 0.9764706, 1,
1.010339, -1.1689, 2.067109, 1, 0, 0.972549, 1,
1.016866, 0.1601813, 3.3562, 1, 0, 0.9647059, 1,
1.018228, -1.115275, 2.997224, 1, 0, 0.9607843, 1,
1.026152, 1.754775, 0.5522115, 1, 0, 0.9529412, 1,
1.02686, 0.07696205, 0.4368644, 1, 0, 0.9490196, 1,
1.034036, -0.7456412, 1.41353, 1, 0, 0.9411765, 1,
1.03556, 0.1092787, 1.889651, 1, 0, 0.9372549, 1,
1.040634, -0.3754301, 3.569267, 1, 0, 0.9294118, 1,
1.042795, 0.0309264, 1.589441, 1, 0, 0.9254902, 1,
1.0598, -0.3825062, 2.456578, 1, 0, 0.9176471, 1,
1.076028, -0.3162225, 2.420143, 1, 0, 0.9137255, 1,
1.084106, 1.233189, 0.005080767, 1, 0, 0.9058824, 1,
1.107098, 0.03708228, 1.92739, 1, 0, 0.9019608, 1,
1.109544, 0.1283305, 2.824337, 1, 0, 0.8941177, 1,
1.112726, -0.8728808, 2.63767, 1, 0, 0.8862745, 1,
1.113584, -0.4228248, 1.117201, 1, 0, 0.8823529, 1,
1.113777, 0.626772, -0.5807405, 1, 0, 0.8745098, 1,
1.11455, 0.9221115, -1.200901, 1, 0, 0.8705882, 1,
1.117389, 1.117844, 1.380061, 1, 0, 0.8627451, 1,
1.118118, -0.7771264, 2.805498, 1, 0, 0.8588235, 1,
1.120187, -1.159484, 1.016429, 1, 0, 0.8509804, 1,
1.128346, -1.268477, 4.132956, 1, 0, 0.8470588, 1,
1.132407, 0.004267046, 0.02525085, 1, 0, 0.8392157, 1,
1.135669, -0.5283502, 1.614757, 1, 0, 0.8352941, 1,
1.137674, 0.2452307, 0.2397787, 1, 0, 0.827451, 1,
1.141331, 0.9155884, 2.301189, 1, 0, 0.8235294, 1,
1.143209, 0.278751, 1.950062, 1, 0, 0.8156863, 1,
1.145643, -0.844421, 1.103632, 1, 0, 0.8117647, 1,
1.14569, 0.3752474, 0.7821969, 1, 0, 0.8039216, 1,
1.147737, 0.9174034, 1.777738, 1, 0, 0.7960784, 1,
1.148979, -0.6699159, 2.960194, 1, 0, 0.7921569, 1,
1.152667, 0.5036747, 0.6795359, 1, 0, 0.7843137, 1,
1.15847, 0.706687, 1.031156, 1, 0, 0.7803922, 1,
1.159967, -0.8134465, 1.669619, 1, 0, 0.772549, 1,
1.162688, -1.490226, 2.947684, 1, 0, 0.7686275, 1,
1.169415, -0.1648041, 1.671853, 1, 0, 0.7607843, 1,
1.175946, 0.1448628, 2.061329, 1, 0, 0.7568628, 1,
1.185932, 0.720967, 1.327194, 1, 0, 0.7490196, 1,
1.186116, -0.7866142, 0.9893196, 1, 0, 0.7450981, 1,
1.187565, 1.614148, 1.408496, 1, 0, 0.7372549, 1,
1.203765, 1.658543, -0.5810782, 1, 0, 0.7333333, 1,
1.20635, -0.933467, 0.9213783, 1, 0, 0.7254902, 1,
1.211685, -1.638311, 3.375827, 1, 0, 0.7215686, 1,
1.21397, 0.623185, 1.733809, 1, 0, 0.7137255, 1,
1.214157, 0.801123, -0.03266934, 1, 0, 0.7098039, 1,
1.215562, 0.9738687, 1.892541, 1, 0, 0.7019608, 1,
1.217675, -0.1386637, 1.775299, 1, 0, 0.6941177, 1,
1.224048, 1.193468, 2.046194, 1, 0, 0.6901961, 1,
1.226527, 0.3587694, 1.293789, 1, 0, 0.682353, 1,
1.228045, 0.4508616, 2.981752, 1, 0, 0.6784314, 1,
1.233419, -0.5713385, 1.764209, 1, 0, 0.6705883, 1,
1.233564, 0.1212321, 1.372953, 1, 0, 0.6666667, 1,
1.23771, 0.7097985, 1.522465, 1, 0, 0.6588235, 1,
1.238467, -0.1256588, 2.544223, 1, 0, 0.654902, 1,
1.243792, -0.7694635, 2.590649, 1, 0, 0.6470588, 1,
1.24381, 0.002188099, 2.758205, 1, 0, 0.6431373, 1,
1.248326, -2.168376, 2.084613, 1, 0, 0.6352941, 1,
1.256357, -1.796733, 3.49642, 1, 0, 0.6313726, 1,
1.260392, 1.093828, 0.3129639, 1, 0, 0.6235294, 1,
1.262718, -0.3285311, 1.665385, 1, 0, 0.6196079, 1,
1.283327, 1.723071, -2.193919, 1, 0, 0.6117647, 1,
1.283778, -1.132256, 2.595546, 1, 0, 0.6078432, 1,
1.284943, 0.1712475, 0.4267751, 1, 0, 0.6, 1,
1.288891, 1.998743, 0.7258577, 1, 0, 0.5921569, 1,
1.298228, 0.5994645, 1.129553, 1, 0, 0.5882353, 1,
1.303569, 0.2672205, -0.8424634, 1, 0, 0.5803922, 1,
1.306032, -0.3507909, 1.792526, 1, 0, 0.5764706, 1,
1.31664, 1.905038, 0.003074818, 1, 0, 0.5686275, 1,
1.328486, 0.4509259, 3.233628, 1, 0, 0.5647059, 1,
1.328571, 0.404201, 1.970247, 1, 0, 0.5568628, 1,
1.331944, -0.302911, 1.564034, 1, 0, 0.5529412, 1,
1.332024, -0.4447341, 3.170643, 1, 0, 0.5450981, 1,
1.342213, 1.131964, 0.8273057, 1, 0, 0.5411765, 1,
1.348334, -1.593633, 2.514599, 1, 0, 0.5333334, 1,
1.364419, -0.3534052, 1.094177, 1, 0, 0.5294118, 1,
1.366047, -0.09232721, -0.1343499, 1, 0, 0.5215687, 1,
1.367908, -1.796669, 0.3871659, 1, 0, 0.5176471, 1,
1.382523, -0.2809818, 0.2460864, 1, 0, 0.509804, 1,
1.385226, 0.07622112, 2.051302, 1, 0, 0.5058824, 1,
1.386491, -0.1163617, -0.649027, 1, 0, 0.4980392, 1,
1.388732, -0.7370782, 2.351469, 1, 0, 0.4901961, 1,
1.395643, -0.01994813, 0.64918, 1, 0, 0.4862745, 1,
1.40791, 0.2140731, -0.1138987, 1, 0, 0.4784314, 1,
1.413534, 0.3774082, 0.385424, 1, 0, 0.4745098, 1,
1.421919, 0.8886908, 1.377846, 1, 0, 0.4666667, 1,
1.423766, -0.2654837, 0.7850822, 1, 0, 0.4627451, 1,
1.424175, 1.636773, -0.7595772, 1, 0, 0.454902, 1,
1.432501, -0.08005121, 2.117083, 1, 0, 0.4509804, 1,
1.437286, -1.183409, 1.594549, 1, 0, 0.4431373, 1,
1.438256, -1.212327, 2.843596, 1, 0, 0.4392157, 1,
1.438351, -0.6093654, 1.975421, 1, 0, 0.4313726, 1,
1.438458, 1.28105, 0.9436458, 1, 0, 0.427451, 1,
1.442277, -1.804134, 3.501117, 1, 0, 0.4196078, 1,
1.44813, 1.578737, 0.3531327, 1, 0, 0.4156863, 1,
1.450196, 0.1086056, 1.728553, 1, 0, 0.4078431, 1,
1.455465, 0.5588909, 1.374395, 1, 0, 0.4039216, 1,
1.462591, 0.6142001, 1.952954, 1, 0, 0.3960784, 1,
1.462838, -1.122888, 2.228099, 1, 0, 0.3882353, 1,
1.463039, -0.3312184, 2.311459, 1, 0, 0.3843137, 1,
1.465277, 1.112814, 0.1449866, 1, 0, 0.3764706, 1,
1.466231, -0.05576818, 1.363277, 1, 0, 0.372549, 1,
1.468386, 0.3652814, 0.5443355, 1, 0, 0.3647059, 1,
1.468984, -0.3494265, 1.798288, 1, 0, 0.3607843, 1,
1.497073, -1.359071, 1.827079, 1, 0, 0.3529412, 1,
1.527245, 0.2252367, 2.95277, 1, 0, 0.3490196, 1,
1.545833, 1.647998, 1.783678, 1, 0, 0.3411765, 1,
1.558821, -0.6677702, 3.132345, 1, 0, 0.3372549, 1,
1.568995, 0.4796991, 1.846406, 1, 0, 0.3294118, 1,
1.588261, -0.6499002, 3.811545, 1, 0, 0.3254902, 1,
1.596348, 1.209388, 0.9503594, 1, 0, 0.3176471, 1,
1.597211, -1.588662, 1.04959, 1, 0, 0.3137255, 1,
1.603112, -0.8965569, 3.585315, 1, 0, 0.3058824, 1,
1.605922, 1.90792, 1.247654, 1, 0, 0.2980392, 1,
1.61766, -2.377377, 1.946319, 1, 0, 0.2941177, 1,
1.623541, 1.427554, -1.06567, 1, 0, 0.2862745, 1,
1.651475, 1.118199, -1.197701, 1, 0, 0.282353, 1,
1.652649, 0.5853646, 2.913933, 1, 0, 0.2745098, 1,
1.6614, -0.2889579, -0.2823498, 1, 0, 0.2705882, 1,
1.661749, 2.423053, 1.874865, 1, 0, 0.2627451, 1,
1.683242, -0.2661636, 3.957628, 1, 0, 0.2588235, 1,
1.692884, 0.2030791, 0.192, 1, 0, 0.2509804, 1,
1.695287, 0.7446674, 1.701251, 1, 0, 0.2470588, 1,
1.708858, -0.1193958, 0.5917807, 1, 0, 0.2392157, 1,
1.725451, -0.4937884, 1.296854, 1, 0, 0.2352941, 1,
1.733546, -0.1108263, 1.612103, 1, 0, 0.227451, 1,
1.748994, 0.1028484, 1.229672, 1, 0, 0.2235294, 1,
1.757711, 0.1853895, 2.583474, 1, 0, 0.2156863, 1,
1.767297, 0.3444647, 0.6450299, 1, 0, 0.2117647, 1,
1.776338, -0.8972858, 1.21828, 1, 0, 0.2039216, 1,
1.788113, -1.000965, 0.391391, 1, 0, 0.1960784, 1,
1.810465, 1.446267, 0.3402672, 1, 0, 0.1921569, 1,
1.818875, 0.2397351, 0.6924146, 1, 0, 0.1843137, 1,
1.862324, -0.881605, 2.002598, 1, 0, 0.1803922, 1,
1.866869, -0.2968552, 2.595745, 1, 0, 0.172549, 1,
1.873791, -1.032954, 2.038455, 1, 0, 0.1686275, 1,
1.874471, -0.1784573, 0.942801, 1, 0, 0.1607843, 1,
1.893924, 0.01940679, 1.389029, 1, 0, 0.1568628, 1,
1.903548, 0.1734323, 0.5977546, 1, 0, 0.1490196, 1,
1.908947, -0.6190079, 3.09721, 1, 0, 0.145098, 1,
1.913538, -1.189727, 1.897858, 1, 0, 0.1372549, 1,
1.918762, 0.8440455, 0.6913936, 1, 0, 0.1333333, 1,
1.923763, -0.2097566, 1.635918, 1, 0, 0.1254902, 1,
1.928597, 1.529549, 0.6999951, 1, 0, 0.1215686, 1,
1.94491, -1.273649, 2.122126, 1, 0, 0.1137255, 1,
1.965986, 0.6123987, 0.9567779, 1, 0, 0.1098039, 1,
1.99574, -0.6840744, 0.4823558, 1, 0, 0.1019608, 1,
2.000695, 1.576474, 0.5724053, 1, 0, 0.09411765, 1,
2.025673, 0.7111366, 0.236754, 1, 0, 0.09019608, 1,
2.043494, -1.573288, 2.570511, 1, 0, 0.08235294, 1,
2.17162, -0.6102902, 1.22649, 1, 0, 0.07843138, 1,
2.253993, -0.8484179, 1.406681, 1, 0, 0.07058824, 1,
2.339391, 0.7001027, -0.5100641, 1, 0, 0.06666667, 1,
2.3568, 0.5176747, -0.4126305, 1, 0, 0.05882353, 1,
2.452432, -1.391059, 0.6930355, 1, 0, 0.05490196, 1,
2.469667, 0.5950078, 2.2749, 1, 0, 0.04705882, 1,
2.474362, 0.918945, 1.329492, 1, 0, 0.04313726, 1,
2.514012, 1.293008, 1.845013, 1, 0, 0.03529412, 1,
2.602438, -0.1631429, -0.1402089, 1, 0, 0.03137255, 1,
2.807065, 0.2873338, 1.693048, 1, 0, 0.02352941, 1,
2.843205, 0.4096403, 1.038937, 1, 0, 0.01960784, 1,
3.132878, -2.569633, 1.747458, 1, 0, 0.01176471, 1,
3.191252, -0.5276377, 0.751263, 1, 0, 0.007843138, 1
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
-0.1185516, -4.270864, -7.00657, 0, -0.5, 0.5, 0.5,
-0.1185516, -4.270864, -7.00657, 1, -0.5, 0.5, 0.5,
-0.1185516, -4.270864, -7.00657, 1, 1.5, 0.5, 0.5,
-0.1185516, -4.270864, -7.00657, 0, 1.5, 0.5, 0.5
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
-4.550379, -0.1691506, -7.00657, 0, -0.5, 0.5, 0.5,
-4.550379, -0.1691506, -7.00657, 1, -0.5, 0.5, 0.5,
-4.550379, -0.1691506, -7.00657, 1, 1.5, 0.5, 0.5,
-4.550379, -0.1691506, -7.00657, 0, 1.5, 0.5, 0.5
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
-4.550379, -4.270864, 0.1059244, 0, -0.5, 0.5, 0.5,
-4.550379, -4.270864, 0.1059244, 1, -0.5, 0.5, 0.5,
-4.550379, -4.270864, 0.1059244, 1, 1.5, 0.5, 0.5,
-4.550379, -4.270864, 0.1059244, 0, 1.5, 0.5, 0.5
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
-3, -3.324315, -5.365225,
3, -3.324315, -5.365225,
-3, -3.324315, -5.365225,
-3, -3.482073, -5.638783,
-2, -3.324315, -5.365225,
-2, -3.482073, -5.638783,
-1, -3.324315, -5.365225,
-1, -3.482073, -5.638783,
0, -3.324315, -5.365225,
0, -3.482073, -5.638783,
1, -3.324315, -5.365225,
1, -3.482073, -5.638783,
2, -3.324315, -5.365225,
2, -3.482073, -5.638783,
3, -3.324315, -5.365225,
3, -3.482073, -5.638783
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
-3, -3.79759, -6.185897, 0, -0.5, 0.5, 0.5,
-3, -3.79759, -6.185897, 1, -0.5, 0.5, 0.5,
-3, -3.79759, -6.185897, 1, 1.5, 0.5, 0.5,
-3, -3.79759, -6.185897, 0, 1.5, 0.5, 0.5,
-2, -3.79759, -6.185897, 0, -0.5, 0.5, 0.5,
-2, -3.79759, -6.185897, 1, -0.5, 0.5, 0.5,
-2, -3.79759, -6.185897, 1, 1.5, 0.5, 0.5,
-2, -3.79759, -6.185897, 0, 1.5, 0.5, 0.5,
-1, -3.79759, -6.185897, 0, -0.5, 0.5, 0.5,
-1, -3.79759, -6.185897, 1, -0.5, 0.5, 0.5,
-1, -3.79759, -6.185897, 1, 1.5, 0.5, 0.5,
-1, -3.79759, -6.185897, 0, 1.5, 0.5, 0.5,
0, -3.79759, -6.185897, 0, -0.5, 0.5, 0.5,
0, -3.79759, -6.185897, 1, -0.5, 0.5, 0.5,
0, -3.79759, -6.185897, 1, 1.5, 0.5, 0.5,
0, -3.79759, -6.185897, 0, 1.5, 0.5, 0.5,
1, -3.79759, -6.185897, 0, -0.5, 0.5, 0.5,
1, -3.79759, -6.185897, 1, -0.5, 0.5, 0.5,
1, -3.79759, -6.185897, 1, 1.5, 0.5, 0.5,
1, -3.79759, -6.185897, 0, 1.5, 0.5, 0.5,
2, -3.79759, -6.185897, 0, -0.5, 0.5, 0.5,
2, -3.79759, -6.185897, 1, -0.5, 0.5, 0.5,
2, -3.79759, -6.185897, 1, 1.5, 0.5, 0.5,
2, -3.79759, -6.185897, 0, 1.5, 0.5, 0.5,
3, -3.79759, -6.185897, 0, -0.5, 0.5, 0.5,
3, -3.79759, -6.185897, 1, -0.5, 0.5, 0.5,
3, -3.79759, -6.185897, 1, 1.5, 0.5, 0.5,
3, -3.79759, -6.185897, 0, 1.5, 0.5, 0.5
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
-3.52765, -3, -5.365225,
-3.52765, 2, -5.365225,
-3.52765, -3, -5.365225,
-3.698104, -3, -5.638783,
-3.52765, -2, -5.365225,
-3.698104, -2, -5.638783,
-3.52765, -1, -5.365225,
-3.698104, -1, -5.638783,
-3.52765, 0, -5.365225,
-3.698104, 0, -5.638783,
-3.52765, 1, -5.365225,
-3.698104, 1, -5.638783,
-3.52765, 2, -5.365225,
-3.698104, 2, -5.638783
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
-4.039014, -3, -6.185897, 0, -0.5, 0.5, 0.5,
-4.039014, -3, -6.185897, 1, -0.5, 0.5, 0.5,
-4.039014, -3, -6.185897, 1, 1.5, 0.5, 0.5,
-4.039014, -3, -6.185897, 0, 1.5, 0.5, 0.5,
-4.039014, -2, -6.185897, 0, -0.5, 0.5, 0.5,
-4.039014, -2, -6.185897, 1, -0.5, 0.5, 0.5,
-4.039014, -2, -6.185897, 1, 1.5, 0.5, 0.5,
-4.039014, -2, -6.185897, 0, 1.5, 0.5, 0.5,
-4.039014, -1, -6.185897, 0, -0.5, 0.5, 0.5,
-4.039014, -1, -6.185897, 1, -0.5, 0.5, 0.5,
-4.039014, -1, -6.185897, 1, 1.5, 0.5, 0.5,
-4.039014, -1, -6.185897, 0, 1.5, 0.5, 0.5,
-4.039014, 0, -6.185897, 0, -0.5, 0.5, 0.5,
-4.039014, 0, -6.185897, 1, -0.5, 0.5, 0.5,
-4.039014, 0, -6.185897, 1, 1.5, 0.5, 0.5,
-4.039014, 0, -6.185897, 0, 1.5, 0.5, 0.5,
-4.039014, 1, -6.185897, 0, -0.5, 0.5, 0.5,
-4.039014, 1, -6.185897, 1, -0.5, 0.5, 0.5,
-4.039014, 1, -6.185897, 1, 1.5, 0.5, 0.5,
-4.039014, 1, -6.185897, 0, 1.5, 0.5, 0.5,
-4.039014, 2, -6.185897, 0, -0.5, 0.5, 0.5,
-4.039014, 2, -6.185897, 1, -0.5, 0.5, 0.5,
-4.039014, 2, -6.185897, 1, 1.5, 0.5, 0.5,
-4.039014, 2, -6.185897, 0, 1.5, 0.5, 0.5
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
-3.52765, -3.324315, -4,
-3.52765, -3.324315, 4,
-3.52765, -3.324315, -4,
-3.698104, -3.482073, -4,
-3.52765, -3.324315, -2,
-3.698104, -3.482073, -2,
-3.52765, -3.324315, 0,
-3.698104, -3.482073, 0,
-3.52765, -3.324315, 2,
-3.698104, -3.482073, 2,
-3.52765, -3.324315, 4,
-3.698104, -3.482073, 4
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
-4.039014, -3.79759, -4, 0, -0.5, 0.5, 0.5,
-4.039014, -3.79759, -4, 1, -0.5, 0.5, 0.5,
-4.039014, -3.79759, -4, 1, 1.5, 0.5, 0.5,
-4.039014, -3.79759, -4, 0, 1.5, 0.5, 0.5,
-4.039014, -3.79759, -2, 0, -0.5, 0.5, 0.5,
-4.039014, -3.79759, -2, 1, -0.5, 0.5, 0.5,
-4.039014, -3.79759, -2, 1, 1.5, 0.5, 0.5,
-4.039014, -3.79759, -2, 0, 1.5, 0.5, 0.5,
-4.039014, -3.79759, 0, 0, -0.5, 0.5, 0.5,
-4.039014, -3.79759, 0, 1, -0.5, 0.5, 0.5,
-4.039014, -3.79759, 0, 1, 1.5, 0.5, 0.5,
-4.039014, -3.79759, 0, 0, 1.5, 0.5, 0.5,
-4.039014, -3.79759, 2, 0, -0.5, 0.5, 0.5,
-4.039014, -3.79759, 2, 1, -0.5, 0.5, 0.5,
-4.039014, -3.79759, 2, 1, 1.5, 0.5, 0.5,
-4.039014, -3.79759, 2, 0, 1.5, 0.5, 0.5,
-4.039014, -3.79759, 4, 0, -0.5, 0.5, 0.5,
-4.039014, -3.79759, 4, 1, -0.5, 0.5, 0.5,
-4.039014, -3.79759, 4, 1, 1.5, 0.5, 0.5,
-4.039014, -3.79759, 4, 0, 1.5, 0.5, 0.5
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
-3.52765, -3.324315, -5.365225,
-3.52765, 2.986014, -5.365225,
-3.52765, -3.324315, 5.577074,
-3.52765, 2.986014, 5.577074,
-3.52765, -3.324315, -5.365225,
-3.52765, -3.324315, 5.577074,
-3.52765, 2.986014, -5.365225,
-3.52765, 2.986014, 5.577074,
-3.52765, -3.324315, -5.365225,
3.290546, -3.324315, -5.365225,
-3.52765, -3.324315, 5.577074,
3.290546, -3.324315, 5.577074,
-3.52765, 2.986014, -5.365225,
3.290546, 2.986014, -5.365225,
-3.52765, 2.986014, 5.577074,
3.290546, 2.986014, 5.577074,
3.290546, -3.324315, -5.365225,
3.290546, 2.986014, -5.365225,
3.290546, -3.324315, 5.577074,
3.290546, 2.986014, 5.577074,
3.290546, -3.324315, -5.365225,
3.290546, -3.324315, 5.577074,
3.290546, 2.986014, -5.365225,
3.290546, 2.986014, 5.577074
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
var radius = 7.664843;
var distance = 34.10175;
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
mvMatrix.translate( 0.1185516, 0.1691506, -0.1059244 );
mvMatrix.scale( 1.21548, 1.313304, 0.7573709 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.10175);
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
tolfenpyrad<-read.table("tolfenpyrad.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-tolfenpyrad$V2
```

```
## Error in eval(expr, envir, enclos): object 'tolfenpyrad' not found
```

```r
y<-tolfenpyrad$V3
```

```
## Error in eval(expr, envir, enclos): object 'tolfenpyrad' not found
```

```r
z<-tolfenpyrad$V4
```

```
## Error in eval(expr, envir, enclos): object 'tolfenpyrad' not found
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
-3.428355, 0.1898286, -1.720609, 0, 0, 1, 1, 1,
-2.872024, 0.5977908, -0.2306429, 1, 0, 0, 1, 1,
-2.692054, -1.225604, -1.660935, 1, 0, 0, 1, 1,
-2.625304, 0.3554091, -0.1769236, 1, 0, 0, 1, 1,
-2.480747, 1.35807, 1.082533, 1, 0, 0, 1, 1,
-2.44276, 0.1304328, -1.397214, 1, 0, 0, 1, 1,
-2.298072, 0.1596406, -1.770007, 0, 0, 0, 1, 1,
-2.252229, -1.05658, -3.129553, 0, 0, 0, 1, 1,
-2.208318, -1.153555, -3.196156, 0, 0, 0, 1, 1,
-2.204397, -0.5072588, -2.354822, 0, 0, 0, 1, 1,
-2.128436, 0.1732304, -2.166671, 0, 0, 0, 1, 1,
-2.124, 0.7071031, -1.455744, 0, 0, 0, 1, 1,
-2.088076, 1.888134, -0.281905, 0, 0, 0, 1, 1,
-2.063655, -1.764399, -2.796769, 1, 1, 1, 1, 1,
-2.032165, -1.883377, -2.968659, 1, 1, 1, 1, 1,
-2.015381, -0.6653877, -2.691646, 1, 1, 1, 1, 1,
-2.00421, 0.6348513, 0.9733198, 1, 1, 1, 1, 1,
-2.001168, -0.4442971, -1.220519, 1, 1, 1, 1, 1,
-1.958405, 0.1516072, -1.936805, 1, 1, 1, 1, 1,
-1.93208, 1.912026, -1.160837, 1, 1, 1, 1, 1,
-1.922821, -0.5303086, -0.8703243, 1, 1, 1, 1, 1,
-1.913216, 0.216271, -2.445483, 1, 1, 1, 1, 1,
-1.904891, 0.04007861, -2.307042, 1, 1, 1, 1, 1,
-1.90023, 1.109572, -1.047783, 1, 1, 1, 1, 1,
-1.899481, -1.13863, -2.884652, 1, 1, 1, 1, 1,
-1.895217, -1.137667, -1.444643, 1, 1, 1, 1, 1,
-1.890193, -0.816605, -1.207491, 1, 1, 1, 1, 1,
-1.871299, 0.9138653, -0.1142503, 1, 1, 1, 1, 1,
-1.865482, -0.6646349, -0.08114418, 0, 0, 1, 1, 1,
-1.860438, -1.122753, -3.447034, 1, 0, 0, 1, 1,
-1.818391, 0.4715447, -0.9196976, 1, 0, 0, 1, 1,
-1.769641, -0.1280892, -2.020899, 1, 0, 0, 1, 1,
-1.754339, -0.3116753, -1.430818, 1, 0, 0, 1, 1,
-1.745351, -0.9049937, -2.544081, 1, 0, 0, 1, 1,
-1.743808, -1.873394, -2.450031, 0, 0, 0, 1, 1,
-1.731911, 1.410118, -0.9250108, 0, 0, 0, 1, 1,
-1.697675, -0.1835673, -0.1005789, 0, 0, 0, 1, 1,
-1.685386, 0.7942599, -0.9989229, 0, 0, 0, 1, 1,
-1.674233, 0.6397095, -0.8035648, 0, 0, 0, 1, 1,
-1.666238, 0.1398516, -1.441467, 0, 0, 0, 1, 1,
-1.657135, -0.3647576, -0.9925207, 0, 0, 0, 1, 1,
-1.640429, -1.875554, -1.861993, 1, 1, 1, 1, 1,
-1.640076, 1.08183, -0.007154452, 1, 1, 1, 1, 1,
-1.640002, 1.134266, -1.295233, 1, 1, 1, 1, 1,
-1.608782, 0.9857143, -0.935648, 1, 1, 1, 1, 1,
-1.606128, 0.3760262, -2.192196, 1, 1, 1, 1, 1,
-1.603678, -0.5847055, -1.69089, 1, 1, 1, 1, 1,
-1.595391, 0.5966693, -1.778357, 1, 1, 1, 1, 1,
-1.594282, 0.5032454, -2.155108, 1, 1, 1, 1, 1,
-1.587434, 2.215211, -2.326543, 1, 1, 1, 1, 1,
-1.585261, -0.2862358, -2.048792, 1, 1, 1, 1, 1,
-1.549915, 0.6756514, -0.04389198, 1, 1, 1, 1, 1,
-1.549621, -1.092279, -2.619769, 1, 1, 1, 1, 1,
-1.52706, 0.4149856, -1.823205, 1, 1, 1, 1, 1,
-1.524206, 0.2008016, -1.525115, 1, 1, 1, 1, 1,
-1.521956, 0.6460683, -1.489395, 1, 1, 1, 1, 1,
-1.512137, 0.3051485, -1.52929, 0, 0, 1, 1, 1,
-1.509104, -1.373415, -1.624247, 1, 0, 0, 1, 1,
-1.506716, -1.831326, -1.989612, 1, 0, 0, 1, 1,
-1.505499, 0.9002371, -0.5032132, 1, 0, 0, 1, 1,
-1.504989, -0.707359, -2.456415, 1, 0, 0, 1, 1,
-1.496805, -0.5389755, -1.17734, 1, 0, 0, 1, 1,
-1.492723, -1.133169, -3.755553, 0, 0, 0, 1, 1,
-1.492704, 1.67714, -0.9747093, 0, 0, 0, 1, 1,
-1.489724, 1.08353, -1.607024, 0, 0, 0, 1, 1,
-1.484612, -0.8828961, -3.508904, 0, 0, 0, 1, 1,
-1.482737, 0.5553539, -1.790168, 0, 0, 0, 1, 1,
-1.472517, -0.1609166, -2.231369, 0, 0, 0, 1, 1,
-1.472226, 1.648386, -2.269252, 0, 0, 0, 1, 1,
-1.466475, -0.2045117, -2.066589, 1, 1, 1, 1, 1,
-1.457149, 0.4681553, -1.836856, 1, 1, 1, 1, 1,
-1.442271, 1.517687, 1.308051, 1, 1, 1, 1, 1,
-1.437463, 0.5979436, -0.5462584, 1, 1, 1, 1, 1,
-1.432118, 1.03547, 0.3148213, 1, 1, 1, 1, 1,
-1.428376, -1.548477, -2.363777, 1, 1, 1, 1, 1,
-1.422149, -1.916403, -2.882262, 1, 1, 1, 1, 1,
-1.421664, -0.9203134, -0.7273034, 1, 1, 1, 1, 1,
-1.421621, 1.304332, 0.03672954, 1, 1, 1, 1, 1,
-1.420777, 0.6588309, -1.072602, 1, 1, 1, 1, 1,
-1.41668, 0.8889455, -1.435064, 1, 1, 1, 1, 1,
-1.411079, -1.069594, -3.361835, 1, 1, 1, 1, 1,
-1.410192, 1.197073, -0.06559651, 1, 1, 1, 1, 1,
-1.390586, 1.273117, 0.702364, 1, 1, 1, 1, 1,
-1.386705, 1.03385, -0.9258765, 1, 1, 1, 1, 1,
-1.38052, -0.7057067, -3.446605, 0, 0, 1, 1, 1,
-1.374103, -0.8139623, -2.663513, 1, 0, 0, 1, 1,
-1.372125, 0.2911956, -0.5253434, 1, 0, 0, 1, 1,
-1.367384, -0.9664141, -2.059252, 1, 0, 0, 1, 1,
-1.363768, -0.4283382, -2.174673, 1, 0, 0, 1, 1,
-1.361086, -1.426178, -1.708157, 1, 0, 0, 1, 1,
-1.360992, -0.01304865, -1.16931, 0, 0, 0, 1, 1,
-1.355802, -0.5144044, -2.982331, 0, 0, 0, 1, 1,
-1.35312, -1.441604, -1.594827, 0, 0, 0, 1, 1,
-1.349723, 0.4821796, -1.463019, 0, 0, 0, 1, 1,
-1.336942, -0.6179781, -2.2917, 0, 0, 0, 1, 1,
-1.33579, 0.7873897, -1.842183, 0, 0, 0, 1, 1,
-1.328597, 0.787475, 0.5966495, 0, 0, 0, 1, 1,
-1.324419, 1.14733, -0.08555849, 1, 1, 1, 1, 1,
-1.319064, -0.5136194, -1.627612, 1, 1, 1, 1, 1,
-1.313174, -0.6797062, -3.053572, 1, 1, 1, 1, 1,
-1.304117, -1.562455, -2.241204, 1, 1, 1, 1, 1,
-1.298867, 1.534105, -0.5269286, 1, 1, 1, 1, 1,
-1.297377, 0.6823085, -1.715934, 1, 1, 1, 1, 1,
-1.291828, -0.6110525, -1.688515, 1, 1, 1, 1, 1,
-1.288873, -0.3987451, -1.027669, 1, 1, 1, 1, 1,
-1.281159, 0.2728707, -2.193946, 1, 1, 1, 1, 1,
-1.277068, -0.6665052, -3.901073, 1, 1, 1, 1, 1,
-1.272969, 0.4148068, -2.4478, 1, 1, 1, 1, 1,
-1.270068, 1.697905, -2.701314, 1, 1, 1, 1, 1,
-1.267347, -0.5895329, -3.181476, 1, 1, 1, 1, 1,
-1.263814, 1.6398, -0.8256714, 1, 1, 1, 1, 1,
-1.25694, -0.9817322, -1.487583, 1, 1, 1, 1, 1,
-1.252257, 0.08119221, -0.3086774, 0, 0, 1, 1, 1,
-1.244882, 0.2557861, 0.561263, 1, 0, 0, 1, 1,
-1.227069, 0.004109612, -2.790171, 1, 0, 0, 1, 1,
-1.225225, 0.6421189, -0.2252236, 1, 0, 0, 1, 1,
-1.218657, 1.282644, -0.5830771, 1, 0, 0, 1, 1,
-1.218125, -1.385729, -2.143584, 1, 0, 0, 1, 1,
-1.202386, -1.73475, -3.111423, 0, 0, 0, 1, 1,
-1.199163, -0.1998323, -2.833912, 0, 0, 0, 1, 1,
-1.18263, -1.363197, -2.853258, 0, 0, 0, 1, 1,
-1.181759, 0.3457102, -2.392025, 0, 0, 0, 1, 1,
-1.17185, -1.282385, -0.9918118, 0, 0, 0, 1, 1,
-1.168945, -0.09520911, -2.487757, 0, 0, 0, 1, 1,
-1.160596, -0.5135643, -1.885641, 0, 0, 0, 1, 1,
-1.157308, 1.204951, -1.783185, 1, 1, 1, 1, 1,
-1.150247, -0.1572035, -3.422302, 1, 1, 1, 1, 1,
-1.146936, -1.102139, -1.515601, 1, 1, 1, 1, 1,
-1.142991, -3.232417, -3.205408, 1, 1, 1, 1, 1,
-1.136995, -0.3416854, -2.933882, 1, 1, 1, 1, 1,
-1.134406, -0.6135474, -2.881242, 1, 1, 1, 1, 1,
-1.13145, -0.5519281, -2.361641, 1, 1, 1, 1, 1,
-1.125382, 0.2236811, -2.12434, 1, 1, 1, 1, 1,
-1.122942, 0.1291309, -1.53395, 1, 1, 1, 1, 1,
-1.122904, 1.781537, -0.6271259, 1, 1, 1, 1, 1,
-1.11237, -1.088726, -2.884885, 1, 1, 1, 1, 1,
-1.109573, 0.2293111, -0.9028355, 1, 1, 1, 1, 1,
-1.107128, 0.706769, 0.028242, 1, 1, 1, 1, 1,
-1.101965, 0.3115086, 0.1594638, 1, 1, 1, 1, 1,
-1.100148, 1.139609, -0.5780174, 1, 1, 1, 1, 1,
-1.09606, 0.4936842, -1.575249, 0, 0, 1, 1, 1,
-1.082444, -0.5909126, -2.240974, 1, 0, 0, 1, 1,
-1.075967, -0.6068563, -2.836668, 1, 0, 0, 1, 1,
-1.075783, 1.610187, -1.235588, 1, 0, 0, 1, 1,
-1.070047, -1.117976, -3.364974, 1, 0, 0, 1, 1,
-1.069656, -0.4285572, -1.414752, 1, 0, 0, 1, 1,
-1.068048, 2.517141, 0.3419803, 0, 0, 0, 1, 1,
-1.067786, -0.4900941, -3.295301, 0, 0, 0, 1, 1,
-1.058823, 0.129522, -2.496989, 0, 0, 0, 1, 1,
-1.057758, 0.02555071, -1.580726, 0, 0, 0, 1, 1,
-1.047115, -1.379369, -2.618884, 0, 0, 0, 1, 1,
-1.041668, -0.9753048, -2.515553, 0, 0, 0, 1, 1,
-1.039637, -1.204717, -2.411446, 0, 0, 0, 1, 1,
-1.037291, -1.071024, -3.253392, 1, 1, 1, 1, 1,
-1.029466, 0.6269062, -3.496175, 1, 1, 1, 1, 1,
-1.02362, 0.1694379, -0.3514383, 1, 1, 1, 1, 1,
-1.023476, -1.504389, -4.337819, 1, 1, 1, 1, 1,
-1.021642, 1.815812, -1.325872, 1, 1, 1, 1, 1,
-1.021281, -0.2700422, -1.519942, 1, 1, 1, 1, 1,
-1.015714, 0.04494841, -2.6487, 1, 1, 1, 1, 1,
-1.001344, 0.8451649, -1.538559, 1, 1, 1, 1, 1,
-1.000876, -1.146014, -1.703551, 1, 1, 1, 1, 1,
-0.997641, -0.2134103, -2.746519, 1, 1, 1, 1, 1,
-0.9933711, -0.9633446, -2.558225, 1, 1, 1, 1, 1,
-0.9915205, -1.844865, -2.707094, 1, 1, 1, 1, 1,
-0.9779294, 1.225535, -0.4727187, 1, 1, 1, 1, 1,
-0.9776643, 0.2140528, -0.9867744, 1, 1, 1, 1, 1,
-0.9745044, 0.07972573, -1.298152, 1, 1, 1, 1, 1,
-0.9683083, 0.9306267, -0.4636883, 0, 0, 1, 1, 1,
-0.9680629, -0.4858235, -3.598591, 1, 0, 0, 1, 1,
-0.9680514, -0.3327857, -3.17013, 1, 0, 0, 1, 1,
-0.9586757, -0.7469292, -2.703571, 1, 0, 0, 1, 1,
-0.9572858, -0.2554793, -1.811888, 1, 0, 0, 1, 1,
-0.9546317, 0.8325244, -1.532628, 1, 0, 0, 1, 1,
-0.9533609, 1.786099, -2.004096, 0, 0, 0, 1, 1,
-0.9418023, -0.8135475, -0.7332585, 0, 0, 0, 1, 1,
-0.9349185, 1.573465, -0.1339909, 0, 0, 0, 1, 1,
-0.9220999, -1.200934, -4.99913, 0, 0, 0, 1, 1,
-0.918227, -0.6601403, -2.479893, 0, 0, 0, 1, 1,
-0.9173506, -0.3202452, -2.213471, 0, 0, 0, 1, 1,
-0.9152572, -0.5844243, -1.48287, 0, 0, 0, 1, 1,
-0.9056098, 0.6226575, -1.784533, 1, 1, 1, 1, 1,
-0.9044637, -0.129304, -2.168293, 1, 1, 1, 1, 1,
-0.9041776, -0.9829644, -3.127095, 1, 1, 1, 1, 1,
-0.9005243, -0.02807328, -1.323239, 1, 1, 1, 1, 1,
-0.891331, -0.673964, -2.691703, 1, 1, 1, 1, 1,
-0.88004, -1.189801, -1.622743, 1, 1, 1, 1, 1,
-0.8738455, 0.3206401, -0.4764309, 1, 1, 1, 1, 1,
-0.8727421, 0.2748326, -1.475487, 1, 1, 1, 1, 1,
-0.868943, -0.4546739, -1.450419, 1, 1, 1, 1, 1,
-0.866188, 0.1492196, -0.6292691, 1, 1, 1, 1, 1,
-0.8644406, 1.972249, 1.166425, 1, 1, 1, 1, 1,
-0.8590476, 0.6709734, -1.338966, 1, 1, 1, 1, 1,
-0.8553287, 0.7963569, -0.5721834, 1, 1, 1, 1, 1,
-0.8552586, 0.7102918, -0.6536986, 1, 1, 1, 1, 1,
-0.8476329, -0.3779405, -0.8241445, 1, 1, 1, 1, 1,
-0.8444011, 0.8419253, -1.35145, 0, 0, 1, 1, 1,
-0.8443382, 0.53118, -2.329122, 1, 0, 0, 1, 1,
-0.8414935, 0.09565464, -0.4248101, 1, 0, 0, 1, 1,
-0.8360295, 0.06180583, -1.198763, 1, 0, 0, 1, 1,
-0.826647, -0.8430972, -1.969742, 1, 0, 0, 1, 1,
-0.8163127, -0.3108527, -3.519459, 1, 0, 0, 1, 1,
-0.8132059, 0.01241248, -2.079056, 0, 0, 0, 1, 1,
-0.8074533, 1.724777, -0.4628879, 0, 0, 0, 1, 1,
-0.8073927, 0.6166627, -0.4497104, 0, 0, 0, 1, 1,
-0.8068119, 1.816369, -0.3051614, 0, 0, 0, 1, 1,
-0.7975765, -2.161832, -2.099478, 0, 0, 0, 1, 1,
-0.7970808, 0.6202757, -0.00171976, 0, 0, 0, 1, 1,
-0.7892628, -0.9866831, -3.244193, 0, 0, 0, 1, 1,
-0.7891783, -0.1394182, -1.670503, 1, 1, 1, 1, 1,
-0.7874643, -0.1464422, -3.145865, 1, 1, 1, 1, 1,
-0.7838126, -0.6269334, -1.398881, 1, 1, 1, 1, 1,
-0.778664, -0.0946677, -1.467525, 1, 1, 1, 1, 1,
-0.7767568, -1.419785, -4.69621, 1, 1, 1, 1, 1,
-0.7763989, -0.3471637, -1.500774, 1, 1, 1, 1, 1,
-0.7759565, 0.1626431, -1.088949, 1, 1, 1, 1, 1,
-0.770653, -0.213478, -2.279492, 1, 1, 1, 1, 1,
-0.7649397, -1.205476, -2.58161, 1, 1, 1, 1, 1,
-0.7452106, 0.7028397, -1.898032, 1, 1, 1, 1, 1,
-0.7438492, -0.192474, -2.673001, 1, 1, 1, 1, 1,
-0.7428164, 0.7364725, -1.187621, 1, 1, 1, 1, 1,
-0.7379993, 0.7253494, -0.8378574, 1, 1, 1, 1, 1,
-0.7316676, 1.55473, -0.9645283, 1, 1, 1, 1, 1,
-0.7181499, 0.1158206, -1.326645, 1, 1, 1, 1, 1,
-0.7175562, 1.950143, -0.3995703, 0, 0, 1, 1, 1,
-0.7174327, 0.9736216, -0.46743, 1, 0, 0, 1, 1,
-0.7172559, -0.6955626, -1.356902, 1, 0, 0, 1, 1,
-0.7089692, 1.366041, -1.69478, 1, 0, 0, 1, 1,
-0.70661, 2.112787, -2.913388, 1, 0, 0, 1, 1,
-0.7065437, 1.401656, -0.8331548, 1, 0, 0, 1, 1,
-0.7060778, -0.5347013, -2.618289, 0, 0, 0, 1, 1,
-0.7042448, -2.08258, -3.085276, 0, 0, 0, 1, 1,
-0.7041185, -0.4932792, -1.127366, 0, 0, 0, 1, 1,
-0.7007793, -0.553932, -2.217422, 0, 0, 0, 1, 1,
-0.6994409, -0.02847582, -0.85782, 0, 0, 0, 1, 1,
-0.6928507, 0.1788639, 1.106225, 0, 0, 0, 1, 1,
-0.6903912, 1.961147, 0.3441631, 0, 0, 0, 1, 1,
-0.6893535, 0.06825951, -3.232084, 1, 1, 1, 1, 1,
-0.6840149, -0.4728727, -2.770788, 1, 1, 1, 1, 1,
-0.680985, 0.04126842, -1.846265, 1, 1, 1, 1, 1,
-0.6798564, -1.362781, -2.922072, 1, 1, 1, 1, 1,
-0.672133, -0.3672628, -1.262923, 1, 1, 1, 1, 1,
-0.6526701, -0.9649503, -4.332788, 1, 1, 1, 1, 1,
-0.6519232, -1.940689, -2.670973, 1, 1, 1, 1, 1,
-0.6472529, -0.7549677, -2.000493, 1, 1, 1, 1, 1,
-0.6423839, 0.2626527, -2.74856, 1, 1, 1, 1, 1,
-0.6371906, -1.292694, -2.377218, 1, 1, 1, 1, 1,
-0.6352267, -0.271699, -1.401528, 1, 1, 1, 1, 1,
-0.6350209, -0.7330176, -1.258971, 1, 1, 1, 1, 1,
-0.6302804, 0.5457606, -1.196896, 1, 1, 1, 1, 1,
-0.629459, 0.4730632, 1.028904, 1, 1, 1, 1, 1,
-0.6260294, 0.1327058, -1.839797, 1, 1, 1, 1, 1,
-0.6205491, 2.060957, -0.4212982, 0, 0, 1, 1, 1,
-0.620253, 0.5499614, 1.83542, 1, 0, 0, 1, 1,
-0.61543, -0.2703044, -2.729625, 1, 0, 0, 1, 1,
-0.6153631, -0.3629829, -0.2122396, 1, 0, 0, 1, 1,
-0.6142573, -0.9227767, -2.802049, 1, 0, 0, 1, 1,
-0.6103123, 0.9854921, -0.08677198, 1, 0, 0, 1, 1,
-0.6091998, 0.4195186, -0.6513246, 0, 0, 0, 1, 1,
-0.6089409, -0.08148856, -1.411839, 0, 0, 0, 1, 1,
-0.6008167, -0.1155024, -1.537579, 0, 0, 0, 1, 1,
-0.5975834, 1.090831, 0.05584495, 0, 0, 0, 1, 1,
-0.5974963, 0.6847023, -0.8825626, 0, 0, 0, 1, 1,
-0.5965604, -1.018207, -2.077127, 0, 0, 0, 1, 1,
-0.5892959, -0.8216199, -2.138791, 0, 0, 0, 1, 1,
-0.5891665, 2.200929, -0.1912006, 1, 1, 1, 1, 1,
-0.5855851, -0.1679976, -1.529251, 1, 1, 1, 1, 1,
-0.5851806, 1.715799, -0.7413352, 1, 1, 1, 1, 1,
-0.5849517, -1.396749, -2.893829, 1, 1, 1, 1, 1,
-0.5826208, -0.8726156, -1.852285, 1, 1, 1, 1, 1,
-0.5812066, -1.10268, -4.612619, 1, 1, 1, 1, 1,
-0.5803463, 1.535206, -0.1434931, 1, 1, 1, 1, 1,
-0.5759858, 0.4938375, -0.823812, 1, 1, 1, 1, 1,
-0.5686223, 0.2152369, -2.812396, 1, 1, 1, 1, 1,
-0.5644219, 1.603066, 0.4673569, 1, 1, 1, 1, 1,
-0.5609882, -1.455445, -3.390698, 1, 1, 1, 1, 1,
-0.560782, 0.5631363, -1.31631, 1, 1, 1, 1, 1,
-0.5592303, 0.9265456, -1.803917, 1, 1, 1, 1, 1,
-0.5581626, -0.01111307, -1.697787, 1, 1, 1, 1, 1,
-0.5558628, 0.1470332, -1.864965, 1, 1, 1, 1, 1,
-0.5555708, 0.973226, -1.770722, 0, 0, 1, 1, 1,
-0.5553085, 1.179381, -0.3216024, 1, 0, 0, 1, 1,
-0.553377, 0.3098711, 0.3570017, 1, 0, 0, 1, 1,
-0.5522127, -0.2329211, -2.583754, 1, 0, 0, 1, 1,
-0.5503603, 1.514773, -0.3329845, 1, 0, 0, 1, 1,
-0.5441059, -0.8890413, -2.710101, 1, 0, 0, 1, 1,
-0.5424793, -1.321432, -1.358303, 0, 0, 0, 1, 1,
-0.5416273, 0.7420605, 0.827356, 0, 0, 0, 1, 1,
-0.541353, -1.348306, -1.817882, 0, 0, 0, 1, 1,
-0.5396601, 1.439474, -1.6735, 0, 0, 0, 1, 1,
-0.5359315, -0.9102238, -3.421144, 0, 0, 0, 1, 1,
-0.5311544, -0.2066633, -2.056405, 0, 0, 0, 1, 1,
-0.5243597, -1.049213, -4.934995, 0, 0, 0, 1, 1,
-0.5224336, -0.3149011, -2.835621, 1, 1, 1, 1, 1,
-0.5128595, -1.786863, -3.509378, 1, 1, 1, 1, 1,
-0.5095676, 0.570527, 0.03896842, 1, 1, 1, 1, 1,
-0.5088252, 1.543614, 0.6171756, 1, 1, 1, 1, 1,
-0.5080622, 0.1783918, -2.341535, 1, 1, 1, 1, 1,
-0.5074604, -0.18821, -0.453656, 1, 1, 1, 1, 1,
-0.5061425, -1.348677, -1.286558, 1, 1, 1, 1, 1,
-0.5061058, 0.8719432, -0.1062019, 1, 1, 1, 1, 1,
-0.5035481, 0.8746576, 0.9309332, 1, 1, 1, 1, 1,
-0.4957154, 0.9970244, -0.1272737, 1, 1, 1, 1, 1,
-0.4868298, 0.9292532, -1.500826, 1, 1, 1, 1, 1,
-0.473045, -1.524285, -3.727123, 1, 1, 1, 1, 1,
-0.4725556, 0.6674834, -2.758897, 1, 1, 1, 1, 1,
-0.4719187, -0.2984505, -4.049156, 1, 1, 1, 1, 1,
-0.4701527, 0.3740134, -0.3751864, 1, 1, 1, 1, 1,
-0.4679754, -1.408274, -4.46651, 0, 0, 1, 1, 1,
-0.4677415, 1.329456, 0.7683159, 1, 0, 0, 1, 1,
-0.4645611, -0.1037413, -1.609995, 1, 0, 0, 1, 1,
-0.4610561, -0.368821, -2.868432, 1, 0, 0, 1, 1,
-0.4606743, 0.9508848, 2.291826, 1, 0, 0, 1, 1,
-0.4538922, -1.700454, -3.106638, 1, 0, 0, 1, 1,
-0.4457031, 0.875583, -1.691803, 0, 0, 0, 1, 1,
-0.4436159, -0.1481853, -2.582536, 0, 0, 0, 1, 1,
-0.441025, -0.141499, -0.9252241, 0, 0, 0, 1, 1,
-0.4403239, -0.6714257, -0.8976958, 0, 0, 0, 1, 1,
-0.4391443, 0.9889591, 0.05633444, 0, 0, 0, 1, 1,
-0.4300702, -1.615063, -2.877048, 0, 0, 0, 1, 1,
-0.4294504, -0.8844448, -2.500381, 0, 0, 0, 1, 1,
-0.4271806, 0.5545422, -0.7166318, 1, 1, 1, 1, 1,
-0.4245987, 1.59132, -1.446693, 1, 1, 1, 1, 1,
-0.4214396, 2.053153, -0.5689693, 1, 1, 1, 1, 1,
-0.4211887, 0.8065335, -1.051543, 1, 1, 1, 1, 1,
-0.4209877, -0.622395, -2.791994, 1, 1, 1, 1, 1,
-0.4208249, -0.2368332, -1.755374, 1, 1, 1, 1, 1,
-0.4175953, 0.01645561, -3.630526, 1, 1, 1, 1, 1,
-0.414037, 0.5434964, 0.6826176, 1, 1, 1, 1, 1,
-0.4134878, -1.018928, -1.937646, 1, 1, 1, 1, 1,
-0.4134651, 1.277166, -2.760328, 1, 1, 1, 1, 1,
-0.4134156, -1.063541, -2.850955, 1, 1, 1, 1, 1,
-0.412796, 1.42121, 0.1612408, 1, 1, 1, 1, 1,
-0.4064194, 1.884285, 0.2786498, 1, 1, 1, 1, 1,
-0.4062438, 1.371824, 0.2861293, 1, 1, 1, 1, 1,
-0.4052574, -0.4824048, -2.284942, 1, 1, 1, 1, 1,
-0.402479, 1.191794, -2.511863, 0, 0, 1, 1, 1,
-0.3924707, -0.9850767, -4.190842, 1, 0, 0, 1, 1,
-0.3895301, 0.4900931, -1.891804, 1, 0, 0, 1, 1,
-0.3863955, 1.706408, 0.05653559, 1, 0, 0, 1, 1,
-0.3787145, -0.6985144, -2.352358, 1, 0, 0, 1, 1,
-0.3785836, 0.3514957, -3.436228, 1, 0, 0, 1, 1,
-0.3769469, 0.1112352, -1.351467, 0, 0, 0, 1, 1,
-0.3702062, -1.361035, -2.467819, 0, 0, 0, 1, 1,
-0.3625311, 1.193287, -1.155531, 0, 0, 0, 1, 1,
-0.362447, 1.26828, -0.3552034, 0, 0, 0, 1, 1,
-0.3624367, -1.638543, -2.035303, 0, 0, 0, 1, 1,
-0.3617147, -0.2061071, -2.986747, 0, 0, 0, 1, 1,
-0.3614437, 0.6590259, -2.172675, 0, 0, 0, 1, 1,
-0.3586672, -1.210797, -1.212329, 1, 1, 1, 1, 1,
-0.3557236, 0.8764443, -0.5308097, 1, 1, 1, 1, 1,
-0.354225, -3.034308, -3.863034, 1, 1, 1, 1, 1,
-0.3534372, -0.2022782, -2.012732, 1, 1, 1, 1, 1,
-0.3454672, -0.6451914, -3.131841, 1, 1, 1, 1, 1,
-0.3454566, -2.039914, -1.385496, 1, 1, 1, 1, 1,
-0.3434926, 0.0596723, -1.57409, 1, 1, 1, 1, 1,
-0.3433177, -0.7387933, -2.167558, 1, 1, 1, 1, 1,
-0.3335129, -1.408647, -2.526957, 1, 1, 1, 1, 1,
-0.3332232, 0.8386666, -0.4681522, 1, 1, 1, 1, 1,
-0.3324098, 1.277495, 1.161829, 1, 1, 1, 1, 1,
-0.3299107, -0.8657091, -4.225841, 1, 1, 1, 1, 1,
-0.3270012, -0.7482767, -3.106252, 1, 1, 1, 1, 1,
-0.3269907, -0.3970038, -3.131917, 1, 1, 1, 1, 1,
-0.3258526, -0.119646, -2.559737, 1, 1, 1, 1, 1,
-0.3235994, 0.1335718, -1.334532, 0, 0, 1, 1, 1,
-0.3212813, 0.5434965, 0.0006190917, 1, 0, 0, 1, 1,
-0.3179881, -0.1630021, -3.33587, 1, 0, 0, 1, 1,
-0.3175678, 0.01333147, -0.8617845, 1, 0, 0, 1, 1,
-0.3164242, 0.9523724, -0.1340911, 1, 0, 0, 1, 1,
-0.3115466, -2.654753, -2.625366, 1, 0, 0, 1, 1,
-0.3098812, 0.1588512, -2.049044, 0, 0, 0, 1, 1,
-0.3056169, 0.3773539, -1.112804, 0, 0, 0, 1, 1,
-0.3032958, 1.868756, 1.128493, 0, 0, 0, 1, 1,
-0.3018593, -1.02197, -2.875052, 0, 0, 0, 1, 1,
-0.2990747, 0.5749816, -0.8024065, 0, 0, 0, 1, 1,
-0.2962648, -0.5679162, -2.968808, 0, 0, 0, 1, 1,
-0.2879374, 1.496606, -0.2346617, 0, 0, 0, 1, 1,
-0.285522, 1.56848, -0.5280399, 1, 1, 1, 1, 1,
-0.2843133, -1.382365, -5.205871, 1, 1, 1, 1, 1,
-0.2816605, -1.344689, -3.419184, 1, 1, 1, 1, 1,
-0.2806942, 0.1204007, -1.312673, 1, 1, 1, 1, 1,
-0.2803859, 0.5392165, -1.703993, 1, 1, 1, 1, 1,
-0.2775634, -0.8467461, -3.19034, 1, 1, 1, 1, 1,
-0.274803, 1.642359, -1.023432, 1, 1, 1, 1, 1,
-0.2651497, -0.7241061, -4.351502, 1, 1, 1, 1, 1,
-0.264163, 1.029937, -0.9519579, 1, 1, 1, 1, 1,
-0.2534046, 0.2998325, 0.5842789, 1, 1, 1, 1, 1,
-0.2483865, -0.08071411, -0.571435, 1, 1, 1, 1, 1,
-0.230864, 0.2258169, -1.564762, 1, 1, 1, 1, 1,
-0.2297252, 0.1226473, 0.3319099, 1, 1, 1, 1, 1,
-0.2289192, -1.299675, -4.118837, 1, 1, 1, 1, 1,
-0.2281316, 1.155712, -0.07036778, 1, 1, 1, 1, 1,
-0.2244447, -1.072486, -2.96752, 0, 0, 1, 1, 1,
-0.2239829, 0.2162132, -0.9769764, 1, 0, 0, 1, 1,
-0.2212028, 2.68963, -2.130536, 1, 0, 0, 1, 1,
-0.2205462, 1.673291, 0.3047369, 1, 0, 0, 1, 1,
-0.2190085, 0.1339746, -1.371764, 1, 0, 0, 1, 1,
-0.2150282, -0.5813352, -3.461848, 1, 0, 0, 1, 1,
-0.2131909, 2.351878, 1.222759, 0, 0, 0, 1, 1,
-0.2095088, 1.371203, 0.5840614, 0, 0, 0, 1, 1,
-0.2086021, 0.5391257, -0.9817728, 0, 0, 0, 1, 1,
-0.2078944, -1.161329, -2.845461, 0, 0, 0, 1, 1,
-0.2042023, -2.288906, -1.589603, 0, 0, 0, 1, 1,
-0.2023862, -0.6548496, -4.073476, 0, 0, 0, 1, 1,
-0.1978791, -0.571575, -3.330316, 0, 0, 0, 1, 1,
-0.1962205, -1.594472, -3.315421, 1, 1, 1, 1, 1,
-0.1951612, -0.7031692, -1.950499, 1, 1, 1, 1, 1,
-0.1950619, -1.237943, -3.665962, 1, 1, 1, 1, 1,
-0.195054, 0.1772604, -0.9569175, 1, 1, 1, 1, 1,
-0.1946359, -0.2196523, -2.043512, 1, 1, 1, 1, 1,
-0.1931222, -0.605139, -3.744379, 1, 1, 1, 1, 1,
-0.1924943, 2.032246, 0.1103788, 1, 1, 1, 1, 1,
-0.1911804, 0.8178162, -1.043486, 1, 1, 1, 1, 1,
-0.1877597, -1.291445, -1.647463, 1, 1, 1, 1, 1,
-0.1864308, -0.5628827, -3.396895, 1, 1, 1, 1, 1,
-0.1832909, 0.4501679, 0.109939, 1, 1, 1, 1, 1,
-0.1830272, 1.049297, 0.193171, 1, 1, 1, 1, 1,
-0.1814531, -0.2979827, -2.438653, 1, 1, 1, 1, 1,
-0.1801385, -1.37028, -4.612069, 1, 1, 1, 1, 1,
-0.1748586, 0.3272043, -1.454083, 1, 1, 1, 1, 1,
-0.1736318, 0.3925105, -1.646498, 0, 0, 1, 1, 1,
-0.1705732, -0.4848247, -1.39689, 1, 0, 0, 1, 1,
-0.1639215, 0.5316325, 0.2558605, 1, 0, 0, 1, 1,
-0.1601271, -1.792813, -3.395897, 1, 0, 0, 1, 1,
-0.1591782, -1.890966, -3.3558, 1, 0, 0, 1, 1,
-0.1587597, -0.9415107, -3.678976, 1, 0, 0, 1, 1,
-0.1586591, 1.906113, -1.194332, 0, 0, 0, 1, 1,
-0.1583719, 0.2541618, -0.3133757, 0, 0, 0, 1, 1,
-0.1565798, 0.7250664, -0.6468074, 0, 0, 0, 1, 1,
-0.1505249, 0.4792432, -1.750221, 0, 0, 0, 1, 1,
-0.150457, 0.6212677, 0.3123466, 0, 0, 0, 1, 1,
-0.149004, 0.232346, -1.047091, 0, 0, 0, 1, 1,
-0.1481085, 0.8661847, -1.595838, 0, 0, 0, 1, 1,
-0.1476553, -1.607606, -3.885863, 1, 1, 1, 1, 1,
-0.1471273, -0.3194498, -2.42053, 1, 1, 1, 1, 1,
-0.1446237, 0.02810161, -0.5697459, 1, 1, 1, 1, 1,
-0.1418678, -0.06991788, -0.03762863, 1, 1, 1, 1, 1,
-0.1402254, 0.9874922, 1.769198, 1, 1, 1, 1, 1,
-0.1388582, 0.1790257, 0.89367, 1, 1, 1, 1, 1,
-0.1376777, 1.008387, -0.7464685, 1, 1, 1, 1, 1,
-0.1361702, 0.04451942, -2.707754, 1, 1, 1, 1, 1,
-0.1350293, 2.008567, -0.06503706, 1, 1, 1, 1, 1,
-0.1324231, 1.149085, -0.007847207, 1, 1, 1, 1, 1,
-0.1322103, 0.2080873, -0.8647726, 1, 1, 1, 1, 1,
-0.1245813, 0.544151, -1.886657, 1, 1, 1, 1, 1,
-0.11801, 0.001894911, -2.046064, 1, 1, 1, 1, 1,
-0.1138321, -0.6016732, -2.388639, 1, 1, 1, 1, 1,
-0.1128539, -2.164216, -4.95251, 1, 1, 1, 1, 1,
-0.1102345, 0.2642245, -1.435963, 0, 0, 1, 1, 1,
-0.106676, 0.4362109, -1.767095, 1, 0, 0, 1, 1,
-0.1004057, -0.4828581, -5.004777, 1, 0, 0, 1, 1,
-0.09832745, 1.544775, -0.1922654, 1, 0, 0, 1, 1,
-0.0982163, -1.072081, -1.43051, 1, 0, 0, 1, 1,
-0.09507864, -0.9322968, -3.172271, 1, 0, 0, 1, 1,
-0.09468868, 1.121, 1.210431, 0, 0, 0, 1, 1,
-0.09391733, 0.9079266, 1.393505, 0, 0, 0, 1, 1,
-0.08749215, 1.38173, -0.2903394, 0, 0, 0, 1, 1,
-0.08199307, 2.748894, -2.517762, 0, 0, 0, 1, 1,
-0.08038673, -0.7270413, -1.633994, 0, 0, 0, 1, 1,
-0.07866612, -2.135194, -2.70693, 0, 0, 0, 1, 1,
-0.07849653, 1.167827, -0.6302115, 0, 0, 0, 1, 1,
-0.07519769, 0.5060151, -0.9382779, 1, 1, 1, 1, 1,
-0.07444697, -0.9225809, -4.113589, 1, 1, 1, 1, 1,
-0.07259665, -0.01545079, -2.671125, 1, 1, 1, 1, 1,
-0.0704458, -0.9991111, -1.714292, 1, 1, 1, 1, 1,
-0.07017785, 2.519298, 1.932725, 1, 1, 1, 1, 1,
-0.06939337, -1.045092, -2.903709, 1, 1, 1, 1, 1,
-0.06634892, -1.397035, -1.765837, 1, 1, 1, 1, 1,
-0.06620649, 0.09542405, -0.8203109, 1, 1, 1, 1, 1,
-0.06414084, 0.359539, -0.2468839, 1, 1, 1, 1, 1,
-0.06359479, -1.665915, -1.617465, 1, 1, 1, 1, 1,
-0.06323139, 1.152597, 0.8630664, 1, 1, 1, 1, 1,
-0.06237002, -0.436793, -3.836688, 1, 1, 1, 1, 1,
-0.06055119, 0.06316172, -2.156108, 1, 1, 1, 1, 1,
-0.05859791, -1.152915, -2.501826, 1, 1, 1, 1, 1,
-0.0564084, -0.8823404, -4.487493, 1, 1, 1, 1, 1,
-0.05331162, -1.015921, -2.75218, 0, 0, 1, 1, 1,
-0.05014465, -0.5887073, -2.45748, 1, 0, 0, 1, 1,
-0.04992654, 0.3891052, 0.4368677, 1, 0, 0, 1, 1,
-0.04753712, 0.1323622, -0.702472, 1, 0, 0, 1, 1,
-0.04658042, -0.1083642, -1.838645, 1, 0, 0, 1, 1,
-0.04593115, 1.040994, -1.05191, 1, 0, 0, 1, 1,
-0.04556416, -0.01178348, -1.362439, 0, 0, 0, 1, 1,
-0.04194704, 0.9917859, -0.7565247, 0, 0, 0, 1, 1,
-0.04161501, -0.5930291, -1.086437, 0, 0, 0, 1, 1,
-0.03730252, -0.8130671, -3.895882, 0, 0, 0, 1, 1,
-0.03719424, -1.532539, -2.118064, 0, 0, 0, 1, 1,
-0.03475666, -0.06517709, -2.250029, 0, 0, 0, 1, 1,
-0.03292601, 1.836267, 0.05561427, 0, 0, 0, 1, 1,
-0.03056144, -1.057701, -3.630147, 1, 1, 1, 1, 1,
-0.03048794, 0.1389765, 0.9982395, 1, 1, 1, 1, 1,
-0.0293715, 1.798104, -1.47993, 1, 1, 1, 1, 1,
-0.02560094, 0.6882663, 0.8055956, 1, 1, 1, 1, 1,
-0.02484158, -0.2671813, -3.381658, 1, 1, 1, 1, 1,
-0.02064467, -0.5421823, -2.743688, 1, 1, 1, 1, 1,
-0.0113728, -0.4663014, -2.937882, 1, 1, 1, 1, 1,
-0.01131658, 0.113012, -0.2527831, 1, 1, 1, 1, 1,
-0.0107546, 0.1828286, 0.6570382, 1, 1, 1, 1, 1,
-0.007587694, 2.131282, -0.7986853, 1, 1, 1, 1, 1,
-0.006269538, 1.068499, -0.4163065, 1, 1, 1, 1, 1,
-0.00560782, 1.532224, -0.5432048, 1, 1, 1, 1, 1,
-0.004498184, 0.5219683, -0.7905346, 1, 1, 1, 1, 1,
0.0001137792, 0.02448504, -1.091328, 1, 1, 1, 1, 1,
0.008848648, 0.8183097, 0.2584639, 1, 1, 1, 1, 1,
0.01277628, 0.3975048, -0.8505014, 0, 0, 1, 1, 1,
0.01501507, -0.4813256, 3.051689, 1, 0, 0, 1, 1,
0.02039326, 0.3337673, 0.2789416, 1, 0, 0, 1, 1,
0.02142514, -1.736375, 5.41772, 1, 0, 0, 1, 1,
0.0241784, -0.2737983, 2.849238, 1, 0, 0, 1, 1,
0.02642801, -0.0291045, 1.631911, 1, 0, 0, 1, 1,
0.02686612, -0.1460599, 1.574444, 0, 0, 0, 1, 1,
0.02687801, -1.567592, 2.768378, 0, 0, 0, 1, 1,
0.02894014, -1.253768, 1.806054, 0, 0, 0, 1, 1,
0.03262803, 1.263113, -0.6538932, 0, 0, 0, 1, 1,
0.03349785, 0.8915529, 1.155627, 0, 0, 0, 1, 1,
0.03440648, -1.396699, 4.160374, 0, 0, 0, 1, 1,
0.03444134, -1.086509, 2.910733, 0, 0, 0, 1, 1,
0.03756968, -0.5089703, 2.973368, 1, 1, 1, 1, 1,
0.05026547, 0.0178241, 0.9492984, 1, 1, 1, 1, 1,
0.05199587, -1.90037, 4.030585, 1, 1, 1, 1, 1,
0.05323689, -0.3235814, 3.89049, 1, 1, 1, 1, 1,
0.05360742, 0.4147823, 0.7781824, 1, 1, 1, 1, 1,
0.05521596, 0.2924059, -0.4536938, 1, 1, 1, 1, 1,
0.05793935, -0.9995955, 4.242268, 1, 1, 1, 1, 1,
0.05860534, -2.507819, 2.419436, 1, 1, 1, 1, 1,
0.05994797, -0.8134826, 2.320218, 1, 1, 1, 1, 1,
0.06206972, 0.2878776, 1.662075, 1, 1, 1, 1, 1,
0.06585737, -2.435102, 2.917947, 1, 1, 1, 1, 1,
0.06607467, 1.206606, 1.539133, 1, 1, 1, 1, 1,
0.06937981, 0.7259056, -0.333445, 1, 1, 1, 1, 1,
0.06991658, -0.992624, 1.400014, 1, 1, 1, 1, 1,
0.07440019, 0.3840239, -0.8036271, 1, 1, 1, 1, 1,
0.08042565, 0.1135667, 0.9954695, 0, 0, 1, 1, 1,
0.08094247, -1.253425, 3.002489, 1, 0, 0, 1, 1,
0.0815361, -0.8420749, 4.394943, 1, 0, 0, 1, 1,
0.08717512, 1.740804, -1.449302, 1, 0, 0, 1, 1,
0.09671645, 1.138469, -0.4968726, 1, 0, 0, 1, 1,
0.09796629, -2.031693, 3.797225, 1, 0, 0, 1, 1,
0.10015, 1.121372, -1.617502, 0, 0, 0, 1, 1,
0.1013662, -0.9012412, 3.643325, 0, 0, 0, 1, 1,
0.1020272, 1.461201, -0.46632, 0, 0, 0, 1, 1,
0.1040257, -0.8370561, 2.294587, 0, 0, 0, 1, 1,
0.1052153, 0.2838186, -0.383929, 0, 0, 0, 1, 1,
0.1073213, -0.8640209, 2.903883, 0, 0, 0, 1, 1,
0.1087347, 2.581017, 0.9257396, 0, 0, 0, 1, 1,
0.1089778, 0.4057225, 1.76693, 1, 1, 1, 1, 1,
0.111144, 0.7494528, -0.04887743, 1, 1, 1, 1, 1,
0.1137353, -1.158354, 3.299497, 1, 1, 1, 1, 1,
0.1163039, 0.8494988, -0.6058769, 1, 1, 1, 1, 1,
0.1164936, -0.6897735, 3.624504, 1, 1, 1, 1, 1,
0.117878, -0.2824749, 2.312829, 1, 1, 1, 1, 1,
0.119239, 0.2862363, 0.7325897, 1, 1, 1, 1, 1,
0.1215483, 0.3705114, -1.341532, 1, 1, 1, 1, 1,
0.1222988, 1.914219, -0.1712065, 1, 1, 1, 1, 1,
0.1310908, 1.399949, 0.6837937, 1, 1, 1, 1, 1,
0.1337209, 0.1713174, 1.607103, 1, 1, 1, 1, 1,
0.1385145, 0.688996, -0.2540556, 1, 1, 1, 1, 1,
0.1401971, 0.09582695, 0.4218082, 1, 1, 1, 1, 1,
0.1459975, -0.2549765, 2.250968, 1, 1, 1, 1, 1,
0.150145, -0.5742894, 2.990185, 1, 1, 1, 1, 1,
0.1503398, -2.461258, 2.964021, 0, 0, 1, 1, 1,
0.1512486, -0.5966931, 4.214927, 1, 0, 0, 1, 1,
0.1545637, 0.670009, 0.6712657, 1, 0, 0, 1, 1,
0.1560272, 0.2534188, 0.5126303, 1, 0, 0, 1, 1,
0.1560549, 1.753892, 0.4407794, 1, 0, 0, 1, 1,
0.1582349, 1.519327, 0.2570066, 1, 0, 0, 1, 1,
0.1607234, -1.937953, 2.402854, 0, 0, 0, 1, 1,
0.1627817, 1.305792, -0.1972798, 0, 0, 0, 1, 1,
0.1631801, -0.02713313, 0.6215793, 0, 0, 0, 1, 1,
0.1663301, 0.5091431, -1.313867, 0, 0, 0, 1, 1,
0.172068, -1.297459, 3.301345, 0, 0, 0, 1, 1,
0.1766926, -2.222338, 3.077816, 0, 0, 0, 1, 1,
0.1798749, 0.2862887, -0.4896504, 0, 0, 0, 1, 1,
0.1802351, -0.3855027, 1.528849, 1, 1, 1, 1, 1,
0.1819631, 0.9115528, 0.81323, 1, 1, 1, 1, 1,
0.1878166, -1.624205, 1.390723, 1, 1, 1, 1, 1,
0.1909094, 0.194788, -0.2959675, 1, 1, 1, 1, 1,
0.1919248, 0.4314575, -0.5754725, 1, 1, 1, 1, 1,
0.1919455, 0.6743855, -0.8395464, 1, 1, 1, 1, 1,
0.1939172, 0.2208278, 0.255623, 1, 1, 1, 1, 1,
0.1956289, -0.692046, 2.256016, 1, 1, 1, 1, 1,
0.2017564, 1.669368, 0.6091169, 1, 1, 1, 1, 1,
0.2044147, -0.871039, 1.872655, 1, 1, 1, 1, 1,
0.2073392, 0.9077118, 1.212394, 1, 1, 1, 1, 1,
0.2102159, -0.6725736, 3.697238, 1, 1, 1, 1, 1,
0.2111357, -2.406735, 1.536703, 1, 1, 1, 1, 1,
0.2115913, -1.824124, 1.755859, 1, 1, 1, 1, 1,
0.2206971, -1.826397, 2.9347, 1, 1, 1, 1, 1,
0.2227818, -0.09919517, 2.186943, 0, 0, 1, 1, 1,
0.2229294, 0.771386, -0.1549648, 1, 0, 0, 1, 1,
0.2242229, -0.3653731, 3.071322, 1, 0, 0, 1, 1,
0.226777, 2.134764, 0.2001965, 1, 0, 0, 1, 1,
0.2298996, 0.2563013, 1.776549, 1, 0, 0, 1, 1,
0.2334003, 0.6751522, 1.81217, 1, 0, 0, 1, 1,
0.2417977, 1.769027, 1.567122, 0, 0, 0, 1, 1,
0.2442818, 0.1576165, -0.02980161, 0, 0, 0, 1, 1,
0.2454715, 0.694136, 0.6532025, 0, 0, 0, 1, 1,
0.251543, 1.176973, 0.002513731, 0, 0, 0, 1, 1,
0.2546252, 0.6687101, 0.2544227, 0, 0, 0, 1, 1,
0.2588911, -1.240243, 4.122755, 0, 0, 0, 1, 1,
0.2621467, -1.211573, 4.094896, 0, 0, 0, 1, 1,
0.264259, -1.353927, 3.255464, 1, 1, 1, 1, 1,
0.2683567, 0.1921803, 1.56235, 1, 1, 1, 1, 1,
0.2710191, 1.270249, -1.429529, 1, 1, 1, 1, 1,
0.2747371, 1.674531, -1.415272, 1, 1, 1, 1, 1,
0.2816136, -0.5806494, 2.254853, 1, 1, 1, 1, 1,
0.2853231, 1.500654, -0.1017753, 1, 1, 1, 1, 1,
0.2861489, 0.5963667, -0.3123806, 1, 1, 1, 1, 1,
0.2862246, -1.922693, 3.320164, 1, 1, 1, 1, 1,
0.2879151, 0.9536534, 1.320861, 1, 1, 1, 1, 1,
0.2902069, -1.566428, 1.872796, 1, 1, 1, 1, 1,
0.2922275, 1.446044, 1.548938, 1, 1, 1, 1, 1,
0.2931131, -0.358422, 2.303756, 1, 1, 1, 1, 1,
0.2941058, -1.162957, 1.259586, 1, 1, 1, 1, 1,
0.2944819, -2.144595, 3.190355, 1, 1, 1, 1, 1,
0.2945499, -1.434561, 2.817087, 1, 1, 1, 1, 1,
0.2951519, -0.6213167, 3.254978, 0, 0, 1, 1, 1,
0.2952091, -1.613332, 3.610605, 1, 0, 0, 1, 1,
0.2989989, -0.06903779, 4.313123, 1, 0, 0, 1, 1,
0.3108859, 1.443892, 1.466648, 1, 0, 0, 1, 1,
0.3116148, -2.207954, 4.15407, 1, 0, 0, 1, 1,
0.3159029, 1.70504, 1.544802, 1, 0, 0, 1, 1,
0.3188294, -0.2369983, 3.275322, 0, 0, 0, 1, 1,
0.3224538, -1.720627, 4.012723, 0, 0, 0, 1, 1,
0.3247464, -0.06555351, 2.75271, 0, 0, 0, 1, 1,
0.328909, 0.1650363, 1.884024, 0, 0, 0, 1, 1,
0.3306594, -2.122444, 3.223559, 0, 0, 0, 1, 1,
0.3353208, -0.927442, 2.865207, 0, 0, 0, 1, 1,
0.3368108, -0.1654009, 1.095598, 0, 0, 0, 1, 1,
0.3385573, -0.358203, 3.571483, 1, 1, 1, 1, 1,
0.3427187, 0.0416344, 0.6386206, 1, 1, 1, 1, 1,
0.3440785, -0.7643102, 3.712607, 1, 1, 1, 1, 1,
0.3516866, -0.7920175, 3.789865, 1, 1, 1, 1, 1,
0.3543498, -0.3267328, 3.544552, 1, 1, 1, 1, 1,
0.3586266, 0.0152245, 1.415136, 1, 1, 1, 1, 1,
0.3592685, -0.4143932, 0.4716073, 1, 1, 1, 1, 1,
0.3635882, 0.5087146, 0.5322427, 1, 1, 1, 1, 1,
0.3683488, -0.8128412, 3.409391, 1, 1, 1, 1, 1,
0.3712566, 1.633069, -0.8456762, 1, 1, 1, 1, 1,
0.3772044, 1.510966, 0.2911954, 1, 1, 1, 1, 1,
0.3851406, 0.0007311854, 1.572373, 1, 1, 1, 1, 1,
0.3877009, -0.4766526, 2.078436, 1, 1, 1, 1, 1,
0.3881294, -0.9233131, 1.921295, 1, 1, 1, 1, 1,
0.3974532, 1.19271, -0.8042889, 1, 1, 1, 1, 1,
0.4003255, -0.8320469, 3.267933, 0, 0, 1, 1, 1,
0.4025353, 1.731939, -0.2722755, 1, 0, 0, 1, 1,
0.4028082, 0.6072944, -0.1309918, 1, 0, 0, 1, 1,
0.4055351, 1.634516, -0.3329543, 1, 0, 0, 1, 1,
0.4076809, 1.889376, 0.5578551, 1, 0, 0, 1, 1,
0.4081827, 0.2622752, -0.4414916, 1, 0, 0, 1, 1,
0.4094933, -0.4944478, 1.954999, 0, 0, 0, 1, 1,
0.4111582, 0.319239, 1.525888, 0, 0, 0, 1, 1,
0.411248, 1.414841, -1.614125, 0, 0, 0, 1, 1,
0.4119301, -0.5706393, 2.214658, 0, 0, 0, 1, 1,
0.41225, -0.2570346, 1.950188, 0, 0, 0, 1, 1,
0.4154226, -1.173302, 3.197349, 0, 0, 0, 1, 1,
0.4209116, 1.616374, -0.173397, 0, 0, 0, 1, 1,
0.4289885, -0.1320333, 3.379658, 1, 1, 1, 1, 1,
0.4363778, -1.720574, 3.526667, 1, 1, 1, 1, 1,
0.438094, 0.3181877, 3.007911, 1, 1, 1, 1, 1,
0.4395472, -0.6197768, 1.435687, 1, 1, 1, 1, 1,
0.4414056, 0.08078943, 3.212858, 1, 1, 1, 1, 1,
0.4426053, -0.4795173, 1.632801, 1, 1, 1, 1, 1,
0.4435824, 0.4163989, -0.02401609, 1, 1, 1, 1, 1,
0.4464127, 0.1804722, 1.267592, 1, 1, 1, 1, 1,
0.4494745, 0.7990839, 0.283252, 1, 1, 1, 1, 1,
0.4509121, 2.052877, 1.935289, 1, 1, 1, 1, 1,
0.4519364, 1.098555, 1.028547, 1, 1, 1, 1, 1,
0.4558232, 1.236022, -0.08046483, 1, 1, 1, 1, 1,
0.4592475, -0.6143396, 3.178705, 1, 1, 1, 1, 1,
0.4674814, 1.538271, -0.7330065, 1, 1, 1, 1, 1,
0.4677338, -0.4249082, 2.839889, 1, 1, 1, 1, 1,
0.4717154, -1.781043, 3.399226, 0, 0, 1, 1, 1,
0.4720061, 0.5448022, 1.111065, 1, 0, 0, 1, 1,
0.4758855, -0.6313808, 1.948463, 1, 0, 0, 1, 1,
0.4779498, 0.6618086, -0.2083629, 1, 0, 0, 1, 1,
0.4798285, 1.682395, -0.2002659, 1, 0, 0, 1, 1,
0.4810264, -0.05882281, 1.230108, 1, 0, 0, 1, 1,
0.4811077, 0.7895424, 0.6326174, 0, 0, 0, 1, 1,
0.4820553, 0.3395002, 1.716491, 0, 0, 0, 1, 1,
0.485, 0.7059289, 0.04108794, 0, 0, 0, 1, 1,
0.4866471, 0.1217973, 0.905023, 0, 0, 0, 1, 1,
0.486969, -0.849168, 3.471739, 0, 0, 0, 1, 1,
0.4899933, -1.137344, 2.193245, 0, 0, 0, 1, 1,
0.4908933, -0.443586, 1.282095, 0, 0, 0, 1, 1,
0.4962169, 0.5138928, -0.6063621, 1, 1, 1, 1, 1,
0.5085528, -1.539374, 2.373734, 1, 1, 1, 1, 1,
0.508553, -0.2859884, 2.006411, 1, 1, 1, 1, 1,
0.5100149, 0.1537825, 1.99776, 1, 1, 1, 1, 1,
0.5105709, -0.331453, 2.995388, 1, 1, 1, 1, 1,
0.5116889, -0.9564416, 3.802951, 1, 1, 1, 1, 1,
0.5123687, -2.538562, 2.168673, 1, 1, 1, 1, 1,
0.5142131, 0.9950803, 1.189591, 1, 1, 1, 1, 1,
0.5154218, 2.678693, 1.052838, 1, 1, 1, 1, 1,
0.5215219, -0.483903, 2.256814, 1, 1, 1, 1, 1,
0.5272642, -1.005206, 3.318379, 1, 1, 1, 1, 1,
0.5285906, 2.832582, -0.5459064, 1, 1, 1, 1, 1,
0.529889, 0.7983447, 0.9147481, 1, 1, 1, 1, 1,
0.5358928, -0.9771264, 2.101411, 1, 1, 1, 1, 1,
0.5383499, 0.9872068, 1.09795, 1, 1, 1, 1, 1,
0.5423037, 0.3117223, 2.28652, 0, 0, 1, 1, 1,
0.542427, -1.402653, 3.302439, 1, 0, 0, 1, 1,
0.542821, 1.297072, 1.257905, 1, 0, 0, 1, 1,
0.5439432, 0.4969522, 1.332449, 1, 0, 0, 1, 1,
0.5443388, -0.2516392, 2.361958, 1, 0, 0, 1, 1,
0.5446772, 0.09601781, 0.8485045, 1, 0, 0, 1, 1,
0.5547162, -0.8757964, 2.909941, 0, 0, 0, 1, 1,
0.5547812, 1.927208, -0.2025656, 0, 0, 0, 1, 1,
0.5614751, 0.2157945, 0.2558029, 0, 0, 0, 1, 1,
0.5659191, 0.9309157, 0.7012275, 0, 0, 0, 1, 1,
0.5687243, -0.01723372, 1.032082, 0, 0, 0, 1, 1,
0.5770593, 0.2989476, 0.6904057, 0, 0, 0, 1, 1,
0.5809097, 0.3944946, 2.760344, 0, 0, 0, 1, 1,
0.5819438, -1.847842, 3.778451, 1, 1, 1, 1, 1,
0.5828288, 0.591951, 1.029722, 1, 1, 1, 1, 1,
0.5836305, 1.490382, -0.01866686, 1, 1, 1, 1, 1,
0.586285, -0.7372549, 3.458212, 1, 1, 1, 1, 1,
0.5869672, 2.133427, 0.7184469, 1, 1, 1, 1, 1,
0.5890509, 0.1248646, 1.98801, 1, 1, 1, 1, 1,
0.5891536, -0.3138403, 2.238765, 1, 1, 1, 1, 1,
0.59457, 0.0576291, 3.3367, 1, 1, 1, 1, 1,
0.5977471, 0.003737954, 0.5482532, 1, 1, 1, 1, 1,
0.599264, 1.035415, -0.7660134, 1, 1, 1, 1, 1,
0.5995832, -0.6044504, 3.434565, 1, 1, 1, 1, 1,
0.5997354, -0.5292093, 2.123224, 1, 1, 1, 1, 1,
0.610385, 0.1268885, 0.2175687, 1, 1, 1, 1, 1,
0.6113842, -1.773355, 2.297086, 1, 1, 1, 1, 1,
0.612876, 0.4034359, -0.1193491, 1, 1, 1, 1, 1,
0.6151813, -0.8205675, 1.978453, 0, 0, 1, 1, 1,
0.6172298, -0.1637501, 0.2611709, 1, 0, 0, 1, 1,
0.6222568, -0.9791443, 3.839581, 1, 0, 0, 1, 1,
0.6249741, 1.266849, 0.7100027, 1, 0, 0, 1, 1,
0.6253053, -0.92873, 3.10052, 1, 0, 0, 1, 1,
0.63278, -0.5490825, 3.06844, 1, 0, 0, 1, 1,
0.6358832, -0.1848007, 1.621697, 0, 0, 0, 1, 1,
0.636806, 1.735399, 1.399075, 0, 0, 0, 1, 1,
0.6371057, -0.2858728, 1.529875, 0, 0, 0, 1, 1,
0.6391916, -0.385321, 0.5130315, 0, 0, 0, 1, 1,
0.6456596, 0.03743903, 1.559155, 0, 0, 0, 1, 1,
0.6505218, 0.7069506, -1.137503, 0, 0, 0, 1, 1,
0.651426, 1.121398, 1.211754, 0, 0, 0, 1, 1,
0.6559101, -0.5180124, 2.070084, 1, 1, 1, 1, 1,
0.6566609, -0.9996076, 1.971682, 1, 1, 1, 1, 1,
0.6590616, 0.4318586, 0.7791199, 1, 1, 1, 1, 1,
0.6599456, -0.3801807, 1.104897, 1, 1, 1, 1, 1,
0.6652346, -1.632591, 1.467173, 1, 1, 1, 1, 1,
0.6699072, -0.209613, 1.828179, 1, 1, 1, 1, 1,
0.6721258, 2.894116, -0.4672997, 1, 1, 1, 1, 1,
0.6743735, 0.8648212, 1.138913, 1, 1, 1, 1, 1,
0.6760595, -0.0265286, -0.05744938, 1, 1, 1, 1, 1,
0.6774092, 1.078798, 0.3881466, 1, 1, 1, 1, 1,
0.6816452, -0.1212536, -0.6299527, 1, 1, 1, 1, 1,
0.6829268, 1.208041, 0.6794653, 1, 1, 1, 1, 1,
0.6837627, -1.078615, 2.921536, 1, 1, 1, 1, 1,
0.684202, 0.05656008, 2.140084, 1, 1, 1, 1, 1,
0.687203, 0.3467031, 0.3504629, 1, 1, 1, 1, 1,
0.6899902, -0.6817626, 2.891865, 0, 0, 1, 1, 1,
0.6927779, 0.7781923, 1.816703, 1, 0, 0, 1, 1,
0.6939905, 0.7403975, -0.1627542, 1, 0, 0, 1, 1,
0.6944872, -1.42622, 2.865888, 1, 0, 0, 1, 1,
0.69663, -1.183512, 0.987947, 1, 0, 0, 1, 1,
0.7077783, -1.575552, 3.216202, 1, 0, 0, 1, 1,
0.7159616, -0.4732479, 2.205965, 0, 0, 0, 1, 1,
0.7166093, 0.6087815, 0.7468711, 0, 0, 0, 1, 1,
0.7191475, -0.8299545, 3.957031, 0, 0, 0, 1, 1,
0.7232257, 0.8402311, 0.1470596, 0, 0, 0, 1, 1,
0.7262968, 0.5518484, -0.2048329, 0, 0, 0, 1, 1,
0.7263535, -0.09130296, 3.897391, 0, 0, 0, 1, 1,
0.7275618, 0.3167673, 2.898056, 0, 0, 0, 1, 1,
0.7303426, 0.3390602, -1.00255, 1, 1, 1, 1, 1,
0.7332249, -0.3780072, 2.427507, 1, 1, 1, 1, 1,
0.7359419, 0.9842932, 0.9234157, 1, 1, 1, 1, 1,
0.736834, 1.12894, -0.05014526, 1, 1, 1, 1, 1,
0.7449813, -0.4879071, 1.781356, 1, 1, 1, 1, 1,
0.745363, -2.131186, 2.47649, 1, 1, 1, 1, 1,
0.7479954, 0.918909, 0.9802034, 1, 1, 1, 1, 1,
0.7493104, -0.298942, 1.701176, 1, 1, 1, 1, 1,
0.7495246, -0.2958678, 1.273595, 1, 1, 1, 1, 1,
0.7533541, -0.4261867, 3.886946, 1, 1, 1, 1, 1,
0.7555403, 0.2157935, 1.349329, 1, 1, 1, 1, 1,
0.7571172, -1.304762, 3.322143, 1, 1, 1, 1, 1,
0.7575376, 1.493111, -1.442606, 1, 1, 1, 1, 1,
0.7719802, -0.1748465, 1.766484, 1, 1, 1, 1, 1,
0.7744334, -1.601926, 2.87549, 1, 1, 1, 1, 1,
0.7762694, 1.187474, 0.7375708, 0, 0, 1, 1, 1,
0.7804866, -0.6435763, 2.883737, 1, 0, 0, 1, 1,
0.7809532, 2.365776, -1.112142, 1, 0, 0, 1, 1,
0.7824711, -1.133698, 3.632529, 1, 0, 0, 1, 1,
0.7873121, -1.91346, 3.352882, 1, 0, 0, 1, 1,
0.7882675, -0.1132819, 2.208769, 1, 0, 0, 1, 1,
0.7889925, -0.7774243, 2.656752, 0, 0, 0, 1, 1,
0.7895086, -0.4066745, 2.69023, 0, 0, 0, 1, 1,
0.789952, 0.6248831, 0.7240293, 0, 0, 0, 1, 1,
0.8001284, 1.548957, -0.2484757, 0, 0, 0, 1, 1,
0.8046879, -0.02965636, 0.2446674, 0, 0, 0, 1, 1,
0.8060619, -0.4005319, 2.180666, 0, 0, 0, 1, 1,
0.8104504, -0.1021741, 1.683189, 0, 0, 0, 1, 1,
0.8167289, -1.140182, 3.288216, 1, 1, 1, 1, 1,
0.8169948, 0.5682849, 1.369097, 1, 1, 1, 1, 1,
0.8296833, -1.13873, 3.094672, 1, 1, 1, 1, 1,
0.8342181, -0.2635414, 1.491555, 1, 1, 1, 1, 1,
0.8419229, -0.2835317, 0.6912057, 1, 1, 1, 1, 1,
0.8457166, -0.2026172, 1.799336, 1, 1, 1, 1, 1,
0.8466108, -1.769207, 1.877047, 1, 1, 1, 1, 1,
0.8540979, 1.134238, 1.205531, 1, 1, 1, 1, 1,
0.8565993, -1.93135, 2.349537, 1, 1, 1, 1, 1,
0.8635622, 0.786383, 0.3395341, 1, 1, 1, 1, 1,
0.8647347, 1.531913, 1.811106, 1, 1, 1, 1, 1,
0.8674167, -0.4754338, 3.388665, 1, 1, 1, 1, 1,
0.8676545, 0.5554729, 1.390873, 1, 1, 1, 1, 1,
0.8820121, -0.7065972, 2.734442, 1, 1, 1, 1, 1,
0.883159, -0.7075741, 2.033593, 1, 1, 1, 1, 1,
0.8835558, -1.16475, 3.648997, 0, 0, 1, 1, 1,
0.8870063, -1.125925, 3.18376, 1, 0, 0, 1, 1,
0.8961452, -0.4153848, 3.595408, 1, 0, 0, 1, 1,
0.9001039, 0.1178373, 2.186134, 1, 0, 0, 1, 1,
0.9031718, 1.772019, 0.6129479, 1, 0, 0, 1, 1,
0.9051567, -1.227535, 3.037381, 1, 0, 0, 1, 1,
0.9062999, 1.814969, 1.235542, 0, 0, 0, 1, 1,
0.9102658, -0.5615404, 1.508854, 0, 0, 0, 1, 1,
0.9148096, -0.3010148, 1.561707, 0, 0, 0, 1, 1,
0.9210707, 0.01505938, -0.6115072, 0, 0, 0, 1, 1,
0.9243241, 1.340619, 1.137285, 0, 0, 0, 1, 1,
0.9248429, -0.1746997, 1.115727, 0, 0, 0, 1, 1,
0.9259145, 0.1104964, 1.859874, 0, 0, 0, 1, 1,
0.9279462, 1.865185, 0.4607097, 1, 1, 1, 1, 1,
0.9330055, 0.1740282, 3.135815, 1, 1, 1, 1, 1,
0.943476, 0.4110752, 1.057374, 1, 1, 1, 1, 1,
0.9480879, 0.006717183, 2.356563, 1, 1, 1, 1, 1,
0.9518538, 0.13096, 1.523692, 1, 1, 1, 1, 1,
0.9521935, -0.4797392, 1.308763, 1, 1, 1, 1, 1,
0.9553091, 1.065576, -0.3983177, 1, 1, 1, 1, 1,
0.9680201, 1.117625, 0.06138213, 1, 1, 1, 1, 1,
0.9743878, -1.219828, 2.119536, 1, 1, 1, 1, 1,
0.9744954, 0.4010204, 2.249367, 1, 1, 1, 1, 1,
0.9796979, 0.9023653, 0.8654077, 1, 1, 1, 1, 1,
0.9809464, 0.1794179, 2.086555, 1, 1, 1, 1, 1,
0.9830777, 1.159595, 0.557829, 1, 1, 1, 1, 1,
1.010339, -1.1689, 2.067109, 1, 1, 1, 1, 1,
1.016866, 0.1601813, 3.3562, 1, 1, 1, 1, 1,
1.018228, -1.115275, 2.997224, 0, 0, 1, 1, 1,
1.026152, 1.754775, 0.5522115, 1, 0, 0, 1, 1,
1.02686, 0.07696205, 0.4368644, 1, 0, 0, 1, 1,
1.034036, -0.7456412, 1.41353, 1, 0, 0, 1, 1,
1.03556, 0.1092787, 1.889651, 1, 0, 0, 1, 1,
1.040634, -0.3754301, 3.569267, 1, 0, 0, 1, 1,
1.042795, 0.0309264, 1.589441, 0, 0, 0, 1, 1,
1.0598, -0.3825062, 2.456578, 0, 0, 0, 1, 1,
1.076028, -0.3162225, 2.420143, 0, 0, 0, 1, 1,
1.084106, 1.233189, 0.005080767, 0, 0, 0, 1, 1,
1.107098, 0.03708228, 1.92739, 0, 0, 0, 1, 1,
1.109544, 0.1283305, 2.824337, 0, 0, 0, 1, 1,
1.112726, -0.8728808, 2.63767, 0, 0, 0, 1, 1,
1.113584, -0.4228248, 1.117201, 1, 1, 1, 1, 1,
1.113777, 0.626772, -0.5807405, 1, 1, 1, 1, 1,
1.11455, 0.9221115, -1.200901, 1, 1, 1, 1, 1,
1.117389, 1.117844, 1.380061, 1, 1, 1, 1, 1,
1.118118, -0.7771264, 2.805498, 1, 1, 1, 1, 1,
1.120187, -1.159484, 1.016429, 1, 1, 1, 1, 1,
1.128346, -1.268477, 4.132956, 1, 1, 1, 1, 1,
1.132407, 0.004267046, 0.02525085, 1, 1, 1, 1, 1,
1.135669, -0.5283502, 1.614757, 1, 1, 1, 1, 1,
1.137674, 0.2452307, 0.2397787, 1, 1, 1, 1, 1,
1.141331, 0.9155884, 2.301189, 1, 1, 1, 1, 1,
1.143209, 0.278751, 1.950062, 1, 1, 1, 1, 1,
1.145643, -0.844421, 1.103632, 1, 1, 1, 1, 1,
1.14569, 0.3752474, 0.7821969, 1, 1, 1, 1, 1,
1.147737, 0.9174034, 1.777738, 1, 1, 1, 1, 1,
1.148979, -0.6699159, 2.960194, 0, 0, 1, 1, 1,
1.152667, 0.5036747, 0.6795359, 1, 0, 0, 1, 1,
1.15847, 0.706687, 1.031156, 1, 0, 0, 1, 1,
1.159967, -0.8134465, 1.669619, 1, 0, 0, 1, 1,
1.162688, -1.490226, 2.947684, 1, 0, 0, 1, 1,
1.169415, -0.1648041, 1.671853, 1, 0, 0, 1, 1,
1.175946, 0.1448628, 2.061329, 0, 0, 0, 1, 1,
1.185932, 0.720967, 1.327194, 0, 0, 0, 1, 1,
1.186116, -0.7866142, 0.9893196, 0, 0, 0, 1, 1,
1.187565, 1.614148, 1.408496, 0, 0, 0, 1, 1,
1.203765, 1.658543, -0.5810782, 0, 0, 0, 1, 1,
1.20635, -0.933467, 0.9213783, 0, 0, 0, 1, 1,
1.211685, -1.638311, 3.375827, 0, 0, 0, 1, 1,
1.21397, 0.623185, 1.733809, 1, 1, 1, 1, 1,
1.214157, 0.801123, -0.03266934, 1, 1, 1, 1, 1,
1.215562, 0.9738687, 1.892541, 1, 1, 1, 1, 1,
1.217675, -0.1386637, 1.775299, 1, 1, 1, 1, 1,
1.224048, 1.193468, 2.046194, 1, 1, 1, 1, 1,
1.226527, 0.3587694, 1.293789, 1, 1, 1, 1, 1,
1.228045, 0.4508616, 2.981752, 1, 1, 1, 1, 1,
1.233419, -0.5713385, 1.764209, 1, 1, 1, 1, 1,
1.233564, 0.1212321, 1.372953, 1, 1, 1, 1, 1,
1.23771, 0.7097985, 1.522465, 1, 1, 1, 1, 1,
1.238467, -0.1256588, 2.544223, 1, 1, 1, 1, 1,
1.243792, -0.7694635, 2.590649, 1, 1, 1, 1, 1,
1.24381, 0.002188099, 2.758205, 1, 1, 1, 1, 1,
1.248326, -2.168376, 2.084613, 1, 1, 1, 1, 1,
1.256357, -1.796733, 3.49642, 1, 1, 1, 1, 1,
1.260392, 1.093828, 0.3129639, 0, 0, 1, 1, 1,
1.262718, -0.3285311, 1.665385, 1, 0, 0, 1, 1,
1.283327, 1.723071, -2.193919, 1, 0, 0, 1, 1,
1.283778, -1.132256, 2.595546, 1, 0, 0, 1, 1,
1.284943, 0.1712475, 0.4267751, 1, 0, 0, 1, 1,
1.288891, 1.998743, 0.7258577, 1, 0, 0, 1, 1,
1.298228, 0.5994645, 1.129553, 0, 0, 0, 1, 1,
1.303569, 0.2672205, -0.8424634, 0, 0, 0, 1, 1,
1.306032, -0.3507909, 1.792526, 0, 0, 0, 1, 1,
1.31664, 1.905038, 0.003074818, 0, 0, 0, 1, 1,
1.328486, 0.4509259, 3.233628, 0, 0, 0, 1, 1,
1.328571, 0.404201, 1.970247, 0, 0, 0, 1, 1,
1.331944, -0.302911, 1.564034, 0, 0, 0, 1, 1,
1.332024, -0.4447341, 3.170643, 1, 1, 1, 1, 1,
1.342213, 1.131964, 0.8273057, 1, 1, 1, 1, 1,
1.348334, -1.593633, 2.514599, 1, 1, 1, 1, 1,
1.364419, -0.3534052, 1.094177, 1, 1, 1, 1, 1,
1.366047, -0.09232721, -0.1343499, 1, 1, 1, 1, 1,
1.367908, -1.796669, 0.3871659, 1, 1, 1, 1, 1,
1.382523, -0.2809818, 0.2460864, 1, 1, 1, 1, 1,
1.385226, 0.07622112, 2.051302, 1, 1, 1, 1, 1,
1.386491, -0.1163617, -0.649027, 1, 1, 1, 1, 1,
1.388732, -0.7370782, 2.351469, 1, 1, 1, 1, 1,
1.395643, -0.01994813, 0.64918, 1, 1, 1, 1, 1,
1.40791, 0.2140731, -0.1138987, 1, 1, 1, 1, 1,
1.413534, 0.3774082, 0.385424, 1, 1, 1, 1, 1,
1.421919, 0.8886908, 1.377846, 1, 1, 1, 1, 1,
1.423766, -0.2654837, 0.7850822, 1, 1, 1, 1, 1,
1.424175, 1.636773, -0.7595772, 0, 0, 1, 1, 1,
1.432501, -0.08005121, 2.117083, 1, 0, 0, 1, 1,
1.437286, -1.183409, 1.594549, 1, 0, 0, 1, 1,
1.438256, -1.212327, 2.843596, 1, 0, 0, 1, 1,
1.438351, -0.6093654, 1.975421, 1, 0, 0, 1, 1,
1.438458, 1.28105, 0.9436458, 1, 0, 0, 1, 1,
1.442277, -1.804134, 3.501117, 0, 0, 0, 1, 1,
1.44813, 1.578737, 0.3531327, 0, 0, 0, 1, 1,
1.450196, 0.1086056, 1.728553, 0, 0, 0, 1, 1,
1.455465, 0.5588909, 1.374395, 0, 0, 0, 1, 1,
1.462591, 0.6142001, 1.952954, 0, 0, 0, 1, 1,
1.462838, -1.122888, 2.228099, 0, 0, 0, 1, 1,
1.463039, -0.3312184, 2.311459, 0, 0, 0, 1, 1,
1.465277, 1.112814, 0.1449866, 1, 1, 1, 1, 1,
1.466231, -0.05576818, 1.363277, 1, 1, 1, 1, 1,
1.468386, 0.3652814, 0.5443355, 1, 1, 1, 1, 1,
1.468984, -0.3494265, 1.798288, 1, 1, 1, 1, 1,
1.497073, -1.359071, 1.827079, 1, 1, 1, 1, 1,
1.527245, 0.2252367, 2.95277, 1, 1, 1, 1, 1,
1.545833, 1.647998, 1.783678, 1, 1, 1, 1, 1,
1.558821, -0.6677702, 3.132345, 1, 1, 1, 1, 1,
1.568995, 0.4796991, 1.846406, 1, 1, 1, 1, 1,
1.588261, -0.6499002, 3.811545, 1, 1, 1, 1, 1,
1.596348, 1.209388, 0.9503594, 1, 1, 1, 1, 1,
1.597211, -1.588662, 1.04959, 1, 1, 1, 1, 1,
1.603112, -0.8965569, 3.585315, 1, 1, 1, 1, 1,
1.605922, 1.90792, 1.247654, 1, 1, 1, 1, 1,
1.61766, -2.377377, 1.946319, 1, 1, 1, 1, 1,
1.623541, 1.427554, -1.06567, 0, 0, 1, 1, 1,
1.651475, 1.118199, -1.197701, 1, 0, 0, 1, 1,
1.652649, 0.5853646, 2.913933, 1, 0, 0, 1, 1,
1.6614, -0.2889579, -0.2823498, 1, 0, 0, 1, 1,
1.661749, 2.423053, 1.874865, 1, 0, 0, 1, 1,
1.683242, -0.2661636, 3.957628, 1, 0, 0, 1, 1,
1.692884, 0.2030791, 0.192, 0, 0, 0, 1, 1,
1.695287, 0.7446674, 1.701251, 0, 0, 0, 1, 1,
1.708858, -0.1193958, 0.5917807, 0, 0, 0, 1, 1,
1.725451, -0.4937884, 1.296854, 0, 0, 0, 1, 1,
1.733546, -0.1108263, 1.612103, 0, 0, 0, 1, 1,
1.748994, 0.1028484, 1.229672, 0, 0, 0, 1, 1,
1.757711, 0.1853895, 2.583474, 0, 0, 0, 1, 1,
1.767297, 0.3444647, 0.6450299, 1, 1, 1, 1, 1,
1.776338, -0.8972858, 1.21828, 1, 1, 1, 1, 1,
1.788113, -1.000965, 0.391391, 1, 1, 1, 1, 1,
1.810465, 1.446267, 0.3402672, 1, 1, 1, 1, 1,
1.818875, 0.2397351, 0.6924146, 1, 1, 1, 1, 1,
1.862324, -0.881605, 2.002598, 1, 1, 1, 1, 1,
1.866869, -0.2968552, 2.595745, 1, 1, 1, 1, 1,
1.873791, -1.032954, 2.038455, 1, 1, 1, 1, 1,
1.874471, -0.1784573, 0.942801, 1, 1, 1, 1, 1,
1.893924, 0.01940679, 1.389029, 1, 1, 1, 1, 1,
1.903548, 0.1734323, 0.5977546, 1, 1, 1, 1, 1,
1.908947, -0.6190079, 3.09721, 1, 1, 1, 1, 1,
1.913538, -1.189727, 1.897858, 1, 1, 1, 1, 1,
1.918762, 0.8440455, 0.6913936, 1, 1, 1, 1, 1,
1.923763, -0.2097566, 1.635918, 1, 1, 1, 1, 1,
1.928597, 1.529549, 0.6999951, 0, 0, 1, 1, 1,
1.94491, -1.273649, 2.122126, 1, 0, 0, 1, 1,
1.965986, 0.6123987, 0.9567779, 1, 0, 0, 1, 1,
1.99574, -0.6840744, 0.4823558, 1, 0, 0, 1, 1,
2.000695, 1.576474, 0.5724053, 1, 0, 0, 1, 1,
2.025673, 0.7111366, 0.236754, 1, 0, 0, 1, 1,
2.043494, -1.573288, 2.570511, 0, 0, 0, 1, 1,
2.17162, -0.6102902, 1.22649, 0, 0, 0, 1, 1,
2.253993, -0.8484179, 1.406681, 0, 0, 0, 1, 1,
2.339391, 0.7001027, -0.5100641, 0, 0, 0, 1, 1,
2.3568, 0.5176747, -0.4126305, 0, 0, 0, 1, 1,
2.452432, -1.391059, 0.6930355, 0, 0, 0, 1, 1,
2.469667, 0.5950078, 2.2749, 0, 0, 0, 1, 1,
2.474362, 0.918945, 1.329492, 1, 1, 1, 1, 1,
2.514012, 1.293008, 1.845013, 1, 1, 1, 1, 1,
2.602438, -0.1631429, -0.1402089, 1, 1, 1, 1, 1,
2.807065, 0.2873338, 1.693048, 1, 1, 1, 1, 1,
2.843205, 0.4096403, 1.038937, 1, 1, 1, 1, 1,
3.132878, -2.569633, 1.747458, 1, 1, 1, 1, 1,
3.191252, -0.5276377, 0.751263, 1, 1, 1, 1, 1
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
var radius = 9.521407;
var distance = 33.44354;
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
mvMatrix.translate( 0.1185515, 0.1691507, -0.1059244 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.44354);
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
