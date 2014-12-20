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
-3.306268, 0.04852248, -3.427584, 1, 0, 0, 1,
-2.946261, -1.630921, -1.432344, 1, 0.007843138, 0, 1,
-2.84253, 1.754862, -1.330221, 1, 0.01176471, 0, 1,
-2.726708, 1.366956, -1.005587, 1, 0.01960784, 0, 1,
-2.479898, -1.479101, -2.422743, 1, 0.02352941, 0, 1,
-2.459671, -0.6044181, -3.651633, 1, 0.03137255, 0, 1,
-2.454487, 0.3257141, -1.83093, 1, 0.03529412, 0, 1,
-2.453675, -0.1457527, -1.811017, 1, 0.04313726, 0, 1,
-2.447826, 1.361146, -0.7154644, 1, 0.04705882, 0, 1,
-2.393511, -0.5155672, -2.293345, 1, 0.05490196, 0, 1,
-2.373454, 0.8183473, -1.028193, 1, 0.05882353, 0, 1,
-2.365704, 0.3584786, -1.937288, 1, 0.06666667, 0, 1,
-2.29322, -0.7506428, -2.673066, 1, 0.07058824, 0, 1,
-2.285933, -0.09357164, -0.03378498, 1, 0.07843138, 0, 1,
-2.241532, -0.1886701, -0.7488834, 1, 0.08235294, 0, 1,
-2.232836, -0.5161934, -0.2958635, 1, 0.09019608, 0, 1,
-2.216623, 0.5214176, -1.376051, 1, 0.09411765, 0, 1,
-2.152993, 0.01859995, -1.570466, 1, 0.1019608, 0, 1,
-2.137435, -0.3264747, 0.051148, 1, 0.1098039, 0, 1,
-2.104688, -0.1052165, -0.9419457, 1, 0.1137255, 0, 1,
-2.059496, -0.3790903, -2.14167, 1, 0.1215686, 0, 1,
-2.016046, -0.442712, -2.731742, 1, 0.1254902, 0, 1,
-1.984119, -0.9011236, -1.89396, 1, 0.1333333, 0, 1,
-1.977635, 0.3936095, -0.5253708, 1, 0.1372549, 0, 1,
-1.960691, 0.1474422, -3.613557, 1, 0.145098, 0, 1,
-1.925183, -1.832028, -1.860018, 1, 0.1490196, 0, 1,
-1.876459, 0.1172454, -1.530385, 1, 0.1568628, 0, 1,
-1.875084, 0.35505, 1.377287, 1, 0.1607843, 0, 1,
-1.866178, -1.596027, -2.093327, 1, 0.1686275, 0, 1,
-1.856645, -0.2385281, -2.349851, 1, 0.172549, 0, 1,
-1.856022, -0.5106386, -1.866263, 1, 0.1803922, 0, 1,
-1.852443, -0.1842659, -2.623471, 1, 0.1843137, 0, 1,
-1.790731, 0.1977592, -1.581417, 1, 0.1921569, 0, 1,
-1.78053, -0.3928037, -0.5759237, 1, 0.1960784, 0, 1,
-1.752918, 0.1689828, -0.8499359, 1, 0.2039216, 0, 1,
-1.750191, -0.6542622, -1.62875, 1, 0.2117647, 0, 1,
-1.710608, 0.1475865, -1.221211, 1, 0.2156863, 0, 1,
-1.701465, -0.7008423, -1.093933, 1, 0.2235294, 0, 1,
-1.696467, -0.1685603, -2.19164, 1, 0.227451, 0, 1,
-1.693964, 1.656129, 0.4021507, 1, 0.2352941, 0, 1,
-1.658917, -1.395005, -3.0079, 1, 0.2392157, 0, 1,
-1.634194, -2.486764, -4.023689, 1, 0.2470588, 0, 1,
-1.615205, 1.872321, 0.5088329, 1, 0.2509804, 0, 1,
-1.610963, -0.6607082, -2.789174, 1, 0.2588235, 0, 1,
-1.595389, -0.3535258, -1.580656, 1, 0.2627451, 0, 1,
-1.578175, 0.148179, -1.943609, 1, 0.2705882, 0, 1,
-1.575707, -1.452171, -2.367577, 1, 0.2745098, 0, 1,
-1.563072, -0.7906184, -2.87087, 1, 0.282353, 0, 1,
-1.561957, 0.2762451, -0.7166138, 1, 0.2862745, 0, 1,
-1.559494, 0.2728711, -2.370976, 1, 0.2941177, 0, 1,
-1.558439, 0.8764473, -0.07473622, 1, 0.3019608, 0, 1,
-1.537067, -0.2237934, -3.634248, 1, 0.3058824, 0, 1,
-1.532505, 0.2785366, -2.447712, 1, 0.3137255, 0, 1,
-1.519643, 0.3306597, -1.151348, 1, 0.3176471, 0, 1,
-1.519642, 0.473995, -1.453296, 1, 0.3254902, 0, 1,
-1.511071, 0.3127005, -0.46343, 1, 0.3294118, 0, 1,
-1.509783, -0.3699546, -2.42578, 1, 0.3372549, 0, 1,
-1.497371, -1.014971, -2.406643, 1, 0.3411765, 0, 1,
-1.494231, 0.01167656, -1.126003, 1, 0.3490196, 0, 1,
-1.49068, -1.410588, -1.375289, 1, 0.3529412, 0, 1,
-1.484477, 0.7290077, -1.721269, 1, 0.3607843, 0, 1,
-1.462507, -0.8420251, -2.959603, 1, 0.3647059, 0, 1,
-1.460633, 0.5763723, -0.9723586, 1, 0.372549, 0, 1,
-1.432676, -0.2652346, -2.886357, 1, 0.3764706, 0, 1,
-1.41313, 0.08739934, -1.684667, 1, 0.3843137, 0, 1,
-1.410491, -1.696501, -2.121225, 1, 0.3882353, 0, 1,
-1.396263, 0.395955, -0.232049, 1, 0.3960784, 0, 1,
-1.39251, -0.0521456, -0.580673, 1, 0.4039216, 0, 1,
-1.390303, -0.9968514, -1.752649, 1, 0.4078431, 0, 1,
-1.385255, 0.4008635, -0.6751701, 1, 0.4156863, 0, 1,
-1.371808, 0.9159029, -0.2619844, 1, 0.4196078, 0, 1,
-1.371663, -1.550228, -4.191423, 1, 0.427451, 0, 1,
-1.369346, -0.2616424, -1.565809, 1, 0.4313726, 0, 1,
-1.36435, -3.280505, -2.529025, 1, 0.4392157, 0, 1,
-1.352331, -1.415981, -2.77182, 1, 0.4431373, 0, 1,
-1.343748, -0.355555, -2.466216, 1, 0.4509804, 0, 1,
-1.342793, 2.366683, 1.00274, 1, 0.454902, 0, 1,
-1.339289, -1.717456, -2.3575, 1, 0.4627451, 0, 1,
-1.337655, 0.405523, -2.445002, 1, 0.4666667, 0, 1,
-1.336382, -0.1564342, -2.891473, 1, 0.4745098, 0, 1,
-1.327996, -0.06754058, -3.432833, 1, 0.4784314, 0, 1,
-1.318528, 0.6680408, -0.1975246, 1, 0.4862745, 0, 1,
-1.316739, 0.1932774, -1.83334, 1, 0.4901961, 0, 1,
-1.296816, -1.107796, -2.934223, 1, 0.4980392, 0, 1,
-1.289487, 0.8271929, -0.6133761, 1, 0.5058824, 0, 1,
-1.288337, 1.520111, -2.078338, 1, 0.509804, 0, 1,
-1.283594, 0.5595338, -2.024182, 1, 0.5176471, 0, 1,
-1.270296, -1.099142, -2.176648, 1, 0.5215687, 0, 1,
-1.270223, -1.830918, -0.8923245, 1, 0.5294118, 0, 1,
-1.267495, 0.9098595, -1.648808, 1, 0.5333334, 0, 1,
-1.261452, -0.4892994, -1.670511, 1, 0.5411765, 0, 1,
-1.260527, -0.4826774, -2.308821, 1, 0.5450981, 0, 1,
-1.259232, -1.247669, -2.315304, 1, 0.5529412, 0, 1,
-1.248122, 1.415405, -0.354014, 1, 0.5568628, 0, 1,
-1.232829, -1.467088, -3.316823, 1, 0.5647059, 0, 1,
-1.218028, 0.2923626, -2.209916, 1, 0.5686275, 0, 1,
-1.216094, 1.966243, -1.552173, 1, 0.5764706, 0, 1,
-1.213336, 1.323429, -0.7573075, 1, 0.5803922, 0, 1,
-1.212989, -2.986482, -3.039048, 1, 0.5882353, 0, 1,
-1.204197, 0.5695613, -0.5565875, 1, 0.5921569, 0, 1,
-1.198719, 0.2422962, -0.05506582, 1, 0.6, 0, 1,
-1.197914, 0.01293695, 0.4944797, 1, 0.6078432, 0, 1,
-1.19561, -1.092404, -3.322851, 1, 0.6117647, 0, 1,
-1.19433, -0.1938368, -0.6101024, 1, 0.6196079, 0, 1,
-1.19119, -0.9343069, -2.621716, 1, 0.6235294, 0, 1,
-1.189883, 1.19338, 0.08066532, 1, 0.6313726, 0, 1,
-1.189153, 0.4167729, -0.3714558, 1, 0.6352941, 0, 1,
-1.180201, -1.16925, -3.640995, 1, 0.6431373, 0, 1,
-1.170346, -0.7173546, -3.206151, 1, 0.6470588, 0, 1,
-1.163235, 0.9531324, -1.254659, 1, 0.654902, 0, 1,
-1.161413, 0.2286499, -1.574407, 1, 0.6588235, 0, 1,
-1.151282, -0.3192818, -0.9583212, 1, 0.6666667, 0, 1,
-1.143764, 1.844735, -0.1462022, 1, 0.6705883, 0, 1,
-1.135737, 0.05671038, -1.177967, 1, 0.6784314, 0, 1,
-1.13438, 1.307335, -1.468521, 1, 0.682353, 0, 1,
-1.131503, 0.264437, 1.271352, 1, 0.6901961, 0, 1,
-1.124361, -1.426678, -3.130741, 1, 0.6941177, 0, 1,
-1.120562, 1.347505, -2.225639, 1, 0.7019608, 0, 1,
-1.12041, -0.5897531, -1.569454, 1, 0.7098039, 0, 1,
-1.11766, -0.4126277, -0.7641802, 1, 0.7137255, 0, 1,
-1.11646, -0.1373893, -2.158381, 1, 0.7215686, 0, 1,
-1.112351, 0.2504542, -1.228785, 1, 0.7254902, 0, 1,
-1.110607, 0.440609, -0.5693664, 1, 0.7333333, 0, 1,
-1.106588, -1.031914, -2.884129, 1, 0.7372549, 0, 1,
-1.102695, 0.8026612, -0.4693726, 1, 0.7450981, 0, 1,
-1.098956, -2.215242, -1.686666, 1, 0.7490196, 0, 1,
-1.083277, 1.327966, -1.126677, 1, 0.7568628, 0, 1,
-1.070169, -0.01275911, -3.375984, 1, 0.7607843, 0, 1,
-1.066885, -0.2498072, -1.190278, 1, 0.7686275, 0, 1,
-1.065943, 2.237867, 0.4976825, 1, 0.772549, 0, 1,
-1.065864, -0.6239539, -3.193208, 1, 0.7803922, 0, 1,
-1.062314, -0.6039331, 0.3995065, 1, 0.7843137, 0, 1,
-1.043849, 0.6463051, -0.80808, 1, 0.7921569, 0, 1,
-1.04134, -0.3571208, -1.382166, 1, 0.7960784, 0, 1,
-1.040473, -0.1322033, -1.457602, 1, 0.8039216, 0, 1,
-1.035725, 1.58399, -1.682161, 1, 0.8117647, 0, 1,
-1.034154, 2.524976, 0.1363378, 1, 0.8156863, 0, 1,
-1.019298, 1.827217, -1.489019, 1, 0.8235294, 0, 1,
-1.018716, 0.08215953, -1.454002, 1, 0.827451, 0, 1,
-1.017209, 1.74026, -1.40128, 1, 0.8352941, 0, 1,
-1.01604, 0.2703807, -2.421056, 1, 0.8392157, 0, 1,
-1.015899, -0.794328, -4.930975, 1, 0.8470588, 0, 1,
-1.007347, 0.2877712, -1.421433, 1, 0.8509804, 0, 1,
-1.006687, 1.284204, 1.117726, 1, 0.8588235, 0, 1,
-1.004301, 1.510457, -1.234944, 1, 0.8627451, 0, 1,
-1.003569, -0.1141157, -1.833036, 1, 0.8705882, 0, 1,
-1.00287, 1.093624, -2.474555, 1, 0.8745098, 0, 1,
-1.002746, -0.9717466, -1.954771, 1, 0.8823529, 0, 1,
-1.001003, 0.00259622, -2.630537, 1, 0.8862745, 0, 1,
-0.9958186, -0.2905182, -2.7655, 1, 0.8941177, 0, 1,
-0.9954727, 3.106212, 0.6942766, 1, 0.8980392, 0, 1,
-0.9800037, 0.798326, -2.169245, 1, 0.9058824, 0, 1,
-0.9740706, 1.14993, 2.806982, 1, 0.9137255, 0, 1,
-0.9704325, 0.08102033, -1.379896, 1, 0.9176471, 0, 1,
-0.9686352, -0.2353327, -2.240498, 1, 0.9254902, 0, 1,
-0.9647028, -0.2133119, -1.190174, 1, 0.9294118, 0, 1,
-0.9620871, 0.8117098, -0.25408, 1, 0.9372549, 0, 1,
-0.9571292, 0.1896968, -0.866001, 1, 0.9411765, 0, 1,
-0.9570148, -0.4297377, -0.4392181, 1, 0.9490196, 0, 1,
-0.9567688, 0.8987631, -0.9442575, 1, 0.9529412, 0, 1,
-0.9547018, -1.086748, -3.410898, 1, 0.9607843, 0, 1,
-0.9536116, -1.173884, -3.002282, 1, 0.9647059, 0, 1,
-0.9513445, -0.1719543, -0.9345023, 1, 0.972549, 0, 1,
-0.9492987, -0.4230462, -2.564743, 1, 0.9764706, 0, 1,
-0.9327405, -0.1304548, -2.549239, 1, 0.9843137, 0, 1,
-0.9293088, 1.533315, -0.05301926, 1, 0.9882353, 0, 1,
-0.9289544, -0.3687246, -3.202029, 1, 0.9960784, 0, 1,
-0.9273112, -2.394816, -1.083803, 0.9960784, 1, 0, 1,
-0.9265134, -0.3757837, -1.56617, 0.9921569, 1, 0, 1,
-0.9243754, -1.212725, -0.7732256, 0.9843137, 1, 0, 1,
-0.9214975, -0.7791628, -0.7303277, 0.9803922, 1, 0, 1,
-0.914851, 1.264169, 0.2656529, 0.972549, 1, 0, 1,
-0.9138579, -1.805677, -1.698859, 0.9686275, 1, 0, 1,
-0.9098443, -0.1366404, 0.1964644, 0.9607843, 1, 0, 1,
-0.8966671, 0.9889236, -1.699699, 0.9568627, 1, 0, 1,
-0.8963559, 0.4506213, -0.8092278, 0.9490196, 1, 0, 1,
-0.8869109, -1.097347, -2.261764, 0.945098, 1, 0, 1,
-0.8858582, -0.2652154, -2.25053, 0.9372549, 1, 0, 1,
-0.881291, 1.153273, -0.9892815, 0.9333333, 1, 0, 1,
-0.876922, 1.000092, -1.357802, 0.9254902, 1, 0, 1,
-0.8705725, 0.23332, -0.4566804, 0.9215686, 1, 0, 1,
-0.870572, -1.313912, -1.450205, 0.9137255, 1, 0, 1,
-0.8687373, 1.508252, -0.6245314, 0.9098039, 1, 0, 1,
-0.8644969, 0.1156049, 0.01831936, 0.9019608, 1, 0, 1,
-0.8643432, -1.037352, -1.897781, 0.8941177, 1, 0, 1,
-0.8637515, -0.3536304, -3.143264, 0.8901961, 1, 0, 1,
-0.8531591, -1.661243, -2.700458, 0.8823529, 1, 0, 1,
-0.8510298, -0.5183276, -1.756612, 0.8784314, 1, 0, 1,
-0.8503968, -0.3399981, -1.409819, 0.8705882, 1, 0, 1,
-0.8472506, 0.08114339, -1.93592, 0.8666667, 1, 0, 1,
-0.8455036, 0.2345679, -0.7501835, 0.8588235, 1, 0, 1,
-0.8448765, 0.279263, -0.07553481, 0.854902, 1, 0, 1,
-0.8419139, 0.09991755, -2.285403, 0.8470588, 1, 0, 1,
-0.841538, 0.8769094, 0.3139554, 0.8431373, 1, 0, 1,
-0.8406046, -1.411445, -0.7028633, 0.8352941, 1, 0, 1,
-0.8400058, 1.55129, -0.4198127, 0.8313726, 1, 0, 1,
-0.8397707, 0.4472102, 1.086353, 0.8235294, 1, 0, 1,
-0.8390799, 0.7780181, -1.689987, 0.8196079, 1, 0, 1,
-0.8356976, -2.459303, -3.154205, 0.8117647, 1, 0, 1,
-0.8352249, -1.997344, -2.159526, 0.8078431, 1, 0, 1,
-0.8336493, -0.8483978, -1.110286, 0.8, 1, 0, 1,
-0.8325789, 2.541572, -0.2187962, 0.7921569, 1, 0, 1,
-0.8322193, 0.9161173, 1.139565, 0.7882353, 1, 0, 1,
-0.8288941, -0.05437379, -1.19994, 0.7803922, 1, 0, 1,
-0.8263184, -1.111773, -2.515956, 0.7764706, 1, 0, 1,
-0.8255635, -0.3732707, -1.533335, 0.7686275, 1, 0, 1,
-0.8253748, 1.351193, 0.07921905, 0.7647059, 1, 0, 1,
-0.8245557, 0.04994955, -1.637377, 0.7568628, 1, 0, 1,
-0.8116515, -0.9479498, -3.436868, 0.7529412, 1, 0, 1,
-0.8077146, 2.688002, -0.2605706, 0.7450981, 1, 0, 1,
-0.8075694, -0.4293608, -1.946477, 0.7411765, 1, 0, 1,
-0.8048944, 1.211116, 0.1482041, 0.7333333, 1, 0, 1,
-0.8044726, 3.624214, -0.4185892, 0.7294118, 1, 0, 1,
-0.8042943, 0.2473276, 0.318735, 0.7215686, 1, 0, 1,
-0.8037561, -0.4403013, -2.573395, 0.7176471, 1, 0, 1,
-0.8026919, 1.959642, 0.7746317, 0.7098039, 1, 0, 1,
-0.8023236, 0.1431526, -1.522848, 0.7058824, 1, 0, 1,
-0.7898081, 0.8269345, -1.535995, 0.6980392, 1, 0, 1,
-0.7871917, -1.141506, -4.071633, 0.6901961, 1, 0, 1,
-0.7817482, 0.9528016, 0.08381215, 0.6862745, 1, 0, 1,
-0.7704225, 0.3749059, -0.7702267, 0.6784314, 1, 0, 1,
-0.7660556, 0.204476, -2.226177, 0.6745098, 1, 0, 1,
-0.7632596, -0.1772861, -1.867865, 0.6666667, 1, 0, 1,
-0.7572193, 1.34276, -0.05711486, 0.6627451, 1, 0, 1,
-0.753988, 0.7180896, -1.175665, 0.654902, 1, 0, 1,
-0.750035, 0.2523988, -0.1753576, 0.6509804, 1, 0, 1,
-0.7483049, -0.8858046, -2.280104, 0.6431373, 1, 0, 1,
-0.7419268, -0.9186249, -3.106659, 0.6392157, 1, 0, 1,
-0.739934, 0.6406267, -2.025969, 0.6313726, 1, 0, 1,
-0.7392938, 0.7547881, 1.153409, 0.627451, 1, 0, 1,
-0.7171722, -0.8389059, -1.482312, 0.6196079, 1, 0, 1,
-0.7169698, 0.1379006, -1.626914, 0.6156863, 1, 0, 1,
-0.7166121, -0.3599081, -1.991851, 0.6078432, 1, 0, 1,
-0.7125716, 1.283006, -0.2650885, 0.6039216, 1, 0, 1,
-0.7124885, 0.06209035, -2.556453, 0.5960785, 1, 0, 1,
-0.7058494, 0.5659828, -1.649336, 0.5882353, 1, 0, 1,
-0.704719, 0.2451991, -2.845484, 0.5843138, 1, 0, 1,
-0.70264, 1.49311, -0.8241129, 0.5764706, 1, 0, 1,
-0.7019708, -2.109703, -3.600443, 0.572549, 1, 0, 1,
-0.6975292, 0.7542582, -0.4717351, 0.5647059, 1, 0, 1,
-0.6953309, -0.4082012, -1.773976, 0.5607843, 1, 0, 1,
-0.6926656, 0.2940631, -0.7758129, 0.5529412, 1, 0, 1,
-0.6876759, 0.2734302, 0.4138888, 0.5490196, 1, 0, 1,
-0.6868716, 0.9312262, -0.5838677, 0.5411765, 1, 0, 1,
-0.6797243, -0.2721777, -0.0936061, 0.5372549, 1, 0, 1,
-0.675422, 2.206825, -1.059146, 0.5294118, 1, 0, 1,
-0.6740916, 0.3631236, 0.4738733, 0.5254902, 1, 0, 1,
-0.6673341, -0.3190869, -3.636735, 0.5176471, 1, 0, 1,
-0.6641627, 0.2305288, -3.514277, 0.5137255, 1, 0, 1,
-0.6578781, -1.190063, -3.271668, 0.5058824, 1, 0, 1,
-0.6536715, -1.282962, -3.182907, 0.5019608, 1, 0, 1,
-0.6524761, -0.1208991, -1.754187, 0.4941176, 1, 0, 1,
-0.6509818, 0.09345572, -3.342468, 0.4862745, 1, 0, 1,
-0.6436322, -0.217699, -3.250477, 0.4823529, 1, 0, 1,
-0.6395697, -0.1168944, -2.519359, 0.4745098, 1, 0, 1,
-0.6388774, 0.2932583, -1.442175, 0.4705882, 1, 0, 1,
-0.6365632, 1.382117, -0.08564991, 0.4627451, 1, 0, 1,
-0.6339815, -1.416361, -1.969138, 0.4588235, 1, 0, 1,
-0.6317708, 0.7385839, -0.369878, 0.4509804, 1, 0, 1,
-0.6311027, -0.2268618, -2.436885, 0.4470588, 1, 0, 1,
-0.6308708, -1.17618, -3.257813, 0.4392157, 1, 0, 1,
-0.6308199, -0.6055492, -2.835162, 0.4352941, 1, 0, 1,
-0.6280649, -0.6509205, -1.705884, 0.427451, 1, 0, 1,
-0.6260158, 1.950512, -1.037883, 0.4235294, 1, 0, 1,
-0.6225759, 1.282745, -1.152907, 0.4156863, 1, 0, 1,
-0.6198011, -0.4520385, -1.84253, 0.4117647, 1, 0, 1,
-0.6138011, 0.0136901, -3.191463, 0.4039216, 1, 0, 1,
-0.6067544, -1.153952, 0.1582361, 0.3960784, 1, 0, 1,
-0.5987051, -0.3665786, -1.157467, 0.3921569, 1, 0, 1,
-0.5948187, -0.3579798, -3.402668, 0.3843137, 1, 0, 1,
-0.5942577, 0.1050511, -1.300229, 0.3803922, 1, 0, 1,
-0.5932112, 0.1228764, -1.591699, 0.372549, 1, 0, 1,
-0.5927094, 0.8928535, 1.062894, 0.3686275, 1, 0, 1,
-0.5911579, 0.6643836, -1.867028, 0.3607843, 1, 0, 1,
-0.5886428, -0.8597576, -2.164571, 0.3568628, 1, 0, 1,
-0.5882928, -0.2020173, -2.75711, 0.3490196, 1, 0, 1,
-0.5860019, -1.274853, -2.651012, 0.345098, 1, 0, 1,
-0.5853185, -0.2138822, -3.095108, 0.3372549, 1, 0, 1,
-0.5789385, 0.5350233, 0.2928102, 0.3333333, 1, 0, 1,
-0.5785383, -0.4618886, 0.2725586, 0.3254902, 1, 0, 1,
-0.577159, 0.3938017, -1.725497, 0.3215686, 1, 0, 1,
-0.575706, 0.8833371, -0.519923, 0.3137255, 1, 0, 1,
-0.5722339, -0.4052829, -1.460438, 0.3098039, 1, 0, 1,
-0.5709432, -0.2048821, -1.630585, 0.3019608, 1, 0, 1,
-0.5681621, 0.3627167, -0.1144356, 0.2941177, 1, 0, 1,
-0.5606628, 0.4923992, -0.9236998, 0.2901961, 1, 0, 1,
-0.559916, 0.9842914, -0.195329, 0.282353, 1, 0, 1,
-0.5589736, 0.6921614, -1.301177, 0.2784314, 1, 0, 1,
-0.5586751, 0.4644629, -1.639995, 0.2705882, 1, 0, 1,
-0.5488831, 0.03834693, -2.073321, 0.2666667, 1, 0, 1,
-0.5483993, -0.5762796, -1.674609, 0.2588235, 1, 0, 1,
-0.5477301, -1.760343, -3.639577, 0.254902, 1, 0, 1,
-0.5457674, -1.79933, -2.043148, 0.2470588, 1, 0, 1,
-0.5433336, 0.255825, -1.335137, 0.2431373, 1, 0, 1,
-0.5413836, 0.1572746, -1.772755, 0.2352941, 1, 0, 1,
-0.5295507, 0.3033404, -2.012214, 0.2313726, 1, 0, 1,
-0.5274345, -0.6562856, -2.397247, 0.2235294, 1, 0, 1,
-0.5266843, 1.754113, -1.340629, 0.2196078, 1, 0, 1,
-0.5210558, -1.834482, -1.402104, 0.2117647, 1, 0, 1,
-0.5191232, 0.05558757, -1.53218, 0.2078431, 1, 0, 1,
-0.5174084, -0.3505304, -2.815336, 0.2, 1, 0, 1,
-0.5152238, 0.4833868, -0.8372787, 0.1921569, 1, 0, 1,
-0.5117453, 1.449384, -1.721265, 0.1882353, 1, 0, 1,
-0.5093446, 1.265947, -0.8753977, 0.1803922, 1, 0, 1,
-0.5087519, 0.8047597, -1.768425, 0.1764706, 1, 0, 1,
-0.506695, -0.8585063, -4.051281, 0.1686275, 1, 0, 1,
-0.5056745, -1.606621, -1.508241, 0.1647059, 1, 0, 1,
-0.5050919, 0.04006854, -0.539126, 0.1568628, 1, 0, 1,
-0.5045016, -0.4377306, -3.513396, 0.1529412, 1, 0, 1,
-0.4936071, 0.8020633, -1.426009, 0.145098, 1, 0, 1,
-0.4877822, -0.374946, -0.971846, 0.1411765, 1, 0, 1,
-0.4873954, 0.05822724, -1.994408, 0.1333333, 1, 0, 1,
-0.4837405, 0.7261602, -2.07255, 0.1294118, 1, 0, 1,
-0.4813571, -0.1510948, -0.9666001, 0.1215686, 1, 0, 1,
-0.4776436, -0.2917321, -2.367834, 0.1176471, 1, 0, 1,
-0.4723243, 0.2918389, -0.3744494, 0.1098039, 1, 0, 1,
-0.4701884, -0.1782672, -3.439849, 0.1058824, 1, 0, 1,
-0.4668812, -0.3639416, -2.143583, 0.09803922, 1, 0, 1,
-0.4631856, 1.340711, 0.1821395, 0.09019608, 1, 0, 1,
-0.4631391, -0.5334515, -2.869947, 0.08627451, 1, 0, 1,
-0.4631118, 0.6927925, 0.7498356, 0.07843138, 1, 0, 1,
-0.4601512, -0.6232716, -1.472417, 0.07450981, 1, 0, 1,
-0.4588826, 0.5768823, -0.7822353, 0.06666667, 1, 0, 1,
-0.4584242, -0.4810458, -2.8038, 0.0627451, 1, 0, 1,
-0.455227, 0.17352, -1.140489, 0.05490196, 1, 0, 1,
-0.4536093, -0.5968383, -2.672704, 0.05098039, 1, 0, 1,
-0.4512869, 1.33972, 0.4438694, 0.04313726, 1, 0, 1,
-0.4488474, -0.9455948, -2.022442, 0.03921569, 1, 0, 1,
-0.4487906, 0.6417413, -0.1671194, 0.03137255, 1, 0, 1,
-0.4459794, 0.1529201, -0.02540097, 0.02745098, 1, 0, 1,
-0.4435538, -0.003050513, -0.8007701, 0.01960784, 1, 0, 1,
-0.4428838, 1.474563, 1.390779, 0.01568628, 1, 0, 1,
-0.4424652, 1.595502, 0.1991466, 0.007843138, 1, 0, 1,
-0.4342934, 1.633925, -0.5703006, 0.003921569, 1, 0, 1,
-0.4340561, 0.9104834, -1.159503, 0, 1, 0.003921569, 1,
-0.4287974, -0.7486482, -2.491919, 0, 1, 0.01176471, 1,
-0.4274612, 0.7641517, -0.749915, 0, 1, 0.01568628, 1,
-0.4235236, -0.6853921, 0.02714645, 0, 1, 0.02352941, 1,
-0.4228379, -0.04683039, -0.886425, 0, 1, 0.02745098, 1,
-0.4112317, 1.217451, -0.007320088, 0, 1, 0.03529412, 1,
-0.4067212, -0.09213918, -0.6641859, 0, 1, 0.03921569, 1,
-0.4065204, 0.8292677, -0.5354987, 0, 1, 0.04705882, 1,
-0.4044712, -0.5565112, -1.372413, 0, 1, 0.05098039, 1,
-0.4030909, -0.2605, -2.415638, 0, 1, 0.05882353, 1,
-0.4009858, -0.5882772, -2.775352, 0, 1, 0.0627451, 1,
-0.4004614, 0.277489, -0.847006, 0, 1, 0.07058824, 1,
-0.3995268, -0.5177259, -2.048507, 0, 1, 0.07450981, 1,
-0.3994463, 1.759949, -1.100236, 0, 1, 0.08235294, 1,
-0.3991455, 0.1593111, -2.31744, 0, 1, 0.08627451, 1,
-0.3964359, -0.4789442, -2.008123, 0, 1, 0.09411765, 1,
-0.3950056, -0.7086326, -3.312047, 0, 1, 0.1019608, 1,
-0.3921475, 0.2081415, 0.7558308, 0, 1, 0.1058824, 1,
-0.390915, 0.3403305, -0.3170811, 0, 1, 0.1137255, 1,
-0.390036, 0.75798, 0.150112, 0, 1, 0.1176471, 1,
-0.3865232, -1.472534, -2.266109, 0, 1, 0.1254902, 1,
-0.3853475, 1.143758, 1.524543, 0, 1, 0.1294118, 1,
-0.3824636, -0.1230477, -2.226645, 0, 1, 0.1372549, 1,
-0.382216, 0.8522778, 0.1645482, 0, 1, 0.1411765, 1,
-0.3815701, 1.505273, -1.60479, 0, 1, 0.1490196, 1,
-0.3809089, -0.3997965, -2.001944, 0, 1, 0.1529412, 1,
-0.3744586, 1.45564, -0.3009065, 0, 1, 0.1607843, 1,
-0.3725376, -0.8076897, -2.493211, 0, 1, 0.1647059, 1,
-0.3689354, -0.1635064, -1.508574, 0, 1, 0.172549, 1,
-0.3669943, 1.236456, -0.01444586, 0, 1, 0.1764706, 1,
-0.3606766, 1.68051, 0.5801125, 0, 1, 0.1843137, 1,
-0.3600371, 0.531404, 0.1913522, 0, 1, 0.1882353, 1,
-0.3549451, -0.1363423, -1.791755, 0, 1, 0.1960784, 1,
-0.3542169, -0.01250995, -2.647122, 0, 1, 0.2039216, 1,
-0.3541621, 0.3597256, 1.168272, 0, 1, 0.2078431, 1,
-0.352483, -0.1603119, -1.562224, 0, 1, 0.2156863, 1,
-0.3521278, 2.64831, -0.7403104, 0, 1, 0.2196078, 1,
-0.3499194, 0.730499, -0.2919382, 0, 1, 0.227451, 1,
-0.3488463, 0.7011763, -0.4072213, 0, 1, 0.2313726, 1,
-0.3447744, 0.4088238, -1.382234, 0, 1, 0.2392157, 1,
-0.3422687, 1.747544, -0.6700512, 0, 1, 0.2431373, 1,
-0.3390989, 1.440699, -0.9575661, 0, 1, 0.2509804, 1,
-0.3351773, -0.606626, -3.451499, 0, 1, 0.254902, 1,
-0.3327971, 0.1254707, -2.270643, 0, 1, 0.2627451, 1,
-0.3315765, -0.6773281, -2.648244, 0, 1, 0.2666667, 1,
-0.3227069, 0.06633365, 0.5827491, 0, 1, 0.2745098, 1,
-0.318794, 0.1333958, -0.4014413, 0, 1, 0.2784314, 1,
-0.3154434, 0.4243632, 0.1549632, 0, 1, 0.2862745, 1,
-0.3149967, -1.525651, -2.616723, 0, 1, 0.2901961, 1,
-0.3104684, 0.6838493, -1.03978, 0, 1, 0.2980392, 1,
-0.3040892, 1.489171, 1.455956, 0, 1, 0.3058824, 1,
-0.3029802, -0.05555855, -1.156705, 0, 1, 0.3098039, 1,
-0.3025071, 0.09049523, -0.196728, 0, 1, 0.3176471, 1,
-0.3014434, -0.6593478, -1.057252, 0, 1, 0.3215686, 1,
-0.3009667, -0.1069277, -1.143334, 0, 1, 0.3294118, 1,
-0.2994305, -1.431419, -3.262583, 0, 1, 0.3333333, 1,
-0.2989819, 1.319596, 1.508003, 0, 1, 0.3411765, 1,
-0.2941321, -1.780119, -1.492719, 0, 1, 0.345098, 1,
-0.2885567, -1.341315, -2.849154, 0, 1, 0.3529412, 1,
-0.282901, -0.1924041, -4.44838, 0, 1, 0.3568628, 1,
-0.2804819, -0.2736559, -3.591738, 0, 1, 0.3647059, 1,
-0.2788041, 0.8692388, -0.5614967, 0, 1, 0.3686275, 1,
-0.2781887, -0.4365956, -2.941376, 0, 1, 0.3764706, 1,
-0.2776121, 0.5045529, 0.1939459, 0, 1, 0.3803922, 1,
-0.2752521, 0.4771631, -1.059609, 0, 1, 0.3882353, 1,
-0.2743693, -0.190621, -1.839914, 0, 1, 0.3921569, 1,
-0.2722506, 1.468257, -2.173544, 0, 1, 0.4, 1,
-0.2588018, -0.3166872, -1.934284, 0, 1, 0.4078431, 1,
-0.2586257, 0.1054144, -0.7442233, 0, 1, 0.4117647, 1,
-0.255296, 1.110708, -1.162377, 0, 1, 0.4196078, 1,
-0.2517553, 0.7067631, -1.001981, 0, 1, 0.4235294, 1,
-0.2482091, 0.1486463, -0.8367902, 0, 1, 0.4313726, 1,
-0.2457499, 0.2472282, -1.945022, 0, 1, 0.4352941, 1,
-0.2453783, -1.393604, -2.865894, 0, 1, 0.4431373, 1,
-0.2424949, -0.2693614, -3.077535, 0, 1, 0.4470588, 1,
-0.2375669, -0.05720505, -1.235144, 0, 1, 0.454902, 1,
-0.2253294, -0.1661725, -1.804155, 0, 1, 0.4588235, 1,
-0.2231307, 0.8453453, 0.7644119, 0, 1, 0.4666667, 1,
-0.2218589, 0.02358409, -2.439981, 0, 1, 0.4705882, 1,
-0.2210246, -0.6116199, -1.983063, 0, 1, 0.4784314, 1,
-0.2185451, -1.221097, -4.857166, 0, 1, 0.4823529, 1,
-0.2179263, -1.291961, -2.198067, 0, 1, 0.4901961, 1,
-0.2168542, -0.1148833, -1.021041, 0, 1, 0.4941176, 1,
-0.2144697, 0.1873042, -0.4454753, 0, 1, 0.5019608, 1,
-0.2141105, -1.280265, -1.662325, 0, 1, 0.509804, 1,
-0.2121731, -0.5640354, -0.9081885, 0, 1, 0.5137255, 1,
-0.2117282, -0.8460992, -3.919756, 0, 1, 0.5215687, 1,
-0.2100024, 1.267875, -0.5548093, 0, 1, 0.5254902, 1,
-0.2082505, -0.5457015, -1.944368, 0, 1, 0.5333334, 1,
-0.2029977, -0.6307918, -2.257187, 0, 1, 0.5372549, 1,
-0.1979038, -0.1907146, -0.2759752, 0, 1, 0.5450981, 1,
-0.1930077, -2.778152, -5.136692, 0, 1, 0.5490196, 1,
-0.1880901, 0.1673493, -2.046369, 0, 1, 0.5568628, 1,
-0.1831086, -0.4242278, -3.962423, 0, 1, 0.5607843, 1,
-0.180004, 1.608302, -1.589015, 0, 1, 0.5686275, 1,
-0.1778751, -0.328256, -1.605403, 0, 1, 0.572549, 1,
-0.177314, 1.990375, -1.031895, 0, 1, 0.5803922, 1,
-0.1762411, 0.3229346, 0.2793905, 0, 1, 0.5843138, 1,
-0.1759633, 0.3466002, -1.610753, 0, 1, 0.5921569, 1,
-0.1750525, -0.4979392, -2.333089, 0, 1, 0.5960785, 1,
-0.1746526, -0.2759084, -1.242347, 0, 1, 0.6039216, 1,
-0.1730555, 0.9642988, 1.011524, 0, 1, 0.6117647, 1,
-0.16538, 0.463323, -1.076207, 0, 1, 0.6156863, 1,
-0.162476, 0.3717603, 0.520281, 0, 1, 0.6235294, 1,
-0.1602774, -2.401058, -3.632961, 0, 1, 0.627451, 1,
-0.1554689, -1.116655, -3.397754, 0, 1, 0.6352941, 1,
-0.1541816, -0.1205229, -1.113446, 0, 1, 0.6392157, 1,
-0.1503629, -0.5686322, -3.443736, 0, 1, 0.6470588, 1,
-0.1471471, 0.9756786, 0.189797, 0, 1, 0.6509804, 1,
-0.1428287, 0.2656854, -0.9190537, 0, 1, 0.6588235, 1,
-0.1426287, 0.1712836, 0.3860581, 0, 1, 0.6627451, 1,
-0.1397747, -1.245193, -0.8949928, 0, 1, 0.6705883, 1,
-0.1395791, -0.8994058, -2.276546, 0, 1, 0.6745098, 1,
-0.1366042, 0.6478114, -0.4061889, 0, 1, 0.682353, 1,
-0.1329582, 0.4911301, 0.5015904, 0, 1, 0.6862745, 1,
-0.1303339, 0.1278584, -0.7723588, 0, 1, 0.6941177, 1,
-0.1288213, -0.9915671, -3.040295, 0, 1, 0.7019608, 1,
-0.1286261, -0.377812, -2.630958, 0, 1, 0.7058824, 1,
-0.1215539, -1.691418, -2.38979, 0, 1, 0.7137255, 1,
-0.1161649, -0.7337523, -1.909784, 0, 1, 0.7176471, 1,
-0.1159348, 0.7167448, -0.3579657, 0, 1, 0.7254902, 1,
-0.1139696, 0.2182637, -2.816896, 0, 1, 0.7294118, 1,
-0.1096483, 1.053347, -0.5533577, 0, 1, 0.7372549, 1,
-0.1085278, -0.0353365, -3.170609, 0, 1, 0.7411765, 1,
-0.1078179, -0.630367, -2.566444, 0, 1, 0.7490196, 1,
-0.1000179, 1.16858, 1.097877, 0, 1, 0.7529412, 1,
-0.09991442, -0.9963816, -4.057112, 0, 1, 0.7607843, 1,
-0.09235553, -1.523174, -2.909396, 0, 1, 0.7647059, 1,
-0.0910802, 1.56662, 1.013098, 0, 1, 0.772549, 1,
-0.08825739, 0.1583484, -2.462494, 0, 1, 0.7764706, 1,
-0.08348512, -0.9429391, -1.760518, 0, 1, 0.7843137, 1,
-0.07864365, -0.2047274, -1.850575, 0, 1, 0.7882353, 1,
-0.07715628, -0.8858837, -1.647676, 0, 1, 0.7960784, 1,
-0.07587842, 0.5010902, 0.487354, 0, 1, 0.8039216, 1,
-0.07474809, 1.225561, -1.402132, 0, 1, 0.8078431, 1,
-0.07252519, 1.196865, 0.5683044, 0, 1, 0.8156863, 1,
-0.0719934, -1.201057, -4.177481, 0, 1, 0.8196079, 1,
-0.06849177, 0.1585879, -0.6367427, 0, 1, 0.827451, 1,
-0.06490667, -0.9084392, -1.103379, 0, 1, 0.8313726, 1,
-0.06381738, 1.755545, -1.039297, 0, 1, 0.8392157, 1,
-0.05758848, 0.2052775, 0.6960371, 0, 1, 0.8431373, 1,
-0.05752208, -0.1939797, -4.207275, 0, 1, 0.8509804, 1,
-0.05538109, -1.347802, -4.239161, 0, 1, 0.854902, 1,
-0.0524721, 0.1093147, -2.024681, 0, 1, 0.8627451, 1,
-0.04708329, 0.2145811, -1.405791, 0, 1, 0.8666667, 1,
-0.04282773, 1.084691, 0.6298954, 0, 1, 0.8745098, 1,
-0.04220073, 0.8564689, -0.6330274, 0, 1, 0.8784314, 1,
-0.0406318, -0.6462514, -2.726695, 0, 1, 0.8862745, 1,
-0.03829414, -1.469191, -2.662169, 0, 1, 0.8901961, 1,
-0.0375272, -0.352528, -1.696321, 0, 1, 0.8980392, 1,
-0.03647202, 0.0776027, 1.49765, 0, 1, 0.9058824, 1,
-0.03646947, 0.7878812, -0.4413692, 0, 1, 0.9098039, 1,
-0.03617961, -0.7737735, -4.678206, 0, 1, 0.9176471, 1,
-0.03435698, 0.5967121, 0.04821137, 0, 1, 0.9215686, 1,
-0.03377995, 0.4364404, -1.309698, 0, 1, 0.9294118, 1,
-0.0249312, -0.6589437, -2.418881, 0, 1, 0.9333333, 1,
-0.02464593, 0.5414506, 1.06657, 0, 1, 0.9411765, 1,
-0.02410314, 0.4388934, 0.157097, 0, 1, 0.945098, 1,
-0.02315914, 1.896509, 1.291347, 0, 1, 0.9529412, 1,
-0.01969928, 0.2552824, -1.705709, 0, 1, 0.9568627, 1,
-0.01801478, -0.5595519, -2.752387, 0, 1, 0.9647059, 1,
-0.01699283, -0.7786792, -3.148781, 0, 1, 0.9686275, 1,
-0.01647579, -0.3692875, -2.189934, 0, 1, 0.9764706, 1,
-0.01387954, -0.6192943, -3.183909, 0, 1, 0.9803922, 1,
-0.012584, -0.5970253, -3.536328, 0, 1, 0.9882353, 1,
-0.004839777, 1.09325, 0.5227327, 0, 1, 0.9921569, 1,
0.0009603631, 0.5345637, -1.728744, 0, 1, 1, 1,
0.001905582, -0.5992506, 1.819329, 0, 0.9921569, 1, 1,
0.003479006, -0.7204621, 3.529528, 0, 0.9882353, 1, 1,
0.00557813, 1.041493, 0.7486045, 0, 0.9803922, 1, 1,
0.006832081, 0.679281, 1.444137, 0, 0.9764706, 1, 1,
0.008702616, 0.2704816, 0.1726705, 0, 0.9686275, 1, 1,
0.008953428, 0.04894833, -0.5835063, 0, 0.9647059, 1, 1,
0.009781526, 1.652943, 2.468879, 0, 0.9568627, 1, 1,
0.0105948, -0.4059868, 3.001882, 0, 0.9529412, 1, 1,
0.0121915, 1.254463, 1.117686, 0, 0.945098, 1, 1,
0.01924244, 0.8873229, -0.807383, 0, 0.9411765, 1, 1,
0.02281373, 1.30235, 1.275744, 0, 0.9333333, 1, 1,
0.02284688, -0.14806, 3.244821, 0, 0.9294118, 1, 1,
0.02461652, -0.9944026, 2.524338, 0, 0.9215686, 1, 1,
0.02577014, -1.677198, 3.074946, 0, 0.9176471, 1, 1,
0.0265303, 0.7973748, -1.034924, 0, 0.9098039, 1, 1,
0.02763304, 0.4479196, 0.5307559, 0, 0.9058824, 1, 1,
0.03041239, -2.370751, 4.124791, 0, 0.8980392, 1, 1,
0.03310565, 0.005895916, 2.995766, 0, 0.8901961, 1, 1,
0.03331437, -0.4520831, 3.027487, 0, 0.8862745, 1, 1,
0.03338686, 0.6698952, -2.016689, 0, 0.8784314, 1, 1,
0.03401143, 0.8841379, -0.108082, 0, 0.8745098, 1, 1,
0.03700556, 0.6015843, 0.3285885, 0, 0.8666667, 1, 1,
0.04065375, 0.8528439, -2.423568, 0, 0.8627451, 1, 1,
0.04113435, 2.260421, 0.2309301, 0, 0.854902, 1, 1,
0.04299603, -1.504405, 3.59403, 0, 0.8509804, 1, 1,
0.04308695, -0.4736101, 2.279202, 0, 0.8431373, 1, 1,
0.04350535, 1.074761, -0.01558677, 0, 0.8392157, 1, 1,
0.04413529, -1.953878, 4.961287, 0, 0.8313726, 1, 1,
0.04596109, 0.5481091, 0.4054394, 0, 0.827451, 1, 1,
0.04834364, 0.4847316, 1.122692, 0, 0.8196079, 1, 1,
0.04841869, 2.251884, 2.580254, 0, 0.8156863, 1, 1,
0.05034639, 0.130968, -0.2888288, 0, 0.8078431, 1, 1,
0.05324105, -0.4284036, 1.513135, 0, 0.8039216, 1, 1,
0.05849713, 0.4698438, -0.3059412, 0, 0.7960784, 1, 1,
0.05949995, 0.5522622, 1.211435, 0, 0.7882353, 1, 1,
0.06270038, -0.154733, 2.853733, 0, 0.7843137, 1, 1,
0.06275586, 0.2609872, 0.21682, 0, 0.7764706, 1, 1,
0.06336228, 1.206835, 0.8210129, 0, 0.772549, 1, 1,
0.06641971, 0.6213505, 0.5018477, 0, 0.7647059, 1, 1,
0.07293546, 1.405285, -0.01878952, 0, 0.7607843, 1, 1,
0.07585055, -0.2084307, 3.303603, 0, 0.7529412, 1, 1,
0.07650045, -1.231318, 3.328746, 0, 0.7490196, 1, 1,
0.07703584, -0.417285, 2.945309, 0, 0.7411765, 1, 1,
0.08305528, -2.303339, 1.609119, 0, 0.7372549, 1, 1,
0.08656002, -0.7362164, 3.975881, 0, 0.7294118, 1, 1,
0.08729485, 0.3485909, -0.2101555, 0, 0.7254902, 1, 1,
0.08905039, 2.760614, -1.036544, 0, 0.7176471, 1, 1,
0.09035388, 0.6945917, 1.476905, 0, 0.7137255, 1, 1,
0.09102239, -1.410068, 3.496941, 0, 0.7058824, 1, 1,
0.09178184, -3.079051, 2.868474, 0, 0.6980392, 1, 1,
0.0940453, 0.2479472, -0.2391916, 0, 0.6941177, 1, 1,
0.09601121, 1.167259, -1.352692, 0, 0.6862745, 1, 1,
0.1001301, -0.07493102, 0.8646478, 0, 0.682353, 1, 1,
0.1005453, 0.1039234, 0.5383645, 0, 0.6745098, 1, 1,
0.1011692, 0.7818474, -1.727854, 0, 0.6705883, 1, 1,
0.1014289, 0.8247479, 0.2553405, 0, 0.6627451, 1, 1,
0.1017758, 0.09592801, 2.033284, 0, 0.6588235, 1, 1,
0.1043467, -1.095378, 3.242472, 0, 0.6509804, 1, 1,
0.1078538, 1.487302, -0.5203661, 0, 0.6470588, 1, 1,
0.1105838, 1.36462, 0.560596, 0, 0.6392157, 1, 1,
0.1150918, -0.8227249, 1.935864, 0, 0.6352941, 1, 1,
0.1159761, -1.00453, 2.127349, 0, 0.627451, 1, 1,
0.1159954, -0.2545433, 3.323137, 0, 0.6235294, 1, 1,
0.116462, -0.9278154, 3.283091, 0, 0.6156863, 1, 1,
0.1199048, 0.9929477, -1.035521, 0, 0.6117647, 1, 1,
0.1301991, -0.2527795, 2.641727, 0, 0.6039216, 1, 1,
0.1312133, 0.983292, 0.3740881, 0, 0.5960785, 1, 1,
0.1321538, -0.6179526, -0.5493739, 0, 0.5921569, 1, 1,
0.132224, -1.457628, 3.274473, 0, 0.5843138, 1, 1,
0.1352226, 0.5274988, -1.247123, 0, 0.5803922, 1, 1,
0.1352796, -0.5326422, 1.956661, 0, 0.572549, 1, 1,
0.136119, 0.2012607, 0.6607527, 0, 0.5686275, 1, 1,
0.1380294, 1.204256, -0.6950832, 0, 0.5607843, 1, 1,
0.1398375, 0.4547797, -0.7439082, 0, 0.5568628, 1, 1,
0.1456317, 0.6469128, -0.1965785, 0, 0.5490196, 1, 1,
0.1485337, -1.431144, 2.545259, 0, 0.5450981, 1, 1,
0.1516743, -0.2734455, 3.361006, 0, 0.5372549, 1, 1,
0.1527739, 0.5821518, 0.685312, 0, 0.5333334, 1, 1,
0.166032, 0.6024741, -0.970308, 0, 0.5254902, 1, 1,
0.166991, 0.1762644, 0.7730247, 0, 0.5215687, 1, 1,
0.1698662, -0.9199321, 2.100104, 0, 0.5137255, 1, 1,
0.1719693, 1.874595, -0.2717613, 0, 0.509804, 1, 1,
0.1771725, -0.8272232, 2.332215, 0, 0.5019608, 1, 1,
0.1776432, -0.4912942, 2.239489, 0, 0.4941176, 1, 1,
0.1813034, -1.534294, 4.490465, 0, 0.4901961, 1, 1,
0.1861274, 1.189314, -0.1640935, 0, 0.4823529, 1, 1,
0.1866878, 0.9736103, 1.49533, 0, 0.4784314, 1, 1,
0.1880638, 1.2182, 0.5242068, 0, 0.4705882, 1, 1,
0.1881781, 0.6651265, 1.078321, 0, 0.4666667, 1, 1,
0.1917264, 1.514162, 0.8971105, 0, 0.4588235, 1, 1,
0.1926445, -0.6057901, 2.320146, 0, 0.454902, 1, 1,
0.1937561, -1.475516, 1.585633, 0, 0.4470588, 1, 1,
0.1956397, -0.5261236, 3.523054, 0, 0.4431373, 1, 1,
0.1965635, -0.7705989, 2.44988, 0, 0.4352941, 1, 1,
0.197274, -0.3455844, 3.218218, 0, 0.4313726, 1, 1,
0.1986641, -0.6706744, 3.446252, 0, 0.4235294, 1, 1,
0.2015719, -1.572401, 2.151186, 0, 0.4196078, 1, 1,
0.2066028, 1.335869, 0.3200155, 0, 0.4117647, 1, 1,
0.2079315, 1.286793, 1.404769, 0, 0.4078431, 1, 1,
0.2088982, -0.6993674, 2.78757, 0, 0.4, 1, 1,
0.2107214, 1.17792, 0.3972451, 0, 0.3921569, 1, 1,
0.2121109, -0.4408696, 2.379263, 0, 0.3882353, 1, 1,
0.2129405, -0.06671943, 1.580802, 0, 0.3803922, 1, 1,
0.2134346, 0.9575095, -1.240608, 0, 0.3764706, 1, 1,
0.2144022, 1.246515, -0.866456, 0, 0.3686275, 1, 1,
0.2167364, 0.3681458, 1.057005, 0, 0.3647059, 1, 1,
0.2199784, 0.4545703, 0.0706903, 0, 0.3568628, 1, 1,
0.2249607, 1.509976, 0.403501, 0, 0.3529412, 1, 1,
0.2260188, -1.129189, 1.028286, 0, 0.345098, 1, 1,
0.2278704, 0.09839003, -0.4130177, 0, 0.3411765, 1, 1,
0.2279379, -0.09214861, 2.288938, 0, 0.3333333, 1, 1,
0.2282804, 0.969435, 0.09375907, 0, 0.3294118, 1, 1,
0.233606, 0.2364209, 1.641816, 0, 0.3215686, 1, 1,
0.2369924, 1.850854, -0.7342314, 0, 0.3176471, 1, 1,
0.2381844, -0.2032785, 1.055568, 0, 0.3098039, 1, 1,
0.2439861, 0.2224457, 1.956855, 0, 0.3058824, 1, 1,
0.2466034, 0.4878453, 1.221208, 0, 0.2980392, 1, 1,
0.2468315, 1.035709, -0.008796182, 0, 0.2901961, 1, 1,
0.2483063, 0.2507953, 1.352004, 0, 0.2862745, 1, 1,
0.2506554, 0.4863523, -0.8792056, 0, 0.2784314, 1, 1,
0.2532839, 0.6654233, 0.7907832, 0, 0.2745098, 1, 1,
0.2554766, 0.2321346, 0.7206942, 0, 0.2666667, 1, 1,
0.2610241, -0.0004207694, 0.9745234, 0, 0.2627451, 1, 1,
0.2616608, -0.9248145, 2.497315, 0, 0.254902, 1, 1,
0.2627602, 1.865892, -0.7081604, 0, 0.2509804, 1, 1,
0.2674488, 0.1152363, 3.044768, 0, 0.2431373, 1, 1,
0.2703006, 1.050671, 1.054382, 0, 0.2392157, 1, 1,
0.2710007, 0.9212777, -0.4044035, 0, 0.2313726, 1, 1,
0.2742304, -1.431471, 2.401629, 0, 0.227451, 1, 1,
0.275377, 1.265925, 1.036012, 0, 0.2196078, 1, 1,
0.2762437, -1.423018, 2.156803, 0, 0.2156863, 1, 1,
0.2767938, -2.064873, 2.04615, 0, 0.2078431, 1, 1,
0.2853503, 0.2323036, 0.05920856, 0, 0.2039216, 1, 1,
0.2869605, -1.043491, 3.374735, 0, 0.1960784, 1, 1,
0.2872345, -1.724973, 2.949083, 0, 0.1882353, 1, 1,
0.287668, -0.06666294, 1.066164, 0, 0.1843137, 1, 1,
0.290093, 0.5730224, -0.01346092, 0, 0.1764706, 1, 1,
0.2925048, 1.096507, 0.7887604, 0, 0.172549, 1, 1,
0.2957966, 0.4239225, 0.5625483, 0, 0.1647059, 1, 1,
0.2974368, -0.8768593, 1.112052, 0, 0.1607843, 1, 1,
0.2975362, 1.915055, -0.190681, 0, 0.1529412, 1, 1,
0.302695, 0.139659, 2.148636, 0, 0.1490196, 1, 1,
0.3035624, -0.1546121, 3.366533, 0, 0.1411765, 1, 1,
0.3056653, 1.547547, 1.010905, 0, 0.1372549, 1, 1,
0.3077664, 0.4816502, 0.5993211, 0, 0.1294118, 1, 1,
0.310109, 0.6859045, 1.365835, 0, 0.1254902, 1, 1,
0.3174901, -0.688952, 1.958914, 0, 0.1176471, 1, 1,
0.3317725, 2.013749, -0.6939527, 0, 0.1137255, 1, 1,
0.3370692, -0.3457133, 2.772172, 0, 0.1058824, 1, 1,
0.3393331, 1.558774, -0.3167986, 0, 0.09803922, 1, 1,
0.3431908, -0.2769216, 1.495616, 0, 0.09411765, 1, 1,
0.3455372, -0.2261961, 2.512797, 0, 0.08627451, 1, 1,
0.3505001, -0.4690434, 0.5102045, 0, 0.08235294, 1, 1,
0.3515328, 0.8421431, -0.2891766, 0, 0.07450981, 1, 1,
0.3624294, -1.261254, 3.395578, 0, 0.07058824, 1, 1,
0.3644451, -0.2022319, 0.5171028, 0, 0.0627451, 1, 1,
0.364997, 0.6564546, 0.6353502, 0, 0.05882353, 1, 1,
0.3656757, 0.9942788, -0.0840102, 0, 0.05098039, 1, 1,
0.3690157, -1.064673, 4.453418, 0, 0.04705882, 1, 1,
0.3717005, 0.351647, 0.7820885, 0, 0.03921569, 1, 1,
0.3722632, 0.858776, -0.2766594, 0, 0.03529412, 1, 1,
0.3726387, 0.2318326, 2.546803, 0, 0.02745098, 1, 1,
0.3827059, -1.131825, 2.319698, 0, 0.02352941, 1, 1,
0.3881724, 0.8881103, -0.5293266, 0, 0.01568628, 1, 1,
0.3914284, -1.995391, 2.640488, 0, 0.01176471, 1, 1,
0.3959211, -2.04071, 2.722889, 0, 0.003921569, 1, 1,
0.4021513, 0.8663749, 2.089777, 0.003921569, 0, 1, 1,
0.4043261, -0.2751634, 3.021309, 0.007843138, 0, 1, 1,
0.4044132, -0.1427623, 0.990088, 0.01568628, 0, 1, 1,
0.4057392, 0.2605138, 0.6208649, 0.01960784, 0, 1, 1,
0.4076065, -0.8598877, 2.44481, 0.02745098, 0, 1, 1,
0.4107113, -0.6310656, 3.094025, 0.03137255, 0, 1, 1,
0.4137719, -0.5022194, 0.90424, 0.03921569, 0, 1, 1,
0.4163255, 0.2964094, 0.8944361, 0.04313726, 0, 1, 1,
0.4219281, -0.09117836, 1.267838, 0.05098039, 0, 1, 1,
0.4222699, -0.2085977, 2.474636, 0.05490196, 0, 1, 1,
0.4245373, 0.5249719, 1.696072, 0.0627451, 0, 1, 1,
0.429143, -0.8612725, 2.264125, 0.06666667, 0, 1, 1,
0.430584, 1.62003, 2.406625, 0.07450981, 0, 1, 1,
0.4325622, -1.966769, 2.881364, 0.07843138, 0, 1, 1,
0.4326367, 1.378694, 0.9037315, 0.08627451, 0, 1, 1,
0.4328523, -2.319749, 3.276409, 0.09019608, 0, 1, 1,
0.4332879, 1.393784, 1.403563, 0.09803922, 0, 1, 1,
0.4340743, -0.05193847, 1.899053, 0.1058824, 0, 1, 1,
0.4376025, -0.506523, 3.494895, 0.1098039, 0, 1, 1,
0.4407197, 0.0235984, 2.61238, 0.1176471, 0, 1, 1,
0.4415407, 1.66344, -0.1526587, 0.1215686, 0, 1, 1,
0.4424376, -1.051754, 2.575703, 0.1294118, 0, 1, 1,
0.4502341, -0.2037973, 0.7819604, 0.1333333, 0, 1, 1,
0.4519229, 0.09763329, 1.449278, 0.1411765, 0, 1, 1,
0.4551958, -0.9780386, 4.098621, 0.145098, 0, 1, 1,
0.4609126, 2.325137, 0.4596042, 0.1529412, 0, 1, 1,
0.4638659, 1.484803, 0.246455, 0.1568628, 0, 1, 1,
0.4660032, -0.1141954, 2.783413, 0.1647059, 0, 1, 1,
0.4683538, -0.03662084, 2.140575, 0.1686275, 0, 1, 1,
0.4690267, -0.7825707, 2.895524, 0.1764706, 0, 1, 1,
0.4722822, 0.29715, 0.8873727, 0.1803922, 0, 1, 1,
0.4762039, 0.4153374, 0.8799593, 0.1882353, 0, 1, 1,
0.4787596, -0.9683579, 2.778166, 0.1921569, 0, 1, 1,
0.4816204, 0.3058399, 1.802076, 0.2, 0, 1, 1,
0.4824959, -0.9631652, 3.148781, 0.2078431, 0, 1, 1,
0.484409, 1.409238, -0.78088, 0.2117647, 0, 1, 1,
0.4847438, 0.7706035, -0.250427, 0.2196078, 0, 1, 1,
0.4889395, 0.4014767, 1.62733, 0.2235294, 0, 1, 1,
0.4964733, -0.9731957, 2.651358, 0.2313726, 0, 1, 1,
0.5030331, 0.9281029, 0.5670275, 0.2352941, 0, 1, 1,
0.5037581, 1.399844, -0.06717822, 0.2431373, 0, 1, 1,
0.519904, -0.0976448, 0.8196388, 0.2470588, 0, 1, 1,
0.5214745, 0.00730676, 1.675543, 0.254902, 0, 1, 1,
0.5281133, -0.8978057, 3.420533, 0.2588235, 0, 1, 1,
0.5296175, 0.6260006, 0.07114629, 0.2666667, 0, 1, 1,
0.5304345, -0.5553499, 2.555093, 0.2705882, 0, 1, 1,
0.5314851, -0.3253413, 1.967475, 0.2784314, 0, 1, 1,
0.5386377, -0.00954773, 1.419116, 0.282353, 0, 1, 1,
0.5406151, -1.344129, 3.329287, 0.2901961, 0, 1, 1,
0.5433154, 0.0721808, -0.5571977, 0.2941177, 0, 1, 1,
0.5561979, 0.2869967, 1.115798, 0.3019608, 0, 1, 1,
0.5654682, 0.6084077, 1.197424, 0.3098039, 0, 1, 1,
0.5669149, 0.2218969, 1.065619, 0.3137255, 0, 1, 1,
0.5686809, -0.01039503, 1.28313, 0.3215686, 0, 1, 1,
0.5701143, -1.806649, 3.859421, 0.3254902, 0, 1, 1,
0.5728858, 1.290343, 0.2954009, 0.3333333, 0, 1, 1,
0.5752953, -0.1434568, 2.364423, 0.3372549, 0, 1, 1,
0.5796394, 0.437369, 0.4507271, 0.345098, 0, 1, 1,
0.5804107, 0.4627314, -0.4058632, 0.3490196, 0, 1, 1,
0.580673, -0.1172393, 1.681322, 0.3568628, 0, 1, 1,
0.5824102, 0.6808433, 2.881596, 0.3607843, 0, 1, 1,
0.5833365, -0.6657254, 2.51048, 0.3686275, 0, 1, 1,
0.58379, -0.2169498, 3.124576, 0.372549, 0, 1, 1,
0.5895062, 0.2692662, 0.8843278, 0.3803922, 0, 1, 1,
0.6010803, -1.048415, 1.131101, 0.3843137, 0, 1, 1,
0.6054095, 2.146161, -2.031896, 0.3921569, 0, 1, 1,
0.6089694, -0.8700225, 3.335736, 0.3960784, 0, 1, 1,
0.6109799, 0.8302966, -0.1839276, 0.4039216, 0, 1, 1,
0.6129162, -1.794684, 1.518752, 0.4117647, 0, 1, 1,
0.6249521, -0.5111206, 2.84716, 0.4156863, 0, 1, 1,
0.6257254, 1.54134, -1.337735, 0.4235294, 0, 1, 1,
0.6280007, -1.184196, 1.459055, 0.427451, 0, 1, 1,
0.6335686, 0.5533388, 2.176852, 0.4352941, 0, 1, 1,
0.6338309, 0.3272627, 1.848553, 0.4392157, 0, 1, 1,
0.6364972, -0.8337259, 2.058495, 0.4470588, 0, 1, 1,
0.6379677, -1.205374, 3.200648, 0.4509804, 0, 1, 1,
0.6513428, -0.4396495, 3.08314, 0.4588235, 0, 1, 1,
0.6517232, -0.5451589, 1.943079, 0.4627451, 0, 1, 1,
0.6543095, 0.3830024, 0.3294462, 0.4705882, 0, 1, 1,
0.6575251, 1.315266, 0.6263634, 0.4745098, 0, 1, 1,
0.661232, -0.3023008, 2.831545, 0.4823529, 0, 1, 1,
0.6709014, -1.317357, 3.617219, 0.4862745, 0, 1, 1,
0.6722277, 1.606506, 0.01597115, 0.4941176, 0, 1, 1,
0.6763563, -0.3285829, 1.725747, 0.5019608, 0, 1, 1,
0.6773708, 0.9675424, 1.810188, 0.5058824, 0, 1, 1,
0.6784135, -0.0517433, 0.5356101, 0.5137255, 0, 1, 1,
0.6802679, -0.1259207, 3.149165, 0.5176471, 0, 1, 1,
0.6820021, -0.1812266, -0.06050201, 0.5254902, 0, 1, 1,
0.6825484, -1.31632, 5.192732, 0.5294118, 0, 1, 1,
0.6829464, 0.0915692, 0.249486, 0.5372549, 0, 1, 1,
0.6852807, -1.021664, 0.1914439, 0.5411765, 0, 1, 1,
0.687539, 1.024001, -0.003623464, 0.5490196, 0, 1, 1,
0.6875817, -0.2566564, 0.8121012, 0.5529412, 0, 1, 1,
0.6897776, -1.111128, 2.929381, 0.5607843, 0, 1, 1,
0.6903976, 0.3309067, 1.164272, 0.5647059, 0, 1, 1,
0.6942242, 0.7989478, 1.911444, 0.572549, 0, 1, 1,
0.7000893, -1.211892, 1.160228, 0.5764706, 0, 1, 1,
0.7043089, -0.8785778, 3.864845, 0.5843138, 0, 1, 1,
0.7055164, -0.08546083, 1.573336, 0.5882353, 0, 1, 1,
0.7077998, 0.9673954, -0.9493088, 0.5960785, 0, 1, 1,
0.708383, 0.9415169, 0.02747755, 0.6039216, 0, 1, 1,
0.7215237, -0.6342869, 1.567486, 0.6078432, 0, 1, 1,
0.7267998, -0.6012925, 2.486646, 0.6156863, 0, 1, 1,
0.7296813, -0.05314506, 0.9365571, 0.6196079, 0, 1, 1,
0.7311403, -0.9195566, 1.539232, 0.627451, 0, 1, 1,
0.733553, -1.157114, 2.973528, 0.6313726, 0, 1, 1,
0.7338974, 0.5511558, 0.7206165, 0.6392157, 0, 1, 1,
0.7530462, 1.753677, 1.005998, 0.6431373, 0, 1, 1,
0.7590716, -0.1719392, 1.377643, 0.6509804, 0, 1, 1,
0.7598636, 0.8453056, 0.7808263, 0.654902, 0, 1, 1,
0.7630721, -1.360904, 1.90715, 0.6627451, 0, 1, 1,
0.7662302, -1.507423, 2.196222, 0.6666667, 0, 1, 1,
0.7696895, 2.030926, 0.8056174, 0.6745098, 0, 1, 1,
0.7762059, 2.040756, 1.299081, 0.6784314, 0, 1, 1,
0.7795716, 0.7072551, 0.7523745, 0.6862745, 0, 1, 1,
0.7809101, -0.7758318, 3.711152, 0.6901961, 0, 1, 1,
0.7810974, 0.9289511, -0.8991962, 0.6980392, 0, 1, 1,
0.7856413, -1.109299, 2.865928, 0.7058824, 0, 1, 1,
0.7859845, -0.1150572, 0.8652372, 0.7098039, 0, 1, 1,
0.787377, -0.3015867, 1.481865, 0.7176471, 0, 1, 1,
0.8022057, 0.7587577, 0.9807043, 0.7215686, 0, 1, 1,
0.8118389, -0.7890155, 1.084825, 0.7294118, 0, 1, 1,
0.817561, -0.6022264, 2.56531, 0.7333333, 0, 1, 1,
0.8190054, 1.194543, 1.476172, 0.7411765, 0, 1, 1,
0.8198729, 0.1889479, 2.130177, 0.7450981, 0, 1, 1,
0.8217487, 1.116245, 0.1616835, 0.7529412, 0, 1, 1,
0.8225249, -1.276096, 2.913575, 0.7568628, 0, 1, 1,
0.825171, -0.1813927, 1.730191, 0.7647059, 0, 1, 1,
0.8255852, -0.0844185, 2.107052, 0.7686275, 0, 1, 1,
0.8259421, -0.859173, 0.4153219, 0.7764706, 0, 1, 1,
0.826782, 0.6850361, 1.10052, 0.7803922, 0, 1, 1,
0.828969, 0.5503928, 1.541512, 0.7882353, 0, 1, 1,
0.8333815, -0.793721, 2.952527, 0.7921569, 0, 1, 1,
0.8355802, 0.05459787, 1.565823, 0.8, 0, 1, 1,
0.8385273, 0.3158855, -1.298309, 0.8078431, 0, 1, 1,
0.8402835, 0.1873732, 2.018038, 0.8117647, 0, 1, 1,
0.8418106, -2.577454, 1.30688, 0.8196079, 0, 1, 1,
0.8425462, 0.0162543, 0.5736429, 0.8235294, 0, 1, 1,
0.8447989, -0.1736633, 1.151634, 0.8313726, 0, 1, 1,
0.8479578, 0.317812, 0.5626951, 0.8352941, 0, 1, 1,
0.85001, 0.9621913, 0.3190315, 0.8431373, 0, 1, 1,
0.8505204, -1.313937, 2.473522, 0.8470588, 0, 1, 1,
0.8557138, 1.150459, 2.290356, 0.854902, 0, 1, 1,
0.8585631, -1.206316, 3.44011, 0.8588235, 0, 1, 1,
0.8604852, 0.02883349, 2.674666, 0.8666667, 0, 1, 1,
0.8632399, -0.4219239, 3.642761, 0.8705882, 0, 1, 1,
0.8684243, 0.9278004, -0.2299552, 0.8784314, 0, 1, 1,
0.8746688, 1.253481, -1.115458, 0.8823529, 0, 1, 1,
0.8794699, 0.01232194, 2.991998, 0.8901961, 0, 1, 1,
0.884109, 0.887872, 1.934281, 0.8941177, 0, 1, 1,
0.8845543, 1.03391, 1.230167, 0.9019608, 0, 1, 1,
0.8895091, -1.369043, 2.566578, 0.9098039, 0, 1, 1,
0.8897466, 1.144207, 1.061024, 0.9137255, 0, 1, 1,
0.8907323, 1.100496, 2.364814, 0.9215686, 0, 1, 1,
0.8956615, 1.396621, 1.759813, 0.9254902, 0, 1, 1,
0.8982791, -0.1069208, 0.8017015, 0.9333333, 0, 1, 1,
0.9111993, -1.161254, 3.238287, 0.9372549, 0, 1, 1,
0.9150919, 0.8032026, 0.9523726, 0.945098, 0, 1, 1,
0.9229844, 0.04743721, 1.622591, 0.9490196, 0, 1, 1,
0.9230719, -0.3954369, 1.420598, 0.9568627, 0, 1, 1,
0.9249765, -1.406138, 2.615908, 0.9607843, 0, 1, 1,
0.9294693, 0.06542013, 2.411345, 0.9686275, 0, 1, 1,
0.9385875, 2.323756, 0.3839203, 0.972549, 0, 1, 1,
0.9473281, -1.501811, 3.487832, 0.9803922, 0, 1, 1,
0.9519352, -0.8389508, 3.847993, 0.9843137, 0, 1, 1,
0.9539443, -0.3965681, 4.024945, 0.9921569, 0, 1, 1,
0.9589784, -0.7234849, 3.247754, 0.9960784, 0, 1, 1,
0.9635804, 0.5792381, 1.301854, 1, 0, 0.9960784, 1,
0.9650083, 0.4779598, 1.091809, 1, 0, 0.9882353, 1,
0.966385, 0.5351228, 0.4014702, 1, 0, 0.9843137, 1,
0.9665275, -3.387925, 4.123511, 1, 0, 0.9764706, 1,
0.9763558, 0.6006421, 1.385143, 1, 0, 0.972549, 1,
0.9772624, -0.5123038, 3.455106, 1, 0, 0.9647059, 1,
0.9798533, -0.4607998, 2.074607, 1, 0, 0.9607843, 1,
0.9806991, -0.4278771, 1.849682, 1, 0, 0.9529412, 1,
0.9809419, -0.2591962, 1.105194, 1, 0, 0.9490196, 1,
0.9884433, 0.9327898, -0.06015374, 1, 0, 0.9411765, 1,
0.9893152, 0.8807858, 0.05890842, 1, 0, 0.9372549, 1,
0.9947712, 0.1505475, 0.3481957, 1, 0, 0.9294118, 1,
0.9963291, 0.1179772, -0.1678015, 1, 0, 0.9254902, 1,
0.9988062, -0.9429437, 1.752784, 1, 0, 0.9176471, 1,
1.007648, -0.7180734, 2.035719, 1, 0, 0.9137255, 1,
1.018296, -1.39322, 2.301616, 1, 0, 0.9058824, 1,
1.019361, 1.432627, -0.8147675, 1, 0, 0.9019608, 1,
1.022042, 1.863107, -0.9826674, 1, 0, 0.8941177, 1,
1.026008, -0.8120944, 1.346873, 1, 0, 0.8862745, 1,
1.030163, -1.997557, 2.955876, 1, 0, 0.8823529, 1,
1.036812, 0.22274, -0.15318, 1, 0, 0.8745098, 1,
1.037553, -0.6056941, 1.23211, 1, 0, 0.8705882, 1,
1.047922, -1.121625, 3.518623, 1, 0, 0.8627451, 1,
1.049729, -0.6863635, 2.810762, 1, 0, 0.8588235, 1,
1.050235, 0.130683, 1.231603, 1, 0, 0.8509804, 1,
1.057342, 0.373978, 1.015367, 1, 0, 0.8470588, 1,
1.057729, 0.5346591, 1.278808, 1, 0, 0.8392157, 1,
1.064245, -0.04488437, 1.057208, 1, 0, 0.8352941, 1,
1.065742, 0.8418754, 2.240705, 1, 0, 0.827451, 1,
1.070929, -0.2036441, 0.8693855, 1, 0, 0.8235294, 1,
1.077796, 0.3057921, 1.06669, 1, 0, 0.8156863, 1,
1.078454, 0.1284035, 2.441408, 1, 0, 0.8117647, 1,
1.084632, 0.441461, 2.841173, 1, 0, 0.8039216, 1,
1.088404, -0.5582306, 1.134226, 1, 0, 0.7960784, 1,
1.09074, -0.7347463, 3.1232, 1, 0, 0.7921569, 1,
1.09798, 0.8201874, 1.162882, 1, 0, 0.7843137, 1,
1.103642, 0.2618988, -0.4776063, 1, 0, 0.7803922, 1,
1.112756, 0.1885274, 3.758389, 1, 0, 0.772549, 1,
1.11899, 1.856627, -0.4660884, 1, 0, 0.7686275, 1,
1.123988, -0.8744824, 1.405149, 1, 0, 0.7607843, 1,
1.129202, 1.765347, 0.01737377, 1, 0, 0.7568628, 1,
1.134607, -0.197163, 1.524915, 1, 0, 0.7490196, 1,
1.13912, -0.2050003, 2.766716, 1, 0, 0.7450981, 1,
1.142398, -0.4620264, 2.226956, 1, 0, 0.7372549, 1,
1.144212, 0.8361829, 2.547559, 1, 0, 0.7333333, 1,
1.148947, -0.4851871, 3.217337, 1, 0, 0.7254902, 1,
1.150963, -1.177825, 2.790315, 1, 0, 0.7215686, 1,
1.152291, 0.4826887, 2.358381, 1, 0, 0.7137255, 1,
1.155632, 0.5724919, 1.708398, 1, 0, 0.7098039, 1,
1.165683, -0.08695786, 2.385901, 1, 0, 0.7019608, 1,
1.166331, -0.9310984, 4.470203, 1, 0, 0.6941177, 1,
1.167648, -1.235694, 2.479232, 1, 0, 0.6901961, 1,
1.167826, 0.7440905, 1.64584, 1, 0, 0.682353, 1,
1.169118, -0.8466614, 0.1909326, 1, 0, 0.6784314, 1,
1.17697, -0.601395, 2.768844, 1, 0, 0.6705883, 1,
1.177477, -0.06312492, 0.1440422, 1, 0, 0.6666667, 1,
1.18783, 0.8497545, -0.4558108, 1, 0, 0.6588235, 1,
1.19194, 0.1843772, -0.8319158, 1, 0, 0.654902, 1,
1.194064, 0.3839763, 1.162746, 1, 0, 0.6470588, 1,
1.194826, -1.671275, 2.535058, 1, 0, 0.6431373, 1,
1.212915, -0.3163372, 1.636045, 1, 0, 0.6352941, 1,
1.22047, -0.6611267, 2.747876, 1, 0, 0.6313726, 1,
1.223934, 1.282169, 0.3511303, 1, 0, 0.6235294, 1,
1.226258, 1.048865, 0.9989039, 1, 0, 0.6196079, 1,
1.228594, 0.1108953, 3.189376, 1, 0, 0.6117647, 1,
1.229866, -0.8173486, 1.867263, 1, 0, 0.6078432, 1,
1.235234, -0.7912173, -0.6203975, 1, 0, 0.6, 1,
1.238397, -0.8186899, -0.7175131, 1, 0, 0.5921569, 1,
1.239966, -1.814285, 3.698904, 1, 0, 0.5882353, 1,
1.243021, -0.9953365, 2.817626, 1, 0, 0.5803922, 1,
1.243172, 1.132761, 1.157474, 1, 0, 0.5764706, 1,
1.243345, -0.06871502, 1.0696, 1, 0, 0.5686275, 1,
1.249176, -1.931144, 3.222686, 1, 0, 0.5647059, 1,
1.251714, -0.4481024, 2.613426, 1, 0, 0.5568628, 1,
1.252002, 0.6324846, 0.7505788, 1, 0, 0.5529412, 1,
1.262547, -0.9992531, 2.525558, 1, 0, 0.5450981, 1,
1.269007, 0.4433325, 1.997485, 1, 0, 0.5411765, 1,
1.269844, -0.8674307, 1.192105, 1, 0, 0.5333334, 1,
1.274127, 0.2341543, 1.033909, 1, 0, 0.5294118, 1,
1.279452, 0.526575, 0.5318327, 1, 0, 0.5215687, 1,
1.281973, 0.5521994, 1.8352, 1, 0, 0.5176471, 1,
1.300033, 0.1629782, 1.426162, 1, 0, 0.509804, 1,
1.300279, -1.949954, 3.248427, 1, 0, 0.5058824, 1,
1.300841, -0.6316742, 2.959409, 1, 0, 0.4980392, 1,
1.308946, -0.1813344, 1.389867, 1, 0, 0.4901961, 1,
1.318614, 0.5399195, 1.561909, 1, 0, 0.4862745, 1,
1.321889, -0.4450099, 3.478106, 1, 0, 0.4784314, 1,
1.340515, 0.43732, 1.669678, 1, 0, 0.4745098, 1,
1.34159, -0.8991476, 2.589265, 1, 0, 0.4666667, 1,
1.343753, -0.3616624, -0.3698758, 1, 0, 0.4627451, 1,
1.34465, -0.1763854, 1.028983, 1, 0, 0.454902, 1,
1.346458, -0.8625432, 1.055805, 1, 0, 0.4509804, 1,
1.348919, -0.1553838, 0.08189508, 1, 0, 0.4431373, 1,
1.351054, 0.9347311, 1.222318, 1, 0, 0.4392157, 1,
1.358075, 2.40585, 0.3482614, 1, 0, 0.4313726, 1,
1.360375, 0.5106204, 0.1414378, 1, 0, 0.427451, 1,
1.367984, -0.2916088, 2.204402, 1, 0, 0.4196078, 1,
1.373711, -0.4271724, 1.303051, 1, 0, 0.4156863, 1,
1.37373, -1.345865, 1.483243, 1, 0, 0.4078431, 1,
1.381793, -1.086251, 0.52645, 1, 0, 0.4039216, 1,
1.384778, 0.1074641, 1.776795, 1, 0, 0.3960784, 1,
1.392056, -1.451562, 2.68954, 1, 0, 0.3882353, 1,
1.405736, -1.29559, 2.040309, 1, 0, 0.3843137, 1,
1.419242, 1.268302, 0.6996416, 1, 0, 0.3764706, 1,
1.429822, -0.3958874, 1.680995, 1, 0, 0.372549, 1,
1.439972, 0.3648039, 1.959036, 1, 0, 0.3647059, 1,
1.44046, -0.734846, 1.638791, 1, 0, 0.3607843, 1,
1.459865, 1.895034, 2.42665, 1, 0, 0.3529412, 1,
1.469425, 0.2886331, 1.965294, 1, 0, 0.3490196, 1,
1.480484, 1.422722, -0.3067271, 1, 0, 0.3411765, 1,
1.481641, -1.318844, 3.075702, 1, 0, 0.3372549, 1,
1.486688, 0.986163, 0.2545896, 1, 0, 0.3294118, 1,
1.502355, 0.4040298, 3.12043, 1, 0, 0.3254902, 1,
1.511856, -1.516525, 1.018676, 1, 0, 0.3176471, 1,
1.526567, -0.7472846, 1.61251, 1, 0, 0.3137255, 1,
1.529237, -1.175726, 2.955746, 1, 0, 0.3058824, 1,
1.535955, -0.01345975, 3.097456, 1, 0, 0.2980392, 1,
1.561251, -0.9418605, 2.959794, 1, 0, 0.2941177, 1,
1.579293, 1.070917, -0.6838365, 1, 0, 0.2862745, 1,
1.625429, -0.9969633, 1.161612, 1, 0, 0.282353, 1,
1.641379, 1.010924, 0.9602311, 1, 0, 0.2745098, 1,
1.64383, 0.1037082, 0.4862886, 1, 0, 0.2705882, 1,
1.669102, -0.6066402, 4.011752, 1, 0, 0.2627451, 1,
1.687587, 0.2424416, 2.547143, 1, 0, 0.2588235, 1,
1.689598, 0.7607592, 2.816772, 1, 0, 0.2509804, 1,
1.700128, -0.4674706, 1.875057, 1, 0, 0.2470588, 1,
1.703677, -0.6933907, 2.892373, 1, 0, 0.2392157, 1,
1.704196, 0.2691687, 1.942585, 1, 0, 0.2352941, 1,
1.7158, -0.8665434, 1.3759, 1, 0, 0.227451, 1,
1.724595, 0.9175361, 1.393061, 1, 0, 0.2235294, 1,
1.725905, -0.01789891, 2.119867, 1, 0, 0.2156863, 1,
1.73837, 0.2515601, 1.138462, 1, 0, 0.2117647, 1,
1.764764, -1.139288, 2.46442, 1, 0, 0.2039216, 1,
1.789509, -1.2106, 1.877868, 1, 0, 0.1960784, 1,
1.796314, 1.046443, 1.44446, 1, 0, 0.1921569, 1,
1.818824, 0.1187492, 1.915425, 1, 0, 0.1843137, 1,
1.826771, 0.01170666, 2.402292, 1, 0, 0.1803922, 1,
1.831522, 0.02749949, 2.929474, 1, 0, 0.172549, 1,
1.854016, 0.01240868, 0.5321522, 1, 0, 0.1686275, 1,
1.857639, 2.043617, 0.6593172, 1, 0, 0.1607843, 1,
1.891038, 0.6293869, 3.696671, 1, 0, 0.1568628, 1,
1.900722, -1.774314, 2.331938, 1, 0, 0.1490196, 1,
1.902107, 0.3682661, 0.5330707, 1, 0, 0.145098, 1,
1.921374, 1.661083, 0.6706548, 1, 0, 0.1372549, 1,
1.92946, -0.8532665, 2.537, 1, 0, 0.1333333, 1,
1.937837, -0.2428285, 2.418128, 1, 0, 0.1254902, 1,
1.952169, -2.332626, 2.126003, 1, 0, 0.1215686, 1,
1.963206, -0.6399139, 2.161018, 1, 0, 0.1137255, 1,
1.97187, -0.5888276, 0.2453398, 1, 0, 0.1098039, 1,
2.001088, -0.01054995, 0.9050795, 1, 0, 0.1019608, 1,
2.027037, 1.578518, -0.5030764, 1, 0, 0.09411765, 1,
2.094114, -0.4874032, 2.894804, 1, 0, 0.09019608, 1,
2.189438, 1.194743, -0.8771572, 1, 0, 0.08235294, 1,
2.19025, 0.03730984, 2.101525, 1, 0, 0.07843138, 1,
2.198493, 1.417382, 0.1866573, 1, 0, 0.07058824, 1,
2.231326, -0.1335998, 0.8967912, 1, 0, 0.06666667, 1,
2.314554, -0.9425625, 2.539857, 1, 0, 0.05882353, 1,
2.368858, -0.2336058, 1.685459, 1, 0, 0.05490196, 1,
2.498357, -0.7769401, 1.054187, 1, 0, 0.04705882, 1,
2.503545, -0.5887151, 1.132114, 1, 0, 0.04313726, 1,
2.505368, 0.7585073, -0.09694289, 1, 0, 0.03529412, 1,
2.648495, 0.8330746, 2.236042, 1, 0, 0.03137255, 1,
2.72563, -1.017969, 3.277484, 1, 0, 0.02352941, 1,
2.857881, -0.9543483, 1.859008, 1, 0, 0.01960784, 1,
2.889337, -0.1418601, 1.90829, 1, 0, 0.01176471, 1,
3.362047, 0.4306006, 1.261031, 1, 0, 0.007843138, 1
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
0.02788925, -4.576483, -6.887529, 0, -0.5, 0.5, 0.5,
0.02788925, -4.576483, -6.887529, 1, -0.5, 0.5, 0.5,
0.02788925, -4.576483, -6.887529, 1, 1.5, 0.5, 0.5,
0.02788925, -4.576483, -6.887529, 0, 1.5, 0.5, 0.5
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
-4.436548, 0.1181445, -6.887529, 0, -0.5, 0.5, 0.5,
-4.436548, 0.1181445, -6.887529, 1, -0.5, 0.5, 0.5,
-4.436548, 0.1181445, -6.887529, 1, 1.5, 0.5, 0.5,
-4.436548, 0.1181445, -6.887529, 0, 1.5, 0.5, 0.5
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
-4.436548, -4.576483, 0.02802014, 0, -0.5, 0.5, 0.5,
-4.436548, -4.576483, 0.02802014, 1, -0.5, 0.5, 0.5,
-4.436548, -4.576483, 0.02802014, 1, 1.5, 0.5, 0.5,
-4.436548, -4.576483, 0.02802014, 0, 1.5, 0.5, 0.5
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
-3, -3.493107, -5.291634,
3, -3.493107, -5.291634,
-3, -3.493107, -5.291634,
-3, -3.67367, -5.557616,
-2, -3.493107, -5.291634,
-2, -3.67367, -5.557616,
-1, -3.493107, -5.291634,
-1, -3.67367, -5.557616,
0, -3.493107, -5.291634,
0, -3.67367, -5.557616,
1, -3.493107, -5.291634,
1, -3.67367, -5.557616,
2, -3.493107, -5.291634,
2, -3.67367, -5.557616,
3, -3.493107, -5.291634,
3, -3.67367, -5.557616
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
-3, -4.034795, -6.089581, 0, -0.5, 0.5, 0.5,
-3, -4.034795, -6.089581, 1, -0.5, 0.5, 0.5,
-3, -4.034795, -6.089581, 1, 1.5, 0.5, 0.5,
-3, -4.034795, -6.089581, 0, 1.5, 0.5, 0.5,
-2, -4.034795, -6.089581, 0, -0.5, 0.5, 0.5,
-2, -4.034795, -6.089581, 1, -0.5, 0.5, 0.5,
-2, -4.034795, -6.089581, 1, 1.5, 0.5, 0.5,
-2, -4.034795, -6.089581, 0, 1.5, 0.5, 0.5,
-1, -4.034795, -6.089581, 0, -0.5, 0.5, 0.5,
-1, -4.034795, -6.089581, 1, -0.5, 0.5, 0.5,
-1, -4.034795, -6.089581, 1, 1.5, 0.5, 0.5,
-1, -4.034795, -6.089581, 0, 1.5, 0.5, 0.5,
0, -4.034795, -6.089581, 0, -0.5, 0.5, 0.5,
0, -4.034795, -6.089581, 1, -0.5, 0.5, 0.5,
0, -4.034795, -6.089581, 1, 1.5, 0.5, 0.5,
0, -4.034795, -6.089581, 0, 1.5, 0.5, 0.5,
1, -4.034795, -6.089581, 0, -0.5, 0.5, 0.5,
1, -4.034795, -6.089581, 1, -0.5, 0.5, 0.5,
1, -4.034795, -6.089581, 1, 1.5, 0.5, 0.5,
1, -4.034795, -6.089581, 0, 1.5, 0.5, 0.5,
2, -4.034795, -6.089581, 0, -0.5, 0.5, 0.5,
2, -4.034795, -6.089581, 1, -0.5, 0.5, 0.5,
2, -4.034795, -6.089581, 1, 1.5, 0.5, 0.5,
2, -4.034795, -6.089581, 0, 1.5, 0.5, 0.5,
3, -4.034795, -6.089581, 0, -0.5, 0.5, 0.5,
3, -4.034795, -6.089581, 1, -0.5, 0.5, 0.5,
3, -4.034795, -6.089581, 1, 1.5, 0.5, 0.5,
3, -4.034795, -6.089581, 0, 1.5, 0.5, 0.5
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
-3.406293, -2, -5.291634,
-3.406293, 2, -5.291634,
-3.406293, -2, -5.291634,
-3.578002, -2, -5.557616,
-3.406293, 0, -5.291634,
-3.578002, 0, -5.557616,
-3.406293, 2, -5.291634,
-3.578002, 2, -5.557616
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
"0",
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
-3.921421, -2, -6.089581, 0, -0.5, 0.5, 0.5,
-3.921421, -2, -6.089581, 1, -0.5, 0.5, 0.5,
-3.921421, -2, -6.089581, 1, 1.5, 0.5, 0.5,
-3.921421, -2, -6.089581, 0, 1.5, 0.5, 0.5,
-3.921421, 0, -6.089581, 0, -0.5, 0.5, 0.5,
-3.921421, 0, -6.089581, 1, -0.5, 0.5, 0.5,
-3.921421, 0, -6.089581, 1, 1.5, 0.5, 0.5,
-3.921421, 0, -6.089581, 0, 1.5, 0.5, 0.5,
-3.921421, 2, -6.089581, 0, -0.5, 0.5, 0.5,
-3.921421, 2, -6.089581, 1, -0.5, 0.5, 0.5,
-3.921421, 2, -6.089581, 1, 1.5, 0.5, 0.5,
-3.921421, 2, -6.089581, 0, 1.5, 0.5, 0.5
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
-3.406293, -3.493107, -4,
-3.406293, -3.493107, 4,
-3.406293, -3.493107, -4,
-3.578002, -3.67367, -4,
-3.406293, -3.493107, -2,
-3.578002, -3.67367, -2,
-3.406293, -3.493107, 0,
-3.578002, -3.67367, 0,
-3.406293, -3.493107, 2,
-3.578002, -3.67367, 2,
-3.406293, -3.493107, 4,
-3.578002, -3.67367, 4
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
-3.921421, -4.034795, -4, 0, -0.5, 0.5, 0.5,
-3.921421, -4.034795, -4, 1, -0.5, 0.5, 0.5,
-3.921421, -4.034795, -4, 1, 1.5, 0.5, 0.5,
-3.921421, -4.034795, -4, 0, 1.5, 0.5, 0.5,
-3.921421, -4.034795, -2, 0, -0.5, 0.5, 0.5,
-3.921421, -4.034795, -2, 1, -0.5, 0.5, 0.5,
-3.921421, -4.034795, -2, 1, 1.5, 0.5, 0.5,
-3.921421, -4.034795, -2, 0, 1.5, 0.5, 0.5,
-3.921421, -4.034795, 0, 0, -0.5, 0.5, 0.5,
-3.921421, -4.034795, 0, 1, -0.5, 0.5, 0.5,
-3.921421, -4.034795, 0, 1, 1.5, 0.5, 0.5,
-3.921421, -4.034795, 0, 0, 1.5, 0.5, 0.5,
-3.921421, -4.034795, 2, 0, -0.5, 0.5, 0.5,
-3.921421, -4.034795, 2, 1, -0.5, 0.5, 0.5,
-3.921421, -4.034795, 2, 1, 1.5, 0.5, 0.5,
-3.921421, -4.034795, 2, 0, 1.5, 0.5, 0.5,
-3.921421, -4.034795, 4, 0, -0.5, 0.5, 0.5,
-3.921421, -4.034795, 4, 1, -0.5, 0.5, 0.5,
-3.921421, -4.034795, 4, 1, 1.5, 0.5, 0.5,
-3.921421, -4.034795, 4, 0, 1.5, 0.5, 0.5
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
-3.406293, -3.493107, -5.291634,
-3.406293, 3.729396, -5.291634,
-3.406293, -3.493107, 5.347674,
-3.406293, 3.729396, 5.347674,
-3.406293, -3.493107, -5.291634,
-3.406293, -3.493107, 5.347674,
-3.406293, 3.729396, -5.291634,
-3.406293, 3.729396, 5.347674,
-3.406293, -3.493107, -5.291634,
3.462072, -3.493107, -5.291634,
-3.406293, -3.493107, 5.347674,
3.462072, -3.493107, 5.347674,
-3.406293, 3.729396, -5.291634,
3.462072, 3.729396, -5.291634,
-3.406293, 3.729396, 5.347674,
3.462072, 3.729396, 5.347674,
3.462072, -3.493107, -5.291634,
3.462072, 3.729396, -5.291634,
3.462072, -3.493107, 5.347674,
3.462072, 3.729396, 5.347674,
3.462072, -3.493107, -5.291634,
3.462072, -3.493107, 5.347674,
3.462072, 3.729396, -5.291634,
3.462072, 3.729396, 5.347674
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
var radius = 7.784658;
var distance = 34.63482;
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
mvMatrix.translate( -0.02788925, -0.1181445, -0.02802014 );
mvMatrix.scale( 1.225463, 1.165375, 0.7911158 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.63482);
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
gl.drawArrays(gl.LINES, 0, 8);
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
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
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
trichloro-s-triazine<-read.table("trichloro-s-triazine.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-trichloro-s-triazine$V2
```

```
## Error in eval(expr, envir, enclos): object 'trichloro' not found
```

```r
y<-trichloro-s-triazine$V3
```

```
## Error in eval(expr, envir, enclos): object 'trichloro' not found
```

```r
z<-trichloro-s-triazine$V4
```

```
## Error in eval(expr, envir, enclos): object 'trichloro' not found
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
-3.306268, 0.04852248, -3.427584, 0, 0, 1, 1, 1,
-2.946261, -1.630921, -1.432344, 1, 0, 0, 1, 1,
-2.84253, 1.754862, -1.330221, 1, 0, 0, 1, 1,
-2.726708, 1.366956, -1.005587, 1, 0, 0, 1, 1,
-2.479898, -1.479101, -2.422743, 1, 0, 0, 1, 1,
-2.459671, -0.6044181, -3.651633, 1, 0, 0, 1, 1,
-2.454487, 0.3257141, -1.83093, 0, 0, 0, 1, 1,
-2.453675, -0.1457527, -1.811017, 0, 0, 0, 1, 1,
-2.447826, 1.361146, -0.7154644, 0, 0, 0, 1, 1,
-2.393511, -0.5155672, -2.293345, 0, 0, 0, 1, 1,
-2.373454, 0.8183473, -1.028193, 0, 0, 0, 1, 1,
-2.365704, 0.3584786, -1.937288, 0, 0, 0, 1, 1,
-2.29322, -0.7506428, -2.673066, 0, 0, 0, 1, 1,
-2.285933, -0.09357164, -0.03378498, 1, 1, 1, 1, 1,
-2.241532, -0.1886701, -0.7488834, 1, 1, 1, 1, 1,
-2.232836, -0.5161934, -0.2958635, 1, 1, 1, 1, 1,
-2.216623, 0.5214176, -1.376051, 1, 1, 1, 1, 1,
-2.152993, 0.01859995, -1.570466, 1, 1, 1, 1, 1,
-2.137435, -0.3264747, 0.051148, 1, 1, 1, 1, 1,
-2.104688, -0.1052165, -0.9419457, 1, 1, 1, 1, 1,
-2.059496, -0.3790903, -2.14167, 1, 1, 1, 1, 1,
-2.016046, -0.442712, -2.731742, 1, 1, 1, 1, 1,
-1.984119, -0.9011236, -1.89396, 1, 1, 1, 1, 1,
-1.977635, 0.3936095, -0.5253708, 1, 1, 1, 1, 1,
-1.960691, 0.1474422, -3.613557, 1, 1, 1, 1, 1,
-1.925183, -1.832028, -1.860018, 1, 1, 1, 1, 1,
-1.876459, 0.1172454, -1.530385, 1, 1, 1, 1, 1,
-1.875084, 0.35505, 1.377287, 1, 1, 1, 1, 1,
-1.866178, -1.596027, -2.093327, 0, 0, 1, 1, 1,
-1.856645, -0.2385281, -2.349851, 1, 0, 0, 1, 1,
-1.856022, -0.5106386, -1.866263, 1, 0, 0, 1, 1,
-1.852443, -0.1842659, -2.623471, 1, 0, 0, 1, 1,
-1.790731, 0.1977592, -1.581417, 1, 0, 0, 1, 1,
-1.78053, -0.3928037, -0.5759237, 1, 0, 0, 1, 1,
-1.752918, 0.1689828, -0.8499359, 0, 0, 0, 1, 1,
-1.750191, -0.6542622, -1.62875, 0, 0, 0, 1, 1,
-1.710608, 0.1475865, -1.221211, 0, 0, 0, 1, 1,
-1.701465, -0.7008423, -1.093933, 0, 0, 0, 1, 1,
-1.696467, -0.1685603, -2.19164, 0, 0, 0, 1, 1,
-1.693964, 1.656129, 0.4021507, 0, 0, 0, 1, 1,
-1.658917, -1.395005, -3.0079, 0, 0, 0, 1, 1,
-1.634194, -2.486764, -4.023689, 1, 1, 1, 1, 1,
-1.615205, 1.872321, 0.5088329, 1, 1, 1, 1, 1,
-1.610963, -0.6607082, -2.789174, 1, 1, 1, 1, 1,
-1.595389, -0.3535258, -1.580656, 1, 1, 1, 1, 1,
-1.578175, 0.148179, -1.943609, 1, 1, 1, 1, 1,
-1.575707, -1.452171, -2.367577, 1, 1, 1, 1, 1,
-1.563072, -0.7906184, -2.87087, 1, 1, 1, 1, 1,
-1.561957, 0.2762451, -0.7166138, 1, 1, 1, 1, 1,
-1.559494, 0.2728711, -2.370976, 1, 1, 1, 1, 1,
-1.558439, 0.8764473, -0.07473622, 1, 1, 1, 1, 1,
-1.537067, -0.2237934, -3.634248, 1, 1, 1, 1, 1,
-1.532505, 0.2785366, -2.447712, 1, 1, 1, 1, 1,
-1.519643, 0.3306597, -1.151348, 1, 1, 1, 1, 1,
-1.519642, 0.473995, -1.453296, 1, 1, 1, 1, 1,
-1.511071, 0.3127005, -0.46343, 1, 1, 1, 1, 1,
-1.509783, -0.3699546, -2.42578, 0, 0, 1, 1, 1,
-1.497371, -1.014971, -2.406643, 1, 0, 0, 1, 1,
-1.494231, 0.01167656, -1.126003, 1, 0, 0, 1, 1,
-1.49068, -1.410588, -1.375289, 1, 0, 0, 1, 1,
-1.484477, 0.7290077, -1.721269, 1, 0, 0, 1, 1,
-1.462507, -0.8420251, -2.959603, 1, 0, 0, 1, 1,
-1.460633, 0.5763723, -0.9723586, 0, 0, 0, 1, 1,
-1.432676, -0.2652346, -2.886357, 0, 0, 0, 1, 1,
-1.41313, 0.08739934, -1.684667, 0, 0, 0, 1, 1,
-1.410491, -1.696501, -2.121225, 0, 0, 0, 1, 1,
-1.396263, 0.395955, -0.232049, 0, 0, 0, 1, 1,
-1.39251, -0.0521456, -0.580673, 0, 0, 0, 1, 1,
-1.390303, -0.9968514, -1.752649, 0, 0, 0, 1, 1,
-1.385255, 0.4008635, -0.6751701, 1, 1, 1, 1, 1,
-1.371808, 0.9159029, -0.2619844, 1, 1, 1, 1, 1,
-1.371663, -1.550228, -4.191423, 1, 1, 1, 1, 1,
-1.369346, -0.2616424, -1.565809, 1, 1, 1, 1, 1,
-1.36435, -3.280505, -2.529025, 1, 1, 1, 1, 1,
-1.352331, -1.415981, -2.77182, 1, 1, 1, 1, 1,
-1.343748, -0.355555, -2.466216, 1, 1, 1, 1, 1,
-1.342793, 2.366683, 1.00274, 1, 1, 1, 1, 1,
-1.339289, -1.717456, -2.3575, 1, 1, 1, 1, 1,
-1.337655, 0.405523, -2.445002, 1, 1, 1, 1, 1,
-1.336382, -0.1564342, -2.891473, 1, 1, 1, 1, 1,
-1.327996, -0.06754058, -3.432833, 1, 1, 1, 1, 1,
-1.318528, 0.6680408, -0.1975246, 1, 1, 1, 1, 1,
-1.316739, 0.1932774, -1.83334, 1, 1, 1, 1, 1,
-1.296816, -1.107796, -2.934223, 1, 1, 1, 1, 1,
-1.289487, 0.8271929, -0.6133761, 0, 0, 1, 1, 1,
-1.288337, 1.520111, -2.078338, 1, 0, 0, 1, 1,
-1.283594, 0.5595338, -2.024182, 1, 0, 0, 1, 1,
-1.270296, -1.099142, -2.176648, 1, 0, 0, 1, 1,
-1.270223, -1.830918, -0.8923245, 1, 0, 0, 1, 1,
-1.267495, 0.9098595, -1.648808, 1, 0, 0, 1, 1,
-1.261452, -0.4892994, -1.670511, 0, 0, 0, 1, 1,
-1.260527, -0.4826774, -2.308821, 0, 0, 0, 1, 1,
-1.259232, -1.247669, -2.315304, 0, 0, 0, 1, 1,
-1.248122, 1.415405, -0.354014, 0, 0, 0, 1, 1,
-1.232829, -1.467088, -3.316823, 0, 0, 0, 1, 1,
-1.218028, 0.2923626, -2.209916, 0, 0, 0, 1, 1,
-1.216094, 1.966243, -1.552173, 0, 0, 0, 1, 1,
-1.213336, 1.323429, -0.7573075, 1, 1, 1, 1, 1,
-1.212989, -2.986482, -3.039048, 1, 1, 1, 1, 1,
-1.204197, 0.5695613, -0.5565875, 1, 1, 1, 1, 1,
-1.198719, 0.2422962, -0.05506582, 1, 1, 1, 1, 1,
-1.197914, 0.01293695, 0.4944797, 1, 1, 1, 1, 1,
-1.19561, -1.092404, -3.322851, 1, 1, 1, 1, 1,
-1.19433, -0.1938368, -0.6101024, 1, 1, 1, 1, 1,
-1.19119, -0.9343069, -2.621716, 1, 1, 1, 1, 1,
-1.189883, 1.19338, 0.08066532, 1, 1, 1, 1, 1,
-1.189153, 0.4167729, -0.3714558, 1, 1, 1, 1, 1,
-1.180201, -1.16925, -3.640995, 1, 1, 1, 1, 1,
-1.170346, -0.7173546, -3.206151, 1, 1, 1, 1, 1,
-1.163235, 0.9531324, -1.254659, 1, 1, 1, 1, 1,
-1.161413, 0.2286499, -1.574407, 1, 1, 1, 1, 1,
-1.151282, -0.3192818, -0.9583212, 1, 1, 1, 1, 1,
-1.143764, 1.844735, -0.1462022, 0, 0, 1, 1, 1,
-1.135737, 0.05671038, -1.177967, 1, 0, 0, 1, 1,
-1.13438, 1.307335, -1.468521, 1, 0, 0, 1, 1,
-1.131503, 0.264437, 1.271352, 1, 0, 0, 1, 1,
-1.124361, -1.426678, -3.130741, 1, 0, 0, 1, 1,
-1.120562, 1.347505, -2.225639, 1, 0, 0, 1, 1,
-1.12041, -0.5897531, -1.569454, 0, 0, 0, 1, 1,
-1.11766, -0.4126277, -0.7641802, 0, 0, 0, 1, 1,
-1.11646, -0.1373893, -2.158381, 0, 0, 0, 1, 1,
-1.112351, 0.2504542, -1.228785, 0, 0, 0, 1, 1,
-1.110607, 0.440609, -0.5693664, 0, 0, 0, 1, 1,
-1.106588, -1.031914, -2.884129, 0, 0, 0, 1, 1,
-1.102695, 0.8026612, -0.4693726, 0, 0, 0, 1, 1,
-1.098956, -2.215242, -1.686666, 1, 1, 1, 1, 1,
-1.083277, 1.327966, -1.126677, 1, 1, 1, 1, 1,
-1.070169, -0.01275911, -3.375984, 1, 1, 1, 1, 1,
-1.066885, -0.2498072, -1.190278, 1, 1, 1, 1, 1,
-1.065943, 2.237867, 0.4976825, 1, 1, 1, 1, 1,
-1.065864, -0.6239539, -3.193208, 1, 1, 1, 1, 1,
-1.062314, -0.6039331, 0.3995065, 1, 1, 1, 1, 1,
-1.043849, 0.6463051, -0.80808, 1, 1, 1, 1, 1,
-1.04134, -0.3571208, -1.382166, 1, 1, 1, 1, 1,
-1.040473, -0.1322033, -1.457602, 1, 1, 1, 1, 1,
-1.035725, 1.58399, -1.682161, 1, 1, 1, 1, 1,
-1.034154, 2.524976, 0.1363378, 1, 1, 1, 1, 1,
-1.019298, 1.827217, -1.489019, 1, 1, 1, 1, 1,
-1.018716, 0.08215953, -1.454002, 1, 1, 1, 1, 1,
-1.017209, 1.74026, -1.40128, 1, 1, 1, 1, 1,
-1.01604, 0.2703807, -2.421056, 0, 0, 1, 1, 1,
-1.015899, -0.794328, -4.930975, 1, 0, 0, 1, 1,
-1.007347, 0.2877712, -1.421433, 1, 0, 0, 1, 1,
-1.006687, 1.284204, 1.117726, 1, 0, 0, 1, 1,
-1.004301, 1.510457, -1.234944, 1, 0, 0, 1, 1,
-1.003569, -0.1141157, -1.833036, 1, 0, 0, 1, 1,
-1.00287, 1.093624, -2.474555, 0, 0, 0, 1, 1,
-1.002746, -0.9717466, -1.954771, 0, 0, 0, 1, 1,
-1.001003, 0.00259622, -2.630537, 0, 0, 0, 1, 1,
-0.9958186, -0.2905182, -2.7655, 0, 0, 0, 1, 1,
-0.9954727, 3.106212, 0.6942766, 0, 0, 0, 1, 1,
-0.9800037, 0.798326, -2.169245, 0, 0, 0, 1, 1,
-0.9740706, 1.14993, 2.806982, 0, 0, 0, 1, 1,
-0.9704325, 0.08102033, -1.379896, 1, 1, 1, 1, 1,
-0.9686352, -0.2353327, -2.240498, 1, 1, 1, 1, 1,
-0.9647028, -0.2133119, -1.190174, 1, 1, 1, 1, 1,
-0.9620871, 0.8117098, -0.25408, 1, 1, 1, 1, 1,
-0.9571292, 0.1896968, -0.866001, 1, 1, 1, 1, 1,
-0.9570148, -0.4297377, -0.4392181, 1, 1, 1, 1, 1,
-0.9567688, 0.8987631, -0.9442575, 1, 1, 1, 1, 1,
-0.9547018, -1.086748, -3.410898, 1, 1, 1, 1, 1,
-0.9536116, -1.173884, -3.002282, 1, 1, 1, 1, 1,
-0.9513445, -0.1719543, -0.9345023, 1, 1, 1, 1, 1,
-0.9492987, -0.4230462, -2.564743, 1, 1, 1, 1, 1,
-0.9327405, -0.1304548, -2.549239, 1, 1, 1, 1, 1,
-0.9293088, 1.533315, -0.05301926, 1, 1, 1, 1, 1,
-0.9289544, -0.3687246, -3.202029, 1, 1, 1, 1, 1,
-0.9273112, -2.394816, -1.083803, 1, 1, 1, 1, 1,
-0.9265134, -0.3757837, -1.56617, 0, 0, 1, 1, 1,
-0.9243754, -1.212725, -0.7732256, 1, 0, 0, 1, 1,
-0.9214975, -0.7791628, -0.7303277, 1, 0, 0, 1, 1,
-0.914851, 1.264169, 0.2656529, 1, 0, 0, 1, 1,
-0.9138579, -1.805677, -1.698859, 1, 0, 0, 1, 1,
-0.9098443, -0.1366404, 0.1964644, 1, 0, 0, 1, 1,
-0.8966671, 0.9889236, -1.699699, 0, 0, 0, 1, 1,
-0.8963559, 0.4506213, -0.8092278, 0, 0, 0, 1, 1,
-0.8869109, -1.097347, -2.261764, 0, 0, 0, 1, 1,
-0.8858582, -0.2652154, -2.25053, 0, 0, 0, 1, 1,
-0.881291, 1.153273, -0.9892815, 0, 0, 0, 1, 1,
-0.876922, 1.000092, -1.357802, 0, 0, 0, 1, 1,
-0.8705725, 0.23332, -0.4566804, 0, 0, 0, 1, 1,
-0.870572, -1.313912, -1.450205, 1, 1, 1, 1, 1,
-0.8687373, 1.508252, -0.6245314, 1, 1, 1, 1, 1,
-0.8644969, 0.1156049, 0.01831936, 1, 1, 1, 1, 1,
-0.8643432, -1.037352, -1.897781, 1, 1, 1, 1, 1,
-0.8637515, -0.3536304, -3.143264, 1, 1, 1, 1, 1,
-0.8531591, -1.661243, -2.700458, 1, 1, 1, 1, 1,
-0.8510298, -0.5183276, -1.756612, 1, 1, 1, 1, 1,
-0.8503968, -0.3399981, -1.409819, 1, 1, 1, 1, 1,
-0.8472506, 0.08114339, -1.93592, 1, 1, 1, 1, 1,
-0.8455036, 0.2345679, -0.7501835, 1, 1, 1, 1, 1,
-0.8448765, 0.279263, -0.07553481, 1, 1, 1, 1, 1,
-0.8419139, 0.09991755, -2.285403, 1, 1, 1, 1, 1,
-0.841538, 0.8769094, 0.3139554, 1, 1, 1, 1, 1,
-0.8406046, -1.411445, -0.7028633, 1, 1, 1, 1, 1,
-0.8400058, 1.55129, -0.4198127, 1, 1, 1, 1, 1,
-0.8397707, 0.4472102, 1.086353, 0, 0, 1, 1, 1,
-0.8390799, 0.7780181, -1.689987, 1, 0, 0, 1, 1,
-0.8356976, -2.459303, -3.154205, 1, 0, 0, 1, 1,
-0.8352249, -1.997344, -2.159526, 1, 0, 0, 1, 1,
-0.8336493, -0.8483978, -1.110286, 1, 0, 0, 1, 1,
-0.8325789, 2.541572, -0.2187962, 1, 0, 0, 1, 1,
-0.8322193, 0.9161173, 1.139565, 0, 0, 0, 1, 1,
-0.8288941, -0.05437379, -1.19994, 0, 0, 0, 1, 1,
-0.8263184, -1.111773, -2.515956, 0, 0, 0, 1, 1,
-0.8255635, -0.3732707, -1.533335, 0, 0, 0, 1, 1,
-0.8253748, 1.351193, 0.07921905, 0, 0, 0, 1, 1,
-0.8245557, 0.04994955, -1.637377, 0, 0, 0, 1, 1,
-0.8116515, -0.9479498, -3.436868, 0, 0, 0, 1, 1,
-0.8077146, 2.688002, -0.2605706, 1, 1, 1, 1, 1,
-0.8075694, -0.4293608, -1.946477, 1, 1, 1, 1, 1,
-0.8048944, 1.211116, 0.1482041, 1, 1, 1, 1, 1,
-0.8044726, 3.624214, -0.4185892, 1, 1, 1, 1, 1,
-0.8042943, 0.2473276, 0.318735, 1, 1, 1, 1, 1,
-0.8037561, -0.4403013, -2.573395, 1, 1, 1, 1, 1,
-0.8026919, 1.959642, 0.7746317, 1, 1, 1, 1, 1,
-0.8023236, 0.1431526, -1.522848, 1, 1, 1, 1, 1,
-0.7898081, 0.8269345, -1.535995, 1, 1, 1, 1, 1,
-0.7871917, -1.141506, -4.071633, 1, 1, 1, 1, 1,
-0.7817482, 0.9528016, 0.08381215, 1, 1, 1, 1, 1,
-0.7704225, 0.3749059, -0.7702267, 1, 1, 1, 1, 1,
-0.7660556, 0.204476, -2.226177, 1, 1, 1, 1, 1,
-0.7632596, -0.1772861, -1.867865, 1, 1, 1, 1, 1,
-0.7572193, 1.34276, -0.05711486, 1, 1, 1, 1, 1,
-0.753988, 0.7180896, -1.175665, 0, 0, 1, 1, 1,
-0.750035, 0.2523988, -0.1753576, 1, 0, 0, 1, 1,
-0.7483049, -0.8858046, -2.280104, 1, 0, 0, 1, 1,
-0.7419268, -0.9186249, -3.106659, 1, 0, 0, 1, 1,
-0.739934, 0.6406267, -2.025969, 1, 0, 0, 1, 1,
-0.7392938, 0.7547881, 1.153409, 1, 0, 0, 1, 1,
-0.7171722, -0.8389059, -1.482312, 0, 0, 0, 1, 1,
-0.7169698, 0.1379006, -1.626914, 0, 0, 0, 1, 1,
-0.7166121, -0.3599081, -1.991851, 0, 0, 0, 1, 1,
-0.7125716, 1.283006, -0.2650885, 0, 0, 0, 1, 1,
-0.7124885, 0.06209035, -2.556453, 0, 0, 0, 1, 1,
-0.7058494, 0.5659828, -1.649336, 0, 0, 0, 1, 1,
-0.704719, 0.2451991, -2.845484, 0, 0, 0, 1, 1,
-0.70264, 1.49311, -0.8241129, 1, 1, 1, 1, 1,
-0.7019708, -2.109703, -3.600443, 1, 1, 1, 1, 1,
-0.6975292, 0.7542582, -0.4717351, 1, 1, 1, 1, 1,
-0.6953309, -0.4082012, -1.773976, 1, 1, 1, 1, 1,
-0.6926656, 0.2940631, -0.7758129, 1, 1, 1, 1, 1,
-0.6876759, 0.2734302, 0.4138888, 1, 1, 1, 1, 1,
-0.6868716, 0.9312262, -0.5838677, 1, 1, 1, 1, 1,
-0.6797243, -0.2721777, -0.0936061, 1, 1, 1, 1, 1,
-0.675422, 2.206825, -1.059146, 1, 1, 1, 1, 1,
-0.6740916, 0.3631236, 0.4738733, 1, 1, 1, 1, 1,
-0.6673341, -0.3190869, -3.636735, 1, 1, 1, 1, 1,
-0.6641627, 0.2305288, -3.514277, 1, 1, 1, 1, 1,
-0.6578781, -1.190063, -3.271668, 1, 1, 1, 1, 1,
-0.6536715, -1.282962, -3.182907, 1, 1, 1, 1, 1,
-0.6524761, -0.1208991, -1.754187, 1, 1, 1, 1, 1,
-0.6509818, 0.09345572, -3.342468, 0, 0, 1, 1, 1,
-0.6436322, -0.217699, -3.250477, 1, 0, 0, 1, 1,
-0.6395697, -0.1168944, -2.519359, 1, 0, 0, 1, 1,
-0.6388774, 0.2932583, -1.442175, 1, 0, 0, 1, 1,
-0.6365632, 1.382117, -0.08564991, 1, 0, 0, 1, 1,
-0.6339815, -1.416361, -1.969138, 1, 0, 0, 1, 1,
-0.6317708, 0.7385839, -0.369878, 0, 0, 0, 1, 1,
-0.6311027, -0.2268618, -2.436885, 0, 0, 0, 1, 1,
-0.6308708, -1.17618, -3.257813, 0, 0, 0, 1, 1,
-0.6308199, -0.6055492, -2.835162, 0, 0, 0, 1, 1,
-0.6280649, -0.6509205, -1.705884, 0, 0, 0, 1, 1,
-0.6260158, 1.950512, -1.037883, 0, 0, 0, 1, 1,
-0.6225759, 1.282745, -1.152907, 0, 0, 0, 1, 1,
-0.6198011, -0.4520385, -1.84253, 1, 1, 1, 1, 1,
-0.6138011, 0.0136901, -3.191463, 1, 1, 1, 1, 1,
-0.6067544, -1.153952, 0.1582361, 1, 1, 1, 1, 1,
-0.5987051, -0.3665786, -1.157467, 1, 1, 1, 1, 1,
-0.5948187, -0.3579798, -3.402668, 1, 1, 1, 1, 1,
-0.5942577, 0.1050511, -1.300229, 1, 1, 1, 1, 1,
-0.5932112, 0.1228764, -1.591699, 1, 1, 1, 1, 1,
-0.5927094, 0.8928535, 1.062894, 1, 1, 1, 1, 1,
-0.5911579, 0.6643836, -1.867028, 1, 1, 1, 1, 1,
-0.5886428, -0.8597576, -2.164571, 1, 1, 1, 1, 1,
-0.5882928, -0.2020173, -2.75711, 1, 1, 1, 1, 1,
-0.5860019, -1.274853, -2.651012, 1, 1, 1, 1, 1,
-0.5853185, -0.2138822, -3.095108, 1, 1, 1, 1, 1,
-0.5789385, 0.5350233, 0.2928102, 1, 1, 1, 1, 1,
-0.5785383, -0.4618886, 0.2725586, 1, 1, 1, 1, 1,
-0.577159, 0.3938017, -1.725497, 0, 0, 1, 1, 1,
-0.575706, 0.8833371, -0.519923, 1, 0, 0, 1, 1,
-0.5722339, -0.4052829, -1.460438, 1, 0, 0, 1, 1,
-0.5709432, -0.2048821, -1.630585, 1, 0, 0, 1, 1,
-0.5681621, 0.3627167, -0.1144356, 1, 0, 0, 1, 1,
-0.5606628, 0.4923992, -0.9236998, 1, 0, 0, 1, 1,
-0.559916, 0.9842914, -0.195329, 0, 0, 0, 1, 1,
-0.5589736, 0.6921614, -1.301177, 0, 0, 0, 1, 1,
-0.5586751, 0.4644629, -1.639995, 0, 0, 0, 1, 1,
-0.5488831, 0.03834693, -2.073321, 0, 0, 0, 1, 1,
-0.5483993, -0.5762796, -1.674609, 0, 0, 0, 1, 1,
-0.5477301, -1.760343, -3.639577, 0, 0, 0, 1, 1,
-0.5457674, -1.79933, -2.043148, 0, 0, 0, 1, 1,
-0.5433336, 0.255825, -1.335137, 1, 1, 1, 1, 1,
-0.5413836, 0.1572746, -1.772755, 1, 1, 1, 1, 1,
-0.5295507, 0.3033404, -2.012214, 1, 1, 1, 1, 1,
-0.5274345, -0.6562856, -2.397247, 1, 1, 1, 1, 1,
-0.5266843, 1.754113, -1.340629, 1, 1, 1, 1, 1,
-0.5210558, -1.834482, -1.402104, 1, 1, 1, 1, 1,
-0.5191232, 0.05558757, -1.53218, 1, 1, 1, 1, 1,
-0.5174084, -0.3505304, -2.815336, 1, 1, 1, 1, 1,
-0.5152238, 0.4833868, -0.8372787, 1, 1, 1, 1, 1,
-0.5117453, 1.449384, -1.721265, 1, 1, 1, 1, 1,
-0.5093446, 1.265947, -0.8753977, 1, 1, 1, 1, 1,
-0.5087519, 0.8047597, -1.768425, 1, 1, 1, 1, 1,
-0.506695, -0.8585063, -4.051281, 1, 1, 1, 1, 1,
-0.5056745, -1.606621, -1.508241, 1, 1, 1, 1, 1,
-0.5050919, 0.04006854, -0.539126, 1, 1, 1, 1, 1,
-0.5045016, -0.4377306, -3.513396, 0, 0, 1, 1, 1,
-0.4936071, 0.8020633, -1.426009, 1, 0, 0, 1, 1,
-0.4877822, -0.374946, -0.971846, 1, 0, 0, 1, 1,
-0.4873954, 0.05822724, -1.994408, 1, 0, 0, 1, 1,
-0.4837405, 0.7261602, -2.07255, 1, 0, 0, 1, 1,
-0.4813571, -0.1510948, -0.9666001, 1, 0, 0, 1, 1,
-0.4776436, -0.2917321, -2.367834, 0, 0, 0, 1, 1,
-0.4723243, 0.2918389, -0.3744494, 0, 0, 0, 1, 1,
-0.4701884, -0.1782672, -3.439849, 0, 0, 0, 1, 1,
-0.4668812, -0.3639416, -2.143583, 0, 0, 0, 1, 1,
-0.4631856, 1.340711, 0.1821395, 0, 0, 0, 1, 1,
-0.4631391, -0.5334515, -2.869947, 0, 0, 0, 1, 1,
-0.4631118, 0.6927925, 0.7498356, 0, 0, 0, 1, 1,
-0.4601512, -0.6232716, -1.472417, 1, 1, 1, 1, 1,
-0.4588826, 0.5768823, -0.7822353, 1, 1, 1, 1, 1,
-0.4584242, -0.4810458, -2.8038, 1, 1, 1, 1, 1,
-0.455227, 0.17352, -1.140489, 1, 1, 1, 1, 1,
-0.4536093, -0.5968383, -2.672704, 1, 1, 1, 1, 1,
-0.4512869, 1.33972, 0.4438694, 1, 1, 1, 1, 1,
-0.4488474, -0.9455948, -2.022442, 1, 1, 1, 1, 1,
-0.4487906, 0.6417413, -0.1671194, 1, 1, 1, 1, 1,
-0.4459794, 0.1529201, -0.02540097, 1, 1, 1, 1, 1,
-0.4435538, -0.003050513, -0.8007701, 1, 1, 1, 1, 1,
-0.4428838, 1.474563, 1.390779, 1, 1, 1, 1, 1,
-0.4424652, 1.595502, 0.1991466, 1, 1, 1, 1, 1,
-0.4342934, 1.633925, -0.5703006, 1, 1, 1, 1, 1,
-0.4340561, 0.9104834, -1.159503, 1, 1, 1, 1, 1,
-0.4287974, -0.7486482, -2.491919, 1, 1, 1, 1, 1,
-0.4274612, 0.7641517, -0.749915, 0, 0, 1, 1, 1,
-0.4235236, -0.6853921, 0.02714645, 1, 0, 0, 1, 1,
-0.4228379, -0.04683039, -0.886425, 1, 0, 0, 1, 1,
-0.4112317, 1.217451, -0.007320088, 1, 0, 0, 1, 1,
-0.4067212, -0.09213918, -0.6641859, 1, 0, 0, 1, 1,
-0.4065204, 0.8292677, -0.5354987, 1, 0, 0, 1, 1,
-0.4044712, -0.5565112, -1.372413, 0, 0, 0, 1, 1,
-0.4030909, -0.2605, -2.415638, 0, 0, 0, 1, 1,
-0.4009858, -0.5882772, -2.775352, 0, 0, 0, 1, 1,
-0.4004614, 0.277489, -0.847006, 0, 0, 0, 1, 1,
-0.3995268, -0.5177259, -2.048507, 0, 0, 0, 1, 1,
-0.3994463, 1.759949, -1.100236, 0, 0, 0, 1, 1,
-0.3991455, 0.1593111, -2.31744, 0, 0, 0, 1, 1,
-0.3964359, -0.4789442, -2.008123, 1, 1, 1, 1, 1,
-0.3950056, -0.7086326, -3.312047, 1, 1, 1, 1, 1,
-0.3921475, 0.2081415, 0.7558308, 1, 1, 1, 1, 1,
-0.390915, 0.3403305, -0.3170811, 1, 1, 1, 1, 1,
-0.390036, 0.75798, 0.150112, 1, 1, 1, 1, 1,
-0.3865232, -1.472534, -2.266109, 1, 1, 1, 1, 1,
-0.3853475, 1.143758, 1.524543, 1, 1, 1, 1, 1,
-0.3824636, -0.1230477, -2.226645, 1, 1, 1, 1, 1,
-0.382216, 0.8522778, 0.1645482, 1, 1, 1, 1, 1,
-0.3815701, 1.505273, -1.60479, 1, 1, 1, 1, 1,
-0.3809089, -0.3997965, -2.001944, 1, 1, 1, 1, 1,
-0.3744586, 1.45564, -0.3009065, 1, 1, 1, 1, 1,
-0.3725376, -0.8076897, -2.493211, 1, 1, 1, 1, 1,
-0.3689354, -0.1635064, -1.508574, 1, 1, 1, 1, 1,
-0.3669943, 1.236456, -0.01444586, 1, 1, 1, 1, 1,
-0.3606766, 1.68051, 0.5801125, 0, 0, 1, 1, 1,
-0.3600371, 0.531404, 0.1913522, 1, 0, 0, 1, 1,
-0.3549451, -0.1363423, -1.791755, 1, 0, 0, 1, 1,
-0.3542169, -0.01250995, -2.647122, 1, 0, 0, 1, 1,
-0.3541621, 0.3597256, 1.168272, 1, 0, 0, 1, 1,
-0.352483, -0.1603119, -1.562224, 1, 0, 0, 1, 1,
-0.3521278, 2.64831, -0.7403104, 0, 0, 0, 1, 1,
-0.3499194, 0.730499, -0.2919382, 0, 0, 0, 1, 1,
-0.3488463, 0.7011763, -0.4072213, 0, 0, 0, 1, 1,
-0.3447744, 0.4088238, -1.382234, 0, 0, 0, 1, 1,
-0.3422687, 1.747544, -0.6700512, 0, 0, 0, 1, 1,
-0.3390989, 1.440699, -0.9575661, 0, 0, 0, 1, 1,
-0.3351773, -0.606626, -3.451499, 0, 0, 0, 1, 1,
-0.3327971, 0.1254707, -2.270643, 1, 1, 1, 1, 1,
-0.3315765, -0.6773281, -2.648244, 1, 1, 1, 1, 1,
-0.3227069, 0.06633365, 0.5827491, 1, 1, 1, 1, 1,
-0.318794, 0.1333958, -0.4014413, 1, 1, 1, 1, 1,
-0.3154434, 0.4243632, 0.1549632, 1, 1, 1, 1, 1,
-0.3149967, -1.525651, -2.616723, 1, 1, 1, 1, 1,
-0.3104684, 0.6838493, -1.03978, 1, 1, 1, 1, 1,
-0.3040892, 1.489171, 1.455956, 1, 1, 1, 1, 1,
-0.3029802, -0.05555855, -1.156705, 1, 1, 1, 1, 1,
-0.3025071, 0.09049523, -0.196728, 1, 1, 1, 1, 1,
-0.3014434, -0.6593478, -1.057252, 1, 1, 1, 1, 1,
-0.3009667, -0.1069277, -1.143334, 1, 1, 1, 1, 1,
-0.2994305, -1.431419, -3.262583, 1, 1, 1, 1, 1,
-0.2989819, 1.319596, 1.508003, 1, 1, 1, 1, 1,
-0.2941321, -1.780119, -1.492719, 1, 1, 1, 1, 1,
-0.2885567, -1.341315, -2.849154, 0, 0, 1, 1, 1,
-0.282901, -0.1924041, -4.44838, 1, 0, 0, 1, 1,
-0.2804819, -0.2736559, -3.591738, 1, 0, 0, 1, 1,
-0.2788041, 0.8692388, -0.5614967, 1, 0, 0, 1, 1,
-0.2781887, -0.4365956, -2.941376, 1, 0, 0, 1, 1,
-0.2776121, 0.5045529, 0.1939459, 1, 0, 0, 1, 1,
-0.2752521, 0.4771631, -1.059609, 0, 0, 0, 1, 1,
-0.2743693, -0.190621, -1.839914, 0, 0, 0, 1, 1,
-0.2722506, 1.468257, -2.173544, 0, 0, 0, 1, 1,
-0.2588018, -0.3166872, -1.934284, 0, 0, 0, 1, 1,
-0.2586257, 0.1054144, -0.7442233, 0, 0, 0, 1, 1,
-0.255296, 1.110708, -1.162377, 0, 0, 0, 1, 1,
-0.2517553, 0.7067631, -1.001981, 0, 0, 0, 1, 1,
-0.2482091, 0.1486463, -0.8367902, 1, 1, 1, 1, 1,
-0.2457499, 0.2472282, -1.945022, 1, 1, 1, 1, 1,
-0.2453783, -1.393604, -2.865894, 1, 1, 1, 1, 1,
-0.2424949, -0.2693614, -3.077535, 1, 1, 1, 1, 1,
-0.2375669, -0.05720505, -1.235144, 1, 1, 1, 1, 1,
-0.2253294, -0.1661725, -1.804155, 1, 1, 1, 1, 1,
-0.2231307, 0.8453453, 0.7644119, 1, 1, 1, 1, 1,
-0.2218589, 0.02358409, -2.439981, 1, 1, 1, 1, 1,
-0.2210246, -0.6116199, -1.983063, 1, 1, 1, 1, 1,
-0.2185451, -1.221097, -4.857166, 1, 1, 1, 1, 1,
-0.2179263, -1.291961, -2.198067, 1, 1, 1, 1, 1,
-0.2168542, -0.1148833, -1.021041, 1, 1, 1, 1, 1,
-0.2144697, 0.1873042, -0.4454753, 1, 1, 1, 1, 1,
-0.2141105, -1.280265, -1.662325, 1, 1, 1, 1, 1,
-0.2121731, -0.5640354, -0.9081885, 1, 1, 1, 1, 1,
-0.2117282, -0.8460992, -3.919756, 0, 0, 1, 1, 1,
-0.2100024, 1.267875, -0.5548093, 1, 0, 0, 1, 1,
-0.2082505, -0.5457015, -1.944368, 1, 0, 0, 1, 1,
-0.2029977, -0.6307918, -2.257187, 1, 0, 0, 1, 1,
-0.1979038, -0.1907146, -0.2759752, 1, 0, 0, 1, 1,
-0.1930077, -2.778152, -5.136692, 1, 0, 0, 1, 1,
-0.1880901, 0.1673493, -2.046369, 0, 0, 0, 1, 1,
-0.1831086, -0.4242278, -3.962423, 0, 0, 0, 1, 1,
-0.180004, 1.608302, -1.589015, 0, 0, 0, 1, 1,
-0.1778751, -0.328256, -1.605403, 0, 0, 0, 1, 1,
-0.177314, 1.990375, -1.031895, 0, 0, 0, 1, 1,
-0.1762411, 0.3229346, 0.2793905, 0, 0, 0, 1, 1,
-0.1759633, 0.3466002, -1.610753, 0, 0, 0, 1, 1,
-0.1750525, -0.4979392, -2.333089, 1, 1, 1, 1, 1,
-0.1746526, -0.2759084, -1.242347, 1, 1, 1, 1, 1,
-0.1730555, 0.9642988, 1.011524, 1, 1, 1, 1, 1,
-0.16538, 0.463323, -1.076207, 1, 1, 1, 1, 1,
-0.162476, 0.3717603, 0.520281, 1, 1, 1, 1, 1,
-0.1602774, -2.401058, -3.632961, 1, 1, 1, 1, 1,
-0.1554689, -1.116655, -3.397754, 1, 1, 1, 1, 1,
-0.1541816, -0.1205229, -1.113446, 1, 1, 1, 1, 1,
-0.1503629, -0.5686322, -3.443736, 1, 1, 1, 1, 1,
-0.1471471, 0.9756786, 0.189797, 1, 1, 1, 1, 1,
-0.1428287, 0.2656854, -0.9190537, 1, 1, 1, 1, 1,
-0.1426287, 0.1712836, 0.3860581, 1, 1, 1, 1, 1,
-0.1397747, -1.245193, -0.8949928, 1, 1, 1, 1, 1,
-0.1395791, -0.8994058, -2.276546, 1, 1, 1, 1, 1,
-0.1366042, 0.6478114, -0.4061889, 1, 1, 1, 1, 1,
-0.1329582, 0.4911301, 0.5015904, 0, 0, 1, 1, 1,
-0.1303339, 0.1278584, -0.7723588, 1, 0, 0, 1, 1,
-0.1288213, -0.9915671, -3.040295, 1, 0, 0, 1, 1,
-0.1286261, -0.377812, -2.630958, 1, 0, 0, 1, 1,
-0.1215539, -1.691418, -2.38979, 1, 0, 0, 1, 1,
-0.1161649, -0.7337523, -1.909784, 1, 0, 0, 1, 1,
-0.1159348, 0.7167448, -0.3579657, 0, 0, 0, 1, 1,
-0.1139696, 0.2182637, -2.816896, 0, 0, 0, 1, 1,
-0.1096483, 1.053347, -0.5533577, 0, 0, 0, 1, 1,
-0.1085278, -0.0353365, -3.170609, 0, 0, 0, 1, 1,
-0.1078179, -0.630367, -2.566444, 0, 0, 0, 1, 1,
-0.1000179, 1.16858, 1.097877, 0, 0, 0, 1, 1,
-0.09991442, -0.9963816, -4.057112, 0, 0, 0, 1, 1,
-0.09235553, -1.523174, -2.909396, 1, 1, 1, 1, 1,
-0.0910802, 1.56662, 1.013098, 1, 1, 1, 1, 1,
-0.08825739, 0.1583484, -2.462494, 1, 1, 1, 1, 1,
-0.08348512, -0.9429391, -1.760518, 1, 1, 1, 1, 1,
-0.07864365, -0.2047274, -1.850575, 1, 1, 1, 1, 1,
-0.07715628, -0.8858837, -1.647676, 1, 1, 1, 1, 1,
-0.07587842, 0.5010902, 0.487354, 1, 1, 1, 1, 1,
-0.07474809, 1.225561, -1.402132, 1, 1, 1, 1, 1,
-0.07252519, 1.196865, 0.5683044, 1, 1, 1, 1, 1,
-0.0719934, -1.201057, -4.177481, 1, 1, 1, 1, 1,
-0.06849177, 0.1585879, -0.6367427, 1, 1, 1, 1, 1,
-0.06490667, -0.9084392, -1.103379, 1, 1, 1, 1, 1,
-0.06381738, 1.755545, -1.039297, 1, 1, 1, 1, 1,
-0.05758848, 0.2052775, 0.6960371, 1, 1, 1, 1, 1,
-0.05752208, -0.1939797, -4.207275, 1, 1, 1, 1, 1,
-0.05538109, -1.347802, -4.239161, 0, 0, 1, 1, 1,
-0.0524721, 0.1093147, -2.024681, 1, 0, 0, 1, 1,
-0.04708329, 0.2145811, -1.405791, 1, 0, 0, 1, 1,
-0.04282773, 1.084691, 0.6298954, 1, 0, 0, 1, 1,
-0.04220073, 0.8564689, -0.6330274, 1, 0, 0, 1, 1,
-0.0406318, -0.6462514, -2.726695, 1, 0, 0, 1, 1,
-0.03829414, -1.469191, -2.662169, 0, 0, 0, 1, 1,
-0.0375272, -0.352528, -1.696321, 0, 0, 0, 1, 1,
-0.03647202, 0.0776027, 1.49765, 0, 0, 0, 1, 1,
-0.03646947, 0.7878812, -0.4413692, 0, 0, 0, 1, 1,
-0.03617961, -0.7737735, -4.678206, 0, 0, 0, 1, 1,
-0.03435698, 0.5967121, 0.04821137, 0, 0, 0, 1, 1,
-0.03377995, 0.4364404, -1.309698, 0, 0, 0, 1, 1,
-0.0249312, -0.6589437, -2.418881, 1, 1, 1, 1, 1,
-0.02464593, 0.5414506, 1.06657, 1, 1, 1, 1, 1,
-0.02410314, 0.4388934, 0.157097, 1, 1, 1, 1, 1,
-0.02315914, 1.896509, 1.291347, 1, 1, 1, 1, 1,
-0.01969928, 0.2552824, -1.705709, 1, 1, 1, 1, 1,
-0.01801478, -0.5595519, -2.752387, 1, 1, 1, 1, 1,
-0.01699283, -0.7786792, -3.148781, 1, 1, 1, 1, 1,
-0.01647579, -0.3692875, -2.189934, 1, 1, 1, 1, 1,
-0.01387954, -0.6192943, -3.183909, 1, 1, 1, 1, 1,
-0.012584, -0.5970253, -3.536328, 1, 1, 1, 1, 1,
-0.004839777, 1.09325, 0.5227327, 1, 1, 1, 1, 1,
0.0009603631, 0.5345637, -1.728744, 1, 1, 1, 1, 1,
0.001905582, -0.5992506, 1.819329, 1, 1, 1, 1, 1,
0.003479006, -0.7204621, 3.529528, 1, 1, 1, 1, 1,
0.00557813, 1.041493, 0.7486045, 1, 1, 1, 1, 1,
0.006832081, 0.679281, 1.444137, 0, 0, 1, 1, 1,
0.008702616, 0.2704816, 0.1726705, 1, 0, 0, 1, 1,
0.008953428, 0.04894833, -0.5835063, 1, 0, 0, 1, 1,
0.009781526, 1.652943, 2.468879, 1, 0, 0, 1, 1,
0.0105948, -0.4059868, 3.001882, 1, 0, 0, 1, 1,
0.0121915, 1.254463, 1.117686, 1, 0, 0, 1, 1,
0.01924244, 0.8873229, -0.807383, 0, 0, 0, 1, 1,
0.02281373, 1.30235, 1.275744, 0, 0, 0, 1, 1,
0.02284688, -0.14806, 3.244821, 0, 0, 0, 1, 1,
0.02461652, -0.9944026, 2.524338, 0, 0, 0, 1, 1,
0.02577014, -1.677198, 3.074946, 0, 0, 0, 1, 1,
0.0265303, 0.7973748, -1.034924, 0, 0, 0, 1, 1,
0.02763304, 0.4479196, 0.5307559, 0, 0, 0, 1, 1,
0.03041239, -2.370751, 4.124791, 1, 1, 1, 1, 1,
0.03310565, 0.005895916, 2.995766, 1, 1, 1, 1, 1,
0.03331437, -0.4520831, 3.027487, 1, 1, 1, 1, 1,
0.03338686, 0.6698952, -2.016689, 1, 1, 1, 1, 1,
0.03401143, 0.8841379, -0.108082, 1, 1, 1, 1, 1,
0.03700556, 0.6015843, 0.3285885, 1, 1, 1, 1, 1,
0.04065375, 0.8528439, -2.423568, 1, 1, 1, 1, 1,
0.04113435, 2.260421, 0.2309301, 1, 1, 1, 1, 1,
0.04299603, -1.504405, 3.59403, 1, 1, 1, 1, 1,
0.04308695, -0.4736101, 2.279202, 1, 1, 1, 1, 1,
0.04350535, 1.074761, -0.01558677, 1, 1, 1, 1, 1,
0.04413529, -1.953878, 4.961287, 1, 1, 1, 1, 1,
0.04596109, 0.5481091, 0.4054394, 1, 1, 1, 1, 1,
0.04834364, 0.4847316, 1.122692, 1, 1, 1, 1, 1,
0.04841869, 2.251884, 2.580254, 1, 1, 1, 1, 1,
0.05034639, 0.130968, -0.2888288, 0, 0, 1, 1, 1,
0.05324105, -0.4284036, 1.513135, 1, 0, 0, 1, 1,
0.05849713, 0.4698438, -0.3059412, 1, 0, 0, 1, 1,
0.05949995, 0.5522622, 1.211435, 1, 0, 0, 1, 1,
0.06270038, -0.154733, 2.853733, 1, 0, 0, 1, 1,
0.06275586, 0.2609872, 0.21682, 1, 0, 0, 1, 1,
0.06336228, 1.206835, 0.8210129, 0, 0, 0, 1, 1,
0.06641971, 0.6213505, 0.5018477, 0, 0, 0, 1, 1,
0.07293546, 1.405285, -0.01878952, 0, 0, 0, 1, 1,
0.07585055, -0.2084307, 3.303603, 0, 0, 0, 1, 1,
0.07650045, -1.231318, 3.328746, 0, 0, 0, 1, 1,
0.07703584, -0.417285, 2.945309, 0, 0, 0, 1, 1,
0.08305528, -2.303339, 1.609119, 0, 0, 0, 1, 1,
0.08656002, -0.7362164, 3.975881, 1, 1, 1, 1, 1,
0.08729485, 0.3485909, -0.2101555, 1, 1, 1, 1, 1,
0.08905039, 2.760614, -1.036544, 1, 1, 1, 1, 1,
0.09035388, 0.6945917, 1.476905, 1, 1, 1, 1, 1,
0.09102239, -1.410068, 3.496941, 1, 1, 1, 1, 1,
0.09178184, -3.079051, 2.868474, 1, 1, 1, 1, 1,
0.0940453, 0.2479472, -0.2391916, 1, 1, 1, 1, 1,
0.09601121, 1.167259, -1.352692, 1, 1, 1, 1, 1,
0.1001301, -0.07493102, 0.8646478, 1, 1, 1, 1, 1,
0.1005453, 0.1039234, 0.5383645, 1, 1, 1, 1, 1,
0.1011692, 0.7818474, -1.727854, 1, 1, 1, 1, 1,
0.1014289, 0.8247479, 0.2553405, 1, 1, 1, 1, 1,
0.1017758, 0.09592801, 2.033284, 1, 1, 1, 1, 1,
0.1043467, -1.095378, 3.242472, 1, 1, 1, 1, 1,
0.1078538, 1.487302, -0.5203661, 1, 1, 1, 1, 1,
0.1105838, 1.36462, 0.560596, 0, 0, 1, 1, 1,
0.1150918, -0.8227249, 1.935864, 1, 0, 0, 1, 1,
0.1159761, -1.00453, 2.127349, 1, 0, 0, 1, 1,
0.1159954, -0.2545433, 3.323137, 1, 0, 0, 1, 1,
0.116462, -0.9278154, 3.283091, 1, 0, 0, 1, 1,
0.1199048, 0.9929477, -1.035521, 1, 0, 0, 1, 1,
0.1301991, -0.2527795, 2.641727, 0, 0, 0, 1, 1,
0.1312133, 0.983292, 0.3740881, 0, 0, 0, 1, 1,
0.1321538, -0.6179526, -0.5493739, 0, 0, 0, 1, 1,
0.132224, -1.457628, 3.274473, 0, 0, 0, 1, 1,
0.1352226, 0.5274988, -1.247123, 0, 0, 0, 1, 1,
0.1352796, -0.5326422, 1.956661, 0, 0, 0, 1, 1,
0.136119, 0.2012607, 0.6607527, 0, 0, 0, 1, 1,
0.1380294, 1.204256, -0.6950832, 1, 1, 1, 1, 1,
0.1398375, 0.4547797, -0.7439082, 1, 1, 1, 1, 1,
0.1456317, 0.6469128, -0.1965785, 1, 1, 1, 1, 1,
0.1485337, -1.431144, 2.545259, 1, 1, 1, 1, 1,
0.1516743, -0.2734455, 3.361006, 1, 1, 1, 1, 1,
0.1527739, 0.5821518, 0.685312, 1, 1, 1, 1, 1,
0.166032, 0.6024741, -0.970308, 1, 1, 1, 1, 1,
0.166991, 0.1762644, 0.7730247, 1, 1, 1, 1, 1,
0.1698662, -0.9199321, 2.100104, 1, 1, 1, 1, 1,
0.1719693, 1.874595, -0.2717613, 1, 1, 1, 1, 1,
0.1771725, -0.8272232, 2.332215, 1, 1, 1, 1, 1,
0.1776432, -0.4912942, 2.239489, 1, 1, 1, 1, 1,
0.1813034, -1.534294, 4.490465, 1, 1, 1, 1, 1,
0.1861274, 1.189314, -0.1640935, 1, 1, 1, 1, 1,
0.1866878, 0.9736103, 1.49533, 1, 1, 1, 1, 1,
0.1880638, 1.2182, 0.5242068, 0, 0, 1, 1, 1,
0.1881781, 0.6651265, 1.078321, 1, 0, 0, 1, 1,
0.1917264, 1.514162, 0.8971105, 1, 0, 0, 1, 1,
0.1926445, -0.6057901, 2.320146, 1, 0, 0, 1, 1,
0.1937561, -1.475516, 1.585633, 1, 0, 0, 1, 1,
0.1956397, -0.5261236, 3.523054, 1, 0, 0, 1, 1,
0.1965635, -0.7705989, 2.44988, 0, 0, 0, 1, 1,
0.197274, -0.3455844, 3.218218, 0, 0, 0, 1, 1,
0.1986641, -0.6706744, 3.446252, 0, 0, 0, 1, 1,
0.2015719, -1.572401, 2.151186, 0, 0, 0, 1, 1,
0.2066028, 1.335869, 0.3200155, 0, 0, 0, 1, 1,
0.2079315, 1.286793, 1.404769, 0, 0, 0, 1, 1,
0.2088982, -0.6993674, 2.78757, 0, 0, 0, 1, 1,
0.2107214, 1.17792, 0.3972451, 1, 1, 1, 1, 1,
0.2121109, -0.4408696, 2.379263, 1, 1, 1, 1, 1,
0.2129405, -0.06671943, 1.580802, 1, 1, 1, 1, 1,
0.2134346, 0.9575095, -1.240608, 1, 1, 1, 1, 1,
0.2144022, 1.246515, -0.866456, 1, 1, 1, 1, 1,
0.2167364, 0.3681458, 1.057005, 1, 1, 1, 1, 1,
0.2199784, 0.4545703, 0.0706903, 1, 1, 1, 1, 1,
0.2249607, 1.509976, 0.403501, 1, 1, 1, 1, 1,
0.2260188, -1.129189, 1.028286, 1, 1, 1, 1, 1,
0.2278704, 0.09839003, -0.4130177, 1, 1, 1, 1, 1,
0.2279379, -0.09214861, 2.288938, 1, 1, 1, 1, 1,
0.2282804, 0.969435, 0.09375907, 1, 1, 1, 1, 1,
0.233606, 0.2364209, 1.641816, 1, 1, 1, 1, 1,
0.2369924, 1.850854, -0.7342314, 1, 1, 1, 1, 1,
0.2381844, -0.2032785, 1.055568, 1, 1, 1, 1, 1,
0.2439861, 0.2224457, 1.956855, 0, 0, 1, 1, 1,
0.2466034, 0.4878453, 1.221208, 1, 0, 0, 1, 1,
0.2468315, 1.035709, -0.008796182, 1, 0, 0, 1, 1,
0.2483063, 0.2507953, 1.352004, 1, 0, 0, 1, 1,
0.2506554, 0.4863523, -0.8792056, 1, 0, 0, 1, 1,
0.2532839, 0.6654233, 0.7907832, 1, 0, 0, 1, 1,
0.2554766, 0.2321346, 0.7206942, 0, 0, 0, 1, 1,
0.2610241, -0.0004207694, 0.9745234, 0, 0, 0, 1, 1,
0.2616608, -0.9248145, 2.497315, 0, 0, 0, 1, 1,
0.2627602, 1.865892, -0.7081604, 0, 0, 0, 1, 1,
0.2674488, 0.1152363, 3.044768, 0, 0, 0, 1, 1,
0.2703006, 1.050671, 1.054382, 0, 0, 0, 1, 1,
0.2710007, 0.9212777, -0.4044035, 0, 0, 0, 1, 1,
0.2742304, -1.431471, 2.401629, 1, 1, 1, 1, 1,
0.275377, 1.265925, 1.036012, 1, 1, 1, 1, 1,
0.2762437, -1.423018, 2.156803, 1, 1, 1, 1, 1,
0.2767938, -2.064873, 2.04615, 1, 1, 1, 1, 1,
0.2853503, 0.2323036, 0.05920856, 1, 1, 1, 1, 1,
0.2869605, -1.043491, 3.374735, 1, 1, 1, 1, 1,
0.2872345, -1.724973, 2.949083, 1, 1, 1, 1, 1,
0.287668, -0.06666294, 1.066164, 1, 1, 1, 1, 1,
0.290093, 0.5730224, -0.01346092, 1, 1, 1, 1, 1,
0.2925048, 1.096507, 0.7887604, 1, 1, 1, 1, 1,
0.2957966, 0.4239225, 0.5625483, 1, 1, 1, 1, 1,
0.2974368, -0.8768593, 1.112052, 1, 1, 1, 1, 1,
0.2975362, 1.915055, -0.190681, 1, 1, 1, 1, 1,
0.302695, 0.139659, 2.148636, 1, 1, 1, 1, 1,
0.3035624, -0.1546121, 3.366533, 1, 1, 1, 1, 1,
0.3056653, 1.547547, 1.010905, 0, 0, 1, 1, 1,
0.3077664, 0.4816502, 0.5993211, 1, 0, 0, 1, 1,
0.310109, 0.6859045, 1.365835, 1, 0, 0, 1, 1,
0.3174901, -0.688952, 1.958914, 1, 0, 0, 1, 1,
0.3317725, 2.013749, -0.6939527, 1, 0, 0, 1, 1,
0.3370692, -0.3457133, 2.772172, 1, 0, 0, 1, 1,
0.3393331, 1.558774, -0.3167986, 0, 0, 0, 1, 1,
0.3431908, -0.2769216, 1.495616, 0, 0, 0, 1, 1,
0.3455372, -0.2261961, 2.512797, 0, 0, 0, 1, 1,
0.3505001, -0.4690434, 0.5102045, 0, 0, 0, 1, 1,
0.3515328, 0.8421431, -0.2891766, 0, 0, 0, 1, 1,
0.3624294, -1.261254, 3.395578, 0, 0, 0, 1, 1,
0.3644451, -0.2022319, 0.5171028, 0, 0, 0, 1, 1,
0.364997, 0.6564546, 0.6353502, 1, 1, 1, 1, 1,
0.3656757, 0.9942788, -0.0840102, 1, 1, 1, 1, 1,
0.3690157, -1.064673, 4.453418, 1, 1, 1, 1, 1,
0.3717005, 0.351647, 0.7820885, 1, 1, 1, 1, 1,
0.3722632, 0.858776, -0.2766594, 1, 1, 1, 1, 1,
0.3726387, 0.2318326, 2.546803, 1, 1, 1, 1, 1,
0.3827059, -1.131825, 2.319698, 1, 1, 1, 1, 1,
0.3881724, 0.8881103, -0.5293266, 1, 1, 1, 1, 1,
0.3914284, -1.995391, 2.640488, 1, 1, 1, 1, 1,
0.3959211, -2.04071, 2.722889, 1, 1, 1, 1, 1,
0.4021513, 0.8663749, 2.089777, 1, 1, 1, 1, 1,
0.4043261, -0.2751634, 3.021309, 1, 1, 1, 1, 1,
0.4044132, -0.1427623, 0.990088, 1, 1, 1, 1, 1,
0.4057392, 0.2605138, 0.6208649, 1, 1, 1, 1, 1,
0.4076065, -0.8598877, 2.44481, 1, 1, 1, 1, 1,
0.4107113, -0.6310656, 3.094025, 0, 0, 1, 1, 1,
0.4137719, -0.5022194, 0.90424, 1, 0, 0, 1, 1,
0.4163255, 0.2964094, 0.8944361, 1, 0, 0, 1, 1,
0.4219281, -0.09117836, 1.267838, 1, 0, 0, 1, 1,
0.4222699, -0.2085977, 2.474636, 1, 0, 0, 1, 1,
0.4245373, 0.5249719, 1.696072, 1, 0, 0, 1, 1,
0.429143, -0.8612725, 2.264125, 0, 0, 0, 1, 1,
0.430584, 1.62003, 2.406625, 0, 0, 0, 1, 1,
0.4325622, -1.966769, 2.881364, 0, 0, 0, 1, 1,
0.4326367, 1.378694, 0.9037315, 0, 0, 0, 1, 1,
0.4328523, -2.319749, 3.276409, 0, 0, 0, 1, 1,
0.4332879, 1.393784, 1.403563, 0, 0, 0, 1, 1,
0.4340743, -0.05193847, 1.899053, 0, 0, 0, 1, 1,
0.4376025, -0.506523, 3.494895, 1, 1, 1, 1, 1,
0.4407197, 0.0235984, 2.61238, 1, 1, 1, 1, 1,
0.4415407, 1.66344, -0.1526587, 1, 1, 1, 1, 1,
0.4424376, -1.051754, 2.575703, 1, 1, 1, 1, 1,
0.4502341, -0.2037973, 0.7819604, 1, 1, 1, 1, 1,
0.4519229, 0.09763329, 1.449278, 1, 1, 1, 1, 1,
0.4551958, -0.9780386, 4.098621, 1, 1, 1, 1, 1,
0.4609126, 2.325137, 0.4596042, 1, 1, 1, 1, 1,
0.4638659, 1.484803, 0.246455, 1, 1, 1, 1, 1,
0.4660032, -0.1141954, 2.783413, 1, 1, 1, 1, 1,
0.4683538, -0.03662084, 2.140575, 1, 1, 1, 1, 1,
0.4690267, -0.7825707, 2.895524, 1, 1, 1, 1, 1,
0.4722822, 0.29715, 0.8873727, 1, 1, 1, 1, 1,
0.4762039, 0.4153374, 0.8799593, 1, 1, 1, 1, 1,
0.4787596, -0.9683579, 2.778166, 1, 1, 1, 1, 1,
0.4816204, 0.3058399, 1.802076, 0, 0, 1, 1, 1,
0.4824959, -0.9631652, 3.148781, 1, 0, 0, 1, 1,
0.484409, 1.409238, -0.78088, 1, 0, 0, 1, 1,
0.4847438, 0.7706035, -0.250427, 1, 0, 0, 1, 1,
0.4889395, 0.4014767, 1.62733, 1, 0, 0, 1, 1,
0.4964733, -0.9731957, 2.651358, 1, 0, 0, 1, 1,
0.5030331, 0.9281029, 0.5670275, 0, 0, 0, 1, 1,
0.5037581, 1.399844, -0.06717822, 0, 0, 0, 1, 1,
0.519904, -0.0976448, 0.8196388, 0, 0, 0, 1, 1,
0.5214745, 0.00730676, 1.675543, 0, 0, 0, 1, 1,
0.5281133, -0.8978057, 3.420533, 0, 0, 0, 1, 1,
0.5296175, 0.6260006, 0.07114629, 0, 0, 0, 1, 1,
0.5304345, -0.5553499, 2.555093, 0, 0, 0, 1, 1,
0.5314851, -0.3253413, 1.967475, 1, 1, 1, 1, 1,
0.5386377, -0.00954773, 1.419116, 1, 1, 1, 1, 1,
0.5406151, -1.344129, 3.329287, 1, 1, 1, 1, 1,
0.5433154, 0.0721808, -0.5571977, 1, 1, 1, 1, 1,
0.5561979, 0.2869967, 1.115798, 1, 1, 1, 1, 1,
0.5654682, 0.6084077, 1.197424, 1, 1, 1, 1, 1,
0.5669149, 0.2218969, 1.065619, 1, 1, 1, 1, 1,
0.5686809, -0.01039503, 1.28313, 1, 1, 1, 1, 1,
0.5701143, -1.806649, 3.859421, 1, 1, 1, 1, 1,
0.5728858, 1.290343, 0.2954009, 1, 1, 1, 1, 1,
0.5752953, -0.1434568, 2.364423, 1, 1, 1, 1, 1,
0.5796394, 0.437369, 0.4507271, 1, 1, 1, 1, 1,
0.5804107, 0.4627314, -0.4058632, 1, 1, 1, 1, 1,
0.580673, -0.1172393, 1.681322, 1, 1, 1, 1, 1,
0.5824102, 0.6808433, 2.881596, 1, 1, 1, 1, 1,
0.5833365, -0.6657254, 2.51048, 0, 0, 1, 1, 1,
0.58379, -0.2169498, 3.124576, 1, 0, 0, 1, 1,
0.5895062, 0.2692662, 0.8843278, 1, 0, 0, 1, 1,
0.6010803, -1.048415, 1.131101, 1, 0, 0, 1, 1,
0.6054095, 2.146161, -2.031896, 1, 0, 0, 1, 1,
0.6089694, -0.8700225, 3.335736, 1, 0, 0, 1, 1,
0.6109799, 0.8302966, -0.1839276, 0, 0, 0, 1, 1,
0.6129162, -1.794684, 1.518752, 0, 0, 0, 1, 1,
0.6249521, -0.5111206, 2.84716, 0, 0, 0, 1, 1,
0.6257254, 1.54134, -1.337735, 0, 0, 0, 1, 1,
0.6280007, -1.184196, 1.459055, 0, 0, 0, 1, 1,
0.6335686, 0.5533388, 2.176852, 0, 0, 0, 1, 1,
0.6338309, 0.3272627, 1.848553, 0, 0, 0, 1, 1,
0.6364972, -0.8337259, 2.058495, 1, 1, 1, 1, 1,
0.6379677, -1.205374, 3.200648, 1, 1, 1, 1, 1,
0.6513428, -0.4396495, 3.08314, 1, 1, 1, 1, 1,
0.6517232, -0.5451589, 1.943079, 1, 1, 1, 1, 1,
0.6543095, 0.3830024, 0.3294462, 1, 1, 1, 1, 1,
0.6575251, 1.315266, 0.6263634, 1, 1, 1, 1, 1,
0.661232, -0.3023008, 2.831545, 1, 1, 1, 1, 1,
0.6709014, -1.317357, 3.617219, 1, 1, 1, 1, 1,
0.6722277, 1.606506, 0.01597115, 1, 1, 1, 1, 1,
0.6763563, -0.3285829, 1.725747, 1, 1, 1, 1, 1,
0.6773708, 0.9675424, 1.810188, 1, 1, 1, 1, 1,
0.6784135, -0.0517433, 0.5356101, 1, 1, 1, 1, 1,
0.6802679, -0.1259207, 3.149165, 1, 1, 1, 1, 1,
0.6820021, -0.1812266, -0.06050201, 1, 1, 1, 1, 1,
0.6825484, -1.31632, 5.192732, 1, 1, 1, 1, 1,
0.6829464, 0.0915692, 0.249486, 0, 0, 1, 1, 1,
0.6852807, -1.021664, 0.1914439, 1, 0, 0, 1, 1,
0.687539, 1.024001, -0.003623464, 1, 0, 0, 1, 1,
0.6875817, -0.2566564, 0.8121012, 1, 0, 0, 1, 1,
0.6897776, -1.111128, 2.929381, 1, 0, 0, 1, 1,
0.6903976, 0.3309067, 1.164272, 1, 0, 0, 1, 1,
0.6942242, 0.7989478, 1.911444, 0, 0, 0, 1, 1,
0.7000893, -1.211892, 1.160228, 0, 0, 0, 1, 1,
0.7043089, -0.8785778, 3.864845, 0, 0, 0, 1, 1,
0.7055164, -0.08546083, 1.573336, 0, 0, 0, 1, 1,
0.7077998, 0.9673954, -0.9493088, 0, 0, 0, 1, 1,
0.708383, 0.9415169, 0.02747755, 0, 0, 0, 1, 1,
0.7215237, -0.6342869, 1.567486, 0, 0, 0, 1, 1,
0.7267998, -0.6012925, 2.486646, 1, 1, 1, 1, 1,
0.7296813, -0.05314506, 0.9365571, 1, 1, 1, 1, 1,
0.7311403, -0.9195566, 1.539232, 1, 1, 1, 1, 1,
0.733553, -1.157114, 2.973528, 1, 1, 1, 1, 1,
0.7338974, 0.5511558, 0.7206165, 1, 1, 1, 1, 1,
0.7530462, 1.753677, 1.005998, 1, 1, 1, 1, 1,
0.7590716, -0.1719392, 1.377643, 1, 1, 1, 1, 1,
0.7598636, 0.8453056, 0.7808263, 1, 1, 1, 1, 1,
0.7630721, -1.360904, 1.90715, 1, 1, 1, 1, 1,
0.7662302, -1.507423, 2.196222, 1, 1, 1, 1, 1,
0.7696895, 2.030926, 0.8056174, 1, 1, 1, 1, 1,
0.7762059, 2.040756, 1.299081, 1, 1, 1, 1, 1,
0.7795716, 0.7072551, 0.7523745, 1, 1, 1, 1, 1,
0.7809101, -0.7758318, 3.711152, 1, 1, 1, 1, 1,
0.7810974, 0.9289511, -0.8991962, 1, 1, 1, 1, 1,
0.7856413, -1.109299, 2.865928, 0, 0, 1, 1, 1,
0.7859845, -0.1150572, 0.8652372, 1, 0, 0, 1, 1,
0.787377, -0.3015867, 1.481865, 1, 0, 0, 1, 1,
0.8022057, 0.7587577, 0.9807043, 1, 0, 0, 1, 1,
0.8118389, -0.7890155, 1.084825, 1, 0, 0, 1, 1,
0.817561, -0.6022264, 2.56531, 1, 0, 0, 1, 1,
0.8190054, 1.194543, 1.476172, 0, 0, 0, 1, 1,
0.8198729, 0.1889479, 2.130177, 0, 0, 0, 1, 1,
0.8217487, 1.116245, 0.1616835, 0, 0, 0, 1, 1,
0.8225249, -1.276096, 2.913575, 0, 0, 0, 1, 1,
0.825171, -0.1813927, 1.730191, 0, 0, 0, 1, 1,
0.8255852, -0.0844185, 2.107052, 0, 0, 0, 1, 1,
0.8259421, -0.859173, 0.4153219, 0, 0, 0, 1, 1,
0.826782, 0.6850361, 1.10052, 1, 1, 1, 1, 1,
0.828969, 0.5503928, 1.541512, 1, 1, 1, 1, 1,
0.8333815, -0.793721, 2.952527, 1, 1, 1, 1, 1,
0.8355802, 0.05459787, 1.565823, 1, 1, 1, 1, 1,
0.8385273, 0.3158855, -1.298309, 1, 1, 1, 1, 1,
0.8402835, 0.1873732, 2.018038, 1, 1, 1, 1, 1,
0.8418106, -2.577454, 1.30688, 1, 1, 1, 1, 1,
0.8425462, 0.0162543, 0.5736429, 1, 1, 1, 1, 1,
0.8447989, -0.1736633, 1.151634, 1, 1, 1, 1, 1,
0.8479578, 0.317812, 0.5626951, 1, 1, 1, 1, 1,
0.85001, 0.9621913, 0.3190315, 1, 1, 1, 1, 1,
0.8505204, -1.313937, 2.473522, 1, 1, 1, 1, 1,
0.8557138, 1.150459, 2.290356, 1, 1, 1, 1, 1,
0.8585631, -1.206316, 3.44011, 1, 1, 1, 1, 1,
0.8604852, 0.02883349, 2.674666, 1, 1, 1, 1, 1,
0.8632399, -0.4219239, 3.642761, 0, 0, 1, 1, 1,
0.8684243, 0.9278004, -0.2299552, 1, 0, 0, 1, 1,
0.8746688, 1.253481, -1.115458, 1, 0, 0, 1, 1,
0.8794699, 0.01232194, 2.991998, 1, 0, 0, 1, 1,
0.884109, 0.887872, 1.934281, 1, 0, 0, 1, 1,
0.8845543, 1.03391, 1.230167, 1, 0, 0, 1, 1,
0.8895091, -1.369043, 2.566578, 0, 0, 0, 1, 1,
0.8897466, 1.144207, 1.061024, 0, 0, 0, 1, 1,
0.8907323, 1.100496, 2.364814, 0, 0, 0, 1, 1,
0.8956615, 1.396621, 1.759813, 0, 0, 0, 1, 1,
0.8982791, -0.1069208, 0.8017015, 0, 0, 0, 1, 1,
0.9111993, -1.161254, 3.238287, 0, 0, 0, 1, 1,
0.9150919, 0.8032026, 0.9523726, 0, 0, 0, 1, 1,
0.9229844, 0.04743721, 1.622591, 1, 1, 1, 1, 1,
0.9230719, -0.3954369, 1.420598, 1, 1, 1, 1, 1,
0.9249765, -1.406138, 2.615908, 1, 1, 1, 1, 1,
0.9294693, 0.06542013, 2.411345, 1, 1, 1, 1, 1,
0.9385875, 2.323756, 0.3839203, 1, 1, 1, 1, 1,
0.9473281, -1.501811, 3.487832, 1, 1, 1, 1, 1,
0.9519352, -0.8389508, 3.847993, 1, 1, 1, 1, 1,
0.9539443, -0.3965681, 4.024945, 1, 1, 1, 1, 1,
0.9589784, -0.7234849, 3.247754, 1, 1, 1, 1, 1,
0.9635804, 0.5792381, 1.301854, 1, 1, 1, 1, 1,
0.9650083, 0.4779598, 1.091809, 1, 1, 1, 1, 1,
0.966385, 0.5351228, 0.4014702, 1, 1, 1, 1, 1,
0.9665275, -3.387925, 4.123511, 1, 1, 1, 1, 1,
0.9763558, 0.6006421, 1.385143, 1, 1, 1, 1, 1,
0.9772624, -0.5123038, 3.455106, 1, 1, 1, 1, 1,
0.9798533, -0.4607998, 2.074607, 0, 0, 1, 1, 1,
0.9806991, -0.4278771, 1.849682, 1, 0, 0, 1, 1,
0.9809419, -0.2591962, 1.105194, 1, 0, 0, 1, 1,
0.9884433, 0.9327898, -0.06015374, 1, 0, 0, 1, 1,
0.9893152, 0.8807858, 0.05890842, 1, 0, 0, 1, 1,
0.9947712, 0.1505475, 0.3481957, 1, 0, 0, 1, 1,
0.9963291, 0.1179772, -0.1678015, 0, 0, 0, 1, 1,
0.9988062, -0.9429437, 1.752784, 0, 0, 0, 1, 1,
1.007648, -0.7180734, 2.035719, 0, 0, 0, 1, 1,
1.018296, -1.39322, 2.301616, 0, 0, 0, 1, 1,
1.019361, 1.432627, -0.8147675, 0, 0, 0, 1, 1,
1.022042, 1.863107, -0.9826674, 0, 0, 0, 1, 1,
1.026008, -0.8120944, 1.346873, 0, 0, 0, 1, 1,
1.030163, -1.997557, 2.955876, 1, 1, 1, 1, 1,
1.036812, 0.22274, -0.15318, 1, 1, 1, 1, 1,
1.037553, -0.6056941, 1.23211, 1, 1, 1, 1, 1,
1.047922, -1.121625, 3.518623, 1, 1, 1, 1, 1,
1.049729, -0.6863635, 2.810762, 1, 1, 1, 1, 1,
1.050235, 0.130683, 1.231603, 1, 1, 1, 1, 1,
1.057342, 0.373978, 1.015367, 1, 1, 1, 1, 1,
1.057729, 0.5346591, 1.278808, 1, 1, 1, 1, 1,
1.064245, -0.04488437, 1.057208, 1, 1, 1, 1, 1,
1.065742, 0.8418754, 2.240705, 1, 1, 1, 1, 1,
1.070929, -0.2036441, 0.8693855, 1, 1, 1, 1, 1,
1.077796, 0.3057921, 1.06669, 1, 1, 1, 1, 1,
1.078454, 0.1284035, 2.441408, 1, 1, 1, 1, 1,
1.084632, 0.441461, 2.841173, 1, 1, 1, 1, 1,
1.088404, -0.5582306, 1.134226, 1, 1, 1, 1, 1,
1.09074, -0.7347463, 3.1232, 0, 0, 1, 1, 1,
1.09798, 0.8201874, 1.162882, 1, 0, 0, 1, 1,
1.103642, 0.2618988, -0.4776063, 1, 0, 0, 1, 1,
1.112756, 0.1885274, 3.758389, 1, 0, 0, 1, 1,
1.11899, 1.856627, -0.4660884, 1, 0, 0, 1, 1,
1.123988, -0.8744824, 1.405149, 1, 0, 0, 1, 1,
1.129202, 1.765347, 0.01737377, 0, 0, 0, 1, 1,
1.134607, -0.197163, 1.524915, 0, 0, 0, 1, 1,
1.13912, -0.2050003, 2.766716, 0, 0, 0, 1, 1,
1.142398, -0.4620264, 2.226956, 0, 0, 0, 1, 1,
1.144212, 0.8361829, 2.547559, 0, 0, 0, 1, 1,
1.148947, -0.4851871, 3.217337, 0, 0, 0, 1, 1,
1.150963, -1.177825, 2.790315, 0, 0, 0, 1, 1,
1.152291, 0.4826887, 2.358381, 1, 1, 1, 1, 1,
1.155632, 0.5724919, 1.708398, 1, 1, 1, 1, 1,
1.165683, -0.08695786, 2.385901, 1, 1, 1, 1, 1,
1.166331, -0.9310984, 4.470203, 1, 1, 1, 1, 1,
1.167648, -1.235694, 2.479232, 1, 1, 1, 1, 1,
1.167826, 0.7440905, 1.64584, 1, 1, 1, 1, 1,
1.169118, -0.8466614, 0.1909326, 1, 1, 1, 1, 1,
1.17697, -0.601395, 2.768844, 1, 1, 1, 1, 1,
1.177477, -0.06312492, 0.1440422, 1, 1, 1, 1, 1,
1.18783, 0.8497545, -0.4558108, 1, 1, 1, 1, 1,
1.19194, 0.1843772, -0.8319158, 1, 1, 1, 1, 1,
1.194064, 0.3839763, 1.162746, 1, 1, 1, 1, 1,
1.194826, -1.671275, 2.535058, 1, 1, 1, 1, 1,
1.212915, -0.3163372, 1.636045, 1, 1, 1, 1, 1,
1.22047, -0.6611267, 2.747876, 1, 1, 1, 1, 1,
1.223934, 1.282169, 0.3511303, 0, 0, 1, 1, 1,
1.226258, 1.048865, 0.9989039, 1, 0, 0, 1, 1,
1.228594, 0.1108953, 3.189376, 1, 0, 0, 1, 1,
1.229866, -0.8173486, 1.867263, 1, 0, 0, 1, 1,
1.235234, -0.7912173, -0.6203975, 1, 0, 0, 1, 1,
1.238397, -0.8186899, -0.7175131, 1, 0, 0, 1, 1,
1.239966, -1.814285, 3.698904, 0, 0, 0, 1, 1,
1.243021, -0.9953365, 2.817626, 0, 0, 0, 1, 1,
1.243172, 1.132761, 1.157474, 0, 0, 0, 1, 1,
1.243345, -0.06871502, 1.0696, 0, 0, 0, 1, 1,
1.249176, -1.931144, 3.222686, 0, 0, 0, 1, 1,
1.251714, -0.4481024, 2.613426, 0, 0, 0, 1, 1,
1.252002, 0.6324846, 0.7505788, 0, 0, 0, 1, 1,
1.262547, -0.9992531, 2.525558, 1, 1, 1, 1, 1,
1.269007, 0.4433325, 1.997485, 1, 1, 1, 1, 1,
1.269844, -0.8674307, 1.192105, 1, 1, 1, 1, 1,
1.274127, 0.2341543, 1.033909, 1, 1, 1, 1, 1,
1.279452, 0.526575, 0.5318327, 1, 1, 1, 1, 1,
1.281973, 0.5521994, 1.8352, 1, 1, 1, 1, 1,
1.300033, 0.1629782, 1.426162, 1, 1, 1, 1, 1,
1.300279, -1.949954, 3.248427, 1, 1, 1, 1, 1,
1.300841, -0.6316742, 2.959409, 1, 1, 1, 1, 1,
1.308946, -0.1813344, 1.389867, 1, 1, 1, 1, 1,
1.318614, 0.5399195, 1.561909, 1, 1, 1, 1, 1,
1.321889, -0.4450099, 3.478106, 1, 1, 1, 1, 1,
1.340515, 0.43732, 1.669678, 1, 1, 1, 1, 1,
1.34159, -0.8991476, 2.589265, 1, 1, 1, 1, 1,
1.343753, -0.3616624, -0.3698758, 1, 1, 1, 1, 1,
1.34465, -0.1763854, 1.028983, 0, 0, 1, 1, 1,
1.346458, -0.8625432, 1.055805, 1, 0, 0, 1, 1,
1.348919, -0.1553838, 0.08189508, 1, 0, 0, 1, 1,
1.351054, 0.9347311, 1.222318, 1, 0, 0, 1, 1,
1.358075, 2.40585, 0.3482614, 1, 0, 0, 1, 1,
1.360375, 0.5106204, 0.1414378, 1, 0, 0, 1, 1,
1.367984, -0.2916088, 2.204402, 0, 0, 0, 1, 1,
1.373711, -0.4271724, 1.303051, 0, 0, 0, 1, 1,
1.37373, -1.345865, 1.483243, 0, 0, 0, 1, 1,
1.381793, -1.086251, 0.52645, 0, 0, 0, 1, 1,
1.384778, 0.1074641, 1.776795, 0, 0, 0, 1, 1,
1.392056, -1.451562, 2.68954, 0, 0, 0, 1, 1,
1.405736, -1.29559, 2.040309, 0, 0, 0, 1, 1,
1.419242, 1.268302, 0.6996416, 1, 1, 1, 1, 1,
1.429822, -0.3958874, 1.680995, 1, 1, 1, 1, 1,
1.439972, 0.3648039, 1.959036, 1, 1, 1, 1, 1,
1.44046, -0.734846, 1.638791, 1, 1, 1, 1, 1,
1.459865, 1.895034, 2.42665, 1, 1, 1, 1, 1,
1.469425, 0.2886331, 1.965294, 1, 1, 1, 1, 1,
1.480484, 1.422722, -0.3067271, 1, 1, 1, 1, 1,
1.481641, -1.318844, 3.075702, 1, 1, 1, 1, 1,
1.486688, 0.986163, 0.2545896, 1, 1, 1, 1, 1,
1.502355, 0.4040298, 3.12043, 1, 1, 1, 1, 1,
1.511856, -1.516525, 1.018676, 1, 1, 1, 1, 1,
1.526567, -0.7472846, 1.61251, 1, 1, 1, 1, 1,
1.529237, -1.175726, 2.955746, 1, 1, 1, 1, 1,
1.535955, -0.01345975, 3.097456, 1, 1, 1, 1, 1,
1.561251, -0.9418605, 2.959794, 1, 1, 1, 1, 1,
1.579293, 1.070917, -0.6838365, 0, 0, 1, 1, 1,
1.625429, -0.9969633, 1.161612, 1, 0, 0, 1, 1,
1.641379, 1.010924, 0.9602311, 1, 0, 0, 1, 1,
1.64383, 0.1037082, 0.4862886, 1, 0, 0, 1, 1,
1.669102, -0.6066402, 4.011752, 1, 0, 0, 1, 1,
1.687587, 0.2424416, 2.547143, 1, 0, 0, 1, 1,
1.689598, 0.7607592, 2.816772, 0, 0, 0, 1, 1,
1.700128, -0.4674706, 1.875057, 0, 0, 0, 1, 1,
1.703677, -0.6933907, 2.892373, 0, 0, 0, 1, 1,
1.704196, 0.2691687, 1.942585, 0, 0, 0, 1, 1,
1.7158, -0.8665434, 1.3759, 0, 0, 0, 1, 1,
1.724595, 0.9175361, 1.393061, 0, 0, 0, 1, 1,
1.725905, -0.01789891, 2.119867, 0, 0, 0, 1, 1,
1.73837, 0.2515601, 1.138462, 1, 1, 1, 1, 1,
1.764764, -1.139288, 2.46442, 1, 1, 1, 1, 1,
1.789509, -1.2106, 1.877868, 1, 1, 1, 1, 1,
1.796314, 1.046443, 1.44446, 1, 1, 1, 1, 1,
1.818824, 0.1187492, 1.915425, 1, 1, 1, 1, 1,
1.826771, 0.01170666, 2.402292, 1, 1, 1, 1, 1,
1.831522, 0.02749949, 2.929474, 1, 1, 1, 1, 1,
1.854016, 0.01240868, 0.5321522, 1, 1, 1, 1, 1,
1.857639, 2.043617, 0.6593172, 1, 1, 1, 1, 1,
1.891038, 0.6293869, 3.696671, 1, 1, 1, 1, 1,
1.900722, -1.774314, 2.331938, 1, 1, 1, 1, 1,
1.902107, 0.3682661, 0.5330707, 1, 1, 1, 1, 1,
1.921374, 1.661083, 0.6706548, 1, 1, 1, 1, 1,
1.92946, -0.8532665, 2.537, 1, 1, 1, 1, 1,
1.937837, -0.2428285, 2.418128, 1, 1, 1, 1, 1,
1.952169, -2.332626, 2.126003, 0, 0, 1, 1, 1,
1.963206, -0.6399139, 2.161018, 1, 0, 0, 1, 1,
1.97187, -0.5888276, 0.2453398, 1, 0, 0, 1, 1,
2.001088, -0.01054995, 0.9050795, 1, 0, 0, 1, 1,
2.027037, 1.578518, -0.5030764, 1, 0, 0, 1, 1,
2.094114, -0.4874032, 2.894804, 1, 0, 0, 1, 1,
2.189438, 1.194743, -0.8771572, 0, 0, 0, 1, 1,
2.19025, 0.03730984, 2.101525, 0, 0, 0, 1, 1,
2.198493, 1.417382, 0.1866573, 0, 0, 0, 1, 1,
2.231326, -0.1335998, 0.8967912, 0, 0, 0, 1, 1,
2.314554, -0.9425625, 2.539857, 0, 0, 0, 1, 1,
2.368858, -0.2336058, 1.685459, 0, 0, 0, 1, 1,
2.498357, -0.7769401, 1.054187, 0, 0, 0, 1, 1,
2.503545, -0.5887151, 1.132114, 1, 1, 1, 1, 1,
2.505368, 0.7585073, -0.09694289, 1, 1, 1, 1, 1,
2.648495, 0.8330746, 2.236042, 1, 1, 1, 1, 1,
2.72563, -1.017969, 3.277484, 1, 1, 1, 1, 1,
2.857881, -0.9543483, 1.859008, 1, 1, 1, 1, 1,
2.889337, -0.1418601, 1.90829, 1, 1, 1, 1, 1,
3.362047, 0.4306006, 1.261031, 1, 1, 1, 1, 1
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
var radius = 9.658305;
var distance = 33.92439;
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
mvMatrix.translate( -0.02788925, -0.1181445, -0.02802014 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.92439);
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
