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
-3.346479, -0.1504981, -2.7102, 1, 0, 0, 1,
-3.293552, -0.1873363, -0.8357659, 1, 0.007843138, 0, 1,
-2.822408, 2.176348, -2.77268, 1, 0.01176471, 0, 1,
-2.673232, 0.4822203, -2.386687, 1, 0.01960784, 0, 1,
-2.463195, -0.5461024, 0.01046376, 1, 0.02352941, 0, 1,
-2.427863, -1.390955, -2.320837, 1, 0.03137255, 0, 1,
-2.396108, 1.175163, -1.390478, 1, 0.03529412, 0, 1,
-2.344849, -0.1741922, 0.4618005, 1, 0.04313726, 0, 1,
-2.315073, 0.7402584, -1.039753, 1, 0.04705882, 0, 1,
-2.292997, 0.3126569, -1.387007, 1, 0.05490196, 0, 1,
-2.259186, 0.1856729, -2.14695, 1, 0.05882353, 0, 1,
-2.198199, -1.361828, -1.185484, 1, 0.06666667, 0, 1,
-2.184996, 1.410679, -2.787549, 1, 0.07058824, 0, 1,
-2.162935, 0.7258028, -0.3528758, 1, 0.07843138, 0, 1,
-2.119176, 0.2241587, -2.343778, 1, 0.08235294, 0, 1,
-2.104167, 0.009585755, -0.8100007, 1, 0.09019608, 0, 1,
-2.085754, 0.863824, -0.2308025, 1, 0.09411765, 0, 1,
-2.084562, 1.311897, -3.034057, 1, 0.1019608, 0, 1,
-2.050369, 0.9112961, -1.003682, 1, 0.1098039, 0, 1,
-2.027314, -0.8099066, -1.485907, 1, 0.1137255, 0, 1,
-2.013265, -1.538184, -3.262061, 1, 0.1215686, 0, 1,
-1.987949, 0.2500252, -1.193023, 1, 0.1254902, 0, 1,
-1.986168, -1.233147, -2.075466, 1, 0.1333333, 0, 1,
-1.980176, -0.08596791, -1.404257, 1, 0.1372549, 0, 1,
-1.950759, 0.8347478, -1.934496, 1, 0.145098, 0, 1,
-1.950581, 2.568466, -0.1200109, 1, 0.1490196, 0, 1,
-1.949916, 1.645501, -3.659636, 1, 0.1568628, 0, 1,
-1.949513, -1.528075, -2.084214, 1, 0.1607843, 0, 1,
-1.935334, -1.143947, -1.941073, 1, 0.1686275, 0, 1,
-1.900058, -0.731153, -2.350018, 1, 0.172549, 0, 1,
-1.888284, -0.9845268, -3.955191, 1, 0.1803922, 0, 1,
-1.849144, -0.796531, -2.039119, 1, 0.1843137, 0, 1,
-1.820267, -0.2205449, -1.325226, 1, 0.1921569, 0, 1,
-1.809654, -0.8287892, -2.055877, 1, 0.1960784, 0, 1,
-1.808202, -0.07780755, -1.582714, 1, 0.2039216, 0, 1,
-1.798401, -0.1905084, -1.203019, 1, 0.2117647, 0, 1,
-1.792039, -0.465848, -2.442653, 1, 0.2156863, 0, 1,
-1.759399, -1.056865, -1.57844, 1, 0.2235294, 0, 1,
-1.757528, 0.7299193, -1.749026, 1, 0.227451, 0, 1,
-1.756751, -1.679122, -1.77487, 1, 0.2352941, 0, 1,
-1.743845, 0.01721265, -0.8123501, 1, 0.2392157, 0, 1,
-1.739334, 0.7267463, -1.05318, 1, 0.2470588, 0, 1,
-1.738064, -0.86133, -3.633714, 1, 0.2509804, 0, 1,
-1.724491, -0.2327984, -1.756539, 1, 0.2588235, 0, 1,
-1.707021, 0.7545786, -0.9290501, 1, 0.2627451, 0, 1,
-1.69749, 0.6481435, -0.5694991, 1, 0.2705882, 0, 1,
-1.693233, 0.242283, -1.176235, 1, 0.2745098, 0, 1,
-1.683801, 0.8205345, -1.229056, 1, 0.282353, 0, 1,
-1.683323, 1.987139, -2.23771, 1, 0.2862745, 0, 1,
-1.676451, -0.1425191, -1.835522, 1, 0.2941177, 0, 1,
-1.656046, 1.568807, -1.515298, 1, 0.3019608, 0, 1,
-1.634909, 0.4889807, -0.7470559, 1, 0.3058824, 0, 1,
-1.630376, 0.08983273, -1.586956, 1, 0.3137255, 0, 1,
-1.610172, -0.6052283, -2.663439, 1, 0.3176471, 0, 1,
-1.607206, -0.7174473, -2.604767, 1, 0.3254902, 0, 1,
-1.598604, -0.2853208, -3.658998, 1, 0.3294118, 0, 1,
-1.596681, -1.622383, -3.118982, 1, 0.3372549, 0, 1,
-1.588234, 0.4154937, -1.127845, 1, 0.3411765, 0, 1,
-1.580757, 0.2724728, -1.669299, 1, 0.3490196, 0, 1,
-1.56378, 1.194944, -2.506461, 1, 0.3529412, 0, 1,
-1.546938, 0.4879652, -1.791042, 1, 0.3607843, 0, 1,
-1.517041, -0.578001, -1.193926, 1, 0.3647059, 0, 1,
-1.515852, 0.0498312, -1.120705, 1, 0.372549, 0, 1,
-1.511139, -0.2519134, -1.241878, 1, 0.3764706, 0, 1,
-1.509726, 0.1412525, -0.178768, 1, 0.3843137, 0, 1,
-1.506903, -0.992212, -2.499233, 1, 0.3882353, 0, 1,
-1.50247, 0.9683021, -1.613454, 1, 0.3960784, 0, 1,
-1.499168, 1.515042, 0.1794052, 1, 0.4039216, 0, 1,
-1.498356, -0.9418762, -1.723066, 1, 0.4078431, 0, 1,
-1.497894, 0.2389198, -1.279649, 1, 0.4156863, 0, 1,
-1.470799, 1.441404, -1.672111, 1, 0.4196078, 0, 1,
-1.468271, 0.3015078, -1.44955, 1, 0.427451, 0, 1,
-1.464748, 1.576964, -0.6975675, 1, 0.4313726, 0, 1,
-1.464739, 0.3210755, -2.073218, 1, 0.4392157, 0, 1,
-1.458117, 0.4518686, -2.146342, 1, 0.4431373, 0, 1,
-1.453145, 1.461262, -0.509241, 1, 0.4509804, 0, 1,
-1.452325, -0.1701854, 0.3459892, 1, 0.454902, 0, 1,
-1.452211, 0.2658429, -2.761025, 1, 0.4627451, 0, 1,
-1.449433, -0.193974, -0.4756446, 1, 0.4666667, 0, 1,
-1.418045, -1.366946, -2.952603, 1, 0.4745098, 0, 1,
-1.412802, 0.2687671, -2.352838, 1, 0.4784314, 0, 1,
-1.40548, 0.9191939, -0.5225499, 1, 0.4862745, 0, 1,
-1.397675, -0.4977931, -2.0638, 1, 0.4901961, 0, 1,
-1.394963, -0.656619, -1.563852, 1, 0.4980392, 0, 1,
-1.394036, 1.367975, -0.3412221, 1, 0.5058824, 0, 1,
-1.393345, -1.10989, -1.862116, 1, 0.509804, 0, 1,
-1.392099, -0.1414889, -1.564754, 1, 0.5176471, 0, 1,
-1.390238, 0.6029249, -2.002003, 1, 0.5215687, 0, 1,
-1.388316, 0.1434218, -0.1908506, 1, 0.5294118, 0, 1,
-1.377617, 0.07851915, -2.306578, 1, 0.5333334, 0, 1,
-1.363187, 0.7378212, -0.7496852, 1, 0.5411765, 0, 1,
-1.352766, -1.241455, -2.20847, 1, 0.5450981, 0, 1,
-1.344511, -0.7601562, 0.7336122, 1, 0.5529412, 0, 1,
-1.34276, -0.3991933, -2.224661, 1, 0.5568628, 0, 1,
-1.342726, 0.6370066, -1.753475, 1, 0.5647059, 0, 1,
-1.338798, 0.3656592, -2.069306, 1, 0.5686275, 0, 1,
-1.329674, 0.9601967, -1.805234, 1, 0.5764706, 0, 1,
-1.324656, 0.8465461, -1.599316, 1, 0.5803922, 0, 1,
-1.319952, -1.343188, -3.211184, 1, 0.5882353, 0, 1,
-1.318645, -1.310754, -2.493415, 1, 0.5921569, 0, 1,
-1.316027, 0.2228761, -0.751439, 1, 0.6, 0, 1,
-1.308685, 0.2958015, -1.345331, 1, 0.6078432, 0, 1,
-1.303683, -0.270725, -2.664586, 1, 0.6117647, 0, 1,
-1.297868, -1.400578, -2.517653, 1, 0.6196079, 0, 1,
-1.289208, 0.4423039, -2.463983, 1, 0.6235294, 0, 1,
-1.289189, 0.05538667, -0.5959365, 1, 0.6313726, 0, 1,
-1.288116, 1.404057, -0.3060191, 1, 0.6352941, 0, 1,
-1.2876, -1.733575, -3.11671, 1, 0.6431373, 0, 1,
-1.283822, 0.07864452, -2.139732, 1, 0.6470588, 0, 1,
-1.278337, -0.2928427, -1.023013, 1, 0.654902, 0, 1,
-1.277266, 0.996897, -1.553274, 1, 0.6588235, 0, 1,
-1.270597, 0.9731593, 0.08602082, 1, 0.6666667, 0, 1,
-1.265159, 0.2734807, -2.028389, 1, 0.6705883, 0, 1,
-1.263613, 0.6416645, -2.270323, 1, 0.6784314, 0, 1,
-1.250812, -2.411091, -2.819797, 1, 0.682353, 0, 1,
-1.250639, 0.6409879, -0.4734831, 1, 0.6901961, 0, 1,
-1.250329, 0.9628338, -3.574425, 1, 0.6941177, 0, 1,
-1.244921, -1.815939, -1.186557, 1, 0.7019608, 0, 1,
-1.241917, -0.07381278, 0.2425062, 1, 0.7098039, 0, 1,
-1.239026, 1.499845, 0.8127335, 1, 0.7137255, 0, 1,
-1.223952, -0.1434511, 0.05490244, 1, 0.7215686, 0, 1,
-1.221473, -2.062555, -2.332071, 1, 0.7254902, 0, 1,
-1.218794, -0.2705363, -3.122297, 1, 0.7333333, 0, 1,
-1.218624, -0.8473716, -1.460678, 1, 0.7372549, 0, 1,
-1.207798, 1.877184, 0.5350438, 1, 0.7450981, 0, 1,
-1.206109, 0.6021906, -1.620507, 1, 0.7490196, 0, 1,
-1.197198, 0.821263, -1.846984, 1, 0.7568628, 0, 1,
-1.195789, -0.1350291, -1.72325, 1, 0.7607843, 0, 1,
-1.194483, 0.008999814, -2.854744, 1, 0.7686275, 0, 1,
-1.194447, 1.757116, 1.228963, 1, 0.772549, 0, 1,
-1.183966, -0.06700392, -1.30454, 1, 0.7803922, 0, 1,
-1.181068, -0.6789179, -2.451971, 1, 0.7843137, 0, 1,
-1.177867, -0.0573657, -0.3213554, 1, 0.7921569, 0, 1,
-1.139825, 1.033321, -1.15648, 1, 0.7960784, 0, 1,
-1.135717, -0.5268656, -1.859837, 1, 0.8039216, 0, 1,
-1.135462, -0.06608447, -1.441912, 1, 0.8117647, 0, 1,
-1.128286, -2.024959, -1.704362, 1, 0.8156863, 0, 1,
-1.111245, 0.147747, -1.206185, 1, 0.8235294, 0, 1,
-1.104592, 0.2863727, -0.2527768, 1, 0.827451, 0, 1,
-1.092817, -1.055377, -0.9455069, 1, 0.8352941, 0, 1,
-1.09238, -0.8662371, -3.136063, 1, 0.8392157, 0, 1,
-1.088968, -0.1042794, -1.40176, 1, 0.8470588, 0, 1,
-1.088173, 1.212182, -0.2724099, 1, 0.8509804, 0, 1,
-1.08771, -1.7828, -2.335576, 1, 0.8588235, 0, 1,
-1.082655, 0.7590065, -1.577719, 1, 0.8627451, 0, 1,
-1.079254, -0.3689162, -2.744585, 1, 0.8705882, 0, 1,
-1.078636, 1.597779, 0.9151335, 1, 0.8745098, 0, 1,
-1.076773, 0.3162528, -1.513897, 1, 0.8823529, 0, 1,
-1.076211, -0.4360963, -0.9689177, 1, 0.8862745, 0, 1,
-1.076157, 0.7849834, -0.9384009, 1, 0.8941177, 0, 1,
-1.073675, -0.1630462, -3.274503, 1, 0.8980392, 0, 1,
-1.067531, -0.4336781, -2.434927, 1, 0.9058824, 0, 1,
-1.062125, -0.08407412, -1.597475, 1, 0.9137255, 0, 1,
-1.061781, -0.23427, -0.442748, 1, 0.9176471, 0, 1,
-1.059327, 0.01962397, -0.2601743, 1, 0.9254902, 0, 1,
-1.054073, -1.117129, -3.026572, 1, 0.9294118, 0, 1,
-1.052115, -0.8207557, -2.704106, 1, 0.9372549, 0, 1,
-1.051176, -0.394388, -1.538238, 1, 0.9411765, 0, 1,
-1.047987, -0.1544313, -1.665835, 1, 0.9490196, 0, 1,
-1.041712, 0.3996374, -0.8390172, 1, 0.9529412, 0, 1,
-1.038625, 0.2776197, -1.685791, 1, 0.9607843, 0, 1,
-1.038485, 0.4842662, -1.731398, 1, 0.9647059, 0, 1,
-1.036901, 1.13836, -0.8168256, 1, 0.972549, 0, 1,
-1.031491, 0.6863077, -0.1064752, 1, 0.9764706, 0, 1,
-1.025531, -0.5455073, -2.015497, 1, 0.9843137, 0, 1,
-1.020098, 0.6216554, -0.8494358, 1, 0.9882353, 0, 1,
-1.017871, 1.541129, -0.6797362, 1, 0.9960784, 0, 1,
-1.015883, -0.1141889, -3.022354, 0.9960784, 1, 0, 1,
-1.012988, 1.058559, -1.000476, 0.9921569, 1, 0, 1,
-1.001858, -0.7968616, -1.685001, 0.9843137, 1, 0, 1,
-1.000965, -0.6866668, -3.469746, 0.9803922, 1, 0, 1,
-0.9951569, -0.004973498, -1.479498, 0.972549, 1, 0, 1,
-0.9902471, -0.3754497, -3.330292, 0.9686275, 1, 0, 1,
-0.9879438, -1.385331, -3.400669, 0.9607843, 1, 0, 1,
-0.9808662, -0.09639259, -1.490333, 0.9568627, 1, 0, 1,
-0.9751899, 0.08792728, -3.322334, 0.9490196, 1, 0, 1,
-0.9729035, 1.26714, -0.8795511, 0.945098, 1, 0, 1,
-0.9727843, -0.09220162, -2.485828, 0.9372549, 1, 0, 1,
-0.9715641, -1.300374, -3.828943, 0.9333333, 1, 0, 1,
-0.9636505, -2.920732, -3.010453, 0.9254902, 1, 0, 1,
-0.9620258, 0.9061637, -0.2439057, 0.9215686, 1, 0, 1,
-0.9598598, 0.02603024, -0.4551784, 0.9137255, 1, 0, 1,
-0.958533, 1.593676, -0.3625735, 0.9098039, 1, 0, 1,
-0.9546503, 0.7891793, -0.9610219, 0.9019608, 1, 0, 1,
-0.9517065, 0.4691797, -2.678034, 0.8941177, 1, 0, 1,
-0.9432608, -0.08750559, -0.7553008, 0.8901961, 1, 0, 1,
-0.9391826, 1.479519, -2.598993, 0.8823529, 1, 0, 1,
-0.9344196, 0.6049954, -0.2993087, 0.8784314, 1, 0, 1,
-0.9337265, 0.5572435, -1.608245, 0.8705882, 1, 0, 1,
-0.9317356, 0.06852809, -1.795773, 0.8666667, 1, 0, 1,
-0.9233976, 1.279355, 0.5901148, 0.8588235, 1, 0, 1,
-0.9192464, -0.3977551, -2.924126, 0.854902, 1, 0, 1,
-0.918941, 0.4109824, -1.52741, 0.8470588, 1, 0, 1,
-0.9156981, 1.085968, 0.3608466, 0.8431373, 1, 0, 1,
-0.9065719, -1.474171, -3.695428, 0.8352941, 1, 0, 1,
-0.90492, -0.01018163, -1.430535, 0.8313726, 1, 0, 1,
-0.9038751, -0.3975621, -1.896548, 0.8235294, 1, 0, 1,
-0.9019247, 0.630561, -1.3329, 0.8196079, 1, 0, 1,
-0.9018759, -0.6680834, -1.522891, 0.8117647, 1, 0, 1,
-0.9004326, -0.2044343, 0.1813302, 0.8078431, 1, 0, 1,
-0.8993002, 1.588157, -0.05341101, 0.8, 1, 0, 1,
-0.8992698, 0.4415303, -0.4226159, 0.7921569, 1, 0, 1,
-0.8986979, 0.02473515, -1.565211, 0.7882353, 1, 0, 1,
-0.8960403, 0.6767217, -0.1695992, 0.7803922, 1, 0, 1,
-0.8960133, 0.09374002, -1.838683, 0.7764706, 1, 0, 1,
-0.8824603, 0.8848712, -0.8372915, 0.7686275, 1, 0, 1,
-0.8798414, -0.433989, -2.994461, 0.7647059, 1, 0, 1,
-0.8752735, 0.510979, -0.3458115, 0.7568628, 1, 0, 1,
-0.8711594, 1.596073, 1.71244, 0.7529412, 1, 0, 1,
-0.870146, 0.7882833, 1.023647, 0.7450981, 1, 0, 1,
-0.8674883, -0.4996348, -2.423718, 0.7411765, 1, 0, 1,
-0.8592073, 0.00965227, -0.8624101, 0.7333333, 1, 0, 1,
-0.8441612, 1.329874, 0.1504029, 0.7294118, 1, 0, 1,
-0.8408602, 0.3472318, -1.287655, 0.7215686, 1, 0, 1,
-0.8390049, 0.6403243, -0.9846337, 0.7176471, 1, 0, 1,
-0.8275021, -0.702702, -2.307352, 0.7098039, 1, 0, 1,
-0.8243468, 0.1644001, -0.557399, 0.7058824, 1, 0, 1,
-0.8198783, -1.19635, -2.609149, 0.6980392, 1, 0, 1,
-0.8143921, 0.9241853, -1.151654, 0.6901961, 1, 0, 1,
-0.8122351, 1.265595, -3.702399, 0.6862745, 1, 0, 1,
-0.8114004, 0.4327283, 0.5981585, 0.6784314, 1, 0, 1,
-0.8086553, -0.4408036, -1.240193, 0.6745098, 1, 0, 1,
-0.8074331, 0.1711939, -0.915738, 0.6666667, 1, 0, 1,
-0.8071694, 0.03701369, -1.498147, 0.6627451, 1, 0, 1,
-0.8006339, 0.0387712, -2.157564, 0.654902, 1, 0, 1,
-0.7972062, -0.4506487, -1.751053, 0.6509804, 1, 0, 1,
-0.7959323, 1.291084, 1.374799, 0.6431373, 1, 0, 1,
-0.7958604, 1.362386, -0.6719533, 0.6392157, 1, 0, 1,
-0.7941951, 0.1336756, -1.211428, 0.6313726, 1, 0, 1,
-0.7934194, -0.4993355, -1.029234, 0.627451, 1, 0, 1,
-0.7907847, 1.449635, -0.6386738, 0.6196079, 1, 0, 1,
-0.7855675, 0.09153177, -2.163631, 0.6156863, 1, 0, 1,
-0.7793542, -0.3440454, -1.616375, 0.6078432, 1, 0, 1,
-0.7774344, -0.490775, -2.499545, 0.6039216, 1, 0, 1,
-0.7737169, -0.1144772, -2.491343, 0.5960785, 1, 0, 1,
-0.7720079, 0.06869451, -0.7460086, 0.5882353, 1, 0, 1,
-0.7706143, 0.409827, -0.7948315, 0.5843138, 1, 0, 1,
-0.7704068, 0.2404653, -1.239112, 0.5764706, 1, 0, 1,
-0.7698081, 0.4775277, -1.43286, 0.572549, 1, 0, 1,
-0.7682322, 0.403063, -2.690947, 0.5647059, 1, 0, 1,
-0.762921, -1.82432, -2.075192, 0.5607843, 1, 0, 1,
-0.7628153, 1.115057, 0.624343, 0.5529412, 1, 0, 1,
-0.7582567, 0.6654994, -1.507528, 0.5490196, 1, 0, 1,
-0.7562994, -0.8208248, -2.775426, 0.5411765, 1, 0, 1,
-0.7544839, 0.7577758, -0.8126939, 0.5372549, 1, 0, 1,
-0.7542823, 0.8072566, -0.4322782, 0.5294118, 1, 0, 1,
-0.7522939, 1.41653, -1.534612, 0.5254902, 1, 0, 1,
-0.745957, 0.2509093, -1.351536, 0.5176471, 1, 0, 1,
-0.7435703, 0.1821344, -1.381738, 0.5137255, 1, 0, 1,
-0.7420376, -0.08051596, -3.242818, 0.5058824, 1, 0, 1,
-0.7395874, 0.8616331, -0.3245959, 0.5019608, 1, 0, 1,
-0.7388591, 0.9176877, -0.4696069, 0.4941176, 1, 0, 1,
-0.7342241, -1.234667, -1.583818, 0.4862745, 1, 0, 1,
-0.7341244, -0.5630295, -2.990746, 0.4823529, 1, 0, 1,
-0.7317747, 0.6482098, -0.6780826, 0.4745098, 1, 0, 1,
-0.7314112, -0.5358288, -3.574636, 0.4705882, 1, 0, 1,
-0.7305998, -0.4388114, -2.253283, 0.4627451, 1, 0, 1,
-0.7289997, -0.8657554, -0.9042135, 0.4588235, 1, 0, 1,
-0.7253509, -0.3194303, -2.055021, 0.4509804, 1, 0, 1,
-0.7225301, 0.06094995, -1.382701, 0.4470588, 1, 0, 1,
-0.707762, 1.248139, -0.1368383, 0.4392157, 1, 0, 1,
-0.7011985, -0.582741, -2.216648, 0.4352941, 1, 0, 1,
-0.6986799, 0.4338425, -1.500204, 0.427451, 1, 0, 1,
-0.6909198, 1.805103, -0.239666, 0.4235294, 1, 0, 1,
-0.6899133, 1.505863, -0.5757834, 0.4156863, 1, 0, 1,
-0.6897742, 0.6116387, 1.306498, 0.4117647, 1, 0, 1,
-0.6875467, 0.1168721, -0.9094948, 0.4039216, 1, 0, 1,
-0.6866415, 0.7257317, -2.035664, 0.3960784, 1, 0, 1,
-0.6866335, -0.07731717, -3.093905, 0.3921569, 1, 0, 1,
-0.6854196, 0.6772997, 1.504703, 0.3843137, 1, 0, 1,
-0.6805246, 1.017175, -0.1488255, 0.3803922, 1, 0, 1,
-0.680351, -0.3402883, -2.140877, 0.372549, 1, 0, 1,
-0.675477, 1.437147, 1.57194, 0.3686275, 1, 0, 1,
-0.6718382, 1.011675, -1.332941, 0.3607843, 1, 0, 1,
-0.6474231, -0.7616643, -3.20615, 0.3568628, 1, 0, 1,
-0.64707, -0.0358247, -0.9299234, 0.3490196, 1, 0, 1,
-0.6445466, -1.604494, -2.180705, 0.345098, 1, 0, 1,
-0.6441264, 0.6145505, -0.3633699, 0.3372549, 1, 0, 1,
-0.643679, 0.03583349, -0.2898458, 0.3333333, 1, 0, 1,
-0.6406067, -0.8106587, -3.132608, 0.3254902, 1, 0, 1,
-0.6272794, 0.2201238, 0.1198727, 0.3215686, 1, 0, 1,
-0.6261618, 0.38821, -0.7189769, 0.3137255, 1, 0, 1,
-0.6259184, -0.3167705, 0.06669904, 0.3098039, 1, 0, 1,
-0.6218078, -0.2704106, -3.584318, 0.3019608, 1, 0, 1,
-0.6215907, -0.6301463, -3.257171, 0.2941177, 1, 0, 1,
-0.6206672, 0.02719453, -3.04881, 0.2901961, 1, 0, 1,
-0.6204742, -0.1511539, -0.904741, 0.282353, 1, 0, 1,
-0.6135822, 0.9400647, -0.9939116, 0.2784314, 1, 0, 1,
-0.6103376, -0.9942199, -3.388282, 0.2705882, 1, 0, 1,
-0.6073773, 1.489368, -1.774587, 0.2666667, 1, 0, 1,
-0.6064374, -1.053558, -2.674669, 0.2588235, 1, 0, 1,
-0.6009094, -0.914781, -2.521077, 0.254902, 1, 0, 1,
-0.5976886, -0.586965, -2.46432, 0.2470588, 1, 0, 1,
-0.5958906, -0.7961709, -3.876936, 0.2431373, 1, 0, 1,
-0.5935224, 1.179505, -2.127854, 0.2352941, 1, 0, 1,
-0.5927949, -0.3006261, -2.555938, 0.2313726, 1, 0, 1,
-0.5909199, 1.378362, 0.6394736, 0.2235294, 1, 0, 1,
-0.5899822, 2.171221, -2.001446, 0.2196078, 1, 0, 1,
-0.5867535, 0.09224136, -0.900422, 0.2117647, 1, 0, 1,
-0.5860524, -1.096794, -3.40029, 0.2078431, 1, 0, 1,
-0.5824667, -1.67767, -2.141304, 0.2, 1, 0, 1,
-0.5793313, -0.7440338, -1.87022, 0.1921569, 1, 0, 1,
-0.5772275, 0.6597406, -0.8410263, 0.1882353, 1, 0, 1,
-0.5661056, -1.831684, -1.758391, 0.1803922, 1, 0, 1,
-0.5623962, 0.4047928, 0.2992996, 0.1764706, 1, 0, 1,
-0.5623289, 0.9628962, 1.309764, 0.1686275, 1, 0, 1,
-0.56074, -1.359335, -1.804495, 0.1647059, 1, 0, 1,
-0.5575728, -0.5009299, -2.196303, 0.1568628, 1, 0, 1,
-0.5574421, 0.5882175, -1.247534, 0.1529412, 1, 0, 1,
-0.5567302, -0.6610851, -1.917014, 0.145098, 1, 0, 1,
-0.5460656, 0.4258897, -1.413135, 0.1411765, 1, 0, 1,
-0.545644, -0.1423591, -1.502972, 0.1333333, 1, 0, 1,
-0.5444379, -0.4698077, -2.090345, 0.1294118, 1, 0, 1,
-0.5326378, 1.685155, -0.7215232, 0.1215686, 1, 0, 1,
-0.52587, -0.7362928, -2.329913, 0.1176471, 1, 0, 1,
-0.5201601, -1.42795, -2.115179, 0.1098039, 1, 0, 1,
-0.5192532, 0.8133468, 0.3689079, 0.1058824, 1, 0, 1,
-0.5191518, 0.2710792, -0.3678725, 0.09803922, 1, 0, 1,
-0.5161496, -2.069094, -2.507781, 0.09019608, 1, 0, 1,
-0.5149587, -0.1484867, -1.942743, 0.08627451, 1, 0, 1,
-0.5071688, -0.7565444, -3.35868, 0.07843138, 1, 0, 1,
-0.5060833, 1.145797, -1.502152, 0.07450981, 1, 0, 1,
-0.5044797, 0.4635469, -2.701723, 0.06666667, 1, 0, 1,
-0.5023028, 2.282104, 1.525669, 0.0627451, 1, 0, 1,
-0.5019636, 0.1760539, -0.3281685, 0.05490196, 1, 0, 1,
-0.5014988, -0.2833908, -0.3501575, 0.05098039, 1, 0, 1,
-0.4993596, 0.4730746, -3.062735, 0.04313726, 1, 0, 1,
-0.4987597, -0.6091518, -3.210052, 0.03921569, 1, 0, 1,
-0.4983818, 0.5294212, -0.8010601, 0.03137255, 1, 0, 1,
-0.4960851, -1.729261, -2.243495, 0.02745098, 1, 0, 1,
-0.4953941, 0.585524, -0.1172487, 0.01960784, 1, 0, 1,
-0.4920899, -0.7744511, -2.221971, 0.01568628, 1, 0, 1,
-0.4891586, 0.1576285, -1.299013, 0.007843138, 1, 0, 1,
-0.4861344, 0.5580404, 0.4522173, 0.003921569, 1, 0, 1,
-0.480362, 0.2273297, -0.2496585, 0, 1, 0.003921569, 1,
-0.4779063, -0.425255, -2.869741, 0, 1, 0.01176471, 1,
-0.4766015, -0.5491356, -2.20033, 0, 1, 0.01568628, 1,
-0.4763756, 0.4392785, 0.2340347, 0, 1, 0.02352941, 1,
-0.4733838, -0.5102511, -2.729466, 0, 1, 0.02745098, 1,
-0.4733149, 1.263395, -0.7172855, 0, 1, 0.03529412, 1,
-0.4682638, -0.501443, -1.613246, 0, 1, 0.03921569, 1,
-0.4652186, -1.068529, -2.595145, 0, 1, 0.04705882, 1,
-0.4626853, 1.321409, -0.7911932, 0, 1, 0.05098039, 1,
-0.4624291, -0.419558, -2.007868, 0, 1, 0.05882353, 1,
-0.4597239, 0.6776588, -0.6123253, 0, 1, 0.0627451, 1,
-0.4595012, 0.3306802, -0.7839816, 0, 1, 0.07058824, 1,
-0.455186, -1.690135, -1.228261, 0, 1, 0.07450981, 1,
-0.4525055, -0.803344, -2.430066, 0, 1, 0.08235294, 1,
-0.4517993, -0.7544799, -2.136262, 0, 1, 0.08627451, 1,
-0.4488534, 0.292554, -2.571856, 0, 1, 0.09411765, 1,
-0.4470581, 1.212943, 0.1729496, 0, 1, 0.1019608, 1,
-0.4451397, -0.06598782, -1.330861, 0, 1, 0.1058824, 1,
-0.4418015, -0.1438905, -0.08974763, 0, 1, 0.1137255, 1,
-0.4414235, 0.06061441, -1.211928, 0, 1, 0.1176471, 1,
-0.4391849, 1.367275, 0.08627722, 0, 1, 0.1254902, 1,
-0.4299898, -0.3228662, -1.088271, 0, 1, 0.1294118, 1,
-0.4294674, -1.800326, -4.671533, 0, 1, 0.1372549, 1,
-0.425897, -0.3844003, -2.570164, 0, 1, 0.1411765, 1,
-0.4248373, 0.4906502, -1.039333, 0, 1, 0.1490196, 1,
-0.4167325, -0.3753099, -3.136784, 0, 1, 0.1529412, 1,
-0.4137509, -0.5373402, -1.7126, 0, 1, 0.1607843, 1,
-0.412776, 0.3268243, -1.867071, 0, 1, 0.1647059, 1,
-0.4051225, 0.7567064, -0.6176596, 0, 1, 0.172549, 1,
-0.4034351, -1.579929, -3.980998, 0, 1, 0.1764706, 1,
-0.4031967, -0.3857987, -2.277332, 0, 1, 0.1843137, 1,
-0.4024293, 1.07864, -1.493786, 0, 1, 0.1882353, 1,
-0.402222, -0.107595, -2.105954, 0, 1, 0.1960784, 1,
-0.401525, 1.723589, -0.2843072, 0, 1, 0.2039216, 1,
-0.401351, -0.5730783, -3.933082, 0, 1, 0.2078431, 1,
-0.3942131, 0.2359842, -0.5733649, 0, 1, 0.2156863, 1,
-0.3938458, 1.065415, 1.009356, 0, 1, 0.2196078, 1,
-0.3888577, 0.7339082, -1.3363, 0, 1, 0.227451, 1,
-0.3869509, -0.01896209, -1.811138, 0, 1, 0.2313726, 1,
-0.3809522, -0.1691136, -2.903445, 0, 1, 0.2392157, 1,
-0.3793422, 0.1051745, -1.327451, 0, 1, 0.2431373, 1,
-0.3779556, -2.527703, -1.801656, 0, 1, 0.2509804, 1,
-0.3741784, -0.4619429, -4.762682, 0, 1, 0.254902, 1,
-0.3636634, 0.5575112, 0.3837052, 0, 1, 0.2627451, 1,
-0.3615053, -0.1191514, -2.218205, 0, 1, 0.2666667, 1,
-0.3611709, 0.4691512, -1.129036, 0, 1, 0.2745098, 1,
-0.3584029, -0.551748, -1.696744, 0, 1, 0.2784314, 1,
-0.3575309, -0.1289399, -1.593518, 0, 1, 0.2862745, 1,
-0.3537161, -0.7591738, -3.653147, 0, 1, 0.2901961, 1,
-0.3533556, 1.195864, -1.890227, 0, 1, 0.2980392, 1,
-0.3531913, -0.8802295, -3.754493, 0, 1, 0.3058824, 1,
-0.3528924, 1.216877, -0.4023778, 0, 1, 0.3098039, 1,
-0.3525712, 0.09603481, -0.1845924, 0, 1, 0.3176471, 1,
-0.3451543, -0.3714151, -3.50549, 0, 1, 0.3215686, 1,
-0.3404069, 0.262469, -1.485419, 0, 1, 0.3294118, 1,
-0.3351375, 0.7133582, -0.48773, 0, 1, 0.3333333, 1,
-0.3349106, 0.9991231, 1.540374, 0, 1, 0.3411765, 1,
-0.3333789, -0.681337, -1.757307, 0, 1, 0.345098, 1,
-0.3323944, -2.202327, -3.092393, 0, 1, 0.3529412, 1,
-0.3183793, -0.009230148, -2.596023, 0, 1, 0.3568628, 1,
-0.3142905, 1.346962, 0.04792843, 0, 1, 0.3647059, 1,
-0.3132209, 1.615989, -0.9705858, 0, 1, 0.3686275, 1,
-0.3071514, 0.5231224, -1.58368, 0, 1, 0.3764706, 1,
-0.3063897, -0.69921, -2.622107, 0, 1, 0.3803922, 1,
-0.3046199, -0.0637367, -1.376486, 0, 1, 0.3882353, 1,
-0.3030503, -0.8353621, -2.639585, 0, 1, 0.3921569, 1,
-0.2998808, -1.733789, -3.368436, 0, 1, 0.4, 1,
-0.2982356, 0.1344562, -2.035835, 0, 1, 0.4078431, 1,
-0.2961749, 0.7997225, -1.254947, 0, 1, 0.4117647, 1,
-0.2870277, 1.440673, -1.09199, 0, 1, 0.4196078, 1,
-0.2866093, -1.1915, -3.897263, 0, 1, 0.4235294, 1,
-0.2846573, 0.1135438, -0.9669837, 0, 1, 0.4313726, 1,
-0.2839787, 0.4092222, -0.831584, 0, 1, 0.4352941, 1,
-0.2803338, -0.6581016, -2.399333, 0, 1, 0.4431373, 1,
-0.2784733, 1.316753, -0.3726603, 0, 1, 0.4470588, 1,
-0.2765485, 0.06670504, -2.649409, 0, 1, 0.454902, 1,
-0.2722246, 0.9386892, -0.06160087, 0, 1, 0.4588235, 1,
-0.2716626, -1.378246, -3.151573, 0, 1, 0.4666667, 1,
-0.2700908, -0.4597351, -4.450323, 0, 1, 0.4705882, 1,
-0.2676781, -1.048536, -2.347978, 0, 1, 0.4784314, 1,
-0.2653642, -0.2956413, -3.059928, 0, 1, 0.4823529, 1,
-0.2622494, 3.269697, 0.9169487, 0, 1, 0.4901961, 1,
-0.261291, -1.355814, -3.17212, 0, 1, 0.4941176, 1,
-0.2590735, -0.6815736, -4.13942, 0, 1, 0.5019608, 1,
-0.2589296, -1.200091, -3.133472, 0, 1, 0.509804, 1,
-0.2524905, 1.989959, -0.636116, 0, 1, 0.5137255, 1,
-0.2520583, 1.083572, 0.8068218, 0, 1, 0.5215687, 1,
-0.2418584, 0.4909104, -0.7778096, 0, 1, 0.5254902, 1,
-0.2409573, 0.3831314, -2.168715, 0, 1, 0.5333334, 1,
-0.2400386, 0.8127413, -0.8142183, 0, 1, 0.5372549, 1,
-0.2339748, -0.8280265, -1.90362, 0, 1, 0.5450981, 1,
-0.2326013, 0.5990536, -1.705484, 0, 1, 0.5490196, 1,
-0.2285269, 1.220155, -0.02702249, 0, 1, 0.5568628, 1,
-0.2271503, -0.05868725, -1.402331, 0, 1, 0.5607843, 1,
-0.2178585, 1.576816, -1.357026, 0, 1, 0.5686275, 1,
-0.2170079, 1.110919, 0.627156, 0, 1, 0.572549, 1,
-0.2158117, 0.200461, -0.06771413, 0, 1, 0.5803922, 1,
-0.2147449, -0.8010444, -2.804758, 0, 1, 0.5843138, 1,
-0.2124346, 0.6267378, -0.3918546, 0, 1, 0.5921569, 1,
-0.2121278, -1.671343, -4.371549, 0, 1, 0.5960785, 1,
-0.210618, -0.8049307, -3.087272, 0, 1, 0.6039216, 1,
-0.2098059, -0.1012888, -0.4309976, 0, 1, 0.6117647, 1,
-0.2069473, -0.3369305, -2.552016, 0, 1, 0.6156863, 1,
-0.1968495, -0.5383708, -3.002679, 0, 1, 0.6235294, 1,
-0.1921202, -0.4744781, -3.390848, 0, 1, 0.627451, 1,
-0.1896526, -1.448954, -2.942295, 0, 1, 0.6352941, 1,
-0.1888724, -0.6906633, -1.52505, 0, 1, 0.6392157, 1,
-0.1804301, 0.435735, -0.5261801, 0, 1, 0.6470588, 1,
-0.1773755, 0.5080851, -0.8121264, 0, 1, 0.6509804, 1,
-0.1764751, -1.022061, -2.152841, 0, 1, 0.6588235, 1,
-0.1742243, 0.07302079, -1.922007, 0, 1, 0.6627451, 1,
-0.1740909, -1.247031, -4.871063, 0, 1, 0.6705883, 1,
-0.1691426, 1.393224, -1.132357, 0, 1, 0.6745098, 1,
-0.1678025, -0.2919805, -3.074118, 0, 1, 0.682353, 1,
-0.1643626, 1.210959, -1.054813, 0, 1, 0.6862745, 1,
-0.1619308, 0.9921856, 0.02171952, 0, 1, 0.6941177, 1,
-0.1602846, 1.301549, 0.06057056, 0, 1, 0.7019608, 1,
-0.1598128, 0.02988591, 0.5852373, 0, 1, 0.7058824, 1,
-0.1581829, -0.9616622, -2.641274, 0, 1, 0.7137255, 1,
-0.1578588, -0.4846747, -0.7396271, 0, 1, 0.7176471, 1,
-0.1575537, -0.06150927, -2.744458, 0, 1, 0.7254902, 1,
-0.1569199, -1.623872, -3.992407, 0, 1, 0.7294118, 1,
-0.1562909, -0.6405529, -4.203923, 0, 1, 0.7372549, 1,
-0.1553523, -1.704672, -1.416296, 0, 1, 0.7411765, 1,
-0.1544324, 0.9954094, 0.6808647, 0, 1, 0.7490196, 1,
-0.1529017, 1.038911, 1.013086, 0, 1, 0.7529412, 1,
-0.1521928, 0.7285993, -0.3398745, 0, 1, 0.7607843, 1,
-0.1520324, -0.7688388, -1.978801, 0, 1, 0.7647059, 1,
-0.1486634, 1.570486, 0.242799, 0, 1, 0.772549, 1,
-0.1391681, 0.6320637, -0.5460995, 0, 1, 0.7764706, 1,
-0.1384684, -0.2463861, -2.876871, 0, 1, 0.7843137, 1,
-0.136973, 0.3625323, -1.870673, 0, 1, 0.7882353, 1,
-0.1324011, 0.3668893, -0.07632878, 0, 1, 0.7960784, 1,
-0.1305524, 0.5594893, -0.1717786, 0, 1, 0.8039216, 1,
-0.1275213, 0.4142859, -0.7426172, 0, 1, 0.8078431, 1,
-0.1254956, -0.5352512, -2.961183, 0, 1, 0.8156863, 1,
-0.1253594, -0.5666518, -4.444183, 0, 1, 0.8196079, 1,
-0.1232077, -0.9157715, -2.520525, 0, 1, 0.827451, 1,
-0.1224515, -1.007742, -3.278729, 0, 1, 0.8313726, 1,
-0.1157628, 0.3014646, -0.5602551, 0, 1, 0.8392157, 1,
-0.1144297, -1.053176, -2.564798, 0, 1, 0.8431373, 1,
-0.1126946, 0.02499423, 0.5076363, 0, 1, 0.8509804, 1,
-0.112653, -1.220555, -2.959564, 0, 1, 0.854902, 1,
-0.1113303, -0.6348527, -2.935289, 0, 1, 0.8627451, 1,
-0.1092825, 1.844802, -0.2325174, 0, 1, 0.8666667, 1,
-0.108677, -0.4429502, -3.254217, 0, 1, 0.8745098, 1,
-0.1084135, -1.214425, -4.329824, 0, 1, 0.8784314, 1,
-0.1071233, 0.1555661, -0.2702252, 0, 1, 0.8862745, 1,
-0.1053749, 1.972525, -1.159446, 0, 1, 0.8901961, 1,
-0.09755787, -1.008641, -2.746209, 0, 1, 0.8980392, 1,
-0.09482899, -1.235766, -2.773566, 0, 1, 0.9058824, 1,
-0.08695757, -0.6310919, -1.916766, 0, 1, 0.9098039, 1,
-0.08541632, 0.7463298, -0.2973113, 0, 1, 0.9176471, 1,
-0.08424927, -1.484357, -1.907009, 0, 1, 0.9215686, 1,
-0.07802835, -0.09208002, -2.410796, 0, 1, 0.9294118, 1,
-0.07725932, -1.056166, -3.184636, 0, 1, 0.9333333, 1,
-0.07419427, 0.3891846, -0.4871238, 0, 1, 0.9411765, 1,
-0.07230283, 0.1742477, -1.639199, 0, 1, 0.945098, 1,
-0.0692146, -0.1894632, -2.488447, 0, 1, 0.9529412, 1,
-0.06845699, -0.4492891, -1.68586, 0, 1, 0.9568627, 1,
-0.06741413, -0.6983523, -2.761972, 0, 1, 0.9647059, 1,
-0.0672894, 1.601398, -0.5985249, 0, 1, 0.9686275, 1,
-0.06652529, -0.3675952, -4.663369, 0, 1, 0.9764706, 1,
-0.06530721, 0.3653855, 2.085749, 0, 1, 0.9803922, 1,
-0.06469683, -0.5212684, -2.012093, 0, 1, 0.9882353, 1,
-0.06436854, 0.8322777, 0.6623329, 0, 1, 0.9921569, 1,
-0.06413861, -0.6347017, -3.714932, 0, 1, 1, 1,
-0.06311979, 0.848709, -0.6147146, 0, 0.9921569, 1, 1,
-0.0568888, -0.002243519, -2.183684, 0, 0.9882353, 1, 1,
-0.05027342, -0.6662003, -3.492578, 0, 0.9803922, 1, 1,
-0.04538726, 1.543041, 0.455934, 0, 0.9764706, 1, 1,
-0.04524452, 1.586952, -1.497597, 0, 0.9686275, 1, 1,
-0.03839366, 0.3392102, 0.1525666, 0, 0.9647059, 1, 1,
-0.03423924, 0.04261864, 1.632144, 0, 0.9568627, 1, 1,
-0.02908855, 0.6819986, -1.366904, 0, 0.9529412, 1, 1,
-0.02638714, 0.1407344, -0.1577964, 0, 0.945098, 1, 1,
-0.02529481, -0.2544632, -4.372922, 0, 0.9411765, 1, 1,
-0.0230986, -0.1348485, -3.695589, 0, 0.9333333, 1, 1,
-0.01929212, -0.1608365, -4.056885, 0, 0.9294118, 1, 1,
-0.01488476, -0.9280418, -3.034185, 0, 0.9215686, 1, 1,
-0.01395898, -0.096469, -2.398697, 0, 0.9176471, 1, 1,
-0.01354357, 0.7373675, 0.2256568, 0, 0.9098039, 1, 1,
-0.01129928, -1.542438, -3.784762, 0, 0.9058824, 1, 1,
-0.008015626, 0.8623501, -2.090315, 0, 0.8980392, 1, 1,
-0.005781471, 1.148053, 1.294338, 0, 0.8901961, 1, 1,
-0.004360252, -0.6030412, -2.181216, 0, 0.8862745, 1, 1,
-0.002829233, 0.9463528, 0.05932119, 0, 0.8784314, 1, 1,
-0.002027365, -0.4983856, -4.19903, 0, 0.8745098, 1, 1,
-0.0005882165, 1.205117, -0.6970195, 0, 0.8666667, 1, 1,
-0.0005865819, 1.038915, -0.1013508, 0, 0.8627451, 1, 1,
0.003411998, 0.2641472, -1.132807, 0, 0.854902, 1, 1,
0.006051638, -0.7333698, 3.429358, 0, 0.8509804, 1, 1,
0.006623933, -1.312439, 4.264016, 0, 0.8431373, 1, 1,
0.009331979, -0.6169021, 2.786263, 0, 0.8392157, 1, 1,
0.01845716, -0.7454683, 3.377266, 0, 0.8313726, 1, 1,
0.02043481, 0.2037501, 1.38864, 0, 0.827451, 1, 1,
0.02145247, -0.1220428, 4.403472, 0, 0.8196079, 1, 1,
0.03104054, -0.4071532, 2.642295, 0, 0.8156863, 1, 1,
0.0336066, -1.552137, 3.772754, 0, 0.8078431, 1, 1,
0.03980538, -0.4376328, 2.117959, 0, 0.8039216, 1, 1,
0.0412605, 0.4314227, -0.1686358, 0, 0.7960784, 1, 1,
0.04232603, -1.369393, 3.339207, 0, 0.7882353, 1, 1,
0.05482075, -0.3286308, 2.993188, 0, 0.7843137, 1, 1,
0.06319158, 0.8170543, -0.300609, 0, 0.7764706, 1, 1,
0.06820343, 0.6437922, -1.005935, 0, 0.772549, 1, 1,
0.06942473, 0.1952902, 0.3154431, 0, 0.7647059, 1, 1,
0.07076839, 0.4272502, 0.6443262, 0, 0.7607843, 1, 1,
0.07240376, 0.1385938, 1.684689, 0, 0.7529412, 1, 1,
0.07330649, -0.3843452, 3.382519, 0, 0.7490196, 1, 1,
0.07988061, 1.092264, 1.602662, 0, 0.7411765, 1, 1,
0.08126394, -2.759697, 2.07483, 0, 0.7372549, 1, 1,
0.08877191, -0.08247664, 2.289718, 0, 0.7294118, 1, 1,
0.08928419, 0.3503326, 0.3394306, 0, 0.7254902, 1, 1,
0.09148071, 1.262035, 1.16525, 0, 0.7176471, 1, 1,
0.1005807, 0.3550528, -0.888566, 0, 0.7137255, 1, 1,
0.1022861, -0.9997478, 2.970193, 0, 0.7058824, 1, 1,
0.1065043, 2.451075, -0.1933392, 0, 0.6980392, 1, 1,
0.1087398, -1.070524, 2.355587, 0, 0.6941177, 1, 1,
0.1100324, 0.9519958, 1.111773, 0, 0.6862745, 1, 1,
0.1111059, 0.498648, -0.4070847, 0, 0.682353, 1, 1,
0.1158575, 0.8603753, 0.212319, 0, 0.6745098, 1, 1,
0.1170558, -0.09084202, 2.979692, 0, 0.6705883, 1, 1,
0.1277225, -0.8540235, 3.632643, 0, 0.6627451, 1, 1,
0.1301527, 1.228979, 0.7265698, 0, 0.6588235, 1, 1,
0.1387442, -0.4107614, 1.985438, 0, 0.6509804, 1, 1,
0.1406946, 0.3452219, 2.182809, 0, 0.6470588, 1, 1,
0.1453569, -0.3498752, 4.32378, 0, 0.6392157, 1, 1,
0.145582, 0.3315814, 0.7226372, 0, 0.6352941, 1, 1,
0.1464354, 0.8304341, -2.401898, 0, 0.627451, 1, 1,
0.147947, 0.813747, 1.091907, 0, 0.6235294, 1, 1,
0.1493425, -2.61295, 3.702749, 0, 0.6156863, 1, 1,
0.1585201, 1.811857, 1.164094, 0, 0.6117647, 1, 1,
0.1638666, -0.3155943, 4.208345, 0, 0.6039216, 1, 1,
0.1641367, 1.159882, 0.2680931, 0, 0.5960785, 1, 1,
0.1661259, -0.05160846, 1.739921, 0, 0.5921569, 1, 1,
0.1691102, -1.793961, 3.057535, 0, 0.5843138, 1, 1,
0.1699973, 0.351041, 2.126868, 0, 0.5803922, 1, 1,
0.1704954, 0.3697183, 0.07196965, 0, 0.572549, 1, 1,
0.171699, -0.1811526, 1.269045, 0, 0.5686275, 1, 1,
0.1733687, 0.8810284, 2.445876, 0, 0.5607843, 1, 1,
0.1741188, 0.8796001, -0.9819727, 0, 0.5568628, 1, 1,
0.1745401, -0.4405697, 3.501707, 0, 0.5490196, 1, 1,
0.175466, -1.889196, 1.611584, 0, 0.5450981, 1, 1,
0.1805189, -1.530429, 3.07851, 0, 0.5372549, 1, 1,
0.1865649, -0.9701562, 2.23904, 0, 0.5333334, 1, 1,
0.1872723, 0.996582, 0.9067864, 0, 0.5254902, 1, 1,
0.188862, 1.689692, 0.1754671, 0, 0.5215687, 1, 1,
0.1892944, 0.9160795, 0.6445661, 0, 0.5137255, 1, 1,
0.1917892, 1.974298, 1.588591, 0, 0.509804, 1, 1,
0.1930005, -0.1239467, 0.5831792, 0, 0.5019608, 1, 1,
0.1942907, 1.900233, 0.1517302, 0, 0.4941176, 1, 1,
0.1956532, 0.5940216, -0.4321506, 0, 0.4901961, 1, 1,
0.1958142, -0.1018201, 2.13273, 0, 0.4823529, 1, 1,
0.1973559, -0.6114863, 0.8274263, 0, 0.4784314, 1, 1,
0.1981283, -0.9960746, 3.857433, 0, 0.4705882, 1, 1,
0.1996555, -0.3892476, 1.821094, 0, 0.4666667, 1, 1,
0.2020914, 0.4122928, 0.6410489, 0, 0.4588235, 1, 1,
0.203285, -1.771583, 1.420679, 0, 0.454902, 1, 1,
0.2062292, 0.5689927, -0.8187543, 0, 0.4470588, 1, 1,
0.2103745, 0.6176441, -0.2066375, 0, 0.4431373, 1, 1,
0.2118949, -1.280028, 3.142501, 0, 0.4352941, 1, 1,
0.2146084, -1.027868, 0.8934658, 0, 0.4313726, 1, 1,
0.2218638, -1.658243, 3.684252, 0, 0.4235294, 1, 1,
0.2313287, -0.4670293, 3.065181, 0, 0.4196078, 1, 1,
0.2346156, -0.5166411, 3.406147, 0, 0.4117647, 1, 1,
0.2382113, -0.7930033, 1.037425, 0, 0.4078431, 1, 1,
0.2400962, -0.2475156, 2.120222, 0, 0.4, 1, 1,
0.2402858, 0.5863971, -0.2886105, 0, 0.3921569, 1, 1,
0.2413275, 1.279631, -1.442843, 0, 0.3882353, 1, 1,
0.2507395, 2.223799, -0.1829742, 0, 0.3803922, 1, 1,
0.2522427, -0.6567701, 1.936725, 0, 0.3764706, 1, 1,
0.25261, -0.6810966, 2.122558, 0, 0.3686275, 1, 1,
0.2536989, -1.715508, 3.290547, 0, 0.3647059, 1, 1,
0.2544427, 1.238875, 0.06451398, 0, 0.3568628, 1, 1,
0.2547954, -0.4599941, 2.028715, 0, 0.3529412, 1, 1,
0.2607418, 1.612823, 1.32126, 0, 0.345098, 1, 1,
0.2619603, -0.2596284, 2.418651, 0, 0.3411765, 1, 1,
0.2652088, -1.045228, 2.432403, 0, 0.3333333, 1, 1,
0.2736402, -0.7968588, 2.457606, 0, 0.3294118, 1, 1,
0.2758226, 0.3296451, 0.983481, 0, 0.3215686, 1, 1,
0.2762886, 0.1489205, 1.956396, 0, 0.3176471, 1, 1,
0.286426, 2.235825, 0.8105333, 0, 0.3098039, 1, 1,
0.2882586, 0.2372181, 0.8054225, 0, 0.3058824, 1, 1,
0.2932356, 1.035859, -0.5906566, 0, 0.2980392, 1, 1,
0.300294, -0.4715879, 2.230974, 0, 0.2901961, 1, 1,
0.3088133, 0.3491635, 0.5840459, 0, 0.2862745, 1, 1,
0.3114853, -0.2890943, 2.966781, 0, 0.2784314, 1, 1,
0.31158, -0.979128, 3.094832, 0, 0.2745098, 1, 1,
0.3171893, 2.036975, 0.9903242, 0, 0.2666667, 1, 1,
0.3203489, -1.919486, 5.598496, 0, 0.2627451, 1, 1,
0.3207147, 0.02212215, -0.6625262, 0, 0.254902, 1, 1,
0.3223025, -2.171962, 3.842397, 0, 0.2509804, 1, 1,
0.3229254, 0.4627999, 0.8181141, 0, 0.2431373, 1, 1,
0.3332168, 0.568175, 0.5504768, 0, 0.2392157, 1, 1,
0.3361106, -1.214842, 5.185283, 0, 0.2313726, 1, 1,
0.3378803, -0.415701, 3.143768, 0, 0.227451, 1, 1,
0.3379451, -0.4525211, 1.084167, 0, 0.2196078, 1, 1,
0.3385812, -0.7770368, 1.422298, 0, 0.2156863, 1, 1,
0.3408463, -0.3420748, 4.446758, 0, 0.2078431, 1, 1,
0.3419378, 1.109633, 2.391739, 0, 0.2039216, 1, 1,
0.3432248, 1.431818, -0.7732953, 0, 0.1960784, 1, 1,
0.3451176, 0.3865012, 1.385172, 0, 0.1882353, 1, 1,
0.3471313, -0.2290025, 1.784503, 0, 0.1843137, 1, 1,
0.3485846, -0.6429715, 2.11839, 0, 0.1764706, 1, 1,
0.3575214, -0.2571853, 2.225081, 0, 0.172549, 1, 1,
0.3591161, 0.5663767, -0.1844942, 0, 0.1647059, 1, 1,
0.3674954, -1.001455, 3.037119, 0, 0.1607843, 1, 1,
0.3676547, 0.8693144, 1.121643, 0, 0.1529412, 1, 1,
0.3694475, 1.379928, 2.283061, 0, 0.1490196, 1, 1,
0.3758634, 0.3486929, 0.5155979, 0, 0.1411765, 1, 1,
0.3777774, -0.5034695, 3.543704, 0, 0.1372549, 1, 1,
0.3782532, -0.7941946, 2.095413, 0, 0.1294118, 1, 1,
0.3784126, -1.487559, 2.469147, 0, 0.1254902, 1, 1,
0.388858, -1.293151, 2.291272, 0, 0.1176471, 1, 1,
0.3904596, 0.4087342, -0.4113325, 0, 0.1137255, 1, 1,
0.3920101, -0.01379057, 3.130937, 0, 0.1058824, 1, 1,
0.3934519, -1.509039, 3.012678, 0, 0.09803922, 1, 1,
0.3960076, 0.03669995, 2.352202, 0, 0.09411765, 1, 1,
0.3965741, 1.143383, 1.957395, 0, 0.08627451, 1, 1,
0.396796, -0.1562506, 1.638491, 0, 0.08235294, 1, 1,
0.4002868, 0.4812199, 2.009826, 0, 0.07450981, 1, 1,
0.4057247, 1.299363, -0.1142415, 0, 0.07058824, 1, 1,
0.4065611, 1.553489, 1.15577, 0, 0.0627451, 1, 1,
0.4093229, 0.314528, 0.7953469, 0, 0.05882353, 1, 1,
0.4100112, -0.9638638, 1.103569, 0, 0.05098039, 1, 1,
0.4104069, -0.4496727, 2.032394, 0, 0.04705882, 1, 1,
0.4124156, -1.809756, 1.910583, 0, 0.03921569, 1, 1,
0.4182367, 0.2388944, 1.35514, 0, 0.03529412, 1, 1,
0.4183574, -0.9490369, 3.276603, 0, 0.02745098, 1, 1,
0.4193902, -0.2034774, 2.921788, 0, 0.02352941, 1, 1,
0.4209919, -0.4453767, 3.847056, 0, 0.01568628, 1, 1,
0.4244262, -0.7127246, 3.509418, 0, 0.01176471, 1, 1,
0.4266903, 1.191708, 2.013234, 0, 0.003921569, 1, 1,
0.4289344, 0.5753147, -0.312674, 0.003921569, 0, 1, 1,
0.4291256, -0.3484425, 1.319808, 0.007843138, 0, 1, 1,
0.4312431, -1.828458, 4.326913, 0.01568628, 0, 1, 1,
0.431892, -0.4946087, 3.501827, 0.01960784, 0, 1, 1,
0.4320532, 0.3448395, 2.64723, 0.02745098, 0, 1, 1,
0.4329866, -0.259524, 3.263409, 0.03137255, 0, 1, 1,
0.4334508, -1.04134, 3.508426, 0.03921569, 0, 1, 1,
0.4336283, 2.364824, 1.208733, 0.04313726, 0, 1, 1,
0.4337289, -0.2575405, 1.990486, 0.05098039, 0, 1, 1,
0.4342479, -0.4421065, 2.580916, 0.05490196, 0, 1, 1,
0.4376921, -2.67442, 1.731585, 0.0627451, 0, 1, 1,
0.4391611, 0.942769, 0.4834428, 0.06666667, 0, 1, 1,
0.4458749, 0.7968453, -1.001222, 0.07450981, 0, 1, 1,
0.4599027, -0.4311786, -0.4361549, 0.07843138, 0, 1, 1,
0.4610158, 0.08672617, 1.318763, 0.08627451, 0, 1, 1,
0.4669846, 0.3152802, 0.08533331, 0.09019608, 0, 1, 1,
0.4709824, 0.6892522, 1.222544, 0.09803922, 0, 1, 1,
0.4720887, -1.216205, 2.222043, 0.1058824, 0, 1, 1,
0.4736624, -0.5531899, 3.252853, 0.1098039, 0, 1, 1,
0.4757246, -0.1007181, 0.8488618, 0.1176471, 0, 1, 1,
0.487522, 0.03060141, 3.093808, 0.1215686, 0, 1, 1,
0.497427, 0.5743134, -0.534536, 0.1294118, 0, 1, 1,
0.497543, -2.018814, 2.495286, 0.1333333, 0, 1, 1,
0.5050123, 1.018199, -0.07455879, 0.1411765, 0, 1, 1,
0.5068508, -0.4458874, 2.573801, 0.145098, 0, 1, 1,
0.5098715, 0.9477641, 1.339466, 0.1529412, 0, 1, 1,
0.5102791, -0.9369434, 3.490968, 0.1568628, 0, 1, 1,
0.522244, -0.129819, 1.666218, 0.1647059, 0, 1, 1,
0.5223792, -0.43508, 1.914601, 0.1686275, 0, 1, 1,
0.5231347, 0.1060139, 1.599291, 0.1764706, 0, 1, 1,
0.5245035, 2.4505, -0.9615197, 0.1803922, 0, 1, 1,
0.524958, -0.3549644, 4.823624, 0.1882353, 0, 1, 1,
0.5252403, -1.501425, 2.790922, 0.1921569, 0, 1, 1,
0.5264155, -0.2309743, 2.131299, 0.2, 0, 1, 1,
0.5410241, -2.14528, 2.305586, 0.2078431, 0, 1, 1,
0.5414121, -0.9040192, 3.807667, 0.2117647, 0, 1, 1,
0.547232, 0.5663753, -0.0210247, 0.2196078, 0, 1, 1,
0.5510411, 1.585004, -0.04811838, 0.2235294, 0, 1, 1,
0.5511479, 0.3719271, -1.14708, 0.2313726, 0, 1, 1,
0.5514329, -0.856876, 3.719637, 0.2352941, 0, 1, 1,
0.5538286, -0.2066349, 2.495807, 0.2431373, 0, 1, 1,
0.5549027, 0.6852403, -0.3117545, 0.2470588, 0, 1, 1,
0.5570711, -0.3105042, 3.059742, 0.254902, 0, 1, 1,
0.5573604, 1.401554, 0.3226374, 0.2588235, 0, 1, 1,
0.5580717, -0.5749897, 2.376795, 0.2666667, 0, 1, 1,
0.5642166, 1.704267, 0.6692603, 0.2705882, 0, 1, 1,
0.5657781, 0.5007911, 1.006062, 0.2784314, 0, 1, 1,
0.5766028, 0.8561437, 0.2861781, 0.282353, 0, 1, 1,
0.5824131, 0.5433658, 1.496215, 0.2901961, 0, 1, 1,
0.5907404, -1.137101, 3.534868, 0.2941177, 0, 1, 1,
0.6028414, -0.5343521, 1.926529, 0.3019608, 0, 1, 1,
0.6099526, -1.197762, 1.23806, 0.3098039, 0, 1, 1,
0.6190575, 1.201292, 0.05437711, 0.3137255, 0, 1, 1,
0.6221655, 0.4255669, 1.089389, 0.3215686, 0, 1, 1,
0.6241375, 1.27858, 0.7159746, 0.3254902, 0, 1, 1,
0.6269256, -0.379942, 1.421578, 0.3333333, 0, 1, 1,
0.6283894, 0.02316839, 2.042706, 0.3372549, 0, 1, 1,
0.6298491, 0.5579677, -0.253608, 0.345098, 0, 1, 1,
0.632752, 1.531286, 1.907676, 0.3490196, 0, 1, 1,
0.6328863, 0.9401605, 2.011932, 0.3568628, 0, 1, 1,
0.637469, 0.8681368, -0.3797439, 0.3607843, 0, 1, 1,
0.6487954, 0.7131608, 0.3473531, 0.3686275, 0, 1, 1,
0.649201, 0.6560564, 0.17001, 0.372549, 0, 1, 1,
0.6521859, -0.6679662, 1.285621, 0.3803922, 0, 1, 1,
0.6575387, 0.3317726, 1.192748, 0.3843137, 0, 1, 1,
0.6585884, -0.3106775, 0.1605251, 0.3921569, 0, 1, 1,
0.6599757, -0.8122296, 2.665909, 0.3960784, 0, 1, 1,
0.6644067, 0.5628777, 2.773783, 0.4039216, 0, 1, 1,
0.6677784, 0.2219423, 2.15464, 0.4117647, 0, 1, 1,
0.6690949, 1.208944, 0.03942053, 0.4156863, 0, 1, 1,
0.6717001, 0.8545815, -0.3684272, 0.4235294, 0, 1, 1,
0.6733333, 1.015001, 0.6586406, 0.427451, 0, 1, 1,
0.6734365, -0.6928757, 0.6458119, 0.4352941, 0, 1, 1,
0.6742651, 0.9062901, 2.783539, 0.4392157, 0, 1, 1,
0.6836057, -1.988091, 0.7561494, 0.4470588, 0, 1, 1,
0.6840652, -1.026713, 2.219379, 0.4509804, 0, 1, 1,
0.6861559, 0.3049406, 0.8877487, 0.4588235, 0, 1, 1,
0.6867887, -1.527525, 3.06525, 0.4627451, 0, 1, 1,
0.6919391, 0.3999387, 1.865299, 0.4705882, 0, 1, 1,
0.6938478, 0.5964185, 0.6320394, 0.4745098, 0, 1, 1,
0.6957539, -0.7298149, 1.547165, 0.4823529, 0, 1, 1,
0.6957846, -1.667649, 3.481119, 0.4862745, 0, 1, 1,
0.6984028, 0.06673482, 0.00401572, 0.4941176, 0, 1, 1,
0.6987877, 0.07666382, -0.1362299, 0.5019608, 0, 1, 1,
0.7008934, 0.2500062, 2.094111, 0.5058824, 0, 1, 1,
0.7016926, 0.1116068, 2.059695, 0.5137255, 0, 1, 1,
0.7180458, 0.1054692, 0.23538, 0.5176471, 0, 1, 1,
0.7294575, -1.173674, 0.5084841, 0.5254902, 0, 1, 1,
0.7311895, -0.7336385, 3.978125, 0.5294118, 0, 1, 1,
0.7328362, -0.3945287, 2.641979, 0.5372549, 0, 1, 1,
0.7344009, -1.007914, 2.340129, 0.5411765, 0, 1, 1,
0.7356147, -0.4900076, 2.735231, 0.5490196, 0, 1, 1,
0.7379456, 1.343392, 1.70492, 0.5529412, 0, 1, 1,
0.7483515, 0.0683377, 2.000395, 0.5607843, 0, 1, 1,
0.7493643, -1.049402, 2.108048, 0.5647059, 0, 1, 1,
0.7522152, -0.2364075, 1.6745, 0.572549, 0, 1, 1,
0.7533914, 1.24836, 2.301524, 0.5764706, 0, 1, 1,
0.7547064, -0.3958741, 3.115357, 0.5843138, 0, 1, 1,
0.755271, -1.637153, 2.840396, 0.5882353, 0, 1, 1,
0.7602073, -0.4440424, 2.519753, 0.5960785, 0, 1, 1,
0.7626843, -0.9281598, 3.631212, 0.6039216, 0, 1, 1,
0.7698594, 1.550514, 0.08751445, 0.6078432, 0, 1, 1,
0.7703331, -0.7498401, 2.139172, 0.6156863, 0, 1, 1,
0.7704213, 2.030999, 1.904487, 0.6196079, 0, 1, 1,
0.7704573, 1.358211, -0.04719856, 0.627451, 0, 1, 1,
0.7741777, 1.90049, 1.457228, 0.6313726, 0, 1, 1,
0.7747644, -0.5402439, 2.648389, 0.6392157, 0, 1, 1,
0.7766353, 0.3303952, 2.302229, 0.6431373, 0, 1, 1,
0.7855769, -0.8997025, 3.084842, 0.6509804, 0, 1, 1,
0.7889901, -0.05062138, 2.8192, 0.654902, 0, 1, 1,
0.7923011, -1.411562, 2.531322, 0.6627451, 0, 1, 1,
0.7984461, -0.02551273, 1.767016, 0.6666667, 0, 1, 1,
0.7998449, 0.4566378, 0.1030719, 0.6745098, 0, 1, 1,
0.8001801, 0.9334701, 1.023373, 0.6784314, 0, 1, 1,
0.8007023, -0.5437525, 1.534776, 0.6862745, 0, 1, 1,
0.8050049, 1.637566, -0.9424204, 0.6901961, 0, 1, 1,
0.8116013, 0.1392124, 1.643939, 0.6980392, 0, 1, 1,
0.8168648, 2.114059, -1.215709, 0.7058824, 0, 1, 1,
0.8182454, -0.9851857, 2.490915, 0.7098039, 0, 1, 1,
0.8190172, -1.152065, 2.361792, 0.7176471, 0, 1, 1,
0.820408, 0.8048239, 0.07495859, 0.7215686, 0, 1, 1,
0.8238348, -0.122967, 3.293303, 0.7294118, 0, 1, 1,
0.8240154, -0.2486873, 2.821482, 0.7333333, 0, 1, 1,
0.8291191, -0.4446901, 1.329726, 0.7411765, 0, 1, 1,
0.8316653, 0.2012136, 1.868075, 0.7450981, 0, 1, 1,
0.8338262, 0.3533944, 2.620075, 0.7529412, 0, 1, 1,
0.8400155, -0.2740457, 3.165766, 0.7568628, 0, 1, 1,
0.841469, -0.001694882, -0.09016366, 0.7647059, 0, 1, 1,
0.8511038, 1.332656, 0.6397987, 0.7686275, 0, 1, 1,
0.8616939, 0.1052287, 2.346808, 0.7764706, 0, 1, 1,
0.864656, -0.1816209, 2.711008, 0.7803922, 0, 1, 1,
0.8683264, 0.4085777, 2.217349, 0.7882353, 0, 1, 1,
0.8687435, -0.08712184, 0.1198971, 0.7921569, 0, 1, 1,
0.8741143, 1.240124, -2.188027, 0.8, 0, 1, 1,
0.8791026, -0.3801098, 1.6429, 0.8078431, 0, 1, 1,
0.8804945, -0.6017697, 3.552844, 0.8117647, 0, 1, 1,
0.8819799, -1.104122, 0.8085085, 0.8196079, 0, 1, 1,
0.8910824, 0.07847939, -0.5282013, 0.8235294, 0, 1, 1,
0.8964748, 0.2663015, 1.329163, 0.8313726, 0, 1, 1,
0.8972142, -1.002293, 3.724813, 0.8352941, 0, 1, 1,
0.8981356, -0.5112944, 1.516319, 0.8431373, 0, 1, 1,
0.8982844, -0.3433058, 1.847638, 0.8470588, 0, 1, 1,
0.9019147, -0.3321689, 0.9255453, 0.854902, 0, 1, 1,
0.9038681, 0.5509929, 0.3302816, 0.8588235, 0, 1, 1,
0.9057639, -0.08398737, -1.11139, 0.8666667, 0, 1, 1,
0.9143221, -0.2081606, 0.5888821, 0.8705882, 0, 1, 1,
0.9153825, -0.9779661, 2.566614, 0.8784314, 0, 1, 1,
0.9189003, -0.714288, 2.602866, 0.8823529, 0, 1, 1,
0.9199318, 0.2293574, 1.816307, 0.8901961, 0, 1, 1,
0.9253231, -0.929719, 3.022749, 0.8941177, 0, 1, 1,
0.9254476, 0.3869012, 1.362257, 0.9019608, 0, 1, 1,
0.9283099, -1.0533, 1.907616, 0.9098039, 0, 1, 1,
0.9332282, 1.409121, 0.2830007, 0.9137255, 0, 1, 1,
0.9350272, -1.610927, 2.438025, 0.9215686, 0, 1, 1,
0.9355852, 0.6892321, 0.590816, 0.9254902, 0, 1, 1,
0.9370655, -0.281787, 4.116183, 0.9333333, 0, 1, 1,
0.9445375, 0.338897, 2.119336, 0.9372549, 0, 1, 1,
0.9488661, -0.9960485, 0.5514535, 0.945098, 0, 1, 1,
0.9575654, 1.856364, 0.4147497, 0.9490196, 0, 1, 1,
0.9617162, -0.3931217, 2.507007, 0.9568627, 0, 1, 1,
0.9638687, -0.4185529, 2.795835, 0.9607843, 0, 1, 1,
0.9675267, 0.200355, 0.01039368, 0.9686275, 0, 1, 1,
0.976185, -0.5586677, 1.691577, 0.972549, 0, 1, 1,
0.9818776, -0.992151, 1.435449, 0.9803922, 0, 1, 1,
0.9821896, -1.325788, 2.851463, 0.9843137, 0, 1, 1,
0.9841085, 0.9098878, 1.282956, 0.9921569, 0, 1, 1,
0.9875365, -1.382018, 2.825861, 0.9960784, 0, 1, 1,
0.9901647, 1.3658, 1.622179, 1, 0, 0.9960784, 1,
0.9922227, -0.241103, 1.223971, 1, 0, 0.9882353, 1,
0.9924978, -0.5083042, 1.625645, 1, 0, 0.9843137, 1,
0.9937741, 1.771647, 0.7072397, 1, 0, 0.9764706, 1,
0.9938586, 2.56635, 1.285647, 1, 0, 0.972549, 1,
0.9968672, -0.3952031, 0.723657, 1, 0, 0.9647059, 1,
0.9985992, 0.6351821, 1.392028, 1, 0, 0.9607843, 1,
1.000218, 0.8855342, 1.861218, 1, 0, 0.9529412, 1,
1.001609, -0.7779766, 2.874, 1, 0, 0.9490196, 1,
1.006548, 0.3419111, 3.0881, 1, 0, 0.9411765, 1,
1.006741, -1.458097, 4.28349, 1, 0, 0.9372549, 1,
1.015749, 0.8662533, 1.443594, 1, 0, 0.9294118, 1,
1.016062, -0.8306011, 2.08417, 1, 0, 0.9254902, 1,
1.018914, 0.154762, 1.582355, 1, 0, 0.9176471, 1,
1.019223, 1.132231, 0.0115835, 1, 0, 0.9137255, 1,
1.025703, 0.09523772, 1.369643, 1, 0, 0.9058824, 1,
1.03131, 0.2857843, 0.67035, 1, 0, 0.9019608, 1,
1.032284, 1.830693, -0.8367833, 1, 0, 0.8941177, 1,
1.03874, -0.4908762, 1.895719, 1, 0, 0.8862745, 1,
1.03893, -0.05762927, 0.6307074, 1, 0, 0.8823529, 1,
1.061369, -1.207068, 4.656801, 1, 0, 0.8745098, 1,
1.06138, -0.3447542, 0.4832921, 1, 0, 0.8705882, 1,
1.065046, -1.111179, 2.610541, 1, 0, 0.8627451, 1,
1.07742, 0.3883214, 1.817054, 1, 0, 0.8588235, 1,
1.077638, -0.8347201, 2.752799, 1, 0, 0.8509804, 1,
1.080757, -1.60988, 2.271117, 1, 0, 0.8470588, 1,
1.082135, -0.871098, 3.791183, 1, 0, 0.8392157, 1,
1.084883, 0.5519271, -0.05988966, 1, 0, 0.8352941, 1,
1.090471, 1.389115, 0.3133208, 1, 0, 0.827451, 1,
1.091013, 0.6093724, -0.3048081, 1, 0, 0.8235294, 1,
1.102435, -1.330835, 2.005424, 1, 0, 0.8156863, 1,
1.105216, 0.7451406, -0.0171186, 1, 0, 0.8117647, 1,
1.112545, -0.02675375, 2.317361, 1, 0, 0.8039216, 1,
1.115138, -0.5442016, -0.158038, 1, 0, 0.7960784, 1,
1.115425, 0.4781955, 0.4634397, 1, 0, 0.7921569, 1,
1.116199, -0.5548196, 1.887146, 1, 0, 0.7843137, 1,
1.119002, 0.9566989, 0.1322586, 1, 0, 0.7803922, 1,
1.121882, 0.8975722, 1.432664, 1, 0, 0.772549, 1,
1.123454, -2.589492, 4.56498, 1, 0, 0.7686275, 1,
1.125779, -0.2745361, 2.044327, 1, 0, 0.7607843, 1,
1.134049, -0.4554494, 1.126285, 1, 0, 0.7568628, 1,
1.134713, 0.1988236, 1.949083, 1, 0, 0.7490196, 1,
1.137927, -0.4122641, 0.4113526, 1, 0, 0.7450981, 1,
1.141965, -0.7161757, 3.643578, 1, 0, 0.7372549, 1,
1.159689, 1.449718, 0.2418768, 1, 0, 0.7333333, 1,
1.164822, -1.286395, 2.369274, 1, 0, 0.7254902, 1,
1.165535, -0.6244706, 2.00452, 1, 0, 0.7215686, 1,
1.166918, 0.4366462, 0.9711587, 1, 0, 0.7137255, 1,
1.170807, 0.8500041, 1.548592, 1, 0, 0.7098039, 1,
1.171701, 0.0479716, 1.684518, 1, 0, 0.7019608, 1,
1.179266, 0.7262239, 2.39554, 1, 0, 0.6941177, 1,
1.182004, -0.4744009, 2.654164, 1, 0, 0.6901961, 1,
1.183234, -0.7231048, 1.508625, 1, 0, 0.682353, 1,
1.192465, 0.07140338, 0.7518962, 1, 0, 0.6784314, 1,
1.202795, -0.0232638, 2.166828, 1, 0, 0.6705883, 1,
1.217717, -1.642669, 1.931311, 1, 0, 0.6666667, 1,
1.225945, -0.7856047, 1.679164, 1, 0, 0.6588235, 1,
1.231148, -0.7394907, 1.623923, 1, 0, 0.654902, 1,
1.234845, 0.2486742, 1.251913, 1, 0, 0.6470588, 1,
1.239287, -1.055723, 1.602634, 1, 0, 0.6431373, 1,
1.25221, 0.04678188, 3.033604, 1, 0, 0.6352941, 1,
1.255546, 0.3791822, 1.469669, 1, 0, 0.6313726, 1,
1.256245, 0.2344014, 1.248413, 1, 0, 0.6235294, 1,
1.273852, -0.007211361, 1.453869, 1, 0, 0.6196079, 1,
1.274711, 0.1392313, 0.3844199, 1, 0, 0.6117647, 1,
1.275736, 0.1312799, 0.7436825, 1, 0, 0.6078432, 1,
1.279815, 4.046844, -0.01639314, 1, 0, 0.6, 1,
1.28155, 1.260208, 0.7963832, 1, 0, 0.5921569, 1,
1.28525, 0.5705397, 0.6471192, 1, 0, 0.5882353, 1,
1.292773, -0.4957555, 3.191524, 1, 0, 0.5803922, 1,
1.294979, -0.2887315, 2.518834, 1, 0, 0.5764706, 1,
1.301286, 0.6155994, 3.293422, 1, 0, 0.5686275, 1,
1.310203, -0.03577767, 0.454619, 1, 0, 0.5647059, 1,
1.317745, -0.8988121, 1.955663, 1, 0, 0.5568628, 1,
1.319498, 0.9846096, 0.9367923, 1, 0, 0.5529412, 1,
1.321193, -1.903007, 0.8427159, 1, 0, 0.5450981, 1,
1.332068, 0.2345559, 0.2726212, 1, 0, 0.5411765, 1,
1.334544, 1.96813, 0.1289043, 1, 0, 0.5333334, 1,
1.338788, 1.013633, 1.551166, 1, 0, 0.5294118, 1,
1.339827, -1.401077, 1.705238, 1, 0, 0.5215687, 1,
1.366707, 0.4883175, 1.919147, 1, 0, 0.5176471, 1,
1.375471, 1.955272, -0.5271591, 1, 0, 0.509804, 1,
1.378683, 0.8654507, 0.9612327, 1, 0, 0.5058824, 1,
1.404969, -1.424113, 1.737283, 1, 0, 0.4980392, 1,
1.406795, 0.4358295, 1.506813, 1, 0, 0.4901961, 1,
1.407008, 0.9057707, -1.115355, 1, 0, 0.4862745, 1,
1.410618, -0.7569526, 2.931089, 1, 0, 0.4784314, 1,
1.410747, -1.079278, 0.5493602, 1, 0, 0.4745098, 1,
1.413371, -0.3299137, 2.953916, 1, 0, 0.4666667, 1,
1.414126, -0.4236668, 1.015106, 1, 0, 0.4627451, 1,
1.420382, 0.850701, 0.2068225, 1, 0, 0.454902, 1,
1.43188, 1.621889, -0.3501429, 1, 0, 0.4509804, 1,
1.436589, -0.1369092, 0.2121538, 1, 0, 0.4431373, 1,
1.436857, 0.6850809, 0.514301, 1, 0, 0.4392157, 1,
1.445977, -0.6625666, 2.548867, 1, 0, 0.4313726, 1,
1.452342, -1.319591, 2.252456, 1, 0, 0.427451, 1,
1.463336, 0.4597075, 1.522429, 1, 0, 0.4196078, 1,
1.470378, 0.2178164, 2.406047, 1, 0, 0.4156863, 1,
1.473221, 0.8248525, 1.080885, 1, 0, 0.4078431, 1,
1.476272, -0.1000995, 0.745225, 1, 0, 0.4039216, 1,
1.478714, -0.0434612, 1.889623, 1, 0, 0.3960784, 1,
1.486902, 0.6297912, 1.332805, 1, 0, 0.3882353, 1,
1.507363, 0.1021539, 2.529131, 1, 0, 0.3843137, 1,
1.530675, -0.05307857, 1.999648, 1, 0, 0.3764706, 1,
1.565784, -1.147067, 2.209855, 1, 0, 0.372549, 1,
1.566021, 1.744583, 2.199561, 1, 0, 0.3647059, 1,
1.590898, -0.1415994, 2.291342, 1, 0, 0.3607843, 1,
1.598833, -0.5364209, -0.469103, 1, 0, 0.3529412, 1,
1.608186, -1.795067, 1.038263, 1, 0, 0.3490196, 1,
1.608416, -1.105897, 2.850679, 1, 0, 0.3411765, 1,
1.612002, 1.669864, 0.3103329, 1, 0, 0.3372549, 1,
1.624607, 0.1019558, 1.008654, 1, 0, 0.3294118, 1,
1.633171, 0.2634823, 0.5670593, 1, 0, 0.3254902, 1,
1.638276, 0.3140704, 0.9621192, 1, 0, 0.3176471, 1,
1.652074, -0.7052946, 1.737456, 1, 0, 0.3137255, 1,
1.659235, 0.7729214, 0.1806292, 1, 0, 0.3058824, 1,
1.663511, -0.6351131, 4.496599, 1, 0, 0.2980392, 1,
1.686745, 0.1954276, 0.980005, 1, 0, 0.2941177, 1,
1.704958, -1.145742, 3.760603, 1, 0, 0.2862745, 1,
1.705821, -0.03435557, 3.611114, 1, 0, 0.282353, 1,
1.710175, 1.465121, 0.8260927, 1, 0, 0.2745098, 1,
1.746879, 0.5615085, 1.025248, 1, 0, 0.2705882, 1,
1.759154, -1.250122, 1.568542, 1, 0, 0.2627451, 1,
1.760686, -2.315665, 2.688558, 1, 0, 0.2588235, 1,
1.77501, -0.6393141, 1.218117, 1, 0, 0.2509804, 1,
1.777893, -0.6064104, 3.454223, 1, 0, 0.2470588, 1,
1.793823, 0.7104708, 0.4660896, 1, 0, 0.2392157, 1,
1.796727, 0.09366935, 2.868246, 1, 0, 0.2352941, 1,
1.815152, 0.9666624, -0.0669901, 1, 0, 0.227451, 1,
1.85975, -0.3378556, 1.241516, 1, 0, 0.2235294, 1,
1.867686, -0.01944335, 0.4930917, 1, 0, 0.2156863, 1,
1.886513, 0.2734347, 0.7673353, 1, 0, 0.2117647, 1,
1.89446, -0.2183122, 3.573661, 1, 0, 0.2039216, 1,
1.89951, -1.663063, 1.482477, 1, 0, 0.1960784, 1,
1.923016, 0.1333002, -0.6077778, 1, 0, 0.1921569, 1,
1.925708, 0.1145817, 2.214731, 1, 0, 0.1843137, 1,
1.930788, -2.440382, 2.646966, 1, 0, 0.1803922, 1,
1.938132, -1.253816, 1.66262, 1, 0, 0.172549, 1,
1.948412, 2.020085, 0.2275305, 1, 0, 0.1686275, 1,
1.948856, -0.1619737, 2.49665, 1, 0, 0.1607843, 1,
1.97016, -1.375875, 2.827297, 1, 0, 0.1568628, 1,
1.97184, 0.3299205, 0.206932, 1, 0, 0.1490196, 1,
1.975188, -0.3892103, 2.969338, 1, 0, 0.145098, 1,
1.996239, 1.555144, 1.428194, 1, 0, 0.1372549, 1,
2.031799, 0.6000306, 2.193975, 1, 0, 0.1333333, 1,
2.053288, -0.314262, 1.618526, 1, 0, 0.1254902, 1,
2.058836, -0.8856622, 1.116118, 1, 0, 0.1215686, 1,
2.10757, 0.6750603, 0.1674701, 1, 0, 0.1137255, 1,
2.127886, -0.706458, 1.382235, 1, 0, 0.1098039, 1,
2.147392, -1.390604, 3.626643, 1, 0, 0.1019608, 1,
2.178584, -0.148557, 1.158368, 1, 0, 0.09411765, 1,
2.195789, -0.4792699, 1.182913, 1, 0, 0.09019608, 1,
2.219958, -2.101709, 3.545049, 1, 0, 0.08235294, 1,
2.22926, 1.832412, 1.605533, 1, 0, 0.07843138, 1,
2.256152, -1.245988, 1.367627, 1, 0, 0.07058824, 1,
2.264449, 1.271519, 1.105065, 1, 0, 0.06666667, 1,
2.28668, -0.61732, 2.215081, 1, 0, 0.05882353, 1,
2.434179, 1.301183, 1.011139, 1, 0, 0.05490196, 1,
2.489883, 0.03657499, 0.2343709, 1, 0, 0.04705882, 1,
2.4902, 0.003411374, 1.242096, 1, 0, 0.04313726, 1,
2.658409, 0.4963454, 0.02238685, 1, 0, 0.03529412, 1,
2.693914, -0.7834171, 1.404586, 1, 0, 0.03137255, 1,
2.78577, 0.968554, 1.210504, 1, 0, 0.02352941, 1,
2.85751, 0.7789506, 2.813934, 1, 0, 0.01960784, 1,
3.183903, -0.8202305, 1.923007, 1, 0, 0.01176471, 1,
3.247919, -0.2516886, 2.080478, 1, 0, 0.007843138, 1
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
-0.04927993, -4.101737, -6.645653, 0, -0.5, 0.5, 0.5,
-0.04927993, -4.101737, -6.645653, 1, -0.5, 0.5, 0.5,
-0.04927993, -4.101737, -6.645653, 1, 1.5, 0.5, 0.5,
-0.04927993, -4.101737, -6.645653, 0, 1.5, 0.5, 0.5
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
-4.46423, 0.5630561, -6.645653, 0, -0.5, 0.5, 0.5,
-4.46423, 0.5630561, -6.645653, 1, -0.5, 0.5, 0.5,
-4.46423, 0.5630561, -6.645653, 1, 1.5, 0.5, 0.5,
-4.46423, 0.5630561, -6.645653, 0, 1.5, 0.5, 0.5
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
-4.46423, -4.101737, 0.3637168, 0, -0.5, 0.5, 0.5,
-4.46423, -4.101737, 0.3637168, 1, -0.5, 0.5, 0.5,
-4.46423, -4.101737, 0.3637168, 1, 1.5, 0.5, 0.5,
-4.46423, -4.101737, 0.3637168, 0, 1.5, 0.5, 0.5
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
-3, -3.025246, -5.028106,
3, -3.025246, -5.028106,
-3, -3.025246, -5.028106,
-3, -3.204661, -5.297697,
-2, -3.025246, -5.028106,
-2, -3.204661, -5.297697,
-1, -3.025246, -5.028106,
-1, -3.204661, -5.297697,
0, -3.025246, -5.028106,
0, -3.204661, -5.297697,
1, -3.025246, -5.028106,
1, -3.204661, -5.297697,
2, -3.025246, -5.028106,
2, -3.204661, -5.297697,
3, -3.025246, -5.028106,
3, -3.204661, -5.297697
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
-3, -3.563491, -5.83688, 0, -0.5, 0.5, 0.5,
-3, -3.563491, -5.83688, 1, -0.5, 0.5, 0.5,
-3, -3.563491, -5.83688, 1, 1.5, 0.5, 0.5,
-3, -3.563491, -5.83688, 0, 1.5, 0.5, 0.5,
-2, -3.563491, -5.83688, 0, -0.5, 0.5, 0.5,
-2, -3.563491, -5.83688, 1, -0.5, 0.5, 0.5,
-2, -3.563491, -5.83688, 1, 1.5, 0.5, 0.5,
-2, -3.563491, -5.83688, 0, 1.5, 0.5, 0.5,
-1, -3.563491, -5.83688, 0, -0.5, 0.5, 0.5,
-1, -3.563491, -5.83688, 1, -0.5, 0.5, 0.5,
-1, -3.563491, -5.83688, 1, 1.5, 0.5, 0.5,
-1, -3.563491, -5.83688, 0, 1.5, 0.5, 0.5,
0, -3.563491, -5.83688, 0, -0.5, 0.5, 0.5,
0, -3.563491, -5.83688, 1, -0.5, 0.5, 0.5,
0, -3.563491, -5.83688, 1, 1.5, 0.5, 0.5,
0, -3.563491, -5.83688, 0, 1.5, 0.5, 0.5,
1, -3.563491, -5.83688, 0, -0.5, 0.5, 0.5,
1, -3.563491, -5.83688, 1, -0.5, 0.5, 0.5,
1, -3.563491, -5.83688, 1, 1.5, 0.5, 0.5,
1, -3.563491, -5.83688, 0, 1.5, 0.5, 0.5,
2, -3.563491, -5.83688, 0, -0.5, 0.5, 0.5,
2, -3.563491, -5.83688, 1, -0.5, 0.5, 0.5,
2, -3.563491, -5.83688, 1, 1.5, 0.5, 0.5,
2, -3.563491, -5.83688, 0, 1.5, 0.5, 0.5,
3, -3.563491, -5.83688, 0, -0.5, 0.5, 0.5,
3, -3.563491, -5.83688, 1, -0.5, 0.5, 0.5,
3, -3.563491, -5.83688, 1, 1.5, 0.5, 0.5,
3, -3.563491, -5.83688, 0, 1.5, 0.5, 0.5
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
-3.445395, -2, -5.028106,
-3.445395, 4, -5.028106,
-3.445395, -2, -5.028106,
-3.615201, -2, -5.297697,
-3.445395, -1, -5.028106,
-3.615201, -1, -5.297697,
-3.445395, 0, -5.028106,
-3.615201, 0, -5.297697,
-3.445395, 1, -5.028106,
-3.615201, 1, -5.297697,
-3.445395, 2, -5.028106,
-3.615201, 2, -5.297697,
-3.445395, 3, -5.028106,
-3.615201, 3, -5.297697,
-3.445395, 4, -5.028106,
-3.615201, 4, -5.297697
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
"3",
"4"
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
-3.954813, -2, -5.83688, 0, -0.5, 0.5, 0.5,
-3.954813, -2, -5.83688, 1, -0.5, 0.5, 0.5,
-3.954813, -2, -5.83688, 1, 1.5, 0.5, 0.5,
-3.954813, -2, -5.83688, 0, 1.5, 0.5, 0.5,
-3.954813, -1, -5.83688, 0, -0.5, 0.5, 0.5,
-3.954813, -1, -5.83688, 1, -0.5, 0.5, 0.5,
-3.954813, -1, -5.83688, 1, 1.5, 0.5, 0.5,
-3.954813, -1, -5.83688, 0, 1.5, 0.5, 0.5,
-3.954813, 0, -5.83688, 0, -0.5, 0.5, 0.5,
-3.954813, 0, -5.83688, 1, -0.5, 0.5, 0.5,
-3.954813, 0, -5.83688, 1, 1.5, 0.5, 0.5,
-3.954813, 0, -5.83688, 0, 1.5, 0.5, 0.5,
-3.954813, 1, -5.83688, 0, -0.5, 0.5, 0.5,
-3.954813, 1, -5.83688, 1, -0.5, 0.5, 0.5,
-3.954813, 1, -5.83688, 1, 1.5, 0.5, 0.5,
-3.954813, 1, -5.83688, 0, 1.5, 0.5, 0.5,
-3.954813, 2, -5.83688, 0, -0.5, 0.5, 0.5,
-3.954813, 2, -5.83688, 1, -0.5, 0.5, 0.5,
-3.954813, 2, -5.83688, 1, 1.5, 0.5, 0.5,
-3.954813, 2, -5.83688, 0, 1.5, 0.5, 0.5,
-3.954813, 3, -5.83688, 0, -0.5, 0.5, 0.5,
-3.954813, 3, -5.83688, 1, -0.5, 0.5, 0.5,
-3.954813, 3, -5.83688, 1, 1.5, 0.5, 0.5,
-3.954813, 3, -5.83688, 0, 1.5, 0.5, 0.5,
-3.954813, 4, -5.83688, 0, -0.5, 0.5, 0.5,
-3.954813, 4, -5.83688, 1, -0.5, 0.5, 0.5,
-3.954813, 4, -5.83688, 1, 1.5, 0.5, 0.5,
-3.954813, 4, -5.83688, 0, 1.5, 0.5, 0.5
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
-3.445395, -3.025246, -4,
-3.445395, -3.025246, 4,
-3.445395, -3.025246, -4,
-3.615201, -3.204661, -4,
-3.445395, -3.025246, -2,
-3.615201, -3.204661, -2,
-3.445395, -3.025246, 0,
-3.615201, -3.204661, 0,
-3.445395, -3.025246, 2,
-3.615201, -3.204661, 2,
-3.445395, -3.025246, 4,
-3.615201, -3.204661, 4
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
-3.954813, -3.563491, -4, 0, -0.5, 0.5, 0.5,
-3.954813, -3.563491, -4, 1, -0.5, 0.5, 0.5,
-3.954813, -3.563491, -4, 1, 1.5, 0.5, 0.5,
-3.954813, -3.563491, -4, 0, 1.5, 0.5, 0.5,
-3.954813, -3.563491, -2, 0, -0.5, 0.5, 0.5,
-3.954813, -3.563491, -2, 1, -0.5, 0.5, 0.5,
-3.954813, -3.563491, -2, 1, 1.5, 0.5, 0.5,
-3.954813, -3.563491, -2, 0, 1.5, 0.5, 0.5,
-3.954813, -3.563491, 0, 0, -0.5, 0.5, 0.5,
-3.954813, -3.563491, 0, 1, -0.5, 0.5, 0.5,
-3.954813, -3.563491, 0, 1, 1.5, 0.5, 0.5,
-3.954813, -3.563491, 0, 0, 1.5, 0.5, 0.5,
-3.954813, -3.563491, 2, 0, -0.5, 0.5, 0.5,
-3.954813, -3.563491, 2, 1, -0.5, 0.5, 0.5,
-3.954813, -3.563491, 2, 1, 1.5, 0.5, 0.5,
-3.954813, -3.563491, 2, 0, 1.5, 0.5, 0.5,
-3.954813, -3.563491, 4, 0, -0.5, 0.5, 0.5,
-3.954813, -3.563491, 4, 1, -0.5, 0.5, 0.5,
-3.954813, -3.563491, 4, 1, 1.5, 0.5, 0.5,
-3.954813, -3.563491, 4, 0, 1.5, 0.5, 0.5
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
-3.445395, -3.025246, -5.028106,
-3.445395, 4.151358, -5.028106,
-3.445395, -3.025246, 5.75554,
-3.445395, 4.151358, 5.75554,
-3.445395, -3.025246, -5.028106,
-3.445395, -3.025246, 5.75554,
-3.445395, 4.151358, -5.028106,
-3.445395, 4.151358, 5.75554,
-3.445395, -3.025246, -5.028106,
3.346835, -3.025246, -5.028106,
-3.445395, -3.025246, 5.75554,
3.346835, -3.025246, 5.75554,
-3.445395, 4.151358, -5.028106,
3.346835, 4.151358, -5.028106,
-3.445395, 4.151358, 5.75554,
3.346835, 4.151358, 5.75554,
3.346835, -3.025246, -5.028106,
3.346835, 4.151358, -5.028106,
3.346835, -3.025246, 5.75554,
3.346835, 4.151358, 5.75554,
3.346835, -3.025246, -5.028106,
3.346835, -3.025246, 5.75554,
3.346835, 4.151358, -5.028106,
3.346835, 4.151358, 5.75554
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
var radius = 7.810095;
var distance = 34.74799;
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
mvMatrix.translate( 0.04927993, -0.5630561, -0.3637168 );
mvMatrix.scale( 1.243248, 1.176661, 0.7830772 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.74799);
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
triticonazole<-read.table("triticonazole.xyz")
```

```
## Error in read.table("triticonazole.xyz"): no lines available in input
```

```r
x<-triticonazole$V2
```

```
## Error in eval(expr, envir, enclos): object 'triticonazole' not found
```

```r
y<-triticonazole$V3
```

```
## Error in eval(expr, envir, enclos): object 'triticonazole' not found
```

```r
z<-triticonazole$V4
```

```
## Error in eval(expr, envir, enclos): object 'triticonazole' not found
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
-3.346479, -0.1504981, -2.7102, 0, 0, 1, 1, 1,
-3.293552, -0.1873363, -0.8357659, 1, 0, 0, 1, 1,
-2.822408, 2.176348, -2.77268, 1, 0, 0, 1, 1,
-2.673232, 0.4822203, -2.386687, 1, 0, 0, 1, 1,
-2.463195, -0.5461024, 0.01046376, 1, 0, 0, 1, 1,
-2.427863, -1.390955, -2.320837, 1, 0, 0, 1, 1,
-2.396108, 1.175163, -1.390478, 0, 0, 0, 1, 1,
-2.344849, -0.1741922, 0.4618005, 0, 0, 0, 1, 1,
-2.315073, 0.7402584, -1.039753, 0, 0, 0, 1, 1,
-2.292997, 0.3126569, -1.387007, 0, 0, 0, 1, 1,
-2.259186, 0.1856729, -2.14695, 0, 0, 0, 1, 1,
-2.198199, -1.361828, -1.185484, 0, 0, 0, 1, 1,
-2.184996, 1.410679, -2.787549, 0, 0, 0, 1, 1,
-2.162935, 0.7258028, -0.3528758, 1, 1, 1, 1, 1,
-2.119176, 0.2241587, -2.343778, 1, 1, 1, 1, 1,
-2.104167, 0.009585755, -0.8100007, 1, 1, 1, 1, 1,
-2.085754, 0.863824, -0.2308025, 1, 1, 1, 1, 1,
-2.084562, 1.311897, -3.034057, 1, 1, 1, 1, 1,
-2.050369, 0.9112961, -1.003682, 1, 1, 1, 1, 1,
-2.027314, -0.8099066, -1.485907, 1, 1, 1, 1, 1,
-2.013265, -1.538184, -3.262061, 1, 1, 1, 1, 1,
-1.987949, 0.2500252, -1.193023, 1, 1, 1, 1, 1,
-1.986168, -1.233147, -2.075466, 1, 1, 1, 1, 1,
-1.980176, -0.08596791, -1.404257, 1, 1, 1, 1, 1,
-1.950759, 0.8347478, -1.934496, 1, 1, 1, 1, 1,
-1.950581, 2.568466, -0.1200109, 1, 1, 1, 1, 1,
-1.949916, 1.645501, -3.659636, 1, 1, 1, 1, 1,
-1.949513, -1.528075, -2.084214, 1, 1, 1, 1, 1,
-1.935334, -1.143947, -1.941073, 0, 0, 1, 1, 1,
-1.900058, -0.731153, -2.350018, 1, 0, 0, 1, 1,
-1.888284, -0.9845268, -3.955191, 1, 0, 0, 1, 1,
-1.849144, -0.796531, -2.039119, 1, 0, 0, 1, 1,
-1.820267, -0.2205449, -1.325226, 1, 0, 0, 1, 1,
-1.809654, -0.8287892, -2.055877, 1, 0, 0, 1, 1,
-1.808202, -0.07780755, -1.582714, 0, 0, 0, 1, 1,
-1.798401, -0.1905084, -1.203019, 0, 0, 0, 1, 1,
-1.792039, -0.465848, -2.442653, 0, 0, 0, 1, 1,
-1.759399, -1.056865, -1.57844, 0, 0, 0, 1, 1,
-1.757528, 0.7299193, -1.749026, 0, 0, 0, 1, 1,
-1.756751, -1.679122, -1.77487, 0, 0, 0, 1, 1,
-1.743845, 0.01721265, -0.8123501, 0, 0, 0, 1, 1,
-1.739334, 0.7267463, -1.05318, 1, 1, 1, 1, 1,
-1.738064, -0.86133, -3.633714, 1, 1, 1, 1, 1,
-1.724491, -0.2327984, -1.756539, 1, 1, 1, 1, 1,
-1.707021, 0.7545786, -0.9290501, 1, 1, 1, 1, 1,
-1.69749, 0.6481435, -0.5694991, 1, 1, 1, 1, 1,
-1.693233, 0.242283, -1.176235, 1, 1, 1, 1, 1,
-1.683801, 0.8205345, -1.229056, 1, 1, 1, 1, 1,
-1.683323, 1.987139, -2.23771, 1, 1, 1, 1, 1,
-1.676451, -0.1425191, -1.835522, 1, 1, 1, 1, 1,
-1.656046, 1.568807, -1.515298, 1, 1, 1, 1, 1,
-1.634909, 0.4889807, -0.7470559, 1, 1, 1, 1, 1,
-1.630376, 0.08983273, -1.586956, 1, 1, 1, 1, 1,
-1.610172, -0.6052283, -2.663439, 1, 1, 1, 1, 1,
-1.607206, -0.7174473, -2.604767, 1, 1, 1, 1, 1,
-1.598604, -0.2853208, -3.658998, 1, 1, 1, 1, 1,
-1.596681, -1.622383, -3.118982, 0, 0, 1, 1, 1,
-1.588234, 0.4154937, -1.127845, 1, 0, 0, 1, 1,
-1.580757, 0.2724728, -1.669299, 1, 0, 0, 1, 1,
-1.56378, 1.194944, -2.506461, 1, 0, 0, 1, 1,
-1.546938, 0.4879652, -1.791042, 1, 0, 0, 1, 1,
-1.517041, -0.578001, -1.193926, 1, 0, 0, 1, 1,
-1.515852, 0.0498312, -1.120705, 0, 0, 0, 1, 1,
-1.511139, -0.2519134, -1.241878, 0, 0, 0, 1, 1,
-1.509726, 0.1412525, -0.178768, 0, 0, 0, 1, 1,
-1.506903, -0.992212, -2.499233, 0, 0, 0, 1, 1,
-1.50247, 0.9683021, -1.613454, 0, 0, 0, 1, 1,
-1.499168, 1.515042, 0.1794052, 0, 0, 0, 1, 1,
-1.498356, -0.9418762, -1.723066, 0, 0, 0, 1, 1,
-1.497894, 0.2389198, -1.279649, 1, 1, 1, 1, 1,
-1.470799, 1.441404, -1.672111, 1, 1, 1, 1, 1,
-1.468271, 0.3015078, -1.44955, 1, 1, 1, 1, 1,
-1.464748, 1.576964, -0.6975675, 1, 1, 1, 1, 1,
-1.464739, 0.3210755, -2.073218, 1, 1, 1, 1, 1,
-1.458117, 0.4518686, -2.146342, 1, 1, 1, 1, 1,
-1.453145, 1.461262, -0.509241, 1, 1, 1, 1, 1,
-1.452325, -0.1701854, 0.3459892, 1, 1, 1, 1, 1,
-1.452211, 0.2658429, -2.761025, 1, 1, 1, 1, 1,
-1.449433, -0.193974, -0.4756446, 1, 1, 1, 1, 1,
-1.418045, -1.366946, -2.952603, 1, 1, 1, 1, 1,
-1.412802, 0.2687671, -2.352838, 1, 1, 1, 1, 1,
-1.40548, 0.9191939, -0.5225499, 1, 1, 1, 1, 1,
-1.397675, -0.4977931, -2.0638, 1, 1, 1, 1, 1,
-1.394963, -0.656619, -1.563852, 1, 1, 1, 1, 1,
-1.394036, 1.367975, -0.3412221, 0, 0, 1, 1, 1,
-1.393345, -1.10989, -1.862116, 1, 0, 0, 1, 1,
-1.392099, -0.1414889, -1.564754, 1, 0, 0, 1, 1,
-1.390238, 0.6029249, -2.002003, 1, 0, 0, 1, 1,
-1.388316, 0.1434218, -0.1908506, 1, 0, 0, 1, 1,
-1.377617, 0.07851915, -2.306578, 1, 0, 0, 1, 1,
-1.363187, 0.7378212, -0.7496852, 0, 0, 0, 1, 1,
-1.352766, -1.241455, -2.20847, 0, 0, 0, 1, 1,
-1.344511, -0.7601562, 0.7336122, 0, 0, 0, 1, 1,
-1.34276, -0.3991933, -2.224661, 0, 0, 0, 1, 1,
-1.342726, 0.6370066, -1.753475, 0, 0, 0, 1, 1,
-1.338798, 0.3656592, -2.069306, 0, 0, 0, 1, 1,
-1.329674, 0.9601967, -1.805234, 0, 0, 0, 1, 1,
-1.324656, 0.8465461, -1.599316, 1, 1, 1, 1, 1,
-1.319952, -1.343188, -3.211184, 1, 1, 1, 1, 1,
-1.318645, -1.310754, -2.493415, 1, 1, 1, 1, 1,
-1.316027, 0.2228761, -0.751439, 1, 1, 1, 1, 1,
-1.308685, 0.2958015, -1.345331, 1, 1, 1, 1, 1,
-1.303683, -0.270725, -2.664586, 1, 1, 1, 1, 1,
-1.297868, -1.400578, -2.517653, 1, 1, 1, 1, 1,
-1.289208, 0.4423039, -2.463983, 1, 1, 1, 1, 1,
-1.289189, 0.05538667, -0.5959365, 1, 1, 1, 1, 1,
-1.288116, 1.404057, -0.3060191, 1, 1, 1, 1, 1,
-1.2876, -1.733575, -3.11671, 1, 1, 1, 1, 1,
-1.283822, 0.07864452, -2.139732, 1, 1, 1, 1, 1,
-1.278337, -0.2928427, -1.023013, 1, 1, 1, 1, 1,
-1.277266, 0.996897, -1.553274, 1, 1, 1, 1, 1,
-1.270597, 0.9731593, 0.08602082, 1, 1, 1, 1, 1,
-1.265159, 0.2734807, -2.028389, 0, 0, 1, 1, 1,
-1.263613, 0.6416645, -2.270323, 1, 0, 0, 1, 1,
-1.250812, -2.411091, -2.819797, 1, 0, 0, 1, 1,
-1.250639, 0.6409879, -0.4734831, 1, 0, 0, 1, 1,
-1.250329, 0.9628338, -3.574425, 1, 0, 0, 1, 1,
-1.244921, -1.815939, -1.186557, 1, 0, 0, 1, 1,
-1.241917, -0.07381278, 0.2425062, 0, 0, 0, 1, 1,
-1.239026, 1.499845, 0.8127335, 0, 0, 0, 1, 1,
-1.223952, -0.1434511, 0.05490244, 0, 0, 0, 1, 1,
-1.221473, -2.062555, -2.332071, 0, 0, 0, 1, 1,
-1.218794, -0.2705363, -3.122297, 0, 0, 0, 1, 1,
-1.218624, -0.8473716, -1.460678, 0, 0, 0, 1, 1,
-1.207798, 1.877184, 0.5350438, 0, 0, 0, 1, 1,
-1.206109, 0.6021906, -1.620507, 1, 1, 1, 1, 1,
-1.197198, 0.821263, -1.846984, 1, 1, 1, 1, 1,
-1.195789, -0.1350291, -1.72325, 1, 1, 1, 1, 1,
-1.194483, 0.008999814, -2.854744, 1, 1, 1, 1, 1,
-1.194447, 1.757116, 1.228963, 1, 1, 1, 1, 1,
-1.183966, -0.06700392, -1.30454, 1, 1, 1, 1, 1,
-1.181068, -0.6789179, -2.451971, 1, 1, 1, 1, 1,
-1.177867, -0.0573657, -0.3213554, 1, 1, 1, 1, 1,
-1.139825, 1.033321, -1.15648, 1, 1, 1, 1, 1,
-1.135717, -0.5268656, -1.859837, 1, 1, 1, 1, 1,
-1.135462, -0.06608447, -1.441912, 1, 1, 1, 1, 1,
-1.128286, -2.024959, -1.704362, 1, 1, 1, 1, 1,
-1.111245, 0.147747, -1.206185, 1, 1, 1, 1, 1,
-1.104592, 0.2863727, -0.2527768, 1, 1, 1, 1, 1,
-1.092817, -1.055377, -0.9455069, 1, 1, 1, 1, 1,
-1.09238, -0.8662371, -3.136063, 0, 0, 1, 1, 1,
-1.088968, -0.1042794, -1.40176, 1, 0, 0, 1, 1,
-1.088173, 1.212182, -0.2724099, 1, 0, 0, 1, 1,
-1.08771, -1.7828, -2.335576, 1, 0, 0, 1, 1,
-1.082655, 0.7590065, -1.577719, 1, 0, 0, 1, 1,
-1.079254, -0.3689162, -2.744585, 1, 0, 0, 1, 1,
-1.078636, 1.597779, 0.9151335, 0, 0, 0, 1, 1,
-1.076773, 0.3162528, -1.513897, 0, 0, 0, 1, 1,
-1.076211, -0.4360963, -0.9689177, 0, 0, 0, 1, 1,
-1.076157, 0.7849834, -0.9384009, 0, 0, 0, 1, 1,
-1.073675, -0.1630462, -3.274503, 0, 0, 0, 1, 1,
-1.067531, -0.4336781, -2.434927, 0, 0, 0, 1, 1,
-1.062125, -0.08407412, -1.597475, 0, 0, 0, 1, 1,
-1.061781, -0.23427, -0.442748, 1, 1, 1, 1, 1,
-1.059327, 0.01962397, -0.2601743, 1, 1, 1, 1, 1,
-1.054073, -1.117129, -3.026572, 1, 1, 1, 1, 1,
-1.052115, -0.8207557, -2.704106, 1, 1, 1, 1, 1,
-1.051176, -0.394388, -1.538238, 1, 1, 1, 1, 1,
-1.047987, -0.1544313, -1.665835, 1, 1, 1, 1, 1,
-1.041712, 0.3996374, -0.8390172, 1, 1, 1, 1, 1,
-1.038625, 0.2776197, -1.685791, 1, 1, 1, 1, 1,
-1.038485, 0.4842662, -1.731398, 1, 1, 1, 1, 1,
-1.036901, 1.13836, -0.8168256, 1, 1, 1, 1, 1,
-1.031491, 0.6863077, -0.1064752, 1, 1, 1, 1, 1,
-1.025531, -0.5455073, -2.015497, 1, 1, 1, 1, 1,
-1.020098, 0.6216554, -0.8494358, 1, 1, 1, 1, 1,
-1.017871, 1.541129, -0.6797362, 1, 1, 1, 1, 1,
-1.015883, -0.1141889, -3.022354, 1, 1, 1, 1, 1,
-1.012988, 1.058559, -1.000476, 0, 0, 1, 1, 1,
-1.001858, -0.7968616, -1.685001, 1, 0, 0, 1, 1,
-1.000965, -0.6866668, -3.469746, 1, 0, 0, 1, 1,
-0.9951569, -0.004973498, -1.479498, 1, 0, 0, 1, 1,
-0.9902471, -0.3754497, -3.330292, 1, 0, 0, 1, 1,
-0.9879438, -1.385331, -3.400669, 1, 0, 0, 1, 1,
-0.9808662, -0.09639259, -1.490333, 0, 0, 0, 1, 1,
-0.9751899, 0.08792728, -3.322334, 0, 0, 0, 1, 1,
-0.9729035, 1.26714, -0.8795511, 0, 0, 0, 1, 1,
-0.9727843, -0.09220162, -2.485828, 0, 0, 0, 1, 1,
-0.9715641, -1.300374, -3.828943, 0, 0, 0, 1, 1,
-0.9636505, -2.920732, -3.010453, 0, 0, 0, 1, 1,
-0.9620258, 0.9061637, -0.2439057, 0, 0, 0, 1, 1,
-0.9598598, 0.02603024, -0.4551784, 1, 1, 1, 1, 1,
-0.958533, 1.593676, -0.3625735, 1, 1, 1, 1, 1,
-0.9546503, 0.7891793, -0.9610219, 1, 1, 1, 1, 1,
-0.9517065, 0.4691797, -2.678034, 1, 1, 1, 1, 1,
-0.9432608, -0.08750559, -0.7553008, 1, 1, 1, 1, 1,
-0.9391826, 1.479519, -2.598993, 1, 1, 1, 1, 1,
-0.9344196, 0.6049954, -0.2993087, 1, 1, 1, 1, 1,
-0.9337265, 0.5572435, -1.608245, 1, 1, 1, 1, 1,
-0.9317356, 0.06852809, -1.795773, 1, 1, 1, 1, 1,
-0.9233976, 1.279355, 0.5901148, 1, 1, 1, 1, 1,
-0.9192464, -0.3977551, -2.924126, 1, 1, 1, 1, 1,
-0.918941, 0.4109824, -1.52741, 1, 1, 1, 1, 1,
-0.9156981, 1.085968, 0.3608466, 1, 1, 1, 1, 1,
-0.9065719, -1.474171, -3.695428, 1, 1, 1, 1, 1,
-0.90492, -0.01018163, -1.430535, 1, 1, 1, 1, 1,
-0.9038751, -0.3975621, -1.896548, 0, 0, 1, 1, 1,
-0.9019247, 0.630561, -1.3329, 1, 0, 0, 1, 1,
-0.9018759, -0.6680834, -1.522891, 1, 0, 0, 1, 1,
-0.9004326, -0.2044343, 0.1813302, 1, 0, 0, 1, 1,
-0.8993002, 1.588157, -0.05341101, 1, 0, 0, 1, 1,
-0.8992698, 0.4415303, -0.4226159, 1, 0, 0, 1, 1,
-0.8986979, 0.02473515, -1.565211, 0, 0, 0, 1, 1,
-0.8960403, 0.6767217, -0.1695992, 0, 0, 0, 1, 1,
-0.8960133, 0.09374002, -1.838683, 0, 0, 0, 1, 1,
-0.8824603, 0.8848712, -0.8372915, 0, 0, 0, 1, 1,
-0.8798414, -0.433989, -2.994461, 0, 0, 0, 1, 1,
-0.8752735, 0.510979, -0.3458115, 0, 0, 0, 1, 1,
-0.8711594, 1.596073, 1.71244, 0, 0, 0, 1, 1,
-0.870146, 0.7882833, 1.023647, 1, 1, 1, 1, 1,
-0.8674883, -0.4996348, -2.423718, 1, 1, 1, 1, 1,
-0.8592073, 0.00965227, -0.8624101, 1, 1, 1, 1, 1,
-0.8441612, 1.329874, 0.1504029, 1, 1, 1, 1, 1,
-0.8408602, 0.3472318, -1.287655, 1, 1, 1, 1, 1,
-0.8390049, 0.6403243, -0.9846337, 1, 1, 1, 1, 1,
-0.8275021, -0.702702, -2.307352, 1, 1, 1, 1, 1,
-0.8243468, 0.1644001, -0.557399, 1, 1, 1, 1, 1,
-0.8198783, -1.19635, -2.609149, 1, 1, 1, 1, 1,
-0.8143921, 0.9241853, -1.151654, 1, 1, 1, 1, 1,
-0.8122351, 1.265595, -3.702399, 1, 1, 1, 1, 1,
-0.8114004, 0.4327283, 0.5981585, 1, 1, 1, 1, 1,
-0.8086553, -0.4408036, -1.240193, 1, 1, 1, 1, 1,
-0.8074331, 0.1711939, -0.915738, 1, 1, 1, 1, 1,
-0.8071694, 0.03701369, -1.498147, 1, 1, 1, 1, 1,
-0.8006339, 0.0387712, -2.157564, 0, 0, 1, 1, 1,
-0.7972062, -0.4506487, -1.751053, 1, 0, 0, 1, 1,
-0.7959323, 1.291084, 1.374799, 1, 0, 0, 1, 1,
-0.7958604, 1.362386, -0.6719533, 1, 0, 0, 1, 1,
-0.7941951, 0.1336756, -1.211428, 1, 0, 0, 1, 1,
-0.7934194, -0.4993355, -1.029234, 1, 0, 0, 1, 1,
-0.7907847, 1.449635, -0.6386738, 0, 0, 0, 1, 1,
-0.7855675, 0.09153177, -2.163631, 0, 0, 0, 1, 1,
-0.7793542, -0.3440454, -1.616375, 0, 0, 0, 1, 1,
-0.7774344, -0.490775, -2.499545, 0, 0, 0, 1, 1,
-0.7737169, -0.1144772, -2.491343, 0, 0, 0, 1, 1,
-0.7720079, 0.06869451, -0.7460086, 0, 0, 0, 1, 1,
-0.7706143, 0.409827, -0.7948315, 0, 0, 0, 1, 1,
-0.7704068, 0.2404653, -1.239112, 1, 1, 1, 1, 1,
-0.7698081, 0.4775277, -1.43286, 1, 1, 1, 1, 1,
-0.7682322, 0.403063, -2.690947, 1, 1, 1, 1, 1,
-0.762921, -1.82432, -2.075192, 1, 1, 1, 1, 1,
-0.7628153, 1.115057, 0.624343, 1, 1, 1, 1, 1,
-0.7582567, 0.6654994, -1.507528, 1, 1, 1, 1, 1,
-0.7562994, -0.8208248, -2.775426, 1, 1, 1, 1, 1,
-0.7544839, 0.7577758, -0.8126939, 1, 1, 1, 1, 1,
-0.7542823, 0.8072566, -0.4322782, 1, 1, 1, 1, 1,
-0.7522939, 1.41653, -1.534612, 1, 1, 1, 1, 1,
-0.745957, 0.2509093, -1.351536, 1, 1, 1, 1, 1,
-0.7435703, 0.1821344, -1.381738, 1, 1, 1, 1, 1,
-0.7420376, -0.08051596, -3.242818, 1, 1, 1, 1, 1,
-0.7395874, 0.8616331, -0.3245959, 1, 1, 1, 1, 1,
-0.7388591, 0.9176877, -0.4696069, 1, 1, 1, 1, 1,
-0.7342241, -1.234667, -1.583818, 0, 0, 1, 1, 1,
-0.7341244, -0.5630295, -2.990746, 1, 0, 0, 1, 1,
-0.7317747, 0.6482098, -0.6780826, 1, 0, 0, 1, 1,
-0.7314112, -0.5358288, -3.574636, 1, 0, 0, 1, 1,
-0.7305998, -0.4388114, -2.253283, 1, 0, 0, 1, 1,
-0.7289997, -0.8657554, -0.9042135, 1, 0, 0, 1, 1,
-0.7253509, -0.3194303, -2.055021, 0, 0, 0, 1, 1,
-0.7225301, 0.06094995, -1.382701, 0, 0, 0, 1, 1,
-0.707762, 1.248139, -0.1368383, 0, 0, 0, 1, 1,
-0.7011985, -0.582741, -2.216648, 0, 0, 0, 1, 1,
-0.6986799, 0.4338425, -1.500204, 0, 0, 0, 1, 1,
-0.6909198, 1.805103, -0.239666, 0, 0, 0, 1, 1,
-0.6899133, 1.505863, -0.5757834, 0, 0, 0, 1, 1,
-0.6897742, 0.6116387, 1.306498, 1, 1, 1, 1, 1,
-0.6875467, 0.1168721, -0.9094948, 1, 1, 1, 1, 1,
-0.6866415, 0.7257317, -2.035664, 1, 1, 1, 1, 1,
-0.6866335, -0.07731717, -3.093905, 1, 1, 1, 1, 1,
-0.6854196, 0.6772997, 1.504703, 1, 1, 1, 1, 1,
-0.6805246, 1.017175, -0.1488255, 1, 1, 1, 1, 1,
-0.680351, -0.3402883, -2.140877, 1, 1, 1, 1, 1,
-0.675477, 1.437147, 1.57194, 1, 1, 1, 1, 1,
-0.6718382, 1.011675, -1.332941, 1, 1, 1, 1, 1,
-0.6474231, -0.7616643, -3.20615, 1, 1, 1, 1, 1,
-0.64707, -0.0358247, -0.9299234, 1, 1, 1, 1, 1,
-0.6445466, -1.604494, -2.180705, 1, 1, 1, 1, 1,
-0.6441264, 0.6145505, -0.3633699, 1, 1, 1, 1, 1,
-0.643679, 0.03583349, -0.2898458, 1, 1, 1, 1, 1,
-0.6406067, -0.8106587, -3.132608, 1, 1, 1, 1, 1,
-0.6272794, 0.2201238, 0.1198727, 0, 0, 1, 1, 1,
-0.6261618, 0.38821, -0.7189769, 1, 0, 0, 1, 1,
-0.6259184, -0.3167705, 0.06669904, 1, 0, 0, 1, 1,
-0.6218078, -0.2704106, -3.584318, 1, 0, 0, 1, 1,
-0.6215907, -0.6301463, -3.257171, 1, 0, 0, 1, 1,
-0.6206672, 0.02719453, -3.04881, 1, 0, 0, 1, 1,
-0.6204742, -0.1511539, -0.904741, 0, 0, 0, 1, 1,
-0.6135822, 0.9400647, -0.9939116, 0, 0, 0, 1, 1,
-0.6103376, -0.9942199, -3.388282, 0, 0, 0, 1, 1,
-0.6073773, 1.489368, -1.774587, 0, 0, 0, 1, 1,
-0.6064374, -1.053558, -2.674669, 0, 0, 0, 1, 1,
-0.6009094, -0.914781, -2.521077, 0, 0, 0, 1, 1,
-0.5976886, -0.586965, -2.46432, 0, 0, 0, 1, 1,
-0.5958906, -0.7961709, -3.876936, 1, 1, 1, 1, 1,
-0.5935224, 1.179505, -2.127854, 1, 1, 1, 1, 1,
-0.5927949, -0.3006261, -2.555938, 1, 1, 1, 1, 1,
-0.5909199, 1.378362, 0.6394736, 1, 1, 1, 1, 1,
-0.5899822, 2.171221, -2.001446, 1, 1, 1, 1, 1,
-0.5867535, 0.09224136, -0.900422, 1, 1, 1, 1, 1,
-0.5860524, -1.096794, -3.40029, 1, 1, 1, 1, 1,
-0.5824667, -1.67767, -2.141304, 1, 1, 1, 1, 1,
-0.5793313, -0.7440338, -1.87022, 1, 1, 1, 1, 1,
-0.5772275, 0.6597406, -0.8410263, 1, 1, 1, 1, 1,
-0.5661056, -1.831684, -1.758391, 1, 1, 1, 1, 1,
-0.5623962, 0.4047928, 0.2992996, 1, 1, 1, 1, 1,
-0.5623289, 0.9628962, 1.309764, 1, 1, 1, 1, 1,
-0.56074, -1.359335, -1.804495, 1, 1, 1, 1, 1,
-0.5575728, -0.5009299, -2.196303, 1, 1, 1, 1, 1,
-0.5574421, 0.5882175, -1.247534, 0, 0, 1, 1, 1,
-0.5567302, -0.6610851, -1.917014, 1, 0, 0, 1, 1,
-0.5460656, 0.4258897, -1.413135, 1, 0, 0, 1, 1,
-0.545644, -0.1423591, -1.502972, 1, 0, 0, 1, 1,
-0.5444379, -0.4698077, -2.090345, 1, 0, 0, 1, 1,
-0.5326378, 1.685155, -0.7215232, 1, 0, 0, 1, 1,
-0.52587, -0.7362928, -2.329913, 0, 0, 0, 1, 1,
-0.5201601, -1.42795, -2.115179, 0, 0, 0, 1, 1,
-0.5192532, 0.8133468, 0.3689079, 0, 0, 0, 1, 1,
-0.5191518, 0.2710792, -0.3678725, 0, 0, 0, 1, 1,
-0.5161496, -2.069094, -2.507781, 0, 0, 0, 1, 1,
-0.5149587, -0.1484867, -1.942743, 0, 0, 0, 1, 1,
-0.5071688, -0.7565444, -3.35868, 0, 0, 0, 1, 1,
-0.5060833, 1.145797, -1.502152, 1, 1, 1, 1, 1,
-0.5044797, 0.4635469, -2.701723, 1, 1, 1, 1, 1,
-0.5023028, 2.282104, 1.525669, 1, 1, 1, 1, 1,
-0.5019636, 0.1760539, -0.3281685, 1, 1, 1, 1, 1,
-0.5014988, -0.2833908, -0.3501575, 1, 1, 1, 1, 1,
-0.4993596, 0.4730746, -3.062735, 1, 1, 1, 1, 1,
-0.4987597, -0.6091518, -3.210052, 1, 1, 1, 1, 1,
-0.4983818, 0.5294212, -0.8010601, 1, 1, 1, 1, 1,
-0.4960851, -1.729261, -2.243495, 1, 1, 1, 1, 1,
-0.4953941, 0.585524, -0.1172487, 1, 1, 1, 1, 1,
-0.4920899, -0.7744511, -2.221971, 1, 1, 1, 1, 1,
-0.4891586, 0.1576285, -1.299013, 1, 1, 1, 1, 1,
-0.4861344, 0.5580404, 0.4522173, 1, 1, 1, 1, 1,
-0.480362, 0.2273297, -0.2496585, 1, 1, 1, 1, 1,
-0.4779063, -0.425255, -2.869741, 1, 1, 1, 1, 1,
-0.4766015, -0.5491356, -2.20033, 0, 0, 1, 1, 1,
-0.4763756, 0.4392785, 0.2340347, 1, 0, 0, 1, 1,
-0.4733838, -0.5102511, -2.729466, 1, 0, 0, 1, 1,
-0.4733149, 1.263395, -0.7172855, 1, 0, 0, 1, 1,
-0.4682638, -0.501443, -1.613246, 1, 0, 0, 1, 1,
-0.4652186, -1.068529, -2.595145, 1, 0, 0, 1, 1,
-0.4626853, 1.321409, -0.7911932, 0, 0, 0, 1, 1,
-0.4624291, -0.419558, -2.007868, 0, 0, 0, 1, 1,
-0.4597239, 0.6776588, -0.6123253, 0, 0, 0, 1, 1,
-0.4595012, 0.3306802, -0.7839816, 0, 0, 0, 1, 1,
-0.455186, -1.690135, -1.228261, 0, 0, 0, 1, 1,
-0.4525055, -0.803344, -2.430066, 0, 0, 0, 1, 1,
-0.4517993, -0.7544799, -2.136262, 0, 0, 0, 1, 1,
-0.4488534, 0.292554, -2.571856, 1, 1, 1, 1, 1,
-0.4470581, 1.212943, 0.1729496, 1, 1, 1, 1, 1,
-0.4451397, -0.06598782, -1.330861, 1, 1, 1, 1, 1,
-0.4418015, -0.1438905, -0.08974763, 1, 1, 1, 1, 1,
-0.4414235, 0.06061441, -1.211928, 1, 1, 1, 1, 1,
-0.4391849, 1.367275, 0.08627722, 1, 1, 1, 1, 1,
-0.4299898, -0.3228662, -1.088271, 1, 1, 1, 1, 1,
-0.4294674, -1.800326, -4.671533, 1, 1, 1, 1, 1,
-0.425897, -0.3844003, -2.570164, 1, 1, 1, 1, 1,
-0.4248373, 0.4906502, -1.039333, 1, 1, 1, 1, 1,
-0.4167325, -0.3753099, -3.136784, 1, 1, 1, 1, 1,
-0.4137509, -0.5373402, -1.7126, 1, 1, 1, 1, 1,
-0.412776, 0.3268243, -1.867071, 1, 1, 1, 1, 1,
-0.4051225, 0.7567064, -0.6176596, 1, 1, 1, 1, 1,
-0.4034351, -1.579929, -3.980998, 1, 1, 1, 1, 1,
-0.4031967, -0.3857987, -2.277332, 0, 0, 1, 1, 1,
-0.4024293, 1.07864, -1.493786, 1, 0, 0, 1, 1,
-0.402222, -0.107595, -2.105954, 1, 0, 0, 1, 1,
-0.401525, 1.723589, -0.2843072, 1, 0, 0, 1, 1,
-0.401351, -0.5730783, -3.933082, 1, 0, 0, 1, 1,
-0.3942131, 0.2359842, -0.5733649, 1, 0, 0, 1, 1,
-0.3938458, 1.065415, 1.009356, 0, 0, 0, 1, 1,
-0.3888577, 0.7339082, -1.3363, 0, 0, 0, 1, 1,
-0.3869509, -0.01896209, -1.811138, 0, 0, 0, 1, 1,
-0.3809522, -0.1691136, -2.903445, 0, 0, 0, 1, 1,
-0.3793422, 0.1051745, -1.327451, 0, 0, 0, 1, 1,
-0.3779556, -2.527703, -1.801656, 0, 0, 0, 1, 1,
-0.3741784, -0.4619429, -4.762682, 0, 0, 0, 1, 1,
-0.3636634, 0.5575112, 0.3837052, 1, 1, 1, 1, 1,
-0.3615053, -0.1191514, -2.218205, 1, 1, 1, 1, 1,
-0.3611709, 0.4691512, -1.129036, 1, 1, 1, 1, 1,
-0.3584029, -0.551748, -1.696744, 1, 1, 1, 1, 1,
-0.3575309, -0.1289399, -1.593518, 1, 1, 1, 1, 1,
-0.3537161, -0.7591738, -3.653147, 1, 1, 1, 1, 1,
-0.3533556, 1.195864, -1.890227, 1, 1, 1, 1, 1,
-0.3531913, -0.8802295, -3.754493, 1, 1, 1, 1, 1,
-0.3528924, 1.216877, -0.4023778, 1, 1, 1, 1, 1,
-0.3525712, 0.09603481, -0.1845924, 1, 1, 1, 1, 1,
-0.3451543, -0.3714151, -3.50549, 1, 1, 1, 1, 1,
-0.3404069, 0.262469, -1.485419, 1, 1, 1, 1, 1,
-0.3351375, 0.7133582, -0.48773, 1, 1, 1, 1, 1,
-0.3349106, 0.9991231, 1.540374, 1, 1, 1, 1, 1,
-0.3333789, -0.681337, -1.757307, 1, 1, 1, 1, 1,
-0.3323944, -2.202327, -3.092393, 0, 0, 1, 1, 1,
-0.3183793, -0.009230148, -2.596023, 1, 0, 0, 1, 1,
-0.3142905, 1.346962, 0.04792843, 1, 0, 0, 1, 1,
-0.3132209, 1.615989, -0.9705858, 1, 0, 0, 1, 1,
-0.3071514, 0.5231224, -1.58368, 1, 0, 0, 1, 1,
-0.3063897, -0.69921, -2.622107, 1, 0, 0, 1, 1,
-0.3046199, -0.0637367, -1.376486, 0, 0, 0, 1, 1,
-0.3030503, -0.8353621, -2.639585, 0, 0, 0, 1, 1,
-0.2998808, -1.733789, -3.368436, 0, 0, 0, 1, 1,
-0.2982356, 0.1344562, -2.035835, 0, 0, 0, 1, 1,
-0.2961749, 0.7997225, -1.254947, 0, 0, 0, 1, 1,
-0.2870277, 1.440673, -1.09199, 0, 0, 0, 1, 1,
-0.2866093, -1.1915, -3.897263, 0, 0, 0, 1, 1,
-0.2846573, 0.1135438, -0.9669837, 1, 1, 1, 1, 1,
-0.2839787, 0.4092222, -0.831584, 1, 1, 1, 1, 1,
-0.2803338, -0.6581016, -2.399333, 1, 1, 1, 1, 1,
-0.2784733, 1.316753, -0.3726603, 1, 1, 1, 1, 1,
-0.2765485, 0.06670504, -2.649409, 1, 1, 1, 1, 1,
-0.2722246, 0.9386892, -0.06160087, 1, 1, 1, 1, 1,
-0.2716626, -1.378246, -3.151573, 1, 1, 1, 1, 1,
-0.2700908, -0.4597351, -4.450323, 1, 1, 1, 1, 1,
-0.2676781, -1.048536, -2.347978, 1, 1, 1, 1, 1,
-0.2653642, -0.2956413, -3.059928, 1, 1, 1, 1, 1,
-0.2622494, 3.269697, 0.9169487, 1, 1, 1, 1, 1,
-0.261291, -1.355814, -3.17212, 1, 1, 1, 1, 1,
-0.2590735, -0.6815736, -4.13942, 1, 1, 1, 1, 1,
-0.2589296, -1.200091, -3.133472, 1, 1, 1, 1, 1,
-0.2524905, 1.989959, -0.636116, 1, 1, 1, 1, 1,
-0.2520583, 1.083572, 0.8068218, 0, 0, 1, 1, 1,
-0.2418584, 0.4909104, -0.7778096, 1, 0, 0, 1, 1,
-0.2409573, 0.3831314, -2.168715, 1, 0, 0, 1, 1,
-0.2400386, 0.8127413, -0.8142183, 1, 0, 0, 1, 1,
-0.2339748, -0.8280265, -1.90362, 1, 0, 0, 1, 1,
-0.2326013, 0.5990536, -1.705484, 1, 0, 0, 1, 1,
-0.2285269, 1.220155, -0.02702249, 0, 0, 0, 1, 1,
-0.2271503, -0.05868725, -1.402331, 0, 0, 0, 1, 1,
-0.2178585, 1.576816, -1.357026, 0, 0, 0, 1, 1,
-0.2170079, 1.110919, 0.627156, 0, 0, 0, 1, 1,
-0.2158117, 0.200461, -0.06771413, 0, 0, 0, 1, 1,
-0.2147449, -0.8010444, -2.804758, 0, 0, 0, 1, 1,
-0.2124346, 0.6267378, -0.3918546, 0, 0, 0, 1, 1,
-0.2121278, -1.671343, -4.371549, 1, 1, 1, 1, 1,
-0.210618, -0.8049307, -3.087272, 1, 1, 1, 1, 1,
-0.2098059, -0.1012888, -0.4309976, 1, 1, 1, 1, 1,
-0.2069473, -0.3369305, -2.552016, 1, 1, 1, 1, 1,
-0.1968495, -0.5383708, -3.002679, 1, 1, 1, 1, 1,
-0.1921202, -0.4744781, -3.390848, 1, 1, 1, 1, 1,
-0.1896526, -1.448954, -2.942295, 1, 1, 1, 1, 1,
-0.1888724, -0.6906633, -1.52505, 1, 1, 1, 1, 1,
-0.1804301, 0.435735, -0.5261801, 1, 1, 1, 1, 1,
-0.1773755, 0.5080851, -0.8121264, 1, 1, 1, 1, 1,
-0.1764751, -1.022061, -2.152841, 1, 1, 1, 1, 1,
-0.1742243, 0.07302079, -1.922007, 1, 1, 1, 1, 1,
-0.1740909, -1.247031, -4.871063, 1, 1, 1, 1, 1,
-0.1691426, 1.393224, -1.132357, 1, 1, 1, 1, 1,
-0.1678025, -0.2919805, -3.074118, 1, 1, 1, 1, 1,
-0.1643626, 1.210959, -1.054813, 0, 0, 1, 1, 1,
-0.1619308, 0.9921856, 0.02171952, 1, 0, 0, 1, 1,
-0.1602846, 1.301549, 0.06057056, 1, 0, 0, 1, 1,
-0.1598128, 0.02988591, 0.5852373, 1, 0, 0, 1, 1,
-0.1581829, -0.9616622, -2.641274, 1, 0, 0, 1, 1,
-0.1578588, -0.4846747, -0.7396271, 1, 0, 0, 1, 1,
-0.1575537, -0.06150927, -2.744458, 0, 0, 0, 1, 1,
-0.1569199, -1.623872, -3.992407, 0, 0, 0, 1, 1,
-0.1562909, -0.6405529, -4.203923, 0, 0, 0, 1, 1,
-0.1553523, -1.704672, -1.416296, 0, 0, 0, 1, 1,
-0.1544324, 0.9954094, 0.6808647, 0, 0, 0, 1, 1,
-0.1529017, 1.038911, 1.013086, 0, 0, 0, 1, 1,
-0.1521928, 0.7285993, -0.3398745, 0, 0, 0, 1, 1,
-0.1520324, -0.7688388, -1.978801, 1, 1, 1, 1, 1,
-0.1486634, 1.570486, 0.242799, 1, 1, 1, 1, 1,
-0.1391681, 0.6320637, -0.5460995, 1, 1, 1, 1, 1,
-0.1384684, -0.2463861, -2.876871, 1, 1, 1, 1, 1,
-0.136973, 0.3625323, -1.870673, 1, 1, 1, 1, 1,
-0.1324011, 0.3668893, -0.07632878, 1, 1, 1, 1, 1,
-0.1305524, 0.5594893, -0.1717786, 1, 1, 1, 1, 1,
-0.1275213, 0.4142859, -0.7426172, 1, 1, 1, 1, 1,
-0.1254956, -0.5352512, -2.961183, 1, 1, 1, 1, 1,
-0.1253594, -0.5666518, -4.444183, 1, 1, 1, 1, 1,
-0.1232077, -0.9157715, -2.520525, 1, 1, 1, 1, 1,
-0.1224515, -1.007742, -3.278729, 1, 1, 1, 1, 1,
-0.1157628, 0.3014646, -0.5602551, 1, 1, 1, 1, 1,
-0.1144297, -1.053176, -2.564798, 1, 1, 1, 1, 1,
-0.1126946, 0.02499423, 0.5076363, 1, 1, 1, 1, 1,
-0.112653, -1.220555, -2.959564, 0, 0, 1, 1, 1,
-0.1113303, -0.6348527, -2.935289, 1, 0, 0, 1, 1,
-0.1092825, 1.844802, -0.2325174, 1, 0, 0, 1, 1,
-0.108677, -0.4429502, -3.254217, 1, 0, 0, 1, 1,
-0.1084135, -1.214425, -4.329824, 1, 0, 0, 1, 1,
-0.1071233, 0.1555661, -0.2702252, 1, 0, 0, 1, 1,
-0.1053749, 1.972525, -1.159446, 0, 0, 0, 1, 1,
-0.09755787, -1.008641, -2.746209, 0, 0, 0, 1, 1,
-0.09482899, -1.235766, -2.773566, 0, 0, 0, 1, 1,
-0.08695757, -0.6310919, -1.916766, 0, 0, 0, 1, 1,
-0.08541632, 0.7463298, -0.2973113, 0, 0, 0, 1, 1,
-0.08424927, -1.484357, -1.907009, 0, 0, 0, 1, 1,
-0.07802835, -0.09208002, -2.410796, 0, 0, 0, 1, 1,
-0.07725932, -1.056166, -3.184636, 1, 1, 1, 1, 1,
-0.07419427, 0.3891846, -0.4871238, 1, 1, 1, 1, 1,
-0.07230283, 0.1742477, -1.639199, 1, 1, 1, 1, 1,
-0.0692146, -0.1894632, -2.488447, 1, 1, 1, 1, 1,
-0.06845699, -0.4492891, -1.68586, 1, 1, 1, 1, 1,
-0.06741413, -0.6983523, -2.761972, 1, 1, 1, 1, 1,
-0.0672894, 1.601398, -0.5985249, 1, 1, 1, 1, 1,
-0.06652529, -0.3675952, -4.663369, 1, 1, 1, 1, 1,
-0.06530721, 0.3653855, 2.085749, 1, 1, 1, 1, 1,
-0.06469683, -0.5212684, -2.012093, 1, 1, 1, 1, 1,
-0.06436854, 0.8322777, 0.6623329, 1, 1, 1, 1, 1,
-0.06413861, -0.6347017, -3.714932, 1, 1, 1, 1, 1,
-0.06311979, 0.848709, -0.6147146, 1, 1, 1, 1, 1,
-0.0568888, -0.002243519, -2.183684, 1, 1, 1, 1, 1,
-0.05027342, -0.6662003, -3.492578, 1, 1, 1, 1, 1,
-0.04538726, 1.543041, 0.455934, 0, 0, 1, 1, 1,
-0.04524452, 1.586952, -1.497597, 1, 0, 0, 1, 1,
-0.03839366, 0.3392102, 0.1525666, 1, 0, 0, 1, 1,
-0.03423924, 0.04261864, 1.632144, 1, 0, 0, 1, 1,
-0.02908855, 0.6819986, -1.366904, 1, 0, 0, 1, 1,
-0.02638714, 0.1407344, -0.1577964, 1, 0, 0, 1, 1,
-0.02529481, -0.2544632, -4.372922, 0, 0, 0, 1, 1,
-0.0230986, -0.1348485, -3.695589, 0, 0, 0, 1, 1,
-0.01929212, -0.1608365, -4.056885, 0, 0, 0, 1, 1,
-0.01488476, -0.9280418, -3.034185, 0, 0, 0, 1, 1,
-0.01395898, -0.096469, -2.398697, 0, 0, 0, 1, 1,
-0.01354357, 0.7373675, 0.2256568, 0, 0, 0, 1, 1,
-0.01129928, -1.542438, -3.784762, 0, 0, 0, 1, 1,
-0.008015626, 0.8623501, -2.090315, 1, 1, 1, 1, 1,
-0.005781471, 1.148053, 1.294338, 1, 1, 1, 1, 1,
-0.004360252, -0.6030412, -2.181216, 1, 1, 1, 1, 1,
-0.002829233, 0.9463528, 0.05932119, 1, 1, 1, 1, 1,
-0.002027365, -0.4983856, -4.19903, 1, 1, 1, 1, 1,
-0.0005882165, 1.205117, -0.6970195, 1, 1, 1, 1, 1,
-0.0005865819, 1.038915, -0.1013508, 1, 1, 1, 1, 1,
0.003411998, 0.2641472, -1.132807, 1, 1, 1, 1, 1,
0.006051638, -0.7333698, 3.429358, 1, 1, 1, 1, 1,
0.006623933, -1.312439, 4.264016, 1, 1, 1, 1, 1,
0.009331979, -0.6169021, 2.786263, 1, 1, 1, 1, 1,
0.01845716, -0.7454683, 3.377266, 1, 1, 1, 1, 1,
0.02043481, 0.2037501, 1.38864, 1, 1, 1, 1, 1,
0.02145247, -0.1220428, 4.403472, 1, 1, 1, 1, 1,
0.03104054, -0.4071532, 2.642295, 1, 1, 1, 1, 1,
0.0336066, -1.552137, 3.772754, 0, 0, 1, 1, 1,
0.03980538, -0.4376328, 2.117959, 1, 0, 0, 1, 1,
0.0412605, 0.4314227, -0.1686358, 1, 0, 0, 1, 1,
0.04232603, -1.369393, 3.339207, 1, 0, 0, 1, 1,
0.05482075, -0.3286308, 2.993188, 1, 0, 0, 1, 1,
0.06319158, 0.8170543, -0.300609, 1, 0, 0, 1, 1,
0.06820343, 0.6437922, -1.005935, 0, 0, 0, 1, 1,
0.06942473, 0.1952902, 0.3154431, 0, 0, 0, 1, 1,
0.07076839, 0.4272502, 0.6443262, 0, 0, 0, 1, 1,
0.07240376, 0.1385938, 1.684689, 0, 0, 0, 1, 1,
0.07330649, -0.3843452, 3.382519, 0, 0, 0, 1, 1,
0.07988061, 1.092264, 1.602662, 0, 0, 0, 1, 1,
0.08126394, -2.759697, 2.07483, 0, 0, 0, 1, 1,
0.08877191, -0.08247664, 2.289718, 1, 1, 1, 1, 1,
0.08928419, 0.3503326, 0.3394306, 1, 1, 1, 1, 1,
0.09148071, 1.262035, 1.16525, 1, 1, 1, 1, 1,
0.1005807, 0.3550528, -0.888566, 1, 1, 1, 1, 1,
0.1022861, -0.9997478, 2.970193, 1, 1, 1, 1, 1,
0.1065043, 2.451075, -0.1933392, 1, 1, 1, 1, 1,
0.1087398, -1.070524, 2.355587, 1, 1, 1, 1, 1,
0.1100324, 0.9519958, 1.111773, 1, 1, 1, 1, 1,
0.1111059, 0.498648, -0.4070847, 1, 1, 1, 1, 1,
0.1158575, 0.8603753, 0.212319, 1, 1, 1, 1, 1,
0.1170558, -0.09084202, 2.979692, 1, 1, 1, 1, 1,
0.1277225, -0.8540235, 3.632643, 1, 1, 1, 1, 1,
0.1301527, 1.228979, 0.7265698, 1, 1, 1, 1, 1,
0.1387442, -0.4107614, 1.985438, 1, 1, 1, 1, 1,
0.1406946, 0.3452219, 2.182809, 1, 1, 1, 1, 1,
0.1453569, -0.3498752, 4.32378, 0, 0, 1, 1, 1,
0.145582, 0.3315814, 0.7226372, 1, 0, 0, 1, 1,
0.1464354, 0.8304341, -2.401898, 1, 0, 0, 1, 1,
0.147947, 0.813747, 1.091907, 1, 0, 0, 1, 1,
0.1493425, -2.61295, 3.702749, 1, 0, 0, 1, 1,
0.1585201, 1.811857, 1.164094, 1, 0, 0, 1, 1,
0.1638666, -0.3155943, 4.208345, 0, 0, 0, 1, 1,
0.1641367, 1.159882, 0.2680931, 0, 0, 0, 1, 1,
0.1661259, -0.05160846, 1.739921, 0, 0, 0, 1, 1,
0.1691102, -1.793961, 3.057535, 0, 0, 0, 1, 1,
0.1699973, 0.351041, 2.126868, 0, 0, 0, 1, 1,
0.1704954, 0.3697183, 0.07196965, 0, 0, 0, 1, 1,
0.171699, -0.1811526, 1.269045, 0, 0, 0, 1, 1,
0.1733687, 0.8810284, 2.445876, 1, 1, 1, 1, 1,
0.1741188, 0.8796001, -0.9819727, 1, 1, 1, 1, 1,
0.1745401, -0.4405697, 3.501707, 1, 1, 1, 1, 1,
0.175466, -1.889196, 1.611584, 1, 1, 1, 1, 1,
0.1805189, -1.530429, 3.07851, 1, 1, 1, 1, 1,
0.1865649, -0.9701562, 2.23904, 1, 1, 1, 1, 1,
0.1872723, 0.996582, 0.9067864, 1, 1, 1, 1, 1,
0.188862, 1.689692, 0.1754671, 1, 1, 1, 1, 1,
0.1892944, 0.9160795, 0.6445661, 1, 1, 1, 1, 1,
0.1917892, 1.974298, 1.588591, 1, 1, 1, 1, 1,
0.1930005, -0.1239467, 0.5831792, 1, 1, 1, 1, 1,
0.1942907, 1.900233, 0.1517302, 1, 1, 1, 1, 1,
0.1956532, 0.5940216, -0.4321506, 1, 1, 1, 1, 1,
0.1958142, -0.1018201, 2.13273, 1, 1, 1, 1, 1,
0.1973559, -0.6114863, 0.8274263, 1, 1, 1, 1, 1,
0.1981283, -0.9960746, 3.857433, 0, 0, 1, 1, 1,
0.1996555, -0.3892476, 1.821094, 1, 0, 0, 1, 1,
0.2020914, 0.4122928, 0.6410489, 1, 0, 0, 1, 1,
0.203285, -1.771583, 1.420679, 1, 0, 0, 1, 1,
0.2062292, 0.5689927, -0.8187543, 1, 0, 0, 1, 1,
0.2103745, 0.6176441, -0.2066375, 1, 0, 0, 1, 1,
0.2118949, -1.280028, 3.142501, 0, 0, 0, 1, 1,
0.2146084, -1.027868, 0.8934658, 0, 0, 0, 1, 1,
0.2218638, -1.658243, 3.684252, 0, 0, 0, 1, 1,
0.2313287, -0.4670293, 3.065181, 0, 0, 0, 1, 1,
0.2346156, -0.5166411, 3.406147, 0, 0, 0, 1, 1,
0.2382113, -0.7930033, 1.037425, 0, 0, 0, 1, 1,
0.2400962, -0.2475156, 2.120222, 0, 0, 0, 1, 1,
0.2402858, 0.5863971, -0.2886105, 1, 1, 1, 1, 1,
0.2413275, 1.279631, -1.442843, 1, 1, 1, 1, 1,
0.2507395, 2.223799, -0.1829742, 1, 1, 1, 1, 1,
0.2522427, -0.6567701, 1.936725, 1, 1, 1, 1, 1,
0.25261, -0.6810966, 2.122558, 1, 1, 1, 1, 1,
0.2536989, -1.715508, 3.290547, 1, 1, 1, 1, 1,
0.2544427, 1.238875, 0.06451398, 1, 1, 1, 1, 1,
0.2547954, -0.4599941, 2.028715, 1, 1, 1, 1, 1,
0.2607418, 1.612823, 1.32126, 1, 1, 1, 1, 1,
0.2619603, -0.2596284, 2.418651, 1, 1, 1, 1, 1,
0.2652088, -1.045228, 2.432403, 1, 1, 1, 1, 1,
0.2736402, -0.7968588, 2.457606, 1, 1, 1, 1, 1,
0.2758226, 0.3296451, 0.983481, 1, 1, 1, 1, 1,
0.2762886, 0.1489205, 1.956396, 1, 1, 1, 1, 1,
0.286426, 2.235825, 0.8105333, 1, 1, 1, 1, 1,
0.2882586, 0.2372181, 0.8054225, 0, 0, 1, 1, 1,
0.2932356, 1.035859, -0.5906566, 1, 0, 0, 1, 1,
0.300294, -0.4715879, 2.230974, 1, 0, 0, 1, 1,
0.3088133, 0.3491635, 0.5840459, 1, 0, 0, 1, 1,
0.3114853, -0.2890943, 2.966781, 1, 0, 0, 1, 1,
0.31158, -0.979128, 3.094832, 1, 0, 0, 1, 1,
0.3171893, 2.036975, 0.9903242, 0, 0, 0, 1, 1,
0.3203489, -1.919486, 5.598496, 0, 0, 0, 1, 1,
0.3207147, 0.02212215, -0.6625262, 0, 0, 0, 1, 1,
0.3223025, -2.171962, 3.842397, 0, 0, 0, 1, 1,
0.3229254, 0.4627999, 0.8181141, 0, 0, 0, 1, 1,
0.3332168, 0.568175, 0.5504768, 0, 0, 0, 1, 1,
0.3361106, -1.214842, 5.185283, 0, 0, 0, 1, 1,
0.3378803, -0.415701, 3.143768, 1, 1, 1, 1, 1,
0.3379451, -0.4525211, 1.084167, 1, 1, 1, 1, 1,
0.3385812, -0.7770368, 1.422298, 1, 1, 1, 1, 1,
0.3408463, -0.3420748, 4.446758, 1, 1, 1, 1, 1,
0.3419378, 1.109633, 2.391739, 1, 1, 1, 1, 1,
0.3432248, 1.431818, -0.7732953, 1, 1, 1, 1, 1,
0.3451176, 0.3865012, 1.385172, 1, 1, 1, 1, 1,
0.3471313, -0.2290025, 1.784503, 1, 1, 1, 1, 1,
0.3485846, -0.6429715, 2.11839, 1, 1, 1, 1, 1,
0.3575214, -0.2571853, 2.225081, 1, 1, 1, 1, 1,
0.3591161, 0.5663767, -0.1844942, 1, 1, 1, 1, 1,
0.3674954, -1.001455, 3.037119, 1, 1, 1, 1, 1,
0.3676547, 0.8693144, 1.121643, 1, 1, 1, 1, 1,
0.3694475, 1.379928, 2.283061, 1, 1, 1, 1, 1,
0.3758634, 0.3486929, 0.5155979, 1, 1, 1, 1, 1,
0.3777774, -0.5034695, 3.543704, 0, 0, 1, 1, 1,
0.3782532, -0.7941946, 2.095413, 1, 0, 0, 1, 1,
0.3784126, -1.487559, 2.469147, 1, 0, 0, 1, 1,
0.388858, -1.293151, 2.291272, 1, 0, 0, 1, 1,
0.3904596, 0.4087342, -0.4113325, 1, 0, 0, 1, 1,
0.3920101, -0.01379057, 3.130937, 1, 0, 0, 1, 1,
0.3934519, -1.509039, 3.012678, 0, 0, 0, 1, 1,
0.3960076, 0.03669995, 2.352202, 0, 0, 0, 1, 1,
0.3965741, 1.143383, 1.957395, 0, 0, 0, 1, 1,
0.396796, -0.1562506, 1.638491, 0, 0, 0, 1, 1,
0.4002868, 0.4812199, 2.009826, 0, 0, 0, 1, 1,
0.4057247, 1.299363, -0.1142415, 0, 0, 0, 1, 1,
0.4065611, 1.553489, 1.15577, 0, 0, 0, 1, 1,
0.4093229, 0.314528, 0.7953469, 1, 1, 1, 1, 1,
0.4100112, -0.9638638, 1.103569, 1, 1, 1, 1, 1,
0.4104069, -0.4496727, 2.032394, 1, 1, 1, 1, 1,
0.4124156, -1.809756, 1.910583, 1, 1, 1, 1, 1,
0.4182367, 0.2388944, 1.35514, 1, 1, 1, 1, 1,
0.4183574, -0.9490369, 3.276603, 1, 1, 1, 1, 1,
0.4193902, -0.2034774, 2.921788, 1, 1, 1, 1, 1,
0.4209919, -0.4453767, 3.847056, 1, 1, 1, 1, 1,
0.4244262, -0.7127246, 3.509418, 1, 1, 1, 1, 1,
0.4266903, 1.191708, 2.013234, 1, 1, 1, 1, 1,
0.4289344, 0.5753147, -0.312674, 1, 1, 1, 1, 1,
0.4291256, -0.3484425, 1.319808, 1, 1, 1, 1, 1,
0.4312431, -1.828458, 4.326913, 1, 1, 1, 1, 1,
0.431892, -0.4946087, 3.501827, 1, 1, 1, 1, 1,
0.4320532, 0.3448395, 2.64723, 1, 1, 1, 1, 1,
0.4329866, -0.259524, 3.263409, 0, 0, 1, 1, 1,
0.4334508, -1.04134, 3.508426, 1, 0, 0, 1, 1,
0.4336283, 2.364824, 1.208733, 1, 0, 0, 1, 1,
0.4337289, -0.2575405, 1.990486, 1, 0, 0, 1, 1,
0.4342479, -0.4421065, 2.580916, 1, 0, 0, 1, 1,
0.4376921, -2.67442, 1.731585, 1, 0, 0, 1, 1,
0.4391611, 0.942769, 0.4834428, 0, 0, 0, 1, 1,
0.4458749, 0.7968453, -1.001222, 0, 0, 0, 1, 1,
0.4599027, -0.4311786, -0.4361549, 0, 0, 0, 1, 1,
0.4610158, 0.08672617, 1.318763, 0, 0, 0, 1, 1,
0.4669846, 0.3152802, 0.08533331, 0, 0, 0, 1, 1,
0.4709824, 0.6892522, 1.222544, 0, 0, 0, 1, 1,
0.4720887, -1.216205, 2.222043, 0, 0, 0, 1, 1,
0.4736624, -0.5531899, 3.252853, 1, 1, 1, 1, 1,
0.4757246, -0.1007181, 0.8488618, 1, 1, 1, 1, 1,
0.487522, 0.03060141, 3.093808, 1, 1, 1, 1, 1,
0.497427, 0.5743134, -0.534536, 1, 1, 1, 1, 1,
0.497543, -2.018814, 2.495286, 1, 1, 1, 1, 1,
0.5050123, 1.018199, -0.07455879, 1, 1, 1, 1, 1,
0.5068508, -0.4458874, 2.573801, 1, 1, 1, 1, 1,
0.5098715, 0.9477641, 1.339466, 1, 1, 1, 1, 1,
0.5102791, -0.9369434, 3.490968, 1, 1, 1, 1, 1,
0.522244, -0.129819, 1.666218, 1, 1, 1, 1, 1,
0.5223792, -0.43508, 1.914601, 1, 1, 1, 1, 1,
0.5231347, 0.1060139, 1.599291, 1, 1, 1, 1, 1,
0.5245035, 2.4505, -0.9615197, 1, 1, 1, 1, 1,
0.524958, -0.3549644, 4.823624, 1, 1, 1, 1, 1,
0.5252403, -1.501425, 2.790922, 1, 1, 1, 1, 1,
0.5264155, -0.2309743, 2.131299, 0, 0, 1, 1, 1,
0.5410241, -2.14528, 2.305586, 1, 0, 0, 1, 1,
0.5414121, -0.9040192, 3.807667, 1, 0, 0, 1, 1,
0.547232, 0.5663753, -0.0210247, 1, 0, 0, 1, 1,
0.5510411, 1.585004, -0.04811838, 1, 0, 0, 1, 1,
0.5511479, 0.3719271, -1.14708, 1, 0, 0, 1, 1,
0.5514329, -0.856876, 3.719637, 0, 0, 0, 1, 1,
0.5538286, -0.2066349, 2.495807, 0, 0, 0, 1, 1,
0.5549027, 0.6852403, -0.3117545, 0, 0, 0, 1, 1,
0.5570711, -0.3105042, 3.059742, 0, 0, 0, 1, 1,
0.5573604, 1.401554, 0.3226374, 0, 0, 0, 1, 1,
0.5580717, -0.5749897, 2.376795, 0, 0, 0, 1, 1,
0.5642166, 1.704267, 0.6692603, 0, 0, 0, 1, 1,
0.5657781, 0.5007911, 1.006062, 1, 1, 1, 1, 1,
0.5766028, 0.8561437, 0.2861781, 1, 1, 1, 1, 1,
0.5824131, 0.5433658, 1.496215, 1, 1, 1, 1, 1,
0.5907404, -1.137101, 3.534868, 1, 1, 1, 1, 1,
0.6028414, -0.5343521, 1.926529, 1, 1, 1, 1, 1,
0.6099526, -1.197762, 1.23806, 1, 1, 1, 1, 1,
0.6190575, 1.201292, 0.05437711, 1, 1, 1, 1, 1,
0.6221655, 0.4255669, 1.089389, 1, 1, 1, 1, 1,
0.6241375, 1.27858, 0.7159746, 1, 1, 1, 1, 1,
0.6269256, -0.379942, 1.421578, 1, 1, 1, 1, 1,
0.6283894, 0.02316839, 2.042706, 1, 1, 1, 1, 1,
0.6298491, 0.5579677, -0.253608, 1, 1, 1, 1, 1,
0.632752, 1.531286, 1.907676, 1, 1, 1, 1, 1,
0.6328863, 0.9401605, 2.011932, 1, 1, 1, 1, 1,
0.637469, 0.8681368, -0.3797439, 1, 1, 1, 1, 1,
0.6487954, 0.7131608, 0.3473531, 0, 0, 1, 1, 1,
0.649201, 0.6560564, 0.17001, 1, 0, 0, 1, 1,
0.6521859, -0.6679662, 1.285621, 1, 0, 0, 1, 1,
0.6575387, 0.3317726, 1.192748, 1, 0, 0, 1, 1,
0.6585884, -0.3106775, 0.1605251, 1, 0, 0, 1, 1,
0.6599757, -0.8122296, 2.665909, 1, 0, 0, 1, 1,
0.6644067, 0.5628777, 2.773783, 0, 0, 0, 1, 1,
0.6677784, 0.2219423, 2.15464, 0, 0, 0, 1, 1,
0.6690949, 1.208944, 0.03942053, 0, 0, 0, 1, 1,
0.6717001, 0.8545815, -0.3684272, 0, 0, 0, 1, 1,
0.6733333, 1.015001, 0.6586406, 0, 0, 0, 1, 1,
0.6734365, -0.6928757, 0.6458119, 0, 0, 0, 1, 1,
0.6742651, 0.9062901, 2.783539, 0, 0, 0, 1, 1,
0.6836057, -1.988091, 0.7561494, 1, 1, 1, 1, 1,
0.6840652, -1.026713, 2.219379, 1, 1, 1, 1, 1,
0.6861559, 0.3049406, 0.8877487, 1, 1, 1, 1, 1,
0.6867887, -1.527525, 3.06525, 1, 1, 1, 1, 1,
0.6919391, 0.3999387, 1.865299, 1, 1, 1, 1, 1,
0.6938478, 0.5964185, 0.6320394, 1, 1, 1, 1, 1,
0.6957539, -0.7298149, 1.547165, 1, 1, 1, 1, 1,
0.6957846, -1.667649, 3.481119, 1, 1, 1, 1, 1,
0.6984028, 0.06673482, 0.00401572, 1, 1, 1, 1, 1,
0.6987877, 0.07666382, -0.1362299, 1, 1, 1, 1, 1,
0.7008934, 0.2500062, 2.094111, 1, 1, 1, 1, 1,
0.7016926, 0.1116068, 2.059695, 1, 1, 1, 1, 1,
0.7180458, 0.1054692, 0.23538, 1, 1, 1, 1, 1,
0.7294575, -1.173674, 0.5084841, 1, 1, 1, 1, 1,
0.7311895, -0.7336385, 3.978125, 1, 1, 1, 1, 1,
0.7328362, -0.3945287, 2.641979, 0, 0, 1, 1, 1,
0.7344009, -1.007914, 2.340129, 1, 0, 0, 1, 1,
0.7356147, -0.4900076, 2.735231, 1, 0, 0, 1, 1,
0.7379456, 1.343392, 1.70492, 1, 0, 0, 1, 1,
0.7483515, 0.0683377, 2.000395, 1, 0, 0, 1, 1,
0.7493643, -1.049402, 2.108048, 1, 0, 0, 1, 1,
0.7522152, -0.2364075, 1.6745, 0, 0, 0, 1, 1,
0.7533914, 1.24836, 2.301524, 0, 0, 0, 1, 1,
0.7547064, -0.3958741, 3.115357, 0, 0, 0, 1, 1,
0.755271, -1.637153, 2.840396, 0, 0, 0, 1, 1,
0.7602073, -0.4440424, 2.519753, 0, 0, 0, 1, 1,
0.7626843, -0.9281598, 3.631212, 0, 0, 0, 1, 1,
0.7698594, 1.550514, 0.08751445, 0, 0, 0, 1, 1,
0.7703331, -0.7498401, 2.139172, 1, 1, 1, 1, 1,
0.7704213, 2.030999, 1.904487, 1, 1, 1, 1, 1,
0.7704573, 1.358211, -0.04719856, 1, 1, 1, 1, 1,
0.7741777, 1.90049, 1.457228, 1, 1, 1, 1, 1,
0.7747644, -0.5402439, 2.648389, 1, 1, 1, 1, 1,
0.7766353, 0.3303952, 2.302229, 1, 1, 1, 1, 1,
0.7855769, -0.8997025, 3.084842, 1, 1, 1, 1, 1,
0.7889901, -0.05062138, 2.8192, 1, 1, 1, 1, 1,
0.7923011, -1.411562, 2.531322, 1, 1, 1, 1, 1,
0.7984461, -0.02551273, 1.767016, 1, 1, 1, 1, 1,
0.7998449, 0.4566378, 0.1030719, 1, 1, 1, 1, 1,
0.8001801, 0.9334701, 1.023373, 1, 1, 1, 1, 1,
0.8007023, -0.5437525, 1.534776, 1, 1, 1, 1, 1,
0.8050049, 1.637566, -0.9424204, 1, 1, 1, 1, 1,
0.8116013, 0.1392124, 1.643939, 1, 1, 1, 1, 1,
0.8168648, 2.114059, -1.215709, 0, 0, 1, 1, 1,
0.8182454, -0.9851857, 2.490915, 1, 0, 0, 1, 1,
0.8190172, -1.152065, 2.361792, 1, 0, 0, 1, 1,
0.820408, 0.8048239, 0.07495859, 1, 0, 0, 1, 1,
0.8238348, -0.122967, 3.293303, 1, 0, 0, 1, 1,
0.8240154, -0.2486873, 2.821482, 1, 0, 0, 1, 1,
0.8291191, -0.4446901, 1.329726, 0, 0, 0, 1, 1,
0.8316653, 0.2012136, 1.868075, 0, 0, 0, 1, 1,
0.8338262, 0.3533944, 2.620075, 0, 0, 0, 1, 1,
0.8400155, -0.2740457, 3.165766, 0, 0, 0, 1, 1,
0.841469, -0.001694882, -0.09016366, 0, 0, 0, 1, 1,
0.8511038, 1.332656, 0.6397987, 0, 0, 0, 1, 1,
0.8616939, 0.1052287, 2.346808, 0, 0, 0, 1, 1,
0.864656, -0.1816209, 2.711008, 1, 1, 1, 1, 1,
0.8683264, 0.4085777, 2.217349, 1, 1, 1, 1, 1,
0.8687435, -0.08712184, 0.1198971, 1, 1, 1, 1, 1,
0.8741143, 1.240124, -2.188027, 1, 1, 1, 1, 1,
0.8791026, -0.3801098, 1.6429, 1, 1, 1, 1, 1,
0.8804945, -0.6017697, 3.552844, 1, 1, 1, 1, 1,
0.8819799, -1.104122, 0.8085085, 1, 1, 1, 1, 1,
0.8910824, 0.07847939, -0.5282013, 1, 1, 1, 1, 1,
0.8964748, 0.2663015, 1.329163, 1, 1, 1, 1, 1,
0.8972142, -1.002293, 3.724813, 1, 1, 1, 1, 1,
0.8981356, -0.5112944, 1.516319, 1, 1, 1, 1, 1,
0.8982844, -0.3433058, 1.847638, 1, 1, 1, 1, 1,
0.9019147, -0.3321689, 0.9255453, 1, 1, 1, 1, 1,
0.9038681, 0.5509929, 0.3302816, 1, 1, 1, 1, 1,
0.9057639, -0.08398737, -1.11139, 1, 1, 1, 1, 1,
0.9143221, -0.2081606, 0.5888821, 0, 0, 1, 1, 1,
0.9153825, -0.9779661, 2.566614, 1, 0, 0, 1, 1,
0.9189003, -0.714288, 2.602866, 1, 0, 0, 1, 1,
0.9199318, 0.2293574, 1.816307, 1, 0, 0, 1, 1,
0.9253231, -0.929719, 3.022749, 1, 0, 0, 1, 1,
0.9254476, 0.3869012, 1.362257, 1, 0, 0, 1, 1,
0.9283099, -1.0533, 1.907616, 0, 0, 0, 1, 1,
0.9332282, 1.409121, 0.2830007, 0, 0, 0, 1, 1,
0.9350272, -1.610927, 2.438025, 0, 0, 0, 1, 1,
0.9355852, 0.6892321, 0.590816, 0, 0, 0, 1, 1,
0.9370655, -0.281787, 4.116183, 0, 0, 0, 1, 1,
0.9445375, 0.338897, 2.119336, 0, 0, 0, 1, 1,
0.9488661, -0.9960485, 0.5514535, 0, 0, 0, 1, 1,
0.9575654, 1.856364, 0.4147497, 1, 1, 1, 1, 1,
0.9617162, -0.3931217, 2.507007, 1, 1, 1, 1, 1,
0.9638687, -0.4185529, 2.795835, 1, 1, 1, 1, 1,
0.9675267, 0.200355, 0.01039368, 1, 1, 1, 1, 1,
0.976185, -0.5586677, 1.691577, 1, 1, 1, 1, 1,
0.9818776, -0.992151, 1.435449, 1, 1, 1, 1, 1,
0.9821896, -1.325788, 2.851463, 1, 1, 1, 1, 1,
0.9841085, 0.9098878, 1.282956, 1, 1, 1, 1, 1,
0.9875365, -1.382018, 2.825861, 1, 1, 1, 1, 1,
0.9901647, 1.3658, 1.622179, 1, 1, 1, 1, 1,
0.9922227, -0.241103, 1.223971, 1, 1, 1, 1, 1,
0.9924978, -0.5083042, 1.625645, 1, 1, 1, 1, 1,
0.9937741, 1.771647, 0.7072397, 1, 1, 1, 1, 1,
0.9938586, 2.56635, 1.285647, 1, 1, 1, 1, 1,
0.9968672, -0.3952031, 0.723657, 1, 1, 1, 1, 1,
0.9985992, 0.6351821, 1.392028, 0, 0, 1, 1, 1,
1.000218, 0.8855342, 1.861218, 1, 0, 0, 1, 1,
1.001609, -0.7779766, 2.874, 1, 0, 0, 1, 1,
1.006548, 0.3419111, 3.0881, 1, 0, 0, 1, 1,
1.006741, -1.458097, 4.28349, 1, 0, 0, 1, 1,
1.015749, 0.8662533, 1.443594, 1, 0, 0, 1, 1,
1.016062, -0.8306011, 2.08417, 0, 0, 0, 1, 1,
1.018914, 0.154762, 1.582355, 0, 0, 0, 1, 1,
1.019223, 1.132231, 0.0115835, 0, 0, 0, 1, 1,
1.025703, 0.09523772, 1.369643, 0, 0, 0, 1, 1,
1.03131, 0.2857843, 0.67035, 0, 0, 0, 1, 1,
1.032284, 1.830693, -0.8367833, 0, 0, 0, 1, 1,
1.03874, -0.4908762, 1.895719, 0, 0, 0, 1, 1,
1.03893, -0.05762927, 0.6307074, 1, 1, 1, 1, 1,
1.061369, -1.207068, 4.656801, 1, 1, 1, 1, 1,
1.06138, -0.3447542, 0.4832921, 1, 1, 1, 1, 1,
1.065046, -1.111179, 2.610541, 1, 1, 1, 1, 1,
1.07742, 0.3883214, 1.817054, 1, 1, 1, 1, 1,
1.077638, -0.8347201, 2.752799, 1, 1, 1, 1, 1,
1.080757, -1.60988, 2.271117, 1, 1, 1, 1, 1,
1.082135, -0.871098, 3.791183, 1, 1, 1, 1, 1,
1.084883, 0.5519271, -0.05988966, 1, 1, 1, 1, 1,
1.090471, 1.389115, 0.3133208, 1, 1, 1, 1, 1,
1.091013, 0.6093724, -0.3048081, 1, 1, 1, 1, 1,
1.102435, -1.330835, 2.005424, 1, 1, 1, 1, 1,
1.105216, 0.7451406, -0.0171186, 1, 1, 1, 1, 1,
1.112545, -0.02675375, 2.317361, 1, 1, 1, 1, 1,
1.115138, -0.5442016, -0.158038, 1, 1, 1, 1, 1,
1.115425, 0.4781955, 0.4634397, 0, 0, 1, 1, 1,
1.116199, -0.5548196, 1.887146, 1, 0, 0, 1, 1,
1.119002, 0.9566989, 0.1322586, 1, 0, 0, 1, 1,
1.121882, 0.8975722, 1.432664, 1, 0, 0, 1, 1,
1.123454, -2.589492, 4.56498, 1, 0, 0, 1, 1,
1.125779, -0.2745361, 2.044327, 1, 0, 0, 1, 1,
1.134049, -0.4554494, 1.126285, 0, 0, 0, 1, 1,
1.134713, 0.1988236, 1.949083, 0, 0, 0, 1, 1,
1.137927, -0.4122641, 0.4113526, 0, 0, 0, 1, 1,
1.141965, -0.7161757, 3.643578, 0, 0, 0, 1, 1,
1.159689, 1.449718, 0.2418768, 0, 0, 0, 1, 1,
1.164822, -1.286395, 2.369274, 0, 0, 0, 1, 1,
1.165535, -0.6244706, 2.00452, 0, 0, 0, 1, 1,
1.166918, 0.4366462, 0.9711587, 1, 1, 1, 1, 1,
1.170807, 0.8500041, 1.548592, 1, 1, 1, 1, 1,
1.171701, 0.0479716, 1.684518, 1, 1, 1, 1, 1,
1.179266, 0.7262239, 2.39554, 1, 1, 1, 1, 1,
1.182004, -0.4744009, 2.654164, 1, 1, 1, 1, 1,
1.183234, -0.7231048, 1.508625, 1, 1, 1, 1, 1,
1.192465, 0.07140338, 0.7518962, 1, 1, 1, 1, 1,
1.202795, -0.0232638, 2.166828, 1, 1, 1, 1, 1,
1.217717, -1.642669, 1.931311, 1, 1, 1, 1, 1,
1.225945, -0.7856047, 1.679164, 1, 1, 1, 1, 1,
1.231148, -0.7394907, 1.623923, 1, 1, 1, 1, 1,
1.234845, 0.2486742, 1.251913, 1, 1, 1, 1, 1,
1.239287, -1.055723, 1.602634, 1, 1, 1, 1, 1,
1.25221, 0.04678188, 3.033604, 1, 1, 1, 1, 1,
1.255546, 0.3791822, 1.469669, 1, 1, 1, 1, 1,
1.256245, 0.2344014, 1.248413, 0, 0, 1, 1, 1,
1.273852, -0.007211361, 1.453869, 1, 0, 0, 1, 1,
1.274711, 0.1392313, 0.3844199, 1, 0, 0, 1, 1,
1.275736, 0.1312799, 0.7436825, 1, 0, 0, 1, 1,
1.279815, 4.046844, -0.01639314, 1, 0, 0, 1, 1,
1.28155, 1.260208, 0.7963832, 1, 0, 0, 1, 1,
1.28525, 0.5705397, 0.6471192, 0, 0, 0, 1, 1,
1.292773, -0.4957555, 3.191524, 0, 0, 0, 1, 1,
1.294979, -0.2887315, 2.518834, 0, 0, 0, 1, 1,
1.301286, 0.6155994, 3.293422, 0, 0, 0, 1, 1,
1.310203, -0.03577767, 0.454619, 0, 0, 0, 1, 1,
1.317745, -0.8988121, 1.955663, 0, 0, 0, 1, 1,
1.319498, 0.9846096, 0.9367923, 0, 0, 0, 1, 1,
1.321193, -1.903007, 0.8427159, 1, 1, 1, 1, 1,
1.332068, 0.2345559, 0.2726212, 1, 1, 1, 1, 1,
1.334544, 1.96813, 0.1289043, 1, 1, 1, 1, 1,
1.338788, 1.013633, 1.551166, 1, 1, 1, 1, 1,
1.339827, -1.401077, 1.705238, 1, 1, 1, 1, 1,
1.366707, 0.4883175, 1.919147, 1, 1, 1, 1, 1,
1.375471, 1.955272, -0.5271591, 1, 1, 1, 1, 1,
1.378683, 0.8654507, 0.9612327, 1, 1, 1, 1, 1,
1.404969, -1.424113, 1.737283, 1, 1, 1, 1, 1,
1.406795, 0.4358295, 1.506813, 1, 1, 1, 1, 1,
1.407008, 0.9057707, -1.115355, 1, 1, 1, 1, 1,
1.410618, -0.7569526, 2.931089, 1, 1, 1, 1, 1,
1.410747, -1.079278, 0.5493602, 1, 1, 1, 1, 1,
1.413371, -0.3299137, 2.953916, 1, 1, 1, 1, 1,
1.414126, -0.4236668, 1.015106, 1, 1, 1, 1, 1,
1.420382, 0.850701, 0.2068225, 0, 0, 1, 1, 1,
1.43188, 1.621889, -0.3501429, 1, 0, 0, 1, 1,
1.436589, -0.1369092, 0.2121538, 1, 0, 0, 1, 1,
1.436857, 0.6850809, 0.514301, 1, 0, 0, 1, 1,
1.445977, -0.6625666, 2.548867, 1, 0, 0, 1, 1,
1.452342, -1.319591, 2.252456, 1, 0, 0, 1, 1,
1.463336, 0.4597075, 1.522429, 0, 0, 0, 1, 1,
1.470378, 0.2178164, 2.406047, 0, 0, 0, 1, 1,
1.473221, 0.8248525, 1.080885, 0, 0, 0, 1, 1,
1.476272, -0.1000995, 0.745225, 0, 0, 0, 1, 1,
1.478714, -0.0434612, 1.889623, 0, 0, 0, 1, 1,
1.486902, 0.6297912, 1.332805, 0, 0, 0, 1, 1,
1.507363, 0.1021539, 2.529131, 0, 0, 0, 1, 1,
1.530675, -0.05307857, 1.999648, 1, 1, 1, 1, 1,
1.565784, -1.147067, 2.209855, 1, 1, 1, 1, 1,
1.566021, 1.744583, 2.199561, 1, 1, 1, 1, 1,
1.590898, -0.1415994, 2.291342, 1, 1, 1, 1, 1,
1.598833, -0.5364209, -0.469103, 1, 1, 1, 1, 1,
1.608186, -1.795067, 1.038263, 1, 1, 1, 1, 1,
1.608416, -1.105897, 2.850679, 1, 1, 1, 1, 1,
1.612002, 1.669864, 0.3103329, 1, 1, 1, 1, 1,
1.624607, 0.1019558, 1.008654, 1, 1, 1, 1, 1,
1.633171, 0.2634823, 0.5670593, 1, 1, 1, 1, 1,
1.638276, 0.3140704, 0.9621192, 1, 1, 1, 1, 1,
1.652074, -0.7052946, 1.737456, 1, 1, 1, 1, 1,
1.659235, 0.7729214, 0.1806292, 1, 1, 1, 1, 1,
1.663511, -0.6351131, 4.496599, 1, 1, 1, 1, 1,
1.686745, 0.1954276, 0.980005, 1, 1, 1, 1, 1,
1.704958, -1.145742, 3.760603, 0, 0, 1, 1, 1,
1.705821, -0.03435557, 3.611114, 1, 0, 0, 1, 1,
1.710175, 1.465121, 0.8260927, 1, 0, 0, 1, 1,
1.746879, 0.5615085, 1.025248, 1, 0, 0, 1, 1,
1.759154, -1.250122, 1.568542, 1, 0, 0, 1, 1,
1.760686, -2.315665, 2.688558, 1, 0, 0, 1, 1,
1.77501, -0.6393141, 1.218117, 0, 0, 0, 1, 1,
1.777893, -0.6064104, 3.454223, 0, 0, 0, 1, 1,
1.793823, 0.7104708, 0.4660896, 0, 0, 0, 1, 1,
1.796727, 0.09366935, 2.868246, 0, 0, 0, 1, 1,
1.815152, 0.9666624, -0.0669901, 0, 0, 0, 1, 1,
1.85975, -0.3378556, 1.241516, 0, 0, 0, 1, 1,
1.867686, -0.01944335, 0.4930917, 0, 0, 0, 1, 1,
1.886513, 0.2734347, 0.7673353, 1, 1, 1, 1, 1,
1.89446, -0.2183122, 3.573661, 1, 1, 1, 1, 1,
1.89951, -1.663063, 1.482477, 1, 1, 1, 1, 1,
1.923016, 0.1333002, -0.6077778, 1, 1, 1, 1, 1,
1.925708, 0.1145817, 2.214731, 1, 1, 1, 1, 1,
1.930788, -2.440382, 2.646966, 1, 1, 1, 1, 1,
1.938132, -1.253816, 1.66262, 1, 1, 1, 1, 1,
1.948412, 2.020085, 0.2275305, 1, 1, 1, 1, 1,
1.948856, -0.1619737, 2.49665, 1, 1, 1, 1, 1,
1.97016, -1.375875, 2.827297, 1, 1, 1, 1, 1,
1.97184, 0.3299205, 0.206932, 1, 1, 1, 1, 1,
1.975188, -0.3892103, 2.969338, 1, 1, 1, 1, 1,
1.996239, 1.555144, 1.428194, 1, 1, 1, 1, 1,
2.031799, 0.6000306, 2.193975, 1, 1, 1, 1, 1,
2.053288, -0.314262, 1.618526, 1, 1, 1, 1, 1,
2.058836, -0.8856622, 1.116118, 0, 0, 1, 1, 1,
2.10757, 0.6750603, 0.1674701, 1, 0, 0, 1, 1,
2.127886, -0.706458, 1.382235, 1, 0, 0, 1, 1,
2.147392, -1.390604, 3.626643, 1, 0, 0, 1, 1,
2.178584, -0.148557, 1.158368, 1, 0, 0, 1, 1,
2.195789, -0.4792699, 1.182913, 1, 0, 0, 1, 1,
2.219958, -2.101709, 3.545049, 0, 0, 0, 1, 1,
2.22926, 1.832412, 1.605533, 0, 0, 0, 1, 1,
2.256152, -1.245988, 1.367627, 0, 0, 0, 1, 1,
2.264449, 1.271519, 1.105065, 0, 0, 0, 1, 1,
2.28668, -0.61732, 2.215081, 0, 0, 0, 1, 1,
2.434179, 1.301183, 1.011139, 0, 0, 0, 1, 1,
2.489883, 0.03657499, 0.2343709, 0, 0, 0, 1, 1,
2.4902, 0.003411374, 1.242096, 1, 1, 1, 1, 1,
2.658409, 0.4963454, 0.02238685, 1, 1, 1, 1, 1,
2.693914, -0.7834171, 1.404586, 1, 1, 1, 1, 1,
2.78577, 0.968554, 1.210504, 1, 1, 1, 1, 1,
2.85751, 0.7789506, 2.813934, 1, 1, 1, 1, 1,
3.183903, -0.8202305, 1.923007, 1, 1, 1, 1, 1,
3.247919, -0.2516886, 2.080478, 1, 1, 1, 1, 1
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
var radius = 9.680172;
var distance = 34.00119;
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
mvMatrix.translate( 0.04928017, -0.5630561, -0.3637168 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.00119);
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
